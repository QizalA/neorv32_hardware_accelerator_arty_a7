// main.c — Tiny CNN pipeline (int8→int32): Conv1→ReLU→Conv2→ReLU→MaxPool2×2→FC
// Paths: SW (ref), CFU (DP4A), CFS (4×4 systolic). Strict CFS feeder by default.
// FC via CFS now tiled in K (FCDIM) to avoid large VLA/stack usage (fixes subtle mismatches).
//
// Build:
//   riscv32-unknown-elf-gcc -O2 -march=rv32im -mabi=ilp32 main.c -o cnn_pipeline.elf
// Optional flags:
//   -DCFS_BASE=0xFFEB0000        (set to your SoC)
//   -DCFS_FEEDER_BATCHED=1       (enable faster feeder after validating correctness)
//   -DH_IMG=16 -DW_IMG=16 -DCmid=4 -DCout=8  (shrink for quick debug)
//   -DPRINT_SAMPLE=1

#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

/* ===== Model config ===== */
#ifndef Cin
#define Cin    4
#endif
#ifndef H_IMG
#define H_IMG  32
#endif
#ifndef W_IMG
#define W_IMG  32
#endif

/* Conv1: Cin→Cmid */
#ifndef Cmid
#define Cmid  8
#endif
#define K1h   3
#define K1w   3
#define STR1  1
#define PAD1  1
#define O1H ((H_IMG + 2*PAD1 - K1h)/STR1 + 1)
#define O1W ((W_IMG + 2*PAD1 - K1w)/STR1 + 1)
#define K1  (Cin*K1h*K1w)

/* Conv2: Cmid→Cout */
#ifndef Cout
#define Cout  16
#endif
#define K2h   3
#define K2w   3
#define STR2  1
#define PAD2  1
#define O2H ((O1H + 2*PAD2 - K2h)/STR2 + 1)
#define O2W ((O1W + 2*PAD2 - K2w)/STR2 + 1)
#define K2  (Cmid*K2h*K2w)

/* MaxPool2x2, stride2 */
#define PH  (O2H/2)
#define PW  (O2W/2)

/* FC: flatten Cout×PH×PW → NCLS */
#ifndef NCLS
#define NCLS 10
#endif
#define FCDIM (Cout*PH*PW)

/* ===== CFS MMIO ===== */
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
#define CFS_C0        16

static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
static inline void cfs_clear(void) { cfs_write(CFS_CTL, 0b10u); }
static inline void cfs_step (void) { cfs_write(CFS_CTL, 0b01u); }

/* ===== CSRs (64-bit safe read) ===== */
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

/* ===== CFU DP4A ===== */
#ifndef CFU_FUNCT3
#define CFU_FUNCT3 0x0
#endif
#ifndef CFU_FUNCT7
#define CFU_FUNCT7 0x1
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

/* ===== Test patterns ===== */
static inline int8_t patt_in (int c, int y, int x){ return (int8_t)(((c+1)*(y+2)+(x-3)) & 0x0F) - 8; }
static inline int8_t patt_w1 (int oc,int c,int ky,int kx){ return (int8_t)(((oc+2)*(ky+1)+(kx-2)+c) & 0x0F)-8; }
static inline int8_t patt_w2 (int oc,int c,int ky,int kx){ return (int8_t)(((oc+3)*(ky+2)+(kx-1)+2*c) & 0x0F)-8; }
static inline int8_t patt_fc (int o,int i){ return (int8_t)(((o+5)+(i*3)) & 0x0F)-8; }

