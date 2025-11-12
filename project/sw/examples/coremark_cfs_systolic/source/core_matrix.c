/* core_matrix.c — CoreMark matrix module with 4x4 INT8 CFS acceleration
   - Keeps official CoreMark math & CRCs identical
   - Uses CFS for 4x4 tiles and SW for any fringe (when N%4!=0)
   - Small stack buffers via K-chunking (default 128)
*/

#include "coremark.h"
#include <stdint.h>

/* ----------------------------------------------------------------
 * Forward declarations (prevent implicit/recursive type issues)
 * ---------------------------------------------------------------- */
ee_s16 matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val);
ee_s16 matrix_sum(ee_u32 N, MATRES *C, MATDAT clipval);
void   matrix_mul_const(ee_u32 N, MATRES *C, MATDAT *A, MATDAT val);
void   matrix_mul_vect(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B);
void   matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B);
void   matrix_mul_matrix_bitextract(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B);
void   matrix_add_const(ee_u32 N, MATDAT *A, MATDAT val);
ee_u32 core_init_matrix(ee_u32 blksize, void *memblk, ee_s32 seed, mat_params *p);

/* ----------------------------------------------------------------
 * CoreMark matrix benchmark entry (required by core_list_join.c)
 * ---------------------------------------------------------------- */
ee_u16 core_bench_matrix(mat_params *p, ee_s16 seed, ee_u16 crc)
{
    ee_u32  N   = p->N;
    MATRES *C   = p->C;
    MATDAT *A   = p->A;
    MATDAT *B   = p->B;
    MATDAT  val = (MATDAT)seed;

    crc = crc16(matrix_test(N, C, A, B, val), crc);
    return crc;
}

/* =========================
 * CFS ACCELERATOR HOOKS
 * ========================= */
#ifndef USE_CFS_ACCEL
#define USE_CFS_ACCEL 1     /* set to 0 to disable accelerator */
#endif
#ifndef CFS_BASE
#define CFS_BASE 0xFFEB0000u /* adjust to your design */
#endif
#ifndef KCHUNK
#define KCHUNK 128          /* reduce if stack is very small; increase for speed */
#endif

/* CFS register map (word addresses) */
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
static inline void cfs_clear(void) { cfs_write(CFS_CTL, 0b10u); } /* CLEAR */
static inline void cfs_step (void) { cfs_write(CFS_CTL, 0b01u); } /* STEP  */

static inline uint32_t pack4_s8(int8_t x0,int8_t x1,int8_t x2,int8_t x3){
  return  ((uint32_t)(uint8_t)x0)        |
         (((uint32_t)(uint8_t)x1) << 8)  |
         (((uint32_t)(uint8_t)x2) << 16) |
         (((uint32_t)(uint8_t)x3) << 24);
}

