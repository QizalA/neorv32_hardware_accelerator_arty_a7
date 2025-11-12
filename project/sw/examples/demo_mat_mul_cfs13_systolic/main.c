#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

/* =======================
   Config
   ======================= */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u   /* set to your actual CFS base if different */
#endif

#define MAXK 16         /* max K we’ll stream; 16 is plenty for 2x2 */
#define LDA  (MAXK)     /* A is stored as 4 x MAXK (row-major) */
#define LDB  (4)        /* B is stored as K x 4  (row-major)    */

/* =======================
   CFS register map
   ======================= */
#define CFS_REG(off)   (*(volatile uint32_t*)(CFS_BASE + ((off) << 2)))

#define CFS_CTL        0   /* write: bit0=STEP, bit1=CLEAR | read: 0xCAFEBABE */
#define CFS_A0         1
#define CFS_A1         2
#define CFS_A2         3
#define CFS_A3         4
#define CFS_B0         5
#define CFS_B1         6
#define CFS_B2         7
#define CFS_B3         8
#define CFS_C0        16  /* .. CFS_C15 = 31 */

/* =======================
   CSR timing utilities (RV32/RV64)
   ======================= */
static inline uint64_t rdcycle(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do {
    __asm__ volatile ("csrr %0, mcycleh" : "=r"(hi1));
    __asm__ volatile ("csrr %0, mcycle"  : "=r"(lo));
    __asm__ volatile ("csrr %0, mcycleh" : "=r"(hi2));
  } while (hi1 != hi2);
  return ((uint64_t)hi1 << 32) | lo;
#else
  uint64_t v; __asm__ volatile ("csrr %0, mcycle" : "=r"(v)); return v;
#endif
}
static inline uint64_t rdinstret(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do {
    __asm__ volatile ("csrr %0, minstreth" : "=r"(hi1));
    __asm__ volatile ("csrr %0, minstret"  : "=r"(lo));
    __asm__ volatile ("csrr %0, minstreth" : "=r"(hi2));
  } while (hi1 != hi2);
  return ((uint64_t)hi1 << 32) | lo;
#else
  uint64_t v; __asm__ volatile ("csrr %0, minstret" : "=r"(v)); return v;
#endif
}

/* =======================
   MMIO helpers
   ======================= */
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
static inline void cfs_clear(void) { cfs_write(CFS_CTL, 0b10u); } /* bit1=CLEAR */
static inline void cfs_step (void) { cfs_write(CFS_CTL, 0b01u); } /* bit0=STEP  */

static inline uint32_t pack4_s8(int8_t x0,int8_t x1,int8_t x2,int8_t x3){
  return  ((uint32_t)(uint8_t)x0)        |
         (((uint32_t)(uint8_t)x1) << 8)  |
         (((uint32_t)(uint8_t)x2) << 16) |
         (((uint32_t)(uint8_t)x3) << 24);
}

/* Read C[4x4] row-major from CFS into dst[4][4] (int32) */
static void cfs_read_C(int32_t dst[4][4]) {
  for (int i = 0; i < 4; ++i)
    for (int j = 0; j < 4; ++j)
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
}

/* =======================
   Systolic streaming (skewed, packed in groups of 4 steps)
   ======================= */
