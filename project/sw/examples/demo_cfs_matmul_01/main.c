#include <neorv32.h>
#include <stdint.h>

/* ===== Base + Offsets (must match your 3x3 CFS VHDL) ===== */
#ifndef NEORV32_CFS_BASE
#define NEORV32_CFS_BASE 0xFFFFFE00UL
#endif

/* Write (packed rows) */
#define CFS_A_ROW0   (NEORV32_CFS_BASE + 0x00)  // idx 0
#define CFS_A_ROW1   (NEORV32_CFS_BASE + 0x04)  // idx 1
#define CFS_A_ROW2   (NEORV32_CFS_BASE + 0x08)  // idx 2
#define CFS_B_ROW0   (NEORV32_CFS_BASE + 0x0C)  // idx 3
#define CFS_B_ROW1   (NEORV32_CFS_BASE + 0x10)  // idx 4
#define CFS_B_ROW2   (NEORV32_CFS_BASE + 0x14)  // idx 5

/* Read (results) */
#define CFS_C00      (NEORV32_CFS_BASE + 0x20)  // idx 8
#define CFS_C01      (NEORV32_CFS_BASE + 0x24)  // idx 9
#define CFS_C02      (NEORV32_CFS_BASE + 0x28)  // idx 10
#define CFS_C10      (NEORV32_CFS_BASE + 0x2C)  // idx 11
#define CFS_C11      (NEORV32_CFS_BASE + 0x30)  // idx 12
#define CFS_C12      (NEORV32_CFS_BASE + 0x34)  // idx 13
#define CFS_C20      (NEORV32_CFS_BASE + 0x38)  // idx 14
#define CFS_C21      (NEORV32_CFS_BASE + 0x3C)  // idx 15
#define CFS_C22      (NEORV32_CFS_BASE + 0x40)  // idx 16

#define N_BENCH_ITERS 1000  // average over this many runs

/* ===== MMIO helpers ===== */
static inline void wr32(uint32_t a, uint32_t v){ *(volatile uint32_t*)a = v; }
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }

/* ===== pack row: {x2[23:16], x1[15:8], x0[7:0]} (bit31=0) ===== */
static inline uint32_t pack3_u8(uint8_t x0, uint8_t x1, uint8_t x2){
  return ((uint32_t)x2<<16) | ((uint32_t)x1<<8) | (uint32_t)x0;
}

/* ===== CPU reference (unsigned) ===== */
static inline void mul3x3_ref(const uint8_t A[3][3], const uint8_t B[3][3], uint32_t C[3][3]){
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      uint32_t s=0u;
      for(int k=0;k<3;k++) s += (uint32_t)A[i][k]*(uint32_t)B[k][j];
      C[i][j]=s;
    }
  }
}

/* ===== Bench: CFS path (6 writes + 9 reads only) ===== */
static uint32_t bench_cfs_once(const uint8_t A[3][3], const uint8_t B[3][3],
                               uint32_t *cycles, uint32_t *insts, uint32_t C[3][3]) {
  uint32_t Ap0 = pack3_u8(A[0][0],A[0][1],A[0][2]);
  uint32_t Ap1 = pack3_u8(A[1][0],A[1][1],A[1][2]);
  uint32_t Ap2 = pack3_u8(A[2][0],A[2][1],A[2][2]);
  uint32_t Bp0 = pack3_u8(B[0][0],B[0][1],B[0][2]);
  uint32_t Bp1 = pack3_u8(B[1][0],B[1][1],B[1][2]);
  uint32_t Bp2 = pack3_u8(B[2][0],B[2][1],B[2][2]);

  uint64_t c0 = neorv32_cpu_get_cycle();
  uint64_t i0 = neorv32_cpu_get_instret();

  wr32(CFS_A_ROW0, Ap0); wr32(CFS_A_ROW1, Ap1); wr32(CFS_A_ROW2, Ap2);
  wr32(CFS_B_ROW0, Bp0); wr32(CFS_B_ROW1, Bp1); wr32(CFS_B_ROW2, Bp2);

  C[0][0]=rd32(CFS_C00); C[0][1]=rd32(CFS_C01); C[0][2]=rd32(CFS_C02);
  C[1][0]=rd32(CFS_C10); C[1][1]=rd32(CFS_C11); C[1][2]=rd32(CFS_C12);
  C[2][0]=rd32(CFS_C20); C[2][1]=rd32(CFS_C21); C[2][2]=rd32(CFS_C22);

  uint64_t c1 = neorv32_cpu_get_cycle();
  uint64_t i1 = neorv32_cpu_get_instret();

  *cycles = (uint32_t)(c1 - c0);
  *insts  = (uint32_t)(i1 - i0);

  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
}

/* ===== Bench: SW path (math only) ===== */
static uint32_t bench_sw_once(const uint8_t A[3][3], const uint8_t B[3][3],
                              uint32_t *cycles, uint32_t *insts, uint32_t C[3][3]) {
  uint64_t c0 = neorv32_cpu_get_cycle();
  uint64_t i0 = neorv32_cpu_get_instret();

  mul3x3_ref(A,B,C);

  uint64_t c1 = neorv32_cpu_get_cycle();
  uint64_t i1 = neorv32_cpu_get_instret();

  *cycles = (uint32_t)(c1 - c0);
  *insts  = (uint32_t)(i1 - i0);

  return C[0][0]+C[0][1]+C[0][2]+C[1][0]+C[1][1]+C[1][2]+C[2][0]+C[2][1]+C[2][2];
}