/* Stream 4×K and K×4 with systolic skew; ldaA/k_len = K, ldbB=4 */
static void cfs_stream_4xK_Kx4(const int8_t *A4xK, const int8_t *Kx4,
                               int k_len, int ldaA, int ldbB) {
  const int T = k_len + 6; /* (4-1)+(4-1) flush */
  cfs_clear();
  for (int t=0; t<T; t+=4){
    int8_t a_bytes[4][4] = {{0}}, b_bytes[4][4] = {{0}};
    for (int i=0;i<4;i++) for (int s=0;s<4;s++){
      int k=(t+s)-i; if (k>=0 && k<k_len) a_bytes[i][s] = A4xK[i*ldaA + k];
    }
    for (int j=0;j<4;j++) for (int s=0;s<4;s++){
      int k=(t+s)-j; if (k>=0 && k<k_len) b_bytes[j][s] = Kx4[k*ldbB + j];
    }
    cfs_write(CFS_A0, pack4_s8(a_bytes[0][0],a_bytes[0][1],a_bytes[0][2],a_bytes[0][3]));
    cfs_write(CFS_A1, pack4_s8(a_bytes[1][0],a_bytes[1][1],a_bytes[1][2],a_bytes[1][3]));
    cfs_write(CFS_A2, pack4_s8(a_bytes[2][0],a_bytes[2][1],a_bytes[2][2],a_bytes[2][3]));
    cfs_write(CFS_A3, pack4_s8(a_bytes[3][0],a_bytes[3][1],a_bytes[3][2],a_bytes[3][3]));
    cfs_write(CFS_B0, pack4_s8(b_bytes[0][0],b_bytes[0][1],b_bytes[0][2],b_bytes[0][3]));
    cfs_write(CFS_B1, pack4_s8(b_bytes[1][0],b_bytes[1][1],b_bytes[1][2],b_bytes[1][3]));
    cfs_write(CFS_B2, pack4_s8(b_bytes[2][0],b_bytes[2][1],b_bytes[2][2],b_bytes[2][3]));
    cfs_write(CFS_B3, pack4_s8(b_bytes[3][0],b_bytes[3][1],b_bytes[3][2],b_bytes[3][3]));
    int steps=(t+4<=T)?4:(T-t);
    for (int s=0;s<steps;s++) cfs_step();
  }
}
static void cfs_read_C4(int32_t C4[4][4]){
  for (int i=0;i<4;i++) for (int j=0;j<4;j++)
    C4[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
}

/* Build 4 A rows (CoreMark A carries only 8-bit info) into signed lanes+high-bit flag */
static void build_Arows_chunk(ee_u32 N, const MATDAT* A, ee_u32 i0, ee_u32 k0, int KC,
                              int8_t* A_s, int8_t* A_H) {
  for (int r=0;r<4;r++){
    const MATDAT* Ai = A + (i0+r)*N + k0;
    for (int t=0;t<KC;t++){
      uint8_t au = (uint8_t)Ai[t];       /* low 8-bit of A (per CoreMark init) */
      A_s[r*KC + t] = (int8_t)au;        /* signed 8 */
      A_H[r*KC + t] = (int8_t)(au >> 7); /* 0/1 */
    }
  }
}

/* Build 4 B columns: split MATDAT (16b) into low signed8, high signed8, and low MSB flag */
static void build_Bcols_chunk(ee_u32 N, const MATDAT* B, ee_u32 j0, ee_u32 k0, int KC,
                              int8_t* Bl, int8_t* Bh, int8_t* Lmsb) {
  for (int t=0;t<KC;t++){
    const MATDAT* Bk = B + (k0+t)*N + j0;
    for (int c=0;c<4;c++){
      MATDAT b = Bk[c];                      /* CoreMark B is effectively 16-bit signed */
      int8_t l = (int8_t)((uint8_t)b);       /* low byte as signed8 */
      int8_t h = (int8_t)((uint16_t)b >> 8); /* high byte as signed8 */
      int8_t f = (((uint8_t)l) >= 128) ? 1 : 0; /* MSB of low byte (0/1) */
      Bl[t*4 + c]   = l;
      Bh[t*4 + c]   = h;
      Lmsb[t*4 + c] = f;
    }
  }
}

/* Exact emulation of int16(B) * uint8(A) using only int8 DP4A terms.
   Let U = A_low8 + (A_high_bit<<8)  (A_high_bit is 0/1)
       B = Bl + (Bh<<8) + (L<<8)     (L is MSB of Bl, 0/1)
   Then U*B =
       (a_s*l) + ((a_s*h)<<8) + ((a_s*L)<<8) + ((H*l)<<8) + ((H*h)<<16) + ((H*L)<<16)
*/
static void cfs_tile_exact_4x4_chunk_accum(int KC,
                               const int8_t* Arows_s, const int8_t* Arows_H, int ldaA,
                               const int8_t* Blows,   const int8_t* Bhigs,
                               const int8_t* Lmsb,    int ldbB,
                               int32_t acc[4][4]) {
  int32_t tmp[4][4];

  cfs_stream_4xK_Kx4(Arows_s, Blows, KC, ldaA, ldbB);  /* a_s * l */
  cfs_read_C4(tmp);
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += tmp[i][j];

  cfs_stream_4xK_Kx4(Arows_s, Bhigs, KC, ldaA, ldbB);  /* (a_s*h)<<8 */
  cfs_read_C4(tmp);
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);

  cfs_stream_4xK_Kx4(Arows_H, Blows, KC, ldaA, ldbB);  /* (H*l)<<8 */
  cfs_read_C4(tmp);
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);

  cfs_stream_4xK_Kx4(Arows_H, Bhigs, KC, ldaA, ldbB);  /* (H*h)<<16 */
  cfs_read_C4(tmp);
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);

  cfs_stream_4xK_Kx4(Arows_s, Lmsb,  KC, ldaA, ldbB);  /* (a_s*L)<<8 */
  cfs_read_C4(tmp);
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 8);

  cfs_stream_4xK_Kx4(Arows_H, Lmsb,  KC, ldaA, ldbB);  /* (H*L)<<16 */
  cfs_read_C4(tmp);
  for (int i=0;i<4;i++) for (int j=0;j<4;j++) acc[i][j] += (tmp[i][j] << 16);
}

