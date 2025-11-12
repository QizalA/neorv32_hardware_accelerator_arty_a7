#include <neorv32.h>
#include <stdint.h>

/* ===========================================================
   CFS base address
   If BSP defines NEORV32_CFS_BASE it will be used.
   Otherwise set the fallback below to your mapped CFS base.
   =========================================================== */
#ifndef NEORV32_CFS_BASE
#define NEORV32_CFS_BASE 0xFFFFF000u  // <-- change if your CFS base differs
#endif

/* =========================
   CFS register word offsets
   ========================= */
#define CFS_REG_ID      0  // read: 0xCAFEBABE; write: CTL (bit0=STEP, bit1=CLEAR)
#define CFS_REG_A0      1
#define CFS_REG_A1      2
#define CFS_REG_A2      3
#define CFS_REG_A3      4
#define CFS_REG_B0      5
#define CFS_REG_B1      6
#define CFS_REG_B2      7
#define CFS_REG_B3      8
#define CFS_REG_C00    16  // .. up to 31 (C[3][3])

static inline volatile uint32_t* CFS_REG(uint32_t w) {
  return (volatile uint32_t*)(NEORV32_CFS_BASE + (w << 2));
}

/* ===========================
   Minimal helpers / utilities
   =========================== */

// NEORV32 mini-printf has no width/length; print 32-bit hex by hand.
static void uart0_print_hex32(uint32_t v) {
  for (int i = 7; i >= 0; i--) {
    uint32_t nib = (v >> (i*4)) & 0xF;
    char c = (nib < 10) ? ('0' + nib) : ('a' + (nib - 10));
    neorv32_uart0_putc(c);
  }
}

// 64-bit cycle counter via CSRs (Zicntr)
static inline uint64_t read_mcycle64(void){
  uint32_t hi0 = neorv32_cpu_csr_read(CSR_MCYCLEH);
  uint32_t lo  = neorv32_cpu_csr_read(CSR_MCYCLE);
  uint32_t hi1 = neorv32_cpu_csr_read(CSR_MCYCLEH);
  if (hi0 != hi1) { lo = neorv32_cpu_csr_read(CSR_MCYCLE); hi0 = hi1; }
  return ((uint64_t)hi0 << 32) | lo;
}

// 64-bit instret via CSRs
static inline uint64_t read_minstret64(void){
  uint32_t hi0 = neorv32_cpu_csr_read(CSR_MINSTRETH);
  uint32_t lo  = neorv32_cpu_csr_read(CSR_MINSTRET);
  uint32_t hi1 = neorv32_cpu_csr_read(CSR_MINSTRETH);
  if (hi0 != hi1) { lo = neorv32_cpu_csr_read(CSR_MINSTRET); hi0 = hi1; }
  return ((uint64_t)hi0 << 32) | lo;
}

// Pack 4 int8 into a 32-bit word: [31:24]=b3 ... [7:0]=b0 (b0 injected first)
static inline uint32_t pack_i8(int8_t b3, int8_t b2, int8_t b1, int8_t b0){
  return ((uint32_t)(uint8_t)b0) |
         ((uint32_t)(uint8_t)b1 << 8) |
         ((uint32_t)(uint8_t)b2 << 16)|
         ((uint32_t)(uint8_t)b3 << 24);
}

/* ===========
   CFS control
   =========== */

// CTL write at word 0: bit0=STEP, bit1=CLEAR
static inline void cfs_clear(void) { *CFS_REG(CFS_REG_ID) = 0x2; }
static inline void cfs_step(void)  { *CFS_REG(CFS_REG_ID) = 0x1; }

static inline void cfs_load_a_row(int r, uint32_t packed) { *CFS_REG(CFS_REG_A0 + (uint32_t)r) = packed; }
static inline void cfs_load_b_col(int c, uint32_t packed) { *CFS_REG(CFS_REG_B0 + (uint32_t)c) = packed; }
static inline int32_t cfs_read_c(int i, int j) { return (int32_t)*CFS_REG(CFS_REG_C00 + (uint32_t)(i*4 + j)); }

/* ==========================================
   Single 4x4 int8 GEMM: C += A * B (int32 C)
   Updated RTL supports simple: load → STEPS → read
   ========================================== */
#define P_DIM 4
#define Q_DIM 4
#define K_DIM 4

