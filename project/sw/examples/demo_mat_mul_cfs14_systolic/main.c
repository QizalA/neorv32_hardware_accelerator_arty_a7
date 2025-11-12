#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

/* =======================
   Config
   ======================= */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u   /* set to your actual CFS MMIO base if different */
#endif

#define MAXK 256       /* max K to test */
#define LDA  (MAXK)    /* A is 4 x MAXK (row-major) */
#define LDB  (4)       /* B is K x 4   (row-major)  */

/* List of K values to sweep */
static const int Ks[] = {4, 8, 16, 32, 64, 128};
#define NUM_KS (int)(sizeof(Ks)/sizeof(Ks[0]))

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
   RV CSR timing (RV32/RV64, no FP/heap)
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
   Systolic streaming (skewed, packed per 4 STEPs)
   ======================= */
static void cfs_gemm_systolic_4xK_Kx4_skewed_packed4(const int8_t *A_flat,
                                                     const int8_t *B_flat,
                                                     int K) {
  cfs_clear();
  const int T = K + 6;  /* total STEPs = K + (4-1)+(4-1) */

  for (int t = 0; t < T; t += 4) {
    int8_t a_bytes[4][4] = {{0}};
    int8_t b_bytes[4][4] = {{0}};

    /* Build 4-step packets with proper skew:
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

    /* Stage one 32b word per row/col (LSB = first slice to consume) */
    cfs_write(CFS_A0, pack4_s8(a_bytes[0][0], a_bytes[0][1], a_bytes[0][2], a_bytes[0][3]));
    cfs_write(CFS_A1, pack4_s8(a_bytes[1][0], a_bytes[1][1], a_bytes[1][2], a_bytes[1][3]));
    cfs_write(CFS_A2, pack4_s8(a_bytes[2][0], a_bytes[2][1], a_bytes[2][2], a_bytes[2][3]));
    cfs_write(CFS_A3, pack4_s8(a_bytes[3][0], a_bytes[3][1], a_bytes[3][2], a_bytes[3][3]));

    cfs_write(CFS_B0, pack4_s8(b_bytes[0][0], b_bytes[0][1], b_bytes[0][2], b_bytes[0][3]));
    cfs_write(CFS_B1, pack4_s8(b_bytes[1][0], b_bytes[1][1], b_bytes[1][2], b_bytes[1][3]));
    cfs_write(CFS_B2, pack4_s8(b_bytes[2][0], b_bytes[2][1], b_bytes[2][2], b_bytes[2][3]));
    cfs_write(CFS_B3, pack4_s8(b_bytes[3][0], b_bytes[3][1], b_bytes[3][2], b_bytes[3][3]));

    /* Advance 4 steps (or the remaining few at the end) */
    int steps = (t + 4 <= T) ? 4 : (T - t);
    for (int s = 0; s < steps; ++s) cfs_step();
  }
}

/* =======================
   Core ops
   ======================= */

/* Read C[4x4] row-major from CFS into dst[4][4] (int32) */
static void cfs_read_C(int32_t C[4][4]) {
  for (int i = 0; i < 4; ++i)
    for (int j = 0; j < 4; ++j)
      C[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
}

/* SW reference: C = A(4xK) * B(Kx4), int8 × int8 -> int32 */
static void gemm_ref_4xK_Kx4(const int8_t *A, const int8_t *B, int K, int32_t C[4][4]) {
  for (int i = 0; i < 4; ++i)
    for (int j = 0; j < 4; ++j)
      C[i][j] = 0;

  for (int i = 0; i < 4; ++i) {
    const int aoff = i * LDA;
    for (int k = 0; k < K; ++k) {
      int32_t a = (int32_t)A[aoff + k];
      const int boff = k * LDB;
      C[i][0] += a * (int32_t)B[boff + 0];
      C[i][1] += a * (int32_t)B[boff + 1];
      C[i][2] += a * (int32_t)B[boff + 2];
      C[i][3] += a * (int32_t)B[boff + 3];
    }
  }
}

/* Deterministic small signed data (keeps values in -8..7) */
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }

/* Print fixed-point speedup (no floats): (num/den) as X.YYYx */
static void print_speedup_fixed(const char* label, uint64_t num, uint64_t den) {
  if (!den) { printf("%s: n/a\n", label); return; }
  uint64_t scaled = (num * 1000ull + den/2) / den; /* rounded */
  printf("%s: %" PRIu64 ".%03" PRIu64 "x", label, scaled/1000ull, scaled%1000ull);
}

/* Compare 4x4 results */
static int cmp_4x4(const int32_t A[4][4], const int32_t B[4][4]) {
  for (int i = 0; i < 4; ++i)
    for (int j = 0; j < 4; ++j)
      if (A[i][j] != B[i][j]) return 0;
  return 1;
}

/* =======================
   Main
   ======================= */
int main(void) {
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);

  /* Shared flat buffers */
  static int8_t  A_flat[4 * LDA];   /* 4 rows, MAXK columns */
  static int8_t  B_flat[MAXK * LDB];/* up to MAXK rows, 4 columns */
  static int32_t C_sw[4][4], C_hw[4][4];

  printf(" K |   SW cycles |  CFS cycles |   SW inst |  CFS inst |   Speedup(cyc)   Speedup(ins)   Result\n");
  printf("----+------------+-------------+-----------+-----------+-----------------+--------------+--------\n");

  for (int idx = 0; idx < NUM_KS; ++idx) {
    int K = Ks[idx];
    if (K > MAXK) continue;

    /* Fill patterns */
    for (int i = 0; i < 4; ++i) {
      for (int k = 0; k < K; ++k) {
        A_flat[i*LDA + k] = pattA(i, k);
      }
      for (int k = K; k < MAXK; ++k) A_flat[i*LDA + k] = 0;
    }
    for (int k = 0; k < K; ++k) {
      B_flat[k*LDB + 0] = pattB(k, 0);
      B_flat[k*LDB + 1] = pattB(k, 1);
      B_flat[k*LDB + 2] = pattB(k, 2);
      B_flat[k*LDB + 3] = pattB(k, 3);
    }

    /* Time SW */
    uint64_t c0 = rdcycle(), i0 = rdinstret();
    gemm_ref_4xK_Kx4(A_flat, B_flat, K, C_sw);
    uint64_t i1 = rdinstret(), c1 = rdcycle();
    uint64_t sw_cyc = c1 - c0, sw_ins = i1 - i0;

    /* Time CFS */
    c0 = rdcycle(); i0 = rdinstret();
    cfs_gemm_systolic_4xK_Kx4_skewed_packed4(A_flat, B_flat, K);
    i1 = rdinstret(); c1 = rdcycle();
    uint64_t cfs_cyc = c1 - c0, cfs_ins = i1 - i0;

    /* Read HW and verify */
    cfs_read_C(C_hw);
    int ok = cmp_4x4(C_hw, C_sw);

    /* Line: K, cycles, inst, speedups, result */
    printf("%3d | %10" PRIu64 " | %11" PRIu64 " | %9" PRIu64 " | %9" PRIu64 " | ",
           K, sw_cyc, cfs_cyc, sw_ins, cfs_ins);
    print_speedup_fixed("", sw_cyc, cfs_cyc);   printf("   ");
    print_speedup_fixed("", sw_ins, cfs_ins);   printf("   ");
    printf("%s\n", ok ? "PASS" : "FAIL");
  }

  printf("\nNote:\n");
  printf("- For small K, SW may win due to MMIO and pipeline flush (+6 steps).\n");
  printf("- As K grows, CFS amortizes overhead: total steps = K + 6, doing 16 MACs/step.\n");
  printf("- To reduce MMIO further, add an on-CFS step sequencer (GO+LEN) or small FIFOs.\n");
  return 0;
}

