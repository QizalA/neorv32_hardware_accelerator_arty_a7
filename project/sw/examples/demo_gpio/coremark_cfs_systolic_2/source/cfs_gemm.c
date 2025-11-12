#include "cfs_gemm.h"
#include <stdint.h>

// Software reference (int8*int8 -> int32)
void sw_gemm_4x4_i8i32(const int8_t A[4][4], const int8_t B[4][4], int32_t C[4][4]) {
  for (int i=0;i<4;i++){
    for (int j=0;j<4;j++){
      int32_t acc = 0;
      for (int k=0;k<4;k++){
        acc += (int32_t)A[i][k] * (int32_t)B[k][j];
      }
      C[i][j] = acc;
    }
  }
}

int diff_4x4_i32(const int32_t X[4][4], const int32_t Y[4][4]) {
  int mism=0;
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) if (X[i][j]!=Y[i][j]) mism++;
  return mism;
}

