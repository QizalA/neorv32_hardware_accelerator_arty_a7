#include <neorv32.h>
#include <stdint.h>

/* ===== Base + Offsets (must match your 4x4 CFS VHDL) ===== */
#ifndef NEORV32_CFS_BASE
#define NEORV32_CFS_BASE 0xFFFFFE00UL
#endif

/* Write (packed rows, 4 bytes per row) */
#define CFS_A_ROW0   (NEORV32_CFS_BASE + 0x00)  // idx 0
#define CFS_A_ROW1   (NEORV32_CFS_BASE + 0x04)  // idx 1
#define CFS_A_ROW2   (NEORV32_CFS_BASE + 0x08)  // idx 2
#define CFS_A_ROW3   (NEORV32_CFS_BASE + 0x0C)  // idx 3
#define CFS_B_ROW0   (NEORV32_CFS_BASE + 0x10)  // idx 4
#define CFS_B_ROW1   (NEORV32_CFS_BASE + 0x14)  // idx 5
#define CFS_B_ROW2   (NEORV32_CFS_BASE + 0x18)  // idx 6
#define CFS_B_ROW3   (NEORV32_CFS_BASE + 0x1C)  // idx 7

/* Read (results, row-major, 32-bit each) -> idx 16..31 => offsets 0x40..0x7C */
#define CFS_C(i,j)   (NEORV32_CFS_BASE + 0x40 + (((i)*4 + (j))<<2))

#define N_BENCH_ITERS 1000  // average over this many runs

/* ===== MMIO helpers ===== */
static inline void wr32(uint32_t a, uint32_t v){ *(volatile uint32_t*)a = v; }
static inline uint32_t rd32(uint32_t a){ return *(volatile uint32_t*)a; }

/* ===== Pack row: {x3[31:24], x2[23:16], x1[15:8], x0[7:0]} ===== */
static inline uint32_t pack4_u8(uint8_t x0, uint8_t x1, uint8_t x2, uint8_t x3){
  return ((uint32_t)x3<<24) | ((uint32_t)x2<<16) | ((uint32_t)x1<<8) | (uint32_t)x0;
}

/* ===== CPU reference (unsigned) ===== */
static inline void mul4x4_ref(const uint8_t A[4][4], const uint8_t B[4][4], uint32_t C[4][4]){
  for(int i=0;i<4;i++){
    for(int j=0;j<4;j++){
      uint32_t s=0u;
      for(int k=0;k<4;k++) s += (uint32_t)A[i][k]*(uint32_t)B[k][j];
      C[i][j]=s;
    }
  }
}

/* ===== Bench: CFS path (8 writes + 16 reads only) ===== */
static uint32_t bench_cfs_once(const uint8_t A[4][4], const uint8_t B[4][4],
                               uint32_t *cycles, uint32_t *insts, uint32_t C[4][4]) {
  uint32_t Ap0 = pack4_u8(A[0][0],A[0][1],A[0][2],A[0][3]);
  uint32_t Ap1 = pack4_u8(A[1][0],A[1][1],A[1][2],A[1][3]);
  uint32_t Ap2 = pack4_u8(A[2][0],A[2][1],A[2][2],A[2][3]);
  uint32_t Ap3 = pack4_u8(A[3][0],A[3][1],A[3][2],A[3][3]);
  uint32_t Bp0 = pack4_u8(B[0][0],B[0][1],B[0][2],B[0][3]);
  uint32_t Bp1 = pack4_u8(B[1][0],B[1][1],B[1][2],B[1][3]);
  uint32_t Bp2 = pack4_u8(B[2][0],B[2][1],B[2][2],B[2][3]);
  uint32_t Bp3 = pack4_u8(B[3][0],B[3][1],B[3][2],B[3][3]);

  uint64_t c0 = neorv32_cpu_get_cycle();
  uint64_t i0 = neorv32_cpu_get_instret();

  wr32(CFS_A_ROW0, Ap0); wr32(CFS_A_ROW1, Ap1); wr32(CFS_A_ROW2, Ap2); wr32(CFS_A_ROW3, Ap3);
  wr32(CFS_B_ROW0, Bp0); wr32(CFS_B_ROW1, Bp1); wr32(CFS_B_ROW2, Bp2); wr32(CFS_B_ROW3, Bp3);

  for(int i=0;i<4;i++)
    for(int j=0;j<4;j++)
      C[i][j] = rd32(CFS_C(i,j));

  uint64_t c1 = neorv32_cpu_get_cycle();
  uint64_t i1 = neorv32_cpu_get_instret();

  *cycles = (uint32_t)(c1 - c0);
  *insts  = (uint32_t)(i1 - i0);

  uint32_t sum=0; for(int i=0;i<4;i++) for(int j=0;j<4;j++) sum+=C[i][j];
  return sum; // consume to avoid optimizing away
}

