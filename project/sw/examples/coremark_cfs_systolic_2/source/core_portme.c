/*
Copyright 2018 Embedded Microprocessor Benchmark Consortium (EEMBC)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Original Author: Shay Gal-on

Modified for NEORV32 (timing, UART, HPM) and print guards (2025)
*/

#include "coremark.h"
#include "core_portme.h"

#ifndef COREMARK_MINIMAL_PRINT
#define COREMARK_MINIMAL_PRINT 0 /* set to 1 at compile time to trim prints/strings */
#endif

/* --------------------------------------------------------------------------
 * Timing (NEORV32)
 * -------------------------------------------------------------------------- */

#if VALIDATION_RUN
volatile ee_s32 seed1_volatile = 0x3415;
volatile ee_s32 seed2_volatile = 0x3415;
volatile ee_s32 seed3_volatile = 0x66;
#endif
#if PERFORMANCE_RUN
volatile ee_s32 seed1_volatile = 0x0;
volatile ee_s32 seed2_volatile = 0x0;
volatile ee_s32 seed3_volatile = 0x66;
#endif
#if PROFILE_RUN
volatile ee_s32 seed1_volatile = 0x8;
volatile ee_s32 seed2_volatile = 0x8;
volatile ee_s32 seed3_volatile = 0x8;
#endif
volatile ee_s32 seed4_volatile = ITERATIONS;
volatile ee_s32 seed5_volatile = 0;

/* NEORV32: use mcycle as the timer source */
#define GETMYTIME(_t)        (*_t = (CORETIMETYPE)neorv32_cpu_get_cycle())
#define MYTIMEDIFF(fin,ini)  ((fin) - (ini))
#define TIMER_RES_DIVIDER    1
#define SAMPLE_TIME_IMPLEMENTATION 1
#define EE_TICKS_PER_SEC     (CLOCKS_PER_SEC / TIMER_RES_DIVIDER)

static CORETIMETYPE start_time_val, stop_time_val;

CORETIMETYPE barebones_clock(void) {
  /* Not used by CoreMark when SAMPLE_TIME_IMPLEMENTATION is set; keep stub. */
  return 1;
}

void start_time(void) {
  GETMYTIME(&start_time_val);
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, 0); /* start all counters */
}

void stop_time(void) {
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, -1); /* stop all counters */
  GETMYTIME(&stop_time_val);
}

CORE_TICKS get_time(void) {
  return (CORE_TICKS)(MYTIMEDIFF(stop_time_val, start_time_val));
}

secs_ret time_in_secs(CORE_TICKS ticks) {
  /* seconds = cycles / f_clk */
  secs_ret retval = (secs_ret)(((CORE_TICKS)ticks) / ((CORE_TICKS)neorv32_sysinfo_get_clk()));
  return retval;
}

/* How many HPM counters are present */
uint32_t num_hpm_cnts_global = 0;

/* --------------------------------------------------------------------------
 * Port hooks
 * -------------------------------------------------------------------------- */

void portable_init(core_portable *p, int *argc, char *argv[]) {

  /* minimal runtime setup */
  neorv32_cpu_csr_write(CSR_MIE, 0);      /* disable global irq */
  neorv32_rte_setup();                    /* trap handler */
  neorv32_uart0_setup(BAUD_RATE, 0);      /* UART init */

  /* Ensure Zicntr exists (mcycle/minstret baseline) */
  if ((neorv32_cpu_csr_read(CSR_MXISA) & (1u << CSR_MXISA_ZICNTR)) == 0) {
#if COREMARK_MINIMAL_PRINT == 0
    neorv32_uart0_printf("ERROR! No CPU base counters available (Zicntr)!\n");
#endif
    while (1) { /* halt */ }
  }

  /* Discover number of HPM counters */
  num_hpm_cnts_global = neorv32_cpu_hpm_get_num_counters();

  /* stop counters before zeroing */
  neorv32_cpu_csr_write(CSR_MCOUNTINHIBIT, -1);

  /* zero base counters */
  neorv32_cpu_csr_write(CSR_MCYCLE, 0);
  neorv32_cpu_csr_write(CSR_MINSTRET, 0);

  /* set up a few HPMs if available (low words only) */
  if (num_hpm_cnts_global > 0)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER3,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT3,  1 << HPMCNT_EVENT_COMPR);    }
  if (num_hpm_cnts_global > 1)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER4,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT4,  1 << HPMCNT_EVENT_WAIT_DIS); }
  if (num_hpm_cnts_global > 2)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER5,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT5,  1 << HPMCNT_EVENT_WAIT_ALU); }
  if (num_hpm_cnts_global > 3)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER6,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT6,  1 << HPMCNT_EVENT_BRANCH);   }
  if (num_hpm_cnts_global > 4)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER7,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT7,  1 << HPMCNT_EVENT_BRANCHED); }
  if (num_hpm_cnts_global > 5)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER8,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT8,  1 << HPMCNT_EVENT_LOAD);     }
  if (num_hpm_cnts_global > 6)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER9,  0); neorv32_cpu_csr_write(CSR_MHPMEVENT9,  1 << HPMCNT_EVENT_STORE);    }
  if (num_hpm_cnts_global > 7)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER10, 0); neorv32_cpu_csr_write(CSR_MHPMEVENT10, 1 << HPMCNT_EVENT_WAIT_LSU); }
  if (num_hpm_cnts_global > 8)  { neorv32_cpu_csr_write(CSR_MHPMCOUNTER11, 0); neorv32_cpu_csr_write(CSR_MHPMEVENT11, 1 << HPMCNT_EVENT_TRAP);     }

