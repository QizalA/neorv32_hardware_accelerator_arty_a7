// gemm_128x128_verify.c — SW vs CFU (DP4A) vs CFS for 128×128 int8 GEMM
// Adds strong verification + first-mismatch locator + tile dump for CFS.
//
// Defaults to strict per-step feeder with ACK barrier.
// Optional faster feeder: -DCFS_FEEDER_BATCHED=1
//
// Build:
//   riscv32-unknown-elf-gcc -O2 -march=rv32im -mabi=ilp32 gemm_128x128_verify.c -o gemm_128x128_verify.elf
//   # optional flags:
//   # -DCFS_BASE=0xFFxxxxxx
//   # -DCFS_FEEDER_BATCHED=1

#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

/* =======================
   Config
   ======================= */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u
#endif
#ifndef CFU_FUNCT3
#define CFU_FUNCT3 0x0     /* DP4A funct3 = 000 */
#endif
#ifndef CFU_FUNCT7
#define CFU_FUNCT7 0x1     /* DP4A funct7 = 0000001 */
#endif
#ifndef N
#define N 128
#endif

/* =======================
   CSRs (cycles & instret)
   ======================= */
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

/* =======================
   CFS MMIO
   ======================= */
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
#define CFS_C0        16  /* .. CFS_C15 = 31 */

static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
static inline void cfs_clear(void) { cfs_write(CFS_CTL, 0b10u); } /* bit1=CLEAR */
static inline void cfs_step (void) { cfs_write(CFS_CTL, 0b01u); } /* bit0=STEP  */

/* =======================
   Helpers / CFU
   ======================= */
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

/* Deterministic signed patterns */
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }

static void print_speedup_fixed(uint64_t num, uint64_t den){
  if(!den){ printf("  n/a   "); return; }
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}
static int cmp_NxN(const int32_t *A, const int32_t *B){
  for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1;
}

/* =======================
   CFS feeders
   ======================= */

/* Strict per-step feeder with ACK barrier (bulletproof) */
static void cfs_gemm_systolic_4xK_Kx4_strict_per_step(const int8_t *A_flat,
                                                      const int8_t *B_flat,
                                                      int K, int lda, int ldb) {
  cfs_clear();
  (void)cfs_read(CFS_CTL);            /* barrier after CLEAR */
  __asm__ volatile("" ::: "memory");

  const int T = K + 6;  /* K + (4-1) + (4-1) */
  for (int s = 0; s < T; ++s) {
    uint32_t Aword[4]={0}, Bword[4]={0};

    for (int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)? A_flat[i*lda+k] : 0; Aword[i]=(uint32_t)(uint8_t)a; }
    for (int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<K)? B_flat[k*ldb+j] : 0; Bword[j]=(uint32_t)(uint8_t)b; }

    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]);
    cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]);
    cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);

    (void)cfs_read(CFS_CTL);            /* ACK barrier before STEP */
    __asm__ volatile("" ::: "memory");
    cfs_step();
  }
}

