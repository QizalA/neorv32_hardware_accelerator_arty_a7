// cnn_conv2d.c — Conv2D (int8) on SW vs CFU (DP4A) vs CFS (4×4 systolic)
// Build: riscv32-unknown-elf-gcc -O2 -march=rv32im -mabi=ilp32 cnn_conv2d.c -o cnn_conv2d.elf
// Options: -DCFS_BASE=0xFFxxxxxx -DCFS_FEEDER_BATCHED=1 (faster feeder) -DPRINT_SAMPLE=1

#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

/* =======================
   Problem config (edit if you like)
   ======================= */
#define Cin   4
#define Cout  8
#define H     16
#define W     16
#define Kh    3
#define Kw    3
#define STR   1
#define PAD   1

#define OH ((H + 2*PAD - Kh)/STR + 1)
#define OW ((W + 2*PAD - Kw)/STR + 1)
#define K  (Cin*Kh*Kw)           /* inner dot length */
#define NPOS (OH*OW)             /* spatial positions */

/* =======================
   CFS MMIO
   ======================= */
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u
#endif
#define CFS_REG(off)   (*(volatile uint32_t*)(CFS_BASE + ((off) << 2)))
#define CFS_CTL        0
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

/* =======================
   CSRs (cycles & instret)
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
   CFU DP4A
   ======================= */
#ifndef CFU_FUNCT3
#define CFU_FUNCT3 0x0     /* DP4A funct3 = 000 */
#endif
#ifndef CFU_FUNCT7
#define CFU_FUNCT7 0x1     /* DP4A funct7 = 0000001 */
#endif

static inline uint32_t pack4_s8_lsb(int8_t x0,int8_t x1,int8_t x2,int8_t x3){
  return  ((uint32_t)(uint8_t)x0)        |
         (((uint32_t)(uint8_t)x1) << 8)  |
         (((uint32_t)(uint8_t)x2) << 16) |
         (((uint32_t)(uint8_t)x3) << 24);
}
static inline int32_t cfu_dp4a(int32_t a_packed, int32_t b_packed){
  uint32_t r;
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
                    : "=r"(r)
                    : "i"(CFU_FUNCT3), "i"(CFU_FUNCT7),
                      "r"(a_packed), "r"(b_packed));
  return (int32_t)r;
}

/* =======================
   Test data patterns
   ======================= */
static inline int8_t patt_in (int c, int y, int x){ return (int8_t)(((c+1)*(y+2) + (x-3)) & 0x0F) - 8; }
static inline int8_t patt_wgt(int oc, int c, int ky, int kx){ return (int8_t)(((oc+2)*(ky+1) + (kx-2) + c) & 0x0F) - 8; }

/* =======================
   Utility
   ======================= */
static void print_speedup_fixed(uint64_t num, uint64_t den){
  if(!den){ printf("  n/a   "); return; }
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}
static int equal_arrays(const int32_t* A, const int32_t* B, int n){
  for(int i=0;i<n;++i) if(A[i]!=B[i]) return 0; return 1;
}

/* =======================
   SW reference Conv2D (NHWC-like spatial loop)
   ======================= */
static void conv2d_sw(const int8_t in[Cin][H][W],
                      const int8_t w[Cout][Cin][Kh][Kw],
                      int32_t out[Cout][OH][OW]) {
  for(int oc=0; oc<Cout; ++oc){
    for(int oy=0; oy<OH; ++oy){
      for(int ox=0; ox<OW; ++ox){
        int32_t acc=0;
        for(int c=0; c<Cin; ++c)
          for(int ky=0; ky<Kh; ++ky)
            for(int kx=0; kx<Kw; ++kx){
              int iy = oy*STR + ky - PAD;
              int ix = ox*STR + kx - PAD;
              int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
              int8_t b = w[oc][c][ky][kx];
              acc += (int32_t)a * (int32_t)b;
            }
        out[oc][oy][ox] = acc;
      }
    }
  }
}

/* =======================
   CFU Conv2D (DP4A over K, im2col-on-the-fly)
   ======================= */
