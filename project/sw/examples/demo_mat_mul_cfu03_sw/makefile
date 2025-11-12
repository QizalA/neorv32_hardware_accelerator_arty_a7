# Application makefile.
# Use this makefile to configure all relevant CPU / compiler options.
APP_ELF := $(BUILD_DIR)/main.elf
APP_ASM := $(BUILD_DIR)/main.asm
#
NO_IMAGE_GEN = 1

# Enable CFU by including 'zxcfu' extension
MARCH = rv32i_zicsr_zifencei

# Override the default RISC-V GCC prefix
# RISCV_PREFIX ?= riscv-none-elf-

# Optimization
EFFORT = -Os

# Extended debug info
USER_FLAGS += -ggdb -gdwarf-3

# Adjust processor IMEM size
USER_FLAGS += -Wl,--defsym,__neorv32_rom_size=16k

# Adjust processor DMEM size
USER_FLAGS += -Wl,--defsym,__neorv32_ram_size=512k

# If needed: override heap size
# USER_FLAGS += -Wl,--defsym,__neorv32_heap_size=1k

# Optional: add extra source or include paths
# APP_SRC += $(wildcard ./*.c)
# APP_INC += -I .

# Path to NEORV32 root
NEORV32_HOME ?= ../../..

# Include main NEORV32 Makefile
include $(NEORV32_HOME)/sw/common/common.mk

bin: $(BUILD_DIR)/main.bin

#