static void cfs_gemm_systolic_4xK_Kx4_skewed_packed4(const int8_t *A_flat,
                                                     const int8_t *B_flat,
                                                     int K) {
  cfs_clear();
  const int T = K + 6;  /* total STEPs = K + (4-1)+(4-1) */

  for (int t = 0; t < T; t += 4) {
    int8_t a_bytes[4][4] = {{0}};
    int8_t b_bytes[4][4] = {{0}};

    for (int i = 0; i < 4; ++i)
      for (int s = 0; s < 4; ++s) {
        int k = (t + s) - i;
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
      }

    for (int j = 0; j < 4; ++j)
      for (int s = 0; s < 4; ++s) {
        int k = (t + s) - j;
        if (k >= 0 && k < K) b_bytes[j][s] = B_flat[k*LDB + j];
      }

    cfs_write(CFS_A0, pack4_s8(a_bytes[0][0], a_bytes[0][1], a_bytes[0][2], a_bytes[0][3]));
    cfs_write(CFS_A1, pack4_s8(a_bytes[1][0], a_bytes[1][1], a_bytes[1][2], a_bytes[1][3]));
    cfs_write(CFS_A2, pack4_s8(a_bytes[2][0], a_bytes[2][1], a_bytes[2][2], a_bytes[2][3]));
    cfs_write(CFS_A3, pack4_s8(a_bytes[3][0], a_bytes[3][1], a_bytes[3][2], a_bytes[3][3]));

    cfs_write(CFS_B0, pack4_s8(b_bytes[0][0], b_bytes[0][1], b_bytes[0][2], b_bytes[0][3]));
    cfs_write(CFS_B1, pack4_s8(b_bytes[1][0], b_bytes[1][1], b_bytes[1][2], b_bytes[1][3]));
    cfs_write(CFS_B2, pack4_s8(b_bytes[2][0], b_bytes[2][1], b_bytes[2][2], b_bytes[2][3]));
    cfs_write(CFS_B3, pack4_s8(b_bytes[3][0], b_bytes[3][1], b_bytes[3][2], b_bytes[3][3]));

    int steps = (t + 4 <= T) ? 4 : (T - t);
    for (int s = 0; s < steps; ++s) cfs_step();
  }
}

/* =======================
   SW reference for 2x2 (A2xK * BKx2)
   ======================= */
static void gemm_ref_2xK_Kx2(const int8_t *A2xK, int lda2,
                             const int8_t *BKx2, int ldb2,
                             int K, int32_t C2x2[2][2]) {
  C2x2[0][0] = C2x2[0][1] = C2x2[1][0] = C2x2[1][1] = 0;
  for (int i = 0; i < 2; ++i)
    for (int k = 0; k < K; ++k) {
      int32_t a = (int32_t)A2xK[i*lda2 + k];
      C2x2[i][0] += a * (int32_t)BKx2[k*ldb2 + 0];
      C2x2[i][1] += a * (int32_t)BKx2[k*ldb2 + 1];
    }
}

/* =======================
   2x2 via the 4x4 systolic tile (zero extra lanes)
   ======================= */
static void cfs_gemm_2xK_Kx2(const int8_t *A2xK, int LDA2,
                             const int8_t *B_Kx2, int LDB2,
                             int K, int32_t C2x2[2][2]) {
  static int8_t A_flat[4 * LDA];    /* 4 rows, MAXK columns */
  static int8_t B_flat[MAXK * LDB]; /* MAXK rows, 4 columns */

  /* Zero all */
  for (int i = 0; i < 4*LDA; ++i) A_flat[i] = 0;
  for (int k = 0; k < MAXK*LDB; ++k) B_flat[k] = 0;

  /* Copy A rows 0..1; rows 2..3 stay zero */
  for (int i = 0; i < 2; ++i) {
    for (int k = 0; k < K; ++k) A_flat[i*LDA + k] = A2xK[i*LDA2 + k];
  }

  /* Copy B cols 0..1; cols 2..3 stay zero */
  for (int k = 0; k < K; ++k) {
    B_flat[k*LDB + 0] = B_Kx2[k*LDB2 + 0];
    B_flat[k*LDB + 1] = B_Kx2[k*LDB2 + 1];
  }

  /* Run HW (skewed, packed-4) */
  cfs_gemm_systolic_4xK_Kx4_skewed_packed4(A_flat, B_flat, K);

  /* Read back 4x4 and extract the top-left 2x2 */
  int32_t C4[4][4];
  cfs_read_C(C4);
  C2x2[0][0] = C4[0][0]; C2x2[0][1] = C4[0][1];
  C2x2[1][0] = C4[1][0]; C2x2[1][1] = C4[1][1];
}