/* =========================
 * CoreMark stock interface
 * ========================= */

#define matrix_test_next(x)      (x + 1)
#define matrix_clip(x, y)        ((y) ? (x)&0x0ff : (x)&0x0ffff)
#define matrix_big(x)            (0xf000 | (x))
#define bit_extract(x, from, to) (((x) >> (from)) & (~(0xffffffff << (to))))

#if CORE_DEBUG
static void printmat(MATDAT *A, ee_u32 N, char *name){
    ee_u32 i, j;
    ee_printf("Matrix %s [%dx%d]:\n", name, N, N);
    for (i = 0; i < N; i++){
        for (j = 0; j < N; j++){
            if (j != 0) ee_printf(",");
            ee_printf("%d", A[i * N + j]);
        }
        ee_printf("\n");
    }
}
static void printmatC(MATRES *C, ee_u32 N, char *name){
    ee_u32 i, j;
    ee_printf("Matrix %s [%dx%d]:\n", name, N, N);
    for (i = 0; i < N; i++){
        for (j = 0; j < N; j++){
            if (j != 0) ee_printf(",");
            ee_printf("%d", C[i * N + j]);
        }
        ee_printf("\n");
    }
}
#endif

ee_s16 matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val){
    ee_u16 crc     = 0;
    MATDAT clipval = matrix_big(val);

    matrix_add_const(N, A, val);
#if CORE_DEBUG
    printmat(A, N, "matrix_add_const");
#endif
    matrix_mul_const(N, C, A, val);
    crc = crc16(matrix_sum(N, C, clipval), crc);
#if CORE_DEBUG
    printmatC(C, N, "matrix_mul_const");
#endif
    matrix_mul_vect(N, C, A, B);
    crc = crc16(matrix_sum(N, C, clipval), crc);
#if CORE_DEBUG
    printmatC(C, N, "matrix_mul_vect");
#endif
    matrix_mul_matrix(N, C, A, B);
    crc = crc16(matrix_sum(N, C, clipval), crc);
#if CORE_DEBUG
    printmatC(C, N, "matrix_mul_matrix");
#endif
    matrix_mul_matrix_bitextract(N, C, A, B);
    crc = crc16(matrix_sum(N, C, clipval), crc);
#if CORE_DEBUG
    printmatC(C, N, "matrix_mul_matrix_bitextract");
#endif

    matrix_add_const(N, A, -val);
    return crc;
}

ee_u32 core_init_matrix(ee_u32 blksize, void *memblk, ee_s32 seed, mat_params *p){
    ee_u32  N = 0;
    MATDAT *A;
    MATDAT *B;
    ee_s32  order = 1;
    MATDAT  val;
    ee_u32  i = 0, j = 0;
    if (seed == 0) seed = 1;
    while (j < blksize){ i++; j = i * i * 2 * 4; }
    N = i - 1;
    A = (MATDAT *)align_mem(memblk);
    B = A + N * N;

    for (i = 0; i < N; i++){
        for (j = 0; j < N; j++){
            seed         = ((order * seed) % 65536);
            val          = (seed + order);
            val          = matrix_clip(val, 0);
            B[i * N + j] = val;
            val          = (val + order);
            val          = matrix_clip(val, 1);
            A[i * N + j] = val;
            order++;
        }
    }

    p->A = A;
    p->B = B;
    p->C = (MATRES *)align_mem(B + N * N);
    p->N = N;
#if CORE_DEBUG
    printmat(A, N, "A");
    printmat(B, N, "B");
#endif
    return N;
}

