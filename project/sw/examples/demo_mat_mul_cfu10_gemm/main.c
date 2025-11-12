#include <neorv32.h>
#include <stdint.h>

/* ---- Tunables (can be overridden via -D on the make line) ---- */
#ifndef BAUD
#define BAUD 19200
#endif
#ifndef M
#define M 128
#endif
#ifndef N
#define N 128
#endif
#ifndef K
#define K 128
#endif

/* ---- Small utilities (no large buffers, no heavy printf use) ---- */

static inline uint32_t fnv1a32_step(uint32_t h, int32_t v) {
  h ^= (uint32_t)v;
  h *= 16777619u; // FNV prime
  return h;
}

static inline int32_t clamp_int32(int32_t x) { return x; } // placeholder

// Deterministic “synthetic” A(i,k) & B(k,j) in [-7..7], no storage needed
static inline int8_t A_ik(int i, int k) {
  int t = ((i*5 + k*3) ^ (i<<1) ^ (k<<2)) % 15; // 0..14
  return (int8_t)(t - 7);
}
static inline int8_t B_kj(int k, int j) {
  int t = ((k*7 + j*11) ^ (k<<3) ^ (j)) % 15;
  return (int8_t)(7 - t);
}

// Pack 4 signed bytes (little-endian) into int32
static inline int32_t pack4s8(int8_t a0,int8_t a1,int8_t a2,int8_t a3){
  return  ((uint32_t)(uint8_t)a0) |
         (((uint32_t)(uint8_t)a1) <<  8) |
         (((uint32_t)(uint8_t)a2) << 16) |
         (((uint32_t)(uint8_t)a3) << 24);
}

/* ---- CFU: dp4a(rs1, rs2) = sum_{b=0..3} (int8(rs1.byte[b]) * int8(rs2.byte[b])) ----
 * Encoding: .insn r 0x0b, 0, 1, rd, rs1, rs2   (CUSTOM_0, funct3=000, funct7=0000001)
 */
static inline int32_t cfu_dp4a(int32_t a_vec, int32_t b_vec) {
#ifdef USE_CFU
  int32_t r;
  asm volatile (".insn r 0x0b, 0, 1, %0, %1, %2"
                : "=r"(r)
                : "r"(a_vec), "r"(b_vec));
  return r;
#else
  // Software fallback: do the same math byte-by-byte
  int8_t *ap = (int8_t*)&a_vec, *bp = (int8_t*)&b_vec;
  return (int32_t)ap[0]*bp[0] + (int32_t)ap[1]*bp[1] +
         (int32_t)ap[2]*bp[2] + (int32_t)ap[3]*bp[3];
#endif
}

/* ---- Pure software dot for tail handling / reference ---- */
static inline int32_t dot_sw4(int8_t a0,int8_t a1,int8_t a2,int8_t a3,
                              int8_t b0,int8_t b1,int8_t b2,int8_t b3) {
  return (int32_t)a0*b0 + (int32_t)a1*b1 + (int32_t)a2*b2 + (int32_t)a3*b3;
}

/* Compute one C[i,j] using CFU dp4a (plus scalar for tail) */
static inline int32_t cij_cfu(int i, int j) {
  int32_t acc = 0;
  int k = 0;
  for (; k+3 < K; k += 4) {
    int8_t a0=A_ik(i,k+0), a1=A_ik(i,k+1), a2=A_ik(i,k+2), a3=A_ik(i,k+3);
    int8_t b0=B_kj(k+0,j), b1=B_kj(k+1,j), b2=B_kj(k+2,j), b3=B_kj(k+3,j);
    int32_t av = pack4s8(a0,a1,a2,a3);
    int32_t bv = pack4s8(b0,b1,b2,b3);
    acc += cfu_dp4a(av, bv);
  }
  // tail
  for (; k < K; k++) {
    acc += (int32_t)A_ik(i,k) * (int32_t)B_kj(k,j);
  }
  return acc;
}

/* Compute one C[i,j] in pure software */
static inline int32_t cij_sw(int i, int j) {
  int32_t acc = 0;
  int k = 0;
  for (; k+3 < K; k += 4) {
    int8_t a0=A_ik(i,k+0), a1=A_ik(i,k+1), a2=A_ik(i,k+2), a3=A_ik(i,k+3);
    int8_t b0=B_kj(k+0,j), b1=B_kj(k+1,j), b2=B_kj(k+2,j), b3=B_kj(k+3,j);
    acc += dot_sw4(a0,a1,a2,a3,b0,b1,b2,b3);
  }
  for (; k < K; k++) {
    acc += (int32_t)A_ik(i,k) * (int32_t)B_kj(k,j);
  }
  return acc;
}

