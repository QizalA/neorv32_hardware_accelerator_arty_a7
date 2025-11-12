#include <neorv32.h>
#include <stdint.h>

/* ==================== Config ==================== */
#ifndef BAUD
#define BAUD 19200
#endif

/* Set this to your mapped base (from scanner output): */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u
#endif

#define M 128
#define N 128
#define K 128

/* Word map (word offsets, 32-bit) */
#define CFS_CTL_OFS  0
#define CFS_A0_OFS   1
#define CFS_A1_OFS   2
#define CFS_A2_OFS   3
#define CFS_A3_OFS   4
#define CFS_B0_OFS   5
#define CFS_B1_OFS   6
#define CFS_B2_OFS   7
#define CFS_B3_OFS   8
#define CFS_C_OFS(i) (16 + (i)) /* i=0..15 */

/* MMIO access */
#define REG32_OF(o)  (*(volatile uint32_t*)(CFS_BASE + ((o)<<2)))

/* CTL bits */
#define CTL_START (1u<<0)
#define CTL_CLEAR (1u<<1)

/* ==================== Tiny UART utils ==================== */
static inline void fence_io(void){ __asm__ volatile("fence iorw, iorw" ::: "memory"); }

static void put_ch(char c){ neorv32_uart0_putc(c); }
static void put_str(const char* s){ neorv32_uart0_puts(s); }

static void put_hex32(uint32_t x){
  static const char H[]="0123456789ABCDEF";
  put_str("0x");
  for(int i=7;i>=0;i--) put_ch(H[(x>>(i*4))&0xF]);
}

/* print unsigned with commas, e.g., 1,234,567 */
static void put_u32_commas(uint32_t v){
  char buf[16]; int len=0, cnt=0;
  if(v==0){ put_ch('0'); return; }
  while(v){
    if(cnt==3){ buf[len++]=','; cnt=0; }
    buf[len++] = '0' + (v%10u); v/=10u; cnt++;
  }
  for(int i=len-1;i>=0;i--) put_ch(buf[i]);
}

static void put_i32_dec(int32_t x){
  if(x<0){ put_ch('-'); uint32_t u = (uint32_t)(-x); put_u32_commas(u); }
  else { put_u32_commas((uint32_t)x); }
}

static void print_line(char c, int n){
  for(int i=0;i<n;i++) put_ch(c);
  put_ch('\n');
}

/* Simple key: value printer */
static void print_kv_str(const char* key, const char* value){
  put_str(key); put_str(": "); put_str(value); put_ch('\n');
}
static void print_kv_hex(const char* key, uint32_t v){
  put_str(key); put_str(": "); put_hex32(v); put_ch('\n');
}
static void print_kv_u32(const char* key, uint32_t v){
  put_str(key); put_str(": "); put_u32_commas(v); put_ch('\n');
}

/* Print ratio as X.XXx; computes (num/den) with 2 decimals */
static void print_speedup_2dp(const char* label, uint32_t num, uint32_t den){
  uint64_t n = num, d = den ? den : 1;
  uint64_t scaled = (n * 100ull + d/2) / d; /* round to nearest */
  uint32_t whole = (uint32_t)(scaled / 100ull);
  uint32_t frac  = (uint32_t)(scaled % 100ull);
  put_str(label); put_str(": ");
  put_u32_commas(whole); put_ch('.');
  put_ch('0' + (frac/10)); put_ch('0' + (frac%10));
  put_ch('x'); put_ch('\n');
}

/* ==================== Math helpers ==================== */
static inline uint32_t pack4(int8_t x0,int8_t x1,int8_t x2,int8_t x3){
  return ((uint8_t)x0) | ((uint32_t)(uint8_t)x1<<8)
       | ((uint32_t)(uint8_t)x2<<16) | ((uint32_t)(uint8_t)x3<<24);
}

/* deterministic int8 data */
static inline int8_t genA(int i,int k){
  int v = (i*7 + k*5 - 9);
  v = ((v%19)+19)%19; /* 0..18 */
  return (int8_t)(v - 9); /* -9..+9 */
}
static inline int8_t genB(int k,int j){
  int v = (k*3 - j*5 + 11);
  v = ((v%21)+21)%21; /* 0..20 */
  return (int8_t)(v - 10); /* -10..+10 */
}