#if COREMARK_MINIMAL_PRINT == 0
  neorv32_uart0_printf("NEORV32: Processor running at %u Hz\n", (uint32_t)neorv32_sysinfo_get_clk());
#if MULTITHREAD == 2
  neorv32_uart0_printf("NEORV32: SMP dual-core version (EXPERIMENTAL)\n");
#endif
  neorv32_uart0_printf("NEORV32: Executing CoreMark (%u iterations)...\n\n", (uint32_t)ITERATIONS);
#endif

  if (sizeof(ee_ptr_int) != sizeof(ee_u8 *)) {
#if COREMARK_MINIMAL_PRINT == 0
    ee_printf("ERROR! Please define ee_ptr_int to a type that holds a pointer!\n");
#endif
  }
  if (sizeof(ee_u32) != 4) {
#if COREMARK_MINIMAL_PRINT == 0
    ee_printf("ERROR! Please define ee_u32 to a 32b unsigned type!\n");
#endif
  }

  p->portable_id = 1;
}

void portable_fini(core_portable *p) {
  p->portable_id = 0;

#if COREMARK_MINIMAL_PRINT == 0
  neorv32_uart0_printf("\nNEORV32: Hardware Performance Monitors (low words only)\n");
  neorv32_uart0_printf(" > Active clock cycles         : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MCYCLE));
  neorv32_uart0_printf(" > Retired instructions        : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MINSTRET));
  if (num_hpm_cnts_global == 0) {
    neorv32_uart0_printf("no HPMs available\n");
  } else {
    if (num_hpm_cnts_global > 0)  neorv32_uart0_printf(" > Compressed instructions     : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER3));
    if (num_hpm_cnts_global > 1)  neorv32_uart0_printf(" > Instr. dispatch wait cycles : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER4));
    if (num_hpm_cnts_global > 2)  neorv32_uart0_printf(" > ALU wait cycles             : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER5));
    if (num_hpm_cnts_global > 3)  neorv32_uart0_printf(" > Branch instructions         : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER6));
    if (num_hpm_cnts_global > 4)  neorv32_uart0_printf(" > Control flow transfers      : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER7));
    if (num_hpm_cnts_global > 5)  neorv32_uart0_printf(" > Load instructions           : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER8));
    if (num_hpm_cnts_global > 6)  neorv32_uart0_printf(" > Store instructions          : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER9));
    if (num_hpm_cnts_global > 7)  neorv32_uart0_printf(" > Load/store wait cycles      : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER10));
    if (num_hpm_cnts_global > 8)  neorv32_uart0_printf(" > Entered traps               : %u\n", (uint32_t)neorv32_cpu_csr_read(CSR_MHPMCOUNTER11));
  }
  neorv32_uart0_printf("\n");
#endif
}

/* --------------------------------------------------------------------------
 * Memory management
 * -------------------------------------------------------------------------- */

void *portable_malloc(size_t size) {
  void *pnt = malloc(size);
  if (pnt <= 0) {
#if COREMARK_MINIMAL_PRINT == 0
    neorv32_uart0_printf("Malloc failed!\n");
#endif
    asm volatile ("ebreak");
    while (1) { }
  }
  return pnt;
}

void portable_free(void *p) {
  free(p);
}

/* --------------------------------------------------------------------------
 * SMP Dual-Core Multi-Threading (unchanged, but banners guarded)
 * -------------------------------------------------------------------------- */

int default_num_contexts = (int)(MULTITHREAD);

#if MULTITHREAD != 2
ee_u8 core_start_parallel(core_results *res) { (void)res; return (ee_u8)-1; }
ee_u8 core_stop_parallel (core_results *res) { (void)res; return (ee_u8)-1; }
#else

volatile uint8_t core1_stack[16*1024];
volatile core_results *res_core0;
volatile core_results *res_core1;
volatile int core1_done = 0;
volatile int core_idx = 0;

int iterate_core1(void) {
  asm volatile ("fence");
  iterate((core_results*)res_core1);
  core1_done = 1;
  asm volatile ("fence");
  neorv32_cpu_sleep();
  return 0;
}

ee_u8 core_start_parallel(core_results *res) {
  if (core_idx == 0) { res_core0 = res; core_idx++; }
  else               { res_core1 = res; }
  asm volatile ("fence");
  return 0;
}

ee_u8 core_stop_parallel(core_results *res) {
  (void)res;
  core1_done = 0;
  int rc = neorv32_smp_launch(iterate_core1, (uint8_t*)core1_stack, sizeof(core1_stack));
  if (rc) {
#if COREMARK_MINIMAL_PRINT == 0
    neorv32_uart0_printf("SMP failed %d\n", rc);
#endif
    exit(-1);
    while (1) { }
  }
  iterate((core_results*)res_core0);
  while (1) { asm volatile ("fence"); if (core1_done == 1) break; }
  return 0;
}
#endif

