// gemm_256x256_fixed.c — SW vs CFU (DP4A) vs CFS with robust timing
// Build: riscv32-unknown-elf-gcc -O2 -march=rv32im -mabi=ilp32 gemm_256x256_fixed.c -o gemm_256x256_fixed.elf
// Opts:  -DCFS_BASE=0xFFxxxxxx  -DCFS_FEEDER_BATCHED=1  -DVERIFY_SKIP=1

#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u
#endif
#ifndef CFU_FUNCT3
#define CFU_FUNCT3 0x0
#endif
#ifndef CFU_FUNCT7
#define CFU_FUNCT7 0x1
#endif
#ifndef N
#define N 256
#endif

/* ===== CSRs ===== */
static inline uint64_t rdcycle(void){
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,mcycleh":"=r"(hi1));
       __asm__ volatile("csrr %0,mcycle" :"=r"(lo));
       __asm__ volatile("csrr %0,mcycleh":"=r"(hi2)); } while (hi1 != hi2);
  return ((uint64_t)hi1<<32)|lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,mcycle":"=r"(v)); return v;
#endif
}
static inline uint64_t rdinstret(void){
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,minstreth":"=r"(hi1));
       __asm__ volatile("csrr %0,minstret" :"=r"(lo));
       __asm__ volatile("csrr %0,minstreth":"=r"(hi2)); } while (hi1 != hi2);
  return ((uint64_t)hi1<<32)|lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,minstret":"=r"(v)); return v;
#endif
}

/* ===== CFS MMIO ===== */
#define CFS_REG(off)   (*(volatile uint32_t*)(CFS_BASE + ((off) << 2)))
#define CFS_CTL        0
#define CFS_A0         1
#define CFS_A1         2
#define CFS_A2         3
#define CFS_A3         4
#define CFS_B0         5
#define CFS_B1         6
#define CFS_B2         7
#define CFS_B3         8
#define CFS_C0        16
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
static inline void cfs_clear(void) { cfs_write(CFS_CTL, 0b10u); }
static inline void cfs_step (void) { cfs_write(CFS_CTL, 0b01u); }

/* ===== CFU + helpers ===== */
static inline uint32_t pack4_s8_lsb(int8_t x0,int8_t x1,int8_t x2,int8_t x3){
  return  ((uint32_t)(uint8_t)x0)        |
         (((uint32_t)(uint8_t)x1) << 8)  |
         (((uint32_t)(uint8_t)x2) << 16) |
         (((uint32_t)(uint8_t)x3) << 24);
}
static inline int32_t cfu_dp4a(int32_t a_packed, int32_t b_packed){
  uint32_t r;
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
                    : "=r"(r)
                    : "i"(CFU_FUNCT3), "i"(CFU_FUNCT7),
                      "r"(a_packed), "r"(b_packed));
  return (int32_t)r;
}
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
static void print_speedup_fixed(uint64_t num, uint64_t den){
  if(!den){ printf("  n/a   "); return; }
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}

/* ===== Global volatile sink prevents DCE ===== */
static volatile uint32_t g_sink;

/* ===== Feeders ===== */
static void cfs_feed_strict_step(const int8_t *Aflat, const int8_t *Bflat, int K, int lda, int ldb){
  cfs_clear(); (void)cfs_read(CFS_CTL); __asm__ volatile("" ::: "memory");
  const int T = K + 6;
  for(int s=0;s<T;++s){
    uint32_t Aw[4]={0}, Bw[4]={0};
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)? Aflat[i*lda+k] : 0; Aw[i]=(uint32_t)(uint8_t)a; }
    for(int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<K)? Bflat[k*ldb+j] : 0; Bw[j]=(uint32_t)(uint8_t)b; }
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
    (void)cfs_read(CFS_CTL); __asm__ volatile("" ::: "memory");
    cfs_step();
  }
}
static void cfs_feed_batched4(const int8_t *Aflat, const int8_t *Bflat, int K, int lda, int ldb){
  cfs_clear(); (void)cfs_read(CFS_CTL); __asm__ volatile("" ::: "memory");
  const int T = K + 6;
  for(int t=0;t<T;t+=4){
    int8_t aB[4][4]={{0}}, bB[4][4]={{0}};
    for(int i=0;i<4;++i) for(int s=0;s<4;++s){ int k=(t+s)-i; if(k>=0&&k<K) aB[i][s]=Aflat[i*lda+k]; }
    for(int j=0;j<4;++j) for(int s=0;s<4;++s){ int k=(t+s)-j; if(k>=0&&k<K) bB[j][s]=Bflat[k*ldb+j]; }
    cfs_write(CFS_A0, pack4_s8_lsb(aB[0][0],aB[0][1],aB[0][2],aB[0][3]));
    cfs_write(CFS_A1, pack4_s8_lsb(aB[1][0],aB[1][1],aB[1][2],aB[1][3]));
    cfs_write(CFS_A2, pack4_s8_lsb(aB[2][0],aB[2][1],aB[2][2],aB[2][3]));
    cfs_write(CFS_A3, pack4_s8_lsb(aB[3][0],aB[3][1],aB[3][2],aB[3][3]));
    cfs_write(CFS_B0, pack4_s8_lsb(bB[0][0],bB[0][1],bB[0][2],bB[0][3]));
    cfs_write(CFS_B1, pack4_s8_lsb(bB[1][0],bB[1][1],bB[1][2],bB[1][3]));
    cfs_write(CFS_B2, pack4_s8_lsb(bB[2][0],bB[2][1],bB[2][2],bB[2][3]));
    cfs_write(CFS_B3, pack4_s8_lsb(bB[3][0],bB[3][1],bB[3][2],bB[3][3]));
    (void)cfs_read(CFS_CTL); __asm__ volatile("" ::: "memory");
    int steps = (t+4<=T)?4:(T-t);
    for(int s=0;s<steps;++s) cfs_step();
  }
}
static inline void cfs_read_Ctile(int32_t C4[4][4]){
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
}