/* FNV-1a 32 */
static inline uint32_t fnv32_update(uint32_t h, uint32_t x){
  h ^= x; h *= 16777619u; return h;
}

/* ==================== CFS 4x4 tile via hardware ==================== */
static void cfs_tile_4x4(int i0, int j0, int32_t c[16]){
  REG32_OF(CFS_CTL_OFS) = CTL_CLEAR; fence_io();

  for(int k=0; k<K; k+=4){
    /* A rows (i0..i0+3, k..k+3) */
    int8_t a00=genA(i0+0,k+0), a01=genA(i0+0,k+1), a02=genA(i0+0,k+2), a03=genA(i0+0,k+3);
    int8_t a10=genA(i0+1,k+0), a11=genA(i0+1,k+1), a12=genA(i0+1,k+2), a13=genA(i0+1,k+3);
    int8_t a20=genA(i0+2,k+0), a21=genA(i0+2,k+1), a22=genA(i0+2,k+2), a23=genA(i0+2,k+3);
    int8_t a30=genA(i0+3,k+0), a31=genA(i0+3,k+1), a32=genA(i0+3,k+2), a33=genA(i0+3,k+3);

    REG32_OF(CFS_A0_OFS) = pack4(a00,a01,a02,a03);
    REG32_OF(CFS_A1_OFS) = pack4(a10,a11,a12,a13);
    REG32_OF(CFS_A2_OFS) = pack4(a20,a21,a22,a23);
    REG32_OF(CFS_A3_OFS) = pack4(a30,a31,a32,a33);

    /* B columns (j0..j0+3, rows k..k+3) */
    int8_t b00=genB(k+0,j0+0), b01=genB(k+1,j0+0), b02=genB(k+2,j0+0), b03=genB(k+3,j0+0);
    int8_t b10=genB(k+0,j0+1), b11=genB(k+1,j0+1), b12=genB(k+2,j0+1), b13=genB(k+3,j0+1);
    int8_t b20=genB(k+0,j0+2), b21=genB(k+1,j0+2), b22=genB(k+2,j0+2), b23=genB(k+3,j0+2);
    int8_t b30=genB(k+0,j0+3), b31=genB(k+1,j0+3), b32=genB(k+2,j0+3), b33=genB(k+3,j0+3);

    REG32_OF(CFS_B0_OFS) = pack4(b00,b01,b02,b03);
    REG32_OF(CFS_B1_OFS) = pack4(b10,b11,b12,b13);
    REG32_OF(CFS_B2_OFS) = pack4(b20,b21,b22,b23);
    REG32_OF(CFS_B3_OFS) = pack4(b30,b31,b32,b33);

    REG32_OF(CFS_CTL_OFS) = CTL_START; fence_io();
  }

  for(int t=0; t<16; t++) c[t] = (int32_t)REG32_OF(CFS_C_OFS(t));
}

/* ==================== Pure SW 4x4 tile ==================== */
static void sw_tile_4x4(int i0, int j0, int32_t d[16]){
  for(int i = 0; i < 16; i++) d[i] = 0;

  for(int k = 0; k < K; k++) {
    int8_t a0 = genA(i0 + 0, k), a1 = genA(i0 + 1, k), a2 = genA(i0 + 2, k), a3 = genA(i0 + 3, k);
    int8_t b0 = genB(k, j0 + 0), b1 = genB(k, j0 + 1), b2 = genB(k, j0 + 2), b3 = genB(k, j0 + 3);

    d[0] += (int32_t)a0 * b0; d[1] += (int32_t)a0 * b1; d[2] += (int32_t)a0 * b2; d[3] += (int32_t)a0 * b3;
    d[4] += (int32_t)a1 * b0; d[5] += (int32_t)a1 * b1; d[6] += (int32_t)a1 * b2; d[7] += (int32_t)a1 * b3;
    d[8] += (int32_t)a2 * b0; d[9] += (int32_t)a2 * b1; d[10] += (int32_t)a2 * b2; d[11] += (int32_t)a2 * b3;
    d[12] += (int32_t)a3 * b0; d[13] += (int32_t)a3 * b1; d[14] += (int32_t)a3 * b2; d[15] += (int32_t)a3 * b3;
  }
}

