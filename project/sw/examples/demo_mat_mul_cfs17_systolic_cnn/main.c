#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

/* =======================
   CFS config
   ======================= */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u
#endif

#define CFS_REG(off)   (*(volatile uint32_t*)(CFS_BASE + ((off) << 2)))
#define CFS_CTL        0   /* write: bit0=STEP, bit1=CLEAR | read: 0xCAFEBABE */
#define CFS_A0         1
#define CFS_A1         2
#define CFS_A2         3
#define CFS_A3         4
#define CFS_B0         5
#define CFS_B1         6
#define CFS_B2         7
#define CFS_B3         8
#define CFS_C0        16  /* .. CFS_C15 = 31 */

static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
static inline void cfs_clear(void) { cfs_write(CFS_CTL, 0b10u); } /* bit1=CLEAR */
static inline void cfs_step (void) { cfs_write(CFS_CTL, 0b01u); } /* bit0=STEP  */
static inline uint32_t pack4_s8(int8_t x0,int8_t x1,int8_t x2,int8_t x3){
  return  ((uint32_t)(uint8_t)x0)        |
         (((uint32_t)(uint8_t)x1) << 8)  |
         (((uint32_t)(uint8_t)x2) << 16) |
         (((uint32_t)(uint8_t)x3) << 24);
}

/* =======================
   Small CNN layer (INT8 conv->INT32 accum)
   Params (change as you like)
   ======================= */
#define H   8
#define W   8
#define Cin 4
#define Cout 8
#define Kh  3
#define Kw  3
#define Stride 1
#define Pad    0

#define Hout  ((H + 2*Pad - Kh)/Stride + 1)  /* 6 */
#define Wout  ((W + 2*Pad - Kw)/Stride + 1)  /* 6 */

#define TILE 4                /* CFS is 4x4 */
#define KCONV (Cin*Kh*Kw)     /* dot length for each output */

#define MAXK 256              /* >= KCONV; flat A stride */
#define LDA  (MAXK)           /* A_flat: 4 rows x MAXK cols */
#define LDB  (4)              /* B_flat: MAXK rows x 4 cols */

/* =======================
   CSRs for timing
   ======================= */
static inline uint64_t rdcycle(void){
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,mcycleh":"=r"(hi1));
       __asm__ volatile("csrr %0,mcycle" :"=r"(lo));
       __asm__ volatile("csrr %0,mcycleh":"=r"(hi2)); } while (hi1 != hi2);
  return ((uint64_t)hi1<<32)|lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,mcycle":"=r"(v)); return v;
#endif
}
static inline uint64_t rdinstret(void){
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,minstreth":"=r"(hi1));
       __asm__ volatile("csrr %0,minstret" :"=r"(lo));
       __asm__ volatile("csrr %0,minstreth":"=r"(hi2)); } while (hi1 != hi2);
  return ((uint64_t)hi1<<32)|lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,minstret":"=r"(v)); return v;
#endif
}

/* =======================
   Systolic streamer (skewed, packed per 4 steps)
   ======================= */
static void cfs_gemm_systolic_4xK_Kx4_skewed_packed4(const int8_t *A_flat,
                                                     const int8_t *B_flat,
                                                     int K){
  cfs_clear();
  const int T = K + 6; /* K data + (4-1)+(4-1) flush */
  for (int t=0; t<T; t+=4){
    int8_t a_bytes[TILE][4]={{0}}, b_bytes[TILE][4]={{0}};
    for (int i=0;i<TILE;i++) for (int s=0;s<4;s++){
      int k=(t+s)-i; if (k>=0 && k<K) a_bytes[i][s]=A_flat[i*LDA+k];
    }
    for (int j=0;j<TILE;j++) for (int s=0;s<4;s++){
      int k=(t+s)-j; if (k>=0 && k<K) b_bytes[j][s]=B_flat[k*LDB+j];
    }
    cfs_write(CFS_A0, pack4_s8(a_bytes[0][0],a_bytes[0][1],a_bytes[0][2],a_bytes[0][3]));
    cfs_write(CFS_A1, pack4_s8(a_bytes[1][0],a_bytes[1][1],a_bytes[1][2],a_bytes[1][3]));
    cfs_write(CFS_A2, pack4_s8(a_bytes[2][0],a_bytes[2][1],a_bytes[2][2],a_bytes[2][3]));
    cfs_write(CFS_A3, pack4_s8(a_bytes[3][0],a_bytes[3][1],a_bytes[3][2],a_bytes[3][3]));
    cfs_write(CFS_B0, pack4_s8(b_bytes[0][0],b_bytes[0][1],b_bytes[0][2],b_bytes[0][3]));
    cfs_write(CFS_B1, pack4_s8(b_bytes[1][0],b_bytes[1][1],b_bytes[1][2],b_bytes[1][3]));
    cfs_write(CFS_B2, pack4_s8(b_bytes[2][0],b_bytes[2][1],b_bytes[2][2],b_bytes[2][3]));
    cfs_write(CFS_B3, pack4_s8(b_bytes[3][0],b_bytes[3][1],b_bytes[3][2],b_bytes[3][3]));
    int steps=(t+4<=T)?4:(T-t); for (int s=0;s<steps;s++) cfs_step();
  }
}