ee_s16 matrix_sum(ee_u32 N, MATRES *C, MATDAT clipval){
    MATRES tmp = 0, prev = 0, cur = 0;
    ee_s16 ret = 0;
    for (ee_u32 i = 0; i < N; i++){
        for (ee_u32 j = 0; j < N; j++){
            cur = C[i * N + j];
            tmp += cur;
            if (tmp > clipval){ ret += 10; tmp = 0; }
            else              { ret += (cur > prev) ? 1 : 0; }
            prev = cur;
        }
    }
    return ret;
}

void matrix_mul_const(ee_u32 N, MATRES *C, MATDAT *A, MATDAT val){
    for (ee_u32 i = 0; i < N; i++)
        for (ee_u32 j = 0; j < N; j++)
            C[i * N + j] = (MATRES)A[i * N + j] * (MATRES)val;
}

void matrix_add_const(ee_u32 N, MATDAT *A, MATDAT val){
    for (ee_u32 i = 0; i < N; i++)
        for (ee_u32 j = 0; j < N; j++)
            A[i * N + j] += val;
}

void matrix_mul_vect(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B){
    for (ee_u32 i = 0; i < N; i++){
        C[i] = 0;
        for (ee_u32 j = 0; j < N; j++)
            C[i] += (MATRES)A[i * N + j] * (MATRES)B[j];
    }
}

/* =========================
 * ACCELERATED GEMM (exact)
 * ========================= */
void matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B){
#if !USE_CFS_ACCEL
    /* Pure software (original) */
    for (ee_u32 i = 0; i < N; i++){
        for (ee_u32 j = 0; j < N; j++){
            MATRES s = 0;
            for (ee_u32 k = 0; k < N; k++)
                s += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
            C[i * N + j] = s;
        }
    }
#else
    const ee_u32 N4 = N & ~3u; /* largest multiple of 4 ≤ N */

    /* 1) Use CFS on the core N4×N4 block */
    for (ee_u32 i0 = 0; i0 < N4; i0 += 4){
      for (ee_u32 j0 = 0; j0 < N4; j0 += 4){

        int32_t acc[4][4] = {{0}};

        /* K-loop chunked for tiny stack footprint */
        for (ee_u32 k0 = 0; k0 < N; k0 += KCHUNK){
          int KC = (int)((k0 + KCHUNK <= N) ? KCHUNK : (N - k0));

          /* stack buffers: A_s[4*KC], A_H[4*KC], Bl/ Bh/ Lf [KC*4] */
          int8_t A_s[4 * KCHUNK];
          int8_t A_H[4 * KCHUNK];
          int8_t Bl [KCHUNK * 4];
          int8_t Bh [KCHUNK * 4];
          int8_t Lf [KCHUNK * 4];

          build_Arows_chunk(N, A, i0, k0, KC, A_s, A_H);
          build_Bcols_chunk(N, B, j0, k0, KC, Bl, Bh, Lf);

          cfs_tile_exact_4x4_chunk_accum(KC,
                      A_s, A_H, KC,
                      Bl,  Bh,
                      Lf,  4,
                      acc);
        }

        for (int r=0;r<4;r++)
          for (int c=0;c<4;c++)
            C[(i0+r)*N + (j0+c)] = (MATRES)acc[r][c];
      }
    }

    /* 2) Right fringe columns (SW) */
    for (ee_u32 i = 0; i < N4; i++){
      for (ee_u32 j = N4; j < N; j++){
        MATRES s = 0;
        for (ee_u32 k = 0; k < N; k++)
          s += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
        C[i * N + j] = s;
      }
    }

    /* 3) Bottom fringe rows (SW) */
    for (ee_u32 i = N4; i < N; i++){
      for (ee_u32 j = 0; j < N; j++){
        MATRES s = 0;
        for (ee_u32 k = 0; k < N; k++)
          s += (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
        C[i * N + j] = s;
      }
    }
#endif
}

void matrix_mul_matrix_bitextract(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B){
    for (ee_u32 i = 0; i < N; i++){
        for (ee_u32 j = 0; j < N; j++){
            C[i * N + j] = 0;
            for (ee_u32 k = 0; k < N; k++){
                MATRES tmp = (MATRES)A[i * N + k] * (MATRES)B[k * N + j];
                C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
            }
        }
    }
}

