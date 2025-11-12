#include <stdint.h>
#include <neorv32.h>

// ===== Replace base if needed =====
#ifndef NEORV32_CFS_BASE
#define NEORV32_CFS_BASE 0xFFFFF000u // <-- put YOUR CFS base here if BSP lacks the macro
#endif

#define CFS_BASE  NEORV32_CFS_BASE

#define REG_ID     0
#define REG_A0     1
#define REG_A1     2
#define REG_A2     3
#define REG_A3     4
#define REG_B0     5
#define REG_B1     6
#define REG_B2     7
#define REG_B3     8
#define REG_C00   16 // .. up to 31

static inline volatile uint32_t* CFS_REG(uint32_t w) {
  return (volatile uint32_t*)(CFS_BASE + (w << 2));
}

// CTL write: bit0=STEP, bit1=CLEAR
static inline void cfs_clear(void) { *CFS_REG(REG_ID) = 0x2; }
static inline void cfs_step(void)  { *CFS_REG(REG_ID) = 0x1; }

static inline void cfs_load_a_row(int r, uint32_t packed) { *CFS_REG(REG_A0 + r) = packed; }
static inline void cfs_load_b_col(int c, uint32_t packed) { *CFS_REG(REG_B0 + c) = packed; }
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(REG_C00 + (i*4 + j)); }

// Pack 4 int8 into 32b: [31:24]=b3 ... [7:0]=b0 (b0 is injected first)
static inline uint32_t pack_i8(int8_t b3, int8_t b2, int8_t b1, int8_t b0){
  return ((uint32_t)(uint8_t)b0) |
         ((uint32_t)(uint8_t)b1 << 8) |
         ((uint32_t)(uint8_t)b2 << 16)|
         ((uint32_t)(uint8_t)b3 << 24);
}

// 64-bit cycle/instret (works with Zicntr; falls back gracefully if high regs absent)
static inline uint64_t rdcycle64(void){
  uint32_t lo, hi0, hi1;
  asm volatile ("rdcycleh %0" : "=r"(hi0));
  asm volatile ("rdcycle  %0" : "=r"(lo));
  asm volatile ("rdcycleh %0" : "=r"(hi1));
  if (hi0 != hi1) { asm volatile ("rdcycle %0" : "=r"(lo)); hi0 = hi1; }
  return ((uint64_t)hi0 << 32) | lo;
}
static inline uint64_t rdinstret64(void){
  uint32_t lo, hi0, hi1;
  asm volatile ("rdinstreth %0" : "=r"(hi0));
  asm volatile ("rdinstret  %0" : "=r"(lo));
  asm volatile ("rdinstreth %0" : "=r"(hi1));
  if (hi0 != hi1) { asm volatile ("rdinstret %0" : "=r"(lo)); hi0 = hi1; }
  return ((uint64_t)hi0 << 32) | lo;
}

// C += A*B  (A,B: int8[4][4], C: int32[4][4])
void cfs_gemm_i8_4x4(const int8_t A[4][4], const int8_t B[4][4], int32_t C[4][4]) {
  uint32_t arow[4], bcol[4];
  for(int i=0;i<4;i++) arow[i] = pack_i8(A[i][3], A[i][2], A[i][1], A[i][0]);
  for(int j=0;j<4;j++) bcol[j] = pack_i8(B[3][j], B[2][j], B[1][j], B[0][j]);

  cfs_clear();

  cfs_load_a_row(0, arow[0]); cfs_load_a_row(1, arow[1]);
  cfs_load_a_row(2, arow[2]); cfs_load_a_row(3, arow[3]);
  cfs_load_b_col(0, bcol[0]); cfs_load_b_col(1, bcol[1]);
  cfs_load_b_col(2, bcol[2]); cfs_load_b_col(3, bcol[3]);

  for(int k=0;k<7;k++) cfs_step(); // rows+cols-1

  for(int i=0;i<4;i++)
    for(int j=0;j<4;j++)
      C[i][j] += cfs_read_c(i,j);
}

void run_cfs_microbench(void){
  uint32_t id = *CFS_REG(REG_ID); // expect 0xCAFEBABE
  neorv32_uart0_printf("CFS ID = 0x%x\n", id);

  int8_t A[4][4] = {
    {  1, -2,  3,  4}, { -5,  6, -7,  8},
    {  9, 10, 11,-12}, { -1, -1,  1,  1}
  };
  int8_t B[4][4] = {
    {  2,  0,  1,  3}, { -1,  4,  2,  0},
    {  5, -2,  2, -3}, {  1,  1,  0,  2}
  };
  int32_t C[4][4] = {0};

  uint64_t c0 = rdcycle64();
  uint64_t i0 = rdinstret64();

  cfs_gemm_i8_4x4(A,B,C);

  uint64_t c1 = rdcycle64();
  uint64_t i1 = rdinstret64();

  uint32_t cyc_lo = (uint32_t)(c1-c0), cyc_hi = (uint32_t)((c1-c0)>>32);
  uint32_t ins_lo = (uint32_t)(i1-i0), ins_hi = (uint32_t)((i1-i0)>>32);

  neorv32_uart0_printf("CFS cycles  = 0x%08x%08x\n", cyc_hi, cyc_lo);
  neorv32_uart0_printf("CFS instret = 0x%08x%08x\n", ins_hi, ins_lo);

  for(int i=0;i<4;i++){
    neorv32_uart0_printf("C[%d]: %ld %ld %ld %ld\n", i,
      (long)C[i][0], (long)C[i][1], (long)C[i][2], (long)C[i][3]);
  }
}

