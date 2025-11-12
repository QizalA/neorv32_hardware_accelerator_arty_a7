#include <stdint.h>
#include <stdio.h>

/* =======================
   Config
   ======================= */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u   /* set to your actual base if different */
#endif

#define MAXK 64          /* max K we’ll test; adjust as you like */
#define LDA  (MAXK)      /* A is stored as 4 x MAXK (row-major) */
#define LDB  (4)         /* B is stored as K x 4  (row-major)    */

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

static inline void cfs_write(uint32_t off, uint32_t val) { CFS_REG(off) = val; }
static inline uint32_t cfs_read(uint32_t off) { return CFS_REG(off); }

static inline void cfs_clear(void) { cfs_write(CFS_CTL, 0b10u); }   /* bit1=CLEAR */
static inline void cfs_step(void)  { cfs_write(CFS_CTL, 0b01u); }   /* bit0=STEP  */

/* Pack 4 int8_t into a 32-bit word, LSB-first (consumed first by hardware). */
static inline uint32_t pack4_s8(const int8_t x0, const int8_t x1,
                                const int8_t x2, const int8_t x3) {
  return  ((uint32_t)(uint8_t)x0)        |
         (((uint32_t)(uint8_t)x1) << 8)  |
         (((uint32_t)(uint8_t)x2) << 16) |
         (((uint32_t)(uint8_t)x3) << 24);
}

/* Read C[4x4] row-major from CFS into dst[4][4] (int32) */
static void cfs_read_C(int32_t dst[4][4]) {
  for (int i = 0; i < 4; ++i) {
    for (int j = 0; j < 4; ++j) {
      uint32_t u = cfs_read(CFS_C0 + i*4 + j);
      dst[i][j] = (int32_t)u; /* HW stores 32-bit; reinterpret is fine */
    }
  }
}

/* Zero a 4x4 int32 matrix */
static void zero_i32_4x4(int32_t C[4][4]) {
  for (int i = 0; i < 4; ++i)
    for (int j = 0; j < 4; ++j)
      C[i][j] = 0;
}

/* clamp helper for nice patterns */
static inline int8_t clamp_s8(int v) {
  if (v > 127)  v = 127;
  if (v < -128) v = -128;
  return (int8_t)v;
}

/* Reference GEMM: C = A(4xK) * B(Kx4), int8×int8 -> int32
   A is flat with leading dim LDA (= MAXK):  A[i,k] = A_flat[i*LDA + k]
   B is flat with leading dim LDB (= 4):     B[k,j] = B_flat[k*LDB + j]
*/
static void gemm_ref_4xK_Kx4(const int8_t *A_flat, const int8_t *B_flat,
                             int K, int32_t C[4][4]) {
  zero_i32_4x4(C);
  for (int i = 0; i < 4; ++i) {
    const int arow_off = i * LDA;
    for (int k = 0; k < K; ++k) {
      int32_t a = (int32_t)A_flat[arow_off + k];
      const int brow_off = k * LDB;
      for (int j = 0; j < 4; ++j) {
        C[i][j] += a * (int32_t)B_flat[brow_off + j];
      }
    }
  }
}

