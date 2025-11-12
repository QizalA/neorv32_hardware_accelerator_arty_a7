#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

/* =======================
   Config
   ======================= */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u   /* set to your actual CFS MMIO base if different */
#endif

#define N       256     /* matrix size: 256x256 */
#define TILE    4       /* CFS tile is 4x4 */
#define MAXK    N       /* stride for flat A (must be >= N) */
#define LDA     (MAXK)  /* A_flat: 4 rows x MAXK cols */
#define LDB     (4)     /* B_flat: MAXK rows x 4 cols */
#define DO_SW   1       /* set to 0 to skip the software path if it's too slow */

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
   Patterns (small deterministic ints)
   ======================= */
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }

/* =======================
   Systolic streaming (skewed, packed per 4 STEPs)
   ======================= */
static void cfs_gemm_systolic_4xK_Kx4_skewed_packed4(const int8_t *A_flat,
                                                     const int8_t *B_flat,
                                                     int K) {
  cfs_clear();
  const int T = K + 6;  /* total STEPs = K + (4-1)+(4-1) */

  for (int t = 0; t < T; t += 4) {
    int8_t a_bytes[TILE][4] = {{0}};
    int8_t b_bytes[TILE][4] = {{0}};

    /* Build 4-step packets with skew:
       A row i uses k=(t+s)-i; B col j uses k=(t+s)-j */
    for (int i = 0; i < TILE; ++i)
      for (int s = 0; s < 4; ++s) {
        int k = (t + s) - i;
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
      }
    for (int j = 0; j < TILE; ++j)
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

/* Read C[4x4] tile */
static void cfs_read_C_tile(int32_t C4[TILE][TILE]) {
  for (int i = 0; i < TILE; ++i)
    for (int j = 0; j < TILE; ++j)
      C4[i][j] = (int32_t)cfs_read(CFS_C0 + i*TILE + j);
}

/* =======================
   CFS full GEMM 256×256 -> checksum
   ======================= */
static int64_t cfs_gemm_256_checksum(uint64_t* out_cycles, uint64_t* out_instret) {
  static int8_t  A_flat[TILE * LDA]; /* 4 x 256 */
  static int8_t  B_flat[MAXK * LDB]; /* 256 x 4 */
  static int32_t C4[TILE][TILE];
  int64_t checksum = 0;

  uint64_t c0 = rdcycle(), i0 = rdinstret();

  for (int i0 = 0; i0 < N; i0 += TILE) {
    /* Prepare 4 A rows once per tile-row */
    for (int r = 0; r < TILE; ++r)
      for (int k = 0; k < N; ++k)
        A_flat[r*LDA + k] = pattA(i0 + r, k);

    for (int j0 = 0; j0 < N; j0 += TILE) {
      /* Prepare 4 B columns for this tile */
      for (int k = 0; k < N; ++k) {
        B_flat[k*LDB + 0] = pattB(k, j0 + 0);
        B_flat[k*LDB + 1] = pattB(k, j0 + 1);
        B_flat[k*LDB + 2] = pattB(k, j0 + 2);
        B_flat[k*LDB + 3] = pattB(k, j0 + 3);
      }

      cfs_gemm_systolic_4xK_Kx4_skewed_packed4(A_flat, B_flat, /*K=*/N);
      cfs_read_C_tile(C4);

      for (int r = 0; r < TILE; ++r)
        for (int c = 0; c < TILE; ++c)
          checksum += (int64_t)C4[r][c];
    }
  }

  uint64_t i1 = rdinstret(), c1 = rdcycle();
  *out_cycles  = c1 - c0;
  *out_instret = i1 - i0;
  return checksum;
}

/* =======================
   SW full GEMM 256×256 -> checksum (no big buffers)
   ======================= */
static int64_t sw_gemm_256_checksum(uint64_t* out_cycles, uint64_t* out_instret) {
  int64_t checksum = 0;

  uint64_t c0 = rdcycle(), i0 = rdinstret();

  for (int i = 0; i < N; ++i) {
    for (int j = 0; j < N; ++j) {
      int32_t s = 0;
      for (int k = 0; k < N; ++k) {
        s += (int32_t)pattA(i, k) * (int32_t)pattB(k, j);
      }
      checksum += (int64_t)s;
    }
  }

  uint64_t i1 = rdinstret(), c1 = rdcycle();
  *out_cycles  = c1 - c0;
  *out_instret = i1 - i0;
  return checksum;
}

/* =======================
   Fixed-point printer (X.YYYx)
   ======================= */
static void print_speedup_fixed(uint64_t num, uint64_t den) {
  if (!den) { printf("    n/a    "); return; }
  uint64_t s = (num * 1000ull + den/2) / den;
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}

/* =======================
   Main
   ======================= */
int main(void) {
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));

  uint64_t sw_cyc = 0, sw_ins = 0, cfs_cyc = 0, cfs_ins = 0;
  int64_t  sw_sum = 0, cfs_sum = 0;

#if DO_SW
  sw_sum = sw_gemm_256_checksum(&sw_cyc, &sw_ins);
#else
  printf("(SW path disabled; define DO_SW=1 to enable.)\n");
#endif

  cfs_sum = cfs_gemm_256_checksum(&cfs_cyc, &cfs_ins);

  /* Compare checksums if both were computed */
  int ok = (!DO_SW) ? 1 : (sw_sum == cfs_sum);

  /* Totals and speedups */
  printf("GEMM 256x256 comparison (int8 -> int32)\n");
  printf("Path |        cycles |       instret |  Speedup(cyc) | Speedup(inst) |    checksum\n");
  printf("-----+---------------+---------------+---------------+---------------+-------------\n");
#if DO_SW
  printf(" SW  | %13" PRIu64 " | %13" PRIu64 " |       --      |       --      | %11lld\n",
         sw_cyc, sw_ins, (long long)sw_sum);
#endif
  printf(" CFS | %13" PRIu64 " | %13" PRIu64 " |    ", cfs_cyc, cfs_ins);
#if DO_SW
  print_speedup_fixed(sw_cyc, cfs_cyc);  printf("     |    ");
  print_speedup_fixed(sw_ins, cfs_ins);  printf("     | %11lld\n", (long long)cfs_sum);
#else
  printf("     n/a     |       n/a    | %11lld\n", (long long)cfs_sum);
#endif

  /* Optional efficiency: cycles per MAC for each path (MACs = N^3) */
  uint64_t macs = (uint64_t)N*(uint64_t)N*(uint64_t)N; /* 16,777,216 */
  if (macs) {
#if DO_SW
    uint64_t sw_cpM = (sw_cyc * 1000ull + macs/2) / macs;
    printf("\nCycles/MAC (x1000): SW=%" PRIu64 ".%03" PRIu64, sw_cpM/1000, sw_cpM%1000);
#else
    printf("\nCycles/MAC (x1000): SW=n/a");
#endif
    uint64_t cf_cpM = (cfs_cyc * 1000ull + macs/2) / macs;
    printf("  CFS=%" PRIu64 ".%03" PRIu64 "\n", cf_cpM/1000, cf_cpM%1000);
  }

  printf("\nVerdict: %s\n", ok ? "PASS (checksums match)" : "FAIL (checksums differ)");
  printf("Tip: If SW is too slow, temporarily set N=128 or DO_SW=0 to profile the CFS path only.\n");
  return ok ? 0 : 1;
}

