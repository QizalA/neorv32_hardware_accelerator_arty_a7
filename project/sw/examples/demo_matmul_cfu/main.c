#include <neorv32.h>
#include <neorv32_cpu_cfu.h>

// Define CFU funct7 and funct3 for dot product (must match your CFU HDL logic)
#define CFU_FUNCT7_DOT 0x01
#define CFU_FUNCT3_DOT 0x00

/**********************************************************************
 * CFU-based dot product
 * Takes two 32-bit packed vectors (4x 8-bit elements each)
 **********************************************************************/
uint32_t matrix_dot_cfu(uint32_t packed_row, uint32_t packed_col) {
  return neorv32_cfu_r3_instr(CFU_FUNCT7_DOT, CFU_FUNCT3_DOT, packed_row, packed_col);
}

/**********************************************************************
 * Software dot product (for comparison)
 **********************************************************************/
uint32_t matrix_dot_sw(uint32_t packed_row, uint32_t packed_col) {
  uint8_t *row = (uint8_t *)&packed_row;
  uint8_t *col = (uint8_t *)&packed_col;
  return row[0] * col[0] + row[1] * col[1] + row[2] * col[2] + row[3] * col[3];
}

/**********************************************************************
 * Main program
 **********************************************************************/
int main() {

  // Setup UART for printing
  neorv32_uart0_setup(19200, 0);
  neorv32_uart0_printf("\n--- Matrix Multiplication CFU Test ---\n");

  // Check if CFU is available
  if (!neorv32_cpu_cfu_available()) {
    neorv32_uart0_printf("ERROR: No CFU available!\n");
    return -1;
  }

  // Test data: row = [1, 2, 3, 4], col = [1, 1, 1, 1]
  uint32_t row = 0x04030201; // packed row elements
  uint32_t col = 0x01010101; // packed column elements

  // Variables for timing
  uint64_t start_cycles, end_cycles;
  uint64_t start_instrs, end_instrs;
  uint32_t res_hw, res_sw;

  // -------------------------
  // Measure CFU version
  // -------------------------
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  start_cycles = neorv32_cpu_csr_read(CSR_CYCLE);
  start_instrs = neorv32_cpu_csr_read(CSR_INSTRET);

  res_hw = matrix_dot_cfu(row, col);

  end_cycles = neorv32_cpu_csr_read(CSR_CYCLE);
  end_instrs = neorv32_cpu_csr_read(CSR_INSTRET);

  neorv32_uart0_printf("CFU Dot Product = %u\n", res_hw);
  neorv32_uart0_printf("CFU Cycles      = %u\n", (uint32_t)(end_cycles - start_cycles));
  neorv32_uart0_printf("CFU Instructions= %u\n\n", (uint32_t)(end_instrs - start_instrs));

  // -------------------------
  // Measure Software version
  // -------------------------
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  start_cycles = neorv32_cpu_csr_read(CSR_CYCLE);
  start_instrs = neorv32_cpu_csr_read(CSR_INSTRET);

  res_sw = matrix_dot_sw(row, col);

  end_cycles = neorv32_cpu_csr_read(CSR_CYCLE);
  end_instrs = neorv32_cpu_csr_read(CSR_INSTRET);

  neorv32_uart0_printf("SW Dot Product  = %u\n", res_sw);
  neorv32_uart0_printf("SW Cycles       = %u\n", (uint32_t)(end_cycles - start_cycles));
  neorv32_uart0_printf("SW Instructions = %u\n", (uint32_t)(end_instrs - start_instrs));

  return 0;
}

