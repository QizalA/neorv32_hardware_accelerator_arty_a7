// source/cfs_demo.c
#include <stdint.h>
#include "cfs_gemm.h"
#include "coremark.h"

#ifndef COREMARK_MINIMAL_PRINT
#define COREMARK_MINIMAL_PRINT 1
#endif

/* ========= Tiny 4x4x4 int8->int32 SW GEMM and helpers (no floats) ========= */
static void sw_gemm_4x4_i8i32(const int8_t A[4][4],
                              const int8_t B[4][4],
                              int32_t C[4][4]) {
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
    int32_t acc=0; for (int k=0;k<4;k++) acc += (int32_t)A[i][k]*(int32_t)B[k][j];
    C[i][j]=acc;
  }
}

static int diff_4x4(const int32_t X[4][4], const int32_t Y[4][4]) {
  int m=0; for (int i=0;i<4;i++) for (int j=0;j<4;j++) if (X[i][j]!=Y[i][j]) m++; return m;
}

static void fill_test(int8_t A[4][4], int8_t B[4][4]) {
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
    A[i][j] = (int8_t)((i*3 + j*5) - 6);
    B[i][j] = (int8_t)((i*7 - j*2) + 3);
  }
}

/* ====== Run N tiles and return CoreMark raw ticks (≈ cycles on your port) ====== */
static CORE_TICKS run_cfs_tiles_get_ticks(int tiles,
                                          const int8_t A[4][4],
                                          const int8_t B[4][4],
                                          int32_t C[4][4]) {
  start_time();
  for (int t=0; t<tiles; t++) cfs_gemm4x4_i8_run(A,B,C);
  stop_time();
  return get_time();
}

static CORE_TICKS run_sw_tiles_get_ticks(int tiles,
                                         const int8_t A[4][4],
                                         const int8_t B[4][4],
                                         int32_t C[4][4]) {
  start_time();
  for (int t=0; t<tiles; t++) sw_gemm_4x4_i8i32(A,B,C);
  stop_time();
  return get_time();
}

/* =============================== Demo / Compare =============================== */
int run_cfs_gemm_demo(void) {
  int8_t  A[4][4], B[4][4];
  int32_t Cref[4][4], Chw[4][4], Ctmp[4][4];

#if !COREMARK_MINIMAL_PRINT
  ee_printf("\n=== CFS GEMM DEMO ===\n");
  ee_printf("[CFS] Base 0x%08lu  ID 0x%08lu\n",
            (unsigned long)CFS_BASE, (unsigned long)cfs_id());
#endif

  /* Prepare inputs & reference */
  fill_test(A,B);
  sw_gemm_4x4_i8i32(A,B,Cref);

  /* Hardware tile once for correctness */
  cfs_gemm4x4_i8_run(A,B,Chw);
  if (diff_4x4(Chw, Cref)) { ee_printf("CFS: VERIFY FAIL (mismatch)\n"); return -1; }
#if !COREMARK_MINIMAL_PRINT
  ee_printf("CFS: VERIFY PASS\n");
#else
  ee_printf("CFS: PASS\n");
#endif

  /* Warm-ups (not timed) */
  for (int t=0; t<32; t++) { cfs_gemm4x4_i8_run(A,B,Chw); sw_gemm_4x4_i8i32(A,B,Ctmp); }

  /* ---- Measure CFS: scale tiles until we see >0 ticks ---- */
  int tiles_cfs = 256;
  CORE_TICKS tk_cfs = 0;
  for (int tries = 0; tries < 12; tries++) {
    tk_cfs = run_cfs_tiles_get_ticks(tiles_cfs, A, B, Chw);
    if (tk_cfs > 0) break;
    tiles_cfs <<= 1;
  }
  uint32_t cfs_cyc_per_tile = (tiles_cfs > 0) ? (uint32_t)((uint64_t)tk_cfs / (uint64_t)tiles_cfs) : 0u;
  uint32_t cfs_cyc_per_step = cfs_cyc_per_tile / 10u; /* 10 systolic steps per tile */

  ee_printf("CFS: %lu cycles/tile  (~%lu cycles/step)  [tiles=%d, ticks=%lu]\n",
            (unsigned long)cfs_cyc_per_tile,
            (unsigned long)cfs_cyc_per_step,
            tiles_cfs, (unsigned long)tk_cfs);

  /* ---- Measure SW (vanilla CPU): same method ---- */
  int tiles_sw = 256;
  CORE_TICKS tk_sw = 0;
  for (int tries = 0; tries < 12; tries++) {
    tk_sw = run_sw_tiles_get_ticks(tiles_sw, A, B, Ctmp);
    if (tk_sw > 0) break;
    tiles_sw <<= 1;
  }
  uint32_t sw_cyc_per_tile = (tiles_sw > 0) ? (uint32_t)((uint64_t)tk_sw / (uint64_t)tiles_sw) : 0u;
  uint32_t sw_cyc_per_mac  = sw_cyc_per_tile / 64u; /* 64 MACs per tile */

  ee_printf("SW : %lu cycles/tile  (~%lu cycles/MAC)  [tiles=%d, ticks=%lu]\n",
            (unsigned long)sw_cyc_per_tile,
            (unsigned long)sw_cyc_per_mac,
            tiles_sw, (unsigned long)tk_sw);

  /* ---- Speedup (SW/CFS) as fixed-point x10 (no floats) ---- */
  if (cfs_cyc_per_tile > 0) {
    uint32_t x10 = (uint32_t)(( (uint64_t)sw_cyc_per_tile * 10ull ) / (uint64_t)cfs_cyc_per_tile);
    ee_printf("Speedup (SW/CFS) : %lu.%lux\n", (unsigned long)(x10/10), (unsigned long)(x10%10));
  }

#ifdef CFS_CPU_HZ
  /* Optional: Throughput (MMAC/s), integer only, using known CPU clock */
  if (cfs_cyc_per_tile > 0) {
    uint32_t tiles_per_sec_cfs = (uint32_t)((uint64_t)CFS_CPU_HZ / (uint64_t)cfs_cyc_per_tile);
    uint32_t mmacs_cfs = (tiles_per_sec_cfs * 64u) / 1000000u;
    ee_printf("CFS throughput   : %lu MMAC/s @ %lu Hz\n",
              (unsigned long)mmacs_cfs, (unsigned long)CFS_CPU_HZ);
  }
  if (sw_cyc_per_tile > 0) {
    uint32_t tiles_per_sec_sw = (uint32_t)((uint64_t)CFS_CPU_HZ / (uint64_t)sw_cyc_per_tile);
    uint32_t mmacs_sw = (tiles_per_sec_sw * 64u) / 1000000u;
    ee_printf("SW  throughput   : %lu MMAC/s @ %lu Hz\n",
              (unsigned long)mmacs_sw, (unsigned long)CFS_CPU_HZ);
  }
#endif

  return 0;
}

