/*
Ultra-lean CoreMark main for NEORV32 + CFS demo
- iterate(): runs LIST only
- execs mask: LIST|MATRIX|STATE so list kernel’s calc_func() can call the others
- Initializes matrix/state to get the official crclist (0xd4b0 for 6k set)
*/

#include "coremark.h"

#ifndef COREMARK_MINIMAL_PRINT
#define COREMARK_MINIMAL_PRINT 1
#endif

/* CFS demo forward declaration */
extern int run_cfs_gemm_demo(void);

/* Known CRC table for LIST (6k..2k sets) */
static ee_u16 list_known_crc[] = {
  (ee_u16)0xd4b0,(ee_u16)0x3340,(ee_u16)0x6a79,(ee_u16)0xe714,(ee_u16)0xe3c1
};

/* LIST-only iterate() */
void *iterate(void *pres) {
  core_results *res = (core_results *)pres;
  ee_u32 iterations = res->iterations;
  res->crc = 0; res->crclist = 0; res->crcmatrix = 0; res->crcstate = 0;
  for (ee_u32 i = 0; i < iterations; i++) {
    ee_u16 crc;
    crc      = core_bench_list(res,  1);
    res->crc = crcu16(crc, res->crc);
    crc      = core_bench_list(res, -1);
    res->crc = crcu16(crc, res->crc);
    if (i == 0) res->crclist = res->crc;
  }
  return NULL;
}

#if (SEED_METHOD == SEED_ARG)
ee_s32 get_seed_args(int i, int argc, char *argv[]);
#define get_seed(x)    (ee_s16) get_seed_args(x, argc, argv)
#define get_seed_32(x) get_seed_args(x, argc, argv)
#else
ee_s32 get_seed_32(int i);
#define get_seed(x) (ee_s16) get_seed_32(x)
#endif

#if (MEM_METHOD == MEM_STATIC)
ee_u8 static_memblk[TOTAL_DATA_SIZE];
#endif