static void conv2d_cfu(const int8_t in[Cin][H][W],
                       const int8_t w[Cout][Cin][Kh][Kw],
                       int32_t out[Cout][OH][OW]) {
  /* Prepack weights per-oc into a flat K-vector for contiguous access */
  static int8_t wflat[Cout][K];
  for(int oc=0; oc<Cout; ++oc){
    int idx=0;
    for(int c=0;c<Cin;++c)
      for(int ky=0;ky<Kh;++ky)
        for(int kx=0;kx<Kw;++kx)
          wflat[oc][idx++] = w[oc][c][ky][kx];
  }

  for(int oc=0; oc<Cout; ++oc){
    for(int oy=0; oy<OH; ++oy){
      for(int ox=0; ox<OW; ++ox){
        int32_t acc=0;
        int k=0;
        for(; k+3<K; k+=4){
          /* Build 4-lane vectors (input im2col, weight) */
          int8_t  wb0 = wflat[oc][k+0];
          int8_t  wb1 = wflat[oc][k+1];
          int8_t  wb2 = wflat[oc][k+2];
          int8_t  wb3 = wflat[oc][k+3];

          /* Map k -> (c, ky, kx) */
          int tmp = k;
          int c0  = tmp / (Kh*Kw);
          int rem = tmp % (Kh*Kw);
          int ky0 = rem / Kw;
          int kx0 = rem % Kw;

          tmp = k+1; int c1=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky1=rem/Kw; int kx1=rem%Kw;
          tmp = k+2; int c2=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky2=rem/Kw; int kx2=rem%Kw;
          tmp = k+3; int c3=tmp/(Kh*Kw); rem=tmp%(Kh*Kw); int ky3=rem/Kw; int kx3=rem%Kw;

          int iy0=oy*STR+ky0-PAD, ix0=ox*STR+kx0-PAD;
          int iy1=oy*STR+ky1-PAD, ix1=ox*STR+kx1-PAD;
          int iy2=oy*STR+ky2-PAD, ix2=ox*STR+kx2-PAD;
          int iy3=oy*STR+ky3-PAD, ix3=ox*STR+kx3-PAD;

          int8_t a0=(iy0>=0&&iy0<H&&ix0>=0&&ix0<W)? in[c0][iy0][ix0]:0;
          int8_t a1=(iy1>=0&&iy1<H&&ix1>=0&&ix1<W)? in[c1][iy1][ix1]:0;
          int8_t a2=(iy2>=0&&iy2<H&&ix2>=0&&ix2<W)? in[c2][iy2][ix2]:0;
          int8_t a3=(iy3>=0&&iy3<H&&ix3>=0&&ix3<W)? in[c3][iy3][ix3]:0;

          uint32_t ap = pack4_s8_lsb(a0,a1,a2,a3);
          uint32_t bp = pack4_s8_lsb(wb0,wb1,wb2,wb3);
          acc += cfu_dp4a((int32_t)ap, (int32_t)bp);
        }
        /* tail */
        for(; k<K; ++k){
          int c  = k /(Kh*Kw);
          int rem= k %(Kh*Kw);
          int ky = rem / Kw;
          int kx = rem % Kw;
          int iy = oy*STR + ky - PAD;
          int ix = ox*STR + kx - PAD;
          int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
          acc += (int32_t)a * (int32_t)wflat[oc][k];
        }
        out[oc][oy][ox]=acc;
      }
    }
  }
}

/* =======================
   CFS Conv2D via 4×4 GEMM tiles (im2col for 4 positions)
   ======================= */