/* ===== Utils ===== */
static void print_speedup_fixed(uint64_t num, uint64_t den){
  if(!den){ printf("  n/a   "); return; }
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}
static int equal_i32(const int32_t* A, const int32_t* B, int n){
  for(int i=0;i<n;++i){ if(A[i]!=B[i]) return 0; } return 1;
}
static int argmax_i32(const int32_t *v, int n){
  int bi=0; int32_t bv=v[0];
  for(int i=1;i<n;++i){ if(v[i]>bv){ bv=v[i]; bi=i; } }
  return bi;
}
#ifndef DIAG_LIMIT
#define DIAG_LIMIT 4
#endif
static void dump_first_mismatch(const char* tag, const int32_t* A, const int32_t* B, int n, int stride_hint){
  for(int i=0;i<n; ++i){
    if (A[i] != B[i]) {
      printf("[%s] first mismatch at idx=%d: ref=%ld got=%ld\n",
             tag, i, (long)A[i], (long)B[i]);
      int s = (i>8? i-8:0), e = (i+8<n? i+8:n);
      printf("  ref: "); for(int t=s;t<e;++t) printf("%ld ", (long)A[t]); printf("\n");
      printf("  got: "); for(int t=s;t<e;++t) printf("%ld ", (long)B[t]); printf("\n");
      return;
    }
  }
  printf("[%s] (no mismatch found in %d elements)\n", tag, n);
}

/* Requantize int32→int8 (no scale; just saturation for test patterns) */
static void requantize_i32_to_s8(const int32_t *src, int n, int8_t *dst){
  for(int i=0;i<n;++i){
    int32_t v = src[i];
    if(v > 127) v = 127;
    if(v < -128) v = -128;
    dst[i] = (int8_t)v;
  }
}

