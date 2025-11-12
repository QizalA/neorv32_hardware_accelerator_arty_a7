#pragma once
#include <stdint.h>

#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u
#endif

#define CFS_REG(off) (*(volatile uint32_t *)((uintptr_t)(CFS_BASE + (off))))

static inline void cfs_clear(void) { CFS_REG(0x00) = (1u<<1); }   // CLEAR
static inline void cfs_step(void)  { CFS_REG(0x00) = (1u<<0); }   // STEP
static inline uint32_t cfs_id(void){ return CFS_REG(0x00); }      // 0xCAFEBABE

static inline uint32_t pack_s8_4(const int8_t v[4]) {
  // LSB-first: k=0 byte in LSB (matches your VHDL consumption of [7:0])
  return ((uint32_t)(uint8_t)v[0]) |
         ((uint32_t)(uint8_t)v[1] << 8) |
         ((uint32_t)(uint8_t)v[2] << 16) |
         ((uint32_t)(uint8_t)v[3] << 24);
}

static inline void cfs_load_A_rows(const int8_t A[4][4]) {
  CFS_REG(0x04) = pack_s8_4(A[0]);
  CFS_REG(0x08) = pack_s8_4(A[1]);
  CFS_REG(0x0C) = pack_s8_4(A[2]);
  CFS_REG(0x10) = pack_s8_4(A[3]);
}

static inline void cfs_load_B_cols_from_B(const int8_t B[4][4]) {
  int8_t c[4];
  c[0]=B[0][0]; c[1]=B[1][0]; c[2]=B[2][0]; c[3]=B[3][0]; CFS_REG(0x14)=pack_s8_4(c);
  c[0]=B[0][1]; c[1]=B[1][1]; c[2]=B[2][1]; c[3]=B[3][1]; CFS_REG(0x18)=pack_s8_4(c);
  c[0]=B[0][2]; c[1]=B[1][2]; c[2]=B[2][2]; c[3]=B[3][2]; CFS_REG(0x1C)=pack_s8_4(c);
  c[0]=B[0][3]; c[1]=B[1][3]; c[2]=B[2][3]; c[3]=B[3][3]; CFS_REG(0x20)=pack_s8_4(c);
}

static inline void cfs_read_C(int32_t C[4][4]) {
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
    uint32_t w = CFS_REG(0x40 + 4*((i*4)+j));
    C[i][j] = (int32_t)w;
  }
}

/* Final: one 4×4×4 tile — CLEAR, load, 10 steps, read C */
static inline void cfs_gemm4x4_i8_run(const int8_t A[4][4], const int8_t B[4][4], int32_t C[4][4]) {
  cfs_clear();
  cfs_load_A_rows(A);
  cfs_load_B_cols_from_B(B);
  for (int s=0; s<10; s++) cfs_step();  // K + (M-1) + (N-1) = 10
  cfs_read_C(C);
}

