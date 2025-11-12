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

#define N     3
#define MAXK  3
#define LDA   (128)   /* keep a wide stride (not required but OK) */
#define LDB   (4)

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

static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
static inline void cfs_clear(void) { cfs_write(CFS_CTL, 0b10u); }
static inline void cfs_step (void) { cfs_write(CFS_CTL, 0b01u); }

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
static int cmp_NxN(const int32_t *A, const int32_t *B){
  for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1;
}

static void cfs_gemm_systolic_4xK_Kx4_strict_per_step(const int8_t *A_flat,
                                                      const int8_t *B_flat, int K) {
  cfs_clear();
  const int T = K + 6;
  for (int s = 0; s < T; ++s) {
    uint32_t Aword[4]={0}, Bword[4]={0};
    for (int i=0;i<4;++i){
      int k=s-i; int8_t a=(k>=0 && k<K)? A_flat[i*LDA+k] : 0; Aword[i]=(uint32_t)(uint8_t)a;
    }
    for (int j=0;j<4;++j){
      int k=s-j; int8_t b=(k>=0 && k<K)? B_flat[k*LDB+j] : 0; Bword[j]=(uint32_t)(uint8_t)b;
    }
    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]);
    cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]);
    cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);
    cfs_step();
  }
}
static void cfs_read_C(int32_t dst[4][4]){
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) dst[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
}

/* SW */
static void gemm_ref(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]){
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
    int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s;
  }
}
/* CFU (pad last lane with 0) */
static void gemm_cfu(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]){
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
    int8_t a0=A[i][0], a1=A[i][1], a2=A[i][2], a3=0;
    int8_t b0=B[0][j], b1=B[1][j], b2=B[2][j], b3=0;
    uint32_t ap=pack4_s8_lsb(a0,a1,a2,a3);
    uint32_t bp=pack4_s8_lsb(b0,b1,b2,b3);
    C[i][j]=cfu_dp4a((int32_t)ap,(int32_t)bp);
  }
}
/* CFS (top-left 3×3 of a 4×4 tile) */
static void gemm_cfs(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]){
  static int8_t  A_flat[4*LDA];
  static int8_t  B_flat[128*LDB]; /* oversize and safe */
  int32_t C4[4][4];

  for(int r=0;r<4;++r) for(int k=0;k<LDA;++k)
    A_flat[r*LDA+k] = (r<N && k<N)? A[r][k] : 0;

  for(int k=0;k<LDA;++k) for(int c=0;c<4;++c)
    B_flat[k*LDB+c] = (k<N && c<N)? B[k][c] : 0;

  cfs_gemm_systolic_4xK_Kx4_strict_per_step(A_flat,B_flat,N);
  cfs_read_C(C4);
  for(int i=0;i<N;++i) for(int j=0;j<N;++j) C[i][j]=C4[i][j];
}

int main(void){
  printf("== 3x3 GEMM: SW vs CFU vs CFS ==\n");
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));

  int8_t  A[N][N], B[N][N];
  int32_t Csw[N][N], Ccfu[N][N], Ccfs[N][N];

  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);

  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_ref(A,B,Csw); uint64_t i1=rdinstret(), c1=rdcycle();
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;

  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;

  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;

  int ok1=cmp_NxN(&Csw[0][0], &Ccfu[0][0]);
  int ok2=cmp_NxN(&Csw[0][0], &Ccfs[0][0]);

  printf("\n3x3 timing summary\n");
  printf("Path |   cycles   |  instret   | Speedup(cyc) | Speedup(inst)\n");
  printf("-----+------------+------------+--------------+--------------\n");
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
  printf(" CFU | %10" PRIu64 " | %10" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");

  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
  return (ok1 && ok2)?0:1;
}

