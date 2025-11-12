#include <neorv32.h>

#define CFU_FUNCT3 0x1 // must match funct3 = "001" in VHDL

// Custom CFU instruction to add two 2x2 matrices
uint32_t matrix_add_cfu(uint32_t a, uint32_t b) {
  uint32_t result;
  asm volatile (
    // opcode=0x0B, funct3=0x1 (001), rd=result, rs1=a, rs2=b
    ".insn r 0x0B, 0x1, 0x00, %0, %1, %2"
    : "=r"(result)
    : "r"(a), "r"(b)
  );
  return result;
}

// Unpack and print 2x2 matrix from packed uint32_t
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

  // Matrices
  uint8_t A[4] = {1, 2, 3, 4};
  uint8_t B[4] = {5, 6, 7, 8};

  uint32_t a_packed = (A[0] << 24) | (A[1] << 16) | (A[2] << 8) | A[3];
  uint32_t b_packed = (B[0] << 24) | (B[1] << 16) | (B[2] << 8) | B[3];

  // Reset counters
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  // Measure instruction and cycle count
  uint64_t instr_start = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t cycle_start = neorv32_cpu_csr_read(CSR_CYCLE);

  // Call CFU
  uint32_t result = matrix_add_cfu(a_packed, b_packed);

  uint64_t instr_end = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t cycle_end = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output
  neorv32_uart0_printf("Matrix A:\n"); print_matrix(a_packed);
  neorv32_uart0_printf("Matrix B:\n"); print_matrix(b_packed);
  neorv32_uart0_printf("Sum:\n");      print_matrix(result);

  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(instr_end - instr_start));
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(cycle_end - cycle_start));

  return 0;
}

