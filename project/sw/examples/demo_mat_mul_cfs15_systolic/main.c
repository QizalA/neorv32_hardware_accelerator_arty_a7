#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

/* =======================
   Config
   ======================= */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u   /* set to your actual CFS MMIO base if different */
#endif

#define MAXK 64       /* must be >= 8; just a buffer stride */
#define LDA  (MAXK)   /* A_flat: 4 rows × MAXK cols */
#define LDB  (4)      /* B_flat: MAXK rows × 4 cols */

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

/* =======================
   Systolic streaming (skewed, packed/4)
   ======================= */
static void cfs_gemm_systolic_4xK_Kx4_skewed_packed4(const int8_t *A_flat,
                                                     const int8_t *B_flat,
                                                     int K) {
  cfs_clear();
  const int T = K + 6;  /* total STEPs = K + (4-1)+(4-1) */

  for (int t = 0; t < T; t += 4) {
    int8_t a_bytes[4][4] = {{0}};
    int8_t b_bytes[4][4] = {{0}};

    /* Build 4-step packets with skew:
       A row i uses k=(t+s)-i; B col j uses k=(t+s)-j */
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
   Core ops (8x8)
   ======================= */
static void cfs_read_C(int32_t dst[4][4]) {
  for (int i = 0; i < 4; ++i)
    for (int j = 0; j < 4; ++j)
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
}

static void cfs_gemm_8x8(const int8_t A[8][8], const int8_t B[8][8], int32_t C[8][8]) {
  static int8_t  A_flat[4 * LDA];   /* 4×MAXK */
  static int8_t  B_flat[MAXK * LDB];/* MAXK×4 */
  int32_t C4[4][4];

  for (int i0 = 0; i0 < 8; i0 += 4) {
    for (int j0 = 0; j0 < 8; j0 += 4) {

      /* A_flat: rows i0..i0+3, K=8 */
      for (int r = 0; r < 4; ++r) {
        for (int k = 0; k < 8; ++k) A_flat[r*LDA + k] = A[i0 + r][k];
        for (int k = 8; k < MAXK; ++k) A_flat[r*LDA + k] = 0;
      }

      /* B_flat: K=8, cols j0..j0+3 */
      for (int k = 0; k < 8; ++k) {
        B_flat[k*LDB + 0] = B[k][j0 + 0];
        B_flat[k*LDB + 1] = B[k][j0 + 1];
        B_flat[k*LDB + 2] = B[k][j0 + 2];
        B_flat[k*LDB + 3] = B[k][j0 + 3];
      }

      cfs_gemm_systolic_4xK_Kx4_skewed_packed4(A_flat, B_flat, /*K=*/8);
      cfs_read_C(C4);

      for (int r = 0; r < 4; ++r)
        for (int c = 0; c < 4; ++c)
          C[i0 + r][j0 + c] = C4[r][c];
    }
  }
}

static void gemm_ref_8x8(const int8_t A[8][8], const int8_t B[8][8], int32_t C[8][8]) {
  for (int i = 0; i < 8; ++i)
    for (int j = 0; j < 8; ++j) {
      int32_t s = 0;
      for (int k = 0; k < 8; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
      C[i][j] = s;
    }
}

/* =======================
   Utils
   ======================= */
static void print_i32_8x8(const char* name, const int32_t M[8][8]) {
  printf("%s:\n", name);
  for (int i = 0; i < 8; ++i) {
    for (int j = 0; j < 8; ++j) printf("%6ld ", (long)M[i][j]);
    printf("\n");
  }
}

/* Fixed patterns (nice deterministic values) */
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }

/* Fixed-point speedup printer (X.YYYx) */
static void print_speedup_fixed(uint64_t num, uint64_t den) {
  if (!den) { printf("  n/a    "); return; }
  uint64_t s = (num * 1000ull + den/2) / den;
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}

static int cmp_8x8(const int32_t A[8][8], const int32_t B[8][8]) {
  for (int i = 0; i < 8; ++i)
    for (int j = 0; j < 8; ++j)
      if (A[i][j] != B[i][j]) return 0;
  return 1;
}

/* =======================
   Main
   ======================= */
int main(void) {
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);

  /* Build 8×8 test matrices */
  int8_t  A[8][8], B[8][8];
  int32_t C_sw[8][8], C_hw[8][8];

  for (int i = 0; i < 8; ++i)
    for (int k = 0; k < 8; ++k) A[i][k] = pattA(i, k);

  for (int k = 0; k < 8; ++k)
    for (int j = 0; j < 8; ++j) B[k][j] = pattB(k, j);

  /* ---- SW timing ---- */
  uint64_t c0 = rdcycle(), i0 = rdinstret();
  gemm_ref_8x8(A, B, C_sw);
  uint64_t i1 = rdinstret(), c1 = rdcycle();
  uint64_t sw_cyc = c1 - c0, sw_ins = i1 - i0;

  /* ---- CFS timing ---- */
  c0 = rdcycle(); i0 = rdinstret();
  cfs_gemm_8x8(A, B, C_hw);
  i1 = rdinstret(); c1 = rdcycle();
  uint64_t cfs_cyc = c1 - c0, cfs_ins = i1 - i0;

  /* Verify */
  int ok = cmp_8x8(C_hw, C_sw);

  /* Print matrices (optional, comment out if noisy) */
  print_i32_8x8("C (HW)", C_hw);
  print_i32_8x8("C (SW)", C_sw);

  /* Summary table */
  printf("\n8x8 timing summary\n");
  printf("Path |   cycles   |  instret   |  Speedup(cyc)  | Speedup(inst)\n");
  printf("-----+------------+------------+----------------+---------------\n");
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |       --       |      --      \n", sw_cyc,  sw_ins);
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins);
  print_speedup_fixed(sw_cyc,  cfs_cyc);  printf("     |  ");
  print_speedup_fixed(sw_ins,  cfs_ins);  printf("\n");

  printf("\nVerdict: %s\n", ok ? "PASS (HW matches SW)" : "FAIL (mismatch)");
  return ok ? 0 : 1;
}

