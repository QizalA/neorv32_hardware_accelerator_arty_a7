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

// Function to print a 2x2 matrix
void print_matrix(uint8_t matrix[2][2]) {
  for (int i = 0; i < 2; i++) {
    neorv32_uart0_printf("[");
    for (int j = 0; j < 2; j++) {
      neorv32_uart0_printf("%d ", matrix[i][j]);
    }
    neorv32_uart0_printf("]\n");
  }
}

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
  if (!neorv32_uart0_available()) return 1;

  neorv32_uart0_printf("\n--- CFU 2x2 Matrix Multiplication ---\n");

  // Define matrices A and B as 2x2 arrays
  uint8_t A[2][2] = {{1, 2}, {3, 4}};  // Matrix A: [1 2], [3 4]
  uint8_t B[2][2] = {{5, 6}, {7, 8}};  // Matrix B: [5 6], [7 8]

  // Print the matrices A and B
  neorv32_uart0_printf("Matrix A:\n");
  print_matrix(A);

  neorv32_uart0_printf("Matrix B:\n");
  print_matrix(B);

  // Call CFU for each element of the result matrix C
  // Pack the rows of A and columns of B into 32-bit words for CFU calculation
  uint32_t a_packed_0 = (A[0][0] << 24) | (A[0][1] << 16);  // First row of A: [1 2]
  uint32_t a_packed_1 = (A[1][0] << 24) | (A[1][1] << 16);  // Second row of A: [3 4]
  
  uint32_t b_packed_0 = (B[0][0] << 24) | (B[1][0] << 8);   // First column of B: [5 7]
  uint32_t b_packed_1 = (B[0][1] << 24) | (B[1][1] << 8);   // Second column of B: [6 8]

  // Reset performance counters
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  uint64_t start_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t start_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Call CFU for each element of the result matrix C
  uint32_t C11 = matrix_mul_cfu(a_packed_0, b_packed_0); // C[0][0]
  uint32_t C12 = matrix_mul_cfu(a_packed_0, b_packed_1); // C[0][1]
  uint32_t C21 = matrix_mul_cfu(a_packed_1, b_packed_0); // C[1][0]
  uint32_t C22 = matrix_mul_cfu(a_packed_1, b_packed_1); // C[1][1]

  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);

  // Output the result matrix C
  neorv32_uart0_printf("Product A*B (Result matrix C):\n");

  // Print the individual elements of the result matrix
  uint8_t result_matrix[2][2] = {
    { (C11 >> 24) & 0xFF, (C12 >> 24) & 0xFF }, // First row: [C11 C12]
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF }  // Second row: [C21 C22]
  };

  print_matrix(result_matrix);

  // Output performance statistics
  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(end_instr - start_instr));
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(end_cycle - start_cycle));

  return 0;
}

