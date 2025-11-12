# Changes vs NEORV32

## CFU
- int8 DP4A-style dot-product (4x int8 -> 32-bit acc), opcodes: <list>

## CFS
- Mapped at 0xFFEB0000 (adjust if different)
- Registers: CTRL, STAT, SRC, DST, DIM (document if different)

## Core/Bus
- Pipeline tweak(s): <e.g., branch in EX; hazard forwarding>
- AXI4-Lite bridge/shim for accelerator

## Tools
- Exported `create_project.tcl` + batch `build.tcl`