/* ===== Bench: SW path (math only) ===== */
static uint32_t bench_sw_once(const uint8_t A[4][4], const uint8_t B[4][4],
                              uint32_t *cycles, uint32_t *insts, uint32_t C[4][4]) {
  uint64_t c0 = neorv32_cpu_get_cycle();
  uint64_t i0 = neorv32_cpu_get_instret();

  mul4x4_ref(A,B,C);

  uint64_t c1 = neorv32_cpu_get_cycle();
  uint64_t i1 = neorv32_cpu_get_instret();

  *cycles = (uint32_t)(c1 - c0);
  *insts  = (uint32_t)(i1 - i0);

  uint32_t sum=0; for(int i=0;i<4;i++) for(int j=0;j<4;j++) sum+=C[i][j];
  return sum;
}

/* ===== Pretty print helpers ===== */
static void print_u8_mat4(const char* name, const uint8_t M[4][4]){
  neorv32_uart0_printf("%s = [", name);
  for(int i=0;i<4;i++){
    neorv32_uart0_printf(i==0 ? "[" : " [");
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
    neorv32_uart0_printf(i==3 ? "]]\n" : "],\n");
  }
}
static void print_u32_mat4(const char* name, const uint32_t M[4][4]){
  neorv32_uart0_printf("%s = [", name);
  for(int i=0;i<4;i++){
    neorv32_uart0_printf(i==0 ? "[" : " [");
    for(int j=0;j<4;j++) neorv32_uart0_printf("%u%s", M[i][j], (j==3)? "":",");
    neorv32_uart0_printf(i==3 ? "]]\n" : "],\n");
  }
}

/* ===== One case ===== */
static void run_case(const char *tag,
                     const uint8_t A_[4][4],
                     const uint8_t B_[4][4]) {
  uint8_t  A[4][4]; uint8_t B[4][4];
  uint32_t Ccfs[4][4], Csw[4][4];
  uint32_t cyc_hw, ins_hw, cyc_sw, ins_sw;

  // copy inputs (avoid const aliasing)
  for(int i=0;i<4;i++) for(int j=0;j<4;j++){ A[i][j]=A_[i][j]; B[i][j]=B_[i][j]; }

  neorv32_uart0_printf("\n-- %s --\n", tag);
  print_u8_mat4("A", A);
  print_u8_mat4("B", B);

  // single-shot
  volatile uint32_t sink=0;
  sink += bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs);
  sink += bench_sw_once (A,B,&cyc_sw,&ins_sw,Csw);
  (void)sink;

  print_u32_mat4("CFS C", Ccfs);
  print_u32_mat4("SW  C", Csw);

  // match check
  int ok=1; for(int i=0;i<4;i++) for(int j=0;j<4;j++) if(Ccfs[i][j]!=Csw[i][j]) ok=0;
  neorv32_uart0_printf("Match: %s\n", ok? "YES":"NO");

  neorv32_uart0_printf("Single-shot:\n");
  neorv32_uart0_printf("  CFS: cycles=%u, inst=%u\n", cyc_hw, ins_hw);
  neorv32_uart0_printf("  SW : cycles=%u, inst=%u\n",  cyc_sw,  ins_sw);

  // warm-up
  for(int i=0;i<16;i++){ bench_cfs_once(A,B,&cyc_hw,&ins_hw,Ccfs); bench_sw_once(A,B,&cyc_sw,&ins_sw,Csw); }

  // averaged
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
  neorv32_uart0_printf("\n[NEORV32 CFS 4x4 MatMul - Inputs, Results, Cycles, Instructions]\n");
  neorv32_uart0_printf("CFS base = 0x%08x, iters=%u\n",
                       (uint32_t)NEORV32_CFS_BASE, (unsigned)N_BENCH_ITERS);

  // Case 1
  const uint8_t A1[4][4]={{1,2,3,4},{5,6,7,8},{9,8,7,6},{5,4,3,2}};
  const uint8_t B1[4][4]={{5,6,7,8},{1,0,0,1},{0,1,1,0},{1,1,0,0}};
  run_case("Case 1", A1, B1);

  // Case 2 (zeros & pattern)
  const uint8_t A2[4][4]={{0,10,0,20},{1,0,2,0},{3,0,0,4},{0,5,0,6}};
  const uint8_t B2[4][4]={{0,3,4,0},{5,0,0,6},{0,7,8,0},{9,0,0,1}};
  run_case("Case 2", A2, B2);

  // Case 3 (random-ish)
  const uint8_t A3[4][4]={{12,7,3,9},{5, 9,11,4},{8, 2,4, 6},{13,2,6,10}};
  const uint8_t B3[4][4]={{10,5,1,7},{8,14,3,2},{6, 4,9,11},{2, 1,8,12}};
  run_case("Case 3", A3, B3);

  // Case 4 (all 255)
  const uint8_t A4[4][4]={{255,255,255,255},{255,255,255,255},{255,255,255,255},{255,255,255,255}};
  const uint8_t B4[4][4]={{255,255,255,255},{255,255,255,255},{255,255,255,255},{255,255,255,255}};
  run_case("Case 4", A4, B4);

  return 0;
}

