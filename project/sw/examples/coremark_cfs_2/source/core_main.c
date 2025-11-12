#include "core_portme.h"
#include "core_matrix.h"
#include "neorv32.h"

// Include the required function to send data to CFS
extern void neorv32_cfs_send_data(int32_t *matrixA, int32_t *matrixB);
extern void neorv32_cfs_receive_data(int32_t *result);
extern uint32_t neorv32_rtime_get();

// Variables for CoreMark timing and iteration count
static volatile uint32_t start_time, end_time;
static uint32_t iterations = 2000;
static uint32_t total_ticks = 0;

// Modified function for CoreMark initialization
void coremark_init(void) {
  // Initialize any hardware or timing components
  start_time = 0;
  end_time = 0;
}

// Modified function to run CoreMark and integrate with CFS
void coremark_main(void) {
  int32_t matrixA[4][4], matrixB[4][4], result[4][4];
  
  // Load matrixA and matrixB with appropriate data for multiplication
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      matrixA[i][j] = i + j;  // Example values
      matrixB[i][j] = i - j;  // Example values
    }
  }

  // Start the timer
  start_time = neorv32_rtime_get();  // Capture the starting time (using cycle counter)

  // Send data to CFS
  neorv32_cfs_send_data((int32_t *)matrixA, (int32_t *)matrixB);

  // Wait until the CFS finishes processing (or add timeout check)
  while (!neorv32_cfs_is_ready()) {
    // You can use a simple polling loop or interrupt handling to wait for CFS completion
  }

  // Receive the result from CFS
  neorv32_cfs_receive_data((int32_t *)result);

  // End the timer
  end_time = neorv32_rtime_get();  // Capture the ending time

  // Calculate performance metrics (iterations per second)
  total_ticks = end_time - start_time;
  printf("Total time for CoreMark with CFS: %u ticks\n", total_ticks);
  printf("Iterations per second: %u\n", iterations / total_ticks);
}

int main(void) {
  coremark_init();  // Initialize CoreMark
  coremark_main();  // Run CoreMark
  return 0;
}