/* ===== CFS feeders ===== */
static void cfs_feed_strict_step(const int8_t *Aflat, const int8_t *Bflat, int Klen, int lda, int ldb){
  cfs_clear(); (void)cfs_read(CFS_CTL); __asm__ volatile("" ::: "memory");
  const int T = Klen + 6;
  for(int s=0;s<T;++s){
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
/* Use strict by default; define -DCFS_FEEDER_BATCHED=1 to switch */
static inline void cfs_gemm_4xKx4(const int8_t *Aflat, const int8_t *Bflat, int Klen, int lda, int ldb){
#if defined(CFS_FEEDER_BATCHED) && (CFS_FEEDER_BATCHED != 0)
  cfs_feed_batched4  (Aflat,Bflat,Klen,lda,ldb);
#else
  cfs_feed_strict_step(Aflat,Bflat,Klen,lda,ldb);
#endif
}
static inline void cfs_read_C4(int32_t C4[4][4]){
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
}

/* ===== Layers: SW reference ===== */
static void relu_sw(int32_t *x, int n){ for(int i=0;i<n;++i) if(x[i]<0) x[i]=0; }
static void maxpool2x2_sw(const int32_t in[Cout][O2H][O2W], int32_t out[Cout][PH][PW]){
  for(int c=0;c<Cout;++c)
    for(int y=0;y<PH;++y)
      for(int x=0;x<PW;++x){
        int32_t m = in[c][2*y+0][2*x+0];
        if(in[c][2*y+0][2*x+1] > m) m = in[c][2*y+0][2*x+1];
        if(in[c][2*y+1][2*x+0] > m) m = in[c][2*y+1][2*x+0];
        if(in[c][2*y+1][2*x+1] > m) m = in[c][2*y+1][2*x+1];
        out[c][y][x]=m;
      }
}

/* Conv SW (generic) */
static void conv_sw_generic(int Cin_, int H_, int W_,
                            int Cout_, int Kh_, int Kw_, int STR_, int PAD_,
                            const int8_t *in,   /* [Cin][H][W]  */
                            const int8_t *Wm,   /* [Cout][Cin][Kh][Kw] */
                            int32_t *out) {     /* [Cout][OH][OW] */
  int OH_ = (H_ + 2*PAD_ - Kh_)/STR_ + 1;
  int OW_ = (W_ + 2*PAD_ - Kw_)/STR_ + 1;
  for(int oc=0; oc<Cout_; ++oc)
    for(int oy=0; oy<OH_; ++oy)
      for(int ox=0; ox<OW_; ++ox){
        int32_t acc=0;
        for(int c=0; c<Cin_; ++c)
          for(int ky=0; ky<Kh_; ++ky)
            for(int kx=0; kx<Kw_; ++kx){
              int iy=oy*STR_+ky-PAD_, ix=ox*STR_+kx-PAD_;
              int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix] : 0;
              int8_t b=Wm[(((oc*Cin_)+c)*Kh_+ky)*Kw_+kx];
              acc += (int32_t)a*(int32_t)b;
            }
        out[(oc*OH_+oy)*OW_+ox] = acc;
      }
}

/* FC SW: int8 x, int8 Wm → int32 y */
static void fc_sw(const int8_t *x, const int8_t *Wm, int32_t *y){
  for(int o=0;o<NCLS;++o){
    int32_t s=0;
    const int8_t* row=&Wm[o*FCDIM];
    for(int i=0;i<FCDIM;++i) s += (int32_t)row[i] * (int32_t)x[i];
    y[o]=s;
  }
}

/* ===== CFU versions (DP4A) ===== */
static void conv_cfu(int Cin_, int H_, int W_,
                     int Cout_, int Kh_, int Kw_, int STR_, int PAD_,
                     const int8_t *in, const int8_t *Wm, int32_t *out){
  const int OH_=(H_+2*PAD_-Kh_)/STR_+1, OW_=(W_+2*PAD_-Kw_)/STR_+1;
  const int K_ = Cin_*Kh_*Kw_;
  for(int oc=0; oc<Cout_; ++oc){
    for(int oy=0; oy<OH_; ++oy)
      for(int ox=0; ox<OW_; ++ox){
        int32_t acc=0; int k=0;
        for(; k+3<K_; k+=4){
          int t=k;   int c0=t/(Kh_*Kw_); int r=t%(Kh_*Kw_); int ky0=r/Kw_; int kx0=r%Kw_;
          t=k+1;     int c1=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky1=r/Kw_; int kx1=r%Kw_;
          t=k+2;     int c2=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky2=r/Kw_; int kx2=r%Kw_;
          t=k+3;     int c3=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky3=r/Kw_; int kx3=r%Kw_;
          int iy0=oy*STR_+ky0-PAD_, ix0=ox*STR_+kx0-PAD_;
          int iy1=oy*STR_+ky1-PAD_, ix1=ox*STR_+kx1-PAD_;
          int iy2=oy*STR_+ky2-PAD_, ix2=ox*STR_+kx2-PAD_;
          int iy3=oy*STR_+ky3-PAD_, ix3=ox*STR_+kx3-PAD_;
          int8_t a0=(iy0>=0&&iy0<H_&&ix0>=0&&ix0<W_)? in[(c0*H_+iy0)*W_+ix0]:0;
          int8_t a1=(iy1>=0&&iy1<H_&&ix1>=0&&ix1<W_)? in[(c1*H_+iy1)*W_+ix1]:0;
          int8_t a2=(iy2>=0&&iy2<H_&&ix2>=0&&ix2<W_)? in[(c2*H_+iy2)*W_+ix2]:0;
          int8_t a3=(iy3>=0&&iy3<H_&&ix3>=0&&ix3<W_)? in[(c3*H_+iy3)*W_+ix3]:0;
          uint32_t ap=pack4_s8_lsb(a0,a1,a2,a3);
          uint32_t bp=pack4_s8_lsb(
             Wm[(((oc*Cin_)+c0)*Kh_+ky0)*Kw_+kx0],
             Wm[(((oc*Cin_)+c1)*Kh_+ky1)*Kw_+kx1],
             Wm[(((oc*Cin_)+c2)*Kh_+ky2)*Kw_+kx2],
             Wm[(((oc*Cin_)+c3)*Kh_+ky3)*Kw_+kx3]);
          acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
        }
        for(;k<K_;++k){
          int c=k/(Kh_*Kw_), r=k%(Kh_*Kw_), ky=r/Kw_, kx=r%Kw_;
          int iy=oy*STR_+ky-PAD_, ix=ox*STR_+kx-PAD_;
          int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix]:0;
          int8_t b=Wm[(((oc*Cin_)+c)*Kh_+ky)*Kw_+kx];
          acc += (int32_t)a*b;
        }
        out[(oc*OH_+oy)*OW_+ox]=acc;
      }
  }
}
static void fc_cfu(const int8_t *x, const int8_t *Wm, int32_t *y){
  for(int o=0;o<NCLS;++o){
    const int8_t* row=&Wm[o*FCDIM];
    int32_t s=0; int i=0;
    for(; i+3<FCDIM; i+=4){
      uint32_t ap = pack4_s8_lsb(x[i+0],x[i+1],x[i+2],x[i+3]);
      uint32_t bp = pack4_s8_lsb(row[i+0],row[i+1],row[i+2],row[i+3]);
      s += cfu_dp4a((int32_t)ap,(int32_t)bp);
    }
    for(; i<FCDIM; ++i) s += (int32_t)row[i] * (int32_t)x[i];
    y[o]=s;
  }
}

