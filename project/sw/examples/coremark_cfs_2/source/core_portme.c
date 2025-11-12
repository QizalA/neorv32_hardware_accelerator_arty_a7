#include "neorv32.h"

// Function to get the current cycle count (for performance measurement)
uint32_t neorv32_rtime_get(void) {
  return neorv32_rtime_get(); // Use NEORV32's cycle counter to track performance
}

