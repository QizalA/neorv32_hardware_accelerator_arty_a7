
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
       0:	f14020f3          	csrr	ra,mhartid
       4:	80080217          	auipc	tp,0x80080
       8:	ffb20213          	add	tp,tp,-5 # 8007ffff <__crt0_ram_last>
       c:	ff027113          	and	sp,tp,-16
      10:	80000197          	auipc	gp,0x80000
      14:	7f018193          	add	gp,gp,2032 # 80000800 <__global_pointer>
      18:	000022b7          	lui	t0,0x2
      1c:	80028293          	add	t0,t0,-2048 # 1800 <main+0x774>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00011397          	auipc	t2,0x11
      38:	b2c38393          	add	t2,t2,-1236 # 10b60 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <g_sink>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <g_sink>
      54:	80069597          	auipc	a1,0x80069
      58:	65c58593          	add	a1,a1,1628 # 800696b0 <__crt0_bss_end>
      5c:	00000613          	li	a2,0
      60:	00000693          	li	a3,0
      64:	00000713          	li	a4,0
      68:	00000793          	li	a5,0
      6c:	00000813          	li	a6,0
      70:	00000893          	li	a7,0
      74:	00000913          	li	s2,0
      78:	00000993          	li	s3,0
      7c:	00000a13          	li	s4,0
      80:	00000a93          	li	s5,0
      84:	00000b13          	li	s6,0
      88:	00000b93          	li	s7,0
      8c:	00000c13          	li	s8,0
      90:	00000c93          	li	s9,0
      94:	00000d13          	li	s10,0
      98:	00000d93          	li	s11,0
      9c:	00000e13          	li	t3,0
      a0:	00000e93          	li	t4,0
      a4:	00000f13          	li	t5,0
      a8:	00000f93          	li	t6,0

000000ac <__crt0_smp_check>:
      ac:	02008a63          	beqz	ra,e0 <__crt0_smp_primary>
      b0:	00000797          	auipc	a5,0x0
      b4:	01878793          	add	a5,a5,24 # c8 <__crt0_smp_wakeup>
      b8:	30579073          	csrw	mtvec,a5
      bc:	30446073          	csrs	mie,8
      c0:	30046073          	csrs	mstatus,8
      c4:	0d80006f          	j	19c <__crt0_sleep>

000000c8 <__crt0_smp_wakeup>:
      c8:	fff44737          	lui	a4,0xfff44
      cc:	00872103          	lw	sp,8(a4) # fff44008 <__crt0_ram_last+0x7fec4009>
      d0:	00c72603          	lw	a2,12(a4)
      d4:	fff40737          	lui	a4,0xfff40
      d8:	00072223          	sw	zero,4(a4) # fff40004 <__crt0_ram_last+0x7fec0005>
      dc:	05c0006f          	j	138 <__crt0_main_entry>

000000e0 <__crt0_smp_primary>:
      e0:	00838e63          	beq	t2,s0,fc <__crt0_bss_clear>

000000e4 <__crt0_data_copy>:
      e4:	00945c63          	bge	s0,s1,fc <__crt0_bss_clear>
      e8:	0003a783          	lw	a5,0(t2)
      ec:	00f42023          	sw	a5,0(s0)
      f0:	00438393          	add	t2,t2,4
      f4:	00440413          	add	s0,s0,4
      f8:	fedff06f          	j	e4 <__crt0_data_copy>

000000fc <__crt0_bss_clear>:
      fc:	00b55863          	bge	a0,a1,10c <__crt0_bss_clear_end>
     100:	00052023          	sw	zero,0(a0)
     104:	00450513          	add	a0,a0,4
     108:	ff5ff06f          	j	fc <__crt0_bss_clear>

0000010c <__crt0_bss_clear_end>:
     10c:	00010417          	auipc	s0,0x10
     110:	e9c40413          	add	s0,s0,-356 # ffa8 <__fini_array_end>
     114:	00010497          	auipc	s1,0x10
     118:	e9448493          	add	s1,s1,-364 # ffa8 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00001617          	auipc	a2,0x1
     134:	f5c60613          	add	a2,a2,-164 # 108c <main>

00000138 <__crt0_main_entry>:
     138:	80000197          	auipc	gp,0x80000
     13c:	6c818193          	add	gp,gp,1736 # 80000800 <__global_pointer>
     140:	0ff0000f          	fence
     144:	0000100f          	fence.i
     148:	30029073          	csrw	mstatus,t0
     14c:	00000513          	li	a0,0
     150:	00000593          	li	a1,0
     154:	000600e7          	jalr	a2

00000158 <__crt0_main_exit>:
     158:	30401073          	csrw	mie,zero
     15c:	34051073          	csrw	mscratch,a0
     160:	00000517          	auipc	a0,0x0
     164:	04450513          	add	a0,a0,68 # 1a4 <__crt0_trap>
     168:	30551073          	csrw	mtvec,a0
     16c:	f1402473          	csrr	s0,mhartid
     170:	02041463          	bnez	s0,198 <__crt0_destructors_end>
     174:	00010417          	auipc	s0,0x10
     178:	e3440413          	add	s0,s0,-460 # ffa8 <__fini_array_end>
     17c:	00010497          	auipc	s1,0x10
     180:	e2c48493          	add	s1,s1,-468 # ffa8 <__fini_array_end>

00000184 <__crt0_destructors>:
     184:	00945a63          	bge	s0,s1,198 <__crt0_destructors_end>
     188:	00042083          	lw	ra,0(s0)
     18c:	000080e7          	jalr	ra
     190:	00440413          	add	s0,s0,4
     194:	ff1ff06f          	j	184 <__crt0_destructors>

00000198 <__crt0_destructors_end>:
     198:	00100073          	ebreak

0000019c <__crt0_sleep>:
     19c:	10500073          	wfi
     1a0:	ffdff06f          	j	19c <__crt0_sleep>

000001a4 <__crt0_trap>:
     1a4:	34041073          	csrw	mscratch,s0
     1a8:	34202473          	csrr	s0,mcause
     1ac:	01f45413          	srl	s0,s0,0x1f
     1b0:	02041663          	bnez	s0,1dc <__crt0_trap_end>
     1b4:	34102473          	csrr	s0,mepc
     1b8:	00440413          	add	s0,s0,4
     1bc:	34141073          	csrw	mepc,s0
     1c0:	34a02473          	csrr	s0,0x34a
     1c4:	00347413          	and	s0,s0,3
     1c8:	ffd40413          	add	s0,s0,-3
     1cc:	00040863          	beqz	s0,1dc <__crt0_trap_end>
     1d0:	34102473          	csrr	s0,mepc
     1d4:	ffe40413          	add	s0,s0,-2
     1d8:	34141073          	csrw	mepc,s0

000001dc <__crt0_trap_end>:
     1dc:	34002473          	csrr	s0,mscratch
     1e0:	30200073          	mret

000001e4 <rdcycle>:

/* ===== CSRs (64-bit safe read) ===== */
static inline uint64_t rdcycle(void){
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,mcycleh":"=r"(hi1));
     1e4:	b80025f3          	csrr	a1,mcycleh
       __asm__ volatile("csrr %0,mcycle" :"=r"(lo));
     1e8:	b0002573          	csrr	a0,mcycle
       __asm__ volatile("csrr %0,mcycleh":"=r"(hi2)); } while (hi1 != hi2);
     1ec:	b80027f3          	csrr	a5,mcycleh
     1f0:	fef59ae3          	bne	a1,a5,1e4 <rdcycle>
  return ((uint64_t)hi1<<32)|lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,mcycle":"=r"(v)); return v;
#endif
}
     1f4:	00008067          	ret

000001f8 <rdinstret>:
static inline uint64_t rdinstret(void){
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,minstreth":"=r"(hi1));
     1f8:	b82025f3          	csrr	a1,minstreth
       __asm__ volatile("csrr %0,minstret" :"=r"(lo));
     1fc:	b0202573          	csrr	a0,minstret
       __asm__ volatile("csrr %0,minstreth":"=r"(hi2)); } while (hi1 != hi2);
     200:	b82027f3          	csrr	a5,minstreth
     204:	fef59ae3          	bne	a1,a5,1f8 <rdinstret>
  return ((uint64_t)hi1<<32)|lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,minstret":"=r"(v)); return v;
#endif
}
     208:	00008067          	ret

0000020c <equal_i32>:
static void print_speedup_fixed(uint64_t num, uint64_t den){
  if(!den){ printf("  n/a   "); return; }
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
}
static int equal_i32(const int32_t* A, const int32_t* B, int n){
  for(int i=0;i<n;++i){ if(A[i]!=B[i]) return 0; } return 1;
     20c:	00261613          	sll	a2,a2,0x2
static int equal_i32(const int32_t* A, const int32_t* B, int n){
     210:	00000793          	li	a5,0
  for(int i=0;i<n;++i){ if(A[i]!=B[i]) return 0; } return 1;
     214:	00f506b3          	add	a3,a0,a5
     218:	00f58733          	add	a4,a1,a5
     21c:	0006a683          	lw	a3,0(a3)
     220:	00072703          	lw	a4,0(a4)
     224:	00e69a63          	bne	a3,a4,238 <equal_i32+0x2c>
     228:	00478793          	add	a5,a5,4
     22c:	fec794e3          	bne	a5,a2,214 <equal_i32+0x8>
     230:	00100513          	li	a0,1
     234:	00008067          	ret
     238:	00000513          	li	a0,0
}
     23c:	00008067          	ret

00000240 <requantize_i32_to_s8>:
  printf("[%s] (no mismatch found in %d elements)\n", tag, n);
}

/* Requantize int32→int8 (no scale; just saturation for test patterns) */
static void requantize_i32_to_s8(const int32_t *src, int n, int8_t *dst){
  for(int i=0;i<n;++i){
     240:	00000793          	li	a5,0
    int32_t v = src[i];
    if(v > 127) v = 127;
    if(v < -128) v = -128;
     244:	f8000813          	li	a6,-128
    dst[i] = (int8_t)v;
     248:	07f00893          	li	a7,127
    int32_t v = src[i];
     24c:	00279713          	sll	a4,a5,0x2
     250:	00e50733          	add	a4,a0,a4
    if(v < -128) v = -128;
     254:	00072703          	lw	a4,0(a4)
    dst[i] = (int8_t)v;
     258:	00f606b3          	add	a3,a2,a5
    if(v < -128) v = -128;
     25c:	01075463          	bge	a4,a6,264 <requantize_i32_to_s8+0x24>
     260:	f8000713          	li	a4,-128
    dst[i] = (int8_t)v;
     264:	00e8d463          	bge	a7,a4,26c <requantize_i32_to_s8+0x2c>
     268:	07f00713          	li	a4,127
     26c:	00e68023          	sb	a4,0(a3)
  for(int i=0;i<n;++i){
     270:	00178793          	add	a5,a5,1
     274:	fcf59ce3          	bne	a1,a5,24c <requantize_i32_to_s8+0xc>
  }
}
     278:	00008067          	ret

0000027c <cfs_read_C4>:
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     27c:	ffeb06b7          	lui	a3,0xffeb0
#else
  cfs_feed_strict_step(Aflat,Bflat,Klen,lda,ldb);
#endif
}
static inline void cfs_read_C4(int32_t C4[4][4]){
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     280:	00000713          	li	a4,0
     284:	01000613          	li	a2,16
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     288:	04068693          	add	a3,a3,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     28c:	01000893          	li	a7,16
     290:	02000313          	li	t1,32
     294:	00e50833          	add	a6,a0,a4
     298:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     29c:	00d705b3          	add	a1,a4,a3
     2a0:	00f58e33          	add	t3,a1,a5
     2a4:	000e2e83          	lw	t4,0(t3)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     2a8:	00f80e33          	add	t3,a6,a5
     2ac:	00478793          	add	a5,a5,4
     2b0:	01de2023          	sw	t4,0(t3)
     2b4:	ff1796e3          	bne	a5,a7,2a0 <cfs_read_C4+0x24>
     2b8:	00460613          	add	a2,a2,4
     2bc:	01070713          	add	a4,a4,16
     2c0:	fc661ae3          	bne	a2,t1,294 <cfs_read_C4+0x18>
}
     2c4:	00008067          	ret

000002c8 <relu_sw>:

/* ===== Layers: SW reference ===== */
static void relu_sw(int32_t *x, int n){ for(int i=0;i<n;++i) if(x[i]<0) x[i]=0; }
     2c8:	00259593          	sll	a1,a1,0x2
     2cc:	00b505b3          	add	a1,a0,a1
     2d0:	00052783          	lw	a5,0(a0)
     2d4:	0007d463          	bgez	a5,2dc <relu_sw+0x14>
     2d8:	00052023          	sw	zero,0(a0)
     2dc:	00450513          	add	a0,a0,4
     2e0:	feb518e3          	bne	a0,a1,2d0 <relu_sw+0x8>
     2e4:	00008067          	ret

000002e8 <maxpool2x2_sw>:
static void maxpool2x2_sw(const int32_t in[Cout][O2H][O2W], int32_t out[Cout][PH][PW]){
  for(int c=0;c<Cout;++c)
     2e8:	00010837          	lui	a6,0x10
     2ec:	01050833          	add	a6,a0,a6
    for(int y=0;y<PH;++y)
      for(int x=0;x<PW;++x){
     2f0:	01000f93          	li	t6,16
     2f4:	00001f37          	lui	t5,0x1
     2f8:	00058613          	mv	a2,a1
     2fc:	01e50eb3          	add	t4,a0,t5
     300:	0500006f          	j	350 <maxpool2x2_sw+0x68>
        int32_t m = in[c][2*y+0][2*x+0];
        if(in[c][2*y+0][2*x+1] > m) m = in[c][2*y+0][2*x+1];
        if(in[c][2*y+1][2*x+0] > m) m = in[c][2*y+1][2*x+0];
     304:	00072e03          	lw	t3,0(a4)
     308:	00472783          	lw	a5,4(a4)
     30c:	01c7d463          	bge	a5,t3,314 <maxpool2x2_sw+0x2c>
     310:	000e0793          	mv	a5,t3
     314:	0006ae03          	lw	t3,0(a3)
     318:	01c7d463          	bge	a5,t3,320 <maxpool2x2_sw+0x38>
     31c:	000e0793          	mv	a5,t3
        if(in[c][2*y+1][2*x+1] > m) m = in[c][2*y+1][2*x+1];
     320:	0046ae03          	lw	t3,4(a3)
     324:	01c7d463          	bge	a5,t3,32c <maxpool2x2_sw+0x44>
     328:	000e0793          	mv	a5,t3
        out[c][y][x]=m;
     32c:	00f32023          	sw	a5,0(t1)
      for(int x=0;x<PW;++x){
     330:	00188893          	add	a7,a7,1
     334:	00870713          	add	a4,a4,8
     338:	00868693          	add	a3,a3,8
     33c:	00430313          	add	t1,t1,4
     340:	fdf892e3          	bne	a7,t6,304 <maxpool2x2_sw+0x1c>
    for(int y=0;y<PH;++y)
     344:	10050513          	add	a0,a0,256
     348:	04060613          	add	a2,a2,64
     34c:	01d50c63          	beq	a0,t4,364 <maxpool2x2_sw+0x7c>
      for(int x=0;x<PW;++x){
     350:	08050693          	add	a3,a0,128
static void maxpool2x2_sw(const int32_t in[Cout][O2H][O2W], int32_t out[Cout][PH][PW]){
     354:	00060313          	mv	t1,a2
     358:	00050713          	mv	a4,a0
      for(int x=0;x<PW;++x){
     35c:	00000893          	li	a7,0
     360:	fa5ff06f          	j	304 <maxpool2x2_sw+0x1c>
  for(int c=0;c<Cout;++c)
     364:	40058593          	add	a1,a1,1024
     368:	f8a818e3          	bne	a6,a0,2f8 <maxpool2x2_sw+0x10>
      }
}
     36c:	00008067          	ret

00000370 <print_speedup_fixed>:
  if(!den){ printf("  n/a   "); return; }
     370:	00d667b3          	or	a5,a2,a3
     374:	00079863          	bnez	a5,384 <print_speedup_fixed+0x14>
     378:	00010537          	lui	a0,0x10
     37c:	fa850513          	add	a0,a0,-88 # ffa8 <__fini_array_end>
     380:	2d10106f          	j	1e50 <printf>
static void print_speedup_fixed(uint64_t num, uint64_t den){
     384:	fe010113          	add	sp,sp,-32
     388:	00812c23          	sw	s0,24(sp)
     38c:	00912a23          	sw	s1,20(sp)
     390:	00068413          	mv	s0,a3
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     394:	00060493          	mv	s1,a2
     398:	00000693          	li	a3,0
     39c:	3e800613          	li	a2,1000
static void print_speedup_fixed(uint64_t num, uint64_t den){
     3a0:	00112e23          	sw	ra,28(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     3a4:	2310f0ef          	jal	fdd4 <__muldi3>
     3a8:	00050793          	mv	a5,a0
     3ac:	01f41713          	sll	a4,s0,0x1f
     3b0:	0014d513          	srl	a0,s1,0x1
     3b4:	00a76533          	or	a0,a4,a0
     3b8:	00a78533          	add	a0,a5,a0
     3bc:	00145713          	srl	a4,s0,0x1
     3c0:	00f537b3          	sltu	a5,a0,a5
     3c4:	00e585b3          	add	a1,a1,a4
     3c8:	00b785b3          	add	a1,a5,a1
     3cc:	00048613          	mv	a2,s1
     3d0:	00040693          	mv	a3,s0
     3d4:	2080c0ef          	jal	c5dc <__udivdi3>
     3d8:	3e800613          	li	a2,1000
     3dc:	00000693          	li	a3,0
     3e0:	00050493          	mv	s1,a0
     3e4:	00058413          	mv	s0,a1
     3e8:	0a10c0ef          	jal	cc88 <__umoddi3>
     3ec:	00a12623          	sw	a0,12(sp)
     3f0:	00b12423          	sw	a1,8(sp)
     3f4:	3e800613          	li	a2,1000
     3f8:	00000693          	li	a3,0
     3fc:	00048513          	mv	a0,s1
     400:	00040593          	mv	a1,s0
     404:	1d80c0ef          	jal	c5dc <__udivdi3>
}
     408:	01812403          	lw	s0,24(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     40c:	00c12703          	lw	a4,12(sp)
     410:	00812783          	lw	a5,8(sp)
}
     414:	01c12083          	lw	ra,28(sp)
     418:	01412483          	lw	s1,20(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     41c:	00050613          	mv	a2,a0
     420:	00010537          	lui	a0,0x10
     424:	00058693          	mv	a3,a1
     428:	fb450513          	add	a0,a0,-76 # ffb4 <__fini_array_end+0xc>
}
     42c:	02010113          	add	sp,sp,32
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     430:	2210106f          	j	1e50 <printf>

00000434 <conv_cfu.constprop.0>:
/* ===== CFU versions (DP4A) ===== */
static void conv_cfu(int Cin_, int H_, int W_,
                     int Cout_, int Kh_, int Kw_, int STR_, int PAD_,
                     const int8_t *in, const int8_t *Wm, int32_t *out){
  const int OH_=(H_+2*PAD_-Kh_)/STR_+1, OW_=(W_+2*PAD_-Kw_)/STR_+1;
  const int K_ = Cin_*Kh_*Kw_;
     434:	00351793          	sll	a5,a0,0x3
static void conv_cfu(int Cin_, int H_, int W_,
     438:	f8010113          	add	sp,sp,-128
  const int K_ = Cin_*Kh_*Kw_;
     43c:	00a787b3          	add	a5,a5,a0
static void conv_cfu(int Cin_, int H_, int W_,
     440:	06812c23          	sw	s0,120(sp)
     444:	06912a23          	sw	s1,116(sp)
     448:	07512223          	sw	s5,100(sp)
     44c:	07612023          	sw	s6,96(sp)
     450:	05812c23          	sw	s8,88(sp)
     454:	05912a23          	sw	s9,84(sp)
     458:	06112e23          	sw	ra,124(sp)
     45c:	07212823          	sw	s2,112(sp)
     460:	07312623          	sw	s3,108(sp)
     464:	07412423          	sw	s4,104(sp)
     468:	05712e23          	sw	s7,92(sp)
     46c:	05a12823          	sw	s10,80(sp)
     470:	05b12623          	sw	s11,76(sp)
     474:	00a12423          	sw	a0,8(sp)
     478:	00b12a23          	sw	a1,20(sp)
     47c:	00060b13          	mv	s6,a2
     480:	00068c93          	mv	s9,a3
     484:	00e12c23          	sw	a4,24(sp)
  const int K_ = Cin_*Kh_*Kw_;
     488:	00f12823          	sw	a5,16(sp)
     48c:	00000a93          	li	s5,0
  for(int oc=0; oc<Cout_; ++oc){
     490:	00000c13          	li	s8,0
          t=k+3;     int c3=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky3=r/Kw_; int kx3=r%Kw_;
          int iy0=oy*STR_+ky0-PAD_, ix0=ox*STR_+kx0-PAD_;
          int iy1=oy*STR_+ky1-PAD_, ix1=ox*STR_+kx1-PAD_;
          int iy2=oy*STR_+ky2-PAD_, ix2=ox*STR_+kx2-PAD_;
          int iy3=oy*STR_+ky3-PAD_, ix3=ox*STR_+kx3-PAD_;
          int8_t a0=(iy0>=0&&iy0<H_&&ix0>=0&&ix0<W_)? in[(c0*H_+iy0)*W_+ix0]:0;
     494:	fff00493          	li	s1,-1
     498:	02000413          	li	s0,32
    for(int oy=0; oy<OH_; ++oy)
     49c:	00ac1793          	sll	a5,s8,0xa
     4a0:	00f12023          	sw	a5,0(sp)
     4a4:	00000a13          	li	s4,0
     4a8:	3e80006f          	j	890 <conv_cfu.constprop.0+0x45c>
     4ac:	000d0913          	mv	s2,s10
          int t=k;   int c0=t/(Kh_*Kw_); int r=t%(Kh_*Kw_); int ky0=r/Kw_; int kx0=r%Kw_;
     4b0:	00900593          	li	a1,9
     4b4:	00090513          	mv	a0,s2
     4b8:	1b50f0ef          	jal	fe6c <__divsi3>
     4bc:	00a12623          	sw	a0,12(sp)
     4c0:	00900593          	li	a1,9
     4c4:	00090513          	mv	a0,s2
     4c8:	2290f0ef          	jal	fef0 <__modsi3>
     4cc:	00300593          	li	a1,3
     4d0:	00050d13          	mv	s10,a0
     4d4:	1990f0ef          	jal	fe6c <__divsi3>
     4d8:	02a12e23          	sw	a0,60(sp)
     4dc:	00300593          	li	a1,3
     4e0:	000d0513          	mv	a0,s10
     4e4:	20d0f0ef          	jal	fef0 <__modsi3>
          t=k+1;     int c1=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky1=r/Kw_; int kx1=r%Kw_;
     4e8:	00190d13          	add	s10,s2,1
          int t=k;   int c0=t/(Kh_*Kw_); int r=t%(Kh_*Kw_); int ky0=r/Kw_; int kx0=r%Kw_;
     4ec:	02a12c23          	sw	a0,56(sp)
          t=k+1;     int c1=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky1=r/Kw_; int kx1=r%Kw_;
     4f0:	00900593          	li	a1,9
     4f4:	000d0513          	mv	a0,s10
     4f8:	1750f0ef          	jal	fe6c <__divsi3>
     4fc:	02a12a23          	sw	a0,52(sp)
     500:	00900593          	li	a1,9
     504:	000d0513          	mv	a0,s10
     508:	1e90f0ef          	jal	fef0 <__modsi3>
     50c:	00300593          	li	a1,3
     510:	00050d13          	mv	s10,a0
     514:	1590f0ef          	jal	fe6c <__divsi3>
     518:	02a12823          	sw	a0,48(sp)
     51c:	00300593          	li	a1,3
     520:	000d0513          	mv	a0,s10
     524:	1cd0f0ef          	jal	fef0 <__modsi3>
          t=k+2;     int c2=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky2=r/Kw_; int kx2=r%Kw_;
     528:	00290d13          	add	s10,s2,2
          t=k+1;     int c1=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky1=r/Kw_; int kx1=r%Kw_;
     52c:	02a12623          	sw	a0,44(sp)
          t=k+2;     int c2=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky2=r/Kw_; int kx2=r%Kw_;
     530:	00900593          	li	a1,9
     534:	000d0513          	mv	a0,s10
     538:	1350f0ef          	jal	fe6c <__divsi3>
     53c:	02a12423          	sw	a0,40(sp)
     540:	00900593          	li	a1,9
     544:	000d0513          	mv	a0,s10
     548:	1a90f0ef          	jal	fef0 <__modsi3>
     54c:	00300593          	li	a1,3
     550:	00050d13          	mv	s10,a0
     554:	1190f0ef          	jal	fe6c <__divsi3>
     558:	02a12223          	sw	a0,36(sp)
     55c:	00300593          	li	a1,3
     560:	000d0513          	mv	a0,s10
     564:	18d0f0ef          	jal	fef0 <__modsi3>
     568:	00390d93          	add	s11,s2,3
     56c:	02a12023          	sw	a0,32(sp)
          t=k+3;     int c3=t/(Kh_*Kw_); r=t%(Kh_*Kw_);     int ky3=r/Kw_; int kx3=r%Kw_;
     570:	00900593          	li	a1,9
     574:	000d8513          	mv	a0,s11
     578:	0f50f0ef          	jal	fe6c <__divsi3>
     57c:	00a12e23          	sw	a0,28(sp)
     580:	00900593          	li	a1,9
     584:	000d8513          	mv	a0,s11
     588:	1690f0ef          	jal	fef0 <__modsi3>
     58c:	00300593          	li	a1,3
     590:	00050d13          	mv	s10,a0
     594:	0d90f0ef          	jal	fe6c <__divsi3>
     598:	00050d93          	mv	s11,a0
     59c:	00300593          	li	a1,3
     5a0:	000d0513          	mv	a0,s10
     5a4:	14d0f0ef          	jal	fef0 <__modsi3>
          int iy0=oy*STR_+ky0-PAD_, ix0=ox*STR_+kx0-PAD_;
     5a8:	03c12303          	lw	t1,60(sp)
          int iy1=oy*STR_+ky1-PAD_, ix1=ox*STR_+kx1-PAD_;
     5ac:	03012e83          	lw	t4,48(sp)
          int iy2=oy*STR_+ky2-PAD_, ix2=ox*STR_+kx2-PAD_;
     5b0:	02412f83          	lw	t6,36(sp)
          int iy0=oy*STR_+ky0-PAD_, ix0=ox*STR_+kx0-PAD_;
     5b4:	006a0e33          	add	t3,s4,t1
          int iy1=oy*STR_+ky1-PAD_, ix1=ox*STR_+kx1-PAD_;
     5b8:	01da0733          	add	a4,s4,t4
          int iy2=oy*STR_+ky2-PAD_, ix2=ox*STR_+kx2-PAD_;
     5bc:	01fa0d33          	add	s10,s4,t6
          int iy3=oy*STR_+ky3-PAD_, ix3=ox*STR_+kx3-PAD_;
     5c0:	01ba03b3          	add	t2,s4,s11
          int iy0=oy*STR_+ky0-PAD_, ix0=ox*STR_+kx0-PAD_;
     5c4:	fffe0e13          	add	t3,t3,-1
          int8_t a0=(iy0>=0&&iy0<H_&&ix0>=0&&ix0<W_)? in[(c0*H_+iy0)*W_+ix0]:0;
     5c8:	01c12683          	lw	a3,28(sp)
     5cc:	02012283          	lw	t0,32(sp)
     5d0:	02812803          	lw	a6,40(sp)
     5d4:	02c12f03          	lw	t5,44(sp)
     5d8:	03412883          	lw	a7,52(sp)
     5dc:	03812603          	lw	a2,56(sp)
          int iy1=oy*STR_+ky1-PAD_, ix1=ox*STR_+kx1-PAD_;
     5e0:	fff70713          	add	a4,a4,-1
          int iy2=oy*STR_+ky2-PAD_, ix2=ox*STR_+kx2-PAD_;
     5e4:	fffd0d13          	add	s10,s10,-1
          int iy3=oy*STR_+ky3-PAD_, ix3=ox*STR_+kx3-PAD_;
     5e8:	fff38393          	add	t2,t2,-1
          int8_t a0=(iy0>=0&&iy0<H_&&ix0>=0&&ix0<W_)? in[(c0*H_+iy0)*W_+ix0]:0;
     5ec:	00000593          	li	a1,0
     5f0:	029e0a63          	beq	t3,s1,624 <conv_cfu.constprop.0+0x1f0>
     5f4:	028e0863          	beq	t3,s0,624 <conv_cfu.constprop.0+0x1f0>
          int iy0=oy*STR_+ky0-PAD_, ix0=ox*STR_+kx0-PAD_;
     5f8:	00c987b3          	add	a5,s3,a2
     5fc:	fff78793          	add	a5,a5,-1
          int8_t a0=(iy0>=0&&iy0<H_&&ix0>=0&&ix0<W_)? in[(c0*H_+iy0)*W_+ix0]:0;
     600:	02978263          	beq	a5,s1,624 <conv_cfu.constprop.0+0x1f0>
     604:	02878063          	beq	a5,s0,624 <conv_cfu.constprop.0+0x1f0>
     608:	00c12583          	lw	a1,12(sp)
     60c:	00559593          	sll	a1,a1,0x5
     610:	01c585b3          	add	a1,a1,t3
     614:	00559593          	sll	a1,a1,0x5
     618:	00bb05b3          	add	a1,s6,a1
     61c:	00f585b3          	add	a1,a1,a5
     620:	00058583          	lb	a1,0(a1)
          int8_t a1=(iy1>=0&&iy1<H_&&ix1>=0&&ix1<W_)? in[(c1*H_+iy1)*W_+ix1]:0;
     624:	00000e13          	li	t3,0
     628:	02970863          	beq	a4,s1,658 <conv_cfu.constprop.0+0x224>
     62c:	02870663          	beq	a4,s0,658 <conv_cfu.constprop.0+0x224>
          int iy1=oy*STR_+ky1-PAD_, ix1=ox*STR_+kx1-PAD_;
     630:	01e987b3          	add	a5,s3,t5
     634:	fff78793          	add	a5,a5,-1
          int8_t a1=(iy1>=0&&iy1<H_&&ix1>=0&&ix1<W_)? in[(c1*H_+iy1)*W_+ix1]:0;
     638:	02978063          	beq	a5,s1,658 <conv_cfu.constprop.0+0x224>
     63c:	00878e63          	beq	a5,s0,658 <conv_cfu.constprop.0+0x224>
     640:	00589e13          	sll	t3,a7,0x5
     644:	00ee0e33          	add	t3,t3,a4
     648:	005e1e13          	sll	t3,t3,0x5
     64c:	01cb0e33          	add	t3,s6,t3
     650:	00fe0e33          	add	t3,t3,a5
     654:	000e0e03          	lb	t3,0(t3)
          int8_t a2=(iy2>=0&&iy2<H_&&ix2>=0&&ix2<W_)? in[(c2*H_+iy2)*W_+ix2]:0;
     658:	00000793          	li	a5,0
     65c:	029d0863          	beq	s10,s1,68c <conv_cfu.constprop.0+0x258>
     660:	028d0663          	beq	s10,s0,68c <conv_cfu.constprop.0+0x258>
          int iy2=oy*STR_+ky2-PAD_, ix2=ox*STR_+kx2-PAD_;
     664:	00598733          	add	a4,s3,t0
     668:	fff70713          	add	a4,a4,-1
          int8_t a2=(iy2>=0&&iy2<H_&&ix2>=0&&ix2<W_)? in[(c2*H_+iy2)*W_+ix2]:0;
     66c:	02970063          	beq	a4,s1,68c <conv_cfu.constprop.0+0x258>
     670:	00870e63          	beq	a4,s0,68c <conv_cfu.constprop.0+0x258>
     674:	00581793          	sll	a5,a6,0x5
     678:	01a787b3          	add	a5,a5,s10
     67c:	00579793          	sll	a5,a5,0x5
     680:	00fb07b3          	add	a5,s6,a5
     684:	00e787b3          	add	a5,a5,a4
     688:	00078783          	lb	a5,0(a5)
          int8_t a3=(iy3>=0&&iy3<H_&&ix3>=0&&ix3<W_)? in[(c3*H_+iy3)*W_+ix3]:0;
     68c:	00000713          	li	a4,0
     690:	02938863          	beq	t2,s1,6c0 <conv_cfu.constprop.0+0x28c>
     694:	02838663          	beq	t2,s0,6c0 <conv_cfu.constprop.0+0x28c>
          int iy3=oy*STR_+ky3-PAD_, ix3=ox*STR_+kx3-PAD_;
     698:	00a98d33          	add	s10,s3,a0
     69c:	fffd0d13          	add	s10,s10,-1
          int8_t a3=(iy3>=0&&iy3<H_&&ix3>=0&&ix3<W_)? in[(c3*H_+iy3)*W_+ix3]:0;
     6a0:	029d0063          	beq	s10,s1,6c0 <conv_cfu.constprop.0+0x28c>
     6a4:	008d0e63          	beq	s10,s0,6c0 <conv_cfu.constprop.0+0x28c>
     6a8:	00569713          	sll	a4,a3,0x5
     6ac:	00770733          	add	a4,a4,t2
     6b0:	00571713          	sll	a4,a4,0x5
     6b4:	00eb0733          	add	a4,s6,a4
     6b8:	01a70733          	add	a4,a4,s10
     6bc:	00070703          	lb	a4,0(a4)
         (((uint32_t)(uint8_t)x1) << 8)  |
     6c0:	0ffe7e13          	zext.b	t3,t3
     6c4:	008e1e13          	sll	t3,t3,0x8
  return  ((uint32_t)(uint8_t)x0)        |
     6c8:	0ff5f593          	zext.b	a1,a1
         (((uint32_t)(uint8_t)x2) << 16) |
     6cc:	0ff7f793          	zext.b	a5,a5
  return  ((uint32_t)(uint8_t)x0)        |
     6d0:	00be65b3          	or	a1,t3,a1
          uint32_t ap=pack4_s8_lsb(a0,a1,a2,a3);
          uint32_t bp=pack4_s8_lsb(
             Wm[(((oc*Cin_)+c0)*Kh_+ky0)*Kw_+kx0],
             Wm[(((oc*Cin_)+c1)*Kh_+ky1)*Kw_+kx1],
     6d4:	015888b3          	add	a7,a7,s5
         (((uint32_t)(uint8_t)x2) << 16) |
     6d8:	01079793          	sll	a5,a5,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     6dc:	00f5e7b3          	or	a5,a1,a5
             Wm[(((oc*Cin_)+c1)*Kh_+ky1)*Kw_+kx1],
     6e0:	00189593          	sll	a1,a7,0x1
     6e4:	011585b3          	add	a1,a1,a7
     6e8:	01d585b3          	add	a1,a1,t4
         (((uint32_t)(uint8_t)x3) << 24);
     6ec:	01871713          	sll	a4,a4,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     6f0:	00e7e7b3          	or	a5,a5,a4
          uint32_t bp=pack4_s8_lsb(
     6f4:	00159713          	sll	a4,a1,0x1
     6f8:	00b70733          	add	a4,a4,a1
     6fc:	00ec8733          	add	a4,s9,a4
             Wm[(((oc*Cin_)+c2)*Kh_+ky2)*Kw_+kx2],
     700:	01580833          	add	a6,a6,s5
          uint32_t bp=pack4_s8_lsb(
     704:	01e70733          	add	a4,a4,t5
         (((uint32_t)(uint8_t)x1) << 8)  |
     708:	00074583          	lbu	a1,0(a4)
             Wm[(((oc*Cin_)+c2)*Kh_+ky2)*Kw_+kx2],
     70c:	00181713          	sll	a4,a6,0x1
     710:	01070733          	add	a4,a4,a6
     714:	01f70833          	add	a6,a4,t6
          uint32_t bp=pack4_s8_lsb(
     718:	00181713          	sll	a4,a6,0x1
     71c:	01070733          	add	a4,a4,a6
     720:	00ec8733          	add	a4,s9,a4
     724:	00570733          	add	a4,a4,t0
         (((uint32_t)(uint8_t)x2) << 16) |
     728:	00074703          	lbu	a4,0(a4)
         (((uint32_t)(uint8_t)x1) << 8)  |
     72c:	00859593          	sll	a1,a1,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     730:	01071713          	sll	a4,a4,0x10
     734:	00e5e5b3          	or	a1,a1,a4
             Wm[(((oc*Cin_)+c0)*Kh_+ky0)*Kw_+kx0],
     738:	00c12703          	lw	a4,12(sp)
     73c:	01570733          	add	a4,a4,s5
     740:	00171813          	sll	a6,a4,0x1
     744:	00e80833          	add	a6,a6,a4
     748:	00680833          	add	a6,a6,t1
          uint32_t bp=pack4_s8_lsb(
     74c:	00181713          	sll	a4,a6,0x1
     750:	01070733          	add	a4,a4,a6
     754:	00ec8733          	add	a4,s9,a4
     758:	00c70733          	add	a4,a4,a2
  return  ((uint32_t)(uint8_t)x0)        |
     75c:	00074803          	lbu	a6,0(a4)
             Wm[(((oc*Cin_)+c3)*Kh_+ky3)*Kw_+kx3]);
     760:	01568733          	add	a4,a3,s5
         (((uint32_t)(uint8_t)x2) << 16) |
     764:	0105e833          	or	a6,a1,a6
             Wm[(((oc*Cin_)+c3)*Kh_+ky3)*Kw_+kx3]);
     768:	00171593          	sll	a1,a4,0x1
     76c:	00e585b3          	add	a1,a1,a4
     770:	01b585b3          	add	a1,a1,s11
          uint32_t bp=pack4_s8_lsb(
     774:	00159713          	sll	a4,a1,0x1
     778:	00b70733          	add	a4,a4,a1
     77c:	00ec8733          	add	a4,s9,a4
     780:	00a70733          	add	a4,a4,a0
         (((uint32_t)(uint8_t)x3) << 24);
     784:	00074703          	lbu	a4,0(a4)
     788:	01871713          	sll	a4,a4,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     78c:	00e86833          	or	a6,a6,a4
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     790:	0307878b          	.insn	4, 0x0307878b
          acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
     794:	00fb8bb3          	add	s7,s7,a5
        for(; k+3<K_; k+=4){
     798:	01012783          	lw	a5,16(sp)
     79c:	00490d13          	add	s10,s2,4
     7a0:	00790913          	add	s2,s2,7
     7a4:	d0f944e3          	blt	s2,a5,4ac <conv_cfu.constprop.0+0x78>
        }
        for(;k<K_;++k){
     7a8:	01012783          	lw	a5,16(sp)
     7ac:	02fd4463          	blt	s10,a5,7d4 <conv_cfu.constprop.0+0x3a0>
          int iy=oy*STR_+ky-PAD_, ix=ox*STR_+kx-PAD_;
          int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix]:0;
          int8_t b=Wm[(((oc*Cin_)+c)*Kh_+ky)*Kw_+kx];
          acc += (int32_t)a*b;
        }
        out[(oc*OH_+oy)*OW_+ox]=acc;
     7b0:	00412783          	lw	a5,4(sp)
      for(int ox=0; ox<OW_; ++ox){
     7b4:	00198993          	add	s3,s3,1
        out[(oc*OH_+oy)*OW_+ox]=acc;
     7b8:	0177a023          	sw	s7,0(a5)
      for(int ox=0; ox<OW_; ++ox){
     7bc:	00478793          	add	a5,a5,4
     7c0:	00f12223          	sw	a5,4(sp)
     7c4:	0a898c63          	beq	s3,s0,87c <conv_cfu.constprop.0+0x448>
        int32_t acc=0; int k=0;
     7c8:	00000b93          	li	s7,0
     7cc:	00000913          	li	s2,0
     7d0:	ce1ff06f          	j	4b0 <conv_cfu.constprop.0+0x7c>
          int c=k/(Kh_*Kw_), r=k%(Kh_*Kw_), ky=r/Kw_, kx=r%Kw_;
     7d4:	00900593          	li	a1,9
     7d8:	000d0513          	mv	a0,s10
     7dc:	6900f0ef          	jal	fe6c <__divsi3>
     7e0:	00900593          	li	a1,9
     7e4:	00050d93          	mv	s11,a0
     7e8:	000d0513          	mv	a0,s10
     7ec:	7040f0ef          	jal	fef0 <__modsi3>
     7f0:	00300593          	li	a1,3
     7f4:	00a12623          	sw	a0,12(sp)
     7f8:	6740f0ef          	jal	fe6c <__divsi3>
     7fc:	00050913          	mv	s2,a0
     800:	00c12503          	lw	a0,12(sp)
     804:	00300593          	li	a1,3
     808:	6e80f0ef          	jal	fef0 <__modsi3>
          int iy=oy*STR_+ky-PAD_, ix=ox*STR_+kx-PAD_;
     80c:	012a08b3          	add	a7,s4,s2
     810:	fff88893          	add	a7,a7,-1
          int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix]:0;
     814:	00000593          	li	a1,0
     818:	02988863          	beq	a7,s1,848 <conv_cfu.constprop.0+0x414>
     81c:	02888663          	beq	a7,s0,848 <conv_cfu.constprop.0+0x414>
          int iy=oy*STR_+ky-PAD_, ix=ox*STR_+kx-PAD_;
     820:	00a98733          	add	a4,s3,a0
     824:	fff70713          	add	a4,a4,-1
          int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix]:0;
     828:	02970063          	beq	a4,s1,848 <conv_cfu.constprop.0+0x414>
     82c:	00870e63          	beq	a4,s0,848 <conv_cfu.constprop.0+0x414>
     830:	005d9793          	sll	a5,s11,0x5
     834:	011787b3          	add	a5,a5,a7
     838:	00579793          	sll	a5,a5,0x5
     83c:	00fb07b3          	add	a5,s6,a5
     840:	00e787b3          	add	a5,a5,a4
     844:	00078583          	lb	a1,0(a5)
          int8_t b=Wm[(((oc*Cin_)+c)*Kh_+ky)*Kw_+kx];
     848:	01ba8db3          	add	s11,s5,s11
     84c:	001d9713          	sll	a4,s11,0x1
     850:	01b70733          	add	a4,a4,s11
     854:	01270733          	add	a4,a4,s2
     858:	00171793          	sll	a5,a4,0x1
     85c:	00e787b3          	add	a5,a5,a4
     860:	00fc87b3          	add	a5,s9,a5
     864:	00a78533          	add	a0,a5,a0
          acc += (int32_t)a*b;
     868:	00050503          	lb	a0,0(a0)
        for(;k<K_;++k){
     86c:	001d0d13          	add	s10,s10,1
          acc += (int32_t)a*b;
     870:	5400f0ef          	jal	fdb0 <__mulsi3>
     874:	00ab8bb3          	add	s7,s7,a0
        for(;k<K_;++k){
     878:	f31ff06f          	j	7a8 <conv_cfu.constprop.0+0x374>
    for(int oy=0; oy<OH_; ++oy)
     87c:	00012783          	lw	a5,0(sp)
     880:	001a0a13          	add	s4,s4,1
     884:	02078793          	add	a5,a5,32
     888:	00f12023          	sw	a5,0(sp)
     88c:	033a0063          	beq	s4,s3,8ac <conv_cfu.constprop.0+0x478>
      for(int ox=0; ox<OW_; ++ox){
     890:	00012783          	lw	a5,0(sp)
     894:	00000993          	li	s3,0
     898:	00279b93          	sll	s7,a5,0x2
     89c:	01812783          	lw	a5,24(sp)
     8a0:	017787b3          	add	a5,a5,s7
     8a4:	00f12223          	sw	a5,4(sp)
     8a8:	f21ff06f          	j	7c8 <conv_cfu.constprop.0+0x394>
  for(int oc=0; oc<Cout_; ++oc){
     8ac:	00812783          	lw	a5,8(sp)
     8b0:	001c0c13          	add	s8,s8,1
     8b4:	00fa8ab3          	add	s5,s5,a5
     8b8:	01412783          	lw	a5,20(sp)
     8bc:	befc10e3          	bne	s8,a5,49c <conv_cfu.constprop.0+0x68>
      }
  }
}
     8c0:	07c12083          	lw	ra,124(sp)
     8c4:	07812403          	lw	s0,120(sp)
     8c8:	07412483          	lw	s1,116(sp)
     8cc:	07012903          	lw	s2,112(sp)
     8d0:	06c12983          	lw	s3,108(sp)
     8d4:	06812a03          	lw	s4,104(sp)
     8d8:	06412a83          	lw	s5,100(sp)
     8dc:	06012b03          	lw	s6,96(sp)
     8e0:	05c12b83          	lw	s7,92(sp)
     8e4:	05812c03          	lw	s8,88(sp)
     8e8:	05412c83          	lw	s9,84(sp)
     8ec:	05012d03          	lw	s10,80(sp)
     8f0:	04c12d83          	lw	s11,76(sp)
     8f4:	08010113          	add	sp,sp,128
     8f8:	00008067          	ret

000008fc <conv_sw_generic.constprop.0>:
static void conv_sw_generic(int Cin_, int H_, int W_,
     8fc:	f8010113          	add	sp,sp,-128
     900:	00551793          	sll	a5,a0,0x5
     904:	07612023          	sw	s6,96(sp)
     908:	05712e23          	sw	s7,92(sp)
     90c:	05812c23          	sw	s8,88(sp)
     910:	05b12623          	sw	s11,76(sp)
     914:	00f12623          	sw	a5,12(sp)
     918:	06112e23          	sw	ra,124(sp)
     91c:	06812c23          	sw	s0,120(sp)
     920:	06912a23          	sw	s1,116(sp)
     924:	07212823          	sw	s2,112(sp)
     928:	07312623          	sw	s3,108(sp)
     92c:	07412423          	sw	s4,104(sp)
     930:	07512223          	sw	s5,100(sp)
     934:	05912a23          	sw	s9,84(sp)
     938:	05a12823          	sw	s10,80(sp)
     93c:	00050c13          	mv	s8,a0
     940:	00058d93          	mv	s11,a1
    for(int oy=0; oy<OH_; ++oy)
     944:	00000b13          	li	s6,0
  for(int oc=0; oc<Cout_; ++oc)
     948:	00000b93          	li	s7,0
              int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix] : 0;
     94c:	fff00f13          	li	t5,-1
     950:	02000793          	li	a5,32
    for(int oy=0; oy<OH_; ++oy)
     954:	001b1593          	sll	a1,s6,0x1
     958:	016585b3          	add	a1,a1,s6
     95c:	00ab9d13          	sll	s10,s7,0xa
     960:	00b12823          	sw	a1,16(sp)
     964:	00000413          	li	s0,0
     968:	1140006f          	j	a7c <conv_sw_generic.constprop.0+0x180>
              int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix] : 0;
     96c:	00000593          	li	a1,0
     970:	01ea0e63          	beq	s4,t5,98c <conv_sw_generic.constprop.0+0x90>
     974:	00fa0c63          	beq	s4,a5,98c <conv_sw_generic.constprop.0+0x90>
     978:	01e90a63          	beq	s2,t5,98c <conv_sw_generic.constprop.0+0x90>
     97c:	00f90863          	beq	s2,a5,98c <conv_sw_generic.constprop.0+0x90>
     980:	01c605b3          	add	a1,a2,t3
     984:	012585b3          	add	a1,a1,s2
     988:	fe058583          	lb	a1,-32(a1)
              acc += (int32_t)a*(int32_t)b;
     98c:	000e8503          	lb	a0,0(t4)
     990:	03f12e23          	sw	t6,60(sp)
     994:	02712c23          	sw	t2,56(sp)
     998:	02e12a23          	sw	a4,52(sp)
     99c:	02d12823          	sw	a3,48(sp)
     9a0:	02c12623          	sw	a2,44(sp)
     9a4:	02512423          	sw	t0,40(sp)
     9a8:	02612223          	sw	t1,36(sp)
     9ac:	03112023          	sw	a7,32(sp)
     9b0:	01012e23          	sw	a6,28(sp)
     9b4:	01c12c23          	sw	t3,24(sp)
     9b8:	01d12a23          	sw	t4,20(sp)
     9bc:	3f40f0ef          	jal	fdb0 <__mulsi3>
     9c0:	01c12803          	lw	a6,28(sp)
            for(int kx=0; kx<Kw_; ++kx){
     9c4:	01412e83          	lw	t4,20(sp)
     9c8:	03812383          	lw	t2,56(sp)
     9cc:	00190913          	add	s2,s2,1
     9d0:	01812e03          	lw	t3,24(sp)
     9d4:	02012883          	lw	a7,32(sp)
     9d8:	02412303          	lw	t1,36(sp)
     9dc:	02812283          	lw	t0,40(sp)
     9e0:	02c12603          	lw	a2,44(sp)
     9e4:	03012683          	lw	a3,48(sp)
     9e8:	03412703          	lw	a4,52(sp)
     9ec:	03c12f83          	lw	t6,60(sp)
              acc += (int32_t)a*(int32_t)b;
     9f0:	00a80833          	add	a6,a6,a0
            for(int kx=0; kx<Kw_; ++kx){
     9f4:	001e8e93          	add	t4,t4,1
     9f8:	fff00f13          	li	t5,-1
     9fc:	02000793          	li	a5,32
     a00:	f67916e3          	bne	s2,t2,96c <conv_sw_generic.constprop.0+0x70>
          for(int ky=0; ky<Kh_; ++ky)
     a04:	001a0a13          	add	s4,s4,1
     a08:	003a8a93          	add	s5,s5,3
     a0c:	020e0e13          	add	t3,t3,32
     a10:	01fa0863          	beq	s4,t6,a20 <conv_sw_generic.constprop.0+0x124>
            for(int kx=0; kx<Kw_; ++kx){
     a14:	01568eb3          	add	t4,a3,s5
     a18:	fff48913          	add	s2,s1,-1
     a1c:	f51ff06f          	j	96c <conv_sw_generic.constprop.0+0x70>
        for(int c=0; c<Cin_; ++c)
     a20:	00c12583          	lw	a1,12(sp)
     a24:	02088893          	add	a7,a7,32
     a28:	40030313          	add	t1,t1,1024
     a2c:	003c8c93          	add	s9,s9,3
     a30:	00b88c63          	beq	a7,a1,a48 <conv_sw_generic.constprop.0+0x14c>
          for(int ky=0; ky<Kh_; ++ky)
     a34:	001c9a93          	sll	s5,s9,0x1
     a38:	019a8ab3          	add	s5,s5,s9
     a3c:	fff40a13          	add	s4,s0,-1
              int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix] : 0;
     a40:	00030e13          	mv	t3,t1
     a44:	fd1ff06f          	j	a14 <conv_sw_generic.constprop.0+0x118>
        out[(oc*OH_+oy)*OW_+ox] = acc;
     a48:	0109a023          	sw	a6,0(s3)
      for(int ox=0; ox<OW_; ++ox){
     a4c:	00148493          	add	s1,s1,1
     a50:	00498993          	add	s3,s3,4
     a54:	00f48e63          	beq	s1,a5,a70 <conv_sw_generic.constprop.0+0x174>
              int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix] : 0;
     a58:	01012c83          	lw	s9,16(sp)
     a5c:	00028313          	mv	t1,t0
     a60:	00000893          	li	a7,0
        int32_t acc=0;
     a64:	00000813          	li	a6,0
            for(int kx=0; kx<Kw_; ++kx){
     a68:	00248393          	add	t2,s1,2
     a6c:	fc9ff06f          	j	a34 <conv_sw_generic.constprop.0+0x138>
    for(int oy=0; oy<OH_; ++oy)
     a70:	00140413          	add	s0,s0,1
     a74:	020d0d13          	add	s10,s10,32
     a78:	00940e63          	beq	s0,s1,a94 <conv_sw_generic.constprop.0+0x198>
      for(int ox=0; ox<OW_; ++ox){
     a7c:	002d1993          	sll	s3,s10,0x2
     a80:	013709b3          	add	s3,a4,s3
     a84:	00541293          	sll	t0,s0,0x5
     a88:	00000493          	li	s1,0
          for(int ky=0; ky<Kh_; ++ky)
     a8c:	00240f93          	add	t6,s0,2
     a90:	fc9ff06f          	j	a58 <conv_sw_generic.constprop.0+0x15c>
  for(int oc=0; oc<Cout_; ++oc)
     a94:	001b8b93          	add	s7,s7,1
     a98:	018b0b33          	add	s6,s6,s8
     a9c:	ebbb9ce3          	bne	s7,s11,954 <conv_sw_generic.constprop.0+0x58>
}
     aa0:	07c12083          	lw	ra,124(sp)
     aa4:	07812403          	lw	s0,120(sp)
     aa8:	07412483          	lw	s1,116(sp)
     aac:	07012903          	lw	s2,112(sp)
     ab0:	06c12983          	lw	s3,108(sp)
     ab4:	06812a03          	lw	s4,104(sp)
     ab8:	06412a83          	lw	s5,100(sp)
     abc:	06012b03          	lw	s6,96(sp)
     ac0:	05c12b83          	lw	s7,92(sp)
     ac4:	05812c03          	lw	s8,88(sp)
     ac8:	05412c83          	lw	s9,84(sp)
     acc:	05012d03          	lw	s10,80(sp)
     ad0:	04c12d83          	lw	s11,76(sp)
     ad4:	08010113          	add	sp,sp,128
     ad8:	00008067          	ret

00000adc <cfs_feed_strict_step.constprop.0>:
static void cfs_feed_strict_step(const int8_t *Aflat, const int8_t *Bflat, int Klen, int lda, int ldb){
     adc:	fc010113          	add	sp,sp,-64
     ae0:	02812e23          	sw	s0,60(sp)
     ae4:	02912c23          	sw	s1,56(sp)
     ae8:	03212a23          	sw	s2,52(sp)
     aec:	03312823          	sw	s3,48(sp)
     af0:	03412623          	sw	s4,44(sp)
     af4:	03512423          	sw	s5,40(sp)
     af8:	03612223          	sw	s6,36(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     afc:	ffeb07b7          	lui	a5,0xffeb0
     b00:	00200713          	li	a4,2
     b04:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     b08:	0007a783          	lw	a5,0(a5)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b0c:	ffeb0337          	lui	t1,0xffeb0
     b10:	ffeb0e37          	lui	t3,0xffeb0
     b14:	ffeb0eb7          	lui	t4,0xffeb0
     b18:	ffeb0f37          	lui	t5,0xffeb0
     b1c:	ffeb0fb7          	lui	t6,0xffeb0
     b20:	ffeb02b7          	lui	t0,0xffeb0
     b24:	ffeb03b7          	lui	t2,0xffeb0
     b28:	ffeb0437          	lui	s0,0xffeb0
  const int T = Klen + 6;
     b2c:	00660a13          	add	s4,a2,6
  for(int s=0;s<T;++s){
     b30:	00000793          	li	a5,0
     b34:	fff68693          	add	a3,a3,-1
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     b38:	ffeb0937          	lui	s2,0xffeb0
     b3c:	00430313          	add	t1,t1,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     b40:	008e0e13          	add	t3,t3,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     b44:	00ce8e93          	add	t4,t4,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     b48:	010f0f13          	add	t5,t5,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     b4c:	014f8f93          	add	t6,t6,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     b50:	01828293          	add	t0,t0,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     b54:	01c38393          	add	t2,t2,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     b58:	02040413          	add	s0,s0,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
     b5c:	00100a93          	li	s5,1
  for(int s=0;s<T;++s){
     b60:	0347c463          	blt	a5,s4,b88 <cfs_feed_strict_step.constprop.0+0xac>
}
     b64:	03c12403          	lw	s0,60(sp)
     b68:	03812483          	lw	s1,56(sp)
     b6c:	03412903          	lw	s2,52(sp)
     b70:	03012983          	lw	s3,48(sp)
     b74:	02c12a03          	lw	s4,44(sp)
     b78:	02812a83          	lw	s5,40(sp)
     b7c:	02412b03          	lw	s6,36(sp)
     b80:	04010113          	add	sp,sp,64
     b84:	00008067          	ret
    uint32_t Aw[4]={0}, Bw[4]={0};
     b88:	00012023          	sw	zero,0(sp)
     b8c:	00012223          	sw	zero,4(sp)
     b90:	00012423          	sw	zero,8(sp)
     b94:	00012623          	sw	zero,12(sp)
     b98:	00012823          	sw	zero,16(sp)
     b9c:	00012a23          	sw	zero,20(sp)
     ba0:	00012c23          	sw	zero,24(sp)
     ba4:	00012e23          	sw	zero,28(sp)
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<Klen)? Aflat[i*lda+k] : 0; Aw[i]=(uint32_t)(uint8_t)a; }
     ba8:	00078713          	mv	a4,a5
     bac:	00010b13          	mv	s6,sp
     bb0:	00f504b3          	add	s1,a0,a5
    uint32_t Aw[4]={0}, Bw[4]={0};
     bb4:	00078813          	mv	a6,a5
     bb8:	ffc78993          	add	s3,a5,-4
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<Klen)? Aflat[i*lda+k] : 0; Aw[i]=(uint32_t)(uint8_t)a; }
     bbc:	00000893          	li	a7,0
     bc0:	00084663          	bltz	a6,bcc <cfs_feed_strict_step.constprop.0+0xf0>
     bc4:	00c85463          	bge	a6,a2,bcc <cfs_feed_strict_step.constprop.0+0xf0>
     bc8:	00048883          	lb	a7,0(s1)
     bcc:	0ff8f893          	zext.b	a7,a7
     bd0:	011b2023          	sw	a7,0(s6)
     bd4:	fff80813          	add	a6,a6,-1 # ffff <__fini_array_end+0x57>
     bd8:	004b0b13          	add	s6,s6,4
     bdc:	00d484b3          	add	s1,s1,a3
     be0:	fd381ee3          	bne	a6,s3,bbc <cfs_feed_strict_step.constprop.0+0xe0>
     be4:	00279813          	sll	a6,a5,0x2
     be8:	01010493          	add	s1,sp,16
     bec:	01058833          	add	a6,a1,a6
    for(int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<Klen)? Bflat[k*ldb+j] : 0; Bw[j]=(uint32_t)(uint8_t)b; }
     bf0:	00000893          	li	a7,0
     bf4:	00074663          	bltz	a4,c00 <cfs_feed_strict_step.constprop.0+0x124>
     bf8:	00c75463          	bge	a4,a2,c00 <cfs_feed_strict_step.constprop.0+0x124>
     bfc:	00080883          	lb	a7,0(a6)
     c00:	0ff8f893          	zext.b	a7,a7
     c04:	0114a023          	sw	a7,0(s1)
     c08:	fff70713          	add	a4,a4,-1
     c0c:	00448493          	add	s1,s1,4
     c10:	ffd80813          	add	a6,a6,-3
     c14:	fd371ee3          	bne	a4,s3,bf0 <cfs_feed_strict_step.constprop.0+0x114>
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     c18:	00012703          	lw	a4,0(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     c1c:	00e32023          	sw	a4,0(t1)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     c20:	00412703          	lw	a4,4(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     c24:	00ee2023          	sw	a4,0(t3)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     c28:	00812703          	lw	a4,8(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     c2c:	00eea023          	sw	a4,0(t4)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     c30:	00c12703          	lw	a4,12(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     c34:	00ef2023          	sw	a4,0(t5)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     c38:	01012703          	lw	a4,16(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     c3c:	00efa023          	sw	a4,0(t6)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     c40:	01412703          	lw	a4,20(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     c44:	00e2a023          	sw	a4,0(t0)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     c48:	01812703          	lw	a4,24(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     c4c:	00e3a023          	sw	a4,0(t2)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     c50:	01c12703          	lw	a4,28(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     c54:	00e42023          	sw	a4,0(s0)
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     c58:	00092703          	lw	a4,0(s2) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     c5c:	01592023          	sw	s5,0(s2)
  for(int s=0;s<T;++s){
     c60:	00178793          	add	a5,a5,1
     c64:	efdff06f          	j	b60 <cfs_feed_strict_step.constprop.0+0x84>

00000c68 <conv_cfs.constprop.0>:
          int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix]:0;
          Bflat[idx*ldb+s]=a; idx++;
        }
  }
}
static void conv_cfs(int Cin_, int H_, int W_,
     c68:	f7010113          	add	sp,sp,-144
     c6c:	08912223          	sw	s1,132(sp)
                     int Cout_, int Kh_, int Kw_, int STR_, int PAD_,
                     const int8_t *in, const int8_t *Wm, int32_t *out){
  const int OH_=(H_+2*PAD_-Kh_)/STR_+1, OW_=(W_+2*PAD_-Kw_)/STR_+1;
  const int K_ = Cin_*Kh_*Kw_;
     c70:	00351493          	sll	s1,a0,0x3
     c74:	00a484b3          	add	s1,s1,a0
  int32_t C4[4][4];
  const int NPOS=OH_*OW_;
  /* per-tile VLAs (small here: K_ <= 9*Cmid, e.g. 72 for Cmid=8) */
  int8_t Aflat[4*K_];
     c78:	00249793          	sll	a5,s1,0x2
     c7c:	00f78793          	add	a5,a5,15
static void conv_cfs(int Cin_, int H_, int W_,
     c80:	08812423          	sw	s0,136(sp)
     c84:	09212023          	sw	s2,128(sp)
     c88:	07312e23          	sw	s3,124(sp)
     c8c:	07412c23          	sw	s4,120(sp)
     c90:	07612823          	sw	s6,112(sp)
     c94:	07712623          	sw	s7,108(sp)
     c98:	07812423          	sw	s8,104(sp)
     c9c:	07912223          	sw	s9,100(sp)
     ca0:	07a12023          	sw	s10,96(sp)
     ca4:	08112623          	sw	ra,140(sp)
     ca8:	07512a23          	sw	s5,116(sp)
     cac:	05b12e23          	sw	s11,92(sp)
     cb0:	09010413          	add	s0,sp,144
  int8_t Aflat[4*K_];
     cb4:	ff07f793          	and	a5,a5,-16
     cb8:	40f10133          	sub	sp,sp,a5
     cbc:	f6242e23          	sw	sp,-132(s0)
  int8_t Bflat[K_*4];
     cc0:	40f10133          	sub	sp,sp,a5
     cc4:	00251793          	sll	a5,a0,0x2
static void conv_cfs(int Cin_, int H_, int W_,
     cc8:	00050913          	mv	s2,a0
     ccc:	00058a13          	mv	s4,a1
     cd0:	00060b93          	mv	s7,a2
     cd4:	00068c13          	mv	s8,a3
     cd8:	00070c93          	mv	s9,a4
  int8_t Bflat[K_*4];
     cdc:	f6242c23          	sw	sp,-136(s0)

  for(int oc0=0; oc0<Cout_; oc0+=4){
     ce0:	f6f42a23          	sw	a5,-140(s0)
  int8_t Bflat[K_*4];
     ce4:	00000b13          	li	s6,0
  for(int oc0=0; oc0<Cout_; oc0+=4){
     ce8:	00000993          	li	s3,0
          int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix]:0;
     cec:	02000d13          	li	s10,32
static void conv_cfs(int Cin_, int H_, int W_,
     cf0:	000b0513          	mv	a0,s6
     cf4:	00000813          	li	a6,0
  for(int r=0;r<4;++r){
     cf8:	00000593          	li	a1,0
        for(int kx=0;kx<Kw_;++kx){
     cfc:	00300e13          	li	t3,3
  for(int r=0;r<4;++r){
     d00:	00400313          	li	t1,4
          Aflat[r*lda+idx++] = (oc<Cout_)? Wm[(((oc*Cin_)+c)*Kh_+ky)*Kw_+kx] : 0;
     d04:	f7c42683          	lw	a3,-132(s0)
     d08:	00151713          	sll	a4,a0,0x1
     d0c:	00a70733          	add	a4,a4,a0
    int idx=0;
     d10:	00000793          	li	a5,0
          Aflat[r*lda+idx++] = (oc<Cout_)? Wm[(((oc*Cin_)+c)*Kh_+ky)*Kw_+kx] : 0;
     d14:	01358f33          	add	t5,a1,s3
     d18:	01068fb3          	add	t6,a3,a6
      for(int ky=0;ky<Kh_;++ky)
     d1c:	00171693          	sll	a3,a4,0x1
     d20:	00e686b3          	add	a3,a3,a4
     d24:	00978e93          	add	t4,a5,9
     d28:	0300006f          	j	d58 <conv_cfs.constprop.0+0xf0>
          Aflat[r*lda+idx++] = (oc<Cout_)? Wm[(((oc*Cin_)+c)*Kh_+ky)*Kw_+kx] : 0;
     d2c:	00000893          	li	a7,0
     d30:	014f5663          	bge	t5,s4,d3c <conv_cfs.constprop.0+0xd4>
     d34:	00c388b3          	add	a7,t2,a2
     d38:	00088883          	lb	a7,0(a7)
     d3c:	00c280b3          	add	ra,t0,a2
     d40:	01108023          	sb	a7,0(ra)
        for(int kx=0;kx<Kw_;++kx){
     d44:	00160613          	add	a2,a2,1
     d48:	ffc612e3          	bne	a2,t3,d2c <conv_cfs.constprop.0+0xc4>
     d4c:	00378793          	add	a5,a5,3
      for(int ky=0;ky<Kh_;++ky)
     d50:	00368693          	add	a3,a3,3
     d54:	01d78a63          	beq	a5,t4,d68 <conv_cfs.constprop.0+0x100>
        for(int kx=0;kx<Kw_;++kx){
     d58:	00000613          	li	a2,0
          Aflat[r*lda+idx++] = (oc<Cout_)? Wm[(((oc*Cin_)+c)*Kh_+ky)*Kw_+kx] : 0;
     d5c:	00dc03b3          	add	t2,s8,a3
     d60:	00ff82b3          	add	t0,t6,a5
     d64:	fc9ff06f          	j	d2c <conv_cfs.constprop.0+0xc4>
    for(int c=0;c<Cin_;++c)
     d68:	00370713          	add	a4,a4,3
     d6c:	faf498e3          	bne	s1,a5,d1c <conv_cfs.constprop.0+0xb4>
  for(int r=0;r<4;++r){
     d70:	00158593          	add	a1,a1,1
     d74:	00980833          	add	a6,a6,s1
     d78:	01250533          	add	a0,a0,s2
     d7c:	f86594e3          	bne	a1,t1,d04 <conv_cfs.constprop.0+0x9c>
    build_Aflat_conv(Wm, oc0, Cout_, Cin_, Kh_, Kw_, Aflat, /*lda=*/K_);
    for(int j0=0; j0<NPOS; j0+=4){
     d80:	00000a93          	li	s5,0
  for(int s=0;s<4;++s){
     d84:	00400d93          	li	s11,4
      build_Bflat_conv(in, Cin_, H_, W_, Kh_, Kw_, STR_, PAD_, j0, OH_, OW_, Bflat, /*ldb=*/4);
      cfs_gemm_4xKx4(Aflat,Bflat,K_,/*lda=*/K_,/*ldb=*/4);
      cfs_read_C4(C4);
      for(int r=0;r<4;++r){
     d88:	00498e93          	add	t4,s3,4
  for(int s=0;s<4;++s){
     d8c:	00000593          	li	a1,0
          int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix]:0;
     d90:	fff00f93          	li	t6,-1
    int pos=j0+s;
     d94:	f7842783          	lw	a5,-136(s0)
     d98:	01558333          	add	t1,a1,s5
    int oy=pos/OW_, ox=pos%OW_;
     d9c:	40535613          	sra	a2,t1,0x5
     da0:	01f37313          	and	t1,t1,31
     da4:	00060693          	mv	a3,a2
    for(int c=0;c<Cin_;++c)
     da8:	00000893          	li	a7,0
     dac:	00260393          	add	t2,a2,2
     db0:	00b780b3          	add	ra,a5,a1
     db4:	00230293          	add	t0,t1,2
     db8:	00389813          	sll	a6,a7,0x3
     dbc:	01180833          	add	a6,a6,a7
      for(int ky=0;ky<Kh_;++ky)
     dc0:	fff60513          	add	a0,a2,-1
     dc4:	00569713          	sll	a4,a3,0x5
     dc8:	0440006f          	j	e0c <conv_cfs.constprop.0+0x1a4>
          int8_t a=(iy>=0&&iy<H_&&ix>=0&&ix<W_)? in[(c*H_+iy)*W_+ix]:0;
     dcc:	00000f13          	li	t5,0
     dd0:	01f50e63          	beq	a0,t6,dec <conv_cfs.constprop.0+0x184>
     dd4:	01a50c63          	beq	a0,s10,dec <conv_cfs.constprop.0+0x184>
     dd8:	01f78a63          	beq	a5,t6,dec <conv_cfs.constprop.0+0x184>
     ddc:	01a78863          	beq	a5,s10,dec <conv_cfs.constprop.0+0x184>
     de0:	00eb8f33          	add	t5,s7,a4
     de4:	00ff0f33          	add	t5,t5,a5
     de8:	fe0f0f03          	lb	t5,-32(t5)
          Bflat[idx*ldb+s]=a; idx++;
     dec:	01ee0023          	sb	t5,0(t3)
        for(int kx=0;kx<Kw_;++kx){
     df0:	00178793          	add	a5,a5,1
     df4:	004e0e13          	add	t3,t3,4
     df8:	fcf29ae3          	bne	t0,a5,dcc <conv_cfs.constprop.0+0x164>
      for(int ky=0;ky<Kh_;++ky)
     dfc:	00150513          	add	a0,a0,1
     e00:	00380813          	add	a6,a6,3
     e04:	02070713          	add	a4,a4,32
     e08:	00750a63          	beq	a0,t2,e1c <conv_cfs.constprop.0+0x1b4>
        for(int kx=0;kx<Kw_;++kx){
     e0c:	00281e13          	sll	t3,a6,0x2
     e10:	01c08e33          	add	t3,ra,t3
     e14:	fff30793          	add	a5,t1,-1
     e18:	fb5ff06f          	j	dcc <conv_cfs.constprop.0+0x164>
    for(int c=0;c<Cin_;++c)
     e1c:	00188893          	add	a7,a7,1
     e20:	02068693          	add	a3,a3,32
     e24:	f9191ae3          	bne	s2,a7,db8 <conv_cfs.constprop.0+0x150>
  for(int s=0;s<4;++s){
     e28:	00158593          	add	a1,a1,1
     e2c:	f7b594e3          	bne	a1,s11,d94 <conv_cfs.constprop.0+0x12c>
  cfs_feed_strict_step(Aflat,Bflat,Klen,lda,ldb);
     e30:	f7842583          	lw	a1,-136(s0)
     e34:	f7c42503          	lw	a0,-132(s0)
     e38:	00048613          	mv	a2,s1
     e3c:	00048693          	mv	a3,s1
     e40:	f7d42823          	sw	t4,-144(s0)
     e44:	c99ff0ef          	jal	adc <cfs_feed_strict_step.constprop.0>
      cfs_read_C4(C4);
     e48:	f8040513          	add	a0,s0,-128
     e4c:	c30ff0ef          	jal	27c <cfs_read_C4>
     e50:	f7042e83          	lw	t4,-144(s0)
     e54:	f8040613          	add	a2,s0,-128
     e58:	00098713          	mv	a4,s3
        int oc=oc0+r; if(oc>=Cout_) continue;
     e5c:	05475263          	bge	a4,s4,ea0 <conv_cfs.constprop.0+0x238>
        for(int s=0;s<4;++s){
          int pos=j0+s; if(pos>=NPOS) continue;
          int oy=pos/OW_, ox=pos%OW_;
          out[(oc*OH_+oy)*OW_+ox] = C4[r][s];
     e60:	00571513          	sll	a0,a4,0x5
     e64:	00060593          	mv	a1,a2
        for(int s=0;s<4;++s){
     e68:	00000693          	li	a3,0
          int pos=j0+s; if(pos>=NPOS) continue;
     e6c:	01568833          	add	a6,a3,s5
          int oy=pos/OW_, ox=pos%OW_;
     e70:	40585793          	sra	a5,a6,0x5
          out[(oc*OH_+oy)*OW_+ox] = C4[r][s];
     e74:	00a787b3          	add	a5,a5,a0
          int oy=pos/OW_, ox=pos%OW_;
     e78:	01f87813          	and	a6,a6,31
          out[(oc*OH_+oy)*OW_+ox] = C4[r][s];
     e7c:	00579793          	sll	a5,a5,0x5
     e80:	010787b3          	add	a5,a5,a6
     e84:	0005a803          	lw	a6,0(a1)
     e88:	00279793          	sll	a5,a5,0x2
     e8c:	00fc87b3          	add	a5,s9,a5
     e90:	0107a023          	sw	a6,0(a5)
        for(int s=0;s<4;++s){
     e94:	00168693          	add	a3,a3,1
     e98:	00458593          	add	a1,a1,4
     e9c:	fdb698e3          	bne	a3,s11,e6c <conv_cfs.constprop.0+0x204>
      for(int r=0;r<4;++r){
     ea0:	00170713          	add	a4,a4,1
     ea4:	01060613          	add	a2,a2,16
     ea8:	fbd71ae3          	bne	a4,t4,e5c <conv_cfs.constprop.0+0x1f4>
    for(int j0=0; j0<NPOS; j0+=4){
     eac:	004a8a93          	add	s5,s5,4
     eb0:	40000793          	li	a5,1024
     eb4:	ecfa9ce3          	bne	s5,a5,d8c <conv_cfs.constprop.0+0x124>
  for(int oc0=0; oc0<Cout_; oc0+=4){
     eb8:	f7442783          	lw	a5,-140(s0)
     ebc:	00070993          	mv	s3,a4
     ec0:	00fb0b33          	add	s6,s6,a5
     ec4:	e34746e3          	blt	a4,s4,cf0 <conv_cfs.constprop.0+0x88>
        }
      }
    }
  }
}
     ec8:	f7040113          	add	sp,s0,-144
     ecc:	08c12083          	lw	ra,140(sp)
     ed0:	08812403          	lw	s0,136(sp)
     ed4:	08412483          	lw	s1,132(sp)
     ed8:	08012903          	lw	s2,128(sp)
     edc:	07c12983          	lw	s3,124(sp)
     ee0:	07812a03          	lw	s4,120(sp)
     ee4:	07412a83          	lw	s5,116(sp)
     ee8:	07012b03          	lw	s6,112(sp)
     eec:	06c12b83          	lw	s7,108(sp)
     ef0:	06812c03          	lw	s8,104(sp)
     ef4:	06412c83          	lw	s9,100(sp)
     ef8:	06012d03          	lw	s10,96(sp)
     efc:	05c12d83          	lw	s11,92(sp)
     f00:	09010113          	add	sp,sp,144
     f04:	00008067          	ret

00000f08 <argmax_i32.constprop.0>:
  int bi=0; int32_t bv=v[0];
     f08:	00052603          	lw	a2,0(a0)
static int argmax_i32(const int32_t *v, int n){
     f0c:	00050713          	mv	a4,a0
  for(int i=1;i<n;++i){ if(v[i]>bv){ bv=v[i]; bi=i; } }
     f10:	00100793          	li	a5,1
  int bi=0; int32_t bv=v[0];
     f14:	00000513          	li	a0,0
  for(int i=1;i<n;++i){ if(v[i]>bv){ bv=v[i]; bi=i; } }
     f18:	00a00593          	li	a1,10
     f1c:	00279693          	sll	a3,a5,0x2
     f20:	00d706b3          	add	a3,a4,a3
     f24:	0006a683          	lw	a3,0(a3)
     f28:	00d65663          	bge	a2,a3,f34 <argmax_i32.constprop.0+0x2c>
     f2c:	00068613          	mv	a2,a3
     f30:	00078513          	mv	a0,a5
     f34:	00178793          	add	a5,a5,1
     f38:	feb792e3          	bne	a5,a1,f1c <argmax_i32.constprop.0+0x14>
}
     f3c:	00008067          	ret

00000f40 <dump_first_mismatch.isra.0>:
static void dump_first_mismatch(const char* tag, const int32_t* A, const int32_t* B, int n, int stride_hint){
     f40:	fe010113          	add	sp,sp,-32
     f44:	00812c23          	sw	s0,24(sp)
     f48:	01212823          	sw	s2,16(sp)
     f4c:	01312623          	sw	s3,12(sp)
     f50:	01412423          	sw	s4,8(sp)
     f54:	00112e23          	sw	ra,28(sp)
     f58:	00912a23          	sw	s1,20(sp)
     f5c:	01512223          	sw	s5,4(sp)
     f60:	00058993          	mv	s3,a1
     f64:	00060a13          	mv	s4,a2
     f68:	00068913          	mv	s2,a3
  for(int i=0;i<n; ++i){
     f6c:	00000413          	li	s0,0
    if (A[i] != B[i]) {
     f70:	00241793          	sll	a5,s0,0x2
     f74:	00f98733          	add	a4,s3,a5
     f78:	00fa07b3          	add	a5,s4,a5
     f7c:	00072683          	lw	a3,0(a4)
     f80:	0007a703          	lw	a4,0(a5)
     f84:	0ce68663          	beq	a3,a4,1050 <dump_first_mismatch.isra.0+0x110>
      printf("[%s] first mismatch at idx=%d: ref=%ld got=%ld\n",
     f88:	00050593          	mv	a1,a0
     f8c:	00010537          	lui	a0,0x10
     f90:	00040613          	mv	a2,s0
     f94:	fc450513          	add	a0,a0,-60 # ffc4 <__fini_array_end+0x1c>
     f98:	6b9000ef          	jal	1e50 <printf>
      int s = (i>8? i-8:0), e = (i+8<n? i+8:n);
     f9c:	00800793          	li	a5,8
     fa0:	00040493          	mv	s1,s0
     fa4:	00f45463          	bge	s0,a5,fac <dump_first_mismatch.isra.0+0x6c>
     fa8:	00800493          	li	s1,8
     fac:	00840413          	add	s0,s0,8
     fb0:	ff848493          	add	s1,s1,-8
     fb4:	00895463          	bge	s2,s0,fbc <dump_first_mismatch.isra.0+0x7c>
     fb8:	00090413          	mv	s0,s2
      printf("  ref: "); for(int t=s;t<e;++t) printf("%ld ", (long)A[t]); printf("\n");
     fbc:	00010537          	lui	a0,0x10
     fc0:	ff450513          	add	a0,a0,-12 # fff4 <__fini_array_end+0x4c>
     fc4:	68d000ef          	jal	1e50 <printf>
     fc8:	00048913          	mv	s2,s1
     fcc:	00010ab7          	lui	s5,0x10
     fd0:	04894463          	blt	s2,s0,1018 <dump_first_mismatch.isra.0+0xd8>
     fd4:	00a00513          	li	a0,10
     fd8:	6c9000ef          	jal	1ea0 <putchar>
      printf("  got: "); for(int t=s;t<e;++t) printf("%ld ", (long)B[t]); printf("\n");
     fdc:	00010537          	lui	a0,0x10
     fe0:	00450513          	add	a0,a0,4 # 10004 <__fini_array_end+0x5c>
     fe4:	66d000ef          	jal	1e50 <printf>
     fe8:	00010937          	lui	s2,0x10
     fec:	0484c463          	blt	s1,s0,1034 <dump_first_mismatch.isra.0+0xf4>
}
     ff0:	01812403          	lw	s0,24(sp)
     ff4:	01c12083          	lw	ra,28(sp)
     ff8:	01412483          	lw	s1,20(sp)
     ffc:	01012903          	lw	s2,16(sp)
    1000:	00c12983          	lw	s3,12(sp)
    1004:	00812a03          	lw	s4,8(sp)
    1008:	00412a83          	lw	s5,4(sp)
      printf("  got: "); for(int t=s;t<e;++t) printf("%ld ", (long)B[t]); printf("\n");
    100c:	00a00513          	li	a0,10
}
    1010:	02010113          	add	sp,sp,32
      printf("  got: "); for(int t=s;t<e;++t) printf("%ld ", (long)B[t]); printf("\n");
    1014:	68d0006f          	j	1ea0 <putchar>
      printf("  ref: "); for(int t=s;t<e;++t) printf("%ld ", (long)A[t]); printf("\n");
    1018:	00291793          	sll	a5,s2,0x2
    101c:	00f987b3          	add	a5,s3,a5
    1020:	0007a583          	lw	a1,0(a5)
    1024:	ffca8513          	add	a0,s5,-4 # fffc <__fini_array_end+0x54>
    1028:	00190913          	add	s2,s2,1 # 10001 <__fini_array_end+0x59>
    102c:	625000ef          	jal	1e50 <printf>
    1030:	fa1ff06f          	j	fd0 <dump_first_mismatch.isra.0+0x90>
      printf("  got: "); for(int t=s;t<e;++t) printf("%ld ", (long)B[t]); printf("\n");
    1034:	00249793          	sll	a5,s1,0x2
    1038:	00fa07b3          	add	a5,s4,a5
    103c:	0007a583          	lw	a1,0(a5)
    1040:	ffc90513          	add	a0,s2,-4
    1044:	00148493          	add	s1,s1,1
    1048:	609000ef          	jal	1e50 <printf>
    104c:	fa1ff06f          	j	fec <dump_first_mismatch.isra.0+0xac>
  for(int i=0;i<n; ++i){
    1050:	00140413          	add	s0,s0,1
    1054:	f0891ee3          	bne	s2,s0,f70 <dump_first_mismatch.isra.0+0x30>
}
    1058:	01812403          	lw	s0,24(sp)
    105c:	01c12083          	lw	ra,28(sp)
    1060:	01412483          	lw	s1,20(sp)
    1064:	00c12983          	lw	s3,12(sp)
    1068:	00812a03          	lw	s4,8(sp)
    106c:	00412a83          	lw	s5,4(sp)
  printf("[%s] (no mismatch found in %d elements)\n", tag, n);
    1070:	00090613          	mv	a2,s2
}
    1074:	01012903          	lw	s2,16(sp)
  printf("[%s] (no mismatch found in %d elements)\n", tag, n);
    1078:	00050593          	mv	a1,a0
    107c:	00010537          	lui	a0,0x10
    1080:	00c50513          	add	a0,a0,12 # 1000c <__fini_array_end+0x64>
}
    1084:	02010113          	add	sp,sp,32
  printf("[%s] (no mismatch found in %d elements)\n", tag, n);
    1088:	5c90006f          	j	1e50 <printf>

0000108c <main>:

/* ===== Main ===== */
static volatile uint32_t g_sink;

int main(void){
  printf("== Tiny CNN pipeline: SW vs CFU vs CFS ==\n");
    108c:	00010537          	lui	a0,0x10
int main(void){
    1090:	f4010113          	add	sp,sp,-192
  printf("== Tiny CNN pipeline: SW vs CFU vs CFS ==\n");
    1094:	04850513          	add	a0,a0,72 # 10048 <__fini_array_end+0xa0>
int main(void){
    1098:	0a112e23          	sw	ra,188(sp)
    109c:	0a812c23          	sw	s0,184(sp)
    10a0:	0a912a23          	sw	s1,180(sp)
    10a4:	0b212823          	sw	s2,176(sp)
    10a8:	0b312623          	sw	s3,172(sp)
    10ac:	0b412423          	sw	s4,168(sp)
    10b0:	0b512223          	sw	s5,164(sp)
    10b4:	0b612023          	sw	s6,160(sp)
    10b8:	09712e23          	sw	s7,156(sp)
    10bc:	09812c23          	sw	s8,152(sp)
    10c0:	09912a23          	sw	s9,148(sp)
    10c4:	09a12823          	sw	s10,144(sp)
    10c8:	09b12623          	sw	s11,140(sp)
  printf("== Tiny CNN pipeline: SW vs CFU vs CFS ==\n");
    10cc:	719000ef          	jal	1fe4 <puts>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
    10d0:	ffeb07b7          	lui	a5,0xffeb0
    10d4:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID: 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);
    10d8:	00010537          	lui	a0,0x10
    10dc:	07450513          	add	a0,a0,116 # 10074 <__fini_array_end+0xcc>
    10e0:	571000ef          	jal	1e50 <printf>
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
    10e4:	040305b7          	lui	a1,0x4030
    10e8:	080707b7          	lui	a5,0x8070
    10ec:	20158593          	add	a1,a1,513 # 4030201 <__neorv32_ram_size+0x3fb0201>
    10f0:	60578793          	add	a5,a5,1541 # 8070605 <__neorv32_ram_size+0x7ff0605>
    10f4:	02f5858b          	.insn	4, 0x02f5858b

  /* CFU DP4A probe (1*5+2*6+3*7+4*8=70) */
  int32_t probe = cfu_dp4a((int32_t)pack4_s8_lsb(1,2,3,4),
                           (int32_t)pack4_s8_lsb(5,6,7,8));
  printf("CFU DP4A probe = %ld (expect 70)\n\n", (long)probe);
    10f8:	00010537          	lui	a0,0x10
    10fc:	09c50513          	add	a0,a0,156 # 1009c <__fini_array_end+0xf4>
    1100:	551000ef          	jal	1e50 <printf>
  static int8_t  P_sw_s8  [FCDIM];
  static int8_t  P_cfu_s8 [FCDIM];
  static int8_t  P_cfs_s8 [FCDIM];

  /* Fill inputs/weights */
  for(int c=0;c<Cin;++c) for(int y=0;y<H_IMG;++y) for(int x=0;x<W_IMG;++x) IN[c][y][x]=patt_in(c,y,x);
    1104:	800684b7          	lui	s1,0x80068
    1108:	d5048513          	add	a0,s1,-688 # 80067d50 <IN.21>
  printf("CFU DP4A probe = %ld (expect 70)\n\n", (long)probe);
    110c:	00100693          	li	a3,1
  for(int c=0;c<Cin;++c) for(int y=0;y<H_IMG;++y) for(int x=0;x<W_IMG;++x) IN[c][y][x]=patt_in(c,y,x);
    1110:	02000e93          	li	t4,32
    1114:	00500f13          	li	t5,5
    1118:	0ff6fe13          	zext.b	t3,a3
    111c:	001e1793          	sll	a5,t3,0x1
    1120:	ffd78793          	add	a5,a5,-3
    1124:	0ff7f793          	zext.b	a5,a5
int main(void){
    1128:	00050593          	mv	a1,a0
  for(int c=0;c<Cin;++c) for(int y=0;y<H_IMG;++y) for(int x=0;x<W_IMG;++x) IN[c][y][x]=patt_in(c,y,x);
    112c:	00000613          	li	a2,0
    1130:	0340006f          	j	1164 <main+0xd8>
static inline int8_t patt_in (int c, int y, int x){ return (int8_t)(((c+1)*(y+2)+(x-3)) & 0x0F) - 8; }
    1134:	00f77313          	and	t1,a4,15
    1138:	ff830313          	add	t1,t1,-8
  for(int c=0;c<Cin;++c) for(int y=0;y<H_IMG;++y) for(int x=0;x<W_IMG;++x) IN[c][y][x]=patt_in(c,y,x);
    113c:	00170713          	add	a4,a4,1
    1140:	00688023          	sb	t1,0(a7)
    1144:	0ff77713          	zext.b	a4,a4
    1148:	00188893          	add	a7,a7,1
    114c:	fee814e3          	bne	a6,a4,1134 <main+0xa8>
    1150:	00fe07b3          	add	a5,t3,a5
    1154:	00160613          	add	a2,a2,1
    1158:	0ff7f793          	zext.b	a5,a5
    115c:	02058593          	add	a1,a1,32
    1160:	01d60c63          	beq	a2,t4,1178 <main+0xec>
    1164:	02078813          	add	a6,a5,32
int main(void){
    1168:	00058893          	mv	a7,a1
    116c:	00078713          	mv	a4,a5
  for(int c=0;c<Cin;++c) for(int y=0;y<H_IMG;++y) for(int x=0;x<W_IMG;++x) IN[c][y][x]=patt_in(c,y,x);
    1170:	0ff87813          	zext.b	a6,a6
    1174:	fc1ff06f          	j	1134 <main+0xa8>
    1178:	00168693          	add	a3,a3,1
    117c:	40050513          	add	a0,a0,1024
    1180:	f9e69ce3          	bne	a3,t5,1118 <main+0x8c>
    1184:	800689b7          	lui	s3,0x80068
    1188:	00000513          	li	a0,0
    118c:	00200713          	li	a4,2
    1190:	c3098313          	add	t1,s3,-976 # 80067c30 <W1.20>
  for(int oc=0;oc<Cmid;++oc) for(int c=0;c<Cin;++c) for(int ky=0;ky<K1h;++ky) for(int kx=0;kx<K1w;++kx) W1[oc][c][ky][kx]=patt_w1(oc,c,ky,kx);
    1194:	00300e13          	li	t3,3
    1198:	00400e93          	li	t4,4
    119c:	12000f13          	li	t5,288
    11a0:	00650833          	add	a6,a0,t1
    11a4:	00000593          	li	a1,0
    11a8:	0500006f          	j	11f8 <main+0x16c>
static inline int8_t patt_w1 (int oc,int c,int ky,int kx){ return (int8_t)(((oc+2)*(ky+1)+(kx-2)+c) & 0x0F)-8; }
    11ac:	ffe78613          	add	a2,a5,-2
    11b0:	00f67613          	and	a2,a2,15
    11b4:	ff860613          	add	a2,a2,-8
  for(int oc=0;oc<Cmid;++oc) for(int c=0;c<Cin;++c) for(int ky=0;ky<K1h;++ky) for(int kx=0;kx<K1w;++kx) W1[oc][c][ky][kx]=patt_w1(oc,c,ky,kx);
    11b8:	00c68023          	sb	a2,0(a3)
static inline int8_t patt_w1 (int oc,int c,int ky,int kx){ return (int8_t)(((oc+2)*(ky+1)+(kx-2)+c) & 0x0F)-8; }
    11bc:	fff78613          	add	a2,a5,-1
    11c0:	00f67613          	and	a2,a2,15
    11c4:	ff860613          	add	a2,a2,-8
  for(int oc=0;oc<Cmid;++oc) for(int c=0;c<Cin;++c) for(int ky=0;ky<K1h;++ky) for(int kx=0;kx<K1w;++kx) W1[oc][c][ky][kx]=patt_w1(oc,c,ky,kx);
    11c8:	00c680a3          	sb	a2,1(a3)
static inline int8_t patt_w1 (int oc,int c,int ky,int kx){ return (int8_t)(((oc+2)*(ky+1)+(kx-2)+c) & 0x0F)-8; }
    11cc:	00f7f613          	and	a2,a5,15
    11d0:	ff860613          	add	a2,a2,-8
  for(int oc=0;oc<Cmid;++oc) for(int c=0;c<Cin;++c) for(int ky=0;ky<K1h;++ky) for(int kx=0;kx<K1w;++kx) W1[oc][c][ky][kx]=patt_w1(oc,c,ky,kx);
    11d4:	00c68123          	sb	a2,2(a3)
    11d8:	00f707b3          	add	a5,a4,a5
static inline int8_t patt_w1 (int oc,int c,int ky,int kx){ return (int8_t)(((oc+2)*(ky+1)+(kx-2)+c) & 0x0F)-8; }
    11dc:	00188893          	add	a7,a7,1
  for(int oc=0;oc<Cmid;++oc) for(int c=0;c<Cin;++c) for(int ky=0;ky<K1h;++ky) for(int kx=0;kx<K1w;++kx) W1[oc][c][ky][kx]=patt_w1(oc,c,ky,kx);
    11e0:	0ff7f793          	zext.b	a5,a5
    11e4:	00368693          	add	a3,a3,3
    11e8:	fdc892e3          	bne	a7,t3,11ac <main+0x120>
    11ec:	00158593          	add	a1,a1,1
    11f0:	00980813          	add	a6,a6,9
    11f4:	01d58c63          	beq	a1,t4,120c <main+0x180>
    11f8:	00b707b3          	add	a5,a4,a1
    11fc:	0ff7f793          	zext.b	a5,a5
  printf("CFU DP4A probe = %ld (expect 70)\n\n", (long)probe);
    1200:	00080693          	mv	a3,a6
  for(int oc=0;oc<Cmid;++oc) for(int c=0;c<Cin;++c) for(int ky=0;ky<K1h;++ky) for(int kx=0;kx<K1w;++kx) W1[oc][c][ky][kx]=patt_w1(oc,c,ky,kx);
    1204:	00000893          	li	a7,0
    1208:	fa5ff06f          	j	11ac <main+0x120>
    120c:	00170713          	add	a4,a4,1
    1210:	02450513          	add	a0,a0,36
    1214:	0ff77713          	zext.b	a4,a4
    1218:	f9e514e3          	bne	a0,t5,11a0 <main+0x114>
    121c:	80067437          	lui	s0,0x80067
    1220:	00000513          	li	a0,0
    1224:	00300693          	li	a3,3
    1228:	7b040e13          	add	t3,s0,1968 # 800677b0 <W2.19>
  for(int oc=0;oc<Cout;++oc) for(int c=0;c<Cmid;++c) for(int ky=0;ky<K2h;++ky) for(int kx=0;kx<K2w;++kx) W2[oc][c][ky][kx]=patt_w2(oc,c,ky,kx);
    122c:	00300e93          	li	t4,3
    1230:	00800f13          	li	t5,8
    1234:	48000f93          	li	t6,1152
    1238:	00169793          	sll	a5,a3,0x1
    123c:	0ff7f793          	zext.b	a5,a5
    1240:	01c508b3          	add	a7,a0,t3
    1244:	00000813          	li	a6,0
    1248:	0580006f          	j	12a0 <main+0x214>
static inline int8_t patt_w2 (int oc,int c,int ky,int kx){ return (int8_t)(((oc+3)*(ky+2)+(kx-1)+2*c) & 0x0F)-8; }
    124c:	fff70593          	add	a1,a4,-1
    1250:	00f5f593          	and	a1,a1,15
    1254:	ff858593          	add	a1,a1,-8
  for(int oc=0;oc<Cout;++oc) for(int c=0;c<Cmid;++c) for(int ky=0;ky<K2h;++ky) for(int kx=0;kx<K2w;++kx) W2[oc][c][ky][kx]=patt_w2(oc,c,ky,kx);
    1258:	00b60023          	sb	a1,0(a2)
static inline int8_t patt_w2 (int oc,int c,int ky,int kx){ return (int8_t)(((oc+3)*(ky+2)+(kx-1)+2*c) & 0x0F)-8; }
    125c:	00f77593          	and	a1,a4,15
    1260:	ff858593          	add	a1,a1,-8
  for(int oc=0;oc<Cout;++oc) for(int c=0;c<Cmid;++c) for(int ky=0;ky<K2h;++ky) for(int kx=0;kx<K2w;++kx) W2[oc][c][ky][kx]=patt_w2(oc,c,ky,kx);
    1264:	00b600a3          	sb	a1,1(a2)
static inline int8_t patt_w2 (int oc,int c,int ky,int kx){ return (int8_t)(((oc+3)*(ky+2)+(kx-1)+2*c) & 0x0F)-8; }
    1268:	00170593          	add	a1,a4,1
    126c:	00f5f593          	and	a1,a1,15
    1270:	ff858593          	add	a1,a1,-8
  for(int oc=0;oc<Cout;++oc) for(int c=0;c<Cmid;++c) for(int ky=0;ky<K2h;++ky) for(int kx=0;kx<K2w;++kx) W2[oc][c][ky][kx]=patt_w2(oc,c,ky,kx);
    1274:	00b60123          	sb	a1,2(a2)
    1278:	00e68733          	add	a4,a3,a4
    127c:	00130313          	add	t1,t1,1
    1280:	0ff77713          	zext.b	a4,a4
    1284:	00360613          	add	a2,a2,3
    1288:	fdd312e3          	bne	t1,t4,124c <main+0x1c0>
    128c:	00278793          	add	a5,a5,2
    1290:	00180813          	add	a6,a6,1
    1294:	0ff7f793          	zext.b	a5,a5
    1298:	00988893          	add	a7,a7,9
    129c:	01e80a63          	beq	a6,t5,12b0 <main+0x224>
    12a0:	00088613          	mv	a2,a7
    12a4:	00078713          	mv	a4,a5
    12a8:	00000313          	li	t1,0
    12ac:	fa1ff06f          	j	124c <main+0x1c0>
    12b0:	00168693          	add	a3,a3,1
    12b4:	04850513          	add	a0,a0,72
    12b8:	0ff6f693          	zext.b	a3,a3
    12bc:	f7f51ee3          	bne	a0,t6,1238 <main+0x1ac>
    12c0:	8005d737          	lui	a4,0x8005d
    12c4:	7b070713          	add	a4,a4,1968 # 8005d7b0 <Wfc.18>
    12c8:	00500793          	li	a5,5
  for(int o=0;o<NCLS;++o) for(int i=0;i<FCDIM;++i) Wfc[o][i]=patt_fc(o,i);
    12cc:	00001537          	lui	a0,0x1
    12d0:	00f00813          	li	a6,15
    12d4:	00078613          	mv	a2,a5
    12d8:	00000693          	li	a3,0
static inline int8_t patt_fc (int o,int i){ return (int8_t)(((o+5)+(i*3)) & 0x0F)-8; }
    12dc:	00f67593          	and	a1,a2,15
  for(int o=0;o<NCLS;++o) for(int i=0;i<FCDIM;++i) Wfc[o][i]=patt_fc(o,i);
    12e0:	00d708b3          	add	a7,a4,a3
static inline int8_t patt_fc (int o,int i){ return (int8_t)(((o+5)+(i*3)) & 0x0F)-8; }
    12e4:	ff858593          	add	a1,a1,-8
  for(int o=0;o<NCLS;++o) for(int i=0;i<FCDIM;++i) Wfc[o][i]=patt_fc(o,i);
    12e8:	00360613          	add	a2,a2,3
    12ec:	00b88023          	sb	a1,0(a7)
    12f0:	00168693          	add	a3,a3,1
    12f4:	0ff67613          	zext.b	a2,a2
    12f8:	fea692e3          	bne	a3,a0,12dc <main+0x250>
    12fc:	00178793          	add	a5,a5,1
    1300:	0ff7f793          	zext.b	a5,a5
    1304:	00d70733          	add	a4,a4,a3
    1308:	fd0796e3          	bne	a5,a6,12d4 <main+0x248>

  uint64_t c0,i0,c1,i1; uint64_t cyc_sw=0, ins_sw=0, cyc_cfu=0, ins_cfu=0, cyc_cfs=0, ins_cfs=0;

  /* ===== SW pipeline ===== */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
    130c:	ed9fe0ef          	jal	1e4 <rdcycle>
  conv_sw_generic(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_sw[0][0][0]);
    1310:	80055b37          	lui	s6,0x80055
  c0=rdcycle(); i0=rdinstret();
    1314:	00050d13          	mv	s10,a0
    1318:	00058c93          	mv	s9,a1
    131c:	eddfe0ef          	jal	1f8 <rdinstret>
  conv_sw_generic(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_sw[0][0][0]);
    1320:	7b0b0713          	add	a4,s6,1968 # 800557b0 <C1_sw.17>
    1324:	c3098693          	add	a3,s3,-976
    1328:	d5048613          	add	a2,s1,-688
  c0=rdcycle(); i0=rdinstret();
    132c:	00050a13          	mv	s4,a0
    1330:	00058913          	mv	s2,a1
  conv_sw_generic(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_sw[0][0][0]);
    1334:	00400513          	li	a0,4
    1338:	00800593          	li	a1,8
    133c:	dc0ff0ef          	jal	8fc <conv_sw_generic.constprop.0>
  relu_sw(&C1_sw[0][0][0], Cmid*O1H*O1W);
    1340:	000025b7          	lui	a1,0x2
    1344:	7b0b0513          	add	a0,s6,1968
    1348:	f81fe0ef          	jal	2c8 <relu_sw>
  requantize_i32_to_s8(&C1_sw[0][0][0], Cmid*O1H*O1W, C1_sw_s8);
    134c:	80053bb7          	lui	s7,0x80053
    1350:	7b0b8613          	add	a2,s7,1968 # 800537b0 <C1_sw_s8.16>
    1354:	000025b7          	lui	a1,0x2
    1358:	7b0b0513          	add	a0,s6,1968
    135c:	ee5fe0ef          	jal	240 <requantize_i32_to_s8>
  conv_sw_generic(Cmid,O1H,O1W, Cout,K2h,K2w,STR2,PAD2, C1_sw_s8, &W2[0][0][0][0], &C2_sw[0][0][0]);
    1360:	80043ab7          	lui	s5,0x80043
    1364:	7b0a8713          	add	a4,s5,1968 # 800437b0 <C2_sw.15>
    1368:	7b040693          	add	a3,s0,1968
    136c:	7b0b8613          	add	a2,s7,1968
    1370:	01000593          	li	a1,16
    1374:	00800513          	li	a0,8
    1378:	d84ff0ef          	jal	8fc <conv_sw_generic.constprop.0>
  relu_sw(&C2_sw[0][0][0], Cout*O2H*O2W);
    137c:	000045b7          	lui	a1,0x4
    1380:	7b0a8513          	add	a0,s5,1968
    1384:	f45fe0ef          	jal	2c8 <relu_sw>
  maxpool2x2_sw(C2_sw, P_sw);
    1388:	8003fc37          	lui	s8,0x8003f
    138c:	7b0c0593          	add	a1,s8,1968 # 8003f7b0 <P_sw.14>
    1390:	7b0a8513          	add	a0,s5,1968
    1394:	f55fe0ef          	jal	2e8 <maxpool2x2_sw>
  requantize_i32_to_s8(&P_sw[0][0][0], FCDIM, P_sw_s8);
    1398:	8003edb7          	lui	s11,0x8003e
    139c:	7b0d8613          	add	a2,s11,1968 # 8003e7b0 <P_sw_s8.13>
    13a0:	000015b7          	lui	a1,0x1
    13a4:	7b0c0513          	add	a0,s8,1968
    13a8:	e99fe0ef          	jal	240 <requantize_i32_to_s8>
  for(int o=0;o<NCLS;++o){
    13ac:	8003ebb7          	lui	s7,0x8003e
    13b0:	788b8693          	add	a3,s7,1928 # 8003e788 <Y_sw.12>
  requantize_i32_to_s8(&P_sw[0][0][0], FCDIM, P_sw_s8);
    13b4:	00000793          	li	a5,0
    for(int i=0;i<FCDIM;++i) s += (int32_t)row[i] * (int32_t)x[i];
    13b8:	7b0d8713          	add	a4,s11,1968
    13bc:	8005d5b7          	lui	a1,0x8005d
    13c0:	7b058593          	add	a1,a1,1968 # 8005d7b0 <Wfc.18>
    int32_t s=0;
    13c4:	00000613          	li	a2,0
    for(int i=0;i<FCDIM;++i) s += (int32_t)row[i] * (int32_t)x[i];
    13c8:	00000d93          	li	s11,0
    13cc:	00f58333          	add	t1,a1,a5
    13d0:	01b30533          	add	a0,t1,s11
    13d4:	00ed85b3          	add	a1,s11,a4
    13d8:	00058583          	lb	a1,0(a1)
    13dc:	00050503          	lb	a0,0(a0) # 1000 <dump_first_mismatch.isra.0+0xc0>
    13e0:	00d12c23          	sw	a3,24(sp)
    13e4:	00f12a23          	sw	a5,20(sp)
    13e8:	00c12823          	sw	a2,16(sp)
    13ec:	00612623          	sw	t1,12(sp)
    13f0:	1c10e0ef          	jal	fdb0 <__mulsi3>
    13f4:	01012603          	lw	a2,16(sp)
    13f8:	8003e7b7          	lui	a5,0x8003e
    13fc:	001d8d93          	add	s11,s11,1
    1400:	000018b7          	lui	a7,0x1
    1404:	7b078713          	add	a4,a5,1968 # 8003e7b0 <P_sw_s8.13>
    1408:	00c12303          	lw	t1,12(sp)
    140c:	01412783          	lw	a5,20(sp)
    1410:	01812683          	lw	a3,24(sp)
    1414:	00a60633          	add	a2,a2,a0
    1418:	0000a837          	lui	a6,0xa
    141c:	fb1d9ae3          	bne	s11,a7,13d0 <main+0x344>
    y[o]=s;
    1420:	00c6a023          	sw	a2,0(a3)
  for(int o=0;o<NCLS;++o){
    1424:	01b787b3          	add	a5,a5,s11
    1428:	00468693          	add	a3,a3,4
    142c:	f90798e3          	bne	a5,a6,13bc <main+0x330>
    1430:	02f12023          	sw	a5,32(sp)
  fc_sw(P_sw_s8, &Wfc[0][0], Y_sw);
  i1=rdinstret(); c1=rdcycle();
    1434:	dc5fe0ef          	jal	1f8 <rdinstret>
    1438:	00050d93          	mv	s11,a0
    143c:	00b12c23          	sw	a1,24(sp)
    1440:	da5fe0ef          	jal	1e4 <rdcycle>
  __asm__ volatile("" ::: "memory");
  cyc_sw=c1-c0; ins_sw=i1-i0; g_sink ^= (uint32_t)cyc_sw;
    1444:	41a507b3          	sub	a5,a0,s10
    1448:	01812703          	lw	a4,24(sp)
    144c:	00f53533          	sltu	a0,a0,a5
    1450:	419585b3          	sub	a1,a1,s9
    1454:	00f12623          	sw	a5,12(sp)
    1458:	40a587b3          	sub	a5,a1,a0
    145c:	00f12a23          	sw	a5,20(sp)
    1460:	414d87b3          	sub	a5,s11,s4
    1464:	41270733          	sub	a4,a4,s2
    1468:	00fdbdb3          	sltu	s11,s11,a5
    146c:	80000937          	lui	s2,0x80000
    1470:	00f12823          	sw	a5,16(sp)
    1474:	41b707b3          	sub	a5,a4,s11
    1478:	00f12c23          	sw	a5,24(sp)
    147c:	71492703          	lw	a4,1812(s2) # 80000714 <g_sink>
    1480:	00c12783          	lw	a5,12(sp)
    1484:	00f74733          	xor	a4,a4,a5
    1488:	70e92a23          	sw	a4,1812(s2)

  /* ===== CFU pipeline ===== */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
    148c:	d59fe0ef          	jal	1e4 <rdcycle>
  conv_cfu(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_cfu[0][0][0]);
    1490:	80036db7          	lui	s11,0x80036
  c0=rdcycle(); i0=rdinstret();
    1494:	00a12e23          	sw	a0,28(sp)
    1498:	00058d13          	mv	s10,a1
    149c:	d5dfe0ef          	jal	1f8 <rdinstret>
  conv_cfu(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_cfu[0][0][0]);
    14a0:	788d8713          	add	a4,s11,1928 # 80036788 <C1_cfu.11>
    14a4:	c3098693          	add	a3,s3,-976
    14a8:	d5048613          	add	a2,s1,-688
  c0=rdcycle(); i0=rdinstret();
    14ac:	02b12223          	sw	a1,36(sp)
    14b0:	00050c93          	mv	s9,a0
  conv_cfu(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_cfu[0][0][0]);
    14b4:	00800593          	li	a1,8
    14b8:	00400513          	li	a0,4
    14bc:	f79fe0ef          	jal	434 <conv_cfu.constprop.0>
  relu_sw(&C1_cfu[0][0][0], Cmid*O1H*O1W);
    14c0:	000025b7          	lui	a1,0x2
    14c4:	788d8513          	add	a0,s11,1928
    14c8:	e01fe0ef          	jal	2c8 <relu_sw>
  requantize_i32_to_s8(&C1_cfu[0][0][0], Cmid*O1H*O1W, C1_cfu_s8);
    14cc:	800348b7          	lui	a7,0x80034
    14d0:	78888613          	add	a2,a7,1928 # 80034788 <C1_cfu_s8.10>
    14d4:	000025b7          	lui	a1,0x2
    14d8:	788d8513          	add	a0,s11,1928
    14dc:	d65fe0ef          	jal	240 <requantize_i32_to_s8>
  conv_cfu(Cmid,O1H,O1W, Cout,K2h,K2w,STR2,PAD2, C1_cfu_s8, &W2[0][0][0][0], &C2_cfu[0][0][0]);
    14e0:	800348b7          	lui	a7,0x80034
    14e4:	80024a37          	lui	s4,0x80024
    14e8:	7b040693          	add	a3,s0,1968
    14ec:	78888613          	add	a2,a7,1928 # 80034788 <C1_cfu_s8.10>
    14f0:	788a0713          	add	a4,s4,1928 # 80024788 <C2_cfu.9>
    14f4:	01000593          	li	a1,16
    14f8:	00800513          	li	a0,8
    14fc:	f39fe0ef          	jal	434 <conv_cfu.constprop.0>
  relu_sw(&C2_cfu[0][0][0], Cout*O2H*O2W);
    1500:	000045b7          	lui	a1,0x4
    1504:	788a0513          	add	a0,s4,1928
    1508:	dc1fe0ef          	jal	2c8 <relu_sw>
  maxpool2x2_sw(C2_cfu, P_cfu);
    150c:	80020737          	lui	a4,0x80020
    1510:	78870593          	add	a1,a4,1928 # 80020788 <P_cfu.8>
    1514:	788a0513          	add	a0,s4,1928
    1518:	dd1fe0ef          	jal	2e8 <maxpool2x2_sw>
  requantize_i32_to_s8(&P_cfu[0][0][0], FCDIM, P_cfu_s8);
    151c:	8001f837          	lui	a6,0x8001f
    1520:	80020737          	lui	a4,0x80020
    1524:	78880613          	add	a2,a6,1928 # 8001f788 <P_cfu_s8.7>
    1528:	78870513          	add	a0,a4,1928 # 80020788 <P_cfu.8>
    152c:	000015b7          	lui	a1,0x1
    1530:	d11fe0ef          	jal	240 <requantize_i32_to_s8>
  for(int o=0;o<NCLS;++o){
    1534:	02012783          	lw	a5,32(sp)
    1538:	8005d737          	lui	a4,0x8005d
    153c:	8001f537          	lui	a0,0x8001f
    1540:	7b070693          	add	a3,a4,1968 # 8005d7b0 <Wfc.18>
    1544:	76050513          	add	a0,a0,1888 # 8001f760 <Y_cfu.6>
    1548:	00f686b3          	add	a3,a3,a5
  requantize_i32_to_s8(&P_cfu[0][0][0], FCDIM, P_cfu_s8);
    154c:	7b070613          	add	a2,a4,1968
    1550:	00001337          	lui	t1,0x1
    1554:	8001f837          	lui	a6,0x8001f
    1558:	00060713          	mv	a4,a2
    155c:	78880593          	add	a1,a6,1928 # 8001f788 <P_cfu_s8.7>
    int32_t s=0; int i=0;
    1560:	00000893          	li	a7,0
    1564:	00660633          	add	a2,a2,t1
         (((uint32_t)(uint8_t)x1) << 8)  |
    1568:	0015c783          	lbu	a5,1(a1) # 1001 <dump_first_mismatch.isra.0+0xc1>
         (((uint32_t)(uint8_t)x2) << 16) |
    156c:	0025ce03          	lbu	t3,2(a1)
    1570:	00274e83          	lbu	t4,2(a4)
         (((uint32_t)(uint8_t)x1) << 8)  |
    1574:	00879793          	sll	a5,a5,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
    1578:	010e1e13          	sll	t3,t3,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    157c:	01c7e7b3          	or	a5,a5,t3
  return  ((uint32_t)(uint8_t)x0)        |
    1580:	0005ce03          	lbu	t3,0(a1)
         (((uint32_t)(uint8_t)x2) << 16) |
    1584:	010e9e93          	sll	t4,t4,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
    1588:	01c7e7b3          	or	a5,a5,t3
         (((uint32_t)(uint8_t)x3) << 24);
    158c:	0035ce03          	lbu	t3,3(a1)
    1590:	018e1e13          	sll	t3,t3,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    1594:	01c7ee33          	or	t3,a5,t3
         (((uint32_t)(uint8_t)x1) << 8)  |
    1598:	00174783          	lbu	a5,1(a4)
    159c:	00879793          	sll	a5,a5,0x8
    15a0:	01d7e7b3          	or	a5,a5,t4
  return  ((uint32_t)(uint8_t)x0)        |
    15a4:	00074e83          	lbu	t4,0(a4)
         (((uint32_t)(uint8_t)x1) << 8)  |
    15a8:	01d7e7b3          	or	a5,a5,t4
         (((uint32_t)(uint8_t)x3) << 24);
    15ac:	00374e83          	lbu	t4,3(a4)
    15b0:	018e9e93          	sll	t4,t4,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
    15b4:	01d7e7b3          	or	a5,a5,t4
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
    15b8:	02fe078b          	.insn	4, 0x02fe078b
    for(; i+3<FCDIM; i+=4){
    15bc:	00470713          	add	a4,a4,4
      s += cfu_dp4a((int32_t)ap,(int32_t)bp);
    15c0:	00f888b3          	add	a7,a7,a5
    for(; i+3<FCDIM; i+=4){
    15c4:	00458593          	add	a1,a1,4
    15c8:	fae610e3          	bne	a2,a4,1568 <main+0x4dc>
    y[o]=s;
    15cc:	01152023          	sw	a7,0(a0)
  for(int o=0;o<NCLS;++o){
    15d0:	00450513          	add	a0,a0,4
    15d4:	f8d612e3          	bne	a2,a3,1558 <main+0x4cc>
  fc_cfu(P_cfu_s8, &Wfc[0][0], Y_cfu);
  i1=rdinstret(); c1=rdcycle();
    15d8:	c21fe0ef          	jal	1f8 <rdinstret>
    15dc:	02a12023          	sw	a0,32(sp)
    15e0:	02b12623          	sw	a1,44(sp)
    15e4:	c01fe0ef          	jal	1e4 <rdcycle>
  __asm__ volatile("" ::: "memory");
  cyc_cfu=c1-c0; ins_cfu=i1-i0; g_sink ^= (uint32_t)cyc_cfu;
    15e8:	01c12783          	lw	a5,28(sp)
    15ec:	41a585b3          	sub	a1,a1,s10
    15f0:	02412683          	lw	a3,36(sp)
    15f4:	40f507b3          	sub	a5,a0,a5
    15f8:	00f53533          	sltu	a0,a0,a5
    15fc:	00f12e23          	sw	a5,28(sp)
    1600:	40a587b3          	sub	a5,a1,a0
    1604:	02f12423          	sw	a5,40(sp)
    1608:	02012783          	lw	a5,32(sp)
    160c:	41978733          	sub	a4,a5,s9
    1610:	02e12023          	sw	a4,32(sp)
    1614:	00e7b7b3          	sltu	a5,a5,a4
    1618:	02c12703          	lw	a4,44(sp)
    161c:	40d70733          	sub	a4,a4,a3
    1620:	40f707b3          	sub	a5,a4,a5
    1624:	02f12623          	sw	a5,44(sp)
    1628:	01c12703          	lw	a4,28(sp)
    162c:	71492783          	lw	a5,1812(s2)
    1630:	00e7c7b3          	xor	a5,a5,a4
    1634:	70f92a23          	sw	a5,1812(s2)

  /* ===== CFS pipeline ===== */
  __asm__ volatile("" ::: "memory");
  c0=rdcycle(); i0=rdinstret();
    1638:	badfe0ef          	jal	1e4 <rdcycle>
  conv_cfs(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_cfs[0][0][0]);
    163c:	80017d37          	lui	s10,0x80017
  c0=rdcycle(); i0=rdinstret();
    1640:	02a12223          	sw	a0,36(sp)
    1644:	02b12823          	sw	a1,48(sp)
    1648:	bb1fe0ef          	jal	1f8 <rdinstret>
  conv_cfs(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_cfs[0][0][0]);
    164c:	c3098693          	add	a3,s3,-976
    1650:	760d0713          	add	a4,s10,1888 # 80017760 <C1_cfs.5>
    1654:	d5048613          	add	a2,s1,-688
  c0=rdcycle(); i0=rdinstret();
    1658:	02a12a23          	sw	a0,52(sp)
    165c:	02b12c23          	sw	a1,56(sp)
  conv_cfs(Cin,H_IMG,W_IMG, Cmid,K1h,K1w,STR1,PAD1, &IN[0][0][0], &W1[0][0][0][0], &C1_cfs[0][0][0]);
    1660:	00400513          	li	a0,4
    1664:	00800593          	li	a1,8
    1668:	e00ff0ef          	jal	c68 <conv_cfs.constprop.0>
  relu_sw(&C1_cfs[0][0][0], Cmid*O1H*O1W);
    166c:	000025b7          	lui	a1,0x2
    1670:	760d0513          	add	a0,s10,1888
    1674:	c55fe0ef          	jal	2c8 <relu_sw>
  requantize_i32_to_s8(&C1_cfs[0][0][0], Cmid*O1H*O1W, C1_cfs_s8);
    1678:	800159b7          	lui	s3,0x80015
    167c:	76098613          	add	a2,s3,1888 # 80015760 <C1_cfs_s8.4>
    1680:	000025b7          	lui	a1,0x2
    1684:	760d0513          	add	a0,s10,1888
    1688:	bb9fe0ef          	jal	240 <requantize_i32_to_s8>
  conv_cfs(Cmid,O1H,O1W, Cout,K2h,K2w,STR2,PAD2, C1_cfs_s8, &W2[0][0][0][0], &C2_cfs[0][0][0]);
    168c:	800054b7          	lui	s1,0x80005
    1690:	76048713          	add	a4,s1,1888 # 80005760 <C2_cfs.3>
    1694:	7b040693          	add	a3,s0,1968
    1698:	76098613          	add	a2,s3,1888
    169c:	01000593          	li	a1,16
    16a0:	00800513          	li	a0,8
    16a4:	dc4ff0ef          	jal	c68 <conv_cfs.constprop.0>
  relu_sw(&C2_cfs[0][0][0], Cout*O2H*O2W);
    16a8:	76048513          	add	a0,s1,1888
    16ac:	000045b7          	lui	a1,0x4
    16b0:	c19fe0ef          	jal	2c8 <relu_sw>
  maxpool2x2_sw(C2_cfs, P_cfs);
    16b4:	80001437          	lui	s0,0x80001
    16b8:	76040593          	add	a1,s0,1888 # 80001760 <P_cfs.2>
    16bc:	76048513          	add	a0,s1,1888
    16c0:	c29fe0ef          	jal	2e8 <maxpool2x2_sw>
  requantize_i32_to_s8(&P_cfs[0][0][0], FCDIM, P_cfs_s8);
    16c4:	800004b7          	lui	s1,0x80000
    16c8:	76040513          	add	a0,s0,1888
    16cc:	76048613          	add	a2,s1,1888 # 80000760 <P_cfs_s8.1>
    16d0:	000015b7          	lui	a1,0x1
    16d4:	b6dfe0ef          	jal	240 <requantize_i32_to_s8>
  for(int o=0;o<NCLS;++o) y[o]=0;
    16d8:	800007b7          	lui	a5,0x80000
    16dc:	02800613          	li	a2,40
    16e0:	00000593          	li	a1,0
    16e4:	73878513          	add	a0,a5,1848 # 80000738 <Y_cfs.0>
    16e8:	00078413          	mv	s0,a5
    16ec:	119000ef          	jal	2004 <memset>
    16f0:	73840993          	add	s3,s0,1848
    16f4:	80069fb7          	lui	t6,0x80069
  for(int o0=0;o0<NCLS;o0+=4){
    16f8:	00000413          	li	s0,0
    16fc:	80069cb7          	lui	s9,0x80069
        int8_t a = x[k0+k];
    1700:	76048393          	add	t2,s1,1888
    for(int k0=0;k0<FCDIM;k0+=FC_CHUNKK){
    1704:	00c41293          	sll	t0,s0,0xc
    1708:	00000493          	li	s1,0
          fc_Aflat[r*kk + k] = (o<NCLS)? Wm[o*FCDIM + (k0+k)] : 0;
    170c:	00900f13          	li	t5,9
        for(int k=0;k<kk;++k){
    1710:	10000a13          	li	s4,256
    1714:	0e80006f          	j	17fc <main+0x770>
    1718:	00000793          	li	a5,0
          fc_Aflat[r*kk + k] = (o<NCLS)? Wm[o*FCDIM + (k0+k)] : 0;
    171c:	00e40e33          	add	t3,s0,a4
    1720:	00d88eb3          	add	t4,a7,a3
    1724:	00000593          	li	a1,0
    1728:	01cf6663          	bltu	t5,t3,1734 <main+0x6a8>
    172c:	00fe85b3          	add	a1,t4,a5
    1730:	00058583          	lb	a1,0(a1) # 1000 <dump_first_mismatch.isra.0+0xc0>
    1734:	00f60333          	add	t1,a2,a5
    1738:	00b30023          	sb	a1,0(t1) # 1000 <dump_first_mismatch.isra.0+0xc0>
        for(int k=0;k<kk;++k){
    173c:	00178793          	add	a5,a5,1
    1740:	ff4792e3          	bne	a5,s4,1724 <main+0x698>
      for(int r=0;r<4;++r){
    1744:	00170713          	add	a4,a4,1
    1748:	10060613          	add	a2,a2,256
    174c:	010686b3          	add	a3,a3,a6
    1750:	fca714e3          	bne	a4,a0,1718 <main+0x68c>
    1754:	d50c8793          	add	a5,s9,-688 # 80068d50 <fc_Bflat>
      for(int k=0;k<kk;++k){
    1758:	00000713          	li	a4,0
        int8_t a = x[k0+k];
    175c:	00748633          	add	a2,s1,t2
    1760:	00e606b3          	add	a3,a2,a4
    1764:	00068683          	lb	a3,0(a3)
      for(int k=0;k<kk;++k){
    1768:	00170713          	add	a4,a4,1
    176c:	00478793          	add	a5,a5,4
        fc_Bflat[k*4+0]=a; fc_Bflat[k*4+1]=a; fc_Bflat[k*4+2]=a; fc_Bflat[k*4+3]=a;
    1770:	fed78e23          	sb	a3,-4(a5)
    1774:	fed78ea3          	sb	a3,-3(a5)
    1778:	fed78f23          	sb	a3,-2(a5)
    177c:	fed78fa3          	sb	a3,-1(a5)
      for(int k=0;k<kk;++k){
    1780:	ff4710e3          	bne	a4,s4,1760 <main+0x6d4>
  cfs_feed_strict_step(Aflat,Bflat,Klen,lda,ldb);
    1784:	150f8513          	add	a0,t6,336 # 80069150 <fc_Aflat>
    1788:	10000693          	li	a3,256
    178c:	10000613          	li	a2,256
    1790:	d50c8593          	add	a1,s9,-688
    1794:	02512e23          	sw	t0,60(sp)
    1798:	b44ff0ef          	jal	adc <cfs_feed_strict_step.constprop.0>
      cfs_read_C4(C4);
    179c:	04010513          	add	a0,sp,64
    17a0:	addfe0ef          	jal	27c <cfs_read_C4>
      for(int r=0;r<4;++r){
    17a4:	03c12283          	lw	t0,60(sp)
    17a8:	80000637          	lui	a2,0x80000
    17ac:	04010693          	add	a3,sp,64
      cfs_read_C4(C4);
    17b0:	00098713          	mv	a4,s3
      for(int r=0;r<4;++r){
    17b4:	00000793          	li	a5,0
    17b8:	00400593          	li	a1,4
    17bc:	76060393          	add	t2,a2,1888 # 80000760 <P_cfs_s8.1>
    17c0:	00900f13          	li	t5,9
    17c4:	80069fb7          	lui	t6,0x80069
        int o=o0+r; if(o<NCLS) y[o] += C4[r][0]; /* take col0 (all cols identical) */
    17c8:	00878633          	add	a2,a5,s0
    17cc:	00cf6a63          	bltu	t5,a2,17e0 <main+0x754>
    17d0:	00072603          	lw	a2,0(a4)
    17d4:	0006a503          	lw	a0,0(a3)
    17d8:	00a60633          	add	a2,a2,a0
    17dc:	00c72023          	sw	a2,0(a4)
      for(int r=0;r<4;++r){
    17e0:	00178793          	add	a5,a5,1
    17e4:	00470713          	add	a4,a4,4
    17e8:	01068693          	add	a3,a3,16
    17ec:	fcb79ee3          	bne	a5,a1,17c8 <main+0x73c>
    for(int k0=0;k0<FCDIM;k0+=FC_CHUNKK){
    17f0:	10048493          	add	s1,s1,256
    17f4:	000017b7          	lui	a5,0x1
    17f8:	02f48463          	beq	s1,a5,1820 <main+0x794>
          fc_Aflat[r*kk + k] = (o<NCLS)? Wm[o*FCDIM + (k0+k)] : 0;
    17fc:	8005d7b7          	lui	a5,0x8005d
    1800:	7b078793          	add	a5,a5,1968 # 8005d7b0 <Wfc.18>
    1804:	150f8613          	add	a2,t6,336 # 80069150 <fc_Aflat>
    int32_t s=0; int i=0;
    1808:	00028693          	mv	a3,t0
      for(int r=0;r<4;++r){
    180c:	00000713          	li	a4,0
          fc_Aflat[r*kk + k] = (o<NCLS)? Wm[o*FCDIM + (k0+k)] : 0;
    1810:	00f488b3          	add	a7,s1,a5
      for(int r=0;r<4;++r){
    1814:	00001837          	lui	a6,0x1
    1818:	00400513          	li	a0,4
    181c:	efdff06f          	j	1718 <main+0x68c>
  for(int o0=0;o0<NCLS;o0+=4){
    1820:	00440413          	add	s0,s0,4
    1824:	00c00793          	li	a5,12
    1828:	01098993          	add	s3,s3,16
    182c:	ecf41ce3          	bne	s0,a5,1704 <main+0x678>
  fc_cfs(P_cfs_s8, &Wfc[0][0], Y_cfs);
  i1=rdinstret(); c1=rdcycle();
    1830:	9c9fe0ef          	jal	1f8 <rdinstret>
    1834:	00050413          	mv	s0,a0
    1838:	00058993          	mv	s3,a1
    183c:	9a9fe0ef          	jal	1e4 <rdcycle>
  __asm__ volatile("" ::: "memory");
  cyc_cfs=c1-c0; ins_cfs=i1-i0; g_sink ^= (uint32_t)cyc_cfs;
    1840:	02412783          	lw	a5,36(sp)

  /* ===== Verify & report ===== */
  int ok_cfu = 1, ok_cfs = 1;
  if (!equal_i32(&C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W)) { ok_cfu = 0; dump_first_mismatch("CFU:C1", &C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W, O1W); }
    1844:	00002637          	lui	a2,0x2
  cyc_cfs=c1-c0; ins_cfs=i1-i0; g_sink ^= (uint32_t)cyc_cfs;
    1848:	40f50cb3          	sub	s9,a0,a5
    184c:	03012783          	lw	a5,48(sp)
    1850:	01953533          	sltu	a0,a0,s9
    1854:	40f58a33          	sub	s4,a1,a5
    1858:	03412783          	lw	a5,52(sp)
    185c:	40aa0a33          	sub	s4,s4,a0
  if (!equal_i32(&C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W)) { ok_cfu = 0; dump_first_mismatch("CFU:C1", &C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W, O1W); }
    1860:	788d8593          	add	a1,s11,1928
  cyc_cfs=c1-c0; ins_cfs=i1-i0; g_sink ^= (uint32_t)cyc_cfs;
    1864:	40f407b3          	sub	a5,s0,a5
    1868:	00f43433          	sltu	s0,s0,a5
    186c:	02f12223          	sw	a5,36(sp)
    1870:	03812783          	lw	a5,56(sp)
  if (!equal_i32(&C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W)) { ok_cfu = 0; dump_first_mismatch("CFU:C1", &C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W, O1W); }
    1874:	7b0b0513          	add	a0,s6,1968
  cyc_cfs=c1-c0; ins_cfs=i1-i0; g_sink ^= (uint32_t)cyc_cfs;
    1878:	40f989b3          	sub	s3,s3,a5
    187c:	71492783          	lw	a5,1812(s2)
    1880:	408989b3          	sub	s3,s3,s0
    1884:	0197c7b3          	xor	a5,a5,s9
    1888:	70f92a23          	sw	a5,1812(s2)
  if (!equal_i32(&C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W)) { ok_cfu = 0; dump_first_mismatch("CFU:C1", &C1_sw[0][0][0], &C1_cfu[0][0][0], Cmid*O1H*O1W, O1W); }
    188c:	981fe0ef          	jal	20c <equal_i32>
    1890:	00050413          	mv	s0,a0
    1894:	30051463          	bnez	a0,1b9c <main+0xb10>
    1898:	00010537          	lui	a0,0x10
    189c:	000026b7          	lui	a3,0x2
    18a0:	788d8613          	add	a2,s11,1928
    18a4:	7b0b0593          	add	a1,s6,1968
    18a8:	0c050513          	add	a0,a0,192 # 100c0 <__fini_array_end+0x118>
    18ac:	e94ff0ef          	jal	f40 <dump_first_mismatch.isra.0>
  if (!equal_i32(&C2_sw[0][0][0], &C2_cfu[0][0][0], Cout*O2H*O2W)) { ok_cfu = 0; dump_first_mismatch("CFU:C2", &C2_sw[0][0][0], &C2_cfu[0][0][0], Cout*O2H*O2W, O2W); }
    18b0:	800244b7          	lui	s1,0x80024
    18b4:	00004637          	lui	a2,0x4
    18b8:	78848593          	add	a1,s1,1928 # 80024788 <C2_cfu.9>
    18bc:	7b0a8513          	add	a0,s5,1968
    18c0:	94dfe0ef          	jal	20c <equal_i32>
    18c4:	02051063          	bnez	a0,18e4 <main+0x858>
    18c8:	00010537          	lui	a0,0x10
    18cc:	000046b7          	lui	a3,0x4
    18d0:	78848613          	add	a2,s1,1928
    18d4:	7b0a8593          	add	a1,s5,1968
    18d8:	0c850513          	add	a0,a0,200 # 100c8 <__fini_array_end+0x120>
    18dc:	e64ff0ef          	jal	f40 <dump_first_mismatch.isra.0>
    18e0:	00000413          	li	s0,0
  if (!equal_i32(&P_sw [0][0][0], &P_cfu [0][0][0], Cout*PH*PW))   { ok_cfu = 0; dump_first_mismatch("CFU:POOL", &P_sw[0][0][0], &P_cfu[0][0][0], Cout*PH*PW, PW); }
    18e4:	800204b7          	lui	s1,0x80020
    18e8:	00001637          	lui	a2,0x1
    18ec:	78848593          	add	a1,s1,1928 # 80020788 <P_cfu.8>
    18f0:	7b0c0513          	add	a0,s8,1968
    18f4:	919fe0ef          	jal	20c <equal_i32>
    18f8:	02051063          	bnez	a0,1918 <main+0x88c>
    18fc:	00010537          	lui	a0,0x10
    1900:	000016b7          	lui	a3,0x1
    1904:	78848613          	add	a2,s1,1928
    1908:	7b0c0593          	add	a1,s8,1968
    190c:	0d050513          	add	a0,a0,208 # 100d0 <__fini_array_end+0x128>
    1910:	e30ff0ef          	jal	f40 <dump_first_mismatch.isra.0>
    1914:	00000413          	li	s0,0
  if (!equal_i32(&Y_sw [0],       &Y_cfu [0],       NCLS))         { ok_cfu = 0; dump_first_mismatch("CFU:FC", Y_sw, Y_cfu, NCLS, 0); }
    1918:	8001fdb7          	lui	s11,0x8001f
    191c:	00a00613          	li	a2,10
    1920:	760d8593          	add	a1,s11,1888 # 8001f760 <Y_cfu.6>
    1924:	788b8513          	add	a0,s7,1928
    1928:	8e5fe0ef          	jal	20c <equal_i32>
    192c:	02051063          	bnez	a0,194c <main+0x8c0>
    1930:	00010537          	lui	a0,0x10
    1934:	00a00693          	li	a3,10
    1938:	760d8613          	add	a2,s11,1888
    193c:	788b8593          	add	a1,s7,1928
    1940:	0dc50513          	add	a0,a0,220 # 100dc <__fini_array_end+0x134>
    1944:	dfcff0ef          	jal	f40 <dump_first_mismatch.isra.0>
    1948:	00000413          	li	s0,0

  if (!equal_i32(&C1_sw[0][0][0], &C1_cfs[0][0][0], Cmid*O1H*O1W)) { ok_cfs = 0; dump_first_mismatch("CFS:C1", &C1_sw[0][0][0], &C1_cfs[0][0][0], Cmid*O1H*O1W, O1W); }
    194c:	00002637          	lui	a2,0x2
    1950:	760d0593          	add	a1,s10,1888
    1954:	7b0b0513          	add	a0,s6,1968
    1958:	8b5fe0ef          	jal	20c <equal_i32>
    195c:	00050493          	mv	s1,a0
    1960:	24051263          	bnez	a0,1ba4 <main+0xb18>
    1964:	00010537          	lui	a0,0x10
    1968:	000026b7          	lui	a3,0x2
    196c:	760d0613          	add	a2,s10,1888
    1970:	7b0b0593          	add	a1,s6,1968
    1974:	0e450513          	add	a0,a0,228 # 100e4 <__fini_array_end+0x13c>
    1978:	dc8ff0ef          	jal	f40 <dump_first_mismatch.isra.0>
  if (!equal_i32(&C2_sw[0][0][0], &C2_cfs[0][0][0], Cout*O2H*O2W)) { ok_cfs = 0; dump_first_mismatch("CFS:C2", &C2_sw[0][0][0], &C2_cfs[0][0][0], Cout*O2H*O2W, O2W); }
    197c:	80005b37          	lui	s6,0x80005
    1980:	00004637          	lui	a2,0x4
    1984:	760b0593          	add	a1,s6,1888 # 80005760 <C2_cfs.3>
    1988:	7b0a8513          	add	a0,s5,1968
    198c:	881fe0ef          	jal	20c <equal_i32>
    1990:	02051063          	bnez	a0,19b0 <main+0x924>
    1994:	00010537          	lui	a0,0x10
    1998:	000046b7          	lui	a3,0x4
    199c:	760b0613          	add	a2,s6,1888
    19a0:	7b0a8593          	add	a1,s5,1968
    19a4:	0ec50513          	add	a0,a0,236 # 100ec <__fini_array_end+0x144>
    19a8:	d98ff0ef          	jal	f40 <dump_first_mismatch.isra.0>
    19ac:	00000493          	li	s1,0
  if (!equal_i32(&P_sw [0][0][0], &P_cfs [0][0][0], Cout*PH*PW))   { ok_cfs = 0; dump_first_mismatch("CFS:POOL", &P_sw[0][0][0], &P_cfs[0][0][0], Cout*PH*PW, PW); }
    19b0:	80001ab7          	lui	s5,0x80001
    19b4:	00001637          	lui	a2,0x1
    19b8:	760a8593          	add	a1,s5,1888 # 80001760 <P_cfs.2>
    19bc:	7b0c0513          	add	a0,s8,1968
    19c0:	84dfe0ef          	jal	20c <equal_i32>
    19c4:	02051063          	bnez	a0,19e4 <main+0x958>
    19c8:	00010537          	lui	a0,0x10
    19cc:	000016b7          	lui	a3,0x1
    19d0:	760a8613          	add	a2,s5,1888
    19d4:	7b0c0593          	add	a1,s8,1968
    19d8:	0f450513          	add	a0,a0,244 # 100f4 <__fini_array_end+0x14c>
    19dc:	d64ff0ef          	jal	f40 <dump_first_mismatch.isra.0>
    19e0:	00000493          	li	s1,0
  if (!equal_i32(&Y_sw [0],       &Y_cfs [0],       NCLS))         { ok_cfs = 0; dump_first_mismatch("CFS:FC", Y_sw, Y_cfs, NCLS, 0); }
    19e4:	80000ab7          	lui	s5,0x80000
    19e8:	00a00613          	li	a2,10
    19ec:	738a8593          	add	a1,s5,1848 # 80000738 <Y_cfs.0>
    19f0:	788b8513          	add	a0,s7,1928
    19f4:	819fe0ef          	jal	20c <equal_i32>
    19f8:	02051063          	bnez	a0,1a18 <main+0x98c>
    19fc:	00010537          	lui	a0,0x10
    1a00:	00a00693          	li	a3,10
    1a04:	738a8613          	add	a2,s5,1848
    1a08:	788b8593          	add	a1,s7,1928
    1a0c:	10050513          	add	a0,a0,256 # 10100 <__fini_array_end+0x158>
    1a10:	d30ff0ef          	jal	f40 <dump_first_mismatch.isra.0>
    1a14:	00000493          	li	s1,0
  printf("\nSample logits (first 8):\nSW : "); for(int i=0;i<8 && i<NCLS;++i) printf("%8ld ", (long)Y_sw[i]);  printf("\n");
  printf("CFU: "); for(int i=0;i<8 && i<NCLS;++i) printf("%8ld ", (long)Y_cfu[i]); printf("\n");
  printf("CFS: "); for(int i=0;i<8 && i<NCLS;++i) printf("%8ld ", (long)Y_cfs[i]); printf("\n\n");
#endif

  int cls_sw  = argmax_i32(Y_sw,  NCLS);
    1a18:	788b8513          	add	a0,s7,1928
    1a1c:	cecff0ef          	jal	f08 <argmax_i32.constprop.0>
    1a20:	00050a93          	mv	s5,a0
  int cls_cfu = argmax_i32(Y_cfu, NCLS);
    1a24:	760d8513          	add	a0,s11,1888
    1a28:	ce0ff0ef          	jal	f08 <argmax_i32.constprop.0>
  int cls_cfs = argmax_i32(Y_cfs, NCLS);
    1a2c:	800007b7          	lui	a5,0x80000
  int cls_cfu = argmax_i32(Y_cfu, NCLS);
    1a30:	00050b13          	mv	s6,a0
  int cls_cfs = argmax_i32(Y_cfs, NCLS);
    1a34:	73878513          	add	a0,a5,1848 # 80000738 <Y_cfs.0>
    1a38:	cd0ff0ef          	jal	f08 <argmax_i32.constprop.0>
    1a3c:	00050b93          	mv	s7,a0

  printf("Tiny CNN timing summary\n");
    1a40:	00010537          	lui	a0,0x10
    1a44:	10850513          	add	a0,a0,264 # 10108 <__fini_array_end+0x160>
    1a48:	59c000ef          	jal	1fe4 <puts>
  printf("Path |     cycles     |    instret    | Speedup(cyc) | Speedup(inst)\n");
    1a4c:	00010537          	lui	a0,0x10
    1a50:	12050513          	add	a0,a0,288 # 10120 <__fini_array_end+0x178>
    1a54:	590000ef          	jal	1fe4 <puts>
  printf("-----+----------------+---------------+--------------+--------------\n");
    1a58:	00010537          	lui	a0,0x10
    1a5c:	16850513          	add	a0,a0,360 # 10168 <__fini_array_end+0x1c0>
    1a60:	584000ef          	jal	1fe4 <puts>
  printf(" SW  | %14" PRIu64 " | %13" PRIu64 " |     --       |     --      \n", cyc_sw,  ins_sw);
    1a64:	01012703          	lw	a4,16(sp)
    1a68:	01812783          	lw	a5,24(sp)
    1a6c:	00c12603          	lw	a2,12(sp)
    1a70:	01412683          	lw	a3,20(sp)
    1a74:	00010537          	lui	a0,0x10
    1a78:	1b050513          	add	a0,a0,432 # 101b0 <__fini_array_end+0x208>
    1a7c:	3d4000ef          	jal	1e50 <printf>
  printf(" CFU | %14" PRIu64 " | %13" PRIu64 " |  "); print_speedup_fixed(cyc_sw,cyc_cfu); printf("     |  "); print_speedup_fixed(ins_sw,ins_cfu); printf("\n");
    1a80:	00010537          	lui	a0,0x10
    1a84:	1e850513          	add	a0,a0,488 # 101e8 <__fini_array_end+0x240>
    1a88:	3c8000ef          	jal	1e50 <printf>
    1a8c:	01c12603          	lw	a2,28(sp)
    1a90:	02812683          	lw	a3,40(sp)
    1a94:	01412583          	lw	a1,20(sp)
    1a98:	00c12503          	lw	a0,12(sp)
    1a9c:	00010c37          	lui	s8,0x10
    1aa0:	8d1fe0ef          	jal	370 <print_speedup_fixed>
    1aa4:	204c0513          	add	a0,s8,516 # 10204 <__fini_array_end+0x25c>
    1aa8:	3a8000ef          	jal	1e50 <printf>
    1aac:	02012603          	lw	a2,32(sp)
    1ab0:	02c12683          	lw	a3,44(sp)
    1ab4:	01812583          	lw	a1,24(sp)
    1ab8:	01012503          	lw	a0,16(sp)
    1abc:	8b5fe0ef          	jal	370 <print_speedup_fixed>
    1ac0:	00a00513          	li	a0,10
    1ac4:	3dc000ef          	jal	1ea0 <putchar>
  printf(" CFS | %14" PRIu64 " | %13" PRIu64 " |  "); print_speedup_fixed(cyc_sw,cyc_cfs); printf("     |  "); print_speedup_fixed(ins_sw,ins_cfs); printf("\n");
    1ac8:	00010537          	lui	a0,0x10
    1acc:	21050513          	add	a0,a0,528 # 10210 <__fini_array_end+0x268>
    1ad0:	380000ef          	jal	1e50 <printf>
    1ad4:	01412583          	lw	a1,20(sp)
    1ad8:	00c12503          	lw	a0,12(sp)
    1adc:	000c8613          	mv	a2,s9
    1ae0:	000a0693          	mv	a3,s4
    1ae4:	88dfe0ef          	jal	370 <print_speedup_fixed>
    1ae8:	204c0513          	add	a0,s8,516
    1aec:	364000ef          	jal	1e50 <printf>
    1af0:	02412603          	lw	a2,36(sp)
    1af4:	01812583          	lw	a1,24(sp)
    1af8:	01012503          	lw	a0,16(sp)
    1afc:	00098693          	mv	a3,s3
    1b00:	871fe0ef          	jal	370 <print_speedup_fixed>
    1b04:	00a00513          	li	a0,10
    1b08:	398000ef          	jal	1ea0 <putchar>

  printf("\nPred class: SW=%d, CFU=%d, CFS=%d\n", cls_sw, cls_cfu, cls_cfs);
    1b0c:	00010537          	lui	a0,0x10
    1b10:	000b8693          	mv	a3,s7
    1b14:	000b0613          	mv	a2,s6
    1b18:	000a8593          	mv	a1,s5
    1b1c:	22c50513          	add	a0,a0,556 # 1022c <__fini_array_end+0x284>
    1b20:	330000ef          	jal	1e50 <printf>
  printf("Verdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");
    1b24:	08040463          	beqz	s0,1bac <main+0xb20>
    1b28:	000105b7          	lui	a1,0x10
    1b2c:	03858593          	add	a1,a1,56 # 10038 <__fini_array_end+0x90>
    1b30:	08048463          	beqz	s1,1bb8 <main+0xb2c>
    1b34:	00010637          	lui	a2,0x10
    1b38:	03860613          	add	a2,a2,56 # 10038 <__fini_array_end+0x90>
    1b3c:	00010537          	lui	a0,0x10
    1b40:	25050513          	add	a0,a0,592 # 10250 <__fini_array_end+0x2a8>
    1b44:	30c000ef          	jal	1e50 <printf>
  printf("(sink=0x%08" PRIX32 ")\n", g_sink);
    1b48:	71492583          	lw	a1,1812(s2)
    1b4c:	00010537          	lui	a0,0x10
    1b50:	26c50513          	add	a0,a0,620 # 1026c <__fini_array_end+0x2c4>
    1b54:	2fc000ef          	jal	1e50 <printf>
  return (ok_cfu && ok_cfs) ? 0 : 1;
    1b58:	00947533          	and	a0,s0,s1
}
    1b5c:	0bc12083          	lw	ra,188(sp)
    1b60:	0b812403          	lw	s0,184(sp)
    1b64:	0b412483          	lw	s1,180(sp)
    1b68:	0b012903          	lw	s2,176(sp)
    1b6c:	0ac12983          	lw	s3,172(sp)
    1b70:	0a812a03          	lw	s4,168(sp)
    1b74:	0a412a83          	lw	s5,164(sp)
    1b78:	0a012b03          	lw	s6,160(sp)
    1b7c:	09c12b83          	lw	s7,156(sp)
    1b80:	09812c03          	lw	s8,152(sp)
    1b84:	09412c83          	lw	s9,148(sp)
    1b88:	09012d03          	lw	s10,144(sp)
    1b8c:	08c12d83          	lw	s11,140(sp)
    1b90:	00154513          	xor	a0,a0,1
    1b94:	0c010113          	add	sp,sp,192
    1b98:	00008067          	ret
  int ok_cfu = 1, ok_cfs = 1;
    1b9c:	00100413          	li	s0,1
    1ba0:	d11ff06f          	j	18b0 <main+0x824>
    1ba4:	00100493          	li	s1,1
    1ba8:	dd5ff06f          	j	197c <main+0x8f0>
  printf("Verdict: CFU %s, CFS %s\n", ok_cfu? "PASS":"FAIL", ok_cfs? "PASS":"FAIL");
    1bac:	000105b7          	lui	a1,0x10
    1bb0:	04058593          	add	a1,a1,64 # 10040 <__fini_array_end+0x98>
    1bb4:	f7dff06f          	j	1b30 <main+0xaa4>
    1bb8:	00010637          	lui	a2,0x10
    1bbc:	04060613          	add	a2,a2,64 # 10040 <__fini_array_end+0x98>
    1bc0:	f7dff06f          	j	1b3c <main+0xab0>

00001bc4 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
    1bc4:	ffffe097          	auipc	ra,0xffffe
    1bc8:	59408093          	add	ra,ra,1428 # 158 <__crt0_main_exit>
    1bcc:	00050513          	mv	a0,a0
    1bd0:	00008067          	ret

00001bd4 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
    1bd4:	fff00513          	li	a0,-1
    1bd8:	00008067          	ret

00001bdc <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
    1bdc:	000027b7          	lui	a5,0x2
    1be0:	00f5a223          	sw	a5,4(a1)
  return 0;
}
    1be4:	00000513          	li	a0,0
    1be8:	00008067          	ret

00001bec <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
    1bec:	00100513          	li	a0,1
    1bf0:	00008067          	ret

00001bf4 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
    1bf4:	00100513          	li	a0,1
    1bf8:	00008067          	ret

00001bfc <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
    1bfc:	800007b7          	lui	a5,0x80000
    1c00:	01600713          	li	a4,22
    1c04:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
  return -1;
}
    1c08:	fff00513          	li	a0,-1
    1c0c:	00008067          	ret

00001c10 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
    1c10:	00000513          	li	a0,0
    1c14:	00008067          	ret

00001c18 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
    1c18:	fe010113          	add	sp,sp,-32
    1c1c:	00912a23          	sw	s1,20(sp)
    1c20:	01212823          	sw	s2,16(sp)
    1c24:	00112e23          	sw	ra,28(sp)
    1c28:	00812c23          	sw	s0,24(sp)
    1c2c:	01312623          	sw	s3,12(sp)
    1c30:	01412423          	sw	s4,8(sp)
    1c34:	00058913          	mv	s2,a1
    1c38:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
    1c3c:	06051463          	bnez	a0,1ca4 <_read+0x8c>
    1c40:	00050413          	mv	s0,a0
    1c44:	fff50537          	lui	a0,0xfff50
    1c48:	1a0000ef          	jal	1de8 <neorv32_uart_available>
    1c4c:	04050c63          	beqz	a0,1ca4 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1c50:	00a00993          	li	s3,10
    1c54:	00d00a13          	li	s4,13
    while (len--) {
    1c58:	00941663          	bne	s0,s1,1c64 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
    1c5c:	00048413          	mv	s0,s1
    1c60:	0200006f          	j	1c80 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
    1c64:	fff50537          	lui	a0,0xfff50
    1c68:	1d0000ef          	jal	1e38 <neorv32_uart_getc>
      *ptr++ = c;
    1c6c:	008907b3          	add	a5,s2,s0
    1c70:	00a78023          	sb	a0,0(a5)
      read_cnt++;
    1c74:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1c78:	01350463          	beq	a0,s3,1c80 <_read+0x68>
    1c7c:	fd451ee3          	bne	a0,s4,1c58 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
    1c80:	01c12083          	lw	ra,28(sp)
    1c84:	00040513          	mv	a0,s0
    1c88:	01812403          	lw	s0,24(sp)
    1c8c:	01412483          	lw	s1,20(sp)
    1c90:	01012903          	lw	s2,16(sp)
    1c94:	00c12983          	lw	s3,12(sp)
    1c98:	00812a03          	lw	s4,8(sp)
    1c9c:	02010113          	add	sp,sp,32
    1ca0:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
    1ca4:	fff60537          	lui	a0,0xfff60
    1ca8:	140000ef          	jal	1de8 <neorv32_uart_available>
  int read_cnt = 0;
    1cac:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
    1cb0:	02050863          	beqz	a0,1ce0 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1cb4:	00a00993          	li	s3,10
    1cb8:	00d00a13          	li	s4,13
    while (len--) {
    1cbc:	fa9400e3          	beq	s0,s1,1c5c <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
    1cc0:	fff60537          	lui	a0,0xfff60
    1cc4:	174000ef          	jal	1e38 <neorv32_uart_getc>
      *ptr++ = c;
    1cc8:	008907b3          	add	a5,s2,s0
    1ccc:	00a78023          	sb	a0,0(a5)
      read_cnt++;
    1cd0:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
    1cd4:	fb3506e3          	beq	a0,s3,1c80 <_read+0x68>
    1cd8:	ff4512e3          	bne	a0,s4,1cbc <_read+0xa4>
    1cdc:	fa5ff06f          	j	1c80 <_read+0x68>
    errno = ENOSYS;
    1ce0:	800007b7          	lui	a5,0x80000
    1ce4:	05800713          	li	a4,88
    1ce8:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
    return -1;
    1cec:	fff00413          	li	s0,-1
    1cf0:	f91ff06f          	j	1c80 <_read+0x68>

00001cf4 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
    1cf4:	ff010113          	add	sp,sp,-16
    1cf8:	00812423          	sw	s0,8(sp)
    1cfc:	00912223          	sw	s1,4(sp)
    1d00:	00112623          	sw	ra,12(sp)
    1d04:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
    1d08:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
    1d0c:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
    1d10:	00058413          	mv	s0,a1
    1d14:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
    1d18:	04a7ec63          	bltu	a5,a0,1d70 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
    1d1c:	fff50537          	lui	a0,0xfff50
    1d20:	0c8000ef          	jal	1de8 <neorv32_uart_available>
    1d24:	00940933          	add	s2,s0,s1
    1d28:	02051463          	bnez	a0,1d50 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
    1d2c:	800007b7          	lui	a5,0x80000
    1d30:	05800713          	li	a4,88
    1d34:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
      return -1;
    1d38:	fff00493          	li	s1,-1
    1d3c:	0180006f          	j	1d54 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
    1d40:	00044583          	lbu	a1,0(s0)
    1d44:	fff50537          	lui	a0,0xfff50
    1d48:	00140413          	add	s0,s0,1
    1d4c:	0d8000ef          	jal	1e24 <neorv32_uart_putc>
      while (len--) {
    1d50:	fe8918e3          	bne	s2,s0,1d40 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
    1d54:	00c12083          	lw	ra,12(sp)
    1d58:	00812403          	lw	s0,8(sp)
    1d5c:	00012903          	lw	s2,0(sp)
    1d60:	00048513          	mv	a0,s1
    1d64:	00412483          	lw	s1,4(sp)
    1d68:	01010113          	add	sp,sp,16
    1d6c:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
    1d70:	fff60537          	lui	a0,0xfff60
    1d74:	074000ef          	jal	1de8 <neorv32_uart_available>
    1d78:	00940933          	add	s2,s0,s1
    1d7c:	fa0508e3          	beqz	a0,1d2c <_write+0x38>
    while (len--) {
    1d80:	fd240ae3          	beq	s0,s2,1d54 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
    1d84:	00044583          	lbu	a1,0(s0)
    1d88:	fff60537          	lui	a0,0xfff60
    1d8c:	00140413          	add	s0,s0,1
    1d90:	094000ef          	jal	1e24 <neorv32_uart_putc>
      write_cnt++;
    1d94:	fedff06f          	j	1d80 <_write+0x8c>

00001d98 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
    1d98:	80000737          	lui	a4,0x80000
    1d9c:	71872683          	lw	a3,1816(a4) # 80000718 <curr_heap.0>
    1da0:	80069637          	lui	a2,0x80069
void *_sbrk(int incr) {
    1da4:	00050793          	mv	a5,a0
    1da8:	6b060613          	add	a2,a2,1712 # 800696b0 <__crt0_bss_end>
  if (curr_heap == NULL) {
    1dac:	00069463          	bnez	a3,1db4 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
    1db0:	70c72c23          	sw	a2,1816(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
    1db4:	800696b7          	lui	a3,0x80069
    1db8:	6b068693          	add	a3,a3,1712 # 800696b0 <__crt0_bss_end>
    1dbc:	00c69c63          	bne	a3,a2,1dd4 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
    1dc0:	800007b7          	lui	a5,0x80000
    1dc4:	00c00713          	li	a4,12
    1dc8:	70e7ae23          	sw	a4,1820(a5) # 8000071c <errno>
    return (void*)-1; // error - no more memory
    1dcc:	fff00513          	li	a0,-1
    1dd0:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
    1dd4:	71872503          	lw	a0,1816(a4)
    1dd8:	00f507b3          	add	a5,a0,a5
    1ddc:	fed7f2e3          	bgeu	a5,a3,1dc0 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
    1de0:	70f72c23          	sw	a5,1816(a4)

  return (void*)prev_heap;
}
    1de4:	00008067          	ret

00001de8 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
    1de8:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
    1dec:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
    1df0:	00e51c63          	bne	a0,a4,1e08 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
    1df4:	fffe07b7          	lui	a5,0xfffe0
    1df8:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
    1dfc:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
    1e00:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
    1e04:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
    1e08:	fff60737          	lui	a4,0xfff60
    return 0;
    1e0c:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
    1e10:	fee79ae3          	bne	a5,a4,1e04 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
    1e14:	fffe07b7          	lui	a5,0xfffe0
    1e18:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
    1e1c:	020007b7          	lui	a5,0x2000
    1e20:	fe1ff06f          	j	1e00 <neorv32_uart_available+0x18>

00001e24 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
    1e24:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
    1e28:	00a79713          	sll	a4,a5,0xa
    1e2c:	fe075ce3          	bgez	a4,1e24 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
    1e30:	00b52223          	sw	a1,4(a0)
}
    1e34:	00008067          	ret

00001e38 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
    1e38:	00052783          	lw	a5,0(a0)
    1e3c:	00f79713          	sll	a4,a5,0xf
    1e40:	fe075ce3          	bgez	a4,1e38 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
    1e44:	00452503          	lw	a0,4(a0)
}
    1e48:	0ff57513          	zext.b	a0,a0
    1e4c:	00008067          	ret

00001e50 <printf>:
    1e50:	fc010113          	add	sp,sp,-64
    1e54:	02c12423          	sw	a2,40(sp)
    1e58:	02d12623          	sw	a3,44(sp)
    1e5c:	7ffff317          	auipc	t1,0x7ffff
    1e60:	8ac32303          	lw	t1,-1876(t1) # 80000708 <_impure_ptr>
    1e64:	02b12223          	sw	a1,36(sp)
    1e68:	02e12823          	sw	a4,48(sp)
    1e6c:	02f12a23          	sw	a5,52(sp)
    1e70:	03012c23          	sw	a6,56(sp)
    1e74:	03112e23          	sw	a7,60(sp)
    1e78:	00832583          	lw	a1,8(t1)
    1e7c:	02410693          	add	a3,sp,36
    1e80:	00050613          	mv	a2,a0
    1e84:	00030513          	mv	a0,t1
    1e88:	00112e23          	sw	ra,28(sp)
    1e8c:	00d12623          	sw	a3,12(sp)
    1e90:	0c8010ef          	jal	2f58 <_vfprintf_r>
    1e94:	01c12083          	lw	ra,28(sp)
    1e98:	04010113          	add	sp,sp,64
    1e9c:	00008067          	ret

00001ea0 <putchar>:
    1ea0:	7ffff797          	auipc	a5,0x7ffff
    1ea4:	8687a783          	lw	a5,-1944(a5) # 80000708 <_impure_ptr>
    1ea8:	0087a603          	lw	a2,8(a5)
    1eac:	00050593          	mv	a1,a0
    1eb0:	00078513          	mv	a0,a5
    1eb4:	3c00606f          	j	8274 <_putc_r>

00001eb8 <_puts_r>:
    1eb8:	fd010113          	add	sp,sp,-48
    1ebc:	02812423          	sw	s0,40(sp)
    1ec0:	00050413          	mv	s0,a0
    1ec4:	00058513          	mv	a0,a1
    1ec8:	02912223          	sw	s1,36(sp)
    1ecc:	02112623          	sw	ra,44(sp)
    1ed0:	00058493          	mv	s1,a1
    1ed4:	3b0000ef          	jal	2284 <strlen>
    1ed8:	00150713          	add	a4,a0,1
    1edc:	0000e697          	auipc	a3,0xe
    1ee0:	1bc68693          	add	a3,a3,444 # 10098 <__fini_array_end+0xf0>
    1ee4:	00e12623          	sw	a4,12(sp)
    1ee8:	03442783          	lw	a5,52(s0)
    1eec:	01010713          	add	a4,sp,16
    1ef0:	00d12c23          	sw	a3,24(sp)
    1ef4:	00e12223          	sw	a4,4(sp)
    1ef8:	00100693          	li	a3,1
    1efc:	00200713          	li	a4,2
    1f00:	00912823          	sw	s1,16(sp)
    1f04:	00a12a23          	sw	a0,20(sp)
    1f08:	00d12e23          	sw	a3,28(sp)
    1f0c:	00e12423          	sw	a4,8(sp)
    1f10:	00842483          	lw	s1,8(s0)
    1f14:	0c078263          	beqz	a5,1fd8 <_puts_r+0x120>
    1f18:	0644a703          	lw	a4,100(s1)
    1f1c:	00c49783          	lh	a5,12(s1)
    1f20:	00177713          	and	a4,a4,1
    1f24:	00071663          	bnez	a4,1f30 <_puts_r+0x78>
    1f28:	2007f713          	and	a4,a5,512
    1f2c:	08070e63          	beqz	a4,1fc8 <_puts_r+0x110>
    1f30:	01279713          	sll	a4,a5,0x12
    1f34:	02074263          	bltz	a4,1f58 <_puts_r+0xa0>
    1f38:	0644a703          	lw	a4,100(s1)
    1f3c:	ffffe6b7          	lui	a3,0xffffe
    1f40:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1f44:	00002637          	lui	a2,0x2
    1f48:	00c7e7b3          	or	a5,a5,a2
    1f4c:	00d77733          	and	a4,a4,a3
    1f50:	00f49623          	sh	a5,12(s1)
    1f54:	06e4a223          	sw	a4,100(s1)
    1f58:	00040513          	mv	a0,s0
    1f5c:	00410613          	add	a2,sp,4
    1f60:	00048593          	mv	a1,s1
    1f64:	549050ef          	jal	7cac <__sfvwrite_r>
    1f68:	0644a783          	lw	a5,100(s1)
    1f6c:	00153413          	seqz	s0,a0
    1f70:	40800433          	neg	s0,s0
    1f74:	00b47413          	and	s0,s0,11
    1f78:	0017f793          	and	a5,a5,1
    1f7c:	fff40413          	add	s0,s0,-1
    1f80:	00079863          	bnez	a5,1f90 <_puts_r+0xd8>
    1f84:	00c4d783          	lhu	a5,12(s1)
    1f88:	2007f793          	and	a5,a5,512
    1f8c:	00078e63          	beqz	a5,1fa8 <_puts_r+0xf0>
    1f90:	02c12083          	lw	ra,44(sp)
    1f94:	00040513          	mv	a0,s0
    1f98:	02812403          	lw	s0,40(sp)
    1f9c:	02412483          	lw	s1,36(sp)
    1fa0:	03010113          	add	sp,sp,48
    1fa4:	00008067          	ret
    1fa8:	0584a503          	lw	a0,88(s1)
    1fac:	054000ef          	jal	2000 <__retarget_lock_release_recursive>
    1fb0:	02c12083          	lw	ra,44(sp)
    1fb4:	00040513          	mv	a0,s0
    1fb8:	02812403          	lw	s0,40(sp)
    1fbc:	02412483          	lw	s1,36(sp)
    1fc0:	03010113          	add	sp,sp,48
    1fc4:	00008067          	ret
    1fc8:	0584a503          	lw	a0,88(s1)
    1fcc:	030000ef          	jal	1ffc <__retarget_lock_acquire_recursive>
    1fd0:	00c49783          	lh	a5,12(s1)
    1fd4:	f5dff06f          	j	1f30 <_puts_r+0x78>
    1fd8:	00040513          	mv	a0,s0
    1fdc:	449050ef          	jal	7c24 <__sinit>
    1fe0:	f39ff06f          	j	1f18 <_puts_r+0x60>

00001fe4 <puts>:
    1fe4:	00050593          	mv	a1,a0
    1fe8:	7fffe517          	auipc	a0,0x7fffe
    1fec:	72052503          	lw	a0,1824(a0) # 80000708 <_impure_ptr>
    1ff0:	ec9ff06f          	j	1eb8 <_puts_r>

00001ff4 <__retarget_lock_init_recursive>:
    1ff4:	00008067          	ret

00001ff8 <__retarget_lock_close_recursive>:
    1ff8:	00008067          	ret

00001ffc <__retarget_lock_acquire_recursive>:
    1ffc:	00008067          	ret

00002000 <__retarget_lock_release_recursive>:
    2000:	00008067          	ret

00002004 <memset>:
    2004:	00f00313          	li	t1,15
    2008:	00050713          	mv	a4,a0
    200c:	02c37e63          	bgeu	t1,a2,2048 <memset+0x44>
    2010:	00f77793          	and	a5,a4,15
    2014:	0a079063          	bnez	a5,20b4 <memset+0xb0>
    2018:	08059263          	bnez	a1,209c <memset+0x98>
    201c:	ff067693          	and	a3,a2,-16
    2020:	00f67613          	and	a2,a2,15
    2024:	00e686b3          	add	a3,a3,a4
    2028:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
    202c:	00b72223          	sw	a1,4(a4)
    2030:	00b72423          	sw	a1,8(a4)
    2034:	00b72623          	sw	a1,12(a4)
    2038:	01070713          	add	a4,a4,16
    203c:	fed766e3          	bltu	a4,a3,2028 <memset+0x24>
    2040:	00061463          	bnez	a2,2048 <memset+0x44>
    2044:	00008067          	ret
    2048:	40c306b3          	sub	a3,t1,a2
    204c:	00269693          	sll	a3,a3,0x2
    2050:	00000297          	auipc	t0,0x0
    2054:	005686b3          	add	a3,a3,t0
    2058:	00c68067          	jr	12(a3)
    205c:	00b70723          	sb	a1,14(a4)
    2060:	00b706a3          	sb	a1,13(a4)
    2064:	00b70623          	sb	a1,12(a4)
    2068:	00b705a3          	sb	a1,11(a4)
    206c:	00b70523          	sb	a1,10(a4)
    2070:	00b704a3          	sb	a1,9(a4)
    2074:	00b70423          	sb	a1,8(a4)
    2078:	00b703a3          	sb	a1,7(a4)
    207c:	00b70323          	sb	a1,6(a4)
    2080:	00b702a3          	sb	a1,5(a4)
    2084:	00b70223          	sb	a1,4(a4)
    2088:	00b701a3          	sb	a1,3(a4)
    208c:	00b70123          	sb	a1,2(a4)
    2090:	00b700a3          	sb	a1,1(a4)
    2094:	00b70023          	sb	a1,0(a4)
    2098:	00008067          	ret
    209c:	0ff5f593          	zext.b	a1,a1
    20a0:	00859693          	sll	a3,a1,0x8
    20a4:	00d5e5b3          	or	a1,a1,a3
    20a8:	01059693          	sll	a3,a1,0x10
    20ac:	00d5e5b3          	or	a1,a1,a3
    20b0:	f6dff06f          	j	201c <memset+0x18>
    20b4:	00279693          	sll	a3,a5,0x2
    20b8:	00000297          	auipc	t0,0x0
    20bc:	005686b3          	add	a3,a3,t0
    20c0:	00008293          	mv	t0,ra
    20c4:	fa0680e7          	jalr	-96(a3)
    20c8:	00028093          	mv	ra,t0
    20cc:	ff078793          	add	a5,a5,-16
    20d0:	40f70733          	sub	a4,a4,a5
    20d4:	00f60633          	add	a2,a2,a5
    20d8:	f6c378e3          	bgeu	t1,a2,2048 <memset+0x44>
    20dc:	f3dff06f          	j	2018 <memset+0x14>

000020e0 <memcpy>:
    20e0:	00a5c7b3          	xor	a5,a1,a0
    20e4:	0037f793          	and	a5,a5,3
    20e8:	00c508b3          	add	a7,a0,a2
    20ec:	06079463          	bnez	a5,2154 <memcpy+0x74>
    20f0:	00300793          	li	a5,3
    20f4:	06c7f063          	bgeu	a5,a2,2154 <memcpy+0x74>
    20f8:	00357793          	and	a5,a0,3
    20fc:	00050713          	mv	a4,a0
    2100:	06079a63          	bnez	a5,2174 <memcpy+0x94>
    2104:	ffc8f613          	and	a2,a7,-4
    2108:	40e606b3          	sub	a3,a2,a4
    210c:	02000793          	li	a5,32
    2110:	08d7ce63          	blt	a5,a3,21ac <memcpy+0xcc>
    2114:	00058693          	mv	a3,a1
    2118:	00070793          	mv	a5,a4
    211c:	02c77863          	bgeu	a4,a2,214c <memcpy+0x6c>
    2120:	0006a803          	lw	a6,0(a3)
    2124:	00478793          	add	a5,a5,4
    2128:	00468693          	add	a3,a3,4
    212c:	ff07ae23          	sw	a6,-4(a5)
    2130:	fec7e8e3          	bltu	a5,a2,2120 <memcpy+0x40>
    2134:	fff60793          	add	a5,a2,-1 # 1fff <__retarget_lock_acquire_recursive+0x3>
    2138:	40e787b3          	sub	a5,a5,a4
    213c:	ffc7f793          	and	a5,a5,-4
    2140:	00478793          	add	a5,a5,4
    2144:	00f70733          	add	a4,a4,a5
    2148:	00f585b3          	add	a1,a1,a5
    214c:	01176863          	bltu	a4,a7,215c <memcpy+0x7c>
    2150:	00008067          	ret
    2154:	00050713          	mv	a4,a0
    2158:	05157863          	bgeu	a0,a7,21a8 <memcpy+0xc8>
    215c:	0005c783          	lbu	a5,0(a1)
    2160:	00170713          	add	a4,a4,1
    2164:	00158593          	add	a1,a1,1
    2168:	fef70fa3          	sb	a5,-1(a4)
    216c:	fee898e3          	bne	a7,a4,215c <memcpy+0x7c>
    2170:	00008067          	ret
    2174:	0005c683          	lbu	a3,0(a1)
    2178:	00170713          	add	a4,a4,1
    217c:	00377793          	and	a5,a4,3
    2180:	fed70fa3          	sb	a3,-1(a4)
    2184:	00158593          	add	a1,a1,1
    2188:	f6078ee3          	beqz	a5,2104 <memcpy+0x24>
    218c:	0005c683          	lbu	a3,0(a1)
    2190:	00170713          	add	a4,a4,1
    2194:	00377793          	and	a5,a4,3
    2198:	fed70fa3          	sb	a3,-1(a4)
    219c:	00158593          	add	a1,a1,1
    21a0:	fc079ae3          	bnez	a5,2174 <memcpy+0x94>
    21a4:	f61ff06f          	j	2104 <memcpy+0x24>
    21a8:	00008067          	ret
    21ac:	ff010113          	add	sp,sp,-16
    21b0:	00812623          	sw	s0,12(sp)
    21b4:	02000413          	li	s0,32
    21b8:	0005a383          	lw	t2,0(a1)
    21bc:	0045a283          	lw	t0,4(a1)
    21c0:	0085af83          	lw	t6,8(a1)
    21c4:	00c5af03          	lw	t5,12(a1)
    21c8:	0105ae83          	lw	t4,16(a1)
    21cc:	0145ae03          	lw	t3,20(a1)
    21d0:	0185a303          	lw	t1,24(a1)
    21d4:	01c5a803          	lw	a6,28(a1)
    21d8:	0205a683          	lw	a3,32(a1)
    21dc:	02470713          	add	a4,a4,36
    21e0:	40e607b3          	sub	a5,a2,a4
    21e4:	fc772e23          	sw	t2,-36(a4)
    21e8:	fe572023          	sw	t0,-32(a4)
    21ec:	fff72223          	sw	t6,-28(a4)
    21f0:	ffe72423          	sw	t5,-24(a4)
    21f4:	ffd72623          	sw	t4,-20(a4)
    21f8:	ffc72823          	sw	t3,-16(a4)
    21fc:	fe672a23          	sw	t1,-12(a4)
    2200:	ff072c23          	sw	a6,-8(a4)
    2204:	fed72e23          	sw	a3,-4(a4)
    2208:	02458593          	add	a1,a1,36
    220c:	faf446e3          	blt	s0,a5,21b8 <memcpy+0xd8>
    2210:	00058693          	mv	a3,a1
    2214:	00070793          	mv	a5,a4
    2218:	02c77863          	bgeu	a4,a2,2248 <memcpy+0x168>
    221c:	0006a803          	lw	a6,0(a3)
    2220:	00478793          	add	a5,a5,4
    2224:	00468693          	add	a3,a3,4
    2228:	ff07ae23          	sw	a6,-4(a5)
    222c:	fec7e8e3          	bltu	a5,a2,221c <memcpy+0x13c>
    2230:	fff60793          	add	a5,a2,-1
    2234:	40e787b3          	sub	a5,a5,a4
    2238:	ffc7f793          	and	a5,a5,-4
    223c:	00478793          	add	a5,a5,4
    2240:	00f70733          	add	a4,a4,a5
    2244:	00f585b3          	add	a1,a1,a5
    2248:	01176863          	bltu	a4,a7,2258 <memcpy+0x178>
    224c:	00c12403          	lw	s0,12(sp)
    2250:	01010113          	add	sp,sp,16
    2254:	00008067          	ret
    2258:	0005c783          	lbu	a5,0(a1)
    225c:	00170713          	add	a4,a4,1
    2260:	00158593          	add	a1,a1,1
    2264:	fef70fa3          	sb	a5,-1(a4)
    2268:	fee882e3          	beq	a7,a4,224c <memcpy+0x16c>
    226c:	0005c783          	lbu	a5,0(a1)
    2270:	00170713          	add	a4,a4,1
    2274:	00158593          	add	a1,a1,1
    2278:	fef70fa3          	sb	a5,-1(a4)
    227c:	fce89ee3          	bne	a7,a4,2258 <memcpy+0x178>
    2280:	fcdff06f          	j	224c <memcpy+0x16c>

00002284 <strlen>:
    2284:	00357793          	and	a5,a0,3
    2288:	00050713          	mv	a4,a0
    228c:	04079c63          	bnez	a5,22e4 <strlen+0x60>
    2290:	7f7f86b7          	lui	a3,0x7f7f8
    2294:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    2298:	fff00593          	li	a1,-1
    229c:	00072603          	lw	a2,0(a4)
    22a0:	00470713          	add	a4,a4,4
    22a4:	00d677b3          	and	a5,a2,a3
    22a8:	00d787b3          	add	a5,a5,a3
    22ac:	00c7e7b3          	or	a5,a5,a2
    22b0:	00d7e7b3          	or	a5,a5,a3
    22b4:	feb784e3          	beq	a5,a1,229c <strlen+0x18>
    22b8:	ffc74683          	lbu	a3,-4(a4)
    22bc:	40a707b3          	sub	a5,a4,a0
    22c0:	04068463          	beqz	a3,2308 <strlen+0x84>
    22c4:	ffd74683          	lbu	a3,-3(a4)
    22c8:	02068c63          	beqz	a3,2300 <strlen+0x7c>
    22cc:	ffe74503          	lbu	a0,-2(a4)
    22d0:	00a03533          	snez	a0,a0
    22d4:	00f50533          	add	a0,a0,a5
    22d8:	ffe50513          	add	a0,a0,-2
    22dc:	00008067          	ret
    22e0:	fa0688e3          	beqz	a3,2290 <strlen+0xc>
    22e4:	00074783          	lbu	a5,0(a4)
    22e8:	00170713          	add	a4,a4,1
    22ec:	00377693          	and	a3,a4,3
    22f0:	fe0798e3          	bnez	a5,22e0 <strlen+0x5c>
    22f4:	40a70733          	sub	a4,a4,a0
    22f8:	fff70513          	add	a0,a4,-1
    22fc:	00008067          	ret
    2300:	ffd78513          	add	a0,a5,-3
    2304:	00008067          	ret
    2308:	ffc78513          	add	a0,a5,-4
    230c:	00008067          	ret

00002310 <_malloc_trim_r>:
    2310:	fe010113          	add	sp,sp,-32
    2314:	00812c23          	sw	s0,24(sp)
    2318:	00912a23          	sw	s1,20(sp)
    231c:	01212823          	sw	s2,16(sp)
    2320:	01312623          	sw	s3,12(sp)
    2324:	01412423          	sw	s4,8(sp)
    2328:	00058993          	mv	s3,a1
    232c:	00112e23          	sw	ra,28(sp)
    2330:	00050913          	mv	s2,a0
    2334:	7fffea17          	auipc	s4,0x7fffe
    2338:	deca0a13          	add	s4,s4,-532 # 80000120 <__malloc_av_>
    233c:	405000ef          	jal	2f40 <__malloc_lock>
    2340:	008a2703          	lw	a4,8(s4)
    2344:	000017b7          	lui	a5,0x1
    2348:	fef78793          	add	a5,a5,-17 # fef <dump_first_mismatch.isra.0+0xaf>
    234c:	00472483          	lw	s1,4(a4)
    2350:	00001737          	lui	a4,0x1
    2354:	ffc4f493          	and	s1,s1,-4
    2358:	00f48433          	add	s0,s1,a5
    235c:	41340433          	sub	s0,s0,s3
    2360:	00c45413          	srl	s0,s0,0xc
    2364:	fff40413          	add	s0,s0,-1
    2368:	00c41413          	sll	s0,s0,0xc
    236c:	00e44e63          	blt	s0,a4,2388 <_malloc_trim_r+0x78>
    2370:	00000593          	li	a1,0
    2374:	00090513          	mv	a0,s2
    2378:	105060ef          	jal	8c7c <_sbrk_r>
    237c:	008a2783          	lw	a5,8(s4)
    2380:	009787b3          	add	a5,a5,s1
    2384:	02f50863          	beq	a0,a5,23b4 <_malloc_trim_r+0xa4>
    2388:	00090513          	mv	a0,s2
    238c:	3c1000ef          	jal	2f4c <__malloc_unlock>
    2390:	01c12083          	lw	ra,28(sp)
    2394:	01812403          	lw	s0,24(sp)
    2398:	01412483          	lw	s1,20(sp)
    239c:	01012903          	lw	s2,16(sp)
    23a0:	00c12983          	lw	s3,12(sp)
    23a4:	00812a03          	lw	s4,8(sp)
    23a8:	00000513          	li	a0,0
    23ac:	02010113          	add	sp,sp,32
    23b0:	00008067          	ret
    23b4:	408005b3          	neg	a1,s0
    23b8:	00090513          	mv	a0,s2
    23bc:	0c1060ef          	jal	8c7c <_sbrk_r>
    23c0:	fff00793          	li	a5,-1
    23c4:	04f50a63          	beq	a0,a5,2418 <_malloc_trim_r+0x108>
    23c8:	80067717          	auipc	a4,0x80067
    23cc:	18870713          	add	a4,a4,392 # 80069550 <__malloc_current_mallinfo>
    23d0:	00072783          	lw	a5,0(a4)
    23d4:	008a2683          	lw	a3,8(s4)
    23d8:	408484b3          	sub	s1,s1,s0
    23dc:	0014e493          	or	s1,s1,1
    23e0:	408787b3          	sub	a5,a5,s0
    23e4:	00090513          	mv	a0,s2
    23e8:	0096a223          	sw	s1,4(a3)
    23ec:	00f72023          	sw	a5,0(a4)
    23f0:	35d000ef          	jal	2f4c <__malloc_unlock>
    23f4:	01c12083          	lw	ra,28(sp)
    23f8:	01812403          	lw	s0,24(sp)
    23fc:	01412483          	lw	s1,20(sp)
    2400:	01012903          	lw	s2,16(sp)
    2404:	00c12983          	lw	s3,12(sp)
    2408:	00812a03          	lw	s4,8(sp)
    240c:	00100513          	li	a0,1
    2410:	02010113          	add	sp,sp,32
    2414:	00008067          	ret
    2418:	00000593          	li	a1,0
    241c:	00090513          	mv	a0,s2
    2420:	05d060ef          	jal	8c7c <_sbrk_r>
    2424:	008a2703          	lw	a4,8(s4)
    2428:	00f00693          	li	a3,15
    242c:	40e507b3          	sub	a5,a0,a4
    2430:	f4f6dce3          	bge	a3,a5,2388 <_malloc_trim_r+0x78>
    2434:	7fffe697          	auipc	a3,0x7fffe
    2438:	2d86a683          	lw	a3,728(a3) # 8000070c <__malloc_sbrk_base>
    243c:	40d50533          	sub	a0,a0,a3
    2440:	0017e793          	or	a5,a5,1
    2444:	80067697          	auipc	a3,0x80067
    2448:	10a6a623          	sw	a0,268(a3) # 80069550 <__malloc_current_mallinfo>
    244c:	00f72223          	sw	a5,4(a4)
    2450:	f39ff06f          	j	2388 <_malloc_trim_r+0x78>

00002454 <_free_r>:
    2454:	18058263          	beqz	a1,25d8 <_free_r+0x184>
    2458:	ff010113          	add	sp,sp,-16
    245c:	00812423          	sw	s0,8(sp)
    2460:	00912223          	sw	s1,4(sp)
    2464:	00058413          	mv	s0,a1
    2468:	00050493          	mv	s1,a0
    246c:	00112623          	sw	ra,12(sp)
    2470:	2d1000ef          	jal	2f40 <__malloc_lock>
    2474:	ffc42583          	lw	a1,-4(s0)
    2478:	ff840713          	add	a4,s0,-8
    247c:	7fffe517          	auipc	a0,0x7fffe
    2480:	ca450513          	add	a0,a0,-860 # 80000120 <__malloc_av_>
    2484:	ffe5f793          	and	a5,a1,-2
    2488:	00f70633          	add	a2,a4,a5
    248c:	00462683          	lw	a3,4(a2)
    2490:	00852803          	lw	a6,8(a0)
    2494:	ffc6f693          	and	a3,a3,-4
    2498:	1ac80263          	beq	a6,a2,263c <_free_r+0x1e8>
    249c:	00d62223          	sw	a3,4(a2)
    24a0:	0015f593          	and	a1,a1,1
    24a4:	00d60833          	add	a6,a2,a3
    24a8:	0a059063          	bnez	a1,2548 <_free_r+0xf4>
    24ac:	ff842303          	lw	t1,-8(s0)
    24b0:	00482583          	lw	a1,4(a6) # 1004 <dump_first_mismatch.isra.0+0xc4>
    24b4:	7fffe897          	auipc	a7,0x7fffe
    24b8:	c7488893          	add	a7,a7,-908 # 80000128 <__malloc_av_+0x8>
    24bc:	40670733          	sub	a4,a4,t1
    24c0:	00872803          	lw	a6,8(a4)
    24c4:	006787b3          	add	a5,a5,t1
    24c8:	0015f593          	and	a1,a1,1
    24cc:	15180263          	beq	a6,a7,2610 <_free_r+0x1bc>
    24d0:	00c72303          	lw	t1,12(a4)
    24d4:	00682623          	sw	t1,12(a6)
    24d8:	01032423          	sw	a6,8(t1)
    24dc:	1a058a63          	beqz	a1,2690 <_free_r+0x23c>
    24e0:	0017e693          	or	a3,a5,1
    24e4:	00d72223          	sw	a3,4(a4)
    24e8:	00f62023          	sw	a5,0(a2)
    24ec:	1ff00693          	li	a3,511
    24f0:	06f6ec63          	bltu	a3,a5,2568 <_free_r+0x114>
    24f4:	ff87f693          	and	a3,a5,-8
    24f8:	00868693          	add	a3,a3,8
    24fc:	00452583          	lw	a1,4(a0)
    2500:	00d506b3          	add	a3,a0,a3
    2504:	0006a603          	lw	a2,0(a3)
    2508:	0057d813          	srl	a6,a5,0x5
    250c:	00100793          	li	a5,1
    2510:	010797b3          	sll	a5,a5,a6
    2514:	00b7e7b3          	or	a5,a5,a1
    2518:	ff868593          	add	a1,a3,-8
    251c:	00b72623          	sw	a1,12(a4)
    2520:	00c72423          	sw	a2,8(a4)
    2524:	00f52223          	sw	a5,4(a0)
    2528:	00e6a023          	sw	a4,0(a3)
    252c:	00e62623          	sw	a4,12(a2)
    2530:	00812403          	lw	s0,8(sp)
    2534:	00c12083          	lw	ra,12(sp)
    2538:	00048513          	mv	a0,s1
    253c:	00412483          	lw	s1,4(sp)
    2540:	01010113          	add	sp,sp,16
    2544:	2090006f          	j	2f4c <__malloc_unlock>
    2548:	00482583          	lw	a1,4(a6)
    254c:	0015f593          	and	a1,a1,1
    2550:	08058663          	beqz	a1,25dc <_free_r+0x188>
    2554:	0017e693          	or	a3,a5,1
    2558:	fed42e23          	sw	a3,-4(s0)
    255c:	00f62023          	sw	a5,0(a2)
    2560:	1ff00693          	li	a3,511
    2564:	f8f6f8e3          	bgeu	a3,a5,24f4 <_free_r+0xa0>
    2568:	0097d693          	srl	a3,a5,0x9
    256c:	00400613          	li	a2,4
    2570:	12d66463          	bltu	a2,a3,2698 <_free_r+0x244>
    2574:	0067d693          	srl	a3,a5,0x6
    2578:	03968593          	add	a1,a3,57
    257c:	03868613          	add	a2,a3,56
    2580:	00359593          	sll	a1,a1,0x3
    2584:	00b505b3          	add	a1,a0,a1
    2588:	0005a683          	lw	a3,0(a1)
    258c:	ff858593          	add	a1,a1,-8
    2590:	00d59863          	bne	a1,a3,25a0 <_free_r+0x14c>
    2594:	15c0006f          	j	26f0 <_free_r+0x29c>
    2598:	0086a683          	lw	a3,8(a3)
    259c:	00d58863          	beq	a1,a3,25ac <_free_r+0x158>
    25a0:	0046a603          	lw	a2,4(a3)
    25a4:	ffc67613          	and	a2,a2,-4
    25a8:	fec7e8e3          	bltu	a5,a2,2598 <_free_r+0x144>
    25ac:	00c6a583          	lw	a1,12(a3)
    25b0:	00b72623          	sw	a1,12(a4)
    25b4:	00d72423          	sw	a3,8(a4)
    25b8:	00812403          	lw	s0,8(sp)
    25bc:	00c12083          	lw	ra,12(sp)
    25c0:	00e5a423          	sw	a4,8(a1)
    25c4:	00048513          	mv	a0,s1
    25c8:	00412483          	lw	s1,4(sp)
    25cc:	00e6a623          	sw	a4,12(a3)
    25d0:	01010113          	add	sp,sp,16
    25d4:	1790006f          	j	2f4c <__malloc_unlock>
    25d8:	00008067          	ret
    25dc:	00d787b3          	add	a5,a5,a3
    25e0:	7fffe897          	auipc	a7,0x7fffe
    25e4:	b4888893          	add	a7,a7,-1208 # 80000128 <__malloc_av_+0x8>
    25e8:	00862683          	lw	a3,8(a2)
    25ec:	0f168063          	beq	a3,a7,26cc <_free_r+0x278>
    25f0:	00c62803          	lw	a6,12(a2)
    25f4:	0017e593          	or	a1,a5,1
    25f8:	00f70633          	add	a2,a4,a5
    25fc:	0106a623          	sw	a6,12(a3)
    2600:	00d82423          	sw	a3,8(a6)
    2604:	00b72223          	sw	a1,4(a4)
    2608:	00f62023          	sw	a5,0(a2)
    260c:	ee1ff06f          	j	24ec <_free_r+0x98>
    2610:	14059063          	bnez	a1,2750 <_free_r+0x2fc>
    2614:	00862583          	lw	a1,8(a2)
    2618:	00c62603          	lw	a2,12(a2)
    261c:	00f686b3          	add	a3,a3,a5
    2620:	0016e793          	or	a5,a3,1
    2624:	00c5a623          	sw	a2,12(a1)
    2628:	00b62423          	sw	a1,8(a2)
    262c:	00f72223          	sw	a5,4(a4)
    2630:	00d70733          	add	a4,a4,a3
    2634:	00d72023          	sw	a3,0(a4)
    2638:	ef9ff06f          	j	2530 <_free_r+0xdc>
    263c:	0015f593          	and	a1,a1,1
    2640:	00d786b3          	add	a3,a5,a3
    2644:	02059063          	bnez	a1,2664 <_free_r+0x210>
    2648:	ff842583          	lw	a1,-8(s0)
    264c:	40b70733          	sub	a4,a4,a1
    2650:	00c72783          	lw	a5,12(a4)
    2654:	00872603          	lw	a2,8(a4)
    2658:	00b686b3          	add	a3,a3,a1
    265c:	00f62623          	sw	a5,12(a2)
    2660:	00c7a423          	sw	a2,8(a5)
    2664:	0016e793          	or	a5,a3,1
    2668:	00f72223          	sw	a5,4(a4)
    266c:	00e52423          	sw	a4,8(a0)
    2670:	7fffe797          	auipc	a5,0x7fffe
    2674:	0a07a783          	lw	a5,160(a5) # 80000710 <__malloc_trim_threshold>
    2678:	eaf6ece3          	bltu	a3,a5,2530 <_free_r+0xdc>
    267c:	7fffe597          	auipc	a1,0x7fffe
    2680:	0b45a583          	lw	a1,180(a1) # 80000730 <__malloc_top_pad>
    2684:	00048513          	mv	a0,s1
    2688:	c89ff0ef          	jal	2310 <_malloc_trim_r>
    268c:	ea5ff06f          	j	2530 <_free_r+0xdc>
    2690:	00d787b3          	add	a5,a5,a3
    2694:	f55ff06f          	j	25e8 <_free_r+0x194>
    2698:	01400613          	li	a2,20
    269c:	02d67063          	bgeu	a2,a3,26bc <_free_r+0x268>
    26a0:	05400613          	li	a2,84
    26a4:	06d66463          	bltu	a2,a3,270c <_free_r+0x2b8>
    26a8:	00c7d693          	srl	a3,a5,0xc
    26ac:	06f68593          	add	a1,a3,111
    26b0:	06e68613          	add	a2,a3,110
    26b4:	00359593          	sll	a1,a1,0x3
    26b8:	ecdff06f          	j	2584 <_free_r+0x130>
    26bc:	05c68593          	add	a1,a3,92
    26c0:	05b68613          	add	a2,a3,91
    26c4:	00359593          	sll	a1,a1,0x3
    26c8:	ebdff06f          	j	2584 <_free_r+0x130>
    26cc:	00e52a23          	sw	a4,20(a0)
    26d0:	00e52823          	sw	a4,16(a0)
    26d4:	0017e693          	or	a3,a5,1
    26d8:	01172623          	sw	a7,12(a4)
    26dc:	01172423          	sw	a7,8(a4)
    26e0:	00d72223          	sw	a3,4(a4)
    26e4:	00f70733          	add	a4,a4,a5
    26e8:	00f72023          	sw	a5,0(a4)
    26ec:	e45ff06f          	j	2530 <_free_r+0xdc>
    26f0:	00452803          	lw	a6,4(a0)
    26f4:	40265613          	sra	a2,a2,0x2
    26f8:	00100793          	li	a5,1
    26fc:	00c797b3          	sll	a5,a5,a2
    2700:	0107e7b3          	or	a5,a5,a6
    2704:	00f52223          	sw	a5,4(a0)
    2708:	ea9ff06f          	j	25b0 <_free_r+0x15c>
    270c:	15400613          	li	a2,340
    2710:	00d66c63          	bltu	a2,a3,2728 <_free_r+0x2d4>
    2714:	00f7d693          	srl	a3,a5,0xf
    2718:	07868593          	add	a1,a3,120
    271c:	07768613          	add	a2,a3,119
    2720:	00359593          	sll	a1,a1,0x3
    2724:	e61ff06f          	j	2584 <_free_r+0x130>
    2728:	55400613          	li	a2,1364
    272c:	00d66c63          	bltu	a2,a3,2744 <_free_r+0x2f0>
    2730:	0127d693          	srl	a3,a5,0x12
    2734:	07d68593          	add	a1,a3,125
    2738:	07c68613          	add	a2,a3,124
    273c:	00359593          	sll	a1,a1,0x3
    2740:	e45ff06f          	j	2584 <_free_r+0x130>
    2744:	3f800593          	li	a1,1016
    2748:	07e00613          	li	a2,126
    274c:	e39ff06f          	j	2584 <_free_r+0x130>
    2750:	0017e693          	or	a3,a5,1
    2754:	00d72223          	sw	a3,4(a4)
    2758:	00f62023          	sw	a5,0(a2)
    275c:	dd5ff06f          	j	2530 <_free_r+0xdc>

00002760 <_malloc_r>:
    2760:	fd010113          	add	sp,sp,-48
    2764:	03212023          	sw	s2,32(sp)
    2768:	02112623          	sw	ra,44(sp)
    276c:	02812423          	sw	s0,40(sp)
    2770:	02912223          	sw	s1,36(sp)
    2774:	01312e23          	sw	s3,28(sp)
    2778:	00b58793          	add	a5,a1,11
    277c:	01600713          	li	a4,22
    2780:	00050913          	mv	s2,a0
    2784:	08f76263          	bltu	a4,a5,2808 <_malloc_r+0xa8>
    2788:	01000793          	li	a5,16
    278c:	20b7e663          	bltu	a5,a1,2998 <_malloc_r+0x238>
    2790:	7b0000ef          	jal	2f40 <__malloc_lock>
    2794:	01800793          	li	a5,24
    2798:	00200593          	li	a1,2
    279c:	01000493          	li	s1,16
    27a0:	7fffe997          	auipc	s3,0x7fffe
    27a4:	98098993          	add	s3,s3,-1664 # 80000120 <__malloc_av_>
    27a8:	00f987b3          	add	a5,s3,a5
    27ac:	0047a403          	lw	s0,4(a5)
    27b0:	ff878713          	add	a4,a5,-8
    27b4:	36e40463          	beq	s0,a4,2b1c <_malloc_r+0x3bc>
    27b8:	00442783          	lw	a5,4(s0)
    27bc:	00c42683          	lw	a3,12(s0)
    27c0:	00842603          	lw	a2,8(s0)
    27c4:	ffc7f793          	and	a5,a5,-4
    27c8:	00f407b3          	add	a5,s0,a5
    27cc:	0047a703          	lw	a4,4(a5)
    27d0:	00d62623          	sw	a3,12(a2)
    27d4:	00c6a423          	sw	a2,8(a3)
    27d8:	00176713          	or	a4,a4,1
    27dc:	00090513          	mv	a0,s2
    27e0:	00e7a223          	sw	a4,4(a5)
    27e4:	768000ef          	jal	2f4c <__malloc_unlock>
    27e8:	00840513          	add	a0,s0,8
    27ec:	02c12083          	lw	ra,44(sp)
    27f0:	02812403          	lw	s0,40(sp)
    27f4:	02412483          	lw	s1,36(sp)
    27f8:	02012903          	lw	s2,32(sp)
    27fc:	01c12983          	lw	s3,28(sp)
    2800:	03010113          	add	sp,sp,48
    2804:	00008067          	ret
    2808:	ff87f493          	and	s1,a5,-8
    280c:	1807c663          	bltz	a5,2998 <_malloc_r+0x238>
    2810:	18b4e463          	bltu	s1,a1,2998 <_malloc_r+0x238>
    2814:	72c000ef          	jal	2f40 <__malloc_lock>
    2818:	1f700793          	li	a5,503
    281c:	4097fa63          	bgeu	a5,s1,2c30 <_malloc_r+0x4d0>
    2820:	0094d793          	srl	a5,s1,0x9
    2824:	18078263          	beqz	a5,29a8 <_malloc_r+0x248>
    2828:	00400713          	li	a4,4
    282c:	36f76063          	bltu	a4,a5,2b8c <_malloc_r+0x42c>
    2830:	0064d793          	srl	a5,s1,0x6
    2834:	03978593          	add	a1,a5,57
    2838:	03878813          	add	a6,a5,56
    283c:	00359613          	sll	a2,a1,0x3
    2840:	7fffe997          	auipc	s3,0x7fffe
    2844:	8e098993          	add	s3,s3,-1824 # 80000120 <__malloc_av_>
    2848:	00c98633          	add	a2,s3,a2
    284c:	00462403          	lw	s0,4(a2)
    2850:	ff860613          	add	a2,a2,-8
    2854:	02860863          	beq	a2,s0,2884 <_malloc_r+0x124>
    2858:	00f00513          	li	a0,15
    285c:	0140006f          	j	2870 <_malloc_r+0x110>
    2860:	00c42683          	lw	a3,12(s0)
    2864:	2a075863          	bgez	a4,2b14 <_malloc_r+0x3b4>
    2868:	00d60e63          	beq	a2,a3,2884 <_malloc_r+0x124>
    286c:	00068413          	mv	s0,a3
    2870:	00442783          	lw	a5,4(s0)
    2874:	ffc7f793          	and	a5,a5,-4
    2878:	40978733          	sub	a4,a5,s1
    287c:	fee552e3          	bge	a0,a4,2860 <_malloc_r+0x100>
    2880:	00080593          	mv	a1,a6
    2884:	0109a403          	lw	s0,16(s3)
    2888:	7fffe897          	auipc	a7,0x7fffe
    288c:	8a088893          	add	a7,a7,-1888 # 80000128 <__malloc_av_+0x8>
    2890:	27140e63          	beq	s0,a7,2b0c <_malloc_r+0x3ac>
    2894:	00442783          	lw	a5,4(s0)
    2898:	00f00693          	li	a3,15
    289c:	ffc7f793          	and	a5,a5,-4
    28a0:	40978733          	sub	a4,a5,s1
    28a4:	38e6cc63          	blt	a3,a4,2c3c <_malloc_r+0x4dc>
    28a8:	0119aa23          	sw	a7,20(s3)
    28ac:	0119a823          	sw	a7,16(s3)
    28b0:	36075063          	bgez	a4,2c10 <_malloc_r+0x4b0>
    28b4:	1ff00713          	li	a4,511
    28b8:	0049a503          	lw	a0,4(s3)
    28bc:	26f76863          	bltu	a4,a5,2b2c <_malloc_r+0x3cc>
    28c0:	ff87f713          	and	a4,a5,-8
    28c4:	00870713          	add	a4,a4,8
    28c8:	00e98733          	add	a4,s3,a4
    28cc:	00072683          	lw	a3,0(a4)
    28d0:	0057d613          	srl	a2,a5,0x5
    28d4:	00100793          	li	a5,1
    28d8:	00c797b3          	sll	a5,a5,a2
    28dc:	00f56533          	or	a0,a0,a5
    28e0:	ff870793          	add	a5,a4,-8
    28e4:	00f42623          	sw	a5,12(s0)
    28e8:	00d42423          	sw	a3,8(s0)
    28ec:	00a9a223          	sw	a0,4(s3)
    28f0:	00872023          	sw	s0,0(a4)
    28f4:	0086a623          	sw	s0,12(a3)
    28f8:	4025d793          	sra	a5,a1,0x2
    28fc:	00100613          	li	a2,1
    2900:	00f61633          	sll	a2,a2,a5
    2904:	0ac56a63          	bltu	a0,a2,29b8 <_malloc_r+0x258>
    2908:	00a677b3          	and	a5,a2,a0
    290c:	02079463          	bnez	a5,2934 <_malloc_r+0x1d4>
    2910:	00161613          	sll	a2,a2,0x1
    2914:	ffc5f593          	and	a1,a1,-4
    2918:	00a677b3          	and	a5,a2,a0
    291c:	00458593          	add	a1,a1,4
    2920:	00079a63          	bnez	a5,2934 <_malloc_r+0x1d4>
    2924:	00161613          	sll	a2,a2,0x1
    2928:	00a677b3          	and	a5,a2,a0
    292c:	00458593          	add	a1,a1,4
    2930:	fe078ae3          	beqz	a5,2924 <_malloc_r+0x1c4>
    2934:	00f00813          	li	a6,15
    2938:	00359313          	sll	t1,a1,0x3
    293c:	00698333          	add	t1,s3,t1
    2940:	00030513          	mv	a0,t1
    2944:	00c52783          	lw	a5,12(a0)
    2948:	00058e13          	mv	t3,a1
    294c:	26f50263          	beq	a0,a5,2bb0 <_malloc_r+0x450>
    2950:	0047a703          	lw	a4,4(a5)
    2954:	00078413          	mv	s0,a5
    2958:	00c7a783          	lw	a5,12(a5)
    295c:	ffc77713          	and	a4,a4,-4
    2960:	409706b3          	sub	a3,a4,s1
    2964:	26d84263          	blt	a6,a3,2bc8 <_malloc_r+0x468>
    2968:	fe06c2e3          	bltz	a3,294c <_malloc_r+0x1ec>
    296c:	00e40733          	add	a4,s0,a4
    2970:	00472683          	lw	a3,4(a4)
    2974:	00842603          	lw	a2,8(s0)
    2978:	00090513          	mv	a0,s2
    297c:	0016e693          	or	a3,a3,1
    2980:	00d72223          	sw	a3,4(a4)
    2984:	00f62623          	sw	a5,12(a2)
    2988:	00c7a423          	sw	a2,8(a5)
    298c:	5c0000ef          	jal	2f4c <__malloc_unlock>
    2990:	00840513          	add	a0,s0,8
    2994:	e59ff06f          	j	27ec <_malloc_r+0x8c>
    2998:	00c00793          	li	a5,12
    299c:	00f92023          	sw	a5,0(s2)
    29a0:	00000513          	li	a0,0
    29a4:	e49ff06f          	j	27ec <_malloc_r+0x8c>
    29a8:	20000613          	li	a2,512
    29ac:	04000593          	li	a1,64
    29b0:	03f00813          	li	a6,63
    29b4:	e8dff06f          	j	2840 <_malloc_r+0xe0>
    29b8:	0089a403          	lw	s0,8(s3)
    29bc:	01612823          	sw	s6,16(sp)
    29c0:	00442783          	lw	a5,4(s0)
    29c4:	ffc7fb13          	and	s6,a5,-4
    29c8:	009b6863          	bltu	s6,s1,29d8 <_malloc_r+0x278>
    29cc:	409b0733          	sub	a4,s6,s1
    29d0:	00f00793          	li	a5,15
    29d4:	0ee7ca63          	blt	a5,a4,2ac8 <_malloc_r+0x368>
    29d8:	01912223          	sw	s9,4(sp)
    29dc:	7fffec97          	auipc	s9,0x7fffe
    29e0:	d30c8c93          	add	s9,s9,-720 # 8000070c <__malloc_sbrk_base>
    29e4:	000ca703          	lw	a4,0(s9)
    29e8:	01412c23          	sw	s4,24(sp)
    29ec:	01512a23          	sw	s5,20(sp)
    29f0:	01712623          	sw	s7,12(sp)
    29f4:	7fffea97          	auipc	s5,0x7fffe
    29f8:	d3caaa83          	lw	s5,-708(s5) # 80000730 <__malloc_top_pad>
    29fc:	fff00793          	li	a5,-1
    2a00:	01640a33          	add	s4,s0,s6
    2a04:	01548ab3          	add	s5,s1,s5
    2a08:	3ef70263          	beq	a4,a5,2dec <_malloc_r+0x68c>
    2a0c:	000017b7          	lui	a5,0x1
    2a10:	00f78793          	add	a5,a5,15 # 100f <dump_first_mismatch.isra.0+0xcf>
    2a14:	00fa8ab3          	add	s5,s5,a5
    2a18:	fffff7b7          	lui	a5,0xfffff
    2a1c:	00fafab3          	and	s5,s5,a5
    2a20:	000a8593          	mv	a1,s5
    2a24:	00090513          	mv	a0,s2
    2a28:	254060ef          	jal	8c7c <_sbrk_r>
    2a2c:	fff00793          	li	a5,-1
    2a30:	00050b93          	mv	s7,a0
    2a34:	46f50663          	beq	a0,a5,2ea0 <_malloc_r+0x740>
    2a38:	01812423          	sw	s8,8(sp)
    2a3c:	25456863          	bltu	a0,s4,2c8c <_malloc_r+0x52c>
    2a40:	80067c17          	auipc	s8,0x80067
    2a44:	b10c0c13          	add	s8,s8,-1264 # 80069550 <__malloc_current_mallinfo>
    2a48:	000c2583          	lw	a1,0(s8)
    2a4c:	00ba85b3          	add	a1,s5,a1
    2a50:	00bc2023          	sw	a1,0(s8)
    2a54:	00058713          	mv	a4,a1
    2a58:	2caa1063          	bne	s4,a0,2d18 <_malloc_r+0x5b8>
    2a5c:	01451793          	sll	a5,a0,0x14
    2a60:	2a079c63          	bnez	a5,2d18 <_malloc_r+0x5b8>
    2a64:	0089ab83          	lw	s7,8(s3)
    2a68:	015b07b3          	add	a5,s6,s5
    2a6c:	0017e793          	or	a5,a5,1
    2a70:	00fba223          	sw	a5,4(s7)
    2a74:	7fffe717          	auipc	a4,0x7fffe
    2a78:	cb870713          	add	a4,a4,-840 # 8000072c <__malloc_max_sbrked_mem>
    2a7c:	00072683          	lw	a3,0(a4)
    2a80:	00b6f463          	bgeu	a3,a1,2a88 <_malloc_r+0x328>
    2a84:	00b72023          	sw	a1,0(a4)
    2a88:	7fffe717          	auipc	a4,0x7fffe
    2a8c:	ca070713          	add	a4,a4,-864 # 80000728 <__malloc_max_total_mem>
    2a90:	00072683          	lw	a3,0(a4)
    2a94:	00b6f463          	bgeu	a3,a1,2a9c <_malloc_r+0x33c>
    2a98:	00b72023          	sw	a1,0(a4)
    2a9c:	00812c03          	lw	s8,8(sp)
    2aa0:	000b8413          	mv	s0,s7
    2aa4:	ffc7f793          	and	a5,a5,-4
    2aa8:	40978733          	sub	a4,a5,s1
    2aac:	3897ec63          	bltu	a5,s1,2e44 <_malloc_r+0x6e4>
    2ab0:	00f00793          	li	a5,15
    2ab4:	38e7d863          	bge	a5,a4,2e44 <_malloc_r+0x6e4>
    2ab8:	01812a03          	lw	s4,24(sp)
    2abc:	01412a83          	lw	s5,20(sp)
    2ac0:	00c12b83          	lw	s7,12(sp)
    2ac4:	00412c83          	lw	s9,4(sp)
    2ac8:	0014e793          	or	a5,s1,1
    2acc:	00f42223          	sw	a5,4(s0)
    2ad0:	009404b3          	add	s1,s0,s1
    2ad4:	0099a423          	sw	s1,8(s3)
    2ad8:	00176713          	or	a4,a4,1
    2adc:	00090513          	mv	a0,s2
    2ae0:	00e4a223          	sw	a4,4(s1)
    2ae4:	468000ef          	jal	2f4c <__malloc_unlock>
    2ae8:	02c12083          	lw	ra,44(sp)
    2aec:	00840513          	add	a0,s0,8
    2af0:	02812403          	lw	s0,40(sp)
    2af4:	01012b03          	lw	s6,16(sp)
    2af8:	02412483          	lw	s1,36(sp)
    2afc:	02012903          	lw	s2,32(sp)
    2b00:	01c12983          	lw	s3,28(sp)
    2b04:	03010113          	add	sp,sp,48
    2b08:	00008067          	ret
    2b0c:	0049a503          	lw	a0,4(s3)
    2b10:	de9ff06f          	j	28f8 <_malloc_r+0x198>
    2b14:	00842603          	lw	a2,8(s0)
    2b18:	cb1ff06f          	j	27c8 <_malloc_r+0x68>
    2b1c:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    2b20:	00258593          	add	a1,a1,2
    2b24:	d68780e3          	beq	a5,s0,2884 <_malloc_r+0x124>
    2b28:	c91ff06f          	j	27b8 <_malloc_r+0x58>
    2b2c:	0097d713          	srl	a4,a5,0x9
    2b30:	00400693          	li	a3,4
    2b34:	14e6f263          	bgeu	a3,a4,2c78 <_malloc_r+0x518>
    2b38:	01400693          	li	a3,20
    2b3c:	32e6e663          	bltu	a3,a4,2e68 <_malloc_r+0x708>
    2b40:	05c70613          	add	a2,a4,92
    2b44:	05b70693          	add	a3,a4,91
    2b48:	00361613          	sll	a2,a2,0x3
    2b4c:	00c98633          	add	a2,s3,a2
    2b50:	00062703          	lw	a4,0(a2)
    2b54:	ff860613          	add	a2,a2,-8
    2b58:	00e61863          	bne	a2,a4,2b68 <_malloc_r+0x408>
    2b5c:	2980006f          	j	2df4 <_malloc_r+0x694>
    2b60:	00872703          	lw	a4,8(a4)
    2b64:	00e60863          	beq	a2,a4,2b74 <_malloc_r+0x414>
    2b68:	00472683          	lw	a3,4(a4)
    2b6c:	ffc6f693          	and	a3,a3,-4
    2b70:	fed7e8e3          	bltu	a5,a3,2b60 <_malloc_r+0x400>
    2b74:	00c72603          	lw	a2,12(a4)
    2b78:	00c42623          	sw	a2,12(s0)
    2b7c:	00e42423          	sw	a4,8(s0)
    2b80:	00862423          	sw	s0,8(a2)
    2b84:	00872623          	sw	s0,12(a4)
    2b88:	d71ff06f          	j	28f8 <_malloc_r+0x198>
    2b8c:	01400713          	li	a4,20
    2b90:	10f77863          	bgeu	a4,a5,2ca0 <_malloc_r+0x540>
    2b94:	05400713          	li	a4,84
    2b98:	2ef76663          	bltu	a4,a5,2e84 <_malloc_r+0x724>
    2b9c:	00c4d793          	srl	a5,s1,0xc
    2ba0:	06f78593          	add	a1,a5,111
    2ba4:	06e78813          	add	a6,a5,110
    2ba8:	00359613          	sll	a2,a1,0x3
    2bac:	c95ff06f          	j	2840 <_malloc_r+0xe0>
    2bb0:	001e0e13          	add	t3,t3,1
    2bb4:	003e7793          	and	a5,t3,3
    2bb8:	00850513          	add	a0,a0,8
    2bbc:	10078063          	beqz	a5,2cbc <_malloc_r+0x55c>
    2bc0:	00c52783          	lw	a5,12(a0)
    2bc4:	d89ff06f          	j	294c <_malloc_r+0x1ec>
    2bc8:	00842603          	lw	a2,8(s0)
    2bcc:	0014e593          	or	a1,s1,1
    2bd0:	00b42223          	sw	a1,4(s0)
    2bd4:	00f62623          	sw	a5,12(a2)
    2bd8:	00c7a423          	sw	a2,8(a5)
    2bdc:	009404b3          	add	s1,s0,s1
    2be0:	0099aa23          	sw	s1,20(s3)
    2be4:	0099a823          	sw	s1,16(s3)
    2be8:	0016e793          	or	a5,a3,1
    2bec:	0114a623          	sw	a7,12(s1)
    2bf0:	0114a423          	sw	a7,8(s1)
    2bf4:	00f4a223          	sw	a5,4(s1)
    2bf8:	00e40733          	add	a4,s0,a4
    2bfc:	00090513          	mv	a0,s2
    2c00:	00d72023          	sw	a3,0(a4)
    2c04:	348000ef          	jal	2f4c <__malloc_unlock>
    2c08:	00840513          	add	a0,s0,8
    2c0c:	be1ff06f          	j	27ec <_malloc_r+0x8c>
    2c10:	00f407b3          	add	a5,s0,a5
    2c14:	0047a703          	lw	a4,4(a5)
    2c18:	00090513          	mv	a0,s2
    2c1c:	00176713          	or	a4,a4,1
    2c20:	00e7a223          	sw	a4,4(a5)
    2c24:	328000ef          	jal	2f4c <__malloc_unlock>
    2c28:	00840513          	add	a0,s0,8
    2c2c:	bc1ff06f          	j	27ec <_malloc_r+0x8c>
    2c30:	0034d593          	srl	a1,s1,0x3
    2c34:	00848793          	add	a5,s1,8
    2c38:	b69ff06f          	j	27a0 <_malloc_r+0x40>
    2c3c:	0014e693          	or	a3,s1,1
    2c40:	00d42223          	sw	a3,4(s0)
    2c44:	009404b3          	add	s1,s0,s1
    2c48:	0099aa23          	sw	s1,20(s3)
    2c4c:	0099a823          	sw	s1,16(s3)
    2c50:	00176693          	or	a3,a4,1
    2c54:	0114a623          	sw	a7,12(s1)
    2c58:	0114a423          	sw	a7,8(s1)
    2c5c:	00d4a223          	sw	a3,4(s1)
    2c60:	00f407b3          	add	a5,s0,a5
    2c64:	00090513          	mv	a0,s2
    2c68:	00e7a023          	sw	a4,0(a5)
    2c6c:	2e0000ef          	jal	2f4c <__malloc_unlock>
    2c70:	00840513          	add	a0,s0,8
    2c74:	b79ff06f          	j	27ec <_malloc_r+0x8c>
    2c78:	0067d713          	srl	a4,a5,0x6
    2c7c:	03970613          	add	a2,a4,57
    2c80:	03870693          	add	a3,a4,56
    2c84:	00361613          	sll	a2,a2,0x3
    2c88:	ec5ff06f          	j	2b4c <_malloc_r+0x3ec>
    2c8c:	07340c63          	beq	s0,s3,2d04 <_malloc_r+0x5a4>
    2c90:	0089a403          	lw	s0,8(s3)
    2c94:	00812c03          	lw	s8,8(sp)
    2c98:	00442783          	lw	a5,4(s0)
    2c9c:	e09ff06f          	j	2aa4 <_malloc_r+0x344>
    2ca0:	05c78593          	add	a1,a5,92
    2ca4:	05b78813          	add	a6,a5,91
    2ca8:	00359613          	sll	a2,a1,0x3
    2cac:	b95ff06f          	j	2840 <_malloc_r+0xe0>
    2cb0:	00832783          	lw	a5,8(t1)
    2cb4:	fff58593          	add	a1,a1,-1
    2cb8:	28679063          	bne	a5,t1,2f38 <_malloc_r+0x7d8>
    2cbc:	0035f793          	and	a5,a1,3
    2cc0:	ff830313          	add	t1,t1,-8
    2cc4:	fe0796e3          	bnez	a5,2cb0 <_malloc_r+0x550>
    2cc8:	0049a703          	lw	a4,4(s3)
    2ccc:	fff64793          	not	a5,a2
    2cd0:	00e7f7b3          	and	a5,a5,a4
    2cd4:	00f9a223          	sw	a5,4(s3)
    2cd8:	00161613          	sll	a2,a2,0x1
    2cdc:	ccc7eee3          	bltu	a5,a2,29b8 <_malloc_r+0x258>
    2ce0:	cc060ce3          	beqz	a2,29b8 <_malloc_r+0x258>
    2ce4:	00f67733          	and	a4,a2,a5
    2ce8:	00071a63          	bnez	a4,2cfc <_malloc_r+0x59c>
    2cec:	00161613          	sll	a2,a2,0x1
    2cf0:	00f67733          	and	a4,a2,a5
    2cf4:	004e0e13          	add	t3,t3,4
    2cf8:	fe070ae3          	beqz	a4,2cec <_malloc_r+0x58c>
    2cfc:	000e0593          	mv	a1,t3
    2d00:	c39ff06f          	j	2938 <_malloc_r+0x1d8>
    2d04:	80067c17          	auipc	s8,0x80067
    2d08:	84cc0c13          	add	s8,s8,-1972 # 80069550 <__malloc_current_mallinfo>
    2d0c:	000c2703          	lw	a4,0(s8)
    2d10:	00ea8733          	add	a4,s5,a4
    2d14:	00ec2023          	sw	a4,0(s8)
    2d18:	000ca683          	lw	a3,0(s9)
    2d1c:	fff00793          	li	a5,-1
    2d20:	18f68663          	beq	a3,a5,2eac <_malloc_r+0x74c>
    2d24:	414b87b3          	sub	a5,s7,s4
    2d28:	00e787b3          	add	a5,a5,a4
    2d2c:	00fc2023          	sw	a5,0(s8)
    2d30:	007bfc93          	and	s9,s7,7
    2d34:	0c0c8c63          	beqz	s9,2e0c <_malloc_r+0x6ac>
    2d38:	419b8bb3          	sub	s7,s7,s9
    2d3c:	000017b7          	lui	a5,0x1
    2d40:	00878793          	add	a5,a5,8 # 1008 <dump_first_mismatch.isra.0+0xc8>
    2d44:	008b8b93          	add	s7,s7,8
    2d48:	419785b3          	sub	a1,a5,s9
    2d4c:	015b8ab3          	add	s5,s7,s5
    2d50:	415585b3          	sub	a1,a1,s5
    2d54:	01459593          	sll	a1,a1,0x14
    2d58:	0145da13          	srl	s4,a1,0x14
    2d5c:	000a0593          	mv	a1,s4
    2d60:	00090513          	mv	a0,s2
    2d64:	719050ef          	jal	8c7c <_sbrk_r>
    2d68:	fff00793          	li	a5,-1
    2d6c:	18f50063          	beq	a0,a5,2eec <_malloc_r+0x78c>
    2d70:	41750533          	sub	a0,a0,s7
    2d74:	01450ab3          	add	s5,a0,s4
    2d78:	000c2703          	lw	a4,0(s8)
    2d7c:	0179a423          	sw	s7,8(s3)
    2d80:	001ae793          	or	a5,s5,1
    2d84:	00ea05b3          	add	a1,s4,a4
    2d88:	00bc2023          	sw	a1,0(s8)
    2d8c:	00fba223          	sw	a5,4(s7)
    2d90:	cf3402e3          	beq	s0,s3,2a74 <_malloc_r+0x314>
    2d94:	00f00693          	li	a3,15
    2d98:	0b66f063          	bgeu	a3,s6,2e38 <_malloc_r+0x6d8>
    2d9c:	00442703          	lw	a4,4(s0)
    2da0:	ff4b0793          	add	a5,s6,-12
    2da4:	ff87f793          	and	a5,a5,-8
    2da8:	00177713          	and	a4,a4,1
    2dac:	00f76733          	or	a4,a4,a5
    2db0:	00e42223          	sw	a4,4(s0)
    2db4:	00500613          	li	a2,5
    2db8:	00f40733          	add	a4,s0,a5
    2dbc:	00c72223          	sw	a2,4(a4)
    2dc0:	00c72423          	sw	a2,8(a4)
    2dc4:	00f6e663          	bltu	a3,a5,2dd0 <_malloc_r+0x670>
    2dc8:	004ba783          	lw	a5,4(s7)
    2dcc:	ca9ff06f          	j	2a74 <_malloc_r+0x314>
    2dd0:	00840593          	add	a1,s0,8
    2dd4:	00090513          	mv	a0,s2
    2dd8:	e7cff0ef          	jal	2454 <_free_r>
    2ddc:	0089ab83          	lw	s7,8(s3)
    2de0:	000c2583          	lw	a1,0(s8)
    2de4:	004ba783          	lw	a5,4(s7)
    2de8:	c8dff06f          	j	2a74 <_malloc_r+0x314>
    2dec:	010a8a93          	add	s5,s5,16
    2df0:	c31ff06f          	j	2a20 <_malloc_r+0x2c0>
    2df4:	4026d693          	sra	a3,a3,0x2
    2df8:	00100793          	li	a5,1
    2dfc:	00d797b3          	sll	a5,a5,a3
    2e00:	00f56533          	or	a0,a0,a5
    2e04:	00a9a223          	sw	a0,4(s3)
    2e08:	d71ff06f          	j	2b78 <_malloc_r+0x418>
    2e0c:	015b85b3          	add	a1,s7,s5
    2e10:	40b005b3          	neg	a1,a1
    2e14:	01459593          	sll	a1,a1,0x14
    2e18:	0145da13          	srl	s4,a1,0x14
    2e1c:	000a0593          	mv	a1,s4
    2e20:	00090513          	mv	a0,s2
    2e24:	659050ef          	jal	8c7c <_sbrk_r>
    2e28:	fff00793          	li	a5,-1
    2e2c:	f4f512e3          	bne	a0,a5,2d70 <_malloc_r+0x610>
    2e30:	00000a13          	li	s4,0
    2e34:	f45ff06f          	j	2d78 <_malloc_r+0x618>
    2e38:	00812c03          	lw	s8,8(sp)
    2e3c:	00100793          	li	a5,1
    2e40:	00fba223          	sw	a5,4(s7)
    2e44:	00090513          	mv	a0,s2
    2e48:	104000ef          	jal	2f4c <__malloc_unlock>
    2e4c:	00000513          	li	a0,0
    2e50:	01812a03          	lw	s4,24(sp)
    2e54:	01412a83          	lw	s5,20(sp)
    2e58:	01012b03          	lw	s6,16(sp)
    2e5c:	00c12b83          	lw	s7,12(sp)
    2e60:	00412c83          	lw	s9,4(sp)
    2e64:	989ff06f          	j	27ec <_malloc_r+0x8c>
    2e68:	05400693          	li	a3,84
    2e6c:	04e6e463          	bltu	a3,a4,2eb4 <_malloc_r+0x754>
    2e70:	00c7d713          	srl	a4,a5,0xc
    2e74:	06f70613          	add	a2,a4,111
    2e78:	06e70693          	add	a3,a4,110
    2e7c:	00361613          	sll	a2,a2,0x3
    2e80:	ccdff06f          	j	2b4c <_malloc_r+0x3ec>
    2e84:	15400713          	li	a4,340
    2e88:	04f76463          	bltu	a4,a5,2ed0 <_malloc_r+0x770>
    2e8c:	00f4d793          	srl	a5,s1,0xf
    2e90:	07878593          	add	a1,a5,120
    2e94:	07778813          	add	a6,a5,119
    2e98:	00359613          	sll	a2,a1,0x3
    2e9c:	9a5ff06f          	j	2840 <_malloc_r+0xe0>
    2ea0:	0089a403          	lw	s0,8(s3)
    2ea4:	00442783          	lw	a5,4(s0)
    2ea8:	bfdff06f          	j	2aa4 <_malloc_r+0x344>
    2eac:	017ca023          	sw	s7,0(s9)
    2eb0:	e81ff06f          	j	2d30 <_malloc_r+0x5d0>
    2eb4:	15400693          	li	a3,340
    2eb8:	04e6e463          	bltu	a3,a4,2f00 <_malloc_r+0x7a0>
    2ebc:	00f7d713          	srl	a4,a5,0xf
    2ec0:	07870613          	add	a2,a4,120
    2ec4:	07770693          	add	a3,a4,119
    2ec8:	00361613          	sll	a2,a2,0x3
    2ecc:	c81ff06f          	j	2b4c <_malloc_r+0x3ec>
    2ed0:	55400713          	li	a4,1364
    2ed4:	04f76463          	bltu	a4,a5,2f1c <_malloc_r+0x7bc>
    2ed8:	0124d793          	srl	a5,s1,0x12
    2edc:	07d78593          	add	a1,a5,125
    2ee0:	07c78813          	add	a6,a5,124
    2ee4:	00359613          	sll	a2,a1,0x3
    2ee8:	959ff06f          	j	2840 <_malloc_r+0xe0>
    2eec:	ff8c8c93          	add	s9,s9,-8
    2ef0:	019a8ab3          	add	s5,s5,s9
    2ef4:	417a8ab3          	sub	s5,s5,s7
    2ef8:	00000a13          	li	s4,0
    2efc:	e7dff06f          	j	2d78 <_malloc_r+0x618>
    2f00:	55400693          	li	a3,1364
    2f04:	02e6e463          	bltu	a3,a4,2f2c <_malloc_r+0x7cc>
    2f08:	0127d713          	srl	a4,a5,0x12
    2f0c:	07d70613          	add	a2,a4,125
    2f10:	07c70693          	add	a3,a4,124
    2f14:	00361613          	sll	a2,a2,0x3
    2f18:	c35ff06f          	j	2b4c <_malloc_r+0x3ec>
    2f1c:	3f800613          	li	a2,1016
    2f20:	07f00593          	li	a1,127
    2f24:	07e00813          	li	a6,126
    2f28:	919ff06f          	j	2840 <_malloc_r+0xe0>
    2f2c:	3f800613          	li	a2,1016
    2f30:	07e00693          	li	a3,126
    2f34:	c19ff06f          	j	2b4c <_malloc_r+0x3ec>
    2f38:	0049a783          	lw	a5,4(s3)
    2f3c:	d9dff06f          	j	2cd8 <_malloc_r+0x578>

00002f40 <__malloc_lock>:
    2f40:	7fffd517          	auipc	a0,0x7fffd
    2f44:	7e050513          	add	a0,a0,2016 # 80000720 <__lock___malloc_recursive_mutex>
    2f48:	8b4ff06f          	j	1ffc <__retarget_lock_acquire_recursive>

00002f4c <__malloc_unlock>:
    2f4c:	7fffd517          	auipc	a0,0x7fffd
    2f50:	7d450513          	add	a0,a0,2004 # 80000720 <__lock___malloc_recursive_mutex>
    2f54:	8acff06f          	j	2000 <__retarget_lock_release_recursive>

00002f58 <_vfprintf_r>:
    2f58:	e7010113          	add	sp,sp,-400
    2f5c:	18112623          	sw	ra,396(sp)
    2f60:	00b12423          	sw	a1,8(sp)
    2f64:	00c12623          	sw	a2,12(sp)
    2f68:	00d12a23          	sw	a3,20(sp)
    2f6c:	17312e23          	sw	s3,380(sp)
    2f70:	18812423          	sw	s0,392(sp)
    2f74:	00050993          	mv	s3,a0
    2f78:	3d9050ef          	jal	8b50 <_localeconv_r>
    2f7c:	00052783          	lw	a5,0(a0)
    2f80:	00078513          	mv	a0,a5
    2f84:	02f12a23          	sw	a5,52(sp)
    2f88:	afcff0ef          	jal	2284 <strlen>
    2f8c:	00050713          	mv	a4,a0
    2f90:	00800613          	li	a2,8
    2f94:	00000593          	li	a1,0
    2f98:	09010513          	add	a0,sp,144
    2f9c:	02e12823          	sw	a4,48(sp)
    2fa0:	864ff0ef          	jal	2004 <memset>
    2fa4:	00c12783          	lw	a5,12(sp)
    2fa8:	00098863          	beqz	s3,2fb8 <_vfprintf_r+0x60>
    2fac:	0349a703          	lw	a4,52(s3)
    2fb0:	00071463          	bnez	a4,2fb8 <_vfprintf_r+0x60>
    2fb4:	29d0106f          	j	4a50 <_vfprintf_r+0x1af8>
    2fb8:	00812703          	lw	a4,8(sp)
    2fbc:	06472683          	lw	a3,100(a4)
    2fc0:	00c71703          	lh	a4,12(a4)
    2fc4:	0016f693          	and	a3,a3,1
    2fc8:	00069863          	bnez	a3,2fd8 <_vfprintf_r+0x80>
    2fcc:	20077693          	and	a3,a4,512
    2fd0:	00069463          	bnez	a3,2fd8 <_vfprintf_r+0x80>
    2fd4:	3ec0106f          	j	43c0 <_vfprintf_r+0x1468>
    2fd8:	01271693          	sll	a3,a4,0x12
    2fdc:	0206c863          	bltz	a3,300c <_vfprintf_r+0xb4>
    2fe0:	00812503          	lw	a0,8(sp)
    2fe4:	000025b7          	lui	a1,0x2
    2fe8:	ffffe637          	lui	a2,0xffffe
    2fec:	06452683          	lw	a3,100(a0)
    2ff0:	00b76733          	or	a4,a4,a1
    2ff4:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    2ff8:	01071713          	sll	a4,a4,0x10
    2ffc:	41075713          	sra	a4,a4,0x10
    3000:	00c6f6b3          	and	a3,a3,a2
    3004:	00e51623          	sh	a4,12(a0)
    3008:	06d52223          	sw	a3,100(a0)
    300c:	00877693          	and	a3,a4,8
    3010:	2a068063          	beqz	a3,32b0 <_vfprintf_r+0x358>
    3014:	00812683          	lw	a3,8(sp)
    3018:	0106a683          	lw	a3,16(a3)
    301c:	28068a63          	beqz	a3,32b0 <_vfprintf_r+0x358>
    3020:	01a77693          	and	a3,a4,26
    3024:	00a00613          	li	a2,10
    3028:	2ac68c63          	beq	a3,a2,32e0 <_vfprintf_r+0x388>
    302c:	0ac10713          	add	a4,sp,172
    3030:	17512a23          	sw	s5,372(sp)
    3034:	17812423          	sw	s8,360(sp)
    3038:	15b12e23          	sw	s11,348(sp)
    303c:	18912223          	sw	s1,388(sp)
    3040:	19212023          	sw	s2,384(sp)
    3044:	17412c23          	sw	s4,376(sp)
    3048:	17612823          	sw	s6,368(sp)
    304c:	17712623          	sw	s7,364(sp)
    3050:	17912223          	sw	s9,356(sp)
    3054:	17a12023          	sw	s10,352(sp)
    3058:	0ae12023          	sw	a4,160(sp)
    305c:	0a012423          	sw	zero,168(sp)
    3060:	0a012223          	sw	zero,164(sp)
    3064:	00012c23          	sw	zero,24(sp)
    3068:	02012423          	sw	zero,40(sp)
    306c:	02012623          	sw	zero,44(sp)
    3070:	00070413          	mv	s0,a4
    3074:	02012c23          	sw	zero,56(sp)
    3078:	04012023          	sw	zero,64(sp)
    307c:	02012e23          	sw	zero,60(sp)
    3080:	04012623          	sw	zero,76(sp)
    3084:	04012423          	sw	zero,72(sp)
    3088:	00012623          	sw	zero,12(sp)
    308c:	7fffda97          	auipc	s5,0x7fffd
    3090:	4a8a8a93          	add	s5,s5,1192 # 80000534 <__global_locale>
    3094:	02500d93          	li	s11,37
    3098:	00078c13          	mv	s8,a5
    309c:	000c0913          	mv	s2,s8
    30a0:	0e4aa483          	lw	s1,228(s5)
    30a4:	2a1050ef          	jal	8b44 <__locale_mb_cur_max>
    30a8:	00050693          	mv	a3,a0
    30ac:	09010713          	add	a4,sp,144
    30b0:	00090613          	mv	a2,s2
    30b4:	08010593          	add	a1,sp,128
    30b8:	00098513          	mv	a0,s3
    30bc:	000480e7          	jalr	s1
    30c0:	2c050a63          	beqz	a0,3394 <_vfprintf_r+0x43c>
    30c4:	2a054a63          	bltz	a0,3378 <_vfprintf_r+0x420>
    30c8:	08012783          	lw	a5,128(sp)
    30cc:	01b78663          	beq	a5,s11,30d8 <_vfprintf_r+0x180>
    30d0:	00a90933          	add	s2,s2,a0
    30d4:	fcdff06f          	j	30a0 <_vfprintf_r+0x148>
    30d8:	00050493          	mv	s1,a0
    30dc:	41890cb3          	sub	s9,s2,s8
    30e0:	2d891063          	bne	s2,s8,33a0 <_vfprintf_r+0x448>
    30e4:	fff00313          	li	t1,-1
    30e8:	00000e93          	li	t4,0
    30ec:	00194e03          	lbu	t3,1(s2)
    30f0:	06010ba3          	sb	zero,119(sp)
    30f4:	00190913          	add	s2,s2,1
    30f8:	00000b93          	li	s7,0
    30fc:	05a00493          	li	s1,90
    3100:	000e8a13          	mv	s4,t4
    3104:	00030b13          	mv	s6,t1
    3108:	00190913          	add	s2,s2,1
    310c:	fe0e0793          	add	a5,t3,-32
    3110:	04f4ea63          	bltu	s1,a5,3164 <_vfprintf_r+0x20c>
    3114:	0000d717          	auipc	a4,0xd
    3118:	45c70713          	add	a4,a4,1116 # 10570 <_ctype_+0x104>
    311c:	00279793          	sll	a5,a5,0x2
    3120:	00e787b3          	add	a5,a5,a4
    3124:	0007a783          	lw	a5,0(a5)
    3128:	00e787b3          	add	a5,a5,a4
    312c:	00078067          	jr	a5
    3130:	00000b93          	li	s7,0
    3134:	fd0e0713          	add	a4,t3,-48
    3138:	00900693          	li	a3,9
    313c:	00094e03          	lbu	t3,0(s2)
    3140:	002b9793          	sll	a5,s7,0x2
    3144:	017787b3          	add	a5,a5,s7
    3148:	00179793          	sll	a5,a5,0x1
    314c:	00f70bb3          	add	s7,a4,a5
    3150:	fd0e0713          	add	a4,t3,-48
    3154:	00190913          	add	s2,s2,1
    3158:	fee6f2e3          	bgeu	a3,a4,313c <_vfprintf_r+0x1e4>
    315c:	fe0e0793          	add	a5,t3,-32
    3160:	faf4fae3          	bgeu	s1,a5,3114 <_vfprintf_r+0x1bc>
    3164:	000a0e93          	mv	t4,s4
    3168:	260e0a63          	beqz	t3,33dc <_vfprintf_r+0x484>
    316c:	0fc10623          	sb	t3,236(sp)
    3170:	06010ba3          	sb	zero,119(sp)
    3174:	00100c93          	li	s9,1
    3178:	00000613          	li	a2,0
    317c:	00012823          	sw	zero,16(sp)
    3180:	00100d13          	li	s10,1
    3184:	00000313          	li	t1,0
    3188:	02012223          	sw	zero,36(sp)
    318c:	02012023          	sw	zero,32(sp)
    3190:	00000a13          	li	s4,0
    3194:	0ec10c13          	add	s8,sp,236
    3198:	002ef293          	and	t0,t4,2
    319c:	00028463          	beqz	t0,31a4 <_vfprintf_r+0x24c>
    31a0:	002c8c93          	add	s9,s9,2
    31a4:	084eff93          	and	t6,t4,132
    31a8:	0a812483          	lw	s1,168(sp)
    31ac:	000f9663          	bnez	t6,31b8 <_vfprintf_r+0x260>
    31b0:	419b8733          	sub	a4,s7,s9
    31b4:	40e04663          	bgtz	a4,35c0 <_vfprintf_r+0x668>
    31b8:	02060a63          	beqz	a2,31ec <_vfprintf_r+0x294>
    31bc:	0a412703          	lw	a4,164(sp)
    31c0:	07710613          	add	a2,sp,119
    31c4:	00148493          	add	s1,s1,1
    31c8:	00170713          	add	a4,a4,1
    31cc:	00100793          	li	a5,1
    31d0:	00c42023          	sw	a2,0(s0)
    31d4:	00f42223          	sw	a5,4(s0)
    31d8:	0a912423          	sw	s1,168(sp)
    31dc:	0ae12223          	sw	a4,164(sp)
    31e0:	00700613          	li	a2,7
    31e4:	00840413          	add	s0,s0,8
    31e8:	4ce64863          	blt	a2,a4,36b8 <_vfprintf_r+0x760>
    31ec:	02028a63          	beqz	t0,3220 <_vfprintf_r+0x2c8>
    31f0:	0a412703          	lw	a4,164(sp)
    31f4:	07810613          	add	a2,sp,120
    31f8:	00c42023          	sw	a2,0(s0)
    31fc:	00248493          	add	s1,s1,2
    3200:	00200613          	li	a2,2
    3204:	00170713          	add	a4,a4,1
    3208:	00c42223          	sw	a2,4(s0)
    320c:	0a912423          	sw	s1,168(sp)
    3210:	0ae12223          	sw	a4,164(sp)
    3214:	00700613          	li	a2,7
    3218:	00840413          	add	s0,s0,8
    321c:	5ce644e3          	blt	a2,a4,3fe4 <_vfprintf_r+0x108c>
    3220:	08000713          	li	a4,128
    3224:	3aef80e3          	beq	t6,a4,3dc4 <_vfprintf_r+0xe6c>
    3228:	41a30b33          	sub	s6,t1,s10
    322c:	4b604ae3          	bgtz	s6,3ee0 <_vfprintf_r+0xf88>
    3230:	100ef713          	and	a4,t4,256
    3234:	1a0710e3          	bnez	a4,3bd4 <_vfprintf_r+0xc7c>
    3238:	0a412783          	lw	a5,164(sp)
    323c:	01a484b3          	add	s1,s1,s10
    3240:	01842023          	sw	s8,0(s0)
    3244:	00178793          	add	a5,a5,1
    3248:	01a42223          	sw	s10,4(s0)
    324c:	0a912423          	sw	s1,168(sp)
    3250:	0af12223          	sw	a5,164(sp)
    3254:	00700713          	li	a4,7
    3258:	58f74c63          	blt	a4,a5,37f0 <_vfprintf_r+0x898>
    325c:	00840413          	add	s0,s0,8
    3260:	004eff13          	and	t5,t4,4
    3264:	000f0663          	beqz	t5,3270 <_vfprintf_r+0x318>
    3268:	419b8d33          	sub	s10,s7,s9
    326c:	5ba04ce3          	bgtz	s10,4024 <_vfprintf_r+0x10cc>
    3270:	000b8e93          	mv	t4,s7
    3274:	019bd463          	bge	s7,s9,327c <_vfprintf_r+0x324>
    3278:	000c8e93          	mv	t4,s9
    327c:	00c12783          	lw	a5,12(sp)
    3280:	01d787b3          	add	a5,a5,t4
    3284:	00f12623          	sw	a5,12(sp)
    3288:	18049663          	bnez	s1,3414 <_vfprintf_r+0x4bc>
    328c:	01012783          	lw	a5,16(sp)
    3290:	0a012223          	sw	zero,164(sp)
    3294:	00078863          	beqz	a5,32a4 <_vfprintf_r+0x34c>
    3298:	01012583          	lw	a1,16(sp)
    329c:	00098513          	mv	a0,s3
    32a0:	9b4ff0ef          	jal	2454 <_free_r>
    32a4:	0ac10413          	add	s0,sp,172
    32a8:	00090c13          	mv	s8,s2
    32ac:	df1ff06f          	j	309c <_vfprintf_r+0x144>
    32b0:	00812403          	lw	s0,8(sp)
    32b4:	00098513          	mv	a0,s3
    32b8:	00f12623          	sw	a5,12(sp)
    32bc:	00040593          	mv	a1,s0
    32c0:	3a4050ef          	jal	8664 <__swsetup_r>
    32c4:	00050463          	beqz	a0,32cc <_vfprintf_r+0x374>
    32c8:	5600206f          	j	5828 <_vfprintf_r+0x28d0>
    32cc:	00c41703          	lh	a4,12(s0)
    32d0:	00a00613          	li	a2,10
    32d4:	00c12783          	lw	a5,12(sp)
    32d8:	01a77693          	and	a3,a4,26
    32dc:	d4c698e3          	bne	a3,a2,302c <_vfprintf_r+0xd4>
    32e0:	00812603          	lw	a2,8(sp)
    32e4:	00e61683          	lh	a3,14(a2)
    32e8:	d406c2e3          	bltz	a3,302c <_vfprintf_r+0xd4>
    32ec:	06462683          	lw	a3,100(a2)
    32f0:	0016f693          	and	a3,a3,1
    32f4:	00069863          	bnez	a3,3304 <_vfprintf_r+0x3ac>
    32f8:	20077713          	and	a4,a4,512
    32fc:	00071463          	bnez	a4,3304 <_vfprintf_r+0x3ac>
    3300:	53d0106f          	j	503c <_vfprintf_r+0x20e4>
    3304:	01412683          	lw	a3,20(sp)
    3308:	00812583          	lw	a1,8(sp)
    330c:	00098513          	mv	a0,s3
    3310:	00078613          	mv	a2,a5
    3314:	0e5020ef          	jal	5bf8 <__sbprintf>
    3318:	18c12083          	lw	ra,396(sp)
    331c:	18812403          	lw	s0,392(sp)
    3320:	00a12623          	sw	a0,12(sp)
    3324:	00c12503          	lw	a0,12(sp)
    3328:	17c12983          	lw	s3,380(sp)
    332c:	19010113          	add	sp,sp,400
    3330:	00008067          	ret
    3334:	00098513          	mv	a0,s3
    3338:	019050ef          	jal	8b50 <_localeconv_r>
    333c:	00452783          	lw	a5,4(a0)
    3340:	00078513          	mv	a0,a5
    3344:	04f12423          	sw	a5,72(sp)
    3348:	f3dfe0ef          	jal	2284 <strlen>
    334c:	00050793          	mv	a5,a0
    3350:	00098513          	mv	a0,s3
    3354:	00078c93          	mv	s9,a5
    3358:	04f12623          	sw	a5,76(sp)
    335c:	7f4050ef          	jal	8b50 <_localeconv_r>
    3360:	00852703          	lw	a4,8(a0)
    3364:	02e12e23          	sw	a4,60(sp)
    3368:	000c8463          	beqz	s9,3370 <_vfprintf_r+0x418>
    336c:	1ec0106f          	j	4558 <_vfprintf_r+0x1600>
    3370:	00094e03          	lbu	t3,0(s2)
    3374:	d95ff06f          	j	3108 <_vfprintf_r+0x1b0>
    3378:	00800613          	li	a2,8
    337c:	00000593          	li	a1,0
    3380:	09010513          	add	a0,sp,144
    3384:	c81fe0ef          	jal	2004 <memset>
    3388:	00100513          	li	a0,1
    338c:	00a90933          	add	s2,s2,a0
    3390:	d11ff06f          	j	30a0 <_vfprintf_r+0x148>
    3394:	00050493          	mv	s1,a0
    3398:	41890cb3          	sub	s9,s2,s8
    339c:	05890063          	beq	s2,s8,33dc <_vfprintf_r+0x484>
    33a0:	0a812683          	lw	a3,168(sp)
    33a4:	0a412703          	lw	a4,164(sp)
    33a8:	01842023          	sw	s8,0(s0)
    33ac:	019686b3          	add	a3,a3,s9
    33b0:	00170713          	add	a4,a4,1
    33b4:	01942223          	sw	s9,4(s0)
    33b8:	0ad12423          	sw	a3,168(sp)
    33bc:	0ae12223          	sw	a4,164(sp)
    33c0:	00700693          	li	a3,7
    33c4:	00840413          	add	s0,s0,8
    33c8:	02e6c863          	blt	a3,a4,33f8 <_vfprintf_r+0x4a0>
    33cc:	00c12783          	lw	a5,12(sp)
    33d0:	019787b3          	add	a5,a5,s9
    33d4:	00f12623          	sw	a5,12(sp)
    33d8:	d00496e3          	bnez	s1,30e4 <_vfprintf_r+0x18c>
    33dc:	0a812783          	lw	a5,168(sp)
    33e0:	00078463          	beqz	a5,33e8 <_vfprintf_r+0x490>
    33e4:	4090106f          	j	4fec <_vfprintf_r+0x2094>
    33e8:	00812783          	lw	a5,8(sp)
    33ec:	0a012223          	sw	zero,164(sp)
    33f0:	00c79783          	lh	a5,12(a5)
    33f4:	0500006f          	j	3444 <_vfprintf_r+0x4ec>
    33f8:	00812583          	lw	a1,8(sp)
    33fc:	0a010613          	add	a2,sp,160
    3400:	00098513          	mv	a0,s3
    3404:	211020ef          	jal	5e14 <__sprint_r>
    3408:	02051a63          	bnez	a0,343c <_vfprintf_r+0x4e4>
    340c:	0ac10413          	add	s0,sp,172
    3410:	fbdff06f          	j	33cc <_vfprintf_r+0x474>
    3414:	00812583          	lw	a1,8(sp)
    3418:	0a010613          	add	a2,sp,160
    341c:	00098513          	mv	a0,s3
    3420:	1f5020ef          	jal	5e14 <__sprint_r>
    3424:	e60504e3          	beqz	a0,328c <_vfprintf_r+0x334>
    3428:	01012283          	lw	t0,16(sp)
    342c:	00028863          	beqz	t0,343c <_vfprintf_r+0x4e4>
    3430:	00028593          	mv	a1,t0
    3434:	00098513          	mv	a0,s3
    3438:	81cff0ef          	jal	2454 <_free_r>
    343c:	00812783          	lw	a5,8(sp)
    3440:	00c79783          	lh	a5,12(a5)
    3444:	00812703          	lw	a4,8(sp)
    3448:	06472703          	lw	a4,100(a4)
    344c:	00177713          	and	a4,a4,1
    3450:	3c070463          	beqz	a4,3818 <_vfprintf_r+0x8c0>
    3454:	0407f793          	and	a5,a5,64
    3458:	18412483          	lw	s1,388(sp)
    345c:	18012903          	lw	s2,384(sp)
    3460:	17812a03          	lw	s4,376(sp)
    3464:	17412a83          	lw	s5,372(sp)
    3468:	17012b03          	lw	s6,368(sp)
    346c:	16c12b83          	lw	s7,364(sp)
    3470:	16812c03          	lw	s8,360(sp)
    3474:	16412c83          	lw	s9,356(sp)
    3478:	16012d03          	lw	s10,352(sp)
    347c:	15c12d83          	lw	s11,348(sp)
    3480:	00078463          	beqz	a5,3488 <_vfprintf_r+0x530>
    3484:	3d00206f          	j	5854 <_vfprintf_r+0x28fc>
    3488:	18c12083          	lw	ra,396(sp)
    348c:	18812403          	lw	s0,392(sp)
    3490:	00c12503          	lw	a0,12(sp)
    3494:	17c12983          	lw	s3,380(sp)
    3498:	19010113          	add	sp,sp,400
    349c:	00008067          	ret
    34a0:	008a7713          	and	a4,s4,8
    34a4:	000a0e93          	mv	t4,s4
    34a8:	000b0313          	mv	t1,s6
    34ac:	00070463          	beqz	a4,34b4 <_vfprintf_r+0x55c>
    34b0:	0200106f          	j	44d0 <_vfprintf_r+0x1578>
    34b4:	01412783          	lw	a5,20(sp)
    34b8:	00778b13          	add	s6,a5,7
    34bc:	ff8b7b13          	and	s6,s6,-8
    34c0:	000b2783          	lw	a5,0(s6)
    34c4:	02f12423          	sw	a5,40(sp)
    34c8:	004b2783          	lw	a5,4(s6)
    34cc:	02f12623          	sw	a5,44(sp)
    34d0:	008b0793          	add	a5,s6,8
    34d4:	00f12a23          	sw	a5,20(sp)
    34d8:	02c12a03          	lw	s4,44(sp)
    34dc:	7fffd717          	auipc	a4,0x7fffd
    34e0:	1c470713          	add	a4,a4,452 # 800006a0 <__global_locale+0x16c>
    34e4:	00072c83          	lw	s9,0(a4)
    34e8:	00472d03          	lw	s10,4(a4)
    34ec:	02812b03          	lw	s6,40(sp)
    34f0:	001a1493          	sll	s1,s4,0x1
    34f4:	0014d493          	srl	s1,s1,0x1
    34f8:	000b0513          	mv	a0,s6
    34fc:	00048593          	mv	a1,s1
    3500:	000c8613          	mv	a2,s9
    3504:	000d0693          	mv	a3,s10
    3508:	02612223          	sw	t1,36(sp)
    350c:	03c12023          	sw	t3,32(sp)
    3510:	01d12823          	sw	t4,16(sp)
    3514:	26c0c0ef          	jal	f780 <__unorddf2>
    3518:	01012e83          	lw	t4,16(sp)
    351c:	02012e03          	lw	t3,32(sp)
    3520:	02412303          	lw	t1,36(sp)
    3524:	00050463          	beqz	a0,352c <_vfprintf_r+0x5d4>
    3528:	4080106f          	j	4930 <_vfprintf_r+0x19d8>
    352c:	000b0513          	mv	a0,s6
    3530:	00048593          	mv	a1,s1
    3534:	000c8613          	mv	a2,s9
    3538:	000d0693          	mv	a3,s10
    353c:	0a40b0ef          	jal	e5e0 <__ledf2>
    3540:	01012e83          	lw	t4,16(sp)
    3544:	02012e03          	lw	t3,32(sp)
    3548:	02412303          	lw	t1,36(sp)
    354c:	00a04463          	bgtz	a0,3554 <_vfprintf_r+0x5fc>
    3550:	3e00106f          	j	4930 <_vfprintf_r+0x19d8>
    3554:	000b0513          	mv	a0,s6
    3558:	000a0593          	mv	a1,s4
    355c:	00000613          	li	a2,0
    3560:	00000693          	li	a3,0
    3564:	07c0b0ef          	jal	e5e0 <__ledf2>
    3568:	01012e83          	lw	t4,16(sp)
    356c:	02012e03          	lw	t3,32(sp)
    3570:	00055463          	bgez	a0,3578 <_vfprintf_r+0x620>
    3574:	6650106f          	j	53d8 <_vfprintf_r+0x2480>
    3578:	07714603          	lbu	a2,119(sp)
    357c:	04700713          	li	a4,71
    3580:	0000dc17          	auipc	s8,0xd
    3584:	d00c0c13          	add	s8,s8,-768 # 10280 <__fini_array_end+0x2d8>
    3588:	01c74663          	blt	a4,t3,3594 <_vfprintf_r+0x63c>
    358c:	0000dc17          	auipc	s8,0xd
    3590:	cf0c0c13          	add	s8,s8,-784 # 1027c <__fini_array_end+0x2d4>
    3594:	00012823          	sw	zero,16(sp)
    3598:	02012223          	sw	zero,36(sp)
    359c:	02012023          	sw	zero,32(sp)
    35a0:	f7fefe93          	and	t4,t4,-129
    35a4:	00300c93          	li	s9,3
    35a8:	00300d13          	li	s10,3
    35ac:	00000313          	li	t1,0
    35b0:	00000a13          	li	s4,0
    35b4:	be0602e3          	beqz	a2,3198 <_vfprintf_r+0x240>
    35b8:	001c8c93          	add	s9,s9,1
    35bc:	bddff06f          	j	3198 <_vfprintf_r+0x240>
    35c0:	01000593          	li	a1,16
    35c4:	0a412603          	lw	a2,164(sp)
    35c8:	0000db17          	auipc	s6,0xd
    35cc:	1bcb0b13          	add	s6,s6,444 # 10784 <blanks.1>
    35d0:	0ae5dc63          	bge	a1,a4,3688 <_vfprintf_r+0x730>
    35d4:	00040793          	mv	a5,s0
    35d8:	00048693          	mv	a3,s1
    35dc:	01000893          	li	a7,16
    35e0:	000b0493          	mv	s1,s6
    35e4:	00700393          	li	t2,7
    35e8:	000a0b13          	mv	s6,s4
    35ec:	04512223          	sw	t0,68(sp)
    35f0:	05f12823          	sw	t6,80(sp)
    35f4:	05d12a23          	sw	t4,84(sp)
    35f8:	05c12c23          	sw	t3,88(sp)
    35fc:	00070413          	mv	s0,a4
    3600:	00030a13          	mv	s4,t1
    3604:	00c0006f          	j	3610 <_vfprintf_r+0x6b8>
    3608:	ff040413          	add	s0,s0,-16
    360c:	0488da63          	bge	a7,s0,3660 <_vfprintf_r+0x708>
    3610:	01068693          	add	a3,a3,16
    3614:	00160613          	add	a2,a2,1
    3618:	0097a023          	sw	s1,0(a5)
    361c:	0117a223          	sw	a7,4(a5)
    3620:	0ad12423          	sw	a3,168(sp)
    3624:	0ac12223          	sw	a2,164(sp)
    3628:	00878793          	add	a5,a5,8
    362c:	fcc3dee3          	bge	t2,a2,3608 <_vfprintf_r+0x6b0>
    3630:	00812583          	lw	a1,8(sp)
    3634:	0a010613          	add	a2,sp,160
    3638:	00098513          	mv	a0,s3
    363c:	7d8020ef          	jal	5e14 <__sprint_r>
    3640:	de0514e3          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    3644:	01000893          	li	a7,16
    3648:	ff040413          	add	s0,s0,-16
    364c:	0a812683          	lw	a3,168(sp)
    3650:	0a412603          	lw	a2,164(sp)
    3654:	0ac10793          	add	a5,sp,172
    3658:	00700393          	li	t2,7
    365c:	fa88cae3          	blt	a7,s0,3610 <_vfprintf_r+0x6b8>
    3660:	04412283          	lw	t0,68(sp)
    3664:	05012f83          	lw	t6,80(sp)
    3668:	05412e83          	lw	t4,84(sp)
    366c:	05812e03          	lw	t3,88(sp)
    3670:	000a0313          	mv	t1,s4
    3674:	00040713          	mv	a4,s0
    3678:	000b0a13          	mv	s4,s6
    367c:	00078413          	mv	s0,a5
    3680:	00048b13          	mv	s6,s1
    3684:	00068493          	mv	s1,a3
    3688:	00e484b3          	add	s1,s1,a4
    368c:	00160613          	add	a2,a2,1
    3690:	00e42223          	sw	a4,4(s0)
    3694:	01642023          	sw	s6,0(s0)
    3698:	0a912423          	sw	s1,168(sp)
    369c:	0ac12223          	sw	a2,164(sp)
    36a0:	00700713          	li	a4,7
    36a4:	00c75463          	bge	a4,a2,36ac <_vfprintf_r+0x754>
    36a8:	2380106f          	j	48e0 <_vfprintf_r+0x1988>
    36ac:	07714603          	lbu	a2,119(sp)
    36b0:	00840413          	add	s0,s0,8
    36b4:	b05ff06f          	j	31b8 <_vfprintf_r+0x260>
    36b8:	00812583          	lw	a1,8(sp)
    36bc:	0a010613          	add	a2,sp,160
    36c0:	00098513          	mv	a0,s3
    36c4:	04612e23          	sw	t1,92(sp)
    36c8:	05c12c23          	sw	t3,88(sp)
    36cc:	05d12a23          	sw	t4,84(sp)
    36d0:	05f12823          	sw	t6,80(sp)
    36d4:	04512223          	sw	t0,68(sp)
    36d8:	73c020ef          	jal	5e14 <__sprint_r>
    36dc:	d40516e3          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    36e0:	0a812483          	lw	s1,168(sp)
    36e4:	05c12303          	lw	t1,92(sp)
    36e8:	05812e03          	lw	t3,88(sp)
    36ec:	05412e83          	lw	t4,84(sp)
    36f0:	05012f83          	lw	t6,80(sp)
    36f4:	04412283          	lw	t0,68(sp)
    36f8:	0ac10413          	add	s0,sp,172
    36fc:	af1ff06f          	j	31ec <_vfprintf_r+0x294>
    3700:	0a412d03          	lw	s10,164(sp)
    3704:	01812783          	lw	a5,24(sp)
    3708:	00100693          	li	a3,1
    370c:	01842023          	sw	s8,0(s0)
    3710:	00148493          	add	s1,s1,1
    3714:	001d0d13          	add	s10,s10,1
    3718:	00840b13          	add	s6,s0,8
    371c:	32f6d0e3          	bge	a3,a5,423c <_vfprintf_r+0x12e4>
    3720:	00100693          	li	a3,1
    3724:	00d42223          	sw	a3,4(s0)
    3728:	0a912423          	sw	s1,168(sp)
    372c:	0ba12223          	sw	s10,164(sp)
    3730:	00700693          	li	a3,7
    3734:	01a6d463          	bge	a3,s10,373c <_vfprintf_r+0x7e4>
    3738:	0680106f          	j	47a0 <_vfprintf_r+0x1848>
    373c:	03012783          	lw	a5,48(sp)
    3740:	03412703          	lw	a4,52(sp)
    3744:	001d0d13          	add	s10,s10,1
    3748:	00f484b3          	add	s1,s1,a5
    374c:	00eb2023          	sw	a4,0(s6)
    3750:	00fb2223          	sw	a5,4(s6)
    3754:	0a912423          	sw	s1,168(sp)
    3758:	0ba12223          	sw	s10,164(sp)
    375c:	00700693          	li	a3,7
    3760:	008b0b13          	add	s6,s6,8
    3764:	01a6d463          	bge	a3,s10,376c <_vfprintf_r+0x814>
    3768:	0680106f          	j	47d0 <_vfprintf_r+0x1878>
    376c:	02812603          	lw	a2,40(sp)
    3770:	02c12683          	lw	a3,44(sp)
    3774:	01812783          	lw	a5,24(sp)
    3778:	00060513          	mv	a0,a2
    377c:	00068593          	mv	a1,a3
    3780:	00000613          	li	a2,0
    3784:	00000693          	li	a3,0
    3788:	03d12023          	sw	t4,32(sp)
    378c:	fff78413          	add	s0,a5,-1
    3790:	4c50a0ef          	jal	e454 <__eqdf2>
    3794:	02012e83          	lw	t4,32(sp)
    3798:	2e0506e3          	beqz	a0,4284 <_vfprintf_r+0x132c>
    379c:	001c0793          	add	a5,s8,1
    37a0:	001d0d13          	add	s10,s10,1
    37a4:	008484b3          	add	s1,s1,s0
    37a8:	00fb2023          	sw	a5,0(s6)
    37ac:	008b2223          	sw	s0,4(s6)
    37b0:	0a912423          	sw	s1,168(sp)
    37b4:	0ba12223          	sw	s10,164(sp)
    37b8:	00700793          	li	a5,7
    37bc:	008b0b13          	add	s6,s6,8
    37c0:	29a7cce3          	blt	a5,s10,4258 <_vfprintf_r+0x1300>
    37c4:	04012703          	lw	a4,64(sp)
    37c8:	08810793          	add	a5,sp,136
    37cc:	001d0d13          	add	s10,s10,1
    37d0:	009704b3          	add	s1,a4,s1
    37d4:	00fb2023          	sw	a5,0(s6)
    37d8:	00eb2223          	sw	a4,4(s6)
    37dc:	0a912423          	sw	s1,168(sp)
    37e0:	0ba12223          	sw	s10,164(sp)
    37e4:	00700793          	li	a5,7
    37e8:	008b0413          	add	s0,s6,8
    37ec:	a7a7dae3          	bge	a5,s10,3260 <_vfprintf_r+0x308>
    37f0:	00812583          	lw	a1,8(sp)
    37f4:	0a010613          	add	a2,sp,160
    37f8:	00098513          	mv	a0,s3
    37fc:	03d12023          	sw	t4,32(sp)
    3800:	614020ef          	jal	5e14 <__sprint_r>
    3804:	c20512e3          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    3808:	0a812483          	lw	s1,168(sp)
    380c:	02012e83          	lw	t4,32(sp)
    3810:	0ac10413          	add	s0,sp,172
    3814:	a4dff06f          	j	3260 <_vfprintf_r+0x308>
    3818:	2007f713          	and	a4,a5,512
    381c:	c2071ce3          	bnez	a4,3454 <_vfprintf_r+0x4fc>
    3820:	00812403          	lw	s0,8(sp)
    3824:	05842503          	lw	a0,88(s0)
    3828:	fd8fe0ef          	jal	2000 <__retarget_lock_release_recursive>
    382c:	00c41783          	lh	a5,12(s0)
    3830:	c25ff06f          	j	3454 <_vfprintf_r+0x4fc>
    3834:	00094e03          	lbu	t3,0(s2)
    3838:	020a6a13          	or	s4,s4,32
    383c:	8cdff06f          	j	3108 <_vfprintf_r+0x1b0>
    3840:	01412703          	lw	a4,20(sp)
    3844:	04300793          	li	a5,67
    3848:	000a0e93          	mv	t4,s4
    384c:	00470493          	add	s1,a4,4
    3850:	64fe08e3          	beq	t3,a5,46a0 <_vfprintf_r+0x1748>
    3854:	010a7793          	and	a5,s4,16
    3858:	640794e3          	bnez	a5,46a0 <_vfprintf_r+0x1748>
    385c:	01412783          	lw	a5,20(sp)
    3860:	00100c93          	li	s9,1
    3864:	00100d13          	li	s10,1
    3868:	0007a783          	lw	a5,0(a5)
    386c:	0ec10c13          	add	s8,sp,236
    3870:	0ef10623          	sb	a5,236(sp)
    3874:	06010ba3          	sb	zero,119(sp)
    3878:	00912a23          	sw	s1,20(sp)
    387c:	00000613          	li	a2,0
    3880:	00012823          	sw	zero,16(sp)
    3884:	00000313          	li	t1,0
    3888:	02012223          	sw	zero,36(sp)
    388c:	02012023          	sw	zero,32(sp)
    3890:	00000a13          	li	s4,0
    3894:	905ff06f          	j	3198 <_vfprintf_r+0x240>
    3898:	01412783          	lw	a5,20(sp)
    389c:	06010ba3          	sb	zero,119(sp)
    38a0:	000b0313          	mv	t1,s6
    38a4:	0007ac03          	lw	s8,0(a5)
    38a8:	000a0e93          	mv	t4,s4
    38ac:	00478b13          	add	s6,a5,4
    38b0:	5a0c0ce3          	beqz	s8,4668 <_vfprintf_r+0x1710>
    38b4:	05300713          	li	a4,83
    38b8:	00ee1463          	bne	t3,a4,38c0 <_vfprintf_r+0x968>
    38bc:	1d00106f          	j	4a8c <_vfprintf_r+0x1b34>
    38c0:	010a7a13          	and	s4,s4,16
    38c4:	000a0463          	beqz	s4,38cc <_vfprintf_r+0x974>
    38c8:	1c40106f          	j	4a8c <_vfprintf_r+0x1b34>
    38cc:	00035463          	bgez	t1,38d4 <_vfprintf_r+0x97c>
    38d0:	6d40106f          	j	4fa4 <_vfprintf_r+0x204c>
    38d4:	00030613          	mv	a2,t1
    38d8:	00000593          	li	a1,0
    38dc:	000c0513          	mv	a0,s8
    38e0:	03d12023          	sw	t4,32(sp)
    38e4:	00612a23          	sw	t1,20(sp)
    38e8:	0ec050ef          	jal	89d4 <memchr>
    38ec:	00a12823          	sw	a0,16(sp)
    38f0:	01412303          	lw	t1,20(sp)
    38f4:	02012e83          	lw	t4,32(sp)
    38f8:	00051463          	bnez	a0,3900 <_vfprintf_r+0x9a8>
    38fc:	1780206f          	j	5a74 <_vfprintf_r+0x2b1c>
    3900:	01012783          	lw	a5,16(sp)
    3904:	07714603          	lbu	a2,119(sp)
    3908:	01612a23          	sw	s6,20(sp)
    390c:	41878d33          	sub	s10,a5,s8
    3910:	fffd4813          	not	a6,s10
    3914:	41f85813          	sra	a6,a6,0x1f
    3918:	02012223          	sw	zero,36(sp)
    391c:	02012023          	sw	zero,32(sp)
    3920:	00012823          	sw	zero,16(sp)
    3924:	010d7cb3          	and	s9,s10,a6
    3928:	00000313          	li	t1,0
    392c:	07300e13          	li	t3,115
    3930:	860604e3          	beqz	a2,3198 <_vfprintf_r+0x240>
    3934:	c85ff06f          	j	35b8 <_vfprintf_r+0x660>
    3938:	01412783          	lw	a5,20(sp)
    393c:	0007ab83          	lw	s7,0(a5)
    3940:	00478793          	add	a5,a5,4
    3944:	2a0bdae3          	bgez	s7,43f8 <_vfprintf_r+0x14a0>
    3948:	41700bb3          	neg	s7,s7
    394c:	00f12a23          	sw	a5,20(sp)
    3950:	00094e03          	lbu	t3,0(s2)
    3954:	004a6a13          	or	s4,s4,4
    3958:	fb0ff06f          	j	3108 <_vfprintf_r+0x1b0>
    395c:	02b00793          	li	a5,43
    3960:	00094e03          	lbu	t3,0(s2)
    3964:	06f10ba3          	sb	a5,119(sp)
    3968:	fa0ff06f          	j	3108 <_vfprintf_r+0x1b0>
    396c:	000b0313          	mv	t1,s6
    3970:	010a6613          	or	a2,s4,16
    3974:	02067793          	and	a5,a2,32
    3978:	1c0780e3          	beqz	a5,4338 <_vfprintf_r+0x13e0>
    397c:	01412783          	lw	a5,20(sp)
    3980:	00778b13          	add	s6,a5,7
    3984:	ff8b7b13          	and	s6,s6,-8
    3988:	000b2d03          	lw	s10,0(s6)
    398c:	004b2c83          	lw	s9,4(s6)
    3990:	008b0793          	add	a5,s6,8
    3994:	00f12a23          	sw	a5,20(sp)
    3998:	00100793          	li	a5,1
    399c:	00000713          	li	a4,0
    39a0:	06e10ba3          	sb	a4,119(sp)
    39a4:	34034c63          	bltz	t1,3cfc <_vfprintf_r+0xda4>
    39a8:	019d6733          	or	a4,s10,s9
    39ac:	f7f67e93          	and	t4,a2,-129
    39b0:	34071463          	bnez	a4,3cf8 <_vfprintf_r+0xda0>
    39b4:	3a031a63          	bnez	t1,3d68 <_vfprintf_r+0xe10>
    39b8:	5c079ee3          	bnez	a5,4794 <_vfprintf_r+0x183c>
    39bc:	00167d13          	and	s10,a2,1
    39c0:	15010c13          	add	s8,sp,336
    39c4:	2c0d10e3          	bnez	s10,4484 <_vfprintf_r+0x152c>
    39c8:	07714603          	lbu	a2,119(sp)
    39cc:	00030c93          	mv	s9,t1
    39d0:	01a35463          	bge	t1,s10,39d8 <_vfprintf_r+0xa80>
    39d4:	000d0c93          	mv	s9,s10
    39d8:	00012823          	sw	zero,16(sp)
    39dc:	02012223          	sw	zero,36(sp)
    39e0:	02012023          	sw	zero,32(sp)
    39e4:	00000a13          	li	s4,0
    39e8:	fa060863          	beqz	a2,3198 <_vfprintf_r+0x240>
    39ec:	bcdff06f          	j	35b8 <_vfprintf_r+0x660>
    39f0:	00094e03          	lbu	t3,0(s2)
    39f4:	080a6a13          	or	s4,s4,128
    39f8:	f10ff06f          	j	3108 <_vfprintf_r+0x1b0>
    39fc:	00094e03          	lbu	t3,0(s2)
    3a00:	02a00793          	li	a5,42
    3a04:	00190693          	add	a3,s2,1
    3a08:	00fe1463          	bne	t3,a5,3a10 <_vfprintf_r+0xab8>
    3a0c:	1100206f          	j	5b1c <_vfprintf_r+0x2bc4>
    3a10:	fd0e0713          	add	a4,t3,-48
    3a14:	00900793          	li	a5,9
    3a18:	00000b13          	li	s6,0
    3a1c:	00900613          	li	a2,9
    3a20:	02e7e463          	bltu	a5,a4,3a48 <_vfprintf_r+0xaf0>
    3a24:	0006ce03          	lbu	t3,0(a3)
    3a28:	002b1793          	sll	a5,s6,0x2
    3a2c:	016787b3          	add	a5,a5,s6
    3a30:	00179793          	sll	a5,a5,0x1
    3a34:	00e78b33          	add	s6,a5,a4
    3a38:	fd0e0713          	add	a4,t3,-48
    3a3c:	00168693          	add	a3,a3,1
    3a40:	fee672e3          	bgeu	a2,a4,3a24 <_vfprintf_r+0xacc>
    3a44:	320b4ce3          	bltz	s6,457c <_vfprintf_r+0x1624>
    3a48:	00068913          	mv	s2,a3
    3a4c:	ec0ff06f          	j	310c <_vfprintf_r+0x1b4>
    3a50:	00094e03          	lbu	t3,0(s2)
    3a54:	001a6a13          	or	s4,s4,1
    3a58:	eb0ff06f          	j	3108 <_vfprintf_r+0x1b0>
    3a5c:	07714783          	lbu	a5,119(sp)
    3a60:	00094e03          	lbu	t3,0(s2)
    3a64:	ea079263          	bnez	a5,3108 <_vfprintf_r+0x1b0>
    3a68:	02000793          	li	a5,32
    3a6c:	06f10ba3          	sb	a5,119(sp)
    3a70:	e98ff06f          	j	3108 <_vfprintf_r+0x1b0>
    3a74:	00094e03          	lbu	t3,0(s2)
    3a78:	06c00793          	li	a5,108
    3a7c:	3afe00e3          	beq	t3,a5,461c <_vfprintf_r+0x16c4>
    3a80:	010a6a13          	or	s4,s4,16
    3a84:	e84ff06f          	j	3108 <_vfprintf_r+0x1b0>
    3a88:	00094e03          	lbu	t3,0(s2)
    3a8c:	008a6a13          	or	s4,s4,8
    3a90:	e78ff06f          	j	3108 <_vfprintf_r+0x1b0>
    3a94:	000b0313          	mv	t1,s6
    3a98:	010a6e93          	or	t4,s4,16
    3a9c:	020ef793          	and	a5,t4,32
    3aa0:	0c0786e3          	beqz	a5,436c <_vfprintf_r+0x1414>
    3aa4:	01412783          	lw	a5,20(sp)
    3aa8:	00778b13          	add	s6,a5,7
    3aac:	ff8b7b13          	and	s6,s6,-8
    3ab0:	004b2783          	lw	a5,4(s6)
    3ab4:	000b2d03          	lw	s10,0(s6)
    3ab8:	008b0713          	add	a4,s6,8
    3abc:	00e12a23          	sw	a4,20(sp)
    3ac0:	00078c93          	mv	s9,a5
    3ac4:	0c07cee3          	bltz	a5,43a0 <_vfprintf_r+0x1448>
    3ac8:	000e8613          	mv	a2,t4
    3acc:	02034263          	bltz	t1,3af0 <_vfprintf_r+0xb98>
    3ad0:	019d67b3          	or	a5,s10,s9
    3ad4:	f7fef613          	and	a2,t4,-129
    3ad8:	00079c63          	bnez	a5,3af0 <_vfprintf_r+0xb98>
    3adc:	02031063          	bnez	t1,3afc <_vfprintf_r+0xba4>
    3ae0:	00000d13          	li	s10,0
    3ae4:	00060e93          	mv	t4,a2
    3ae8:	15010c13          	add	s8,sp,336
    3aec:	eddff06f          	j	39c8 <_vfprintf_r+0xa70>
    3af0:	520c90e3          	bnez	s9,4810 <_vfprintf_r+0x18b8>
    3af4:	00900793          	li	a5,9
    3af8:	51a7ece3          	bltu	a5,s10,4810 <_vfprintf_r+0x18b8>
    3afc:	030d0d13          	add	s10,s10,48
    3b00:	15a107a3          	sb	s10,335(sp)
    3b04:	00060e93          	mv	t4,a2
    3b08:	00100d13          	li	s10,1
    3b0c:	14f10c13          	add	s8,sp,335
    3b10:	eb9ff06f          	j	39c8 <_vfprintf_r+0xa70>
    3b14:	000b0313          	mv	t1,s6
    3b18:	010a6e93          	or	t4,s4,16
    3b1c:	020ef793          	and	a5,t4,32
    3b20:	7e078463          	beqz	a5,4308 <_vfprintf_r+0x13b0>
    3b24:	01412783          	lw	a5,20(sp)
    3b28:	00778b13          	add	s6,a5,7
    3b2c:	ff8b7b13          	and	s6,s6,-8
    3b30:	000b2d03          	lw	s10,0(s6)
    3b34:	004b2c83          	lw	s9,4(s6)
    3b38:	008b0793          	add	a5,s6,8
    3b3c:	00f12a23          	sw	a5,20(sp)
    3b40:	bffef613          	and	a2,t4,-1025
    3b44:	00000793          	li	a5,0
    3b48:	e55ff06f          	j	399c <_vfprintf_r+0xa44>
    3b4c:	00094e03          	lbu	t3,0(s2)
    3b50:	06800793          	li	a5,104
    3b54:	2cfe0ce3          	beq	t3,a5,462c <_vfprintf_r+0x16d4>
    3b58:	040a6a13          	or	s4,s4,64
    3b5c:	dacff06f          	j	3108 <_vfprintf_r+0x1b0>
    3b60:	01412703          	lw	a4,20(sp)
    3b64:	000087b7          	lui	a5,0x8
    3b68:	83078793          	add	a5,a5,-2000 # 7830 <__sflush_r+0x154>
    3b6c:	06f11c23          	sh	a5,120(sp)
    3b70:	00470793          	add	a5,a4,4
    3b74:	00f12a23          	sw	a5,20(sp)
    3b78:	0000c797          	auipc	a5,0xc
    3b7c:	71478793          	add	a5,a5,1812 # 1028c <__fini_array_end+0x2e4>
    3b80:	02f12c23          	sw	a5,56(sp)
    3b84:	00072d03          	lw	s10,0(a4)
    3b88:	000b0313          	mv	t1,s6
    3b8c:	00000c93          	li	s9,0
    3b90:	002a6613          	or	a2,s4,2
    3b94:	00200793          	li	a5,2
    3b98:	07800e13          	li	t3,120
    3b9c:	e01ff06f          	j	399c <_vfprintf_r+0xa44>
    3ba0:	020a7793          	and	a5,s4,32
    3ba4:	180784e3          	beqz	a5,452c <_vfprintf_r+0x15d4>
    3ba8:	01412783          	lw	a5,20(sp)
    3bac:	00c12683          	lw	a3,12(sp)
    3bb0:	0007a783          	lw	a5,0(a5)
    3bb4:	41f6d713          	sra	a4,a3,0x1f
    3bb8:	00d7a023          	sw	a3,0(a5)
    3bbc:	00e7a223          	sw	a4,4(a5)
    3bc0:	01412783          	lw	a5,20(sp)
    3bc4:	00090c13          	mv	s8,s2
    3bc8:	00478793          	add	a5,a5,4
    3bcc:	00f12a23          	sw	a5,20(sp)
    3bd0:	cccff06f          	j	309c <_vfprintf_r+0x144>
    3bd4:	06500713          	li	a4,101
    3bd8:	b3c754e3          	bge	a4,t3,3700 <_vfprintf_r+0x7a8>
    3bdc:	02812683          	lw	a3,40(sp)
    3be0:	02c12703          	lw	a4,44(sp)
    3be4:	00000613          	li	a2,0
    3be8:	00068513          	mv	a0,a3
    3bec:	00070593          	mv	a1,a4
    3bf0:	00000693          	li	a3,0
    3bf4:	05d12223          	sw	t4,68(sp)
    3bf8:	05d0a0ef          	jal	e454 <__eqdf2>
    3bfc:	04412e83          	lw	t4,68(sp)
    3c00:	4e051463          	bnez	a0,40e8 <_vfprintf_r+0x1190>
    3c04:	0a412783          	lw	a5,164(sp)
    3c08:	0000c717          	auipc	a4,0xc
    3c0c:	6b470713          	add	a4,a4,1716 # 102bc <__fini_array_end+0x314>
    3c10:	00e42023          	sw	a4,0(s0)
    3c14:	00148493          	add	s1,s1,1
    3c18:	00100713          	li	a4,1
    3c1c:	00178793          	add	a5,a5,1
    3c20:	00e42223          	sw	a4,4(s0)
    3c24:	0a912423          	sw	s1,168(sp)
    3c28:	0af12223          	sw	a5,164(sp)
    3c2c:	00700713          	li	a4,7
    3c30:	00840413          	add	s0,s0,8
    3c34:	62f746e3          	blt	a4,a5,4a60 <_vfprintf_r+0x1b08>
    3c38:	07c12783          	lw	a5,124(sp)
    3c3c:	01812703          	lw	a4,24(sp)
    3c40:	78e7de63          	bge	a5,a4,43dc <_vfprintf_r+0x1484>
    3c44:	03412783          	lw	a5,52(sp)
    3c48:	03012703          	lw	a4,48(sp)
    3c4c:	00840413          	add	s0,s0,8
    3c50:	fef42c23          	sw	a5,-8(s0)
    3c54:	0a412783          	lw	a5,164(sp)
    3c58:	00e484b3          	add	s1,s1,a4
    3c5c:	fee42e23          	sw	a4,-4(s0)
    3c60:	00178793          	add	a5,a5,1
    3c64:	0a912423          	sw	s1,168(sp)
    3c68:	0af12223          	sw	a5,164(sp)
    3c6c:	00700713          	li	a4,7
    3c70:	1cf746e3          	blt	a4,a5,463c <_vfprintf_r+0x16e4>
    3c74:	01812783          	lw	a5,24(sp)
    3c78:	fff78d13          	add	s10,a5,-1
    3c7c:	dfa05263          	blez	s10,3260 <_vfprintf_r+0x308>
    3c80:	01000713          	li	a4,16
    3c84:	0a412783          	lw	a5,164(sp)
    3c88:	0000d297          	auipc	t0,0xd
    3c8c:	aec28293          	add	t0,t0,-1300 # 10774 <zeroes.0>
    3c90:	77a752e3          	bge	a4,s10,4bf4 <_vfprintf_r+0x1c9c>
    3c94:	00048713          	mv	a4,s1
    3c98:	01000c13          	li	s8,16
    3c9c:	00700b13          	li	s6,7
    3ca0:	000e8493          	mv	s1,t4
    3ca4:	00028a13          	mv	s4,t0
    3ca8:	00c0006f          	j	3cb4 <_vfprintf_r+0xd5c>
    3cac:	ff0d0d13          	add	s10,s10,-16
    3cb0:	73ac5ce3          	bge	s8,s10,4be8 <_vfprintf_r+0x1c90>
    3cb4:	01070713          	add	a4,a4,16
    3cb8:	00178793          	add	a5,a5,1
    3cbc:	01442023          	sw	s4,0(s0)
    3cc0:	01842223          	sw	s8,4(s0)
    3cc4:	0ae12423          	sw	a4,168(sp)
    3cc8:	0af12223          	sw	a5,164(sp)
    3ccc:	00840413          	add	s0,s0,8
    3cd0:	fcfb5ee3          	bge	s6,a5,3cac <_vfprintf_r+0xd54>
    3cd4:	00812583          	lw	a1,8(sp)
    3cd8:	0a010613          	add	a2,sp,160
    3cdc:	00098513          	mv	a0,s3
    3ce0:	134020ef          	jal	5e14 <__sprint_r>
    3ce4:	f4051263          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    3ce8:	0a812703          	lw	a4,168(sp)
    3cec:	0a412783          	lw	a5,164(sp)
    3cf0:	0ac10413          	add	s0,sp,172
    3cf4:	fb9ff06f          	j	3cac <_vfprintf_r+0xd54>
    3cf8:	000e8613          	mv	a2,t4
    3cfc:	00100713          	li	a4,1
    3d00:	dee788e3          	beq	a5,a4,3af0 <_vfprintf_r+0xb98>
    3d04:	00200713          	li	a4,2
    3d08:	06e78c63          	beq	a5,a4,3d80 <_vfprintf_r+0xe28>
    3d0c:	15010c13          	add	s8,sp,336
    3d10:	01dc9793          	sll	a5,s9,0x1d
    3d14:	007d7713          	and	a4,s10,7
    3d18:	003d5d13          	srl	s10,s10,0x3
    3d1c:	03070713          	add	a4,a4,48
    3d20:	01a7ed33          	or	s10,a5,s10
    3d24:	003cdc93          	srl	s9,s9,0x3
    3d28:	feec0fa3          	sb	a4,-1(s8)
    3d2c:	019d67b3          	or	a5,s10,s9
    3d30:	000c0593          	mv	a1,s8
    3d34:	fffc0c13          	add	s8,s8,-1
    3d38:	fc079ce3          	bnez	a5,3d10 <_vfprintf_r+0xdb8>
    3d3c:	00167693          	and	a3,a2,1
    3d40:	06068a63          	beqz	a3,3db4 <_vfprintf_r+0xe5c>
    3d44:	03000693          	li	a3,48
    3d48:	06d70663          	beq	a4,a3,3db4 <_vfprintf_r+0xe5c>
    3d4c:	ffe58593          	add	a1,a1,-2 # 1ffe <__retarget_lock_acquire_recursive+0x2>
    3d50:	15010793          	add	a5,sp,336
    3d54:	fedc0fa3          	sb	a3,-1(s8)
    3d58:	40b78d33          	sub	s10,a5,a1
    3d5c:	00060e93          	mv	t4,a2
    3d60:	00058c13          	mv	s8,a1
    3d64:	c65ff06f          	j	39c8 <_vfprintf_r+0xa70>
    3d68:	00100713          	li	a4,1
    3d6c:	00e79463          	bne	a5,a4,3d74 <_vfprintf_r+0xe1c>
    3d70:	2b10106f          	j	5820 <_vfprintf_r+0x28c8>
    3d74:	00200713          	li	a4,2
    3d78:	000e8613          	mv	a2,t4
    3d7c:	f8e798e3          	bne	a5,a4,3d0c <_vfprintf_r+0xdb4>
    3d80:	03812683          	lw	a3,56(sp)
    3d84:	15010c13          	add	s8,sp,336
    3d88:	00fd7793          	and	a5,s10,15
    3d8c:	00f687b3          	add	a5,a3,a5
    3d90:	0007c703          	lbu	a4,0(a5)
    3d94:	004d5d13          	srl	s10,s10,0x4
    3d98:	01cc9793          	sll	a5,s9,0x1c
    3d9c:	01a7ed33          	or	s10,a5,s10
    3da0:	004cdc93          	srl	s9,s9,0x4
    3da4:	feec0fa3          	sb	a4,-1(s8)
    3da8:	019d67b3          	or	a5,s10,s9
    3dac:	fffc0c13          	add	s8,s8,-1
    3db0:	fc079ce3          	bnez	a5,3d88 <_vfprintf_r+0xe30>
    3db4:	15010793          	add	a5,sp,336
    3db8:	41878d33          	sub	s10,a5,s8
    3dbc:	00060e93          	mv	t4,a2
    3dc0:	c09ff06f          	j	39c8 <_vfprintf_r+0xa70>
    3dc4:	419b8b33          	sub	s6,s7,s9
    3dc8:	c7605063          	blez	s6,3228 <_vfprintf_r+0x2d0>
    3dcc:	01000593          	li	a1,16
    3dd0:	0a412603          	lw	a2,164(sp)
    3dd4:	0000d297          	auipc	t0,0xd
    3dd8:	9a028293          	add	t0,t0,-1632 # 10774 <zeroes.0>
    3ddc:	0b65d463          	bge	a1,s6,3e84 <_vfprintf_r+0xf2c>
    3de0:	00040793          	mv	a5,s0
    3de4:	00048713          	mv	a4,s1
    3de8:	000b0413          	mv	s0,s6
    3dec:	01000893          	li	a7,16
    3df0:	000a0b13          	mv	s6,s4
    3df4:	00700f93          	li	t6,7
    3df8:	05d12223          	sw	t4,68(sp)
    3dfc:	05c12823          	sw	t3,80(sp)
    3e00:	00030a13          	mv	s4,t1
    3e04:	00028493          	mv	s1,t0
    3e08:	00c0006f          	j	3e14 <_vfprintf_r+0xebc>
    3e0c:	ff040413          	add	s0,s0,-16
    3e10:	0488da63          	bge	a7,s0,3e64 <_vfprintf_r+0xf0c>
    3e14:	01070713          	add	a4,a4,16
    3e18:	00160613          	add	a2,a2,1
    3e1c:	0097a023          	sw	s1,0(a5)
    3e20:	0117a223          	sw	a7,4(a5)
    3e24:	0ae12423          	sw	a4,168(sp)
    3e28:	0ac12223          	sw	a2,164(sp)
    3e2c:	00878793          	add	a5,a5,8
    3e30:	fccfdee3          	bge	t6,a2,3e0c <_vfprintf_r+0xeb4>
    3e34:	00812583          	lw	a1,8(sp)
    3e38:	0a010613          	add	a2,sp,160
    3e3c:	00098513          	mv	a0,s3
    3e40:	7d5010ef          	jal	5e14 <__sprint_r>
    3e44:	de051263          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    3e48:	01000893          	li	a7,16
    3e4c:	ff040413          	add	s0,s0,-16
    3e50:	0a812703          	lw	a4,168(sp)
    3e54:	0a412603          	lw	a2,164(sp)
    3e58:	0ac10793          	add	a5,sp,172
    3e5c:	00700f93          	li	t6,7
    3e60:	fa88cae3          	blt	a7,s0,3e14 <_vfprintf_r+0xebc>
    3e64:	04412e83          	lw	t4,68(sp)
    3e68:	05012e03          	lw	t3,80(sp)
    3e6c:	000a0313          	mv	t1,s4
    3e70:	00048293          	mv	t0,s1
    3e74:	000b0a13          	mv	s4,s6
    3e78:	00070493          	mv	s1,a4
    3e7c:	00040b13          	mv	s6,s0
    3e80:	00078413          	mv	s0,a5
    3e84:	016484b3          	add	s1,s1,s6
    3e88:	00160613          	add	a2,a2,1
    3e8c:	00542023          	sw	t0,0(s0)
    3e90:	01642223          	sw	s6,4(s0)
    3e94:	0a912423          	sw	s1,168(sp)
    3e98:	0ac12223          	sw	a2,164(sp)
    3e9c:	00700713          	li	a4,7
    3ea0:	00840413          	add	s0,s0,8
    3ea4:	b8c75263          	bge	a4,a2,3228 <_vfprintf_r+0x2d0>
    3ea8:	00812583          	lw	a1,8(sp)
    3eac:	0a010613          	add	a2,sp,160
    3eb0:	00098513          	mv	a0,s3
    3eb4:	04612a23          	sw	t1,84(sp)
    3eb8:	05c12823          	sw	t3,80(sp)
    3ebc:	05d12223          	sw	t4,68(sp)
    3ec0:	755010ef          	jal	5e14 <__sprint_r>
    3ec4:	d6051263          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    3ec8:	0a812483          	lw	s1,168(sp)
    3ecc:	05412303          	lw	t1,84(sp)
    3ed0:	05012e03          	lw	t3,80(sp)
    3ed4:	04412e83          	lw	t4,68(sp)
    3ed8:	0ac10413          	add	s0,sp,172
    3edc:	b4cff06f          	j	3228 <_vfprintf_r+0x2d0>
    3ee0:	01000713          	li	a4,16
    3ee4:	0a412603          	lw	a2,164(sp)
    3ee8:	0000d297          	auipc	t0,0xd
    3eec:	88c28293          	add	t0,t0,-1908 # 10774 <zeroes.0>
    3ef0:	0b675063          	bge	a4,s6,3f90 <_vfprintf_r+0x1038>
    3ef4:	00040793          	mv	a5,s0
    3ef8:	00048693          	mv	a3,s1
    3efc:	000b0413          	mv	s0,s6
    3f00:	01000713          	li	a4,16
    3f04:	00700893          	li	a7,7
    3f08:	05d12223          	sw	t4,68(sp)
    3f0c:	000e0493          	mv	s1,t3
    3f10:	00028b13          	mv	s6,t0
    3f14:	00c0006f          	j	3f20 <_vfprintf_r+0xfc8>
    3f18:	ff040413          	add	s0,s0,-16
    3f1c:	04875e63          	bge	a4,s0,3f78 <_vfprintf_r+0x1020>
    3f20:	01068693          	add	a3,a3,16
    3f24:	00160613          	add	a2,a2,1
    3f28:	0000d597          	auipc	a1,0xd
    3f2c:	84c58593          	add	a1,a1,-1972 # 10774 <zeroes.0>
    3f30:	00b7a023          	sw	a1,0(a5)
    3f34:	00e7a223          	sw	a4,4(a5)
    3f38:	0ad12423          	sw	a3,168(sp)
    3f3c:	0ac12223          	sw	a2,164(sp)
    3f40:	00878793          	add	a5,a5,8
    3f44:	fcc8dae3          	bge	a7,a2,3f18 <_vfprintf_r+0xfc0>
    3f48:	00812583          	lw	a1,8(sp)
    3f4c:	0a010613          	add	a2,sp,160
    3f50:	00098513          	mv	a0,s3
    3f54:	6c1010ef          	jal	5e14 <__sprint_r>
    3f58:	cc051863          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    3f5c:	01000713          	li	a4,16
    3f60:	ff040413          	add	s0,s0,-16
    3f64:	0a812683          	lw	a3,168(sp)
    3f68:	0a412603          	lw	a2,164(sp)
    3f6c:	0ac10793          	add	a5,sp,172
    3f70:	00700893          	li	a7,7
    3f74:	fa8746e3          	blt	a4,s0,3f20 <_vfprintf_r+0xfc8>
    3f78:	04412e83          	lw	t4,68(sp)
    3f7c:	00048e13          	mv	t3,s1
    3f80:	000b0293          	mv	t0,s6
    3f84:	00068493          	mv	s1,a3
    3f88:	00040b13          	mv	s6,s0
    3f8c:	00078413          	mv	s0,a5
    3f90:	016484b3          	add	s1,s1,s6
    3f94:	00160613          	add	a2,a2,1
    3f98:	00542023          	sw	t0,0(s0)
    3f9c:	01642223          	sw	s6,4(s0)
    3fa0:	0a912423          	sw	s1,168(sp)
    3fa4:	0ac12223          	sw	a2,164(sp)
    3fa8:	00700713          	li	a4,7
    3fac:	00840413          	add	s0,s0,8
    3fb0:	a8c75063          	bge	a4,a2,3230 <_vfprintf_r+0x2d8>
    3fb4:	00812583          	lw	a1,8(sp)
    3fb8:	0a010613          	add	a2,sp,160
    3fbc:	00098513          	mv	a0,s3
    3fc0:	05c12823          	sw	t3,80(sp)
    3fc4:	05d12223          	sw	t4,68(sp)
    3fc8:	64d010ef          	jal	5e14 <__sprint_r>
    3fcc:	c4051e63          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    3fd0:	0a812483          	lw	s1,168(sp)
    3fd4:	05012e03          	lw	t3,80(sp)
    3fd8:	04412e83          	lw	t4,68(sp)
    3fdc:	0ac10413          	add	s0,sp,172
    3fe0:	a50ff06f          	j	3230 <_vfprintf_r+0x2d8>
    3fe4:	00812583          	lw	a1,8(sp)
    3fe8:	0a010613          	add	a2,sp,160
    3fec:	00098513          	mv	a0,s3
    3ff0:	04612c23          	sw	t1,88(sp)
    3ff4:	05c12a23          	sw	t3,84(sp)
    3ff8:	05d12823          	sw	t4,80(sp)
    3ffc:	05f12223          	sw	t6,68(sp)
    4000:	615010ef          	jal	5e14 <__sprint_r>
    4004:	c2051263          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    4008:	0a812483          	lw	s1,168(sp)
    400c:	05812303          	lw	t1,88(sp)
    4010:	05412e03          	lw	t3,84(sp)
    4014:	05012e83          	lw	t4,80(sp)
    4018:	04412f83          	lw	t6,68(sp)
    401c:	0ac10413          	add	s0,sp,172
    4020:	a00ff06f          	j	3220 <_vfprintf_r+0x2c8>
    4024:	01000713          	li	a4,16
    4028:	0a412783          	lw	a5,164(sp)
    402c:	0000cb17          	auipc	s6,0xc
    4030:	758b0b13          	add	s6,s6,1880 # 10784 <blanks.1>
    4034:	07a75c63          	bge	a4,s10,40ac <_vfprintf_r+0x1154>
    4038:	000b0713          	mv	a4,s6
    403c:	01000c13          	li	s8,16
    4040:	00090b13          	mv	s6,s2
    4044:	00700a13          	li	s4,7
    4048:	00070913          	mv	s2,a4
    404c:	00c0006f          	j	4058 <_vfprintf_r+0x1100>
    4050:	ff0d0d13          	add	s10,s10,-16
    4054:	05ac5663          	bge	s8,s10,40a0 <_vfprintf_r+0x1148>
    4058:	01048493          	add	s1,s1,16
    405c:	00178793          	add	a5,a5,1
    4060:	01242023          	sw	s2,0(s0)
    4064:	01842223          	sw	s8,4(s0)
    4068:	0a912423          	sw	s1,168(sp)
    406c:	0af12223          	sw	a5,164(sp)
    4070:	00840413          	add	s0,s0,8
    4074:	fcfa5ee3          	bge	s4,a5,4050 <_vfprintf_r+0x10f8>
    4078:	00812583          	lw	a1,8(sp)
    407c:	0a010613          	add	a2,sp,160
    4080:	00098513          	mv	a0,s3
    4084:	591010ef          	jal	5e14 <__sprint_r>
    4088:	ba051063          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    408c:	ff0d0d13          	add	s10,s10,-16
    4090:	0a812483          	lw	s1,168(sp)
    4094:	0a412783          	lw	a5,164(sp)
    4098:	0ac10413          	add	s0,sp,172
    409c:	fbac4ee3          	blt	s8,s10,4058 <_vfprintf_r+0x1100>
    40a0:	00090713          	mv	a4,s2
    40a4:	000b0913          	mv	s2,s6
    40a8:	00070b13          	mv	s6,a4
    40ac:	01a484b3          	add	s1,s1,s10
    40b0:	00178793          	add	a5,a5,1
    40b4:	01642023          	sw	s6,0(s0)
    40b8:	01a42223          	sw	s10,4(s0)
    40bc:	0a912423          	sw	s1,168(sp)
    40c0:	0af12223          	sw	a5,164(sp)
    40c4:	00700713          	li	a4,7
    40c8:	9af75463          	bge	a4,a5,3270 <_vfprintf_r+0x318>
    40cc:	00812583          	lw	a1,8(sp)
    40d0:	0a010613          	add	a2,sp,160
    40d4:	00098513          	mv	a0,s3
    40d8:	53d010ef          	jal	5e14 <__sprint_r>
    40dc:	b4051663          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    40e0:	0a812483          	lw	s1,168(sp)
    40e4:	98cff06f          	j	3270 <_vfprintf_r+0x318>
    40e8:	07c12683          	lw	a3,124(sp)
    40ec:	30d05c63          	blez	a3,4404 <_vfprintf_r+0x14ac>
    40f0:	01812783          	lw	a5,24(sp)
    40f4:	000a0b13          	mv	s6,s4
    40f8:	0147d463          	bge	a5,s4,4100 <_vfprintf_r+0x11a8>
    40fc:	00078b13          	mv	s6,a5
    4100:	03605863          	blez	s6,4130 <_vfprintf_r+0x11d8>
    4104:	0a412683          	lw	a3,164(sp)
    4108:	016484b3          	add	s1,s1,s6
    410c:	01842023          	sw	s8,0(s0)
    4110:	00168693          	add	a3,a3,1
    4114:	01642223          	sw	s6,4(s0)
    4118:	0a912423          	sw	s1,168(sp)
    411c:	0ad12223          	sw	a3,164(sp)
    4120:	00700613          	li	a2,7
    4124:	00840413          	add	s0,s0,8
    4128:	00d65463          	bge	a2,a3,4130 <_vfprintf_r+0x11d8>
    412c:	5c40106f          	j	56f0 <_vfprintf_r+0x2798>
    4130:	fffb4693          	not	a3,s6
    4134:	41f6d693          	sra	a3,a3,0x1f
    4138:	00db7733          	and	a4,s6,a3
    413c:	40ea0b33          	sub	s6,s4,a4
    4140:	35604ae3          	bgtz	s6,4c94 <_vfprintf_r+0x1d3c>
    4144:	400ef713          	and	a4,t4,1024
    4148:	014c0333          	add	t1,s8,s4
    414c:	00070463          	beqz	a4,4154 <_vfprintf_r+0x11fc>
    4150:	2980106f          	j	53e8 <_vfprintf_r+0x2490>
    4154:	07c12d03          	lw	s10,124(sp)
    4158:	01812783          	lw	a5,24(sp)
    415c:	5afd4063          	blt	s10,a5,46fc <_vfprintf_r+0x17a4>
    4160:	001ef713          	and	a4,t4,1
    4164:	58071c63          	bnez	a4,46fc <_vfprintf_r+0x17a4>
    4168:	01812703          	lw	a4,24(sp)
    416c:	00ec07b3          	add	a5,s8,a4
    4170:	41a70d33          	sub	s10,a4,s10
    4174:	40678b33          	sub	s6,a5,t1
    4178:	016d5463          	bge	s10,s6,4180 <_vfprintf_r+0x1228>
    417c:	000d0b13          	mv	s6,s10
    4180:	03605863          	blez	s6,41b0 <_vfprintf_r+0x1258>
    4184:	0a412703          	lw	a4,164(sp)
    4188:	016484b3          	add	s1,s1,s6
    418c:	00642023          	sw	t1,0(s0)
    4190:	00170713          	add	a4,a4,1
    4194:	01642223          	sw	s6,4(s0)
    4198:	0a912423          	sw	s1,168(sp)
    419c:	0ae12223          	sw	a4,164(sp)
    41a0:	00700693          	li	a3,7
    41a4:	00840413          	add	s0,s0,8
    41a8:	00e6d463          	bge	a3,a4,41b0 <_vfprintf_r+0x1258>
    41ac:	5880106f          	j	5734 <_vfprintf_r+0x27dc>
    41b0:	fffb4713          	not	a4,s6
    41b4:	41f75713          	sra	a4,a4,0x1f
    41b8:	00eb77b3          	and	a5,s6,a4
    41bc:	40fd0d33          	sub	s10,s10,a5
    41c0:	8ba05063          	blez	s10,3260 <_vfprintf_r+0x308>
    41c4:	01000713          	li	a4,16
    41c8:	0a412783          	lw	a5,164(sp)
    41cc:	0000c297          	auipc	t0,0xc
    41d0:	5a828293          	add	t0,t0,1448 # 10774 <zeroes.0>
    41d4:	23a750e3          	bge	a4,s10,4bf4 <_vfprintf_r+0x1c9c>
    41d8:	00048713          	mv	a4,s1
    41dc:	01000c13          	li	s8,16
    41e0:	00700b13          	li	s6,7
    41e4:	000e8493          	mv	s1,t4
    41e8:	00028a13          	mv	s4,t0
    41ec:	00c0006f          	j	41f8 <_vfprintf_r+0x12a0>
    41f0:	ff0d0d13          	add	s10,s10,-16
    41f4:	1fac5ae3          	bge	s8,s10,4be8 <_vfprintf_r+0x1c90>
    41f8:	01070713          	add	a4,a4,16
    41fc:	00178793          	add	a5,a5,1
    4200:	01442023          	sw	s4,0(s0)
    4204:	01842223          	sw	s8,4(s0)
    4208:	0ae12423          	sw	a4,168(sp)
    420c:	0af12223          	sw	a5,164(sp)
    4210:	00840413          	add	s0,s0,8
    4214:	fcfb5ee3          	bge	s6,a5,41f0 <_vfprintf_r+0x1298>
    4218:	00812583          	lw	a1,8(sp)
    421c:	0a010613          	add	a2,sp,160
    4220:	00098513          	mv	a0,s3
    4224:	3f1010ef          	jal	5e14 <__sprint_r>
    4228:	a0051063          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    422c:	0a812703          	lw	a4,168(sp)
    4230:	0a412783          	lw	a5,164(sp)
    4234:	0ac10413          	add	s0,sp,172
    4238:	fb9ff06f          	j	41f0 <_vfprintf_r+0x1298>
    423c:	001ef613          	and	a2,t4,1
    4240:	ce061063          	bnez	a2,3720 <_vfprintf_r+0x7c8>
    4244:	00d42223          	sw	a3,4(s0)
    4248:	0a912423          	sw	s1,168(sp)
    424c:	0ba12223          	sw	s10,164(sp)
    4250:	00700793          	li	a5,7
    4254:	d7a7d863          	bge	a5,s10,37c4 <_vfprintf_r+0x86c>
    4258:	00812583          	lw	a1,8(sp)
    425c:	0a010613          	add	a2,sp,160
    4260:	00098513          	mv	a0,s3
    4264:	03d12023          	sw	t4,32(sp)
    4268:	3ad010ef          	jal	5e14 <__sprint_r>
    426c:	9a051e63          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    4270:	0a812483          	lw	s1,168(sp)
    4274:	0a412d03          	lw	s10,164(sp)
    4278:	02012e83          	lw	t4,32(sp)
    427c:	0ac10b13          	add	s6,sp,172
    4280:	d44ff06f          	j	37c4 <_vfprintf_r+0x86c>
    4284:	01812703          	lw	a4,24(sp)
    4288:	00100793          	li	a5,1
    428c:	d2e7dc63          	bge	a5,a4,37c4 <_vfprintf_r+0x86c>
    4290:	01100793          	li	a5,17
    4294:	0000c297          	auipc	t0,0xc
    4298:	4e028293          	add	t0,t0,1248 # 10774 <zeroes.0>
    429c:	18e7d4e3          	bge	a5,a4,4c24 <_vfprintf_r+0x1ccc>
    42a0:	00040a13          	mv	s4,s0
    42a4:	01000793          	li	a5,16
    42a8:	00700c13          	li	s8,7
    42ac:	03d12023          	sw	t4,32(sp)
    42b0:	00028413          	mv	s0,t0
    42b4:	00c0006f          	j	42c0 <_vfprintf_r+0x1368>
    42b8:	ff0a0a13          	add	s4,s4,-16
    42bc:	1547dee3          	bge	a5,s4,4c18 <_vfprintf_r+0x1cc0>
    42c0:	01048493          	add	s1,s1,16
    42c4:	001d0d13          	add	s10,s10,1
    42c8:	008b2023          	sw	s0,0(s6)
    42cc:	00fb2223          	sw	a5,4(s6)
    42d0:	0a912423          	sw	s1,168(sp)
    42d4:	0ba12223          	sw	s10,164(sp)
    42d8:	008b0b13          	add	s6,s6,8
    42dc:	fdac5ee3          	bge	s8,s10,42b8 <_vfprintf_r+0x1360>
    42e0:	00812583          	lw	a1,8(sp)
    42e4:	0a010613          	add	a2,sp,160
    42e8:	00098513          	mv	a0,s3
    42ec:	329010ef          	jal	5e14 <__sprint_r>
    42f0:	92051c63          	bnez	a0,3428 <_vfprintf_r+0x4d0>
    42f4:	0a812483          	lw	s1,168(sp)
    42f8:	0a412d03          	lw	s10,164(sp)
    42fc:	0ac10b13          	add	s6,sp,172
    4300:	01000793          	li	a5,16
    4304:	fb5ff06f          	j	42b8 <_vfprintf_r+0x1360>
    4308:	01412703          	lw	a4,20(sp)
    430c:	010ef793          	and	a5,t4,16
    4310:	00072d03          	lw	s10,0(a4)
    4314:	00470713          	add	a4,a4,4
    4318:	00e12a23          	sw	a4,20(sp)
    431c:	1a079663          	bnez	a5,44c8 <_vfprintf_r+0x1570>
    4320:	040ef793          	and	a5,t4,64
    4324:	18078e63          	beqz	a5,44c0 <_vfprintf_r+0x1568>
    4328:	010d1d13          	sll	s10,s10,0x10
    432c:	010d5d13          	srl	s10,s10,0x10
    4330:	00000c93          	li	s9,0
    4334:	80dff06f          	j	3b40 <_vfprintf_r+0xbe8>
    4338:	01412703          	lw	a4,20(sp)
    433c:	01067793          	and	a5,a2,16
    4340:	00072d03          	lw	s10,0(a4)
    4344:	00470713          	add	a4,a4,4
    4348:	00e12a23          	sw	a4,20(sp)
    434c:	14079a63          	bnez	a5,44a0 <_vfprintf_r+0x1548>
    4350:	04067793          	and	a5,a2,64
    4354:	14078063          	beqz	a5,4494 <_vfprintf_r+0x153c>
    4358:	010d1d13          	sll	s10,s10,0x10
    435c:	010d5d13          	srl	s10,s10,0x10
    4360:	00000c93          	li	s9,0
    4364:	00100793          	li	a5,1
    4368:	e34ff06f          	j	399c <_vfprintf_r+0xa44>
    436c:	01412703          	lw	a4,20(sp)
    4370:	010ef793          	and	a5,t4,16
    4374:	00072d03          	lw	s10,0(a4)
    4378:	00470713          	add	a4,a4,4
    437c:	00e12a23          	sw	a4,20(sp)
    4380:	12079a63          	bnez	a5,44b4 <_vfprintf_r+0x155c>
    4384:	040ef793          	and	a5,t4,64
    4388:	12078263          	beqz	a5,44ac <_vfprintf_r+0x1554>
    438c:	010d1d13          	sll	s10,s10,0x10
    4390:	410d5d13          	sra	s10,s10,0x10
    4394:	41fd5c93          	sra	s9,s10,0x1f
    4398:	000c8793          	mv	a5,s9
    439c:	f207d663          	bgez	a5,3ac8 <_vfprintf_r+0xb70>
    43a0:	01a037b3          	snez	a5,s10
    43a4:	419000b3          	neg	ra,s9
    43a8:	40f08cb3          	sub	s9,ra,a5
    43ac:	41a00d33          	neg	s10,s10
    43b0:	000e8613          	mv	a2,t4
    43b4:	02d00713          	li	a4,45
    43b8:	00100793          	li	a5,1
    43bc:	de4ff06f          	j	39a0 <_vfprintf_r+0xa48>
    43c0:	00812403          	lw	s0,8(sp)
    43c4:	00f12623          	sw	a5,12(sp)
    43c8:	05842503          	lw	a0,88(s0)
    43cc:	c31fd0ef          	jal	1ffc <__retarget_lock_acquire_recursive>
    43d0:	00c41703          	lh	a4,12(s0)
    43d4:	00c12783          	lw	a5,12(sp)
    43d8:	c01fe06f          	j	2fd8 <_vfprintf_r+0x80>
    43dc:	001ef793          	and	a5,t4,1
    43e0:	00079463          	bnez	a5,43e8 <_vfprintf_r+0x1490>
    43e4:	e7dfe06f          	j	3260 <_vfprintf_r+0x308>
    43e8:	85dff06f          	j	3c44 <_vfprintf_r+0xcec>
    43ec:	000a0e93          	mv	t4,s4
    43f0:	000b0313          	mv	t1,s6
    43f4:	ea8ff06f          	j	3a9c <_vfprintf_r+0xb44>
    43f8:	00094e03          	lbu	t3,0(s2)
    43fc:	00f12a23          	sw	a5,20(sp)
    4400:	d09fe06f          	j	3108 <_vfprintf_r+0x1b0>
    4404:	0a412703          	lw	a4,164(sp)
    4408:	0000c617          	auipc	a2,0xc
    440c:	eb460613          	add	a2,a2,-332 # 102bc <__fini_array_end+0x314>
    4410:	00c42023          	sw	a2,0(s0)
    4414:	00148493          	add	s1,s1,1
    4418:	00100613          	li	a2,1
    441c:	00170713          	add	a4,a4,1
    4420:	00c42223          	sw	a2,4(s0)
    4424:	0a912423          	sw	s1,168(sp)
    4428:	0ae12223          	sw	a4,164(sp)
    442c:	00700613          	li	a2,7
    4430:	00840413          	add	s0,s0,8
    4434:	2ee64ce3          	blt	a2,a4,4f2c <_vfprintf_r+0x1fd4>
    4438:	7e069e63          	bnez	a3,4c34 <_vfprintf_r+0x1cdc>
    443c:	01812783          	lw	a5,24(sp)
    4440:	001ef713          	and	a4,t4,1
    4444:	00f76733          	or	a4,a4,a5
    4448:	00071463          	bnez	a4,4450 <_vfprintf_r+0x14f8>
    444c:	e15fe06f          	j	3260 <_vfprintf_r+0x308>
    4450:	03412703          	lw	a4,52(sp)
    4454:	03012783          	lw	a5,48(sp)
    4458:	00700693          	li	a3,7
    445c:	00e42023          	sw	a4,0(s0)
    4460:	0a412703          	lw	a4,164(sp)
    4464:	009784b3          	add	s1,a5,s1
    4468:	00f42223          	sw	a5,4(s0)
    446c:	00170713          	add	a4,a4,1
    4470:	0a912423          	sw	s1,168(sp)
    4474:	0ae12223          	sw	a4,164(sp)
    4478:	38e6c8e3          	blt	a3,a4,5008 <_vfprintf_r+0x20b0>
    447c:	00840413          	add	s0,s0,8
    4480:	7e80006f          	j	4c68 <_vfprintf_r+0x1d10>
    4484:	03000793          	li	a5,48
    4488:	14f107a3          	sb	a5,335(sp)
    448c:	14f10c13          	add	s8,sp,335
    4490:	d38ff06f          	j	39c8 <_vfprintf_r+0xa70>
    4494:	20067793          	and	a5,a2,512
    4498:	00078463          	beqz	a5,44a0 <_vfprintf_r+0x1548>
    449c:	0ffd7d13          	zext.b	s10,s10
    44a0:	00000c93          	li	s9,0
    44a4:	00100793          	li	a5,1
    44a8:	cf4ff06f          	j	399c <_vfprintf_r+0xa44>
    44ac:	200ef793          	and	a5,t4,512
    44b0:	2c0796e3          	bnez	a5,4f7c <_vfprintf_r+0x2024>
    44b4:	41fd5c93          	sra	s9,s10,0x1f
    44b8:	000c8793          	mv	a5,s9
    44bc:	e08ff06f          	j	3ac4 <_vfprintf_r+0xb6c>
    44c0:	200ef793          	and	a5,t4,512
    44c4:	2a0790e3          	bnez	a5,4f64 <_vfprintf_r+0x200c>
    44c8:	00000c93          	li	s9,0
    44cc:	e74ff06f          	j	3b40 <_vfprintf_r+0xbe8>
    44d0:	01412783          	lw	a5,20(sp)
    44d4:	06010513          	add	a0,sp,96
    44d8:	03612223          	sw	s6,36(sp)
    44dc:	0007a703          	lw	a4,0(a5)
    44e0:	03c12023          	sw	t3,32(sp)
    44e4:	00478b13          	add	s6,a5,4
    44e8:	00072683          	lw	a3,0(a4)
    44ec:	01412823          	sw	s4,16(sp)
    44f0:	06d12023          	sw	a3,96(sp)
    44f4:	00472683          	lw	a3,4(a4)
    44f8:	06d12223          	sw	a3,100(sp)
    44fc:	00872683          	lw	a3,8(a4)
    4500:	06d12423          	sw	a3,104(sp)
    4504:	00c72703          	lw	a4,12(a4)
    4508:	06e12623          	sw	a4,108(sp)
    450c:	4c80b0ef          	jal	f9d4 <__trunctfdf2>
    4510:	02012e03          	lw	t3,32(sp)
    4514:	02412303          	lw	t1,36(sp)
    4518:	02a12423          	sw	a0,40(sp)
    451c:	02b12623          	sw	a1,44(sp)
    4520:	01612a23          	sw	s6,20(sp)
    4524:	000a0e93          	mv	t4,s4
    4528:	fb1fe06f          	j	34d8 <_vfprintf_r+0x580>
    452c:	010a7793          	and	a5,s4,16
    4530:	6c079a63          	bnez	a5,4c04 <_vfprintf_r+0x1cac>
    4534:	040a7793          	and	a5,s4,64
    4538:	24079ce3          	bnez	a5,4f90 <_vfprintf_r+0x2038>
    453c:	200a7f13          	and	t5,s4,512
    4540:	6c0f0263          	beqz	t5,4c04 <_vfprintf_r+0x1cac>
    4544:	01412783          	lw	a5,20(sp)
    4548:	00c12703          	lw	a4,12(sp)
    454c:	0007a783          	lw	a5,0(a5)
    4550:	00e78023          	sb	a4,0(a5)
    4554:	e6cff06f          	j	3bc0 <_vfprintf_r+0xc68>
    4558:	03c12783          	lw	a5,60(sp)
    455c:	00094e03          	lbu	t3,0(s2)
    4560:	00079463          	bnez	a5,4568 <_vfprintf_r+0x1610>
    4564:	ba5fe06f          	j	3108 <_vfprintf_r+0x1b0>
    4568:	0007c783          	lbu	a5,0(a5)
    456c:	00079463          	bnez	a5,4574 <_vfprintf_r+0x161c>
    4570:	b99fe06f          	j	3108 <_vfprintf_r+0x1b0>
    4574:	400a6a13          	or	s4,s4,1024
    4578:	b91fe06f          	j	3108 <_vfprintf_r+0x1b0>
    457c:	fff00b13          	li	s6,-1
    4580:	00068913          	mv	s2,a3
    4584:	b89fe06f          	j	310c <_vfprintf_r+0x1b4>
    4588:	0000c797          	auipc	a5,0xc
    458c:	d1878793          	add	a5,a5,-744 # 102a0 <__fini_array_end+0x2f8>
    4590:	000a0e93          	mv	t4,s4
    4594:	000b0313          	mv	t1,s6
    4598:	02f12c23          	sw	a5,56(sp)
    459c:	020ef793          	and	a5,t4,32
    45a0:	1c078263          	beqz	a5,4764 <_vfprintf_r+0x180c>
    45a4:	01412783          	lw	a5,20(sp)
    45a8:	00778b13          	add	s6,a5,7
    45ac:	ff8b7b13          	and	s6,s6,-8
    45b0:	000b2d03          	lw	s10,0(s6)
    45b4:	004b2c83          	lw	s9,4(s6)
    45b8:	008b0793          	add	a5,s6,8
    45bc:	00f12a23          	sw	a5,20(sp)
    45c0:	001ef793          	and	a5,t4,1
    45c4:	00078e63          	beqz	a5,45e0 <_vfprintf_r+0x1688>
    45c8:	019d67b3          	or	a5,s10,s9
    45cc:	00078a63          	beqz	a5,45e0 <_vfprintf_r+0x1688>
    45d0:	03000793          	li	a5,48
    45d4:	06f10c23          	sb	a5,120(sp)
    45d8:	07c10ca3          	sb	t3,121(sp)
    45dc:	002eee93          	or	t4,t4,2
    45e0:	bffef613          	and	a2,t4,-1025
    45e4:	00200793          	li	a5,2
    45e8:	bb4ff06f          	j	399c <_vfprintf_r+0xa44>
    45ec:	000b0313          	mv	t1,s6
    45f0:	000a0613          	mv	a2,s4
    45f4:	b80ff06f          	j	3974 <_vfprintf_r+0xa1c>
    45f8:	000a0e93          	mv	t4,s4
    45fc:	000b0313          	mv	t1,s6
    4600:	d1cff06f          	j	3b1c <_vfprintf_r+0xbc4>
    4604:	0000c797          	auipc	a5,0xc
    4608:	c8878793          	add	a5,a5,-888 # 1028c <__fini_array_end+0x2e4>
    460c:	000a0e93          	mv	t4,s4
    4610:	000b0313          	mv	t1,s6
    4614:	02f12c23          	sw	a5,56(sp)
    4618:	f85ff06f          	j	459c <_vfprintf_r+0x1644>
    461c:	00194e03          	lbu	t3,1(s2)
    4620:	020a6a13          	or	s4,s4,32
    4624:	00190913          	add	s2,s2,1
    4628:	ae1fe06f          	j	3108 <_vfprintf_r+0x1b0>
    462c:	00194e03          	lbu	t3,1(s2)
    4630:	200a6a13          	or	s4,s4,512
    4634:	00190913          	add	s2,s2,1
    4638:	ad1fe06f          	j	3108 <_vfprintf_r+0x1b0>
    463c:	00812583          	lw	a1,8(sp)
    4640:	0a010613          	add	a2,sp,160
    4644:	00098513          	mv	a0,s3
    4648:	03d12023          	sw	t4,32(sp)
    464c:	7c8010ef          	jal	5e14 <__sprint_r>
    4650:	00050463          	beqz	a0,4658 <_vfprintf_r+0x1700>
    4654:	dd5fe06f          	j	3428 <_vfprintf_r+0x4d0>
    4658:	0a812483          	lw	s1,168(sp)
    465c:	02012e83          	lw	t4,32(sp)
    4660:	0ac10413          	add	s0,sp,172
    4664:	e10ff06f          	j	3c74 <_vfprintf_r+0xd1c>
    4668:	00600793          	li	a5,6
    466c:	00030c93          	mv	s9,t1
    4670:	0e67e6e3          	bltu	a5,t1,4f5c <_vfprintf_r+0x2004>
    4674:	01612a23          	sw	s6,20(sp)
    4678:	00012823          	sw	zero,16(sp)
    467c:	000c8d13          	mv	s10,s9
    4680:	00000613          	li	a2,0
    4684:	00000313          	li	t1,0
    4688:	02012223          	sw	zero,36(sp)
    468c:	02012023          	sw	zero,32(sp)
    4690:	00000a13          	li	s4,0
    4694:	0000cc17          	auipc	s8,0xc
    4698:	c20c0c13          	add	s8,s8,-992 # 102b4 <__fini_array_end+0x30c>
    469c:	afdfe06f          	j	3198 <_vfprintf_r+0x240>
    46a0:	00800613          	li	a2,8
    46a4:	00000593          	li	a1,0
    46a8:	09810513          	add	a0,sp,152
    46ac:	03c12023          	sw	t3,32(sp)
    46b0:	01d12823          	sw	t4,16(sp)
    46b4:	951fd0ef          	jal	2004 <memset>
    46b8:	01412783          	lw	a5,20(sp)
    46bc:	0ec10c13          	add	s8,sp,236
    46c0:	09810693          	add	a3,sp,152
    46c4:	0007a603          	lw	a2,0(a5)
    46c8:	000c0593          	mv	a1,s8
    46cc:	00098513          	mv	a0,s3
    46d0:	530070ef          	jal	bc00 <_wcrtomb_r>
    46d4:	fff00793          	li	a5,-1
    46d8:	01012e83          	lw	t4,16(sp)
    46dc:	02012e03          	lw	t3,32(sp)
    46e0:	00050d13          	mv	s10,a0
    46e4:	00f51463          	bne	a0,a5,46ec <_vfprintf_r+0x1794>
    46e8:	4980106f          	j	5b80 <_vfprintf_r+0x2c28>
    46ec:	fff54813          	not	a6,a0
    46f0:	41f85813          	sra	a6,a6,0x1f
    46f4:	01057cb3          	and	s9,a0,a6
    46f8:	97cff06f          	j	3874 <_vfprintf_r+0x91c>
    46fc:	03412703          	lw	a4,52(sp)
    4700:	03012783          	lw	a5,48(sp)
    4704:	00700693          	li	a3,7
    4708:	00e42023          	sw	a4,0(s0)
    470c:	0a412703          	lw	a4,164(sp)
    4710:	00f484b3          	add	s1,s1,a5
    4714:	00f42223          	sw	a5,4(s0)
    4718:	00170713          	add	a4,a4,1
    471c:	0a912423          	sw	s1,168(sp)
    4720:	0ae12223          	sw	a4,164(sp)
    4724:	00840413          	add	s0,s0,8
    4728:	a4e6d0e3          	bge	a3,a4,4168 <_vfprintf_r+0x1210>
    472c:	00812583          	lw	a1,8(sp)
    4730:	0a010613          	add	a2,sp,160
    4734:	00098513          	mv	a0,s3
    4738:	02612223          	sw	t1,36(sp)
    473c:	03d12023          	sw	t4,32(sp)
    4740:	6d4010ef          	jal	5e14 <__sprint_r>
    4744:	00050463          	beqz	a0,474c <_vfprintf_r+0x17f4>
    4748:	ce1fe06f          	j	3428 <_vfprintf_r+0x4d0>
    474c:	07c12d03          	lw	s10,124(sp)
    4750:	0a812483          	lw	s1,168(sp)
    4754:	02412303          	lw	t1,36(sp)
    4758:	02012e83          	lw	t4,32(sp)
    475c:	0ac10413          	add	s0,sp,172
    4760:	a09ff06f          	j	4168 <_vfprintf_r+0x1210>
    4764:	01412703          	lw	a4,20(sp)
    4768:	010ef793          	and	a5,t4,16
    476c:	00072d03          	lw	s10,0(a4)
    4770:	00470713          	add	a4,a4,4
    4774:	00e12a23          	sw	a4,20(sp)
    4778:	08079863          	bnez	a5,4808 <_vfprintf_r+0x18b0>
    477c:	040ef793          	and	a5,t4,64
    4780:	08078063          	beqz	a5,4800 <_vfprintf_r+0x18a8>
    4784:	010d1d13          	sll	s10,s10,0x10
    4788:	010d5d13          	srl	s10,s10,0x10
    478c:	00000c93          	li	s9,0
    4790:	e31ff06f          	j	45c0 <_vfprintf_r+0x1668>
    4794:	00000d13          	li	s10,0
    4798:	15010c13          	add	s8,sp,336
    479c:	a2cff06f          	j	39c8 <_vfprintf_r+0xa70>
    47a0:	00812583          	lw	a1,8(sp)
    47a4:	0a010613          	add	a2,sp,160
    47a8:	00098513          	mv	a0,s3
    47ac:	03d12023          	sw	t4,32(sp)
    47b0:	664010ef          	jal	5e14 <__sprint_r>
    47b4:	00050463          	beqz	a0,47bc <_vfprintf_r+0x1864>
    47b8:	c71fe06f          	j	3428 <_vfprintf_r+0x4d0>
    47bc:	0a812483          	lw	s1,168(sp)
    47c0:	0a412d03          	lw	s10,164(sp)
    47c4:	02012e83          	lw	t4,32(sp)
    47c8:	0ac10b13          	add	s6,sp,172
    47cc:	f71fe06f          	j	373c <_vfprintf_r+0x7e4>
    47d0:	00812583          	lw	a1,8(sp)
    47d4:	0a010613          	add	a2,sp,160
    47d8:	00098513          	mv	a0,s3
    47dc:	03d12023          	sw	t4,32(sp)
    47e0:	634010ef          	jal	5e14 <__sprint_r>
    47e4:	00050463          	beqz	a0,47ec <_vfprintf_r+0x1894>
    47e8:	c41fe06f          	j	3428 <_vfprintf_r+0x4d0>
    47ec:	0a812483          	lw	s1,168(sp)
    47f0:	0a412d03          	lw	s10,164(sp)
    47f4:	02012e83          	lw	t4,32(sp)
    47f8:	0ac10b13          	add	s6,sp,172
    47fc:	f71fe06f          	j	376c <_vfprintf_r+0x814>
    4800:	200ef793          	and	a5,t4,512
    4804:	76079663          	bnez	a5,4f70 <_vfprintf_r+0x2018>
    4808:	00000c93          	li	s9,0
    480c:	db5ff06f          	j	45c0 <_vfprintf_r+0x1668>
    4810:	00000793          	li	a5,0
    4814:	15010b13          	add	s6,sp,336
    4818:	01212823          	sw	s2,16(sp)
    481c:	00078913          	mv	s2,a5
    4820:	00098793          	mv	a5,s3
    4824:	04812823          	sw	s0,80(sp)
    4828:	000b0993          	mv	s3,s6
    482c:	03c12403          	lw	s0,60(sp)
    4830:	40067493          	and	s1,a2,1024
    4834:	0ff00a13          	li	s4,255
    4838:	03c12023          	sw	t3,32(sp)
    483c:	02c12223          	sw	a2,36(sp)
    4840:	04612223          	sw	t1,68(sp)
    4844:	00078b13          	mv	s6,a5
    4848:	0280006f          	j	4870 <_vfprintf_r+0x1918>
    484c:	00a00613          	li	a2,10
    4850:	00000693          	li	a3,0
    4854:	000d0513          	mv	a0,s10
    4858:	000c8593          	mv	a1,s9
    485c:	581070ef          	jal	c5dc <__udivdi3>
    4860:	6a0c8ee3          	beqz	s9,571c <_vfprintf_r+0x27c4>
    4864:	00050d13          	mv	s10,a0
    4868:	00058c93          	mv	s9,a1
    486c:	000c0993          	mv	s3,s8
    4870:	00a00613          	li	a2,10
    4874:	00000693          	li	a3,0
    4878:	000d0513          	mv	a0,s10
    487c:	000c8593          	mv	a1,s9
    4880:	408080ef          	jal	cc88 <__umoddi3>
    4884:	03050513          	add	a0,a0,48
    4888:	fea98fa3          	sb	a0,-1(s3)
    488c:	fff98c13          	add	s8,s3,-1
    4890:	00190913          	add	s2,s2,1
    4894:	fa048ce3          	beqz	s1,484c <_vfprintf_r+0x18f4>
    4898:	00044783          	lbu	a5,0(s0)
    489c:	faf918e3          	bne	s2,a5,484c <_vfprintf_r+0x18f4>
    48a0:	fb4906e3          	beq	s2,s4,484c <_vfprintf_r+0x18f4>
    48a4:	560c9ae3          	bnez	s9,5618 <_vfprintf_r+0x26c0>
    48a8:	00900793          	li	a5,9
    48ac:	57a7e6e3          	bltu	a5,s10,5618 <_vfprintf_r+0x26c0>
    48b0:	02412603          	lw	a2,36(sp)
    48b4:	15010793          	add	a5,sp,336
    48b8:	02812e23          	sw	s0,60(sp)
    48bc:	01212c23          	sw	s2,24(sp)
    48c0:	02012e03          	lw	t3,32(sp)
    48c4:	01012903          	lw	s2,16(sp)
    48c8:	04412303          	lw	t1,68(sp)
    48cc:	05012403          	lw	s0,80(sp)
    48d0:	000b0993          	mv	s3,s6
    48d4:	41878d33          	sub	s10,a5,s8
    48d8:	00060e93          	mv	t4,a2
    48dc:	8ecff06f          	j	39c8 <_vfprintf_r+0xa70>
    48e0:	00812583          	lw	a1,8(sp)
    48e4:	0a010613          	add	a2,sp,160
    48e8:	00098513          	mv	a0,s3
    48ec:	04612e23          	sw	t1,92(sp)
    48f0:	05c12c23          	sw	t3,88(sp)
    48f4:	05d12a23          	sw	t4,84(sp)
    48f8:	05f12823          	sw	t6,80(sp)
    48fc:	04512223          	sw	t0,68(sp)
    4900:	514010ef          	jal	5e14 <__sprint_r>
    4904:	00050463          	beqz	a0,490c <_vfprintf_r+0x19b4>
    4908:	b21fe06f          	j	3428 <_vfprintf_r+0x4d0>
    490c:	07714603          	lbu	a2,119(sp)
    4910:	0a812483          	lw	s1,168(sp)
    4914:	05c12303          	lw	t1,92(sp)
    4918:	05812e03          	lw	t3,88(sp)
    491c:	05412e83          	lw	t4,84(sp)
    4920:	05012f83          	lw	t6,80(sp)
    4924:	04412283          	lw	t0,68(sp)
    4928:	0ac10413          	add	s0,sp,172
    492c:	88dfe06f          	j	31b8 <_vfprintf_r+0x260>
    4930:	02812883          	lw	a7,40(sp)
    4934:	02c12703          	lw	a4,44(sp)
    4938:	02612223          	sw	t1,36(sp)
    493c:	00088613          	mv	a2,a7
    4940:	00088513          	mv	a0,a7
    4944:	00070693          	mv	a3,a4
    4948:	00070593          	mv	a1,a4
    494c:	03c12023          	sw	t3,32(sp)
    4950:	01d12823          	sw	t4,16(sp)
    4954:	62d0a0ef          	jal	f780 <__unorddf2>
    4958:	01012e83          	lw	t4,16(sp)
    495c:	02012e03          	lw	t3,32(sp)
    4960:	02412303          	lw	t1,36(sp)
    4964:	00050463          	beqz	a0,496c <_vfprintf_r+0x1a14>
    4968:	0e00106f          	j	5a48 <_vfprintf_r+0x2af0>
    496c:	06100713          	li	a4,97
    4970:	08ee0263          	beq	t3,a4,49f4 <_vfprintf_r+0x1a9c>
    4974:	04100713          	li	a4,65
    4978:	05800793          	li	a5,88
    497c:	06ee0e63          	beq	t3,a4,49f8 <_vfprintf_r+0x1aa0>
    4980:	fff00713          	li	a4,-1
    4984:	00e31463          	bne	t1,a4,498c <_vfprintf_r+0x1a34>
    4988:	01c0106f          	j	59a4 <_vfprintf_r+0x2a4c>
    498c:	fdfe7713          	and	a4,t3,-33
    4990:	04700693          	li	a3,71
    4994:	00012823          	sw	zero,16(sp)
    4998:	00d71663          	bne	a4,a3,49a4 <_vfprintf_r+0x1a4c>
    499c:	00031463          	bnez	t1,49a4 <_vfprintf_r+0x1a4c>
    49a0:	00100313          	li	t1,1
    49a4:	100ee793          	or	a5,t4,256
    49a8:	00078b13          	mv	s6,a5
    49ac:	02c12783          	lw	a5,44(sp)
    49b0:	04012223          	sw	zero,68(sp)
    49b4:	00078493          	mv	s1,a5
    49b8:	0007da63          	bgez	a5,49cc <_vfprintf_r+0x1a74>
    49bc:	800004b7          	lui	s1,0x80000
    49c0:	00f4c4b3          	xor	s1,s1,a5
    49c4:	02d00793          	li	a5,45
    49c8:	04f12223          	sw	a5,68(sp)
    49cc:	fbfe0713          	add	a4,t3,-65
    49d0:	02500693          	li	a3,37
    49d4:	3ae6e463          	bltu	a3,a4,4d7c <_vfprintf_r+0x1e24>
    49d8:	0000c697          	auipc	a3,0xc
    49dc:	d0468693          	add	a3,a3,-764 # 106dc <_ctype_+0x270>
    49e0:	00271713          	sll	a4,a4,0x2
    49e4:	00d70733          	add	a4,a4,a3
    49e8:	00072703          	lw	a4,0(a4)
    49ec:	00d70733          	add	a4,a4,a3
    49f0:	00070067          	jr	a4
    49f4:	07800793          	li	a5,120
    49f8:	03000713          	li	a4,48
    49fc:	06e10c23          	sb	a4,120(sp)
    4a00:	06f10ca3          	sb	a5,121(sp)
    4a04:	06300713          	li	a4,99
    4a08:	00012823          	sw	zero,16(sp)
    4a0c:	002eee93          	or	t4,t4,2
    4a10:	0ec10c13          	add	s8,sp,236
    4a14:	f86758e3          	bge	a4,t1,49a4 <_vfprintf_r+0x1a4c>
    4a18:	00130593          	add	a1,t1,1
    4a1c:	00098513          	mv	a0,s3
    4a20:	03c12023          	sw	t3,32(sp)
    4a24:	01d12c23          	sw	t4,24(sp)
    4a28:	00612823          	sw	t1,16(sp)
    4a2c:	d35fd0ef          	jal	2760 <_malloc_r>
    4a30:	01012303          	lw	t1,16(sp)
    4a34:	01812e83          	lw	t4,24(sp)
    4a38:	02012e03          	lw	t3,32(sp)
    4a3c:	00050c13          	mv	s8,a0
    4a40:	00051463          	bnez	a0,4a48 <_vfprintf_r+0x1af0>
    4a44:	13c0106f          	j	5b80 <_vfprintf_r+0x2c28>
    4a48:	00a12823          	sw	a0,16(sp)
    4a4c:	f59ff06f          	j	49a4 <_vfprintf_r+0x1a4c>
    4a50:	00098513          	mv	a0,s3
    4a54:	1d0030ef          	jal	7c24 <__sinit>
    4a58:	00c12783          	lw	a5,12(sp)
    4a5c:	d5cfe06f          	j	2fb8 <_vfprintf_r+0x60>
    4a60:	00812583          	lw	a1,8(sp)
    4a64:	0a010613          	add	a2,sp,160
    4a68:	00098513          	mv	a0,s3
    4a6c:	03d12023          	sw	t4,32(sp)
    4a70:	3a4010ef          	jal	5e14 <__sprint_r>
    4a74:	00050463          	beqz	a0,4a7c <_vfprintf_r+0x1b24>
    4a78:	9b1fe06f          	j	3428 <_vfprintf_r+0x4d0>
    4a7c:	0a812483          	lw	s1,168(sp)
    4a80:	02012e83          	lw	t4,32(sp)
    4a84:	0ac10413          	add	s0,sp,172
    4a88:	9b0ff06f          	j	3c38 <_vfprintf_r+0xce0>
    4a8c:	00800613          	li	a2,8
    4a90:	00000593          	li	a1,0
    4a94:	09810513          	add	a0,sp,152
    4a98:	02612023          	sw	t1,32(sp)
    4a9c:	01c12a23          	sw	t3,20(sp)
    4aa0:	01d12823          	sw	t4,16(sp)
    4aa4:	09812223          	sw	s8,132(sp)
    4aa8:	d5cfd0ef          	jal	2004 <memset>
    4aac:	02012303          	lw	t1,32(sp)
    4ab0:	01012e83          	lw	t4,16(sp)
    4ab4:	01412e03          	lw	t3,20(sp)
    4ab8:	3a0340e3          	bltz	t1,5658 <_vfprintf_r+0x2700>
    4abc:	00000d13          	li	s10,0
    4ac0:	01212823          	sw	s2,16(sp)
    4ac4:	000c0c93          	mv	s9,s8
    4ac8:	fff00493          	li	s1,-1
    4acc:	000b0c13          	mv	s8,s6
    4ad0:	000e8a13          	mv	s4,t4
    4ad4:	00040b13          	mv	s6,s0
    4ad8:	000d0913          	mv	s2,s10
    4adc:	00030413          	mv	s0,t1
    4ae0:	0300006f          	j	4b10 <_vfprintf_r+0x1bb8>
    4ae4:	09810693          	add	a3,sp,152
    4ae8:	0ec10593          	add	a1,sp,236
    4aec:	00098513          	mv	a0,s3
    4af0:	110070ef          	jal	bc00 <_wcrtomb_r>
    4af4:	68950ae3          	beq	a0,s1,5988 <_vfprintf_r+0x2a30>
    4af8:	00a907b3          	add	a5,s2,a0
    4afc:	02f44263          	blt	s0,a5,4b20 <_vfprintf_r+0x1bc8>
    4b00:	004d0d13          	add	s10,s10,4
    4b04:	00879463          	bne	a5,s0,4b0c <_vfprintf_r+0x1bb4>
    4b08:	7990006f          	j	5aa0 <_vfprintf_r+0x2b48>
    4b0c:	00078913          	mv	s2,a5
    4b10:	08412783          	lw	a5,132(sp)
    4b14:	01a787b3          	add	a5,a5,s10
    4b18:	0007a603          	lw	a2,0(a5)
    4b1c:	fc0614e3          	bnez	a2,4ae4 <_vfprintf_r+0x1b8c>
    4b20:	00090d13          	mv	s10,s2
    4b24:	01412e03          	lw	t3,20(sp)
    4b28:	01012903          	lw	s2,16(sp)
    4b2c:	000b0413          	mv	s0,s6
    4b30:	000a0e93          	mv	t4,s4
    4b34:	000c0b13          	mv	s6,s8
    4b38:	000c8c13          	mv	s8,s9
    4b3c:	340d0ce3          	beqz	s10,5694 <_vfprintf_r+0x273c>
    4b40:	06300793          	li	a5,99
    4b44:	59a7dee3          	bge	a5,s10,58e0 <_vfprintf_r+0x2988>
    4b48:	001d0593          	add	a1,s10,1
    4b4c:	00098513          	mv	a0,s3
    4b50:	01c12a23          	sw	t3,20(sp)
    4b54:	01d12823          	sw	t4,16(sp)
    4b58:	c09fd0ef          	jal	2760 <_malloc_r>
    4b5c:	01012e83          	lw	t4,16(sp)
    4b60:	01412e03          	lw	t3,20(sp)
    4b64:	00050c13          	mv	s8,a0
    4b68:	620500e3          	beqz	a0,5988 <_vfprintf_r+0x2a30>
    4b6c:	00a12823          	sw	a0,16(sp)
    4b70:	00800613          	li	a2,8
    4b74:	00000593          	li	a1,0
    4b78:	09810513          	add	a0,sp,152
    4b7c:	03c12023          	sw	t3,32(sp)
    4b80:	01d12a23          	sw	t4,20(sp)
    4b84:	c80fd0ef          	jal	2004 <memset>
    4b88:	09810713          	add	a4,sp,152
    4b8c:	000d0693          	mv	a3,s10
    4b90:	08410613          	add	a2,sp,132
    4b94:	000c0593          	mv	a1,s8
    4b98:	00098513          	mv	a0,s3
    4b9c:	0f0070ef          	jal	bc8c <_wcsrtombs_r>
    4ba0:	01412e83          	lw	t4,20(sp)
    4ba4:	02012e03          	lw	t3,32(sp)
    4ba8:	00ad0463          	beq	s10,a0,4bb0 <_vfprintf_r+0x1c58>
    4bac:	0240106f          	j	5bd0 <_vfprintf_r+0x2c78>
    4bb0:	01ac0733          	add	a4,s8,s10
    4bb4:	00070023          	sb	zero,0(a4)
    4bb8:	07714603          	lbu	a2,119(sp)
    4bbc:	fffd4813          	not	a6,s10
    4bc0:	41f85813          	sra	a6,a6,0x1f
    4bc4:	01612a23          	sw	s6,20(sp)
    4bc8:	02012223          	sw	zero,36(sp)
    4bcc:	02012023          	sw	zero,32(sp)
    4bd0:	010d7cb3          	and	s9,s10,a6
    4bd4:	00000313          	li	t1,0
    4bd8:	00000a13          	li	s4,0
    4bdc:	00061463          	bnez	a2,4be4 <_vfprintf_r+0x1c8c>
    4be0:	db8fe06f          	j	3198 <_vfprintf_r+0x240>
    4be4:	9d5fe06f          	j	35b8 <_vfprintf_r+0x660>
    4be8:	00048e93          	mv	t4,s1
    4bec:	000a0293          	mv	t0,s4
    4bf0:	00070493          	mv	s1,a4
    4bf4:	01a484b3          	add	s1,s1,s10
    4bf8:	00178793          	add	a5,a5,1
    4bfc:	00542023          	sw	t0,0(s0)
    4c00:	e48fe06f          	j	3248 <_vfprintf_r+0x2f0>
    4c04:	01412783          	lw	a5,20(sp)
    4c08:	00c12703          	lw	a4,12(sp)
    4c0c:	0007a783          	lw	a5,0(a5)
    4c10:	00e7a023          	sw	a4,0(a5)
    4c14:	fadfe06f          	j	3bc0 <_vfprintf_r+0xc68>
    4c18:	02012e83          	lw	t4,32(sp)
    4c1c:	00040293          	mv	t0,s0
    4c20:	000a0413          	mv	s0,s4
    4c24:	008484b3          	add	s1,s1,s0
    4c28:	001d0d13          	add	s10,s10,1
    4c2c:	005b2023          	sw	t0,0(s6)
    4c30:	b7dfe06f          	j	37ac <_vfprintf_r+0x854>
    4c34:	03412703          	lw	a4,52(sp)
    4c38:	03012783          	lw	a5,48(sp)
    4c3c:	00700613          	li	a2,7
    4c40:	00e42023          	sw	a4,0(s0)
    4c44:	0a412703          	lw	a4,164(sp)
    4c48:	009784b3          	add	s1,a5,s1
    4c4c:	00f42223          	sw	a5,4(s0)
    4c50:	00170713          	add	a4,a4,1
    4c54:	0a912423          	sw	s1,168(sp)
    4c58:	0ae12223          	sw	a4,164(sp)
    4c5c:	00840413          	add	s0,s0,8
    4c60:	3ae64463          	blt	a2,a4,5008 <_vfprintf_r+0x20b0>
    4c64:	3e06cee3          	bltz	a3,5860 <_vfprintf_r+0x2908>
    4c68:	01812783          	lw	a5,24(sp)
    4c6c:	00170713          	add	a4,a4,1
    4c70:	01842023          	sw	s8,0(s0)
    4c74:	009784b3          	add	s1,a5,s1
    4c78:	00f42223          	sw	a5,4(s0)
    4c7c:	0a912423          	sw	s1,168(sp)
    4c80:	0ae12223          	sw	a4,164(sp)
    4c84:	00700793          	li	a5,7
    4c88:	00e7c463          	blt	a5,a4,4c90 <_vfprintf_r+0x1d38>
    4c8c:	dd0fe06f          	j	325c <_vfprintf_r+0x304>
    4c90:	b61fe06f          	j	37f0 <_vfprintf_r+0x898>
    4c94:	01000613          	li	a2,16
    4c98:	0a412683          	lw	a3,164(sp)
    4c9c:	0000c297          	auipc	t0,0xc
    4ca0:	ad828293          	add	t0,t0,-1320 # 10774 <zeroes.0>
    4ca4:	09665463          	bge	a2,s6,4d2c <_vfprintf_r+0x1dd4>
    4ca8:	00040793          	mv	a5,s0
    4cac:	00048713          	mv	a4,s1
    4cb0:	00812403          	lw	s0,8(sp)
    4cb4:	01000893          	li	a7,16
    4cb8:	00700d13          	li	s10,7
    4cbc:	05d12223          	sw	t4,68(sp)
    4cc0:	00028493          	mv	s1,t0
    4cc4:	00c0006f          	j	4cd0 <_vfprintf_r+0x1d78>
    4cc8:	ff0b0b13          	add	s6,s6,-16
    4ccc:	0568d863          	bge	a7,s6,4d1c <_vfprintf_r+0x1dc4>
    4cd0:	01070713          	add	a4,a4,16
    4cd4:	00168693          	add	a3,a3,1
    4cd8:	0097a023          	sw	s1,0(a5)
    4cdc:	0117a223          	sw	a7,4(a5)
    4ce0:	0ae12423          	sw	a4,168(sp)
    4ce4:	0ad12223          	sw	a3,164(sp)
    4ce8:	00878793          	add	a5,a5,8
    4cec:	fcdd5ee3          	bge	s10,a3,4cc8 <_vfprintf_r+0x1d70>
    4cf0:	0a010613          	add	a2,sp,160
    4cf4:	00040593          	mv	a1,s0
    4cf8:	00098513          	mv	a0,s3
    4cfc:	118010ef          	jal	5e14 <__sprint_r>
    4d00:	00050463          	beqz	a0,4d08 <_vfprintf_r+0x1db0>
    4d04:	f24fe06f          	j	3428 <_vfprintf_r+0x4d0>
    4d08:	0a812703          	lw	a4,168(sp)
    4d0c:	0a412683          	lw	a3,164(sp)
    4d10:	0ac10793          	add	a5,sp,172
    4d14:	01000893          	li	a7,16
    4d18:	fb1ff06f          	j	4cc8 <_vfprintf_r+0x1d70>
    4d1c:	04412e83          	lw	t4,68(sp)
    4d20:	00048293          	mv	t0,s1
    4d24:	00078413          	mv	s0,a5
    4d28:	00070493          	mv	s1,a4
    4d2c:	016484b3          	add	s1,s1,s6
    4d30:	00168693          	add	a3,a3,1
    4d34:	00542023          	sw	t0,0(s0)
    4d38:	01642223          	sw	s6,4(s0)
    4d3c:	0a912423          	sw	s1,168(sp)
    4d40:	0ad12223          	sw	a3,164(sp)
    4d44:	00700713          	li	a4,7
    4d48:	00840413          	add	s0,s0,8
    4d4c:	bed75c63          	bge	a4,a3,4144 <_vfprintf_r+0x11ec>
    4d50:	00812583          	lw	a1,8(sp)
    4d54:	0a010613          	add	a2,sp,160
    4d58:	00098513          	mv	a0,s3
    4d5c:	05d12223          	sw	t4,68(sp)
    4d60:	0b4010ef          	jal	5e14 <__sprint_r>
    4d64:	00050463          	beqz	a0,4d6c <_vfprintf_r+0x1e14>
    4d68:	ec0fe06f          	j	3428 <_vfprintf_r+0x4d0>
    4d6c:	0a812483          	lw	s1,168(sp)
    4d70:	04412e83          	lw	t4,68(sp)
    4d74:	0ac10413          	add	s0,sp,172
    4d78:	bccff06f          	j	4144 <_vfprintf_r+0x11ec>
    4d7c:	02812703          	lw	a4,40(sp)
    4d80:	09810893          	add	a7,sp,152
    4d84:	08410813          	add	a6,sp,132
    4d88:	00070513          	mv	a0,a4
    4d8c:	00050593          	mv	a1,a0
    4d90:	00030713          	mv	a4,t1
    4d94:	07c10793          	add	a5,sp,124
    4d98:	00200693          	li	a3,2
    4d9c:	00048613          	mv	a2,s1
    4da0:	00098513          	mv	a0,s3
    4da4:	03c12223          	sw	t3,36(sp)
    4da8:	03d12023          	sw	t4,32(sp)
    4dac:	00612c23          	sw	t1,24(sp)
    4db0:	3a8040ef          	jal	9158 <_dtoa_r>
    4db4:	02012e83          	lw	t4,32(sp)
    4db8:	01812303          	lw	t1,24(sp)
    4dbc:	02412e03          	lw	t3,36(sp)
    4dc0:	001ef713          	and	a4,t4,1
    4dc4:	00050c13          	mv	s8,a0
    4dc8:	1a0712e3          	bnez	a4,576c <_vfprintf_r+0x2814>
    4dcc:	09812783          	lw	a5,152(sp)
    4dd0:	07c12a03          	lw	s4,124(sp)
    4dd4:	40a787b3          	sub	a5,a5,a0
    4dd8:	00f12c23          	sw	a5,24(sp)
    4ddc:	ffd00713          	li	a4,-3
    4de0:	00ea4463          	blt	s4,a4,4de8 <_vfprintf_r+0x1e90>
    4de4:	5b435663          	bge	t1,s4,5390 <_vfprintf_r+0x2438>
    4de8:	ffee0e13          	add	t3,t3,-2
    4dec:	fffa0d13          	add	s10,s4,-1
    4df0:	07a12e23          	sw	s10,124(sp)
    4df4:	0ffe7693          	zext.b	a3,t3
    4df8:	00000613          	li	a2,0
    4dfc:	08d10423          	sb	a3,136(sp)
    4e00:	02b00693          	li	a3,43
    4e04:	000d5863          	bgez	s10,4e14 <_vfprintf_r+0x1ebc>
    4e08:	00100713          	li	a4,1
    4e0c:	41470d33          	sub	s10,a4,s4
    4e10:	02d00693          	li	a3,45
    4e14:	08d104a3          	sb	a3,137(sp)
    4e18:	00900693          	li	a3,9
    4e1c:	33a6d8e3          	bge	a3,s10,594c <_vfprintf_r+0x29f4>
    4e20:	000c0793          	mv	a5,s8
    4e24:	09f10493          	add	s1,sp,159
    4e28:	03212023          	sw	s2,32(sp)
    4e2c:	00040c13          	mv	s8,s0
    4e30:	06300a13          	li	s4,99
    4e34:	000d0413          	mv	s0,s10
    4e38:	03d12223          	sw	t4,36(sp)
    4e3c:	05c12023          	sw	t3,64(sp)
    4e40:	00048913          	mv	s2,s1
    4e44:	00098c93          	mv	s9,s3
    4e48:	00078d13          	mv	s10,a5
    4e4c:	00a00593          	li	a1,10
    4e50:	00040513          	mv	a0,s0
    4e54:	09c0b0ef          	jal	fef0 <__modsi3>
    4e58:	03050713          	add	a4,a0,48
    4e5c:	00090b13          	mv	s6,s2
    4e60:	00040513          	mv	a0,s0
    4e64:	feeb0fa3          	sb	a4,-1(s6)
    4e68:	00a00593          	li	a1,10
    4e6c:	00040993          	mv	s3,s0
    4e70:	7fd0a0ef          	jal	fe6c <__divsi3>
    4e74:	fff90913          	add	s2,s2,-1
    4e78:	00050413          	mv	s0,a0
    4e7c:	fd3a48e3          	blt	s4,s3,4e4c <_vfprintf_r+0x1ef4>
    4e80:	000c8993          	mv	s3,s9
    4e84:	03050713          	add	a4,a0,48
    4e88:	00090c93          	mv	s9,s2
    4e8c:	ffeb0693          	add	a3,s6,-2
    4e90:	feec8fa3          	sb	a4,-1(s9)
    4e94:	000c0413          	mv	s0,s8
    4e98:	02412e83          	lw	t4,36(sp)
    4e9c:	04012e03          	lw	t3,64(sp)
    4ea0:	02012903          	lw	s2,32(sp)
    4ea4:	000d0c13          	mv	s8,s10
    4ea8:	4c96f6e3          	bgeu	a3,s1,5b74 <_vfprintf_r+0x2c1c>
    4eac:	08a10713          	add	a4,sp,138
    4eb0:	0006c783          	lbu	a5,0(a3)
    4eb4:	00168693          	add	a3,a3,1
    4eb8:	00170713          	add	a4,a4,1
    4ebc:	fef70fa3          	sb	a5,-1(a4)
    4ec0:	fe9698e3          	bne	a3,s1,4eb0 <_vfprintf_r+0x1f58>
    4ec4:	15010793          	add	a5,sp,336
    4ec8:	41678633          	sub	a2,a5,s6
    4ecc:	f5360793          	add	a5,a2,-173
    4ed0:	04f12023          	sw	a5,64(sp)
    4ed4:	01812783          	lw	a5,24(sp)
    4ed8:	04012683          	lw	a3,64(sp)
    4edc:	00100713          	li	a4,1
    4ee0:	00d78d33          	add	s10,a5,a3
    4ee4:	28f75ce3          	bge	a4,a5,597c <_vfprintf_r+0x2a24>
    4ee8:	03012783          	lw	a5,48(sp)
    4eec:	00fd0d33          	add	s10,s10,a5
    4ef0:	fffd4813          	not	a6,s10
    4ef4:	bffeff13          	and	t5,t4,-1025
    4ef8:	41f85813          	sra	a6,a6,0x1f
    4efc:	100f6e93          	or	t4,t5,256
    4f00:	010d7cb3          	and	s9,s10,a6
    4f04:	02012223          	sw	zero,36(sp)
    4f08:	02012023          	sw	zero,32(sp)
    4f0c:	00000a13          	li	s4,0
    4f10:	04412783          	lw	a5,68(sp)
    4f14:	46079263          	bnez	a5,5378 <_vfprintf_r+0x2420>
    4f18:	07714603          	lbu	a2,119(sp)
    4f1c:	00000313          	li	t1,0
    4f20:	00061463          	bnez	a2,4f28 <_vfprintf_r+0x1fd0>
    4f24:	a74fe06f          	j	3198 <_vfprintf_r+0x240>
    4f28:	e90fe06f          	j	35b8 <_vfprintf_r+0x660>
    4f2c:	00812583          	lw	a1,8(sp)
    4f30:	0a010613          	add	a2,sp,160
    4f34:	00098513          	mv	a0,s3
    4f38:	03d12023          	sw	t4,32(sp)
    4f3c:	6d9000ef          	jal	5e14 <__sprint_r>
    4f40:	00050463          	beqz	a0,4f48 <_vfprintf_r+0x1ff0>
    4f44:	ce4fe06f          	j	3428 <_vfprintf_r+0x4d0>
    4f48:	07c12683          	lw	a3,124(sp)
    4f4c:	0a812483          	lw	s1,168(sp)
    4f50:	02012e83          	lw	t4,32(sp)
    4f54:	0ac10413          	add	s0,sp,172
    4f58:	ce0ff06f          	j	4438 <_vfprintf_r+0x14e0>
    4f5c:	00600c93          	li	s9,6
    4f60:	f14ff06f          	j	4674 <_vfprintf_r+0x171c>
    4f64:	0ffd7d13          	zext.b	s10,s10
    4f68:	00000c93          	li	s9,0
    4f6c:	bd5fe06f          	j	3b40 <_vfprintf_r+0xbe8>
    4f70:	0ffd7d13          	zext.b	s10,s10
    4f74:	00000c93          	li	s9,0
    4f78:	e48ff06f          	j	45c0 <_vfprintf_r+0x1668>
    4f7c:	018d1d13          	sll	s10,s10,0x18
    4f80:	418d5d13          	sra	s10,s10,0x18
    4f84:	41fd5c93          	sra	s9,s10,0x1f
    4f88:	000c8793          	mv	a5,s9
    4f8c:	b39fe06f          	j	3ac4 <_vfprintf_r+0xb6c>
    4f90:	01412783          	lw	a5,20(sp)
    4f94:	00c12703          	lw	a4,12(sp)
    4f98:	0007a783          	lw	a5,0(a5)
    4f9c:	00e79023          	sh	a4,0(a5)
    4fa0:	c21fe06f          	j	3bc0 <_vfprintf_r+0xc68>
    4fa4:	000c0513          	mv	a0,s8
    4fa8:	05d12223          	sw	t4,68(sp)
    4fac:	ad8fd0ef          	jal	2284 <strlen>
    4fb0:	07714603          	lbu	a2,119(sp)
    4fb4:	fff54813          	not	a6,a0
    4fb8:	41f85813          	sra	a6,a6,0x1f
    4fbc:	01612a23          	sw	s6,20(sp)
    4fc0:	02012223          	sw	zero,36(sp)
    4fc4:	02012023          	sw	zero,32(sp)
    4fc8:	00012823          	sw	zero,16(sp)
    4fcc:	04412e83          	lw	t4,68(sp)
    4fd0:	00050d13          	mv	s10,a0
    4fd4:	01057cb3          	and	s9,a0,a6
    4fd8:	00000313          	li	t1,0
    4fdc:	07300e13          	li	t3,115
    4fe0:	00061463          	bnez	a2,4fe8 <_vfprintf_r+0x2090>
    4fe4:	9b4fe06f          	j	3198 <_vfprintf_r+0x240>
    4fe8:	dd0fe06f          	j	35b8 <_vfprintf_r+0x660>
    4fec:	00812583          	lw	a1,8(sp)
    4ff0:	0a010613          	add	a2,sp,160
    4ff4:	00098513          	mv	a0,s3
    4ff8:	61d000ef          	jal	5e14 <__sprint_r>
    4ffc:	00051463          	bnez	a0,5004 <_vfprintf_r+0x20ac>
    5000:	be8fe06f          	j	33e8 <_vfprintf_r+0x490>
    5004:	c38fe06f          	j	343c <_vfprintf_r+0x4e4>
    5008:	00812583          	lw	a1,8(sp)
    500c:	0a010613          	add	a2,sp,160
    5010:	00098513          	mv	a0,s3
    5014:	03d12023          	sw	t4,32(sp)
    5018:	5fd000ef          	jal	5e14 <__sprint_r>
    501c:	00050463          	beqz	a0,5024 <_vfprintf_r+0x20cc>
    5020:	c08fe06f          	j	3428 <_vfprintf_r+0x4d0>
    5024:	07c12683          	lw	a3,124(sp)
    5028:	0a812483          	lw	s1,168(sp)
    502c:	0a412703          	lw	a4,164(sp)
    5030:	02012e83          	lw	t4,32(sp)
    5034:	0ac10413          	add	s0,sp,172
    5038:	c2dff06f          	j	4c64 <_vfprintf_r+0x1d0c>
    503c:	05862503          	lw	a0,88(a2)
    5040:	00f12623          	sw	a5,12(sp)
    5044:	fbdfc0ef          	jal	2000 <__retarget_lock_release_recursive>
    5048:	00c12783          	lw	a5,12(sp)
    504c:	ab8fe06f          	j	3304 <_vfprintf_r+0x3ac>
    5050:	00130a13          	add	s4,t1,1
    5054:	00200693          	li	a3,2
    5058:	02812703          	lw	a4,40(sp)
    505c:	09810893          	add	a7,sp,152
    5060:	08410813          	add	a6,sp,132
    5064:	00070513          	mv	a0,a4
    5068:	00050593          	mv	a1,a0
    506c:	000a0713          	mv	a4,s4
    5070:	07c10793          	add	a5,sp,124
    5074:	00048613          	mv	a2,s1
    5078:	00098513          	mv	a0,s3
    507c:	02612223          	sw	t1,36(sp)
    5080:	03c12023          	sw	t3,32(sp)
    5084:	01d12c23          	sw	t4,24(sp)
    5088:	0d0040ef          	jal	9158 <_dtoa_r>
    508c:	02012e03          	lw	t3,32(sp)
    5090:	04600693          	li	a3,70
    5094:	01812e83          	lw	t4,24(sp)
    5098:	fdfe7d13          	and	s10,t3,-33
    509c:	02412303          	lw	t1,36(sp)
    50a0:	00050c13          	mv	s8,a0
    50a4:	01450733          	add	a4,a0,s4
    50a8:	34dd14e3          	bne	s10,a3,5bf0 <_vfprintf_r+0x2c98>
    50ac:	000c4603          	lbu	a2,0(s8)
    50b0:	03000693          	li	a3,48
    50b4:	6cd60263          	beq	a2,a3,5778 <_vfprintf_r+0x2820>
    50b8:	07c12683          	lw	a3,124(sp)
    50bc:	00d70733          	add	a4,a4,a3
    50c0:	02812683          	lw	a3,40(sp)
    50c4:	00048593          	mv	a1,s1
    50c8:	00000613          	li	a2,0
    50cc:	00068513          	mv	a0,a3
    50d0:	00000693          	li	a3,0
    50d4:	04e12823          	sw	a4,80(sp)
    50d8:	02612223          	sw	t1,36(sp)
    50dc:	03c12023          	sw	t3,32(sp)
    50e0:	01d12c23          	sw	t4,24(sp)
    50e4:	370090ef          	jal	e454 <__eqdf2>
    50e8:	01812e83          	lw	t4,24(sp)
    50ec:	02012e03          	lw	t3,32(sp)
    50f0:	02412303          	lw	t1,36(sp)
    50f4:	05012703          	lw	a4,80(sp)
    50f8:	62050863          	beqz	a0,5728 <_vfprintf_r+0x27d0>
    50fc:	09812783          	lw	a5,152(sp)
    5100:	00e7fe63          	bgeu	a5,a4,511c <_vfprintf_r+0x21c4>
    5104:	03000613          	li	a2,48
    5108:	00178693          	add	a3,a5,1
    510c:	08d12c23          	sw	a3,152(sp)
    5110:	00c78023          	sb	a2,0(a5)
    5114:	09812783          	lw	a5,152(sp)
    5118:	fee7e8e3          	bltu	a5,a4,5108 <_vfprintf_r+0x21b0>
    511c:	07c12a03          	lw	s4,124(sp)
    5120:	418787b3          	sub	a5,a5,s8
    5124:	04700713          	li	a4,71
    5128:	00f12c23          	sw	a5,24(sp)
    512c:	caed08e3          	beq	s10,a4,4ddc <_vfprintf_r+0x1e84>
    5130:	04600713          	li	a4,70
    5134:	68ed0863          	beq	s10,a4,57c4 <_vfprintf_r+0x286c>
    5138:	fffa0d13          	add	s10,s4,-1
    513c:	cb5ff06f          	j	4df0 <_vfprintf_r+0x1e98>
    5140:	02812703          	lw	a4,40(sp)
    5144:	07c10613          	add	a2,sp,124
    5148:	00048593          	mv	a1,s1
    514c:	00070513          	mv	a0,a4
    5150:	02612223          	sw	t1,36(sp)
    5154:	03c12023          	sw	t3,32(sp)
    5158:	01d12c23          	sw	t4,24(sp)
    515c:	4e9030ef          	jal	8e44 <frexp>
    5160:	7fffb717          	auipc	a4,0x7fffb
    5164:	54870713          	add	a4,a4,1352 # 800006a8 <__global_locale+0x174>
    5168:	00072603          	lw	a2,0(a4)
    516c:	00472683          	lw	a3,4(a4)
    5170:	578090ef          	jal	e6e8 <__muldf3>
    5174:	00000613          	li	a2,0
    5178:	00000693          	li	a3,0
    517c:	00050a13          	mv	s4,a0
    5180:	00058d13          	mv	s10,a1
    5184:	2d0090ef          	jal	e454 <__eqdf2>
    5188:	01812e83          	lw	t4,24(sp)
    518c:	02012e03          	lw	t3,32(sp)
    5190:	02412303          	lw	t1,36(sp)
    5194:	00051663          	bnez	a0,51a0 <_vfprintf_r+0x2248>
    5198:	00100713          	li	a4,1
    519c:	06e12e23          	sw	a4,124(sp)
    51a0:	0000b797          	auipc	a5,0xb
    51a4:	10078793          	add	a5,a5,256 # 102a0 <__fini_array_end+0x2f8>
    51a8:	06100713          	li	a4,97
    51ac:	02f12023          	sw	a5,32(sp)
    51b0:	00ee1863          	bne	t3,a4,51c0 <_vfprintf_r+0x2268>
    51b4:	0000b797          	auipc	a5,0xb
    51b8:	0d878793          	add	a5,a5,216 # 1028c <__fini_array_end+0x2e4>
    51bc:	02f12023          	sw	a5,32(sp)
    51c0:	7fffb717          	auipc	a4,0x7fffb
    51c4:	4f070713          	add	a4,a4,1264 # 800006b0 <__global_locale+0x17c>
    51c8:	00072783          	lw	a5,0(a4)
    51cc:	00472803          	lw	a6,4(a4)
    51d0:	000c0493          	mv	s1,s8
    51d4:	00f12c23          	sw	a5,24(sp)
    51d8:	000d0793          	mv	a5,s10
    51dc:	03212223          	sw	s2,36(sp)
    51e0:	000c0d13          	mv	s10,s8
    51e4:	02012903          	lw	s2,32(sp)
    51e8:	00098c13          	mv	s8,s3
    51ec:	01012e23          	sw	a6,28(sp)
    51f0:	fff30b13          	add	s6,t1,-1
    51f4:	fff00c93          	li	s9,-1
    51f8:	05d12023          	sw	t4,64(sp)
    51fc:	05c12823          	sw	t3,80(sp)
    5200:	04812a23          	sw	s0,84(sp)
    5204:	00078993          	mv	s3,a5
    5208:	01c0006f          	j	5224 <_vfprintf_r+0x22cc>
    520c:	00000613          	li	a2,0
    5210:	00000693          	li	a3,0
    5214:	fffb0413          	add	s0,s6,-1
    5218:	23c090ef          	jal	e454 <__eqdf2>
    521c:	0a0504e3          	beqz	a0,5ac4 <_vfprintf_r+0x2b6c>
    5220:	00040b13          	mv	s6,s0
    5224:	01812603          	lw	a2,24(sp)
    5228:	01c12683          	lw	a3,28(sp)
    522c:	000a0513          	mv	a0,s4
    5230:	00098593          	mv	a1,s3
    5234:	4b4090ef          	jal	e6e8 <__muldf3>
    5238:	00058a13          	mv	s4,a1
    523c:	00050993          	mv	s3,a0
    5240:	5940a0ef          	jal	f7d4 <__fixdfsi>
    5244:	00050413          	mv	s0,a0
    5248:	6100a0ef          	jal	f858 <__floatsidf>
    524c:	00050613          	mv	a2,a0
    5250:	00058693          	mv	a3,a1
    5254:	00098513          	mv	a0,s3
    5258:	000a0593          	mv	a1,s4
    525c:	41d090ef          	jal	ee78 <__subdf3>
    5260:	00890733          	add	a4,s2,s0
    5264:	00074703          	lbu	a4,0(a4)
    5268:	00048813          	mv	a6,s1
    526c:	00050a13          	mv	s4,a0
    5270:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    5274:	00058993          	mv	s3,a1
    5278:	00148493          	add	s1,s1,1
    527c:	f99b18e3          	bne	s6,s9,520c <_vfprintf_r+0x22b4>
    5280:	7fffb697          	auipc	a3,0x7fffb
    5284:	43868693          	add	a3,a3,1080 # 800006b8 <__global_locale+0x184>
    5288:	0006a303          	lw	t1,0(a3)
    528c:	0046a383          	lw	t2,4(a3)
    5290:	05012e03          	lw	t3,80(sp)
    5294:	00030613          	mv	a2,t1
    5298:	00038693          	mv	a3,t2
    529c:	01012c23          	sw	a6,24(sp)
    52a0:	02412903          	lw	s2,36(sp)
    52a4:	000c0993          	mv	s3,s8
    52a8:	03c12223          	sw	t3,36(sp)
    52ac:	000d0c13          	mv	s8,s10
    52b0:	00058d13          	mv	s10,a1
    52b4:	22c090ef          	jal	e4e0 <__gedf2>
    52b8:	7fffb797          	auipc	a5,0x7fffb
    52bc:	40078793          	add	a5,a5,1024 # 800006b8 <__global_locale+0x184>
    52c0:	00040b13          	mv	s6,s0
    52c4:	0007a303          	lw	t1,0(a5)
    52c8:	05412403          	lw	s0,84(sp)
    52cc:	0047a383          	lw	t2,4(a5)
    52d0:	01812803          	lw	a6,24(sp)
    52d4:	02412e03          	lw	t3,36(sp)
    52d8:	04012e83          	lw	t4,64(sp)
    52dc:	0aa05ce3          	blez	a0,5b94 <_vfprintf_r+0x2c3c>
    52e0:	02012783          	lw	a5,32(sp)
    52e4:	09012c23          	sw	a6,152(sp)
    52e8:	fff4c603          	lbu	a2,-1(s1)
    52ec:	00f7c583          	lbu	a1,15(a5)
    52f0:	00048693          	mv	a3,s1
    52f4:	02b61063          	bne	a2,a1,5314 <_vfprintf_r+0x23bc>
    52f8:	03000513          	li	a0,48
    52fc:	fea68fa3          	sb	a0,-1(a3)
    5300:	09812683          	lw	a3,152(sp)
    5304:	fff68793          	add	a5,a3,-1
    5308:	08f12c23          	sw	a5,152(sp)
    530c:	fff6c603          	lbu	a2,-1(a3)
    5310:	feb606e3          	beq	a2,a1,52fc <_vfprintf_r+0x23a4>
    5314:	00160593          	add	a1,a2,1
    5318:	03900513          	li	a0,57
    531c:	0ff5f593          	zext.b	a1,a1
    5320:	04a60463          	beq	a2,a0,5368 <_vfprintf_r+0x2410>
    5324:	feb68fa3          	sb	a1,-1(a3)
    5328:	00048793          	mv	a5,s1
    532c:	07c12a03          	lw	s4,124(sp)
    5330:	418787b3          	sub	a5,a5,s8
    5334:	06100613          	li	a2,97
    5338:	fffa0d13          	add	s10,s4,-1
    533c:	00f12c23          	sw	a5,24(sp)
    5340:	07a12e23          	sw	s10,124(sp)
    5344:	07000693          	li	a3,112
    5348:	00ce0663          	beq	t3,a2,5354 <_vfprintf_r+0x23fc>
    534c:	05000693          	li	a3,80
    5350:	04100e13          	li	t3,65
    5354:	00100613          	li	a2,1
    5358:	aa5ff06f          	j	4dfc <_vfprintf_r+0x1ea4>
    535c:	00030a13          	mv	s4,t1
    5360:	00300693          	li	a3,3
    5364:	cf5ff06f          	j	5058 <_vfprintf_r+0x2100>
    5368:	02012783          	lw	a5,32(sp)
    536c:	00a7c583          	lbu	a1,10(a5)
    5370:	feb68fa3          	sb	a1,-1(a3)
    5374:	fb5ff06f          	j	5328 <_vfprintf_r+0x23d0>
    5378:	02d00713          	li	a4,45
    537c:	06e10ba3          	sb	a4,119(sp)
    5380:	02d00613          	li	a2,45
    5384:	00000313          	li	t1,0
    5388:	001c8c93          	add	s9,s9,1
    538c:	e0dfd06f          	j	3198 <_vfprintf_r+0x240>
    5390:	01812783          	lw	a5,24(sp)
    5394:	46fa4063          	blt	s4,a5,57f4 <_vfprintf_r+0x289c>
    5398:	001ef713          	and	a4,t4,1
    539c:	000a0d13          	mv	s10,s4
    53a0:	00070663          	beqz	a4,53ac <_vfprintf_r+0x2454>
    53a4:	03012783          	lw	a5,48(sp)
    53a8:	00fa0d33          	add	s10,s4,a5
    53ac:	400eff13          	and	t5,t4,1024
    53b0:	000f0463          	beqz	t5,53b8 <_vfprintf_r+0x2460>
    53b4:	5f404e63          	bgtz	s4,59b0 <_vfprintf_r+0x2a58>
    53b8:	fffd4813          	not	a6,s10
    53bc:	41f85813          	sra	a6,a6,0x1f
    53c0:	010d7cb3          	and	s9,s10,a6
    53c4:	06700e13          	li	t3,103
    53c8:	000b0e93          	mv	t4,s6
    53cc:	02012223          	sw	zero,36(sp)
    53d0:	02012023          	sw	zero,32(sp)
    53d4:	b3dff06f          	j	4f10 <_vfprintf_r+0x1fb8>
    53d8:	02d00793          	li	a5,45
    53dc:	06f10ba3          	sb	a5,119(sp)
    53e0:	02d00613          	li	a2,45
    53e4:	998fe06f          	j	357c <_vfprintf_r+0x624>
    53e8:	01812783          	lw	a5,24(sp)
    53ec:	02012a03          	lw	s4,32(sp)
    53f0:	05212823          	sw	s2,80(sp)
    53f4:	00fc07b3          	add	a5,s8,a5
    53f8:	05712c23          	sw	s7,88(sp)
    53fc:	05912e23          	sw	s9,92(sp)
    5400:	00040713          	mv	a4,s0
    5404:	04f12223          	sw	a5,68(sp)
    5408:	02412403          	lw	s0,36(sp)
    540c:	05d12a23          	sw	t4,84(sp)
    5410:	03812223          	sw	s8,36(sp)
    5414:	03c12b83          	lw	s7,60(sp)
    5418:	04c12c83          	lw	s9,76(sp)
    541c:	00812903          	lw	s2,8(sp)
    5420:	00700693          	li	a3,7
    5424:	01000d13          	li	s10,16
    5428:	0000bb17          	auipc	s6,0xb
    542c:	34cb0b13          	add	s6,s6,844 # 10774 <zeroes.0>
    5430:	00048613          	mv	a2,s1
    5434:	00030c13          	mv	s8,t1
    5438:	09405863          	blez	s4,54c8 <_vfprintf_r+0x2570>
    543c:	16805e63          	blez	s0,55b8 <_vfprintf_r+0x2660>
    5440:	fff40413          	add	s0,s0,-1
    5444:	04812783          	lw	a5,72(sp)
    5448:	01960633          	add	a2,a2,s9
    544c:	01972223          	sw	s9,4(a4)
    5450:	00f72023          	sw	a5,0(a4)
    5454:	0a412783          	lw	a5,164(sp)
    5458:	0ac12423          	sw	a2,168(sp)
    545c:	00870713          	add	a4,a4,8
    5460:	00178793          	add	a5,a5,1
    5464:	0af12223          	sw	a5,164(sp)
    5468:	14f6ce63          	blt	a3,a5,55c4 <_vfprintf_r+0x266c>
    546c:	04412783          	lw	a5,68(sp)
    5470:	000bc583          	lbu	a1,0(s7)
    5474:	418784b3          	sub	s1,a5,s8
    5478:	0095d463          	bge	a1,s1,5480 <_vfprintf_r+0x2528>
    547c:	00058493          	mv	s1,a1
    5480:	02905663          	blez	s1,54ac <_vfprintf_r+0x2554>
    5484:	0a412583          	lw	a1,164(sp)
    5488:	00960633          	add	a2,a2,s1
    548c:	01872023          	sw	s8,0(a4)
    5490:	00158593          	add	a1,a1,1
    5494:	00972223          	sw	s1,4(a4)
    5498:	0ac12423          	sw	a2,168(sp)
    549c:	0ab12223          	sw	a1,164(sp)
    54a0:	14b6c663          	blt	a3,a1,55ec <_vfprintf_r+0x2694>
    54a4:	000bc583          	lbu	a1,0(s7)
    54a8:	00870713          	add	a4,a4,8
    54ac:	fff4c513          	not	a0,s1
    54b0:	41f55513          	sra	a0,a0,0x1f
    54b4:	00a4f7b3          	and	a5,s1,a0
    54b8:	40f584b3          	sub	s1,a1,a5
    54bc:	04904663          	bgtz	s1,5508 <_vfprintf_r+0x25b0>
    54c0:	00bc0c33          	add	s8,s8,a1
    54c4:	f7404ce3          	bgtz	s4,543c <_vfprintf_r+0x24e4>
    54c8:	f6804ce3          	bgtz	s0,5440 <_vfprintf_r+0x24e8>
    54cc:	01812783          	lw	a5,24(sp)
    54d0:	000c0313          	mv	t1,s8
    54d4:	02412c03          	lw	s8,36(sp)
    54d8:	03712e23          	sw	s7,60(sp)
    54dc:	00070413          	mv	s0,a4
    54e0:	00fc0733          	add	a4,s8,a5
    54e4:	05012903          	lw	s2,80(sp)
    54e8:	05412e83          	lw	t4,84(sp)
    54ec:	05812b83          	lw	s7,88(sp)
    54f0:	05c12c83          	lw	s9,92(sp)
    54f4:	00060493          	mv	s1,a2
    54f8:	00676463          	bltu	a4,t1,5500 <_vfprintf_r+0x25a8>
    54fc:	c59fe06f          	j	4154 <_vfprintf_r+0x11fc>
    5500:	00070313          	mv	t1,a4
    5504:	c51fe06f          	j	4154 <_vfprintf_r+0x11fc>
    5508:	0a412583          	lw	a1,164(sp)
    550c:	0000be97          	auipc	t4,0xb
    5510:	268e8e93          	add	t4,t4,616 # 10774 <zeroes.0>
    5514:	069d5c63          	bge	s10,s1,558c <_vfprintf_r+0x2634>
    5518:	02812023          	sw	s0,32(sp)
    551c:	00048413          	mv	s0,s1
    5520:	000b0493          	mv	s1,s6
    5524:	00c0006f          	j	5530 <_vfprintf_r+0x25d8>
    5528:	ff040413          	add	s0,s0,-16
    552c:	048d5a63          	bge	s10,s0,5580 <_vfprintf_r+0x2628>
    5530:	01060613          	add	a2,a2,16
    5534:	00158593          	add	a1,a1,1
    5538:	01672023          	sw	s6,0(a4)
    553c:	01a72223          	sw	s10,4(a4)
    5540:	0ac12423          	sw	a2,168(sp)
    5544:	0ab12223          	sw	a1,164(sp)
    5548:	00870713          	add	a4,a4,8
    554c:	fcb6dee3          	bge	a3,a1,5528 <_vfprintf_r+0x25d0>
    5550:	0a010613          	add	a2,sp,160
    5554:	00090593          	mv	a1,s2
    5558:	00098513          	mv	a0,s3
    555c:	0b9000ef          	jal	5e14 <__sprint_r>
    5560:	00050463          	beqz	a0,5568 <_vfprintf_r+0x2610>
    5564:	ec5fd06f          	j	3428 <_vfprintf_r+0x4d0>
    5568:	ff040413          	add	s0,s0,-16
    556c:	0a812603          	lw	a2,168(sp)
    5570:	0a412583          	lw	a1,164(sp)
    5574:	0ac10713          	add	a4,sp,172
    5578:	00700693          	li	a3,7
    557c:	fa8d4ae3          	blt	s10,s0,5530 <_vfprintf_r+0x25d8>
    5580:	00048e93          	mv	t4,s1
    5584:	00040493          	mv	s1,s0
    5588:	02012403          	lw	s0,32(sp)
    558c:	00960633          	add	a2,a2,s1
    5590:	00158593          	add	a1,a1,1
    5594:	01d72023          	sw	t4,0(a4)
    5598:	00972223          	sw	s1,4(a4)
    559c:	0ac12423          	sw	a2,168(sp)
    55a0:	0ab12223          	sw	a1,164(sp)
    55a4:	10b6ce63          	blt	a3,a1,56c0 <_vfprintf_r+0x2768>
    55a8:	000bc583          	lbu	a1,0(s7)
    55ac:	00870713          	add	a4,a4,8
    55b0:	00bc0c33          	add	s8,s8,a1
    55b4:	f11ff06f          	j	54c4 <_vfprintf_r+0x256c>
    55b8:	fffb8b93          	add	s7,s7,-1
    55bc:	fffa0a13          	add	s4,s4,-1
    55c0:	e85ff06f          	j	5444 <_vfprintf_r+0x24ec>
    55c4:	0a010613          	add	a2,sp,160
    55c8:	00090593          	mv	a1,s2
    55cc:	00098513          	mv	a0,s3
    55d0:	045000ef          	jal	5e14 <__sprint_r>
    55d4:	00050463          	beqz	a0,55dc <_vfprintf_r+0x2684>
    55d8:	e51fd06f          	j	3428 <_vfprintf_r+0x4d0>
    55dc:	0a812603          	lw	a2,168(sp)
    55e0:	0ac10713          	add	a4,sp,172
    55e4:	00700693          	li	a3,7
    55e8:	e85ff06f          	j	546c <_vfprintf_r+0x2514>
    55ec:	0a010613          	add	a2,sp,160
    55f0:	00090593          	mv	a1,s2
    55f4:	00098513          	mv	a0,s3
    55f8:	01d000ef          	jal	5e14 <__sprint_r>
    55fc:	00050463          	beqz	a0,5604 <_vfprintf_r+0x26ac>
    5600:	e29fd06f          	j	3428 <_vfprintf_r+0x4d0>
    5604:	000bc583          	lbu	a1,0(s7)
    5608:	0a812603          	lw	a2,168(sp)
    560c:	0ac10713          	add	a4,sp,172
    5610:	00700693          	li	a3,7
    5614:	e99ff06f          	j	54ac <_vfprintf_r+0x2554>
    5618:	04c12783          	lw	a5,76(sp)
    561c:	04812583          	lw	a1,72(sp)
    5620:	00000913          	li	s2,0
    5624:	40fc0c33          	sub	s8,s8,a5
    5628:	00078613          	mv	a2,a5
    562c:	000c0513          	mv	a0,s8
    5630:	468030ef          	jal	8a98 <strncpy>
    5634:	00144783          	lbu	a5,1(s0)
    5638:	00a00613          	li	a2,10
    563c:	00000693          	li	a3,0
    5640:	00f037b3          	snez	a5,a5
    5644:	000d0513          	mv	a0,s10
    5648:	000c8593          	mv	a1,s9
    564c:	00f40433          	add	s0,s0,a5
    5650:	78d060ef          	jal	c5dc <__udivdi3>
    5654:	a10ff06f          	j	4864 <_vfprintf_r+0x190c>
    5658:	09810713          	add	a4,sp,152
    565c:	00000693          	li	a3,0
    5660:	08410613          	add	a2,sp,132
    5664:	00000593          	li	a1,0
    5668:	00098513          	mv	a0,s3
    566c:	01c12a23          	sw	t3,20(sp)
    5670:	01d12823          	sw	t4,16(sp)
    5674:	618060ef          	jal	bc8c <_wcsrtombs_r>
    5678:	fff00713          	li	a4,-1
    567c:	01012e83          	lw	t4,16(sp)
    5680:	01412e03          	lw	t3,20(sp)
    5684:	00050d13          	mv	s10,a0
    5688:	30e50063          	beq	a0,a4,5988 <_vfprintf_r+0x2a30>
    568c:	09812223          	sw	s8,132(sp)
    5690:	cacff06f          	j	4b3c <_vfprintf_r+0x1be4>
    5694:	07714603          	lbu	a2,119(sp)
    5698:	01612a23          	sw	s6,20(sp)
    569c:	02012223          	sw	zero,36(sp)
    56a0:	02012023          	sw	zero,32(sp)
    56a4:	00012823          	sw	zero,16(sp)
    56a8:	00000c93          	li	s9,0
    56ac:	00000313          	li	t1,0
    56b0:	00000a13          	li	s4,0
    56b4:	00061463          	bnez	a2,56bc <_vfprintf_r+0x2764>
    56b8:	ae1fd06f          	j	3198 <_vfprintf_r+0x240>
    56bc:	efdfd06f          	j	35b8 <_vfprintf_r+0x660>
    56c0:	0a010613          	add	a2,sp,160
    56c4:	00090593          	mv	a1,s2
    56c8:	00098513          	mv	a0,s3
    56cc:	748000ef          	jal	5e14 <__sprint_r>
    56d0:	00050463          	beqz	a0,56d8 <_vfprintf_r+0x2780>
    56d4:	d55fd06f          	j	3428 <_vfprintf_r+0x4d0>
    56d8:	000bc583          	lbu	a1,0(s7)
    56dc:	0a812603          	lw	a2,168(sp)
    56e0:	0ac10713          	add	a4,sp,172
    56e4:	00700693          	li	a3,7
    56e8:	00bc0c33          	add	s8,s8,a1
    56ec:	dd9ff06f          	j	54c4 <_vfprintf_r+0x256c>
    56f0:	00812583          	lw	a1,8(sp)
    56f4:	0a010613          	add	a2,sp,160
    56f8:	00098513          	mv	a0,s3
    56fc:	05d12223          	sw	t4,68(sp)
    5700:	714000ef          	jal	5e14 <__sprint_r>
    5704:	00050463          	beqz	a0,570c <_vfprintf_r+0x27b4>
    5708:	d21fd06f          	j	3428 <_vfprintf_r+0x4d0>
    570c:	0a812483          	lw	s1,168(sp)
    5710:	04412e83          	lw	t4,68(sp)
    5714:	0ac10413          	add	s0,sp,172
    5718:	a19fe06f          	j	4130 <_vfprintf_r+0x11d8>
    571c:	00900793          	li	a5,9
    5720:	95a7e263          	bltu	a5,s10,4864 <_vfprintf_r+0x190c>
    5724:	98cff06f          	j	48b0 <_vfprintf_r+0x1958>
    5728:	07c12a03          	lw	s4,124(sp)
    572c:	00070793          	mv	a5,a4
    5730:	9f1ff06f          	j	5120 <_vfprintf_r+0x21c8>
    5734:	00812583          	lw	a1,8(sp)
    5738:	0a010613          	add	a2,sp,160
    573c:	00098513          	mv	a0,s3
    5740:	03d12023          	sw	t4,32(sp)
    5744:	6d0000ef          	jal	5e14 <__sprint_r>
    5748:	00050463          	beqz	a0,5750 <_vfprintf_r+0x27f8>
    574c:	cddfd06f          	j	3428 <_vfprintf_r+0x4d0>
    5750:	07c12d03          	lw	s10,124(sp)
    5754:	01812783          	lw	a5,24(sp)
    5758:	0a812483          	lw	s1,168(sp)
    575c:	02012e83          	lw	t4,32(sp)
    5760:	0ac10413          	add	s0,sp,172
    5764:	41a78d33          	sub	s10,a5,s10
    5768:	a49fe06f          	j	41b0 <_vfprintf_r+0x1258>
    576c:	00650733          	add	a4,a0,t1
    5770:	04700d13          	li	s10,71
    5774:	94dff06f          	j	50c0 <_vfprintf_r+0x2168>
    5778:	02812603          	lw	a2,40(sp)
    577c:	00048593          	mv	a1,s1
    5780:	00000693          	li	a3,0
    5784:	00060513          	mv	a0,a2
    5788:	00000613          	li	a2,0
    578c:	04e12823          	sw	a4,80(sp)
    5790:	02612223          	sw	t1,36(sp)
    5794:	03c12023          	sw	t3,32(sp)
    5798:	01d12c23          	sw	t4,24(sp)
    579c:	4b9080ef          	jal	e454 <__eqdf2>
    57a0:	01812e83          	lw	t4,24(sp)
    57a4:	02012e03          	lw	t3,32(sp)
    57a8:	02412303          	lw	t1,36(sp)
    57ac:	05012703          	lw	a4,80(sp)
    57b0:	34051e63          	bnez	a0,5b0c <_vfprintf_r+0x2bb4>
    57b4:	07c12a03          	lw	s4,124(sp)
    57b8:	01470733          	add	a4,a4,s4
    57bc:	418707b3          	sub	a5,a4,s8
    57c0:	00f12c23          	sw	a5,24(sp)
    57c4:	001ef713          	and	a4,t4,1
    57c8:	00676733          	or	a4,a4,t1
    57cc:	37405a63          	blez	s4,5b40 <_vfprintf_r+0x2be8>
    57d0:	26071263          	bnez	a4,5a34 <_vfprintf_r+0x2adc>
    57d4:	000a0d13          	mv	s10,s4
    57d8:	06600e13          	li	t3,102
    57dc:	400eff13          	and	t5,t4,1024
    57e0:	1c0f1a63          	bnez	t5,59b4 <_vfprintf_r+0x2a5c>
    57e4:	fffd4813          	not	a6,s10
    57e8:	41f85813          	sra	a6,a6,0x1f
    57ec:	010d7cb3          	and	s9,s10,a6
    57f0:	bd9ff06f          	j	53c8 <_vfprintf_r+0x2470>
    57f4:	01812783          	lw	a5,24(sp)
    57f8:	03012703          	lw	a4,48(sp)
    57fc:	06700e13          	li	t3,103
    5800:	00e78d33          	add	s10,a5,a4
    5804:	fd404ce3          	bgtz	s4,57dc <_vfprintf_r+0x2884>
    5808:	414d06b3          	sub	a3,s10,s4
    580c:	00168d13          	add	s10,a3,1
    5810:	fffd4813          	not	a6,s10
    5814:	41f85813          	sra	a6,a6,0x1f
    5818:	010d7cb3          	and	s9,s10,a6
    581c:	badff06f          	j	53c8 <_vfprintf_r+0x2470>
    5820:	000e8613          	mv	a2,t4
    5824:	ad8fe06f          	j	3afc <_vfprintf_r+0xba4>
    5828:	00812783          	lw	a5,8(sp)
    582c:	0647a783          	lw	a5,100(a5)
    5830:	0017f793          	and	a5,a5,1
    5834:	02079063          	bnez	a5,5854 <_vfprintf_r+0x28fc>
    5838:	00812783          	lw	a5,8(sp)
    583c:	00c7d783          	lhu	a5,12(a5)
    5840:	2007f793          	and	a5,a5,512
    5844:	00079863          	bnez	a5,5854 <_vfprintf_r+0x28fc>
    5848:	00812783          	lw	a5,8(sp)
    584c:	0587a503          	lw	a0,88(a5)
    5850:	fb0fc0ef          	jal	2000 <__retarget_lock_release_recursive>
    5854:	fff00793          	li	a5,-1
    5858:	00f12623          	sw	a5,12(sp)
    585c:	c2dfd06f          	j	3488 <_vfprintf_r+0x530>
    5860:	ff000613          	li	a2,-16
    5864:	40d00d33          	neg	s10,a3
    5868:	0000b297          	auipc	t0,0xb
    586c:	f0c28293          	add	t0,t0,-244 # 10774 <zeroes.0>
    5870:	08c6d463          	bge	a3,a2,58f8 <_vfprintf_r+0x29a0>
    5874:	03212023          	sw	s2,32(sp)
    5878:	01000693          	li	a3,16
    587c:	00700b13          	li	s6,7
    5880:	000e8a13          	mv	s4,t4
    5884:	00028913          	mv	s2,t0
    5888:	00c0006f          	j	5894 <_vfprintf_r+0x293c>
    588c:	ff0d0d13          	add	s10,s10,-16
    5890:	05a6de63          	bge	a3,s10,58ec <_vfprintf_r+0x2994>
    5894:	01048493          	add	s1,s1,16
    5898:	00170713          	add	a4,a4,1
    589c:	01242023          	sw	s2,0(s0)
    58a0:	00d42223          	sw	a3,4(s0)
    58a4:	0a912423          	sw	s1,168(sp)
    58a8:	0ae12223          	sw	a4,164(sp)
    58ac:	00840413          	add	s0,s0,8
    58b0:	fceb5ee3          	bge	s6,a4,588c <_vfprintf_r+0x2934>
    58b4:	00812583          	lw	a1,8(sp)
    58b8:	0a010613          	add	a2,sp,160
    58bc:	00098513          	mv	a0,s3
    58c0:	554000ef          	jal	5e14 <__sprint_r>
    58c4:	00050463          	beqz	a0,58cc <_vfprintf_r+0x2974>
    58c8:	b61fd06f          	j	3428 <_vfprintf_r+0x4d0>
    58cc:	0a812483          	lw	s1,168(sp)
    58d0:	0a412703          	lw	a4,164(sp)
    58d4:	0ac10413          	add	s0,sp,172
    58d8:	01000693          	li	a3,16
    58dc:	fb1ff06f          	j	588c <_vfprintf_r+0x2934>
    58e0:	00012823          	sw	zero,16(sp)
    58e4:	0ec10c13          	add	s8,sp,236
    58e8:	a88ff06f          	j	4b70 <_vfprintf_r+0x1c18>
    58ec:	00090293          	mv	t0,s2
    58f0:	02012903          	lw	s2,32(sp)
    58f4:	000a0e93          	mv	t4,s4
    58f8:	01a484b3          	add	s1,s1,s10
    58fc:	00170713          	add	a4,a4,1
    5900:	00542023          	sw	t0,0(s0)
    5904:	01a42223          	sw	s10,4(s0)
    5908:	0a912423          	sw	s1,168(sp)
    590c:	0ae12223          	sw	a4,164(sp)
    5910:	00700693          	li	a3,7
    5914:	00e6c463          	blt	a3,a4,591c <_vfprintf_r+0x29c4>
    5918:	b65fe06f          	j	447c <_vfprintf_r+0x1524>
    591c:	00812583          	lw	a1,8(sp)
    5920:	0a010613          	add	a2,sp,160
    5924:	00098513          	mv	a0,s3
    5928:	03d12023          	sw	t4,32(sp)
    592c:	4e8000ef          	jal	5e14 <__sprint_r>
    5930:	00050463          	beqz	a0,5938 <_vfprintf_r+0x29e0>
    5934:	af5fd06f          	j	3428 <_vfprintf_r+0x4d0>
    5938:	0a812483          	lw	s1,168(sp)
    593c:	0a412703          	lw	a4,164(sp)
    5940:	02012e83          	lw	t4,32(sp)
    5944:	0ac10413          	add	s0,sp,172
    5948:	b20ff06f          	j	4c68 <_vfprintf_r+0x1d10>
    594c:	08a10693          	add	a3,sp,138
    5950:	00061863          	bnez	a2,5960 <_vfprintf_r+0x2a08>
    5954:	03000693          	li	a3,48
    5958:	08d10523          	sb	a3,138(sp)
    595c:	08b10693          	add	a3,sp,139
    5960:	15010793          	add	a5,sp,336
    5964:	40f68633          	sub	a2,a3,a5
    5968:	030d0713          	add	a4,s10,48
    596c:	0c960793          	add	a5,a2,201
    5970:	00e68023          	sb	a4,0(a3)
    5974:	04f12023          	sw	a5,64(sp)
    5978:	d5cff06f          	j	4ed4 <_vfprintf_r+0x1f7c>
    597c:	001ef713          	and	a4,t4,1
    5980:	d6070863          	beqz	a4,4ef0 <_vfprintf_r+0x1f98>
    5984:	d64ff06f          	j	4ee8 <_vfprintf_r+0x1f90>
    5988:	00812783          	lw	a5,8(sp)
    598c:	00000293          	li	t0,0
    5990:	00c79783          	lh	a5,12(a5)
    5994:	0407e793          	or	a5,a5,64
    5998:	00812703          	lw	a4,8(sp)
    599c:	00f71623          	sh	a5,12(a4)
    59a0:	a8dfd06f          	j	342c <_vfprintf_r+0x4d4>
    59a4:	00012823          	sw	zero,16(sp)
    59a8:	00600313          	li	t1,6
    59ac:	ff9fe06f          	j	49a4 <_vfprintf_r+0x1a4c>
    59b0:	06700e13          	li	t3,103
    59b4:	03c12783          	lw	a5,60(sp)
    59b8:	0ff00613          	li	a2,255
    59bc:	0007c703          	lbu	a4,0(a5)
    59c0:	22c70263          	beq	a4,a2,5be4 <_vfprintf_r+0x2c8c>
    59c4:	00000593          	li	a1,0
    59c8:	00000693          	li	a3,0
    59cc:	01475e63          	bge	a4,s4,59e8 <_vfprintf_r+0x2a90>
    59d0:	40ea0a33          	sub	s4,s4,a4
    59d4:	0017c703          	lbu	a4,1(a5)
    59d8:	04070863          	beqz	a4,5a28 <_vfprintf_r+0x2ad0>
    59dc:	00168693          	add	a3,a3,1
    59e0:	00178793          	add	a5,a5,1
    59e4:	fec714e3          	bne	a4,a2,59cc <_vfprintf_r+0x2a74>
    59e8:	02f12e23          	sw	a5,60(sp)
    59ec:	02d12023          	sw	a3,32(sp)
    59f0:	02b12223          	sw	a1,36(sp)
    59f4:	02012783          	lw	a5,32(sp)
    59f8:	02412703          	lw	a4,36(sp)
    59fc:	04c12583          	lw	a1,76(sp)
    5a00:	05c12823          	sw	t3,80(sp)
    5a04:	00e78533          	add	a0,a5,a4
    5a08:	3a80a0ef          	jal	fdb0 <__mulsi3>
    5a0c:	01a50d33          	add	s10,a0,s10
    5a10:	fffd4813          	not	a6,s10
    5a14:	41f85813          	sra	a6,a6,0x1f
    5a18:	05012e03          	lw	t3,80(sp)
    5a1c:	010d7cb3          	and	s9,s10,a6
    5a20:	000b0e93          	mv	t4,s6
    5a24:	cecff06f          	j	4f10 <_vfprintf_r+0x1fb8>
    5a28:	0007c703          	lbu	a4,0(a5)
    5a2c:	00158593          	add	a1,a1,1
    5a30:	fb5ff06f          	j	59e4 <_vfprintf_r+0x2a8c>
    5a34:	03012783          	lw	a5,48(sp)
    5a38:	06600e13          	li	t3,102
    5a3c:	00f306b3          	add	a3,t1,a5
    5a40:	01468d33          	add	s10,a3,s4
    5a44:	d99ff06f          	j	57dc <_vfprintf_r+0x2884>
    5a48:	02c12783          	lw	a5,44(sp)
    5a4c:	0a07c863          	bltz	a5,5afc <_vfprintf_r+0x2ba4>
    5a50:	07714603          	lbu	a2,119(sp)
    5a54:	04700713          	li	a4,71
    5a58:	0000bc17          	auipc	s8,0xb
    5a5c:	830c0c13          	add	s8,s8,-2000 # 10288 <__fini_array_end+0x2e0>
    5a60:	01c75463          	bge	a4,t3,5a68 <_vfprintf_r+0x2b10>
    5a64:	b31fd06f          	j	3594 <_vfprintf_r+0x63c>
    5a68:	0000bc17          	auipc	s8,0xb
    5a6c:	81cc0c13          	add	s8,s8,-2020 # 10284 <__fini_array_end+0x2dc>
    5a70:	b25fd06f          	j	3594 <_vfprintf_r+0x63c>
    5a74:	07714603          	lbu	a2,119(sp)
    5a78:	01612a23          	sw	s6,20(sp)
    5a7c:	02012223          	sw	zero,36(sp)
    5a80:	02012023          	sw	zero,32(sp)
    5a84:	00030c93          	mv	s9,t1
    5a88:	00030d13          	mv	s10,t1
    5a8c:	07300e13          	li	t3,115
    5a90:	00000313          	li	t1,0
    5a94:	00061463          	bnez	a2,5a9c <_vfprintf_r+0x2b44>
    5a98:	f00fd06f          	j	3198 <_vfprintf_r+0x240>
    5a9c:	b1dfd06f          	j	35b8 <_vfprintf_r+0x660>
    5aa0:	00040313          	mv	t1,s0
    5aa4:	01012903          	lw	s2,16(sp)
    5aa8:	000b0413          	mv	s0,s6
    5aac:	01412e03          	lw	t3,20(sp)
    5ab0:	000c0b13          	mv	s6,s8
    5ab4:	000a0e93          	mv	t4,s4
    5ab8:	000c8c13          	mv	s8,s9
    5abc:	00030d13          	mv	s10,t1
    5ac0:	87cff06f          	j	4b3c <_vfprintf_r+0x1be4>
    5ac4:	001b0793          	add	a5,s6,1
    5ac8:	000c0993          	mv	s3,s8
    5acc:	02412903          	lw	s2,36(sp)
    5ad0:	04012e83          	lw	t4,64(sp)
    5ad4:	05012e03          	lw	t3,80(sp)
    5ad8:	05412403          	lw	s0,84(sp)
    5adc:	000d0c13          	mv	s8,s10
    5ae0:	00f487b3          	add	a5,s1,a5
    5ae4:	03000693          	li	a3,48
    5ae8:	840b40e3          	bltz	s6,5328 <_vfprintf_r+0x23d0>
    5aec:	00148493          	add	s1,s1,1
    5af0:	fed48fa3          	sb	a3,-1(s1)
    5af4:	fe979ce3          	bne	a5,s1,5aec <_vfprintf_r+0x2b94>
    5af8:	835ff06f          	j	532c <_vfprintf_r+0x23d4>
    5afc:	02d00793          	li	a5,45
    5b00:	06f10ba3          	sb	a5,119(sp)
    5b04:	02d00613          	li	a2,45
    5b08:	f4dff06f          	j	5a54 <_vfprintf_r+0x2afc>
    5b0c:	00100693          	li	a3,1
    5b10:	414686b3          	sub	a3,a3,s4
    5b14:	06d12e23          	sw	a3,124(sp)
    5b18:	da4ff06f          	j	50bc <_vfprintf_r+0x2164>
    5b1c:	01412783          	lw	a5,20(sp)
    5b20:	0007ab03          	lw	s6,0(a5)
    5b24:	00478793          	add	a5,a5,4
    5b28:	000b5463          	bgez	s6,5b30 <_vfprintf_r+0x2bd8>
    5b2c:	fff00b13          	li	s6,-1
    5b30:	00194e03          	lbu	t3,1(s2)
    5b34:	00f12a23          	sw	a5,20(sp)
    5b38:	00068913          	mv	s2,a3
    5b3c:	dccfd06f          	j	3108 <_vfprintf_r+0x1b0>
    5b40:	00071a63          	bnez	a4,5b54 <_vfprintf_r+0x2bfc>
    5b44:	00100c93          	li	s9,1
    5b48:	06600e13          	li	t3,102
    5b4c:	00100d13          	li	s10,1
    5b50:	879ff06f          	j	53c8 <_vfprintf_r+0x2470>
    5b54:	03012783          	lw	a5,48(sp)
    5b58:	06600e13          	li	t3,102
    5b5c:	00178693          	add	a3,a5,1
    5b60:	00668d33          	add	s10,a3,t1
    5b64:	fffd4813          	not	a6,s10
    5b68:	41f85813          	sra	a6,a6,0x1f
    5b6c:	010d7cb3          	and	s9,s10,a6
    5b70:	859ff06f          	j	53c8 <_vfprintf_r+0x2470>
    5b74:	00200793          	li	a5,2
    5b78:	04f12023          	sw	a5,64(sp)
    5b7c:	b58ff06f          	j	4ed4 <_vfprintf_r+0x1f7c>
    5b80:	00812703          	lw	a4,8(sp)
    5b84:	00c71783          	lh	a5,12(a4)
    5b88:	0407e793          	or	a5,a5,64
    5b8c:	00f71623          	sh	a5,12(a4)
    5b90:	8b5fd06f          	j	3444 <_vfprintf_r+0x4ec>
    5b94:	000a0513          	mv	a0,s4
    5b98:	000d0593          	mv	a1,s10
    5b9c:	00030613          	mv	a2,t1
    5ba0:	00038693          	mv	a3,t2
    5ba4:	05012023          	sw	a6,64(sp)
    5ba8:	03c12223          	sw	t3,36(sp)
    5bac:	01d12c23          	sw	t4,24(sp)
    5bb0:	0a5080ef          	jal	e454 <__eqdf2>
    5bb4:	01812e83          	lw	t4,24(sp)
    5bb8:	02412e03          	lw	t3,36(sp)
    5bbc:	04012803          	lw	a6,64(sp)
    5bc0:	f6051463          	bnez	a0,5328 <_vfprintf_r+0x23d0>
    5bc4:	001b7693          	and	a3,s6,1
    5bc8:	f6068063          	beqz	a3,5328 <_vfprintf_r+0x23d0>
    5bcc:	f14ff06f          	j	52e0 <_vfprintf_r+0x2388>
    5bd0:	00812783          	lw	a5,8(sp)
    5bd4:	01012283          	lw	t0,16(sp)
    5bd8:	00c79783          	lh	a5,12(a5)
    5bdc:	0407e793          	or	a5,a5,64
    5be0:	db9ff06f          	j	5998 <_vfprintf_r+0x2a40>
    5be4:	02012223          	sw	zero,36(sp)
    5be8:	02012023          	sw	zero,32(sp)
    5bec:	e09ff06f          	j	59f4 <_vfprintf_r+0x2a9c>
    5bf0:	04500d13          	li	s10,69
    5bf4:	cccff06f          	j	50c0 <_vfprintf_r+0x2168>

00005bf8 <__sbprintf>:
    5bf8:	b7010113          	add	sp,sp,-1168
    5bfc:	00c59783          	lh	a5,12(a1)
    5c00:	00e5d703          	lhu	a4,14(a1)
    5c04:	48812423          	sw	s0,1160(sp)
    5c08:	00058413          	mv	s0,a1
    5c0c:	000105b7          	lui	a1,0x10
    5c10:	ffd58593          	add	a1,a1,-3 # fffd <__fini_array_end+0x55>
    5c14:	06442303          	lw	t1,100(s0)
    5c18:	01c42883          	lw	a7,28(s0)
    5c1c:	02442803          	lw	a6,36(s0)
    5c20:	01071713          	sll	a4,a4,0x10
    5c24:	00b7f7b3          	and	a5,a5,a1
    5c28:	00e7e7b3          	or	a5,a5,a4
    5c2c:	40000593          	li	a1,1024
    5c30:	49212023          	sw	s2,1152(sp)
    5c34:	00f12a23          	sw	a5,20(sp)
    5c38:	00050913          	mv	s2,a0
    5c3c:	07010793          	add	a5,sp,112
    5c40:	06010513          	add	a0,sp,96
    5c44:	48112623          	sw	ra,1164(sp)
    5c48:	48912223          	sw	s1,1156(sp)
    5c4c:	47312e23          	sw	s3,1148(sp)
    5c50:	00060493          	mv	s1,a2
    5c54:	00068993          	mv	s3,a3
    5c58:	06612623          	sw	t1,108(sp)
    5c5c:	03112223          	sw	a7,36(sp)
    5c60:	03012623          	sw	a6,44(sp)
    5c64:	00f12423          	sw	a5,8(sp)
    5c68:	00f12c23          	sw	a5,24(sp)
    5c6c:	00b12823          	sw	a1,16(sp)
    5c70:	00b12e23          	sw	a1,28(sp)
    5c74:	02012023          	sw	zero,32(sp)
    5c78:	b7cfc0ef          	jal	1ff4 <__retarget_lock_init_recursive>
    5c7c:	00048613          	mv	a2,s1
    5c80:	00098693          	mv	a3,s3
    5c84:	00810593          	add	a1,sp,8
    5c88:	00090513          	mv	a0,s2
    5c8c:	accfd0ef          	jal	2f58 <_vfprintf_r>
    5c90:	00050493          	mv	s1,a0
    5c94:	04055263          	bgez	a0,5cd8 <__sbprintf+0xe0>
    5c98:	01415783          	lhu	a5,20(sp)
    5c9c:	0407f793          	and	a5,a5,64
    5ca0:	00078863          	beqz	a5,5cb0 <__sbprintf+0xb8>
    5ca4:	00c45783          	lhu	a5,12(s0)
    5ca8:	0407e793          	or	a5,a5,64
    5cac:	00f41623          	sh	a5,12(s0)
    5cb0:	06012503          	lw	a0,96(sp)
    5cb4:	b44fc0ef          	jal	1ff8 <__retarget_lock_close_recursive>
    5cb8:	48c12083          	lw	ra,1164(sp)
    5cbc:	48812403          	lw	s0,1160(sp)
    5cc0:	48012903          	lw	s2,1152(sp)
    5cc4:	47c12983          	lw	s3,1148(sp)
    5cc8:	00048513          	mv	a0,s1
    5ccc:	48412483          	lw	s1,1156(sp)
    5cd0:	49010113          	add	sp,sp,1168
    5cd4:	00008067          	ret
    5cd8:	00810593          	add	a1,sp,8
    5cdc:	00090513          	mv	a0,s2
    5ce0:	449010ef          	jal	7928 <_fflush_r>
    5ce4:	fa050ae3          	beqz	a0,5c98 <__sbprintf+0xa0>
    5ce8:	fff00493          	li	s1,-1
    5cec:	fadff06f          	j	5c98 <__sbprintf+0xa0>

00005cf0 <__sprint_r.part.0>:
    5cf0:	0645a783          	lw	a5,100(a1)
    5cf4:	fd010113          	add	sp,sp,-48
    5cf8:	01612823          	sw	s6,16(sp)
    5cfc:	02112623          	sw	ra,44(sp)
    5d00:	01279713          	sll	a4,a5,0x12
    5d04:	00060b13          	mv	s6,a2
    5d08:	0e075863          	bgez	a4,5df8 <__sprint_r.part.0+0x108>
    5d0c:	00862783          	lw	a5,8(a2)
    5d10:	03212023          	sw	s2,32(sp)
    5d14:	01312e23          	sw	s3,28(sp)
    5d18:	01512a23          	sw	s5,20(sp)
    5d1c:	01712623          	sw	s7,12(sp)
    5d20:	00058913          	mv	s2,a1
    5d24:	00062b83          	lw	s7,0(a2)
    5d28:	00050993          	mv	s3,a0
    5d2c:	fff00a93          	li	s5,-1
    5d30:	0a078863          	beqz	a5,5de0 <__sprint_r.part.0+0xf0>
    5d34:	02812423          	sw	s0,40(sp)
    5d38:	02912223          	sw	s1,36(sp)
    5d3c:	01412c23          	sw	s4,24(sp)
    5d40:	01812423          	sw	s8,8(sp)
    5d44:	004bac03          	lw	s8,4(s7)
    5d48:	000ba403          	lw	s0,0(s7)
    5d4c:	002c5a13          	srl	s4,s8,0x2
    5d50:	060a0663          	beqz	s4,5dbc <__sprint_r.part.0+0xcc>
    5d54:	00000493          	li	s1,0
    5d58:	00c0006f          	j	5d64 <__sprint_r.part.0+0x74>
    5d5c:	00440413          	add	s0,s0,4
    5d60:	049a0c63          	beq	s4,s1,5db8 <__sprint_r.part.0+0xc8>
    5d64:	00042583          	lw	a1,0(s0)
    5d68:	00090613          	mv	a2,s2
    5d6c:	00098513          	mv	a0,s3
    5d70:	399020ef          	jal	8908 <_fputwc_r>
    5d74:	00148493          	add	s1,s1,1
    5d78:	ff5512e3          	bne	a0,s5,5d5c <__sprint_r.part.0+0x6c>
    5d7c:	02812403          	lw	s0,40(sp)
    5d80:	02412483          	lw	s1,36(sp)
    5d84:	02012903          	lw	s2,32(sp)
    5d88:	01c12983          	lw	s3,28(sp)
    5d8c:	01812a03          	lw	s4,24(sp)
    5d90:	01412a83          	lw	s5,20(sp)
    5d94:	00c12b83          	lw	s7,12(sp)
    5d98:	00812c03          	lw	s8,8(sp)
    5d9c:	fff00513          	li	a0,-1
    5da0:	02c12083          	lw	ra,44(sp)
    5da4:	000b2423          	sw	zero,8(s6)
    5da8:	000b2223          	sw	zero,4(s6)
    5dac:	01012b03          	lw	s6,16(sp)
    5db0:	03010113          	add	sp,sp,48
    5db4:	00008067          	ret
    5db8:	008b2783          	lw	a5,8(s6)
    5dbc:	ffcc7c13          	and	s8,s8,-4
    5dc0:	418787b3          	sub	a5,a5,s8
    5dc4:	00fb2423          	sw	a5,8(s6)
    5dc8:	008b8b93          	add	s7,s7,8
    5dcc:	f6079ce3          	bnez	a5,5d44 <__sprint_r.part.0+0x54>
    5dd0:	02812403          	lw	s0,40(sp)
    5dd4:	02412483          	lw	s1,36(sp)
    5dd8:	01812a03          	lw	s4,24(sp)
    5ddc:	00812c03          	lw	s8,8(sp)
    5de0:	02012903          	lw	s2,32(sp)
    5de4:	01c12983          	lw	s3,28(sp)
    5de8:	01412a83          	lw	s5,20(sp)
    5dec:	00c12b83          	lw	s7,12(sp)
    5df0:	00000513          	li	a0,0
    5df4:	fadff06f          	j	5da0 <__sprint_r.part.0+0xb0>
    5df8:	6b5010ef          	jal	7cac <__sfvwrite_r>
    5dfc:	02c12083          	lw	ra,44(sp)
    5e00:	000b2423          	sw	zero,8(s6)
    5e04:	000b2223          	sw	zero,4(s6)
    5e08:	01012b03          	lw	s6,16(sp)
    5e0c:	03010113          	add	sp,sp,48
    5e10:	00008067          	ret

00005e14 <__sprint_r>:
    5e14:	00862703          	lw	a4,8(a2)
    5e18:	00070463          	beqz	a4,5e20 <__sprint_r+0xc>
    5e1c:	ed5ff06f          	j	5cf0 <__sprint_r.part.0>
    5e20:	00062223          	sw	zero,4(a2)
    5e24:	00000513          	li	a0,0
    5e28:	00008067          	ret

00005e2c <_vfiprintf_r>:
    5e2c:	eb010113          	add	sp,sp,-336
    5e30:	14812423          	sw	s0,328(sp)
    5e34:	13312e23          	sw	s3,316(sp)
    5e38:	13812423          	sw	s8,296(sp)
    5e3c:	00050413          	mv	s0,a0
    5e40:	00058993          	mv	s3,a1
    5e44:	00060c13          	mv	s8,a2
    5e48:	00000593          	li	a1,0
    5e4c:	00800613          	li	a2,8
    5e50:	05010513          	add	a0,sp,80
    5e54:	13512a23          	sw	s5,308(sp)
    5e58:	14112623          	sw	ra,332(sp)
    5e5c:	00068a93          	mv	s5,a3
    5e60:	9a4fc0ef          	jal	2004 <memset>
    5e64:	00040863          	beqz	s0,5e74 <_vfiprintf_r+0x48>
    5e68:	03442783          	lw	a5,52(s0)
    5e6c:	00079463          	bnez	a5,5e74 <_vfiprintf_r+0x48>
    5e70:	49c0106f          	j	730c <_vfiprintf_r+0x14e0>
    5e74:	0649a703          	lw	a4,100(s3)
    5e78:	00c99783          	lh	a5,12(s3)
    5e7c:	00177713          	and	a4,a4,1
    5e80:	00071863          	bnez	a4,5e90 <_vfiprintf_r+0x64>
    5e84:	2007f713          	and	a4,a5,512
    5e88:	00071463          	bnez	a4,5e90 <_vfiprintf_r+0x64>
    5e8c:	0b80106f          	j	6f44 <_vfiprintf_r+0x1118>
    5e90:	01279713          	sll	a4,a5,0x12
    5e94:	02074663          	bltz	a4,5ec0 <_vfiprintf_r+0x94>
    5e98:	0649a703          	lw	a4,100(s3)
    5e9c:	00002637          	lui	a2,0x2
    5ea0:	ffffe6b7          	lui	a3,0xffffe
    5ea4:	00c7e7b3          	or	a5,a5,a2
    5ea8:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    5eac:	01079793          	sll	a5,a5,0x10
    5eb0:	4107d793          	sra	a5,a5,0x10
    5eb4:	00d77733          	and	a4,a4,a3
    5eb8:	00f99623          	sh	a5,12(s3)
    5ebc:	06e9a223          	sw	a4,100(s3)
    5ec0:	0087f713          	and	a4,a5,8
    5ec4:	2e070463          	beqz	a4,61ac <_vfiprintf_r+0x380>
    5ec8:	0109a703          	lw	a4,16(s3)
    5ecc:	2e070063          	beqz	a4,61ac <_vfiprintf_r+0x380>
    5ed0:	01a7f713          	and	a4,a5,26
    5ed4:	00a00693          	li	a3,10
    5ed8:	2ed70c63          	beq	a4,a3,61d0 <_vfiprintf_r+0x3a4>
    5edc:	13412c23          	sw	s4,312(sp)
    5ee0:	06c10a13          	add	s4,sp,108
    5ee4:	14912223          	sw	s1,324(sp)
    5ee8:	15212023          	sw	s2,320(sp)
    5eec:	13612823          	sw	s6,304(sp)
    5ef0:	13712623          	sw	s7,300(sp)
    5ef4:	13912223          	sw	s9,292(sp)
    5ef8:	13a12023          	sw	s10,288(sp)
    5efc:	000c0c93          	mv	s9,s8
    5f00:	11b12e23          	sw	s11,284(sp)
    5f04:	07412023          	sw	s4,96(sp)
    5f08:	06012423          	sw	zero,104(sp)
    5f0c:	06012223          	sw	zero,100(sp)
    5f10:	00012a23          	sw	zero,20(sp)
    5f14:	02012623          	sw	zero,44(sp)
    5f18:	02012823          	sw	zero,48(sp)
    5f1c:	02012a23          	sw	zero,52(sp)
    5f20:	00012623          	sw	zero,12(sp)
    5f24:	7fffa497          	auipc	s1,0x7fffa
    5f28:	61048493          	add	s1,s1,1552 # 80000534 <__global_locale>
    5f2c:	02500913          	li	s2,37
    5f30:	0000bb97          	auipc	s7,0xb
    5f34:	864b8b93          	add	s7,s7,-1948 # 10794 <blanks.1+0x10>
    5f38:	0000bb17          	auipc	s6,0xb
    5f3c:	9c8b0b13          	add	s6,s6,-1592 # 10900 <zeroes.0>
    5f40:	000a0c13          	mv	s8,s4
    5f44:	000c8d93          	mv	s11,s9
    5f48:	0e44ad03          	lw	s10,228(s1)
    5f4c:	3f9020ef          	jal	8b44 <__locale_mb_cur_max>
    5f50:	00050693          	mv	a3,a0
    5f54:	05010713          	add	a4,sp,80
    5f58:	000d8613          	mv	a2,s11
    5f5c:	04810593          	add	a1,sp,72
    5f60:	00040513          	mv	a0,s0
    5f64:	000d00e7          	jalr	s10
    5f68:	2e050e63          	beqz	a0,6264 <_vfiprintf_r+0x438>
    5f6c:	2c054e63          	bltz	a0,6248 <_vfiprintf_r+0x41c>
    5f70:	04812783          	lw	a5,72(sp)
    5f74:	01278663          	beq	a5,s2,5f80 <_vfiprintf_r+0x154>
    5f78:	00ad8db3          	add	s11,s11,a0
    5f7c:	fcdff06f          	j	5f48 <_vfiprintf_r+0x11c>
    5f80:	00050d13          	mv	s10,a0
    5f84:	419d87b3          	sub	a5,s11,s9
    5f88:	2f9d9463          	bne	s11,s9,6270 <_vfiprintf_r+0x444>
    5f8c:	00000e13          	li	t3,0
    5f90:	001dc683          	lbu	a3,1(s11)
    5f94:	001d8c93          	add	s9,s11,1
    5f98:	040101a3          	sb	zero,67(sp)
    5f9c:	fff00713          	li	a4,-1
    5fa0:	00000893          	li	a7,0
    5fa4:	05a00d13          	li	s10,90
    5fa8:	000e0d93          	mv	s11,t3
    5fac:	001c8c93          	add	s9,s9,1
    5fb0:	fe068793          	add	a5,a3,-32
    5fb4:	04fd6663          	bltu	s10,a5,6000 <_vfiprintf_r+0x1d4>
    5fb8:	00279793          	sll	a5,a5,0x2
    5fbc:	017787b3          	add	a5,a5,s7
    5fc0:	0007a783          	lw	a5,0(a5)
    5fc4:	017787b3          	add	a5,a5,s7
    5fc8:	00078067          	jr	a5
    5fcc:	00000893          	li	a7,0
    5fd0:	fd068793          	add	a5,a3,-48
    5fd4:	00900593          	li	a1,9
    5fd8:	000cc683          	lbu	a3,0(s9)
    5fdc:	00289613          	sll	a2,a7,0x2
    5fe0:	011608b3          	add	a7,a2,a7
    5fe4:	00189893          	sll	a7,a7,0x1
    5fe8:	011788b3          	add	a7,a5,a7
    5fec:	fd068793          	add	a5,a3,-48
    5ff0:	001c8c93          	add	s9,s9,1
    5ff4:	fef5f2e3          	bgeu	a1,a5,5fd8 <_vfiprintf_r+0x1ac>
    5ff8:	fe068793          	add	a5,a3,-32
    5ffc:	fafd7ee3          	bgeu	s10,a5,5fb8 <_vfiprintf_r+0x18c>
    6000:	000d8e13          	mv	t3,s11
    6004:	2c068663          	beqz	a3,62d0 <_vfiprintf_r+0x4a4>
    6008:	0ad10623          	sb	a3,172(sp)
    600c:	040101a3          	sb	zero,67(sp)
    6010:	00100e93          	li	t4,1
    6014:	00100d13          	li	s10,1
    6018:	0ac10813          	add	a6,sp,172
    601c:	00012823          	sw	zero,16(sp)
    6020:	00000713          	li	a4,0
    6024:	00000f93          	li	t6,0
    6028:	06412603          	lw	a2,100(sp)
    602c:	084e7293          	and	t0,t3,132
    6030:	06812783          	lw	a5,104(sp)
    6034:	00160593          	add	a1,a2,1 # 2001 <__retarget_lock_release_recursive+0x1>
    6038:	00058f13          	mv	t5,a1
    603c:	00029663          	bnez	t0,6048 <_vfiprintf_r+0x21c>
    6040:	41d88db3          	sub	s11,a7,t4
    6044:	47b046e3          	bgtz	s11,6cb0 <_vfiprintf_r+0xe84>
    6048:	04314583          	lbu	a1,67(sp)
    604c:	02058a63          	beqz	a1,6080 <_vfiprintf_r+0x254>
    6050:	04310613          	add	a2,sp,67
    6054:	00178793          	add	a5,a5,1
    6058:	00100693          	li	a3,1
    605c:	00cc2023          	sw	a2,0(s8)
    6060:	00dc2223          	sw	a3,4(s8)
    6064:	06f12423          	sw	a5,104(sp)
    6068:	07e12223          	sw	t5,100(sp)
    606c:	00700613          	li	a2,7
    6070:	35e64ce3          	blt	a2,t5,6bc8 <_vfiprintf_r+0xd9c>
    6074:	000f0613          	mv	a2,t5
    6078:	008c0c13          	add	s8,s8,8
    607c:	001f0f13          	add	t5,t5,1
    6080:	080f8063          	beqz	t6,6100 <_vfiprintf_r+0x2d4>
    6084:	00200613          	li	a2,2
    6088:	00278793          	add	a5,a5,2
    608c:	04410693          	add	a3,sp,68
    6090:	00cc2223          	sw	a2,4(s8)
    6094:	00dc2023          	sw	a3,0(s8)
    6098:	06f12423          	sw	a5,104(sp)
    609c:	07e12223          	sw	t5,100(sp)
    60a0:	00700613          	li	a2,7
    60a4:	3be652e3          	bge	a2,t5,6c48 <_vfiprintf_r+0xe1c>
    60a8:	60078ae3          	beqz	a5,6ebc <_vfiprintf_r+0x1090>
    60ac:	06010613          	add	a2,sp,96
    60b0:	00098593          	mv	a1,s3
    60b4:	00040513          	mv	a0,s0
    60b8:	03d12c23          	sw	t4,56(sp)
    60bc:	02e12423          	sw	a4,40(sp)
    60c0:	03112223          	sw	a7,36(sp)
    60c4:	03012023          	sw	a6,32(sp)
    60c8:	00512e23          	sw	t0,28(sp)
    60cc:	01c12c23          	sw	t3,24(sp)
    60d0:	c21ff0ef          	jal	5cf0 <__sprint_r.part.0>
    60d4:	22051463          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    60d8:	06412603          	lw	a2,100(sp)
    60dc:	06812783          	lw	a5,104(sp)
    60e0:	03812e83          	lw	t4,56(sp)
    60e4:	02812703          	lw	a4,40(sp)
    60e8:	02412883          	lw	a7,36(sp)
    60ec:	02012803          	lw	a6,32(sp)
    60f0:	01c12283          	lw	t0,28(sp)
    60f4:	01812e03          	lw	t3,24(sp)
    60f8:	000a0c13          	mv	s8,s4
    60fc:	00160f13          	add	t5,a2,1
    6100:	08000593          	li	a1,128
    6104:	06b286e3          	beq	t0,a1,6970 <_vfiprintf_r+0xb44>
    6108:	41a70733          	sub	a4,a4,s10
    610c:	1ae04ae3          	bgtz	a4,6ac0 <_vfiprintf_r+0xc94>
    6110:	00fd07b3          	add	a5,s10,a5
    6114:	010c2023          	sw	a6,0(s8)
    6118:	01ac2223          	sw	s10,4(s8)
    611c:	06f12423          	sw	a5,104(sp)
    6120:	07e12223          	sw	t5,100(sp)
    6124:	00700713          	li	a4,7
    6128:	03e758e3          	bge	a4,t5,6958 <_vfiprintf_r+0xb2c>
    612c:	24078063          	beqz	a5,636c <_vfiprintf_r+0x540>
    6130:	06010613          	add	a2,sp,96
    6134:	00098593          	mv	a1,s3
    6138:	00040513          	mv	a0,s0
    613c:	03d12023          	sw	t4,32(sp)
    6140:	01112e23          	sw	a7,28(sp)
    6144:	01c12c23          	sw	t3,24(sp)
    6148:	ba9ff0ef          	jal	5cf0 <__sprint_r.part.0>
    614c:	1a051863          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    6150:	06812783          	lw	a5,104(sp)
    6154:	02012e83          	lw	t4,32(sp)
    6158:	01c12883          	lw	a7,28(sp)
    615c:	01812e03          	lw	t3,24(sp)
    6160:	000a0c13          	mv	s8,s4
    6164:	004e7e13          	and	t3,t3,4
    6168:	000e0663          	beqz	t3,6174 <_vfiprintf_r+0x348>
    616c:	41d88db3          	sub	s11,a7,t4
    6170:	21b04a63          	bgtz	s11,6384 <_vfiprintf_r+0x558>
    6174:	01d8d463          	bge	a7,t4,617c <_vfiprintf_r+0x350>
    6178:	000e8893          	mv	a7,t4
    617c:	00c12703          	lw	a4,12(sp)
    6180:	01170733          	add	a4,a4,a7
    6184:	00e12623          	sw	a4,12(sp)
    6188:	16079063          	bnez	a5,62e8 <_vfiprintf_r+0x4bc>
    618c:	01012783          	lw	a5,16(sp)
    6190:	06012223          	sw	zero,100(sp)
    6194:	00078863          	beqz	a5,61a4 <_vfiprintf_r+0x378>
    6198:	00078593          	mv	a1,a5
    619c:	00040513          	mv	a0,s0
    61a0:	ab4fc0ef          	jal	2454 <_free_r>
    61a4:	000a0c13          	mv	s8,s4
    61a8:	d9dff06f          	j	5f44 <_vfiprintf_r+0x118>
    61ac:	00098593          	mv	a1,s3
    61b0:	00040513          	mv	a0,s0
    61b4:	4b0020ef          	jal	8664 <__swsetup_r>
    61b8:	00050463          	beqz	a0,61c0 <_vfiprintf_r+0x394>
    61bc:	3840106f          	j	7540 <_vfiprintf_r+0x1714>
    61c0:	00c99783          	lh	a5,12(s3)
    61c4:	00a00693          	li	a3,10
    61c8:	01a7f713          	and	a4,a5,26
    61cc:	d0d718e3          	bne	a4,a3,5edc <_vfiprintf_r+0xb0>
    61d0:	00e99703          	lh	a4,14(s3)
    61d4:	d00744e3          	bltz	a4,5edc <_vfiprintf_r+0xb0>
    61d8:	0649a703          	lw	a4,100(s3)
    61dc:	00177713          	and	a4,a4,1
    61e0:	00071863          	bnez	a4,61f0 <_vfiprintf_r+0x3c4>
    61e4:	2007f793          	and	a5,a5,512
    61e8:	00079463          	bnez	a5,61f0 <_vfiprintf_r+0x3c4>
    61ec:	2ac0106f          	j	7498 <_vfiprintf_r+0x166c>
    61f0:	000a8693          	mv	a3,s5
    61f4:	000c0613          	mv	a2,s8
    61f8:	00098593          	mv	a1,s3
    61fc:	00040513          	mv	a0,s0
    6200:	3e4010ef          	jal	75e4 <__sbprintf>
    6204:	14c12083          	lw	ra,332(sp)
    6208:	14812403          	lw	s0,328(sp)
    620c:	00a12623          	sw	a0,12(sp)
    6210:	00c12503          	lw	a0,12(sp)
    6214:	13c12983          	lw	s3,316(sp)
    6218:	13412a83          	lw	s5,308(sp)
    621c:	12812c03          	lw	s8,296(sp)
    6220:	15010113          	add	sp,sp,336
    6224:	00008067          	ret
    6228:	000aa883          	lw	a7,0(s5)
    622c:	004a8a93          	add	s5,s5,4
    6230:	3608cc63          	bltz	a7,65a8 <_vfiprintf_r+0x77c>
    6234:	000cc683          	lbu	a3,0(s9)
    6238:	d75ff06f          	j	5fac <_vfiprintf_r+0x180>
    623c:	000cc683          	lbu	a3,0(s9)
    6240:	020ded93          	or	s11,s11,32
    6244:	d69ff06f          	j	5fac <_vfiprintf_r+0x180>
    6248:	00800613          	li	a2,8
    624c:	00000593          	li	a1,0
    6250:	05010513          	add	a0,sp,80
    6254:	db1fb0ef          	jal	2004 <memset>
    6258:	00100513          	li	a0,1
    625c:	00ad8db3          	add	s11,s11,a0
    6260:	ce9ff06f          	j	5f48 <_vfiprintf_r+0x11c>
    6264:	00050d13          	mv	s10,a0
    6268:	419d87b3          	sub	a5,s11,s9
    626c:	079d8263          	beq	s11,s9,62d0 <_vfiprintf_r+0x4a4>
    6270:	06812683          	lw	a3,104(sp)
    6274:	06412703          	lw	a4,100(sp)
    6278:	019c2023          	sw	s9,0(s8)
    627c:	00d786b3          	add	a3,a5,a3
    6280:	00170713          	add	a4,a4,1
    6284:	00fc2223          	sw	a5,4(s8)
    6288:	06d12423          	sw	a3,104(sp)
    628c:	06e12223          	sw	a4,100(sp)
    6290:	00700613          	li	a2,7
    6294:	008c0c13          	add	s8,s8,8
    6298:	02e65463          	bge	a2,a4,62c0 <_vfiprintf_r+0x494>
    629c:	38068ce3          	beqz	a3,6e34 <_vfiprintf_r+0x1008>
    62a0:	06010613          	add	a2,sp,96
    62a4:	00098593          	mv	a1,s3
    62a8:	00040513          	mv	a0,s0
    62ac:	00f12823          	sw	a5,16(sp)
    62b0:	a41ff0ef          	jal	5cf0 <__sprint_r.part.0>
    62b4:	01012783          	lw	a5,16(sp)
    62b8:	04051c63          	bnez	a0,6310 <_vfiprintf_r+0x4e4>
    62bc:	000a0c13          	mv	s8,s4
    62c0:	00c12703          	lw	a4,12(sp)
    62c4:	00f707b3          	add	a5,a4,a5
    62c8:	00f12623          	sw	a5,12(sp)
    62cc:	cc0d10e3          	bnez	s10,5f8c <_vfiprintf_r+0x160>
    62d0:	06812783          	lw	a5,104(sp)
    62d4:	00078463          	beqz	a5,62dc <_vfiprintf_r+0x4b0>
    62d8:	22c0106f          	j	7504 <_vfiprintf_r+0x16d8>
    62dc:	00c99783          	lh	a5,12(s3)
    62e0:	06012223          	sw	zero,100(sp)
    62e4:	0300006f          	j	6314 <_vfiprintf_r+0x4e8>
    62e8:	06010613          	add	a2,sp,96
    62ec:	00098593          	mv	a1,s3
    62f0:	00040513          	mv	a0,s0
    62f4:	9fdff0ef          	jal	5cf0 <__sprint_r.part.0>
    62f8:	e8050ae3          	beqz	a0,618c <_vfiprintf_r+0x360>
    62fc:	01012783          	lw	a5,16(sp)
    6300:	00078863          	beqz	a5,6310 <_vfiprintf_r+0x4e4>
    6304:	01012583          	lw	a1,16(sp)
    6308:	00040513          	mv	a0,s0
    630c:	948fc0ef          	jal	2454 <_free_r>
    6310:	00c99783          	lh	a5,12(s3)
    6314:	0649a703          	lw	a4,100(s3)
    6318:	00177713          	and	a4,a4,1
    631c:	16070a63          	beqz	a4,6490 <_vfiprintf_r+0x664>
    6320:	0407f793          	and	a5,a5,64
    6324:	14412483          	lw	s1,324(sp)
    6328:	14012903          	lw	s2,320(sp)
    632c:	13812a03          	lw	s4,312(sp)
    6330:	13012b03          	lw	s6,304(sp)
    6334:	12c12b83          	lw	s7,300(sp)
    6338:	12412c83          	lw	s9,292(sp)
    633c:	12012d03          	lw	s10,288(sp)
    6340:	11c12d83          	lw	s11,284(sp)
    6344:	00078463          	beqz	a5,634c <_vfiprintf_r+0x520>
    6348:	2180106f          	j	7560 <_vfiprintf_r+0x1734>
    634c:	14c12083          	lw	ra,332(sp)
    6350:	14812403          	lw	s0,328(sp)
    6354:	00c12503          	lw	a0,12(sp)
    6358:	13c12983          	lw	s3,316(sp)
    635c:	13412a83          	lw	s5,308(sp)
    6360:	12812c03          	lw	s8,296(sp)
    6364:	15010113          	add	sp,sp,336
    6368:	00008067          	ret
    636c:	06012223          	sw	zero,100(sp)
    6370:	004e7e13          	and	t3,t3,4
    6374:	240e0ee3          	beqz	t3,6dd0 <_vfiprintf_r+0xfa4>
    6378:	41d88db3          	sub	s11,a7,t4
    637c:	25b05ae3          	blez	s11,6dd0 <_vfiprintf_r+0xfa4>
    6380:	000a0c13          	mv	s8,s4
    6384:	01000713          	li	a4,16
    6388:	06412683          	lw	a3,100(sp)
    638c:	01b74463          	blt	a4,s11,6394 <_vfiprintf_r+0x568>
    6390:	1900106f          	j	7520 <_vfiprintf_r+0x16f4>
    6394:	000a8713          	mv	a4,s5
    6398:	0000a317          	auipc	t1,0xa
    639c:	57830313          	add	t1,t1,1400 # 10910 <blanks.1>
    63a0:	000c0593          	mv	a1,s8
    63a4:	000d8a93          	mv	s5,s11
    63a8:	01000813          	li	a6,16
    63ac:	00700d13          	li	s10,7
    63b0:	01112c23          	sw	a7,24(sp)
    63b4:	01d12e23          	sw	t4,28(sp)
    63b8:	00030c13          	mv	s8,t1
    63bc:	00070d93          	mv	s11,a4
    63c0:	0180006f          	j	63d8 <_vfiprintf_r+0x5ac>
    63c4:	00268613          	add	a2,a3,2
    63c8:	00858593          	add	a1,a1,8
    63cc:	00070693          	mv	a3,a4
    63d0:	ff0a8a93          	add	s5,s5,-16
    63d4:	05585a63          	bge	a6,s5,6428 <_vfiprintf_r+0x5fc>
    63d8:	01078793          	add	a5,a5,16
    63dc:	00168713          	add	a4,a3,1
    63e0:	0185a023          	sw	s8,0(a1)
    63e4:	0105a223          	sw	a6,4(a1)
    63e8:	06f12423          	sw	a5,104(sp)
    63ec:	06e12223          	sw	a4,100(sp)
    63f0:	fced5ae3          	bge	s10,a4,63c4 <_vfiprintf_r+0x598>
    63f4:	56078663          	beqz	a5,6960 <_vfiprintf_r+0xb34>
    63f8:	06010613          	add	a2,sp,96
    63fc:	00098593          	mv	a1,s3
    6400:	00040513          	mv	a0,s0
    6404:	8edff0ef          	jal	5cf0 <__sprint_r.part.0>
    6408:	ee051ae3          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    640c:	06412683          	lw	a3,100(sp)
    6410:	01000813          	li	a6,16
    6414:	ff0a8a93          	add	s5,s5,-16
    6418:	06812783          	lw	a5,104(sp)
    641c:	000a0593          	mv	a1,s4
    6420:	00168613          	add	a2,a3,1
    6424:	fb584ae3          	blt	a6,s5,63d8 <_vfiprintf_r+0x5ac>
    6428:	01812883          	lw	a7,24(sp)
    642c:	01c12e83          	lw	t4,28(sp)
    6430:	000d8713          	mv	a4,s11
    6434:	000c0313          	mv	t1,s8
    6438:	000a8d93          	mv	s11,s5
    643c:	00058c13          	mv	s8,a1
    6440:	00070a93          	mv	s5,a4
    6444:	01b787b3          	add	a5,a5,s11
    6448:	006c2023          	sw	t1,0(s8)
    644c:	01bc2223          	sw	s11,4(s8)
    6450:	06f12423          	sw	a5,104(sp)
    6454:	06c12223          	sw	a2,100(sp)
    6458:	00700713          	li	a4,7
    645c:	d0c75ce3          	bge	a4,a2,6174 <_vfiprintf_r+0x348>
    6460:	160788e3          	beqz	a5,6dd0 <_vfiprintf_r+0xfa4>
    6464:	06010613          	add	a2,sp,96
    6468:	00098593          	mv	a1,s3
    646c:	00040513          	mv	a0,s0
    6470:	01d12e23          	sw	t4,28(sp)
    6474:	01112c23          	sw	a7,24(sp)
    6478:	879ff0ef          	jal	5cf0 <__sprint_r.part.0>
    647c:	e80510e3          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    6480:	06812783          	lw	a5,104(sp)
    6484:	01c12e83          	lw	t4,28(sp)
    6488:	01812883          	lw	a7,24(sp)
    648c:	ce9ff06f          	j	6174 <_vfiprintf_r+0x348>
    6490:	2007f713          	and	a4,a5,512
    6494:	e80716e3          	bnez	a4,6320 <_vfiprintf_r+0x4f4>
    6498:	0589a503          	lw	a0,88(s3)
    649c:	b65fb0ef          	jal	2000 <__retarget_lock_release_recursive>
    64a0:	00c99783          	lh	a5,12(s3)
    64a4:	e7dff06f          	j	6320 <_vfiprintf_r+0x4f4>
    64a8:	000aa803          	lw	a6,0(s5)
    64ac:	040101a3          	sb	zero,67(sp)
    64b0:	000d8e13          	mv	t3,s11
    64b4:	004a8a93          	add	s5,s5,4
    64b8:	68080ae3          	beqz	a6,734c <_vfiprintf_r+0x1520>
    64bc:	05300793          	li	a5,83
    64c0:	3cf68ce3          	beq	a3,a5,7098 <_vfiprintf_r+0x126c>
    64c4:	010df793          	and	a5,s11,16
    64c8:	3c0798e3          	bnez	a5,7098 <_vfiprintf_r+0x126c>
    64cc:	00075463          	bgez	a4,64d4 <_vfiprintf_r+0x6a8>
    64d0:	7fd0006f          	j	74cc <_vfiprintf_r+0x16a0>
    64d4:	00070613          	mv	a2,a4
    64d8:	00080513          	mv	a0,a6
    64dc:	00000593          	li	a1,0
    64e0:	03112223          	sw	a7,36(sp)
    64e4:	00e12e23          	sw	a4,28(sp)
    64e8:	01012c23          	sw	a6,24(sp)
    64ec:	03b12023          	sw	s11,32(sp)
    64f0:	4e4020ef          	jal	89d4 <memchr>
    64f4:	00a12823          	sw	a0,16(sp)
    64f8:	01812803          	lw	a6,24(sp)
    64fc:	01c12703          	lw	a4,28(sp)
    6500:	02012e03          	lw	t3,32(sp)
    6504:	02412883          	lw	a7,36(sp)
    6508:	00051463          	bnez	a0,6510 <_vfiprintf_r+0x6e4>
    650c:	7990006f          	j	74a4 <_vfiprintf_r+0x1678>
    6510:	41050d33          	sub	s10,a0,a6
    6514:	fffd4e93          	not	t4,s10
    6518:	41fede93          	sra	t4,t4,0x1f
    651c:	01dd7eb3          	and	t4,s10,t4
    6520:	00012823          	sw	zero,16(sp)
    6524:	6dd0006f          	j	7400 <_vfiprintf_r+0x15d4>
    6528:	04300793          	li	a5,67
    652c:	000d8e13          	mv	t3,s11
    6530:	004a8d93          	add	s11,s5,4
    6534:	00f68663          	beq	a3,a5,6540 <_vfiprintf_r+0x714>
    6538:	010e7793          	and	a5,t3,16
    653c:	280788e3          	beqz	a5,6fcc <_vfiprintf_r+0x11a0>
    6540:	00800613          	li	a2,8
    6544:	00000593          	li	a1,0
    6548:	05810513          	add	a0,sp,88
    654c:	01112e23          	sw	a7,28(sp)
    6550:	01c12c23          	sw	t3,24(sp)
    6554:	ab1fb0ef          	jal	2004 <memset>
    6558:	000aa603          	lw	a2,0(s5)
    655c:	0ac10593          	add	a1,sp,172
    6560:	05810693          	add	a3,sp,88
    6564:	00040513          	mv	a0,s0
    6568:	00b12823          	sw	a1,16(sp)
    656c:	694050ef          	jal	bc00 <_wcrtomb_r>
    6570:	fff00793          	li	a5,-1
    6574:	01012583          	lw	a1,16(sp)
    6578:	01812e03          	lw	t3,24(sp)
    657c:	01c12883          	lw	a7,28(sp)
    6580:	00050d13          	mv	s10,a0
    6584:	00f51463          	bne	a0,a5,658c <_vfiprintf_r+0x760>
    6588:	0200106f          	j	75a8 <_vfiprintf_r+0x177c>
    658c:	fff54e93          	not	t4,a0
    6590:	41fede93          	sra	t4,t4,0x1f
    6594:	01d57eb3          	and	t4,a0,t4
    6598:	040101a3          	sb	zero,67(sp)
    659c:	000d8a93          	mv	s5,s11
    65a0:	00058813          	mv	a6,a1
    65a4:	a79ff06f          	j	601c <_vfiprintf_r+0x1f0>
    65a8:	411008b3          	neg	a7,a7
    65ac:	000cc683          	lbu	a3,0(s9)
    65b0:	004ded93          	or	s11,s11,4
    65b4:	9f9ff06f          	j	5fac <_vfiprintf_r+0x180>
    65b8:	010dee13          	or	t3,s11,16
    65bc:	020e7793          	and	a5,t3,32
    65c0:	0c0788e3          	beqz	a5,6e90 <_vfiprintf_r+0x1064>
    65c4:	007a8a93          	add	s5,s5,7
    65c8:	ff8afa93          	and	s5,s5,-8
    65cc:	004aa683          	lw	a3,4(s5)
    65d0:	000aad83          	lw	s11,0(s5)
    65d4:	008a8a93          	add	s5,s5,8
    65d8:	00068d13          	mv	s10,a3
    65dc:	3006c263          	bltz	a3,68e0 <_vfiprintf_r+0xab4>
    65e0:	32074063          	bltz	a4,6900 <_vfiprintf_r+0xad4>
    65e4:	01ade6b3          	or	a3,s11,s10
    65e8:	f7fe7e13          	and	t3,t3,-129
    65ec:	30069a63          	bnez	a3,6900 <_vfiprintf_r+0xad4>
    65f0:	68071ae3          	bnez	a4,7484 <_vfiprintf_r+0x1658>
    65f4:	04314783          	lbu	a5,67(sp)
    65f8:	00012823          	sw	zero,16(sp)
    65fc:	00000e93          	li	t4,0
    6600:	00000d13          	li	s10,0
    6604:	11010813          	add	a6,sp,272
    6608:	00078463          	beqz	a5,6610 <_vfiprintf_r+0x7e4>
    660c:	001e8e93          	add	t4,t4,1
    6610:	002e7f93          	and	t6,t3,2
    6614:	a00f8ae3          	beqz	t6,6028 <_vfiprintf_r+0x1fc>
    6618:	002e8e93          	add	t4,t4,2
    661c:	00200f93          	li	t6,2
    6620:	a09ff06f          	j	6028 <_vfiprintf_r+0x1fc>
    6624:	000cc683          	lbu	a3,0(s9)
    6628:	06800793          	li	a5,104
    662c:	4ef686e3          	beq	a3,a5,7318 <_vfiprintf_r+0x14ec>
    6630:	040ded93          	or	s11,s11,64
    6634:	979ff06f          	j	5fac <_vfiprintf_r+0x180>
    6638:	010de613          	or	a2,s11,16
    663c:	02067793          	and	a5,a2,32
    6640:	000780e3          	beqz	a5,6e40 <_vfiprintf_r+0x1014>
    6644:	007a8a93          	add	s5,s5,7
    6648:	ff8afa93          	and	s5,s5,-8
    664c:	000aad83          	lw	s11,0(s5)
    6650:	004aad03          	lw	s10,4(s5)
    6654:	008a8a93          	add	s5,s5,8
    6658:	040101a3          	sb	zero,67(sp)
    665c:	00060e13          	mv	t3,a2
    6660:	2a074063          	bltz	a4,6900 <_vfiprintf_r+0xad4>
    6664:	01ade6b3          	or	a3,s11,s10
    6668:	f7f67e13          	and	t3,a2,-129
    666c:	28069a63          	bnez	a3,6900 <_vfiprintf_r+0xad4>
    6670:	00100793          	li	a5,1
    6674:	06071e63          	bnez	a4,66f0 <_vfiprintf_r+0x8c4>
    6678:	f6079ee3          	bnez	a5,65f4 <_vfiprintf_r+0x7c8>
    667c:	00167d13          	and	s10,a2,1
    6680:	0a0d0ce3          	beqz	s10,6f38 <_vfiprintf_r+0x110c>
    6684:	03000793          	li	a5,48
    6688:	10f107a3          	sb	a5,271(sp)
    668c:	000d0e93          	mv	t4,s10
    6690:	10f10813          	add	a6,sp,271
    6694:	2980006f          	j	692c <_vfiprintf_r+0xb00>
    6698:	02b00793          	li	a5,43
    669c:	000cc683          	lbu	a3,0(s9)
    66a0:	04f101a3          	sb	a5,67(sp)
    66a4:	909ff06f          	j	5fac <_vfiprintf_r+0x180>
    66a8:	010de693          	or	a3,s11,16
    66ac:	0206f793          	and	a5,a3,32
    66b0:	7a078c63          	beqz	a5,6e68 <_vfiprintf_r+0x103c>
    66b4:	007a8a93          	add	s5,s5,7
    66b8:	ff8afa93          	and	s5,s5,-8
    66bc:	000aa783          	lw	a5,0(s5)
    66c0:	004aa583          	lw	a1,4(s5)
    66c4:	008a8a93          	add	s5,s5,8
    66c8:	040101a3          	sb	zero,67(sp)
    66cc:	bff6fe13          	and	t3,a3,-1025
    66d0:	02074c63          	bltz	a4,6708 <_vfiprintf_r+0x8dc>
    66d4:	00b7e633          	or	a2,a5,a1
    66d8:	b7f6f693          	and	a3,a3,-1153
    66dc:	420610e3          	bnez	a2,72fc <_vfiprintf_r+0x14d0>
    66e0:	000e0613          	mv	a2,t3
    66e4:	00000793          	li	a5,0
    66e8:	00068e13          	mv	t3,a3
    66ec:	f80706e3          	beqz	a4,6678 <_vfiprintf_r+0x84c>
    66f0:	00100693          	li	a3,1
    66f4:	58d788e3          	beq	a5,a3,7484 <_vfiprintf_r+0x1658>
    66f8:	00200693          	li	a3,2
    66fc:	46d786e3          	beq	a5,a3,7368 <_vfiprintf_r+0x153c>
    6700:	00000793          	li	a5,0
    6704:	00000593          	li	a1,0
    6708:	11010813          	add	a6,sp,272
    670c:	01d59613          	sll	a2,a1,0x1d
    6710:	0077f693          	and	a3,a5,7
    6714:	0037d793          	srl	a5,a5,0x3
    6718:	03068693          	add	a3,a3,48
    671c:	00f667b3          	or	a5,a2,a5
    6720:	0035d593          	srl	a1,a1,0x3
    6724:	fed80fa3          	sb	a3,-1(a6)
    6728:	00b7e633          	or	a2,a5,a1
    672c:	00080513          	mv	a0,a6
    6730:	fff80813          	add	a6,a6,-1
    6734:	fc061ce3          	bnez	a2,670c <_vfiprintf_r+0x8e0>
    6738:	001e7793          	and	a5,t3,1
    673c:	54078e63          	beqz	a5,6c98 <_vfiprintf_r+0xe6c>
    6740:	03000793          	li	a5,48
    6744:	54f68a63          	beq	a3,a5,6c98 <_vfiprintf_r+0xe6c>
    6748:	ffe50513          	add	a0,a0,-2
    674c:	fef80fa3          	sb	a5,-1(a6)
    6750:	11010793          	add	a5,sp,272
    6754:	40a78d33          	sub	s10,a5,a0
    6758:	00070e93          	mv	t4,a4
    675c:	09a744e3          	blt	a4,s10,6fe4 <_vfiprintf_r+0x11b8>
    6760:	00050813          	mv	a6,a0
    6764:	1c80006f          	j	692c <_vfiprintf_r+0xb00>
    6768:	000086b7          	lui	a3,0x8
    676c:	83068693          	add	a3,a3,-2000 # 7830 <__sflush_r+0x154>
    6770:	04d11223          	sh	a3,68(sp)
    6774:	0000a697          	auipc	a3,0xa
    6778:	b1868693          	add	a3,a3,-1256 # 1028c <__fini_array_end+0x2e4>
    677c:	000aa783          	lw	a5,0(s5)
    6780:	00000593          	li	a1,0
    6784:	002dee13          	or	t3,s11,2
    6788:	004a8a93          	add	s5,s5,4
    678c:	00d12a23          	sw	a3,20(sp)
    6790:	040101a3          	sb	zero,67(sp)
    6794:	4c074863          	bltz	a4,6c64 <_vfiprintf_r+0xe38>
    6798:	00b7e6b3          	or	a3,a5,a1
    679c:	f7fe7513          	and	a0,t3,-129
    67a0:	4a069c63          	bnez	a3,6c58 <_vfiprintf_r+0xe2c>
    67a4:	000e0613          	mv	a2,t3
    67a8:	00200793          	li	a5,2
    67ac:	00050e13          	mv	t3,a0
    67b0:	ec5ff06f          	j	6674 <_vfiprintf_r+0x848>
    67b4:	00040513          	mv	a0,s0
    67b8:	00e12c23          	sw	a4,24(sp)
    67bc:	01112823          	sw	a7,16(sp)
    67c0:	390020ef          	jal	8b50 <_localeconv_r>
    67c4:	00452783          	lw	a5,4(a0)
    67c8:	00078513          	mv	a0,a5
    67cc:	02f12a23          	sw	a5,52(sp)
    67d0:	ab5fb0ef          	jal	2284 <strlen>
    67d4:	00050793          	mv	a5,a0
    67d8:	00040513          	mv	a0,s0
    67dc:	02f12823          	sw	a5,48(sp)
    67e0:	370020ef          	jal	8b50 <_localeconv_r>
    67e4:	00852703          	lw	a4,8(a0)
    67e8:	03012783          	lw	a5,48(sp)
    67ec:	01012883          	lw	a7,16(sp)
    67f0:	02e12623          	sw	a4,44(sp)
    67f4:	01812703          	lw	a4,24(sp)
    67f8:	a2078ee3          	beqz	a5,6234 <_vfiprintf_r+0x408>
    67fc:	02c12783          	lw	a5,44(sp)
    6800:	000cc683          	lbu	a3,0(s9)
    6804:	fa078463          	beqz	a5,5fac <_vfiprintf_r+0x180>
    6808:	0007c783          	lbu	a5,0(a5)
    680c:	fa078063          	beqz	a5,5fac <_vfiprintf_r+0x180>
    6810:	400ded93          	or	s11,s11,1024
    6814:	f98ff06f          	j	5fac <_vfiprintf_r+0x180>
    6818:	020df793          	and	a5,s11,32
    681c:	78079263          	bnez	a5,6fa0 <_vfiprintf_r+0x1174>
    6820:	010df793          	and	a5,s11,16
    6824:	30079ae3          	bnez	a5,7338 <_vfiprintf_r+0x150c>
    6828:	040df793          	and	a5,s11,64
    682c:	400796e3          	bnez	a5,7438 <_vfiprintf_r+0x160c>
    6830:	200dfe13          	and	t3,s11,512
    6834:	300e02e3          	beqz	t3,7338 <_vfiprintf_r+0x150c>
    6838:	000aa783          	lw	a5,0(s5)
    683c:	00c12703          	lw	a4,12(sp)
    6840:	004a8a93          	add	s5,s5,4
    6844:	00e78023          	sb	a4,0(a5)
    6848:	efcff06f          	j	5f44 <_vfiprintf_r+0x118>
    684c:	000cc683          	lbu	a3,0(s9)
    6850:	06c00793          	li	a5,108
    6854:	2cf68ae3          	beq	a3,a5,7328 <_vfiprintf_r+0x14fc>
    6858:	010ded93          	or	s11,s11,16
    685c:	f50ff06f          	j	5fac <_vfiprintf_r+0x180>
    6860:	000cc683          	lbu	a3,0(s9)
    6864:	080ded93          	or	s11,s11,128
    6868:	f44ff06f          	j	5fac <_vfiprintf_r+0x180>
    686c:	000cc683          	lbu	a3,0(s9)
    6870:	02a00793          	li	a5,42
    6874:	001c8593          	add	a1,s9,1
    6878:	54f680e3          	beq	a3,a5,75b8 <_vfiprintf_r+0x178c>
    687c:	fd068793          	add	a5,a3,-48
    6880:	00900613          	li	a2,9
    6884:	00000713          	li	a4,0
    6888:	00900513          	li	a0,9
    688c:	02f66463          	bltu	a2,a5,68b4 <_vfiprintf_r+0xa88>
    6890:	0005c683          	lbu	a3,0(a1)
    6894:	00271613          	sll	a2,a4,0x2
    6898:	00e60733          	add	a4,a2,a4
    689c:	00171713          	sll	a4,a4,0x1
    68a0:	00f70733          	add	a4,a4,a5
    68a4:	fd068793          	add	a5,a3,-48
    68a8:	00158593          	add	a1,a1,1
    68ac:	fef572e3          	bgeu	a0,a5,6890 <_vfiprintf_r+0xa64>
    68b0:	74074063          	bltz	a4,6ff0 <_vfiprintf_r+0x11c4>
    68b4:	00058c93          	mv	s9,a1
    68b8:	ef8ff06f          	j	5fb0 <_vfiprintf_r+0x184>
    68bc:	000cc683          	lbu	a3,0(s9)
    68c0:	001ded93          	or	s11,s11,1
    68c4:	ee8ff06f          	j	5fac <_vfiprintf_r+0x180>
    68c8:	04314783          	lbu	a5,67(sp)
    68cc:	000cc683          	lbu	a3,0(s9)
    68d0:	ec079e63          	bnez	a5,5fac <_vfiprintf_r+0x180>
    68d4:	02000793          	li	a5,32
    68d8:	04f101a3          	sb	a5,67(sp)
    68dc:	ed0ff06f          	j	5fac <_vfiprintf_r+0x180>
    68e0:	02d00613          	li	a2,45
    68e4:	01b036b3          	snez	a3,s11
    68e8:	41a000b3          	neg	ra,s10
    68ec:	04c101a3          	sb	a2,67(sp)
    68f0:	40d08d33          	sub	s10,ra,a3
    68f4:	41b00db3          	neg	s11,s11
    68f8:	00074463          	bltz	a4,6900 <_vfiprintf_r+0xad4>
    68fc:	f7fe7e13          	and	t3,t3,-129
    6900:	120d14e3          	bnez	s10,7228 <_vfiprintf_r+0x13fc>
    6904:	00900693          	li	a3,9
    6908:	13b6e0e3          	bltu	a3,s11,7228 <_vfiprintf_r+0x13fc>
    690c:	030d8793          	add	a5,s11,48
    6910:	0ff7f793          	zext.b	a5,a5
    6914:	10f107a3          	sb	a5,271(sp)
    6918:	00070e93          	mv	t4,a4
    691c:	00e04463          	bgtz	a4,6924 <_vfiprintf_r+0xaf8>
    6920:	00100e93          	li	t4,1
    6924:	00100d13          	li	s10,1
    6928:	10f10813          	add	a6,sp,271
    692c:	04314783          	lbu	a5,67(sp)
    6930:	00012823          	sw	zero,16(sp)
    6934:	cc079ce3          	bnez	a5,660c <_vfiprintf_r+0x7e0>
    6938:	cd9ff06f          	j	6610 <_vfiprintf_r+0x7e4>
    693c:	00100713          	li	a4,1
    6940:	000d0793          	mv	a5,s10
    6944:	07012623          	sw	a6,108(sp)
    6948:	07a12823          	sw	s10,112(sp)
    694c:	07a12423          	sw	s10,104(sp)
    6950:	06e12223          	sw	a4,100(sp)
    6954:	000a0c13          	mv	s8,s4
    6958:	008c0c13          	add	s8,s8,8
    695c:	809ff06f          	j	6164 <_vfiprintf_r+0x338>
    6960:	00100613          	li	a2,1
    6964:	00000693          	li	a3,0
    6968:	000a0593          	mv	a1,s4
    696c:	a65ff06f          	j	63d0 <_vfiprintf_r+0x5a4>
    6970:	41d88db3          	sub	s11,a7,t4
    6974:	f9b05a63          	blez	s11,6108 <_vfiprintf_r+0x2dc>
    6978:	01000593          	li	a1,16
    697c:	3bb5dae3          	bge	a1,s11,7530 <_vfiprintf_r+0x1704>
    6980:	0000af97          	auipc	t6,0xa
    6984:	f80f8f93          	add	t6,t6,-128 # 10900 <zeroes.0>
    6988:	02e12223          	sw	a4,36(sp)
    698c:	000a8713          	mv	a4,s5
    6990:	000c0693          	mv	a3,s8
    6994:	000d8a93          	mv	s5,s11
    6998:	01000f13          	li	t5,16
    699c:	00700293          	li	t0,7
    69a0:	01c12c23          	sw	t3,24(sp)
    69a4:	01012e23          	sw	a6,28(sp)
    69a8:	03112023          	sw	a7,32(sp)
    69ac:	03d12423          	sw	t4,40(sp)
    69b0:	000f8c13          	mv	s8,t6
    69b4:	00070d93          	mv	s11,a4
    69b8:	0180006f          	j	69d0 <_vfiprintf_r+0xba4>
    69bc:	00260513          	add	a0,a2,2
    69c0:	00868693          	add	a3,a3,8
    69c4:	00070613          	mv	a2,a4
    69c8:	ff0a8a93          	add	s5,s5,-16
    69cc:	055f5c63          	bge	t5,s5,6a24 <_vfiprintf_r+0xbf8>
    69d0:	01078793          	add	a5,a5,16
    69d4:	00160713          	add	a4,a2,1
    69d8:	0186a023          	sw	s8,0(a3)
    69dc:	01e6a223          	sw	t5,4(a3)
    69e0:	06f12423          	sw	a5,104(sp)
    69e4:	06e12223          	sw	a4,100(sp)
    69e8:	fce2dae3          	bge	t0,a4,69bc <_vfiprintf_r+0xb90>
    69ec:	1c078663          	beqz	a5,6bb8 <_vfiprintf_r+0xd8c>
    69f0:	06010613          	add	a2,sp,96
    69f4:	00098593          	mv	a1,s3
    69f8:	00040513          	mv	a0,s0
    69fc:	af4ff0ef          	jal	5cf0 <__sprint_r.part.0>
    6a00:	8e051ee3          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    6a04:	06412603          	lw	a2,100(sp)
    6a08:	01000f13          	li	t5,16
    6a0c:	ff0a8a93          	add	s5,s5,-16
    6a10:	06812783          	lw	a5,104(sp)
    6a14:	000a0693          	mv	a3,s4
    6a18:	00160513          	add	a0,a2,1
    6a1c:	00700293          	li	t0,7
    6a20:	fb5f48e3          	blt	t5,s5,69d0 <_vfiprintf_r+0xba4>
    6a24:	01812e03          	lw	t3,24(sp)
    6a28:	01c12803          	lw	a6,28(sp)
    6a2c:	02012883          	lw	a7,32(sp)
    6a30:	02412703          	lw	a4,36(sp)
    6a34:	02812e83          	lw	t4,40(sp)
    6a38:	000d8613          	mv	a2,s11
    6a3c:	000c0f93          	mv	t6,s8
    6a40:	000a8d93          	mv	s11,s5
    6a44:	00068c13          	mv	s8,a3
    6a48:	00060a93          	mv	s5,a2
    6a4c:	01b787b3          	add	a5,a5,s11
    6a50:	01fc2023          	sw	t6,0(s8)
    6a54:	01bc2223          	sw	s11,4(s8)
    6a58:	06f12423          	sw	a5,104(sp)
    6a5c:	06a12223          	sw	a0,100(sp)
    6a60:	00700613          	li	a2,7
    6a64:	4ea65863          	bge	a2,a0,6f54 <_vfiprintf_r+0x1128>
    6a68:	1a0786e3          	beqz	a5,7414 <_vfiprintf_r+0x15e8>
    6a6c:	06010613          	add	a2,sp,96
    6a70:	00098593          	mv	a1,s3
    6a74:	00040513          	mv	a0,s0
    6a78:	03d12423          	sw	t4,40(sp)
    6a7c:	02e12223          	sw	a4,36(sp)
    6a80:	03112023          	sw	a7,32(sp)
    6a84:	01012e23          	sw	a6,28(sp)
    6a88:	01c12c23          	sw	t3,24(sp)
    6a8c:	a64ff0ef          	jal	5cf0 <__sprint_r.part.0>
    6a90:	860516e3          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    6a94:	02412703          	lw	a4,36(sp)
    6a98:	06412603          	lw	a2,100(sp)
    6a9c:	06812783          	lw	a5,104(sp)
    6aa0:	41a70733          	sub	a4,a4,s10
    6aa4:	02812e83          	lw	t4,40(sp)
    6aa8:	02012883          	lw	a7,32(sp)
    6aac:	01c12803          	lw	a6,28(sp)
    6ab0:	01812e03          	lw	t3,24(sp)
    6ab4:	000a0c13          	mv	s8,s4
    6ab8:	00160f13          	add	t5,a2,1
    6abc:	e4e05a63          	blez	a4,6110 <_vfiprintf_r+0x2e4>
    6ac0:	01000593          	li	a1,16
    6ac4:	0000af97          	auipc	t6,0xa
    6ac8:	e3cf8f93          	add	t6,t6,-452 # 10900 <zeroes.0>
    6acc:	0ae5da63          	bge	a1,a4,6b80 <_vfiprintf_r+0xd54>
    6ad0:	000c0593          	mv	a1,s8
    6ad4:	03512423          	sw	s5,40(sp)
    6ad8:	01000d93          	li	s11,16
    6adc:	00700293          	li	t0,7
    6ae0:	01c12c23          	sw	t3,24(sp)
    6ae4:	01012e23          	sw	a6,28(sp)
    6ae8:	03112023          	sw	a7,32(sp)
    6aec:	03d12223          	sw	t4,36(sp)
    6af0:	00070a93          	mv	s5,a4
    6af4:	000b0c13          	mv	s8,s6
    6af8:	0180006f          	j	6b10 <_vfiprintf_r+0xce4>
    6afc:	00260f13          	add	t5,a2,2
    6b00:	00858593          	add	a1,a1,8
    6b04:	00068613          	mv	a2,a3
    6b08:	ff0a8a93          	add	s5,s5,-16
    6b0c:	055dda63          	bge	s11,s5,6b60 <_vfiprintf_r+0xd34>
    6b10:	01078793          	add	a5,a5,16
    6b14:	00160693          	add	a3,a2,1
    6b18:	0165a023          	sw	s6,0(a1)
    6b1c:	01b5a223          	sw	s11,4(a1)
    6b20:	06f12423          	sw	a5,104(sp)
    6b24:	06d12223          	sw	a3,100(sp)
    6b28:	fcd2dae3          	bge	t0,a3,6afc <_vfiprintf_r+0xcd0>
    6b2c:	06078e63          	beqz	a5,6ba8 <_vfiprintf_r+0xd7c>
    6b30:	06010613          	add	a2,sp,96
    6b34:	00098593          	mv	a1,s3
    6b38:	00040513          	mv	a0,s0
    6b3c:	9b4ff0ef          	jal	5cf0 <__sprint_r.part.0>
    6b40:	fa051e63          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    6b44:	06412603          	lw	a2,100(sp)
    6b48:	ff0a8a93          	add	s5,s5,-16
    6b4c:	06812783          	lw	a5,104(sp)
    6b50:	000a0593          	mv	a1,s4
    6b54:	00160f13          	add	t5,a2,1
    6b58:	00700293          	li	t0,7
    6b5c:	fb5dcae3          	blt	s11,s5,6b10 <_vfiprintf_r+0xce4>
    6b60:	000a8713          	mv	a4,s5
    6b64:	01812e03          	lw	t3,24(sp)
    6b68:	01c12803          	lw	a6,28(sp)
    6b6c:	02012883          	lw	a7,32(sp)
    6b70:	02412e83          	lw	t4,36(sp)
    6b74:	02812a83          	lw	s5,40(sp)
    6b78:	000c0f93          	mv	t6,s8
    6b7c:	00058c13          	mv	s8,a1
    6b80:	00e787b3          	add	a5,a5,a4
    6b84:	00ec2223          	sw	a4,4(s8)
    6b88:	01fc2023          	sw	t6,0(s8)
    6b8c:	06f12423          	sw	a5,104(sp)
    6b90:	07e12223          	sw	t5,100(sp)
    6b94:	00700713          	li	a4,7
    6b98:	25e74863          	blt	a4,t5,6de8 <_vfiprintf_r+0xfbc>
    6b9c:	008c0c13          	add	s8,s8,8
    6ba0:	001f0f13          	add	t5,t5,1
    6ba4:	d6cff06f          	j	6110 <_vfiprintf_r+0x2e4>
    6ba8:	00100f13          	li	t5,1
    6bac:	00000613          	li	a2,0
    6bb0:	000a0593          	mv	a1,s4
    6bb4:	f55ff06f          	j	6b08 <_vfiprintf_r+0xcdc>
    6bb8:	00100513          	li	a0,1
    6bbc:	00000613          	li	a2,0
    6bc0:	000a0693          	mv	a3,s4
    6bc4:	e05ff06f          	j	69c8 <_vfiprintf_r+0xb9c>
    6bc8:	06078263          	beqz	a5,6c2c <_vfiprintf_r+0xe00>
    6bcc:	06010613          	add	a2,sp,96
    6bd0:	00098593          	mv	a1,s3
    6bd4:	00040513          	mv	a0,s0
    6bd8:	03d12e23          	sw	t4,60(sp)
    6bdc:	02e12c23          	sw	a4,56(sp)
    6be0:	03112423          	sw	a7,40(sp)
    6be4:	03012223          	sw	a6,36(sp)
    6be8:	02512023          	sw	t0,32(sp)
    6bec:	01f12e23          	sw	t6,28(sp)
    6bf0:	01c12c23          	sw	t3,24(sp)
    6bf4:	8fcff0ef          	jal	5cf0 <__sprint_r.part.0>
    6bf8:	f0051263          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    6bfc:	06412603          	lw	a2,100(sp)
    6c00:	06812783          	lw	a5,104(sp)
    6c04:	03c12e83          	lw	t4,60(sp)
    6c08:	03812703          	lw	a4,56(sp)
    6c0c:	02812883          	lw	a7,40(sp)
    6c10:	02412803          	lw	a6,36(sp)
    6c14:	02012283          	lw	t0,32(sp)
    6c18:	01c12f83          	lw	t6,28(sp)
    6c1c:	01812e03          	lw	t3,24(sp)
    6c20:	000a0c13          	mv	s8,s4
    6c24:	00160f13          	add	t5,a2,1
    6c28:	c58ff06f          	j	6080 <_vfiprintf_r+0x254>
    6c2c:	380f8863          	beqz	t6,6fbc <_vfiprintf_r+0x1190>
    6c30:	04410793          	add	a5,sp,68
    6c34:	06f12623          	sw	a5,108(sp)
    6c38:	00200793          	li	a5,2
    6c3c:	06f12823          	sw	a5,112(sp)
    6c40:	00100f13          	li	t5,1
    6c44:	000a0c13          	mv	s8,s4
    6c48:	000f0613          	mv	a2,t5
    6c4c:	008c0c13          	add	s8,s8,8
    6c50:	001f0f13          	add	t5,t5,1
    6c54:	cacff06f          	j	6100 <_vfiprintf_r+0x2d4>
    6c58:	00200693          	li	a3,2
    6c5c:	00050e13          	mv	t3,a0
    6c60:	aa0684e3          	beqz	a3,6708 <_vfiprintf_r+0x8dc>
    6c64:	01412503          	lw	a0,20(sp)
    6c68:	11010813          	add	a6,sp,272
    6c6c:	00f7f693          	and	a3,a5,15
    6c70:	00d506b3          	add	a3,a0,a3
    6c74:	0006c603          	lbu	a2,0(a3)
    6c78:	0047d793          	srl	a5,a5,0x4
    6c7c:	01c59693          	sll	a3,a1,0x1c
    6c80:	00f6e7b3          	or	a5,a3,a5
    6c84:	0045d593          	srl	a1,a1,0x4
    6c88:	fec80fa3          	sb	a2,-1(a6)
    6c8c:	00b7e6b3          	or	a3,a5,a1
    6c90:	fff80813          	add	a6,a6,-1
    6c94:	fc069ce3          	bnez	a3,6c6c <_vfiprintf_r+0xe40>
    6c98:	11010793          	add	a5,sp,272
    6c9c:	41078d33          	sub	s10,a5,a6
    6ca0:	00070e93          	mv	t4,a4
    6ca4:	c9a754e3          	bge	a4,s10,692c <_vfiprintf_r+0xb00>
    6ca8:	000d0e93          	mv	t4,s10
    6cac:	c81ff06f          	j	692c <_vfiprintf_r+0xb00>
    6cb0:	01000513          	li	a0,16
    6cb4:	01b554e3          	bge	a0,s11,74bc <_vfiprintf_r+0x1690>
    6cb8:	000a8693          	mv	a3,s5
    6cbc:	0000a317          	auipc	t1,0xa
    6cc0:	c5430313          	add	t1,t1,-940 # 10910 <blanks.1>
    6cc4:	02e12c23          	sw	a4,56(sp)
    6cc8:	000d8a93          	mv	s5,s11
    6ccc:	000c0713          	mv	a4,s8
    6cd0:	01000f13          	li	t5,16
    6cd4:	00700393          	li	t2,7
    6cd8:	01c12c23          	sw	t3,24(sp)
    6cdc:	01f12e23          	sw	t6,28(sp)
    6ce0:	02512023          	sw	t0,32(sp)
    6ce4:	03012223          	sw	a6,36(sp)
    6ce8:	03112423          	sw	a7,40(sp)
    6cec:	03d12e23          	sw	t4,60(sp)
    6cf0:	00030c13          	mv	s8,t1
    6cf4:	00068d93          	mv	s11,a3
    6cf8:	01c0006f          	j	6d14 <_vfiprintf_r+0xee8>
    6cfc:	00260513          	add	a0,a2,2
    6d00:	00870713          	add	a4,a4,8
    6d04:	00058613          	mv	a2,a1
    6d08:	ff0a8a93          	add	s5,s5,-16
    6d0c:	055f5c63          	bge	t5,s5,6d64 <_vfiprintf_r+0xf38>
    6d10:	00160593          	add	a1,a2,1
    6d14:	01078793          	add	a5,a5,16
    6d18:	01872023          	sw	s8,0(a4)
    6d1c:	01e72223          	sw	t5,4(a4)
    6d20:	06f12423          	sw	a5,104(sp)
    6d24:	06b12223          	sw	a1,100(sp)
    6d28:	fcb3dae3          	bge	t2,a1,6cfc <_vfiprintf_r+0xed0>
    6d2c:	08078a63          	beqz	a5,6dc0 <_vfiprintf_r+0xf94>
    6d30:	06010613          	add	a2,sp,96
    6d34:	00098593          	mv	a1,s3
    6d38:	00040513          	mv	a0,s0
    6d3c:	fb5fe0ef          	jal	5cf0 <__sprint_r.part.0>
    6d40:	da051e63          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    6d44:	06412603          	lw	a2,100(sp)
    6d48:	01000f13          	li	t5,16
    6d4c:	ff0a8a93          	add	s5,s5,-16
    6d50:	06812783          	lw	a5,104(sp)
    6d54:	000a0713          	mv	a4,s4
    6d58:	00160513          	add	a0,a2,1
    6d5c:	00700393          	li	t2,7
    6d60:	fb5f48e3          	blt	t5,s5,6d10 <_vfiprintf_r+0xee4>
    6d64:	000c0313          	mv	t1,s8
    6d68:	01812e03          	lw	t3,24(sp)
    6d6c:	00070c13          	mv	s8,a4
    6d70:	01c12f83          	lw	t6,28(sp)
    6d74:	02012283          	lw	t0,32(sp)
    6d78:	02412803          	lw	a6,36(sp)
    6d7c:	02812883          	lw	a7,40(sp)
    6d80:	03c12e83          	lw	t4,60(sp)
    6d84:	03812703          	lw	a4,56(sp)
    6d88:	000d8693          	mv	a3,s11
    6d8c:	000a8d93          	mv	s11,s5
    6d90:	00068a93          	mv	s5,a3
    6d94:	01b787b3          	add	a5,a5,s11
    6d98:	006c2023          	sw	t1,0(s8)
    6d9c:	01bc2223          	sw	s11,4(s8)
    6da0:	06f12423          	sw	a5,104(sp)
    6da4:	06a12223          	sw	a0,100(sp)
    6da8:	00700613          	li	a2,7
    6dac:	12a64063          	blt	a2,a0,6ecc <_vfiprintf_r+0x10a0>
    6db0:	008c0c13          	add	s8,s8,8
    6db4:	00150f13          	add	t5,a0,1
    6db8:	00050613          	mv	a2,a0
    6dbc:	a8cff06f          	j	6048 <_vfiprintf_r+0x21c>
    6dc0:	00000613          	li	a2,0
    6dc4:	00100513          	li	a0,1
    6dc8:	000a0713          	mv	a4,s4
    6dcc:	f3dff06f          	j	6d08 <_vfiprintf_r+0xedc>
    6dd0:	01d8d463          	bge	a7,t4,6dd8 <_vfiprintf_r+0xfac>
    6dd4:	000e8893          	mv	a7,t4
    6dd8:	00c12783          	lw	a5,12(sp)
    6ddc:	011787b3          	add	a5,a5,a7
    6de0:	00f12623          	sw	a5,12(sp)
    6de4:	ba8ff06f          	j	618c <_vfiprintf_r+0x360>
    6de8:	b4078ae3          	beqz	a5,693c <_vfiprintf_r+0xb10>
    6dec:	06010613          	add	a2,sp,96
    6df0:	00098593          	mv	a1,s3
    6df4:	00040513          	mv	a0,s0
    6df8:	03d12223          	sw	t4,36(sp)
    6dfc:	03112023          	sw	a7,32(sp)
    6e00:	01012e23          	sw	a6,28(sp)
    6e04:	01c12c23          	sw	t3,24(sp)
    6e08:	ee9fe0ef          	jal	5cf0 <__sprint_r.part.0>
    6e0c:	ce051863          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    6e10:	06412f03          	lw	t5,100(sp)
    6e14:	06812783          	lw	a5,104(sp)
    6e18:	02412e83          	lw	t4,36(sp)
    6e1c:	02012883          	lw	a7,32(sp)
    6e20:	01c12803          	lw	a6,28(sp)
    6e24:	01812e03          	lw	t3,24(sp)
    6e28:	000a0c13          	mv	s8,s4
    6e2c:	001f0f13          	add	t5,t5,1
    6e30:	ae0ff06f          	j	6110 <_vfiprintf_r+0x2e4>
    6e34:	06012223          	sw	zero,100(sp)
    6e38:	000a0c13          	mv	s8,s4
    6e3c:	c84ff06f          	j	62c0 <_vfiprintf_r+0x494>
    6e40:	01067693          	and	a3,a2,16
    6e44:	000aa783          	lw	a5,0(s5)
    6e48:	004a8a93          	add	s5,s5,4
    6e4c:	12069c63          	bnez	a3,6f84 <_vfiprintf_r+0x1158>
    6e50:	04067693          	and	a3,a2,64
    6e54:	12068463          	beqz	a3,6f7c <_vfiprintf_r+0x1150>
    6e58:	01079d93          	sll	s11,a5,0x10
    6e5c:	010ddd93          	srl	s11,s11,0x10
    6e60:	00000d13          	li	s10,0
    6e64:	ff4ff06f          	j	6658 <_vfiprintf_r+0x82c>
    6e68:	0106f613          	and	a2,a3,16
    6e6c:	000aa783          	lw	a5,0(s5)
    6e70:	004a8a93          	add	s5,s5,4
    6e74:	12061263          	bnez	a2,6f98 <_vfiprintf_r+0x116c>
    6e78:	0406f613          	and	a2,a3,64
    6e7c:	10060a63          	beqz	a2,6f90 <_vfiprintf_r+0x1164>
    6e80:	01079793          	sll	a5,a5,0x10
    6e84:	0107d793          	srl	a5,a5,0x10
    6e88:	00000593          	li	a1,0
    6e8c:	83dff06f          	j	66c8 <_vfiprintf_r+0x89c>
    6e90:	010e7693          	and	a3,t3,16
    6e94:	000aa783          	lw	a5,0(s5)
    6e98:	004a8a93          	add	s5,s5,4
    6e9c:	0c069863          	bnez	a3,6f6c <_vfiprintf_r+0x1140>
    6ea0:	040e7693          	and	a3,t3,64
    6ea4:	0c068063          	beqz	a3,6f64 <_vfiprintf_r+0x1138>
    6ea8:	01079d93          	sll	s11,a5,0x10
    6eac:	410ddd93          	sra	s11,s11,0x10
    6eb0:	41fddd13          	sra	s10,s11,0x1f
    6eb4:	000d0693          	mv	a3,s10
    6eb8:	f24ff06f          	j	65dc <_vfiprintf_r+0x7b0>
    6ebc:	00100f13          	li	t5,1
    6ec0:	00000613          	li	a2,0
    6ec4:	000a0c13          	mv	s8,s4
    6ec8:	a38ff06f          	j	6100 <_vfiprintf_r+0x2d4>
    6ecc:	1a078463          	beqz	a5,7074 <_vfiprintf_r+0x1248>
    6ed0:	06010613          	add	a2,sp,96
    6ed4:	00098593          	mv	a1,s3
    6ed8:	00040513          	mv	a0,s0
    6edc:	03d12e23          	sw	t4,60(sp)
    6ee0:	02e12c23          	sw	a4,56(sp)
    6ee4:	03112423          	sw	a7,40(sp)
    6ee8:	03012223          	sw	a6,36(sp)
    6eec:	02512023          	sw	t0,32(sp)
    6ef0:	01f12e23          	sw	t6,28(sp)
    6ef4:	01c12c23          	sw	t3,24(sp)
    6ef8:	df9fe0ef          	jal	5cf0 <__sprint_r.part.0>
    6efc:	c0051063          	bnez	a0,62fc <_vfiprintf_r+0x4d0>
    6f00:	06412603          	lw	a2,100(sp)
    6f04:	06812783          	lw	a5,104(sp)
    6f08:	03c12e83          	lw	t4,60(sp)
    6f0c:	03812703          	lw	a4,56(sp)
    6f10:	02812883          	lw	a7,40(sp)
    6f14:	02412803          	lw	a6,36(sp)
    6f18:	02012283          	lw	t0,32(sp)
    6f1c:	01c12f83          	lw	t6,28(sp)
    6f20:	01812e03          	lw	t3,24(sp)
    6f24:	000a0c13          	mv	s8,s4
    6f28:	00160f13          	add	t5,a2,1
    6f2c:	91cff06f          	j	6048 <_vfiprintf_r+0x21c>
    6f30:	000d8e13          	mv	t3,s11
    6f34:	e88ff06f          	j	65bc <_vfiprintf_r+0x790>
    6f38:	00000e93          	li	t4,0
    6f3c:	11010813          	add	a6,sp,272
    6f40:	9edff06f          	j	692c <_vfiprintf_r+0xb00>
    6f44:	0589a503          	lw	a0,88(s3)
    6f48:	8b4fb0ef          	jal	1ffc <__retarget_lock_acquire_recursive>
    6f4c:	00c99783          	lh	a5,12(s3)
    6f50:	f41fe06f          	j	5e90 <_vfiprintf_r+0x64>
    6f54:	008c0c13          	add	s8,s8,8
    6f58:	00150f13          	add	t5,a0,1
    6f5c:	00050613          	mv	a2,a0
    6f60:	9a8ff06f          	j	6108 <_vfiprintf_r+0x2dc>
    6f64:	200e7693          	and	a3,t3,512
    6f68:	50069463          	bnez	a3,7470 <_vfiprintf_r+0x1644>
    6f6c:	41f7dd13          	sra	s10,a5,0x1f
    6f70:	00078d93          	mv	s11,a5
    6f74:	000d0693          	mv	a3,s10
    6f78:	e64ff06f          	j	65dc <_vfiprintf_r+0x7b0>
    6f7c:	20067693          	and	a3,a2,512
    6f80:	4c069663          	bnez	a3,744c <_vfiprintf_r+0x1620>
    6f84:	00078d93          	mv	s11,a5
    6f88:	00000d13          	li	s10,0
    6f8c:	eccff06f          	j	6658 <_vfiprintf_r+0x82c>
    6f90:	2006f613          	and	a2,a3,512
    6f94:	4c061863          	bnez	a2,7464 <_vfiprintf_r+0x1638>
    6f98:	00000593          	li	a1,0
    6f9c:	f2cff06f          	j	66c8 <_vfiprintf_r+0x89c>
    6fa0:	00c12683          	lw	a3,12(sp)
    6fa4:	000aa783          	lw	a5,0(s5)
    6fa8:	004a8a93          	add	s5,s5,4
    6fac:	41f6d713          	sra	a4,a3,0x1f
    6fb0:	00d7a023          	sw	a3,0(a5)
    6fb4:	00e7a223          	sw	a4,4(a5)
    6fb8:	f8dfe06f          	j	5f44 <_vfiprintf_r+0x118>
    6fbc:	00000613          	li	a2,0
    6fc0:	00100f13          	li	t5,1
    6fc4:	000a0c13          	mv	s8,s4
    6fc8:	938ff06f          	j	6100 <_vfiprintf_r+0x2d4>
    6fcc:	000aa783          	lw	a5,0(s5)
    6fd0:	00100e93          	li	t4,1
    6fd4:	00100d13          	li	s10,1
    6fd8:	0af10623          	sb	a5,172(sp)
    6fdc:	0ac10593          	add	a1,sp,172
    6fe0:	db8ff06f          	j	6598 <_vfiprintf_r+0x76c>
    6fe4:	000d0e93          	mv	t4,s10
    6fe8:	00050813          	mv	a6,a0
    6fec:	941ff06f          	j	692c <_vfiprintf_r+0xb00>
    6ff0:	fff00713          	li	a4,-1
    6ff4:	00058c93          	mv	s9,a1
    6ff8:	fb9fe06f          	j	5fb0 <_vfiprintf_r+0x184>
    6ffc:	000d8613          	mv	a2,s11
    7000:	e3cff06f          	j	663c <_vfiprintf_r+0x810>
    7004:	00009797          	auipc	a5,0x9
    7008:	29c78793          	add	a5,a5,668 # 102a0 <__fini_array_end+0x2f8>
    700c:	000d8e13          	mv	t3,s11
    7010:	00f12a23          	sw	a5,20(sp)
    7014:	020e7793          	and	a5,t3,32
    7018:	1c078c63          	beqz	a5,71f0 <_vfiprintf_r+0x13c4>
    701c:	007a8a93          	add	s5,s5,7
    7020:	ff8afa93          	and	s5,s5,-8
    7024:	000aa783          	lw	a5,0(s5)
    7028:	004aa583          	lw	a1,4(s5)
    702c:	008a8a93          	add	s5,s5,8
    7030:	001e7613          	and	a2,t3,1
    7034:	00060e63          	beqz	a2,7050 <_vfiprintf_r+0x1224>
    7038:	00b7e633          	or	a2,a5,a1
    703c:	00060a63          	beqz	a2,7050 <_vfiprintf_r+0x1224>
    7040:	03000613          	li	a2,48
    7044:	04c10223          	sb	a2,68(sp)
    7048:	04d102a3          	sb	a3,69(sp)
    704c:	002e6e13          	or	t3,t3,2
    7050:	bffe7e13          	and	t3,t3,-1025
    7054:	f3cff06f          	j	6790 <_vfiprintf_r+0x964>
    7058:	000d8693          	mv	a3,s11
    705c:	e50ff06f          	j	66ac <_vfiprintf_r+0x880>
    7060:	00009797          	auipc	a5,0x9
    7064:	22c78793          	add	a5,a5,556 # 1028c <__fini_array_end+0x2e4>
    7068:	000d8e13          	mv	t3,s11
    706c:	00f12a23          	sw	a5,20(sp)
    7070:	fa5ff06f          	j	7014 <_vfiprintf_r+0x11e8>
    7074:	04314603          	lbu	a2,67(sp)
    7078:	3a060a63          	beqz	a2,742c <_vfiprintf_r+0x1600>
    707c:	04310793          	add	a5,sp,67
    7080:	06f12623          	sw	a5,108(sp)
    7084:	00100793          	li	a5,1
    7088:	06f12823          	sw	a5,112(sp)
    708c:	00100f13          	li	t5,1
    7090:	000a0c13          	mv	s8,s4
    7094:	fe1fe06f          	j	6074 <_vfiprintf_r+0x248>
    7098:	00800613          	li	a2,8
    709c:	00000593          	li	a1,0
    70a0:	05810513          	add	a0,sp,88
    70a4:	02e12023          	sw	a4,32(sp)
    70a8:	01112e23          	sw	a7,28(sp)
    70ac:	01c12c23          	sw	t3,24(sp)
    70b0:	05012623          	sw	a6,76(sp)
    70b4:	01012823          	sw	a6,16(sp)
    70b8:	f4dfa0ef          	jal	2004 <memset>
    70bc:	02012703          	lw	a4,32(sp)
    70c0:	01012803          	lw	a6,16(sp)
    70c4:	01812e03          	lw	t3,24(sp)
    70c8:	01c12883          	lw	a7,28(sp)
    70cc:	2a074463          	bltz	a4,7374 <_vfiprintf_r+0x1548>
    70d0:	00000d93          	li	s11,0
    70d4:	00000d13          	li	s10,0
    70d8:	01812823          	sw	s8,16(sp)
    70dc:	01012e23          	sw	a6,28(sp)
    70e0:	000d8c13          	mv	s8,s11
    70e4:	03112023          	sw	a7,32(sp)
    70e8:	000c8d93          	mv	s11,s9
    70ec:	000a8c93          	mv	s9,s5
    70f0:	000d0a93          	mv	s5,s10
    70f4:	00098d13          	mv	s10,s3
    70f8:	00070993          	mv	s3,a4
    70fc:	0300006f          	j	712c <_vfiprintf_r+0x1300>
    7100:	05810693          	add	a3,sp,88
    7104:	0ac10593          	add	a1,sp,172
    7108:	00040513          	mv	a0,s0
    710c:	2f5040ef          	jal	bc00 <_wcrtomb_r>
    7110:	fff00793          	li	a5,-1
    7114:	48f50063          	beq	a0,a5,7594 <_vfiprintf_r+0x1768>
    7118:	00aa87b3          	add	a5,s5,a0
    711c:	02f9c063          	blt	s3,a5,713c <_vfiprintf_r+0x1310>
    7120:	004c0c13          	add	s8,s8,4
    7124:	45378463          	beq	a5,s3,756c <_vfiprintf_r+0x1740>
    7128:	00078a93          	mv	s5,a5
    712c:	04c12783          	lw	a5,76(sp)
    7130:	018787b3          	add	a5,a5,s8
    7134:	0007a603          	lw	a2,0(a5)
    7138:	fc0614e3          	bnez	a2,7100 <_vfiprintf_r+0x12d4>
    713c:	01012c03          	lw	s8,16(sp)
    7140:	01812e03          	lw	t3,24(sp)
    7144:	01c12803          	lw	a6,28(sp)
    7148:	02012883          	lw	a7,32(sp)
    714c:	000d0993          	mv	s3,s10
    7150:	000a8d13          	mv	s10,s5
    7154:	000c8a93          	mv	s5,s9
    7158:	000d8c93          	mv	s9,s11
    715c:	280d0e63          	beqz	s10,73f8 <_vfiprintf_r+0x15cc>
    7160:	06300793          	li	a5,99
    7164:	33a7d463          	bge	a5,s10,748c <_vfiprintf_r+0x1660>
    7168:	001d0593          	add	a1,s10,1
    716c:	00040513          	mv	a0,s0
    7170:	01112c23          	sw	a7,24(sp)
    7174:	01c12823          	sw	t3,16(sp)
    7178:	de8fb0ef          	jal	2760 <_malloc_r>
    717c:	01012e03          	lw	t3,16(sp)
    7180:	01812883          	lw	a7,24(sp)
    7184:	00050813          	mv	a6,a0
    7188:	42050063          	beqz	a0,75a8 <_vfiprintf_r+0x177c>
    718c:	00a12823          	sw	a0,16(sp)
    7190:	00800613          	li	a2,8
    7194:	00000593          	li	a1,0
    7198:	05810513          	add	a0,sp,88
    719c:	03112023          	sw	a7,32(sp)
    71a0:	01c12e23          	sw	t3,28(sp)
    71a4:	01012c23          	sw	a6,24(sp)
    71a8:	e5dfa0ef          	jal	2004 <memset>
    71ac:	01812803          	lw	a6,24(sp)
    71b0:	05810713          	add	a4,sp,88
    71b4:	000d0693          	mv	a3,s10
    71b8:	00080593          	mv	a1,a6
    71bc:	04c10613          	add	a2,sp,76
    71c0:	00040513          	mv	a0,s0
    71c4:	2c9040ef          	jal	bc8c <_wcsrtombs_r>
    71c8:	01812803          	lw	a6,24(sp)
    71cc:	01c12e03          	lw	t3,28(sp)
    71d0:	02012883          	lw	a7,32(sp)
    71d4:	40ad1063          	bne	s10,a0,75d4 <_vfiprintf_r+0x17a8>
    71d8:	fffd4e93          	not	t4,s10
    71dc:	01a807b3          	add	a5,a6,s10
    71e0:	41fede93          	sra	t4,t4,0x1f
    71e4:	00078023          	sb	zero,0(a5)
    71e8:	01dd7eb3          	and	t4,s10,t4
    71ec:	2140006f          	j	7400 <_vfiprintf_r+0x15d4>
    71f0:	010e7613          	and	a2,t3,16
    71f4:	000aa783          	lw	a5,0(s5)
    71f8:	004a8a93          	add	s5,s5,4
    71fc:	02061263          	bnez	a2,7220 <_vfiprintf_r+0x13f4>
    7200:	040e7613          	and	a2,t3,64
    7204:	00060a63          	beqz	a2,7218 <_vfiprintf_r+0x13ec>
    7208:	01079793          	sll	a5,a5,0x10
    720c:	0107d793          	srl	a5,a5,0x10
    7210:	00000593          	li	a1,0
    7214:	e1dff06f          	j	7030 <_vfiprintf_r+0x1204>
    7218:	200e7613          	and	a2,t3,512
    721c:	22061e63          	bnez	a2,7458 <_vfiprintf_r+0x162c>
    7220:	00000593          	li	a1,0
    7224:	e0dff06f          	j	7030 <_vfiprintf_r+0x1204>
    7228:	400e7793          	and	a5,t3,1024
    722c:	00000693          	li	a3,0
    7230:	11010e93          	add	t4,sp,272
    7234:	01812823          	sw	s8,16(sp)
    7238:	02812223          	sw	s0,36(sp)
    723c:	03912c23          	sw	s9,56(sp)
    7240:	03512e23          	sw	s5,60(sp)
    7244:	02c12c83          	lw	s9,44(sp)
    7248:	01c12c23          	sw	t3,24(sp)
    724c:	01112e23          	sw	a7,28(sp)
    7250:	02e12023          	sw	a4,32(sp)
    7254:	00078c13          	mv	s8,a5
    7258:	00068413          	mv	s0,a3
    725c:	03312423          	sw	s3,40(sp)
    7260:	000e8a93          	mv	s5,t4
    7264:	0280006f          	j	728c <_vfiprintf_r+0x1460>
    7268:	00a00613          	li	a2,10
    726c:	00000693          	li	a3,0
    7270:	000d8513          	mv	a0,s11
    7274:	000d0593          	mv	a1,s10
    7278:	364050ef          	jal	c5dc <__udivdi3>
    727c:	220d0a63          	beqz	s10,74b0 <_vfiprintf_r+0x1684>
    7280:	00050d93          	mv	s11,a0
    7284:	00058d13          	mv	s10,a1
    7288:	00098a93          	mv	s5,s3
    728c:	00a00613          	li	a2,10
    7290:	00000693          	li	a3,0
    7294:	000d8513          	mv	a0,s11
    7298:	000d0593          	mv	a1,s10
    729c:	1ed050ef          	jal	cc88 <__umoddi3>
    72a0:	03050513          	add	a0,a0,48
    72a4:	feaa8fa3          	sb	a0,-1(s5)
    72a8:	fffa8993          	add	s3,s5,-1
    72ac:	00140413          	add	s0,s0,1
    72b0:	fa0c0ce3          	beqz	s8,7268 <_vfiprintf_r+0x143c>
    72b4:	000cc783          	lbu	a5,0(s9)
    72b8:	fa8798e3          	bne	a5,s0,7268 <_vfiprintf_r+0x143c>
    72bc:	0ff00793          	li	a5,255
    72c0:	faf404e3          	beq	s0,a5,7268 <_vfiprintf_r+0x143c>
    72c4:	0e0d1a63          	bnez	s10,73b8 <_vfiprintf_r+0x158c>
    72c8:	00900793          	li	a5,9
    72cc:	0fb7e663          	bltu	a5,s11,73b8 <_vfiprintf_r+0x158c>
    72d0:	00098813          	mv	a6,s3
    72d4:	03912623          	sw	s9,44(sp)
    72d8:	01012c03          	lw	s8,16(sp)
    72dc:	01812e03          	lw	t3,24(sp)
    72e0:	01c12883          	lw	a7,28(sp)
    72e4:	02012703          	lw	a4,32(sp)
    72e8:	02412403          	lw	s0,36(sp)
    72ec:	02812983          	lw	s3,40(sp)
    72f0:	03812c83          	lw	s9,56(sp)
    72f4:	03c12a83          	lw	s5,60(sp)
    72f8:	9a1ff06f          	j	6c98 <_vfiprintf_r+0xe6c>
    72fc:	00068e13          	mv	t3,a3
    7300:	00000693          	li	a3,0
    7304:	c0068263          	beqz	a3,6708 <_vfiprintf_r+0x8dc>
    7308:	95dff06f          	j	6c64 <_vfiprintf_r+0xe38>
    730c:	00040513          	mv	a0,s0
    7310:	115000ef          	jal	7c24 <__sinit>
    7314:	b61fe06f          	j	5e74 <_vfiprintf_r+0x48>
    7318:	001cc683          	lbu	a3,1(s9)
    731c:	200ded93          	or	s11,s11,512
    7320:	001c8c93          	add	s9,s9,1
    7324:	c89fe06f          	j	5fac <_vfiprintf_r+0x180>
    7328:	001cc683          	lbu	a3,1(s9)
    732c:	020ded93          	or	s11,s11,32
    7330:	001c8c93          	add	s9,s9,1
    7334:	c79fe06f          	j	5fac <_vfiprintf_r+0x180>
    7338:	000aa783          	lw	a5,0(s5)
    733c:	00c12703          	lw	a4,12(sp)
    7340:	004a8a93          	add	s5,s5,4
    7344:	00e7a023          	sw	a4,0(a5)
    7348:	bfdfe06f          	j	5f44 <_vfiprintf_r+0x118>
    734c:	00600793          	li	a5,6
    7350:	00070d13          	mv	s10,a4
    7354:	0ce7e863          	bltu	a5,a4,7424 <_vfiprintf_r+0x15f8>
    7358:	000d0e93          	mv	t4,s10
    735c:	00009817          	auipc	a6,0x9
    7360:	f5880813          	add	a6,a6,-168 # 102b4 <__fini_array_end+0x30c>
    7364:	cb9fe06f          	j	601c <_vfiprintf_r+0x1f0>
    7368:	00000793          	li	a5,0
    736c:	00000593          	li	a1,0
    7370:	8f5ff06f          	j	6c64 <_vfiprintf_r+0xe38>
    7374:	05810713          	add	a4,sp,88
    7378:	00000693          	li	a3,0
    737c:	04c10613          	add	a2,sp,76
    7380:	00000593          	li	a1,0
    7384:	00040513          	mv	a0,s0
    7388:	01112e23          	sw	a7,28(sp)
    738c:	01012c23          	sw	a6,24(sp)
    7390:	01c12823          	sw	t3,16(sp)
    7394:	0f9040ef          	jal	bc8c <_wcsrtombs_r>
    7398:	fff00793          	li	a5,-1
    739c:	01012e03          	lw	t3,16(sp)
    73a0:	01812803          	lw	a6,24(sp)
    73a4:	01c12883          	lw	a7,28(sp)
    73a8:	00050d13          	mv	s10,a0
    73ac:	1ef50e63          	beq	a0,a5,75a8 <_vfiprintf_r+0x177c>
    73b0:	05012623          	sw	a6,76(sp)
    73b4:	da9ff06f          	j	715c <_vfiprintf_r+0x1330>
    73b8:	03012783          	lw	a5,48(sp)
    73bc:	03412583          	lw	a1,52(sp)
    73c0:	00000413          	li	s0,0
    73c4:	40f989b3          	sub	s3,s3,a5
    73c8:	00078613          	mv	a2,a5
    73cc:	00098513          	mv	a0,s3
    73d0:	6c8010ef          	jal	8a98 <strncpy>
    73d4:	001cc783          	lbu	a5,1(s9)
    73d8:	00a00613          	li	a2,10
    73dc:	00000693          	li	a3,0
    73e0:	00f037b3          	snez	a5,a5
    73e4:	000d8513          	mv	a0,s11
    73e8:	000d0593          	mv	a1,s10
    73ec:	00fc8cb3          	add	s9,s9,a5
    73f0:	1ec050ef          	jal	c5dc <__udivdi3>
    73f4:	e8dff06f          	j	7280 <_vfiprintf_r+0x1454>
    73f8:	00000e93          	li	t4,0
    73fc:	00012823          	sw	zero,16(sp)
    7400:	04314783          	lbu	a5,67(sp)
    7404:	00000713          	li	a4,0
    7408:	00000f93          	li	t6,0
    740c:	a0079063          	bnez	a5,660c <_vfiprintf_r+0x7e0>
    7410:	c19fe06f          	j	6028 <_vfiprintf_r+0x1fc>
    7414:	00100f13          	li	t5,1
    7418:	00000613          	li	a2,0
    741c:	000a0c13          	mv	s8,s4
    7420:	ce9fe06f          	j	6108 <_vfiprintf_r+0x2dc>
    7424:	00600d13          	li	s10,6
    7428:	f31ff06f          	j	7358 <_vfiprintf_r+0x152c>
    742c:	00100f13          	li	t5,1
    7430:	000a0c13          	mv	s8,s4
    7434:	c4dfe06f          	j	6080 <_vfiprintf_r+0x254>
    7438:	000aa783          	lw	a5,0(s5)
    743c:	00c12703          	lw	a4,12(sp)
    7440:	004a8a93          	add	s5,s5,4
    7444:	00e79023          	sh	a4,0(a5)
    7448:	afdfe06f          	j	5f44 <_vfiprintf_r+0x118>
    744c:	0ff7fd93          	zext.b	s11,a5
    7450:	00000d13          	li	s10,0
    7454:	a04ff06f          	j	6658 <_vfiprintf_r+0x82c>
    7458:	0ff7f793          	zext.b	a5,a5
    745c:	00000593          	li	a1,0
    7460:	bd1ff06f          	j	7030 <_vfiprintf_r+0x1204>
    7464:	0ff7f793          	zext.b	a5,a5
    7468:	00000593          	li	a1,0
    746c:	a5cff06f          	j	66c8 <_vfiprintf_r+0x89c>
    7470:	01879d93          	sll	s11,a5,0x18
    7474:	418ddd93          	sra	s11,s11,0x18
    7478:	41fddd13          	sra	s10,s11,0x1f
    747c:	000d0693          	mv	a3,s10
    7480:	95cff06f          	j	65dc <_vfiprintf_r+0x7b0>
    7484:	03000793          	li	a5,48
    7488:	c8cff06f          	j	6914 <_vfiprintf_r+0xae8>
    748c:	00012823          	sw	zero,16(sp)
    7490:	0ac10813          	add	a6,sp,172
    7494:	cfdff06f          	j	7190 <_vfiprintf_r+0x1364>
    7498:	0589a503          	lw	a0,88(s3)
    749c:	b65fa0ef          	jal	2000 <__retarget_lock_release_recursive>
    74a0:	d51fe06f          	j	61f0 <_vfiprintf_r+0x3c4>
    74a4:	00070e93          	mv	t4,a4
    74a8:	00070d13          	mv	s10,a4
    74ac:	f55ff06f          	j	7400 <_vfiprintf_r+0x15d4>
    74b0:	00900793          	li	a5,9
    74b4:	ddb7e6e3          	bltu	a5,s11,7280 <_vfiprintf_r+0x1454>
    74b8:	e19ff06f          	j	72d0 <_vfiprintf_r+0x14a4>
    74bc:	00058513          	mv	a0,a1
    74c0:	00009317          	auipc	t1,0x9
    74c4:	45030313          	add	t1,t1,1104 # 10910 <blanks.1>
    74c8:	8cdff06f          	j	6d94 <_vfiprintf_r+0xf68>
    74cc:	00080513          	mv	a0,a6
    74d0:	03112023          	sw	a7,32(sp)
    74d4:	01012c23          	sw	a6,24(sp)
    74d8:	01b12e23          	sw	s11,28(sp)
    74dc:	da9fa0ef          	jal	2284 <strlen>
    74e0:	fff54e93          	not	t4,a0
    74e4:	41fede93          	sra	t4,t4,0x1f
    74e8:	01812803          	lw	a6,24(sp)
    74ec:	01c12e03          	lw	t3,28(sp)
    74f0:	02012883          	lw	a7,32(sp)
    74f4:	00050d13          	mv	s10,a0
    74f8:	01d57eb3          	and	t4,a0,t4
    74fc:	00012823          	sw	zero,16(sp)
    7500:	f01ff06f          	j	7400 <_vfiprintf_r+0x15d4>
    7504:	06010613          	add	a2,sp,96
    7508:	00098593          	mv	a1,s3
    750c:	00040513          	mv	a0,s0
    7510:	fe0fe0ef          	jal	5cf0 <__sprint_r.part.0>
    7514:	00051463          	bnez	a0,751c <_vfiprintf_r+0x16f0>
    7518:	dc5fe06f          	j	62dc <_vfiprintf_r+0x4b0>
    751c:	df5fe06f          	j	6310 <_vfiprintf_r+0x4e4>
    7520:	00168613          	add	a2,a3,1
    7524:	00009317          	auipc	t1,0x9
    7528:	3ec30313          	add	t1,t1,1004 # 10910 <blanks.1>
    752c:	f19fe06f          	j	6444 <_vfiprintf_r+0x618>
    7530:	000f0513          	mv	a0,t5
    7534:	00009f97          	auipc	t6,0x9
    7538:	3ccf8f93          	add	t6,t6,972 # 10900 <zeroes.0>
    753c:	d10ff06f          	j	6a4c <_vfiprintf_r+0xc20>
    7540:	0649a783          	lw	a5,100(s3)
    7544:	0017f793          	and	a5,a5,1
    7548:	00079c63          	bnez	a5,7560 <_vfiprintf_r+0x1734>
    754c:	00c9d783          	lhu	a5,12(s3)
    7550:	2007f793          	and	a5,a5,512
    7554:	00079663          	bnez	a5,7560 <_vfiprintf_r+0x1734>
    7558:	0589a503          	lw	a0,88(s3)
    755c:	aa5fa0ef          	jal	2000 <__retarget_lock_release_recursive>
    7560:	fff00793          	li	a5,-1
    7564:	00f12623          	sw	a5,12(sp)
    7568:	de5fe06f          	j	634c <_vfiprintf_r+0x520>
    756c:	00098713          	mv	a4,s3
    7570:	000c8a93          	mv	s5,s9
    7574:	000d0993          	mv	s3,s10
    7578:	01012c03          	lw	s8,16(sp)
    757c:	01812e03          	lw	t3,24(sp)
    7580:	01c12803          	lw	a6,28(sp)
    7584:	02012883          	lw	a7,32(sp)
    7588:	000d8c93          	mv	s9,s11
    758c:	00070d13          	mv	s10,a4
    7590:	bcdff06f          	j	715c <_vfiprintf_r+0x1330>
    7594:	00cd1783          	lh	a5,12(s10)
    7598:	000d0993          	mv	s3,s10
    759c:	0407e793          	or	a5,a5,64
    75a0:	00fd1623          	sh	a5,12(s10)
    75a4:	d71fe06f          	j	6314 <_vfiprintf_r+0x4e8>
    75a8:	00c99783          	lh	a5,12(s3)
    75ac:	0407e793          	or	a5,a5,64
    75b0:	00f99623          	sh	a5,12(s3)
    75b4:	d61fe06f          	j	6314 <_vfiprintf_r+0x4e8>
    75b8:	000aa703          	lw	a4,0(s5)
    75bc:	004a8a93          	add	s5,s5,4
    75c0:	00075463          	bgez	a4,75c8 <_vfiprintf_r+0x179c>
    75c4:	fff00713          	li	a4,-1
    75c8:	001cc683          	lbu	a3,1(s9)
    75cc:	00058c93          	mv	s9,a1
    75d0:	9ddfe06f          	j	5fac <_vfiprintf_r+0x180>
    75d4:	00c9d783          	lhu	a5,12(s3)
    75d8:	0407e793          	or	a5,a5,64
    75dc:	00f99623          	sh	a5,12(s3)
    75e0:	d1dfe06f          	j	62fc <_vfiprintf_r+0x4d0>

000075e4 <__sbprintf>:
    75e4:	b7010113          	add	sp,sp,-1168
    75e8:	00c59783          	lh	a5,12(a1)
    75ec:	00e5d703          	lhu	a4,14(a1)
    75f0:	48812423          	sw	s0,1160(sp)
    75f4:	00058413          	mv	s0,a1
    75f8:	000105b7          	lui	a1,0x10
    75fc:	ffd58593          	add	a1,a1,-3 # fffd <__fini_array_end+0x55>
    7600:	06442303          	lw	t1,100(s0)
    7604:	01c42883          	lw	a7,28(s0)
    7608:	02442803          	lw	a6,36(s0)
    760c:	01071713          	sll	a4,a4,0x10
    7610:	00b7f7b3          	and	a5,a5,a1
    7614:	00e7e7b3          	or	a5,a5,a4
    7618:	40000593          	li	a1,1024
    761c:	49212023          	sw	s2,1152(sp)
    7620:	00f12a23          	sw	a5,20(sp)
    7624:	00050913          	mv	s2,a0
    7628:	07010793          	add	a5,sp,112
    762c:	06010513          	add	a0,sp,96
    7630:	48112623          	sw	ra,1164(sp)
    7634:	48912223          	sw	s1,1156(sp)
    7638:	47312e23          	sw	s3,1148(sp)
    763c:	00060493          	mv	s1,a2
    7640:	00068993          	mv	s3,a3
    7644:	06612623          	sw	t1,108(sp)
    7648:	03112223          	sw	a7,36(sp)
    764c:	03012623          	sw	a6,44(sp)
    7650:	00f12423          	sw	a5,8(sp)
    7654:	00f12c23          	sw	a5,24(sp)
    7658:	00b12823          	sw	a1,16(sp)
    765c:	00b12e23          	sw	a1,28(sp)
    7660:	02012023          	sw	zero,32(sp)
    7664:	991fa0ef          	jal	1ff4 <__retarget_lock_init_recursive>
    7668:	00048613          	mv	a2,s1
    766c:	00098693          	mv	a3,s3
    7670:	00810593          	add	a1,sp,8
    7674:	00090513          	mv	a0,s2
    7678:	fb4fe0ef          	jal	5e2c <_vfiprintf_r>
    767c:	00050493          	mv	s1,a0
    7680:	04055263          	bgez	a0,76c4 <__sbprintf+0xe0>
    7684:	01415783          	lhu	a5,20(sp)
    7688:	0407f793          	and	a5,a5,64
    768c:	00078863          	beqz	a5,769c <__sbprintf+0xb8>
    7690:	00c45783          	lhu	a5,12(s0)
    7694:	0407e793          	or	a5,a5,64
    7698:	00f41623          	sh	a5,12(s0)
    769c:	06012503          	lw	a0,96(sp)
    76a0:	959fa0ef          	jal	1ff8 <__retarget_lock_close_recursive>
    76a4:	48c12083          	lw	ra,1164(sp)
    76a8:	48812403          	lw	s0,1160(sp)
    76ac:	48012903          	lw	s2,1152(sp)
    76b0:	47c12983          	lw	s3,1148(sp)
    76b4:	00048513          	mv	a0,s1
    76b8:	48412483          	lw	s1,1156(sp)
    76bc:	49010113          	add	sp,sp,1168
    76c0:	00008067          	ret
    76c4:	00810593          	add	a1,sp,8
    76c8:	00090513          	mv	a0,s2
    76cc:	25c000ef          	jal	7928 <_fflush_r>
    76d0:	fa050ae3          	beqz	a0,7684 <__sbprintf+0xa0>
    76d4:	fff00493          	li	s1,-1
    76d8:	fadff06f          	j	7684 <__sbprintf+0xa0>

000076dc <__sflush_r>:
    76dc:	00c59703          	lh	a4,12(a1)
    76e0:	fe010113          	add	sp,sp,-32
    76e4:	00812c23          	sw	s0,24(sp)
    76e8:	01312623          	sw	s3,12(sp)
    76ec:	00112e23          	sw	ra,28(sp)
    76f0:	00877793          	and	a5,a4,8
    76f4:	00058413          	mv	s0,a1
    76f8:	00050993          	mv	s3,a0
    76fc:	12079063          	bnez	a5,781c <__sflush_r+0x140>
    7700:	000017b7          	lui	a5,0x1
    7704:	80078793          	add	a5,a5,-2048 # 800 <conv_cfu.constprop.0+0x3cc>
    7708:	0045a683          	lw	a3,4(a1)
    770c:	00f767b3          	or	a5,a4,a5
    7710:	00f59623          	sh	a5,12(a1)
    7714:	18d05263          	blez	a3,7898 <__sflush_r+0x1bc>
    7718:	02842803          	lw	a6,40(s0)
    771c:	0e080463          	beqz	a6,7804 <__sflush_r+0x128>
    7720:	00912a23          	sw	s1,20(sp)
    7724:	01371693          	sll	a3,a4,0x13
    7728:	0009a483          	lw	s1,0(s3)
    772c:	0009a023          	sw	zero,0(s3)
    7730:	01c42583          	lw	a1,28(s0)
    7734:	1606ce63          	bltz	a3,78b0 <__sflush_r+0x1d4>
    7738:	00000613          	li	a2,0
    773c:	00100693          	li	a3,1
    7740:	00098513          	mv	a0,s3
    7744:	000800e7          	jalr	a6
    7748:	fff00793          	li	a5,-1
    774c:	00050613          	mv	a2,a0
    7750:	1af50463          	beq	a0,a5,78f8 <__sflush_r+0x21c>
    7754:	00c41783          	lh	a5,12(s0)
    7758:	02842803          	lw	a6,40(s0)
    775c:	01c42583          	lw	a1,28(s0)
    7760:	0047f793          	and	a5,a5,4
    7764:	00078e63          	beqz	a5,7780 <__sflush_r+0xa4>
    7768:	00442703          	lw	a4,4(s0)
    776c:	03042783          	lw	a5,48(s0)
    7770:	40e60633          	sub	a2,a2,a4
    7774:	00078663          	beqz	a5,7780 <__sflush_r+0xa4>
    7778:	03c42783          	lw	a5,60(s0)
    777c:	40f60633          	sub	a2,a2,a5
    7780:	00000693          	li	a3,0
    7784:	00098513          	mv	a0,s3
    7788:	000800e7          	jalr	a6
    778c:	fff00793          	li	a5,-1
    7790:	12f51463          	bne	a0,a5,78b8 <__sflush_r+0x1dc>
    7794:	0009a683          	lw	a3,0(s3)
    7798:	01d00793          	li	a5,29
    779c:	00c41703          	lh	a4,12(s0)
    77a0:	16d7ea63          	bltu	a5,a3,7914 <__sflush_r+0x238>
    77a4:	204007b7          	lui	a5,0x20400
    77a8:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    77ac:	00d7d7b3          	srl	a5,a5,a3
    77b0:	0017f793          	and	a5,a5,1
    77b4:	16078063          	beqz	a5,7914 <__sflush_r+0x238>
    77b8:	01042603          	lw	a2,16(s0)
    77bc:	fffff7b7          	lui	a5,0xfffff
    77c0:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    77c4:	00f777b3          	and	a5,a4,a5
    77c8:	00f41623          	sh	a5,12(s0)
    77cc:	00042223          	sw	zero,4(s0)
    77d0:	00c42023          	sw	a2,0(s0)
    77d4:	01371793          	sll	a5,a4,0x13
    77d8:	0007d463          	bgez	a5,77e0 <__sflush_r+0x104>
    77dc:	10068263          	beqz	a3,78e0 <__sflush_r+0x204>
    77e0:	03042583          	lw	a1,48(s0)
    77e4:	0099a023          	sw	s1,0(s3)
    77e8:	10058463          	beqz	a1,78f0 <__sflush_r+0x214>
    77ec:	04040793          	add	a5,s0,64
    77f0:	00f58663          	beq	a1,a5,77fc <__sflush_r+0x120>
    77f4:	00098513          	mv	a0,s3
    77f8:	c5dfa0ef          	jal	2454 <_free_r>
    77fc:	01412483          	lw	s1,20(sp)
    7800:	02042823          	sw	zero,48(s0)
    7804:	00000513          	li	a0,0
    7808:	01c12083          	lw	ra,28(sp)
    780c:	01812403          	lw	s0,24(sp)
    7810:	00c12983          	lw	s3,12(sp)
    7814:	02010113          	add	sp,sp,32
    7818:	00008067          	ret
    781c:	01212823          	sw	s2,16(sp)
    7820:	0105a903          	lw	s2,16(a1)
    7824:	08090263          	beqz	s2,78a8 <__sflush_r+0x1cc>
    7828:	00912a23          	sw	s1,20(sp)
    782c:	0005a483          	lw	s1,0(a1)
    7830:	00377713          	and	a4,a4,3
    7834:	0125a023          	sw	s2,0(a1)
    7838:	412484b3          	sub	s1,s1,s2
    783c:	00000793          	li	a5,0
    7840:	00071463          	bnez	a4,7848 <__sflush_r+0x16c>
    7844:	0145a783          	lw	a5,20(a1)
    7848:	00f42423          	sw	a5,8(s0)
    784c:	00904863          	bgtz	s1,785c <__sflush_r+0x180>
    7850:	0540006f          	j	78a4 <__sflush_r+0x1c8>
    7854:	00a90933          	add	s2,s2,a0
    7858:	04905663          	blez	s1,78a4 <__sflush_r+0x1c8>
    785c:	02442783          	lw	a5,36(s0)
    7860:	01c42583          	lw	a1,28(s0)
    7864:	00048693          	mv	a3,s1
    7868:	00090613          	mv	a2,s2
    786c:	00098513          	mv	a0,s3
    7870:	000780e7          	jalr	a5
    7874:	40a484b3          	sub	s1,s1,a0
    7878:	fca04ee3          	bgtz	a0,7854 <__sflush_r+0x178>
    787c:	00c41703          	lh	a4,12(s0)
    7880:	01012903          	lw	s2,16(sp)
    7884:	04076713          	or	a4,a4,64
    7888:	01412483          	lw	s1,20(sp)
    788c:	00e41623          	sh	a4,12(s0)
    7890:	fff00513          	li	a0,-1
    7894:	f75ff06f          	j	7808 <__sflush_r+0x12c>
    7898:	03c5a683          	lw	a3,60(a1)
    789c:	e6d04ee3          	bgtz	a3,7718 <__sflush_r+0x3c>
    78a0:	f65ff06f          	j	7804 <__sflush_r+0x128>
    78a4:	01412483          	lw	s1,20(sp)
    78a8:	01012903          	lw	s2,16(sp)
    78ac:	f59ff06f          	j	7804 <__sflush_r+0x128>
    78b0:	05042603          	lw	a2,80(s0)
    78b4:	eadff06f          	j	7760 <__sflush_r+0x84>
    78b8:	00c41703          	lh	a4,12(s0)
    78bc:	01042683          	lw	a3,16(s0)
    78c0:	fffff7b7          	lui	a5,0xfffff
    78c4:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    78c8:	00f777b3          	and	a5,a4,a5
    78cc:	00f41623          	sh	a5,12(s0)
    78d0:	00042223          	sw	zero,4(s0)
    78d4:	00d42023          	sw	a3,0(s0)
    78d8:	01371793          	sll	a5,a4,0x13
    78dc:	f007d2e3          	bgez	a5,77e0 <__sflush_r+0x104>
    78e0:	03042583          	lw	a1,48(s0)
    78e4:	04a42823          	sw	a0,80(s0)
    78e8:	0099a023          	sw	s1,0(s3)
    78ec:	f00590e3          	bnez	a1,77ec <__sflush_r+0x110>
    78f0:	01412483          	lw	s1,20(sp)
    78f4:	f11ff06f          	j	7804 <__sflush_r+0x128>
    78f8:	0009a783          	lw	a5,0(s3)
    78fc:	e4078ce3          	beqz	a5,7754 <__sflush_r+0x78>
    7900:	01d00713          	li	a4,29
    7904:	00e78c63          	beq	a5,a4,791c <__sflush_r+0x240>
    7908:	01600713          	li	a4,22
    790c:	00e78863          	beq	a5,a4,791c <__sflush_r+0x240>
    7910:	00c41703          	lh	a4,12(s0)
    7914:	04076713          	or	a4,a4,64
    7918:	f71ff06f          	j	7888 <__sflush_r+0x1ac>
    791c:	0099a023          	sw	s1,0(s3)
    7920:	01412483          	lw	s1,20(sp)
    7924:	ee1ff06f          	j	7804 <__sflush_r+0x128>

00007928 <_fflush_r>:
    7928:	ff010113          	add	sp,sp,-16
    792c:	00812423          	sw	s0,8(sp)
    7930:	00912223          	sw	s1,4(sp)
    7934:	00112623          	sw	ra,12(sp)
    7938:	01212023          	sw	s2,0(sp)
    793c:	00050493          	mv	s1,a0
    7940:	00058413          	mv	s0,a1
    7944:	00050663          	beqz	a0,7950 <_fflush_r+0x28>
    7948:	03452783          	lw	a5,52(a0)
    794c:	0a078a63          	beqz	a5,7a00 <_fflush_r+0xd8>
    7950:	00c41783          	lh	a5,12(s0)
    7954:	00000913          	li	s2,0
    7958:	04078063          	beqz	a5,7998 <_fflush_r+0x70>
    795c:	06442703          	lw	a4,100(s0)
    7960:	00177713          	and	a4,a4,1
    7964:	00071663          	bnez	a4,7970 <_fflush_r+0x48>
    7968:	2007f793          	and	a5,a5,512
    796c:	04078463          	beqz	a5,79b4 <_fflush_r+0x8c>
    7970:	00040593          	mv	a1,s0
    7974:	00048513          	mv	a0,s1
    7978:	d65ff0ef          	jal	76dc <__sflush_r>
    797c:	06442783          	lw	a5,100(s0)
    7980:	00050913          	mv	s2,a0
    7984:	0017f793          	and	a5,a5,1
    7988:	00079863          	bnez	a5,7998 <_fflush_r+0x70>
    798c:	00c45783          	lhu	a5,12(s0)
    7990:	2007f793          	and	a5,a5,512
    7994:	04078463          	beqz	a5,79dc <_fflush_r+0xb4>
    7998:	00c12083          	lw	ra,12(sp)
    799c:	00812403          	lw	s0,8(sp)
    79a0:	00412483          	lw	s1,4(sp)
    79a4:	00090513          	mv	a0,s2
    79a8:	00012903          	lw	s2,0(sp)
    79ac:	01010113          	add	sp,sp,16
    79b0:	00008067          	ret
    79b4:	05842503          	lw	a0,88(s0)
    79b8:	e44fa0ef          	jal	1ffc <__retarget_lock_acquire_recursive>
    79bc:	00040593          	mv	a1,s0
    79c0:	00048513          	mv	a0,s1
    79c4:	d19ff0ef          	jal	76dc <__sflush_r>
    79c8:	06442783          	lw	a5,100(s0)
    79cc:	00050913          	mv	s2,a0
    79d0:	0017f793          	and	a5,a5,1
    79d4:	fc0792e3          	bnez	a5,7998 <_fflush_r+0x70>
    79d8:	fb5ff06f          	j	798c <_fflush_r+0x64>
    79dc:	05842503          	lw	a0,88(s0)
    79e0:	e20fa0ef          	jal	2000 <__retarget_lock_release_recursive>
    79e4:	00c12083          	lw	ra,12(sp)
    79e8:	00812403          	lw	s0,8(sp)
    79ec:	00412483          	lw	s1,4(sp)
    79f0:	00090513          	mv	a0,s2
    79f4:	00012903          	lw	s2,0(sp)
    79f8:	01010113          	add	sp,sp,16
    79fc:	00008067          	ret
    7a00:	224000ef          	jal	7c24 <__sinit>
    7a04:	f4dff06f          	j	7950 <_fflush_r+0x28>

00007a08 <stdio_exit_handler>:
    7a08:	7fff9617          	auipc	a2,0x7fff9
    7a0c:	b2060613          	add	a2,a2,-1248 # 80000528 <__sglue>
    7a10:	00004597          	auipc	a1,0x4
    7a14:	28c58593          	add	a1,a1,652 # bc9c <_fclose_r>
    7a18:	7fff8517          	auipc	a0,0x7fff8
    7a1c:	5e850513          	add	a0,a0,1512 # 80000000 <_impure_data>
    7a20:	7a00006f          	j	81c0 <_fwalk_sglue>

00007a24 <cleanup_stdio>:
    7a24:	00452583          	lw	a1,4(a0)
    7a28:	ff010113          	add	sp,sp,-16
    7a2c:	00812423          	sw	s0,8(sp)
    7a30:	00112623          	sw	ra,12(sp)
    7a34:	80062797          	auipc	a5,0x80062
    7a38:	b4478793          	add	a5,a5,-1212 # 80069578 <__sf>
    7a3c:	00050413          	mv	s0,a0
    7a40:	00f58463          	beq	a1,a5,7a48 <cleanup_stdio+0x24>
    7a44:	258040ef          	jal	bc9c <_fclose_r>
    7a48:	00842583          	lw	a1,8(s0)
    7a4c:	80062797          	auipc	a5,0x80062
    7a50:	b9478793          	add	a5,a5,-1132 # 800695e0 <__sf+0x68>
    7a54:	00f58663          	beq	a1,a5,7a60 <cleanup_stdio+0x3c>
    7a58:	00040513          	mv	a0,s0
    7a5c:	240040ef          	jal	bc9c <_fclose_r>
    7a60:	00c42583          	lw	a1,12(s0)
    7a64:	80062797          	auipc	a5,0x80062
    7a68:	be478793          	add	a5,a5,-1052 # 80069648 <__sf+0xd0>
    7a6c:	00f58c63          	beq	a1,a5,7a84 <cleanup_stdio+0x60>
    7a70:	00040513          	mv	a0,s0
    7a74:	00812403          	lw	s0,8(sp)
    7a78:	00c12083          	lw	ra,12(sp)
    7a7c:	01010113          	add	sp,sp,16
    7a80:	21c0406f          	j	bc9c <_fclose_r>
    7a84:	00c12083          	lw	ra,12(sp)
    7a88:	00812403          	lw	s0,8(sp)
    7a8c:	01010113          	add	sp,sp,16
    7a90:	00008067          	ret

00007a94 <global_stdio_init.part.0>:
    7a94:	fe010113          	add	sp,sp,-32
    7a98:	00000797          	auipc	a5,0x0
    7a9c:	f7078793          	add	a5,a5,-144 # 7a08 <stdio_exit_handler>
    7aa0:	00112e23          	sw	ra,28(sp)
    7aa4:	00812c23          	sw	s0,24(sp)
    7aa8:	00912a23          	sw	s1,20(sp)
    7aac:	80062417          	auipc	s0,0x80062
    7ab0:	acc40413          	add	s0,s0,-1332 # 80069578 <__sf>
    7ab4:	01212823          	sw	s2,16(sp)
    7ab8:	01312623          	sw	s3,12(sp)
    7abc:	01412423          	sw	s4,8(sp)
    7ac0:	00800613          	li	a2,8
    7ac4:	00000593          	li	a1,0
    7ac8:	7fff9717          	auipc	a4,0x7fff9
    7acc:	c6f72623          	sw	a5,-916(a4) # 80000734 <__stdio_exit_handler>
    7ad0:	80062517          	auipc	a0,0x80062
    7ad4:	b0450513          	add	a0,a0,-1276 # 800695d4 <__sf+0x5c>
    7ad8:	00400793          	li	a5,4
    7adc:	00f42623          	sw	a5,12(s0)
    7ae0:	00042023          	sw	zero,0(s0)
    7ae4:	00042223          	sw	zero,4(s0)
    7ae8:	00042423          	sw	zero,8(s0)
    7aec:	06042223          	sw	zero,100(s0)
    7af0:	00042823          	sw	zero,16(s0)
    7af4:	00042a23          	sw	zero,20(s0)
    7af8:	00042c23          	sw	zero,24(s0)
    7afc:	d08fa0ef          	jal	2004 <memset>
    7b00:	00001a17          	auipc	s4,0x1
    7b04:	870a0a13          	add	s4,s4,-1936 # 8370 <__sread>
    7b08:	00001997          	auipc	s3,0x1
    7b0c:	8c498993          	add	s3,s3,-1852 # 83cc <__swrite>
    7b10:	00001917          	auipc	s2,0x1
    7b14:	94490913          	add	s2,s2,-1724 # 8454 <__sseek>
    7b18:	00001497          	auipc	s1,0x1
    7b1c:	9b448493          	add	s1,s1,-1612 # 84cc <__sclose>
    7b20:	80062517          	auipc	a0,0x80062
    7b24:	ab050513          	add	a0,a0,-1360 # 800695d0 <__sf+0x58>
    7b28:	03442023          	sw	s4,32(s0)
    7b2c:	03342223          	sw	s3,36(s0)
    7b30:	03242423          	sw	s2,40(s0)
    7b34:	02942623          	sw	s1,44(s0)
    7b38:	00842e23          	sw	s0,28(s0)
    7b3c:	cb8fa0ef          	jal	1ff4 <__retarget_lock_init_recursive>
    7b40:	000107b7          	lui	a5,0x10
    7b44:	00978793          	add	a5,a5,9 # 10009 <__fini_array_end+0x61>
    7b48:	00800613          	li	a2,8
    7b4c:	00000593          	li	a1,0
    7b50:	80062517          	auipc	a0,0x80062
    7b54:	aec50513          	add	a0,a0,-1300 # 8006963c <__sf+0xc4>
    7b58:	06f42a23          	sw	a5,116(s0)
    7b5c:	06042423          	sw	zero,104(s0)
    7b60:	06042623          	sw	zero,108(s0)
    7b64:	06042823          	sw	zero,112(s0)
    7b68:	0c042623          	sw	zero,204(s0)
    7b6c:	06042c23          	sw	zero,120(s0)
    7b70:	06042e23          	sw	zero,124(s0)
    7b74:	08042023          	sw	zero,128(s0)
    7b78:	c8cfa0ef          	jal	2004 <memset>
    7b7c:	80062797          	auipc	a5,0x80062
    7b80:	a6478793          	add	a5,a5,-1436 # 800695e0 <__sf+0x68>
    7b84:	80062517          	auipc	a0,0x80062
    7b88:	ab450513          	add	a0,a0,-1356 # 80069638 <__sf+0xc0>
    7b8c:	08f42223          	sw	a5,132(s0)
    7b90:	09442423          	sw	s4,136(s0)
    7b94:	09342623          	sw	s3,140(s0)
    7b98:	09242823          	sw	s2,144(s0)
    7b9c:	08942a23          	sw	s1,148(s0)
    7ba0:	c54fa0ef          	jal	1ff4 <__retarget_lock_init_recursive>
    7ba4:	000207b7          	lui	a5,0x20
    7ba8:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    7bac:	00800613          	li	a2,8
    7bb0:	00000593          	li	a1,0
    7bb4:	80062517          	auipc	a0,0x80062
    7bb8:	af050513          	add	a0,a0,-1296 # 800696a4 <__sf+0x12c>
    7bbc:	0cf42e23          	sw	a5,220(s0)
    7bc0:	0c042823          	sw	zero,208(s0)
    7bc4:	0c042a23          	sw	zero,212(s0)
    7bc8:	0c042c23          	sw	zero,216(s0)
    7bcc:	12042a23          	sw	zero,308(s0)
    7bd0:	0e042023          	sw	zero,224(s0)
    7bd4:	0e042223          	sw	zero,228(s0)
    7bd8:	0e042423          	sw	zero,232(s0)
    7bdc:	c28fa0ef          	jal	2004 <memset>
    7be0:	80062797          	auipc	a5,0x80062
    7be4:	a6878793          	add	a5,a5,-1432 # 80069648 <__sf+0xd0>
    7be8:	0f442823          	sw	s4,240(s0)
    7bec:	0f342a23          	sw	s3,244(s0)
    7bf0:	0f242c23          	sw	s2,248(s0)
    7bf4:	0e942e23          	sw	s1,252(s0)
    7bf8:	0ef42623          	sw	a5,236(s0)
    7bfc:	01812403          	lw	s0,24(sp)
    7c00:	01c12083          	lw	ra,28(sp)
    7c04:	01412483          	lw	s1,20(sp)
    7c08:	01012903          	lw	s2,16(sp)
    7c0c:	00c12983          	lw	s3,12(sp)
    7c10:	00812a03          	lw	s4,8(sp)
    7c14:	80062517          	auipc	a0,0x80062
    7c18:	a8c50513          	add	a0,a0,-1396 # 800696a0 <__sf+0x128>
    7c1c:	02010113          	add	sp,sp,32
    7c20:	bd4fa06f          	j	1ff4 <__retarget_lock_init_recursive>

00007c24 <__sinit>:
    7c24:	ff010113          	add	sp,sp,-16
    7c28:	00812423          	sw	s0,8(sp)
    7c2c:	00050413          	mv	s0,a0
    7c30:	7fff9517          	auipc	a0,0x7fff9
    7c34:	af450513          	add	a0,a0,-1292 # 80000724 <__lock___sfp_recursive_mutex>
    7c38:	00112623          	sw	ra,12(sp)
    7c3c:	bc0fa0ef          	jal	1ffc <__retarget_lock_acquire_recursive>
    7c40:	03442783          	lw	a5,52(s0)
    7c44:	00079e63          	bnez	a5,7c60 <__sinit+0x3c>
    7c48:	00000797          	auipc	a5,0x0
    7c4c:	ddc78793          	add	a5,a5,-548 # 7a24 <cleanup_stdio>
    7c50:	02f42a23          	sw	a5,52(s0)
    7c54:	7fff9797          	auipc	a5,0x7fff9
    7c58:	ae07a783          	lw	a5,-1312(a5) # 80000734 <__stdio_exit_handler>
    7c5c:	00078e63          	beqz	a5,7c78 <__sinit+0x54>
    7c60:	00812403          	lw	s0,8(sp)
    7c64:	00c12083          	lw	ra,12(sp)
    7c68:	7fff9517          	auipc	a0,0x7fff9
    7c6c:	abc50513          	add	a0,a0,-1348 # 80000724 <__lock___sfp_recursive_mutex>
    7c70:	01010113          	add	sp,sp,16
    7c74:	b8cfa06f          	j	2000 <__retarget_lock_release_recursive>
    7c78:	e1dff0ef          	jal	7a94 <global_stdio_init.part.0>
    7c7c:	00812403          	lw	s0,8(sp)
    7c80:	00c12083          	lw	ra,12(sp)
    7c84:	7fff9517          	auipc	a0,0x7fff9
    7c88:	aa050513          	add	a0,a0,-1376 # 80000724 <__lock___sfp_recursive_mutex>
    7c8c:	01010113          	add	sp,sp,16
    7c90:	b70fa06f          	j	2000 <__retarget_lock_release_recursive>

00007c94 <__sfp_lock_acquire>:
    7c94:	7fff9517          	auipc	a0,0x7fff9
    7c98:	a9050513          	add	a0,a0,-1392 # 80000724 <__lock___sfp_recursive_mutex>
    7c9c:	b60fa06f          	j	1ffc <__retarget_lock_acquire_recursive>

00007ca0 <__sfp_lock_release>:
    7ca0:	7fff9517          	auipc	a0,0x7fff9
    7ca4:	a8450513          	add	a0,a0,-1404 # 80000724 <__lock___sfp_recursive_mutex>
    7ca8:	b58fa06f          	j	2000 <__retarget_lock_release_recursive>

00007cac <__sfvwrite_r>:
    7cac:	00862783          	lw	a5,8(a2)
    7cb0:	2c078463          	beqz	a5,7f78 <__sfvwrite_r+0x2cc>
    7cb4:	00c59683          	lh	a3,12(a1)
    7cb8:	fd010113          	add	sp,sp,-48
    7cbc:	02812423          	sw	s0,40(sp)
    7cc0:	01412c23          	sw	s4,24(sp)
    7cc4:	01612823          	sw	s6,16(sp)
    7cc8:	02112623          	sw	ra,44(sp)
    7ccc:	0086f793          	and	a5,a3,8
    7cd0:	00060b13          	mv	s6,a2
    7cd4:	00050a13          	mv	s4,a0
    7cd8:	00058413          	mv	s0,a1
    7cdc:	08078e63          	beqz	a5,7d78 <__sfvwrite_r+0xcc>
    7ce0:	0105a783          	lw	a5,16(a1)
    7ce4:	08078a63          	beqz	a5,7d78 <__sfvwrite_r+0xcc>
    7ce8:	02912223          	sw	s1,36(sp)
    7cec:	03212023          	sw	s2,32(sp)
    7cf0:	01312e23          	sw	s3,28(sp)
    7cf4:	01512a23          	sw	s5,20(sp)
    7cf8:	0026f793          	and	a5,a3,2
    7cfc:	000b2483          	lw	s1,0(s6)
    7d00:	0a078463          	beqz	a5,7da8 <__sfvwrite_r+0xfc>
    7d04:	02442783          	lw	a5,36(s0)
    7d08:	01c42583          	lw	a1,28(s0)
    7d0c:	80000ab7          	lui	s5,0x80000
    7d10:	00000993          	li	s3,0
    7d14:	00000913          	li	s2,0
    7d18:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    7d1c:	00098613          	mv	a2,s3
    7d20:	000a0513          	mv	a0,s4
    7d24:	04090263          	beqz	s2,7d68 <__sfvwrite_r+0xbc>
    7d28:	00090693          	mv	a3,s2
    7d2c:	012af463          	bgeu	s5,s2,7d34 <__sfvwrite_r+0x88>
    7d30:	000a8693          	mv	a3,s5
    7d34:	000780e7          	jalr	a5
    7d38:	46a05263          	blez	a0,819c <__sfvwrite_r+0x4f0>
    7d3c:	008b2783          	lw	a5,8(s6)
    7d40:	00a989b3          	add	s3,s3,a0
    7d44:	40a90933          	sub	s2,s2,a0
    7d48:	40a787b3          	sub	a5,a5,a0
    7d4c:	00fb2423          	sw	a5,8(s6)
    7d50:	1a078663          	beqz	a5,7efc <__sfvwrite_r+0x250>
    7d54:	02442783          	lw	a5,36(s0)
    7d58:	01c42583          	lw	a1,28(s0)
    7d5c:	00098613          	mv	a2,s3
    7d60:	000a0513          	mv	a0,s4
    7d64:	fc0912e3          	bnez	s2,7d28 <__sfvwrite_r+0x7c>
    7d68:	0004a983          	lw	s3,0(s1)
    7d6c:	0044a903          	lw	s2,4(s1)
    7d70:	00848493          	add	s1,s1,8
    7d74:	fa9ff06f          	j	7d1c <__sfvwrite_r+0x70>
    7d78:	00040593          	mv	a1,s0
    7d7c:	000a0513          	mv	a0,s4
    7d80:	0e5000ef          	jal	8664 <__swsetup_r>
    7d84:	1c051c63          	bnez	a0,7f5c <__sfvwrite_r+0x2b0>
    7d88:	00c41683          	lh	a3,12(s0)
    7d8c:	02912223          	sw	s1,36(sp)
    7d90:	03212023          	sw	s2,32(sp)
    7d94:	01312e23          	sw	s3,28(sp)
    7d98:	01512a23          	sw	s5,20(sp)
    7d9c:	0026f793          	and	a5,a3,2
    7da0:	000b2483          	lw	s1,0(s6)
    7da4:	f60790e3          	bnez	a5,7d04 <__sfvwrite_r+0x58>
    7da8:	01712623          	sw	s7,12(sp)
    7dac:	01812423          	sw	s8,8(sp)
    7db0:	0016f793          	and	a5,a3,1
    7db4:	1c079663          	bnez	a5,7f80 <__sfvwrite_r+0x2d4>
    7db8:	00042783          	lw	a5,0(s0)
    7dbc:	00842703          	lw	a4,8(s0)
    7dc0:	80000ab7          	lui	s5,0x80000
    7dc4:	01912223          	sw	s9,4(sp)
    7dc8:	00000b93          	li	s7,0
    7dcc:	00000993          	li	s3,0
    7dd0:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7dd4:	00078513          	mv	a0,a5
    7dd8:	00070c13          	mv	s8,a4
    7ddc:	10098263          	beqz	s3,7ee0 <__sfvwrite_r+0x234>
    7de0:	2006f613          	and	a2,a3,512
    7de4:	28060863          	beqz	a2,8074 <__sfvwrite_r+0x3c8>
    7de8:	00070c93          	mv	s9,a4
    7dec:	32e9e863          	bltu	s3,a4,811c <__sfvwrite_r+0x470>
    7df0:	4806f713          	and	a4,a3,1152
    7df4:	08070a63          	beqz	a4,7e88 <__sfvwrite_r+0x1dc>
    7df8:	01442603          	lw	a2,20(s0)
    7dfc:	01042583          	lw	a1,16(s0)
    7e00:	00161713          	sll	a4,a2,0x1
    7e04:	00c70733          	add	a4,a4,a2
    7e08:	40b78933          	sub	s2,a5,a1
    7e0c:	01f75c13          	srl	s8,a4,0x1f
    7e10:	00ec0c33          	add	s8,s8,a4
    7e14:	00190793          	add	a5,s2,1
    7e18:	401c5c13          	sra	s8,s8,0x1
    7e1c:	013787b3          	add	a5,a5,s3
    7e20:	000c0613          	mv	a2,s8
    7e24:	00fc7663          	bgeu	s8,a5,7e30 <__sfvwrite_r+0x184>
    7e28:	00078c13          	mv	s8,a5
    7e2c:	00078613          	mv	a2,a5
    7e30:	4006f693          	and	a3,a3,1024
    7e34:	32068063          	beqz	a3,8154 <__sfvwrite_r+0x4a8>
    7e38:	00060593          	mv	a1,a2
    7e3c:	000a0513          	mv	a0,s4
    7e40:	921fa0ef          	jal	2760 <_malloc_r>
    7e44:	00050c93          	mv	s9,a0
    7e48:	34050e63          	beqz	a0,81a4 <__sfvwrite_r+0x4f8>
    7e4c:	01042583          	lw	a1,16(s0)
    7e50:	00090613          	mv	a2,s2
    7e54:	a8cfa0ef          	jal	20e0 <memcpy>
    7e58:	00c45783          	lhu	a5,12(s0)
    7e5c:	b7f7f793          	and	a5,a5,-1153
    7e60:	0807e793          	or	a5,a5,128
    7e64:	00f41623          	sh	a5,12(s0)
    7e68:	012c8533          	add	a0,s9,s2
    7e6c:	412c07b3          	sub	a5,s8,s2
    7e70:	01942823          	sw	s9,16(s0)
    7e74:	01842a23          	sw	s8,20(s0)
    7e78:	00a42023          	sw	a0,0(s0)
    7e7c:	00098c13          	mv	s8,s3
    7e80:	00f42423          	sw	a5,8(s0)
    7e84:	00098c93          	mv	s9,s3
    7e88:	000c8613          	mv	a2,s9
    7e8c:	000b8593          	mv	a1,s7
    7e90:	6a9000ef          	jal	8d38 <memmove>
    7e94:	00842703          	lw	a4,8(s0)
    7e98:	00042783          	lw	a5,0(s0)
    7e9c:	00098913          	mv	s2,s3
    7ea0:	41870733          	sub	a4,a4,s8
    7ea4:	019787b3          	add	a5,a5,s9
    7ea8:	00e42423          	sw	a4,8(s0)
    7eac:	00f42023          	sw	a5,0(s0)
    7eb0:	00000993          	li	s3,0
    7eb4:	008b2783          	lw	a5,8(s6)
    7eb8:	012b8bb3          	add	s7,s7,s2
    7ebc:	412787b3          	sub	a5,a5,s2
    7ec0:	00fb2423          	sw	a5,8(s6)
    7ec4:	02078663          	beqz	a5,7ef0 <__sfvwrite_r+0x244>
    7ec8:	00042783          	lw	a5,0(s0)
    7ecc:	00842703          	lw	a4,8(s0)
    7ed0:	00c41683          	lh	a3,12(s0)
    7ed4:	00078513          	mv	a0,a5
    7ed8:	00070c13          	mv	s8,a4
    7edc:	f00992e3          	bnez	s3,7de0 <__sfvwrite_r+0x134>
    7ee0:	0004ab83          	lw	s7,0(s1)
    7ee4:	0044a983          	lw	s3,4(s1)
    7ee8:	00848493          	add	s1,s1,8
    7eec:	ee9ff06f          	j	7dd4 <__sfvwrite_r+0x128>
    7ef0:	00c12b83          	lw	s7,12(sp)
    7ef4:	00812c03          	lw	s8,8(sp)
    7ef8:	00412c83          	lw	s9,4(sp)
    7efc:	02c12083          	lw	ra,44(sp)
    7f00:	02812403          	lw	s0,40(sp)
    7f04:	02412483          	lw	s1,36(sp)
    7f08:	02012903          	lw	s2,32(sp)
    7f0c:	01c12983          	lw	s3,28(sp)
    7f10:	01412a83          	lw	s5,20(sp)
    7f14:	01812a03          	lw	s4,24(sp)
    7f18:	01012b03          	lw	s6,16(sp)
    7f1c:	00000513          	li	a0,0
    7f20:	03010113          	add	sp,sp,48
    7f24:	00008067          	ret
    7f28:	00040593          	mv	a1,s0
    7f2c:	000a0513          	mv	a0,s4
    7f30:	9f9ff0ef          	jal	7928 <_fflush_r>
    7f34:	0a050e63          	beqz	a0,7ff0 <__sfvwrite_r+0x344>
    7f38:	00c41783          	lh	a5,12(s0)
    7f3c:	00c12b83          	lw	s7,12(sp)
    7f40:	00812c03          	lw	s8,8(sp)
    7f44:	02412483          	lw	s1,36(sp)
    7f48:	02012903          	lw	s2,32(sp)
    7f4c:	01c12983          	lw	s3,28(sp)
    7f50:	01412a83          	lw	s5,20(sp)
    7f54:	0407e793          	or	a5,a5,64
    7f58:	00f41623          	sh	a5,12(s0)
    7f5c:	02c12083          	lw	ra,44(sp)
    7f60:	02812403          	lw	s0,40(sp)
    7f64:	01812a03          	lw	s4,24(sp)
    7f68:	01012b03          	lw	s6,16(sp)
    7f6c:	fff00513          	li	a0,-1
    7f70:	03010113          	add	sp,sp,48
    7f74:	00008067          	ret
    7f78:	00000513          	li	a0,0
    7f7c:	00008067          	ret
    7f80:	00000a93          	li	s5,0
    7f84:	00000513          	li	a0,0
    7f88:	00000c13          	li	s8,0
    7f8c:	00000993          	li	s3,0
    7f90:	08098263          	beqz	s3,8014 <__sfvwrite_r+0x368>
    7f94:	08050a63          	beqz	a0,8028 <__sfvwrite_r+0x37c>
    7f98:	000a8793          	mv	a5,s5
    7f9c:	00098b93          	mv	s7,s3
    7fa0:	0137f463          	bgeu	a5,s3,7fa8 <__sfvwrite_r+0x2fc>
    7fa4:	00078b93          	mv	s7,a5
    7fa8:	00042503          	lw	a0,0(s0)
    7fac:	01042783          	lw	a5,16(s0)
    7fb0:	00842903          	lw	s2,8(s0)
    7fb4:	01442683          	lw	a3,20(s0)
    7fb8:	00a7f663          	bgeu	a5,a0,7fc4 <__sfvwrite_r+0x318>
    7fbc:	00d90933          	add	s2,s2,a3
    7fc0:	09794463          	blt	s2,s7,8048 <__sfvwrite_r+0x39c>
    7fc4:	16dbc263          	blt	s7,a3,8128 <__sfvwrite_r+0x47c>
    7fc8:	02442783          	lw	a5,36(s0)
    7fcc:	01c42583          	lw	a1,28(s0)
    7fd0:	000c0613          	mv	a2,s8
    7fd4:	000a0513          	mv	a0,s4
    7fd8:	000780e7          	jalr	a5
    7fdc:	00050913          	mv	s2,a0
    7fe0:	f4a05ce3          	blez	a0,7f38 <__sfvwrite_r+0x28c>
    7fe4:	412a8ab3          	sub	s5,s5,s2
    7fe8:	00100513          	li	a0,1
    7fec:	f20a8ee3          	beqz	s5,7f28 <__sfvwrite_r+0x27c>
    7ff0:	008b2783          	lw	a5,8(s6)
    7ff4:	012c0c33          	add	s8,s8,s2
    7ff8:	412989b3          	sub	s3,s3,s2
    7ffc:	412787b3          	sub	a5,a5,s2
    8000:	00fb2423          	sw	a5,8(s6)
    8004:	f80796e3          	bnez	a5,7f90 <__sfvwrite_r+0x2e4>
    8008:	00c12b83          	lw	s7,12(sp)
    800c:	00812c03          	lw	s8,8(sp)
    8010:	eedff06f          	j	7efc <__sfvwrite_r+0x250>
    8014:	0044a983          	lw	s3,4(s1)
    8018:	00048793          	mv	a5,s1
    801c:	00848493          	add	s1,s1,8
    8020:	fe098ae3          	beqz	s3,8014 <__sfvwrite_r+0x368>
    8024:	0007ac03          	lw	s8,0(a5)
    8028:	00098613          	mv	a2,s3
    802c:	00a00593          	li	a1,10
    8030:	000c0513          	mv	a0,s8
    8034:	1a1000ef          	jal	89d4 <memchr>
    8038:	14050c63          	beqz	a0,8190 <__sfvwrite_r+0x4e4>
    803c:	00150513          	add	a0,a0,1
    8040:	41850ab3          	sub	s5,a0,s8
    8044:	f55ff06f          	j	7f98 <__sfvwrite_r+0x2ec>
    8048:	000c0593          	mv	a1,s8
    804c:	00090613          	mv	a2,s2
    8050:	4e9000ef          	jal	8d38 <memmove>
    8054:	00042783          	lw	a5,0(s0)
    8058:	00040593          	mv	a1,s0
    805c:	000a0513          	mv	a0,s4
    8060:	012787b3          	add	a5,a5,s2
    8064:	00f42023          	sw	a5,0(s0)
    8068:	8c1ff0ef          	jal	7928 <_fflush_r>
    806c:	f6050ce3          	beqz	a0,7fe4 <__sfvwrite_r+0x338>
    8070:	ec9ff06f          	j	7f38 <__sfvwrite_r+0x28c>
    8074:	01042683          	lw	a3,16(s0)
    8078:	04f6e463          	bltu	a3,a5,80c0 <__sfvwrite_r+0x414>
    807c:	01442583          	lw	a1,20(s0)
    8080:	04b9e063          	bltu	s3,a1,80c0 <__sfvwrite_r+0x414>
    8084:	00098913          	mv	s2,s3
    8088:	013af463          	bgeu	s5,s3,8090 <__sfvwrite_r+0x3e4>
    808c:	000a8913          	mv	s2,s5
    8090:	00090513          	mv	a0,s2
    8094:	65d070ef          	jal	fef0 <__modsi3>
    8098:	02442783          	lw	a5,36(s0)
    809c:	01c42583          	lw	a1,28(s0)
    80a0:	40a906b3          	sub	a3,s2,a0
    80a4:	000b8613          	mv	a2,s7
    80a8:	000a0513          	mv	a0,s4
    80ac:	000780e7          	jalr	a5
    80b0:	00050913          	mv	s2,a0
    80b4:	04a05a63          	blez	a0,8108 <__sfvwrite_r+0x45c>
    80b8:	412989b3          	sub	s3,s3,s2
    80bc:	df9ff06f          	j	7eb4 <__sfvwrite_r+0x208>
    80c0:	00070913          	mv	s2,a4
    80c4:	00e9f463          	bgeu	s3,a4,80cc <__sfvwrite_r+0x420>
    80c8:	00098913          	mv	s2,s3
    80cc:	00078513          	mv	a0,a5
    80d0:	00090613          	mv	a2,s2
    80d4:	000b8593          	mv	a1,s7
    80d8:	461000ef          	jal	8d38 <memmove>
    80dc:	00842703          	lw	a4,8(s0)
    80e0:	00042783          	lw	a5,0(s0)
    80e4:	41270733          	sub	a4,a4,s2
    80e8:	012787b3          	add	a5,a5,s2
    80ec:	00e42423          	sw	a4,8(s0)
    80f0:	00f42023          	sw	a5,0(s0)
    80f4:	fc0712e3          	bnez	a4,80b8 <__sfvwrite_r+0x40c>
    80f8:	00040593          	mv	a1,s0
    80fc:	000a0513          	mv	a0,s4
    8100:	829ff0ef          	jal	7928 <_fflush_r>
    8104:	fa050ae3          	beqz	a0,80b8 <__sfvwrite_r+0x40c>
    8108:	00c41783          	lh	a5,12(s0)
    810c:	00c12b83          	lw	s7,12(sp)
    8110:	00812c03          	lw	s8,8(sp)
    8114:	00412c83          	lw	s9,4(sp)
    8118:	e2dff06f          	j	7f44 <__sfvwrite_r+0x298>
    811c:	00098c13          	mv	s8,s3
    8120:	00098c93          	mv	s9,s3
    8124:	d65ff06f          	j	7e88 <__sfvwrite_r+0x1dc>
    8128:	000b8613          	mv	a2,s7
    812c:	000c0593          	mv	a1,s8
    8130:	409000ef          	jal	8d38 <memmove>
    8134:	00842703          	lw	a4,8(s0)
    8138:	00042783          	lw	a5,0(s0)
    813c:	000b8913          	mv	s2,s7
    8140:	41770733          	sub	a4,a4,s7
    8144:	017787b3          	add	a5,a5,s7
    8148:	00e42423          	sw	a4,8(s0)
    814c:	00f42023          	sw	a5,0(s0)
    8150:	e95ff06f          	j	7fe4 <__sfvwrite_r+0x338>
    8154:	000a0513          	mv	a0,s4
    8158:	508030ef          	jal	b660 <_realloc_r>
    815c:	00050c93          	mv	s9,a0
    8160:	d00514e3          	bnez	a0,7e68 <__sfvwrite_r+0x1bc>
    8164:	01042583          	lw	a1,16(s0)
    8168:	000a0513          	mv	a0,s4
    816c:	ae8fa0ef          	jal	2454 <_free_r>
    8170:	00c41783          	lh	a5,12(s0)
    8174:	00c00713          	li	a4,12
    8178:	00c12b83          	lw	s7,12(sp)
    817c:	00812c03          	lw	s8,8(sp)
    8180:	00412c83          	lw	s9,4(sp)
    8184:	00ea2023          	sw	a4,0(s4)
    8188:	f7f7f793          	and	a5,a5,-129
    818c:	db9ff06f          	j	7f44 <__sfvwrite_r+0x298>
    8190:	00198793          	add	a5,s3,1
    8194:	00078a93          	mv	s5,a5
    8198:	e05ff06f          	j	7f9c <__sfvwrite_r+0x2f0>
    819c:	00c41783          	lh	a5,12(s0)
    81a0:	da5ff06f          	j	7f44 <__sfvwrite_r+0x298>
    81a4:	00c00713          	li	a4,12
    81a8:	00c41783          	lh	a5,12(s0)
    81ac:	00c12b83          	lw	s7,12(sp)
    81b0:	00812c03          	lw	s8,8(sp)
    81b4:	00412c83          	lw	s9,4(sp)
    81b8:	00ea2023          	sw	a4,0(s4)
    81bc:	d89ff06f          	j	7f44 <__sfvwrite_r+0x298>

000081c0 <_fwalk_sglue>:
    81c0:	fd010113          	add	sp,sp,-48
    81c4:	03212023          	sw	s2,32(sp)
    81c8:	01312e23          	sw	s3,28(sp)
    81cc:	01412c23          	sw	s4,24(sp)
    81d0:	01512a23          	sw	s5,20(sp)
    81d4:	01612823          	sw	s6,16(sp)
    81d8:	01712623          	sw	s7,12(sp)
    81dc:	02112623          	sw	ra,44(sp)
    81e0:	02812423          	sw	s0,40(sp)
    81e4:	02912223          	sw	s1,36(sp)
    81e8:	00050b13          	mv	s6,a0
    81ec:	00058b93          	mv	s7,a1
    81f0:	00060a93          	mv	s5,a2
    81f4:	00000a13          	li	s4,0
    81f8:	00100993          	li	s3,1
    81fc:	fff00913          	li	s2,-1
    8200:	004aa483          	lw	s1,4(s5)
    8204:	008aa403          	lw	s0,8(s5)
    8208:	fff48493          	add	s1,s1,-1
    820c:	0204c863          	bltz	s1,823c <_fwalk_sglue+0x7c>
    8210:	00c45783          	lhu	a5,12(s0)
    8214:	00f9fe63          	bgeu	s3,a5,8230 <_fwalk_sglue+0x70>
    8218:	00e41783          	lh	a5,14(s0)
    821c:	00040593          	mv	a1,s0
    8220:	000b0513          	mv	a0,s6
    8224:	01278663          	beq	a5,s2,8230 <_fwalk_sglue+0x70>
    8228:	000b80e7          	jalr	s7
    822c:	00aa6a33          	or	s4,s4,a0
    8230:	fff48493          	add	s1,s1,-1
    8234:	06840413          	add	s0,s0,104
    8238:	fd249ce3          	bne	s1,s2,8210 <_fwalk_sglue+0x50>
    823c:	000aaa83          	lw	s5,0(s5)
    8240:	fc0a90e3          	bnez	s5,8200 <_fwalk_sglue+0x40>
    8244:	02c12083          	lw	ra,44(sp)
    8248:	02812403          	lw	s0,40(sp)
    824c:	02412483          	lw	s1,36(sp)
    8250:	02012903          	lw	s2,32(sp)
    8254:	01c12983          	lw	s3,28(sp)
    8258:	01412a83          	lw	s5,20(sp)
    825c:	01012b03          	lw	s6,16(sp)
    8260:	00c12b83          	lw	s7,12(sp)
    8264:	000a0513          	mv	a0,s4
    8268:	01812a03          	lw	s4,24(sp)
    826c:	03010113          	add	sp,sp,48
    8270:	00008067          	ret

00008274 <_putc_r>:
    8274:	fe010113          	add	sp,sp,-32
    8278:	00812c23          	sw	s0,24(sp)
    827c:	01212a23          	sw	s2,20(sp)
    8280:	00112e23          	sw	ra,28(sp)
    8284:	00050913          	mv	s2,a0
    8288:	00060413          	mv	s0,a2
    828c:	00050663          	beqz	a0,8298 <_putc_r+0x24>
    8290:	03452783          	lw	a5,52(a0)
    8294:	0c078663          	beqz	a5,8360 <_putc_r+0xec>
    8298:	06442783          	lw	a5,100(s0)
    829c:	0017f793          	and	a5,a5,1
    82a0:	00079863          	bnez	a5,82b0 <_putc_r+0x3c>
    82a4:	00c45783          	lhu	a5,12(s0)
    82a8:	2007f793          	and	a5,a5,512
    82ac:	08078063          	beqz	a5,832c <_putc_r+0xb8>
    82b0:	00842783          	lw	a5,8(s0)
    82b4:	fff78793          	add	a5,a5,-1
    82b8:	00f42423          	sw	a5,8(s0)
    82bc:	0007dc63          	bgez	a5,82d4 <_putc_r+0x60>
    82c0:	01842703          	lw	a4,24(s0)
    82c4:	04e7ca63          	blt	a5,a4,8318 <_putc_r+0xa4>
    82c8:	0ff5f793          	zext.b	a5,a1
    82cc:	00a00713          	li	a4,10
    82d0:	04e78463          	beq	a5,a4,8318 <_putc_r+0xa4>
    82d4:	00042783          	lw	a5,0(s0)
    82d8:	0ff5f913          	zext.b	s2,a1
    82dc:	00178713          	add	a4,a5,1
    82e0:	00e42023          	sw	a4,0(s0)
    82e4:	00b78023          	sb	a1,0(a5)
    82e8:	06442783          	lw	a5,100(s0)
    82ec:	0017f793          	and	a5,a5,1
    82f0:	00079863          	bnez	a5,8300 <_putc_r+0x8c>
    82f4:	00c45783          	lhu	a5,12(s0)
    82f8:	2007f793          	and	a5,a5,512
    82fc:	04078263          	beqz	a5,8340 <_putc_r+0xcc>
    8300:	01c12083          	lw	ra,28(sp)
    8304:	01812403          	lw	s0,24(sp)
    8308:	00090513          	mv	a0,s2
    830c:	01412903          	lw	s2,20(sp)
    8310:	02010113          	add	sp,sp,32
    8314:	00008067          	ret
    8318:	00090513          	mv	a0,s2
    831c:	00040613          	mv	a2,s0
    8320:	1b4000ef          	jal	84d4 <__swbuf_r>
    8324:	00050913          	mv	s2,a0
    8328:	fc1ff06f          	j	82e8 <_putc_r+0x74>
    832c:	05842503          	lw	a0,88(s0)
    8330:	00b12623          	sw	a1,12(sp)
    8334:	cc9f90ef          	jal	1ffc <__retarget_lock_acquire_recursive>
    8338:	00c12583          	lw	a1,12(sp)
    833c:	f75ff06f          	j	82b0 <_putc_r+0x3c>
    8340:	05842503          	lw	a0,88(s0)
    8344:	cbdf90ef          	jal	2000 <__retarget_lock_release_recursive>
    8348:	01c12083          	lw	ra,28(sp)
    834c:	01812403          	lw	s0,24(sp)
    8350:	00090513          	mv	a0,s2
    8354:	01412903          	lw	s2,20(sp)
    8358:	02010113          	add	sp,sp,32
    835c:	00008067          	ret
    8360:	00b12623          	sw	a1,12(sp)
    8364:	8c1ff0ef          	jal	7c24 <__sinit>
    8368:	00c12583          	lw	a1,12(sp)
    836c:	f2dff06f          	j	8298 <_putc_r+0x24>

00008370 <__sread>:
    8370:	ff010113          	add	sp,sp,-16
    8374:	00812423          	sw	s0,8(sp)
    8378:	00058413          	mv	s0,a1
    837c:	00e59583          	lh	a1,14(a1)
    8380:	00112623          	sw	ra,12(sp)
    8384:	095000ef          	jal	8c18 <_read_r>
    8388:	02054063          	bltz	a0,83a8 <__sread+0x38>
    838c:	05042783          	lw	a5,80(s0)
    8390:	00c12083          	lw	ra,12(sp)
    8394:	00a787b3          	add	a5,a5,a0
    8398:	04f42823          	sw	a5,80(s0)
    839c:	00812403          	lw	s0,8(sp)
    83a0:	01010113          	add	sp,sp,16
    83a4:	00008067          	ret
    83a8:	00c45783          	lhu	a5,12(s0)
    83ac:	fffff737          	lui	a4,0xfffff
    83b0:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    83b4:	00e7f7b3          	and	a5,a5,a4
    83b8:	00c12083          	lw	ra,12(sp)
    83bc:	00f41623          	sh	a5,12(s0)
    83c0:	00812403          	lw	s0,8(sp)
    83c4:	01010113          	add	sp,sp,16
    83c8:	00008067          	ret

000083cc <__swrite>:
    83cc:	00c59783          	lh	a5,12(a1)
    83d0:	fe010113          	add	sp,sp,-32
    83d4:	00812c23          	sw	s0,24(sp)
    83d8:	00912a23          	sw	s1,20(sp)
    83dc:	01212823          	sw	s2,16(sp)
    83e0:	01312623          	sw	s3,12(sp)
    83e4:	00112e23          	sw	ra,28(sp)
    83e8:	1007f713          	and	a4,a5,256
    83ec:	00058413          	mv	s0,a1
    83f0:	00050493          	mv	s1,a0
    83f4:	00060913          	mv	s2,a2
    83f8:	00068993          	mv	s3,a3
    83fc:	04071063          	bnez	a4,843c <__swrite+0x70>
    8400:	fffff737          	lui	a4,0xfffff
    8404:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    8408:	00e7f7b3          	and	a5,a5,a4
    840c:	00e41583          	lh	a1,14(s0)
    8410:	00f41623          	sh	a5,12(s0)
    8414:	01812403          	lw	s0,24(sp)
    8418:	01c12083          	lw	ra,28(sp)
    841c:	00098693          	mv	a3,s3
    8420:	00090613          	mv	a2,s2
    8424:	00c12983          	lw	s3,12(sp)
    8428:	01012903          	lw	s2,16(sp)
    842c:	00048513          	mv	a0,s1
    8430:	01412483          	lw	s1,20(sp)
    8434:	02010113          	add	sp,sp,32
    8438:	09d0006f          	j	8cd4 <_write_r>
    843c:	00e59583          	lh	a1,14(a1)
    8440:	00200693          	li	a3,2
    8444:	00000613          	li	a2,0
    8448:	76c000ef          	jal	8bb4 <_lseek_r>
    844c:	00c41783          	lh	a5,12(s0)
    8450:	fb1ff06f          	j	8400 <__swrite+0x34>

00008454 <__sseek>:
    8454:	ff010113          	add	sp,sp,-16
    8458:	00812423          	sw	s0,8(sp)
    845c:	00058413          	mv	s0,a1
    8460:	00e59583          	lh	a1,14(a1)
    8464:	00112623          	sw	ra,12(sp)
    8468:	74c000ef          	jal	8bb4 <_lseek_r>
    846c:	fff00793          	li	a5,-1
    8470:	02f50863          	beq	a0,a5,84a0 <__sseek+0x4c>
    8474:	00c45783          	lhu	a5,12(s0)
    8478:	00001737          	lui	a4,0x1
    847c:	00c12083          	lw	ra,12(sp)
    8480:	00e7e7b3          	or	a5,a5,a4
    8484:	01079793          	sll	a5,a5,0x10
    8488:	4107d793          	sra	a5,a5,0x10
    848c:	04a42823          	sw	a0,80(s0)
    8490:	00f41623          	sh	a5,12(s0)
    8494:	00812403          	lw	s0,8(sp)
    8498:	01010113          	add	sp,sp,16
    849c:	00008067          	ret
    84a0:	00c45783          	lhu	a5,12(s0)
    84a4:	fffff737          	lui	a4,0xfffff
    84a8:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    84ac:	00e7f7b3          	and	a5,a5,a4
    84b0:	01079793          	sll	a5,a5,0x10
    84b4:	4107d793          	sra	a5,a5,0x10
    84b8:	00c12083          	lw	ra,12(sp)
    84bc:	00f41623          	sh	a5,12(s0)
    84c0:	00812403          	lw	s0,8(sp)
    84c4:	01010113          	add	sp,sp,16
    84c8:	00008067          	ret

000084cc <__sclose>:
    84cc:	00e59583          	lh	a1,14(a1)
    84d0:	68c0006f          	j	8b5c <_close_r>

000084d4 <__swbuf_r>:
    84d4:	fe010113          	add	sp,sp,-32
    84d8:	00812c23          	sw	s0,24(sp)
    84dc:	00912a23          	sw	s1,20(sp)
    84e0:	01212823          	sw	s2,16(sp)
    84e4:	00112e23          	sw	ra,28(sp)
    84e8:	00050913          	mv	s2,a0
    84ec:	00058493          	mv	s1,a1
    84f0:	00060413          	mv	s0,a2
    84f4:	00050663          	beqz	a0,8500 <__swbuf_r+0x2c>
    84f8:	03452783          	lw	a5,52(a0)
    84fc:	16078063          	beqz	a5,865c <__swbuf_r+0x188>
    8500:	01842783          	lw	a5,24(s0)
    8504:	00c41703          	lh	a4,12(s0)
    8508:	00f42423          	sw	a5,8(s0)
    850c:	00877793          	and	a5,a4,8
    8510:	08078063          	beqz	a5,8590 <__swbuf_r+0xbc>
    8514:	01042783          	lw	a5,16(s0)
    8518:	06078c63          	beqz	a5,8590 <__swbuf_r+0xbc>
    851c:	01312623          	sw	s3,12(sp)
    8520:	01271693          	sll	a3,a4,0x12
    8524:	0ff4f993          	zext.b	s3,s1
    8528:	0ff4f493          	zext.b	s1,s1
    852c:	0806d863          	bgez	a3,85bc <__swbuf_r+0xe8>
    8530:	00042703          	lw	a4,0(s0)
    8534:	01442683          	lw	a3,20(s0)
    8538:	40f707b3          	sub	a5,a4,a5
    853c:	0ad7d863          	bge	a5,a3,85ec <__swbuf_r+0x118>
    8540:	00842683          	lw	a3,8(s0)
    8544:	00170613          	add	a2,a4,1
    8548:	00c42023          	sw	a2,0(s0)
    854c:	fff68693          	add	a3,a3,-1
    8550:	00d42423          	sw	a3,8(s0)
    8554:	01370023          	sb	s3,0(a4)
    8558:	01442703          	lw	a4,20(s0)
    855c:	00178793          	add	a5,a5,1
    8560:	0cf70263          	beq	a4,a5,8624 <__swbuf_r+0x150>
    8564:	00c45783          	lhu	a5,12(s0)
    8568:	0017f793          	and	a5,a5,1
    856c:	0c079a63          	bnez	a5,8640 <__swbuf_r+0x16c>
    8570:	00c12983          	lw	s3,12(sp)
    8574:	01c12083          	lw	ra,28(sp)
    8578:	01812403          	lw	s0,24(sp)
    857c:	01012903          	lw	s2,16(sp)
    8580:	00048513          	mv	a0,s1
    8584:	01412483          	lw	s1,20(sp)
    8588:	02010113          	add	sp,sp,32
    858c:	00008067          	ret
    8590:	00040593          	mv	a1,s0
    8594:	00090513          	mv	a0,s2
    8598:	0cc000ef          	jal	8664 <__swsetup_r>
    859c:	08051e63          	bnez	a0,8638 <__swbuf_r+0x164>
    85a0:	00c41703          	lh	a4,12(s0)
    85a4:	01312623          	sw	s3,12(sp)
    85a8:	01042783          	lw	a5,16(s0)
    85ac:	01271693          	sll	a3,a4,0x12
    85b0:	0ff4f993          	zext.b	s3,s1
    85b4:	0ff4f493          	zext.b	s1,s1
    85b8:	f606cce3          	bltz	a3,8530 <__swbuf_r+0x5c>
    85bc:	06442683          	lw	a3,100(s0)
    85c0:	ffffe637          	lui	a2,0xffffe
    85c4:	000025b7          	lui	a1,0x2
    85c8:	00b76733          	or	a4,a4,a1
    85cc:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    85d0:	00c6f6b3          	and	a3,a3,a2
    85d4:	00e41623          	sh	a4,12(s0)
    85d8:	00042703          	lw	a4,0(s0)
    85dc:	06d42223          	sw	a3,100(s0)
    85e0:	01442683          	lw	a3,20(s0)
    85e4:	40f707b3          	sub	a5,a4,a5
    85e8:	f4d7cce3          	blt	a5,a3,8540 <__swbuf_r+0x6c>
    85ec:	00040593          	mv	a1,s0
    85f0:	00090513          	mv	a0,s2
    85f4:	b34ff0ef          	jal	7928 <_fflush_r>
    85f8:	02051e63          	bnez	a0,8634 <__swbuf_r+0x160>
    85fc:	00042703          	lw	a4,0(s0)
    8600:	00842683          	lw	a3,8(s0)
    8604:	00100793          	li	a5,1
    8608:	00170613          	add	a2,a4,1
    860c:	fff68693          	add	a3,a3,-1
    8610:	00c42023          	sw	a2,0(s0)
    8614:	00d42423          	sw	a3,8(s0)
    8618:	01370023          	sb	s3,0(a4)
    861c:	01442703          	lw	a4,20(s0)
    8620:	f4f712e3          	bne	a4,a5,8564 <__swbuf_r+0x90>
    8624:	00040593          	mv	a1,s0
    8628:	00090513          	mv	a0,s2
    862c:	afcff0ef          	jal	7928 <_fflush_r>
    8630:	f40500e3          	beqz	a0,8570 <__swbuf_r+0x9c>
    8634:	00c12983          	lw	s3,12(sp)
    8638:	fff00493          	li	s1,-1
    863c:	f39ff06f          	j	8574 <__swbuf_r+0xa0>
    8640:	00a00793          	li	a5,10
    8644:	f2f496e3          	bne	s1,a5,8570 <__swbuf_r+0x9c>
    8648:	00040593          	mv	a1,s0
    864c:	00090513          	mv	a0,s2
    8650:	ad8ff0ef          	jal	7928 <_fflush_r>
    8654:	f0050ee3          	beqz	a0,8570 <__swbuf_r+0x9c>
    8658:	fddff06f          	j	8634 <__swbuf_r+0x160>
    865c:	dc8ff0ef          	jal	7c24 <__sinit>
    8660:	ea1ff06f          	j	8500 <__swbuf_r+0x2c>

00008664 <__swsetup_r>:
    8664:	ff010113          	add	sp,sp,-16
    8668:	00812423          	sw	s0,8(sp)
    866c:	00912223          	sw	s1,4(sp)
    8670:	00112623          	sw	ra,12(sp)
    8674:	7fff8797          	auipc	a5,0x7fff8
    8678:	0947a783          	lw	a5,148(a5) # 80000708 <_impure_ptr>
    867c:	00050493          	mv	s1,a0
    8680:	00058413          	mv	s0,a1
    8684:	00078663          	beqz	a5,8690 <__swsetup_r+0x2c>
    8688:	0347a703          	lw	a4,52(a5)
    868c:	0e070c63          	beqz	a4,8784 <__swsetup_r+0x120>
    8690:	00c41783          	lh	a5,12(s0)
    8694:	0087f713          	and	a4,a5,8
    8698:	06070a63          	beqz	a4,870c <__swsetup_r+0xa8>
    869c:	01042703          	lw	a4,16(s0)
    86a0:	08070663          	beqz	a4,872c <__swsetup_r+0xc8>
    86a4:	0017f693          	and	a3,a5,1
    86a8:	02068863          	beqz	a3,86d8 <__swsetup_r+0x74>
    86ac:	01442683          	lw	a3,20(s0)
    86b0:	00042423          	sw	zero,8(s0)
    86b4:	00000513          	li	a0,0
    86b8:	40d006b3          	neg	a3,a3
    86bc:	00d42c23          	sw	a3,24(s0)
    86c0:	02070a63          	beqz	a4,86f4 <__swsetup_r+0x90>
    86c4:	00c12083          	lw	ra,12(sp)
    86c8:	00812403          	lw	s0,8(sp)
    86cc:	00412483          	lw	s1,4(sp)
    86d0:	01010113          	add	sp,sp,16
    86d4:	00008067          	ret
    86d8:	0027f693          	and	a3,a5,2
    86dc:	00000613          	li	a2,0
    86e0:	00069463          	bnez	a3,86e8 <__swsetup_r+0x84>
    86e4:	01442603          	lw	a2,20(s0)
    86e8:	00c42423          	sw	a2,8(s0)
    86ec:	00000513          	li	a0,0
    86f0:	fc071ae3          	bnez	a4,86c4 <__swsetup_r+0x60>
    86f4:	0807f713          	and	a4,a5,128
    86f8:	fc0706e3          	beqz	a4,86c4 <__swsetup_r+0x60>
    86fc:	0407e793          	or	a5,a5,64
    8700:	00f41623          	sh	a5,12(s0)
    8704:	fff00513          	li	a0,-1
    8708:	fbdff06f          	j	86c4 <__swsetup_r+0x60>
    870c:	0107f713          	and	a4,a5,16
    8710:	08070063          	beqz	a4,8790 <__swsetup_r+0x12c>
    8714:	0047f713          	and	a4,a5,4
    8718:	02071c63          	bnez	a4,8750 <__swsetup_r+0xec>
    871c:	01042703          	lw	a4,16(s0)
    8720:	0087e793          	or	a5,a5,8
    8724:	00f41623          	sh	a5,12(s0)
    8728:	f6071ee3          	bnez	a4,86a4 <__swsetup_r+0x40>
    872c:	2807f693          	and	a3,a5,640
    8730:	20000613          	li	a2,512
    8734:	f6c688e3          	beq	a3,a2,86a4 <__swsetup_r+0x40>
    8738:	00040593          	mv	a1,s0
    873c:	00048513          	mv	a0,s1
    8740:	6cc030ef          	jal	be0c <__smakebuf_r>
    8744:	00c41783          	lh	a5,12(s0)
    8748:	01042703          	lw	a4,16(s0)
    874c:	f59ff06f          	j	86a4 <__swsetup_r+0x40>
    8750:	03042583          	lw	a1,48(s0)
    8754:	00058e63          	beqz	a1,8770 <__swsetup_r+0x10c>
    8758:	04040713          	add	a4,s0,64
    875c:	00e58863          	beq	a1,a4,876c <__swsetup_r+0x108>
    8760:	00048513          	mv	a0,s1
    8764:	cf1f90ef          	jal	2454 <_free_r>
    8768:	00c41783          	lh	a5,12(s0)
    876c:	02042823          	sw	zero,48(s0)
    8770:	01042703          	lw	a4,16(s0)
    8774:	fdb7f793          	and	a5,a5,-37
    8778:	00042223          	sw	zero,4(s0)
    877c:	00e42023          	sw	a4,0(s0)
    8780:	fa1ff06f          	j	8720 <__swsetup_r+0xbc>
    8784:	00078513          	mv	a0,a5
    8788:	c9cff0ef          	jal	7c24 <__sinit>
    878c:	f05ff06f          	j	8690 <__swsetup_r+0x2c>
    8790:	00900713          	li	a4,9
    8794:	00e4a023          	sw	a4,0(s1)
    8798:	0407e793          	or	a5,a5,64
    879c:	00f41623          	sh	a5,12(s0)
    87a0:	fff00513          	li	a0,-1
    87a4:	f21ff06f          	j	86c4 <__swsetup_r+0x60>

000087a8 <__fputwc>:
    87a8:	fc010113          	add	sp,sp,-64
    87ac:	02812c23          	sw	s0,56(sp)
    87b0:	03412423          	sw	s4,40(sp)
    87b4:	03512223          	sw	s5,36(sp)
    87b8:	02112e23          	sw	ra,60(sp)
    87bc:	02912a23          	sw	s1,52(sp)
    87c0:	03312623          	sw	s3,44(sp)
    87c4:	00050a13          	mv	s4,a0
    87c8:	00058a93          	mv	s5,a1
    87cc:	00060413          	mv	s0,a2
    87d0:	374000ef          	jal	8b44 <__locale_mb_cur_max>
    87d4:	00100793          	li	a5,1
    87d8:	02f51663          	bne	a0,a5,8804 <__fputwc+0x5c>
    87dc:	fffa8793          	add	a5,s5,-1
    87e0:	0fe00713          	li	a4,254
    87e4:	02f76063          	bltu	a4,a5,8804 <__fputwc+0x5c>
    87e8:	03212823          	sw	s2,48(sp)
    87ec:	03612023          	sw	s6,32(sp)
    87f0:	01712e23          	sw	s7,28(sp)
    87f4:	01510423          	sb	s5,8(sp)
    87f8:	00100993          	li	s3,1
    87fc:	00810493          	add	s1,sp,8
    8800:	0380006f          	j	8838 <__fputwc+0x90>
    8804:	00810493          	add	s1,sp,8
    8808:	05c40693          	add	a3,s0,92
    880c:	000a8613          	mv	a2,s5
    8810:	00048593          	mv	a1,s1
    8814:	000a0513          	mv	a0,s4
    8818:	3e8030ef          	jal	bc00 <_wcrtomb_r>
    881c:	fff00793          	li	a5,-1
    8820:	00050993          	mv	s3,a0
    8824:	0cf50a63          	beq	a0,a5,88f8 <__fputwc+0x150>
    8828:	0a050663          	beqz	a0,88d4 <__fputwc+0x12c>
    882c:	03212823          	sw	s2,48(sp)
    8830:	03612023          	sw	s6,32(sp)
    8834:	01712e23          	sw	s7,28(sp)
    8838:	00000913          	li	s2,0
    883c:	fff00b13          	li	s6,-1
    8840:	00a00b93          	li	s7,10
    8844:	0200006f          	j	8864 <__fputwc+0xbc>
    8848:	00042783          	lw	a5,0(s0)
    884c:	00178693          	add	a3,a5,1
    8850:	00d42023          	sw	a3,0(s0)
    8854:	00e78023          	sb	a4,0(a5)
    8858:	00190913          	add	s2,s2,1
    885c:	00148493          	add	s1,s1,1
    8860:	07397463          	bgeu	s2,s3,88c8 <__fputwc+0x120>
    8864:	00842783          	lw	a5,8(s0)
    8868:	0004c703          	lbu	a4,0(s1)
    886c:	fff78793          	add	a5,a5,-1
    8870:	00f42423          	sw	a5,8(s0)
    8874:	fc07dae3          	bgez	a5,8848 <__fputwc+0xa0>
    8878:	01842683          	lw	a3,24(s0)
    887c:	00040613          	mv	a2,s0
    8880:	00070593          	mv	a1,a4
    8884:	000a0513          	mv	a0,s4
    8888:	00d7c463          	blt	a5,a3,8890 <__fputwc+0xe8>
    888c:	fb771ee3          	bne	a4,s7,8848 <__fputwc+0xa0>
    8890:	c45ff0ef          	jal	84d4 <__swbuf_r>
    8894:	fd6512e3          	bne	a0,s6,8858 <__fputwc+0xb0>
    8898:	03012903          	lw	s2,48(sp)
    889c:	02012b03          	lw	s6,32(sp)
    88a0:	01c12b83          	lw	s7,28(sp)
    88a4:	03c12083          	lw	ra,60(sp)
    88a8:	03812403          	lw	s0,56(sp)
    88ac:	03412483          	lw	s1,52(sp)
    88b0:	02c12983          	lw	s3,44(sp)
    88b4:	02812a03          	lw	s4,40(sp)
    88b8:	02412a83          	lw	s5,36(sp)
    88bc:	fff00513          	li	a0,-1
    88c0:	04010113          	add	sp,sp,64
    88c4:	00008067          	ret
    88c8:	03012903          	lw	s2,48(sp)
    88cc:	02012b03          	lw	s6,32(sp)
    88d0:	01c12b83          	lw	s7,28(sp)
    88d4:	03c12083          	lw	ra,60(sp)
    88d8:	03812403          	lw	s0,56(sp)
    88dc:	03412483          	lw	s1,52(sp)
    88e0:	02c12983          	lw	s3,44(sp)
    88e4:	02812a03          	lw	s4,40(sp)
    88e8:	000a8513          	mv	a0,s5
    88ec:	02412a83          	lw	s5,36(sp)
    88f0:	04010113          	add	sp,sp,64
    88f4:	00008067          	ret
    88f8:	00c45783          	lhu	a5,12(s0)
    88fc:	0407e793          	or	a5,a5,64
    8900:	00f41623          	sh	a5,12(s0)
    8904:	fa1ff06f          	j	88a4 <__fputwc+0xfc>

00008908 <_fputwc_r>:
    8908:	06462783          	lw	a5,100(a2)
    890c:	fe010113          	add	sp,sp,-32
    8910:	00812c23          	sw	s0,24(sp)
    8914:	00912a23          	sw	s1,20(sp)
    8918:	0017f713          	and	a4,a5,1
    891c:	00112e23          	sw	ra,28(sp)
    8920:	00c61783          	lh	a5,12(a2)
    8924:	00060413          	mv	s0,a2
    8928:	00050493          	mv	s1,a0
    892c:	00071663          	bnez	a4,8938 <_fputwc_r+0x30>
    8930:	2007f713          	and	a4,a5,512
    8934:	08070463          	beqz	a4,89bc <_fputwc_r+0xb4>
    8938:	01279713          	sll	a4,a5,0x12
    893c:	02074063          	bltz	a4,895c <_fputwc_r+0x54>
    8940:	06442703          	lw	a4,100(s0)
    8944:	000026b7          	lui	a3,0x2
    8948:	00d7e7b3          	or	a5,a5,a3
    894c:	000026b7          	lui	a3,0x2
    8950:	00d76733          	or	a4,a4,a3
    8954:	00f41623          	sh	a5,12(s0)
    8958:	06e42223          	sw	a4,100(s0)
    895c:	00048513          	mv	a0,s1
    8960:	00040613          	mv	a2,s0
    8964:	e45ff0ef          	jal	87a8 <__fputwc>
    8968:	06442783          	lw	a5,100(s0)
    896c:	00050493          	mv	s1,a0
    8970:	0017f793          	and	a5,a5,1
    8974:	00079863          	bnez	a5,8984 <_fputwc_r+0x7c>
    8978:	00c45783          	lhu	a5,12(s0)
    897c:	2007f793          	and	a5,a5,512
    8980:	00078e63          	beqz	a5,899c <_fputwc_r+0x94>
    8984:	01c12083          	lw	ra,28(sp)
    8988:	01812403          	lw	s0,24(sp)
    898c:	00048513          	mv	a0,s1
    8990:	01412483          	lw	s1,20(sp)
    8994:	02010113          	add	sp,sp,32
    8998:	00008067          	ret
    899c:	05842503          	lw	a0,88(s0)
    89a0:	e60f90ef          	jal	2000 <__retarget_lock_release_recursive>
    89a4:	01c12083          	lw	ra,28(sp)
    89a8:	01812403          	lw	s0,24(sp)
    89ac:	00048513          	mv	a0,s1
    89b0:	01412483          	lw	s1,20(sp)
    89b4:	02010113          	add	sp,sp,32
    89b8:	00008067          	ret
    89bc:	05862503          	lw	a0,88(a2)
    89c0:	00b12623          	sw	a1,12(sp)
    89c4:	e38f90ef          	jal	1ffc <__retarget_lock_acquire_recursive>
    89c8:	00c41783          	lh	a5,12(s0)
    89cc:	00c12583          	lw	a1,12(sp)
    89d0:	f69ff06f          	j	8938 <_fputwc_r+0x30>

000089d4 <memchr>:
    89d4:	00357793          	and	a5,a0,3
    89d8:	0ff5f693          	zext.b	a3,a1
    89dc:	02078a63          	beqz	a5,8a10 <memchr+0x3c>
    89e0:	fff60793          	add	a5,a2,-1
    89e4:	02060e63          	beqz	a2,8a20 <memchr+0x4c>
    89e8:	fff00613          	li	a2,-1
    89ec:	0180006f          	j	8a04 <memchr+0x30>
    89f0:	00150513          	add	a0,a0,1
    89f4:	00357713          	and	a4,a0,3
    89f8:	00070e63          	beqz	a4,8a14 <memchr+0x40>
    89fc:	fff78793          	add	a5,a5,-1
    8a00:	02c78063          	beq	a5,a2,8a20 <memchr+0x4c>
    8a04:	00054703          	lbu	a4,0(a0)
    8a08:	fed714e3          	bne	a4,a3,89f0 <memchr+0x1c>
    8a0c:	00008067          	ret
    8a10:	00060793          	mv	a5,a2
    8a14:	00300713          	li	a4,3
    8a18:	00f76863          	bltu	a4,a5,8a28 <memchr+0x54>
    8a1c:	06079063          	bnez	a5,8a7c <memchr+0xa8>
    8a20:	00000513          	li	a0,0
    8a24:	00008067          	ret
    8a28:	0ff5f593          	zext.b	a1,a1
    8a2c:	00859713          	sll	a4,a1,0x8
    8a30:	00b705b3          	add	a1,a4,a1
    8a34:	01059713          	sll	a4,a1,0x10
    8a38:	feff08b7          	lui	a7,0xfeff0
    8a3c:	80808837          	lui	a6,0x80808
    8a40:	00e585b3          	add	a1,a1,a4
    8a44:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    8a48:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    8a4c:	00300313          	li	t1,3
    8a50:	0100006f          	j	8a60 <memchr+0x8c>
    8a54:	ffc78793          	add	a5,a5,-4
    8a58:	00450513          	add	a0,a0,4
    8a5c:	fcf370e3          	bgeu	t1,a5,8a1c <memchr+0x48>
    8a60:	00052703          	lw	a4,0(a0)
    8a64:	00e5c733          	xor	a4,a1,a4
    8a68:	01170633          	add	a2,a4,a7
    8a6c:	fff74713          	not	a4,a4
    8a70:	00e67733          	and	a4,a2,a4
    8a74:	01077733          	and	a4,a4,a6
    8a78:	fc070ee3          	beqz	a4,8a54 <memchr+0x80>
    8a7c:	00f507b3          	add	a5,a0,a5
    8a80:	00c0006f          	j	8a8c <memchr+0xb8>
    8a84:	00150513          	add	a0,a0,1
    8a88:	f8f50ce3          	beq	a0,a5,8a20 <memchr+0x4c>
    8a8c:	00054703          	lbu	a4,0(a0)
    8a90:	fed71ae3          	bne	a4,a3,8a84 <memchr+0xb0>
    8a94:	00008067          	ret

00008a98 <strncpy>:
    8a98:	00a5e7b3          	or	a5,a1,a0
    8a9c:	0037f793          	and	a5,a5,3
    8aa0:	00079663          	bnez	a5,8aac <strncpy+0x14>
    8aa4:	00300793          	li	a5,3
    8aa8:	04c7e663          	bltu	a5,a2,8af4 <strncpy+0x5c>
    8aac:	00050713          	mv	a4,a0
    8ab0:	01c0006f          	j	8acc <strncpy+0x34>
    8ab4:	fff5c683          	lbu	a3,-1(a1) # 1fff <__retarget_lock_acquire_recursive+0x3>
    8ab8:	fff60813          	add	a6,a2,-1
    8abc:	fed78fa3          	sb	a3,-1(a5)
    8ac0:	00068e63          	beqz	a3,8adc <strncpy+0x44>
    8ac4:	00078713          	mv	a4,a5
    8ac8:	00080613          	mv	a2,a6
    8acc:	00158593          	add	a1,a1,1
    8ad0:	00170793          	add	a5,a4,1
    8ad4:	fe0610e3          	bnez	a2,8ab4 <strncpy+0x1c>
    8ad8:	00008067          	ret
    8adc:	00c70733          	add	a4,a4,a2
    8ae0:	06080063          	beqz	a6,8b40 <strncpy+0xa8>
    8ae4:	00178793          	add	a5,a5,1
    8ae8:	fe078fa3          	sb	zero,-1(a5)
    8aec:	fee79ce3          	bne	a5,a4,8ae4 <strncpy+0x4c>
    8af0:	00008067          	ret
    8af4:	feff0337          	lui	t1,0xfeff0
    8af8:	808088b7          	lui	a7,0x80808
    8afc:	00050713          	mv	a4,a0
    8b00:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    8b04:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    8b08:	00300e13          	li	t3,3
    8b0c:	0180006f          	j	8b24 <strncpy+0x8c>
    8b10:	00d72023          	sw	a3,0(a4)
    8b14:	ffc60613          	add	a2,a2,-4
    8b18:	00470713          	add	a4,a4,4
    8b1c:	00458593          	add	a1,a1,4
    8b20:	face76e3          	bgeu	t3,a2,8acc <strncpy+0x34>
    8b24:	0005a683          	lw	a3,0(a1)
    8b28:	006687b3          	add	a5,a3,t1
    8b2c:	fff6c813          	not	a6,a3
    8b30:	0107f7b3          	and	a5,a5,a6
    8b34:	0117f7b3          	and	a5,a5,a7
    8b38:	fc078ce3          	beqz	a5,8b10 <strncpy+0x78>
    8b3c:	f91ff06f          	j	8acc <strncpy+0x34>
    8b40:	00008067          	ret

00008b44 <__locale_mb_cur_max>:
    8b44:	7fff8517          	auipc	a0,0x7fff8
    8b48:	b1854503          	lbu	a0,-1256(a0) # 8000065c <__global_locale+0x128>
    8b4c:	00008067          	ret

00008b50 <_localeconv_r>:
    8b50:	7fff8517          	auipc	a0,0x7fff8
    8b54:	ad450513          	add	a0,a0,-1324 # 80000624 <__global_locale+0xf0>
    8b58:	00008067          	ret

00008b5c <_close_r>:
    8b5c:	ff010113          	add	sp,sp,-16
    8b60:	00812423          	sw	s0,8(sp)
    8b64:	00050413          	mv	s0,a0
    8b68:	00058513          	mv	a0,a1
    8b6c:	7fff8797          	auipc	a5,0x7fff8
    8b70:	ba07a823          	sw	zero,-1104(a5) # 8000071c <errno>
    8b74:	00112623          	sw	ra,12(sp)
    8b78:	85cf90ef          	jal	1bd4 <_close>
    8b7c:	fff00793          	li	a5,-1
    8b80:	00f50a63          	beq	a0,a5,8b94 <_close_r+0x38>
    8b84:	00c12083          	lw	ra,12(sp)
    8b88:	00812403          	lw	s0,8(sp)
    8b8c:	01010113          	add	sp,sp,16
    8b90:	00008067          	ret
    8b94:	7fff8797          	auipc	a5,0x7fff8
    8b98:	b887a783          	lw	a5,-1144(a5) # 8000071c <errno>
    8b9c:	fe0784e3          	beqz	a5,8b84 <_close_r+0x28>
    8ba0:	00c12083          	lw	ra,12(sp)
    8ba4:	00f42023          	sw	a5,0(s0)
    8ba8:	00812403          	lw	s0,8(sp)
    8bac:	01010113          	add	sp,sp,16
    8bb0:	00008067          	ret

00008bb4 <_lseek_r>:
    8bb4:	ff010113          	add	sp,sp,-16
    8bb8:	00058713          	mv	a4,a1
    8bbc:	00812423          	sw	s0,8(sp)
    8bc0:	00060593          	mv	a1,a2
    8bc4:	00050413          	mv	s0,a0
    8bc8:	00068613          	mv	a2,a3
    8bcc:	00070513          	mv	a0,a4
    8bd0:	7fff8797          	auipc	a5,0x7fff8
    8bd4:	b407a623          	sw	zero,-1204(a5) # 8000071c <errno>
    8bd8:	00112623          	sw	ra,12(sp)
    8bdc:	834f90ef          	jal	1c10 <_lseek>
    8be0:	fff00793          	li	a5,-1
    8be4:	00f50a63          	beq	a0,a5,8bf8 <_lseek_r+0x44>
    8be8:	00c12083          	lw	ra,12(sp)
    8bec:	00812403          	lw	s0,8(sp)
    8bf0:	01010113          	add	sp,sp,16
    8bf4:	00008067          	ret
    8bf8:	7fff8797          	auipc	a5,0x7fff8
    8bfc:	b247a783          	lw	a5,-1244(a5) # 8000071c <errno>
    8c00:	fe0784e3          	beqz	a5,8be8 <_lseek_r+0x34>
    8c04:	00c12083          	lw	ra,12(sp)
    8c08:	00f42023          	sw	a5,0(s0)
    8c0c:	00812403          	lw	s0,8(sp)
    8c10:	01010113          	add	sp,sp,16
    8c14:	00008067          	ret

00008c18 <_read_r>:
    8c18:	ff010113          	add	sp,sp,-16
    8c1c:	00058713          	mv	a4,a1
    8c20:	00812423          	sw	s0,8(sp)
    8c24:	00060593          	mv	a1,a2
    8c28:	00050413          	mv	s0,a0
    8c2c:	00068613          	mv	a2,a3
    8c30:	00070513          	mv	a0,a4
    8c34:	7fff8797          	auipc	a5,0x7fff8
    8c38:	ae07a423          	sw	zero,-1304(a5) # 8000071c <errno>
    8c3c:	00112623          	sw	ra,12(sp)
    8c40:	fd9f80ef          	jal	1c18 <_read>
    8c44:	fff00793          	li	a5,-1
    8c48:	00f50a63          	beq	a0,a5,8c5c <_read_r+0x44>
    8c4c:	00c12083          	lw	ra,12(sp)
    8c50:	00812403          	lw	s0,8(sp)
    8c54:	01010113          	add	sp,sp,16
    8c58:	00008067          	ret
    8c5c:	7fff8797          	auipc	a5,0x7fff8
    8c60:	ac07a783          	lw	a5,-1344(a5) # 8000071c <errno>
    8c64:	fe0784e3          	beqz	a5,8c4c <_read_r+0x34>
    8c68:	00c12083          	lw	ra,12(sp)
    8c6c:	00f42023          	sw	a5,0(s0)
    8c70:	00812403          	lw	s0,8(sp)
    8c74:	01010113          	add	sp,sp,16
    8c78:	00008067          	ret

00008c7c <_sbrk_r>:
    8c7c:	ff010113          	add	sp,sp,-16
    8c80:	00812423          	sw	s0,8(sp)
    8c84:	00050413          	mv	s0,a0
    8c88:	00058513          	mv	a0,a1
    8c8c:	7fff8797          	auipc	a5,0x7fff8
    8c90:	a807a823          	sw	zero,-1392(a5) # 8000071c <errno>
    8c94:	00112623          	sw	ra,12(sp)
    8c98:	900f90ef          	jal	1d98 <_sbrk>
    8c9c:	fff00793          	li	a5,-1
    8ca0:	00f50a63          	beq	a0,a5,8cb4 <_sbrk_r+0x38>
    8ca4:	00c12083          	lw	ra,12(sp)
    8ca8:	00812403          	lw	s0,8(sp)
    8cac:	01010113          	add	sp,sp,16
    8cb0:	00008067          	ret
    8cb4:	7fff8797          	auipc	a5,0x7fff8
    8cb8:	a687a783          	lw	a5,-1432(a5) # 8000071c <errno>
    8cbc:	fe0784e3          	beqz	a5,8ca4 <_sbrk_r+0x28>
    8cc0:	00c12083          	lw	ra,12(sp)
    8cc4:	00f42023          	sw	a5,0(s0)
    8cc8:	00812403          	lw	s0,8(sp)
    8ccc:	01010113          	add	sp,sp,16
    8cd0:	00008067          	ret

00008cd4 <_write_r>:
    8cd4:	ff010113          	add	sp,sp,-16
    8cd8:	00058713          	mv	a4,a1
    8cdc:	00812423          	sw	s0,8(sp)
    8ce0:	00060593          	mv	a1,a2
    8ce4:	00050413          	mv	s0,a0
    8ce8:	00068613          	mv	a2,a3
    8cec:	00070513          	mv	a0,a4
    8cf0:	7fff8797          	auipc	a5,0x7fff8
    8cf4:	a207a623          	sw	zero,-1492(a5) # 8000071c <errno>
    8cf8:	00112623          	sw	ra,12(sp)
    8cfc:	ff9f80ef          	jal	1cf4 <_write>
    8d00:	fff00793          	li	a5,-1
    8d04:	00f50a63          	beq	a0,a5,8d18 <_write_r+0x44>
    8d08:	00c12083          	lw	ra,12(sp)
    8d0c:	00812403          	lw	s0,8(sp)
    8d10:	01010113          	add	sp,sp,16
    8d14:	00008067          	ret
    8d18:	7fff8797          	auipc	a5,0x7fff8
    8d1c:	a047a783          	lw	a5,-1532(a5) # 8000071c <errno>
    8d20:	fe0784e3          	beqz	a5,8d08 <_write_r+0x34>
    8d24:	00c12083          	lw	ra,12(sp)
    8d28:	00f42023          	sw	a5,0(s0)
    8d2c:	00812403          	lw	s0,8(sp)
    8d30:	01010113          	add	sp,sp,16
    8d34:	00008067          	ret

00008d38 <memmove>:
    8d38:	02a5f663          	bgeu	a1,a0,8d64 <memmove+0x2c>
    8d3c:	00c58733          	add	a4,a1,a2
    8d40:	02e57263          	bgeu	a0,a4,8d64 <memmove+0x2c>
    8d44:	00c507b3          	add	a5,a0,a2
    8d48:	04060663          	beqz	a2,8d94 <memmove+0x5c>
    8d4c:	fff74683          	lbu	a3,-1(a4)
    8d50:	fff78793          	add	a5,a5,-1
    8d54:	fff70713          	add	a4,a4,-1
    8d58:	00d78023          	sb	a3,0(a5)
    8d5c:	fef518e3          	bne	a0,a5,8d4c <memmove+0x14>
    8d60:	00008067          	ret
    8d64:	00f00793          	li	a5,15
    8d68:	02c7e863          	bltu	a5,a2,8d98 <memmove+0x60>
    8d6c:	00050793          	mv	a5,a0
    8d70:	fff60693          	add	a3,a2,-1
    8d74:	0c060263          	beqz	a2,8e38 <memmove+0x100>
    8d78:	00168693          	add	a3,a3,1 # 2001 <__retarget_lock_release_recursive+0x1>
    8d7c:	00d786b3          	add	a3,a5,a3
    8d80:	0005c703          	lbu	a4,0(a1)
    8d84:	00178793          	add	a5,a5,1
    8d88:	00158593          	add	a1,a1,1
    8d8c:	fee78fa3          	sb	a4,-1(a5)
    8d90:	fed798e3          	bne	a5,a3,8d80 <memmove+0x48>
    8d94:	00008067          	ret
    8d98:	00b567b3          	or	a5,a0,a1
    8d9c:	0037f793          	and	a5,a5,3
    8da0:	08079663          	bnez	a5,8e2c <memmove+0xf4>
    8da4:	ff060893          	add	a7,a2,-16
    8da8:	ff08f893          	and	a7,a7,-16
    8dac:	01088893          	add	a7,a7,16
    8db0:	011506b3          	add	a3,a0,a7
    8db4:	00058713          	mv	a4,a1
    8db8:	00050793          	mv	a5,a0
    8dbc:	00072803          	lw	a6,0(a4)
    8dc0:	01070713          	add	a4,a4,16
    8dc4:	01078793          	add	a5,a5,16
    8dc8:	ff07a823          	sw	a6,-16(a5)
    8dcc:	ff472803          	lw	a6,-12(a4)
    8dd0:	ff07aa23          	sw	a6,-12(a5)
    8dd4:	ff872803          	lw	a6,-8(a4)
    8dd8:	ff07ac23          	sw	a6,-8(a5)
    8ddc:	ffc72803          	lw	a6,-4(a4)
    8de0:	ff07ae23          	sw	a6,-4(a5)
    8de4:	fcd79ce3          	bne	a5,a3,8dbc <memmove+0x84>
    8de8:	00c67813          	and	a6,a2,12
    8dec:	011585b3          	add	a1,a1,a7
    8df0:	00f67713          	and	a4,a2,15
    8df4:	04080463          	beqz	a6,8e3c <memmove+0x104>
    8df8:	ffc70813          	add	a6,a4,-4
    8dfc:	ffc87813          	and	a6,a6,-4
    8e00:	00480813          	add	a6,a6,4
    8e04:	010687b3          	add	a5,a3,a6
    8e08:	00058713          	mv	a4,a1
    8e0c:	00072883          	lw	a7,0(a4)
    8e10:	00468693          	add	a3,a3,4
    8e14:	00470713          	add	a4,a4,4
    8e18:	ff16ae23          	sw	a7,-4(a3)
    8e1c:	fef698e3          	bne	a3,a5,8e0c <memmove+0xd4>
    8e20:	00367613          	and	a2,a2,3
    8e24:	010585b3          	add	a1,a1,a6
    8e28:	f49ff06f          	j	8d70 <memmove+0x38>
    8e2c:	fff60693          	add	a3,a2,-1
    8e30:	00050793          	mv	a5,a0
    8e34:	f45ff06f          	j	8d78 <memmove+0x40>
    8e38:	00008067          	ret
    8e3c:	00070613          	mv	a2,a4
    8e40:	f31ff06f          	j	8d70 <memmove+0x38>

00008e44 <frexp>:
    8e44:	ff010113          	add	sp,sp,-16
    8e48:	00912223          	sw	s1,4(sp)
    8e4c:	800004b7          	lui	s1,0x80000
    8e50:	00812423          	sw	s0,8(sp)
    8e54:	00112623          	sw	ra,12(sp)
    8e58:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    8e5c:	00060413          	mv	s0,a2
    8e60:	00062023          	sw	zero,0(a2)
    8e64:	00b4f6b3          	and	a3,s1,a1
    8e68:	7ff00637          	lui	a2,0x7ff00
    8e6c:	00058793          	mv	a5,a1
    8e70:	00050713          	mv	a4,a0
    8e74:	04c6f063          	bgeu	a3,a2,8eb4 <frexp+0x70>
    8e78:	00a6e633          	or	a2,a3,a0
    8e7c:	02060c63          	beqz	a2,8eb4 <frexp+0x70>
    8e80:	0145d613          	srl	a2,a1,0x14
    8e84:	7ff67613          	and	a2,a2,2047
    8e88:	04060463          	beqz	a2,8ed0 <frexp+0x8c>
    8e8c:	00000593          	li	a1,0
    8e90:	80100637          	lui	a2,0x80100
    8e94:	4146d693          	sra	a3,a3,0x14
    8e98:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    8e9c:	c0268693          	add	a3,a3,-1022
    8ea0:	00c7f7b3          	and	a5,a5,a2
    8ea4:	00b686b3          	add	a3,a3,a1
    8ea8:	3fe00637          	lui	a2,0x3fe00
    8eac:	00c7e7b3          	or	a5,a5,a2
    8eb0:	00d42023          	sw	a3,0(s0)
    8eb4:	00c12083          	lw	ra,12(sp)
    8eb8:	00812403          	lw	s0,8(sp)
    8ebc:	00412483          	lw	s1,4(sp)
    8ec0:	00070513          	mv	a0,a4
    8ec4:	00078593          	mv	a1,a5
    8ec8:	01010113          	add	sp,sp,16
    8ecc:	00008067          	ret
    8ed0:	7fff7797          	auipc	a5,0x7fff7
    8ed4:	7f078793          	add	a5,a5,2032 # 800006c0 <__global_locale+0x18c>
    8ed8:	0047a683          	lw	a3,4(a5)
    8edc:	0007a603          	lw	a2,0(a5)
    8ee0:	009050ef          	jal	e6e8 <__muldf3>
    8ee4:	00058793          	mv	a5,a1
    8ee8:	00b4f6b3          	and	a3,s1,a1
    8eec:	00050713          	mv	a4,a0
    8ef0:	fca00593          	li	a1,-54
    8ef4:	f9dff06f          	j	8e90 <frexp+0x4c>

00008ef8 <quorem>:
    8ef8:	fb010113          	add	sp,sp,-80
    8efc:	04912223          	sw	s1,68(sp)
    8f00:	01052783          	lw	a5,16(a0)
    8f04:	0105a483          	lw	s1,16(a1)
    8f08:	04112623          	sw	ra,76(sp)
    8f0c:	00b12423          	sw	a1,8(sp)
    8f10:	2097ca63          	blt	a5,s1,9124 <quorem+0x22c>
    8f14:	fff48493          	add	s1,s1,-1
    8f18:	03512a23          	sw	s5,52(sp)
    8f1c:	03812423          	sw	s8,40(sp)
    8f20:	00249a93          	sll	s5,s1,0x2
    8f24:	01458c13          	add	s8,a1,20
    8f28:	05212023          	sw	s2,64(sp)
    8f2c:	03312e23          	sw	s3,60(sp)
    8f30:	015c0933          	add	s2,s8,s5
    8f34:	01450993          	add	s3,a0,20
    8f38:	015987b3          	add	a5,s3,s5
    8f3c:	03712623          	sw	s7,44(sp)
    8f40:	00092b83          	lw	s7,0(s2)
    8f44:	03912223          	sw	s9,36(sp)
    8f48:	0007ac83          	lw	s9,0(a5)
    8f4c:	001b8b93          	add	s7,s7,1
    8f50:	03412c23          	sw	s4,56(sp)
    8f54:	000b8593          	mv	a1,s7
    8f58:	00050a13          	mv	s4,a0
    8f5c:	000c8513          	mv	a0,s9
    8f60:	04812423          	sw	s0,72(sp)
    8f64:	00f12623          	sw	a5,12(sp)
    8f68:	70d060ef          	jal	fe74 <__hidden___udivsi3>
    8f6c:	00050413          	mv	s0,a0
    8f70:	0d7cee63          	bltu	s9,s7,904c <quorem+0x154>
    8f74:	03a12023          	sw	s10,32(sp)
    8f78:	00010d37          	lui	s10,0x10
    8f7c:	01b12e23          	sw	s11,28(sp)
    8f80:	03612823          	sw	s6,48(sp)
    8f84:	000c0a93          	mv	s5,s8
    8f88:	00098d93          	mv	s11,s3
    8f8c:	00000c93          	li	s9,0
    8f90:	00000b93          	li	s7,0
    8f94:	fffd0d13          	add	s10,s10,-1 # ffff <__fini_array_end+0x57>
    8f98:	000aab03          	lw	s6,0(s5)
    8f9c:	00040593          	mv	a1,s0
    8fa0:	004d8d93          	add	s11,s11,4
    8fa4:	01ab7533          	and	a0,s6,s10
    8fa8:	609060ef          	jal	fdb0 <__mulsi3>
    8fac:	00050793          	mv	a5,a0
    8fb0:	00040593          	mv	a1,s0
    8fb4:	010b5513          	srl	a0,s6,0x10
    8fb8:	01978cb3          	add	s9,a5,s9
    8fbc:	5f5060ef          	jal	fdb0 <__mulsi3>
    8fc0:	ffcda603          	lw	a2,-4(s11)
    8fc4:	01acf733          	and	a4,s9,s10
    8fc8:	010cdc93          	srl	s9,s9,0x10
    8fcc:	01a677b3          	and	a5,a2,s10
    8fd0:	40e787b3          	sub	a5,a5,a4
    8fd4:	017787b3          	add	a5,a5,s7
    8fd8:	01950533          	add	a0,a0,s9
    8fdc:	4107d713          	sra	a4,a5,0x10
    8fe0:	01a575b3          	and	a1,a0,s10
    8fe4:	01065613          	srl	a2,a2,0x10
    8fe8:	40b70733          	sub	a4,a4,a1
    8fec:	00c70733          	add	a4,a4,a2
    8ff0:	01a7f7b3          	and	a5,a5,s10
    8ff4:	01071613          	sll	a2,a4,0x10
    8ff8:	00c7e7b3          	or	a5,a5,a2
    8ffc:	004a8a93          	add	s5,s5,4
    9000:	fefdae23          	sw	a5,-4(s11)
    9004:	01055c93          	srl	s9,a0,0x10
    9008:	41075b93          	sra	s7,a4,0x10
    900c:	f95976e3          	bgeu	s2,s5,8f98 <quorem+0xa0>
    9010:	00c12703          	lw	a4,12(sp)
    9014:	00072783          	lw	a5,0(a4)
    9018:	12079063          	bnez	a5,9138 <quorem+0x240>
    901c:	ffc70a93          	add	s5,a4,-4
    9020:	0159e863          	bltu	s3,s5,9030 <quorem+0x138>
    9024:	0180006f          	j	903c <quorem+0x144>
    9028:	fff48493          	add	s1,s1,-1
    902c:	0159f863          	bgeu	s3,s5,903c <quorem+0x144>
    9030:	000aa783          	lw	a5,0(s5)
    9034:	ffca8a93          	add	s5,s5,-4
    9038:	fe0788e3          	beqz	a5,9028 <quorem+0x130>
    903c:	03012b03          	lw	s6,48(sp)
    9040:	02012d03          	lw	s10,32(sp)
    9044:	01c12d83          	lw	s11,28(sp)
    9048:	009a2823          	sw	s1,16(s4)
    904c:	00812583          	lw	a1,8(sp)
    9050:	000a0513          	mv	a0,s4
    9054:	1fc020ef          	jal	b250 <__mcmp>
    9058:	08054c63          	bltz	a0,90f0 <quorem+0x1f8>
    905c:	00010537          	lui	a0,0x10
    9060:	00098593          	mv	a1,s3
    9064:	00000713          	li	a4,0
    9068:	fff50513          	add	a0,a0,-1 # ffff <__fini_array_end+0x57>
    906c:	0005a683          	lw	a3,0(a1)
    9070:	000c2603          	lw	a2,0(s8)
    9074:	00458593          	add	a1,a1,4
    9078:	00a6f7b3          	and	a5,a3,a0
    907c:	00a67833          	and	a6,a2,a0
    9080:	410787b3          	sub	a5,a5,a6
    9084:	00e787b3          	add	a5,a5,a4
    9088:	4107d713          	sra	a4,a5,0x10
    908c:	01065613          	srl	a2,a2,0x10
    9090:	0106d693          	srl	a3,a3,0x10
    9094:	40c70733          	sub	a4,a4,a2
    9098:	00d70733          	add	a4,a4,a3
    909c:	01071693          	sll	a3,a4,0x10
    90a0:	00a7f7b3          	and	a5,a5,a0
    90a4:	00d7e7b3          	or	a5,a5,a3
    90a8:	004c0c13          	add	s8,s8,4
    90ac:	fef5ae23          	sw	a5,-4(a1)
    90b0:	41075713          	sra	a4,a4,0x10
    90b4:	fb897ce3          	bgeu	s2,s8,906c <quorem+0x174>
    90b8:	00249793          	sll	a5,s1,0x2
    90bc:	00f987b3          	add	a5,s3,a5
    90c0:	0007a703          	lw	a4,0(a5)
    90c4:	02071463          	bnez	a4,90ec <quorem+0x1f4>
    90c8:	ffc78793          	add	a5,a5,-4
    90cc:	00f9e863          	bltu	s3,a5,90dc <quorem+0x1e4>
    90d0:	0180006f          	j	90e8 <quorem+0x1f0>
    90d4:	fff48493          	add	s1,s1,-1
    90d8:	00f9f863          	bgeu	s3,a5,90e8 <quorem+0x1f0>
    90dc:	0007a703          	lw	a4,0(a5)
    90e0:	ffc78793          	add	a5,a5,-4
    90e4:	fe0708e3          	beqz	a4,90d4 <quorem+0x1dc>
    90e8:	009a2823          	sw	s1,16(s4)
    90ec:	00140413          	add	s0,s0,1
    90f0:	04c12083          	lw	ra,76(sp)
    90f4:	00040513          	mv	a0,s0
    90f8:	04812403          	lw	s0,72(sp)
    90fc:	04012903          	lw	s2,64(sp)
    9100:	03c12983          	lw	s3,60(sp)
    9104:	03812a03          	lw	s4,56(sp)
    9108:	03412a83          	lw	s5,52(sp)
    910c:	02c12b83          	lw	s7,44(sp)
    9110:	02812c03          	lw	s8,40(sp)
    9114:	02412c83          	lw	s9,36(sp)
    9118:	04412483          	lw	s1,68(sp)
    911c:	05010113          	add	sp,sp,80
    9120:	00008067          	ret
    9124:	04c12083          	lw	ra,76(sp)
    9128:	04412483          	lw	s1,68(sp)
    912c:	00000513          	li	a0,0
    9130:	05010113          	add	sp,sp,80
    9134:	00008067          	ret
    9138:	00812583          	lw	a1,8(sp)
    913c:	000a0513          	mv	a0,s4
    9140:	03012b03          	lw	s6,48(sp)
    9144:	02012d03          	lw	s10,32(sp)
    9148:	01c12d83          	lw	s11,28(sp)
    914c:	104020ef          	jal	b250 <__mcmp>
    9150:	f00556e3          	bgez	a0,905c <quorem+0x164>
    9154:	f9dff06f          	j	90f0 <quorem+0x1f8>

00009158 <_dtoa_r>:
    9158:	03852303          	lw	t1,56(a0)
    915c:	f5010113          	add	sp,sp,-176
    9160:	0a812423          	sw	s0,168(sp)
    9164:	0a912223          	sw	s1,164(sp)
    9168:	0b212023          	sw	s2,160(sp)
    916c:	09412c23          	sw	s4,152(sp)
    9170:	07b12e23          	sw	s11,124(sp)
    9174:	0a112623          	sw	ra,172(sp)
    9178:	09312e23          	sw	s3,156(sp)
    917c:	09512a23          	sw	s5,148(sp)
    9180:	00e12a23          	sw	a4,20(sp)
    9184:	00f12623          	sw	a5,12(sp)
    9188:	01112423          	sw	a7,8(sp)
    918c:	02b12223          	sw	a1,36(sp)
    9190:	00c12023          	sw	a2,0(sp)
    9194:	00050413          	mv	s0,a0
    9198:	00058d93          	mv	s11,a1
    919c:	00060493          	mv	s1,a2
    91a0:	00068a13          	mv	s4,a3
    91a4:	00080913          	mv	s2,a6
    91a8:	02030263          	beqz	t1,91cc <_dtoa_r+0x74>
    91ac:	03c52703          	lw	a4,60(a0)
    91b0:	00100793          	li	a5,1
    91b4:	00030593          	mv	a1,t1
    91b8:	00e797b3          	sll	a5,a5,a4
    91bc:	00e32223          	sw	a4,4(t1)
    91c0:	00f32423          	sw	a5,8(t1)
    91c4:	734010ef          	jal	a8f8 <_Bfree>
    91c8:	02042c23          	sw	zero,56(s0)
    91cc:	00048993          	mv	s3,s1
    91d0:	00000693          	li	a3,0
    91d4:	0004dc63          	bgez	s1,91ec <_dtoa_r+0x94>
    91d8:	00149493          	sll	s1,s1,0x1
    91dc:	0014d793          	srl	a5,s1,0x1
    91e0:	00f12023          	sw	a5,0(sp)
    91e4:	00078993          	mv	s3,a5
    91e8:	00100693          	li	a3,1
    91ec:	7ff00737          	lui	a4,0x7ff00
    91f0:	00d92023          	sw	a3,0(s2)
    91f4:	00e9f6b3          	and	a3,s3,a4
    91f8:	64e68463          	beq	a3,a4,9840 <_dtoa_r+0x6e8>
    91fc:	00012483          	lw	s1,0(sp)
    9200:	000d8513          	mv	a0,s11
    9204:	00000613          	li	a2,0
    9208:	00048593          	mv	a1,s1
    920c:	00000693          	li	a3,0
    9210:	01b12c23          	sw	s11,24(sp)
    9214:	00912e23          	sw	s1,28(sp)
    9218:	23c050ef          	jal	e454 <__eqdf2>
    921c:	04051c63          	bnez	a0,9274 <_dtoa_r+0x11c>
    9220:	00c12703          	lw	a4,12(sp)
    9224:	00100793          	li	a5,1
    9228:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    922c:	00812703          	lw	a4,8(sp)
    9230:	00070863          	beqz	a4,9240 <_dtoa_r+0xe8>
    9234:	00007797          	auipc	a5,0x7
    9238:	08978793          	add	a5,a5,137 # 102bd <__fini_array_end+0x315>
    923c:	00f72023          	sw	a5,0(a4)
    9240:	00007a97          	auipc	s5,0x7
    9244:	07ca8a93          	add	s5,s5,124 # 102bc <__fini_array_end+0x314>
    9248:	0ac12083          	lw	ra,172(sp)
    924c:	0a812403          	lw	s0,168(sp)
    9250:	0a412483          	lw	s1,164(sp)
    9254:	0a012903          	lw	s2,160(sp)
    9258:	09c12983          	lw	s3,156(sp)
    925c:	09812a03          	lw	s4,152(sp)
    9260:	07c12d83          	lw	s11,124(sp)
    9264:	000a8513          	mv	a0,s5
    9268:	09412a83          	lw	s5,148(sp)
    926c:	0b010113          	add	sp,sp,176
    9270:	00008067          	ret
    9274:	00048613          	mv	a2,s1
    9278:	06810713          	add	a4,sp,104
    927c:	06c10693          	add	a3,sp,108
    9280:	000d8593          	mv	a1,s11
    9284:	00040513          	mv	a0,s0
    9288:	09612823          	sw	s6,144(sp)
    928c:	09712623          	sw	s7,140(sp)
    9290:	09812423          	sw	s8,136(sp)
    9294:	09912223          	sw	s9,132(sp)
    9298:	09a12023          	sw	s10,128(sp)
    929c:	0149d913          	srl	s2,s3,0x14
    92a0:	268020ef          	jal	b508 <__d2b>
    92a4:	00050493          	mv	s1,a0
    92a8:	5c091e63          	bnez	s2,9884 <_dtoa_r+0x72c>
    92ac:	06812a83          	lw	s5,104(sp)
    92b0:	06c12903          	lw	s2,108(sp)
    92b4:	02000793          	li	a5,32
    92b8:	012a8933          	add	s2,s5,s2
    92bc:	43290713          	add	a4,s2,1074
    92c0:	36e7dae3          	bge	a5,a4,9e34 <_dtoa_r+0xcdc>
    92c4:	04000793          	li	a5,64
    92c8:	40e787b3          	sub	a5,a5,a4
    92cc:	41290513          	add	a0,s2,1042
    92d0:	00f997b3          	sll	a5,s3,a5
    92d4:	00add533          	srl	a0,s11,a0
    92d8:	00a7e533          	or	a0,a5,a0
    92dc:	634060ef          	jal	f910 <__floatunsidf>
    92e0:	fe1007b7          	lui	a5,0xfe100
    92e4:	00100693          	li	a3,1
    92e8:	00050713          	mv	a4,a0
    92ec:	00b787b3          	add	a5,a5,a1
    92f0:	fff90913          	add	s2,s2,-1
    92f4:	02d12c23          	sw	a3,56(sp)
    92f8:	7fff7697          	auipc	a3,0x7fff7
    92fc:	3d068693          	add	a3,a3,976 # 800006c8 <__global_locale+0x194>
    9300:	0006a603          	lw	a2,0(a3)
    9304:	0046a683          	lw	a3,4(a3)
    9308:	00070513          	mv	a0,a4
    930c:	00078593          	mv	a1,a5
    9310:	369050ef          	jal	ee78 <__subdf3>
    9314:	7fff7797          	auipc	a5,0x7fff7
    9318:	3bc78793          	add	a5,a5,956 # 800006d0 <__global_locale+0x19c>
    931c:	0007a603          	lw	a2,0(a5)
    9320:	0047a683          	lw	a3,4(a5)
    9324:	3c4050ef          	jal	e6e8 <__muldf3>
    9328:	7fff7797          	auipc	a5,0x7fff7
    932c:	3b078793          	add	a5,a5,944 # 800006d8 <__global_locale+0x1a4>
    9330:	0007a603          	lw	a2,0(a5)
    9334:	0047a683          	lw	a3,4(a5)
    9338:	7a9030ef          	jal	d2e0 <__adddf3>
    933c:	00050b13          	mv	s6,a0
    9340:	00090513          	mv	a0,s2
    9344:	00058993          	mv	s3,a1
    9348:	510060ef          	jal	f858 <__floatsidf>
    934c:	7fff7797          	auipc	a5,0x7fff7
    9350:	39478793          	add	a5,a5,916 # 800006e0 <__global_locale+0x1ac>
    9354:	0007a603          	lw	a2,0(a5)
    9358:	0047a683          	lw	a3,4(a5)
    935c:	38c050ef          	jal	e6e8 <__muldf3>
    9360:	00050613          	mv	a2,a0
    9364:	00058693          	mv	a3,a1
    9368:	000b0513          	mv	a0,s6
    936c:	00098593          	mv	a1,s3
    9370:	771030ef          	jal	d2e0 <__adddf3>
    9374:	00050b93          	mv	s7,a0
    9378:	00058b13          	mv	s6,a1
    937c:	458060ef          	jal	f7d4 <__fixdfsi>
    9380:	00050993          	mv	s3,a0
    9384:	000b0593          	mv	a1,s6
    9388:	000b8513          	mv	a0,s7
    938c:	00000613          	li	a2,0
    9390:	00000693          	li	a3,0
    9394:	24c050ef          	jal	e5e0 <__ledf2>
    9398:	02055063          	bgez	a0,93b8 <_dtoa_r+0x260>
    939c:	00098513          	mv	a0,s3
    93a0:	4b8060ef          	jal	f858 <__floatsidf>
    93a4:	000b8613          	mv	a2,s7
    93a8:	000b0693          	mv	a3,s6
    93ac:	0a8050ef          	jal	e454 <__eqdf2>
    93b0:	00a03533          	snez	a0,a0
    93b4:	40a989b3          	sub	s3,s3,a0
    93b8:	412a8ab3          	sub	s5,s5,s2
    93bc:	01600793          	li	a5,22
    93c0:	fffa8b13          	add	s6,s5,-1
    93c4:	2137e2e3          	bltu	a5,s3,9dc8 <_dtoa_r+0xc70>
    93c8:	00399713          	sll	a4,s3,0x3
    93cc:	00007797          	auipc	a5,0x7
    93d0:	58c78793          	add	a5,a5,1420 # 10958 <__mprec_tens>
    93d4:	00e787b3          	add	a5,a5,a4
    93d8:	0007a603          	lw	a2,0(a5)
    93dc:	0047a683          	lw	a3,4(a5)
    93e0:	01812503          	lw	a0,24(sp)
    93e4:	01c12583          	lw	a1,28(sp)
    93e8:	1f8050ef          	jal	e5e0 <__ledf2>
    93ec:	220554e3          	bgez	a0,9e14 <_dtoa_r+0xcbc>
    93f0:	fff98993          	add	s3,s3,-1
    93f4:	02012a23          	sw	zero,52(sp)
    93f8:	00012823          	sw	zero,16(sp)
    93fc:	4a0b4863          	bltz	s6,98ac <_dtoa_r+0x754>
    9400:	4c09d063          	bgez	s3,98c0 <_dtoa_r+0x768>
    9404:	01012783          	lw	a5,16(sp)
    9408:	03312023          	sw	s3,32(sp)
    940c:	413787b3          	sub	a5,a5,s3
    9410:	00f12823          	sw	a5,16(sp)
    9414:	413007b3          	neg	a5,s3
    9418:	02f12823          	sw	a5,48(sp)
    941c:	00900793          	li	a5,9
    9420:	00000993          	li	s3,0
    9424:	4b47e863          	bltu	a5,s4,98d4 <_dtoa_r+0x77c>
    9428:	00500793          	li	a5,5
    942c:	2147dae3          	bge	a5,s4,9e40 <_dtoa_r+0xce8>
    9430:	ffca0a13          	add	s4,s4,-4
    9434:	00300793          	li	a5,3
    9438:	00000913          	li	s2,0
    943c:	66fa02e3          	beq	s4,a5,a2a0 <_dtoa_r+0x1148>
    9440:	6147dae3          	bge	a5,s4,a254 <_dtoa_r+0x10fc>
    9444:	00400793          	li	a5,4
    9448:	54fa1ae3          	bne	s4,a5,a19c <_dtoa_r+0x1044>
    944c:	00100793          	li	a5,1
    9450:	02f12423          	sw	a5,40(sp)
    9454:	01412603          	lw	a2,20(sp)
    9458:	62c05ce3          	blez	a2,a290 <_dtoa_r+0x1138>
    945c:	02c12e23          	sw	a2,60(sp)
    9460:	00060c13          	mv	s8,a2
    9464:	01700693          	li	a3,23
    9468:	00100713          	li	a4,1
    946c:	00400793          	li	a5,4
    9470:	00c6c463          	blt	a3,a2,9478 <_dtoa_r+0x320>
    9474:	3540106f          	j	a7c8 <_dtoa_r+0x1670>
    9478:	00179793          	sll	a5,a5,0x1
    947c:	01478693          	add	a3,a5,20
    9480:	00070593          	mv	a1,a4
    9484:	00170713          	add	a4,a4,1
    9488:	fed678e3          	bgeu	a2,a3,9478 <_dtoa_r+0x320>
    948c:	02b42e23          	sw	a1,60(s0)
    9490:	00040513          	mv	a0,s0
    9494:	3b0010ef          	jal	a844 <_Balloc>
    9498:	00050a93          	mv	s5,a0
    949c:	00051463          	bnez	a0,94a4 <_dtoa_r+0x34c>
    94a0:	30c0106f          	j	a7ac <_dtoa_r+0x1654>
    94a4:	02a42c23          	sw	a0,56(s0)
    94a8:	00e00793          	li	a5,14
    94ac:	5187ea63          	bltu	a5,s8,99c0 <_dtoa_r+0x868>
    94b0:	50090863          	beqz	s2,99c0 <_dtoa_r+0x868>
    94b4:	02012783          	lw	a5,32(sp)
    94b8:	62f054e3          	blez	a5,a2e0 <_dtoa_r+0x1188>
    94bc:	00f7f713          	and	a4,a5,15
    94c0:	00371713          	sll	a4,a4,0x3
    94c4:	4047dc93          	sra	s9,a5,0x4
    94c8:	00007797          	auipc	a5,0x7
    94cc:	49078793          	add	a5,a5,1168 # 10958 <__mprec_tens>
    94d0:	00e787b3          	add	a5,a5,a4
    94d4:	010cf693          	and	a3,s9,16
    94d8:	0007a803          	lw	a6,0(a5)
    94dc:	0047a703          	lw	a4,4(a5)
    94e0:	560682e3          	beqz	a3,a244 <_dtoa_r+0x10ec>
    94e4:	00007797          	auipc	a5,0x7
    94e8:	44c78793          	add	a5,a5,1100 # 10930 <__mprec_bigtens>
    94ec:	0207a603          	lw	a2,32(a5)
    94f0:	0247a683          	lw	a3,36(a5)
    94f4:	01812503          	lw	a0,24(sp)
    94f8:	01c12583          	lw	a1,28(sp)
    94fc:	04e12423          	sw	a4,72(sp)
    9500:	05012023          	sw	a6,64(sp)
    9504:	6a4040ef          	jal	dba8 <__divdf3>
    9508:	04012803          	lw	a6,64(sp)
    950c:	04812703          	lw	a4,72(sp)
    9510:	00fcfc93          	and	s9,s9,15
    9514:	00050313          	mv	t1,a0
    9518:	00058d13          	mv	s10,a1
    951c:	00300913          	li	s2,3
    9520:	040c8c63          	beqz	s9,9578 <_dtoa_r+0x420>
    9524:	04812023          	sw	s0,64(sp)
    9528:	00007b97          	auipc	s7,0x7
    952c:	408b8b93          	add	s7,s7,1032 # 10930 <__mprec_bigtens>
    9530:	00090413          	mv	s0,s2
    9534:	00070593          	mv	a1,a4
    9538:	00030913          	mv	s2,t1
    953c:	001cf793          	and	a5,s9,1
    9540:	00078e63          	beqz	a5,955c <_dtoa_r+0x404>
    9544:	000ba603          	lw	a2,0(s7)
    9548:	004ba683          	lw	a3,4(s7)
    954c:	00080513          	mv	a0,a6
    9550:	00140413          	add	s0,s0,1
    9554:	194050ef          	jal	e6e8 <__muldf3>
    9558:	00050813          	mv	a6,a0
    955c:	401cdc93          	sra	s9,s9,0x1
    9560:	008b8b93          	add	s7,s7,8
    9564:	fc0c9ce3          	bnez	s9,953c <_dtoa_r+0x3e4>
    9568:	00090313          	mv	t1,s2
    956c:	00040913          	mv	s2,s0
    9570:	04012403          	lw	s0,64(sp)
    9574:	00058713          	mv	a4,a1
    9578:	00070693          	mv	a3,a4
    957c:	00080613          	mv	a2,a6
    9580:	00030513          	mv	a0,t1
    9584:	000d0593          	mv	a1,s10
    9588:	620040ef          	jal	dba8 <__divdf3>
    958c:	00050713          	mv	a4,a0
    9590:	00058793          	mv	a5,a1
    9594:	03412683          	lw	a3,52(sp)
    9598:	02068c63          	beqz	a3,95d0 <_dtoa_r+0x478>
    959c:	7fff7697          	auipc	a3,0x7fff7
    95a0:	14c68693          	add	a3,a3,332 # 800006e8 <__global_locale+0x1b4>
    95a4:	0006a603          	lw	a2,0(a3)
    95a8:	0046a683          	lw	a3,4(a3)
    95ac:	00070513          	mv	a0,a4
    95b0:	00078593          	mv	a1,a5
    95b4:	04e12423          	sw	a4,72(sp)
    95b8:	04f12023          	sw	a5,64(sp)
    95bc:	024050ef          	jal	e5e0 <__ledf2>
    95c0:	04012783          	lw	a5,64(sp)
    95c4:	04812703          	lw	a4,72(sp)
    95c8:	00055463          	bgez	a0,95d0 <_dtoa_r+0x478>
    95cc:	04c0106f          	j	a618 <_dtoa_r+0x14c0>
    95d0:	00090513          	mv	a0,s2
    95d4:	04f12623          	sw	a5,76(sp)
    95d8:	04e12023          	sw	a4,64(sp)
    95dc:	27c060ef          	jal	f858 <__floatsidf>
    95e0:	04012703          	lw	a4,64(sp)
    95e4:	04c12783          	lw	a5,76(sp)
    95e8:	00070613          	mv	a2,a4
    95ec:	00078693          	mv	a3,a5
    95f0:	04e12423          	sw	a4,72(sp)
    95f4:	04f12023          	sw	a5,64(sp)
    95f8:	0f0050ef          	jal	e6e8 <__muldf3>
    95fc:	7fff7697          	auipc	a3,0x7fff7
    9600:	0fc68693          	add	a3,a3,252 # 800006f8 <__global_locale+0x1c4>
    9604:	0006a603          	lw	a2,0(a3)
    9608:	0046a683          	lw	a3,4(a3)
    960c:	4d5030ef          	jal	d2e0 <__adddf3>
    9610:	fcc006b7          	lui	a3,0xfcc00
    9614:	04012783          	lw	a5,64(sp)
    9618:	04812703          	lw	a4,72(sp)
    961c:	00050c93          	mv	s9,a0
    9620:	00b68bb3          	add	s7,a3,a1
    9624:	340c0463          	beqz	s8,996c <_dtoa_r+0x814>
    9628:	02012683          	lw	a3,32(sp)
    962c:	05812423          	sw	s8,72(sp)
    9630:	04d12e23          	sw	a3,92(sp)
    9634:	00070513          	mv	a0,a4
    9638:	00078593          	mv	a1,a5
    963c:	04e12623          	sw	a4,76(sp)
    9640:	04f12023          	sw	a5,64(sp)
    9644:	190060ef          	jal	f7d4 <__fixdfsi>
    9648:	04812783          	lw	a5,72(sp)
    964c:	00050913          	mv	s2,a0
    9650:	05912c23          	sw	s9,88(sp)
    9654:	fff78693          	add	a3,a5,-1
    9658:	00369693          	sll	a3,a3,0x3
    965c:	00007797          	auipc	a5,0x7
    9660:	2fc78793          	add	a5,a5,764 # 10958 <__mprec_tens>
    9664:	00d786b3          	add	a3,a5,a3
    9668:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    966c:	0046a803          	lw	a6,4(a3)
    9670:	001a8d13          	add	s10,s5,1
    9674:	04f12823          	sw	a5,80(sp)
    9678:	05012a23          	sw	a6,84(sp)
    967c:	1dc060ef          	jal	f858 <__floatsidf>
    9680:	04c12703          	lw	a4,76(sp)
    9684:	04012783          	lw	a5,64(sp)
    9688:	00050613          	mv	a2,a0
    968c:	00058693          	mv	a3,a1
    9690:	00070513          	mv	a0,a4
    9694:	00078593          	mv	a1,a5
    9698:	7e0050ef          	jal	ee78 <__subdf3>
    969c:	02812703          	lw	a4,40(sp)
    96a0:	03090313          	add	t1,s2,48
    96a4:	05a12023          	sw	s10,64(sp)
    96a8:	00050c93          	mv	s9,a0
    96ac:	0ff37313          	zext.b	t1,t1
    96b0:	5c0706e3          	beqz	a4,a47c <_dtoa_r+0x1324>
    96b4:	7fff7797          	auipc	a5,0x7fff7
    96b8:	00478793          	add	a5,a5,4 # 800006b8 <__global_locale+0x184>
    96bc:	0007a503          	lw	a0,0(a5)
    96c0:	05012603          	lw	a2,80(sp)
    96c4:	05412683          	lw	a3,84(sp)
    96c8:	04b12023          	sw	a1,64(sp)
    96cc:	0047a583          	lw	a1,4(a5)
    96d0:	04612623          	sw	t1,76(sp)
    96d4:	4d4040ef          	jal	dba8 <__divdf3>
    96d8:	05812603          	lw	a2,88(sp)
    96dc:	000b8693          	mv	a3,s7
    96e0:	798050ef          	jal	ee78 <__subdf3>
    96e4:	04012883          	lw	a7,64(sp)
    96e8:	04c12303          	lw	t1,76(sp)
    96ec:	000c8613          	mv	a2,s9
    96f0:	00088693          	mv	a3,a7
    96f4:	006a8023          	sb	t1,0(s5)
    96f8:	00050913          	mv	s2,a0
    96fc:	00058b93          	mv	s7,a1
    9700:	5e1040ef          	jal	e4e0 <__gedf2>
    9704:	04012883          	lw	a7,64(sp)
    9708:	00a05463          	blez	a0,9710 <_dtoa_r+0x5b8>
    970c:	7c90006f          	j	a6d4 <_dtoa_r+0x157c>
    9710:	7fff7697          	auipc	a3,0x7fff7
    9714:	fd868693          	add	a3,a3,-40 # 800006e8 <__global_locale+0x1b4>
    9718:	0006a783          	lw	a5,0(a3)
    971c:	0046a803          	lw	a6,4(a3)
    9720:	05312623          	sw	s3,76(sp)
    9724:	04f12023          	sw	a5,64(sp)
    9728:	00000793          	li	a5,0
    972c:	05612823          	sw	s6,80(sp)
    9730:	05812c23          	sw	s8,88(sp)
    9734:	05012223          	sw	a6,68(sp)
    9738:	04812c03          	lw	s8,72(sp)
    973c:	00078b13          	mv	s6,a5
    9740:	05412423          	sw	s4,72(sp)
    9744:	00088993          	mv	s3,a7
    9748:	0980006f          	j	97e0 <_dtoa_r+0x688>
    974c:	001b0b13          	add	s6,s6,1
    9750:	018b4463          	blt	s6,s8,9758 <_dtoa_r+0x600>
    9754:	7d10006f          	j	a724 <_dtoa_r+0x15cc>
    9758:	7fff7a17          	auipc	s4,0x7fff7
    975c:	f98a0a13          	add	s4,s4,-104 # 800006f0 <__global_locale+0x1bc>
    9760:	000a2603          	lw	a2,0(s4)
    9764:	004a2683          	lw	a3,4(s4)
    9768:	00090513          	mv	a0,s2
    976c:	000b8593          	mv	a1,s7
    9770:	779040ef          	jal	e6e8 <__muldf3>
    9774:	000a2603          	lw	a2,0(s4)
    9778:	004a2683          	lw	a3,4(s4)
    977c:	00050913          	mv	s2,a0
    9780:	00058b93          	mv	s7,a1
    9784:	000c8513          	mv	a0,s9
    9788:	00098593          	mv	a1,s3
    978c:	75d040ef          	jal	e6e8 <__muldf3>
    9790:	00058c93          	mv	s9,a1
    9794:	00050a13          	mv	s4,a0
    9798:	03c060ef          	jal	f7d4 <__fixdfsi>
    979c:	00050993          	mv	s3,a0
    97a0:	0b8060ef          	jal	f858 <__floatsidf>
    97a4:	00050613          	mv	a2,a0
    97a8:	00058693          	mv	a3,a1
    97ac:	000a0513          	mv	a0,s4
    97b0:	000c8593          	mv	a1,s9
    97b4:	6c4050ef          	jal	ee78 <__subdf3>
    97b8:	03098793          	add	a5,s3,48
    97bc:	00090613          	mv	a2,s2
    97c0:	000b8693          	mv	a3,s7
    97c4:	00fd0023          	sb	a5,0(s10)
    97c8:	001d0d13          	add	s10,s10,1
    97cc:	00050c93          	mv	s9,a0
    97d0:	00058993          	mv	s3,a1
    97d4:	60d040ef          	jal	e5e0 <__ledf2>
    97d8:	00055463          	bgez	a0,97e0 <_dtoa_r+0x688>
    97dc:	6f90006f          	j	a6d4 <_dtoa_r+0x157c>
    97e0:	04012503          	lw	a0,64(sp)
    97e4:	04412583          	lw	a1,68(sp)
    97e8:	000c8613          	mv	a2,s9
    97ec:	00098693          	mv	a3,s3
    97f0:	688050ef          	jal	ee78 <__subdf3>
    97f4:	00090613          	mv	a2,s2
    97f8:	000b8693          	mv	a3,s7
    97fc:	5e5040ef          	jal	e5e0 <__ledf2>
    9800:	f40556e3          	bgez	a0,974c <_dtoa_r+0x5f4>
    9804:	05c12783          	lw	a5,92(sp)
    9808:	000d0b93          	mv	s7,s10
    980c:	00178c13          	add	s8,a5,1
    9810:	03900613          	li	a2,57
    9814:	0080006f          	j	981c <_dtoa_r+0x6c4>
    9818:	697a88e3          	beq	s5,s7,a6a8 <_dtoa_r+0x1550>
    981c:	fffbc683          	lbu	a3,-1(s7)
    9820:	000b8d13          	mv	s10,s7
    9824:	fffb8b93          	add	s7,s7,-1
    9828:	fec688e3          	beq	a3,a2,9818 <_dtoa_r+0x6c0>
    982c:	00168693          	add	a3,a3,1
    9830:	0ff6f693          	zext.b	a3,a3
    9834:	00db8023          	sb	a3,0(s7)
    9838:	000c0a13          	mv	s4,s8
    983c:	4f00006f          	j	9d2c <_dtoa_r+0xbd4>
    9840:	00c12683          	lw	a3,12(sp)
    9844:	00002737          	lui	a4,0x2
    9848:	00c99793          	sll	a5,s3,0xc
    984c:	70f70713          	add	a4,a4,1807 # 270f <_free_r+0x2bb>
    9850:	00c7d793          	srl	a5,a5,0xc
    9854:	00e6a023          	sw	a4,0(a3)
    9858:	01b7e7b3          	or	a5,a5,s11
    985c:	0a078063          	beqz	a5,98fc <_dtoa_r+0x7a4>
    9860:	00812783          	lw	a5,8(sp)
    9864:	00007a97          	auipc	s5,0x7
    9868:	ab0a8a93          	add	s5,s5,-1360 # 10314 <__fini_array_end+0x36c>
    986c:	9c078ee3          	beqz	a5,9248 <_dtoa_r+0xf0>
    9870:	00007797          	auipc	a5,0x7
    9874:	aa778793          	add	a5,a5,-1369 # 10317 <__fini_array_end+0x36f>
    9878:	00812703          	lw	a4,8(sp)
    987c:	00f72023          	sw	a5,0(a4)
    9880:	9c9ff06f          	j	9248 <_dtoa_r+0xf0>
    9884:	01c12783          	lw	a5,28(sp)
    9888:	3ff006b7          	lui	a3,0x3ff00
    988c:	06812a83          	lw	s5,104(sp)
    9890:	00c79793          	sll	a5,a5,0xc
    9894:	00c7d793          	srl	a5,a5,0xc
    9898:	01812703          	lw	a4,24(sp)
    989c:	00d7e7b3          	or	a5,a5,a3
    98a0:	c0190913          	add	s2,s2,-1023
    98a4:	02012c23          	sw	zero,56(sp)
    98a8:	a51ff06f          	j	92f8 <_dtoa_r+0x1a0>
    98ac:	00100793          	li	a5,1
    98b0:	415787b3          	sub	a5,a5,s5
    98b4:	00f12823          	sw	a5,16(sp)
    98b8:	00000b13          	li	s6,0
    98bc:	b409c4e3          	bltz	s3,9404 <_dtoa_r+0x2ac>
    98c0:	03312023          	sw	s3,32(sp)
    98c4:	02012823          	sw	zero,48(sp)
    98c8:	00900793          	li	a5,9
    98cc:	013b0b33          	add	s6,s6,s3
    98d0:	b547fce3          	bgeu	a5,s4,9428 <_dtoa_r+0x2d0>
    98d4:	00100793          	li	a5,1
    98d8:	00100913          	li	s2,1
    98dc:	00000a13          	li	s4,0
    98e0:	02f12423          	sw	a5,40(sp)
    98e4:	fff00c13          	li	s8,-1
    98e8:	00012a23          	sw	zero,20(sp)
    98ec:	02042e23          	sw	zero,60(s0)
    98f0:	03812e23          	sw	s8,60(sp)
    98f4:	00000593          	li	a1,0
    98f8:	b99ff06f          	j	9490 <_dtoa_r+0x338>
    98fc:	00812703          	lw	a4,8(sp)
    9900:	00007a97          	auipc	s5,0x7
    9904:	a08a8a93          	add	s5,s5,-1528 # 10308 <__fini_array_end+0x360>
    9908:	00007797          	auipc	a5,0x7
    990c:	a0878793          	add	a5,a5,-1528 # 10310 <__fini_array_end+0x368>
    9910:	f60714e3          	bnez	a4,9878 <_dtoa_r+0x720>
    9914:	935ff06f          	j	9248 <_dtoa_r+0xf0>
    9918:	00090513          	mv	a0,s2
    991c:	04f12623          	sw	a5,76(sp)
    9920:	04e12023          	sw	a4,64(sp)
    9924:	735050ef          	jal	f858 <__floatsidf>
    9928:	04012703          	lw	a4,64(sp)
    992c:	04c12783          	lw	a5,76(sp)
    9930:	00070613          	mv	a2,a4
    9934:	00078693          	mv	a3,a5
    9938:	04e12423          	sw	a4,72(sp)
    993c:	04f12023          	sw	a5,64(sp)
    9940:	5a9040ef          	jal	e6e8 <__muldf3>
    9944:	7fff7697          	auipc	a3,0x7fff7
    9948:	db468693          	add	a3,a3,-588 # 800006f8 <__global_locale+0x1c4>
    994c:	0006a603          	lw	a2,0(a3)
    9950:	0046a683          	lw	a3,4(a3)
    9954:	18d030ef          	jal	d2e0 <__adddf3>
    9958:	04012783          	lw	a5,64(sp)
    995c:	04812703          	lw	a4,72(sp)
    9960:	fcc006b7          	lui	a3,0xfcc00
    9964:	00050c93          	mv	s9,a0
    9968:	00b68bb3          	add	s7,a3,a1
    996c:	7fff7697          	auipc	a3,0x7fff7
    9970:	d9468693          	add	a3,a3,-620 # 80000700 <__global_locale+0x1cc>
    9974:	0006a603          	lw	a2,0(a3)
    9978:	0046a683          	lw	a3,4(a3)
    997c:	00070513          	mv	a0,a4
    9980:	00078593          	mv	a1,a5
    9984:	4f4050ef          	jal	ee78 <__subdf3>
    9988:	000c8613          	mv	a2,s9
    998c:	000b8693          	mv	a3,s7
    9990:	00050d13          	mv	s10,a0
    9994:	00058913          	mv	s2,a1
    9998:	349040ef          	jal	e4e0 <__gedf2>
    999c:	50a04ce3          	bgtz	a0,a6b4 <_dtoa_r+0x155c>
    99a0:	800007b7          	lui	a5,0x80000
    99a4:	0177c7b3          	xor	a5,a5,s7
    99a8:	000c8613          	mv	a2,s9
    99ac:	000d0513          	mv	a0,s10
    99b0:	00078693          	mv	a3,a5
    99b4:	00090593          	mv	a1,s2
    99b8:	429040ef          	jal	e5e0 <__ledf2>
    99bc:	06054c63          	bltz	a0,9a34 <_dtoa_r+0x8dc>
    99c0:	06c12783          	lw	a5,108(sp)
    99c4:	1a07c663          	bltz	a5,9b70 <_dtoa_r+0xa18>
    99c8:	02012683          	lw	a3,32(sp)
    99cc:	00e00713          	li	a4,14
    99d0:	1ad74063          	blt	a4,a3,9b70 <_dtoa_r+0xa18>
    99d4:	02012783          	lw	a5,32(sp)
    99d8:	00379713          	sll	a4,a5,0x3
    99dc:	00007797          	auipc	a5,0x7
    99e0:	f7c78793          	add	a5,a5,-132 # 10958 <__mprec_tens>
    99e4:	00e787b3          	add	a5,a5,a4
    99e8:	0007a903          	lw	s2,0(a5)
    99ec:	0047a983          	lw	s3,4(a5)
    99f0:	01412783          	lw	a5,20(sp)
    99f4:	0407dc63          	bgez	a5,9a4c <_dtoa_r+0x8f4>
    99f8:	05804a63          	bgtz	s8,9a4c <_dtoa_r+0x8f4>
    99fc:	020c1c63          	bnez	s8,9a34 <_dtoa_r+0x8dc>
    9a00:	7fff7797          	auipc	a5,0x7fff7
    9a04:	d0078793          	add	a5,a5,-768 # 80000700 <__global_locale+0x1cc>
    9a08:	0007a603          	lw	a2,0(a5)
    9a0c:	0047a683          	lw	a3,4(a5)
    9a10:	00090513          	mv	a0,s2
    9a14:	00098593          	mv	a1,s3
    9a18:	4d1040ef          	jal	e6e8 <__muldf3>
    9a1c:	00050613          	mv	a2,a0
    9a20:	00058693          	mv	a3,a1
    9a24:	01812503          	lw	a0,24(sp)
    9a28:	01c12583          	lw	a1,28(sp)
    9a2c:	3b5040ef          	jal	e5e0 <__ledf2>
    9a30:	48a042e3          	bgtz	a0,a6b4 <_dtoa_r+0x155c>
    9a34:	000a8d13          	mv	s10,s5
    9a38:	00012c23          	sw	zero,24(sp)
    9a3c:	00000913          	li	s2,0
    9a40:	01412783          	lw	a5,20(sp)
    9a44:	fff7ca13          	not	s4,a5
    9a48:	6980006f          	j	a0e0 <_dtoa_r+0xf88>
    9a4c:	001a8793          	add	a5,s5,1
    9a50:	04f12023          	sw	a5,64(sp)
    9a54:	01812b03          	lw	s6,24(sp)
    9a58:	01c12a03          	lw	s4,28(sp)
    9a5c:	00090613          	mv	a2,s2
    9a60:	00098693          	mv	a3,s3
    9a64:	000b0513          	mv	a0,s6
    9a68:	000a0593          	mv	a1,s4
    9a6c:	13c040ef          	jal	dba8 <__divdf3>
    9a70:	565050ef          	jal	f7d4 <__fixdfsi>
    9a74:	00050d13          	mv	s10,a0
    9a78:	5e1050ef          	jal	f858 <__floatsidf>
    9a7c:	00090613          	mv	a2,s2
    9a80:	00098693          	mv	a3,s3
    9a84:	465040ef          	jal	e6e8 <__muldf3>
    9a88:	00050613          	mv	a2,a0
    9a8c:	00058693          	mv	a3,a1
    9a90:	000b0513          	mv	a0,s6
    9a94:	000a0593          	mv	a1,s4
    9a98:	3e0050ef          	jal	ee78 <__subdf3>
    9a9c:	030d0793          	add	a5,s10,48
    9aa0:	00fa8023          	sb	a5,0(s5)
    9aa4:	00100613          	li	a2,1
    9aa8:	04012b83          	lw	s7,64(sp)
    9aac:	00050713          	mv	a4,a0
    9ab0:	00058693          	mv	a3,a1
    9ab4:	0ccc0ee3          	beq	s8,a2,a390 <_dtoa_r+0x1238>
    9ab8:	7fff7617          	auipc	a2,0x7fff7
    9abc:	c3860613          	add	a2,a2,-968 # 800006f0 <__global_locale+0x1bc>
    9ac0:	00062783          	lw	a5,0(a2)
    9ac4:	00462803          	lw	a6,4(a2)
    9ac8:	00100d93          	li	s11,1
    9acc:	00f12023          	sw	a5,0(sp)
    9ad0:	01012223          	sw	a6,4(sp)
    9ad4:	0600006f          	j	9b34 <_dtoa_r+0x9dc>
    9ad8:	00090613          	mv	a2,s2
    9adc:	00098693          	mv	a3,s3
    9ae0:	000b0513          	mv	a0,s6
    9ae4:	000a0593          	mv	a1,s4
    9ae8:	0c0040ef          	jal	dba8 <__divdf3>
    9aec:	4e9050ef          	jal	f7d4 <__fixdfsi>
    9af0:	00050d13          	mv	s10,a0
    9af4:	565050ef          	jal	f858 <__floatsidf>
    9af8:	00090613          	mv	a2,s2
    9afc:	00098693          	mv	a3,s3
    9b00:	3e9040ef          	jal	e6e8 <__muldf3>
    9b04:	00058693          	mv	a3,a1
    9b08:	00050613          	mv	a2,a0
    9b0c:	000a0593          	mv	a1,s4
    9b10:	000b0513          	mv	a0,s6
    9b14:	364050ef          	jal	ee78 <__subdf3>
    9b18:	001b8b93          	add	s7,s7,1
    9b1c:	030d0793          	add	a5,s10,48
    9b20:	001d8d93          	add	s11,s11,1
    9b24:	fefb8fa3          	sb	a5,-1(s7)
    9b28:	00050713          	mv	a4,a0
    9b2c:	00058693          	mv	a3,a1
    9b30:	07bc00e3          	beq	s8,s11,a390 <_dtoa_r+0x1238>
    9b34:	00012603          	lw	a2,0(sp)
    9b38:	00068593          	mv	a1,a3
    9b3c:	00412683          	lw	a3,4(sp)
    9b40:	00070513          	mv	a0,a4
    9b44:	3a5040ef          	jal	e6e8 <__muldf3>
    9b48:	00000613          	li	a2,0
    9b4c:	00000693          	li	a3,0
    9b50:	00050b13          	mv	s6,a0
    9b54:	00058a13          	mv	s4,a1
    9b58:	0fd040ef          	jal	e454 <__eqdf2>
    9b5c:	f6051ee3          	bnez	a0,9ad8 <_dtoa_r+0x980>
    9b60:	02012783          	lw	a5,32(sp)
    9b64:	000b8d13          	mv	s10,s7
    9b68:	00178a13          	add	s4,a5,1
    9b6c:	1c00006f          	j	9d2c <_dtoa_r+0xbd4>
    9b70:	02812703          	lw	a4,40(sp)
    9b74:	26071463          	bnez	a4,9ddc <_dtoa_r+0xc84>
    9b78:	03012b83          	lw	s7,48(sp)
    9b7c:	01012c83          	lw	s9,16(sp)
    9b80:	02012423          	sw	zero,40(sp)
    9b84:	00000913          	li	s2,0
    9b88:	020c8263          	beqz	s9,9bac <_dtoa_r+0xa54>
    9b8c:	03605063          	blez	s6,9bac <_dtoa_r+0xa54>
    9b90:	000c8793          	mv	a5,s9
    9b94:	679b4263          	blt	s6,s9,a1f8 <_dtoa_r+0x10a0>
    9b98:	01012703          	lw	a4,16(sp)
    9b9c:	40fc8cb3          	sub	s9,s9,a5
    9ba0:	40fb0b33          	sub	s6,s6,a5
    9ba4:	40f70733          	sub	a4,a4,a5
    9ba8:	00e12823          	sw	a4,16(sp)
    9bac:	03012783          	lw	a5,48(sp)
    9bb0:	02078263          	beqz	a5,9bd4 <_dtoa_r+0xa7c>
    9bb4:	02812783          	lw	a5,40(sp)
    9bb8:	00078463          	beqz	a5,9bc0 <_dtoa_r+0xa68>
    9bbc:	060b9ae3          	bnez	s7,a430 <_dtoa_r+0x12d8>
    9bc0:	03012603          	lw	a2,48(sp)
    9bc4:	00048593          	mv	a1,s1
    9bc8:	00040513          	mv	a0,s0
    9bcc:	3a4010ef          	jal	af70 <__pow5mult>
    9bd0:	00050493          	mv	s1,a0
    9bd4:	00100593          	li	a1,1
    9bd8:	00040513          	mv	a0,s0
    9bdc:	01c010ef          	jal	abf8 <__i2b>
    9be0:	00a12c23          	sw	a0,24(sp)
    9be4:	50099a63          	bnez	s3,a0f8 <_dtoa_r+0xfa0>
    9be8:	00100793          	li	a5,1
    9bec:	5547da63          	bge	a5,s4,a140 <_dtoa_r+0xfe8>
    9bf0:	016787b3          	add	a5,a5,s6
    9bf4:	01f7f793          	and	a5,a5,31
    9bf8:	1c078e63          	beqz	a5,9dd4 <_dtoa_r+0xc7c>
    9bfc:	02000713          	li	a4,32
    9c00:	40f70733          	sub	a4,a4,a5
    9c04:	00400693          	li	a3,4
    9c08:	58e6d263          	bge	a3,a4,a18c <_dtoa_r+0x1034>
    9c0c:	01c00713          	li	a4,28
    9c10:	40f707b3          	sub	a5,a4,a5
    9c14:	01012703          	lw	a4,16(sp)
    9c18:	00fc8cb3          	add	s9,s9,a5
    9c1c:	00fb0b33          	add	s6,s6,a5
    9c20:	00f70733          	add	a4,a4,a5
    9c24:	00e12823          	sw	a4,16(sp)
    9c28:	01012783          	lw	a5,16(sp)
    9c2c:	12f04e63          	bgtz	a5,9d68 <_dtoa_r+0xc10>
    9c30:	01605c63          	blez	s6,9c48 <_dtoa_r+0xaf0>
    9c34:	01812583          	lw	a1,24(sp)
    9c38:	000b0613          	mv	a2,s6
    9c3c:	00040513          	mv	a0,s0
    9c40:	480010ef          	jal	b0c0 <__lshift>
    9c44:	00a12c23          	sw	a0,24(sp)
    9c48:	03412783          	lw	a5,52(sp)
    9c4c:	12079a63          	bnez	a5,9d80 <_dtoa_r+0xc28>
    9c50:	45805263          	blez	s8,a094 <_dtoa_r+0xf3c>
    9c54:	02812783          	lw	a5,40(sp)
    9c58:	24079e63          	bnez	a5,9eb4 <_dtoa_r+0xd5c>
    9c5c:	02012783          	lw	a5,32(sp)
    9c60:	00178a13          	add	s4,a5,1
    9c64:	01812b03          	lw	s6,24(sp)
    9c68:	00100993          	li	s3,1
    9c6c:	0200006f          	j	9c8c <_dtoa_r+0xb34>
    9c70:	00048593          	mv	a1,s1
    9c74:	00000693          	li	a3,0
    9c78:	00a00613          	li	a2,10
    9c7c:	00040513          	mv	a0,s0
    9c80:	49d000ef          	jal	a91c <__multadd>
    9c84:	00050493          	mv	s1,a0
    9c88:	00198993          	add	s3,s3,1
    9c8c:	000b0593          	mv	a1,s6
    9c90:	00048513          	mv	a0,s1
    9c94:	a64ff0ef          	jal	8ef8 <quorem>
    9c98:	03050b93          	add	s7,a0,48
    9c9c:	013a87b3          	add	a5,s5,s3
    9ca0:	ff778fa3          	sb	s7,-1(a5)
    9ca4:	fd89c6e3          	blt	s3,s8,9c70 <_dtoa_r+0xb18>
    9ca8:	00100993          	li	s3,1
    9cac:	55804263          	bgtz	s8,a1f0 <_dtoa_r+0x1098>
    9cb0:	013a89b3          	add	s3,s5,s3
    9cb4:	00000c13          	li	s8,0
    9cb8:	00048593          	mv	a1,s1
    9cbc:	00100613          	li	a2,1
    9cc0:	00040513          	mv	a0,s0
    9cc4:	3fc010ef          	jal	b0c0 <__lshift>
    9cc8:	01812583          	lw	a1,24(sp)
    9ccc:	00050493          	mv	s1,a0
    9cd0:	580010ef          	jal	b250 <__mcmp>
    9cd4:	4ea05c63          	blez	a0,a1cc <_dtoa_r+0x1074>
    9cd8:	03900693          	li	a3,57
    9cdc:	0080006f          	j	9ce4 <_dtoa_r+0xb8c>
    9ce0:	5f3a8863          	beq	s5,s3,a2d0 <_dtoa_r+0x1178>
    9ce4:	fff9c783          	lbu	a5,-1(s3)
    9ce8:	00098d13          	mv	s10,s3
    9cec:	fff98993          	add	s3,s3,-1
    9cf0:	fed788e3          	beq	a5,a3,9ce0 <_dtoa_r+0xb88>
    9cf4:	00178793          	add	a5,a5,1
    9cf8:	00f98023          	sb	a5,0(s3)
    9cfc:	01812583          	lw	a1,24(sp)
    9d00:	00040513          	mv	a0,s0
    9d04:	3f5000ef          	jal	a8f8 <_Bfree>
    9d08:	02090263          	beqz	s2,9d2c <_dtoa_r+0xbd4>
    9d0c:	000c0a63          	beqz	s8,9d20 <_dtoa_r+0xbc8>
    9d10:	012c0863          	beq	s8,s2,9d20 <_dtoa_r+0xbc8>
    9d14:	000c0593          	mv	a1,s8
    9d18:	00040513          	mv	a0,s0
    9d1c:	3dd000ef          	jal	a8f8 <_Bfree>
    9d20:	00090593          	mv	a1,s2
    9d24:	00040513          	mv	a0,s0
    9d28:	3d1000ef          	jal	a8f8 <_Bfree>
    9d2c:	00048593          	mv	a1,s1
    9d30:	00040513          	mv	a0,s0
    9d34:	3c5000ef          	jal	a8f8 <_Bfree>
    9d38:	00c12783          	lw	a5,12(sp)
    9d3c:	000d0023          	sb	zero,0(s10)
    9d40:	0147a023          	sw	s4,0(a5)
    9d44:	00812783          	lw	a5,8(sp)
    9d48:	00078463          	beqz	a5,9d50 <_dtoa_r+0xbf8>
    9d4c:	01a7a023          	sw	s10,0(a5)
    9d50:	09012b03          	lw	s6,144(sp)
    9d54:	08c12b83          	lw	s7,140(sp)
    9d58:	08812c03          	lw	s8,136(sp)
    9d5c:	08412c83          	lw	s9,132(sp)
    9d60:	08012d03          	lw	s10,128(sp)
    9d64:	ce4ff06f          	j	9248 <_dtoa_r+0xf0>
    9d68:	00048593          	mv	a1,s1
    9d6c:	00078613          	mv	a2,a5
    9d70:	00040513          	mv	a0,s0
    9d74:	34c010ef          	jal	b0c0 <__lshift>
    9d78:	00050493          	mv	s1,a0
    9d7c:	eb5ff06f          	j	9c30 <_dtoa_r+0xad8>
    9d80:	01812583          	lw	a1,24(sp)
    9d84:	00048513          	mv	a0,s1
    9d88:	4c8010ef          	jal	b250 <__mcmp>
    9d8c:	ec0552e3          	bgez	a0,9c50 <_dtoa_r+0xaf8>
    9d90:	02012783          	lw	a5,32(sp)
    9d94:	00048593          	mv	a1,s1
    9d98:	00000693          	li	a3,0
    9d9c:	00a00613          	li	a2,10
    9da0:	00040513          	mv	a0,s0
    9da4:	fff78b13          	add	s6,a5,-1
    9da8:	375000ef          	jal	a91c <__multadd>
    9dac:	02812783          	lw	a5,40(sp)
    9db0:	00050493          	mv	s1,a0
    9db4:	0c079e63          	bnez	a5,9e90 <_dtoa_r+0xd38>
    9db8:	03c12c03          	lw	s8,60(sp)
    9dbc:	17805ee3          	blez	s8,a738 <_dtoa_r+0x15e0>
    9dc0:	02012a03          	lw	s4,32(sp)
    9dc4:	ea1ff06f          	j	9c64 <_dtoa_r+0xb0c>
    9dc8:	00100793          	li	a5,1
    9dcc:	02f12a23          	sw	a5,52(sp)
    9dd0:	e28ff06f          	j	93f8 <_dtoa_r+0x2a0>
    9dd4:	01c00793          	li	a5,28
    9dd8:	e3dff06f          	j	9c14 <_dtoa_r+0xabc>
    9ddc:	00100713          	li	a4,1
    9de0:	4d475463          	bge	a4,s4,a2a8 <_dtoa_r+0x1150>
    9de4:	03012783          	lw	a5,48(sp)
    9de8:	fffc0b93          	add	s7,s8,-1
    9dec:	4177ca63          	blt	a5,s7,a200 <_dtoa_r+0x10a8>
    9df0:	41778bb3          	sub	s7,a5,s7
    9df4:	01012783          	lw	a5,16(sp)
    9df8:	41878cb3          	sub	s9,a5,s8
    9dfc:	100c54e3          	bgez	s8,a704 <_dtoa_r+0x15ac>
    9e00:	00100593          	li	a1,1
    9e04:	00040513          	mv	a0,s0
    9e08:	5f1000ef          	jal	abf8 <__i2b>
    9e0c:	00050913          	mv	s2,a0
    9e10:	d79ff06f          	j	9b88 <_dtoa_r+0xa30>
    9e14:	02012a23          	sw	zero,52(sp)
    9e18:	00012823          	sw	zero,16(sp)
    9e1c:	ab5042e3          	bgtz	s5,98c0 <_dtoa_r+0x768>
    9e20:	00100793          	li	a5,1
    9e24:	415787b3          	sub	a5,a5,s5
    9e28:	00f12823          	sw	a5,16(sp)
    9e2c:	00000b13          	li	s6,0
    9e30:	a91ff06f          	j	98c0 <_dtoa_r+0x768>
    9e34:	40e787b3          	sub	a5,a5,a4
    9e38:	00fd9533          	sll	a0,s11,a5
    9e3c:	ca0ff06f          	j	92dc <_dtoa_r+0x184>
    9e40:	00300793          	li	a5,3
    9e44:	00100913          	li	s2,1
    9e48:	44fa0c63          	beq	s4,a5,a2a0 <_dtoa_r+0x1148>
    9e4c:	df47cc63          	blt	a5,s4,9444 <_dtoa_r+0x2ec>
    9e50:	00200793          	li	a5,2
    9e54:	18fa00e3          	beq	s4,a5,a7d4 <_dtoa_r+0x167c>
    9e58:	02042e23          	sw	zero,60(s0)
    9e5c:	00000593          	li	a1,0
    9e60:	00040513          	mv	a0,s0
    9e64:	1e1000ef          	jal	a844 <_Balloc>
    9e68:	00050a93          	mv	s5,a0
    9e6c:	140500e3          	beqz	a0,a7ac <_dtoa_r+0x1654>
    9e70:	00100793          	li	a5,1
    9e74:	02f12423          	sw	a5,40(sp)
    9e78:	fff00793          	li	a5,-1
    9e7c:	02a42c23          	sw	a0,56(s0)
    9e80:	02f12e23          	sw	a5,60(sp)
    9e84:	fff00c13          	li	s8,-1
    9e88:	00012a23          	sw	zero,20(sp)
    9e8c:	b35ff06f          	j	99c0 <_dtoa_r+0x868>
    9e90:	00090593          	mv	a1,s2
    9e94:	00000693          	li	a3,0
    9e98:	00a00613          	li	a2,10
    9e9c:	00040513          	mv	a0,s0
    9ea0:	27d000ef          	jal	a91c <__multadd>
    9ea4:	03c12c03          	lw	s8,60(sp)
    9ea8:	00050913          	mv	s2,a0
    9eac:	0b805ae3          	blez	s8,a760 <_dtoa_r+0x1608>
    9eb0:	03612023          	sw	s6,32(sp)
    9eb4:	01905c63          	blez	s9,9ecc <_dtoa_r+0xd74>
    9eb8:	00090593          	mv	a1,s2
    9ebc:	000c8613          	mv	a2,s9
    9ec0:	00040513          	mv	a0,s0
    9ec4:	1fc010ef          	jal	b0c0 <__lshift>
    9ec8:	00050913          	mv	s2,a0
    9ecc:	00090b13          	mv	s6,s2
    9ed0:	50099e63          	bnez	s3,a3ec <_dtoa_r+0x1294>
    9ed4:	02412783          	lw	a5,36(sp)
    9ed8:	fffa8d13          	add	s10,s5,-1
    9edc:	000a8c93          	mv	s9,s5
    9ee0:	01512823          	sw	s5,16(sp)
    9ee4:	01812a83          	lw	s5,24(sp)
    9ee8:	0017f793          	and	a5,a5,1
    9eec:	018d0d33          	add	s10,s10,s8
    9ef0:	00f12023          	sw	a5,0(sp)
    9ef4:	01b12a23          	sw	s11,20(sp)
    9ef8:	000a8593          	mv	a1,s5
    9efc:	00048513          	mv	a0,s1
    9f00:	ff9fe0ef          	jal	8ef8 <quorem>
    9f04:	00050c13          	mv	s8,a0
    9f08:	00090593          	mv	a1,s2
    9f0c:	00048513          	mv	a0,s1
    9f10:	340010ef          	jal	b250 <__mcmp>
    9f14:	00050993          	mv	s3,a0
    9f18:	000b0613          	mv	a2,s6
    9f1c:	000a8593          	mv	a1,s5
    9f20:	00040513          	mv	a0,s0
    9f24:	384010ef          	jal	b2a8 <__mdiff>
    9f28:	00c52703          	lw	a4,12(a0)
    9f2c:	030c0b93          	add	s7,s8,48
    9f30:	00050d93          	mv	s11,a0
    9f34:	08071c63          	bnez	a4,9fcc <_dtoa_r+0xe74>
    9f38:	00050593          	mv	a1,a0
    9f3c:	00048513          	mv	a0,s1
    9f40:	310010ef          	jal	b250 <__mcmp>
    9f44:	00050713          	mv	a4,a0
    9f48:	000d8593          	mv	a1,s11
    9f4c:	00040513          	mv	a0,s0
    9f50:	00070d93          	mv	s11,a4
    9f54:	1a5000ef          	jal	a8f8 <_Bfree>
    9f58:	014de6b3          	or	a3,s11,s4
    9f5c:	0e069a63          	bnez	a3,a050 <_dtoa_r+0xef8>
    9f60:	00012783          	lw	a5,0(sp)
    9f64:	76078e63          	beqz	a5,a6e0 <_dtoa_r+0x1588>
    9f68:	7809c663          	bltz	s3,a6f4 <_dtoa_r+0x159c>
    9f6c:	017c8023          	sb	s7,0(s9)
    9f70:	001c8993          	add	s3,s9,1
    9f74:	679d0e63          	beq	s10,s9,a5f0 <_dtoa_r+0x1498>
    9f78:	00048593          	mv	a1,s1
    9f7c:	00000693          	li	a3,0
    9f80:	00a00613          	li	a2,10
    9f84:	00040513          	mv	a0,s0
    9f88:	195000ef          	jal	a91c <__multadd>
    9f8c:	00050493          	mv	s1,a0
    9f90:	00000693          	li	a3,0
    9f94:	00a00613          	li	a2,10
    9f98:	00090593          	mv	a1,s2
    9f9c:	00040513          	mv	a0,s0
    9fa0:	09690e63          	beq	s2,s6,a03c <_dtoa_r+0xee4>
    9fa4:	179000ef          	jal	a91c <__multadd>
    9fa8:	000b0593          	mv	a1,s6
    9fac:	00050913          	mv	s2,a0
    9fb0:	00000693          	li	a3,0
    9fb4:	00a00613          	li	a2,10
    9fb8:	00040513          	mv	a0,s0
    9fbc:	161000ef          	jal	a91c <__multadd>
    9fc0:	00050b13          	mv	s6,a0
    9fc4:	00098c93          	mv	s9,s3
    9fc8:	f31ff06f          	j	9ef8 <_dtoa_r+0xda0>
    9fcc:	00050593          	mv	a1,a0
    9fd0:	00040513          	mv	a0,s0
    9fd4:	01012a83          	lw	s5,16(sp)
    9fd8:	01412d83          	lw	s11,20(sp)
    9fdc:	11d000ef          	jal	a8f8 <_Bfree>
    9fe0:	0009ca63          	bltz	s3,9ff4 <_dtoa_r+0xe9c>
    9fe4:	001df713          	and	a4,s11,1
    9fe8:	0149e9b3          	or	s3,s3,s4
    9fec:	01376733          	or	a4,a4,s3
    9ff0:	06071e63          	bnez	a4,a06c <_dtoa_r+0xf14>
    9ff4:	00048593          	mv	a1,s1
    9ff8:	00100613          	li	a2,1
    9ffc:	00040513          	mv	a0,s0
    a000:	0c0010ef          	jal	b0c0 <__lshift>
    a004:	01812583          	lw	a1,24(sp)
    a008:	00050493          	mv	s1,a0
    a00c:	244010ef          	jal	b250 <__mcmp>
    a010:	24a05863          	blez	a0,a260 <_dtoa_r+0x1108>
    a014:	03900713          	li	a4,57
    a018:	24eb8c63          	beq	s7,a4,a270 <_dtoa_r+0x1118>
    a01c:	031c0b93          	add	s7,s8,49
    a020:	02012783          	lw	a5,32(sp)
    a024:	00090c13          	mv	s8,s2
    a028:	001c8d13          	add	s10,s9,1
    a02c:	017c8023          	sb	s7,0(s9)
    a030:	00178a13          	add	s4,a5,1
    a034:	000b0913          	mv	s2,s6
    a038:	cc5ff06f          	j	9cfc <_dtoa_r+0xba4>
    a03c:	0e1000ef          	jal	a91c <__multadd>
    a040:	00050913          	mv	s2,a0
    a044:	00050b13          	mv	s6,a0
    a048:	00098c93          	mv	s9,s3
    a04c:	eadff06f          	j	9ef8 <_dtoa_r+0xda0>
    a050:	7409c863          	bltz	s3,a7a0 <_dtoa_r+0x1648>
    a054:	00012783          	lw	a5,0(sp)
    a058:	0149e9b3          	or	s3,s3,s4
    a05c:	0137e9b3          	or	s3,a5,s3
    a060:	74098063          	beqz	s3,a7a0 <_dtoa_r+0x1648>
    a064:	f1b054e3          	blez	s11,9f6c <_dtoa_r+0xe14>
    a068:	01012a83          	lw	s5,16(sp)
    a06c:	03900713          	li	a4,57
    a070:	20eb8063          	beq	s7,a4,a270 <_dtoa_r+0x1118>
    a074:	02012703          	lw	a4,32(sp)
    a078:	001b8793          	add	a5,s7,1
    a07c:	00090c13          	mv	s8,s2
    a080:	001c8d13          	add	s10,s9,1
    a084:	00170a13          	add	s4,a4,1
    a088:	00fc8023          	sb	a5,0(s9)
    a08c:	000b0913          	mv	s2,s6
    a090:	c6dff06f          	j	9cfc <_dtoa_r+0xba4>
    a094:	00200793          	li	a5,2
    a098:	bb47dee3          	bge	a5,s4,9c54 <_dtoa_r+0xafc>
    a09c:	000a8d13          	mv	s10,s5
    a0a0:	9a0c10e3          	bnez	s8,9a40 <_dtoa_r+0x8e8>
    a0a4:	01812583          	lw	a1,24(sp)
    a0a8:	00000693          	li	a3,0
    a0ac:	00500613          	li	a2,5
    a0b0:	00040513          	mv	a0,s0
    a0b4:	069000ef          	jal	a91c <__multadd>
    a0b8:	00050593          	mv	a1,a0
    a0bc:	00a12c23          	sw	a0,24(sp)
    a0c0:	00048513          	mv	a0,s1
    a0c4:	18c010ef          	jal	b250 <__mcmp>
    a0c8:	96a05ce3          	blez	a0,9a40 <_dtoa_r+0x8e8>
    a0cc:	03100793          	li	a5,49
    a0d0:	00fa8023          	sb	a5,0(s5)
    a0d4:	02012783          	lw	a5,32(sp)
    a0d8:	001a8d13          	add	s10,s5,1
    a0dc:	00178a13          	add	s4,a5,1
    a0e0:	01812583          	lw	a1,24(sp)
    a0e4:	00040513          	mv	a0,s0
    a0e8:	001a0a13          	add	s4,s4,1
    a0ec:	00d000ef          	jal	a8f8 <_Bfree>
    a0f0:	c20918e3          	bnez	s2,9d20 <_dtoa_r+0xbc8>
    a0f4:	c39ff06f          	j	9d2c <_dtoa_r+0xbd4>
    a0f8:	00050593          	mv	a1,a0
    a0fc:	00098613          	mv	a2,s3
    a100:	00040513          	mv	a0,s0
    a104:	66d000ef          	jal	af70 <__pow5mult>
    a108:	00100793          	li	a5,1
    a10c:	00a12c23          	sw	a0,24(sp)
    a110:	1147de63          	bge	a5,s4,a22c <_dtoa_r+0x10d4>
    a114:	00000993          	li	s3,0
    a118:	01812703          	lw	a4,24(sp)
    a11c:	01072783          	lw	a5,16(a4)
    a120:	00378793          	add	a5,a5,3
    a124:	00279793          	sll	a5,a5,0x2
    a128:	00f707b3          	add	a5,a4,a5
    a12c:	0047a503          	lw	a0,4(a5)
    a130:	171000ef          	jal	aaa0 <__hi0bits>
    a134:	02000793          	li	a5,32
    a138:	40a787b3          	sub	a5,a5,a0
    a13c:	ab5ff06f          	j	9bf0 <_dtoa_r+0xa98>
    a140:	02412783          	lw	a5,36(sp)
    a144:	04079063          	bnez	a5,a184 <_dtoa_r+0x102c>
    a148:	00012783          	lw	a5,0(sp)
    a14c:	00c79793          	sll	a5,a5,0xc
    a150:	02079a63          	bnez	a5,a184 <_dtoa_r+0x102c>
    a154:	00012683          	lw	a3,0(sp)
    a158:	00000793          	li	a5,0
    a15c:	0146d713          	srl	a4,a3,0x14
    a160:	7ff77713          	and	a4,a4,2047
    a164:	00070c63          	beqz	a4,a17c <_dtoa_r+0x1024>
    a168:	01012783          	lw	a5,16(sp)
    a16c:	001b0b13          	add	s6,s6,1
    a170:	00178793          	add	a5,a5,1
    a174:	00f12823          	sw	a5,16(sp)
    a178:	00100793          	li	a5,1
    a17c:	58099063          	bnez	s3,a6fc <_dtoa_r+0x15a4>
    a180:	00078993          	mv	s3,a5
    a184:	00100793          	li	a5,1
    a188:	a69ff06f          	j	9bf0 <_dtoa_r+0xa98>
    a18c:	a8d70ee3          	beq	a4,a3,9c28 <_dtoa_r+0xad0>
    a190:	03c00713          	li	a4,60
    a194:	40f707b3          	sub	a5,a4,a5
    a198:	a7dff06f          	j	9c14 <_dtoa_r+0xabc>
    a19c:	00100793          	li	a5,1
    a1a0:	00500a13          	li	s4,5
    a1a4:	02f12423          	sw	a5,40(sp)
    a1a8:	01412783          	lw	a5,20(sp)
    a1ac:	02012703          	lw	a4,32(sp)
    a1b0:	00e787b3          	add	a5,a5,a4
    a1b4:	00178c13          	add	s8,a5,1
    a1b8:	02f12e23          	sw	a5,60(sp)
    a1bc:	000c0613          	mv	a2,s8
    a1c0:	ab804263          	bgtz	s8,9464 <_dtoa_r+0x30c>
    a1c4:	00100613          	li	a2,1
    a1c8:	a9cff06f          	j	9464 <_dtoa_r+0x30c>
    a1cc:	00051663          	bnez	a0,a1d8 <_dtoa_r+0x1080>
    a1d0:	001bf793          	and	a5,s7,1
    a1d4:	b00792e3          	bnez	a5,9cd8 <_dtoa_r+0xb80>
    a1d8:	03000693          	li	a3,48
    a1dc:	fff9c783          	lbu	a5,-1(s3)
    a1e0:	00098d13          	mv	s10,s3
    a1e4:	fff98993          	add	s3,s3,-1
    a1e8:	fed78ae3          	beq	a5,a3,a1dc <_dtoa_r+0x1084>
    a1ec:	b11ff06f          	j	9cfc <_dtoa_r+0xba4>
    a1f0:	000c0993          	mv	s3,s8
    a1f4:	abdff06f          	j	9cb0 <_dtoa_r+0xb58>
    a1f8:	000b0793          	mv	a5,s6
    a1fc:	99dff06f          	j	9b98 <_dtoa_r+0xa40>
    a200:	03012783          	lw	a5,48(sp)
    a204:	01012703          	lw	a4,16(sp)
    a208:	03712823          	sw	s7,48(sp)
    a20c:	40fb87b3          	sub	a5,s7,a5
    a210:	00f989b3          	add	s3,s3,a5
    a214:	018707b3          	add	a5,a4,s8
    a218:	00070c93          	mv	s9,a4
    a21c:	018b0b33          	add	s6,s6,s8
    a220:	00f12823          	sw	a5,16(sp)
    a224:	00000b93          	li	s7,0
    a228:	bd9ff06f          	j	9e00 <_dtoa_r+0xca8>
    a22c:	02412783          	lw	a5,36(sp)
    a230:	ee0792e3          	bnez	a5,a114 <_dtoa_r+0xfbc>
    a234:	00012783          	lw	a5,0(sp)
    a238:	00c79793          	sll	a5,a5,0xc
    a23c:	ec079ce3          	bnez	a5,a114 <_dtoa_r+0xfbc>
    a240:	f15ff06f          	j	a154 <_dtoa_r+0xffc>
    a244:	01812303          	lw	t1,24(sp)
    a248:	01c12d03          	lw	s10,28(sp)
    a24c:	00200913          	li	s2,2
    a250:	ad0ff06f          	j	9520 <_dtoa_r+0x3c8>
    a254:	00200a13          	li	s4,2
    a258:	02012423          	sw	zero,40(sp)
    a25c:	9f8ff06f          	j	9454 <_dtoa_r+0x2fc>
    a260:	dc0510e3          	bnez	a0,a020 <_dtoa_r+0xec8>
    a264:	001bf713          	and	a4,s7,1
    a268:	da0716e3          	bnez	a4,a014 <_dtoa_r+0xebc>
    a26c:	db5ff06f          	j	a020 <_dtoa_r+0xec8>
    a270:	03900793          	li	a5,57
    a274:	00fc8023          	sb	a5,0(s9)
    a278:	02012783          	lw	a5,32(sp)
    a27c:	00090c13          	mv	s8,s2
    a280:	001c8993          	add	s3,s9,1
    a284:	00178a13          	add	s4,a5,1
    a288:	000b0913          	mv	s2,s6
    a28c:	a4dff06f          	j	9cd8 <_dtoa_r+0xb80>
    a290:	00100793          	li	a5,1
    a294:	00100c13          	li	s8,1
    a298:	00f12a23          	sw	a5,20(sp)
    a29c:	e50ff06f          	j	98ec <_dtoa_r+0x794>
    a2a0:	02012423          	sw	zero,40(sp)
    a2a4:	f05ff06f          	j	a1a8 <_dtoa_r+0x1050>
    a2a8:	03812703          	lw	a4,56(sp)
    a2ac:	30070e63          	beqz	a4,a5c8 <_dtoa_r+0x1470>
    a2b0:	01012703          	lw	a4,16(sp)
    a2b4:	43378793          	add	a5,a5,1075
    a2b8:	00fb0b33          	add	s6,s6,a5
    a2bc:	00f707b3          	add	a5,a4,a5
    a2c0:	03012b83          	lw	s7,48(sp)
    a2c4:	00070c93          	mv	s9,a4
    a2c8:	00f12823          	sw	a5,16(sp)
    a2cc:	b35ff06f          	j	9e00 <_dtoa_r+0xca8>
    a2d0:	03100793          	li	a5,49
    a2d4:	00fa8023          	sb	a5,0(s5)
    a2d8:	001a0a13          	add	s4,s4,1
    a2dc:	a21ff06f          	j	9cfc <_dtoa_r+0xba4>
    a2e0:	02012783          	lw	a5,32(sp)
    a2e4:	32078263          	beqz	a5,a608 <_dtoa_r+0x14b0>
    a2e8:	40f00bb3          	neg	s7,a5
    a2ec:	00fbf713          	and	a4,s7,15
    a2f0:	00371713          	sll	a4,a4,0x3
    a2f4:	00006797          	auipc	a5,0x6
    a2f8:	66478793          	add	a5,a5,1636 # 10958 <__mprec_tens>
    a2fc:	00e787b3          	add	a5,a5,a4
    a300:	0007a603          	lw	a2,0(a5)
    a304:	0047a683          	lw	a3,4(a5)
    a308:	01812503          	lw	a0,24(sp)
    a30c:	01c12583          	lw	a1,28(sp)
    a310:	404bdb93          	sra	s7,s7,0x4
    a314:	3d4040ef          	jal	e6e8 <__muldf3>
    a318:	00058d13          	mv	s10,a1
    a31c:	440b8c63          	beqz	s7,a774 <_dtoa_r+0x161c>
    a320:	00200913          	li	s2,2
    a324:	04812023          	sw	s0,64(sp)
    a328:	00006c97          	auipc	s9,0x6
    a32c:	608c8c93          	add	s9,s9,1544 # 10930 <__mprec_bigtens>
    a330:	00090413          	mv	s0,s2
    a334:	00050713          	mv	a4,a0
    a338:	00000613          	li	a2,0
    a33c:	00050913          	mv	s2,a0
    a340:	001bf693          	and	a3,s7,1
    a344:	02068063          	beqz	a3,a364 <_dtoa_r+0x120c>
    a348:	000ca603          	lw	a2,0(s9)
    a34c:	004ca683          	lw	a3,4(s9)
    a350:	00070513          	mv	a0,a4
    a354:	00140413          	add	s0,s0,1
    a358:	390040ef          	jal	e6e8 <__muldf3>
    a35c:	00050713          	mv	a4,a0
    a360:	00100613          	li	a2,1
    a364:	401bdb93          	sra	s7,s7,0x1
    a368:	008c8c93          	add	s9,s9,8
    a36c:	fc0b9ae3          	bnez	s7,a340 <_dtoa_r+0x11e8>
    a370:	00090513          	mv	a0,s2
    a374:	00058793          	mv	a5,a1
    a378:	00040913          	mv	s2,s0
    a37c:	04012403          	lw	s0,64(sp)
    a380:	a0061a63          	bnez	a2,9594 <_dtoa_r+0x43c>
    a384:	00050713          	mv	a4,a0
    a388:	000d0793          	mv	a5,s10
    a38c:	a08ff06f          	j	9594 <_dtoa_r+0x43c>
    a390:	00068593          	mv	a1,a3
    a394:	00070613          	mv	a2,a4
    a398:	00070513          	mv	a0,a4
    a39c:	745020ef          	jal	d2e0 <__adddf3>
    a3a0:	02012783          	lw	a5,32(sp)
    a3a4:	00090613          	mv	a2,s2
    a3a8:	00098693          	mv	a3,s3
    a3ac:	00178a13          	add	s4,a5,1
    a3b0:	00050c93          	mv	s9,a0
    a3b4:	00058b13          	mv	s6,a1
    a3b8:	000a0c13          	mv	s8,s4
    a3bc:	124040ef          	jal	e4e0 <__gedf2>
    a3c0:	c4a04863          	bgtz	a0,9810 <_dtoa_r+0x6b8>
    a3c4:	000c8513          	mv	a0,s9
    a3c8:	000b0593          	mv	a1,s6
    a3cc:	00090613          	mv	a2,s2
    a3d0:	00098693          	mv	a3,s3
    a3d4:	080040ef          	jal	e454 <__eqdf2>
    a3d8:	00051663          	bnez	a0,a3e4 <_dtoa_r+0x128c>
    a3dc:	001d7d13          	and	s10,s10,1
    a3e0:	c20d1863          	bnez	s10,9810 <_dtoa_r+0x6b8>
    a3e4:	000b8d13          	mv	s10,s7
    a3e8:	945ff06f          	j	9d2c <_dtoa_r+0xbd4>
    a3ec:	00492583          	lw	a1,4(s2)
    a3f0:	00040513          	mv	a0,s0
    a3f4:	450000ef          	jal	a844 <_Balloc>
    a3f8:	00050993          	mv	s3,a0
    a3fc:	38050463          	beqz	a0,a784 <_dtoa_r+0x162c>
    a400:	01092603          	lw	a2,16(s2)
    a404:	00c90593          	add	a1,s2,12
    a408:	00c50513          	add	a0,a0,12
    a40c:	00260613          	add	a2,a2,2
    a410:	00261613          	sll	a2,a2,0x2
    a414:	ccdf70ef          	jal	20e0 <memcpy>
    a418:	00100613          	li	a2,1
    a41c:	00098593          	mv	a1,s3
    a420:	00040513          	mv	a0,s0
    a424:	49d000ef          	jal	b0c0 <__lshift>
    a428:	00050b13          	mv	s6,a0
    a42c:	aa9ff06f          	j	9ed4 <_dtoa_r+0xd7c>
    a430:	00090593          	mv	a1,s2
    a434:	000b8613          	mv	a2,s7
    a438:	00040513          	mv	a0,s0
    a43c:	335000ef          	jal	af70 <__pow5mult>
    a440:	00048613          	mv	a2,s1
    a444:	00050593          	mv	a1,a0
    a448:	00050913          	mv	s2,a0
    a44c:	00040513          	mv	a0,s0
    a450:	059000ef          	jal	aca8 <__multiply>
    a454:	00050793          	mv	a5,a0
    a458:	00048593          	mv	a1,s1
    a45c:	00040513          	mv	a0,s0
    a460:	00078493          	mv	s1,a5
    a464:	494000ef          	jal	a8f8 <_Bfree>
    a468:	03012783          	lw	a5,48(sp)
    a46c:	417787b3          	sub	a5,a5,s7
    a470:	02f12823          	sw	a5,48(sp)
    a474:	f6078063          	beqz	a5,9bd4 <_dtoa_r+0xa7c>
    a478:	f48ff06f          	j	9bc0 <_dtoa_r+0xa68>
    a47c:	05012603          	lw	a2,80(sp)
    a480:	05412683          	lw	a3,84(sp)
    a484:	05812503          	lw	a0,88(sp)
    a488:	04b12623          	sw	a1,76(sp)
    a48c:	000b8593          	mv	a1,s7
    a490:	02612423          	sw	t1,40(sp)
    a494:	254040ef          	jal	e6e8 <__muldf3>
    a498:	02812303          	lw	t1,40(sp)
    a49c:	04812783          	lw	a5,72(sp)
    a4a0:	00100693          	li	a3,1
    a4a4:	006a8023          	sb	t1,0(s5)
    a4a8:	02a12c23          	sw	a0,56(sp)
    a4ac:	04c12883          	lw	a7,76(sp)
    a4b0:	00058913          	mv	s2,a1
    a4b4:	00fa8bb3          	add	s7,s5,a5
    a4b8:	7fff6617          	auipc	a2,0x7fff6
    a4bc:	23860613          	add	a2,a2,568 # 800006f0 <__global_locale+0x1bc>
    a4c0:	28d78c63          	beq	a5,a3,a758 <_dtoa_r+0x1600>
    a4c4:	00062783          	lw	a5,0(a2)
    a4c8:	00462803          	lw	a6,4(a2)
    a4cc:	04912423          	sw	s1,72(sp)
    a4d0:	02f12423          	sw	a5,40(sp)
    a4d4:	03012623          	sw	a6,44(sp)
    a4d8:	04812623          	sw	s0,76(sp)
    a4dc:	000c8513          	mv	a0,s9
    a4e0:	00088593          	mv	a1,a7
    a4e4:	02812603          	lw	a2,40(sp)
    a4e8:	02c12683          	lw	a3,44(sp)
    a4ec:	001d0d13          	add	s10,s10,1
    a4f0:	1f8040ef          	jal	e6e8 <__muldf3>
    a4f4:	00058413          	mv	s0,a1
    a4f8:	00050493          	mv	s1,a0
    a4fc:	2d8050ef          	jal	f7d4 <__fixdfsi>
    a500:	00050c93          	mv	s9,a0
    a504:	354050ef          	jal	f858 <__floatsidf>
    a508:	00050613          	mv	a2,a0
    a50c:	00058693          	mv	a3,a1
    a510:	00048513          	mv	a0,s1
    a514:	00040593          	mv	a1,s0
    a518:	030c8c93          	add	s9,s9,48
    a51c:	15d040ef          	jal	ee78 <__subdf3>
    a520:	ff9d0fa3          	sb	s9,-1(s10)
    a524:	fdab90e3          	bne	s7,s10,a4e4 <_dtoa_r+0x138c>
    a528:	04812483          	lw	s1,72(sp)
    a52c:	04c12403          	lw	s0,76(sp)
    a530:	00050c93          	mv	s9,a0
    a534:	00058893          	mv	a7,a1
    a538:	7fff6d17          	auipc	s10,0x7fff6
    a53c:	180d0d13          	add	s10,s10,384 # 800006b8 <__global_locale+0x184>
    a540:	000d2603          	lw	a2,0(s10)
    a544:	004d2683          	lw	a3,4(s10)
    a548:	03812503          	lw	a0,56(sp)
    a54c:	00090593          	mv	a1,s2
    a550:	03112423          	sw	a7,40(sp)
    a554:	58d020ef          	jal	d2e0 <__adddf3>
    a558:	02812883          	lw	a7,40(sp)
    a55c:	000c8613          	mv	a2,s9
    a560:	00088693          	mv	a3,a7
    a564:	07c040ef          	jal	e5e0 <__ledf2>
    a568:	1a054863          	bltz	a0,a718 <_dtoa_r+0x15c0>
    a56c:	03812603          	lw	a2,56(sp)
    a570:	000d2503          	lw	a0,0(s10)
    a574:	004d2583          	lw	a1,4(s10)
    a578:	00090693          	mv	a3,s2
    a57c:	0fd040ef          	jal	ee78 <__subdf3>
    a580:	02812883          	lw	a7,40(sp)
    a584:	000c8613          	mv	a2,s9
    a588:	00088693          	mv	a3,a7
    a58c:	755030ef          	jal	e4e0 <__gedf2>
    a590:	12a04863          	bgtz	a0,a6c0 <_dtoa_r+0x1568>
    a594:	06c12783          	lw	a5,108(sp)
    a598:	de07c063          	bltz	a5,9b78 <_dtoa_r+0xa20>
    a59c:	02012703          	lw	a4,32(sp)
    a5a0:	00e00793          	li	a5,14
    a5a4:	dce7ca63          	blt	a5,a4,9b78 <_dtoa_r+0xa20>
    a5a8:	02012783          	lw	a5,32(sp)
    a5ac:	00006717          	auipc	a4,0x6
    a5b0:	3ac70713          	add	a4,a4,940 # 10958 <__mprec_tens>
    a5b4:	00379793          	sll	a5,a5,0x3
    a5b8:	00f707b3          	add	a5,a4,a5
    a5bc:	0007a903          	lw	s2,0(a5)
    a5c0:	0047a983          	lw	s3,4(a5)
    a5c4:	c90ff06f          	j	9a54 <_dtoa_r+0x8fc>
    a5c8:	06812703          	lw	a4,104(sp)
    a5cc:	01012683          	lw	a3,16(sp)
    a5d0:	03600793          	li	a5,54
    a5d4:	40e787b3          	sub	a5,a5,a4
    a5d8:	00fb0b33          	add	s6,s6,a5
    a5dc:	00f687b3          	add	a5,a3,a5
    a5e0:	03012b83          	lw	s7,48(sp)
    a5e4:	00068c93          	mv	s9,a3
    a5e8:	00f12823          	sw	a5,16(sp)
    a5ec:	815ff06f          	j	9e00 <_dtoa_r+0xca8>
    a5f0:	02012783          	lw	a5,32(sp)
    a5f4:	00090c13          	mv	s8,s2
    a5f8:	01012a83          	lw	s5,16(sp)
    a5fc:	00178a13          	add	s4,a5,1
    a600:	000b0913          	mv	s2,s6
    a604:	eb4ff06f          	j	9cb8 <_dtoa_r+0xb60>
    a608:	01812703          	lw	a4,24(sp)
    a60c:	01c12783          	lw	a5,28(sp)
    a610:	00200913          	li	s2,2
    a614:	f81fe06f          	j	9594 <_dtoa_r+0x43c>
    a618:	b00c0063          	beqz	s8,9918 <_dtoa_r+0x7c0>
    a61c:	03c12d03          	lw	s10,60(sp)
    a620:	bba05063          	blez	s10,99c0 <_dtoa_r+0x868>
    a624:	7fff6617          	auipc	a2,0x7fff6
    a628:	0cc60613          	add	a2,a2,204 # 800006f0 <__global_locale+0x1bc>
    a62c:	00078593          	mv	a1,a5
    a630:	02012783          	lw	a5,32(sp)
    a634:	00462683          	lw	a3,4(a2)
    a638:	00062603          	lw	a2,0(a2)
    a63c:	fff78793          	add	a5,a5,-1
    a640:	00070513          	mv	a0,a4
    a644:	04f12e23          	sw	a5,92(sp)
    a648:	0a0040ef          	jal	e6e8 <__muldf3>
    a64c:	00050713          	mv	a4,a0
    a650:	00190513          	add	a0,s2,1
    a654:	04e12423          	sw	a4,72(sp)
    a658:	04b12023          	sw	a1,64(sp)
    a65c:	1fc050ef          	jal	f858 <__floatsidf>
    a660:	04812703          	lw	a4,72(sp)
    a664:	04012783          	lw	a5,64(sp)
    a668:	00070613          	mv	a2,a4
    a66c:	00078693          	mv	a3,a5
    a670:	04e12623          	sw	a4,76(sp)
    a674:	074040ef          	jal	e6e8 <__muldf3>
    a678:	7fff6697          	auipc	a3,0x7fff6
    a67c:	08068693          	add	a3,a3,128 # 800006f8 <__global_locale+0x1c4>
    a680:	0006a603          	lw	a2,0(a3)
    a684:	0046a683          	lw	a3,4(a3)
    a688:	459020ef          	jal	d2e0 <__adddf3>
    a68c:	fcc006b7          	lui	a3,0xfcc00
    a690:	04012783          	lw	a5,64(sp)
    a694:	04c12703          	lw	a4,76(sp)
    a698:	00050c93          	mv	s9,a0
    a69c:	00b68bb3          	add	s7,a3,a1
    a6a0:	05a12423          	sw	s10,72(sp)
    a6a4:	f91fe06f          	j	9634 <_dtoa_r+0x4dc>
    a6a8:	03100693          	li	a3,49
    a6ac:	001c0c13          	add	s8,s8,1
    a6b0:	984ff06f          	j	9834 <_dtoa_r+0x6dc>
    a6b4:	00012c23          	sw	zero,24(sp)
    a6b8:	00000913          	li	s2,0
    a6bc:	a11ff06f          	j	a0cc <_dtoa_r+0xf74>
    a6c0:	03000613          	li	a2,48
    a6c4:	fffbc783          	lbu	a5,-1(s7)
    a6c8:	000b8d13          	mv	s10,s7
    a6cc:	fffb8b93          	add	s7,s7,-1
    a6d0:	fec78ae3          	beq	a5,a2,a6c4 <_dtoa_r+0x156c>
    a6d4:	05c12783          	lw	a5,92(sp)
    a6d8:	00178a13          	add	s4,a5,1
    a6dc:	e50ff06f          	j	9d2c <_dtoa_r+0xbd4>
    a6e0:	03900713          	li	a4,57
    a6e4:	01012a83          	lw	s5,16(sp)
    a6e8:	b8eb84e3          	beq	s7,a4,a270 <_dtoa_r+0x1118>
    a6ec:	933048e3          	bgtz	s3,a01c <_dtoa_r+0xec4>
    a6f0:	931ff06f          	j	a020 <_dtoa_r+0xec8>
    a6f4:	01012a83          	lw	s5,16(sp)
    a6f8:	929ff06f          	j	a020 <_dtoa_r+0xec8>
    a6fc:	00078993          	mv	s3,a5
    a700:	a19ff06f          	j	a118 <_dtoa_r+0xfc0>
    a704:	00078c93          	mv	s9,a5
    a708:	018787b3          	add	a5,a5,s8
    a70c:	018b0b33          	add	s6,s6,s8
    a710:	00f12823          	sw	a5,16(sp)
    a714:	eecff06f          	j	9e00 <_dtoa_r+0xca8>
    a718:	05c12783          	lw	a5,92(sp)
    a71c:	00178c13          	add	s8,a5,1
    a720:	8f0ff06f          	j	9810 <_dtoa_r+0x6b8>
    a724:	04c12983          	lw	s3,76(sp)
    a728:	05012b03          	lw	s6,80(sp)
    a72c:	05812c03          	lw	s8,88(sp)
    a730:	04812a03          	lw	s4,72(sp)
    a734:	a8cff06f          	j	99c0 <_dtoa_r+0x868>
    a738:	00200793          	li	a5,2
    a73c:	0147c863          	blt	a5,s4,a74c <_dtoa_r+0x15f4>
    a740:	02012a03          	lw	s4,32(sp)
    a744:	03c12c03          	lw	s8,60(sp)
    a748:	d1cff06f          	j	9c64 <_dtoa_r+0xb0c>
    a74c:	03c12c03          	lw	s8,60(sp)
    a750:	03612023          	sw	s6,32(sp)
    a754:	949ff06f          	j	a09c <_dtoa_r+0xf44>
    a758:	04012b83          	lw	s7,64(sp)
    a75c:	dddff06f          	j	a538 <_dtoa_r+0x13e0>
    a760:	00200793          	li	a5,2
    a764:	ff47c4e3          	blt	a5,s4,a74c <_dtoa_r+0x15f4>
    a768:	03c12c03          	lw	s8,60(sp)
    a76c:	03612023          	sw	s6,32(sp)
    a770:	f44ff06f          	j	9eb4 <_dtoa_r+0xd5c>
    a774:	00050713          	mv	a4,a0
    a778:	00058793          	mv	a5,a1
    a77c:	00200913          	li	s2,2
    a780:	e15fe06f          	j	9594 <_dtoa_r+0x43c>
    a784:	00006697          	auipc	a3,0x6
    a788:	b9468693          	add	a3,a3,-1132 # 10318 <__fini_array_end+0x370>
    a78c:	00000613          	li	a2,0
    a790:	2ef00593          	li	a1,751
    a794:	00006517          	auipc	a0,0x6
    a798:	b9850513          	add	a0,a0,-1128 # 1032c <__fini_array_end+0x384>
    a79c:	0cd010ef          	jal	c068 <__assert_func>
    a7a0:	01012a83          	lw	s5,16(sp)
    a7a4:	85b048e3          	bgtz	s11,9ff4 <_dtoa_r+0xe9c>
    a7a8:	879ff06f          	j	a020 <_dtoa_r+0xec8>
    a7ac:	00006697          	auipc	a3,0x6
    a7b0:	b6c68693          	add	a3,a3,-1172 # 10318 <__fini_array_end+0x370>
    a7b4:	00000613          	li	a2,0
    a7b8:	1af00593          	li	a1,431
    a7bc:	00006517          	auipc	a0,0x6
    a7c0:	b7050513          	add	a0,a0,-1168 # 1032c <__fini_array_end+0x384>
    a7c4:	0a5010ef          	jal	c068 <__assert_func>
    a7c8:	02042e23          	sw	zero,60(s0)
    a7cc:	00000593          	li	a1,0
    a7d0:	cc1fe06f          	j	9490 <_dtoa_r+0x338>
    a7d4:	02012423          	sw	zero,40(sp)
    a7d8:	c7dfe06f          	j	9454 <_dtoa_r+0x2fc>

0000a7dc <__ascii_mbtowc>:
    a7dc:	02058063          	beqz	a1,a7fc <__ascii_mbtowc+0x20>
    a7e0:	04060263          	beqz	a2,a824 <__ascii_mbtowc+0x48>
    a7e4:	04068863          	beqz	a3,a834 <__ascii_mbtowc+0x58>
    a7e8:	00064783          	lbu	a5,0(a2)
    a7ec:	00f5a023          	sw	a5,0(a1)
    a7f0:	00064503          	lbu	a0,0(a2)
    a7f4:	00a03533          	snez	a0,a0
    a7f8:	00008067          	ret
    a7fc:	ff010113          	add	sp,sp,-16
    a800:	00c10593          	add	a1,sp,12
    a804:	02060463          	beqz	a2,a82c <__ascii_mbtowc+0x50>
    a808:	02068a63          	beqz	a3,a83c <__ascii_mbtowc+0x60>
    a80c:	00064783          	lbu	a5,0(a2)
    a810:	00f5a023          	sw	a5,0(a1)
    a814:	00064503          	lbu	a0,0(a2)
    a818:	00a03533          	snez	a0,a0
    a81c:	01010113          	add	sp,sp,16
    a820:	00008067          	ret
    a824:	00000513          	li	a0,0
    a828:	00008067          	ret
    a82c:	00000513          	li	a0,0
    a830:	fedff06f          	j	a81c <__ascii_mbtowc+0x40>
    a834:	ffe00513          	li	a0,-2
    a838:	00008067          	ret
    a83c:	ffe00513          	li	a0,-2
    a840:	fddff06f          	j	a81c <__ascii_mbtowc+0x40>

0000a844 <_Balloc>:
    a844:	04452783          	lw	a5,68(a0)
    a848:	ff010113          	add	sp,sp,-16
    a84c:	00812423          	sw	s0,8(sp)
    a850:	00912223          	sw	s1,4(sp)
    a854:	00112623          	sw	ra,12(sp)
    a858:	00050413          	mv	s0,a0
    a85c:	00058493          	mv	s1,a1
    a860:	02078c63          	beqz	a5,a898 <_Balloc+0x54>
    a864:	00249713          	sll	a4,s1,0x2
    a868:	00e787b3          	add	a5,a5,a4
    a86c:	0007a503          	lw	a0,0(a5)
    a870:	04050463          	beqz	a0,a8b8 <_Balloc+0x74>
    a874:	00052703          	lw	a4,0(a0)
    a878:	00e7a023          	sw	a4,0(a5)
    a87c:	00052823          	sw	zero,16(a0)
    a880:	00052623          	sw	zero,12(a0)
    a884:	00c12083          	lw	ra,12(sp)
    a888:	00812403          	lw	s0,8(sp)
    a88c:	00412483          	lw	s1,4(sp)
    a890:	01010113          	add	sp,sp,16
    a894:	00008067          	ret
    a898:	02100613          	li	a2,33
    a89c:	00400593          	li	a1,4
    a8a0:	021010ef          	jal	c0c0 <_calloc_r>
    a8a4:	04a42223          	sw	a0,68(s0)
    a8a8:	00050793          	mv	a5,a0
    a8ac:	fa051ce3          	bnez	a0,a864 <_Balloc+0x20>
    a8b0:	00000513          	li	a0,0
    a8b4:	fd1ff06f          	j	a884 <_Balloc+0x40>
    a8b8:	01212023          	sw	s2,0(sp)
    a8bc:	00100913          	li	s2,1
    a8c0:	00991933          	sll	s2,s2,s1
    a8c4:	00590613          	add	a2,s2,5
    a8c8:	00261613          	sll	a2,a2,0x2
    a8cc:	00100593          	li	a1,1
    a8d0:	00040513          	mv	a0,s0
    a8d4:	7ec010ef          	jal	c0c0 <_calloc_r>
    a8d8:	00050a63          	beqz	a0,a8ec <_Balloc+0xa8>
    a8dc:	01252423          	sw	s2,8(a0)
    a8e0:	00952223          	sw	s1,4(a0)
    a8e4:	00012903          	lw	s2,0(sp)
    a8e8:	f95ff06f          	j	a87c <_Balloc+0x38>
    a8ec:	00012903          	lw	s2,0(sp)
    a8f0:	00000513          	li	a0,0
    a8f4:	f91ff06f          	j	a884 <_Balloc+0x40>

0000a8f8 <_Bfree>:
    a8f8:	02058063          	beqz	a1,a918 <_Bfree+0x20>
    a8fc:	0045a703          	lw	a4,4(a1)
    a900:	04452783          	lw	a5,68(a0)
    a904:	00271713          	sll	a4,a4,0x2
    a908:	00e787b3          	add	a5,a5,a4
    a90c:	0007a703          	lw	a4,0(a5)
    a910:	00e5a023          	sw	a4,0(a1)
    a914:	00b7a023          	sw	a1,0(a5)
    a918:	00008067          	ret

0000a91c <__multadd>:
    a91c:	fd010113          	add	sp,sp,-48
    a920:	01412c23          	sw	s4,24(sp)
    a924:	0105aa03          	lw	s4,16(a1)
    a928:	01912223          	sw	s9,4(sp)
    a92c:	00010cb7          	lui	s9,0x10
    a930:	02912223          	sw	s1,36(sp)
    a934:	03212023          	sw	s2,32(sp)
    a938:	01312e23          	sw	s3,28(sp)
    a93c:	01512a23          	sw	s5,20(sp)
    a940:	01612823          	sw	s6,16(sp)
    a944:	01712623          	sw	s7,12(sp)
    a948:	02112623          	sw	ra,44(sp)
    a94c:	02812423          	sw	s0,40(sp)
    a950:	01812423          	sw	s8,8(sp)
    a954:	00058a93          	mv	s5,a1
    a958:	00050b13          	mv	s6,a0
    a95c:	00060993          	mv	s3,a2
    a960:	00068493          	mv	s1,a3
    a964:	01458913          	add	s2,a1,20
    a968:	00000b93          	li	s7,0
    a96c:	fffc8c93          	add	s9,s9,-1 # ffff <__fini_array_end+0x57>
    a970:	00092c03          	lw	s8,0(s2)
    a974:	00098593          	mv	a1,s3
    a978:	00490913          	add	s2,s2,4
    a97c:	019c7533          	and	a0,s8,s9
    a980:	430050ef          	jal	fdb0 <__mulsi3>
    a984:	00050413          	mv	s0,a0
    a988:	00098593          	mv	a1,s3
    a98c:	010c5513          	srl	a0,s8,0x10
    a990:	00940433          	add	s0,s0,s1
    a994:	41c050ef          	jal	fdb0 <__mulsi3>
    a998:	01045793          	srl	a5,s0,0x10
    a99c:	00f50533          	add	a0,a0,a5
    a9a0:	01051793          	sll	a5,a0,0x10
    a9a4:	01947433          	and	s0,s0,s9
    a9a8:	008787b3          	add	a5,a5,s0
    a9ac:	fef92e23          	sw	a5,-4(s2)
    a9b0:	001b8b93          	add	s7,s7,1
    a9b4:	01055493          	srl	s1,a0,0x10
    a9b8:	fb4bcce3          	blt	s7,s4,a970 <__multadd+0x54>
    a9bc:	02048263          	beqz	s1,a9e0 <__multadd+0xc4>
    a9c0:	008aa783          	lw	a5,8(s5)
    a9c4:	04fa5a63          	bge	s4,a5,aa18 <__multadd+0xfc>
    a9c8:	004a0793          	add	a5,s4,4
    a9cc:	00279793          	sll	a5,a5,0x2
    a9d0:	00fa87b3          	add	a5,s5,a5
    a9d4:	0097a223          	sw	s1,4(a5)
    a9d8:	001a0a13          	add	s4,s4,1
    a9dc:	014aa823          	sw	s4,16(s5)
    a9e0:	02c12083          	lw	ra,44(sp)
    a9e4:	02812403          	lw	s0,40(sp)
    a9e8:	02412483          	lw	s1,36(sp)
    a9ec:	02012903          	lw	s2,32(sp)
    a9f0:	01c12983          	lw	s3,28(sp)
    a9f4:	01812a03          	lw	s4,24(sp)
    a9f8:	01012b03          	lw	s6,16(sp)
    a9fc:	00c12b83          	lw	s7,12(sp)
    aa00:	00812c03          	lw	s8,8(sp)
    aa04:	00412c83          	lw	s9,4(sp)
    aa08:	000a8513          	mv	a0,s5
    aa0c:	01412a83          	lw	s5,20(sp)
    aa10:	03010113          	add	sp,sp,48
    aa14:	00008067          	ret
    aa18:	004aa583          	lw	a1,4(s5)
    aa1c:	000b0513          	mv	a0,s6
    aa20:	00158593          	add	a1,a1,1
    aa24:	e21ff0ef          	jal	a844 <_Balloc>
    aa28:	00050413          	mv	s0,a0
    aa2c:	04050c63          	beqz	a0,aa84 <__multadd+0x168>
    aa30:	010aa603          	lw	a2,16(s5)
    aa34:	00ca8593          	add	a1,s5,12
    aa38:	00c50513          	add	a0,a0,12
    aa3c:	00260613          	add	a2,a2,2
    aa40:	00261613          	sll	a2,a2,0x2
    aa44:	e9cf70ef          	jal	20e0 <memcpy>
    aa48:	004aa703          	lw	a4,4(s5)
    aa4c:	044b2783          	lw	a5,68(s6)
    aa50:	00271713          	sll	a4,a4,0x2
    aa54:	00e787b3          	add	a5,a5,a4
    aa58:	0007a703          	lw	a4,0(a5)
    aa5c:	00eaa023          	sw	a4,0(s5)
    aa60:	0157a023          	sw	s5,0(a5)
    aa64:	004a0793          	add	a5,s4,4
    aa68:	00040a93          	mv	s5,s0
    aa6c:	00279793          	sll	a5,a5,0x2
    aa70:	00fa87b3          	add	a5,s5,a5
    aa74:	0097a223          	sw	s1,4(a5)
    aa78:	001a0a13          	add	s4,s4,1
    aa7c:	014aa823          	sw	s4,16(s5)
    aa80:	f61ff06f          	j	a9e0 <__multadd+0xc4>
    aa84:	00006697          	auipc	a3,0x6
    aa88:	89468693          	add	a3,a3,-1900 # 10318 <__fini_array_end+0x370>
    aa8c:	00000613          	li	a2,0
    aa90:	0ba00593          	li	a1,186
    aa94:	00006517          	auipc	a0,0x6
    aa98:	91850513          	add	a0,a0,-1768 # 103ac <__fini_array_end+0x404>
    aa9c:	5cc010ef          	jal	c068 <__assert_func>

0000aaa0 <__hi0bits>:
    aaa0:	00050793          	mv	a5,a0
    aaa4:	00010737          	lui	a4,0x10
    aaa8:	00000513          	li	a0,0
    aaac:	00e7f663          	bgeu	a5,a4,aab8 <__hi0bits+0x18>
    aab0:	01079793          	sll	a5,a5,0x10
    aab4:	01000513          	li	a0,16
    aab8:	01000737          	lui	a4,0x1000
    aabc:	00e7f663          	bgeu	a5,a4,aac8 <__hi0bits+0x28>
    aac0:	00850513          	add	a0,a0,8
    aac4:	00879793          	sll	a5,a5,0x8
    aac8:	10000737          	lui	a4,0x10000
    aacc:	00e7f663          	bgeu	a5,a4,aad8 <__hi0bits+0x38>
    aad0:	00450513          	add	a0,a0,4
    aad4:	00479793          	sll	a5,a5,0x4
    aad8:	40000737          	lui	a4,0x40000
    aadc:	00e7ea63          	bltu	a5,a4,aaf0 <__hi0bits+0x50>
    aae0:	fff7c793          	not	a5,a5
    aae4:	01f7d793          	srl	a5,a5,0x1f
    aae8:	00f50533          	add	a0,a0,a5
    aaec:	00008067          	ret
    aaf0:	00279793          	sll	a5,a5,0x2
    aaf4:	0007ca63          	bltz	a5,ab08 <__hi0bits+0x68>
    aaf8:	00179713          	sll	a4,a5,0x1
    aafc:	00074a63          	bltz	a4,ab10 <__hi0bits+0x70>
    ab00:	02000513          	li	a0,32
    ab04:	00008067          	ret
    ab08:	00250513          	add	a0,a0,2
    ab0c:	00008067          	ret
    ab10:	00350513          	add	a0,a0,3
    ab14:	00008067          	ret

0000ab18 <__lo0bits>:
    ab18:	00052783          	lw	a5,0(a0)
    ab1c:	00050713          	mv	a4,a0
    ab20:	0077f693          	and	a3,a5,7
    ab24:	02068463          	beqz	a3,ab4c <__lo0bits+0x34>
    ab28:	0017f693          	and	a3,a5,1
    ab2c:	00000513          	li	a0,0
    ab30:	04069e63          	bnez	a3,ab8c <__lo0bits+0x74>
    ab34:	0027f693          	and	a3,a5,2
    ab38:	0a068863          	beqz	a3,abe8 <__lo0bits+0xd0>
    ab3c:	0017d793          	srl	a5,a5,0x1
    ab40:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    ab44:	00100513          	li	a0,1
    ab48:	00008067          	ret
    ab4c:	01079693          	sll	a3,a5,0x10
    ab50:	0106d693          	srl	a3,a3,0x10
    ab54:	00000513          	li	a0,0
    ab58:	06068e63          	beqz	a3,abd4 <__lo0bits+0xbc>
    ab5c:	0ff7f693          	zext.b	a3,a5
    ab60:	06068063          	beqz	a3,abc0 <__lo0bits+0xa8>
    ab64:	00f7f693          	and	a3,a5,15
    ab68:	04068263          	beqz	a3,abac <__lo0bits+0x94>
    ab6c:	0037f693          	and	a3,a5,3
    ab70:	02068463          	beqz	a3,ab98 <__lo0bits+0x80>
    ab74:	0017f693          	and	a3,a5,1
    ab78:	00069c63          	bnez	a3,ab90 <__lo0bits+0x78>
    ab7c:	0017d793          	srl	a5,a5,0x1
    ab80:	00150513          	add	a0,a0,1
    ab84:	00079663          	bnez	a5,ab90 <__lo0bits+0x78>
    ab88:	02000513          	li	a0,32
    ab8c:	00008067          	ret
    ab90:	00f72023          	sw	a5,0(a4)
    ab94:	00008067          	ret
    ab98:	0027d793          	srl	a5,a5,0x2
    ab9c:	0017f693          	and	a3,a5,1
    aba0:	00250513          	add	a0,a0,2
    aba4:	fe0696e3          	bnez	a3,ab90 <__lo0bits+0x78>
    aba8:	fd5ff06f          	j	ab7c <__lo0bits+0x64>
    abac:	0047d793          	srl	a5,a5,0x4
    abb0:	0037f693          	and	a3,a5,3
    abb4:	00450513          	add	a0,a0,4
    abb8:	fa069ee3          	bnez	a3,ab74 <__lo0bits+0x5c>
    abbc:	fddff06f          	j	ab98 <__lo0bits+0x80>
    abc0:	0087d793          	srl	a5,a5,0x8
    abc4:	00f7f693          	and	a3,a5,15
    abc8:	00850513          	add	a0,a0,8
    abcc:	fa0690e3          	bnez	a3,ab6c <__lo0bits+0x54>
    abd0:	fddff06f          	j	abac <__lo0bits+0x94>
    abd4:	0107d793          	srl	a5,a5,0x10
    abd8:	0ff7f693          	zext.b	a3,a5
    abdc:	01000513          	li	a0,16
    abe0:	f80692e3          	bnez	a3,ab64 <__lo0bits+0x4c>
    abe4:	fddff06f          	j	abc0 <__lo0bits+0xa8>
    abe8:	0027d793          	srl	a5,a5,0x2
    abec:	00f72023          	sw	a5,0(a4)
    abf0:	00200513          	li	a0,2
    abf4:	00008067          	ret

0000abf8 <__i2b>:
    abf8:	04452783          	lw	a5,68(a0)
    abfc:	ff010113          	add	sp,sp,-16
    ac00:	00812423          	sw	s0,8(sp)
    ac04:	00912223          	sw	s1,4(sp)
    ac08:	00112623          	sw	ra,12(sp)
    ac0c:	00050413          	mv	s0,a0
    ac10:	00058493          	mv	s1,a1
    ac14:	02078c63          	beqz	a5,ac4c <__i2b+0x54>
    ac18:	0047a503          	lw	a0,4(a5)
    ac1c:	06050263          	beqz	a0,ac80 <__i2b+0x88>
    ac20:	00052703          	lw	a4,0(a0)
    ac24:	00e7a223          	sw	a4,4(a5)
    ac28:	00c12083          	lw	ra,12(sp)
    ac2c:	00812403          	lw	s0,8(sp)
    ac30:	00100793          	li	a5,1
    ac34:	00952a23          	sw	s1,20(a0)
    ac38:	00052623          	sw	zero,12(a0)
    ac3c:	00f52823          	sw	a5,16(a0)
    ac40:	00412483          	lw	s1,4(sp)
    ac44:	01010113          	add	sp,sp,16
    ac48:	00008067          	ret
    ac4c:	02100613          	li	a2,33
    ac50:	00400593          	li	a1,4
    ac54:	46c010ef          	jal	c0c0 <_calloc_r>
    ac58:	04a42223          	sw	a0,68(s0)
    ac5c:	00050793          	mv	a5,a0
    ac60:	fa051ce3          	bnez	a0,ac18 <__i2b+0x20>
    ac64:	00005697          	auipc	a3,0x5
    ac68:	6b468693          	add	a3,a3,1716 # 10318 <__fini_array_end+0x370>
    ac6c:	00000613          	li	a2,0
    ac70:	14500593          	li	a1,325
    ac74:	00005517          	auipc	a0,0x5
    ac78:	73850513          	add	a0,a0,1848 # 103ac <__fini_array_end+0x404>
    ac7c:	3ec010ef          	jal	c068 <__assert_func>
    ac80:	01c00613          	li	a2,28
    ac84:	00100593          	li	a1,1
    ac88:	00040513          	mv	a0,s0
    ac8c:	434010ef          	jal	c0c0 <_calloc_r>
    ac90:	fc050ae3          	beqz	a0,ac64 <__i2b+0x6c>
    ac94:	00100793          	li	a5,1
    ac98:	00f52223          	sw	a5,4(a0)
    ac9c:	00200793          	li	a5,2
    aca0:	00f52423          	sw	a5,8(a0)
    aca4:	f85ff06f          	j	ac28 <__i2b+0x30>

0000aca8 <__multiply>:
    aca8:	fb010113          	add	sp,sp,-80
    acac:	03312e23          	sw	s3,60(sp)
    acb0:	03812423          	sw	s8,40(sp)
    acb4:	01062983          	lw	s3,16(a2)
    acb8:	0105ac03          	lw	s8,16(a1)
    acbc:	04812423          	sw	s0,72(sp)
    acc0:	03412c23          	sw	s4,56(sp)
    acc4:	04112623          	sw	ra,76(sp)
    acc8:	03712623          	sw	s7,44(sp)
    accc:	00058a13          	mv	s4,a1
    acd0:	00060413          	mv	s0,a2
    acd4:	013c4c63          	blt	s8,s3,acec <__multiply+0x44>
    acd8:	00098713          	mv	a4,s3
    acdc:	00058413          	mv	s0,a1
    ace0:	000c0993          	mv	s3,s8
    ace4:	00060a13          	mv	s4,a2
    ace8:	00070c13          	mv	s8,a4
    acec:	00842783          	lw	a5,8(s0)
    acf0:	00442583          	lw	a1,4(s0)
    acf4:	01898bb3          	add	s7,s3,s8
    acf8:	0177a7b3          	slt	a5,a5,s7
    acfc:	00f585b3          	add	a1,a1,a5
    ad00:	b45ff0ef          	jal	a844 <_Balloc>
    ad04:	00a12623          	sw	a0,12(sp)
    ad08:	22050863          	beqz	a0,af38 <__multiply+0x290>
    ad0c:	00c12783          	lw	a5,12(sp)
    ad10:	03512a23          	sw	s5,52(sp)
    ad14:	03612823          	sw	s6,48(sp)
    ad18:	002b9a93          	sll	s5,s7,0x2
    ad1c:	01478b13          	add	s6,a5,20
    ad20:	015b0ab3          	add	s5,s6,s5
    ad24:	000b0793          	mv	a5,s6
    ad28:	015b7863          	bgeu	s6,s5,ad38 <__multiply+0x90>
    ad2c:	0007a023          	sw	zero,0(a5)
    ad30:	00478793          	add	a5,a5,4
    ad34:	ff57ece3          	bltu	a5,s5,ad2c <__multiply+0x84>
    ad38:	014a0a13          	add	s4,s4,20
    ad3c:	002c1c13          	sll	s8,s8,0x2
    ad40:	01440793          	add	a5,s0,20
    ad44:	018a0733          	add	a4,s4,s8
    ad48:	00299993          	sll	s3,s3,0x2
    ad4c:	00f12423          	sw	a5,8(sp)
    ad50:	00e12023          	sw	a4,0(sp)
    ad54:	013789b3          	add	s3,a5,s3
    ad58:	16ea7c63          	bgeu	s4,a4,aed0 <__multiply+0x228>
    ad5c:	00400713          	li	a4,4
    ad60:	04912223          	sw	s1,68(sp)
    ad64:	05212023          	sw	s2,64(sp)
    ad68:	03912223          	sw	s9,36(sp)
    ad6c:	03a12023          	sw	s10,32(sp)
    ad70:	01b12e23          	sw	s11,28(sp)
    ad74:	01540793          	add	a5,s0,21
    ad78:	00e12223          	sw	a4,4(sp)
    ad7c:	1af9f263          	bgeu	s3,a5,af20 <__multiply+0x278>
    ad80:	00010437          	lui	s0,0x10
    ad84:	fff40413          	add	s0,s0,-1 # ffff <__fini_array_end+0x57>
    ad88:	01c0006f          	j	ada4 <__multiply+0xfc>
    ad8c:	01095913          	srl	s2,s2,0x10
    ad90:	0a091063          	bnez	s2,ae30 <__multiply+0x188>
    ad94:	00012783          	lw	a5,0(sp)
    ad98:	004a0a13          	add	s4,s4,4
    ad9c:	004b0b13          	add	s6,s6,4
    ada0:	10fa7e63          	bgeu	s4,a5,aebc <__multiply+0x214>
    ada4:	000a2903          	lw	s2,0(s4)
    ada8:	008974b3          	and	s1,s2,s0
    adac:	fe0480e3          	beqz	s1,ad8c <__multiply+0xe4>
    adb0:	00812c83          	lw	s9,8(sp)
    adb4:	000b0d13          	mv	s10,s6
    adb8:	00000c13          	li	s8,0
    adbc:	000cad83          	lw	s11,0(s9)
    adc0:	000d2903          	lw	s2,0(s10)
    adc4:	00048593          	mv	a1,s1
    adc8:	008df533          	and	a0,s11,s0
    adcc:	7e5040ef          	jal	fdb0 <__mulsi3>
    add0:	00897733          	and	a4,s2,s0
    add4:	00e50733          	add	a4,a0,a4
    add8:	00048593          	mv	a1,s1
    addc:	010dd513          	srl	a0,s11,0x10
    ade0:	01870c33          	add	s8,a4,s8
    ade4:	01095913          	srl	s2,s2,0x10
    ade8:	7c9040ef          	jal	fdb0 <__mulsi3>
    adec:	010c5713          	srl	a4,s8,0x10
    adf0:	01250533          	add	a0,a0,s2
    adf4:	00e50533          	add	a0,a0,a4
    adf8:	008c77b3          	and	a5,s8,s0
    adfc:	01051713          	sll	a4,a0,0x10
    ae00:	004d0d13          	add	s10,s10,4
    ae04:	00f767b3          	or	a5,a4,a5
    ae08:	004c8c93          	add	s9,s9,4
    ae0c:	fefd2e23          	sw	a5,-4(s10)
    ae10:	01055c13          	srl	s8,a0,0x10
    ae14:	fb3ce4e3          	bltu	s9,s3,adbc <__multiply+0x114>
    ae18:	00412783          	lw	a5,4(sp)
    ae1c:	00fb0733          	add	a4,s6,a5
    ae20:	01872023          	sw	s8,0(a4)
    ae24:	000a2903          	lw	s2,0(s4)
    ae28:	01095913          	srl	s2,s2,0x10
    ae2c:	f60904e3          	beqz	s2,ad94 <__multiply+0xec>
    ae30:	000b2c83          	lw	s9,0(s6)
    ae34:	00812d03          	lw	s10,8(sp)
    ae38:	000b0c13          	mv	s8,s6
    ae3c:	000c8493          	mv	s1,s9
    ae40:	00000d93          	li	s11,0
    ae44:	000d2503          	lw	a0,0(s10)
    ae48:	00090593          	mv	a1,s2
    ae4c:	0104d493          	srl	s1,s1,0x10
    ae50:	00857533          	and	a0,a0,s0
    ae54:	75d040ef          	jal	fdb0 <__mulsi3>
    ae58:	01b50733          	add	a4,a0,s11
    ae5c:	00970db3          	add	s11,a4,s1
    ae60:	010d9593          	sll	a1,s11,0x10
    ae64:	008cf7b3          	and	a5,s9,s0
    ae68:	00f5e7b3          	or	a5,a1,a5
    ae6c:	00fc2023          	sw	a5,0(s8)
    ae70:	002d5503          	lhu	a0,2(s10)
    ae74:	004c2483          	lw	s1,4(s8)
    ae78:	00090593          	mv	a1,s2
    ae7c:	735040ef          	jal	fdb0 <__mulsi3>
    ae80:	0084f7b3          	and	a5,s1,s0
    ae84:	010dd713          	srl	a4,s11,0x10
    ae88:	00f507b3          	add	a5,a0,a5
    ae8c:	004d0d13          	add	s10,s10,4
    ae90:	00e78cb3          	add	s9,a5,a4
    ae94:	004c0c13          	add	s8,s8,4
    ae98:	010cdd93          	srl	s11,s9,0x10
    ae9c:	fb3d64e3          	bltu	s10,s3,ae44 <__multiply+0x19c>
    aea0:	00412783          	lw	a5,4(sp)
    aea4:	004a0a13          	add	s4,s4,4
    aea8:	00fb0733          	add	a4,s6,a5
    aeac:	00012783          	lw	a5,0(sp)
    aeb0:	01972023          	sw	s9,0(a4)
    aeb4:	004b0b13          	add	s6,s6,4
    aeb8:	eefa66e3          	bltu	s4,a5,ada4 <__multiply+0xfc>
    aebc:	04412483          	lw	s1,68(sp)
    aec0:	04012903          	lw	s2,64(sp)
    aec4:	02412c83          	lw	s9,36(sp)
    aec8:	02012d03          	lw	s10,32(sp)
    aecc:	01c12d83          	lw	s11,28(sp)
    aed0:	01704863          	bgtz	s7,aee0 <__multiply+0x238>
    aed4:	0180006f          	j	aeec <__multiply+0x244>
    aed8:	fffb8b93          	add	s7,s7,-1
    aedc:	000b8863          	beqz	s7,aeec <__multiply+0x244>
    aee0:	ffcaa783          	lw	a5,-4(s5)
    aee4:	ffca8a93          	add	s5,s5,-4
    aee8:	fe0788e3          	beqz	a5,aed8 <__multiply+0x230>
    aeec:	00c12783          	lw	a5,12(sp)
    aef0:	04c12083          	lw	ra,76(sp)
    aef4:	04812403          	lw	s0,72(sp)
    aef8:	0177a823          	sw	s7,16(a5)
    aefc:	03412a83          	lw	s5,52(sp)
    af00:	03012b03          	lw	s6,48(sp)
    af04:	03c12983          	lw	s3,60(sp)
    af08:	03812a03          	lw	s4,56(sp)
    af0c:	02c12b83          	lw	s7,44(sp)
    af10:	02812c03          	lw	s8,40(sp)
    af14:	00078513          	mv	a0,a5
    af18:	05010113          	add	sp,sp,80
    af1c:	00008067          	ret
    af20:	408987b3          	sub	a5,s3,s0
    af24:	feb78793          	add	a5,a5,-21
    af28:	ffc7f793          	and	a5,a5,-4
    af2c:	00478793          	add	a5,a5,4
    af30:	00f12223          	sw	a5,4(sp)
    af34:	e4dff06f          	j	ad80 <__multiply+0xd8>
    af38:	00005697          	auipc	a3,0x5
    af3c:	3e068693          	add	a3,a3,992 # 10318 <__fini_array_end+0x370>
    af40:	00000613          	li	a2,0
    af44:	16200593          	li	a1,354
    af48:	00005517          	auipc	a0,0x5
    af4c:	46450513          	add	a0,a0,1124 # 103ac <__fini_array_end+0x404>
    af50:	04912223          	sw	s1,68(sp)
    af54:	05212023          	sw	s2,64(sp)
    af58:	03512a23          	sw	s5,52(sp)
    af5c:	03612823          	sw	s6,48(sp)
    af60:	03912223          	sw	s9,36(sp)
    af64:	03a12023          	sw	s10,32(sp)
    af68:	01b12e23          	sw	s11,28(sp)
    af6c:	0fc010ef          	jal	c068 <__assert_func>

0000af70 <__pow5mult>:
    af70:	fe010113          	add	sp,sp,-32
    af74:	00812c23          	sw	s0,24(sp)
    af78:	01212823          	sw	s2,16(sp)
    af7c:	01312623          	sw	s3,12(sp)
    af80:	00112e23          	sw	ra,28(sp)
    af84:	00367793          	and	a5,a2,3
    af88:	00060413          	mv	s0,a2
    af8c:	00050993          	mv	s3,a0
    af90:	00058913          	mv	s2,a1
    af94:	0a079c63          	bnez	a5,b04c <__pow5mult+0xdc>
    af98:	40245413          	sra	s0,s0,0x2
    af9c:	06040a63          	beqz	s0,b010 <__pow5mult+0xa0>
    afa0:	00912a23          	sw	s1,20(sp)
    afa4:	0409a483          	lw	s1,64(s3)
    afa8:	0c048663          	beqz	s1,b074 <__pow5mult+0x104>
    afac:	00147793          	and	a5,s0,1
    afb0:	02079063          	bnez	a5,afd0 <__pow5mult+0x60>
    afb4:	40145413          	sra	s0,s0,0x1
    afb8:	04040a63          	beqz	s0,b00c <__pow5mult+0x9c>
    afbc:	0004a503          	lw	a0,0(s1)
    afc0:	06050663          	beqz	a0,b02c <__pow5mult+0xbc>
    afc4:	00050493          	mv	s1,a0
    afc8:	00147793          	and	a5,s0,1
    afcc:	fe0784e3          	beqz	a5,afb4 <__pow5mult+0x44>
    afd0:	00048613          	mv	a2,s1
    afd4:	00090593          	mv	a1,s2
    afd8:	00098513          	mv	a0,s3
    afdc:	ccdff0ef          	jal	aca8 <__multiply>
    afe0:	02090063          	beqz	s2,b000 <__pow5mult+0x90>
    afe4:	00492703          	lw	a4,4(s2)
    afe8:	0449a783          	lw	a5,68(s3)
    afec:	00271713          	sll	a4,a4,0x2
    aff0:	00e787b3          	add	a5,a5,a4
    aff4:	0007a703          	lw	a4,0(a5)
    aff8:	00e92023          	sw	a4,0(s2)
    affc:	0127a023          	sw	s2,0(a5)
    b000:	40145413          	sra	s0,s0,0x1
    b004:	00050913          	mv	s2,a0
    b008:	fa041ae3          	bnez	s0,afbc <__pow5mult+0x4c>
    b00c:	01412483          	lw	s1,20(sp)
    b010:	01c12083          	lw	ra,28(sp)
    b014:	01812403          	lw	s0,24(sp)
    b018:	00c12983          	lw	s3,12(sp)
    b01c:	00090513          	mv	a0,s2
    b020:	01012903          	lw	s2,16(sp)
    b024:	02010113          	add	sp,sp,32
    b028:	00008067          	ret
    b02c:	00048613          	mv	a2,s1
    b030:	00048593          	mv	a1,s1
    b034:	00098513          	mv	a0,s3
    b038:	c71ff0ef          	jal	aca8 <__multiply>
    b03c:	00a4a023          	sw	a0,0(s1)
    b040:	00052023          	sw	zero,0(a0)
    b044:	00050493          	mv	s1,a0
    b048:	f81ff06f          	j	afc8 <__pow5mult+0x58>
    b04c:	fff78793          	add	a5,a5,-1
    b050:	00006717          	auipc	a4,0x6
    b054:	8d070713          	add	a4,a4,-1840 # 10920 <p05.0>
    b058:	00279793          	sll	a5,a5,0x2
    b05c:	00f707b3          	add	a5,a4,a5
    b060:	0007a603          	lw	a2,0(a5)
    b064:	00000693          	li	a3,0
    b068:	8b5ff0ef          	jal	a91c <__multadd>
    b06c:	00050913          	mv	s2,a0
    b070:	f29ff06f          	j	af98 <__pow5mult+0x28>
    b074:	00100593          	li	a1,1
    b078:	00098513          	mv	a0,s3
    b07c:	fc8ff0ef          	jal	a844 <_Balloc>
    b080:	00050493          	mv	s1,a0
    b084:	02050063          	beqz	a0,b0a4 <__pow5mult+0x134>
    b088:	27100793          	li	a5,625
    b08c:	00f52a23          	sw	a5,20(a0)
    b090:	00100793          	li	a5,1
    b094:	00f52823          	sw	a5,16(a0)
    b098:	04a9a023          	sw	a0,64(s3)
    b09c:	00052023          	sw	zero,0(a0)
    b0a0:	f0dff06f          	j	afac <__pow5mult+0x3c>
    b0a4:	00005697          	auipc	a3,0x5
    b0a8:	27468693          	add	a3,a3,628 # 10318 <__fini_array_end+0x370>
    b0ac:	00000613          	li	a2,0
    b0b0:	14500593          	li	a1,325
    b0b4:	00005517          	auipc	a0,0x5
    b0b8:	2f850513          	add	a0,a0,760 # 103ac <__fini_array_end+0x404>
    b0bc:	7ad000ef          	jal	c068 <__assert_func>

0000b0c0 <__lshift>:
    b0c0:	fe010113          	add	sp,sp,-32
    b0c4:	01512223          	sw	s5,4(sp)
    b0c8:	0105aa83          	lw	s5,16(a1)
    b0cc:	0085a783          	lw	a5,8(a1)
    b0d0:	01312623          	sw	s3,12(sp)
    b0d4:	40565993          	sra	s3,a2,0x5
    b0d8:	01598ab3          	add	s5,s3,s5
    b0dc:	00812c23          	sw	s0,24(sp)
    b0e0:	00912a23          	sw	s1,20(sp)
    b0e4:	01212823          	sw	s2,16(sp)
    b0e8:	01412423          	sw	s4,8(sp)
    b0ec:	00112e23          	sw	ra,28(sp)
    b0f0:	001a8913          	add	s2,s5,1
    b0f4:	00058493          	mv	s1,a1
    b0f8:	00060413          	mv	s0,a2
    b0fc:	0045a583          	lw	a1,4(a1)
    b100:	00050a13          	mv	s4,a0
    b104:	0127d863          	bge	a5,s2,b114 <__lshift+0x54>
    b108:	00179793          	sll	a5,a5,0x1
    b10c:	00158593          	add	a1,a1,1
    b110:	ff27cce3          	blt	a5,s2,b108 <__lshift+0x48>
    b114:	000a0513          	mv	a0,s4
    b118:	f2cff0ef          	jal	a844 <_Balloc>
    b11c:	10050c63          	beqz	a0,b234 <__lshift+0x174>
    b120:	01450813          	add	a6,a0,20
    b124:	03305463          	blez	s3,b14c <__lshift+0x8c>
    b128:	00598993          	add	s3,s3,5
    b12c:	00299993          	sll	s3,s3,0x2
    b130:	01350733          	add	a4,a0,s3
    b134:	00080793          	mv	a5,a6
    b138:	00478793          	add	a5,a5,4
    b13c:	fe07ae23          	sw	zero,-4(a5)
    b140:	fee79ce3          	bne	a5,a4,b138 <__lshift+0x78>
    b144:	fec98993          	add	s3,s3,-20
    b148:	01380833          	add	a6,a6,s3
    b14c:	0104a883          	lw	a7,16(s1)
    b150:	01448793          	add	a5,s1,20
    b154:	01f47613          	and	a2,s0,31
    b158:	00289893          	sll	a7,a7,0x2
    b15c:	011788b3          	add	a7,a5,a7
    b160:	0a060463          	beqz	a2,b208 <__lshift+0x148>
    b164:	02000593          	li	a1,32
    b168:	40c585b3          	sub	a1,a1,a2
    b16c:	00080313          	mv	t1,a6
    b170:	00000693          	li	a3,0
    b174:	0007a703          	lw	a4,0(a5)
    b178:	00430313          	add	t1,t1,4
    b17c:	00478793          	add	a5,a5,4
    b180:	00c71733          	sll	a4,a4,a2
    b184:	00d76733          	or	a4,a4,a3
    b188:	fee32e23          	sw	a4,-4(t1)
    b18c:	ffc7a683          	lw	a3,-4(a5)
    b190:	00b6d6b3          	srl	a3,a3,a1
    b194:	ff17e0e3          	bltu	a5,a7,b174 <__lshift+0xb4>
    b198:	01548793          	add	a5,s1,21
    b19c:	00400713          	li	a4,4
    b1a0:	00f8ea63          	bltu	a7,a5,b1b4 <__lshift+0xf4>
    b1a4:	409887b3          	sub	a5,a7,s1
    b1a8:	feb78793          	add	a5,a5,-21
    b1ac:	ffc7f793          	and	a5,a5,-4
    b1b0:	00478713          	add	a4,a5,4
    b1b4:	00e80833          	add	a6,a6,a4
    b1b8:	00d82023          	sw	a3,0(a6)
    b1bc:	00069463          	bnez	a3,b1c4 <__lshift+0x104>
    b1c0:	000a8913          	mv	s2,s5
    b1c4:	0044a703          	lw	a4,4(s1)
    b1c8:	044a2783          	lw	a5,68(s4)
    b1cc:	01c12083          	lw	ra,28(sp)
    b1d0:	00271713          	sll	a4,a4,0x2
    b1d4:	00e787b3          	add	a5,a5,a4
    b1d8:	0007a703          	lw	a4,0(a5)
    b1dc:	01252823          	sw	s2,16(a0)
    b1e0:	01812403          	lw	s0,24(sp)
    b1e4:	00e4a023          	sw	a4,0(s1)
    b1e8:	0097a023          	sw	s1,0(a5)
    b1ec:	01012903          	lw	s2,16(sp)
    b1f0:	01412483          	lw	s1,20(sp)
    b1f4:	00c12983          	lw	s3,12(sp)
    b1f8:	00812a03          	lw	s4,8(sp)
    b1fc:	00412a83          	lw	s5,4(sp)
    b200:	02010113          	add	sp,sp,32
    b204:	00008067          	ret
    b208:	0007a703          	lw	a4,0(a5)
    b20c:	00478793          	add	a5,a5,4
    b210:	00480813          	add	a6,a6,4
    b214:	fee82e23          	sw	a4,-4(a6)
    b218:	fb17f4e3          	bgeu	a5,a7,b1c0 <__lshift+0x100>
    b21c:	0007a703          	lw	a4,0(a5)
    b220:	00478793          	add	a5,a5,4
    b224:	00480813          	add	a6,a6,4
    b228:	fee82e23          	sw	a4,-4(a6)
    b22c:	fd17eee3          	bltu	a5,a7,b208 <__lshift+0x148>
    b230:	f91ff06f          	j	b1c0 <__lshift+0x100>
    b234:	00005697          	auipc	a3,0x5
    b238:	0e468693          	add	a3,a3,228 # 10318 <__fini_array_end+0x370>
    b23c:	00000613          	li	a2,0
    b240:	1de00593          	li	a1,478
    b244:	00005517          	auipc	a0,0x5
    b248:	16850513          	add	a0,a0,360 # 103ac <__fini_array_end+0x404>
    b24c:	61d000ef          	jal	c068 <__assert_func>

0000b250 <__mcmp>:
    b250:	01052703          	lw	a4,16(a0)
    b254:	0105a783          	lw	a5,16(a1)
    b258:	00050813          	mv	a6,a0
    b25c:	40f70533          	sub	a0,a4,a5
    b260:	04f71263          	bne	a4,a5,b2a4 <__mcmp+0x54>
    b264:	00279793          	sll	a5,a5,0x2
    b268:	01480813          	add	a6,a6,20
    b26c:	01458593          	add	a1,a1,20
    b270:	00f80733          	add	a4,a6,a5
    b274:	00f587b3          	add	a5,a1,a5
    b278:	0080006f          	j	b280 <__mcmp+0x30>
    b27c:	02e87463          	bgeu	a6,a4,b2a4 <__mcmp+0x54>
    b280:	ffc72603          	lw	a2,-4(a4)
    b284:	ffc7a683          	lw	a3,-4(a5)
    b288:	ffc70713          	add	a4,a4,-4
    b28c:	ffc78793          	add	a5,a5,-4
    b290:	fed606e3          	beq	a2,a3,b27c <__mcmp+0x2c>
    b294:	00100513          	li	a0,1
    b298:	00d67663          	bgeu	a2,a3,b2a4 <__mcmp+0x54>
    b29c:	fff00513          	li	a0,-1
    b2a0:	00008067          	ret
    b2a4:	00008067          	ret

0000b2a8 <__mdiff>:
    b2a8:	0105a703          	lw	a4,16(a1)
    b2ac:	01062783          	lw	a5,16(a2)
    b2b0:	ff010113          	add	sp,sp,-16
    b2b4:	00812423          	sw	s0,8(sp)
    b2b8:	00912223          	sw	s1,4(sp)
    b2bc:	00112623          	sw	ra,12(sp)
    b2c0:	01212023          	sw	s2,0(sp)
    b2c4:	00058413          	mv	s0,a1
    b2c8:	00060493          	mv	s1,a2
    b2cc:	40f706b3          	sub	a3,a4,a5
    b2d0:	18f71e63          	bne	a4,a5,b46c <__mdiff+0x1c4>
    b2d4:	00279693          	sll	a3,a5,0x2
    b2d8:	01458613          	add	a2,a1,20
    b2dc:	01448713          	add	a4,s1,20
    b2e0:	00d607b3          	add	a5,a2,a3
    b2e4:	00d70733          	add	a4,a4,a3
    b2e8:	0080006f          	j	b2f0 <__mdiff+0x48>
    b2ec:	18f67c63          	bgeu	a2,a5,b484 <__mdiff+0x1dc>
    b2f0:	ffc7a583          	lw	a1,-4(a5)
    b2f4:	ffc72683          	lw	a3,-4(a4)
    b2f8:	ffc78793          	add	a5,a5,-4
    b2fc:	ffc70713          	add	a4,a4,-4
    b300:	fed586e3          	beq	a1,a3,b2ec <__mdiff+0x44>
    b304:	00100913          	li	s2,1
    b308:	00d5ea63          	bltu	a1,a3,b31c <__mdiff+0x74>
    b30c:	00048793          	mv	a5,s1
    b310:	00000913          	li	s2,0
    b314:	00040493          	mv	s1,s0
    b318:	00078413          	mv	s0,a5
    b31c:	0044a583          	lw	a1,4(s1)
    b320:	d24ff0ef          	jal	a844 <_Balloc>
    b324:	1a050663          	beqz	a0,b4d0 <__mdiff+0x228>
    b328:	0104a883          	lw	a7,16(s1)
    b32c:	01042283          	lw	t0,16(s0)
    b330:	01448f93          	add	t6,s1,20
    b334:	00289313          	sll	t1,a7,0x2
    b338:	01440813          	add	a6,s0,20
    b33c:	00229293          	sll	t0,t0,0x2
    b340:	01450593          	add	a1,a0,20
    b344:	00010e37          	lui	t3,0x10
    b348:	01252623          	sw	s2,12(a0)
    b34c:	006f8333          	add	t1,t6,t1
    b350:	005802b3          	add	t0,a6,t0
    b354:	00058f13          	mv	t5,a1
    b358:	000f8e93          	mv	t4,t6
    b35c:	00000693          	li	a3,0
    b360:	fffe0e13          	add	t3,t3,-1 # ffff <__fini_array_end+0x57>
    b364:	000ea703          	lw	a4,0(t4)
    b368:	00082603          	lw	a2,0(a6)
    b36c:	004f0f13          	add	t5,t5,4
    b370:	01c777b3          	and	a5,a4,t3
    b374:	01c673b3          	and	t2,a2,t3
    b378:	407787b3          	sub	a5,a5,t2
    b37c:	00d787b3          	add	a5,a5,a3
    b380:	01075713          	srl	a4,a4,0x10
    b384:	01065613          	srl	a2,a2,0x10
    b388:	4107d693          	sra	a3,a5,0x10
    b38c:	40c70733          	sub	a4,a4,a2
    b390:	00d70733          	add	a4,a4,a3
    b394:	01071693          	sll	a3,a4,0x10
    b398:	01c7f7b3          	and	a5,a5,t3
    b39c:	00d7e7b3          	or	a5,a5,a3
    b3a0:	00480813          	add	a6,a6,4
    b3a4:	feff2e23          	sw	a5,-4(t5)
    b3a8:	004e8e93          	add	t4,t4,4
    b3ac:	41075693          	sra	a3,a4,0x10
    b3b0:	fa586ae3          	bltu	a6,t0,b364 <__mdiff+0xbc>
    b3b4:	01540713          	add	a4,s0,21
    b3b8:	40828433          	sub	s0,t0,s0
    b3bc:	feb40413          	add	s0,s0,-21
    b3c0:	00e2b2b3          	sltu	t0,t0,a4
    b3c4:	0012cf13          	xor	t5,t0,1
    b3c8:	00245413          	srl	s0,s0,0x2
    b3cc:	00400713          	li	a4,4
    b3d0:	0a028463          	beqz	t0,b478 <__mdiff+0x1d0>
    b3d4:	00ef8fb3          	add	t6,t6,a4
    b3d8:	00e58833          	add	a6,a1,a4
    b3dc:	00010eb7          	lui	t4,0x10
    b3e0:	00080e13          	mv	t3,a6
    b3e4:	000f8613          	mv	a2,t6
    b3e8:	fffe8e93          	add	t4,t4,-1 # ffff <__fini_array_end+0x57>
    b3ec:	0c6ff463          	bgeu	t6,t1,b4b4 <__mdiff+0x20c>
    b3f0:	00062783          	lw	a5,0(a2)
    b3f4:	004e0e13          	add	t3,t3,4
    b3f8:	00460613          	add	a2,a2,4
    b3fc:	01d7f733          	and	a4,a5,t4
    b400:	00d70733          	add	a4,a4,a3
    b404:	0107d593          	srl	a1,a5,0x10
    b408:	41075713          	sra	a4,a4,0x10
    b40c:	00b70733          	add	a4,a4,a1
    b410:	00d787b3          	add	a5,a5,a3
    b414:	01d7f7b3          	and	a5,a5,t4
    b418:	01071693          	sll	a3,a4,0x10
    b41c:	00d7e7b3          	or	a5,a5,a3
    b420:	fefe2e23          	sw	a5,-4(t3)
    b424:	41075693          	sra	a3,a4,0x10
    b428:	fc6664e3          	bltu	a2,t1,b3f0 <__mdiff+0x148>
    b42c:	fff30313          	add	t1,t1,-1
    b430:	41f30333          	sub	t1,t1,t6
    b434:	ffc37313          	and	t1,t1,-4
    b438:	00680733          	add	a4,a6,t1
    b43c:	00079a63          	bnez	a5,b450 <__mdiff+0x1a8>
    b440:	ffc72783          	lw	a5,-4(a4)
    b444:	fff88893          	add	a7,a7,-1
    b448:	ffc70713          	add	a4,a4,-4
    b44c:	fe078ae3          	beqz	a5,b440 <__mdiff+0x198>
    b450:	00c12083          	lw	ra,12(sp)
    b454:	00812403          	lw	s0,8(sp)
    b458:	01152823          	sw	a7,16(a0)
    b45c:	00412483          	lw	s1,4(sp)
    b460:	00012903          	lw	s2,0(sp)
    b464:	01010113          	add	sp,sp,16
    b468:	00008067          	ret
    b46c:	00100913          	li	s2,1
    b470:	e806dee3          	bgez	a3,b30c <__mdiff+0x64>
    b474:	ea9ff06f          	j	b31c <__mdiff+0x74>
    b478:	00140713          	add	a4,s0,1
    b47c:	00271713          	sll	a4,a4,0x2
    b480:	f55ff06f          	j	b3d4 <__mdiff+0x12c>
    b484:	00000593          	li	a1,0
    b488:	bbcff0ef          	jal	a844 <_Balloc>
    b48c:	06050063          	beqz	a0,b4ec <__mdiff+0x244>
    b490:	00c12083          	lw	ra,12(sp)
    b494:	00812403          	lw	s0,8(sp)
    b498:	00100793          	li	a5,1
    b49c:	00f52823          	sw	a5,16(a0)
    b4a0:	00052a23          	sw	zero,20(a0)
    b4a4:	00412483          	lw	s1,4(sp)
    b4a8:	00012903          	lw	s2,0(sp)
    b4ac:	01010113          	add	sp,sp,16
    b4b0:	00008067          	ret
    b4b4:	00000713          	li	a4,0
    b4b8:	000f1663          	bnez	t5,b4c4 <__mdiff+0x21c>
    b4bc:	00e58733          	add	a4,a1,a4
    b4c0:	f7dff06f          	j	b43c <__mdiff+0x194>
    b4c4:	00241713          	sll	a4,s0,0x2
    b4c8:	00e58733          	add	a4,a1,a4
    b4cc:	f71ff06f          	j	b43c <__mdiff+0x194>
    b4d0:	00005697          	auipc	a3,0x5
    b4d4:	e4868693          	add	a3,a3,-440 # 10318 <__fini_array_end+0x370>
    b4d8:	00000613          	li	a2,0
    b4dc:	24500593          	li	a1,581
    b4e0:	00005517          	auipc	a0,0x5
    b4e4:	ecc50513          	add	a0,a0,-308 # 103ac <__fini_array_end+0x404>
    b4e8:	381000ef          	jal	c068 <__assert_func>
    b4ec:	00005697          	auipc	a3,0x5
    b4f0:	e2c68693          	add	a3,a3,-468 # 10318 <__fini_array_end+0x370>
    b4f4:	00000613          	li	a2,0
    b4f8:	23700593          	li	a1,567
    b4fc:	00005517          	auipc	a0,0x5
    b500:	eb050513          	add	a0,a0,-336 # 103ac <__fini_array_end+0x404>
    b504:	365000ef          	jal	c068 <__assert_func>

0000b508 <__d2b>:
    b508:	fd010113          	add	sp,sp,-48
    b50c:	01512a23          	sw	s5,20(sp)
    b510:	00058a93          	mv	s5,a1
    b514:	00100593          	li	a1,1
    b518:	02912223          	sw	s1,36(sp)
    b51c:	01312e23          	sw	s3,28(sp)
    b520:	01412c23          	sw	s4,24(sp)
    b524:	02112623          	sw	ra,44(sp)
    b528:	02812423          	sw	s0,40(sp)
    b52c:	03212023          	sw	s2,32(sp)
    b530:	00060493          	mv	s1,a2
    b534:	00068a13          	mv	s4,a3
    b538:	00070993          	mv	s3,a4
    b53c:	b08ff0ef          	jal	a844 <_Balloc>
    b540:	10050263          	beqz	a0,b644 <__d2b+0x13c>
    b544:	00100737          	lui	a4,0x100
    b548:	0144d913          	srl	s2,s1,0x14
    b54c:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    b550:	7ff97913          	and	s2,s2,2047
    b554:	00050413          	mv	s0,a0
    b558:	0097f7b3          	and	a5,a5,s1
    b55c:	00090463          	beqz	s2,b564 <__d2b+0x5c>
    b560:	00e7e7b3          	or	a5,a5,a4
    b564:	00f12623          	sw	a5,12(sp)
    b568:	060a9263          	bnez	s5,b5cc <__d2b+0xc4>
    b56c:	00c10513          	add	a0,sp,12
    b570:	da8ff0ef          	jal	ab18 <__lo0bits>
    b574:	00c12703          	lw	a4,12(sp)
    b578:	00100493          	li	s1,1
    b57c:	00942823          	sw	s1,16(s0)
    b580:	00e42a23          	sw	a4,20(s0)
    b584:	02050793          	add	a5,a0,32
    b588:	08090863          	beqz	s2,b618 <__d2b+0x110>
    b58c:	bcd90913          	add	s2,s2,-1075
    b590:	00f90933          	add	s2,s2,a5
    b594:	03500493          	li	s1,53
    b598:	012a2023          	sw	s2,0(s4)
    b59c:	40f48533          	sub	a0,s1,a5
    b5a0:	00a9a023          	sw	a0,0(s3)
    b5a4:	02c12083          	lw	ra,44(sp)
    b5a8:	00040513          	mv	a0,s0
    b5ac:	02812403          	lw	s0,40(sp)
    b5b0:	02412483          	lw	s1,36(sp)
    b5b4:	02012903          	lw	s2,32(sp)
    b5b8:	01c12983          	lw	s3,28(sp)
    b5bc:	01812a03          	lw	s4,24(sp)
    b5c0:	01412a83          	lw	s5,20(sp)
    b5c4:	03010113          	add	sp,sp,48
    b5c8:	00008067          	ret
    b5cc:	00810513          	add	a0,sp,8
    b5d0:	01512423          	sw	s5,8(sp)
    b5d4:	d44ff0ef          	jal	ab18 <__lo0bits>
    b5d8:	00c12703          	lw	a4,12(sp)
    b5dc:	00050793          	mv	a5,a0
    b5e0:	04050e63          	beqz	a0,b63c <__d2b+0x134>
    b5e4:	00812603          	lw	a2,8(sp)
    b5e8:	02000693          	li	a3,32
    b5ec:	40a686b3          	sub	a3,a3,a0
    b5f0:	00d716b3          	sll	a3,a4,a3
    b5f4:	00a75733          	srl	a4,a4,a0
    b5f8:	00c6e6b3          	or	a3,a3,a2
    b5fc:	00e12623          	sw	a4,12(sp)
    b600:	00e034b3          	snez	s1,a4
    b604:	00148493          	add	s1,s1,1
    b608:	00d42a23          	sw	a3,20(s0)
    b60c:	00e42c23          	sw	a4,24(s0)
    b610:	00942823          	sw	s1,16(s0)
    b614:	f6091ce3          	bnez	s2,b58c <__d2b+0x84>
    b618:	00249713          	sll	a4,s1,0x2
    b61c:	00e40733          	add	a4,s0,a4
    b620:	01072503          	lw	a0,16(a4)
    b624:	bce78793          	add	a5,a5,-1074
    b628:	00fa2023          	sw	a5,0(s4)
    b62c:	c74ff0ef          	jal	aaa0 <__hi0bits>
    b630:	00549493          	sll	s1,s1,0x5
    b634:	40a48533          	sub	a0,s1,a0
    b638:	f69ff06f          	j	b5a0 <__d2b+0x98>
    b63c:	00812683          	lw	a3,8(sp)
    b640:	fc1ff06f          	j	b600 <__d2b+0xf8>
    b644:	00005697          	auipc	a3,0x5
    b648:	cd468693          	add	a3,a3,-812 # 10318 <__fini_array_end+0x370>
    b64c:	00000613          	li	a2,0
    b650:	30f00593          	li	a1,783
    b654:	00005517          	auipc	a0,0x5
    b658:	d5850513          	add	a0,a0,-680 # 103ac <__fini_array_end+0x404>
    b65c:	20d000ef          	jal	c068 <__assert_func>

0000b660 <_realloc_r>:
    b660:	fd010113          	add	sp,sp,-48
    b664:	02912223          	sw	s1,36(sp)
    b668:	02112623          	sw	ra,44(sp)
    b66c:	00060493          	mv	s1,a2
    b670:	1e058863          	beqz	a1,b860 <_realloc_r+0x200>
    b674:	02812423          	sw	s0,40(sp)
    b678:	03212023          	sw	s2,32(sp)
    b67c:	00058413          	mv	s0,a1
    b680:	01312e23          	sw	s3,28(sp)
    b684:	01512a23          	sw	s5,20(sp)
    b688:	01412c23          	sw	s4,24(sp)
    b68c:	00050913          	mv	s2,a0
    b690:	8b1f70ef          	jal	2f40 <__malloc_lock>
    b694:	ffc42703          	lw	a4,-4(s0)
    b698:	00b48793          	add	a5,s1,11
    b69c:	01600693          	li	a3,22
    b6a0:	ff840a93          	add	s5,s0,-8
    b6a4:	ffc77993          	and	s3,a4,-4
    b6a8:	10f6f263          	bgeu	a3,a5,b7ac <_realloc_r+0x14c>
    b6ac:	ff87fa13          	and	s4,a5,-8
    b6b0:	1007c263          	bltz	a5,b7b4 <_realloc_r+0x154>
    b6b4:	109a6063          	bltu	s4,s1,b7b4 <_realloc_r+0x154>
    b6b8:	1349d263          	bge	s3,s4,b7dc <_realloc_r+0x17c>
    b6bc:	01812423          	sw	s8,8(sp)
    b6c0:	7fff5c17          	auipc	s8,0x7fff5
    b6c4:	a60c0c13          	add	s8,s8,-1440 # 80000120 <__malloc_av_>
    b6c8:	008c2603          	lw	a2,8(s8)
    b6cc:	013a86b3          	add	a3,s5,s3
    b6d0:	0046a783          	lw	a5,4(a3)
    b6d4:	1cd60863          	beq	a2,a3,b8a4 <_realloc_r+0x244>
    b6d8:	ffe7f613          	and	a2,a5,-2
    b6dc:	00c68633          	add	a2,a3,a2
    b6e0:	00462603          	lw	a2,4(a2)
    b6e4:	00167613          	and	a2,a2,1
    b6e8:	14061a63          	bnez	a2,b83c <_realloc_r+0x1dc>
    b6ec:	ffc7f793          	and	a5,a5,-4
    b6f0:	00f98633          	add	a2,s3,a5
    b6f4:	0d465863          	bge	a2,s4,b7c4 <_realloc_r+0x164>
    b6f8:	00177713          	and	a4,a4,1
    b6fc:	02071c63          	bnez	a4,b734 <_realloc_r+0xd4>
    b700:	01712623          	sw	s7,12(sp)
    b704:	ff842b83          	lw	s7,-8(s0)
    b708:	01612823          	sw	s6,16(sp)
    b70c:	417a8bb3          	sub	s7,s5,s7
    b710:	004ba703          	lw	a4,4(s7)
    b714:	ffc77713          	and	a4,a4,-4
    b718:	00e787b3          	add	a5,a5,a4
    b71c:	01378b33          	add	s6,a5,s3
    b720:	334b5c63          	bge	s6,s4,ba58 <_realloc_r+0x3f8>
    b724:	00e98b33          	add	s6,s3,a4
    b728:	294b5863          	bge	s6,s4,b9b8 <_realloc_r+0x358>
    b72c:	01012b03          	lw	s6,16(sp)
    b730:	00c12b83          	lw	s7,12(sp)
    b734:	00048593          	mv	a1,s1
    b738:	00090513          	mv	a0,s2
    b73c:	824f70ef          	jal	2760 <_malloc_r>
    b740:	00050493          	mv	s1,a0
    b744:	40050863          	beqz	a0,bb54 <_realloc_r+0x4f4>
    b748:	ffc42783          	lw	a5,-4(s0)
    b74c:	ff850713          	add	a4,a0,-8
    b750:	ffe7f793          	and	a5,a5,-2
    b754:	00fa87b3          	add	a5,s5,a5
    b758:	24e78663          	beq	a5,a4,b9a4 <_realloc_r+0x344>
    b75c:	ffc98613          	add	a2,s3,-4
    b760:	02400793          	li	a5,36
    b764:	2ec7e463          	bltu	a5,a2,ba4c <_realloc_r+0x3ec>
    b768:	01300713          	li	a4,19
    b76c:	20c76a63          	bltu	a4,a2,b980 <_realloc_r+0x320>
    b770:	00050793          	mv	a5,a0
    b774:	00040713          	mv	a4,s0
    b778:	00072683          	lw	a3,0(a4)
    b77c:	00d7a023          	sw	a3,0(a5)
    b780:	00472683          	lw	a3,4(a4)
    b784:	00d7a223          	sw	a3,4(a5)
    b788:	00872703          	lw	a4,8(a4)
    b78c:	00e7a423          	sw	a4,8(a5)
    b790:	00040593          	mv	a1,s0
    b794:	00090513          	mv	a0,s2
    b798:	cbdf60ef          	jal	2454 <_free_r>
    b79c:	00090513          	mv	a0,s2
    b7a0:	facf70ef          	jal	2f4c <__malloc_unlock>
    b7a4:	00812c03          	lw	s8,8(sp)
    b7a8:	06c0006f          	j	b814 <_realloc_r+0x1b4>
    b7ac:	01000a13          	li	s4,16
    b7b0:	f09a74e3          	bgeu	s4,s1,b6b8 <_realloc_r+0x58>
    b7b4:	00c00793          	li	a5,12
    b7b8:	00f92023          	sw	a5,0(s2)
    b7bc:	00000493          	li	s1,0
    b7c0:	0540006f          	j	b814 <_realloc_r+0x1b4>
    b7c4:	00c6a783          	lw	a5,12(a3)
    b7c8:	0086a703          	lw	a4,8(a3)
    b7cc:	00812c03          	lw	s8,8(sp)
    b7d0:	00060993          	mv	s3,a2
    b7d4:	00f72623          	sw	a5,12(a4)
    b7d8:	00e7a423          	sw	a4,8(a5)
    b7dc:	004aa783          	lw	a5,4(s5)
    b7e0:	414986b3          	sub	a3,s3,s4
    b7e4:	00f00613          	li	a2,15
    b7e8:	0017f793          	and	a5,a5,1
    b7ec:	013a8733          	add	a4,s5,s3
    b7f0:	08d66263          	bltu	a2,a3,b874 <_realloc_r+0x214>
    b7f4:	0137e7b3          	or	a5,a5,s3
    b7f8:	00faa223          	sw	a5,4(s5)
    b7fc:	00472783          	lw	a5,4(a4)
    b800:	0017e793          	or	a5,a5,1
    b804:	00f72223          	sw	a5,4(a4)
    b808:	00090513          	mv	a0,s2
    b80c:	f40f70ef          	jal	2f4c <__malloc_unlock>
    b810:	00040493          	mv	s1,s0
    b814:	02812403          	lw	s0,40(sp)
    b818:	02c12083          	lw	ra,44(sp)
    b81c:	02012903          	lw	s2,32(sp)
    b820:	01c12983          	lw	s3,28(sp)
    b824:	01812a03          	lw	s4,24(sp)
    b828:	01412a83          	lw	s5,20(sp)
    b82c:	00048513          	mv	a0,s1
    b830:	02412483          	lw	s1,36(sp)
    b834:	03010113          	add	sp,sp,48
    b838:	00008067          	ret
    b83c:	00177713          	and	a4,a4,1
    b840:	ee071ae3          	bnez	a4,b734 <_realloc_r+0xd4>
    b844:	01712623          	sw	s7,12(sp)
    b848:	ff842b83          	lw	s7,-8(s0)
    b84c:	01612823          	sw	s6,16(sp)
    b850:	417a8bb3          	sub	s7,s5,s7
    b854:	004ba703          	lw	a4,4(s7)
    b858:	ffc77713          	and	a4,a4,-4
    b85c:	ec9ff06f          	j	b724 <_realloc_r+0xc4>
    b860:	02c12083          	lw	ra,44(sp)
    b864:	02412483          	lw	s1,36(sp)
    b868:	00060593          	mv	a1,a2
    b86c:	03010113          	add	sp,sp,48
    b870:	ef1f606f          	j	2760 <_malloc_r>
    b874:	0147e7b3          	or	a5,a5,s4
    b878:	00faa223          	sw	a5,4(s5)
    b87c:	014a85b3          	add	a1,s5,s4
    b880:	0016e693          	or	a3,a3,1
    b884:	00d5a223          	sw	a3,4(a1)
    b888:	00472783          	lw	a5,4(a4)
    b88c:	00858593          	add	a1,a1,8
    b890:	00090513          	mv	a0,s2
    b894:	0017e793          	or	a5,a5,1
    b898:	00f72223          	sw	a5,4(a4)
    b89c:	bb9f60ef          	jal	2454 <_free_r>
    b8a0:	f69ff06f          	j	b808 <_realloc_r+0x1a8>
    b8a4:	ffc7f793          	and	a5,a5,-4
    b8a8:	013786b3          	add	a3,a5,s3
    b8ac:	010a0613          	add	a2,s4,16
    b8b0:	26c6d063          	bge	a3,a2,bb10 <_realloc_r+0x4b0>
    b8b4:	00177713          	and	a4,a4,1
    b8b8:	e6071ee3          	bnez	a4,b734 <_realloc_r+0xd4>
    b8bc:	01712623          	sw	s7,12(sp)
    b8c0:	ff842b83          	lw	s7,-8(s0)
    b8c4:	01612823          	sw	s6,16(sp)
    b8c8:	417a8bb3          	sub	s7,s5,s7
    b8cc:	004ba703          	lw	a4,4(s7)
    b8d0:	ffc77713          	and	a4,a4,-4
    b8d4:	00e787b3          	add	a5,a5,a4
    b8d8:	01378b33          	add	s6,a5,s3
    b8dc:	e4cb44e3          	blt	s6,a2,b724 <_realloc_r+0xc4>
    b8e0:	00cba783          	lw	a5,12(s7)
    b8e4:	008ba703          	lw	a4,8(s7)
    b8e8:	ffc98613          	add	a2,s3,-4
    b8ec:	02400693          	li	a3,36
    b8f0:	00f72623          	sw	a5,12(a4)
    b8f4:	00e7a423          	sw	a4,8(a5)
    b8f8:	008b8493          	add	s1,s7,8
    b8fc:	28c6e463          	bltu	a3,a2,bb84 <_realloc_r+0x524>
    b900:	01300713          	li	a4,19
    b904:	00048793          	mv	a5,s1
    b908:	02c77263          	bgeu	a4,a2,b92c <_realloc_r+0x2cc>
    b90c:	00042703          	lw	a4,0(s0)
    b910:	01b00793          	li	a5,27
    b914:	00eba423          	sw	a4,8(s7)
    b918:	00442703          	lw	a4,4(s0)
    b91c:	00eba623          	sw	a4,12(s7)
    b920:	26c7ea63          	bltu	a5,a2,bb94 <_realloc_r+0x534>
    b924:	00840413          	add	s0,s0,8
    b928:	010b8793          	add	a5,s7,16
    b92c:	00042703          	lw	a4,0(s0)
    b930:	00e7a023          	sw	a4,0(a5)
    b934:	00442703          	lw	a4,4(s0)
    b938:	00e7a223          	sw	a4,4(a5)
    b93c:	00842703          	lw	a4,8(s0)
    b940:	00e7a423          	sw	a4,8(a5)
    b944:	014b8733          	add	a4,s7,s4
    b948:	414b07b3          	sub	a5,s6,s4
    b94c:	00ec2423          	sw	a4,8(s8)
    b950:	0017e793          	or	a5,a5,1
    b954:	00f72223          	sw	a5,4(a4)
    b958:	004ba783          	lw	a5,4(s7)
    b95c:	00090513          	mv	a0,s2
    b960:	0017f793          	and	a5,a5,1
    b964:	0147e7b3          	or	a5,a5,s4
    b968:	00fba223          	sw	a5,4(s7)
    b96c:	de0f70ef          	jal	2f4c <__malloc_unlock>
    b970:	01012b03          	lw	s6,16(sp)
    b974:	00c12b83          	lw	s7,12(sp)
    b978:	00812c03          	lw	s8,8(sp)
    b97c:	e99ff06f          	j	b814 <_realloc_r+0x1b4>
    b980:	00042683          	lw	a3,0(s0)
    b984:	01b00713          	li	a4,27
    b988:	00d52023          	sw	a3,0(a0)
    b98c:	00442683          	lw	a3,4(s0)
    b990:	00d52223          	sw	a3,4(a0)
    b994:	14c76e63          	bltu	a4,a2,baf0 <_realloc_r+0x490>
    b998:	00840713          	add	a4,s0,8
    b99c:	00850793          	add	a5,a0,8
    b9a0:	dd9ff06f          	j	b778 <_realloc_r+0x118>
    b9a4:	ffc52783          	lw	a5,-4(a0)
    b9a8:	00812c03          	lw	s8,8(sp)
    b9ac:	ffc7f793          	and	a5,a5,-4
    b9b0:	00f989b3          	add	s3,s3,a5
    b9b4:	e29ff06f          	j	b7dc <_realloc_r+0x17c>
    b9b8:	00cba783          	lw	a5,12(s7)
    b9bc:	008ba703          	lw	a4,8(s7)
    b9c0:	ffc98613          	add	a2,s3,-4
    b9c4:	02400693          	li	a3,36
    b9c8:	00f72623          	sw	a5,12(a4)
    b9cc:	00e7a423          	sw	a4,8(a5)
    b9d0:	008b8493          	add	s1,s7,8
    b9d4:	10c6e663          	bltu	a3,a2,bae0 <_realloc_r+0x480>
    b9d8:	01300713          	li	a4,19
    b9dc:	00048793          	mv	a5,s1
    b9e0:	02c77c63          	bgeu	a4,a2,ba18 <_realloc_r+0x3b8>
    b9e4:	00042703          	lw	a4,0(s0)
    b9e8:	01b00793          	li	a5,27
    b9ec:	00eba423          	sw	a4,8(s7)
    b9f0:	00442703          	lw	a4,4(s0)
    b9f4:	00eba623          	sw	a4,12(s7)
    b9f8:	14c7f863          	bgeu	a5,a2,bb48 <_realloc_r+0x4e8>
    b9fc:	00842783          	lw	a5,8(s0)
    ba00:	00fba823          	sw	a5,16(s7)
    ba04:	00c42783          	lw	a5,12(s0)
    ba08:	00fbaa23          	sw	a5,20(s7)
    ba0c:	0ad60c63          	beq	a2,a3,bac4 <_realloc_r+0x464>
    ba10:	01040413          	add	s0,s0,16
    ba14:	018b8793          	add	a5,s7,24
    ba18:	00042703          	lw	a4,0(s0)
    ba1c:	00e7a023          	sw	a4,0(a5)
    ba20:	00442703          	lw	a4,4(s0)
    ba24:	00e7a223          	sw	a4,4(a5)
    ba28:	00842703          	lw	a4,8(s0)
    ba2c:	00e7a423          	sw	a4,8(a5)
    ba30:	000b0993          	mv	s3,s6
    ba34:	000b8a93          	mv	s5,s7
    ba38:	01012b03          	lw	s6,16(sp)
    ba3c:	00c12b83          	lw	s7,12(sp)
    ba40:	00812c03          	lw	s8,8(sp)
    ba44:	00048413          	mv	s0,s1
    ba48:	d95ff06f          	j	b7dc <_realloc_r+0x17c>
    ba4c:	00040593          	mv	a1,s0
    ba50:	ae8fd0ef          	jal	8d38 <memmove>
    ba54:	d3dff06f          	j	b790 <_realloc_r+0x130>
    ba58:	00c6a783          	lw	a5,12(a3)
    ba5c:	0086a703          	lw	a4,8(a3)
    ba60:	ffc98613          	add	a2,s3,-4
    ba64:	02400693          	li	a3,36
    ba68:	00f72623          	sw	a5,12(a4)
    ba6c:	00e7a423          	sw	a4,8(a5)
    ba70:	008ba703          	lw	a4,8(s7)
    ba74:	00cba783          	lw	a5,12(s7)
    ba78:	008b8493          	add	s1,s7,8
    ba7c:	00f72623          	sw	a5,12(a4)
    ba80:	00e7a423          	sw	a4,8(a5)
    ba84:	04c6ee63          	bltu	a3,a2,bae0 <_realloc_r+0x480>
    ba88:	01300713          	li	a4,19
    ba8c:	00048793          	mv	a5,s1
    ba90:	f8c774e3          	bgeu	a4,a2,ba18 <_realloc_r+0x3b8>
    ba94:	00042703          	lw	a4,0(s0)
    ba98:	01b00793          	li	a5,27
    ba9c:	00eba423          	sw	a4,8(s7)
    baa0:	00442703          	lw	a4,4(s0)
    baa4:	00eba623          	sw	a4,12(s7)
    baa8:	0ac7f063          	bgeu	a5,a2,bb48 <_realloc_r+0x4e8>
    baac:	00842703          	lw	a4,8(s0)
    bab0:	02400793          	li	a5,36
    bab4:	00eba823          	sw	a4,16(s7)
    bab8:	00c42703          	lw	a4,12(s0)
    babc:	00ebaa23          	sw	a4,20(s7)
    bac0:	f4f618e3          	bne	a2,a5,ba10 <_realloc_r+0x3b0>
    bac4:	01042703          	lw	a4,16(s0)
    bac8:	020b8793          	add	a5,s7,32
    bacc:	01840413          	add	s0,s0,24
    bad0:	00ebac23          	sw	a4,24(s7)
    bad4:	ffc42703          	lw	a4,-4(s0)
    bad8:	00ebae23          	sw	a4,28(s7)
    badc:	f3dff06f          	j	ba18 <_realloc_r+0x3b8>
    bae0:	00040593          	mv	a1,s0
    bae4:	00048513          	mv	a0,s1
    bae8:	a50fd0ef          	jal	8d38 <memmove>
    baec:	f45ff06f          	j	ba30 <_realloc_r+0x3d0>
    baf0:	00842703          	lw	a4,8(s0)
    baf4:	00e52423          	sw	a4,8(a0)
    baf8:	00c42703          	lw	a4,12(s0)
    bafc:	00e52623          	sw	a4,12(a0)
    bb00:	06f60463          	beq	a2,a5,bb68 <_realloc_r+0x508>
    bb04:	01040713          	add	a4,s0,16
    bb08:	01050793          	add	a5,a0,16
    bb0c:	c6dff06f          	j	b778 <_realloc_r+0x118>
    bb10:	014a8ab3          	add	s5,s5,s4
    bb14:	414687b3          	sub	a5,a3,s4
    bb18:	015c2423          	sw	s5,8(s8)
    bb1c:	0017e793          	or	a5,a5,1
    bb20:	00faa223          	sw	a5,4(s5)
    bb24:	ffc42783          	lw	a5,-4(s0)
    bb28:	00090513          	mv	a0,s2
    bb2c:	00040493          	mv	s1,s0
    bb30:	0017f793          	and	a5,a5,1
    bb34:	0147e7b3          	or	a5,a5,s4
    bb38:	fef42e23          	sw	a5,-4(s0)
    bb3c:	c10f70ef          	jal	2f4c <__malloc_unlock>
    bb40:	00812c03          	lw	s8,8(sp)
    bb44:	cd1ff06f          	j	b814 <_realloc_r+0x1b4>
    bb48:	00840413          	add	s0,s0,8
    bb4c:	010b8793          	add	a5,s7,16
    bb50:	ec9ff06f          	j	ba18 <_realloc_r+0x3b8>
    bb54:	00090513          	mv	a0,s2
    bb58:	bf4f70ef          	jal	2f4c <__malloc_unlock>
    bb5c:	00000493          	li	s1,0
    bb60:	00812c03          	lw	s8,8(sp)
    bb64:	cb1ff06f          	j	b814 <_realloc_r+0x1b4>
    bb68:	01042683          	lw	a3,16(s0)
    bb6c:	01840713          	add	a4,s0,24
    bb70:	01850793          	add	a5,a0,24
    bb74:	00d52823          	sw	a3,16(a0)
    bb78:	01442683          	lw	a3,20(s0)
    bb7c:	00d52a23          	sw	a3,20(a0)
    bb80:	bf9ff06f          	j	b778 <_realloc_r+0x118>
    bb84:	00040593          	mv	a1,s0
    bb88:	00048513          	mv	a0,s1
    bb8c:	9acfd0ef          	jal	8d38 <memmove>
    bb90:	db5ff06f          	j	b944 <_realloc_r+0x2e4>
    bb94:	00842783          	lw	a5,8(s0)
    bb98:	00fba823          	sw	a5,16(s7)
    bb9c:	00c42783          	lw	a5,12(s0)
    bba0:	00fbaa23          	sw	a5,20(s7)
    bba4:	00d60863          	beq	a2,a3,bbb4 <_realloc_r+0x554>
    bba8:	01040413          	add	s0,s0,16
    bbac:	018b8793          	add	a5,s7,24
    bbb0:	d7dff06f          	j	b92c <_realloc_r+0x2cc>
    bbb4:	01042703          	lw	a4,16(s0)
    bbb8:	020b8793          	add	a5,s7,32
    bbbc:	01840413          	add	s0,s0,24
    bbc0:	00ebac23          	sw	a4,24(s7)
    bbc4:	ffc42703          	lw	a4,-4(s0)
    bbc8:	00ebae23          	sw	a4,28(s7)
    bbcc:	d61ff06f          	j	b92c <_realloc_r+0x2cc>

0000bbd0 <__ascii_wctomb>:
    bbd0:	02058463          	beqz	a1,bbf8 <__ascii_wctomb+0x28>
    bbd4:	0ff00793          	li	a5,255
    bbd8:	00c7e863          	bltu	a5,a2,bbe8 <__ascii_wctomb+0x18>
    bbdc:	00c58023          	sb	a2,0(a1)
    bbe0:	00100513          	li	a0,1
    bbe4:	00008067          	ret
    bbe8:	08a00793          	li	a5,138
    bbec:	00f52023          	sw	a5,0(a0)
    bbf0:	fff00513          	li	a0,-1
    bbf4:	00008067          	ret
    bbf8:	00000513          	li	a0,0
    bbfc:	00008067          	ret

0000bc00 <_wcrtomb_r>:
    bc00:	fe010113          	add	sp,sp,-32
    bc04:	00812c23          	sw	s0,24(sp)
    bc08:	00912a23          	sw	s1,20(sp)
    bc0c:	00112e23          	sw	ra,28(sp)
    bc10:	00050493          	mv	s1,a0
    bc14:	10450413          	add	s0,a0,260
    bc18:	00068463          	beqz	a3,bc20 <_wcrtomb_r+0x20>
    bc1c:	00068413          	mv	s0,a3
    bc20:	7fff5797          	auipc	a5,0x7fff5
    bc24:	9f47a783          	lw	a5,-1548(a5) # 80000614 <__global_locale+0xe0>
    bc28:	00040693          	mv	a3,s0
    bc2c:	02058463          	beqz	a1,bc54 <_wcrtomb_r+0x54>
    bc30:	00048513          	mv	a0,s1
    bc34:	000780e7          	jalr	a5
    bc38:	fff00793          	li	a5,-1
    bc3c:	02f50863          	beq	a0,a5,bc6c <_wcrtomb_r+0x6c>
    bc40:	01c12083          	lw	ra,28(sp)
    bc44:	01812403          	lw	s0,24(sp)
    bc48:	01412483          	lw	s1,20(sp)
    bc4c:	02010113          	add	sp,sp,32
    bc50:	00008067          	ret
    bc54:	00000613          	li	a2,0
    bc58:	00410593          	add	a1,sp,4
    bc5c:	00048513          	mv	a0,s1
    bc60:	000780e7          	jalr	a5
    bc64:	fff00793          	li	a5,-1
    bc68:	fcf51ce3          	bne	a0,a5,bc40 <_wcrtomb_r+0x40>
    bc6c:	00042023          	sw	zero,0(s0)
    bc70:	01c12083          	lw	ra,28(sp)
    bc74:	01812403          	lw	s0,24(sp)
    bc78:	08a00793          	li	a5,138
    bc7c:	00f4a023          	sw	a5,0(s1)
    bc80:	01412483          	lw	s1,20(sp)
    bc84:	02010113          	add	sp,sp,32
    bc88:	00008067          	ret

0000bc8c <_wcsrtombs_r>:
    bc8c:	00070793          	mv	a5,a4
    bc90:	00068713          	mv	a4,a3
    bc94:	fff00693          	li	a3,-1
    bc98:	7a40006f          	j	c43c <_wcsnrtombs_r>

0000bc9c <_fclose_r>:
    bc9c:	ff010113          	add	sp,sp,-16
    bca0:	00112623          	sw	ra,12(sp)
    bca4:	01212023          	sw	s2,0(sp)
    bca8:	0e058263          	beqz	a1,bd8c <_fclose_r+0xf0>
    bcac:	00812423          	sw	s0,8(sp)
    bcb0:	00912223          	sw	s1,4(sp)
    bcb4:	00058413          	mv	s0,a1
    bcb8:	00050493          	mv	s1,a0
    bcbc:	00050663          	beqz	a0,bcc8 <_fclose_r+0x2c>
    bcc0:	03452783          	lw	a5,52(a0)
    bcc4:	10078063          	beqz	a5,bdc4 <_fclose_r+0x128>
    bcc8:	06442783          	lw	a5,100(s0)
    bccc:	00c41703          	lh	a4,12(s0)
    bcd0:	0017f793          	and	a5,a5,1
    bcd4:	0a079663          	bnez	a5,bd80 <_fclose_r+0xe4>
    bcd8:	20077713          	and	a4,a4,512
    bcdc:	0e070863          	beqz	a4,bdcc <_fclose_r+0x130>
    bce0:	00040593          	mv	a1,s0
    bce4:	00048513          	mv	a0,s1
    bce8:	9f5fb0ef          	jal	76dc <__sflush_r>
    bcec:	02c42783          	lw	a5,44(s0)
    bcf0:	00050913          	mv	s2,a0
    bcf4:	00078a63          	beqz	a5,bd08 <_fclose_r+0x6c>
    bcf8:	01c42583          	lw	a1,28(s0)
    bcfc:	00048513          	mv	a0,s1
    bd00:	000780e7          	jalr	a5
    bd04:	0a054063          	bltz	a0,bda4 <_fclose_r+0x108>
    bd08:	00c45783          	lhu	a5,12(s0)
    bd0c:	0807f793          	and	a5,a5,128
    bd10:	0a079263          	bnez	a5,bdb4 <_fclose_r+0x118>
    bd14:	03042583          	lw	a1,48(s0)
    bd18:	00058c63          	beqz	a1,bd30 <_fclose_r+0x94>
    bd1c:	04040793          	add	a5,s0,64
    bd20:	00f58663          	beq	a1,a5,bd2c <_fclose_r+0x90>
    bd24:	00048513          	mv	a0,s1
    bd28:	f2cf60ef          	jal	2454 <_free_r>
    bd2c:	02042823          	sw	zero,48(s0)
    bd30:	04442583          	lw	a1,68(s0)
    bd34:	00058863          	beqz	a1,bd44 <_fclose_r+0xa8>
    bd38:	00048513          	mv	a0,s1
    bd3c:	f18f60ef          	jal	2454 <_free_r>
    bd40:	04042223          	sw	zero,68(s0)
    bd44:	f51fb0ef          	jal	7c94 <__sfp_lock_acquire>
    bd48:	06442783          	lw	a5,100(s0)
    bd4c:	00041623          	sh	zero,12(s0)
    bd50:	0017f793          	and	a5,a5,1
    bd54:	0a078663          	beqz	a5,be00 <_fclose_r+0x164>
    bd58:	05842503          	lw	a0,88(s0)
    bd5c:	a9cf60ef          	jal	1ff8 <__retarget_lock_close_recursive>
    bd60:	f41fb0ef          	jal	7ca0 <__sfp_lock_release>
    bd64:	00c12083          	lw	ra,12(sp)
    bd68:	00812403          	lw	s0,8(sp)
    bd6c:	00412483          	lw	s1,4(sp)
    bd70:	00090513          	mv	a0,s2
    bd74:	00012903          	lw	s2,0(sp)
    bd78:	01010113          	add	sp,sp,16
    bd7c:	00008067          	ret
    bd80:	f60710e3          	bnez	a4,bce0 <_fclose_r+0x44>
    bd84:	00812403          	lw	s0,8(sp)
    bd88:	00412483          	lw	s1,4(sp)
    bd8c:	00000913          	li	s2,0
    bd90:	00c12083          	lw	ra,12(sp)
    bd94:	00090513          	mv	a0,s2
    bd98:	00012903          	lw	s2,0(sp)
    bd9c:	01010113          	add	sp,sp,16
    bda0:	00008067          	ret
    bda4:	00c45783          	lhu	a5,12(s0)
    bda8:	fff00913          	li	s2,-1
    bdac:	0807f793          	and	a5,a5,128
    bdb0:	f60782e3          	beqz	a5,bd14 <_fclose_r+0x78>
    bdb4:	01042583          	lw	a1,16(s0)
    bdb8:	00048513          	mv	a0,s1
    bdbc:	e98f60ef          	jal	2454 <_free_r>
    bdc0:	f55ff06f          	j	bd14 <_fclose_r+0x78>
    bdc4:	e61fb0ef          	jal	7c24 <__sinit>
    bdc8:	f01ff06f          	j	bcc8 <_fclose_r+0x2c>
    bdcc:	05842503          	lw	a0,88(s0)
    bdd0:	a2cf60ef          	jal	1ffc <__retarget_lock_acquire_recursive>
    bdd4:	00c41783          	lh	a5,12(s0)
    bdd8:	f00794e3          	bnez	a5,bce0 <_fclose_r+0x44>
    bddc:	06442783          	lw	a5,100(s0)
    bde0:	0017f793          	and	a5,a5,1
    bde4:	fa0790e3          	bnez	a5,bd84 <_fclose_r+0xe8>
    bde8:	05842503          	lw	a0,88(s0)
    bdec:	00000913          	li	s2,0
    bdf0:	a10f60ef          	jal	2000 <__retarget_lock_release_recursive>
    bdf4:	00812403          	lw	s0,8(sp)
    bdf8:	00412483          	lw	s1,4(sp)
    bdfc:	f95ff06f          	j	bd90 <_fclose_r+0xf4>
    be00:	05842503          	lw	a0,88(s0)
    be04:	9fcf60ef          	jal	2000 <__retarget_lock_release_recursive>
    be08:	f51ff06f          	j	bd58 <_fclose_r+0xbc>

0000be0c <__smakebuf_r>:
    be0c:	00c59783          	lh	a5,12(a1)
    be10:	f8010113          	add	sp,sp,-128
    be14:	06812c23          	sw	s0,120(sp)
    be18:	06112e23          	sw	ra,124(sp)
    be1c:	0027f713          	and	a4,a5,2
    be20:	00058413          	mv	s0,a1
    be24:	02070463          	beqz	a4,be4c <__smakebuf_r+0x40>
    be28:	04358793          	add	a5,a1,67
    be2c:	00f5a023          	sw	a5,0(a1)
    be30:	00f5a823          	sw	a5,16(a1)
    be34:	00100793          	li	a5,1
    be38:	00f5aa23          	sw	a5,20(a1)
    be3c:	07c12083          	lw	ra,124(sp)
    be40:	07812403          	lw	s0,120(sp)
    be44:	08010113          	add	sp,sp,128
    be48:	00008067          	ret
    be4c:	00e59583          	lh	a1,14(a1)
    be50:	06912a23          	sw	s1,116(sp)
    be54:	07212823          	sw	s2,112(sp)
    be58:	07312623          	sw	s3,108(sp)
    be5c:	07412423          	sw	s4,104(sp)
    be60:	00050493          	mv	s1,a0
    be64:	0805c663          	bltz	a1,bef0 <__smakebuf_r+0xe4>
    be68:	00810613          	add	a2,sp,8
    be6c:	138000ef          	jal	bfa4 <_fstat_r>
    be70:	06054e63          	bltz	a0,beec <__smakebuf_r+0xe0>
    be74:	00c12783          	lw	a5,12(sp)
    be78:	0000f937          	lui	s2,0xf
    be7c:	000019b7          	lui	s3,0x1
    be80:	00f97933          	and	s2,s2,a5
    be84:	ffffe7b7          	lui	a5,0xffffe
    be88:	00f90933          	add	s2,s2,a5
    be8c:	00193913          	seqz	s2,s2
    be90:	40000a13          	li	s4,1024
    be94:	80098993          	add	s3,s3,-2048 # 800 <conv_cfu.constprop.0+0x3cc>
    be98:	000a0593          	mv	a1,s4
    be9c:	00048513          	mv	a0,s1
    bea0:	8c1f60ef          	jal	2760 <_malloc_r>
    bea4:	00c41783          	lh	a5,12(s0)
    bea8:	06050863          	beqz	a0,bf18 <__smakebuf_r+0x10c>
    beac:	0807e793          	or	a5,a5,128
    beb0:	00a42023          	sw	a0,0(s0)
    beb4:	00a42823          	sw	a0,16(s0)
    beb8:	00f41623          	sh	a5,12(s0)
    bebc:	01442a23          	sw	s4,20(s0)
    bec0:	0a091063          	bnez	s2,bf60 <__smakebuf_r+0x154>
    bec4:	0137e7b3          	or	a5,a5,s3
    bec8:	07c12083          	lw	ra,124(sp)
    becc:	00f41623          	sh	a5,12(s0)
    bed0:	07812403          	lw	s0,120(sp)
    bed4:	07412483          	lw	s1,116(sp)
    bed8:	07012903          	lw	s2,112(sp)
    bedc:	06c12983          	lw	s3,108(sp)
    bee0:	06812a03          	lw	s4,104(sp)
    bee4:	08010113          	add	sp,sp,128
    bee8:	00008067          	ret
    beec:	00c41783          	lh	a5,12(s0)
    bef0:	0807f793          	and	a5,a5,128
    bef4:	00000913          	li	s2,0
    bef8:	04078e63          	beqz	a5,bf54 <__smakebuf_r+0x148>
    befc:	04000a13          	li	s4,64
    bf00:	000a0593          	mv	a1,s4
    bf04:	00048513          	mv	a0,s1
    bf08:	859f60ef          	jal	2760 <_malloc_r>
    bf0c:	00c41783          	lh	a5,12(s0)
    bf10:	00000993          	li	s3,0
    bf14:	f8051ce3          	bnez	a0,beac <__smakebuf_r+0xa0>
    bf18:	2007f713          	and	a4,a5,512
    bf1c:	04071e63          	bnez	a4,bf78 <__smakebuf_r+0x16c>
    bf20:	ffc7f793          	and	a5,a5,-4
    bf24:	0027e793          	or	a5,a5,2
    bf28:	04340713          	add	a4,s0,67
    bf2c:	00f41623          	sh	a5,12(s0)
    bf30:	00100793          	li	a5,1
    bf34:	07412483          	lw	s1,116(sp)
    bf38:	07012903          	lw	s2,112(sp)
    bf3c:	06c12983          	lw	s3,108(sp)
    bf40:	06812a03          	lw	s4,104(sp)
    bf44:	00e42023          	sw	a4,0(s0)
    bf48:	00e42823          	sw	a4,16(s0)
    bf4c:	00f42a23          	sw	a5,20(s0)
    bf50:	eedff06f          	j	be3c <__smakebuf_r+0x30>
    bf54:	40000a13          	li	s4,1024
    bf58:	00000993          	li	s3,0
    bf5c:	f3dff06f          	j	be98 <__smakebuf_r+0x8c>
    bf60:	00e41583          	lh	a1,14(s0)
    bf64:	00048513          	mv	a0,s1
    bf68:	09c000ef          	jal	c004 <_isatty_r>
    bf6c:	02051063          	bnez	a0,bf8c <__smakebuf_r+0x180>
    bf70:	00c41783          	lh	a5,12(s0)
    bf74:	f51ff06f          	j	bec4 <__smakebuf_r+0xb8>
    bf78:	07412483          	lw	s1,116(sp)
    bf7c:	07012903          	lw	s2,112(sp)
    bf80:	06c12983          	lw	s3,108(sp)
    bf84:	06812a03          	lw	s4,104(sp)
    bf88:	eb5ff06f          	j	be3c <__smakebuf_r+0x30>
    bf8c:	00c45783          	lhu	a5,12(s0)
    bf90:	ffc7f793          	and	a5,a5,-4
    bf94:	0017e793          	or	a5,a5,1
    bf98:	01079793          	sll	a5,a5,0x10
    bf9c:	4107d793          	sra	a5,a5,0x10
    bfa0:	f25ff06f          	j	bec4 <__smakebuf_r+0xb8>

0000bfa4 <_fstat_r>:
    bfa4:	ff010113          	add	sp,sp,-16
    bfa8:	00058713          	mv	a4,a1
    bfac:	00812423          	sw	s0,8(sp)
    bfb0:	00060593          	mv	a1,a2
    bfb4:	00050413          	mv	s0,a0
    bfb8:	00070513          	mv	a0,a4
    bfbc:	7fff4797          	auipc	a5,0x7fff4
    bfc0:	7607a023          	sw	zero,1888(a5) # 8000071c <errno>
    bfc4:	00112623          	sw	ra,12(sp)
    bfc8:	c15f50ef          	jal	1bdc <_fstat>
    bfcc:	fff00793          	li	a5,-1
    bfd0:	00f50a63          	beq	a0,a5,bfe4 <_fstat_r+0x40>
    bfd4:	00c12083          	lw	ra,12(sp)
    bfd8:	00812403          	lw	s0,8(sp)
    bfdc:	01010113          	add	sp,sp,16
    bfe0:	00008067          	ret
    bfe4:	7fff4797          	auipc	a5,0x7fff4
    bfe8:	7387a783          	lw	a5,1848(a5) # 8000071c <errno>
    bfec:	fe0784e3          	beqz	a5,bfd4 <_fstat_r+0x30>
    bff0:	00c12083          	lw	ra,12(sp)
    bff4:	00f42023          	sw	a5,0(s0)
    bff8:	00812403          	lw	s0,8(sp)
    bffc:	01010113          	add	sp,sp,16
    c000:	00008067          	ret

0000c004 <_isatty_r>:
    c004:	ff010113          	add	sp,sp,-16
    c008:	00812423          	sw	s0,8(sp)
    c00c:	00050413          	mv	s0,a0
    c010:	00058513          	mv	a0,a1
    c014:	7fff4797          	auipc	a5,0x7fff4
    c018:	7007a423          	sw	zero,1800(a5) # 8000071c <errno>
    c01c:	00112623          	sw	ra,12(sp)
    c020:	bd5f50ef          	jal	1bf4 <_isatty>
    c024:	fff00793          	li	a5,-1
    c028:	00f50a63          	beq	a0,a5,c03c <_isatty_r+0x38>
    c02c:	00c12083          	lw	ra,12(sp)
    c030:	00812403          	lw	s0,8(sp)
    c034:	01010113          	add	sp,sp,16
    c038:	00008067          	ret
    c03c:	7fff4797          	auipc	a5,0x7fff4
    c040:	6e07a783          	lw	a5,1760(a5) # 8000071c <errno>
    c044:	fe0784e3          	beqz	a5,c02c <_isatty_r+0x28>
    c048:	00c12083          	lw	ra,12(sp)
    c04c:	00f42023          	sw	a5,0(s0)
    c050:	00812403          	lw	s0,8(sp)
    c054:	01010113          	add	sp,sp,16
    c058:	00008067          	ret

0000c05c <__errno>:
    c05c:	7fff4517          	auipc	a0,0x7fff4
    c060:	6ac52503          	lw	a0,1708(a0) # 80000708 <_impure_ptr>
    c064:	00008067          	ret

0000c068 <__assert_func>:
    c068:	ff010113          	add	sp,sp,-16
    c06c:	00068793          	mv	a5,a3
    c070:	7fff4717          	auipc	a4,0x7fff4
    c074:	69872703          	lw	a4,1688(a4) # 80000708 <_impure_ptr>
    c078:	00060813          	mv	a6,a2
    c07c:	00112623          	sw	ra,12(sp)
    c080:	00c72883          	lw	a7,12(a4)
    c084:	00078613          	mv	a2,a5
    c088:	00050693          	mv	a3,a0
    c08c:	00058713          	mv	a4,a1
    c090:	00004797          	auipc	a5,0x4
    c094:	39c78793          	add	a5,a5,924 # 1042c <__fini_array_end+0x484>
    c098:	00080c63          	beqz	a6,c0b0 <__assert_func+0x48>
    c09c:	00004597          	auipc	a1,0x4
    c0a0:	3a058593          	add	a1,a1,928 # 1043c <__fini_array_end+0x494>
    c0a4:	00088513          	mv	a0,a7
    c0a8:	3a8000ef          	jal	c450 <fiprintf>
    c0ac:	3f0000ef          	jal	c49c <abort>
    c0b0:	00004797          	auipc	a5,0x4
    c0b4:	f8478793          	add	a5,a5,-124 # 10034 <__fini_array_end+0x8c>
    c0b8:	00078813          	mv	a6,a5
    c0bc:	fe1ff06f          	j	c09c <__assert_func+0x34>

0000c0c0 <_calloc_r>:
    c0c0:	fe010113          	add	sp,sp,-32
    c0c4:	00812c23          	sw	s0,24(sp)
    c0c8:	00112e23          	sw	ra,28(sp)
    c0cc:	0105d693          	srl	a3,a1,0x10
    c0d0:	00058793          	mv	a5,a1
    c0d4:	00050413          	mv	s0,a0
    c0d8:	01065713          	srl	a4,a2,0x10
    c0dc:	0c069063          	bnez	a3,c19c <_calloc_r+0xdc>
    c0e0:	14071a63          	bnez	a4,c234 <_calloc_r+0x174>
    c0e4:	01061593          	sll	a1,a2,0x10
    c0e8:	01079513          	sll	a0,a5,0x10
    c0ec:	0105d593          	srl	a1,a1,0x10
    c0f0:	01055513          	srl	a0,a0,0x10
    c0f4:	4bd030ef          	jal	fdb0 <__mulsi3>
    c0f8:	00050593          	mv	a1,a0
    c0fc:	00040513          	mv	a0,s0
    c100:	e60f60ef          	jal	2760 <_malloc_r>
    c104:	00050413          	mv	s0,a0
    c108:	10050a63          	beqz	a0,c21c <_calloc_r+0x15c>
    c10c:	ffc52603          	lw	a2,-4(a0)
    c110:	02400713          	li	a4,36
    c114:	ffc67613          	and	a2,a2,-4
    c118:	ffc60613          	add	a2,a2,-4
    c11c:	04c76863          	bltu	a4,a2,c16c <_calloc_r+0xac>
    c120:	01300693          	li	a3,19
    c124:	00050793          	mv	a5,a0
    c128:	02c6f263          	bgeu	a3,a2,c14c <_calloc_r+0x8c>
    c12c:	00052023          	sw	zero,0(a0)
    c130:	00052223          	sw	zero,4(a0)
    c134:	01b00793          	li	a5,27
    c138:	04c7f863          	bgeu	a5,a2,c188 <_calloc_r+0xc8>
    c13c:	00052423          	sw	zero,8(a0)
    c140:	00052623          	sw	zero,12(a0)
    c144:	01050793          	add	a5,a0,16
    c148:	10e60263          	beq	a2,a4,c24c <_calloc_r+0x18c>
    c14c:	0007a023          	sw	zero,0(a5)
    c150:	0007a223          	sw	zero,4(a5)
    c154:	0007a423          	sw	zero,8(a5)
    c158:	01c12083          	lw	ra,28(sp)
    c15c:	00040513          	mv	a0,s0
    c160:	01812403          	lw	s0,24(sp)
    c164:	02010113          	add	sp,sp,32
    c168:	00008067          	ret
    c16c:	00000593          	li	a1,0
    c170:	e95f50ef          	jal	2004 <memset>
    c174:	01c12083          	lw	ra,28(sp)
    c178:	00040513          	mv	a0,s0
    c17c:	01812403          	lw	s0,24(sp)
    c180:	02010113          	add	sp,sp,32
    c184:	00008067          	ret
    c188:	00850793          	add	a5,a0,8
    c18c:	0007a023          	sw	zero,0(a5)
    c190:	0007a223          	sw	zero,4(a5)
    c194:	0007a423          	sw	zero,8(a5)
    c198:	fc1ff06f          	j	c158 <_calloc_r+0x98>
    c19c:	0c071663          	bnez	a4,c268 <_calloc_r+0x1a8>
    c1a0:	01212823          	sw	s2,16(sp)
    c1a4:	01312623          	sw	s3,12(sp)
    c1a8:	00912a23          	sw	s1,20(sp)
    c1ac:	00068913          	mv	s2,a3
    c1b0:	00060993          	mv	s3,a2
    c1b4:	01079513          	sll	a0,a5,0x10
    c1b8:	01061593          	sll	a1,a2,0x10
    c1bc:	0105d593          	srl	a1,a1,0x10
    c1c0:	01055513          	srl	a0,a0,0x10
    c1c4:	3ed030ef          	jal	fdb0 <__mulsi3>
    c1c8:	00050493          	mv	s1,a0
    c1cc:	01091593          	sll	a1,s2,0x10
    c1d0:	01099513          	sll	a0,s3,0x10
    c1d4:	0105d593          	srl	a1,a1,0x10
    c1d8:	01055513          	srl	a0,a0,0x10
    c1dc:	3d5030ef          	jal	fdb0 <__mulsi3>
    c1e0:	0104d793          	srl	a5,s1,0x10
    c1e4:	00f505b3          	add	a1,a0,a5
    c1e8:	0105d793          	srl	a5,a1,0x10
    c1ec:	06079863          	bnez	a5,c25c <_calloc_r+0x19c>
    c1f0:	01049493          	sll	s1,s1,0x10
    c1f4:	0104d493          	srl	s1,s1,0x10
    c1f8:	01059593          	sll	a1,a1,0x10
    c1fc:	0095e5b3          	or	a1,a1,s1
    c200:	00040513          	mv	a0,s0
    c204:	01412483          	lw	s1,20(sp)
    c208:	01012903          	lw	s2,16(sp)
    c20c:	00c12983          	lw	s3,12(sp)
    c210:	d50f60ef          	jal	2760 <_malloc_r>
    c214:	00050413          	mv	s0,a0
    c218:	ee051ae3          	bnez	a0,c10c <_calloc_r+0x4c>
    c21c:	00000413          	li	s0,0
    c220:	01c12083          	lw	ra,28(sp)
    c224:	00040513          	mv	a0,s0
    c228:	01812403          	lw	s0,24(sp)
    c22c:	02010113          	add	sp,sp,32
    c230:	00008067          	ret
    c234:	01212823          	sw	s2,16(sp)
    c238:	01312623          	sw	s3,12(sp)
    c23c:	00912a23          	sw	s1,20(sp)
    c240:	00070913          	mv	s2,a4
    c244:	00058993          	mv	s3,a1
    c248:	f6dff06f          	j	c1b4 <_calloc_r+0xf4>
    c24c:	00052823          	sw	zero,16(a0)
    c250:	01850793          	add	a5,a0,24
    c254:	00052a23          	sw	zero,20(a0)
    c258:	ef5ff06f          	j	c14c <_calloc_r+0x8c>
    c25c:	01412483          	lw	s1,20(sp)
    c260:	01012903          	lw	s2,16(sp)
    c264:	00c12983          	lw	s3,12(sp)
    c268:	df5ff0ef          	jal	c05c <__errno>
    c26c:	00c00793          	li	a5,12
    c270:	00f52023          	sw	a5,0(a0)
    c274:	00000413          	li	s0,0
    c278:	fa9ff06f          	j	c220 <_calloc_r+0x160>

0000c27c <_wcsnrtombs_l>:
    c27c:	fa010113          	add	sp,sp,-96
    c280:	04912a23          	sw	s1,84(sp)
    c284:	05212823          	sw	s2,80(sp)
    c288:	05312623          	sw	s3,76(sp)
    c28c:	05412423          	sw	s4,72(sp)
    c290:	05512223          	sw	s5,68(sp)
    c294:	04112e23          	sw	ra,92(sp)
    c298:	03912a23          	sw	s9,52(sp)
    c29c:	03a12823          	sw	s10,48(sp)
    c2a0:	00a12623          	sw	a0,12(sp)
    c2a4:	00058a13          	mv	s4,a1
    c2a8:	00060a93          	mv	s5,a2
    c2ac:	00070913          	mv	s2,a4
    c2b0:	00080993          	mv	s3,a6
    c2b4:	00078493          	mv	s1,a5
    c2b8:	12078063          	beqz	a5,c3d8 <_wcsnrtombs_l+0x15c>
    c2bc:	000aac83          	lw	s9,0(s5)
    c2c0:	120a0263          	beqz	s4,c3e4 <_wcsnrtombs_l+0x168>
    c2c4:	14090e63          	beqz	s2,c420 <_wcsnrtombs_l+0x1a4>
    c2c8:	05612023          	sw	s6,64(sp)
    c2cc:	fff68b13          	add	s6,a3,-1
    c2d0:	16068063          	beqz	a3,c430 <_wcsnrtombs_l+0x1b4>
    c2d4:	04812c23          	sw	s0,88(sp)
    c2d8:	03b12623          	sw	s11,44(sp)
    c2dc:	03712e23          	sw	s7,60(sp)
    c2e0:	03812c23          	sw	s8,56(sp)
    c2e4:	000a0413          	mv	s0,s4
    c2e8:	00000d13          	li	s10,0
    c2ec:	fff00d93          	li	s11,-1
    c2f0:	0240006f          	j	c314 <_wcsnrtombs_l+0x98>
    c2f4:	080a1a63          	bnez	s4,c388 <_wcsnrtombs_l+0x10c>
    c2f8:	000ca783          	lw	a5,0(s9)
    c2fc:	004c8c93          	add	s9,s9,4
    c300:	0c078263          	beqz	a5,c3c4 <_wcsnrtombs_l+0x148>
    c304:	1326f263          	bgeu	a3,s2,c428 <_wcsnrtombs_l+0x1ac>
    c308:	fffb0b13          	add	s6,s6,-1
    c30c:	00068d13          	mv	s10,a3
    c310:	03bb0c63          	beq	s6,s11,c348 <_wcsnrtombs_l+0xcc>
    c314:	0e09a783          	lw	a5,224(s3)
    c318:	000ca603          	lw	a2,0(s9)
    c31c:	00c12503          	lw	a0,12(sp)
    c320:	00048693          	mv	a3,s1
    c324:	01410593          	add	a1,sp,20
    c328:	0004ac03          	lw	s8,0(s1)
    c32c:	0044ab83          	lw	s7,4(s1)
    c330:	000780e7          	jalr	a5
    c334:	0bb50e63          	beq	a0,s11,c3f0 <_wcsnrtombs_l+0x174>
    c338:	01a506b3          	add	a3,a0,s10
    c33c:	fad97ce3          	bgeu	s2,a3,c2f4 <_wcsnrtombs_l+0x78>
    c340:	0184a023          	sw	s8,0(s1)
    c344:	0174a223          	sw	s7,4(s1)
    c348:	05812403          	lw	s0,88(sp)
    c34c:	04012b03          	lw	s6,64(sp)
    c350:	03c12b83          	lw	s7,60(sp)
    c354:	03812c03          	lw	s8,56(sp)
    c358:	02c12d83          	lw	s11,44(sp)
    c35c:	05c12083          	lw	ra,92(sp)
    c360:	05412483          	lw	s1,84(sp)
    c364:	05012903          	lw	s2,80(sp)
    c368:	04c12983          	lw	s3,76(sp)
    c36c:	04812a03          	lw	s4,72(sp)
    c370:	04412a83          	lw	s5,68(sp)
    c374:	03412c83          	lw	s9,52(sp)
    c378:	000d0513          	mv	a0,s10
    c37c:	03012d03          	lw	s10,48(sp)
    c380:	06010113          	add	sp,sp,96
    c384:	00008067          	ret
    c388:	08a05063          	blez	a0,c408 <_wcsnrtombs_l+0x18c>
    c38c:	01410893          	add	a7,sp,20
    c390:	00a40533          	add	a0,s0,a0
    c394:	0008c783          	lbu	a5,0(a7)
    c398:	00140413          	add	s0,s0,1
    c39c:	00188893          	add	a7,a7,1
    c3a0:	fef40fa3          	sb	a5,-1(s0)
    c3a4:	fe8518e3          	bne	a0,s0,c394 <_wcsnrtombs_l+0x118>
    c3a8:	000aa783          	lw	a5,0(s5)
    c3ac:	00050413          	mv	s0,a0
    c3b0:	00478793          	add	a5,a5,4
    c3b4:	00faa023          	sw	a5,0(s5)
    c3b8:	000ca783          	lw	a5,0(s9)
    c3bc:	004c8c93          	add	s9,s9,4
    c3c0:	f40792e3          	bnez	a5,c304 <_wcsnrtombs_l+0x88>
    c3c4:	000a0463          	beqz	s4,c3cc <_wcsnrtombs_l+0x150>
    c3c8:	000aa023          	sw	zero,0(s5)
    c3cc:	0004a023          	sw	zero,0(s1)
    c3d0:	fff68d13          	add	s10,a3,-1
    c3d4:	f75ff06f          	j	c348 <_wcsnrtombs_l+0xcc>
    c3d8:	000aac83          	lw	s9,0(s5)
    c3dc:	10c50493          	add	s1,a0,268
    c3e0:	ee0a12e3          	bnez	s4,c2c4 <_wcsnrtombs_l+0x48>
    c3e4:	05612023          	sw	s6,64(sp)
    c3e8:	fff00913          	li	s2,-1
    c3ec:	ee1ff06f          	j	c2cc <_wcsnrtombs_l+0x50>
    c3f0:	00c12703          	lw	a4,12(sp)
    c3f4:	08a00793          	li	a5,138
    c3f8:	fff00d13          	li	s10,-1
    c3fc:	00f72023          	sw	a5,0(a4)
    c400:	0004a023          	sw	zero,0(s1)
    c404:	f45ff06f          	j	c348 <_wcsnrtombs_l+0xcc>
    c408:	000aa783          	lw	a5,0(s5)
    c40c:	00040513          	mv	a0,s0
    c410:	00050413          	mv	s0,a0
    c414:	00478793          	add	a5,a5,4
    c418:	00faa023          	sw	a5,0(s5)
    c41c:	f9dff06f          	j	c3b8 <_wcsnrtombs_l+0x13c>
    c420:	00000d13          	li	s10,0
    c424:	f39ff06f          	j	c35c <_wcsnrtombs_l+0xe0>
    c428:	00068d13          	mv	s10,a3
    c42c:	f1dff06f          	j	c348 <_wcsnrtombs_l+0xcc>
    c430:	04012b03          	lw	s6,64(sp)
    c434:	00000d13          	li	s10,0
    c438:	f25ff06f          	j	c35c <_wcsnrtombs_l+0xe0>

0000c43c <_wcsnrtombs_r>:
    c43c:	7fff4817          	auipc	a6,0x7fff4
    c440:	0f880813          	add	a6,a6,248 # 80000534 <__global_locale>
    c444:	7fff4517          	auipc	a0,0x7fff4
    c448:	2c452503          	lw	a0,708(a0) # 80000708 <_impure_ptr>
    c44c:	e31ff06f          	j	c27c <_wcsnrtombs_l>

0000c450 <fiprintf>:
    c450:	fc010113          	add	sp,sp,-64
    c454:	02810313          	add	t1,sp,40
    c458:	02c12423          	sw	a2,40(sp)
    c45c:	02d12623          	sw	a3,44(sp)
    c460:	00058613          	mv	a2,a1
    c464:	00030693          	mv	a3,t1
    c468:	00050593          	mv	a1,a0
    c46c:	7fff4517          	auipc	a0,0x7fff4
    c470:	29c52503          	lw	a0,668(a0) # 80000708 <_impure_ptr>
    c474:	00112e23          	sw	ra,28(sp)
    c478:	02e12823          	sw	a4,48(sp)
    c47c:	02f12a23          	sw	a5,52(sp)
    c480:	03012c23          	sw	a6,56(sp)
    c484:	03112e23          	sw	a7,60(sp)
    c488:	00612623          	sw	t1,12(sp)
    c48c:	9a1f90ef          	jal	5e2c <_vfiprintf_r>
    c490:	01c12083          	lw	ra,28(sp)
    c494:	04010113          	add	sp,sp,64
    c498:	00008067          	ret

0000c49c <abort>:
    c49c:	ff010113          	add	sp,sp,-16
    c4a0:	00600513          	li	a0,6
    c4a4:	00112623          	sw	ra,12(sp)
    c4a8:	00c000ef          	jal	c4b4 <raise>
    c4ac:	00100513          	li	a0,1
    c4b0:	f14f50ef          	jal	1bc4 <_exit>

0000c4b4 <raise>:
    c4b4:	ff010113          	add	sp,sp,-16
    c4b8:	00912223          	sw	s1,4(sp)
    c4bc:	00112623          	sw	ra,12(sp)
    c4c0:	01f00793          	li	a5,31
    c4c4:	7fff4497          	auipc	s1,0x7fff4
    c4c8:	2444a483          	lw	s1,580(s1) # 80000708 <_impure_ptr>
    c4cc:	08a7ee63          	bltu	a5,a0,c568 <raise+0xb4>
    c4d0:	1184a783          	lw	a5,280(s1)
    c4d4:	00812423          	sw	s0,8(sp)
    c4d8:	00050413          	mv	s0,a0
    c4dc:	04078263          	beqz	a5,c520 <raise+0x6c>
    c4e0:	00251713          	sll	a4,a0,0x2
    c4e4:	00e787b3          	add	a5,a5,a4
    c4e8:	0007a703          	lw	a4,0(a5)
    c4ec:	02070a63          	beqz	a4,c520 <raise+0x6c>
    c4f0:	00100693          	li	a3,1
    c4f4:	00d70a63          	beq	a4,a3,c508 <raise+0x54>
    c4f8:	fff00693          	li	a3,-1
    c4fc:	04d70663          	beq	a4,a3,c548 <raise+0x94>
    c500:	0007a023          	sw	zero,0(a5)
    c504:	000700e7          	jalr	a4
    c508:	00812403          	lw	s0,8(sp)
    c50c:	00000513          	li	a0,0
    c510:	00c12083          	lw	ra,12(sp)
    c514:	00412483          	lw	s1,4(sp)
    c518:	01010113          	add	sp,sp,16
    c51c:	00008067          	ret
    c520:	00048513          	mv	a0,s1
    c524:	0b4000ef          	jal	c5d8 <_getpid_r>
    c528:	00040613          	mv	a2,s0
    c52c:	00812403          	lw	s0,8(sp)
    c530:	00c12083          	lw	ra,12(sp)
    c534:	00050593          	mv	a1,a0
    c538:	00048513          	mv	a0,s1
    c53c:	00412483          	lw	s1,4(sp)
    c540:	01010113          	add	sp,sp,16
    c544:	0340006f          	j	c578 <_kill_r>
    c548:	00812403          	lw	s0,8(sp)
    c54c:	00c12083          	lw	ra,12(sp)
    c550:	01600793          	li	a5,22
    c554:	00f4a023          	sw	a5,0(s1)
    c558:	00100513          	li	a0,1
    c55c:	00412483          	lw	s1,4(sp)
    c560:	01010113          	add	sp,sp,16
    c564:	00008067          	ret
    c568:	01600793          	li	a5,22
    c56c:	00f4a023          	sw	a5,0(s1)
    c570:	fff00513          	li	a0,-1
    c574:	f9dff06f          	j	c510 <raise+0x5c>

0000c578 <_kill_r>:
    c578:	ff010113          	add	sp,sp,-16
    c57c:	00058713          	mv	a4,a1
    c580:	00812423          	sw	s0,8(sp)
    c584:	00060593          	mv	a1,a2
    c588:	00050413          	mv	s0,a0
    c58c:	00070513          	mv	a0,a4
    c590:	7fff4797          	auipc	a5,0x7fff4
    c594:	1807a623          	sw	zero,396(a5) # 8000071c <errno>
    c598:	00112623          	sw	ra,12(sp)
    c59c:	e60f50ef          	jal	1bfc <_kill>
    c5a0:	fff00793          	li	a5,-1
    c5a4:	00f50a63          	beq	a0,a5,c5b8 <_kill_r+0x40>
    c5a8:	00c12083          	lw	ra,12(sp)
    c5ac:	00812403          	lw	s0,8(sp)
    c5b0:	01010113          	add	sp,sp,16
    c5b4:	00008067          	ret
    c5b8:	7fff4797          	auipc	a5,0x7fff4
    c5bc:	1647a783          	lw	a5,356(a5) # 8000071c <errno>
    c5c0:	fe0784e3          	beqz	a5,c5a8 <_kill_r+0x30>
    c5c4:	00c12083          	lw	ra,12(sp)
    c5c8:	00f42023          	sw	a5,0(s0)
    c5cc:	00812403          	lw	s0,8(sp)
    c5d0:	01010113          	add	sp,sp,16
    c5d4:	00008067          	ret

0000c5d8 <_getpid_r>:
    c5d8:	e14f506f          	j	1bec <_getpid>

0000c5dc <__udivdi3>:
    c5dc:	fd010113          	add	sp,sp,-48
    c5e0:	01312e23          	sw	s3,28(sp)
    c5e4:	02112623          	sw	ra,44(sp)
    c5e8:	01612823          	sw	s6,16(sp)
    c5ec:	00050993          	mv	s3,a0
    c5f0:	16069663          	bnez	a3,c75c <__udivdi3+0x180>
    c5f4:	02812423          	sw	s0,40(sp)
    c5f8:	01512a23          	sw	s5,20(sp)
    c5fc:	02912223          	sw	s1,36(sp)
    c600:	03212023          	sw	s2,32(sp)
    c604:	01412c23          	sw	s4,24(sp)
    c608:	00060a93          	mv	s5,a2
    c60c:	00050413          	mv	s0,a0
    c610:	1cc5f063          	bgeu	a1,a2,c7d0 <__udivdi3+0x1f4>
    c614:	000107b7          	lui	a5,0x10
    c618:	00058493          	mv	s1,a1
    c61c:	2af66e63          	bltu	a2,a5,c8d8 <__udivdi3+0x2fc>
    c620:	010007b7          	lui	a5,0x1000
    c624:	01800713          	li	a4,24
    c628:	00f67463          	bgeu	a2,a5,c630 <__udivdi3+0x54>
    c62c:	01000713          	li	a4,16
    c630:	00e656b3          	srl	a3,a2,a4
    c634:	00004797          	auipc	a5,0x4
    c638:	42c78793          	add	a5,a5,1068 # 10a60 <__clz_tab>
    c63c:	00d787b3          	add	a5,a5,a3
    c640:	0007c783          	lbu	a5,0(a5)
    c644:	02000693          	li	a3,32
    c648:	00e787b3          	add	a5,a5,a4
    c64c:	40f68733          	sub	a4,a3,a5
    c650:	00f68c63          	beq	a3,a5,c668 <__udivdi3+0x8c>
    c654:	00e594b3          	sll	s1,a1,a4
    c658:	00f9d7b3          	srl	a5,s3,a5
    c65c:	00e61ab3          	sll	s5,a2,a4
    c660:	0097e4b3          	or	s1,a5,s1
    c664:	00e99433          	sll	s0,s3,a4
    c668:	010ada13          	srl	s4,s5,0x10
    c66c:	000a0593          	mv	a1,s4
    c670:	00048513          	mv	a0,s1
    c674:	010a9b13          	sll	s6,s5,0x10
    c678:	7fc030ef          	jal	fe74 <__hidden___udivsi3>
    c67c:	010b5b13          	srl	s6,s6,0x10
    c680:	00050593          	mv	a1,a0
    c684:	00050913          	mv	s2,a0
    c688:	000b0513          	mv	a0,s6
    c68c:	724030ef          	jal	fdb0 <__mulsi3>
    c690:	00050793          	mv	a5,a0
    c694:	000a0593          	mv	a1,s4
    c698:	00048513          	mv	a0,s1
    c69c:	00078493          	mv	s1,a5
    c6a0:	01d030ef          	jal	febc <__umodsi3>
    c6a4:	01051513          	sll	a0,a0,0x10
    c6a8:	01045793          	srl	a5,s0,0x10
    c6ac:	00a7e7b3          	or	a5,a5,a0
    c6b0:	0097fc63          	bgeu	a5,s1,c6c8 <__udivdi3+0xec>
    c6b4:	00fa87b3          	add	a5,s5,a5
    c6b8:	fff90713          	add	a4,s2,-1 # efff <__subdf3+0x187>
    c6bc:	0157e463          	bltu	a5,s5,c6c4 <__udivdi3+0xe8>
    c6c0:	5a97e863          	bltu	a5,s1,cc70 <__udivdi3+0x694>
    c6c4:	00070913          	mv	s2,a4
    c6c8:	409784b3          	sub	s1,a5,s1
    c6cc:	000a0593          	mv	a1,s4
    c6d0:	00048513          	mv	a0,s1
    c6d4:	7a0030ef          	jal	fe74 <__hidden___udivsi3>
    c6d8:	00050593          	mv	a1,a0
    c6dc:	00050993          	mv	s3,a0
    c6e0:	000b0513          	mv	a0,s6
    c6e4:	6cc030ef          	jal	fdb0 <__mulsi3>
    c6e8:	00050793          	mv	a5,a0
    c6ec:	000a0593          	mv	a1,s4
    c6f0:	00048513          	mv	a0,s1
    c6f4:	01041413          	sll	s0,s0,0x10
    c6f8:	00078493          	mv	s1,a5
    c6fc:	7c0030ef          	jal	febc <__umodsi3>
    c700:	01051513          	sll	a0,a0,0x10
    c704:	01045413          	srl	s0,s0,0x10
    c708:	00a46433          	or	s0,s0,a0
    c70c:	00947c63          	bgeu	s0,s1,c724 <__udivdi3+0x148>
    c710:	008a8433          	add	s0,s5,s0
    c714:	fff98793          	add	a5,s3,-1
    c718:	4d546e63          	bltu	s0,s5,cbf4 <__udivdi3+0x618>
    c71c:	ffe98993          	add	s3,s3,-2
    c720:	4c947a63          	bgeu	s0,s1,cbf4 <__udivdi3+0x618>
    c724:	01091613          	sll	a2,s2,0x10
    c728:	01366533          	or	a0,a2,s3
    c72c:	00000b13          	li	s6,0
    c730:	02812403          	lw	s0,40(sp)
    c734:	02c12083          	lw	ra,44(sp)
    c738:	02412483          	lw	s1,36(sp)
    c73c:	02012903          	lw	s2,32(sp)
    c740:	01812a03          	lw	s4,24(sp)
    c744:	01412a83          	lw	s5,20(sp)
    c748:	01c12983          	lw	s3,28(sp)
    c74c:	000b0593          	mv	a1,s6
    c750:	01012b03          	lw	s6,16(sp)
    c754:	03010113          	add	sp,sp,48
    c758:	00008067          	ret
    c75c:	02d5f263          	bgeu	a1,a3,c780 <__udivdi3+0x1a4>
    c760:	00000b13          	li	s6,0
    c764:	00000513          	li	a0,0
    c768:	02c12083          	lw	ra,44(sp)
    c76c:	01c12983          	lw	s3,28(sp)
    c770:	000b0593          	mv	a1,s6
    c774:	01012b03          	lw	s6,16(sp)
    c778:	03010113          	add	sp,sp,48
    c77c:	00008067          	ret
    c780:	000107b7          	lui	a5,0x10
    c784:	26f6ee63          	bltu	a3,a5,ca00 <__udivdi3+0x424>
    c788:	01000737          	lui	a4,0x1000
    c78c:	01800793          	li	a5,24
    c790:	00e6f463          	bgeu	a3,a4,c798 <__udivdi3+0x1bc>
    c794:	01000793          	li	a5,16
    c798:	00f6d533          	srl	a0,a3,a5
    c79c:	00004717          	auipc	a4,0x4
    c7a0:	2c470713          	add	a4,a4,708 # 10a60 <__clz_tab>
    c7a4:	00a70733          	add	a4,a4,a0
    c7a8:	00074703          	lbu	a4,0(a4)
    c7ac:	02000513          	li	a0,32
    c7b0:	00f70733          	add	a4,a4,a5
    c7b4:	40e50b33          	sub	s6,a0,a4
    c7b8:	26e51c63          	bne	a0,a4,ca30 <__udivdi3+0x454>
    c7bc:	46b6ee63          	bltu	a3,a1,cc38 <__udivdi3+0x65c>
    c7c0:	00c9b533          	sltu	a0,s3,a2
    c7c4:	00153513          	seqz	a0,a0
    c7c8:	00000b13          	li	s6,0
    c7cc:	f9dff06f          	j	c768 <__udivdi3+0x18c>
    c7d0:	10060c63          	beqz	a2,c8e8 <__udivdi3+0x30c>
    c7d4:	000107b7          	lui	a5,0x10
    c7d8:	44f67663          	bgeu	a2,a5,cc24 <__udivdi3+0x648>
    c7dc:	10063713          	sltiu	a4,a2,256
    c7e0:	00173713          	seqz	a4,a4
    c7e4:	00371713          	sll	a4,a4,0x3
    c7e8:	00e656b3          	srl	a3,a2,a4
    c7ec:	00004797          	auipc	a5,0x4
    c7f0:	27478793          	add	a5,a5,628 # 10a60 <__clz_tab>
    c7f4:	00d787b3          	add	a5,a5,a3
    c7f8:	0007c483          	lbu	s1,0(a5)
    c7fc:	02000793          	li	a5,32
    c800:	00e484b3          	add	s1,s1,a4
    c804:	40978733          	sub	a4,a5,s1
    c808:	10979463          	bne	a5,s1,c910 <__udivdi3+0x334>
    c80c:	01061a13          	sll	s4,a2,0x10
    c810:	40c584b3          	sub	s1,a1,a2
    c814:	01065913          	srl	s2,a2,0x10
    c818:	010a5a13          	srl	s4,s4,0x10
    c81c:	00100b13          	li	s6,1
    c820:	00090593          	mv	a1,s2
    c824:	00048513          	mv	a0,s1
    c828:	64c030ef          	jal	fe74 <__hidden___udivsi3>
    c82c:	000a0593          	mv	a1,s4
    c830:	00050993          	mv	s3,a0
    c834:	57c030ef          	jal	fdb0 <__mulsi3>
    c838:	00050793          	mv	a5,a0
    c83c:	00090593          	mv	a1,s2
    c840:	00048513          	mv	a0,s1
    c844:	00078493          	mv	s1,a5
    c848:	674030ef          	jal	febc <__umodsi3>
    c84c:	01051513          	sll	a0,a0,0x10
    c850:	01045793          	srl	a5,s0,0x10
    c854:	00a7e7b3          	or	a5,a5,a0
    c858:	0097fc63          	bgeu	a5,s1,c870 <__udivdi3+0x294>
    c85c:	00fa87b3          	add	a5,s5,a5
    c860:	fff98713          	add	a4,s3,-1
    c864:	0157e463          	bltu	a5,s5,c86c <__udivdi3+0x290>
    c868:	3e97ee63          	bltu	a5,s1,cc64 <__udivdi3+0x688>
    c86c:	00070993          	mv	s3,a4
    c870:	409784b3          	sub	s1,a5,s1
    c874:	00090593          	mv	a1,s2
    c878:	00048513          	mv	a0,s1
    c87c:	5f8030ef          	jal	fe74 <__hidden___udivsi3>
    c880:	000a0593          	mv	a1,s4
    c884:	00050a13          	mv	s4,a0
    c888:	528030ef          	jal	fdb0 <__mulsi3>
    c88c:	00050793          	mv	a5,a0
    c890:	00090593          	mv	a1,s2
    c894:	00048513          	mv	a0,s1
    c898:	01041413          	sll	s0,s0,0x10
    c89c:	00078493          	mv	s1,a5
    c8a0:	61c030ef          	jal	febc <__umodsi3>
    c8a4:	01051513          	sll	a0,a0,0x10
    c8a8:	01045413          	srl	s0,s0,0x10
    c8ac:	00a46433          	or	s0,s0,a0
    c8b0:	00947e63          	bgeu	s0,s1,c8cc <__udivdi3+0x2f0>
    c8b4:	008a8433          	add	s0,s5,s0
    c8b8:	fffa0793          	add	a5,s4,-1
    c8bc:	01546663          	bltu	s0,s5,c8c8 <__udivdi3+0x2ec>
    c8c0:	ffea0a13          	add	s4,s4,-2
    c8c4:	00946463          	bltu	s0,s1,c8cc <__udivdi3+0x2f0>
    c8c8:	00078a13          	mv	s4,a5
    c8cc:	01099613          	sll	a2,s3,0x10
    c8d0:	01466533          	or	a0,a2,s4
    c8d4:	e5dff06f          	j	c730 <__udivdi3+0x154>
    c8d8:	10063713          	sltiu	a4,a2,256
    c8dc:	00173713          	seqz	a4,a4
    c8e0:	00371713          	sll	a4,a4,0x3
    c8e4:	d4dff06f          	j	c630 <__udivdi3+0x54>
    c8e8:	00000693          	li	a3,0
    c8ec:	00004797          	auipc	a5,0x4
    c8f0:	17478793          	add	a5,a5,372 # 10a60 <__clz_tab>
    c8f4:	00d787b3          	add	a5,a5,a3
    c8f8:	0007c483          	lbu	s1,0(a5)
    c8fc:	00000713          	li	a4,0
    c900:	02000793          	li	a5,32
    c904:	00e484b3          	add	s1,s1,a4
    c908:	40978733          	sub	a4,a5,s1
    c90c:	f09780e3          	beq	a5,s1,c80c <__udivdi3+0x230>
    c910:	00e61ab3          	sll	s5,a2,a4
    c914:	01712623          	sw	s7,12(sp)
    c918:	010ad913          	srl	s2,s5,0x10
    c91c:	0095dbb3          	srl	s7,a1,s1
    c920:	00e597b3          	sll	a5,a1,a4
    c924:	0099d4b3          	srl	s1,s3,s1
    c928:	00090593          	mv	a1,s2
    c92c:	000b8513          	mv	a0,s7
    c930:	010a9a13          	sll	s4,s5,0x10
    c934:	00f4e4b3          	or	s1,s1,a5
    c938:	00e99433          	sll	s0,s3,a4
    c93c:	010a5a13          	srl	s4,s4,0x10
    c940:	534030ef          	jal	fe74 <__hidden___udivsi3>
    c944:	00050593          	mv	a1,a0
    c948:	00050b13          	mv	s6,a0
    c94c:	000a0513          	mv	a0,s4
    c950:	460030ef          	jal	fdb0 <__mulsi3>
    c954:	00050993          	mv	s3,a0
    c958:	00090593          	mv	a1,s2
    c95c:	000b8513          	mv	a0,s7
    c960:	55c030ef          	jal	febc <__umodsi3>
    c964:	01051513          	sll	a0,a0,0x10
    c968:	0104d793          	srl	a5,s1,0x10
    c96c:	00a7e7b3          	or	a5,a5,a0
    c970:	0137fe63          	bgeu	a5,s3,c98c <__udivdi3+0x3b0>
    c974:	00fa87b3          	add	a5,s5,a5
    c978:	fffb0713          	add	a4,s6,-1
    c97c:	2d57ec63          	bltu	a5,s5,cc54 <__udivdi3+0x678>
    c980:	2d37fa63          	bgeu	a5,s3,cc54 <__udivdi3+0x678>
    c984:	ffeb0b13          	add	s6,s6,-2
    c988:	015787b3          	add	a5,a5,s5
    c98c:	413789b3          	sub	s3,a5,s3
    c990:	00090593          	mv	a1,s2
    c994:	00098513          	mv	a0,s3
    c998:	4dc030ef          	jal	fe74 <__hidden___udivsi3>
    c99c:	00050593          	mv	a1,a0
    c9a0:	00050b93          	mv	s7,a0
    c9a4:	000a0513          	mv	a0,s4
    c9a8:	408030ef          	jal	fdb0 <__mulsi3>
    c9ac:	00050793          	mv	a5,a0
    c9b0:	00090593          	mv	a1,s2
    c9b4:	00098513          	mv	a0,s3
    c9b8:	01049493          	sll	s1,s1,0x10
    c9bc:	00078993          	mv	s3,a5
    c9c0:	4fc030ef          	jal	febc <__umodsi3>
    c9c4:	01051513          	sll	a0,a0,0x10
    c9c8:	0104d493          	srl	s1,s1,0x10
    c9cc:	00a4e4b3          	or	s1,s1,a0
    c9d0:	0134fe63          	bgeu	s1,s3,c9ec <__udivdi3+0x410>
    c9d4:	009a84b3          	add	s1,s5,s1
    c9d8:	fffb8793          	add	a5,s7,-1
    c9dc:	2754e463          	bltu	s1,s5,cc44 <__udivdi3+0x668>
    c9e0:	2734f263          	bgeu	s1,s3,cc44 <__udivdi3+0x668>
    c9e4:	ffeb8b93          	add	s7,s7,-2
    c9e8:	015484b3          	add	s1,s1,s5
    c9ec:	010b1b13          	sll	s6,s6,0x10
    c9f0:	017b6b33          	or	s6,s6,s7
    c9f4:	413484b3          	sub	s1,s1,s3
    c9f8:	00c12b83          	lw	s7,12(sp)
    c9fc:	e25ff06f          	j	c820 <__udivdi3+0x244>
    ca00:	1006b793          	sltiu	a5,a3,256
    ca04:	0017b793          	seqz	a5,a5
    ca08:	00379793          	sll	a5,a5,0x3
    ca0c:	00f6d533          	srl	a0,a3,a5
    ca10:	00004717          	auipc	a4,0x4
    ca14:	05070713          	add	a4,a4,80 # 10a60 <__clz_tab>
    ca18:	00a70733          	add	a4,a4,a0
    ca1c:	00074703          	lbu	a4,0(a4)
    ca20:	02000513          	li	a0,32
    ca24:	00f70733          	add	a4,a4,a5
    ca28:	40e50b33          	sub	s6,a0,a4
    ca2c:	d8e508e3          	beq	a0,a4,c7bc <__udivdi3+0x1e0>
    ca30:	016696b3          	sll	a3,a3,s6
    ca34:	01912223          	sw	s9,4(sp)
    ca38:	00e65cb3          	srl	s9,a2,a4
    ca3c:	00dcecb3          	or	s9,s9,a3
    ca40:	01512a23          	sw	s5,20(sp)
    ca44:	01712623          	sw	s7,12(sp)
    ca48:	010cda93          	srl	s5,s9,0x10
    ca4c:	00e5dbb3          	srl	s7,a1,a4
    ca50:	016597b3          	sll	a5,a1,s6
    ca54:	00e9d733          	srl	a4,s3,a4
    ca58:	01812423          	sw	s8,8(sp)
    ca5c:	000a8593          	mv	a1,s5
    ca60:	000b8513          	mv	a0,s7
    ca64:	010c9c13          	sll	s8,s9,0x10
    ca68:	02812423          	sw	s0,40(sp)
    ca6c:	02912223          	sw	s1,36(sp)
    ca70:	03212023          	sw	s2,32(sp)
    ca74:	00f764b3          	or	s1,a4,a5
    ca78:	01661933          	sll	s2,a2,s6
    ca7c:	01412c23          	sw	s4,24(sp)
    ca80:	010c5c13          	srl	s8,s8,0x10
    ca84:	3f0030ef          	jal	fe74 <__hidden___udivsi3>
    ca88:	00050593          	mv	a1,a0
    ca8c:	00050413          	mv	s0,a0
    ca90:	000c0513          	mv	a0,s8
    ca94:	31c030ef          	jal	fdb0 <__mulsi3>
    ca98:	00050a13          	mv	s4,a0
    ca9c:	000a8593          	mv	a1,s5
    caa0:	000b8513          	mv	a0,s7
    caa4:	418030ef          	jal	febc <__umodsi3>
    caa8:	01051513          	sll	a0,a0,0x10
    caac:	0104d793          	srl	a5,s1,0x10
    cab0:	00a7e7b3          	or	a5,a5,a0
    cab4:	0147fe63          	bgeu	a5,s4,cad0 <__udivdi3+0x4f4>
    cab8:	00fc87b3          	add	a5,s9,a5
    cabc:	fff40713          	add	a4,s0,-1
    cac0:	1997ee63          	bltu	a5,s9,cc5c <__udivdi3+0x680>
    cac4:	1947fc63          	bgeu	a5,s4,cc5c <__udivdi3+0x680>
    cac8:	ffe40413          	add	s0,s0,-2
    cacc:	019787b3          	add	a5,a5,s9
    cad0:	41478a33          	sub	s4,a5,s4
    cad4:	000a8593          	mv	a1,s5
    cad8:	000a0513          	mv	a0,s4
    cadc:	398030ef          	jal	fe74 <__hidden___udivsi3>
    cae0:	00050593          	mv	a1,a0
    cae4:	00050b93          	mv	s7,a0
    cae8:	000c0513          	mv	a0,s8
    caec:	2c4030ef          	jal	fdb0 <__mulsi3>
    caf0:	00050793          	mv	a5,a0
    caf4:	000a8593          	mv	a1,s5
    caf8:	000a0513          	mv	a0,s4
    cafc:	00078a13          	mv	s4,a5
    cb00:	3bc030ef          	jal	febc <__umodsi3>
    cb04:	01049713          	sll	a4,s1,0x10
    cb08:	01051513          	sll	a0,a0,0x10
    cb0c:	01075713          	srl	a4,a4,0x10
    cb10:	00a76733          	or	a4,a4,a0
    cb14:	01477e63          	bgeu	a4,s4,cb30 <__udivdi3+0x554>
    cb18:	00ec8733          	add	a4,s9,a4
    cb1c:	fffb8793          	add	a5,s7,-1
    cb20:	13976663          	bltu	a4,s9,cc4c <__udivdi3+0x670>
    cb24:	13477463          	bgeu	a4,s4,cc4c <__udivdi3+0x670>
    cb28:	ffeb8b93          	add	s7,s7,-2
    cb2c:	01970733          	add	a4,a4,s9
    cb30:	00010e37          	lui	t3,0x10
    cb34:	01041413          	sll	s0,s0,0x10
    cb38:	01746433          	or	s0,s0,s7
    cb3c:	fffe0793          	add	a5,t3,-1 # ffff <__fini_array_end+0x57>
    cb40:	00f47833          	and	a6,s0,a5
    cb44:	00f977b3          	and	a5,s2,a5
    cb48:	41470733          	sub	a4,a4,s4
    cb4c:	01045e93          	srl	t4,s0,0x10
    cb50:	01095913          	srl	s2,s2,0x10
    cb54:	00080513          	mv	a0,a6
    cb58:	00078593          	mv	a1,a5
    cb5c:	254030ef          	jal	fdb0 <__mulsi3>
    cb60:	00050313          	mv	t1,a0
    cb64:	00090593          	mv	a1,s2
    cb68:	00080513          	mv	a0,a6
    cb6c:	244030ef          	jal	fdb0 <__mulsi3>
    cb70:	00050813          	mv	a6,a0
    cb74:	00078593          	mv	a1,a5
    cb78:	000e8513          	mv	a0,t4
    cb7c:	234030ef          	jal	fdb0 <__mulsi3>
    cb80:	00050893          	mv	a7,a0
    cb84:	00090593          	mv	a1,s2
    cb88:	000e8513          	mv	a0,t4
    cb8c:	224030ef          	jal	fdb0 <__mulsi3>
    cb90:	01035793          	srl	a5,t1,0x10
    cb94:	01180833          	add	a6,a6,a7
    cb98:	010787b3          	add	a5,a5,a6
    cb9c:	0117f463          	bgeu	a5,a7,cba4 <__udivdi3+0x5c8>
    cba0:	01c50533          	add	a0,a0,t3
    cba4:	0107d693          	srl	a3,a5,0x10
    cba8:	00a686b3          	add	a3,a3,a0
    cbac:	06d76863          	bltu	a4,a3,cc1c <__udivdi3+0x640>
    cbb0:	04d70663          	beq	a4,a3,cbfc <__udivdi3+0x620>
    cbb4:	00040513          	mv	a0,s0
    cbb8:	02812403          	lw	s0,40(sp)
    cbbc:	02c12083          	lw	ra,44(sp)
    cbc0:	00000b13          	li	s6,0
    cbc4:	02412483          	lw	s1,36(sp)
    cbc8:	02012903          	lw	s2,32(sp)
    cbcc:	01812a03          	lw	s4,24(sp)
    cbd0:	01412a83          	lw	s5,20(sp)
    cbd4:	00c12b83          	lw	s7,12(sp)
    cbd8:	00812c03          	lw	s8,8(sp)
    cbdc:	00412c83          	lw	s9,4(sp)
    cbe0:	01c12983          	lw	s3,28(sp)
    cbe4:	000b0593          	mv	a1,s6
    cbe8:	01012b03          	lw	s6,16(sp)
    cbec:	03010113          	add	sp,sp,48
    cbf0:	00008067          	ret
    cbf4:	00078993          	mv	s3,a5
    cbf8:	b2dff06f          	j	c724 <__udivdi3+0x148>
    cbfc:	00010737          	lui	a4,0x10
    cc00:	fff70713          	add	a4,a4,-1 # ffff <__fini_array_end+0x57>
    cc04:	00e7f7b3          	and	a5,a5,a4
    cc08:	01079793          	sll	a5,a5,0x10
    cc0c:	00e37333          	and	t1,t1,a4
    cc10:	01699533          	sll	a0,s3,s6
    cc14:	006787b3          	add	a5,a5,t1
    cc18:	f8f57ee3          	bgeu	a0,a5,cbb4 <__udivdi3+0x5d8>
    cc1c:	fff40513          	add	a0,s0,-1
    cc20:	f99ff06f          	j	cbb8 <__udivdi3+0x5dc>
    cc24:	010007b7          	lui	a5,0x1000
    cc28:	04f67a63          	bgeu	a2,a5,cc7c <__udivdi3+0x6a0>
    cc2c:	01065693          	srl	a3,a2,0x10
    cc30:	01000713          	li	a4,16
    cc34:	bb9ff06f          	j	c7ec <__udivdi3+0x210>
    cc38:	00000b13          	li	s6,0
    cc3c:	00100513          	li	a0,1
    cc40:	b29ff06f          	j	c768 <__udivdi3+0x18c>
    cc44:	00078b93          	mv	s7,a5
    cc48:	da5ff06f          	j	c9ec <__udivdi3+0x410>
    cc4c:	00078b93          	mv	s7,a5
    cc50:	ee1ff06f          	j	cb30 <__udivdi3+0x554>
    cc54:	00070b13          	mv	s6,a4
    cc58:	d35ff06f          	j	c98c <__udivdi3+0x3b0>
    cc5c:	00070413          	mv	s0,a4
    cc60:	e71ff06f          	j	cad0 <__udivdi3+0x4f4>
    cc64:	ffe98993          	add	s3,s3,-2
    cc68:	015787b3          	add	a5,a5,s5
    cc6c:	c05ff06f          	j	c870 <__udivdi3+0x294>
    cc70:	ffe90913          	add	s2,s2,-2
    cc74:	015787b3          	add	a5,a5,s5
    cc78:	a51ff06f          	j	c6c8 <__udivdi3+0xec>
    cc7c:	01865693          	srl	a3,a2,0x18
    cc80:	01800713          	li	a4,24
    cc84:	b69ff06f          	j	c7ec <__udivdi3+0x210>

0000cc88 <__umoddi3>:
    cc88:	fd010113          	add	sp,sp,-48
    cc8c:	02112623          	sw	ra,44(sp)
    cc90:	00050793          	mv	a5,a0
    cc94:	14069663          	bnez	a3,cde0 <__umoddi3+0x158>
    cc98:	03212023          	sw	s2,32(sp)
    cc9c:	01412c23          	sw	s4,24(sp)
    cca0:	02812423          	sw	s0,40(sp)
    cca4:	02912223          	sw	s1,36(sp)
    cca8:	01312e23          	sw	s3,28(sp)
    ccac:	01512a23          	sw	s5,20(sp)
    ccb0:	00060a13          	mv	s4,a2
    ccb4:	00050913          	mv	s2,a0
    ccb8:	1ac5f663          	bgeu	a1,a2,ce64 <__umoddi3+0x1dc>
    ccbc:	01612823          	sw	s6,16(sp)
    ccc0:	00010737          	lui	a4,0x10
    ccc4:	00058993          	mv	s3,a1
    ccc8:	28e66063          	bltu	a2,a4,cf48 <__umoddi3+0x2c0>
    cccc:	01000737          	lui	a4,0x1000
    ccd0:	01800693          	li	a3,24
    ccd4:	00e67463          	bgeu	a2,a4,ccdc <__umoddi3+0x54>
    ccd8:	01000693          	li	a3,16
    ccdc:	00d65533          	srl	a0,a2,a3
    cce0:	00004717          	auipc	a4,0x4
    cce4:	d8070713          	add	a4,a4,-640 # 10a60 <__clz_tab>
    cce8:	00a70733          	add	a4,a4,a0
    ccec:	00074703          	lbu	a4,0(a4)
    ccf0:	02000513          	li	a0,32
    ccf4:	00d70733          	add	a4,a4,a3
    ccf8:	40e504b3          	sub	s1,a0,a4
    ccfc:	00e50c63          	beq	a0,a4,cd14 <__umoddi3+0x8c>
    cd00:	009599b3          	sll	s3,a1,s1
    cd04:	00e7d733          	srl	a4,a5,a4
    cd08:	00961a33          	sll	s4,a2,s1
    cd0c:	013769b3          	or	s3,a4,s3
    cd10:	00979933          	sll	s2,a5,s1
    cd14:	010a5a93          	srl	s5,s4,0x10
    cd18:	000a8593          	mv	a1,s5
    cd1c:	00098513          	mv	a0,s3
    cd20:	010a1b13          	sll	s6,s4,0x10
    cd24:	150030ef          	jal	fe74 <__hidden___udivsi3>
    cd28:	010b5b13          	srl	s6,s6,0x10
    cd2c:	000b0593          	mv	a1,s6
    cd30:	080030ef          	jal	fdb0 <__mulsi3>
    cd34:	00050413          	mv	s0,a0
    cd38:	000a8593          	mv	a1,s5
    cd3c:	00098513          	mv	a0,s3
    cd40:	17c030ef          	jal	febc <__umodsi3>
    cd44:	01051513          	sll	a0,a0,0x10
    cd48:	01095793          	srl	a5,s2,0x10
    cd4c:	00a7e7b3          	or	a5,a5,a0
    cd50:	0087f863          	bgeu	a5,s0,cd60 <__umoddi3+0xd8>
    cd54:	00fa07b3          	add	a5,s4,a5
    cd58:	0147e463          	bltu	a5,s4,cd60 <__umoddi3+0xd8>
    cd5c:	5687e863          	bltu	a5,s0,d2cc <__umoddi3+0x644>
    cd60:	40878433          	sub	s0,a5,s0
    cd64:	000a8593          	mv	a1,s5
    cd68:	00040513          	mv	a0,s0
    cd6c:	108030ef          	jal	fe74 <__hidden___udivsi3>
    cd70:	000b0593          	mv	a1,s6
    cd74:	03c030ef          	jal	fdb0 <__mulsi3>
    cd78:	00050793          	mv	a5,a0
    cd7c:	000a8593          	mv	a1,s5
    cd80:	00040513          	mv	a0,s0
    cd84:	00078413          	mv	s0,a5
    cd88:	134030ef          	jal	febc <__umodsi3>
    cd8c:	01091793          	sll	a5,s2,0x10
    cd90:	01051513          	sll	a0,a0,0x10
    cd94:	0107d793          	srl	a5,a5,0x10
    cd98:	00a7e7b3          	or	a5,a5,a0
    cd9c:	0087f863          	bgeu	a5,s0,cdac <__umoddi3+0x124>
    cda0:	00fa07b3          	add	a5,s4,a5
    cda4:	0147e463          	bltu	a5,s4,cdac <__umoddi3+0x124>
    cda8:	5087ea63          	bltu	a5,s0,d2bc <__umoddi3+0x634>
    cdac:	01012b03          	lw	s6,16(sp)
    cdb0:	408787b3          	sub	a5,a5,s0
    cdb4:	0097d533          	srl	a0,a5,s1
    cdb8:	02812403          	lw	s0,40(sp)
    cdbc:	02412483          	lw	s1,36(sp)
    cdc0:	02012903          	lw	s2,32(sp)
    cdc4:	01c12983          	lw	s3,28(sp)
    cdc8:	01812a03          	lw	s4,24(sp)
    cdcc:	01412a83          	lw	s5,20(sp)
    cdd0:	00000593          	li	a1,0
    cdd4:	02c12083          	lw	ra,44(sp)
    cdd8:	03010113          	add	sp,sp,48
    cddc:	00008067          	ret
    cde0:	00050893          	mv	a7,a0
    cde4:	fed5e8e3          	bltu	a1,a3,cdd4 <__umoddi3+0x14c>
    cde8:	03212023          	sw	s2,32(sp)
    cdec:	01312e23          	sw	s3,28(sp)
    cdf0:	00010737          	lui	a4,0x10
    cdf4:	00058813          	mv	a6,a1
    cdf8:	24e6ec63          	bltu	a3,a4,d050 <__umoddi3+0x3c8>
    cdfc:	01000737          	lui	a4,0x1000
    ce00:	01800513          	li	a0,24
    ce04:	00e6f463          	bgeu	a3,a4,ce0c <__umoddi3+0x184>
    ce08:	01000513          	li	a0,16
    ce0c:	00a6d333          	srl	t1,a3,a0
    ce10:	00004717          	auipc	a4,0x4
    ce14:	c5070713          	add	a4,a4,-944 # 10a60 <__clz_tab>
    ce18:	00670733          	add	a4,a4,t1
    ce1c:	00074703          	lbu	a4,0(a4)
    ce20:	02000313          	li	t1,32
    ce24:	00a709b3          	add	s3,a4,a0
    ce28:	41330933          	sub	s2,t1,s3
    ce2c:	25331a63          	bne	t1,s3,d080 <__umoddi3+0x3f8>
    ce30:	00b6e463          	bltu	a3,a1,ce38 <__umoddi3+0x1b0>
    ce34:	00c7ea63          	bltu	a5,a2,ce48 <__umoddi3+0x1c0>
    ce38:	40c788b3          	sub	a7,a5,a2
    ce3c:	40d586b3          	sub	a3,a1,a3
    ce40:	0117b833          	sltu	a6,a5,a7
    ce44:	41068833          	sub	a6,a3,a6
    ce48:	02c12083          	lw	ra,44(sp)
    ce4c:	02012903          	lw	s2,32(sp)
    ce50:	01c12983          	lw	s3,28(sp)
    ce54:	00088513          	mv	a0,a7
    ce58:	00080593          	mv	a1,a6
    ce5c:	03010113          	add	sp,sp,48
    ce60:	00008067          	ret
    ce64:	0e060a63          	beqz	a2,cf58 <__umoddi3+0x2d0>
    ce68:	00010737          	lui	a4,0x10
    ce6c:	42e67663          	bgeu	a2,a4,d298 <__umoddi3+0x610>
    ce70:	10063693          	sltiu	a3,a2,256
    ce74:	0016b693          	seqz	a3,a3
    ce78:	00369693          	sll	a3,a3,0x3
    ce7c:	00d65533          	srl	a0,a2,a3
    ce80:	00004717          	auipc	a4,0x4
    ce84:	be070713          	add	a4,a4,-1056 # 10a60 <__clz_tab>
    ce88:	00a70733          	add	a4,a4,a0
    ce8c:	00074983          	lbu	s3,0(a4)
    ce90:	02000713          	li	a4,32
    ce94:	00d989b3          	add	s3,s3,a3
    ce98:	413704b3          	sub	s1,a4,s3
    ce9c:	0f371263          	bne	a4,s3,cf80 <__umoddi3+0x2f8>
    cea0:	01061413          	sll	s0,a2,0x10
    cea4:	40c589b3          	sub	s3,a1,a2
    cea8:	01065a93          	srl	s5,a2,0x10
    ceac:	01045413          	srl	s0,s0,0x10
    ceb0:	000a8593          	mv	a1,s5
    ceb4:	00098513          	mv	a0,s3
    ceb8:	7bd020ef          	jal	fe74 <__hidden___udivsi3>
    cebc:	00040593          	mv	a1,s0
    cec0:	6f1020ef          	jal	fdb0 <__mulsi3>
    cec4:	00050793          	mv	a5,a0
    cec8:	000a8593          	mv	a1,s5
    cecc:	00098513          	mv	a0,s3
    ced0:	00078993          	mv	s3,a5
    ced4:	7e9020ef          	jal	febc <__umodsi3>
    ced8:	01051513          	sll	a0,a0,0x10
    cedc:	01095793          	srl	a5,s2,0x10
    cee0:	00a7e7b3          	or	a5,a5,a0
    cee4:	0137f863          	bgeu	a5,s3,cef4 <__umoddi3+0x26c>
    cee8:	00fa07b3          	add	a5,s4,a5
    ceec:	0147e463          	bltu	a5,s4,cef4 <__umoddi3+0x26c>
    cef0:	3d37ea63          	bltu	a5,s3,d2c4 <__umoddi3+0x63c>
    cef4:	413789b3          	sub	s3,a5,s3
    cef8:	000a8593          	mv	a1,s5
    cefc:	00098513          	mv	a0,s3
    cf00:	775020ef          	jal	fe74 <__hidden___udivsi3>
    cf04:	00040593          	mv	a1,s0
    cf08:	6a9020ef          	jal	fdb0 <__mulsi3>
    cf0c:	00050413          	mv	s0,a0
    cf10:	000a8593          	mv	a1,s5
    cf14:	00098513          	mv	a0,s3
    cf18:	7a5020ef          	jal	febc <__umodsi3>
    cf1c:	01091913          	sll	s2,s2,0x10
    cf20:	01051793          	sll	a5,a0,0x10
    cf24:	01095913          	srl	s2,s2,0x10
    cf28:	00f967b3          	or	a5,s2,a5
    cf2c:	0087fa63          	bgeu	a5,s0,cf40 <__umoddi3+0x2b8>
    cf30:	00fa07b3          	add	a5,s4,a5
    cf34:	0147e663          	bltu	a5,s4,cf40 <__umoddi3+0x2b8>
    cf38:	0087f463          	bgeu	a5,s0,cf40 <__umoddi3+0x2b8>
    cf3c:	014787b3          	add	a5,a5,s4
    cf40:	408787b3          	sub	a5,a5,s0
    cf44:	e71ff06f          	j	cdb4 <__umoddi3+0x12c>
    cf48:	10063693          	sltiu	a3,a2,256
    cf4c:	0016b693          	seqz	a3,a3
    cf50:	00369693          	sll	a3,a3,0x3
    cf54:	d89ff06f          	j	ccdc <__umoddi3+0x54>
    cf58:	00000513          	li	a0,0
    cf5c:	00004717          	auipc	a4,0x4
    cf60:	b0470713          	add	a4,a4,-1276 # 10a60 <__clz_tab>
    cf64:	00a70733          	add	a4,a4,a0
    cf68:	00074983          	lbu	s3,0(a4)
    cf6c:	00000693          	li	a3,0
    cf70:	02000713          	li	a4,32
    cf74:	00d989b3          	add	s3,s3,a3
    cf78:	413704b3          	sub	s1,a4,s3
    cf7c:	f33702e3          	beq	a4,s3,cea0 <__umoddi3+0x218>
    cf80:	00961a33          	sll	s4,a2,s1
    cf84:	01712623          	sw	s7,12(sp)
    cf88:	010a5a93          	srl	s5,s4,0x10
    cf8c:	0135dbb3          	srl	s7,a1,s3
    cf90:	00959733          	sll	a4,a1,s1
    cf94:	0137d9b3          	srl	s3,a5,s3
    cf98:	000a8593          	mv	a1,s5
    cf9c:	000b8513          	mv	a0,s7
    cfa0:	010a1413          	sll	s0,s4,0x10
    cfa4:	00e9e9b3          	or	s3,s3,a4
    cfa8:	00979933          	sll	s2,a5,s1
    cfac:	01612823          	sw	s6,16(sp)
    cfb0:	01045413          	srl	s0,s0,0x10
    cfb4:	6c1020ef          	jal	fe74 <__hidden___udivsi3>
    cfb8:	00040593          	mv	a1,s0
    cfbc:	5f5020ef          	jal	fdb0 <__mulsi3>
    cfc0:	00050b13          	mv	s6,a0
    cfc4:	000a8593          	mv	a1,s5
    cfc8:	000b8513          	mv	a0,s7
    cfcc:	6f1020ef          	jal	febc <__umodsi3>
    cfd0:	01051513          	sll	a0,a0,0x10
    cfd4:	0109d793          	srl	a5,s3,0x10
    cfd8:	00a7e7b3          	or	a5,a5,a0
    cfdc:	0167fa63          	bgeu	a5,s6,cff0 <__umoddi3+0x368>
    cfe0:	00fa07b3          	add	a5,s4,a5
    cfe4:	0147e663          	bltu	a5,s4,cff0 <__umoddi3+0x368>
    cfe8:	0167f463          	bgeu	a5,s6,cff0 <__umoddi3+0x368>
    cfec:	014787b3          	add	a5,a5,s4
    cff0:	41678b33          	sub	s6,a5,s6
    cff4:	000a8593          	mv	a1,s5
    cff8:	000b0513          	mv	a0,s6
    cffc:	679020ef          	jal	fe74 <__hidden___udivsi3>
    d000:	00040593          	mv	a1,s0
    d004:	5ad020ef          	jal	fdb0 <__mulsi3>
    d008:	00050793          	mv	a5,a0
    d00c:	000a8593          	mv	a1,s5
    d010:	000b0513          	mv	a0,s6
    d014:	01099993          	sll	s3,s3,0x10
    d018:	00078b13          	mv	s6,a5
    d01c:	6a1020ef          	jal	febc <__umodsi3>
    d020:	01051513          	sll	a0,a0,0x10
    d024:	0109d993          	srl	s3,s3,0x10
    d028:	00a9e9b3          	or	s3,s3,a0
    d02c:	0169fa63          	bgeu	s3,s6,d040 <__umoddi3+0x3b8>
    d030:	013a09b3          	add	s3,s4,s3
    d034:	0149e663          	bltu	s3,s4,d040 <__umoddi3+0x3b8>
    d038:	0169f463          	bgeu	s3,s6,d040 <__umoddi3+0x3b8>
    d03c:	014989b3          	add	s3,s3,s4
    d040:	416989b3          	sub	s3,s3,s6
    d044:	00c12b83          	lw	s7,12(sp)
    d048:	01012b03          	lw	s6,16(sp)
    d04c:	e65ff06f          	j	ceb0 <__umoddi3+0x228>
    d050:	1006b513          	sltiu	a0,a3,256
    d054:	00153513          	seqz	a0,a0
    d058:	00351513          	sll	a0,a0,0x3
    d05c:	00a6d333          	srl	t1,a3,a0
    d060:	00004717          	auipc	a4,0x4
    d064:	a0070713          	add	a4,a4,-1536 # 10a60 <__clz_tab>
    d068:	00670733          	add	a4,a4,t1
    d06c:	00074703          	lbu	a4,0(a4)
    d070:	02000313          	li	t1,32
    d074:	00a709b3          	add	s3,a4,a0
    d078:	41330933          	sub	s2,t1,s3
    d07c:	db330ae3          	beq	t1,s3,ce30 <__umoddi3+0x1a8>
    d080:	01512a23          	sw	s5,20(sp)
    d084:	012696b3          	sll	a3,a3,s2
    d088:	01365ab3          	srl	s5,a2,s3
    d08c:	00daeab3          	or	s5,s5,a3
    d090:	01712623          	sw	s7,12(sp)
    d094:	01a12023          	sw	s10,0(sp)
    d098:	010adb93          	srl	s7,s5,0x10
    d09c:	0135dd33          	srl	s10,a1,s3
    d0a0:	01259733          	sll	a4,a1,s2
    d0a4:	0137d6b3          	srl	a3,a5,s3
    d0a8:	01912223          	sw	s9,4(sp)
    d0ac:	000b8593          	mv	a1,s7
    d0b0:	000d0513          	mv	a0,s10
    d0b4:	010a9c93          	sll	s9,s5,0x10
    d0b8:	02812423          	sw	s0,40(sp)
    d0bc:	02912223          	sw	s1,36(sp)
    d0c0:	01261433          	sll	s0,a2,s2
    d0c4:	012794b3          	sll	s1,a5,s2
    d0c8:	01412c23          	sw	s4,24(sp)
    d0cc:	01612823          	sw	s6,16(sp)
    d0d0:	00e6ea33          	or	s4,a3,a4
    d0d4:	01812423          	sw	s8,8(sp)
    d0d8:	010cdc93          	srl	s9,s9,0x10
    d0dc:	599020ef          	jal	fe74 <__hidden___udivsi3>
    d0e0:	00050593          	mv	a1,a0
    d0e4:	00050b13          	mv	s6,a0
    d0e8:	000c8513          	mv	a0,s9
    d0ec:	4c5020ef          	jal	fdb0 <__mulsi3>
    d0f0:	00050c13          	mv	s8,a0
    d0f4:	000b8593          	mv	a1,s7
    d0f8:	000d0513          	mv	a0,s10
    d0fc:	5c1020ef          	jal	febc <__umodsi3>
    d100:	01051513          	sll	a0,a0,0x10
    d104:	010a5793          	srl	a5,s4,0x10
    d108:	00a7e7b3          	or	a5,a5,a0
    d10c:	0187fe63          	bgeu	a5,s8,d128 <__umoddi3+0x4a0>
    d110:	00fa87b3          	add	a5,s5,a5
    d114:	fffb0713          	add	a4,s6,-1
    d118:	1957ee63          	bltu	a5,s5,d2b4 <__umoddi3+0x62c>
    d11c:	1987fc63          	bgeu	a5,s8,d2b4 <__umoddi3+0x62c>
    d120:	ffeb0b13          	add	s6,s6,-2
    d124:	015787b3          	add	a5,a5,s5
    d128:	41878c33          	sub	s8,a5,s8
    d12c:	000b8593          	mv	a1,s7
    d130:	000c0513          	mv	a0,s8
    d134:	541020ef          	jal	fe74 <__hidden___udivsi3>
    d138:	00050593          	mv	a1,a0
    d13c:	00050d13          	mv	s10,a0
    d140:	000c8513          	mv	a0,s9
    d144:	46d020ef          	jal	fdb0 <__mulsi3>
    d148:	00050793          	mv	a5,a0
    d14c:	000b8593          	mv	a1,s7
    d150:	000c0513          	mv	a0,s8
    d154:	00078b93          	mv	s7,a5
    d158:	565020ef          	jal	febc <__umodsi3>
    d15c:	010a1593          	sll	a1,s4,0x10
    d160:	01051513          	sll	a0,a0,0x10
    d164:	0105d593          	srl	a1,a1,0x10
    d168:	00a5e5b3          	or	a1,a1,a0
    d16c:	0175fe63          	bgeu	a1,s7,d188 <__umoddi3+0x500>
    d170:	00ba85b3          	add	a1,s5,a1
    d174:	fffd0793          	add	a5,s10,-1
    d178:	1355ea63          	bltu	a1,s5,d2ac <__umoddi3+0x624>
    d17c:	1375f863          	bgeu	a1,s7,d2ac <__umoddi3+0x624>
    d180:	ffed0d13          	add	s10,s10,-2
    d184:	015585b3          	add	a1,a1,s5
    d188:	010b1793          	sll	a5,s6,0x10
    d18c:	00010e37          	lui	t3,0x10
    d190:	01a7e7b3          	or	a5,a5,s10
    d194:	fffe0313          	add	t1,t3,-1 # ffff <__fini_array_end+0x57>
    d198:	0067f8b3          	and	a7,a5,t1
    d19c:	00647333          	and	t1,s0,t1
    d1a0:	41758733          	sub	a4,a1,s7
    d1a4:	0107d793          	srl	a5,a5,0x10
    d1a8:	01045e93          	srl	t4,s0,0x10
    d1ac:	00088513          	mv	a0,a7
    d1b0:	00030593          	mv	a1,t1
    d1b4:	3fd020ef          	jal	fdb0 <__mulsi3>
    d1b8:	00050813          	mv	a6,a0
    d1bc:	000e8593          	mv	a1,t4
    d1c0:	00088513          	mv	a0,a7
    d1c4:	3ed020ef          	jal	fdb0 <__mulsi3>
    d1c8:	00050893          	mv	a7,a0
    d1cc:	00030593          	mv	a1,t1
    d1d0:	00078513          	mv	a0,a5
    d1d4:	3dd020ef          	jal	fdb0 <__mulsi3>
    d1d8:	00050313          	mv	t1,a0
    d1dc:	000e8593          	mv	a1,t4
    d1e0:	00078513          	mv	a0,a5
    d1e4:	3cd020ef          	jal	fdb0 <__mulsi3>
    d1e8:	01085793          	srl	a5,a6,0x10
    d1ec:	006888b3          	add	a7,a7,t1
    d1f0:	011787b3          	add	a5,a5,a7
    d1f4:	0067f463          	bgeu	a5,t1,d1fc <__umoddi3+0x574>
    d1f8:	01c50533          	add	a0,a0,t3
    d1fc:	00010637          	lui	a2,0x10
    d200:	fff60613          	add	a2,a2,-1 # ffff <__fini_array_end+0x57>
    d204:	0107d693          	srl	a3,a5,0x10
    d208:	00c7f7b3          	and	a5,a5,a2
    d20c:	01079793          	sll	a5,a5,0x10
    d210:	00c87833          	and	a6,a6,a2
    d214:	00a686b3          	add	a3,a3,a0
    d218:	010787b3          	add	a5,a5,a6
    d21c:	06d76263          	bltu	a4,a3,d280 <__umoddi3+0x5f8>
    d220:	04d70e63          	beq	a4,a3,d27c <__umoddi3+0x5f4>
    d224:	40f487b3          	sub	a5,s1,a5
    d228:	00f4b4b3          	sltu	s1,s1,a5
    d22c:	02812403          	lw	s0,40(sp)
    d230:	02c12083          	lw	ra,44(sp)
    d234:	40d705b3          	sub	a1,a4,a3
    d238:	409585b3          	sub	a1,a1,s1
    d23c:	01359733          	sll	a4,a1,s3
    d240:	0127d7b3          	srl	a5,a5,s2
    d244:	02412483          	lw	s1,36(sp)
    d248:	01c12983          	lw	s3,28(sp)
    d24c:	01812a03          	lw	s4,24(sp)
    d250:	01412a83          	lw	s5,20(sp)
    d254:	01012b03          	lw	s6,16(sp)
    d258:	00c12b83          	lw	s7,12(sp)
    d25c:	00812c03          	lw	s8,8(sp)
    d260:	00412c83          	lw	s9,4(sp)
    d264:	00012d03          	lw	s10,0(sp)
    d268:	0125d5b3          	srl	a1,a1,s2
    d26c:	00f76533          	or	a0,a4,a5
    d270:	02012903          	lw	s2,32(sp)
    d274:	03010113          	add	sp,sp,48
    d278:	00008067          	ret
    d27c:	faf4f4e3          	bgeu	s1,a5,d224 <__umoddi3+0x59c>
    d280:	40878433          	sub	s0,a5,s0
    d284:	0087b7b3          	sltu	a5,a5,s0
    d288:	01578ab3          	add	s5,a5,s5
    d28c:	415686b3          	sub	a3,a3,s5
    d290:	00040793          	mv	a5,s0
    d294:	f91ff06f          	j	d224 <__umoddi3+0x59c>
    d298:	01000737          	lui	a4,0x1000
    d29c:	02e67c63          	bgeu	a2,a4,d2d4 <__umoddi3+0x64c>
    d2a0:	01065513          	srl	a0,a2,0x10
    d2a4:	01000693          	li	a3,16
    d2a8:	bd9ff06f          	j	ce80 <__umoddi3+0x1f8>
    d2ac:	00078d13          	mv	s10,a5
    d2b0:	ed9ff06f          	j	d188 <__umoddi3+0x500>
    d2b4:	00070b13          	mv	s6,a4
    d2b8:	e71ff06f          	j	d128 <__umoddi3+0x4a0>
    d2bc:	014787b3          	add	a5,a5,s4
    d2c0:	aedff06f          	j	cdac <__umoddi3+0x124>
    d2c4:	014787b3          	add	a5,a5,s4
    d2c8:	c2dff06f          	j	cef4 <__umoddi3+0x26c>
    d2cc:	014787b3          	add	a5,a5,s4
    d2d0:	a91ff06f          	j	cd60 <__umoddi3+0xd8>
    d2d4:	01865513          	srl	a0,a2,0x18
    d2d8:	01800693          	li	a3,24
    d2dc:	ba5ff06f          	j	ce80 <__umoddi3+0x1f8>

0000d2e0 <__adddf3>:
    d2e0:	001007b7          	lui	a5,0x100
    d2e4:	fe010113          	add	sp,sp,-32
    d2e8:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d2ec:	00bef833          	and	a6,t4,a1
    d2f0:	00def7b3          	and	a5,t4,a3
    d2f4:	0146d313          	srl	t1,a3,0x14
    d2f8:	01212823          	sw	s2,16(sp)
    d2fc:	0145d913          	srl	s2,a1,0x14
    d300:	00379793          	sll	a5,a5,0x3
    d304:	00812c23          	sw	s0,24(sp)
    d308:	00381813          	sll	a6,a6,0x3
    d30c:	01f5d413          	srl	s0,a1,0x1f
    d310:	01d55713          	srl	a4,a0,0x1d
    d314:	01d65893          	srl	a7,a2,0x1d
    d318:	7ff97913          	and	s2,s2,2047
    d31c:	7ff37313          	and	t1,t1,2047
    d320:	00112e23          	sw	ra,28(sp)
    d324:	00912a23          	sw	s1,20(sp)
    d328:	01312623          	sw	s3,12(sp)
    d32c:	01f6d693          	srl	a3,a3,0x1f
    d330:	00f8e8b3          	or	a7,a7,a5
    d334:	01076733          	or	a4,a4,a6
    d338:	00351593          	sll	a1,a0,0x3
    d33c:	00361f13          	sll	t5,a2,0x3
    d340:	406907b3          	sub	a5,s2,t1
    d344:	1ed40463          	beq	s0,a3,d52c <__adddf3+0x24c>
    d348:	16f05263          	blez	a5,d4ac <__adddf3+0x1cc>
    d34c:	28030663          	beqz	t1,d5d8 <__adddf3+0x2f8>
    d350:	7ff00693          	li	a3,2047
    d354:	42d90663          	beq	s2,a3,d780 <__adddf3+0x4a0>
    d358:	03800693          	li	a3,56
    d35c:	00100613          	li	a2,1
    d360:	02f6ce63          	blt	a3,a5,d39c <__adddf3+0xbc>
    d364:	008006b7          	lui	a3,0x800
    d368:	00d8e8b3          	or	a7,a7,a3
    d36c:	01f00693          	li	a3,31
    d370:	52f6ce63          	blt	a3,a5,d8ac <__adddf3+0x5cc>
    d374:	02000693          	li	a3,32
    d378:	40f686b3          	sub	a3,a3,a5
    d37c:	00d89633          	sll	a2,a7,a3
    d380:	00ff5533          	srl	a0,t5,a5
    d384:	00df16b3          	sll	a3,t5,a3
    d388:	00a66633          	or	a2,a2,a0
    d38c:	00d036b3          	snez	a3,a3
    d390:	00f8d8b3          	srl	a7,a7,a5
    d394:	00d66633          	or	a2,a2,a3
    d398:	41170733          	sub	a4,a4,a7
    d39c:	40c58633          	sub	a2,a1,a2
    d3a0:	00c5b5b3          	sltu	a1,a1,a2
    d3a4:	00060493          	mv	s1,a2
    d3a8:	40b709b3          	sub	s3,a4,a1
    d3ac:	00899793          	sll	a5,s3,0x8
    d3b0:	3207da63          	bgez	a5,d6e4 <__adddf3+0x404>
    d3b4:	008007b7          	lui	a5,0x800
    d3b8:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    d3bc:	00f9f9b3          	and	s3,s3,a5
    d3c0:	2c098863          	beqz	s3,d690 <__adddf3+0x3b0>
    d3c4:	00098513          	mv	a0,s3
    d3c8:	359020ef          	jal	ff20 <__clzsi2>
    d3cc:	ff850793          	add	a5,a0,-8
    d3d0:	02000693          	li	a3,32
    d3d4:	40f68733          	sub	a4,a3,a5
    d3d8:	00e4d733          	srl	a4,s1,a4
    d3dc:	00f999b3          	sll	s3,s3,a5
    d3e0:	01376733          	or	a4,a4,s3
    d3e4:	00f494b3          	sll	s1,s1,a5
    d3e8:	4b27c863          	blt	a5,s2,d898 <__adddf3+0x5b8>
    d3ec:	412787b3          	sub	a5,a5,s2
    d3f0:	00178793          	add	a5,a5,1
    d3f4:	40f686b3          	sub	a3,a3,a5
    d3f8:	00d49633          	sll	a2,s1,a3
    d3fc:	00f4d9b3          	srl	s3,s1,a5
    d400:	00c03633          	snez	a2,a2
    d404:	01366633          	or	a2,a2,s3
    d408:	00d716b3          	sll	a3,a4,a3
    d40c:	00c6e4b3          	or	s1,a3,a2
    d410:	00f759b3          	srl	s3,a4,a5
    d414:	00000913          	li	s2,0
    d418:	0074f793          	and	a5,s1,7
    d41c:	02078063          	beqz	a5,d43c <__adddf3+0x15c>
    d420:	00f4f793          	and	a5,s1,15
    d424:	00400713          	li	a4,4
    d428:	00e78a63          	beq	a5,a4,d43c <__adddf3+0x15c>
    d42c:	00448793          	add	a5,s1,4
    d430:	0097b633          	sltu	a2,a5,s1
    d434:	00c989b3          	add	s3,s3,a2
    d438:	00078493          	mv	s1,a5
    d43c:	00899793          	sll	a5,s3,0x8
    d440:	6e07da63          	bgez	a5,db34 <__adddf3+0x854>
    d444:	00190793          	add	a5,s2,1
    d448:	7ff00713          	li	a4,2047
    d44c:	00040e13          	mv	t3,s0
    d450:	2ae78663          	beq	a5,a4,d6fc <__adddf3+0x41c>
    d454:	ff800737          	lui	a4,0xff800
    d458:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    d45c:	00e9f733          	and	a4,s3,a4
    d460:	7ff7f793          	and	a5,a5,2047
    d464:	01d71813          	sll	a6,a4,0x1d
    d468:	0034d613          	srl	a2,s1,0x3
    d46c:	00971713          	sll	a4,a4,0x9
    d470:	00c86833          	or	a6,a6,a2
    d474:	00c75713          	srl	a4,a4,0xc
    d478:	01c12083          	lw	ra,28(sp)
    d47c:	01812403          	lw	s0,24(sp)
    d480:	01479793          	sll	a5,a5,0x14
    d484:	00e7e7b3          	or	a5,a5,a4
    d488:	01fe1713          	sll	a4,t3,0x1f
    d48c:	00e7e7b3          	or	a5,a5,a4
    d490:	01412483          	lw	s1,20(sp)
    d494:	01012903          	lw	s2,16(sp)
    d498:	00c12983          	lw	s3,12(sp)
    d49c:	00080513          	mv	a0,a6
    d4a0:	00078593          	mv	a1,a5
    d4a4:	02010113          	add	sp,sp,32
    d4a8:	00008067          	ret
    d4ac:	14078c63          	beqz	a5,d604 <__adddf3+0x324>
    d4b0:	412307b3          	sub	a5,t1,s2
    d4b4:	3c091263          	bnez	s2,d878 <__adddf3+0x598>
    d4b8:	00b76533          	or	a0,a4,a1
    d4bc:	4c050463          	beqz	a0,d984 <__adddf3+0x6a4>
    d4c0:	fff78513          	add	a0,a5,-1
    d4c4:	60050263          	beqz	a0,dac8 <__adddf3+0x7e8>
    d4c8:	7ff00813          	li	a6,2047
    d4cc:	57078663          	beq	a5,a6,da38 <__adddf3+0x758>
    d4d0:	03800793          	li	a5,56
    d4d4:	00100613          	li	a2,1
    d4d8:	02a7cc63          	blt	a5,a0,d510 <__adddf3+0x230>
    d4dc:	00050793          	mv	a5,a0
    d4e0:	01f00613          	li	a2,31
    d4e4:	56f64c63          	blt	a2,a5,da5c <__adddf3+0x77c>
    d4e8:	02000513          	li	a0,32
    d4ec:	40f50533          	sub	a0,a0,a5
    d4f0:	00a71633          	sll	a2,a4,a0
    d4f4:	00f5d833          	srl	a6,a1,a5
    d4f8:	00a59533          	sll	a0,a1,a0
    d4fc:	01066633          	or	a2,a2,a6
    d500:	00a03533          	snez	a0,a0
    d504:	00f75733          	srl	a4,a4,a5
    d508:	00a66633          	or	a2,a2,a0
    d50c:	40e888b3          	sub	a7,a7,a4
    d510:	40cf0633          	sub	a2,t5,a2
    d514:	00cf3733          	sltu	a4,t5,a2
    d518:	00060493          	mv	s1,a2
    d51c:	40e889b3          	sub	s3,a7,a4
    d520:	00030913          	mv	s2,t1
    d524:	00068413          	mv	s0,a3
    d528:	e85ff06f          	j	d3ac <__adddf3+0xcc>
    d52c:	1ef05063          	blez	a5,d70c <__adddf3+0x42c>
    d530:	14031063          	bnez	t1,d670 <__adddf3+0x390>
    d534:	01e8e6b3          	or	a3,a7,t5
    d538:	26068c63          	beqz	a3,d7b0 <__adddf3+0x4d0>
    d53c:	fff78693          	add	a3,a5,-1
    d540:	48068063          	beqz	a3,d9c0 <__adddf3+0x6e0>
    d544:	7ff00613          	li	a2,2047
    d548:	22c78c63          	beq	a5,a2,d780 <__adddf3+0x4a0>
    d54c:	03800793          	li	a5,56
    d550:	00100993          	li	s3,1
    d554:	02d7cc63          	blt	a5,a3,d58c <__adddf3+0x2ac>
    d558:	00068793          	mv	a5,a3
    d55c:	01f00693          	li	a3,31
    d560:	4af6c063          	blt	a3,a5,da00 <__adddf3+0x720>
    d564:	02000693          	li	a3,32
    d568:	40f686b3          	sub	a3,a3,a5
    d56c:	00d899b3          	sll	s3,a7,a3
    d570:	00ff5633          	srl	a2,t5,a5
    d574:	00df16b3          	sll	a3,t5,a3
    d578:	00c9e9b3          	or	s3,s3,a2
    d57c:	00d036b3          	snez	a3,a3
    d580:	00f8d8b3          	srl	a7,a7,a5
    d584:	00d9e9b3          	or	s3,s3,a3
    d588:	01170733          	add	a4,a4,a7
    d58c:	00b985b3          	add	a1,s3,a1
    d590:	0135b9b3          	sltu	s3,a1,s3
    d594:	00058493          	mv	s1,a1
    d598:	00e989b3          	add	s3,s3,a4
    d59c:	00899793          	sll	a5,s3,0x8
    d5a0:	1407d263          	bgez	a5,d6e4 <__adddf3+0x404>
    d5a4:	00190913          	add	s2,s2,1
    d5a8:	7ff00793          	li	a5,2047
    d5ac:	36f90c63          	beq	s2,a5,d924 <__adddf3+0x644>
    d5b0:	ff8007b7          	lui	a5,0xff800
    d5b4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    d5b8:	0014f613          	and	a2,s1,1
    d5bc:	00f9f7b3          	and	a5,s3,a5
    d5c0:	0014d713          	srl	a4,s1,0x1
    d5c4:	00c76733          	or	a4,a4,a2
    d5c8:	01f79613          	sll	a2,a5,0x1f
    d5cc:	00e664b3          	or	s1,a2,a4
    d5d0:	0017d993          	srl	s3,a5,0x1
    d5d4:	e45ff06f          	j	d418 <__adddf3+0x138>
    d5d8:	01e8e6b3          	or	a3,a7,t5
    d5dc:	1c068a63          	beqz	a3,d7b0 <__adddf3+0x4d0>
    d5e0:	fff78693          	add	a3,a5,-1
    d5e4:	40068063          	beqz	a3,d9e4 <__adddf3+0x704>
    d5e8:	7ff00613          	li	a2,2047
    d5ec:	18c78a63          	beq	a5,a2,d780 <__adddf3+0x4a0>
    d5f0:	03800793          	li	a5,56
    d5f4:	00100613          	li	a2,1
    d5f8:	dad7c2e3          	blt	a5,a3,d39c <__adddf3+0xbc>
    d5fc:	00068793          	mv	a5,a3
    d600:	d6dff06f          	j	d36c <__adddf3+0x8c>
    d604:	00190813          	add	a6,s2,1
    d608:	7fe87813          	and	a6,a6,2046
    d60c:	22081c63          	bnez	a6,d844 <__adddf3+0x564>
    d610:	00b76333          	or	t1,a4,a1
    d614:	01e8e833          	or	a6,a7,t5
    d618:	38091063          	bnez	s2,d998 <__adddf3+0x6b8>
    d61c:	46030e63          	beqz	t1,da98 <__adddf3+0x7b8>
    d620:	40080663          	beqz	a6,da2c <__adddf3+0x74c>
    d624:	41e589b3          	sub	s3,a1,t5
    d628:	0135b533          	sltu	a0,a1,s3
    d62c:	41170633          	sub	a2,a4,a7
    d630:	40a60633          	sub	a2,a2,a0
    d634:	00861513          	sll	a0,a2,0x8
    d638:	50055e63          	bgez	a0,db54 <__adddf3+0x874>
    d63c:	40bf05b3          	sub	a1,t5,a1
    d640:	40e88733          	sub	a4,a7,a4
    d644:	00bf3f33          	sltu	t5,t5,a1
    d648:	41e70733          	sub	a4,a4,t5
    d64c:	00871613          	sll	a2,a4,0x8
    d650:	00058493          	mv	s1,a1
    d654:	52065e63          	bgez	a2,db90 <__adddf3+0x8b0>
    d658:	ff8007b7          	lui	a5,0xff800
    d65c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    d660:	00f77733          	and	a4,a4,a5
    d664:	00068e13          	mv	t3,a3
    d668:	00100793          	li	a5,1
    d66c:	df9ff06f          	j	d464 <__adddf3+0x184>
    d670:	7ff00693          	li	a3,2047
    d674:	10d90663          	beq	s2,a3,d780 <__adddf3+0x4a0>
    d678:	03800693          	li	a3,56
    d67c:	00100993          	li	s3,1
    d680:	f0f6c6e3          	blt	a3,a5,d58c <__adddf3+0x2ac>
    d684:	008006b7          	lui	a3,0x800
    d688:	00d8e8b3          	or	a7,a7,a3
    d68c:	ed1ff06f          	j	d55c <__adddf3+0x27c>
    d690:	00048513          	mv	a0,s1
    d694:	08d020ef          	jal	ff20 <__clzsi2>
    d698:	01850793          	add	a5,a0,24
    d69c:	01f00693          	li	a3,31
    d6a0:	d2f6d8e3          	bge	a3,a5,d3d0 <__adddf3+0xf0>
    d6a4:	ff850713          	add	a4,a0,-8
    d6a8:	00e49733          	sll	a4,s1,a4
    d6ac:	2327c663          	blt	a5,s2,d8d8 <__adddf3+0x5f8>
    d6b0:	41278933          	sub	s2,a5,s2
    d6b4:	00190793          	add	a5,s2,1
    d6b8:	48f6d663          	bge	a3,a5,db44 <__adddf3+0x864>
    d6bc:	fe190913          	add	s2,s2,-31
    d6c0:	02000693          	li	a3,32
    d6c4:	012754b3          	srl	s1,a4,s2
    d6c8:	00d78c63          	beq	a5,a3,d6e0 <__adddf3+0x400>
    d6cc:	04000693          	li	a3,64
    d6d0:	40f687b3          	sub	a5,a3,a5
    d6d4:	00f71733          	sll	a4,a4,a5
    d6d8:	00e03733          	snez	a4,a4
    d6dc:	00e4e4b3          	or	s1,s1,a4
    d6e0:	00000913          	li	s2,0
    d6e4:	0074f793          	and	a5,s1,7
    d6e8:	d2079ce3          	bnez	a5,d420 <__adddf3+0x140>
    d6ec:	00090793          	mv	a5,s2
    d6f0:	0034d613          	srl	a2,s1,0x3
    d6f4:	00098713          	mv	a4,s3
    d6f8:	0c00006f          	j	d7b8 <__adddf3+0x4d8>
    d6fc:	7ff00793          	li	a5,2047
    d700:	00000713          	li	a4,0
    d704:	00000813          	li	a6,0
    d708:	d71ff06f          	j	d478 <__adddf3+0x198>
    d70c:	0c078a63          	beqz	a5,d7e0 <__adddf3+0x500>
    d710:	412307b3          	sub	a5,t1,s2
    d714:	1e090263          	beqz	s2,d8f8 <__adddf3+0x618>
    d718:	7ff00693          	li	a3,2047
    d71c:	32d30863          	beq	t1,a3,da4c <__adddf3+0x76c>
    d720:	03800693          	li	a3,56
    d724:	00100993          	li	s3,1
    d728:	02f6ce63          	blt	a3,a5,d764 <__adddf3+0x484>
    d72c:	008006b7          	lui	a3,0x800
    d730:	00d76733          	or	a4,a4,a3
    d734:	01f00693          	li	a3,31
    d738:	3cf6c863          	blt	a3,a5,db08 <__adddf3+0x828>
    d73c:	02000693          	li	a3,32
    d740:	40f686b3          	sub	a3,a3,a5
    d744:	00d719b3          	sll	s3,a4,a3
    d748:	00f5d633          	srl	a2,a1,a5
    d74c:	00d596b3          	sll	a3,a1,a3
    d750:	00c9e9b3          	or	s3,s3,a2
    d754:	00d036b3          	snez	a3,a3
    d758:	00f75733          	srl	a4,a4,a5
    d75c:	00d9e9b3          	or	s3,s3,a3
    d760:	00e888b3          	add	a7,a7,a4
    d764:	01e98733          	add	a4,s3,t5
    d768:	013739b3          	sltu	s3,a4,s3
    d76c:	00070493          	mv	s1,a4
    d770:	011989b3          	add	s3,s3,a7
    d774:	00030913          	mv	s2,t1
    d778:	e25ff06f          	j	d59c <__adddf3+0x2bc>
    d77c:	02081063          	bnez	a6,d79c <__adddf3+0x4bc>
    d780:	00351613          	sll	a2,a0,0x3
    d784:	00365613          	srl	a2,a2,0x3
    d788:	01d71813          	sll	a6,a4,0x1d
    d78c:	00c86833          	or	a6,a6,a2
    d790:	00375713          	srl	a4,a4,0x3
    d794:	01076733          	or	a4,a4,a6
    d798:	18070663          	beqz	a4,d924 <__adddf3+0x644>
    d79c:	00000e13          	li	t3,0
    d7a0:	7ff00793          	li	a5,2047
    d7a4:	00080737          	lui	a4,0x80
    d7a8:	00000813          	li	a6,0
    d7ac:	ccdff06f          	j	d478 <__adddf3+0x198>
    d7b0:	00351613          	sll	a2,a0,0x3
    d7b4:	00365613          	srl	a2,a2,0x3
    d7b8:	01d71813          	sll	a6,a4,0x1d
    d7bc:	7ff00693          	li	a3,2047
    d7c0:	00c86833          	or	a6,a6,a2
    d7c4:	00375713          	srl	a4,a4,0x3
    d7c8:	fcd786e3          	beq	a5,a3,d794 <__adddf3+0x4b4>
    d7cc:	00c71713          	sll	a4,a4,0xc
    d7d0:	00c75713          	srl	a4,a4,0xc
    d7d4:	7ff7f793          	and	a5,a5,2047
    d7d8:	00040e13          	mv	t3,s0
    d7dc:	c9dff06f          	j	d478 <__adddf3+0x198>
    d7e0:	00190693          	add	a3,s2,1
    d7e4:	7fe6f813          	and	a6,a3,2046
    d7e8:	14081863          	bnez	a6,d938 <__adddf3+0x658>
    d7ec:	00b766b3          	or	a3,a4,a1
    d7f0:	28091c63          	bnez	s2,da88 <__adddf3+0x7a8>
    d7f4:	30068263          	beqz	a3,daf8 <__adddf3+0x818>
    d7f8:	01e8e6b3          	or	a3,a7,t5
    d7fc:	22068863          	beqz	a3,da2c <__adddf3+0x74c>
    d800:	01e587b3          	add	a5,a1,t5
    d804:	00b7b5b3          	sltu	a1,a5,a1
    d808:	01170733          	add	a4,a4,a7
    d80c:	00b70733          	add	a4,a4,a1
    d810:	0037d813          	srl	a6,a5,0x3
    d814:	00871793          	sll	a5,a4,0x8
    d818:	00040e13          	mv	t3,s0
    d81c:	3407de63          	bgez	a5,db78 <__adddf3+0x898>
    d820:	ff8007b7          	lui	a5,0xff800
    d824:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    d828:	00f77733          	and	a4,a4,a5
    d82c:	01d71793          	sll	a5,a4,0x1d
    d830:	00375713          	srl	a4,a4,0x3
    d834:	0107e833          	or	a6,a5,a6
    d838:	01d77733          	and	a4,a4,t4
    d83c:	00100793          	li	a5,1
    d840:	c39ff06f          	j	d478 <__adddf3+0x198>
    d844:	41e58833          	sub	a6,a1,t5
    d848:	0105b7b3          	sltu	a5,a1,a6
    d84c:	411709b3          	sub	s3,a4,a7
    d850:	40f989b3          	sub	s3,s3,a5
    d854:	00899793          	sll	a5,s3,0x8
    d858:	00080493          	mv	s1,a6
    d85c:	1007c663          	bltz	a5,d968 <__adddf3+0x688>
    d860:	01386833          	or	a6,a6,s3
    d864:	b4081ee3          	bnez	a6,d3c0 <__adddf3+0xe0>
    d868:	00000e13          	li	t3,0
    d86c:	00000793          	li	a5,0
    d870:	00000713          	li	a4,0
    d874:	c05ff06f          	j	d478 <__adddf3+0x198>
    d878:	7ff00513          	li	a0,2047
    d87c:	1aa30e63          	beq	t1,a0,da38 <__adddf3+0x758>
    d880:	03800513          	li	a0,56
    d884:	00100613          	li	a2,1
    d888:	c8f544e3          	blt	a0,a5,d510 <__adddf3+0x230>
    d88c:	00800637          	lui	a2,0x800
    d890:	00c76733          	or	a4,a4,a2
    d894:	c4dff06f          	j	d4e0 <__adddf3+0x200>
    d898:	ff8009b7          	lui	s3,0xff800
    d89c:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    d8a0:	40f90933          	sub	s2,s2,a5
    d8a4:	013779b3          	and	s3,a4,s3
    d8a8:	b71ff06f          	j	d418 <__adddf3+0x138>
    d8ac:	fe078693          	add	a3,a5,-32
    d8b0:	02000613          	li	a2,32
    d8b4:	00d8d6b3          	srl	a3,a7,a3
    d8b8:	00c78a63          	beq	a5,a2,d8cc <__adddf3+0x5ec>
    d8bc:	04000613          	li	a2,64
    d8c0:	40f607b3          	sub	a5,a2,a5
    d8c4:	00f897b3          	sll	a5,a7,a5
    d8c8:	00ff6f33          	or	t5,t5,a5
    d8cc:	01e03633          	snez	a2,t5
    d8d0:	00d66633          	or	a2,a2,a3
    d8d4:	ac9ff06f          	j	d39c <__adddf3+0xbc>
    d8d8:	ff8006b7          	lui	a3,0xff800
    d8dc:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    d8e0:	40f907b3          	sub	a5,s2,a5
    d8e4:	00d77733          	and	a4,a4,a3
    d8e8:	01d71813          	sll	a6,a4,0x1d
    d8ec:	01386833          	or	a6,a6,s3
    d8f0:	00375713          	srl	a4,a4,0x3
    d8f4:	ed9ff06f          	j	d7cc <__adddf3+0x4ec>
    d8f8:	00b766b3          	or	a3,a4,a1
    d8fc:	1e068663          	beqz	a3,dae8 <__adddf3+0x808>
    d900:	fff78693          	add	a3,a5,-1
    d904:	0a068e63          	beqz	a3,d9c0 <__adddf3+0x6e0>
    d908:	7ff00513          	li	a0,2047
    d90c:	14a78063          	beq	a5,a0,da4c <__adddf3+0x76c>
    d910:	03800793          	li	a5,56
    d914:	00100993          	li	s3,1
    d918:	e4d7c6e3          	blt	a5,a3,d764 <__adddf3+0x484>
    d91c:	00068793          	mv	a5,a3
    d920:	e15ff06f          	j	d734 <__adddf3+0x454>
    d924:	00040e13          	mv	t3,s0
    d928:	7ff00793          	li	a5,2047
    d92c:	00000713          	li	a4,0
    d930:	00000813          	li	a6,0
    d934:	b45ff06f          	j	d478 <__adddf3+0x198>
    d938:	7ff00793          	li	a5,2047
    d93c:	fef684e3          	beq	a3,a5,d924 <__adddf3+0x644>
    d940:	01e58f33          	add	t5,a1,t5
    d944:	00bf35b3          	sltu	a1,t5,a1
    d948:	011707b3          	add	a5,a4,a7
    d94c:	00b787b3          	add	a5,a5,a1
    d950:	01f79613          	sll	a2,a5,0x1f
    d954:	001f5f13          	srl	t5,t5,0x1
    d958:	01e664b3          	or	s1,a2,t5
    d95c:	0017d993          	srl	s3,a5,0x1
    d960:	00068913          	mv	s2,a3
    d964:	ab5ff06f          	j	d418 <__adddf3+0x138>
    d968:	40bf0633          	sub	a2,t5,a1
    d96c:	40e887b3          	sub	a5,a7,a4
    d970:	00cf3733          	sltu	a4,t5,a2
    d974:	00060493          	mv	s1,a2
    d978:	40e789b3          	sub	s3,a5,a4
    d97c:	00068413          	mv	s0,a3
    d980:	a41ff06f          	j	d3c0 <__adddf3+0xe0>
    d984:	00361613          	sll	a2,a2,0x3
    d988:	00365613          	srl	a2,a2,0x3
    d98c:	00068413          	mv	s0,a3
    d990:	00088713          	mv	a4,a7
    d994:	e25ff06f          	j	d7b8 <__adddf3+0x4d8>
    d998:	de0312e3          	bnez	t1,d77c <__adddf3+0x49c>
    d99c:	1c080663          	beqz	a6,db68 <__adddf3+0x888>
    d9a0:	0038d713          	srl	a4,a7,0x3
    d9a4:	00361613          	sll	a2,a2,0x3
    d9a8:	01d89893          	sll	a7,a7,0x1d
    d9ac:	01176733          	or	a4,a4,a7
    d9b0:	00365613          	srl	a2,a2,0x3
    d9b4:	00c76733          	or	a4,a4,a2
    d9b8:	00068413          	mv	s0,a3
    d9bc:	dddff06f          	j	d798 <__adddf3+0x4b8>
    d9c0:	01e58f33          	add	t5,a1,t5
    d9c4:	011708b3          	add	a7,a4,a7
    d9c8:	00bf35b3          	sltu	a1,t5,a1
    d9cc:	00b889b3          	add	s3,a7,a1
    d9d0:	00899793          	sll	a5,s3,0x8
    d9d4:	000f0493          	mv	s1,t5
    d9d8:	0e07d463          	bgez	a5,dac0 <__adddf3+0x7e0>
    d9dc:	00200913          	li	s2,2
    d9e0:	bd1ff06f          	j	d5b0 <__adddf3+0x2d0>
    d9e4:	41e58f33          	sub	t5,a1,t5
    d9e8:	411708b3          	sub	a7,a4,a7
    d9ec:	01e5b5b3          	sltu	a1,a1,t5
    d9f0:	000f0493          	mv	s1,t5
    d9f4:	40b889b3          	sub	s3,a7,a1
    d9f8:	00100913          	li	s2,1
    d9fc:	9b1ff06f          	j	d3ac <__adddf3+0xcc>
    da00:	fe078693          	add	a3,a5,-32
    da04:	02000613          	li	a2,32
    da08:	00d8d6b3          	srl	a3,a7,a3
    da0c:	00c78a63          	beq	a5,a2,da20 <__adddf3+0x740>
    da10:	04000613          	li	a2,64
    da14:	40f607b3          	sub	a5,a2,a5
    da18:	00f897b3          	sll	a5,a7,a5
    da1c:	00ff6f33          	or	t5,t5,a5
    da20:	01e039b3          	snez	s3,t5
    da24:	00d9e9b3          	or	s3,s3,a3
    da28:	b65ff06f          	j	d58c <__adddf3+0x2ac>
    da2c:	00351613          	sll	a2,a0,0x3
    da30:	00365993          	srl	s3,a2,0x3
    da34:	eb5ff06f          	j	d8e8 <__adddf3+0x608>
    da38:	00361613          	sll	a2,a2,0x3
    da3c:	00365613          	srl	a2,a2,0x3
    da40:	00068413          	mv	s0,a3
    da44:	00088713          	mv	a4,a7
    da48:	d41ff06f          	j	d788 <__adddf3+0x4a8>
    da4c:	00361613          	sll	a2,a2,0x3
    da50:	00365613          	srl	a2,a2,0x3
    da54:	00088713          	mv	a4,a7
    da58:	d31ff06f          	j	d788 <__adddf3+0x4a8>
    da5c:	fe078513          	add	a0,a5,-32
    da60:	02000613          	li	a2,32
    da64:	00a75533          	srl	a0,a4,a0
    da68:	00c78a63          	beq	a5,a2,da7c <__adddf3+0x79c>
    da6c:	04000613          	li	a2,64
    da70:	40f607b3          	sub	a5,a2,a5
    da74:	00f717b3          	sll	a5,a4,a5
    da78:	00f5e5b3          	or	a1,a1,a5
    da7c:	00b03633          	snez	a2,a1
    da80:	00a66633          	or	a2,a2,a0
    da84:	a8dff06f          	j	d510 <__adddf3+0x230>
    da88:	fc0682e3          	beqz	a3,da4c <__adddf3+0x76c>
    da8c:	01e8ef33          	or	t5,a7,t5
    da90:	d00f16e3          	bnez	t5,d79c <__adddf3+0x4bc>
    da94:	cedff06f          	j	d780 <__adddf3+0x4a0>
    da98:	dc0808e3          	beqz	a6,d868 <__adddf3+0x588>
    da9c:	00361813          	sll	a6,a2,0x3
    daa0:	01d89793          	sll	a5,a7,0x1d
    daa4:	00385813          	srl	a6,a6,0x3
    daa8:	0038d713          	srl	a4,a7,0x3
    daac:	00f86833          	or	a6,a6,a5
    dab0:	01d77733          	and	a4,a4,t4
    dab4:	00068e13          	mv	t3,a3
    dab8:	00000793          	li	a5,0
    dabc:	9bdff06f          	j	d478 <__adddf3+0x198>
    dac0:	00100793          	li	a5,1
    dac4:	c2dff06f          	j	d6f0 <__adddf3+0x410>
    dac8:	40bf05b3          	sub	a1,t5,a1
    dacc:	40e888b3          	sub	a7,a7,a4
    dad0:	00bf3733          	sltu	a4,t5,a1
    dad4:	00058493          	mv	s1,a1
    dad8:	40e889b3          	sub	s3,a7,a4
    dadc:	00068413          	mv	s0,a3
    dae0:	00100913          	li	s2,1
    dae4:	8c9ff06f          	j	d3ac <__adddf3+0xcc>
    dae8:	00361613          	sll	a2,a2,0x3
    daec:	00365613          	srl	a2,a2,0x3
    daf0:	00088713          	mv	a4,a7
    daf4:	cc5ff06f          	j	d7b8 <__adddf3+0x4d8>
    daf8:	00361613          	sll	a2,a2,0x3
    dafc:	00365993          	srl	s3,a2,0x3
    db00:	00088713          	mv	a4,a7
    db04:	de5ff06f          	j	d8e8 <__adddf3+0x608>
    db08:	fe078693          	add	a3,a5,-32
    db0c:	02000613          	li	a2,32
    db10:	00d756b3          	srl	a3,a4,a3
    db14:	00c78a63          	beq	a5,a2,db28 <__adddf3+0x848>
    db18:	04000613          	li	a2,64
    db1c:	40f607b3          	sub	a5,a2,a5
    db20:	00f717b3          	sll	a5,a4,a5
    db24:	00f5e5b3          	or	a1,a1,a5
    db28:	00b039b3          	snez	s3,a1
    db2c:	00d9e9b3          	or	s3,s3,a3
    db30:	c35ff06f          	j	d764 <__adddf3+0x484>
    db34:	0034d613          	srl	a2,s1,0x3
    db38:	00090793          	mv	a5,s2
    db3c:	00098713          	mv	a4,s3
    db40:	c79ff06f          	j	d7b8 <__adddf3+0x4d8>
    db44:	02000693          	li	a3,32
    db48:	40f686b3          	sub	a3,a3,a5
    db4c:	00000613          	li	a2,0
    db50:	8b5ff06f          	j	d404 <__adddf3+0x124>
    db54:	00c9e833          	or	a6,s3,a2
    db58:	d00808e3          	beqz	a6,d868 <__adddf3+0x588>
    db5c:	0039d993          	srl	s3,s3,0x3
    db60:	00060713          	mv	a4,a2
    db64:	d85ff06f          	j	d8e8 <__adddf3+0x608>
    db68:	00000e13          	li	t3,0
    db6c:	7ff00793          	li	a5,2047
    db70:	00080737          	lui	a4,0x80
    db74:	905ff06f          	j	d478 <__adddf3+0x198>
    db78:	01d71793          	sll	a5,a4,0x1d
    db7c:	00375713          	srl	a4,a4,0x3
    db80:	0107e833          	or	a6,a5,a6
    db84:	01d77733          	and	a4,a4,t4
    db88:	00000793          	li	a5,0
    db8c:	8edff06f          	j	d478 <__adddf3+0x198>
    db90:	01d71813          	sll	a6,a4,0x1d
    db94:	0035d593          	srl	a1,a1,0x3
    db98:	00b86833          	or	a6,a6,a1
    db9c:	00375713          	srl	a4,a4,0x3
    dba0:	00068413          	mv	s0,a3
    dba4:	c29ff06f          	j	d7cc <__adddf3+0x4ec>

0000dba8 <__divdf3>:
    dba8:	fb010113          	add	sp,sp,-80
    dbac:	0145d793          	srl	a5,a1,0x14
    dbb0:	04812423          	sw	s0,72(sp)
    dbb4:	04912223          	sw	s1,68(sp)
    dbb8:	05212023          	sw	s2,64(sp)
    dbbc:	03412c23          	sw	s4,56(sp)
    dbc0:	03512a23          	sw	s5,52(sp)
    dbc4:	00c59493          	sll	s1,a1,0xc
    dbc8:	04112623          	sw	ra,76(sp)
    dbcc:	03312e23          	sw	s3,60(sp)
    dbd0:	03612823          	sw	s6,48(sp)
    dbd4:	03712623          	sw	s7,44(sp)
    dbd8:	03812423          	sw	s8,40(sp)
    dbdc:	7ff7f793          	and	a5,a5,2047
    dbe0:	00050413          	mv	s0,a0
    dbe4:	00060a13          	mv	s4,a2
    dbe8:	00068913          	mv	s2,a3
    dbec:	00c4d493          	srl	s1,s1,0xc
    dbf0:	01f5da93          	srl	s5,a1,0x1f
    dbf4:	18078c63          	beqz	a5,dd8c <__divdf3+0x1e4>
    dbf8:	7ff00713          	li	a4,2047
    dbfc:	08e78a63          	beq	a5,a4,dc90 <__divdf3+0xe8>
    dc00:	01d55b13          	srl	s6,a0,0x1d
    dc04:	00349493          	sll	s1,s1,0x3
    dc08:	009b64b3          	or	s1,s6,s1
    dc0c:	00800737          	lui	a4,0x800
    dc10:	00e4eb33          	or	s6,s1,a4
    dc14:	00351b93          	sll	s7,a0,0x3
    dc18:	c0178993          	add	s3,a5,-1023
    dc1c:	00000493          	li	s1,0
    dc20:	00000c13          	li	s8,0
    dc24:	01495793          	srl	a5,s2,0x14
    dc28:	00c91413          	sll	s0,s2,0xc
    dc2c:	7ff7f793          	and	a5,a5,2047
    dc30:	00c45413          	srl	s0,s0,0xc
    dc34:	01f95913          	srl	s2,s2,0x1f
    dc38:	08078463          	beqz	a5,dcc0 <__divdf3+0x118>
    dc3c:	7ff00713          	li	a4,2047
    dc40:	18e78c63          	beq	a5,a4,ddd8 <__divdf3+0x230>
    dc44:	00341413          	sll	s0,s0,0x3
    dc48:	01da5713          	srl	a4,s4,0x1d
    dc4c:	00876733          	or	a4,a4,s0
    dc50:	c0178793          	add	a5,a5,-1023
    dc54:	00800437          	lui	s0,0x800
    dc58:	40f989b3          	sub	s3,s3,a5
    dc5c:	00876433          	or	s0,a4,s0
    dc60:	003a1813          	sll	a6,s4,0x3
    dc64:	00000793          	li	a5,0
    dc68:	00f00713          	li	a4,15
    dc6c:	012aca33          	xor	s4,s5,s2
    dc70:	24976663          	bltu	a4,s1,debc <__divdf3+0x314>
    dc74:	00003697          	auipc	a3,0x3
    dc78:	dac68693          	add	a3,a3,-596 # 10a20 <__mprec_tens+0xc8>
    dc7c:	00249493          	sll	s1,s1,0x2
    dc80:	00d484b3          	add	s1,s1,a3
    dc84:	0004a703          	lw	a4,0(s1)
    dc88:	00d70733          	add	a4,a4,a3
    dc8c:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    dc90:	00a4eb33          	or	s6,s1,a0
    dc94:	1c0b1e63          	bnez	s6,de70 <__divdf3+0x2c8>
    dc98:	01495793          	srl	a5,s2,0x14
    dc9c:	00c91413          	sll	s0,s2,0xc
    dca0:	7ff7f793          	and	a5,a5,2047
    dca4:	00000b93          	li	s7,0
    dca8:	00800493          	li	s1,8
    dcac:	7ff00993          	li	s3,2047
    dcb0:	00200c13          	li	s8,2
    dcb4:	00c45413          	srl	s0,s0,0xc
    dcb8:	01f95913          	srl	s2,s2,0x1f
    dcbc:	f80790e3          	bnez	a5,dc3c <__divdf3+0x94>
    dcc0:	01446833          	or	a6,s0,s4
    dcc4:	1c080263          	beqz	a6,de88 <__divdf3+0x2e0>
    dcc8:	5c040663          	beqz	s0,e294 <__divdf3+0x6ec>
    dccc:	00040513          	mv	a0,s0
    dcd0:	250020ef          	jal	ff20 <__clzsi2>
    dcd4:	00050793          	mv	a5,a0
    dcd8:	ff550693          	add	a3,a0,-11
    dcdc:	01d00713          	li	a4,29
    dce0:	ff878813          	add	a6,a5,-8
    dce4:	40d70733          	sub	a4,a4,a3
    dce8:	01041433          	sll	s0,s0,a6
    dcec:	00ea5733          	srl	a4,s4,a4
    dcf0:	00876433          	or	s0,a4,s0
    dcf4:	010a1833          	sll	a6,s4,a6
    dcf8:	013787b3          	add	a5,a5,s3
    dcfc:	3f378993          	add	s3,a5,1011
    dd00:	00000793          	li	a5,0
    dd04:	f65ff06f          	j	dc68 <__divdf3+0xc0>
    dd08:	40f70733          	sub	a4,a4,a5
    dd0c:	03800693          	li	a3,56
    dd10:	60e6d063          	bge	a3,a4,e310 <__divdf3+0x768>
    dd14:	00000793          	li	a5,0
    dd18:	00000693          	li	a3,0
    dd1c:	00000713          	li	a4,0
    dd20:	04c12083          	lw	ra,76(sp)
    dd24:	04812403          	lw	s0,72(sp)
    dd28:	01479793          	sll	a5,a5,0x14
    dd2c:	00d7e7b3          	or	a5,a5,a3
    dd30:	01fa1693          	sll	a3,s4,0x1f
    dd34:	00d7e7b3          	or	a5,a5,a3
    dd38:	04412483          	lw	s1,68(sp)
    dd3c:	04012903          	lw	s2,64(sp)
    dd40:	03c12983          	lw	s3,60(sp)
    dd44:	03812a03          	lw	s4,56(sp)
    dd48:	03412a83          	lw	s5,52(sp)
    dd4c:	03012b03          	lw	s6,48(sp)
    dd50:	02c12b83          	lw	s7,44(sp)
    dd54:	02812c03          	lw	s8,40(sp)
    dd58:	00070513          	mv	a0,a4
    dd5c:	00078593          	mv	a1,a5
    dd60:	05010113          	add	sp,sp,80
    dd64:	00008067          	ret
    dd68:	7ff00793          	li	a5,2047
    dd6c:	00000693          	li	a3,0
    dd70:	00000713          	li	a4,0
    dd74:	fadff06f          	j	dd20 <__divdf3+0x178>
    dd78:	00000a13          	li	s4,0
    dd7c:	7ff00793          	li	a5,2047
    dd80:	000806b7          	lui	a3,0x80
    dd84:	00000713          	li	a4,0
    dd88:	f99ff06f          	j	dd20 <__divdf3+0x178>
    dd8c:	00a4eb33          	or	s6,s1,a0
    dd90:	100b0c63          	beqz	s6,dea8 <__divdf3+0x300>
    dd94:	52048463          	beqz	s1,e2bc <__divdf3+0x714>
    dd98:	00048513          	mv	a0,s1
    dd9c:	184020ef          	jal	ff20 <__clzsi2>
    dda0:	00050713          	mv	a4,a0
    dda4:	ff550793          	add	a5,a0,-11
    dda8:	01d00b13          	li	s6,29
    ddac:	ff870b93          	add	s7,a4,-8
    ddb0:	40fb0b33          	sub	s6,s6,a5
    ddb4:	017494b3          	sll	s1,s1,s7
    ddb8:	01645b33          	srl	s6,s0,s6
    ddbc:	009b6b33          	or	s6,s6,s1
    ddc0:	01741bb3          	sll	s7,s0,s7
    ddc4:	c0d00793          	li	a5,-1011
    ddc8:	40e789b3          	sub	s3,a5,a4
    ddcc:	00000493          	li	s1,0
    ddd0:	00000c13          	li	s8,0
    ddd4:	e51ff06f          	j	dc24 <__divdf3+0x7c>
    ddd8:	01446833          	or	a6,s0,s4
    dddc:	80198993          	add	s3,s3,-2047
    dde0:	0a081c63          	bnez	a6,de98 <__divdf3+0x2f0>
    dde4:	0024e493          	or	s1,s1,2
    dde8:	00000413          	li	s0,0
    ddec:	00200793          	li	a5,2
    ddf0:	e79ff06f          	j	dc68 <__divdf3+0xc0>
    ddf4:	000a8913          	mv	s2,s5
    ddf8:	000b0413          	mv	s0,s6
    ddfc:	000b8813          	mv	a6,s7
    de00:	00200793          	li	a5,2
    de04:	60fc0863          	beq	s8,a5,e414 <__divdf3+0x86c>
    de08:	00300793          	li	a5,3
    de0c:	f6fc06e3          	beq	s8,a5,dd78 <__divdf3+0x1d0>
    de10:	00100793          	li	a5,1
    de14:	00090a13          	mv	s4,s2
    de18:	eefc0ee3          	beq	s8,a5,dd14 <__divdf3+0x16c>
    de1c:	3ff98793          	add	a5,s3,1023
    de20:	3cf05263          	blez	a5,e1e4 <__divdf3+0x63c>
    de24:	00787713          	and	a4,a6,7
    de28:	5c071663          	bnez	a4,e3f4 <__divdf3+0x84c>
    de2c:	00741713          	sll	a4,s0,0x7
    de30:	00075a63          	bgez	a4,de44 <__divdf3+0x29c>
    de34:	ff0007b7          	lui	a5,0xff000
    de38:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    de3c:	00f47433          	and	s0,s0,a5
    de40:	40098793          	add	a5,s3,1024
    de44:	7fe00713          	li	a4,2046
    de48:	f2f740e3          	blt	a4,a5,dd68 <__divdf3+0x1c0>
    de4c:	00385813          	srl	a6,a6,0x3
    de50:	01d41713          	sll	a4,s0,0x1d
    de54:	00941693          	sll	a3,s0,0x9
    de58:	01076733          	or	a4,a4,a6
    de5c:	00c6d693          	srl	a3,a3,0xc
    de60:	7ff7f793          	and	a5,a5,2047
    de64:	ebdff06f          	j	dd20 <__divdf3+0x178>
    de68:	00078c13          	mv	s8,a5
    de6c:	f95ff06f          	j	de00 <__divdf3+0x258>
    de70:	00048b13          	mv	s6,s1
    de74:	00050b93          	mv	s7,a0
    de78:	00c00493          	li	s1,12
    de7c:	7ff00993          	li	s3,2047
    de80:	00300c13          	li	s8,3
    de84:	da1ff06f          	j	dc24 <__divdf3+0x7c>
    de88:	0014e493          	or	s1,s1,1
    de8c:	00000413          	li	s0,0
    de90:	00100793          	li	a5,1
    de94:	dd5ff06f          	j	dc68 <__divdf3+0xc0>
    de98:	0034e493          	or	s1,s1,3
    de9c:	000a0813          	mv	a6,s4
    dea0:	00300793          	li	a5,3
    dea4:	dc5ff06f          	j	dc68 <__divdf3+0xc0>
    dea8:	00000b93          	li	s7,0
    deac:	00400493          	li	s1,4
    deb0:	00000993          	li	s3,0
    deb4:	00100c13          	li	s8,1
    deb8:	d6dff06f          	j	dc24 <__divdf3+0x7c>
    debc:	03912223          	sw	s9,36(sp)
    dec0:	03a12023          	sw	s10,32(sp)
    dec4:	01b12e23          	sw	s11,28(sp)
    dec8:	3b646a63          	bltu	s0,s6,e27c <__divdf3+0x6d4>
    decc:	3a8b0663          	beq	s6,s0,e278 <__divdf3+0x6d0>
    ded0:	fff98993          	add	s3,s3,-1
    ded4:	000b8c13          	mv	s8,s7
    ded8:	000b0493          	mv	s1,s6
    dedc:	00000d13          	li	s10,0
    dee0:	01885c93          	srl	s9,a6,0x18
    dee4:	00841413          	sll	s0,s0,0x8
    dee8:	01045913          	srl	s2,s0,0x10
    deec:	008cecb3          	or	s9,s9,s0
    def0:	00090593          	mv	a1,s2
    def4:	00048513          	mv	a0,s1
    def8:	010c9b13          	sll	s6,s9,0x10
    defc:	00881a93          	sll	s5,a6,0x8
    df00:	010b5b13          	srl	s6,s6,0x10
    df04:	771010ef          	jal	fe74 <__hidden___udivsi3>
    df08:	00050593          	mv	a1,a0
    df0c:	00050413          	mv	s0,a0
    df10:	000b0513          	mv	a0,s6
    df14:	69d010ef          	jal	fdb0 <__mulsi3>
    df18:	00050793          	mv	a5,a0
    df1c:	00090593          	mv	a1,s2
    df20:	00048513          	mv	a0,s1
    df24:	00078493          	mv	s1,a5
    df28:	795010ef          	jal	febc <__umodsi3>
    df2c:	01051513          	sll	a0,a0,0x10
    df30:	010c5793          	srl	a5,s8,0x10
    df34:	00a7e7b3          	or	a5,a5,a0
    df38:	0097fa63          	bgeu	a5,s1,df4c <__divdf3+0x3a4>
    df3c:	00fc87b3          	add	a5,s9,a5
    df40:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    df44:	3b97fe63          	bgeu	a5,s9,e300 <__divdf3+0x758>
    df48:	00070413          	mv	s0,a4
    df4c:	409784b3          	sub	s1,a5,s1
    df50:	00090593          	mv	a1,s2
    df54:	00048513          	mv	a0,s1
    df58:	71d010ef          	jal	fe74 <__hidden___udivsi3>
    df5c:	00050593          	mv	a1,a0
    df60:	00050b93          	mv	s7,a0
    df64:	000b0513          	mv	a0,s6
    df68:	649010ef          	jal	fdb0 <__mulsi3>
    df6c:	00050793          	mv	a5,a0
    df70:	00090593          	mv	a1,s2
    df74:	00048513          	mv	a0,s1
    df78:	00078493          	mv	s1,a5
    df7c:	741010ef          	jal	febc <__umodsi3>
    df80:	010c1793          	sll	a5,s8,0x10
    df84:	01051513          	sll	a0,a0,0x10
    df88:	0107d793          	srl	a5,a5,0x10
    df8c:	00a7e7b3          	or	a5,a5,a0
    df90:	0097fa63          	bgeu	a5,s1,dfa4 <__divdf3+0x3fc>
    df94:	00fc87b3          	add	a5,s9,a5
    df98:	fffb8713          	add	a4,s7,-1
    df9c:	3597fa63          	bgeu	a5,s9,e2f0 <__divdf3+0x748>
    dfa0:	00070b93          	mv	s7,a4
    dfa4:	00010337          	lui	t1,0x10
    dfa8:	01041413          	sll	s0,s0,0x10
    dfac:	01746433          	or	s0,s0,s7
    dfb0:	fff30d93          	add	s11,t1,-1 # ffff <__fini_array_end+0x57>
    dfb4:	01b478b3          	and	a7,s0,s11
    dfb8:	01bafdb3          	and	s11,s5,s11
    dfbc:	40978bb3          	sub	s7,a5,s1
    dfc0:	010adc13          	srl	s8,s5,0x10
    dfc4:	01045793          	srl	a5,s0,0x10
    dfc8:	00088513          	mv	a0,a7
    dfcc:	000d8593          	mv	a1,s11
    dfd0:	5e1010ef          	jal	fdb0 <__mulsi3>
    dfd4:	00050813          	mv	a6,a0
    dfd8:	000c0593          	mv	a1,s8
    dfdc:	00088513          	mv	a0,a7
    dfe0:	5d1010ef          	jal	fdb0 <__mulsi3>
    dfe4:	00050893          	mv	a7,a0
    dfe8:	000d8593          	mv	a1,s11
    dfec:	00078513          	mv	a0,a5
    dff0:	5c1010ef          	jal	fdb0 <__mulsi3>
    dff4:	00050e13          	mv	t3,a0
    dff8:	000c0593          	mv	a1,s8
    dffc:	00078513          	mv	a0,a5
    e000:	5b1010ef          	jal	fdb0 <__mulsi3>
    e004:	01085793          	srl	a5,a6,0x10
    e008:	01c888b3          	add	a7,a7,t3
    e00c:	011787b3          	add	a5,a5,a7
    e010:	01c7f463          	bgeu	a5,t3,e018 <__divdf3+0x470>
    e014:	00650533          	add	a0,a0,t1
    e018:	00010637          	lui	a2,0x10
    e01c:	fff60613          	add	a2,a2,-1 # ffff <__fini_array_end+0x57>
    e020:	00c7f4b3          	and	s1,a5,a2
    e024:	0107d693          	srl	a3,a5,0x10
    e028:	01049493          	sll	s1,s1,0x10
    e02c:	00c87833          	and	a6,a6,a2
    e030:	00a687b3          	add	a5,a3,a0
    e034:	010484b3          	add	s1,s1,a6
    e038:	20fbea63          	bltu	s7,a5,e24c <__divdf3+0x6a4>
    e03c:	20fb8663          	beq	s7,a5,e248 <__divdf3+0x6a0>
    e040:	409d04b3          	sub	s1,s10,s1
    e044:	40fb8bb3          	sub	s7,s7,a5
    e048:	009d3d33          	sltu	s10,s10,s1
    e04c:	41ab8bb3          	sub	s7,s7,s10
    e050:	377c8a63          	beq	s9,s7,e3c4 <__divdf3+0x81c>
    e054:	00090593          	mv	a1,s2
    e058:	000b8513          	mv	a0,s7
    e05c:	619010ef          	jal	fe74 <__hidden___udivsi3>
    e060:	00050593          	mv	a1,a0
    e064:	00a12623          	sw	a0,12(sp)
    e068:	00050d13          	mv	s10,a0
    e06c:	000b0513          	mv	a0,s6
    e070:	541010ef          	jal	fdb0 <__mulsi3>
    e074:	00050793          	mv	a5,a0
    e078:	00090593          	mv	a1,s2
    e07c:	000b8513          	mv	a0,s7
    e080:	00078b93          	mv	s7,a5
    e084:	639010ef          	jal	febc <__umodsi3>
    e088:	01051513          	sll	a0,a0,0x10
    e08c:	0104d793          	srl	a5,s1,0x10
    e090:	00a7e7b3          	or	a5,a5,a0
    e094:	0377f063          	bgeu	a5,s7,e0b4 <__divdf3+0x50c>
    e098:	00fc87b3          	add	a5,s9,a5
    e09c:	fffd0693          	add	a3,s10,-1
    e0a0:	3797e263          	bltu	a5,s9,e404 <__divdf3+0x85c>
    e0a4:	3777f063          	bgeu	a5,s7,e404 <__divdf3+0x85c>
    e0a8:	ffed0713          	add	a4,s10,-2
    e0ac:	00e12623          	sw	a4,12(sp)
    e0b0:	019787b3          	add	a5,a5,s9
    e0b4:	41778bb3          	sub	s7,a5,s7
    e0b8:	00090593          	mv	a1,s2
    e0bc:	000b8513          	mv	a0,s7
    e0c0:	5b5010ef          	jal	fe74 <__hidden___udivsi3>
    e0c4:	00050593          	mv	a1,a0
    e0c8:	00050d13          	mv	s10,a0
    e0cc:	000b0513          	mv	a0,s6
    e0d0:	4e1010ef          	jal	fdb0 <__mulsi3>
    e0d4:	00050793          	mv	a5,a0
    e0d8:	00090593          	mv	a1,s2
    e0dc:	000b8513          	mv	a0,s7
    e0e0:	00078913          	mv	s2,a5
    e0e4:	01049493          	sll	s1,s1,0x10
    e0e8:	5d5010ef          	jal	febc <__umodsi3>
    e0ec:	01051513          	sll	a0,a0,0x10
    e0f0:	0104d493          	srl	s1,s1,0x10
    e0f4:	00a4e4b3          	or	s1,s1,a0
    e0f8:	0124fe63          	bgeu	s1,s2,e114 <__divdf3+0x56c>
    e0fc:	009c84b3          	add	s1,s9,s1
    e100:	fffd0793          	add	a5,s10,-1
    e104:	3194e463          	bltu	s1,s9,e40c <__divdf3+0x864>
    e108:	3124f263          	bgeu	s1,s2,e40c <__divdf3+0x864>
    e10c:	ffed0d13          	add	s10,s10,-2
    e110:	019484b3          	add	s1,s1,s9
    e114:	00c12783          	lw	a5,12(sp)
    e118:	412484b3          	sub	s1,s1,s2
    e11c:	000d8593          	mv	a1,s11
    e120:	01079813          	sll	a6,a5,0x10
    e124:	01a86833          	or	a6,a6,s10
    e128:	01081313          	sll	t1,a6,0x10
    e12c:	01035313          	srl	t1,t1,0x10
    e130:	01085793          	srl	a5,a6,0x10
    e134:	00030513          	mv	a0,t1
    e138:	479010ef          	jal	fdb0 <__mulsi3>
    e13c:	00050893          	mv	a7,a0
    e140:	000c0593          	mv	a1,s8
    e144:	00030513          	mv	a0,t1
    e148:	469010ef          	jal	fdb0 <__mulsi3>
    e14c:	00050313          	mv	t1,a0
    e150:	000d8593          	mv	a1,s11
    e154:	00078513          	mv	a0,a5
    e158:	459010ef          	jal	fdb0 <__mulsi3>
    e15c:	00050e13          	mv	t3,a0
    e160:	000c0593          	mv	a1,s8
    e164:	00078513          	mv	a0,a5
    e168:	449010ef          	jal	fdb0 <__mulsi3>
    e16c:	0108d793          	srl	a5,a7,0x10
    e170:	01c30333          	add	t1,t1,t3
    e174:	006787b3          	add	a5,a5,t1
    e178:	01c7f663          	bgeu	a5,t3,e184 <__divdf3+0x5dc>
    e17c:	00010737          	lui	a4,0x10
    e180:	00e50533          	add	a0,a0,a4
    e184:	000106b7          	lui	a3,0x10
    e188:	fff68693          	add	a3,a3,-1 # ffff <__fini_array_end+0x57>
    e18c:	0107d713          	srl	a4,a5,0x10
    e190:	00d7f7b3          	and	a5,a5,a3
    e194:	01079793          	sll	a5,a5,0x10
    e198:	00d8f8b3          	and	a7,a7,a3
    e19c:	00a70733          	add	a4,a4,a0
    e1a0:	011787b3          	add	a5,a5,a7
    e1a4:	02e4e063          	bltu	s1,a4,e1c4 <__divdf3+0x61c>
    e1a8:	00e48c63          	beq	s1,a4,e1c0 <__divdf3+0x618>
    e1ac:	02412c83          	lw	s9,36(sp)
    e1b0:	02012d03          	lw	s10,32(sp)
    e1b4:	01c12d83          	lw	s11,28(sp)
    e1b8:	00186813          	or	a6,a6,1
    e1bc:	c61ff06f          	j	de1c <__divdf3+0x274>
    e1c0:	1c078a63          	beqz	a5,e394 <__divdf3+0x7ec>
    e1c4:	009c84b3          	add	s1,s9,s1
    e1c8:	fff80613          	add	a2,a6,-1
    e1cc:	00048693          	mv	a3,s1
    e1d0:	1b94ec63          	bltu	s1,s9,e388 <__divdf3+0x7e0>
    e1d4:	24e4ea63          	bltu	s1,a4,e428 <__divdf3+0x880>
    e1d8:	26e48863          	beq	s1,a4,e448 <__divdf3+0x8a0>
    e1dc:	00060813          	mv	a6,a2
    e1e0:	fcdff06f          	j	e1ac <__divdf3+0x604>
    e1e4:	00100713          	li	a4,1
    e1e8:	b20790e3          	bnez	a5,dd08 <__divdf3+0x160>
    e1ec:	41e98793          	add	a5,s3,1054
    e1f0:	00f816b3          	sll	a3,a6,a5
    e1f4:	00d036b3          	snez	a3,a3
    e1f8:	00f417b3          	sll	a5,s0,a5
    e1fc:	00f6e7b3          	or	a5,a3,a5
    e200:	00e85833          	srl	a6,a6,a4
    e204:	00f86833          	or	a6,a6,a5
    e208:	00787793          	and	a5,a6,7
    e20c:	00e45433          	srl	s0,s0,a4
    e210:	02078063          	beqz	a5,e230 <__divdf3+0x688>
    e214:	00f87793          	and	a5,a6,15
    e218:	00400713          	li	a4,4
    e21c:	00e78a63          	beq	a5,a4,e230 <__divdf3+0x688>
    e220:	00480793          	add	a5,a6,4
    e224:	0107b833          	sltu	a6,a5,a6
    e228:	01040433          	add	s0,s0,a6
    e22c:	00078813          	mv	a6,a5
    e230:	00841613          	sll	a2,s0,0x8
    e234:	00100793          	li	a5,1
    e238:	00000693          	li	a3,0
    e23c:	00000713          	li	a4,0
    e240:	ae0640e3          	bltz	a2,dd20 <__divdf3+0x178>
    e244:	1280006f          	j	e36c <__divdf3+0x7c4>
    e248:	de9d7ce3          	bgeu	s10,s1,e040 <__divdf3+0x498>
    e24c:	015d06b3          	add	a3,s10,s5
    e250:	01a6b633          	sltu	a2,a3,s10
    e254:	019605b3          	add	a1,a2,s9
    e258:	00bb8bb3          	add	s7,s7,a1
    e25c:	00068d13          	mv	s10,a3
    e260:	fff40593          	add	a1,s0,-1
    e264:	077cfe63          	bgeu	s9,s7,e2e0 <__divdf3+0x738>
    e268:	14fbe063          	bltu	s7,a5,e3a8 <__divdf3+0x800>
    e26c:	13778c63          	beq	a5,s7,e3a4 <__divdf3+0x7fc>
    e270:	00058413          	mv	s0,a1
    e274:	dcdff06f          	j	e040 <__divdf3+0x498>
    e278:	c50bece3          	bltu	s7,a6,ded0 <__divdf3+0x328>
    e27c:	01fb1c13          	sll	s8,s6,0x1f
    e280:	001bd713          	srl	a4,s7,0x1
    e284:	001b5493          	srl	s1,s6,0x1
    e288:	00ec6c33          	or	s8,s8,a4
    e28c:	01fb9d13          	sll	s10,s7,0x1f
    e290:	c51ff06f          	j	dee0 <__divdf3+0x338>
    e294:	000a0513          	mv	a0,s4
    e298:	489010ef          	jal	ff20 <__clzsi2>
    e29c:	01550693          	add	a3,a0,21
    e2a0:	01c00713          	li	a4,28
    e2a4:	02050793          	add	a5,a0,32
    e2a8:	a2d75ae3          	bge	a4,a3,dcdc <__divdf3+0x134>
    e2ac:	ff850513          	add	a0,a0,-8
    e2b0:	00000813          	li	a6,0
    e2b4:	00aa1433          	sll	s0,s4,a0
    e2b8:	a41ff06f          	j	dcf8 <__divdf3+0x150>
    e2bc:	465010ef          	jal	ff20 <__clzsi2>
    e2c0:	01550793          	add	a5,a0,21
    e2c4:	01c00693          	li	a3,28
    e2c8:	02050713          	add	a4,a0,32
    e2cc:	acf6dee3          	bge	a3,a5,dda8 <__divdf3+0x200>
    e2d0:	ff850493          	add	s1,a0,-8
    e2d4:	00941b33          	sll	s6,s0,s1
    e2d8:	00000b93          	li	s7,0
    e2dc:	ae9ff06f          	j	ddc4 <__divdf3+0x21c>
    e2e0:	f97c98e3          	bne	s9,s7,e270 <__divdf3+0x6c8>
    e2e4:	f80602e3          	beqz	a2,e268 <__divdf3+0x6c0>
    e2e8:	00058413          	mv	s0,a1
    e2ec:	d55ff06f          	j	e040 <__divdf3+0x498>
    e2f0:	ca97f8e3          	bgeu	a5,s1,dfa0 <__divdf3+0x3f8>
    e2f4:	ffeb8b93          	add	s7,s7,-2
    e2f8:	019787b3          	add	a5,a5,s9
    e2fc:	ca9ff06f          	j	dfa4 <__divdf3+0x3fc>
    e300:	c497f4e3          	bgeu	a5,s1,df48 <__divdf3+0x3a0>
    e304:	ffe40413          	add	s0,s0,-2
    e308:	019787b3          	add	a5,a5,s9
    e30c:	c41ff06f          	j	df4c <__divdf3+0x3a4>
    e310:	01f00693          	li	a3,31
    e314:	ece6dce3          	bge	a3,a4,e1ec <__divdf3+0x644>
    e318:	fe100693          	li	a3,-31
    e31c:	40f686b3          	sub	a3,a3,a5
    e320:	02000793          	li	a5,32
    e324:	00d456b3          	srl	a3,s0,a3
    e328:	00f70863          	beq	a4,a5,e338 <__divdf3+0x790>
    e32c:	43e98793          	add	a5,s3,1086
    e330:	00f417b3          	sll	a5,s0,a5
    e334:	00f86833          	or	a6,a6,a5
    e338:	01003833          	snez	a6,a6
    e33c:	00d86833          	or	a6,a6,a3
    e340:	00787713          	and	a4,a6,7
    e344:	00000693          	li	a3,0
    e348:	02070863          	beqz	a4,e378 <__divdf3+0x7d0>
    e34c:	00f87793          	and	a5,a6,15
    e350:	00400713          	li	a4,4
    e354:	00000413          	li	s0,0
    e358:	00e78a63          	beq	a5,a4,e36c <__divdf3+0x7c4>
    e35c:	00480793          	add	a5,a6,4
    e360:	0107b833          	sltu	a6,a5,a6
    e364:	01003433          	snez	s0,a6
    e368:	00078813          	mv	a6,a5
    e36c:	00941693          	sll	a3,s0,0x9
    e370:	01d41713          	sll	a4,s0,0x1d
    e374:	00c6d693          	srl	a3,a3,0xc
    e378:	00385813          	srl	a6,a6,0x3
    e37c:	00e86733          	or	a4,a6,a4
    e380:	00000793          	li	a5,0
    e384:	99dff06f          	j	dd20 <__divdf3+0x178>
    e388:	00060813          	mv	a6,a2
    e38c:	e2e690e3          	bne	a3,a4,e1ac <__divdf3+0x604>
    e390:	e1579ee3          	bne	a5,s5,e1ac <__divdf3+0x604>
    e394:	02412c83          	lw	s9,36(sp)
    e398:	02012d03          	lw	s10,32(sp)
    e39c:	01c12d83          	lw	s11,28(sp)
    e3a0:	a7dff06f          	j	de1c <__divdf3+0x274>
    e3a4:	ec96f6e3          	bgeu	a3,s1,e270 <__divdf3+0x6c8>
    e3a8:	00da86b3          	add	a3,s5,a3
    e3ac:	0156b633          	sltu	a2,a3,s5
    e3b0:	01960633          	add	a2,a2,s9
    e3b4:	ffe40413          	add	s0,s0,-2
    e3b8:	00068d13          	mv	s10,a3
    e3bc:	00cb8bb3          	add	s7,s7,a2
    e3c0:	c81ff06f          	j	e040 <__divdf3+0x498>
    e3c4:	c0200713          	li	a4,-1022
    e3c8:	02412c83          	lw	s9,36(sp)
    e3cc:	02012d03          	lw	s10,32(sp)
    e3d0:	01c12d83          	lw	s11,28(sp)
    e3d4:	3ff98793          	add	a5,s3,1023
    e3d8:	fff00813          	li	a6,-1
    e3dc:	e0e9c4e3          	blt	s3,a4,e1e4 <__divdf3+0x63c>
    e3e0:	00480713          	add	a4,a6,4
    e3e4:	01073833          	sltu	a6,a4,a6
    e3e8:	01040433          	add	s0,s0,a6
    e3ec:	00070813          	mv	a6,a4
    e3f0:	a3dff06f          	j	de2c <__divdf3+0x284>
    e3f4:	00f87713          	and	a4,a6,15
    e3f8:	00400693          	li	a3,4
    e3fc:	a2d708e3          	beq	a4,a3,de2c <__divdf3+0x284>
    e400:	fe1ff06f          	j	e3e0 <__divdf3+0x838>
    e404:	00d12623          	sw	a3,12(sp)
    e408:	cadff06f          	j	e0b4 <__divdf3+0x50c>
    e40c:	00078d13          	mv	s10,a5
    e410:	d05ff06f          	j	e114 <__divdf3+0x56c>
    e414:	00090a13          	mv	s4,s2
    e418:	7ff00793          	li	a5,2047
    e41c:	00000693          	li	a3,0
    e420:	00000713          	li	a4,0
    e424:	8fdff06f          	j	dd20 <__divdf3+0x178>
    e428:	001a9613          	sll	a2,s5,0x1
    e42c:	015636b3          	sltu	a3,a2,s5
    e430:	019686b3          	add	a3,a3,s9
    e434:	00d486b3          	add	a3,s1,a3
    e438:	ffe80813          	add	a6,a6,-2
    e43c:	00060a93          	mv	s5,a2
    e440:	f4e688e3          	beq	a3,a4,e390 <__divdf3+0x7e8>
    e444:	d69ff06f          	j	e1ac <__divdf3+0x604>
    e448:	fefae0e3          	bltu	s5,a5,e428 <__divdf3+0x880>
    e44c:	00060813          	mv	a6,a2
    e450:	f41ff06f          	j	e390 <__divdf3+0x7e8>

0000e454 <__eqdf2>:
    e454:	0145d713          	srl	a4,a1,0x14
    e458:	001007b7          	lui	a5,0x100
    e45c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e460:	0146d813          	srl	a6,a3,0x14
    e464:	7ff77713          	and	a4,a4,2047
    e468:	7ff00313          	li	t1,2047
    e46c:	00b7fe33          	and	t3,a5,a1
    e470:	00050893          	mv	a7,a0
    e474:	00d7f7b3          	and	a5,a5,a3
    e478:	01f5d593          	srl	a1,a1,0x1f
    e47c:	7ff87813          	and	a6,a6,2047
    e480:	01f6d693          	srl	a3,a3,0x1f
    e484:	00100513          	li	a0,1
    e488:	00670c63          	beq	a4,t1,e4a0 <__eqdf2+0x4c>
    e48c:	00680863          	beq	a6,t1,e49c <__eqdf2+0x48>
    e490:	01071463          	bne	a4,a6,e498 <__eqdf2+0x44>
    e494:	02fe0663          	beq	t3,a5,e4c0 <__eqdf2+0x6c>
    e498:	00008067          	ret
    e49c:	00008067          	ret
    e4a0:	fee81ce3          	bne	a6,a4,e498 <__eqdf2+0x44>
    e4a4:	00fe67b3          	or	a5,t3,a5
    e4a8:	00c7e7b3          	or	a5,a5,a2
    e4ac:	0117e7b3          	or	a5,a5,a7
    e4b0:	fe0794e3          	bnez	a5,e498 <__eqdf2+0x44>
    e4b4:	40d585b3          	sub	a1,a1,a3
    e4b8:	00b03533          	snez	a0,a1
    e4bc:	00008067          	ret
    e4c0:	fcc89ce3          	bne	a7,a2,e498 <__eqdf2+0x44>
    e4c4:	00d58a63          	beq	a1,a3,e4d8 <__eqdf2+0x84>
    e4c8:	fc0718e3          	bnez	a4,e498 <__eqdf2+0x44>
    e4cc:	011e6e33          	or	t3,t3,a7
    e4d0:	01c03533          	snez	a0,t3
    e4d4:	00008067          	ret
    e4d8:	00000513          	li	a0,0
    e4dc:	00008067          	ret

0000e4e0 <__gedf2>:
    e4e0:	0145d893          	srl	a7,a1,0x14
    e4e4:	001007b7          	lui	a5,0x100
    e4e8:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e4ec:	0146d713          	srl	a4,a3,0x14
    e4f0:	7ff8f893          	and	a7,a7,2047
    e4f4:	7ff00e13          	li	t3,2047
    e4f8:	00b7f333          	and	t1,a5,a1
    e4fc:	00050813          	mv	a6,a0
    e500:	00050e93          	mv	t4,a0
    e504:	00d7f7b3          	and	a5,a5,a3
    e508:	01f5d593          	srl	a1,a1,0x1f
    e50c:	00060f13          	mv	t5,a2
    e510:	7ff77513          	and	a0,a4,2047
    e514:	01f6d693          	srl	a3,a3,0x1f
    e518:	05c88863          	beq	a7,t3,e568 <__gedf2+0x88>
    e51c:	03c50463          	beq	a0,t3,e544 <__gedf2+0x64>
    e520:	06089a63          	bnez	a7,e594 <__gedf2+0xb4>
    e524:	01036833          	or	a6,t1,a6
    e528:	06051063          	bnez	a0,e588 <__gedf2+0xa8>
    e52c:	00c7e633          	or	a2,a5,a2
    e530:	08060c63          	beqz	a2,e5c8 <__gedf2+0xe8>
    e534:	0a081263          	bnez	a6,e5d8 <__gedf2+0xf8>
    e538:	00100513          	li	a0,1
    e53c:	08068263          	beqz	a3,e5c0 <__gedf2+0xe0>
    e540:	00008067          	ret
    e544:	00c7e633          	or	a2,a5,a2
    e548:	08061463          	bnez	a2,e5d0 <__gedf2+0xf0>
    e54c:	00089663          	bnez	a7,e558 <__gedf2+0x78>
    e550:	01036333          	or	t1,t1,a6
    e554:	fe0302e3          	beqz	t1,e538 <__gedf2+0x58>
    e558:	06d58063          	beq	a1,a3,e5b8 <__gedf2+0xd8>
    e55c:	06059263          	bnez	a1,e5c0 <__gedf2+0xe0>
    e560:	00100513          	li	a0,1
    e564:	00008067          	ret
    e568:	01036333          	or	t1,t1,a6
    e56c:	06031263          	bnez	t1,e5d0 <__gedf2+0xf0>
    e570:	ff1516e3          	bne	a0,a7,e55c <__gedf2+0x7c>
    e574:	00c7e7b3          	or	a5,a5,a2
    e578:	04079c63          	bnez	a5,e5d0 <__gedf2+0xf0>
    e57c:	fed590e3          	bne	a1,a3,e55c <__gedf2+0x7c>
    e580:	00000513          	li	a0,0
    e584:	00008067          	ret
    e588:	fa0808e3          	beqz	a6,e538 <__gedf2+0x58>
    e58c:	fcd598e3          	bne	a1,a3,e55c <__gedf2+0x7c>
    e590:	0280006f          	j	e5b8 <__gedf2+0xd8>
    e594:	fc0504e3          	beqz	a0,e55c <__gedf2+0x7c>
    e598:	fcd592e3          	bne	a1,a3,e55c <__gedf2+0x7c>
    e59c:	fd1540e3          	blt	a0,a7,e55c <__gedf2+0x7c>
    e5a0:	00a8cc63          	blt	a7,a0,e5b8 <__gedf2+0xd8>
    e5a4:	fa67ece3          	bltu	a5,t1,e55c <__gedf2+0x7c>
    e5a8:	00f31863          	bne	t1,a5,e5b8 <__gedf2+0xd8>
    e5ac:	fbdf68e3          	bltu	t5,t4,e55c <__gedf2+0x7c>
    e5b0:	00000513          	li	a0,0
    e5b4:	f9eef6e3          	bgeu	t4,t5,e540 <__gedf2+0x60>
    e5b8:	00100513          	li	a0,1
    e5bc:	f80592e3          	bnez	a1,e540 <__gedf2+0x60>
    e5c0:	fff00513          	li	a0,-1
    e5c4:	00008067          	ret
    e5c8:	f8081ae3          	bnez	a6,e55c <__gedf2+0x7c>
    e5cc:	00008067          	ret
    e5d0:	ffe00513          	li	a0,-2
    e5d4:	00008067          	ret
    e5d8:	fcd586e3          	beq	a1,a3,e5a4 <__gedf2+0xc4>
    e5dc:	f81ff06f          	j	e55c <__gedf2+0x7c>

0000e5e0 <__ledf2>:
    e5e0:	0145d893          	srl	a7,a1,0x14
    e5e4:	001007b7          	lui	a5,0x100
    e5e8:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e5ec:	0146d713          	srl	a4,a3,0x14
    e5f0:	7ff8f893          	and	a7,a7,2047
    e5f4:	7ff00313          	li	t1,2047
    e5f8:	00b7fe33          	and	t3,a5,a1
    e5fc:	00050813          	mv	a6,a0
    e600:	00050e93          	mv	t4,a0
    e604:	00d7f7b3          	and	a5,a5,a3
    e608:	01f5d593          	srl	a1,a1,0x1f
    e60c:	00060f13          	mv	t5,a2
    e610:	7ff77513          	and	a0,a4,2047
    e614:	01f6d693          	srl	a3,a3,0x1f
    e618:	04688a63          	beq	a7,t1,e66c <__ledf2+0x8c>
    e61c:	02650463          	beq	a0,t1,e644 <__ledf2+0x64>
    e620:	06089863          	bnez	a7,e690 <__ledf2+0xb0>
    e624:	010e6833          	or	a6,t3,a6
    e628:	08051e63          	bnez	a0,e6c4 <__ledf2+0xe4>
    e62c:	00c7e633          	or	a2,a5,a2
    e630:	0a060463          	beqz	a2,e6d8 <__ledf2+0xf8>
    e634:	0a081663          	bnez	a6,e6e0 <__ledf2+0x100>
    e638:	00100513          	li	a0,1
    e63c:	08068063          	beqz	a3,e6bc <__ledf2+0xdc>
    e640:	00008067          	ret
    e644:	00c7e633          	or	a2,a5,a2
    e648:	00200513          	li	a0,2
    e64c:	fe061ae3          	bnez	a2,e640 <__ledf2+0x60>
    e650:	00089663          	bnez	a7,e65c <__ledf2+0x7c>
    e654:	010e6e33          	or	t3,t3,a6
    e658:	fe0e00e3          	beqz	t3,e638 <__ledf2+0x58>
    e65c:	04d58c63          	beq	a1,a3,e6b4 <__ledf2+0xd4>
    e660:	04059e63          	bnez	a1,e6bc <__ledf2+0xdc>
    e664:	00100513          	li	a0,1
    e668:	00008067          	ret
    e66c:	010e6e33          	or	t3,t3,a6
    e670:	060e1063          	bnez	t3,e6d0 <__ledf2+0xf0>
    e674:	ff1516e3          	bne	a0,a7,e660 <__ledf2+0x80>
    e678:	00c7e7b3          	or	a5,a5,a2
    e67c:	00200513          	li	a0,2
    e680:	fc0790e3          	bnez	a5,e640 <__ledf2+0x60>
    e684:	fcd59ee3          	bne	a1,a3,e660 <__ledf2+0x80>
    e688:	00000513          	li	a0,0
    e68c:	00008067          	ret
    e690:	fc0508e3          	beqz	a0,e660 <__ledf2+0x80>
    e694:	fcd596e3          	bne	a1,a3,e660 <__ledf2+0x80>
    e698:	fd1544e3          	blt	a0,a7,e660 <__ledf2+0x80>
    e69c:	00a8cc63          	blt	a7,a0,e6b4 <__ledf2+0xd4>
    e6a0:	fdc7e0e3          	bltu	a5,t3,e660 <__ledf2+0x80>
    e6a4:	00fe1863          	bne	t3,a5,e6b4 <__ledf2+0xd4>
    e6a8:	fbdf6ce3          	bltu	t5,t4,e660 <__ledf2+0x80>
    e6ac:	00000513          	li	a0,0
    e6b0:	f9eef8e3          	bgeu	t4,t5,e640 <__ledf2+0x60>
    e6b4:	00100513          	li	a0,1
    e6b8:	f80594e3          	bnez	a1,e640 <__ledf2+0x60>
    e6bc:	fff00513          	li	a0,-1
    e6c0:	00008067          	ret
    e6c4:	f6080ae3          	beqz	a6,e638 <__ledf2+0x58>
    e6c8:	f8d59ce3          	bne	a1,a3,e660 <__ledf2+0x80>
    e6cc:	fe9ff06f          	j	e6b4 <__ledf2+0xd4>
    e6d0:	00200513          	li	a0,2
    e6d4:	00008067          	ret
    e6d8:	f80814e3          	bnez	a6,e660 <__ledf2+0x80>
    e6dc:	00008067          	ret
    e6e0:	fcd580e3          	beq	a1,a3,e6a0 <__ledf2+0xc0>
    e6e4:	f7dff06f          	j	e660 <__ledf2+0x80>

0000e6e8 <__muldf3>:
    e6e8:	fd010113          	add	sp,sp,-48
    e6ec:	0145d793          	srl	a5,a1,0x14
    e6f0:	02812423          	sw	s0,40(sp)
    e6f4:	02912223          	sw	s1,36(sp)
    e6f8:	03212023          	sw	s2,32(sp)
    e6fc:	01312e23          	sw	s3,28(sp)
    e700:	01512a23          	sw	s5,20(sp)
    e704:	00c59493          	sll	s1,a1,0xc
    e708:	02112623          	sw	ra,44(sp)
    e70c:	01412c23          	sw	s4,24(sp)
    e710:	01612823          	sw	s6,16(sp)
    e714:	01712623          	sw	s7,12(sp)
    e718:	01812423          	sw	s8,8(sp)
    e71c:	7ff7f793          	and	a5,a5,2047
    e720:	00050413          	mv	s0,a0
    e724:	00060a93          	mv	s5,a2
    e728:	00068993          	mv	s3,a3
    e72c:	00c4d493          	srl	s1,s1,0xc
    e730:	01f5d913          	srl	s2,a1,0x1f
    e734:	4e078063          	beqz	a5,ec14 <__muldf3+0x52c>
    e738:	7ff00713          	li	a4,2047
    e73c:	0ae78663          	beq	a5,a4,e7e8 <__muldf3+0x100>
    e740:	00349693          	sll	a3,s1,0x3
    e744:	01d55713          	srl	a4,a0,0x1d
    e748:	00d76733          	or	a4,a4,a3
    e74c:	008006b7          	lui	a3,0x800
    e750:	00d764b3          	or	s1,a4,a3
    e754:	00351a13          	sll	s4,a0,0x3
    e758:	c0178c13          	add	s8,a5,-1023
    e75c:	00000b13          	li	s6,0
    e760:	00000b93          	li	s7,0
    e764:	0149d793          	srl	a5,s3,0x14
    e768:	00c99713          	sll	a4,s3,0xc
    e76c:	7ff7f793          	and	a5,a5,2047
    e770:	000a8e13          	mv	t3,s5
    e774:	00c75413          	srl	s0,a4,0xc
    e778:	01f9d993          	srl	s3,s3,0x1f
    e77c:	0a078063          	beqz	a5,e81c <__muldf3+0x134>
    e780:	7ff00713          	li	a4,2047
    e784:	14e78e63          	beq	a5,a4,e8e0 <__muldf3+0x1f8>
    e788:	00341713          	sll	a4,s0,0x3
    e78c:	01dad693          	srl	a3,s5,0x1d
    e790:	00e6e6b3          	or	a3,a3,a4
    e794:	c0178793          	add	a5,a5,-1023
    e798:	00800737          	lui	a4,0x800
    e79c:	00e6e433          	or	s0,a3,a4
    e7a0:	003a9e13          	sll	t3,s5,0x3
    e7a4:	01878333          	add	t1,a5,s8
    e7a8:	00000693          	li	a3,0
    e7ac:	00a00793          	li	a5,10
    e7b0:	00130893          	add	a7,t1,1
    e7b4:	0b67cc63          	blt	a5,s6,e86c <__muldf3+0x184>
    e7b8:	013945b3          	xor	a1,s2,s3
    e7bc:	00200793          	li	a5,2
    e7c0:	00058813          	mv	a6,a1
    e7c4:	1567c663          	blt	a5,s6,e910 <__muldf3+0x228>
    e7c8:	fffb0b13          	add	s6,s6,-1
    e7cc:	00100713          	li	a4,1
    e7d0:	17676063          	bltu	a4,s6,e930 <__muldf3+0x248>
    e7d4:	48f68663          	beq	a3,a5,ec60 <__muldf3+0x578>
    e7d8:	00040493          	mv	s1,s0
    e7dc:	000e0a13          	mv	s4,t3
    e7e0:	00068b93          	mv	s7,a3
    e7e4:	09c0006f          	j	e880 <__muldf3+0x198>
    e7e8:	00a4ea33          	or	s4,s1,a0
    e7ec:	480a1463          	bnez	s4,ec74 <__muldf3+0x58c>
    e7f0:	0149d793          	srl	a5,s3,0x14
    e7f4:	00c99713          	sll	a4,s3,0xc
    e7f8:	7ff7f793          	and	a5,a5,2047
    e7fc:	00000493          	li	s1,0
    e800:	00800b13          	li	s6,8
    e804:	7ff00c13          	li	s8,2047
    e808:	00200b93          	li	s7,2
    e80c:	000a8e13          	mv	t3,s5
    e810:	00c75413          	srl	s0,a4,0xc
    e814:	01f9d993          	srl	s3,s3,0x1f
    e818:	f60794e3          	bnez	a5,e780 <__muldf3+0x98>
    e81c:	015467b3          	or	a5,s0,s5
    e820:	46078e63          	beqz	a5,ec9c <__muldf3+0x5b4>
    e824:	54040c63          	beqz	s0,ed7c <__muldf3+0x694>
    e828:	00040513          	mv	a0,s0
    e82c:	6f4010ef          	jal	ff20 <__clzsi2>
    e830:	00050313          	mv	t1,a0
    e834:	ff550713          	add	a4,a0,-11
    e838:	01d00793          	li	a5,29
    e83c:	ff830e13          	add	t3,t1,-8
    e840:	40e787b3          	sub	a5,a5,a4
    e844:	00fad7b3          	srl	a5,s5,a5
    e848:	01c41733          	sll	a4,s0,t3
    e84c:	00e7e433          	or	s0,a5,a4
    e850:	01ca9e33          	sll	t3,s5,t3
    e854:	406c0333          	sub	t1,s8,t1
    e858:	c0d30313          	add	t1,t1,-1011
    e85c:	00a00793          	li	a5,10
    e860:	00000693          	li	a3,0
    e864:	00130893          	add	a7,t1,1
    e868:	f567d8e3          	bge	a5,s6,e7b8 <__muldf3+0xd0>
    e86c:	00090593          	mv	a1,s2
    e870:	00200793          	li	a5,2
    e874:	3efb8663          	beq	s7,a5,ec60 <__muldf3+0x578>
    e878:	00300793          	li	a5,3
    e87c:	54fb8863          	beq	s7,a5,edcc <__muldf3+0x6e4>
    e880:	00100793          	li	a5,1
    e884:	00058813          	mv	a6,a1
    e888:	52fb9663          	bne	s7,a5,edb4 <__muldf3+0x6cc>
    e88c:	00000793          	li	a5,0
    e890:	00000693          	li	a3,0
    e894:	00000713          	li	a4,0
    e898:	02c12083          	lw	ra,44(sp)
    e89c:	02812403          	lw	s0,40(sp)
    e8a0:	01479793          	sll	a5,a5,0x14
    e8a4:	00d7e7b3          	or	a5,a5,a3
    e8a8:	01f81813          	sll	a6,a6,0x1f
    e8ac:	0107e7b3          	or	a5,a5,a6
    e8b0:	02412483          	lw	s1,36(sp)
    e8b4:	02012903          	lw	s2,32(sp)
    e8b8:	01c12983          	lw	s3,28(sp)
    e8bc:	01812a03          	lw	s4,24(sp)
    e8c0:	01412a83          	lw	s5,20(sp)
    e8c4:	01012b03          	lw	s6,16(sp)
    e8c8:	00c12b83          	lw	s7,12(sp)
    e8cc:	00812c03          	lw	s8,8(sp)
    e8d0:	00070513          	mv	a0,a4
    e8d4:	00078593          	mv	a1,a5
    e8d8:	03010113          	add	sp,sp,48
    e8dc:	00008067          	ret
    e8e0:	01546733          	or	a4,s0,s5
    e8e4:	7ffc0313          	add	t1,s8,2047
    e8e8:	3c070663          	beqz	a4,ecb4 <__muldf3+0x5cc>
    e8ec:	00001737          	lui	a4,0x1
    e8f0:	01394833          	xor	a6,s2,s3
    e8f4:	80070713          	add	a4,a4,-2048 # 800 <conv_cfu.constprop.0+0x3cc>
    e8f8:	003b6b13          	or	s6,s6,3
    e8fc:	00a00693          	li	a3,10
    e900:	00080593          	mv	a1,a6
    e904:	00ec08b3          	add	a7,s8,a4
    e908:	4366cc63          	blt	a3,s6,ed40 <__muldf3+0x658>
    e90c:	00300693          	li	a3,3
    e910:	00100613          	li	a2,1
    e914:	01661633          	sll	a2,a2,s6
    e918:	53067713          	and	a4,a2,1328
    e91c:	f4071ae3          	bnez	a4,e870 <__muldf3+0x188>
    e920:	24067793          	and	a5,a2,576
    e924:	48079063          	bnez	a5,eda4 <__muldf3+0x6bc>
    e928:	08867613          	and	a2,a2,136
    e92c:	38061e63          	bnez	a2,ecc8 <__muldf3+0x5e0>
    e930:	00010fb7          	lui	t6,0x10
    e934:	ffff8293          	add	t0,t6,-1 # ffff <__fini_array_end+0x57>
    e938:	005a7f33          	and	t5,s4,t0
    e93c:	005e72b3          	and	t0,t3,t0
    e940:	010a5a13          	srl	s4,s4,0x10
    e944:	010e5e13          	srl	t3,t3,0x10
    e948:	000f0513          	mv	a0,t5
    e94c:	00028593          	mv	a1,t0
    e950:	460010ef          	jal	fdb0 <__mulsi3>
    e954:	00050713          	mv	a4,a0
    e958:	000e0593          	mv	a1,t3
    e95c:	000f0513          	mv	a0,t5
    e960:	450010ef          	jal	fdb0 <__mulsi3>
    e964:	00050793          	mv	a5,a0
    e968:	00028593          	mv	a1,t0
    e96c:	000a0513          	mv	a0,s4
    e970:	440010ef          	jal	fdb0 <__mulsi3>
    e974:	00050e93          	mv	t4,a0
    e978:	000e0593          	mv	a1,t3
    e97c:	000a0513          	mv	a0,s4
    e980:	430010ef          	jal	fdb0 <__mulsi3>
    e984:	01d786b3          	add	a3,a5,t4
    e988:	01075393          	srl	t2,a4,0x10
    e98c:	00d383b3          	add	t2,t2,a3
    e990:	00050793          	mv	a5,a0
    e994:	01d3f463          	bgeu	t2,t4,e99c <__muldf3+0x2b4>
    e998:	01f507b3          	add	a5,a0,t6
    e99c:	000109b7          	lui	s3,0x10
    e9a0:	fff98913          	add	s2,s3,-1 # ffff <__fini_array_end+0x57>
    e9a4:	0123feb3          	and	t4,t2,s2
    e9a8:	01277733          	and	a4,a4,s2
    e9ac:	010e9e93          	sll	t4,t4,0x10
    e9b0:	01247933          	and	s2,s0,s2
    e9b4:	0103d393          	srl	t2,t2,0x10
    e9b8:	00ee8eb3          	add	t4,t4,a4
    e9bc:	01045413          	srl	s0,s0,0x10
    e9c0:	000f0513          	mv	a0,t5
    e9c4:	00090593          	mv	a1,s2
    e9c8:	3e8010ef          	jal	fdb0 <__mulsi3>
    e9cc:	00050f93          	mv	t6,a0
    e9d0:	00040593          	mv	a1,s0
    e9d4:	000f0513          	mv	a0,t5
    e9d8:	3d8010ef          	jal	fdb0 <__mulsi3>
    e9dc:	00050713          	mv	a4,a0
    e9e0:	00090593          	mv	a1,s2
    e9e4:	000a0513          	mv	a0,s4
    e9e8:	3c8010ef          	jal	fdb0 <__mulsi3>
    e9ec:	00050f13          	mv	t5,a0
    e9f0:	00040593          	mv	a1,s0
    e9f4:	000a0513          	mv	a0,s4
    e9f8:	3b8010ef          	jal	fdb0 <__mulsi3>
    e9fc:	010fd693          	srl	a3,t6,0x10
    ea00:	01e70733          	add	a4,a4,t5
    ea04:	00e686b3          	add	a3,a3,a4
    ea08:	01e6f463          	bgeu	a3,t5,ea10 <__muldf3+0x328>
    ea0c:	01350533          	add	a0,a0,s3
    ea10:	00010a37          	lui	s4,0x10
    ea14:	fffa0f13          	add	t5,s4,-1 # ffff <__fini_array_end+0x57>
    ea18:	01e6f733          	and	a4,a3,t5
    ea1c:	01efffb3          	and	t6,t6,t5
    ea20:	01071713          	sll	a4,a4,0x10
    ea24:	01f70733          	add	a4,a4,t6
    ea28:	01e4ff33          	and	t5,s1,t5
    ea2c:	0106d693          	srl	a3,a3,0x10
    ea30:	00a68fb3          	add	t6,a3,a0
    ea34:	00e383b3          	add	t2,t2,a4
    ea38:	0104d493          	srl	s1,s1,0x10
    ea3c:	000f0513          	mv	a0,t5
    ea40:	00028593          	mv	a1,t0
    ea44:	36c010ef          	jal	fdb0 <__mulsi3>
    ea48:	00050a93          	mv	s5,a0
    ea4c:	000e0593          	mv	a1,t3
    ea50:	000f0513          	mv	a0,t5
    ea54:	35c010ef          	jal	fdb0 <__mulsi3>
    ea58:	00050993          	mv	s3,a0
    ea5c:	00028593          	mv	a1,t0
    ea60:	00048513          	mv	a0,s1
    ea64:	34c010ef          	jal	fdb0 <__mulsi3>
    ea68:	00050293          	mv	t0,a0
    ea6c:	000e0593          	mv	a1,t3
    ea70:	00048513          	mv	a0,s1
    ea74:	33c010ef          	jal	fdb0 <__mulsi3>
    ea78:	010ad613          	srl	a2,s5,0x10
    ea7c:	005989b3          	add	s3,s3,t0
    ea80:	01360633          	add	a2,a2,s3
    ea84:	00567463          	bgeu	a2,t0,ea8c <__muldf3+0x3a4>
    ea88:	01450533          	add	a0,a0,s4
    ea8c:	00010a37          	lui	s4,0x10
    ea90:	fffa0693          	add	a3,s4,-1 # ffff <__fini_array_end+0x57>
    ea94:	00d672b3          	and	t0,a2,a3
    ea98:	00dafab3          	and	s5,s5,a3
    ea9c:	01065613          	srl	a2,a2,0x10
    eaa0:	01029293          	sll	t0,t0,0x10
    eaa4:	00a60e33          	add	t3,a2,a0
    eaa8:	015282b3          	add	t0,t0,s5
    eaac:	000f0513          	mv	a0,t5
    eab0:	00090593          	mv	a1,s2
    eab4:	2fc010ef          	jal	fdb0 <__mulsi3>
    eab8:	00050993          	mv	s3,a0
    eabc:	00040593          	mv	a1,s0
    eac0:	000f0513          	mv	a0,t5
    eac4:	2ec010ef          	jal	fdb0 <__mulsi3>
    eac8:	00050f13          	mv	t5,a0
    eacc:	00090593          	mv	a1,s2
    ead0:	00048513          	mv	a0,s1
    ead4:	2dc010ef          	jal	fdb0 <__mulsi3>
    ead8:	00050913          	mv	s2,a0
    eadc:	00040593          	mv	a1,s0
    eae0:	00048513          	mv	a0,s1
    eae4:	2cc010ef          	jal	fdb0 <__mulsi3>
    eae8:	012f06b3          	add	a3,t5,s2
    eaec:	0109d593          	srl	a1,s3,0x10
    eaf0:	00d58433          	add	s0,a1,a3
    eaf4:	00050f13          	mv	t5,a0
    eaf8:	01247463          	bgeu	s0,s2,eb00 <__muldf3+0x418>
    eafc:	01450f33          	add	t5,a0,s4
    eb00:	00010637          	lui	a2,0x10
    eb04:	fff60613          	add	a2,a2,-1 # ffff <__fini_array_end+0x57>
    eb08:	00c476b3          	and	a3,s0,a2
    eb0c:	00c9f9b3          	and	s3,s3,a2
    eb10:	01069693          	sll	a3,a3,0x10
    eb14:	007787b3          	add	a5,a5,t2
    eb18:	013686b3          	add	a3,a3,s3
    eb1c:	01f685b3          	add	a1,a3,t6
    eb20:	00e7b733          	sltu	a4,a5,a4
    eb24:	00e58733          	add	a4,a1,a4
    eb28:	005782b3          	add	t0,a5,t0
    eb2c:	01c70633          	add	a2,a4,t3
    eb30:	00f2b7b3          	sltu	a5,t0,a5
    eb34:	00f607b3          	add	a5,a2,a5
    eb38:	00d5b6b3          	sltu	a3,a1,a3
    eb3c:	00b735b3          	sltu	a1,a4,a1
    eb40:	00b6e6b3          	or	a3,a3,a1
    eb44:	00e63733          	sltu	a4,a2,a4
    eb48:	01045593          	srl	a1,s0,0x10
    eb4c:	00c7b633          	sltu	a2,a5,a2
    eb50:	00b686b3          	add	a3,a3,a1
    eb54:	00929a13          	sll	s4,t0,0x9
    eb58:	00c76733          	or	a4,a4,a2
    eb5c:	00d70733          	add	a4,a4,a3
    eb60:	01da6a33          	or	s4,s4,t4
    eb64:	01e70733          	add	a4,a4,t5
    eb68:	01403a33          	snez	s4,s4
    eb6c:	0172d293          	srl	t0,t0,0x17
    eb70:	00971713          	sll	a4,a4,0x9
    eb74:	0177d693          	srl	a3,a5,0x17
    eb78:	005a6a33          	or	s4,s4,t0
    eb7c:	00979793          	sll	a5,a5,0x9
    eb80:	00fa6a33          	or	s4,s4,a5
    eb84:	00771793          	sll	a5,a4,0x7
    eb88:	00d764b3          	or	s1,a4,a3
    eb8c:	0207d063          	bgez	a5,ebac <__muldf3+0x4c4>
    eb90:	001a5793          	srl	a5,s4,0x1
    eb94:	001a7a13          	and	s4,s4,1
    eb98:	01f49713          	sll	a4,s1,0x1f
    eb9c:	0147e7b3          	or	a5,a5,s4
    eba0:	00e7ea33          	or	s4,a5,a4
    eba4:	0014d493          	srl	s1,s1,0x1
    eba8:	00088313          	mv	t1,a7
    ebac:	3ff30793          	add	a5,t1,1023
    ebb0:	12f05663          	blez	a5,ecdc <__muldf3+0x5f4>
    ebb4:	007a7713          	and	a4,s4,7
    ebb8:	02070063          	beqz	a4,ebd8 <__muldf3+0x4f0>
    ebbc:	00fa7713          	and	a4,s4,15
    ebc0:	00400693          	li	a3,4
    ebc4:	00d70a63          	beq	a4,a3,ebd8 <__muldf3+0x4f0>
    ebc8:	004a0713          	add	a4,s4,4
    ebcc:	01473a33          	sltu	s4,a4,s4
    ebd0:	014484b3          	add	s1,s1,s4
    ebd4:	00070a13          	mv	s4,a4
    ebd8:	00749713          	sll	a4,s1,0x7
    ebdc:	00075a63          	bgez	a4,ebf0 <__muldf3+0x508>
    ebe0:	ff0007b7          	lui	a5,0xff000
    ebe4:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    ebe8:	00f4f4b3          	and	s1,s1,a5
    ebec:	40030793          	add	a5,t1,1024
    ebf0:	7fe00713          	li	a4,2046
    ebf4:	1cf74463          	blt	a4,a5,edbc <__muldf3+0x6d4>
    ebf8:	003a5a13          	srl	s4,s4,0x3
    ebfc:	01d49713          	sll	a4,s1,0x1d
    ec00:	00949693          	sll	a3,s1,0x9
    ec04:	01476733          	or	a4,a4,s4
    ec08:	00c6d693          	srl	a3,a3,0xc
    ec0c:	7ff7f793          	and	a5,a5,2047
    ec10:	c89ff06f          	j	e898 <__muldf3+0x1b0>
    ec14:	00a4ea33          	or	s4,s1,a0
    ec18:	060a0863          	beqz	s4,ec88 <__muldf3+0x5a0>
    ec1c:	12048e63          	beqz	s1,ed58 <__muldf3+0x670>
    ec20:	00048513          	mv	a0,s1
    ec24:	2fc010ef          	jal	ff20 <__clzsi2>
    ec28:	00050713          	mv	a4,a0
    ec2c:	ff550693          	add	a3,a0,-11
    ec30:	01d00793          	li	a5,29
    ec34:	ff870a13          	add	s4,a4,-8
    ec38:	40d787b3          	sub	a5,a5,a3
    ec3c:	00f457b3          	srl	a5,s0,a5
    ec40:	014496b3          	sll	a3,s1,s4
    ec44:	00d7e4b3          	or	s1,a5,a3
    ec48:	01441a33          	sll	s4,s0,s4
    ec4c:	c0d00793          	li	a5,-1011
    ec50:	40e78c33          	sub	s8,a5,a4
    ec54:	00000b13          	li	s6,0
    ec58:	00000b93          	li	s7,0
    ec5c:	b09ff06f          	j	e764 <__muldf3+0x7c>
    ec60:	00058813          	mv	a6,a1
    ec64:	7ff00793          	li	a5,2047
    ec68:	00000693          	li	a3,0
    ec6c:	00000713          	li	a4,0
    ec70:	c29ff06f          	j	e898 <__muldf3+0x1b0>
    ec74:	00050a13          	mv	s4,a0
    ec78:	00c00b13          	li	s6,12
    ec7c:	7ff00c13          	li	s8,2047
    ec80:	00300b93          	li	s7,3
    ec84:	ae1ff06f          	j	e764 <__muldf3+0x7c>
    ec88:	00000493          	li	s1,0
    ec8c:	00400b13          	li	s6,4
    ec90:	00000c13          	li	s8,0
    ec94:	00100b93          	li	s7,1
    ec98:	acdff06f          	j	e764 <__muldf3+0x7c>
    ec9c:	001b6b13          	or	s6,s6,1
    eca0:	000c0313          	mv	t1,s8
    eca4:	00000413          	li	s0,0
    eca8:	00000e13          	li	t3,0
    ecac:	00100693          	li	a3,1
    ecb0:	afdff06f          	j	e7ac <__muldf3+0xc4>
    ecb4:	002b6b13          	or	s6,s6,2
    ecb8:	00000413          	li	s0,0
    ecbc:	00000e13          	li	t3,0
    ecc0:	00200693          	li	a3,2
    ecc4:	ae9ff06f          	j	e7ac <__muldf3+0xc4>
    ecc8:	00040493          	mv	s1,s0
    eccc:	000e0a13          	mv	s4,t3
    ecd0:	00068b93          	mv	s7,a3
    ecd4:	00098593          	mv	a1,s3
    ecd8:	b99ff06f          	j	e870 <__muldf3+0x188>
    ecdc:	00100713          	li	a4,1
    ece0:	10079063          	bnez	a5,ede0 <__muldf3+0x6f8>
    ece4:	41e30313          	add	t1,t1,1054
    ece8:	006a1633          	sll	a2,s4,t1
    ecec:	00c03633          	snez	a2,a2
    ecf0:	00649333          	sll	t1,s1,t1
    ecf4:	00ea5a33          	srl	s4,s4,a4
    ecf8:	00666633          	or	a2,a2,t1
    ecfc:	01466633          	or	a2,a2,s4
    ed00:	00767793          	and	a5,a2,7
    ed04:	00e4d5b3          	srl	a1,s1,a4
    ed08:	02078063          	beqz	a5,ed28 <__muldf3+0x640>
    ed0c:	00f67793          	and	a5,a2,15
    ed10:	00400713          	li	a4,4
    ed14:	00e78a63          	beq	a5,a4,ed28 <__muldf3+0x640>
    ed18:	00460793          	add	a5,a2,4
    ed1c:	00c7b633          	sltu	a2,a5,a2
    ed20:	00c585b3          	add	a1,a1,a2
    ed24:	00078613          	mv	a2,a5
    ed28:	00859513          	sll	a0,a1,0x8
    ed2c:	00100793          	li	a5,1
    ed30:	00000693          	li	a3,0
    ed34:	00000713          	li	a4,0
    ed38:	b60540e3          	bltz	a0,e898 <__muldf3+0x1b0>
    ed3c:	10c0006f          	j	ee48 <__muldf3+0x760>
    ed40:	00f00713          	li	a4,15
    ed44:	12eb1063          	bne	s6,a4,ee64 <__muldf3+0x77c>
    ed48:	00000813          	li	a6,0
    ed4c:	000806b7          	lui	a3,0x80
    ed50:	00000713          	li	a4,0
    ed54:	b45ff06f          	j	e898 <__muldf3+0x1b0>
    ed58:	1c8010ef          	jal	ff20 <__clzsi2>
    ed5c:	01550693          	add	a3,a0,21
    ed60:	01c00793          	li	a5,28
    ed64:	02050713          	add	a4,a0,32
    ed68:	ecd7d4e3          	bge	a5,a3,ec30 <__muldf3+0x548>
    ed6c:	ff850513          	add	a0,a0,-8
    ed70:	00000a13          	li	s4,0
    ed74:	00a414b3          	sll	s1,s0,a0
    ed78:	ed5ff06f          	j	ec4c <__muldf3+0x564>
    ed7c:	000a8513          	mv	a0,s5
    ed80:	1a0010ef          	jal	ff20 <__clzsi2>
    ed84:	01550713          	add	a4,a0,21
    ed88:	01c00793          	li	a5,28
    ed8c:	02050313          	add	t1,a0,32
    ed90:	aae7d4e3          	bge	a5,a4,e838 <__muldf3+0x150>
    ed94:	ff850513          	add	a0,a0,-8
    ed98:	00000e13          	li	t3,0
    ed9c:	00aa9433          	sll	s0,s5,a0
    eda0:	ab5ff06f          	j	e854 <__muldf3+0x16c>
    eda4:	00000813          	li	a6,0
    eda8:	7ff00793          	li	a5,2047
    edac:	000806b7          	lui	a3,0x80
    edb0:	ae9ff06f          	j	e898 <__muldf3+0x1b0>
    edb4:	00088313          	mv	t1,a7
    edb8:	df5ff06f          	j	ebac <__muldf3+0x4c4>
    edbc:	7ff00793          	li	a5,2047
    edc0:	00000693          	li	a3,0
    edc4:	00000713          	li	a4,0
    edc8:	ad1ff06f          	j	e898 <__muldf3+0x1b0>
    edcc:	00000813          	li	a6,0
    edd0:	7ff00793          	li	a5,2047
    edd4:	000806b7          	lui	a3,0x80
    edd8:	00000713          	li	a4,0
    eddc:	abdff06f          	j	e898 <__muldf3+0x1b0>
    ede0:	40f70733          	sub	a4,a4,a5
    ede4:	03800693          	li	a3,56
    ede8:	aae6c2e3          	blt	a3,a4,e88c <__muldf3+0x1a4>
    edec:	01f00693          	li	a3,31
    edf0:	eee6dae3          	bge	a3,a4,ece4 <__muldf3+0x5fc>
    edf4:	fe100693          	li	a3,-31
    edf8:	40f687b3          	sub	a5,a3,a5
    edfc:	02000693          	li	a3,32
    ee00:	00f4d7b3          	srl	a5,s1,a5
    ee04:	00d70863          	beq	a4,a3,ee14 <__muldf3+0x72c>
    ee08:	43e30313          	add	t1,t1,1086
    ee0c:	00649333          	sll	t1,s1,t1
    ee10:	006a6a33          	or	s4,s4,t1
    ee14:	01403633          	snez	a2,s4
    ee18:	00f66633          	or	a2,a2,a5
    ee1c:	00767713          	and	a4,a2,7
    ee20:	00000693          	li	a3,0
    ee24:	02070863          	beqz	a4,ee54 <__muldf3+0x76c>
    ee28:	00f67793          	and	a5,a2,15
    ee2c:	00400713          	li	a4,4
    ee30:	00000593          	li	a1,0
    ee34:	00e78a63          	beq	a5,a4,ee48 <__muldf3+0x760>
    ee38:	00460793          	add	a5,a2,4
    ee3c:	00c7b633          	sltu	a2,a5,a2
    ee40:	00c035b3          	snez	a1,a2
    ee44:	00078613          	mv	a2,a5
    ee48:	00959693          	sll	a3,a1,0x9
    ee4c:	01d59713          	sll	a4,a1,0x1d
    ee50:	00c6d693          	srl	a3,a3,0xc
    ee54:	00365613          	srl	a2,a2,0x3
    ee58:	00e66733          	or	a4,a2,a4
    ee5c:	00000793          	li	a5,0
    ee60:	a39ff06f          	j	e898 <__muldf3+0x1b0>
    ee64:	00040493          	mv	s1,s0
    ee68:	000a8a13          	mv	s4,s5
    ee6c:	00300b93          	li	s7,3
    ee70:	00098593          	mv	a1,s3
    ee74:	9fdff06f          	j	e870 <__muldf3+0x188>

0000ee78 <__subdf3>:
    ee78:	001007b7          	lui	a5,0x100
    ee7c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    ee80:	fe010113          	add	sp,sp,-32
    ee84:	00b7f8b3          	and	a7,a5,a1
    ee88:	00d7f833          	and	a6,a5,a3
    ee8c:	0146d793          	srl	a5,a3,0x14
    ee90:	00389893          	sll	a7,a7,0x3
    ee94:	00812c23          	sw	s0,24(sp)
    ee98:	01312623          	sw	s3,12(sp)
    ee9c:	01f5d413          	srl	s0,a1,0x1f
    eea0:	0145d993          	srl	s3,a1,0x14
    eea4:	01d55713          	srl	a4,a0,0x1d
    eea8:	00381813          	sll	a6,a6,0x3
    eeac:	01d65593          	srl	a1,a2,0x1d
    eeb0:	00112e23          	sw	ra,28(sp)
    eeb4:	00912a23          	sw	s1,20(sp)
    eeb8:	01212823          	sw	s2,16(sp)
    eebc:	7ff7ff13          	and	t5,a5,2047
    eec0:	7ff00313          	li	t1,2047
    eec4:	01176733          	or	a4,a4,a7
    eec8:	7ff9f993          	and	s3,s3,2047
    eecc:	00040e13          	mv	t3,s0
    eed0:	00351893          	sll	a7,a0,0x3
    eed4:	01f6d693          	srl	a3,a3,0x1f
    eed8:	0105e5b3          	or	a1,a1,a6
    eedc:	00361e93          	sll	t4,a2,0x3
    eee0:	206f0c63          	beq	t5,t1,f0f8 <__subdf3+0x280>
    eee4:	0016c693          	xor	a3,a3,1
    eee8:	41e987b3          	sub	a5,s3,t5
    eeec:	16d40263          	beq	s0,a3,f050 <__subdf3+0x1d8>
    eef0:	00f05ae3          	blez	a5,f704 <__subdf3+0x88c>
    eef4:	240f0a63          	beqz	t5,f148 <__subdf3+0x2d0>
    eef8:	3c698463          	beq	s3,t1,f2c0 <__subdf3+0x448>
    eefc:	03800693          	li	a3,56
    ef00:	00100513          	li	a0,1
    ef04:	02f6ce63          	blt	a3,a5,ef40 <__subdf3+0xc8>
    ef08:	008006b7          	lui	a3,0x800
    ef0c:	00d5e5b3          	or	a1,a1,a3
    ef10:	01f00693          	li	a3,31
    ef14:	4ef6c463          	blt	a3,a5,f3fc <__subdf3+0x584>
    ef18:	02000693          	li	a3,32
    ef1c:	40f686b3          	sub	a3,a3,a5
    ef20:	00d59533          	sll	a0,a1,a3
    ef24:	00fed633          	srl	a2,t4,a5
    ef28:	00de96b3          	sll	a3,t4,a3
    ef2c:	00c56533          	or	a0,a0,a2
    ef30:	00d036b3          	snez	a3,a3
    ef34:	00f5d7b3          	srl	a5,a1,a5
    ef38:	00d56533          	or	a0,a0,a3
    ef3c:	40f70733          	sub	a4,a4,a5
    ef40:	40a88533          	sub	a0,a7,a0
    ef44:	00a8b633          	sltu	a2,a7,a0
    ef48:	00050493          	mv	s1,a0
    ef4c:	40c70933          	sub	s2,a4,a2
    ef50:	00891793          	sll	a5,s2,0x8
    ef54:	3407d863          	bgez	a5,f2a4 <__subdf3+0x42c>
    ef58:	008007b7          	lui	a5,0x800
    ef5c:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    ef60:	00f97933          	and	s2,s2,a5
    ef64:	2e090663          	beqz	s2,f250 <__subdf3+0x3d8>
    ef68:	00090513          	mv	a0,s2
    ef6c:	7b5000ef          	jal	ff20 <__clzsi2>
    ef70:	ff850793          	add	a5,a0,-8
    ef74:	02000693          	li	a3,32
    ef78:	40f68733          	sub	a4,a3,a5
    ef7c:	00e4d733          	srl	a4,s1,a4
    ef80:	00f91933          	sll	s2,s2,a5
    ef84:	01276733          	or	a4,a4,s2
    ef88:	00f494b3          	sll	s1,s1,a5
    ef8c:	3f37c463          	blt	a5,s3,f374 <__subdf3+0x4fc>
    ef90:	413787b3          	sub	a5,a5,s3
    ef94:	00178793          	add	a5,a5,1
    ef98:	40f686b3          	sub	a3,a3,a5
    ef9c:	00d49633          	sll	a2,s1,a3
    efa0:	00f4d933          	srl	s2,s1,a5
    efa4:	00c03633          	snez	a2,a2
    efa8:	00c96633          	or	a2,s2,a2
    efac:	00d716b3          	sll	a3,a4,a3
    efb0:	00c6e4b3          	or	s1,a3,a2
    efb4:	00f75933          	srl	s2,a4,a5
    efb8:	00000993          	li	s3,0
    efbc:	0074f793          	and	a5,s1,7
    efc0:	02078063          	beqz	a5,efe0 <__subdf3+0x168>
    efc4:	00f4f793          	and	a5,s1,15
    efc8:	00400713          	li	a4,4
    efcc:	00e78a63          	beq	a5,a4,efe0 <__subdf3+0x168>
    efd0:	00448793          	add	a5,s1,4
    efd4:	0097b533          	sltu	a0,a5,s1
    efd8:	00a90933          	add	s2,s2,a0
    efdc:	00078493          	mv	s1,a5
    efe0:	00891793          	sll	a5,s2,0x8
    efe4:	6c07d063          	bgez	a5,f6a4 <__subdf3+0x82c>
    efe8:	00198793          	add	a5,s3,1
    efec:	7ff00713          	li	a4,2047
    eff0:	24e78663          	beq	a5,a4,f23c <__subdf3+0x3c4>
    eff4:	ff800737          	lui	a4,0xff800
    eff8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    effc:	00e97733          	and	a4,s2,a4
    f000:	7ff7f793          	and	a5,a5,2047
    f004:	01d71813          	sll	a6,a4,0x1d
    f008:	0034d513          	srl	a0,s1,0x3
    f00c:	00971713          	sll	a4,a4,0x9
    f010:	00a86833          	or	a6,a6,a0
    f014:	00c75713          	srl	a4,a4,0xc
    f018:	00147e13          	and	t3,s0,1
    f01c:	01c12083          	lw	ra,28(sp)
    f020:	01812403          	lw	s0,24(sp)
    f024:	01479793          	sll	a5,a5,0x14
    f028:	00e7e7b3          	or	a5,a5,a4
    f02c:	01fe1713          	sll	a4,t3,0x1f
    f030:	00e7e7b3          	or	a5,a5,a4
    f034:	01412483          	lw	s1,20(sp)
    f038:	01012903          	lw	s2,16(sp)
    f03c:	00c12983          	lw	s3,12(sp)
    f040:	00080513          	mv	a0,a6
    f044:	00078593          	mv	a1,a5
    f048:	02010113          	add	sp,sp,32
    f04c:	00008067          	ret
    f050:	70f05263          	blez	a5,f754 <__subdf3+0x8dc>
    f054:	1c0f1663          	bnez	t5,f220 <__subdf3+0x3a8>
    f058:	01d5e6b3          	or	a3,a1,t4
    f05c:	26068e63          	beqz	a3,f2d8 <__subdf3+0x460>
    f060:	fff78693          	add	a3,a5,-1
    f064:	46068863          	beqz	a3,f4d4 <__subdf3+0x65c>
    f068:	24678c63          	beq	a5,t1,f2c0 <__subdf3+0x448>
    f06c:	03800793          	li	a5,56
    f070:	00100913          	li	s2,1
    f074:	02d7cc63          	blt	a5,a3,f0ac <__subdf3+0x234>
    f078:	00068793          	mv	a5,a3
    f07c:	01f00693          	li	a3,31
    f080:	48f6ca63          	blt	a3,a5,f514 <__subdf3+0x69c>
    f084:	02000693          	li	a3,32
    f088:	40f686b3          	sub	a3,a3,a5
    f08c:	00d59933          	sll	s2,a1,a3
    f090:	00fed633          	srl	a2,t4,a5
    f094:	00de96b3          	sll	a3,t4,a3
    f098:	00c96933          	or	s2,s2,a2
    f09c:	00d036b3          	snez	a3,a3
    f0a0:	00f5d7b3          	srl	a5,a1,a5
    f0a4:	00d96933          	or	s2,s2,a3
    f0a8:	00f70733          	add	a4,a4,a5
    f0ac:	01190633          	add	a2,s2,a7
    f0b0:	01263933          	sltu	s2,a2,s2
    f0b4:	00060493          	mv	s1,a2
    f0b8:	00e90933          	add	s2,s2,a4
    f0bc:	00891793          	sll	a5,s2,0x8
    f0c0:	1e07d263          	bgez	a5,f2a4 <__subdf3+0x42c>
    f0c4:	00198993          	add	s3,s3,1
    f0c8:	7ff00793          	li	a5,2047
    f0cc:	16f98863          	beq	s3,a5,f23c <__subdf3+0x3c4>
    f0d0:	ff8007b7          	lui	a5,0xff800
    f0d4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    f0d8:	0014f513          	and	a0,s1,1
    f0dc:	00f977b3          	and	a5,s2,a5
    f0e0:	0014d713          	srl	a4,s1,0x1
    f0e4:	00a76733          	or	a4,a4,a0
    f0e8:	01f79513          	sll	a0,a5,0x1f
    f0ec:	00e564b3          	or	s1,a0,a4
    f0f0:	0017d913          	srl	s2,a5,0x1
    f0f4:	ec9ff06f          	j	efbc <__subdf3+0x144>
    f0f8:	01d5e833          	or	a6,a1,t4
    f0fc:	80198313          	add	t1,s3,-2047
    f100:	06080863          	beqz	a6,f170 <__subdf3+0x2f8>
    f104:	06d40a63          	beq	s0,a3,f178 <__subdf3+0x300>
    f108:	0e030463          	beqz	t1,f1f0 <__subdf3+0x378>
    f10c:	26098e63          	beqz	s3,f388 <__subdf3+0x510>
    f110:	00361513          	sll	a0,a2,0x3
    f114:	00355513          	srl	a0,a0,0x3
    f118:	00068413          	mv	s0,a3
    f11c:	00058713          	mv	a4,a1
    f120:	01d71813          	sll	a6,a4,0x1d
    f124:	00a86833          	or	a6,a6,a0
    f128:	00375713          	srl	a4,a4,0x3
    f12c:	01076733          	or	a4,a4,a6
    f130:	10070663          	beqz	a4,f23c <__subdf3+0x3c4>
    f134:	00000e13          	li	t3,0
    f138:	7ff00793          	li	a5,2047
    f13c:	00080737          	lui	a4,0x80
    f140:	00000813          	li	a6,0
    f144:	ed9ff06f          	j	f01c <__subdf3+0x1a4>
    f148:	01d5e6b3          	or	a3,a1,t4
    f14c:	18068663          	beqz	a3,f2d8 <__subdf3+0x460>
    f150:	fff78693          	add	a3,a5,-1
    f154:	3a068263          	beqz	a3,f4f8 <__subdf3+0x680>
    f158:	16678463          	beq	a5,t1,f2c0 <__subdf3+0x448>
    f15c:	03800793          	li	a5,56
    f160:	00100513          	li	a0,1
    f164:	dcd7cee3          	blt	a5,a3,ef40 <__subdf3+0xc8>
    f168:	00068793          	mv	a5,a3
    f16c:	da5ff06f          	j	ef10 <__subdf3+0x98>
    f170:	0016c693          	xor	a3,a3,1
    f174:	f8d41ae3          	bne	s0,a3,f108 <__subdf3+0x290>
    f178:	18030863          	beqz	t1,f308 <__subdf3+0x490>
    f17c:	2c099063          	bnez	s3,f43c <__subdf3+0x5c4>
    f180:	7ff00793          	li	a5,2047
    f184:	011766b3          	or	a3,a4,a7
    f188:	48068863          	beqz	a3,f618 <__subdf3+0x7a0>
    f18c:	fff78693          	add	a3,a5,-1
    f190:	34068263          	beqz	a3,f4d4 <__subdf3+0x65c>
    f194:	7ff00513          	li	a0,2047
    f198:	2aa78263          	beq	a5,a0,f43c <__subdf3+0x5c4>
    f19c:	03800793          	li	a5,56
    f1a0:	00100913          	li	s2,1
    f1a4:	02d7ca63          	blt	a5,a3,f1d8 <__subdf3+0x360>
    f1a8:	01f00793          	li	a5,31
    f1ac:	4cd7c663          	blt	a5,a3,f678 <__subdf3+0x800>
    f1b0:	02000793          	li	a5,32
    f1b4:	40d787b3          	sub	a5,a5,a3
    f1b8:	00f71933          	sll	s2,a4,a5
    f1bc:	00d8d633          	srl	a2,a7,a3
    f1c0:	00f897b3          	sll	a5,a7,a5
    f1c4:	00c96933          	or	s2,s2,a2
    f1c8:	00f037b3          	snez	a5,a5
    f1cc:	00d756b3          	srl	a3,a4,a3
    f1d0:	00f96933          	or	s2,s2,a5
    f1d4:	00d585b3          	add	a1,a1,a3
    f1d8:	01d90733          	add	a4,s2,t4
    f1dc:	01273933          	sltu	s2,a4,s2
    f1e0:	00070493          	mv	s1,a4
    f1e4:	00b90933          	add	s2,s2,a1
    f1e8:	000f0993          	mv	s3,t5
    f1ec:	ed1ff06f          	j	f0bc <__subdf3+0x244>
    f1f0:	00198793          	add	a5,s3,1
    f1f4:	7fe7f793          	and	a5,a5,2046
    f1f8:	14079463          	bnez	a5,f340 <__subdf3+0x4c8>
    f1fc:	01d5e833          	or	a6,a1,t4
    f200:	011767b3          	or	a5,a4,a7
    f204:	2a099463          	bnez	s3,f4ac <__subdf3+0x634>
    f208:	38078e63          	beqz	a5,f5a4 <__subdf3+0x72c>
    f20c:	3c081063          	bnez	a6,f5cc <__subdf3+0x754>
    f210:	00351513          	sll	a0,a0,0x3
    f214:	00355913          	srl	s2,a0,0x3
    f218:	00000793          	li	a5,0
    f21c:	1140006f          	j	f330 <__subdf3+0x4b8>
    f220:	0a698063          	beq	s3,t1,f2c0 <__subdf3+0x448>
    f224:	03800693          	li	a3,56
    f228:	00100913          	li	s2,1
    f22c:	e8f6c0e3          	blt	a3,a5,f0ac <__subdf3+0x234>
    f230:	008006b7          	lui	a3,0x800
    f234:	00d5e5b3          	or	a1,a1,a3
    f238:	e45ff06f          	j	f07c <__subdf3+0x204>
    f23c:	00147e13          	and	t3,s0,1
    f240:	7ff00793          	li	a5,2047
    f244:	00000713          	li	a4,0
    f248:	00000813          	li	a6,0
    f24c:	dd1ff06f          	j	f01c <__subdf3+0x1a4>
    f250:	00048513          	mv	a0,s1
    f254:	4cd000ef          	jal	ff20 <__clzsi2>
    f258:	01850793          	add	a5,a0,24
    f25c:	01f00693          	li	a3,31
    f260:	d0f6dae3          	bge	a3,a5,ef74 <__subdf3+0xfc>
    f264:	ff850713          	add	a4,a0,-8
    f268:	00e49733          	sll	a4,s1,a4
    f26c:	1b37ce63          	blt	a5,s3,f428 <__subdf3+0x5b0>
    f270:	413789b3          	sub	s3,a5,s3
    f274:	00198793          	add	a5,s3,1
    f278:	42f6de63          	bge	a3,a5,f6b4 <__subdf3+0x83c>
    f27c:	fe198993          	add	s3,s3,-31
    f280:	02000693          	li	a3,32
    f284:	013754b3          	srl	s1,a4,s3
    f288:	00d78c63          	beq	a5,a3,f2a0 <__subdf3+0x428>
    f28c:	04000693          	li	a3,64
    f290:	40f687b3          	sub	a5,a3,a5
    f294:	00f71733          	sll	a4,a4,a5
    f298:	00e03733          	snez	a4,a4
    f29c:	00e4e4b3          	or	s1,s1,a4
    f2a0:	00000993          	li	s3,0
    f2a4:	0074f793          	and	a5,s1,7
    f2a8:	d0079ee3          	bnez	a5,efc4 <__subdf3+0x14c>
    f2ac:	00098793          	mv	a5,s3
    f2b0:	0034d513          	srl	a0,s1,0x3
    f2b4:	00090713          	mv	a4,s2
    f2b8:	0280006f          	j	f2e0 <__subdf3+0x468>
    f2bc:	e6081ce3          	bnez	a6,f134 <__subdf3+0x2bc>
    f2c0:	00351513          	sll	a0,a0,0x3
    f2c4:	01d71813          	sll	a6,a4,0x1d
    f2c8:	00355513          	srl	a0,a0,0x3
    f2cc:	00a86833          	or	a6,a6,a0
    f2d0:	00375713          	srl	a4,a4,0x3
    f2d4:	e59ff06f          	j	f12c <__subdf3+0x2b4>
    f2d8:	00351513          	sll	a0,a0,0x3
    f2dc:	00355513          	srl	a0,a0,0x3
    f2e0:	01d71813          	sll	a6,a4,0x1d
    f2e4:	7ff00693          	li	a3,2047
    f2e8:	00a86833          	or	a6,a6,a0
    f2ec:	00375713          	srl	a4,a4,0x3
    f2f0:	e2d78ee3          	beq	a5,a3,f12c <__subdf3+0x2b4>
    f2f4:	00c71713          	sll	a4,a4,0xc
    f2f8:	00c75713          	srl	a4,a4,0xc
    f2fc:	7ff7f793          	and	a5,a5,2047
    f300:	00147e13          	and	t3,s0,1
    f304:	d19ff06f          	j	f01c <__subdf3+0x1a4>
    f308:	00198693          	add	a3,s3,1
    f30c:	7fe6f793          	and	a5,a3,2046
    f310:	12079e63          	bnez	a5,f44c <__subdf3+0x5d4>
    f314:	011767b3          	or	a5,a4,a7
    f318:	24099a63          	bnez	s3,f56c <__subdf3+0x6f4>
    f31c:	30078663          	beqz	a5,f628 <__subdf3+0x7b0>
    f320:	01d5e7b3          	or	a5,a1,t4
    f324:	30079a63          	bnez	a5,f638 <__subdf3+0x7c0>
    f328:	00351513          	sll	a0,a0,0x3
    f32c:	00355913          	srl	s2,a0,0x3
    f330:	01d71813          	sll	a6,a4,0x1d
    f334:	01286833          	or	a6,a6,s2
    f338:	00375713          	srl	a4,a4,0x3
    f33c:	fb9ff06f          	j	f2f4 <__subdf3+0x47c>
    f340:	41d88833          	sub	a6,a7,t4
    f344:	0108b7b3          	sltu	a5,a7,a6
    f348:	40b70933          	sub	s2,a4,a1
    f34c:	40f90933          	sub	s2,s2,a5
    f350:	00891793          	sll	a5,s2,0x8
    f354:	00080493          	mv	s1,a6
    f358:	1207c263          	bltz	a5,f47c <__subdf3+0x604>
    f35c:	01286833          	or	a6,a6,s2
    f360:	c00812e3          	bnez	a6,ef64 <__subdf3+0xec>
    f364:	00000e13          	li	t3,0
    f368:	00000793          	li	a5,0
    f36c:	00000713          	li	a4,0
    f370:	cadff06f          	j	f01c <__subdf3+0x1a4>
    f374:	ff800937          	lui	s2,0xff800
    f378:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    f37c:	40f989b3          	sub	s3,s3,a5
    f380:	01277933          	and	s2,a4,s2
    f384:	c39ff06f          	j	efbc <__subdf3+0x144>
    f388:	7ff00793          	li	a5,2047
    f38c:	01176533          	or	a0,a4,a7
    f390:	10050463          	beqz	a0,f498 <__subdf3+0x620>
    f394:	fff78813          	add	a6,a5,-1
    f398:	1e080263          	beqz	a6,f57c <__subdf3+0x704>
    f39c:	7ff00513          	li	a0,2047
    f3a0:	d6a788e3          	beq	a5,a0,f110 <__subdf3+0x298>
    f3a4:	03800793          	li	a5,56
    f3a8:	00068413          	mv	s0,a3
    f3ac:	00100513          	li	a0,1
    f3b0:	0307ca63          	blt	a5,a6,f3e4 <__subdf3+0x56c>
    f3b4:	01f00793          	li	a5,31
    f3b8:	1907c463          	blt	a5,a6,f540 <__subdf3+0x6c8>
    f3bc:	02000793          	li	a5,32
    f3c0:	410787b3          	sub	a5,a5,a6
    f3c4:	00f71533          	sll	a0,a4,a5
    f3c8:	0108d6b3          	srl	a3,a7,a6
    f3cc:	00f897b3          	sll	a5,a7,a5
    f3d0:	00d56533          	or	a0,a0,a3
    f3d4:	00f037b3          	snez	a5,a5
    f3d8:	01075833          	srl	a6,a4,a6
    f3dc:	00f56533          	or	a0,a0,a5
    f3e0:	410585b3          	sub	a1,a1,a6
    f3e4:	40ae8533          	sub	a0,t4,a0
    f3e8:	00aeb733          	sltu	a4,t4,a0
    f3ec:	00050493          	mv	s1,a0
    f3f0:	40e58933          	sub	s2,a1,a4
    f3f4:	000f0993          	mv	s3,t5
    f3f8:	b59ff06f          	j	ef50 <__subdf3+0xd8>
    f3fc:	fe078693          	add	a3,a5,-32
    f400:	02000613          	li	a2,32
    f404:	00d5d6b3          	srl	a3,a1,a3
    f408:	00c78a63          	beq	a5,a2,f41c <__subdf3+0x5a4>
    f40c:	04000613          	li	a2,64
    f410:	40f607b3          	sub	a5,a2,a5
    f414:	00f597b3          	sll	a5,a1,a5
    f418:	00feeeb3          	or	t4,t4,a5
    f41c:	01d03533          	snez	a0,t4
    f420:	00d56533          	or	a0,a0,a3
    f424:	b1dff06f          	j	ef40 <__subdf3+0xc8>
    f428:	ff8006b7          	lui	a3,0xff800
    f42c:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    f430:	40f987b3          	sub	a5,s3,a5
    f434:	00d77733          	and	a4,a4,a3
    f438:	ef9ff06f          	j	f330 <__subdf3+0x4b8>
    f43c:	00361513          	sll	a0,a2,0x3
    f440:	00355513          	srl	a0,a0,0x3
    f444:	00058713          	mv	a4,a1
    f448:	cd9ff06f          	j	f120 <__subdf3+0x2a8>
    f44c:	7ff00793          	li	a5,2047
    f450:	def686e3          	beq	a3,a5,f23c <__subdf3+0x3c4>
    f454:	01d88eb3          	add	t4,a7,t4
    f458:	011eb633          	sltu	a2,t4,a7
    f45c:	00b707b3          	add	a5,a4,a1
    f460:	00c787b3          	add	a5,a5,a2
    f464:	01f79513          	sll	a0,a5,0x1f
    f468:	001ede93          	srl	t4,t4,0x1
    f46c:	01d564b3          	or	s1,a0,t4
    f470:	0017d913          	srl	s2,a5,0x1
    f474:	00068993          	mv	s3,a3
    f478:	b45ff06f          	j	efbc <__subdf3+0x144>
    f47c:	411e8633          	sub	a2,t4,a7
    f480:	40e587b3          	sub	a5,a1,a4
    f484:	00ceb733          	sltu	a4,t4,a2
    f488:	00060493          	mv	s1,a2
    f48c:	40e78933          	sub	s2,a5,a4
    f490:	00068413          	mv	s0,a3
    f494:	ad1ff06f          	j	ef64 <__subdf3+0xec>
    f498:	00361613          	sll	a2,a2,0x3
    f49c:	00365513          	srl	a0,a2,0x3
    f4a0:	00068413          	mv	s0,a3
    f4a4:	00058713          	mv	a4,a1
    f4a8:	e39ff06f          	j	f2e0 <__subdf3+0x468>
    f4ac:	e00798e3          	bnez	a5,f2bc <__subdf3+0x444>
    f4b0:	22080663          	beqz	a6,f6dc <__subdf3+0x864>
    f4b4:	0035d713          	srl	a4,a1,0x3
    f4b8:	00361613          	sll	a2,a2,0x3
    f4bc:	01d59593          	sll	a1,a1,0x1d
    f4c0:	00b76733          	or	a4,a4,a1
    f4c4:	00365613          	srl	a2,a2,0x3
    f4c8:	00c76733          	or	a4,a4,a2
    f4cc:	00068413          	mv	s0,a3
    f4d0:	c61ff06f          	j	f130 <__subdf3+0x2b8>
    f4d4:	01d88eb3          	add	t4,a7,t4
    f4d8:	00b705b3          	add	a1,a4,a1
    f4dc:	011eb633          	sltu	a2,t4,a7
    f4e0:	00c58933          	add	s2,a1,a2
    f4e4:	00891793          	sll	a5,s2,0x8
    f4e8:	000e8493          	mv	s1,t4
    f4ec:	0a07d863          	bgez	a5,f59c <__subdf3+0x724>
    f4f0:	00200993          	li	s3,2
    f4f4:	bddff06f          	j	f0d0 <__subdf3+0x258>
    f4f8:	41d88eb3          	sub	t4,a7,t4
    f4fc:	40b705b3          	sub	a1,a4,a1
    f500:	01d8b633          	sltu	a2,a7,t4
    f504:	000e8493          	mv	s1,t4
    f508:	40c58933          	sub	s2,a1,a2
    f50c:	00100993          	li	s3,1
    f510:	a41ff06f          	j	ef50 <__subdf3+0xd8>
    f514:	fe078693          	add	a3,a5,-32
    f518:	02000613          	li	a2,32
    f51c:	00d5d6b3          	srl	a3,a1,a3
    f520:	00c78a63          	beq	a5,a2,f534 <__subdf3+0x6bc>
    f524:	04000613          	li	a2,64
    f528:	40f607b3          	sub	a5,a2,a5
    f52c:	00f597b3          	sll	a5,a1,a5
    f530:	00feeeb3          	or	t4,t4,a5
    f534:	01d03933          	snez	s2,t4
    f538:	00d96933          	or	s2,s2,a3
    f53c:	b71ff06f          	j	f0ac <__subdf3+0x234>
    f540:	fe080793          	add	a5,a6,-32
    f544:	02000693          	li	a3,32
    f548:	00f757b3          	srl	a5,a4,a5
    f54c:	00d80a63          	beq	a6,a3,f560 <__subdf3+0x6e8>
    f550:	04000693          	li	a3,64
    f554:	410686b3          	sub	a3,a3,a6
    f558:	00d71733          	sll	a4,a4,a3
    f55c:	00e8e8b3          	or	a7,a7,a4
    f560:	01103533          	snez	a0,a7
    f564:	00f56533          	or	a0,a0,a5
    f568:	e7dff06f          	j	f3e4 <__subdf3+0x56c>
    f56c:	ec0788e3          	beqz	a5,f43c <__subdf3+0x5c4>
    f570:	01d5eeb3          	or	t4,a1,t4
    f574:	bc0e90e3          	bnez	t4,f134 <__subdf3+0x2bc>
    f578:	d49ff06f          	j	f2c0 <__subdf3+0x448>
    f57c:	411e8633          	sub	a2,t4,a7
    f580:	40e585b3          	sub	a1,a1,a4
    f584:	00ceb733          	sltu	a4,t4,a2
    f588:	00060493          	mv	s1,a2
    f58c:	40e58933          	sub	s2,a1,a4
    f590:	00068413          	mv	s0,a3
    f594:	00100993          	li	s3,1
    f598:	9b9ff06f          	j	ef50 <__subdf3+0xd8>
    f59c:	00100793          	li	a5,1
    f5a0:	d11ff06f          	j	f2b0 <__subdf3+0x438>
    f5a4:	dc0800e3          	beqz	a6,f364 <__subdf3+0x4ec>
    f5a8:	00361613          	sll	a2,a2,0x3
    f5ac:	00365793          	srl	a5,a2,0x3
    f5b0:	01d59813          	sll	a6,a1,0x1d
    f5b4:	00959713          	sll	a4,a1,0x9
    f5b8:	00f86833          	or	a6,a6,a5
    f5bc:	00c75713          	srl	a4,a4,0xc
    f5c0:	00068e13          	mv	t3,a3
    f5c4:	00000793          	li	a5,0
    f5c8:	a55ff06f          	j	f01c <__subdf3+0x1a4>
    f5cc:	41d88933          	sub	s2,a7,t4
    f5d0:	0128b7b3          	sltu	a5,a7,s2
    f5d4:	40b70633          	sub	a2,a4,a1
    f5d8:	40f60633          	sub	a2,a2,a5
    f5dc:	00861793          	sll	a5,a2,0x8
    f5e0:	0e07d263          	bgez	a5,f6c4 <__subdf3+0x84c>
    f5e4:	411e8633          	sub	a2,t4,a7
    f5e8:	40e58733          	sub	a4,a1,a4
    f5ec:	00cebeb3          	sltu	t4,t4,a2
    f5f0:	41d70733          	sub	a4,a4,t4
    f5f4:	00871793          	sll	a5,a4,0x8
    f5f8:	00060493          	mv	s1,a2
    f5fc:	1207de63          	bgez	a5,f738 <__subdf3+0x8c0>
    f600:	ff8007b7          	lui	a5,0xff800
    f604:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    f608:	00f77733          	and	a4,a4,a5
    f60c:	00068413          	mv	s0,a3
    f610:	00100793          	li	a5,1
    f614:	9f1ff06f          	j	f004 <__subdf3+0x18c>
    f618:	00361613          	sll	a2,a2,0x3
    f61c:	00365513          	srl	a0,a2,0x3
    f620:	00058713          	mv	a4,a1
    f624:	cbdff06f          	j	f2e0 <__subdf3+0x468>
    f628:	00361613          	sll	a2,a2,0x3
    f62c:	00365913          	srl	s2,a2,0x3
    f630:	00058713          	mv	a4,a1
    f634:	cfdff06f          	j	f330 <__subdf3+0x4b8>
    f638:	01d886b3          	add	a3,a7,t4
    f63c:	00b707b3          	add	a5,a4,a1
    f640:	0116b633          	sltu	a2,a3,a7
    f644:	00c787b3          	add	a5,a5,a2
    f648:	00879713          	sll	a4,a5,0x8
    f64c:	0036d813          	srl	a6,a3,0x3
    f650:	08075e63          	bgez	a4,f6ec <__subdf3+0x874>
    f654:	ff800737          	lui	a4,0xff800
    f658:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    f65c:	00e7f7b3          	and	a5,a5,a4
    f660:	01d79713          	sll	a4,a5,0x1d
    f664:	00979793          	sll	a5,a5,0x9
    f668:	01076833          	or	a6,a4,a6
    f66c:	00c7d713          	srl	a4,a5,0xc
    f670:	00100793          	li	a5,1
    f674:	9a9ff06f          	j	f01c <__subdf3+0x1a4>
    f678:	fe068793          	add	a5,a3,-32
    f67c:	02000613          	li	a2,32
    f680:	00f757b3          	srl	a5,a4,a5
    f684:	00c68a63          	beq	a3,a2,f698 <__subdf3+0x820>
    f688:	04000613          	li	a2,64
    f68c:	40d606b3          	sub	a3,a2,a3
    f690:	00d71733          	sll	a4,a4,a3
    f694:	00e8e8b3          	or	a7,a7,a4
    f698:	01103933          	snez	s2,a7
    f69c:	00f96933          	or	s2,s2,a5
    f6a0:	b39ff06f          	j	f1d8 <__subdf3+0x360>
    f6a4:	0034d513          	srl	a0,s1,0x3
    f6a8:	00098793          	mv	a5,s3
    f6ac:	00090713          	mv	a4,s2
    f6b0:	c31ff06f          	j	f2e0 <__subdf3+0x468>
    f6b4:	02000693          	li	a3,32
    f6b8:	40f686b3          	sub	a3,a3,a5
    f6bc:	00000613          	li	a2,0
    f6c0:	8e9ff06f          	j	efa8 <__subdf3+0x130>
    f6c4:	00c96833          	or	a6,s2,a2
    f6c8:	c8080ee3          	beqz	a6,f364 <__subdf3+0x4ec>
    f6cc:	00395913          	srl	s2,s2,0x3
    f6d0:	00000793          	li	a5,0
    f6d4:	00060713          	mv	a4,a2
    f6d8:	c59ff06f          	j	f330 <__subdf3+0x4b8>
    f6dc:	00000e13          	li	t3,0
    f6e0:	7ff00793          	li	a5,2047
    f6e4:	00080737          	lui	a4,0x80
    f6e8:	935ff06f          	j	f01c <__subdf3+0x1a4>
    f6ec:	01d79713          	sll	a4,a5,0x1d
    f6f0:	00979793          	sll	a5,a5,0x9
    f6f4:	01076833          	or	a6,a4,a6
    f6f8:	00c7d713          	srl	a4,a5,0xc
    f6fc:	00000793          	li	a5,0
    f700:	91dff06f          	j	f01c <__subdf3+0x1a4>
    f704:	ae0786e3          	beqz	a5,f1f0 <__subdf3+0x378>
    f708:	413f0833          	sub	a6,t5,s3
    f70c:	00080793          	mv	a5,a6
    f710:	c6098ee3          	beqz	s3,f38c <__subdf3+0x514>
    f714:	03800793          	li	a5,56
    f718:	0107ca63          	blt	a5,a6,f72c <__subdf3+0x8b4>
    f71c:	008007b7          	lui	a5,0x800
    f720:	00f76733          	or	a4,a4,a5
    f724:	00068413          	mv	s0,a3
    f728:	c8dff06f          	j	f3b4 <__subdf3+0x53c>
    f72c:	00068413          	mv	s0,a3
    f730:	00100513          	li	a0,1
    f734:	cb1ff06f          	j	f3e4 <__subdf3+0x56c>
    f738:	01d71813          	sll	a6,a4,0x1d
    f73c:	00365613          	srl	a2,a2,0x3
    f740:	00c86833          	or	a6,a6,a2
    f744:	00375713          	srl	a4,a4,0x3
    f748:	00000793          	li	a5,0
    f74c:	00068413          	mv	s0,a3
    f750:	ba5ff06f          	j	f2f4 <__subdf3+0x47c>
    f754:	ba078ae3          	beqz	a5,f308 <__subdf3+0x490>
    f758:	413f06b3          	sub	a3,t5,s3
    f75c:	00099663          	bnez	s3,f768 <__subdf3+0x8f0>
    f760:	00068793          	mv	a5,a3
    f764:	a21ff06f          	j	f184 <__subdf3+0x30c>
    f768:	03800793          	li	a5,56
    f76c:	00100913          	li	s2,1
    f770:	a6d7c4e3          	blt	a5,a3,f1d8 <__subdf3+0x360>
    f774:	008007b7          	lui	a5,0x800
    f778:	00f76733          	or	a4,a4,a5
    f77c:	a2dff06f          	j	f1a8 <__subdf3+0x330>

0000f780 <__unorddf2>:
    f780:	0145d713          	srl	a4,a1,0x14
    f784:	001007b7          	lui	a5,0x100
    f788:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    f78c:	fff74713          	not	a4,a4
    f790:	0146d813          	srl	a6,a3,0x14
    f794:	00b7f5b3          	and	a1,a5,a1
    f798:	00d7f7b3          	and	a5,a5,a3
    f79c:	01571693          	sll	a3,a4,0x15
    f7a0:	7ff87813          	and	a6,a6,2047
    f7a4:	02068063          	beqz	a3,f7c4 <__unorddf2+0x44>
    f7a8:	7ff00713          	li	a4,2047
    f7ac:	00000513          	li	a0,0
    f7b0:	00e80463          	beq	a6,a4,f7b8 <__unorddf2+0x38>
    f7b4:	00008067          	ret
    f7b8:	00c7e7b3          	or	a5,a5,a2
    f7bc:	00f03533          	snez	a0,a5
    f7c0:	00008067          	ret
    f7c4:	00a5e5b3          	or	a1,a1,a0
    f7c8:	00100513          	li	a0,1
    f7cc:	fc058ee3          	beqz	a1,f7a8 <__unorddf2+0x28>
    f7d0:	00008067          	ret

0000f7d4 <__fixdfsi>:
    f7d4:	0145d793          	srl	a5,a1,0x14
    f7d8:	001006b7          	lui	a3,0x100
    f7dc:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    f7e0:	7ff7f793          	and	a5,a5,2047
    f7e4:	3fe00613          	li	a2,1022
    f7e8:	00b77733          	and	a4,a4,a1
    f7ec:	01f5d593          	srl	a1,a1,0x1f
    f7f0:	00f65e63          	bge	a2,a5,f80c <__fixdfsi+0x38>
    f7f4:	41d00613          	li	a2,1053
    f7f8:	00f65e63          	bge	a2,a5,f814 <__fixdfsi+0x40>
    f7fc:	80000537          	lui	a0,0x80000
    f800:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    f804:	00a58533          	add	a0,a1,a0
    f808:	00008067          	ret
    f80c:	00000513          	li	a0,0
    f810:	00008067          	ret
    f814:	43300613          	li	a2,1075
    f818:	40f60633          	sub	a2,a2,a5
    f81c:	01f00813          	li	a6,31
    f820:	00d76733          	or	a4,a4,a3
    f824:	02c85063          	bge	a6,a2,f844 <__fixdfsi+0x70>
    f828:	41300693          	li	a3,1043
    f82c:	40f687b3          	sub	a5,a3,a5
    f830:	00f75733          	srl	a4,a4,a5
    f834:	40e00533          	neg	a0,a4
    f838:	fc059ce3          	bnez	a1,f810 <__fixdfsi+0x3c>
    f83c:	00070513          	mv	a0,a4
    f840:	00008067          	ret
    f844:	bed78793          	add	a5,a5,-1043
    f848:	00f71733          	sll	a4,a4,a5
    f84c:	00c55533          	srl	a0,a0,a2
    f850:	00a76733          	or	a4,a4,a0
    f854:	fe1ff06f          	j	f834 <__fixdfsi+0x60>

0000f858 <__floatsidf>:
    f858:	ff010113          	add	sp,sp,-16
    f85c:	00112623          	sw	ra,12(sp)
    f860:	00812423          	sw	s0,8(sp)
    f864:	00912223          	sw	s1,4(sp)
    f868:	04050a63          	beqz	a0,f8bc <__floatsidf+0x64>
    f86c:	41f55713          	sra	a4,a0,0x1f
    f870:	00a744b3          	xor	s1,a4,a0
    f874:	40e484b3          	sub	s1,s1,a4
    f878:	00050793          	mv	a5,a0
    f87c:	00048513          	mv	a0,s1
    f880:	01f7d413          	srl	s0,a5,0x1f
    f884:	69c000ef          	jal	ff20 <__clzsi2>
    f888:	41e00793          	li	a5,1054
    f88c:	40a787b3          	sub	a5,a5,a0
    f890:	00a00713          	li	a4,10
    f894:	7ff7f793          	and	a5,a5,2047
    f898:	06a74063          	blt	a4,a0,f8f8 <__floatsidf+0xa0>
    f89c:	00b00713          	li	a4,11
    f8a0:	40a70733          	sub	a4,a4,a0
    f8a4:	00e4d733          	srl	a4,s1,a4
    f8a8:	01550513          	add	a0,a0,21
    f8ac:	00c71713          	sll	a4,a4,0xc
    f8b0:	00a494b3          	sll	s1,s1,a0
    f8b4:	00c75713          	srl	a4,a4,0xc
    f8b8:	0140006f          	j	f8cc <__floatsidf+0x74>
    f8bc:	00000413          	li	s0,0
    f8c0:	00000793          	li	a5,0
    f8c4:	00000713          	li	a4,0
    f8c8:	00000493          	li	s1,0
    f8cc:	01479793          	sll	a5,a5,0x14
    f8d0:	01f41413          	sll	s0,s0,0x1f
    f8d4:	00e7e7b3          	or	a5,a5,a4
    f8d8:	00c12083          	lw	ra,12(sp)
    f8dc:	0087e7b3          	or	a5,a5,s0
    f8e0:	00812403          	lw	s0,8(sp)
    f8e4:	00048513          	mv	a0,s1
    f8e8:	00078593          	mv	a1,a5
    f8ec:	00412483          	lw	s1,4(sp)
    f8f0:	01010113          	add	sp,sp,16
    f8f4:	00008067          	ret
    f8f8:	ff550513          	add	a0,a0,-11
    f8fc:	00a49733          	sll	a4,s1,a0
    f900:	00c71713          	sll	a4,a4,0xc
    f904:	00c75713          	srl	a4,a4,0xc
    f908:	00000493          	li	s1,0
    f90c:	fc1ff06f          	j	f8cc <__floatsidf+0x74>

0000f910 <__floatunsidf>:
    f910:	ff010113          	add	sp,sp,-16
    f914:	00812423          	sw	s0,8(sp)
    f918:	00112623          	sw	ra,12(sp)
    f91c:	00050413          	mv	s0,a0
    f920:	04050c63          	beqz	a0,f978 <__floatunsidf+0x68>
    f924:	5fc000ef          	jal	ff20 <__clzsi2>
    f928:	41e00793          	li	a5,1054
    f92c:	40a787b3          	sub	a5,a5,a0
    f930:	00a00713          	li	a4,10
    f934:	7ff7f793          	and	a5,a5,2047
    f938:	06a74463          	blt	a4,a0,f9a0 <__floatunsidf+0x90>
    f93c:	00b00713          	li	a4,11
    f940:	40a70733          	sub	a4,a4,a0
    f944:	01550513          	add	a0,a0,21
    f948:	00e45733          	srl	a4,s0,a4
    f94c:	00a41433          	sll	s0,s0,a0
    f950:	00c12083          	lw	ra,12(sp)
    f954:	00040513          	mv	a0,s0
    f958:	00c71713          	sll	a4,a4,0xc
    f95c:	00812403          	lw	s0,8(sp)
    f960:	00c75713          	srl	a4,a4,0xc
    f964:	01479793          	sll	a5,a5,0x14
    f968:	00e7e7b3          	or	a5,a5,a4
    f96c:	00078593          	mv	a1,a5
    f970:	01010113          	add	sp,sp,16
    f974:	00008067          	ret
    f978:	00c12083          	lw	ra,12(sp)
    f97c:	00040513          	mv	a0,s0
    f980:	00000793          	li	a5,0
    f984:	00812403          	lw	s0,8(sp)
    f988:	00000713          	li	a4,0
    f98c:	01479793          	sll	a5,a5,0x14
    f990:	00e7e7b3          	or	a5,a5,a4
    f994:	00078593          	mv	a1,a5
    f998:	01010113          	add	sp,sp,16
    f99c:	00008067          	ret
    f9a0:	ff550513          	add	a0,a0,-11
    f9a4:	00a41733          	sll	a4,s0,a0
    f9a8:	00000413          	li	s0,0
    f9ac:	00c12083          	lw	ra,12(sp)
    f9b0:	00040513          	mv	a0,s0
    f9b4:	00c71713          	sll	a4,a4,0xc
    f9b8:	00812403          	lw	s0,8(sp)
    f9bc:	00c75713          	srl	a4,a4,0xc
    f9c0:	01479793          	sll	a5,a5,0x14
    f9c4:	00e7e7b3          	or	a5,a5,a4
    f9c8:	00078593          	mv	a1,a5
    f9cc:	01010113          	add	sp,sp,16
    f9d0:	00008067          	ret

0000f9d4 <__trunctfdf2>:
    f9d4:	00c52583          	lw	a1,12(a0)
    f9d8:	00852783          	lw	a5,8(a0)
    f9dc:	00052803          	lw	a6,0(a0)
    f9e0:	00452683          	lw	a3,4(a0)
    f9e4:	01059613          	sll	a2,a1,0x10
    f9e8:	fe010113          	add	sp,sp,-32
    f9ec:	00159713          	sll	a4,a1,0x1
    f9f0:	01065613          	srl	a2,a2,0x10
    f9f4:	00f12423          	sw	a5,8(sp)
    f9f8:	00b12623          	sw	a1,12(sp)
    f9fc:	00f12c23          	sw	a5,24(sp)
    fa00:	01012023          	sw	a6,0(sp)
    fa04:	00d12223          	sw	a3,4(sp)
    fa08:	01012823          	sw	a6,16(sp)
    fa0c:	00d12a23          	sw	a3,20(sp)
    fa10:	00c12e23          	sw	a2,28(sp)
    fa14:	01175713          	srl	a4,a4,0x11
    fa18:	01f5d593          	srl	a1,a1,0x1f
    fa1c:	01010893          	add	a7,sp,16
    fa20:	01c10793          	add	a5,sp,28
    fa24:	00361513          	sll	a0,a2,0x3
    fa28:	ffc7a603          	lw	a2,-4(a5)
    fa2c:	ffc78793          	add	a5,a5,-4
    fa30:	01d65693          	srl	a3,a2,0x1d
    fa34:	00a6e6b3          	or	a3,a3,a0
    fa38:	00d7a223          	sw	a3,4(a5)
    fa3c:	fef894e3          	bne	a7,a5,fa24 <__trunctfdf2+0x50>
    fa40:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    fa44:	00381813          	sll	a6,a6,0x3
    fa48:	01169613          	sll	a2,a3,0x11
    fa4c:	01012823          	sw	a6,16(sp)
    fa50:	01265613          	srl	a2,a2,0x12
    fa54:	04060263          	beqz	a2,fa98 <__trunctfdf2+0xc4>
    fa58:	ffffc6b7          	lui	a3,0xffffc
    fa5c:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    fa60:	00d70733          	add	a4,a4,a3
    fa64:	7fe00693          	li	a3,2046
    fa68:	10e6d463          	bge	a3,a4,fb70 <__trunctfdf2+0x19c>
    fa6c:	7ff00793          	li	a5,2047
    fa70:	00000613          	li	a2,0
    fa74:	00000693          	li	a3,0
    fa78:	01479793          	sll	a5,a5,0x14
    fa7c:	01f59593          	sll	a1,a1,0x1f
    fa80:	00c7e7b3          	or	a5,a5,a2
    fa84:	00b7e7b3          	or	a5,a5,a1
    fa88:	00068513          	mv	a0,a3
    fa8c:	00078593          	mv	a1,a5
    fa90:	02010113          	add	sp,sp,32
    fa94:	00008067          	ret
    fa98:	01412603          	lw	a2,20(sp)
    fa9c:	01812883          	lw	a7,24(sp)
    faa0:	01c12503          	lw	a0,28(sp)
    faa4:	011666b3          	or	a3,a2,a7
    faa8:	00a6e6b3          	or	a3,a3,a0
    faac:	0106e6b3          	or	a3,a3,a6
    fab0:	04071463          	bnez	a4,faf8 <__trunctfdf2+0x124>
    fab4:	14068263          	beqz	a3,fbf8 <__trunctfdf2+0x224>
    fab8:	00500693          	li	a3,5
    fabc:	00000613          	li	a2,0
    fac0:	0036d793          	srl	a5,a3,0x3
    fac4:	01d61693          	sll	a3,a2,0x1d
    fac8:	00f6e6b3          	or	a3,a3,a5
    facc:	00961613          	sll	a2,a2,0x9
    fad0:	7ff77793          	and	a5,a4,2047
    fad4:	00c65613          	srl	a2,a2,0xc
    fad8:	01479793          	sll	a5,a5,0x14
    fadc:	01f59593          	sll	a1,a1,0x1f
    fae0:	00c7e7b3          	or	a5,a5,a2
    fae4:	00b7e7b3          	or	a5,a5,a1
    fae8:	00068513          	mv	a0,a3
    faec:	00078593          	mv	a1,a5
    faf0:	02010113          	add	sp,sp,32
    faf4:	00008067          	ret
    faf8:	12068463          	beqz	a3,fc20 <__trunctfdf2+0x24c>
    fafc:	01c8d793          	srl	a5,a7,0x1c
    fb00:	00451513          	sll	a0,a0,0x4
    fb04:	00a7e7b3          	or	a5,a5,a0
    fb08:	008006b7          	lui	a3,0x800
    fb0c:	00d7f6b3          	and	a3,a5,a3
    fb10:	1c068263          	beqz	a3,fcd4 <__trunctfdf2+0x300>
    fb14:	ff800737          	lui	a4,0xff800
    fb18:	01c65693          	srl	a3,a2,0x1c
    fb1c:	00489893          	sll	a7,a7,0x4
    fb20:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    fb24:	00e7f633          	and	a2,a5,a4
    fb28:	0116e6b3          	or	a3,a3,a7
    fb2c:	004007b7          	lui	a5,0x400
    fb30:	00f66633          	or	a2,a2,a5
    fb34:	ff86f693          	and	a3,a3,-8
    fb38:	00000793          	li	a5,0
    fb3c:	0036d713          	srl	a4,a3,0x3
    fb40:	01d61693          	sll	a3,a2,0x1d
    fb44:	00961613          	sll	a2,a2,0x9
    fb48:	00c65613          	srl	a2,a2,0xc
    fb4c:	01479793          	sll	a5,a5,0x14
    fb50:	01f59593          	sll	a1,a1,0x1f
    fb54:	00c7e7b3          	or	a5,a5,a2
    fb58:	00e6e6b3          	or	a3,a3,a4
    fb5c:	00b7e7b3          	or	a5,a5,a1
    fb60:	00068513          	mv	a0,a3
    fb64:	00078593          	mv	a1,a5
    fb68:	02010113          	add	sp,sp,32
    fb6c:	00008067          	ret
    fb70:	0ce05c63          	blez	a4,fc48 <__trunctfdf2+0x274>
    fb74:	01412783          	lw	a5,20(sp)
    fb78:	01812503          	lw	a0,24(sp)
    fb7c:	01c12603          	lw	a2,28(sp)
    fb80:	00479693          	sll	a3,a5,0x4
    fb84:	0106e6b3          	or	a3,a3,a6
    fb88:	01c7d793          	srl	a5,a5,0x1c
    fb8c:	00451813          	sll	a6,a0,0x4
    fb90:	00461613          	sll	a2,a2,0x4
    fb94:	01c55513          	srl	a0,a0,0x1c
    fb98:	00d036b3          	snez	a3,a3
    fb9c:	0107e7b3          	or	a5,a5,a6
    fba0:	00a66633          	or	a2,a2,a0
    fba4:	00f6e6b3          	or	a3,a3,a5
    fba8:	0076f793          	and	a5,a3,7
    fbac:	02078063          	beqz	a5,fbcc <__trunctfdf2+0x1f8>
    fbb0:	00f6f793          	and	a5,a3,15
    fbb4:	00400513          	li	a0,4
    fbb8:	00a78a63          	beq	a5,a0,fbcc <__trunctfdf2+0x1f8>
    fbbc:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    fbc0:	00d7b6b3          	sltu	a3,a5,a3
    fbc4:	00d60633          	add	a2,a2,a3
    fbc8:	00078693          	mv	a3,a5
    fbcc:	008007b7          	lui	a5,0x800
    fbd0:	00f677b3          	and	a5,a2,a5
    fbd4:	ee0786e3          	beqz	a5,fac0 <__trunctfdf2+0xec>
    fbd8:	00170713          	add	a4,a4,1
    fbdc:	7ff00793          	li	a5,2047
    fbe0:	e8f706e3          	beq	a4,a5,fa6c <__trunctfdf2+0x98>
    fbe4:	ff8007b7          	lui	a5,0xff800
    fbe8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    fbec:	00f67633          	and	a2,a2,a5
    fbf0:	7ff77793          	and	a5,a4,2047
    fbf4:	f49ff06f          	j	fb3c <__trunctfdf2+0x168>
    fbf8:	00000793          	li	a5,0
    fbfc:	00000613          	li	a2,0
    fc00:	01479793          	sll	a5,a5,0x14
    fc04:	01f59593          	sll	a1,a1,0x1f
    fc08:	00c7e7b3          	or	a5,a5,a2
    fc0c:	00b7e7b3          	or	a5,a5,a1
    fc10:	00068513          	mv	a0,a3
    fc14:	00078593          	mv	a1,a5
    fc18:	02010113          	add	sp,sp,32
    fc1c:	00008067          	ret
    fc20:	7ff00793          	li	a5,2047
    fc24:	00000613          	li	a2,0
    fc28:	01479793          	sll	a5,a5,0x14
    fc2c:	01f59593          	sll	a1,a1,0x1f
    fc30:	00c7e7b3          	or	a5,a5,a2
    fc34:	00b7e7b3          	or	a5,a5,a1
    fc38:	00068513          	mv	a0,a3
    fc3c:	00078593          	mv	a1,a5
    fc40:	02010113          	add	sp,sp,32
    fc44:	00008067          	ret
    fc48:	fcc00693          	li	a3,-52
    fc4c:	08d74c63          	blt	a4,a3,fce4 <__trunctfdf2+0x310>
    fc50:	03d00693          	li	a3,61
    fc54:	40e686b3          	sub	a3,a3,a4
    fc58:	01c12703          	lw	a4,28(sp)
    fc5c:	4056de13          	sra	t3,a3,0x5
    fc60:	00080eb7          	lui	t4,0x80
    fc64:	00eeeeb3          	or	t4,t4,a4
    fc68:	002e1513          	sll	a0,t3,0x2
    fc6c:	01d12e23          	sw	t4,28(sp)
    fc70:	01f6f693          	and	a3,a3,31
    fc74:	00a88833          	add	a6,a7,a0
    fc78:	00088613          	mv	a2,a7
    fc7c:	00000713          	li	a4,0
    fc80:	00062303          	lw	t1,0(a2)
    fc84:	00460613          	add	a2,a2,4
    fc88:	00676733          	or	a4,a4,t1
    fc8c:	fec81ae3          	bne	a6,a2,fc80 <__trunctfdf2+0x2ac>
    fc90:	00300613          	li	a2,3
    fc94:	41c60633          	sub	a2,a2,t3
    fc98:	04069a63          	bnez	a3,fcec <__trunctfdf2+0x318>
    fc9c:	00082803          	lw	a6,0(a6)
    fca0:	00168693          	add	a3,a3,1
    fca4:	00478793          	add	a5,a5,4
    fca8:	ff07ae23          	sw	a6,-4(a5)
    fcac:	00d64e63          	blt	a2,a3,fcc8 <__trunctfdf2+0x2f4>
    fcb0:	00a78833          	add	a6,a5,a0
    fcb4:	00082803          	lw	a6,0(a6)
    fcb8:	00168693          	add	a3,a3,1
    fcbc:	00478793          	add	a5,a5,4
    fcc0:	ff07ae23          	sw	a6,-4(a5)
    fcc4:	fed656e3          	bge	a2,a3,fcb0 <__trunctfdf2+0x2dc>
    fcc8:	00400793          	li	a5,4
    fccc:	41c787b3          	sub	a5,a5,t3
    fcd0:	0840006f          	j	fd54 <__trunctfdf2+0x380>
    fcd4:	00000593          	li	a1,0
    fcd8:	7ff00793          	li	a5,2047
    fcdc:	00080637          	lui	a2,0x80
    fce0:	d99ff06f          	j	fa78 <__trunctfdf2+0xa4>
    fce4:	00000713          	li	a4,0
    fce8:	dd1ff06f          	j	fab8 <__trunctfdf2+0xe4>
    fcec:	02050813          	add	a6,a0,32
    fcf0:	00280833          	add	a6,a6,sp
    fcf4:	ff082803          	lw	a6,-16(a6)
    fcf8:	02000f13          	li	t5,32
    fcfc:	40df0f33          	sub	t5,t5,a3
    fd00:	01e81833          	sll	a6,a6,t5
    fd04:	01076733          	or	a4,a4,a6
    fd08:	08060e63          	beqz	a2,fda4 <__trunctfdf2+0x3d0>
    fd0c:	00261813          	sll	a6,a2,0x2
    fd10:	00f80fb3          	add	t6,a6,a5
    fd14:	00a88633          	add	a2,a7,a0
    fd18:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    fd1c:	00462303          	lw	t1,4(a2)
    fd20:	00478793          	add	a5,a5,4
    fd24:	00d55533          	srl	a0,a0,a3
    fd28:	01e31333          	sll	t1,t1,t5
    fd2c:	00656533          	or	a0,a0,t1
    fd30:	fea7ae23          	sw	a0,-4(a5)
    fd34:	00460613          	add	a2,a2,4
    fd38:	feff90e3          	bne	t6,a5,fd18 <__trunctfdf2+0x344>
    fd3c:	00400793          	li	a5,4
    fd40:	41c787b3          	sub	a5,a5,t3
    fd44:	02080613          	add	a2,a6,32
    fd48:	00260633          	add	a2,a2,sp
    fd4c:	00dedeb3          	srl	t4,t4,a3
    fd50:	ffd62823          	sw	t4,-16(a2)
    fd54:	00400693          	li	a3,4
    fd58:	40f686b3          	sub	a3,a3,a5
    fd5c:	00269693          	sll	a3,a3,0x2
    fd60:	00279793          	sll	a5,a5,0x2
    fd64:	00800613          	li	a2,8
    fd68:	00f888b3          	add	a7,a7,a5
    fd6c:	00c6ea63          	bltu	a3,a2,fd80 <__trunctfdf2+0x3ac>
    fd70:	0008a023          	sw	zero,0(a7)
    fd74:	0008a223          	sw	zero,4(a7)
    fd78:	ff868693          	add	a3,a3,-8
    fd7c:	00888893          	add	a7,a7,8
    fd80:	00400793          	li	a5,4
    fd84:	00f6e463          	bltu	a3,a5,fd8c <__trunctfdf2+0x3b8>
    fd88:	0008a023          	sw	zero,0(a7)
    fd8c:	01012783          	lw	a5,16(sp)
    fd90:	00e03733          	snez	a4,a4
    fd94:	01412603          	lw	a2,20(sp)
    fd98:	00f766b3          	or	a3,a4,a5
    fd9c:	00000713          	li	a4,0
    fda0:	e09ff06f          	j	fba8 <__trunctfdf2+0x1d4>
    fda4:	00100793          	li	a5,1
    fda8:	00000813          	li	a6,0
    fdac:	f99ff06f          	j	fd44 <__trunctfdf2+0x370>

0000fdb0 <__mulsi3>:
    fdb0:	00050613          	mv	a2,a0
    fdb4:	00000513          	li	a0,0
    fdb8:	0015f693          	and	a3,a1,1
    fdbc:	00068463          	beqz	a3,fdc4 <__mulsi3+0x14>
    fdc0:	00c50533          	add	a0,a0,a2
    fdc4:	0015d593          	srl	a1,a1,0x1
    fdc8:	00161613          	sll	a2,a2,0x1
    fdcc:	fe0596e3          	bnez	a1,fdb8 <__mulsi3+0x8>
    fdd0:	00008067          	ret

0000fdd4 <__muldi3>:
    fdd4:	ff010113          	add	sp,sp,-16
    fdd8:	00812423          	sw	s0,8(sp)
    fddc:	00050413          	mv	s0,a0
    fde0:	00112623          	sw	ra,12(sp)
    fde4:	00060513          	mv	a0,a2
    fde8:	00068393          	mv	t2,a3
    fdec:	00040713          	mv	a4,s0
    fdf0:	00060813          	mv	a6,a2
    fdf4:	00000793          	li	a5,0
    fdf8:	00000313          	li	t1,0
    fdfc:	00000f13          	li	t5,0
    fe00:	01e708b3          	add	a7,a4,t5
    fe04:	00187e93          	and	t4,a6,1
    fe08:	00f30fb3          	add	t6,t1,a5
    fe0c:	01f75e13          	srl	t3,a4,0x1f
    fe10:	00185813          	srl	a6,a6,0x1
    fe14:	00e8b2b3          	sltu	t0,a7,a4
    fe18:	00179793          	sll	a5,a5,0x1
    fe1c:	000e8663          	beqz	t4,fe28 <__muldi3+0x54>
    fe20:	00088f13          	mv	t5,a7
    fe24:	01f28333          	add	t1,t0,t6
    fe28:	00171713          	sll	a4,a4,0x1
    fe2c:	01c7e7b3          	or	a5,a5,t3
    fe30:	fc0818e3          	bnez	a6,fe00 <__muldi3+0x2c>
    fe34:	00058663          	beqz	a1,fe40 <__muldi3+0x6c>
    fe38:	f79ff0ef          	jal	fdb0 <__mulsi3>
    fe3c:	00650333          	add	t1,a0,t1
    fe40:	00038a63          	beqz	t2,fe54 <__muldi3+0x80>
    fe44:	00040513          	mv	a0,s0
    fe48:	00038593          	mv	a1,t2
    fe4c:	f65ff0ef          	jal	fdb0 <__mulsi3>
    fe50:	00650333          	add	t1,a0,t1
    fe54:	00c12083          	lw	ra,12(sp)
    fe58:	00812403          	lw	s0,8(sp)
    fe5c:	000f0513          	mv	a0,t5
    fe60:	00030593          	mv	a1,t1
    fe64:	01010113          	add	sp,sp,16
    fe68:	00008067          	ret

0000fe6c <__divsi3>:
    fe6c:	06054063          	bltz	a0,fecc <__umodsi3+0x10>
    fe70:	0605c663          	bltz	a1,fedc <__umodsi3+0x20>

0000fe74 <__hidden___udivsi3>:
    fe74:	00058613          	mv	a2,a1
    fe78:	00050593          	mv	a1,a0
    fe7c:	fff00513          	li	a0,-1
    fe80:	02060c63          	beqz	a2,feb8 <__hidden___udivsi3+0x44>
    fe84:	00100693          	li	a3,1
    fe88:	00b67a63          	bgeu	a2,a1,fe9c <__hidden___udivsi3+0x28>
    fe8c:	00c05863          	blez	a2,fe9c <__hidden___udivsi3+0x28>
    fe90:	00161613          	sll	a2,a2,0x1
    fe94:	00169693          	sll	a3,a3,0x1
    fe98:	feb66ae3          	bltu	a2,a1,fe8c <__hidden___udivsi3+0x18>
    fe9c:	00000513          	li	a0,0
    fea0:	00c5e663          	bltu	a1,a2,feac <__hidden___udivsi3+0x38>
    fea4:	40c585b3          	sub	a1,a1,a2
    fea8:	00d56533          	or	a0,a0,a3
    feac:	0016d693          	srl	a3,a3,0x1
    feb0:	00165613          	srl	a2,a2,0x1
    feb4:	fe0696e3          	bnez	a3,fea0 <__hidden___udivsi3+0x2c>
    feb8:	00008067          	ret

0000febc <__umodsi3>:
    febc:	00008293          	mv	t0,ra
    fec0:	fb5ff0ef          	jal	fe74 <__hidden___udivsi3>
    fec4:	00058513          	mv	a0,a1
    fec8:	00028067          	jr	t0
    fecc:	40a00533          	neg	a0,a0
    fed0:	00b04863          	bgtz	a1,fee0 <__umodsi3+0x24>
    fed4:	40b005b3          	neg	a1,a1
    fed8:	f9dff06f          	j	fe74 <__hidden___udivsi3>
    fedc:	40b005b3          	neg	a1,a1
    fee0:	00008293          	mv	t0,ra
    fee4:	f91ff0ef          	jal	fe74 <__hidden___udivsi3>
    fee8:	40a00533          	neg	a0,a0
    feec:	00028067          	jr	t0

0000fef0 <__modsi3>:
    fef0:	00008293          	mv	t0,ra
    fef4:	0005ca63          	bltz	a1,ff08 <__modsi3+0x18>
    fef8:	00054c63          	bltz	a0,ff10 <__modsi3+0x20>
    fefc:	f79ff0ef          	jal	fe74 <__hidden___udivsi3>
    ff00:	00058513          	mv	a0,a1
    ff04:	00028067          	jr	t0
    ff08:	40b005b3          	neg	a1,a1
    ff0c:	fe0558e3          	bgez	a0,fefc <__modsi3+0xc>
    ff10:	40a00533          	neg	a0,a0
    ff14:	f61ff0ef          	jal	fe74 <__hidden___udivsi3>
    ff18:	40b00533          	neg	a0,a1
    ff1c:	00028067          	jr	t0

0000ff20 <__clzsi2>:
    ff20:	000107b7          	lui	a5,0x10
    ff24:	02f57a63          	bgeu	a0,a5,ff58 <__clzsi2+0x38>
    ff28:	10053793          	sltiu	a5,a0,256
    ff2c:	0017b793          	seqz	a5,a5
    ff30:	00379793          	sll	a5,a5,0x3
    ff34:	02000713          	li	a4,32
    ff38:	40f70733          	sub	a4,a4,a5
    ff3c:	00f55533          	srl	a0,a0,a5
    ff40:	00001797          	auipc	a5,0x1
    ff44:	b2078793          	add	a5,a5,-1248 # 10a60 <__clz_tab>
    ff48:	00a787b3          	add	a5,a5,a0
    ff4c:	0007c503          	lbu	a0,0(a5)
    ff50:	40a70533          	sub	a0,a4,a0
    ff54:	00008067          	ret
    ff58:	010007b7          	lui	a5,0x1000
    ff5c:	02f57463          	bgeu	a0,a5,ff84 <__clzsi2+0x64>
    ff60:	01000793          	li	a5,16
    ff64:	00f55533          	srl	a0,a0,a5
    ff68:	00001797          	auipc	a5,0x1
    ff6c:	af878793          	add	a5,a5,-1288 # 10a60 <__clz_tab>
    ff70:	00a787b3          	add	a5,a5,a0
    ff74:	0007c503          	lbu	a0,0(a5)
    ff78:	01000713          	li	a4,16
    ff7c:	40a70533          	sub	a0,a4,a0
    ff80:	00008067          	ret
    ff84:	01800793          	li	a5,24
    ff88:	00f55533          	srl	a0,a0,a5
    ff8c:	00001797          	auipc	a5,0x1
    ff90:	ad478793          	add	a5,a5,-1324 # 10a60 <__clz_tab>
    ff94:	00a787b3          	add	a5,a5,a0
    ff98:	0007c503          	lbu	a0,0(a5)
    ff9c:	00800713          	li	a4,8
    ffa0:	40a70533          	sub	a0,a4,a0
    ffa4:	00008067          	ret