/* ===== CFS conv GEMM builders ===== */
static void build_Aflat_conv(const int8_t *Wm, int oc0, int Cout_, int Cin_, int Kh_, int Kw_, int8_t *Aflat, int lda){
  for(int r=0;r<4;++r){
    int oc=oc0+r;
    int idx=0;
    for(int c=0;c<Cin_;++c)
      for(int ky=0;ky<Kh_;++ky)
        for(int kx=0;kx<Kw_;++kx){
          Aflat[r*lda+idx++] = (oc<Cout_)? Wm[(((oc*Cin_)+c)*Kh_+ky)*Kw_+kx] : 0;
        }
  }
}
static void build_Bflat_conv(const int8_t *in, int Cin_, int H_, int W_,
                             int Kh_, int Kw_, int STR_, int PAD_,
                             int j0, int OH_, int OW_, int8_t *Bflat, int ldb){
  const int NPOS=OH_*OW_;
  const int K_ = Cin_*Kh_*Kw_;
  for(int s=0;s<4;++s){
    int pos=j0+s;
    if(pos>=NPOS){ for(int k=0;k<K_;++k) Bflat[k*ldb+s]=0; continue; }
    int oy=pos/OW_, ox=pos%OW_;
    int idx=0;
    for(int c=0;c<Cin_;++c)
      for(int ky=0;ky<Kh_;++ky)
        for(int kx=0;kx<Kw_;++kx){
          int iy=oy*STR_+ky-PAD_, ix=ox*STR_+kx-PAD_;
          int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix]:0;
          Bflat[idx*ldb+s]=a; idx++;
        }
  }
}
static void conv_cfs(int Cin_, int H_, int W_,
                     int Cout_, int Kh_, int Kw_, int STR_, int PAD_,
                     const int8_t *in, const int8_t *Wm, int32_t *out){
  const int OH_=(H_+2*PAD_-Kh_)/STR_+1, OW_=(W_+2*PAD_-Kw_)/STR_+1;
  const int K_ = Cin_*Kh_*Kw_;
  int32_t C4[4][4];
  const int NPOS=OH_*OW_;
  /* per-tile VLAs (small here: K_ <= 9*Cmid, e.g. 72 for Cmid=8) */
  int8_t Aflat[4*K_];
  int8_t Bflat[K_*4];

  for(int oc0=0; oc0<Cout_; oc0+=4){
    build_Aflat_conv(Wm, oc0, Cout_, Cin_, Kh_, Kw_, Aflat, /*lda=*/K_);
    for(int j0=0; j0<NPOS; j0+=4){
      build_Bflat_conv(in, Cin_, H_, W_, Kh_, Kw_, STR_, PAD_, j0, OH_, OW_, Bflat, /*ldb=*/4);
      cfs_gemm_4xKx4(Aflat,Bflat,K_,/*lda=*/K_,/*ldb=*/4);
      cfs_read_C4(C4);
      for(int r=0;r<4;++r){
        int oc=oc0+r; if(oc>=Cout_) continue;
        for(int s=0;s<4;++s){
          int pos=j0+s; if(pos>=NPOS) continue;
          int oy=pos/OW_, ox=pos%OW_;
          out[(oc*OH_+oy)*OW_+ox] = C4[r][s];
        }
      }
    }
  }
}

