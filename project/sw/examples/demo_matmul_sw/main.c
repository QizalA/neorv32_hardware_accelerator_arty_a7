#include <neorv32.h>

// Unpack 4x 8-bit values and compute dot product in software
uint32_t matrix_dot_sw(uint32_t packed_row, uint32_t packed_col) {
  uint8_t a0 = (packed_row >> 0)  & 0xFF;
  uint8_t a1 = (packed_row >> 8)  & 0xFF;
  uint8_t a2 = (packed_row >> 16) & 0xFF;
  uint8_t a3 = (packed_row >> 24) & 0xFF;

  uint8_t b0 = (packed_col >> 0)  & 0xFF;
  uint8_t b1 = (packed_col >> 8)  & 0xFF;
  uint8_t b2 = (packed_col >> 16) & 0xFF;
  uint8_t b3 = (packed_col >> 24) & 0xFF;

  return (a0 * b0) + (a1 * b1) + (a2 * b2) + (a3 * b3);
}

int main() {

  // Setup UART
  neorv32_uart0_setup(19200, 0);

  neorv32_uart0_printf("Software Matrix Multiplication Test\n");

  // Pack 4 elements of row and column
  uint32_t row = 0x04030201; // A = [1,2,3,4]
  uint32_t col = 0x01010101; // B = [1,1,1,1]

  // Reset performance counters
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  uint64_t start_cycles = neorv32_cpu_csr_read(CSR_CYCLE);
  uint64_t start_instrs = neorv32_cpu_csr_read(CSR_INSTRET);

  // Execute software dot product
  uint32_t res = matrix_dot_sw(row, col);

  uint64_t end_cycles = neorv32_cpu_csr_read(CSR_CYCLE);
  uint64_t end_instrs = neorv32_cpu_csr_read(CSR_INSTRET);

  uint64_t cycles_taken = end_cycles - start_cycles;
  uint64_t instrs_taken = end_instrs - start_instrs;

  neorv32_uart0_printf("Dot product (SW) = %u\n", res);
  neorv32_uart0_printf("Execution cycles (SW): %u\n", (uint32_t)cycles_taken);
  neorv32_uart0_printf("Instruction count (SW): %u\n", (uint32_t)instrs_taken);

  return 0;
}

