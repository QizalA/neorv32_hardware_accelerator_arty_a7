#include <neorv32.h>

#define BAUD_RATE 19200

int main() {

  neorv32_uart0_setup(BAUD_RATE, 0);
  neorv32_uart0_printf("\n[NEORV32] Matrix Multiplication\n");

  int A[2][3] = {
    {1, 2, 3},
    {4, 5, 6}
  };

  int B[3][2] = {
    {7, 8},
    {9, 10},
    {11, 12}
  };

  int C[2][2] = {0};

  // Matrix multiplication
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      for (int k = 0; k < 3; k++) {
        C[i][j] += A[i][k] * B[k][j];
      }
    }
  }

  // Print result
  neorv32_uart0_printf("Result matrix C (2x2):\n");
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      neorv32_uart0_printf("%d ", C[i][j]);
    }
    neorv32_uart0_printf("\n");
  }

  while (1) {}
  return 0;
}

