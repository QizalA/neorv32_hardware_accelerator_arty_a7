#include <stdint.h>
#include "cfs_gemm.h"
#include "coremark.h"   // macros: ee_printf, start_time/stop_time/get_time/time_in_secs

#ifndef COREMARK_MINIMAL_PRINT
#define COREMARK_MINIMAL_PRINT 0
#endif

extern void sw_gemm_4x4_i8i32(const int8_t A[4][4], const int8_t B[4][4], int32_t C[4][4]);
extern int  diff_4x4_i32(const int32_t X[4][4], const int32_t Y[4][4]);

static void fill_test(int8_t A[4][4], int8_t B[4][4]) {
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
    A[i][j] = (int8_t)((i*3 + j*5) - 6);
    B[i][j] = (int8_t)((i*7 - j*2) + 3);
  }
}

int run_cfs_gemm_demo(void) {
#if !COREMARK_MINIMAL_PRINT
  ee_printf("\n=== CFS GEMM DEMO ===\n");
  ee_printf("[CFS] Base 0x%08x\n", (unsigned)CFS_BASE);
#endif

  uint32_t id = cfs_id();
#if !COREMARK_MINIMAL_PRINT
  ee_printf("[CFS] ID 0x%08x\n", (unsigned)id);
#endif

  int8_t   A[4][4], B[4][4];
  int32_t  C_hw[4][4], C_sw[4][4];
  fill_test(A,B);

  // Functional check
  cfs_gemm4x4_i8_run(A,B,C_hw);
  sw_gemm_4x4_i8i32(A,B,C_sw);
  int mism = diff_4x4_i32(C_hw, C_sw);
#if !COREMARK_MINIMAL_PRINT
  ee_printf("[CFS] Verify %s\n", mism ? "FAIL" : "PASS");
#endif
  if (mism) return -1;

  // Timed run
  const int tiles = 1000;
  start_time();
  for (int t=0; t<tiles; t++) cfs_gemm4x4_i8_run(A,B,C_hw);
  stop_time();

  CORE_TICKS ticks = get_time();
#if !COREMARK_MINIMAL_PRINT
  double secs = time_in_secs(ticks);
  ee_printf("[CFS] %d tiles in %ld ticks (%.6f s)  [NOT a CoreMark score]\n",
            tiles, (long)ticks, secs);
#endif
  return 0;
}