/* ==================== Main ==================== */
int main(void){
  neorv32_uart0_setup(BAUD, 0);

  put_str("\n[NEORV32] GEMM i8 — CFS vs SW (4x4 tiling)\n");
  put_str("Config : M="); put_u32_commas(M);
  put_str("  N=");        put_u32_commas(N);
  put_str("  K=");        put_u32_commas(K);
  put_str("  CFS_BASE="); put_hex32(CFS_BASE); put_ch('\n');
  print_line('-', 60);

  uint64_t t0, t1, i0, i1;
  uint32_t h_cfs = 2166136261u, h_sw = 2166136261u;
  int32_t sample_c0=0, sample_cmid=0, sample_clast=0;
  int32_t sample_d0=0, sample_dmid=0, sample_dlast=0;

  /* --- CFS run --- */
  t0 = neorv32_cpu_get_cycle(); i0 = neorv32_cpu_get_instret();
  for(int ii=0; ii<M; ii+=4){
    for(int jj=0; jj<N; jj+=4){
      int32_t c[16];
      cfs_tile_4x4(ii, jj, c);
      for(int t=0;t<16;t++) h_cfs = fnv32_update(h_cfs, (uint32_t)c[t]);
      if(ii==0 && jj==0)                         sample_c0    = c[0];
      if(ii==((M/2)&~3) && jj==((N/2)&~3))       sample_cmid  = c[0];
      if(ii==(M-4) && jj==(N-4))                 sample_clast = c[15];
    }
  }
  t1 = neorv32_cpu_get_cycle(); i1 = neorv32_cpu_get_instret();
  uint32_t cyc_cfs = (uint32_t)(t1 - t0);
  uint32_t ins_cfs = (uint32_t)(i1 - i0);
  print_kv_u32("CFS cycles", cyc_cfs);
  print_kv_u32("CFS instret", ins_cfs);
  print_kv_hex("CFS hash", h_cfs);
  put_str("CFS samples: C[0,0]="); put_i32_dec(sample_c0);
  put_str("  C[mid]=");           put_i32_dec(sample_cmid);
  put_str("  C[last]=");          put_i32_dec(sample_clast); put_ch('\n');
  print_line('-', 60);

  /* --- SW run --- */
  t0 = neorv32_cpu_get_cycle(); i0 = neorv32_cpu_get_instret();
  for(int ii=0; ii<M; ii+=4){
    for(int jj=0; jj<N; jj+=4){
      int32_t d[16];
      sw_tile_4x4(ii, jj, d);
      for(int t=0;t<16;t++) h_sw = fnv32_update(h_sw, (uint32_t)d[t]);
      if(ii==0 && jj==0)                         sample_d0    = d[0];
      if(ii==((M/2)&~3) && jj==((N/2)&~3))       sample_dmid  = d[0];
      if(ii==(M-4) && jj==(N-4))                 sample_dlast = d[15];
    }
  }
  t1 = neorv32_cpu_get_cycle(); i1 = neorv32_cpu_get_instret();
  uint32_t cyc_sw = (uint32_t)(t1 - t0);
  uint32_t ins_sw = (uint32_t)(i1 - i0);
  print_kv_u32("SW  cycles", cyc_sw);
  print_kv_u32("SW  instret", ins_sw);
  print_kv_hex("SW  hash", h_sw);
  put_str("SW  samples: D[0,0]="); put_i32_dec(sample_d0);
  put_str("  D[mid]=");            put_i32_dec(sample_dmid);
  put_str("  D[last]=");           put_i32_dec(sample_dlast); put_ch('\n');
  print_line('-', 60);

  /* --- verdict & speedup (from this run) --- */
  if(h_cfs == h_sw){
    print_kv_str("Verdict", "PASS (hash match)");
  } else {
    print_kv_str("Verdict", "FAIL (hash mismatch)");
  }
  print_speedup_2dp("Speedup (cycles)",  cyc_sw,  cyc_cfs);
  print_speedup_2dp("Speedup (instret)", ins_sw,  ins_cfs);

  return (h_cfs==h_sw)? 0 : 1;
}

