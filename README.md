# NEORV32 Hardware Accelerator (Arty A7) — Modified Core with CFU/CFS

**Based on:** [NEORV32 by Stephan Nolting](https://github.com/stnolting/neorv32) (BSD-3-Clause License)  
**Author (Modifications):** Qizal Arsalan, 2025  
**Board:** Digilent Arty A7-100T  
**Vivado Version:** 2022.2

---

## Overview
This repository contains a customized NEORV32 RISC-V soft-core processor, extended with:
- **CFU (Custom Function Unit):** Implements an int8 DP4A-style dot-product instruction for accelerated matrix multiplication and MAC operations.  
- **CFS (Custom Function Subsystem):** A memory-mapped hardware accelerator connected via the processor’s external bus (AXI-Lite) for bulk computations such as GEMM or convolution.

The goal is to evaluate instruction-level (CFU) vs. subsystem-level (CFS) performance on FPGA targets.

---

## What’s Changed
- Added **CFU** hardware pipeline (int8×int8→int32 accumulator).  
- Added **CFS** memory-mapped accelerator at `0xFFEB0000`.  
- Integrated AXI-Lite bridge for external accelerator interface.  
- Updated pipeline control and hazard unit for multi-cycle CFU ops.  
- Exported reproducible build scripts (`create_project.tcl`, `build.tcl`).

---

## Build (Vivado Batch)
```bash
vivado -mode batch -source project/scripts/build.tcl


Requirements

Vivado: 2022.2 (or compatible)

FPGA Board: Digilent Arty A7-100T

Toolchain (optional): RISC-V GCC for software test programs

Host OS: Linux (Ubuntu 22.04 recommended)



project/
├── src/        # Modified NEORV32 RTL + CFU/CFS sources
├── constr/     # XDC constraint files
├── bd/         # Block design (Tcl export, optional)
├── scripts/    # create_project.tcl + build.tcl
├── docs/       # CHANGES.md, DIFFSTAT, patch logs
└── README.md   # This file



source project/scripts/create_project.tcl


vivado -mode batch -source project/scripts/build.tcl
Attribution

This project modifies and extends the open-source
NEORV32 RISC-V processor by Stephan Nolting,
licensed under the BSD-3-Clause license.
All additional modifications © 2025 Qizal Arsalan.