/* =======================
   Utilities
   ======================= */
static void print_i32_2x2(const char* name, const int32_t C[2][2]) {
  printf("%s:\n", name);
  printf("%6ld %6ld\n", (long)C[0][0], (long)C[0][1]);
  printf("%6ld %6ld\n", (long)C[1][0], (long)C[1][1]);
}

/* Print speedup as fixed-point with 3 decimals: (num/den) ≈ X.YYYx */
static void print_speedup_fixed(const char* label, uint64_t num, uint64_t den) {
  if (den == 0) { printf("%s: n/a\n", label); return; }
  uint64_t scaled = (num * 1000ull + den/2) / den; /* rounded */
  uint64_t i = scaled / 1000ull;
  uint64_t f = scaled % 1000ull;
  printf("%s: %" PRIu64 ".%03" PRIu64 "x\n", label, i, f);
}

/* Example 2x2 × 2x2 (K=2) */
static void make_example_2x2(int8_t *A2xK, int LDA2,
                             int8_t *BKx2, int LDB2,
                             int *outK) {
  const int K = 2; *outK = K;
  /* A = [[1,2],[3,4]] */
  A2xK[0*LDA2 + 0] = 1;  A2xK[0*LDA2 + 1] = 2;
  A2xK[1*LDA2 + 0] = 3;  A2xK[1*LDA2 + 1] = 4;
  /* B = [[5,6],[7,8]] */
  BKx2[0*LDB2 + 0] = 5;  BKx2[0*LDB2 + 1] = 6;
  BKx2[1*LDB2 + 0] = 7;  BKx2[1*LDB2 + 1] = 8;
}

int main(void) {
  /* Check ID */
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n", id);

  /* Buffers for 2x2 × 2x2 */
  const int LDA2 = 2, LDB2 = 2;
  int8_t A2xK[2*2], BKx2[2*2]; int K;
  make_example_2x2(A2xK, LDA2, BKx2, LDB2, &K);

  /* ===== SW multiply timing ===== */
  int32_t C_sw[2][2];
  uint64_t c0 = rdcycle(), i0 = rdinstret();
  gemm_ref_2xK_Kx2(A2xK, LDA2, BKx2, LDB2, K, C_sw);
  uint64_t i1 = rdinstret(), c1 = rdcycle();
  uint64_t sw_cycles  = c1 - c0;
  uint64_t sw_instret = i1 - i0;

  /* ===== CFS multiply timing ===== */
  int32_t C_hw[2][2];
  c0 = rdcycle(); i0 = rdinstret();
  cfs_gemm_2xK_Kx2(A2xK, LDA2, BKx2, LDB2, K, C_hw);
  i1 = rdinstret(); c1 = rdcycle();
  uint64_t cfs_cycles  = c1 - c0;
  uint64_t cfs_instret = i1 - i0;

  /* Output */
  print_i32_2x2("C (HW)", C_hw);
  print_i32_2x2("C (SW)", C_sw);

  int pass = (C_hw[0][0]==C_sw[0][0]) && (C_hw[0][1]==C_sw[0][1]) &&
             (C_hw[1][0]==C_sw[1][0]) && (C_hw[1][1]==C_sw[1][1]);

  printf("\nSW:  cycles=%" PRIu64 "  instret=%" PRIu64 "\n", sw_cycles,  sw_instret);
  printf("CFS: cycles=%" PRIu64 "  instret=%" PRIu64 "\n", cfs_cycles, cfs_instret);

  if (sw_cycles && cfs_cycles) {
    print_speedup_fixed("Speedup (cycles)",  sw_cycles,  cfs_cycles);
  }
  if (sw_instret && cfs_instret) {
    print_speedup_fixed("Speedup (instret)", sw_instret, cfs_instret);
  }

  printf("\nVerdict: %s\n", pass ? "PASS (HW matches SW)" : "FAIL (mismatch)");
  return pass ? 0 : 1;
}

