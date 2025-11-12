#include <neorv32.h>

#define CFU_FUNCT3 0x1 // must match funct3 = "001" in VHDL

// Custom instruction wrapper
uint32_t matrix_mul_cfu(uint32_t a_packed, uint32_t b_packed) {
  uint32_t result;
  asm volatile (
    ".insn r 0x0B, %1, 0x00, %0, %2, %3"
    : "=r"(result)
    : "i"(CFU_FUNCT3), "r"(a_packed), "r"(b_packed)
  );
  return result;
}

// Unpack and print a 2x2 matrix from a packed 32-bit value
void print_matrix(uint32_t packed) {
  uint8_t m11 = (packed >> 24) & 0xFF;
  uint8_t m12 = (packed >> 16) & 0xFF;
  uint8_t m21 = (packed >> 8)  & 0xFF;
  uint8_t m22 = (packed >> 0)  & 0xFF;

  neorv32_uart0_printf("[%d %d]\n", m11, m12);
  neorv32_uart0_printf("[%d %d]\n", m21, m22);
}

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
  if (!neorv32_uart0_available()) return 1;

  neorv32_uart0_printf("\n--- CFU 2x2 Matrix Multiplication ---\n");

  // Define input matrices
  uint8_t A[4] = {1, 2, 3, 4}; // [1 2]
                               // [3 4]
  uint8_t B[4] = {5, 6, 7, 8}; // [5 6]
                               // [7 8]

  // Pack each 2x2 matrix into a 32-bit word (row-major)
  uint32_t a_packed = (A[0] << 24) | (A[1] << 16) | (A[2] << 8) | A[3];
  uint32_t b_packed = (B[0] << 24) | (B[1] << 16) | (B[2] << 8) | B[3];

  // Reset performance counters
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  uint64_t start_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t start_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Call CFU
  uint32_t result = matrix_mul_cfu(a_packed, b_packed);

  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output
  neorv32_uart0_printf("Matrix A:\n"); print_matrix(a_packed);
  neorv32_uart0_printf("Matrix B:\n"); print_matrix(b_packed);
  neorv32_uart0_printf("Product A*B:\n"); print_matrix(result);

  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(end_instr - start_instr));
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(end_cycle - start_cycle));

  return 0;
}