/* Faster batched-4 feeder with ACK barrier (cut MMIO ~4×) */
static inline void cfs_gemm_systolic_4xK_Kx4_batched4_with_barrier(const int8_t *A_flat,
                                                                   const int8_t *B_flat,
                                                                   int K, int lda, int ldb) {
  cfs_clear();
  (void)cfs_read(CFS_CTL);            /* barrier after CLEAR */
  __asm__ volatile("" ::: "memory");

  const int T = K + 6;
  for (int t = 0; t < T; t += 4) {
    int8_t a_bytes[4][4] = {{0}};
    int8_t b_bytes[4][4] = {{0}};

    for (int i = 0; i < 4; ++i)
      for (int s = 0; s < 4; ++s) {
        int k = (t + s) - i;
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*lda + k];
      }
    for (int j = 0; j < 4; ++j)
      for (int s = 0; s < 4; ++s) {
        int k = (t + s) - j;
        if (k >= 0 && k < K) b_bytes[j][s] = B_flat[k*ldb + j];
      }

    cfs_write(CFS_A0, pack4_s8_lsb(a_bytes[0][0], a_bytes[0][1], a_bytes[0][2], a_bytes[0][3]));
    cfs_write(CFS_A1, pack4_s8_lsb(a_bytes[1][0], a_bytes[1][1], a_bytes[1][2], a_bytes[1][3]));
    cfs_write(CFS_A2, pack4_s8_lsb(a_bytes[2][0], a_bytes[2][1], a_bytes[2][2], a_bytes[2][3]));
    cfs_write(CFS_A3, pack4_s8_lsb(a_bytes[3][0], a_bytes[3][1], a_bytes[3][2], a_bytes[3][3]));

    cfs_write(CFS_B0, pack4_s8_lsb(b_bytes[0][0], b_bytes[0][1], b_bytes[0][2], b_bytes[0][3]));
    cfs_write(CFS_B1, pack4_s8_lsb(b_bytes[1][0], b_bytes[1][1], b_bytes[1][2], b_bytes[1][3]));
    cfs_write(CFS_B2, pack4_s8_lsb(b_bytes[2][0], b_bytes[2][1], b_bytes[2][2], b_bytes[2][3]));
    cfs_write(CFS_B3, pack4_s8_lsb(b_bytes[3][0], b_bytes[3][1], b_bytes[3][2], b_bytes[3][3]));

    (void)cfs_read(CFS_CTL);            /* ACK barrier before first STEP */
    __asm__ volatile("" ::: "memory");
    int steps = (t + 4 <= T) ? 4 : (T - t);
    for (int s = 0; s < steps; ++s) cfs_step();
  }
}

/* =======================
   Kernels
   ======================= */
static void gemm_ref(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]){
  for(int i=0;i<N;++i){
    for(int j=0;j<N;++j){
      int32_t s=0;
      for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
      C[i][j]=s;
    }
  }
}
static void gemm_cfu(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]){
  for(int i=0;i<N;++i){
    for(int j=0;j<N;++j){
      int32_t acc=0;
      for(int k=0;k<N;k+=4){
        uint32_t ap=pack4_s8_lsb(A[i][k+0],A[i][k+1],A[i][k+2],A[i][k+3]);
        uint32_t bp=pack4_s8_lsb(B[k+0][j],B[k+1][j],B[k+2][j],B[k+3][j]);
        acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
      }
      C[i][j]=acc;
    }
  }
}
static void cfs_run_tile(const int8_t *A_flat, const int8_t *B_flat, int32_t C4[4][4], int K, int lda, int ldb){
#ifndef CFS_FEEDER_BATCHED
  cfs_gemm_systolic_4xK_Kx4_strict_per_step(A_flat, B_flat, K, lda, ldb);
#else
  cfs_gemm_systolic_4xK_Kx4_batched4_with_barrier(A_flat, B_flat, K, lda, ldb);
#endif
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
}
static void gemm_cfs(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]){
  static int8_t  A_flat[4 * N];  /* 4×K */
  static int8_t  B_flat[N * 4];  /* K×4  */
  int32_t C4[4][4];

  for(int i0=0;i0<N;i0+=4){
    for(int j0=0;j0<N;j0+=4){
      /* Pack four rows of A over K=N */
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) A_flat[r*N + k] = A[sr][k]; }
      /* Pack four columns of B over K=N */
      for(int k=0;k<N;++k){
        B_flat[k*4+0]=B[k][j0+0];
        B_flat[k*4+1]=B[k][j0+1];
        B_flat[k*4+2]=B[k][j0+2];
        B_flat[k*4+3]=B[k][j0+3];
      }
      cfs_run_tile(A_flat, B_flat, C4, /*K=*/N, /*lda=*/N, /*ldb=*/4);
      for(int r=0;r<4;++r) for(int c=0;c<4;++c) C[i0+r][j0+c]=C4[r][c];
    }
  }
}

/* =======================
   Diagnostics
   ======================= */