/* ===== FC via CFS (tiled K, static small workspaces) ===== */
#ifndef FC_CHUNKK
#define FC_CHUNKK 256   /* must be multiple of 4 for best performance; tune per memory */
#endif
/* static small workspaces (avoid stack) */
static int8_t  fc_Aflat[4*FC_CHUNKK];
static int8_t  fc_Bflat[FC_CHUNKK*4];
static void fc_cfs(const int8_t *x, const int8_t *Wm, int32_t *y){
  /* Initialize outputs */
  for(int o=0;o<NCLS;++o) y[o]=0;

  int32_t C4[4][4];

  for(int o0=0;o0<NCLS;o0+=4){
    /* process K (FCDIM) in CHUNKs, accumulate */
    for(int k0=0;k0<FCDIM;k0+=FC_CHUNKK){
      int kk = FC_CHUNKK; if(k0+kk>FCDIM) kk = FCDIM - k0;

      /* Build 4 rows of weights into Aflat (length kk each) */
      for(int r=0;r<4;++r){
        int o = o0+r;
        for(int k=0;k<kk;++k){
          fc_Aflat[r*kk + k] = (o<NCLS)? Wm[o*FCDIM + (k0+k)] : 0;
        }
      }
      /* Build 4 identical columns of input slice x[k0..k0+kk) into Bflat */
      for(int k=0;k<kk;++k){
        int8_t a = x[k0+k];
        fc_Bflat[k*4+0]=a; fc_Bflat[k*4+1]=a; fc_Bflat[k*4+2]=a; fc_Bflat[k*4+3]=a;
      }

      /* GEMM 4xkk * kkx4 */
      cfs_gemm_4xKx4(fc_Aflat, fc_Bflat, kk, /*lda=*/kk, /*ldb=*/4);
      cfs_read_C4(C4);

      /* Accumulate into y */
      for(int r=0;r<4;++r){
        int o=o0+r; if(o<NCLS) y[o] += C4[r][0]; /* take col0 (all cols identical) */
      }
    }
  }
}

/* ===== Main ===== */
static volatile uint32_t g_sink;