#if MAIN_HAS_NOARGC
MAIN_RETURN_TYPE main(void) {
  int argc = 0; char *argv[1];
#else
MAIN_RETURN_TYPE main(int argc, char *argv[]) {
#endif
  ee_u16 i, j = 0, num_algorithms = 0;
  ee_s16 known_id = -1, total_errors = 0;
  ee_u16 seedcrc = 0;
  CORE_TICKS total_time;
  core_results results[MULTITHREAD];

#if (MEM_METHOD == MEM_STACK)
  ee_u8 stack_memblock[TOTAL_DATA_SIZE * MULTITHREAD];
#endif

  /* Target init */
  portable_init(&(results[0].port), &argc, argv);

  /* --- CFS GEMM demo (functional verify; minimal prints) --- */
  int cfs_rc = run_cfs_gemm_demo();   /* 0 = PASS, nonzero = FAIL */

  if (sizeof(struct list_head_s) > 128) return MAIN_RETURN_VAL;

  /* Seeds & config */
  results[0].seed1      = get_seed(1);
  results[0].seed2      = get_seed(2);
  results[0].seed3      = get_seed(3);
  results[0].iterations = 2000;             /* keep small, deterministic */
#if CORE_DEBUG
  results[0].iterations = 1;
#endif

  /* IMPORTANT: enable all algos so list’s calc_func() has proper state/matrix */
  results[0].execs = (ID_LIST | ID_MATRIX | ID_STATE);

  /* Default sets (unchanged) */
  if ((results[0].seed1 == 0) && (results[0].seed2 == 0) && (results[0].seed3 == 0)) {
    results[0].seed1 = 0; results[0].seed2 = 0; results[0].seed3 = 0x66; /* performance */
  }
  if ((results[0].seed1 == 1) && (results[0].seed2 == 0) && (results[0].seed3 == 0)) {
    results[0].seed1 = 0x3415; results[0].seed2 = 0x3415; results[0].seed3 = 0x66; /* validation */
  }

  /* Memory provisioning */
#if (MEM_METHOD == MEM_STATIC)
  results[0].memblock[0] = (void *)static_memblk;
  results[0].size        = TOTAL_DATA_SIZE;
  results[0].err         = 0;
#elif (MEM_METHOD == MEM_MALLOC)
  results[0].size        = TOTAL_DATA_SIZE;
  results[0].memblock[0] = portable_malloc(results[0].size);
  results[0].err         = 0;
#elif (MEM_METHOD == MEM_STACK)
  results[0].memblock[0] = stack_memblock;
  results[0].size        = TOTAL_DATA_SIZE;
  results[0].err         = 0;
#else
#error "Please define a way to initialize a memory block."
#endif

  /* Split memory across enabled algorithms (LIST, MATRIX, STATE) */
  for (i = 0; i < NUM_ALGORITHMS; i++) {
    if ((1u << (ee_u32)i) & results[0].execs) num_algorithms++;
  }
  for (i = 0; i < MULTITHREAD; i++) results[i].size = results[i].size / num_algorithms;

  /* Assign sub-blocks for each enabled algorithm (indexes 1..3) */
  for (i = 0; i < NUM_ALGORITHMS; i++) {
    if ((1u << (ee_u32)i) & results[0].execs) {
      for (ee_u32 ctx = 0; ctx < MULTITHREAD; ctx++)
        results[ctx].memblock[i + 1] = (char *)(results[ctx].memblock[0]) + results[0].size * j;
      j++;
    }
  }

  /* Algorithm inits: we MUST init list, matrix, and state */
  for (i = 0; i < MULTITHREAD; i++) {
    results[i].seed1       = results[0].seed1;
    results[i].seed2       = results[0].seed2;
    results[i].seed3       = results[0].seed3;
    results[i].iterations  = results[0].iterations;
    results[i].execs       = results[0].execs;
    /* LIST */
    if (results[i].execs & ID_LIST) {
      results[i].list = core_list_init(results[0].size, results[i].memblock[1], results[i].seed1);
    }
    /* MATRIX (needed for calc_func inside list mergesort) */
    if (results[i].execs & ID_MATRIX) {
      core_init_matrix(results[0].size,
                       results[i].memblock[2],
                       (ee_s32)results[i].seed1 | (((ee_s32)results[i].seed2) << 16),
                       &(results[i].mat));
    }
    /* STATE (also needed for calc_func) */
    if (results[i].execs & ID_STATE) {
      core_init_state(results[0].size, results[i].seed1, results[i].memblock[3]);
    }
  }

  /* Run: LIST only (our iterate() ignores exec mask and only runs list) */
  start_time();
#if (MULTITHREAD > 1)
  if (default_num_contexts > MULTITHREAD) default_num_contexts = MULTITHREAD;
  for (i = 0; i < default_num_contexts; i++) core_start_parallel(&results[i]);
  for (i = 0; i < default_num_contexts; i++) core_stop_parallel(&results[i]);
#else
  iterate(&results[0]);
#endif
  stop_time();
  total_time = get_time();

  /* Seed CRC (unchanged) */
  seedcrc = crc16(results[0].seed1, seedcrc);
  seedcrc = crc16(results[0].seed2, seedcrc);
  seedcrc = crc16(results[0].seed3, seedcrc);
  seedcrc = crc16(results[0].size,  seedcrc);

  switch (seedcrc) {
    case 0x8a02: known_id = 0; if (!COREMARK_MINIMAL_PRINT) ee_printf("6k performance run parameters for coremark.\n"); break;
    case 0x7b05: known_id = 1; if (!COREMARK_MINIMAL_PRINT) ee_printf("6k validation run parameters for coremark.\n"); break;
    case 0x4eaf: known_id = 2; if (!COREMARK_MINIMAL_PRINT) ee_printf("Profile generation run parameters for coremark.\n"); break;
    case 0xe9f5: known_id = 3; if (!COREMARK_MINIMAL_PRINT) ee_printf("2K performance run parameters for coremark.\n"); break;
    case 0x18f2: known_id = 4; if (!COREMARK_MINIMAL_PRINT) ee_printf("2K validation run parameters for coremark.\n"); break;
    default: total_errors = -1; break;
  }

  /* Validate LIST CRC only (matrix/state omitted to save ROM) */
  if (known_id >= 0) {
    for (i = 0; i < MULTITHREAD; i++) {
      results[i].err = 0;
      if ((results[i].execs & ID_LIST) && (results[i].crclist != list_known_crc[known_id])) {
        if (!COREMARK_MINIMAL_PRINT)
          ee_printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",
                    i, results[i].crclist, list_known_crc[known_id]);
        results[i].err++;
      }
      total_errors += results[i].err;
    }
  }

  /* Count CFS demo failure as a CoreMark error so final line reflects it */
  if (cfs_rc != 0) {
    total_errors++;
  }

  /* Minimal report */
  ee_printf("CoreMark Size    : %lu\n", (unsigned long)results[0].size);
  ee_printf("Total ticks      : %lu k\n", (unsigned long)(total_time / 1000));
#if HAS_FLOAT
  ee_printf("Total time (secs): %f\n", time_in_secs(total_time));
  if (time_in_secs(total_time) > 0)
    ee_printf("Iterations/Sec   : %f\n",
      default_num_contexts * results[0].iterations / time_in_secs(total_time));
#else
  ee_printf("Total time (secs): %lu\n", (unsigned long)time_in_secs(total_time));
  if (time_in_secs(total_time) > 0)
    ee_printf("Iterations/Sec   : %lu\n",
      (unsigned long)(default_num_contexts * results[0].iterations / time_in_secs(total_time)));
#endif
  ee_printf("Iterations       : %lu\n", (unsigned long)(default_num_contexts * results[0].iterations));
  ee_printf("Compiler version : %s\n", COMPILER_VERSION);
  ee_printf("Compiler flags   : %s\n", COMPILER_FLAGS);
  ee_printf("Memory location  : %s\n", MEM_LOCATION);
#if defined(USE_CFU)
  ee_printf("Acceleration      : CFU (custom-0 MUL32 used in matrix kernels)\n");
#else
  ee_printf("Acceleration      : OFF (vanilla CoreMark)\n");
#endif
  ee_printf("seedcrc          : 0x%04x\n", seedcrc);
  if (results[0].execs & ID_LIST)
    for (i = 0; i < default_num_contexts; i++)
      ee_printf("[%d]crclist       : 0x%04x\n", i, results[i].crclist);

  if (total_errors == 0) {
    ee_printf("Correct operation validated. See README.md for run and reporting rules.\n");
  } else if (total_errors > 0) {
    ee_printf("Errors detected\n");
  } else {
    ee_printf("Cannot validate operation for these seed values, please compare with results on a known platform.\n");
  }

#if (MEM_METHOD == MEM_MALLOC)
  portable_free(results[0].memblock[0]);
#endif
  portable_fini(&(results[0].port));
  return MAIN_RETURN_VAL;
}

