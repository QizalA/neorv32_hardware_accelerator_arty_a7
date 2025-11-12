// gemm_2x2.c — SW vs CFU (DP4A) vs CFS for 2×2 int8 GEMM
// Matches your VHDL exactly: CFU DP4A custom-0 (funct3=000, funct7=0000001),
// LSB-first lanes, signed int8, and strict per-step CFS feeding.

#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

/* =======================
   Config
   ======================= */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u   /* override with -DCFS_BASE=0x... if different */
#endif

/* CFU DP4A encode: custom-0 opcode (0x0B), funct3=000, funct7=0000001 */
#ifndef CFU_FUNCT3
#define CFU_FUNCT3 0x0
#endif
#ifndef CFU_FUNCT7
#define CFU_FUNCT7 0x1
#endif

/* Problem size */
#define N     2
#define TILE  4
#define MAXK  4
#define LDA   (MAXK)  /* A_flat: 4 rows × MAXK cols */
#define LDB   (4)     /* B_flat: MAXK rows × 4 cols */

/* =======================
   CSRs (cycles & instret)
   ======================= */
static inline uint64_t rdcycle(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,mcycleh":"=r"(hi1));
       __asm__ volatile("csrr %0,mcycle" :"=r"(lo));
       __asm__ volatile("csrr %0,mcycleh":"=r"(hi2)); } while (hi1 != hi2);
  return ((uint64_t)hi1 << 32) | lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,mcycle":"=r"(v)); return v;
#endif
}
static inline uint64_t rdinstret(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,minstreth":"=r"(hi1));
       __asm__ volatile("csrr %0,minstret" :"=r"(lo));
       __asm__ volatile("csrr %0,minstreth":"=r"(hi2)); } while (hi1 != hi2);
  return ((uint64_t)hi1 << 32) | lo;
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
   Helpers
   ======================= */
static inline uint32_t pack4_s8_lsb(int8_t x0,int8_t x1,int8_t x2,int8_t x3){
  /* LSB-first: x0 -> [7:0], x1 -> [15:8], x2 -> [23:16], x3 -> [31:24] */
  return  ((uint32_t)(uint8_t)x0)        |
         (((uint32_t)(uint8_t)x1) << 8)  |
         (((uint32_t)(uint8_t)x2) << 16) |
         (((uint32_t)(uint8_t)x3) << 24);
}

/* CFU DP4A: 4×int8 (signed) dot -> int32 (sum in low 32b) */
static inline int32_t cfu_dp4a(int32_t a_packed, int32_t b_packed) {
  uint32_t r;
  /* .insn r <opcode>, <funct3>, <funct7>, rd, rs1, rs2  */
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
                    : "=r"(r)
                    : "i"(CFU_FUNCT3), "i"(CFU_FUNCT7),
                      "r"(a_packed), "r"(b_packed));
  return (int32_t)r;
}

/* Patterns (deterministic signed int8) */
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }

static void print_speedup_fixed(uint64_t num, uint64_t den) {
  if (!den) { printf("  n/a    "); return; }
  uint64_t s = (num * 1000ull + den/2) / den;
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}
static int cmp_NxN(const int32_t *A, const int32_t *B) {
  for (int i = 0; i < N*N; ++i) if (A[i] != B[i]) return 0; return 1;
}

/* =======================
   STRICT per-step CFS feeder (LSB-only each step)
   ======================= */