static void dump_tile_4x4(const char* tag, const int32_t C[4][4]){
  printf("%s (4x4):\n", tag);
  for(int i=0;i<4;++i){ printf("  "); for(int j=0;j<4;++j) printf("%10ld ", (long)C[i][j]); printf("\n"); }
}

/* Return 1 if equal, else 0; if mismatch, fill *mi,*mj with first bad index */
static int equal_or_locate_first_mismatch(const int32_t *A, const int32_t *B, int *mi, int *mj){
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
    if (A[i*N + j] != B[i*N + j]) { if(mi) *mi=i; if(mj) *mj=j; return 0; }
  }
  return 1;
}

/* Replay a single 4×4 tile at (i0,j0) through CFS and compare to SW for that tile */
static void replay_tile_and_dump(const int8_t A[N][N], const int8_t B[N][N],
                                 int i0, int j0){
  static int8_t  A_flat[4 * N];
  static int8_t  B_flat[N * 4];
  int32_t C4_hw[4][4], C4_sw[4][4];

  /* Pack rows i0..i0+3 and cols j0..j0+3 */
  for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) A_flat[r*N + k] = A[sr][k]; }
  for(int k=0;k<N;++k){
    B_flat[k*4+0]=B[k][j0+0];
    B_flat[k*4+1]=B[k][j0+1];
    B_flat[k*4+2]=B[k][j0+2];
    B_flat[k*4+3]=B[k][j0+3];
  }

  /* HW tile */
  cfs_run_tile(A_flat, B_flat, C4_hw, N, N, 4);

  /* SW reference tile */
  for(int r=0;r<4;++r) for(int c=0;c<4;++c){
    int i=i0+r, j=j0+c; int32_t s=0;
    for(int k=0;k<N;++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
    C4_sw[r][c]=s;
  }

  printf("\n-- First mismatch tile at i0=%d j0=%d --\n", i0, j0);
  dump_tile_4x4("CFS C tile", C4_hw);
  dump_tile_4x4("SW  C tile", C4_sw);
}

/* =======================
   Main
   ======================= */
int main(void){
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));

  static int8_t  A[N][N], B[N][N];
  static int32_t Csw[N][N], Ccfu[N][N], Ccfs[N][N];

  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);

  /* SW */
  uint64_t c0=rdcycle(), i0=rdinstret();
  gemm_ref(A,B,Csw);
  uint64_t i1=rdinstret(), c1=rdcycle();
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;

  /* CFU */
  c0=rdcycle(); i0=rdinstret();
  gemm_cfu(A,B,Ccfu);
  i1=rdinstret(); c1=rdcycle();
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;

  /* CFS */
  c0=rdcycle(); i0=rdinstret();
  gemm_cfs(A,B,Ccfs);
  i1=rdinstret(); c1=rdcycle();
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;

  int ok_cfu = cmp_NxN(&Csw[0][0], &Ccfu[0][0]);
  int ok_cfs = cmp_NxN(&Csw[0][0], &Ccfs[0][0]);

  printf("\n%dx%d timing summary\n", N, N);
  printf("Path |     cycles     |    instret    | Speedup(cyc) | Speedup(inst)\n");
  printf("-----+----------------+---------------+--------------+--------------\n");
  printf(" SW  | %14" PRIu64 " | %13" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
  printf(" CFU | %14" PRIu64 " | %13" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
  printf(" CFS | %14" PRIu64 " | %13" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");

  printf("\nVerdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");

  if(!ok_cfs){
    int bi=-1, bj=-1;
    if(!equal_or_locate_first_mismatch(&Csw[0][0], &Ccfs[0][0], &bi, &bj)){
      /* Align to the upper-left corner of the 4×4 tile containing (bi,bj) */
      int i0 = (bi/4)*4;
      int j0 = (bj/4)*4;
      replay_tile_and_dump(A, B, i0, j0);
    }
  }

  return (ok_cfu && ok_cfs)? 0 : 1;
}

