#include <neorv32.h>
#include <stdint.h>

/* ========= Config ========= */
#ifndef NEORV32_CFS_BASE
#define NEORV32_CFS_BASE 0xFFFFFE00UL // fallback; if wrong, you'll see zeros
#endif

#define CFS_REG_A_WR  (NEORV32_CFS_BASE + 0x00) // write: A packed
#define CFS_REG_B_WR  (NEORV32_CFS_BASE + 0x04) // write: B packed
#define CFS_REG_C00   (NEORV32_CFS_BASE + 0x00) // read: C00
#define CFS_REG_C01   (NEORV32_CFS_BASE + 0x04) // read: C01
#define CFS_REG_C10   (NEORV32_CFS_BASE + 0x08) // read: C10
#define CFS_REG_C11   (NEORV32_CFS_BASE + 0x0C) // read: C11

#define N_BENCH_ITERS  1000  // adjust as you like

/* ========= Raw MMIO ========= */
static inline void mmio_write32(uint32_t addr, uint32_t val) {
  *(volatile uint32_t*)addr = val;
}
static inline uint32_t mmio_read32(uint32_t addr) {
  return *(volatile uint32_t*)addr;
}

/* ========= Pack helpers =========
 A_packed = {A11[31:24], A10[23:16], A01[15:8], A00[7:0]}
 B_packed = {B11[31:24], B10[23:16], B01[15:8], B00[7:0]}
*/
static inline uint32_t pack2x2_u8(uint8_t m00, uint8_t m01, uint8_t m10, uint8_t m11) {
  return ((uint32_t)m11 << 24) |
         ((uint32_t)m10 << 16) |
         ((uint32_t)m01 << 8)  |
         ((uint32_t)m00);
}

/* ========= Reference multiply ========= */
static inline void mul2x2_ref(uint8_t a00, uint8_t a01, uint8_t a10, uint8_t a11,
                              uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11,
                              uint32_t *c00, uint32_t *c01, uint32_t *c10, uint32_t *c11) {
  *c00 = (uint32_t)a00*b00 + (uint32_t)a01*b10;
  *c01 = (uint32_t)a00*b01 + (uint32_t)a01*b11;
  *c10 = (uint32_t)a10*b00 + (uint32_t)a11*b10;
  *c11 = (uint32_t)a10*b01 + (uint32_t)a11*b11;
}

/* ========= Bench HW (CFS) =========
   Returns C sum (to avoid optimization).
   Fences/brackets exactly the 2 writes + 4 reads.
*/
static uint32_t bench_cfs_once(uint32_t A_packed, uint32_t B_packed,
                               uint32_t *cycles, uint32_t *insts) {
  uint64_t c0 = neorv32_cpu_get_cycle();
  uint64_t i0 = neorv32_cpu_get_instret();

  mmio_write32(CFS_REG_A_WR, A_packed);
  mmio_write32(CFS_REG_B_WR, B_packed);
  volatile uint32_t C00 = mmio_read32(CFS_REG_C00);
  volatile uint32_t C01 = mmio_read32(CFS_REG_C01);
  volatile uint32_t C10 = mmio_read32(CFS_REG_C10);
  volatile uint32_t C11 = mmio_read32(CFS_REG_C11);

  uint64_t c1 = neorv32_cpu_get_cycle();
  uint64_t i1 = neorv32_cpu_get_instret();

  *cycles = (uint32_t)(c1 - c0);
  *insts  = (uint32_t)(i1 - i0);
  return C00 + C01 + C10 + C11; // consume
}

/* ========= Bench SW (CPU ref) =========
   Brackets just the math (no printing/packing).
*/
static uint32_t bench_sw_once(uint8_t a00, uint8_t a01, uint8_t a10, uint8_t a11,
                              uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11,
                              uint32_t *cycles, uint32_t *insts) {
  uint32_t c00,c01,c10,c11;

  uint64_t c0 = neorv32_cpu_get_cycle();
  uint64_t i0 = neorv32_cpu_get_instret();

  mul2x2_ref(a00,a01,a10,a11,b00,b01,b10,b11, &c00,&c01,&c10,&c11);

  uint64_t c1 = neorv32_cpu_get_cycle();
  uint64_t i1 = neorv32_cpu_get_instret();

  *cycles = (uint32_t)(c1 - c0);
  *insts  = (uint32_t)(i1 - i0);
  return c00 + c01 + c10 + c11;
}