/* ===== One case: print inputs, results, cycles, instructions ===== */
static void run_case(const char *tag,
                     uint8_t a00,uint8_t a01,uint8_t a02,
                     uint8_t a10,uint8_t a11,uint8_t a12,
                     uint8_t a20,uint8_t a21,uint8_t a22,
                     uint8_t b00,uint8_t b01,uint8_t b02,
                     uint8_t b10,uint8_t b11,uint8_t b12,
                     uint8_t b20,uint8_t b21,uint8_t b22) {
  uint8_t  A[3][3] = {{a00,a01,a02},{a10,a11,a12},{a20,a21,a22}};
  uint8_t  B[3][3] = {{b00,b01,b02},{b10,b11,b12},{b20,b21,b22}};
  uint32_t Ccfs[3][3], Csw[3][3];
  uint32_t cyc_hw, ins_hw, cyc_sw, ins_sw;

  neorv32_uart0_printf("\n-- %s --\n", tag);
  neorv32_uart0_printf("A = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
                       A[0][0],A[0][1],A[0][2], A[1][0],A[1][1],A[1][2], A[2][0],A[2][1],A[2][2]);
  neorv32_uart0_printf("B = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
                       B[0][0],B[0][1],B[0][2], B[1][0],B[1][1],B[1][2], B[2][0],B[2][1],B[2][2]);

  /* single-shot */
  volatile uint32_t sink = 0;
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
  (void)sink;

  /* results + match */
  neorv32_uart0_printf("CFS C = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
                       Ccfs[0][0],Ccfs[0][1],Ccfs[0][2], Ccfs[1][0],Ccfs[1][1],Ccfs[1][2], Ccfs[2][0],Ccfs[2][1],Ccfs[2][2]);
  neorv32_uart0_printf("SW  C = [[%u,%u,%u],[%u,%u,%u],[%u,%u,%u]]\n",
                       Csw[0][0],Csw[0][1],Csw[0][2], Csw[1][0],Csw[1][1],Csw[1][2], Csw[2][0],Csw[2][1],Csw[2][2]);
  neorv32_uart0_printf("Match: %s\n",
                       (Ccfs[0][0]==Csw[0][0] && Ccfs[0][1]==Csw[0][1] && Ccfs[0][2]==Csw[0][2] &&
                        Ccfs[1][0]==Csw[1][0] && Ccfs[1][1]==Csw[1][1] && Ccfs[1][2]==Csw[1][2] &&
                        Ccfs[2][0]==Csw[2][0] && Ccfs[2][1]==Csw[2][1] && Ccfs[2][2]==Csw[2][2]) ? "YES" : "NO");

  neorv32_uart0_printf("Single-shot:\n");
  neorv32_uart0_printf("  CFS: cycles=%u, inst=%u\n", cyc_hw, ins_hw);
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",  cyc_sw,  ins_sw);

  /* warm-up */
  for(int i=0;i<16;i++){ bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs); bench_sw_once(A,B,&cyc_sw,&ins_sw,Csw); }

  /* averaged */
  uint64_t sum_cyc_hw=0,sum_ins_hw=0,sum_cyc_sw=0,sum_ins_sw=0;
  for(int i=0;i<N_BENCH_ITERS;i++){
    bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
    bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
    sum_cyc_hw += cyc_hw; sum_ins_hw += ins_hw;
    sum_cyc_sw += cyc_sw; sum_ins_sw += ins_sw;
  }
  neorv32_uart0_printf("Averaged over %u iters:\n", (unsigned)N_BENCH_ITERS);
  neorv32_uart0_printf("  CFS: cycles=%u, inst=%u\n",
    (uint32_t)(sum_cyc_hw/N_BENCH_ITERS), (uint32_t)(sum_ins_hw/N_BENCH_ITERS));
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",
    (uint32_t)(sum_cyc_sw/N_BENCH_ITERS), (uint32_t)(sum_ins_sw/N_BENCH_ITERS));
}

int main(void){
  neorv32_uart0_setup(19200,0);
  neorv32_uart0_printf("\n[NEORV32 CFS 3x3 MatMul - Inputs, Results, Cycles, Instructions]\n");
  neorv32_uart0_printf("CFS base = 0x%08x, iters=%u\n",
                       (uint32_t)NEORV32_CFS_BASE, (unsigned)N_BENCH_ITERS);

  run_case("Case 1",
           1,2,3,
           4,5,6,
           7,8,9,
           9,8,7,
           6,5,4,
           3,2,1);

  run_case("Case 2",
           0,1,0,
           2,0,2,
           0,3,0,
           0,4,0,
           5,0,5,
           0,6,0);

  run_case("Case 3",
           12,7,3,
           5, 9,11,
           8, 2,4,
           13,2,6,
           10,5,1,
           7, 8,14);

  return 0;
}