/* Full GEMM passes that return FNV32 of the output matrix and some sample values */
typedef struct { uint32_t fnv; int32_t c00, cmid, clast; } gemm_result_t;

static gemm_result_t gemm_pass_cfu(void) {
  gemm_result_t R = { .fnv = 2166136261u, .c00=0, .cmid=0, .clast=0 };
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      int32_t c = cij_cfu(i,j);
      // sample taps
      if (i==0 && j==0) R.c00 = c;
      if (i==(M/2) && j==(N/2)) R.cmid = c;
      if (i==M-1 && j==N-1) R.clast = c;
      R.fnv = fnv1a32_step(R.fnv, c);
    }
  }
  return R;
}

static gemm_result_t gemm_pass_sw(void) {
  gemm_result_t R = { .fnv = 2166136261u, .c00=0, .cmid=0, .clast=0 };
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      int32_t c = cij_sw(i,j);
      if (i==0 && j==0) R.c00 = c;
      if (i==(M/2) && j==(N/2)) R.cmid = c;
      if (i==M-1 && j==N-1) R.clast = c;
      R.fnv = fnv1a32_step(R.fnv, c);
    }
  }
  return R;
}

/* Optional correctness pass: compute both per element and count mismatches (no storage) */
static uint32_t compare_full_and_count(void) {
  uint32_t mism = 0;
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      int32_t a = cij_sw(i,j);
      int32_t b = cij_cfu(i,j);
      if (a != b) mism++;
    }
  }
  return mism;
}

int main(void) {
  // minimal init
  neorv32_uart0_setup(BAUD, 0);

  neorv32_uart0_puts("\n\n[NEORV32] GEMM i8 — CFU vs SW (no buffers)\n");
  neorv32_uart0_printf("M=%u N=%u K=%u  (BAUD=%u)\n", (uint32_t)M, (uint32_t)N, (uint32_t)K, (uint32_t)BAUD);
#ifdef USE_CFU
  neorv32_uart0_puts("CFU: using CUSTOM_0 / funct7=1 dp4a\n");
#else
  neorv32_uart0_puts("CFU: not used (compiled without USE_CFU)\n");
#endif

  // ---- CFU pass (timed) ----
  uint64_t c0 = neorv32_cpu_get_cycle();
  uint64_t i0 = neorv32_cpu_get_instret();
  gemm_result_t Rc = gemm_pass_cfu();
  uint64_t c1 = neorv32_cpu_get_cycle();
  uint64_t i1 = neorv32_cpu_get_instret();

  // ---- SW pass (timed) ----
  uint64_t c2 = neorv32_cpu_get_cycle();
  uint64_t i2 = neorv32_cpu_get_instret();
  gemm_result_t Rs = gemm_pass_sw();
  uint64_t c3 = neorv32_cpu_get_cycle();
  uint64_t i3 = neorv32_cpu_get_instret();

  // 32-bit deltas (tiny printf is 32-bit)
  uint32_t cfu_cycles  = (uint32_t)(c1 - c0);
  uint32_t cfu_instret = (uint32_t)(i1 - i0);
  uint32_t sw_cycles   = (uint32_t)(c3 - c2);
  uint32_t sw_instret  = (uint32_t)(i3 - i2);

  neorv32_uart0_printf("CFU cycles=%u  instret=%u\n", cfu_cycles, cfu_instret);
  neorv32_uart0_printf("SW  cycles=%u  instret=%u\n",  sw_cycles,  sw_instret);

  neorv32_uart0_printf("FNV32(CFU)=%u  FNV32(SW)=%u\n", Rc.fnv, Rs.fnv);
  neorv32_uart0_printf("C[0,0]=%i  C[mid]=%i  C[last]=%i (CFU)\n", Rc.c00, Rc.cmid, Rc.clast);
  neorv32_uart0_printf("D[0,0]=%i  D[mid]=%i  D[last]=%i (SW)\n",  Rs.c00, Rs.cmid, Rs.clast);

  // Quick verdict based on hashes:
  int pass = (Rc.fnv == Rs.fnv) && (Rc.c00==Rs.c00) && (Rc.cmid==Rs.cmid) && (Rc.clast==Rs.clast);

  // (Optional but thorough) full mismatch count. Comment this out if runtime is too long.
  uint32_t mism = 0;
  if (pass) {
    mism = compare_full_and_count();
  }

  if (pass && mism == 0) {
    neorv32_uart0_puts("RESULT: PASS (mismatches=0)\n");
  } else if (pass) {
    neorv32_uart0_printf("RESULT: PASS by hash, but mismatches reported=%u\n", mism);
  } else {
    neorv32_uart0_puts("RESULT: FAIL — outputs differ\n");
  }

  return 0;
}