/* ========= One full case ========= */
static void run_case_bench(const char *tag,
                           uint8_t a00, uint8_t a01, uint8_t a10, uint8_t a11,
                           uint8_t b00, uint8_t b01, uint8_t b10, uint8_t b11) {

  uint32_t A_packed = pack2x2_u8(a00,a01,a10,a11);
  uint32_t B_packed = pack2x2_u8(b00,b01,b10,b11);

  // Show inputs
  neorv32_uart0_printf("\n-- %s --\n", tag);
  neorv32_uart0_printf("A = [[%u,%u],[%u,%u]]  packed=0x%08x\n", a00,a01,a10,a11, A_packed);
  neorv32_uart0_printf("B = [[%u,%u],[%u,%u]]  packed=0x%08x\n", b00,b01,b10,b11, B_packed);

  // Read HW results once (and print)
  mmio_write32(CFS_REG_A_WR, A_packed);
  mmio_write32(CFS_REG_B_WR, B_packed);
  uint32_t C00 = mmio_read32(CFS_REG_C00);
  uint32_t C01 = mmio_read32(CFS_REG_C01);
  uint32_t C10 = mmio_read32(CFS_REG_C10);
  uint32_t C11 = mmio_read32(CFS_REG_C11);
  neorv32_uart0_printf("CFS C = [[%u,%u],[%u,%u]]\n", C00,C01,C10,C11);

  // Reference (also print & verify)
  uint32_t r00,r01,r10,r11;
  mul2x2_ref(a00,a01,a10,a11,b00,b01,b10,b11, &r00,&r01,&r10,&r11);
  neorv32_uart0_printf("REF C = [[%u,%u],[%u,%u]]\n", r00,r01,r10,r11);
  neorv32_uart0_printf("Match: %s\n", (C00==r00 && C01==r01 && C10==r10 && C11==r11) ? "YES" : "NO");

  // --- Single-shot timing ---
  uint32_t cyc_hw, ins_hw, cyc_sw, ins_sw;
  volatile uint32_t sink = 0;
  sink += bench_cfs_once(A_packed, B_packed, &cyc_hw, &ins_hw);
  sink += bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
  (void)sink;

  neorv32_uart0_printf("Single-shot:  CFS cycles=%u, inst=%u | SW cycles=%u, inst=%u\n",
                       cyc_hw, ins_hw, cyc_sw, ins_sw);

  // --- Averaged timing over N iterations ---
  uint64_t sum_cyc_hw = 0, sum_ins_hw = 0, sum_cyc_sw = 0, sum_ins_sw = 0;

  // warm-up
  for (int i=0;i<16;i++) {
    bench_cfs_once(A_packed, B_packed, &cyc_hw, &ins_hw);
    bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
  }

  for (int i=0;i<N_BENCH_ITERS;i++) {
    bench_cfs_once(A_packed, B_packed, &cyc_hw, &ins_hw);
    bench_sw_once(a00,a01,a10,a11,b00,b01,b10,b11, &cyc_sw, &ins_sw);
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
    sum_cyc_sw += cyc_sw; sum_ins_sw += ins_sw;
  }

  uint32_t avg_cyc_hw = (uint32_t)(sum_cyc_hw / N_BENCH_ITERS);
  uint32_t avg_ins_hw = (uint32_t)(sum_ins_hw / N_BENCH_ITERS);
  uint32_t avg_cyc_sw = (uint32_t)(sum_cyc_sw / N_BENCH_ITERS);
  uint32_t avg_ins_sw = (uint32_t)(sum_ins_sw / N_BENCH_ITERS);

  neorv32_uart0_printf("Averaged over %u iters:\n", (unsigned)N_BENCH_ITERS);
  neorv32_uart0_printf("  CFS avg cycles=%u, inst=%u\n", avg_cyc_hw, avg_ins_hw);
  neorv32_uart0_printf("  SW  avg cycles=%u, inst=%u\n", avg_cyc_sw, avg_ins_sw);
}

/* ========= main ========= */
int main(void) {
  neorv32_uart0_setup(19200, 0);
  neorv32_uart0_printf("\n[NEORV32 CFS 2x2 MatMul - Cycle/Instruction Benchmark]\n");
  neorv32_uart0_printf("CFS base = 0x%08x   iters=%u\n", (uint32_t)NEORV32_CFS_BASE, (unsigned)N_BENCH_ITERS);

  // Case 1
  run_case_bench("Case 1",
                 1,2,
                 3,4,
                 5,6,
                 7,8);
  // Case 2
  run_case_bench("Case 2",
                 0,10,
                 20,0,
                 0,3,
                 4,0);
  // Case 3
  run_case_bench("Case 3",
                 12,7,
                 5,9,
                 8,11,
                 13,2);
  // Case 4 (max)
  run_case_bench("Case 4",
                 255,255,
                 255,255,
                 255,255,
                 255,255);

  return 0;
}

