
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x2f0>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	0000f397          	auipc	t2,0xf
      38:	79c38393          	add	t2,t2,1948 # f7d0 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80001597          	auipc	a1,0x80001
      58:	a4058593          	add	a1,a1,-1472 # 80000a94 <__crt0_bss_end>
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
     10c:	0000f417          	auipc	s0,0xf
     110:	c4c40413          	add	s0,s0,-948 # ed58 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	c4448493          	add	s1,s1,-956 # ed58 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	21460613          	add	a2,a2,532 # 344 <main>

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
     174:	0000f417          	auipc	s0,0xf
     178:	be440413          	add	s0,s0,-1052 # ed58 <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	bdc48493          	add	s1,s1,-1060 # ed58 <__fini_array_end>

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
   CSRs (cycles & instret)
   ======================= */
static inline uint64_t rdcycle(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,mcycleh":"=r"(hi1));
     1e4:	b80025f3          	csrr	a1,mcycleh
       __asm__ volatile("csrr %0,mcycle" :"=r"(lo));
     1e8:	b0002573          	csrr	a0,mcycle
       __asm__ volatile("csrr %0,mcycleh":"=r"(hi2)); } while (hi1 != hi2);
     1ec:	b80027f3          	csrr	a5,mcycleh
     1f0:	fef59ae3          	bne	a1,a5,1e4 <rdcycle>
  return ((uint64_t)hi1 << 32) | lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,mcycle":"=r"(v)); return v;
#endif
}
     1f4:	00008067          	ret

000001f8 <rdinstret>:
static inline uint64_t rdinstret(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,minstreth":"=r"(hi1));
     1f8:	b82025f3          	csrr	a1,minstreth
       __asm__ volatile("csrr %0,minstret" :"=r"(lo));
     1fc:	b0202573          	csrr	a0,minstret
       __asm__ volatile("csrr %0,minstreth":"=r"(hi2)); } while (hi1 != hi2);
     200:	b82027f3          	csrr	a5,minstreth
     204:	fef59ae3          	bne	a1,a5,1f8 <rdinstret>
  return ((uint64_t)hi1 << 32) | lo;
#else
  uint64_t v; __asm__ volatile("csrr %0,minstret":"=r"(v)); return v;
#endif
}
     208:	00008067          	ret

0000020c <print_i32_8x8>:
}

/* =======================
   Utils
   ======================= */
static void print_i32_8x8(const char* name, const int32_t M[8][8]) {
     20c:	fe010113          	add	sp,sp,-32
     210:	00812c23          	sw	s0,24(sp)
     214:	00058413          	mv	s0,a1
  printf("%s:\n", name);
     218:	00050593          	mv	a1,a0
     21c:	0000f537          	lui	a0,0xf
     220:	d5850513          	add	a0,a0,-680 # ed58 <__fini_array_end>
static void print_i32_8x8(const char* name, const int32_t M[8][8]) {
     224:	01212823          	sw	s2,16(sp)
     228:	01312623          	sw	s3,12(sp)
     22c:	00112e23          	sw	ra,28(sp)
     230:	00912a23          	sw	s1,20(sp)
     234:	10040913          	add	s2,s0,256
  printf("%s:\n", name);
     238:	1c9000ef          	jal	c00 <printf>
  for (int i = 0; i < 8; ++i) {
    for (int j = 0; j < 8; ++j) printf("%6ld ", (long)M[i][j]);
     23c:	0000f9b7          	lui	s3,0xf
     240:	02040493          	add	s1,s0,32
     244:	00042583          	lw	a1,0(s0)
     248:	d6098513          	add	a0,s3,-672 # ed60 <__fini_array_end+0x8>
     24c:	00440413          	add	s0,s0,4
     250:	1b1000ef          	jal	c00 <printf>
     254:	fe9418e3          	bne	s0,s1,244 <print_i32_8x8+0x38>
    printf("\n");
     258:	00a00513          	li	a0,10
     25c:	1f5000ef          	jal	c50 <putchar>
  for (int i = 0; i < 8; ++i) {
     260:	fe8910e3          	bne	s2,s0,240 <print_i32_8x8+0x34>
  }
}
     264:	01c12083          	lw	ra,28(sp)
     268:	01812403          	lw	s0,24(sp)
     26c:	01412483          	lw	s1,20(sp)
     270:	01012903          	lw	s2,16(sp)
     274:	00c12983          	lw	s3,12(sp)
     278:	02010113          	add	sp,sp,32
     27c:	00008067          	ret

00000280 <print_speedup_fixed>:
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }

/* Fixed-point speedup printer (X.YYYx) */
static void print_speedup_fixed(uint64_t num, uint64_t den) {
  if (!den) { printf("  n/a    "); return; }
     280:	00d667b3          	or	a5,a2,a3
     284:	00079863          	bnez	a5,294 <print_speedup_fixed+0x14>
     288:	0000f537          	lui	a0,0xf
     28c:	d6850513          	add	a0,a0,-664 # ed68 <__fini_array_end+0x10>
     290:	1710006f          	j	c00 <printf>
static void print_speedup_fixed(uint64_t num, uint64_t den) {
     294:	fe010113          	add	sp,sp,-32
     298:	00812c23          	sw	s0,24(sp)
     29c:	00912a23          	sw	s1,20(sp)
     2a0:	00068413          	mv	s0,a3
  uint64_t s = (num * 1000ull + den/2) / den;
     2a4:	00060493          	mv	s1,a2
     2a8:	00000693          	li	a3,0
     2ac:	3e800613          	li	a2,1000
static void print_speedup_fixed(uint64_t num, uint64_t den) {
     2b0:	00112e23          	sw	ra,28(sp)
  uint64_t s = (num * 1000ull + den/2) / den;
     2b4:	0d10e0ef          	jal	eb84 <__muldi3>
     2b8:	00050793          	mv	a5,a0
     2bc:	01f41713          	sll	a4,s0,0x1f
     2c0:	0014d513          	srl	a0,s1,0x1
     2c4:	00a76533          	or	a0,a4,a0
     2c8:	00a78533          	add	a0,a5,a0
     2cc:	00145713          	srl	a4,s0,0x1
     2d0:	00f537b3          	sltu	a5,a0,a5
     2d4:	00e585b3          	add	a1,a1,a4
     2d8:	00b785b3          	add	a1,a5,a1
     2dc:	00048613          	mv	a2,s1
     2e0:	00040693          	mv	a3,s0
     2e4:	0a80b0ef          	jal	b38c <__udivdi3>
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2e8:	3e800613          	li	a2,1000
     2ec:	00000693          	li	a3,0
  uint64_t s = (num * 1000ull + den/2) / den;
     2f0:	00050493          	mv	s1,a0
     2f4:	00058413          	mv	s0,a1
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2f8:	7400b0ef          	jal	ba38 <__umoddi3>
     2fc:	00a12623          	sw	a0,12(sp)
     300:	00b12423          	sw	a1,8(sp)
     304:	3e800613          	li	a2,1000
     308:	00000693          	li	a3,0
     30c:	00048513          	mv	a0,s1
     310:	00040593          	mv	a1,s0
     314:	0780b0ef          	jal	b38c <__udivdi3>
}
     318:	01812403          	lw	s0,24(sp)
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     31c:	00c12703          	lw	a4,12(sp)
     320:	00812783          	lw	a5,8(sp)
}
     324:	01c12083          	lw	ra,28(sp)
     328:	01412483          	lw	s1,20(sp)
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     32c:	00050613          	mv	a2,a0
     330:	0000f537          	lui	a0,0xf
     334:	00058693          	mv	a3,a1
     338:	d7450513          	add	a0,a0,-652 # ed74 <__fini_array_end+0x1c>
}
     33c:	02010113          	add	sp,sp,32
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     340:	0c10006f          	j	c00 <printf>

00000344 <main>:
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     344:	ffeb07b7          	lui	a5,0xffeb0
     348:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
/* =======================
   Main
   ======================= */
int main(void) {
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);
     34c:	0000f537          	lui	a0,0xf
int main(void) {
     350:	cb010113          	add	sp,sp,-848
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);
     354:	dac50513          	add	a0,a0,-596 # edac <__fini_array_end+0x54>
int main(void) {
     358:	33312e23          	sw	s3,828(sp)
     35c:	34112623          	sw	ra,844(sp)
     360:	34812423          	sw	s0,840(sp)
     364:	34912223          	sw	s1,836(sp)
     368:	35212023          	sw	s2,832(sp)
     36c:	33412c23          	sw	s4,824(sp)
     370:	33512a23          	sw	s5,820(sp)
     374:	33612823          	sw	s6,816(sp)
     378:	33712623          	sw	s7,812(sp)
     37c:	33812423          	sw	s8,808(sp)
     380:	33912223          	sw	s9,804(sp)
     384:	33a12023          	sw	s10,800(sp)
     388:	31b12e23          	sw	s11,796(sp)
     38c:	05010993          	add	s3,sp,80
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);
     390:	071000ef          	jal	c00 <printf>
     394:	00098593          	mv	a1,s3
     398:	00100693          	li	a3,1
  /* Build 8×8 test matrices */
  int8_t  A[8][8], B[8][8];
  int32_t C_sw[8][8], C_hw[8][8];

  for (int i = 0; i < 8; ++i)
    for (int k = 0; k < 8; ++k) A[i][k] = pattA(i, k);
     39c:	00800813          	li	a6,8
  for (int i = 0; i < 8; ++i)
     3a0:	00900893          	li	a7,9
    for (int k = 0; k < 8; ++k) A[i][k] = pattA(i, k);
     3a4:	0ff6f613          	zext.b	a2,a3
     3a8:	00261793          	sll	a5,a2,0x2
     3ac:	40f607b3          	sub	a5,a2,a5
     3b0:	0ff7f793          	zext.b	a5,a5
     3b4:	00000713          	li	a4,0
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     3b8:	00f7f513          	and	a0,a5,15
    for (int k = 0; k < 8; ++k) A[i][k] = pattA(i, k);
     3bc:	00e58333          	add	t1,a1,a4
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     3c0:	ff850513          	add	a0,a0,-8
    for (int k = 0; k < 8; ++k) A[i][k] = pattA(i, k);
     3c4:	00f607b3          	add	a5,a2,a5
     3c8:	00a30023          	sb	a0,0(t1)
     3cc:	00170713          	add	a4,a4,1
     3d0:	0ff7f793          	zext.b	a5,a5
     3d4:	ff0712e3          	bne	a4,a6,3b8 <main+0x74>
  for (int i = 0; i < 8; ++i)
     3d8:	00168693          	add	a3,a3,1
     3dc:	00858593          	add	a1,a1,8
     3e0:	fd1692e3          	bne	a3,a7,3a4 <main+0x60>
     3e4:	09010613          	add	a2,sp,144
     3e8:	00500713          	li	a4,5

  for (int k = 0; k < 8; ++k)
    for (int j = 0; j < 8; ++j) B[k][j] = pattB(k, j);
     3ec:	00800513          	li	a0,8
  for (int k = 0; k < 8; ++k)
     3f0:	0fd00813          	li	a6,253
    for (int j = 0; j < 8; ++j) B[k][j] = pattB(k, j);
     3f4:	40e007b3          	neg	a5,a4
     3f8:	00179793          	sll	a5,a5,0x1
     3fc:	0ff7f793          	zext.b	a5,a5
     400:	00000693          	li	a3,0
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     404:	00f7f593          	and	a1,a5,15
    for (int j = 0; j < 8; ++j) B[k][j] = pattB(k, j);
     408:	00d608b3          	add	a7,a2,a3
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     40c:	ff858593          	add	a1,a1,-8
    for (int j = 0; j < 8; ++j) B[k][j] = pattB(k, j);
     410:	00f707b3          	add	a5,a4,a5
     414:	00b88023          	sb	a1,0(a7)
     418:	00168693          	add	a3,a3,1
     41c:	0ff7f793          	zext.b	a5,a5
     420:	fea692e3          	bne	a3,a0,404 <main+0xc0>
  for (int k = 0; k < 8; ++k)
     424:	fff70713          	add	a4,a4,-1
     428:	0ff77713          	zext.b	a4,a4
     42c:	00860613          	add	a2,a2,8
     430:	fd0712e3          	bne	a4,a6,3f4 <main+0xb0>

  /* ---- SW timing ---- */
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     434:	db1ff0ef          	jal	1e4 <rdcycle>
     438:	00050493          	mv	s1,a0
     43c:	00058b93          	mv	s7,a1
     440:	db9ff0ef          	jal	1f8 <rdinstret>
     444:	00050413          	mv	s0,a0
     448:	00058a13          	mv	s4,a1
  for (int i = 0; i < 8; ++i)
     44c:	21010a93          	add	s5,sp,528
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     450:	00098c93          	mv	s9,s3
     454:	11010c13          	add	s8,sp,272
    for (int j = 0; j < 8; ++j) {
     458:	00000913          	li	s2,0
     45c:	03c0006f          	j	498 <main+0x154>
      for (int k = 0; k < 8; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     460:	016c87b3          	add	a5,s9,s6
     464:	000d8583          	lb	a1,0(s11)
     468:	00078503          	lb	a0,0(a5)
     46c:	001b0b13          	add	s6,s6,1
     470:	008d8d93          	add	s11,s11,8
     474:	6ec0e0ef          	jal	eb60 <__mulsi3>
     478:	00800713          	li	a4,8
     47c:	00ad0d33          	add	s10,s10,a0
     480:	feeb10e3          	bne	s6,a4,460 <main+0x11c>
      C[i][j] = s;
     484:	00291793          	sll	a5,s2,0x2
     488:	00fc07b3          	add	a5,s8,a5
     48c:	01a7a023          	sw	s10,0(a5)
    for (int j = 0; j < 8; ++j) {
     490:	00190913          	add	s2,s2,1
     494:	01690c63          	beq	s2,s6,4ac <main+0x168>
      for (int k = 0; k < 8; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     498:	09010793          	add	a5,sp,144
     49c:	01278db3          	add	s11,a5,s2
      int32_t s = 0;
     4a0:	00000d13          	li	s10,0
      for (int k = 0; k < 8; ++k) s += (int32_t)A[i][k] * (int32_t)B[k][j];
     4a4:	00000b13          	li	s6,0
     4a8:	fb9ff06f          	j	460 <main+0x11c>
  for (int i = 0; i < 8; ++i)
     4ac:	020c0c13          	add	s8,s8,32
     4b0:	008c8c93          	add	s9,s9,8
     4b4:	fb8a92e3          	bne	s5,s8,458 <main+0x114>
  gemm_ref_8x8(A, B, C_sw);
  uint64_t i1 = rdinstret(), c1 = rdcycle();
     4b8:	d41ff0ef          	jal	1f8 <rdinstret>
     4bc:	00050913          	mv	s2,a0
     4c0:	00058b13          	mv	s6,a1
     4c4:	d21ff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc = c1 - c0, sw_ins = i1 - i0;
     4c8:	409507b3          	sub	a5,a0,s1
     4cc:	417585b3          	sub	a1,a1,s7
     4d0:	00f12423          	sw	a5,8(sp)
     4d4:	00f537b3          	sltu	a5,a0,a5
     4d8:	40f587b3          	sub	a5,a1,a5
     4dc:	00f12823          	sw	a5,16(sp)
     4e0:	408907b3          	sub	a5,s2,s0
     4e4:	414b0b33          	sub	s6,s6,s4
     4e8:	00f93933          	sltu	s2,s2,a5
     4ec:	00f12623          	sw	a5,12(sp)
     4f0:	412b07b3          	sub	a5,s6,s2
     4f4:	00f12a23          	sw	a5,20(sp)

  /* ---- CFS timing ---- */
  c0 = rdcycle(); i0 = rdinstret();
     4f8:	cedff0ef          	jal	1e4 <rdcycle>
     4fc:	00a12c23          	sw	a0,24(sp)
     500:	00b12e23          	sw	a1,28(sp)
     504:	80001c37          	lui	s8,0x80001
     508:	cf1ff0ef          	jal	1f8 <rdinstret>
     50c:	80000bb7          	lui	s7,0x80000
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     510:	ffeb0db7          	lui	s11,0xffeb0
  c0 = rdcycle(); i0 = rdinstret();
     514:	02a12023          	sw	a0,32(sp)
     518:	02b12223          	sw	a1,36(sp)
     51c:	000a8d13          	mv	s10,s5
  for (int i0 = 0; i0 < 8; i0 += 4) {
     520:	00000413          	li	s0,0
     524:	834c0493          	add	s1,s8,-1996 # 80000834 <A_flat.1>
     528:	734b8b13          	add	s6,s7,1844 # 80000734 <B_flat.0>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     52c:	004d8d93          	add	s11,s11,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
    for (int j0 = 0; j0 < 8; j0 += 4) {
     530:	000d0c93          	mv	s9,s10
     534:	00000a13          	li	s4,0
     538:	2740006f          	j	7ac <main+0x468>
        for (int k = 0; k < 8; ++k) A_flat[r*LDA + k] = A[i0 + r][k];
     53c:	0007a703          	lw	a4,0(a5)
        for (int k = 8; k < MAXK; ++k) A_flat[r*LDA + k] = 0;
     540:	00890513          	add	a0,s2,8
     544:	03800613          	li	a2,56
        for (int k = 0; k < 8; ++k) A_flat[r*LDA + k] = A[i0 + r][k];
     548:	00e92023          	sw	a4,0(s2)
     54c:	0047a703          	lw	a4,4(a5)
        for (int k = 8; k < MAXK; ++k) A_flat[r*LDA + k] = 0;
     550:	00000593          	li	a1,0
        for (int k = 0; k < 8; ++k) A_flat[r*LDA + k] = A[i0 + r][k];
     554:	02f12423          	sw	a5,40(sp)
     558:	00e92223          	sw	a4,4(s2)
        for (int k = 8; k < MAXK; ++k) A_flat[r*LDA + k] = 0;
     55c:	059000ef          	jal	db4 <memset>
      for (int r = 0; r < 4; ++r) {
     560:	02812783          	lw	a5,40(sp)
     564:	80001737          	lui	a4,0x80001
     568:	04090913          	add	s2,s2,64
     56c:	93470713          	add	a4,a4,-1740 # 80000934 <__malloc_current_mallinfo>
     570:	00878793          	add	a5,a5,8
     574:	fd2714e3          	bne	a4,s2,53c <main+0x1f8>
     578:	09010793          	add	a5,sp,144
     57c:	00fa0733          	add	a4,s4,a5
     580:	734b8793          	add	a5,s7,1844
        B_flat[k*LDB + 0] = B[k][j0 + 0];
     584:	00074683          	lbu	a3,0(a4)
      for (int k = 0; k < 8; ++k) {
     588:	00478793          	add	a5,a5,4
     58c:	00870713          	add	a4,a4,8
        B_flat[k*LDB + 0] = B[k][j0 + 0];
     590:	fed78e23          	sb	a3,-4(a5)
        B_flat[k*LDB + 1] = B[k][j0 + 1];
     594:	ff974683          	lbu	a3,-7(a4)
     598:	fed78ea3          	sb	a3,-3(a5)
        B_flat[k*LDB + 2] = B[k][j0 + 2];
     59c:	ffa74683          	lbu	a3,-6(a4)
     5a0:	fed78f23          	sb	a3,-2(a5)
        B_flat[k*LDB + 3] = B[k][j0 + 3];
     5a4:	ffb74683          	lbu	a3,-5(a4)
     5a8:	fed78fa3          	sb	a3,-1(a5)
      for (int k = 0; k < 8; ++k) {
     5ac:	800006b7          	lui	a3,0x80000
     5b0:	75468693          	add	a3,a3,1876 # 80000754 <B_flat.0+0x20>
     5b4:	fcf698e3          	bne	a3,a5,584 <main+0x240>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5b8:	ffeb07b7          	lui	a5,0xffeb0
     5bc:	00200713          	li	a4,2
     5c0:	ffeb0537          	lui	a0,0xffeb0
     5c4:	ffeb0837          	lui	a6,0xffeb0
     5c8:	ffeb08b7          	lui	a7,0xffeb0
     5cc:	ffeb0337          	lui	t1,0xffeb0
     5d0:	ffeb0e37          	lui	t3,0xffeb0
     5d4:	ffeb0eb7          	lui	t4,0xffeb0
     5d8:	ffeb0f37          	lui	t5,0xffeb0
     5dc:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
     5e0:	00700f93          	li	t6,7
  for (int t = 0; t < T; t += 4) {
     5e4:	00000793          	li	a5,0
      for (int s = 0; s < 4; ++s) {
     5e8:	00400713          	li	a4,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5ec:	00850513          	add	a0,a0,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     5f0:	00c80813          	add	a6,a6,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     5f4:	01088893          	add	a7,a7,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     5f8:	01430313          	add	t1,t1,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     5fc:	018e0e13          	add	t3,t3,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     600:	01ce8e93          	add	t4,t4,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     604:	020f0f13          	add	t5,t5,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
    int8_t a_bytes[4][4] = {{0}};
     608:	02012823          	sw	zero,48(sp)
     60c:	02012a23          	sw	zero,52(sp)
     610:	02012c23          	sw	zero,56(sp)
     614:	02012e23          	sw	zero,60(sp)
    int8_t b_bytes[4][4] = {{0}};
     618:	04012023          	sw	zero,64(sp)
     61c:	04012223          	sw	zero,68(sp)
     620:	04012423          	sw	zero,72(sp)
     624:	04012623          	sw	zero,76(sp)
    for (int i = 0; i < 4; ++i)
     628:	03010393          	add	t2,sp,48
    int8_t b_bytes[4][4] = {{0}};
     62c:	00048293          	mv	t0,s1
    for (int i = 0; i < 4; ++i)
     630:	00000593          	li	a1,0
      for (int s = 0; s < 4; ++s) {
     634:	40b78633          	sub	a2,a5,a1
     638:	00000693          	li	a3,0
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
     63c:	00cfea63          	bltu	t6,a2,650 <main+0x30c>
     640:	00c28933          	add	s2,t0,a2
     644:	00094903          	lbu	s2,0(s2)
     648:	00d380b3          	add	ra,t2,a3
     64c:	01208023          	sb	s2,0(ra)
      for (int s = 0; s < 4; ++s) {
     650:	00168693          	add	a3,a3,1
     654:	00160613          	add	a2,a2,1
     658:	fee692e3          	bne	a3,a4,63c <main+0x2f8>
    for (int i = 0; i < 4; ++i)
     65c:	00158593          	add	a1,a1,1
     660:	04028293          	add	t0,t0,64
     664:	00438393          	add	t2,t2,4
     668:	fce596e3          	bne	a1,a4,634 <main+0x2f0>
     66c:	04010593          	add	a1,sp,64
    for (int j = 0; j < 4; ++j)
     670:	00000913          	li	s2,0
      for (int s = 0; s < 4; ++s) {
     674:	41278633          	sub	a2,a5,s2
     678:	00000693          	li	a3,0
        if (k >= 0 && k < K) b_bytes[j][s] = B_flat[k*LDB + j];
     67c:	012b03b3          	add	t2,s6,s2
     680:	00cfec63          	bltu	t6,a2,698 <main+0x354>
     684:	00261093          	sll	ra,a2,0x2
     688:	001380b3          	add	ra,t2,ra
     68c:	0000c083          	lbu	ra,0(ra)
     690:	00d582b3          	add	t0,a1,a3
     694:	00128023          	sb	ra,0(t0)
      for (int s = 0; s < 4; ++s) {
     698:	00168693          	add	a3,a3,1
     69c:	00160613          	add	a2,a2,1
     6a0:	fee690e3          	bne	a3,a4,680 <main+0x33c>
    for (int j = 0; j < 4; ++j)
     6a4:	00190913          	add	s2,s2,1
     6a8:	00458593          	add	a1,a1,4
     6ac:	fce914e3          	bne	s2,a4,674 <main+0x330>
         (((uint32_t)(uint8_t)x2) << 16) |
     6b0:	03012683          	lw	a3,48(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6b4:	00200613          	li	a2,2
     6b8:	00dda023          	sw	a3,0(s11)
         (((uint32_t)(uint8_t)x2) << 16) |
     6bc:	03412683          	lw	a3,52(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6c0:	00d52023          	sw	a3,0(a0)
         (((uint32_t)(uint8_t)x2) << 16) |
     6c4:	03812683          	lw	a3,56(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6c8:	00d82023          	sw	a3,0(a6)
         (((uint32_t)(uint8_t)x2) << 16) |
     6cc:	03c12683          	lw	a3,60(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6d0:	00d8a023          	sw	a3,0(a7)
         (((uint32_t)(uint8_t)x2) << 16) |
     6d4:	04012683          	lw	a3,64(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6d8:	00d32023          	sw	a3,0(t1)
         (((uint32_t)(uint8_t)x2) << 16) |
     6dc:	04412683          	lw	a3,68(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6e0:	00de2023          	sw	a3,0(t3)
         (((uint32_t)(uint8_t)x2) << 16) |
     6e4:	04812683          	lw	a3,72(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6e8:	00dea023          	sw	a3,0(t4)
         (((uint32_t)(uint8_t)x2) << 16) |
     6ec:	04c12683          	lw	a3,76(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6f0:	00df2023          	sw	a3,0(t5)
    int steps = (t + 4 <= T) ? 4 : (T - t);
     6f4:	00a00693          	li	a3,10
     6f8:	00f6c463          	blt	a3,a5,700 <main+0x3bc>
     6fc:	00400613          	li	a2,4
    for (int s = 0; s < steps; ++s) cfs_step();
     700:	00000693          	li	a3,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     704:	ffeb05b7          	lui	a1,0xffeb0
     708:	00100293          	li	t0,1
     70c:	0055a023          	sw	t0,0(a1) # ffeb0000 <__crt0_ram_last+0x7fe30001>
    for (int s = 0; s < steps; ++s) cfs_step();
     710:	00168693          	add	a3,a3,1
     714:	fec698e3          	bne	a3,a2,704 <main+0x3c0>
  for (int t = 0; t < T; t += 4) {
     718:	00478793          	add	a5,a5,4
     71c:	01000693          	li	a3,16
     720:	eed794e3          	bne	a5,a3,608 <main+0x2c4>
     724:	0d010593          	add	a1,sp,208
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     728:	ffeb0637          	lui	a2,0xffeb0
  for (int t = 0; t < T; t += 4) {
     72c:	00058513          	mv	a0,a1
     730:	00000713          	li	a4,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     734:	04060613          	add	a2,a2,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
    for (int j = 0; j < 4; ++j)
     738:	01000813          	li	a6,16
     73c:	00271693          	sll	a3,a4,0x2
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     740:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     744:	00c686b3          	add	a3,a3,a2
     748:	00f688b3          	add	a7,a3,a5
     74c:	0008a303          	lw	t1,0(a7)
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     750:	00f508b3          	add	a7,a0,a5
    for (int j = 0; j < 4; ++j)
     754:	00478793          	add	a5,a5,4
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     758:	0068a023          	sw	t1,0(a7)
    for (int j = 0; j < 4; ++j)
     75c:	ff0796e3          	bne	a5,a6,748 <main+0x404>
  for (int i = 0; i < 4; ++i)
     760:	00470713          	add	a4,a4,4
     764:	01050513          	add	a0,a0,16
     768:	fcf71ae3          	bne	a4,a5,73c <main+0x3f8>
     76c:	04058713          	add	a4,a1,64
     770:	000c8793          	mv	a5,s9
          C[i0 + r][j0 + c] = C4[r][c];
     774:	00078513          	mv	a0,a5
     778:	01000613          	li	a2,16
     77c:	02e12623          	sw	a4,44(sp)
     780:	02b12423          	sw	a1,40(sp)
     784:	70c000ef          	jal	e90 <memcpy>
      for (int r = 0; r < 4; ++r)
     788:	02812583          	lw	a1,40(sp)
     78c:	02c12703          	lw	a4,44(sp)
     790:	02050793          	add	a5,a0,32
     794:	01058593          	add	a1,a1,16
     798:	fcb71ee3          	bne	a4,a1,774 <main+0x430>
    for (int j0 = 0; j0 < 8; j0 += 4) {
     79c:	00400793          	li	a5,4
     7a0:	010c8c93          	add	s9,s9,16
     7a4:	00fa0a63          	beq	s4,a5,7b8 <main+0x474>
     7a8:	00090a13          	mv	s4,s2
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     7ac:	00098793          	mv	a5,s3
     7b0:	834c0913          	add	s2,s8,-1996
     7b4:	d89ff06f          	j	53c <main+0x1f8>
  for (int i0 = 0; i0 < 8; i0 += 4) {
     7b8:	02098993          	add	s3,s3,32
     7bc:	080d0d13          	add	s10,s10,128
     7c0:	01440663          	beq	s0,s4,7cc <main+0x488>
     7c4:	00400413          	li	s0,4
     7c8:	d69ff06f          	j	530 <main+0x1ec>
  cfs_gemm_8x8(A, B, C_hw);
  i1 = rdinstret(); c1 = rdcycle();
     7cc:	a2dff0ef          	jal	1f8 <rdinstret>
     7d0:	00050a13          	mv	s4,a0
     7d4:	00058913          	mv	s2,a1
     7d8:	a0dff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc = c1 - c0, cfs_ins = i1 - i0;
     7dc:	01812783          	lw	a5,24(sp)
     7e0:	00000713          	li	a4,0
    for (int j = 0; j < 8; ++j)
     7e4:	02000813          	li	a6,32
  uint64_t cfs_cyc = c1 - c0, cfs_ins = i1 - i0;
     7e8:	40f50b33          	sub	s6,a0,a5
     7ec:	01c12783          	lw	a5,28(sp)
     7f0:	01653533          	sltu	a0,a0,s6
  for (int i = 0; i < 8; ++i)
     7f4:	10000893          	li	a7,256
  uint64_t cfs_cyc = c1 - c0, cfs_ins = i1 - i0;
     7f8:	40f589b3          	sub	s3,a1,a5
     7fc:	02012783          	lw	a5,32(sp)
     800:	40a989b3          	sub	s3,s3,a0
     804:	40fa0bb3          	sub	s7,s4,a5
     808:	02412783          	lw	a5,36(sp)
     80c:	017a3a33          	sltu	s4,s4,s7
     810:	40f90933          	sub	s2,s2,a5
     814:	41490933          	sub	s2,s2,s4
      if (A[i][j] != B[i][j]) return 0;
     818:	11010793          	add	a5,sp,272
     81c:	00f705b3          	add	a1,a4,a5
     820:	00ea8533          	add	a0,s5,a4
     824:	00000793          	li	a5,0
     828:	00f50633          	add	a2,a0,a5
     82c:	00f586b3          	add	a3,a1,a5
     830:	00062603          	lw	a2,0(a2)
     834:	0006a683          	lw	a3,0(a3)
     838:	00d61e63          	bne	a2,a3,854 <main+0x510>
    for (int j = 0; j < 8; ++j)
     83c:	00478793          	add	a5,a5,4
     840:	ff0794e3          	bne	a5,a6,828 <main+0x4e4>
  for (int i = 0; i < 8; ++i)
     844:	02070713          	add	a4,a4,32
     848:	fd1718e3          	bne	a4,a7,818 <main+0x4d4>
  return 1;
     84c:	00100a13          	li	s4,1
     850:	0080006f          	j	858 <main+0x514>
      if (A[i][j] != B[i][j]) return 0;
     854:	00000a13          	li	s4,0

  /* Verify */
  int ok = cmp_8x8(C_hw, C_sw);

  /* Print matrices (optional, comment out if noisy) */
  print_i32_8x8("C (HW)", C_hw);
     858:	0000f537          	lui	a0,0xf
     85c:	21010593          	add	a1,sp,528
     860:	dd450513          	add	a0,a0,-556 # edd4 <__fini_array_end+0x7c>
     864:	9a9ff0ef          	jal	20c <print_i32_8x8>
  print_i32_8x8("C (SW)", C_sw);
     868:	0000f537          	lui	a0,0xf
     86c:	11010593          	add	a1,sp,272
     870:	ddc50513          	add	a0,a0,-548 # eddc <__fini_array_end+0x84>
     874:	999ff0ef          	jal	20c <print_i32_8x8>

  /* Summary table */
  printf("\n8x8 timing summary\n");
     878:	0000f537          	lui	a0,0xf
     87c:	de450513          	add	a0,a0,-540 # ede4 <__fini_array_end+0x8c>
     880:	514000ef          	jal	d94 <puts>
  printf("Path |   cycles   |  instret   |  Speedup(cyc)  | Speedup(inst)\n");
     884:	0000f537          	lui	a0,0xf
     888:	df850513          	add	a0,a0,-520 # edf8 <__fini_array_end+0xa0>
     88c:	508000ef          	jal	d94 <puts>
  printf("-----+------------+------------+----------------+---------------\n");
     890:	0000f537          	lui	a0,0xf
     894:	e3850513          	add	a0,a0,-456 # ee38 <__fini_array_end+0xe0>
     898:	4fc000ef          	jal	d94 <puts>
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |       --       |      --      \n", sw_cyc,  sw_ins);
     89c:	00c12703          	lw	a4,12(sp)
     8a0:	01412783          	lw	a5,20(sp)
     8a4:	00812603          	lw	a2,8(sp)
     8a8:	01012683          	lw	a3,16(sp)
     8ac:	0000f537          	lui	a0,0xf
     8b0:	e7c50513          	add	a0,a0,-388 # ee7c <__fini_array_end+0x124>
     8b4:	34c000ef          	jal	c00 <printf>
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins);
     8b8:	0000f537          	lui	a0,0xf
     8bc:	000b8713          	mv	a4,s7
     8c0:	00090793          	mv	a5,s2
     8c4:	000b0613          	mv	a2,s6
     8c8:	00098693          	mv	a3,s3
     8cc:	eb850513          	add	a0,a0,-328 # eeb8 <__fini_array_end+0x160>
     8d0:	330000ef          	jal	c00 <printf>
  print_speedup_fixed(sw_cyc,  cfs_cyc);  printf("     |  ");
     8d4:	01012583          	lw	a1,16(sp)
     8d8:	00812503          	lw	a0,8(sp)
     8dc:	000b0613          	mv	a2,s6
     8e0:	00098693          	mv	a3,s3
     8e4:	99dff0ef          	jal	280 <print_speedup_fixed>
     8e8:	0000f537          	lui	a0,0xf
     8ec:	ed450513          	add	a0,a0,-300 # eed4 <__fini_array_end+0x17c>
     8f0:	310000ef          	jal	c00 <printf>
  print_speedup_fixed(sw_ins,  cfs_ins);  printf("\n");
     8f4:	00c12503          	lw	a0,12(sp)
     8f8:	01412583          	lw	a1,20(sp)
     8fc:	000b8613          	mv	a2,s7
     900:	00090693          	mv	a3,s2
     904:	97dff0ef          	jal	280 <print_speedup_fixed>
     908:	00a00513          	li	a0,10
     90c:	344000ef          	jal	c50 <putchar>

  printf("\nVerdict: %s\n", ok ? "PASS (HW matches SW)" : "FAIL (mismatch)");
     910:	040a0c63          	beqz	s4,968 <main+0x624>
     914:	0000f5b7          	lui	a1,0xf
     918:	d8458593          	add	a1,a1,-636 # ed84 <__fini_array_end+0x2c>
     91c:	0000f537          	lui	a0,0xf
     920:	ee050513          	add	a0,a0,-288 # eee0 <__fini_array_end+0x188>
     924:	2dc000ef          	jal	c00 <printf>
  return ok ? 0 : 1;
}
     928:	34c12083          	lw	ra,844(sp)
     92c:	34812403          	lw	s0,840(sp)
     930:	34412483          	lw	s1,836(sp)
     934:	34012903          	lw	s2,832(sp)
     938:	33c12983          	lw	s3,828(sp)
     93c:	33412a83          	lw	s5,820(sp)
     940:	33012b03          	lw	s6,816(sp)
     944:	32c12b83          	lw	s7,812(sp)
     948:	32812c03          	lw	s8,808(sp)
     94c:	32412c83          	lw	s9,804(sp)
     950:	32012d03          	lw	s10,800(sp)
     954:	31c12d83          	lw	s11,796(sp)
     958:	001a4513          	xor	a0,s4,1
     95c:	33812a03          	lw	s4,824(sp)
     960:	35010113          	add	sp,sp,848
     964:	00008067          	ret
  printf("\nVerdict: %s\n", ok ? "PASS (HW matches SW)" : "FAIL (mismatch)");
     968:	0000f5b7          	lui	a1,0xf
     96c:	d9c58593          	add	a1,a1,-612 # ed9c <__fini_array_end+0x44>
     970:	fadff06f          	j	91c <main+0x5d8>

00000974 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     974:	fffff097          	auipc	ra,0xfffff
     978:	7e408093          	add	ra,ra,2020 # 158 <__crt0_main_exit>
     97c:	00050513          	mv	a0,a0
     980:	00008067          	ret

00000984 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     984:	fff00513          	li	a0,-1
     988:	00008067          	ret

0000098c <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     98c:	000027b7          	lui	a5,0x2
     990:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     994:	00000513          	li	a0,0
     998:	00008067          	ret

0000099c <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     99c:	00100513          	li	a0,1
     9a0:	00008067          	ret

000009a4 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     9a4:	00100513          	li	a0,1
     9a8:	00008067          	ret

000009ac <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     9ac:	800007b7          	lui	a5,0x80000
     9b0:	01600713          	li	a4,22
     9b4:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     9b8:	fff00513          	li	a0,-1
     9bc:	00008067          	ret

000009c0 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     9c0:	00000513          	li	a0,0
     9c4:	00008067          	ret

000009c8 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     9c8:	fe010113          	add	sp,sp,-32
     9cc:	00912a23          	sw	s1,20(sp)
     9d0:	01212823          	sw	s2,16(sp)
     9d4:	00112e23          	sw	ra,28(sp)
     9d8:	00812c23          	sw	s0,24(sp)
     9dc:	01312623          	sw	s3,12(sp)
     9e0:	01412423          	sw	s4,8(sp)
     9e4:	00058913          	mv	s2,a1
     9e8:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     9ec:	06051463          	bnez	a0,a54 <_read+0x8c>
     9f0:	00050413          	mv	s0,a0
     9f4:	fff50537          	lui	a0,0xfff50
     9f8:	1a0000ef          	jal	b98 <neorv32_uart_available>
     9fc:	04050c63          	beqz	a0,a54 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a00:	00a00993          	li	s3,10
     a04:	00d00a13          	li	s4,13
    while (len--) {
     a08:	00941663          	bne	s0,s1,a14 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     a0c:	00048413          	mv	s0,s1
     a10:	0200006f          	j	a30 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     a14:	fff50537          	lui	a0,0xfff50
     a18:	1d0000ef          	jal	be8 <neorv32_uart_getc>
      *ptr++ = c;
     a1c:	008907b3          	add	a5,s2,s0
     a20:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     a24:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a28:	01350463          	beq	a0,s3,a30 <_read+0x68>
     a2c:	fd451ee3          	bne	a0,s4,a08 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     a30:	01c12083          	lw	ra,28(sp)
     a34:	00040513          	mv	a0,s0
     a38:	01812403          	lw	s0,24(sp)
     a3c:	01412483          	lw	s1,20(sp)
     a40:	01012903          	lw	s2,16(sp)
     a44:	00c12983          	lw	s3,12(sp)
     a48:	00812a03          	lw	s4,8(sp)
     a4c:	02010113          	add	sp,sp,32
     a50:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     a54:	fff60537          	lui	a0,0xfff60
     a58:	140000ef          	jal	b98 <neorv32_uart_available>
  int read_cnt = 0;
     a5c:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     a60:	02050863          	beqz	a0,a90 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a64:	00a00993          	li	s3,10
     a68:	00d00a13          	li	s4,13
    while (len--) {
     a6c:	fa9400e3          	beq	s0,s1,a0c <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     a70:	fff60537          	lui	a0,0xfff60
     a74:	174000ef          	jal	be8 <neorv32_uart_getc>
      *ptr++ = c;
     a78:	008907b3          	add	a5,s2,s0
     a7c:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     a80:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a84:	fb3506e3          	beq	a0,s3,a30 <_read+0x68>
     a88:	ff4512e3          	bne	a0,s4,a6c <_read+0xa4>
     a8c:	fa5ff06f          	j	a30 <_read+0x68>
    errno = ENOSYS;
     a90:	800007b7          	lui	a5,0x80000
     a94:	05800713          	li	a4,88
     a98:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     a9c:	fff00413          	li	s0,-1
     aa0:	f91ff06f          	j	a30 <_read+0x68>

00000aa4 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     aa4:	ff010113          	add	sp,sp,-16
     aa8:	00812423          	sw	s0,8(sp)
     aac:	00912223          	sw	s1,4(sp)
     ab0:	00112623          	sw	ra,12(sp)
     ab4:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     ab8:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     abc:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     ac0:	00058413          	mv	s0,a1
     ac4:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     ac8:	04a7ec63          	bltu	a5,a0,b20 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     acc:	fff50537          	lui	a0,0xfff50
     ad0:	0c8000ef          	jal	b98 <neorv32_uart_available>
     ad4:	00940933          	add	s2,s0,s1
     ad8:	02051463          	bnez	a0,b00 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     adc:	800007b7          	lui	a5,0x80000
     ae0:	05800713          	li	a4,88
     ae4:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     ae8:	fff00493          	li	s1,-1
     aec:	0180006f          	j	b04 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     af0:	00044583          	lbu	a1,0(s0)
     af4:	fff50537          	lui	a0,0xfff50
     af8:	00140413          	add	s0,s0,1
     afc:	0d8000ef          	jal	bd4 <neorv32_uart_putc>
      while (len--) {
     b00:	fe8918e3          	bne	s2,s0,af0 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     b04:	00c12083          	lw	ra,12(sp)
     b08:	00812403          	lw	s0,8(sp)
     b0c:	00012903          	lw	s2,0(sp)
     b10:	00048513          	mv	a0,s1
     b14:	00412483          	lw	s1,4(sp)
     b18:	01010113          	add	sp,sp,16
     b1c:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     b20:	fff60537          	lui	a0,0xfff60
     b24:	074000ef          	jal	b98 <neorv32_uart_available>
     b28:	00940933          	add	s2,s0,s1
     b2c:	fa0508e3          	beqz	a0,adc <_write+0x38>
    while (len--) {
     b30:	fd240ae3          	beq	s0,s2,b04 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     b34:	00044583          	lbu	a1,0(s0)
     b38:	fff60537          	lui	a0,0xfff60
     b3c:	00140413          	add	s0,s0,1
     b40:	094000ef          	jal	bd4 <neorv32_uart_putc>
      write_cnt++;
     b44:	fedff06f          	j	b30 <_write+0x8c>

00000b48 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     b48:	80000737          	lui	a4,0x80000
     b4c:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     b50:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     b54:	00050793          	mv	a5,a0
     b58:	a9460613          	add	a2,a2,-1388 # 80000a94 <__crt0_bss_end>
  if (curr_heap == NULL) {
     b5c:	00069463          	bnez	a3,b64 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     b60:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     b64:	800016b7          	lui	a3,0x80001
     b68:	a9468693          	add	a3,a3,-1388 # 80000a94 <__crt0_bss_end>
     b6c:	00c69c63          	bne	a3,a2,b84 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     b70:	800007b7          	lui	a5,0x80000
     b74:	00c00713          	li	a4,12
     b78:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     b7c:	fff00513          	li	a0,-1
     b80:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     b84:	71472503          	lw	a0,1812(a4)
     b88:	00f507b3          	add	a5,a0,a5
     b8c:	fed7f2e3          	bgeu	a5,a3,b70 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     b90:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     b94:	00008067          	ret

00000b98 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     b98:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     b9c:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     ba0:	00e51c63          	bne	a0,a4,bb8 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     ba4:	fffe07b7          	lui	a5,0xfffe0
     ba8:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     bac:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     bb0:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     bb4:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     bb8:	fff60737          	lui	a4,0xfff60
    return 0;
     bbc:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     bc0:	fee79ae3          	bne	a5,a4,bb4 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     bc4:	fffe07b7          	lui	a5,0xfffe0
     bc8:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     bcc:	020007b7          	lui	a5,0x2000
     bd0:	fe1ff06f          	j	bb0 <neorv32_uart_available+0x18>

00000bd4 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     bd4:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     bd8:	00a79713          	sll	a4,a5,0xa
     bdc:	fe075ce3          	bgez	a4,bd4 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     be0:	00b52223          	sw	a1,4(a0)
}
     be4:	00008067          	ret

00000be8 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     be8:	00052783          	lw	a5,0(a0)
     bec:	00f79713          	sll	a4,a5,0xf
     bf0:	fe075ce3          	bgez	a4,be8 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     bf4:	00452503          	lw	a0,4(a0)
}
     bf8:	0ff57513          	zext.b	a0,a0
     bfc:	00008067          	ret

00000c00 <printf>:
     c00:	fc010113          	add	sp,sp,-64
     c04:	02c12423          	sw	a2,40(sp)
     c08:	02d12623          	sw	a3,44(sp)
     c0c:	80000317          	auipc	t1,0x80000
     c10:	afc32303          	lw	t1,-1284(t1) # 80000708 <_impure_ptr>
     c14:	02b12223          	sw	a1,36(sp)
     c18:	02e12823          	sw	a4,48(sp)
     c1c:	02f12a23          	sw	a5,52(sp)
     c20:	03012c23          	sw	a6,56(sp)
     c24:	03112e23          	sw	a7,60(sp)
     c28:	00832583          	lw	a1,8(t1)
     c2c:	02410693          	add	a3,sp,36
     c30:	00050613          	mv	a2,a0
     c34:	00030513          	mv	a0,t1
     c38:	00112e23          	sw	ra,28(sp)
     c3c:	00d12623          	sw	a3,12(sp)
     c40:	0c8010ef          	jal	1d08 <_vfprintf_r>
     c44:	01c12083          	lw	ra,28(sp)
     c48:	04010113          	add	sp,sp,64
     c4c:	00008067          	ret

00000c50 <putchar>:
     c50:	80000797          	auipc	a5,0x80000
     c54:	ab87a783          	lw	a5,-1352(a5) # 80000708 <_impure_ptr>
     c58:	0087a603          	lw	a2,8(a5)
     c5c:	00050593          	mv	a1,a0
     c60:	00078513          	mv	a0,a5
     c64:	3c00606f          	j	7024 <_putc_r>

00000c68 <_puts_r>:
     c68:	fd010113          	add	sp,sp,-48
     c6c:	02812423          	sw	s0,40(sp)
     c70:	00050413          	mv	s0,a0
     c74:	00058513          	mv	a0,a1
     c78:	02912223          	sw	s1,36(sp)
     c7c:	02112623          	sw	ra,44(sp)
     c80:	00058493          	mv	s1,a1
     c84:	3b0000ef          	jal	1034 <strlen>
     c88:	00150713          	add	a4,a0,1
     c8c:	0000e697          	auipc	a3,0xe
     c90:	26068693          	add	a3,a3,608 # eeec <__fini_array_end+0x194>
     c94:	00e12623          	sw	a4,12(sp)
     c98:	03442783          	lw	a5,52(s0)
     c9c:	01010713          	add	a4,sp,16
     ca0:	00d12c23          	sw	a3,24(sp)
     ca4:	00e12223          	sw	a4,4(sp)
     ca8:	00100693          	li	a3,1
     cac:	00200713          	li	a4,2
     cb0:	00912823          	sw	s1,16(sp)
     cb4:	00a12a23          	sw	a0,20(sp)
     cb8:	00d12e23          	sw	a3,28(sp)
     cbc:	00e12423          	sw	a4,8(sp)
     cc0:	00842483          	lw	s1,8(s0)
     cc4:	0c078263          	beqz	a5,d88 <_puts_r+0x120>
     cc8:	0644a703          	lw	a4,100(s1)
     ccc:	00c49783          	lh	a5,12(s1)
     cd0:	00177713          	and	a4,a4,1
     cd4:	00071663          	bnez	a4,ce0 <_puts_r+0x78>
     cd8:	2007f713          	and	a4,a5,512
     cdc:	08070e63          	beqz	a4,d78 <_puts_r+0x110>
     ce0:	01279713          	sll	a4,a5,0x12
     ce4:	02074263          	bltz	a4,d08 <_puts_r+0xa0>
     ce8:	0644a703          	lw	a4,100(s1)
     cec:	ffffe6b7          	lui	a3,0xffffe
     cf0:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     cf4:	00002637          	lui	a2,0x2
     cf8:	00c7e7b3          	or	a5,a5,a2
     cfc:	00d77733          	and	a4,a4,a3
     d00:	00f49623          	sh	a5,12(s1)
     d04:	06e4a223          	sw	a4,100(s1)
     d08:	00040513          	mv	a0,s0
     d0c:	00410613          	add	a2,sp,4
     d10:	00048593          	mv	a1,s1
     d14:	549050ef          	jal	6a5c <__sfvwrite_r>
     d18:	0644a783          	lw	a5,100(s1)
     d1c:	00153413          	seqz	s0,a0
     d20:	40800433          	neg	s0,s0
     d24:	00b47413          	and	s0,s0,11
     d28:	0017f793          	and	a5,a5,1
     d2c:	fff40413          	add	s0,s0,-1
     d30:	00079863          	bnez	a5,d40 <_puts_r+0xd8>
     d34:	00c4d783          	lhu	a5,12(s1)
     d38:	2007f793          	and	a5,a5,512
     d3c:	00078e63          	beqz	a5,d58 <_puts_r+0xf0>
     d40:	02c12083          	lw	ra,44(sp)
     d44:	00040513          	mv	a0,s0
     d48:	02812403          	lw	s0,40(sp)
     d4c:	02412483          	lw	s1,36(sp)
     d50:	03010113          	add	sp,sp,48
     d54:	00008067          	ret
     d58:	0584a503          	lw	a0,88(s1)
     d5c:	054000ef          	jal	db0 <__retarget_lock_release_recursive>
     d60:	02c12083          	lw	ra,44(sp)
     d64:	00040513          	mv	a0,s0
     d68:	02812403          	lw	s0,40(sp)
     d6c:	02412483          	lw	s1,36(sp)
     d70:	03010113          	add	sp,sp,48
     d74:	00008067          	ret
     d78:	0584a503          	lw	a0,88(s1)
     d7c:	030000ef          	jal	dac <__retarget_lock_acquire_recursive>
     d80:	00c49783          	lh	a5,12(s1)
     d84:	f5dff06f          	j	ce0 <_puts_r+0x78>
     d88:	00040513          	mv	a0,s0
     d8c:	449050ef          	jal	69d4 <__sinit>
     d90:	f39ff06f          	j	cc8 <_puts_r+0x60>

00000d94 <puts>:
     d94:	00050593          	mv	a1,a0
     d98:	80000517          	auipc	a0,0x80000
     d9c:	97052503          	lw	a0,-1680(a0) # 80000708 <_impure_ptr>
     da0:	ec9ff06f          	j	c68 <_puts_r>

00000da4 <__retarget_lock_init_recursive>:
     da4:	00008067          	ret

00000da8 <__retarget_lock_close_recursive>:
     da8:	00008067          	ret

00000dac <__retarget_lock_acquire_recursive>:
     dac:	00008067          	ret

00000db0 <__retarget_lock_release_recursive>:
     db0:	00008067          	ret

00000db4 <memset>:
     db4:	00f00313          	li	t1,15
     db8:	00050713          	mv	a4,a0
     dbc:	02c37e63          	bgeu	t1,a2,df8 <memset+0x44>
     dc0:	00f77793          	and	a5,a4,15
     dc4:	0a079063          	bnez	a5,e64 <memset+0xb0>
     dc8:	08059263          	bnez	a1,e4c <memset+0x98>
     dcc:	ff067693          	and	a3,a2,-16
     dd0:	00f67613          	and	a2,a2,15
     dd4:	00e686b3          	add	a3,a3,a4
     dd8:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     ddc:	00b72223          	sw	a1,4(a4)
     de0:	00b72423          	sw	a1,8(a4)
     de4:	00b72623          	sw	a1,12(a4)
     de8:	01070713          	add	a4,a4,16
     dec:	fed766e3          	bltu	a4,a3,dd8 <memset+0x24>
     df0:	00061463          	bnez	a2,df8 <memset+0x44>
     df4:	00008067          	ret
     df8:	40c306b3          	sub	a3,t1,a2
     dfc:	00269693          	sll	a3,a3,0x2
     e00:	00000297          	auipc	t0,0x0
     e04:	005686b3          	add	a3,a3,t0
     e08:	00c68067          	jr	12(a3)
     e0c:	00b70723          	sb	a1,14(a4)
     e10:	00b706a3          	sb	a1,13(a4)
     e14:	00b70623          	sb	a1,12(a4)
     e18:	00b705a3          	sb	a1,11(a4)
     e1c:	00b70523          	sb	a1,10(a4)
     e20:	00b704a3          	sb	a1,9(a4)
     e24:	00b70423          	sb	a1,8(a4)
     e28:	00b703a3          	sb	a1,7(a4)
     e2c:	00b70323          	sb	a1,6(a4)
     e30:	00b702a3          	sb	a1,5(a4)
     e34:	00b70223          	sb	a1,4(a4)
     e38:	00b701a3          	sb	a1,3(a4)
     e3c:	00b70123          	sb	a1,2(a4)
     e40:	00b700a3          	sb	a1,1(a4)
     e44:	00b70023          	sb	a1,0(a4)
     e48:	00008067          	ret
     e4c:	0ff5f593          	zext.b	a1,a1
     e50:	00859693          	sll	a3,a1,0x8
     e54:	00d5e5b3          	or	a1,a1,a3
     e58:	01059693          	sll	a3,a1,0x10
     e5c:	00d5e5b3          	or	a1,a1,a3
     e60:	f6dff06f          	j	dcc <memset+0x18>
     e64:	00279693          	sll	a3,a5,0x2
     e68:	00000297          	auipc	t0,0x0
     e6c:	005686b3          	add	a3,a3,t0
     e70:	00008293          	mv	t0,ra
     e74:	fa0680e7          	jalr	-96(a3)
     e78:	00028093          	mv	ra,t0
     e7c:	ff078793          	add	a5,a5,-16
     e80:	40f70733          	sub	a4,a4,a5
     e84:	00f60633          	add	a2,a2,a5
     e88:	f6c378e3          	bgeu	t1,a2,df8 <memset+0x44>
     e8c:	f3dff06f          	j	dc8 <memset+0x14>

00000e90 <memcpy>:
     e90:	00a5c7b3          	xor	a5,a1,a0
     e94:	0037f793          	and	a5,a5,3
     e98:	00c508b3          	add	a7,a0,a2
     e9c:	06079463          	bnez	a5,f04 <memcpy+0x74>
     ea0:	00300793          	li	a5,3
     ea4:	06c7f063          	bgeu	a5,a2,f04 <memcpy+0x74>
     ea8:	00357793          	and	a5,a0,3
     eac:	00050713          	mv	a4,a0
     eb0:	06079a63          	bnez	a5,f24 <memcpy+0x94>
     eb4:	ffc8f613          	and	a2,a7,-4
     eb8:	40e606b3          	sub	a3,a2,a4
     ebc:	02000793          	li	a5,32
     ec0:	08d7ce63          	blt	a5,a3,f5c <memcpy+0xcc>
     ec4:	00058693          	mv	a3,a1
     ec8:	00070793          	mv	a5,a4
     ecc:	02c77863          	bgeu	a4,a2,efc <memcpy+0x6c>
     ed0:	0006a803          	lw	a6,0(a3)
     ed4:	00478793          	add	a5,a5,4
     ed8:	00468693          	add	a3,a3,4
     edc:	ff07ae23          	sw	a6,-4(a5)
     ee0:	fec7e8e3          	bltu	a5,a2,ed0 <memcpy+0x40>
     ee4:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x2f7>
     ee8:	40e787b3          	sub	a5,a5,a4
     eec:	ffc7f793          	and	a5,a5,-4
     ef0:	00478793          	add	a5,a5,4
     ef4:	00f70733          	add	a4,a4,a5
     ef8:	00f585b3          	add	a1,a1,a5
     efc:	01176863          	bltu	a4,a7,f0c <memcpy+0x7c>
     f00:	00008067          	ret
     f04:	00050713          	mv	a4,a0
     f08:	05157863          	bgeu	a0,a7,f58 <memcpy+0xc8>
     f0c:	0005c783          	lbu	a5,0(a1)
     f10:	00170713          	add	a4,a4,1
     f14:	00158593          	add	a1,a1,1
     f18:	fef70fa3          	sb	a5,-1(a4)
     f1c:	fee898e3          	bne	a7,a4,f0c <memcpy+0x7c>
     f20:	00008067          	ret
     f24:	0005c683          	lbu	a3,0(a1)
     f28:	00170713          	add	a4,a4,1
     f2c:	00377793          	and	a5,a4,3
     f30:	fed70fa3          	sb	a3,-1(a4)
     f34:	00158593          	add	a1,a1,1
     f38:	f6078ee3          	beqz	a5,eb4 <memcpy+0x24>
     f3c:	0005c683          	lbu	a3,0(a1)
     f40:	00170713          	add	a4,a4,1
     f44:	00377793          	and	a5,a4,3
     f48:	fed70fa3          	sb	a3,-1(a4)
     f4c:	00158593          	add	a1,a1,1
     f50:	fc079ae3          	bnez	a5,f24 <memcpy+0x94>
     f54:	f61ff06f          	j	eb4 <memcpy+0x24>
     f58:	00008067          	ret
     f5c:	ff010113          	add	sp,sp,-16
     f60:	00812623          	sw	s0,12(sp)
     f64:	02000413          	li	s0,32
     f68:	0005a383          	lw	t2,0(a1)
     f6c:	0045a283          	lw	t0,4(a1)
     f70:	0085af83          	lw	t6,8(a1)
     f74:	00c5af03          	lw	t5,12(a1)
     f78:	0105ae83          	lw	t4,16(a1)
     f7c:	0145ae03          	lw	t3,20(a1)
     f80:	0185a303          	lw	t1,24(a1)
     f84:	01c5a803          	lw	a6,28(a1)
     f88:	0205a683          	lw	a3,32(a1)
     f8c:	02470713          	add	a4,a4,36
     f90:	40e607b3          	sub	a5,a2,a4
     f94:	fc772e23          	sw	t2,-36(a4)
     f98:	fe572023          	sw	t0,-32(a4)
     f9c:	fff72223          	sw	t6,-28(a4)
     fa0:	ffe72423          	sw	t5,-24(a4)
     fa4:	ffd72623          	sw	t4,-20(a4)
     fa8:	ffc72823          	sw	t3,-16(a4)
     fac:	fe672a23          	sw	t1,-12(a4)
     fb0:	ff072c23          	sw	a6,-8(a4)
     fb4:	fed72e23          	sw	a3,-4(a4)
     fb8:	02458593          	add	a1,a1,36
     fbc:	faf446e3          	blt	s0,a5,f68 <memcpy+0xd8>
     fc0:	00058693          	mv	a3,a1
     fc4:	00070793          	mv	a5,a4
     fc8:	02c77863          	bgeu	a4,a2,ff8 <memcpy+0x168>
     fcc:	0006a803          	lw	a6,0(a3)
     fd0:	00478793          	add	a5,a5,4
     fd4:	00468693          	add	a3,a3,4
     fd8:	ff07ae23          	sw	a6,-4(a5)
     fdc:	fec7e8e3          	bltu	a5,a2,fcc <memcpy+0x13c>
     fe0:	fff60793          	add	a5,a2,-1
     fe4:	40e787b3          	sub	a5,a5,a4
     fe8:	ffc7f793          	and	a5,a5,-4
     fec:	00478793          	add	a5,a5,4
     ff0:	00f70733          	add	a4,a4,a5
     ff4:	00f585b3          	add	a1,a1,a5
     ff8:	01176863          	bltu	a4,a7,1008 <memcpy+0x178>
     ffc:	00c12403          	lw	s0,12(sp)
    1000:	01010113          	add	sp,sp,16
    1004:	00008067          	ret
    1008:	0005c783          	lbu	a5,0(a1)
    100c:	00170713          	add	a4,a4,1
    1010:	00158593          	add	a1,a1,1
    1014:	fef70fa3          	sb	a5,-1(a4)
    1018:	fee882e3          	beq	a7,a4,ffc <memcpy+0x16c>
    101c:	0005c783          	lbu	a5,0(a1)
    1020:	00170713          	add	a4,a4,1
    1024:	00158593          	add	a1,a1,1
    1028:	fef70fa3          	sb	a5,-1(a4)
    102c:	fce89ee3          	bne	a7,a4,1008 <memcpy+0x178>
    1030:	fcdff06f          	j	ffc <memcpy+0x16c>

00001034 <strlen>:
    1034:	00357793          	and	a5,a0,3
    1038:	00050713          	mv	a4,a0
    103c:	04079c63          	bnez	a5,1094 <strlen+0x60>
    1040:	7f7f86b7          	lui	a3,0x7f7f8
    1044:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    1048:	fff00593          	li	a1,-1
    104c:	00072603          	lw	a2,0(a4)
    1050:	00470713          	add	a4,a4,4
    1054:	00d677b3          	and	a5,a2,a3
    1058:	00d787b3          	add	a5,a5,a3
    105c:	00c7e7b3          	or	a5,a5,a2
    1060:	00d7e7b3          	or	a5,a5,a3
    1064:	feb784e3          	beq	a5,a1,104c <strlen+0x18>
    1068:	ffc74683          	lbu	a3,-4(a4)
    106c:	40a707b3          	sub	a5,a4,a0
    1070:	04068463          	beqz	a3,10b8 <strlen+0x84>
    1074:	ffd74683          	lbu	a3,-3(a4)
    1078:	02068c63          	beqz	a3,10b0 <strlen+0x7c>
    107c:	ffe74503          	lbu	a0,-2(a4)
    1080:	00a03533          	snez	a0,a0
    1084:	00f50533          	add	a0,a0,a5
    1088:	ffe50513          	add	a0,a0,-2
    108c:	00008067          	ret
    1090:	fa0688e3          	beqz	a3,1040 <strlen+0xc>
    1094:	00074783          	lbu	a5,0(a4)
    1098:	00170713          	add	a4,a4,1
    109c:	00377693          	and	a3,a4,3
    10a0:	fe0798e3          	bnez	a5,1090 <strlen+0x5c>
    10a4:	40a70733          	sub	a4,a4,a0
    10a8:	fff70513          	add	a0,a4,-1
    10ac:	00008067          	ret
    10b0:	ffd78513          	add	a0,a5,-3
    10b4:	00008067          	ret
    10b8:	ffc78513          	add	a0,a5,-4
    10bc:	00008067          	ret

000010c0 <_malloc_trim_r>:
    10c0:	fe010113          	add	sp,sp,-32
    10c4:	00812c23          	sw	s0,24(sp)
    10c8:	00912a23          	sw	s1,20(sp)
    10cc:	01212823          	sw	s2,16(sp)
    10d0:	01312623          	sw	s3,12(sp)
    10d4:	01412423          	sw	s4,8(sp)
    10d8:	00058993          	mv	s3,a1
    10dc:	00112e23          	sw	ra,28(sp)
    10e0:	00050913          	mv	s2,a0
    10e4:	7ffffa17          	auipc	s4,0x7ffff
    10e8:	03ca0a13          	add	s4,s4,60 # 80000120 <__malloc_av_>
    10ec:	405000ef          	jal	1cf0 <__malloc_lock>
    10f0:	008a2703          	lw	a4,8(s4)
    10f4:	000017b7          	lui	a5,0x1
    10f8:	fef78793          	add	a5,a5,-17 # fef <memcpy+0x15f>
    10fc:	00472483          	lw	s1,4(a4)
    1100:	00001737          	lui	a4,0x1
    1104:	ffc4f493          	and	s1,s1,-4
    1108:	00f48433          	add	s0,s1,a5
    110c:	41340433          	sub	s0,s0,s3
    1110:	00c45413          	srl	s0,s0,0xc
    1114:	fff40413          	add	s0,s0,-1
    1118:	00c41413          	sll	s0,s0,0xc
    111c:	00e44e63          	blt	s0,a4,1138 <_malloc_trim_r+0x78>
    1120:	00000593          	li	a1,0
    1124:	00090513          	mv	a0,s2
    1128:	105060ef          	jal	7a2c <_sbrk_r>
    112c:	008a2783          	lw	a5,8(s4)
    1130:	009787b3          	add	a5,a5,s1
    1134:	02f50863          	beq	a0,a5,1164 <_malloc_trim_r+0xa4>
    1138:	00090513          	mv	a0,s2
    113c:	3c1000ef          	jal	1cfc <__malloc_unlock>
    1140:	01c12083          	lw	ra,28(sp)
    1144:	01812403          	lw	s0,24(sp)
    1148:	01412483          	lw	s1,20(sp)
    114c:	01012903          	lw	s2,16(sp)
    1150:	00c12983          	lw	s3,12(sp)
    1154:	00812a03          	lw	s4,8(sp)
    1158:	00000513          	li	a0,0
    115c:	02010113          	add	sp,sp,32
    1160:	00008067          	ret
    1164:	408005b3          	neg	a1,s0
    1168:	00090513          	mv	a0,s2
    116c:	0c1060ef          	jal	7a2c <_sbrk_r>
    1170:	fff00793          	li	a5,-1
    1174:	04f50a63          	beq	a0,a5,11c8 <_malloc_trim_r+0x108>
    1178:	7ffff717          	auipc	a4,0x7ffff
    117c:	7bc70713          	add	a4,a4,1980 # 80000934 <__malloc_current_mallinfo>
    1180:	00072783          	lw	a5,0(a4)
    1184:	008a2683          	lw	a3,8(s4)
    1188:	408484b3          	sub	s1,s1,s0
    118c:	0014e493          	or	s1,s1,1
    1190:	408787b3          	sub	a5,a5,s0
    1194:	00090513          	mv	a0,s2
    1198:	0096a223          	sw	s1,4(a3)
    119c:	00f72023          	sw	a5,0(a4)
    11a0:	35d000ef          	jal	1cfc <__malloc_unlock>
    11a4:	01c12083          	lw	ra,28(sp)
    11a8:	01812403          	lw	s0,24(sp)
    11ac:	01412483          	lw	s1,20(sp)
    11b0:	01012903          	lw	s2,16(sp)
    11b4:	00c12983          	lw	s3,12(sp)
    11b8:	00812a03          	lw	s4,8(sp)
    11bc:	00100513          	li	a0,1
    11c0:	02010113          	add	sp,sp,32
    11c4:	00008067          	ret
    11c8:	00000593          	li	a1,0
    11cc:	00090513          	mv	a0,s2
    11d0:	05d060ef          	jal	7a2c <_sbrk_r>
    11d4:	008a2703          	lw	a4,8(s4)
    11d8:	00f00693          	li	a3,15
    11dc:	40e507b3          	sub	a5,a0,a4
    11e0:	f4f6dce3          	bge	a3,a5,1138 <_malloc_trim_r+0x78>
    11e4:	7ffff697          	auipc	a3,0x7ffff
    11e8:	5286a683          	lw	a3,1320(a3) # 8000070c <__malloc_sbrk_base>
    11ec:	40d50533          	sub	a0,a0,a3
    11f0:	0017e793          	or	a5,a5,1
    11f4:	7ffff697          	auipc	a3,0x7ffff
    11f8:	74a6a023          	sw	a0,1856(a3) # 80000934 <__malloc_current_mallinfo>
    11fc:	00f72223          	sw	a5,4(a4)
    1200:	f39ff06f          	j	1138 <_malloc_trim_r+0x78>

00001204 <_free_r>:
    1204:	18058263          	beqz	a1,1388 <_free_r+0x184>
    1208:	ff010113          	add	sp,sp,-16
    120c:	00812423          	sw	s0,8(sp)
    1210:	00912223          	sw	s1,4(sp)
    1214:	00058413          	mv	s0,a1
    1218:	00050493          	mv	s1,a0
    121c:	00112623          	sw	ra,12(sp)
    1220:	2d1000ef          	jal	1cf0 <__malloc_lock>
    1224:	ffc42583          	lw	a1,-4(s0)
    1228:	ff840713          	add	a4,s0,-8
    122c:	7ffff517          	auipc	a0,0x7ffff
    1230:	ef450513          	add	a0,a0,-268 # 80000120 <__malloc_av_>
    1234:	ffe5f793          	and	a5,a1,-2
    1238:	00f70633          	add	a2,a4,a5
    123c:	00462683          	lw	a3,4(a2)
    1240:	00852803          	lw	a6,8(a0)
    1244:	ffc6f693          	and	a3,a3,-4
    1248:	1ac80263          	beq	a6,a2,13ec <_free_r+0x1e8>
    124c:	00d62223          	sw	a3,4(a2)
    1250:	0015f593          	and	a1,a1,1
    1254:	00d60833          	add	a6,a2,a3
    1258:	0a059063          	bnez	a1,12f8 <_free_r+0xf4>
    125c:	ff842303          	lw	t1,-8(s0)
    1260:	00482583          	lw	a1,4(a6)
    1264:	7ffff897          	auipc	a7,0x7ffff
    1268:	ec488893          	add	a7,a7,-316 # 80000128 <__malloc_av_+0x8>
    126c:	40670733          	sub	a4,a4,t1
    1270:	00872803          	lw	a6,8(a4)
    1274:	006787b3          	add	a5,a5,t1
    1278:	0015f593          	and	a1,a1,1
    127c:	15180263          	beq	a6,a7,13c0 <_free_r+0x1bc>
    1280:	00c72303          	lw	t1,12(a4)
    1284:	00682623          	sw	t1,12(a6)
    1288:	01032423          	sw	a6,8(t1)
    128c:	1a058a63          	beqz	a1,1440 <_free_r+0x23c>
    1290:	0017e693          	or	a3,a5,1
    1294:	00d72223          	sw	a3,4(a4)
    1298:	00f62023          	sw	a5,0(a2)
    129c:	1ff00693          	li	a3,511
    12a0:	06f6ec63          	bltu	a3,a5,1318 <_free_r+0x114>
    12a4:	ff87f693          	and	a3,a5,-8
    12a8:	00868693          	add	a3,a3,8
    12ac:	00452583          	lw	a1,4(a0)
    12b0:	00d506b3          	add	a3,a0,a3
    12b4:	0006a603          	lw	a2,0(a3)
    12b8:	0057d813          	srl	a6,a5,0x5
    12bc:	00100793          	li	a5,1
    12c0:	010797b3          	sll	a5,a5,a6
    12c4:	00b7e7b3          	or	a5,a5,a1
    12c8:	ff868593          	add	a1,a3,-8
    12cc:	00b72623          	sw	a1,12(a4)
    12d0:	00c72423          	sw	a2,8(a4)
    12d4:	00f52223          	sw	a5,4(a0)
    12d8:	00e6a023          	sw	a4,0(a3)
    12dc:	00e62623          	sw	a4,12(a2)
    12e0:	00812403          	lw	s0,8(sp)
    12e4:	00c12083          	lw	ra,12(sp)
    12e8:	00048513          	mv	a0,s1
    12ec:	00412483          	lw	s1,4(sp)
    12f0:	01010113          	add	sp,sp,16
    12f4:	2090006f          	j	1cfc <__malloc_unlock>
    12f8:	00482583          	lw	a1,4(a6)
    12fc:	0015f593          	and	a1,a1,1
    1300:	08058663          	beqz	a1,138c <_free_r+0x188>
    1304:	0017e693          	or	a3,a5,1
    1308:	fed42e23          	sw	a3,-4(s0)
    130c:	00f62023          	sw	a5,0(a2)
    1310:	1ff00693          	li	a3,511
    1314:	f8f6f8e3          	bgeu	a3,a5,12a4 <_free_r+0xa0>
    1318:	0097d693          	srl	a3,a5,0x9
    131c:	00400613          	li	a2,4
    1320:	12d66463          	bltu	a2,a3,1448 <_free_r+0x244>
    1324:	0067d693          	srl	a3,a5,0x6
    1328:	03968593          	add	a1,a3,57
    132c:	03868613          	add	a2,a3,56
    1330:	00359593          	sll	a1,a1,0x3
    1334:	00b505b3          	add	a1,a0,a1
    1338:	0005a683          	lw	a3,0(a1)
    133c:	ff858593          	add	a1,a1,-8
    1340:	00d59863          	bne	a1,a3,1350 <_free_r+0x14c>
    1344:	15c0006f          	j	14a0 <_free_r+0x29c>
    1348:	0086a683          	lw	a3,8(a3)
    134c:	00d58863          	beq	a1,a3,135c <_free_r+0x158>
    1350:	0046a603          	lw	a2,4(a3)
    1354:	ffc67613          	and	a2,a2,-4
    1358:	fec7e8e3          	bltu	a5,a2,1348 <_free_r+0x144>
    135c:	00c6a583          	lw	a1,12(a3)
    1360:	00b72623          	sw	a1,12(a4)
    1364:	00d72423          	sw	a3,8(a4)
    1368:	00812403          	lw	s0,8(sp)
    136c:	00c12083          	lw	ra,12(sp)
    1370:	00e5a423          	sw	a4,8(a1)
    1374:	00048513          	mv	a0,s1
    1378:	00412483          	lw	s1,4(sp)
    137c:	00e6a623          	sw	a4,12(a3)
    1380:	01010113          	add	sp,sp,16
    1384:	1790006f          	j	1cfc <__malloc_unlock>
    1388:	00008067          	ret
    138c:	00d787b3          	add	a5,a5,a3
    1390:	7ffff897          	auipc	a7,0x7ffff
    1394:	d9888893          	add	a7,a7,-616 # 80000128 <__malloc_av_+0x8>
    1398:	00862683          	lw	a3,8(a2)
    139c:	0f168063          	beq	a3,a7,147c <_free_r+0x278>
    13a0:	00c62803          	lw	a6,12(a2)
    13a4:	0017e593          	or	a1,a5,1
    13a8:	00f70633          	add	a2,a4,a5
    13ac:	0106a623          	sw	a6,12(a3)
    13b0:	00d82423          	sw	a3,8(a6)
    13b4:	00b72223          	sw	a1,4(a4)
    13b8:	00f62023          	sw	a5,0(a2)
    13bc:	ee1ff06f          	j	129c <_free_r+0x98>
    13c0:	14059063          	bnez	a1,1500 <_free_r+0x2fc>
    13c4:	00862583          	lw	a1,8(a2)
    13c8:	00c62603          	lw	a2,12(a2)
    13cc:	00f686b3          	add	a3,a3,a5
    13d0:	0016e793          	or	a5,a3,1
    13d4:	00c5a623          	sw	a2,12(a1)
    13d8:	00b62423          	sw	a1,8(a2)
    13dc:	00f72223          	sw	a5,4(a4)
    13e0:	00d70733          	add	a4,a4,a3
    13e4:	00d72023          	sw	a3,0(a4)
    13e8:	ef9ff06f          	j	12e0 <_free_r+0xdc>
    13ec:	0015f593          	and	a1,a1,1
    13f0:	00d786b3          	add	a3,a5,a3
    13f4:	02059063          	bnez	a1,1414 <_free_r+0x210>
    13f8:	ff842583          	lw	a1,-8(s0)
    13fc:	40b70733          	sub	a4,a4,a1
    1400:	00c72783          	lw	a5,12(a4)
    1404:	00872603          	lw	a2,8(a4)
    1408:	00b686b3          	add	a3,a3,a1
    140c:	00f62623          	sw	a5,12(a2)
    1410:	00c7a423          	sw	a2,8(a5)
    1414:	0016e793          	or	a5,a3,1
    1418:	00f72223          	sw	a5,4(a4)
    141c:	00e52423          	sw	a4,8(a0)
    1420:	7ffff797          	auipc	a5,0x7ffff
    1424:	2f07a783          	lw	a5,752(a5) # 80000710 <__malloc_trim_threshold>
    1428:	eaf6ece3          	bltu	a3,a5,12e0 <_free_r+0xdc>
    142c:	7ffff597          	auipc	a1,0x7ffff
    1430:	3005a583          	lw	a1,768(a1) # 8000072c <__malloc_top_pad>
    1434:	00048513          	mv	a0,s1
    1438:	c89ff0ef          	jal	10c0 <_malloc_trim_r>
    143c:	ea5ff06f          	j	12e0 <_free_r+0xdc>
    1440:	00d787b3          	add	a5,a5,a3
    1444:	f55ff06f          	j	1398 <_free_r+0x194>
    1448:	01400613          	li	a2,20
    144c:	02d67063          	bgeu	a2,a3,146c <_free_r+0x268>
    1450:	05400613          	li	a2,84
    1454:	06d66463          	bltu	a2,a3,14bc <_free_r+0x2b8>
    1458:	00c7d693          	srl	a3,a5,0xc
    145c:	06f68593          	add	a1,a3,111
    1460:	06e68613          	add	a2,a3,110
    1464:	00359593          	sll	a1,a1,0x3
    1468:	ecdff06f          	j	1334 <_free_r+0x130>
    146c:	05c68593          	add	a1,a3,92
    1470:	05b68613          	add	a2,a3,91
    1474:	00359593          	sll	a1,a1,0x3
    1478:	ebdff06f          	j	1334 <_free_r+0x130>
    147c:	00e52a23          	sw	a4,20(a0)
    1480:	00e52823          	sw	a4,16(a0)
    1484:	0017e693          	or	a3,a5,1
    1488:	01172623          	sw	a7,12(a4)
    148c:	01172423          	sw	a7,8(a4)
    1490:	00d72223          	sw	a3,4(a4)
    1494:	00f70733          	add	a4,a4,a5
    1498:	00f72023          	sw	a5,0(a4)
    149c:	e45ff06f          	j	12e0 <_free_r+0xdc>
    14a0:	00452803          	lw	a6,4(a0)
    14a4:	40265613          	sra	a2,a2,0x2
    14a8:	00100793          	li	a5,1
    14ac:	00c797b3          	sll	a5,a5,a2
    14b0:	0107e7b3          	or	a5,a5,a6
    14b4:	00f52223          	sw	a5,4(a0)
    14b8:	ea9ff06f          	j	1360 <_free_r+0x15c>
    14bc:	15400613          	li	a2,340
    14c0:	00d66c63          	bltu	a2,a3,14d8 <_free_r+0x2d4>
    14c4:	00f7d693          	srl	a3,a5,0xf
    14c8:	07868593          	add	a1,a3,120
    14cc:	07768613          	add	a2,a3,119
    14d0:	00359593          	sll	a1,a1,0x3
    14d4:	e61ff06f          	j	1334 <_free_r+0x130>
    14d8:	55400613          	li	a2,1364
    14dc:	00d66c63          	bltu	a2,a3,14f4 <_free_r+0x2f0>
    14e0:	0127d693          	srl	a3,a5,0x12
    14e4:	07d68593          	add	a1,a3,125
    14e8:	07c68613          	add	a2,a3,124
    14ec:	00359593          	sll	a1,a1,0x3
    14f0:	e45ff06f          	j	1334 <_free_r+0x130>
    14f4:	3f800593          	li	a1,1016
    14f8:	07e00613          	li	a2,126
    14fc:	e39ff06f          	j	1334 <_free_r+0x130>
    1500:	0017e693          	or	a3,a5,1
    1504:	00d72223          	sw	a3,4(a4)
    1508:	00f62023          	sw	a5,0(a2)
    150c:	dd5ff06f          	j	12e0 <_free_r+0xdc>

00001510 <_malloc_r>:
    1510:	fd010113          	add	sp,sp,-48
    1514:	03212023          	sw	s2,32(sp)
    1518:	02112623          	sw	ra,44(sp)
    151c:	02812423          	sw	s0,40(sp)
    1520:	02912223          	sw	s1,36(sp)
    1524:	01312e23          	sw	s3,28(sp)
    1528:	00b58793          	add	a5,a1,11
    152c:	01600713          	li	a4,22
    1530:	00050913          	mv	s2,a0
    1534:	08f76263          	bltu	a4,a5,15b8 <_malloc_r+0xa8>
    1538:	01000793          	li	a5,16
    153c:	20b7e663          	bltu	a5,a1,1748 <_malloc_r+0x238>
    1540:	7b0000ef          	jal	1cf0 <__malloc_lock>
    1544:	01800793          	li	a5,24
    1548:	00200593          	li	a1,2
    154c:	01000493          	li	s1,16
    1550:	7ffff997          	auipc	s3,0x7ffff
    1554:	bd098993          	add	s3,s3,-1072 # 80000120 <__malloc_av_>
    1558:	00f987b3          	add	a5,s3,a5
    155c:	0047a403          	lw	s0,4(a5)
    1560:	ff878713          	add	a4,a5,-8
    1564:	36e40463          	beq	s0,a4,18cc <_malloc_r+0x3bc>
    1568:	00442783          	lw	a5,4(s0)
    156c:	00c42683          	lw	a3,12(s0)
    1570:	00842603          	lw	a2,8(s0)
    1574:	ffc7f793          	and	a5,a5,-4
    1578:	00f407b3          	add	a5,s0,a5
    157c:	0047a703          	lw	a4,4(a5)
    1580:	00d62623          	sw	a3,12(a2)
    1584:	00c6a423          	sw	a2,8(a3)
    1588:	00176713          	or	a4,a4,1
    158c:	00090513          	mv	a0,s2
    1590:	00e7a223          	sw	a4,4(a5)
    1594:	768000ef          	jal	1cfc <__malloc_unlock>
    1598:	00840513          	add	a0,s0,8
    159c:	02c12083          	lw	ra,44(sp)
    15a0:	02812403          	lw	s0,40(sp)
    15a4:	02412483          	lw	s1,36(sp)
    15a8:	02012903          	lw	s2,32(sp)
    15ac:	01c12983          	lw	s3,28(sp)
    15b0:	03010113          	add	sp,sp,48
    15b4:	00008067          	ret
    15b8:	ff87f493          	and	s1,a5,-8
    15bc:	1807c663          	bltz	a5,1748 <_malloc_r+0x238>
    15c0:	18b4e463          	bltu	s1,a1,1748 <_malloc_r+0x238>
    15c4:	72c000ef          	jal	1cf0 <__malloc_lock>
    15c8:	1f700793          	li	a5,503
    15cc:	4097fa63          	bgeu	a5,s1,19e0 <_malloc_r+0x4d0>
    15d0:	0094d793          	srl	a5,s1,0x9
    15d4:	18078263          	beqz	a5,1758 <_malloc_r+0x248>
    15d8:	00400713          	li	a4,4
    15dc:	36f76063          	bltu	a4,a5,193c <_malloc_r+0x42c>
    15e0:	0064d793          	srl	a5,s1,0x6
    15e4:	03978593          	add	a1,a5,57
    15e8:	03878813          	add	a6,a5,56
    15ec:	00359613          	sll	a2,a1,0x3
    15f0:	7ffff997          	auipc	s3,0x7ffff
    15f4:	b3098993          	add	s3,s3,-1232 # 80000120 <__malloc_av_>
    15f8:	00c98633          	add	a2,s3,a2
    15fc:	00462403          	lw	s0,4(a2)
    1600:	ff860613          	add	a2,a2,-8
    1604:	02860863          	beq	a2,s0,1634 <_malloc_r+0x124>
    1608:	00f00513          	li	a0,15
    160c:	0140006f          	j	1620 <_malloc_r+0x110>
    1610:	00c42683          	lw	a3,12(s0)
    1614:	2a075863          	bgez	a4,18c4 <_malloc_r+0x3b4>
    1618:	00d60e63          	beq	a2,a3,1634 <_malloc_r+0x124>
    161c:	00068413          	mv	s0,a3
    1620:	00442783          	lw	a5,4(s0)
    1624:	ffc7f793          	and	a5,a5,-4
    1628:	40978733          	sub	a4,a5,s1
    162c:	fee552e3          	bge	a0,a4,1610 <_malloc_r+0x100>
    1630:	00080593          	mv	a1,a6
    1634:	0109a403          	lw	s0,16(s3)
    1638:	7ffff897          	auipc	a7,0x7ffff
    163c:	af088893          	add	a7,a7,-1296 # 80000128 <__malloc_av_+0x8>
    1640:	27140e63          	beq	s0,a7,18bc <_malloc_r+0x3ac>
    1644:	00442783          	lw	a5,4(s0)
    1648:	00f00693          	li	a3,15
    164c:	ffc7f793          	and	a5,a5,-4
    1650:	40978733          	sub	a4,a5,s1
    1654:	38e6cc63          	blt	a3,a4,19ec <_malloc_r+0x4dc>
    1658:	0119aa23          	sw	a7,20(s3)
    165c:	0119a823          	sw	a7,16(s3)
    1660:	36075063          	bgez	a4,19c0 <_malloc_r+0x4b0>
    1664:	1ff00713          	li	a4,511
    1668:	0049a503          	lw	a0,4(s3)
    166c:	26f76863          	bltu	a4,a5,18dc <_malloc_r+0x3cc>
    1670:	ff87f713          	and	a4,a5,-8
    1674:	00870713          	add	a4,a4,8
    1678:	00e98733          	add	a4,s3,a4
    167c:	00072683          	lw	a3,0(a4)
    1680:	0057d613          	srl	a2,a5,0x5
    1684:	00100793          	li	a5,1
    1688:	00c797b3          	sll	a5,a5,a2
    168c:	00f56533          	or	a0,a0,a5
    1690:	ff870793          	add	a5,a4,-8
    1694:	00f42623          	sw	a5,12(s0)
    1698:	00d42423          	sw	a3,8(s0)
    169c:	00a9a223          	sw	a0,4(s3)
    16a0:	00872023          	sw	s0,0(a4)
    16a4:	0086a623          	sw	s0,12(a3)
    16a8:	4025d793          	sra	a5,a1,0x2
    16ac:	00100613          	li	a2,1
    16b0:	00f61633          	sll	a2,a2,a5
    16b4:	0ac56a63          	bltu	a0,a2,1768 <_malloc_r+0x258>
    16b8:	00a677b3          	and	a5,a2,a0
    16bc:	02079463          	bnez	a5,16e4 <_malloc_r+0x1d4>
    16c0:	00161613          	sll	a2,a2,0x1
    16c4:	ffc5f593          	and	a1,a1,-4
    16c8:	00a677b3          	and	a5,a2,a0
    16cc:	00458593          	add	a1,a1,4
    16d0:	00079a63          	bnez	a5,16e4 <_malloc_r+0x1d4>
    16d4:	00161613          	sll	a2,a2,0x1
    16d8:	00a677b3          	and	a5,a2,a0
    16dc:	00458593          	add	a1,a1,4
    16e0:	fe078ae3          	beqz	a5,16d4 <_malloc_r+0x1c4>
    16e4:	00f00813          	li	a6,15
    16e8:	00359313          	sll	t1,a1,0x3
    16ec:	00698333          	add	t1,s3,t1
    16f0:	00030513          	mv	a0,t1
    16f4:	00c52783          	lw	a5,12(a0)
    16f8:	00058e13          	mv	t3,a1
    16fc:	26f50263          	beq	a0,a5,1960 <_malloc_r+0x450>
    1700:	0047a703          	lw	a4,4(a5)
    1704:	00078413          	mv	s0,a5
    1708:	00c7a783          	lw	a5,12(a5)
    170c:	ffc77713          	and	a4,a4,-4
    1710:	409706b3          	sub	a3,a4,s1
    1714:	26d84263          	blt	a6,a3,1978 <_malloc_r+0x468>
    1718:	fe06c2e3          	bltz	a3,16fc <_malloc_r+0x1ec>
    171c:	00e40733          	add	a4,s0,a4
    1720:	00472683          	lw	a3,4(a4)
    1724:	00842603          	lw	a2,8(s0)
    1728:	00090513          	mv	a0,s2
    172c:	0016e693          	or	a3,a3,1
    1730:	00d72223          	sw	a3,4(a4)
    1734:	00f62623          	sw	a5,12(a2)
    1738:	00c7a423          	sw	a2,8(a5)
    173c:	5c0000ef          	jal	1cfc <__malloc_unlock>
    1740:	00840513          	add	a0,s0,8
    1744:	e59ff06f          	j	159c <_malloc_r+0x8c>
    1748:	00c00793          	li	a5,12
    174c:	00f92023          	sw	a5,0(s2)
    1750:	00000513          	li	a0,0
    1754:	e49ff06f          	j	159c <_malloc_r+0x8c>
    1758:	20000613          	li	a2,512
    175c:	04000593          	li	a1,64
    1760:	03f00813          	li	a6,63
    1764:	e8dff06f          	j	15f0 <_malloc_r+0xe0>
    1768:	0089a403          	lw	s0,8(s3)
    176c:	01612823          	sw	s6,16(sp)
    1770:	00442783          	lw	a5,4(s0)
    1774:	ffc7fb13          	and	s6,a5,-4
    1778:	009b6863          	bltu	s6,s1,1788 <_malloc_r+0x278>
    177c:	409b0733          	sub	a4,s6,s1
    1780:	00f00793          	li	a5,15
    1784:	0ee7ca63          	blt	a5,a4,1878 <_malloc_r+0x368>
    1788:	01912223          	sw	s9,4(sp)
    178c:	7ffffc97          	auipc	s9,0x7ffff
    1790:	f80c8c93          	add	s9,s9,-128 # 8000070c <__malloc_sbrk_base>
    1794:	000ca703          	lw	a4,0(s9)
    1798:	01412c23          	sw	s4,24(sp)
    179c:	01512a23          	sw	s5,20(sp)
    17a0:	01712623          	sw	s7,12(sp)
    17a4:	7ffffa97          	auipc	s5,0x7ffff
    17a8:	f88aaa83          	lw	s5,-120(s5) # 8000072c <__malloc_top_pad>
    17ac:	fff00793          	li	a5,-1
    17b0:	01640a33          	add	s4,s0,s6
    17b4:	01548ab3          	add	s5,s1,s5
    17b8:	3ef70263          	beq	a4,a5,1b9c <_malloc_r+0x68c>
    17bc:	000017b7          	lui	a5,0x1
    17c0:	00f78793          	add	a5,a5,15 # 100f <memcpy+0x17f>
    17c4:	00fa8ab3          	add	s5,s5,a5
    17c8:	fffff7b7          	lui	a5,0xfffff
    17cc:	00fafab3          	and	s5,s5,a5
    17d0:	000a8593          	mv	a1,s5
    17d4:	00090513          	mv	a0,s2
    17d8:	254060ef          	jal	7a2c <_sbrk_r>
    17dc:	fff00793          	li	a5,-1
    17e0:	00050b93          	mv	s7,a0
    17e4:	46f50663          	beq	a0,a5,1c50 <_malloc_r+0x740>
    17e8:	01812423          	sw	s8,8(sp)
    17ec:	25456863          	bltu	a0,s4,1a3c <_malloc_r+0x52c>
    17f0:	7ffffc17          	auipc	s8,0x7ffff
    17f4:	144c0c13          	add	s8,s8,324 # 80000934 <__malloc_current_mallinfo>
    17f8:	000c2583          	lw	a1,0(s8)
    17fc:	00ba85b3          	add	a1,s5,a1
    1800:	00bc2023          	sw	a1,0(s8)
    1804:	00058713          	mv	a4,a1
    1808:	2caa1063          	bne	s4,a0,1ac8 <_malloc_r+0x5b8>
    180c:	01451793          	sll	a5,a0,0x14
    1810:	2a079c63          	bnez	a5,1ac8 <_malloc_r+0x5b8>
    1814:	0089ab83          	lw	s7,8(s3)
    1818:	015b07b3          	add	a5,s6,s5
    181c:	0017e793          	or	a5,a5,1
    1820:	00fba223          	sw	a5,4(s7)
    1824:	7ffff717          	auipc	a4,0x7ffff
    1828:	f0470713          	add	a4,a4,-252 # 80000728 <__malloc_max_sbrked_mem>
    182c:	00072683          	lw	a3,0(a4)
    1830:	00b6f463          	bgeu	a3,a1,1838 <_malloc_r+0x328>
    1834:	00b72023          	sw	a1,0(a4)
    1838:	7ffff717          	auipc	a4,0x7ffff
    183c:	eec70713          	add	a4,a4,-276 # 80000724 <__malloc_max_total_mem>
    1840:	00072683          	lw	a3,0(a4)
    1844:	00b6f463          	bgeu	a3,a1,184c <_malloc_r+0x33c>
    1848:	00b72023          	sw	a1,0(a4)
    184c:	00812c03          	lw	s8,8(sp)
    1850:	000b8413          	mv	s0,s7
    1854:	ffc7f793          	and	a5,a5,-4
    1858:	40978733          	sub	a4,a5,s1
    185c:	3897ec63          	bltu	a5,s1,1bf4 <_malloc_r+0x6e4>
    1860:	00f00793          	li	a5,15
    1864:	38e7d863          	bge	a5,a4,1bf4 <_malloc_r+0x6e4>
    1868:	01812a03          	lw	s4,24(sp)
    186c:	01412a83          	lw	s5,20(sp)
    1870:	00c12b83          	lw	s7,12(sp)
    1874:	00412c83          	lw	s9,4(sp)
    1878:	0014e793          	or	a5,s1,1
    187c:	00f42223          	sw	a5,4(s0)
    1880:	009404b3          	add	s1,s0,s1
    1884:	0099a423          	sw	s1,8(s3)
    1888:	00176713          	or	a4,a4,1
    188c:	00090513          	mv	a0,s2
    1890:	00e4a223          	sw	a4,4(s1)
    1894:	468000ef          	jal	1cfc <__malloc_unlock>
    1898:	02c12083          	lw	ra,44(sp)
    189c:	00840513          	add	a0,s0,8
    18a0:	02812403          	lw	s0,40(sp)
    18a4:	01012b03          	lw	s6,16(sp)
    18a8:	02412483          	lw	s1,36(sp)
    18ac:	02012903          	lw	s2,32(sp)
    18b0:	01c12983          	lw	s3,28(sp)
    18b4:	03010113          	add	sp,sp,48
    18b8:	00008067          	ret
    18bc:	0049a503          	lw	a0,4(s3)
    18c0:	de9ff06f          	j	16a8 <_malloc_r+0x198>
    18c4:	00842603          	lw	a2,8(s0)
    18c8:	cb1ff06f          	j	1578 <_malloc_r+0x68>
    18cc:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    18d0:	00258593          	add	a1,a1,2
    18d4:	d68780e3          	beq	a5,s0,1634 <_malloc_r+0x124>
    18d8:	c91ff06f          	j	1568 <_malloc_r+0x58>
    18dc:	0097d713          	srl	a4,a5,0x9
    18e0:	00400693          	li	a3,4
    18e4:	14e6f263          	bgeu	a3,a4,1a28 <_malloc_r+0x518>
    18e8:	01400693          	li	a3,20
    18ec:	32e6e663          	bltu	a3,a4,1c18 <_malloc_r+0x708>
    18f0:	05c70613          	add	a2,a4,92
    18f4:	05b70693          	add	a3,a4,91
    18f8:	00361613          	sll	a2,a2,0x3
    18fc:	00c98633          	add	a2,s3,a2
    1900:	00062703          	lw	a4,0(a2)
    1904:	ff860613          	add	a2,a2,-8
    1908:	00e61863          	bne	a2,a4,1918 <_malloc_r+0x408>
    190c:	2980006f          	j	1ba4 <_malloc_r+0x694>
    1910:	00872703          	lw	a4,8(a4)
    1914:	00e60863          	beq	a2,a4,1924 <_malloc_r+0x414>
    1918:	00472683          	lw	a3,4(a4)
    191c:	ffc6f693          	and	a3,a3,-4
    1920:	fed7e8e3          	bltu	a5,a3,1910 <_malloc_r+0x400>
    1924:	00c72603          	lw	a2,12(a4)
    1928:	00c42623          	sw	a2,12(s0)
    192c:	00e42423          	sw	a4,8(s0)
    1930:	00862423          	sw	s0,8(a2)
    1934:	00872623          	sw	s0,12(a4)
    1938:	d71ff06f          	j	16a8 <_malloc_r+0x198>
    193c:	01400713          	li	a4,20
    1940:	10f77863          	bgeu	a4,a5,1a50 <_malloc_r+0x540>
    1944:	05400713          	li	a4,84
    1948:	2ef76663          	bltu	a4,a5,1c34 <_malloc_r+0x724>
    194c:	00c4d793          	srl	a5,s1,0xc
    1950:	06f78593          	add	a1,a5,111
    1954:	06e78813          	add	a6,a5,110
    1958:	00359613          	sll	a2,a1,0x3
    195c:	c95ff06f          	j	15f0 <_malloc_r+0xe0>
    1960:	001e0e13          	add	t3,t3,1
    1964:	003e7793          	and	a5,t3,3
    1968:	00850513          	add	a0,a0,8
    196c:	10078063          	beqz	a5,1a6c <_malloc_r+0x55c>
    1970:	00c52783          	lw	a5,12(a0)
    1974:	d89ff06f          	j	16fc <_malloc_r+0x1ec>
    1978:	00842603          	lw	a2,8(s0)
    197c:	0014e593          	or	a1,s1,1
    1980:	00b42223          	sw	a1,4(s0)
    1984:	00f62623          	sw	a5,12(a2)
    1988:	00c7a423          	sw	a2,8(a5)
    198c:	009404b3          	add	s1,s0,s1
    1990:	0099aa23          	sw	s1,20(s3)
    1994:	0099a823          	sw	s1,16(s3)
    1998:	0016e793          	or	a5,a3,1
    199c:	0114a623          	sw	a7,12(s1)
    19a0:	0114a423          	sw	a7,8(s1)
    19a4:	00f4a223          	sw	a5,4(s1)
    19a8:	00e40733          	add	a4,s0,a4
    19ac:	00090513          	mv	a0,s2
    19b0:	00d72023          	sw	a3,0(a4)
    19b4:	348000ef          	jal	1cfc <__malloc_unlock>
    19b8:	00840513          	add	a0,s0,8
    19bc:	be1ff06f          	j	159c <_malloc_r+0x8c>
    19c0:	00f407b3          	add	a5,s0,a5
    19c4:	0047a703          	lw	a4,4(a5)
    19c8:	00090513          	mv	a0,s2
    19cc:	00176713          	or	a4,a4,1
    19d0:	00e7a223          	sw	a4,4(a5)
    19d4:	328000ef          	jal	1cfc <__malloc_unlock>
    19d8:	00840513          	add	a0,s0,8
    19dc:	bc1ff06f          	j	159c <_malloc_r+0x8c>
    19e0:	0034d593          	srl	a1,s1,0x3
    19e4:	00848793          	add	a5,s1,8
    19e8:	b69ff06f          	j	1550 <_malloc_r+0x40>
    19ec:	0014e693          	or	a3,s1,1
    19f0:	00d42223          	sw	a3,4(s0)
    19f4:	009404b3          	add	s1,s0,s1
    19f8:	0099aa23          	sw	s1,20(s3)
    19fc:	0099a823          	sw	s1,16(s3)
    1a00:	00176693          	or	a3,a4,1
    1a04:	0114a623          	sw	a7,12(s1)
    1a08:	0114a423          	sw	a7,8(s1)
    1a0c:	00d4a223          	sw	a3,4(s1)
    1a10:	00f407b3          	add	a5,s0,a5
    1a14:	00090513          	mv	a0,s2
    1a18:	00e7a023          	sw	a4,0(a5)
    1a1c:	2e0000ef          	jal	1cfc <__malloc_unlock>
    1a20:	00840513          	add	a0,s0,8
    1a24:	b79ff06f          	j	159c <_malloc_r+0x8c>
    1a28:	0067d713          	srl	a4,a5,0x6
    1a2c:	03970613          	add	a2,a4,57
    1a30:	03870693          	add	a3,a4,56
    1a34:	00361613          	sll	a2,a2,0x3
    1a38:	ec5ff06f          	j	18fc <_malloc_r+0x3ec>
    1a3c:	07340c63          	beq	s0,s3,1ab4 <_malloc_r+0x5a4>
    1a40:	0089a403          	lw	s0,8(s3)
    1a44:	00812c03          	lw	s8,8(sp)
    1a48:	00442783          	lw	a5,4(s0)
    1a4c:	e09ff06f          	j	1854 <_malloc_r+0x344>
    1a50:	05c78593          	add	a1,a5,92
    1a54:	05b78813          	add	a6,a5,91
    1a58:	00359613          	sll	a2,a1,0x3
    1a5c:	b95ff06f          	j	15f0 <_malloc_r+0xe0>
    1a60:	00832783          	lw	a5,8(t1)
    1a64:	fff58593          	add	a1,a1,-1
    1a68:	28679063          	bne	a5,t1,1ce8 <_malloc_r+0x7d8>
    1a6c:	0035f793          	and	a5,a1,3
    1a70:	ff830313          	add	t1,t1,-8
    1a74:	fe0796e3          	bnez	a5,1a60 <_malloc_r+0x550>
    1a78:	0049a703          	lw	a4,4(s3)
    1a7c:	fff64793          	not	a5,a2
    1a80:	00e7f7b3          	and	a5,a5,a4
    1a84:	00f9a223          	sw	a5,4(s3)
    1a88:	00161613          	sll	a2,a2,0x1
    1a8c:	ccc7eee3          	bltu	a5,a2,1768 <_malloc_r+0x258>
    1a90:	cc060ce3          	beqz	a2,1768 <_malloc_r+0x258>
    1a94:	00f67733          	and	a4,a2,a5
    1a98:	00071a63          	bnez	a4,1aac <_malloc_r+0x59c>
    1a9c:	00161613          	sll	a2,a2,0x1
    1aa0:	00f67733          	and	a4,a2,a5
    1aa4:	004e0e13          	add	t3,t3,4
    1aa8:	fe070ae3          	beqz	a4,1a9c <_malloc_r+0x58c>
    1aac:	000e0593          	mv	a1,t3
    1ab0:	c39ff06f          	j	16e8 <_malloc_r+0x1d8>
    1ab4:	7ffffc17          	auipc	s8,0x7ffff
    1ab8:	e80c0c13          	add	s8,s8,-384 # 80000934 <__malloc_current_mallinfo>
    1abc:	000c2703          	lw	a4,0(s8)
    1ac0:	00ea8733          	add	a4,s5,a4
    1ac4:	00ec2023          	sw	a4,0(s8)
    1ac8:	000ca683          	lw	a3,0(s9)
    1acc:	fff00793          	li	a5,-1
    1ad0:	18f68663          	beq	a3,a5,1c5c <_malloc_r+0x74c>
    1ad4:	414b87b3          	sub	a5,s7,s4
    1ad8:	00e787b3          	add	a5,a5,a4
    1adc:	00fc2023          	sw	a5,0(s8)
    1ae0:	007bfc93          	and	s9,s7,7
    1ae4:	0c0c8c63          	beqz	s9,1bbc <_malloc_r+0x6ac>
    1ae8:	419b8bb3          	sub	s7,s7,s9
    1aec:	000017b7          	lui	a5,0x1
    1af0:	00878793          	add	a5,a5,8 # 1008 <memcpy+0x178>
    1af4:	008b8b93          	add	s7,s7,8
    1af8:	419785b3          	sub	a1,a5,s9
    1afc:	015b8ab3          	add	s5,s7,s5
    1b00:	415585b3          	sub	a1,a1,s5
    1b04:	01459593          	sll	a1,a1,0x14
    1b08:	0145da13          	srl	s4,a1,0x14
    1b0c:	000a0593          	mv	a1,s4
    1b10:	00090513          	mv	a0,s2
    1b14:	719050ef          	jal	7a2c <_sbrk_r>
    1b18:	fff00793          	li	a5,-1
    1b1c:	18f50063          	beq	a0,a5,1c9c <_malloc_r+0x78c>
    1b20:	41750533          	sub	a0,a0,s7
    1b24:	01450ab3          	add	s5,a0,s4
    1b28:	000c2703          	lw	a4,0(s8)
    1b2c:	0179a423          	sw	s7,8(s3)
    1b30:	001ae793          	or	a5,s5,1
    1b34:	00ea05b3          	add	a1,s4,a4
    1b38:	00bc2023          	sw	a1,0(s8)
    1b3c:	00fba223          	sw	a5,4(s7)
    1b40:	cf3402e3          	beq	s0,s3,1824 <_malloc_r+0x314>
    1b44:	00f00693          	li	a3,15
    1b48:	0b66f063          	bgeu	a3,s6,1be8 <_malloc_r+0x6d8>
    1b4c:	00442703          	lw	a4,4(s0)
    1b50:	ff4b0793          	add	a5,s6,-12
    1b54:	ff87f793          	and	a5,a5,-8
    1b58:	00177713          	and	a4,a4,1
    1b5c:	00f76733          	or	a4,a4,a5
    1b60:	00e42223          	sw	a4,4(s0)
    1b64:	00500613          	li	a2,5
    1b68:	00f40733          	add	a4,s0,a5
    1b6c:	00c72223          	sw	a2,4(a4)
    1b70:	00c72423          	sw	a2,8(a4)
    1b74:	00f6e663          	bltu	a3,a5,1b80 <_malloc_r+0x670>
    1b78:	004ba783          	lw	a5,4(s7)
    1b7c:	ca9ff06f          	j	1824 <_malloc_r+0x314>
    1b80:	00840593          	add	a1,s0,8
    1b84:	00090513          	mv	a0,s2
    1b88:	e7cff0ef          	jal	1204 <_free_r>
    1b8c:	0089ab83          	lw	s7,8(s3)
    1b90:	000c2583          	lw	a1,0(s8)
    1b94:	004ba783          	lw	a5,4(s7)
    1b98:	c8dff06f          	j	1824 <_malloc_r+0x314>
    1b9c:	010a8a93          	add	s5,s5,16
    1ba0:	c31ff06f          	j	17d0 <_malloc_r+0x2c0>
    1ba4:	4026d693          	sra	a3,a3,0x2
    1ba8:	00100793          	li	a5,1
    1bac:	00d797b3          	sll	a5,a5,a3
    1bb0:	00f56533          	or	a0,a0,a5
    1bb4:	00a9a223          	sw	a0,4(s3)
    1bb8:	d71ff06f          	j	1928 <_malloc_r+0x418>
    1bbc:	015b85b3          	add	a1,s7,s5
    1bc0:	40b005b3          	neg	a1,a1
    1bc4:	01459593          	sll	a1,a1,0x14
    1bc8:	0145da13          	srl	s4,a1,0x14
    1bcc:	000a0593          	mv	a1,s4
    1bd0:	00090513          	mv	a0,s2
    1bd4:	659050ef          	jal	7a2c <_sbrk_r>
    1bd8:	fff00793          	li	a5,-1
    1bdc:	f4f512e3          	bne	a0,a5,1b20 <_malloc_r+0x610>
    1be0:	00000a13          	li	s4,0
    1be4:	f45ff06f          	j	1b28 <_malloc_r+0x618>
    1be8:	00812c03          	lw	s8,8(sp)
    1bec:	00100793          	li	a5,1
    1bf0:	00fba223          	sw	a5,4(s7)
    1bf4:	00090513          	mv	a0,s2
    1bf8:	104000ef          	jal	1cfc <__malloc_unlock>
    1bfc:	00000513          	li	a0,0
    1c00:	01812a03          	lw	s4,24(sp)
    1c04:	01412a83          	lw	s5,20(sp)
    1c08:	01012b03          	lw	s6,16(sp)
    1c0c:	00c12b83          	lw	s7,12(sp)
    1c10:	00412c83          	lw	s9,4(sp)
    1c14:	989ff06f          	j	159c <_malloc_r+0x8c>
    1c18:	05400693          	li	a3,84
    1c1c:	04e6e463          	bltu	a3,a4,1c64 <_malloc_r+0x754>
    1c20:	00c7d713          	srl	a4,a5,0xc
    1c24:	06f70613          	add	a2,a4,111
    1c28:	06e70693          	add	a3,a4,110
    1c2c:	00361613          	sll	a2,a2,0x3
    1c30:	ccdff06f          	j	18fc <_malloc_r+0x3ec>
    1c34:	15400713          	li	a4,340
    1c38:	04f76463          	bltu	a4,a5,1c80 <_malloc_r+0x770>
    1c3c:	00f4d793          	srl	a5,s1,0xf
    1c40:	07878593          	add	a1,a5,120
    1c44:	07778813          	add	a6,a5,119
    1c48:	00359613          	sll	a2,a1,0x3
    1c4c:	9a5ff06f          	j	15f0 <_malloc_r+0xe0>
    1c50:	0089a403          	lw	s0,8(s3)
    1c54:	00442783          	lw	a5,4(s0)
    1c58:	bfdff06f          	j	1854 <_malloc_r+0x344>
    1c5c:	017ca023          	sw	s7,0(s9)
    1c60:	e81ff06f          	j	1ae0 <_malloc_r+0x5d0>
    1c64:	15400693          	li	a3,340
    1c68:	04e6e463          	bltu	a3,a4,1cb0 <_malloc_r+0x7a0>
    1c6c:	00f7d713          	srl	a4,a5,0xf
    1c70:	07870613          	add	a2,a4,120
    1c74:	07770693          	add	a3,a4,119
    1c78:	00361613          	sll	a2,a2,0x3
    1c7c:	c81ff06f          	j	18fc <_malloc_r+0x3ec>
    1c80:	55400713          	li	a4,1364
    1c84:	04f76463          	bltu	a4,a5,1ccc <_malloc_r+0x7bc>
    1c88:	0124d793          	srl	a5,s1,0x12
    1c8c:	07d78593          	add	a1,a5,125
    1c90:	07c78813          	add	a6,a5,124
    1c94:	00359613          	sll	a2,a1,0x3
    1c98:	959ff06f          	j	15f0 <_malloc_r+0xe0>
    1c9c:	ff8c8c93          	add	s9,s9,-8
    1ca0:	019a8ab3          	add	s5,s5,s9
    1ca4:	417a8ab3          	sub	s5,s5,s7
    1ca8:	00000a13          	li	s4,0
    1cac:	e7dff06f          	j	1b28 <_malloc_r+0x618>
    1cb0:	55400693          	li	a3,1364
    1cb4:	02e6e463          	bltu	a3,a4,1cdc <_malloc_r+0x7cc>
    1cb8:	0127d713          	srl	a4,a5,0x12
    1cbc:	07d70613          	add	a2,a4,125
    1cc0:	07c70693          	add	a3,a4,124
    1cc4:	00361613          	sll	a2,a2,0x3
    1cc8:	c35ff06f          	j	18fc <_malloc_r+0x3ec>
    1ccc:	3f800613          	li	a2,1016
    1cd0:	07f00593          	li	a1,127
    1cd4:	07e00813          	li	a6,126
    1cd8:	919ff06f          	j	15f0 <_malloc_r+0xe0>
    1cdc:	3f800613          	li	a2,1016
    1ce0:	07e00693          	li	a3,126
    1ce4:	c19ff06f          	j	18fc <_malloc_r+0x3ec>
    1ce8:	0049a783          	lw	a5,4(s3)
    1cec:	d9dff06f          	j	1a88 <_malloc_r+0x578>

00001cf0 <__malloc_lock>:
    1cf0:	7ffff517          	auipc	a0,0x7ffff
    1cf4:	a2c50513          	add	a0,a0,-1492 # 8000071c <__lock___malloc_recursive_mutex>
    1cf8:	8b4ff06f          	j	dac <__retarget_lock_acquire_recursive>

00001cfc <__malloc_unlock>:
    1cfc:	7ffff517          	auipc	a0,0x7ffff
    1d00:	a2050513          	add	a0,a0,-1504 # 8000071c <__lock___malloc_recursive_mutex>
    1d04:	8acff06f          	j	db0 <__retarget_lock_release_recursive>

00001d08 <_vfprintf_r>:
    1d08:	e7010113          	add	sp,sp,-400
    1d0c:	18112623          	sw	ra,396(sp)
    1d10:	00b12423          	sw	a1,8(sp)
    1d14:	00c12623          	sw	a2,12(sp)
    1d18:	00d12a23          	sw	a3,20(sp)
    1d1c:	17312e23          	sw	s3,380(sp)
    1d20:	18812423          	sw	s0,392(sp)
    1d24:	00050993          	mv	s3,a0
    1d28:	3d9050ef          	jal	7900 <_localeconv_r>
    1d2c:	00052783          	lw	a5,0(a0)
    1d30:	00078513          	mv	a0,a5
    1d34:	02f12a23          	sw	a5,52(sp)
    1d38:	afcff0ef          	jal	1034 <strlen>
    1d3c:	00050713          	mv	a4,a0
    1d40:	00800613          	li	a2,8
    1d44:	00000593          	li	a1,0
    1d48:	09010513          	add	a0,sp,144
    1d4c:	02e12823          	sw	a4,48(sp)
    1d50:	864ff0ef          	jal	db4 <memset>
    1d54:	00c12783          	lw	a5,12(sp)
    1d58:	00098863          	beqz	s3,1d68 <_vfprintf_r+0x60>
    1d5c:	0349a703          	lw	a4,52(s3)
    1d60:	00071463          	bnez	a4,1d68 <_vfprintf_r+0x60>
    1d64:	29d0106f          	j	3800 <_vfprintf_r+0x1af8>
    1d68:	00812703          	lw	a4,8(sp)
    1d6c:	06472683          	lw	a3,100(a4)
    1d70:	00c71703          	lh	a4,12(a4)
    1d74:	0016f693          	and	a3,a3,1
    1d78:	00069863          	bnez	a3,1d88 <_vfprintf_r+0x80>
    1d7c:	20077693          	and	a3,a4,512
    1d80:	00069463          	bnez	a3,1d88 <_vfprintf_r+0x80>
    1d84:	3ec0106f          	j	3170 <_vfprintf_r+0x1468>
    1d88:	01271693          	sll	a3,a4,0x12
    1d8c:	0206c863          	bltz	a3,1dbc <_vfprintf_r+0xb4>
    1d90:	00812503          	lw	a0,8(sp)
    1d94:	000025b7          	lui	a1,0x2
    1d98:	ffffe637          	lui	a2,0xffffe
    1d9c:	06452683          	lw	a3,100(a0)
    1da0:	00b76733          	or	a4,a4,a1
    1da4:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1da8:	01071713          	sll	a4,a4,0x10
    1dac:	41075713          	sra	a4,a4,0x10
    1db0:	00c6f6b3          	and	a3,a3,a2
    1db4:	00e51623          	sh	a4,12(a0)
    1db8:	06d52223          	sw	a3,100(a0)
    1dbc:	00877693          	and	a3,a4,8
    1dc0:	2a068063          	beqz	a3,2060 <_vfprintf_r+0x358>
    1dc4:	00812683          	lw	a3,8(sp)
    1dc8:	0106a683          	lw	a3,16(a3)
    1dcc:	28068a63          	beqz	a3,2060 <_vfprintf_r+0x358>
    1dd0:	01a77693          	and	a3,a4,26
    1dd4:	00a00613          	li	a2,10
    1dd8:	2ac68c63          	beq	a3,a2,2090 <_vfprintf_r+0x388>
    1ddc:	0ac10713          	add	a4,sp,172
    1de0:	17512a23          	sw	s5,372(sp)
    1de4:	17812423          	sw	s8,360(sp)
    1de8:	15b12e23          	sw	s11,348(sp)
    1dec:	18912223          	sw	s1,388(sp)
    1df0:	19212023          	sw	s2,384(sp)
    1df4:	17412c23          	sw	s4,376(sp)
    1df8:	17612823          	sw	s6,368(sp)
    1dfc:	17712623          	sw	s7,364(sp)
    1e00:	17912223          	sw	s9,356(sp)
    1e04:	17a12023          	sw	s10,352(sp)
    1e08:	0ae12023          	sw	a4,160(sp)
    1e0c:	0a012423          	sw	zero,168(sp)
    1e10:	0a012223          	sw	zero,164(sp)
    1e14:	00012c23          	sw	zero,24(sp)
    1e18:	02012423          	sw	zero,40(sp)
    1e1c:	02012623          	sw	zero,44(sp)
    1e20:	00070413          	mv	s0,a4
    1e24:	02012c23          	sw	zero,56(sp)
    1e28:	04012023          	sw	zero,64(sp)
    1e2c:	02012e23          	sw	zero,60(sp)
    1e30:	04012623          	sw	zero,76(sp)
    1e34:	04012423          	sw	zero,72(sp)
    1e38:	00012623          	sw	zero,12(sp)
    1e3c:	7fffea97          	auipc	s5,0x7fffe
    1e40:	6f8a8a93          	add	s5,s5,1784 # 80000534 <__global_locale>
    1e44:	02500d93          	li	s11,37
    1e48:	00078c13          	mv	s8,a5
    1e4c:	000c0913          	mv	s2,s8
    1e50:	0e4aa483          	lw	s1,228(s5)
    1e54:	2a1050ef          	jal	78f4 <__locale_mb_cur_max>
    1e58:	00050693          	mv	a3,a0
    1e5c:	09010713          	add	a4,sp,144
    1e60:	00090613          	mv	a2,s2
    1e64:	08010593          	add	a1,sp,128
    1e68:	00098513          	mv	a0,s3
    1e6c:	000480e7          	jalr	s1
    1e70:	2c050a63          	beqz	a0,2144 <_vfprintf_r+0x43c>
    1e74:	2a054a63          	bltz	a0,2128 <_vfprintf_r+0x420>
    1e78:	08012783          	lw	a5,128(sp)
    1e7c:	01b78663          	beq	a5,s11,1e88 <_vfprintf_r+0x180>
    1e80:	00a90933          	add	s2,s2,a0
    1e84:	fcdff06f          	j	1e50 <_vfprintf_r+0x148>
    1e88:	00050493          	mv	s1,a0
    1e8c:	41890cb3          	sub	s9,s2,s8
    1e90:	2d891063          	bne	s2,s8,2150 <_vfprintf_r+0x448>
    1e94:	fff00313          	li	t1,-1
    1e98:	00000e93          	li	t4,0
    1e9c:	00194e03          	lbu	t3,1(s2)
    1ea0:	06010ba3          	sb	zero,119(sp)
    1ea4:	00190913          	add	s2,s2,1
    1ea8:	00000b93          	li	s7,0
    1eac:	05a00493          	li	s1,90
    1eb0:	000e8a13          	mv	s4,t4
    1eb4:	00030b13          	mv	s6,t1
    1eb8:	00190913          	add	s2,s2,1
    1ebc:	fe0e0793          	add	a5,t3,-32
    1ec0:	04f4ea63          	bltu	s1,a5,1f14 <_vfprintf_r+0x20c>
    1ec4:	0000d717          	auipc	a4,0xd
    1ec8:	32070713          	add	a4,a4,800 # f1e4 <_ctype_+0x104>
    1ecc:	00279793          	sll	a5,a5,0x2
    1ed0:	00e787b3          	add	a5,a5,a4
    1ed4:	0007a783          	lw	a5,0(a5)
    1ed8:	00e787b3          	add	a5,a5,a4
    1edc:	00078067          	jr	a5
    1ee0:	00000b93          	li	s7,0
    1ee4:	fd0e0713          	add	a4,t3,-48
    1ee8:	00900693          	li	a3,9
    1eec:	00094e03          	lbu	t3,0(s2)
    1ef0:	002b9793          	sll	a5,s7,0x2
    1ef4:	017787b3          	add	a5,a5,s7
    1ef8:	00179793          	sll	a5,a5,0x1
    1efc:	00f70bb3          	add	s7,a4,a5
    1f00:	fd0e0713          	add	a4,t3,-48
    1f04:	00190913          	add	s2,s2,1
    1f08:	fee6f2e3          	bgeu	a3,a4,1eec <_vfprintf_r+0x1e4>
    1f0c:	fe0e0793          	add	a5,t3,-32
    1f10:	faf4fae3          	bgeu	s1,a5,1ec4 <_vfprintf_r+0x1bc>
    1f14:	000a0e93          	mv	t4,s4
    1f18:	260e0a63          	beqz	t3,218c <_vfprintf_r+0x484>
    1f1c:	0fc10623          	sb	t3,236(sp)
    1f20:	06010ba3          	sb	zero,119(sp)
    1f24:	00100c93          	li	s9,1
    1f28:	00000613          	li	a2,0
    1f2c:	00012823          	sw	zero,16(sp)
    1f30:	00100d13          	li	s10,1
    1f34:	00000313          	li	t1,0
    1f38:	02012223          	sw	zero,36(sp)
    1f3c:	02012023          	sw	zero,32(sp)
    1f40:	00000a13          	li	s4,0
    1f44:	0ec10c13          	add	s8,sp,236
    1f48:	002ef293          	and	t0,t4,2
    1f4c:	00028463          	beqz	t0,1f54 <_vfprintf_r+0x24c>
    1f50:	002c8c93          	add	s9,s9,2
    1f54:	084eff93          	and	t6,t4,132
    1f58:	0a812483          	lw	s1,168(sp)
    1f5c:	000f9663          	bnez	t6,1f68 <_vfprintf_r+0x260>
    1f60:	419b8733          	sub	a4,s7,s9
    1f64:	40e04663          	bgtz	a4,2370 <_vfprintf_r+0x668>
    1f68:	02060a63          	beqz	a2,1f9c <_vfprintf_r+0x294>
    1f6c:	0a412703          	lw	a4,164(sp)
    1f70:	07710613          	add	a2,sp,119
    1f74:	00148493          	add	s1,s1,1
    1f78:	00170713          	add	a4,a4,1
    1f7c:	00100793          	li	a5,1
    1f80:	00c42023          	sw	a2,0(s0)
    1f84:	00f42223          	sw	a5,4(s0)
    1f88:	0a912423          	sw	s1,168(sp)
    1f8c:	0ae12223          	sw	a4,164(sp)
    1f90:	00700613          	li	a2,7
    1f94:	00840413          	add	s0,s0,8
    1f98:	4ce64863          	blt	a2,a4,2468 <_vfprintf_r+0x760>
    1f9c:	02028a63          	beqz	t0,1fd0 <_vfprintf_r+0x2c8>
    1fa0:	0a412703          	lw	a4,164(sp)
    1fa4:	07810613          	add	a2,sp,120
    1fa8:	00c42023          	sw	a2,0(s0)
    1fac:	00248493          	add	s1,s1,2
    1fb0:	00200613          	li	a2,2
    1fb4:	00170713          	add	a4,a4,1
    1fb8:	00c42223          	sw	a2,4(s0)
    1fbc:	0a912423          	sw	s1,168(sp)
    1fc0:	0ae12223          	sw	a4,164(sp)
    1fc4:	00700613          	li	a2,7
    1fc8:	00840413          	add	s0,s0,8
    1fcc:	5ce644e3          	blt	a2,a4,2d94 <_vfprintf_r+0x108c>
    1fd0:	08000713          	li	a4,128
    1fd4:	3aef80e3          	beq	t6,a4,2b74 <_vfprintf_r+0xe6c>
    1fd8:	41a30b33          	sub	s6,t1,s10
    1fdc:	4b604ae3          	bgtz	s6,2c90 <_vfprintf_r+0xf88>
    1fe0:	100ef713          	and	a4,t4,256
    1fe4:	1a0710e3          	bnez	a4,2984 <_vfprintf_r+0xc7c>
    1fe8:	0a412783          	lw	a5,164(sp)
    1fec:	01a484b3          	add	s1,s1,s10
    1ff0:	01842023          	sw	s8,0(s0)
    1ff4:	00178793          	add	a5,a5,1
    1ff8:	01a42223          	sw	s10,4(s0)
    1ffc:	0a912423          	sw	s1,168(sp)
    2000:	0af12223          	sw	a5,164(sp)
    2004:	00700713          	li	a4,7
    2008:	58f74c63          	blt	a4,a5,25a0 <_vfprintf_r+0x898>
    200c:	00840413          	add	s0,s0,8
    2010:	004eff13          	and	t5,t4,4
    2014:	000f0663          	beqz	t5,2020 <_vfprintf_r+0x318>
    2018:	419b8d33          	sub	s10,s7,s9
    201c:	5ba04ce3          	bgtz	s10,2dd4 <_vfprintf_r+0x10cc>
    2020:	000b8e93          	mv	t4,s7
    2024:	019bd463          	bge	s7,s9,202c <_vfprintf_r+0x324>
    2028:	000c8e93          	mv	t4,s9
    202c:	00c12783          	lw	a5,12(sp)
    2030:	01d787b3          	add	a5,a5,t4
    2034:	00f12623          	sw	a5,12(sp)
    2038:	18049663          	bnez	s1,21c4 <_vfprintf_r+0x4bc>
    203c:	01012783          	lw	a5,16(sp)
    2040:	0a012223          	sw	zero,164(sp)
    2044:	00078863          	beqz	a5,2054 <_vfprintf_r+0x34c>
    2048:	01012583          	lw	a1,16(sp)
    204c:	00098513          	mv	a0,s3
    2050:	9b4ff0ef          	jal	1204 <_free_r>
    2054:	0ac10413          	add	s0,sp,172
    2058:	00090c13          	mv	s8,s2
    205c:	df1ff06f          	j	1e4c <_vfprintf_r+0x144>
    2060:	00812403          	lw	s0,8(sp)
    2064:	00098513          	mv	a0,s3
    2068:	00f12623          	sw	a5,12(sp)
    206c:	00040593          	mv	a1,s0
    2070:	3a4050ef          	jal	7414 <__swsetup_r>
    2074:	00050463          	beqz	a0,207c <_vfprintf_r+0x374>
    2078:	5600206f          	j	45d8 <_vfprintf_r+0x28d0>
    207c:	00c41703          	lh	a4,12(s0)
    2080:	00a00613          	li	a2,10
    2084:	00c12783          	lw	a5,12(sp)
    2088:	01a77693          	and	a3,a4,26
    208c:	d4c698e3          	bne	a3,a2,1ddc <_vfprintf_r+0xd4>
    2090:	00812603          	lw	a2,8(sp)
    2094:	00e61683          	lh	a3,14(a2)
    2098:	d406c2e3          	bltz	a3,1ddc <_vfprintf_r+0xd4>
    209c:	06462683          	lw	a3,100(a2)
    20a0:	0016f693          	and	a3,a3,1
    20a4:	00069863          	bnez	a3,20b4 <_vfprintf_r+0x3ac>
    20a8:	20077713          	and	a4,a4,512
    20ac:	00071463          	bnez	a4,20b4 <_vfprintf_r+0x3ac>
    20b0:	53d0106f          	j	3dec <_vfprintf_r+0x20e4>
    20b4:	01412683          	lw	a3,20(sp)
    20b8:	00812583          	lw	a1,8(sp)
    20bc:	00098513          	mv	a0,s3
    20c0:	00078613          	mv	a2,a5
    20c4:	0e5020ef          	jal	49a8 <__sbprintf>
    20c8:	18c12083          	lw	ra,396(sp)
    20cc:	18812403          	lw	s0,392(sp)
    20d0:	00a12623          	sw	a0,12(sp)
    20d4:	00c12503          	lw	a0,12(sp)
    20d8:	17c12983          	lw	s3,380(sp)
    20dc:	19010113          	add	sp,sp,400
    20e0:	00008067          	ret
    20e4:	00098513          	mv	a0,s3
    20e8:	019050ef          	jal	7900 <_localeconv_r>
    20ec:	00452783          	lw	a5,4(a0)
    20f0:	00078513          	mv	a0,a5
    20f4:	04f12423          	sw	a5,72(sp)
    20f8:	f3dfe0ef          	jal	1034 <strlen>
    20fc:	00050793          	mv	a5,a0
    2100:	00098513          	mv	a0,s3
    2104:	00078c93          	mv	s9,a5
    2108:	04f12623          	sw	a5,76(sp)
    210c:	7f4050ef          	jal	7900 <_localeconv_r>
    2110:	00852703          	lw	a4,8(a0)
    2114:	02e12e23          	sw	a4,60(sp)
    2118:	000c8463          	beqz	s9,2120 <_vfprintf_r+0x418>
    211c:	1ec0106f          	j	3308 <_vfprintf_r+0x1600>
    2120:	00094e03          	lbu	t3,0(s2)
    2124:	d95ff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    2128:	00800613          	li	a2,8
    212c:	00000593          	li	a1,0
    2130:	09010513          	add	a0,sp,144
    2134:	c81fe0ef          	jal	db4 <memset>
    2138:	00100513          	li	a0,1
    213c:	00a90933          	add	s2,s2,a0
    2140:	d11ff06f          	j	1e50 <_vfprintf_r+0x148>
    2144:	00050493          	mv	s1,a0
    2148:	41890cb3          	sub	s9,s2,s8
    214c:	05890063          	beq	s2,s8,218c <_vfprintf_r+0x484>
    2150:	0a812683          	lw	a3,168(sp)
    2154:	0a412703          	lw	a4,164(sp)
    2158:	01842023          	sw	s8,0(s0)
    215c:	019686b3          	add	a3,a3,s9
    2160:	00170713          	add	a4,a4,1
    2164:	01942223          	sw	s9,4(s0)
    2168:	0ad12423          	sw	a3,168(sp)
    216c:	0ae12223          	sw	a4,164(sp)
    2170:	00700693          	li	a3,7
    2174:	00840413          	add	s0,s0,8
    2178:	02e6c863          	blt	a3,a4,21a8 <_vfprintf_r+0x4a0>
    217c:	00c12783          	lw	a5,12(sp)
    2180:	019787b3          	add	a5,a5,s9
    2184:	00f12623          	sw	a5,12(sp)
    2188:	d00496e3          	bnez	s1,1e94 <_vfprintf_r+0x18c>
    218c:	0a812783          	lw	a5,168(sp)
    2190:	00078463          	beqz	a5,2198 <_vfprintf_r+0x490>
    2194:	4090106f          	j	3d9c <_vfprintf_r+0x2094>
    2198:	00812783          	lw	a5,8(sp)
    219c:	0a012223          	sw	zero,164(sp)
    21a0:	00c79783          	lh	a5,12(a5)
    21a4:	0500006f          	j	21f4 <_vfprintf_r+0x4ec>
    21a8:	00812583          	lw	a1,8(sp)
    21ac:	0a010613          	add	a2,sp,160
    21b0:	00098513          	mv	a0,s3
    21b4:	211020ef          	jal	4bc4 <__sprint_r>
    21b8:	02051a63          	bnez	a0,21ec <_vfprintf_r+0x4e4>
    21bc:	0ac10413          	add	s0,sp,172
    21c0:	fbdff06f          	j	217c <_vfprintf_r+0x474>
    21c4:	00812583          	lw	a1,8(sp)
    21c8:	0a010613          	add	a2,sp,160
    21cc:	00098513          	mv	a0,s3
    21d0:	1f5020ef          	jal	4bc4 <__sprint_r>
    21d4:	e60504e3          	beqz	a0,203c <_vfprintf_r+0x334>
    21d8:	01012283          	lw	t0,16(sp)
    21dc:	00028863          	beqz	t0,21ec <_vfprintf_r+0x4e4>
    21e0:	00028593          	mv	a1,t0
    21e4:	00098513          	mv	a0,s3
    21e8:	81cff0ef          	jal	1204 <_free_r>
    21ec:	00812783          	lw	a5,8(sp)
    21f0:	00c79783          	lh	a5,12(a5)
    21f4:	00812703          	lw	a4,8(sp)
    21f8:	06472703          	lw	a4,100(a4)
    21fc:	00177713          	and	a4,a4,1
    2200:	3c070463          	beqz	a4,25c8 <_vfprintf_r+0x8c0>
    2204:	0407f793          	and	a5,a5,64
    2208:	18412483          	lw	s1,388(sp)
    220c:	18012903          	lw	s2,384(sp)
    2210:	17812a03          	lw	s4,376(sp)
    2214:	17412a83          	lw	s5,372(sp)
    2218:	17012b03          	lw	s6,368(sp)
    221c:	16c12b83          	lw	s7,364(sp)
    2220:	16812c03          	lw	s8,360(sp)
    2224:	16412c83          	lw	s9,356(sp)
    2228:	16012d03          	lw	s10,352(sp)
    222c:	15c12d83          	lw	s11,348(sp)
    2230:	00078463          	beqz	a5,2238 <_vfprintf_r+0x530>
    2234:	3d00206f          	j	4604 <_vfprintf_r+0x28fc>
    2238:	18c12083          	lw	ra,396(sp)
    223c:	18812403          	lw	s0,392(sp)
    2240:	00c12503          	lw	a0,12(sp)
    2244:	17c12983          	lw	s3,380(sp)
    2248:	19010113          	add	sp,sp,400
    224c:	00008067          	ret
    2250:	008a7713          	and	a4,s4,8
    2254:	000a0e93          	mv	t4,s4
    2258:	000b0313          	mv	t1,s6
    225c:	00070463          	beqz	a4,2264 <_vfprintf_r+0x55c>
    2260:	0200106f          	j	3280 <_vfprintf_r+0x1578>
    2264:	01412783          	lw	a5,20(sp)
    2268:	00778b13          	add	s6,a5,7
    226c:	ff8b7b13          	and	s6,s6,-8
    2270:	000b2783          	lw	a5,0(s6)
    2274:	02f12423          	sw	a5,40(sp)
    2278:	004b2783          	lw	a5,4(s6)
    227c:	02f12623          	sw	a5,44(sp)
    2280:	008b0793          	add	a5,s6,8
    2284:	00f12a23          	sw	a5,20(sp)
    2288:	02c12a03          	lw	s4,44(sp)
    228c:	7fffe717          	auipc	a4,0x7fffe
    2290:	41470713          	add	a4,a4,1044 # 800006a0 <__global_locale+0x16c>
    2294:	00072c83          	lw	s9,0(a4)
    2298:	00472d03          	lw	s10,4(a4)
    229c:	02812b03          	lw	s6,40(sp)
    22a0:	001a1493          	sll	s1,s4,0x1
    22a4:	0014d493          	srl	s1,s1,0x1
    22a8:	000b0513          	mv	a0,s6
    22ac:	00048593          	mv	a1,s1
    22b0:	000c8613          	mv	a2,s9
    22b4:	000d0693          	mv	a3,s10
    22b8:	02612223          	sw	t1,36(sp)
    22bc:	03c12023          	sw	t3,32(sp)
    22c0:	01d12823          	sw	t4,16(sp)
    22c4:	26c0c0ef          	jal	e530 <__unorddf2>
    22c8:	01012e83          	lw	t4,16(sp)
    22cc:	02012e03          	lw	t3,32(sp)
    22d0:	02412303          	lw	t1,36(sp)
    22d4:	00050463          	beqz	a0,22dc <_vfprintf_r+0x5d4>
    22d8:	4080106f          	j	36e0 <_vfprintf_r+0x19d8>
    22dc:	000b0513          	mv	a0,s6
    22e0:	00048593          	mv	a1,s1
    22e4:	000c8613          	mv	a2,s9
    22e8:	000d0693          	mv	a3,s10
    22ec:	0a40b0ef          	jal	d390 <__ledf2>
    22f0:	01012e83          	lw	t4,16(sp)
    22f4:	02012e03          	lw	t3,32(sp)
    22f8:	02412303          	lw	t1,36(sp)
    22fc:	00a04463          	bgtz	a0,2304 <_vfprintf_r+0x5fc>
    2300:	3e00106f          	j	36e0 <_vfprintf_r+0x19d8>
    2304:	000b0513          	mv	a0,s6
    2308:	000a0593          	mv	a1,s4
    230c:	00000613          	li	a2,0
    2310:	00000693          	li	a3,0
    2314:	07c0b0ef          	jal	d390 <__ledf2>
    2318:	01012e83          	lw	t4,16(sp)
    231c:	02012e03          	lw	t3,32(sp)
    2320:	00055463          	bgez	a0,2328 <_vfprintf_r+0x620>
    2324:	6650106f          	j	4188 <_vfprintf_r+0x2480>
    2328:	07714603          	lbu	a2,119(sp)
    232c:	04700713          	li	a4,71
    2330:	0000dc17          	auipc	s8,0xd
    2334:	bc4c0c13          	add	s8,s8,-1084 # eef4 <__fini_array_end+0x19c>
    2338:	01c74663          	blt	a4,t3,2344 <_vfprintf_r+0x63c>
    233c:	0000dc17          	auipc	s8,0xd
    2340:	bb4c0c13          	add	s8,s8,-1100 # eef0 <__fini_array_end+0x198>
    2344:	00012823          	sw	zero,16(sp)
    2348:	02012223          	sw	zero,36(sp)
    234c:	02012023          	sw	zero,32(sp)
    2350:	f7fefe93          	and	t4,t4,-129
    2354:	00300c93          	li	s9,3
    2358:	00300d13          	li	s10,3
    235c:	00000313          	li	t1,0
    2360:	00000a13          	li	s4,0
    2364:	be0602e3          	beqz	a2,1f48 <_vfprintf_r+0x240>
    2368:	001c8c93          	add	s9,s9,1
    236c:	bddff06f          	j	1f48 <_vfprintf_r+0x240>
    2370:	01000593          	li	a1,16
    2374:	0a412603          	lw	a2,164(sp)
    2378:	0000db17          	auipc	s6,0xd
    237c:	080b0b13          	add	s6,s6,128 # f3f8 <blanks.1>
    2380:	0ae5dc63          	bge	a1,a4,2438 <_vfprintf_r+0x730>
    2384:	00040793          	mv	a5,s0
    2388:	00048693          	mv	a3,s1
    238c:	01000893          	li	a7,16
    2390:	000b0493          	mv	s1,s6
    2394:	00700393          	li	t2,7
    2398:	000a0b13          	mv	s6,s4
    239c:	04512223          	sw	t0,68(sp)
    23a0:	05f12823          	sw	t6,80(sp)
    23a4:	05d12a23          	sw	t4,84(sp)
    23a8:	05c12c23          	sw	t3,88(sp)
    23ac:	00070413          	mv	s0,a4
    23b0:	00030a13          	mv	s4,t1
    23b4:	00c0006f          	j	23c0 <_vfprintf_r+0x6b8>
    23b8:	ff040413          	add	s0,s0,-16
    23bc:	0488da63          	bge	a7,s0,2410 <_vfprintf_r+0x708>
    23c0:	01068693          	add	a3,a3,16
    23c4:	00160613          	add	a2,a2,1
    23c8:	0097a023          	sw	s1,0(a5)
    23cc:	0117a223          	sw	a7,4(a5)
    23d0:	0ad12423          	sw	a3,168(sp)
    23d4:	0ac12223          	sw	a2,164(sp)
    23d8:	00878793          	add	a5,a5,8
    23dc:	fcc3dee3          	bge	t2,a2,23b8 <_vfprintf_r+0x6b0>
    23e0:	00812583          	lw	a1,8(sp)
    23e4:	0a010613          	add	a2,sp,160
    23e8:	00098513          	mv	a0,s3
    23ec:	7d8020ef          	jal	4bc4 <__sprint_r>
    23f0:	de0514e3          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    23f4:	01000893          	li	a7,16
    23f8:	ff040413          	add	s0,s0,-16
    23fc:	0a812683          	lw	a3,168(sp)
    2400:	0a412603          	lw	a2,164(sp)
    2404:	0ac10793          	add	a5,sp,172
    2408:	00700393          	li	t2,7
    240c:	fa88cae3          	blt	a7,s0,23c0 <_vfprintf_r+0x6b8>
    2410:	04412283          	lw	t0,68(sp)
    2414:	05012f83          	lw	t6,80(sp)
    2418:	05412e83          	lw	t4,84(sp)
    241c:	05812e03          	lw	t3,88(sp)
    2420:	000a0313          	mv	t1,s4
    2424:	00040713          	mv	a4,s0
    2428:	000b0a13          	mv	s4,s6
    242c:	00078413          	mv	s0,a5
    2430:	00048b13          	mv	s6,s1
    2434:	00068493          	mv	s1,a3
    2438:	00e484b3          	add	s1,s1,a4
    243c:	00160613          	add	a2,a2,1
    2440:	00e42223          	sw	a4,4(s0)
    2444:	01642023          	sw	s6,0(s0)
    2448:	0a912423          	sw	s1,168(sp)
    244c:	0ac12223          	sw	a2,164(sp)
    2450:	00700713          	li	a4,7
    2454:	00c75463          	bge	a4,a2,245c <_vfprintf_r+0x754>
    2458:	2380106f          	j	3690 <_vfprintf_r+0x1988>
    245c:	07714603          	lbu	a2,119(sp)
    2460:	00840413          	add	s0,s0,8
    2464:	b05ff06f          	j	1f68 <_vfprintf_r+0x260>
    2468:	00812583          	lw	a1,8(sp)
    246c:	0a010613          	add	a2,sp,160
    2470:	00098513          	mv	a0,s3
    2474:	04612e23          	sw	t1,92(sp)
    2478:	05c12c23          	sw	t3,88(sp)
    247c:	05d12a23          	sw	t4,84(sp)
    2480:	05f12823          	sw	t6,80(sp)
    2484:	04512223          	sw	t0,68(sp)
    2488:	73c020ef          	jal	4bc4 <__sprint_r>
    248c:	d40516e3          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2490:	0a812483          	lw	s1,168(sp)
    2494:	05c12303          	lw	t1,92(sp)
    2498:	05812e03          	lw	t3,88(sp)
    249c:	05412e83          	lw	t4,84(sp)
    24a0:	05012f83          	lw	t6,80(sp)
    24a4:	04412283          	lw	t0,68(sp)
    24a8:	0ac10413          	add	s0,sp,172
    24ac:	af1ff06f          	j	1f9c <_vfprintf_r+0x294>
    24b0:	0a412d03          	lw	s10,164(sp)
    24b4:	01812783          	lw	a5,24(sp)
    24b8:	00100693          	li	a3,1
    24bc:	01842023          	sw	s8,0(s0)
    24c0:	00148493          	add	s1,s1,1
    24c4:	001d0d13          	add	s10,s10,1
    24c8:	00840b13          	add	s6,s0,8
    24cc:	32f6d0e3          	bge	a3,a5,2fec <_vfprintf_r+0x12e4>
    24d0:	00100693          	li	a3,1
    24d4:	00d42223          	sw	a3,4(s0)
    24d8:	0a912423          	sw	s1,168(sp)
    24dc:	0ba12223          	sw	s10,164(sp)
    24e0:	00700693          	li	a3,7
    24e4:	01a6d463          	bge	a3,s10,24ec <_vfprintf_r+0x7e4>
    24e8:	0680106f          	j	3550 <_vfprintf_r+0x1848>
    24ec:	03012783          	lw	a5,48(sp)
    24f0:	03412703          	lw	a4,52(sp)
    24f4:	001d0d13          	add	s10,s10,1
    24f8:	00f484b3          	add	s1,s1,a5
    24fc:	00eb2023          	sw	a4,0(s6)
    2500:	00fb2223          	sw	a5,4(s6)
    2504:	0a912423          	sw	s1,168(sp)
    2508:	0ba12223          	sw	s10,164(sp)
    250c:	00700693          	li	a3,7
    2510:	008b0b13          	add	s6,s6,8
    2514:	01a6d463          	bge	a3,s10,251c <_vfprintf_r+0x814>
    2518:	0680106f          	j	3580 <_vfprintf_r+0x1878>
    251c:	02812603          	lw	a2,40(sp)
    2520:	02c12683          	lw	a3,44(sp)
    2524:	01812783          	lw	a5,24(sp)
    2528:	00060513          	mv	a0,a2
    252c:	00068593          	mv	a1,a3
    2530:	00000613          	li	a2,0
    2534:	00000693          	li	a3,0
    2538:	03d12023          	sw	t4,32(sp)
    253c:	fff78413          	add	s0,a5,-1
    2540:	4c50a0ef          	jal	d204 <__eqdf2>
    2544:	02012e83          	lw	t4,32(sp)
    2548:	2e0506e3          	beqz	a0,3034 <_vfprintf_r+0x132c>
    254c:	001c0793          	add	a5,s8,1
    2550:	001d0d13          	add	s10,s10,1
    2554:	008484b3          	add	s1,s1,s0
    2558:	00fb2023          	sw	a5,0(s6)
    255c:	008b2223          	sw	s0,4(s6)
    2560:	0a912423          	sw	s1,168(sp)
    2564:	0ba12223          	sw	s10,164(sp)
    2568:	00700793          	li	a5,7
    256c:	008b0b13          	add	s6,s6,8
    2570:	29a7cce3          	blt	a5,s10,3008 <_vfprintf_r+0x1300>
    2574:	04012703          	lw	a4,64(sp)
    2578:	08810793          	add	a5,sp,136
    257c:	001d0d13          	add	s10,s10,1
    2580:	009704b3          	add	s1,a4,s1
    2584:	00fb2023          	sw	a5,0(s6)
    2588:	00eb2223          	sw	a4,4(s6)
    258c:	0a912423          	sw	s1,168(sp)
    2590:	0ba12223          	sw	s10,164(sp)
    2594:	00700793          	li	a5,7
    2598:	008b0413          	add	s0,s6,8
    259c:	a7a7dae3          	bge	a5,s10,2010 <_vfprintf_r+0x308>
    25a0:	00812583          	lw	a1,8(sp)
    25a4:	0a010613          	add	a2,sp,160
    25a8:	00098513          	mv	a0,s3
    25ac:	03d12023          	sw	t4,32(sp)
    25b0:	614020ef          	jal	4bc4 <__sprint_r>
    25b4:	c20512e3          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    25b8:	0a812483          	lw	s1,168(sp)
    25bc:	02012e83          	lw	t4,32(sp)
    25c0:	0ac10413          	add	s0,sp,172
    25c4:	a4dff06f          	j	2010 <_vfprintf_r+0x308>
    25c8:	2007f713          	and	a4,a5,512
    25cc:	c2071ce3          	bnez	a4,2204 <_vfprintf_r+0x4fc>
    25d0:	00812403          	lw	s0,8(sp)
    25d4:	05842503          	lw	a0,88(s0)
    25d8:	fd8fe0ef          	jal	db0 <__retarget_lock_release_recursive>
    25dc:	00c41783          	lh	a5,12(s0)
    25e0:	c25ff06f          	j	2204 <_vfprintf_r+0x4fc>
    25e4:	00094e03          	lbu	t3,0(s2)
    25e8:	020a6a13          	or	s4,s4,32
    25ec:	8cdff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    25f0:	01412703          	lw	a4,20(sp)
    25f4:	04300793          	li	a5,67
    25f8:	000a0e93          	mv	t4,s4
    25fc:	00470493          	add	s1,a4,4
    2600:	64fe08e3          	beq	t3,a5,3450 <_vfprintf_r+0x1748>
    2604:	010a7793          	and	a5,s4,16
    2608:	640794e3          	bnez	a5,3450 <_vfprintf_r+0x1748>
    260c:	01412783          	lw	a5,20(sp)
    2610:	00100c93          	li	s9,1
    2614:	00100d13          	li	s10,1
    2618:	0007a783          	lw	a5,0(a5)
    261c:	0ec10c13          	add	s8,sp,236
    2620:	0ef10623          	sb	a5,236(sp)
    2624:	06010ba3          	sb	zero,119(sp)
    2628:	00912a23          	sw	s1,20(sp)
    262c:	00000613          	li	a2,0
    2630:	00012823          	sw	zero,16(sp)
    2634:	00000313          	li	t1,0
    2638:	02012223          	sw	zero,36(sp)
    263c:	02012023          	sw	zero,32(sp)
    2640:	00000a13          	li	s4,0
    2644:	905ff06f          	j	1f48 <_vfprintf_r+0x240>
    2648:	01412783          	lw	a5,20(sp)
    264c:	06010ba3          	sb	zero,119(sp)
    2650:	000b0313          	mv	t1,s6
    2654:	0007ac03          	lw	s8,0(a5)
    2658:	000a0e93          	mv	t4,s4
    265c:	00478b13          	add	s6,a5,4
    2660:	5a0c0ce3          	beqz	s8,3418 <_vfprintf_r+0x1710>
    2664:	05300713          	li	a4,83
    2668:	00ee1463          	bne	t3,a4,2670 <_vfprintf_r+0x968>
    266c:	1d00106f          	j	383c <_vfprintf_r+0x1b34>
    2670:	010a7a13          	and	s4,s4,16
    2674:	000a0463          	beqz	s4,267c <_vfprintf_r+0x974>
    2678:	1c40106f          	j	383c <_vfprintf_r+0x1b34>
    267c:	00035463          	bgez	t1,2684 <_vfprintf_r+0x97c>
    2680:	6d40106f          	j	3d54 <_vfprintf_r+0x204c>
    2684:	00030613          	mv	a2,t1
    2688:	00000593          	li	a1,0
    268c:	000c0513          	mv	a0,s8
    2690:	03d12023          	sw	t4,32(sp)
    2694:	00612a23          	sw	t1,20(sp)
    2698:	0ec050ef          	jal	7784 <memchr>
    269c:	00a12823          	sw	a0,16(sp)
    26a0:	01412303          	lw	t1,20(sp)
    26a4:	02012e83          	lw	t4,32(sp)
    26a8:	00051463          	bnez	a0,26b0 <_vfprintf_r+0x9a8>
    26ac:	1780206f          	j	4824 <_vfprintf_r+0x2b1c>
    26b0:	01012783          	lw	a5,16(sp)
    26b4:	07714603          	lbu	a2,119(sp)
    26b8:	01612a23          	sw	s6,20(sp)
    26bc:	41878d33          	sub	s10,a5,s8
    26c0:	fffd4813          	not	a6,s10
    26c4:	41f85813          	sra	a6,a6,0x1f
    26c8:	02012223          	sw	zero,36(sp)
    26cc:	02012023          	sw	zero,32(sp)
    26d0:	00012823          	sw	zero,16(sp)
    26d4:	010d7cb3          	and	s9,s10,a6
    26d8:	00000313          	li	t1,0
    26dc:	07300e13          	li	t3,115
    26e0:	860604e3          	beqz	a2,1f48 <_vfprintf_r+0x240>
    26e4:	c85ff06f          	j	2368 <_vfprintf_r+0x660>
    26e8:	01412783          	lw	a5,20(sp)
    26ec:	0007ab83          	lw	s7,0(a5)
    26f0:	00478793          	add	a5,a5,4
    26f4:	2a0bdae3          	bgez	s7,31a8 <_vfprintf_r+0x14a0>
    26f8:	41700bb3          	neg	s7,s7
    26fc:	00f12a23          	sw	a5,20(sp)
    2700:	00094e03          	lbu	t3,0(s2)
    2704:	004a6a13          	or	s4,s4,4
    2708:	fb0ff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    270c:	02b00793          	li	a5,43
    2710:	00094e03          	lbu	t3,0(s2)
    2714:	06f10ba3          	sb	a5,119(sp)
    2718:	fa0ff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    271c:	000b0313          	mv	t1,s6
    2720:	010a6613          	or	a2,s4,16
    2724:	02067793          	and	a5,a2,32
    2728:	1c0780e3          	beqz	a5,30e8 <_vfprintf_r+0x13e0>
    272c:	01412783          	lw	a5,20(sp)
    2730:	00778b13          	add	s6,a5,7
    2734:	ff8b7b13          	and	s6,s6,-8
    2738:	000b2d03          	lw	s10,0(s6)
    273c:	004b2c83          	lw	s9,4(s6)
    2740:	008b0793          	add	a5,s6,8
    2744:	00f12a23          	sw	a5,20(sp)
    2748:	00100793          	li	a5,1
    274c:	00000713          	li	a4,0
    2750:	06e10ba3          	sb	a4,119(sp)
    2754:	34034c63          	bltz	t1,2aac <_vfprintf_r+0xda4>
    2758:	019d6733          	or	a4,s10,s9
    275c:	f7f67e93          	and	t4,a2,-129
    2760:	34071463          	bnez	a4,2aa8 <_vfprintf_r+0xda0>
    2764:	3a031a63          	bnez	t1,2b18 <_vfprintf_r+0xe10>
    2768:	5c079ee3          	bnez	a5,3544 <_vfprintf_r+0x183c>
    276c:	00167d13          	and	s10,a2,1
    2770:	15010c13          	add	s8,sp,336
    2774:	2c0d10e3          	bnez	s10,3234 <_vfprintf_r+0x152c>
    2778:	07714603          	lbu	a2,119(sp)
    277c:	00030c93          	mv	s9,t1
    2780:	01a35463          	bge	t1,s10,2788 <_vfprintf_r+0xa80>
    2784:	000d0c93          	mv	s9,s10
    2788:	00012823          	sw	zero,16(sp)
    278c:	02012223          	sw	zero,36(sp)
    2790:	02012023          	sw	zero,32(sp)
    2794:	00000a13          	li	s4,0
    2798:	fa060863          	beqz	a2,1f48 <_vfprintf_r+0x240>
    279c:	bcdff06f          	j	2368 <_vfprintf_r+0x660>
    27a0:	00094e03          	lbu	t3,0(s2)
    27a4:	080a6a13          	or	s4,s4,128
    27a8:	f10ff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    27ac:	00094e03          	lbu	t3,0(s2)
    27b0:	02a00793          	li	a5,42
    27b4:	00190693          	add	a3,s2,1
    27b8:	00fe1463          	bne	t3,a5,27c0 <_vfprintf_r+0xab8>
    27bc:	1100206f          	j	48cc <_vfprintf_r+0x2bc4>
    27c0:	fd0e0713          	add	a4,t3,-48
    27c4:	00900793          	li	a5,9
    27c8:	00000b13          	li	s6,0
    27cc:	00900613          	li	a2,9
    27d0:	02e7e463          	bltu	a5,a4,27f8 <_vfprintf_r+0xaf0>
    27d4:	0006ce03          	lbu	t3,0(a3)
    27d8:	002b1793          	sll	a5,s6,0x2
    27dc:	016787b3          	add	a5,a5,s6
    27e0:	00179793          	sll	a5,a5,0x1
    27e4:	00e78b33          	add	s6,a5,a4
    27e8:	fd0e0713          	add	a4,t3,-48
    27ec:	00168693          	add	a3,a3,1
    27f0:	fee672e3          	bgeu	a2,a4,27d4 <_vfprintf_r+0xacc>
    27f4:	320b4ce3          	bltz	s6,332c <_vfprintf_r+0x1624>
    27f8:	00068913          	mv	s2,a3
    27fc:	ec0ff06f          	j	1ebc <_vfprintf_r+0x1b4>
    2800:	00094e03          	lbu	t3,0(s2)
    2804:	001a6a13          	or	s4,s4,1
    2808:	eb0ff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    280c:	07714783          	lbu	a5,119(sp)
    2810:	00094e03          	lbu	t3,0(s2)
    2814:	ea079263          	bnez	a5,1eb8 <_vfprintf_r+0x1b0>
    2818:	02000793          	li	a5,32
    281c:	06f10ba3          	sb	a5,119(sp)
    2820:	e98ff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    2824:	00094e03          	lbu	t3,0(s2)
    2828:	06c00793          	li	a5,108
    282c:	3afe00e3          	beq	t3,a5,33cc <_vfprintf_r+0x16c4>
    2830:	010a6a13          	or	s4,s4,16
    2834:	e84ff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    2838:	00094e03          	lbu	t3,0(s2)
    283c:	008a6a13          	or	s4,s4,8
    2840:	e78ff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    2844:	000b0313          	mv	t1,s6
    2848:	010a6e93          	or	t4,s4,16
    284c:	020ef793          	and	a5,t4,32
    2850:	0c0786e3          	beqz	a5,311c <_vfprintf_r+0x1414>
    2854:	01412783          	lw	a5,20(sp)
    2858:	00778b13          	add	s6,a5,7
    285c:	ff8b7b13          	and	s6,s6,-8
    2860:	004b2783          	lw	a5,4(s6)
    2864:	000b2d03          	lw	s10,0(s6)
    2868:	008b0713          	add	a4,s6,8
    286c:	00e12a23          	sw	a4,20(sp)
    2870:	00078c93          	mv	s9,a5
    2874:	0c07cee3          	bltz	a5,3150 <_vfprintf_r+0x1448>
    2878:	000e8613          	mv	a2,t4
    287c:	02034263          	bltz	t1,28a0 <_vfprintf_r+0xb98>
    2880:	019d67b3          	or	a5,s10,s9
    2884:	f7fef613          	and	a2,t4,-129
    2888:	00079c63          	bnez	a5,28a0 <_vfprintf_r+0xb98>
    288c:	02031063          	bnez	t1,28ac <_vfprintf_r+0xba4>
    2890:	00000d13          	li	s10,0
    2894:	00060e93          	mv	t4,a2
    2898:	15010c13          	add	s8,sp,336
    289c:	eddff06f          	j	2778 <_vfprintf_r+0xa70>
    28a0:	520c90e3          	bnez	s9,35c0 <_vfprintf_r+0x18b8>
    28a4:	00900793          	li	a5,9
    28a8:	51a7ece3          	bltu	a5,s10,35c0 <_vfprintf_r+0x18b8>
    28ac:	030d0d13          	add	s10,s10,48
    28b0:	15a107a3          	sb	s10,335(sp)
    28b4:	00060e93          	mv	t4,a2
    28b8:	00100d13          	li	s10,1
    28bc:	14f10c13          	add	s8,sp,335
    28c0:	eb9ff06f          	j	2778 <_vfprintf_r+0xa70>
    28c4:	000b0313          	mv	t1,s6
    28c8:	010a6e93          	or	t4,s4,16
    28cc:	020ef793          	and	a5,t4,32
    28d0:	7e078463          	beqz	a5,30b8 <_vfprintf_r+0x13b0>
    28d4:	01412783          	lw	a5,20(sp)
    28d8:	00778b13          	add	s6,a5,7
    28dc:	ff8b7b13          	and	s6,s6,-8
    28e0:	000b2d03          	lw	s10,0(s6)
    28e4:	004b2c83          	lw	s9,4(s6)
    28e8:	008b0793          	add	a5,s6,8
    28ec:	00f12a23          	sw	a5,20(sp)
    28f0:	bffef613          	and	a2,t4,-1025
    28f4:	00000793          	li	a5,0
    28f8:	e55ff06f          	j	274c <_vfprintf_r+0xa44>
    28fc:	00094e03          	lbu	t3,0(s2)
    2900:	06800793          	li	a5,104
    2904:	2cfe0ce3          	beq	t3,a5,33dc <_vfprintf_r+0x16d4>
    2908:	040a6a13          	or	s4,s4,64
    290c:	dacff06f          	j	1eb8 <_vfprintf_r+0x1b0>
    2910:	01412703          	lw	a4,20(sp)
    2914:	000087b7          	lui	a5,0x8
    2918:	83078793          	add	a5,a5,-2000 # 7830 <memchr+0xac>
    291c:	06f11c23          	sh	a5,120(sp)
    2920:	00470793          	add	a5,a4,4
    2924:	00f12a23          	sw	a5,20(sp)
    2928:	0000c797          	auipc	a5,0xc
    292c:	5d878793          	add	a5,a5,1496 # ef00 <__fini_array_end+0x1a8>
    2930:	02f12c23          	sw	a5,56(sp)
    2934:	00072d03          	lw	s10,0(a4)
    2938:	000b0313          	mv	t1,s6
    293c:	00000c93          	li	s9,0
    2940:	002a6613          	or	a2,s4,2
    2944:	00200793          	li	a5,2
    2948:	07800e13          	li	t3,120
    294c:	e01ff06f          	j	274c <_vfprintf_r+0xa44>
    2950:	020a7793          	and	a5,s4,32
    2954:	180784e3          	beqz	a5,32dc <_vfprintf_r+0x15d4>
    2958:	01412783          	lw	a5,20(sp)
    295c:	00c12683          	lw	a3,12(sp)
    2960:	0007a783          	lw	a5,0(a5)
    2964:	41f6d713          	sra	a4,a3,0x1f
    2968:	00d7a023          	sw	a3,0(a5)
    296c:	00e7a223          	sw	a4,4(a5)
    2970:	01412783          	lw	a5,20(sp)
    2974:	00090c13          	mv	s8,s2
    2978:	00478793          	add	a5,a5,4
    297c:	00f12a23          	sw	a5,20(sp)
    2980:	cccff06f          	j	1e4c <_vfprintf_r+0x144>
    2984:	06500713          	li	a4,101
    2988:	b3c754e3          	bge	a4,t3,24b0 <_vfprintf_r+0x7a8>
    298c:	02812683          	lw	a3,40(sp)
    2990:	02c12703          	lw	a4,44(sp)
    2994:	00000613          	li	a2,0
    2998:	00068513          	mv	a0,a3
    299c:	00070593          	mv	a1,a4
    29a0:	00000693          	li	a3,0
    29a4:	05d12223          	sw	t4,68(sp)
    29a8:	05d0a0ef          	jal	d204 <__eqdf2>
    29ac:	04412e83          	lw	t4,68(sp)
    29b0:	4e051463          	bnez	a0,2e98 <_vfprintf_r+0x1190>
    29b4:	0a412783          	lw	a5,164(sp)
    29b8:	0000c717          	auipc	a4,0xc
    29bc:	57870713          	add	a4,a4,1400 # ef30 <__fini_array_end+0x1d8>
    29c0:	00e42023          	sw	a4,0(s0)
    29c4:	00148493          	add	s1,s1,1
    29c8:	00100713          	li	a4,1
    29cc:	00178793          	add	a5,a5,1
    29d0:	00e42223          	sw	a4,4(s0)
    29d4:	0a912423          	sw	s1,168(sp)
    29d8:	0af12223          	sw	a5,164(sp)
    29dc:	00700713          	li	a4,7
    29e0:	00840413          	add	s0,s0,8
    29e4:	62f746e3          	blt	a4,a5,3810 <_vfprintf_r+0x1b08>
    29e8:	07c12783          	lw	a5,124(sp)
    29ec:	01812703          	lw	a4,24(sp)
    29f0:	78e7de63          	bge	a5,a4,318c <_vfprintf_r+0x1484>
    29f4:	03412783          	lw	a5,52(sp)
    29f8:	03012703          	lw	a4,48(sp)
    29fc:	00840413          	add	s0,s0,8
    2a00:	fef42c23          	sw	a5,-8(s0)
    2a04:	0a412783          	lw	a5,164(sp)
    2a08:	00e484b3          	add	s1,s1,a4
    2a0c:	fee42e23          	sw	a4,-4(s0)
    2a10:	00178793          	add	a5,a5,1
    2a14:	0a912423          	sw	s1,168(sp)
    2a18:	0af12223          	sw	a5,164(sp)
    2a1c:	00700713          	li	a4,7
    2a20:	1cf746e3          	blt	a4,a5,33ec <_vfprintf_r+0x16e4>
    2a24:	01812783          	lw	a5,24(sp)
    2a28:	fff78d13          	add	s10,a5,-1
    2a2c:	dfa05263          	blez	s10,2010 <_vfprintf_r+0x308>
    2a30:	01000713          	li	a4,16
    2a34:	0a412783          	lw	a5,164(sp)
    2a38:	0000d297          	auipc	t0,0xd
    2a3c:	9b028293          	add	t0,t0,-1616 # f3e8 <zeroes.0>
    2a40:	77a752e3          	bge	a4,s10,39a4 <_vfprintf_r+0x1c9c>
    2a44:	00048713          	mv	a4,s1
    2a48:	01000c13          	li	s8,16
    2a4c:	00700b13          	li	s6,7
    2a50:	000e8493          	mv	s1,t4
    2a54:	00028a13          	mv	s4,t0
    2a58:	00c0006f          	j	2a64 <_vfprintf_r+0xd5c>
    2a5c:	ff0d0d13          	add	s10,s10,-16
    2a60:	73ac5ce3          	bge	s8,s10,3998 <_vfprintf_r+0x1c90>
    2a64:	01070713          	add	a4,a4,16
    2a68:	00178793          	add	a5,a5,1
    2a6c:	01442023          	sw	s4,0(s0)
    2a70:	01842223          	sw	s8,4(s0)
    2a74:	0ae12423          	sw	a4,168(sp)
    2a78:	0af12223          	sw	a5,164(sp)
    2a7c:	00840413          	add	s0,s0,8
    2a80:	fcfb5ee3          	bge	s6,a5,2a5c <_vfprintf_r+0xd54>
    2a84:	00812583          	lw	a1,8(sp)
    2a88:	0a010613          	add	a2,sp,160
    2a8c:	00098513          	mv	a0,s3
    2a90:	134020ef          	jal	4bc4 <__sprint_r>
    2a94:	f4051263          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2a98:	0a812703          	lw	a4,168(sp)
    2a9c:	0a412783          	lw	a5,164(sp)
    2aa0:	0ac10413          	add	s0,sp,172
    2aa4:	fb9ff06f          	j	2a5c <_vfprintf_r+0xd54>
    2aa8:	000e8613          	mv	a2,t4
    2aac:	00100713          	li	a4,1
    2ab0:	dee788e3          	beq	a5,a4,28a0 <_vfprintf_r+0xb98>
    2ab4:	00200713          	li	a4,2
    2ab8:	06e78c63          	beq	a5,a4,2b30 <_vfprintf_r+0xe28>
    2abc:	15010c13          	add	s8,sp,336
    2ac0:	01dc9793          	sll	a5,s9,0x1d
    2ac4:	007d7713          	and	a4,s10,7
    2ac8:	003d5d13          	srl	s10,s10,0x3
    2acc:	03070713          	add	a4,a4,48
    2ad0:	01a7ed33          	or	s10,a5,s10
    2ad4:	003cdc93          	srl	s9,s9,0x3
    2ad8:	feec0fa3          	sb	a4,-1(s8)
    2adc:	019d67b3          	or	a5,s10,s9
    2ae0:	000c0593          	mv	a1,s8
    2ae4:	fffc0c13          	add	s8,s8,-1
    2ae8:	fc079ce3          	bnez	a5,2ac0 <_vfprintf_r+0xdb8>
    2aec:	00167693          	and	a3,a2,1
    2af0:	06068a63          	beqz	a3,2b64 <_vfprintf_r+0xe5c>
    2af4:	03000693          	li	a3,48
    2af8:	06d70663          	beq	a4,a3,2b64 <_vfprintf_r+0xe5c>
    2afc:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x2f6>
    2b00:	15010793          	add	a5,sp,336
    2b04:	fedc0fa3          	sb	a3,-1(s8)
    2b08:	40b78d33          	sub	s10,a5,a1
    2b0c:	00060e93          	mv	t4,a2
    2b10:	00058c13          	mv	s8,a1
    2b14:	c65ff06f          	j	2778 <_vfprintf_r+0xa70>
    2b18:	00100713          	li	a4,1
    2b1c:	00e79463          	bne	a5,a4,2b24 <_vfprintf_r+0xe1c>
    2b20:	2b10106f          	j	45d0 <_vfprintf_r+0x28c8>
    2b24:	00200713          	li	a4,2
    2b28:	000e8613          	mv	a2,t4
    2b2c:	f8e798e3          	bne	a5,a4,2abc <_vfprintf_r+0xdb4>
    2b30:	03812683          	lw	a3,56(sp)
    2b34:	15010c13          	add	s8,sp,336
    2b38:	00fd7793          	and	a5,s10,15
    2b3c:	00f687b3          	add	a5,a3,a5
    2b40:	0007c703          	lbu	a4,0(a5)
    2b44:	004d5d13          	srl	s10,s10,0x4
    2b48:	01cc9793          	sll	a5,s9,0x1c
    2b4c:	01a7ed33          	or	s10,a5,s10
    2b50:	004cdc93          	srl	s9,s9,0x4
    2b54:	feec0fa3          	sb	a4,-1(s8)
    2b58:	019d67b3          	or	a5,s10,s9
    2b5c:	fffc0c13          	add	s8,s8,-1
    2b60:	fc079ce3          	bnez	a5,2b38 <_vfprintf_r+0xe30>
    2b64:	15010793          	add	a5,sp,336
    2b68:	41878d33          	sub	s10,a5,s8
    2b6c:	00060e93          	mv	t4,a2
    2b70:	c09ff06f          	j	2778 <_vfprintf_r+0xa70>
    2b74:	419b8b33          	sub	s6,s7,s9
    2b78:	c7605063          	blez	s6,1fd8 <_vfprintf_r+0x2d0>
    2b7c:	01000593          	li	a1,16
    2b80:	0a412603          	lw	a2,164(sp)
    2b84:	0000d297          	auipc	t0,0xd
    2b88:	86428293          	add	t0,t0,-1948 # f3e8 <zeroes.0>
    2b8c:	0b65d463          	bge	a1,s6,2c34 <_vfprintf_r+0xf2c>
    2b90:	00040793          	mv	a5,s0
    2b94:	00048713          	mv	a4,s1
    2b98:	000b0413          	mv	s0,s6
    2b9c:	01000893          	li	a7,16
    2ba0:	000a0b13          	mv	s6,s4
    2ba4:	00700f93          	li	t6,7
    2ba8:	05d12223          	sw	t4,68(sp)
    2bac:	05c12823          	sw	t3,80(sp)
    2bb0:	00030a13          	mv	s4,t1
    2bb4:	00028493          	mv	s1,t0
    2bb8:	00c0006f          	j	2bc4 <_vfprintf_r+0xebc>
    2bbc:	ff040413          	add	s0,s0,-16
    2bc0:	0488da63          	bge	a7,s0,2c14 <_vfprintf_r+0xf0c>
    2bc4:	01070713          	add	a4,a4,16
    2bc8:	00160613          	add	a2,a2,1
    2bcc:	0097a023          	sw	s1,0(a5)
    2bd0:	0117a223          	sw	a7,4(a5)
    2bd4:	0ae12423          	sw	a4,168(sp)
    2bd8:	0ac12223          	sw	a2,164(sp)
    2bdc:	00878793          	add	a5,a5,8
    2be0:	fccfdee3          	bge	t6,a2,2bbc <_vfprintf_r+0xeb4>
    2be4:	00812583          	lw	a1,8(sp)
    2be8:	0a010613          	add	a2,sp,160
    2bec:	00098513          	mv	a0,s3
    2bf0:	7d5010ef          	jal	4bc4 <__sprint_r>
    2bf4:	de051263          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2bf8:	01000893          	li	a7,16
    2bfc:	ff040413          	add	s0,s0,-16
    2c00:	0a812703          	lw	a4,168(sp)
    2c04:	0a412603          	lw	a2,164(sp)
    2c08:	0ac10793          	add	a5,sp,172
    2c0c:	00700f93          	li	t6,7
    2c10:	fa88cae3          	blt	a7,s0,2bc4 <_vfprintf_r+0xebc>
    2c14:	04412e83          	lw	t4,68(sp)
    2c18:	05012e03          	lw	t3,80(sp)
    2c1c:	000a0313          	mv	t1,s4
    2c20:	00048293          	mv	t0,s1
    2c24:	000b0a13          	mv	s4,s6
    2c28:	00070493          	mv	s1,a4
    2c2c:	00040b13          	mv	s6,s0
    2c30:	00078413          	mv	s0,a5
    2c34:	016484b3          	add	s1,s1,s6
    2c38:	00160613          	add	a2,a2,1
    2c3c:	00542023          	sw	t0,0(s0)
    2c40:	01642223          	sw	s6,4(s0)
    2c44:	0a912423          	sw	s1,168(sp)
    2c48:	0ac12223          	sw	a2,164(sp)
    2c4c:	00700713          	li	a4,7
    2c50:	00840413          	add	s0,s0,8
    2c54:	b8c75263          	bge	a4,a2,1fd8 <_vfprintf_r+0x2d0>
    2c58:	00812583          	lw	a1,8(sp)
    2c5c:	0a010613          	add	a2,sp,160
    2c60:	00098513          	mv	a0,s3
    2c64:	04612a23          	sw	t1,84(sp)
    2c68:	05c12823          	sw	t3,80(sp)
    2c6c:	05d12223          	sw	t4,68(sp)
    2c70:	755010ef          	jal	4bc4 <__sprint_r>
    2c74:	d6051263          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2c78:	0a812483          	lw	s1,168(sp)
    2c7c:	05412303          	lw	t1,84(sp)
    2c80:	05012e03          	lw	t3,80(sp)
    2c84:	04412e83          	lw	t4,68(sp)
    2c88:	0ac10413          	add	s0,sp,172
    2c8c:	b4cff06f          	j	1fd8 <_vfprintf_r+0x2d0>
    2c90:	01000713          	li	a4,16
    2c94:	0a412603          	lw	a2,164(sp)
    2c98:	0000c297          	auipc	t0,0xc
    2c9c:	75028293          	add	t0,t0,1872 # f3e8 <zeroes.0>
    2ca0:	0b675063          	bge	a4,s6,2d40 <_vfprintf_r+0x1038>
    2ca4:	00040793          	mv	a5,s0
    2ca8:	00048693          	mv	a3,s1
    2cac:	000b0413          	mv	s0,s6
    2cb0:	01000713          	li	a4,16
    2cb4:	00700893          	li	a7,7
    2cb8:	05d12223          	sw	t4,68(sp)
    2cbc:	000e0493          	mv	s1,t3
    2cc0:	00028b13          	mv	s6,t0
    2cc4:	00c0006f          	j	2cd0 <_vfprintf_r+0xfc8>
    2cc8:	ff040413          	add	s0,s0,-16
    2ccc:	04875e63          	bge	a4,s0,2d28 <_vfprintf_r+0x1020>
    2cd0:	01068693          	add	a3,a3,16
    2cd4:	00160613          	add	a2,a2,1
    2cd8:	0000c597          	auipc	a1,0xc
    2cdc:	71058593          	add	a1,a1,1808 # f3e8 <zeroes.0>
    2ce0:	00b7a023          	sw	a1,0(a5)
    2ce4:	00e7a223          	sw	a4,4(a5)
    2ce8:	0ad12423          	sw	a3,168(sp)
    2cec:	0ac12223          	sw	a2,164(sp)
    2cf0:	00878793          	add	a5,a5,8
    2cf4:	fcc8dae3          	bge	a7,a2,2cc8 <_vfprintf_r+0xfc0>
    2cf8:	00812583          	lw	a1,8(sp)
    2cfc:	0a010613          	add	a2,sp,160
    2d00:	00098513          	mv	a0,s3
    2d04:	6c1010ef          	jal	4bc4 <__sprint_r>
    2d08:	cc051863          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2d0c:	01000713          	li	a4,16
    2d10:	ff040413          	add	s0,s0,-16
    2d14:	0a812683          	lw	a3,168(sp)
    2d18:	0a412603          	lw	a2,164(sp)
    2d1c:	0ac10793          	add	a5,sp,172
    2d20:	00700893          	li	a7,7
    2d24:	fa8746e3          	blt	a4,s0,2cd0 <_vfprintf_r+0xfc8>
    2d28:	04412e83          	lw	t4,68(sp)
    2d2c:	00048e13          	mv	t3,s1
    2d30:	000b0293          	mv	t0,s6
    2d34:	00068493          	mv	s1,a3
    2d38:	00040b13          	mv	s6,s0
    2d3c:	00078413          	mv	s0,a5
    2d40:	016484b3          	add	s1,s1,s6
    2d44:	00160613          	add	a2,a2,1
    2d48:	00542023          	sw	t0,0(s0)
    2d4c:	01642223          	sw	s6,4(s0)
    2d50:	0a912423          	sw	s1,168(sp)
    2d54:	0ac12223          	sw	a2,164(sp)
    2d58:	00700713          	li	a4,7
    2d5c:	00840413          	add	s0,s0,8
    2d60:	a8c75063          	bge	a4,a2,1fe0 <_vfprintf_r+0x2d8>
    2d64:	00812583          	lw	a1,8(sp)
    2d68:	0a010613          	add	a2,sp,160
    2d6c:	00098513          	mv	a0,s3
    2d70:	05c12823          	sw	t3,80(sp)
    2d74:	05d12223          	sw	t4,68(sp)
    2d78:	64d010ef          	jal	4bc4 <__sprint_r>
    2d7c:	c4051e63          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2d80:	0a812483          	lw	s1,168(sp)
    2d84:	05012e03          	lw	t3,80(sp)
    2d88:	04412e83          	lw	t4,68(sp)
    2d8c:	0ac10413          	add	s0,sp,172
    2d90:	a50ff06f          	j	1fe0 <_vfprintf_r+0x2d8>
    2d94:	00812583          	lw	a1,8(sp)
    2d98:	0a010613          	add	a2,sp,160
    2d9c:	00098513          	mv	a0,s3
    2da0:	04612c23          	sw	t1,88(sp)
    2da4:	05c12a23          	sw	t3,84(sp)
    2da8:	05d12823          	sw	t4,80(sp)
    2dac:	05f12223          	sw	t6,68(sp)
    2db0:	615010ef          	jal	4bc4 <__sprint_r>
    2db4:	c2051263          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2db8:	0a812483          	lw	s1,168(sp)
    2dbc:	05812303          	lw	t1,88(sp)
    2dc0:	05412e03          	lw	t3,84(sp)
    2dc4:	05012e83          	lw	t4,80(sp)
    2dc8:	04412f83          	lw	t6,68(sp)
    2dcc:	0ac10413          	add	s0,sp,172
    2dd0:	a00ff06f          	j	1fd0 <_vfprintf_r+0x2c8>
    2dd4:	01000713          	li	a4,16
    2dd8:	0a412783          	lw	a5,164(sp)
    2ddc:	0000cb17          	auipc	s6,0xc
    2de0:	61cb0b13          	add	s6,s6,1564 # f3f8 <blanks.1>
    2de4:	07a75c63          	bge	a4,s10,2e5c <_vfprintf_r+0x1154>
    2de8:	000b0713          	mv	a4,s6
    2dec:	01000c13          	li	s8,16
    2df0:	00090b13          	mv	s6,s2
    2df4:	00700a13          	li	s4,7
    2df8:	00070913          	mv	s2,a4
    2dfc:	00c0006f          	j	2e08 <_vfprintf_r+0x1100>
    2e00:	ff0d0d13          	add	s10,s10,-16
    2e04:	05ac5663          	bge	s8,s10,2e50 <_vfprintf_r+0x1148>
    2e08:	01048493          	add	s1,s1,16
    2e0c:	00178793          	add	a5,a5,1
    2e10:	01242023          	sw	s2,0(s0)
    2e14:	01842223          	sw	s8,4(s0)
    2e18:	0a912423          	sw	s1,168(sp)
    2e1c:	0af12223          	sw	a5,164(sp)
    2e20:	00840413          	add	s0,s0,8
    2e24:	fcfa5ee3          	bge	s4,a5,2e00 <_vfprintf_r+0x10f8>
    2e28:	00812583          	lw	a1,8(sp)
    2e2c:	0a010613          	add	a2,sp,160
    2e30:	00098513          	mv	a0,s3
    2e34:	591010ef          	jal	4bc4 <__sprint_r>
    2e38:	ba051063          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2e3c:	ff0d0d13          	add	s10,s10,-16
    2e40:	0a812483          	lw	s1,168(sp)
    2e44:	0a412783          	lw	a5,164(sp)
    2e48:	0ac10413          	add	s0,sp,172
    2e4c:	fbac4ee3          	blt	s8,s10,2e08 <_vfprintf_r+0x1100>
    2e50:	00090713          	mv	a4,s2
    2e54:	000b0913          	mv	s2,s6
    2e58:	00070b13          	mv	s6,a4
    2e5c:	01a484b3          	add	s1,s1,s10
    2e60:	00178793          	add	a5,a5,1
    2e64:	01642023          	sw	s6,0(s0)
    2e68:	01a42223          	sw	s10,4(s0)
    2e6c:	0a912423          	sw	s1,168(sp)
    2e70:	0af12223          	sw	a5,164(sp)
    2e74:	00700713          	li	a4,7
    2e78:	9af75463          	bge	a4,a5,2020 <_vfprintf_r+0x318>
    2e7c:	00812583          	lw	a1,8(sp)
    2e80:	0a010613          	add	a2,sp,160
    2e84:	00098513          	mv	a0,s3
    2e88:	53d010ef          	jal	4bc4 <__sprint_r>
    2e8c:	b4051663          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2e90:	0a812483          	lw	s1,168(sp)
    2e94:	98cff06f          	j	2020 <_vfprintf_r+0x318>
    2e98:	07c12683          	lw	a3,124(sp)
    2e9c:	30d05c63          	blez	a3,31b4 <_vfprintf_r+0x14ac>
    2ea0:	01812783          	lw	a5,24(sp)
    2ea4:	000a0b13          	mv	s6,s4
    2ea8:	0147d463          	bge	a5,s4,2eb0 <_vfprintf_r+0x11a8>
    2eac:	00078b13          	mv	s6,a5
    2eb0:	03605863          	blez	s6,2ee0 <_vfprintf_r+0x11d8>
    2eb4:	0a412683          	lw	a3,164(sp)
    2eb8:	016484b3          	add	s1,s1,s6
    2ebc:	01842023          	sw	s8,0(s0)
    2ec0:	00168693          	add	a3,a3,1
    2ec4:	01642223          	sw	s6,4(s0)
    2ec8:	0a912423          	sw	s1,168(sp)
    2ecc:	0ad12223          	sw	a3,164(sp)
    2ed0:	00700613          	li	a2,7
    2ed4:	00840413          	add	s0,s0,8
    2ed8:	00d65463          	bge	a2,a3,2ee0 <_vfprintf_r+0x11d8>
    2edc:	5c40106f          	j	44a0 <_vfprintf_r+0x2798>
    2ee0:	fffb4693          	not	a3,s6
    2ee4:	41f6d693          	sra	a3,a3,0x1f
    2ee8:	00db7733          	and	a4,s6,a3
    2eec:	40ea0b33          	sub	s6,s4,a4
    2ef0:	35604ae3          	bgtz	s6,3a44 <_vfprintf_r+0x1d3c>
    2ef4:	400ef713          	and	a4,t4,1024
    2ef8:	014c0333          	add	t1,s8,s4
    2efc:	00070463          	beqz	a4,2f04 <_vfprintf_r+0x11fc>
    2f00:	2980106f          	j	4198 <_vfprintf_r+0x2490>
    2f04:	07c12d03          	lw	s10,124(sp)
    2f08:	01812783          	lw	a5,24(sp)
    2f0c:	5afd4063          	blt	s10,a5,34ac <_vfprintf_r+0x17a4>
    2f10:	001ef713          	and	a4,t4,1
    2f14:	58071c63          	bnez	a4,34ac <_vfprintf_r+0x17a4>
    2f18:	01812703          	lw	a4,24(sp)
    2f1c:	00ec07b3          	add	a5,s8,a4
    2f20:	41a70d33          	sub	s10,a4,s10
    2f24:	40678b33          	sub	s6,a5,t1
    2f28:	016d5463          	bge	s10,s6,2f30 <_vfprintf_r+0x1228>
    2f2c:	000d0b13          	mv	s6,s10
    2f30:	03605863          	blez	s6,2f60 <_vfprintf_r+0x1258>
    2f34:	0a412703          	lw	a4,164(sp)
    2f38:	016484b3          	add	s1,s1,s6
    2f3c:	00642023          	sw	t1,0(s0)
    2f40:	00170713          	add	a4,a4,1
    2f44:	01642223          	sw	s6,4(s0)
    2f48:	0a912423          	sw	s1,168(sp)
    2f4c:	0ae12223          	sw	a4,164(sp)
    2f50:	00700693          	li	a3,7
    2f54:	00840413          	add	s0,s0,8
    2f58:	00e6d463          	bge	a3,a4,2f60 <_vfprintf_r+0x1258>
    2f5c:	5880106f          	j	44e4 <_vfprintf_r+0x27dc>
    2f60:	fffb4713          	not	a4,s6
    2f64:	41f75713          	sra	a4,a4,0x1f
    2f68:	00eb77b3          	and	a5,s6,a4
    2f6c:	40fd0d33          	sub	s10,s10,a5
    2f70:	8ba05063          	blez	s10,2010 <_vfprintf_r+0x308>
    2f74:	01000713          	li	a4,16
    2f78:	0a412783          	lw	a5,164(sp)
    2f7c:	0000c297          	auipc	t0,0xc
    2f80:	46c28293          	add	t0,t0,1132 # f3e8 <zeroes.0>
    2f84:	23a750e3          	bge	a4,s10,39a4 <_vfprintf_r+0x1c9c>
    2f88:	00048713          	mv	a4,s1
    2f8c:	01000c13          	li	s8,16
    2f90:	00700b13          	li	s6,7
    2f94:	000e8493          	mv	s1,t4
    2f98:	00028a13          	mv	s4,t0
    2f9c:	00c0006f          	j	2fa8 <_vfprintf_r+0x12a0>
    2fa0:	ff0d0d13          	add	s10,s10,-16
    2fa4:	1fac5ae3          	bge	s8,s10,3998 <_vfprintf_r+0x1c90>
    2fa8:	01070713          	add	a4,a4,16
    2fac:	00178793          	add	a5,a5,1
    2fb0:	01442023          	sw	s4,0(s0)
    2fb4:	01842223          	sw	s8,4(s0)
    2fb8:	0ae12423          	sw	a4,168(sp)
    2fbc:	0af12223          	sw	a5,164(sp)
    2fc0:	00840413          	add	s0,s0,8
    2fc4:	fcfb5ee3          	bge	s6,a5,2fa0 <_vfprintf_r+0x1298>
    2fc8:	00812583          	lw	a1,8(sp)
    2fcc:	0a010613          	add	a2,sp,160
    2fd0:	00098513          	mv	a0,s3
    2fd4:	3f1010ef          	jal	4bc4 <__sprint_r>
    2fd8:	a0051063          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    2fdc:	0a812703          	lw	a4,168(sp)
    2fe0:	0a412783          	lw	a5,164(sp)
    2fe4:	0ac10413          	add	s0,sp,172
    2fe8:	fb9ff06f          	j	2fa0 <_vfprintf_r+0x1298>
    2fec:	001ef613          	and	a2,t4,1
    2ff0:	ce061063          	bnez	a2,24d0 <_vfprintf_r+0x7c8>
    2ff4:	00d42223          	sw	a3,4(s0)
    2ff8:	0a912423          	sw	s1,168(sp)
    2ffc:	0ba12223          	sw	s10,164(sp)
    3000:	00700793          	li	a5,7
    3004:	d7a7d863          	bge	a5,s10,2574 <_vfprintf_r+0x86c>
    3008:	00812583          	lw	a1,8(sp)
    300c:	0a010613          	add	a2,sp,160
    3010:	00098513          	mv	a0,s3
    3014:	03d12023          	sw	t4,32(sp)
    3018:	3ad010ef          	jal	4bc4 <__sprint_r>
    301c:	9a051e63          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    3020:	0a812483          	lw	s1,168(sp)
    3024:	0a412d03          	lw	s10,164(sp)
    3028:	02012e83          	lw	t4,32(sp)
    302c:	0ac10b13          	add	s6,sp,172
    3030:	d44ff06f          	j	2574 <_vfprintf_r+0x86c>
    3034:	01812703          	lw	a4,24(sp)
    3038:	00100793          	li	a5,1
    303c:	d2e7dc63          	bge	a5,a4,2574 <_vfprintf_r+0x86c>
    3040:	01100793          	li	a5,17
    3044:	0000c297          	auipc	t0,0xc
    3048:	3a428293          	add	t0,t0,932 # f3e8 <zeroes.0>
    304c:	18e7d4e3          	bge	a5,a4,39d4 <_vfprintf_r+0x1ccc>
    3050:	00040a13          	mv	s4,s0
    3054:	01000793          	li	a5,16
    3058:	00700c13          	li	s8,7
    305c:	03d12023          	sw	t4,32(sp)
    3060:	00028413          	mv	s0,t0
    3064:	00c0006f          	j	3070 <_vfprintf_r+0x1368>
    3068:	ff0a0a13          	add	s4,s4,-16
    306c:	1547dee3          	bge	a5,s4,39c8 <_vfprintf_r+0x1cc0>
    3070:	01048493          	add	s1,s1,16
    3074:	001d0d13          	add	s10,s10,1
    3078:	008b2023          	sw	s0,0(s6)
    307c:	00fb2223          	sw	a5,4(s6)
    3080:	0a912423          	sw	s1,168(sp)
    3084:	0ba12223          	sw	s10,164(sp)
    3088:	008b0b13          	add	s6,s6,8
    308c:	fdac5ee3          	bge	s8,s10,3068 <_vfprintf_r+0x1360>
    3090:	00812583          	lw	a1,8(sp)
    3094:	0a010613          	add	a2,sp,160
    3098:	00098513          	mv	a0,s3
    309c:	329010ef          	jal	4bc4 <__sprint_r>
    30a0:	92051c63          	bnez	a0,21d8 <_vfprintf_r+0x4d0>
    30a4:	0a812483          	lw	s1,168(sp)
    30a8:	0a412d03          	lw	s10,164(sp)
    30ac:	0ac10b13          	add	s6,sp,172
    30b0:	01000793          	li	a5,16
    30b4:	fb5ff06f          	j	3068 <_vfprintf_r+0x1360>
    30b8:	01412703          	lw	a4,20(sp)
    30bc:	010ef793          	and	a5,t4,16
    30c0:	00072d03          	lw	s10,0(a4)
    30c4:	00470713          	add	a4,a4,4
    30c8:	00e12a23          	sw	a4,20(sp)
    30cc:	1a079663          	bnez	a5,3278 <_vfprintf_r+0x1570>
    30d0:	040ef793          	and	a5,t4,64
    30d4:	18078e63          	beqz	a5,3270 <_vfprintf_r+0x1568>
    30d8:	010d1d13          	sll	s10,s10,0x10
    30dc:	010d5d13          	srl	s10,s10,0x10
    30e0:	00000c93          	li	s9,0
    30e4:	80dff06f          	j	28f0 <_vfprintf_r+0xbe8>
    30e8:	01412703          	lw	a4,20(sp)
    30ec:	01067793          	and	a5,a2,16
    30f0:	00072d03          	lw	s10,0(a4)
    30f4:	00470713          	add	a4,a4,4
    30f8:	00e12a23          	sw	a4,20(sp)
    30fc:	14079a63          	bnez	a5,3250 <_vfprintf_r+0x1548>
    3100:	04067793          	and	a5,a2,64
    3104:	14078063          	beqz	a5,3244 <_vfprintf_r+0x153c>
    3108:	010d1d13          	sll	s10,s10,0x10
    310c:	010d5d13          	srl	s10,s10,0x10
    3110:	00000c93          	li	s9,0
    3114:	00100793          	li	a5,1
    3118:	e34ff06f          	j	274c <_vfprintf_r+0xa44>
    311c:	01412703          	lw	a4,20(sp)
    3120:	010ef793          	and	a5,t4,16
    3124:	00072d03          	lw	s10,0(a4)
    3128:	00470713          	add	a4,a4,4
    312c:	00e12a23          	sw	a4,20(sp)
    3130:	12079a63          	bnez	a5,3264 <_vfprintf_r+0x155c>
    3134:	040ef793          	and	a5,t4,64
    3138:	12078263          	beqz	a5,325c <_vfprintf_r+0x1554>
    313c:	010d1d13          	sll	s10,s10,0x10
    3140:	410d5d13          	sra	s10,s10,0x10
    3144:	41fd5c93          	sra	s9,s10,0x1f
    3148:	000c8793          	mv	a5,s9
    314c:	f207d663          	bgez	a5,2878 <_vfprintf_r+0xb70>
    3150:	01a037b3          	snez	a5,s10
    3154:	419000b3          	neg	ra,s9
    3158:	40f08cb3          	sub	s9,ra,a5
    315c:	41a00d33          	neg	s10,s10
    3160:	000e8613          	mv	a2,t4
    3164:	02d00713          	li	a4,45
    3168:	00100793          	li	a5,1
    316c:	de4ff06f          	j	2750 <_vfprintf_r+0xa48>
    3170:	00812403          	lw	s0,8(sp)
    3174:	00f12623          	sw	a5,12(sp)
    3178:	05842503          	lw	a0,88(s0)
    317c:	c31fd0ef          	jal	dac <__retarget_lock_acquire_recursive>
    3180:	00c41703          	lh	a4,12(s0)
    3184:	00c12783          	lw	a5,12(sp)
    3188:	c01fe06f          	j	1d88 <_vfprintf_r+0x80>
    318c:	001ef793          	and	a5,t4,1
    3190:	00079463          	bnez	a5,3198 <_vfprintf_r+0x1490>
    3194:	e7dfe06f          	j	2010 <_vfprintf_r+0x308>
    3198:	85dff06f          	j	29f4 <_vfprintf_r+0xcec>
    319c:	000a0e93          	mv	t4,s4
    31a0:	000b0313          	mv	t1,s6
    31a4:	ea8ff06f          	j	284c <_vfprintf_r+0xb44>
    31a8:	00094e03          	lbu	t3,0(s2)
    31ac:	00f12a23          	sw	a5,20(sp)
    31b0:	d09fe06f          	j	1eb8 <_vfprintf_r+0x1b0>
    31b4:	0a412703          	lw	a4,164(sp)
    31b8:	0000c617          	auipc	a2,0xc
    31bc:	d7860613          	add	a2,a2,-648 # ef30 <__fini_array_end+0x1d8>
    31c0:	00c42023          	sw	a2,0(s0)
    31c4:	00148493          	add	s1,s1,1
    31c8:	00100613          	li	a2,1
    31cc:	00170713          	add	a4,a4,1
    31d0:	00c42223          	sw	a2,4(s0)
    31d4:	0a912423          	sw	s1,168(sp)
    31d8:	0ae12223          	sw	a4,164(sp)
    31dc:	00700613          	li	a2,7
    31e0:	00840413          	add	s0,s0,8
    31e4:	2ee64ce3          	blt	a2,a4,3cdc <_vfprintf_r+0x1fd4>
    31e8:	7e069e63          	bnez	a3,39e4 <_vfprintf_r+0x1cdc>
    31ec:	01812783          	lw	a5,24(sp)
    31f0:	001ef713          	and	a4,t4,1
    31f4:	00f76733          	or	a4,a4,a5
    31f8:	00071463          	bnez	a4,3200 <_vfprintf_r+0x14f8>
    31fc:	e15fe06f          	j	2010 <_vfprintf_r+0x308>
    3200:	03412703          	lw	a4,52(sp)
    3204:	03012783          	lw	a5,48(sp)
    3208:	00700693          	li	a3,7
    320c:	00e42023          	sw	a4,0(s0)
    3210:	0a412703          	lw	a4,164(sp)
    3214:	009784b3          	add	s1,a5,s1
    3218:	00f42223          	sw	a5,4(s0)
    321c:	00170713          	add	a4,a4,1
    3220:	0a912423          	sw	s1,168(sp)
    3224:	0ae12223          	sw	a4,164(sp)
    3228:	38e6c8e3          	blt	a3,a4,3db8 <_vfprintf_r+0x20b0>
    322c:	00840413          	add	s0,s0,8
    3230:	7e80006f          	j	3a18 <_vfprintf_r+0x1d10>
    3234:	03000793          	li	a5,48
    3238:	14f107a3          	sb	a5,335(sp)
    323c:	14f10c13          	add	s8,sp,335
    3240:	d38ff06f          	j	2778 <_vfprintf_r+0xa70>
    3244:	20067793          	and	a5,a2,512
    3248:	00078463          	beqz	a5,3250 <_vfprintf_r+0x1548>
    324c:	0ffd7d13          	zext.b	s10,s10
    3250:	00000c93          	li	s9,0
    3254:	00100793          	li	a5,1
    3258:	cf4ff06f          	j	274c <_vfprintf_r+0xa44>
    325c:	200ef793          	and	a5,t4,512
    3260:	2c0796e3          	bnez	a5,3d2c <_vfprintf_r+0x2024>
    3264:	41fd5c93          	sra	s9,s10,0x1f
    3268:	000c8793          	mv	a5,s9
    326c:	e08ff06f          	j	2874 <_vfprintf_r+0xb6c>
    3270:	200ef793          	and	a5,t4,512
    3274:	2a0790e3          	bnez	a5,3d14 <_vfprintf_r+0x200c>
    3278:	00000c93          	li	s9,0
    327c:	e74ff06f          	j	28f0 <_vfprintf_r+0xbe8>
    3280:	01412783          	lw	a5,20(sp)
    3284:	06010513          	add	a0,sp,96
    3288:	03612223          	sw	s6,36(sp)
    328c:	0007a703          	lw	a4,0(a5)
    3290:	03c12023          	sw	t3,32(sp)
    3294:	00478b13          	add	s6,a5,4
    3298:	00072683          	lw	a3,0(a4)
    329c:	01412823          	sw	s4,16(sp)
    32a0:	06d12023          	sw	a3,96(sp)
    32a4:	00472683          	lw	a3,4(a4)
    32a8:	06d12223          	sw	a3,100(sp)
    32ac:	00872683          	lw	a3,8(a4)
    32b0:	06d12423          	sw	a3,104(sp)
    32b4:	00c72703          	lw	a4,12(a4)
    32b8:	06e12623          	sw	a4,108(sp)
    32bc:	4c80b0ef          	jal	e784 <__trunctfdf2>
    32c0:	02012e03          	lw	t3,32(sp)
    32c4:	02412303          	lw	t1,36(sp)
    32c8:	02a12423          	sw	a0,40(sp)
    32cc:	02b12623          	sw	a1,44(sp)
    32d0:	01612a23          	sw	s6,20(sp)
    32d4:	000a0e93          	mv	t4,s4
    32d8:	fb1fe06f          	j	2288 <_vfprintf_r+0x580>
    32dc:	010a7793          	and	a5,s4,16
    32e0:	6c079a63          	bnez	a5,39b4 <_vfprintf_r+0x1cac>
    32e4:	040a7793          	and	a5,s4,64
    32e8:	24079ce3          	bnez	a5,3d40 <_vfprintf_r+0x2038>
    32ec:	200a7f13          	and	t5,s4,512
    32f0:	6c0f0263          	beqz	t5,39b4 <_vfprintf_r+0x1cac>
    32f4:	01412783          	lw	a5,20(sp)
    32f8:	00c12703          	lw	a4,12(sp)
    32fc:	0007a783          	lw	a5,0(a5)
    3300:	00e78023          	sb	a4,0(a5)
    3304:	e6cff06f          	j	2970 <_vfprintf_r+0xc68>
    3308:	03c12783          	lw	a5,60(sp)
    330c:	00094e03          	lbu	t3,0(s2)
    3310:	00079463          	bnez	a5,3318 <_vfprintf_r+0x1610>
    3314:	ba5fe06f          	j	1eb8 <_vfprintf_r+0x1b0>
    3318:	0007c783          	lbu	a5,0(a5)
    331c:	00079463          	bnez	a5,3324 <_vfprintf_r+0x161c>
    3320:	b99fe06f          	j	1eb8 <_vfprintf_r+0x1b0>
    3324:	400a6a13          	or	s4,s4,1024
    3328:	b91fe06f          	j	1eb8 <_vfprintf_r+0x1b0>
    332c:	fff00b13          	li	s6,-1
    3330:	00068913          	mv	s2,a3
    3334:	b89fe06f          	j	1ebc <_vfprintf_r+0x1b4>
    3338:	0000c797          	auipc	a5,0xc
    333c:	bdc78793          	add	a5,a5,-1060 # ef14 <__fini_array_end+0x1bc>
    3340:	000a0e93          	mv	t4,s4
    3344:	000b0313          	mv	t1,s6
    3348:	02f12c23          	sw	a5,56(sp)
    334c:	020ef793          	and	a5,t4,32
    3350:	1c078263          	beqz	a5,3514 <_vfprintf_r+0x180c>
    3354:	01412783          	lw	a5,20(sp)
    3358:	00778b13          	add	s6,a5,7
    335c:	ff8b7b13          	and	s6,s6,-8
    3360:	000b2d03          	lw	s10,0(s6)
    3364:	004b2c83          	lw	s9,4(s6)
    3368:	008b0793          	add	a5,s6,8
    336c:	00f12a23          	sw	a5,20(sp)
    3370:	001ef793          	and	a5,t4,1
    3374:	00078e63          	beqz	a5,3390 <_vfprintf_r+0x1688>
    3378:	019d67b3          	or	a5,s10,s9
    337c:	00078a63          	beqz	a5,3390 <_vfprintf_r+0x1688>
    3380:	03000793          	li	a5,48
    3384:	06f10c23          	sb	a5,120(sp)
    3388:	07c10ca3          	sb	t3,121(sp)
    338c:	002eee93          	or	t4,t4,2
    3390:	bffef613          	and	a2,t4,-1025
    3394:	00200793          	li	a5,2
    3398:	bb4ff06f          	j	274c <_vfprintf_r+0xa44>
    339c:	000b0313          	mv	t1,s6
    33a0:	000a0613          	mv	a2,s4
    33a4:	b80ff06f          	j	2724 <_vfprintf_r+0xa1c>
    33a8:	000a0e93          	mv	t4,s4
    33ac:	000b0313          	mv	t1,s6
    33b0:	d1cff06f          	j	28cc <_vfprintf_r+0xbc4>
    33b4:	0000c797          	auipc	a5,0xc
    33b8:	b4c78793          	add	a5,a5,-1204 # ef00 <__fini_array_end+0x1a8>
    33bc:	000a0e93          	mv	t4,s4
    33c0:	000b0313          	mv	t1,s6
    33c4:	02f12c23          	sw	a5,56(sp)
    33c8:	f85ff06f          	j	334c <_vfprintf_r+0x1644>
    33cc:	00194e03          	lbu	t3,1(s2)
    33d0:	020a6a13          	or	s4,s4,32
    33d4:	00190913          	add	s2,s2,1
    33d8:	ae1fe06f          	j	1eb8 <_vfprintf_r+0x1b0>
    33dc:	00194e03          	lbu	t3,1(s2)
    33e0:	200a6a13          	or	s4,s4,512
    33e4:	00190913          	add	s2,s2,1
    33e8:	ad1fe06f          	j	1eb8 <_vfprintf_r+0x1b0>
    33ec:	00812583          	lw	a1,8(sp)
    33f0:	0a010613          	add	a2,sp,160
    33f4:	00098513          	mv	a0,s3
    33f8:	03d12023          	sw	t4,32(sp)
    33fc:	7c8010ef          	jal	4bc4 <__sprint_r>
    3400:	00050463          	beqz	a0,3408 <_vfprintf_r+0x1700>
    3404:	dd5fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    3408:	0a812483          	lw	s1,168(sp)
    340c:	02012e83          	lw	t4,32(sp)
    3410:	0ac10413          	add	s0,sp,172
    3414:	e10ff06f          	j	2a24 <_vfprintf_r+0xd1c>
    3418:	00600793          	li	a5,6
    341c:	00030c93          	mv	s9,t1
    3420:	0e67e6e3          	bltu	a5,t1,3d0c <_vfprintf_r+0x2004>
    3424:	01612a23          	sw	s6,20(sp)
    3428:	00012823          	sw	zero,16(sp)
    342c:	000c8d13          	mv	s10,s9
    3430:	00000613          	li	a2,0
    3434:	00000313          	li	t1,0
    3438:	02012223          	sw	zero,36(sp)
    343c:	02012023          	sw	zero,32(sp)
    3440:	00000a13          	li	s4,0
    3444:	0000cc17          	auipc	s8,0xc
    3448:	ae4c0c13          	add	s8,s8,-1308 # ef28 <__fini_array_end+0x1d0>
    344c:	afdfe06f          	j	1f48 <_vfprintf_r+0x240>
    3450:	00800613          	li	a2,8
    3454:	00000593          	li	a1,0
    3458:	09810513          	add	a0,sp,152
    345c:	03c12023          	sw	t3,32(sp)
    3460:	01d12823          	sw	t4,16(sp)
    3464:	951fd0ef          	jal	db4 <memset>
    3468:	01412783          	lw	a5,20(sp)
    346c:	0ec10c13          	add	s8,sp,236
    3470:	09810693          	add	a3,sp,152
    3474:	0007a603          	lw	a2,0(a5)
    3478:	000c0593          	mv	a1,s8
    347c:	00098513          	mv	a0,s3
    3480:	530070ef          	jal	a9b0 <_wcrtomb_r>
    3484:	fff00793          	li	a5,-1
    3488:	01012e83          	lw	t4,16(sp)
    348c:	02012e03          	lw	t3,32(sp)
    3490:	00050d13          	mv	s10,a0
    3494:	00f51463          	bne	a0,a5,349c <_vfprintf_r+0x1794>
    3498:	4980106f          	j	4930 <_vfprintf_r+0x2c28>
    349c:	fff54813          	not	a6,a0
    34a0:	41f85813          	sra	a6,a6,0x1f
    34a4:	01057cb3          	and	s9,a0,a6
    34a8:	97cff06f          	j	2624 <_vfprintf_r+0x91c>
    34ac:	03412703          	lw	a4,52(sp)
    34b0:	03012783          	lw	a5,48(sp)
    34b4:	00700693          	li	a3,7
    34b8:	00e42023          	sw	a4,0(s0)
    34bc:	0a412703          	lw	a4,164(sp)
    34c0:	00f484b3          	add	s1,s1,a5
    34c4:	00f42223          	sw	a5,4(s0)
    34c8:	00170713          	add	a4,a4,1
    34cc:	0a912423          	sw	s1,168(sp)
    34d0:	0ae12223          	sw	a4,164(sp)
    34d4:	00840413          	add	s0,s0,8
    34d8:	a4e6d0e3          	bge	a3,a4,2f18 <_vfprintf_r+0x1210>
    34dc:	00812583          	lw	a1,8(sp)
    34e0:	0a010613          	add	a2,sp,160
    34e4:	00098513          	mv	a0,s3
    34e8:	02612223          	sw	t1,36(sp)
    34ec:	03d12023          	sw	t4,32(sp)
    34f0:	6d4010ef          	jal	4bc4 <__sprint_r>
    34f4:	00050463          	beqz	a0,34fc <_vfprintf_r+0x17f4>
    34f8:	ce1fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    34fc:	07c12d03          	lw	s10,124(sp)
    3500:	0a812483          	lw	s1,168(sp)
    3504:	02412303          	lw	t1,36(sp)
    3508:	02012e83          	lw	t4,32(sp)
    350c:	0ac10413          	add	s0,sp,172
    3510:	a09ff06f          	j	2f18 <_vfprintf_r+0x1210>
    3514:	01412703          	lw	a4,20(sp)
    3518:	010ef793          	and	a5,t4,16
    351c:	00072d03          	lw	s10,0(a4)
    3520:	00470713          	add	a4,a4,4
    3524:	00e12a23          	sw	a4,20(sp)
    3528:	08079863          	bnez	a5,35b8 <_vfprintf_r+0x18b0>
    352c:	040ef793          	and	a5,t4,64
    3530:	08078063          	beqz	a5,35b0 <_vfprintf_r+0x18a8>
    3534:	010d1d13          	sll	s10,s10,0x10
    3538:	010d5d13          	srl	s10,s10,0x10
    353c:	00000c93          	li	s9,0
    3540:	e31ff06f          	j	3370 <_vfprintf_r+0x1668>
    3544:	00000d13          	li	s10,0
    3548:	15010c13          	add	s8,sp,336
    354c:	a2cff06f          	j	2778 <_vfprintf_r+0xa70>
    3550:	00812583          	lw	a1,8(sp)
    3554:	0a010613          	add	a2,sp,160
    3558:	00098513          	mv	a0,s3
    355c:	03d12023          	sw	t4,32(sp)
    3560:	664010ef          	jal	4bc4 <__sprint_r>
    3564:	00050463          	beqz	a0,356c <_vfprintf_r+0x1864>
    3568:	c71fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    356c:	0a812483          	lw	s1,168(sp)
    3570:	0a412d03          	lw	s10,164(sp)
    3574:	02012e83          	lw	t4,32(sp)
    3578:	0ac10b13          	add	s6,sp,172
    357c:	f71fe06f          	j	24ec <_vfprintf_r+0x7e4>
    3580:	00812583          	lw	a1,8(sp)
    3584:	0a010613          	add	a2,sp,160
    3588:	00098513          	mv	a0,s3
    358c:	03d12023          	sw	t4,32(sp)
    3590:	634010ef          	jal	4bc4 <__sprint_r>
    3594:	00050463          	beqz	a0,359c <_vfprintf_r+0x1894>
    3598:	c41fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    359c:	0a812483          	lw	s1,168(sp)
    35a0:	0a412d03          	lw	s10,164(sp)
    35a4:	02012e83          	lw	t4,32(sp)
    35a8:	0ac10b13          	add	s6,sp,172
    35ac:	f71fe06f          	j	251c <_vfprintf_r+0x814>
    35b0:	200ef793          	and	a5,t4,512
    35b4:	76079663          	bnez	a5,3d20 <_vfprintf_r+0x2018>
    35b8:	00000c93          	li	s9,0
    35bc:	db5ff06f          	j	3370 <_vfprintf_r+0x1668>
    35c0:	00000793          	li	a5,0
    35c4:	15010b13          	add	s6,sp,336
    35c8:	01212823          	sw	s2,16(sp)
    35cc:	00078913          	mv	s2,a5
    35d0:	00098793          	mv	a5,s3
    35d4:	04812823          	sw	s0,80(sp)
    35d8:	000b0993          	mv	s3,s6
    35dc:	03c12403          	lw	s0,60(sp)
    35e0:	40067493          	and	s1,a2,1024
    35e4:	0ff00a13          	li	s4,255
    35e8:	03c12023          	sw	t3,32(sp)
    35ec:	02c12223          	sw	a2,36(sp)
    35f0:	04612223          	sw	t1,68(sp)
    35f4:	00078b13          	mv	s6,a5
    35f8:	0280006f          	j	3620 <_vfprintf_r+0x1918>
    35fc:	00a00613          	li	a2,10
    3600:	00000693          	li	a3,0
    3604:	000d0513          	mv	a0,s10
    3608:	000c8593          	mv	a1,s9
    360c:	581070ef          	jal	b38c <__udivdi3>
    3610:	6a0c8ee3          	beqz	s9,44cc <_vfprintf_r+0x27c4>
    3614:	00050d13          	mv	s10,a0
    3618:	00058c93          	mv	s9,a1
    361c:	000c0993          	mv	s3,s8
    3620:	00a00613          	li	a2,10
    3624:	00000693          	li	a3,0
    3628:	000d0513          	mv	a0,s10
    362c:	000c8593          	mv	a1,s9
    3630:	408080ef          	jal	ba38 <__umoddi3>
    3634:	03050513          	add	a0,a0,48
    3638:	fea98fa3          	sb	a0,-1(s3)
    363c:	fff98c13          	add	s8,s3,-1
    3640:	00190913          	add	s2,s2,1
    3644:	fa048ce3          	beqz	s1,35fc <_vfprintf_r+0x18f4>
    3648:	00044783          	lbu	a5,0(s0)
    364c:	faf918e3          	bne	s2,a5,35fc <_vfprintf_r+0x18f4>
    3650:	fb4906e3          	beq	s2,s4,35fc <_vfprintf_r+0x18f4>
    3654:	560c9ae3          	bnez	s9,43c8 <_vfprintf_r+0x26c0>
    3658:	00900793          	li	a5,9
    365c:	57a7e6e3          	bltu	a5,s10,43c8 <_vfprintf_r+0x26c0>
    3660:	02412603          	lw	a2,36(sp)
    3664:	15010793          	add	a5,sp,336
    3668:	02812e23          	sw	s0,60(sp)
    366c:	01212c23          	sw	s2,24(sp)
    3670:	02012e03          	lw	t3,32(sp)
    3674:	01012903          	lw	s2,16(sp)
    3678:	04412303          	lw	t1,68(sp)
    367c:	05012403          	lw	s0,80(sp)
    3680:	000b0993          	mv	s3,s6
    3684:	41878d33          	sub	s10,a5,s8
    3688:	00060e93          	mv	t4,a2
    368c:	8ecff06f          	j	2778 <_vfprintf_r+0xa70>
    3690:	00812583          	lw	a1,8(sp)
    3694:	0a010613          	add	a2,sp,160
    3698:	00098513          	mv	a0,s3
    369c:	04612e23          	sw	t1,92(sp)
    36a0:	05c12c23          	sw	t3,88(sp)
    36a4:	05d12a23          	sw	t4,84(sp)
    36a8:	05f12823          	sw	t6,80(sp)
    36ac:	04512223          	sw	t0,68(sp)
    36b0:	514010ef          	jal	4bc4 <__sprint_r>
    36b4:	00050463          	beqz	a0,36bc <_vfprintf_r+0x19b4>
    36b8:	b21fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    36bc:	07714603          	lbu	a2,119(sp)
    36c0:	0a812483          	lw	s1,168(sp)
    36c4:	05c12303          	lw	t1,92(sp)
    36c8:	05812e03          	lw	t3,88(sp)
    36cc:	05412e83          	lw	t4,84(sp)
    36d0:	05012f83          	lw	t6,80(sp)
    36d4:	04412283          	lw	t0,68(sp)
    36d8:	0ac10413          	add	s0,sp,172
    36dc:	88dfe06f          	j	1f68 <_vfprintf_r+0x260>
    36e0:	02812883          	lw	a7,40(sp)
    36e4:	02c12703          	lw	a4,44(sp)
    36e8:	02612223          	sw	t1,36(sp)
    36ec:	00088613          	mv	a2,a7
    36f0:	00088513          	mv	a0,a7
    36f4:	00070693          	mv	a3,a4
    36f8:	00070593          	mv	a1,a4
    36fc:	03c12023          	sw	t3,32(sp)
    3700:	01d12823          	sw	t4,16(sp)
    3704:	62d0a0ef          	jal	e530 <__unorddf2>
    3708:	01012e83          	lw	t4,16(sp)
    370c:	02012e03          	lw	t3,32(sp)
    3710:	02412303          	lw	t1,36(sp)
    3714:	00050463          	beqz	a0,371c <_vfprintf_r+0x1a14>
    3718:	0e00106f          	j	47f8 <_vfprintf_r+0x2af0>
    371c:	06100713          	li	a4,97
    3720:	08ee0263          	beq	t3,a4,37a4 <_vfprintf_r+0x1a9c>
    3724:	04100713          	li	a4,65
    3728:	05800793          	li	a5,88
    372c:	06ee0e63          	beq	t3,a4,37a8 <_vfprintf_r+0x1aa0>
    3730:	fff00713          	li	a4,-1
    3734:	00e31463          	bne	t1,a4,373c <_vfprintf_r+0x1a34>
    3738:	01c0106f          	j	4754 <_vfprintf_r+0x2a4c>
    373c:	fdfe7713          	and	a4,t3,-33
    3740:	04700693          	li	a3,71
    3744:	00012823          	sw	zero,16(sp)
    3748:	00d71663          	bne	a4,a3,3754 <_vfprintf_r+0x1a4c>
    374c:	00031463          	bnez	t1,3754 <_vfprintf_r+0x1a4c>
    3750:	00100313          	li	t1,1
    3754:	100ee793          	or	a5,t4,256
    3758:	00078b13          	mv	s6,a5
    375c:	02c12783          	lw	a5,44(sp)
    3760:	04012223          	sw	zero,68(sp)
    3764:	00078493          	mv	s1,a5
    3768:	0007da63          	bgez	a5,377c <_vfprintf_r+0x1a74>
    376c:	800004b7          	lui	s1,0x80000
    3770:	00f4c4b3          	xor	s1,s1,a5
    3774:	02d00793          	li	a5,45
    3778:	04f12223          	sw	a5,68(sp)
    377c:	fbfe0713          	add	a4,t3,-65
    3780:	02500693          	li	a3,37
    3784:	3ae6e463          	bltu	a3,a4,3b2c <_vfprintf_r+0x1e24>
    3788:	0000c697          	auipc	a3,0xc
    378c:	bc868693          	add	a3,a3,-1080 # f350 <_ctype_+0x270>
    3790:	00271713          	sll	a4,a4,0x2
    3794:	00d70733          	add	a4,a4,a3
    3798:	00072703          	lw	a4,0(a4)
    379c:	00d70733          	add	a4,a4,a3
    37a0:	00070067          	jr	a4
    37a4:	07800793          	li	a5,120
    37a8:	03000713          	li	a4,48
    37ac:	06e10c23          	sb	a4,120(sp)
    37b0:	06f10ca3          	sb	a5,121(sp)
    37b4:	06300713          	li	a4,99
    37b8:	00012823          	sw	zero,16(sp)
    37bc:	002eee93          	or	t4,t4,2
    37c0:	0ec10c13          	add	s8,sp,236
    37c4:	f86758e3          	bge	a4,t1,3754 <_vfprintf_r+0x1a4c>
    37c8:	00130593          	add	a1,t1,1
    37cc:	00098513          	mv	a0,s3
    37d0:	03c12023          	sw	t3,32(sp)
    37d4:	01d12c23          	sw	t4,24(sp)
    37d8:	00612823          	sw	t1,16(sp)
    37dc:	d35fd0ef          	jal	1510 <_malloc_r>
    37e0:	01012303          	lw	t1,16(sp)
    37e4:	01812e83          	lw	t4,24(sp)
    37e8:	02012e03          	lw	t3,32(sp)
    37ec:	00050c13          	mv	s8,a0
    37f0:	00051463          	bnez	a0,37f8 <_vfprintf_r+0x1af0>
    37f4:	13c0106f          	j	4930 <_vfprintf_r+0x2c28>
    37f8:	00a12823          	sw	a0,16(sp)
    37fc:	f59ff06f          	j	3754 <_vfprintf_r+0x1a4c>
    3800:	00098513          	mv	a0,s3
    3804:	1d0030ef          	jal	69d4 <__sinit>
    3808:	00c12783          	lw	a5,12(sp)
    380c:	d5cfe06f          	j	1d68 <_vfprintf_r+0x60>
    3810:	00812583          	lw	a1,8(sp)
    3814:	0a010613          	add	a2,sp,160
    3818:	00098513          	mv	a0,s3
    381c:	03d12023          	sw	t4,32(sp)
    3820:	3a4010ef          	jal	4bc4 <__sprint_r>
    3824:	00050463          	beqz	a0,382c <_vfprintf_r+0x1b24>
    3828:	9b1fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    382c:	0a812483          	lw	s1,168(sp)
    3830:	02012e83          	lw	t4,32(sp)
    3834:	0ac10413          	add	s0,sp,172
    3838:	9b0ff06f          	j	29e8 <_vfprintf_r+0xce0>
    383c:	00800613          	li	a2,8
    3840:	00000593          	li	a1,0
    3844:	09810513          	add	a0,sp,152
    3848:	02612023          	sw	t1,32(sp)
    384c:	01c12a23          	sw	t3,20(sp)
    3850:	01d12823          	sw	t4,16(sp)
    3854:	09812223          	sw	s8,132(sp)
    3858:	d5cfd0ef          	jal	db4 <memset>
    385c:	02012303          	lw	t1,32(sp)
    3860:	01012e83          	lw	t4,16(sp)
    3864:	01412e03          	lw	t3,20(sp)
    3868:	3a0340e3          	bltz	t1,4408 <_vfprintf_r+0x2700>
    386c:	00000d13          	li	s10,0
    3870:	01212823          	sw	s2,16(sp)
    3874:	000c0c93          	mv	s9,s8
    3878:	fff00493          	li	s1,-1
    387c:	000b0c13          	mv	s8,s6
    3880:	000e8a13          	mv	s4,t4
    3884:	00040b13          	mv	s6,s0
    3888:	000d0913          	mv	s2,s10
    388c:	00030413          	mv	s0,t1
    3890:	0300006f          	j	38c0 <_vfprintf_r+0x1bb8>
    3894:	09810693          	add	a3,sp,152
    3898:	0ec10593          	add	a1,sp,236
    389c:	00098513          	mv	a0,s3
    38a0:	110070ef          	jal	a9b0 <_wcrtomb_r>
    38a4:	68950ae3          	beq	a0,s1,4738 <_vfprintf_r+0x2a30>
    38a8:	00a907b3          	add	a5,s2,a0
    38ac:	02f44263          	blt	s0,a5,38d0 <_vfprintf_r+0x1bc8>
    38b0:	004d0d13          	add	s10,s10,4
    38b4:	00879463          	bne	a5,s0,38bc <_vfprintf_r+0x1bb4>
    38b8:	7990006f          	j	4850 <_vfprintf_r+0x2b48>
    38bc:	00078913          	mv	s2,a5
    38c0:	08412783          	lw	a5,132(sp)
    38c4:	01a787b3          	add	a5,a5,s10
    38c8:	0007a603          	lw	a2,0(a5)
    38cc:	fc0614e3          	bnez	a2,3894 <_vfprintf_r+0x1b8c>
    38d0:	00090d13          	mv	s10,s2
    38d4:	01412e03          	lw	t3,20(sp)
    38d8:	01012903          	lw	s2,16(sp)
    38dc:	000b0413          	mv	s0,s6
    38e0:	000a0e93          	mv	t4,s4
    38e4:	000c0b13          	mv	s6,s8
    38e8:	000c8c13          	mv	s8,s9
    38ec:	340d0ce3          	beqz	s10,4444 <_vfprintf_r+0x273c>
    38f0:	06300793          	li	a5,99
    38f4:	59a7dee3          	bge	a5,s10,4690 <_vfprintf_r+0x2988>
    38f8:	001d0593          	add	a1,s10,1
    38fc:	00098513          	mv	a0,s3
    3900:	01c12a23          	sw	t3,20(sp)
    3904:	01d12823          	sw	t4,16(sp)
    3908:	c09fd0ef          	jal	1510 <_malloc_r>
    390c:	01012e83          	lw	t4,16(sp)
    3910:	01412e03          	lw	t3,20(sp)
    3914:	00050c13          	mv	s8,a0
    3918:	620500e3          	beqz	a0,4738 <_vfprintf_r+0x2a30>
    391c:	00a12823          	sw	a0,16(sp)
    3920:	00800613          	li	a2,8
    3924:	00000593          	li	a1,0
    3928:	09810513          	add	a0,sp,152
    392c:	03c12023          	sw	t3,32(sp)
    3930:	01d12a23          	sw	t4,20(sp)
    3934:	c80fd0ef          	jal	db4 <memset>
    3938:	09810713          	add	a4,sp,152
    393c:	000d0693          	mv	a3,s10
    3940:	08410613          	add	a2,sp,132
    3944:	000c0593          	mv	a1,s8
    3948:	00098513          	mv	a0,s3
    394c:	0f0070ef          	jal	aa3c <_wcsrtombs_r>
    3950:	01412e83          	lw	t4,20(sp)
    3954:	02012e03          	lw	t3,32(sp)
    3958:	00ad0463          	beq	s10,a0,3960 <_vfprintf_r+0x1c58>
    395c:	0240106f          	j	4980 <_vfprintf_r+0x2c78>
    3960:	01ac0733          	add	a4,s8,s10
    3964:	00070023          	sb	zero,0(a4)
    3968:	07714603          	lbu	a2,119(sp)
    396c:	fffd4813          	not	a6,s10
    3970:	41f85813          	sra	a6,a6,0x1f
    3974:	01612a23          	sw	s6,20(sp)
    3978:	02012223          	sw	zero,36(sp)
    397c:	02012023          	sw	zero,32(sp)
    3980:	010d7cb3          	and	s9,s10,a6
    3984:	00000313          	li	t1,0
    3988:	00000a13          	li	s4,0
    398c:	00061463          	bnez	a2,3994 <_vfprintf_r+0x1c8c>
    3990:	db8fe06f          	j	1f48 <_vfprintf_r+0x240>
    3994:	9d5fe06f          	j	2368 <_vfprintf_r+0x660>
    3998:	00048e93          	mv	t4,s1
    399c:	000a0293          	mv	t0,s4
    39a0:	00070493          	mv	s1,a4
    39a4:	01a484b3          	add	s1,s1,s10
    39a8:	00178793          	add	a5,a5,1
    39ac:	00542023          	sw	t0,0(s0)
    39b0:	e48fe06f          	j	1ff8 <_vfprintf_r+0x2f0>
    39b4:	01412783          	lw	a5,20(sp)
    39b8:	00c12703          	lw	a4,12(sp)
    39bc:	0007a783          	lw	a5,0(a5)
    39c0:	00e7a023          	sw	a4,0(a5)
    39c4:	fadfe06f          	j	2970 <_vfprintf_r+0xc68>
    39c8:	02012e83          	lw	t4,32(sp)
    39cc:	00040293          	mv	t0,s0
    39d0:	000a0413          	mv	s0,s4
    39d4:	008484b3          	add	s1,s1,s0
    39d8:	001d0d13          	add	s10,s10,1
    39dc:	005b2023          	sw	t0,0(s6)
    39e0:	b7dfe06f          	j	255c <_vfprintf_r+0x854>
    39e4:	03412703          	lw	a4,52(sp)
    39e8:	03012783          	lw	a5,48(sp)
    39ec:	00700613          	li	a2,7
    39f0:	00e42023          	sw	a4,0(s0)
    39f4:	0a412703          	lw	a4,164(sp)
    39f8:	009784b3          	add	s1,a5,s1
    39fc:	00f42223          	sw	a5,4(s0)
    3a00:	00170713          	add	a4,a4,1
    3a04:	0a912423          	sw	s1,168(sp)
    3a08:	0ae12223          	sw	a4,164(sp)
    3a0c:	00840413          	add	s0,s0,8
    3a10:	3ae64463          	blt	a2,a4,3db8 <_vfprintf_r+0x20b0>
    3a14:	3e06cee3          	bltz	a3,4610 <_vfprintf_r+0x2908>
    3a18:	01812783          	lw	a5,24(sp)
    3a1c:	00170713          	add	a4,a4,1
    3a20:	01842023          	sw	s8,0(s0)
    3a24:	009784b3          	add	s1,a5,s1
    3a28:	00f42223          	sw	a5,4(s0)
    3a2c:	0a912423          	sw	s1,168(sp)
    3a30:	0ae12223          	sw	a4,164(sp)
    3a34:	00700793          	li	a5,7
    3a38:	00e7c463          	blt	a5,a4,3a40 <_vfprintf_r+0x1d38>
    3a3c:	dd0fe06f          	j	200c <_vfprintf_r+0x304>
    3a40:	b61fe06f          	j	25a0 <_vfprintf_r+0x898>
    3a44:	01000613          	li	a2,16
    3a48:	0a412683          	lw	a3,164(sp)
    3a4c:	0000c297          	auipc	t0,0xc
    3a50:	99c28293          	add	t0,t0,-1636 # f3e8 <zeroes.0>
    3a54:	09665463          	bge	a2,s6,3adc <_vfprintf_r+0x1dd4>
    3a58:	00040793          	mv	a5,s0
    3a5c:	00048713          	mv	a4,s1
    3a60:	00812403          	lw	s0,8(sp)
    3a64:	01000893          	li	a7,16
    3a68:	00700d13          	li	s10,7
    3a6c:	05d12223          	sw	t4,68(sp)
    3a70:	00028493          	mv	s1,t0
    3a74:	00c0006f          	j	3a80 <_vfprintf_r+0x1d78>
    3a78:	ff0b0b13          	add	s6,s6,-16
    3a7c:	0568d863          	bge	a7,s6,3acc <_vfprintf_r+0x1dc4>
    3a80:	01070713          	add	a4,a4,16
    3a84:	00168693          	add	a3,a3,1
    3a88:	0097a023          	sw	s1,0(a5)
    3a8c:	0117a223          	sw	a7,4(a5)
    3a90:	0ae12423          	sw	a4,168(sp)
    3a94:	0ad12223          	sw	a3,164(sp)
    3a98:	00878793          	add	a5,a5,8
    3a9c:	fcdd5ee3          	bge	s10,a3,3a78 <_vfprintf_r+0x1d70>
    3aa0:	0a010613          	add	a2,sp,160
    3aa4:	00040593          	mv	a1,s0
    3aa8:	00098513          	mv	a0,s3
    3aac:	118010ef          	jal	4bc4 <__sprint_r>
    3ab0:	00050463          	beqz	a0,3ab8 <_vfprintf_r+0x1db0>
    3ab4:	f24fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    3ab8:	0a812703          	lw	a4,168(sp)
    3abc:	0a412683          	lw	a3,164(sp)
    3ac0:	0ac10793          	add	a5,sp,172
    3ac4:	01000893          	li	a7,16
    3ac8:	fb1ff06f          	j	3a78 <_vfprintf_r+0x1d70>
    3acc:	04412e83          	lw	t4,68(sp)
    3ad0:	00048293          	mv	t0,s1
    3ad4:	00078413          	mv	s0,a5
    3ad8:	00070493          	mv	s1,a4
    3adc:	016484b3          	add	s1,s1,s6
    3ae0:	00168693          	add	a3,a3,1
    3ae4:	00542023          	sw	t0,0(s0)
    3ae8:	01642223          	sw	s6,4(s0)
    3aec:	0a912423          	sw	s1,168(sp)
    3af0:	0ad12223          	sw	a3,164(sp)
    3af4:	00700713          	li	a4,7
    3af8:	00840413          	add	s0,s0,8
    3afc:	bed75c63          	bge	a4,a3,2ef4 <_vfprintf_r+0x11ec>
    3b00:	00812583          	lw	a1,8(sp)
    3b04:	0a010613          	add	a2,sp,160
    3b08:	00098513          	mv	a0,s3
    3b0c:	05d12223          	sw	t4,68(sp)
    3b10:	0b4010ef          	jal	4bc4 <__sprint_r>
    3b14:	00050463          	beqz	a0,3b1c <_vfprintf_r+0x1e14>
    3b18:	ec0fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    3b1c:	0a812483          	lw	s1,168(sp)
    3b20:	04412e83          	lw	t4,68(sp)
    3b24:	0ac10413          	add	s0,sp,172
    3b28:	bccff06f          	j	2ef4 <_vfprintf_r+0x11ec>
    3b2c:	02812703          	lw	a4,40(sp)
    3b30:	09810893          	add	a7,sp,152
    3b34:	08410813          	add	a6,sp,132
    3b38:	00070513          	mv	a0,a4
    3b3c:	00050593          	mv	a1,a0
    3b40:	00030713          	mv	a4,t1
    3b44:	07c10793          	add	a5,sp,124
    3b48:	00200693          	li	a3,2
    3b4c:	00048613          	mv	a2,s1
    3b50:	00098513          	mv	a0,s3
    3b54:	03c12223          	sw	t3,36(sp)
    3b58:	03d12023          	sw	t4,32(sp)
    3b5c:	00612c23          	sw	t1,24(sp)
    3b60:	3a8040ef          	jal	7f08 <_dtoa_r>
    3b64:	02012e83          	lw	t4,32(sp)
    3b68:	01812303          	lw	t1,24(sp)
    3b6c:	02412e03          	lw	t3,36(sp)
    3b70:	001ef713          	and	a4,t4,1
    3b74:	00050c13          	mv	s8,a0
    3b78:	1a0712e3          	bnez	a4,451c <_vfprintf_r+0x2814>
    3b7c:	09812783          	lw	a5,152(sp)
    3b80:	07c12a03          	lw	s4,124(sp)
    3b84:	40a787b3          	sub	a5,a5,a0
    3b88:	00f12c23          	sw	a5,24(sp)
    3b8c:	ffd00713          	li	a4,-3
    3b90:	00ea4463          	blt	s4,a4,3b98 <_vfprintf_r+0x1e90>
    3b94:	5b435663          	bge	t1,s4,4140 <_vfprintf_r+0x2438>
    3b98:	ffee0e13          	add	t3,t3,-2
    3b9c:	fffa0d13          	add	s10,s4,-1
    3ba0:	07a12e23          	sw	s10,124(sp)
    3ba4:	0ffe7693          	zext.b	a3,t3
    3ba8:	00000613          	li	a2,0
    3bac:	08d10423          	sb	a3,136(sp)
    3bb0:	02b00693          	li	a3,43
    3bb4:	000d5863          	bgez	s10,3bc4 <_vfprintf_r+0x1ebc>
    3bb8:	00100713          	li	a4,1
    3bbc:	41470d33          	sub	s10,a4,s4
    3bc0:	02d00693          	li	a3,45
    3bc4:	08d104a3          	sb	a3,137(sp)
    3bc8:	00900693          	li	a3,9
    3bcc:	33a6d8e3          	bge	a3,s10,46fc <_vfprintf_r+0x29f4>
    3bd0:	000c0793          	mv	a5,s8
    3bd4:	09f10493          	add	s1,sp,159
    3bd8:	03212023          	sw	s2,32(sp)
    3bdc:	00040c13          	mv	s8,s0
    3be0:	06300a13          	li	s4,99
    3be4:	000d0413          	mv	s0,s10
    3be8:	03d12223          	sw	t4,36(sp)
    3bec:	05c12023          	sw	t3,64(sp)
    3bf0:	00048913          	mv	s2,s1
    3bf4:	00098c93          	mv	s9,s3
    3bf8:	00078d13          	mv	s10,a5
    3bfc:	00a00593          	li	a1,10
    3c00:	00040513          	mv	a0,s0
    3c04:	09c0b0ef          	jal	eca0 <__modsi3>
    3c08:	03050713          	add	a4,a0,48
    3c0c:	00090b13          	mv	s6,s2
    3c10:	00040513          	mv	a0,s0
    3c14:	feeb0fa3          	sb	a4,-1(s6)
    3c18:	00a00593          	li	a1,10
    3c1c:	00040993          	mv	s3,s0
    3c20:	7fd0a0ef          	jal	ec1c <__divsi3>
    3c24:	fff90913          	add	s2,s2,-1
    3c28:	00050413          	mv	s0,a0
    3c2c:	fd3a48e3          	blt	s4,s3,3bfc <_vfprintf_r+0x1ef4>
    3c30:	000c8993          	mv	s3,s9
    3c34:	03050713          	add	a4,a0,48
    3c38:	00090c93          	mv	s9,s2
    3c3c:	ffeb0693          	add	a3,s6,-2
    3c40:	feec8fa3          	sb	a4,-1(s9)
    3c44:	000c0413          	mv	s0,s8
    3c48:	02412e83          	lw	t4,36(sp)
    3c4c:	04012e03          	lw	t3,64(sp)
    3c50:	02012903          	lw	s2,32(sp)
    3c54:	000d0c13          	mv	s8,s10
    3c58:	4c96f6e3          	bgeu	a3,s1,4924 <_vfprintf_r+0x2c1c>
    3c5c:	08a10713          	add	a4,sp,138
    3c60:	0006c783          	lbu	a5,0(a3)
    3c64:	00168693          	add	a3,a3,1
    3c68:	00170713          	add	a4,a4,1
    3c6c:	fef70fa3          	sb	a5,-1(a4)
    3c70:	fe9698e3          	bne	a3,s1,3c60 <_vfprintf_r+0x1f58>
    3c74:	15010793          	add	a5,sp,336
    3c78:	41678633          	sub	a2,a5,s6
    3c7c:	f5360793          	add	a5,a2,-173
    3c80:	04f12023          	sw	a5,64(sp)
    3c84:	01812783          	lw	a5,24(sp)
    3c88:	04012683          	lw	a3,64(sp)
    3c8c:	00100713          	li	a4,1
    3c90:	00d78d33          	add	s10,a5,a3
    3c94:	28f75ce3          	bge	a4,a5,472c <_vfprintf_r+0x2a24>
    3c98:	03012783          	lw	a5,48(sp)
    3c9c:	00fd0d33          	add	s10,s10,a5
    3ca0:	fffd4813          	not	a6,s10
    3ca4:	bffeff13          	and	t5,t4,-1025
    3ca8:	41f85813          	sra	a6,a6,0x1f
    3cac:	100f6e93          	or	t4,t5,256
    3cb0:	010d7cb3          	and	s9,s10,a6
    3cb4:	02012223          	sw	zero,36(sp)
    3cb8:	02012023          	sw	zero,32(sp)
    3cbc:	00000a13          	li	s4,0
    3cc0:	04412783          	lw	a5,68(sp)
    3cc4:	46079263          	bnez	a5,4128 <_vfprintf_r+0x2420>
    3cc8:	07714603          	lbu	a2,119(sp)
    3ccc:	00000313          	li	t1,0
    3cd0:	00061463          	bnez	a2,3cd8 <_vfprintf_r+0x1fd0>
    3cd4:	a74fe06f          	j	1f48 <_vfprintf_r+0x240>
    3cd8:	e90fe06f          	j	2368 <_vfprintf_r+0x660>
    3cdc:	00812583          	lw	a1,8(sp)
    3ce0:	0a010613          	add	a2,sp,160
    3ce4:	00098513          	mv	a0,s3
    3ce8:	03d12023          	sw	t4,32(sp)
    3cec:	6d9000ef          	jal	4bc4 <__sprint_r>
    3cf0:	00050463          	beqz	a0,3cf8 <_vfprintf_r+0x1ff0>
    3cf4:	ce4fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    3cf8:	07c12683          	lw	a3,124(sp)
    3cfc:	0a812483          	lw	s1,168(sp)
    3d00:	02012e83          	lw	t4,32(sp)
    3d04:	0ac10413          	add	s0,sp,172
    3d08:	ce0ff06f          	j	31e8 <_vfprintf_r+0x14e0>
    3d0c:	00600c93          	li	s9,6
    3d10:	f14ff06f          	j	3424 <_vfprintf_r+0x171c>
    3d14:	0ffd7d13          	zext.b	s10,s10
    3d18:	00000c93          	li	s9,0
    3d1c:	bd5fe06f          	j	28f0 <_vfprintf_r+0xbe8>
    3d20:	0ffd7d13          	zext.b	s10,s10
    3d24:	00000c93          	li	s9,0
    3d28:	e48ff06f          	j	3370 <_vfprintf_r+0x1668>
    3d2c:	018d1d13          	sll	s10,s10,0x18
    3d30:	418d5d13          	sra	s10,s10,0x18
    3d34:	41fd5c93          	sra	s9,s10,0x1f
    3d38:	000c8793          	mv	a5,s9
    3d3c:	b39fe06f          	j	2874 <_vfprintf_r+0xb6c>
    3d40:	01412783          	lw	a5,20(sp)
    3d44:	00c12703          	lw	a4,12(sp)
    3d48:	0007a783          	lw	a5,0(a5)
    3d4c:	00e79023          	sh	a4,0(a5)
    3d50:	c21fe06f          	j	2970 <_vfprintf_r+0xc68>
    3d54:	000c0513          	mv	a0,s8
    3d58:	05d12223          	sw	t4,68(sp)
    3d5c:	ad8fd0ef          	jal	1034 <strlen>
    3d60:	07714603          	lbu	a2,119(sp)
    3d64:	fff54813          	not	a6,a0
    3d68:	41f85813          	sra	a6,a6,0x1f
    3d6c:	01612a23          	sw	s6,20(sp)
    3d70:	02012223          	sw	zero,36(sp)
    3d74:	02012023          	sw	zero,32(sp)
    3d78:	00012823          	sw	zero,16(sp)
    3d7c:	04412e83          	lw	t4,68(sp)
    3d80:	00050d13          	mv	s10,a0
    3d84:	01057cb3          	and	s9,a0,a6
    3d88:	00000313          	li	t1,0
    3d8c:	07300e13          	li	t3,115
    3d90:	00061463          	bnez	a2,3d98 <_vfprintf_r+0x2090>
    3d94:	9b4fe06f          	j	1f48 <_vfprintf_r+0x240>
    3d98:	dd0fe06f          	j	2368 <_vfprintf_r+0x660>
    3d9c:	00812583          	lw	a1,8(sp)
    3da0:	0a010613          	add	a2,sp,160
    3da4:	00098513          	mv	a0,s3
    3da8:	61d000ef          	jal	4bc4 <__sprint_r>
    3dac:	00051463          	bnez	a0,3db4 <_vfprintf_r+0x20ac>
    3db0:	be8fe06f          	j	2198 <_vfprintf_r+0x490>
    3db4:	c38fe06f          	j	21ec <_vfprintf_r+0x4e4>
    3db8:	00812583          	lw	a1,8(sp)
    3dbc:	0a010613          	add	a2,sp,160
    3dc0:	00098513          	mv	a0,s3
    3dc4:	03d12023          	sw	t4,32(sp)
    3dc8:	5fd000ef          	jal	4bc4 <__sprint_r>
    3dcc:	00050463          	beqz	a0,3dd4 <_vfprintf_r+0x20cc>
    3dd0:	c08fe06f          	j	21d8 <_vfprintf_r+0x4d0>
    3dd4:	07c12683          	lw	a3,124(sp)
    3dd8:	0a812483          	lw	s1,168(sp)
    3ddc:	0a412703          	lw	a4,164(sp)
    3de0:	02012e83          	lw	t4,32(sp)
    3de4:	0ac10413          	add	s0,sp,172
    3de8:	c2dff06f          	j	3a14 <_vfprintf_r+0x1d0c>
    3dec:	05862503          	lw	a0,88(a2)
    3df0:	00f12623          	sw	a5,12(sp)
    3df4:	fbdfc0ef          	jal	db0 <__retarget_lock_release_recursive>
    3df8:	00c12783          	lw	a5,12(sp)
    3dfc:	ab8fe06f          	j	20b4 <_vfprintf_r+0x3ac>
    3e00:	00130a13          	add	s4,t1,1
    3e04:	00200693          	li	a3,2
    3e08:	02812703          	lw	a4,40(sp)
    3e0c:	09810893          	add	a7,sp,152
    3e10:	08410813          	add	a6,sp,132
    3e14:	00070513          	mv	a0,a4
    3e18:	00050593          	mv	a1,a0
    3e1c:	000a0713          	mv	a4,s4
    3e20:	07c10793          	add	a5,sp,124
    3e24:	00048613          	mv	a2,s1
    3e28:	00098513          	mv	a0,s3
    3e2c:	02612223          	sw	t1,36(sp)
    3e30:	03c12023          	sw	t3,32(sp)
    3e34:	01d12c23          	sw	t4,24(sp)
    3e38:	0d0040ef          	jal	7f08 <_dtoa_r>
    3e3c:	02012e03          	lw	t3,32(sp)
    3e40:	04600693          	li	a3,70
    3e44:	01812e83          	lw	t4,24(sp)
    3e48:	fdfe7d13          	and	s10,t3,-33
    3e4c:	02412303          	lw	t1,36(sp)
    3e50:	00050c13          	mv	s8,a0
    3e54:	01450733          	add	a4,a0,s4
    3e58:	34dd14e3          	bne	s10,a3,49a0 <_vfprintf_r+0x2c98>
    3e5c:	000c4603          	lbu	a2,0(s8)
    3e60:	03000693          	li	a3,48
    3e64:	6cd60263          	beq	a2,a3,4528 <_vfprintf_r+0x2820>
    3e68:	07c12683          	lw	a3,124(sp)
    3e6c:	00d70733          	add	a4,a4,a3
    3e70:	02812683          	lw	a3,40(sp)
    3e74:	00048593          	mv	a1,s1
    3e78:	00000613          	li	a2,0
    3e7c:	00068513          	mv	a0,a3
    3e80:	00000693          	li	a3,0
    3e84:	04e12823          	sw	a4,80(sp)
    3e88:	02612223          	sw	t1,36(sp)
    3e8c:	03c12023          	sw	t3,32(sp)
    3e90:	01d12c23          	sw	t4,24(sp)
    3e94:	370090ef          	jal	d204 <__eqdf2>
    3e98:	01812e83          	lw	t4,24(sp)
    3e9c:	02012e03          	lw	t3,32(sp)
    3ea0:	02412303          	lw	t1,36(sp)
    3ea4:	05012703          	lw	a4,80(sp)
    3ea8:	62050863          	beqz	a0,44d8 <_vfprintf_r+0x27d0>
    3eac:	09812783          	lw	a5,152(sp)
    3eb0:	00e7fe63          	bgeu	a5,a4,3ecc <_vfprintf_r+0x21c4>
    3eb4:	03000613          	li	a2,48
    3eb8:	00178693          	add	a3,a5,1
    3ebc:	08d12c23          	sw	a3,152(sp)
    3ec0:	00c78023          	sb	a2,0(a5)
    3ec4:	09812783          	lw	a5,152(sp)
    3ec8:	fee7e8e3          	bltu	a5,a4,3eb8 <_vfprintf_r+0x21b0>
    3ecc:	07c12a03          	lw	s4,124(sp)
    3ed0:	418787b3          	sub	a5,a5,s8
    3ed4:	04700713          	li	a4,71
    3ed8:	00f12c23          	sw	a5,24(sp)
    3edc:	caed08e3          	beq	s10,a4,3b8c <_vfprintf_r+0x1e84>
    3ee0:	04600713          	li	a4,70
    3ee4:	68ed0863          	beq	s10,a4,4574 <_vfprintf_r+0x286c>
    3ee8:	fffa0d13          	add	s10,s4,-1
    3eec:	cb5ff06f          	j	3ba0 <_vfprintf_r+0x1e98>
    3ef0:	02812703          	lw	a4,40(sp)
    3ef4:	07c10613          	add	a2,sp,124
    3ef8:	00048593          	mv	a1,s1
    3efc:	00070513          	mv	a0,a4
    3f00:	02612223          	sw	t1,36(sp)
    3f04:	03c12023          	sw	t3,32(sp)
    3f08:	01d12c23          	sw	t4,24(sp)
    3f0c:	4e9030ef          	jal	7bf4 <frexp>
    3f10:	7fffc717          	auipc	a4,0x7fffc
    3f14:	79870713          	add	a4,a4,1944 # 800006a8 <__global_locale+0x174>
    3f18:	00072603          	lw	a2,0(a4)
    3f1c:	00472683          	lw	a3,4(a4)
    3f20:	578090ef          	jal	d498 <__muldf3>
    3f24:	00000613          	li	a2,0
    3f28:	00000693          	li	a3,0
    3f2c:	00050a13          	mv	s4,a0
    3f30:	00058d13          	mv	s10,a1
    3f34:	2d0090ef          	jal	d204 <__eqdf2>
    3f38:	01812e83          	lw	t4,24(sp)
    3f3c:	02012e03          	lw	t3,32(sp)
    3f40:	02412303          	lw	t1,36(sp)
    3f44:	00051663          	bnez	a0,3f50 <_vfprintf_r+0x2248>
    3f48:	00100713          	li	a4,1
    3f4c:	06e12e23          	sw	a4,124(sp)
    3f50:	0000b797          	auipc	a5,0xb
    3f54:	fc478793          	add	a5,a5,-60 # ef14 <__fini_array_end+0x1bc>
    3f58:	06100713          	li	a4,97
    3f5c:	02f12023          	sw	a5,32(sp)
    3f60:	00ee1863          	bne	t3,a4,3f70 <_vfprintf_r+0x2268>
    3f64:	0000b797          	auipc	a5,0xb
    3f68:	f9c78793          	add	a5,a5,-100 # ef00 <__fini_array_end+0x1a8>
    3f6c:	02f12023          	sw	a5,32(sp)
    3f70:	7fffc717          	auipc	a4,0x7fffc
    3f74:	74070713          	add	a4,a4,1856 # 800006b0 <__global_locale+0x17c>
    3f78:	00072783          	lw	a5,0(a4)
    3f7c:	00472803          	lw	a6,4(a4)
    3f80:	000c0493          	mv	s1,s8
    3f84:	00f12c23          	sw	a5,24(sp)
    3f88:	000d0793          	mv	a5,s10
    3f8c:	03212223          	sw	s2,36(sp)
    3f90:	000c0d13          	mv	s10,s8
    3f94:	02012903          	lw	s2,32(sp)
    3f98:	00098c13          	mv	s8,s3
    3f9c:	01012e23          	sw	a6,28(sp)
    3fa0:	fff30b13          	add	s6,t1,-1
    3fa4:	fff00c93          	li	s9,-1
    3fa8:	05d12023          	sw	t4,64(sp)
    3fac:	05c12823          	sw	t3,80(sp)
    3fb0:	04812a23          	sw	s0,84(sp)
    3fb4:	00078993          	mv	s3,a5
    3fb8:	01c0006f          	j	3fd4 <_vfprintf_r+0x22cc>
    3fbc:	00000613          	li	a2,0
    3fc0:	00000693          	li	a3,0
    3fc4:	fffb0413          	add	s0,s6,-1
    3fc8:	23c090ef          	jal	d204 <__eqdf2>
    3fcc:	0a0504e3          	beqz	a0,4874 <_vfprintf_r+0x2b6c>
    3fd0:	00040b13          	mv	s6,s0
    3fd4:	01812603          	lw	a2,24(sp)
    3fd8:	01c12683          	lw	a3,28(sp)
    3fdc:	000a0513          	mv	a0,s4
    3fe0:	00098593          	mv	a1,s3
    3fe4:	4b4090ef          	jal	d498 <__muldf3>
    3fe8:	00058a13          	mv	s4,a1
    3fec:	00050993          	mv	s3,a0
    3ff0:	5940a0ef          	jal	e584 <__fixdfsi>
    3ff4:	00050413          	mv	s0,a0
    3ff8:	6100a0ef          	jal	e608 <__floatsidf>
    3ffc:	00050613          	mv	a2,a0
    4000:	00058693          	mv	a3,a1
    4004:	00098513          	mv	a0,s3
    4008:	000a0593          	mv	a1,s4
    400c:	41d090ef          	jal	dc28 <__subdf3>
    4010:	00890733          	add	a4,s2,s0
    4014:	00074703          	lbu	a4,0(a4)
    4018:	00048813          	mv	a6,s1
    401c:	00050a13          	mv	s4,a0
    4020:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    4024:	00058993          	mv	s3,a1
    4028:	00148493          	add	s1,s1,1
    402c:	f99b18e3          	bne	s6,s9,3fbc <_vfprintf_r+0x22b4>
    4030:	7fffc697          	auipc	a3,0x7fffc
    4034:	68868693          	add	a3,a3,1672 # 800006b8 <__global_locale+0x184>
    4038:	0006a303          	lw	t1,0(a3)
    403c:	0046a383          	lw	t2,4(a3)
    4040:	05012e03          	lw	t3,80(sp)
    4044:	00030613          	mv	a2,t1
    4048:	00038693          	mv	a3,t2
    404c:	01012c23          	sw	a6,24(sp)
    4050:	02412903          	lw	s2,36(sp)
    4054:	000c0993          	mv	s3,s8
    4058:	03c12223          	sw	t3,36(sp)
    405c:	000d0c13          	mv	s8,s10
    4060:	00058d13          	mv	s10,a1
    4064:	22c090ef          	jal	d290 <__gedf2>
    4068:	7fffc797          	auipc	a5,0x7fffc
    406c:	65078793          	add	a5,a5,1616 # 800006b8 <__global_locale+0x184>
    4070:	00040b13          	mv	s6,s0
    4074:	0007a303          	lw	t1,0(a5)
    4078:	05412403          	lw	s0,84(sp)
    407c:	0047a383          	lw	t2,4(a5)
    4080:	01812803          	lw	a6,24(sp)
    4084:	02412e03          	lw	t3,36(sp)
    4088:	04012e83          	lw	t4,64(sp)
    408c:	0aa05ce3          	blez	a0,4944 <_vfprintf_r+0x2c3c>
    4090:	02012783          	lw	a5,32(sp)
    4094:	09012c23          	sw	a6,152(sp)
    4098:	fff4c603          	lbu	a2,-1(s1)
    409c:	00f7c583          	lbu	a1,15(a5)
    40a0:	00048693          	mv	a3,s1
    40a4:	02b61063          	bne	a2,a1,40c4 <_vfprintf_r+0x23bc>
    40a8:	03000513          	li	a0,48
    40ac:	fea68fa3          	sb	a0,-1(a3)
    40b0:	09812683          	lw	a3,152(sp)
    40b4:	fff68793          	add	a5,a3,-1
    40b8:	08f12c23          	sw	a5,152(sp)
    40bc:	fff6c603          	lbu	a2,-1(a3)
    40c0:	feb606e3          	beq	a2,a1,40ac <_vfprintf_r+0x23a4>
    40c4:	00160593          	add	a1,a2,1
    40c8:	03900513          	li	a0,57
    40cc:	0ff5f593          	zext.b	a1,a1
    40d0:	04a60463          	beq	a2,a0,4118 <_vfprintf_r+0x2410>
    40d4:	feb68fa3          	sb	a1,-1(a3)
    40d8:	00048793          	mv	a5,s1
    40dc:	07c12a03          	lw	s4,124(sp)
    40e0:	418787b3          	sub	a5,a5,s8
    40e4:	06100613          	li	a2,97
    40e8:	fffa0d13          	add	s10,s4,-1
    40ec:	00f12c23          	sw	a5,24(sp)
    40f0:	07a12e23          	sw	s10,124(sp)
    40f4:	07000693          	li	a3,112
    40f8:	00ce0663          	beq	t3,a2,4104 <_vfprintf_r+0x23fc>
    40fc:	05000693          	li	a3,80
    4100:	04100e13          	li	t3,65
    4104:	00100613          	li	a2,1
    4108:	aa5ff06f          	j	3bac <_vfprintf_r+0x1ea4>
    410c:	00030a13          	mv	s4,t1
    4110:	00300693          	li	a3,3
    4114:	cf5ff06f          	j	3e08 <_vfprintf_r+0x2100>
    4118:	02012783          	lw	a5,32(sp)
    411c:	00a7c583          	lbu	a1,10(a5)
    4120:	feb68fa3          	sb	a1,-1(a3)
    4124:	fb5ff06f          	j	40d8 <_vfprintf_r+0x23d0>
    4128:	02d00713          	li	a4,45
    412c:	06e10ba3          	sb	a4,119(sp)
    4130:	02d00613          	li	a2,45
    4134:	00000313          	li	t1,0
    4138:	001c8c93          	add	s9,s9,1
    413c:	e0dfd06f          	j	1f48 <_vfprintf_r+0x240>
    4140:	01812783          	lw	a5,24(sp)
    4144:	46fa4063          	blt	s4,a5,45a4 <_vfprintf_r+0x289c>
    4148:	001ef713          	and	a4,t4,1
    414c:	000a0d13          	mv	s10,s4
    4150:	00070663          	beqz	a4,415c <_vfprintf_r+0x2454>
    4154:	03012783          	lw	a5,48(sp)
    4158:	00fa0d33          	add	s10,s4,a5
    415c:	400eff13          	and	t5,t4,1024
    4160:	000f0463          	beqz	t5,4168 <_vfprintf_r+0x2460>
    4164:	5f404e63          	bgtz	s4,4760 <_vfprintf_r+0x2a58>
    4168:	fffd4813          	not	a6,s10
    416c:	41f85813          	sra	a6,a6,0x1f
    4170:	010d7cb3          	and	s9,s10,a6
    4174:	06700e13          	li	t3,103
    4178:	000b0e93          	mv	t4,s6
    417c:	02012223          	sw	zero,36(sp)
    4180:	02012023          	sw	zero,32(sp)
    4184:	b3dff06f          	j	3cc0 <_vfprintf_r+0x1fb8>
    4188:	02d00793          	li	a5,45
    418c:	06f10ba3          	sb	a5,119(sp)
    4190:	02d00613          	li	a2,45
    4194:	998fe06f          	j	232c <_vfprintf_r+0x624>
    4198:	01812783          	lw	a5,24(sp)
    419c:	02012a03          	lw	s4,32(sp)
    41a0:	05212823          	sw	s2,80(sp)
    41a4:	00fc07b3          	add	a5,s8,a5
    41a8:	05712c23          	sw	s7,88(sp)
    41ac:	05912e23          	sw	s9,92(sp)
    41b0:	00040713          	mv	a4,s0
    41b4:	04f12223          	sw	a5,68(sp)
    41b8:	02412403          	lw	s0,36(sp)
    41bc:	05d12a23          	sw	t4,84(sp)
    41c0:	03812223          	sw	s8,36(sp)
    41c4:	03c12b83          	lw	s7,60(sp)
    41c8:	04c12c83          	lw	s9,76(sp)
    41cc:	00812903          	lw	s2,8(sp)
    41d0:	00700693          	li	a3,7
    41d4:	01000d13          	li	s10,16
    41d8:	0000bb17          	auipc	s6,0xb
    41dc:	210b0b13          	add	s6,s6,528 # f3e8 <zeroes.0>
    41e0:	00048613          	mv	a2,s1
    41e4:	00030c13          	mv	s8,t1
    41e8:	09405863          	blez	s4,4278 <_vfprintf_r+0x2570>
    41ec:	16805e63          	blez	s0,4368 <_vfprintf_r+0x2660>
    41f0:	fff40413          	add	s0,s0,-1
    41f4:	04812783          	lw	a5,72(sp)
    41f8:	01960633          	add	a2,a2,s9
    41fc:	01972223          	sw	s9,4(a4)
    4200:	00f72023          	sw	a5,0(a4)
    4204:	0a412783          	lw	a5,164(sp)
    4208:	0ac12423          	sw	a2,168(sp)
    420c:	00870713          	add	a4,a4,8
    4210:	00178793          	add	a5,a5,1
    4214:	0af12223          	sw	a5,164(sp)
    4218:	14f6ce63          	blt	a3,a5,4374 <_vfprintf_r+0x266c>
    421c:	04412783          	lw	a5,68(sp)
    4220:	000bc583          	lbu	a1,0(s7)
    4224:	418784b3          	sub	s1,a5,s8
    4228:	0095d463          	bge	a1,s1,4230 <_vfprintf_r+0x2528>
    422c:	00058493          	mv	s1,a1
    4230:	02905663          	blez	s1,425c <_vfprintf_r+0x2554>
    4234:	0a412583          	lw	a1,164(sp)
    4238:	00960633          	add	a2,a2,s1
    423c:	01872023          	sw	s8,0(a4)
    4240:	00158593          	add	a1,a1,1
    4244:	00972223          	sw	s1,4(a4)
    4248:	0ac12423          	sw	a2,168(sp)
    424c:	0ab12223          	sw	a1,164(sp)
    4250:	14b6c663          	blt	a3,a1,439c <_vfprintf_r+0x2694>
    4254:	000bc583          	lbu	a1,0(s7)
    4258:	00870713          	add	a4,a4,8
    425c:	fff4c513          	not	a0,s1
    4260:	41f55513          	sra	a0,a0,0x1f
    4264:	00a4f7b3          	and	a5,s1,a0
    4268:	40f584b3          	sub	s1,a1,a5
    426c:	04904663          	bgtz	s1,42b8 <_vfprintf_r+0x25b0>
    4270:	00bc0c33          	add	s8,s8,a1
    4274:	f7404ce3          	bgtz	s4,41ec <_vfprintf_r+0x24e4>
    4278:	f6804ce3          	bgtz	s0,41f0 <_vfprintf_r+0x24e8>
    427c:	01812783          	lw	a5,24(sp)
    4280:	000c0313          	mv	t1,s8
    4284:	02412c03          	lw	s8,36(sp)
    4288:	03712e23          	sw	s7,60(sp)
    428c:	00070413          	mv	s0,a4
    4290:	00fc0733          	add	a4,s8,a5
    4294:	05012903          	lw	s2,80(sp)
    4298:	05412e83          	lw	t4,84(sp)
    429c:	05812b83          	lw	s7,88(sp)
    42a0:	05c12c83          	lw	s9,92(sp)
    42a4:	00060493          	mv	s1,a2
    42a8:	00676463          	bltu	a4,t1,42b0 <_vfprintf_r+0x25a8>
    42ac:	c59fe06f          	j	2f04 <_vfprintf_r+0x11fc>
    42b0:	00070313          	mv	t1,a4
    42b4:	c51fe06f          	j	2f04 <_vfprintf_r+0x11fc>
    42b8:	0a412583          	lw	a1,164(sp)
    42bc:	0000be97          	auipc	t4,0xb
    42c0:	12ce8e93          	add	t4,t4,300 # f3e8 <zeroes.0>
    42c4:	069d5c63          	bge	s10,s1,433c <_vfprintf_r+0x2634>
    42c8:	02812023          	sw	s0,32(sp)
    42cc:	00048413          	mv	s0,s1
    42d0:	000b0493          	mv	s1,s6
    42d4:	00c0006f          	j	42e0 <_vfprintf_r+0x25d8>
    42d8:	ff040413          	add	s0,s0,-16
    42dc:	048d5a63          	bge	s10,s0,4330 <_vfprintf_r+0x2628>
    42e0:	01060613          	add	a2,a2,16
    42e4:	00158593          	add	a1,a1,1
    42e8:	01672023          	sw	s6,0(a4)
    42ec:	01a72223          	sw	s10,4(a4)
    42f0:	0ac12423          	sw	a2,168(sp)
    42f4:	0ab12223          	sw	a1,164(sp)
    42f8:	00870713          	add	a4,a4,8
    42fc:	fcb6dee3          	bge	a3,a1,42d8 <_vfprintf_r+0x25d0>
    4300:	0a010613          	add	a2,sp,160
    4304:	00090593          	mv	a1,s2
    4308:	00098513          	mv	a0,s3
    430c:	0b9000ef          	jal	4bc4 <__sprint_r>
    4310:	00050463          	beqz	a0,4318 <_vfprintf_r+0x2610>
    4314:	ec5fd06f          	j	21d8 <_vfprintf_r+0x4d0>
    4318:	ff040413          	add	s0,s0,-16
    431c:	0a812603          	lw	a2,168(sp)
    4320:	0a412583          	lw	a1,164(sp)
    4324:	0ac10713          	add	a4,sp,172
    4328:	00700693          	li	a3,7
    432c:	fa8d4ae3          	blt	s10,s0,42e0 <_vfprintf_r+0x25d8>
    4330:	00048e93          	mv	t4,s1
    4334:	00040493          	mv	s1,s0
    4338:	02012403          	lw	s0,32(sp)
    433c:	00960633          	add	a2,a2,s1
    4340:	00158593          	add	a1,a1,1
    4344:	01d72023          	sw	t4,0(a4)
    4348:	00972223          	sw	s1,4(a4)
    434c:	0ac12423          	sw	a2,168(sp)
    4350:	0ab12223          	sw	a1,164(sp)
    4354:	10b6ce63          	blt	a3,a1,4470 <_vfprintf_r+0x2768>
    4358:	000bc583          	lbu	a1,0(s7)
    435c:	00870713          	add	a4,a4,8
    4360:	00bc0c33          	add	s8,s8,a1
    4364:	f11ff06f          	j	4274 <_vfprintf_r+0x256c>
    4368:	fffb8b93          	add	s7,s7,-1
    436c:	fffa0a13          	add	s4,s4,-1
    4370:	e85ff06f          	j	41f4 <_vfprintf_r+0x24ec>
    4374:	0a010613          	add	a2,sp,160
    4378:	00090593          	mv	a1,s2
    437c:	00098513          	mv	a0,s3
    4380:	045000ef          	jal	4bc4 <__sprint_r>
    4384:	00050463          	beqz	a0,438c <_vfprintf_r+0x2684>
    4388:	e51fd06f          	j	21d8 <_vfprintf_r+0x4d0>
    438c:	0a812603          	lw	a2,168(sp)
    4390:	0ac10713          	add	a4,sp,172
    4394:	00700693          	li	a3,7
    4398:	e85ff06f          	j	421c <_vfprintf_r+0x2514>
    439c:	0a010613          	add	a2,sp,160
    43a0:	00090593          	mv	a1,s2
    43a4:	00098513          	mv	a0,s3
    43a8:	01d000ef          	jal	4bc4 <__sprint_r>
    43ac:	00050463          	beqz	a0,43b4 <_vfprintf_r+0x26ac>
    43b0:	e29fd06f          	j	21d8 <_vfprintf_r+0x4d0>
    43b4:	000bc583          	lbu	a1,0(s7)
    43b8:	0a812603          	lw	a2,168(sp)
    43bc:	0ac10713          	add	a4,sp,172
    43c0:	00700693          	li	a3,7
    43c4:	e99ff06f          	j	425c <_vfprintf_r+0x2554>
    43c8:	04c12783          	lw	a5,76(sp)
    43cc:	04812583          	lw	a1,72(sp)
    43d0:	00000913          	li	s2,0
    43d4:	40fc0c33          	sub	s8,s8,a5
    43d8:	00078613          	mv	a2,a5
    43dc:	000c0513          	mv	a0,s8
    43e0:	468030ef          	jal	7848 <strncpy>
    43e4:	00144783          	lbu	a5,1(s0)
    43e8:	00a00613          	li	a2,10
    43ec:	00000693          	li	a3,0
    43f0:	00f037b3          	snez	a5,a5
    43f4:	000d0513          	mv	a0,s10
    43f8:	000c8593          	mv	a1,s9
    43fc:	00f40433          	add	s0,s0,a5
    4400:	78d060ef          	jal	b38c <__udivdi3>
    4404:	a10ff06f          	j	3614 <_vfprintf_r+0x190c>
    4408:	09810713          	add	a4,sp,152
    440c:	00000693          	li	a3,0
    4410:	08410613          	add	a2,sp,132
    4414:	00000593          	li	a1,0
    4418:	00098513          	mv	a0,s3
    441c:	01c12a23          	sw	t3,20(sp)
    4420:	01d12823          	sw	t4,16(sp)
    4424:	618060ef          	jal	aa3c <_wcsrtombs_r>
    4428:	fff00713          	li	a4,-1
    442c:	01012e83          	lw	t4,16(sp)
    4430:	01412e03          	lw	t3,20(sp)
    4434:	00050d13          	mv	s10,a0
    4438:	30e50063          	beq	a0,a4,4738 <_vfprintf_r+0x2a30>
    443c:	09812223          	sw	s8,132(sp)
    4440:	cacff06f          	j	38ec <_vfprintf_r+0x1be4>
    4444:	07714603          	lbu	a2,119(sp)
    4448:	01612a23          	sw	s6,20(sp)
    444c:	02012223          	sw	zero,36(sp)
    4450:	02012023          	sw	zero,32(sp)
    4454:	00012823          	sw	zero,16(sp)
    4458:	00000c93          	li	s9,0
    445c:	00000313          	li	t1,0
    4460:	00000a13          	li	s4,0
    4464:	00061463          	bnez	a2,446c <_vfprintf_r+0x2764>
    4468:	ae1fd06f          	j	1f48 <_vfprintf_r+0x240>
    446c:	efdfd06f          	j	2368 <_vfprintf_r+0x660>
    4470:	0a010613          	add	a2,sp,160
    4474:	00090593          	mv	a1,s2
    4478:	00098513          	mv	a0,s3
    447c:	748000ef          	jal	4bc4 <__sprint_r>
    4480:	00050463          	beqz	a0,4488 <_vfprintf_r+0x2780>
    4484:	d55fd06f          	j	21d8 <_vfprintf_r+0x4d0>
    4488:	000bc583          	lbu	a1,0(s7)
    448c:	0a812603          	lw	a2,168(sp)
    4490:	0ac10713          	add	a4,sp,172
    4494:	00700693          	li	a3,7
    4498:	00bc0c33          	add	s8,s8,a1
    449c:	dd9ff06f          	j	4274 <_vfprintf_r+0x256c>
    44a0:	00812583          	lw	a1,8(sp)
    44a4:	0a010613          	add	a2,sp,160
    44a8:	00098513          	mv	a0,s3
    44ac:	05d12223          	sw	t4,68(sp)
    44b0:	714000ef          	jal	4bc4 <__sprint_r>
    44b4:	00050463          	beqz	a0,44bc <_vfprintf_r+0x27b4>
    44b8:	d21fd06f          	j	21d8 <_vfprintf_r+0x4d0>
    44bc:	0a812483          	lw	s1,168(sp)
    44c0:	04412e83          	lw	t4,68(sp)
    44c4:	0ac10413          	add	s0,sp,172
    44c8:	a19fe06f          	j	2ee0 <_vfprintf_r+0x11d8>
    44cc:	00900793          	li	a5,9
    44d0:	95a7e263          	bltu	a5,s10,3614 <_vfprintf_r+0x190c>
    44d4:	98cff06f          	j	3660 <_vfprintf_r+0x1958>
    44d8:	07c12a03          	lw	s4,124(sp)
    44dc:	00070793          	mv	a5,a4
    44e0:	9f1ff06f          	j	3ed0 <_vfprintf_r+0x21c8>
    44e4:	00812583          	lw	a1,8(sp)
    44e8:	0a010613          	add	a2,sp,160
    44ec:	00098513          	mv	a0,s3
    44f0:	03d12023          	sw	t4,32(sp)
    44f4:	6d0000ef          	jal	4bc4 <__sprint_r>
    44f8:	00050463          	beqz	a0,4500 <_vfprintf_r+0x27f8>
    44fc:	cddfd06f          	j	21d8 <_vfprintf_r+0x4d0>
    4500:	07c12d03          	lw	s10,124(sp)
    4504:	01812783          	lw	a5,24(sp)
    4508:	0a812483          	lw	s1,168(sp)
    450c:	02012e83          	lw	t4,32(sp)
    4510:	0ac10413          	add	s0,sp,172
    4514:	41a78d33          	sub	s10,a5,s10
    4518:	a49fe06f          	j	2f60 <_vfprintf_r+0x1258>
    451c:	00650733          	add	a4,a0,t1
    4520:	04700d13          	li	s10,71
    4524:	94dff06f          	j	3e70 <_vfprintf_r+0x2168>
    4528:	02812603          	lw	a2,40(sp)
    452c:	00048593          	mv	a1,s1
    4530:	00000693          	li	a3,0
    4534:	00060513          	mv	a0,a2
    4538:	00000613          	li	a2,0
    453c:	04e12823          	sw	a4,80(sp)
    4540:	02612223          	sw	t1,36(sp)
    4544:	03c12023          	sw	t3,32(sp)
    4548:	01d12c23          	sw	t4,24(sp)
    454c:	4b9080ef          	jal	d204 <__eqdf2>
    4550:	01812e83          	lw	t4,24(sp)
    4554:	02012e03          	lw	t3,32(sp)
    4558:	02412303          	lw	t1,36(sp)
    455c:	05012703          	lw	a4,80(sp)
    4560:	34051e63          	bnez	a0,48bc <_vfprintf_r+0x2bb4>
    4564:	07c12a03          	lw	s4,124(sp)
    4568:	01470733          	add	a4,a4,s4
    456c:	418707b3          	sub	a5,a4,s8
    4570:	00f12c23          	sw	a5,24(sp)
    4574:	001ef713          	and	a4,t4,1
    4578:	00676733          	or	a4,a4,t1
    457c:	37405a63          	blez	s4,48f0 <_vfprintf_r+0x2be8>
    4580:	26071263          	bnez	a4,47e4 <_vfprintf_r+0x2adc>
    4584:	000a0d13          	mv	s10,s4
    4588:	06600e13          	li	t3,102
    458c:	400eff13          	and	t5,t4,1024
    4590:	1c0f1a63          	bnez	t5,4764 <_vfprintf_r+0x2a5c>
    4594:	fffd4813          	not	a6,s10
    4598:	41f85813          	sra	a6,a6,0x1f
    459c:	010d7cb3          	and	s9,s10,a6
    45a0:	bd9ff06f          	j	4178 <_vfprintf_r+0x2470>
    45a4:	01812783          	lw	a5,24(sp)
    45a8:	03012703          	lw	a4,48(sp)
    45ac:	06700e13          	li	t3,103
    45b0:	00e78d33          	add	s10,a5,a4
    45b4:	fd404ce3          	bgtz	s4,458c <_vfprintf_r+0x2884>
    45b8:	414d06b3          	sub	a3,s10,s4
    45bc:	00168d13          	add	s10,a3,1
    45c0:	fffd4813          	not	a6,s10
    45c4:	41f85813          	sra	a6,a6,0x1f
    45c8:	010d7cb3          	and	s9,s10,a6
    45cc:	badff06f          	j	4178 <_vfprintf_r+0x2470>
    45d0:	000e8613          	mv	a2,t4
    45d4:	ad8fe06f          	j	28ac <_vfprintf_r+0xba4>
    45d8:	00812783          	lw	a5,8(sp)
    45dc:	0647a783          	lw	a5,100(a5)
    45e0:	0017f793          	and	a5,a5,1
    45e4:	02079063          	bnez	a5,4604 <_vfprintf_r+0x28fc>
    45e8:	00812783          	lw	a5,8(sp)
    45ec:	00c7d783          	lhu	a5,12(a5)
    45f0:	2007f793          	and	a5,a5,512
    45f4:	00079863          	bnez	a5,4604 <_vfprintf_r+0x28fc>
    45f8:	00812783          	lw	a5,8(sp)
    45fc:	0587a503          	lw	a0,88(a5)
    4600:	fb0fc0ef          	jal	db0 <__retarget_lock_release_recursive>
    4604:	fff00793          	li	a5,-1
    4608:	00f12623          	sw	a5,12(sp)
    460c:	c2dfd06f          	j	2238 <_vfprintf_r+0x530>
    4610:	ff000613          	li	a2,-16
    4614:	40d00d33          	neg	s10,a3
    4618:	0000b297          	auipc	t0,0xb
    461c:	dd028293          	add	t0,t0,-560 # f3e8 <zeroes.0>
    4620:	08c6d463          	bge	a3,a2,46a8 <_vfprintf_r+0x29a0>
    4624:	03212023          	sw	s2,32(sp)
    4628:	01000693          	li	a3,16
    462c:	00700b13          	li	s6,7
    4630:	000e8a13          	mv	s4,t4
    4634:	00028913          	mv	s2,t0
    4638:	00c0006f          	j	4644 <_vfprintf_r+0x293c>
    463c:	ff0d0d13          	add	s10,s10,-16
    4640:	05a6de63          	bge	a3,s10,469c <_vfprintf_r+0x2994>
    4644:	01048493          	add	s1,s1,16
    4648:	00170713          	add	a4,a4,1
    464c:	01242023          	sw	s2,0(s0)
    4650:	00d42223          	sw	a3,4(s0)
    4654:	0a912423          	sw	s1,168(sp)
    4658:	0ae12223          	sw	a4,164(sp)
    465c:	00840413          	add	s0,s0,8
    4660:	fceb5ee3          	bge	s6,a4,463c <_vfprintf_r+0x2934>
    4664:	00812583          	lw	a1,8(sp)
    4668:	0a010613          	add	a2,sp,160
    466c:	00098513          	mv	a0,s3
    4670:	554000ef          	jal	4bc4 <__sprint_r>
    4674:	00050463          	beqz	a0,467c <_vfprintf_r+0x2974>
    4678:	b61fd06f          	j	21d8 <_vfprintf_r+0x4d0>
    467c:	0a812483          	lw	s1,168(sp)
    4680:	0a412703          	lw	a4,164(sp)
    4684:	0ac10413          	add	s0,sp,172
    4688:	01000693          	li	a3,16
    468c:	fb1ff06f          	j	463c <_vfprintf_r+0x2934>
    4690:	00012823          	sw	zero,16(sp)
    4694:	0ec10c13          	add	s8,sp,236
    4698:	a88ff06f          	j	3920 <_vfprintf_r+0x1c18>
    469c:	00090293          	mv	t0,s2
    46a0:	02012903          	lw	s2,32(sp)
    46a4:	000a0e93          	mv	t4,s4
    46a8:	01a484b3          	add	s1,s1,s10
    46ac:	00170713          	add	a4,a4,1
    46b0:	00542023          	sw	t0,0(s0)
    46b4:	01a42223          	sw	s10,4(s0)
    46b8:	0a912423          	sw	s1,168(sp)
    46bc:	0ae12223          	sw	a4,164(sp)
    46c0:	00700693          	li	a3,7
    46c4:	00e6c463          	blt	a3,a4,46cc <_vfprintf_r+0x29c4>
    46c8:	b65fe06f          	j	322c <_vfprintf_r+0x1524>
    46cc:	00812583          	lw	a1,8(sp)
    46d0:	0a010613          	add	a2,sp,160
    46d4:	00098513          	mv	a0,s3
    46d8:	03d12023          	sw	t4,32(sp)
    46dc:	4e8000ef          	jal	4bc4 <__sprint_r>
    46e0:	00050463          	beqz	a0,46e8 <_vfprintf_r+0x29e0>
    46e4:	af5fd06f          	j	21d8 <_vfprintf_r+0x4d0>
    46e8:	0a812483          	lw	s1,168(sp)
    46ec:	0a412703          	lw	a4,164(sp)
    46f0:	02012e83          	lw	t4,32(sp)
    46f4:	0ac10413          	add	s0,sp,172
    46f8:	b20ff06f          	j	3a18 <_vfprintf_r+0x1d10>
    46fc:	08a10693          	add	a3,sp,138
    4700:	00061863          	bnez	a2,4710 <_vfprintf_r+0x2a08>
    4704:	03000693          	li	a3,48
    4708:	08d10523          	sb	a3,138(sp)
    470c:	08b10693          	add	a3,sp,139
    4710:	15010793          	add	a5,sp,336
    4714:	40f68633          	sub	a2,a3,a5
    4718:	030d0713          	add	a4,s10,48
    471c:	0c960793          	add	a5,a2,201
    4720:	00e68023          	sb	a4,0(a3)
    4724:	04f12023          	sw	a5,64(sp)
    4728:	d5cff06f          	j	3c84 <_vfprintf_r+0x1f7c>
    472c:	001ef713          	and	a4,t4,1
    4730:	d6070863          	beqz	a4,3ca0 <_vfprintf_r+0x1f98>
    4734:	d64ff06f          	j	3c98 <_vfprintf_r+0x1f90>
    4738:	00812783          	lw	a5,8(sp)
    473c:	00000293          	li	t0,0
    4740:	00c79783          	lh	a5,12(a5)
    4744:	0407e793          	or	a5,a5,64
    4748:	00812703          	lw	a4,8(sp)
    474c:	00f71623          	sh	a5,12(a4)
    4750:	a8dfd06f          	j	21dc <_vfprintf_r+0x4d4>
    4754:	00012823          	sw	zero,16(sp)
    4758:	00600313          	li	t1,6
    475c:	ff9fe06f          	j	3754 <_vfprintf_r+0x1a4c>
    4760:	06700e13          	li	t3,103
    4764:	03c12783          	lw	a5,60(sp)
    4768:	0ff00613          	li	a2,255
    476c:	0007c703          	lbu	a4,0(a5)
    4770:	22c70263          	beq	a4,a2,4994 <_vfprintf_r+0x2c8c>
    4774:	00000593          	li	a1,0
    4778:	00000693          	li	a3,0
    477c:	01475e63          	bge	a4,s4,4798 <_vfprintf_r+0x2a90>
    4780:	40ea0a33          	sub	s4,s4,a4
    4784:	0017c703          	lbu	a4,1(a5)
    4788:	04070863          	beqz	a4,47d8 <_vfprintf_r+0x2ad0>
    478c:	00168693          	add	a3,a3,1
    4790:	00178793          	add	a5,a5,1
    4794:	fec714e3          	bne	a4,a2,477c <_vfprintf_r+0x2a74>
    4798:	02f12e23          	sw	a5,60(sp)
    479c:	02d12023          	sw	a3,32(sp)
    47a0:	02b12223          	sw	a1,36(sp)
    47a4:	02012783          	lw	a5,32(sp)
    47a8:	02412703          	lw	a4,36(sp)
    47ac:	04c12583          	lw	a1,76(sp)
    47b0:	05c12823          	sw	t3,80(sp)
    47b4:	00e78533          	add	a0,a5,a4
    47b8:	3a80a0ef          	jal	eb60 <__mulsi3>
    47bc:	01a50d33          	add	s10,a0,s10
    47c0:	fffd4813          	not	a6,s10
    47c4:	41f85813          	sra	a6,a6,0x1f
    47c8:	05012e03          	lw	t3,80(sp)
    47cc:	010d7cb3          	and	s9,s10,a6
    47d0:	000b0e93          	mv	t4,s6
    47d4:	cecff06f          	j	3cc0 <_vfprintf_r+0x1fb8>
    47d8:	0007c703          	lbu	a4,0(a5)
    47dc:	00158593          	add	a1,a1,1
    47e0:	fb5ff06f          	j	4794 <_vfprintf_r+0x2a8c>
    47e4:	03012783          	lw	a5,48(sp)
    47e8:	06600e13          	li	t3,102
    47ec:	00f306b3          	add	a3,t1,a5
    47f0:	01468d33          	add	s10,a3,s4
    47f4:	d99ff06f          	j	458c <_vfprintf_r+0x2884>
    47f8:	02c12783          	lw	a5,44(sp)
    47fc:	0a07c863          	bltz	a5,48ac <_vfprintf_r+0x2ba4>
    4800:	07714603          	lbu	a2,119(sp)
    4804:	04700713          	li	a4,71
    4808:	0000ac17          	auipc	s8,0xa
    480c:	6f4c0c13          	add	s8,s8,1780 # eefc <__fini_array_end+0x1a4>
    4810:	01c75463          	bge	a4,t3,4818 <_vfprintf_r+0x2b10>
    4814:	b31fd06f          	j	2344 <_vfprintf_r+0x63c>
    4818:	0000ac17          	auipc	s8,0xa
    481c:	6e0c0c13          	add	s8,s8,1760 # eef8 <__fini_array_end+0x1a0>
    4820:	b25fd06f          	j	2344 <_vfprintf_r+0x63c>
    4824:	07714603          	lbu	a2,119(sp)
    4828:	01612a23          	sw	s6,20(sp)
    482c:	02012223          	sw	zero,36(sp)
    4830:	02012023          	sw	zero,32(sp)
    4834:	00030c93          	mv	s9,t1
    4838:	00030d13          	mv	s10,t1
    483c:	07300e13          	li	t3,115
    4840:	00000313          	li	t1,0
    4844:	00061463          	bnez	a2,484c <_vfprintf_r+0x2b44>
    4848:	f00fd06f          	j	1f48 <_vfprintf_r+0x240>
    484c:	b1dfd06f          	j	2368 <_vfprintf_r+0x660>
    4850:	00040313          	mv	t1,s0
    4854:	01012903          	lw	s2,16(sp)
    4858:	000b0413          	mv	s0,s6
    485c:	01412e03          	lw	t3,20(sp)
    4860:	000c0b13          	mv	s6,s8
    4864:	000a0e93          	mv	t4,s4
    4868:	000c8c13          	mv	s8,s9
    486c:	00030d13          	mv	s10,t1
    4870:	87cff06f          	j	38ec <_vfprintf_r+0x1be4>
    4874:	001b0793          	add	a5,s6,1
    4878:	000c0993          	mv	s3,s8
    487c:	02412903          	lw	s2,36(sp)
    4880:	04012e83          	lw	t4,64(sp)
    4884:	05012e03          	lw	t3,80(sp)
    4888:	05412403          	lw	s0,84(sp)
    488c:	000d0c13          	mv	s8,s10
    4890:	00f487b3          	add	a5,s1,a5
    4894:	03000693          	li	a3,48
    4898:	840b40e3          	bltz	s6,40d8 <_vfprintf_r+0x23d0>
    489c:	00148493          	add	s1,s1,1
    48a0:	fed48fa3          	sb	a3,-1(s1)
    48a4:	fe979ce3          	bne	a5,s1,489c <_vfprintf_r+0x2b94>
    48a8:	835ff06f          	j	40dc <_vfprintf_r+0x23d4>
    48ac:	02d00793          	li	a5,45
    48b0:	06f10ba3          	sb	a5,119(sp)
    48b4:	02d00613          	li	a2,45
    48b8:	f4dff06f          	j	4804 <_vfprintf_r+0x2afc>
    48bc:	00100693          	li	a3,1
    48c0:	414686b3          	sub	a3,a3,s4
    48c4:	06d12e23          	sw	a3,124(sp)
    48c8:	da4ff06f          	j	3e6c <_vfprintf_r+0x2164>
    48cc:	01412783          	lw	a5,20(sp)
    48d0:	0007ab03          	lw	s6,0(a5)
    48d4:	00478793          	add	a5,a5,4
    48d8:	000b5463          	bgez	s6,48e0 <_vfprintf_r+0x2bd8>
    48dc:	fff00b13          	li	s6,-1
    48e0:	00194e03          	lbu	t3,1(s2)
    48e4:	00f12a23          	sw	a5,20(sp)
    48e8:	00068913          	mv	s2,a3
    48ec:	dccfd06f          	j	1eb8 <_vfprintf_r+0x1b0>
    48f0:	00071a63          	bnez	a4,4904 <_vfprintf_r+0x2bfc>
    48f4:	00100c93          	li	s9,1
    48f8:	06600e13          	li	t3,102
    48fc:	00100d13          	li	s10,1
    4900:	879ff06f          	j	4178 <_vfprintf_r+0x2470>
    4904:	03012783          	lw	a5,48(sp)
    4908:	06600e13          	li	t3,102
    490c:	00178693          	add	a3,a5,1
    4910:	00668d33          	add	s10,a3,t1
    4914:	fffd4813          	not	a6,s10
    4918:	41f85813          	sra	a6,a6,0x1f
    491c:	010d7cb3          	and	s9,s10,a6
    4920:	859ff06f          	j	4178 <_vfprintf_r+0x2470>
    4924:	00200793          	li	a5,2
    4928:	04f12023          	sw	a5,64(sp)
    492c:	b58ff06f          	j	3c84 <_vfprintf_r+0x1f7c>
    4930:	00812703          	lw	a4,8(sp)
    4934:	00c71783          	lh	a5,12(a4)
    4938:	0407e793          	or	a5,a5,64
    493c:	00f71623          	sh	a5,12(a4)
    4940:	8b5fd06f          	j	21f4 <_vfprintf_r+0x4ec>
    4944:	000a0513          	mv	a0,s4
    4948:	000d0593          	mv	a1,s10
    494c:	00030613          	mv	a2,t1
    4950:	00038693          	mv	a3,t2
    4954:	05012023          	sw	a6,64(sp)
    4958:	03c12223          	sw	t3,36(sp)
    495c:	01d12c23          	sw	t4,24(sp)
    4960:	0a5080ef          	jal	d204 <__eqdf2>
    4964:	01812e83          	lw	t4,24(sp)
    4968:	02412e03          	lw	t3,36(sp)
    496c:	04012803          	lw	a6,64(sp)
    4970:	f6051463          	bnez	a0,40d8 <_vfprintf_r+0x23d0>
    4974:	001b7693          	and	a3,s6,1
    4978:	f6068063          	beqz	a3,40d8 <_vfprintf_r+0x23d0>
    497c:	f14ff06f          	j	4090 <_vfprintf_r+0x2388>
    4980:	00812783          	lw	a5,8(sp)
    4984:	01012283          	lw	t0,16(sp)
    4988:	00c79783          	lh	a5,12(a5)
    498c:	0407e793          	or	a5,a5,64
    4990:	db9ff06f          	j	4748 <_vfprintf_r+0x2a40>
    4994:	02012223          	sw	zero,36(sp)
    4998:	02012023          	sw	zero,32(sp)
    499c:	e09ff06f          	j	47a4 <_vfprintf_r+0x2a9c>
    49a0:	04500d13          	li	s10,69
    49a4:	cccff06f          	j	3e70 <_vfprintf_r+0x2168>

000049a8 <__sbprintf>:
    49a8:	b7010113          	add	sp,sp,-1168
    49ac:	00c59783          	lh	a5,12(a1)
    49b0:	00e5d703          	lhu	a4,14(a1)
    49b4:	48812423          	sw	s0,1160(sp)
    49b8:	00058413          	mv	s0,a1
    49bc:	000105b7          	lui	a1,0x10
    49c0:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x82d>
    49c4:	06442303          	lw	t1,100(s0)
    49c8:	01c42883          	lw	a7,28(s0)
    49cc:	02442803          	lw	a6,36(s0)
    49d0:	01071713          	sll	a4,a4,0x10
    49d4:	00b7f7b3          	and	a5,a5,a1
    49d8:	00e7e7b3          	or	a5,a5,a4
    49dc:	40000593          	li	a1,1024
    49e0:	49212023          	sw	s2,1152(sp)
    49e4:	00f12a23          	sw	a5,20(sp)
    49e8:	00050913          	mv	s2,a0
    49ec:	07010793          	add	a5,sp,112
    49f0:	06010513          	add	a0,sp,96
    49f4:	48112623          	sw	ra,1164(sp)
    49f8:	48912223          	sw	s1,1156(sp)
    49fc:	47312e23          	sw	s3,1148(sp)
    4a00:	00060493          	mv	s1,a2
    4a04:	00068993          	mv	s3,a3
    4a08:	06612623          	sw	t1,108(sp)
    4a0c:	03112223          	sw	a7,36(sp)
    4a10:	03012623          	sw	a6,44(sp)
    4a14:	00f12423          	sw	a5,8(sp)
    4a18:	00f12c23          	sw	a5,24(sp)
    4a1c:	00b12823          	sw	a1,16(sp)
    4a20:	00b12e23          	sw	a1,28(sp)
    4a24:	02012023          	sw	zero,32(sp)
    4a28:	b7cfc0ef          	jal	da4 <__retarget_lock_init_recursive>
    4a2c:	00048613          	mv	a2,s1
    4a30:	00098693          	mv	a3,s3
    4a34:	00810593          	add	a1,sp,8
    4a38:	00090513          	mv	a0,s2
    4a3c:	accfd0ef          	jal	1d08 <_vfprintf_r>
    4a40:	00050493          	mv	s1,a0
    4a44:	04055263          	bgez	a0,4a88 <__sbprintf+0xe0>
    4a48:	01415783          	lhu	a5,20(sp)
    4a4c:	0407f793          	and	a5,a5,64
    4a50:	00078863          	beqz	a5,4a60 <__sbprintf+0xb8>
    4a54:	00c45783          	lhu	a5,12(s0)
    4a58:	0407e793          	or	a5,a5,64
    4a5c:	00f41623          	sh	a5,12(s0)
    4a60:	06012503          	lw	a0,96(sp)
    4a64:	b44fc0ef          	jal	da8 <__retarget_lock_close_recursive>
    4a68:	48c12083          	lw	ra,1164(sp)
    4a6c:	48812403          	lw	s0,1160(sp)
    4a70:	48012903          	lw	s2,1152(sp)
    4a74:	47c12983          	lw	s3,1148(sp)
    4a78:	00048513          	mv	a0,s1
    4a7c:	48412483          	lw	s1,1156(sp)
    4a80:	49010113          	add	sp,sp,1168
    4a84:	00008067          	ret
    4a88:	00810593          	add	a1,sp,8
    4a8c:	00090513          	mv	a0,s2
    4a90:	449010ef          	jal	66d8 <_fflush_r>
    4a94:	fa050ae3          	beqz	a0,4a48 <__sbprintf+0xa0>
    4a98:	fff00493          	li	s1,-1
    4a9c:	fadff06f          	j	4a48 <__sbprintf+0xa0>

00004aa0 <__sprint_r.part.0>:
    4aa0:	0645a783          	lw	a5,100(a1)
    4aa4:	fd010113          	add	sp,sp,-48
    4aa8:	01612823          	sw	s6,16(sp)
    4aac:	02112623          	sw	ra,44(sp)
    4ab0:	01279713          	sll	a4,a5,0x12
    4ab4:	00060b13          	mv	s6,a2
    4ab8:	0e075863          	bgez	a4,4ba8 <__sprint_r.part.0+0x108>
    4abc:	00862783          	lw	a5,8(a2)
    4ac0:	03212023          	sw	s2,32(sp)
    4ac4:	01312e23          	sw	s3,28(sp)
    4ac8:	01512a23          	sw	s5,20(sp)
    4acc:	01712623          	sw	s7,12(sp)
    4ad0:	00058913          	mv	s2,a1
    4ad4:	00062b83          	lw	s7,0(a2)
    4ad8:	00050993          	mv	s3,a0
    4adc:	fff00a93          	li	s5,-1
    4ae0:	0a078863          	beqz	a5,4b90 <__sprint_r.part.0+0xf0>
    4ae4:	02812423          	sw	s0,40(sp)
    4ae8:	02912223          	sw	s1,36(sp)
    4aec:	01412c23          	sw	s4,24(sp)
    4af0:	01812423          	sw	s8,8(sp)
    4af4:	004bac03          	lw	s8,4(s7)
    4af8:	000ba403          	lw	s0,0(s7)
    4afc:	002c5a13          	srl	s4,s8,0x2
    4b00:	060a0663          	beqz	s4,4b6c <__sprint_r.part.0+0xcc>
    4b04:	00000493          	li	s1,0
    4b08:	00c0006f          	j	4b14 <__sprint_r.part.0+0x74>
    4b0c:	00440413          	add	s0,s0,4
    4b10:	049a0c63          	beq	s4,s1,4b68 <__sprint_r.part.0+0xc8>
    4b14:	00042583          	lw	a1,0(s0)
    4b18:	00090613          	mv	a2,s2
    4b1c:	00098513          	mv	a0,s3
    4b20:	399020ef          	jal	76b8 <_fputwc_r>
    4b24:	00148493          	add	s1,s1,1
    4b28:	ff5512e3          	bne	a0,s5,4b0c <__sprint_r.part.0+0x6c>
    4b2c:	02812403          	lw	s0,40(sp)
    4b30:	02412483          	lw	s1,36(sp)
    4b34:	02012903          	lw	s2,32(sp)
    4b38:	01c12983          	lw	s3,28(sp)
    4b3c:	01812a03          	lw	s4,24(sp)
    4b40:	01412a83          	lw	s5,20(sp)
    4b44:	00c12b83          	lw	s7,12(sp)
    4b48:	00812c03          	lw	s8,8(sp)
    4b4c:	fff00513          	li	a0,-1
    4b50:	02c12083          	lw	ra,44(sp)
    4b54:	000b2423          	sw	zero,8(s6)
    4b58:	000b2223          	sw	zero,4(s6)
    4b5c:	01012b03          	lw	s6,16(sp)
    4b60:	03010113          	add	sp,sp,48
    4b64:	00008067          	ret
    4b68:	008b2783          	lw	a5,8(s6)
    4b6c:	ffcc7c13          	and	s8,s8,-4
    4b70:	418787b3          	sub	a5,a5,s8
    4b74:	00fb2423          	sw	a5,8(s6)
    4b78:	008b8b93          	add	s7,s7,8
    4b7c:	f6079ce3          	bnez	a5,4af4 <__sprint_r.part.0+0x54>
    4b80:	02812403          	lw	s0,40(sp)
    4b84:	02412483          	lw	s1,36(sp)
    4b88:	01812a03          	lw	s4,24(sp)
    4b8c:	00812c03          	lw	s8,8(sp)
    4b90:	02012903          	lw	s2,32(sp)
    4b94:	01c12983          	lw	s3,28(sp)
    4b98:	01412a83          	lw	s5,20(sp)
    4b9c:	00c12b83          	lw	s7,12(sp)
    4ba0:	00000513          	li	a0,0
    4ba4:	fadff06f          	j	4b50 <__sprint_r.part.0+0xb0>
    4ba8:	6b5010ef          	jal	6a5c <__sfvwrite_r>
    4bac:	02c12083          	lw	ra,44(sp)
    4bb0:	000b2423          	sw	zero,8(s6)
    4bb4:	000b2223          	sw	zero,4(s6)
    4bb8:	01012b03          	lw	s6,16(sp)
    4bbc:	03010113          	add	sp,sp,48
    4bc0:	00008067          	ret

00004bc4 <__sprint_r>:
    4bc4:	00862703          	lw	a4,8(a2)
    4bc8:	00070463          	beqz	a4,4bd0 <__sprint_r+0xc>
    4bcc:	ed5ff06f          	j	4aa0 <__sprint_r.part.0>
    4bd0:	00062223          	sw	zero,4(a2)
    4bd4:	00000513          	li	a0,0
    4bd8:	00008067          	ret

00004bdc <_vfiprintf_r>:
    4bdc:	eb010113          	add	sp,sp,-336
    4be0:	14812423          	sw	s0,328(sp)
    4be4:	13312e23          	sw	s3,316(sp)
    4be8:	13812423          	sw	s8,296(sp)
    4bec:	00050413          	mv	s0,a0
    4bf0:	00058993          	mv	s3,a1
    4bf4:	00060c13          	mv	s8,a2
    4bf8:	00000593          	li	a1,0
    4bfc:	00800613          	li	a2,8
    4c00:	05010513          	add	a0,sp,80
    4c04:	13512a23          	sw	s5,308(sp)
    4c08:	14112623          	sw	ra,332(sp)
    4c0c:	00068a93          	mv	s5,a3
    4c10:	9a4fc0ef          	jal	db4 <memset>
    4c14:	00040863          	beqz	s0,4c24 <_vfiprintf_r+0x48>
    4c18:	03442783          	lw	a5,52(s0)
    4c1c:	00079463          	bnez	a5,4c24 <_vfiprintf_r+0x48>
    4c20:	49c0106f          	j	60bc <_vfiprintf_r+0x14e0>
    4c24:	0649a703          	lw	a4,100(s3)
    4c28:	00c99783          	lh	a5,12(s3)
    4c2c:	00177713          	and	a4,a4,1
    4c30:	00071863          	bnez	a4,4c40 <_vfiprintf_r+0x64>
    4c34:	2007f713          	and	a4,a5,512
    4c38:	00071463          	bnez	a4,4c40 <_vfiprintf_r+0x64>
    4c3c:	0b80106f          	j	5cf4 <_vfiprintf_r+0x1118>
    4c40:	01279713          	sll	a4,a5,0x12
    4c44:	02074663          	bltz	a4,4c70 <_vfiprintf_r+0x94>
    4c48:	0649a703          	lw	a4,100(s3)
    4c4c:	00002637          	lui	a2,0x2
    4c50:	ffffe6b7          	lui	a3,0xffffe
    4c54:	00c7e7b3          	or	a5,a5,a2
    4c58:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4c5c:	01079793          	sll	a5,a5,0x10
    4c60:	4107d793          	sra	a5,a5,0x10
    4c64:	00d77733          	and	a4,a4,a3
    4c68:	00f99623          	sh	a5,12(s3)
    4c6c:	06e9a223          	sw	a4,100(s3)
    4c70:	0087f713          	and	a4,a5,8
    4c74:	2e070463          	beqz	a4,4f5c <_vfiprintf_r+0x380>
    4c78:	0109a703          	lw	a4,16(s3)
    4c7c:	2e070063          	beqz	a4,4f5c <_vfiprintf_r+0x380>
    4c80:	01a7f713          	and	a4,a5,26
    4c84:	00a00693          	li	a3,10
    4c88:	2ed70c63          	beq	a4,a3,4f80 <_vfiprintf_r+0x3a4>
    4c8c:	13412c23          	sw	s4,312(sp)
    4c90:	06c10a13          	add	s4,sp,108
    4c94:	14912223          	sw	s1,324(sp)
    4c98:	15212023          	sw	s2,320(sp)
    4c9c:	13612823          	sw	s6,304(sp)
    4ca0:	13712623          	sw	s7,300(sp)
    4ca4:	13912223          	sw	s9,292(sp)
    4ca8:	13a12023          	sw	s10,288(sp)
    4cac:	000c0c93          	mv	s9,s8
    4cb0:	11b12e23          	sw	s11,284(sp)
    4cb4:	07412023          	sw	s4,96(sp)
    4cb8:	06012423          	sw	zero,104(sp)
    4cbc:	06012223          	sw	zero,100(sp)
    4cc0:	00012a23          	sw	zero,20(sp)
    4cc4:	02012623          	sw	zero,44(sp)
    4cc8:	02012823          	sw	zero,48(sp)
    4ccc:	02012a23          	sw	zero,52(sp)
    4cd0:	00012623          	sw	zero,12(sp)
    4cd4:	7fffc497          	auipc	s1,0x7fffc
    4cd8:	86048493          	add	s1,s1,-1952 # 80000534 <__global_locale>
    4cdc:	02500913          	li	s2,37
    4ce0:	0000ab97          	auipc	s7,0xa
    4ce4:	728b8b93          	add	s7,s7,1832 # f408 <blanks.1+0x10>
    4ce8:	0000bb17          	auipc	s6,0xb
    4cec:	88cb0b13          	add	s6,s6,-1908 # f574 <zeroes.0>
    4cf0:	000a0c13          	mv	s8,s4
    4cf4:	000c8d93          	mv	s11,s9
    4cf8:	0e44ad03          	lw	s10,228(s1)
    4cfc:	3f9020ef          	jal	78f4 <__locale_mb_cur_max>
    4d00:	00050693          	mv	a3,a0
    4d04:	05010713          	add	a4,sp,80
    4d08:	000d8613          	mv	a2,s11
    4d0c:	04810593          	add	a1,sp,72
    4d10:	00040513          	mv	a0,s0
    4d14:	000d00e7          	jalr	s10
    4d18:	2e050e63          	beqz	a0,5014 <_vfiprintf_r+0x438>
    4d1c:	2c054e63          	bltz	a0,4ff8 <_vfiprintf_r+0x41c>
    4d20:	04812783          	lw	a5,72(sp)
    4d24:	01278663          	beq	a5,s2,4d30 <_vfiprintf_r+0x154>
    4d28:	00ad8db3          	add	s11,s11,a0
    4d2c:	fcdff06f          	j	4cf8 <_vfiprintf_r+0x11c>
    4d30:	00050d13          	mv	s10,a0
    4d34:	419d87b3          	sub	a5,s11,s9
    4d38:	2f9d9463          	bne	s11,s9,5020 <_vfiprintf_r+0x444>
    4d3c:	00000e13          	li	t3,0
    4d40:	001dc683          	lbu	a3,1(s11)
    4d44:	001d8c93          	add	s9,s11,1
    4d48:	040101a3          	sb	zero,67(sp)
    4d4c:	fff00713          	li	a4,-1
    4d50:	00000893          	li	a7,0
    4d54:	05a00d13          	li	s10,90
    4d58:	000e0d93          	mv	s11,t3
    4d5c:	001c8c93          	add	s9,s9,1
    4d60:	fe068793          	add	a5,a3,-32
    4d64:	04fd6663          	bltu	s10,a5,4db0 <_vfiprintf_r+0x1d4>
    4d68:	00279793          	sll	a5,a5,0x2
    4d6c:	017787b3          	add	a5,a5,s7
    4d70:	0007a783          	lw	a5,0(a5)
    4d74:	017787b3          	add	a5,a5,s7
    4d78:	00078067          	jr	a5
    4d7c:	00000893          	li	a7,0
    4d80:	fd068793          	add	a5,a3,-48
    4d84:	00900593          	li	a1,9
    4d88:	000cc683          	lbu	a3,0(s9)
    4d8c:	00289613          	sll	a2,a7,0x2
    4d90:	011608b3          	add	a7,a2,a7
    4d94:	00189893          	sll	a7,a7,0x1
    4d98:	011788b3          	add	a7,a5,a7
    4d9c:	fd068793          	add	a5,a3,-48
    4da0:	001c8c93          	add	s9,s9,1
    4da4:	fef5f2e3          	bgeu	a1,a5,4d88 <_vfiprintf_r+0x1ac>
    4da8:	fe068793          	add	a5,a3,-32
    4dac:	fafd7ee3          	bgeu	s10,a5,4d68 <_vfiprintf_r+0x18c>
    4db0:	000d8e13          	mv	t3,s11
    4db4:	2c068663          	beqz	a3,5080 <_vfiprintf_r+0x4a4>
    4db8:	0ad10623          	sb	a3,172(sp)
    4dbc:	040101a3          	sb	zero,67(sp)
    4dc0:	00100e93          	li	t4,1
    4dc4:	00100d13          	li	s10,1
    4dc8:	0ac10813          	add	a6,sp,172
    4dcc:	00012823          	sw	zero,16(sp)
    4dd0:	00000713          	li	a4,0
    4dd4:	00000f93          	li	t6,0
    4dd8:	06412603          	lw	a2,100(sp)
    4ddc:	084e7293          	and	t0,t3,132
    4de0:	06812783          	lw	a5,104(sp)
    4de4:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x2f9>
    4de8:	00058f13          	mv	t5,a1
    4dec:	00029663          	bnez	t0,4df8 <_vfiprintf_r+0x21c>
    4df0:	41d88db3          	sub	s11,a7,t4
    4df4:	47b046e3          	bgtz	s11,5a60 <_vfiprintf_r+0xe84>
    4df8:	04314583          	lbu	a1,67(sp)
    4dfc:	02058a63          	beqz	a1,4e30 <_vfiprintf_r+0x254>
    4e00:	04310613          	add	a2,sp,67
    4e04:	00178793          	add	a5,a5,1
    4e08:	00100693          	li	a3,1
    4e0c:	00cc2023          	sw	a2,0(s8)
    4e10:	00dc2223          	sw	a3,4(s8)
    4e14:	06f12423          	sw	a5,104(sp)
    4e18:	07e12223          	sw	t5,100(sp)
    4e1c:	00700613          	li	a2,7
    4e20:	35e64ce3          	blt	a2,t5,5978 <_vfiprintf_r+0xd9c>
    4e24:	000f0613          	mv	a2,t5
    4e28:	008c0c13          	add	s8,s8,8
    4e2c:	001f0f13          	add	t5,t5,1
    4e30:	080f8063          	beqz	t6,4eb0 <_vfiprintf_r+0x2d4>
    4e34:	00200613          	li	a2,2
    4e38:	00278793          	add	a5,a5,2
    4e3c:	04410693          	add	a3,sp,68
    4e40:	00cc2223          	sw	a2,4(s8)
    4e44:	00dc2023          	sw	a3,0(s8)
    4e48:	06f12423          	sw	a5,104(sp)
    4e4c:	07e12223          	sw	t5,100(sp)
    4e50:	00700613          	li	a2,7
    4e54:	3be652e3          	bge	a2,t5,59f8 <_vfiprintf_r+0xe1c>
    4e58:	60078ae3          	beqz	a5,5c6c <_vfiprintf_r+0x1090>
    4e5c:	06010613          	add	a2,sp,96
    4e60:	00098593          	mv	a1,s3
    4e64:	00040513          	mv	a0,s0
    4e68:	03d12c23          	sw	t4,56(sp)
    4e6c:	02e12423          	sw	a4,40(sp)
    4e70:	03112223          	sw	a7,36(sp)
    4e74:	03012023          	sw	a6,32(sp)
    4e78:	00512e23          	sw	t0,28(sp)
    4e7c:	01c12c23          	sw	t3,24(sp)
    4e80:	c21ff0ef          	jal	4aa0 <__sprint_r.part.0>
    4e84:	22051463          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    4e88:	06412603          	lw	a2,100(sp)
    4e8c:	06812783          	lw	a5,104(sp)
    4e90:	03812e83          	lw	t4,56(sp)
    4e94:	02812703          	lw	a4,40(sp)
    4e98:	02412883          	lw	a7,36(sp)
    4e9c:	02012803          	lw	a6,32(sp)
    4ea0:	01c12283          	lw	t0,28(sp)
    4ea4:	01812e03          	lw	t3,24(sp)
    4ea8:	000a0c13          	mv	s8,s4
    4eac:	00160f13          	add	t5,a2,1
    4eb0:	08000593          	li	a1,128
    4eb4:	06b286e3          	beq	t0,a1,5720 <_vfiprintf_r+0xb44>
    4eb8:	41a70733          	sub	a4,a4,s10
    4ebc:	1ae04ae3          	bgtz	a4,5870 <_vfiprintf_r+0xc94>
    4ec0:	00fd07b3          	add	a5,s10,a5
    4ec4:	010c2023          	sw	a6,0(s8)
    4ec8:	01ac2223          	sw	s10,4(s8)
    4ecc:	06f12423          	sw	a5,104(sp)
    4ed0:	07e12223          	sw	t5,100(sp)
    4ed4:	00700713          	li	a4,7
    4ed8:	03e758e3          	bge	a4,t5,5708 <_vfiprintf_r+0xb2c>
    4edc:	24078063          	beqz	a5,511c <_vfiprintf_r+0x540>
    4ee0:	06010613          	add	a2,sp,96
    4ee4:	00098593          	mv	a1,s3
    4ee8:	00040513          	mv	a0,s0
    4eec:	03d12023          	sw	t4,32(sp)
    4ef0:	01112e23          	sw	a7,28(sp)
    4ef4:	01c12c23          	sw	t3,24(sp)
    4ef8:	ba9ff0ef          	jal	4aa0 <__sprint_r.part.0>
    4efc:	1a051863          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    4f00:	06812783          	lw	a5,104(sp)
    4f04:	02012e83          	lw	t4,32(sp)
    4f08:	01c12883          	lw	a7,28(sp)
    4f0c:	01812e03          	lw	t3,24(sp)
    4f10:	000a0c13          	mv	s8,s4
    4f14:	004e7e13          	and	t3,t3,4
    4f18:	000e0663          	beqz	t3,4f24 <_vfiprintf_r+0x348>
    4f1c:	41d88db3          	sub	s11,a7,t4
    4f20:	21b04a63          	bgtz	s11,5134 <_vfiprintf_r+0x558>
    4f24:	01d8d463          	bge	a7,t4,4f2c <_vfiprintf_r+0x350>
    4f28:	000e8893          	mv	a7,t4
    4f2c:	00c12703          	lw	a4,12(sp)
    4f30:	01170733          	add	a4,a4,a7
    4f34:	00e12623          	sw	a4,12(sp)
    4f38:	16079063          	bnez	a5,5098 <_vfiprintf_r+0x4bc>
    4f3c:	01012783          	lw	a5,16(sp)
    4f40:	06012223          	sw	zero,100(sp)
    4f44:	00078863          	beqz	a5,4f54 <_vfiprintf_r+0x378>
    4f48:	00078593          	mv	a1,a5
    4f4c:	00040513          	mv	a0,s0
    4f50:	ab4fc0ef          	jal	1204 <_free_r>
    4f54:	000a0c13          	mv	s8,s4
    4f58:	d9dff06f          	j	4cf4 <_vfiprintf_r+0x118>
    4f5c:	00098593          	mv	a1,s3
    4f60:	00040513          	mv	a0,s0
    4f64:	4b0020ef          	jal	7414 <__swsetup_r>
    4f68:	00050463          	beqz	a0,4f70 <_vfiprintf_r+0x394>
    4f6c:	3840106f          	j	62f0 <_vfiprintf_r+0x1714>
    4f70:	00c99783          	lh	a5,12(s3)
    4f74:	00a00693          	li	a3,10
    4f78:	01a7f713          	and	a4,a5,26
    4f7c:	d0d718e3          	bne	a4,a3,4c8c <_vfiprintf_r+0xb0>
    4f80:	00e99703          	lh	a4,14(s3)
    4f84:	d00744e3          	bltz	a4,4c8c <_vfiprintf_r+0xb0>
    4f88:	0649a703          	lw	a4,100(s3)
    4f8c:	00177713          	and	a4,a4,1
    4f90:	00071863          	bnez	a4,4fa0 <_vfiprintf_r+0x3c4>
    4f94:	2007f793          	and	a5,a5,512
    4f98:	00079463          	bnez	a5,4fa0 <_vfiprintf_r+0x3c4>
    4f9c:	2ac0106f          	j	6248 <_vfiprintf_r+0x166c>
    4fa0:	000a8693          	mv	a3,s5
    4fa4:	000c0613          	mv	a2,s8
    4fa8:	00098593          	mv	a1,s3
    4fac:	00040513          	mv	a0,s0
    4fb0:	3e4010ef          	jal	6394 <__sbprintf>
    4fb4:	14c12083          	lw	ra,332(sp)
    4fb8:	14812403          	lw	s0,328(sp)
    4fbc:	00a12623          	sw	a0,12(sp)
    4fc0:	00c12503          	lw	a0,12(sp)
    4fc4:	13c12983          	lw	s3,316(sp)
    4fc8:	13412a83          	lw	s5,308(sp)
    4fcc:	12812c03          	lw	s8,296(sp)
    4fd0:	15010113          	add	sp,sp,336
    4fd4:	00008067          	ret
    4fd8:	000aa883          	lw	a7,0(s5)
    4fdc:	004a8a93          	add	s5,s5,4
    4fe0:	3608cc63          	bltz	a7,5358 <_vfiprintf_r+0x77c>
    4fe4:	000cc683          	lbu	a3,0(s9)
    4fe8:	d75ff06f          	j	4d5c <_vfiprintf_r+0x180>
    4fec:	000cc683          	lbu	a3,0(s9)
    4ff0:	020ded93          	or	s11,s11,32
    4ff4:	d69ff06f          	j	4d5c <_vfiprintf_r+0x180>
    4ff8:	00800613          	li	a2,8
    4ffc:	00000593          	li	a1,0
    5000:	05010513          	add	a0,sp,80
    5004:	db1fb0ef          	jal	db4 <memset>
    5008:	00100513          	li	a0,1
    500c:	00ad8db3          	add	s11,s11,a0
    5010:	ce9ff06f          	j	4cf8 <_vfiprintf_r+0x11c>
    5014:	00050d13          	mv	s10,a0
    5018:	419d87b3          	sub	a5,s11,s9
    501c:	079d8263          	beq	s11,s9,5080 <_vfiprintf_r+0x4a4>
    5020:	06812683          	lw	a3,104(sp)
    5024:	06412703          	lw	a4,100(sp)
    5028:	019c2023          	sw	s9,0(s8)
    502c:	00d786b3          	add	a3,a5,a3
    5030:	00170713          	add	a4,a4,1
    5034:	00fc2223          	sw	a5,4(s8)
    5038:	06d12423          	sw	a3,104(sp)
    503c:	06e12223          	sw	a4,100(sp)
    5040:	00700613          	li	a2,7
    5044:	008c0c13          	add	s8,s8,8
    5048:	02e65463          	bge	a2,a4,5070 <_vfiprintf_r+0x494>
    504c:	38068ce3          	beqz	a3,5be4 <_vfiprintf_r+0x1008>
    5050:	06010613          	add	a2,sp,96
    5054:	00098593          	mv	a1,s3
    5058:	00040513          	mv	a0,s0
    505c:	00f12823          	sw	a5,16(sp)
    5060:	a41ff0ef          	jal	4aa0 <__sprint_r.part.0>
    5064:	01012783          	lw	a5,16(sp)
    5068:	04051c63          	bnez	a0,50c0 <_vfiprintf_r+0x4e4>
    506c:	000a0c13          	mv	s8,s4
    5070:	00c12703          	lw	a4,12(sp)
    5074:	00f707b3          	add	a5,a4,a5
    5078:	00f12623          	sw	a5,12(sp)
    507c:	cc0d10e3          	bnez	s10,4d3c <_vfiprintf_r+0x160>
    5080:	06812783          	lw	a5,104(sp)
    5084:	00078463          	beqz	a5,508c <_vfiprintf_r+0x4b0>
    5088:	22c0106f          	j	62b4 <_vfiprintf_r+0x16d8>
    508c:	00c99783          	lh	a5,12(s3)
    5090:	06012223          	sw	zero,100(sp)
    5094:	0300006f          	j	50c4 <_vfiprintf_r+0x4e8>
    5098:	06010613          	add	a2,sp,96
    509c:	00098593          	mv	a1,s3
    50a0:	00040513          	mv	a0,s0
    50a4:	9fdff0ef          	jal	4aa0 <__sprint_r.part.0>
    50a8:	e8050ae3          	beqz	a0,4f3c <_vfiprintf_r+0x360>
    50ac:	01012783          	lw	a5,16(sp)
    50b0:	00078863          	beqz	a5,50c0 <_vfiprintf_r+0x4e4>
    50b4:	01012583          	lw	a1,16(sp)
    50b8:	00040513          	mv	a0,s0
    50bc:	948fc0ef          	jal	1204 <_free_r>
    50c0:	00c99783          	lh	a5,12(s3)
    50c4:	0649a703          	lw	a4,100(s3)
    50c8:	00177713          	and	a4,a4,1
    50cc:	16070a63          	beqz	a4,5240 <_vfiprintf_r+0x664>
    50d0:	0407f793          	and	a5,a5,64
    50d4:	14412483          	lw	s1,324(sp)
    50d8:	14012903          	lw	s2,320(sp)
    50dc:	13812a03          	lw	s4,312(sp)
    50e0:	13012b03          	lw	s6,304(sp)
    50e4:	12c12b83          	lw	s7,300(sp)
    50e8:	12412c83          	lw	s9,292(sp)
    50ec:	12012d03          	lw	s10,288(sp)
    50f0:	11c12d83          	lw	s11,284(sp)
    50f4:	00078463          	beqz	a5,50fc <_vfiprintf_r+0x520>
    50f8:	2180106f          	j	6310 <_vfiprintf_r+0x1734>
    50fc:	14c12083          	lw	ra,332(sp)
    5100:	14812403          	lw	s0,328(sp)
    5104:	00c12503          	lw	a0,12(sp)
    5108:	13c12983          	lw	s3,316(sp)
    510c:	13412a83          	lw	s5,308(sp)
    5110:	12812c03          	lw	s8,296(sp)
    5114:	15010113          	add	sp,sp,336
    5118:	00008067          	ret
    511c:	06012223          	sw	zero,100(sp)
    5120:	004e7e13          	and	t3,t3,4
    5124:	240e0ee3          	beqz	t3,5b80 <_vfiprintf_r+0xfa4>
    5128:	41d88db3          	sub	s11,a7,t4
    512c:	25b05ae3          	blez	s11,5b80 <_vfiprintf_r+0xfa4>
    5130:	000a0c13          	mv	s8,s4
    5134:	01000713          	li	a4,16
    5138:	06412683          	lw	a3,100(sp)
    513c:	01b74463          	blt	a4,s11,5144 <_vfiprintf_r+0x568>
    5140:	1900106f          	j	62d0 <_vfiprintf_r+0x16f4>
    5144:	000a8713          	mv	a4,s5
    5148:	0000a317          	auipc	t1,0xa
    514c:	43c30313          	add	t1,t1,1084 # f584 <blanks.1>
    5150:	000c0593          	mv	a1,s8
    5154:	000d8a93          	mv	s5,s11
    5158:	01000813          	li	a6,16
    515c:	00700d13          	li	s10,7
    5160:	01112c23          	sw	a7,24(sp)
    5164:	01d12e23          	sw	t4,28(sp)
    5168:	00030c13          	mv	s8,t1
    516c:	00070d93          	mv	s11,a4
    5170:	0180006f          	j	5188 <_vfiprintf_r+0x5ac>
    5174:	00268613          	add	a2,a3,2
    5178:	00858593          	add	a1,a1,8
    517c:	00070693          	mv	a3,a4
    5180:	ff0a8a93          	add	s5,s5,-16
    5184:	05585a63          	bge	a6,s5,51d8 <_vfiprintf_r+0x5fc>
    5188:	01078793          	add	a5,a5,16
    518c:	00168713          	add	a4,a3,1
    5190:	0185a023          	sw	s8,0(a1)
    5194:	0105a223          	sw	a6,4(a1)
    5198:	06f12423          	sw	a5,104(sp)
    519c:	06e12223          	sw	a4,100(sp)
    51a0:	fced5ae3          	bge	s10,a4,5174 <_vfiprintf_r+0x598>
    51a4:	56078663          	beqz	a5,5710 <_vfiprintf_r+0xb34>
    51a8:	06010613          	add	a2,sp,96
    51ac:	00098593          	mv	a1,s3
    51b0:	00040513          	mv	a0,s0
    51b4:	8edff0ef          	jal	4aa0 <__sprint_r.part.0>
    51b8:	ee051ae3          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    51bc:	06412683          	lw	a3,100(sp)
    51c0:	01000813          	li	a6,16
    51c4:	ff0a8a93          	add	s5,s5,-16
    51c8:	06812783          	lw	a5,104(sp)
    51cc:	000a0593          	mv	a1,s4
    51d0:	00168613          	add	a2,a3,1
    51d4:	fb584ae3          	blt	a6,s5,5188 <_vfiprintf_r+0x5ac>
    51d8:	01812883          	lw	a7,24(sp)
    51dc:	01c12e83          	lw	t4,28(sp)
    51e0:	000d8713          	mv	a4,s11
    51e4:	000c0313          	mv	t1,s8
    51e8:	000a8d93          	mv	s11,s5
    51ec:	00058c13          	mv	s8,a1
    51f0:	00070a93          	mv	s5,a4
    51f4:	01b787b3          	add	a5,a5,s11
    51f8:	006c2023          	sw	t1,0(s8)
    51fc:	01bc2223          	sw	s11,4(s8)
    5200:	06f12423          	sw	a5,104(sp)
    5204:	06c12223          	sw	a2,100(sp)
    5208:	00700713          	li	a4,7
    520c:	d0c75ce3          	bge	a4,a2,4f24 <_vfiprintf_r+0x348>
    5210:	160788e3          	beqz	a5,5b80 <_vfiprintf_r+0xfa4>
    5214:	06010613          	add	a2,sp,96
    5218:	00098593          	mv	a1,s3
    521c:	00040513          	mv	a0,s0
    5220:	01d12e23          	sw	t4,28(sp)
    5224:	01112c23          	sw	a7,24(sp)
    5228:	879ff0ef          	jal	4aa0 <__sprint_r.part.0>
    522c:	e80510e3          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    5230:	06812783          	lw	a5,104(sp)
    5234:	01c12e83          	lw	t4,28(sp)
    5238:	01812883          	lw	a7,24(sp)
    523c:	ce9ff06f          	j	4f24 <_vfiprintf_r+0x348>
    5240:	2007f713          	and	a4,a5,512
    5244:	e80716e3          	bnez	a4,50d0 <_vfiprintf_r+0x4f4>
    5248:	0589a503          	lw	a0,88(s3)
    524c:	b65fb0ef          	jal	db0 <__retarget_lock_release_recursive>
    5250:	00c99783          	lh	a5,12(s3)
    5254:	e7dff06f          	j	50d0 <_vfiprintf_r+0x4f4>
    5258:	000aa803          	lw	a6,0(s5)
    525c:	040101a3          	sb	zero,67(sp)
    5260:	000d8e13          	mv	t3,s11
    5264:	004a8a93          	add	s5,s5,4
    5268:	68080ae3          	beqz	a6,60fc <_vfiprintf_r+0x1520>
    526c:	05300793          	li	a5,83
    5270:	3cf68ce3          	beq	a3,a5,5e48 <_vfiprintf_r+0x126c>
    5274:	010df793          	and	a5,s11,16
    5278:	3c0798e3          	bnez	a5,5e48 <_vfiprintf_r+0x126c>
    527c:	00075463          	bgez	a4,5284 <_vfiprintf_r+0x6a8>
    5280:	7fd0006f          	j	627c <_vfiprintf_r+0x16a0>
    5284:	00070613          	mv	a2,a4
    5288:	00080513          	mv	a0,a6
    528c:	00000593          	li	a1,0
    5290:	03112223          	sw	a7,36(sp)
    5294:	00e12e23          	sw	a4,28(sp)
    5298:	01012c23          	sw	a6,24(sp)
    529c:	03b12023          	sw	s11,32(sp)
    52a0:	4e4020ef          	jal	7784 <memchr>
    52a4:	00a12823          	sw	a0,16(sp)
    52a8:	01812803          	lw	a6,24(sp)
    52ac:	01c12703          	lw	a4,28(sp)
    52b0:	02012e03          	lw	t3,32(sp)
    52b4:	02412883          	lw	a7,36(sp)
    52b8:	00051463          	bnez	a0,52c0 <_vfiprintf_r+0x6e4>
    52bc:	7990006f          	j	6254 <_vfiprintf_r+0x1678>
    52c0:	41050d33          	sub	s10,a0,a6
    52c4:	fffd4e93          	not	t4,s10
    52c8:	41fede93          	sra	t4,t4,0x1f
    52cc:	01dd7eb3          	and	t4,s10,t4
    52d0:	00012823          	sw	zero,16(sp)
    52d4:	6dd0006f          	j	61b0 <_vfiprintf_r+0x15d4>
    52d8:	04300793          	li	a5,67
    52dc:	000d8e13          	mv	t3,s11
    52e0:	004a8d93          	add	s11,s5,4
    52e4:	00f68663          	beq	a3,a5,52f0 <_vfiprintf_r+0x714>
    52e8:	010e7793          	and	a5,t3,16
    52ec:	280788e3          	beqz	a5,5d7c <_vfiprintf_r+0x11a0>
    52f0:	00800613          	li	a2,8
    52f4:	00000593          	li	a1,0
    52f8:	05810513          	add	a0,sp,88
    52fc:	01112e23          	sw	a7,28(sp)
    5300:	01c12c23          	sw	t3,24(sp)
    5304:	ab1fb0ef          	jal	db4 <memset>
    5308:	000aa603          	lw	a2,0(s5)
    530c:	0ac10593          	add	a1,sp,172
    5310:	05810693          	add	a3,sp,88
    5314:	00040513          	mv	a0,s0
    5318:	00b12823          	sw	a1,16(sp)
    531c:	694050ef          	jal	a9b0 <_wcrtomb_r>
    5320:	fff00793          	li	a5,-1
    5324:	01012583          	lw	a1,16(sp)
    5328:	01812e03          	lw	t3,24(sp)
    532c:	01c12883          	lw	a7,28(sp)
    5330:	00050d13          	mv	s10,a0
    5334:	00f51463          	bne	a0,a5,533c <_vfiprintf_r+0x760>
    5338:	0200106f          	j	6358 <_vfiprintf_r+0x177c>
    533c:	fff54e93          	not	t4,a0
    5340:	41fede93          	sra	t4,t4,0x1f
    5344:	01d57eb3          	and	t4,a0,t4
    5348:	040101a3          	sb	zero,67(sp)
    534c:	000d8a93          	mv	s5,s11
    5350:	00058813          	mv	a6,a1
    5354:	a79ff06f          	j	4dcc <_vfiprintf_r+0x1f0>
    5358:	411008b3          	neg	a7,a7
    535c:	000cc683          	lbu	a3,0(s9)
    5360:	004ded93          	or	s11,s11,4
    5364:	9f9ff06f          	j	4d5c <_vfiprintf_r+0x180>
    5368:	010dee13          	or	t3,s11,16
    536c:	020e7793          	and	a5,t3,32
    5370:	0c0788e3          	beqz	a5,5c40 <_vfiprintf_r+0x1064>
    5374:	007a8a93          	add	s5,s5,7
    5378:	ff8afa93          	and	s5,s5,-8
    537c:	004aa683          	lw	a3,4(s5)
    5380:	000aad83          	lw	s11,0(s5)
    5384:	008a8a93          	add	s5,s5,8
    5388:	00068d13          	mv	s10,a3
    538c:	3006c263          	bltz	a3,5690 <_vfiprintf_r+0xab4>
    5390:	32074063          	bltz	a4,56b0 <_vfiprintf_r+0xad4>
    5394:	01ade6b3          	or	a3,s11,s10
    5398:	f7fe7e13          	and	t3,t3,-129
    539c:	30069a63          	bnez	a3,56b0 <_vfiprintf_r+0xad4>
    53a0:	68071ae3          	bnez	a4,6234 <_vfiprintf_r+0x1658>
    53a4:	04314783          	lbu	a5,67(sp)
    53a8:	00012823          	sw	zero,16(sp)
    53ac:	00000e93          	li	t4,0
    53b0:	00000d13          	li	s10,0
    53b4:	11010813          	add	a6,sp,272
    53b8:	00078463          	beqz	a5,53c0 <_vfiprintf_r+0x7e4>
    53bc:	001e8e93          	add	t4,t4,1
    53c0:	002e7f93          	and	t6,t3,2
    53c4:	a00f8ae3          	beqz	t6,4dd8 <_vfiprintf_r+0x1fc>
    53c8:	002e8e93          	add	t4,t4,2
    53cc:	00200f93          	li	t6,2
    53d0:	a09ff06f          	j	4dd8 <_vfiprintf_r+0x1fc>
    53d4:	000cc683          	lbu	a3,0(s9)
    53d8:	06800793          	li	a5,104
    53dc:	4ef686e3          	beq	a3,a5,60c8 <_vfiprintf_r+0x14ec>
    53e0:	040ded93          	or	s11,s11,64
    53e4:	979ff06f          	j	4d5c <_vfiprintf_r+0x180>
    53e8:	010de613          	or	a2,s11,16
    53ec:	02067793          	and	a5,a2,32
    53f0:	000780e3          	beqz	a5,5bf0 <_vfiprintf_r+0x1014>
    53f4:	007a8a93          	add	s5,s5,7
    53f8:	ff8afa93          	and	s5,s5,-8
    53fc:	000aad83          	lw	s11,0(s5)
    5400:	004aad03          	lw	s10,4(s5)
    5404:	008a8a93          	add	s5,s5,8
    5408:	040101a3          	sb	zero,67(sp)
    540c:	00060e13          	mv	t3,a2
    5410:	2a074063          	bltz	a4,56b0 <_vfiprintf_r+0xad4>
    5414:	01ade6b3          	or	a3,s11,s10
    5418:	f7f67e13          	and	t3,a2,-129
    541c:	28069a63          	bnez	a3,56b0 <_vfiprintf_r+0xad4>
    5420:	00100793          	li	a5,1
    5424:	06071e63          	bnez	a4,54a0 <_vfiprintf_r+0x8c4>
    5428:	f6079ee3          	bnez	a5,53a4 <_vfiprintf_r+0x7c8>
    542c:	00167d13          	and	s10,a2,1
    5430:	0a0d0ce3          	beqz	s10,5ce8 <_vfiprintf_r+0x110c>
    5434:	03000793          	li	a5,48
    5438:	10f107a3          	sb	a5,271(sp)
    543c:	000d0e93          	mv	t4,s10
    5440:	10f10813          	add	a6,sp,271
    5444:	2980006f          	j	56dc <_vfiprintf_r+0xb00>
    5448:	02b00793          	li	a5,43
    544c:	000cc683          	lbu	a3,0(s9)
    5450:	04f101a3          	sb	a5,67(sp)
    5454:	909ff06f          	j	4d5c <_vfiprintf_r+0x180>
    5458:	010de693          	or	a3,s11,16
    545c:	0206f793          	and	a5,a3,32
    5460:	7a078c63          	beqz	a5,5c18 <_vfiprintf_r+0x103c>
    5464:	007a8a93          	add	s5,s5,7
    5468:	ff8afa93          	and	s5,s5,-8
    546c:	000aa783          	lw	a5,0(s5)
    5470:	004aa583          	lw	a1,4(s5)
    5474:	008a8a93          	add	s5,s5,8
    5478:	040101a3          	sb	zero,67(sp)
    547c:	bff6fe13          	and	t3,a3,-1025
    5480:	02074c63          	bltz	a4,54b8 <_vfiprintf_r+0x8dc>
    5484:	00b7e633          	or	a2,a5,a1
    5488:	b7f6f693          	and	a3,a3,-1153
    548c:	420610e3          	bnez	a2,60ac <_vfiprintf_r+0x14d0>
    5490:	000e0613          	mv	a2,t3
    5494:	00000793          	li	a5,0
    5498:	00068e13          	mv	t3,a3
    549c:	f80706e3          	beqz	a4,5428 <_vfiprintf_r+0x84c>
    54a0:	00100693          	li	a3,1
    54a4:	58d788e3          	beq	a5,a3,6234 <_vfiprintf_r+0x1658>
    54a8:	00200693          	li	a3,2
    54ac:	46d786e3          	beq	a5,a3,6118 <_vfiprintf_r+0x153c>
    54b0:	00000793          	li	a5,0
    54b4:	00000593          	li	a1,0
    54b8:	11010813          	add	a6,sp,272
    54bc:	01d59613          	sll	a2,a1,0x1d
    54c0:	0077f693          	and	a3,a5,7
    54c4:	0037d793          	srl	a5,a5,0x3
    54c8:	03068693          	add	a3,a3,48
    54cc:	00f667b3          	or	a5,a2,a5
    54d0:	0035d593          	srl	a1,a1,0x3
    54d4:	fed80fa3          	sb	a3,-1(a6)
    54d8:	00b7e633          	or	a2,a5,a1
    54dc:	00080513          	mv	a0,a6
    54e0:	fff80813          	add	a6,a6,-1
    54e4:	fc061ce3          	bnez	a2,54bc <_vfiprintf_r+0x8e0>
    54e8:	001e7793          	and	a5,t3,1
    54ec:	54078e63          	beqz	a5,5a48 <_vfiprintf_r+0xe6c>
    54f0:	03000793          	li	a5,48
    54f4:	54f68a63          	beq	a3,a5,5a48 <_vfiprintf_r+0xe6c>
    54f8:	ffe50513          	add	a0,a0,-2
    54fc:	fef80fa3          	sb	a5,-1(a6)
    5500:	11010793          	add	a5,sp,272
    5504:	40a78d33          	sub	s10,a5,a0
    5508:	00070e93          	mv	t4,a4
    550c:	09a744e3          	blt	a4,s10,5d94 <_vfiprintf_r+0x11b8>
    5510:	00050813          	mv	a6,a0
    5514:	1c80006f          	j	56dc <_vfiprintf_r+0xb00>
    5518:	000086b7          	lui	a3,0x8
    551c:	83068693          	add	a3,a3,-2000 # 7830 <memchr+0xac>
    5520:	04d11223          	sh	a3,68(sp)
    5524:	0000a697          	auipc	a3,0xa
    5528:	9dc68693          	add	a3,a3,-1572 # ef00 <__fini_array_end+0x1a8>
    552c:	000aa783          	lw	a5,0(s5)
    5530:	00000593          	li	a1,0
    5534:	002dee13          	or	t3,s11,2
    5538:	004a8a93          	add	s5,s5,4
    553c:	00d12a23          	sw	a3,20(sp)
    5540:	040101a3          	sb	zero,67(sp)
    5544:	4c074863          	bltz	a4,5a14 <_vfiprintf_r+0xe38>
    5548:	00b7e6b3          	or	a3,a5,a1
    554c:	f7fe7513          	and	a0,t3,-129
    5550:	4a069c63          	bnez	a3,5a08 <_vfiprintf_r+0xe2c>
    5554:	000e0613          	mv	a2,t3
    5558:	00200793          	li	a5,2
    555c:	00050e13          	mv	t3,a0
    5560:	ec5ff06f          	j	5424 <_vfiprintf_r+0x848>
    5564:	00040513          	mv	a0,s0
    5568:	00e12c23          	sw	a4,24(sp)
    556c:	01112823          	sw	a7,16(sp)
    5570:	390020ef          	jal	7900 <_localeconv_r>
    5574:	00452783          	lw	a5,4(a0)
    5578:	00078513          	mv	a0,a5
    557c:	02f12a23          	sw	a5,52(sp)
    5580:	ab5fb0ef          	jal	1034 <strlen>
    5584:	00050793          	mv	a5,a0
    5588:	00040513          	mv	a0,s0
    558c:	02f12823          	sw	a5,48(sp)
    5590:	370020ef          	jal	7900 <_localeconv_r>
    5594:	00852703          	lw	a4,8(a0)
    5598:	03012783          	lw	a5,48(sp)
    559c:	01012883          	lw	a7,16(sp)
    55a0:	02e12623          	sw	a4,44(sp)
    55a4:	01812703          	lw	a4,24(sp)
    55a8:	a2078ee3          	beqz	a5,4fe4 <_vfiprintf_r+0x408>
    55ac:	02c12783          	lw	a5,44(sp)
    55b0:	000cc683          	lbu	a3,0(s9)
    55b4:	fa078463          	beqz	a5,4d5c <_vfiprintf_r+0x180>
    55b8:	0007c783          	lbu	a5,0(a5)
    55bc:	fa078063          	beqz	a5,4d5c <_vfiprintf_r+0x180>
    55c0:	400ded93          	or	s11,s11,1024
    55c4:	f98ff06f          	j	4d5c <_vfiprintf_r+0x180>
    55c8:	020df793          	and	a5,s11,32
    55cc:	78079263          	bnez	a5,5d50 <_vfiprintf_r+0x1174>
    55d0:	010df793          	and	a5,s11,16
    55d4:	30079ae3          	bnez	a5,60e8 <_vfiprintf_r+0x150c>
    55d8:	040df793          	and	a5,s11,64
    55dc:	400796e3          	bnez	a5,61e8 <_vfiprintf_r+0x160c>
    55e0:	200dfe13          	and	t3,s11,512
    55e4:	300e02e3          	beqz	t3,60e8 <_vfiprintf_r+0x150c>
    55e8:	000aa783          	lw	a5,0(s5)
    55ec:	00c12703          	lw	a4,12(sp)
    55f0:	004a8a93          	add	s5,s5,4
    55f4:	00e78023          	sb	a4,0(a5)
    55f8:	efcff06f          	j	4cf4 <_vfiprintf_r+0x118>
    55fc:	000cc683          	lbu	a3,0(s9)
    5600:	06c00793          	li	a5,108
    5604:	2cf68ae3          	beq	a3,a5,60d8 <_vfiprintf_r+0x14fc>
    5608:	010ded93          	or	s11,s11,16
    560c:	f50ff06f          	j	4d5c <_vfiprintf_r+0x180>
    5610:	000cc683          	lbu	a3,0(s9)
    5614:	080ded93          	or	s11,s11,128
    5618:	f44ff06f          	j	4d5c <_vfiprintf_r+0x180>
    561c:	000cc683          	lbu	a3,0(s9)
    5620:	02a00793          	li	a5,42
    5624:	001c8593          	add	a1,s9,1
    5628:	54f680e3          	beq	a3,a5,6368 <_vfiprintf_r+0x178c>
    562c:	fd068793          	add	a5,a3,-48
    5630:	00900613          	li	a2,9
    5634:	00000713          	li	a4,0
    5638:	00900513          	li	a0,9
    563c:	02f66463          	bltu	a2,a5,5664 <_vfiprintf_r+0xa88>
    5640:	0005c683          	lbu	a3,0(a1)
    5644:	00271613          	sll	a2,a4,0x2
    5648:	00e60733          	add	a4,a2,a4
    564c:	00171713          	sll	a4,a4,0x1
    5650:	00f70733          	add	a4,a4,a5
    5654:	fd068793          	add	a5,a3,-48
    5658:	00158593          	add	a1,a1,1
    565c:	fef572e3          	bgeu	a0,a5,5640 <_vfiprintf_r+0xa64>
    5660:	74074063          	bltz	a4,5da0 <_vfiprintf_r+0x11c4>
    5664:	00058c93          	mv	s9,a1
    5668:	ef8ff06f          	j	4d60 <_vfiprintf_r+0x184>
    566c:	000cc683          	lbu	a3,0(s9)
    5670:	001ded93          	or	s11,s11,1
    5674:	ee8ff06f          	j	4d5c <_vfiprintf_r+0x180>
    5678:	04314783          	lbu	a5,67(sp)
    567c:	000cc683          	lbu	a3,0(s9)
    5680:	ec079e63          	bnez	a5,4d5c <_vfiprintf_r+0x180>
    5684:	02000793          	li	a5,32
    5688:	04f101a3          	sb	a5,67(sp)
    568c:	ed0ff06f          	j	4d5c <_vfiprintf_r+0x180>
    5690:	02d00613          	li	a2,45
    5694:	01b036b3          	snez	a3,s11
    5698:	41a000b3          	neg	ra,s10
    569c:	04c101a3          	sb	a2,67(sp)
    56a0:	40d08d33          	sub	s10,ra,a3
    56a4:	41b00db3          	neg	s11,s11
    56a8:	00074463          	bltz	a4,56b0 <_vfiprintf_r+0xad4>
    56ac:	f7fe7e13          	and	t3,t3,-129
    56b0:	120d14e3          	bnez	s10,5fd8 <_vfiprintf_r+0x13fc>
    56b4:	00900693          	li	a3,9
    56b8:	13b6e0e3          	bltu	a3,s11,5fd8 <_vfiprintf_r+0x13fc>
    56bc:	030d8793          	add	a5,s11,48
    56c0:	0ff7f793          	zext.b	a5,a5
    56c4:	10f107a3          	sb	a5,271(sp)
    56c8:	00070e93          	mv	t4,a4
    56cc:	00e04463          	bgtz	a4,56d4 <_vfiprintf_r+0xaf8>
    56d0:	00100e93          	li	t4,1
    56d4:	00100d13          	li	s10,1
    56d8:	10f10813          	add	a6,sp,271
    56dc:	04314783          	lbu	a5,67(sp)
    56e0:	00012823          	sw	zero,16(sp)
    56e4:	cc079ce3          	bnez	a5,53bc <_vfiprintf_r+0x7e0>
    56e8:	cd9ff06f          	j	53c0 <_vfiprintf_r+0x7e4>
    56ec:	00100713          	li	a4,1
    56f0:	000d0793          	mv	a5,s10
    56f4:	07012623          	sw	a6,108(sp)
    56f8:	07a12823          	sw	s10,112(sp)
    56fc:	07a12423          	sw	s10,104(sp)
    5700:	06e12223          	sw	a4,100(sp)
    5704:	000a0c13          	mv	s8,s4
    5708:	008c0c13          	add	s8,s8,8
    570c:	809ff06f          	j	4f14 <_vfiprintf_r+0x338>
    5710:	00100613          	li	a2,1
    5714:	00000693          	li	a3,0
    5718:	000a0593          	mv	a1,s4
    571c:	a65ff06f          	j	5180 <_vfiprintf_r+0x5a4>
    5720:	41d88db3          	sub	s11,a7,t4
    5724:	f9b05a63          	blez	s11,4eb8 <_vfiprintf_r+0x2dc>
    5728:	01000593          	li	a1,16
    572c:	3bb5dae3          	bge	a1,s11,62e0 <_vfiprintf_r+0x1704>
    5730:	0000af97          	auipc	t6,0xa
    5734:	e44f8f93          	add	t6,t6,-444 # f574 <zeroes.0>
    5738:	02e12223          	sw	a4,36(sp)
    573c:	000a8713          	mv	a4,s5
    5740:	000c0693          	mv	a3,s8
    5744:	000d8a93          	mv	s5,s11
    5748:	01000f13          	li	t5,16
    574c:	00700293          	li	t0,7
    5750:	01c12c23          	sw	t3,24(sp)
    5754:	01012e23          	sw	a6,28(sp)
    5758:	03112023          	sw	a7,32(sp)
    575c:	03d12423          	sw	t4,40(sp)
    5760:	000f8c13          	mv	s8,t6
    5764:	00070d93          	mv	s11,a4
    5768:	0180006f          	j	5780 <_vfiprintf_r+0xba4>
    576c:	00260513          	add	a0,a2,2
    5770:	00868693          	add	a3,a3,8
    5774:	00070613          	mv	a2,a4
    5778:	ff0a8a93          	add	s5,s5,-16
    577c:	055f5c63          	bge	t5,s5,57d4 <_vfiprintf_r+0xbf8>
    5780:	01078793          	add	a5,a5,16
    5784:	00160713          	add	a4,a2,1
    5788:	0186a023          	sw	s8,0(a3)
    578c:	01e6a223          	sw	t5,4(a3)
    5790:	06f12423          	sw	a5,104(sp)
    5794:	06e12223          	sw	a4,100(sp)
    5798:	fce2dae3          	bge	t0,a4,576c <_vfiprintf_r+0xb90>
    579c:	1c078663          	beqz	a5,5968 <_vfiprintf_r+0xd8c>
    57a0:	06010613          	add	a2,sp,96
    57a4:	00098593          	mv	a1,s3
    57a8:	00040513          	mv	a0,s0
    57ac:	af4ff0ef          	jal	4aa0 <__sprint_r.part.0>
    57b0:	8e051ee3          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    57b4:	06412603          	lw	a2,100(sp)
    57b8:	01000f13          	li	t5,16
    57bc:	ff0a8a93          	add	s5,s5,-16
    57c0:	06812783          	lw	a5,104(sp)
    57c4:	000a0693          	mv	a3,s4
    57c8:	00160513          	add	a0,a2,1
    57cc:	00700293          	li	t0,7
    57d0:	fb5f48e3          	blt	t5,s5,5780 <_vfiprintf_r+0xba4>
    57d4:	01812e03          	lw	t3,24(sp)
    57d8:	01c12803          	lw	a6,28(sp)
    57dc:	02012883          	lw	a7,32(sp)
    57e0:	02412703          	lw	a4,36(sp)
    57e4:	02812e83          	lw	t4,40(sp)
    57e8:	000d8613          	mv	a2,s11
    57ec:	000c0f93          	mv	t6,s8
    57f0:	000a8d93          	mv	s11,s5
    57f4:	00068c13          	mv	s8,a3
    57f8:	00060a93          	mv	s5,a2
    57fc:	01b787b3          	add	a5,a5,s11
    5800:	01fc2023          	sw	t6,0(s8)
    5804:	01bc2223          	sw	s11,4(s8)
    5808:	06f12423          	sw	a5,104(sp)
    580c:	06a12223          	sw	a0,100(sp)
    5810:	00700613          	li	a2,7
    5814:	4ea65863          	bge	a2,a0,5d04 <_vfiprintf_r+0x1128>
    5818:	1a0786e3          	beqz	a5,61c4 <_vfiprintf_r+0x15e8>
    581c:	06010613          	add	a2,sp,96
    5820:	00098593          	mv	a1,s3
    5824:	00040513          	mv	a0,s0
    5828:	03d12423          	sw	t4,40(sp)
    582c:	02e12223          	sw	a4,36(sp)
    5830:	03112023          	sw	a7,32(sp)
    5834:	01012e23          	sw	a6,28(sp)
    5838:	01c12c23          	sw	t3,24(sp)
    583c:	a64ff0ef          	jal	4aa0 <__sprint_r.part.0>
    5840:	860516e3          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    5844:	02412703          	lw	a4,36(sp)
    5848:	06412603          	lw	a2,100(sp)
    584c:	06812783          	lw	a5,104(sp)
    5850:	41a70733          	sub	a4,a4,s10
    5854:	02812e83          	lw	t4,40(sp)
    5858:	02012883          	lw	a7,32(sp)
    585c:	01c12803          	lw	a6,28(sp)
    5860:	01812e03          	lw	t3,24(sp)
    5864:	000a0c13          	mv	s8,s4
    5868:	00160f13          	add	t5,a2,1
    586c:	e4e05a63          	blez	a4,4ec0 <_vfiprintf_r+0x2e4>
    5870:	01000593          	li	a1,16
    5874:	0000af97          	auipc	t6,0xa
    5878:	d00f8f93          	add	t6,t6,-768 # f574 <zeroes.0>
    587c:	0ae5da63          	bge	a1,a4,5930 <_vfiprintf_r+0xd54>
    5880:	000c0593          	mv	a1,s8
    5884:	03512423          	sw	s5,40(sp)
    5888:	01000d93          	li	s11,16
    588c:	00700293          	li	t0,7
    5890:	01c12c23          	sw	t3,24(sp)
    5894:	01012e23          	sw	a6,28(sp)
    5898:	03112023          	sw	a7,32(sp)
    589c:	03d12223          	sw	t4,36(sp)
    58a0:	00070a93          	mv	s5,a4
    58a4:	000b0c13          	mv	s8,s6
    58a8:	0180006f          	j	58c0 <_vfiprintf_r+0xce4>
    58ac:	00260f13          	add	t5,a2,2
    58b0:	00858593          	add	a1,a1,8
    58b4:	00068613          	mv	a2,a3
    58b8:	ff0a8a93          	add	s5,s5,-16
    58bc:	055dda63          	bge	s11,s5,5910 <_vfiprintf_r+0xd34>
    58c0:	01078793          	add	a5,a5,16
    58c4:	00160693          	add	a3,a2,1
    58c8:	0165a023          	sw	s6,0(a1)
    58cc:	01b5a223          	sw	s11,4(a1)
    58d0:	06f12423          	sw	a5,104(sp)
    58d4:	06d12223          	sw	a3,100(sp)
    58d8:	fcd2dae3          	bge	t0,a3,58ac <_vfiprintf_r+0xcd0>
    58dc:	06078e63          	beqz	a5,5958 <_vfiprintf_r+0xd7c>
    58e0:	06010613          	add	a2,sp,96
    58e4:	00098593          	mv	a1,s3
    58e8:	00040513          	mv	a0,s0
    58ec:	9b4ff0ef          	jal	4aa0 <__sprint_r.part.0>
    58f0:	fa051e63          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    58f4:	06412603          	lw	a2,100(sp)
    58f8:	ff0a8a93          	add	s5,s5,-16
    58fc:	06812783          	lw	a5,104(sp)
    5900:	000a0593          	mv	a1,s4
    5904:	00160f13          	add	t5,a2,1
    5908:	00700293          	li	t0,7
    590c:	fb5dcae3          	blt	s11,s5,58c0 <_vfiprintf_r+0xce4>
    5910:	000a8713          	mv	a4,s5
    5914:	01812e03          	lw	t3,24(sp)
    5918:	01c12803          	lw	a6,28(sp)
    591c:	02012883          	lw	a7,32(sp)
    5920:	02412e83          	lw	t4,36(sp)
    5924:	02812a83          	lw	s5,40(sp)
    5928:	000c0f93          	mv	t6,s8
    592c:	00058c13          	mv	s8,a1
    5930:	00e787b3          	add	a5,a5,a4
    5934:	00ec2223          	sw	a4,4(s8)
    5938:	01fc2023          	sw	t6,0(s8)
    593c:	06f12423          	sw	a5,104(sp)
    5940:	07e12223          	sw	t5,100(sp)
    5944:	00700713          	li	a4,7
    5948:	25e74863          	blt	a4,t5,5b98 <_vfiprintf_r+0xfbc>
    594c:	008c0c13          	add	s8,s8,8
    5950:	001f0f13          	add	t5,t5,1
    5954:	d6cff06f          	j	4ec0 <_vfiprintf_r+0x2e4>
    5958:	00100f13          	li	t5,1
    595c:	00000613          	li	a2,0
    5960:	000a0593          	mv	a1,s4
    5964:	f55ff06f          	j	58b8 <_vfiprintf_r+0xcdc>
    5968:	00100513          	li	a0,1
    596c:	00000613          	li	a2,0
    5970:	000a0693          	mv	a3,s4
    5974:	e05ff06f          	j	5778 <_vfiprintf_r+0xb9c>
    5978:	06078263          	beqz	a5,59dc <_vfiprintf_r+0xe00>
    597c:	06010613          	add	a2,sp,96
    5980:	00098593          	mv	a1,s3
    5984:	00040513          	mv	a0,s0
    5988:	03d12e23          	sw	t4,60(sp)
    598c:	02e12c23          	sw	a4,56(sp)
    5990:	03112423          	sw	a7,40(sp)
    5994:	03012223          	sw	a6,36(sp)
    5998:	02512023          	sw	t0,32(sp)
    599c:	01f12e23          	sw	t6,28(sp)
    59a0:	01c12c23          	sw	t3,24(sp)
    59a4:	8fcff0ef          	jal	4aa0 <__sprint_r.part.0>
    59a8:	f0051263          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    59ac:	06412603          	lw	a2,100(sp)
    59b0:	06812783          	lw	a5,104(sp)
    59b4:	03c12e83          	lw	t4,60(sp)
    59b8:	03812703          	lw	a4,56(sp)
    59bc:	02812883          	lw	a7,40(sp)
    59c0:	02412803          	lw	a6,36(sp)
    59c4:	02012283          	lw	t0,32(sp)
    59c8:	01c12f83          	lw	t6,28(sp)
    59cc:	01812e03          	lw	t3,24(sp)
    59d0:	000a0c13          	mv	s8,s4
    59d4:	00160f13          	add	t5,a2,1
    59d8:	c58ff06f          	j	4e30 <_vfiprintf_r+0x254>
    59dc:	380f8863          	beqz	t6,5d6c <_vfiprintf_r+0x1190>
    59e0:	04410793          	add	a5,sp,68
    59e4:	06f12623          	sw	a5,108(sp)
    59e8:	00200793          	li	a5,2
    59ec:	06f12823          	sw	a5,112(sp)
    59f0:	00100f13          	li	t5,1
    59f4:	000a0c13          	mv	s8,s4
    59f8:	000f0613          	mv	a2,t5
    59fc:	008c0c13          	add	s8,s8,8
    5a00:	001f0f13          	add	t5,t5,1
    5a04:	cacff06f          	j	4eb0 <_vfiprintf_r+0x2d4>
    5a08:	00200693          	li	a3,2
    5a0c:	00050e13          	mv	t3,a0
    5a10:	aa0684e3          	beqz	a3,54b8 <_vfiprintf_r+0x8dc>
    5a14:	01412503          	lw	a0,20(sp)
    5a18:	11010813          	add	a6,sp,272
    5a1c:	00f7f693          	and	a3,a5,15
    5a20:	00d506b3          	add	a3,a0,a3
    5a24:	0006c603          	lbu	a2,0(a3)
    5a28:	0047d793          	srl	a5,a5,0x4
    5a2c:	01c59693          	sll	a3,a1,0x1c
    5a30:	00f6e7b3          	or	a5,a3,a5
    5a34:	0045d593          	srl	a1,a1,0x4
    5a38:	fec80fa3          	sb	a2,-1(a6)
    5a3c:	00b7e6b3          	or	a3,a5,a1
    5a40:	fff80813          	add	a6,a6,-1
    5a44:	fc069ce3          	bnez	a3,5a1c <_vfiprintf_r+0xe40>
    5a48:	11010793          	add	a5,sp,272
    5a4c:	41078d33          	sub	s10,a5,a6
    5a50:	00070e93          	mv	t4,a4
    5a54:	c9a754e3          	bge	a4,s10,56dc <_vfiprintf_r+0xb00>
    5a58:	000d0e93          	mv	t4,s10
    5a5c:	c81ff06f          	j	56dc <_vfiprintf_r+0xb00>
    5a60:	01000513          	li	a0,16
    5a64:	01b554e3          	bge	a0,s11,626c <_vfiprintf_r+0x1690>
    5a68:	000a8693          	mv	a3,s5
    5a6c:	0000a317          	auipc	t1,0xa
    5a70:	b1830313          	add	t1,t1,-1256 # f584 <blanks.1>
    5a74:	02e12c23          	sw	a4,56(sp)
    5a78:	000d8a93          	mv	s5,s11
    5a7c:	000c0713          	mv	a4,s8
    5a80:	01000f13          	li	t5,16
    5a84:	00700393          	li	t2,7
    5a88:	01c12c23          	sw	t3,24(sp)
    5a8c:	01f12e23          	sw	t6,28(sp)
    5a90:	02512023          	sw	t0,32(sp)
    5a94:	03012223          	sw	a6,36(sp)
    5a98:	03112423          	sw	a7,40(sp)
    5a9c:	03d12e23          	sw	t4,60(sp)
    5aa0:	00030c13          	mv	s8,t1
    5aa4:	00068d93          	mv	s11,a3
    5aa8:	01c0006f          	j	5ac4 <_vfiprintf_r+0xee8>
    5aac:	00260513          	add	a0,a2,2
    5ab0:	00870713          	add	a4,a4,8
    5ab4:	00058613          	mv	a2,a1
    5ab8:	ff0a8a93          	add	s5,s5,-16
    5abc:	055f5c63          	bge	t5,s5,5b14 <_vfiprintf_r+0xf38>
    5ac0:	00160593          	add	a1,a2,1
    5ac4:	01078793          	add	a5,a5,16
    5ac8:	01872023          	sw	s8,0(a4)
    5acc:	01e72223          	sw	t5,4(a4)
    5ad0:	06f12423          	sw	a5,104(sp)
    5ad4:	06b12223          	sw	a1,100(sp)
    5ad8:	fcb3dae3          	bge	t2,a1,5aac <_vfiprintf_r+0xed0>
    5adc:	08078a63          	beqz	a5,5b70 <_vfiprintf_r+0xf94>
    5ae0:	06010613          	add	a2,sp,96
    5ae4:	00098593          	mv	a1,s3
    5ae8:	00040513          	mv	a0,s0
    5aec:	fb5fe0ef          	jal	4aa0 <__sprint_r.part.0>
    5af0:	da051e63          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    5af4:	06412603          	lw	a2,100(sp)
    5af8:	01000f13          	li	t5,16
    5afc:	ff0a8a93          	add	s5,s5,-16
    5b00:	06812783          	lw	a5,104(sp)
    5b04:	000a0713          	mv	a4,s4
    5b08:	00160513          	add	a0,a2,1
    5b0c:	00700393          	li	t2,7
    5b10:	fb5f48e3          	blt	t5,s5,5ac0 <_vfiprintf_r+0xee4>
    5b14:	000c0313          	mv	t1,s8
    5b18:	01812e03          	lw	t3,24(sp)
    5b1c:	00070c13          	mv	s8,a4
    5b20:	01c12f83          	lw	t6,28(sp)
    5b24:	02012283          	lw	t0,32(sp)
    5b28:	02412803          	lw	a6,36(sp)
    5b2c:	02812883          	lw	a7,40(sp)
    5b30:	03c12e83          	lw	t4,60(sp)
    5b34:	03812703          	lw	a4,56(sp)
    5b38:	000d8693          	mv	a3,s11
    5b3c:	000a8d93          	mv	s11,s5
    5b40:	00068a93          	mv	s5,a3
    5b44:	01b787b3          	add	a5,a5,s11
    5b48:	006c2023          	sw	t1,0(s8)
    5b4c:	01bc2223          	sw	s11,4(s8)
    5b50:	06f12423          	sw	a5,104(sp)
    5b54:	06a12223          	sw	a0,100(sp)
    5b58:	00700613          	li	a2,7
    5b5c:	12a64063          	blt	a2,a0,5c7c <_vfiprintf_r+0x10a0>
    5b60:	008c0c13          	add	s8,s8,8
    5b64:	00150f13          	add	t5,a0,1
    5b68:	00050613          	mv	a2,a0
    5b6c:	a8cff06f          	j	4df8 <_vfiprintf_r+0x21c>
    5b70:	00000613          	li	a2,0
    5b74:	00100513          	li	a0,1
    5b78:	000a0713          	mv	a4,s4
    5b7c:	f3dff06f          	j	5ab8 <_vfiprintf_r+0xedc>
    5b80:	01d8d463          	bge	a7,t4,5b88 <_vfiprintf_r+0xfac>
    5b84:	000e8893          	mv	a7,t4
    5b88:	00c12783          	lw	a5,12(sp)
    5b8c:	011787b3          	add	a5,a5,a7
    5b90:	00f12623          	sw	a5,12(sp)
    5b94:	ba8ff06f          	j	4f3c <_vfiprintf_r+0x360>
    5b98:	b4078ae3          	beqz	a5,56ec <_vfiprintf_r+0xb10>
    5b9c:	06010613          	add	a2,sp,96
    5ba0:	00098593          	mv	a1,s3
    5ba4:	00040513          	mv	a0,s0
    5ba8:	03d12223          	sw	t4,36(sp)
    5bac:	03112023          	sw	a7,32(sp)
    5bb0:	01012e23          	sw	a6,28(sp)
    5bb4:	01c12c23          	sw	t3,24(sp)
    5bb8:	ee9fe0ef          	jal	4aa0 <__sprint_r.part.0>
    5bbc:	ce051863          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    5bc0:	06412f03          	lw	t5,100(sp)
    5bc4:	06812783          	lw	a5,104(sp)
    5bc8:	02412e83          	lw	t4,36(sp)
    5bcc:	02012883          	lw	a7,32(sp)
    5bd0:	01c12803          	lw	a6,28(sp)
    5bd4:	01812e03          	lw	t3,24(sp)
    5bd8:	000a0c13          	mv	s8,s4
    5bdc:	001f0f13          	add	t5,t5,1
    5be0:	ae0ff06f          	j	4ec0 <_vfiprintf_r+0x2e4>
    5be4:	06012223          	sw	zero,100(sp)
    5be8:	000a0c13          	mv	s8,s4
    5bec:	c84ff06f          	j	5070 <_vfiprintf_r+0x494>
    5bf0:	01067693          	and	a3,a2,16
    5bf4:	000aa783          	lw	a5,0(s5)
    5bf8:	004a8a93          	add	s5,s5,4
    5bfc:	12069c63          	bnez	a3,5d34 <_vfiprintf_r+0x1158>
    5c00:	04067693          	and	a3,a2,64
    5c04:	12068463          	beqz	a3,5d2c <_vfiprintf_r+0x1150>
    5c08:	01079d93          	sll	s11,a5,0x10
    5c0c:	010ddd93          	srl	s11,s11,0x10
    5c10:	00000d13          	li	s10,0
    5c14:	ff4ff06f          	j	5408 <_vfiprintf_r+0x82c>
    5c18:	0106f613          	and	a2,a3,16
    5c1c:	000aa783          	lw	a5,0(s5)
    5c20:	004a8a93          	add	s5,s5,4
    5c24:	12061263          	bnez	a2,5d48 <_vfiprintf_r+0x116c>
    5c28:	0406f613          	and	a2,a3,64
    5c2c:	10060a63          	beqz	a2,5d40 <_vfiprintf_r+0x1164>
    5c30:	01079793          	sll	a5,a5,0x10
    5c34:	0107d793          	srl	a5,a5,0x10
    5c38:	00000593          	li	a1,0
    5c3c:	83dff06f          	j	5478 <_vfiprintf_r+0x89c>
    5c40:	010e7693          	and	a3,t3,16
    5c44:	000aa783          	lw	a5,0(s5)
    5c48:	004a8a93          	add	s5,s5,4
    5c4c:	0c069863          	bnez	a3,5d1c <_vfiprintf_r+0x1140>
    5c50:	040e7693          	and	a3,t3,64
    5c54:	0c068063          	beqz	a3,5d14 <_vfiprintf_r+0x1138>
    5c58:	01079d93          	sll	s11,a5,0x10
    5c5c:	410ddd93          	sra	s11,s11,0x10
    5c60:	41fddd13          	sra	s10,s11,0x1f
    5c64:	000d0693          	mv	a3,s10
    5c68:	f24ff06f          	j	538c <_vfiprintf_r+0x7b0>
    5c6c:	00100f13          	li	t5,1
    5c70:	00000613          	li	a2,0
    5c74:	000a0c13          	mv	s8,s4
    5c78:	a38ff06f          	j	4eb0 <_vfiprintf_r+0x2d4>
    5c7c:	1a078463          	beqz	a5,5e24 <_vfiprintf_r+0x1248>
    5c80:	06010613          	add	a2,sp,96
    5c84:	00098593          	mv	a1,s3
    5c88:	00040513          	mv	a0,s0
    5c8c:	03d12e23          	sw	t4,60(sp)
    5c90:	02e12c23          	sw	a4,56(sp)
    5c94:	03112423          	sw	a7,40(sp)
    5c98:	03012223          	sw	a6,36(sp)
    5c9c:	02512023          	sw	t0,32(sp)
    5ca0:	01f12e23          	sw	t6,28(sp)
    5ca4:	01c12c23          	sw	t3,24(sp)
    5ca8:	df9fe0ef          	jal	4aa0 <__sprint_r.part.0>
    5cac:	c0051063          	bnez	a0,50ac <_vfiprintf_r+0x4d0>
    5cb0:	06412603          	lw	a2,100(sp)
    5cb4:	06812783          	lw	a5,104(sp)
    5cb8:	03c12e83          	lw	t4,60(sp)
    5cbc:	03812703          	lw	a4,56(sp)
    5cc0:	02812883          	lw	a7,40(sp)
    5cc4:	02412803          	lw	a6,36(sp)
    5cc8:	02012283          	lw	t0,32(sp)
    5ccc:	01c12f83          	lw	t6,28(sp)
    5cd0:	01812e03          	lw	t3,24(sp)
    5cd4:	000a0c13          	mv	s8,s4
    5cd8:	00160f13          	add	t5,a2,1
    5cdc:	91cff06f          	j	4df8 <_vfiprintf_r+0x21c>
    5ce0:	000d8e13          	mv	t3,s11
    5ce4:	e88ff06f          	j	536c <_vfiprintf_r+0x790>
    5ce8:	00000e93          	li	t4,0
    5cec:	11010813          	add	a6,sp,272
    5cf0:	9edff06f          	j	56dc <_vfiprintf_r+0xb00>
    5cf4:	0589a503          	lw	a0,88(s3)
    5cf8:	8b4fb0ef          	jal	dac <__retarget_lock_acquire_recursive>
    5cfc:	00c99783          	lh	a5,12(s3)
    5d00:	f41fe06f          	j	4c40 <_vfiprintf_r+0x64>
    5d04:	008c0c13          	add	s8,s8,8
    5d08:	00150f13          	add	t5,a0,1
    5d0c:	00050613          	mv	a2,a0
    5d10:	9a8ff06f          	j	4eb8 <_vfiprintf_r+0x2dc>
    5d14:	200e7693          	and	a3,t3,512
    5d18:	50069463          	bnez	a3,6220 <_vfiprintf_r+0x1644>
    5d1c:	41f7dd13          	sra	s10,a5,0x1f
    5d20:	00078d93          	mv	s11,a5
    5d24:	000d0693          	mv	a3,s10
    5d28:	e64ff06f          	j	538c <_vfiprintf_r+0x7b0>
    5d2c:	20067693          	and	a3,a2,512
    5d30:	4c069663          	bnez	a3,61fc <_vfiprintf_r+0x1620>
    5d34:	00078d93          	mv	s11,a5
    5d38:	00000d13          	li	s10,0
    5d3c:	eccff06f          	j	5408 <_vfiprintf_r+0x82c>
    5d40:	2006f613          	and	a2,a3,512
    5d44:	4c061863          	bnez	a2,6214 <_vfiprintf_r+0x1638>
    5d48:	00000593          	li	a1,0
    5d4c:	f2cff06f          	j	5478 <_vfiprintf_r+0x89c>
    5d50:	00c12683          	lw	a3,12(sp)
    5d54:	000aa783          	lw	a5,0(s5)
    5d58:	004a8a93          	add	s5,s5,4
    5d5c:	41f6d713          	sra	a4,a3,0x1f
    5d60:	00d7a023          	sw	a3,0(a5)
    5d64:	00e7a223          	sw	a4,4(a5)
    5d68:	f8dfe06f          	j	4cf4 <_vfiprintf_r+0x118>
    5d6c:	00000613          	li	a2,0
    5d70:	00100f13          	li	t5,1
    5d74:	000a0c13          	mv	s8,s4
    5d78:	938ff06f          	j	4eb0 <_vfiprintf_r+0x2d4>
    5d7c:	000aa783          	lw	a5,0(s5)
    5d80:	00100e93          	li	t4,1
    5d84:	00100d13          	li	s10,1
    5d88:	0af10623          	sb	a5,172(sp)
    5d8c:	0ac10593          	add	a1,sp,172
    5d90:	db8ff06f          	j	5348 <_vfiprintf_r+0x76c>
    5d94:	000d0e93          	mv	t4,s10
    5d98:	00050813          	mv	a6,a0
    5d9c:	941ff06f          	j	56dc <_vfiprintf_r+0xb00>
    5da0:	fff00713          	li	a4,-1
    5da4:	00058c93          	mv	s9,a1
    5da8:	fb9fe06f          	j	4d60 <_vfiprintf_r+0x184>
    5dac:	000d8613          	mv	a2,s11
    5db0:	e3cff06f          	j	53ec <_vfiprintf_r+0x810>
    5db4:	00009797          	auipc	a5,0x9
    5db8:	16078793          	add	a5,a5,352 # ef14 <__fini_array_end+0x1bc>
    5dbc:	000d8e13          	mv	t3,s11
    5dc0:	00f12a23          	sw	a5,20(sp)
    5dc4:	020e7793          	and	a5,t3,32
    5dc8:	1c078c63          	beqz	a5,5fa0 <_vfiprintf_r+0x13c4>
    5dcc:	007a8a93          	add	s5,s5,7
    5dd0:	ff8afa93          	and	s5,s5,-8
    5dd4:	000aa783          	lw	a5,0(s5)
    5dd8:	004aa583          	lw	a1,4(s5)
    5ddc:	008a8a93          	add	s5,s5,8
    5de0:	001e7613          	and	a2,t3,1
    5de4:	00060e63          	beqz	a2,5e00 <_vfiprintf_r+0x1224>
    5de8:	00b7e633          	or	a2,a5,a1
    5dec:	00060a63          	beqz	a2,5e00 <_vfiprintf_r+0x1224>
    5df0:	03000613          	li	a2,48
    5df4:	04c10223          	sb	a2,68(sp)
    5df8:	04d102a3          	sb	a3,69(sp)
    5dfc:	002e6e13          	or	t3,t3,2
    5e00:	bffe7e13          	and	t3,t3,-1025
    5e04:	f3cff06f          	j	5540 <_vfiprintf_r+0x964>
    5e08:	000d8693          	mv	a3,s11
    5e0c:	e50ff06f          	j	545c <_vfiprintf_r+0x880>
    5e10:	00009797          	auipc	a5,0x9
    5e14:	0f078793          	add	a5,a5,240 # ef00 <__fini_array_end+0x1a8>
    5e18:	000d8e13          	mv	t3,s11
    5e1c:	00f12a23          	sw	a5,20(sp)
    5e20:	fa5ff06f          	j	5dc4 <_vfiprintf_r+0x11e8>
    5e24:	04314603          	lbu	a2,67(sp)
    5e28:	3a060a63          	beqz	a2,61dc <_vfiprintf_r+0x1600>
    5e2c:	04310793          	add	a5,sp,67
    5e30:	06f12623          	sw	a5,108(sp)
    5e34:	00100793          	li	a5,1
    5e38:	06f12823          	sw	a5,112(sp)
    5e3c:	00100f13          	li	t5,1
    5e40:	000a0c13          	mv	s8,s4
    5e44:	fe1fe06f          	j	4e24 <_vfiprintf_r+0x248>
    5e48:	00800613          	li	a2,8
    5e4c:	00000593          	li	a1,0
    5e50:	05810513          	add	a0,sp,88
    5e54:	02e12023          	sw	a4,32(sp)
    5e58:	01112e23          	sw	a7,28(sp)
    5e5c:	01c12c23          	sw	t3,24(sp)
    5e60:	05012623          	sw	a6,76(sp)
    5e64:	01012823          	sw	a6,16(sp)
    5e68:	f4dfa0ef          	jal	db4 <memset>
    5e6c:	02012703          	lw	a4,32(sp)
    5e70:	01012803          	lw	a6,16(sp)
    5e74:	01812e03          	lw	t3,24(sp)
    5e78:	01c12883          	lw	a7,28(sp)
    5e7c:	2a074463          	bltz	a4,6124 <_vfiprintf_r+0x1548>
    5e80:	00000d93          	li	s11,0
    5e84:	00000d13          	li	s10,0
    5e88:	01812823          	sw	s8,16(sp)
    5e8c:	01012e23          	sw	a6,28(sp)
    5e90:	000d8c13          	mv	s8,s11
    5e94:	03112023          	sw	a7,32(sp)
    5e98:	000c8d93          	mv	s11,s9
    5e9c:	000a8c93          	mv	s9,s5
    5ea0:	000d0a93          	mv	s5,s10
    5ea4:	00098d13          	mv	s10,s3
    5ea8:	00070993          	mv	s3,a4
    5eac:	0300006f          	j	5edc <_vfiprintf_r+0x1300>
    5eb0:	05810693          	add	a3,sp,88
    5eb4:	0ac10593          	add	a1,sp,172
    5eb8:	00040513          	mv	a0,s0
    5ebc:	2f5040ef          	jal	a9b0 <_wcrtomb_r>
    5ec0:	fff00793          	li	a5,-1
    5ec4:	48f50063          	beq	a0,a5,6344 <_vfiprintf_r+0x1768>
    5ec8:	00aa87b3          	add	a5,s5,a0
    5ecc:	02f9c063          	blt	s3,a5,5eec <_vfiprintf_r+0x1310>
    5ed0:	004c0c13          	add	s8,s8,4
    5ed4:	45378463          	beq	a5,s3,631c <_vfiprintf_r+0x1740>
    5ed8:	00078a93          	mv	s5,a5
    5edc:	04c12783          	lw	a5,76(sp)
    5ee0:	018787b3          	add	a5,a5,s8
    5ee4:	0007a603          	lw	a2,0(a5)
    5ee8:	fc0614e3          	bnez	a2,5eb0 <_vfiprintf_r+0x12d4>
    5eec:	01012c03          	lw	s8,16(sp)
    5ef0:	01812e03          	lw	t3,24(sp)
    5ef4:	01c12803          	lw	a6,28(sp)
    5ef8:	02012883          	lw	a7,32(sp)
    5efc:	000d0993          	mv	s3,s10
    5f00:	000a8d13          	mv	s10,s5
    5f04:	000c8a93          	mv	s5,s9
    5f08:	000d8c93          	mv	s9,s11
    5f0c:	280d0e63          	beqz	s10,61a8 <_vfiprintf_r+0x15cc>
    5f10:	06300793          	li	a5,99
    5f14:	33a7d463          	bge	a5,s10,623c <_vfiprintf_r+0x1660>
    5f18:	001d0593          	add	a1,s10,1
    5f1c:	00040513          	mv	a0,s0
    5f20:	01112c23          	sw	a7,24(sp)
    5f24:	01c12823          	sw	t3,16(sp)
    5f28:	de8fb0ef          	jal	1510 <_malloc_r>
    5f2c:	01012e03          	lw	t3,16(sp)
    5f30:	01812883          	lw	a7,24(sp)
    5f34:	00050813          	mv	a6,a0
    5f38:	42050063          	beqz	a0,6358 <_vfiprintf_r+0x177c>
    5f3c:	00a12823          	sw	a0,16(sp)
    5f40:	00800613          	li	a2,8
    5f44:	00000593          	li	a1,0
    5f48:	05810513          	add	a0,sp,88
    5f4c:	03112023          	sw	a7,32(sp)
    5f50:	01c12e23          	sw	t3,28(sp)
    5f54:	01012c23          	sw	a6,24(sp)
    5f58:	e5dfa0ef          	jal	db4 <memset>
    5f5c:	01812803          	lw	a6,24(sp)
    5f60:	05810713          	add	a4,sp,88
    5f64:	000d0693          	mv	a3,s10
    5f68:	00080593          	mv	a1,a6
    5f6c:	04c10613          	add	a2,sp,76
    5f70:	00040513          	mv	a0,s0
    5f74:	2c9040ef          	jal	aa3c <_wcsrtombs_r>
    5f78:	01812803          	lw	a6,24(sp)
    5f7c:	01c12e03          	lw	t3,28(sp)
    5f80:	02012883          	lw	a7,32(sp)
    5f84:	40ad1063          	bne	s10,a0,6384 <_vfiprintf_r+0x17a8>
    5f88:	fffd4e93          	not	t4,s10
    5f8c:	01a807b3          	add	a5,a6,s10
    5f90:	41fede93          	sra	t4,t4,0x1f
    5f94:	00078023          	sb	zero,0(a5)
    5f98:	01dd7eb3          	and	t4,s10,t4
    5f9c:	2140006f          	j	61b0 <_vfiprintf_r+0x15d4>
    5fa0:	010e7613          	and	a2,t3,16
    5fa4:	000aa783          	lw	a5,0(s5)
    5fa8:	004a8a93          	add	s5,s5,4
    5fac:	02061263          	bnez	a2,5fd0 <_vfiprintf_r+0x13f4>
    5fb0:	040e7613          	and	a2,t3,64
    5fb4:	00060a63          	beqz	a2,5fc8 <_vfiprintf_r+0x13ec>
    5fb8:	01079793          	sll	a5,a5,0x10
    5fbc:	0107d793          	srl	a5,a5,0x10
    5fc0:	00000593          	li	a1,0
    5fc4:	e1dff06f          	j	5de0 <_vfiprintf_r+0x1204>
    5fc8:	200e7613          	and	a2,t3,512
    5fcc:	22061e63          	bnez	a2,6208 <_vfiprintf_r+0x162c>
    5fd0:	00000593          	li	a1,0
    5fd4:	e0dff06f          	j	5de0 <_vfiprintf_r+0x1204>
    5fd8:	400e7793          	and	a5,t3,1024
    5fdc:	00000693          	li	a3,0
    5fe0:	11010e93          	add	t4,sp,272
    5fe4:	01812823          	sw	s8,16(sp)
    5fe8:	02812223          	sw	s0,36(sp)
    5fec:	03912c23          	sw	s9,56(sp)
    5ff0:	03512e23          	sw	s5,60(sp)
    5ff4:	02c12c83          	lw	s9,44(sp)
    5ff8:	01c12c23          	sw	t3,24(sp)
    5ffc:	01112e23          	sw	a7,28(sp)
    6000:	02e12023          	sw	a4,32(sp)
    6004:	00078c13          	mv	s8,a5
    6008:	00068413          	mv	s0,a3
    600c:	03312423          	sw	s3,40(sp)
    6010:	000e8a93          	mv	s5,t4
    6014:	0280006f          	j	603c <_vfiprintf_r+0x1460>
    6018:	00a00613          	li	a2,10
    601c:	00000693          	li	a3,0
    6020:	000d8513          	mv	a0,s11
    6024:	000d0593          	mv	a1,s10
    6028:	364050ef          	jal	b38c <__udivdi3>
    602c:	220d0a63          	beqz	s10,6260 <_vfiprintf_r+0x1684>
    6030:	00050d93          	mv	s11,a0
    6034:	00058d13          	mv	s10,a1
    6038:	00098a93          	mv	s5,s3
    603c:	00a00613          	li	a2,10
    6040:	00000693          	li	a3,0
    6044:	000d8513          	mv	a0,s11
    6048:	000d0593          	mv	a1,s10
    604c:	1ed050ef          	jal	ba38 <__umoddi3>
    6050:	03050513          	add	a0,a0,48
    6054:	feaa8fa3          	sb	a0,-1(s5)
    6058:	fffa8993          	add	s3,s5,-1
    605c:	00140413          	add	s0,s0,1
    6060:	fa0c0ce3          	beqz	s8,6018 <_vfiprintf_r+0x143c>
    6064:	000cc783          	lbu	a5,0(s9)
    6068:	fa8798e3          	bne	a5,s0,6018 <_vfiprintf_r+0x143c>
    606c:	0ff00793          	li	a5,255
    6070:	faf404e3          	beq	s0,a5,6018 <_vfiprintf_r+0x143c>
    6074:	0e0d1a63          	bnez	s10,6168 <_vfiprintf_r+0x158c>
    6078:	00900793          	li	a5,9
    607c:	0fb7e663          	bltu	a5,s11,6168 <_vfiprintf_r+0x158c>
    6080:	00098813          	mv	a6,s3
    6084:	03912623          	sw	s9,44(sp)
    6088:	01012c03          	lw	s8,16(sp)
    608c:	01812e03          	lw	t3,24(sp)
    6090:	01c12883          	lw	a7,28(sp)
    6094:	02012703          	lw	a4,32(sp)
    6098:	02412403          	lw	s0,36(sp)
    609c:	02812983          	lw	s3,40(sp)
    60a0:	03812c83          	lw	s9,56(sp)
    60a4:	03c12a83          	lw	s5,60(sp)
    60a8:	9a1ff06f          	j	5a48 <_vfiprintf_r+0xe6c>
    60ac:	00068e13          	mv	t3,a3
    60b0:	00000693          	li	a3,0
    60b4:	c0068263          	beqz	a3,54b8 <_vfiprintf_r+0x8dc>
    60b8:	95dff06f          	j	5a14 <_vfiprintf_r+0xe38>
    60bc:	00040513          	mv	a0,s0
    60c0:	115000ef          	jal	69d4 <__sinit>
    60c4:	b61fe06f          	j	4c24 <_vfiprintf_r+0x48>
    60c8:	001cc683          	lbu	a3,1(s9)
    60cc:	200ded93          	or	s11,s11,512
    60d0:	001c8c93          	add	s9,s9,1
    60d4:	c89fe06f          	j	4d5c <_vfiprintf_r+0x180>
    60d8:	001cc683          	lbu	a3,1(s9)
    60dc:	020ded93          	or	s11,s11,32
    60e0:	001c8c93          	add	s9,s9,1
    60e4:	c79fe06f          	j	4d5c <_vfiprintf_r+0x180>
    60e8:	000aa783          	lw	a5,0(s5)
    60ec:	00c12703          	lw	a4,12(sp)
    60f0:	004a8a93          	add	s5,s5,4
    60f4:	00e7a023          	sw	a4,0(a5)
    60f8:	bfdfe06f          	j	4cf4 <_vfiprintf_r+0x118>
    60fc:	00600793          	li	a5,6
    6100:	00070d13          	mv	s10,a4
    6104:	0ce7e863          	bltu	a5,a4,61d4 <_vfiprintf_r+0x15f8>
    6108:	000d0e93          	mv	t4,s10
    610c:	00009817          	auipc	a6,0x9
    6110:	e1c80813          	add	a6,a6,-484 # ef28 <__fini_array_end+0x1d0>
    6114:	cb9fe06f          	j	4dcc <_vfiprintf_r+0x1f0>
    6118:	00000793          	li	a5,0
    611c:	00000593          	li	a1,0
    6120:	8f5ff06f          	j	5a14 <_vfiprintf_r+0xe38>
    6124:	05810713          	add	a4,sp,88
    6128:	00000693          	li	a3,0
    612c:	04c10613          	add	a2,sp,76
    6130:	00000593          	li	a1,0
    6134:	00040513          	mv	a0,s0
    6138:	01112e23          	sw	a7,28(sp)
    613c:	01012c23          	sw	a6,24(sp)
    6140:	01c12823          	sw	t3,16(sp)
    6144:	0f9040ef          	jal	aa3c <_wcsrtombs_r>
    6148:	fff00793          	li	a5,-1
    614c:	01012e03          	lw	t3,16(sp)
    6150:	01812803          	lw	a6,24(sp)
    6154:	01c12883          	lw	a7,28(sp)
    6158:	00050d13          	mv	s10,a0
    615c:	1ef50e63          	beq	a0,a5,6358 <_vfiprintf_r+0x177c>
    6160:	05012623          	sw	a6,76(sp)
    6164:	da9ff06f          	j	5f0c <_vfiprintf_r+0x1330>
    6168:	03012783          	lw	a5,48(sp)
    616c:	03412583          	lw	a1,52(sp)
    6170:	00000413          	li	s0,0
    6174:	40f989b3          	sub	s3,s3,a5
    6178:	00078613          	mv	a2,a5
    617c:	00098513          	mv	a0,s3
    6180:	6c8010ef          	jal	7848 <strncpy>
    6184:	001cc783          	lbu	a5,1(s9)
    6188:	00a00613          	li	a2,10
    618c:	00000693          	li	a3,0
    6190:	00f037b3          	snez	a5,a5
    6194:	000d8513          	mv	a0,s11
    6198:	000d0593          	mv	a1,s10
    619c:	00fc8cb3          	add	s9,s9,a5
    61a0:	1ec050ef          	jal	b38c <__udivdi3>
    61a4:	e8dff06f          	j	6030 <_vfiprintf_r+0x1454>
    61a8:	00000e93          	li	t4,0
    61ac:	00012823          	sw	zero,16(sp)
    61b0:	04314783          	lbu	a5,67(sp)
    61b4:	00000713          	li	a4,0
    61b8:	00000f93          	li	t6,0
    61bc:	a0079063          	bnez	a5,53bc <_vfiprintf_r+0x7e0>
    61c0:	c19fe06f          	j	4dd8 <_vfiprintf_r+0x1fc>
    61c4:	00100f13          	li	t5,1
    61c8:	00000613          	li	a2,0
    61cc:	000a0c13          	mv	s8,s4
    61d0:	ce9fe06f          	j	4eb8 <_vfiprintf_r+0x2dc>
    61d4:	00600d13          	li	s10,6
    61d8:	f31ff06f          	j	6108 <_vfiprintf_r+0x152c>
    61dc:	00100f13          	li	t5,1
    61e0:	000a0c13          	mv	s8,s4
    61e4:	c4dfe06f          	j	4e30 <_vfiprintf_r+0x254>
    61e8:	000aa783          	lw	a5,0(s5)
    61ec:	00c12703          	lw	a4,12(sp)
    61f0:	004a8a93          	add	s5,s5,4
    61f4:	00e79023          	sh	a4,0(a5)
    61f8:	afdfe06f          	j	4cf4 <_vfiprintf_r+0x118>
    61fc:	0ff7fd93          	zext.b	s11,a5
    6200:	00000d13          	li	s10,0
    6204:	a04ff06f          	j	5408 <_vfiprintf_r+0x82c>
    6208:	0ff7f793          	zext.b	a5,a5
    620c:	00000593          	li	a1,0
    6210:	bd1ff06f          	j	5de0 <_vfiprintf_r+0x1204>
    6214:	0ff7f793          	zext.b	a5,a5
    6218:	00000593          	li	a1,0
    621c:	a5cff06f          	j	5478 <_vfiprintf_r+0x89c>
    6220:	01879d93          	sll	s11,a5,0x18
    6224:	418ddd93          	sra	s11,s11,0x18
    6228:	41fddd13          	sra	s10,s11,0x1f
    622c:	000d0693          	mv	a3,s10
    6230:	95cff06f          	j	538c <_vfiprintf_r+0x7b0>
    6234:	03000793          	li	a5,48
    6238:	c8cff06f          	j	56c4 <_vfiprintf_r+0xae8>
    623c:	00012823          	sw	zero,16(sp)
    6240:	0ac10813          	add	a6,sp,172
    6244:	cfdff06f          	j	5f40 <_vfiprintf_r+0x1364>
    6248:	0589a503          	lw	a0,88(s3)
    624c:	b65fa0ef          	jal	db0 <__retarget_lock_release_recursive>
    6250:	d51fe06f          	j	4fa0 <_vfiprintf_r+0x3c4>
    6254:	00070e93          	mv	t4,a4
    6258:	00070d13          	mv	s10,a4
    625c:	f55ff06f          	j	61b0 <_vfiprintf_r+0x15d4>
    6260:	00900793          	li	a5,9
    6264:	ddb7e6e3          	bltu	a5,s11,6030 <_vfiprintf_r+0x1454>
    6268:	e19ff06f          	j	6080 <_vfiprintf_r+0x14a4>
    626c:	00058513          	mv	a0,a1
    6270:	00009317          	auipc	t1,0x9
    6274:	31430313          	add	t1,t1,788 # f584 <blanks.1>
    6278:	8cdff06f          	j	5b44 <_vfiprintf_r+0xf68>
    627c:	00080513          	mv	a0,a6
    6280:	03112023          	sw	a7,32(sp)
    6284:	01012c23          	sw	a6,24(sp)
    6288:	01b12e23          	sw	s11,28(sp)
    628c:	da9fa0ef          	jal	1034 <strlen>
    6290:	fff54e93          	not	t4,a0
    6294:	41fede93          	sra	t4,t4,0x1f
    6298:	01812803          	lw	a6,24(sp)
    629c:	01c12e03          	lw	t3,28(sp)
    62a0:	02012883          	lw	a7,32(sp)
    62a4:	00050d13          	mv	s10,a0
    62a8:	01d57eb3          	and	t4,a0,t4
    62ac:	00012823          	sw	zero,16(sp)
    62b0:	f01ff06f          	j	61b0 <_vfiprintf_r+0x15d4>
    62b4:	06010613          	add	a2,sp,96
    62b8:	00098593          	mv	a1,s3
    62bc:	00040513          	mv	a0,s0
    62c0:	fe0fe0ef          	jal	4aa0 <__sprint_r.part.0>
    62c4:	00051463          	bnez	a0,62cc <_vfiprintf_r+0x16f0>
    62c8:	dc5fe06f          	j	508c <_vfiprintf_r+0x4b0>
    62cc:	df5fe06f          	j	50c0 <_vfiprintf_r+0x4e4>
    62d0:	00168613          	add	a2,a3,1
    62d4:	00009317          	auipc	t1,0x9
    62d8:	2b030313          	add	t1,t1,688 # f584 <blanks.1>
    62dc:	f19fe06f          	j	51f4 <_vfiprintf_r+0x618>
    62e0:	000f0513          	mv	a0,t5
    62e4:	00009f97          	auipc	t6,0x9
    62e8:	290f8f93          	add	t6,t6,656 # f574 <zeroes.0>
    62ec:	d10ff06f          	j	57fc <_vfiprintf_r+0xc20>
    62f0:	0649a783          	lw	a5,100(s3)
    62f4:	0017f793          	and	a5,a5,1
    62f8:	00079c63          	bnez	a5,6310 <_vfiprintf_r+0x1734>
    62fc:	00c9d783          	lhu	a5,12(s3)
    6300:	2007f793          	and	a5,a5,512
    6304:	00079663          	bnez	a5,6310 <_vfiprintf_r+0x1734>
    6308:	0589a503          	lw	a0,88(s3)
    630c:	aa5fa0ef          	jal	db0 <__retarget_lock_release_recursive>
    6310:	fff00793          	li	a5,-1
    6314:	00f12623          	sw	a5,12(sp)
    6318:	de5fe06f          	j	50fc <_vfiprintf_r+0x520>
    631c:	00098713          	mv	a4,s3
    6320:	000c8a93          	mv	s5,s9
    6324:	000d0993          	mv	s3,s10
    6328:	01012c03          	lw	s8,16(sp)
    632c:	01812e03          	lw	t3,24(sp)
    6330:	01c12803          	lw	a6,28(sp)
    6334:	02012883          	lw	a7,32(sp)
    6338:	000d8c93          	mv	s9,s11
    633c:	00070d13          	mv	s10,a4
    6340:	bcdff06f          	j	5f0c <_vfiprintf_r+0x1330>
    6344:	00cd1783          	lh	a5,12(s10)
    6348:	000d0993          	mv	s3,s10
    634c:	0407e793          	or	a5,a5,64
    6350:	00fd1623          	sh	a5,12(s10)
    6354:	d71fe06f          	j	50c4 <_vfiprintf_r+0x4e8>
    6358:	00c99783          	lh	a5,12(s3)
    635c:	0407e793          	or	a5,a5,64
    6360:	00f99623          	sh	a5,12(s3)
    6364:	d61fe06f          	j	50c4 <_vfiprintf_r+0x4e8>
    6368:	000aa703          	lw	a4,0(s5)
    636c:	004a8a93          	add	s5,s5,4
    6370:	00075463          	bgez	a4,6378 <_vfiprintf_r+0x179c>
    6374:	fff00713          	li	a4,-1
    6378:	001cc683          	lbu	a3,1(s9)
    637c:	00058c93          	mv	s9,a1
    6380:	9ddfe06f          	j	4d5c <_vfiprintf_r+0x180>
    6384:	00c9d783          	lhu	a5,12(s3)
    6388:	0407e793          	or	a5,a5,64
    638c:	00f99623          	sh	a5,12(s3)
    6390:	d1dfe06f          	j	50ac <_vfiprintf_r+0x4d0>

00006394 <__sbprintf>:
    6394:	b7010113          	add	sp,sp,-1168
    6398:	00c59783          	lh	a5,12(a1)
    639c:	00e5d703          	lhu	a4,14(a1)
    63a0:	48812423          	sw	s0,1160(sp)
    63a4:	00058413          	mv	s0,a1
    63a8:	000105b7          	lui	a1,0x10
    63ac:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x82d>
    63b0:	06442303          	lw	t1,100(s0)
    63b4:	01c42883          	lw	a7,28(s0)
    63b8:	02442803          	lw	a6,36(s0)
    63bc:	01071713          	sll	a4,a4,0x10
    63c0:	00b7f7b3          	and	a5,a5,a1
    63c4:	00e7e7b3          	or	a5,a5,a4
    63c8:	40000593          	li	a1,1024
    63cc:	49212023          	sw	s2,1152(sp)
    63d0:	00f12a23          	sw	a5,20(sp)
    63d4:	00050913          	mv	s2,a0
    63d8:	07010793          	add	a5,sp,112
    63dc:	06010513          	add	a0,sp,96
    63e0:	48112623          	sw	ra,1164(sp)
    63e4:	48912223          	sw	s1,1156(sp)
    63e8:	47312e23          	sw	s3,1148(sp)
    63ec:	00060493          	mv	s1,a2
    63f0:	00068993          	mv	s3,a3
    63f4:	06612623          	sw	t1,108(sp)
    63f8:	03112223          	sw	a7,36(sp)
    63fc:	03012623          	sw	a6,44(sp)
    6400:	00f12423          	sw	a5,8(sp)
    6404:	00f12c23          	sw	a5,24(sp)
    6408:	00b12823          	sw	a1,16(sp)
    640c:	00b12e23          	sw	a1,28(sp)
    6410:	02012023          	sw	zero,32(sp)
    6414:	991fa0ef          	jal	da4 <__retarget_lock_init_recursive>
    6418:	00048613          	mv	a2,s1
    641c:	00098693          	mv	a3,s3
    6420:	00810593          	add	a1,sp,8
    6424:	00090513          	mv	a0,s2
    6428:	fb4fe0ef          	jal	4bdc <_vfiprintf_r>
    642c:	00050493          	mv	s1,a0
    6430:	04055263          	bgez	a0,6474 <__sbprintf+0xe0>
    6434:	01415783          	lhu	a5,20(sp)
    6438:	0407f793          	and	a5,a5,64
    643c:	00078863          	beqz	a5,644c <__sbprintf+0xb8>
    6440:	00c45783          	lhu	a5,12(s0)
    6444:	0407e793          	or	a5,a5,64
    6448:	00f41623          	sh	a5,12(s0)
    644c:	06012503          	lw	a0,96(sp)
    6450:	959fa0ef          	jal	da8 <__retarget_lock_close_recursive>
    6454:	48c12083          	lw	ra,1164(sp)
    6458:	48812403          	lw	s0,1160(sp)
    645c:	48012903          	lw	s2,1152(sp)
    6460:	47c12983          	lw	s3,1148(sp)
    6464:	00048513          	mv	a0,s1
    6468:	48412483          	lw	s1,1156(sp)
    646c:	49010113          	add	sp,sp,1168
    6470:	00008067          	ret
    6474:	00810593          	add	a1,sp,8
    6478:	00090513          	mv	a0,s2
    647c:	25c000ef          	jal	66d8 <_fflush_r>
    6480:	fa050ae3          	beqz	a0,6434 <__sbprintf+0xa0>
    6484:	fff00493          	li	s1,-1
    6488:	fadff06f          	j	6434 <__sbprintf+0xa0>

0000648c <__sflush_r>:
    648c:	00c59703          	lh	a4,12(a1)
    6490:	fe010113          	add	sp,sp,-32
    6494:	00812c23          	sw	s0,24(sp)
    6498:	01312623          	sw	s3,12(sp)
    649c:	00112e23          	sw	ra,28(sp)
    64a0:	00877793          	and	a5,a4,8
    64a4:	00058413          	mv	s0,a1
    64a8:	00050993          	mv	s3,a0
    64ac:	12079063          	bnez	a5,65cc <__sflush_r+0x140>
    64b0:	000017b7          	lui	a5,0x1
    64b4:	80078793          	add	a5,a5,-2048 # 800 <main+0x4bc>
    64b8:	0045a683          	lw	a3,4(a1)
    64bc:	00f767b3          	or	a5,a4,a5
    64c0:	00f59623          	sh	a5,12(a1)
    64c4:	18d05263          	blez	a3,6648 <__sflush_r+0x1bc>
    64c8:	02842803          	lw	a6,40(s0)
    64cc:	0e080463          	beqz	a6,65b4 <__sflush_r+0x128>
    64d0:	00912a23          	sw	s1,20(sp)
    64d4:	01371693          	sll	a3,a4,0x13
    64d8:	0009a483          	lw	s1,0(s3)
    64dc:	0009a023          	sw	zero,0(s3)
    64e0:	01c42583          	lw	a1,28(s0)
    64e4:	1606ce63          	bltz	a3,6660 <__sflush_r+0x1d4>
    64e8:	00000613          	li	a2,0
    64ec:	00100693          	li	a3,1
    64f0:	00098513          	mv	a0,s3
    64f4:	000800e7          	jalr	a6
    64f8:	fff00793          	li	a5,-1
    64fc:	00050613          	mv	a2,a0
    6500:	1af50463          	beq	a0,a5,66a8 <__sflush_r+0x21c>
    6504:	00c41783          	lh	a5,12(s0)
    6508:	02842803          	lw	a6,40(s0)
    650c:	01c42583          	lw	a1,28(s0)
    6510:	0047f793          	and	a5,a5,4
    6514:	00078e63          	beqz	a5,6530 <__sflush_r+0xa4>
    6518:	00442703          	lw	a4,4(s0)
    651c:	03042783          	lw	a5,48(s0)
    6520:	40e60633          	sub	a2,a2,a4
    6524:	00078663          	beqz	a5,6530 <__sflush_r+0xa4>
    6528:	03c42783          	lw	a5,60(s0)
    652c:	40f60633          	sub	a2,a2,a5
    6530:	00000693          	li	a3,0
    6534:	00098513          	mv	a0,s3
    6538:	000800e7          	jalr	a6
    653c:	fff00793          	li	a5,-1
    6540:	12f51463          	bne	a0,a5,6668 <__sflush_r+0x1dc>
    6544:	0009a683          	lw	a3,0(s3)
    6548:	01d00793          	li	a5,29
    654c:	00c41703          	lh	a4,12(s0)
    6550:	16d7ea63          	bltu	a5,a3,66c4 <__sflush_r+0x238>
    6554:	204007b7          	lui	a5,0x20400
    6558:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    655c:	00d7d7b3          	srl	a5,a5,a3
    6560:	0017f793          	and	a5,a5,1
    6564:	16078063          	beqz	a5,66c4 <__sflush_r+0x238>
    6568:	01042603          	lw	a2,16(s0)
    656c:	fffff7b7          	lui	a5,0xfffff
    6570:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6574:	00f777b3          	and	a5,a4,a5
    6578:	00f41623          	sh	a5,12(s0)
    657c:	00042223          	sw	zero,4(s0)
    6580:	00c42023          	sw	a2,0(s0)
    6584:	01371793          	sll	a5,a4,0x13
    6588:	0007d463          	bgez	a5,6590 <__sflush_r+0x104>
    658c:	10068263          	beqz	a3,6690 <__sflush_r+0x204>
    6590:	03042583          	lw	a1,48(s0)
    6594:	0099a023          	sw	s1,0(s3)
    6598:	10058463          	beqz	a1,66a0 <__sflush_r+0x214>
    659c:	04040793          	add	a5,s0,64
    65a0:	00f58663          	beq	a1,a5,65ac <__sflush_r+0x120>
    65a4:	00098513          	mv	a0,s3
    65a8:	c5dfa0ef          	jal	1204 <_free_r>
    65ac:	01412483          	lw	s1,20(sp)
    65b0:	02042823          	sw	zero,48(s0)
    65b4:	00000513          	li	a0,0
    65b8:	01c12083          	lw	ra,28(sp)
    65bc:	01812403          	lw	s0,24(sp)
    65c0:	00c12983          	lw	s3,12(sp)
    65c4:	02010113          	add	sp,sp,32
    65c8:	00008067          	ret
    65cc:	01212823          	sw	s2,16(sp)
    65d0:	0105a903          	lw	s2,16(a1)
    65d4:	08090263          	beqz	s2,6658 <__sflush_r+0x1cc>
    65d8:	00912a23          	sw	s1,20(sp)
    65dc:	0005a483          	lw	s1,0(a1)
    65e0:	00377713          	and	a4,a4,3
    65e4:	0125a023          	sw	s2,0(a1)
    65e8:	412484b3          	sub	s1,s1,s2
    65ec:	00000793          	li	a5,0
    65f0:	00071463          	bnez	a4,65f8 <__sflush_r+0x16c>
    65f4:	0145a783          	lw	a5,20(a1)
    65f8:	00f42423          	sw	a5,8(s0)
    65fc:	00904863          	bgtz	s1,660c <__sflush_r+0x180>
    6600:	0540006f          	j	6654 <__sflush_r+0x1c8>
    6604:	00a90933          	add	s2,s2,a0
    6608:	04905663          	blez	s1,6654 <__sflush_r+0x1c8>
    660c:	02442783          	lw	a5,36(s0)
    6610:	01c42583          	lw	a1,28(s0)
    6614:	00048693          	mv	a3,s1
    6618:	00090613          	mv	a2,s2
    661c:	00098513          	mv	a0,s3
    6620:	000780e7          	jalr	a5
    6624:	40a484b3          	sub	s1,s1,a0
    6628:	fca04ee3          	bgtz	a0,6604 <__sflush_r+0x178>
    662c:	00c41703          	lh	a4,12(s0)
    6630:	01012903          	lw	s2,16(sp)
    6634:	04076713          	or	a4,a4,64
    6638:	01412483          	lw	s1,20(sp)
    663c:	00e41623          	sh	a4,12(s0)
    6640:	fff00513          	li	a0,-1
    6644:	f75ff06f          	j	65b8 <__sflush_r+0x12c>
    6648:	03c5a683          	lw	a3,60(a1)
    664c:	e6d04ee3          	bgtz	a3,64c8 <__sflush_r+0x3c>
    6650:	f65ff06f          	j	65b4 <__sflush_r+0x128>
    6654:	01412483          	lw	s1,20(sp)
    6658:	01012903          	lw	s2,16(sp)
    665c:	f59ff06f          	j	65b4 <__sflush_r+0x128>
    6660:	05042603          	lw	a2,80(s0)
    6664:	eadff06f          	j	6510 <__sflush_r+0x84>
    6668:	00c41703          	lh	a4,12(s0)
    666c:	01042683          	lw	a3,16(s0)
    6670:	fffff7b7          	lui	a5,0xfffff
    6674:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6678:	00f777b3          	and	a5,a4,a5
    667c:	00f41623          	sh	a5,12(s0)
    6680:	00042223          	sw	zero,4(s0)
    6684:	00d42023          	sw	a3,0(s0)
    6688:	01371793          	sll	a5,a4,0x13
    668c:	f007d2e3          	bgez	a5,6590 <__sflush_r+0x104>
    6690:	03042583          	lw	a1,48(s0)
    6694:	04a42823          	sw	a0,80(s0)
    6698:	0099a023          	sw	s1,0(s3)
    669c:	f00590e3          	bnez	a1,659c <__sflush_r+0x110>
    66a0:	01412483          	lw	s1,20(sp)
    66a4:	f11ff06f          	j	65b4 <__sflush_r+0x128>
    66a8:	0009a783          	lw	a5,0(s3)
    66ac:	e4078ce3          	beqz	a5,6504 <__sflush_r+0x78>
    66b0:	01d00713          	li	a4,29
    66b4:	00e78c63          	beq	a5,a4,66cc <__sflush_r+0x240>
    66b8:	01600713          	li	a4,22
    66bc:	00e78863          	beq	a5,a4,66cc <__sflush_r+0x240>
    66c0:	00c41703          	lh	a4,12(s0)
    66c4:	04076713          	or	a4,a4,64
    66c8:	f71ff06f          	j	6638 <__sflush_r+0x1ac>
    66cc:	0099a023          	sw	s1,0(s3)
    66d0:	01412483          	lw	s1,20(sp)
    66d4:	ee1ff06f          	j	65b4 <__sflush_r+0x128>

000066d8 <_fflush_r>:
    66d8:	ff010113          	add	sp,sp,-16
    66dc:	00812423          	sw	s0,8(sp)
    66e0:	00912223          	sw	s1,4(sp)
    66e4:	00112623          	sw	ra,12(sp)
    66e8:	01212023          	sw	s2,0(sp)
    66ec:	00050493          	mv	s1,a0
    66f0:	00058413          	mv	s0,a1
    66f4:	00050663          	beqz	a0,6700 <_fflush_r+0x28>
    66f8:	03452783          	lw	a5,52(a0)
    66fc:	0a078a63          	beqz	a5,67b0 <_fflush_r+0xd8>
    6700:	00c41783          	lh	a5,12(s0)
    6704:	00000913          	li	s2,0
    6708:	04078063          	beqz	a5,6748 <_fflush_r+0x70>
    670c:	06442703          	lw	a4,100(s0)
    6710:	00177713          	and	a4,a4,1
    6714:	00071663          	bnez	a4,6720 <_fflush_r+0x48>
    6718:	2007f793          	and	a5,a5,512
    671c:	04078463          	beqz	a5,6764 <_fflush_r+0x8c>
    6720:	00040593          	mv	a1,s0
    6724:	00048513          	mv	a0,s1
    6728:	d65ff0ef          	jal	648c <__sflush_r>
    672c:	06442783          	lw	a5,100(s0)
    6730:	00050913          	mv	s2,a0
    6734:	0017f793          	and	a5,a5,1
    6738:	00079863          	bnez	a5,6748 <_fflush_r+0x70>
    673c:	00c45783          	lhu	a5,12(s0)
    6740:	2007f793          	and	a5,a5,512
    6744:	04078463          	beqz	a5,678c <_fflush_r+0xb4>
    6748:	00c12083          	lw	ra,12(sp)
    674c:	00812403          	lw	s0,8(sp)
    6750:	00412483          	lw	s1,4(sp)
    6754:	00090513          	mv	a0,s2
    6758:	00012903          	lw	s2,0(sp)
    675c:	01010113          	add	sp,sp,16
    6760:	00008067          	ret
    6764:	05842503          	lw	a0,88(s0)
    6768:	e44fa0ef          	jal	dac <__retarget_lock_acquire_recursive>
    676c:	00040593          	mv	a1,s0
    6770:	00048513          	mv	a0,s1
    6774:	d19ff0ef          	jal	648c <__sflush_r>
    6778:	06442783          	lw	a5,100(s0)
    677c:	00050913          	mv	s2,a0
    6780:	0017f793          	and	a5,a5,1
    6784:	fc0792e3          	bnez	a5,6748 <_fflush_r+0x70>
    6788:	fb5ff06f          	j	673c <_fflush_r+0x64>
    678c:	05842503          	lw	a0,88(s0)
    6790:	e20fa0ef          	jal	db0 <__retarget_lock_release_recursive>
    6794:	00c12083          	lw	ra,12(sp)
    6798:	00812403          	lw	s0,8(sp)
    679c:	00412483          	lw	s1,4(sp)
    67a0:	00090513          	mv	a0,s2
    67a4:	00012903          	lw	s2,0(sp)
    67a8:	01010113          	add	sp,sp,16
    67ac:	00008067          	ret
    67b0:	224000ef          	jal	69d4 <__sinit>
    67b4:	f4dff06f          	j	6700 <_fflush_r+0x28>

000067b8 <stdio_exit_handler>:
    67b8:	7fffa617          	auipc	a2,0x7fffa
    67bc:	d7060613          	add	a2,a2,-656 # 80000528 <__sglue>
    67c0:	00004597          	auipc	a1,0x4
    67c4:	28c58593          	add	a1,a1,652 # aa4c <_fclose_r>
    67c8:	7fffa517          	auipc	a0,0x7fffa
    67cc:	83850513          	add	a0,a0,-1992 # 80000000 <_impure_data>
    67d0:	7a00006f          	j	6f70 <_fwalk_sglue>

000067d4 <cleanup_stdio>:
    67d4:	00452583          	lw	a1,4(a0)
    67d8:	ff010113          	add	sp,sp,-16
    67dc:	00812423          	sw	s0,8(sp)
    67e0:	00112623          	sw	ra,12(sp)
    67e4:	7fffa797          	auipc	a5,0x7fffa
    67e8:	17878793          	add	a5,a5,376 # 8000095c <__sf>
    67ec:	00050413          	mv	s0,a0
    67f0:	00f58463          	beq	a1,a5,67f8 <cleanup_stdio+0x24>
    67f4:	258040ef          	jal	aa4c <_fclose_r>
    67f8:	00842583          	lw	a1,8(s0)
    67fc:	7fffa797          	auipc	a5,0x7fffa
    6800:	1c878793          	add	a5,a5,456 # 800009c4 <__sf+0x68>
    6804:	00f58663          	beq	a1,a5,6810 <cleanup_stdio+0x3c>
    6808:	00040513          	mv	a0,s0
    680c:	240040ef          	jal	aa4c <_fclose_r>
    6810:	00c42583          	lw	a1,12(s0)
    6814:	7fffa797          	auipc	a5,0x7fffa
    6818:	21878793          	add	a5,a5,536 # 80000a2c <__sf+0xd0>
    681c:	00f58c63          	beq	a1,a5,6834 <cleanup_stdio+0x60>
    6820:	00040513          	mv	a0,s0
    6824:	00812403          	lw	s0,8(sp)
    6828:	00c12083          	lw	ra,12(sp)
    682c:	01010113          	add	sp,sp,16
    6830:	21c0406f          	j	aa4c <_fclose_r>
    6834:	00c12083          	lw	ra,12(sp)
    6838:	00812403          	lw	s0,8(sp)
    683c:	01010113          	add	sp,sp,16
    6840:	00008067          	ret

00006844 <global_stdio_init.part.0>:
    6844:	fe010113          	add	sp,sp,-32
    6848:	00000797          	auipc	a5,0x0
    684c:	f7078793          	add	a5,a5,-144 # 67b8 <stdio_exit_handler>
    6850:	00112e23          	sw	ra,28(sp)
    6854:	00812c23          	sw	s0,24(sp)
    6858:	00912a23          	sw	s1,20(sp)
    685c:	7fffa417          	auipc	s0,0x7fffa
    6860:	10040413          	add	s0,s0,256 # 8000095c <__sf>
    6864:	01212823          	sw	s2,16(sp)
    6868:	01312623          	sw	s3,12(sp)
    686c:	01412423          	sw	s4,8(sp)
    6870:	00800613          	li	a2,8
    6874:	00000593          	li	a1,0
    6878:	7fffa717          	auipc	a4,0x7fffa
    687c:	eaf72c23          	sw	a5,-328(a4) # 80000730 <__stdio_exit_handler>
    6880:	7fffa517          	auipc	a0,0x7fffa
    6884:	13850513          	add	a0,a0,312 # 800009b8 <__sf+0x5c>
    6888:	00400793          	li	a5,4
    688c:	00f42623          	sw	a5,12(s0)
    6890:	00042023          	sw	zero,0(s0)
    6894:	00042223          	sw	zero,4(s0)
    6898:	00042423          	sw	zero,8(s0)
    689c:	06042223          	sw	zero,100(s0)
    68a0:	00042823          	sw	zero,16(s0)
    68a4:	00042a23          	sw	zero,20(s0)
    68a8:	00042c23          	sw	zero,24(s0)
    68ac:	d08fa0ef          	jal	db4 <memset>
    68b0:	00001a17          	auipc	s4,0x1
    68b4:	870a0a13          	add	s4,s4,-1936 # 7120 <__sread>
    68b8:	00001997          	auipc	s3,0x1
    68bc:	8c498993          	add	s3,s3,-1852 # 717c <__swrite>
    68c0:	00001917          	auipc	s2,0x1
    68c4:	94490913          	add	s2,s2,-1724 # 7204 <__sseek>
    68c8:	00001497          	auipc	s1,0x1
    68cc:	9b448493          	add	s1,s1,-1612 # 727c <__sclose>
    68d0:	7fffa517          	auipc	a0,0x7fffa
    68d4:	0e450513          	add	a0,a0,228 # 800009b4 <__sf+0x58>
    68d8:	03442023          	sw	s4,32(s0)
    68dc:	03342223          	sw	s3,36(s0)
    68e0:	03242423          	sw	s2,40(s0)
    68e4:	02942623          	sw	s1,44(s0)
    68e8:	00842e23          	sw	s0,28(s0)
    68ec:	cb8fa0ef          	jal	da4 <__retarget_lock_init_recursive>
    68f0:	000107b7          	lui	a5,0x10
    68f4:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x839>
    68f8:	00800613          	li	a2,8
    68fc:	00000593          	li	a1,0
    6900:	7fffa517          	auipc	a0,0x7fffa
    6904:	12050513          	add	a0,a0,288 # 80000a20 <__sf+0xc4>
    6908:	06f42a23          	sw	a5,116(s0)
    690c:	06042423          	sw	zero,104(s0)
    6910:	06042623          	sw	zero,108(s0)
    6914:	06042823          	sw	zero,112(s0)
    6918:	0c042623          	sw	zero,204(s0)
    691c:	06042c23          	sw	zero,120(s0)
    6920:	06042e23          	sw	zero,124(s0)
    6924:	08042023          	sw	zero,128(s0)
    6928:	c8cfa0ef          	jal	db4 <memset>
    692c:	7fffa797          	auipc	a5,0x7fffa
    6930:	09878793          	add	a5,a5,152 # 800009c4 <__sf+0x68>
    6934:	7fffa517          	auipc	a0,0x7fffa
    6938:	0e850513          	add	a0,a0,232 # 80000a1c <__sf+0xc0>
    693c:	08f42223          	sw	a5,132(s0)
    6940:	09442423          	sw	s4,136(s0)
    6944:	09342623          	sw	s3,140(s0)
    6948:	09242823          	sw	s2,144(s0)
    694c:	08942a23          	sw	s1,148(s0)
    6950:	c54fa0ef          	jal	da4 <__retarget_lock_init_recursive>
    6954:	000207b7          	lui	a5,0x20
    6958:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    695c:	00800613          	li	a2,8
    6960:	00000593          	li	a1,0
    6964:	7fffa517          	auipc	a0,0x7fffa
    6968:	12450513          	add	a0,a0,292 # 80000a88 <__sf+0x12c>
    696c:	0cf42e23          	sw	a5,220(s0)
    6970:	0c042823          	sw	zero,208(s0)
    6974:	0c042a23          	sw	zero,212(s0)
    6978:	0c042c23          	sw	zero,216(s0)
    697c:	12042a23          	sw	zero,308(s0)
    6980:	0e042023          	sw	zero,224(s0)
    6984:	0e042223          	sw	zero,228(s0)
    6988:	0e042423          	sw	zero,232(s0)
    698c:	c28fa0ef          	jal	db4 <memset>
    6990:	7fffa797          	auipc	a5,0x7fffa
    6994:	09c78793          	add	a5,a5,156 # 80000a2c <__sf+0xd0>
    6998:	0f442823          	sw	s4,240(s0)
    699c:	0f342a23          	sw	s3,244(s0)
    69a0:	0f242c23          	sw	s2,248(s0)
    69a4:	0e942e23          	sw	s1,252(s0)
    69a8:	0ef42623          	sw	a5,236(s0)
    69ac:	01812403          	lw	s0,24(sp)
    69b0:	01c12083          	lw	ra,28(sp)
    69b4:	01412483          	lw	s1,20(sp)
    69b8:	01012903          	lw	s2,16(sp)
    69bc:	00c12983          	lw	s3,12(sp)
    69c0:	00812a03          	lw	s4,8(sp)
    69c4:	7fffa517          	auipc	a0,0x7fffa
    69c8:	0c050513          	add	a0,a0,192 # 80000a84 <__sf+0x128>
    69cc:	02010113          	add	sp,sp,32
    69d0:	bd4fa06f          	j	da4 <__retarget_lock_init_recursive>

000069d4 <__sinit>:
    69d4:	ff010113          	add	sp,sp,-16
    69d8:	00812423          	sw	s0,8(sp)
    69dc:	00050413          	mv	s0,a0
    69e0:	7fffa517          	auipc	a0,0x7fffa
    69e4:	d4050513          	add	a0,a0,-704 # 80000720 <__lock___sfp_recursive_mutex>
    69e8:	00112623          	sw	ra,12(sp)
    69ec:	bc0fa0ef          	jal	dac <__retarget_lock_acquire_recursive>
    69f0:	03442783          	lw	a5,52(s0)
    69f4:	00079e63          	bnez	a5,6a10 <__sinit+0x3c>
    69f8:	00000797          	auipc	a5,0x0
    69fc:	ddc78793          	add	a5,a5,-548 # 67d4 <cleanup_stdio>
    6a00:	02f42a23          	sw	a5,52(s0)
    6a04:	7fffa797          	auipc	a5,0x7fffa
    6a08:	d2c7a783          	lw	a5,-724(a5) # 80000730 <__stdio_exit_handler>
    6a0c:	00078e63          	beqz	a5,6a28 <__sinit+0x54>
    6a10:	00812403          	lw	s0,8(sp)
    6a14:	00c12083          	lw	ra,12(sp)
    6a18:	7fffa517          	auipc	a0,0x7fffa
    6a1c:	d0850513          	add	a0,a0,-760 # 80000720 <__lock___sfp_recursive_mutex>
    6a20:	01010113          	add	sp,sp,16
    6a24:	b8cfa06f          	j	db0 <__retarget_lock_release_recursive>
    6a28:	e1dff0ef          	jal	6844 <global_stdio_init.part.0>
    6a2c:	00812403          	lw	s0,8(sp)
    6a30:	00c12083          	lw	ra,12(sp)
    6a34:	7fffa517          	auipc	a0,0x7fffa
    6a38:	cec50513          	add	a0,a0,-788 # 80000720 <__lock___sfp_recursive_mutex>
    6a3c:	01010113          	add	sp,sp,16
    6a40:	b70fa06f          	j	db0 <__retarget_lock_release_recursive>

00006a44 <__sfp_lock_acquire>:
    6a44:	7fffa517          	auipc	a0,0x7fffa
    6a48:	cdc50513          	add	a0,a0,-804 # 80000720 <__lock___sfp_recursive_mutex>
    6a4c:	b60fa06f          	j	dac <__retarget_lock_acquire_recursive>

00006a50 <__sfp_lock_release>:
    6a50:	7fffa517          	auipc	a0,0x7fffa
    6a54:	cd050513          	add	a0,a0,-816 # 80000720 <__lock___sfp_recursive_mutex>
    6a58:	b58fa06f          	j	db0 <__retarget_lock_release_recursive>

00006a5c <__sfvwrite_r>:
    6a5c:	00862783          	lw	a5,8(a2)
    6a60:	2c078463          	beqz	a5,6d28 <__sfvwrite_r+0x2cc>
    6a64:	00c59683          	lh	a3,12(a1)
    6a68:	fd010113          	add	sp,sp,-48
    6a6c:	02812423          	sw	s0,40(sp)
    6a70:	01412c23          	sw	s4,24(sp)
    6a74:	01612823          	sw	s6,16(sp)
    6a78:	02112623          	sw	ra,44(sp)
    6a7c:	0086f793          	and	a5,a3,8
    6a80:	00060b13          	mv	s6,a2
    6a84:	00050a13          	mv	s4,a0
    6a88:	00058413          	mv	s0,a1
    6a8c:	08078e63          	beqz	a5,6b28 <__sfvwrite_r+0xcc>
    6a90:	0105a783          	lw	a5,16(a1)
    6a94:	08078a63          	beqz	a5,6b28 <__sfvwrite_r+0xcc>
    6a98:	02912223          	sw	s1,36(sp)
    6a9c:	03212023          	sw	s2,32(sp)
    6aa0:	01312e23          	sw	s3,28(sp)
    6aa4:	01512a23          	sw	s5,20(sp)
    6aa8:	0026f793          	and	a5,a3,2
    6aac:	000b2483          	lw	s1,0(s6)
    6ab0:	0a078463          	beqz	a5,6b58 <__sfvwrite_r+0xfc>
    6ab4:	02442783          	lw	a5,36(s0)
    6ab8:	01c42583          	lw	a1,28(s0)
    6abc:	80000ab7          	lui	s5,0x80000
    6ac0:	00000993          	li	s3,0
    6ac4:	00000913          	li	s2,0
    6ac8:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6acc:	00098613          	mv	a2,s3
    6ad0:	000a0513          	mv	a0,s4
    6ad4:	04090263          	beqz	s2,6b18 <__sfvwrite_r+0xbc>
    6ad8:	00090693          	mv	a3,s2
    6adc:	012af463          	bgeu	s5,s2,6ae4 <__sfvwrite_r+0x88>
    6ae0:	000a8693          	mv	a3,s5
    6ae4:	000780e7          	jalr	a5
    6ae8:	46a05263          	blez	a0,6f4c <__sfvwrite_r+0x4f0>
    6aec:	008b2783          	lw	a5,8(s6)
    6af0:	00a989b3          	add	s3,s3,a0
    6af4:	40a90933          	sub	s2,s2,a0
    6af8:	40a787b3          	sub	a5,a5,a0
    6afc:	00fb2423          	sw	a5,8(s6)
    6b00:	1a078663          	beqz	a5,6cac <__sfvwrite_r+0x250>
    6b04:	02442783          	lw	a5,36(s0)
    6b08:	01c42583          	lw	a1,28(s0)
    6b0c:	00098613          	mv	a2,s3
    6b10:	000a0513          	mv	a0,s4
    6b14:	fc0912e3          	bnez	s2,6ad8 <__sfvwrite_r+0x7c>
    6b18:	0004a983          	lw	s3,0(s1)
    6b1c:	0044a903          	lw	s2,4(s1)
    6b20:	00848493          	add	s1,s1,8
    6b24:	fa9ff06f          	j	6acc <__sfvwrite_r+0x70>
    6b28:	00040593          	mv	a1,s0
    6b2c:	000a0513          	mv	a0,s4
    6b30:	0e5000ef          	jal	7414 <__swsetup_r>
    6b34:	1c051c63          	bnez	a0,6d0c <__sfvwrite_r+0x2b0>
    6b38:	00c41683          	lh	a3,12(s0)
    6b3c:	02912223          	sw	s1,36(sp)
    6b40:	03212023          	sw	s2,32(sp)
    6b44:	01312e23          	sw	s3,28(sp)
    6b48:	01512a23          	sw	s5,20(sp)
    6b4c:	0026f793          	and	a5,a3,2
    6b50:	000b2483          	lw	s1,0(s6)
    6b54:	f60790e3          	bnez	a5,6ab4 <__sfvwrite_r+0x58>
    6b58:	01712623          	sw	s7,12(sp)
    6b5c:	01812423          	sw	s8,8(sp)
    6b60:	0016f793          	and	a5,a3,1
    6b64:	1c079663          	bnez	a5,6d30 <__sfvwrite_r+0x2d4>
    6b68:	00042783          	lw	a5,0(s0)
    6b6c:	00842703          	lw	a4,8(s0)
    6b70:	80000ab7          	lui	s5,0x80000
    6b74:	01912223          	sw	s9,4(sp)
    6b78:	00000b93          	li	s7,0
    6b7c:	00000993          	li	s3,0
    6b80:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6b84:	00078513          	mv	a0,a5
    6b88:	00070c13          	mv	s8,a4
    6b8c:	10098263          	beqz	s3,6c90 <__sfvwrite_r+0x234>
    6b90:	2006f613          	and	a2,a3,512
    6b94:	28060863          	beqz	a2,6e24 <__sfvwrite_r+0x3c8>
    6b98:	00070c93          	mv	s9,a4
    6b9c:	32e9e863          	bltu	s3,a4,6ecc <__sfvwrite_r+0x470>
    6ba0:	4806f713          	and	a4,a3,1152
    6ba4:	08070a63          	beqz	a4,6c38 <__sfvwrite_r+0x1dc>
    6ba8:	01442603          	lw	a2,20(s0)
    6bac:	01042583          	lw	a1,16(s0)
    6bb0:	00161713          	sll	a4,a2,0x1
    6bb4:	00c70733          	add	a4,a4,a2
    6bb8:	40b78933          	sub	s2,a5,a1
    6bbc:	01f75c13          	srl	s8,a4,0x1f
    6bc0:	00ec0c33          	add	s8,s8,a4
    6bc4:	00190793          	add	a5,s2,1
    6bc8:	401c5c13          	sra	s8,s8,0x1
    6bcc:	013787b3          	add	a5,a5,s3
    6bd0:	000c0613          	mv	a2,s8
    6bd4:	00fc7663          	bgeu	s8,a5,6be0 <__sfvwrite_r+0x184>
    6bd8:	00078c13          	mv	s8,a5
    6bdc:	00078613          	mv	a2,a5
    6be0:	4006f693          	and	a3,a3,1024
    6be4:	32068063          	beqz	a3,6f04 <__sfvwrite_r+0x4a8>
    6be8:	00060593          	mv	a1,a2
    6bec:	000a0513          	mv	a0,s4
    6bf0:	921fa0ef          	jal	1510 <_malloc_r>
    6bf4:	00050c93          	mv	s9,a0
    6bf8:	34050e63          	beqz	a0,6f54 <__sfvwrite_r+0x4f8>
    6bfc:	01042583          	lw	a1,16(s0)
    6c00:	00090613          	mv	a2,s2
    6c04:	a8cfa0ef          	jal	e90 <memcpy>
    6c08:	00c45783          	lhu	a5,12(s0)
    6c0c:	b7f7f793          	and	a5,a5,-1153
    6c10:	0807e793          	or	a5,a5,128
    6c14:	00f41623          	sh	a5,12(s0)
    6c18:	012c8533          	add	a0,s9,s2
    6c1c:	412c07b3          	sub	a5,s8,s2
    6c20:	01942823          	sw	s9,16(s0)
    6c24:	01842a23          	sw	s8,20(s0)
    6c28:	00a42023          	sw	a0,0(s0)
    6c2c:	00098c13          	mv	s8,s3
    6c30:	00f42423          	sw	a5,8(s0)
    6c34:	00098c93          	mv	s9,s3
    6c38:	000c8613          	mv	a2,s9
    6c3c:	000b8593          	mv	a1,s7
    6c40:	6a9000ef          	jal	7ae8 <memmove>
    6c44:	00842703          	lw	a4,8(s0)
    6c48:	00042783          	lw	a5,0(s0)
    6c4c:	00098913          	mv	s2,s3
    6c50:	41870733          	sub	a4,a4,s8
    6c54:	019787b3          	add	a5,a5,s9
    6c58:	00e42423          	sw	a4,8(s0)
    6c5c:	00f42023          	sw	a5,0(s0)
    6c60:	00000993          	li	s3,0
    6c64:	008b2783          	lw	a5,8(s6)
    6c68:	012b8bb3          	add	s7,s7,s2
    6c6c:	412787b3          	sub	a5,a5,s2
    6c70:	00fb2423          	sw	a5,8(s6)
    6c74:	02078663          	beqz	a5,6ca0 <__sfvwrite_r+0x244>
    6c78:	00042783          	lw	a5,0(s0)
    6c7c:	00842703          	lw	a4,8(s0)
    6c80:	00c41683          	lh	a3,12(s0)
    6c84:	00078513          	mv	a0,a5
    6c88:	00070c13          	mv	s8,a4
    6c8c:	f00992e3          	bnez	s3,6b90 <__sfvwrite_r+0x134>
    6c90:	0004ab83          	lw	s7,0(s1)
    6c94:	0044a983          	lw	s3,4(s1)
    6c98:	00848493          	add	s1,s1,8
    6c9c:	ee9ff06f          	j	6b84 <__sfvwrite_r+0x128>
    6ca0:	00c12b83          	lw	s7,12(sp)
    6ca4:	00812c03          	lw	s8,8(sp)
    6ca8:	00412c83          	lw	s9,4(sp)
    6cac:	02c12083          	lw	ra,44(sp)
    6cb0:	02812403          	lw	s0,40(sp)
    6cb4:	02412483          	lw	s1,36(sp)
    6cb8:	02012903          	lw	s2,32(sp)
    6cbc:	01c12983          	lw	s3,28(sp)
    6cc0:	01412a83          	lw	s5,20(sp)
    6cc4:	01812a03          	lw	s4,24(sp)
    6cc8:	01012b03          	lw	s6,16(sp)
    6ccc:	00000513          	li	a0,0
    6cd0:	03010113          	add	sp,sp,48
    6cd4:	00008067          	ret
    6cd8:	00040593          	mv	a1,s0
    6cdc:	000a0513          	mv	a0,s4
    6ce0:	9f9ff0ef          	jal	66d8 <_fflush_r>
    6ce4:	0a050e63          	beqz	a0,6da0 <__sfvwrite_r+0x344>
    6ce8:	00c41783          	lh	a5,12(s0)
    6cec:	00c12b83          	lw	s7,12(sp)
    6cf0:	00812c03          	lw	s8,8(sp)
    6cf4:	02412483          	lw	s1,36(sp)
    6cf8:	02012903          	lw	s2,32(sp)
    6cfc:	01c12983          	lw	s3,28(sp)
    6d00:	01412a83          	lw	s5,20(sp)
    6d04:	0407e793          	or	a5,a5,64
    6d08:	00f41623          	sh	a5,12(s0)
    6d0c:	02c12083          	lw	ra,44(sp)
    6d10:	02812403          	lw	s0,40(sp)
    6d14:	01812a03          	lw	s4,24(sp)
    6d18:	01012b03          	lw	s6,16(sp)
    6d1c:	fff00513          	li	a0,-1
    6d20:	03010113          	add	sp,sp,48
    6d24:	00008067          	ret
    6d28:	00000513          	li	a0,0
    6d2c:	00008067          	ret
    6d30:	00000a93          	li	s5,0
    6d34:	00000513          	li	a0,0
    6d38:	00000c13          	li	s8,0
    6d3c:	00000993          	li	s3,0
    6d40:	08098263          	beqz	s3,6dc4 <__sfvwrite_r+0x368>
    6d44:	08050a63          	beqz	a0,6dd8 <__sfvwrite_r+0x37c>
    6d48:	000a8793          	mv	a5,s5
    6d4c:	00098b93          	mv	s7,s3
    6d50:	0137f463          	bgeu	a5,s3,6d58 <__sfvwrite_r+0x2fc>
    6d54:	00078b93          	mv	s7,a5
    6d58:	00042503          	lw	a0,0(s0)
    6d5c:	01042783          	lw	a5,16(s0)
    6d60:	00842903          	lw	s2,8(s0)
    6d64:	01442683          	lw	a3,20(s0)
    6d68:	00a7f663          	bgeu	a5,a0,6d74 <__sfvwrite_r+0x318>
    6d6c:	00d90933          	add	s2,s2,a3
    6d70:	09794463          	blt	s2,s7,6df8 <__sfvwrite_r+0x39c>
    6d74:	16dbc263          	blt	s7,a3,6ed8 <__sfvwrite_r+0x47c>
    6d78:	02442783          	lw	a5,36(s0)
    6d7c:	01c42583          	lw	a1,28(s0)
    6d80:	000c0613          	mv	a2,s8
    6d84:	000a0513          	mv	a0,s4
    6d88:	000780e7          	jalr	a5
    6d8c:	00050913          	mv	s2,a0
    6d90:	f4a05ce3          	blez	a0,6ce8 <__sfvwrite_r+0x28c>
    6d94:	412a8ab3          	sub	s5,s5,s2
    6d98:	00100513          	li	a0,1
    6d9c:	f20a8ee3          	beqz	s5,6cd8 <__sfvwrite_r+0x27c>
    6da0:	008b2783          	lw	a5,8(s6)
    6da4:	012c0c33          	add	s8,s8,s2
    6da8:	412989b3          	sub	s3,s3,s2
    6dac:	412787b3          	sub	a5,a5,s2
    6db0:	00fb2423          	sw	a5,8(s6)
    6db4:	f80796e3          	bnez	a5,6d40 <__sfvwrite_r+0x2e4>
    6db8:	00c12b83          	lw	s7,12(sp)
    6dbc:	00812c03          	lw	s8,8(sp)
    6dc0:	eedff06f          	j	6cac <__sfvwrite_r+0x250>
    6dc4:	0044a983          	lw	s3,4(s1)
    6dc8:	00048793          	mv	a5,s1
    6dcc:	00848493          	add	s1,s1,8
    6dd0:	fe098ae3          	beqz	s3,6dc4 <__sfvwrite_r+0x368>
    6dd4:	0007ac03          	lw	s8,0(a5)
    6dd8:	00098613          	mv	a2,s3
    6ddc:	00a00593          	li	a1,10
    6de0:	000c0513          	mv	a0,s8
    6de4:	1a1000ef          	jal	7784 <memchr>
    6de8:	14050c63          	beqz	a0,6f40 <__sfvwrite_r+0x4e4>
    6dec:	00150513          	add	a0,a0,1
    6df0:	41850ab3          	sub	s5,a0,s8
    6df4:	f55ff06f          	j	6d48 <__sfvwrite_r+0x2ec>
    6df8:	000c0593          	mv	a1,s8
    6dfc:	00090613          	mv	a2,s2
    6e00:	4e9000ef          	jal	7ae8 <memmove>
    6e04:	00042783          	lw	a5,0(s0)
    6e08:	00040593          	mv	a1,s0
    6e0c:	000a0513          	mv	a0,s4
    6e10:	012787b3          	add	a5,a5,s2
    6e14:	00f42023          	sw	a5,0(s0)
    6e18:	8c1ff0ef          	jal	66d8 <_fflush_r>
    6e1c:	f6050ce3          	beqz	a0,6d94 <__sfvwrite_r+0x338>
    6e20:	ec9ff06f          	j	6ce8 <__sfvwrite_r+0x28c>
    6e24:	01042683          	lw	a3,16(s0)
    6e28:	04f6e463          	bltu	a3,a5,6e70 <__sfvwrite_r+0x414>
    6e2c:	01442583          	lw	a1,20(s0)
    6e30:	04b9e063          	bltu	s3,a1,6e70 <__sfvwrite_r+0x414>
    6e34:	00098913          	mv	s2,s3
    6e38:	013af463          	bgeu	s5,s3,6e40 <__sfvwrite_r+0x3e4>
    6e3c:	000a8913          	mv	s2,s5
    6e40:	00090513          	mv	a0,s2
    6e44:	65d070ef          	jal	eca0 <__modsi3>
    6e48:	02442783          	lw	a5,36(s0)
    6e4c:	01c42583          	lw	a1,28(s0)
    6e50:	40a906b3          	sub	a3,s2,a0
    6e54:	000b8613          	mv	a2,s7
    6e58:	000a0513          	mv	a0,s4
    6e5c:	000780e7          	jalr	a5
    6e60:	00050913          	mv	s2,a0
    6e64:	04a05a63          	blez	a0,6eb8 <__sfvwrite_r+0x45c>
    6e68:	412989b3          	sub	s3,s3,s2
    6e6c:	df9ff06f          	j	6c64 <__sfvwrite_r+0x208>
    6e70:	00070913          	mv	s2,a4
    6e74:	00e9f463          	bgeu	s3,a4,6e7c <__sfvwrite_r+0x420>
    6e78:	00098913          	mv	s2,s3
    6e7c:	00078513          	mv	a0,a5
    6e80:	00090613          	mv	a2,s2
    6e84:	000b8593          	mv	a1,s7
    6e88:	461000ef          	jal	7ae8 <memmove>
    6e8c:	00842703          	lw	a4,8(s0)
    6e90:	00042783          	lw	a5,0(s0)
    6e94:	41270733          	sub	a4,a4,s2
    6e98:	012787b3          	add	a5,a5,s2
    6e9c:	00e42423          	sw	a4,8(s0)
    6ea0:	00f42023          	sw	a5,0(s0)
    6ea4:	fc0712e3          	bnez	a4,6e68 <__sfvwrite_r+0x40c>
    6ea8:	00040593          	mv	a1,s0
    6eac:	000a0513          	mv	a0,s4
    6eb0:	829ff0ef          	jal	66d8 <_fflush_r>
    6eb4:	fa050ae3          	beqz	a0,6e68 <__sfvwrite_r+0x40c>
    6eb8:	00c41783          	lh	a5,12(s0)
    6ebc:	00c12b83          	lw	s7,12(sp)
    6ec0:	00812c03          	lw	s8,8(sp)
    6ec4:	00412c83          	lw	s9,4(sp)
    6ec8:	e2dff06f          	j	6cf4 <__sfvwrite_r+0x298>
    6ecc:	00098c13          	mv	s8,s3
    6ed0:	00098c93          	mv	s9,s3
    6ed4:	d65ff06f          	j	6c38 <__sfvwrite_r+0x1dc>
    6ed8:	000b8613          	mv	a2,s7
    6edc:	000c0593          	mv	a1,s8
    6ee0:	409000ef          	jal	7ae8 <memmove>
    6ee4:	00842703          	lw	a4,8(s0)
    6ee8:	00042783          	lw	a5,0(s0)
    6eec:	000b8913          	mv	s2,s7
    6ef0:	41770733          	sub	a4,a4,s7
    6ef4:	017787b3          	add	a5,a5,s7
    6ef8:	00e42423          	sw	a4,8(s0)
    6efc:	00f42023          	sw	a5,0(s0)
    6f00:	e95ff06f          	j	6d94 <__sfvwrite_r+0x338>
    6f04:	000a0513          	mv	a0,s4
    6f08:	508030ef          	jal	a410 <_realloc_r>
    6f0c:	00050c93          	mv	s9,a0
    6f10:	d00514e3          	bnez	a0,6c18 <__sfvwrite_r+0x1bc>
    6f14:	01042583          	lw	a1,16(s0)
    6f18:	000a0513          	mv	a0,s4
    6f1c:	ae8fa0ef          	jal	1204 <_free_r>
    6f20:	00c41783          	lh	a5,12(s0)
    6f24:	00c00713          	li	a4,12
    6f28:	00c12b83          	lw	s7,12(sp)
    6f2c:	00812c03          	lw	s8,8(sp)
    6f30:	00412c83          	lw	s9,4(sp)
    6f34:	00ea2023          	sw	a4,0(s4)
    6f38:	f7f7f793          	and	a5,a5,-129
    6f3c:	db9ff06f          	j	6cf4 <__sfvwrite_r+0x298>
    6f40:	00198793          	add	a5,s3,1
    6f44:	00078a93          	mv	s5,a5
    6f48:	e05ff06f          	j	6d4c <__sfvwrite_r+0x2f0>
    6f4c:	00c41783          	lh	a5,12(s0)
    6f50:	da5ff06f          	j	6cf4 <__sfvwrite_r+0x298>
    6f54:	00c00713          	li	a4,12
    6f58:	00c41783          	lh	a5,12(s0)
    6f5c:	00c12b83          	lw	s7,12(sp)
    6f60:	00812c03          	lw	s8,8(sp)
    6f64:	00412c83          	lw	s9,4(sp)
    6f68:	00ea2023          	sw	a4,0(s4)
    6f6c:	d89ff06f          	j	6cf4 <__sfvwrite_r+0x298>

00006f70 <_fwalk_sglue>:
    6f70:	fd010113          	add	sp,sp,-48
    6f74:	03212023          	sw	s2,32(sp)
    6f78:	01312e23          	sw	s3,28(sp)
    6f7c:	01412c23          	sw	s4,24(sp)
    6f80:	01512a23          	sw	s5,20(sp)
    6f84:	01612823          	sw	s6,16(sp)
    6f88:	01712623          	sw	s7,12(sp)
    6f8c:	02112623          	sw	ra,44(sp)
    6f90:	02812423          	sw	s0,40(sp)
    6f94:	02912223          	sw	s1,36(sp)
    6f98:	00050b13          	mv	s6,a0
    6f9c:	00058b93          	mv	s7,a1
    6fa0:	00060a93          	mv	s5,a2
    6fa4:	00000a13          	li	s4,0
    6fa8:	00100993          	li	s3,1
    6fac:	fff00913          	li	s2,-1
    6fb0:	004aa483          	lw	s1,4(s5)
    6fb4:	008aa403          	lw	s0,8(s5)
    6fb8:	fff48493          	add	s1,s1,-1
    6fbc:	0204c863          	bltz	s1,6fec <_fwalk_sglue+0x7c>
    6fc0:	00c45783          	lhu	a5,12(s0)
    6fc4:	00f9fe63          	bgeu	s3,a5,6fe0 <_fwalk_sglue+0x70>
    6fc8:	00e41783          	lh	a5,14(s0)
    6fcc:	00040593          	mv	a1,s0
    6fd0:	000b0513          	mv	a0,s6
    6fd4:	01278663          	beq	a5,s2,6fe0 <_fwalk_sglue+0x70>
    6fd8:	000b80e7          	jalr	s7
    6fdc:	00aa6a33          	or	s4,s4,a0
    6fe0:	fff48493          	add	s1,s1,-1
    6fe4:	06840413          	add	s0,s0,104
    6fe8:	fd249ce3          	bne	s1,s2,6fc0 <_fwalk_sglue+0x50>
    6fec:	000aaa83          	lw	s5,0(s5)
    6ff0:	fc0a90e3          	bnez	s5,6fb0 <_fwalk_sglue+0x40>
    6ff4:	02c12083          	lw	ra,44(sp)
    6ff8:	02812403          	lw	s0,40(sp)
    6ffc:	02412483          	lw	s1,36(sp)
    7000:	02012903          	lw	s2,32(sp)
    7004:	01c12983          	lw	s3,28(sp)
    7008:	01412a83          	lw	s5,20(sp)
    700c:	01012b03          	lw	s6,16(sp)
    7010:	00c12b83          	lw	s7,12(sp)
    7014:	000a0513          	mv	a0,s4
    7018:	01812a03          	lw	s4,24(sp)
    701c:	03010113          	add	sp,sp,48
    7020:	00008067          	ret

00007024 <_putc_r>:
    7024:	fe010113          	add	sp,sp,-32
    7028:	00812c23          	sw	s0,24(sp)
    702c:	01212a23          	sw	s2,20(sp)
    7030:	00112e23          	sw	ra,28(sp)
    7034:	00050913          	mv	s2,a0
    7038:	00060413          	mv	s0,a2
    703c:	00050663          	beqz	a0,7048 <_putc_r+0x24>
    7040:	03452783          	lw	a5,52(a0)
    7044:	0c078663          	beqz	a5,7110 <_putc_r+0xec>
    7048:	06442783          	lw	a5,100(s0)
    704c:	0017f793          	and	a5,a5,1
    7050:	00079863          	bnez	a5,7060 <_putc_r+0x3c>
    7054:	00c45783          	lhu	a5,12(s0)
    7058:	2007f793          	and	a5,a5,512
    705c:	08078063          	beqz	a5,70dc <_putc_r+0xb8>
    7060:	00842783          	lw	a5,8(s0)
    7064:	fff78793          	add	a5,a5,-1
    7068:	00f42423          	sw	a5,8(s0)
    706c:	0007dc63          	bgez	a5,7084 <_putc_r+0x60>
    7070:	01842703          	lw	a4,24(s0)
    7074:	04e7ca63          	blt	a5,a4,70c8 <_putc_r+0xa4>
    7078:	0ff5f793          	zext.b	a5,a1
    707c:	00a00713          	li	a4,10
    7080:	04e78463          	beq	a5,a4,70c8 <_putc_r+0xa4>
    7084:	00042783          	lw	a5,0(s0)
    7088:	0ff5f913          	zext.b	s2,a1
    708c:	00178713          	add	a4,a5,1
    7090:	00e42023          	sw	a4,0(s0)
    7094:	00b78023          	sb	a1,0(a5)
    7098:	06442783          	lw	a5,100(s0)
    709c:	0017f793          	and	a5,a5,1
    70a0:	00079863          	bnez	a5,70b0 <_putc_r+0x8c>
    70a4:	00c45783          	lhu	a5,12(s0)
    70a8:	2007f793          	and	a5,a5,512
    70ac:	04078263          	beqz	a5,70f0 <_putc_r+0xcc>
    70b0:	01c12083          	lw	ra,28(sp)
    70b4:	01812403          	lw	s0,24(sp)
    70b8:	00090513          	mv	a0,s2
    70bc:	01412903          	lw	s2,20(sp)
    70c0:	02010113          	add	sp,sp,32
    70c4:	00008067          	ret
    70c8:	00090513          	mv	a0,s2
    70cc:	00040613          	mv	a2,s0
    70d0:	1b4000ef          	jal	7284 <__swbuf_r>
    70d4:	00050913          	mv	s2,a0
    70d8:	fc1ff06f          	j	7098 <_putc_r+0x74>
    70dc:	05842503          	lw	a0,88(s0)
    70e0:	00b12623          	sw	a1,12(sp)
    70e4:	cc9f90ef          	jal	dac <__retarget_lock_acquire_recursive>
    70e8:	00c12583          	lw	a1,12(sp)
    70ec:	f75ff06f          	j	7060 <_putc_r+0x3c>
    70f0:	05842503          	lw	a0,88(s0)
    70f4:	cbdf90ef          	jal	db0 <__retarget_lock_release_recursive>
    70f8:	01c12083          	lw	ra,28(sp)
    70fc:	01812403          	lw	s0,24(sp)
    7100:	00090513          	mv	a0,s2
    7104:	01412903          	lw	s2,20(sp)
    7108:	02010113          	add	sp,sp,32
    710c:	00008067          	ret
    7110:	00b12623          	sw	a1,12(sp)
    7114:	8c1ff0ef          	jal	69d4 <__sinit>
    7118:	00c12583          	lw	a1,12(sp)
    711c:	f2dff06f          	j	7048 <_putc_r+0x24>

00007120 <__sread>:
    7120:	ff010113          	add	sp,sp,-16
    7124:	00812423          	sw	s0,8(sp)
    7128:	00058413          	mv	s0,a1
    712c:	00e59583          	lh	a1,14(a1)
    7130:	00112623          	sw	ra,12(sp)
    7134:	095000ef          	jal	79c8 <_read_r>
    7138:	02054063          	bltz	a0,7158 <__sread+0x38>
    713c:	05042783          	lw	a5,80(s0)
    7140:	00c12083          	lw	ra,12(sp)
    7144:	00a787b3          	add	a5,a5,a0
    7148:	04f42823          	sw	a5,80(s0)
    714c:	00812403          	lw	s0,8(sp)
    7150:	01010113          	add	sp,sp,16
    7154:	00008067          	ret
    7158:	00c45783          	lhu	a5,12(s0)
    715c:	fffff737          	lui	a4,0xfffff
    7160:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7164:	00e7f7b3          	and	a5,a5,a4
    7168:	00c12083          	lw	ra,12(sp)
    716c:	00f41623          	sh	a5,12(s0)
    7170:	00812403          	lw	s0,8(sp)
    7174:	01010113          	add	sp,sp,16
    7178:	00008067          	ret

0000717c <__swrite>:
    717c:	00c59783          	lh	a5,12(a1)
    7180:	fe010113          	add	sp,sp,-32
    7184:	00812c23          	sw	s0,24(sp)
    7188:	00912a23          	sw	s1,20(sp)
    718c:	01212823          	sw	s2,16(sp)
    7190:	01312623          	sw	s3,12(sp)
    7194:	00112e23          	sw	ra,28(sp)
    7198:	1007f713          	and	a4,a5,256
    719c:	00058413          	mv	s0,a1
    71a0:	00050493          	mv	s1,a0
    71a4:	00060913          	mv	s2,a2
    71a8:	00068993          	mv	s3,a3
    71ac:	04071063          	bnez	a4,71ec <__swrite+0x70>
    71b0:	fffff737          	lui	a4,0xfffff
    71b4:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    71b8:	00e7f7b3          	and	a5,a5,a4
    71bc:	00e41583          	lh	a1,14(s0)
    71c0:	00f41623          	sh	a5,12(s0)
    71c4:	01812403          	lw	s0,24(sp)
    71c8:	01c12083          	lw	ra,28(sp)
    71cc:	00098693          	mv	a3,s3
    71d0:	00090613          	mv	a2,s2
    71d4:	00c12983          	lw	s3,12(sp)
    71d8:	01012903          	lw	s2,16(sp)
    71dc:	00048513          	mv	a0,s1
    71e0:	01412483          	lw	s1,20(sp)
    71e4:	02010113          	add	sp,sp,32
    71e8:	09d0006f          	j	7a84 <_write_r>
    71ec:	00e59583          	lh	a1,14(a1)
    71f0:	00200693          	li	a3,2
    71f4:	00000613          	li	a2,0
    71f8:	76c000ef          	jal	7964 <_lseek_r>
    71fc:	00c41783          	lh	a5,12(s0)
    7200:	fb1ff06f          	j	71b0 <__swrite+0x34>

00007204 <__sseek>:
    7204:	ff010113          	add	sp,sp,-16
    7208:	00812423          	sw	s0,8(sp)
    720c:	00058413          	mv	s0,a1
    7210:	00e59583          	lh	a1,14(a1)
    7214:	00112623          	sw	ra,12(sp)
    7218:	74c000ef          	jal	7964 <_lseek_r>
    721c:	fff00793          	li	a5,-1
    7220:	02f50863          	beq	a0,a5,7250 <__sseek+0x4c>
    7224:	00c45783          	lhu	a5,12(s0)
    7228:	00001737          	lui	a4,0x1
    722c:	00c12083          	lw	ra,12(sp)
    7230:	00e7e7b3          	or	a5,a5,a4
    7234:	01079793          	sll	a5,a5,0x10
    7238:	4107d793          	sra	a5,a5,0x10
    723c:	04a42823          	sw	a0,80(s0)
    7240:	00f41623          	sh	a5,12(s0)
    7244:	00812403          	lw	s0,8(sp)
    7248:	01010113          	add	sp,sp,16
    724c:	00008067          	ret
    7250:	00c45783          	lhu	a5,12(s0)
    7254:	fffff737          	lui	a4,0xfffff
    7258:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    725c:	00e7f7b3          	and	a5,a5,a4
    7260:	01079793          	sll	a5,a5,0x10
    7264:	4107d793          	sra	a5,a5,0x10
    7268:	00c12083          	lw	ra,12(sp)
    726c:	00f41623          	sh	a5,12(s0)
    7270:	00812403          	lw	s0,8(sp)
    7274:	01010113          	add	sp,sp,16
    7278:	00008067          	ret

0000727c <__sclose>:
    727c:	00e59583          	lh	a1,14(a1)
    7280:	68c0006f          	j	790c <_close_r>

00007284 <__swbuf_r>:
    7284:	fe010113          	add	sp,sp,-32
    7288:	00812c23          	sw	s0,24(sp)
    728c:	00912a23          	sw	s1,20(sp)
    7290:	01212823          	sw	s2,16(sp)
    7294:	00112e23          	sw	ra,28(sp)
    7298:	00050913          	mv	s2,a0
    729c:	00058493          	mv	s1,a1
    72a0:	00060413          	mv	s0,a2
    72a4:	00050663          	beqz	a0,72b0 <__swbuf_r+0x2c>
    72a8:	03452783          	lw	a5,52(a0)
    72ac:	16078063          	beqz	a5,740c <__swbuf_r+0x188>
    72b0:	01842783          	lw	a5,24(s0)
    72b4:	00c41703          	lh	a4,12(s0)
    72b8:	00f42423          	sw	a5,8(s0)
    72bc:	00877793          	and	a5,a4,8
    72c0:	08078063          	beqz	a5,7340 <__swbuf_r+0xbc>
    72c4:	01042783          	lw	a5,16(s0)
    72c8:	06078c63          	beqz	a5,7340 <__swbuf_r+0xbc>
    72cc:	01312623          	sw	s3,12(sp)
    72d0:	01271693          	sll	a3,a4,0x12
    72d4:	0ff4f993          	zext.b	s3,s1
    72d8:	0ff4f493          	zext.b	s1,s1
    72dc:	0806d863          	bgez	a3,736c <__swbuf_r+0xe8>
    72e0:	00042703          	lw	a4,0(s0)
    72e4:	01442683          	lw	a3,20(s0)
    72e8:	40f707b3          	sub	a5,a4,a5
    72ec:	0ad7d863          	bge	a5,a3,739c <__swbuf_r+0x118>
    72f0:	00842683          	lw	a3,8(s0)
    72f4:	00170613          	add	a2,a4,1
    72f8:	00c42023          	sw	a2,0(s0)
    72fc:	fff68693          	add	a3,a3,-1
    7300:	00d42423          	sw	a3,8(s0)
    7304:	01370023          	sb	s3,0(a4)
    7308:	01442703          	lw	a4,20(s0)
    730c:	00178793          	add	a5,a5,1
    7310:	0cf70263          	beq	a4,a5,73d4 <__swbuf_r+0x150>
    7314:	00c45783          	lhu	a5,12(s0)
    7318:	0017f793          	and	a5,a5,1
    731c:	0c079a63          	bnez	a5,73f0 <__swbuf_r+0x16c>
    7320:	00c12983          	lw	s3,12(sp)
    7324:	01c12083          	lw	ra,28(sp)
    7328:	01812403          	lw	s0,24(sp)
    732c:	01012903          	lw	s2,16(sp)
    7330:	00048513          	mv	a0,s1
    7334:	01412483          	lw	s1,20(sp)
    7338:	02010113          	add	sp,sp,32
    733c:	00008067          	ret
    7340:	00040593          	mv	a1,s0
    7344:	00090513          	mv	a0,s2
    7348:	0cc000ef          	jal	7414 <__swsetup_r>
    734c:	08051e63          	bnez	a0,73e8 <__swbuf_r+0x164>
    7350:	00c41703          	lh	a4,12(s0)
    7354:	01312623          	sw	s3,12(sp)
    7358:	01042783          	lw	a5,16(s0)
    735c:	01271693          	sll	a3,a4,0x12
    7360:	0ff4f993          	zext.b	s3,s1
    7364:	0ff4f493          	zext.b	s1,s1
    7368:	f606cce3          	bltz	a3,72e0 <__swbuf_r+0x5c>
    736c:	06442683          	lw	a3,100(s0)
    7370:	ffffe637          	lui	a2,0xffffe
    7374:	000025b7          	lui	a1,0x2
    7378:	00b76733          	or	a4,a4,a1
    737c:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    7380:	00c6f6b3          	and	a3,a3,a2
    7384:	00e41623          	sh	a4,12(s0)
    7388:	00042703          	lw	a4,0(s0)
    738c:	06d42223          	sw	a3,100(s0)
    7390:	01442683          	lw	a3,20(s0)
    7394:	40f707b3          	sub	a5,a4,a5
    7398:	f4d7cce3          	blt	a5,a3,72f0 <__swbuf_r+0x6c>
    739c:	00040593          	mv	a1,s0
    73a0:	00090513          	mv	a0,s2
    73a4:	b34ff0ef          	jal	66d8 <_fflush_r>
    73a8:	02051e63          	bnez	a0,73e4 <__swbuf_r+0x160>
    73ac:	00042703          	lw	a4,0(s0)
    73b0:	00842683          	lw	a3,8(s0)
    73b4:	00100793          	li	a5,1
    73b8:	00170613          	add	a2,a4,1
    73bc:	fff68693          	add	a3,a3,-1
    73c0:	00c42023          	sw	a2,0(s0)
    73c4:	00d42423          	sw	a3,8(s0)
    73c8:	01370023          	sb	s3,0(a4)
    73cc:	01442703          	lw	a4,20(s0)
    73d0:	f4f712e3          	bne	a4,a5,7314 <__swbuf_r+0x90>
    73d4:	00040593          	mv	a1,s0
    73d8:	00090513          	mv	a0,s2
    73dc:	afcff0ef          	jal	66d8 <_fflush_r>
    73e0:	f40500e3          	beqz	a0,7320 <__swbuf_r+0x9c>
    73e4:	00c12983          	lw	s3,12(sp)
    73e8:	fff00493          	li	s1,-1
    73ec:	f39ff06f          	j	7324 <__swbuf_r+0xa0>
    73f0:	00a00793          	li	a5,10
    73f4:	f2f496e3          	bne	s1,a5,7320 <__swbuf_r+0x9c>
    73f8:	00040593          	mv	a1,s0
    73fc:	00090513          	mv	a0,s2
    7400:	ad8ff0ef          	jal	66d8 <_fflush_r>
    7404:	f0050ee3          	beqz	a0,7320 <__swbuf_r+0x9c>
    7408:	fddff06f          	j	73e4 <__swbuf_r+0x160>
    740c:	dc8ff0ef          	jal	69d4 <__sinit>
    7410:	ea1ff06f          	j	72b0 <__swbuf_r+0x2c>

00007414 <__swsetup_r>:
    7414:	ff010113          	add	sp,sp,-16
    7418:	00812423          	sw	s0,8(sp)
    741c:	00912223          	sw	s1,4(sp)
    7420:	00112623          	sw	ra,12(sp)
    7424:	7fff9797          	auipc	a5,0x7fff9
    7428:	2e47a783          	lw	a5,740(a5) # 80000708 <_impure_ptr>
    742c:	00050493          	mv	s1,a0
    7430:	00058413          	mv	s0,a1
    7434:	00078663          	beqz	a5,7440 <__swsetup_r+0x2c>
    7438:	0347a703          	lw	a4,52(a5)
    743c:	0e070c63          	beqz	a4,7534 <__swsetup_r+0x120>
    7440:	00c41783          	lh	a5,12(s0)
    7444:	0087f713          	and	a4,a5,8
    7448:	06070a63          	beqz	a4,74bc <__swsetup_r+0xa8>
    744c:	01042703          	lw	a4,16(s0)
    7450:	08070663          	beqz	a4,74dc <__swsetup_r+0xc8>
    7454:	0017f693          	and	a3,a5,1
    7458:	02068863          	beqz	a3,7488 <__swsetup_r+0x74>
    745c:	01442683          	lw	a3,20(s0)
    7460:	00042423          	sw	zero,8(s0)
    7464:	00000513          	li	a0,0
    7468:	40d006b3          	neg	a3,a3
    746c:	00d42c23          	sw	a3,24(s0)
    7470:	02070a63          	beqz	a4,74a4 <__swsetup_r+0x90>
    7474:	00c12083          	lw	ra,12(sp)
    7478:	00812403          	lw	s0,8(sp)
    747c:	00412483          	lw	s1,4(sp)
    7480:	01010113          	add	sp,sp,16
    7484:	00008067          	ret
    7488:	0027f693          	and	a3,a5,2
    748c:	00000613          	li	a2,0
    7490:	00069463          	bnez	a3,7498 <__swsetup_r+0x84>
    7494:	01442603          	lw	a2,20(s0)
    7498:	00c42423          	sw	a2,8(s0)
    749c:	00000513          	li	a0,0
    74a0:	fc071ae3          	bnez	a4,7474 <__swsetup_r+0x60>
    74a4:	0807f713          	and	a4,a5,128
    74a8:	fc0706e3          	beqz	a4,7474 <__swsetup_r+0x60>
    74ac:	0407e793          	or	a5,a5,64
    74b0:	00f41623          	sh	a5,12(s0)
    74b4:	fff00513          	li	a0,-1
    74b8:	fbdff06f          	j	7474 <__swsetup_r+0x60>
    74bc:	0107f713          	and	a4,a5,16
    74c0:	08070063          	beqz	a4,7540 <__swsetup_r+0x12c>
    74c4:	0047f713          	and	a4,a5,4
    74c8:	02071c63          	bnez	a4,7500 <__swsetup_r+0xec>
    74cc:	01042703          	lw	a4,16(s0)
    74d0:	0087e793          	or	a5,a5,8
    74d4:	00f41623          	sh	a5,12(s0)
    74d8:	f6071ee3          	bnez	a4,7454 <__swsetup_r+0x40>
    74dc:	2807f693          	and	a3,a5,640
    74e0:	20000613          	li	a2,512
    74e4:	f6c688e3          	beq	a3,a2,7454 <__swsetup_r+0x40>
    74e8:	00040593          	mv	a1,s0
    74ec:	00048513          	mv	a0,s1
    74f0:	6cc030ef          	jal	abbc <__smakebuf_r>
    74f4:	00c41783          	lh	a5,12(s0)
    74f8:	01042703          	lw	a4,16(s0)
    74fc:	f59ff06f          	j	7454 <__swsetup_r+0x40>
    7500:	03042583          	lw	a1,48(s0)
    7504:	00058e63          	beqz	a1,7520 <__swsetup_r+0x10c>
    7508:	04040713          	add	a4,s0,64
    750c:	00e58863          	beq	a1,a4,751c <__swsetup_r+0x108>
    7510:	00048513          	mv	a0,s1
    7514:	cf1f90ef          	jal	1204 <_free_r>
    7518:	00c41783          	lh	a5,12(s0)
    751c:	02042823          	sw	zero,48(s0)
    7520:	01042703          	lw	a4,16(s0)
    7524:	fdb7f793          	and	a5,a5,-37
    7528:	00042223          	sw	zero,4(s0)
    752c:	00e42023          	sw	a4,0(s0)
    7530:	fa1ff06f          	j	74d0 <__swsetup_r+0xbc>
    7534:	00078513          	mv	a0,a5
    7538:	c9cff0ef          	jal	69d4 <__sinit>
    753c:	f05ff06f          	j	7440 <__swsetup_r+0x2c>
    7540:	00900713          	li	a4,9
    7544:	00e4a023          	sw	a4,0(s1)
    7548:	0407e793          	or	a5,a5,64
    754c:	00f41623          	sh	a5,12(s0)
    7550:	fff00513          	li	a0,-1
    7554:	f21ff06f          	j	7474 <__swsetup_r+0x60>

00007558 <__fputwc>:
    7558:	fc010113          	add	sp,sp,-64
    755c:	02812c23          	sw	s0,56(sp)
    7560:	03412423          	sw	s4,40(sp)
    7564:	03512223          	sw	s5,36(sp)
    7568:	02112e23          	sw	ra,60(sp)
    756c:	02912a23          	sw	s1,52(sp)
    7570:	03312623          	sw	s3,44(sp)
    7574:	00050a13          	mv	s4,a0
    7578:	00058a93          	mv	s5,a1
    757c:	00060413          	mv	s0,a2
    7580:	374000ef          	jal	78f4 <__locale_mb_cur_max>
    7584:	00100793          	li	a5,1
    7588:	02f51663          	bne	a0,a5,75b4 <__fputwc+0x5c>
    758c:	fffa8793          	add	a5,s5,-1
    7590:	0fe00713          	li	a4,254
    7594:	02f76063          	bltu	a4,a5,75b4 <__fputwc+0x5c>
    7598:	03212823          	sw	s2,48(sp)
    759c:	03612023          	sw	s6,32(sp)
    75a0:	01712e23          	sw	s7,28(sp)
    75a4:	01510423          	sb	s5,8(sp)
    75a8:	00100993          	li	s3,1
    75ac:	00810493          	add	s1,sp,8
    75b0:	0380006f          	j	75e8 <__fputwc+0x90>
    75b4:	00810493          	add	s1,sp,8
    75b8:	05c40693          	add	a3,s0,92
    75bc:	000a8613          	mv	a2,s5
    75c0:	00048593          	mv	a1,s1
    75c4:	000a0513          	mv	a0,s4
    75c8:	3e8030ef          	jal	a9b0 <_wcrtomb_r>
    75cc:	fff00793          	li	a5,-1
    75d0:	00050993          	mv	s3,a0
    75d4:	0cf50a63          	beq	a0,a5,76a8 <__fputwc+0x150>
    75d8:	0a050663          	beqz	a0,7684 <__fputwc+0x12c>
    75dc:	03212823          	sw	s2,48(sp)
    75e0:	03612023          	sw	s6,32(sp)
    75e4:	01712e23          	sw	s7,28(sp)
    75e8:	00000913          	li	s2,0
    75ec:	fff00b13          	li	s6,-1
    75f0:	00a00b93          	li	s7,10
    75f4:	0200006f          	j	7614 <__fputwc+0xbc>
    75f8:	00042783          	lw	a5,0(s0)
    75fc:	00178693          	add	a3,a5,1
    7600:	00d42023          	sw	a3,0(s0)
    7604:	00e78023          	sb	a4,0(a5)
    7608:	00190913          	add	s2,s2,1
    760c:	00148493          	add	s1,s1,1
    7610:	07397463          	bgeu	s2,s3,7678 <__fputwc+0x120>
    7614:	00842783          	lw	a5,8(s0)
    7618:	0004c703          	lbu	a4,0(s1)
    761c:	fff78793          	add	a5,a5,-1
    7620:	00f42423          	sw	a5,8(s0)
    7624:	fc07dae3          	bgez	a5,75f8 <__fputwc+0xa0>
    7628:	01842683          	lw	a3,24(s0)
    762c:	00040613          	mv	a2,s0
    7630:	00070593          	mv	a1,a4
    7634:	000a0513          	mv	a0,s4
    7638:	00d7c463          	blt	a5,a3,7640 <__fputwc+0xe8>
    763c:	fb771ee3          	bne	a4,s7,75f8 <__fputwc+0xa0>
    7640:	c45ff0ef          	jal	7284 <__swbuf_r>
    7644:	fd6512e3          	bne	a0,s6,7608 <__fputwc+0xb0>
    7648:	03012903          	lw	s2,48(sp)
    764c:	02012b03          	lw	s6,32(sp)
    7650:	01c12b83          	lw	s7,28(sp)
    7654:	03c12083          	lw	ra,60(sp)
    7658:	03812403          	lw	s0,56(sp)
    765c:	03412483          	lw	s1,52(sp)
    7660:	02c12983          	lw	s3,44(sp)
    7664:	02812a03          	lw	s4,40(sp)
    7668:	02412a83          	lw	s5,36(sp)
    766c:	fff00513          	li	a0,-1
    7670:	04010113          	add	sp,sp,64
    7674:	00008067          	ret
    7678:	03012903          	lw	s2,48(sp)
    767c:	02012b03          	lw	s6,32(sp)
    7680:	01c12b83          	lw	s7,28(sp)
    7684:	03c12083          	lw	ra,60(sp)
    7688:	03812403          	lw	s0,56(sp)
    768c:	03412483          	lw	s1,52(sp)
    7690:	02c12983          	lw	s3,44(sp)
    7694:	02812a03          	lw	s4,40(sp)
    7698:	000a8513          	mv	a0,s5
    769c:	02412a83          	lw	s5,36(sp)
    76a0:	04010113          	add	sp,sp,64
    76a4:	00008067          	ret
    76a8:	00c45783          	lhu	a5,12(s0)
    76ac:	0407e793          	or	a5,a5,64
    76b0:	00f41623          	sh	a5,12(s0)
    76b4:	fa1ff06f          	j	7654 <__fputwc+0xfc>

000076b8 <_fputwc_r>:
    76b8:	06462783          	lw	a5,100(a2)
    76bc:	fe010113          	add	sp,sp,-32
    76c0:	00812c23          	sw	s0,24(sp)
    76c4:	00912a23          	sw	s1,20(sp)
    76c8:	0017f713          	and	a4,a5,1
    76cc:	00112e23          	sw	ra,28(sp)
    76d0:	00c61783          	lh	a5,12(a2)
    76d4:	00060413          	mv	s0,a2
    76d8:	00050493          	mv	s1,a0
    76dc:	00071663          	bnez	a4,76e8 <_fputwc_r+0x30>
    76e0:	2007f713          	and	a4,a5,512
    76e4:	08070463          	beqz	a4,776c <_fputwc_r+0xb4>
    76e8:	01279713          	sll	a4,a5,0x12
    76ec:	02074063          	bltz	a4,770c <_fputwc_r+0x54>
    76f0:	06442703          	lw	a4,100(s0)
    76f4:	000026b7          	lui	a3,0x2
    76f8:	00d7e7b3          	or	a5,a5,a3
    76fc:	000026b7          	lui	a3,0x2
    7700:	00d76733          	or	a4,a4,a3
    7704:	00f41623          	sh	a5,12(s0)
    7708:	06e42223          	sw	a4,100(s0)
    770c:	00048513          	mv	a0,s1
    7710:	00040613          	mv	a2,s0
    7714:	e45ff0ef          	jal	7558 <__fputwc>
    7718:	06442783          	lw	a5,100(s0)
    771c:	00050493          	mv	s1,a0
    7720:	0017f793          	and	a5,a5,1
    7724:	00079863          	bnez	a5,7734 <_fputwc_r+0x7c>
    7728:	00c45783          	lhu	a5,12(s0)
    772c:	2007f793          	and	a5,a5,512
    7730:	00078e63          	beqz	a5,774c <_fputwc_r+0x94>
    7734:	01c12083          	lw	ra,28(sp)
    7738:	01812403          	lw	s0,24(sp)
    773c:	00048513          	mv	a0,s1
    7740:	01412483          	lw	s1,20(sp)
    7744:	02010113          	add	sp,sp,32
    7748:	00008067          	ret
    774c:	05842503          	lw	a0,88(s0)
    7750:	e60f90ef          	jal	db0 <__retarget_lock_release_recursive>
    7754:	01c12083          	lw	ra,28(sp)
    7758:	01812403          	lw	s0,24(sp)
    775c:	00048513          	mv	a0,s1
    7760:	01412483          	lw	s1,20(sp)
    7764:	02010113          	add	sp,sp,32
    7768:	00008067          	ret
    776c:	05862503          	lw	a0,88(a2)
    7770:	00b12623          	sw	a1,12(sp)
    7774:	e38f90ef          	jal	dac <__retarget_lock_acquire_recursive>
    7778:	00c41783          	lh	a5,12(s0)
    777c:	00c12583          	lw	a1,12(sp)
    7780:	f69ff06f          	j	76e8 <_fputwc_r+0x30>

00007784 <memchr>:
    7784:	00357793          	and	a5,a0,3
    7788:	0ff5f693          	zext.b	a3,a1
    778c:	02078a63          	beqz	a5,77c0 <memchr+0x3c>
    7790:	fff60793          	add	a5,a2,-1
    7794:	02060e63          	beqz	a2,77d0 <memchr+0x4c>
    7798:	fff00613          	li	a2,-1
    779c:	0180006f          	j	77b4 <memchr+0x30>
    77a0:	00150513          	add	a0,a0,1
    77a4:	00357713          	and	a4,a0,3
    77a8:	00070e63          	beqz	a4,77c4 <memchr+0x40>
    77ac:	fff78793          	add	a5,a5,-1
    77b0:	02c78063          	beq	a5,a2,77d0 <memchr+0x4c>
    77b4:	00054703          	lbu	a4,0(a0)
    77b8:	fed714e3          	bne	a4,a3,77a0 <memchr+0x1c>
    77bc:	00008067          	ret
    77c0:	00060793          	mv	a5,a2
    77c4:	00300713          	li	a4,3
    77c8:	00f76863          	bltu	a4,a5,77d8 <memchr+0x54>
    77cc:	06079063          	bnez	a5,782c <memchr+0xa8>
    77d0:	00000513          	li	a0,0
    77d4:	00008067          	ret
    77d8:	0ff5f593          	zext.b	a1,a1
    77dc:	00859713          	sll	a4,a1,0x8
    77e0:	00b705b3          	add	a1,a4,a1
    77e4:	01059713          	sll	a4,a1,0x10
    77e8:	feff08b7          	lui	a7,0xfeff0
    77ec:	80808837          	lui	a6,0x80808
    77f0:	00e585b3          	add	a1,a1,a4
    77f4:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    77f8:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    77fc:	00300313          	li	t1,3
    7800:	0100006f          	j	7810 <memchr+0x8c>
    7804:	ffc78793          	add	a5,a5,-4
    7808:	00450513          	add	a0,a0,4
    780c:	fcf370e3          	bgeu	t1,a5,77cc <memchr+0x48>
    7810:	00052703          	lw	a4,0(a0)
    7814:	00e5c733          	xor	a4,a1,a4
    7818:	01170633          	add	a2,a4,a7
    781c:	fff74713          	not	a4,a4
    7820:	00e67733          	and	a4,a2,a4
    7824:	01077733          	and	a4,a4,a6
    7828:	fc070ee3          	beqz	a4,7804 <memchr+0x80>
    782c:	00f507b3          	add	a5,a0,a5
    7830:	00c0006f          	j	783c <memchr+0xb8>
    7834:	00150513          	add	a0,a0,1
    7838:	f8f50ce3          	beq	a0,a5,77d0 <memchr+0x4c>
    783c:	00054703          	lbu	a4,0(a0)
    7840:	fed71ae3          	bne	a4,a3,7834 <memchr+0xb0>
    7844:	00008067          	ret

00007848 <strncpy>:
    7848:	00a5e7b3          	or	a5,a1,a0
    784c:	0037f793          	and	a5,a5,3
    7850:	00079663          	bnez	a5,785c <strncpy+0x14>
    7854:	00300793          	li	a5,3
    7858:	04c7e663          	bltu	a5,a2,78a4 <strncpy+0x5c>
    785c:	00050713          	mv	a4,a0
    7860:	01c0006f          	j	787c <strncpy+0x34>
    7864:	fff5c683          	lbu	a3,-1(a1) # 1fff <_vfprintf_r+0x2f7>
    7868:	fff60813          	add	a6,a2,-1
    786c:	fed78fa3          	sb	a3,-1(a5)
    7870:	00068e63          	beqz	a3,788c <strncpy+0x44>
    7874:	00078713          	mv	a4,a5
    7878:	00080613          	mv	a2,a6
    787c:	00158593          	add	a1,a1,1
    7880:	00170793          	add	a5,a4,1
    7884:	fe0610e3          	bnez	a2,7864 <strncpy+0x1c>
    7888:	00008067          	ret
    788c:	00c70733          	add	a4,a4,a2
    7890:	06080063          	beqz	a6,78f0 <strncpy+0xa8>
    7894:	00178793          	add	a5,a5,1
    7898:	fe078fa3          	sb	zero,-1(a5)
    789c:	fee79ce3          	bne	a5,a4,7894 <strncpy+0x4c>
    78a0:	00008067          	ret
    78a4:	feff0337          	lui	t1,0xfeff0
    78a8:	808088b7          	lui	a7,0x80808
    78ac:	00050713          	mv	a4,a0
    78b0:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    78b4:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    78b8:	00300e13          	li	t3,3
    78bc:	0180006f          	j	78d4 <strncpy+0x8c>
    78c0:	00d72023          	sw	a3,0(a4)
    78c4:	ffc60613          	add	a2,a2,-4
    78c8:	00470713          	add	a4,a4,4
    78cc:	00458593          	add	a1,a1,4
    78d0:	face76e3          	bgeu	t3,a2,787c <strncpy+0x34>
    78d4:	0005a683          	lw	a3,0(a1)
    78d8:	006687b3          	add	a5,a3,t1
    78dc:	fff6c813          	not	a6,a3
    78e0:	0107f7b3          	and	a5,a5,a6
    78e4:	0117f7b3          	and	a5,a5,a7
    78e8:	fc078ce3          	beqz	a5,78c0 <strncpy+0x78>
    78ec:	f91ff06f          	j	787c <strncpy+0x34>
    78f0:	00008067          	ret

000078f4 <__locale_mb_cur_max>:
    78f4:	7fff9517          	auipc	a0,0x7fff9
    78f8:	d6854503          	lbu	a0,-664(a0) # 8000065c <__global_locale+0x128>
    78fc:	00008067          	ret

00007900 <_localeconv_r>:
    7900:	7fff9517          	auipc	a0,0x7fff9
    7904:	d2450513          	add	a0,a0,-732 # 80000624 <__global_locale+0xf0>
    7908:	00008067          	ret

0000790c <_close_r>:
    790c:	ff010113          	add	sp,sp,-16
    7910:	00812423          	sw	s0,8(sp)
    7914:	00050413          	mv	s0,a0
    7918:	00058513          	mv	a0,a1
    791c:	7fff9797          	auipc	a5,0x7fff9
    7920:	de07ae23          	sw	zero,-516(a5) # 80000718 <errno>
    7924:	00112623          	sw	ra,12(sp)
    7928:	85cf90ef          	jal	984 <_close>
    792c:	fff00793          	li	a5,-1
    7930:	00f50a63          	beq	a0,a5,7944 <_close_r+0x38>
    7934:	00c12083          	lw	ra,12(sp)
    7938:	00812403          	lw	s0,8(sp)
    793c:	01010113          	add	sp,sp,16
    7940:	00008067          	ret
    7944:	7fff9797          	auipc	a5,0x7fff9
    7948:	dd47a783          	lw	a5,-556(a5) # 80000718 <errno>
    794c:	fe0784e3          	beqz	a5,7934 <_close_r+0x28>
    7950:	00c12083          	lw	ra,12(sp)
    7954:	00f42023          	sw	a5,0(s0)
    7958:	00812403          	lw	s0,8(sp)
    795c:	01010113          	add	sp,sp,16
    7960:	00008067          	ret

00007964 <_lseek_r>:
    7964:	ff010113          	add	sp,sp,-16
    7968:	00058713          	mv	a4,a1
    796c:	00812423          	sw	s0,8(sp)
    7970:	00060593          	mv	a1,a2
    7974:	00050413          	mv	s0,a0
    7978:	00068613          	mv	a2,a3
    797c:	00070513          	mv	a0,a4
    7980:	7fff9797          	auipc	a5,0x7fff9
    7984:	d807ac23          	sw	zero,-616(a5) # 80000718 <errno>
    7988:	00112623          	sw	ra,12(sp)
    798c:	834f90ef          	jal	9c0 <_lseek>
    7990:	fff00793          	li	a5,-1
    7994:	00f50a63          	beq	a0,a5,79a8 <_lseek_r+0x44>
    7998:	00c12083          	lw	ra,12(sp)
    799c:	00812403          	lw	s0,8(sp)
    79a0:	01010113          	add	sp,sp,16
    79a4:	00008067          	ret
    79a8:	7fff9797          	auipc	a5,0x7fff9
    79ac:	d707a783          	lw	a5,-656(a5) # 80000718 <errno>
    79b0:	fe0784e3          	beqz	a5,7998 <_lseek_r+0x34>
    79b4:	00c12083          	lw	ra,12(sp)
    79b8:	00f42023          	sw	a5,0(s0)
    79bc:	00812403          	lw	s0,8(sp)
    79c0:	01010113          	add	sp,sp,16
    79c4:	00008067          	ret

000079c8 <_read_r>:
    79c8:	ff010113          	add	sp,sp,-16
    79cc:	00058713          	mv	a4,a1
    79d0:	00812423          	sw	s0,8(sp)
    79d4:	00060593          	mv	a1,a2
    79d8:	00050413          	mv	s0,a0
    79dc:	00068613          	mv	a2,a3
    79e0:	00070513          	mv	a0,a4
    79e4:	7fff9797          	auipc	a5,0x7fff9
    79e8:	d207aa23          	sw	zero,-716(a5) # 80000718 <errno>
    79ec:	00112623          	sw	ra,12(sp)
    79f0:	fd9f80ef          	jal	9c8 <_read>
    79f4:	fff00793          	li	a5,-1
    79f8:	00f50a63          	beq	a0,a5,7a0c <_read_r+0x44>
    79fc:	00c12083          	lw	ra,12(sp)
    7a00:	00812403          	lw	s0,8(sp)
    7a04:	01010113          	add	sp,sp,16
    7a08:	00008067          	ret
    7a0c:	7fff9797          	auipc	a5,0x7fff9
    7a10:	d0c7a783          	lw	a5,-756(a5) # 80000718 <errno>
    7a14:	fe0784e3          	beqz	a5,79fc <_read_r+0x34>
    7a18:	00c12083          	lw	ra,12(sp)
    7a1c:	00f42023          	sw	a5,0(s0)
    7a20:	00812403          	lw	s0,8(sp)
    7a24:	01010113          	add	sp,sp,16
    7a28:	00008067          	ret

00007a2c <_sbrk_r>:
    7a2c:	ff010113          	add	sp,sp,-16
    7a30:	00812423          	sw	s0,8(sp)
    7a34:	00050413          	mv	s0,a0
    7a38:	00058513          	mv	a0,a1
    7a3c:	7fff9797          	auipc	a5,0x7fff9
    7a40:	cc07ae23          	sw	zero,-804(a5) # 80000718 <errno>
    7a44:	00112623          	sw	ra,12(sp)
    7a48:	900f90ef          	jal	b48 <_sbrk>
    7a4c:	fff00793          	li	a5,-1
    7a50:	00f50a63          	beq	a0,a5,7a64 <_sbrk_r+0x38>
    7a54:	00c12083          	lw	ra,12(sp)
    7a58:	00812403          	lw	s0,8(sp)
    7a5c:	01010113          	add	sp,sp,16
    7a60:	00008067          	ret
    7a64:	7fff9797          	auipc	a5,0x7fff9
    7a68:	cb47a783          	lw	a5,-844(a5) # 80000718 <errno>
    7a6c:	fe0784e3          	beqz	a5,7a54 <_sbrk_r+0x28>
    7a70:	00c12083          	lw	ra,12(sp)
    7a74:	00f42023          	sw	a5,0(s0)
    7a78:	00812403          	lw	s0,8(sp)
    7a7c:	01010113          	add	sp,sp,16
    7a80:	00008067          	ret

00007a84 <_write_r>:
    7a84:	ff010113          	add	sp,sp,-16
    7a88:	00058713          	mv	a4,a1
    7a8c:	00812423          	sw	s0,8(sp)
    7a90:	00060593          	mv	a1,a2
    7a94:	00050413          	mv	s0,a0
    7a98:	00068613          	mv	a2,a3
    7a9c:	00070513          	mv	a0,a4
    7aa0:	7fff9797          	auipc	a5,0x7fff9
    7aa4:	c607ac23          	sw	zero,-904(a5) # 80000718 <errno>
    7aa8:	00112623          	sw	ra,12(sp)
    7aac:	ff9f80ef          	jal	aa4 <_write>
    7ab0:	fff00793          	li	a5,-1
    7ab4:	00f50a63          	beq	a0,a5,7ac8 <_write_r+0x44>
    7ab8:	00c12083          	lw	ra,12(sp)
    7abc:	00812403          	lw	s0,8(sp)
    7ac0:	01010113          	add	sp,sp,16
    7ac4:	00008067          	ret
    7ac8:	7fff9797          	auipc	a5,0x7fff9
    7acc:	c507a783          	lw	a5,-944(a5) # 80000718 <errno>
    7ad0:	fe0784e3          	beqz	a5,7ab8 <_write_r+0x34>
    7ad4:	00c12083          	lw	ra,12(sp)
    7ad8:	00f42023          	sw	a5,0(s0)
    7adc:	00812403          	lw	s0,8(sp)
    7ae0:	01010113          	add	sp,sp,16
    7ae4:	00008067          	ret

00007ae8 <memmove>:
    7ae8:	02a5f663          	bgeu	a1,a0,7b14 <memmove+0x2c>
    7aec:	00c58733          	add	a4,a1,a2
    7af0:	02e57263          	bgeu	a0,a4,7b14 <memmove+0x2c>
    7af4:	00c507b3          	add	a5,a0,a2
    7af8:	04060663          	beqz	a2,7b44 <memmove+0x5c>
    7afc:	fff74683          	lbu	a3,-1(a4)
    7b00:	fff78793          	add	a5,a5,-1
    7b04:	fff70713          	add	a4,a4,-1
    7b08:	00d78023          	sb	a3,0(a5)
    7b0c:	fef518e3          	bne	a0,a5,7afc <memmove+0x14>
    7b10:	00008067          	ret
    7b14:	00f00793          	li	a5,15
    7b18:	02c7e863          	bltu	a5,a2,7b48 <memmove+0x60>
    7b1c:	00050793          	mv	a5,a0
    7b20:	fff60693          	add	a3,a2,-1
    7b24:	0c060263          	beqz	a2,7be8 <memmove+0x100>
    7b28:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x2f9>
    7b2c:	00d786b3          	add	a3,a5,a3
    7b30:	0005c703          	lbu	a4,0(a1)
    7b34:	00178793          	add	a5,a5,1
    7b38:	00158593          	add	a1,a1,1
    7b3c:	fee78fa3          	sb	a4,-1(a5)
    7b40:	fed798e3          	bne	a5,a3,7b30 <memmove+0x48>
    7b44:	00008067          	ret
    7b48:	00b567b3          	or	a5,a0,a1
    7b4c:	0037f793          	and	a5,a5,3
    7b50:	08079663          	bnez	a5,7bdc <memmove+0xf4>
    7b54:	ff060893          	add	a7,a2,-16
    7b58:	ff08f893          	and	a7,a7,-16
    7b5c:	01088893          	add	a7,a7,16
    7b60:	011506b3          	add	a3,a0,a7
    7b64:	00058713          	mv	a4,a1
    7b68:	00050793          	mv	a5,a0
    7b6c:	00072803          	lw	a6,0(a4)
    7b70:	01070713          	add	a4,a4,16
    7b74:	01078793          	add	a5,a5,16
    7b78:	ff07a823          	sw	a6,-16(a5)
    7b7c:	ff472803          	lw	a6,-12(a4)
    7b80:	ff07aa23          	sw	a6,-12(a5)
    7b84:	ff872803          	lw	a6,-8(a4)
    7b88:	ff07ac23          	sw	a6,-8(a5)
    7b8c:	ffc72803          	lw	a6,-4(a4)
    7b90:	ff07ae23          	sw	a6,-4(a5)
    7b94:	fcd79ce3          	bne	a5,a3,7b6c <memmove+0x84>
    7b98:	00c67813          	and	a6,a2,12
    7b9c:	011585b3          	add	a1,a1,a7
    7ba0:	00f67713          	and	a4,a2,15
    7ba4:	04080463          	beqz	a6,7bec <memmove+0x104>
    7ba8:	ffc70813          	add	a6,a4,-4
    7bac:	ffc87813          	and	a6,a6,-4
    7bb0:	00480813          	add	a6,a6,4
    7bb4:	010687b3          	add	a5,a3,a6
    7bb8:	00058713          	mv	a4,a1
    7bbc:	00072883          	lw	a7,0(a4)
    7bc0:	00468693          	add	a3,a3,4
    7bc4:	00470713          	add	a4,a4,4
    7bc8:	ff16ae23          	sw	a7,-4(a3)
    7bcc:	fef698e3          	bne	a3,a5,7bbc <memmove+0xd4>
    7bd0:	00367613          	and	a2,a2,3
    7bd4:	010585b3          	add	a1,a1,a6
    7bd8:	f49ff06f          	j	7b20 <memmove+0x38>
    7bdc:	fff60693          	add	a3,a2,-1
    7be0:	00050793          	mv	a5,a0
    7be4:	f45ff06f          	j	7b28 <memmove+0x40>
    7be8:	00008067          	ret
    7bec:	00070613          	mv	a2,a4
    7bf0:	f31ff06f          	j	7b20 <memmove+0x38>

00007bf4 <frexp>:
    7bf4:	ff010113          	add	sp,sp,-16
    7bf8:	00912223          	sw	s1,4(sp)
    7bfc:	800004b7          	lui	s1,0x80000
    7c00:	00812423          	sw	s0,8(sp)
    7c04:	00112623          	sw	ra,12(sp)
    7c08:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7c0c:	00060413          	mv	s0,a2
    7c10:	00062023          	sw	zero,0(a2)
    7c14:	00b4f6b3          	and	a3,s1,a1
    7c18:	7ff00637          	lui	a2,0x7ff00
    7c1c:	00058793          	mv	a5,a1
    7c20:	00050713          	mv	a4,a0
    7c24:	04c6f063          	bgeu	a3,a2,7c64 <frexp+0x70>
    7c28:	00a6e633          	or	a2,a3,a0
    7c2c:	02060c63          	beqz	a2,7c64 <frexp+0x70>
    7c30:	0145d613          	srl	a2,a1,0x14
    7c34:	7ff67613          	and	a2,a2,2047
    7c38:	04060463          	beqz	a2,7c80 <frexp+0x8c>
    7c3c:	00000593          	li	a1,0
    7c40:	80100637          	lui	a2,0x80100
    7c44:	4146d693          	sra	a3,a3,0x14
    7c48:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7c4c:	c0268693          	add	a3,a3,-1022
    7c50:	00c7f7b3          	and	a5,a5,a2
    7c54:	00b686b3          	add	a3,a3,a1
    7c58:	3fe00637          	lui	a2,0x3fe00
    7c5c:	00c7e7b3          	or	a5,a5,a2
    7c60:	00d42023          	sw	a3,0(s0)
    7c64:	00c12083          	lw	ra,12(sp)
    7c68:	00812403          	lw	s0,8(sp)
    7c6c:	00412483          	lw	s1,4(sp)
    7c70:	00070513          	mv	a0,a4
    7c74:	00078593          	mv	a1,a5
    7c78:	01010113          	add	sp,sp,16
    7c7c:	00008067          	ret
    7c80:	7fff9797          	auipc	a5,0x7fff9
    7c84:	a4078793          	add	a5,a5,-1472 # 800006c0 <__global_locale+0x18c>
    7c88:	0047a683          	lw	a3,4(a5)
    7c8c:	0007a603          	lw	a2,0(a5)
    7c90:	009050ef          	jal	d498 <__muldf3>
    7c94:	00058793          	mv	a5,a1
    7c98:	00b4f6b3          	and	a3,s1,a1
    7c9c:	00050713          	mv	a4,a0
    7ca0:	fca00593          	li	a1,-54
    7ca4:	f9dff06f          	j	7c40 <frexp+0x4c>

00007ca8 <quorem>:
    7ca8:	fb010113          	add	sp,sp,-80
    7cac:	04912223          	sw	s1,68(sp)
    7cb0:	01052783          	lw	a5,16(a0)
    7cb4:	0105a483          	lw	s1,16(a1)
    7cb8:	04112623          	sw	ra,76(sp)
    7cbc:	00b12423          	sw	a1,8(sp)
    7cc0:	2097ca63          	blt	a5,s1,7ed4 <quorem+0x22c>
    7cc4:	fff48493          	add	s1,s1,-1
    7cc8:	03512a23          	sw	s5,52(sp)
    7ccc:	03812423          	sw	s8,40(sp)
    7cd0:	00249a93          	sll	s5,s1,0x2
    7cd4:	01458c13          	add	s8,a1,20
    7cd8:	05212023          	sw	s2,64(sp)
    7cdc:	03312e23          	sw	s3,60(sp)
    7ce0:	015c0933          	add	s2,s8,s5
    7ce4:	01450993          	add	s3,a0,20
    7ce8:	015987b3          	add	a5,s3,s5
    7cec:	03712623          	sw	s7,44(sp)
    7cf0:	00092b83          	lw	s7,0(s2)
    7cf4:	03912223          	sw	s9,36(sp)
    7cf8:	0007ac83          	lw	s9,0(a5)
    7cfc:	001b8b93          	add	s7,s7,1
    7d00:	03412c23          	sw	s4,56(sp)
    7d04:	000b8593          	mv	a1,s7
    7d08:	00050a13          	mv	s4,a0
    7d0c:	000c8513          	mv	a0,s9
    7d10:	04812423          	sw	s0,72(sp)
    7d14:	00f12623          	sw	a5,12(sp)
    7d18:	70d060ef          	jal	ec24 <__hidden___udivsi3>
    7d1c:	00050413          	mv	s0,a0
    7d20:	0d7cee63          	bltu	s9,s7,7dfc <quorem+0x154>
    7d24:	03a12023          	sw	s10,32(sp)
    7d28:	00010d37          	lui	s10,0x10
    7d2c:	01b12e23          	sw	s11,28(sp)
    7d30:	03612823          	sw	s6,48(sp)
    7d34:	000c0a93          	mv	s5,s8
    7d38:	00098d93          	mv	s11,s3
    7d3c:	00000c93          	li	s9,0
    7d40:	00000b93          	li	s7,0
    7d44:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    7d48:	000aab03          	lw	s6,0(s5)
    7d4c:	00040593          	mv	a1,s0
    7d50:	004d8d93          	add	s11,s11,4
    7d54:	01ab7533          	and	a0,s6,s10
    7d58:	609060ef          	jal	eb60 <__mulsi3>
    7d5c:	00050793          	mv	a5,a0
    7d60:	00040593          	mv	a1,s0
    7d64:	010b5513          	srl	a0,s6,0x10
    7d68:	01978cb3          	add	s9,a5,s9
    7d6c:	5f5060ef          	jal	eb60 <__mulsi3>
    7d70:	ffcda603          	lw	a2,-4(s11)
    7d74:	01acf733          	and	a4,s9,s10
    7d78:	010cdc93          	srl	s9,s9,0x10
    7d7c:	01a677b3          	and	a5,a2,s10
    7d80:	40e787b3          	sub	a5,a5,a4
    7d84:	017787b3          	add	a5,a5,s7
    7d88:	01950533          	add	a0,a0,s9
    7d8c:	4107d713          	sra	a4,a5,0x10
    7d90:	01a575b3          	and	a1,a0,s10
    7d94:	01065613          	srl	a2,a2,0x10
    7d98:	40b70733          	sub	a4,a4,a1
    7d9c:	00c70733          	add	a4,a4,a2
    7da0:	01a7f7b3          	and	a5,a5,s10
    7da4:	01071613          	sll	a2,a4,0x10
    7da8:	00c7e7b3          	or	a5,a5,a2
    7dac:	004a8a93          	add	s5,s5,4
    7db0:	fefdae23          	sw	a5,-4(s11)
    7db4:	01055c93          	srl	s9,a0,0x10
    7db8:	41075b93          	sra	s7,a4,0x10
    7dbc:	f95976e3          	bgeu	s2,s5,7d48 <quorem+0xa0>
    7dc0:	00c12703          	lw	a4,12(sp)
    7dc4:	00072783          	lw	a5,0(a4)
    7dc8:	12079063          	bnez	a5,7ee8 <quorem+0x240>
    7dcc:	ffc70a93          	add	s5,a4,-4
    7dd0:	0159e863          	bltu	s3,s5,7de0 <quorem+0x138>
    7dd4:	0180006f          	j	7dec <quorem+0x144>
    7dd8:	fff48493          	add	s1,s1,-1
    7ddc:	0159f863          	bgeu	s3,s5,7dec <quorem+0x144>
    7de0:	000aa783          	lw	a5,0(s5)
    7de4:	ffca8a93          	add	s5,s5,-4
    7de8:	fe0788e3          	beqz	a5,7dd8 <quorem+0x130>
    7dec:	03012b03          	lw	s6,48(sp)
    7df0:	02012d03          	lw	s10,32(sp)
    7df4:	01c12d83          	lw	s11,28(sp)
    7df8:	009a2823          	sw	s1,16(s4)
    7dfc:	00812583          	lw	a1,8(sp)
    7e00:	000a0513          	mv	a0,s4
    7e04:	1fc020ef          	jal	a000 <__mcmp>
    7e08:	08054c63          	bltz	a0,7ea0 <quorem+0x1f8>
    7e0c:	00010537          	lui	a0,0x10
    7e10:	00098593          	mv	a1,s3
    7e14:	00000713          	li	a4,0
    7e18:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    7e1c:	0005a683          	lw	a3,0(a1)
    7e20:	000c2603          	lw	a2,0(s8)
    7e24:	00458593          	add	a1,a1,4
    7e28:	00a6f7b3          	and	a5,a3,a0
    7e2c:	00a67833          	and	a6,a2,a0
    7e30:	410787b3          	sub	a5,a5,a6
    7e34:	00e787b3          	add	a5,a5,a4
    7e38:	4107d713          	sra	a4,a5,0x10
    7e3c:	01065613          	srl	a2,a2,0x10
    7e40:	0106d693          	srl	a3,a3,0x10
    7e44:	40c70733          	sub	a4,a4,a2
    7e48:	00d70733          	add	a4,a4,a3
    7e4c:	01071693          	sll	a3,a4,0x10
    7e50:	00a7f7b3          	and	a5,a5,a0
    7e54:	00d7e7b3          	or	a5,a5,a3
    7e58:	004c0c13          	add	s8,s8,4
    7e5c:	fef5ae23          	sw	a5,-4(a1)
    7e60:	41075713          	sra	a4,a4,0x10
    7e64:	fb897ce3          	bgeu	s2,s8,7e1c <quorem+0x174>
    7e68:	00249793          	sll	a5,s1,0x2
    7e6c:	00f987b3          	add	a5,s3,a5
    7e70:	0007a703          	lw	a4,0(a5)
    7e74:	02071463          	bnez	a4,7e9c <quorem+0x1f4>
    7e78:	ffc78793          	add	a5,a5,-4
    7e7c:	00f9e863          	bltu	s3,a5,7e8c <quorem+0x1e4>
    7e80:	0180006f          	j	7e98 <quorem+0x1f0>
    7e84:	fff48493          	add	s1,s1,-1
    7e88:	00f9f863          	bgeu	s3,a5,7e98 <quorem+0x1f0>
    7e8c:	0007a703          	lw	a4,0(a5)
    7e90:	ffc78793          	add	a5,a5,-4
    7e94:	fe0708e3          	beqz	a4,7e84 <quorem+0x1dc>
    7e98:	009a2823          	sw	s1,16(s4)
    7e9c:	00140413          	add	s0,s0,1
    7ea0:	04c12083          	lw	ra,76(sp)
    7ea4:	00040513          	mv	a0,s0
    7ea8:	04812403          	lw	s0,72(sp)
    7eac:	04012903          	lw	s2,64(sp)
    7eb0:	03c12983          	lw	s3,60(sp)
    7eb4:	03812a03          	lw	s4,56(sp)
    7eb8:	03412a83          	lw	s5,52(sp)
    7ebc:	02c12b83          	lw	s7,44(sp)
    7ec0:	02812c03          	lw	s8,40(sp)
    7ec4:	02412c83          	lw	s9,36(sp)
    7ec8:	04412483          	lw	s1,68(sp)
    7ecc:	05010113          	add	sp,sp,80
    7ed0:	00008067          	ret
    7ed4:	04c12083          	lw	ra,76(sp)
    7ed8:	04412483          	lw	s1,68(sp)
    7edc:	00000513          	li	a0,0
    7ee0:	05010113          	add	sp,sp,80
    7ee4:	00008067          	ret
    7ee8:	00812583          	lw	a1,8(sp)
    7eec:	000a0513          	mv	a0,s4
    7ef0:	03012b03          	lw	s6,48(sp)
    7ef4:	02012d03          	lw	s10,32(sp)
    7ef8:	01c12d83          	lw	s11,28(sp)
    7efc:	104020ef          	jal	a000 <__mcmp>
    7f00:	f00556e3          	bgez	a0,7e0c <quorem+0x164>
    7f04:	f9dff06f          	j	7ea0 <quorem+0x1f8>

00007f08 <_dtoa_r>:
    7f08:	03852303          	lw	t1,56(a0)
    7f0c:	f5010113          	add	sp,sp,-176
    7f10:	0a812423          	sw	s0,168(sp)
    7f14:	0a912223          	sw	s1,164(sp)
    7f18:	0b212023          	sw	s2,160(sp)
    7f1c:	09412c23          	sw	s4,152(sp)
    7f20:	07b12e23          	sw	s11,124(sp)
    7f24:	0a112623          	sw	ra,172(sp)
    7f28:	09312e23          	sw	s3,156(sp)
    7f2c:	09512a23          	sw	s5,148(sp)
    7f30:	00e12a23          	sw	a4,20(sp)
    7f34:	00f12623          	sw	a5,12(sp)
    7f38:	01112423          	sw	a7,8(sp)
    7f3c:	02b12223          	sw	a1,36(sp)
    7f40:	00c12023          	sw	a2,0(sp)
    7f44:	00050413          	mv	s0,a0
    7f48:	00058d93          	mv	s11,a1
    7f4c:	00060493          	mv	s1,a2
    7f50:	00068a13          	mv	s4,a3
    7f54:	00080913          	mv	s2,a6
    7f58:	02030263          	beqz	t1,7f7c <_dtoa_r+0x74>
    7f5c:	03c52703          	lw	a4,60(a0)
    7f60:	00100793          	li	a5,1
    7f64:	00030593          	mv	a1,t1
    7f68:	00e797b3          	sll	a5,a5,a4
    7f6c:	00e32223          	sw	a4,4(t1)
    7f70:	00f32423          	sw	a5,8(t1)
    7f74:	734010ef          	jal	96a8 <_Bfree>
    7f78:	02042c23          	sw	zero,56(s0)
    7f7c:	00048993          	mv	s3,s1
    7f80:	00000693          	li	a3,0
    7f84:	0004dc63          	bgez	s1,7f9c <_dtoa_r+0x94>
    7f88:	00149493          	sll	s1,s1,0x1
    7f8c:	0014d793          	srl	a5,s1,0x1
    7f90:	00f12023          	sw	a5,0(sp)
    7f94:	00078993          	mv	s3,a5
    7f98:	00100693          	li	a3,1
    7f9c:	7ff00737          	lui	a4,0x7ff00
    7fa0:	00d92023          	sw	a3,0(s2)
    7fa4:	00e9f6b3          	and	a3,s3,a4
    7fa8:	64e68463          	beq	a3,a4,85f0 <_dtoa_r+0x6e8>
    7fac:	00012483          	lw	s1,0(sp)
    7fb0:	000d8513          	mv	a0,s11
    7fb4:	00000613          	li	a2,0
    7fb8:	00048593          	mv	a1,s1
    7fbc:	00000693          	li	a3,0
    7fc0:	01b12c23          	sw	s11,24(sp)
    7fc4:	00912e23          	sw	s1,28(sp)
    7fc8:	23c050ef          	jal	d204 <__eqdf2>
    7fcc:	04051c63          	bnez	a0,8024 <_dtoa_r+0x11c>
    7fd0:	00c12703          	lw	a4,12(sp)
    7fd4:	00100793          	li	a5,1
    7fd8:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    7fdc:	00812703          	lw	a4,8(sp)
    7fe0:	00070863          	beqz	a4,7ff0 <_dtoa_r+0xe8>
    7fe4:	00007797          	auipc	a5,0x7
    7fe8:	f4d78793          	add	a5,a5,-179 # ef31 <__fini_array_end+0x1d9>
    7fec:	00f72023          	sw	a5,0(a4)
    7ff0:	00007a97          	auipc	s5,0x7
    7ff4:	f40a8a93          	add	s5,s5,-192 # ef30 <__fini_array_end+0x1d8>
    7ff8:	0ac12083          	lw	ra,172(sp)
    7ffc:	0a812403          	lw	s0,168(sp)
    8000:	0a412483          	lw	s1,164(sp)
    8004:	0a012903          	lw	s2,160(sp)
    8008:	09c12983          	lw	s3,156(sp)
    800c:	09812a03          	lw	s4,152(sp)
    8010:	07c12d83          	lw	s11,124(sp)
    8014:	000a8513          	mv	a0,s5
    8018:	09412a83          	lw	s5,148(sp)
    801c:	0b010113          	add	sp,sp,176
    8020:	00008067          	ret
    8024:	00048613          	mv	a2,s1
    8028:	06810713          	add	a4,sp,104
    802c:	06c10693          	add	a3,sp,108
    8030:	000d8593          	mv	a1,s11
    8034:	00040513          	mv	a0,s0
    8038:	09612823          	sw	s6,144(sp)
    803c:	09712623          	sw	s7,140(sp)
    8040:	09812423          	sw	s8,136(sp)
    8044:	09912223          	sw	s9,132(sp)
    8048:	09a12023          	sw	s10,128(sp)
    804c:	0149d913          	srl	s2,s3,0x14
    8050:	268020ef          	jal	a2b8 <__d2b>
    8054:	00050493          	mv	s1,a0
    8058:	5c091e63          	bnez	s2,8634 <_dtoa_r+0x72c>
    805c:	06812a83          	lw	s5,104(sp)
    8060:	06c12903          	lw	s2,108(sp)
    8064:	02000793          	li	a5,32
    8068:	012a8933          	add	s2,s5,s2
    806c:	43290713          	add	a4,s2,1074
    8070:	36e7dae3          	bge	a5,a4,8be4 <_dtoa_r+0xcdc>
    8074:	04000793          	li	a5,64
    8078:	40e787b3          	sub	a5,a5,a4
    807c:	41290513          	add	a0,s2,1042
    8080:	00f997b3          	sll	a5,s3,a5
    8084:	00add533          	srl	a0,s11,a0
    8088:	00a7e533          	or	a0,a5,a0
    808c:	634060ef          	jal	e6c0 <__floatunsidf>
    8090:	fe1007b7          	lui	a5,0xfe100
    8094:	00100693          	li	a3,1
    8098:	00050713          	mv	a4,a0
    809c:	00b787b3          	add	a5,a5,a1
    80a0:	fff90913          	add	s2,s2,-1
    80a4:	02d12c23          	sw	a3,56(sp)
    80a8:	7fff8697          	auipc	a3,0x7fff8
    80ac:	62068693          	add	a3,a3,1568 # 800006c8 <__global_locale+0x194>
    80b0:	0006a603          	lw	a2,0(a3)
    80b4:	0046a683          	lw	a3,4(a3)
    80b8:	00070513          	mv	a0,a4
    80bc:	00078593          	mv	a1,a5
    80c0:	369050ef          	jal	dc28 <__subdf3>
    80c4:	7fff8797          	auipc	a5,0x7fff8
    80c8:	60c78793          	add	a5,a5,1548 # 800006d0 <__global_locale+0x19c>
    80cc:	0007a603          	lw	a2,0(a5)
    80d0:	0047a683          	lw	a3,4(a5)
    80d4:	3c4050ef          	jal	d498 <__muldf3>
    80d8:	7fff8797          	auipc	a5,0x7fff8
    80dc:	60078793          	add	a5,a5,1536 # 800006d8 <__global_locale+0x1a4>
    80e0:	0007a603          	lw	a2,0(a5)
    80e4:	0047a683          	lw	a3,4(a5)
    80e8:	7a9030ef          	jal	c090 <__adddf3>
    80ec:	00050b13          	mv	s6,a0
    80f0:	00090513          	mv	a0,s2
    80f4:	00058993          	mv	s3,a1
    80f8:	510060ef          	jal	e608 <__floatsidf>
    80fc:	7fff8797          	auipc	a5,0x7fff8
    8100:	5e478793          	add	a5,a5,1508 # 800006e0 <__global_locale+0x1ac>
    8104:	0007a603          	lw	a2,0(a5)
    8108:	0047a683          	lw	a3,4(a5)
    810c:	38c050ef          	jal	d498 <__muldf3>
    8110:	00050613          	mv	a2,a0
    8114:	00058693          	mv	a3,a1
    8118:	000b0513          	mv	a0,s6
    811c:	00098593          	mv	a1,s3
    8120:	771030ef          	jal	c090 <__adddf3>
    8124:	00050b93          	mv	s7,a0
    8128:	00058b13          	mv	s6,a1
    812c:	458060ef          	jal	e584 <__fixdfsi>
    8130:	00050993          	mv	s3,a0
    8134:	000b0593          	mv	a1,s6
    8138:	000b8513          	mv	a0,s7
    813c:	00000613          	li	a2,0
    8140:	00000693          	li	a3,0
    8144:	24c050ef          	jal	d390 <__ledf2>
    8148:	02055063          	bgez	a0,8168 <_dtoa_r+0x260>
    814c:	00098513          	mv	a0,s3
    8150:	4b8060ef          	jal	e608 <__floatsidf>
    8154:	000b8613          	mv	a2,s7
    8158:	000b0693          	mv	a3,s6
    815c:	0a8050ef          	jal	d204 <__eqdf2>
    8160:	00a03533          	snez	a0,a0
    8164:	40a989b3          	sub	s3,s3,a0
    8168:	412a8ab3          	sub	s5,s5,s2
    816c:	01600793          	li	a5,22
    8170:	fffa8b13          	add	s6,s5,-1
    8174:	2137e2e3          	bltu	a5,s3,8b78 <_dtoa_r+0xc70>
    8178:	00399713          	sll	a4,s3,0x3
    817c:	00007797          	auipc	a5,0x7
    8180:	44c78793          	add	a5,a5,1100 # f5c8 <__mprec_tens>
    8184:	00e787b3          	add	a5,a5,a4
    8188:	0007a603          	lw	a2,0(a5)
    818c:	0047a683          	lw	a3,4(a5)
    8190:	01812503          	lw	a0,24(sp)
    8194:	01c12583          	lw	a1,28(sp)
    8198:	1f8050ef          	jal	d390 <__ledf2>
    819c:	220554e3          	bgez	a0,8bc4 <_dtoa_r+0xcbc>
    81a0:	fff98993          	add	s3,s3,-1
    81a4:	02012a23          	sw	zero,52(sp)
    81a8:	00012823          	sw	zero,16(sp)
    81ac:	4a0b4863          	bltz	s6,865c <_dtoa_r+0x754>
    81b0:	4c09d063          	bgez	s3,8670 <_dtoa_r+0x768>
    81b4:	01012783          	lw	a5,16(sp)
    81b8:	03312023          	sw	s3,32(sp)
    81bc:	413787b3          	sub	a5,a5,s3
    81c0:	00f12823          	sw	a5,16(sp)
    81c4:	413007b3          	neg	a5,s3
    81c8:	02f12823          	sw	a5,48(sp)
    81cc:	00900793          	li	a5,9
    81d0:	00000993          	li	s3,0
    81d4:	4b47e863          	bltu	a5,s4,8684 <_dtoa_r+0x77c>
    81d8:	00500793          	li	a5,5
    81dc:	2147dae3          	bge	a5,s4,8bf0 <_dtoa_r+0xce8>
    81e0:	ffca0a13          	add	s4,s4,-4
    81e4:	00300793          	li	a5,3
    81e8:	00000913          	li	s2,0
    81ec:	66fa02e3          	beq	s4,a5,9050 <_dtoa_r+0x1148>
    81f0:	6147dae3          	bge	a5,s4,9004 <_dtoa_r+0x10fc>
    81f4:	00400793          	li	a5,4
    81f8:	54fa1ae3          	bne	s4,a5,8f4c <_dtoa_r+0x1044>
    81fc:	00100793          	li	a5,1
    8200:	02f12423          	sw	a5,40(sp)
    8204:	01412603          	lw	a2,20(sp)
    8208:	62c05ce3          	blez	a2,9040 <_dtoa_r+0x1138>
    820c:	02c12e23          	sw	a2,60(sp)
    8210:	00060c13          	mv	s8,a2
    8214:	01700693          	li	a3,23
    8218:	00100713          	li	a4,1
    821c:	00400793          	li	a5,4
    8220:	00c6c463          	blt	a3,a2,8228 <_dtoa_r+0x320>
    8224:	3540106f          	j	9578 <_dtoa_r+0x1670>
    8228:	00179793          	sll	a5,a5,0x1
    822c:	01478693          	add	a3,a5,20
    8230:	00070593          	mv	a1,a4
    8234:	00170713          	add	a4,a4,1
    8238:	fed678e3          	bgeu	a2,a3,8228 <_dtoa_r+0x320>
    823c:	02b42e23          	sw	a1,60(s0)
    8240:	00040513          	mv	a0,s0
    8244:	3b0010ef          	jal	95f4 <_Balloc>
    8248:	00050a93          	mv	s5,a0
    824c:	00051463          	bnez	a0,8254 <_dtoa_r+0x34c>
    8250:	30c0106f          	j	955c <_dtoa_r+0x1654>
    8254:	02a42c23          	sw	a0,56(s0)
    8258:	00e00793          	li	a5,14
    825c:	5187ea63          	bltu	a5,s8,8770 <_dtoa_r+0x868>
    8260:	50090863          	beqz	s2,8770 <_dtoa_r+0x868>
    8264:	02012783          	lw	a5,32(sp)
    8268:	62f054e3          	blez	a5,9090 <_dtoa_r+0x1188>
    826c:	00f7f713          	and	a4,a5,15
    8270:	00371713          	sll	a4,a4,0x3
    8274:	4047dc93          	sra	s9,a5,0x4
    8278:	00007797          	auipc	a5,0x7
    827c:	35078793          	add	a5,a5,848 # f5c8 <__mprec_tens>
    8280:	00e787b3          	add	a5,a5,a4
    8284:	010cf693          	and	a3,s9,16
    8288:	0007a803          	lw	a6,0(a5)
    828c:	0047a703          	lw	a4,4(a5)
    8290:	560682e3          	beqz	a3,8ff4 <_dtoa_r+0x10ec>
    8294:	00007797          	auipc	a5,0x7
    8298:	30c78793          	add	a5,a5,780 # f5a0 <__mprec_bigtens>
    829c:	0207a603          	lw	a2,32(a5)
    82a0:	0247a683          	lw	a3,36(a5)
    82a4:	01812503          	lw	a0,24(sp)
    82a8:	01c12583          	lw	a1,28(sp)
    82ac:	04e12423          	sw	a4,72(sp)
    82b0:	05012023          	sw	a6,64(sp)
    82b4:	6a4040ef          	jal	c958 <__divdf3>
    82b8:	04012803          	lw	a6,64(sp)
    82bc:	04812703          	lw	a4,72(sp)
    82c0:	00fcfc93          	and	s9,s9,15
    82c4:	00050313          	mv	t1,a0
    82c8:	00058d13          	mv	s10,a1
    82cc:	00300913          	li	s2,3
    82d0:	040c8c63          	beqz	s9,8328 <_dtoa_r+0x420>
    82d4:	04812023          	sw	s0,64(sp)
    82d8:	00007b97          	auipc	s7,0x7
    82dc:	2c8b8b93          	add	s7,s7,712 # f5a0 <__mprec_bigtens>
    82e0:	00090413          	mv	s0,s2
    82e4:	00070593          	mv	a1,a4
    82e8:	00030913          	mv	s2,t1
    82ec:	001cf793          	and	a5,s9,1
    82f0:	00078e63          	beqz	a5,830c <_dtoa_r+0x404>
    82f4:	000ba603          	lw	a2,0(s7)
    82f8:	004ba683          	lw	a3,4(s7)
    82fc:	00080513          	mv	a0,a6
    8300:	00140413          	add	s0,s0,1
    8304:	194050ef          	jal	d498 <__muldf3>
    8308:	00050813          	mv	a6,a0
    830c:	401cdc93          	sra	s9,s9,0x1
    8310:	008b8b93          	add	s7,s7,8
    8314:	fc0c9ce3          	bnez	s9,82ec <_dtoa_r+0x3e4>
    8318:	00090313          	mv	t1,s2
    831c:	00040913          	mv	s2,s0
    8320:	04012403          	lw	s0,64(sp)
    8324:	00058713          	mv	a4,a1
    8328:	00070693          	mv	a3,a4
    832c:	00080613          	mv	a2,a6
    8330:	00030513          	mv	a0,t1
    8334:	000d0593          	mv	a1,s10
    8338:	620040ef          	jal	c958 <__divdf3>
    833c:	00050713          	mv	a4,a0
    8340:	00058793          	mv	a5,a1
    8344:	03412683          	lw	a3,52(sp)
    8348:	02068c63          	beqz	a3,8380 <_dtoa_r+0x478>
    834c:	7fff8697          	auipc	a3,0x7fff8
    8350:	39c68693          	add	a3,a3,924 # 800006e8 <__global_locale+0x1b4>
    8354:	0006a603          	lw	a2,0(a3)
    8358:	0046a683          	lw	a3,4(a3)
    835c:	00070513          	mv	a0,a4
    8360:	00078593          	mv	a1,a5
    8364:	04e12423          	sw	a4,72(sp)
    8368:	04f12023          	sw	a5,64(sp)
    836c:	024050ef          	jal	d390 <__ledf2>
    8370:	04012783          	lw	a5,64(sp)
    8374:	04812703          	lw	a4,72(sp)
    8378:	00055463          	bgez	a0,8380 <_dtoa_r+0x478>
    837c:	04c0106f          	j	93c8 <_dtoa_r+0x14c0>
    8380:	00090513          	mv	a0,s2
    8384:	04f12623          	sw	a5,76(sp)
    8388:	04e12023          	sw	a4,64(sp)
    838c:	27c060ef          	jal	e608 <__floatsidf>
    8390:	04012703          	lw	a4,64(sp)
    8394:	04c12783          	lw	a5,76(sp)
    8398:	00070613          	mv	a2,a4
    839c:	00078693          	mv	a3,a5
    83a0:	04e12423          	sw	a4,72(sp)
    83a4:	04f12023          	sw	a5,64(sp)
    83a8:	0f0050ef          	jal	d498 <__muldf3>
    83ac:	7fff8697          	auipc	a3,0x7fff8
    83b0:	34c68693          	add	a3,a3,844 # 800006f8 <__global_locale+0x1c4>
    83b4:	0006a603          	lw	a2,0(a3)
    83b8:	0046a683          	lw	a3,4(a3)
    83bc:	4d5030ef          	jal	c090 <__adddf3>
    83c0:	fcc006b7          	lui	a3,0xfcc00
    83c4:	04012783          	lw	a5,64(sp)
    83c8:	04812703          	lw	a4,72(sp)
    83cc:	00050c93          	mv	s9,a0
    83d0:	00b68bb3          	add	s7,a3,a1
    83d4:	340c0463          	beqz	s8,871c <_dtoa_r+0x814>
    83d8:	02012683          	lw	a3,32(sp)
    83dc:	05812423          	sw	s8,72(sp)
    83e0:	04d12e23          	sw	a3,92(sp)
    83e4:	00070513          	mv	a0,a4
    83e8:	00078593          	mv	a1,a5
    83ec:	04e12623          	sw	a4,76(sp)
    83f0:	04f12023          	sw	a5,64(sp)
    83f4:	190060ef          	jal	e584 <__fixdfsi>
    83f8:	04812783          	lw	a5,72(sp)
    83fc:	00050913          	mv	s2,a0
    8400:	05912c23          	sw	s9,88(sp)
    8404:	fff78693          	add	a3,a5,-1
    8408:	00369693          	sll	a3,a3,0x3
    840c:	00007797          	auipc	a5,0x7
    8410:	1bc78793          	add	a5,a5,444 # f5c8 <__mprec_tens>
    8414:	00d786b3          	add	a3,a5,a3
    8418:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    841c:	0046a803          	lw	a6,4(a3)
    8420:	001a8d13          	add	s10,s5,1
    8424:	04f12823          	sw	a5,80(sp)
    8428:	05012a23          	sw	a6,84(sp)
    842c:	1dc060ef          	jal	e608 <__floatsidf>
    8430:	04c12703          	lw	a4,76(sp)
    8434:	04012783          	lw	a5,64(sp)
    8438:	00050613          	mv	a2,a0
    843c:	00058693          	mv	a3,a1
    8440:	00070513          	mv	a0,a4
    8444:	00078593          	mv	a1,a5
    8448:	7e0050ef          	jal	dc28 <__subdf3>
    844c:	02812703          	lw	a4,40(sp)
    8450:	03090313          	add	t1,s2,48
    8454:	05a12023          	sw	s10,64(sp)
    8458:	00050c93          	mv	s9,a0
    845c:	0ff37313          	zext.b	t1,t1
    8460:	5c0706e3          	beqz	a4,922c <_dtoa_r+0x1324>
    8464:	7fff8797          	auipc	a5,0x7fff8
    8468:	25478793          	add	a5,a5,596 # 800006b8 <__global_locale+0x184>
    846c:	0007a503          	lw	a0,0(a5)
    8470:	05012603          	lw	a2,80(sp)
    8474:	05412683          	lw	a3,84(sp)
    8478:	04b12023          	sw	a1,64(sp)
    847c:	0047a583          	lw	a1,4(a5)
    8480:	04612623          	sw	t1,76(sp)
    8484:	4d4040ef          	jal	c958 <__divdf3>
    8488:	05812603          	lw	a2,88(sp)
    848c:	000b8693          	mv	a3,s7
    8490:	798050ef          	jal	dc28 <__subdf3>
    8494:	04012883          	lw	a7,64(sp)
    8498:	04c12303          	lw	t1,76(sp)
    849c:	000c8613          	mv	a2,s9
    84a0:	00088693          	mv	a3,a7
    84a4:	006a8023          	sb	t1,0(s5)
    84a8:	00050913          	mv	s2,a0
    84ac:	00058b93          	mv	s7,a1
    84b0:	5e1040ef          	jal	d290 <__gedf2>
    84b4:	04012883          	lw	a7,64(sp)
    84b8:	00a05463          	blez	a0,84c0 <_dtoa_r+0x5b8>
    84bc:	7c90006f          	j	9484 <_dtoa_r+0x157c>
    84c0:	7fff8697          	auipc	a3,0x7fff8
    84c4:	22868693          	add	a3,a3,552 # 800006e8 <__global_locale+0x1b4>
    84c8:	0006a783          	lw	a5,0(a3)
    84cc:	0046a803          	lw	a6,4(a3)
    84d0:	05312623          	sw	s3,76(sp)
    84d4:	04f12023          	sw	a5,64(sp)
    84d8:	00000793          	li	a5,0
    84dc:	05612823          	sw	s6,80(sp)
    84e0:	05812c23          	sw	s8,88(sp)
    84e4:	05012223          	sw	a6,68(sp)
    84e8:	04812c03          	lw	s8,72(sp)
    84ec:	00078b13          	mv	s6,a5
    84f0:	05412423          	sw	s4,72(sp)
    84f4:	00088993          	mv	s3,a7
    84f8:	0980006f          	j	8590 <_dtoa_r+0x688>
    84fc:	001b0b13          	add	s6,s6,1
    8500:	018b4463          	blt	s6,s8,8508 <_dtoa_r+0x600>
    8504:	7d10006f          	j	94d4 <_dtoa_r+0x15cc>
    8508:	7fff8a17          	auipc	s4,0x7fff8
    850c:	1e8a0a13          	add	s4,s4,488 # 800006f0 <__global_locale+0x1bc>
    8510:	000a2603          	lw	a2,0(s4)
    8514:	004a2683          	lw	a3,4(s4)
    8518:	00090513          	mv	a0,s2
    851c:	000b8593          	mv	a1,s7
    8520:	779040ef          	jal	d498 <__muldf3>
    8524:	000a2603          	lw	a2,0(s4)
    8528:	004a2683          	lw	a3,4(s4)
    852c:	00050913          	mv	s2,a0
    8530:	00058b93          	mv	s7,a1
    8534:	000c8513          	mv	a0,s9
    8538:	00098593          	mv	a1,s3
    853c:	75d040ef          	jal	d498 <__muldf3>
    8540:	00058c93          	mv	s9,a1
    8544:	00050a13          	mv	s4,a0
    8548:	03c060ef          	jal	e584 <__fixdfsi>
    854c:	00050993          	mv	s3,a0
    8550:	0b8060ef          	jal	e608 <__floatsidf>
    8554:	00050613          	mv	a2,a0
    8558:	00058693          	mv	a3,a1
    855c:	000a0513          	mv	a0,s4
    8560:	000c8593          	mv	a1,s9
    8564:	6c4050ef          	jal	dc28 <__subdf3>
    8568:	03098793          	add	a5,s3,48
    856c:	00090613          	mv	a2,s2
    8570:	000b8693          	mv	a3,s7
    8574:	00fd0023          	sb	a5,0(s10)
    8578:	001d0d13          	add	s10,s10,1
    857c:	00050c93          	mv	s9,a0
    8580:	00058993          	mv	s3,a1
    8584:	60d040ef          	jal	d390 <__ledf2>
    8588:	00055463          	bgez	a0,8590 <_dtoa_r+0x688>
    858c:	6f90006f          	j	9484 <_dtoa_r+0x157c>
    8590:	04012503          	lw	a0,64(sp)
    8594:	04412583          	lw	a1,68(sp)
    8598:	000c8613          	mv	a2,s9
    859c:	00098693          	mv	a3,s3
    85a0:	688050ef          	jal	dc28 <__subdf3>
    85a4:	00090613          	mv	a2,s2
    85a8:	000b8693          	mv	a3,s7
    85ac:	5e5040ef          	jal	d390 <__ledf2>
    85b0:	f40556e3          	bgez	a0,84fc <_dtoa_r+0x5f4>
    85b4:	05c12783          	lw	a5,92(sp)
    85b8:	000d0b93          	mv	s7,s10
    85bc:	00178c13          	add	s8,a5,1
    85c0:	03900613          	li	a2,57
    85c4:	0080006f          	j	85cc <_dtoa_r+0x6c4>
    85c8:	697a88e3          	beq	s5,s7,9458 <_dtoa_r+0x1550>
    85cc:	fffbc683          	lbu	a3,-1(s7)
    85d0:	000b8d13          	mv	s10,s7
    85d4:	fffb8b93          	add	s7,s7,-1
    85d8:	fec688e3          	beq	a3,a2,85c8 <_dtoa_r+0x6c0>
    85dc:	00168693          	add	a3,a3,1
    85e0:	0ff6f693          	zext.b	a3,a3
    85e4:	00db8023          	sb	a3,0(s7)
    85e8:	000c0a13          	mv	s4,s8
    85ec:	4f00006f          	j	8adc <_dtoa_r+0xbd4>
    85f0:	00c12683          	lw	a3,12(sp)
    85f4:	00002737          	lui	a4,0x2
    85f8:	00c99793          	sll	a5,s3,0xc
    85fc:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0xa07>
    8600:	00c7d793          	srl	a5,a5,0xc
    8604:	00e6a023          	sw	a4,0(a3)
    8608:	01b7e7b3          	or	a5,a5,s11
    860c:	0a078063          	beqz	a5,86ac <_dtoa_r+0x7a4>
    8610:	00812783          	lw	a5,8(sp)
    8614:	00007a97          	auipc	s5,0x7
    8618:	974a8a93          	add	s5,s5,-1676 # ef88 <__fini_array_end+0x230>
    861c:	9c078ee3          	beqz	a5,7ff8 <_dtoa_r+0xf0>
    8620:	00007797          	auipc	a5,0x7
    8624:	96b78793          	add	a5,a5,-1685 # ef8b <__fini_array_end+0x233>
    8628:	00812703          	lw	a4,8(sp)
    862c:	00f72023          	sw	a5,0(a4)
    8630:	9c9ff06f          	j	7ff8 <_dtoa_r+0xf0>
    8634:	01c12783          	lw	a5,28(sp)
    8638:	3ff006b7          	lui	a3,0x3ff00
    863c:	06812a83          	lw	s5,104(sp)
    8640:	00c79793          	sll	a5,a5,0xc
    8644:	00c7d793          	srl	a5,a5,0xc
    8648:	01812703          	lw	a4,24(sp)
    864c:	00d7e7b3          	or	a5,a5,a3
    8650:	c0190913          	add	s2,s2,-1023
    8654:	02012c23          	sw	zero,56(sp)
    8658:	a51ff06f          	j	80a8 <_dtoa_r+0x1a0>
    865c:	00100793          	li	a5,1
    8660:	415787b3          	sub	a5,a5,s5
    8664:	00f12823          	sw	a5,16(sp)
    8668:	00000b13          	li	s6,0
    866c:	b409c4e3          	bltz	s3,81b4 <_dtoa_r+0x2ac>
    8670:	03312023          	sw	s3,32(sp)
    8674:	02012823          	sw	zero,48(sp)
    8678:	00900793          	li	a5,9
    867c:	013b0b33          	add	s6,s6,s3
    8680:	b547fce3          	bgeu	a5,s4,81d8 <_dtoa_r+0x2d0>
    8684:	00100793          	li	a5,1
    8688:	00100913          	li	s2,1
    868c:	00000a13          	li	s4,0
    8690:	02f12423          	sw	a5,40(sp)
    8694:	fff00c13          	li	s8,-1
    8698:	00012a23          	sw	zero,20(sp)
    869c:	02042e23          	sw	zero,60(s0)
    86a0:	03812e23          	sw	s8,60(sp)
    86a4:	00000593          	li	a1,0
    86a8:	b99ff06f          	j	8240 <_dtoa_r+0x338>
    86ac:	00812703          	lw	a4,8(sp)
    86b0:	00007a97          	auipc	s5,0x7
    86b4:	8cca8a93          	add	s5,s5,-1844 # ef7c <__fini_array_end+0x224>
    86b8:	00007797          	auipc	a5,0x7
    86bc:	8cc78793          	add	a5,a5,-1844 # ef84 <__fini_array_end+0x22c>
    86c0:	f60714e3          	bnez	a4,8628 <_dtoa_r+0x720>
    86c4:	935ff06f          	j	7ff8 <_dtoa_r+0xf0>
    86c8:	00090513          	mv	a0,s2
    86cc:	04f12623          	sw	a5,76(sp)
    86d0:	04e12023          	sw	a4,64(sp)
    86d4:	735050ef          	jal	e608 <__floatsidf>
    86d8:	04012703          	lw	a4,64(sp)
    86dc:	04c12783          	lw	a5,76(sp)
    86e0:	00070613          	mv	a2,a4
    86e4:	00078693          	mv	a3,a5
    86e8:	04e12423          	sw	a4,72(sp)
    86ec:	04f12023          	sw	a5,64(sp)
    86f0:	5a9040ef          	jal	d498 <__muldf3>
    86f4:	7fff8697          	auipc	a3,0x7fff8
    86f8:	00468693          	add	a3,a3,4 # 800006f8 <__global_locale+0x1c4>
    86fc:	0006a603          	lw	a2,0(a3)
    8700:	0046a683          	lw	a3,4(a3)
    8704:	18d030ef          	jal	c090 <__adddf3>
    8708:	04012783          	lw	a5,64(sp)
    870c:	04812703          	lw	a4,72(sp)
    8710:	fcc006b7          	lui	a3,0xfcc00
    8714:	00050c93          	mv	s9,a0
    8718:	00b68bb3          	add	s7,a3,a1
    871c:	7fff8697          	auipc	a3,0x7fff8
    8720:	fe468693          	add	a3,a3,-28 # 80000700 <__global_locale+0x1cc>
    8724:	0006a603          	lw	a2,0(a3)
    8728:	0046a683          	lw	a3,4(a3)
    872c:	00070513          	mv	a0,a4
    8730:	00078593          	mv	a1,a5
    8734:	4f4050ef          	jal	dc28 <__subdf3>
    8738:	000c8613          	mv	a2,s9
    873c:	000b8693          	mv	a3,s7
    8740:	00050d13          	mv	s10,a0
    8744:	00058913          	mv	s2,a1
    8748:	349040ef          	jal	d290 <__gedf2>
    874c:	50a04ce3          	bgtz	a0,9464 <_dtoa_r+0x155c>
    8750:	800007b7          	lui	a5,0x80000
    8754:	0177c7b3          	xor	a5,a5,s7
    8758:	000c8613          	mv	a2,s9
    875c:	000d0513          	mv	a0,s10
    8760:	00078693          	mv	a3,a5
    8764:	00090593          	mv	a1,s2
    8768:	429040ef          	jal	d390 <__ledf2>
    876c:	06054c63          	bltz	a0,87e4 <_dtoa_r+0x8dc>
    8770:	06c12783          	lw	a5,108(sp)
    8774:	1a07c663          	bltz	a5,8920 <_dtoa_r+0xa18>
    8778:	02012683          	lw	a3,32(sp)
    877c:	00e00713          	li	a4,14
    8780:	1ad74063          	blt	a4,a3,8920 <_dtoa_r+0xa18>
    8784:	02012783          	lw	a5,32(sp)
    8788:	00379713          	sll	a4,a5,0x3
    878c:	00007797          	auipc	a5,0x7
    8790:	e3c78793          	add	a5,a5,-452 # f5c8 <__mprec_tens>
    8794:	00e787b3          	add	a5,a5,a4
    8798:	0007a903          	lw	s2,0(a5)
    879c:	0047a983          	lw	s3,4(a5)
    87a0:	01412783          	lw	a5,20(sp)
    87a4:	0407dc63          	bgez	a5,87fc <_dtoa_r+0x8f4>
    87a8:	05804a63          	bgtz	s8,87fc <_dtoa_r+0x8f4>
    87ac:	020c1c63          	bnez	s8,87e4 <_dtoa_r+0x8dc>
    87b0:	7fff8797          	auipc	a5,0x7fff8
    87b4:	f5078793          	add	a5,a5,-176 # 80000700 <__global_locale+0x1cc>
    87b8:	0007a603          	lw	a2,0(a5)
    87bc:	0047a683          	lw	a3,4(a5)
    87c0:	00090513          	mv	a0,s2
    87c4:	00098593          	mv	a1,s3
    87c8:	4d1040ef          	jal	d498 <__muldf3>
    87cc:	00050613          	mv	a2,a0
    87d0:	00058693          	mv	a3,a1
    87d4:	01812503          	lw	a0,24(sp)
    87d8:	01c12583          	lw	a1,28(sp)
    87dc:	3b5040ef          	jal	d390 <__ledf2>
    87e0:	48a042e3          	bgtz	a0,9464 <_dtoa_r+0x155c>
    87e4:	000a8d13          	mv	s10,s5
    87e8:	00012c23          	sw	zero,24(sp)
    87ec:	00000913          	li	s2,0
    87f0:	01412783          	lw	a5,20(sp)
    87f4:	fff7ca13          	not	s4,a5
    87f8:	6980006f          	j	8e90 <_dtoa_r+0xf88>
    87fc:	001a8793          	add	a5,s5,1
    8800:	04f12023          	sw	a5,64(sp)
    8804:	01812b03          	lw	s6,24(sp)
    8808:	01c12a03          	lw	s4,28(sp)
    880c:	00090613          	mv	a2,s2
    8810:	00098693          	mv	a3,s3
    8814:	000b0513          	mv	a0,s6
    8818:	000a0593          	mv	a1,s4
    881c:	13c040ef          	jal	c958 <__divdf3>
    8820:	565050ef          	jal	e584 <__fixdfsi>
    8824:	00050d13          	mv	s10,a0
    8828:	5e1050ef          	jal	e608 <__floatsidf>
    882c:	00090613          	mv	a2,s2
    8830:	00098693          	mv	a3,s3
    8834:	465040ef          	jal	d498 <__muldf3>
    8838:	00050613          	mv	a2,a0
    883c:	00058693          	mv	a3,a1
    8840:	000b0513          	mv	a0,s6
    8844:	000a0593          	mv	a1,s4
    8848:	3e0050ef          	jal	dc28 <__subdf3>
    884c:	030d0793          	add	a5,s10,48
    8850:	00fa8023          	sb	a5,0(s5)
    8854:	00100613          	li	a2,1
    8858:	04012b83          	lw	s7,64(sp)
    885c:	00050713          	mv	a4,a0
    8860:	00058693          	mv	a3,a1
    8864:	0ccc0ee3          	beq	s8,a2,9140 <_dtoa_r+0x1238>
    8868:	7fff8617          	auipc	a2,0x7fff8
    886c:	e8860613          	add	a2,a2,-376 # 800006f0 <__global_locale+0x1bc>
    8870:	00062783          	lw	a5,0(a2)
    8874:	00462803          	lw	a6,4(a2)
    8878:	00100d93          	li	s11,1
    887c:	00f12023          	sw	a5,0(sp)
    8880:	01012223          	sw	a6,4(sp)
    8884:	0600006f          	j	88e4 <_dtoa_r+0x9dc>
    8888:	00090613          	mv	a2,s2
    888c:	00098693          	mv	a3,s3
    8890:	000b0513          	mv	a0,s6
    8894:	000a0593          	mv	a1,s4
    8898:	0c0040ef          	jal	c958 <__divdf3>
    889c:	4e9050ef          	jal	e584 <__fixdfsi>
    88a0:	00050d13          	mv	s10,a0
    88a4:	565050ef          	jal	e608 <__floatsidf>
    88a8:	00090613          	mv	a2,s2
    88ac:	00098693          	mv	a3,s3
    88b0:	3e9040ef          	jal	d498 <__muldf3>
    88b4:	00058693          	mv	a3,a1
    88b8:	00050613          	mv	a2,a0
    88bc:	000a0593          	mv	a1,s4
    88c0:	000b0513          	mv	a0,s6
    88c4:	364050ef          	jal	dc28 <__subdf3>
    88c8:	001b8b93          	add	s7,s7,1
    88cc:	030d0793          	add	a5,s10,48
    88d0:	001d8d93          	add	s11,s11,1
    88d4:	fefb8fa3          	sb	a5,-1(s7)
    88d8:	00050713          	mv	a4,a0
    88dc:	00058693          	mv	a3,a1
    88e0:	07bc00e3          	beq	s8,s11,9140 <_dtoa_r+0x1238>
    88e4:	00012603          	lw	a2,0(sp)
    88e8:	00068593          	mv	a1,a3
    88ec:	00412683          	lw	a3,4(sp)
    88f0:	00070513          	mv	a0,a4
    88f4:	3a5040ef          	jal	d498 <__muldf3>
    88f8:	00000613          	li	a2,0
    88fc:	00000693          	li	a3,0
    8900:	00050b13          	mv	s6,a0
    8904:	00058a13          	mv	s4,a1
    8908:	0fd040ef          	jal	d204 <__eqdf2>
    890c:	f6051ee3          	bnez	a0,8888 <_dtoa_r+0x980>
    8910:	02012783          	lw	a5,32(sp)
    8914:	000b8d13          	mv	s10,s7
    8918:	00178a13          	add	s4,a5,1
    891c:	1c00006f          	j	8adc <_dtoa_r+0xbd4>
    8920:	02812703          	lw	a4,40(sp)
    8924:	26071463          	bnez	a4,8b8c <_dtoa_r+0xc84>
    8928:	03012b83          	lw	s7,48(sp)
    892c:	01012c83          	lw	s9,16(sp)
    8930:	02012423          	sw	zero,40(sp)
    8934:	00000913          	li	s2,0
    8938:	020c8263          	beqz	s9,895c <_dtoa_r+0xa54>
    893c:	03605063          	blez	s6,895c <_dtoa_r+0xa54>
    8940:	000c8793          	mv	a5,s9
    8944:	679b4263          	blt	s6,s9,8fa8 <_dtoa_r+0x10a0>
    8948:	01012703          	lw	a4,16(sp)
    894c:	40fc8cb3          	sub	s9,s9,a5
    8950:	40fb0b33          	sub	s6,s6,a5
    8954:	40f70733          	sub	a4,a4,a5
    8958:	00e12823          	sw	a4,16(sp)
    895c:	03012783          	lw	a5,48(sp)
    8960:	02078263          	beqz	a5,8984 <_dtoa_r+0xa7c>
    8964:	02812783          	lw	a5,40(sp)
    8968:	00078463          	beqz	a5,8970 <_dtoa_r+0xa68>
    896c:	060b9ae3          	bnez	s7,91e0 <_dtoa_r+0x12d8>
    8970:	03012603          	lw	a2,48(sp)
    8974:	00048593          	mv	a1,s1
    8978:	00040513          	mv	a0,s0
    897c:	3a4010ef          	jal	9d20 <__pow5mult>
    8980:	00050493          	mv	s1,a0
    8984:	00100593          	li	a1,1
    8988:	00040513          	mv	a0,s0
    898c:	01c010ef          	jal	99a8 <__i2b>
    8990:	00a12c23          	sw	a0,24(sp)
    8994:	50099a63          	bnez	s3,8ea8 <_dtoa_r+0xfa0>
    8998:	00100793          	li	a5,1
    899c:	5547da63          	bge	a5,s4,8ef0 <_dtoa_r+0xfe8>
    89a0:	016787b3          	add	a5,a5,s6
    89a4:	01f7f793          	and	a5,a5,31
    89a8:	1c078e63          	beqz	a5,8b84 <_dtoa_r+0xc7c>
    89ac:	02000713          	li	a4,32
    89b0:	40f70733          	sub	a4,a4,a5
    89b4:	00400693          	li	a3,4
    89b8:	58e6d263          	bge	a3,a4,8f3c <_dtoa_r+0x1034>
    89bc:	01c00713          	li	a4,28
    89c0:	40f707b3          	sub	a5,a4,a5
    89c4:	01012703          	lw	a4,16(sp)
    89c8:	00fc8cb3          	add	s9,s9,a5
    89cc:	00fb0b33          	add	s6,s6,a5
    89d0:	00f70733          	add	a4,a4,a5
    89d4:	00e12823          	sw	a4,16(sp)
    89d8:	01012783          	lw	a5,16(sp)
    89dc:	12f04e63          	bgtz	a5,8b18 <_dtoa_r+0xc10>
    89e0:	01605c63          	blez	s6,89f8 <_dtoa_r+0xaf0>
    89e4:	01812583          	lw	a1,24(sp)
    89e8:	000b0613          	mv	a2,s6
    89ec:	00040513          	mv	a0,s0
    89f0:	480010ef          	jal	9e70 <__lshift>
    89f4:	00a12c23          	sw	a0,24(sp)
    89f8:	03412783          	lw	a5,52(sp)
    89fc:	12079a63          	bnez	a5,8b30 <_dtoa_r+0xc28>
    8a00:	45805263          	blez	s8,8e44 <_dtoa_r+0xf3c>
    8a04:	02812783          	lw	a5,40(sp)
    8a08:	24079e63          	bnez	a5,8c64 <_dtoa_r+0xd5c>
    8a0c:	02012783          	lw	a5,32(sp)
    8a10:	00178a13          	add	s4,a5,1
    8a14:	01812b03          	lw	s6,24(sp)
    8a18:	00100993          	li	s3,1
    8a1c:	0200006f          	j	8a3c <_dtoa_r+0xb34>
    8a20:	00048593          	mv	a1,s1
    8a24:	00000693          	li	a3,0
    8a28:	00a00613          	li	a2,10
    8a2c:	00040513          	mv	a0,s0
    8a30:	49d000ef          	jal	96cc <__multadd>
    8a34:	00050493          	mv	s1,a0
    8a38:	00198993          	add	s3,s3,1
    8a3c:	000b0593          	mv	a1,s6
    8a40:	00048513          	mv	a0,s1
    8a44:	a64ff0ef          	jal	7ca8 <quorem>
    8a48:	03050b93          	add	s7,a0,48
    8a4c:	013a87b3          	add	a5,s5,s3
    8a50:	ff778fa3          	sb	s7,-1(a5)
    8a54:	fd89c6e3          	blt	s3,s8,8a20 <_dtoa_r+0xb18>
    8a58:	00100993          	li	s3,1
    8a5c:	55804263          	bgtz	s8,8fa0 <_dtoa_r+0x1098>
    8a60:	013a89b3          	add	s3,s5,s3
    8a64:	00000c13          	li	s8,0
    8a68:	00048593          	mv	a1,s1
    8a6c:	00100613          	li	a2,1
    8a70:	00040513          	mv	a0,s0
    8a74:	3fc010ef          	jal	9e70 <__lshift>
    8a78:	01812583          	lw	a1,24(sp)
    8a7c:	00050493          	mv	s1,a0
    8a80:	580010ef          	jal	a000 <__mcmp>
    8a84:	4ea05c63          	blez	a0,8f7c <_dtoa_r+0x1074>
    8a88:	03900693          	li	a3,57
    8a8c:	0080006f          	j	8a94 <_dtoa_r+0xb8c>
    8a90:	5f3a8863          	beq	s5,s3,9080 <_dtoa_r+0x1178>
    8a94:	fff9c783          	lbu	a5,-1(s3)
    8a98:	00098d13          	mv	s10,s3
    8a9c:	fff98993          	add	s3,s3,-1
    8aa0:	fed788e3          	beq	a5,a3,8a90 <_dtoa_r+0xb88>
    8aa4:	00178793          	add	a5,a5,1
    8aa8:	00f98023          	sb	a5,0(s3)
    8aac:	01812583          	lw	a1,24(sp)
    8ab0:	00040513          	mv	a0,s0
    8ab4:	3f5000ef          	jal	96a8 <_Bfree>
    8ab8:	02090263          	beqz	s2,8adc <_dtoa_r+0xbd4>
    8abc:	000c0a63          	beqz	s8,8ad0 <_dtoa_r+0xbc8>
    8ac0:	012c0863          	beq	s8,s2,8ad0 <_dtoa_r+0xbc8>
    8ac4:	000c0593          	mv	a1,s8
    8ac8:	00040513          	mv	a0,s0
    8acc:	3dd000ef          	jal	96a8 <_Bfree>
    8ad0:	00090593          	mv	a1,s2
    8ad4:	00040513          	mv	a0,s0
    8ad8:	3d1000ef          	jal	96a8 <_Bfree>
    8adc:	00048593          	mv	a1,s1
    8ae0:	00040513          	mv	a0,s0
    8ae4:	3c5000ef          	jal	96a8 <_Bfree>
    8ae8:	00c12783          	lw	a5,12(sp)
    8aec:	000d0023          	sb	zero,0(s10)
    8af0:	0147a023          	sw	s4,0(a5)
    8af4:	00812783          	lw	a5,8(sp)
    8af8:	00078463          	beqz	a5,8b00 <_dtoa_r+0xbf8>
    8afc:	01a7a023          	sw	s10,0(a5)
    8b00:	09012b03          	lw	s6,144(sp)
    8b04:	08c12b83          	lw	s7,140(sp)
    8b08:	08812c03          	lw	s8,136(sp)
    8b0c:	08412c83          	lw	s9,132(sp)
    8b10:	08012d03          	lw	s10,128(sp)
    8b14:	ce4ff06f          	j	7ff8 <_dtoa_r+0xf0>
    8b18:	00048593          	mv	a1,s1
    8b1c:	00078613          	mv	a2,a5
    8b20:	00040513          	mv	a0,s0
    8b24:	34c010ef          	jal	9e70 <__lshift>
    8b28:	00050493          	mv	s1,a0
    8b2c:	eb5ff06f          	j	89e0 <_dtoa_r+0xad8>
    8b30:	01812583          	lw	a1,24(sp)
    8b34:	00048513          	mv	a0,s1
    8b38:	4c8010ef          	jal	a000 <__mcmp>
    8b3c:	ec0552e3          	bgez	a0,8a00 <_dtoa_r+0xaf8>
    8b40:	02012783          	lw	a5,32(sp)
    8b44:	00048593          	mv	a1,s1
    8b48:	00000693          	li	a3,0
    8b4c:	00a00613          	li	a2,10
    8b50:	00040513          	mv	a0,s0
    8b54:	fff78b13          	add	s6,a5,-1
    8b58:	375000ef          	jal	96cc <__multadd>
    8b5c:	02812783          	lw	a5,40(sp)
    8b60:	00050493          	mv	s1,a0
    8b64:	0c079e63          	bnez	a5,8c40 <_dtoa_r+0xd38>
    8b68:	03c12c03          	lw	s8,60(sp)
    8b6c:	17805ee3          	blez	s8,94e8 <_dtoa_r+0x15e0>
    8b70:	02012a03          	lw	s4,32(sp)
    8b74:	ea1ff06f          	j	8a14 <_dtoa_r+0xb0c>
    8b78:	00100793          	li	a5,1
    8b7c:	02f12a23          	sw	a5,52(sp)
    8b80:	e28ff06f          	j	81a8 <_dtoa_r+0x2a0>
    8b84:	01c00793          	li	a5,28
    8b88:	e3dff06f          	j	89c4 <_dtoa_r+0xabc>
    8b8c:	00100713          	li	a4,1
    8b90:	4d475463          	bge	a4,s4,9058 <_dtoa_r+0x1150>
    8b94:	03012783          	lw	a5,48(sp)
    8b98:	fffc0b93          	add	s7,s8,-1
    8b9c:	4177ca63          	blt	a5,s7,8fb0 <_dtoa_r+0x10a8>
    8ba0:	41778bb3          	sub	s7,a5,s7
    8ba4:	01012783          	lw	a5,16(sp)
    8ba8:	41878cb3          	sub	s9,a5,s8
    8bac:	100c54e3          	bgez	s8,94b4 <_dtoa_r+0x15ac>
    8bb0:	00100593          	li	a1,1
    8bb4:	00040513          	mv	a0,s0
    8bb8:	5f1000ef          	jal	99a8 <__i2b>
    8bbc:	00050913          	mv	s2,a0
    8bc0:	d79ff06f          	j	8938 <_dtoa_r+0xa30>
    8bc4:	02012a23          	sw	zero,52(sp)
    8bc8:	00012823          	sw	zero,16(sp)
    8bcc:	ab5042e3          	bgtz	s5,8670 <_dtoa_r+0x768>
    8bd0:	00100793          	li	a5,1
    8bd4:	415787b3          	sub	a5,a5,s5
    8bd8:	00f12823          	sw	a5,16(sp)
    8bdc:	00000b13          	li	s6,0
    8be0:	a91ff06f          	j	8670 <_dtoa_r+0x768>
    8be4:	40e787b3          	sub	a5,a5,a4
    8be8:	00fd9533          	sll	a0,s11,a5
    8bec:	ca0ff06f          	j	808c <_dtoa_r+0x184>
    8bf0:	00300793          	li	a5,3
    8bf4:	00100913          	li	s2,1
    8bf8:	44fa0c63          	beq	s4,a5,9050 <_dtoa_r+0x1148>
    8bfc:	df47cc63          	blt	a5,s4,81f4 <_dtoa_r+0x2ec>
    8c00:	00200793          	li	a5,2
    8c04:	18fa00e3          	beq	s4,a5,9584 <_dtoa_r+0x167c>
    8c08:	02042e23          	sw	zero,60(s0)
    8c0c:	00000593          	li	a1,0
    8c10:	00040513          	mv	a0,s0
    8c14:	1e1000ef          	jal	95f4 <_Balloc>
    8c18:	00050a93          	mv	s5,a0
    8c1c:	140500e3          	beqz	a0,955c <_dtoa_r+0x1654>
    8c20:	00100793          	li	a5,1
    8c24:	02f12423          	sw	a5,40(sp)
    8c28:	fff00793          	li	a5,-1
    8c2c:	02a42c23          	sw	a0,56(s0)
    8c30:	02f12e23          	sw	a5,60(sp)
    8c34:	fff00c13          	li	s8,-1
    8c38:	00012a23          	sw	zero,20(sp)
    8c3c:	b35ff06f          	j	8770 <_dtoa_r+0x868>
    8c40:	00090593          	mv	a1,s2
    8c44:	00000693          	li	a3,0
    8c48:	00a00613          	li	a2,10
    8c4c:	00040513          	mv	a0,s0
    8c50:	27d000ef          	jal	96cc <__multadd>
    8c54:	03c12c03          	lw	s8,60(sp)
    8c58:	00050913          	mv	s2,a0
    8c5c:	0b805ae3          	blez	s8,9510 <_dtoa_r+0x1608>
    8c60:	03612023          	sw	s6,32(sp)
    8c64:	01905c63          	blez	s9,8c7c <_dtoa_r+0xd74>
    8c68:	00090593          	mv	a1,s2
    8c6c:	000c8613          	mv	a2,s9
    8c70:	00040513          	mv	a0,s0
    8c74:	1fc010ef          	jal	9e70 <__lshift>
    8c78:	00050913          	mv	s2,a0
    8c7c:	00090b13          	mv	s6,s2
    8c80:	50099e63          	bnez	s3,919c <_dtoa_r+0x1294>
    8c84:	02412783          	lw	a5,36(sp)
    8c88:	fffa8d13          	add	s10,s5,-1
    8c8c:	000a8c93          	mv	s9,s5
    8c90:	01512823          	sw	s5,16(sp)
    8c94:	01812a83          	lw	s5,24(sp)
    8c98:	0017f793          	and	a5,a5,1
    8c9c:	018d0d33          	add	s10,s10,s8
    8ca0:	00f12023          	sw	a5,0(sp)
    8ca4:	01b12a23          	sw	s11,20(sp)
    8ca8:	000a8593          	mv	a1,s5
    8cac:	00048513          	mv	a0,s1
    8cb0:	ff9fe0ef          	jal	7ca8 <quorem>
    8cb4:	00050c13          	mv	s8,a0
    8cb8:	00090593          	mv	a1,s2
    8cbc:	00048513          	mv	a0,s1
    8cc0:	340010ef          	jal	a000 <__mcmp>
    8cc4:	00050993          	mv	s3,a0
    8cc8:	000b0613          	mv	a2,s6
    8ccc:	000a8593          	mv	a1,s5
    8cd0:	00040513          	mv	a0,s0
    8cd4:	384010ef          	jal	a058 <__mdiff>
    8cd8:	00c52703          	lw	a4,12(a0)
    8cdc:	030c0b93          	add	s7,s8,48
    8ce0:	00050d93          	mv	s11,a0
    8ce4:	08071c63          	bnez	a4,8d7c <_dtoa_r+0xe74>
    8ce8:	00050593          	mv	a1,a0
    8cec:	00048513          	mv	a0,s1
    8cf0:	310010ef          	jal	a000 <__mcmp>
    8cf4:	00050713          	mv	a4,a0
    8cf8:	000d8593          	mv	a1,s11
    8cfc:	00040513          	mv	a0,s0
    8d00:	00070d93          	mv	s11,a4
    8d04:	1a5000ef          	jal	96a8 <_Bfree>
    8d08:	014de6b3          	or	a3,s11,s4
    8d0c:	0e069a63          	bnez	a3,8e00 <_dtoa_r+0xef8>
    8d10:	00012783          	lw	a5,0(sp)
    8d14:	76078e63          	beqz	a5,9490 <_dtoa_r+0x1588>
    8d18:	7809c663          	bltz	s3,94a4 <_dtoa_r+0x159c>
    8d1c:	017c8023          	sb	s7,0(s9)
    8d20:	001c8993          	add	s3,s9,1
    8d24:	679d0e63          	beq	s10,s9,93a0 <_dtoa_r+0x1498>
    8d28:	00048593          	mv	a1,s1
    8d2c:	00000693          	li	a3,0
    8d30:	00a00613          	li	a2,10
    8d34:	00040513          	mv	a0,s0
    8d38:	195000ef          	jal	96cc <__multadd>
    8d3c:	00050493          	mv	s1,a0
    8d40:	00000693          	li	a3,0
    8d44:	00a00613          	li	a2,10
    8d48:	00090593          	mv	a1,s2
    8d4c:	00040513          	mv	a0,s0
    8d50:	09690e63          	beq	s2,s6,8dec <_dtoa_r+0xee4>
    8d54:	179000ef          	jal	96cc <__multadd>
    8d58:	000b0593          	mv	a1,s6
    8d5c:	00050913          	mv	s2,a0
    8d60:	00000693          	li	a3,0
    8d64:	00a00613          	li	a2,10
    8d68:	00040513          	mv	a0,s0
    8d6c:	161000ef          	jal	96cc <__multadd>
    8d70:	00050b13          	mv	s6,a0
    8d74:	00098c93          	mv	s9,s3
    8d78:	f31ff06f          	j	8ca8 <_dtoa_r+0xda0>
    8d7c:	00050593          	mv	a1,a0
    8d80:	00040513          	mv	a0,s0
    8d84:	01012a83          	lw	s5,16(sp)
    8d88:	01412d83          	lw	s11,20(sp)
    8d8c:	11d000ef          	jal	96a8 <_Bfree>
    8d90:	0009ca63          	bltz	s3,8da4 <_dtoa_r+0xe9c>
    8d94:	001df713          	and	a4,s11,1
    8d98:	0149e9b3          	or	s3,s3,s4
    8d9c:	01376733          	or	a4,a4,s3
    8da0:	06071e63          	bnez	a4,8e1c <_dtoa_r+0xf14>
    8da4:	00048593          	mv	a1,s1
    8da8:	00100613          	li	a2,1
    8dac:	00040513          	mv	a0,s0
    8db0:	0c0010ef          	jal	9e70 <__lshift>
    8db4:	01812583          	lw	a1,24(sp)
    8db8:	00050493          	mv	s1,a0
    8dbc:	244010ef          	jal	a000 <__mcmp>
    8dc0:	24a05863          	blez	a0,9010 <_dtoa_r+0x1108>
    8dc4:	03900713          	li	a4,57
    8dc8:	24eb8c63          	beq	s7,a4,9020 <_dtoa_r+0x1118>
    8dcc:	031c0b93          	add	s7,s8,49
    8dd0:	02012783          	lw	a5,32(sp)
    8dd4:	00090c13          	mv	s8,s2
    8dd8:	001c8d13          	add	s10,s9,1
    8ddc:	017c8023          	sb	s7,0(s9)
    8de0:	00178a13          	add	s4,a5,1
    8de4:	000b0913          	mv	s2,s6
    8de8:	cc5ff06f          	j	8aac <_dtoa_r+0xba4>
    8dec:	0e1000ef          	jal	96cc <__multadd>
    8df0:	00050913          	mv	s2,a0
    8df4:	00050b13          	mv	s6,a0
    8df8:	00098c93          	mv	s9,s3
    8dfc:	eadff06f          	j	8ca8 <_dtoa_r+0xda0>
    8e00:	7409c863          	bltz	s3,9550 <_dtoa_r+0x1648>
    8e04:	00012783          	lw	a5,0(sp)
    8e08:	0149e9b3          	or	s3,s3,s4
    8e0c:	0137e9b3          	or	s3,a5,s3
    8e10:	74098063          	beqz	s3,9550 <_dtoa_r+0x1648>
    8e14:	f1b054e3          	blez	s11,8d1c <_dtoa_r+0xe14>
    8e18:	01012a83          	lw	s5,16(sp)
    8e1c:	03900713          	li	a4,57
    8e20:	20eb8063          	beq	s7,a4,9020 <_dtoa_r+0x1118>
    8e24:	02012703          	lw	a4,32(sp)
    8e28:	001b8793          	add	a5,s7,1
    8e2c:	00090c13          	mv	s8,s2
    8e30:	001c8d13          	add	s10,s9,1
    8e34:	00170a13          	add	s4,a4,1
    8e38:	00fc8023          	sb	a5,0(s9)
    8e3c:	000b0913          	mv	s2,s6
    8e40:	c6dff06f          	j	8aac <_dtoa_r+0xba4>
    8e44:	00200793          	li	a5,2
    8e48:	bb47dee3          	bge	a5,s4,8a04 <_dtoa_r+0xafc>
    8e4c:	000a8d13          	mv	s10,s5
    8e50:	9a0c10e3          	bnez	s8,87f0 <_dtoa_r+0x8e8>
    8e54:	01812583          	lw	a1,24(sp)
    8e58:	00000693          	li	a3,0
    8e5c:	00500613          	li	a2,5
    8e60:	00040513          	mv	a0,s0
    8e64:	069000ef          	jal	96cc <__multadd>
    8e68:	00050593          	mv	a1,a0
    8e6c:	00a12c23          	sw	a0,24(sp)
    8e70:	00048513          	mv	a0,s1
    8e74:	18c010ef          	jal	a000 <__mcmp>
    8e78:	96a05ce3          	blez	a0,87f0 <_dtoa_r+0x8e8>
    8e7c:	03100793          	li	a5,49
    8e80:	00fa8023          	sb	a5,0(s5)
    8e84:	02012783          	lw	a5,32(sp)
    8e88:	001a8d13          	add	s10,s5,1
    8e8c:	00178a13          	add	s4,a5,1
    8e90:	01812583          	lw	a1,24(sp)
    8e94:	00040513          	mv	a0,s0
    8e98:	001a0a13          	add	s4,s4,1
    8e9c:	00d000ef          	jal	96a8 <_Bfree>
    8ea0:	c20918e3          	bnez	s2,8ad0 <_dtoa_r+0xbc8>
    8ea4:	c39ff06f          	j	8adc <_dtoa_r+0xbd4>
    8ea8:	00050593          	mv	a1,a0
    8eac:	00098613          	mv	a2,s3
    8eb0:	00040513          	mv	a0,s0
    8eb4:	66d000ef          	jal	9d20 <__pow5mult>
    8eb8:	00100793          	li	a5,1
    8ebc:	00a12c23          	sw	a0,24(sp)
    8ec0:	1147de63          	bge	a5,s4,8fdc <_dtoa_r+0x10d4>
    8ec4:	00000993          	li	s3,0
    8ec8:	01812703          	lw	a4,24(sp)
    8ecc:	01072783          	lw	a5,16(a4)
    8ed0:	00378793          	add	a5,a5,3
    8ed4:	00279793          	sll	a5,a5,0x2
    8ed8:	00f707b3          	add	a5,a4,a5
    8edc:	0047a503          	lw	a0,4(a5)
    8ee0:	171000ef          	jal	9850 <__hi0bits>
    8ee4:	02000793          	li	a5,32
    8ee8:	40a787b3          	sub	a5,a5,a0
    8eec:	ab5ff06f          	j	89a0 <_dtoa_r+0xa98>
    8ef0:	02412783          	lw	a5,36(sp)
    8ef4:	04079063          	bnez	a5,8f34 <_dtoa_r+0x102c>
    8ef8:	00012783          	lw	a5,0(sp)
    8efc:	00c79793          	sll	a5,a5,0xc
    8f00:	02079a63          	bnez	a5,8f34 <_dtoa_r+0x102c>
    8f04:	00012683          	lw	a3,0(sp)
    8f08:	00000793          	li	a5,0
    8f0c:	0146d713          	srl	a4,a3,0x14
    8f10:	7ff77713          	and	a4,a4,2047
    8f14:	00070c63          	beqz	a4,8f2c <_dtoa_r+0x1024>
    8f18:	01012783          	lw	a5,16(sp)
    8f1c:	001b0b13          	add	s6,s6,1
    8f20:	00178793          	add	a5,a5,1
    8f24:	00f12823          	sw	a5,16(sp)
    8f28:	00100793          	li	a5,1
    8f2c:	58099063          	bnez	s3,94ac <_dtoa_r+0x15a4>
    8f30:	00078993          	mv	s3,a5
    8f34:	00100793          	li	a5,1
    8f38:	a69ff06f          	j	89a0 <_dtoa_r+0xa98>
    8f3c:	a8d70ee3          	beq	a4,a3,89d8 <_dtoa_r+0xad0>
    8f40:	03c00713          	li	a4,60
    8f44:	40f707b3          	sub	a5,a4,a5
    8f48:	a7dff06f          	j	89c4 <_dtoa_r+0xabc>
    8f4c:	00100793          	li	a5,1
    8f50:	00500a13          	li	s4,5
    8f54:	02f12423          	sw	a5,40(sp)
    8f58:	01412783          	lw	a5,20(sp)
    8f5c:	02012703          	lw	a4,32(sp)
    8f60:	00e787b3          	add	a5,a5,a4
    8f64:	00178c13          	add	s8,a5,1
    8f68:	02f12e23          	sw	a5,60(sp)
    8f6c:	000c0613          	mv	a2,s8
    8f70:	ab804263          	bgtz	s8,8214 <_dtoa_r+0x30c>
    8f74:	00100613          	li	a2,1
    8f78:	a9cff06f          	j	8214 <_dtoa_r+0x30c>
    8f7c:	00051663          	bnez	a0,8f88 <_dtoa_r+0x1080>
    8f80:	001bf793          	and	a5,s7,1
    8f84:	b00792e3          	bnez	a5,8a88 <_dtoa_r+0xb80>
    8f88:	03000693          	li	a3,48
    8f8c:	fff9c783          	lbu	a5,-1(s3)
    8f90:	00098d13          	mv	s10,s3
    8f94:	fff98993          	add	s3,s3,-1
    8f98:	fed78ae3          	beq	a5,a3,8f8c <_dtoa_r+0x1084>
    8f9c:	b11ff06f          	j	8aac <_dtoa_r+0xba4>
    8fa0:	000c0993          	mv	s3,s8
    8fa4:	abdff06f          	j	8a60 <_dtoa_r+0xb58>
    8fa8:	000b0793          	mv	a5,s6
    8fac:	99dff06f          	j	8948 <_dtoa_r+0xa40>
    8fb0:	03012783          	lw	a5,48(sp)
    8fb4:	01012703          	lw	a4,16(sp)
    8fb8:	03712823          	sw	s7,48(sp)
    8fbc:	40fb87b3          	sub	a5,s7,a5
    8fc0:	00f989b3          	add	s3,s3,a5
    8fc4:	018707b3          	add	a5,a4,s8
    8fc8:	00070c93          	mv	s9,a4
    8fcc:	018b0b33          	add	s6,s6,s8
    8fd0:	00f12823          	sw	a5,16(sp)
    8fd4:	00000b93          	li	s7,0
    8fd8:	bd9ff06f          	j	8bb0 <_dtoa_r+0xca8>
    8fdc:	02412783          	lw	a5,36(sp)
    8fe0:	ee0792e3          	bnez	a5,8ec4 <_dtoa_r+0xfbc>
    8fe4:	00012783          	lw	a5,0(sp)
    8fe8:	00c79793          	sll	a5,a5,0xc
    8fec:	ec079ce3          	bnez	a5,8ec4 <_dtoa_r+0xfbc>
    8ff0:	f15ff06f          	j	8f04 <_dtoa_r+0xffc>
    8ff4:	01812303          	lw	t1,24(sp)
    8ff8:	01c12d03          	lw	s10,28(sp)
    8ffc:	00200913          	li	s2,2
    9000:	ad0ff06f          	j	82d0 <_dtoa_r+0x3c8>
    9004:	00200a13          	li	s4,2
    9008:	02012423          	sw	zero,40(sp)
    900c:	9f8ff06f          	j	8204 <_dtoa_r+0x2fc>
    9010:	dc0510e3          	bnez	a0,8dd0 <_dtoa_r+0xec8>
    9014:	001bf713          	and	a4,s7,1
    9018:	da0716e3          	bnez	a4,8dc4 <_dtoa_r+0xebc>
    901c:	db5ff06f          	j	8dd0 <_dtoa_r+0xec8>
    9020:	03900793          	li	a5,57
    9024:	00fc8023          	sb	a5,0(s9)
    9028:	02012783          	lw	a5,32(sp)
    902c:	00090c13          	mv	s8,s2
    9030:	001c8993          	add	s3,s9,1
    9034:	00178a13          	add	s4,a5,1
    9038:	000b0913          	mv	s2,s6
    903c:	a4dff06f          	j	8a88 <_dtoa_r+0xb80>
    9040:	00100793          	li	a5,1
    9044:	00100c13          	li	s8,1
    9048:	00f12a23          	sw	a5,20(sp)
    904c:	e50ff06f          	j	869c <_dtoa_r+0x794>
    9050:	02012423          	sw	zero,40(sp)
    9054:	f05ff06f          	j	8f58 <_dtoa_r+0x1050>
    9058:	03812703          	lw	a4,56(sp)
    905c:	30070e63          	beqz	a4,9378 <_dtoa_r+0x1470>
    9060:	01012703          	lw	a4,16(sp)
    9064:	43378793          	add	a5,a5,1075
    9068:	00fb0b33          	add	s6,s6,a5
    906c:	00f707b3          	add	a5,a4,a5
    9070:	03012b83          	lw	s7,48(sp)
    9074:	00070c93          	mv	s9,a4
    9078:	00f12823          	sw	a5,16(sp)
    907c:	b35ff06f          	j	8bb0 <_dtoa_r+0xca8>
    9080:	03100793          	li	a5,49
    9084:	00fa8023          	sb	a5,0(s5)
    9088:	001a0a13          	add	s4,s4,1
    908c:	a21ff06f          	j	8aac <_dtoa_r+0xba4>
    9090:	02012783          	lw	a5,32(sp)
    9094:	32078263          	beqz	a5,93b8 <_dtoa_r+0x14b0>
    9098:	40f00bb3          	neg	s7,a5
    909c:	00fbf713          	and	a4,s7,15
    90a0:	00371713          	sll	a4,a4,0x3
    90a4:	00006797          	auipc	a5,0x6
    90a8:	52478793          	add	a5,a5,1316 # f5c8 <__mprec_tens>
    90ac:	00e787b3          	add	a5,a5,a4
    90b0:	0007a603          	lw	a2,0(a5)
    90b4:	0047a683          	lw	a3,4(a5)
    90b8:	01812503          	lw	a0,24(sp)
    90bc:	01c12583          	lw	a1,28(sp)
    90c0:	404bdb93          	sra	s7,s7,0x4
    90c4:	3d4040ef          	jal	d498 <__muldf3>
    90c8:	00058d13          	mv	s10,a1
    90cc:	440b8c63          	beqz	s7,9524 <_dtoa_r+0x161c>
    90d0:	00200913          	li	s2,2
    90d4:	04812023          	sw	s0,64(sp)
    90d8:	00006c97          	auipc	s9,0x6
    90dc:	4c8c8c93          	add	s9,s9,1224 # f5a0 <__mprec_bigtens>
    90e0:	00090413          	mv	s0,s2
    90e4:	00050713          	mv	a4,a0
    90e8:	00000613          	li	a2,0
    90ec:	00050913          	mv	s2,a0
    90f0:	001bf693          	and	a3,s7,1
    90f4:	02068063          	beqz	a3,9114 <_dtoa_r+0x120c>
    90f8:	000ca603          	lw	a2,0(s9)
    90fc:	004ca683          	lw	a3,4(s9)
    9100:	00070513          	mv	a0,a4
    9104:	00140413          	add	s0,s0,1
    9108:	390040ef          	jal	d498 <__muldf3>
    910c:	00050713          	mv	a4,a0
    9110:	00100613          	li	a2,1
    9114:	401bdb93          	sra	s7,s7,0x1
    9118:	008c8c93          	add	s9,s9,8
    911c:	fc0b9ae3          	bnez	s7,90f0 <_dtoa_r+0x11e8>
    9120:	00090513          	mv	a0,s2
    9124:	00058793          	mv	a5,a1
    9128:	00040913          	mv	s2,s0
    912c:	04012403          	lw	s0,64(sp)
    9130:	a0061a63          	bnez	a2,8344 <_dtoa_r+0x43c>
    9134:	00050713          	mv	a4,a0
    9138:	000d0793          	mv	a5,s10
    913c:	a08ff06f          	j	8344 <_dtoa_r+0x43c>
    9140:	00068593          	mv	a1,a3
    9144:	00070613          	mv	a2,a4
    9148:	00070513          	mv	a0,a4
    914c:	745020ef          	jal	c090 <__adddf3>
    9150:	02012783          	lw	a5,32(sp)
    9154:	00090613          	mv	a2,s2
    9158:	00098693          	mv	a3,s3
    915c:	00178a13          	add	s4,a5,1
    9160:	00050c93          	mv	s9,a0
    9164:	00058b13          	mv	s6,a1
    9168:	000a0c13          	mv	s8,s4
    916c:	124040ef          	jal	d290 <__gedf2>
    9170:	c4a04863          	bgtz	a0,85c0 <_dtoa_r+0x6b8>
    9174:	000c8513          	mv	a0,s9
    9178:	000b0593          	mv	a1,s6
    917c:	00090613          	mv	a2,s2
    9180:	00098693          	mv	a3,s3
    9184:	080040ef          	jal	d204 <__eqdf2>
    9188:	00051663          	bnez	a0,9194 <_dtoa_r+0x128c>
    918c:	001d7d13          	and	s10,s10,1
    9190:	c20d1863          	bnez	s10,85c0 <_dtoa_r+0x6b8>
    9194:	000b8d13          	mv	s10,s7
    9198:	945ff06f          	j	8adc <_dtoa_r+0xbd4>
    919c:	00492583          	lw	a1,4(s2)
    91a0:	00040513          	mv	a0,s0
    91a4:	450000ef          	jal	95f4 <_Balloc>
    91a8:	00050993          	mv	s3,a0
    91ac:	38050463          	beqz	a0,9534 <_dtoa_r+0x162c>
    91b0:	01092603          	lw	a2,16(s2)
    91b4:	00c90593          	add	a1,s2,12
    91b8:	00c50513          	add	a0,a0,12
    91bc:	00260613          	add	a2,a2,2
    91c0:	00261613          	sll	a2,a2,0x2
    91c4:	ccdf70ef          	jal	e90 <memcpy>
    91c8:	00100613          	li	a2,1
    91cc:	00098593          	mv	a1,s3
    91d0:	00040513          	mv	a0,s0
    91d4:	49d000ef          	jal	9e70 <__lshift>
    91d8:	00050b13          	mv	s6,a0
    91dc:	aa9ff06f          	j	8c84 <_dtoa_r+0xd7c>
    91e0:	00090593          	mv	a1,s2
    91e4:	000b8613          	mv	a2,s7
    91e8:	00040513          	mv	a0,s0
    91ec:	335000ef          	jal	9d20 <__pow5mult>
    91f0:	00048613          	mv	a2,s1
    91f4:	00050593          	mv	a1,a0
    91f8:	00050913          	mv	s2,a0
    91fc:	00040513          	mv	a0,s0
    9200:	059000ef          	jal	9a58 <__multiply>
    9204:	00050793          	mv	a5,a0
    9208:	00048593          	mv	a1,s1
    920c:	00040513          	mv	a0,s0
    9210:	00078493          	mv	s1,a5
    9214:	494000ef          	jal	96a8 <_Bfree>
    9218:	03012783          	lw	a5,48(sp)
    921c:	417787b3          	sub	a5,a5,s7
    9220:	02f12823          	sw	a5,48(sp)
    9224:	f6078063          	beqz	a5,8984 <_dtoa_r+0xa7c>
    9228:	f48ff06f          	j	8970 <_dtoa_r+0xa68>
    922c:	05012603          	lw	a2,80(sp)
    9230:	05412683          	lw	a3,84(sp)
    9234:	05812503          	lw	a0,88(sp)
    9238:	04b12623          	sw	a1,76(sp)
    923c:	000b8593          	mv	a1,s7
    9240:	02612423          	sw	t1,40(sp)
    9244:	254040ef          	jal	d498 <__muldf3>
    9248:	02812303          	lw	t1,40(sp)
    924c:	04812783          	lw	a5,72(sp)
    9250:	00100693          	li	a3,1
    9254:	006a8023          	sb	t1,0(s5)
    9258:	02a12c23          	sw	a0,56(sp)
    925c:	04c12883          	lw	a7,76(sp)
    9260:	00058913          	mv	s2,a1
    9264:	00fa8bb3          	add	s7,s5,a5
    9268:	7fff7617          	auipc	a2,0x7fff7
    926c:	48860613          	add	a2,a2,1160 # 800006f0 <__global_locale+0x1bc>
    9270:	28d78c63          	beq	a5,a3,9508 <_dtoa_r+0x1600>
    9274:	00062783          	lw	a5,0(a2)
    9278:	00462803          	lw	a6,4(a2)
    927c:	04912423          	sw	s1,72(sp)
    9280:	02f12423          	sw	a5,40(sp)
    9284:	03012623          	sw	a6,44(sp)
    9288:	04812623          	sw	s0,76(sp)
    928c:	000c8513          	mv	a0,s9
    9290:	00088593          	mv	a1,a7
    9294:	02812603          	lw	a2,40(sp)
    9298:	02c12683          	lw	a3,44(sp)
    929c:	001d0d13          	add	s10,s10,1
    92a0:	1f8040ef          	jal	d498 <__muldf3>
    92a4:	00058413          	mv	s0,a1
    92a8:	00050493          	mv	s1,a0
    92ac:	2d8050ef          	jal	e584 <__fixdfsi>
    92b0:	00050c93          	mv	s9,a0
    92b4:	354050ef          	jal	e608 <__floatsidf>
    92b8:	00050613          	mv	a2,a0
    92bc:	00058693          	mv	a3,a1
    92c0:	00048513          	mv	a0,s1
    92c4:	00040593          	mv	a1,s0
    92c8:	030c8c93          	add	s9,s9,48
    92cc:	15d040ef          	jal	dc28 <__subdf3>
    92d0:	ff9d0fa3          	sb	s9,-1(s10)
    92d4:	fdab90e3          	bne	s7,s10,9294 <_dtoa_r+0x138c>
    92d8:	04812483          	lw	s1,72(sp)
    92dc:	04c12403          	lw	s0,76(sp)
    92e0:	00050c93          	mv	s9,a0
    92e4:	00058893          	mv	a7,a1
    92e8:	7fff7d17          	auipc	s10,0x7fff7
    92ec:	3d0d0d13          	add	s10,s10,976 # 800006b8 <__global_locale+0x184>
    92f0:	000d2603          	lw	a2,0(s10)
    92f4:	004d2683          	lw	a3,4(s10)
    92f8:	03812503          	lw	a0,56(sp)
    92fc:	00090593          	mv	a1,s2
    9300:	03112423          	sw	a7,40(sp)
    9304:	58d020ef          	jal	c090 <__adddf3>
    9308:	02812883          	lw	a7,40(sp)
    930c:	000c8613          	mv	a2,s9
    9310:	00088693          	mv	a3,a7
    9314:	07c040ef          	jal	d390 <__ledf2>
    9318:	1a054863          	bltz	a0,94c8 <_dtoa_r+0x15c0>
    931c:	03812603          	lw	a2,56(sp)
    9320:	000d2503          	lw	a0,0(s10)
    9324:	004d2583          	lw	a1,4(s10)
    9328:	00090693          	mv	a3,s2
    932c:	0fd040ef          	jal	dc28 <__subdf3>
    9330:	02812883          	lw	a7,40(sp)
    9334:	000c8613          	mv	a2,s9
    9338:	00088693          	mv	a3,a7
    933c:	755030ef          	jal	d290 <__gedf2>
    9340:	12a04863          	bgtz	a0,9470 <_dtoa_r+0x1568>
    9344:	06c12783          	lw	a5,108(sp)
    9348:	de07c063          	bltz	a5,8928 <_dtoa_r+0xa20>
    934c:	02012703          	lw	a4,32(sp)
    9350:	00e00793          	li	a5,14
    9354:	dce7ca63          	blt	a5,a4,8928 <_dtoa_r+0xa20>
    9358:	02012783          	lw	a5,32(sp)
    935c:	00006717          	auipc	a4,0x6
    9360:	26c70713          	add	a4,a4,620 # f5c8 <__mprec_tens>
    9364:	00379793          	sll	a5,a5,0x3
    9368:	00f707b3          	add	a5,a4,a5
    936c:	0007a903          	lw	s2,0(a5)
    9370:	0047a983          	lw	s3,4(a5)
    9374:	c90ff06f          	j	8804 <_dtoa_r+0x8fc>
    9378:	06812703          	lw	a4,104(sp)
    937c:	01012683          	lw	a3,16(sp)
    9380:	03600793          	li	a5,54
    9384:	40e787b3          	sub	a5,a5,a4
    9388:	00fb0b33          	add	s6,s6,a5
    938c:	00f687b3          	add	a5,a3,a5
    9390:	03012b83          	lw	s7,48(sp)
    9394:	00068c93          	mv	s9,a3
    9398:	00f12823          	sw	a5,16(sp)
    939c:	815ff06f          	j	8bb0 <_dtoa_r+0xca8>
    93a0:	02012783          	lw	a5,32(sp)
    93a4:	00090c13          	mv	s8,s2
    93a8:	01012a83          	lw	s5,16(sp)
    93ac:	00178a13          	add	s4,a5,1
    93b0:	000b0913          	mv	s2,s6
    93b4:	eb4ff06f          	j	8a68 <_dtoa_r+0xb60>
    93b8:	01812703          	lw	a4,24(sp)
    93bc:	01c12783          	lw	a5,28(sp)
    93c0:	00200913          	li	s2,2
    93c4:	f81fe06f          	j	8344 <_dtoa_r+0x43c>
    93c8:	b00c0063          	beqz	s8,86c8 <_dtoa_r+0x7c0>
    93cc:	03c12d03          	lw	s10,60(sp)
    93d0:	bba05063          	blez	s10,8770 <_dtoa_r+0x868>
    93d4:	7fff7617          	auipc	a2,0x7fff7
    93d8:	31c60613          	add	a2,a2,796 # 800006f0 <__global_locale+0x1bc>
    93dc:	00078593          	mv	a1,a5
    93e0:	02012783          	lw	a5,32(sp)
    93e4:	00462683          	lw	a3,4(a2)
    93e8:	00062603          	lw	a2,0(a2)
    93ec:	fff78793          	add	a5,a5,-1
    93f0:	00070513          	mv	a0,a4
    93f4:	04f12e23          	sw	a5,92(sp)
    93f8:	0a0040ef          	jal	d498 <__muldf3>
    93fc:	00050713          	mv	a4,a0
    9400:	00190513          	add	a0,s2,1
    9404:	04e12423          	sw	a4,72(sp)
    9408:	04b12023          	sw	a1,64(sp)
    940c:	1fc050ef          	jal	e608 <__floatsidf>
    9410:	04812703          	lw	a4,72(sp)
    9414:	04012783          	lw	a5,64(sp)
    9418:	00070613          	mv	a2,a4
    941c:	00078693          	mv	a3,a5
    9420:	04e12623          	sw	a4,76(sp)
    9424:	074040ef          	jal	d498 <__muldf3>
    9428:	7fff7697          	auipc	a3,0x7fff7
    942c:	2d068693          	add	a3,a3,720 # 800006f8 <__global_locale+0x1c4>
    9430:	0006a603          	lw	a2,0(a3)
    9434:	0046a683          	lw	a3,4(a3)
    9438:	459020ef          	jal	c090 <__adddf3>
    943c:	fcc006b7          	lui	a3,0xfcc00
    9440:	04012783          	lw	a5,64(sp)
    9444:	04c12703          	lw	a4,76(sp)
    9448:	00050c93          	mv	s9,a0
    944c:	00b68bb3          	add	s7,a3,a1
    9450:	05a12423          	sw	s10,72(sp)
    9454:	f91fe06f          	j	83e4 <_dtoa_r+0x4dc>
    9458:	03100693          	li	a3,49
    945c:	001c0c13          	add	s8,s8,1
    9460:	984ff06f          	j	85e4 <_dtoa_r+0x6dc>
    9464:	00012c23          	sw	zero,24(sp)
    9468:	00000913          	li	s2,0
    946c:	a11ff06f          	j	8e7c <_dtoa_r+0xf74>
    9470:	03000613          	li	a2,48
    9474:	fffbc783          	lbu	a5,-1(s7)
    9478:	000b8d13          	mv	s10,s7
    947c:	fffb8b93          	add	s7,s7,-1
    9480:	fec78ae3          	beq	a5,a2,9474 <_dtoa_r+0x156c>
    9484:	05c12783          	lw	a5,92(sp)
    9488:	00178a13          	add	s4,a5,1
    948c:	e50ff06f          	j	8adc <_dtoa_r+0xbd4>
    9490:	03900713          	li	a4,57
    9494:	01012a83          	lw	s5,16(sp)
    9498:	b8eb84e3          	beq	s7,a4,9020 <_dtoa_r+0x1118>
    949c:	933048e3          	bgtz	s3,8dcc <_dtoa_r+0xec4>
    94a0:	931ff06f          	j	8dd0 <_dtoa_r+0xec8>
    94a4:	01012a83          	lw	s5,16(sp)
    94a8:	929ff06f          	j	8dd0 <_dtoa_r+0xec8>
    94ac:	00078993          	mv	s3,a5
    94b0:	a19ff06f          	j	8ec8 <_dtoa_r+0xfc0>
    94b4:	00078c93          	mv	s9,a5
    94b8:	018787b3          	add	a5,a5,s8
    94bc:	018b0b33          	add	s6,s6,s8
    94c0:	00f12823          	sw	a5,16(sp)
    94c4:	eecff06f          	j	8bb0 <_dtoa_r+0xca8>
    94c8:	05c12783          	lw	a5,92(sp)
    94cc:	00178c13          	add	s8,a5,1
    94d0:	8f0ff06f          	j	85c0 <_dtoa_r+0x6b8>
    94d4:	04c12983          	lw	s3,76(sp)
    94d8:	05012b03          	lw	s6,80(sp)
    94dc:	05812c03          	lw	s8,88(sp)
    94e0:	04812a03          	lw	s4,72(sp)
    94e4:	a8cff06f          	j	8770 <_dtoa_r+0x868>
    94e8:	00200793          	li	a5,2
    94ec:	0147c863          	blt	a5,s4,94fc <_dtoa_r+0x15f4>
    94f0:	02012a03          	lw	s4,32(sp)
    94f4:	03c12c03          	lw	s8,60(sp)
    94f8:	d1cff06f          	j	8a14 <_dtoa_r+0xb0c>
    94fc:	03c12c03          	lw	s8,60(sp)
    9500:	03612023          	sw	s6,32(sp)
    9504:	949ff06f          	j	8e4c <_dtoa_r+0xf44>
    9508:	04012b83          	lw	s7,64(sp)
    950c:	dddff06f          	j	92e8 <_dtoa_r+0x13e0>
    9510:	00200793          	li	a5,2
    9514:	ff47c4e3          	blt	a5,s4,94fc <_dtoa_r+0x15f4>
    9518:	03c12c03          	lw	s8,60(sp)
    951c:	03612023          	sw	s6,32(sp)
    9520:	f44ff06f          	j	8c64 <_dtoa_r+0xd5c>
    9524:	00050713          	mv	a4,a0
    9528:	00058793          	mv	a5,a1
    952c:	00200913          	li	s2,2
    9530:	e15fe06f          	j	8344 <_dtoa_r+0x43c>
    9534:	00006697          	auipc	a3,0x6
    9538:	a5868693          	add	a3,a3,-1448 # ef8c <__fini_array_end+0x234>
    953c:	00000613          	li	a2,0
    9540:	2ef00593          	li	a1,751
    9544:	00006517          	auipc	a0,0x6
    9548:	a5c50513          	add	a0,a0,-1444 # efa0 <__fini_array_end+0x248>
    954c:	0cd010ef          	jal	ae18 <__assert_func>
    9550:	01012a83          	lw	s5,16(sp)
    9554:	85b048e3          	bgtz	s11,8da4 <_dtoa_r+0xe9c>
    9558:	879ff06f          	j	8dd0 <_dtoa_r+0xec8>
    955c:	00006697          	auipc	a3,0x6
    9560:	a3068693          	add	a3,a3,-1488 # ef8c <__fini_array_end+0x234>
    9564:	00000613          	li	a2,0
    9568:	1af00593          	li	a1,431
    956c:	00006517          	auipc	a0,0x6
    9570:	a3450513          	add	a0,a0,-1484 # efa0 <__fini_array_end+0x248>
    9574:	0a5010ef          	jal	ae18 <__assert_func>
    9578:	02042e23          	sw	zero,60(s0)
    957c:	00000593          	li	a1,0
    9580:	cc1fe06f          	j	8240 <_dtoa_r+0x338>
    9584:	02012423          	sw	zero,40(sp)
    9588:	c7dfe06f          	j	8204 <_dtoa_r+0x2fc>

0000958c <__ascii_mbtowc>:
    958c:	02058063          	beqz	a1,95ac <__ascii_mbtowc+0x20>
    9590:	04060263          	beqz	a2,95d4 <__ascii_mbtowc+0x48>
    9594:	04068863          	beqz	a3,95e4 <__ascii_mbtowc+0x58>
    9598:	00064783          	lbu	a5,0(a2)
    959c:	00f5a023          	sw	a5,0(a1)
    95a0:	00064503          	lbu	a0,0(a2)
    95a4:	00a03533          	snez	a0,a0
    95a8:	00008067          	ret
    95ac:	ff010113          	add	sp,sp,-16
    95b0:	00c10593          	add	a1,sp,12
    95b4:	02060463          	beqz	a2,95dc <__ascii_mbtowc+0x50>
    95b8:	02068a63          	beqz	a3,95ec <__ascii_mbtowc+0x60>
    95bc:	00064783          	lbu	a5,0(a2)
    95c0:	00f5a023          	sw	a5,0(a1)
    95c4:	00064503          	lbu	a0,0(a2)
    95c8:	00a03533          	snez	a0,a0
    95cc:	01010113          	add	sp,sp,16
    95d0:	00008067          	ret
    95d4:	00000513          	li	a0,0
    95d8:	00008067          	ret
    95dc:	00000513          	li	a0,0
    95e0:	fedff06f          	j	95cc <__ascii_mbtowc+0x40>
    95e4:	ffe00513          	li	a0,-2
    95e8:	00008067          	ret
    95ec:	ffe00513          	li	a0,-2
    95f0:	fddff06f          	j	95cc <__ascii_mbtowc+0x40>

000095f4 <_Balloc>:
    95f4:	04452783          	lw	a5,68(a0)
    95f8:	ff010113          	add	sp,sp,-16
    95fc:	00812423          	sw	s0,8(sp)
    9600:	00912223          	sw	s1,4(sp)
    9604:	00112623          	sw	ra,12(sp)
    9608:	00050413          	mv	s0,a0
    960c:	00058493          	mv	s1,a1
    9610:	02078c63          	beqz	a5,9648 <_Balloc+0x54>
    9614:	00249713          	sll	a4,s1,0x2
    9618:	00e787b3          	add	a5,a5,a4
    961c:	0007a503          	lw	a0,0(a5)
    9620:	04050463          	beqz	a0,9668 <_Balloc+0x74>
    9624:	00052703          	lw	a4,0(a0)
    9628:	00e7a023          	sw	a4,0(a5)
    962c:	00052823          	sw	zero,16(a0)
    9630:	00052623          	sw	zero,12(a0)
    9634:	00c12083          	lw	ra,12(sp)
    9638:	00812403          	lw	s0,8(sp)
    963c:	00412483          	lw	s1,4(sp)
    9640:	01010113          	add	sp,sp,16
    9644:	00008067          	ret
    9648:	02100613          	li	a2,33
    964c:	00400593          	li	a1,4
    9650:	021010ef          	jal	ae70 <_calloc_r>
    9654:	04a42223          	sw	a0,68(s0)
    9658:	00050793          	mv	a5,a0
    965c:	fa051ce3          	bnez	a0,9614 <_Balloc+0x20>
    9660:	00000513          	li	a0,0
    9664:	fd1ff06f          	j	9634 <_Balloc+0x40>
    9668:	01212023          	sw	s2,0(sp)
    966c:	00100913          	li	s2,1
    9670:	00991933          	sll	s2,s2,s1
    9674:	00590613          	add	a2,s2,5
    9678:	00261613          	sll	a2,a2,0x2
    967c:	00100593          	li	a1,1
    9680:	00040513          	mv	a0,s0
    9684:	7ec010ef          	jal	ae70 <_calloc_r>
    9688:	00050a63          	beqz	a0,969c <_Balloc+0xa8>
    968c:	01252423          	sw	s2,8(a0)
    9690:	00952223          	sw	s1,4(a0)
    9694:	00012903          	lw	s2,0(sp)
    9698:	f95ff06f          	j	962c <_Balloc+0x38>
    969c:	00012903          	lw	s2,0(sp)
    96a0:	00000513          	li	a0,0
    96a4:	f91ff06f          	j	9634 <_Balloc+0x40>

000096a8 <_Bfree>:
    96a8:	02058063          	beqz	a1,96c8 <_Bfree+0x20>
    96ac:	0045a703          	lw	a4,4(a1)
    96b0:	04452783          	lw	a5,68(a0)
    96b4:	00271713          	sll	a4,a4,0x2
    96b8:	00e787b3          	add	a5,a5,a4
    96bc:	0007a703          	lw	a4,0(a5)
    96c0:	00e5a023          	sw	a4,0(a1)
    96c4:	00b7a023          	sw	a1,0(a5)
    96c8:	00008067          	ret

000096cc <__multadd>:
    96cc:	fd010113          	add	sp,sp,-48
    96d0:	01412c23          	sw	s4,24(sp)
    96d4:	0105aa03          	lw	s4,16(a1)
    96d8:	01912223          	sw	s9,4(sp)
    96dc:	00010cb7          	lui	s9,0x10
    96e0:	02912223          	sw	s1,36(sp)
    96e4:	03212023          	sw	s2,32(sp)
    96e8:	01312e23          	sw	s3,28(sp)
    96ec:	01512a23          	sw	s5,20(sp)
    96f0:	01612823          	sw	s6,16(sp)
    96f4:	01712623          	sw	s7,12(sp)
    96f8:	02112623          	sw	ra,44(sp)
    96fc:	02812423          	sw	s0,40(sp)
    9700:	01812423          	sw	s8,8(sp)
    9704:	00058a93          	mv	s5,a1
    9708:	00050b13          	mv	s6,a0
    970c:	00060993          	mv	s3,a2
    9710:	00068493          	mv	s1,a3
    9714:	01458913          	add	s2,a1,20
    9718:	00000b93          	li	s7,0
    971c:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    9720:	00092c03          	lw	s8,0(s2)
    9724:	00098593          	mv	a1,s3
    9728:	00490913          	add	s2,s2,4
    972c:	019c7533          	and	a0,s8,s9
    9730:	430050ef          	jal	eb60 <__mulsi3>
    9734:	00050413          	mv	s0,a0
    9738:	00098593          	mv	a1,s3
    973c:	010c5513          	srl	a0,s8,0x10
    9740:	00940433          	add	s0,s0,s1
    9744:	41c050ef          	jal	eb60 <__mulsi3>
    9748:	01045793          	srl	a5,s0,0x10
    974c:	00f50533          	add	a0,a0,a5
    9750:	01051793          	sll	a5,a0,0x10
    9754:	01947433          	and	s0,s0,s9
    9758:	008787b3          	add	a5,a5,s0
    975c:	fef92e23          	sw	a5,-4(s2)
    9760:	001b8b93          	add	s7,s7,1
    9764:	01055493          	srl	s1,a0,0x10
    9768:	fb4bcce3          	blt	s7,s4,9720 <__multadd+0x54>
    976c:	02048263          	beqz	s1,9790 <__multadd+0xc4>
    9770:	008aa783          	lw	a5,8(s5)
    9774:	04fa5a63          	bge	s4,a5,97c8 <__multadd+0xfc>
    9778:	004a0793          	add	a5,s4,4
    977c:	00279793          	sll	a5,a5,0x2
    9780:	00fa87b3          	add	a5,s5,a5
    9784:	0097a223          	sw	s1,4(a5)
    9788:	001a0a13          	add	s4,s4,1
    978c:	014aa823          	sw	s4,16(s5)
    9790:	02c12083          	lw	ra,44(sp)
    9794:	02812403          	lw	s0,40(sp)
    9798:	02412483          	lw	s1,36(sp)
    979c:	02012903          	lw	s2,32(sp)
    97a0:	01c12983          	lw	s3,28(sp)
    97a4:	01812a03          	lw	s4,24(sp)
    97a8:	01012b03          	lw	s6,16(sp)
    97ac:	00c12b83          	lw	s7,12(sp)
    97b0:	00812c03          	lw	s8,8(sp)
    97b4:	00412c83          	lw	s9,4(sp)
    97b8:	000a8513          	mv	a0,s5
    97bc:	01412a83          	lw	s5,20(sp)
    97c0:	03010113          	add	sp,sp,48
    97c4:	00008067          	ret
    97c8:	004aa583          	lw	a1,4(s5)
    97cc:	000b0513          	mv	a0,s6
    97d0:	00158593          	add	a1,a1,1
    97d4:	e21ff0ef          	jal	95f4 <_Balloc>
    97d8:	00050413          	mv	s0,a0
    97dc:	04050c63          	beqz	a0,9834 <__multadd+0x168>
    97e0:	010aa603          	lw	a2,16(s5)
    97e4:	00ca8593          	add	a1,s5,12
    97e8:	00c50513          	add	a0,a0,12
    97ec:	00260613          	add	a2,a2,2
    97f0:	00261613          	sll	a2,a2,0x2
    97f4:	e9cf70ef          	jal	e90 <memcpy>
    97f8:	004aa703          	lw	a4,4(s5)
    97fc:	044b2783          	lw	a5,68(s6)
    9800:	00271713          	sll	a4,a4,0x2
    9804:	00e787b3          	add	a5,a5,a4
    9808:	0007a703          	lw	a4,0(a5)
    980c:	00eaa023          	sw	a4,0(s5)
    9810:	0157a023          	sw	s5,0(a5)
    9814:	004a0793          	add	a5,s4,4
    9818:	00040a93          	mv	s5,s0
    981c:	00279793          	sll	a5,a5,0x2
    9820:	00fa87b3          	add	a5,s5,a5
    9824:	0097a223          	sw	s1,4(a5)
    9828:	001a0a13          	add	s4,s4,1
    982c:	014aa823          	sw	s4,16(s5)
    9830:	f61ff06f          	j	9790 <__multadd+0xc4>
    9834:	00005697          	auipc	a3,0x5
    9838:	75868693          	add	a3,a3,1880 # ef8c <__fini_array_end+0x234>
    983c:	00000613          	li	a2,0
    9840:	0ba00593          	li	a1,186
    9844:	00005517          	auipc	a0,0x5
    9848:	7dc50513          	add	a0,a0,2012 # f020 <__fini_array_end+0x2c8>
    984c:	5cc010ef          	jal	ae18 <__assert_func>

00009850 <__hi0bits>:
    9850:	00050793          	mv	a5,a0
    9854:	00010737          	lui	a4,0x10
    9858:	00000513          	li	a0,0
    985c:	00e7f663          	bgeu	a5,a4,9868 <__hi0bits+0x18>
    9860:	01079793          	sll	a5,a5,0x10
    9864:	01000513          	li	a0,16
    9868:	01000737          	lui	a4,0x1000
    986c:	00e7f663          	bgeu	a5,a4,9878 <__hi0bits+0x28>
    9870:	00850513          	add	a0,a0,8
    9874:	00879793          	sll	a5,a5,0x8
    9878:	10000737          	lui	a4,0x10000
    987c:	00e7f663          	bgeu	a5,a4,9888 <__hi0bits+0x38>
    9880:	00450513          	add	a0,a0,4
    9884:	00479793          	sll	a5,a5,0x4
    9888:	40000737          	lui	a4,0x40000
    988c:	00e7ea63          	bltu	a5,a4,98a0 <__hi0bits+0x50>
    9890:	fff7c793          	not	a5,a5
    9894:	01f7d793          	srl	a5,a5,0x1f
    9898:	00f50533          	add	a0,a0,a5
    989c:	00008067          	ret
    98a0:	00279793          	sll	a5,a5,0x2
    98a4:	0007ca63          	bltz	a5,98b8 <__hi0bits+0x68>
    98a8:	00179713          	sll	a4,a5,0x1
    98ac:	00074a63          	bltz	a4,98c0 <__hi0bits+0x70>
    98b0:	02000513          	li	a0,32
    98b4:	00008067          	ret
    98b8:	00250513          	add	a0,a0,2
    98bc:	00008067          	ret
    98c0:	00350513          	add	a0,a0,3
    98c4:	00008067          	ret

000098c8 <__lo0bits>:
    98c8:	00052783          	lw	a5,0(a0)
    98cc:	00050713          	mv	a4,a0
    98d0:	0077f693          	and	a3,a5,7
    98d4:	02068463          	beqz	a3,98fc <__lo0bits+0x34>
    98d8:	0017f693          	and	a3,a5,1
    98dc:	00000513          	li	a0,0
    98e0:	04069e63          	bnez	a3,993c <__lo0bits+0x74>
    98e4:	0027f693          	and	a3,a5,2
    98e8:	0a068863          	beqz	a3,9998 <__lo0bits+0xd0>
    98ec:	0017d793          	srl	a5,a5,0x1
    98f0:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    98f4:	00100513          	li	a0,1
    98f8:	00008067          	ret
    98fc:	01079693          	sll	a3,a5,0x10
    9900:	0106d693          	srl	a3,a3,0x10
    9904:	00000513          	li	a0,0
    9908:	06068e63          	beqz	a3,9984 <__lo0bits+0xbc>
    990c:	0ff7f693          	zext.b	a3,a5
    9910:	06068063          	beqz	a3,9970 <__lo0bits+0xa8>
    9914:	00f7f693          	and	a3,a5,15
    9918:	04068263          	beqz	a3,995c <__lo0bits+0x94>
    991c:	0037f693          	and	a3,a5,3
    9920:	02068463          	beqz	a3,9948 <__lo0bits+0x80>
    9924:	0017f693          	and	a3,a5,1
    9928:	00069c63          	bnez	a3,9940 <__lo0bits+0x78>
    992c:	0017d793          	srl	a5,a5,0x1
    9930:	00150513          	add	a0,a0,1
    9934:	00079663          	bnez	a5,9940 <__lo0bits+0x78>
    9938:	02000513          	li	a0,32
    993c:	00008067          	ret
    9940:	00f72023          	sw	a5,0(a4)
    9944:	00008067          	ret
    9948:	0027d793          	srl	a5,a5,0x2
    994c:	0017f693          	and	a3,a5,1
    9950:	00250513          	add	a0,a0,2
    9954:	fe0696e3          	bnez	a3,9940 <__lo0bits+0x78>
    9958:	fd5ff06f          	j	992c <__lo0bits+0x64>
    995c:	0047d793          	srl	a5,a5,0x4
    9960:	0037f693          	and	a3,a5,3
    9964:	00450513          	add	a0,a0,4
    9968:	fa069ee3          	bnez	a3,9924 <__lo0bits+0x5c>
    996c:	fddff06f          	j	9948 <__lo0bits+0x80>
    9970:	0087d793          	srl	a5,a5,0x8
    9974:	00f7f693          	and	a3,a5,15
    9978:	00850513          	add	a0,a0,8
    997c:	fa0690e3          	bnez	a3,991c <__lo0bits+0x54>
    9980:	fddff06f          	j	995c <__lo0bits+0x94>
    9984:	0107d793          	srl	a5,a5,0x10
    9988:	0ff7f693          	zext.b	a3,a5
    998c:	01000513          	li	a0,16
    9990:	f80692e3          	bnez	a3,9914 <__lo0bits+0x4c>
    9994:	fddff06f          	j	9970 <__lo0bits+0xa8>
    9998:	0027d793          	srl	a5,a5,0x2
    999c:	00f72023          	sw	a5,0(a4)
    99a0:	00200513          	li	a0,2
    99a4:	00008067          	ret

000099a8 <__i2b>:
    99a8:	04452783          	lw	a5,68(a0)
    99ac:	ff010113          	add	sp,sp,-16
    99b0:	00812423          	sw	s0,8(sp)
    99b4:	00912223          	sw	s1,4(sp)
    99b8:	00112623          	sw	ra,12(sp)
    99bc:	00050413          	mv	s0,a0
    99c0:	00058493          	mv	s1,a1
    99c4:	02078c63          	beqz	a5,99fc <__i2b+0x54>
    99c8:	0047a503          	lw	a0,4(a5)
    99cc:	06050263          	beqz	a0,9a30 <__i2b+0x88>
    99d0:	00052703          	lw	a4,0(a0)
    99d4:	00e7a223          	sw	a4,4(a5)
    99d8:	00c12083          	lw	ra,12(sp)
    99dc:	00812403          	lw	s0,8(sp)
    99e0:	00100793          	li	a5,1
    99e4:	00952a23          	sw	s1,20(a0)
    99e8:	00052623          	sw	zero,12(a0)
    99ec:	00f52823          	sw	a5,16(a0)
    99f0:	00412483          	lw	s1,4(sp)
    99f4:	01010113          	add	sp,sp,16
    99f8:	00008067          	ret
    99fc:	02100613          	li	a2,33
    9a00:	00400593          	li	a1,4
    9a04:	46c010ef          	jal	ae70 <_calloc_r>
    9a08:	04a42223          	sw	a0,68(s0)
    9a0c:	00050793          	mv	a5,a0
    9a10:	fa051ce3          	bnez	a0,99c8 <__i2b+0x20>
    9a14:	00005697          	auipc	a3,0x5
    9a18:	57868693          	add	a3,a3,1400 # ef8c <__fini_array_end+0x234>
    9a1c:	00000613          	li	a2,0
    9a20:	14500593          	li	a1,325
    9a24:	00005517          	auipc	a0,0x5
    9a28:	5fc50513          	add	a0,a0,1532 # f020 <__fini_array_end+0x2c8>
    9a2c:	3ec010ef          	jal	ae18 <__assert_func>
    9a30:	01c00613          	li	a2,28
    9a34:	00100593          	li	a1,1
    9a38:	00040513          	mv	a0,s0
    9a3c:	434010ef          	jal	ae70 <_calloc_r>
    9a40:	fc050ae3          	beqz	a0,9a14 <__i2b+0x6c>
    9a44:	00100793          	li	a5,1
    9a48:	00f52223          	sw	a5,4(a0)
    9a4c:	00200793          	li	a5,2
    9a50:	00f52423          	sw	a5,8(a0)
    9a54:	f85ff06f          	j	99d8 <__i2b+0x30>

00009a58 <__multiply>:
    9a58:	fb010113          	add	sp,sp,-80
    9a5c:	03312e23          	sw	s3,60(sp)
    9a60:	03812423          	sw	s8,40(sp)
    9a64:	01062983          	lw	s3,16(a2)
    9a68:	0105ac03          	lw	s8,16(a1)
    9a6c:	04812423          	sw	s0,72(sp)
    9a70:	03412c23          	sw	s4,56(sp)
    9a74:	04112623          	sw	ra,76(sp)
    9a78:	03712623          	sw	s7,44(sp)
    9a7c:	00058a13          	mv	s4,a1
    9a80:	00060413          	mv	s0,a2
    9a84:	013c4c63          	blt	s8,s3,9a9c <__multiply+0x44>
    9a88:	00098713          	mv	a4,s3
    9a8c:	00058413          	mv	s0,a1
    9a90:	000c0993          	mv	s3,s8
    9a94:	00060a13          	mv	s4,a2
    9a98:	00070c13          	mv	s8,a4
    9a9c:	00842783          	lw	a5,8(s0)
    9aa0:	00442583          	lw	a1,4(s0)
    9aa4:	01898bb3          	add	s7,s3,s8
    9aa8:	0177a7b3          	slt	a5,a5,s7
    9aac:	00f585b3          	add	a1,a1,a5
    9ab0:	b45ff0ef          	jal	95f4 <_Balloc>
    9ab4:	00a12623          	sw	a0,12(sp)
    9ab8:	22050863          	beqz	a0,9ce8 <__multiply+0x290>
    9abc:	00c12783          	lw	a5,12(sp)
    9ac0:	03512a23          	sw	s5,52(sp)
    9ac4:	03612823          	sw	s6,48(sp)
    9ac8:	002b9a93          	sll	s5,s7,0x2
    9acc:	01478b13          	add	s6,a5,20
    9ad0:	015b0ab3          	add	s5,s6,s5
    9ad4:	000b0793          	mv	a5,s6
    9ad8:	015b7863          	bgeu	s6,s5,9ae8 <__multiply+0x90>
    9adc:	0007a023          	sw	zero,0(a5)
    9ae0:	00478793          	add	a5,a5,4
    9ae4:	ff57ece3          	bltu	a5,s5,9adc <__multiply+0x84>
    9ae8:	014a0a13          	add	s4,s4,20
    9aec:	002c1c13          	sll	s8,s8,0x2
    9af0:	01440793          	add	a5,s0,20
    9af4:	018a0733          	add	a4,s4,s8
    9af8:	00299993          	sll	s3,s3,0x2
    9afc:	00f12423          	sw	a5,8(sp)
    9b00:	00e12023          	sw	a4,0(sp)
    9b04:	013789b3          	add	s3,a5,s3
    9b08:	16ea7c63          	bgeu	s4,a4,9c80 <__multiply+0x228>
    9b0c:	00400713          	li	a4,4
    9b10:	04912223          	sw	s1,68(sp)
    9b14:	05212023          	sw	s2,64(sp)
    9b18:	03912223          	sw	s9,36(sp)
    9b1c:	03a12023          	sw	s10,32(sp)
    9b20:	01b12e23          	sw	s11,28(sp)
    9b24:	01540793          	add	a5,s0,21
    9b28:	00e12223          	sw	a4,4(sp)
    9b2c:	1af9f263          	bgeu	s3,a5,9cd0 <__multiply+0x278>
    9b30:	00010437          	lui	s0,0x10
    9b34:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    9b38:	01c0006f          	j	9b54 <__multiply+0xfc>
    9b3c:	01095913          	srl	s2,s2,0x10
    9b40:	0a091063          	bnez	s2,9be0 <__multiply+0x188>
    9b44:	00012783          	lw	a5,0(sp)
    9b48:	004a0a13          	add	s4,s4,4
    9b4c:	004b0b13          	add	s6,s6,4
    9b50:	10fa7e63          	bgeu	s4,a5,9c6c <__multiply+0x214>
    9b54:	000a2903          	lw	s2,0(s4)
    9b58:	008974b3          	and	s1,s2,s0
    9b5c:	fe0480e3          	beqz	s1,9b3c <__multiply+0xe4>
    9b60:	00812c83          	lw	s9,8(sp)
    9b64:	000b0d13          	mv	s10,s6
    9b68:	00000c13          	li	s8,0
    9b6c:	000cad83          	lw	s11,0(s9)
    9b70:	000d2903          	lw	s2,0(s10)
    9b74:	00048593          	mv	a1,s1
    9b78:	008df533          	and	a0,s11,s0
    9b7c:	7e5040ef          	jal	eb60 <__mulsi3>
    9b80:	00897733          	and	a4,s2,s0
    9b84:	00e50733          	add	a4,a0,a4
    9b88:	00048593          	mv	a1,s1
    9b8c:	010dd513          	srl	a0,s11,0x10
    9b90:	01870c33          	add	s8,a4,s8
    9b94:	01095913          	srl	s2,s2,0x10
    9b98:	7c9040ef          	jal	eb60 <__mulsi3>
    9b9c:	010c5713          	srl	a4,s8,0x10
    9ba0:	01250533          	add	a0,a0,s2
    9ba4:	00e50533          	add	a0,a0,a4
    9ba8:	008c77b3          	and	a5,s8,s0
    9bac:	01051713          	sll	a4,a0,0x10
    9bb0:	004d0d13          	add	s10,s10,4
    9bb4:	00f767b3          	or	a5,a4,a5
    9bb8:	004c8c93          	add	s9,s9,4
    9bbc:	fefd2e23          	sw	a5,-4(s10)
    9bc0:	01055c13          	srl	s8,a0,0x10
    9bc4:	fb3ce4e3          	bltu	s9,s3,9b6c <__multiply+0x114>
    9bc8:	00412783          	lw	a5,4(sp)
    9bcc:	00fb0733          	add	a4,s6,a5
    9bd0:	01872023          	sw	s8,0(a4)
    9bd4:	000a2903          	lw	s2,0(s4)
    9bd8:	01095913          	srl	s2,s2,0x10
    9bdc:	f60904e3          	beqz	s2,9b44 <__multiply+0xec>
    9be0:	000b2c83          	lw	s9,0(s6)
    9be4:	00812d03          	lw	s10,8(sp)
    9be8:	000b0c13          	mv	s8,s6
    9bec:	000c8493          	mv	s1,s9
    9bf0:	00000d93          	li	s11,0
    9bf4:	000d2503          	lw	a0,0(s10)
    9bf8:	00090593          	mv	a1,s2
    9bfc:	0104d493          	srl	s1,s1,0x10
    9c00:	00857533          	and	a0,a0,s0
    9c04:	75d040ef          	jal	eb60 <__mulsi3>
    9c08:	01b50733          	add	a4,a0,s11
    9c0c:	00970db3          	add	s11,a4,s1
    9c10:	010d9593          	sll	a1,s11,0x10
    9c14:	008cf7b3          	and	a5,s9,s0
    9c18:	00f5e7b3          	or	a5,a1,a5
    9c1c:	00fc2023          	sw	a5,0(s8)
    9c20:	002d5503          	lhu	a0,2(s10)
    9c24:	004c2483          	lw	s1,4(s8)
    9c28:	00090593          	mv	a1,s2
    9c2c:	735040ef          	jal	eb60 <__mulsi3>
    9c30:	0084f7b3          	and	a5,s1,s0
    9c34:	010dd713          	srl	a4,s11,0x10
    9c38:	00f507b3          	add	a5,a0,a5
    9c3c:	004d0d13          	add	s10,s10,4
    9c40:	00e78cb3          	add	s9,a5,a4
    9c44:	004c0c13          	add	s8,s8,4
    9c48:	010cdd93          	srl	s11,s9,0x10
    9c4c:	fb3d64e3          	bltu	s10,s3,9bf4 <__multiply+0x19c>
    9c50:	00412783          	lw	a5,4(sp)
    9c54:	004a0a13          	add	s4,s4,4
    9c58:	00fb0733          	add	a4,s6,a5
    9c5c:	00012783          	lw	a5,0(sp)
    9c60:	01972023          	sw	s9,0(a4)
    9c64:	004b0b13          	add	s6,s6,4
    9c68:	eefa66e3          	bltu	s4,a5,9b54 <__multiply+0xfc>
    9c6c:	04412483          	lw	s1,68(sp)
    9c70:	04012903          	lw	s2,64(sp)
    9c74:	02412c83          	lw	s9,36(sp)
    9c78:	02012d03          	lw	s10,32(sp)
    9c7c:	01c12d83          	lw	s11,28(sp)
    9c80:	01704863          	bgtz	s7,9c90 <__multiply+0x238>
    9c84:	0180006f          	j	9c9c <__multiply+0x244>
    9c88:	fffb8b93          	add	s7,s7,-1
    9c8c:	000b8863          	beqz	s7,9c9c <__multiply+0x244>
    9c90:	ffcaa783          	lw	a5,-4(s5)
    9c94:	ffca8a93          	add	s5,s5,-4
    9c98:	fe0788e3          	beqz	a5,9c88 <__multiply+0x230>
    9c9c:	00c12783          	lw	a5,12(sp)
    9ca0:	04c12083          	lw	ra,76(sp)
    9ca4:	04812403          	lw	s0,72(sp)
    9ca8:	0177a823          	sw	s7,16(a5)
    9cac:	03412a83          	lw	s5,52(sp)
    9cb0:	03012b03          	lw	s6,48(sp)
    9cb4:	03c12983          	lw	s3,60(sp)
    9cb8:	03812a03          	lw	s4,56(sp)
    9cbc:	02c12b83          	lw	s7,44(sp)
    9cc0:	02812c03          	lw	s8,40(sp)
    9cc4:	00078513          	mv	a0,a5
    9cc8:	05010113          	add	sp,sp,80
    9ccc:	00008067          	ret
    9cd0:	408987b3          	sub	a5,s3,s0
    9cd4:	feb78793          	add	a5,a5,-21
    9cd8:	ffc7f793          	and	a5,a5,-4
    9cdc:	00478793          	add	a5,a5,4
    9ce0:	00f12223          	sw	a5,4(sp)
    9ce4:	e4dff06f          	j	9b30 <__multiply+0xd8>
    9ce8:	00005697          	auipc	a3,0x5
    9cec:	2a468693          	add	a3,a3,676 # ef8c <__fini_array_end+0x234>
    9cf0:	00000613          	li	a2,0
    9cf4:	16200593          	li	a1,354
    9cf8:	00005517          	auipc	a0,0x5
    9cfc:	32850513          	add	a0,a0,808 # f020 <__fini_array_end+0x2c8>
    9d00:	04912223          	sw	s1,68(sp)
    9d04:	05212023          	sw	s2,64(sp)
    9d08:	03512a23          	sw	s5,52(sp)
    9d0c:	03612823          	sw	s6,48(sp)
    9d10:	03912223          	sw	s9,36(sp)
    9d14:	03a12023          	sw	s10,32(sp)
    9d18:	01b12e23          	sw	s11,28(sp)
    9d1c:	0fc010ef          	jal	ae18 <__assert_func>

00009d20 <__pow5mult>:
    9d20:	fe010113          	add	sp,sp,-32
    9d24:	00812c23          	sw	s0,24(sp)
    9d28:	01212823          	sw	s2,16(sp)
    9d2c:	01312623          	sw	s3,12(sp)
    9d30:	00112e23          	sw	ra,28(sp)
    9d34:	00367793          	and	a5,a2,3
    9d38:	00060413          	mv	s0,a2
    9d3c:	00050993          	mv	s3,a0
    9d40:	00058913          	mv	s2,a1
    9d44:	0a079c63          	bnez	a5,9dfc <__pow5mult+0xdc>
    9d48:	40245413          	sra	s0,s0,0x2
    9d4c:	06040a63          	beqz	s0,9dc0 <__pow5mult+0xa0>
    9d50:	00912a23          	sw	s1,20(sp)
    9d54:	0409a483          	lw	s1,64(s3)
    9d58:	0c048663          	beqz	s1,9e24 <__pow5mult+0x104>
    9d5c:	00147793          	and	a5,s0,1
    9d60:	02079063          	bnez	a5,9d80 <__pow5mult+0x60>
    9d64:	40145413          	sra	s0,s0,0x1
    9d68:	04040a63          	beqz	s0,9dbc <__pow5mult+0x9c>
    9d6c:	0004a503          	lw	a0,0(s1)
    9d70:	06050663          	beqz	a0,9ddc <__pow5mult+0xbc>
    9d74:	00050493          	mv	s1,a0
    9d78:	00147793          	and	a5,s0,1
    9d7c:	fe0784e3          	beqz	a5,9d64 <__pow5mult+0x44>
    9d80:	00048613          	mv	a2,s1
    9d84:	00090593          	mv	a1,s2
    9d88:	00098513          	mv	a0,s3
    9d8c:	ccdff0ef          	jal	9a58 <__multiply>
    9d90:	02090063          	beqz	s2,9db0 <__pow5mult+0x90>
    9d94:	00492703          	lw	a4,4(s2)
    9d98:	0449a783          	lw	a5,68(s3)
    9d9c:	00271713          	sll	a4,a4,0x2
    9da0:	00e787b3          	add	a5,a5,a4
    9da4:	0007a703          	lw	a4,0(a5)
    9da8:	00e92023          	sw	a4,0(s2)
    9dac:	0127a023          	sw	s2,0(a5)
    9db0:	40145413          	sra	s0,s0,0x1
    9db4:	00050913          	mv	s2,a0
    9db8:	fa041ae3          	bnez	s0,9d6c <__pow5mult+0x4c>
    9dbc:	01412483          	lw	s1,20(sp)
    9dc0:	01c12083          	lw	ra,28(sp)
    9dc4:	01812403          	lw	s0,24(sp)
    9dc8:	00c12983          	lw	s3,12(sp)
    9dcc:	00090513          	mv	a0,s2
    9dd0:	01012903          	lw	s2,16(sp)
    9dd4:	02010113          	add	sp,sp,32
    9dd8:	00008067          	ret
    9ddc:	00048613          	mv	a2,s1
    9de0:	00048593          	mv	a1,s1
    9de4:	00098513          	mv	a0,s3
    9de8:	c71ff0ef          	jal	9a58 <__multiply>
    9dec:	00a4a023          	sw	a0,0(s1)
    9df0:	00052023          	sw	zero,0(a0)
    9df4:	00050493          	mv	s1,a0
    9df8:	f81ff06f          	j	9d78 <__pow5mult+0x58>
    9dfc:	fff78793          	add	a5,a5,-1
    9e00:	00005717          	auipc	a4,0x5
    9e04:	79470713          	add	a4,a4,1940 # f594 <p05.0>
    9e08:	00279793          	sll	a5,a5,0x2
    9e0c:	00f707b3          	add	a5,a4,a5
    9e10:	0007a603          	lw	a2,0(a5)
    9e14:	00000693          	li	a3,0
    9e18:	8b5ff0ef          	jal	96cc <__multadd>
    9e1c:	00050913          	mv	s2,a0
    9e20:	f29ff06f          	j	9d48 <__pow5mult+0x28>
    9e24:	00100593          	li	a1,1
    9e28:	00098513          	mv	a0,s3
    9e2c:	fc8ff0ef          	jal	95f4 <_Balloc>
    9e30:	00050493          	mv	s1,a0
    9e34:	02050063          	beqz	a0,9e54 <__pow5mult+0x134>
    9e38:	27100793          	li	a5,625
    9e3c:	00f52a23          	sw	a5,20(a0)
    9e40:	00100793          	li	a5,1
    9e44:	00f52823          	sw	a5,16(a0)
    9e48:	04a9a023          	sw	a0,64(s3)
    9e4c:	00052023          	sw	zero,0(a0)
    9e50:	f0dff06f          	j	9d5c <__pow5mult+0x3c>
    9e54:	00005697          	auipc	a3,0x5
    9e58:	13868693          	add	a3,a3,312 # ef8c <__fini_array_end+0x234>
    9e5c:	00000613          	li	a2,0
    9e60:	14500593          	li	a1,325
    9e64:	00005517          	auipc	a0,0x5
    9e68:	1bc50513          	add	a0,a0,444 # f020 <__fini_array_end+0x2c8>
    9e6c:	7ad000ef          	jal	ae18 <__assert_func>

00009e70 <__lshift>:
    9e70:	fe010113          	add	sp,sp,-32
    9e74:	01512223          	sw	s5,4(sp)
    9e78:	0105aa83          	lw	s5,16(a1)
    9e7c:	0085a783          	lw	a5,8(a1)
    9e80:	01312623          	sw	s3,12(sp)
    9e84:	40565993          	sra	s3,a2,0x5
    9e88:	01598ab3          	add	s5,s3,s5
    9e8c:	00812c23          	sw	s0,24(sp)
    9e90:	00912a23          	sw	s1,20(sp)
    9e94:	01212823          	sw	s2,16(sp)
    9e98:	01412423          	sw	s4,8(sp)
    9e9c:	00112e23          	sw	ra,28(sp)
    9ea0:	001a8913          	add	s2,s5,1
    9ea4:	00058493          	mv	s1,a1
    9ea8:	00060413          	mv	s0,a2
    9eac:	0045a583          	lw	a1,4(a1)
    9eb0:	00050a13          	mv	s4,a0
    9eb4:	0127d863          	bge	a5,s2,9ec4 <__lshift+0x54>
    9eb8:	00179793          	sll	a5,a5,0x1
    9ebc:	00158593          	add	a1,a1,1
    9ec0:	ff27cce3          	blt	a5,s2,9eb8 <__lshift+0x48>
    9ec4:	000a0513          	mv	a0,s4
    9ec8:	f2cff0ef          	jal	95f4 <_Balloc>
    9ecc:	10050c63          	beqz	a0,9fe4 <__lshift+0x174>
    9ed0:	01450813          	add	a6,a0,20
    9ed4:	03305463          	blez	s3,9efc <__lshift+0x8c>
    9ed8:	00598993          	add	s3,s3,5
    9edc:	00299993          	sll	s3,s3,0x2
    9ee0:	01350733          	add	a4,a0,s3
    9ee4:	00080793          	mv	a5,a6
    9ee8:	00478793          	add	a5,a5,4
    9eec:	fe07ae23          	sw	zero,-4(a5)
    9ef0:	fee79ce3          	bne	a5,a4,9ee8 <__lshift+0x78>
    9ef4:	fec98993          	add	s3,s3,-20
    9ef8:	01380833          	add	a6,a6,s3
    9efc:	0104a883          	lw	a7,16(s1)
    9f00:	01448793          	add	a5,s1,20
    9f04:	01f47613          	and	a2,s0,31
    9f08:	00289893          	sll	a7,a7,0x2
    9f0c:	011788b3          	add	a7,a5,a7
    9f10:	0a060463          	beqz	a2,9fb8 <__lshift+0x148>
    9f14:	02000593          	li	a1,32
    9f18:	40c585b3          	sub	a1,a1,a2
    9f1c:	00080313          	mv	t1,a6
    9f20:	00000693          	li	a3,0
    9f24:	0007a703          	lw	a4,0(a5)
    9f28:	00430313          	add	t1,t1,4
    9f2c:	00478793          	add	a5,a5,4
    9f30:	00c71733          	sll	a4,a4,a2
    9f34:	00d76733          	or	a4,a4,a3
    9f38:	fee32e23          	sw	a4,-4(t1)
    9f3c:	ffc7a683          	lw	a3,-4(a5)
    9f40:	00b6d6b3          	srl	a3,a3,a1
    9f44:	ff17e0e3          	bltu	a5,a7,9f24 <__lshift+0xb4>
    9f48:	01548793          	add	a5,s1,21
    9f4c:	00400713          	li	a4,4
    9f50:	00f8ea63          	bltu	a7,a5,9f64 <__lshift+0xf4>
    9f54:	409887b3          	sub	a5,a7,s1
    9f58:	feb78793          	add	a5,a5,-21
    9f5c:	ffc7f793          	and	a5,a5,-4
    9f60:	00478713          	add	a4,a5,4
    9f64:	00e80833          	add	a6,a6,a4
    9f68:	00d82023          	sw	a3,0(a6)
    9f6c:	00069463          	bnez	a3,9f74 <__lshift+0x104>
    9f70:	000a8913          	mv	s2,s5
    9f74:	0044a703          	lw	a4,4(s1)
    9f78:	044a2783          	lw	a5,68(s4)
    9f7c:	01c12083          	lw	ra,28(sp)
    9f80:	00271713          	sll	a4,a4,0x2
    9f84:	00e787b3          	add	a5,a5,a4
    9f88:	0007a703          	lw	a4,0(a5)
    9f8c:	01252823          	sw	s2,16(a0)
    9f90:	01812403          	lw	s0,24(sp)
    9f94:	00e4a023          	sw	a4,0(s1)
    9f98:	0097a023          	sw	s1,0(a5)
    9f9c:	01012903          	lw	s2,16(sp)
    9fa0:	01412483          	lw	s1,20(sp)
    9fa4:	00c12983          	lw	s3,12(sp)
    9fa8:	00812a03          	lw	s4,8(sp)
    9fac:	00412a83          	lw	s5,4(sp)
    9fb0:	02010113          	add	sp,sp,32
    9fb4:	00008067          	ret
    9fb8:	0007a703          	lw	a4,0(a5)
    9fbc:	00478793          	add	a5,a5,4
    9fc0:	00480813          	add	a6,a6,4
    9fc4:	fee82e23          	sw	a4,-4(a6)
    9fc8:	fb17f4e3          	bgeu	a5,a7,9f70 <__lshift+0x100>
    9fcc:	0007a703          	lw	a4,0(a5)
    9fd0:	00478793          	add	a5,a5,4
    9fd4:	00480813          	add	a6,a6,4
    9fd8:	fee82e23          	sw	a4,-4(a6)
    9fdc:	fd17eee3          	bltu	a5,a7,9fb8 <__lshift+0x148>
    9fe0:	f91ff06f          	j	9f70 <__lshift+0x100>
    9fe4:	00005697          	auipc	a3,0x5
    9fe8:	fa868693          	add	a3,a3,-88 # ef8c <__fini_array_end+0x234>
    9fec:	00000613          	li	a2,0
    9ff0:	1de00593          	li	a1,478
    9ff4:	00005517          	auipc	a0,0x5
    9ff8:	02c50513          	add	a0,a0,44 # f020 <__fini_array_end+0x2c8>
    9ffc:	61d000ef          	jal	ae18 <__assert_func>

0000a000 <__mcmp>:
    a000:	01052703          	lw	a4,16(a0)
    a004:	0105a783          	lw	a5,16(a1)
    a008:	00050813          	mv	a6,a0
    a00c:	40f70533          	sub	a0,a4,a5
    a010:	04f71263          	bne	a4,a5,a054 <__mcmp+0x54>
    a014:	00279793          	sll	a5,a5,0x2
    a018:	01480813          	add	a6,a6,20
    a01c:	01458593          	add	a1,a1,20
    a020:	00f80733          	add	a4,a6,a5
    a024:	00f587b3          	add	a5,a1,a5
    a028:	0080006f          	j	a030 <__mcmp+0x30>
    a02c:	02e87463          	bgeu	a6,a4,a054 <__mcmp+0x54>
    a030:	ffc72603          	lw	a2,-4(a4)
    a034:	ffc7a683          	lw	a3,-4(a5)
    a038:	ffc70713          	add	a4,a4,-4
    a03c:	ffc78793          	add	a5,a5,-4
    a040:	fed606e3          	beq	a2,a3,a02c <__mcmp+0x2c>
    a044:	00100513          	li	a0,1
    a048:	00d67663          	bgeu	a2,a3,a054 <__mcmp+0x54>
    a04c:	fff00513          	li	a0,-1
    a050:	00008067          	ret
    a054:	00008067          	ret

0000a058 <__mdiff>:
    a058:	0105a703          	lw	a4,16(a1)
    a05c:	01062783          	lw	a5,16(a2)
    a060:	ff010113          	add	sp,sp,-16
    a064:	00812423          	sw	s0,8(sp)
    a068:	00912223          	sw	s1,4(sp)
    a06c:	00112623          	sw	ra,12(sp)
    a070:	01212023          	sw	s2,0(sp)
    a074:	00058413          	mv	s0,a1
    a078:	00060493          	mv	s1,a2
    a07c:	40f706b3          	sub	a3,a4,a5
    a080:	18f71e63          	bne	a4,a5,a21c <__mdiff+0x1c4>
    a084:	00279693          	sll	a3,a5,0x2
    a088:	01458613          	add	a2,a1,20
    a08c:	01448713          	add	a4,s1,20
    a090:	00d607b3          	add	a5,a2,a3
    a094:	00d70733          	add	a4,a4,a3
    a098:	0080006f          	j	a0a0 <__mdiff+0x48>
    a09c:	18f67c63          	bgeu	a2,a5,a234 <__mdiff+0x1dc>
    a0a0:	ffc7a583          	lw	a1,-4(a5)
    a0a4:	ffc72683          	lw	a3,-4(a4)
    a0a8:	ffc78793          	add	a5,a5,-4
    a0ac:	ffc70713          	add	a4,a4,-4
    a0b0:	fed586e3          	beq	a1,a3,a09c <__mdiff+0x44>
    a0b4:	00100913          	li	s2,1
    a0b8:	00d5ea63          	bltu	a1,a3,a0cc <__mdiff+0x74>
    a0bc:	00048793          	mv	a5,s1
    a0c0:	00000913          	li	s2,0
    a0c4:	00040493          	mv	s1,s0
    a0c8:	00078413          	mv	s0,a5
    a0cc:	0044a583          	lw	a1,4(s1)
    a0d0:	d24ff0ef          	jal	95f4 <_Balloc>
    a0d4:	1a050663          	beqz	a0,a280 <__mdiff+0x228>
    a0d8:	0104a883          	lw	a7,16(s1)
    a0dc:	01042283          	lw	t0,16(s0)
    a0e0:	01448f93          	add	t6,s1,20
    a0e4:	00289313          	sll	t1,a7,0x2
    a0e8:	01440813          	add	a6,s0,20
    a0ec:	00229293          	sll	t0,t0,0x2
    a0f0:	01450593          	add	a1,a0,20
    a0f4:	00010e37          	lui	t3,0x10
    a0f8:	01252623          	sw	s2,12(a0)
    a0fc:	006f8333          	add	t1,t6,t1
    a100:	005802b3          	add	t0,a6,t0
    a104:	00058f13          	mv	t5,a1
    a108:	000f8e93          	mv	t4,t6
    a10c:	00000693          	li	a3,0
    a110:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    a114:	000ea703          	lw	a4,0(t4)
    a118:	00082603          	lw	a2,0(a6)
    a11c:	004f0f13          	add	t5,t5,4
    a120:	01c777b3          	and	a5,a4,t3
    a124:	01c673b3          	and	t2,a2,t3
    a128:	407787b3          	sub	a5,a5,t2
    a12c:	00d787b3          	add	a5,a5,a3
    a130:	01075713          	srl	a4,a4,0x10
    a134:	01065613          	srl	a2,a2,0x10
    a138:	4107d693          	sra	a3,a5,0x10
    a13c:	40c70733          	sub	a4,a4,a2
    a140:	00d70733          	add	a4,a4,a3
    a144:	01071693          	sll	a3,a4,0x10
    a148:	01c7f7b3          	and	a5,a5,t3
    a14c:	00d7e7b3          	or	a5,a5,a3
    a150:	00480813          	add	a6,a6,4
    a154:	feff2e23          	sw	a5,-4(t5)
    a158:	004e8e93          	add	t4,t4,4
    a15c:	41075693          	sra	a3,a4,0x10
    a160:	fa586ae3          	bltu	a6,t0,a114 <__mdiff+0xbc>
    a164:	01540713          	add	a4,s0,21
    a168:	40828433          	sub	s0,t0,s0
    a16c:	feb40413          	add	s0,s0,-21
    a170:	00e2b2b3          	sltu	t0,t0,a4
    a174:	0012cf13          	xor	t5,t0,1
    a178:	00245413          	srl	s0,s0,0x2
    a17c:	00400713          	li	a4,4
    a180:	0a028463          	beqz	t0,a228 <__mdiff+0x1d0>
    a184:	00ef8fb3          	add	t6,t6,a4
    a188:	00e58833          	add	a6,a1,a4
    a18c:	00010eb7          	lui	t4,0x10
    a190:	00080e13          	mv	t3,a6
    a194:	000f8613          	mv	a2,t6
    a198:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    a19c:	0c6ff463          	bgeu	t6,t1,a264 <__mdiff+0x20c>
    a1a0:	00062783          	lw	a5,0(a2)
    a1a4:	004e0e13          	add	t3,t3,4
    a1a8:	00460613          	add	a2,a2,4
    a1ac:	01d7f733          	and	a4,a5,t4
    a1b0:	00d70733          	add	a4,a4,a3
    a1b4:	0107d593          	srl	a1,a5,0x10
    a1b8:	41075713          	sra	a4,a4,0x10
    a1bc:	00b70733          	add	a4,a4,a1
    a1c0:	00d787b3          	add	a5,a5,a3
    a1c4:	01d7f7b3          	and	a5,a5,t4
    a1c8:	01071693          	sll	a3,a4,0x10
    a1cc:	00d7e7b3          	or	a5,a5,a3
    a1d0:	fefe2e23          	sw	a5,-4(t3)
    a1d4:	41075693          	sra	a3,a4,0x10
    a1d8:	fc6664e3          	bltu	a2,t1,a1a0 <__mdiff+0x148>
    a1dc:	fff30313          	add	t1,t1,-1
    a1e0:	41f30333          	sub	t1,t1,t6
    a1e4:	ffc37313          	and	t1,t1,-4
    a1e8:	00680733          	add	a4,a6,t1
    a1ec:	00079a63          	bnez	a5,a200 <__mdiff+0x1a8>
    a1f0:	ffc72783          	lw	a5,-4(a4)
    a1f4:	fff88893          	add	a7,a7,-1
    a1f8:	ffc70713          	add	a4,a4,-4
    a1fc:	fe078ae3          	beqz	a5,a1f0 <__mdiff+0x198>
    a200:	00c12083          	lw	ra,12(sp)
    a204:	00812403          	lw	s0,8(sp)
    a208:	01152823          	sw	a7,16(a0)
    a20c:	00412483          	lw	s1,4(sp)
    a210:	00012903          	lw	s2,0(sp)
    a214:	01010113          	add	sp,sp,16
    a218:	00008067          	ret
    a21c:	00100913          	li	s2,1
    a220:	e806dee3          	bgez	a3,a0bc <__mdiff+0x64>
    a224:	ea9ff06f          	j	a0cc <__mdiff+0x74>
    a228:	00140713          	add	a4,s0,1
    a22c:	00271713          	sll	a4,a4,0x2
    a230:	f55ff06f          	j	a184 <__mdiff+0x12c>
    a234:	00000593          	li	a1,0
    a238:	bbcff0ef          	jal	95f4 <_Balloc>
    a23c:	06050063          	beqz	a0,a29c <__mdiff+0x244>
    a240:	00c12083          	lw	ra,12(sp)
    a244:	00812403          	lw	s0,8(sp)
    a248:	00100793          	li	a5,1
    a24c:	00f52823          	sw	a5,16(a0)
    a250:	00052a23          	sw	zero,20(a0)
    a254:	00412483          	lw	s1,4(sp)
    a258:	00012903          	lw	s2,0(sp)
    a25c:	01010113          	add	sp,sp,16
    a260:	00008067          	ret
    a264:	00000713          	li	a4,0
    a268:	000f1663          	bnez	t5,a274 <__mdiff+0x21c>
    a26c:	00e58733          	add	a4,a1,a4
    a270:	f7dff06f          	j	a1ec <__mdiff+0x194>
    a274:	00241713          	sll	a4,s0,0x2
    a278:	00e58733          	add	a4,a1,a4
    a27c:	f71ff06f          	j	a1ec <__mdiff+0x194>
    a280:	00005697          	auipc	a3,0x5
    a284:	d0c68693          	add	a3,a3,-756 # ef8c <__fini_array_end+0x234>
    a288:	00000613          	li	a2,0
    a28c:	24500593          	li	a1,581
    a290:	00005517          	auipc	a0,0x5
    a294:	d9050513          	add	a0,a0,-624 # f020 <__fini_array_end+0x2c8>
    a298:	381000ef          	jal	ae18 <__assert_func>
    a29c:	00005697          	auipc	a3,0x5
    a2a0:	cf068693          	add	a3,a3,-784 # ef8c <__fini_array_end+0x234>
    a2a4:	00000613          	li	a2,0
    a2a8:	23700593          	li	a1,567
    a2ac:	00005517          	auipc	a0,0x5
    a2b0:	d7450513          	add	a0,a0,-652 # f020 <__fini_array_end+0x2c8>
    a2b4:	365000ef          	jal	ae18 <__assert_func>

0000a2b8 <__d2b>:
    a2b8:	fd010113          	add	sp,sp,-48
    a2bc:	01512a23          	sw	s5,20(sp)
    a2c0:	00058a93          	mv	s5,a1
    a2c4:	00100593          	li	a1,1
    a2c8:	02912223          	sw	s1,36(sp)
    a2cc:	01312e23          	sw	s3,28(sp)
    a2d0:	01412c23          	sw	s4,24(sp)
    a2d4:	02112623          	sw	ra,44(sp)
    a2d8:	02812423          	sw	s0,40(sp)
    a2dc:	03212023          	sw	s2,32(sp)
    a2e0:	00060493          	mv	s1,a2
    a2e4:	00068a13          	mv	s4,a3
    a2e8:	00070993          	mv	s3,a4
    a2ec:	b08ff0ef          	jal	95f4 <_Balloc>
    a2f0:	10050263          	beqz	a0,a3f4 <__d2b+0x13c>
    a2f4:	00100737          	lui	a4,0x100
    a2f8:	0144d913          	srl	s2,s1,0x14
    a2fc:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a300:	7ff97913          	and	s2,s2,2047
    a304:	00050413          	mv	s0,a0
    a308:	0097f7b3          	and	a5,a5,s1
    a30c:	00090463          	beqz	s2,a314 <__d2b+0x5c>
    a310:	00e7e7b3          	or	a5,a5,a4
    a314:	00f12623          	sw	a5,12(sp)
    a318:	060a9263          	bnez	s5,a37c <__d2b+0xc4>
    a31c:	00c10513          	add	a0,sp,12
    a320:	da8ff0ef          	jal	98c8 <__lo0bits>
    a324:	00c12703          	lw	a4,12(sp)
    a328:	00100493          	li	s1,1
    a32c:	00942823          	sw	s1,16(s0)
    a330:	00e42a23          	sw	a4,20(s0)
    a334:	02050793          	add	a5,a0,32
    a338:	08090863          	beqz	s2,a3c8 <__d2b+0x110>
    a33c:	bcd90913          	add	s2,s2,-1075
    a340:	00f90933          	add	s2,s2,a5
    a344:	03500493          	li	s1,53
    a348:	012a2023          	sw	s2,0(s4)
    a34c:	40f48533          	sub	a0,s1,a5
    a350:	00a9a023          	sw	a0,0(s3)
    a354:	02c12083          	lw	ra,44(sp)
    a358:	00040513          	mv	a0,s0
    a35c:	02812403          	lw	s0,40(sp)
    a360:	02412483          	lw	s1,36(sp)
    a364:	02012903          	lw	s2,32(sp)
    a368:	01c12983          	lw	s3,28(sp)
    a36c:	01812a03          	lw	s4,24(sp)
    a370:	01412a83          	lw	s5,20(sp)
    a374:	03010113          	add	sp,sp,48
    a378:	00008067          	ret
    a37c:	00810513          	add	a0,sp,8
    a380:	01512423          	sw	s5,8(sp)
    a384:	d44ff0ef          	jal	98c8 <__lo0bits>
    a388:	00c12703          	lw	a4,12(sp)
    a38c:	00050793          	mv	a5,a0
    a390:	04050e63          	beqz	a0,a3ec <__d2b+0x134>
    a394:	00812603          	lw	a2,8(sp)
    a398:	02000693          	li	a3,32
    a39c:	40a686b3          	sub	a3,a3,a0
    a3a0:	00d716b3          	sll	a3,a4,a3
    a3a4:	00a75733          	srl	a4,a4,a0
    a3a8:	00c6e6b3          	or	a3,a3,a2
    a3ac:	00e12623          	sw	a4,12(sp)
    a3b0:	00e034b3          	snez	s1,a4
    a3b4:	00148493          	add	s1,s1,1
    a3b8:	00d42a23          	sw	a3,20(s0)
    a3bc:	00e42c23          	sw	a4,24(s0)
    a3c0:	00942823          	sw	s1,16(s0)
    a3c4:	f6091ce3          	bnez	s2,a33c <__d2b+0x84>
    a3c8:	00249713          	sll	a4,s1,0x2
    a3cc:	00e40733          	add	a4,s0,a4
    a3d0:	01072503          	lw	a0,16(a4)
    a3d4:	bce78793          	add	a5,a5,-1074
    a3d8:	00fa2023          	sw	a5,0(s4)
    a3dc:	c74ff0ef          	jal	9850 <__hi0bits>
    a3e0:	00549493          	sll	s1,s1,0x5
    a3e4:	40a48533          	sub	a0,s1,a0
    a3e8:	f69ff06f          	j	a350 <__d2b+0x98>
    a3ec:	00812683          	lw	a3,8(sp)
    a3f0:	fc1ff06f          	j	a3b0 <__d2b+0xf8>
    a3f4:	00005697          	auipc	a3,0x5
    a3f8:	b9868693          	add	a3,a3,-1128 # ef8c <__fini_array_end+0x234>
    a3fc:	00000613          	li	a2,0
    a400:	30f00593          	li	a1,783
    a404:	00005517          	auipc	a0,0x5
    a408:	c1c50513          	add	a0,a0,-996 # f020 <__fini_array_end+0x2c8>
    a40c:	20d000ef          	jal	ae18 <__assert_func>

0000a410 <_realloc_r>:
    a410:	fd010113          	add	sp,sp,-48
    a414:	02912223          	sw	s1,36(sp)
    a418:	02112623          	sw	ra,44(sp)
    a41c:	00060493          	mv	s1,a2
    a420:	1e058863          	beqz	a1,a610 <_realloc_r+0x200>
    a424:	02812423          	sw	s0,40(sp)
    a428:	03212023          	sw	s2,32(sp)
    a42c:	00058413          	mv	s0,a1
    a430:	01312e23          	sw	s3,28(sp)
    a434:	01512a23          	sw	s5,20(sp)
    a438:	01412c23          	sw	s4,24(sp)
    a43c:	00050913          	mv	s2,a0
    a440:	8b1f70ef          	jal	1cf0 <__malloc_lock>
    a444:	ffc42703          	lw	a4,-4(s0)
    a448:	00b48793          	add	a5,s1,11
    a44c:	01600693          	li	a3,22
    a450:	ff840a93          	add	s5,s0,-8
    a454:	ffc77993          	and	s3,a4,-4
    a458:	10f6f263          	bgeu	a3,a5,a55c <_realloc_r+0x14c>
    a45c:	ff87fa13          	and	s4,a5,-8
    a460:	1007c263          	bltz	a5,a564 <_realloc_r+0x154>
    a464:	109a6063          	bltu	s4,s1,a564 <_realloc_r+0x154>
    a468:	1349d263          	bge	s3,s4,a58c <_realloc_r+0x17c>
    a46c:	01812423          	sw	s8,8(sp)
    a470:	7fff6c17          	auipc	s8,0x7fff6
    a474:	cb0c0c13          	add	s8,s8,-848 # 80000120 <__malloc_av_>
    a478:	008c2603          	lw	a2,8(s8)
    a47c:	013a86b3          	add	a3,s5,s3
    a480:	0046a783          	lw	a5,4(a3)
    a484:	1cd60863          	beq	a2,a3,a654 <_realloc_r+0x244>
    a488:	ffe7f613          	and	a2,a5,-2
    a48c:	00c68633          	add	a2,a3,a2
    a490:	00462603          	lw	a2,4(a2)
    a494:	00167613          	and	a2,a2,1
    a498:	14061a63          	bnez	a2,a5ec <_realloc_r+0x1dc>
    a49c:	ffc7f793          	and	a5,a5,-4
    a4a0:	00f98633          	add	a2,s3,a5
    a4a4:	0d465863          	bge	a2,s4,a574 <_realloc_r+0x164>
    a4a8:	00177713          	and	a4,a4,1
    a4ac:	02071c63          	bnez	a4,a4e4 <_realloc_r+0xd4>
    a4b0:	01712623          	sw	s7,12(sp)
    a4b4:	ff842b83          	lw	s7,-8(s0)
    a4b8:	01612823          	sw	s6,16(sp)
    a4bc:	417a8bb3          	sub	s7,s5,s7
    a4c0:	004ba703          	lw	a4,4(s7)
    a4c4:	ffc77713          	and	a4,a4,-4
    a4c8:	00e787b3          	add	a5,a5,a4
    a4cc:	01378b33          	add	s6,a5,s3
    a4d0:	334b5c63          	bge	s6,s4,a808 <_realloc_r+0x3f8>
    a4d4:	00e98b33          	add	s6,s3,a4
    a4d8:	294b5863          	bge	s6,s4,a768 <_realloc_r+0x358>
    a4dc:	01012b03          	lw	s6,16(sp)
    a4e0:	00c12b83          	lw	s7,12(sp)
    a4e4:	00048593          	mv	a1,s1
    a4e8:	00090513          	mv	a0,s2
    a4ec:	824f70ef          	jal	1510 <_malloc_r>
    a4f0:	00050493          	mv	s1,a0
    a4f4:	40050863          	beqz	a0,a904 <_realloc_r+0x4f4>
    a4f8:	ffc42783          	lw	a5,-4(s0)
    a4fc:	ff850713          	add	a4,a0,-8
    a500:	ffe7f793          	and	a5,a5,-2
    a504:	00fa87b3          	add	a5,s5,a5
    a508:	24e78663          	beq	a5,a4,a754 <_realloc_r+0x344>
    a50c:	ffc98613          	add	a2,s3,-4
    a510:	02400793          	li	a5,36
    a514:	2ec7e463          	bltu	a5,a2,a7fc <_realloc_r+0x3ec>
    a518:	01300713          	li	a4,19
    a51c:	20c76a63          	bltu	a4,a2,a730 <_realloc_r+0x320>
    a520:	00050793          	mv	a5,a0
    a524:	00040713          	mv	a4,s0
    a528:	00072683          	lw	a3,0(a4)
    a52c:	00d7a023          	sw	a3,0(a5)
    a530:	00472683          	lw	a3,4(a4)
    a534:	00d7a223          	sw	a3,4(a5)
    a538:	00872703          	lw	a4,8(a4)
    a53c:	00e7a423          	sw	a4,8(a5)
    a540:	00040593          	mv	a1,s0
    a544:	00090513          	mv	a0,s2
    a548:	cbdf60ef          	jal	1204 <_free_r>
    a54c:	00090513          	mv	a0,s2
    a550:	facf70ef          	jal	1cfc <__malloc_unlock>
    a554:	00812c03          	lw	s8,8(sp)
    a558:	06c0006f          	j	a5c4 <_realloc_r+0x1b4>
    a55c:	01000a13          	li	s4,16
    a560:	f09a74e3          	bgeu	s4,s1,a468 <_realloc_r+0x58>
    a564:	00c00793          	li	a5,12
    a568:	00f92023          	sw	a5,0(s2)
    a56c:	00000493          	li	s1,0
    a570:	0540006f          	j	a5c4 <_realloc_r+0x1b4>
    a574:	00c6a783          	lw	a5,12(a3)
    a578:	0086a703          	lw	a4,8(a3)
    a57c:	00812c03          	lw	s8,8(sp)
    a580:	00060993          	mv	s3,a2
    a584:	00f72623          	sw	a5,12(a4)
    a588:	00e7a423          	sw	a4,8(a5)
    a58c:	004aa783          	lw	a5,4(s5)
    a590:	414986b3          	sub	a3,s3,s4
    a594:	00f00613          	li	a2,15
    a598:	0017f793          	and	a5,a5,1
    a59c:	013a8733          	add	a4,s5,s3
    a5a0:	08d66263          	bltu	a2,a3,a624 <_realloc_r+0x214>
    a5a4:	0137e7b3          	or	a5,a5,s3
    a5a8:	00faa223          	sw	a5,4(s5)
    a5ac:	00472783          	lw	a5,4(a4)
    a5b0:	0017e793          	or	a5,a5,1
    a5b4:	00f72223          	sw	a5,4(a4)
    a5b8:	00090513          	mv	a0,s2
    a5bc:	f40f70ef          	jal	1cfc <__malloc_unlock>
    a5c0:	00040493          	mv	s1,s0
    a5c4:	02812403          	lw	s0,40(sp)
    a5c8:	02c12083          	lw	ra,44(sp)
    a5cc:	02012903          	lw	s2,32(sp)
    a5d0:	01c12983          	lw	s3,28(sp)
    a5d4:	01812a03          	lw	s4,24(sp)
    a5d8:	01412a83          	lw	s5,20(sp)
    a5dc:	00048513          	mv	a0,s1
    a5e0:	02412483          	lw	s1,36(sp)
    a5e4:	03010113          	add	sp,sp,48
    a5e8:	00008067          	ret
    a5ec:	00177713          	and	a4,a4,1
    a5f0:	ee071ae3          	bnez	a4,a4e4 <_realloc_r+0xd4>
    a5f4:	01712623          	sw	s7,12(sp)
    a5f8:	ff842b83          	lw	s7,-8(s0)
    a5fc:	01612823          	sw	s6,16(sp)
    a600:	417a8bb3          	sub	s7,s5,s7
    a604:	004ba703          	lw	a4,4(s7)
    a608:	ffc77713          	and	a4,a4,-4
    a60c:	ec9ff06f          	j	a4d4 <_realloc_r+0xc4>
    a610:	02c12083          	lw	ra,44(sp)
    a614:	02412483          	lw	s1,36(sp)
    a618:	00060593          	mv	a1,a2
    a61c:	03010113          	add	sp,sp,48
    a620:	ef1f606f          	j	1510 <_malloc_r>
    a624:	0147e7b3          	or	a5,a5,s4
    a628:	00faa223          	sw	a5,4(s5)
    a62c:	014a85b3          	add	a1,s5,s4
    a630:	0016e693          	or	a3,a3,1
    a634:	00d5a223          	sw	a3,4(a1)
    a638:	00472783          	lw	a5,4(a4)
    a63c:	00858593          	add	a1,a1,8
    a640:	00090513          	mv	a0,s2
    a644:	0017e793          	or	a5,a5,1
    a648:	00f72223          	sw	a5,4(a4)
    a64c:	bb9f60ef          	jal	1204 <_free_r>
    a650:	f69ff06f          	j	a5b8 <_realloc_r+0x1a8>
    a654:	ffc7f793          	and	a5,a5,-4
    a658:	013786b3          	add	a3,a5,s3
    a65c:	010a0613          	add	a2,s4,16
    a660:	26c6d063          	bge	a3,a2,a8c0 <_realloc_r+0x4b0>
    a664:	00177713          	and	a4,a4,1
    a668:	e6071ee3          	bnez	a4,a4e4 <_realloc_r+0xd4>
    a66c:	01712623          	sw	s7,12(sp)
    a670:	ff842b83          	lw	s7,-8(s0)
    a674:	01612823          	sw	s6,16(sp)
    a678:	417a8bb3          	sub	s7,s5,s7
    a67c:	004ba703          	lw	a4,4(s7)
    a680:	ffc77713          	and	a4,a4,-4
    a684:	00e787b3          	add	a5,a5,a4
    a688:	01378b33          	add	s6,a5,s3
    a68c:	e4cb44e3          	blt	s6,a2,a4d4 <_realloc_r+0xc4>
    a690:	00cba783          	lw	a5,12(s7)
    a694:	008ba703          	lw	a4,8(s7)
    a698:	ffc98613          	add	a2,s3,-4
    a69c:	02400693          	li	a3,36
    a6a0:	00f72623          	sw	a5,12(a4)
    a6a4:	00e7a423          	sw	a4,8(a5)
    a6a8:	008b8493          	add	s1,s7,8
    a6ac:	28c6e463          	bltu	a3,a2,a934 <_realloc_r+0x524>
    a6b0:	01300713          	li	a4,19
    a6b4:	00048793          	mv	a5,s1
    a6b8:	02c77263          	bgeu	a4,a2,a6dc <_realloc_r+0x2cc>
    a6bc:	00042703          	lw	a4,0(s0)
    a6c0:	01b00793          	li	a5,27
    a6c4:	00eba423          	sw	a4,8(s7)
    a6c8:	00442703          	lw	a4,4(s0)
    a6cc:	00eba623          	sw	a4,12(s7)
    a6d0:	26c7ea63          	bltu	a5,a2,a944 <_realloc_r+0x534>
    a6d4:	00840413          	add	s0,s0,8
    a6d8:	010b8793          	add	a5,s7,16
    a6dc:	00042703          	lw	a4,0(s0)
    a6e0:	00e7a023          	sw	a4,0(a5)
    a6e4:	00442703          	lw	a4,4(s0)
    a6e8:	00e7a223          	sw	a4,4(a5)
    a6ec:	00842703          	lw	a4,8(s0)
    a6f0:	00e7a423          	sw	a4,8(a5)
    a6f4:	014b8733          	add	a4,s7,s4
    a6f8:	414b07b3          	sub	a5,s6,s4
    a6fc:	00ec2423          	sw	a4,8(s8)
    a700:	0017e793          	or	a5,a5,1
    a704:	00f72223          	sw	a5,4(a4)
    a708:	004ba783          	lw	a5,4(s7)
    a70c:	00090513          	mv	a0,s2
    a710:	0017f793          	and	a5,a5,1
    a714:	0147e7b3          	or	a5,a5,s4
    a718:	00fba223          	sw	a5,4(s7)
    a71c:	de0f70ef          	jal	1cfc <__malloc_unlock>
    a720:	01012b03          	lw	s6,16(sp)
    a724:	00c12b83          	lw	s7,12(sp)
    a728:	00812c03          	lw	s8,8(sp)
    a72c:	e99ff06f          	j	a5c4 <_realloc_r+0x1b4>
    a730:	00042683          	lw	a3,0(s0)
    a734:	01b00713          	li	a4,27
    a738:	00d52023          	sw	a3,0(a0)
    a73c:	00442683          	lw	a3,4(s0)
    a740:	00d52223          	sw	a3,4(a0)
    a744:	14c76e63          	bltu	a4,a2,a8a0 <_realloc_r+0x490>
    a748:	00840713          	add	a4,s0,8
    a74c:	00850793          	add	a5,a0,8
    a750:	dd9ff06f          	j	a528 <_realloc_r+0x118>
    a754:	ffc52783          	lw	a5,-4(a0)
    a758:	00812c03          	lw	s8,8(sp)
    a75c:	ffc7f793          	and	a5,a5,-4
    a760:	00f989b3          	add	s3,s3,a5
    a764:	e29ff06f          	j	a58c <_realloc_r+0x17c>
    a768:	00cba783          	lw	a5,12(s7)
    a76c:	008ba703          	lw	a4,8(s7)
    a770:	ffc98613          	add	a2,s3,-4
    a774:	02400693          	li	a3,36
    a778:	00f72623          	sw	a5,12(a4)
    a77c:	00e7a423          	sw	a4,8(a5)
    a780:	008b8493          	add	s1,s7,8
    a784:	10c6e663          	bltu	a3,a2,a890 <_realloc_r+0x480>
    a788:	01300713          	li	a4,19
    a78c:	00048793          	mv	a5,s1
    a790:	02c77c63          	bgeu	a4,a2,a7c8 <_realloc_r+0x3b8>
    a794:	00042703          	lw	a4,0(s0)
    a798:	01b00793          	li	a5,27
    a79c:	00eba423          	sw	a4,8(s7)
    a7a0:	00442703          	lw	a4,4(s0)
    a7a4:	00eba623          	sw	a4,12(s7)
    a7a8:	14c7f863          	bgeu	a5,a2,a8f8 <_realloc_r+0x4e8>
    a7ac:	00842783          	lw	a5,8(s0)
    a7b0:	00fba823          	sw	a5,16(s7)
    a7b4:	00c42783          	lw	a5,12(s0)
    a7b8:	00fbaa23          	sw	a5,20(s7)
    a7bc:	0ad60c63          	beq	a2,a3,a874 <_realloc_r+0x464>
    a7c0:	01040413          	add	s0,s0,16
    a7c4:	018b8793          	add	a5,s7,24
    a7c8:	00042703          	lw	a4,0(s0)
    a7cc:	00e7a023          	sw	a4,0(a5)
    a7d0:	00442703          	lw	a4,4(s0)
    a7d4:	00e7a223          	sw	a4,4(a5)
    a7d8:	00842703          	lw	a4,8(s0)
    a7dc:	00e7a423          	sw	a4,8(a5)
    a7e0:	000b0993          	mv	s3,s6
    a7e4:	000b8a93          	mv	s5,s7
    a7e8:	01012b03          	lw	s6,16(sp)
    a7ec:	00c12b83          	lw	s7,12(sp)
    a7f0:	00812c03          	lw	s8,8(sp)
    a7f4:	00048413          	mv	s0,s1
    a7f8:	d95ff06f          	j	a58c <_realloc_r+0x17c>
    a7fc:	00040593          	mv	a1,s0
    a800:	ae8fd0ef          	jal	7ae8 <memmove>
    a804:	d3dff06f          	j	a540 <_realloc_r+0x130>
    a808:	00c6a783          	lw	a5,12(a3)
    a80c:	0086a703          	lw	a4,8(a3)
    a810:	ffc98613          	add	a2,s3,-4
    a814:	02400693          	li	a3,36
    a818:	00f72623          	sw	a5,12(a4)
    a81c:	00e7a423          	sw	a4,8(a5)
    a820:	008ba703          	lw	a4,8(s7)
    a824:	00cba783          	lw	a5,12(s7)
    a828:	008b8493          	add	s1,s7,8
    a82c:	00f72623          	sw	a5,12(a4)
    a830:	00e7a423          	sw	a4,8(a5)
    a834:	04c6ee63          	bltu	a3,a2,a890 <_realloc_r+0x480>
    a838:	01300713          	li	a4,19
    a83c:	00048793          	mv	a5,s1
    a840:	f8c774e3          	bgeu	a4,a2,a7c8 <_realloc_r+0x3b8>
    a844:	00042703          	lw	a4,0(s0)
    a848:	01b00793          	li	a5,27
    a84c:	00eba423          	sw	a4,8(s7)
    a850:	00442703          	lw	a4,4(s0)
    a854:	00eba623          	sw	a4,12(s7)
    a858:	0ac7f063          	bgeu	a5,a2,a8f8 <_realloc_r+0x4e8>
    a85c:	00842703          	lw	a4,8(s0)
    a860:	02400793          	li	a5,36
    a864:	00eba823          	sw	a4,16(s7)
    a868:	00c42703          	lw	a4,12(s0)
    a86c:	00ebaa23          	sw	a4,20(s7)
    a870:	f4f618e3          	bne	a2,a5,a7c0 <_realloc_r+0x3b0>
    a874:	01042703          	lw	a4,16(s0)
    a878:	020b8793          	add	a5,s7,32
    a87c:	01840413          	add	s0,s0,24
    a880:	00ebac23          	sw	a4,24(s7)
    a884:	ffc42703          	lw	a4,-4(s0)
    a888:	00ebae23          	sw	a4,28(s7)
    a88c:	f3dff06f          	j	a7c8 <_realloc_r+0x3b8>
    a890:	00040593          	mv	a1,s0
    a894:	00048513          	mv	a0,s1
    a898:	a50fd0ef          	jal	7ae8 <memmove>
    a89c:	f45ff06f          	j	a7e0 <_realloc_r+0x3d0>
    a8a0:	00842703          	lw	a4,8(s0)
    a8a4:	00e52423          	sw	a4,8(a0)
    a8a8:	00c42703          	lw	a4,12(s0)
    a8ac:	00e52623          	sw	a4,12(a0)
    a8b0:	06f60463          	beq	a2,a5,a918 <_realloc_r+0x508>
    a8b4:	01040713          	add	a4,s0,16
    a8b8:	01050793          	add	a5,a0,16
    a8bc:	c6dff06f          	j	a528 <_realloc_r+0x118>
    a8c0:	014a8ab3          	add	s5,s5,s4
    a8c4:	414687b3          	sub	a5,a3,s4
    a8c8:	015c2423          	sw	s5,8(s8)
    a8cc:	0017e793          	or	a5,a5,1
    a8d0:	00faa223          	sw	a5,4(s5)
    a8d4:	ffc42783          	lw	a5,-4(s0)
    a8d8:	00090513          	mv	a0,s2
    a8dc:	00040493          	mv	s1,s0
    a8e0:	0017f793          	and	a5,a5,1
    a8e4:	0147e7b3          	or	a5,a5,s4
    a8e8:	fef42e23          	sw	a5,-4(s0)
    a8ec:	c10f70ef          	jal	1cfc <__malloc_unlock>
    a8f0:	00812c03          	lw	s8,8(sp)
    a8f4:	cd1ff06f          	j	a5c4 <_realloc_r+0x1b4>
    a8f8:	00840413          	add	s0,s0,8
    a8fc:	010b8793          	add	a5,s7,16
    a900:	ec9ff06f          	j	a7c8 <_realloc_r+0x3b8>
    a904:	00090513          	mv	a0,s2
    a908:	bf4f70ef          	jal	1cfc <__malloc_unlock>
    a90c:	00000493          	li	s1,0
    a910:	00812c03          	lw	s8,8(sp)
    a914:	cb1ff06f          	j	a5c4 <_realloc_r+0x1b4>
    a918:	01042683          	lw	a3,16(s0)
    a91c:	01840713          	add	a4,s0,24
    a920:	01850793          	add	a5,a0,24
    a924:	00d52823          	sw	a3,16(a0)
    a928:	01442683          	lw	a3,20(s0)
    a92c:	00d52a23          	sw	a3,20(a0)
    a930:	bf9ff06f          	j	a528 <_realloc_r+0x118>
    a934:	00040593          	mv	a1,s0
    a938:	00048513          	mv	a0,s1
    a93c:	9acfd0ef          	jal	7ae8 <memmove>
    a940:	db5ff06f          	j	a6f4 <_realloc_r+0x2e4>
    a944:	00842783          	lw	a5,8(s0)
    a948:	00fba823          	sw	a5,16(s7)
    a94c:	00c42783          	lw	a5,12(s0)
    a950:	00fbaa23          	sw	a5,20(s7)
    a954:	00d60863          	beq	a2,a3,a964 <_realloc_r+0x554>
    a958:	01040413          	add	s0,s0,16
    a95c:	018b8793          	add	a5,s7,24
    a960:	d7dff06f          	j	a6dc <_realloc_r+0x2cc>
    a964:	01042703          	lw	a4,16(s0)
    a968:	020b8793          	add	a5,s7,32
    a96c:	01840413          	add	s0,s0,24
    a970:	00ebac23          	sw	a4,24(s7)
    a974:	ffc42703          	lw	a4,-4(s0)
    a978:	00ebae23          	sw	a4,28(s7)
    a97c:	d61ff06f          	j	a6dc <_realloc_r+0x2cc>

0000a980 <__ascii_wctomb>:
    a980:	02058463          	beqz	a1,a9a8 <__ascii_wctomb+0x28>
    a984:	0ff00793          	li	a5,255
    a988:	00c7e863          	bltu	a5,a2,a998 <__ascii_wctomb+0x18>
    a98c:	00c58023          	sb	a2,0(a1)
    a990:	00100513          	li	a0,1
    a994:	00008067          	ret
    a998:	08a00793          	li	a5,138
    a99c:	00f52023          	sw	a5,0(a0)
    a9a0:	fff00513          	li	a0,-1
    a9a4:	00008067          	ret
    a9a8:	00000513          	li	a0,0
    a9ac:	00008067          	ret

0000a9b0 <_wcrtomb_r>:
    a9b0:	fe010113          	add	sp,sp,-32
    a9b4:	00812c23          	sw	s0,24(sp)
    a9b8:	00912a23          	sw	s1,20(sp)
    a9bc:	00112e23          	sw	ra,28(sp)
    a9c0:	00050493          	mv	s1,a0
    a9c4:	10450413          	add	s0,a0,260
    a9c8:	00068463          	beqz	a3,a9d0 <_wcrtomb_r+0x20>
    a9cc:	00068413          	mv	s0,a3
    a9d0:	7fff6797          	auipc	a5,0x7fff6
    a9d4:	c447a783          	lw	a5,-956(a5) # 80000614 <__global_locale+0xe0>
    a9d8:	00040693          	mv	a3,s0
    a9dc:	02058463          	beqz	a1,aa04 <_wcrtomb_r+0x54>
    a9e0:	00048513          	mv	a0,s1
    a9e4:	000780e7          	jalr	a5
    a9e8:	fff00793          	li	a5,-1
    a9ec:	02f50863          	beq	a0,a5,aa1c <_wcrtomb_r+0x6c>
    a9f0:	01c12083          	lw	ra,28(sp)
    a9f4:	01812403          	lw	s0,24(sp)
    a9f8:	01412483          	lw	s1,20(sp)
    a9fc:	02010113          	add	sp,sp,32
    aa00:	00008067          	ret
    aa04:	00000613          	li	a2,0
    aa08:	00410593          	add	a1,sp,4
    aa0c:	00048513          	mv	a0,s1
    aa10:	000780e7          	jalr	a5
    aa14:	fff00793          	li	a5,-1
    aa18:	fcf51ce3          	bne	a0,a5,a9f0 <_wcrtomb_r+0x40>
    aa1c:	00042023          	sw	zero,0(s0)
    aa20:	01c12083          	lw	ra,28(sp)
    aa24:	01812403          	lw	s0,24(sp)
    aa28:	08a00793          	li	a5,138
    aa2c:	00f4a023          	sw	a5,0(s1)
    aa30:	01412483          	lw	s1,20(sp)
    aa34:	02010113          	add	sp,sp,32
    aa38:	00008067          	ret

0000aa3c <_wcsrtombs_r>:
    aa3c:	00070793          	mv	a5,a4
    aa40:	00068713          	mv	a4,a3
    aa44:	fff00693          	li	a3,-1
    aa48:	7a40006f          	j	b1ec <_wcsnrtombs_r>

0000aa4c <_fclose_r>:
    aa4c:	ff010113          	add	sp,sp,-16
    aa50:	00112623          	sw	ra,12(sp)
    aa54:	01212023          	sw	s2,0(sp)
    aa58:	0e058263          	beqz	a1,ab3c <_fclose_r+0xf0>
    aa5c:	00812423          	sw	s0,8(sp)
    aa60:	00912223          	sw	s1,4(sp)
    aa64:	00058413          	mv	s0,a1
    aa68:	00050493          	mv	s1,a0
    aa6c:	00050663          	beqz	a0,aa78 <_fclose_r+0x2c>
    aa70:	03452783          	lw	a5,52(a0)
    aa74:	10078063          	beqz	a5,ab74 <_fclose_r+0x128>
    aa78:	06442783          	lw	a5,100(s0)
    aa7c:	00c41703          	lh	a4,12(s0)
    aa80:	0017f793          	and	a5,a5,1
    aa84:	0a079663          	bnez	a5,ab30 <_fclose_r+0xe4>
    aa88:	20077713          	and	a4,a4,512
    aa8c:	0e070863          	beqz	a4,ab7c <_fclose_r+0x130>
    aa90:	00040593          	mv	a1,s0
    aa94:	00048513          	mv	a0,s1
    aa98:	9f5fb0ef          	jal	648c <__sflush_r>
    aa9c:	02c42783          	lw	a5,44(s0)
    aaa0:	00050913          	mv	s2,a0
    aaa4:	00078a63          	beqz	a5,aab8 <_fclose_r+0x6c>
    aaa8:	01c42583          	lw	a1,28(s0)
    aaac:	00048513          	mv	a0,s1
    aab0:	000780e7          	jalr	a5
    aab4:	0a054063          	bltz	a0,ab54 <_fclose_r+0x108>
    aab8:	00c45783          	lhu	a5,12(s0)
    aabc:	0807f793          	and	a5,a5,128
    aac0:	0a079263          	bnez	a5,ab64 <_fclose_r+0x118>
    aac4:	03042583          	lw	a1,48(s0)
    aac8:	00058c63          	beqz	a1,aae0 <_fclose_r+0x94>
    aacc:	04040793          	add	a5,s0,64
    aad0:	00f58663          	beq	a1,a5,aadc <_fclose_r+0x90>
    aad4:	00048513          	mv	a0,s1
    aad8:	f2cf60ef          	jal	1204 <_free_r>
    aadc:	02042823          	sw	zero,48(s0)
    aae0:	04442583          	lw	a1,68(s0)
    aae4:	00058863          	beqz	a1,aaf4 <_fclose_r+0xa8>
    aae8:	00048513          	mv	a0,s1
    aaec:	f18f60ef          	jal	1204 <_free_r>
    aaf0:	04042223          	sw	zero,68(s0)
    aaf4:	f51fb0ef          	jal	6a44 <__sfp_lock_acquire>
    aaf8:	06442783          	lw	a5,100(s0)
    aafc:	00041623          	sh	zero,12(s0)
    ab00:	0017f793          	and	a5,a5,1
    ab04:	0a078663          	beqz	a5,abb0 <_fclose_r+0x164>
    ab08:	05842503          	lw	a0,88(s0)
    ab0c:	a9cf60ef          	jal	da8 <__retarget_lock_close_recursive>
    ab10:	f41fb0ef          	jal	6a50 <__sfp_lock_release>
    ab14:	00c12083          	lw	ra,12(sp)
    ab18:	00812403          	lw	s0,8(sp)
    ab1c:	00412483          	lw	s1,4(sp)
    ab20:	00090513          	mv	a0,s2
    ab24:	00012903          	lw	s2,0(sp)
    ab28:	01010113          	add	sp,sp,16
    ab2c:	00008067          	ret
    ab30:	f60710e3          	bnez	a4,aa90 <_fclose_r+0x44>
    ab34:	00812403          	lw	s0,8(sp)
    ab38:	00412483          	lw	s1,4(sp)
    ab3c:	00000913          	li	s2,0
    ab40:	00c12083          	lw	ra,12(sp)
    ab44:	00090513          	mv	a0,s2
    ab48:	00012903          	lw	s2,0(sp)
    ab4c:	01010113          	add	sp,sp,16
    ab50:	00008067          	ret
    ab54:	00c45783          	lhu	a5,12(s0)
    ab58:	fff00913          	li	s2,-1
    ab5c:	0807f793          	and	a5,a5,128
    ab60:	f60782e3          	beqz	a5,aac4 <_fclose_r+0x78>
    ab64:	01042583          	lw	a1,16(s0)
    ab68:	00048513          	mv	a0,s1
    ab6c:	e98f60ef          	jal	1204 <_free_r>
    ab70:	f55ff06f          	j	aac4 <_fclose_r+0x78>
    ab74:	e61fb0ef          	jal	69d4 <__sinit>
    ab78:	f01ff06f          	j	aa78 <_fclose_r+0x2c>
    ab7c:	05842503          	lw	a0,88(s0)
    ab80:	a2cf60ef          	jal	dac <__retarget_lock_acquire_recursive>
    ab84:	00c41783          	lh	a5,12(s0)
    ab88:	f00794e3          	bnez	a5,aa90 <_fclose_r+0x44>
    ab8c:	06442783          	lw	a5,100(s0)
    ab90:	0017f793          	and	a5,a5,1
    ab94:	fa0790e3          	bnez	a5,ab34 <_fclose_r+0xe8>
    ab98:	05842503          	lw	a0,88(s0)
    ab9c:	00000913          	li	s2,0
    aba0:	a10f60ef          	jal	db0 <__retarget_lock_release_recursive>
    aba4:	00812403          	lw	s0,8(sp)
    aba8:	00412483          	lw	s1,4(sp)
    abac:	f95ff06f          	j	ab40 <_fclose_r+0xf4>
    abb0:	05842503          	lw	a0,88(s0)
    abb4:	9fcf60ef          	jal	db0 <__retarget_lock_release_recursive>
    abb8:	f51ff06f          	j	ab08 <_fclose_r+0xbc>

0000abbc <__smakebuf_r>:
    abbc:	00c59783          	lh	a5,12(a1)
    abc0:	f8010113          	add	sp,sp,-128
    abc4:	06812c23          	sw	s0,120(sp)
    abc8:	06112e23          	sw	ra,124(sp)
    abcc:	0027f713          	and	a4,a5,2
    abd0:	00058413          	mv	s0,a1
    abd4:	02070463          	beqz	a4,abfc <__smakebuf_r+0x40>
    abd8:	04358793          	add	a5,a1,67
    abdc:	00f5a023          	sw	a5,0(a1)
    abe0:	00f5a823          	sw	a5,16(a1)
    abe4:	00100793          	li	a5,1
    abe8:	00f5aa23          	sw	a5,20(a1)
    abec:	07c12083          	lw	ra,124(sp)
    abf0:	07812403          	lw	s0,120(sp)
    abf4:	08010113          	add	sp,sp,128
    abf8:	00008067          	ret
    abfc:	00e59583          	lh	a1,14(a1)
    ac00:	06912a23          	sw	s1,116(sp)
    ac04:	07212823          	sw	s2,112(sp)
    ac08:	07312623          	sw	s3,108(sp)
    ac0c:	07412423          	sw	s4,104(sp)
    ac10:	00050493          	mv	s1,a0
    ac14:	0805c663          	bltz	a1,aca0 <__smakebuf_r+0xe4>
    ac18:	00810613          	add	a2,sp,8
    ac1c:	138000ef          	jal	ad54 <_fstat_r>
    ac20:	06054e63          	bltz	a0,ac9c <__smakebuf_r+0xe0>
    ac24:	00c12783          	lw	a5,12(sp)
    ac28:	0000f937          	lui	s2,0xf
    ac2c:	000019b7          	lui	s3,0x1
    ac30:	00f97933          	and	s2,s2,a5
    ac34:	ffffe7b7          	lui	a5,0xffffe
    ac38:	00f90933          	add	s2,s2,a5
    ac3c:	00193913          	seqz	s2,s2
    ac40:	40000a13          	li	s4,1024
    ac44:	80098993          	add	s3,s3,-2048 # 800 <main+0x4bc>
    ac48:	000a0593          	mv	a1,s4
    ac4c:	00048513          	mv	a0,s1
    ac50:	8c1f60ef          	jal	1510 <_malloc_r>
    ac54:	00c41783          	lh	a5,12(s0)
    ac58:	06050863          	beqz	a0,acc8 <__smakebuf_r+0x10c>
    ac5c:	0807e793          	or	a5,a5,128
    ac60:	00a42023          	sw	a0,0(s0)
    ac64:	00a42823          	sw	a0,16(s0)
    ac68:	00f41623          	sh	a5,12(s0)
    ac6c:	01442a23          	sw	s4,20(s0)
    ac70:	0a091063          	bnez	s2,ad10 <__smakebuf_r+0x154>
    ac74:	0137e7b3          	or	a5,a5,s3
    ac78:	07c12083          	lw	ra,124(sp)
    ac7c:	00f41623          	sh	a5,12(s0)
    ac80:	07812403          	lw	s0,120(sp)
    ac84:	07412483          	lw	s1,116(sp)
    ac88:	07012903          	lw	s2,112(sp)
    ac8c:	06c12983          	lw	s3,108(sp)
    ac90:	06812a03          	lw	s4,104(sp)
    ac94:	08010113          	add	sp,sp,128
    ac98:	00008067          	ret
    ac9c:	00c41783          	lh	a5,12(s0)
    aca0:	0807f793          	and	a5,a5,128
    aca4:	00000913          	li	s2,0
    aca8:	04078e63          	beqz	a5,ad04 <__smakebuf_r+0x148>
    acac:	04000a13          	li	s4,64
    acb0:	000a0593          	mv	a1,s4
    acb4:	00048513          	mv	a0,s1
    acb8:	859f60ef          	jal	1510 <_malloc_r>
    acbc:	00c41783          	lh	a5,12(s0)
    acc0:	00000993          	li	s3,0
    acc4:	f8051ce3          	bnez	a0,ac5c <__smakebuf_r+0xa0>
    acc8:	2007f713          	and	a4,a5,512
    accc:	04071e63          	bnez	a4,ad28 <__smakebuf_r+0x16c>
    acd0:	ffc7f793          	and	a5,a5,-4
    acd4:	0027e793          	or	a5,a5,2
    acd8:	04340713          	add	a4,s0,67
    acdc:	00f41623          	sh	a5,12(s0)
    ace0:	00100793          	li	a5,1
    ace4:	07412483          	lw	s1,116(sp)
    ace8:	07012903          	lw	s2,112(sp)
    acec:	06c12983          	lw	s3,108(sp)
    acf0:	06812a03          	lw	s4,104(sp)
    acf4:	00e42023          	sw	a4,0(s0)
    acf8:	00e42823          	sw	a4,16(s0)
    acfc:	00f42a23          	sw	a5,20(s0)
    ad00:	eedff06f          	j	abec <__smakebuf_r+0x30>
    ad04:	40000a13          	li	s4,1024
    ad08:	00000993          	li	s3,0
    ad0c:	f3dff06f          	j	ac48 <__smakebuf_r+0x8c>
    ad10:	00e41583          	lh	a1,14(s0)
    ad14:	00048513          	mv	a0,s1
    ad18:	09c000ef          	jal	adb4 <_isatty_r>
    ad1c:	02051063          	bnez	a0,ad3c <__smakebuf_r+0x180>
    ad20:	00c41783          	lh	a5,12(s0)
    ad24:	f51ff06f          	j	ac74 <__smakebuf_r+0xb8>
    ad28:	07412483          	lw	s1,116(sp)
    ad2c:	07012903          	lw	s2,112(sp)
    ad30:	06c12983          	lw	s3,108(sp)
    ad34:	06812a03          	lw	s4,104(sp)
    ad38:	eb5ff06f          	j	abec <__smakebuf_r+0x30>
    ad3c:	00c45783          	lhu	a5,12(s0)
    ad40:	ffc7f793          	and	a5,a5,-4
    ad44:	0017e793          	or	a5,a5,1
    ad48:	01079793          	sll	a5,a5,0x10
    ad4c:	4107d793          	sra	a5,a5,0x10
    ad50:	f25ff06f          	j	ac74 <__smakebuf_r+0xb8>

0000ad54 <_fstat_r>:
    ad54:	ff010113          	add	sp,sp,-16
    ad58:	00058713          	mv	a4,a1
    ad5c:	00812423          	sw	s0,8(sp)
    ad60:	00060593          	mv	a1,a2
    ad64:	00050413          	mv	s0,a0
    ad68:	00070513          	mv	a0,a4
    ad6c:	7fff6797          	auipc	a5,0x7fff6
    ad70:	9a07a623          	sw	zero,-1620(a5) # 80000718 <errno>
    ad74:	00112623          	sw	ra,12(sp)
    ad78:	c15f50ef          	jal	98c <_fstat>
    ad7c:	fff00793          	li	a5,-1
    ad80:	00f50a63          	beq	a0,a5,ad94 <_fstat_r+0x40>
    ad84:	00c12083          	lw	ra,12(sp)
    ad88:	00812403          	lw	s0,8(sp)
    ad8c:	01010113          	add	sp,sp,16
    ad90:	00008067          	ret
    ad94:	7fff6797          	auipc	a5,0x7fff6
    ad98:	9847a783          	lw	a5,-1660(a5) # 80000718 <errno>
    ad9c:	fe0784e3          	beqz	a5,ad84 <_fstat_r+0x30>
    ada0:	00c12083          	lw	ra,12(sp)
    ada4:	00f42023          	sw	a5,0(s0)
    ada8:	00812403          	lw	s0,8(sp)
    adac:	01010113          	add	sp,sp,16
    adb0:	00008067          	ret

0000adb4 <_isatty_r>:
    adb4:	ff010113          	add	sp,sp,-16
    adb8:	00812423          	sw	s0,8(sp)
    adbc:	00050413          	mv	s0,a0
    adc0:	00058513          	mv	a0,a1
    adc4:	7fff6797          	auipc	a5,0x7fff6
    adc8:	9407aa23          	sw	zero,-1708(a5) # 80000718 <errno>
    adcc:	00112623          	sw	ra,12(sp)
    add0:	bd5f50ef          	jal	9a4 <_isatty>
    add4:	fff00793          	li	a5,-1
    add8:	00f50a63          	beq	a0,a5,adec <_isatty_r+0x38>
    addc:	00c12083          	lw	ra,12(sp)
    ade0:	00812403          	lw	s0,8(sp)
    ade4:	01010113          	add	sp,sp,16
    ade8:	00008067          	ret
    adec:	7fff6797          	auipc	a5,0x7fff6
    adf0:	92c7a783          	lw	a5,-1748(a5) # 80000718 <errno>
    adf4:	fe0784e3          	beqz	a5,addc <_isatty_r+0x28>
    adf8:	00c12083          	lw	ra,12(sp)
    adfc:	00f42023          	sw	a5,0(s0)
    ae00:	00812403          	lw	s0,8(sp)
    ae04:	01010113          	add	sp,sp,16
    ae08:	00008067          	ret

0000ae0c <__errno>:
    ae0c:	7fff6517          	auipc	a0,0x7fff6
    ae10:	8fc52503          	lw	a0,-1796(a0) # 80000708 <_impure_ptr>
    ae14:	00008067          	ret

0000ae18 <__assert_func>:
    ae18:	ff010113          	add	sp,sp,-16
    ae1c:	00068793          	mv	a5,a3
    ae20:	7fff6717          	auipc	a4,0x7fff6
    ae24:	8e872703          	lw	a4,-1816(a4) # 80000708 <_impure_ptr>
    ae28:	00060813          	mv	a6,a2
    ae2c:	00112623          	sw	ra,12(sp)
    ae30:	00c72883          	lw	a7,12(a4)
    ae34:	00078613          	mv	a2,a5
    ae38:	00050693          	mv	a3,a0
    ae3c:	00058713          	mv	a4,a1
    ae40:	00004797          	auipc	a5,0x4
    ae44:	26078793          	add	a5,a5,608 # f0a0 <__fini_array_end+0x348>
    ae48:	00080c63          	beqz	a6,ae60 <__assert_func+0x48>
    ae4c:	00004597          	auipc	a1,0x4
    ae50:	26458593          	add	a1,a1,612 # f0b0 <__fini_array_end+0x358>
    ae54:	00088513          	mv	a0,a7
    ae58:	3a8000ef          	jal	b200 <fiprintf>
    ae5c:	3f0000ef          	jal	b24c <abort>
    ae60:	00004797          	auipc	a5,0x4
    ae64:	05478793          	add	a5,a5,84 # eeb4 <__fini_array_end+0x15c>
    ae68:	00078813          	mv	a6,a5
    ae6c:	fe1ff06f          	j	ae4c <__assert_func+0x34>

0000ae70 <_calloc_r>:
    ae70:	fe010113          	add	sp,sp,-32
    ae74:	00812c23          	sw	s0,24(sp)
    ae78:	00112e23          	sw	ra,28(sp)
    ae7c:	0105d693          	srl	a3,a1,0x10
    ae80:	00058793          	mv	a5,a1
    ae84:	00050413          	mv	s0,a0
    ae88:	01065713          	srl	a4,a2,0x10
    ae8c:	0c069063          	bnez	a3,af4c <_calloc_r+0xdc>
    ae90:	14071a63          	bnez	a4,afe4 <_calloc_r+0x174>
    ae94:	01061593          	sll	a1,a2,0x10
    ae98:	01079513          	sll	a0,a5,0x10
    ae9c:	0105d593          	srl	a1,a1,0x10
    aea0:	01055513          	srl	a0,a0,0x10
    aea4:	4bd030ef          	jal	eb60 <__mulsi3>
    aea8:	00050593          	mv	a1,a0
    aeac:	00040513          	mv	a0,s0
    aeb0:	e60f60ef          	jal	1510 <_malloc_r>
    aeb4:	00050413          	mv	s0,a0
    aeb8:	10050a63          	beqz	a0,afcc <_calloc_r+0x15c>
    aebc:	ffc52603          	lw	a2,-4(a0)
    aec0:	02400713          	li	a4,36
    aec4:	ffc67613          	and	a2,a2,-4
    aec8:	ffc60613          	add	a2,a2,-4
    aecc:	04c76863          	bltu	a4,a2,af1c <_calloc_r+0xac>
    aed0:	01300693          	li	a3,19
    aed4:	00050793          	mv	a5,a0
    aed8:	02c6f263          	bgeu	a3,a2,aefc <_calloc_r+0x8c>
    aedc:	00052023          	sw	zero,0(a0)
    aee0:	00052223          	sw	zero,4(a0)
    aee4:	01b00793          	li	a5,27
    aee8:	04c7f863          	bgeu	a5,a2,af38 <_calloc_r+0xc8>
    aeec:	00052423          	sw	zero,8(a0)
    aef0:	00052623          	sw	zero,12(a0)
    aef4:	01050793          	add	a5,a0,16
    aef8:	10e60263          	beq	a2,a4,affc <_calloc_r+0x18c>
    aefc:	0007a023          	sw	zero,0(a5)
    af00:	0007a223          	sw	zero,4(a5)
    af04:	0007a423          	sw	zero,8(a5)
    af08:	01c12083          	lw	ra,28(sp)
    af0c:	00040513          	mv	a0,s0
    af10:	01812403          	lw	s0,24(sp)
    af14:	02010113          	add	sp,sp,32
    af18:	00008067          	ret
    af1c:	00000593          	li	a1,0
    af20:	e95f50ef          	jal	db4 <memset>
    af24:	01c12083          	lw	ra,28(sp)
    af28:	00040513          	mv	a0,s0
    af2c:	01812403          	lw	s0,24(sp)
    af30:	02010113          	add	sp,sp,32
    af34:	00008067          	ret
    af38:	00850793          	add	a5,a0,8
    af3c:	0007a023          	sw	zero,0(a5)
    af40:	0007a223          	sw	zero,4(a5)
    af44:	0007a423          	sw	zero,8(a5)
    af48:	fc1ff06f          	j	af08 <_calloc_r+0x98>
    af4c:	0c071663          	bnez	a4,b018 <_calloc_r+0x1a8>
    af50:	01212823          	sw	s2,16(sp)
    af54:	01312623          	sw	s3,12(sp)
    af58:	00912a23          	sw	s1,20(sp)
    af5c:	00068913          	mv	s2,a3
    af60:	00060993          	mv	s3,a2
    af64:	01079513          	sll	a0,a5,0x10
    af68:	01061593          	sll	a1,a2,0x10
    af6c:	0105d593          	srl	a1,a1,0x10
    af70:	01055513          	srl	a0,a0,0x10
    af74:	3ed030ef          	jal	eb60 <__mulsi3>
    af78:	00050493          	mv	s1,a0
    af7c:	01091593          	sll	a1,s2,0x10
    af80:	01099513          	sll	a0,s3,0x10
    af84:	0105d593          	srl	a1,a1,0x10
    af88:	01055513          	srl	a0,a0,0x10
    af8c:	3d5030ef          	jal	eb60 <__mulsi3>
    af90:	0104d793          	srl	a5,s1,0x10
    af94:	00f505b3          	add	a1,a0,a5
    af98:	0105d793          	srl	a5,a1,0x10
    af9c:	06079863          	bnez	a5,b00c <_calloc_r+0x19c>
    afa0:	01049493          	sll	s1,s1,0x10
    afa4:	0104d493          	srl	s1,s1,0x10
    afa8:	01059593          	sll	a1,a1,0x10
    afac:	0095e5b3          	or	a1,a1,s1
    afb0:	00040513          	mv	a0,s0
    afb4:	01412483          	lw	s1,20(sp)
    afb8:	01012903          	lw	s2,16(sp)
    afbc:	00c12983          	lw	s3,12(sp)
    afc0:	d50f60ef          	jal	1510 <_malloc_r>
    afc4:	00050413          	mv	s0,a0
    afc8:	ee051ae3          	bnez	a0,aebc <_calloc_r+0x4c>
    afcc:	00000413          	li	s0,0
    afd0:	01c12083          	lw	ra,28(sp)
    afd4:	00040513          	mv	a0,s0
    afd8:	01812403          	lw	s0,24(sp)
    afdc:	02010113          	add	sp,sp,32
    afe0:	00008067          	ret
    afe4:	01212823          	sw	s2,16(sp)
    afe8:	01312623          	sw	s3,12(sp)
    afec:	00912a23          	sw	s1,20(sp)
    aff0:	00070913          	mv	s2,a4
    aff4:	00058993          	mv	s3,a1
    aff8:	f6dff06f          	j	af64 <_calloc_r+0xf4>
    affc:	00052823          	sw	zero,16(a0)
    b000:	01850793          	add	a5,a0,24
    b004:	00052a23          	sw	zero,20(a0)
    b008:	ef5ff06f          	j	aefc <_calloc_r+0x8c>
    b00c:	01412483          	lw	s1,20(sp)
    b010:	01012903          	lw	s2,16(sp)
    b014:	00c12983          	lw	s3,12(sp)
    b018:	df5ff0ef          	jal	ae0c <__errno>
    b01c:	00c00793          	li	a5,12
    b020:	00f52023          	sw	a5,0(a0)
    b024:	00000413          	li	s0,0
    b028:	fa9ff06f          	j	afd0 <_calloc_r+0x160>

0000b02c <_wcsnrtombs_l>:
    b02c:	fa010113          	add	sp,sp,-96
    b030:	04912a23          	sw	s1,84(sp)
    b034:	05212823          	sw	s2,80(sp)
    b038:	05312623          	sw	s3,76(sp)
    b03c:	05412423          	sw	s4,72(sp)
    b040:	05512223          	sw	s5,68(sp)
    b044:	04112e23          	sw	ra,92(sp)
    b048:	03912a23          	sw	s9,52(sp)
    b04c:	03a12823          	sw	s10,48(sp)
    b050:	00a12623          	sw	a0,12(sp)
    b054:	00058a13          	mv	s4,a1
    b058:	00060a93          	mv	s5,a2
    b05c:	00070913          	mv	s2,a4
    b060:	00080993          	mv	s3,a6
    b064:	00078493          	mv	s1,a5
    b068:	12078063          	beqz	a5,b188 <_wcsnrtombs_l+0x15c>
    b06c:	000aac83          	lw	s9,0(s5)
    b070:	120a0263          	beqz	s4,b194 <_wcsnrtombs_l+0x168>
    b074:	14090e63          	beqz	s2,b1d0 <_wcsnrtombs_l+0x1a4>
    b078:	05612023          	sw	s6,64(sp)
    b07c:	fff68b13          	add	s6,a3,-1
    b080:	16068063          	beqz	a3,b1e0 <_wcsnrtombs_l+0x1b4>
    b084:	04812c23          	sw	s0,88(sp)
    b088:	03b12623          	sw	s11,44(sp)
    b08c:	03712e23          	sw	s7,60(sp)
    b090:	03812c23          	sw	s8,56(sp)
    b094:	000a0413          	mv	s0,s4
    b098:	00000d13          	li	s10,0
    b09c:	fff00d93          	li	s11,-1
    b0a0:	0240006f          	j	b0c4 <_wcsnrtombs_l+0x98>
    b0a4:	080a1a63          	bnez	s4,b138 <_wcsnrtombs_l+0x10c>
    b0a8:	000ca783          	lw	a5,0(s9)
    b0ac:	004c8c93          	add	s9,s9,4
    b0b0:	0c078263          	beqz	a5,b174 <_wcsnrtombs_l+0x148>
    b0b4:	1326f263          	bgeu	a3,s2,b1d8 <_wcsnrtombs_l+0x1ac>
    b0b8:	fffb0b13          	add	s6,s6,-1
    b0bc:	00068d13          	mv	s10,a3
    b0c0:	03bb0c63          	beq	s6,s11,b0f8 <_wcsnrtombs_l+0xcc>
    b0c4:	0e09a783          	lw	a5,224(s3)
    b0c8:	000ca603          	lw	a2,0(s9)
    b0cc:	00c12503          	lw	a0,12(sp)
    b0d0:	00048693          	mv	a3,s1
    b0d4:	01410593          	add	a1,sp,20
    b0d8:	0004ac03          	lw	s8,0(s1)
    b0dc:	0044ab83          	lw	s7,4(s1)
    b0e0:	000780e7          	jalr	a5
    b0e4:	0bb50e63          	beq	a0,s11,b1a0 <_wcsnrtombs_l+0x174>
    b0e8:	01a506b3          	add	a3,a0,s10
    b0ec:	fad97ce3          	bgeu	s2,a3,b0a4 <_wcsnrtombs_l+0x78>
    b0f0:	0184a023          	sw	s8,0(s1)
    b0f4:	0174a223          	sw	s7,4(s1)
    b0f8:	05812403          	lw	s0,88(sp)
    b0fc:	04012b03          	lw	s6,64(sp)
    b100:	03c12b83          	lw	s7,60(sp)
    b104:	03812c03          	lw	s8,56(sp)
    b108:	02c12d83          	lw	s11,44(sp)
    b10c:	05c12083          	lw	ra,92(sp)
    b110:	05412483          	lw	s1,84(sp)
    b114:	05012903          	lw	s2,80(sp)
    b118:	04c12983          	lw	s3,76(sp)
    b11c:	04812a03          	lw	s4,72(sp)
    b120:	04412a83          	lw	s5,68(sp)
    b124:	03412c83          	lw	s9,52(sp)
    b128:	000d0513          	mv	a0,s10
    b12c:	03012d03          	lw	s10,48(sp)
    b130:	06010113          	add	sp,sp,96
    b134:	00008067          	ret
    b138:	08a05063          	blez	a0,b1b8 <_wcsnrtombs_l+0x18c>
    b13c:	01410893          	add	a7,sp,20
    b140:	00a40533          	add	a0,s0,a0
    b144:	0008c783          	lbu	a5,0(a7)
    b148:	00140413          	add	s0,s0,1
    b14c:	00188893          	add	a7,a7,1
    b150:	fef40fa3          	sb	a5,-1(s0)
    b154:	fe8518e3          	bne	a0,s0,b144 <_wcsnrtombs_l+0x118>
    b158:	000aa783          	lw	a5,0(s5)
    b15c:	00050413          	mv	s0,a0
    b160:	00478793          	add	a5,a5,4
    b164:	00faa023          	sw	a5,0(s5)
    b168:	000ca783          	lw	a5,0(s9)
    b16c:	004c8c93          	add	s9,s9,4
    b170:	f40792e3          	bnez	a5,b0b4 <_wcsnrtombs_l+0x88>
    b174:	000a0463          	beqz	s4,b17c <_wcsnrtombs_l+0x150>
    b178:	000aa023          	sw	zero,0(s5)
    b17c:	0004a023          	sw	zero,0(s1)
    b180:	fff68d13          	add	s10,a3,-1
    b184:	f75ff06f          	j	b0f8 <_wcsnrtombs_l+0xcc>
    b188:	000aac83          	lw	s9,0(s5)
    b18c:	10c50493          	add	s1,a0,268
    b190:	ee0a12e3          	bnez	s4,b074 <_wcsnrtombs_l+0x48>
    b194:	05612023          	sw	s6,64(sp)
    b198:	fff00913          	li	s2,-1
    b19c:	ee1ff06f          	j	b07c <_wcsnrtombs_l+0x50>
    b1a0:	00c12703          	lw	a4,12(sp)
    b1a4:	08a00793          	li	a5,138
    b1a8:	fff00d13          	li	s10,-1
    b1ac:	00f72023          	sw	a5,0(a4)
    b1b0:	0004a023          	sw	zero,0(s1)
    b1b4:	f45ff06f          	j	b0f8 <_wcsnrtombs_l+0xcc>
    b1b8:	000aa783          	lw	a5,0(s5)
    b1bc:	00040513          	mv	a0,s0
    b1c0:	00050413          	mv	s0,a0
    b1c4:	00478793          	add	a5,a5,4
    b1c8:	00faa023          	sw	a5,0(s5)
    b1cc:	f9dff06f          	j	b168 <_wcsnrtombs_l+0x13c>
    b1d0:	00000d13          	li	s10,0
    b1d4:	f39ff06f          	j	b10c <_wcsnrtombs_l+0xe0>
    b1d8:	00068d13          	mv	s10,a3
    b1dc:	f1dff06f          	j	b0f8 <_wcsnrtombs_l+0xcc>
    b1e0:	04012b03          	lw	s6,64(sp)
    b1e4:	00000d13          	li	s10,0
    b1e8:	f25ff06f          	j	b10c <_wcsnrtombs_l+0xe0>

0000b1ec <_wcsnrtombs_r>:
    b1ec:	7fff5817          	auipc	a6,0x7fff5
    b1f0:	34880813          	add	a6,a6,840 # 80000534 <__global_locale>
    b1f4:	7fff5517          	auipc	a0,0x7fff5
    b1f8:	51452503          	lw	a0,1300(a0) # 80000708 <_impure_ptr>
    b1fc:	e31ff06f          	j	b02c <_wcsnrtombs_l>

0000b200 <fiprintf>:
    b200:	fc010113          	add	sp,sp,-64
    b204:	02810313          	add	t1,sp,40
    b208:	02c12423          	sw	a2,40(sp)
    b20c:	02d12623          	sw	a3,44(sp)
    b210:	00058613          	mv	a2,a1
    b214:	00030693          	mv	a3,t1
    b218:	00050593          	mv	a1,a0
    b21c:	7fff5517          	auipc	a0,0x7fff5
    b220:	4ec52503          	lw	a0,1260(a0) # 80000708 <_impure_ptr>
    b224:	00112e23          	sw	ra,28(sp)
    b228:	02e12823          	sw	a4,48(sp)
    b22c:	02f12a23          	sw	a5,52(sp)
    b230:	03012c23          	sw	a6,56(sp)
    b234:	03112e23          	sw	a7,60(sp)
    b238:	00612623          	sw	t1,12(sp)
    b23c:	9a1f90ef          	jal	4bdc <_vfiprintf_r>
    b240:	01c12083          	lw	ra,28(sp)
    b244:	04010113          	add	sp,sp,64
    b248:	00008067          	ret

0000b24c <abort>:
    b24c:	ff010113          	add	sp,sp,-16
    b250:	00600513          	li	a0,6
    b254:	00112623          	sw	ra,12(sp)
    b258:	00c000ef          	jal	b264 <raise>
    b25c:	00100513          	li	a0,1
    b260:	f14f50ef          	jal	974 <_exit>

0000b264 <raise>:
    b264:	ff010113          	add	sp,sp,-16
    b268:	00912223          	sw	s1,4(sp)
    b26c:	00112623          	sw	ra,12(sp)
    b270:	01f00793          	li	a5,31
    b274:	7fff5497          	auipc	s1,0x7fff5
    b278:	4944a483          	lw	s1,1172(s1) # 80000708 <_impure_ptr>
    b27c:	08a7ee63          	bltu	a5,a0,b318 <raise+0xb4>
    b280:	1184a783          	lw	a5,280(s1)
    b284:	00812423          	sw	s0,8(sp)
    b288:	00050413          	mv	s0,a0
    b28c:	04078263          	beqz	a5,b2d0 <raise+0x6c>
    b290:	00251713          	sll	a4,a0,0x2
    b294:	00e787b3          	add	a5,a5,a4
    b298:	0007a703          	lw	a4,0(a5)
    b29c:	02070a63          	beqz	a4,b2d0 <raise+0x6c>
    b2a0:	00100693          	li	a3,1
    b2a4:	00d70a63          	beq	a4,a3,b2b8 <raise+0x54>
    b2a8:	fff00693          	li	a3,-1
    b2ac:	04d70663          	beq	a4,a3,b2f8 <raise+0x94>
    b2b0:	0007a023          	sw	zero,0(a5)
    b2b4:	000700e7          	jalr	a4
    b2b8:	00812403          	lw	s0,8(sp)
    b2bc:	00000513          	li	a0,0
    b2c0:	00c12083          	lw	ra,12(sp)
    b2c4:	00412483          	lw	s1,4(sp)
    b2c8:	01010113          	add	sp,sp,16
    b2cc:	00008067          	ret
    b2d0:	00048513          	mv	a0,s1
    b2d4:	0b4000ef          	jal	b388 <_getpid_r>
    b2d8:	00040613          	mv	a2,s0
    b2dc:	00812403          	lw	s0,8(sp)
    b2e0:	00c12083          	lw	ra,12(sp)
    b2e4:	00050593          	mv	a1,a0
    b2e8:	00048513          	mv	a0,s1
    b2ec:	00412483          	lw	s1,4(sp)
    b2f0:	01010113          	add	sp,sp,16
    b2f4:	0340006f          	j	b328 <_kill_r>
    b2f8:	00812403          	lw	s0,8(sp)
    b2fc:	00c12083          	lw	ra,12(sp)
    b300:	01600793          	li	a5,22
    b304:	00f4a023          	sw	a5,0(s1)
    b308:	00100513          	li	a0,1
    b30c:	00412483          	lw	s1,4(sp)
    b310:	01010113          	add	sp,sp,16
    b314:	00008067          	ret
    b318:	01600793          	li	a5,22
    b31c:	00f4a023          	sw	a5,0(s1)
    b320:	fff00513          	li	a0,-1
    b324:	f9dff06f          	j	b2c0 <raise+0x5c>

0000b328 <_kill_r>:
    b328:	ff010113          	add	sp,sp,-16
    b32c:	00058713          	mv	a4,a1
    b330:	00812423          	sw	s0,8(sp)
    b334:	00060593          	mv	a1,a2
    b338:	00050413          	mv	s0,a0
    b33c:	00070513          	mv	a0,a4
    b340:	7fff5797          	auipc	a5,0x7fff5
    b344:	3c07ac23          	sw	zero,984(a5) # 80000718 <errno>
    b348:	00112623          	sw	ra,12(sp)
    b34c:	e60f50ef          	jal	9ac <_kill>
    b350:	fff00793          	li	a5,-1
    b354:	00f50a63          	beq	a0,a5,b368 <_kill_r+0x40>
    b358:	00c12083          	lw	ra,12(sp)
    b35c:	00812403          	lw	s0,8(sp)
    b360:	01010113          	add	sp,sp,16
    b364:	00008067          	ret
    b368:	7fff5797          	auipc	a5,0x7fff5
    b36c:	3b07a783          	lw	a5,944(a5) # 80000718 <errno>
    b370:	fe0784e3          	beqz	a5,b358 <_kill_r+0x30>
    b374:	00c12083          	lw	ra,12(sp)
    b378:	00f42023          	sw	a5,0(s0)
    b37c:	00812403          	lw	s0,8(sp)
    b380:	01010113          	add	sp,sp,16
    b384:	00008067          	ret

0000b388 <_getpid_r>:
    b388:	e14f506f          	j	99c <_getpid>

0000b38c <__udivdi3>:
    b38c:	fd010113          	add	sp,sp,-48
    b390:	01312e23          	sw	s3,28(sp)
    b394:	02112623          	sw	ra,44(sp)
    b398:	01612823          	sw	s6,16(sp)
    b39c:	00050993          	mv	s3,a0
    b3a0:	16069663          	bnez	a3,b50c <__udivdi3+0x180>
    b3a4:	02812423          	sw	s0,40(sp)
    b3a8:	01512a23          	sw	s5,20(sp)
    b3ac:	02912223          	sw	s1,36(sp)
    b3b0:	03212023          	sw	s2,32(sp)
    b3b4:	01412c23          	sw	s4,24(sp)
    b3b8:	00060a93          	mv	s5,a2
    b3bc:	00050413          	mv	s0,a0
    b3c0:	1cc5f063          	bgeu	a1,a2,b580 <__udivdi3+0x1f4>
    b3c4:	000107b7          	lui	a5,0x10
    b3c8:	00058493          	mv	s1,a1
    b3cc:	2af66e63          	bltu	a2,a5,b688 <__udivdi3+0x2fc>
    b3d0:	010007b7          	lui	a5,0x1000
    b3d4:	01800713          	li	a4,24
    b3d8:	00f67463          	bgeu	a2,a5,b3e0 <__udivdi3+0x54>
    b3dc:	01000713          	li	a4,16
    b3e0:	00e656b3          	srl	a3,a2,a4
    b3e4:	00004797          	auipc	a5,0x4
    b3e8:	2ec78793          	add	a5,a5,748 # f6d0 <__clz_tab>
    b3ec:	00d787b3          	add	a5,a5,a3
    b3f0:	0007c783          	lbu	a5,0(a5)
    b3f4:	02000693          	li	a3,32
    b3f8:	00e787b3          	add	a5,a5,a4
    b3fc:	40f68733          	sub	a4,a3,a5
    b400:	00f68c63          	beq	a3,a5,b418 <__udivdi3+0x8c>
    b404:	00e594b3          	sll	s1,a1,a4
    b408:	00f9d7b3          	srl	a5,s3,a5
    b40c:	00e61ab3          	sll	s5,a2,a4
    b410:	0097e4b3          	or	s1,a5,s1
    b414:	00e99433          	sll	s0,s3,a4
    b418:	010ada13          	srl	s4,s5,0x10
    b41c:	000a0593          	mv	a1,s4
    b420:	00048513          	mv	a0,s1
    b424:	010a9b13          	sll	s6,s5,0x10
    b428:	7fc030ef          	jal	ec24 <__hidden___udivsi3>
    b42c:	010b5b13          	srl	s6,s6,0x10
    b430:	00050593          	mv	a1,a0
    b434:	00050913          	mv	s2,a0
    b438:	000b0513          	mv	a0,s6
    b43c:	724030ef          	jal	eb60 <__mulsi3>
    b440:	00050793          	mv	a5,a0
    b444:	000a0593          	mv	a1,s4
    b448:	00048513          	mv	a0,s1
    b44c:	00078493          	mv	s1,a5
    b450:	01d030ef          	jal	ec6c <__umodsi3>
    b454:	01051513          	sll	a0,a0,0x10
    b458:	01045793          	srl	a5,s0,0x10
    b45c:	00a7e7b3          	or	a5,a5,a0
    b460:	0097fc63          	bgeu	a5,s1,b478 <__udivdi3+0xec>
    b464:	00fa87b3          	add	a5,s5,a5
    b468:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0x2a7>
    b46c:	0157e463          	bltu	a5,s5,b474 <__udivdi3+0xe8>
    b470:	5a97e863          	bltu	a5,s1,ba20 <__udivdi3+0x694>
    b474:	00070913          	mv	s2,a4
    b478:	409784b3          	sub	s1,a5,s1
    b47c:	000a0593          	mv	a1,s4
    b480:	00048513          	mv	a0,s1
    b484:	7a0030ef          	jal	ec24 <__hidden___udivsi3>
    b488:	00050593          	mv	a1,a0
    b48c:	00050993          	mv	s3,a0
    b490:	000b0513          	mv	a0,s6
    b494:	6cc030ef          	jal	eb60 <__mulsi3>
    b498:	00050793          	mv	a5,a0
    b49c:	000a0593          	mv	a1,s4
    b4a0:	00048513          	mv	a0,s1
    b4a4:	01041413          	sll	s0,s0,0x10
    b4a8:	00078493          	mv	s1,a5
    b4ac:	7c0030ef          	jal	ec6c <__umodsi3>
    b4b0:	01051513          	sll	a0,a0,0x10
    b4b4:	01045413          	srl	s0,s0,0x10
    b4b8:	00a46433          	or	s0,s0,a0
    b4bc:	00947c63          	bgeu	s0,s1,b4d4 <__udivdi3+0x148>
    b4c0:	008a8433          	add	s0,s5,s0
    b4c4:	fff98793          	add	a5,s3,-1
    b4c8:	4d546e63          	bltu	s0,s5,b9a4 <__udivdi3+0x618>
    b4cc:	ffe98993          	add	s3,s3,-2
    b4d0:	4c947a63          	bgeu	s0,s1,b9a4 <__udivdi3+0x618>
    b4d4:	01091613          	sll	a2,s2,0x10
    b4d8:	01366533          	or	a0,a2,s3
    b4dc:	00000b13          	li	s6,0
    b4e0:	02812403          	lw	s0,40(sp)
    b4e4:	02c12083          	lw	ra,44(sp)
    b4e8:	02412483          	lw	s1,36(sp)
    b4ec:	02012903          	lw	s2,32(sp)
    b4f0:	01812a03          	lw	s4,24(sp)
    b4f4:	01412a83          	lw	s5,20(sp)
    b4f8:	01c12983          	lw	s3,28(sp)
    b4fc:	000b0593          	mv	a1,s6
    b500:	01012b03          	lw	s6,16(sp)
    b504:	03010113          	add	sp,sp,48
    b508:	00008067          	ret
    b50c:	02d5f263          	bgeu	a1,a3,b530 <__udivdi3+0x1a4>
    b510:	00000b13          	li	s6,0
    b514:	00000513          	li	a0,0
    b518:	02c12083          	lw	ra,44(sp)
    b51c:	01c12983          	lw	s3,28(sp)
    b520:	000b0593          	mv	a1,s6
    b524:	01012b03          	lw	s6,16(sp)
    b528:	03010113          	add	sp,sp,48
    b52c:	00008067          	ret
    b530:	000107b7          	lui	a5,0x10
    b534:	26f6ee63          	bltu	a3,a5,b7b0 <__udivdi3+0x424>
    b538:	01000737          	lui	a4,0x1000
    b53c:	01800793          	li	a5,24
    b540:	00e6f463          	bgeu	a3,a4,b548 <__udivdi3+0x1bc>
    b544:	01000793          	li	a5,16
    b548:	00f6d533          	srl	a0,a3,a5
    b54c:	00004717          	auipc	a4,0x4
    b550:	18470713          	add	a4,a4,388 # f6d0 <__clz_tab>
    b554:	00a70733          	add	a4,a4,a0
    b558:	00074703          	lbu	a4,0(a4)
    b55c:	02000513          	li	a0,32
    b560:	00f70733          	add	a4,a4,a5
    b564:	40e50b33          	sub	s6,a0,a4
    b568:	26e51c63          	bne	a0,a4,b7e0 <__udivdi3+0x454>
    b56c:	46b6ee63          	bltu	a3,a1,b9e8 <__udivdi3+0x65c>
    b570:	00c9b533          	sltu	a0,s3,a2
    b574:	00153513          	seqz	a0,a0
    b578:	00000b13          	li	s6,0
    b57c:	f9dff06f          	j	b518 <__udivdi3+0x18c>
    b580:	10060c63          	beqz	a2,b698 <__udivdi3+0x30c>
    b584:	000107b7          	lui	a5,0x10
    b588:	44f67663          	bgeu	a2,a5,b9d4 <__udivdi3+0x648>
    b58c:	10063713          	sltiu	a4,a2,256
    b590:	00173713          	seqz	a4,a4
    b594:	00371713          	sll	a4,a4,0x3
    b598:	00e656b3          	srl	a3,a2,a4
    b59c:	00004797          	auipc	a5,0x4
    b5a0:	13478793          	add	a5,a5,308 # f6d0 <__clz_tab>
    b5a4:	00d787b3          	add	a5,a5,a3
    b5a8:	0007c483          	lbu	s1,0(a5)
    b5ac:	02000793          	li	a5,32
    b5b0:	00e484b3          	add	s1,s1,a4
    b5b4:	40978733          	sub	a4,a5,s1
    b5b8:	10979463          	bne	a5,s1,b6c0 <__udivdi3+0x334>
    b5bc:	01061a13          	sll	s4,a2,0x10
    b5c0:	40c584b3          	sub	s1,a1,a2
    b5c4:	01065913          	srl	s2,a2,0x10
    b5c8:	010a5a13          	srl	s4,s4,0x10
    b5cc:	00100b13          	li	s6,1
    b5d0:	00090593          	mv	a1,s2
    b5d4:	00048513          	mv	a0,s1
    b5d8:	64c030ef          	jal	ec24 <__hidden___udivsi3>
    b5dc:	000a0593          	mv	a1,s4
    b5e0:	00050993          	mv	s3,a0
    b5e4:	57c030ef          	jal	eb60 <__mulsi3>
    b5e8:	00050793          	mv	a5,a0
    b5ec:	00090593          	mv	a1,s2
    b5f0:	00048513          	mv	a0,s1
    b5f4:	00078493          	mv	s1,a5
    b5f8:	674030ef          	jal	ec6c <__umodsi3>
    b5fc:	01051513          	sll	a0,a0,0x10
    b600:	01045793          	srl	a5,s0,0x10
    b604:	00a7e7b3          	or	a5,a5,a0
    b608:	0097fc63          	bgeu	a5,s1,b620 <__udivdi3+0x294>
    b60c:	00fa87b3          	add	a5,s5,a5
    b610:	fff98713          	add	a4,s3,-1
    b614:	0157e463          	bltu	a5,s5,b61c <__udivdi3+0x290>
    b618:	3e97ee63          	bltu	a5,s1,ba14 <__udivdi3+0x688>
    b61c:	00070993          	mv	s3,a4
    b620:	409784b3          	sub	s1,a5,s1
    b624:	00090593          	mv	a1,s2
    b628:	00048513          	mv	a0,s1
    b62c:	5f8030ef          	jal	ec24 <__hidden___udivsi3>
    b630:	000a0593          	mv	a1,s4
    b634:	00050a13          	mv	s4,a0
    b638:	528030ef          	jal	eb60 <__mulsi3>
    b63c:	00050793          	mv	a5,a0
    b640:	00090593          	mv	a1,s2
    b644:	00048513          	mv	a0,s1
    b648:	01041413          	sll	s0,s0,0x10
    b64c:	00078493          	mv	s1,a5
    b650:	61c030ef          	jal	ec6c <__umodsi3>
    b654:	01051513          	sll	a0,a0,0x10
    b658:	01045413          	srl	s0,s0,0x10
    b65c:	00a46433          	or	s0,s0,a0
    b660:	00947e63          	bgeu	s0,s1,b67c <__udivdi3+0x2f0>
    b664:	008a8433          	add	s0,s5,s0
    b668:	fffa0793          	add	a5,s4,-1
    b66c:	01546663          	bltu	s0,s5,b678 <__udivdi3+0x2ec>
    b670:	ffea0a13          	add	s4,s4,-2
    b674:	00946463          	bltu	s0,s1,b67c <__udivdi3+0x2f0>
    b678:	00078a13          	mv	s4,a5
    b67c:	01099613          	sll	a2,s3,0x10
    b680:	01466533          	or	a0,a2,s4
    b684:	e5dff06f          	j	b4e0 <__udivdi3+0x154>
    b688:	10063713          	sltiu	a4,a2,256
    b68c:	00173713          	seqz	a4,a4
    b690:	00371713          	sll	a4,a4,0x3
    b694:	d4dff06f          	j	b3e0 <__udivdi3+0x54>
    b698:	00000693          	li	a3,0
    b69c:	00004797          	auipc	a5,0x4
    b6a0:	03478793          	add	a5,a5,52 # f6d0 <__clz_tab>
    b6a4:	00d787b3          	add	a5,a5,a3
    b6a8:	0007c483          	lbu	s1,0(a5)
    b6ac:	00000713          	li	a4,0
    b6b0:	02000793          	li	a5,32
    b6b4:	00e484b3          	add	s1,s1,a4
    b6b8:	40978733          	sub	a4,a5,s1
    b6bc:	f09780e3          	beq	a5,s1,b5bc <__udivdi3+0x230>
    b6c0:	00e61ab3          	sll	s5,a2,a4
    b6c4:	01712623          	sw	s7,12(sp)
    b6c8:	010ad913          	srl	s2,s5,0x10
    b6cc:	0095dbb3          	srl	s7,a1,s1
    b6d0:	00e597b3          	sll	a5,a1,a4
    b6d4:	0099d4b3          	srl	s1,s3,s1
    b6d8:	00090593          	mv	a1,s2
    b6dc:	000b8513          	mv	a0,s7
    b6e0:	010a9a13          	sll	s4,s5,0x10
    b6e4:	00f4e4b3          	or	s1,s1,a5
    b6e8:	00e99433          	sll	s0,s3,a4
    b6ec:	010a5a13          	srl	s4,s4,0x10
    b6f0:	534030ef          	jal	ec24 <__hidden___udivsi3>
    b6f4:	00050593          	mv	a1,a0
    b6f8:	00050b13          	mv	s6,a0
    b6fc:	000a0513          	mv	a0,s4
    b700:	460030ef          	jal	eb60 <__mulsi3>
    b704:	00050993          	mv	s3,a0
    b708:	00090593          	mv	a1,s2
    b70c:	000b8513          	mv	a0,s7
    b710:	55c030ef          	jal	ec6c <__umodsi3>
    b714:	01051513          	sll	a0,a0,0x10
    b718:	0104d793          	srl	a5,s1,0x10
    b71c:	00a7e7b3          	or	a5,a5,a0
    b720:	0137fe63          	bgeu	a5,s3,b73c <__udivdi3+0x3b0>
    b724:	00fa87b3          	add	a5,s5,a5
    b728:	fffb0713          	add	a4,s6,-1
    b72c:	2d57ec63          	bltu	a5,s5,ba04 <__udivdi3+0x678>
    b730:	2d37fa63          	bgeu	a5,s3,ba04 <__udivdi3+0x678>
    b734:	ffeb0b13          	add	s6,s6,-2
    b738:	015787b3          	add	a5,a5,s5
    b73c:	413789b3          	sub	s3,a5,s3
    b740:	00090593          	mv	a1,s2
    b744:	00098513          	mv	a0,s3
    b748:	4dc030ef          	jal	ec24 <__hidden___udivsi3>
    b74c:	00050593          	mv	a1,a0
    b750:	00050b93          	mv	s7,a0
    b754:	000a0513          	mv	a0,s4
    b758:	408030ef          	jal	eb60 <__mulsi3>
    b75c:	00050793          	mv	a5,a0
    b760:	00090593          	mv	a1,s2
    b764:	00098513          	mv	a0,s3
    b768:	01049493          	sll	s1,s1,0x10
    b76c:	00078993          	mv	s3,a5
    b770:	4fc030ef          	jal	ec6c <__umodsi3>
    b774:	01051513          	sll	a0,a0,0x10
    b778:	0104d493          	srl	s1,s1,0x10
    b77c:	00a4e4b3          	or	s1,s1,a0
    b780:	0134fe63          	bgeu	s1,s3,b79c <__udivdi3+0x410>
    b784:	009a84b3          	add	s1,s5,s1
    b788:	fffb8793          	add	a5,s7,-1
    b78c:	2754e463          	bltu	s1,s5,b9f4 <__udivdi3+0x668>
    b790:	2734f263          	bgeu	s1,s3,b9f4 <__udivdi3+0x668>
    b794:	ffeb8b93          	add	s7,s7,-2
    b798:	015484b3          	add	s1,s1,s5
    b79c:	010b1b13          	sll	s6,s6,0x10
    b7a0:	017b6b33          	or	s6,s6,s7
    b7a4:	413484b3          	sub	s1,s1,s3
    b7a8:	00c12b83          	lw	s7,12(sp)
    b7ac:	e25ff06f          	j	b5d0 <__udivdi3+0x244>
    b7b0:	1006b793          	sltiu	a5,a3,256
    b7b4:	0017b793          	seqz	a5,a5
    b7b8:	00379793          	sll	a5,a5,0x3
    b7bc:	00f6d533          	srl	a0,a3,a5
    b7c0:	00004717          	auipc	a4,0x4
    b7c4:	f1070713          	add	a4,a4,-240 # f6d0 <__clz_tab>
    b7c8:	00a70733          	add	a4,a4,a0
    b7cc:	00074703          	lbu	a4,0(a4)
    b7d0:	02000513          	li	a0,32
    b7d4:	00f70733          	add	a4,a4,a5
    b7d8:	40e50b33          	sub	s6,a0,a4
    b7dc:	d8e508e3          	beq	a0,a4,b56c <__udivdi3+0x1e0>
    b7e0:	016696b3          	sll	a3,a3,s6
    b7e4:	01912223          	sw	s9,4(sp)
    b7e8:	00e65cb3          	srl	s9,a2,a4
    b7ec:	00dcecb3          	or	s9,s9,a3
    b7f0:	01512a23          	sw	s5,20(sp)
    b7f4:	01712623          	sw	s7,12(sp)
    b7f8:	010cda93          	srl	s5,s9,0x10
    b7fc:	00e5dbb3          	srl	s7,a1,a4
    b800:	016597b3          	sll	a5,a1,s6
    b804:	00e9d733          	srl	a4,s3,a4
    b808:	01812423          	sw	s8,8(sp)
    b80c:	000a8593          	mv	a1,s5
    b810:	000b8513          	mv	a0,s7
    b814:	010c9c13          	sll	s8,s9,0x10
    b818:	02812423          	sw	s0,40(sp)
    b81c:	02912223          	sw	s1,36(sp)
    b820:	03212023          	sw	s2,32(sp)
    b824:	00f764b3          	or	s1,a4,a5
    b828:	01661933          	sll	s2,a2,s6
    b82c:	01412c23          	sw	s4,24(sp)
    b830:	010c5c13          	srl	s8,s8,0x10
    b834:	3f0030ef          	jal	ec24 <__hidden___udivsi3>
    b838:	00050593          	mv	a1,a0
    b83c:	00050413          	mv	s0,a0
    b840:	000c0513          	mv	a0,s8
    b844:	31c030ef          	jal	eb60 <__mulsi3>
    b848:	00050a13          	mv	s4,a0
    b84c:	000a8593          	mv	a1,s5
    b850:	000b8513          	mv	a0,s7
    b854:	418030ef          	jal	ec6c <__umodsi3>
    b858:	01051513          	sll	a0,a0,0x10
    b85c:	0104d793          	srl	a5,s1,0x10
    b860:	00a7e7b3          	or	a5,a5,a0
    b864:	0147fe63          	bgeu	a5,s4,b880 <__udivdi3+0x4f4>
    b868:	00fc87b3          	add	a5,s9,a5
    b86c:	fff40713          	add	a4,s0,-1
    b870:	1997ee63          	bltu	a5,s9,ba0c <__udivdi3+0x680>
    b874:	1947fc63          	bgeu	a5,s4,ba0c <__udivdi3+0x680>
    b878:	ffe40413          	add	s0,s0,-2
    b87c:	019787b3          	add	a5,a5,s9
    b880:	41478a33          	sub	s4,a5,s4
    b884:	000a8593          	mv	a1,s5
    b888:	000a0513          	mv	a0,s4
    b88c:	398030ef          	jal	ec24 <__hidden___udivsi3>
    b890:	00050593          	mv	a1,a0
    b894:	00050b93          	mv	s7,a0
    b898:	000c0513          	mv	a0,s8
    b89c:	2c4030ef          	jal	eb60 <__mulsi3>
    b8a0:	00050793          	mv	a5,a0
    b8a4:	000a8593          	mv	a1,s5
    b8a8:	000a0513          	mv	a0,s4
    b8ac:	00078a13          	mv	s4,a5
    b8b0:	3bc030ef          	jal	ec6c <__umodsi3>
    b8b4:	01049713          	sll	a4,s1,0x10
    b8b8:	01051513          	sll	a0,a0,0x10
    b8bc:	01075713          	srl	a4,a4,0x10
    b8c0:	00a76733          	or	a4,a4,a0
    b8c4:	01477e63          	bgeu	a4,s4,b8e0 <__udivdi3+0x554>
    b8c8:	00ec8733          	add	a4,s9,a4
    b8cc:	fffb8793          	add	a5,s7,-1
    b8d0:	13976663          	bltu	a4,s9,b9fc <__udivdi3+0x670>
    b8d4:	13477463          	bgeu	a4,s4,b9fc <__udivdi3+0x670>
    b8d8:	ffeb8b93          	add	s7,s7,-2
    b8dc:	01970733          	add	a4,a4,s9
    b8e0:	00010e37          	lui	t3,0x10
    b8e4:	01041413          	sll	s0,s0,0x10
    b8e8:	01746433          	or	s0,s0,s7
    b8ec:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    b8f0:	00f47833          	and	a6,s0,a5
    b8f4:	00f977b3          	and	a5,s2,a5
    b8f8:	41470733          	sub	a4,a4,s4
    b8fc:	01045e93          	srl	t4,s0,0x10
    b900:	01095913          	srl	s2,s2,0x10
    b904:	00080513          	mv	a0,a6
    b908:	00078593          	mv	a1,a5
    b90c:	254030ef          	jal	eb60 <__mulsi3>
    b910:	00050313          	mv	t1,a0
    b914:	00090593          	mv	a1,s2
    b918:	00080513          	mv	a0,a6
    b91c:	244030ef          	jal	eb60 <__mulsi3>
    b920:	00050813          	mv	a6,a0
    b924:	00078593          	mv	a1,a5
    b928:	000e8513          	mv	a0,t4
    b92c:	234030ef          	jal	eb60 <__mulsi3>
    b930:	00050893          	mv	a7,a0
    b934:	00090593          	mv	a1,s2
    b938:	000e8513          	mv	a0,t4
    b93c:	224030ef          	jal	eb60 <__mulsi3>
    b940:	01035793          	srl	a5,t1,0x10
    b944:	01180833          	add	a6,a6,a7
    b948:	010787b3          	add	a5,a5,a6
    b94c:	0117f463          	bgeu	a5,a7,b954 <__udivdi3+0x5c8>
    b950:	01c50533          	add	a0,a0,t3
    b954:	0107d693          	srl	a3,a5,0x10
    b958:	00a686b3          	add	a3,a3,a0
    b95c:	06d76863          	bltu	a4,a3,b9cc <__udivdi3+0x640>
    b960:	04d70663          	beq	a4,a3,b9ac <__udivdi3+0x620>
    b964:	00040513          	mv	a0,s0
    b968:	02812403          	lw	s0,40(sp)
    b96c:	02c12083          	lw	ra,44(sp)
    b970:	00000b13          	li	s6,0
    b974:	02412483          	lw	s1,36(sp)
    b978:	02012903          	lw	s2,32(sp)
    b97c:	01812a03          	lw	s4,24(sp)
    b980:	01412a83          	lw	s5,20(sp)
    b984:	00c12b83          	lw	s7,12(sp)
    b988:	00812c03          	lw	s8,8(sp)
    b98c:	00412c83          	lw	s9,4(sp)
    b990:	01c12983          	lw	s3,28(sp)
    b994:	000b0593          	mv	a1,s6
    b998:	01012b03          	lw	s6,16(sp)
    b99c:	03010113          	add	sp,sp,48
    b9a0:	00008067          	ret
    b9a4:	00078993          	mv	s3,a5
    b9a8:	b2dff06f          	j	b4d4 <__udivdi3+0x148>
    b9ac:	00010737          	lui	a4,0x10
    b9b0:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    b9b4:	00e7f7b3          	and	a5,a5,a4
    b9b8:	01079793          	sll	a5,a5,0x10
    b9bc:	00e37333          	and	t1,t1,a4
    b9c0:	01699533          	sll	a0,s3,s6
    b9c4:	006787b3          	add	a5,a5,t1
    b9c8:	f8f57ee3          	bgeu	a0,a5,b964 <__udivdi3+0x5d8>
    b9cc:	fff40513          	add	a0,s0,-1
    b9d0:	f99ff06f          	j	b968 <__udivdi3+0x5dc>
    b9d4:	010007b7          	lui	a5,0x1000
    b9d8:	04f67a63          	bgeu	a2,a5,ba2c <__udivdi3+0x6a0>
    b9dc:	01065693          	srl	a3,a2,0x10
    b9e0:	01000713          	li	a4,16
    b9e4:	bb9ff06f          	j	b59c <__udivdi3+0x210>
    b9e8:	00000b13          	li	s6,0
    b9ec:	00100513          	li	a0,1
    b9f0:	b29ff06f          	j	b518 <__udivdi3+0x18c>
    b9f4:	00078b93          	mv	s7,a5
    b9f8:	da5ff06f          	j	b79c <__udivdi3+0x410>
    b9fc:	00078b93          	mv	s7,a5
    ba00:	ee1ff06f          	j	b8e0 <__udivdi3+0x554>
    ba04:	00070b13          	mv	s6,a4
    ba08:	d35ff06f          	j	b73c <__udivdi3+0x3b0>
    ba0c:	00070413          	mv	s0,a4
    ba10:	e71ff06f          	j	b880 <__udivdi3+0x4f4>
    ba14:	ffe98993          	add	s3,s3,-2
    ba18:	015787b3          	add	a5,a5,s5
    ba1c:	c05ff06f          	j	b620 <__udivdi3+0x294>
    ba20:	ffe90913          	add	s2,s2,-2
    ba24:	015787b3          	add	a5,a5,s5
    ba28:	a51ff06f          	j	b478 <__udivdi3+0xec>
    ba2c:	01865693          	srl	a3,a2,0x18
    ba30:	01800713          	li	a4,24
    ba34:	b69ff06f          	j	b59c <__udivdi3+0x210>

0000ba38 <__umoddi3>:
    ba38:	fd010113          	add	sp,sp,-48
    ba3c:	02112623          	sw	ra,44(sp)
    ba40:	00050793          	mv	a5,a0
    ba44:	14069663          	bnez	a3,bb90 <__umoddi3+0x158>
    ba48:	03212023          	sw	s2,32(sp)
    ba4c:	01412c23          	sw	s4,24(sp)
    ba50:	02812423          	sw	s0,40(sp)
    ba54:	02912223          	sw	s1,36(sp)
    ba58:	01312e23          	sw	s3,28(sp)
    ba5c:	01512a23          	sw	s5,20(sp)
    ba60:	00060a13          	mv	s4,a2
    ba64:	00050913          	mv	s2,a0
    ba68:	1ac5f663          	bgeu	a1,a2,bc14 <__umoddi3+0x1dc>
    ba6c:	01612823          	sw	s6,16(sp)
    ba70:	00010737          	lui	a4,0x10
    ba74:	00058993          	mv	s3,a1
    ba78:	28e66063          	bltu	a2,a4,bcf8 <__umoddi3+0x2c0>
    ba7c:	01000737          	lui	a4,0x1000
    ba80:	01800693          	li	a3,24
    ba84:	00e67463          	bgeu	a2,a4,ba8c <__umoddi3+0x54>
    ba88:	01000693          	li	a3,16
    ba8c:	00d65533          	srl	a0,a2,a3
    ba90:	00004717          	auipc	a4,0x4
    ba94:	c4070713          	add	a4,a4,-960 # f6d0 <__clz_tab>
    ba98:	00a70733          	add	a4,a4,a0
    ba9c:	00074703          	lbu	a4,0(a4)
    baa0:	02000513          	li	a0,32
    baa4:	00d70733          	add	a4,a4,a3
    baa8:	40e504b3          	sub	s1,a0,a4
    baac:	00e50c63          	beq	a0,a4,bac4 <__umoddi3+0x8c>
    bab0:	009599b3          	sll	s3,a1,s1
    bab4:	00e7d733          	srl	a4,a5,a4
    bab8:	00961a33          	sll	s4,a2,s1
    babc:	013769b3          	or	s3,a4,s3
    bac0:	00979933          	sll	s2,a5,s1
    bac4:	010a5a93          	srl	s5,s4,0x10
    bac8:	000a8593          	mv	a1,s5
    bacc:	00098513          	mv	a0,s3
    bad0:	010a1b13          	sll	s6,s4,0x10
    bad4:	150030ef          	jal	ec24 <__hidden___udivsi3>
    bad8:	010b5b13          	srl	s6,s6,0x10
    badc:	000b0593          	mv	a1,s6
    bae0:	080030ef          	jal	eb60 <__mulsi3>
    bae4:	00050413          	mv	s0,a0
    bae8:	000a8593          	mv	a1,s5
    baec:	00098513          	mv	a0,s3
    baf0:	17c030ef          	jal	ec6c <__umodsi3>
    baf4:	01051513          	sll	a0,a0,0x10
    baf8:	01095793          	srl	a5,s2,0x10
    bafc:	00a7e7b3          	or	a5,a5,a0
    bb00:	0087f863          	bgeu	a5,s0,bb10 <__umoddi3+0xd8>
    bb04:	00fa07b3          	add	a5,s4,a5
    bb08:	0147e463          	bltu	a5,s4,bb10 <__umoddi3+0xd8>
    bb0c:	5687e863          	bltu	a5,s0,c07c <__umoddi3+0x644>
    bb10:	40878433          	sub	s0,a5,s0
    bb14:	000a8593          	mv	a1,s5
    bb18:	00040513          	mv	a0,s0
    bb1c:	108030ef          	jal	ec24 <__hidden___udivsi3>
    bb20:	000b0593          	mv	a1,s6
    bb24:	03c030ef          	jal	eb60 <__mulsi3>
    bb28:	00050793          	mv	a5,a0
    bb2c:	000a8593          	mv	a1,s5
    bb30:	00040513          	mv	a0,s0
    bb34:	00078413          	mv	s0,a5
    bb38:	134030ef          	jal	ec6c <__umodsi3>
    bb3c:	01091793          	sll	a5,s2,0x10
    bb40:	01051513          	sll	a0,a0,0x10
    bb44:	0107d793          	srl	a5,a5,0x10
    bb48:	00a7e7b3          	or	a5,a5,a0
    bb4c:	0087f863          	bgeu	a5,s0,bb5c <__umoddi3+0x124>
    bb50:	00fa07b3          	add	a5,s4,a5
    bb54:	0147e463          	bltu	a5,s4,bb5c <__umoddi3+0x124>
    bb58:	5087ea63          	bltu	a5,s0,c06c <__umoddi3+0x634>
    bb5c:	01012b03          	lw	s6,16(sp)
    bb60:	408787b3          	sub	a5,a5,s0
    bb64:	0097d533          	srl	a0,a5,s1
    bb68:	02812403          	lw	s0,40(sp)
    bb6c:	02412483          	lw	s1,36(sp)
    bb70:	02012903          	lw	s2,32(sp)
    bb74:	01c12983          	lw	s3,28(sp)
    bb78:	01812a03          	lw	s4,24(sp)
    bb7c:	01412a83          	lw	s5,20(sp)
    bb80:	00000593          	li	a1,0
    bb84:	02c12083          	lw	ra,44(sp)
    bb88:	03010113          	add	sp,sp,48
    bb8c:	00008067          	ret
    bb90:	00050893          	mv	a7,a0
    bb94:	fed5e8e3          	bltu	a1,a3,bb84 <__umoddi3+0x14c>
    bb98:	03212023          	sw	s2,32(sp)
    bb9c:	01312e23          	sw	s3,28(sp)
    bba0:	00010737          	lui	a4,0x10
    bba4:	00058813          	mv	a6,a1
    bba8:	24e6ec63          	bltu	a3,a4,be00 <__umoddi3+0x3c8>
    bbac:	01000737          	lui	a4,0x1000
    bbb0:	01800513          	li	a0,24
    bbb4:	00e6f463          	bgeu	a3,a4,bbbc <__umoddi3+0x184>
    bbb8:	01000513          	li	a0,16
    bbbc:	00a6d333          	srl	t1,a3,a0
    bbc0:	00004717          	auipc	a4,0x4
    bbc4:	b1070713          	add	a4,a4,-1264 # f6d0 <__clz_tab>
    bbc8:	00670733          	add	a4,a4,t1
    bbcc:	00074703          	lbu	a4,0(a4)
    bbd0:	02000313          	li	t1,32
    bbd4:	00a709b3          	add	s3,a4,a0
    bbd8:	41330933          	sub	s2,t1,s3
    bbdc:	25331a63          	bne	t1,s3,be30 <__umoddi3+0x3f8>
    bbe0:	00b6e463          	bltu	a3,a1,bbe8 <__umoddi3+0x1b0>
    bbe4:	00c7ea63          	bltu	a5,a2,bbf8 <__umoddi3+0x1c0>
    bbe8:	40c788b3          	sub	a7,a5,a2
    bbec:	40d586b3          	sub	a3,a1,a3
    bbf0:	0117b833          	sltu	a6,a5,a7
    bbf4:	41068833          	sub	a6,a3,a6
    bbf8:	02c12083          	lw	ra,44(sp)
    bbfc:	02012903          	lw	s2,32(sp)
    bc00:	01c12983          	lw	s3,28(sp)
    bc04:	00088513          	mv	a0,a7
    bc08:	00080593          	mv	a1,a6
    bc0c:	03010113          	add	sp,sp,48
    bc10:	00008067          	ret
    bc14:	0e060a63          	beqz	a2,bd08 <__umoddi3+0x2d0>
    bc18:	00010737          	lui	a4,0x10
    bc1c:	42e67663          	bgeu	a2,a4,c048 <__umoddi3+0x610>
    bc20:	10063693          	sltiu	a3,a2,256
    bc24:	0016b693          	seqz	a3,a3
    bc28:	00369693          	sll	a3,a3,0x3
    bc2c:	00d65533          	srl	a0,a2,a3
    bc30:	00004717          	auipc	a4,0x4
    bc34:	aa070713          	add	a4,a4,-1376 # f6d0 <__clz_tab>
    bc38:	00a70733          	add	a4,a4,a0
    bc3c:	00074983          	lbu	s3,0(a4)
    bc40:	02000713          	li	a4,32
    bc44:	00d989b3          	add	s3,s3,a3
    bc48:	413704b3          	sub	s1,a4,s3
    bc4c:	0f371263          	bne	a4,s3,bd30 <__umoddi3+0x2f8>
    bc50:	01061413          	sll	s0,a2,0x10
    bc54:	40c589b3          	sub	s3,a1,a2
    bc58:	01065a93          	srl	s5,a2,0x10
    bc5c:	01045413          	srl	s0,s0,0x10
    bc60:	000a8593          	mv	a1,s5
    bc64:	00098513          	mv	a0,s3
    bc68:	7bd020ef          	jal	ec24 <__hidden___udivsi3>
    bc6c:	00040593          	mv	a1,s0
    bc70:	6f1020ef          	jal	eb60 <__mulsi3>
    bc74:	00050793          	mv	a5,a0
    bc78:	000a8593          	mv	a1,s5
    bc7c:	00098513          	mv	a0,s3
    bc80:	00078993          	mv	s3,a5
    bc84:	7e9020ef          	jal	ec6c <__umodsi3>
    bc88:	01051513          	sll	a0,a0,0x10
    bc8c:	01095793          	srl	a5,s2,0x10
    bc90:	00a7e7b3          	or	a5,a5,a0
    bc94:	0137f863          	bgeu	a5,s3,bca4 <__umoddi3+0x26c>
    bc98:	00fa07b3          	add	a5,s4,a5
    bc9c:	0147e463          	bltu	a5,s4,bca4 <__umoddi3+0x26c>
    bca0:	3d37ea63          	bltu	a5,s3,c074 <__umoddi3+0x63c>
    bca4:	413789b3          	sub	s3,a5,s3
    bca8:	000a8593          	mv	a1,s5
    bcac:	00098513          	mv	a0,s3
    bcb0:	775020ef          	jal	ec24 <__hidden___udivsi3>
    bcb4:	00040593          	mv	a1,s0
    bcb8:	6a9020ef          	jal	eb60 <__mulsi3>
    bcbc:	00050413          	mv	s0,a0
    bcc0:	000a8593          	mv	a1,s5
    bcc4:	00098513          	mv	a0,s3
    bcc8:	7a5020ef          	jal	ec6c <__umodsi3>
    bccc:	01091913          	sll	s2,s2,0x10
    bcd0:	01051793          	sll	a5,a0,0x10
    bcd4:	01095913          	srl	s2,s2,0x10
    bcd8:	00f967b3          	or	a5,s2,a5
    bcdc:	0087fa63          	bgeu	a5,s0,bcf0 <__umoddi3+0x2b8>
    bce0:	00fa07b3          	add	a5,s4,a5
    bce4:	0147e663          	bltu	a5,s4,bcf0 <__umoddi3+0x2b8>
    bce8:	0087f463          	bgeu	a5,s0,bcf0 <__umoddi3+0x2b8>
    bcec:	014787b3          	add	a5,a5,s4
    bcf0:	408787b3          	sub	a5,a5,s0
    bcf4:	e71ff06f          	j	bb64 <__umoddi3+0x12c>
    bcf8:	10063693          	sltiu	a3,a2,256
    bcfc:	0016b693          	seqz	a3,a3
    bd00:	00369693          	sll	a3,a3,0x3
    bd04:	d89ff06f          	j	ba8c <__umoddi3+0x54>
    bd08:	00000513          	li	a0,0
    bd0c:	00004717          	auipc	a4,0x4
    bd10:	9c470713          	add	a4,a4,-1596 # f6d0 <__clz_tab>
    bd14:	00a70733          	add	a4,a4,a0
    bd18:	00074983          	lbu	s3,0(a4)
    bd1c:	00000693          	li	a3,0
    bd20:	02000713          	li	a4,32
    bd24:	00d989b3          	add	s3,s3,a3
    bd28:	413704b3          	sub	s1,a4,s3
    bd2c:	f33702e3          	beq	a4,s3,bc50 <__umoddi3+0x218>
    bd30:	00961a33          	sll	s4,a2,s1
    bd34:	01712623          	sw	s7,12(sp)
    bd38:	010a5a93          	srl	s5,s4,0x10
    bd3c:	0135dbb3          	srl	s7,a1,s3
    bd40:	00959733          	sll	a4,a1,s1
    bd44:	0137d9b3          	srl	s3,a5,s3
    bd48:	000a8593          	mv	a1,s5
    bd4c:	000b8513          	mv	a0,s7
    bd50:	010a1413          	sll	s0,s4,0x10
    bd54:	00e9e9b3          	or	s3,s3,a4
    bd58:	00979933          	sll	s2,a5,s1
    bd5c:	01612823          	sw	s6,16(sp)
    bd60:	01045413          	srl	s0,s0,0x10
    bd64:	6c1020ef          	jal	ec24 <__hidden___udivsi3>
    bd68:	00040593          	mv	a1,s0
    bd6c:	5f5020ef          	jal	eb60 <__mulsi3>
    bd70:	00050b13          	mv	s6,a0
    bd74:	000a8593          	mv	a1,s5
    bd78:	000b8513          	mv	a0,s7
    bd7c:	6f1020ef          	jal	ec6c <__umodsi3>
    bd80:	01051513          	sll	a0,a0,0x10
    bd84:	0109d793          	srl	a5,s3,0x10
    bd88:	00a7e7b3          	or	a5,a5,a0
    bd8c:	0167fa63          	bgeu	a5,s6,bda0 <__umoddi3+0x368>
    bd90:	00fa07b3          	add	a5,s4,a5
    bd94:	0147e663          	bltu	a5,s4,bda0 <__umoddi3+0x368>
    bd98:	0167f463          	bgeu	a5,s6,bda0 <__umoddi3+0x368>
    bd9c:	014787b3          	add	a5,a5,s4
    bda0:	41678b33          	sub	s6,a5,s6
    bda4:	000a8593          	mv	a1,s5
    bda8:	000b0513          	mv	a0,s6
    bdac:	679020ef          	jal	ec24 <__hidden___udivsi3>
    bdb0:	00040593          	mv	a1,s0
    bdb4:	5ad020ef          	jal	eb60 <__mulsi3>
    bdb8:	00050793          	mv	a5,a0
    bdbc:	000a8593          	mv	a1,s5
    bdc0:	000b0513          	mv	a0,s6
    bdc4:	01099993          	sll	s3,s3,0x10
    bdc8:	00078b13          	mv	s6,a5
    bdcc:	6a1020ef          	jal	ec6c <__umodsi3>
    bdd0:	01051513          	sll	a0,a0,0x10
    bdd4:	0109d993          	srl	s3,s3,0x10
    bdd8:	00a9e9b3          	or	s3,s3,a0
    bddc:	0169fa63          	bgeu	s3,s6,bdf0 <__umoddi3+0x3b8>
    bde0:	013a09b3          	add	s3,s4,s3
    bde4:	0149e663          	bltu	s3,s4,bdf0 <__umoddi3+0x3b8>
    bde8:	0169f463          	bgeu	s3,s6,bdf0 <__umoddi3+0x3b8>
    bdec:	014989b3          	add	s3,s3,s4
    bdf0:	416989b3          	sub	s3,s3,s6
    bdf4:	00c12b83          	lw	s7,12(sp)
    bdf8:	01012b03          	lw	s6,16(sp)
    bdfc:	e65ff06f          	j	bc60 <__umoddi3+0x228>
    be00:	1006b513          	sltiu	a0,a3,256
    be04:	00153513          	seqz	a0,a0
    be08:	00351513          	sll	a0,a0,0x3
    be0c:	00a6d333          	srl	t1,a3,a0
    be10:	00004717          	auipc	a4,0x4
    be14:	8c070713          	add	a4,a4,-1856 # f6d0 <__clz_tab>
    be18:	00670733          	add	a4,a4,t1
    be1c:	00074703          	lbu	a4,0(a4)
    be20:	02000313          	li	t1,32
    be24:	00a709b3          	add	s3,a4,a0
    be28:	41330933          	sub	s2,t1,s3
    be2c:	db330ae3          	beq	t1,s3,bbe0 <__umoddi3+0x1a8>
    be30:	01512a23          	sw	s5,20(sp)
    be34:	012696b3          	sll	a3,a3,s2
    be38:	01365ab3          	srl	s5,a2,s3
    be3c:	00daeab3          	or	s5,s5,a3
    be40:	01712623          	sw	s7,12(sp)
    be44:	01a12023          	sw	s10,0(sp)
    be48:	010adb93          	srl	s7,s5,0x10
    be4c:	0135dd33          	srl	s10,a1,s3
    be50:	01259733          	sll	a4,a1,s2
    be54:	0137d6b3          	srl	a3,a5,s3
    be58:	01912223          	sw	s9,4(sp)
    be5c:	000b8593          	mv	a1,s7
    be60:	000d0513          	mv	a0,s10
    be64:	010a9c93          	sll	s9,s5,0x10
    be68:	02812423          	sw	s0,40(sp)
    be6c:	02912223          	sw	s1,36(sp)
    be70:	01261433          	sll	s0,a2,s2
    be74:	012794b3          	sll	s1,a5,s2
    be78:	01412c23          	sw	s4,24(sp)
    be7c:	01612823          	sw	s6,16(sp)
    be80:	00e6ea33          	or	s4,a3,a4
    be84:	01812423          	sw	s8,8(sp)
    be88:	010cdc93          	srl	s9,s9,0x10
    be8c:	599020ef          	jal	ec24 <__hidden___udivsi3>
    be90:	00050593          	mv	a1,a0
    be94:	00050b13          	mv	s6,a0
    be98:	000c8513          	mv	a0,s9
    be9c:	4c5020ef          	jal	eb60 <__mulsi3>
    bea0:	00050c13          	mv	s8,a0
    bea4:	000b8593          	mv	a1,s7
    bea8:	000d0513          	mv	a0,s10
    beac:	5c1020ef          	jal	ec6c <__umodsi3>
    beb0:	01051513          	sll	a0,a0,0x10
    beb4:	010a5793          	srl	a5,s4,0x10
    beb8:	00a7e7b3          	or	a5,a5,a0
    bebc:	0187fe63          	bgeu	a5,s8,bed8 <__umoddi3+0x4a0>
    bec0:	00fa87b3          	add	a5,s5,a5
    bec4:	fffb0713          	add	a4,s6,-1
    bec8:	1957ee63          	bltu	a5,s5,c064 <__umoddi3+0x62c>
    becc:	1987fc63          	bgeu	a5,s8,c064 <__umoddi3+0x62c>
    bed0:	ffeb0b13          	add	s6,s6,-2
    bed4:	015787b3          	add	a5,a5,s5
    bed8:	41878c33          	sub	s8,a5,s8
    bedc:	000b8593          	mv	a1,s7
    bee0:	000c0513          	mv	a0,s8
    bee4:	541020ef          	jal	ec24 <__hidden___udivsi3>
    bee8:	00050593          	mv	a1,a0
    beec:	00050d13          	mv	s10,a0
    bef0:	000c8513          	mv	a0,s9
    bef4:	46d020ef          	jal	eb60 <__mulsi3>
    bef8:	00050793          	mv	a5,a0
    befc:	000b8593          	mv	a1,s7
    bf00:	000c0513          	mv	a0,s8
    bf04:	00078b93          	mv	s7,a5
    bf08:	565020ef          	jal	ec6c <__umodsi3>
    bf0c:	010a1593          	sll	a1,s4,0x10
    bf10:	01051513          	sll	a0,a0,0x10
    bf14:	0105d593          	srl	a1,a1,0x10
    bf18:	00a5e5b3          	or	a1,a1,a0
    bf1c:	0175fe63          	bgeu	a1,s7,bf38 <__umoddi3+0x500>
    bf20:	00ba85b3          	add	a1,s5,a1
    bf24:	fffd0793          	add	a5,s10,-1
    bf28:	1355ea63          	bltu	a1,s5,c05c <__umoddi3+0x624>
    bf2c:	1375f863          	bgeu	a1,s7,c05c <__umoddi3+0x624>
    bf30:	ffed0d13          	add	s10,s10,-2
    bf34:	015585b3          	add	a1,a1,s5
    bf38:	010b1793          	sll	a5,s6,0x10
    bf3c:	00010e37          	lui	t3,0x10
    bf40:	01a7e7b3          	or	a5,a5,s10
    bf44:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    bf48:	0067f8b3          	and	a7,a5,t1
    bf4c:	00647333          	and	t1,s0,t1
    bf50:	41758733          	sub	a4,a1,s7
    bf54:	0107d793          	srl	a5,a5,0x10
    bf58:	01045e93          	srl	t4,s0,0x10
    bf5c:	00088513          	mv	a0,a7
    bf60:	00030593          	mv	a1,t1
    bf64:	3fd020ef          	jal	eb60 <__mulsi3>
    bf68:	00050813          	mv	a6,a0
    bf6c:	000e8593          	mv	a1,t4
    bf70:	00088513          	mv	a0,a7
    bf74:	3ed020ef          	jal	eb60 <__mulsi3>
    bf78:	00050893          	mv	a7,a0
    bf7c:	00030593          	mv	a1,t1
    bf80:	00078513          	mv	a0,a5
    bf84:	3dd020ef          	jal	eb60 <__mulsi3>
    bf88:	00050313          	mv	t1,a0
    bf8c:	000e8593          	mv	a1,t4
    bf90:	00078513          	mv	a0,a5
    bf94:	3cd020ef          	jal	eb60 <__mulsi3>
    bf98:	01085793          	srl	a5,a6,0x10
    bf9c:	006888b3          	add	a7,a7,t1
    bfa0:	011787b3          	add	a5,a5,a7
    bfa4:	0067f463          	bgeu	a5,t1,bfac <__umoddi3+0x574>
    bfa8:	01c50533          	add	a0,a0,t3
    bfac:	00010637          	lui	a2,0x10
    bfb0:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    bfb4:	0107d693          	srl	a3,a5,0x10
    bfb8:	00c7f7b3          	and	a5,a5,a2
    bfbc:	01079793          	sll	a5,a5,0x10
    bfc0:	00c87833          	and	a6,a6,a2
    bfc4:	00a686b3          	add	a3,a3,a0
    bfc8:	010787b3          	add	a5,a5,a6
    bfcc:	06d76263          	bltu	a4,a3,c030 <__umoddi3+0x5f8>
    bfd0:	04d70e63          	beq	a4,a3,c02c <__umoddi3+0x5f4>
    bfd4:	40f487b3          	sub	a5,s1,a5
    bfd8:	00f4b4b3          	sltu	s1,s1,a5
    bfdc:	02812403          	lw	s0,40(sp)
    bfe0:	02c12083          	lw	ra,44(sp)
    bfe4:	40d705b3          	sub	a1,a4,a3
    bfe8:	409585b3          	sub	a1,a1,s1
    bfec:	01359733          	sll	a4,a1,s3
    bff0:	0127d7b3          	srl	a5,a5,s2
    bff4:	02412483          	lw	s1,36(sp)
    bff8:	01c12983          	lw	s3,28(sp)
    bffc:	01812a03          	lw	s4,24(sp)
    c000:	01412a83          	lw	s5,20(sp)
    c004:	01012b03          	lw	s6,16(sp)
    c008:	00c12b83          	lw	s7,12(sp)
    c00c:	00812c03          	lw	s8,8(sp)
    c010:	00412c83          	lw	s9,4(sp)
    c014:	00012d03          	lw	s10,0(sp)
    c018:	0125d5b3          	srl	a1,a1,s2
    c01c:	00f76533          	or	a0,a4,a5
    c020:	02012903          	lw	s2,32(sp)
    c024:	03010113          	add	sp,sp,48
    c028:	00008067          	ret
    c02c:	faf4f4e3          	bgeu	s1,a5,bfd4 <__umoddi3+0x59c>
    c030:	40878433          	sub	s0,a5,s0
    c034:	0087b7b3          	sltu	a5,a5,s0
    c038:	01578ab3          	add	s5,a5,s5
    c03c:	415686b3          	sub	a3,a3,s5
    c040:	00040793          	mv	a5,s0
    c044:	f91ff06f          	j	bfd4 <__umoddi3+0x59c>
    c048:	01000737          	lui	a4,0x1000
    c04c:	02e67c63          	bgeu	a2,a4,c084 <__umoddi3+0x64c>
    c050:	01065513          	srl	a0,a2,0x10
    c054:	01000693          	li	a3,16
    c058:	bd9ff06f          	j	bc30 <__umoddi3+0x1f8>
    c05c:	00078d13          	mv	s10,a5
    c060:	ed9ff06f          	j	bf38 <__umoddi3+0x500>
    c064:	00070b13          	mv	s6,a4
    c068:	e71ff06f          	j	bed8 <__umoddi3+0x4a0>
    c06c:	014787b3          	add	a5,a5,s4
    c070:	aedff06f          	j	bb5c <__umoddi3+0x124>
    c074:	014787b3          	add	a5,a5,s4
    c078:	c2dff06f          	j	bca4 <__umoddi3+0x26c>
    c07c:	014787b3          	add	a5,a5,s4
    c080:	a91ff06f          	j	bb10 <__umoddi3+0xd8>
    c084:	01865513          	srl	a0,a2,0x18
    c088:	01800693          	li	a3,24
    c08c:	ba5ff06f          	j	bc30 <__umoddi3+0x1f8>

0000c090 <__adddf3>:
    c090:	001007b7          	lui	a5,0x100
    c094:	fe010113          	add	sp,sp,-32
    c098:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c09c:	00bef833          	and	a6,t4,a1
    c0a0:	00def7b3          	and	a5,t4,a3
    c0a4:	0146d313          	srl	t1,a3,0x14
    c0a8:	01212823          	sw	s2,16(sp)
    c0ac:	0145d913          	srl	s2,a1,0x14
    c0b0:	00379793          	sll	a5,a5,0x3
    c0b4:	00812c23          	sw	s0,24(sp)
    c0b8:	00381813          	sll	a6,a6,0x3
    c0bc:	01f5d413          	srl	s0,a1,0x1f
    c0c0:	01d55713          	srl	a4,a0,0x1d
    c0c4:	01d65893          	srl	a7,a2,0x1d
    c0c8:	7ff97913          	and	s2,s2,2047
    c0cc:	7ff37313          	and	t1,t1,2047
    c0d0:	00112e23          	sw	ra,28(sp)
    c0d4:	00912a23          	sw	s1,20(sp)
    c0d8:	01312623          	sw	s3,12(sp)
    c0dc:	01f6d693          	srl	a3,a3,0x1f
    c0e0:	00f8e8b3          	or	a7,a7,a5
    c0e4:	01076733          	or	a4,a4,a6
    c0e8:	00351593          	sll	a1,a0,0x3
    c0ec:	00361f13          	sll	t5,a2,0x3
    c0f0:	406907b3          	sub	a5,s2,t1
    c0f4:	1ed40463          	beq	s0,a3,c2dc <__adddf3+0x24c>
    c0f8:	16f05263          	blez	a5,c25c <__adddf3+0x1cc>
    c0fc:	28030663          	beqz	t1,c388 <__adddf3+0x2f8>
    c100:	7ff00693          	li	a3,2047
    c104:	42d90663          	beq	s2,a3,c530 <__adddf3+0x4a0>
    c108:	03800693          	li	a3,56
    c10c:	00100613          	li	a2,1
    c110:	02f6ce63          	blt	a3,a5,c14c <__adddf3+0xbc>
    c114:	008006b7          	lui	a3,0x800
    c118:	00d8e8b3          	or	a7,a7,a3
    c11c:	01f00693          	li	a3,31
    c120:	52f6ce63          	blt	a3,a5,c65c <__adddf3+0x5cc>
    c124:	02000693          	li	a3,32
    c128:	40f686b3          	sub	a3,a3,a5
    c12c:	00d89633          	sll	a2,a7,a3
    c130:	00ff5533          	srl	a0,t5,a5
    c134:	00df16b3          	sll	a3,t5,a3
    c138:	00a66633          	or	a2,a2,a0
    c13c:	00d036b3          	snez	a3,a3
    c140:	00f8d8b3          	srl	a7,a7,a5
    c144:	00d66633          	or	a2,a2,a3
    c148:	41170733          	sub	a4,a4,a7
    c14c:	40c58633          	sub	a2,a1,a2
    c150:	00c5b5b3          	sltu	a1,a1,a2
    c154:	00060493          	mv	s1,a2
    c158:	40b709b3          	sub	s3,a4,a1
    c15c:	00899793          	sll	a5,s3,0x8
    c160:	3207da63          	bgez	a5,c494 <__adddf3+0x404>
    c164:	008007b7          	lui	a5,0x800
    c168:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c16c:	00f9f9b3          	and	s3,s3,a5
    c170:	2c098863          	beqz	s3,c440 <__adddf3+0x3b0>
    c174:	00098513          	mv	a0,s3
    c178:	359020ef          	jal	ecd0 <__clzsi2>
    c17c:	ff850793          	add	a5,a0,-8
    c180:	02000693          	li	a3,32
    c184:	40f68733          	sub	a4,a3,a5
    c188:	00e4d733          	srl	a4,s1,a4
    c18c:	00f999b3          	sll	s3,s3,a5
    c190:	01376733          	or	a4,a4,s3
    c194:	00f494b3          	sll	s1,s1,a5
    c198:	4b27c863          	blt	a5,s2,c648 <__adddf3+0x5b8>
    c19c:	412787b3          	sub	a5,a5,s2
    c1a0:	00178793          	add	a5,a5,1
    c1a4:	40f686b3          	sub	a3,a3,a5
    c1a8:	00d49633          	sll	a2,s1,a3
    c1ac:	00f4d9b3          	srl	s3,s1,a5
    c1b0:	00c03633          	snez	a2,a2
    c1b4:	01366633          	or	a2,a2,s3
    c1b8:	00d716b3          	sll	a3,a4,a3
    c1bc:	00c6e4b3          	or	s1,a3,a2
    c1c0:	00f759b3          	srl	s3,a4,a5
    c1c4:	00000913          	li	s2,0
    c1c8:	0074f793          	and	a5,s1,7
    c1cc:	02078063          	beqz	a5,c1ec <__adddf3+0x15c>
    c1d0:	00f4f793          	and	a5,s1,15
    c1d4:	00400713          	li	a4,4
    c1d8:	00e78a63          	beq	a5,a4,c1ec <__adddf3+0x15c>
    c1dc:	00448793          	add	a5,s1,4
    c1e0:	0097b633          	sltu	a2,a5,s1
    c1e4:	00c989b3          	add	s3,s3,a2
    c1e8:	00078493          	mv	s1,a5
    c1ec:	00899793          	sll	a5,s3,0x8
    c1f0:	6e07da63          	bgez	a5,c8e4 <__adddf3+0x854>
    c1f4:	00190793          	add	a5,s2,1
    c1f8:	7ff00713          	li	a4,2047
    c1fc:	00040e13          	mv	t3,s0
    c200:	2ae78663          	beq	a5,a4,c4ac <__adddf3+0x41c>
    c204:	ff800737          	lui	a4,0xff800
    c208:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c20c:	00e9f733          	and	a4,s3,a4
    c210:	7ff7f793          	and	a5,a5,2047
    c214:	01d71813          	sll	a6,a4,0x1d
    c218:	0034d613          	srl	a2,s1,0x3
    c21c:	00971713          	sll	a4,a4,0x9
    c220:	00c86833          	or	a6,a6,a2
    c224:	00c75713          	srl	a4,a4,0xc
    c228:	01c12083          	lw	ra,28(sp)
    c22c:	01812403          	lw	s0,24(sp)
    c230:	01479793          	sll	a5,a5,0x14
    c234:	00e7e7b3          	or	a5,a5,a4
    c238:	01fe1713          	sll	a4,t3,0x1f
    c23c:	00e7e7b3          	or	a5,a5,a4
    c240:	01412483          	lw	s1,20(sp)
    c244:	01012903          	lw	s2,16(sp)
    c248:	00c12983          	lw	s3,12(sp)
    c24c:	00080513          	mv	a0,a6
    c250:	00078593          	mv	a1,a5
    c254:	02010113          	add	sp,sp,32
    c258:	00008067          	ret
    c25c:	14078c63          	beqz	a5,c3b4 <__adddf3+0x324>
    c260:	412307b3          	sub	a5,t1,s2
    c264:	3c091263          	bnez	s2,c628 <__adddf3+0x598>
    c268:	00b76533          	or	a0,a4,a1
    c26c:	4c050463          	beqz	a0,c734 <__adddf3+0x6a4>
    c270:	fff78513          	add	a0,a5,-1
    c274:	60050263          	beqz	a0,c878 <__adddf3+0x7e8>
    c278:	7ff00813          	li	a6,2047
    c27c:	57078663          	beq	a5,a6,c7e8 <__adddf3+0x758>
    c280:	03800793          	li	a5,56
    c284:	00100613          	li	a2,1
    c288:	02a7cc63          	blt	a5,a0,c2c0 <__adddf3+0x230>
    c28c:	00050793          	mv	a5,a0
    c290:	01f00613          	li	a2,31
    c294:	56f64c63          	blt	a2,a5,c80c <__adddf3+0x77c>
    c298:	02000513          	li	a0,32
    c29c:	40f50533          	sub	a0,a0,a5
    c2a0:	00a71633          	sll	a2,a4,a0
    c2a4:	00f5d833          	srl	a6,a1,a5
    c2a8:	00a59533          	sll	a0,a1,a0
    c2ac:	01066633          	or	a2,a2,a6
    c2b0:	00a03533          	snez	a0,a0
    c2b4:	00f75733          	srl	a4,a4,a5
    c2b8:	00a66633          	or	a2,a2,a0
    c2bc:	40e888b3          	sub	a7,a7,a4
    c2c0:	40cf0633          	sub	a2,t5,a2
    c2c4:	00cf3733          	sltu	a4,t5,a2
    c2c8:	00060493          	mv	s1,a2
    c2cc:	40e889b3          	sub	s3,a7,a4
    c2d0:	00030913          	mv	s2,t1
    c2d4:	00068413          	mv	s0,a3
    c2d8:	e85ff06f          	j	c15c <__adddf3+0xcc>
    c2dc:	1ef05063          	blez	a5,c4bc <__adddf3+0x42c>
    c2e0:	14031063          	bnez	t1,c420 <__adddf3+0x390>
    c2e4:	01e8e6b3          	or	a3,a7,t5
    c2e8:	26068c63          	beqz	a3,c560 <__adddf3+0x4d0>
    c2ec:	fff78693          	add	a3,a5,-1
    c2f0:	48068063          	beqz	a3,c770 <__adddf3+0x6e0>
    c2f4:	7ff00613          	li	a2,2047
    c2f8:	22c78c63          	beq	a5,a2,c530 <__adddf3+0x4a0>
    c2fc:	03800793          	li	a5,56
    c300:	00100993          	li	s3,1
    c304:	02d7cc63          	blt	a5,a3,c33c <__adddf3+0x2ac>
    c308:	00068793          	mv	a5,a3
    c30c:	01f00693          	li	a3,31
    c310:	4af6c063          	blt	a3,a5,c7b0 <__adddf3+0x720>
    c314:	02000693          	li	a3,32
    c318:	40f686b3          	sub	a3,a3,a5
    c31c:	00d899b3          	sll	s3,a7,a3
    c320:	00ff5633          	srl	a2,t5,a5
    c324:	00df16b3          	sll	a3,t5,a3
    c328:	00c9e9b3          	or	s3,s3,a2
    c32c:	00d036b3          	snez	a3,a3
    c330:	00f8d8b3          	srl	a7,a7,a5
    c334:	00d9e9b3          	or	s3,s3,a3
    c338:	01170733          	add	a4,a4,a7
    c33c:	00b985b3          	add	a1,s3,a1
    c340:	0135b9b3          	sltu	s3,a1,s3
    c344:	00058493          	mv	s1,a1
    c348:	00e989b3          	add	s3,s3,a4
    c34c:	00899793          	sll	a5,s3,0x8
    c350:	1407d263          	bgez	a5,c494 <__adddf3+0x404>
    c354:	00190913          	add	s2,s2,1
    c358:	7ff00793          	li	a5,2047
    c35c:	36f90c63          	beq	s2,a5,c6d4 <__adddf3+0x644>
    c360:	ff8007b7          	lui	a5,0xff800
    c364:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c368:	0014f613          	and	a2,s1,1
    c36c:	00f9f7b3          	and	a5,s3,a5
    c370:	0014d713          	srl	a4,s1,0x1
    c374:	00c76733          	or	a4,a4,a2
    c378:	01f79613          	sll	a2,a5,0x1f
    c37c:	00e664b3          	or	s1,a2,a4
    c380:	0017d993          	srl	s3,a5,0x1
    c384:	e45ff06f          	j	c1c8 <__adddf3+0x138>
    c388:	01e8e6b3          	or	a3,a7,t5
    c38c:	1c068a63          	beqz	a3,c560 <__adddf3+0x4d0>
    c390:	fff78693          	add	a3,a5,-1
    c394:	40068063          	beqz	a3,c794 <__adddf3+0x704>
    c398:	7ff00613          	li	a2,2047
    c39c:	18c78a63          	beq	a5,a2,c530 <__adddf3+0x4a0>
    c3a0:	03800793          	li	a5,56
    c3a4:	00100613          	li	a2,1
    c3a8:	dad7c2e3          	blt	a5,a3,c14c <__adddf3+0xbc>
    c3ac:	00068793          	mv	a5,a3
    c3b0:	d6dff06f          	j	c11c <__adddf3+0x8c>
    c3b4:	00190813          	add	a6,s2,1
    c3b8:	7fe87813          	and	a6,a6,2046
    c3bc:	22081c63          	bnez	a6,c5f4 <__adddf3+0x564>
    c3c0:	00b76333          	or	t1,a4,a1
    c3c4:	01e8e833          	or	a6,a7,t5
    c3c8:	38091063          	bnez	s2,c748 <__adddf3+0x6b8>
    c3cc:	46030e63          	beqz	t1,c848 <__adddf3+0x7b8>
    c3d0:	40080663          	beqz	a6,c7dc <__adddf3+0x74c>
    c3d4:	41e589b3          	sub	s3,a1,t5
    c3d8:	0135b533          	sltu	a0,a1,s3
    c3dc:	41170633          	sub	a2,a4,a7
    c3e0:	40a60633          	sub	a2,a2,a0
    c3e4:	00861513          	sll	a0,a2,0x8
    c3e8:	50055e63          	bgez	a0,c904 <__adddf3+0x874>
    c3ec:	40bf05b3          	sub	a1,t5,a1
    c3f0:	40e88733          	sub	a4,a7,a4
    c3f4:	00bf3f33          	sltu	t5,t5,a1
    c3f8:	41e70733          	sub	a4,a4,t5
    c3fc:	00871613          	sll	a2,a4,0x8
    c400:	00058493          	mv	s1,a1
    c404:	52065e63          	bgez	a2,c940 <__adddf3+0x8b0>
    c408:	ff8007b7          	lui	a5,0xff800
    c40c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c410:	00f77733          	and	a4,a4,a5
    c414:	00068e13          	mv	t3,a3
    c418:	00100793          	li	a5,1
    c41c:	df9ff06f          	j	c214 <__adddf3+0x184>
    c420:	7ff00693          	li	a3,2047
    c424:	10d90663          	beq	s2,a3,c530 <__adddf3+0x4a0>
    c428:	03800693          	li	a3,56
    c42c:	00100993          	li	s3,1
    c430:	f0f6c6e3          	blt	a3,a5,c33c <__adddf3+0x2ac>
    c434:	008006b7          	lui	a3,0x800
    c438:	00d8e8b3          	or	a7,a7,a3
    c43c:	ed1ff06f          	j	c30c <__adddf3+0x27c>
    c440:	00048513          	mv	a0,s1
    c444:	08d020ef          	jal	ecd0 <__clzsi2>
    c448:	01850793          	add	a5,a0,24
    c44c:	01f00693          	li	a3,31
    c450:	d2f6d8e3          	bge	a3,a5,c180 <__adddf3+0xf0>
    c454:	ff850713          	add	a4,a0,-8
    c458:	00e49733          	sll	a4,s1,a4
    c45c:	2327c663          	blt	a5,s2,c688 <__adddf3+0x5f8>
    c460:	41278933          	sub	s2,a5,s2
    c464:	00190793          	add	a5,s2,1
    c468:	48f6d663          	bge	a3,a5,c8f4 <__adddf3+0x864>
    c46c:	fe190913          	add	s2,s2,-31
    c470:	02000693          	li	a3,32
    c474:	012754b3          	srl	s1,a4,s2
    c478:	00d78c63          	beq	a5,a3,c490 <__adddf3+0x400>
    c47c:	04000693          	li	a3,64
    c480:	40f687b3          	sub	a5,a3,a5
    c484:	00f71733          	sll	a4,a4,a5
    c488:	00e03733          	snez	a4,a4
    c48c:	00e4e4b3          	or	s1,s1,a4
    c490:	00000913          	li	s2,0
    c494:	0074f793          	and	a5,s1,7
    c498:	d2079ce3          	bnez	a5,c1d0 <__adddf3+0x140>
    c49c:	00090793          	mv	a5,s2
    c4a0:	0034d613          	srl	a2,s1,0x3
    c4a4:	00098713          	mv	a4,s3
    c4a8:	0c00006f          	j	c568 <__adddf3+0x4d8>
    c4ac:	7ff00793          	li	a5,2047
    c4b0:	00000713          	li	a4,0
    c4b4:	00000813          	li	a6,0
    c4b8:	d71ff06f          	j	c228 <__adddf3+0x198>
    c4bc:	0c078a63          	beqz	a5,c590 <__adddf3+0x500>
    c4c0:	412307b3          	sub	a5,t1,s2
    c4c4:	1e090263          	beqz	s2,c6a8 <__adddf3+0x618>
    c4c8:	7ff00693          	li	a3,2047
    c4cc:	32d30863          	beq	t1,a3,c7fc <__adddf3+0x76c>
    c4d0:	03800693          	li	a3,56
    c4d4:	00100993          	li	s3,1
    c4d8:	02f6ce63          	blt	a3,a5,c514 <__adddf3+0x484>
    c4dc:	008006b7          	lui	a3,0x800
    c4e0:	00d76733          	or	a4,a4,a3
    c4e4:	01f00693          	li	a3,31
    c4e8:	3cf6c863          	blt	a3,a5,c8b8 <__adddf3+0x828>
    c4ec:	02000693          	li	a3,32
    c4f0:	40f686b3          	sub	a3,a3,a5
    c4f4:	00d719b3          	sll	s3,a4,a3
    c4f8:	00f5d633          	srl	a2,a1,a5
    c4fc:	00d596b3          	sll	a3,a1,a3
    c500:	00c9e9b3          	or	s3,s3,a2
    c504:	00d036b3          	snez	a3,a3
    c508:	00f75733          	srl	a4,a4,a5
    c50c:	00d9e9b3          	or	s3,s3,a3
    c510:	00e888b3          	add	a7,a7,a4
    c514:	01e98733          	add	a4,s3,t5
    c518:	013739b3          	sltu	s3,a4,s3
    c51c:	00070493          	mv	s1,a4
    c520:	011989b3          	add	s3,s3,a7
    c524:	00030913          	mv	s2,t1
    c528:	e25ff06f          	j	c34c <__adddf3+0x2bc>
    c52c:	02081063          	bnez	a6,c54c <__adddf3+0x4bc>
    c530:	00351613          	sll	a2,a0,0x3
    c534:	00365613          	srl	a2,a2,0x3
    c538:	01d71813          	sll	a6,a4,0x1d
    c53c:	00c86833          	or	a6,a6,a2
    c540:	00375713          	srl	a4,a4,0x3
    c544:	01076733          	or	a4,a4,a6
    c548:	18070663          	beqz	a4,c6d4 <__adddf3+0x644>
    c54c:	00000e13          	li	t3,0
    c550:	7ff00793          	li	a5,2047
    c554:	00080737          	lui	a4,0x80
    c558:	00000813          	li	a6,0
    c55c:	ccdff06f          	j	c228 <__adddf3+0x198>
    c560:	00351613          	sll	a2,a0,0x3
    c564:	00365613          	srl	a2,a2,0x3
    c568:	01d71813          	sll	a6,a4,0x1d
    c56c:	7ff00693          	li	a3,2047
    c570:	00c86833          	or	a6,a6,a2
    c574:	00375713          	srl	a4,a4,0x3
    c578:	fcd786e3          	beq	a5,a3,c544 <__adddf3+0x4b4>
    c57c:	00c71713          	sll	a4,a4,0xc
    c580:	00c75713          	srl	a4,a4,0xc
    c584:	7ff7f793          	and	a5,a5,2047
    c588:	00040e13          	mv	t3,s0
    c58c:	c9dff06f          	j	c228 <__adddf3+0x198>
    c590:	00190693          	add	a3,s2,1
    c594:	7fe6f813          	and	a6,a3,2046
    c598:	14081863          	bnez	a6,c6e8 <__adddf3+0x658>
    c59c:	00b766b3          	or	a3,a4,a1
    c5a0:	28091c63          	bnez	s2,c838 <__adddf3+0x7a8>
    c5a4:	30068263          	beqz	a3,c8a8 <__adddf3+0x818>
    c5a8:	01e8e6b3          	or	a3,a7,t5
    c5ac:	22068863          	beqz	a3,c7dc <__adddf3+0x74c>
    c5b0:	01e587b3          	add	a5,a1,t5
    c5b4:	00b7b5b3          	sltu	a1,a5,a1
    c5b8:	01170733          	add	a4,a4,a7
    c5bc:	00b70733          	add	a4,a4,a1
    c5c0:	0037d813          	srl	a6,a5,0x3
    c5c4:	00871793          	sll	a5,a4,0x8
    c5c8:	00040e13          	mv	t3,s0
    c5cc:	3407de63          	bgez	a5,c928 <__adddf3+0x898>
    c5d0:	ff8007b7          	lui	a5,0xff800
    c5d4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c5d8:	00f77733          	and	a4,a4,a5
    c5dc:	01d71793          	sll	a5,a4,0x1d
    c5e0:	00375713          	srl	a4,a4,0x3
    c5e4:	0107e833          	or	a6,a5,a6
    c5e8:	01d77733          	and	a4,a4,t4
    c5ec:	00100793          	li	a5,1
    c5f0:	c39ff06f          	j	c228 <__adddf3+0x198>
    c5f4:	41e58833          	sub	a6,a1,t5
    c5f8:	0105b7b3          	sltu	a5,a1,a6
    c5fc:	411709b3          	sub	s3,a4,a7
    c600:	40f989b3          	sub	s3,s3,a5
    c604:	00899793          	sll	a5,s3,0x8
    c608:	00080493          	mv	s1,a6
    c60c:	1007c663          	bltz	a5,c718 <__adddf3+0x688>
    c610:	01386833          	or	a6,a6,s3
    c614:	b4081ee3          	bnez	a6,c170 <__adddf3+0xe0>
    c618:	00000e13          	li	t3,0
    c61c:	00000793          	li	a5,0
    c620:	00000713          	li	a4,0
    c624:	c05ff06f          	j	c228 <__adddf3+0x198>
    c628:	7ff00513          	li	a0,2047
    c62c:	1aa30e63          	beq	t1,a0,c7e8 <__adddf3+0x758>
    c630:	03800513          	li	a0,56
    c634:	00100613          	li	a2,1
    c638:	c8f544e3          	blt	a0,a5,c2c0 <__adddf3+0x230>
    c63c:	00800637          	lui	a2,0x800
    c640:	00c76733          	or	a4,a4,a2
    c644:	c4dff06f          	j	c290 <__adddf3+0x200>
    c648:	ff8009b7          	lui	s3,0xff800
    c64c:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c650:	40f90933          	sub	s2,s2,a5
    c654:	013779b3          	and	s3,a4,s3
    c658:	b71ff06f          	j	c1c8 <__adddf3+0x138>
    c65c:	fe078693          	add	a3,a5,-32
    c660:	02000613          	li	a2,32
    c664:	00d8d6b3          	srl	a3,a7,a3
    c668:	00c78a63          	beq	a5,a2,c67c <__adddf3+0x5ec>
    c66c:	04000613          	li	a2,64
    c670:	40f607b3          	sub	a5,a2,a5
    c674:	00f897b3          	sll	a5,a7,a5
    c678:	00ff6f33          	or	t5,t5,a5
    c67c:	01e03633          	snez	a2,t5
    c680:	00d66633          	or	a2,a2,a3
    c684:	ac9ff06f          	j	c14c <__adddf3+0xbc>
    c688:	ff8006b7          	lui	a3,0xff800
    c68c:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c690:	40f907b3          	sub	a5,s2,a5
    c694:	00d77733          	and	a4,a4,a3
    c698:	01d71813          	sll	a6,a4,0x1d
    c69c:	01386833          	or	a6,a6,s3
    c6a0:	00375713          	srl	a4,a4,0x3
    c6a4:	ed9ff06f          	j	c57c <__adddf3+0x4ec>
    c6a8:	00b766b3          	or	a3,a4,a1
    c6ac:	1e068663          	beqz	a3,c898 <__adddf3+0x808>
    c6b0:	fff78693          	add	a3,a5,-1
    c6b4:	0a068e63          	beqz	a3,c770 <__adddf3+0x6e0>
    c6b8:	7ff00513          	li	a0,2047
    c6bc:	14a78063          	beq	a5,a0,c7fc <__adddf3+0x76c>
    c6c0:	03800793          	li	a5,56
    c6c4:	00100993          	li	s3,1
    c6c8:	e4d7c6e3          	blt	a5,a3,c514 <__adddf3+0x484>
    c6cc:	00068793          	mv	a5,a3
    c6d0:	e15ff06f          	j	c4e4 <__adddf3+0x454>
    c6d4:	00040e13          	mv	t3,s0
    c6d8:	7ff00793          	li	a5,2047
    c6dc:	00000713          	li	a4,0
    c6e0:	00000813          	li	a6,0
    c6e4:	b45ff06f          	j	c228 <__adddf3+0x198>
    c6e8:	7ff00793          	li	a5,2047
    c6ec:	fef684e3          	beq	a3,a5,c6d4 <__adddf3+0x644>
    c6f0:	01e58f33          	add	t5,a1,t5
    c6f4:	00bf35b3          	sltu	a1,t5,a1
    c6f8:	011707b3          	add	a5,a4,a7
    c6fc:	00b787b3          	add	a5,a5,a1
    c700:	01f79613          	sll	a2,a5,0x1f
    c704:	001f5f13          	srl	t5,t5,0x1
    c708:	01e664b3          	or	s1,a2,t5
    c70c:	0017d993          	srl	s3,a5,0x1
    c710:	00068913          	mv	s2,a3
    c714:	ab5ff06f          	j	c1c8 <__adddf3+0x138>
    c718:	40bf0633          	sub	a2,t5,a1
    c71c:	40e887b3          	sub	a5,a7,a4
    c720:	00cf3733          	sltu	a4,t5,a2
    c724:	00060493          	mv	s1,a2
    c728:	40e789b3          	sub	s3,a5,a4
    c72c:	00068413          	mv	s0,a3
    c730:	a41ff06f          	j	c170 <__adddf3+0xe0>
    c734:	00361613          	sll	a2,a2,0x3
    c738:	00365613          	srl	a2,a2,0x3
    c73c:	00068413          	mv	s0,a3
    c740:	00088713          	mv	a4,a7
    c744:	e25ff06f          	j	c568 <__adddf3+0x4d8>
    c748:	de0312e3          	bnez	t1,c52c <__adddf3+0x49c>
    c74c:	1c080663          	beqz	a6,c918 <__adddf3+0x888>
    c750:	0038d713          	srl	a4,a7,0x3
    c754:	00361613          	sll	a2,a2,0x3
    c758:	01d89893          	sll	a7,a7,0x1d
    c75c:	01176733          	or	a4,a4,a7
    c760:	00365613          	srl	a2,a2,0x3
    c764:	00c76733          	or	a4,a4,a2
    c768:	00068413          	mv	s0,a3
    c76c:	dddff06f          	j	c548 <__adddf3+0x4b8>
    c770:	01e58f33          	add	t5,a1,t5
    c774:	011708b3          	add	a7,a4,a7
    c778:	00bf35b3          	sltu	a1,t5,a1
    c77c:	00b889b3          	add	s3,a7,a1
    c780:	00899793          	sll	a5,s3,0x8
    c784:	000f0493          	mv	s1,t5
    c788:	0e07d463          	bgez	a5,c870 <__adddf3+0x7e0>
    c78c:	00200913          	li	s2,2
    c790:	bd1ff06f          	j	c360 <__adddf3+0x2d0>
    c794:	41e58f33          	sub	t5,a1,t5
    c798:	411708b3          	sub	a7,a4,a7
    c79c:	01e5b5b3          	sltu	a1,a1,t5
    c7a0:	000f0493          	mv	s1,t5
    c7a4:	40b889b3          	sub	s3,a7,a1
    c7a8:	00100913          	li	s2,1
    c7ac:	9b1ff06f          	j	c15c <__adddf3+0xcc>
    c7b0:	fe078693          	add	a3,a5,-32
    c7b4:	02000613          	li	a2,32
    c7b8:	00d8d6b3          	srl	a3,a7,a3
    c7bc:	00c78a63          	beq	a5,a2,c7d0 <__adddf3+0x740>
    c7c0:	04000613          	li	a2,64
    c7c4:	40f607b3          	sub	a5,a2,a5
    c7c8:	00f897b3          	sll	a5,a7,a5
    c7cc:	00ff6f33          	or	t5,t5,a5
    c7d0:	01e039b3          	snez	s3,t5
    c7d4:	00d9e9b3          	or	s3,s3,a3
    c7d8:	b65ff06f          	j	c33c <__adddf3+0x2ac>
    c7dc:	00351613          	sll	a2,a0,0x3
    c7e0:	00365993          	srl	s3,a2,0x3
    c7e4:	eb5ff06f          	j	c698 <__adddf3+0x608>
    c7e8:	00361613          	sll	a2,a2,0x3
    c7ec:	00365613          	srl	a2,a2,0x3
    c7f0:	00068413          	mv	s0,a3
    c7f4:	00088713          	mv	a4,a7
    c7f8:	d41ff06f          	j	c538 <__adddf3+0x4a8>
    c7fc:	00361613          	sll	a2,a2,0x3
    c800:	00365613          	srl	a2,a2,0x3
    c804:	00088713          	mv	a4,a7
    c808:	d31ff06f          	j	c538 <__adddf3+0x4a8>
    c80c:	fe078513          	add	a0,a5,-32
    c810:	02000613          	li	a2,32
    c814:	00a75533          	srl	a0,a4,a0
    c818:	00c78a63          	beq	a5,a2,c82c <__adddf3+0x79c>
    c81c:	04000613          	li	a2,64
    c820:	40f607b3          	sub	a5,a2,a5
    c824:	00f717b3          	sll	a5,a4,a5
    c828:	00f5e5b3          	or	a1,a1,a5
    c82c:	00b03633          	snez	a2,a1
    c830:	00a66633          	or	a2,a2,a0
    c834:	a8dff06f          	j	c2c0 <__adddf3+0x230>
    c838:	fc0682e3          	beqz	a3,c7fc <__adddf3+0x76c>
    c83c:	01e8ef33          	or	t5,a7,t5
    c840:	d00f16e3          	bnez	t5,c54c <__adddf3+0x4bc>
    c844:	cedff06f          	j	c530 <__adddf3+0x4a0>
    c848:	dc0808e3          	beqz	a6,c618 <__adddf3+0x588>
    c84c:	00361813          	sll	a6,a2,0x3
    c850:	01d89793          	sll	a5,a7,0x1d
    c854:	00385813          	srl	a6,a6,0x3
    c858:	0038d713          	srl	a4,a7,0x3
    c85c:	00f86833          	or	a6,a6,a5
    c860:	01d77733          	and	a4,a4,t4
    c864:	00068e13          	mv	t3,a3
    c868:	00000793          	li	a5,0
    c86c:	9bdff06f          	j	c228 <__adddf3+0x198>
    c870:	00100793          	li	a5,1
    c874:	c2dff06f          	j	c4a0 <__adddf3+0x410>
    c878:	40bf05b3          	sub	a1,t5,a1
    c87c:	40e888b3          	sub	a7,a7,a4
    c880:	00bf3733          	sltu	a4,t5,a1
    c884:	00058493          	mv	s1,a1
    c888:	40e889b3          	sub	s3,a7,a4
    c88c:	00068413          	mv	s0,a3
    c890:	00100913          	li	s2,1
    c894:	8c9ff06f          	j	c15c <__adddf3+0xcc>
    c898:	00361613          	sll	a2,a2,0x3
    c89c:	00365613          	srl	a2,a2,0x3
    c8a0:	00088713          	mv	a4,a7
    c8a4:	cc5ff06f          	j	c568 <__adddf3+0x4d8>
    c8a8:	00361613          	sll	a2,a2,0x3
    c8ac:	00365993          	srl	s3,a2,0x3
    c8b0:	00088713          	mv	a4,a7
    c8b4:	de5ff06f          	j	c698 <__adddf3+0x608>
    c8b8:	fe078693          	add	a3,a5,-32
    c8bc:	02000613          	li	a2,32
    c8c0:	00d756b3          	srl	a3,a4,a3
    c8c4:	00c78a63          	beq	a5,a2,c8d8 <__adddf3+0x848>
    c8c8:	04000613          	li	a2,64
    c8cc:	40f607b3          	sub	a5,a2,a5
    c8d0:	00f717b3          	sll	a5,a4,a5
    c8d4:	00f5e5b3          	or	a1,a1,a5
    c8d8:	00b039b3          	snez	s3,a1
    c8dc:	00d9e9b3          	or	s3,s3,a3
    c8e0:	c35ff06f          	j	c514 <__adddf3+0x484>
    c8e4:	0034d613          	srl	a2,s1,0x3
    c8e8:	00090793          	mv	a5,s2
    c8ec:	00098713          	mv	a4,s3
    c8f0:	c79ff06f          	j	c568 <__adddf3+0x4d8>
    c8f4:	02000693          	li	a3,32
    c8f8:	40f686b3          	sub	a3,a3,a5
    c8fc:	00000613          	li	a2,0
    c900:	8b5ff06f          	j	c1b4 <__adddf3+0x124>
    c904:	00c9e833          	or	a6,s3,a2
    c908:	d00808e3          	beqz	a6,c618 <__adddf3+0x588>
    c90c:	0039d993          	srl	s3,s3,0x3
    c910:	00060713          	mv	a4,a2
    c914:	d85ff06f          	j	c698 <__adddf3+0x608>
    c918:	00000e13          	li	t3,0
    c91c:	7ff00793          	li	a5,2047
    c920:	00080737          	lui	a4,0x80
    c924:	905ff06f          	j	c228 <__adddf3+0x198>
    c928:	01d71793          	sll	a5,a4,0x1d
    c92c:	00375713          	srl	a4,a4,0x3
    c930:	0107e833          	or	a6,a5,a6
    c934:	01d77733          	and	a4,a4,t4
    c938:	00000793          	li	a5,0
    c93c:	8edff06f          	j	c228 <__adddf3+0x198>
    c940:	01d71813          	sll	a6,a4,0x1d
    c944:	0035d593          	srl	a1,a1,0x3
    c948:	00b86833          	or	a6,a6,a1
    c94c:	00375713          	srl	a4,a4,0x3
    c950:	00068413          	mv	s0,a3
    c954:	c29ff06f          	j	c57c <__adddf3+0x4ec>

0000c958 <__divdf3>:
    c958:	fb010113          	add	sp,sp,-80
    c95c:	0145d793          	srl	a5,a1,0x14
    c960:	04812423          	sw	s0,72(sp)
    c964:	04912223          	sw	s1,68(sp)
    c968:	05212023          	sw	s2,64(sp)
    c96c:	03412c23          	sw	s4,56(sp)
    c970:	03512a23          	sw	s5,52(sp)
    c974:	00c59493          	sll	s1,a1,0xc
    c978:	04112623          	sw	ra,76(sp)
    c97c:	03312e23          	sw	s3,60(sp)
    c980:	03612823          	sw	s6,48(sp)
    c984:	03712623          	sw	s7,44(sp)
    c988:	03812423          	sw	s8,40(sp)
    c98c:	7ff7f793          	and	a5,a5,2047
    c990:	00050413          	mv	s0,a0
    c994:	00060a13          	mv	s4,a2
    c998:	00068913          	mv	s2,a3
    c99c:	00c4d493          	srl	s1,s1,0xc
    c9a0:	01f5da93          	srl	s5,a1,0x1f
    c9a4:	18078c63          	beqz	a5,cb3c <__divdf3+0x1e4>
    c9a8:	7ff00713          	li	a4,2047
    c9ac:	08e78a63          	beq	a5,a4,ca40 <__divdf3+0xe8>
    c9b0:	01d55b13          	srl	s6,a0,0x1d
    c9b4:	00349493          	sll	s1,s1,0x3
    c9b8:	009b64b3          	or	s1,s6,s1
    c9bc:	00800737          	lui	a4,0x800
    c9c0:	00e4eb33          	or	s6,s1,a4
    c9c4:	00351b93          	sll	s7,a0,0x3
    c9c8:	c0178993          	add	s3,a5,-1023
    c9cc:	00000493          	li	s1,0
    c9d0:	00000c13          	li	s8,0
    c9d4:	01495793          	srl	a5,s2,0x14
    c9d8:	00c91413          	sll	s0,s2,0xc
    c9dc:	7ff7f793          	and	a5,a5,2047
    c9e0:	00c45413          	srl	s0,s0,0xc
    c9e4:	01f95913          	srl	s2,s2,0x1f
    c9e8:	08078463          	beqz	a5,ca70 <__divdf3+0x118>
    c9ec:	7ff00713          	li	a4,2047
    c9f0:	18e78c63          	beq	a5,a4,cb88 <__divdf3+0x230>
    c9f4:	00341413          	sll	s0,s0,0x3
    c9f8:	01da5713          	srl	a4,s4,0x1d
    c9fc:	00876733          	or	a4,a4,s0
    ca00:	c0178793          	add	a5,a5,-1023
    ca04:	00800437          	lui	s0,0x800
    ca08:	40f989b3          	sub	s3,s3,a5
    ca0c:	00876433          	or	s0,a4,s0
    ca10:	003a1813          	sll	a6,s4,0x3
    ca14:	00000793          	li	a5,0
    ca18:	00f00713          	li	a4,15
    ca1c:	012aca33          	xor	s4,s5,s2
    ca20:	24976663          	bltu	a4,s1,cc6c <__divdf3+0x314>
    ca24:	00003697          	auipc	a3,0x3
    ca28:	c6c68693          	add	a3,a3,-916 # f690 <__mprec_tens+0xc8>
    ca2c:	00249493          	sll	s1,s1,0x2
    ca30:	00d484b3          	add	s1,s1,a3
    ca34:	0004a703          	lw	a4,0(s1)
    ca38:	00d70733          	add	a4,a4,a3
    ca3c:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    ca40:	00a4eb33          	or	s6,s1,a0
    ca44:	1c0b1e63          	bnez	s6,cc20 <__divdf3+0x2c8>
    ca48:	01495793          	srl	a5,s2,0x14
    ca4c:	00c91413          	sll	s0,s2,0xc
    ca50:	7ff7f793          	and	a5,a5,2047
    ca54:	00000b93          	li	s7,0
    ca58:	00800493          	li	s1,8
    ca5c:	7ff00993          	li	s3,2047
    ca60:	00200c13          	li	s8,2
    ca64:	00c45413          	srl	s0,s0,0xc
    ca68:	01f95913          	srl	s2,s2,0x1f
    ca6c:	f80790e3          	bnez	a5,c9ec <__divdf3+0x94>
    ca70:	01446833          	or	a6,s0,s4
    ca74:	1c080263          	beqz	a6,cc38 <__divdf3+0x2e0>
    ca78:	5c040663          	beqz	s0,d044 <__divdf3+0x6ec>
    ca7c:	00040513          	mv	a0,s0
    ca80:	250020ef          	jal	ecd0 <__clzsi2>
    ca84:	00050793          	mv	a5,a0
    ca88:	ff550693          	add	a3,a0,-11
    ca8c:	01d00713          	li	a4,29
    ca90:	ff878813          	add	a6,a5,-8
    ca94:	40d70733          	sub	a4,a4,a3
    ca98:	01041433          	sll	s0,s0,a6
    ca9c:	00ea5733          	srl	a4,s4,a4
    caa0:	00876433          	or	s0,a4,s0
    caa4:	010a1833          	sll	a6,s4,a6
    caa8:	013787b3          	add	a5,a5,s3
    caac:	3f378993          	add	s3,a5,1011
    cab0:	00000793          	li	a5,0
    cab4:	f65ff06f          	j	ca18 <__divdf3+0xc0>
    cab8:	40f70733          	sub	a4,a4,a5
    cabc:	03800693          	li	a3,56
    cac0:	60e6d063          	bge	a3,a4,d0c0 <__divdf3+0x768>
    cac4:	00000793          	li	a5,0
    cac8:	00000693          	li	a3,0
    cacc:	00000713          	li	a4,0
    cad0:	04c12083          	lw	ra,76(sp)
    cad4:	04812403          	lw	s0,72(sp)
    cad8:	01479793          	sll	a5,a5,0x14
    cadc:	00d7e7b3          	or	a5,a5,a3
    cae0:	01fa1693          	sll	a3,s4,0x1f
    cae4:	00d7e7b3          	or	a5,a5,a3
    cae8:	04412483          	lw	s1,68(sp)
    caec:	04012903          	lw	s2,64(sp)
    caf0:	03c12983          	lw	s3,60(sp)
    caf4:	03812a03          	lw	s4,56(sp)
    caf8:	03412a83          	lw	s5,52(sp)
    cafc:	03012b03          	lw	s6,48(sp)
    cb00:	02c12b83          	lw	s7,44(sp)
    cb04:	02812c03          	lw	s8,40(sp)
    cb08:	00070513          	mv	a0,a4
    cb0c:	00078593          	mv	a1,a5
    cb10:	05010113          	add	sp,sp,80
    cb14:	00008067          	ret
    cb18:	7ff00793          	li	a5,2047
    cb1c:	00000693          	li	a3,0
    cb20:	00000713          	li	a4,0
    cb24:	fadff06f          	j	cad0 <__divdf3+0x178>
    cb28:	00000a13          	li	s4,0
    cb2c:	7ff00793          	li	a5,2047
    cb30:	000806b7          	lui	a3,0x80
    cb34:	00000713          	li	a4,0
    cb38:	f99ff06f          	j	cad0 <__divdf3+0x178>
    cb3c:	00a4eb33          	or	s6,s1,a0
    cb40:	100b0c63          	beqz	s6,cc58 <__divdf3+0x300>
    cb44:	52048463          	beqz	s1,d06c <__divdf3+0x714>
    cb48:	00048513          	mv	a0,s1
    cb4c:	184020ef          	jal	ecd0 <__clzsi2>
    cb50:	00050713          	mv	a4,a0
    cb54:	ff550793          	add	a5,a0,-11
    cb58:	01d00b13          	li	s6,29
    cb5c:	ff870b93          	add	s7,a4,-8
    cb60:	40fb0b33          	sub	s6,s6,a5
    cb64:	017494b3          	sll	s1,s1,s7
    cb68:	01645b33          	srl	s6,s0,s6
    cb6c:	009b6b33          	or	s6,s6,s1
    cb70:	01741bb3          	sll	s7,s0,s7
    cb74:	c0d00793          	li	a5,-1011
    cb78:	40e789b3          	sub	s3,a5,a4
    cb7c:	00000493          	li	s1,0
    cb80:	00000c13          	li	s8,0
    cb84:	e51ff06f          	j	c9d4 <__divdf3+0x7c>
    cb88:	01446833          	or	a6,s0,s4
    cb8c:	80198993          	add	s3,s3,-2047
    cb90:	0a081c63          	bnez	a6,cc48 <__divdf3+0x2f0>
    cb94:	0024e493          	or	s1,s1,2
    cb98:	00000413          	li	s0,0
    cb9c:	00200793          	li	a5,2
    cba0:	e79ff06f          	j	ca18 <__divdf3+0xc0>
    cba4:	000a8913          	mv	s2,s5
    cba8:	000b0413          	mv	s0,s6
    cbac:	000b8813          	mv	a6,s7
    cbb0:	00200793          	li	a5,2
    cbb4:	60fc0863          	beq	s8,a5,d1c4 <__divdf3+0x86c>
    cbb8:	00300793          	li	a5,3
    cbbc:	f6fc06e3          	beq	s8,a5,cb28 <__divdf3+0x1d0>
    cbc0:	00100793          	li	a5,1
    cbc4:	00090a13          	mv	s4,s2
    cbc8:	eefc0ee3          	beq	s8,a5,cac4 <__divdf3+0x16c>
    cbcc:	3ff98793          	add	a5,s3,1023
    cbd0:	3cf05263          	blez	a5,cf94 <__divdf3+0x63c>
    cbd4:	00787713          	and	a4,a6,7
    cbd8:	5c071663          	bnez	a4,d1a4 <__divdf3+0x84c>
    cbdc:	00741713          	sll	a4,s0,0x7
    cbe0:	00075a63          	bgez	a4,cbf4 <__divdf3+0x29c>
    cbe4:	ff0007b7          	lui	a5,0xff000
    cbe8:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cbec:	00f47433          	and	s0,s0,a5
    cbf0:	40098793          	add	a5,s3,1024
    cbf4:	7fe00713          	li	a4,2046
    cbf8:	f2f740e3          	blt	a4,a5,cb18 <__divdf3+0x1c0>
    cbfc:	00385813          	srl	a6,a6,0x3
    cc00:	01d41713          	sll	a4,s0,0x1d
    cc04:	00941693          	sll	a3,s0,0x9
    cc08:	01076733          	or	a4,a4,a6
    cc0c:	00c6d693          	srl	a3,a3,0xc
    cc10:	7ff7f793          	and	a5,a5,2047
    cc14:	ebdff06f          	j	cad0 <__divdf3+0x178>
    cc18:	00078c13          	mv	s8,a5
    cc1c:	f95ff06f          	j	cbb0 <__divdf3+0x258>
    cc20:	00048b13          	mv	s6,s1
    cc24:	00050b93          	mv	s7,a0
    cc28:	00c00493          	li	s1,12
    cc2c:	7ff00993          	li	s3,2047
    cc30:	00300c13          	li	s8,3
    cc34:	da1ff06f          	j	c9d4 <__divdf3+0x7c>
    cc38:	0014e493          	or	s1,s1,1
    cc3c:	00000413          	li	s0,0
    cc40:	00100793          	li	a5,1
    cc44:	dd5ff06f          	j	ca18 <__divdf3+0xc0>
    cc48:	0034e493          	or	s1,s1,3
    cc4c:	000a0813          	mv	a6,s4
    cc50:	00300793          	li	a5,3
    cc54:	dc5ff06f          	j	ca18 <__divdf3+0xc0>
    cc58:	00000b93          	li	s7,0
    cc5c:	00400493          	li	s1,4
    cc60:	00000993          	li	s3,0
    cc64:	00100c13          	li	s8,1
    cc68:	d6dff06f          	j	c9d4 <__divdf3+0x7c>
    cc6c:	03912223          	sw	s9,36(sp)
    cc70:	03a12023          	sw	s10,32(sp)
    cc74:	01b12e23          	sw	s11,28(sp)
    cc78:	3b646a63          	bltu	s0,s6,d02c <__divdf3+0x6d4>
    cc7c:	3a8b0663          	beq	s6,s0,d028 <__divdf3+0x6d0>
    cc80:	fff98993          	add	s3,s3,-1
    cc84:	000b8c13          	mv	s8,s7
    cc88:	000b0493          	mv	s1,s6
    cc8c:	00000d13          	li	s10,0
    cc90:	01885c93          	srl	s9,a6,0x18
    cc94:	00841413          	sll	s0,s0,0x8
    cc98:	01045913          	srl	s2,s0,0x10
    cc9c:	008cecb3          	or	s9,s9,s0
    cca0:	00090593          	mv	a1,s2
    cca4:	00048513          	mv	a0,s1
    cca8:	010c9b13          	sll	s6,s9,0x10
    ccac:	00881a93          	sll	s5,a6,0x8
    ccb0:	010b5b13          	srl	s6,s6,0x10
    ccb4:	771010ef          	jal	ec24 <__hidden___udivsi3>
    ccb8:	00050593          	mv	a1,a0
    ccbc:	00050413          	mv	s0,a0
    ccc0:	000b0513          	mv	a0,s6
    ccc4:	69d010ef          	jal	eb60 <__mulsi3>
    ccc8:	00050793          	mv	a5,a0
    cccc:	00090593          	mv	a1,s2
    ccd0:	00048513          	mv	a0,s1
    ccd4:	00078493          	mv	s1,a5
    ccd8:	795010ef          	jal	ec6c <__umodsi3>
    ccdc:	01051513          	sll	a0,a0,0x10
    cce0:	010c5793          	srl	a5,s8,0x10
    cce4:	00a7e7b3          	or	a5,a5,a0
    cce8:	0097fa63          	bgeu	a5,s1,ccfc <__divdf3+0x3a4>
    ccec:	00fc87b3          	add	a5,s9,a5
    ccf0:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    ccf4:	3b97fe63          	bgeu	a5,s9,d0b0 <__divdf3+0x758>
    ccf8:	00070413          	mv	s0,a4
    ccfc:	409784b3          	sub	s1,a5,s1
    cd00:	00090593          	mv	a1,s2
    cd04:	00048513          	mv	a0,s1
    cd08:	71d010ef          	jal	ec24 <__hidden___udivsi3>
    cd0c:	00050593          	mv	a1,a0
    cd10:	00050b93          	mv	s7,a0
    cd14:	000b0513          	mv	a0,s6
    cd18:	649010ef          	jal	eb60 <__mulsi3>
    cd1c:	00050793          	mv	a5,a0
    cd20:	00090593          	mv	a1,s2
    cd24:	00048513          	mv	a0,s1
    cd28:	00078493          	mv	s1,a5
    cd2c:	741010ef          	jal	ec6c <__umodsi3>
    cd30:	010c1793          	sll	a5,s8,0x10
    cd34:	01051513          	sll	a0,a0,0x10
    cd38:	0107d793          	srl	a5,a5,0x10
    cd3c:	00a7e7b3          	or	a5,a5,a0
    cd40:	0097fa63          	bgeu	a5,s1,cd54 <__divdf3+0x3fc>
    cd44:	00fc87b3          	add	a5,s9,a5
    cd48:	fffb8713          	add	a4,s7,-1
    cd4c:	3597fa63          	bgeu	a5,s9,d0a0 <__divdf3+0x748>
    cd50:	00070b93          	mv	s7,a4
    cd54:	00010337          	lui	t1,0x10
    cd58:	01041413          	sll	s0,s0,0x10
    cd5c:	01746433          	or	s0,s0,s7
    cd60:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    cd64:	01b478b3          	and	a7,s0,s11
    cd68:	01bafdb3          	and	s11,s5,s11
    cd6c:	40978bb3          	sub	s7,a5,s1
    cd70:	010adc13          	srl	s8,s5,0x10
    cd74:	01045793          	srl	a5,s0,0x10
    cd78:	00088513          	mv	a0,a7
    cd7c:	000d8593          	mv	a1,s11
    cd80:	5e1010ef          	jal	eb60 <__mulsi3>
    cd84:	00050813          	mv	a6,a0
    cd88:	000c0593          	mv	a1,s8
    cd8c:	00088513          	mv	a0,a7
    cd90:	5d1010ef          	jal	eb60 <__mulsi3>
    cd94:	00050893          	mv	a7,a0
    cd98:	000d8593          	mv	a1,s11
    cd9c:	00078513          	mv	a0,a5
    cda0:	5c1010ef          	jal	eb60 <__mulsi3>
    cda4:	00050e13          	mv	t3,a0
    cda8:	000c0593          	mv	a1,s8
    cdac:	00078513          	mv	a0,a5
    cdb0:	5b1010ef          	jal	eb60 <__mulsi3>
    cdb4:	01085793          	srl	a5,a6,0x10
    cdb8:	01c888b3          	add	a7,a7,t3
    cdbc:	011787b3          	add	a5,a5,a7
    cdc0:	01c7f463          	bgeu	a5,t3,cdc8 <__divdf3+0x470>
    cdc4:	00650533          	add	a0,a0,t1
    cdc8:	00010637          	lui	a2,0x10
    cdcc:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    cdd0:	00c7f4b3          	and	s1,a5,a2
    cdd4:	0107d693          	srl	a3,a5,0x10
    cdd8:	01049493          	sll	s1,s1,0x10
    cddc:	00c87833          	and	a6,a6,a2
    cde0:	00a687b3          	add	a5,a3,a0
    cde4:	010484b3          	add	s1,s1,a6
    cde8:	20fbea63          	bltu	s7,a5,cffc <__divdf3+0x6a4>
    cdec:	20fb8663          	beq	s7,a5,cff8 <__divdf3+0x6a0>
    cdf0:	409d04b3          	sub	s1,s10,s1
    cdf4:	40fb8bb3          	sub	s7,s7,a5
    cdf8:	009d3d33          	sltu	s10,s10,s1
    cdfc:	41ab8bb3          	sub	s7,s7,s10
    ce00:	377c8a63          	beq	s9,s7,d174 <__divdf3+0x81c>
    ce04:	00090593          	mv	a1,s2
    ce08:	000b8513          	mv	a0,s7
    ce0c:	619010ef          	jal	ec24 <__hidden___udivsi3>
    ce10:	00050593          	mv	a1,a0
    ce14:	00a12623          	sw	a0,12(sp)
    ce18:	00050d13          	mv	s10,a0
    ce1c:	000b0513          	mv	a0,s6
    ce20:	541010ef          	jal	eb60 <__mulsi3>
    ce24:	00050793          	mv	a5,a0
    ce28:	00090593          	mv	a1,s2
    ce2c:	000b8513          	mv	a0,s7
    ce30:	00078b93          	mv	s7,a5
    ce34:	639010ef          	jal	ec6c <__umodsi3>
    ce38:	01051513          	sll	a0,a0,0x10
    ce3c:	0104d793          	srl	a5,s1,0x10
    ce40:	00a7e7b3          	or	a5,a5,a0
    ce44:	0377f063          	bgeu	a5,s7,ce64 <__divdf3+0x50c>
    ce48:	00fc87b3          	add	a5,s9,a5
    ce4c:	fffd0693          	add	a3,s10,-1
    ce50:	3797e263          	bltu	a5,s9,d1b4 <__divdf3+0x85c>
    ce54:	3777f063          	bgeu	a5,s7,d1b4 <__divdf3+0x85c>
    ce58:	ffed0713          	add	a4,s10,-2
    ce5c:	00e12623          	sw	a4,12(sp)
    ce60:	019787b3          	add	a5,a5,s9
    ce64:	41778bb3          	sub	s7,a5,s7
    ce68:	00090593          	mv	a1,s2
    ce6c:	000b8513          	mv	a0,s7
    ce70:	5b5010ef          	jal	ec24 <__hidden___udivsi3>
    ce74:	00050593          	mv	a1,a0
    ce78:	00050d13          	mv	s10,a0
    ce7c:	000b0513          	mv	a0,s6
    ce80:	4e1010ef          	jal	eb60 <__mulsi3>
    ce84:	00050793          	mv	a5,a0
    ce88:	00090593          	mv	a1,s2
    ce8c:	000b8513          	mv	a0,s7
    ce90:	00078913          	mv	s2,a5
    ce94:	01049493          	sll	s1,s1,0x10
    ce98:	5d5010ef          	jal	ec6c <__umodsi3>
    ce9c:	01051513          	sll	a0,a0,0x10
    cea0:	0104d493          	srl	s1,s1,0x10
    cea4:	00a4e4b3          	or	s1,s1,a0
    cea8:	0124fe63          	bgeu	s1,s2,cec4 <__divdf3+0x56c>
    ceac:	009c84b3          	add	s1,s9,s1
    ceb0:	fffd0793          	add	a5,s10,-1
    ceb4:	3194e463          	bltu	s1,s9,d1bc <__divdf3+0x864>
    ceb8:	3124f263          	bgeu	s1,s2,d1bc <__divdf3+0x864>
    cebc:	ffed0d13          	add	s10,s10,-2
    cec0:	019484b3          	add	s1,s1,s9
    cec4:	00c12783          	lw	a5,12(sp)
    cec8:	412484b3          	sub	s1,s1,s2
    cecc:	000d8593          	mv	a1,s11
    ced0:	01079813          	sll	a6,a5,0x10
    ced4:	01a86833          	or	a6,a6,s10
    ced8:	01081313          	sll	t1,a6,0x10
    cedc:	01035313          	srl	t1,t1,0x10
    cee0:	01085793          	srl	a5,a6,0x10
    cee4:	00030513          	mv	a0,t1
    cee8:	479010ef          	jal	eb60 <__mulsi3>
    ceec:	00050893          	mv	a7,a0
    cef0:	000c0593          	mv	a1,s8
    cef4:	00030513          	mv	a0,t1
    cef8:	469010ef          	jal	eb60 <__mulsi3>
    cefc:	00050313          	mv	t1,a0
    cf00:	000d8593          	mv	a1,s11
    cf04:	00078513          	mv	a0,a5
    cf08:	459010ef          	jal	eb60 <__mulsi3>
    cf0c:	00050e13          	mv	t3,a0
    cf10:	000c0593          	mv	a1,s8
    cf14:	00078513          	mv	a0,a5
    cf18:	449010ef          	jal	eb60 <__mulsi3>
    cf1c:	0108d793          	srl	a5,a7,0x10
    cf20:	01c30333          	add	t1,t1,t3
    cf24:	006787b3          	add	a5,a5,t1
    cf28:	01c7f663          	bgeu	a5,t3,cf34 <__divdf3+0x5dc>
    cf2c:	00010737          	lui	a4,0x10
    cf30:	00e50533          	add	a0,a0,a4
    cf34:	000106b7          	lui	a3,0x10
    cf38:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    cf3c:	0107d713          	srl	a4,a5,0x10
    cf40:	00d7f7b3          	and	a5,a5,a3
    cf44:	01079793          	sll	a5,a5,0x10
    cf48:	00d8f8b3          	and	a7,a7,a3
    cf4c:	00a70733          	add	a4,a4,a0
    cf50:	011787b3          	add	a5,a5,a7
    cf54:	02e4e063          	bltu	s1,a4,cf74 <__divdf3+0x61c>
    cf58:	00e48c63          	beq	s1,a4,cf70 <__divdf3+0x618>
    cf5c:	02412c83          	lw	s9,36(sp)
    cf60:	02012d03          	lw	s10,32(sp)
    cf64:	01c12d83          	lw	s11,28(sp)
    cf68:	00186813          	or	a6,a6,1
    cf6c:	c61ff06f          	j	cbcc <__divdf3+0x274>
    cf70:	1c078a63          	beqz	a5,d144 <__divdf3+0x7ec>
    cf74:	009c84b3          	add	s1,s9,s1
    cf78:	fff80613          	add	a2,a6,-1
    cf7c:	00048693          	mv	a3,s1
    cf80:	1b94ec63          	bltu	s1,s9,d138 <__divdf3+0x7e0>
    cf84:	24e4ea63          	bltu	s1,a4,d1d8 <__divdf3+0x880>
    cf88:	26e48863          	beq	s1,a4,d1f8 <__divdf3+0x8a0>
    cf8c:	00060813          	mv	a6,a2
    cf90:	fcdff06f          	j	cf5c <__divdf3+0x604>
    cf94:	00100713          	li	a4,1
    cf98:	b20790e3          	bnez	a5,cab8 <__divdf3+0x160>
    cf9c:	41e98793          	add	a5,s3,1054
    cfa0:	00f816b3          	sll	a3,a6,a5
    cfa4:	00d036b3          	snez	a3,a3
    cfa8:	00f417b3          	sll	a5,s0,a5
    cfac:	00f6e7b3          	or	a5,a3,a5
    cfb0:	00e85833          	srl	a6,a6,a4
    cfb4:	00f86833          	or	a6,a6,a5
    cfb8:	00787793          	and	a5,a6,7
    cfbc:	00e45433          	srl	s0,s0,a4
    cfc0:	02078063          	beqz	a5,cfe0 <__divdf3+0x688>
    cfc4:	00f87793          	and	a5,a6,15
    cfc8:	00400713          	li	a4,4
    cfcc:	00e78a63          	beq	a5,a4,cfe0 <__divdf3+0x688>
    cfd0:	00480793          	add	a5,a6,4
    cfd4:	0107b833          	sltu	a6,a5,a6
    cfd8:	01040433          	add	s0,s0,a6
    cfdc:	00078813          	mv	a6,a5
    cfe0:	00841613          	sll	a2,s0,0x8
    cfe4:	00100793          	li	a5,1
    cfe8:	00000693          	li	a3,0
    cfec:	00000713          	li	a4,0
    cff0:	ae0640e3          	bltz	a2,cad0 <__divdf3+0x178>
    cff4:	1280006f          	j	d11c <__divdf3+0x7c4>
    cff8:	de9d7ce3          	bgeu	s10,s1,cdf0 <__divdf3+0x498>
    cffc:	015d06b3          	add	a3,s10,s5
    d000:	01a6b633          	sltu	a2,a3,s10
    d004:	019605b3          	add	a1,a2,s9
    d008:	00bb8bb3          	add	s7,s7,a1
    d00c:	00068d13          	mv	s10,a3
    d010:	fff40593          	add	a1,s0,-1
    d014:	077cfe63          	bgeu	s9,s7,d090 <__divdf3+0x738>
    d018:	14fbe063          	bltu	s7,a5,d158 <__divdf3+0x800>
    d01c:	13778c63          	beq	a5,s7,d154 <__divdf3+0x7fc>
    d020:	00058413          	mv	s0,a1
    d024:	dcdff06f          	j	cdf0 <__divdf3+0x498>
    d028:	c50bece3          	bltu	s7,a6,cc80 <__divdf3+0x328>
    d02c:	01fb1c13          	sll	s8,s6,0x1f
    d030:	001bd713          	srl	a4,s7,0x1
    d034:	001b5493          	srl	s1,s6,0x1
    d038:	00ec6c33          	or	s8,s8,a4
    d03c:	01fb9d13          	sll	s10,s7,0x1f
    d040:	c51ff06f          	j	cc90 <__divdf3+0x338>
    d044:	000a0513          	mv	a0,s4
    d048:	489010ef          	jal	ecd0 <__clzsi2>
    d04c:	01550693          	add	a3,a0,21
    d050:	01c00713          	li	a4,28
    d054:	02050793          	add	a5,a0,32
    d058:	a2d75ae3          	bge	a4,a3,ca8c <__divdf3+0x134>
    d05c:	ff850513          	add	a0,a0,-8
    d060:	00000813          	li	a6,0
    d064:	00aa1433          	sll	s0,s4,a0
    d068:	a41ff06f          	j	caa8 <__divdf3+0x150>
    d06c:	465010ef          	jal	ecd0 <__clzsi2>
    d070:	01550793          	add	a5,a0,21
    d074:	01c00693          	li	a3,28
    d078:	02050713          	add	a4,a0,32
    d07c:	acf6dee3          	bge	a3,a5,cb58 <__divdf3+0x200>
    d080:	ff850493          	add	s1,a0,-8
    d084:	00941b33          	sll	s6,s0,s1
    d088:	00000b93          	li	s7,0
    d08c:	ae9ff06f          	j	cb74 <__divdf3+0x21c>
    d090:	f97c98e3          	bne	s9,s7,d020 <__divdf3+0x6c8>
    d094:	f80602e3          	beqz	a2,d018 <__divdf3+0x6c0>
    d098:	00058413          	mv	s0,a1
    d09c:	d55ff06f          	j	cdf0 <__divdf3+0x498>
    d0a0:	ca97f8e3          	bgeu	a5,s1,cd50 <__divdf3+0x3f8>
    d0a4:	ffeb8b93          	add	s7,s7,-2
    d0a8:	019787b3          	add	a5,a5,s9
    d0ac:	ca9ff06f          	j	cd54 <__divdf3+0x3fc>
    d0b0:	c497f4e3          	bgeu	a5,s1,ccf8 <__divdf3+0x3a0>
    d0b4:	ffe40413          	add	s0,s0,-2
    d0b8:	019787b3          	add	a5,a5,s9
    d0bc:	c41ff06f          	j	ccfc <__divdf3+0x3a4>
    d0c0:	01f00693          	li	a3,31
    d0c4:	ece6dce3          	bge	a3,a4,cf9c <__divdf3+0x644>
    d0c8:	fe100693          	li	a3,-31
    d0cc:	40f686b3          	sub	a3,a3,a5
    d0d0:	02000793          	li	a5,32
    d0d4:	00d456b3          	srl	a3,s0,a3
    d0d8:	00f70863          	beq	a4,a5,d0e8 <__divdf3+0x790>
    d0dc:	43e98793          	add	a5,s3,1086
    d0e0:	00f417b3          	sll	a5,s0,a5
    d0e4:	00f86833          	or	a6,a6,a5
    d0e8:	01003833          	snez	a6,a6
    d0ec:	00d86833          	or	a6,a6,a3
    d0f0:	00787713          	and	a4,a6,7
    d0f4:	00000693          	li	a3,0
    d0f8:	02070863          	beqz	a4,d128 <__divdf3+0x7d0>
    d0fc:	00f87793          	and	a5,a6,15
    d100:	00400713          	li	a4,4
    d104:	00000413          	li	s0,0
    d108:	00e78a63          	beq	a5,a4,d11c <__divdf3+0x7c4>
    d10c:	00480793          	add	a5,a6,4
    d110:	0107b833          	sltu	a6,a5,a6
    d114:	01003433          	snez	s0,a6
    d118:	00078813          	mv	a6,a5
    d11c:	00941693          	sll	a3,s0,0x9
    d120:	01d41713          	sll	a4,s0,0x1d
    d124:	00c6d693          	srl	a3,a3,0xc
    d128:	00385813          	srl	a6,a6,0x3
    d12c:	00e86733          	or	a4,a6,a4
    d130:	00000793          	li	a5,0
    d134:	99dff06f          	j	cad0 <__divdf3+0x178>
    d138:	00060813          	mv	a6,a2
    d13c:	e2e690e3          	bne	a3,a4,cf5c <__divdf3+0x604>
    d140:	e1579ee3          	bne	a5,s5,cf5c <__divdf3+0x604>
    d144:	02412c83          	lw	s9,36(sp)
    d148:	02012d03          	lw	s10,32(sp)
    d14c:	01c12d83          	lw	s11,28(sp)
    d150:	a7dff06f          	j	cbcc <__divdf3+0x274>
    d154:	ec96f6e3          	bgeu	a3,s1,d020 <__divdf3+0x6c8>
    d158:	00da86b3          	add	a3,s5,a3
    d15c:	0156b633          	sltu	a2,a3,s5
    d160:	01960633          	add	a2,a2,s9
    d164:	ffe40413          	add	s0,s0,-2
    d168:	00068d13          	mv	s10,a3
    d16c:	00cb8bb3          	add	s7,s7,a2
    d170:	c81ff06f          	j	cdf0 <__divdf3+0x498>
    d174:	c0200713          	li	a4,-1022
    d178:	02412c83          	lw	s9,36(sp)
    d17c:	02012d03          	lw	s10,32(sp)
    d180:	01c12d83          	lw	s11,28(sp)
    d184:	3ff98793          	add	a5,s3,1023
    d188:	fff00813          	li	a6,-1
    d18c:	e0e9c4e3          	blt	s3,a4,cf94 <__divdf3+0x63c>
    d190:	00480713          	add	a4,a6,4
    d194:	01073833          	sltu	a6,a4,a6
    d198:	01040433          	add	s0,s0,a6
    d19c:	00070813          	mv	a6,a4
    d1a0:	a3dff06f          	j	cbdc <__divdf3+0x284>
    d1a4:	00f87713          	and	a4,a6,15
    d1a8:	00400693          	li	a3,4
    d1ac:	a2d708e3          	beq	a4,a3,cbdc <__divdf3+0x284>
    d1b0:	fe1ff06f          	j	d190 <__divdf3+0x838>
    d1b4:	00d12623          	sw	a3,12(sp)
    d1b8:	cadff06f          	j	ce64 <__divdf3+0x50c>
    d1bc:	00078d13          	mv	s10,a5
    d1c0:	d05ff06f          	j	cec4 <__divdf3+0x56c>
    d1c4:	00090a13          	mv	s4,s2
    d1c8:	7ff00793          	li	a5,2047
    d1cc:	00000693          	li	a3,0
    d1d0:	00000713          	li	a4,0
    d1d4:	8fdff06f          	j	cad0 <__divdf3+0x178>
    d1d8:	001a9613          	sll	a2,s5,0x1
    d1dc:	015636b3          	sltu	a3,a2,s5
    d1e0:	019686b3          	add	a3,a3,s9
    d1e4:	00d486b3          	add	a3,s1,a3
    d1e8:	ffe80813          	add	a6,a6,-2
    d1ec:	00060a93          	mv	s5,a2
    d1f0:	f4e688e3          	beq	a3,a4,d140 <__divdf3+0x7e8>
    d1f4:	d69ff06f          	j	cf5c <__divdf3+0x604>
    d1f8:	fefae0e3          	bltu	s5,a5,d1d8 <__divdf3+0x880>
    d1fc:	00060813          	mv	a6,a2
    d200:	f41ff06f          	j	d140 <__divdf3+0x7e8>

0000d204 <__eqdf2>:
    d204:	0145d713          	srl	a4,a1,0x14
    d208:	001007b7          	lui	a5,0x100
    d20c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d210:	0146d813          	srl	a6,a3,0x14
    d214:	7ff77713          	and	a4,a4,2047
    d218:	7ff00313          	li	t1,2047
    d21c:	00b7fe33          	and	t3,a5,a1
    d220:	00050893          	mv	a7,a0
    d224:	00d7f7b3          	and	a5,a5,a3
    d228:	01f5d593          	srl	a1,a1,0x1f
    d22c:	7ff87813          	and	a6,a6,2047
    d230:	01f6d693          	srl	a3,a3,0x1f
    d234:	00100513          	li	a0,1
    d238:	00670c63          	beq	a4,t1,d250 <__eqdf2+0x4c>
    d23c:	00680863          	beq	a6,t1,d24c <__eqdf2+0x48>
    d240:	01071463          	bne	a4,a6,d248 <__eqdf2+0x44>
    d244:	02fe0663          	beq	t3,a5,d270 <__eqdf2+0x6c>
    d248:	00008067          	ret
    d24c:	00008067          	ret
    d250:	fee81ce3          	bne	a6,a4,d248 <__eqdf2+0x44>
    d254:	00fe67b3          	or	a5,t3,a5
    d258:	00c7e7b3          	or	a5,a5,a2
    d25c:	0117e7b3          	or	a5,a5,a7
    d260:	fe0794e3          	bnez	a5,d248 <__eqdf2+0x44>
    d264:	40d585b3          	sub	a1,a1,a3
    d268:	00b03533          	snez	a0,a1
    d26c:	00008067          	ret
    d270:	fcc89ce3          	bne	a7,a2,d248 <__eqdf2+0x44>
    d274:	00d58a63          	beq	a1,a3,d288 <__eqdf2+0x84>
    d278:	fc0718e3          	bnez	a4,d248 <__eqdf2+0x44>
    d27c:	011e6e33          	or	t3,t3,a7
    d280:	01c03533          	snez	a0,t3
    d284:	00008067          	ret
    d288:	00000513          	li	a0,0
    d28c:	00008067          	ret

0000d290 <__gedf2>:
    d290:	0145d893          	srl	a7,a1,0x14
    d294:	001007b7          	lui	a5,0x100
    d298:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d29c:	0146d713          	srl	a4,a3,0x14
    d2a0:	7ff8f893          	and	a7,a7,2047
    d2a4:	7ff00e13          	li	t3,2047
    d2a8:	00b7f333          	and	t1,a5,a1
    d2ac:	00050813          	mv	a6,a0
    d2b0:	00050e93          	mv	t4,a0
    d2b4:	00d7f7b3          	and	a5,a5,a3
    d2b8:	01f5d593          	srl	a1,a1,0x1f
    d2bc:	00060f13          	mv	t5,a2
    d2c0:	7ff77513          	and	a0,a4,2047
    d2c4:	01f6d693          	srl	a3,a3,0x1f
    d2c8:	05c88863          	beq	a7,t3,d318 <__gedf2+0x88>
    d2cc:	03c50463          	beq	a0,t3,d2f4 <__gedf2+0x64>
    d2d0:	06089a63          	bnez	a7,d344 <__gedf2+0xb4>
    d2d4:	01036833          	or	a6,t1,a6
    d2d8:	06051063          	bnez	a0,d338 <__gedf2+0xa8>
    d2dc:	00c7e633          	or	a2,a5,a2
    d2e0:	08060c63          	beqz	a2,d378 <__gedf2+0xe8>
    d2e4:	0a081263          	bnez	a6,d388 <__gedf2+0xf8>
    d2e8:	00100513          	li	a0,1
    d2ec:	08068263          	beqz	a3,d370 <__gedf2+0xe0>
    d2f0:	00008067          	ret
    d2f4:	00c7e633          	or	a2,a5,a2
    d2f8:	08061463          	bnez	a2,d380 <__gedf2+0xf0>
    d2fc:	00089663          	bnez	a7,d308 <__gedf2+0x78>
    d300:	01036333          	or	t1,t1,a6
    d304:	fe0302e3          	beqz	t1,d2e8 <__gedf2+0x58>
    d308:	06d58063          	beq	a1,a3,d368 <__gedf2+0xd8>
    d30c:	06059263          	bnez	a1,d370 <__gedf2+0xe0>
    d310:	00100513          	li	a0,1
    d314:	00008067          	ret
    d318:	01036333          	or	t1,t1,a6
    d31c:	06031263          	bnez	t1,d380 <__gedf2+0xf0>
    d320:	ff1516e3          	bne	a0,a7,d30c <__gedf2+0x7c>
    d324:	00c7e7b3          	or	a5,a5,a2
    d328:	04079c63          	bnez	a5,d380 <__gedf2+0xf0>
    d32c:	fed590e3          	bne	a1,a3,d30c <__gedf2+0x7c>
    d330:	00000513          	li	a0,0
    d334:	00008067          	ret
    d338:	fa0808e3          	beqz	a6,d2e8 <__gedf2+0x58>
    d33c:	fcd598e3          	bne	a1,a3,d30c <__gedf2+0x7c>
    d340:	0280006f          	j	d368 <__gedf2+0xd8>
    d344:	fc0504e3          	beqz	a0,d30c <__gedf2+0x7c>
    d348:	fcd592e3          	bne	a1,a3,d30c <__gedf2+0x7c>
    d34c:	fd1540e3          	blt	a0,a7,d30c <__gedf2+0x7c>
    d350:	00a8cc63          	blt	a7,a0,d368 <__gedf2+0xd8>
    d354:	fa67ece3          	bltu	a5,t1,d30c <__gedf2+0x7c>
    d358:	00f31863          	bne	t1,a5,d368 <__gedf2+0xd8>
    d35c:	fbdf68e3          	bltu	t5,t4,d30c <__gedf2+0x7c>
    d360:	00000513          	li	a0,0
    d364:	f9eef6e3          	bgeu	t4,t5,d2f0 <__gedf2+0x60>
    d368:	00100513          	li	a0,1
    d36c:	f80592e3          	bnez	a1,d2f0 <__gedf2+0x60>
    d370:	fff00513          	li	a0,-1
    d374:	00008067          	ret
    d378:	f8081ae3          	bnez	a6,d30c <__gedf2+0x7c>
    d37c:	00008067          	ret
    d380:	ffe00513          	li	a0,-2
    d384:	00008067          	ret
    d388:	fcd586e3          	beq	a1,a3,d354 <__gedf2+0xc4>
    d38c:	f81ff06f          	j	d30c <__gedf2+0x7c>

0000d390 <__ledf2>:
    d390:	0145d893          	srl	a7,a1,0x14
    d394:	001007b7          	lui	a5,0x100
    d398:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d39c:	0146d713          	srl	a4,a3,0x14
    d3a0:	7ff8f893          	and	a7,a7,2047
    d3a4:	7ff00313          	li	t1,2047
    d3a8:	00b7fe33          	and	t3,a5,a1
    d3ac:	00050813          	mv	a6,a0
    d3b0:	00050e93          	mv	t4,a0
    d3b4:	00d7f7b3          	and	a5,a5,a3
    d3b8:	01f5d593          	srl	a1,a1,0x1f
    d3bc:	00060f13          	mv	t5,a2
    d3c0:	7ff77513          	and	a0,a4,2047
    d3c4:	01f6d693          	srl	a3,a3,0x1f
    d3c8:	04688a63          	beq	a7,t1,d41c <__ledf2+0x8c>
    d3cc:	02650463          	beq	a0,t1,d3f4 <__ledf2+0x64>
    d3d0:	06089863          	bnez	a7,d440 <__ledf2+0xb0>
    d3d4:	010e6833          	or	a6,t3,a6
    d3d8:	08051e63          	bnez	a0,d474 <__ledf2+0xe4>
    d3dc:	00c7e633          	or	a2,a5,a2
    d3e0:	0a060463          	beqz	a2,d488 <__ledf2+0xf8>
    d3e4:	0a081663          	bnez	a6,d490 <__ledf2+0x100>
    d3e8:	00100513          	li	a0,1
    d3ec:	08068063          	beqz	a3,d46c <__ledf2+0xdc>
    d3f0:	00008067          	ret
    d3f4:	00c7e633          	or	a2,a5,a2
    d3f8:	00200513          	li	a0,2
    d3fc:	fe061ae3          	bnez	a2,d3f0 <__ledf2+0x60>
    d400:	00089663          	bnez	a7,d40c <__ledf2+0x7c>
    d404:	010e6e33          	or	t3,t3,a6
    d408:	fe0e00e3          	beqz	t3,d3e8 <__ledf2+0x58>
    d40c:	04d58c63          	beq	a1,a3,d464 <__ledf2+0xd4>
    d410:	04059e63          	bnez	a1,d46c <__ledf2+0xdc>
    d414:	00100513          	li	a0,1
    d418:	00008067          	ret
    d41c:	010e6e33          	or	t3,t3,a6
    d420:	060e1063          	bnez	t3,d480 <__ledf2+0xf0>
    d424:	ff1516e3          	bne	a0,a7,d410 <__ledf2+0x80>
    d428:	00c7e7b3          	or	a5,a5,a2
    d42c:	00200513          	li	a0,2
    d430:	fc0790e3          	bnez	a5,d3f0 <__ledf2+0x60>
    d434:	fcd59ee3          	bne	a1,a3,d410 <__ledf2+0x80>
    d438:	00000513          	li	a0,0
    d43c:	00008067          	ret
    d440:	fc0508e3          	beqz	a0,d410 <__ledf2+0x80>
    d444:	fcd596e3          	bne	a1,a3,d410 <__ledf2+0x80>
    d448:	fd1544e3          	blt	a0,a7,d410 <__ledf2+0x80>
    d44c:	00a8cc63          	blt	a7,a0,d464 <__ledf2+0xd4>
    d450:	fdc7e0e3          	bltu	a5,t3,d410 <__ledf2+0x80>
    d454:	00fe1863          	bne	t3,a5,d464 <__ledf2+0xd4>
    d458:	fbdf6ce3          	bltu	t5,t4,d410 <__ledf2+0x80>
    d45c:	00000513          	li	a0,0
    d460:	f9eef8e3          	bgeu	t4,t5,d3f0 <__ledf2+0x60>
    d464:	00100513          	li	a0,1
    d468:	f80594e3          	bnez	a1,d3f0 <__ledf2+0x60>
    d46c:	fff00513          	li	a0,-1
    d470:	00008067          	ret
    d474:	f6080ae3          	beqz	a6,d3e8 <__ledf2+0x58>
    d478:	f8d59ce3          	bne	a1,a3,d410 <__ledf2+0x80>
    d47c:	fe9ff06f          	j	d464 <__ledf2+0xd4>
    d480:	00200513          	li	a0,2
    d484:	00008067          	ret
    d488:	f80814e3          	bnez	a6,d410 <__ledf2+0x80>
    d48c:	00008067          	ret
    d490:	fcd580e3          	beq	a1,a3,d450 <__ledf2+0xc0>
    d494:	f7dff06f          	j	d410 <__ledf2+0x80>

0000d498 <__muldf3>:
    d498:	fd010113          	add	sp,sp,-48
    d49c:	0145d793          	srl	a5,a1,0x14
    d4a0:	02812423          	sw	s0,40(sp)
    d4a4:	02912223          	sw	s1,36(sp)
    d4a8:	03212023          	sw	s2,32(sp)
    d4ac:	01312e23          	sw	s3,28(sp)
    d4b0:	01512a23          	sw	s5,20(sp)
    d4b4:	00c59493          	sll	s1,a1,0xc
    d4b8:	02112623          	sw	ra,44(sp)
    d4bc:	01412c23          	sw	s4,24(sp)
    d4c0:	01612823          	sw	s6,16(sp)
    d4c4:	01712623          	sw	s7,12(sp)
    d4c8:	01812423          	sw	s8,8(sp)
    d4cc:	7ff7f793          	and	a5,a5,2047
    d4d0:	00050413          	mv	s0,a0
    d4d4:	00060a93          	mv	s5,a2
    d4d8:	00068993          	mv	s3,a3
    d4dc:	00c4d493          	srl	s1,s1,0xc
    d4e0:	01f5d913          	srl	s2,a1,0x1f
    d4e4:	4e078063          	beqz	a5,d9c4 <__muldf3+0x52c>
    d4e8:	7ff00713          	li	a4,2047
    d4ec:	0ae78663          	beq	a5,a4,d598 <__muldf3+0x100>
    d4f0:	00349693          	sll	a3,s1,0x3
    d4f4:	01d55713          	srl	a4,a0,0x1d
    d4f8:	00d76733          	or	a4,a4,a3
    d4fc:	008006b7          	lui	a3,0x800
    d500:	00d764b3          	or	s1,a4,a3
    d504:	00351a13          	sll	s4,a0,0x3
    d508:	c0178c13          	add	s8,a5,-1023
    d50c:	00000b13          	li	s6,0
    d510:	00000b93          	li	s7,0
    d514:	0149d793          	srl	a5,s3,0x14
    d518:	00c99713          	sll	a4,s3,0xc
    d51c:	7ff7f793          	and	a5,a5,2047
    d520:	000a8e13          	mv	t3,s5
    d524:	00c75413          	srl	s0,a4,0xc
    d528:	01f9d993          	srl	s3,s3,0x1f
    d52c:	0a078063          	beqz	a5,d5cc <__muldf3+0x134>
    d530:	7ff00713          	li	a4,2047
    d534:	14e78e63          	beq	a5,a4,d690 <__muldf3+0x1f8>
    d538:	00341713          	sll	a4,s0,0x3
    d53c:	01dad693          	srl	a3,s5,0x1d
    d540:	00e6e6b3          	or	a3,a3,a4
    d544:	c0178793          	add	a5,a5,-1023
    d548:	00800737          	lui	a4,0x800
    d54c:	00e6e433          	or	s0,a3,a4
    d550:	003a9e13          	sll	t3,s5,0x3
    d554:	01878333          	add	t1,a5,s8
    d558:	00000693          	li	a3,0
    d55c:	00a00793          	li	a5,10
    d560:	00130893          	add	a7,t1,1
    d564:	0b67cc63          	blt	a5,s6,d61c <__muldf3+0x184>
    d568:	013945b3          	xor	a1,s2,s3
    d56c:	00200793          	li	a5,2
    d570:	00058813          	mv	a6,a1
    d574:	1567c663          	blt	a5,s6,d6c0 <__muldf3+0x228>
    d578:	fffb0b13          	add	s6,s6,-1
    d57c:	00100713          	li	a4,1
    d580:	17676063          	bltu	a4,s6,d6e0 <__muldf3+0x248>
    d584:	48f68663          	beq	a3,a5,da10 <__muldf3+0x578>
    d588:	00040493          	mv	s1,s0
    d58c:	000e0a13          	mv	s4,t3
    d590:	00068b93          	mv	s7,a3
    d594:	09c0006f          	j	d630 <__muldf3+0x198>
    d598:	00a4ea33          	or	s4,s1,a0
    d59c:	480a1463          	bnez	s4,da24 <__muldf3+0x58c>
    d5a0:	0149d793          	srl	a5,s3,0x14
    d5a4:	00c99713          	sll	a4,s3,0xc
    d5a8:	7ff7f793          	and	a5,a5,2047
    d5ac:	00000493          	li	s1,0
    d5b0:	00800b13          	li	s6,8
    d5b4:	7ff00c13          	li	s8,2047
    d5b8:	00200b93          	li	s7,2
    d5bc:	000a8e13          	mv	t3,s5
    d5c0:	00c75413          	srl	s0,a4,0xc
    d5c4:	01f9d993          	srl	s3,s3,0x1f
    d5c8:	f60794e3          	bnez	a5,d530 <__muldf3+0x98>
    d5cc:	015467b3          	or	a5,s0,s5
    d5d0:	46078e63          	beqz	a5,da4c <__muldf3+0x5b4>
    d5d4:	54040c63          	beqz	s0,db2c <__muldf3+0x694>
    d5d8:	00040513          	mv	a0,s0
    d5dc:	6f4010ef          	jal	ecd0 <__clzsi2>
    d5e0:	00050313          	mv	t1,a0
    d5e4:	ff550713          	add	a4,a0,-11
    d5e8:	01d00793          	li	a5,29
    d5ec:	ff830e13          	add	t3,t1,-8
    d5f0:	40e787b3          	sub	a5,a5,a4
    d5f4:	00fad7b3          	srl	a5,s5,a5
    d5f8:	01c41733          	sll	a4,s0,t3
    d5fc:	00e7e433          	or	s0,a5,a4
    d600:	01ca9e33          	sll	t3,s5,t3
    d604:	406c0333          	sub	t1,s8,t1
    d608:	c0d30313          	add	t1,t1,-1011
    d60c:	00a00793          	li	a5,10
    d610:	00000693          	li	a3,0
    d614:	00130893          	add	a7,t1,1
    d618:	f567d8e3          	bge	a5,s6,d568 <__muldf3+0xd0>
    d61c:	00090593          	mv	a1,s2
    d620:	00200793          	li	a5,2
    d624:	3efb8663          	beq	s7,a5,da10 <__muldf3+0x578>
    d628:	00300793          	li	a5,3
    d62c:	54fb8863          	beq	s7,a5,db7c <__muldf3+0x6e4>
    d630:	00100793          	li	a5,1
    d634:	00058813          	mv	a6,a1
    d638:	52fb9663          	bne	s7,a5,db64 <__muldf3+0x6cc>
    d63c:	00000793          	li	a5,0
    d640:	00000693          	li	a3,0
    d644:	00000713          	li	a4,0
    d648:	02c12083          	lw	ra,44(sp)
    d64c:	02812403          	lw	s0,40(sp)
    d650:	01479793          	sll	a5,a5,0x14
    d654:	00d7e7b3          	or	a5,a5,a3
    d658:	01f81813          	sll	a6,a6,0x1f
    d65c:	0107e7b3          	or	a5,a5,a6
    d660:	02412483          	lw	s1,36(sp)
    d664:	02012903          	lw	s2,32(sp)
    d668:	01c12983          	lw	s3,28(sp)
    d66c:	01812a03          	lw	s4,24(sp)
    d670:	01412a83          	lw	s5,20(sp)
    d674:	01012b03          	lw	s6,16(sp)
    d678:	00c12b83          	lw	s7,12(sp)
    d67c:	00812c03          	lw	s8,8(sp)
    d680:	00070513          	mv	a0,a4
    d684:	00078593          	mv	a1,a5
    d688:	03010113          	add	sp,sp,48
    d68c:	00008067          	ret
    d690:	01546733          	or	a4,s0,s5
    d694:	7ffc0313          	add	t1,s8,2047
    d698:	3c070663          	beqz	a4,da64 <__muldf3+0x5cc>
    d69c:	00001737          	lui	a4,0x1
    d6a0:	01394833          	xor	a6,s2,s3
    d6a4:	80070713          	add	a4,a4,-2048 # 800 <main+0x4bc>
    d6a8:	003b6b13          	or	s6,s6,3
    d6ac:	00a00693          	li	a3,10
    d6b0:	00080593          	mv	a1,a6
    d6b4:	00ec08b3          	add	a7,s8,a4
    d6b8:	4366cc63          	blt	a3,s6,daf0 <__muldf3+0x658>
    d6bc:	00300693          	li	a3,3
    d6c0:	00100613          	li	a2,1
    d6c4:	01661633          	sll	a2,a2,s6
    d6c8:	53067713          	and	a4,a2,1328
    d6cc:	f4071ae3          	bnez	a4,d620 <__muldf3+0x188>
    d6d0:	24067793          	and	a5,a2,576
    d6d4:	48079063          	bnez	a5,db54 <__muldf3+0x6bc>
    d6d8:	08867613          	and	a2,a2,136
    d6dc:	38061e63          	bnez	a2,da78 <__muldf3+0x5e0>
    d6e0:	00010fb7          	lui	t6,0x10
    d6e4:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d6e8:	005a7f33          	and	t5,s4,t0
    d6ec:	005e72b3          	and	t0,t3,t0
    d6f0:	010a5a13          	srl	s4,s4,0x10
    d6f4:	010e5e13          	srl	t3,t3,0x10
    d6f8:	000f0513          	mv	a0,t5
    d6fc:	00028593          	mv	a1,t0
    d700:	460010ef          	jal	eb60 <__mulsi3>
    d704:	00050713          	mv	a4,a0
    d708:	000e0593          	mv	a1,t3
    d70c:	000f0513          	mv	a0,t5
    d710:	450010ef          	jal	eb60 <__mulsi3>
    d714:	00050793          	mv	a5,a0
    d718:	00028593          	mv	a1,t0
    d71c:	000a0513          	mv	a0,s4
    d720:	440010ef          	jal	eb60 <__mulsi3>
    d724:	00050e93          	mv	t4,a0
    d728:	000e0593          	mv	a1,t3
    d72c:	000a0513          	mv	a0,s4
    d730:	430010ef          	jal	eb60 <__mulsi3>
    d734:	01d786b3          	add	a3,a5,t4
    d738:	01075393          	srl	t2,a4,0x10
    d73c:	00d383b3          	add	t2,t2,a3
    d740:	00050793          	mv	a5,a0
    d744:	01d3f463          	bgeu	t2,t4,d74c <__muldf3+0x2b4>
    d748:	01f507b3          	add	a5,a0,t6
    d74c:	000109b7          	lui	s3,0x10
    d750:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d754:	0123feb3          	and	t4,t2,s2
    d758:	01277733          	and	a4,a4,s2
    d75c:	010e9e93          	sll	t4,t4,0x10
    d760:	01247933          	and	s2,s0,s2
    d764:	0103d393          	srl	t2,t2,0x10
    d768:	00ee8eb3          	add	t4,t4,a4
    d76c:	01045413          	srl	s0,s0,0x10
    d770:	000f0513          	mv	a0,t5
    d774:	00090593          	mv	a1,s2
    d778:	3e8010ef          	jal	eb60 <__mulsi3>
    d77c:	00050f93          	mv	t6,a0
    d780:	00040593          	mv	a1,s0
    d784:	000f0513          	mv	a0,t5
    d788:	3d8010ef          	jal	eb60 <__mulsi3>
    d78c:	00050713          	mv	a4,a0
    d790:	00090593          	mv	a1,s2
    d794:	000a0513          	mv	a0,s4
    d798:	3c8010ef          	jal	eb60 <__mulsi3>
    d79c:	00050f13          	mv	t5,a0
    d7a0:	00040593          	mv	a1,s0
    d7a4:	000a0513          	mv	a0,s4
    d7a8:	3b8010ef          	jal	eb60 <__mulsi3>
    d7ac:	010fd693          	srl	a3,t6,0x10
    d7b0:	01e70733          	add	a4,a4,t5
    d7b4:	00e686b3          	add	a3,a3,a4
    d7b8:	01e6f463          	bgeu	a3,t5,d7c0 <__muldf3+0x328>
    d7bc:	01350533          	add	a0,a0,s3
    d7c0:	00010a37          	lui	s4,0x10
    d7c4:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d7c8:	01e6f733          	and	a4,a3,t5
    d7cc:	01efffb3          	and	t6,t6,t5
    d7d0:	01071713          	sll	a4,a4,0x10
    d7d4:	01f70733          	add	a4,a4,t6
    d7d8:	01e4ff33          	and	t5,s1,t5
    d7dc:	0106d693          	srl	a3,a3,0x10
    d7e0:	00a68fb3          	add	t6,a3,a0
    d7e4:	00e383b3          	add	t2,t2,a4
    d7e8:	0104d493          	srl	s1,s1,0x10
    d7ec:	000f0513          	mv	a0,t5
    d7f0:	00028593          	mv	a1,t0
    d7f4:	36c010ef          	jal	eb60 <__mulsi3>
    d7f8:	00050a93          	mv	s5,a0
    d7fc:	000e0593          	mv	a1,t3
    d800:	000f0513          	mv	a0,t5
    d804:	35c010ef          	jal	eb60 <__mulsi3>
    d808:	00050993          	mv	s3,a0
    d80c:	00028593          	mv	a1,t0
    d810:	00048513          	mv	a0,s1
    d814:	34c010ef          	jal	eb60 <__mulsi3>
    d818:	00050293          	mv	t0,a0
    d81c:	000e0593          	mv	a1,t3
    d820:	00048513          	mv	a0,s1
    d824:	33c010ef          	jal	eb60 <__mulsi3>
    d828:	010ad613          	srl	a2,s5,0x10
    d82c:	005989b3          	add	s3,s3,t0
    d830:	01360633          	add	a2,a2,s3
    d834:	00567463          	bgeu	a2,t0,d83c <__muldf3+0x3a4>
    d838:	01450533          	add	a0,a0,s4
    d83c:	00010a37          	lui	s4,0x10
    d840:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d844:	00d672b3          	and	t0,a2,a3
    d848:	00dafab3          	and	s5,s5,a3
    d84c:	01065613          	srl	a2,a2,0x10
    d850:	01029293          	sll	t0,t0,0x10
    d854:	00a60e33          	add	t3,a2,a0
    d858:	015282b3          	add	t0,t0,s5
    d85c:	000f0513          	mv	a0,t5
    d860:	00090593          	mv	a1,s2
    d864:	2fc010ef          	jal	eb60 <__mulsi3>
    d868:	00050993          	mv	s3,a0
    d86c:	00040593          	mv	a1,s0
    d870:	000f0513          	mv	a0,t5
    d874:	2ec010ef          	jal	eb60 <__mulsi3>
    d878:	00050f13          	mv	t5,a0
    d87c:	00090593          	mv	a1,s2
    d880:	00048513          	mv	a0,s1
    d884:	2dc010ef          	jal	eb60 <__mulsi3>
    d888:	00050913          	mv	s2,a0
    d88c:	00040593          	mv	a1,s0
    d890:	00048513          	mv	a0,s1
    d894:	2cc010ef          	jal	eb60 <__mulsi3>
    d898:	012f06b3          	add	a3,t5,s2
    d89c:	0109d593          	srl	a1,s3,0x10
    d8a0:	00d58433          	add	s0,a1,a3
    d8a4:	00050f13          	mv	t5,a0
    d8a8:	01247463          	bgeu	s0,s2,d8b0 <__muldf3+0x418>
    d8ac:	01450f33          	add	t5,a0,s4
    d8b0:	00010637          	lui	a2,0x10
    d8b4:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x82f>
    d8b8:	00c476b3          	and	a3,s0,a2
    d8bc:	00c9f9b3          	and	s3,s3,a2
    d8c0:	01069693          	sll	a3,a3,0x10
    d8c4:	007787b3          	add	a5,a5,t2
    d8c8:	013686b3          	add	a3,a3,s3
    d8cc:	01f685b3          	add	a1,a3,t6
    d8d0:	00e7b733          	sltu	a4,a5,a4
    d8d4:	00e58733          	add	a4,a1,a4
    d8d8:	005782b3          	add	t0,a5,t0
    d8dc:	01c70633          	add	a2,a4,t3
    d8e0:	00f2b7b3          	sltu	a5,t0,a5
    d8e4:	00f607b3          	add	a5,a2,a5
    d8e8:	00d5b6b3          	sltu	a3,a1,a3
    d8ec:	00b735b3          	sltu	a1,a4,a1
    d8f0:	00b6e6b3          	or	a3,a3,a1
    d8f4:	00e63733          	sltu	a4,a2,a4
    d8f8:	01045593          	srl	a1,s0,0x10
    d8fc:	00c7b633          	sltu	a2,a5,a2
    d900:	00b686b3          	add	a3,a3,a1
    d904:	00929a13          	sll	s4,t0,0x9
    d908:	00c76733          	or	a4,a4,a2
    d90c:	00d70733          	add	a4,a4,a3
    d910:	01da6a33          	or	s4,s4,t4
    d914:	01e70733          	add	a4,a4,t5
    d918:	01403a33          	snez	s4,s4
    d91c:	0172d293          	srl	t0,t0,0x17
    d920:	00971713          	sll	a4,a4,0x9
    d924:	0177d693          	srl	a3,a5,0x17
    d928:	005a6a33          	or	s4,s4,t0
    d92c:	00979793          	sll	a5,a5,0x9
    d930:	00fa6a33          	or	s4,s4,a5
    d934:	00771793          	sll	a5,a4,0x7
    d938:	00d764b3          	or	s1,a4,a3
    d93c:	0207d063          	bgez	a5,d95c <__muldf3+0x4c4>
    d940:	001a5793          	srl	a5,s4,0x1
    d944:	001a7a13          	and	s4,s4,1
    d948:	01f49713          	sll	a4,s1,0x1f
    d94c:	0147e7b3          	or	a5,a5,s4
    d950:	00e7ea33          	or	s4,a5,a4
    d954:	0014d493          	srl	s1,s1,0x1
    d958:	00088313          	mv	t1,a7
    d95c:	3ff30793          	add	a5,t1,1023
    d960:	12f05663          	blez	a5,da8c <__muldf3+0x5f4>
    d964:	007a7713          	and	a4,s4,7
    d968:	02070063          	beqz	a4,d988 <__muldf3+0x4f0>
    d96c:	00fa7713          	and	a4,s4,15
    d970:	00400693          	li	a3,4
    d974:	00d70a63          	beq	a4,a3,d988 <__muldf3+0x4f0>
    d978:	004a0713          	add	a4,s4,4
    d97c:	01473a33          	sltu	s4,a4,s4
    d980:	014484b3          	add	s1,s1,s4
    d984:	00070a13          	mv	s4,a4
    d988:	00749713          	sll	a4,s1,0x7
    d98c:	00075a63          	bgez	a4,d9a0 <__muldf3+0x508>
    d990:	ff0007b7          	lui	a5,0xff000
    d994:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    d998:	00f4f4b3          	and	s1,s1,a5
    d99c:	40030793          	add	a5,t1,1024
    d9a0:	7fe00713          	li	a4,2046
    d9a4:	1cf74463          	blt	a4,a5,db6c <__muldf3+0x6d4>
    d9a8:	003a5a13          	srl	s4,s4,0x3
    d9ac:	01d49713          	sll	a4,s1,0x1d
    d9b0:	00949693          	sll	a3,s1,0x9
    d9b4:	01476733          	or	a4,a4,s4
    d9b8:	00c6d693          	srl	a3,a3,0xc
    d9bc:	7ff7f793          	and	a5,a5,2047
    d9c0:	c89ff06f          	j	d648 <__muldf3+0x1b0>
    d9c4:	00a4ea33          	or	s4,s1,a0
    d9c8:	060a0863          	beqz	s4,da38 <__muldf3+0x5a0>
    d9cc:	12048e63          	beqz	s1,db08 <__muldf3+0x670>
    d9d0:	00048513          	mv	a0,s1
    d9d4:	2fc010ef          	jal	ecd0 <__clzsi2>
    d9d8:	00050713          	mv	a4,a0
    d9dc:	ff550693          	add	a3,a0,-11
    d9e0:	01d00793          	li	a5,29
    d9e4:	ff870a13          	add	s4,a4,-8
    d9e8:	40d787b3          	sub	a5,a5,a3
    d9ec:	00f457b3          	srl	a5,s0,a5
    d9f0:	014496b3          	sll	a3,s1,s4
    d9f4:	00d7e4b3          	or	s1,a5,a3
    d9f8:	01441a33          	sll	s4,s0,s4
    d9fc:	c0d00793          	li	a5,-1011
    da00:	40e78c33          	sub	s8,a5,a4
    da04:	00000b13          	li	s6,0
    da08:	00000b93          	li	s7,0
    da0c:	b09ff06f          	j	d514 <__muldf3+0x7c>
    da10:	00058813          	mv	a6,a1
    da14:	7ff00793          	li	a5,2047
    da18:	00000693          	li	a3,0
    da1c:	00000713          	li	a4,0
    da20:	c29ff06f          	j	d648 <__muldf3+0x1b0>
    da24:	00050a13          	mv	s4,a0
    da28:	00c00b13          	li	s6,12
    da2c:	7ff00c13          	li	s8,2047
    da30:	00300b93          	li	s7,3
    da34:	ae1ff06f          	j	d514 <__muldf3+0x7c>
    da38:	00000493          	li	s1,0
    da3c:	00400b13          	li	s6,4
    da40:	00000c13          	li	s8,0
    da44:	00100b93          	li	s7,1
    da48:	acdff06f          	j	d514 <__muldf3+0x7c>
    da4c:	001b6b13          	or	s6,s6,1
    da50:	000c0313          	mv	t1,s8
    da54:	00000413          	li	s0,0
    da58:	00000e13          	li	t3,0
    da5c:	00100693          	li	a3,1
    da60:	afdff06f          	j	d55c <__muldf3+0xc4>
    da64:	002b6b13          	or	s6,s6,2
    da68:	00000413          	li	s0,0
    da6c:	00000e13          	li	t3,0
    da70:	00200693          	li	a3,2
    da74:	ae9ff06f          	j	d55c <__muldf3+0xc4>
    da78:	00040493          	mv	s1,s0
    da7c:	000e0a13          	mv	s4,t3
    da80:	00068b93          	mv	s7,a3
    da84:	00098593          	mv	a1,s3
    da88:	b99ff06f          	j	d620 <__muldf3+0x188>
    da8c:	00100713          	li	a4,1
    da90:	10079063          	bnez	a5,db90 <__muldf3+0x6f8>
    da94:	41e30313          	add	t1,t1,1054
    da98:	006a1633          	sll	a2,s4,t1
    da9c:	00c03633          	snez	a2,a2
    daa0:	00649333          	sll	t1,s1,t1
    daa4:	00ea5a33          	srl	s4,s4,a4
    daa8:	00666633          	or	a2,a2,t1
    daac:	01466633          	or	a2,a2,s4
    dab0:	00767793          	and	a5,a2,7
    dab4:	00e4d5b3          	srl	a1,s1,a4
    dab8:	02078063          	beqz	a5,dad8 <__muldf3+0x640>
    dabc:	00f67793          	and	a5,a2,15
    dac0:	00400713          	li	a4,4
    dac4:	00e78a63          	beq	a5,a4,dad8 <__muldf3+0x640>
    dac8:	00460793          	add	a5,a2,4
    dacc:	00c7b633          	sltu	a2,a5,a2
    dad0:	00c585b3          	add	a1,a1,a2
    dad4:	00078613          	mv	a2,a5
    dad8:	00859513          	sll	a0,a1,0x8
    dadc:	00100793          	li	a5,1
    dae0:	00000693          	li	a3,0
    dae4:	00000713          	li	a4,0
    dae8:	b60540e3          	bltz	a0,d648 <__muldf3+0x1b0>
    daec:	10c0006f          	j	dbf8 <__muldf3+0x760>
    daf0:	00f00713          	li	a4,15
    daf4:	12eb1063          	bne	s6,a4,dc14 <__muldf3+0x77c>
    daf8:	00000813          	li	a6,0
    dafc:	000806b7          	lui	a3,0x80
    db00:	00000713          	li	a4,0
    db04:	b45ff06f          	j	d648 <__muldf3+0x1b0>
    db08:	1c8010ef          	jal	ecd0 <__clzsi2>
    db0c:	01550693          	add	a3,a0,21
    db10:	01c00793          	li	a5,28
    db14:	02050713          	add	a4,a0,32
    db18:	ecd7d4e3          	bge	a5,a3,d9e0 <__muldf3+0x548>
    db1c:	ff850513          	add	a0,a0,-8
    db20:	00000a13          	li	s4,0
    db24:	00a414b3          	sll	s1,s0,a0
    db28:	ed5ff06f          	j	d9fc <__muldf3+0x564>
    db2c:	000a8513          	mv	a0,s5
    db30:	1a0010ef          	jal	ecd0 <__clzsi2>
    db34:	01550713          	add	a4,a0,21
    db38:	01c00793          	li	a5,28
    db3c:	02050313          	add	t1,a0,32
    db40:	aae7d4e3          	bge	a5,a4,d5e8 <__muldf3+0x150>
    db44:	ff850513          	add	a0,a0,-8
    db48:	00000e13          	li	t3,0
    db4c:	00aa9433          	sll	s0,s5,a0
    db50:	ab5ff06f          	j	d604 <__muldf3+0x16c>
    db54:	00000813          	li	a6,0
    db58:	7ff00793          	li	a5,2047
    db5c:	000806b7          	lui	a3,0x80
    db60:	ae9ff06f          	j	d648 <__muldf3+0x1b0>
    db64:	00088313          	mv	t1,a7
    db68:	df5ff06f          	j	d95c <__muldf3+0x4c4>
    db6c:	7ff00793          	li	a5,2047
    db70:	00000693          	li	a3,0
    db74:	00000713          	li	a4,0
    db78:	ad1ff06f          	j	d648 <__muldf3+0x1b0>
    db7c:	00000813          	li	a6,0
    db80:	7ff00793          	li	a5,2047
    db84:	000806b7          	lui	a3,0x80
    db88:	00000713          	li	a4,0
    db8c:	abdff06f          	j	d648 <__muldf3+0x1b0>
    db90:	40f70733          	sub	a4,a4,a5
    db94:	03800693          	li	a3,56
    db98:	aae6c2e3          	blt	a3,a4,d63c <__muldf3+0x1a4>
    db9c:	01f00693          	li	a3,31
    dba0:	eee6dae3          	bge	a3,a4,da94 <__muldf3+0x5fc>
    dba4:	fe100693          	li	a3,-31
    dba8:	40f687b3          	sub	a5,a3,a5
    dbac:	02000693          	li	a3,32
    dbb0:	00f4d7b3          	srl	a5,s1,a5
    dbb4:	00d70863          	beq	a4,a3,dbc4 <__muldf3+0x72c>
    dbb8:	43e30313          	add	t1,t1,1086
    dbbc:	00649333          	sll	t1,s1,t1
    dbc0:	006a6a33          	or	s4,s4,t1
    dbc4:	01403633          	snez	a2,s4
    dbc8:	00f66633          	or	a2,a2,a5
    dbcc:	00767713          	and	a4,a2,7
    dbd0:	00000693          	li	a3,0
    dbd4:	02070863          	beqz	a4,dc04 <__muldf3+0x76c>
    dbd8:	00f67793          	and	a5,a2,15
    dbdc:	00400713          	li	a4,4
    dbe0:	00000593          	li	a1,0
    dbe4:	00e78a63          	beq	a5,a4,dbf8 <__muldf3+0x760>
    dbe8:	00460793          	add	a5,a2,4
    dbec:	00c7b633          	sltu	a2,a5,a2
    dbf0:	00c035b3          	snez	a1,a2
    dbf4:	00078613          	mv	a2,a5
    dbf8:	00959693          	sll	a3,a1,0x9
    dbfc:	01d59713          	sll	a4,a1,0x1d
    dc00:	00c6d693          	srl	a3,a3,0xc
    dc04:	00365613          	srl	a2,a2,0x3
    dc08:	00e66733          	or	a4,a2,a4
    dc0c:	00000793          	li	a5,0
    dc10:	a39ff06f          	j	d648 <__muldf3+0x1b0>
    dc14:	00040493          	mv	s1,s0
    dc18:	000a8a13          	mv	s4,s5
    dc1c:	00300b93          	li	s7,3
    dc20:	00098593          	mv	a1,s3
    dc24:	9fdff06f          	j	d620 <__muldf3+0x188>

0000dc28 <__subdf3>:
    dc28:	001007b7          	lui	a5,0x100
    dc2c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    dc30:	fe010113          	add	sp,sp,-32
    dc34:	00b7f8b3          	and	a7,a5,a1
    dc38:	00d7f833          	and	a6,a5,a3
    dc3c:	0146d793          	srl	a5,a3,0x14
    dc40:	00389893          	sll	a7,a7,0x3
    dc44:	00812c23          	sw	s0,24(sp)
    dc48:	01312623          	sw	s3,12(sp)
    dc4c:	01f5d413          	srl	s0,a1,0x1f
    dc50:	0145d993          	srl	s3,a1,0x14
    dc54:	01d55713          	srl	a4,a0,0x1d
    dc58:	00381813          	sll	a6,a6,0x3
    dc5c:	01d65593          	srl	a1,a2,0x1d
    dc60:	00112e23          	sw	ra,28(sp)
    dc64:	00912a23          	sw	s1,20(sp)
    dc68:	01212823          	sw	s2,16(sp)
    dc6c:	7ff7ff13          	and	t5,a5,2047
    dc70:	7ff00313          	li	t1,2047
    dc74:	01176733          	or	a4,a4,a7
    dc78:	7ff9f993          	and	s3,s3,2047
    dc7c:	00040e13          	mv	t3,s0
    dc80:	00351893          	sll	a7,a0,0x3
    dc84:	01f6d693          	srl	a3,a3,0x1f
    dc88:	0105e5b3          	or	a1,a1,a6
    dc8c:	00361e93          	sll	t4,a2,0x3
    dc90:	206f0c63          	beq	t5,t1,dea8 <__subdf3+0x280>
    dc94:	0016c693          	xor	a3,a3,1
    dc98:	41e987b3          	sub	a5,s3,t5
    dc9c:	16d40263          	beq	s0,a3,de00 <__subdf3+0x1d8>
    dca0:	00f05ae3          	blez	a5,e4b4 <__subdf3+0x88c>
    dca4:	240f0a63          	beqz	t5,def8 <__subdf3+0x2d0>
    dca8:	3c698463          	beq	s3,t1,e070 <__subdf3+0x448>
    dcac:	03800693          	li	a3,56
    dcb0:	00100513          	li	a0,1
    dcb4:	02f6ce63          	blt	a3,a5,dcf0 <__subdf3+0xc8>
    dcb8:	008006b7          	lui	a3,0x800
    dcbc:	00d5e5b3          	or	a1,a1,a3
    dcc0:	01f00693          	li	a3,31
    dcc4:	4ef6c463          	blt	a3,a5,e1ac <__subdf3+0x584>
    dcc8:	02000693          	li	a3,32
    dccc:	40f686b3          	sub	a3,a3,a5
    dcd0:	00d59533          	sll	a0,a1,a3
    dcd4:	00fed633          	srl	a2,t4,a5
    dcd8:	00de96b3          	sll	a3,t4,a3
    dcdc:	00c56533          	or	a0,a0,a2
    dce0:	00d036b3          	snez	a3,a3
    dce4:	00f5d7b3          	srl	a5,a1,a5
    dce8:	00d56533          	or	a0,a0,a3
    dcec:	40f70733          	sub	a4,a4,a5
    dcf0:	40a88533          	sub	a0,a7,a0
    dcf4:	00a8b633          	sltu	a2,a7,a0
    dcf8:	00050493          	mv	s1,a0
    dcfc:	40c70933          	sub	s2,a4,a2
    dd00:	00891793          	sll	a5,s2,0x8
    dd04:	3407d863          	bgez	a5,e054 <__subdf3+0x42c>
    dd08:	008007b7          	lui	a5,0x800
    dd0c:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    dd10:	00f97933          	and	s2,s2,a5
    dd14:	2e090663          	beqz	s2,e000 <__subdf3+0x3d8>
    dd18:	00090513          	mv	a0,s2
    dd1c:	7b5000ef          	jal	ecd0 <__clzsi2>
    dd20:	ff850793          	add	a5,a0,-8
    dd24:	02000693          	li	a3,32
    dd28:	40f68733          	sub	a4,a3,a5
    dd2c:	00e4d733          	srl	a4,s1,a4
    dd30:	00f91933          	sll	s2,s2,a5
    dd34:	01276733          	or	a4,a4,s2
    dd38:	00f494b3          	sll	s1,s1,a5
    dd3c:	3f37c463          	blt	a5,s3,e124 <__subdf3+0x4fc>
    dd40:	413787b3          	sub	a5,a5,s3
    dd44:	00178793          	add	a5,a5,1
    dd48:	40f686b3          	sub	a3,a3,a5
    dd4c:	00d49633          	sll	a2,s1,a3
    dd50:	00f4d933          	srl	s2,s1,a5
    dd54:	00c03633          	snez	a2,a2
    dd58:	00c96633          	or	a2,s2,a2
    dd5c:	00d716b3          	sll	a3,a4,a3
    dd60:	00c6e4b3          	or	s1,a3,a2
    dd64:	00f75933          	srl	s2,a4,a5
    dd68:	00000993          	li	s3,0
    dd6c:	0074f793          	and	a5,s1,7
    dd70:	02078063          	beqz	a5,dd90 <__subdf3+0x168>
    dd74:	00f4f793          	and	a5,s1,15
    dd78:	00400713          	li	a4,4
    dd7c:	00e78a63          	beq	a5,a4,dd90 <__subdf3+0x168>
    dd80:	00448793          	add	a5,s1,4
    dd84:	0097b533          	sltu	a0,a5,s1
    dd88:	00a90933          	add	s2,s2,a0
    dd8c:	00078493          	mv	s1,a5
    dd90:	00891793          	sll	a5,s2,0x8
    dd94:	6c07d063          	bgez	a5,e454 <__subdf3+0x82c>
    dd98:	00198793          	add	a5,s3,1
    dd9c:	7ff00713          	li	a4,2047
    dda0:	24e78663          	beq	a5,a4,dfec <__subdf3+0x3c4>
    dda4:	ff800737          	lui	a4,0xff800
    dda8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ddac:	00e97733          	and	a4,s2,a4
    ddb0:	7ff7f793          	and	a5,a5,2047
    ddb4:	01d71813          	sll	a6,a4,0x1d
    ddb8:	0034d513          	srl	a0,s1,0x3
    ddbc:	00971713          	sll	a4,a4,0x9
    ddc0:	00a86833          	or	a6,a6,a0
    ddc4:	00c75713          	srl	a4,a4,0xc
    ddc8:	00147e13          	and	t3,s0,1
    ddcc:	01c12083          	lw	ra,28(sp)
    ddd0:	01812403          	lw	s0,24(sp)
    ddd4:	01479793          	sll	a5,a5,0x14
    ddd8:	00e7e7b3          	or	a5,a5,a4
    dddc:	01fe1713          	sll	a4,t3,0x1f
    dde0:	00e7e7b3          	or	a5,a5,a4
    dde4:	01412483          	lw	s1,20(sp)
    dde8:	01012903          	lw	s2,16(sp)
    ddec:	00c12983          	lw	s3,12(sp)
    ddf0:	00080513          	mv	a0,a6
    ddf4:	00078593          	mv	a1,a5
    ddf8:	02010113          	add	sp,sp,32
    ddfc:	00008067          	ret
    de00:	70f05263          	blez	a5,e504 <__subdf3+0x8dc>
    de04:	1c0f1663          	bnez	t5,dfd0 <__subdf3+0x3a8>
    de08:	01d5e6b3          	or	a3,a1,t4
    de0c:	26068e63          	beqz	a3,e088 <__subdf3+0x460>
    de10:	fff78693          	add	a3,a5,-1
    de14:	46068863          	beqz	a3,e284 <__subdf3+0x65c>
    de18:	24678c63          	beq	a5,t1,e070 <__subdf3+0x448>
    de1c:	03800793          	li	a5,56
    de20:	00100913          	li	s2,1
    de24:	02d7cc63          	blt	a5,a3,de5c <__subdf3+0x234>
    de28:	00068793          	mv	a5,a3
    de2c:	01f00693          	li	a3,31
    de30:	48f6ca63          	blt	a3,a5,e2c4 <__subdf3+0x69c>
    de34:	02000693          	li	a3,32
    de38:	40f686b3          	sub	a3,a3,a5
    de3c:	00d59933          	sll	s2,a1,a3
    de40:	00fed633          	srl	a2,t4,a5
    de44:	00de96b3          	sll	a3,t4,a3
    de48:	00c96933          	or	s2,s2,a2
    de4c:	00d036b3          	snez	a3,a3
    de50:	00f5d7b3          	srl	a5,a1,a5
    de54:	00d96933          	or	s2,s2,a3
    de58:	00f70733          	add	a4,a4,a5
    de5c:	01190633          	add	a2,s2,a7
    de60:	01263933          	sltu	s2,a2,s2
    de64:	00060493          	mv	s1,a2
    de68:	00e90933          	add	s2,s2,a4
    de6c:	00891793          	sll	a5,s2,0x8
    de70:	1e07d263          	bgez	a5,e054 <__subdf3+0x42c>
    de74:	00198993          	add	s3,s3,1
    de78:	7ff00793          	li	a5,2047
    de7c:	16f98863          	beq	s3,a5,dfec <__subdf3+0x3c4>
    de80:	ff8007b7          	lui	a5,0xff800
    de84:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    de88:	0014f513          	and	a0,s1,1
    de8c:	00f977b3          	and	a5,s2,a5
    de90:	0014d713          	srl	a4,s1,0x1
    de94:	00a76733          	or	a4,a4,a0
    de98:	01f79513          	sll	a0,a5,0x1f
    de9c:	00e564b3          	or	s1,a0,a4
    dea0:	0017d913          	srl	s2,a5,0x1
    dea4:	ec9ff06f          	j	dd6c <__subdf3+0x144>
    dea8:	01d5e833          	or	a6,a1,t4
    deac:	80198313          	add	t1,s3,-2047
    deb0:	06080863          	beqz	a6,df20 <__subdf3+0x2f8>
    deb4:	06d40a63          	beq	s0,a3,df28 <__subdf3+0x300>
    deb8:	0e030463          	beqz	t1,dfa0 <__subdf3+0x378>
    debc:	26098e63          	beqz	s3,e138 <__subdf3+0x510>
    dec0:	00361513          	sll	a0,a2,0x3
    dec4:	00355513          	srl	a0,a0,0x3
    dec8:	00068413          	mv	s0,a3
    decc:	00058713          	mv	a4,a1
    ded0:	01d71813          	sll	a6,a4,0x1d
    ded4:	00a86833          	or	a6,a6,a0
    ded8:	00375713          	srl	a4,a4,0x3
    dedc:	01076733          	or	a4,a4,a6
    dee0:	10070663          	beqz	a4,dfec <__subdf3+0x3c4>
    dee4:	00000e13          	li	t3,0
    dee8:	7ff00793          	li	a5,2047
    deec:	00080737          	lui	a4,0x80
    def0:	00000813          	li	a6,0
    def4:	ed9ff06f          	j	ddcc <__subdf3+0x1a4>
    def8:	01d5e6b3          	or	a3,a1,t4
    defc:	18068663          	beqz	a3,e088 <__subdf3+0x460>
    df00:	fff78693          	add	a3,a5,-1
    df04:	3a068263          	beqz	a3,e2a8 <__subdf3+0x680>
    df08:	16678463          	beq	a5,t1,e070 <__subdf3+0x448>
    df0c:	03800793          	li	a5,56
    df10:	00100513          	li	a0,1
    df14:	dcd7cee3          	blt	a5,a3,dcf0 <__subdf3+0xc8>
    df18:	00068793          	mv	a5,a3
    df1c:	da5ff06f          	j	dcc0 <__subdf3+0x98>
    df20:	0016c693          	xor	a3,a3,1
    df24:	f8d41ae3          	bne	s0,a3,deb8 <__subdf3+0x290>
    df28:	18030863          	beqz	t1,e0b8 <__subdf3+0x490>
    df2c:	2c099063          	bnez	s3,e1ec <__subdf3+0x5c4>
    df30:	7ff00793          	li	a5,2047
    df34:	011766b3          	or	a3,a4,a7
    df38:	48068863          	beqz	a3,e3c8 <__subdf3+0x7a0>
    df3c:	fff78693          	add	a3,a5,-1
    df40:	34068263          	beqz	a3,e284 <__subdf3+0x65c>
    df44:	7ff00513          	li	a0,2047
    df48:	2aa78263          	beq	a5,a0,e1ec <__subdf3+0x5c4>
    df4c:	03800793          	li	a5,56
    df50:	00100913          	li	s2,1
    df54:	02d7ca63          	blt	a5,a3,df88 <__subdf3+0x360>
    df58:	01f00793          	li	a5,31
    df5c:	4cd7c663          	blt	a5,a3,e428 <__subdf3+0x800>
    df60:	02000793          	li	a5,32
    df64:	40d787b3          	sub	a5,a5,a3
    df68:	00f71933          	sll	s2,a4,a5
    df6c:	00d8d633          	srl	a2,a7,a3
    df70:	00f897b3          	sll	a5,a7,a5
    df74:	00c96933          	or	s2,s2,a2
    df78:	00f037b3          	snez	a5,a5
    df7c:	00d756b3          	srl	a3,a4,a3
    df80:	00f96933          	or	s2,s2,a5
    df84:	00d585b3          	add	a1,a1,a3
    df88:	01d90733          	add	a4,s2,t4
    df8c:	01273933          	sltu	s2,a4,s2
    df90:	00070493          	mv	s1,a4
    df94:	00b90933          	add	s2,s2,a1
    df98:	000f0993          	mv	s3,t5
    df9c:	ed1ff06f          	j	de6c <__subdf3+0x244>
    dfa0:	00198793          	add	a5,s3,1
    dfa4:	7fe7f793          	and	a5,a5,2046
    dfa8:	14079463          	bnez	a5,e0f0 <__subdf3+0x4c8>
    dfac:	01d5e833          	or	a6,a1,t4
    dfb0:	011767b3          	or	a5,a4,a7
    dfb4:	2a099463          	bnez	s3,e25c <__subdf3+0x634>
    dfb8:	38078e63          	beqz	a5,e354 <__subdf3+0x72c>
    dfbc:	3c081063          	bnez	a6,e37c <__subdf3+0x754>
    dfc0:	00351513          	sll	a0,a0,0x3
    dfc4:	00355913          	srl	s2,a0,0x3
    dfc8:	00000793          	li	a5,0
    dfcc:	1140006f          	j	e0e0 <__subdf3+0x4b8>
    dfd0:	0a698063          	beq	s3,t1,e070 <__subdf3+0x448>
    dfd4:	03800693          	li	a3,56
    dfd8:	00100913          	li	s2,1
    dfdc:	e8f6c0e3          	blt	a3,a5,de5c <__subdf3+0x234>
    dfe0:	008006b7          	lui	a3,0x800
    dfe4:	00d5e5b3          	or	a1,a1,a3
    dfe8:	e45ff06f          	j	de2c <__subdf3+0x204>
    dfec:	00147e13          	and	t3,s0,1
    dff0:	7ff00793          	li	a5,2047
    dff4:	00000713          	li	a4,0
    dff8:	00000813          	li	a6,0
    dffc:	dd1ff06f          	j	ddcc <__subdf3+0x1a4>
    e000:	00048513          	mv	a0,s1
    e004:	4cd000ef          	jal	ecd0 <__clzsi2>
    e008:	01850793          	add	a5,a0,24
    e00c:	01f00693          	li	a3,31
    e010:	d0f6dae3          	bge	a3,a5,dd24 <__subdf3+0xfc>
    e014:	ff850713          	add	a4,a0,-8
    e018:	00e49733          	sll	a4,s1,a4
    e01c:	1b37ce63          	blt	a5,s3,e1d8 <__subdf3+0x5b0>
    e020:	413789b3          	sub	s3,a5,s3
    e024:	00198793          	add	a5,s3,1
    e028:	42f6de63          	bge	a3,a5,e464 <__subdf3+0x83c>
    e02c:	fe198993          	add	s3,s3,-31
    e030:	02000693          	li	a3,32
    e034:	013754b3          	srl	s1,a4,s3
    e038:	00d78c63          	beq	a5,a3,e050 <__subdf3+0x428>
    e03c:	04000693          	li	a3,64
    e040:	40f687b3          	sub	a5,a3,a5
    e044:	00f71733          	sll	a4,a4,a5
    e048:	00e03733          	snez	a4,a4
    e04c:	00e4e4b3          	or	s1,s1,a4
    e050:	00000993          	li	s3,0
    e054:	0074f793          	and	a5,s1,7
    e058:	d0079ee3          	bnez	a5,dd74 <__subdf3+0x14c>
    e05c:	00098793          	mv	a5,s3
    e060:	0034d513          	srl	a0,s1,0x3
    e064:	00090713          	mv	a4,s2
    e068:	0280006f          	j	e090 <__subdf3+0x468>
    e06c:	e6081ce3          	bnez	a6,dee4 <__subdf3+0x2bc>
    e070:	00351513          	sll	a0,a0,0x3
    e074:	01d71813          	sll	a6,a4,0x1d
    e078:	00355513          	srl	a0,a0,0x3
    e07c:	00a86833          	or	a6,a6,a0
    e080:	00375713          	srl	a4,a4,0x3
    e084:	e59ff06f          	j	dedc <__subdf3+0x2b4>
    e088:	00351513          	sll	a0,a0,0x3
    e08c:	00355513          	srl	a0,a0,0x3
    e090:	01d71813          	sll	a6,a4,0x1d
    e094:	7ff00693          	li	a3,2047
    e098:	00a86833          	or	a6,a6,a0
    e09c:	00375713          	srl	a4,a4,0x3
    e0a0:	e2d78ee3          	beq	a5,a3,dedc <__subdf3+0x2b4>
    e0a4:	00c71713          	sll	a4,a4,0xc
    e0a8:	00c75713          	srl	a4,a4,0xc
    e0ac:	7ff7f793          	and	a5,a5,2047
    e0b0:	00147e13          	and	t3,s0,1
    e0b4:	d19ff06f          	j	ddcc <__subdf3+0x1a4>
    e0b8:	00198693          	add	a3,s3,1
    e0bc:	7fe6f793          	and	a5,a3,2046
    e0c0:	12079e63          	bnez	a5,e1fc <__subdf3+0x5d4>
    e0c4:	011767b3          	or	a5,a4,a7
    e0c8:	24099a63          	bnez	s3,e31c <__subdf3+0x6f4>
    e0cc:	30078663          	beqz	a5,e3d8 <__subdf3+0x7b0>
    e0d0:	01d5e7b3          	or	a5,a1,t4
    e0d4:	30079a63          	bnez	a5,e3e8 <__subdf3+0x7c0>
    e0d8:	00351513          	sll	a0,a0,0x3
    e0dc:	00355913          	srl	s2,a0,0x3
    e0e0:	01d71813          	sll	a6,a4,0x1d
    e0e4:	01286833          	or	a6,a6,s2
    e0e8:	00375713          	srl	a4,a4,0x3
    e0ec:	fb9ff06f          	j	e0a4 <__subdf3+0x47c>
    e0f0:	41d88833          	sub	a6,a7,t4
    e0f4:	0108b7b3          	sltu	a5,a7,a6
    e0f8:	40b70933          	sub	s2,a4,a1
    e0fc:	40f90933          	sub	s2,s2,a5
    e100:	00891793          	sll	a5,s2,0x8
    e104:	00080493          	mv	s1,a6
    e108:	1207c263          	bltz	a5,e22c <__subdf3+0x604>
    e10c:	01286833          	or	a6,a6,s2
    e110:	c00812e3          	bnez	a6,dd14 <__subdf3+0xec>
    e114:	00000e13          	li	t3,0
    e118:	00000793          	li	a5,0
    e11c:	00000713          	li	a4,0
    e120:	cadff06f          	j	ddcc <__subdf3+0x1a4>
    e124:	ff800937          	lui	s2,0xff800
    e128:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e12c:	40f989b3          	sub	s3,s3,a5
    e130:	01277933          	and	s2,a4,s2
    e134:	c39ff06f          	j	dd6c <__subdf3+0x144>
    e138:	7ff00793          	li	a5,2047
    e13c:	01176533          	or	a0,a4,a7
    e140:	10050463          	beqz	a0,e248 <__subdf3+0x620>
    e144:	fff78813          	add	a6,a5,-1
    e148:	1e080263          	beqz	a6,e32c <__subdf3+0x704>
    e14c:	7ff00513          	li	a0,2047
    e150:	d6a788e3          	beq	a5,a0,dec0 <__subdf3+0x298>
    e154:	03800793          	li	a5,56
    e158:	00068413          	mv	s0,a3
    e15c:	00100513          	li	a0,1
    e160:	0307ca63          	blt	a5,a6,e194 <__subdf3+0x56c>
    e164:	01f00793          	li	a5,31
    e168:	1907c463          	blt	a5,a6,e2f0 <__subdf3+0x6c8>
    e16c:	02000793          	li	a5,32
    e170:	410787b3          	sub	a5,a5,a6
    e174:	00f71533          	sll	a0,a4,a5
    e178:	0108d6b3          	srl	a3,a7,a6
    e17c:	00f897b3          	sll	a5,a7,a5
    e180:	00d56533          	or	a0,a0,a3
    e184:	00f037b3          	snez	a5,a5
    e188:	01075833          	srl	a6,a4,a6
    e18c:	00f56533          	or	a0,a0,a5
    e190:	410585b3          	sub	a1,a1,a6
    e194:	40ae8533          	sub	a0,t4,a0
    e198:	00aeb733          	sltu	a4,t4,a0
    e19c:	00050493          	mv	s1,a0
    e1a0:	40e58933          	sub	s2,a1,a4
    e1a4:	000f0993          	mv	s3,t5
    e1a8:	b59ff06f          	j	dd00 <__subdf3+0xd8>
    e1ac:	fe078693          	add	a3,a5,-32
    e1b0:	02000613          	li	a2,32
    e1b4:	00d5d6b3          	srl	a3,a1,a3
    e1b8:	00c78a63          	beq	a5,a2,e1cc <__subdf3+0x5a4>
    e1bc:	04000613          	li	a2,64
    e1c0:	40f607b3          	sub	a5,a2,a5
    e1c4:	00f597b3          	sll	a5,a1,a5
    e1c8:	00feeeb3          	or	t4,t4,a5
    e1cc:	01d03533          	snez	a0,t4
    e1d0:	00d56533          	or	a0,a0,a3
    e1d4:	b1dff06f          	j	dcf0 <__subdf3+0xc8>
    e1d8:	ff8006b7          	lui	a3,0xff800
    e1dc:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e1e0:	40f987b3          	sub	a5,s3,a5
    e1e4:	00d77733          	and	a4,a4,a3
    e1e8:	ef9ff06f          	j	e0e0 <__subdf3+0x4b8>
    e1ec:	00361513          	sll	a0,a2,0x3
    e1f0:	00355513          	srl	a0,a0,0x3
    e1f4:	00058713          	mv	a4,a1
    e1f8:	cd9ff06f          	j	ded0 <__subdf3+0x2a8>
    e1fc:	7ff00793          	li	a5,2047
    e200:	def686e3          	beq	a3,a5,dfec <__subdf3+0x3c4>
    e204:	01d88eb3          	add	t4,a7,t4
    e208:	011eb633          	sltu	a2,t4,a7
    e20c:	00b707b3          	add	a5,a4,a1
    e210:	00c787b3          	add	a5,a5,a2
    e214:	01f79513          	sll	a0,a5,0x1f
    e218:	001ede93          	srl	t4,t4,0x1
    e21c:	01d564b3          	or	s1,a0,t4
    e220:	0017d913          	srl	s2,a5,0x1
    e224:	00068993          	mv	s3,a3
    e228:	b45ff06f          	j	dd6c <__subdf3+0x144>
    e22c:	411e8633          	sub	a2,t4,a7
    e230:	40e587b3          	sub	a5,a1,a4
    e234:	00ceb733          	sltu	a4,t4,a2
    e238:	00060493          	mv	s1,a2
    e23c:	40e78933          	sub	s2,a5,a4
    e240:	00068413          	mv	s0,a3
    e244:	ad1ff06f          	j	dd14 <__subdf3+0xec>
    e248:	00361613          	sll	a2,a2,0x3
    e24c:	00365513          	srl	a0,a2,0x3
    e250:	00068413          	mv	s0,a3
    e254:	00058713          	mv	a4,a1
    e258:	e39ff06f          	j	e090 <__subdf3+0x468>
    e25c:	e00798e3          	bnez	a5,e06c <__subdf3+0x444>
    e260:	22080663          	beqz	a6,e48c <__subdf3+0x864>
    e264:	0035d713          	srl	a4,a1,0x3
    e268:	00361613          	sll	a2,a2,0x3
    e26c:	01d59593          	sll	a1,a1,0x1d
    e270:	00b76733          	or	a4,a4,a1
    e274:	00365613          	srl	a2,a2,0x3
    e278:	00c76733          	or	a4,a4,a2
    e27c:	00068413          	mv	s0,a3
    e280:	c61ff06f          	j	dee0 <__subdf3+0x2b8>
    e284:	01d88eb3          	add	t4,a7,t4
    e288:	00b705b3          	add	a1,a4,a1
    e28c:	011eb633          	sltu	a2,t4,a7
    e290:	00c58933          	add	s2,a1,a2
    e294:	00891793          	sll	a5,s2,0x8
    e298:	000e8493          	mv	s1,t4
    e29c:	0a07d863          	bgez	a5,e34c <__subdf3+0x724>
    e2a0:	00200993          	li	s3,2
    e2a4:	bddff06f          	j	de80 <__subdf3+0x258>
    e2a8:	41d88eb3          	sub	t4,a7,t4
    e2ac:	40b705b3          	sub	a1,a4,a1
    e2b0:	01d8b633          	sltu	a2,a7,t4
    e2b4:	000e8493          	mv	s1,t4
    e2b8:	40c58933          	sub	s2,a1,a2
    e2bc:	00100993          	li	s3,1
    e2c0:	a41ff06f          	j	dd00 <__subdf3+0xd8>
    e2c4:	fe078693          	add	a3,a5,-32
    e2c8:	02000613          	li	a2,32
    e2cc:	00d5d6b3          	srl	a3,a1,a3
    e2d0:	00c78a63          	beq	a5,a2,e2e4 <__subdf3+0x6bc>
    e2d4:	04000613          	li	a2,64
    e2d8:	40f607b3          	sub	a5,a2,a5
    e2dc:	00f597b3          	sll	a5,a1,a5
    e2e0:	00feeeb3          	or	t4,t4,a5
    e2e4:	01d03933          	snez	s2,t4
    e2e8:	00d96933          	or	s2,s2,a3
    e2ec:	b71ff06f          	j	de5c <__subdf3+0x234>
    e2f0:	fe080793          	add	a5,a6,-32
    e2f4:	02000693          	li	a3,32
    e2f8:	00f757b3          	srl	a5,a4,a5
    e2fc:	00d80a63          	beq	a6,a3,e310 <__subdf3+0x6e8>
    e300:	04000693          	li	a3,64
    e304:	410686b3          	sub	a3,a3,a6
    e308:	00d71733          	sll	a4,a4,a3
    e30c:	00e8e8b3          	or	a7,a7,a4
    e310:	01103533          	snez	a0,a7
    e314:	00f56533          	or	a0,a0,a5
    e318:	e7dff06f          	j	e194 <__subdf3+0x56c>
    e31c:	ec0788e3          	beqz	a5,e1ec <__subdf3+0x5c4>
    e320:	01d5eeb3          	or	t4,a1,t4
    e324:	bc0e90e3          	bnez	t4,dee4 <__subdf3+0x2bc>
    e328:	d49ff06f          	j	e070 <__subdf3+0x448>
    e32c:	411e8633          	sub	a2,t4,a7
    e330:	40e585b3          	sub	a1,a1,a4
    e334:	00ceb733          	sltu	a4,t4,a2
    e338:	00060493          	mv	s1,a2
    e33c:	40e58933          	sub	s2,a1,a4
    e340:	00068413          	mv	s0,a3
    e344:	00100993          	li	s3,1
    e348:	9b9ff06f          	j	dd00 <__subdf3+0xd8>
    e34c:	00100793          	li	a5,1
    e350:	d11ff06f          	j	e060 <__subdf3+0x438>
    e354:	dc0800e3          	beqz	a6,e114 <__subdf3+0x4ec>
    e358:	00361613          	sll	a2,a2,0x3
    e35c:	00365793          	srl	a5,a2,0x3
    e360:	01d59813          	sll	a6,a1,0x1d
    e364:	00959713          	sll	a4,a1,0x9
    e368:	00f86833          	or	a6,a6,a5
    e36c:	00c75713          	srl	a4,a4,0xc
    e370:	00068e13          	mv	t3,a3
    e374:	00000793          	li	a5,0
    e378:	a55ff06f          	j	ddcc <__subdf3+0x1a4>
    e37c:	41d88933          	sub	s2,a7,t4
    e380:	0128b7b3          	sltu	a5,a7,s2
    e384:	40b70633          	sub	a2,a4,a1
    e388:	40f60633          	sub	a2,a2,a5
    e38c:	00861793          	sll	a5,a2,0x8
    e390:	0e07d263          	bgez	a5,e474 <__subdf3+0x84c>
    e394:	411e8633          	sub	a2,t4,a7
    e398:	40e58733          	sub	a4,a1,a4
    e39c:	00cebeb3          	sltu	t4,t4,a2
    e3a0:	41d70733          	sub	a4,a4,t4
    e3a4:	00871793          	sll	a5,a4,0x8
    e3a8:	00060493          	mv	s1,a2
    e3ac:	1207de63          	bgez	a5,e4e8 <__subdf3+0x8c0>
    e3b0:	ff8007b7          	lui	a5,0xff800
    e3b4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e3b8:	00f77733          	and	a4,a4,a5
    e3bc:	00068413          	mv	s0,a3
    e3c0:	00100793          	li	a5,1
    e3c4:	9f1ff06f          	j	ddb4 <__subdf3+0x18c>
    e3c8:	00361613          	sll	a2,a2,0x3
    e3cc:	00365513          	srl	a0,a2,0x3
    e3d0:	00058713          	mv	a4,a1
    e3d4:	cbdff06f          	j	e090 <__subdf3+0x468>
    e3d8:	00361613          	sll	a2,a2,0x3
    e3dc:	00365913          	srl	s2,a2,0x3
    e3e0:	00058713          	mv	a4,a1
    e3e4:	cfdff06f          	j	e0e0 <__subdf3+0x4b8>
    e3e8:	01d886b3          	add	a3,a7,t4
    e3ec:	00b707b3          	add	a5,a4,a1
    e3f0:	0116b633          	sltu	a2,a3,a7
    e3f4:	00c787b3          	add	a5,a5,a2
    e3f8:	00879713          	sll	a4,a5,0x8
    e3fc:	0036d813          	srl	a6,a3,0x3
    e400:	08075e63          	bgez	a4,e49c <__subdf3+0x874>
    e404:	ff800737          	lui	a4,0xff800
    e408:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e40c:	00e7f7b3          	and	a5,a5,a4
    e410:	01d79713          	sll	a4,a5,0x1d
    e414:	00979793          	sll	a5,a5,0x9
    e418:	01076833          	or	a6,a4,a6
    e41c:	00c7d713          	srl	a4,a5,0xc
    e420:	00100793          	li	a5,1
    e424:	9a9ff06f          	j	ddcc <__subdf3+0x1a4>
    e428:	fe068793          	add	a5,a3,-32
    e42c:	02000613          	li	a2,32
    e430:	00f757b3          	srl	a5,a4,a5
    e434:	00c68a63          	beq	a3,a2,e448 <__subdf3+0x820>
    e438:	04000613          	li	a2,64
    e43c:	40d606b3          	sub	a3,a2,a3
    e440:	00d71733          	sll	a4,a4,a3
    e444:	00e8e8b3          	or	a7,a7,a4
    e448:	01103933          	snez	s2,a7
    e44c:	00f96933          	or	s2,s2,a5
    e450:	b39ff06f          	j	df88 <__subdf3+0x360>
    e454:	0034d513          	srl	a0,s1,0x3
    e458:	00098793          	mv	a5,s3
    e45c:	00090713          	mv	a4,s2
    e460:	c31ff06f          	j	e090 <__subdf3+0x468>
    e464:	02000693          	li	a3,32
    e468:	40f686b3          	sub	a3,a3,a5
    e46c:	00000613          	li	a2,0
    e470:	8e9ff06f          	j	dd58 <__subdf3+0x130>
    e474:	00c96833          	or	a6,s2,a2
    e478:	c8080ee3          	beqz	a6,e114 <__subdf3+0x4ec>
    e47c:	00395913          	srl	s2,s2,0x3
    e480:	00000793          	li	a5,0
    e484:	00060713          	mv	a4,a2
    e488:	c59ff06f          	j	e0e0 <__subdf3+0x4b8>
    e48c:	00000e13          	li	t3,0
    e490:	7ff00793          	li	a5,2047
    e494:	00080737          	lui	a4,0x80
    e498:	935ff06f          	j	ddcc <__subdf3+0x1a4>
    e49c:	01d79713          	sll	a4,a5,0x1d
    e4a0:	00979793          	sll	a5,a5,0x9
    e4a4:	01076833          	or	a6,a4,a6
    e4a8:	00c7d713          	srl	a4,a5,0xc
    e4ac:	00000793          	li	a5,0
    e4b0:	91dff06f          	j	ddcc <__subdf3+0x1a4>
    e4b4:	ae0786e3          	beqz	a5,dfa0 <__subdf3+0x378>
    e4b8:	413f0833          	sub	a6,t5,s3
    e4bc:	00080793          	mv	a5,a6
    e4c0:	c6098ee3          	beqz	s3,e13c <__subdf3+0x514>
    e4c4:	03800793          	li	a5,56
    e4c8:	0107ca63          	blt	a5,a6,e4dc <__subdf3+0x8b4>
    e4cc:	008007b7          	lui	a5,0x800
    e4d0:	00f76733          	or	a4,a4,a5
    e4d4:	00068413          	mv	s0,a3
    e4d8:	c8dff06f          	j	e164 <__subdf3+0x53c>
    e4dc:	00068413          	mv	s0,a3
    e4e0:	00100513          	li	a0,1
    e4e4:	cb1ff06f          	j	e194 <__subdf3+0x56c>
    e4e8:	01d71813          	sll	a6,a4,0x1d
    e4ec:	00365613          	srl	a2,a2,0x3
    e4f0:	00c86833          	or	a6,a6,a2
    e4f4:	00375713          	srl	a4,a4,0x3
    e4f8:	00000793          	li	a5,0
    e4fc:	00068413          	mv	s0,a3
    e500:	ba5ff06f          	j	e0a4 <__subdf3+0x47c>
    e504:	ba078ae3          	beqz	a5,e0b8 <__subdf3+0x490>
    e508:	413f06b3          	sub	a3,t5,s3
    e50c:	00099663          	bnez	s3,e518 <__subdf3+0x8f0>
    e510:	00068793          	mv	a5,a3
    e514:	a21ff06f          	j	df34 <__subdf3+0x30c>
    e518:	03800793          	li	a5,56
    e51c:	00100913          	li	s2,1
    e520:	a6d7c4e3          	blt	a5,a3,df88 <__subdf3+0x360>
    e524:	008007b7          	lui	a5,0x800
    e528:	00f76733          	or	a4,a4,a5
    e52c:	a2dff06f          	j	df58 <__subdf3+0x330>

0000e530 <__unorddf2>:
    e530:	0145d713          	srl	a4,a1,0x14
    e534:	001007b7          	lui	a5,0x100
    e538:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e53c:	fff74713          	not	a4,a4
    e540:	0146d813          	srl	a6,a3,0x14
    e544:	00b7f5b3          	and	a1,a5,a1
    e548:	00d7f7b3          	and	a5,a5,a3
    e54c:	01571693          	sll	a3,a4,0x15
    e550:	7ff87813          	and	a6,a6,2047
    e554:	02068063          	beqz	a3,e574 <__unorddf2+0x44>
    e558:	7ff00713          	li	a4,2047
    e55c:	00000513          	li	a0,0
    e560:	00e80463          	beq	a6,a4,e568 <__unorddf2+0x38>
    e564:	00008067          	ret
    e568:	00c7e7b3          	or	a5,a5,a2
    e56c:	00f03533          	snez	a0,a5
    e570:	00008067          	ret
    e574:	00a5e5b3          	or	a1,a1,a0
    e578:	00100513          	li	a0,1
    e57c:	fc058ee3          	beqz	a1,e558 <__unorddf2+0x28>
    e580:	00008067          	ret

0000e584 <__fixdfsi>:
    e584:	0145d793          	srl	a5,a1,0x14
    e588:	001006b7          	lui	a3,0x100
    e58c:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e590:	7ff7f793          	and	a5,a5,2047
    e594:	3fe00613          	li	a2,1022
    e598:	00b77733          	and	a4,a4,a1
    e59c:	01f5d593          	srl	a1,a1,0x1f
    e5a0:	00f65e63          	bge	a2,a5,e5bc <__fixdfsi+0x38>
    e5a4:	41d00613          	li	a2,1053
    e5a8:	00f65e63          	bge	a2,a5,e5c4 <__fixdfsi+0x40>
    e5ac:	80000537          	lui	a0,0x80000
    e5b0:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e5b4:	00a58533          	add	a0,a1,a0
    e5b8:	00008067          	ret
    e5bc:	00000513          	li	a0,0
    e5c0:	00008067          	ret
    e5c4:	43300613          	li	a2,1075
    e5c8:	40f60633          	sub	a2,a2,a5
    e5cc:	01f00813          	li	a6,31
    e5d0:	00d76733          	or	a4,a4,a3
    e5d4:	02c85063          	bge	a6,a2,e5f4 <__fixdfsi+0x70>
    e5d8:	41300693          	li	a3,1043
    e5dc:	40f687b3          	sub	a5,a3,a5
    e5e0:	00f75733          	srl	a4,a4,a5
    e5e4:	40e00533          	neg	a0,a4
    e5e8:	fc059ce3          	bnez	a1,e5c0 <__fixdfsi+0x3c>
    e5ec:	00070513          	mv	a0,a4
    e5f0:	00008067          	ret
    e5f4:	bed78793          	add	a5,a5,-1043
    e5f8:	00f71733          	sll	a4,a4,a5
    e5fc:	00c55533          	srl	a0,a0,a2
    e600:	00a76733          	or	a4,a4,a0
    e604:	fe1ff06f          	j	e5e4 <__fixdfsi+0x60>

0000e608 <__floatsidf>:
    e608:	ff010113          	add	sp,sp,-16
    e60c:	00112623          	sw	ra,12(sp)
    e610:	00812423          	sw	s0,8(sp)
    e614:	00912223          	sw	s1,4(sp)
    e618:	04050a63          	beqz	a0,e66c <__floatsidf+0x64>
    e61c:	41f55713          	sra	a4,a0,0x1f
    e620:	00a744b3          	xor	s1,a4,a0
    e624:	40e484b3          	sub	s1,s1,a4
    e628:	00050793          	mv	a5,a0
    e62c:	00048513          	mv	a0,s1
    e630:	01f7d413          	srl	s0,a5,0x1f
    e634:	69c000ef          	jal	ecd0 <__clzsi2>
    e638:	41e00793          	li	a5,1054
    e63c:	40a787b3          	sub	a5,a5,a0
    e640:	00a00713          	li	a4,10
    e644:	7ff7f793          	and	a5,a5,2047
    e648:	06a74063          	blt	a4,a0,e6a8 <__floatsidf+0xa0>
    e64c:	00b00713          	li	a4,11
    e650:	40a70733          	sub	a4,a4,a0
    e654:	00e4d733          	srl	a4,s1,a4
    e658:	01550513          	add	a0,a0,21
    e65c:	00c71713          	sll	a4,a4,0xc
    e660:	00a494b3          	sll	s1,s1,a0
    e664:	00c75713          	srl	a4,a4,0xc
    e668:	0140006f          	j	e67c <__floatsidf+0x74>
    e66c:	00000413          	li	s0,0
    e670:	00000793          	li	a5,0
    e674:	00000713          	li	a4,0
    e678:	00000493          	li	s1,0
    e67c:	01479793          	sll	a5,a5,0x14
    e680:	01f41413          	sll	s0,s0,0x1f
    e684:	00e7e7b3          	or	a5,a5,a4
    e688:	00c12083          	lw	ra,12(sp)
    e68c:	0087e7b3          	or	a5,a5,s0
    e690:	00812403          	lw	s0,8(sp)
    e694:	00048513          	mv	a0,s1
    e698:	00078593          	mv	a1,a5
    e69c:	00412483          	lw	s1,4(sp)
    e6a0:	01010113          	add	sp,sp,16
    e6a4:	00008067          	ret
    e6a8:	ff550513          	add	a0,a0,-11
    e6ac:	00a49733          	sll	a4,s1,a0
    e6b0:	00c71713          	sll	a4,a4,0xc
    e6b4:	00c75713          	srl	a4,a4,0xc
    e6b8:	00000493          	li	s1,0
    e6bc:	fc1ff06f          	j	e67c <__floatsidf+0x74>

0000e6c0 <__floatunsidf>:
    e6c0:	ff010113          	add	sp,sp,-16
    e6c4:	00812423          	sw	s0,8(sp)
    e6c8:	00112623          	sw	ra,12(sp)
    e6cc:	00050413          	mv	s0,a0
    e6d0:	04050c63          	beqz	a0,e728 <__floatunsidf+0x68>
    e6d4:	5fc000ef          	jal	ecd0 <__clzsi2>
    e6d8:	41e00793          	li	a5,1054
    e6dc:	40a787b3          	sub	a5,a5,a0
    e6e0:	00a00713          	li	a4,10
    e6e4:	7ff7f793          	and	a5,a5,2047
    e6e8:	06a74463          	blt	a4,a0,e750 <__floatunsidf+0x90>
    e6ec:	00b00713          	li	a4,11
    e6f0:	40a70733          	sub	a4,a4,a0
    e6f4:	01550513          	add	a0,a0,21
    e6f8:	00e45733          	srl	a4,s0,a4
    e6fc:	00a41433          	sll	s0,s0,a0
    e700:	00c12083          	lw	ra,12(sp)
    e704:	00040513          	mv	a0,s0
    e708:	00c71713          	sll	a4,a4,0xc
    e70c:	00812403          	lw	s0,8(sp)
    e710:	00c75713          	srl	a4,a4,0xc
    e714:	01479793          	sll	a5,a5,0x14
    e718:	00e7e7b3          	or	a5,a5,a4
    e71c:	00078593          	mv	a1,a5
    e720:	01010113          	add	sp,sp,16
    e724:	00008067          	ret
    e728:	00c12083          	lw	ra,12(sp)
    e72c:	00040513          	mv	a0,s0
    e730:	00000793          	li	a5,0
    e734:	00812403          	lw	s0,8(sp)
    e738:	00000713          	li	a4,0
    e73c:	01479793          	sll	a5,a5,0x14
    e740:	00e7e7b3          	or	a5,a5,a4
    e744:	00078593          	mv	a1,a5
    e748:	01010113          	add	sp,sp,16
    e74c:	00008067          	ret
    e750:	ff550513          	add	a0,a0,-11
    e754:	00a41733          	sll	a4,s0,a0
    e758:	00000413          	li	s0,0
    e75c:	00c12083          	lw	ra,12(sp)
    e760:	00040513          	mv	a0,s0
    e764:	00c71713          	sll	a4,a4,0xc
    e768:	00812403          	lw	s0,8(sp)
    e76c:	00c75713          	srl	a4,a4,0xc
    e770:	01479793          	sll	a5,a5,0x14
    e774:	00e7e7b3          	or	a5,a5,a4
    e778:	00078593          	mv	a1,a5
    e77c:	01010113          	add	sp,sp,16
    e780:	00008067          	ret

0000e784 <__trunctfdf2>:
    e784:	00c52583          	lw	a1,12(a0)
    e788:	00852783          	lw	a5,8(a0)
    e78c:	00052803          	lw	a6,0(a0)
    e790:	00452683          	lw	a3,4(a0)
    e794:	01059613          	sll	a2,a1,0x10
    e798:	fe010113          	add	sp,sp,-32
    e79c:	00159713          	sll	a4,a1,0x1
    e7a0:	01065613          	srl	a2,a2,0x10
    e7a4:	00f12423          	sw	a5,8(sp)
    e7a8:	00b12623          	sw	a1,12(sp)
    e7ac:	00f12c23          	sw	a5,24(sp)
    e7b0:	01012023          	sw	a6,0(sp)
    e7b4:	00d12223          	sw	a3,4(sp)
    e7b8:	01012823          	sw	a6,16(sp)
    e7bc:	00d12a23          	sw	a3,20(sp)
    e7c0:	00c12e23          	sw	a2,28(sp)
    e7c4:	01175713          	srl	a4,a4,0x11
    e7c8:	01f5d593          	srl	a1,a1,0x1f
    e7cc:	01010893          	add	a7,sp,16
    e7d0:	01c10793          	add	a5,sp,28
    e7d4:	00361513          	sll	a0,a2,0x3
    e7d8:	ffc7a603          	lw	a2,-4(a5)
    e7dc:	ffc78793          	add	a5,a5,-4
    e7e0:	01d65693          	srl	a3,a2,0x1d
    e7e4:	00a6e6b3          	or	a3,a3,a0
    e7e8:	00d7a223          	sw	a3,4(a5)
    e7ec:	fef894e3          	bne	a7,a5,e7d4 <__trunctfdf2+0x50>
    e7f0:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e7f4:	00381813          	sll	a6,a6,0x3
    e7f8:	01169613          	sll	a2,a3,0x11
    e7fc:	01012823          	sw	a6,16(sp)
    e800:	01265613          	srl	a2,a2,0x12
    e804:	04060263          	beqz	a2,e848 <__trunctfdf2+0xc4>
    e808:	ffffc6b7          	lui	a3,0xffffc
    e80c:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e810:	00d70733          	add	a4,a4,a3
    e814:	7fe00693          	li	a3,2046
    e818:	10e6d463          	bge	a3,a4,e920 <__trunctfdf2+0x19c>
    e81c:	7ff00793          	li	a5,2047
    e820:	00000613          	li	a2,0
    e824:	00000693          	li	a3,0
    e828:	01479793          	sll	a5,a5,0x14
    e82c:	01f59593          	sll	a1,a1,0x1f
    e830:	00c7e7b3          	or	a5,a5,a2
    e834:	00b7e7b3          	or	a5,a5,a1
    e838:	00068513          	mv	a0,a3
    e83c:	00078593          	mv	a1,a5
    e840:	02010113          	add	sp,sp,32
    e844:	00008067          	ret
    e848:	01412603          	lw	a2,20(sp)
    e84c:	01812883          	lw	a7,24(sp)
    e850:	01c12503          	lw	a0,28(sp)
    e854:	011666b3          	or	a3,a2,a7
    e858:	00a6e6b3          	or	a3,a3,a0
    e85c:	0106e6b3          	or	a3,a3,a6
    e860:	04071463          	bnez	a4,e8a8 <__trunctfdf2+0x124>
    e864:	14068263          	beqz	a3,e9a8 <__trunctfdf2+0x224>
    e868:	00500693          	li	a3,5
    e86c:	00000613          	li	a2,0
    e870:	0036d793          	srl	a5,a3,0x3
    e874:	01d61693          	sll	a3,a2,0x1d
    e878:	00f6e6b3          	or	a3,a3,a5
    e87c:	00961613          	sll	a2,a2,0x9
    e880:	7ff77793          	and	a5,a4,2047
    e884:	00c65613          	srl	a2,a2,0xc
    e888:	01479793          	sll	a5,a5,0x14
    e88c:	01f59593          	sll	a1,a1,0x1f
    e890:	00c7e7b3          	or	a5,a5,a2
    e894:	00b7e7b3          	or	a5,a5,a1
    e898:	00068513          	mv	a0,a3
    e89c:	00078593          	mv	a1,a5
    e8a0:	02010113          	add	sp,sp,32
    e8a4:	00008067          	ret
    e8a8:	12068463          	beqz	a3,e9d0 <__trunctfdf2+0x24c>
    e8ac:	01c8d793          	srl	a5,a7,0x1c
    e8b0:	00451513          	sll	a0,a0,0x4
    e8b4:	00a7e7b3          	or	a5,a5,a0
    e8b8:	008006b7          	lui	a3,0x800
    e8bc:	00d7f6b3          	and	a3,a5,a3
    e8c0:	1c068263          	beqz	a3,ea84 <__trunctfdf2+0x300>
    e8c4:	ff800737          	lui	a4,0xff800
    e8c8:	01c65693          	srl	a3,a2,0x1c
    e8cc:	00489893          	sll	a7,a7,0x4
    e8d0:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e8d4:	00e7f633          	and	a2,a5,a4
    e8d8:	0116e6b3          	or	a3,a3,a7
    e8dc:	004007b7          	lui	a5,0x400
    e8e0:	00f66633          	or	a2,a2,a5
    e8e4:	ff86f693          	and	a3,a3,-8
    e8e8:	00000793          	li	a5,0
    e8ec:	0036d713          	srl	a4,a3,0x3
    e8f0:	01d61693          	sll	a3,a2,0x1d
    e8f4:	00961613          	sll	a2,a2,0x9
    e8f8:	00c65613          	srl	a2,a2,0xc
    e8fc:	01479793          	sll	a5,a5,0x14
    e900:	01f59593          	sll	a1,a1,0x1f
    e904:	00c7e7b3          	or	a5,a5,a2
    e908:	00e6e6b3          	or	a3,a3,a4
    e90c:	00b7e7b3          	or	a5,a5,a1
    e910:	00068513          	mv	a0,a3
    e914:	00078593          	mv	a1,a5
    e918:	02010113          	add	sp,sp,32
    e91c:	00008067          	ret
    e920:	0ce05c63          	blez	a4,e9f8 <__trunctfdf2+0x274>
    e924:	01412783          	lw	a5,20(sp)
    e928:	01812503          	lw	a0,24(sp)
    e92c:	01c12603          	lw	a2,28(sp)
    e930:	00479693          	sll	a3,a5,0x4
    e934:	0106e6b3          	or	a3,a3,a6
    e938:	01c7d793          	srl	a5,a5,0x1c
    e93c:	00451813          	sll	a6,a0,0x4
    e940:	00461613          	sll	a2,a2,0x4
    e944:	01c55513          	srl	a0,a0,0x1c
    e948:	00d036b3          	snez	a3,a3
    e94c:	0107e7b3          	or	a5,a5,a6
    e950:	00a66633          	or	a2,a2,a0
    e954:	00f6e6b3          	or	a3,a3,a5
    e958:	0076f793          	and	a5,a3,7
    e95c:	02078063          	beqz	a5,e97c <__trunctfdf2+0x1f8>
    e960:	00f6f793          	and	a5,a3,15
    e964:	00400513          	li	a0,4
    e968:	00a78a63          	beq	a5,a0,e97c <__trunctfdf2+0x1f8>
    e96c:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    e970:	00d7b6b3          	sltu	a3,a5,a3
    e974:	00d60633          	add	a2,a2,a3
    e978:	00078693          	mv	a3,a5
    e97c:	008007b7          	lui	a5,0x800
    e980:	00f677b3          	and	a5,a2,a5
    e984:	ee0786e3          	beqz	a5,e870 <__trunctfdf2+0xec>
    e988:	00170713          	add	a4,a4,1
    e98c:	7ff00793          	li	a5,2047
    e990:	e8f706e3          	beq	a4,a5,e81c <__trunctfdf2+0x98>
    e994:	ff8007b7          	lui	a5,0xff800
    e998:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e99c:	00f67633          	and	a2,a2,a5
    e9a0:	7ff77793          	and	a5,a4,2047
    e9a4:	f49ff06f          	j	e8ec <__trunctfdf2+0x168>
    e9a8:	00000793          	li	a5,0
    e9ac:	00000613          	li	a2,0
    e9b0:	01479793          	sll	a5,a5,0x14
    e9b4:	01f59593          	sll	a1,a1,0x1f
    e9b8:	00c7e7b3          	or	a5,a5,a2
    e9bc:	00b7e7b3          	or	a5,a5,a1
    e9c0:	00068513          	mv	a0,a3
    e9c4:	00078593          	mv	a1,a5
    e9c8:	02010113          	add	sp,sp,32
    e9cc:	00008067          	ret
    e9d0:	7ff00793          	li	a5,2047
    e9d4:	00000613          	li	a2,0
    e9d8:	01479793          	sll	a5,a5,0x14
    e9dc:	01f59593          	sll	a1,a1,0x1f
    e9e0:	00c7e7b3          	or	a5,a5,a2
    e9e4:	00b7e7b3          	or	a5,a5,a1
    e9e8:	00068513          	mv	a0,a3
    e9ec:	00078593          	mv	a1,a5
    e9f0:	02010113          	add	sp,sp,32
    e9f4:	00008067          	ret
    e9f8:	fcc00693          	li	a3,-52
    e9fc:	08d74c63          	blt	a4,a3,ea94 <__trunctfdf2+0x310>
    ea00:	03d00693          	li	a3,61
    ea04:	40e686b3          	sub	a3,a3,a4
    ea08:	01c12703          	lw	a4,28(sp)
    ea0c:	4056de13          	sra	t3,a3,0x5
    ea10:	00080eb7          	lui	t4,0x80
    ea14:	00eeeeb3          	or	t4,t4,a4
    ea18:	002e1513          	sll	a0,t3,0x2
    ea1c:	01d12e23          	sw	t4,28(sp)
    ea20:	01f6f693          	and	a3,a3,31
    ea24:	00a88833          	add	a6,a7,a0
    ea28:	00088613          	mv	a2,a7
    ea2c:	00000713          	li	a4,0
    ea30:	00062303          	lw	t1,0(a2)
    ea34:	00460613          	add	a2,a2,4
    ea38:	00676733          	or	a4,a4,t1
    ea3c:	fec81ae3          	bne	a6,a2,ea30 <__trunctfdf2+0x2ac>
    ea40:	00300613          	li	a2,3
    ea44:	41c60633          	sub	a2,a2,t3
    ea48:	04069a63          	bnez	a3,ea9c <__trunctfdf2+0x318>
    ea4c:	00082803          	lw	a6,0(a6)
    ea50:	00168693          	add	a3,a3,1
    ea54:	00478793          	add	a5,a5,4
    ea58:	ff07ae23          	sw	a6,-4(a5)
    ea5c:	00d64e63          	blt	a2,a3,ea78 <__trunctfdf2+0x2f4>
    ea60:	00a78833          	add	a6,a5,a0
    ea64:	00082803          	lw	a6,0(a6)
    ea68:	00168693          	add	a3,a3,1
    ea6c:	00478793          	add	a5,a5,4
    ea70:	ff07ae23          	sw	a6,-4(a5)
    ea74:	fed656e3          	bge	a2,a3,ea60 <__trunctfdf2+0x2dc>
    ea78:	00400793          	li	a5,4
    ea7c:	41c787b3          	sub	a5,a5,t3
    ea80:	0840006f          	j	eb04 <__trunctfdf2+0x380>
    ea84:	00000593          	li	a1,0
    ea88:	7ff00793          	li	a5,2047
    ea8c:	00080637          	lui	a2,0x80
    ea90:	d99ff06f          	j	e828 <__trunctfdf2+0xa4>
    ea94:	00000713          	li	a4,0
    ea98:	dd1ff06f          	j	e868 <__trunctfdf2+0xe4>
    ea9c:	02050813          	add	a6,a0,32
    eaa0:	00280833          	add	a6,a6,sp
    eaa4:	ff082803          	lw	a6,-16(a6)
    eaa8:	02000f13          	li	t5,32
    eaac:	40df0f33          	sub	t5,t5,a3
    eab0:	01e81833          	sll	a6,a6,t5
    eab4:	01076733          	or	a4,a4,a6
    eab8:	08060e63          	beqz	a2,eb54 <__trunctfdf2+0x3d0>
    eabc:	00261813          	sll	a6,a2,0x2
    eac0:	00f80fb3          	add	t6,a6,a5
    eac4:	00a88633          	add	a2,a7,a0
    eac8:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    eacc:	00462303          	lw	t1,4(a2)
    ead0:	00478793          	add	a5,a5,4
    ead4:	00d55533          	srl	a0,a0,a3
    ead8:	01e31333          	sll	t1,t1,t5
    eadc:	00656533          	or	a0,a0,t1
    eae0:	fea7ae23          	sw	a0,-4(a5)
    eae4:	00460613          	add	a2,a2,4
    eae8:	feff90e3          	bne	t6,a5,eac8 <__trunctfdf2+0x344>
    eaec:	00400793          	li	a5,4
    eaf0:	41c787b3          	sub	a5,a5,t3
    eaf4:	02080613          	add	a2,a6,32
    eaf8:	00260633          	add	a2,a2,sp
    eafc:	00dedeb3          	srl	t4,t4,a3
    eb00:	ffd62823          	sw	t4,-16(a2)
    eb04:	00400693          	li	a3,4
    eb08:	40f686b3          	sub	a3,a3,a5
    eb0c:	00269693          	sll	a3,a3,0x2
    eb10:	00279793          	sll	a5,a5,0x2
    eb14:	00800613          	li	a2,8
    eb18:	00f888b3          	add	a7,a7,a5
    eb1c:	00c6ea63          	bltu	a3,a2,eb30 <__trunctfdf2+0x3ac>
    eb20:	0008a023          	sw	zero,0(a7)
    eb24:	0008a223          	sw	zero,4(a7)
    eb28:	ff868693          	add	a3,a3,-8
    eb2c:	00888893          	add	a7,a7,8
    eb30:	00400793          	li	a5,4
    eb34:	00f6e463          	bltu	a3,a5,eb3c <__trunctfdf2+0x3b8>
    eb38:	0008a023          	sw	zero,0(a7)
    eb3c:	01012783          	lw	a5,16(sp)
    eb40:	00e03733          	snez	a4,a4
    eb44:	01412603          	lw	a2,20(sp)
    eb48:	00f766b3          	or	a3,a4,a5
    eb4c:	00000713          	li	a4,0
    eb50:	e09ff06f          	j	e958 <__trunctfdf2+0x1d4>
    eb54:	00100793          	li	a5,1
    eb58:	00000813          	li	a6,0
    eb5c:	f99ff06f          	j	eaf4 <__trunctfdf2+0x370>

0000eb60 <__mulsi3>:
    eb60:	00050613          	mv	a2,a0
    eb64:	00000513          	li	a0,0
    eb68:	0015f693          	and	a3,a1,1
    eb6c:	00068463          	beqz	a3,eb74 <__mulsi3+0x14>
    eb70:	00c50533          	add	a0,a0,a2
    eb74:	0015d593          	srl	a1,a1,0x1
    eb78:	00161613          	sll	a2,a2,0x1
    eb7c:	fe0596e3          	bnez	a1,eb68 <__mulsi3+0x8>
    eb80:	00008067          	ret

0000eb84 <__muldi3>:
    eb84:	ff010113          	add	sp,sp,-16
    eb88:	00812423          	sw	s0,8(sp)
    eb8c:	00050413          	mv	s0,a0
    eb90:	00112623          	sw	ra,12(sp)
    eb94:	00060513          	mv	a0,a2
    eb98:	00068393          	mv	t2,a3
    eb9c:	00040713          	mv	a4,s0
    eba0:	00060813          	mv	a6,a2
    eba4:	00000793          	li	a5,0
    eba8:	00000313          	li	t1,0
    ebac:	00000f13          	li	t5,0
    ebb0:	01e708b3          	add	a7,a4,t5
    ebb4:	00187e93          	and	t4,a6,1
    ebb8:	00f30fb3          	add	t6,t1,a5
    ebbc:	01f75e13          	srl	t3,a4,0x1f
    ebc0:	00185813          	srl	a6,a6,0x1
    ebc4:	00e8b2b3          	sltu	t0,a7,a4
    ebc8:	00179793          	sll	a5,a5,0x1
    ebcc:	000e8663          	beqz	t4,ebd8 <__muldi3+0x54>
    ebd0:	00088f13          	mv	t5,a7
    ebd4:	01f28333          	add	t1,t0,t6
    ebd8:	00171713          	sll	a4,a4,0x1
    ebdc:	01c7e7b3          	or	a5,a5,t3
    ebe0:	fc0818e3          	bnez	a6,ebb0 <__muldi3+0x2c>
    ebe4:	00058663          	beqz	a1,ebf0 <__muldi3+0x6c>
    ebe8:	f79ff0ef          	jal	eb60 <__mulsi3>
    ebec:	00650333          	add	t1,a0,t1
    ebf0:	00038a63          	beqz	t2,ec04 <__muldi3+0x80>
    ebf4:	00040513          	mv	a0,s0
    ebf8:	00038593          	mv	a1,t2
    ebfc:	f65ff0ef          	jal	eb60 <__mulsi3>
    ec00:	00650333          	add	t1,a0,t1
    ec04:	00c12083          	lw	ra,12(sp)
    ec08:	00812403          	lw	s0,8(sp)
    ec0c:	000f0513          	mv	a0,t5
    ec10:	00030593          	mv	a1,t1
    ec14:	01010113          	add	sp,sp,16
    ec18:	00008067          	ret

0000ec1c <__divsi3>:
    ec1c:	06054063          	bltz	a0,ec7c <__umodsi3+0x10>
    ec20:	0605c663          	bltz	a1,ec8c <__umodsi3+0x20>

0000ec24 <__hidden___udivsi3>:
    ec24:	00058613          	mv	a2,a1
    ec28:	00050593          	mv	a1,a0
    ec2c:	fff00513          	li	a0,-1
    ec30:	02060c63          	beqz	a2,ec68 <__hidden___udivsi3+0x44>
    ec34:	00100693          	li	a3,1
    ec38:	00b67a63          	bgeu	a2,a1,ec4c <__hidden___udivsi3+0x28>
    ec3c:	00c05863          	blez	a2,ec4c <__hidden___udivsi3+0x28>
    ec40:	00161613          	sll	a2,a2,0x1
    ec44:	00169693          	sll	a3,a3,0x1
    ec48:	feb66ae3          	bltu	a2,a1,ec3c <__hidden___udivsi3+0x18>
    ec4c:	00000513          	li	a0,0
    ec50:	00c5e663          	bltu	a1,a2,ec5c <__hidden___udivsi3+0x38>
    ec54:	40c585b3          	sub	a1,a1,a2
    ec58:	00d56533          	or	a0,a0,a3
    ec5c:	0016d693          	srl	a3,a3,0x1
    ec60:	00165613          	srl	a2,a2,0x1
    ec64:	fe0696e3          	bnez	a3,ec50 <__hidden___udivsi3+0x2c>
    ec68:	00008067          	ret

0000ec6c <__umodsi3>:
    ec6c:	00008293          	mv	t0,ra
    ec70:	fb5ff0ef          	jal	ec24 <__hidden___udivsi3>
    ec74:	00058513          	mv	a0,a1
    ec78:	00028067          	jr	t0
    ec7c:	40a00533          	neg	a0,a0
    ec80:	00b04863          	bgtz	a1,ec90 <__umodsi3+0x24>
    ec84:	40b005b3          	neg	a1,a1
    ec88:	f9dff06f          	j	ec24 <__hidden___udivsi3>
    ec8c:	40b005b3          	neg	a1,a1
    ec90:	00008293          	mv	t0,ra
    ec94:	f91ff0ef          	jal	ec24 <__hidden___udivsi3>
    ec98:	40a00533          	neg	a0,a0
    ec9c:	00028067          	jr	t0

0000eca0 <__modsi3>:
    eca0:	00008293          	mv	t0,ra
    eca4:	0005ca63          	bltz	a1,ecb8 <__modsi3+0x18>
    eca8:	00054c63          	bltz	a0,ecc0 <__modsi3+0x20>
    ecac:	f79ff0ef          	jal	ec24 <__hidden___udivsi3>
    ecb0:	00058513          	mv	a0,a1
    ecb4:	00028067          	jr	t0
    ecb8:	40b005b3          	neg	a1,a1
    ecbc:	fe0558e3          	bgez	a0,ecac <__modsi3+0xc>
    ecc0:	40a00533          	neg	a0,a0
    ecc4:	f61ff0ef          	jal	ec24 <__hidden___udivsi3>
    ecc8:	40b00533          	neg	a0,a1
    eccc:	00028067          	jr	t0

0000ecd0 <__clzsi2>:
    ecd0:	000107b7          	lui	a5,0x10
    ecd4:	02f57a63          	bgeu	a0,a5,ed08 <__clzsi2+0x38>
    ecd8:	10053793          	sltiu	a5,a0,256
    ecdc:	0017b793          	seqz	a5,a5
    ece0:	00379793          	sll	a5,a5,0x3
    ece4:	02000713          	li	a4,32
    ece8:	40f70733          	sub	a4,a4,a5
    ecec:	00f55533          	srl	a0,a0,a5
    ecf0:	00001797          	auipc	a5,0x1
    ecf4:	9e078793          	add	a5,a5,-1568 # f6d0 <__clz_tab>
    ecf8:	00a787b3          	add	a5,a5,a0
    ecfc:	0007c503          	lbu	a0,0(a5)
    ed00:	40a70533          	sub	a0,a4,a0
    ed04:	00008067          	ret
    ed08:	010007b7          	lui	a5,0x1000
    ed0c:	02f57463          	bgeu	a0,a5,ed34 <__clzsi2+0x64>
    ed10:	01000793          	li	a5,16
    ed14:	00f55533          	srl	a0,a0,a5
    ed18:	00001797          	auipc	a5,0x1
    ed1c:	9b878793          	add	a5,a5,-1608 # f6d0 <__clz_tab>
    ed20:	00a787b3          	add	a5,a5,a0
    ed24:	0007c503          	lbu	a0,0(a5)
    ed28:	01000713          	li	a4,16
    ed2c:	40a70533          	sub	a0,a4,a0
    ed30:	00008067          	ret
    ed34:	01800793          	li	a5,24
    ed38:	00f55533          	srl	a0,a0,a5
    ed3c:	00001797          	auipc	a5,0x1
    ed40:	99478793          	add	a5,a5,-1644 # f6d0 <__clz_tab>
    ed44:	00a787b3          	add	a5,a5,a0
    ed48:	0007c503          	lbu	a0,0(a5)
    ed4c:	00800713          	li	a4,8
    ed50:	40a70533          	sub	a0,a4,a0
    ed54:	00008067          	ret