static void cfs_gemm_i8_4x4(const int8_t A[4][4], const int8_t B[4][4], int32_t C[4][4]) {
  uint32_t arow[4], bcol[4];

  // Pack rows/cols so LSB is the first injected byte
  for (int i = 0; i < 4; i++)
    arow[i] = pack_i8(A[i][3], A[i][2], A[i][1], A[i][0]);
  for (int j = 0; j < 4; j++)
    bcol[j] = pack_i8(B[3][j], B[2][j], B[1][j], B[0][j]);

  cfs_clear();

  // Stage inputs
  cfs_load_a_row(0, arow[0]); cfs_load_a_row(1, arow[1]);
  cfs_load_a_row(2, arow[2]); cfs_load_a_row(3, arow[3]);
  cfs_load_b_col(0, bcol[0]); cfs_load_b_col(1, bcol[1]);
  cfs_load_b_col(2, bcol[2]); cfs_load_b_col(3, bcol[3]);

  // Total steps for full flush: K + (P-1) + (Q-1) = 10
  const int STEPS = K_DIM + (P_DIM-1) + (Q_DIM-1);
  for (int k = 0; k < STEPS; k++) cfs_step();

  // Read back
  for (int i = 0; i < 4; i++)
    for (int j = 0; j < 4; j++)
      C[i][j] += cfs_read_c(i, j);
}

/* ===========================
   CPU reference (for verify)
   =========================== */
static void cpu_gemm_i8_4x4(const int8_t A[4][4], const int8_t B[4][4], int32_t C[4][4]){
  for (int i=0;i<4;i++)
    for (int j=0;j<4;j++) {
      int32_t s = 0;
      for (int k=0;k<4;k++) s += (int32_t)A[i][k] * (int32_t)B[k][j];
      C[i][j] = s;
    }
}

/* ==================
   Micro-bench driver
   ================== */
static void run_cfs_microbench(void){
  // Sanity: ID
  uint32_t id = *CFS_REG(CFS_REG_ID);
  neorv32_uart0_puts("CFS ID = 0x"); uart0_print_hex32(id); neorv32_uart0_puts("\n");

  // Example data
  int8_t A[4][4] = {
    {  1, -2,  3,  4},
    { -5,  6, -7,  8},
    {  9, 10, 11,-12},
    { -1, -1,  1,  1}
  };
  int8_t B[4][4] = {
    {  2,  0,  1,  3},
    { -1,  4,  2,  0},
    {  5, -2,  2, -3},
    {  1,  1,  0,  2}
  };
  int32_t C_hw[4][4] = {0};
  int32_t C_sw[4][4] = {0};

  // Measure HW
  uint64_t c0 = read_mcycle64();
  uint64_t i0 = read_minstret64();

  cfs_gemm_i8_4x4(A, B, C_hw);

  uint64_t c1 = read_mcycle64();
  uint64_t i1 = read_minstret64();

  uint64_t dcyc = c1 - c0, dins = i1 - i0;

  neorv32_uart0_puts("CFS cycles  = 0x");
  uart0_print_hex32((uint32_t)(dcyc >> 32)); uart0_print_hex32((uint32_t)dcyc); neorv32_uart0_puts("\n");
  neorv32_uart0_puts("CFS instret = 0x");
  uart0_print_hex32((uint32_t)(dins >> 32)); uart0_print_hex32((uint32_t)dins); neorv32_uart0_puts("\n");

  // Verify against CPU reference
  cpu_gemm_i8_4x4(A, B, C_sw);

  int mism = 0;
  for (int i=0;i<4;i++) {
    neorv32_uart0_printf("C_hw[%u]: %i %i %i %i\n", (unsigned)i,
      (int)C_hw[i][0], (int)C_hw[i][1], (int)C_hw[i][2], (int)C_hw[i][3]);
  }
  for (int i=0;i<4;i++) {
    neorv32_uart0_printf("C_sw[%u]: %i %i %i %i\n", (unsigned)i,
      (int)C_sw[i][0], (int)C_sw[i][1], (int)C_sw[i][2], (int)C_sw[i][3]);
  }
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) if (C_hw[i][j] != C_sw[i][j]) mism++;

  if (mism == 0) neorv32_uart0_puts("VERIFY: OK\n");
  else           neorv32_uart0_printf("VERIFY: MISMATCH (%i cells)\n", mism);
}

/* =====
   main
   ===== */
int main(void) {
  // Match bootloader terminal (adjust if needed)
  neorv32_uart0_setup(19200, 0);

  neorv32_uart0_puts("\nCFS GEMM i8 4x4 microbench (skewed RTL, 10 steps)\n");

  // NEORV32_SYSINFO is a pointer → use ->
  uint32_t clk_hz = NEORV32_SYSINFO->CLK;
  uint32_t hartid = (uint32_t)neorv32_cpu_csr_read(CSR_MHARTID);

  neorv32_uart0_printf("CLK = %u Hz\n", (unsigned)clk_hz);
  neorv32_uart0_printf("HartID = %u\n", (unsigned)hartid);

  run_cfs_microbench();

  neorv32_uart0_puts("Done.\n");
  return 0;
}