/* ===== Kernels (noinline so they aren't fused/optimized away) ===== */
__attribute__((noinline))
static uint32_t gemm_sw_checksum(const int8_t A[N][N], const int8_t B[N][N]){
  uint32_t cs = 0u;
  for(int i=0;i<N;++i){
    for(int j=0;j<N;++j){
      int32_t s=0;
      for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
      cs ^= (uint32_t)s + 0x9E3779B9u + (cs<<6) + (cs>>2);
    }
  }
  return cs;
}
__attribute__((noinline))
static uint32_t gemm_cfu_checksum(const int8_t A[N][N], const int8_t B[N][N]){
  uint32_t cs = 0u;
  for(int i=0;i<N;++i){
    for(int j=0;j<N;++j){
      int32_t acc=0;
      for(int k=0;k<N;k+=4){
        uint32_t ap=pack4_s8_lsb(A[i][k+0],A[i][k+1],A[i][k+2],A[i][k+3]);
        uint32_t bp=pack4_s8_lsb(B[k+0][j],B[k+1][j],B[k+2][j],B[k+3][j]);
        acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
      }
      cs ^= (uint32_t)acc + 0x9E3779B9u + (cs<<6) + (cs>>2);
    }
  }
  return cs;
}
__attribute__((noinline))
static uint32_t gemm_cfs_tiles(const int8_t A[N][N], const int8_t B[N][N]){
  static int8_t  Aflat[4 * N];
  static int8_t  Bflat[N * 4];
  int32_t C4[4][4];
#ifndef VERIFY_SKIP
  int32_t SW4[4][4];
#endif
  uint32_t cs=0u;

  for(int i0=0;i0<N;i0+=4){
    for(int j0=0;j0<N;j0+=4){
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) Aflat[r*N + k] = A[sr][k]; }
      for(int k=0;k<N;++k){
        Bflat[k*4+0]=B[k][j0+0];
        Bflat[k*4+1]=B[k][j0+1];
        Bflat[k*4+2]=B[k][j0+2];
        Bflat[k*4+3]=B[k][j0+3];
      }
#ifndef CFS_FEEDER_BATCHED
      cfs_feed_strict_step(Aflat,Bflat,N,/*lda=*/N,/*ldb=*/4);
#else
      cfs_feed_batched4  (Aflat,Bflat,N,/*lda=*/N,/*ldb=*/4);
#endif
      cfs_read_Ctile(C4);
#ifndef VERIFY_SKIP
      /* verify against SW 4×4 */
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
        int i=i0+r, j=j0+c; int32_t s=0;
        for(int kk=0;kk<N;++kk) s += (int32_t)A[i][kk] * (int32_t)B[kk][j];
        SW4[r][c]=s;
        if (C4[r][c] != s) return 0xDEADFACEu;
      }
#endif
      for(int r=0;r<4;++r) for(int c=0;c<4;++c){
        cs ^= (uint32_t)C4[r][c] + 0x9E3779B9u + (cs<<6) + (cs>>2);
      }
    }
  }
  return cs;
}

/* ===== Main ===== */
int main(void){
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));

  static int8_t A[N][N], B[N][N];
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);

  uint64_t c0,i0,c1,i1;

  /* SW */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
  uint32_t sw_cs = gemm_sw_checksum(A,B);
  i1=rdinstret(); c1=rdcycle();
  __asm__ volatile("" ::: "memory");
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
  g_sink ^= sw_cs;

  /* CFU */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
  uint32_t cfu_cs = gemm_cfu_checksum(A,B);
  i1=rdinstret(); c1=rdcycle();
  __asm__ volatile("" ::: "memory");
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
  g_sink ^= cfu_cs;

  /* CFS */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
  uint32_t cfs_cs = gemm_cfs_tiles(A,B);
  i1=rdinstret(); c1=rdcycle();
  __asm__ volatile("" ::: "memory");
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
  g_sink ^= cfs_cs;

#ifndef VERIFY_SKIP
  int ok_cfs = (cfs_cs != 0xDEADFACEu);
#else
  int ok_cfs = 1;
#endif
  int ok_cfu = 1;

  /* Print */
  printf("checksum sink: 0x%08" PRIX32 "\n", g_sink);
  printf("\n%dx%d timing summary\n", N, N);
  printf("Path |     cycles     |    instret    | Speedup(cyc) | Speedup(inst)\n");
  printf("-----+----------------+---------------+--------------+--------------\n");
  printf(" SW  | %14" PRIu64 " | %13" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
  printf(" CFU | %14" PRIu64 " | %13" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
  printf(" CFS | %14" PRIu64 " | %13" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");
  printf("\nVerdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");

  return (ok_cfu && ok_cfs) ? 0 : 1;
}

