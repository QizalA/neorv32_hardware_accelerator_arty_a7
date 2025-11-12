#pragma once
#include <stdint.h>

#ifndef CFS_BASE
#warning "CFS_BASE not defined; compile with -DCFS_BASE=0xFFEB0000u (or your map)"
#define CFS_BASE 0xFFEB0000u
#endif

#define CFS_REG(off) (*(volatile uint32_t *)((uintptr_t)(CFS_BASE + (off))))

static inline void cfs_clear(void) { CFS_REG(0x00) = (1u<<1); }   // bit1 = CLEAR
static inline void cfs_step(void)  { CFS_REG(0x00) = (1u<<0); }   // bit0 = STEP
static inline uint32_t cfs_id(void){ return CFS_REG(0x00); }      // readback 0xCAFEBABE

// Pack 4 signed bytes into a 32-bit word with k=0 in LSB (matches your VHDL shift)
static inline uint32_t pack_s8_4(const int8_t v[4]) {
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

static inline void cfs_load_B_cols_from_rowmajor(const int8_t B[4][4]) {
  int8_t bc[4];
  bc[0]=B[0][0]; bc[1]=B[1][0]; bc[2]=B[2][0]; bc[3]=B[3][0]; CFS_REG(0x14)=pack_s8_4(bc);
  bc[0]=B[0][1]; bc[1]=B[1][1]; bc[2]=B[2][1]; bc[3]=B[3][1]; CFS_REG(0x18)=pack_s8_4(bc);
  bc[0]=B[0][2]; bc[1]=B[1][2]; bc[2]=B[2][2]; bc[3]=B[3][2]; CFS_REG(0x1C)=pack_s8_4(bc);
  bc[0]=B[0][3]; bc[1]=B[1][3]; bc[2]=B[2][3]; bc[3]=B[3][3]; CFS_REG(0x20)=pack_s8_4(bc);
}

static inline void cfs_read_C(int32_t C[4][4]) {
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) {
    uint32_t w = CFS_REG(0x40 + 4*((i*4)+j));
    C[i][j] = (int32_t)w; // already signed 32-bit in HW
  }
}

// One 4×4×4 tile: CLEAR, load A/B, 4 inject + 3 drain = 7 steps, read C.
static inline void cfs_gemm4x4_i8_run(const int8_t A[4][4], const int8_t B[4][4], int32_t C[4][4]) {
  cfs_clear();
  cfs_load_A_rows(A);
  cfs_load_B_cols_from_rowmajor(B);
  for (int i=0;i<7;i++) cfs_step();   // 4 inject + 3 drain (wavefront)
  cfs_read_C(C);
}

