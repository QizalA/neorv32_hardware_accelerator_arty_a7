#include <neorv32.h>

#define CFU_FUNCT3 0x1 // Must match funct3 = "001" in VHDL

// Custom instruction wrapper to call CFU
uint32_t matrix_mul_cfu(uint32_t a_packed, uint32_t b_packed) {
  uint32_t result;
  asm volatile (
    ".insn r 0x0B, %1, 0x00, %0, %2, %3"
    : "=r"(result)
    : "i"(CFU_FUNCT3), "r"(a_packed), "r"(b_packed)
  );
  return result;
}

// Function to print a 4x4 matrix
void print_matrix(uint8_t matrix[4][4]) {
  for (int i = 0; i < 4; i++) {
    neorv32_uart0_printf("[");
    for (int j = 0; j < 4; j++) {
      neorv32_uart0_printf("%d ", matrix[i][j]);
    }
    neorv32_uart0_printf("]\n");
  }
}

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
  if (!neorv32_uart0_available()) return 1;

  neorv32_uart0_printf("\n--- CFU 4x4 Matrix Multiplication ---\n");

  // Define matrices A and B as 4x4 arrays
  uint8_t A[4][4] = {{1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}};  // Matrix A
  uint8_t B[4][4] = {{1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}, {1, 2, 3, 4}};  // Matrix B

  // Print matrices A and B
  neorv32_uart0_printf("Matrix A:\n");
  print_matrix(A);

  neorv32_uart0_printf("Matrix B:\n");
  print_matrix(B);

  // Pack rows of matrix A and columns of matrix B into 32-bit words (row-major order)
  uint32_t a_packed_0 = (A[0][0] << 24) | (A[0][1] << 16) | (A[0][2] << 8) | A[0][3];  // First row of A
  uint32_t a_packed_1 = (A[1][0] << 24) | (A[1][1] << 16) | (A[1][2] << 8) | A[1][3];  // Second row of A
  uint32_t a_packed_2 = (A[2][0] << 24) | (A[2][1] << 16) | (A[2][2] << 8) | A[2][3];  // Third row of A
  uint32_t a_packed_3 = (A[3][0] << 24) | (A[3][1] << 16) | (A[3][2] << 8) | A[3][3];  // Fourth row of A
  
  uint32_t b_packed_0 = (B[0][0] << 24) | (B[1][0] << 16) | (B[2][0] << 8) | B[3][0];  // First column of B
  uint32_t b_packed_1 = (B[0][1] << 24) | (B[1][1] << 16) | (B[2][1] << 8) | B[3][1];  // Second column of B
  uint32_t b_packed_2 = (B[0][2] << 24) | (B[1][2] << 16) | (B[2][2] << 8) | B[3][2];  // Third column of B
  uint32_t b_packed_3 = (B[0][3] << 24) | (B[1][3] << 16) | (B[2][3] << 8) | B[3][3];  // Fourth column of B

  // Print the packed values for debugging
  neorv32_uart0_printf("Packed A[0]: %x\n", a_packed_0);
  neorv32_uart0_printf("Packed A[1]: %x\n", a_packed_1);
  neorv32_uart0_printf("Packed A[2]: %x\n", a_packed_2);
  neorv32_uart0_printf("Packed A[3]: %x\n", a_packed_3);
  neorv32_uart0_printf("Packed B[0]: %x\n", b_packed_0);
  neorv32_uart0_printf("Packed B[1]: %x\n", b_packed_1);
  neorv32_uart0_printf("Packed B[2]: %x\n", b_packed_2);
  neorv32_uart0_printf("Packed B[3]: %x\n", b_packed_3);

  // Reset performance counters
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  uint64_t start_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t start_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Call CFU for each element of the result matrix C
  uint32_t C11 = matrix_mul_cfu(a_packed_0, b_packed_0); // C[0][0]
  uint32_t C12 = matrix_mul_cfu(a_packed_0, b_packed_1); // C[0][1]
  uint32_t C13 = matrix_mul_cfu(a_packed_0, b_packed_2); // C[0][2]
  uint32_t C14 = matrix_mul_cfu(a_packed_0, b_packed_3); // C[0][3]

  uint32_t C21 = matrix_mul_cfu(a_packed_1, b_packed_0); // C[1][0]
  uint32_t C22 = matrix_mul_cfu(a_packed_1, b_packed_1); // C[1][1]
  uint32_t C23 = matrix_mul_cfu(a_packed_1, b_packed_2); // C[1][2]
  uint32_t C24 = matrix_mul_cfu(a_packed_1, b_packed_3); // C[1][3]

  uint32_t C31 = matrix_mul_cfu(a_packed_2, b_packed_0); // C[2][0]
  uint32_t C32 = matrix_mul_cfu(a_packed_2, b_packed_1); // C[2][1]
  uint32_t C33 = matrix_mul_cfu(a_packed_2, b_packed_2); // C[2][2]
  uint32_t C34 = matrix_mul_cfu(a_packed_2, b_packed_3); // C[2][3]

  uint32_t C41 = matrix_mul_cfu(a_packed_3, b_packed_0); // C[3][0]
  uint32_t C42 = matrix_mul_cfu(a_packed_3, b_packed_1); // C[3][1]
  uint32_t C43 = matrix_mul_cfu(a_packed_3, b_packed_2); // C[3][2]
  uint32_t C44 = matrix_mul_cfu(a_packed_3, b_packed_3); // C[3][3]

  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output the result matrix C
  neorv32_uart0_printf("Product A*B (Result matrix C):\n");

  uint8_t result_matrix[4][4] = {
    { (C11 >> 24) & 0xFF, (C12 >> 24) & 0xFF, (C13 >> 24) & 0xFF, (C14 >> 24) & 0xFF },
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF, (C23 >> 24) & 0xFF, (C24 >> 24) & 0xFF },
    { (C31 >> 24) & 0xFF, (C32 >> 24) & 0xFF, (C33 >> 24) & 0xFF, (C34 >> 24) & 0xFF },
    { (C41 >> 24) & 0xFF, (C42 >> 24) & 0xFF, (C43 >> 24) & 0xFF, (C44 >> 24) & 0xFF }
  };

  print_matrix(result_matrix);

  // Output performance statistics
  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(end_instr - start_instr));
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(end_cycle - start_cycle));

  return 0;
}