static void cfs_feed_strict_step(const int8_t *Aflat, const int8_t *Bflat, int Klen, int lda, int ldb){
  cfs_clear(); (void)cfs_read(CFS_CTL); __asm__ volatile("" ::: "memory");
  const int T = Klen + 6;
  for(int s=0; s<T; ++s){
    uint32_t Aw[4]={0}, Bw[4]={0};
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<Klen)? Aflat[i*lda+k] : 0; Aw[i]=(uint32_t)(uint8_t)a; }
    for(int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<Klen)? Bflat[k*ldb+j] : 0; Bw[j]=(uint32_t)(uint8_t)b; }
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
    (void)cfs_read(CFS_CTL); __asm__ volatile("" ::: "memory");
    cfs_step();
  }
}
static void cfs_feed_batched4(const int8_t *Aflat, const int8_t *Bflat, int Klen, int lda, int ldb){
  cfs_clear(); (void)cfs_read(CFS_CTL); __asm__ volatile("" ::: "memory");
  const int T = Klen + 6;
  for(int t=0;t<T;t+=4){
    int8_t aB[4][4]={{0}}, bB[4][4]={{0}};
    for(int i=0;i<4;++i) for(int s=0;s<4;++s){ int k=(t+s)-i; if(k>=0&&k<Klen) aB[i][s]=Aflat[i*lda+k]; }
    for(int j=0;j<4;++j) for(int s=0;s<4;++s){ int k=(t+s)-j; if(k>=0&&k<Klen) bB[j][s]=Bflat[k*ldb+j]; }
    cfs_write(CFS_A0, pack4_s8_lsb(aB[0][0],aB[0][1],aB[0][2],aB[0][3]));
    cfs_write(CFS_A1, pack4_s8_lsb(aB[1][0],aB[1][1],aB[1][2],aB[1][3]));
    cfs_write(CFS_A2, pack4_s8_lsb(aB[2][0],aB[2][1],aB[2][2],aB[2][3]));
    cfs_write(CFS_A3, pack4_s8_lsb(aB[3][0],aB[3][1],aB[3][2],aB[3][3]));
    cfs_write(CFS_B0, pack4_s8_lsb(bB[0][0],bB[0][1],bB[0][2],bB[0][3]));
    cfs_write(CFS_B1, pack4_s8_lsb(bB[1][0],bB[1][1],bB[1][2],bB[1][3]));
    cfs_write(CFS_B2, pack4_s8_lsb(bB[2][0],bB[2][1],bB[2][2],bB[2][3]));
    cfs_write(CFS_B3, pack4_s8_lsb(bB[3][0],bB[3][1],bB[3][2],bB[3][3]));
    (void)cfs_read(CFS_CTL); __asm__ volatile("" ::: "memory");
    int steps = (t+4<=T)?4:(T-t);
    for(int s=0;s<steps;++s) cfs_step();
  }
}
static inline void cfs_read_C4(int32_t C4[4][4]){
  for(int i=0;i<4;++i) for(int j=0;j<4;++j)
    C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
}

/* Build A_flat (4 OCs × K) and B_flat (K × 4 positions) for tile (oc0..oc0+3, pos j0..j0+3) */
static void build_Aflat(const int8_t w[Cout][Cin][Kh][Kw], int oc0, int8_t *Aflat, int lda){
  for(int r=0;r<4;++r){
    int oc = oc0 + r;
    int idx=0;
    for(int c=0;c<Cin;++c)
      for(int ky=0;ky<Kh;++ky)
        for(int kx=0;kx<Kw;++kx)
          Aflat[r*lda + idx++] = (oc<Cout)? w[oc][c][ky][kx] : 0;
  }
}

static void build_Bflat(const int8_t in[Cin][H][W], int j0, int8_t *Bflat, int ldb){
  for(int s=0; s<4; ++s){
    int pos = j0 + s;
    int oy = pos / OW;
    int ox = pos % OW;
    if (pos >= NPOS){ /* pad col with zeros */
      for(int k=0;k<K;++k) Bflat[k*ldb + s] = 0;
      continue;
    }
    int idx=0;
    for(int c=0;c<Cin;++c)
      for(int ky=0;ky<Kh;++ky)
        for(int kx=0;kx<Kw;++kx){
          int iy = oy*STR + ky - PAD;
          int ix = ox*STR + kx - PAD;
          int8_t a = (iy>=0 && iy<H && ix>=0 && ix<W) ? in[c][iy][ix] : 0;
          Bflat[idx*ldb + s] = a;
          idx++;
        }
  }
}

