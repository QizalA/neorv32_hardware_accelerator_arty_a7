# NEORV32 C Examples

Build requires a RISC-V GCC toolchain and the NEORV32 SDK (provided here via submodule in `external/neorv32`).

## Quick start
```bash
export RISCV_PREFIX=riscv32-unknown-elf
cd project/sw/examples/hello_uart
make
# optional (UART bootloader):
make upload PORT=/dev/ttyUSB1

Layout

hello_uart — UART prints + simple GPIO blink

cfu_demo — calls a custom CFU op via .insn (adjust encoding to your CFU)

cfs_demo — pokes memory-mapped accelerator registers (adjust base/reg map)
