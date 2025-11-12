#include <neorv32.h>

#define CFU_FUNCT3 0x0 // funct3 for matrix multiplication

// Function to invoke CFU matrix multiplication
uint32_t matrix_mul_cfu(uint32_t a, uint32_t b) {
  uint32_t result;
  asm volatile (
    ".insn r 0x0B, 0x0, 0x00, %0, %1, %2"
    : "=r"(result)
    : "r"(a), "r"(b)
  );
  return result;
}
// C software implementation of 2x2 matrix multiplication
void matrix_mul_c(uint8_t A[4], uint8_t B[4], uint8_t C[4]) {
  C[0] = A[0] * B[0] + A[1] * B[2]; // c11
  C[1] = A[0] * B[1] + A[1] * B[3]; // c12
  C[2] = A[2] * B[0] + A[3] * B[2]; // c21
  C[3] = A[2] * B[1] + A[3] * B[3]; // c22
}

int main(void) {

    neorv32_uart0_setup(19200, 0);
  if (!neorv32_uart0_available()) return 1;

  neorv32_uart0_printf("\n--- CFU vs Normal Matrix Multiplication ---\n");

  // Matrices
  uint8_t A[4] = {1, 2, 3, 4}; // A = [[1,2],[3,4]]
  uint8_t B[4] = {5, 6, 7, 8}; // B = [[5,6],[7,8]]
  uint8_t C_sw[4];

  uint32_t a_packed = (A[0] << 24) | (A[1] << 16) | (A[2] << 8) | A[3];
  uint32_t b_packed = (B[0] << 24) | (B[1] << 16) | (B[2] << 8) | B[3];

  // --------------------------------------------------------------------------
  // CFU Execution
  // --------------------------------------------------------------------------
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  uint32_t cfu_result = matrix_mul_cfu(a_packed, b_packed);

  uint32_t cfu_cycles   = neorv32_cpu_csr_read(CSR_CYCLE);
  uint32_t cfu_instrs   = neorv32_cpu_csr_read(CSR_INSTRET);

  uint8_t c11 = (cfu_result >> 24) & 0xff;
  uint8_t c12 = (cfu_result >> 16) & 0xff;
  uint8_t c21 = (cfu_result >> 8)  & 0xff;
  uint8_t c22 = (cfu_result >> 0)  & 0xff;

  // --------------------------------------------------------------------------
  // Software Execution
  // --------------------------------------------------------------------------
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  matrix_mul_c(A, B, C_sw);

  uint32_t sw_cycles   = neorv32_cpu_csr_read(CSR_CYCLE);
  uint32_t sw_instrs   = neorv32_cpu_csr_read(CSR_INSTRET);

  // --------------------------------------------------------------------------
  // Print results
  // --------------------------------------------------------------------------
  neorv32_uart0_printf("\nMatrix A:\n[%d %d]\n[%d %d]\n", A[0], A[1], A[2], A[3]);
  neorv32_uart0_printf("Matrix B:\n[%d %d]\n[%d %d]\n", B[0], B[1], B[2], B[3]);

  neorv32_uart0_printf("\nCFU Matrix Multiplication Result:\n[%d %d]\n[%d %d]\n",
    c11, c12, c21, c22);
  neorv32_uart0_printf("CFU:  Instructions = %u,  Cycles = %u\n", cfu_instrs, cfu_cycles);

  neorv32_uart0_printf("\nSoftware Matrix Multiplication Result:\n[%d %d]\n[%d %d]\n",
    C_sw[0], C_sw[1], C_sw[2], C_sw[3]);
  neorv32_uart0_printf("SW :  Instructions = %u,  Cycles = %u\n", sw_instrs, sw_cycles);

  return 0;
}