/* ========== KEY FIX: Skewed streaming for 4x4 systolic array ==========
   On global time t:
     - Inject row i with A[i, k=t-i] (if 0<=k<K else 0)
     - Inject col j with B[k=t-j, j] (if 0<=k<K else 0)
   Run for T = K + (rows-1) + (cols-1) = K + 6 steps. No separate flush.
*/
static void cfs_gemm_systolic_4xK_Kx4_skewed(const int8_t *A_flat,
                                             const int8_t *B_flat,
                                             int K) {
  cfs_clear();

  const int T = K + 6;  /* pipeline length includes natural flush */
  for (int t = 0; t < T; ++t) {
    int8_t a_in[4] = {0,0,0,0};
    int8_t b_in[4] = {0,0,0,0};

    /* A side: delay by row index i */
    for (int i = 0; i < 4; ++i) {
      int k = t - i;
      if (k >= 0 && k < K)
        a_in[i] = A_flat[i*LDA + k];
    }

    /* B side: delay by column index j */
    for (int j = 0; j < 4; ++j) {
      int k = t - j;
      if (k >= 0 && k < K)
        b_in[j] = B_flat[k*LDB + j];
    }

    /* Stage only the LSB; HW consumes LSB and shifts each STEP. */
    cfs_write(CFS_A0, pack4_s8(a_in[0], 0, 0, 0));
    cfs_write(CFS_A1, pack4_s8(a_in[1], 0, 0, 0));
    cfs_write(CFS_A2, pack4_s8(a_in[2], 0, 0, 0));
    cfs_write(CFS_A3, pack4_s8(a_in[3], 0, 0, 0));

    cfs_write(CFS_B0, pack4_s8(b_in[0], 0, 0, 0));
    cfs_write(CFS_B1, pack4_s8(b_in[1], 0, 0, 0));
    cfs_write(CFS_B2, pack4_s8(b_in[2], 0, 0, 0));
    cfs_write(CFS_B3, pack4_s8(b_in[3], 0, 0, 0));

    cfs_step();
  }
}

/* Pretty-print 4x4 int32 matrix */
static void print_i32_4x4(const char* name, const int32_t M[4][4]) {
  printf("%s:\n", name);
  for (int i = 0; i < 4; ++i) {
    for (int j = 0; j < 4; ++j) {
      printf("%6ld ", (long)M[i][j]);
    }
    printf("\n");
  }
}

/* Example data */
static void make_example(int8_t *A_flat, int8_t *B_flat, int *outK) {
  const int K = 8; /* choose any K up to MAXK */
  *outK = K;

  /* A[i,k] = (i+1)*(k-3) */
  for (int i = 0; i < 4; ++i) {
    for (int k = 0; k < K; ++k) {
      int v = (i + 1) * (k - 3);
      A_flat[i*LDA + k] = clamp_s8(v);
    }
    /* zero the rest up to MAXK (tidy) */
    for (int k = K; k < MAXK; ++k) {
      A_flat[i*LDA + k] = 0;
    }
  }

  /* B[k,j] = (j-2)*(5-k) */
  for (int k = 0; k < K; ++k) {
    for (int j = 0; j < 4; ++j) {
      int v = (j - 2) * (5 - k);
      B_flat[k*LDB + j] = clamp_s8(v);
    }
  }
}

int main(void) {
  /* Sanity check the ID register */
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID = 0x%08lX (expect 0xCAFEBABE)\n", (unsigned long)id);

  /* Test buffers */
  static int8_t  A_flat[4 * LDA];   /* 4 rows, each length MAXK */
  static int8_t  B_flat[MAXK * LDB];/* up to MAXK rows, each length 4 */
  int32_t C_hw[4][4];
  int32_t C_sw[4][4];
  int K;

  make_example(A_flat, B_flat, &K);

  /* Run hardware with skewed schedule */
  cfs_gemm_systolic_4xK_Kx4_skewed(A_flat, B_flat, K);

  /* Read HW result */
  cfs_read_C(C_hw);

  /* Reference */
  gemm_ref_4xK_Kx4(A_flat, B_flat, K, C_sw);

  /* Compare */
  int errors = 0;
  for (int i = 0; i < 4; ++i) {
    for (int j = 0; j < 4; ++j) {
      if (C_hw[i][j] != C_sw[i][j]) {
        ++errors;
      }
    }
  }

  print_i32_4x4("C (HW)", C_hw);
  print_i32_4x4("C (SW)", C_sw);

  if (errors == 0) {
    printf("Verdict: PASS (HW matches SW)\n");
  } else {
    printf("Verdict: FAIL (%d mismatches)\n", errors);
  }

  return (errors == 0) ? 0 : 1;
}