static void cfs_gemm_systolic_4xK_Kx4_strict_per_step(const int8_t *A_flat,
                                                      const int8_t *B_flat,
                                                      int K) {
  cfs_clear();
  const int T = K + 6;  /* K + (4-1) + (4-1) */

  for (int s = 0; s < T; ++s) {
    uint32_t Aword[4] = {0,0,0,0};
    uint32_t Bword[4] = {0,0,0,0};

    /* For row i, use k = s - i; for col j, use k = s - j */
    for (int i = 0; i < 4; ++i) {
      int k = s - i;
      int8_t a = (k >= 0 && k < K) ? A_flat[i*LDA + k] : 0;
      Aword[i] = (uint32_t)(uint8_t)a; /* LSB-only */
    }
    for (int j = 0; j < 4; ++j) {
      int k = s - j;
      int8_t b = (k >= 0 && k < K) ? B_flat[k*LDB + j] : 0;
      Bword[j] = (uint32_t)(uint8_t)b; /* LSB-only */
    }

    /* Drive MMIO for this single step */
    cfs_write(CFS_A0, Aword[0]); cfs_write(CFS_A1, Aword[1]);
    cfs_write(CFS_A2, Aword[2]); cfs_write(CFS_A3, Aword[3]);
    cfs_write(CFS_B0, Bword[0]); cfs_write(CFS_B1, Bword[1]);
    cfs_write(CFS_B2, Bword[2]); cfs_write(CFS_B3, Bword[3]);

    /* Advance exactly one systolic cycle */
    cfs_step();
  }
}
static void cfs_read_C(int32_t dst[4][4]) {
  for (int i = 0; i < 4; ++i)
    for (int j = 0; j < 4; ++j)
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
}

/* =======================
   Kernels (2×2)
   ======================= */
static void gemm_ref_2x2(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]) {
  for (int i = 0; i < N; ++i)
    for (int j = 0; j < N; ++j) {
      int32_t s = 0;
      for (int k = 0; k < N; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
      C[i][j] = s;
    }
}
static void gemm_cfu_2x2(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N]) {
  for (int i = 0; i < N; ++i)
    for (int j = 0; j < N; ++j) {
      /* K=2 -> pad to 4 lanes with zeros */
      int8_t ar0=A[i][0], ar1=A[i][1], ar2=0, ar3=0;
      int8_t bc0=B[0][j], bc1=B[1][j], bc2=0, bc3=0;
      uint32_t ap = pack4_s8_lsb(ar0,ar1,ar2,ar3);
      uint32_t bp = pack4_s8_lsb(bc0,bc1,bc2,bc3);
      C[i][j] = cfu_dp4a((int32_t)ap, (int32_t)bp);
    }
}
static void gemm_cfs_2x2(const int8_t A[N][N], const int8_t B[N][N], int32_t C[N][N],
                         int32_t C4_dbg[4][4]) {
  static int8_t  A_flat[4 * LDA];   /* 4×MAXK */
  static int8_t  B_flat[MAXK * LDB];/* MAXK×4 */

  /* Pack A rows (first N valid), K=N */
  for (int r = 0; r < 4; ++r)
    for (int k = 0; k < MAXK; ++k)
      A_flat[r*LDA + k] = (r < N && k < N) ? A[r][k] : 0;

  /* Pack B columns (first N valid), K=N */
  for (int k = 0; k < MAXK; ++k)
    for (int c = 0; c < 4; ++c)
      B_flat[k*LDB + c] = (k < N && c < N) ? B[k][c] : 0;

  /* Strict per-step driver */
  cfs_gemm_systolic_4xK_Kx4_strict_per_step(A_flat, B_flat, /*K=*/N);
  cfs_read_C(C4_dbg);

  /* Copy the top-left 2×2 back */
  for (int i = 0; i < N; ++i)
    for (int j = 0; j < N; ++j)
      C[i][j] = C4_dbg[i][j];
}

/* Debug print helpers */
static void print_mat2(const char* tag, const int32_t C[2][2]){
  printf("%s:\n", tag);
  for(int i=0;i<2;++i){ printf("  ");
    for(int j=0;j<2;++j) printf("%6ld ", (long)C[i][j]);
    printf("\n");
  }
}
static void print_mat4(const char* tag, const int32_t C[4][4]){
  printf("%s (4x4):\n", tag);
  for(int i=0;i<4;++i){ printf("  ");
    for(int j=0;j<4;++j) printf("%6ld ", (long)C[i][j]);
    printf("\n");
  }
}

/* Optional: sanity probe for CFU encoding/packing */
static void probe_cfu(void){
  uint32_t ap = pack4_s8_lsb(1,2,3,4);
  uint32_t bp = pack4_s8_lsb(5,6,7,8);
  int32_t  r  = cfu_dp4a((int32_t)ap,(int32_t)bp);
  printf("CFU DP4A probe = %ld (expect 70)\n", (long)r);
}

/* =======================
   Main
   ======================= */
