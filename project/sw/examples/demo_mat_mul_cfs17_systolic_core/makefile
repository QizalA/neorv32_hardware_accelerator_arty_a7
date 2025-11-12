# Application makefile (CFS GEMM i8 4x4)

# ---- build profile ----
# Use -O3 for benchmark numbers (recommended). Use -Os for smaller debug builds.
EFFORT = -O3

# Extra debug info (optional)
USER_FLAGS += -ggdb -gdwarf-3

# Safer flags for deterministic results
USER_FLAGS += -fno-strict-aliasing -fno-builtin -fno-common

# Adjust IMEM/DMEM if your SoC differs
USER_FLAGS += -Wl,--defsym,__neorv32_rom_size=128k
USER_FLAGS += -Wl,--defsym,__neorv32_ram_size=512k

# ISA: match your SoC. (Keep this if your CPU is rv32i+Zicsr+Zifencei)
MARCH = rv32i_zicsr_zifencei

# If you have the compressed extension or M, change to:
# MARCH = rv32imc_zicsr_zifencei
# (Only do this if your CPU actually has M/C.)

# App name and sources
APP_NAME = cfs_gemm_i8_4x4
APP_SRC  = main.c cfs_gemm_int8_4x4.c
APP_ASM  =
APP_INC  = .

# Let the NEORV32 build system handle the rest
NEORV32_HOME ?= ../../..
include $(NEORV32_HOME)/sw/common/common.mk