int main(void){
  printf("== Tiny CNN pipeline: SW vs CFU vs CFS ==\n");
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID: 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);

  /* CFU DP4A probe (1*5+2*6+3*7+4*8=70) */
  int32_t probe = cfu_dp4a((int32_t)pack4_s8_lsb(1,2,3,4),
                           (int32_t)pack4_s8_lsb(5,6,7,8));
  printf("CFU DP4A probe = %ld (expect 70)\n\n", (long)probe);

  /* Buffers */
  static int8_t  IN [Cin][H_IMG][W_IMG];
  static int8_t  W1 [Cmid][Cin][K1h][K1w];
  static int8_t  W2 [Cout][Cmid][K2h][K2w];
  static int8_t  Wfc[NCLS][FCDIM];

  static int32_t C1_sw [Cmid][O1H][O1W], C2_sw [Cout][O2H][O2W], P_sw [Cout][PH][PW], Y_sw [NCLS];
  static int32_t C1_cfu[Cmid][O1H][O1W], C2_cfu[Cout][O2H][O2W], P_cfu[Cout][PH][PW], Y_cfu[NCLS];
  static int32_t C1_cfs[Cmid][O1H][O1W], C2_cfs[Cout][O2H][O2W], P_cfs[Cout][PH][PW], Y_cfs[NCLS];

  /* int8 workspaces for requantization between layers */
  static int8_t  C1_sw_s8 [Cmid*O1H*O1W];
  static int8_t  C1_cfu_s8[Cmid*O1H*O1W];
  static int8_t  C1_cfs_s8[Cmid*O1H*O1W];
  static int8_t  P_sw_s8  [FCDIM];
  static int8_t  P_cfu_s8 [FCDIM];
  static int8_t  P_cfs_s8 [FCDIM];

  /* Fill inputs/weights */
  for(int c=0;c<Cin;++c) for(int y=0;y<H_IMG;++y) for(int x=0;x<W_IMG;++x) IN[c][y][x]=patt_in(c,y,x);
  for(int oc=0;oc<Cmid;++oc) for(int c=0;c<Cin;++c) for(int ky=0;ky<K1h;++ky) for(int kx=0;kx<K1w;++kx) W1[oc][c][ky][kx]=patt_w1(oc,c,ky,kx);
  for(int oc=0;oc<Cout;++oc) for(int c=0;c<Cmid;++c) for(int ky=0;ky<K2h;++ky) for(int kx=0;kx<K2w;++kx) W2[oc][c][ky][kx]=patt_w2(oc,c,ky,kx);
  for(int o=0;o<NCLS;++o) for(int i=0;i<FCDIM;++i) Wfc[o][i]=patt_fc(o,i);

  uint64_t c0,i0,c1,i1; uint64_t cyc_sw=0, ins_sw=0, cyc_cfu=0, ins_cfu=0, cyc_cfs=0, ins_cfs=0;

  /* ===== SW pipeline ===== */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
  conv_sw_generic(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_sw[0][0][0]);
  relu_sw(&C1_sw[0][0][0], Cmid*O1H*O1W);
  requantize_i32_to_s8(&C1_sw[0][0][0], Cmid*O1H*O1W, C1_sw_s8);
  conv_sw_generic(Cmid,O1H,O1W, Cout,K2h,K2w,STR2,PAD2, C1_sw_s8, &W2[0][0][0][0], &C2_sw[0][0][0]);
  relu_sw(&C2_sw[0][0][0], Cout*O2H*O2W);
  maxpool2x2_sw(C2_sw, P_sw);
  requantize_i32_to_s8(&P_sw[0][0][0], FCDIM, P_sw_s8);
  fc_sw(P_sw_s8, &Wfc[0][0], Y_sw);
  i1=rdinstret(); c1=rdcycle();
  __asm__ volatile("" ::: "memory");
  cyc_sw=c1-c0; ins_sw=i1-i0; g_sink ^= (uint32_t)cyc_sw;

  /* ===== CFU pipeline ===== */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
  conv_cfu(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_cfu[0][0][0]);
  relu_sw(&C1_cfu[0][0][0], Cmid*O1H*O1W);
  requantize_i32_to_s8(&C1_cfu[0][0][0], Cmid*O1H*O1W, C1_cfu_s8);
  conv_cfu(Cmid,O1H,O1W, Cout,K2h,K2w,STR2,PAD2, C1_cfu_s8, &W2[0][0][0][0], &C2_cfu[0][0][0]);
  relu_sw(&C2_cfu[0][0][0], Cout*O2H*O2W);
  maxpool2x2_sw(C2_cfu, P_cfu);
  requantize_i32_to_s8(&P_cfu[0][0][0], FCDIM, P_cfu_s8);
  fc_cfu(P_cfu_s8, &Wfc[0][0], Y_cfu);
  i1=rdinstret(); c1=rdcycle();
  __asm__ volatile("" ::: "memory");
  cyc_cfu=c1-c0; ins_cfu=i1-i0; g_sink ^= (uint32_t)cyc_cfu;

  /* ===== CFS pipeline ===== */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
  conv_cfs(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_cfs[0][0][0]);
  relu_sw(&C1_cfs[0][0][0], Cmid*O1H*O1W);
  requantize_i32_to_s8(&C1_cfs[0][0][0], Cmid*O1H*O1W, C1_cfs_s8);
  conv_cfs(Cmid,O1H,O1W, Cout,K2h,K2w,STR2,PAD2, C1_cfs_s8, &W2[0][0][0][0], &C2_cfs[0][0][0]);
  relu_sw(&C2_cfs[0][0][0], Cout*O2H*O2W);
  maxpool2x2_sw(C2_cfs, P_cfs);
  requantize_i32_to_s8(&P_cfs[0][0][0], FCDIM, P_cfs_s8);
  fc_cfs(P_cfs_s8, &Wfc[0][0], Y_cfs);
  i1=rdinstret(); c1=rdcycle();
  __asm__ volatile("" ::: "memory");
  cyc_cfs=c1-c0; ins_cfs=i1-i0; g_sink ^= (uint32_t)cyc_cfs;

  /* ===== Verify & report ===== */
  int ok_cfu = 1, ok_cfs = 1;
  if (!equal_i32(&C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W)) { ok_cfu = 0; dump_first_mismatch("CFU:C1", &C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W, O1W); }
  if (!equal_i32(&C2_sw[0][0][0], &C2_cfu[0][0][0], Cout*O2H*O2W)) { ok_cfu = 0; dump_first_mismatch("CFU:C2", &C2_sw[0][0][0], &C2_cfu[0][0][0], Cout*O2H*O2W, O2W); }
  if (!equal_i32(&P_sw [0][0][0], &P_cfu [0][0][0], Cout*PH*PW))   { ok_cfu = 0; dump_first_mismatch("CFU:POOL", &P_sw[0][0][0], &P_cfu[0][0][0], Cout*PH*PW, PW); }
  if (!equal_i32(&Y_sw [0],       &Y_cfu [0],       NCLS))         { ok_cfu = 0; dump_first_mismatch("CFU:FC", Y_sw, Y_cfu, NCLS, 0); }

  if (!equal_i32(&C1_sw[0][0][0], &C1_cfs[0][0][0], Cmid*O1H*O1W)) { ok_cfs = 0; dump_first_mismatch("CFS:C1", &C1_sw[0][0][0], &C1_cfs[0][0][0], Cmid*O1H*O1W, O1W); }
  if (!equal_i32(&C2_sw[0][0][0], &C2_cfs[0][0][0], Cout*O2H*O2W)) { ok_cfs = 0; dump_first_mismatch("CFS:C2", &C2_sw[0][0][0], &C2_cfs[0][0][0], Cout*O2H*O2W, O2W); }
  if (!equal_i32(&P_sw [0][0][0], &P_cfs [0][0][0], Cout*PH*PW))   { ok_cfs = 0; dump_first_mismatch("CFS:POOL", &P_sw[0][0][0], &P_cfs[0][0][0], Cout*PH*PW, PW); }
  if (!equal_i32(&Y_sw [0],       &Y_cfs [0],       NCLS))         { ok_cfs = 0; dump_first_mismatch("CFS:FC", Y_sw, Y_cfs, NCLS, 0); }