/* Read CFS 4x4 into dst */
static void cfs_read_C4(int32_t dst[4][4]){
  for (int i=0;i<4;i++) for (int j=0;j<4;j++)
    dst[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
}

/* =======================
   Test data generators (no big arrays)
   ======================= */
static inline int8_t pat_in(int n,int c,int y,int x){
  (void)n; /* single image */
  return (int8_t)(((c+1)*(y+2) + (x)) & 0x0F) - 8; /* small ranged pattern */
}
static inline int8_t pat_wt(int oc,int c,int ky,int kx){
  return (int8_t)((oc+1 + 3*c + 2*ky + kx) & 0x0F) - 8;
}
static inline int32_t pat_bias(int oc){ (void)oc; return 0; }

/* =======================
   SW reference conv (int8->int32), N=1, stride=1, pad=0
   ======================= */
static void conv2d_sw(int32_t Y[Cout][Hout][Wout]){
  for (int oc=0; oc<Cout; ++oc)
    for (int oy=0; oy<Hout; ++oy)
      for (int ox=0; ox<Wout; ++ox){
        int32_t s = pat_bias(oc);
        for (int c=0;c<Cin;++c)
          for (int ky=0;ky<Kh;++ky)
            for (int kx=0;kx<Kw;++kx){
              int iy = oy*Stride - Pad + ky;
              int ix = ox*Stride - Pad + kx;
              int8_t a = (iy>=0 && ix>=0 && iy<H && ix<W) ? pat_in(0,c,iy,ix) : 0;
              int8_t w = pat_wt(oc,c,ky,kx);
              s += (int32_t)a * (int32_t)w;
            }
        Y[oc][oy][ox] = s;
      }
}

/* =======================
   CFS conv using on-the-fly im2col for 4 out-ch × 4 pixels
   ======================= */
static void conv2d_cfs(int32_t Y[Cout][Hout][Wout]){
  static int8_t  A_flat[4*LDA];   /* 4 rows × MAXK cols */
  static int8_t  B_flat[MAXK*LDB];/* MAXK rows × 4 cols */
  int32_t C4[4][4];

  for (int oc0=0; oc0<Cout; oc0+=4){
    /* Pre-build A_flat rows from 4 output channels’ weights across K */
    for (int r=0; r<4; ++r){
      int oc = oc0 + r;
      for (int t=0, c=0; c<Cin; ++c)
        for (int ky=0; ky<Kh; ++ky)
          for (int kx=0; kx<Kw; ++kx, ++t){
            A_flat[r*LDA + t] = pat_wt(oc, c, ky, kx);
          }
      /* zero pad rest (tidy) */
      for (int t=KCONV; t<MAXK; ++t) A_flat[r*LDA + t] = 0;
    }

    for (int p0=0; p0 < Hout*Wout; p0+=4){
      /* For 4 output pixels (oy,ox), build B_flat K×4 */
      for (int t=0, c=0; c<Cin; ++c)
        for (int ky=0; ky<Kh; ++ky)
          for (int kx=0; kx<Kw; ++kx, ++t){
            for (int col=0; col<4; ++col){
              int p = p0 + col;
              int oy = p / Wout, ox = p % Wout;
              int iy = oy*Stride - Pad + ky;
              int ix = ox*Stride - Pad + kx;
              int8_t a = (p < Hout*Wout && iy>=0 && ix>=0 && iy<H && ix<W)
                        ? pat_in(0,c,iy,ix) : 0;
              B_flat[t*LDB + col] = a;
            }
          }
      /* run tile */
      cfs_gemm_systolic_4xK_Kx4_skewed_packed4(A_flat, B_flat, KCONV);
      cfs_read_C4(C4);

      /* store results (+bias; optional ReLU/requant placeholder) */
      for (int r=0; r<4; ++r){
        int oc = oc0 + r;
        for (int col=0; col<4; ++col){
          int p = p0 + col; if (p >= Hout*Wout) continue;
          int oy = p / Wout, ox = p % Wout;
          int32_t v = C4[r][col] + pat_bias(oc);
          Y[oc][oy][ox] = v; /* keep int32 */
        }
      }
    }
  }
}

/* =======================
   Pretty / helpers
   ======================= */
static void print_speedup_fixed(uint64_t num, uint64_t den){
  if (!den){ printf("n/a"); return; }
  uint64_t s=(num*1000ull + den/2)/den;
  printf("%" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}
static int compare_outputs(const int32_t A[Cout][Hout][Wout],
                           const int32_t B[Cout][Hout][Wout]){
  int mism=0;
  for (int oc=0; oc<Cout; ++oc)
    for (int y=0; y<Hout; ++y)
      for (int x=0; x<Wout; ++x)
        if (A[oc][y][x]!=B[oc][y][x]) ++mism;
  return mism;
}
static long long checksum(const int32_t Y[Cout][Hout][Wout]){
  long long s=0;
  for (int oc=0; oc<Cout; ++oc)
    for (int y=0; y<Hout; ++y)
      for (int x=0; x<Wout; ++x)
        s += (long long)Y[oc][y][x];
  return s;
}

/* =======================
   Main
   ======================= */
int main(void){
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));

  static int32_t Y_sw[Cout][Hout][Wout];
  static int32_t Y_hw[Cout][Hout][Wout];

  /* SW */
  uint64_t c0=rdcycle(), i0=rdinstret();
  conv2d_sw(Y_sw);
  uint64_t i1=rdinstret(), c1=rdcycle();
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;

  /* CFS */
  c0=rdcycle(); i0=rdinstret();
  conv2d_cfs(Y_hw);
  i1=rdinstret(); c1=rdcycle();
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;

  int mism = compare_outputs(Y_hw, Y_sw);
  long long sum_sw  = checksum(Y_sw);
  long long sum_cfs = checksum(Y_hw);

  printf("Conv2D params: HxW=%dx%d, Cin=%d, Cout=%d, KhxKw=%dx%d, stride=%d, pad=%d\n",
         H,W,Cin,Cout,Kh,Kw,Stride,Pad);
  printf("Output: %dx%dx%d (Hout x Wout x Cout)\n\n", Hout, Wout, Cout);

  printf("Path |   cycles   |  instret   |  Speedup(cyc) | Speedup(inst) |  checksum\n");
  printf("-----+------------+------------+---------------+---------------+-----------\n");
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |       --      |       --      | %9lld\n",
         sw_cyc, sw_ins, sum_sw);
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |    ", cfs_cyc, cfs_ins);
  print_speedup_fixed(sw_cyc, cfs_cyc); printf("     |    ");
  print_speedup_fixed(sw_ins, cfs_ins); printf("     | %9lld\n\n", sum_cfs);

  printf("Verdict: %s (%d mismatches)\n", (mism==0) ? "PASS" : "FAIL", mism);
  printf("\nNotes:\n");
  printf("- K for each CFS call is Cin*Kh*Kw = %d.\n", KCONV);
  printf("- We compute 4 output channels × 4 output pixels per CFS run.\n");
  printf("- Add bias/relu/requant where noted; keep int32 to avoid overflow.\n");
  printf("- For bigger layers, loop over tiles exactly like this (just bigger H,W,Cin,Cout).\n");
  return (mism==0) ? 0 : 1;
}

