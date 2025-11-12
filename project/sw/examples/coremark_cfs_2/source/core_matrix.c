#include "core_matrix.h"
#include "neorv32.h"

// Include necessary functions from the CFS module
extern void neorv32_cfs_send_data(int32_t *matrixA, int32_t *matrixB);
extern void neorv32_cfs_receive_data(int32_t *result);

// Function to multiply two matrices (example implementation)
void matrix_multiply(int32_t *A, int32_t *B, int32_t *C) {
  // Send the data to CFS for hardware acceleration
  neorv32_cfs_send_data(A, B);

  // Wait for the result from CFS
  while (!neorv32_cfs_is_ready()) {
    // Polling or interrupt-driven approach to wait for result
  }

  // Receive the result from CFS
  neorv32_cfs_receive_data(C);
}

// Example usage
void core_matrix_operations(void) {
  int32_t matrixA[4][4], matrixB[4][4], result[4][4];

  // Load data into matrices (example values)
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      matrixA[i][j] = i + j;
      matrixB[i][j] = i - j;
    }
  }

  // Perform matrix multiplication using CFS accelerator
  matrix_multiply((int32_t *)matrixA, (int32_t *)matrixB, (int32_t *)result);

  // Optionally, print the result or use it further
}

