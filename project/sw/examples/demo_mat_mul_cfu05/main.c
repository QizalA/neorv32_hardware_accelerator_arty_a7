#include <neorv32.h>

#define CFU_FUNCT3 0x1 // Must match VHDL funct3 = "001"

// Call CFU for one element of 4x4 matrix result
uint16_t cfu_matrix_mul_element(uint8_t row, uint8_t col) {
  uint32_t result;
  uint8_t selector = ((row & 0x0F) << 4) | (col & 0x0F); // rs3 = row[7:4], col[3:0]

  asm volatile (
    ".insn r 0x0B, 0x1, 0x00, %0, zero, zero\n\t" // custom opcode, rs1=0, rs2=0
    : "=r"(result)
    : "r"(selector) // loaded into rs3 implicitly
  );

  return (uint16_t)(result & 0xFFFF); // return lower 16 bits
}

// Print 4x4 matrix
void print_matrix(uint16_t mat[4][4]) {
  for (int i = 0; i < 4; i++) {
    neorv32_uart0_printf("[ ");
    for (int j = 0; j < 4; j++) {
      neorv32_uart0_printf("%u ", mat[i][j]);
    }
    neorv32_uart0_printf("]\n");
  }
}

int main(void) {
  neorv32_uart0_setup(19200, 0);
  if (!neorv32_uart0_available()) {
    return 1;
  }

  neorv32_uart0_printf("\n--- CFU 4x4 Matrix Multiplication ---\n\n");

  neorv32_uart0_printf("Matrix A and B are predefined inside CFU.\n");
  neorv32_uart0_printf("Fetching result from CFU...\n\n");

  uint16_t C[4][4];

  // Fetch each element from CFU
  for (uint8_t i = 0; i < 4; i++) {
    for (uint8_t j = 0; j < 4; j++) {
      uint32_t selector = ((i & 0x0F) << 4) | (j & 0x0F);
      register uint32_t rs3 asm("x15") = selector; // rs3 = x15

      uint32_t result;
      asm volatile (
        ".insn r 0x0B, 0x1, 0x00, %0, zero, zero"
        : "=r"(result)
        : "r"(rs3)
      );

      C[i][j] = result & 0xFFFF;
    }
  }

  neorv32_uart0_printf("Matrix C = A x B:\n");
  print_matrix(C);

  return 0;
}

