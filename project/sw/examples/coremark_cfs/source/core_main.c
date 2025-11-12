#include <neorv32.h>
#include <stdint.h>
#include "coremark.h"

// Define the clock speed manually (e.g., 100 MHz)
#define CLOCK_SPEED_HZ 100000000  // 100 MHz

// Define coremark_accel_desc
const char *coremark_accel_desc = "CFU (custom-0 MUL32 used in matrix kernels)";

int main(void) {
    // UART0 setup for output
    neorv32_uart0_setup(19200, 0);
    neorv32_uart0_printf("\n[NEORV32] CoreMark - CFS Test\n");

    // Check if NEORV32 clock speed function is available, else use a manual value
    uint32_t hz = CLOCK_SPEED_HZ;  // Use the manually defined clock speed (100 MHz)
    neorv32_uart0_printf("CPU Clock Speed: %u Hz\n", hz);

    // Initialize CoreMark
    coremark_main();

    // Final message
    neorv32_uart0_printf("CoreMark Test Completed.\n");
    while (1); // Loop to halt the CPU
    return 0;
}

