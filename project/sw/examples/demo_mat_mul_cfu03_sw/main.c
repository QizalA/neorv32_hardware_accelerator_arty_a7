#include <neorv32.h>

// Multiply two 2x2 matrices in software
// Each matrix is stored as a 1D array of 4 elements: [a11, a12, a21, a22]
void matrix_multiply_sw(uint8_t A[4], uint8_t B[4], uint8_t C[4]) {
  C[0] = A[0]*B[0] + A[1]*B[2]; // c11 = a11*b11 + a12*b21
  C[1] = A[0]*B[1] + A[1]*B[3]; // c12 = a11*b12 + a12*b22
  C[2] = A[2]*B[0] + A[3]*B[2]; // c21 = a21*b11 + a22*b21
  C[3] = A[2]*B[1] + A[3]*B[3]; // c22 = a21*b12 + a22*b22
}

// Print a 2x2 matrix
void print_matrix(uint8_t M[4]) {
  neorv32_uart0_printf("[%d %d]\n", M[0], M[1]);
  neorv32_uart0_printf("[%d %d]\n", M[2], M[3]);
}

int main(void) {
  // Initialize UART
  neorv32_uart0_setup(19200, 0);
  if (!neorv32_uart0_available()) {
    return 1;
  }

  neorv32_uart0_printf("\n--- Software 2x2 Matrix Multiplication ---\n");

  // Input matrices
  uint8_t A[4] = {1, 2, 3, 4}; // [1 2]
                               // [3 4]
  uint8_t B[4] = {5, 6, 7, 8}; // [5 6]
                               // [7 8]
  uint8_t C[4]; // Result matrix

  // Measure performance
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  uint64_t start_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t start_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Perform matrix multiplication in software
  matrix_multiply_sw(A, B, C);

  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output
  neorv32_uart0_printf("Matrix A:\n"); print_matrix(A);
  neorv32_uart0_printf("Matrix B:\n"); print_matrix(B);
  neorv32_uart0_printf("Result (A * B):\n"); print_matrix(C);

  neorv32_uart0_printf("Instructions (SW): %u\n", (uint32_t)(end_instr - start_instr));
  neorv32_uart0_printf("Cycles      (SW): %u\n", (uint32_t)(end_cycle - start_cycle));

  return 0;
}