#ifdef PRINT_SAMPLE
  printf("\nSample logits (first 8):\nSW : "); for(int i=0;i<8 && i<NCLS;++i) printf("%8ld ", (long)Y_sw[i]);  printf("\n");
  printf("CFU: "); for(int i=0;i<8 && i<NCLS;++i) printf("%8ld ", (long)Y_cfu[i]); printf("\n");
  printf("CFS: "); for(int i=0;i<8 && i<NCLS;++i) printf("%8ld ", (long)Y_cfs[i]); printf("\n\n");
#endif

  int cls_sw  = argmax_i32(Y_sw,  NCLS);
  int cls_cfu = argmax_i32(Y_cfu, NCLS);
  int cls_cfs = argmax_i32(Y_cfs, NCLS);

  printf("Tiny CNN timing summary\n");
  printf("Path |     cycles     |    instret    | Speedup(cyc) | Speedup(inst)\n");
  printf("-----+----------------+---------------+--------------+--------------\n");
  printf(" SW  | %14" PRIu64 " | %13" PRIu64 " |     --       |     --      \n", cyc_sw,  ins_sw);
  printf(" CFU | %14" PRIu64 " | %13" PRIu64 " |  "); print_speedup_fixed(cyc_sw,cyc_cfu); printf("     |  "); print_speedup_fixed(ins_sw,ins_cfu); printf("\n");
  printf(" CFS | %14" PRIu64 " | %13" PRIu64 " |  "); print_speedup_fixed(cyc_sw,cyc_cfs); printf("     |  "); print_speedup_fixed(ins_sw,ins_cfs); printf("\n");

  printf("\nPred class: SW=%d, CFU=%d, CFS=%d\n", cls_sw, cls_cfu, cls_cfs);
  printf("Verdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");
  printf("(sink=0x%08" PRIX32 ")\n", g_sink);
  return (ok_cfu && ok_cfs) ? 0 : 1;
}