static void conv2d_cfs(const int8_t in[Cin][H][W],
                       const int8_t w[Cout][Cin][Kh][Kw],
                       int32_t out[Cout][OH][OW]) {
  static int8_t  Aflat[4*K];  /* lda = K */
  static int8_t  Bflat[K*4];  /* ldb = 4 */
  int32_t C4[4][4];

  for(int oc0=0; oc0<Cout; oc0+=4){
    for(int j0=0; j0<NPOS; j0+=4){
      build_Aflat(w, oc0, Aflat, /*lda=*/K);
      build_Bflat(in, j0, Bflat, /*ldb=*/4);

#ifndef CFS_FEEDER_BATCHED
      cfs_feed_strict_step(Aflat, Bflat, /*Klen=*/K, /*lda=*/K, /*ldb=*/4);
#else
      cfs_feed_batched4  (Aflat, Bflat, /*Klen=*/K, /*lda=*/K, /*ldb=*/4);
#endif
      cfs_read_C4(C4);

      /* Store C4 into out tensor (map 4 positions back to (oy,ox)) */
      for(int r=0;r<4;++r){
        int oc = oc0 + r;
        if (oc >= Cout) continue;
        for(int s=0;s<4;++s){
          int pos = j0 + s;
          if (pos >= NPOS) continue;
          int oy = pos / OW;
          int ox = pos % OW;
          out[oc][oy][ox] = C4[r][s];
        }
      }
    }
  }
}

/* =======================
   Main
   ======================= */
static volatile uint32_t g_sink; /* prevent DCE */

int main(void){
  printf("== Conv2D int8: SW vs CFU vs CFS ==\n");
  printf("CFS ID: 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));

  static int8_t  IN[Cin][H][W];
  static int8_t  WGT[Cout][Cin][Kh][Kw];
  static int32_t O_sw [Cout][OH][OW];
  static int32_t O_cfu[Cout][OH][OW];
  static int32_t O_cfs[Cout][OH][OW];

  /* Fill inputs/weights with deterministic patterns */
  for(int c=0;c<Cin;++c) for(int y=0;y<H;++y) for(int x=0;x<W;++x)
    IN[c][y][x] = patt_in(c,y,x);
  for(int oc=0;oc<Cout;++oc) for(int c=0;c<Cin;++c)
    for(int ky=0;ky<Kh;++ky) for(int kx=0;kx<Kw;++kx)
      WGT[oc][c][ky][kx] = patt_wgt(oc,c,ky,kx);

  /* SW */
  __asm__ volatile("" ::: "memory");
  uint64_t c0=rdcycle(), i0=rdinstret();
  conv2d_sw(IN, WGT, O_sw);
  uint64_t i1=rdinstret(), c1=rdcycle();
  __asm__ volatile("" ::: "memory");
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0; g_sink ^= (uint32_t)sw_cyc;

  /* CFU */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
  conv2d_cfu(IN, WGT, O_cfu);
  i1=rdinstret(); c1=rdcycle();
  __asm__ volatile("" ::: "memory");
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0; g_sink ^= (uint32_t)cfu_cyc;

  /* CFS */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
  conv2d_cfs(IN, WGT, O_cfs);
  i1=rdinstret(); c1=rdcycle();
  __asm__ volatile("" ::: "memory");
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0; g_sink ^= (uint32_t)cfs_cyc;

  /* Verify */
  int ok_cfu = equal_arrays(&O_sw[0][0][0], &O_cfu[0][0][0], Cout*OH*OW);
  int ok_cfs = equal_arrays(&O_sw[0][0][0], &O_cfs[0][0][0], Cout*OH*OW);

#ifdef PRINT_SAMPLE
  /* Optional: print a tiny slice for sanity */
  printf("\nSample OC0 row0:\nSW : "); for(int x=0;x<8;++x) printf("%6ld ", (long)O_sw [0][0][x]); printf("\n");
  printf("CFU: "); for(int x=0;x<8;++x) printf("%6ld ", (long)O_cfu[0][0][x]); printf("\n");
  printf("CFS: "); for(int x=0;x<8;++x) printf("%6ld ", (long)O_cfs[0][0][x]); printf("\n");
#endif

  /* Timing table */
  printf("\nConv2D timing summary  (Cin=%d,Cout=%d, HxW=%dx%d, KhxKw=%dx%d)\n", Cin,Cout,H,W,Kh,Kw);
  printf("Path |     cycles     |    instret    | Speedup(cyc) | Speedup(inst)\n");
  printf("-----+----------------+---------------+--------------+--------------\n");
  printf(" SW  | %14" PRIu64 " | %13" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
  printf(" CFU | %14" PRIu64 " | %13" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
  printf(" CFS | %14" PRIu64 " | %13" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");

  printf("\nVerdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");
  printf("(sink=0x%08" PRIX32 ")\n", g_sink); /* keeps work observable */
  return (ok_cfu && ok_cfs) ? 0 : 1;
}

