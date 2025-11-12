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

// Function to print a 3x3 matrix
void print_matrix(uint8_t matrix[3][3]) {
  for (int i = 0; i < 3; i++) {
    neorv32_uart0_printf("[");
    for (int j = 0; j < 3; j++) {
      neorv32_uart0_printf("%d ", matrix[i][j]);
    }
    neorv32_uart0_printf("]\n");
  }
}

int main(void) {
  // Init UART
  neorv32_uart0_setup(19200, 0);
  if (!neorv32_uart0_available()) return 1;

  neorv32_uart0_printf("\n--- CFU 3x3 Matrix Multiplication ---\n");

  // Define matrices A and B as 3x3 arrays
  //uint8_t A[3][3] = {{1, 2, 3}, {1, 1, 1}, {0, 0, 0}};  // Matrix A
  //uint8_t B[3][3] = {{0, 0, 0}, {1, 1, 1}, {0, 0, 0}};  // Matrix B
  
    uint8_t A[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};  // Matrix A
  uint8_t B[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};  // Matrix B

  // Print matrices A and B
  neorv32_uart0_printf("Matrix A:\n");
  print_matrix(A);

  neorv32_uart0_printf("Matrix B:\n");
  print_matrix(B);

  // Pack rows of matrix A and columns of matrix B into 32-bit words (row-major order)
  uint32_t a_packed_0 = (A[0][0] << 24) | (A[0][1] << 16) | (A[0][2] << 8);  // First row of A: [1 2 3]
  uint32_t a_packed_1 = (A[1][0] << 24) | (A[1][1] << 16) | (A[1][2] << 8);  // Second row of A: [4 5 6]
  uint32_t a_packed_2 = (A[2][0] << 24) | (A[2][1] << 16) | (A[2][2] << 8);  // Third row of A: [7 8 9]
  
  uint32_t b_packed_0 = (B[0][0] << 24) | (B[1][0] << 16) | (B[2][0] << 8);   // First column of B: [9 6 3]
  uint32_t b_packed_1 = (B[0][1] << 24) | (B[1][1] << 16) | (B[2][1] << 8);   // Second column of B: [8 5 2]
  uint32_t b_packed_2 = (B[0][2] << 24) | (B[1][2] << 16) | (B[2][2] << 8);   // Third column of B: [7 4 1]
  
  

  // Print the packed values for debugging
  neorv32_uart0_printf("Packed A[0]: %x\n", a_packed_0);
  neorv32_uart0_printf("Packed A[1]: %x\n", a_packed_1);
  neorv32_uart0_printf("Packed A[2]: %x\n", a_packed_2);
  neorv32_uart0_printf("Packed B[0]: %x\n", b_packed_0);
  neorv32_uart0_printf("Packed B[1]: %x\n", b_packed_1);
  neorv32_uart0_printf("Packed B[2]: %x\n", b_packed_2);
  
  
   // Reset performance counters
  neorv32_cpu_csr_write(CSR_CYCLE, 0);
  neorv32_cpu_csr_write(CSR_INSTRET, 0);

  uint64_t start_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t start_cycle = neorv32_cpu_csr_read(CSR_CYCLE);


  // Call CFU for each element of the result matrix C
  uint32_t C11 = matrix_mul_cfu(a_packed_0, b_packed_0); // C[0][0]
  uint32_t C12 = matrix_mul_cfu(a_packed_0, b_packed_1); // C[0][1]
  uint32_t C13 = matrix_mul_cfu(a_packed_0, b_packed_2); // C[0][2]
  uint32_t C21 = matrix_mul_cfu(a_packed_1, b_packed_0); // C[1][0]
  uint32_t C22 = matrix_mul_cfu(a_packed_1, b_packed_1); // C[1][1]
  uint32_t C23 = matrix_mul_cfu(a_packed_1, b_packed_2); // C[1][2]
  uint32_t C31 = matrix_mul_cfu(a_packed_2, b_packed_0); // C[2][0]
  uint32_t C32 = matrix_mul_cfu(a_packed_2, b_packed_1); // C[2][1]
  uint32_t C33 = matrix_mul_cfu(a_packed_2, b_packed_2); // C[2][2]
  
  
  
  uint64_t end_instr = neorv32_cpu_csr_read(CSR_INSTRET);
  uint64_t end_cycle = neorv32_cpu_csr_read(CSR_CYCLE);


  // Output the result matrix C
  neorv32_uart0_printf("Product A*B (Result matrix C):\n");

  uint8_t result_matrix[3][3] = {
    { (C11 >> 24) & 0xFF, (C12 >> 24) & 0xFF, (C13 >> 24) & 0xFF },
    { (C21 >> 24) & 0xFF, (C22 >> 24) & 0xFF, (C23 >> 24) & 0xFF },
    { (C31 >> 24) & 0xFF, (C32 >> 24) & 0xFF, (C33 >> 24) & 0xFF }
  };

  print_matrix(result_matrix);
  
    // Output performance statistics
  neorv32_uart0_printf("Instructions (CFU): %u\n", (uint32_t)(end_instr - start_instr));
  neorv32_uart0_printf("Cycles      (CFU): %u\n", (uint32_t)(end_cycle - start_cycle));


  return 0;
}