int main(void) {
  printf("== 2x2 GEMM: SW vs CFU vs CFS ==\n");
  printf("CFS ID: 0x%08" PRIX32 " (expect 0xCAFEBABE)\n", cfs_read(CFS_CTL));
  probe_cfu();

  /* Test 1: simple positive values */
  int8_t  A1[2][2] = {{1,2},{3,4}};
  int8_t  B1[2][2] = {{5,6},{7,8}};
  int32_t Csw1[2][2], Ccfu1[2][2], Ccfs1[2][2], C4dbg1[4][4];

  uint64_t c0,i0,i1,c1;

  c0=rdcycle(); i0=rdinstret(); gemm_ref_2x2(A1,B1,Csw1); i1=rdinstret(); c1=rdcycle();
  uint64_t sw_cyc1=c1-c0, sw_ins1=i1-i0;

  c0=rdcycle(); i0=rdinstret(); gemm_cfu_2x2(A1,B1,Ccfu1); i1=rdinstret(); c1=rdcycle();
  uint64_t cfu_cyc1=c1-c0, cfu_ins1=i1-i0;

  c0=rdcycle(); i0=rdinstret(); gemm_cfs_2x2(A1,B1,Ccfs1,C4dbg1); i1=rdinstret(); c1=rdcycle();
  uint64_t cfs_cyc1=c1-c0, cfs_ins1=i1-i0;

  int ok_cfu1 = cmp_NxN(&Csw1[0][0], &Ccfu1[0][0]);
  int ok_cfs1 = cmp_NxN(&Csw1[0][0], &Ccfs1[0][0]);

  print_mat4("CFS C tile (Test1)", C4dbg1);
  print_mat2("SW C 2x2 (Test1)", Csw1);
  print_mat2("CFS C 2x2 (Test1)", Ccfs1);
  printf("Test1 Verdict: CFU %s, CFS %s\n", ok_cfu1?"PASS":"FAIL", ok_cfs1?"PASS":"FAIL");

  /* Test 2: your deterministic signed patterns */
  int8_t  A[2][2], B[2][2];
  for (int i = 0; i < N; ++i)
    for (int k = 0; k < N; ++k) A[i][k] = pattA(i, k);
  for (int k = 0; k < N; ++k)
    for (int j = 0; j < N; ++j) B[k][j] = pattB(k, j);

  int32_t C_sw[2][2], C_cfu[2][2], C_cfs[2][2], C4dbg[4][4];

  c0=rdcycle(); i0=rdinstret(); gemm_ref_2x2(A,B,C_sw); i1=rdinstret(); c1=rdcycle();
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;

  c0=rdcycle(); i0=rdinstret(); gemm_cfu_2x2(A,B,C_cfu); i1=rdinstret(); c1=rdcycle();
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;

  c0=rdcycle(); i0=rdinstret(); gemm_cfs_2x2(A,B,C_cfs,C4dbg); i1=rdinstret(); c1=rdcycle();
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;

  int ok_cfu = cmp_NxN(&C_sw[0][0], &C_cfu[0][0]);
  int ok_cfs = cmp_NxN(&C_sw[0][0], &C_cfs[0][0]);

  print_mat4("CFS C tile (Test2)", C4dbg);
  print_mat2("SW C 2x2 (Test2)", C_sw);
  print_mat2("CFS C 2x2 (Test2)", C_cfs);

  printf("\n2x2 timing summary (cycles / instret)\n");
  printf("Path |   cycles   |  instret   | Speedup(cyc) | Speedup(inst)\n");
  printf("-----+------------+------------+--------------+--------------\n");
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |     --       |     --      \n", sw_cyc,  sw_ins);
  printf(" CFU | %10" PRIu64 " | %10" PRIu64 " |  ", cfu_cyc, cfu_ins);
  print_speedup_fixed(sw_cyc,  cfu_cyc);  printf("     |  "); print_speedup_fixed(sw_ins,  cfu_ins);  printf("\n");
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins);
  print_speedup_fixed(sw_cyc,  cfs_cyc);  printf("     |  "); print_speedup_fixed(sw_ins,  cfs_ins);  printf("\n");

  printf("\nTest2 Verdict: CFU %s, CFS %s\n",
         ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");

  return (ok_cfu && ok_cfs) ? 0 : 1;
}

