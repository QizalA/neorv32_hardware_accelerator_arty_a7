
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x234>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00010397          	auipc	t2,0x10
      38:	82c38393          	add	t2,t2,-2004 # f860 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80001597          	auipc	a1,0x80001
      58:	08058593          	add	a1,a1,128 # 800010d4 <__crt0_bss_end>
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
     110:	c0c40413          	add	s0,s0,-1012 # ed18 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	c0448493          	add	s1,s1,-1020 # ed18 <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	1a060613          	add	a2,a2,416 # 2d0 <main>

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
     178:	ba440413          	add	s0,s0,-1116 # ed18 <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	b9c48493          	add	s1,s1,-1124 # ed18 <__fini_array_end>

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

0000020c <print_speedup_fixed>:

/* =======================
   Fixed-point printer (X.YYYx)
   ======================= */
static void print_speedup_fixed(uint64_t num, uint64_t den) {
  if (!den) { printf("    n/a    "); return; }
     20c:	00d667b3          	or	a5,a2,a3
     210:	00079863          	bnez	a5,220 <print_speedup_fixed+0x14>
     214:	0000f537          	lui	a0,0xf
     218:	d1850513          	add	a0,a0,-744 # ed18 <__fini_array_end>
     21c:	2b90006f          	j	cd4 <printf>
static void print_speedup_fixed(uint64_t num, uint64_t den) {
     220:	fe010113          	add	sp,sp,-32
     224:	00812c23          	sw	s0,24(sp)
     228:	00912a23          	sw	s1,20(sp)
     22c:	00068413          	mv	s0,a3
  uint64_t s = (num * 1000ull + den/2) / den;
     230:	00060493          	mv	s1,a2
     234:	00000693          	li	a3,0
     238:	3e800613          	li	a2,1000
static void print_speedup_fixed(uint64_t num, uint64_t den) {
     23c:	00112e23          	sw	ra,28(sp)
  uint64_t s = (num * 1000ull + den/2) / den;
     240:	1050e0ef          	jal	eb44 <__muldi3>
     244:	00050793          	mv	a5,a0
     248:	01f41713          	sll	a4,s0,0x1f
     24c:	0014d513          	srl	a0,s1,0x1
     250:	00a76533          	or	a0,a4,a0
     254:	00a78533          	add	a0,a5,a0
     258:	00145713          	srl	a4,s0,0x1
     25c:	00f537b3          	sltu	a5,a0,a5
     260:	00e585b3          	add	a1,a1,a4
     264:	00b785b3          	add	a1,a5,a1
     268:	00048613          	mv	a2,s1
     26c:	00040693          	mv	a3,s0
     270:	0dc0b0ef          	jal	b34c <__udivdi3>
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     274:	3e800613          	li	a2,1000
     278:	00000693          	li	a3,0
  uint64_t s = (num * 1000ull + den/2) / den;
     27c:	00050493          	mv	s1,a0
     280:	00058413          	mv	s0,a1
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     284:	7740b0ef          	jal	b9f8 <__umoddi3>
     288:	00a12623          	sw	a0,12(sp)
     28c:	00b12423          	sw	a1,8(sp)
     290:	3e800613          	li	a2,1000
     294:	00000693          	li	a3,0
     298:	00048513          	mv	a0,s1
     29c:	00040593          	mv	a1,s0
     2a0:	0ac0b0ef          	jal	b34c <__udivdi3>
}
     2a4:	01812403          	lw	s0,24(sp)
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2a8:	00c12703          	lw	a4,12(sp)
     2ac:	00812783          	lw	a5,8(sp)
}
     2b0:	01c12083          	lw	ra,28(sp)
     2b4:	01412483          	lw	s1,20(sp)
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2b8:	00050613          	mv	a2,a0
     2bc:	0000f537          	lui	a0,0xf
     2c0:	00058693          	mv	a3,a1
     2c4:	d2450513          	add	a0,a0,-732 # ed24 <__fini_array_end+0xc>
}
     2c8:	02010113          	add	sp,sp,32
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2cc:	2090006f          	j	cd4 <printf>

000002d0 <main>:
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     2d0:	ffeb07b7          	lui	a5,0xffeb0
     2d4:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>

/* =======================
   Main
   ======================= */
int main(void) {
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     2d8:	0000f537          	lui	a0,0xf
int main(void) {
     2dc:	f7010113          	add	sp,sp,-144
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     2e0:	d6450513          	add	a0,a0,-668 # ed64 <__fini_array_end+0x4c>
int main(void) {
     2e4:	08112623          	sw	ra,140(sp)
     2e8:	09212023          	sw	s2,128(sp)
     2ec:	07312e23          	sw	s3,124(sp)
     2f0:	07512a23          	sw	s5,116(sp)
     2f4:	07612823          	sw	s6,112(sp)
     2f8:	05b12e23          	sw	s11,92(sp)
     2fc:	08812423          	sw	s0,136(sp)
     300:	08912223          	sw	s1,132(sp)
     304:	07412c23          	sw	s4,120(sp)
     308:	07712623          	sw	s7,108(sp)
     30c:	07812423          	sw	s8,104(sp)
     310:	07912223          	sw	s9,100(sp)
     314:	07a12023          	sw	s10,96(sp)
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     318:	1bd000ef          	jal	cd4 <printf>
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     31c:	ec9ff0ef          	jal	1e4 <rdcycle>
     320:	00050913          	mv	s2,a0
     324:	00058b13          	mv	s6,a1
     328:	ed1ff0ef          	jal	1f8 <rdinstret>
     32c:	00050a93          	mv	s5,a0
     330:	00058993          	mv	s3,a1
     334:	00100693          	li	a3,1
  int64_t checksum = 0;
     338:	00000d93          	li	s11,0
     33c:	00000893          	li	a7,0
    for (int j = 0; j < N; ++j) {
     340:	0ff6f613          	zext.b	a2,a3
     344:	00261793          	sll	a5,a2,0x2
     348:	40f607b3          	sub	a5,a2,a5
     34c:	0ff7fd13          	zext.b	s10,a5
      int32_t s = 0;
     350:	0f600493          	li	s1,246
     354:	10000793          	li	a5,256
     358:	0880006f          	j	3e0 <main+0x110>
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     35c:	00fa7513          	and	a0,s4,15
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     360:	00fbf593          	and	a1,s7,15
        s += (int32_t)pattA(i, k) * (int32_t)pattB(k, j);
     364:	ff858593          	add	a1,a1,-8
     368:	ff850513          	add	a0,a0,-8
     36c:	01112a23          	sw	a7,20(sp)
     370:	00d12823          	sw	a3,16(sp)
     374:	00c12623          	sw	a2,12(sp)
     378:	00f12423          	sw	a5,8(sp)
     37c:	7a40e0ef          	jal	eb20 <__mulsi3>
      for (int k = 0; k < N; ++k) {
     380:	00c12603          	lw	a2,12(sp)
     384:	017c8bb3          	add	s7,s9,s7
     388:	fffc0c13          	add	s8,s8,-1
     38c:	01460a33          	add	s4,a2,s4
     390:	00812783          	lw	a5,8(sp)
     394:	01012683          	lw	a3,16(sp)
     398:	01412883          	lw	a7,20(sp)
        s += (int32_t)pattA(i, k) * (int32_t)pattB(k, j);
     39c:	00a40433          	add	s0,s0,a0
      for (int k = 0; k < N; ++k) {
     3a0:	0ffa7a13          	zext.b	s4,s4
     3a4:	0ffbfb93          	zext.b	s7,s7
     3a8:	10100813          	li	a6,257
     3ac:	fa0c18e3          	bnez	s8,35c <main+0x8c>
      checksum += (int64_t)s;
     3b0:	41f45713          	sra	a4,s0,0x1f
     3b4:	008d8433          	add	s0,s11,s0
     3b8:	01b43db3          	sltu	s11,s0,s11
     3bc:	00e88733          	add	a4,a7,a4
     3c0:	00ed8733          	add	a4,s11,a4
    for (int j = 0; j < N; ++j) {
     3c4:	00548493          	add	s1,s1,5
      checksum += (int64_t)s;
     3c8:	00e12423          	sw	a4,8(sp)
    for (int j = 0; j < N; ++j) {
     3cc:	fff78793          	add	a5,a5,-1
      checksum += (int64_t)s;
     3d0:	00040d93          	mv	s11,s0
     3d4:	00070893          	mv	a7,a4
    for (int j = 0; j < N; ++j) {
     3d8:	0ff4f493          	zext.b	s1,s1
     3dc:	02078063          	beqz	a5,3fc <main+0x12c>
      for (int k = 0; k < N; ++k) {
     3e0:	00278c93          	add	s9,a5,2
     3e4:	0ffcfc93          	zext.b	s9,s9
int main(void) {
     3e8:	00048b93          	mv	s7,s1
     3ec:	000d0a13          	mv	s4,s10
     3f0:	10000c13          	li	s8,256
      int32_t s = 0;
     3f4:	00000413          	li	s0,0
     3f8:	f65ff06f          	j	35c <main+0x8c>
  for (int i = 0; i < N; ++i) {
     3fc:	00168693          	add	a3,a3,1
     400:	f50690e3          	bne	a3,a6,340 <main+0x70>
  uint64_t i1 = rdinstret(), c1 = rdcycle();
     404:	df5ff0ef          	jal	1f8 <rdinstret>
     408:	00050493          	mv	s1,a0
     40c:	00058a13          	mv	s4,a1
     410:	dd5ff0ef          	jal	1e4 <rdcycle>
  *out_cycles  = c1 - c0;
     414:	412507b3          	sub	a5,a0,s2
     418:	00f12623          	sw	a5,12(sp)
     41c:	416585b3          	sub	a1,a1,s6
     420:	00f537b3          	sltu	a5,a0,a5
     424:	40f587b3          	sub	a5,a1,a5
     428:	00f12823          	sw	a5,16(sp)
  *out_instret = i1 - i0;
     42c:	415487b3          	sub	a5,s1,s5
     430:	413a0a33          	sub	s4,s4,s3
     434:	00f4b4b3          	sltu	s1,s1,a5
     438:	00f12a23          	sw	a5,20(sp)
     43c:	409a07b3          	sub	a5,s4,s1
     440:	00f12e23          	sw	a5,28(sp)
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     444:	da1ff0ef          	jal	1e4 <rdcycle>
     448:	02a12023          	sw	a0,32(sp)
     44c:	02b12223          	sw	a1,36(sp)
     450:	da9ff0ef          	jal	1f8 <rdinstret>
     454:	800017b7          	lui	a5,0x80001
     458:	b7478793          	add	a5,a5,-1164 # 80000b74 <A_flat.2>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     45c:	ffeb0937          	lui	s2,0xffeb0
     460:	ffeb0337          	lui	t1,0xffeb0
     464:	ffeb0e37          	lui	t3,0xffeb0
     468:	ffeb0eb7          	lui	t4,0xffeb0
     46c:	ffeb0f37          	lui	t5,0xffeb0
     470:	ffeb0fb7          	lui	t6,0xffeb0
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     474:	02a12423          	sw	a0,40(sp)
     478:	02b12623          	sw	a1,44(sp)
  int64_t checksum = 0;
     47c:	00000a13          	li	s4,0
     480:	00000993          	li	s3,0
  for (int i0 = 0; i0 < N; i0 += TILE) {
     484:	00000693          	li	a3,0
     488:	00f12c23          	sw	a5,24(sp)
     48c:	80000c37          	lui	s8,0x80000
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     490:	00490913          	add	s2,s2,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     494:	00830313          	add	t1,t1,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     498:	00ce0e13          	add	t3,t3,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     49c:	010e8e93          	add	t4,t4,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     4a0:	014f0f13          	add	t5,t5,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     4a4:	018f8f93          	add	t6,t6,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
    for (int r = 0; r < TILE; ++r)
     4a8:	00168793          	add	a5,a3,1
     4ac:	0ff7f793          	zext.b	a5,a5
      for (int k = 0; k < N; ++k)
     4b0:	00000613          	li	a2,0
     4b4:	10000893          	li	a7,256
    for (int r = 0; r < TILE; ++r)
     4b8:	40000813          	li	a6,1024
     4bc:	0340006f          	j	4f0 <main+0x220>
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     4c0:	00f77513          	and	a0,a4,15
        A_flat[r*LDA + k] = pattA(i0 + r, k);
     4c4:	00b283b3          	add	t2,t0,a1
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     4c8:	ff850513          	add	a0,a0,-8
      for (int k = 0; k < N; ++k)
     4cc:	00e78733          	add	a4,a5,a4
        A_flat[r*LDA + k] = pattA(i0 + r, k);
     4d0:	00a38023          	sb	a0,0(t2)
      for (int k = 0; k < N; ++k)
     4d4:	00158593          	add	a1,a1,1
     4d8:	0ff77713          	zext.b	a4,a4
     4dc:	ff1592e3          	bne	a1,a7,4c0 <main+0x1f0>
    for (int r = 0; r < TILE; ++r)
     4e0:	00178793          	add	a5,a5,1
     4e4:	10060613          	add	a2,a2,256
     4e8:	0ff7f793          	zext.b	a5,a5
     4ec:	03060063          	beq	a2,a6,50c <main+0x23c>
        A_flat[r*LDA + k] = pattA(i0 + r, k);
     4f0:	01812503          	lw	a0,24(sp)
     4f4:	00279713          	sll	a4,a5,0x2
     4f8:	40e78733          	sub	a4,a5,a4
     4fc:	0ff77713          	zext.b	a4,a4
      for (int k = 0; k < N; ++k)
     500:	00000593          	li	a1,0
        A_flat[r*LDA + k] = pattA(i0 + r, k);
     504:	00c502b3          	add	t0,a0,a2
     508:	fb9ff06f          	j	4c0 <main+0x1f0>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     50c:	ffeb02b7          	lui	t0,0xffeb0
     510:	ffeb03b7          	lui	t2,0xffeb0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     514:	ffeb00b7          	lui	ra,0xffeb0
     518:	0f600793          	li	a5,246
    for (int j0 = 0; j0 < N; j0 += TILE) {
     51c:	00000813          	li	a6,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     520:	01c28293          	add	t0,t0,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     524:	02038393          	add	t2,t2,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     528:	04008093          	add	ra,ra,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
      for (int k = 0; k < N; ++k) {
     52c:	0ff87b13          	zext.b	s6,a6
     530:	00200a93          	li	s5,2
     534:	00100493          	li	s1,1
     538:	416a8ab3          	sub	s5,s5,s6
     53c:	416484b3          	sub	s1,s1,s6
     540:	00578513          	add	a0,a5,5
     544:	00a78593          	add	a1,a5,10
     548:	00f78713          	add	a4,a5,15
     54c:	0ffafa93          	zext.b	s5,s5
     550:	0ff4f493          	zext.b	s1,s1
     554:	0ff57513          	zext.b	a0,a0
     558:	0ff5f593          	zext.b	a1,a1
     55c:	0ff77713          	zext.b	a4,a4
      for (int k = 0; k < N; ++k)
     560:	774c0613          	add	a2,s8,1908 # 80000774 <B_flat.1>
     564:	00078893          	mv	a7,a5
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     568:	00f8fb93          	and	s7,a7,15
     56c:	ff8b8b93          	add	s7,s7,-8
        B_flat[k*LDB + 0] = pattB(k, j0 + 0);
     570:	01760023          	sb	s7,0(a2)
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     574:	00f57b93          	and	s7,a0,15
     578:	ff8b8b93          	add	s7,s7,-8
        B_flat[k*LDB + 1] = pattB(k, j0 + 1);
     57c:	017600a3          	sb	s7,1(a2)
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     580:	00f5fb93          	and	s7,a1,15
     584:	ff8b8b93          	add	s7,s7,-8
        B_flat[k*LDB + 2] = pattB(k, j0 + 2);
     588:	01760123          	sb	s7,2(a2)
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     58c:	00f77b93          	and	s7,a4,15
     590:	ff8b8b93          	add	s7,s7,-8
        B_flat[k*LDB + 3] = pattB(k, j0 + 3);
     594:	017601a3          	sb	s7,3(a2)
      for (int k = 0; k < N; ++k) {
     598:	41670733          	sub	a4,a4,s6
     59c:	80001bb7          	lui	s7,0x80001
     5a0:	015888b3          	add	a7,a7,s5
     5a4:	00950533          	add	a0,a0,s1
     5a8:	416585b3          	sub	a1,a1,s6
     5ac:	fff70713          	add	a4,a4,-1
     5b0:	00460613          	add	a2,a2,4
     5b4:	b74b8b93          	add	s7,s7,-1164 # 80000b74 <A_flat.2>
     5b8:	0ff8f893          	zext.b	a7,a7
     5bc:	0ff57513          	zext.b	a0,a0
     5c0:	0ff5f593          	zext.b	a1,a1
     5c4:	0ff77713          	zext.b	a4,a4
     5c8:	fb7610e3          	bne	a2,s7,568 <main+0x298>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5cc:	ffeb0637          	lui	a2,0xffeb0
     5d0:	00200713          	li	a4,2
     5d4:	00e62023          	sw	a4,0(a2) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  for (int t = 0; t < T; t += 4) {
     5d8:	00000593          	li	a1,0
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
     5dc:	0ff00a93          	li	s5,255
      for (int s = 0; s < 4; ++s) {
     5e0:	00400613          	li	a2,4
    int steps = (t + 4 <= T) ? 4 : (T - t);
     5e4:	10200b93          	li	s7,258
  for (int t = 0; t < T; t += 4) {
     5e8:	10800b13          	li	s6,264
    int8_t b_bytes[TILE][4] = {{0}};
     5ec:	01812483          	lw	s1,24(sp)
    int8_t a_bytes[TILE][4] = {{0}};
     5f0:	02012823          	sw	zero,48(sp)
     5f4:	02012a23          	sw	zero,52(sp)
     5f8:	02012c23          	sw	zero,56(sp)
     5fc:	02012e23          	sw	zero,60(sp)
    int8_t b_bytes[TILE][4] = {{0}};
     600:	04012023          	sw	zero,64(sp)
     604:	04012223          	sw	zero,68(sp)
     608:	04012423          	sw	zero,72(sp)
     60c:	04012623          	sw	zero,76(sp)
    for (int i = 0; i < TILE; ++i)
     610:	03010c93          	add	s9,sp,48
     614:	00000893          	li	a7,0
      for (int s = 0; s < 4; ++s) {
     618:	41158533          	sub	a0,a1,a7
     61c:	00000713          	li	a4,0
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
     620:	00aaea63          	bltu	s5,a0,634 <main+0x364>
     624:	00a48db3          	add	s11,s1,a0
     628:	000dcd83          	lbu	s11,0(s11)
     62c:	00ec8d33          	add	s10,s9,a4
     630:	01bd0023          	sb	s11,0(s10)
      for (int s = 0; s < 4; ++s) {
     634:	00170713          	add	a4,a4,1
     638:	00150513          	add	a0,a0,1
     63c:	fec712e3          	bne	a4,a2,620 <main+0x350>
    for (int i = 0; i < TILE; ++i)
     640:	00188893          	add	a7,a7,1
     644:	10048493          	add	s1,s1,256
     648:	004c8c93          	add	s9,s9,4
     64c:	fcc896e3          	bne	a7,a2,618 <main+0x348>
     650:	04010493          	add	s1,sp,64
    for (int j = 0; j < TILE; ++j)
     654:	00000713          	li	a4,0
        if (k >= 0 && k < K) b_bytes[j][s] = B_flat[k*LDB + j];
     658:	80000cb7          	lui	s9,0x80000
     65c:	774c8c93          	add	s9,s9,1908 # 80000774 <B_flat.1>
     660:	40e588b3          	sub	a7,a1,a4
      for (int s = 0; s < 4; ++s) {
     664:	00000513          	li	a0,0
        if (k >= 0 && k < K) b_bytes[j][s] = B_flat[k*LDB + j];
     668:	00ec8d33          	add	s10,s9,a4
     66c:	011aec63          	bltu	s5,a7,684 <main+0x3b4>
     670:	00289d93          	sll	s11,a7,0x2
     674:	01bd0db3          	add	s11,s10,s11
     678:	000dcd83          	lbu	s11,0(s11)
     67c:	00a48cb3          	add	s9,s1,a0
     680:	01bc8023          	sb	s11,0(s9)
      for (int s = 0; s < 4; ++s) {
     684:	00150513          	add	a0,a0,1
     688:	00188893          	add	a7,a7,1
     68c:	fec510e3          	bne	a0,a2,66c <main+0x39c>
    for (int j = 0; j < TILE; ++j)
     690:	00170713          	add	a4,a4,1
     694:	00448493          	add	s1,s1,4
     698:	fcc710e3          	bne	a4,a2,658 <main+0x388>
         (((uint32_t)(uint8_t)x2) << 16) |
     69c:	03012503          	lw	a0,48(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6a0:	00a92023          	sw	a0,0(s2)
         (((uint32_t)(uint8_t)x2) << 16) |
     6a4:	03412503          	lw	a0,52(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6a8:	00a32023          	sw	a0,0(t1)
         (((uint32_t)(uint8_t)x2) << 16) |
     6ac:	03812503          	lw	a0,56(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6b0:	00ae2023          	sw	a0,0(t3)
         (((uint32_t)(uint8_t)x2) << 16) |
     6b4:	03c12503          	lw	a0,60(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6b8:	00aea023          	sw	a0,0(t4)
         (((uint32_t)(uint8_t)x2) << 16) |
     6bc:	04012503          	lw	a0,64(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6c0:	00af2023          	sw	a0,0(t5)
         (((uint32_t)(uint8_t)x2) << 16) |
     6c4:	04412503          	lw	a0,68(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6c8:	00afa023          	sw	a0,0(t6)
         (((uint32_t)(uint8_t)x2) << 16) |
     6cc:	04812503          	lw	a0,72(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6d0:	00a2a023          	sw	a0,0(t0)
         (((uint32_t)(uint8_t)x2) << 16) |
     6d4:	04c12503          	lw	a0,76(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6d8:	00a3a023          	sw	a0,0(t2)
    int steps = (t + 4 <= T) ? 4 : (T - t);
     6dc:	00bbd463          	bge	s7,a1,6e4 <main+0x414>
     6e0:	00200713          	li	a4,2
    for (int s = 0; s < steps; ++s) cfs_step();
     6e4:	00000513          	li	a0,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6e8:	ffeb08b7          	lui	a7,0xffeb0
     6ec:	00100493          	li	s1,1
     6f0:	0098a023          	sw	s1,0(a7) # ffeb0000 <__crt0_ram_last+0x7fe30001>
    for (int s = 0; s < steps; ++s) cfs_step();
     6f4:	00150513          	add	a0,a0,1
     6f8:	fea718e3          	bne	a4,a0,6e8 <main+0x418>
  for (int t = 0; t < T; t += 4) {
     6fc:	00458593          	add	a1,a1,4
     700:	ef6596e3          	bne	a1,s6,5ec <main+0x31c>
     704:	80000637          	lui	a2,0x80000
     708:	73460713          	add	a4,a2,1844 # 80000734 <C4.0>
     70c:	73460893          	add	a7,a2,1844
     710:	00000593          	li	a1,0
    for (int j = 0; j < TILE; ++j)
     714:	01000493          	li	s1,16
     718:	00259513          	sll	a0,a1,0x2
      C4[i][j] = (int32_t)cfs_read(CFS_C0 + i*TILE + j);
     71c:	00000613          	li	a2,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     720:	00150533          	add	a0,a0,ra
     724:	00c50ab3          	add	s5,a0,a2
     728:	000aab03          	lw	s6,0(s5)
      C4[i][j] = (int32_t)cfs_read(CFS_C0 + i*TILE + j);
     72c:	00c88ab3          	add	s5,a7,a2
    for (int j = 0; j < TILE; ++j)
     730:	00460613          	add	a2,a2,4
      C4[i][j] = (int32_t)cfs_read(CFS_C0 + i*TILE + j);
     734:	016aa023          	sw	s6,0(s5)
    for (int j = 0; j < TILE; ++j)
     738:	fe9616e3          	bne	a2,s1,724 <main+0x454>
  for (int i = 0; i < TILE; ++i)
     73c:	00458593          	add	a1,a1,4
     740:	01088893          	add	a7,a7,16
     744:	fcc59ae3          	bne	a1,a2,718 <main+0x448>
     748:	04070613          	add	a2,a4,64
          checksum += (int64_t)C4[r][c];
     74c:	00072583          	lw	a1,0(a4)
      for (int r = 0; r < TILE; ++r)
     750:	01070713          	add	a4,a4,16
          checksum += (int64_t)C4[r][c];
     754:	01458ab3          	add	s5,a1,s4
     758:	41f5d513          	sra	a0,a1,0x1f
     75c:	01350533          	add	a0,a0,s3
     760:	00bab5b3          	sltu	a1,s5,a1
     764:	00a588b3          	add	a7,a1,a0
     768:	ff472583          	lw	a1,-12(a4)
     76c:	41f5d493          	sra	s1,a1,0x1f
     770:	01558ab3          	add	s5,a1,s5
     774:	00bab5b3          	sltu	a1,s5,a1
     778:	011484b3          	add	s1,s1,a7
     77c:	00958533          	add	a0,a1,s1
     780:	ff872583          	lw	a1,-8(a4)
     784:	ffc72483          	lw	s1,-4(a4)
     788:	41f5d893          	sra	a7,a1,0x1f
     78c:	01558ab3          	add	s5,a1,s5
     790:	00bab5b3          	sltu	a1,s5,a1
     794:	00a888b3          	add	a7,a7,a0
     798:	01548ab3          	add	s5,s1,s5
     79c:	41f4d513          	sra	a0,s1,0x1f
     7a0:	011585b3          	add	a1,a1,a7
     7a4:	009ab4b3          	sltu	s1,s5,s1
     7a8:	00b50533          	add	a0,a0,a1
     7ac:	00a484b3          	add	s1,s1,a0
     7b0:	000a8a13          	mv	s4,s5
     7b4:	00048993          	mv	s3,s1
      for (int r = 0; r < TILE; ++r)
     7b8:	f8c71ae3          	bne	a4,a2,74c <main+0x47c>
    for (int j0 = 0; j0 < N; j0 += TILE) {
     7bc:	01478793          	add	a5,a5,20
     7c0:	00480813          	add	a6,a6,4
     7c4:	10000713          	li	a4,256
     7c8:	0ff7f793          	zext.b	a5,a5
     7cc:	d6e810e3          	bne	a6,a4,52c <main+0x25c>
  for (int i0 = 0; i0 < N; i0 += TILE) {
     7d0:	00468693          	add	a3,a3,4
     7d4:	cd069ae3          	bne	a3,a6,4a8 <main+0x1d8>
  uint64_t i1 = rdinstret(), c1 = rdcycle();
     7d8:	a21ff0ef          	jal	1f8 <rdinstret>
     7dc:	00050d13          	mv	s10,a0
     7e0:	00058b13          	mv	s6,a1
     7e4:	a01ff0ef          	jal	1e4 <rdcycle>
  *out_cycles  = c1 - c0;
     7e8:	02012783          	lw	a5,32(sp)
     7ec:	40f50c33          	sub	s8,a0,a5
     7f0:	02412783          	lw	a5,36(sp)
     7f4:	01853533          	sltu	a0,a0,s8
     7f8:	40f58bb3          	sub	s7,a1,a5
  *out_instret = i1 - i0;
     7fc:	02812783          	lw	a5,40(sp)
  *out_cycles  = c1 - c0;
     800:	40ab8bb3          	sub	s7,s7,a0

  /* Compare checksums if both were computed */
  int ok = (!DO_SW) ? 1 : (sw_sum == cfs_sum);

  /* Totals and speedups */
  printf("GEMM 256x256 comparison (int8 -> int32)\n");
     804:	0000f537          	lui	a0,0xf
  *out_instret = i1 - i0;
     808:	40fd0cb3          	sub	s9,s10,a5
     80c:	02c12783          	lw	a5,44(sp)
  printf("GEMM 256x256 comparison (int8 -> int32)\n");
     810:	d8c50513          	add	a0,a0,-628 # ed8c <__fini_array_end+0x74>
  *out_instret = i1 - i0;
     814:	019d3d33          	sltu	s10,s10,s9
     818:	40fb0b33          	sub	s6,s6,a5
  printf("GEMM 256x256 comparison (int8 -> int32)\n");
     81c:	634000ef          	jal	e50 <puts>
  printf("Path |        cycles |       instret |  Speedup(cyc) | Speedup(inst) |    checksum\n");
     820:	0000f537          	lui	a0,0xf
     824:	db450513          	add	a0,a0,-588 # edb4 <__fini_array_end+0x9c>
     828:	628000ef          	jal	e50 <puts>
  printf("-----+---------------+---------------+---------------+---------------+-------------\n");
     82c:	0000f537          	lui	a0,0xf
     830:	e0850513          	add	a0,a0,-504 # ee08 <__fini_array_end+0xf0>
     834:	61c000ef          	jal	e50 <puts>
#if DO_SW
  printf(" SW  | %13" PRIu64 " | %13" PRIu64 " |       --      |       --      | %11lld\n",
     838:	00812883          	lw	a7,8(sp)
     83c:	01412703          	lw	a4,20(sp)
     840:	01c12783          	lw	a5,28(sp)
     844:	00c12603          	lw	a2,12(sp)
     848:	01012683          	lw	a3,16(sp)
     84c:	0000f537          	lui	a0,0xf
     850:	00040813          	mv	a6,s0
     854:	e5c50513          	add	a0,a0,-420 # ee5c <__fini_array_end+0x144>
     858:	47c000ef          	jal	cd4 <printf>
  *out_instret = i1 - i0;
     85c:	41ab0b33          	sub	s6,s6,s10
         sw_cyc, sw_ins, (long long)sw_sum);
#endif
  printf(" CFS | %13" PRIu64 " | %13" PRIu64 " |    ", cfs_cyc, cfs_ins);
     860:	0000f537          	lui	a0,0xf
     864:	000c8713          	mv	a4,s9
     868:	000b0793          	mv	a5,s6
     86c:	000c0613          	mv	a2,s8
     870:	000b8693          	mv	a3,s7
     874:	ea050513          	add	a0,a0,-352 # eea0 <__fini_array_end+0x188>
     878:	45c000ef          	jal	cd4 <printf>
#if DO_SW
  print_speedup_fixed(sw_cyc, cfs_cyc);  printf("     |    ");
     87c:	01012583          	lw	a1,16(sp)
     880:	00c12503          	lw	a0,12(sp)
     884:	000c0613          	mv	a2,s8
     888:	000b8693          	mv	a3,s7
     88c:	981ff0ef          	jal	20c <print_speedup_fixed>
     890:	0000f537          	lui	a0,0xf
     894:	ec050513          	add	a0,a0,-320 # eec0 <__fini_array_end+0x1a8>
     898:	43c000ef          	jal	cd4 <printf>
  print_speedup_fixed(sw_ins, cfs_ins);  printf("     | %11lld\n", (long long)cfs_sum);
     89c:	01c12583          	lw	a1,28(sp)
     8a0:	01412503          	lw	a0,20(sp)
     8a4:	000c8613          	mv	a2,s9
     8a8:	000b0693          	mv	a3,s6
     8ac:	961ff0ef          	jal	20c <print_speedup_fixed>
     8b0:	0000f537          	lui	a0,0xf
     8b4:	000a8613          	mv	a2,s5
     8b8:	00048693          	mv	a3,s1
     8bc:	ecc50513          	add	a0,a0,-308 # eecc <__fini_array_end+0x1b4>
     8c0:	414000ef          	jal	cd4 <printf>

  /* Optional efficiency: cycles per MAC for each path (MACs = N^3) */
  uint64_t macs = (uint64_t)N*(uint64_t)N*(uint64_t)N; /* 16,777,216 */
  if (macs) {
#if DO_SW
    uint64_t sw_cpM = (sw_cyc * 1000ull + macs/2) / macs;
     8c4:	00c12503          	lw	a0,12(sp)
     8c8:	01012583          	lw	a1,16(sp)
     8cc:	3e800613          	li	a2,1000
     8d0:	00000693          	li	a3,0
     8d4:	2700e0ef          	jal	eb44 <__muldi3>
     8d8:	00800b37          	lui	s6,0x800
     8dc:	01650cb3          	add	s9,a0,s6
     8e0:	00acb933          	sltu	s2,s9,a0
     8e4:	00b90933          	add	s2,s2,a1
     8e8:	00891793          	sll	a5,s2,0x8
     8ec:	018cdc93          	srl	s9,s9,0x18
     8f0:	0197ecb3          	or	s9,a5,s9
     8f4:	01895913          	srl	s2,s2,0x18
    printf("\nCycles/MAC (x1000): SW=%" PRIu64 ".%03" PRIu64, sw_cpM/1000, sw_cpM%1000);
     8f8:	3e800613          	li	a2,1000
     8fc:	00000693          	li	a3,0
     900:	00090593          	mv	a1,s2
     904:	000c8513          	mv	a0,s9
     908:	0f00b0ef          	jal	b9f8 <__umoddi3>
     90c:	00a12823          	sw	a0,16(sp)
     910:	00b12623          	sw	a1,12(sp)
     914:	3e800613          	li	a2,1000
     918:	00000693          	li	a3,0
     91c:	00090593          	mv	a1,s2
     920:	000c8513          	mv	a0,s9
     924:	2290a0ef          	jal	b34c <__udivdi3>
     928:	01012703          	lw	a4,16(sp)
     92c:	00c12783          	lw	a5,12(sp)
     930:	00050613          	mv	a2,a0
     934:	0000f537          	lui	a0,0xf
     938:	00058693          	mv	a3,a1
     93c:	edc50513          	add	a0,a0,-292 # eedc <__fini_array_end+0x1c4>
     940:	394000ef          	jal	cd4 <printf>
#else
    printf("\nCycles/MAC (x1000): SW=n/a");
#endif
    uint64_t cf_cpM = (cfs_cyc * 1000ull + macs/2) / macs;
     944:	3e800613          	li	a2,1000
     948:	00000693          	li	a3,0
     94c:	000c0513          	mv	a0,s8
     950:	000b8593          	mv	a1,s7
     954:	1f00e0ef          	jal	eb44 <__muldi3>
     958:	01650b33          	add	s6,a0,s6
     95c:	00ab3933          	sltu	s2,s6,a0
     960:	00b90933          	add	s2,s2,a1
     964:	00891793          	sll	a5,s2,0x8
     968:	018b5b13          	srl	s6,s6,0x18
     96c:	0167eb33          	or	s6,a5,s6
     970:	01895913          	srl	s2,s2,0x18
    printf("  CFS=%" PRIu64 ".%03" PRIu64 "\n", cf_cpM/1000, cf_cpM%1000);
     974:	3e800613          	li	a2,1000
     978:	00000693          	li	a3,0
     97c:	000b0513          	mv	a0,s6
     980:	00090593          	mv	a1,s2
     984:	0740b0ef          	jal	b9f8 <__umoddi3>
     988:	00a12823          	sw	a0,16(sp)
     98c:	00b12623          	sw	a1,12(sp)
     990:	3e800613          	li	a2,1000
     994:	00000693          	li	a3,0
     998:	000b0513          	mv	a0,s6
     99c:	00090593          	mv	a1,s2
     9a0:	1ad0a0ef          	jal	b34c <__udivdi3>
     9a4:	01012703          	lw	a4,16(sp)
     9a8:	00c12783          	lw	a5,12(sp)
     9ac:	00050613          	mv	a2,a0
     9b0:	0000f537          	lui	a0,0xf
     9b4:	00058693          	mv	a3,a1
     9b8:	f0050513          	add	a0,a0,-256 # ef00 <__fini_array_end+0x1e8>
     9bc:	318000ef          	jal	cd4 <printf>
  }

  printf("\nVerdict: %s\n", ok ? "PASS (checksums match)" : "FAIL (checksums differ)");
     9c0:	07541e63          	bne	s0,s5,a3c <main+0x76c>
     9c4:	00812783          	lw	a5,8(sp)
     9c8:	06979a63          	bne	a5,s1,a3c <main+0x76c>
     9cc:	0000f5b7          	lui	a1,0xf
     9d0:	d3458593          	add	a1,a1,-716 # ed34 <__fini_array_end+0x1c>
     9d4:	0000f537          	lui	a0,0xf
     9d8:	f1450513          	add	a0,a0,-236 # ef14 <__fini_array_end+0x1fc>
     9dc:	2f8000ef          	jal	cd4 <printf>
  printf("Tip: If SW is too slow, temporarily set N=128 or DO_SW=0 to profile the CFS path only.\n");
     9e0:	0000f537          	lui	a0,0xf
     9e4:	f2450513          	add	a0,a0,-220 # ef24 <__fini_array_end+0x20c>
     9e8:	468000ef          	jal	e50 <puts>
  return ok ? 0 : 1;
     9ec:	00812783          	lw	a5,8(sp)
     9f0:	01544533          	xor	a0,s0,s5
}
     9f4:	08c12083          	lw	ra,140(sp)
     9f8:	08812403          	lw	s0,136(sp)
  return ok ? 0 : 1;
     9fc:	0097c7b3          	xor	a5,a5,s1
     a00:	00f56533          	or	a0,a0,a5
}
     a04:	08412483          	lw	s1,132(sp)
     a08:	08012903          	lw	s2,128(sp)
     a0c:	07c12983          	lw	s3,124(sp)
     a10:	07812a03          	lw	s4,120(sp)
     a14:	07412a83          	lw	s5,116(sp)
     a18:	07012b03          	lw	s6,112(sp)
     a1c:	06c12b83          	lw	s7,108(sp)
     a20:	06812c03          	lw	s8,104(sp)
     a24:	06412c83          	lw	s9,100(sp)
     a28:	06012d03          	lw	s10,96(sp)
     a2c:	05c12d83          	lw	s11,92(sp)
     a30:	00a03533          	snez	a0,a0
     a34:	09010113          	add	sp,sp,144
     a38:	00008067          	ret
  printf("\nVerdict: %s\n", ok ? "PASS (checksums match)" : "FAIL (checksums differ)");
     a3c:	0000f5b7          	lui	a1,0xf
     a40:	d4c58593          	add	a1,a1,-692 # ed4c <__fini_array_end+0x34>
     a44:	f91ff06f          	j	9d4 <main+0x704>

00000a48 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     a48:	fffff097          	auipc	ra,0xfffff
     a4c:	71008093          	add	ra,ra,1808 # 158 <__crt0_main_exit>
     a50:	00050513          	mv	a0,a0
     a54:	00008067          	ret

00000a58 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     a58:	fff00513          	li	a0,-1
     a5c:	00008067          	ret

00000a60 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     a60:	000027b7          	lui	a5,0x2
     a64:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     a68:	00000513          	li	a0,0
     a6c:	00008067          	ret

00000a70 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     a70:	00100513          	li	a0,1
     a74:	00008067          	ret

00000a78 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     a78:	00100513          	li	a0,1
     a7c:	00008067          	ret

00000a80 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     a80:	800007b7          	lui	a5,0x80000
     a84:	01600713          	li	a4,22
     a88:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     a8c:	fff00513          	li	a0,-1
     a90:	00008067          	ret

00000a94 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     a94:	00000513          	li	a0,0
     a98:	00008067          	ret

00000a9c <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     a9c:	fe010113          	add	sp,sp,-32
     aa0:	00912a23          	sw	s1,20(sp)
     aa4:	01212823          	sw	s2,16(sp)
     aa8:	00112e23          	sw	ra,28(sp)
     aac:	00812c23          	sw	s0,24(sp)
     ab0:	01312623          	sw	s3,12(sp)
     ab4:	01412423          	sw	s4,8(sp)
     ab8:	00058913          	mv	s2,a1
     abc:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     ac0:	06051463          	bnez	a0,b28 <_read+0x8c>
     ac4:	00050413          	mv	s0,a0
     ac8:	fff50537          	lui	a0,0xfff50
     acc:	1a0000ef          	jal	c6c <neorv32_uart_available>
     ad0:	04050c63          	beqz	a0,b28 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     ad4:	00a00993          	li	s3,10
     ad8:	00d00a13          	li	s4,13
    while (len--) {
     adc:	00941663          	bne	s0,s1,ae8 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     ae0:	00048413          	mv	s0,s1
     ae4:	0200006f          	j	b04 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     ae8:	fff50537          	lui	a0,0xfff50
     aec:	1d0000ef          	jal	cbc <neorv32_uart_getc>
      *ptr++ = c;
     af0:	008907b3          	add	a5,s2,s0
     af4:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     af8:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     afc:	01350463          	beq	a0,s3,b04 <_read+0x68>
     b00:	fd451ee3          	bne	a0,s4,adc <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     b04:	01c12083          	lw	ra,28(sp)
     b08:	00040513          	mv	a0,s0
     b0c:	01812403          	lw	s0,24(sp)
     b10:	01412483          	lw	s1,20(sp)
     b14:	01012903          	lw	s2,16(sp)
     b18:	00c12983          	lw	s3,12(sp)
     b1c:	00812a03          	lw	s4,8(sp)
     b20:	02010113          	add	sp,sp,32
     b24:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     b28:	fff60537          	lui	a0,0xfff60
     b2c:	140000ef          	jal	c6c <neorv32_uart_available>
  int read_cnt = 0;
     b30:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     b34:	02050863          	beqz	a0,b64 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     b38:	00a00993          	li	s3,10
     b3c:	00d00a13          	li	s4,13
    while (len--) {
     b40:	fa9400e3          	beq	s0,s1,ae0 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     b44:	fff60537          	lui	a0,0xfff60
     b48:	174000ef          	jal	cbc <neorv32_uart_getc>
      *ptr++ = c;
     b4c:	008907b3          	add	a5,s2,s0
     b50:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     b54:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     b58:	fb3506e3          	beq	a0,s3,b04 <_read+0x68>
     b5c:	ff4512e3          	bne	a0,s4,b40 <_read+0xa4>
     b60:	fa5ff06f          	j	b04 <_read+0x68>
    errno = ENOSYS;
     b64:	800007b7          	lui	a5,0x80000
     b68:	05800713          	li	a4,88
     b6c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     b70:	fff00413          	li	s0,-1
     b74:	f91ff06f          	j	b04 <_read+0x68>

00000b78 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     b78:	ff010113          	add	sp,sp,-16
     b7c:	00812423          	sw	s0,8(sp)
     b80:	00912223          	sw	s1,4(sp)
     b84:	00112623          	sw	ra,12(sp)
     b88:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     b8c:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     b90:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     b94:	00058413          	mv	s0,a1
     b98:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     b9c:	04a7ec63          	bltu	a5,a0,bf4 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     ba0:	fff50537          	lui	a0,0xfff50
     ba4:	0c8000ef          	jal	c6c <neorv32_uart_available>
     ba8:	00940933          	add	s2,s0,s1
     bac:	02051463          	bnez	a0,bd4 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     bb0:	800007b7          	lui	a5,0x80000
     bb4:	05800713          	li	a4,88
     bb8:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     bbc:	fff00493          	li	s1,-1
     bc0:	0180006f          	j	bd8 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     bc4:	00044583          	lbu	a1,0(s0)
     bc8:	fff50537          	lui	a0,0xfff50
     bcc:	00140413          	add	s0,s0,1
     bd0:	0d8000ef          	jal	ca8 <neorv32_uart_putc>
      while (len--) {
     bd4:	fe8918e3          	bne	s2,s0,bc4 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     bd8:	00c12083          	lw	ra,12(sp)
     bdc:	00812403          	lw	s0,8(sp)
     be0:	00012903          	lw	s2,0(sp)
     be4:	00048513          	mv	a0,s1
     be8:	00412483          	lw	s1,4(sp)
     bec:	01010113          	add	sp,sp,16
     bf0:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     bf4:	fff60537          	lui	a0,0xfff60
     bf8:	074000ef          	jal	c6c <neorv32_uart_available>
     bfc:	00940933          	add	s2,s0,s1
     c00:	fa0508e3          	beqz	a0,bb0 <_write+0x38>
    while (len--) {
     c04:	fd240ae3          	beq	s0,s2,bd8 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     c08:	00044583          	lbu	a1,0(s0)
     c0c:	fff60537          	lui	a0,0xfff60
     c10:	00140413          	add	s0,s0,1
     c14:	094000ef          	jal	ca8 <neorv32_uart_putc>
      write_cnt++;
     c18:	fedff06f          	j	c04 <_write+0x8c>

00000c1c <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     c1c:	80000737          	lui	a4,0x80000
     c20:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     c24:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     c28:	00050793          	mv	a5,a0
     c2c:	0d460613          	add	a2,a2,212 # 800010d4 <__crt0_bss_end>
  if (curr_heap == NULL) {
     c30:	00069463          	bnez	a3,c38 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     c34:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     c38:	800016b7          	lui	a3,0x80001
     c3c:	0d468693          	add	a3,a3,212 # 800010d4 <__crt0_bss_end>
     c40:	00c69c63          	bne	a3,a2,c58 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     c44:	800007b7          	lui	a5,0x80000
     c48:	00c00713          	li	a4,12
     c4c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     c50:	fff00513          	li	a0,-1
     c54:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     c58:	71472503          	lw	a0,1812(a4)
     c5c:	00f507b3          	add	a5,a0,a5
     c60:	fed7f2e3          	bgeu	a5,a3,c44 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     c64:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     c68:	00008067          	ret

00000c6c <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     c6c:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     c70:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     c74:	00e51c63          	bne	a0,a4,c8c <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     c78:	fffe07b7          	lui	a5,0xfffe0
     c7c:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     c80:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     c84:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     c88:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     c8c:	fff60737          	lui	a4,0xfff60
    return 0;
     c90:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     c94:	fee79ae3          	bne	a5,a4,c88 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     c98:	fffe07b7          	lui	a5,0xfffe0
     c9c:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     ca0:	020007b7          	lui	a5,0x2000
     ca4:	fe1ff06f          	j	c84 <neorv32_uart_available+0x18>

00000ca8 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     ca8:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     cac:	00a79713          	sll	a4,a5,0xa
     cb0:	fe075ce3          	bgez	a4,ca8 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     cb4:	00b52223          	sw	a1,4(a0)
}
     cb8:	00008067          	ret

00000cbc <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     cbc:	00052783          	lw	a5,0(a0)
     cc0:	00f79713          	sll	a4,a5,0xf
     cc4:	fe075ce3          	bgez	a4,cbc <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     cc8:	00452503          	lw	a0,4(a0)
}
     ccc:	0ff57513          	zext.b	a0,a0
     cd0:	00008067          	ret

00000cd4 <printf>:
     cd4:	fc010113          	add	sp,sp,-64
     cd8:	02c12423          	sw	a2,40(sp)
     cdc:	02d12623          	sw	a3,44(sp)
     ce0:	80000317          	auipc	t1,0x80000
     ce4:	a2832303          	lw	t1,-1496(t1) # 80000708 <_impure_ptr>
     ce8:	02b12223          	sw	a1,36(sp)
     cec:	02e12823          	sw	a4,48(sp)
     cf0:	02f12a23          	sw	a5,52(sp)
     cf4:	03012c23          	sw	a6,56(sp)
     cf8:	03112e23          	sw	a7,60(sp)
     cfc:	00832583          	lw	a1,8(t1)
     d00:	02410693          	add	a3,sp,36
     d04:	00050613          	mv	a2,a0
     d08:	00030513          	mv	a0,t1
     d0c:	00112e23          	sw	ra,28(sp)
     d10:	00d12623          	sw	a3,12(sp)
     d14:	0b0010ef          	jal	1dc4 <_vfprintf_r>
     d18:	01c12083          	lw	ra,28(sp)
     d1c:	04010113          	add	sp,sp,64
     d20:	00008067          	ret

00000d24 <_puts_r>:
     d24:	fd010113          	add	sp,sp,-48
     d28:	02812423          	sw	s0,40(sp)
     d2c:	00050413          	mv	s0,a0
     d30:	00058513          	mv	a0,a1
     d34:	02912223          	sw	s1,36(sp)
     d38:	02112623          	sw	ra,44(sp)
     d3c:	00058493          	mv	s1,a1
     d40:	3b0000ef          	jal	10f0 <strlen>
     d44:	00150713          	add	a4,a0,1
     d48:	0000e697          	auipc	a3,0xe
     d4c:	1d868693          	add	a3,a3,472 # ef20 <__fini_array_end+0x208>
     d50:	00e12623          	sw	a4,12(sp)
     d54:	03442783          	lw	a5,52(s0)
     d58:	01010713          	add	a4,sp,16
     d5c:	00d12c23          	sw	a3,24(sp)
     d60:	00e12223          	sw	a4,4(sp)
     d64:	00100693          	li	a3,1
     d68:	00200713          	li	a4,2
     d6c:	00912823          	sw	s1,16(sp)
     d70:	00a12a23          	sw	a0,20(sp)
     d74:	00d12e23          	sw	a3,28(sp)
     d78:	00e12423          	sw	a4,8(sp)
     d7c:	00842483          	lw	s1,8(s0)
     d80:	0c078263          	beqz	a5,e44 <_puts_r+0x120>
     d84:	0644a703          	lw	a4,100(s1)
     d88:	00c49783          	lh	a5,12(s1)
     d8c:	00177713          	and	a4,a4,1
     d90:	00071663          	bnez	a4,d9c <_puts_r+0x78>
     d94:	2007f713          	and	a4,a5,512
     d98:	08070e63          	beqz	a4,e34 <_puts_r+0x110>
     d9c:	01279713          	sll	a4,a5,0x12
     da0:	02074263          	bltz	a4,dc4 <_puts_r+0xa0>
     da4:	0644a703          	lw	a4,100(s1)
     da8:	ffffe6b7          	lui	a3,0xffffe
     dac:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     db0:	00002637          	lui	a2,0x2
     db4:	00c7e7b3          	or	a5,a5,a2
     db8:	00d77733          	and	a4,a4,a3
     dbc:	00f49623          	sh	a5,12(s1)
     dc0:	06e4a223          	sw	a4,100(s1)
     dc4:	00040513          	mv	a0,s0
     dc8:	00410613          	add	a2,sp,4
     dcc:	00048593          	mv	a1,s1
     dd0:	549050ef          	jal	6b18 <__sfvwrite_r>
     dd4:	0644a783          	lw	a5,100(s1)
     dd8:	00153413          	seqz	s0,a0
     ddc:	40800433          	neg	s0,s0
     de0:	00b47413          	and	s0,s0,11
     de4:	0017f793          	and	a5,a5,1
     de8:	fff40413          	add	s0,s0,-1
     dec:	00079863          	bnez	a5,dfc <_puts_r+0xd8>
     df0:	00c4d783          	lhu	a5,12(s1)
     df4:	2007f793          	and	a5,a5,512
     df8:	00078e63          	beqz	a5,e14 <_puts_r+0xf0>
     dfc:	02c12083          	lw	ra,44(sp)
     e00:	00040513          	mv	a0,s0
     e04:	02812403          	lw	s0,40(sp)
     e08:	02412483          	lw	s1,36(sp)
     e0c:	03010113          	add	sp,sp,48
     e10:	00008067          	ret
     e14:	0584a503          	lw	a0,88(s1)
     e18:	054000ef          	jal	e6c <__retarget_lock_release_recursive>
     e1c:	02c12083          	lw	ra,44(sp)
     e20:	00040513          	mv	a0,s0
     e24:	02812403          	lw	s0,40(sp)
     e28:	02412483          	lw	s1,36(sp)
     e2c:	03010113          	add	sp,sp,48
     e30:	00008067          	ret
     e34:	0584a503          	lw	a0,88(s1)
     e38:	030000ef          	jal	e68 <__retarget_lock_acquire_recursive>
     e3c:	00c49783          	lh	a5,12(s1)
     e40:	f5dff06f          	j	d9c <_puts_r+0x78>
     e44:	00040513          	mv	a0,s0
     e48:	449050ef          	jal	6a90 <__sinit>
     e4c:	f39ff06f          	j	d84 <_puts_r+0x60>

00000e50 <puts>:
     e50:	00050593          	mv	a1,a0
     e54:	80000517          	auipc	a0,0x80000
     e58:	8b452503          	lw	a0,-1868(a0) # 80000708 <_impure_ptr>
     e5c:	ec9ff06f          	j	d24 <_puts_r>

00000e60 <__retarget_lock_init_recursive>:
     e60:	00008067          	ret

00000e64 <__retarget_lock_close_recursive>:
     e64:	00008067          	ret

00000e68 <__retarget_lock_acquire_recursive>:
     e68:	00008067          	ret

00000e6c <__retarget_lock_release_recursive>:
     e6c:	00008067          	ret

00000e70 <memset>:
     e70:	00f00313          	li	t1,15
     e74:	00050713          	mv	a4,a0
     e78:	02c37e63          	bgeu	t1,a2,eb4 <memset+0x44>
     e7c:	00f77793          	and	a5,a4,15
     e80:	0a079063          	bnez	a5,f20 <memset+0xb0>
     e84:	08059263          	bnez	a1,f08 <memset+0x98>
     e88:	ff067693          	and	a3,a2,-16
     e8c:	00f67613          	and	a2,a2,15
     e90:	00e686b3          	add	a3,a3,a4
     e94:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     e98:	00b72223          	sw	a1,4(a4)
     e9c:	00b72423          	sw	a1,8(a4)
     ea0:	00b72623          	sw	a1,12(a4)
     ea4:	01070713          	add	a4,a4,16
     ea8:	fed766e3          	bltu	a4,a3,e94 <memset+0x24>
     eac:	00061463          	bnez	a2,eb4 <memset+0x44>
     eb0:	00008067          	ret
     eb4:	40c306b3          	sub	a3,t1,a2
     eb8:	00269693          	sll	a3,a3,0x2
     ebc:	00000297          	auipc	t0,0x0
     ec0:	005686b3          	add	a3,a3,t0
     ec4:	00c68067          	jr	12(a3)
     ec8:	00b70723          	sb	a1,14(a4)
     ecc:	00b706a3          	sb	a1,13(a4)
     ed0:	00b70623          	sb	a1,12(a4)
     ed4:	00b705a3          	sb	a1,11(a4)
     ed8:	00b70523          	sb	a1,10(a4)
     edc:	00b704a3          	sb	a1,9(a4)
     ee0:	00b70423          	sb	a1,8(a4)
     ee4:	00b703a3          	sb	a1,7(a4)
     ee8:	00b70323          	sb	a1,6(a4)
     eec:	00b702a3          	sb	a1,5(a4)
     ef0:	00b70223          	sb	a1,4(a4)
     ef4:	00b701a3          	sb	a1,3(a4)
     ef8:	00b70123          	sb	a1,2(a4)
     efc:	00b700a3          	sb	a1,1(a4)
     f00:	00b70023          	sb	a1,0(a4)
     f04:	00008067          	ret
     f08:	0ff5f593          	zext.b	a1,a1
     f0c:	00859693          	sll	a3,a1,0x8
     f10:	00d5e5b3          	or	a1,a1,a3
     f14:	01059693          	sll	a3,a1,0x10
     f18:	00d5e5b3          	or	a1,a1,a3
     f1c:	f6dff06f          	j	e88 <memset+0x18>
     f20:	00279693          	sll	a3,a5,0x2
     f24:	00000297          	auipc	t0,0x0
     f28:	005686b3          	add	a3,a3,t0
     f2c:	00008293          	mv	t0,ra
     f30:	fa0680e7          	jalr	-96(a3)
     f34:	00028093          	mv	ra,t0
     f38:	ff078793          	add	a5,a5,-16 # 1fffff0 <__neorv32_ram_size+0x1f7fff0>
     f3c:	40f70733          	sub	a4,a4,a5
     f40:	00f60633          	add	a2,a2,a5
     f44:	f6c378e3          	bgeu	t1,a2,eb4 <memset+0x44>
     f48:	f3dff06f          	j	e84 <memset+0x14>

00000f4c <memcpy>:
     f4c:	00a5c7b3          	xor	a5,a1,a0
     f50:	0037f793          	and	a5,a5,3
     f54:	00c508b3          	add	a7,a0,a2
     f58:	06079463          	bnez	a5,fc0 <memcpy+0x74>
     f5c:	00300793          	li	a5,3
     f60:	06c7f063          	bgeu	a5,a2,fc0 <memcpy+0x74>
     f64:	00357793          	and	a5,a0,3
     f68:	00050713          	mv	a4,a0
     f6c:	06079a63          	bnez	a5,fe0 <memcpy+0x94>
     f70:	ffc8f613          	and	a2,a7,-4
     f74:	40e606b3          	sub	a3,a2,a4
     f78:	02000793          	li	a5,32
     f7c:	08d7ce63          	blt	a5,a3,1018 <memcpy+0xcc>
     f80:	00058693          	mv	a3,a1
     f84:	00070793          	mv	a5,a4
     f88:	02c77863          	bgeu	a4,a2,fb8 <memcpy+0x6c>
     f8c:	0006a803          	lw	a6,0(a3)
     f90:	00478793          	add	a5,a5,4
     f94:	00468693          	add	a3,a3,4
     f98:	ff07ae23          	sw	a6,-4(a5)
     f9c:	fec7e8e3          	bltu	a5,a2,f8c <memcpy+0x40>
     fa0:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x23b>
     fa4:	40e787b3          	sub	a5,a5,a4
     fa8:	ffc7f793          	and	a5,a5,-4
     fac:	00478793          	add	a5,a5,4
     fb0:	00f70733          	add	a4,a4,a5
     fb4:	00f585b3          	add	a1,a1,a5
     fb8:	01176863          	bltu	a4,a7,fc8 <memcpy+0x7c>
     fbc:	00008067          	ret
     fc0:	00050713          	mv	a4,a0
     fc4:	05157863          	bgeu	a0,a7,1014 <memcpy+0xc8>
     fc8:	0005c783          	lbu	a5,0(a1)
     fcc:	00170713          	add	a4,a4,1
     fd0:	00158593          	add	a1,a1,1
     fd4:	fef70fa3          	sb	a5,-1(a4)
     fd8:	fee898e3          	bne	a7,a4,fc8 <memcpy+0x7c>
     fdc:	00008067          	ret
     fe0:	0005c683          	lbu	a3,0(a1)
     fe4:	00170713          	add	a4,a4,1
     fe8:	00377793          	and	a5,a4,3
     fec:	fed70fa3          	sb	a3,-1(a4)
     ff0:	00158593          	add	a1,a1,1
     ff4:	f6078ee3          	beqz	a5,f70 <memcpy+0x24>
     ff8:	0005c683          	lbu	a3,0(a1)
     ffc:	00170713          	add	a4,a4,1
    1000:	00377793          	and	a5,a4,3
    1004:	fed70fa3          	sb	a3,-1(a4)
    1008:	00158593          	add	a1,a1,1
    100c:	fc079ae3          	bnez	a5,fe0 <memcpy+0x94>
    1010:	f61ff06f          	j	f70 <memcpy+0x24>
    1014:	00008067          	ret
    1018:	ff010113          	add	sp,sp,-16
    101c:	00812623          	sw	s0,12(sp)
    1020:	02000413          	li	s0,32
    1024:	0005a383          	lw	t2,0(a1)
    1028:	0045a283          	lw	t0,4(a1)
    102c:	0085af83          	lw	t6,8(a1)
    1030:	00c5af03          	lw	t5,12(a1)
    1034:	0105ae83          	lw	t4,16(a1)
    1038:	0145ae03          	lw	t3,20(a1)
    103c:	0185a303          	lw	t1,24(a1)
    1040:	01c5a803          	lw	a6,28(a1)
    1044:	0205a683          	lw	a3,32(a1)
    1048:	02470713          	add	a4,a4,36
    104c:	40e607b3          	sub	a5,a2,a4
    1050:	fc772e23          	sw	t2,-36(a4)
    1054:	fe572023          	sw	t0,-32(a4)
    1058:	fff72223          	sw	t6,-28(a4)
    105c:	ffe72423          	sw	t5,-24(a4)
    1060:	ffd72623          	sw	t4,-20(a4)
    1064:	ffc72823          	sw	t3,-16(a4)
    1068:	fe672a23          	sw	t1,-12(a4)
    106c:	ff072c23          	sw	a6,-8(a4)
    1070:	fed72e23          	sw	a3,-4(a4)
    1074:	02458593          	add	a1,a1,36
    1078:	faf446e3          	blt	s0,a5,1024 <memcpy+0xd8>
    107c:	00058693          	mv	a3,a1
    1080:	00070793          	mv	a5,a4
    1084:	02c77863          	bgeu	a4,a2,10b4 <memcpy+0x168>
    1088:	0006a803          	lw	a6,0(a3)
    108c:	00478793          	add	a5,a5,4
    1090:	00468693          	add	a3,a3,4
    1094:	ff07ae23          	sw	a6,-4(a5)
    1098:	fec7e8e3          	bltu	a5,a2,1088 <memcpy+0x13c>
    109c:	fff60793          	add	a5,a2,-1
    10a0:	40e787b3          	sub	a5,a5,a4
    10a4:	ffc7f793          	and	a5,a5,-4
    10a8:	00478793          	add	a5,a5,4
    10ac:	00f70733          	add	a4,a4,a5
    10b0:	00f585b3          	add	a1,a1,a5
    10b4:	01176863          	bltu	a4,a7,10c4 <memcpy+0x178>
    10b8:	00c12403          	lw	s0,12(sp)
    10bc:	01010113          	add	sp,sp,16
    10c0:	00008067          	ret
    10c4:	0005c783          	lbu	a5,0(a1)
    10c8:	00170713          	add	a4,a4,1
    10cc:	00158593          	add	a1,a1,1
    10d0:	fef70fa3          	sb	a5,-1(a4)
    10d4:	fee882e3          	beq	a7,a4,10b8 <memcpy+0x16c>
    10d8:	0005c783          	lbu	a5,0(a1)
    10dc:	00170713          	add	a4,a4,1
    10e0:	00158593          	add	a1,a1,1
    10e4:	fef70fa3          	sb	a5,-1(a4)
    10e8:	fce89ee3          	bne	a7,a4,10c4 <memcpy+0x178>
    10ec:	fcdff06f          	j	10b8 <memcpy+0x16c>

000010f0 <strlen>:
    10f0:	00357793          	and	a5,a0,3
    10f4:	00050713          	mv	a4,a0
    10f8:	04079c63          	bnez	a5,1150 <strlen+0x60>
    10fc:	7f7f86b7          	lui	a3,0x7f7f8
    1100:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    1104:	fff00593          	li	a1,-1
    1108:	00072603          	lw	a2,0(a4)
    110c:	00470713          	add	a4,a4,4
    1110:	00d677b3          	and	a5,a2,a3
    1114:	00d787b3          	add	a5,a5,a3
    1118:	00c7e7b3          	or	a5,a5,a2
    111c:	00d7e7b3          	or	a5,a5,a3
    1120:	feb784e3          	beq	a5,a1,1108 <strlen+0x18>
    1124:	ffc74683          	lbu	a3,-4(a4)
    1128:	40a707b3          	sub	a5,a4,a0
    112c:	04068463          	beqz	a3,1174 <strlen+0x84>
    1130:	ffd74683          	lbu	a3,-3(a4)
    1134:	02068c63          	beqz	a3,116c <strlen+0x7c>
    1138:	ffe74503          	lbu	a0,-2(a4)
    113c:	00a03533          	snez	a0,a0
    1140:	00f50533          	add	a0,a0,a5
    1144:	ffe50513          	add	a0,a0,-2
    1148:	00008067          	ret
    114c:	fa0688e3          	beqz	a3,10fc <strlen+0xc>
    1150:	00074783          	lbu	a5,0(a4)
    1154:	00170713          	add	a4,a4,1
    1158:	00377693          	and	a3,a4,3
    115c:	fe0798e3          	bnez	a5,114c <strlen+0x5c>
    1160:	40a70733          	sub	a4,a4,a0
    1164:	fff70513          	add	a0,a4,-1
    1168:	00008067          	ret
    116c:	ffd78513          	add	a0,a5,-3
    1170:	00008067          	ret
    1174:	ffc78513          	add	a0,a5,-4
    1178:	00008067          	ret

0000117c <_malloc_trim_r>:
    117c:	fe010113          	add	sp,sp,-32
    1180:	00812c23          	sw	s0,24(sp)
    1184:	00912a23          	sw	s1,20(sp)
    1188:	01212823          	sw	s2,16(sp)
    118c:	01312623          	sw	s3,12(sp)
    1190:	01412423          	sw	s4,8(sp)
    1194:	00058993          	mv	s3,a1
    1198:	00112e23          	sw	ra,28(sp)
    119c:	00050913          	mv	s2,a0
    11a0:	7ffffa17          	auipc	s4,0x7ffff
    11a4:	f80a0a13          	add	s4,s4,-128 # 80000120 <__malloc_av_>
    11a8:	405000ef          	jal	1dac <__malloc_lock>
    11ac:	008a2703          	lw	a4,8(s4)
    11b0:	000017b7          	lui	a5,0x1
    11b4:	fef78793          	add	a5,a5,-17 # fef <memcpy+0xa3>
    11b8:	00472483          	lw	s1,4(a4)
    11bc:	00001737          	lui	a4,0x1
    11c0:	ffc4f493          	and	s1,s1,-4
    11c4:	00f48433          	add	s0,s1,a5
    11c8:	41340433          	sub	s0,s0,s3
    11cc:	00c45413          	srl	s0,s0,0xc
    11d0:	fff40413          	add	s0,s0,-1
    11d4:	00c41413          	sll	s0,s0,0xc
    11d8:	00e44e63          	blt	s0,a4,11f4 <_malloc_trim_r+0x78>
    11dc:	00000593          	li	a1,0
    11e0:	00090513          	mv	a0,s2
    11e4:	678060ef          	jal	785c <_sbrk_r>
    11e8:	008a2783          	lw	a5,8(s4)
    11ec:	009787b3          	add	a5,a5,s1
    11f0:	02f50863          	beq	a0,a5,1220 <_malloc_trim_r+0xa4>
    11f4:	00090513          	mv	a0,s2
    11f8:	3c1000ef          	jal	1db8 <__malloc_unlock>
    11fc:	01c12083          	lw	ra,28(sp)
    1200:	01812403          	lw	s0,24(sp)
    1204:	01412483          	lw	s1,20(sp)
    1208:	01012903          	lw	s2,16(sp)
    120c:	00c12983          	lw	s3,12(sp)
    1210:	00812a03          	lw	s4,8(sp)
    1214:	00000513          	li	a0,0
    1218:	02010113          	add	sp,sp,32
    121c:	00008067          	ret
    1220:	408005b3          	neg	a1,s0
    1224:	00090513          	mv	a0,s2
    1228:	634060ef          	jal	785c <_sbrk_r>
    122c:	fff00793          	li	a5,-1
    1230:	04f50a63          	beq	a0,a5,1284 <_malloc_trim_r+0x108>
    1234:	80000717          	auipc	a4,0x80000
    1238:	d4070713          	add	a4,a4,-704 # 80000f74 <__malloc_current_mallinfo>
    123c:	00072783          	lw	a5,0(a4)
    1240:	008a2683          	lw	a3,8(s4)
    1244:	408484b3          	sub	s1,s1,s0
    1248:	0014e493          	or	s1,s1,1
    124c:	408787b3          	sub	a5,a5,s0
    1250:	00090513          	mv	a0,s2
    1254:	0096a223          	sw	s1,4(a3)
    1258:	00f72023          	sw	a5,0(a4)
    125c:	35d000ef          	jal	1db8 <__malloc_unlock>
    1260:	01c12083          	lw	ra,28(sp)
    1264:	01812403          	lw	s0,24(sp)
    1268:	01412483          	lw	s1,20(sp)
    126c:	01012903          	lw	s2,16(sp)
    1270:	00c12983          	lw	s3,12(sp)
    1274:	00812a03          	lw	s4,8(sp)
    1278:	00100513          	li	a0,1
    127c:	02010113          	add	sp,sp,32
    1280:	00008067          	ret
    1284:	00000593          	li	a1,0
    1288:	00090513          	mv	a0,s2
    128c:	5d0060ef          	jal	785c <_sbrk_r>
    1290:	008a2703          	lw	a4,8(s4)
    1294:	00f00693          	li	a3,15
    1298:	40e507b3          	sub	a5,a0,a4
    129c:	f4f6dce3          	bge	a3,a5,11f4 <_malloc_trim_r+0x78>
    12a0:	7ffff697          	auipc	a3,0x7ffff
    12a4:	46c6a683          	lw	a3,1132(a3) # 8000070c <__malloc_sbrk_base>
    12a8:	40d50533          	sub	a0,a0,a3
    12ac:	0017e793          	or	a5,a5,1
    12b0:	80000697          	auipc	a3,0x80000
    12b4:	cca6a223          	sw	a0,-828(a3) # 80000f74 <__malloc_current_mallinfo>
    12b8:	00f72223          	sw	a5,4(a4)
    12bc:	f39ff06f          	j	11f4 <_malloc_trim_r+0x78>

000012c0 <_free_r>:
    12c0:	18058263          	beqz	a1,1444 <_free_r+0x184>
    12c4:	ff010113          	add	sp,sp,-16
    12c8:	00812423          	sw	s0,8(sp)
    12cc:	00912223          	sw	s1,4(sp)
    12d0:	00058413          	mv	s0,a1
    12d4:	00050493          	mv	s1,a0
    12d8:	00112623          	sw	ra,12(sp)
    12dc:	2d1000ef          	jal	1dac <__malloc_lock>
    12e0:	ffc42583          	lw	a1,-4(s0)
    12e4:	ff840713          	add	a4,s0,-8
    12e8:	7ffff517          	auipc	a0,0x7ffff
    12ec:	e3850513          	add	a0,a0,-456 # 80000120 <__malloc_av_>
    12f0:	ffe5f793          	and	a5,a1,-2
    12f4:	00f70633          	add	a2,a4,a5
    12f8:	00462683          	lw	a3,4(a2)
    12fc:	00852803          	lw	a6,8(a0)
    1300:	ffc6f693          	and	a3,a3,-4
    1304:	1ac80263          	beq	a6,a2,14a8 <_free_r+0x1e8>
    1308:	00d62223          	sw	a3,4(a2)
    130c:	0015f593          	and	a1,a1,1
    1310:	00d60833          	add	a6,a2,a3
    1314:	0a059063          	bnez	a1,13b4 <_free_r+0xf4>
    1318:	ff842303          	lw	t1,-8(s0)
    131c:	00482583          	lw	a1,4(a6)
    1320:	7ffff897          	auipc	a7,0x7ffff
    1324:	e0888893          	add	a7,a7,-504 # 80000128 <__malloc_av_+0x8>
    1328:	40670733          	sub	a4,a4,t1
    132c:	00872803          	lw	a6,8(a4)
    1330:	006787b3          	add	a5,a5,t1
    1334:	0015f593          	and	a1,a1,1
    1338:	15180263          	beq	a6,a7,147c <_free_r+0x1bc>
    133c:	00c72303          	lw	t1,12(a4)
    1340:	00682623          	sw	t1,12(a6)
    1344:	01032423          	sw	a6,8(t1)
    1348:	1a058a63          	beqz	a1,14fc <_free_r+0x23c>
    134c:	0017e693          	or	a3,a5,1
    1350:	00d72223          	sw	a3,4(a4)
    1354:	00f62023          	sw	a5,0(a2)
    1358:	1ff00693          	li	a3,511
    135c:	06f6ec63          	bltu	a3,a5,13d4 <_free_r+0x114>
    1360:	ff87f693          	and	a3,a5,-8
    1364:	00868693          	add	a3,a3,8
    1368:	00452583          	lw	a1,4(a0)
    136c:	00d506b3          	add	a3,a0,a3
    1370:	0006a603          	lw	a2,0(a3)
    1374:	0057d813          	srl	a6,a5,0x5
    1378:	00100793          	li	a5,1
    137c:	010797b3          	sll	a5,a5,a6
    1380:	00b7e7b3          	or	a5,a5,a1
    1384:	ff868593          	add	a1,a3,-8
    1388:	00b72623          	sw	a1,12(a4)
    138c:	00c72423          	sw	a2,8(a4)
    1390:	00f52223          	sw	a5,4(a0)
    1394:	00e6a023          	sw	a4,0(a3)
    1398:	00e62623          	sw	a4,12(a2)
    139c:	00812403          	lw	s0,8(sp)
    13a0:	00c12083          	lw	ra,12(sp)
    13a4:	00048513          	mv	a0,s1
    13a8:	00412483          	lw	s1,4(sp)
    13ac:	01010113          	add	sp,sp,16
    13b0:	2090006f          	j	1db8 <__malloc_unlock>
    13b4:	00482583          	lw	a1,4(a6)
    13b8:	0015f593          	and	a1,a1,1
    13bc:	08058663          	beqz	a1,1448 <_free_r+0x188>
    13c0:	0017e693          	or	a3,a5,1
    13c4:	fed42e23          	sw	a3,-4(s0)
    13c8:	00f62023          	sw	a5,0(a2)
    13cc:	1ff00693          	li	a3,511
    13d0:	f8f6f8e3          	bgeu	a3,a5,1360 <_free_r+0xa0>
    13d4:	0097d693          	srl	a3,a5,0x9
    13d8:	00400613          	li	a2,4
    13dc:	12d66463          	bltu	a2,a3,1504 <_free_r+0x244>
    13e0:	0067d693          	srl	a3,a5,0x6
    13e4:	03968593          	add	a1,a3,57
    13e8:	03868613          	add	a2,a3,56
    13ec:	00359593          	sll	a1,a1,0x3
    13f0:	00b505b3          	add	a1,a0,a1
    13f4:	0005a683          	lw	a3,0(a1)
    13f8:	ff858593          	add	a1,a1,-8
    13fc:	00d59863          	bne	a1,a3,140c <_free_r+0x14c>
    1400:	15c0006f          	j	155c <_free_r+0x29c>
    1404:	0086a683          	lw	a3,8(a3)
    1408:	00d58863          	beq	a1,a3,1418 <_free_r+0x158>
    140c:	0046a603          	lw	a2,4(a3)
    1410:	ffc67613          	and	a2,a2,-4
    1414:	fec7e8e3          	bltu	a5,a2,1404 <_free_r+0x144>
    1418:	00c6a583          	lw	a1,12(a3)
    141c:	00b72623          	sw	a1,12(a4)
    1420:	00d72423          	sw	a3,8(a4)
    1424:	00812403          	lw	s0,8(sp)
    1428:	00c12083          	lw	ra,12(sp)
    142c:	00e5a423          	sw	a4,8(a1)
    1430:	00048513          	mv	a0,s1
    1434:	00412483          	lw	s1,4(sp)
    1438:	00e6a623          	sw	a4,12(a3)
    143c:	01010113          	add	sp,sp,16
    1440:	1790006f          	j	1db8 <__malloc_unlock>
    1444:	00008067          	ret
    1448:	00d787b3          	add	a5,a5,a3
    144c:	7ffff897          	auipc	a7,0x7ffff
    1450:	cdc88893          	add	a7,a7,-804 # 80000128 <__malloc_av_+0x8>
    1454:	00862683          	lw	a3,8(a2)
    1458:	0f168063          	beq	a3,a7,1538 <_free_r+0x278>
    145c:	00c62803          	lw	a6,12(a2)
    1460:	0017e593          	or	a1,a5,1
    1464:	00f70633          	add	a2,a4,a5
    1468:	0106a623          	sw	a6,12(a3)
    146c:	00d82423          	sw	a3,8(a6)
    1470:	00b72223          	sw	a1,4(a4)
    1474:	00f62023          	sw	a5,0(a2)
    1478:	ee1ff06f          	j	1358 <_free_r+0x98>
    147c:	14059063          	bnez	a1,15bc <_free_r+0x2fc>
    1480:	00862583          	lw	a1,8(a2)
    1484:	00c62603          	lw	a2,12(a2)
    1488:	00f686b3          	add	a3,a3,a5
    148c:	0016e793          	or	a5,a3,1
    1490:	00c5a623          	sw	a2,12(a1)
    1494:	00b62423          	sw	a1,8(a2)
    1498:	00f72223          	sw	a5,4(a4)
    149c:	00d70733          	add	a4,a4,a3
    14a0:	00d72023          	sw	a3,0(a4)
    14a4:	ef9ff06f          	j	139c <_free_r+0xdc>
    14a8:	0015f593          	and	a1,a1,1
    14ac:	00d786b3          	add	a3,a5,a3
    14b0:	02059063          	bnez	a1,14d0 <_free_r+0x210>
    14b4:	ff842583          	lw	a1,-8(s0)
    14b8:	40b70733          	sub	a4,a4,a1
    14bc:	00c72783          	lw	a5,12(a4)
    14c0:	00872603          	lw	a2,8(a4)
    14c4:	00b686b3          	add	a3,a3,a1
    14c8:	00f62623          	sw	a5,12(a2)
    14cc:	00c7a423          	sw	a2,8(a5)
    14d0:	0016e793          	or	a5,a3,1
    14d4:	00f72223          	sw	a5,4(a4)
    14d8:	00e52423          	sw	a4,8(a0)
    14dc:	7ffff797          	auipc	a5,0x7ffff
    14e0:	2347a783          	lw	a5,564(a5) # 80000710 <__malloc_trim_threshold>
    14e4:	eaf6ece3          	bltu	a3,a5,139c <_free_r+0xdc>
    14e8:	7ffff597          	auipc	a1,0x7ffff
    14ec:	2445a583          	lw	a1,580(a1) # 8000072c <__malloc_top_pad>
    14f0:	00048513          	mv	a0,s1
    14f4:	c89ff0ef          	jal	117c <_malloc_trim_r>
    14f8:	ea5ff06f          	j	139c <_free_r+0xdc>
    14fc:	00d787b3          	add	a5,a5,a3
    1500:	f55ff06f          	j	1454 <_free_r+0x194>
    1504:	01400613          	li	a2,20
    1508:	02d67063          	bgeu	a2,a3,1528 <_free_r+0x268>
    150c:	05400613          	li	a2,84
    1510:	06d66463          	bltu	a2,a3,1578 <_free_r+0x2b8>
    1514:	00c7d693          	srl	a3,a5,0xc
    1518:	06f68593          	add	a1,a3,111
    151c:	06e68613          	add	a2,a3,110
    1520:	00359593          	sll	a1,a1,0x3
    1524:	ecdff06f          	j	13f0 <_free_r+0x130>
    1528:	05c68593          	add	a1,a3,92
    152c:	05b68613          	add	a2,a3,91
    1530:	00359593          	sll	a1,a1,0x3
    1534:	ebdff06f          	j	13f0 <_free_r+0x130>
    1538:	00e52a23          	sw	a4,20(a0)
    153c:	00e52823          	sw	a4,16(a0)
    1540:	0017e693          	or	a3,a5,1
    1544:	01172623          	sw	a7,12(a4)
    1548:	01172423          	sw	a7,8(a4)
    154c:	00d72223          	sw	a3,4(a4)
    1550:	00f70733          	add	a4,a4,a5
    1554:	00f72023          	sw	a5,0(a4)
    1558:	e45ff06f          	j	139c <_free_r+0xdc>
    155c:	00452803          	lw	a6,4(a0)
    1560:	40265613          	sra	a2,a2,0x2
    1564:	00100793          	li	a5,1
    1568:	00c797b3          	sll	a5,a5,a2
    156c:	0107e7b3          	or	a5,a5,a6
    1570:	00f52223          	sw	a5,4(a0)
    1574:	ea9ff06f          	j	141c <_free_r+0x15c>
    1578:	15400613          	li	a2,340
    157c:	00d66c63          	bltu	a2,a3,1594 <_free_r+0x2d4>
    1580:	00f7d693          	srl	a3,a5,0xf
    1584:	07868593          	add	a1,a3,120
    1588:	07768613          	add	a2,a3,119
    158c:	00359593          	sll	a1,a1,0x3
    1590:	e61ff06f          	j	13f0 <_free_r+0x130>
    1594:	55400613          	li	a2,1364
    1598:	00d66c63          	bltu	a2,a3,15b0 <_free_r+0x2f0>
    159c:	0127d693          	srl	a3,a5,0x12
    15a0:	07d68593          	add	a1,a3,125
    15a4:	07c68613          	add	a2,a3,124
    15a8:	00359593          	sll	a1,a1,0x3
    15ac:	e45ff06f          	j	13f0 <_free_r+0x130>
    15b0:	3f800593          	li	a1,1016
    15b4:	07e00613          	li	a2,126
    15b8:	e39ff06f          	j	13f0 <_free_r+0x130>
    15bc:	0017e693          	or	a3,a5,1
    15c0:	00d72223          	sw	a3,4(a4)
    15c4:	00f62023          	sw	a5,0(a2)
    15c8:	dd5ff06f          	j	139c <_free_r+0xdc>

000015cc <_malloc_r>:
    15cc:	fd010113          	add	sp,sp,-48
    15d0:	03212023          	sw	s2,32(sp)
    15d4:	02112623          	sw	ra,44(sp)
    15d8:	02812423          	sw	s0,40(sp)
    15dc:	02912223          	sw	s1,36(sp)
    15e0:	01312e23          	sw	s3,28(sp)
    15e4:	00b58793          	add	a5,a1,11
    15e8:	01600713          	li	a4,22
    15ec:	00050913          	mv	s2,a0
    15f0:	08f76263          	bltu	a4,a5,1674 <_malloc_r+0xa8>
    15f4:	01000793          	li	a5,16
    15f8:	20b7e663          	bltu	a5,a1,1804 <_malloc_r+0x238>
    15fc:	7b0000ef          	jal	1dac <__malloc_lock>
    1600:	01800793          	li	a5,24
    1604:	00200593          	li	a1,2
    1608:	01000493          	li	s1,16
    160c:	7ffff997          	auipc	s3,0x7ffff
    1610:	b1498993          	add	s3,s3,-1260 # 80000120 <__malloc_av_>
    1614:	00f987b3          	add	a5,s3,a5
    1618:	0047a403          	lw	s0,4(a5)
    161c:	ff878713          	add	a4,a5,-8
    1620:	36e40463          	beq	s0,a4,1988 <_malloc_r+0x3bc>
    1624:	00442783          	lw	a5,4(s0)
    1628:	00c42683          	lw	a3,12(s0)
    162c:	00842603          	lw	a2,8(s0)
    1630:	ffc7f793          	and	a5,a5,-4
    1634:	00f407b3          	add	a5,s0,a5
    1638:	0047a703          	lw	a4,4(a5)
    163c:	00d62623          	sw	a3,12(a2)
    1640:	00c6a423          	sw	a2,8(a3)
    1644:	00176713          	or	a4,a4,1
    1648:	00090513          	mv	a0,s2
    164c:	00e7a223          	sw	a4,4(a5)
    1650:	768000ef          	jal	1db8 <__malloc_unlock>
    1654:	00840513          	add	a0,s0,8
    1658:	02c12083          	lw	ra,44(sp)
    165c:	02812403          	lw	s0,40(sp)
    1660:	02412483          	lw	s1,36(sp)
    1664:	02012903          	lw	s2,32(sp)
    1668:	01c12983          	lw	s3,28(sp)
    166c:	03010113          	add	sp,sp,48
    1670:	00008067          	ret
    1674:	ff87f493          	and	s1,a5,-8
    1678:	1807c663          	bltz	a5,1804 <_malloc_r+0x238>
    167c:	18b4e463          	bltu	s1,a1,1804 <_malloc_r+0x238>
    1680:	72c000ef          	jal	1dac <__malloc_lock>
    1684:	1f700793          	li	a5,503
    1688:	4097fa63          	bgeu	a5,s1,1a9c <_malloc_r+0x4d0>
    168c:	0094d793          	srl	a5,s1,0x9
    1690:	18078263          	beqz	a5,1814 <_malloc_r+0x248>
    1694:	00400713          	li	a4,4
    1698:	36f76063          	bltu	a4,a5,19f8 <_malloc_r+0x42c>
    169c:	0064d793          	srl	a5,s1,0x6
    16a0:	03978593          	add	a1,a5,57
    16a4:	03878813          	add	a6,a5,56
    16a8:	00359613          	sll	a2,a1,0x3
    16ac:	7ffff997          	auipc	s3,0x7ffff
    16b0:	a7498993          	add	s3,s3,-1420 # 80000120 <__malloc_av_>
    16b4:	00c98633          	add	a2,s3,a2
    16b8:	00462403          	lw	s0,4(a2)
    16bc:	ff860613          	add	a2,a2,-8
    16c0:	02860863          	beq	a2,s0,16f0 <_malloc_r+0x124>
    16c4:	00f00513          	li	a0,15
    16c8:	0140006f          	j	16dc <_malloc_r+0x110>
    16cc:	00c42683          	lw	a3,12(s0)
    16d0:	2a075863          	bgez	a4,1980 <_malloc_r+0x3b4>
    16d4:	00d60e63          	beq	a2,a3,16f0 <_malloc_r+0x124>
    16d8:	00068413          	mv	s0,a3
    16dc:	00442783          	lw	a5,4(s0)
    16e0:	ffc7f793          	and	a5,a5,-4
    16e4:	40978733          	sub	a4,a5,s1
    16e8:	fee552e3          	bge	a0,a4,16cc <_malloc_r+0x100>
    16ec:	00080593          	mv	a1,a6
    16f0:	0109a403          	lw	s0,16(s3)
    16f4:	7ffff897          	auipc	a7,0x7ffff
    16f8:	a3488893          	add	a7,a7,-1484 # 80000128 <__malloc_av_+0x8>
    16fc:	27140e63          	beq	s0,a7,1978 <_malloc_r+0x3ac>
    1700:	00442783          	lw	a5,4(s0)
    1704:	00f00693          	li	a3,15
    1708:	ffc7f793          	and	a5,a5,-4
    170c:	40978733          	sub	a4,a5,s1
    1710:	38e6cc63          	blt	a3,a4,1aa8 <_malloc_r+0x4dc>
    1714:	0119aa23          	sw	a7,20(s3)
    1718:	0119a823          	sw	a7,16(s3)
    171c:	36075063          	bgez	a4,1a7c <_malloc_r+0x4b0>
    1720:	1ff00713          	li	a4,511
    1724:	0049a503          	lw	a0,4(s3)
    1728:	26f76863          	bltu	a4,a5,1998 <_malloc_r+0x3cc>
    172c:	ff87f713          	and	a4,a5,-8
    1730:	00870713          	add	a4,a4,8
    1734:	00e98733          	add	a4,s3,a4
    1738:	00072683          	lw	a3,0(a4)
    173c:	0057d613          	srl	a2,a5,0x5
    1740:	00100793          	li	a5,1
    1744:	00c797b3          	sll	a5,a5,a2
    1748:	00f56533          	or	a0,a0,a5
    174c:	ff870793          	add	a5,a4,-8
    1750:	00f42623          	sw	a5,12(s0)
    1754:	00d42423          	sw	a3,8(s0)
    1758:	00a9a223          	sw	a0,4(s3)
    175c:	00872023          	sw	s0,0(a4)
    1760:	0086a623          	sw	s0,12(a3)
    1764:	4025d793          	sra	a5,a1,0x2
    1768:	00100613          	li	a2,1
    176c:	00f61633          	sll	a2,a2,a5
    1770:	0ac56a63          	bltu	a0,a2,1824 <_malloc_r+0x258>
    1774:	00a677b3          	and	a5,a2,a0
    1778:	02079463          	bnez	a5,17a0 <_malloc_r+0x1d4>
    177c:	00161613          	sll	a2,a2,0x1
    1780:	ffc5f593          	and	a1,a1,-4
    1784:	00a677b3          	and	a5,a2,a0
    1788:	00458593          	add	a1,a1,4
    178c:	00079a63          	bnez	a5,17a0 <_malloc_r+0x1d4>
    1790:	00161613          	sll	a2,a2,0x1
    1794:	00a677b3          	and	a5,a2,a0
    1798:	00458593          	add	a1,a1,4
    179c:	fe078ae3          	beqz	a5,1790 <_malloc_r+0x1c4>
    17a0:	00f00813          	li	a6,15
    17a4:	00359313          	sll	t1,a1,0x3
    17a8:	00698333          	add	t1,s3,t1
    17ac:	00030513          	mv	a0,t1
    17b0:	00c52783          	lw	a5,12(a0)
    17b4:	00058e13          	mv	t3,a1
    17b8:	26f50263          	beq	a0,a5,1a1c <_malloc_r+0x450>
    17bc:	0047a703          	lw	a4,4(a5)
    17c0:	00078413          	mv	s0,a5
    17c4:	00c7a783          	lw	a5,12(a5)
    17c8:	ffc77713          	and	a4,a4,-4
    17cc:	409706b3          	sub	a3,a4,s1
    17d0:	26d84263          	blt	a6,a3,1a34 <_malloc_r+0x468>
    17d4:	fe06c2e3          	bltz	a3,17b8 <_malloc_r+0x1ec>
    17d8:	00e40733          	add	a4,s0,a4
    17dc:	00472683          	lw	a3,4(a4)
    17e0:	00842603          	lw	a2,8(s0)
    17e4:	00090513          	mv	a0,s2
    17e8:	0016e693          	or	a3,a3,1
    17ec:	00d72223          	sw	a3,4(a4)
    17f0:	00f62623          	sw	a5,12(a2)
    17f4:	00c7a423          	sw	a2,8(a5)
    17f8:	5c0000ef          	jal	1db8 <__malloc_unlock>
    17fc:	00840513          	add	a0,s0,8
    1800:	e59ff06f          	j	1658 <_malloc_r+0x8c>
    1804:	00c00793          	li	a5,12
    1808:	00f92023          	sw	a5,0(s2)
    180c:	00000513          	li	a0,0
    1810:	e49ff06f          	j	1658 <_malloc_r+0x8c>
    1814:	20000613          	li	a2,512
    1818:	04000593          	li	a1,64
    181c:	03f00813          	li	a6,63
    1820:	e8dff06f          	j	16ac <_malloc_r+0xe0>
    1824:	0089a403          	lw	s0,8(s3)
    1828:	01612823          	sw	s6,16(sp)
    182c:	00442783          	lw	a5,4(s0)
    1830:	ffc7fb13          	and	s6,a5,-4
    1834:	009b6863          	bltu	s6,s1,1844 <_malloc_r+0x278>
    1838:	409b0733          	sub	a4,s6,s1
    183c:	00f00793          	li	a5,15
    1840:	0ee7ca63          	blt	a5,a4,1934 <_malloc_r+0x368>
    1844:	01912223          	sw	s9,4(sp)
    1848:	7ffffc97          	auipc	s9,0x7ffff
    184c:	ec4c8c93          	add	s9,s9,-316 # 8000070c <__malloc_sbrk_base>
    1850:	000ca703          	lw	a4,0(s9)
    1854:	01412c23          	sw	s4,24(sp)
    1858:	01512a23          	sw	s5,20(sp)
    185c:	01712623          	sw	s7,12(sp)
    1860:	7ffffa97          	auipc	s5,0x7ffff
    1864:	eccaaa83          	lw	s5,-308(s5) # 8000072c <__malloc_top_pad>
    1868:	fff00793          	li	a5,-1
    186c:	01640a33          	add	s4,s0,s6
    1870:	01548ab3          	add	s5,s1,s5
    1874:	3ef70263          	beq	a4,a5,1c58 <_malloc_r+0x68c>
    1878:	000017b7          	lui	a5,0x1
    187c:	00f78793          	add	a5,a5,15 # 100f <memcpy+0xc3>
    1880:	00fa8ab3          	add	s5,s5,a5
    1884:	fffff7b7          	lui	a5,0xfffff
    1888:	00fafab3          	and	s5,s5,a5
    188c:	000a8593          	mv	a1,s5
    1890:	00090513          	mv	a0,s2
    1894:	7c9050ef          	jal	785c <_sbrk_r>
    1898:	fff00793          	li	a5,-1
    189c:	00050b93          	mv	s7,a0
    18a0:	46f50663          	beq	a0,a5,1d0c <_malloc_r+0x740>
    18a4:	01812423          	sw	s8,8(sp)
    18a8:	25456863          	bltu	a0,s4,1af8 <_malloc_r+0x52c>
    18ac:	7ffffc17          	auipc	s8,0x7ffff
    18b0:	6c8c0c13          	add	s8,s8,1736 # 80000f74 <__malloc_current_mallinfo>
    18b4:	000c2583          	lw	a1,0(s8)
    18b8:	00ba85b3          	add	a1,s5,a1
    18bc:	00bc2023          	sw	a1,0(s8)
    18c0:	00058713          	mv	a4,a1
    18c4:	2caa1063          	bne	s4,a0,1b84 <_malloc_r+0x5b8>
    18c8:	01451793          	sll	a5,a0,0x14
    18cc:	2a079c63          	bnez	a5,1b84 <_malloc_r+0x5b8>
    18d0:	0089ab83          	lw	s7,8(s3)
    18d4:	015b07b3          	add	a5,s6,s5
    18d8:	0017e793          	or	a5,a5,1
    18dc:	00fba223          	sw	a5,4(s7)
    18e0:	7ffff717          	auipc	a4,0x7ffff
    18e4:	e4870713          	add	a4,a4,-440 # 80000728 <__malloc_max_sbrked_mem>
    18e8:	00072683          	lw	a3,0(a4)
    18ec:	00b6f463          	bgeu	a3,a1,18f4 <_malloc_r+0x328>
    18f0:	00b72023          	sw	a1,0(a4)
    18f4:	7ffff717          	auipc	a4,0x7ffff
    18f8:	e3070713          	add	a4,a4,-464 # 80000724 <__malloc_max_total_mem>
    18fc:	00072683          	lw	a3,0(a4)
    1900:	00b6f463          	bgeu	a3,a1,1908 <_malloc_r+0x33c>
    1904:	00b72023          	sw	a1,0(a4)
    1908:	00812c03          	lw	s8,8(sp)
    190c:	000b8413          	mv	s0,s7
    1910:	ffc7f793          	and	a5,a5,-4
    1914:	40978733          	sub	a4,a5,s1
    1918:	3897ec63          	bltu	a5,s1,1cb0 <_malloc_r+0x6e4>
    191c:	00f00793          	li	a5,15
    1920:	38e7d863          	bge	a5,a4,1cb0 <_malloc_r+0x6e4>
    1924:	01812a03          	lw	s4,24(sp)
    1928:	01412a83          	lw	s5,20(sp)
    192c:	00c12b83          	lw	s7,12(sp)
    1930:	00412c83          	lw	s9,4(sp)
    1934:	0014e793          	or	a5,s1,1
    1938:	00f42223          	sw	a5,4(s0)
    193c:	009404b3          	add	s1,s0,s1
    1940:	0099a423          	sw	s1,8(s3)
    1944:	00176713          	or	a4,a4,1
    1948:	00090513          	mv	a0,s2
    194c:	00e4a223          	sw	a4,4(s1)
    1950:	468000ef          	jal	1db8 <__malloc_unlock>
    1954:	02c12083          	lw	ra,44(sp)
    1958:	00840513          	add	a0,s0,8
    195c:	02812403          	lw	s0,40(sp)
    1960:	01012b03          	lw	s6,16(sp)
    1964:	02412483          	lw	s1,36(sp)
    1968:	02012903          	lw	s2,32(sp)
    196c:	01c12983          	lw	s3,28(sp)
    1970:	03010113          	add	sp,sp,48
    1974:	00008067          	ret
    1978:	0049a503          	lw	a0,4(s3)
    197c:	de9ff06f          	j	1764 <_malloc_r+0x198>
    1980:	00842603          	lw	a2,8(s0)
    1984:	cb1ff06f          	j	1634 <_malloc_r+0x68>
    1988:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    198c:	00258593          	add	a1,a1,2
    1990:	d68780e3          	beq	a5,s0,16f0 <_malloc_r+0x124>
    1994:	c91ff06f          	j	1624 <_malloc_r+0x58>
    1998:	0097d713          	srl	a4,a5,0x9
    199c:	00400693          	li	a3,4
    19a0:	14e6f263          	bgeu	a3,a4,1ae4 <_malloc_r+0x518>
    19a4:	01400693          	li	a3,20
    19a8:	32e6e663          	bltu	a3,a4,1cd4 <_malloc_r+0x708>
    19ac:	05c70613          	add	a2,a4,92
    19b0:	05b70693          	add	a3,a4,91
    19b4:	00361613          	sll	a2,a2,0x3
    19b8:	00c98633          	add	a2,s3,a2
    19bc:	00062703          	lw	a4,0(a2)
    19c0:	ff860613          	add	a2,a2,-8
    19c4:	00e61863          	bne	a2,a4,19d4 <_malloc_r+0x408>
    19c8:	2980006f          	j	1c60 <_malloc_r+0x694>
    19cc:	00872703          	lw	a4,8(a4)
    19d0:	00e60863          	beq	a2,a4,19e0 <_malloc_r+0x414>
    19d4:	00472683          	lw	a3,4(a4)
    19d8:	ffc6f693          	and	a3,a3,-4
    19dc:	fed7e8e3          	bltu	a5,a3,19cc <_malloc_r+0x400>
    19e0:	00c72603          	lw	a2,12(a4)
    19e4:	00c42623          	sw	a2,12(s0)
    19e8:	00e42423          	sw	a4,8(s0)
    19ec:	00862423          	sw	s0,8(a2)
    19f0:	00872623          	sw	s0,12(a4)
    19f4:	d71ff06f          	j	1764 <_malloc_r+0x198>
    19f8:	01400713          	li	a4,20
    19fc:	10f77863          	bgeu	a4,a5,1b0c <_malloc_r+0x540>
    1a00:	05400713          	li	a4,84
    1a04:	2ef76663          	bltu	a4,a5,1cf0 <_malloc_r+0x724>
    1a08:	00c4d793          	srl	a5,s1,0xc
    1a0c:	06f78593          	add	a1,a5,111
    1a10:	06e78813          	add	a6,a5,110
    1a14:	00359613          	sll	a2,a1,0x3
    1a18:	c95ff06f          	j	16ac <_malloc_r+0xe0>
    1a1c:	001e0e13          	add	t3,t3,1
    1a20:	003e7793          	and	a5,t3,3
    1a24:	00850513          	add	a0,a0,8
    1a28:	10078063          	beqz	a5,1b28 <_malloc_r+0x55c>
    1a2c:	00c52783          	lw	a5,12(a0)
    1a30:	d89ff06f          	j	17b8 <_malloc_r+0x1ec>
    1a34:	00842603          	lw	a2,8(s0)
    1a38:	0014e593          	or	a1,s1,1
    1a3c:	00b42223          	sw	a1,4(s0)
    1a40:	00f62623          	sw	a5,12(a2)
    1a44:	00c7a423          	sw	a2,8(a5)
    1a48:	009404b3          	add	s1,s0,s1
    1a4c:	0099aa23          	sw	s1,20(s3)
    1a50:	0099a823          	sw	s1,16(s3)
    1a54:	0016e793          	or	a5,a3,1
    1a58:	0114a623          	sw	a7,12(s1)
    1a5c:	0114a423          	sw	a7,8(s1)
    1a60:	00f4a223          	sw	a5,4(s1)
    1a64:	00e40733          	add	a4,s0,a4
    1a68:	00090513          	mv	a0,s2
    1a6c:	00d72023          	sw	a3,0(a4)
    1a70:	348000ef          	jal	1db8 <__malloc_unlock>
    1a74:	00840513          	add	a0,s0,8
    1a78:	be1ff06f          	j	1658 <_malloc_r+0x8c>
    1a7c:	00f407b3          	add	a5,s0,a5
    1a80:	0047a703          	lw	a4,4(a5)
    1a84:	00090513          	mv	a0,s2
    1a88:	00176713          	or	a4,a4,1
    1a8c:	00e7a223          	sw	a4,4(a5)
    1a90:	328000ef          	jal	1db8 <__malloc_unlock>
    1a94:	00840513          	add	a0,s0,8
    1a98:	bc1ff06f          	j	1658 <_malloc_r+0x8c>
    1a9c:	0034d593          	srl	a1,s1,0x3
    1aa0:	00848793          	add	a5,s1,8
    1aa4:	b69ff06f          	j	160c <_malloc_r+0x40>
    1aa8:	0014e693          	or	a3,s1,1
    1aac:	00d42223          	sw	a3,4(s0)
    1ab0:	009404b3          	add	s1,s0,s1
    1ab4:	0099aa23          	sw	s1,20(s3)
    1ab8:	0099a823          	sw	s1,16(s3)
    1abc:	00176693          	or	a3,a4,1
    1ac0:	0114a623          	sw	a7,12(s1)
    1ac4:	0114a423          	sw	a7,8(s1)
    1ac8:	00d4a223          	sw	a3,4(s1)
    1acc:	00f407b3          	add	a5,s0,a5
    1ad0:	00090513          	mv	a0,s2
    1ad4:	00e7a023          	sw	a4,0(a5)
    1ad8:	2e0000ef          	jal	1db8 <__malloc_unlock>
    1adc:	00840513          	add	a0,s0,8
    1ae0:	b79ff06f          	j	1658 <_malloc_r+0x8c>
    1ae4:	0067d713          	srl	a4,a5,0x6
    1ae8:	03970613          	add	a2,a4,57
    1aec:	03870693          	add	a3,a4,56
    1af0:	00361613          	sll	a2,a2,0x3
    1af4:	ec5ff06f          	j	19b8 <_malloc_r+0x3ec>
    1af8:	07340c63          	beq	s0,s3,1b70 <_malloc_r+0x5a4>
    1afc:	0089a403          	lw	s0,8(s3)
    1b00:	00812c03          	lw	s8,8(sp)
    1b04:	00442783          	lw	a5,4(s0)
    1b08:	e09ff06f          	j	1910 <_malloc_r+0x344>
    1b0c:	05c78593          	add	a1,a5,92
    1b10:	05b78813          	add	a6,a5,91
    1b14:	00359613          	sll	a2,a1,0x3
    1b18:	b95ff06f          	j	16ac <_malloc_r+0xe0>
    1b1c:	00832783          	lw	a5,8(t1)
    1b20:	fff58593          	add	a1,a1,-1
    1b24:	28679063          	bne	a5,t1,1da4 <_malloc_r+0x7d8>
    1b28:	0035f793          	and	a5,a1,3
    1b2c:	ff830313          	add	t1,t1,-8
    1b30:	fe0796e3          	bnez	a5,1b1c <_malloc_r+0x550>
    1b34:	0049a703          	lw	a4,4(s3)
    1b38:	fff64793          	not	a5,a2
    1b3c:	00e7f7b3          	and	a5,a5,a4
    1b40:	00f9a223          	sw	a5,4(s3)
    1b44:	00161613          	sll	a2,a2,0x1
    1b48:	ccc7eee3          	bltu	a5,a2,1824 <_malloc_r+0x258>
    1b4c:	cc060ce3          	beqz	a2,1824 <_malloc_r+0x258>
    1b50:	00f67733          	and	a4,a2,a5
    1b54:	00071a63          	bnez	a4,1b68 <_malloc_r+0x59c>
    1b58:	00161613          	sll	a2,a2,0x1
    1b5c:	00f67733          	and	a4,a2,a5
    1b60:	004e0e13          	add	t3,t3,4
    1b64:	fe070ae3          	beqz	a4,1b58 <_malloc_r+0x58c>
    1b68:	000e0593          	mv	a1,t3
    1b6c:	c39ff06f          	j	17a4 <_malloc_r+0x1d8>
    1b70:	7ffffc17          	auipc	s8,0x7ffff
    1b74:	404c0c13          	add	s8,s8,1028 # 80000f74 <__malloc_current_mallinfo>
    1b78:	000c2703          	lw	a4,0(s8)
    1b7c:	00ea8733          	add	a4,s5,a4
    1b80:	00ec2023          	sw	a4,0(s8)
    1b84:	000ca683          	lw	a3,0(s9)
    1b88:	fff00793          	li	a5,-1
    1b8c:	18f68663          	beq	a3,a5,1d18 <_malloc_r+0x74c>
    1b90:	414b87b3          	sub	a5,s7,s4
    1b94:	00e787b3          	add	a5,a5,a4
    1b98:	00fc2023          	sw	a5,0(s8)
    1b9c:	007bfc93          	and	s9,s7,7
    1ba0:	0c0c8c63          	beqz	s9,1c78 <_malloc_r+0x6ac>
    1ba4:	419b8bb3          	sub	s7,s7,s9
    1ba8:	000017b7          	lui	a5,0x1
    1bac:	00878793          	add	a5,a5,8 # 1008 <memcpy+0xbc>
    1bb0:	008b8b93          	add	s7,s7,8
    1bb4:	419785b3          	sub	a1,a5,s9
    1bb8:	015b8ab3          	add	s5,s7,s5
    1bbc:	415585b3          	sub	a1,a1,s5
    1bc0:	01459593          	sll	a1,a1,0x14
    1bc4:	0145da13          	srl	s4,a1,0x14
    1bc8:	000a0593          	mv	a1,s4
    1bcc:	00090513          	mv	a0,s2
    1bd0:	48d050ef          	jal	785c <_sbrk_r>
    1bd4:	fff00793          	li	a5,-1
    1bd8:	18f50063          	beq	a0,a5,1d58 <_malloc_r+0x78c>
    1bdc:	41750533          	sub	a0,a0,s7
    1be0:	01450ab3          	add	s5,a0,s4
    1be4:	000c2703          	lw	a4,0(s8)
    1be8:	0179a423          	sw	s7,8(s3)
    1bec:	001ae793          	or	a5,s5,1
    1bf0:	00ea05b3          	add	a1,s4,a4
    1bf4:	00bc2023          	sw	a1,0(s8)
    1bf8:	00fba223          	sw	a5,4(s7)
    1bfc:	cf3402e3          	beq	s0,s3,18e0 <_malloc_r+0x314>
    1c00:	00f00693          	li	a3,15
    1c04:	0b66f063          	bgeu	a3,s6,1ca4 <_malloc_r+0x6d8>
    1c08:	00442703          	lw	a4,4(s0)
    1c0c:	ff4b0793          	add	a5,s6,-12 # 7ffff4 <__neorv32_ram_size+0x77fff4>
    1c10:	ff87f793          	and	a5,a5,-8
    1c14:	00177713          	and	a4,a4,1
    1c18:	00f76733          	or	a4,a4,a5
    1c1c:	00e42223          	sw	a4,4(s0)
    1c20:	00500613          	li	a2,5
    1c24:	00f40733          	add	a4,s0,a5
    1c28:	00c72223          	sw	a2,4(a4)
    1c2c:	00c72423          	sw	a2,8(a4)
    1c30:	00f6e663          	bltu	a3,a5,1c3c <_malloc_r+0x670>
    1c34:	004ba783          	lw	a5,4(s7)
    1c38:	ca9ff06f          	j	18e0 <_malloc_r+0x314>
    1c3c:	00840593          	add	a1,s0,8
    1c40:	00090513          	mv	a0,s2
    1c44:	e7cff0ef          	jal	12c0 <_free_r>
    1c48:	0089ab83          	lw	s7,8(s3)
    1c4c:	000c2583          	lw	a1,0(s8)
    1c50:	004ba783          	lw	a5,4(s7)
    1c54:	c8dff06f          	j	18e0 <_malloc_r+0x314>
    1c58:	010a8a93          	add	s5,s5,16
    1c5c:	c31ff06f          	j	188c <_malloc_r+0x2c0>
    1c60:	4026d693          	sra	a3,a3,0x2
    1c64:	00100793          	li	a5,1
    1c68:	00d797b3          	sll	a5,a5,a3
    1c6c:	00f56533          	or	a0,a0,a5
    1c70:	00a9a223          	sw	a0,4(s3)
    1c74:	d71ff06f          	j	19e4 <_malloc_r+0x418>
    1c78:	015b85b3          	add	a1,s7,s5
    1c7c:	40b005b3          	neg	a1,a1
    1c80:	01459593          	sll	a1,a1,0x14
    1c84:	0145da13          	srl	s4,a1,0x14
    1c88:	000a0593          	mv	a1,s4
    1c8c:	00090513          	mv	a0,s2
    1c90:	3cd050ef          	jal	785c <_sbrk_r>
    1c94:	fff00793          	li	a5,-1
    1c98:	f4f512e3          	bne	a0,a5,1bdc <_malloc_r+0x610>
    1c9c:	00000a13          	li	s4,0
    1ca0:	f45ff06f          	j	1be4 <_malloc_r+0x618>
    1ca4:	00812c03          	lw	s8,8(sp)
    1ca8:	00100793          	li	a5,1
    1cac:	00fba223          	sw	a5,4(s7)
    1cb0:	00090513          	mv	a0,s2
    1cb4:	104000ef          	jal	1db8 <__malloc_unlock>
    1cb8:	00000513          	li	a0,0
    1cbc:	01812a03          	lw	s4,24(sp)
    1cc0:	01412a83          	lw	s5,20(sp)
    1cc4:	01012b03          	lw	s6,16(sp)
    1cc8:	00c12b83          	lw	s7,12(sp)
    1ccc:	00412c83          	lw	s9,4(sp)
    1cd0:	989ff06f          	j	1658 <_malloc_r+0x8c>
    1cd4:	05400693          	li	a3,84
    1cd8:	04e6e463          	bltu	a3,a4,1d20 <_malloc_r+0x754>
    1cdc:	00c7d713          	srl	a4,a5,0xc
    1ce0:	06f70613          	add	a2,a4,111
    1ce4:	06e70693          	add	a3,a4,110
    1ce8:	00361613          	sll	a2,a2,0x3
    1cec:	ccdff06f          	j	19b8 <_malloc_r+0x3ec>
    1cf0:	15400713          	li	a4,340
    1cf4:	04f76463          	bltu	a4,a5,1d3c <_malloc_r+0x770>
    1cf8:	00f4d793          	srl	a5,s1,0xf
    1cfc:	07878593          	add	a1,a5,120
    1d00:	07778813          	add	a6,a5,119
    1d04:	00359613          	sll	a2,a1,0x3
    1d08:	9a5ff06f          	j	16ac <_malloc_r+0xe0>
    1d0c:	0089a403          	lw	s0,8(s3)
    1d10:	00442783          	lw	a5,4(s0)
    1d14:	bfdff06f          	j	1910 <_malloc_r+0x344>
    1d18:	017ca023          	sw	s7,0(s9)
    1d1c:	e81ff06f          	j	1b9c <_malloc_r+0x5d0>
    1d20:	15400693          	li	a3,340
    1d24:	04e6e463          	bltu	a3,a4,1d6c <_malloc_r+0x7a0>
    1d28:	00f7d713          	srl	a4,a5,0xf
    1d2c:	07870613          	add	a2,a4,120
    1d30:	07770693          	add	a3,a4,119
    1d34:	00361613          	sll	a2,a2,0x3
    1d38:	c81ff06f          	j	19b8 <_malloc_r+0x3ec>
    1d3c:	55400713          	li	a4,1364
    1d40:	04f76463          	bltu	a4,a5,1d88 <_malloc_r+0x7bc>
    1d44:	0124d793          	srl	a5,s1,0x12
    1d48:	07d78593          	add	a1,a5,125
    1d4c:	07c78813          	add	a6,a5,124
    1d50:	00359613          	sll	a2,a1,0x3
    1d54:	959ff06f          	j	16ac <_malloc_r+0xe0>
    1d58:	ff8c8c93          	add	s9,s9,-8
    1d5c:	019a8ab3          	add	s5,s5,s9
    1d60:	417a8ab3          	sub	s5,s5,s7
    1d64:	00000a13          	li	s4,0
    1d68:	e7dff06f          	j	1be4 <_malloc_r+0x618>
    1d6c:	55400693          	li	a3,1364
    1d70:	02e6e463          	bltu	a3,a4,1d98 <_malloc_r+0x7cc>
    1d74:	0127d713          	srl	a4,a5,0x12
    1d78:	07d70613          	add	a2,a4,125
    1d7c:	07c70693          	add	a3,a4,124
    1d80:	00361613          	sll	a2,a2,0x3
    1d84:	c35ff06f          	j	19b8 <_malloc_r+0x3ec>
    1d88:	3f800613          	li	a2,1016
    1d8c:	07f00593          	li	a1,127
    1d90:	07e00813          	li	a6,126
    1d94:	919ff06f          	j	16ac <_malloc_r+0xe0>
    1d98:	3f800613          	li	a2,1016
    1d9c:	07e00693          	li	a3,126
    1da0:	c19ff06f          	j	19b8 <_malloc_r+0x3ec>
    1da4:	0049a783          	lw	a5,4(s3)
    1da8:	d9dff06f          	j	1b44 <_malloc_r+0x578>

00001dac <__malloc_lock>:
    1dac:	7ffff517          	auipc	a0,0x7ffff
    1db0:	97050513          	add	a0,a0,-1680 # 8000071c <__lock___malloc_recursive_mutex>
    1db4:	8b4ff06f          	j	e68 <__retarget_lock_acquire_recursive>

00001db8 <__malloc_unlock>:
    1db8:	7ffff517          	auipc	a0,0x7ffff
    1dbc:	96450513          	add	a0,a0,-1692 # 8000071c <__lock___malloc_recursive_mutex>
    1dc0:	8acff06f          	j	e6c <__retarget_lock_release_recursive>

00001dc4 <_vfprintf_r>:
    1dc4:	e7010113          	add	sp,sp,-400
    1dc8:	18112623          	sw	ra,396(sp)
    1dcc:	00b12423          	sw	a1,8(sp)
    1dd0:	00c12623          	sw	a2,12(sp)
    1dd4:	00d12a23          	sw	a3,20(sp)
    1dd8:	17312e23          	sw	s3,380(sp)
    1ddc:	18812423          	sw	s0,392(sp)
    1de0:	00050993          	mv	s3,a0
    1de4:	14d050ef          	jal	7730 <_localeconv_r>
    1de8:	00052783          	lw	a5,0(a0)
    1dec:	00078513          	mv	a0,a5
    1df0:	02f12a23          	sw	a5,52(sp)
    1df4:	afcff0ef          	jal	10f0 <strlen>
    1df8:	00050713          	mv	a4,a0
    1dfc:	00800613          	li	a2,8
    1e00:	00000593          	li	a1,0
    1e04:	09010513          	add	a0,sp,144
    1e08:	02e12823          	sw	a4,48(sp)
    1e0c:	864ff0ef          	jal	e70 <memset>
    1e10:	00c12783          	lw	a5,12(sp)
    1e14:	00098863          	beqz	s3,1e24 <_vfprintf_r+0x60>
    1e18:	0349a703          	lw	a4,52(s3)
    1e1c:	00071463          	bnez	a4,1e24 <_vfprintf_r+0x60>
    1e20:	29d0106f          	j	38bc <_vfprintf_r+0x1af8>
    1e24:	00812703          	lw	a4,8(sp)
    1e28:	06472683          	lw	a3,100(a4)
    1e2c:	00c71703          	lh	a4,12(a4)
    1e30:	0016f693          	and	a3,a3,1
    1e34:	00069863          	bnez	a3,1e44 <_vfprintf_r+0x80>
    1e38:	20077693          	and	a3,a4,512
    1e3c:	00069463          	bnez	a3,1e44 <_vfprintf_r+0x80>
    1e40:	3ec0106f          	j	322c <_vfprintf_r+0x1468>
    1e44:	01271693          	sll	a3,a4,0x12
    1e48:	0206c863          	bltz	a3,1e78 <_vfprintf_r+0xb4>
    1e4c:	00812503          	lw	a0,8(sp)
    1e50:	000025b7          	lui	a1,0x2
    1e54:	ffffe637          	lui	a2,0xffffe
    1e58:	06452683          	lw	a3,100(a0)
    1e5c:	00b76733          	or	a4,a4,a1
    1e60:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1e64:	01071713          	sll	a4,a4,0x10
    1e68:	41075713          	sra	a4,a4,0x10
    1e6c:	00c6f6b3          	and	a3,a3,a2
    1e70:	00e51623          	sh	a4,12(a0)
    1e74:	06d52223          	sw	a3,100(a0)
    1e78:	00877693          	and	a3,a4,8
    1e7c:	2a068063          	beqz	a3,211c <_vfprintf_r+0x358>
    1e80:	00812683          	lw	a3,8(sp)
    1e84:	0106a683          	lw	a3,16(a3)
    1e88:	28068a63          	beqz	a3,211c <_vfprintf_r+0x358>
    1e8c:	01a77693          	and	a3,a4,26
    1e90:	00a00613          	li	a2,10
    1e94:	2ac68c63          	beq	a3,a2,214c <_vfprintf_r+0x388>
    1e98:	0ac10713          	add	a4,sp,172
    1e9c:	17512a23          	sw	s5,372(sp)
    1ea0:	17812423          	sw	s8,360(sp)
    1ea4:	15b12e23          	sw	s11,348(sp)
    1ea8:	18912223          	sw	s1,388(sp)
    1eac:	19212023          	sw	s2,384(sp)
    1eb0:	17412c23          	sw	s4,376(sp)
    1eb4:	17612823          	sw	s6,368(sp)
    1eb8:	17712623          	sw	s7,364(sp)
    1ebc:	17912223          	sw	s9,356(sp)
    1ec0:	17a12023          	sw	s10,352(sp)
    1ec4:	0ae12023          	sw	a4,160(sp)
    1ec8:	0a012423          	sw	zero,168(sp)
    1ecc:	0a012223          	sw	zero,164(sp)
    1ed0:	00012c23          	sw	zero,24(sp)
    1ed4:	02012423          	sw	zero,40(sp)
    1ed8:	02012623          	sw	zero,44(sp)
    1edc:	00070413          	mv	s0,a4
    1ee0:	02012c23          	sw	zero,56(sp)
    1ee4:	04012023          	sw	zero,64(sp)
    1ee8:	02012e23          	sw	zero,60(sp)
    1eec:	04012623          	sw	zero,76(sp)
    1ef0:	04012423          	sw	zero,72(sp)
    1ef4:	00012623          	sw	zero,12(sp)
    1ef8:	7fffea97          	auipc	s5,0x7fffe
    1efc:	63ca8a93          	add	s5,s5,1596 # 80000534 <__global_locale>
    1f00:	02500d93          	li	s11,37
    1f04:	00078c13          	mv	s8,a5
    1f08:	000c0913          	mv	s2,s8
    1f0c:	0e4aa483          	lw	s1,228(s5)
    1f10:	015050ef          	jal	7724 <__locale_mb_cur_max>
    1f14:	00050693          	mv	a3,a0
    1f18:	09010713          	add	a4,sp,144
    1f1c:	00090613          	mv	a2,s2
    1f20:	08010593          	add	a1,sp,128
    1f24:	00098513          	mv	a0,s3
    1f28:	000480e7          	jalr	s1
    1f2c:	2c050a63          	beqz	a0,2200 <_vfprintf_r+0x43c>
    1f30:	2a054a63          	bltz	a0,21e4 <_vfprintf_r+0x420>
    1f34:	08012783          	lw	a5,128(sp)
    1f38:	01b78663          	beq	a5,s11,1f44 <_vfprintf_r+0x180>
    1f3c:	00a90933          	add	s2,s2,a0
    1f40:	fcdff06f          	j	1f0c <_vfprintf_r+0x148>
    1f44:	00050493          	mv	s1,a0
    1f48:	41890cb3          	sub	s9,s2,s8
    1f4c:	2d891063          	bne	s2,s8,220c <_vfprintf_r+0x448>
    1f50:	fff00313          	li	t1,-1
    1f54:	00000e93          	li	t4,0
    1f58:	00194e03          	lbu	t3,1(s2)
    1f5c:	06010ba3          	sb	zero,119(sp)
    1f60:	00190913          	add	s2,s2,1
    1f64:	00000b93          	li	s7,0
    1f68:	05a00493          	li	s1,90
    1f6c:	000e8a13          	mv	s4,t4
    1f70:	00030b13          	mv	s6,t1
    1f74:	00190913          	add	s2,s2,1
    1f78:	fe0e0793          	add	a5,t3,-32
    1f7c:	04f4ea63          	bltu	s1,a5,1fd0 <_vfprintf_r+0x20c>
    1f80:	0000d717          	auipc	a4,0xd
    1f84:	2f070713          	add	a4,a4,752 # f270 <_ctype_+0x104>
    1f88:	00279793          	sll	a5,a5,0x2
    1f8c:	00e787b3          	add	a5,a5,a4
    1f90:	0007a783          	lw	a5,0(a5)
    1f94:	00e787b3          	add	a5,a5,a4
    1f98:	00078067          	jr	a5
    1f9c:	00000b93          	li	s7,0
    1fa0:	fd0e0713          	add	a4,t3,-48
    1fa4:	00900693          	li	a3,9
    1fa8:	00094e03          	lbu	t3,0(s2)
    1fac:	002b9793          	sll	a5,s7,0x2
    1fb0:	017787b3          	add	a5,a5,s7
    1fb4:	00179793          	sll	a5,a5,0x1
    1fb8:	00f70bb3          	add	s7,a4,a5
    1fbc:	fd0e0713          	add	a4,t3,-48
    1fc0:	00190913          	add	s2,s2,1
    1fc4:	fee6f2e3          	bgeu	a3,a4,1fa8 <_vfprintf_r+0x1e4>
    1fc8:	fe0e0793          	add	a5,t3,-32
    1fcc:	faf4fae3          	bgeu	s1,a5,1f80 <_vfprintf_r+0x1bc>
    1fd0:	000a0e93          	mv	t4,s4
    1fd4:	260e0a63          	beqz	t3,2248 <_vfprintf_r+0x484>
    1fd8:	0fc10623          	sb	t3,236(sp)
    1fdc:	06010ba3          	sb	zero,119(sp)
    1fe0:	00100c93          	li	s9,1
    1fe4:	00000613          	li	a2,0
    1fe8:	00012823          	sw	zero,16(sp)
    1fec:	00100d13          	li	s10,1
    1ff0:	00000313          	li	t1,0
    1ff4:	02012223          	sw	zero,36(sp)
    1ff8:	02012023          	sw	zero,32(sp)
    1ffc:	00000a13          	li	s4,0
    2000:	0ec10c13          	add	s8,sp,236
    2004:	002ef293          	and	t0,t4,2
    2008:	00028463          	beqz	t0,2010 <_vfprintf_r+0x24c>
    200c:	002c8c93          	add	s9,s9,2
    2010:	084eff93          	and	t6,t4,132
    2014:	0a812483          	lw	s1,168(sp)
    2018:	000f9663          	bnez	t6,2024 <_vfprintf_r+0x260>
    201c:	419b8733          	sub	a4,s7,s9
    2020:	40e04663          	bgtz	a4,242c <_vfprintf_r+0x668>
    2024:	02060a63          	beqz	a2,2058 <_vfprintf_r+0x294>
    2028:	0a412703          	lw	a4,164(sp)
    202c:	07710613          	add	a2,sp,119
    2030:	00148493          	add	s1,s1,1
    2034:	00170713          	add	a4,a4,1
    2038:	00100793          	li	a5,1
    203c:	00c42023          	sw	a2,0(s0)
    2040:	00f42223          	sw	a5,4(s0)
    2044:	0a912423          	sw	s1,168(sp)
    2048:	0ae12223          	sw	a4,164(sp)
    204c:	00700613          	li	a2,7
    2050:	00840413          	add	s0,s0,8
    2054:	4ce64863          	blt	a2,a4,2524 <_vfprintf_r+0x760>
    2058:	02028a63          	beqz	t0,208c <_vfprintf_r+0x2c8>
    205c:	0a412703          	lw	a4,164(sp)
    2060:	07810613          	add	a2,sp,120
    2064:	00c42023          	sw	a2,0(s0)
    2068:	00248493          	add	s1,s1,2
    206c:	00200613          	li	a2,2
    2070:	00170713          	add	a4,a4,1
    2074:	00c42223          	sw	a2,4(s0)
    2078:	0a912423          	sw	s1,168(sp)
    207c:	0ae12223          	sw	a4,164(sp)
    2080:	00700613          	li	a2,7
    2084:	00840413          	add	s0,s0,8
    2088:	5ce644e3          	blt	a2,a4,2e50 <_vfprintf_r+0x108c>
    208c:	08000713          	li	a4,128
    2090:	3aef80e3          	beq	t6,a4,2c30 <_vfprintf_r+0xe6c>
    2094:	41a30b33          	sub	s6,t1,s10
    2098:	4b604ae3          	bgtz	s6,2d4c <_vfprintf_r+0xf88>
    209c:	100ef713          	and	a4,t4,256
    20a0:	1a0710e3          	bnez	a4,2a40 <_vfprintf_r+0xc7c>
    20a4:	0a412783          	lw	a5,164(sp)
    20a8:	01a484b3          	add	s1,s1,s10
    20ac:	01842023          	sw	s8,0(s0)
    20b0:	00178793          	add	a5,a5,1
    20b4:	01a42223          	sw	s10,4(s0)
    20b8:	0a912423          	sw	s1,168(sp)
    20bc:	0af12223          	sw	a5,164(sp)
    20c0:	00700713          	li	a4,7
    20c4:	58f74c63          	blt	a4,a5,265c <_vfprintf_r+0x898>
    20c8:	00840413          	add	s0,s0,8
    20cc:	004eff13          	and	t5,t4,4
    20d0:	000f0663          	beqz	t5,20dc <_vfprintf_r+0x318>
    20d4:	419b8d33          	sub	s10,s7,s9
    20d8:	5ba04ce3          	bgtz	s10,2e90 <_vfprintf_r+0x10cc>
    20dc:	000b8e93          	mv	t4,s7
    20e0:	019bd463          	bge	s7,s9,20e8 <_vfprintf_r+0x324>
    20e4:	000c8e93          	mv	t4,s9
    20e8:	00c12783          	lw	a5,12(sp)
    20ec:	01d787b3          	add	a5,a5,t4
    20f0:	00f12623          	sw	a5,12(sp)
    20f4:	18049663          	bnez	s1,2280 <_vfprintf_r+0x4bc>
    20f8:	01012783          	lw	a5,16(sp)
    20fc:	0a012223          	sw	zero,164(sp)
    2100:	00078863          	beqz	a5,2110 <_vfprintf_r+0x34c>
    2104:	01012583          	lw	a1,16(sp)
    2108:	00098513          	mv	a0,s3
    210c:	9b4ff0ef          	jal	12c0 <_free_r>
    2110:	0ac10413          	add	s0,sp,172
    2114:	00090c13          	mv	s8,s2
    2118:	df1ff06f          	j	1f08 <_vfprintf_r+0x144>
    211c:	00812403          	lw	s0,8(sp)
    2120:	00098513          	mv	a0,s3
    2124:	00f12623          	sw	a5,12(sp)
    2128:	00040593          	mv	a1,s0
    212c:	118050ef          	jal	7244 <__swsetup_r>
    2130:	00050463          	beqz	a0,2138 <_vfprintf_r+0x374>
    2134:	5600206f          	j	4694 <_vfprintf_r+0x28d0>
    2138:	00c41703          	lh	a4,12(s0)
    213c:	00a00613          	li	a2,10
    2140:	00c12783          	lw	a5,12(sp)
    2144:	01a77693          	and	a3,a4,26
    2148:	d4c698e3          	bne	a3,a2,1e98 <_vfprintf_r+0xd4>
    214c:	00812603          	lw	a2,8(sp)
    2150:	00e61683          	lh	a3,14(a2)
    2154:	d406c2e3          	bltz	a3,1e98 <_vfprintf_r+0xd4>
    2158:	06462683          	lw	a3,100(a2)
    215c:	0016f693          	and	a3,a3,1
    2160:	00069863          	bnez	a3,2170 <_vfprintf_r+0x3ac>
    2164:	20077713          	and	a4,a4,512
    2168:	00071463          	bnez	a4,2170 <_vfprintf_r+0x3ac>
    216c:	53d0106f          	j	3ea8 <_vfprintf_r+0x20e4>
    2170:	01412683          	lw	a3,20(sp)
    2174:	00812583          	lw	a1,8(sp)
    2178:	00098513          	mv	a0,s3
    217c:	00078613          	mv	a2,a5
    2180:	0e5020ef          	jal	4a64 <__sbprintf>
    2184:	18c12083          	lw	ra,396(sp)
    2188:	18812403          	lw	s0,392(sp)
    218c:	00a12623          	sw	a0,12(sp)
    2190:	00c12503          	lw	a0,12(sp)
    2194:	17c12983          	lw	s3,380(sp)
    2198:	19010113          	add	sp,sp,400
    219c:	00008067          	ret
    21a0:	00098513          	mv	a0,s3
    21a4:	58c050ef          	jal	7730 <_localeconv_r>
    21a8:	00452783          	lw	a5,4(a0)
    21ac:	00078513          	mv	a0,a5
    21b0:	04f12423          	sw	a5,72(sp)
    21b4:	f3dfe0ef          	jal	10f0 <strlen>
    21b8:	00050793          	mv	a5,a0
    21bc:	00098513          	mv	a0,s3
    21c0:	00078c93          	mv	s9,a5
    21c4:	04f12623          	sw	a5,76(sp)
    21c8:	568050ef          	jal	7730 <_localeconv_r>
    21cc:	00852703          	lw	a4,8(a0)
    21d0:	02e12e23          	sw	a4,60(sp)
    21d4:	000c8463          	beqz	s9,21dc <_vfprintf_r+0x418>
    21d8:	1ec0106f          	j	33c4 <_vfprintf_r+0x1600>
    21dc:	00094e03          	lbu	t3,0(s2)
    21e0:	d95ff06f          	j	1f74 <_vfprintf_r+0x1b0>
    21e4:	00800613          	li	a2,8
    21e8:	00000593          	li	a1,0
    21ec:	09010513          	add	a0,sp,144
    21f0:	c81fe0ef          	jal	e70 <memset>
    21f4:	00100513          	li	a0,1
    21f8:	00a90933          	add	s2,s2,a0
    21fc:	d11ff06f          	j	1f0c <_vfprintf_r+0x148>
    2200:	00050493          	mv	s1,a0
    2204:	41890cb3          	sub	s9,s2,s8
    2208:	05890063          	beq	s2,s8,2248 <_vfprintf_r+0x484>
    220c:	0a812683          	lw	a3,168(sp)
    2210:	0a412703          	lw	a4,164(sp)
    2214:	01842023          	sw	s8,0(s0)
    2218:	019686b3          	add	a3,a3,s9
    221c:	00170713          	add	a4,a4,1
    2220:	01942223          	sw	s9,4(s0)
    2224:	0ad12423          	sw	a3,168(sp)
    2228:	0ae12223          	sw	a4,164(sp)
    222c:	00700693          	li	a3,7
    2230:	00840413          	add	s0,s0,8
    2234:	02e6c863          	blt	a3,a4,2264 <_vfprintf_r+0x4a0>
    2238:	00c12783          	lw	a5,12(sp)
    223c:	019787b3          	add	a5,a5,s9
    2240:	00f12623          	sw	a5,12(sp)
    2244:	d00496e3          	bnez	s1,1f50 <_vfprintf_r+0x18c>
    2248:	0a812783          	lw	a5,168(sp)
    224c:	00078463          	beqz	a5,2254 <_vfprintf_r+0x490>
    2250:	4090106f          	j	3e58 <_vfprintf_r+0x2094>
    2254:	00812783          	lw	a5,8(sp)
    2258:	0a012223          	sw	zero,164(sp)
    225c:	00c79783          	lh	a5,12(a5)
    2260:	0500006f          	j	22b0 <_vfprintf_r+0x4ec>
    2264:	00812583          	lw	a1,8(sp)
    2268:	0a010613          	add	a2,sp,160
    226c:	00098513          	mv	a0,s3
    2270:	211020ef          	jal	4c80 <__sprint_r>
    2274:	02051a63          	bnez	a0,22a8 <_vfprintf_r+0x4e4>
    2278:	0ac10413          	add	s0,sp,172
    227c:	fbdff06f          	j	2238 <_vfprintf_r+0x474>
    2280:	00812583          	lw	a1,8(sp)
    2284:	0a010613          	add	a2,sp,160
    2288:	00098513          	mv	a0,s3
    228c:	1f5020ef          	jal	4c80 <__sprint_r>
    2290:	e60504e3          	beqz	a0,20f8 <_vfprintf_r+0x334>
    2294:	01012283          	lw	t0,16(sp)
    2298:	00028863          	beqz	t0,22a8 <_vfprintf_r+0x4e4>
    229c:	00028593          	mv	a1,t0
    22a0:	00098513          	mv	a0,s3
    22a4:	81cff0ef          	jal	12c0 <_free_r>
    22a8:	00812783          	lw	a5,8(sp)
    22ac:	00c79783          	lh	a5,12(a5)
    22b0:	00812703          	lw	a4,8(sp)
    22b4:	06472703          	lw	a4,100(a4)
    22b8:	00177713          	and	a4,a4,1
    22bc:	3c070463          	beqz	a4,2684 <_vfprintf_r+0x8c0>
    22c0:	0407f793          	and	a5,a5,64
    22c4:	18412483          	lw	s1,388(sp)
    22c8:	18012903          	lw	s2,384(sp)
    22cc:	17812a03          	lw	s4,376(sp)
    22d0:	17412a83          	lw	s5,372(sp)
    22d4:	17012b03          	lw	s6,368(sp)
    22d8:	16c12b83          	lw	s7,364(sp)
    22dc:	16812c03          	lw	s8,360(sp)
    22e0:	16412c83          	lw	s9,356(sp)
    22e4:	16012d03          	lw	s10,352(sp)
    22e8:	15c12d83          	lw	s11,348(sp)
    22ec:	00078463          	beqz	a5,22f4 <_vfprintf_r+0x530>
    22f0:	3d00206f          	j	46c0 <_vfprintf_r+0x28fc>
    22f4:	18c12083          	lw	ra,396(sp)
    22f8:	18812403          	lw	s0,392(sp)
    22fc:	00c12503          	lw	a0,12(sp)
    2300:	17c12983          	lw	s3,380(sp)
    2304:	19010113          	add	sp,sp,400
    2308:	00008067          	ret
    230c:	008a7713          	and	a4,s4,8
    2310:	000a0e93          	mv	t4,s4
    2314:	000b0313          	mv	t1,s6
    2318:	00070463          	beqz	a4,2320 <_vfprintf_r+0x55c>
    231c:	0200106f          	j	333c <_vfprintf_r+0x1578>
    2320:	01412783          	lw	a5,20(sp)
    2324:	00778b13          	add	s6,a5,7
    2328:	ff8b7b13          	and	s6,s6,-8
    232c:	000b2783          	lw	a5,0(s6)
    2330:	02f12423          	sw	a5,40(sp)
    2334:	004b2783          	lw	a5,4(s6)
    2338:	02f12623          	sw	a5,44(sp)
    233c:	008b0793          	add	a5,s6,8
    2340:	00f12a23          	sw	a5,20(sp)
    2344:	02c12a03          	lw	s4,44(sp)
    2348:	7fffe717          	auipc	a4,0x7fffe
    234c:	35870713          	add	a4,a4,856 # 800006a0 <__global_locale+0x16c>
    2350:	00072c83          	lw	s9,0(a4)
    2354:	00472d03          	lw	s10,4(a4)
    2358:	02812b03          	lw	s6,40(sp)
    235c:	001a1493          	sll	s1,s4,0x1
    2360:	0014d493          	srl	s1,s1,0x1
    2364:	000b0513          	mv	a0,s6
    2368:	00048593          	mv	a1,s1
    236c:	000c8613          	mv	a2,s9
    2370:	000d0693          	mv	a3,s10
    2374:	02612223          	sw	t1,36(sp)
    2378:	03c12023          	sw	t3,32(sp)
    237c:	01d12823          	sw	t4,16(sp)
    2380:	1700c0ef          	jal	e4f0 <__unorddf2>
    2384:	01012e83          	lw	t4,16(sp)
    2388:	02012e03          	lw	t3,32(sp)
    238c:	02412303          	lw	t1,36(sp)
    2390:	00050463          	beqz	a0,2398 <_vfprintf_r+0x5d4>
    2394:	4080106f          	j	379c <_vfprintf_r+0x19d8>
    2398:	000b0513          	mv	a0,s6
    239c:	00048593          	mv	a1,s1
    23a0:	000c8613          	mv	a2,s9
    23a4:	000d0693          	mv	a3,s10
    23a8:	7a90a0ef          	jal	d350 <__ledf2>
    23ac:	01012e83          	lw	t4,16(sp)
    23b0:	02012e03          	lw	t3,32(sp)
    23b4:	02412303          	lw	t1,36(sp)
    23b8:	00a04463          	bgtz	a0,23c0 <_vfprintf_r+0x5fc>
    23bc:	3e00106f          	j	379c <_vfprintf_r+0x19d8>
    23c0:	000b0513          	mv	a0,s6
    23c4:	000a0593          	mv	a1,s4
    23c8:	00000613          	li	a2,0
    23cc:	00000693          	li	a3,0
    23d0:	7810a0ef          	jal	d350 <__ledf2>
    23d4:	01012e83          	lw	t4,16(sp)
    23d8:	02012e03          	lw	t3,32(sp)
    23dc:	00055463          	bgez	a0,23e4 <_vfprintf_r+0x620>
    23e0:	6650106f          	j	4244 <_vfprintf_r+0x2480>
    23e4:	07714603          	lbu	a2,119(sp)
    23e8:	04700713          	li	a4,71
    23ec:	0000dc17          	auipc	s8,0xd
    23f0:	b94c0c13          	add	s8,s8,-1132 # ef80 <__fini_array_end+0x268>
    23f4:	01c74663          	blt	a4,t3,2400 <_vfprintf_r+0x63c>
    23f8:	0000dc17          	auipc	s8,0xd
    23fc:	b84c0c13          	add	s8,s8,-1148 # ef7c <__fini_array_end+0x264>
    2400:	00012823          	sw	zero,16(sp)
    2404:	02012223          	sw	zero,36(sp)
    2408:	02012023          	sw	zero,32(sp)
    240c:	f7fefe93          	and	t4,t4,-129
    2410:	00300c93          	li	s9,3
    2414:	00300d13          	li	s10,3
    2418:	00000313          	li	t1,0
    241c:	00000a13          	li	s4,0
    2420:	be0602e3          	beqz	a2,2004 <_vfprintf_r+0x240>
    2424:	001c8c93          	add	s9,s9,1
    2428:	bddff06f          	j	2004 <_vfprintf_r+0x240>
    242c:	01000593          	li	a1,16
    2430:	0a412603          	lw	a2,164(sp)
    2434:	0000db17          	auipc	s6,0xd
    2438:	050b0b13          	add	s6,s6,80 # f484 <blanks.1>
    243c:	0ae5dc63          	bge	a1,a4,24f4 <_vfprintf_r+0x730>
    2440:	00040793          	mv	a5,s0
    2444:	00048693          	mv	a3,s1
    2448:	01000893          	li	a7,16
    244c:	000b0493          	mv	s1,s6
    2450:	00700393          	li	t2,7
    2454:	000a0b13          	mv	s6,s4
    2458:	04512223          	sw	t0,68(sp)
    245c:	05f12823          	sw	t6,80(sp)
    2460:	05d12a23          	sw	t4,84(sp)
    2464:	05c12c23          	sw	t3,88(sp)
    2468:	00070413          	mv	s0,a4
    246c:	00030a13          	mv	s4,t1
    2470:	00c0006f          	j	247c <_vfprintf_r+0x6b8>
    2474:	ff040413          	add	s0,s0,-16
    2478:	0488da63          	bge	a7,s0,24cc <_vfprintf_r+0x708>
    247c:	01068693          	add	a3,a3,16
    2480:	00160613          	add	a2,a2,1
    2484:	0097a023          	sw	s1,0(a5)
    2488:	0117a223          	sw	a7,4(a5)
    248c:	0ad12423          	sw	a3,168(sp)
    2490:	0ac12223          	sw	a2,164(sp)
    2494:	00878793          	add	a5,a5,8
    2498:	fcc3dee3          	bge	t2,a2,2474 <_vfprintf_r+0x6b0>
    249c:	00812583          	lw	a1,8(sp)
    24a0:	0a010613          	add	a2,sp,160
    24a4:	00098513          	mv	a0,s3
    24a8:	7d8020ef          	jal	4c80 <__sprint_r>
    24ac:	de0514e3          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    24b0:	01000893          	li	a7,16
    24b4:	ff040413          	add	s0,s0,-16
    24b8:	0a812683          	lw	a3,168(sp)
    24bc:	0a412603          	lw	a2,164(sp)
    24c0:	0ac10793          	add	a5,sp,172
    24c4:	00700393          	li	t2,7
    24c8:	fa88cae3          	blt	a7,s0,247c <_vfprintf_r+0x6b8>
    24cc:	04412283          	lw	t0,68(sp)
    24d0:	05012f83          	lw	t6,80(sp)
    24d4:	05412e83          	lw	t4,84(sp)
    24d8:	05812e03          	lw	t3,88(sp)
    24dc:	000a0313          	mv	t1,s4
    24e0:	00040713          	mv	a4,s0
    24e4:	000b0a13          	mv	s4,s6
    24e8:	00078413          	mv	s0,a5
    24ec:	00048b13          	mv	s6,s1
    24f0:	00068493          	mv	s1,a3
    24f4:	00e484b3          	add	s1,s1,a4
    24f8:	00160613          	add	a2,a2,1
    24fc:	00e42223          	sw	a4,4(s0)
    2500:	01642023          	sw	s6,0(s0)
    2504:	0a912423          	sw	s1,168(sp)
    2508:	0ac12223          	sw	a2,164(sp)
    250c:	00700713          	li	a4,7
    2510:	00c75463          	bge	a4,a2,2518 <_vfprintf_r+0x754>
    2514:	2380106f          	j	374c <_vfprintf_r+0x1988>
    2518:	07714603          	lbu	a2,119(sp)
    251c:	00840413          	add	s0,s0,8
    2520:	b05ff06f          	j	2024 <_vfprintf_r+0x260>
    2524:	00812583          	lw	a1,8(sp)
    2528:	0a010613          	add	a2,sp,160
    252c:	00098513          	mv	a0,s3
    2530:	04612e23          	sw	t1,92(sp)
    2534:	05c12c23          	sw	t3,88(sp)
    2538:	05d12a23          	sw	t4,84(sp)
    253c:	05f12823          	sw	t6,80(sp)
    2540:	04512223          	sw	t0,68(sp)
    2544:	73c020ef          	jal	4c80 <__sprint_r>
    2548:	d40516e3          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    254c:	0a812483          	lw	s1,168(sp)
    2550:	05c12303          	lw	t1,92(sp)
    2554:	05812e03          	lw	t3,88(sp)
    2558:	05412e83          	lw	t4,84(sp)
    255c:	05012f83          	lw	t6,80(sp)
    2560:	04412283          	lw	t0,68(sp)
    2564:	0ac10413          	add	s0,sp,172
    2568:	af1ff06f          	j	2058 <_vfprintf_r+0x294>
    256c:	0a412d03          	lw	s10,164(sp)
    2570:	01812783          	lw	a5,24(sp)
    2574:	00100693          	li	a3,1
    2578:	01842023          	sw	s8,0(s0)
    257c:	00148493          	add	s1,s1,1
    2580:	001d0d13          	add	s10,s10,1
    2584:	00840b13          	add	s6,s0,8
    2588:	32f6d0e3          	bge	a3,a5,30a8 <_vfprintf_r+0x12e4>
    258c:	00100693          	li	a3,1
    2590:	00d42223          	sw	a3,4(s0)
    2594:	0a912423          	sw	s1,168(sp)
    2598:	0ba12223          	sw	s10,164(sp)
    259c:	00700693          	li	a3,7
    25a0:	01a6d463          	bge	a3,s10,25a8 <_vfprintf_r+0x7e4>
    25a4:	0680106f          	j	360c <_vfprintf_r+0x1848>
    25a8:	03012783          	lw	a5,48(sp)
    25ac:	03412703          	lw	a4,52(sp)
    25b0:	001d0d13          	add	s10,s10,1
    25b4:	00f484b3          	add	s1,s1,a5
    25b8:	00eb2023          	sw	a4,0(s6)
    25bc:	00fb2223          	sw	a5,4(s6)
    25c0:	0a912423          	sw	s1,168(sp)
    25c4:	0ba12223          	sw	s10,164(sp)
    25c8:	00700693          	li	a3,7
    25cc:	008b0b13          	add	s6,s6,8
    25d0:	01a6d463          	bge	a3,s10,25d8 <_vfprintf_r+0x814>
    25d4:	0680106f          	j	363c <_vfprintf_r+0x1878>
    25d8:	02812603          	lw	a2,40(sp)
    25dc:	02c12683          	lw	a3,44(sp)
    25e0:	01812783          	lw	a5,24(sp)
    25e4:	00060513          	mv	a0,a2
    25e8:	00068593          	mv	a1,a3
    25ec:	00000613          	li	a2,0
    25f0:	00000693          	li	a3,0
    25f4:	03d12023          	sw	t4,32(sp)
    25f8:	fff78413          	add	s0,a5,-1
    25fc:	3c90a0ef          	jal	d1c4 <__eqdf2>
    2600:	02012e83          	lw	t4,32(sp)
    2604:	2e0506e3          	beqz	a0,30f0 <_vfprintf_r+0x132c>
    2608:	001c0793          	add	a5,s8,1
    260c:	001d0d13          	add	s10,s10,1
    2610:	008484b3          	add	s1,s1,s0
    2614:	00fb2023          	sw	a5,0(s6)
    2618:	008b2223          	sw	s0,4(s6)
    261c:	0a912423          	sw	s1,168(sp)
    2620:	0ba12223          	sw	s10,164(sp)
    2624:	00700793          	li	a5,7
    2628:	008b0b13          	add	s6,s6,8
    262c:	29a7cce3          	blt	a5,s10,30c4 <_vfprintf_r+0x1300>
    2630:	04012703          	lw	a4,64(sp)
    2634:	08810793          	add	a5,sp,136
    2638:	001d0d13          	add	s10,s10,1
    263c:	009704b3          	add	s1,a4,s1
    2640:	00fb2023          	sw	a5,0(s6)
    2644:	00eb2223          	sw	a4,4(s6)
    2648:	0a912423          	sw	s1,168(sp)
    264c:	0ba12223          	sw	s10,164(sp)
    2650:	00700793          	li	a5,7
    2654:	008b0413          	add	s0,s6,8
    2658:	a7a7dae3          	bge	a5,s10,20cc <_vfprintf_r+0x308>
    265c:	00812583          	lw	a1,8(sp)
    2660:	0a010613          	add	a2,sp,160
    2664:	00098513          	mv	a0,s3
    2668:	03d12023          	sw	t4,32(sp)
    266c:	614020ef          	jal	4c80 <__sprint_r>
    2670:	c20512e3          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    2674:	0a812483          	lw	s1,168(sp)
    2678:	02012e83          	lw	t4,32(sp)
    267c:	0ac10413          	add	s0,sp,172
    2680:	a4dff06f          	j	20cc <_vfprintf_r+0x308>
    2684:	2007f713          	and	a4,a5,512
    2688:	c2071ce3          	bnez	a4,22c0 <_vfprintf_r+0x4fc>
    268c:	00812403          	lw	s0,8(sp)
    2690:	05842503          	lw	a0,88(s0)
    2694:	fd8fe0ef          	jal	e6c <__retarget_lock_release_recursive>
    2698:	00c41783          	lh	a5,12(s0)
    269c:	c25ff06f          	j	22c0 <_vfprintf_r+0x4fc>
    26a0:	00094e03          	lbu	t3,0(s2)
    26a4:	020a6a13          	or	s4,s4,32
    26a8:	8cdff06f          	j	1f74 <_vfprintf_r+0x1b0>
    26ac:	01412703          	lw	a4,20(sp)
    26b0:	04300793          	li	a5,67
    26b4:	000a0e93          	mv	t4,s4
    26b8:	00470493          	add	s1,a4,4
    26bc:	64fe08e3          	beq	t3,a5,350c <_vfprintf_r+0x1748>
    26c0:	010a7793          	and	a5,s4,16
    26c4:	640794e3          	bnez	a5,350c <_vfprintf_r+0x1748>
    26c8:	01412783          	lw	a5,20(sp)
    26cc:	00100c93          	li	s9,1
    26d0:	00100d13          	li	s10,1
    26d4:	0007a783          	lw	a5,0(a5)
    26d8:	0ec10c13          	add	s8,sp,236
    26dc:	0ef10623          	sb	a5,236(sp)
    26e0:	06010ba3          	sb	zero,119(sp)
    26e4:	00912a23          	sw	s1,20(sp)
    26e8:	00000613          	li	a2,0
    26ec:	00012823          	sw	zero,16(sp)
    26f0:	00000313          	li	t1,0
    26f4:	02012223          	sw	zero,36(sp)
    26f8:	02012023          	sw	zero,32(sp)
    26fc:	00000a13          	li	s4,0
    2700:	905ff06f          	j	2004 <_vfprintf_r+0x240>
    2704:	01412783          	lw	a5,20(sp)
    2708:	06010ba3          	sb	zero,119(sp)
    270c:	000b0313          	mv	t1,s6
    2710:	0007ac03          	lw	s8,0(a5)
    2714:	000a0e93          	mv	t4,s4
    2718:	00478b13          	add	s6,a5,4
    271c:	5a0c0ce3          	beqz	s8,34d4 <_vfprintf_r+0x1710>
    2720:	05300713          	li	a4,83
    2724:	00ee1463          	bne	t3,a4,272c <_vfprintf_r+0x968>
    2728:	1d00106f          	j	38f8 <_vfprintf_r+0x1b34>
    272c:	010a7a13          	and	s4,s4,16
    2730:	000a0463          	beqz	s4,2738 <_vfprintf_r+0x974>
    2734:	1c40106f          	j	38f8 <_vfprintf_r+0x1b34>
    2738:	00035463          	bgez	t1,2740 <_vfprintf_r+0x97c>
    273c:	6d40106f          	j	3e10 <_vfprintf_r+0x204c>
    2740:	00030613          	mv	a2,t1
    2744:	00000593          	li	a1,0
    2748:	000c0513          	mv	a0,s8
    274c:	03d12023          	sw	t4,32(sp)
    2750:	00612a23          	sw	t1,20(sp)
    2754:	661040ef          	jal	75b4 <memchr>
    2758:	00a12823          	sw	a0,16(sp)
    275c:	01412303          	lw	t1,20(sp)
    2760:	02012e83          	lw	t4,32(sp)
    2764:	00051463          	bnez	a0,276c <_vfprintf_r+0x9a8>
    2768:	1780206f          	j	48e0 <_vfprintf_r+0x2b1c>
    276c:	01012783          	lw	a5,16(sp)
    2770:	07714603          	lbu	a2,119(sp)
    2774:	01612a23          	sw	s6,20(sp)
    2778:	41878d33          	sub	s10,a5,s8
    277c:	fffd4813          	not	a6,s10
    2780:	41f85813          	sra	a6,a6,0x1f
    2784:	02012223          	sw	zero,36(sp)
    2788:	02012023          	sw	zero,32(sp)
    278c:	00012823          	sw	zero,16(sp)
    2790:	010d7cb3          	and	s9,s10,a6
    2794:	00000313          	li	t1,0
    2798:	07300e13          	li	t3,115
    279c:	860604e3          	beqz	a2,2004 <_vfprintf_r+0x240>
    27a0:	c85ff06f          	j	2424 <_vfprintf_r+0x660>
    27a4:	01412783          	lw	a5,20(sp)
    27a8:	0007ab83          	lw	s7,0(a5)
    27ac:	00478793          	add	a5,a5,4
    27b0:	2a0bdae3          	bgez	s7,3264 <_vfprintf_r+0x14a0>
    27b4:	41700bb3          	neg	s7,s7
    27b8:	00f12a23          	sw	a5,20(sp)
    27bc:	00094e03          	lbu	t3,0(s2)
    27c0:	004a6a13          	or	s4,s4,4
    27c4:	fb0ff06f          	j	1f74 <_vfprintf_r+0x1b0>
    27c8:	02b00793          	li	a5,43
    27cc:	00094e03          	lbu	t3,0(s2)
    27d0:	06f10ba3          	sb	a5,119(sp)
    27d4:	fa0ff06f          	j	1f74 <_vfprintf_r+0x1b0>
    27d8:	000b0313          	mv	t1,s6
    27dc:	010a6613          	or	a2,s4,16
    27e0:	02067793          	and	a5,a2,32
    27e4:	1c0780e3          	beqz	a5,31a4 <_vfprintf_r+0x13e0>
    27e8:	01412783          	lw	a5,20(sp)
    27ec:	00778b13          	add	s6,a5,7
    27f0:	ff8b7b13          	and	s6,s6,-8
    27f4:	000b2d03          	lw	s10,0(s6)
    27f8:	004b2c83          	lw	s9,4(s6)
    27fc:	008b0793          	add	a5,s6,8
    2800:	00f12a23          	sw	a5,20(sp)
    2804:	00100793          	li	a5,1
    2808:	00000713          	li	a4,0
    280c:	06e10ba3          	sb	a4,119(sp)
    2810:	34034c63          	bltz	t1,2b68 <_vfprintf_r+0xda4>
    2814:	019d6733          	or	a4,s10,s9
    2818:	f7f67e93          	and	t4,a2,-129
    281c:	34071463          	bnez	a4,2b64 <_vfprintf_r+0xda0>
    2820:	3a031a63          	bnez	t1,2bd4 <_vfprintf_r+0xe10>
    2824:	5c079ee3          	bnez	a5,3600 <_vfprintf_r+0x183c>
    2828:	00167d13          	and	s10,a2,1
    282c:	15010c13          	add	s8,sp,336
    2830:	2c0d10e3          	bnez	s10,32f0 <_vfprintf_r+0x152c>
    2834:	07714603          	lbu	a2,119(sp)
    2838:	00030c93          	mv	s9,t1
    283c:	01a35463          	bge	t1,s10,2844 <_vfprintf_r+0xa80>
    2840:	000d0c93          	mv	s9,s10
    2844:	00012823          	sw	zero,16(sp)
    2848:	02012223          	sw	zero,36(sp)
    284c:	02012023          	sw	zero,32(sp)
    2850:	00000a13          	li	s4,0
    2854:	fa060863          	beqz	a2,2004 <_vfprintf_r+0x240>
    2858:	bcdff06f          	j	2424 <_vfprintf_r+0x660>
    285c:	00094e03          	lbu	t3,0(s2)
    2860:	080a6a13          	or	s4,s4,128
    2864:	f10ff06f          	j	1f74 <_vfprintf_r+0x1b0>
    2868:	00094e03          	lbu	t3,0(s2)
    286c:	02a00793          	li	a5,42
    2870:	00190693          	add	a3,s2,1
    2874:	00fe1463          	bne	t3,a5,287c <_vfprintf_r+0xab8>
    2878:	1100206f          	j	4988 <_vfprintf_r+0x2bc4>
    287c:	fd0e0713          	add	a4,t3,-48
    2880:	00900793          	li	a5,9
    2884:	00000b13          	li	s6,0
    2888:	00900613          	li	a2,9
    288c:	02e7e463          	bltu	a5,a4,28b4 <_vfprintf_r+0xaf0>
    2890:	0006ce03          	lbu	t3,0(a3)
    2894:	002b1793          	sll	a5,s6,0x2
    2898:	016787b3          	add	a5,a5,s6
    289c:	00179793          	sll	a5,a5,0x1
    28a0:	00e78b33          	add	s6,a5,a4
    28a4:	fd0e0713          	add	a4,t3,-48
    28a8:	00168693          	add	a3,a3,1
    28ac:	fee672e3          	bgeu	a2,a4,2890 <_vfprintf_r+0xacc>
    28b0:	320b4ce3          	bltz	s6,33e8 <_vfprintf_r+0x1624>
    28b4:	00068913          	mv	s2,a3
    28b8:	ec0ff06f          	j	1f78 <_vfprintf_r+0x1b4>
    28bc:	00094e03          	lbu	t3,0(s2)
    28c0:	001a6a13          	or	s4,s4,1
    28c4:	eb0ff06f          	j	1f74 <_vfprintf_r+0x1b0>
    28c8:	07714783          	lbu	a5,119(sp)
    28cc:	00094e03          	lbu	t3,0(s2)
    28d0:	ea079263          	bnez	a5,1f74 <_vfprintf_r+0x1b0>
    28d4:	02000793          	li	a5,32
    28d8:	06f10ba3          	sb	a5,119(sp)
    28dc:	e98ff06f          	j	1f74 <_vfprintf_r+0x1b0>
    28e0:	00094e03          	lbu	t3,0(s2)
    28e4:	06c00793          	li	a5,108
    28e8:	3afe00e3          	beq	t3,a5,3488 <_vfprintf_r+0x16c4>
    28ec:	010a6a13          	or	s4,s4,16
    28f0:	e84ff06f          	j	1f74 <_vfprintf_r+0x1b0>
    28f4:	00094e03          	lbu	t3,0(s2)
    28f8:	008a6a13          	or	s4,s4,8
    28fc:	e78ff06f          	j	1f74 <_vfprintf_r+0x1b0>
    2900:	000b0313          	mv	t1,s6
    2904:	010a6e93          	or	t4,s4,16
    2908:	020ef793          	and	a5,t4,32
    290c:	0c0786e3          	beqz	a5,31d8 <_vfprintf_r+0x1414>
    2910:	01412783          	lw	a5,20(sp)
    2914:	00778b13          	add	s6,a5,7
    2918:	ff8b7b13          	and	s6,s6,-8
    291c:	004b2783          	lw	a5,4(s6)
    2920:	000b2d03          	lw	s10,0(s6)
    2924:	008b0713          	add	a4,s6,8
    2928:	00e12a23          	sw	a4,20(sp)
    292c:	00078c93          	mv	s9,a5
    2930:	0c07cee3          	bltz	a5,320c <_vfprintf_r+0x1448>
    2934:	000e8613          	mv	a2,t4
    2938:	02034263          	bltz	t1,295c <_vfprintf_r+0xb98>
    293c:	019d67b3          	or	a5,s10,s9
    2940:	f7fef613          	and	a2,t4,-129
    2944:	00079c63          	bnez	a5,295c <_vfprintf_r+0xb98>
    2948:	02031063          	bnez	t1,2968 <_vfprintf_r+0xba4>
    294c:	00000d13          	li	s10,0
    2950:	00060e93          	mv	t4,a2
    2954:	15010c13          	add	s8,sp,336
    2958:	eddff06f          	j	2834 <_vfprintf_r+0xa70>
    295c:	520c90e3          	bnez	s9,367c <_vfprintf_r+0x18b8>
    2960:	00900793          	li	a5,9
    2964:	51a7ece3          	bltu	a5,s10,367c <_vfprintf_r+0x18b8>
    2968:	030d0d13          	add	s10,s10,48
    296c:	15a107a3          	sb	s10,335(sp)
    2970:	00060e93          	mv	t4,a2
    2974:	00100d13          	li	s10,1
    2978:	14f10c13          	add	s8,sp,335
    297c:	eb9ff06f          	j	2834 <_vfprintf_r+0xa70>
    2980:	000b0313          	mv	t1,s6
    2984:	010a6e93          	or	t4,s4,16
    2988:	020ef793          	and	a5,t4,32
    298c:	7e078463          	beqz	a5,3174 <_vfprintf_r+0x13b0>
    2990:	01412783          	lw	a5,20(sp)
    2994:	00778b13          	add	s6,a5,7
    2998:	ff8b7b13          	and	s6,s6,-8
    299c:	000b2d03          	lw	s10,0(s6)
    29a0:	004b2c83          	lw	s9,4(s6)
    29a4:	008b0793          	add	a5,s6,8
    29a8:	00f12a23          	sw	a5,20(sp)
    29ac:	bffef613          	and	a2,t4,-1025
    29b0:	00000793          	li	a5,0
    29b4:	e55ff06f          	j	2808 <_vfprintf_r+0xa44>
    29b8:	00094e03          	lbu	t3,0(s2)
    29bc:	06800793          	li	a5,104
    29c0:	2cfe0ce3          	beq	t3,a5,3498 <_vfprintf_r+0x16d4>
    29c4:	040a6a13          	or	s4,s4,64
    29c8:	dacff06f          	j	1f74 <_vfprintf_r+0x1b0>
    29cc:	01412703          	lw	a4,20(sp)
    29d0:	000087b7          	lui	a5,0x8
    29d4:	83078793          	add	a5,a5,-2000 # 7830 <_read_r+0x38>
    29d8:	06f11c23          	sh	a5,120(sp)
    29dc:	00470793          	add	a5,a4,4
    29e0:	00f12a23          	sw	a5,20(sp)
    29e4:	0000c797          	auipc	a5,0xc
    29e8:	5a878793          	add	a5,a5,1448 # ef8c <__fini_array_end+0x274>
    29ec:	02f12c23          	sw	a5,56(sp)
    29f0:	00072d03          	lw	s10,0(a4)
    29f4:	000b0313          	mv	t1,s6
    29f8:	00000c93          	li	s9,0
    29fc:	002a6613          	or	a2,s4,2
    2a00:	00200793          	li	a5,2
    2a04:	07800e13          	li	t3,120
    2a08:	e01ff06f          	j	2808 <_vfprintf_r+0xa44>
    2a0c:	020a7793          	and	a5,s4,32
    2a10:	180784e3          	beqz	a5,3398 <_vfprintf_r+0x15d4>
    2a14:	01412783          	lw	a5,20(sp)
    2a18:	00c12683          	lw	a3,12(sp)
    2a1c:	0007a783          	lw	a5,0(a5)
    2a20:	41f6d713          	sra	a4,a3,0x1f
    2a24:	00d7a023          	sw	a3,0(a5)
    2a28:	00e7a223          	sw	a4,4(a5)
    2a2c:	01412783          	lw	a5,20(sp)
    2a30:	00090c13          	mv	s8,s2
    2a34:	00478793          	add	a5,a5,4
    2a38:	00f12a23          	sw	a5,20(sp)
    2a3c:	cccff06f          	j	1f08 <_vfprintf_r+0x144>
    2a40:	06500713          	li	a4,101
    2a44:	b3c754e3          	bge	a4,t3,256c <_vfprintf_r+0x7a8>
    2a48:	02812683          	lw	a3,40(sp)
    2a4c:	02c12703          	lw	a4,44(sp)
    2a50:	00000613          	li	a2,0
    2a54:	00068513          	mv	a0,a3
    2a58:	00070593          	mv	a1,a4
    2a5c:	00000693          	li	a3,0
    2a60:	05d12223          	sw	t4,68(sp)
    2a64:	7600a0ef          	jal	d1c4 <__eqdf2>
    2a68:	04412e83          	lw	t4,68(sp)
    2a6c:	4e051463          	bnez	a0,2f54 <_vfprintf_r+0x1190>
    2a70:	0a412783          	lw	a5,164(sp)
    2a74:	0000c717          	auipc	a4,0xc
    2a78:	54870713          	add	a4,a4,1352 # efbc <__fini_array_end+0x2a4>
    2a7c:	00e42023          	sw	a4,0(s0)
    2a80:	00148493          	add	s1,s1,1
    2a84:	00100713          	li	a4,1
    2a88:	00178793          	add	a5,a5,1
    2a8c:	00e42223          	sw	a4,4(s0)
    2a90:	0a912423          	sw	s1,168(sp)
    2a94:	0af12223          	sw	a5,164(sp)
    2a98:	00700713          	li	a4,7
    2a9c:	00840413          	add	s0,s0,8
    2aa0:	62f746e3          	blt	a4,a5,38cc <_vfprintf_r+0x1b08>
    2aa4:	07c12783          	lw	a5,124(sp)
    2aa8:	01812703          	lw	a4,24(sp)
    2aac:	78e7de63          	bge	a5,a4,3248 <_vfprintf_r+0x1484>
    2ab0:	03412783          	lw	a5,52(sp)
    2ab4:	03012703          	lw	a4,48(sp)
    2ab8:	00840413          	add	s0,s0,8
    2abc:	fef42c23          	sw	a5,-8(s0)
    2ac0:	0a412783          	lw	a5,164(sp)
    2ac4:	00e484b3          	add	s1,s1,a4
    2ac8:	fee42e23          	sw	a4,-4(s0)
    2acc:	00178793          	add	a5,a5,1
    2ad0:	0a912423          	sw	s1,168(sp)
    2ad4:	0af12223          	sw	a5,164(sp)
    2ad8:	00700713          	li	a4,7
    2adc:	1cf746e3          	blt	a4,a5,34a8 <_vfprintf_r+0x16e4>
    2ae0:	01812783          	lw	a5,24(sp)
    2ae4:	fff78d13          	add	s10,a5,-1
    2ae8:	dfa05263          	blez	s10,20cc <_vfprintf_r+0x308>
    2aec:	01000713          	li	a4,16
    2af0:	0a412783          	lw	a5,164(sp)
    2af4:	0000d297          	auipc	t0,0xd
    2af8:	98028293          	add	t0,t0,-1664 # f474 <zeroes.0>
    2afc:	77a752e3          	bge	a4,s10,3a60 <_vfprintf_r+0x1c9c>
    2b00:	00048713          	mv	a4,s1
    2b04:	01000c13          	li	s8,16
    2b08:	00700b13          	li	s6,7
    2b0c:	000e8493          	mv	s1,t4
    2b10:	00028a13          	mv	s4,t0
    2b14:	00c0006f          	j	2b20 <_vfprintf_r+0xd5c>
    2b18:	ff0d0d13          	add	s10,s10,-16
    2b1c:	73ac5ce3          	bge	s8,s10,3a54 <_vfprintf_r+0x1c90>
    2b20:	01070713          	add	a4,a4,16
    2b24:	00178793          	add	a5,a5,1
    2b28:	01442023          	sw	s4,0(s0)
    2b2c:	01842223          	sw	s8,4(s0)
    2b30:	0ae12423          	sw	a4,168(sp)
    2b34:	0af12223          	sw	a5,164(sp)
    2b38:	00840413          	add	s0,s0,8
    2b3c:	fcfb5ee3          	bge	s6,a5,2b18 <_vfprintf_r+0xd54>
    2b40:	00812583          	lw	a1,8(sp)
    2b44:	0a010613          	add	a2,sp,160
    2b48:	00098513          	mv	a0,s3
    2b4c:	134020ef          	jal	4c80 <__sprint_r>
    2b50:	f4051263          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    2b54:	0a812703          	lw	a4,168(sp)
    2b58:	0a412783          	lw	a5,164(sp)
    2b5c:	0ac10413          	add	s0,sp,172
    2b60:	fb9ff06f          	j	2b18 <_vfprintf_r+0xd54>
    2b64:	000e8613          	mv	a2,t4
    2b68:	00100713          	li	a4,1
    2b6c:	dee788e3          	beq	a5,a4,295c <_vfprintf_r+0xb98>
    2b70:	00200713          	li	a4,2
    2b74:	06e78c63          	beq	a5,a4,2bec <_vfprintf_r+0xe28>
    2b78:	15010c13          	add	s8,sp,336
    2b7c:	01dc9793          	sll	a5,s9,0x1d
    2b80:	007d7713          	and	a4,s10,7
    2b84:	003d5d13          	srl	s10,s10,0x3
    2b88:	03070713          	add	a4,a4,48
    2b8c:	01a7ed33          	or	s10,a5,s10
    2b90:	003cdc93          	srl	s9,s9,0x3
    2b94:	feec0fa3          	sb	a4,-1(s8)
    2b98:	019d67b3          	or	a5,s10,s9
    2b9c:	000c0593          	mv	a1,s8
    2ba0:	fffc0c13          	add	s8,s8,-1
    2ba4:	fc079ce3          	bnez	a5,2b7c <_vfprintf_r+0xdb8>
    2ba8:	00167693          	and	a3,a2,1
    2bac:	06068a63          	beqz	a3,2c20 <_vfprintf_r+0xe5c>
    2bb0:	03000693          	li	a3,48
    2bb4:	06d70663          	beq	a4,a3,2c20 <_vfprintf_r+0xe5c>
    2bb8:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x23a>
    2bbc:	15010793          	add	a5,sp,336
    2bc0:	fedc0fa3          	sb	a3,-1(s8)
    2bc4:	40b78d33          	sub	s10,a5,a1
    2bc8:	00060e93          	mv	t4,a2
    2bcc:	00058c13          	mv	s8,a1
    2bd0:	c65ff06f          	j	2834 <_vfprintf_r+0xa70>
    2bd4:	00100713          	li	a4,1
    2bd8:	00e79463          	bne	a5,a4,2be0 <_vfprintf_r+0xe1c>
    2bdc:	2b10106f          	j	468c <_vfprintf_r+0x28c8>
    2be0:	00200713          	li	a4,2
    2be4:	000e8613          	mv	a2,t4
    2be8:	f8e798e3          	bne	a5,a4,2b78 <_vfprintf_r+0xdb4>
    2bec:	03812683          	lw	a3,56(sp)
    2bf0:	15010c13          	add	s8,sp,336
    2bf4:	00fd7793          	and	a5,s10,15
    2bf8:	00f687b3          	add	a5,a3,a5
    2bfc:	0007c703          	lbu	a4,0(a5)
    2c00:	004d5d13          	srl	s10,s10,0x4
    2c04:	01cc9793          	sll	a5,s9,0x1c
    2c08:	01a7ed33          	or	s10,a5,s10
    2c0c:	004cdc93          	srl	s9,s9,0x4
    2c10:	feec0fa3          	sb	a4,-1(s8)
    2c14:	019d67b3          	or	a5,s10,s9
    2c18:	fffc0c13          	add	s8,s8,-1
    2c1c:	fc079ce3          	bnez	a5,2bf4 <_vfprintf_r+0xe30>
    2c20:	15010793          	add	a5,sp,336
    2c24:	41878d33          	sub	s10,a5,s8
    2c28:	00060e93          	mv	t4,a2
    2c2c:	c09ff06f          	j	2834 <_vfprintf_r+0xa70>
    2c30:	419b8b33          	sub	s6,s7,s9
    2c34:	c7605063          	blez	s6,2094 <_vfprintf_r+0x2d0>
    2c38:	01000593          	li	a1,16
    2c3c:	0a412603          	lw	a2,164(sp)
    2c40:	0000d297          	auipc	t0,0xd
    2c44:	83428293          	add	t0,t0,-1996 # f474 <zeroes.0>
    2c48:	0b65d463          	bge	a1,s6,2cf0 <_vfprintf_r+0xf2c>
    2c4c:	00040793          	mv	a5,s0
    2c50:	00048713          	mv	a4,s1
    2c54:	000b0413          	mv	s0,s6
    2c58:	01000893          	li	a7,16
    2c5c:	000a0b13          	mv	s6,s4
    2c60:	00700f93          	li	t6,7
    2c64:	05d12223          	sw	t4,68(sp)
    2c68:	05c12823          	sw	t3,80(sp)
    2c6c:	00030a13          	mv	s4,t1
    2c70:	00028493          	mv	s1,t0
    2c74:	00c0006f          	j	2c80 <_vfprintf_r+0xebc>
    2c78:	ff040413          	add	s0,s0,-16
    2c7c:	0488da63          	bge	a7,s0,2cd0 <_vfprintf_r+0xf0c>
    2c80:	01070713          	add	a4,a4,16
    2c84:	00160613          	add	a2,a2,1
    2c88:	0097a023          	sw	s1,0(a5)
    2c8c:	0117a223          	sw	a7,4(a5)
    2c90:	0ae12423          	sw	a4,168(sp)
    2c94:	0ac12223          	sw	a2,164(sp)
    2c98:	00878793          	add	a5,a5,8
    2c9c:	fccfdee3          	bge	t6,a2,2c78 <_vfprintf_r+0xeb4>
    2ca0:	00812583          	lw	a1,8(sp)
    2ca4:	0a010613          	add	a2,sp,160
    2ca8:	00098513          	mv	a0,s3
    2cac:	7d5010ef          	jal	4c80 <__sprint_r>
    2cb0:	de051263          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    2cb4:	01000893          	li	a7,16
    2cb8:	ff040413          	add	s0,s0,-16
    2cbc:	0a812703          	lw	a4,168(sp)
    2cc0:	0a412603          	lw	a2,164(sp)
    2cc4:	0ac10793          	add	a5,sp,172
    2cc8:	00700f93          	li	t6,7
    2ccc:	fa88cae3          	blt	a7,s0,2c80 <_vfprintf_r+0xebc>
    2cd0:	04412e83          	lw	t4,68(sp)
    2cd4:	05012e03          	lw	t3,80(sp)
    2cd8:	000a0313          	mv	t1,s4
    2cdc:	00048293          	mv	t0,s1
    2ce0:	000b0a13          	mv	s4,s6
    2ce4:	00070493          	mv	s1,a4
    2ce8:	00040b13          	mv	s6,s0
    2cec:	00078413          	mv	s0,a5
    2cf0:	016484b3          	add	s1,s1,s6
    2cf4:	00160613          	add	a2,a2,1
    2cf8:	00542023          	sw	t0,0(s0)
    2cfc:	01642223          	sw	s6,4(s0)
    2d00:	0a912423          	sw	s1,168(sp)
    2d04:	0ac12223          	sw	a2,164(sp)
    2d08:	00700713          	li	a4,7
    2d0c:	00840413          	add	s0,s0,8
    2d10:	b8c75263          	bge	a4,a2,2094 <_vfprintf_r+0x2d0>
    2d14:	00812583          	lw	a1,8(sp)
    2d18:	0a010613          	add	a2,sp,160
    2d1c:	00098513          	mv	a0,s3
    2d20:	04612a23          	sw	t1,84(sp)
    2d24:	05c12823          	sw	t3,80(sp)
    2d28:	05d12223          	sw	t4,68(sp)
    2d2c:	755010ef          	jal	4c80 <__sprint_r>
    2d30:	d6051263          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    2d34:	0a812483          	lw	s1,168(sp)
    2d38:	05412303          	lw	t1,84(sp)
    2d3c:	05012e03          	lw	t3,80(sp)
    2d40:	04412e83          	lw	t4,68(sp)
    2d44:	0ac10413          	add	s0,sp,172
    2d48:	b4cff06f          	j	2094 <_vfprintf_r+0x2d0>
    2d4c:	01000713          	li	a4,16
    2d50:	0a412603          	lw	a2,164(sp)
    2d54:	0000c297          	auipc	t0,0xc
    2d58:	72028293          	add	t0,t0,1824 # f474 <zeroes.0>
    2d5c:	0b675063          	bge	a4,s6,2dfc <_vfprintf_r+0x1038>
    2d60:	00040793          	mv	a5,s0
    2d64:	00048693          	mv	a3,s1
    2d68:	000b0413          	mv	s0,s6
    2d6c:	01000713          	li	a4,16
    2d70:	00700893          	li	a7,7
    2d74:	05d12223          	sw	t4,68(sp)
    2d78:	000e0493          	mv	s1,t3
    2d7c:	00028b13          	mv	s6,t0
    2d80:	00c0006f          	j	2d8c <_vfprintf_r+0xfc8>
    2d84:	ff040413          	add	s0,s0,-16
    2d88:	04875e63          	bge	a4,s0,2de4 <_vfprintf_r+0x1020>
    2d8c:	01068693          	add	a3,a3,16
    2d90:	00160613          	add	a2,a2,1
    2d94:	0000c597          	auipc	a1,0xc
    2d98:	6e058593          	add	a1,a1,1760 # f474 <zeroes.0>
    2d9c:	00b7a023          	sw	a1,0(a5)
    2da0:	00e7a223          	sw	a4,4(a5)
    2da4:	0ad12423          	sw	a3,168(sp)
    2da8:	0ac12223          	sw	a2,164(sp)
    2dac:	00878793          	add	a5,a5,8
    2db0:	fcc8dae3          	bge	a7,a2,2d84 <_vfprintf_r+0xfc0>
    2db4:	00812583          	lw	a1,8(sp)
    2db8:	0a010613          	add	a2,sp,160
    2dbc:	00098513          	mv	a0,s3
    2dc0:	6c1010ef          	jal	4c80 <__sprint_r>
    2dc4:	cc051863          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    2dc8:	01000713          	li	a4,16
    2dcc:	ff040413          	add	s0,s0,-16
    2dd0:	0a812683          	lw	a3,168(sp)
    2dd4:	0a412603          	lw	a2,164(sp)
    2dd8:	0ac10793          	add	a5,sp,172
    2ddc:	00700893          	li	a7,7
    2de0:	fa8746e3          	blt	a4,s0,2d8c <_vfprintf_r+0xfc8>
    2de4:	04412e83          	lw	t4,68(sp)
    2de8:	00048e13          	mv	t3,s1
    2dec:	000b0293          	mv	t0,s6
    2df0:	00068493          	mv	s1,a3
    2df4:	00040b13          	mv	s6,s0
    2df8:	00078413          	mv	s0,a5
    2dfc:	016484b3          	add	s1,s1,s6
    2e00:	00160613          	add	a2,a2,1
    2e04:	00542023          	sw	t0,0(s0)
    2e08:	01642223          	sw	s6,4(s0)
    2e0c:	0a912423          	sw	s1,168(sp)
    2e10:	0ac12223          	sw	a2,164(sp)
    2e14:	00700713          	li	a4,7
    2e18:	00840413          	add	s0,s0,8
    2e1c:	a8c75063          	bge	a4,a2,209c <_vfprintf_r+0x2d8>
    2e20:	00812583          	lw	a1,8(sp)
    2e24:	0a010613          	add	a2,sp,160
    2e28:	00098513          	mv	a0,s3
    2e2c:	05c12823          	sw	t3,80(sp)
    2e30:	05d12223          	sw	t4,68(sp)
    2e34:	64d010ef          	jal	4c80 <__sprint_r>
    2e38:	c4051e63          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    2e3c:	0a812483          	lw	s1,168(sp)
    2e40:	05012e03          	lw	t3,80(sp)
    2e44:	04412e83          	lw	t4,68(sp)
    2e48:	0ac10413          	add	s0,sp,172
    2e4c:	a50ff06f          	j	209c <_vfprintf_r+0x2d8>
    2e50:	00812583          	lw	a1,8(sp)
    2e54:	0a010613          	add	a2,sp,160
    2e58:	00098513          	mv	a0,s3
    2e5c:	04612c23          	sw	t1,88(sp)
    2e60:	05c12a23          	sw	t3,84(sp)
    2e64:	05d12823          	sw	t4,80(sp)
    2e68:	05f12223          	sw	t6,68(sp)
    2e6c:	615010ef          	jal	4c80 <__sprint_r>
    2e70:	c2051263          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    2e74:	0a812483          	lw	s1,168(sp)
    2e78:	05812303          	lw	t1,88(sp)
    2e7c:	05412e03          	lw	t3,84(sp)
    2e80:	05012e83          	lw	t4,80(sp)
    2e84:	04412f83          	lw	t6,68(sp)
    2e88:	0ac10413          	add	s0,sp,172
    2e8c:	a00ff06f          	j	208c <_vfprintf_r+0x2c8>
    2e90:	01000713          	li	a4,16
    2e94:	0a412783          	lw	a5,164(sp)
    2e98:	0000cb17          	auipc	s6,0xc
    2e9c:	5ecb0b13          	add	s6,s6,1516 # f484 <blanks.1>
    2ea0:	07a75c63          	bge	a4,s10,2f18 <_vfprintf_r+0x1154>
    2ea4:	000b0713          	mv	a4,s6
    2ea8:	01000c13          	li	s8,16
    2eac:	00090b13          	mv	s6,s2
    2eb0:	00700a13          	li	s4,7
    2eb4:	00070913          	mv	s2,a4
    2eb8:	00c0006f          	j	2ec4 <_vfprintf_r+0x1100>
    2ebc:	ff0d0d13          	add	s10,s10,-16
    2ec0:	05ac5663          	bge	s8,s10,2f0c <_vfprintf_r+0x1148>
    2ec4:	01048493          	add	s1,s1,16
    2ec8:	00178793          	add	a5,a5,1
    2ecc:	01242023          	sw	s2,0(s0)
    2ed0:	01842223          	sw	s8,4(s0)
    2ed4:	0a912423          	sw	s1,168(sp)
    2ed8:	0af12223          	sw	a5,164(sp)
    2edc:	00840413          	add	s0,s0,8
    2ee0:	fcfa5ee3          	bge	s4,a5,2ebc <_vfprintf_r+0x10f8>
    2ee4:	00812583          	lw	a1,8(sp)
    2ee8:	0a010613          	add	a2,sp,160
    2eec:	00098513          	mv	a0,s3
    2ef0:	591010ef          	jal	4c80 <__sprint_r>
    2ef4:	ba051063          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    2ef8:	ff0d0d13          	add	s10,s10,-16
    2efc:	0a812483          	lw	s1,168(sp)
    2f00:	0a412783          	lw	a5,164(sp)
    2f04:	0ac10413          	add	s0,sp,172
    2f08:	fbac4ee3          	blt	s8,s10,2ec4 <_vfprintf_r+0x1100>
    2f0c:	00090713          	mv	a4,s2
    2f10:	000b0913          	mv	s2,s6
    2f14:	00070b13          	mv	s6,a4
    2f18:	01a484b3          	add	s1,s1,s10
    2f1c:	00178793          	add	a5,a5,1
    2f20:	01642023          	sw	s6,0(s0)
    2f24:	01a42223          	sw	s10,4(s0)
    2f28:	0a912423          	sw	s1,168(sp)
    2f2c:	0af12223          	sw	a5,164(sp)
    2f30:	00700713          	li	a4,7
    2f34:	9af75463          	bge	a4,a5,20dc <_vfprintf_r+0x318>
    2f38:	00812583          	lw	a1,8(sp)
    2f3c:	0a010613          	add	a2,sp,160
    2f40:	00098513          	mv	a0,s3
    2f44:	53d010ef          	jal	4c80 <__sprint_r>
    2f48:	b4051663          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    2f4c:	0a812483          	lw	s1,168(sp)
    2f50:	98cff06f          	j	20dc <_vfprintf_r+0x318>
    2f54:	07c12683          	lw	a3,124(sp)
    2f58:	30d05c63          	blez	a3,3270 <_vfprintf_r+0x14ac>
    2f5c:	01812783          	lw	a5,24(sp)
    2f60:	000a0b13          	mv	s6,s4
    2f64:	0147d463          	bge	a5,s4,2f6c <_vfprintf_r+0x11a8>
    2f68:	00078b13          	mv	s6,a5
    2f6c:	03605863          	blez	s6,2f9c <_vfprintf_r+0x11d8>
    2f70:	0a412683          	lw	a3,164(sp)
    2f74:	016484b3          	add	s1,s1,s6
    2f78:	01842023          	sw	s8,0(s0)
    2f7c:	00168693          	add	a3,a3,1
    2f80:	01642223          	sw	s6,4(s0)
    2f84:	0a912423          	sw	s1,168(sp)
    2f88:	0ad12223          	sw	a3,164(sp)
    2f8c:	00700613          	li	a2,7
    2f90:	00840413          	add	s0,s0,8
    2f94:	00d65463          	bge	a2,a3,2f9c <_vfprintf_r+0x11d8>
    2f98:	5c40106f          	j	455c <_vfprintf_r+0x2798>
    2f9c:	fffb4693          	not	a3,s6
    2fa0:	41f6d693          	sra	a3,a3,0x1f
    2fa4:	00db7733          	and	a4,s6,a3
    2fa8:	40ea0b33          	sub	s6,s4,a4
    2fac:	35604ae3          	bgtz	s6,3b00 <_vfprintf_r+0x1d3c>
    2fb0:	400ef713          	and	a4,t4,1024
    2fb4:	014c0333          	add	t1,s8,s4
    2fb8:	00070463          	beqz	a4,2fc0 <_vfprintf_r+0x11fc>
    2fbc:	2980106f          	j	4254 <_vfprintf_r+0x2490>
    2fc0:	07c12d03          	lw	s10,124(sp)
    2fc4:	01812783          	lw	a5,24(sp)
    2fc8:	5afd4063          	blt	s10,a5,3568 <_vfprintf_r+0x17a4>
    2fcc:	001ef713          	and	a4,t4,1
    2fd0:	58071c63          	bnez	a4,3568 <_vfprintf_r+0x17a4>
    2fd4:	01812703          	lw	a4,24(sp)
    2fd8:	00ec07b3          	add	a5,s8,a4
    2fdc:	41a70d33          	sub	s10,a4,s10
    2fe0:	40678b33          	sub	s6,a5,t1
    2fe4:	016d5463          	bge	s10,s6,2fec <_vfprintf_r+0x1228>
    2fe8:	000d0b13          	mv	s6,s10
    2fec:	03605863          	blez	s6,301c <_vfprintf_r+0x1258>
    2ff0:	0a412703          	lw	a4,164(sp)
    2ff4:	016484b3          	add	s1,s1,s6
    2ff8:	00642023          	sw	t1,0(s0)
    2ffc:	00170713          	add	a4,a4,1
    3000:	01642223          	sw	s6,4(s0)
    3004:	0a912423          	sw	s1,168(sp)
    3008:	0ae12223          	sw	a4,164(sp)
    300c:	00700693          	li	a3,7
    3010:	00840413          	add	s0,s0,8
    3014:	00e6d463          	bge	a3,a4,301c <_vfprintf_r+0x1258>
    3018:	5880106f          	j	45a0 <_vfprintf_r+0x27dc>
    301c:	fffb4713          	not	a4,s6
    3020:	41f75713          	sra	a4,a4,0x1f
    3024:	00eb77b3          	and	a5,s6,a4
    3028:	40fd0d33          	sub	s10,s10,a5
    302c:	8ba05063          	blez	s10,20cc <_vfprintf_r+0x308>
    3030:	01000713          	li	a4,16
    3034:	0a412783          	lw	a5,164(sp)
    3038:	0000c297          	auipc	t0,0xc
    303c:	43c28293          	add	t0,t0,1084 # f474 <zeroes.0>
    3040:	23a750e3          	bge	a4,s10,3a60 <_vfprintf_r+0x1c9c>
    3044:	00048713          	mv	a4,s1
    3048:	01000c13          	li	s8,16
    304c:	00700b13          	li	s6,7
    3050:	000e8493          	mv	s1,t4
    3054:	00028a13          	mv	s4,t0
    3058:	00c0006f          	j	3064 <_vfprintf_r+0x12a0>
    305c:	ff0d0d13          	add	s10,s10,-16
    3060:	1fac5ae3          	bge	s8,s10,3a54 <_vfprintf_r+0x1c90>
    3064:	01070713          	add	a4,a4,16
    3068:	00178793          	add	a5,a5,1
    306c:	01442023          	sw	s4,0(s0)
    3070:	01842223          	sw	s8,4(s0)
    3074:	0ae12423          	sw	a4,168(sp)
    3078:	0af12223          	sw	a5,164(sp)
    307c:	00840413          	add	s0,s0,8
    3080:	fcfb5ee3          	bge	s6,a5,305c <_vfprintf_r+0x1298>
    3084:	00812583          	lw	a1,8(sp)
    3088:	0a010613          	add	a2,sp,160
    308c:	00098513          	mv	a0,s3
    3090:	3f1010ef          	jal	4c80 <__sprint_r>
    3094:	a0051063          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    3098:	0a812703          	lw	a4,168(sp)
    309c:	0a412783          	lw	a5,164(sp)
    30a0:	0ac10413          	add	s0,sp,172
    30a4:	fb9ff06f          	j	305c <_vfprintf_r+0x1298>
    30a8:	001ef613          	and	a2,t4,1
    30ac:	ce061063          	bnez	a2,258c <_vfprintf_r+0x7c8>
    30b0:	00d42223          	sw	a3,4(s0)
    30b4:	0a912423          	sw	s1,168(sp)
    30b8:	0ba12223          	sw	s10,164(sp)
    30bc:	00700793          	li	a5,7
    30c0:	d7a7d863          	bge	a5,s10,2630 <_vfprintf_r+0x86c>
    30c4:	00812583          	lw	a1,8(sp)
    30c8:	0a010613          	add	a2,sp,160
    30cc:	00098513          	mv	a0,s3
    30d0:	03d12023          	sw	t4,32(sp)
    30d4:	3ad010ef          	jal	4c80 <__sprint_r>
    30d8:	9a051e63          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    30dc:	0a812483          	lw	s1,168(sp)
    30e0:	0a412d03          	lw	s10,164(sp)
    30e4:	02012e83          	lw	t4,32(sp)
    30e8:	0ac10b13          	add	s6,sp,172
    30ec:	d44ff06f          	j	2630 <_vfprintf_r+0x86c>
    30f0:	01812703          	lw	a4,24(sp)
    30f4:	00100793          	li	a5,1
    30f8:	d2e7dc63          	bge	a5,a4,2630 <_vfprintf_r+0x86c>
    30fc:	01100793          	li	a5,17
    3100:	0000c297          	auipc	t0,0xc
    3104:	37428293          	add	t0,t0,884 # f474 <zeroes.0>
    3108:	18e7d4e3          	bge	a5,a4,3a90 <_vfprintf_r+0x1ccc>
    310c:	00040a13          	mv	s4,s0
    3110:	01000793          	li	a5,16
    3114:	00700c13          	li	s8,7
    3118:	03d12023          	sw	t4,32(sp)
    311c:	00028413          	mv	s0,t0
    3120:	00c0006f          	j	312c <_vfprintf_r+0x1368>
    3124:	ff0a0a13          	add	s4,s4,-16
    3128:	1547dee3          	bge	a5,s4,3a84 <_vfprintf_r+0x1cc0>
    312c:	01048493          	add	s1,s1,16
    3130:	001d0d13          	add	s10,s10,1
    3134:	008b2023          	sw	s0,0(s6)
    3138:	00fb2223          	sw	a5,4(s6)
    313c:	0a912423          	sw	s1,168(sp)
    3140:	0ba12223          	sw	s10,164(sp)
    3144:	008b0b13          	add	s6,s6,8
    3148:	fdac5ee3          	bge	s8,s10,3124 <_vfprintf_r+0x1360>
    314c:	00812583          	lw	a1,8(sp)
    3150:	0a010613          	add	a2,sp,160
    3154:	00098513          	mv	a0,s3
    3158:	329010ef          	jal	4c80 <__sprint_r>
    315c:	92051c63          	bnez	a0,2294 <_vfprintf_r+0x4d0>
    3160:	0a812483          	lw	s1,168(sp)
    3164:	0a412d03          	lw	s10,164(sp)
    3168:	0ac10b13          	add	s6,sp,172
    316c:	01000793          	li	a5,16
    3170:	fb5ff06f          	j	3124 <_vfprintf_r+0x1360>
    3174:	01412703          	lw	a4,20(sp)
    3178:	010ef793          	and	a5,t4,16
    317c:	00072d03          	lw	s10,0(a4)
    3180:	00470713          	add	a4,a4,4
    3184:	00e12a23          	sw	a4,20(sp)
    3188:	1a079663          	bnez	a5,3334 <_vfprintf_r+0x1570>
    318c:	040ef793          	and	a5,t4,64
    3190:	18078e63          	beqz	a5,332c <_vfprintf_r+0x1568>
    3194:	010d1d13          	sll	s10,s10,0x10
    3198:	010d5d13          	srl	s10,s10,0x10
    319c:	00000c93          	li	s9,0
    31a0:	80dff06f          	j	29ac <_vfprintf_r+0xbe8>
    31a4:	01412703          	lw	a4,20(sp)
    31a8:	01067793          	and	a5,a2,16
    31ac:	00072d03          	lw	s10,0(a4)
    31b0:	00470713          	add	a4,a4,4
    31b4:	00e12a23          	sw	a4,20(sp)
    31b8:	14079a63          	bnez	a5,330c <_vfprintf_r+0x1548>
    31bc:	04067793          	and	a5,a2,64
    31c0:	14078063          	beqz	a5,3300 <_vfprintf_r+0x153c>
    31c4:	010d1d13          	sll	s10,s10,0x10
    31c8:	010d5d13          	srl	s10,s10,0x10
    31cc:	00000c93          	li	s9,0
    31d0:	00100793          	li	a5,1
    31d4:	e34ff06f          	j	2808 <_vfprintf_r+0xa44>
    31d8:	01412703          	lw	a4,20(sp)
    31dc:	010ef793          	and	a5,t4,16
    31e0:	00072d03          	lw	s10,0(a4)
    31e4:	00470713          	add	a4,a4,4
    31e8:	00e12a23          	sw	a4,20(sp)
    31ec:	12079a63          	bnez	a5,3320 <_vfprintf_r+0x155c>
    31f0:	040ef793          	and	a5,t4,64
    31f4:	12078263          	beqz	a5,3318 <_vfprintf_r+0x1554>
    31f8:	010d1d13          	sll	s10,s10,0x10
    31fc:	410d5d13          	sra	s10,s10,0x10
    3200:	41fd5c93          	sra	s9,s10,0x1f
    3204:	000c8793          	mv	a5,s9
    3208:	f207d663          	bgez	a5,2934 <_vfprintf_r+0xb70>
    320c:	01a037b3          	snez	a5,s10
    3210:	419000b3          	neg	ra,s9
    3214:	40f08cb3          	sub	s9,ra,a5
    3218:	41a00d33          	neg	s10,s10
    321c:	000e8613          	mv	a2,t4
    3220:	02d00713          	li	a4,45
    3224:	00100793          	li	a5,1
    3228:	de4ff06f          	j	280c <_vfprintf_r+0xa48>
    322c:	00812403          	lw	s0,8(sp)
    3230:	00f12623          	sw	a5,12(sp)
    3234:	05842503          	lw	a0,88(s0)
    3238:	c31fd0ef          	jal	e68 <__retarget_lock_acquire_recursive>
    323c:	00c41703          	lh	a4,12(s0)
    3240:	00c12783          	lw	a5,12(sp)
    3244:	c01fe06f          	j	1e44 <_vfprintf_r+0x80>
    3248:	001ef793          	and	a5,t4,1
    324c:	00079463          	bnez	a5,3254 <_vfprintf_r+0x1490>
    3250:	e7dfe06f          	j	20cc <_vfprintf_r+0x308>
    3254:	85dff06f          	j	2ab0 <_vfprintf_r+0xcec>
    3258:	000a0e93          	mv	t4,s4
    325c:	000b0313          	mv	t1,s6
    3260:	ea8ff06f          	j	2908 <_vfprintf_r+0xb44>
    3264:	00094e03          	lbu	t3,0(s2)
    3268:	00f12a23          	sw	a5,20(sp)
    326c:	d09fe06f          	j	1f74 <_vfprintf_r+0x1b0>
    3270:	0a412703          	lw	a4,164(sp)
    3274:	0000c617          	auipc	a2,0xc
    3278:	d4860613          	add	a2,a2,-696 # efbc <__fini_array_end+0x2a4>
    327c:	00c42023          	sw	a2,0(s0)
    3280:	00148493          	add	s1,s1,1
    3284:	00100613          	li	a2,1
    3288:	00170713          	add	a4,a4,1
    328c:	00c42223          	sw	a2,4(s0)
    3290:	0a912423          	sw	s1,168(sp)
    3294:	0ae12223          	sw	a4,164(sp)
    3298:	00700613          	li	a2,7
    329c:	00840413          	add	s0,s0,8
    32a0:	2ee64ce3          	blt	a2,a4,3d98 <_vfprintf_r+0x1fd4>
    32a4:	7e069e63          	bnez	a3,3aa0 <_vfprintf_r+0x1cdc>
    32a8:	01812783          	lw	a5,24(sp)
    32ac:	001ef713          	and	a4,t4,1
    32b0:	00f76733          	or	a4,a4,a5
    32b4:	00071463          	bnez	a4,32bc <_vfprintf_r+0x14f8>
    32b8:	e15fe06f          	j	20cc <_vfprintf_r+0x308>
    32bc:	03412703          	lw	a4,52(sp)
    32c0:	03012783          	lw	a5,48(sp)
    32c4:	00700693          	li	a3,7
    32c8:	00e42023          	sw	a4,0(s0)
    32cc:	0a412703          	lw	a4,164(sp)
    32d0:	009784b3          	add	s1,a5,s1
    32d4:	00f42223          	sw	a5,4(s0)
    32d8:	00170713          	add	a4,a4,1
    32dc:	0a912423          	sw	s1,168(sp)
    32e0:	0ae12223          	sw	a4,164(sp)
    32e4:	38e6c8e3          	blt	a3,a4,3e74 <_vfprintf_r+0x20b0>
    32e8:	00840413          	add	s0,s0,8
    32ec:	7e80006f          	j	3ad4 <_vfprintf_r+0x1d10>
    32f0:	03000793          	li	a5,48
    32f4:	14f107a3          	sb	a5,335(sp)
    32f8:	14f10c13          	add	s8,sp,335
    32fc:	d38ff06f          	j	2834 <_vfprintf_r+0xa70>
    3300:	20067793          	and	a5,a2,512
    3304:	00078463          	beqz	a5,330c <_vfprintf_r+0x1548>
    3308:	0ffd7d13          	zext.b	s10,s10
    330c:	00000c93          	li	s9,0
    3310:	00100793          	li	a5,1
    3314:	cf4ff06f          	j	2808 <_vfprintf_r+0xa44>
    3318:	200ef793          	and	a5,t4,512
    331c:	2c0796e3          	bnez	a5,3de8 <_vfprintf_r+0x2024>
    3320:	41fd5c93          	sra	s9,s10,0x1f
    3324:	000c8793          	mv	a5,s9
    3328:	e08ff06f          	j	2930 <_vfprintf_r+0xb6c>
    332c:	200ef793          	and	a5,t4,512
    3330:	2a0790e3          	bnez	a5,3dd0 <_vfprintf_r+0x200c>
    3334:	00000c93          	li	s9,0
    3338:	e74ff06f          	j	29ac <_vfprintf_r+0xbe8>
    333c:	01412783          	lw	a5,20(sp)
    3340:	06010513          	add	a0,sp,96
    3344:	03612223          	sw	s6,36(sp)
    3348:	0007a703          	lw	a4,0(a5)
    334c:	03c12023          	sw	t3,32(sp)
    3350:	00478b13          	add	s6,a5,4
    3354:	00072683          	lw	a3,0(a4)
    3358:	01412823          	sw	s4,16(sp)
    335c:	06d12023          	sw	a3,96(sp)
    3360:	00472683          	lw	a3,4(a4)
    3364:	06d12223          	sw	a3,100(sp)
    3368:	00872683          	lw	a3,8(a4)
    336c:	06d12423          	sw	a3,104(sp)
    3370:	00c72703          	lw	a4,12(a4)
    3374:	06e12623          	sw	a4,108(sp)
    3378:	3cc0b0ef          	jal	e744 <__trunctfdf2>
    337c:	02012e03          	lw	t3,32(sp)
    3380:	02412303          	lw	t1,36(sp)
    3384:	02a12423          	sw	a0,40(sp)
    3388:	02b12623          	sw	a1,44(sp)
    338c:	01612a23          	sw	s6,20(sp)
    3390:	000a0e93          	mv	t4,s4
    3394:	fb1fe06f          	j	2344 <_vfprintf_r+0x580>
    3398:	010a7793          	and	a5,s4,16
    339c:	6c079a63          	bnez	a5,3a70 <_vfprintf_r+0x1cac>
    33a0:	040a7793          	and	a5,s4,64
    33a4:	24079ce3          	bnez	a5,3dfc <_vfprintf_r+0x2038>
    33a8:	200a7f13          	and	t5,s4,512
    33ac:	6c0f0263          	beqz	t5,3a70 <_vfprintf_r+0x1cac>
    33b0:	01412783          	lw	a5,20(sp)
    33b4:	00c12703          	lw	a4,12(sp)
    33b8:	0007a783          	lw	a5,0(a5)
    33bc:	00e78023          	sb	a4,0(a5)
    33c0:	e6cff06f          	j	2a2c <_vfprintf_r+0xc68>
    33c4:	03c12783          	lw	a5,60(sp)
    33c8:	00094e03          	lbu	t3,0(s2)
    33cc:	00079463          	bnez	a5,33d4 <_vfprintf_r+0x1610>
    33d0:	ba5fe06f          	j	1f74 <_vfprintf_r+0x1b0>
    33d4:	0007c783          	lbu	a5,0(a5)
    33d8:	00079463          	bnez	a5,33e0 <_vfprintf_r+0x161c>
    33dc:	b99fe06f          	j	1f74 <_vfprintf_r+0x1b0>
    33e0:	400a6a13          	or	s4,s4,1024
    33e4:	b91fe06f          	j	1f74 <_vfprintf_r+0x1b0>
    33e8:	fff00b13          	li	s6,-1
    33ec:	00068913          	mv	s2,a3
    33f0:	b89fe06f          	j	1f78 <_vfprintf_r+0x1b4>
    33f4:	0000c797          	auipc	a5,0xc
    33f8:	bac78793          	add	a5,a5,-1108 # efa0 <__fini_array_end+0x288>
    33fc:	000a0e93          	mv	t4,s4
    3400:	000b0313          	mv	t1,s6
    3404:	02f12c23          	sw	a5,56(sp)
    3408:	020ef793          	and	a5,t4,32
    340c:	1c078263          	beqz	a5,35d0 <_vfprintf_r+0x180c>
    3410:	01412783          	lw	a5,20(sp)
    3414:	00778b13          	add	s6,a5,7
    3418:	ff8b7b13          	and	s6,s6,-8
    341c:	000b2d03          	lw	s10,0(s6)
    3420:	004b2c83          	lw	s9,4(s6)
    3424:	008b0793          	add	a5,s6,8
    3428:	00f12a23          	sw	a5,20(sp)
    342c:	001ef793          	and	a5,t4,1
    3430:	00078e63          	beqz	a5,344c <_vfprintf_r+0x1688>
    3434:	019d67b3          	or	a5,s10,s9
    3438:	00078a63          	beqz	a5,344c <_vfprintf_r+0x1688>
    343c:	03000793          	li	a5,48
    3440:	06f10c23          	sb	a5,120(sp)
    3444:	07c10ca3          	sb	t3,121(sp)
    3448:	002eee93          	or	t4,t4,2
    344c:	bffef613          	and	a2,t4,-1025
    3450:	00200793          	li	a5,2
    3454:	bb4ff06f          	j	2808 <_vfprintf_r+0xa44>
    3458:	000b0313          	mv	t1,s6
    345c:	000a0613          	mv	a2,s4
    3460:	b80ff06f          	j	27e0 <_vfprintf_r+0xa1c>
    3464:	000a0e93          	mv	t4,s4
    3468:	000b0313          	mv	t1,s6
    346c:	d1cff06f          	j	2988 <_vfprintf_r+0xbc4>
    3470:	0000c797          	auipc	a5,0xc
    3474:	b1c78793          	add	a5,a5,-1252 # ef8c <__fini_array_end+0x274>
    3478:	000a0e93          	mv	t4,s4
    347c:	000b0313          	mv	t1,s6
    3480:	02f12c23          	sw	a5,56(sp)
    3484:	f85ff06f          	j	3408 <_vfprintf_r+0x1644>
    3488:	00194e03          	lbu	t3,1(s2)
    348c:	020a6a13          	or	s4,s4,32
    3490:	00190913          	add	s2,s2,1
    3494:	ae1fe06f          	j	1f74 <_vfprintf_r+0x1b0>
    3498:	00194e03          	lbu	t3,1(s2)
    349c:	200a6a13          	or	s4,s4,512
    34a0:	00190913          	add	s2,s2,1
    34a4:	ad1fe06f          	j	1f74 <_vfprintf_r+0x1b0>
    34a8:	00812583          	lw	a1,8(sp)
    34ac:	0a010613          	add	a2,sp,160
    34b0:	00098513          	mv	a0,s3
    34b4:	03d12023          	sw	t4,32(sp)
    34b8:	7c8010ef          	jal	4c80 <__sprint_r>
    34bc:	00050463          	beqz	a0,34c4 <_vfprintf_r+0x1700>
    34c0:	dd5fe06f          	j	2294 <_vfprintf_r+0x4d0>
    34c4:	0a812483          	lw	s1,168(sp)
    34c8:	02012e83          	lw	t4,32(sp)
    34cc:	0ac10413          	add	s0,sp,172
    34d0:	e10ff06f          	j	2ae0 <_vfprintf_r+0xd1c>
    34d4:	00600793          	li	a5,6
    34d8:	00030c93          	mv	s9,t1
    34dc:	0e67e6e3          	bltu	a5,t1,3dc8 <_vfprintf_r+0x2004>
    34e0:	01612a23          	sw	s6,20(sp)
    34e4:	00012823          	sw	zero,16(sp)
    34e8:	000c8d13          	mv	s10,s9
    34ec:	00000613          	li	a2,0
    34f0:	00000313          	li	t1,0
    34f4:	02012223          	sw	zero,36(sp)
    34f8:	02012023          	sw	zero,32(sp)
    34fc:	00000a13          	li	s4,0
    3500:	0000cc17          	auipc	s8,0xc
    3504:	ab4c0c13          	add	s8,s8,-1356 # efb4 <__fini_array_end+0x29c>
    3508:	afdfe06f          	j	2004 <_vfprintf_r+0x240>
    350c:	00800613          	li	a2,8
    3510:	00000593          	li	a1,0
    3514:	09810513          	add	a0,sp,152
    3518:	03c12023          	sw	t3,32(sp)
    351c:	01d12823          	sw	t4,16(sp)
    3520:	951fd0ef          	jal	e70 <memset>
    3524:	01412783          	lw	a5,20(sp)
    3528:	0ec10c13          	add	s8,sp,236
    352c:	09810693          	add	a3,sp,152
    3530:	0007a603          	lw	a2,0(a5)
    3534:	000c0593          	mv	a1,s8
    3538:	00098513          	mv	a0,s3
    353c:	2a4070ef          	jal	a7e0 <_wcrtomb_r>
    3540:	fff00793          	li	a5,-1
    3544:	01012e83          	lw	t4,16(sp)
    3548:	02012e03          	lw	t3,32(sp)
    354c:	00050d13          	mv	s10,a0
    3550:	00f51463          	bne	a0,a5,3558 <_vfprintf_r+0x1794>
    3554:	4980106f          	j	49ec <_vfprintf_r+0x2c28>
    3558:	fff54813          	not	a6,a0
    355c:	41f85813          	sra	a6,a6,0x1f
    3560:	01057cb3          	and	s9,a0,a6
    3564:	97cff06f          	j	26e0 <_vfprintf_r+0x91c>
    3568:	03412703          	lw	a4,52(sp)
    356c:	03012783          	lw	a5,48(sp)
    3570:	00700693          	li	a3,7
    3574:	00e42023          	sw	a4,0(s0)
    3578:	0a412703          	lw	a4,164(sp)
    357c:	00f484b3          	add	s1,s1,a5
    3580:	00f42223          	sw	a5,4(s0)
    3584:	00170713          	add	a4,a4,1
    3588:	0a912423          	sw	s1,168(sp)
    358c:	0ae12223          	sw	a4,164(sp)
    3590:	00840413          	add	s0,s0,8
    3594:	a4e6d0e3          	bge	a3,a4,2fd4 <_vfprintf_r+0x1210>
    3598:	00812583          	lw	a1,8(sp)
    359c:	0a010613          	add	a2,sp,160
    35a0:	00098513          	mv	a0,s3
    35a4:	02612223          	sw	t1,36(sp)
    35a8:	03d12023          	sw	t4,32(sp)
    35ac:	6d4010ef          	jal	4c80 <__sprint_r>
    35b0:	00050463          	beqz	a0,35b8 <_vfprintf_r+0x17f4>
    35b4:	ce1fe06f          	j	2294 <_vfprintf_r+0x4d0>
    35b8:	07c12d03          	lw	s10,124(sp)
    35bc:	0a812483          	lw	s1,168(sp)
    35c0:	02412303          	lw	t1,36(sp)
    35c4:	02012e83          	lw	t4,32(sp)
    35c8:	0ac10413          	add	s0,sp,172
    35cc:	a09ff06f          	j	2fd4 <_vfprintf_r+0x1210>
    35d0:	01412703          	lw	a4,20(sp)
    35d4:	010ef793          	and	a5,t4,16
    35d8:	00072d03          	lw	s10,0(a4)
    35dc:	00470713          	add	a4,a4,4
    35e0:	00e12a23          	sw	a4,20(sp)
    35e4:	08079863          	bnez	a5,3674 <_vfprintf_r+0x18b0>
    35e8:	040ef793          	and	a5,t4,64
    35ec:	08078063          	beqz	a5,366c <_vfprintf_r+0x18a8>
    35f0:	010d1d13          	sll	s10,s10,0x10
    35f4:	010d5d13          	srl	s10,s10,0x10
    35f8:	00000c93          	li	s9,0
    35fc:	e31ff06f          	j	342c <_vfprintf_r+0x1668>
    3600:	00000d13          	li	s10,0
    3604:	15010c13          	add	s8,sp,336
    3608:	a2cff06f          	j	2834 <_vfprintf_r+0xa70>
    360c:	00812583          	lw	a1,8(sp)
    3610:	0a010613          	add	a2,sp,160
    3614:	00098513          	mv	a0,s3
    3618:	03d12023          	sw	t4,32(sp)
    361c:	664010ef          	jal	4c80 <__sprint_r>
    3620:	00050463          	beqz	a0,3628 <_vfprintf_r+0x1864>
    3624:	c71fe06f          	j	2294 <_vfprintf_r+0x4d0>
    3628:	0a812483          	lw	s1,168(sp)
    362c:	0a412d03          	lw	s10,164(sp)
    3630:	02012e83          	lw	t4,32(sp)
    3634:	0ac10b13          	add	s6,sp,172
    3638:	f71fe06f          	j	25a8 <_vfprintf_r+0x7e4>
    363c:	00812583          	lw	a1,8(sp)
    3640:	0a010613          	add	a2,sp,160
    3644:	00098513          	mv	a0,s3
    3648:	03d12023          	sw	t4,32(sp)
    364c:	634010ef          	jal	4c80 <__sprint_r>
    3650:	00050463          	beqz	a0,3658 <_vfprintf_r+0x1894>
    3654:	c41fe06f          	j	2294 <_vfprintf_r+0x4d0>
    3658:	0a812483          	lw	s1,168(sp)
    365c:	0a412d03          	lw	s10,164(sp)
    3660:	02012e83          	lw	t4,32(sp)
    3664:	0ac10b13          	add	s6,sp,172
    3668:	f71fe06f          	j	25d8 <_vfprintf_r+0x814>
    366c:	200ef793          	and	a5,t4,512
    3670:	76079663          	bnez	a5,3ddc <_vfprintf_r+0x2018>
    3674:	00000c93          	li	s9,0
    3678:	db5ff06f          	j	342c <_vfprintf_r+0x1668>
    367c:	00000793          	li	a5,0
    3680:	15010b13          	add	s6,sp,336
    3684:	01212823          	sw	s2,16(sp)
    3688:	00078913          	mv	s2,a5
    368c:	00098793          	mv	a5,s3
    3690:	04812823          	sw	s0,80(sp)
    3694:	000b0993          	mv	s3,s6
    3698:	03c12403          	lw	s0,60(sp)
    369c:	40067493          	and	s1,a2,1024
    36a0:	0ff00a13          	li	s4,255
    36a4:	03c12023          	sw	t3,32(sp)
    36a8:	02c12223          	sw	a2,36(sp)
    36ac:	04612223          	sw	t1,68(sp)
    36b0:	00078b13          	mv	s6,a5
    36b4:	0280006f          	j	36dc <_vfprintf_r+0x1918>
    36b8:	00a00613          	li	a2,10
    36bc:	00000693          	li	a3,0
    36c0:	000d0513          	mv	a0,s10
    36c4:	000c8593          	mv	a1,s9
    36c8:	485070ef          	jal	b34c <__udivdi3>
    36cc:	6a0c8ee3          	beqz	s9,4588 <_vfprintf_r+0x27c4>
    36d0:	00050d13          	mv	s10,a0
    36d4:	00058c93          	mv	s9,a1
    36d8:	000c0993          	mv	s3,s8
    36dc:	00a00613          	li	a2,10
    36e0:	00000693          	li	a3,0
    36e4:	000d0513          	mv	a0,s10
    36e8:	000c8593          	mv	a1,s9
    36ec:	30c080ef          	jal	b9f8 <__umoddi3>
    36f0:	03050513          	add	a0,a0,48
    36f4:	fea98fa3          	sb	a0,-1(s3)
    36f8:	fff98c13          	add	s8,s3,-1
    36fc:	00190913          	add	s2,s2,1
    3700:	fa048ce3          	beqz	s1,36b8 <_vfprintf_r+0x18f4>
    3704:	00044783          	lbu	a5,0(s0)
    3708:	faf918e3          	bne	s2,a5,36b8 <_vfprintf_r+0x18f4>
    370c:	fb4906e3          	beq	s2,s4,36b8 <_vfprintf_r+0x18f4>
    3710:	560c9ae3          	bnez	s9,4484 <_vfprintf_r+0x26c0>
    3714:	00900793          	li	a5,9
    3718:	57a7e6e3          	bltu	a5,s10,4484 <_vfprintf_r+0x26c0>
    371c:	02412603          	lw	a2,36(sp)
    3720:	15010793          	add	a5,sp,336
    3724:	02812e23          	sw	s0,60(sp)
    3728:	01212c23          	sw	s2,24(sp)
    372c:	02012e03          	lw	t3,32(sp)
    3730:	01012903          	lw	s2,16(sp)
    3734:	04412303          	lw	t1,68(sp)
    3738:	05012403          	lw	s0,80(sp)
    373c:	000b0993          	mv	s3,s6
    3740:	41878d33          	sub	s10,a5,s8
    3744:	00060e93          	mv	t4,a2
    3748:	8ecff06f          	j	2834 <_vfprintf_r+0xa70>
    374c:	00812583          	lw	a1,8(sp)
    3750:	0a010613          	add	a2,sp,160
    3754:	00098513          	mv	a0,s3
    3758:	04612e23          	sw	t1,92(sp)
    375c:	05c12c23          	sw	t3,88(sp)
    3760:	05d12a23          	sw	t4,84(sp)
    3764:	05f12823          	sw	t6,80(sp)
    3768:	04512223          	sw	t0,68(sp)
    376c:	514010ef          	jal	4c80 <__sprint_r>
    3770:	00050463          	beqz	a0,3778 <_vfprintf_r+0x19b4>
    3774:	b21fe06f          	j	2294 <_vfprintf_r+0x4d0>
    3778:	07714603          	lbu	a2,119(sp)
    377c:	0a812483          	lw	s1,168(sp)
    3780:	05c12303          	lw	t1,92(sp)
    3784:	05812e03          	lw	t3,88(sp)
    3788:	05412e83          	lw	t4,84(sp)
    378c:	05012f83          	lw	t6,80(sp)
    3790:	04412283          	lw	t0,68(sp)
    3794:	0ac10413          	add	s0,sp,172
    3798:	88dfe06f          	j	2024 <_vfprintf_r+0x260>
    379c:	02812883          	lw	a7,40(sp)
    37a0:	02c12703          	lw	a4,44(sp)
    37a4:	02612223          	sw	t1,36(sp)
    37a8:	00088613          	mv	a2,a7
    37ac:	00088513          	mv	a0,a7
    37b0:	00070693          	mv	a3,a4
    37b4:	00070593          	mv	a1,a4
    37b8:	03c12023          	sw	t3,32(sp)
    37bc:	01d12823          	sw	t4,16(sp)
    37c0:	5310a0ef          	jal	e4f0 <__unorddf2>
    37c4:	01012e83          	lw	t4,16(sp)
    37c8:	02012e03          	lw	t3,32(sp)
    37cc:	02412303          	lw	t1,36(sp)
    37d0:	00050463          	beqz	a0,37d8 <_vfprintf_r+0x1a14>
    37d4:	0e00106f          	j	48b4 <_vfprintf_r+0x2af0>
    37d8:	06100713          	li	a4,97
    37dc:	08ee0263          	beq	t3,a4,3860 <_vfprintf_r+0x1a9c>
    37e0:	04100713          	li	a4,65
    37e4:	05800793          	li	a5,88
    37e8:	06ee0e63          	beq	t3,a4,3864 <_vfprintf_r+0x1aa0>
    37ec:	fff00713          	li	a4,-1
    37f0:	00e31463          	bne	t1,a4,37f8 <_vfprintf_r+0x1a34>
    37f4:	01c0106f          	j	4810 <_vfprintf_r+0x2a4c>
    37f8:	fdfe7713          	and	a4,t3,-33
    37fc:	04700693          	li	a3,71
    3800:	00012823          	sw	zero,16(sp)
    3804:	00d71663          	bne	a4,a3,3810 <_vfprintf_r+0x1a4c>
    3808:	00031463          	bnez	t1,3810 <_vfprintf_r+0x1a4c>
    380c:	00100313          	li	t1,1
    3810:	100ee793          	or	a5,t4,256
    3814:	00078b13          	mv	s6,a5
    3818:	02c12783          	lw	a5,44(sp)
    381c:	04012223          	sw	zero,68(sp)
    3820:	00078493          	mv	s1,a5
    3824:	0007da63          	bgez	a5,3838 <_vfprintf_r+0x1a74>
    3828:	800004b7          	lui	s1,0x80000
    382c:	00f4c4b3          	xor	s1,s1,a5
    3830:	02d00793          	li	a5,45
    3834:	04f12223          	sw	a5,68(sp)
    3838:	fbfe0713          	add	a4,t3,-65
    383c:	02500693          	li	a3,37
    3840:	3ae6e463          	bltu	a3,a4,3be8 <_vfprintf_r+0x1e24>
    3844:	0000c697          	auipc	a3,0xc
    3848:	b9868693          	add	a3,a3,-1128 # f3dc <_ctype_+0x270>
    384c:	00271713          	sll	a4,a4,0x2
    3850:	00d70733          	add	a4,a4,a3
    3854:	00072703          	lw	a4,0(a4)
    3858:	00d70733          	add	a4,a4,a3
    385c:	00070067          	jr	a4
    3860:	07800793          	li	a5,120
    3864:	03000713          	li	a4,48
    3868:	06e10c23          	sb	a4,120(sp)
    386c:	06f10ca3          	sb	a5,121(sp)
    3870:	06300713          	li	a4,99
    3874:	00012823          	sw	zero,16(sp)
    3878:	002eee93          	or	t4,t4,2
    387c:	0ec10c13          	add	s8,sp,236
    3880:	f86758e3          	bge	a4,t1,3810 <_vfprintf_r+0x1a4c>
    3884:	00130593          	add	a1,t1,1
    3888:	00098513          	mv	a0,s3
    388c:	03c12023          	sw	t3,32(sp)
    3890:	01d12c23          	sw	t4,24(sp)
    3894:	00612823          	sw	t1,16(sp)
    3898:	d35fd0ef          	jal	15cc <_malloc_r>
    389c:	01012303          	lw	t1,16(sp)
    38a0:	01812e83          	lw	t4,24(sp)
    38a4:	02012e03          	lw	t3,32(sp)
    38a8:	00050c13          	mv	s8,a0
    38ac:	00051463          	bnez	a0,38b4 <_vfprintf_r+0x1af0>
    38b0:	13c0106f          	j	49ec <_vfprintf_r+0x2c28>
    38b4:	00a12823          	sw	a0,16(sp)
    38b8:	f59ff06f          	j	3810 <_vfprintf_r+0x1a4c>
    38bc:	00098513          	mv	a0,s3
    38c0:	1d0030ef          	jal	6a90 <__sinit>
    38c4:	00c12783          	lw	a5,12(sp)
    38c8:	d5cfe06f          	j	1e24 <_vfprintf_r+0x60>
    38cc:	00812583          	lw	a1,8(sp)
    38d0:	0a010613          	add	a2,sp,160
    38d4:	00098513          	mv	a0,s3
    38d8:	03d12023          	sw	t4,32(sp)
    38dc:	3a4010ef          	jal	4c80 <__sprint_r>
    38e0:	00050463          	beqz	a0,38e8 <_vfprintf_r+0x1b24>
    38e4:	9b1fe06f          	j	2294 <_vfprintf_r+0x4d0>
    38e8:	0a812483          	lw	s1,168(sp)
    38ec:	02012e83          	lw	t4,32(sp)
    38f0:	0ac10413          	add	s0,sp,172
    38f4:	9b0ff06f          	j	2aa4 <_vfprintf_r+0xce0>
    38f8:	00800613          	li	a2,8
    38fc:	00000593          	li	a1,0
    3900:	09810513          	add	a0,sp,152
    3904:	02612023          	sw	t1,32(sp)
    3908:	01c12a23          	sw	t3,20(sp)
    390c:	01d12823          	sw	t4,16(sp)
    3910:	09812223          	sw	s8,132(sp)
    3914:	d5cfd0ef          	jal	e70 <memset>
    3918:	02012303          	lw	t1,32(sp)
    391c:	01012e83          	lw	t4,16(sp)
    3920:	01412e03          	lw	t3,20(sp)
    3924:	3a0340e3          	bltz	t1,44c4 <_vfprintf_r+0x2700>
    3928:	00000d13          	li	s10,0
    392c:	01212823          	sw	s2,16(sp)
    3930:	000c0c93          	mv	s9,s8
    3934:	fff00493          	li	s1,-1
    3938:	000b0c13          	mv	s8,s6
    393c:	000e8a13          	mv	s4,t4
    3940:	00040b13          	mv	s6,s0
    3944:	000d0913          	mv	s2,s10
    3948:	00030413          	mv	s0,t1
    394c:	0300006f          	j	397c <_vfprintf_r+0x1bb8>
    3950:	09810693          	add	a3,sp,152
    3954:	0ec10593          	add	a1,sp,236
    3958:	00098513          	mv	a0,s3
    395c:	685060ef          	jal	a7e0 <_wcrtomb_r>
    3960:	68950ae3          	beq	a0,s1,47f4 <_vfprintf_r+0x2a30>
    3964:	00a907b3          	add	a5,s2,a0
    3968:	02f44263          	blt	s0,a5,398c <_vfprintf_r+0x1bc8>
    396c:	004d0d13          	add	s10,s10,4
    3970:	00879463          	bne	a5,s0,3978 <_vfprintf_r+0x1bb4>
    3974:	7990006f          	j	490c <_vfprintf_r+0x2b48>
    3978:	00078913          	mv	s2,a5
    397c:	08412783          	lw	a5,132(sp)
    3980:	01a787b3          	add	a5,a5,s10
    3984:	0007a603          	lw	a2,0(a5)
    3988:	fc0614e3          	bnez	a2,3950 <_vfprintf_r+0x1b8c>
    398c:	00090d13          	mv	s10,s2
    3990:	01412e03          	lw	t3,20(sp)
    3994:	01012903          	lw	s2,16(sp)
    3998:	000b0413          	mv	s0,s6
    399c:	000a0e93          	mv	t4,s4
    39a0:	000c0b13          	mv	s6,s8
    39a4:	000c8c13          	mv	s8,s9
    39a8:	340d0ce3          	beqz	s10,4500 <_vfprintf_r+0x273c>
    39ac:	06300793          	li	a5,99
    39b0:	59a7dee3          	bge	a5,s10,474c <_vfprintf_r+0x2988>
    39b4:	001d0593          	add	a1,s10,1
    39b8:	00098513          	mv	a0,s3
    39bc:	01c12a23          	sw	t3,20(sp)
    39c0:	01d12823          	sw	t4,16(sp)
    39c4:	c09fd0ef          	jal	15cc <_malloc_r>
    39c8:	01012e83          	lw	t4,16(sp)
    39cc:	01412e03          	lw	t3,20(sp)
    39d0:	00050c13          	mv	s8,a0
    39d4:	620500e3          	beqz	a0,47f4 <_vfprintf_r+0x2a30>
    39d8:	00a12823          	sw	a0,16(sp)
    39dc:	00800613          	li	a2,8
    39e0:	00000593          	li	a1,0
    39e4:	09810513          	add	a0,sp,152
    39e8:	03c12023          	sw	t3,32(sp)
    39ec:	01d12a23          	sw	t4,20(sp)
    39f0:	c80fd0ef          	jal	e70 <memset>
    39f4:	09810713          	add	a4,sp,152
    39f8:	000d0693          	mv	a3,s10
    39fc:	08410613          	add	a2,sp,132
    3a00:	000c0593          	mv	a1,s8
    3a04:	00098513          	mv	a0,s3
    3a08:	665060ef          	jal	a86c <_wcsrtombs_r>
    3a0c:	01412e83          	lw	t4,20(sp)
    3a10:	02012e03          	lw	t3,32(sp)
    3a14:	00ad0463          	beq	s10,a0,3a1c <_vfprintf_r+0x1c58>
    3a18:	0240106f          	j	4a3c <_vfprintf_r+0x2c78>
    3a1c:	01ac0733          	add	a4,s8,s10
    3a20:	00070023          	sb	zero,0(a4)
    3a24:	07714603          	lbu	a2,119(sp)
    3a28:	fffd4813          	not	a6,s10
    3a2c:	41f85813          	sra	a6,a6,0x1f
    3a30:	01612a23          	sw	s6,20(sp)
    3a34:	02012223          	sw	zero,36(sp)
    3a38:	02012023          	sw	zero,32(sp)
    3a3c:	010d7cb3          	and	s9,s10,a6
    3a40:	00000313          	li	t1,0
    3a44:	00000a13          	li	s4,0
    3a48:	00061463          	bnez	a2,3a50 <_vfprintf_r+0x1c8c>
    3a4c:	db8fe06f          	j	2004 <_vfprintf_r+0x240>
    3a50:	9d5fe06f          	j	2424 <_vfprintf_r+0x660>
    3a54:	00048e93          	mv	t4,s1
    3a58:	000a0293          	mv	t0,s4
    3a5c:	00070493          	mv	s1,a4
    3a60:	01a484b3          	add	s1,s1,s10
    3a64:	00178793          	add	a5,a5,1
    3a68:	00542023          	sw	t0,0(s0)
    3a6c:	e48fe06f          	j	20b4 <_vfprintf_r+0x2f0>
    3a70:	01412783          	lw	a5,20(sp)
    3a74:	00c12703          	lw	a4,12(sp)
    3a78:	0007a783          	lw	a5,0(a5)
    3a7c:	00e7a023          	sw	a4,0(a5)
    3a80:	fadfe06f          	j	2a2c <_vfprintf_r+0xc68>
    3a84:	02012e83          	lw	t4,32(sp)
    3a88:	00040293          	mv	t0,s0
    3a8c:	000a0413          	mv	s0,s4
    3a90:	008484b3          	add	s1,s1,s0
    3a94:	001d0d13          	add	s10,s10,1
    3a98:	005b2023          	sw	t0,0(s6)
    3a9c:	b7dfe06f          	j	2618 <_vfprintf_r+0x854>
    3aa0:	03412703          	lw	a4,52(sp)
    3aa4:	03012783          	lw	a5,48(sp)
    3aa8:	00700613          	li	a2,7
    3aac:	00e42023          	sw	a4,0(s0)
    3ab0:	0a412703          	lw	a4,164(sp)
    3ab4:	009784b3          	add	s1,a5,s1
    3ab8:	00f42223          	sw	a5,4(s0)
    3abc:	00170713          	add	a4,a4,1
    3ac0:	0a912423          	sw	s1,168(sp)
    3ac4:	0ae12223          	sw	a4,164(sp)
    3ac8:	00840413          	add	s0,s0,8
    3acc:	3ae64463          	blt	a2,a4,3e74 <_vfprintf_r+0x20b0>
    3ad0:	3e06cee3          	bltz	a3,46cc <_vfprintf_r+0x2908>
    3ad4:	01812783          	lw	a5,24(sp)
    3ad8:	00170713          	add	a4,a4,1
    3adc:	01842023          	sw	s8,0(s0)
    3ae0:	009784b3          	add	s1,a5,s1
    3ae4:	00f42223          	sw	a5,4(s0)
    3ae8:	0a912423          	sw	s1,168(sp)
    3aec:	0ae12223          	sw	a4,164(sp)
    3af0:	00700793          	li	a5,7
    3af4:	00e7c463          	blt	a5,a4,3afc <_vfprintf_r+0x1d38>
    3af8:	dd0fe06f          	j	20c8 <_vfprintf_r+0x304>
    3afc:	b61fe06f          	j	265c <_vfprintf_r+0x898>
    3b00:	01000613          	li	a2,16
    3b04:	0a412683          	lw	a3,164(sp)
    3b08:	0000c297          	auipc	t0,0xc
    3b0c:	96c28293          	add	t0,t0,-1684 # f474 <zeroes.0>
    3b10:	09665463          	bge	a2,s6,3b98 <_vfprintf_r+0x1dd4>
    3b14:	00040793          	mv	a5,s0
    3b18:	00048713          	mv	a4,s1
    3b1c:	00812403          	lw	s0,8(sp)
    3b20:	01000893          	li	a7,16
    3b24:	00700d13          	li	s10,7
    3b28:	05d12223          	sw	t4,68(sp)
    3b2c:	00028493          	mv	s1,t0
    3b30:	00c0006f          	j	3b3c <_vfprintf_r+0x1d78>
    3b34:	ff0b0b13          	add	s6,s6,-16
    3b38:	0568d863          	bge	a7,s6,3b88 <_vfprintf_r+0x1dc4>
    3b3c:	01070713          	add	a4,a4,16
    3b40:	00168693          	add	a3,a3,1
    3b44:	0097a023          	sw	s1,0(a5)
    3b48:	0117a223          	sw	a7,4(a5)
    3b4c:	0ae12423          	sw	a4,168(sp)
    3b50:	0ad12223          	sw	a3,164(sp)
    3b54:	00878793          	add	a5,a5,8
    3b58:	fcdd5ee3          	bge	s10,a3,3b34 <_vfprintf_r+0x1d70>
    3b5c:	0a010613          	add	a2,sp,160
    3b60:	00040593          	mv	a1,s0
    3b64:	00098513          	mv	a0,s3
    3b68:	118010ef          	jal	4c80 <__sprint_r>
    3b6c:	00050463          	beqz	a0,3b74 <_vfprintf_r+0x1db0>
    3b70:	f24fe06f          	j	2294 <_vfprintf_r+0x4d0>
    3b74:	0a812703          	lw	a4,168(sp)
    3b78:	0a412683          	lw	a3,164(sp)
    3b7c:	0ac10793          	add	a5,sp,172
    3b80:	01000893          	li	a7,16
    3b84:	fb1ff06f          	j	3b34 <_vfprintf_r+0x1d70>
    3b88:	04412e83          	lw	t4,68(sp)
    3b8c:	00048293          	mv	t0,s1
    3b90:	00078413          	mv	s0,a5
    3b94:	00070493          	mv	s1,a4
    3b98:	016484b3          	add	s1,s1,s6
    3b9c:	00168693          	add	a3,a3,1
    3ba0:	00542023          	sw	t0,0(s0)
    3ba4:	01642223          	sw	s6,4(s0)
    3ba8:	0a912423          	sw	s1,168(sp)
    3bac:	0ad12223          	sw	a3,164(sp)
    3bb0:	00700713          	li	a4,7
    3bb4:	00840413          	add	s0,s0,8
    3bb8:	bed75c63          	bge	a4,a3,2fb0 <_vfprintf_r+0x11ec>
    3bbc:	00812583          	lw	a1,8(sp)
    3bc0:	0a010613          	add	a2,sp,160
    3bc4:	00098513          	mv	a0,s3
    3bc8:	05d12223          	sw	t4,68(sp)
    3bcc:	0b4010ef          	jal	4c80 <__sprint_r>
    3bd0:	00050463          	beqz	a0,3bd8 <_vfprintf_r+0x1e14>
    3bd4:	ec0fe06f          	j	2294 <_vfprintf_r+0x4d0>
    3bd8:	0a812483          	lw	s1,168(sp)
    3bdc:	04412e83          	lw	t4,68(sp)
    3be0:	0ac10413          	add	s0,sp,172
    3be4:	bccff06f          	j	2fb0 <_vfprintf_r+0x11ec>
    3be8:	02812703          	lw	a4,40(sp)
    3bec:	09810893          	add	a7,sp,152
    3bf0:	08410813          	add	a6,sp,132
    3bf4:	00070513          	mv	a0,a4
    3bf8:	00050593          	mv	a1,a0
    3bfc:	00030713          	mv	a4,t1
    3c00:	07c10793          	add	a5,sp,124
    3c04:	00200693          	li	a3,2
    3c08:	00048613          	mv	a2,s1
    3c0c:	00098513          	mv	a0,s3
    3c10:	03c12223          	sw	t3,36(sp)
    3c14:	03d12023          	sw	t4,32(sp)
    3c18:	00612c23          	sw	t1,24(sp)
    3c1c:	11c040ef          	jal	7d38 <_dtoa_r>
    3c20:	02012e83          	lw	t4,32(sp)
    3c24:	01812303          	lw	t1,24(sp)
    3c28:	02412e03          	lw	t3,36(sp)
    3c2c:	001ef713          	and	a4,t4,1
    3c30:	00050c13          	mv	s8,a0
    3c34:	1a0712e3          	bnez	a4,45d8 <_vfprintf_r+0x2814>
    3c38:	09812783          	lw	a5,152(sp)
    3c3c:	07c12a03          	lw	s4,124(sp)
    3c40:	40a787b3          	sub	a5,a5,a0
    3c44:	00f12c23          	sw	a5,24(sp)
    3c48:	ffd00713          	li	a4,-3
    3c4c:	00ea4463          	blt	s4,a4,3c54 <_vfprintf_r+0x1e90>
    3c50:	5b435663          	bge	t1,s4,41fc <_vfprintf_r+0x2438>
    3c54:	ffee0e13          	add	t3,t3,-2
    3c58:	fffa0d13          	add	s10,s4,-1
    3c5c:	07a12e23          	sw	s10,124(sp)
    3c60:	0ffe7693          	zext.b	a3,t3
    3c64:	00000613          	li	a2,0
    3c68:	08d10423          	sb	a3,136(sp)
    3c6c:	02b00693          	li	a3,43
    3c70:	000d5863          	bgez	s10,3c80 <_vfprintf_r+0x1ebc>
    3c74:	00100713          	li	a4,1
    3c78:	41470d33          	sub	s10,a4,s4
    3c7c:	02d00693          	li	a3,45
    3c80:	08d104a3          	sb	a3,137(sp)
    3c84:	00900693          	li	a3,9
    3c88:	33a6d8e3          	bge	a3,s10,47b8 <_vfprintf_r+0x29f4>
    3c8c:	000c0793          	mv	a5,s8
    3c90:	09f10493          	add	s1,sp,159
    3c94:	03212023          	sw	s2,32(sp)
    3c98:	00040c13          	mv	s8,s0
    3c9c:	06300a13          	li	s4,99
    3ca0:	000d0413          	mv	s0,s10
    3ca4:	03d12223          	sw	t4,36(sp)
    3ca8:	05c12023          	sw	t3,64(sp)
    3cac:	00048913          	mv	s2,s1
    3cb0:	00098c93          	mv	s9,s3
    3cb4:	00078d13          	mv	s10,a5
    3cb8:	00a00593          	li	a1,10
    3cbc:	00040513          	mv	a0,s0
    3cc0:	7a10a0ef          	jal	ec60 <__modsi3>
    3cc4:	03050713          	add	a4,a0,48
    3cc8:	00090b13          	mv	s6,s2
    3ccc:	00040513          	mv	a0,s0
    3cd0:	feeb0fa3          	sb	a4,-1(s6)
    3cd4:	00a00593          	li	a1,10
    3cd8:	00040993          	mv	s3,s0
    3cdc:	7010a0ef          	jal	ebdc <__divsi3>
    3ce0:	fff90913          	add	s2,s2,-1
    3ce4:	00050413          	mv	s0,a0
    3ce8:	fd3a48e3          	blt	s4,s3,3cb8 <_vfprintf_r+0x1ef4>
    3cec:	000c8993          	mv	s3,s9
    3cf0:	03050713          	add	a4,a0,48
    3cf4:	00090c93          	mv	s9,s2
    3cf8:	ffeb0693          	add	a3,s6,-2
    3cfc:	feec8fa3          	sb	a4,-1(s9)
    3d00:	000c0413          	mv	s0,s8
    3d04:	02412e83          	lw	t4,36(sp)
    3d08:	04012e03          	lw	t3,64(sp)
    3d0c:	02012903          	lw	s2,32(sp)
    3d10:	000d0c13          	mv	s8,s10
    3d14:	4c96f6e3          	bgeu	a3,s1,49e0 <_vfprintf_r+0x2c1c>
    3d18:	08a10713          	add	a4,sp,138
    3d1c:	0006c783          	lbu	a5,0(a3)
    3d20:	00168693          	add	a3,a3,1
    3d24:	00170713          	add	a4,a4,1
    3d28:	fef70fa3          	sb	a5,-1(a4)
    3d2c:	fe9698e3          	bne	a3,s1,3d1c <_vfprintf_r+0x1f58>
    3d30:	15010793          	add	a5,sp,336
    3d34:	41678633          	sub	a2,a5,s6
    3d38:	f5360793          	add	a5,a2,-173
    3d3c:	04f12023          	sw	a5,64(sp)
    3d40:	01812783          	lw	a5,24(sp)
    3d44:	04012683          	lw	a3,64(sp)
    3d48:	00100713          	li	a4,1
    3d4c:	00d78d33          	add	s10,a5,a3
    3d50:	28f75ce3          	bge	a4,a5,47e8 <_vfprintf_r+0x2a24>
    3d54:	03012783          	lw	a5,48(sp)
    3d58:	00fd0d33          	add	s10,s10,a5
    3d5c:	fffd4813          	not	a6,s10
    3d60:	bffeff13          	and	t5,t4,-1025
    3d64:	41f85813          	sra	a6,a6,0x1f
    3d68:	100f6e93          	or	t4,t5,256
    3d6c:	010d7cb3          	and	s9,s10,a6
    3d70:	02012223          	sw	zero,36(sp)
    3d74:	02012023          	sw	zero,32(sp)
    3d78:	00000a13          	li	s4,0
    3d7c:	04412783          	lw	a5,68(sp)
    3d80:	46079263          	bnez	a5,41e4 <_vfprintf_r+0x2420>
    3d84:	07714603          	lbu	a2,119(sp)
    3d88:	00000313          	li	t1,0
    3d8c:	00061463          	bnez	a2,3d94 <_vfprintf_r+0x1fd0>
    3d90:	a74fe06f          	j	2004 <_vfprintf_r+0x240>
    3d94:	e90fe06f          	j	2424 <_vfprintf_r+0x660>
    3d98:	00812583          	lw	a1,8(sp)
    3d9c:	0a010613          	add	a2,sp,160
    3da0:	00098513          	mv	a0,s3
    3da4:	03d12023          	sw	t4,32(sp)
    3da8:	6d9000ef          	jal	4c80 <__sprint_r>
    3dac:	00050463          	beqz	a0,3db4 <_vfprintf_r+0x1ff0>
    3db0:	ce4fe06f          	j	2294 <_vfprintf_r+0x4d0>
    3db4:	07c12683          	lw	a3,124(sp)
    3db8:	0a812483          	lw	s1,168(sp)
    3dbc:	02012e83          	lw	t4,32(sp)
    3dc0:	0ac10413          	add	s0,sp,172
    3dc4:	ce0ff06f          	j	32a4 <_vfprintf_r+0x14e0>
    3dc8:	00600c93          	li	s9,6
    3dcc:	f14ff06f          	j	34e0 <_vfprintf_r+0x171c>
    3dd0:	0ffd7d13          	zext.b	s10,s10
    3dd4:	00000c93          	li	s9,0
    3dd8:	bd5fe06f          	j	29ac <_vfprintf_r+0xbe8>
    3ddc:	0ffd7d13          	zext.b	s10,s10
    3de0:	00000c93          	li	s9,0
    3de4:	e48ff06f          	j	342c <_vfprintf_r+0x1668>
    3de8:	018d1d13          	sll	s10,s10,0x18
    3dec:	418d5d13          	sra	s10,s10,0x18
    3df0:	41fd5c93          	sra	s9,s10,0x1f
    3df4:	000c8793          	mv	a5,s9
    3df8:	b39fe06f          	j	2930 <_vfprintf_r+0xb6c>
    3dfc:	01412783          	lw	a5,20(sp)
    3e00:	00c12703          	lw	a4,12(sp)
    3e04:	0007a783          	lw	a5,0(a5)
    3e08:	00e79023          	sh	a4,0(a5)
    3e0c:	c21fe06f          	j	2a2c <_vfprintf_r+0xc68>
    3e10:	000c0513          	mv	a0,s8
    3e14:	05d12223          	sw	t4,68(sp)
    3e18:	ad8fd0ef          	jal	10f0 <strlen>
    3e1c:	07714603          	lbu	a2,119(sp)
    3e20:	fff54813          	not	a6,a0
    3e24:	41f85813          	sra	a6,a6,0x1f
    3e28:	01612a23          	sw	s6,20(sp)
    3e2c:	02012223          	sw	zero,36(sp)
    3e30:	02012023          	sw	zero,32(sp)
    3e34:	00012823          	sw	zero,16(sp)
    3e38:	04412e83          	lw	t4,68(sp)
    3e3c:	00050d13          	mv	s10,a0
    3e40:	01057cb3          	and	s9,a0,a6
    3e44:	00000313          	li	t1,0
    3e48:	07300e13          	li	t3,115
    3e4c:	00061463          	bnez	a2,3e54 <_vfprintf_r+0x2090>
    3e50:	9b4fe06f          	j	2004 <_vfprintf_r+0x240>
    3e54:	dd0fe06f          	j	2424 <_vfprintf_r+0x660>
    3e58:	00812583          	lw	a1,8(sp)
    3e5c:	0a010613          	add	a2,sp,160
    3e60:	00098513          	mv	a0,s3
    3e64:	61d000ef          	jal	4c80 <__sprint_r>
    3e68:	00051463          	bnez	a0,3e70 <_vfprintf_r+0x20ac>
    3e6c:	be8fe06f          	j	2254 <_vfprintf_r+0x490>
    3e70:	c38fe06f          	j	22a8 <_vfprintf_r+0x4e4>
    3e74:	00812583          	lw	a1,8(sp)
    3e78:	0a010613          	add	a2,sp,160
    3e7c:	00098513          	mv	a0,s3
    3e80:	03d12023          	sw	t4,32(sp)
    3e84:	5fd000ef          	jal	4c80 <__sprint_r>
    3e88:	00050463          	beqz	a0,3e90 <_vfprintf_r+0x20cc>
    3e8c:	c08fe06f          	j	2294 <_vfprintf_r+0x4d0>
    3e90:	07c12683          	lw	a3,124(sp)
    3e94:	0a812483          	lw	s1,168(sp)
    3e98:	0a412703          	lw	a4,164(sp)
    3e9c:	02012e83          	lw	t4,32(sp)
    3ea0:	0ac10413          	add	s0,sp,172
    3ea4:	c2dff06f          	j	3ad0 <_vfprintf_r+0x1d0c>
    3ea8:	05862503          	lw	a0,88(a2)
    3eac:	00f12623          	sw	a5,12(sp)
    3eb0:	fbdfc0ef          	jal	e6c <__retarget_lock_release_recursive>
    3eb4:	00c12783          	lw	a5,12(sp)
    3eb8:	ab8fe06f          	j	2170 <_vfprintf_r+0x3ac>
    3ebc:	00130a13          	add	s4,t1,1
    3ec0:	00200693          	li	a3,2
    3ec4:	02812703          	lw	a4,40(sp)
    3ec8:	09810893          	add	a7,sp,152
    3ecc:	08410813          	add	a6,sp,132
    3ed0:	00070513          	mv	a0,a4
    3ed4:	00050593          	mv	a1,a0
    3ed8:	000a0713          	mv	a4,s4
    3edc:	07c10793          	add	a5,sp,124
    3ee0:	00048613          	mv	a2,s1
    3ee4:	00098513          	mv	a0,s3
    3ee8:	02612223          	sw	t1,36(sp)
    3eec:	03c12023          	sw	t3,32(sp)
    3ef0:	01d12c23          	sw	t4,24(sp)
    3ef4:	645030ef          	jal	7d38 <_dtoa_r>
    3ef8:	02012e03          	lw	t3,32(sp)
    3efc:	04600693          	li	a3,70
    3f00:	01812e83          	lw	t4,24(sp)
    3f04:	fdfe7d13          	and	s10,t3,-33
    3f08:	02412303          	lw	t1,36(sp)
    3f0c:	00050c13          	mv	s8,a0
    3f10:	01450733          	add	a4,a0,s4
    3f14:	34dd14e3          	bne	s10,a3,4a5c <_vfprintf_r+0x2c98>
    3f18:	000c4603          	lbu	a2,0(s8)
    3f1c:	03000693          	li	a3,48
    3f20:	6cd60263          	beq	a2,a3,45e4 <_vfprintf_r+0x2820>
    3f24:	07c12683          	lw	a3,124(sp)
    3f28:	00d70733          	add	a4,a4,a3
    3f2c:	02812683          	lw	a3,40(sp)
    3f30:	00048593          	mv	a1,s1
    3f34:	00000613          	li	a2,0
    3f38:	00068513          	mv	a0,a3
    3f3c:	00000693          	li	a3,0
    3f40:	04e12823          	sw	a4,80(sp)
    3f44:	02612223          	sw	t1,36(sp)
    3f48:	03c12023          	sw	t3,32(sp)
    3f4c:	01d12c23          	sw	t4,24(sp)
    3f50:	274090ef          	jal	d1c4 <__eqdf2>
    3f54:	01812e83          	lw	t4,24(sp)
    3f58:	02012e03          	lw	t3,32(sp)
    3f5c:	02412303          	lw	t1,36(sp)
    3f60:	05012703          	lw	a4,80(sp)
    3f64:	62050863          	beqz	a0,4594 <_vfprintf_r+0x27d0>
    3f68:	09812783          	lw	a5,152(sp)
    3f6c:	00e7fe63          	bgeu	a5,a4,3f88 <_vfprintf_r+0x21c4>
    3f70:	03000613          	li	a2,48
    3f74:	00178693          	add	a3,a5,1
    3f78:	08d12c23          	sw	a3,152(sp)
    3f7c:	00c78023          	sb	a2,0(a5)
    3f80:	09812783          	lw	a5,152(sp)
    3f84:	fee7e8e3          	bltu	a5,a4,3f74 <_vfprintf_r+0x21b0>
    3f88:	07c12a03          	lw	s4,124(sp)
    3f8c:	418787b3          	sub	a5,a5,s8
    3f90:	04700713          	li	a4,71
    3f94:	00f12c23          	sw	a5,24(sp)
    3f98:	caed08e3          	beq	s10,a4,3c48 <_vfprintf_r+0x1e84>
    3f9c:	04600713          	li	a4,70
    3fa0:	68ed0863          	beq	s10,a4,4630 <_vfprintf_r+0x286c>
    3fa4:	fffa0d13          	add	s10,s4,-1
    3fa8:	cb5ff06f          	j	3c5c <_vfprintf_r+0x1e98>
    3fac:	02812703          	lw	a4,40(sp)
    3fb0:	07c10613          	add	a2,sp,124
    3fb4:	00048593          	mv	a1,s1
    3fb8:	00070513          	mv	a0,a4
    3fbc:	02612223          	sw	t1,36(sp)
    3fc0:	03c12023          	sw	t3,32(sp)
    3fc4:	01d12c23          	sw	t4,24(sp)
    3fc8:	25d030ef          	jal	7a24 <frexp>
    3fcc:	7fffc717          	auipc	a4,0x7fffc
    3fd0:	6dc70713          	add	a4,a4,1756 # 800006a8 <__global_locale+0x174>
    3fd4:	00072603          	lw	a2,0(a4)
    3fd8:	00472683          	lw	a3,4(a4)
    3fdc:	47c090ef          	jal	d458 <__muldf3>
    3fe0:	00000613          	li	a2,0
    3fe4:	00000693          	li	a3,0
    3fe8:	00050a13          	mv	s4,a0
    3fec:	00058d13          	mv	s10,a1
    3ff0:	1d4090ef          	jal	d1c4 <__eqdf2>
    3ff4:	01812e83          	lw	t4,24(sp)
    3ff8:	02012e03          	lw	t3,32(sp)
    3ffc:	02412303          	lw	t1,36(sp)
    4000:	00051663          	bnez	a0,400c <_vfprintf_r+0x2248>
    4004:	00100713          	li	a4,1
    4008:	06e12e23          	sw	a4,124(sp)
    400c:	0000b797          	auipc	a5,0xb
    4010:	f9478793          	add	a5,a5,-108 # efa0 <__fini_array_end+0x288>
    4014:	06100713          	li	a4,97
    4018:	02f12023          	sw	a5,32(sp)
    401c:	00ee1863          	bne	t3,a4,402c <_vfprintf_r+0x2268>
    4020:	0000b797          	auipc	a5,0xb
    4024:	f6c78793          	add	a5,a5,-148 # ef8c <__fini_array_end+0x274>
    4028:	02f12023          	sw	a5,32(sp)
    402c:	7fffc717          	auipc	a4,0x7fffc
    4030:	68470713          	add	a4,a4,1668 # 800006b0 <__global_locale+0x17c>
    4034:	00072783          	lw	a5,0(a4)
    4038:	00472803          	lw	a6,4(a4)
    403c:	000c0493          	mv	s1,s8
    4040:	00f12c23          	sw	a5,24(sp)
    4044:	000d0793          	mv	a5,s10
    4048:	03212223          	sw	s2,36(sp)
    404c:	000c0d13          	mv	s10,s8
    4050:	02012903          	lw	s2,32(sp)
    4054:	00098c13          	mv	s8,s3
    4058:	01012e23          	sw	a6,28(sp)
    405c:	fff30b13          	add	s6,t1,-1
    4060:	fff00c93          	li	s9,-1
    4064:	05d12023          	sw	t4,64(sp)
    4068:	05c12823          	sw	t3,80(sp)
    406c:	04812a23          	sw	s0,84(sp)
    4070:	00078993          	mv	s3,a5
    4074:	01c0006f          	j	4090 <_vfprintf_r+0x22cc>
    4078:	00000613          	li	a2,0
    407c:	00000693          	li	a3,0
    4080:	fffb0413          	add	s0,s6,-1
    4084:	140090ef          	jal	d1c4 <__eqdf2>
    4088:	0a0504e3          	beqz	a0,4930 <_vfprintf_r+0x2b6c>
    408c:	00040b13          	mv	s6,s0
    4090:	01812603          	lw	a2,24(sp)
    4094:	01c12683          	lw	a3,28(sp)
    4098:	000a0513          	mv	a0,s4
    409c:	00098593          	mv	a1,s3
    40a0:	3b8090ef          	jal	d458 <__muldf3>
    40a4:	00058a13          	mv	s4,a1
    40a8:	00050993          	mv	s3,a0
    40ac:	4980a0ef          	jal	e544 <__fixdfsi>
    40b0:	00050413          	mv	s0,a0
    40b4:	5140a0ef          	jal	e5c8 <__floatsidf>
    40b8:	00050613          	mv	a2,a0
    40bc:	00058693          	mv	a3,a1
    40c0:	00098513          	mv	a0,s3
    40c4:	000a0593          	mv	a1,s4
    40c8:	321090ef          	jal	dbe8 <__subdf3>
    40cc:	00890733          	add	a4,s2,s0
    40d0:	00074703          	lbu	a4,0(a4)
    40d4:	00048813          	mv	a6,s1
    40d8:	00050a13          	mv	s4,a0
    40dc:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    40e0:	00058993          	mv	s3,a1
    40e4:	00148493          	add	s1,s1,1
    40e8:	f99b18e3          	bne	s6,s9,4078 <_vfprintf_r+0x22b4>
    40ec:	7fffc697          	auipc	a3,0x7fffc
    40f0:	5cc68693          	add	a3,a3,1484 # 800006b8 <__global_locale+0x184>
    40f4:	0006a303          	lw	t1,0(a3)
    40f8:	0046a383          	lw	t2,4(a3)
    40fc:	05012e03          	lw	t3,80(sp)
    4100:	00030613          	mv	a2,t1
    4104:	00038693          	mv	a3,t2
    4108:	01012c23          	sw	a6,24(sp)
    410c:	02412903          	lw	s2,36(sp)
    4110:	000c0993          	mv	s3,s8
    4114:	03c12223          	sw	t3,36(sp)
    4118:	000d0c13          	mv	s8,s10
    411c:	00058d13          	mv	s10,a1
    4120:	130090ef          	jal	d250 <__gedf2>
    4124:	7fffc797          	auipc	a5,0x7fffc
    4128:	59478793          	add	a5,a5,1428 # 800006b8 <__global_locale+0x184>
    412c:	00040b13          	mv	s6,s0
    4130:	0007a303          	lw	t1,0(a5)
    4134:	05412403          	lw	s0,84(sp)
    4138:	0047a383          	lw	t2,4(a5)
    413c:	01812803          	lw	a6,24(sp)
    4140:	02412e03          	lw	t3,36(sp)
    4144:	04012e83          	lw	t4,64(sp)
    4148:	0aa05ce3          	blez	a0,4a00 <_vfprintf_r+0x2c3c>
    414c:	02012783          	lw	a5,32(sp)
    4150:	09012c23          	sw	a6,152(sp)
    4154:	fff4c603          	lbu	a2,-1(s1)
    4158:	00f7c583          	lbu	a1,15(a5)
    415c:	00048693          	mv	a3,s1
    4160:	02b61063          	bne	a2,a1,4180 <_vfprintf_r+0x23bc>
    4164:	03000513          	li	a0,48
    4168:	fea68fa3          	sb	a0,-1(a3)
    416c:	09812683          	lw	a3,152(sp)
    4170:	fff68793          	add	a5,a3,-1
    4174:	08f12c23          	sw	a5,152(sp)
    4178:	fff6c603          	lbu	a2,-1(a3)
    417c:	feb606e3          	beq	a2,a1,4168 <_vfprintf_r+0x23a4>
    4180:	00160593          	add	a1,a2,1
    4184:	03900513          	li	a0,57
    4188:	0ff5f593          	zext.b	a1,a1
    418c:	04a60463          	beq	a2,a0,41d4 <_vfprintf_r+0x2410>
    4190:	feb68fa3          	sb	a1,-1(a3)
    4194:	00048793          	mv	a5,s1
    4198:	07c12a03          	lw	s4,124(sp)
    419c:	418787b3          	sub	a5,a5,s8
    41a0:	06100613          	li	a2,97
    41a4:	fffa0d13          	add	s10,s4,-1
    41a8:	00f12c23          	sw	a5,24(sp)
    41ac:	07a12e23          	sw	s10,124(sp)
    41b0:	07000693          	li	a3,112
    41b4:	00ce0663          	beq	t3,a2,41c0 <_vfprintf_r+0x23fc>
    41b8:	05000693          	li	a3,80
    41bc:	04100e13          	li	t3,65
    41c0:	00100613          	li	a2,1
    41c4:	aa5ff06f          	j	3c68 <_vfprintf_r+0x1ea4>
    41c8:	00030a13          	mv	s4,t1
    41cc:	00300693          	li	a3,3
    41d0:	cf5ff06f          	j	3ec4 <_vfprintf_r+0x2100>
    41d4:	02012783          	lw	a5,32(sp)
    41d8:	00a7c583          	lbu	a1,10(a5)
    41dc:	feb68fa3          	sb	a1,-1(a3)
    41e0:	fb5ff06f          	j	4194 <_vfprintf_r+0x23d0>
    41e4:	02d00713          	li	a4,45
    41e8:	06e10ba3          	sb	a4,119(sp)
    41ec:	02d00613          	li	a2,45
    41f0:	00000313          	li	t1,0
    41f4:	001c8c93          	add	s9,s9,1
    41f8:	e0dfd06f          	j	2004 <_vfprintf_r+0x240>
    41fc:	01812783          	lw	a5,24(sp)
    4200:	46fa4063          	blt	s4,a5,4660 <_vfprintf_r+0x289c>
    4204:	001ef713          	and	a4,t4,1
    4208:	000a0d13          	mv	s10,s4
    420c:	00070663          	beqz	a4,4218 <_vfprintf_r+0x2454>
    4210:	03012783          	lw	a5,48(sp)
    4214:	00fa0d33          	add	s10,s4,a5
    4218:	400eff13          	and	t5,t4,1024
    421c:	000f0463          	beqz	t5,4224 <_vfprintf_r+0x2460>
    4220:	5f404e63          	bgtz	s4,481c <_vfprintf_r+0x2a58>
    4224:	fffd4813          	not	a6,s10
    4228:	41f85813          	sra	a6,a6,0x1f
    422c:	010d7cb3          	and	s9,s10,a6
    4230:	06700e13          	li	t3,103
    4234:	000b0e93          	mv	t4,s6
    4238:	02012223          	sw	zero,36(sp)
    423c:	02012023          	sw	zero,32(sp)
    4240:	b3dff06f          	j	3d7c <_vfprintf_r+0x1fb8>
    4244:	02d00793          	li	a5,45
    4248:	06f10ba3          	sb	a5,119(sp)
    424c:	02d00613          	li	a2,45
    4250:	998fe06f          	j	23e8 <_vfprintf_r+0x624>
    4254:	01812783          	lw	a5,24(sp)
    4258:	02012a03          	lw	s4,32(sp)
    425c:	05212823          	sw	s2,80(sp)
    4260:	00fc07b3          	add	a5,s8,a5
    4264:	05712c23          	sw	s7,88(sp)
    4268:	05912e23          	sw	s9,92(sp)
    426c:	00040713          	mv	a4,s0
    4270:	04f12223          	sw	a5,68(sp)
    4274:	02412403          	lw	s0,36(sp)
    4278:	05d12a23          	sw	t4,84(sp)
    427c:	03812223          	sw	s8,36(sp)
    4280:	03c12b83          	lw	s7,60(sp)
    4284:	04c12c83          	lw	s9,76(sp)
    4288:	00812903          	lw	s2,8(sp)
    428c:	00700693          	li	a3,7
    4290:	01000d13          	li	s10,16
    4294:	0000bb17          	auipc	s6,0xb
    4298:	1e0b0b13          	add	s6,s6,480 # f474 <zeroes.0>
    429c:	00048613          	mv	a2,s1
    42a0:	00030c13          	mv	s8,t1
    42a4:	09405863          	blez	s4,4334 <_vfprintf_r+0x2570>
    42a8:	16805e63          	blez	s0,4424 <_vfprintf_r+0x2660>
    42ac:	fff40413          	add	s0,s0,-1
    42b0:	04812783          	lw	a5,72(sp)
    42b4:	01960633          	add	a2,a2,s9
    42b8:	01972223          	sw	s9,4(a4)
    42bc:	00f72023          	sw	a5,0(a4)
    42c0:	0a412783          	lw	a5,164(sp)
    42c4:	0ac12423          	sw	a2,168(sp)
    42c8:	00870713          	add	a4,a4,8
    42cc:	00178793          	add	a5,a5,1
    42d0:	0af12223          	sw	a5,164(sp)
    42d4:	14f6ce63          	blt	a3,a5,4430 <_vfprintf_r+0x266c>
    42d8:	04412783          	lw	a5,68(sp)
    42dc:	000bc583          	lbu	a1,0(s7)
    42e0:	418784b3          	sub	s1,a5,s8
    42e4:	0095d463          	bge	a1,s1,42ec <_vfprintf_r+0x2528>
    42e8:	00058493          	mv	s1,a1
    42ec:	02905663          	blez	s1,4318 <_vfprintf_r+0x2554>
    42f0:	0a412583          	lw	a1,164(sp)
    42f4:	00960633          	add	a2,a2,s1
    42f8:	01872023          	sw	s8,0(a4)
    42fc:	00158593          	add	a1,a1,1
    4300:	00972223          	sw	s1,4(a4)
    4304:	0ac12423          	sw	a2,168(sp)
    4308:	0ab12223          	sw	a1,164(sp)
    430c:	14b6c663          	blt	a3,a1,4458 <_vfprintf_r+0x2694>
    4310:	000bc583          	lbu	a1,0(s7)
    4314:	00870713          	add	a4,a4,8
    4318:	fff4c513          	not	a0,s1
    431c:	41f55513          	sra	a0,a0,0x1f
    4320:	00a4f7b3          	and	a5,s1,a0
    4324:	40f584b3          	sub	s1,a1,a5
    4328:	04904663          	bgtz	s1,4374 <_vfprintf_r+0x25b0>
    432c:	00bc0c33          	add	s8,s8,a1
    4330:	f7404ce3          	bgtz	s4,42a8 <_vfprintf_r+0x24e4>
    4334:	f6804ce3          	bgtz	s0,42ac <_vfprintf_r+0x24e8>
    4338:	01812783          	lw	a5,24(sp)
    433c:	000c0313          	mv	t1,s8
    4340:	02412c03          	lw	s8,36(sp)
    4344:	03712e23          	sw	s7,60(sp)
    4348:	00070413          	mv	s0,a4
    434c:	00fc0733          	add	a4,s8,a5
    4350:	05012903          	lw	s2,80(sp)
    4354:	05412e83          	lw	t4,84(sp)
    4358:	05812b83          	lw	s7,88(sp)
    435c:	05c12c83          	lw	s9,92(sp)
    4360:	00060493          	mv	s1,a2
    4364:	00676463          	bltu	a4,t1,436c <_vfprintf_r+0x25a8>
    4368:	c59fe06f          	j	2fc0 <_vfprintf_r+0x11fc>
    436c:	00070313          	mv	t1,a4
    4370:	c51fe06f          	j	2fc0 <_vfprintf_r+0x11fc>
    4374:	0a412583          	lw	a1,164(sp)
    4378:	0000be97          	auipc	t4,0xb
    437c:	0fce8e93          	add	t4,t4,252 # f474 <zeroes.0>
    4380:	069d5c63          	bge	s10,s1,43f8 <_vfprintf_r+0x2634>
    4384:	02812023          	sw	s0,32(sp)
    4388:	00048413          	mv	s0,s1
    438c:	000b0493          	mv	s1,s6
    4390:	00c0006f          	j	439c <_vfprintf_r+0x25d8>
    4394:	ff040413          	add	s0,s0,-16
    4398:	048d5a63          	bge	s10,s0,43ec <_vfprintf_r+0x2628>
    439c:	01060613          	add	a2,a2,16
    43a0:	00158593          	add	a1,a1,1
    43a4:	01672023          	sw	s6,0(a4)
    43a8:	01a72223          	sw	s10,4(a4)
    43ac:	0ac12423          	sw	a2,168(sp)
    43b0:	0ab12223          	sw	a1,164(sp)
    43b4:	00870713          	add	a4,a4,8
    43b8:	fcb6dee3          	bge	a3,a1,4394 <_vfprintf_r+0x25d0>
    43bc:	0a010613          	add	a2,sp,160
    43c0:	00090593          	mv	a1,s2
    43c4:	00098513          	mv	a0,s3
    43c8:	0b9000ef          	jal	4c80 <__sprint_r>
    43cc:	00050463          	beqz	a0,43d4 <_vfprintf_r+0x2610>
    43d0:	ec5fd06f          	j	2294 <_vfprintf_r+0x4d0>
    43d4:	ff040413          	add	s0,s0,-16
    43d8:	0a812603          	lw	a2,168(sp)
    43dc:	0a412583          	lw	a1,164(sp)
    43e0:	0ac10713          	add	a4,sp,172
    43e4:	00700693          	li	a3,7
    43e8:	fa8d4ae3          	blt	s10,s0,439c <_vfprintf_r+0x25d8>
    43ec:	00048e93          	mv	t4,s1
    43f0:	00040493          	mv	s1,s0
    43f4:	02012403          	lw	s0,32(sp)
    43f8:	00960633          	add	a2,a2,s1
    43fc:	00158593          	add	a1,a1,1
    4400:	01d72023          	sw	t4,0(a4)
    4404:	00972223          	sw	s1,4(a4)
    4408:	0ac12423          	sw	a2,168(sp)
    440c:	0ab12223          	sw	a1,164(sp)
    4410:	10b6ce63          	blt	a3,a1,452c <_vfprintf_r+0x2768>
    4414:	000bc583          	lbu	a1,0(s7)
    4418:	00870713          	add	a4,a4,8
    441c:	00bc0c33          	add	s8,s8,a1
    4420:	f11ff06f          	j	4330 <_vfprintf_r+0x256c>
    4424:	fffb8b93          	add	s7,s7,-1
    4428:	fffa0a13          	add	s4,s4,-1
    442c:	e85ff06f          	j	42b0 <_vfprintf_r+0x24ec>
    4430:	0a010613          	add	a2,sp,160
    4434:	00090593          	mv	a1,s2
    4438:	00098513          	mv	a0,s3
    443c:	045000ef          	jal	4c80 <__sprint_r>
    4440:	00050463          	beqz	a0,4448 <_vfprintf_r+0x2684>
    4444:	e51fd06f          	j	2294 <_vfprintf_r+0x4d0>
    4448:	0a812603          	lw	a2,168(sp)
    444c:	0ac10713          	add	a4,sp,172
    4450:	00700693          	li	a3,7
    4454:	e85ff06f          	j	42d8 <_vfprintf_r+0x2514>
    4458:	0a010613          	add	a2,sp,160
    445c:	00090593          	mv	a1,s2
    4460:	00098513          	mv	a0,s3
    4464:	01d000ef          	jal	4c80 <__sprint_r>
    4468:	00050463          	beqz	a0,4470 <_vfprintf_r+0x26ac>
    446c:	e29fd06f          	j	2294 <_vfprintf_r+0x4d0>
    4470:	000bc583          	lbu	a1,0(s7)
    4474:	0a812603          	lw	a2,168(sp)
    4478:	0ac10713          	add	a4,sp,172
    447c:	00700693          	li	a3,7
    4480:	e99ff06f          	j	4318 <_vfprintf_r+0x2554>
    4484:	04c12783          	lw	a5,76(sp)
    4488:	04812583          	lw	a1,72(sp)
    448c:	00000913          	li	s2,0
    4490:	40fc0c33          	sub	s8,s8,a5
    4494:	00078613          	mv	a2,a5
    4498:	000c0513          	mv	a0,s8
    449c:	1dc030ef          	jal	7678 <strncpy>
    44a0:	00144783          	lbu	a5,1(s0)
    44a4:	00a00613          	li	a2,10
    44a8:	00000693          	li	a3,0
    44ac:	00f037b3          	snez	a5,a5
    44b0:	000d0513          	mv	a0,s10
    44b4:	000c8593          	mv	a1,s9
    44b8:	00f40433          	add	s0,s0,a5
    44bc:	691060ef          	jal	b34c <__udivdi3>
    44c0:	a10ff06f          	j	36d0 <_vfprintf_r+0x190c>
    44c4:	09810713          	add	a4,sp,152
    44c8:	00000693          	li	a3,0
    44cc:	08410613          	add	a2,sp,132
    44d0:	00000593          	li	a1,0
    44d4:	00098513          	mv	a0,s3
    44d8:	01c12a23          	sw	t3,20(sp)
    44dc:	01d12823          	sw	t4,16(sp)
    44e0:	38c060ef          	jal	a86c <_wcsrtombs_r>
    44e4:	fff00713          	li	a4,-1
    44e8:	01012e83          	lw	t4,16(sp)
    44ec:	01412e03          	lw	t3,20(sp)
    44f0:	00050d13          	mv	s10,a0
    44f4:	30e50063          	beq	a0,a4,47f4 <_vfprintf_r+0x2a30>
    44f8:	09812223          	sw	s8,132(sp)
    44fc:	cacff06f          	j	39a8 <_vfprintf_r+0x1be4>
    4500:	07714603          	lbu	a2,119(sp)
    4504:	01612a23          	sw	s6,20(sp)
    4508:	02012223          	sw	zero,36(sp)
    450c:	02012023          	sw	zero,32(sp)
    4510:	00012823          	sw	zero,16(sp)
    4514:	00000c93          	li	s9,0
    4518:	00000313          	li	t1,0
    451c:	00000a13          	li	s4,0
    4520:	00061463          	bnez	a2,4528 <_vfprintf_r+0x2764>
    4524:	ae1fd06f          	j	2004 <_vfprintf_r+0x240>
    4528:	efdfd06f          	j	2424 <_vfprintf_r+0x660>
    452c:	0a010613          	add	a2,sp,160
    4530:	00090593          	mv	a1,s2
    4534:	00098513          	mv	a0,s3
    4538:	748000ef          	jal	4c80 <__sprint_r>
    453c:	00050463          	beqz	a0,4544 <_vfprintf_r+0x2780>
    4540:	d55fd06f          	j	2294 <_vfprintf_r+0x4d0>
    4544:	000bc583          	lbu	a1,0(s7)
    4548:	0a812603          	lw	a2,168(sp)
    454c:	0ac10713          	add	a4,sp,172
    4550:	00700693          	li	a3,7
    4554:	00bc0c33          	add	s8,s8,a1
    4558:	dd9ff06f          	j	4330 <_vfprintf_r+0x256c>
    455c:	00812583          	lw	a1,8(sp)
    4560:	0a010613          	add	a2,sp,160
    4564:	00098513          	mv	a0,s3
    4568:	05d12223          	sw	t4,68(sp)
    456c:	714000ef          	jal	4c80 <__sprint_r>
    4570:	00050463          	beqz	a0,4578 <_vfprintf_r+0x27b4>
    4574:	d21fd06f          	j	2294 <_vfprintf_r+0x4d0>
    4578:	0a812483          	lw	s1,168(sp)
    457c:	04412e83          	lw	t4,68(sp)
    4580:	0ac10413          	add	s0,sp,172
    4584:	a19fe06f          	j	2f9c <_vfprintf_r+0x11d8>
    4588:	00900793          	li	a5,9
    458c:	95a7e263          	bltu	a5,s10,36d0 <_vfprintf_r+0x190c>
    4590:	98cff06f          	j	371c <_vfprintf_r+0x1958>
    4594:	07c12a03          	lw	s4,124(sp)
    4598:	00070793          	mv	a5,a4
    459c:	9f1ff06f          	j	3f8c <_vfprintf_r+0x21c8>
    45a0:	00812583          	lw	a1,8(sp)
    45a4:	0a010613          	add	a2,sp,160
    45a8:	00098513          	mv	a0,s3
    45ac:	03d12023          	sw	t4,32(sp)
    45b0:	6d0000ef          	jal	4c80 <__sprint_r>
    45b4:	00050463          	beqz	a0,45bc <_vfprintf_r+0x27f8>
    45b8:	cddfd06f          	j	2294 <_vfprintf_r+0x4d0>
    45bc:	07c12d03          	lw	s10,124(sp)
    45c0:	01812783          	lw	a5,24(sp)
    45c4:	0a812483          	lw	s1,168(sp)
    45c8:	02012e83          	lw	t4,32(sp)
    45cc:	0ac10413          	add	s0,sp,172
    45d0:	41a78d33          	sub	s10,a5,s10
    45d4:	a49fe06f          	j	301c <_vfprintf_r+0x1258>
    45d8:	00650733          	add	a4,a0,t1
    45dc:	04700d13          	li	s10,71
    45e0:	94dff06f          	j	3f2c <_vfprintf_r+0x2168>
    45e4:	02812603          	lw	a2,40(sp)
    45e8:	00048593          	mv	a1,s1
    45ec:	00000693          	li	a3,0
    45f0:	00060513          	mv	a0,a2
    45f4:	00000613          	li	a2,0
    45f8:	04e12823          	sw	a4,80(sp)
    45fc:	02612223          	sw	t1,36(sp)
    4600:	03c12023          	sw	t3,32(sp)
    4604:	01d12c23          	sw	t4,24(sp)
    4608:	3bd080ef          	jal	d1c4 <__eqdf2>
    460c:	01812e83          	lw	t4,24(sp)
    4610:	02012e03          	lw	t3,32(sp)
    4614:	02412303          	lw	t1,36(sp)
    4618:	05012703          	lw	a4,80(sp)
    461c:	34051e63          	bnez	a0,4978 <_vfprintf_r+0x2bb4>
    4620:	07c12a03          	lw	s4,124(sp)
    4624:	01470733          	add	a4,a4,s4
    4628:	418707b3          	sub	a5,a4,s8
    462c:	00f12c23          	sw	a5,24(sp)
    4630:	001ef713          	and	a4,t4,1
    4634:	00676733          	or	a4,a4,t1
    4638:	37405a63          	blez	s4,49ac <_vfprintf_r+0x2be8>
    463c:	26071263          	bnez	a4,48a0 <_vfprintf_r+0x2adc>
    4640:	000a0d13          	mv	s10,s4
    4644:	06600e13          	li	t3,102
    4648:	400eff13          	and	t5,t4,1024
    464c:	1c0f1a63          	bnez	t5,4820 <_vfprintf_r+0x2a5c>
    4650:	fffd4813          	not	a6,s10
    4654:	41f85813          	sra	a6,a6,0x1f
    4658:	010d7cb3          	and	s9,s10,a6
    465c:	bd9ff06f          	j	4234 <_vfprintf_r+0x2470>
    4660:	01812783          	lw	a5,24(sp)
    4664:	03012703          	lw	a4,48(sp)
    4668:	06700e13          	li	t3,103
    466c:	00e78d33          	add	s10,a5,a4
    4670:	fd404ce3          	bgtz	s4,4648 <_vfprintf_r+0x2884>
    4674:	414d06b3          	sub	a3,s10,s4
    4678:	00168d13          	add	s10,a3,1
    467c:	fffd4813          	not	a6,s10
    4680:	41f85813          	sra	a6,a6,0x1f
    4684:	010d7cb3          	and	s9,s10,a6
    4688:	badff06f          	j	4234 <_vfprintf_r+0x2470>
    468c:	000e8613          	mv	a2,t4
    4690:	ad8fe06f          	j	2968 <_vfprintf_r+0xba4>
    4694:	00812783          	lw	a5,8(sp)
    4698:	0647a783          	lw	a5,100(a5)
    469c:	0017f793          	and	a5,a5,1
    46a0:	02079063          	bnez	a5,46c0 <_vfprintf_r+0x28fc>
    46a4:	00812783          	lw	a5,8(sp)
    46a8:	00c7d783          	lhu	a5,12(a5)
    46ac:	2007f793          	and	a5,a5,512
    46b0:	00079863          	bnez	a5,46c0 <_vfprintf_r+0x28fc>
    46b4:	00812783          	lw	a5,8(sp)
    46b8:	0587a503          	lw	a0,88(a5)
    46bc:	fb0fc0ef          	jal	e6c <__retarget_lock_release_recursive>
    46c0:	fff00793          	li	a5,-1
    46c4:	00f12623          	sw	a5,12(sp)
    46c8:	c2dfd06f          	j	22f4 <_vfprintf_r+0x530>
    46cc:	ff000613          	li	a2,-16
    46d0:	40d00d33          	neg	s10,a3
    46d4:	0000b297          	auipc	t0,0xb
    46d8:	da028293          	add	t0,t0,-608 # f474 <zeroes.0>
    46dc:	08c6d463          	bge	a3,a2,4764 <_vfprintf_r+0x29a0>
    46e0:	03212023          	sw	s2,32(sp)
    46e4:	01000693          	li	a3,16
    46e8:	00700b13          	li	s6,7
    46ec:	000e8a13          	mv	s4,t4
    46f0:	00028913          	mv	s2,t0
    46f4:	00c0006f          	j	4700 <_vfprintf_r+0x293c>
    46f8:	ff0d0d13          	add	s10,s10,-16
    46fc:	05a6de63          	bge	a3,s10,4758 <_vfprintf_r+0x2994>
    4700:	01048493          	add	s1,s1,16
    4704:	00170713          	add	a4,a4,1
    4708:	01242023          	sw	s2,0(s0)
    470c:	00d42223          	sw	a3,4(s0)
    4710:	0a912423          	sw	s1,168(sp)
    4714:	0ae12223          	sw	a4,164(sp)
    4718:	00840413          	add	s0,s0,8
    471c:	fceb5ee3          	bge	s6,a4,46f8 <_vfprintf_r+0x2934>
    4720:	00812583          	lw	a1,8(sp)
    4724:	0a010613          	add	a2,sp,160
    4728:	00098513          	mv	a0,s3
    472c:	554000ef          	jal	4c80 <__sprint_r>
    4730:	00050463          	beqz	a0,4738 <_vfprintf_r+0x2974>
    4734:	b61fd06f          	j	2294 <_vfprintf_r+0x4d0>
    4738:	0a812483          	lw	s1,168(sp)
    473c:	0a412703          	lw	a4,164(sp)
    4740:	0ac10413          	add	s0,sp,172
    4744:	01000693          	li	a3,16
    4748:	fb1ff06f          	j	46f8 <_vfprintf_r+0x2934>
    474c:	00012823          	sw	zero,16(sp)
    4750:	0ec10c13          	add	s8,sp,236
    4754:	a88ff06f          	j	39dc <_vfprintf_r+0x1c18>
    4758:	00090293          	mv	t0,s2
    475c:	02012903          	lw	s2,32(sp)
    4760:	000a0e93          	mv	t4,s4
    4764:	01a484b3          	add	s1,s1,s10
    4768:	00170713          	add	a4,a4,1
    476c:	00542023          	sw	t0,0(s0)
    4770:	01a42223          	sw	s10,4(s0)
    4774:	0a912423          	sw	s1,168(sp)
    4778:	0ae12223          	sw	a4,164(sp)
    477c:	00700693          	li	a3,7
    4780:	00e6c463          	blt	a3,a4,4788 <_vfprintf_r+0x29c4>
    4784:	b65fe06f          	j	32e8 <_vfprintf_r+0x1524>
    4788:	00812583          	lw	a1,8(sp)
    478c:	0a010613          	add	a2,sp,160
    4790:	00098513          	mv	a0,s3
    4794:	03d12023          	sw	t4,32(sp)
    4798:	4e8000ef          	jal	4c80 <__sprint_r>
    479c:	00050463          	beqz	a0,47a4 <_vfprintf_r+0x29e0>
    47a0:	af5fd06f          	j	2294 <_vfprintf_r+0x4d0>
    47a4:	0a812483          	lw	s1,168(sp)
    47a8:	0a412703          	lw	a4,164(sp)
    47ac:	02012e83          	lw	t4,32(sp)
    47b0:	0ac10413          	add	s0,sp,172
    47b4:	b20ff06f          	j	3ad4 <_vfprintf_r+0x1d10>
    47b8:	08a10693          	add	a3,sp,138
    47bc:	00061863          	bnez	a2,47cc <_vfprintf_r+0x2a08>
    47c0:	03000693          	li	a3,48
    47c4:	08d10523          	sb	a3,138(sp)
    47c8:	08b10693          	add	a3,sp,139
    47cc:	15010793          	add	a5,sp,336
    47d0:	40f68633          	sub	a2,a3,a5
    47d4:	030d0713          	add	a4,s10,48
    47d8:	0c960793          	add	a5,a2,201
    47dc:	00e68023          	sb	a4,0(a3)
    47e0:	04f12023          	sw	a5,64(sp)
    47e4:	d5cff06f          	j	3d40 <_vfprintf_r+0x1f7c>
    47e8:	001ef713          	and	a4,t4,1
    47ec:	d6070863          	beqz	a4,3d5c <_vfprintf_r+0x1f98>
    47f0:	d64ff06f          	j	3d54 <_vfprintf_r+0x1f90>
    47f4:	00812783          	lw	a5,8(sp)
    47f8:	00000293          	li	t0,0
    47fc:	00c79783          	lh	a5,12(a5)
    4800:	0407e793          	or	a5,a5,64
    4804:	00812703          	lw	a4,8(sp)
    4808:	00f71623          	sh	a5,12(a4)
    480c:	a8dfd06f          	j	2298 <_vfprintf_r+0x4d4>
    4810:	00012823          	sw	zero,16(sp)
    4814:	00600313          	li	t1,6
    4818:	ff9fe06f          	j	3810 <_vfprintf_r+0x1a4c>
    481c:	06700e13          	li	t3,103
    4820:	03c12783          	lw	a5,60(sp)
    4824:	0ff00613          	li	a2,255
    4828:	0007c703          	lbu	a4,0(a5)
    482c:	22c70263          	beq	a4,a2,4a50 <_vfprintf_r+0x2c8c>
    4830:	00000593          	li	a1,0
    4834:	00000693          	li	a3,0
    4838:	01475e63          	bge	a4,s4,4854 <_vfprintf_r+0x2a90>
    483c:	40ea0a33          	sub	s4,s4,a4
    4840:	0017c703          	lbu	a4,1(a5)
    4844:	04070863          	beqz	a4,4894 <_vfprintf_r+0x2ad0>
    4848:	00168693          	add	a3,a3,1
    484c:	00178793          	add	a5,a5,1
    4850:	fec714e3          	bne	a4,a2,4838 <_vfprintf_r+0x2a74>
    4854:	02f12e23          	sw	a5,60(sp)
    4858:	02d12023          	sw	a3,32(sp)
    485c:	02b12223          	sw	a1,36(sp)
    4860:	02012783          	lw	a5,32(sp)
    4864:	02412703          	lw	a4,36(sp)
    4868:	04c12583          	lw	a1,76(sp)
    486c:	05c12823          	sw	t3,80(sp)
    4870:	00e78533          	add	a0,a5,a4
    4874:	2ac0a0ef          	jal	eb20 <__mulsi3>
    4878:	01a50d33          	add	s10,a0,s10
    487c:	fffd4813          	not	a6,s10
    4880:	41f85813          	sra	a6,a6,0x1f
    4884:	05012e03          	lw	t3,80(sp)
    4888:	010d7cb3          	and	s9,s10,a6
    488c:	000b0e93          	mv	t4,s6
    4890:	cecff06f          	j	3d7c <_vfprintf_r+0x1fb8>
    4894:	0007c703          	lbu	a4,0(a5)
    4898:	00158593          	add	a1,a1,1
    489c:	fb5ff06f          	j	4850 <_vfprintf_r+0x2a8c>
    48a0:	03012783          	lw	a5,48(sp)
    48a4:	06600e13          	li	t3,102
    48a8:	00f306b3          	add	a3,t1,a5
    48ac:	01468d33          	add	s10,a3,s4
    48b0:	d99ff06f          	j	4648 <_vfprintf_r+0x2884>
    48b4:	02c12783          	lw	a5,44(sp)
    48b8:	0a07c863          	bltz	a5,4968 <_vfprintf_r+0x2ba4>
    48bc:	07714603          	lbu	a2,119(sp)
    48c0:	04700713          	li	a4,71
    48c4:	0000ac17          	auipc	s8,0xa
    48c8:	6c4c0c13          	add	s8,s8,1732 # ef88 <__fini_array_end+0x270>
    48cc:	01c75463          	bge	a4,t3,48d4 <_vfprintf_r+0x2b10>
    48d0:	b31fd06f          	j	2400 <_vfprintf_r+0x63c>
    48d4:	0000ac17          	auipc	s8,0xa
    48d8:	6b0c0c13          	add	s8,s8,1712 # ef84 <__fini_array_end+0x26c>
    48dc:	b25fd06f          	j	2400 <_vfprintf_r+0x63c>
    48e0:	07714603          	lbu	a2,119(sp)
    48e4:	01612a23          	sw	s6,20(sp)
    48e8:	02012223          	sw	zero,36(sp)
    48ec:	02012023          	sw	zero,32(sp)
    48f0:	00030c93          	mv	s9,t1
    48f4:	00030d13          	mv	s10,t1
    48f8:	07300e13          	li	t3,115
    48fc:	00000313          	li	t1,0
    4900:	00061463          	bnez	a2,4908 <_vfprintf_r+0x2b44>
    4904:	f00fd06f          	j	2004 <_vfprintf_r+0x240>
    4908:	b1dfd06f          	j	2424 <_vfprintf_r+0x660>
    490c:	00040313          	mv	t1,s0
    4910:	01012903          	lw	s2,16(sp)
    4914:	000b0413          	mv	s0,s6
    4918:	01412e03          	lw	t3,20(sp)
    491c:	000c0b13          	mv	s6,s8
    4920:	000a0e93          	mv	t4,s4
    4924:	000c8c13          	mv	s8,s9
    4928:	00030d13          	mv	s10,t1
    492c:	87cff06f          	j	39a8 <_vfprintf_r+0x1be4>
    4930:	001b0793          	add	a5,s6,1
    4934:	000c0993          	mv	s3,s8
    4938:	02412903          	lw	s2,36(sp)
    493c:	04012e83          	lw	t4,64(sp)
    4940:	05012e03          	lw	t3,80(sp)
    4944:	05412403          	lw	s0,84(sp)
    4948:	000d0c13          	mv	s8,s10
    494c:	00f487b3          	add	a5,s1,a5
    4950:	03000693          	li	a3,48
    4954:	840b40e3          	bltz	s6,4194 <_vfprintf_r+0x23d0>
    4958:	00148493          	add	s1,s1,1
    495c:	fed48fa3          	sb	a3,-1(s1)
    4960:	fe979ce3          	bne	a5,s1,4958 <_vfprintf_r+0x2b94>
    4964:	835ff06f          	j	4198 <_vfprintf_r+0x23d4>
    4968:	02d00793          	li	a5,45
    496c:	06f10ba3          	sb	a5,119(sp)
    4970:	02d00613          	li	a2,45
    4974:	f4dff06f          	j	48c0 <_vfprintf_r+0x2afc>
    4978:	00100693          	li	a3,1
    497c:	414686b3          	sub	a3,a3,s4
    4980:	06d12e23          	sw	a3,124(sp)
    4984:	da4ff06f          	j	3f28 <_vfprintf_r+0x2164>
    4988:	01412783          	lw	a5,20(sp)
    498c:	0007ab03          	lw	s6,0(a5)
    4990:	00478793          	add	a5,a5,4
    4994:	000b5463          	bgez	s6,499c <_vfprintf_r+0x2bd8>
    4998:	fff00b13          	li	s6,-1
    499c:	00194e03          	lbu	t3,1(s2)
    49a0:	00f12a23          	sw	a5,20(sp)
    49a4:	00068913          	mv	s2,a3
    49a8:	dccfd06f          	j	1f74 <_vfprintf_r+0x1b0>
    49ac:	00071a63          	bnez	a4,49c0 <_vfprintf_r+0x2bfc>
    49b0:	00100c93          	li	s9,1
    49b4:	06600e13          	li	t3,102
    49b8:	00100d13          	li	s10,1
    49bc:	879ff06f          	j	4234 <_vfprintf_r+0x2470>
    49c0:	03012783          	lw	a5,48(sp)
    49c4:	06600e13          	li	t3,102
    49c8:	00178693          	add	a3,a5,1
    49cc:	00668d33          	add	s10,a3,t1
    49d0:	fffd4813          	not	a6,s10
    49d4:	41f85813          	sra	a6,a6,0x1f
    49d8:	010d7cb3          	and	s9,s10,a6
    49dc:	859ff06f          	j	4234 <_vfprintf_r+0x2470>
    49e0:	00200793          	li	a5,2
    49e4:	04f12023          	sw	a5,64(sp)
    49e8:	b58ff06f          	j	3d40 <_vfprintf_r+0x1f7c>
    49ec:	00812703          	lw	a4,8(sp)
    49f0:	00c71783          	lh	a5,12(a4)
    49f4:	0407e793          	or	a5,a5,64
    49f8:	00f71623          	sh	a5,12(a4)
    49fc:	8b5fd06f          	j	22b0 <_vfprintf_r+0x4ec>
    4a00:	000a0513          	mv	a0,s4
    4a04:	000d0593          	mv	a1,s10
    4a08:	00030613          	mv	a2,t1
    4a0c:	00038693          	mv	a3,t2
    4a10:	05012023          	sw	a6,64(sp)
    4a14:	03c12223          	sw	t3,36(sp)
    4a18:	01d12c23          	sw	t4,24(sp)
    4a1c:	7a8080ef          	jal	d1c4 <__eqdf2>
    4a20:	01812e83          	lw	t4,24(sp)
    4a24:	02412e03          	lw	t3,36(sp)
    4a28:	04012803          	lw	a6,64(sp)
    4a2c:	f6051463          	bnez	a0,4194 <_vfprintf_r+0x23d0>
    4a30:	001b7693          	and	a3,s6,1
    4a34:	f6068063          	beqz	a3,4194 <_vfprintf_r+0x23d0>
    4a38:	f14ff06f          	j	414c <_vfprintf_r+0x2388>
    4a3c:	00812783          	lw	a5,8(sp)
    4a40:	01012283          	lw	t0,16(sp)
    4a44:	00c79783          	lh	a5,12(a5)
    4a48:	0407e793          	or	a5,a5,64
    4a4c:	db9ff06f          	j	4804 <_vfprintf_r+0x2a40>
    4a50:	02012223          	sw	zero,36(sp)
    4a54:	02012023          	sw	zero,32(sp)
    4a58:	e09ff06f          	j	4860 <_vfprintf_r+0x2a9c>
    4a5c:	04500d13          	li	s10,69
    4a60:	cccff06f          	j	3f2c <_vfprintf_r+0x2168>

00004a64 <__sbprintf>:
    4a64:	b7010113          	add	sp,sp,-1168
    4a68:	00c59783          	lh	a5,12(a1)
    4a6c:	00e5d703          	lhu	a4,14(a1)
    4a70:	48812423          	sw	s0,1160(sp)
    4a74:	00058413          	mv	s0,a1
    4a78:	000105b7          	lui	a1,0x10
    4a7c:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x79d>
    4a80:	06442303          	lw	t1,100(s0)
    4a84:	01c42883          	lw	a7,28(s0)
    4a88:	02442803          	lw	a6,36(s0)
    4a8c:	01071713          	sll	a4,a4,0x10
    4a90:	00b7f7b3          	and	a5,a5,a1
    4a94:	00e7e7b3          	or	a5,a5,a4
    4a98:	40000593          	li	a1,1024
    4a9c:	49212023          	sw	s2,1152(sp)
    4aa0:	00f12a23          	sw	a5,20(sp)
    4aa4:	00050913          	mv	s2,a0
    4aa8:	07010793          	add	a5,sp,112
    4aac:	06010513          	add	a0,sp,96
    4ab0:	48112623          	sw	ra,1164(sp)
    4ab4:	48912223          	sw	s1,1156(sp)
    4ab8:	47312e23          	sw	s3,1148(sp)
    4abc:	00060493          	mv	s1,a2
    4ac0:	00068993          	mv	s3,a3
    4ac4:	06612623          	sw	t1,108(sp)
    4ac8:	03112223          	sw	a7,36(sp)
    4acc:	03012623          	sw	a6,44(sp)
    4ad0:	00f12423          	sw	a5,8(sp)
    4ad4:	00f12c23          	sw	a5,24(sp)
    4ad8:	00b12823          	sw	a1,16(sp)
    4adc:	00b12e23          	sw	a1,28(sp)
    4ae0:	02012023          	sw	zero,32(sp)
    4ae4:	b7cfc0ef          	jal	e60 <__retarget_lock_init_recursive>
    4ae8:	00048613          	mv	a2,s1
    4aec:	00098693          	mv	a3,s3
    4af0:	00810593          	add	a1,sp,8
    4af4:	00090513          	mv	a0,s2
    4af8:	accfd0ef          	jal	1dc4 <_vfprintf_r>
    4afc:	00050493          	mv	s1,a0
    4b00:	04055263          	bgez	a0,4b44 <__sbprintf+0xe0>
    4b04:	01415783          	lhu	a5,20(sp)
    4b08:	0407f793          	and	a5,a5,64
    4b0c:	00078863          	beqz	a5,4b1c <__sbprintf+0xb8>
    4b10:	00c45783          	lhu	a5,12(s0)
    4b14:	0407e793          	or	a5,a5,64
    4b18:	00f41623          	sh	a5,12(s0)
    4b1c:	06012503          	lw	a0,96(sp)
    4b20:	b44fc0ef          	jal	e64 <__retarget_lock_close_recursive>
    4b24:	48c12083          	lw	ra,1164(sp)
    4b28:	48812403          	lw	s0,1160(sp)
    4b2c:	48012903          	lw	s2,1152(sp)
    4b30:	47c12983          	lw	s3,1148(sp)
    4b34:	00048513          	mv	a0,s1
    4b38:	48412483          	lw	s1,1156(sp)
    4b3c:	49010113          	add	sp,sp,1168
    4b40:	00008067          	ret
    4b44:	00810593          	add	a1,sp,8
    4b48:	00090513          	mv	a0,s2
    4b4c:	449010ef          	jal	6794 <_fflush_r>
    4b50:	fa050ae3          	beqz	a0,4b04 <__sbprintf+0xa0>
    4b54:	fff00493          	li	s1,-1
    4b58:	fadff06f          	j	4b04 <__sbprintf+0xa0>

00004b5c <__sprint_r.part.0>:
    4b5c:	0645a783          	lw	a5,100(a1)
    4b60:	fd010113          	add	sp,sp,-48
    4b64:	01612823          	sw	s6,16(sp)
    4b68:	02112623          	sw	ra,44(sp)
    4b6c:	01279713          	sll	a4,a5,0x12
    4b70:	00060b13          	mv	s6,a2
    4b74:	0e075863          	bgez	a4,4c64 <__sprint_r.part.0+0x108>
    4b78:	00862783          	lw	a5,8(a2)
    4b7c:	03212023          	sw	s2,32(sp)
    4b80:	01312e23          	sw	s3,28(sp)
    4b84:	01512a23          	sw	s5,20(sp)
    4b88:	01712623          	sw	s7,12(sp)
    4b8c:	00058913          	mv	s2,a1
    4b90:	00062b83          	lw	s7,0(a2)
    4b94:	00050993          	mv	s3,a0
    4b98:	fff00a93          	li	s5,-1
    4b9c:	0a078863          	beqz	a5,4c4c <__sprint_r.part.0+0xf0>
    4ba0:	02812423          	sw	s0,40(sp)
    4ba4:	02912223          	sw	s1,36(sp)
    4ba8:	01412c23          	sw	s4,24(sp)
    4bac:	01812423          	sw	s8,8(sp)
    4bb0:	004bac03          	lw	s8,4(s7)
    4bb4:	000ba403          	lw	s0,0(s7)
    4bb8:	002c5a13          	srl	s4,s8,0x2
    4bbc:	060a0663          	beqz	s4,4c28 <__sprint_r.part.0+0xcc>
    4bc0:	00000493          	li	s1,0
    4bc4:	00c0006f          	j	4bd0 <__sprint_r.part.0+0x74>
    4bc8:	00440413          	add	s0,s0,4
    4bcc:	049a0c63          	beq	s4,s1,4c24 <__sprint_r.part.0+0xc8>
    4bd0:	00042583          	lw	a1,0(s0)
    4bd4:	00090613          	mv	a2,s2
    4bd8:	00098513          	mv	a0,s3
    4bdc:	10d020ef          	jal	74e8 <_fputwc_r>
    4be0:	00148493          	add	s1,s1,1
    4be4:	ff5512e3          	bne	a0,s5,4bc8 <__sprint_r.part.0+0x6c>
    4be8:	02812403          	lw	s0,40(sp)
    4bec:	02412483          	lw	s1,36(sp)
    4bf0:	02012903          	lw	s2,32(sp)
    4bf4:	01c12983          	lw	s3,28(sp)
    4bf8:	01812a03          	lw	s4,24(sp)
    4bfc:	01412a83          	lw	s5,20(sp)
    4c00:	00c12b83          	lw	s7,12(sp)
    4c04:	00812c03          	lw	s8,8(sp)
    4c08:	fff00513          	li	a0,-1
    4c0c:	02c12083          	lw	ra,44(sp)
    4c10:	000b2423          	sw	zero,8(s6)
    4c14:	000b2223          	sw	zero,4(s6)
    4c18:	01012b03          	lw	s6,16(sp)
    4c1c:	03010113          	add	sp,sp,48
    4c20:	00008067          	ret
    4c24:	008b2783          	lw	a5,8(s6)
    4c28:	ffcc7c13          	and	s8,s8,-4
    4c2c:	418787b3          	sub	a5,a5,s8
    4c30:	00fb2423          	sw	a5,8(s6)
    4c34:	008b8b93          	add	s7,s7,8
    4c38:	f6079ce3          	bnez	a5,4bb0 <__sprint_r.part.0+0x54>
    4c3c:	02812403          	lw	s0,40(sp)
    4c40:	02412483          	lw	s1,36(sp)
    4c44:	01812a03          	lw	s4,24(sp)
    4c48:	00812c03          	lw	s8,8(sp)
    4c4c:	02012903          	lw	s2,32(sp)
    4c50:	01c12983          	lw	s3,28(sp)
    4c54:	01412a83          	lw	s5,20(sp)
    4c58:	00c12b83          	lw	s7,12(sp)
    4c5c:	00000513          	li	a0,0
    4c60:	fadff06f          	j	4c0c <__sprint_r.part.0+0xb0>
    4c64:	6b5010ef          	jal	6b18 <__sfvwrite_r>
    4c68:	02c12083          	lw	ra,44(sp)
    4c6c:	000b2423          	sw	zero,8(s6)
    4c70:	000b2223          	sw	zero,4(s6)
    4c74:	01012b03          	lw	s6,16(sp)
    4c78:	03010113          	add	sp,sp,48
    4c7c:	00008067          	ret

00004c80 <__sprint_r>:
    4c80:	00862703          	lw	a4,8(a2)
    4c84:	00070463          	beqz	a4,4c8c <__sprint_r+0xc>
    4c88:	ed5ff06f          	j	4b5c <__sprint_r.part.0>
    4c8c:	00062223          	sw	zero,4(a2)
    4c90:	00000513          	li	a0,0
    4c94:	00008067          	ret

00004c98 <_vfiprintf_r>:
    4c98:	eb010113          	add	sp,sp,-336
    4c9c:	14812423          	sw	s0,328(sp)
    4ca0:	13312e23          	sw	s3,316(sp)
    4ca4:	13812423          	sw	s8,296(sp)
    4ca8:	00050413          	mv	s0,a0
    4cac:	00058993          	mv	s3,a1
    4cb0:	00060c13          	mv	s8,a2
    4cb4:	00000593          	li	a1,0
    4cb8:	00800613          	li	a2,8
    4cbc:	05010513          	add	a0,sp,80
    4cc0:	13512a23          	sw	s5,308(sp)
    4cc4:	14112623          	sw	ra,332(sp)
    4cc8:	00068a93          	mv	s5,a3
    4ccc:	9a4fc0ef          	jal	e70 <memset>
    4cd0:	00040863          	beqz	s0,4ce0 <_vfiprintf_r+0x48>
    4cd4:	03442783          	lw	a5,52(s0)
    4cd8:	00079463          	bnez	a5,4ce0 <_vfiprintf_r+0x48>
    4cdc:	49c0106f          	j	6178 <_vfiprintf_r+0x14e0>
    4ce0:	0649a703          	lw	a4,100(s3)
    4ce4:	00c99783          	lh	a5,12(s3)
    4ce8:	00177713          	and	a4,a4,1
    4cec:	00071863          	bnez	a4,4cfc <_vfiprintf_r+0x64>
    4cf0:	2007f713          	and	a4,a5,512
    4cf4:	00071463          	bnez	a4,4cfc <_vfiprintf_r+0x64>
    4cf8:	0b80106f          	j	5db0 <_vfiprintf_r+0x1118>
    4cfc:	01279713          	sll	a4,a5,0x12
    4d00:	02074663          	bltz	a4,4d2c <_vfiprintf_r+0x94>
    4d04:	0649a703          	lw	a4,100(s3)
    4d08:	00002637          	lui	a2,0x2
    4d0c:	ffffe6b7          	lui	a3,0xffffe
    4d10:	00c7e7b3          	or	a5,a5,a2
    4d14:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4d18:	01079793          	sll	a5,a5,0x10
    4d1c:	4107d793          	sra	a5,a5,0x10
    4d20:	00d77733          	and	a4,a4,a3
    4d24:	00f99623          	sh	a5,12(s3)
    4d28:	06e9a223          	sw	a4,100(s3)
    4d2c:	0087f713          	and	a4,a5,8
    4d30:	2e070463          	beqz	a4,5018 <_vfiprintf_r+0x380>
    4d34:	0109a703          	lw	a4,16(s3)
    4d38:	2e070063          	beqz	a4,5018 <_vfiprintf_r+0x380>
    4d3c:	01a7f713          	and	a4,a5,26
    4d40:	00a00693          	li	a3,10
    4d44:	2ed70c63          	beq	a4,a3,503c <_vfiprintf_r+0x3a4>
    4d48:	13412c23          	sw	s4,312(sp)
    4d4c:	06c10a13          	add	s4,sp,108
    4d50:	14912223          	sw	s1,324(sp)
    4d54:	15212023          	sw	s2,320(sp)
    4d58:	13612823          	sw	s6,304(sp)
    4d5c:	13712623          	sw	s7,300(sp)
    4d60:	13912223          	sw	s9,292(sp)
    4d64:	13a12023          	sw	s10,288(sp)
    4d68:	000c0c93          	mv	s9,s8
    4d6c:	11b12e23          	sw	s11,284(sp)
    4d70:	07412023          	sw	s4,96(sp)
    4d74:	06012423          	sw	zero,104(sp)
    4d78:	06012223          	sw	zero,100(sp)
    4d7c:	00012a23          	sw	zero,20(sp)
    4d80:	02012623          	sw	zero,44(sp)
    4d84:	02012823          	sw	zero,48(sp)
    4d88:	02012a23          	sw	zero,52(sp)
    4d8c:	00012623          	sw	zero,12(sp)
    4d90:	7fffb497          	auipc	s1,0x7fffb
    4d94:	7a448493          	add	s1,s1,1956 # 80000534 <__global_locale>
    4d98:	02500913          	li	s2,37
    4d9c:	0000ab97          	auipc	s7,0xa
    4da0:	6f8b8b93          	add	s7,s7,1784 # f494 <blanks.1+0x10>
    4da4:	0000bb17          	auipc	s6,0xb
    4da8:	85cb0b13          	add	s6,s6,-1956 # f600 <zeroes.0>
    4dac:	000a0c13          	mv	s8,s4
    4db0:	000c8d93          	mv	s11,s9
    4db4:	0e44ad03          	lw	s10,228(s1)
    4db8:	16d020ef          	jal	7724 <__locale_mb_cur_max>
    4dbc:	00050693          	mv	a3,a0
    4dc0:	05010713          	add	a4,sp,80
    4dc4:	000d8613          	mv	a2,s11
    4dc8:	04810593          	add	a1,sp,72
    4dcc:	00040513          	mv	a0,s0
    4dd0:	000d00e7          	jalr	s10
    4dd4:	2e050e63          	beqz	a0,50d0 <_vfiprintf_r+0x438>
    4dd8:	2c054e63          	bltz	a0,50b4 <_vfiprintf_r+0x41c>
    4ddc:	04812783          	lw	a5,72(sp)
    4de0:	01278663          	beq	a5,s2,4dec <_vfiprintf_r+0x154>
    4de4:	00ad8db3          	add	s11,s11,a0
    4de8:	fcdff06f          	j	4db4 <_vfiprintf_r+0x11c>
    4dec:	00050d13          	mv	s10,a0
    4df0:	419d87b3          	sub	a5,s11,s9
    4df4:	2f9d9463          	bne	s11,s9,50dc <_vfiprintf_r+0x444>
    4df8:	00000e13          	li	t3,0
    4dfc:	001dc683          	lbu	a3,1(s11)
    4e00:	001d8c93          	add	s9,s11,1
    4e04:	040101a3          	sb	zero,67(sp)
    4e08:	fff00713          	li	a4,-1
    4e0c:	00000893          	li	a7,0
    4e10:	05a00d13          	li	s10,90
    4e14:	000e0d93          	mv	s11,t3
    4e18:	001c8c93          	add	s9,s9,1
    4e1c:	fe068793          	add	a5,a3,-32
    4e20:	04fd6663          	bltu	s10,a5,4e6c <_vfiprintf_r+0x1d4>
    4e24:	00279793          	sll	a5,a5,0x2
    4e28:	017787b3          	add	a5,a5,s7
    4e2c:	0007a783          	lw	a5,0(a5)
    4e30:	017787b3          	add	a5,a5,s7
    4e34:	00078067          	jr	a5
    4e38:	00000893          	li	a7,0
    4e3c:	fd068793          	add	a5,a3,-48
    4e40:	00900593          	li	a1,9
    4e44:	000cc683          	lbu	a3,0(s9)
    4e48:	00289613          	sll	a2,a7,0x2
    4e4c:	011608b3          	add	a7,a2,a7
    4e50:	00189893          	sll	a7,a7,0x1
    4e54:	011788b3          	add	a7,a5,a7
    4e58:	fd068793          	add	a5,a3,-48
    4e5c:	001c8c93          	add	s9,s9,1
    4e60:	fef5f2e3          	bgeu	a1,a5,4e44 <_vfiprintf_r+0x1ac>
    4e64:	fe068793          	add	a5,a3,-32
    4e68:	fafd7ee3          	bgeu	s10,a5,4e24 <_vfiprintf_r+0x18c>
    4e6c:	000d8e13          	mv	t3,s11
    4e70:	2c068663          	beqz	a3,513c <_vfiprintf_r+0x4a4>
    4e74:	0ad10623          	sb	a3,172(sp)
    4e78:	040101a3          	sb	zero,67(sp)
    4e7c:	00100e93          	li	t4,1
    4e80:	00100d13          	li	s10,1
    4e84:	0ac10813          	add	a6,sp,172
    4e88:	00012823          	sw	zero,16(sp)
    4e8c:	00000713          	li	a4,0
    4e90:	00000f93          	li	t6,0
    4e94:	06412603          	lw	a2,100(sp)
    4e98:	084e7293          	and	t0,t3,132
    4e9c:	06812783          	lw	a5,104(sp)
    4ea0:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x23d>
    4ea4:	00058f13          	mv	t5,a1
    4ea8:	00029663          	bnez	t0,4eb4 <_vfiprintf_r+0x21c>
    4eac:	41d88db3          	sub	s11,a7,t4
    4eb0:	47b046e3          	bgtz	s11,5b1c <_vfiprintf_r+0xe84>
    4eb4:	04314583          	lbu	a1,67(sp)
    4eb8:	02058a63          	beqz	a1,4eec <_vfiprintf_r+0x254>
    4ebc:	04310613          	add	a2,sp,67
    4ec0:	00178793          	add	a5,a5,1
    4ec4:	00100693          	li	a3,1
    4ec8:	00cc2023          	sw	a2,0(s8)
    4ecc:	00dc2223          	sw	a3,4(s8)
    4ed0:	06f12423          	sw	a5,104(sp)
    4ed4:	07e12223          	sw	t5,100(sp)
    4ed8:	00700613          	li	a2,7
    4edc:	35e64ce3          	blt	a2,t5,5a34 <_vfiprintf_r+0xd9c>
    4ee0:	000f0613          	mv	a2,t5
    4ee4:	008c0c13          	add	s8,s8,8
    4ee8:	001f0f13          	add	t5,t5,1
    4eec:	080f8063          	beqz	t6,4f6c <_vfiprintf_r+0x2d4>
    4ef0:	00200613          	li	a2,2
    4ef4:	00278793          	add	a5,a5,2
    4ef8:	04410693          	add	a3,sp,68
    4efc:	00cc2223          	sw	a2,4(s8)
    4f00:	00dc2023          	sw	a3,0(s8)
    4f04:	06f12423          	sw	a5,104(sp)
    4f08:	07e12223          	sw	t5,100(sp)
    4f0c:	00700613          	li	a2,7
    4f10:	3be652e3          	bge	a2,t5,5ab4 <_vfiprintf_r+0xe1c>
    4f14:	60078ae3          	beqz	a5,5d28 <_vfiprintf_r+0x1090>
    4f18:	06010613          	add	a2,sp,96
    4f1c:	00098593          	mv	a1,s3
    4f20:	00040513          	mv	a0,s0
    4f24:	03d12c23          	sw	t4,56(sp)
    4f28:	02e12423          	sw	a4,40(sp)
    4f2c:	03112223          	sw	a7,36(sp)
    4f30:	03012023          	sw	a6,32(sp)
    4f34:	00512e23          	sw	t0,28(sp)
    4f38:	01c12c23          	sw	t3,24(sp)
    4f3c:	c21ff0ef          	jal	4b5c <__sprint_r.part.0>
    4f40:	22051463          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    4f44:	06412603          	lw	a2,100(sp)
    4f48:	06812783          	lw	a5,104(sp)
    4f4c:	03812e83          	lw	t4,56(sp)
    4f50:	02812703          	lw	a4,40(sp)
    4f54:	02412883          	lw	a7,36(sp)
    4f58:	02012803          	lw	a6,32(sp)
    4f5c:	01c12283          	lw	t0,28(sp)
    4f60:	01812e03          	lw	t3,24(sp)
    4f64:	000a0c13          	mv	s8,s4
    4f68:	00160f13          	add	t5,a2,1
    4f6c:	08000593          	li	a1,128
    4f70:	06b286e3          	beq	t0,a1,57dc <_vfiprintf_r+0xb44>
    4f74:	41a70733          	sub	a4,a4,s10
    4f78:	1ae04ae3          	bgtz	a4,592c <_vfiprintf_r+0xc94>
    4f7c:	00fd07b3          	add	a5,s10,a5
    4f80:	010c2023          	sw	a6,0(s8)
    4f84:	01ac2223          	sw	s10,4(s8)
    4f88:	06f12423          	sw	a5,104(sp)
    4f8c:	07e12223          	sw	t5,100(sp)
    4f90:	00700713          	li	a4,7
    4f94:	03e758e3          	bge	a4,t5,57c4 <_vfiprintf_r+0xb2c>
    4f98:	24078063          	beqz	a5,51d8 <_vfiprintf_r+0x540>
    4f9c:	06010613          	add	a2,sp,96
    4fa0:	00098593          	mv	a1,s3
    4fa4:	00040513          	mv	a0,s0
    4fa8:	03d12023          	sw	t4,32(sp)
    4fac:	01112e23          	sw	a7,28(sp)
    4fb0:	01c12c23          	sw	t3,24(sp)
    4fb4:	ba9ff0ef          	jal	4b5c <__sprint_r.part.0>
    4fb8:	1a051863          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    4fbc:	06812783          	lw	a5,104(sp)
    4fc0:	02012e83          	lw	t4,32(sp)
    4fc4:	01c12883          	lw	a7,28(sp)
    4fc8:	01812e03          	lw	t3,24(sp)
    4fcc:	000a0c13          	mv	s8,s4
    4fd0:	004e7e13          	and	t3,t3,4
    4fd4:	000e0663          	beqz	t3,4fe0 <_vfiprintf_r+0x348>
    4fd8:	41d88db3          	sub	s11,a7,t4
    4fdc:	21b04a63          	bgtz	s11,51f0 <_vfiprintf_r+0x558>
    4fe0:	01d8d463          	bge	a7,t4,4fe8 <_vfiprintf_r+0x350>
    4fe4:	000e8893          	mv	a7,t4
    4fe8:	00c12703          	lw	a4,12(sp)
    4fec:	01170733          	add	a4,a4,a7
    4ff0:	00e12623          	sw	a4,12(sp)
    4ff4:	16079063          	bnez	a5,5154 <_vfiprintf_r+0x4bc>
    4ff8:	01012783          	lw	a5,16(sp)
    4ffc:	06012223          	sw	zero,100(sp)
    5000:	00078863          	beqz	a5,5010 <_vfiprintf_r+0x378>
    5004:	00078593          	mv	a1,a5
    5008:	00040513          	mv	a0,s0
    500c:	ab4fc0ef          	jal	12c0 <_free_r>
    5010:	000a0c13          	mv	s8,s4
    5014:	d9dff06f          	j	4db0 <_vfiprintf_r+0x118>
    5018:	00098593          	mv	a1,s3
    501c:	00040513          	mv	a0,s0
    5020:	224020ef          	jal	7244 <__swsetup_r>
    5024:	00050463          	beqz	a0,502c <_vfiprintf_r+0x394>
    5028:	3840106f          	j	63ac <_vfiprintf_r+0x1714>
    502c:	00c99783          	lh	a5,12(s3)
    5030:	00a00693          	li	a3,10
    5034:	01a7f713          	and	a4,a5,26
    5038:	d0d718e3          	bne	a4,a3,4d48 <_vfiprintf_r+0xb0>
    503c:	00e99703          	lh	a4,14(s3)
    5040:	d00744e3          	bltz	a4,4d48 <_vfiprintf_r+0xb0>
    5044:	0649a703          	lw	a4,100(s3)
    5048:	00177713          	and	a4,a4,1
    504c:	00071863          	bnez	a4,505c <_vfiprintf_r+0x3c4>
    5050:	2007f793          	and	a5,a5,512
    5054:	00079463          	bnez	a5,505c <_vfiprintf_r+0x3c4>
    5058:	2ac0106f          	j	6304 <_vfiprintf_r+0x166c>
    505c:	000a8693          	mv	a3,s5
    5060:	000c0613          	mv	a2,s8
    5064:	00098593          	mv	a1,s3
    5068:	00040513          	mv	a0,s0
    506c:	3e4010ef          	jal	6450 <__sbprintf>
    5070:	14c12083          	lw	ra,332(sp)
    5074:	14812403          	lw	s0,328(sp)
    5078:	00a12623          	sw	a0,12(sp)
    507c:	00c12503          	lw	a0,12(sp)
    5080:	13c12983          	lw	s3,316(sp)
    5084:	13412a83          	lw	s5,308(sp)
    5088:	12812c03          	lw	s8,296(sp)
    508c:	15010113          	add	sp,sp,336
    5090:	00008067          	ret
    5094:	000aa883          	lw	a7,0(s5)
    5098:	004a8a93          	add	s5,s5,4
    509c:	3608cc63          	bltz	a7,5414 <_vfiprintf_r+0x77c>
    50a0:	000cc683          	lbu	a3,0(s9)
    50a4:	d75ff06f          	j	4e18 <_vfiprintf_r+0x180>
    50a8:	000cc683          	lbu	a3,0(s9)
    50ac:	020ded93          	or	s11,s11,32
    50b0:	d69ff06f          	j	4e18 <_vfiprintf_r+0x180>
    50b4:	00800613          	li	a2,8
    50b8:	00000593          	li	a1,0
    50bc:	05010513          	add	a0,sp,80
    50c0:	db1fb0ef          	jal	e70 <memset>
    50c4:	00100513          	li	a0,1
    50c8:	00ad8db3          	add	s11,s11,a0
    50cc:	ce9ff06f          	j	4db4 <_vfiprintf_r+0x11c>
    50d0:	00050d13          	mv	s10,a0
    50d4:	419d87b3          	sub	a5,s11,s9
    50d8:	079d8263          	beq	s11,s9,513c <_vfiprintf_r+0x4a4>
    50dc:	06812683          	lw	a3,104(sp)
    50e0:	06412703          	lw	a4,100(sp)
    50e4:	019c2023          	sw	s9,0(s8)
    50e8:	00d786b3          	add	a3,a5,a3
    50ec:	00170713          	add	a4,a4,1
    50f0:	00fc2223          	sw	a5,4(s8)
    50f4:	06d12423          	sw	a3,104(sp)
    50f8:	06e12223          	sw	a4,100(sp)
    50fc:	00700613          	li	a2,7
    5100:	008c0c13          	add	s8,s8,8
    5104:	02e65463          	bge	a2,a4,512c <_vfiprintf_r+0x494>
    5108:	38068ce3          	beqz	a3,5ca0 <_vfiprintf_r+0x1008>
    510c:	06010613          	add	a2,sp,96
    5110:	00098593          	mv	a1,s3
    5114:	00040513          	mv	a0,s0
    5118:	00f12823          	sw	a5,16(sp)
    511c:	a41ff0ef          	jal	4b5c <__sprint_r.part.0>
    5120:	01012783          	lw	a5,16(sp)
    5124:	04051c63          	bnez	a0,517c <_vfiprintf_r+0x4e4>
    5128:	000a0c13          	mv	s8,s4
    512c:	00c12703          	lw	a4,12(sp)
    5130:	00f707b3          	add	a5,a4,a5
    5134:	00f12623          	sw	a5,12(sp)
    5138:	cc0d10e3          	bnez	s10,4df8 <_vfiprintf_r+0x160>
    513c:	06812783          	lw	a5,104(sp)
    5140:	00078463          	beqz	a5,5148 <_vfiprintf_r+0x4b0>
    5144:	22c0106f          	j	6370 <_vfiprintf_r+0x16d8>
    5148:	00c99783          	lh	a5,12(s3)
    514c:	06012223          	sw	zero,100(sp)
    5150:	0300006f          	j	5180 <_vfiprintf_r+0x4e8>
    5154:	06010613          	add	a2,sp,96
    5158:	00098593          	mv	a1,s3
    515c:	00040513          	mv	a0,s0
    5160:	9fdff0ef          	jal	4b5c <__sprint_r.part.0>
    5164:	e8050ae3          	beqz	a0,4ff8 <_vfiprintf_r+0x360>
    5168:	01012783          	lw	a5,16(sp)
    516c:	00078863          	beqz	a5,517c <_vfiprintf_r+0x4e4>
    5170:	01012583          	lw	a1,16(sp)
    5174:	00040513          	mv	a0,s0
    5178:	948fc0ef          	jal	12c0 <_free_r>
    517c:	00c99783          	lh	a5,12(s3)
    5180:	0649a703          	lw	a4,100(s3)
    5184:	00177713          	and	a4,a4,1
    5188:	16070a63          	beqz	a4,52fc <_vfiprintf_r+0x664>
    518c:	0407f793          	and	a5,a5,64
    5190:	14412483          	lw	s1,324(sp)
    5194:	14012903          	lw	s2,320(sp)
    5198:	13812a03          	lw	s4,312(sp)
    519c:	13012b03          	lw	s6,304(sp)
    51a0:	12c12b83          	lw	s7,300(sp)
    51a4:	12412c83          	lw	s9,292(sp)
    51a8:	12012d03          	lw	s10,288(sp)
    51ac:	11c12d83          	lw	s11,284(sp)
    51b0:	00078463          	beqz	a5,51b8 <_vfiprintf_r+0x520>
    51b4:	2180106f          	j	63cc <_vfiprintf_r+0x1734>
    51b8:	14c12083          	lw	ra,332(sp)
    51bc:	14812403          	lw	s0,328(sp)
    51c0:	00c12503          	lw	a0,12(sp)
    51c4:	13c12983          	lw	s3,316(sp)
    51c8:	13412a83          	lw	s5,308(sp)
    51cc:	12812c03          	lw	s8,296(sp)
    51d0:	15010113          	add	sp,sp,336
    51d4:	00008067          	ret
    51d8:	06012223          	sw	zero,100(sp)
    51dc:	004e7e13          	and	t3,t3,4
    51e0:	240e0ee3          	beqz	t3,5c3c <_vfiprintf_r+0xfa4>
    51e4:	41d88db3          	sub	s11,a7,t4
    51e8:	25b05ae3          	blez	s11,5c3c <_vfiprintf_r+0xfa4>
    51ec:	000a0c13          	mv	s8,s4
    51f0:	01000713          	li	a4,16
    51f4:	06412683          	lw	a3,100(sp)
    51f8:	01b74463          	blt	a4,s11,5200 <_vfiprintf_r+0x568>
    51fc:	1900106f          	j	638c <_vfiprintf_r+0x16f4>
    5200:	000a8713          	mv	a4,s5
    5204:	0000a317          	auipc	t1,0xa
    5208:	40c30313          	add	t1,t1,1036 # f610 <blanks.1>
    520c:	000c0593          	mv	a1,s8
    5210:	000d8a93          	mv	s5,s11
    5214:	01000813          	li	a6,16
    5218:	00700d13          	li	s10,7
    521c:	01112c23          	sw	a7,24(sp)
    5220:	01d12e23          	sw	t4,28(sp)
    5224:	00030c13          	mv	s8,t1
    5228:	00070d93          	mv	s11,a4
    522c:	0180006f          	j	5244 <_vfiprintf_r+0x5ac>
    5230:	00268613          	add	a2,a3,2
    5234:	00858593          	add	a1,a1,8
    5238:	00070693          	mv	a3,a4
    523c:	ff0a8a93          	add	s5,s5,-16
    5240:	05585a63          	bge	a6,s5,5294 <_vfiprintf_r+0x5fc>
    5244:	01078793          	add	a5,a5,16
    5248:	00168713          	add	a4,a3,1
    524c:	0185a023          	sw	s8,0(a1)
    5250:	0105a223          	sw	a6,4(a1)
    5254:	06f12423          	sw	a5,104(sp)
    5258:	06e12223          	sw	a4,100(sp)
    525c:	fced5ae3          	bge	s10,a4,5230 <_vfiprintf_r+0x598>
    5260:	56078663          	beqz	a5,57cc <_vfiprintf_r+0xb34>
    5264:	06010613          	add	a2,sp,96
    5268:	00098593          	mv	a1,s3
    526c:	00040513          	mv	a0,s0
    5270:	8edff0ef          	jal	4b5c <__sprint_r.part.0>
    5274:	ee051ae3          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    5278:	06412683          	lw	a3,100(sp)
    527c:	01000813          	li	a6,16
    5280:	ff0a8a93          	add	s5,s5,-16
    5284:	06812783          	lw	a5,104(sp)
    5288:	000a0593          	mv	a1,s4
    528c:	00168613          	add	a2,a3,1
    5290:	fb584ae3          	blt	a6,s5,5244 <_vfiprintf_r+0x5ac>
    5294:	01812883          	lw	a7,24(sp)
    5298:	01c12e83          	lw	t4,28(sp)
    529c:	000d8713          	mv	a4,s11
    52a0:	000c0313          	mv	t1,s8
    52a4:	000a8d93          	mv	s11,s5
    52a8:	00058c13          	mv	s8,a1
    52ac:	00070a93          	mv	s5,a4
    52b0:	01b787b3          	add	a5,a5,s11
    52b4:	006c2023          	sw	t1,0(s8)
    52b8:	01bc2223          	sw	s11,4(s8)
    52bc:	06f12423          	sw	a5,104(sp)
    52c0:	06c12223          	sw	a2,100(sp)
    52c4:	00700713          	li	a4,7
    52c8:	d0c75ce3          	bge	a4,a2,4fe0 <_vfiprintf_r+0x348>
    52cc:	160788e3          	beqz	a5,5c3c <_vfiprintf_r+0xfa4>
    52d0:	06010613          	add	a2,sp,96
    52d4:	00098593          	mv	a1,s3
    52d8:	00040513          	mv	a0,s0
    52dc:	01d12e23          	sw	t4,28(sp)
    52e0:	01112c23          	sw	a7,24(sp)
    52e4:	879ff0ef          	jal	4b5c <__sprint_r.part.0>
    52e8:	e80510e3          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    52ec:	06812783          	lw	a5,104(sp)
    52f0:	01c12e83          	lw	t4,28(sp)
    52f4:	01812883          	lw	a7,24(sp)
    52f8:	ce9ff06f          	j	4fe0 <_vfiprintf_r+0x348>
    52fc:	2007f713          	and	a4,a5,512
    5300:	e80716e3          	bnez	a4,518c <_vfiprintf_r+0x4f4>
    5304:	0589a503          	lw	a0,88(s3)
    5308:	b65fb0ef          	jal	e6c <__retarget_lock_release_recursive>
    530c:	00c99783          	lh	a5,12(s3)
    5310:	e7dff06f          	j	518c <_vfiprintf_r+0x4f4>
    5314:	000aa803          	lw	a6,0(s5)
    5318:	040101a3          	sb	zero,67(sp)
    531c:	000d8e13          	mv	t3,s11
    5320:	004a8a93          	add	s5,s5,4
    5324:	68080ae3          	beqz	a6,61b8 <_vfiprintf_r+0x1520>
    5328:	05300793          	li	a5,83
    532c:	3cf68ce3          	beq	a3,a5,5f04 <_vfiprintf_r+0x126c>
    5330:	010df793          	and	a5,s11,16
    5334:	3c0798e3          	bnez	a5,5f04 <_vfiprintf_r+0x126c>
    5338:	00075463          	bgez	a4,5340 <_vfiprintf_r+0x6a8>
    533c:	7fd0006f          	j	6338 <_vfiprintf_r+0x16a0>
    5340:	00070613          	mv	a2,a4
    5344:	00080513          	mv	a0,a6
    5348:	00000593          	li	a1,0
    534c:	03112223          	sw	a7,36(sp)
    5350:	00e12e23          	sw	a4,28(sp)
    5354:	01012c23          	sw	a6,24(sp)
    5358:	03b12023          	sw	s11,32(sp)
    535c:	258020ef          	jal	75b4 <memchr>
    5360:	00a12823          	sw	a0,16(sp)
    5364:	01812803          	lw	a6,24(sp)
    5368:	01c12703          	lw	a4,28(sp)
    536c:	02012e03          	lw	t3,32(sp)
    5370:	02412883          	lw	a7,36(sp)
    5374:	00051463          	bnez	a0,537c <_vfiprintf_r+0x6e4>
    5378:	7990006f          	j	6310 <_vfiprintf_r+0x1678>
    537c:	41050d33          	sub	s10,a0,a6
    5380:	fffd4e93          	not	t4,s10
    5384:	41fede93          	sra	t4,t4,0x1f
    5388:	01dd7eb3          	and	t4,s10,t4
    538c:	00012823          	sw	zero,16(sp)
    5390:	6dd0006f          	j	626c <_vfiprintf_r+0x15d4>
    5394:	04300793          	li	a5,67
    5398:	000d8e13          	mv	t3,s11
    539c:	004a8d93          	add	s11,s5,4
    53a0:	00f68663          	beq	a3,a5,53ac <_vfiprintf_r+0x714>
    53a4:	010e7793          	and	a5,t3,16
    53a8:	280788e3          	beqz	a5,5e38 <_vfiprintf_r+0x11a0>
    53ac:	00800613          	li	a2,8
    53b0:	00000593          	li	a1,0
    53b4:	05810513          	add	a0,sp,88
    53b8:	01112e23          	sw	a7,28(sp)
    53bc:	01c12c23          	sw	t3,24(sp)
    53c0:	ab1fb0ef          	jal	e70 <memset>
    53c4:	000aa603          	lw	a2,0(s5)
    53c8:	0ac10593          	add	a1,sp,172
    53cc:	05810693          	add	a3,sp,88
    53d0:	00040513          	mv	a0,s0
    53d4:	00b12823          	sw	a1,16(sp)
    53d8:	408050ef          	jal	a7e0 <_wcrtomb_r>
    53dc:	fff00793          	li	a5,-1
    53e0:	01012583          	lw	a1,16(sp)
    53e4:	01812e03          	lw	t3,24(sp)
    53e8:	01c12883          	lw	a7,28(sp)
    53ec:	00050d13          	mv	s10,a0
    53f0:	00f51463          	bne	a0,a5,53f8 <_vfiprintf_r+0x760>
    53f4:	0200106f          	j	6414 <_vfiprintf_r+0x177c>
    53f8:	fff54e93          	not	t4,a0
    53fc:	41fede93          	sra	t4,t4,0x1f
    5400:	01d57eb3          	and	t4,a0,t4
    5404:	040101a3          	sb	zero,67(sp)
    5408:	000d8a93          	mv	s5,s11
    540c:	00058813          	mv	a6,a1
    5410:	a79ff06f          	j	4e88 <_vfiprintf_r+0x1f0>
    5414:	411008b3          	neg	a7,a7
    5418:	000cc683          	lbu	a3,0(s9)
    541c:	004ded93          	or	s11,s11,4
    5420:	9f9ff06f          	j	4e18 <_vfiprintf_r+0x180>
    5424:	010dee13          	or	t3,s11,16
    5428:	020e7793          	and	a5,t3,32
    542c:	0c0788e3          	beqz	a5,5cfc <_vfiprintf_r+0x1064>
    5430:	007a8a93          	add	s5,s5,7
    5434:	ff8afa93          	and	s5,s5,-8
    5438:	004aa683          	lw	a3,4(s5)
    543c:	000aad83          	lw	s11,0(s5)
    5440:	008a8a93          	add	s5,s5,8
    5444:	00068d13          	mv	s10,a3
    5448:	3006c263          	bltz	a3,574c <_vfiprintf_r+0xab4>
    544c:	32074063          	bltz	a4,576c <_vfiprintf_r+0xad4>
    5450:	01ade6b3          	or	a3,s11,s10
    5454:	f7fe7e13          	and	t3,t3,-129
    5458:	30069a63          	bnez	a3,576c <_vfiprintf_r+0xad4>
    545c:	68071ae3          	bnez	a4,62f0 <_vfiprintf_r+0x1658>
    5460:	04314783          	lbu	a5,67(sp)
    5464:	00012823          	sw	zero,16(sp)
    5468:	00000e93          	li	t4,0
    546c:	00000d13          	li	s10,0
    5470:	11010813          	add	a6,sp,272
    5474:	00078463          	beqz	a5,547c <_vfiprintf_r+0x7e4>
    5478:	001e8e93          	add	t4,t4,1
    547c:	002e7f93          	and	t6,t3,2
    5480:	a00f8ae3          	beqz	t6,4e94 <_vfiprintf_r+0x1fc>
    5484:	002e8e93          	add	t4,t4,2
    5488:	00200f93          	li	t6,2
    548c:	a09ff06f          	j	4e94 <_vfiprintf_r+0x1fc>
    5490:	000cc683          	lbu	a3,0(s9)
    5494:	06800793          	li	a5,104
    5498:	4ef686e3          	beq	a3,a5,6184 <_vfiprintf_r+0x14ec>
    549c:	040ded93          	or	s11,s11,64
    54a0:	979ff06f          	j	4e18 <_vfiprintf_r+0x180>
    54a4:	010de613          	or	a2,s11,16
    54a8:	02067793          	and	a5,a2,32
    54ac:	000780e3          	beqz	a5,5cac <_vfiprintf_r+0x1014>
    54b0:	007a8a93          	add	s5,s5,7
    54b4:	ff8afa93          	and	s5,s5,-8
    54b8:	000aad83          	lw	s11,0(s5)
    54bc:	004aad03          	lw	s10,4(s5)
    54c0:	008a8a93          	add	s5,s5,8
    54c4:	040101a3          	sb	zero,67(sp)
    54c8:	00060e13          	mv	t3,a2
    54cc:	2a074063          	bltz	a4,576c <_vfiprintf_r+0xad4>
    54d0:	01ade6b3          	or	a3,s11,s10
    54d4:	f7f67e13          	and	t3,a2,-129
    54d8:	28069a63          	bnez	a3,576c <_vfiprintf_r+0xad4>
    54dc:	00100793          	li	a5,1
    54e0:	06071e63          	bnez	a4,555c <_vfiprintf_r+0x8c4>
    54e4:	f6079ee3          	bnez	a5,5460 <_vfiprintf_r+0x7c8>
    54e8:	00167d13          	and	s10,a2,1
    54ec:	0a0d0ce3          	beqz	s10,5da4 <_vfiprintf_r+0x110c>
    54f0:	03000793          	li	a5,48
    54f4:	10f107a3          	sb	a5,271(sp)
    54f8:	000d0e93          	mv	t4,s10
    54fc:	10f10813          	add	a6,sp,271
    5500:	2980006f          	j	5798 <_vfiprintf_r+0xb00>
    5504:	02b00793          	li	a5,43
    5508:	000cc683          	lbu	a3,0(s9)
    550c:	04f101a3          	sb	a5,67(sp)
    5510:	909ff06f          	j	4e18 <_vfiprintf_r+0x180>
    5514:	010de693          	or	a3,s11,16
    5518:	0206f793          	and	a5,a3,32
    551c:	7a078c63          	beqz	a5,5cd4 <_vfiprintf_r+0x103c>
    5520:	007a8a93          	add	s5,s5,7
    5524:	ff8afa93          	and	s5,s5,-8
    5528:	000aa783          	lw	a5,0(s5)
    552c:	004aa583          	lw	a1,4(s5)
    5530:	008a8a93          	add	s5,s5,8
    5534:	040101a3          	sb	zero,67(sp)
    5538:	bff6fe13          	and	t3,a3,-1025
    553c:	02074c63          	bltz	a4,5574 <_vfiprintf_r+0x8dc>
    5540:	00b7e633          	or	a2,a5,a1
    5544:	b7f6f693          	and	a3,a3,-1153
    5548:	420610e3          	bnez	a2,6168 <_vfiprintf_r+0x14d0>
    554c:	000e0613          	mv	a2,t3
    5550:	00000793          	li	a5,0
    5554:	00068e13          	mv	t3,a3
    5558:	f80706e3          	beqz	a4,54e4 <_vfiprintf_r+0x84c>
    555c:	00100693          	li	a3,1
    5560:	58d788e3          	beq	a5,a3,62f0 <_vfiprintf_r+0x1658>
    5564:	00200693          	li	a3,2
    5568:	46d786e3          	beq	a5,a3,61d4 <_vfiprintf_r+0x153c>
    556c:	00000793          	li	a5,0
    5570:	00000593          	li	a1,0
    5574:	11010813          	add	a6,sp,272
    5578:	01d59613          	sll	a2,a1,0x1d
    557c:	0077f693          	and	a3,a5,7
    5580:	0037d793          	srl	a5,a5,0x3
    5584:	03068693          	add	a3,a3,48
    5588:	00f667b3          	or	a5,a2,a5
    558c:	0035d593          	srl	a1,a1,0x3
    5590:	fed80fa3          	sb	a3,-1(a6)
    5594:	00b7e633          	or	a2,a5,a1
    5598:	00080513          	mv	a0,a6
    559c:	fff80813          	add	a6,a6,-1
    55a0:	fc061ce3          	bnez	a2,5578 <_vfiprintf_r+0x8e0>
    55a4:	001e7793          	and	a5,t3,1
    55a8:	54078e63          	beqz	a5,5b04 <_vfiprintf_r+0xe6c>
    55ac:	03000793          	li	a5,48
    55b0:	54f68a63          	beq	a3,a5,5b04 <_vfiprintf_r+0xe6c>
    55b4:	ffe50513          	add	a0,a0,-2
    55b8:	fef80fa3          	sb	a5,-1(a6)
    55bc:	11010793          	add	a5,sp,272
    55c0:	40a78d33          	sub	s10,a5,a0
    55c4:	00070e93          	mv	t4,a4
    55c8:	09a744e3          	blt	a4,s10,5e50 <_vfiprintf_r+0x11b8>
    55cc:	00050813          	mv	a6,a0
    55d0:	1c80006f          	j	5798 <_vfiprintf_r+0xb00>
    55d4:	000086b7          	lui	a3,0x8
    55d8:	83068693          	add	a3,a3,-2000 # 7830 <_read_r+0x38>
    55dc:	04d11223          	sh	a3,68(sp)
    55e0:	0000a697          	auipc	a3,0xa
    55e4:	9ac68693          	add	a3,a3,-1620 # ef8c <__fini_array_end+0x274>
    55e8:	000aa783          	lw	a5,0(s5)
    55ec:	00000593          	li	a1,0
    55f0:	002dee13          	or	t3,s11,2
    55f4:	004a8a93          	add	s5,s5,4
    55f8:	00d12a23          	sw	a3,20(sp)
    55fc:	040101a3          	sb	zero,67(sp)
    5600:	4c074863          	bltz	a4,5ad0 <_vfiprintf_r+0xe38>
    5604:	00b7e6b3          	or	a3,a5,a1
    5608:	f7fe7513          	and	a0,t3,-129
    560c:	4a069c63          	bnez	a3,5ac4 <_vfiprintf_r+0xe2c>
    5610:	000e0613          	mv	a2,t3
    5614:	00200793          	li	a5,2
    5618:	00050e13          	mv	t3,a0
    561c:	ec5ff06f          	j	54e0 <_vfiprintf_r+0x848>
    5620:	00040513          	mv	a0,s0
    5624:	00e12c23          	sw	a4,24(sp)
    5628:	01112823          	sw	a7,16(sp)
    562c:	104020ef          	jal	7730 <_localeconv_r>
    5630:	00452783          	lw	a5,4(a0)
    5634:	00078513          	mv	a0,a5
    5638:	02f12a23          	sw	a5,52(sp)
    563c:	ab5fb0ef          	jal	10f0 <strlen>
    5640:	00050793          	mv	a5,a0
    5644:	00040513          	mv	a0,s0
    5648:	02f12823          	sw	a5,48(sp)
    564c:	0e4020ef          	jal	7730 <_localeconv_r>
    5650:	00852703          	lw	a4,8(a0)
    5654:	03012783          	lw	a5,48(sp)
    5658:	01012883          	lw	a7,16(sp)
    565c:	02e12623          	sw	a4,44(sp)
    5660:	01812703          	lw	a4,24(sp)
    5664:	a2078ee3          	beqz	a5,50a0 <_vfiprintf_r+0x408>
    5668:	02c12783          	lw	a5,44(sp)
    566c:	000cc683          	lbu	a3,0(s9)
    5670:	fa078463          	beqz	a5,4e18 <_vfiprintf_r+0x180>
    5674:	0007c783          	lbu	a5,0(a5)
    5678:	fa078063          	beqz	a5,4e18 <_vfiprintf_r+0x180>
    567c:	400ded93          	or	s11,s11,1024
    5680:	f98ff06f          	j	4e18 <_vfiprintf_r+0x180>
    5684:	020df793          	and	a5,s11,32
    5688:	78079263          	bnez	a5,5e0c <_vfiprintf_r+0x1174>
    568c:	010df793          	and	a5,s11,16
    5690:	30079ae3          	bnez	a5,61a4 <_vfiprintf_r+0x150c>
    5694:	040df793          	and	a5,s11,64
    5698:	400796e3          	bnez	a5,62a4 <_vfiprintf_r+0x160c>
    569c:	200dfe13          	and	t3,s11,512
    56a0:	300e02e3          	beqz	t3,61a4 <_vfiprintf_r+0x150c>
    56a4:	000aa783          	lw	a5,0(s5)
    56a8:	00c12703          	lw	a4,12(sp)
    56ac:	004a8a93          	add	s5,s5,4
    56b0:	00e78023          	sb	a4,0(a5)
    56b4:	efcff06f          	j	4db0 <_vfiprintf_r+0x118>
    56b8:	000cc683          	lbu	a3,0(s9)
    56bc:	06c00793          	li	a5,108
    56c0:	2cf68ae3          	beq	a3,a5,6194 <_vfiprintf_r+0x14fc>
    56c4:	010ded93          	or	s11,s11,16
    56c8:	f50ff06f          	j	4e18 <_vfiprintf_r+0x180>
    56cc:	000cc683          	lbu	a3,0(s9)
    56d0:	080ded93          	or	s11,s11,128
    56d4:	f44ff06f          	j	4e18 <_vfiprintf_r+0x180>
    56d8:	000cc683          	lbu	a3,0(s9)
    56dc:	02a00793          	li	a5,42
    56e0:	001c8593          	add	a1,s9,1
    56e4:	54f680e3          	beq	a3,a5,6424 <_vfiprintf_r+0x178c>
    56e8:	fd068793          	add	a5,a3,-48
    56ec:	00900613          	li	a2,9
    56f0:	00000713          	li	a4,0
    56f4:	00900513          	li	a0,9
    56f8:	02f66463          	bltu	a2,a5,5720 <_vfiprintf_r+0xa88>
    56fc:	0005c683          	lbu	a3,0(a1)
    5700:	00271613          	sll	a2,a4,0x2
    5704:	00e60733          	add	a4,a2,a4
    5708:	00171713          	sll	a4,a4,0x1
    570c:	00f70733          	add	a4,a4,a5
    5710:	fd068793          	add	a5,a3,-48
    5714:	00158593          	add	a1,a1,1
    5718:	fef572e3          	bgeu	a0,a5,56fc <_vfiprintf_r+0xa64>
    571c:	74074063          	bltz	a4,5e5c <_vfiprintf_r+0x11c4>
    5720:	00058c93          	mv	s9,a1
    5724:	ef8ff06f          	j	4e1c <_vfiprintf_r+0x184>
    5728:	000cc683          	lbu	a3,0(s9)
    572c:	001ded93          	or	s11,s11,1
    5730:	ee8ff06f          	j	4e18 <_vfiprintf_r+0x180>
    5734:	04314783          	lbu	a5,67(sp)
    5738:	000cc683          	lbu	a3,0(s9)
    573c:	ec079e63          	bnez	a5,4e18 <_vfiprintf_r+0x180>
    5740:	02000793          	li	a5,32
    5744:	04f101a3          	sb	a5,67(sp)
    5748:	ed0ff06f          	j	4e18 <_vfiprintf_r+0x180>
    574c:	02d00613          	li	a2,45
    5750:	01b036b3          	snez	a3,s11
    5754:	41a000b3          	neg	ra,s10
    5758:	04c101a3          	sb	a2,67(sp)
    575c:	40d08d33          	sub	s10,ra,a3
    5760:	41b00db3          	neg	s11,s11
    5764:	00074463          	bltz	a4,576c <_vfiprintf_r+0xad4>
    5768:	f7fe7e13          	and	t3,t3,-129
    576c:	120d14e3          	bnez	s10,6094 <_vfiprintf_r+0x13fc>
    5770:	00900693          	li	a3,9
    5774:	13b6e0e3          	bltu	a3,s11,6094 <_vfiprintf_r+0x13fc>
    5778:	030d8793          	add	a5,s11,48
    577c:	0ff7f793          	zext.b	a5,a5
    5780:	10f107a3          	sb	a5,271(sp)
    5784:	00070e93          	mv	t4,a4
    5788:	00e04463          	bgtz	a4,5790 <_vfiprintf_r+0xaf8>
    578c:	00100e93          	li	t4,1
    5790:	00100d13          	li	s10,1
    5794:	10f10813          	add	a6,sp,271
    5798:	04314783          	lbu	a5,67(sp)
    579c:	00012823          	sw	zero,16(sp)
    57a0:	cc079ce3          	bnez	a5,5478 <_vfiprintf_r+0x7e0>
    57a4:	cd9ff06f          	j	547c <_vfiprintf_r+0x7e4>
    57a8:	00100713          	li	a4,1
    57ac:	000d0793          	mv	a5,s10
    57b0:	07012623          	sw	a6,108(sp)
    57b4:	07a12823          	sw	s10,112(sp)
    57b8:	07a12423          	sw	s10,104(sp)
    57bc:	06e12223          	sw	a4,100(sp)
    57c0:	000a0c13          	mv	s8,s4
    57c4:	008c0c13          	add	s8,s8,8
    57c8:	809ff06f          	j	4fd0 <_vfiprintf_r+0x338>
    57cc:	00100613          	li	a2,1
    57d0:	00000693          	li	a3,0
    57d4:	000a0593          	mv	a1,s4
    57d8:	a65ff06f          	j	523c <_vfiprintf_r+0x5a4>
    57dc:	41d88db3          	sub	s11,a7,t4
    57e0:	f9b05a63          	blez	s11,4f74 <_vfiprintf_r+0x2dc>
    57e4:	01000593          	li	a1,16
    57e8:	3bb5dae3          	bge	a1,s11,639c <_vfiprintf_r+0x1704>
    57ec:	0000af97          	auipc	t6,0xa
    57f0:	e14f8f93          	add	t6,t6,-492 # f600 <zeroes.0>
    57f4:	02e12223          	sw	a4,36(sp)
    57f8:	000a8713          	mv	a4,s5
    57fc:	000c0693          	mv	a3,s8
    5800:	000d8a93          	mv	s5,s11
    5804:	01000f13          	li	t5,16
    5808:	00700293          	li	t0,7
    580c:	01c12c23          	sw	t3,24(sp)
    5810:	01012e23          	sw	a6,28(sp)
    5814:	03112023          	sw	a7,32(sp)
    5818:	03d12423          	sw	t4,40(sp)
    581c:	000f8c13          	mv	s8,t6
    5820:	00070d93          	mv	s11,a4
    5824:	0180006f          	j	583c <_vfiprintf_r+0xba4>
    5828:	00260513          	add	a0,a2,2
    582c:	00868693          	add	a3,a3,8
    5830:	00070613          	mv	a2,a4
    5834:	ff0a8a93          	add	s5,s5,-16
    5838:	055f5c63          	bge	t5,s5,5890 <_vfiprintf_r+0xbf8>
    583c:	01078793          	add	a5,a5,16
    5840:	00160713          	add	a4,a2,1
    5844:	0186a023          	sw	s8,0(a3)
    5848:	01e6a223          	sw	t5,4(a3)
    584c:	06f12423          	sw	a5,104(sp)
    5850:	06e12223          	sw	a4,100(sp)
    5854:	fce2dae3          	bge	t0,a4,5828 <_vfiprintf_r+0xb90>
    5858:	1c078663          	beqz	a5,5a24 <_vfiprintf_r+0xd8c>
    585c:	06010613          	add	a2,sp,96
    5860:	00098593          	mv	a1,s3
    5864:	00040513          	mv	a0,s0
    5868:	af4ff0ef          	jal	4b5c <__sprint_r.part.0>
    586c:	8e051ee3          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    5870:	06412603          	lw	a2,100(sp)
    5874:	01000f13          	li	t5,16
    5878:	ff0a8a93          	add	s5,s5,-16
    587c:	06812783          	lw	a5,104(sp)
    5880:	000a0693          	mv	a3,s4
    5884:	00160513          	add	a0,a2,1
    5888:	00700293          	li	t0,7
    588c:	fb5f48e3          	blt	t5,s5,583c <_vfiprintf_r+0xba4>
    5890:	01812e03          	lw	t3,24(sp)
    5894:	01c12803          	lw	a6,28(sp)
    5898:	02012883          	lw	a7,32(sp)
    589c:	02412703          	lw	a4,36(sp)
    58a0:	02812e83          	lw	t4,40(sp)
    58a4:	000d8613          	mv	a2,s11
    58a8:	000c0f93          	mv	t6,s8
    58ac:	000a8d93          	mv	s11,s5
    58b0:	00068c13          	mv	s8,a3
    58b4:	00060a93          	mv	s5,a2
    58b8:	01b787b3          	add	a5,a5,s11
    58bc:	01fc2023          	sw	t6,0(s8)
    58c0:	01bc2223          	sw	s11,4(s8)
    58c4:	06f12423          	sw	a5,104(sp)
    58c8:	06a12223          	sw	a0,100(sp)
    58cc:	00700613          	li	a2,7
    58d0:	4ea65863          	bge	a2,a0,5dc0 <_vfiprintf_r+0x1128>
    58d4:	1a0786e3          	beqz	a5,6280 <_vfiprintf_r+0x15e8>
    58d8:	06010613          	add	a2,sp,96
    58dc:	00098593          	mv	a1,s3
    58e0:	00040513          	mv	a0,s0
    58e4:	03d12423          	sw	t4,40(sp)
    58e8:	02e12223          	sw	a4,36(sp)
    58ec:	03112023          	sw	a7,32(sp)
    58f0:	01012e23          	sw	a6,28(sp)
    58f4:	01c12c23          	sw	t3,24(sp)
    58f8:	a64ff0ef          	jal	4b5c <__sprint_r.part.0>
    58fc:	860516e3          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    5900:	02412703          	lw	a4,36(sp)
    5904:	06412603          	lw	a2,100(sp)
    5908:	06812783          	lw	a5,104(sp)
    590c:	41a70733          	sub	a4,a4,s10
    5910:	02812e83          	lw	t4,40(sp)
    5914:	02012883          	lw	a7,32(sp)
    5918:	01c12803          	lw	a6,28(sp)
    591c:	01812e03          	lw	t3,24(sp)
    5920:	000a0c13          	mv	s8,s4
    5924:	00160f13          	add	t5,a2,1
    5928:	e4e05a63          	blez	a4,4f7c <_vfiprintf_r+0x2e4>
    592c:	01000593          	li	a1,16
    5930:	0000af97          	auipc	t6,0xa
    5934:	cd0f8f93          	add	t6,t6,-816 # f600 <zeroes.0>
    5938:	0ae5da63          	bge	a1,a4,59ec <_vfiprintf_r+0xd54>
    593c:	000c0593          	mv	a1,s8
    5940:	03512423          	sw	s5,40(sp)
    5944:	01000d93          	li	s11,16
    5948:	00700293          	li	t0,7
    594c:	01c12c23          	sw	t3,24(sp)
    5950:	01012e23          	sw	a6,28(sp)
    5954:	03112023          	sw	a7,32(sp)
    5958:	03d12223          	sw	t4,36(sp)
    595c:	00070a93          	mv	s5,a4
    5960:	000b0c13          	mv	s8,s6
    5964:	0180006f          	j	597c <_vfiprintf_r+0xce4>
    5968:	00260f13          	add	t5,a2,2
    596c:	00858593          	add	a1,a1,8
    5970:	00068613          	mv	a2,a3
    5974:	ff0a8a93          	add	s5,s5,-16
    5978:	055dda63          	bge	s11,s5,59cc <_vfiprintf_r+0xd34>
    597c:	01078793          	add	a5,a5,16
    5980:	00160693          	add	a3,a2,1
    5984:	0165a023          	sw	s6,0(a1)
    5988:	01b5a223          	sw	s11,4(a1)
    598c:	06f12423          	sw	a5,104(sp)
    5990:	06d12223          	sw	a3,100(sp)
    5994:	fcd2dae3          	bge	t0,a3,5968 <_vfiprintf_r+0xcd0>
    5998:	06078e63          	beqz	a5,5a14 <_vfiprintf_r+0xd7c>
    599c:	06010613          	add	a2,sp,96
    59a0:	00098593          	mv	a1,s3
    59a4:	00040513          	mv	a0,s0
    59a8:	9b4ff0ef          	jal	4b5c <__sprint_r.part.0>
    59ac:	fa051e63          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    59b0:	06412603          	lw	a2,100(sp)
    59b4:	ff0a8a93          	add	s5,s5,-16
    59b8:	06812783          	lw	a5,104(sp)
    59bc:	000a0593          	mv	a1,s4
    59c0:	00160f13          	add	t5,a2,1
    59c4:	00700293          	li	t0,7
    59c8:	fb5dcae3          	blt	s11,s5,597c <_vfiprintf_r+0xce4>
    59cc:	000a8713          	mv	a4,s5
    59d0:	01812e03          	lw	t3,24(sp)
    59d4:	01c12803          	lw	a6,28(sp)
    59d8:	02012883          	lw	a7,32(sp)
    59dc:	02412e83          	lw	t4,36(sp)
    59e0:	02812a83          	lw	s5,40(sp)
    59e4:	000c0f93          	mv	t6,s8
    59e8:	00058c13          	mv	s8,a1
    59ec:	00e787b3          	add	a5,a5,a4
    59f0:	00ec2223          	sw	a4,4(s8)
    59f4:	01fc2023          	sw	t6,0(s8)
    59f8:	06f12423          	sw	a5,104(sp)
    59fc:	07e12223          	sw	t5,100(sp)
    5a00:	00700713          	li	a4,7
    5a04:	25e74863          	blt	a4,t5,5c54 <_vfiprintf_r+0xfbc>
    5a08:	008c0c13          	add	s8,s8,8
    5a0c:	001f0f13          	add	t5,t5,1
    5a10:	d6cff06f          	j	4f7c <_vfiprintf_r+0x2e4>
    5a14:	00100f13          	li	t5,1
    5a18:	00000613          	li	a2,0
    5a1c:	000a0593          	mv	a1,s4
    5a20:	f55ff06f          	j	5974 <_vfiprintf_r+0xcdc>
    5a24:	00100513          	li	a0,1
    5a28:	00000613          	li	a2,0
    5a2c:	000a0693          	mv	a3,s4
    5a30:	e05ff06f          	j	5834 <_vfiprintf_r+0xb9c>
    5a34:	06078263          	beqz	a5,5a98 <_vfiprintf_r+0xe00>
    5a38:	06010613          	add	a2,sp,96
    5a3c:	00098593          	mv	a1,s3
    5a40:	00040513          	mv	a0,s0
    5a44:	03d12e23          	sw	t4,60(sp)
    5a48:	02e12c23          	sw	a4,56(sp)
    5a4c:	03112423          	sw	a7,40(sp)
    5a50:	03012223          	sw	a6,36(sp)
    5a54:	02512023          	sw	t0,32(sp)
    5a58:	01f12e23          	sw	t6,28(sp)
    5a5c:	01c12c23          	sw	t3,24(sp)
    5a60:	8fcff0ef          	jal	4b5c <__sprint_r.part.0>
    5a64:	f0051263          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    5a68:	06412603          	lw	a2,100(sp)
    5a6c:	06812783          	lw	a5,104(sp)
    5a70:	03c12e83          	lw	t4,60(sp)
    5a74:	03812703          	lw	a4,56(sp)
    5a78:	02812883          	lw	a7,40(sp)
    5a7c:	02412803          	lw	a6,36(sp)
    5a80:	02012283          	lw	t0,32(sp)
    5a84:	01c12f83          	lw	t6,28(sp)
    5a88:	01812e03          	lw	t3,24(sp)
    5a8c:	000a0c13          	mv	s8,s4
    5a90:	00160f13          	add	t5,a2,1
    5a94:	c58ff06f          	j	4eec <_vfiprintf_r+0x254>
    5a98:	380f8863          	beqz	t6,5e28 <_vfiprintf_r+0x1190>
    5a9c:	04410793          	add	a5,sp,68
    5aa0:	06f12623          	sw	a5,108(sp)
    5aa4:	00200793          	li	a5,2
    5aa8:	06f12823          	sw	a5,112(sp)
    5aac:	00100f13          	li	t5,1
    5ab0:	000a0c13          	mv	s8,s4
    5ab4:	000f0613          	mv	a2,t5
    5ab8:	008c0c13          	add	s8,s8,8
    5abc:	001f0f13          	add	t5,t5,1
    5ac0:	cacff06f          	j	4f6c <_vfiprintf_r+0x2d4>
    5ac4:	00200693          	li	a3,2
    5ac8:	00050e13          	mv	t3,a0
    5acc:	aa0684e3          	beqz	a3,5574 <_vfiprintf_r+0x8dc>
    5ad0:	01412503          	lw	a0,20(sp)
    5ad4:	11010813          	add	a6,sp,272
    5ad8:	00f7f693          	and	a3,a5,15
    5adc:	00d506b3          	add	a3,a0,a3
    5ae0:	0006c603          	lbu	a2,0(a3)
    5ae4:	0047d793          	srl	a5,a5,0x4
    5ae8:	01c59693          	sll	a3,a1,0x1c
    5aec:	00f6e7b3          	or	a5,a3,a5
    5af0:	0045d593          	srl	a1,a1,0x4
    5af4:	fec80fa3          	sb	a2,-1(a6)
    5af8:	00b7e6b3          	or	a3,a5,a1
    5afc:	fff80813          	add	a6,a6,-1
    5b00:	fc069ce3          	bnez	a3,5ad8 <_vfiprintf_r+0xe40>
    5b04:	11010793          	add	a5,sp,272
    5b08:	41078d33          	sub	s10,a5,a6
    5b0c:	00070e93          	mv	t4,a4
    5b10:	c9a754e3          	bge	a4,s10,5798 <_vfiprintf_r+0xb00>
    5b14:	000d0e93          	mv	t4,s10
    5b18:	c81ff06f          	j	5798 <_vfiprintf_r+0xb00>
    5b1c:	01000513          	li	a0,16
    5b20:	01b554e3          	bge	a0,s11,6328 <_vfiprintf_r+0x1690>
    5b24:	000a8693          	mv	a3,s5
    5b28:	0000a317          	auipc	t1,0xa
    5b2c:	ae830313          	add	t1,t1,-1304 # f610 <blanks.1>
    5b30:	02e12c23          	sw	a4,56(sp)
    5b34:	000d8a93          	mv	s5,s11
    5b38:	000c0713          	mv	a4,s8
    5b3c:	01000f13          	li	t5,16
    5b40:	00700393          	li	t2,7
    5b44:	01c12c23          	sw	t3,24(sp)
    5b48:	01f12e23          	sw	t6,28(sp)
    5b4c:	02512023          	sw	t0,32(sp)
    5b50:	03012223          	sw	a6,36(sp)
    5b54:	03112423          	sw	a7,40(sp)
    5b58:	03d12e23          	sw	t4,60(sp)
    5b5c:	00030c13          	mv	s8,t1
    5b60:	00068d93          	mv	s11,a3
    5b64:	01c0006f          	j	5b80 <_vfiprintf_r+0xee8>
    5b68:	00260513          	add	a0,a2,2
    5b6c:	00870713          	add	a4,a4,8
    5b70:	00058613          	mv	a2,a1
    5b74:	ff0a8a93          	add	s5,s5,-16
    5b78:	055f5c63          	bge	t5,s5,5bd0 <_vfiprintf_r+0xf38>
    5b7c:	00160593          	add	a1,a2,1
    5b80:	01078793          	add	a5,a5,16
    5b84:	01872023          	sw	s8,0(a4)
    5b88:	01e72223          	sw	t5,4(a4)
    5b8c:	06f12423          	sw	a5,104(sp)
    5b90:	06b12223          	sw	a1,100(sp)
    5b94:	fcb3dae3          	bge	t2,a1,5b68 <_vfiprintf_r+0xed0>
    5b98:	08078a63          	beqz	a5,5c2c <_vfiprintf_r+0xf94>
    5b9c:	06010613          	add	a2,sp,96
    5ba0:	00098593          	mv	a1,s3
    5ba4:	00040513          	mv	a0,s0
    5ba8:	fb5fe0ef          	jal	4b5c <__sprint_r.part.0>
    5bac:	da051e63          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    5bb0:	06412603          	lw	a2,100(sp)
    5bb4:	01000f13          	li	t5,16
    5bb8:	ff0a8a93          	add	s5,s5,-16
    5bbc:	06812783          	lw	a5,104(sp)
    5bc0:	000a0713          	mv	a4,s4
    5bc4:	00160513          	add	a0,a2,1
    5bc8:	00700393          	li	t2,7
    5bcc:	fb5f48e3          	blt	t5,s5,5b7c <_vfiprintf_r+0xee4>
    5bd0:	000c0313          	mv	t1,s8
    5bd4:	01812e03          	lw	t3,24(sp)
    5bd8:	00070c13          	mv	s8,a4
    5bdc:	01c12f83          	lw	t6,28(sp)
    5be0:	02012283          	lw	t0,32(sp)
    5be4:	02412803          	lw	a6,36(sp)
    5be8:	02812883          	lw	a7,40(sp)
    5bec:	03c12e83          	lw	t4,60(sp)
    5bf0:	03812703          	lw	a4,56(sp)
    5bf4:	000d8693          	mv	a3,s11
    5bf8:	000a8d93          	mv	s11,s5
    5bfc:	00068a93          	mv	s5,a3
    5c00:	01b787b3          	add	a5,a5,s11
    5c04:	006c2023          	sw	t1,0(s8)
    5c08:	01bc2223          	sw	s11,4(s8)
    5c0c:	06f12423          	sw	a5,104(sp)
    5c10:	06a12223          	sw	a0,100(sp)
    5c14:	00700613          	li	a2,7
    5c18:	12a64063          	blt	a2,a0,5d38 <_vfiprintf_r+0x10a0>
    5c1c:	008c0c13          	add	s8,s8,8
    5c20:	00150f13          	add	t5,a0,1
    5c24:	00050613          	mv	a2,a0
    5c28:	a8cff06f          	j	4eb4 <_vfiprintf_r+0x21c>
    5c2c:	00000613          	li	a2,0
    5c30:	00100513          	li	a0,1
    5c34:	000a0713          	mv	a4,s4
    5c38:	f3dff06f          	j	5b74 <_vfiprintf_r+0xedc>
    5c3c:	01d8d463          	bge	a7,t4,5c44 <_vfiprintf_r+0xfac>
    5c40:	000e8893          	mv	a7,t4
    5c44:	00c12783          	lw	a5,12(sp)
    5c48:	011787b3          	add	a5,a5,a7
    5c4c:	00f12623          	sw	a5,12(sp)
    5c50:	ba8ff06f          	j	4ff8 <_vfiprintf_r+0x360>
    5c54:	b4078ae3          	beqz	a5,57a8 <_vfiprintf_r+0xb10>
    5c58:	06010613          	add	a2,sp,96
    5c5c:	00098593          	mv	a1,s3
    5c60:	00040513          	mv	a0,s0
    5c64:	03d12223          	sw	t4,36(sp)
    5c68:	03112023          	sw	a7,32(sp)
    5c6c:	01012e23          	sw	a6,28(sp)
    5c70:	01c12c23          	sw	t3,24(sp)
    5c74:	ee9fe0ef          	jal	4b5c <__sprint_r.part.0>
    5c78:	ce051863          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    5c7c:	06412f03          	lw	t5,100(sp)
    5c80:	06812783          	lw	a5,104(sp)
    5c84:	02412e83          	lw	t4,36(sp)
    5c88:	02012883          	lw	a7,32(sp)
    5c8c:	01c12803          	lw	a6,28(sp)
    5c90:	01812e03          	lw	t3,24(sp)
    5c94:	000a0c13          	mv	s8,s4
    5c98:	001f0f13          	add	t5,t5,1
    5c9c:	ae0ff06f          	j	4f7c <_vfiprintf_r+0x2e4>
    5ca0:	06012223          	sw	zero,100(sp)
    5ca4:	000a0c13          	mv	s8,s4
    5ca8:	c84ff06f          	j	512c <_vfiprintf_r+0x494>
    5cac:	01067693          	and	a3,a2,16
    5cb0:	000aa783          	lw	a5,0(s5)
    5cb4:	004a8a93          	add	s5,s5,4
    5cb8:	12069c63          	bnez	a3,5df0 <_vfiprintf_r+0x1158>
    5cbc:	04067693          	and	a3,a2,64
    5cc0:	12068463          	beqz	a3,5de8 <_vfiprintf_r+0x1150>
    5cc4:	01079d93          	sll	s11,a5,0x10
    5cc8:	010ddd93          	srl	s11,s11,0x10
    5ccc:	00000d13          	li	s10,0
    5cd0:	ff4ff06f          	j	54c4 <_vfiprintf_r+0x82c>
    5cd4:	0106f613          	and	a2,a3,16
    5cd8:	000aa783          	lw	a5,0(s5)
    5cdc:	004a8a93          	add	s5,s5,4
    5ce0:	12061263          	bnez	a2,5e04 <_vfiprintf_r+0x116c>
    5ce4:	0406f613          	and	a2,a3,64
    5ce8:	10060a63          	beqz	a2,5dfc <_vfiprintf_r+0x1164>
    5cec:	01079793          	sll	a5,a5,0x10
    5cf0:	0107d793          	srl	a5,a5,0x10
    5cf4:	00000593          	li	a1,0
    5cf8:	83dff06f          	j	5534 <_vfiprintf_r+0x89c>
    5cfc:	010e7693          	and	a3,t3,16
    5d00:	000aa783          	lw	a5,0(s5)
    5d04:	004a8a93          	add	s5,s5,4
    5d08:	0c069863          	bnez	a3,5dd8 <_vfiprintf_r+0x1140>
    5d0c:	040e7693          	and	a3,t3,64
    5d10:	0c068063          	beqz	a3,5dd0 <_vfiprintf_r+0x1138>
    5d14:	01079d93          	sll	s11,a5,0x10
    5d18:	410ddd93          	sra	s11,s11,0x10
    5d1c:	41fddd13          	sra	s10,s11,0x1f
    5d20:	000d0693          	mv	a3,s10
    5d24:	f24ff06f          	j	5448 <_vfiprintf_r+0x7b0>
    5d28:	00100f13          	li	t5,1
    5d2c:	00000613          	li	a2,0
    5d30:	000a0c13          	mv	s8,s4
    5d34:	a38ff06f          	j	4f6c <_vfiprintf_r+0x2d4>
    5d38:	1a078463          	beqz	a5,5ee0 <_vfiprintf_r+0x1248>
    5d3c:	06010613          	add	a2,sp,96
    5d40:	00098593          	mv	a1,s3
    5d44:	00040513          	mv	a0,s0
    5d48:	03d12e23          	sw	t4,60(sp)
    5d4c:	02e12c23          	sw	a4,56(sp)
    5d50:	03112423          	sw	a7,40(sp)
    5d54:	03012223          	sw	a6,36(sp)
    5d58:	02512023          	sw	t0,32(sp)
    5d5c:	01f12e23          	sw	t6,28(sp)
    5d60:	01c12c23          	sw	t3,24(sp)
    5d64:	df9fe0ef          	jal	4b5c <__sprint_r.part.0>
    5d68:	c0051063          	bnez	a0,5168 <_vfiprintf_r+0x4d0>
    5d6c:	06412603          	lw	a2,100(sp)
    5d70:	06812783          	lw	a5,104(sp)
    5d74:	03c12e83          	lw	t4,60(sp)
    5d78:	03812703          	lw	a4,56(sp)
    5d7c:	02812883          	lw	a7,40(sp)
    5d80:	02412803          	lw	a6,36(sp)
    5d84:	02012283          	lw	t0,32(sp)
    5d88:	01c12f83          	lw	t6,28(sp)
    5d8c:	01812e03          	lw	t3,24(sp)
    5d90:	000a0c13          	mv	s8,s4
    5d94:	00160f13          	add	t5,a2,1
    5d98:	91cff06f          	j	4eb4 <_vfiprintf_r+0x21c>
    5d9c:	000d8e13          	mv	t3,s11
    5da0:	e88ff06f          	j	5428 <_vfiprintf_r+0x790>
    5da4:	00000e93          	li	t4,0
    5da8:	11010813          	add	a6,sp,272
    5dac:	9edff06f          	j	5798 <_vfiprintf_r+0xb00>
    5db0:	0589a503          	lw	a0,88(s3)
    5db4:	8b4fb0ef          	jal	e68 <__retarget_lock_acquire_recursive>
    5db8:	00c99783          	lh	a5,12(s3)
    5dbc:	f41fe06f          	j	4cfc <_vfiprintf_r+0x64>
    5dc0:	008c0c13          	add	s8,s8,8
    5dc4:	00150f13          	add	t5,a0,1
    5dc8:	00050613          	mv	a2,a0
    5dcc:	9a8ff06f          	j	4f74 <_vfiprintf_r+0x2dc>
    5dd0:	200e7693          	and	a3,t3,512
    5dd4:	50069463          	bnez	a3,62dc <_vfiprintf_r+0x1644>
    5dd8:	41f7dd13          	sra	s10,a5,0x1f
    5ddc:	00078d93          	mv	s11,a5
    5de0:	000d0693          	mv	a3,s10
    5de4:	e64ff06f          	j	5448 <_vfiprintf_r+0x7b0>
    5de8:	20067693          	and	a3,a2,512
    5dec:	4c069663          	bnez	a3,62b8 <_vfiprintf_r+0x1620>
    5df0:	00078d93          	mv	s11,a5
    5df4:	00000d13          	li	s10,0
    5df8:	eccff06f          	j	54c4 <_vfiprintf_r+0x82c>
    5dfc:	2006f613          	and	a2,a3,512
    5e00:	4c061863          	bnez	a2,62d0 <_vfiprintf_r+0x1638>
    5e04:	00000593          	li	a1,0
    5e08:	f2cff06f          	j	5534 <_vfiprintf_r+0x89c>
    5e0c:	00c12683          	lw	a3,12(sp)
    5e10:	000aa783          	lw	a5,0(s5)
    5e14:	004a8a93          	add	s5,s5,4
    5e18:	41f6d713          	sra	a4,a3,0x1f
    5e1c:	00d7a023          	sw	a3,0(a5)
    5e20:	00e7a223          	sw	a4,4(a5)
    5e24:	f8dfe06f          	j	4db0 <_vfiprintf_r+0x118>
    5e28:	00000613          	li	a2,0
    5e2c:	00100f13          	li	t5,1
    5e30:	000a0c13          	mv	s8,s4
    5e34:	938ff06f          	j	4f6c <_vfiprintf_r+0x2d4>
    5e38:	000aa783          	lw	a5,0(s5)
    5e3c:	00100e93          	li	t4,1
    5e40:	00100d13          	li	s10,1
    5e44:	0af10623          	sb	a5,172(sp)
    5e48:	0ac10593          	add	a1,sp,172
    5e4c:	db8ff06f          	j	5404 <_vfiprintf_r+0x76c>
    5e50:	000d0e93          	mv	t4,s10
    5e54:	00050813          	mv	a6,a0
    5e58:	941ff06f          	j	5798 <_vfiprintf_r+0xb00>
    5e5c:	fff00713          	li	a4,-1
    5e60:	00058c93          	mv	s9,a1
    5e64:	fb9fe06f          	j	4e1c <_vfiprintf_r+0x184>
    5e68:	000d8613          	mv	a2,s11
    5e6c:	e3cff06f          	j	54a8 <_vfiprintf_r+0x810>
    5e70:	00009797          	auipc	a5,0x9
    5e74:	13078793          	add	a5,a5,304 # efa0 <__fini_array_end+0x288>
    5e78:	000d8e13          	mv	t3,s11
    5e7c:	00f12a23          	sw	a5,20(sp)
    5e80:	020e7793          	and	a5,t3,32
    5e84:	1c078c63          	beqz	a5,605c <_vfiprintf_r+0x13c4>
    5e88:	007a8a93          	add	s5,s5,7
    5e8c:	ff8afa93          	and	s5,s5,-8
    5e90:	000aa783          	lw	a5,0(s5)
    5e94:	004aa583          	lw	a1,4(s5)
    5e98:	008a8a93          	add	s5,s5,8
    5e9c:	001e7613          	and	a2,t3,1
    5ea0:	00060e63          	beqz	a2,5ebc <_vfiprintf_r+0x1224>
    5ea4:	00b7e633          	or	a2,a5,a1
    5ea8:	00060a63          	beqz	a2,5ebc <_vfiprintf_r+0x1224>
    5eac:	03000613          	li	a2,48
    5eb0:	04c10223          	sb	a2,68(sp)
    5eb4:	04d102a3          	sb	a3,69(sp)
    5eb8:	002e6e13          	or	t3,t3,2
    5ebc:	bffe7e13          	and	t3,t3,-1025
    5ec0:	f3cff06f          	j	55fc <_vfiprintf_r+0x964>
    5ec4:	000d8693          	mv	a3,s11
    5ec8:	e50ff06f          	j	5518 <_vfiprintf_r+0x880>
    5ecc:	00009797          	auipc	a5,0x9
    5ed0:	0c078793          	add	a5,a5,192 # ef8c <__fini_array_end+0x274>
    5ed4:	000d8e13          	mv	t3,s11
    5ed8:	00f12a23          	sw	a5,20(sp)
    5edc:	fa5ff06f          	j	5e80 <_vfiprintf_r+0x11e8>
    5ee0:	04314603          	lbu	a2,67(sp)
    5ee4:	3a060a63          	beqz	a2,6298 <_vfiprintf_r+0x1600>
    5ee8:	04310793          	add	a5,sp,67
    5eec:	06f12623          	sw	a5,108(sp)
    5ef0:	00100793          	li	a5,1
    5ef4:	06f12823          	sw	a5,112(sp)
    5ef8:	00100f13          	li	t5,1
    5efc:	000a0c13          	mv	s8,s4
    5f00:	fe1fe06f          	j	4ee0 <_vfiprintf_r+0x248>
    5f04:	00800613          	li	a2,8
    5f08:	00000593          	li	a1,0
    5f0c:	05810513          	add	a0,sp,88
    5f10:	02e12023          	sw	a4,32(sp)
    5f14:	01112e23          	sw	a7,28(sp)
    5f18:	01c12c23          	sw	t3,24(sp)
    5f1c:	05012623          	sw	a6,76(sp)
    5f20:	01012823          	sw	a6,16(sp)
    5f24:	f4dfa0ef          	jal	e70 <memset>
    5f28:	02012703          	lw	a4,32(sp)
    5f2c:	01012803          	lw	a6,16(sp)
    5f30:	01812e03          	lw	t3,24(sp)
    5f34:	01c12883          	lw	a7,28(sp)
    5f38:	2a074463          	bltz	a4,61e0 <_vfiprintf_r+0x1548>
    5f3c:	00000d93          	li	s11,0
    5f40:	00000d13          	li	s10,0
    5f44:	01812823          	sw	s8,16(sp)
    5f48:	01012e23          	sw	a6,28(sp)
    5f4c:	000d8c13          	mv	s8,s11
    5f50:	03112023          	sw	a7,32(sp)
    5f54:	000c8d93          	mv	s11,s9
    5f58:	000a8c93          	mv	s9,s5
    5f5c:	000d0a93          	mv	s5,s10
    5f60:	00098d13          	mv	s10,s3
    5f64:	00070993          	mv	s3,a4
    5f68:	0300006f          	j	5f98 <_vfiprintf_r+0x1300>
    5f6c:	05810693          	add	a3,sp,88
    5f70:	0ac10593          	add	a1,sp,172
    5f74:	00040513          	mv	a0,s0
    5f78:	069040ef          	jal	a7e0 <_wcrtomb_r>
    5f7c:	fff00793          	li	a5,-1
    5f80:	48f50063          	beq	a0,a5,6400 <_vfiprintf_r+0x1768>
    5f84:	00aa87b3          	add	a5,s5,a0
    5f88:	02f9c063          	blt	s3,a5,5fa8 <_vfiprintf_r+0x1310>
    5f8c:	004c0c13          	add	s8,s8,4
    5f90:	45378463          	beq	a5,s3,63d8 <_vfiprintf_r+0x1740>
    5f94:	00078a93          	mv	s5,a5
    5f98:	04c12783          	lw	a5,76(sp)
    5f9c:	018787b3          	add	a5,a5,s8
    5fa0:	0007a603          	lw	a2,0(a5)
    5fa4:	fc0614e3          	bnez	a2,5f6c <_vfiprintf_r+0x12d4>
    5fa8:	01012c03          	lw	s8,16(sp)
    5fac:	01812e03          	lw	t3,24(sp)
    5fb0:	01c12803          	lw	a6,28(sp)
    5fb4:	02012883          	lw	a7,32(sp)
    5fb8:	000d0993          	mv	s3,s10
    5fbc:	000a8d13          	mv	s10,s5
    5fc0:	000c8a93          	mv	s5,s9
    5fc4:	000d8c93          	mv	s9,s11
    5fc8:	280d0e63          	beqz	s10,6264 <_vfiprintf_r+0x15cc>
    5fcc:	06300793          	li	a5,99
    5fd0:	33a7d463          	bge	a5,s10,62f8 <_vfiprintf_r+0x1660>
    5fd4:	001d0593          	add	a1,s10,1
    5fd8:	00040513          	mv	a0,s0
    5fdc:	01112c23          	sw	a7,24(sp)
    5fe0:	01c12823          	sw	t3,16(sp)
    5fe4:	de8fb0ef          	jal	15cc <_malloc_r>
    5fe8:	01012e03          	lw	t3,16(sp)
    5fec:	01812883          	lw	a7,24(sp)
    5ff0:	00050813          	mv	a6,a0
    5ff4:	42050063          	beqz	a0,6414 <_vfiprintf_r+0x177c>
    5ff8:	00a12823          	sw	a0,16(sp)
    5ffc:	00800613          	li	a2,8
    6000:	00000593          	li	a1,0
    6004:	05810513          	add	a0,sp,88
    6008:	03112023          	sw	a7,32(sp)
    600c:	01c12e23          	sw	t3,28(sp)
    6010:	01012c23          	sw	a6,24(sp)
    6014:	e5dfa0ef          	jal	e70 <memset>
    6018:	01812803          	lw	a6,24(sp)
    601c:	05810713          	add	a4,sp,88
    6020:	000d0693          	mv	a3,s10
    6024:	00080593          	mv	a1,a6
    6028:	04c10613          	add	a2,sp,76
    602c:	00040513          	mv	a0,s0
    6030:	03d040ef          	jal	a86c <_wcsrtombs_r>
    6034:	01812803          	lw	a6,24(sp)
    6038:	01c12e03          	lw	t3,28(sp)
    603c:	02012883          	lw	a7,32(sp)
    6040:	40ad1063          	bne	s10,a0,6440 <_vfiprintf_r+0x17a8>
    6044:	fffd4e93          	not	t4,s10
    6048:	01a807b3          	add	a5,a6,s10
    604c:	41fede93          	sra	t4,t4,0x1f
    6050:	00078023          	sb	zero,0(a5)
    6054:	01dd7eb3          	and	t4,s10,t4
    6058:	2140006f          	j	626c <_vfiprintf_r+0x15d4>
    605c:	010e7613          	and	a2,t3,16
    6060:	000aa783          	lw	a5,0(s5)
    6064:	004a8a93          	add	s5,s5,4
    6068:	02061263          	bnez	a2,608c <_vfiprintf_r+0x13f4>
    606c:	040e7613          	and	a2,t3,64
    6070:	00060a63          	beqz	a2,6084 <_vfiprintf_r+0x13ec>
    6074:	01079793          	sll	a5,a5,0x10
    6078:	0107d793          	srl	a5,a5,0x10
    607c:	00000593          	li	a1,0
    6080:	e1dff06f          	j	5e9c <_vfiprintf_r+0x1204>
    6084:	200e7613          	and	a2,t3,512
    6088:	22061e63          	bnez	a2,62c4 <_vfiprintf_r+0x162c>
    608c:	00000593          	li	a1,0
    6090:	e0dff06f          	j	5e9c <_vfiprintf_r+0x1204>
    6094:	400e7793          	and	a5,t3,1024
    6098:	00000693          	li	a3,0
    609c:	11010e93          	add	t4,sp,272
    60a0:	01812823          	sw	s8,16(sp)
    60a4:	02812223          	sw	s0,36(sp)
    60a8:	03912c23          	sw	s9,56(sp)
    60ac:	03512e23          	sw	s5,60(sp)
    60b0:	02c12c83          	lw	s9,44(sp)
    60b4:	01c12c23          	sw	t3,24(sp)
    60b8:	01112e23          	sw	a7,28(sp)
    60bc:	02e12023          	sw	a4,32(sp)
    60c0:	00078c13          	mv	s8,a5
    60c4:	00068413          	mv	s0,a3
    60c8:	03312423          	sw	s3,40(sp)
    60cc:	000e8a93          	mv	s5,t4
    60d0:	0280006f          	j	60f8 <_vfiprintf_r+0x1460>
    60d4:	00a00613          	li	a2,10
    60d8:	00000693          	li	a3,0
    60dc:	000d8513          	mv	a0,s11
    60e0:	000d0593          	mv	a1,s10
    60e4:	268050ef          	jal	b34c <__udivdi3>
    60e8:	220d0a63          	beqz	s10,631c <_vfiprintf_r+0x1684>
    60ec:	00050d93          	mv	s11,a0
    60f0:	00058d13          	mv	s10,a1
    60f4:	00098a93          	mv	s5,s3
    60f8:	00a00613          	li	a2,10
    60fc:	00000693          	li	a3,0
    6100:	000d8513          	mv	a0,s11
    6104:	000d0593          	mv	a1,s10
    6108:	0f1050ef          	jal	b9f8 <__umoddi3>
    610c:	03050513          	add	a0,a0,48
    6110:	feaa8fa3          	sb	a0,-1(s5)
    6114:	fffa8993          	add	s3,s5,-1
    6118:	00140413          	add	s0,s0,1
    611c:	fa0c0ce3          	beqz	s8,60d4 <_vfiprintf_r+0x143c>
    6120:	000cc783          	lbu	a5,0(s9)
    6124:	fa8798e3          	bne	a5,s0,60d4 <_vfiprintf_r+0x143c>
    6128:	0ff00793          	li	a5,255
    612c:	faf404e3          	beq	s0,a5,60d4 <_vfiprintf_r+0x143c>
    6130:	0e0d1a63          	bnez	s10,6224 <_vfiprintf_r+0x158c>
    6134:	00900793          	li	a5,9
    6138:	0fb7e663          	bltu	a5,s11,6224 <_vfiprintf_r+0x158c>
    613c:	00098813          	mv	a6,s3
    6140:	03912623          	sw	s9,44(sp)
    6144:	01012c03          	lw	s8,16(sp)
    6148:	01812e03          	lw	t3,24(sp)
    614c:	01c12883          	lw	a7,28(sp)
    6150:	02012703          	lw	a4,32(sp)
    6154:	02412403          	lw	s0,36(sp)
    6158:	02812983          	lw	s3,40(sp)
    615c:	03812c83          	lw	s9,56(sp)
    6160:	03c12a83          	lw	s5,60(sp)
    6164:	9a1ff06f          	j	5b04 <_vfiprintf_r+0xe6c>
    6168:	00068e13          	mv	t3,a3
    616c:	00000693          	li	a3,0
    6170:	c0068263          	beqz	a3,5574 <_vfiprintf_r+0x8dc>
    6174:	95dff06f          	j	5ad0 <_vfiprintf_r+0xe38>
    6178:	00040513          	mv	a0,s0
    617c:	115000ef          	jal	6a90 <__sinit>
    6180:	b61fe06f          	j	4ce0 <_vfiprintf_r+0x48>
    6184:	001cc683          	lbu	a3,1(s9)
    6188:	200ded93          	or	s11,s11,512
    618c:	001c8c93          	add	s9,s9,1
    6190:	c89fe06f          	j	4e18 <_vfiprintf_r+0x180>
    6194:	001cc683          	lbu	a3,1(s9)
    6198:	020ded93          	or	s11,s11,32
    619c:	001c8c93          	add	s9,s9,1
    61a0:	c79fe06f          	j	4e18 <_vfiprintf_r+0x180>
    61a4:	000aa783          	lw	a5,0(s5)
    61a8:	00c12703          	lw	a4,12(sp)
    61ac:	004a8a93          	add	s5,s5,4
    61b0:	00e7a023          	sw	a4,0(a5)
    61b4:	bfdfe06f          	j	4db0 <_vfiprintf_r+0x118>
    61b8:	00600793          	li	a5,6
    61bc:	00070d13          	mv	s10,a4
    61c0:	0ce7e863          	bltu	a5,a4,6290 <_vfiprintf_r+0x15f8>
    61c4:	000d0e93          	mv	t4,s10
    61c8:	00009817          	auipc	a6,0x9
    61cc:	dec80813          	add	a6,a6,-532 # efb4 <__fini_array_end+0x29c>
    61d0:	cb9fe06f          	j	4e88 <_vfiprintf_r+0x1f0>
    61d4:	00000793          	li	a5,0
    61d8:	00000593          	li	a1,0
    61dc:	8f5ff06f          	j	5ad0 <_vfiprintf_r+0xe38>
    61e0:	05810713          	add	a4,sp,88
    61e4:	00000693          	li	a3,0
    61e8:	04c10613          	add	a2,sp,76
    61ec:	00000593          	li	a1,0
    61f0:	00040513          	mv	a0,s0
    61f4:	01112e23          	sw	a7,28(sp)
    61f8:	01012c23          	sw	a6,24(sp)
    61fc:	01c12823          	sw	t3,16(sp)
    6200:	66c040ef          	jal	a86c <_wcsrtombs_r>
    6204:	fff00793          	li	a5,-1
    6208:	01012e03          	lw	t3,16(sp)
    620c:	01812803          	lw	a6,24(sp)
    6210:	01c12883          	lw	a7,28(sp)
    6214:	00050d13          	mv	s10,a0
    6218:	1ef50e63          	beq	a0,a5,6414 <_vfiprintf_r+0x177c>
    621c:	05012623          	sw	a6,76(sp)
    6220:	da9ff06f          	j	5fc8 <_vfiprintf_r+0x1330>
    6224:	03012783          	lw	a5,48(sp)
    6228:	03412583          	lw	a1,52(sp)
    622c:	00000413          	li	s0,0
    6230:	40f989b3          	sub	s3,s3,a5
    6234:	00078613          	mv	a2,a5
    6238:	00098513          	mv	a0,s3
    623c:	43c010ef          	jal	7678 <strncpy>
    6240:	001cc783          	lbu	a5,1(s9)
    6244:	00a00613          	li	a2,10
    6248:	00000693          	li	a3,0
    624c:	00f037b3          	snez	a5,a5
    6250:	000d8513          	mv	a0,s11
    6254:	000d0593          	mv	a1,s10
    6258:	00fc8cb3          	add	s9,s9,a5
    625c:	0f0050ef          	jal	b34c <__udivdi3>
    6260:	e8dff06f          	j	60ec <_vfiprintf_r+0x1454>
    6264:	00000e93          	li	t4,0
    6268:	00012823          	sw	zero,16(sp)
    626c:	04314783          	lbu	a5,67(sp)
    6270:	00000713          	li	a4,0
    6274:	00000f93          	li	t6,0
    6278:	a0079063          	bnez	a5,5478 <_vfiprintf_r+0x7e0>
    627c:	c19fe06f          	j	4e94 <_vfiprintf_r+0x1fc>
    6280:	00100f13          	li	t5,1
    6284:	00000613          	li	a2,0
    6288:	000a0c13          	mv	s8,s4
    628c:	ce9fe06f          	j	4f74 <_vfiprintf_r+0x2dc>
    6290:	00600d13          	li	s10,6
    6294:	f31ff06f          	j	61c4 <_vfiprintf_r+0x152c>
    6298:	00100f13          	li	t5,1
    629c:	000a0c13          	mv	s8,s4
    62a0:	c4dfe06f          	j	4eec <_vfiprintf_r+0x254>
    62a4:	000aa783          	lw	a5,0(s5)
    62a8:	00c12703          	lw	a4,12(sp)
    62ac:	004a8a93          	add	s5,s5,4
    62b0:	00e79023          	sh	a4,0(a5)
    62b4:	afdfe06f          	j	4db0 <_vfiprintf_r+0x118>
    62b8:	0ff7fd93          	zext.b	s11,a5
    62bc:	00000d13          	li	s10,0
    62c0:	a04ff06f          	j	54c4 <_vfiprintf_r+0x82c>
    62c4:	0ff7f793          	zext.b	a5,a5
    62c8:	00000593          	li	a1,0
    62cc:	bd1ff06f          	j	5e9c <_vfiprintf_r+0x1204>
    62d0:	0ff7f793          	zext.b	a5,a5
    62d4:	00000593          	li	a1,0
    62d8:	a5cff06f          	j	5534 <_vfiprintf_r+0x89c>
    62dc:	01879d93          	sll	s11,a5,0x18
    62e0:	418ddd93          	sra	s11,s11,0x18
    62e4:	41fddd13          	sra	s10,s11,0x1f
    62e8:	000d0693          	mv	a3,s10
    62ec:	95cff06f          	j	5448 <_vfiprintf_r+0x7b0>
    62f0:	03000793          	li	a5,48
    62f4:	c8cff06f          	j	5780 <_vfiprintf_r+0xae8>
    62f8:	00012823          	sw	zero,16(sp)
    62fc:	0ac10813          	add	a6,sp,172
    6300:	cfdff06f          	j	5ffc <_vfiprintf_r+0x1364>
    6304:	0589a503          	lw	a0,88(s3)
    6308:	b65fa0ef          	jal	e6c <__retarget_lock_release_recursive>
    630c:	d51fe06f          	j	505c <_vfiprintf_r+0x3c4>
    6310:	00070e93          	mv	t4,a4
    6314:	00070d13          	mv	s10,a4
    6318:	f55ff06f          	j	626c <_vfiprintf_r+0x15d4>
    631c:	00900793          	li	a5,9
    6320:	ddb7e6e3          	bltu	a5,s11,60ec <_vfiprintf_r+0x1454>
    6324:	e19ff06f          	j	613c <_vfiprintf_r+0x14a4>
    6328:	00058513          	mv	a0,a1
    632c:	00009317          	auipc	t1,0x9
    6330:	2e430313          	add	t1,t1,740 # f610 <blanks.1>
    6334:	8cdff06f          	j	5c00 <_vfiprintf_r+0xf68>
    6338:	00080513          	mv	a0,a6
    633c:	03112023          	sw	a7,32(sp)
    6340:	01012c23          	sw	a6,24(sp)
    6344:	01b12e23          	sw	s11,28(sp)
    6348:	da9fa0ef          	jal	10f0 <strlen>
    634c:	fff54e93          	not	t4,a0
    6350:	41fede93          	sra	t4,t4,0x1f
    6354:	01812803          	lw	a6,24(sp)
    6358:	01c12e03          	lw	t3,28(sp)
    635c:	02012883          	lw	a7,32(sp)
    6360:	00050d13          	mv	s10,a0
    6364:	01d57eb3          	and	t4,a0,t4
    6368:	00012823          	sw	zero,16(sp)
    636c:	f01ff06f          	j	626c <_vfiprintf_r+0x15d4>
    6370:	06010613          	add	a2,sp,96
    6374:	00098593          	mv	a1,s3
    6378:	00040513          	mv	a0,s0
    637c:	fe0fe0ef          	jal	4b5c <__sprint_r.part.0>
    6380:	00051463          	bnez	a0,6388 <_vfiprintf_r+0x16f0>
    6384:	dc5fe06f          	j	5148 <_vfiprintf_r+0x4b0>
    6388:	df5fe06f          	j	517c <_vfiprintf_r+0x4e4>
    638c:	00168613          	add	a2,a3,1
    6390:	00009317          	auipc	t1,0x9
    6394:	28030313          	add	t1,t1,640 # f610 <blanks.1>
    6398:	f19fe06f          	j	52b0 <_vfiprintf_r+0x618>
    639c:	000f0513          	mv	a0,t5
    63a0:	00009f97          	auipc	t6,0x9
    63a4:	260f8f93          	add	t6,t6,608 # f600 <zeroes.0>
    63a8:	d10ff06f          	j	58b8 <_vfiprintf_r+0xc20>
    63ac:	0649a783          	lw	a5,100(s3)
    63b0:	0017f793          	and	a5,a5,1
    63b4:	00079c63          	bnez	a5,63cc <_vfiprintf_r+0x1734>
    63b8:	00c9d783          	lhu	a5,12(s3)
    63bc:	2007f793          	and	a5,a5,512
    63c0:	00079663          	bnez	a5,63cc <_vfiprintf_r+0x1734>
    63c4:	0589a503          	lw	a0,88(s3)
    63c8:	aa5fa0ef          	jal	e6c <__retarget_lock_release_recursive>
    63cc:	fff00793          	li	a5,-1
    63d0:	00f12623          	sw	a5,12(sp)
    63d4:	de5fe06f          	j	51b8 <_vfiprintf_r+0x520>
    63d8:	00098713          	mv	a4,s3
    63dc:	000c8a93          	mv	s5,s9
    63e0:	000d0993          	mv	s3,s10
    63e4:	01012c03          	lw	s8,16(sp)
    63e8:	01812e03          	lw	t3,24(sp)
    63ec:	01c12803          	lw	a6,28(sp)
    63f0:	02012883          	lw	a7,32(sp)
    63f4:	000d8c93          	mv	s9,s11
    63f8:	00070d13          	mv	s10,a4
    63fc:	bcdff06f          	j	5fc8 <_vfiprintf_r+0x1330>
    6400:	00cd1783          	lh	a5,12(s10)
    6404:	000d0993          	mv	s3,s10
    6408:	0407e793          	or	a5,a5,64
    640c:	00fd1623          	sh	a5,12(s10)
    6410:	d71fe06f          	j	5180 <_vfiprintf_r+0x4e8>
    6414:	00c99783          	lh	a5,12(s3)
    6418:	0407e793          	or	a5,a5,64
    641c:	00f99623          	sh	a5,12(s3)
    6420:	d61fe06f          	j	5180 <_vfiprintf_r+0x4e8>
    6424:	000aa703          	lw	a4,0(s5)
    6428:	004a8a93          	add	s5,s5,4
    642c:	00075463          	bgez	a4,6434 <_vfiprintf_r+0x179c>
    6430:	fff00713          	li	a4,-1
    6434:	001cc683          	lbu	a3,1(s9)
    6438:	00058c93          	mv	s9,a1
    643c:	9ddfe06f          	j	4e18 <_vfiprintf_r+0x180>
    6440:	00c9d783          	lhu	a5,12(s3)
    6444:	0407e793          	or	a5,a5,64
    6448:	00f99623          	sh	a5,12(s3)
    644c:	d1dfe06f          	j	5168 <_vfiprintf_r+0x4d0>

00006450 <__sbprintf>:
    6450:	b7010113          	add	sp,sp,-1168
    6454:	00c59783          	lh	a5,12(a1)
    6458:	00e5d703          	lhu	a4,14(a1)
    645c:	48812423          	sw	s0,1160(sp)
    6460:	00058413          	mv	s0,a1
    6464:	000105b7          	lui	a1,0x10
    6468:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x79d>
    646c:	06442303          	lw	t1,100(s0)
    6470:	01c42883          	lw	a7,28(s0)
    6474:	02442803          	lw	a6,36(s0)
    6478:	01071713          	sll	a4,a4,0x10
    647c:	00b7f7b3          	and	a5,a5,a1
    6480:	00e7e7b3          	or	a5,a5,a4
    6484:	40000593          	li	a1,1024
    6488:	49212023          	sw	s2,1152(sp)
    648c:	00f12a23          	sw	a5,20(sp)
    6490:	00050913          	mv	s2,a0
    6494:	07010793          	add	a5,sp,112
    6498:	06010513          	add	a0,sp,96
    649c:	48112623          	sw	ra,1164(sp)
    64a0:	48912223          	sw	s1,1156(sp)
    64a4:	47312e23          	sw	s3,1148(sp)
    64a8:	00060493          	mv	s1,a2
    64ac:	00068993          	mv	s3,a3
    64b0:	06612623          	sw	t1,108(sp)
    64b4:	03112223          	sw	a7,36(sp)
    64b8:	03012623          	sw	a6,44(sp)
    64bc:	00f12423          	sw	a5,8(sp)
    64c0:	00f12c23          	sw	a5,24(sp)
    64c4:	00b12823          	sw	a1,16(sp)
    64c8:	00b12e23          	sw	a1,28(sp)
    64cc:	02012023          	sw	zero,32(sp)
    64d0:	991fa0ef          	jal	e60 <__retarget_lock_init_recursive>
    64d4:	00048613          	mv	a2,s1
    64d8:	00098693          	mv	a3,s3
    64dc:	00810593          	add	a1,sp,8
    64e0:	00090513          	mv	a0,s2
    64e4:	fb4fe0ef          	jal	4c98 <_vfiprintf_r>
    64e8:	00050493          	mv	s1,a0
    64ec:	04055263          	bgez	a0,6530 <__sbprintf+0xe0>
    64f0:	01415783          	lhu	a5,20(sp)
    64f4:	0407f793          	and	a5,a5,64
    64f8:	00078863          	beqz	a5,6508 <__sbprintf+0xb8>
    64fc:	00c45783          	lhu	a5,12(s0)
    6500:	0407e793          	or	a5,a5,64
    6504:	00f41623          	sh	a5,12(s0)
    6508:	06012503          	lw	a0,96(sp)
    650c:	959fa0ef          	jal	e64 <__retarget_lock_close_recursive>
    6510:	48c12083          	lw	ra,1164(sp)
    6514:	48812403          	lw	s0,1160(sp)
    6518:	48012903          	lw	s2,1152(sp)
    651c:	47c12983          	lw	s3,1148(sp)
    6520:	00048513          	mv	a0,s1
    6524:	48412483          	lw	s1,1156(sp)
    6528:	49010113          	add	sp,sp,1168
    652c:	00008067          	ret
    6530:	00810593          	add	a1,sp,8
    6534:	00090513          	mv	a0,s2
    6538:	25c000ef          	jal	6794 <_fflush_r>
    653c:	fa050ae3          	beqz	a0,64f0 <__sbprintf+0xa0>
    6540:	fff00493          	li	s1,-1
    6544:	fadff06f          	j	64f0 <__sbprintf+0xa0>

00006548 <__sflush_r>:
    6548:	00c59703          	lh	a4,12(a1)
    654c:	fe010113          	add	sp,sp,-32
    6550:	00812c23          	sw	s0,24(sp)
    6554:	01312623          	sw	s3,12(sp)
    6558:	00112e23          	sw	ra,28(sp)
    655c:	00877793          	and	a5,a4,8
    6560:	00058413          	mv	s0,a1
    6564:	00050993          	mv	s3,a0
    6568:	12079063          	bnez	a5,6688 <__sflush_r+0x140>
    656c:	000017b7          	lui	a5,0x1
    6570:	80078793          	add	a5,a5,-2048 # 800 <main+0x530>
    6574:	0045a683          	lw	a3,4(a1)
    6578:	00f767b3          	or	a5,a4,a5
    657c:	00f59623          	sh	a5,12(a1)
    6580:	18d05263          	blez	a3,6704 <__sflush_r+0x1bc>
    6584:	02842803          	lw	a6,40(s0)
    6588:	0e080463          	beqz	a6,6670 <__sflush_r+0x128>
    658c:	00912a23          	sw	s1,20(sp)
    6590:	01371693          	sll	a3,a4,0x13
    6594:	0009a483          	lw	s1,0(s3)
    6598:	0009a023          	sw	zero,0(s3)
    659c:	01c42583          	lw	a1,28(s0)
    65a0:	1606ce63          	bltz	a3,671c <__sflush_r+0x1d4>
    65a4:	00000613          	li	a2,0
    65a8:	00100693          	li	a3,1
    65ac:	00098513          	mv	a0,s3
    65b0:	000800e7          	jalr	a6
    65b4:	fff00793          	li	a5,-1
    65b8:	00050613          	mv	a2,a0
    65bc:	1af50463          	beq	a0,a5,6764 <__sflush_r+0x21c>
    65c0:	00c41783          	lh	a5,12(s0)
    65c4:	02842803          	lw	a6,40(s0)
    65c8:	01c42583          	lw	a1,28(s0)
    65cc:	0047f793          	and	a5,a5,4
    65d0:	00078e63          	beqz	a5,65ec <__sflush_r+0xa4>
    65d4:	00442703          	lw	a4,4(s0)
    65d8:	03042783          	lw	a5,48(s0)
    65dc:	40e60633          	sub	a2,a2,a4
    65e0:	00078663          	beqz	a5,65ec <__sflush_r+0xa4>
    65e4:	03c42783          	lw	a5,60(s0)
    65e8:	40f60633          	sub	a2,a2,a5
    65ec:	00000693          	li	a3,0
    65f0:	00098513          	mv	a0,s3
    65f4:	000800e7          	jalr	a6
    65f8:	fff00793          	li	a5,-1
    65fc:	12f51463          	bne	a0,a5,6724 <__sflush_r+0x1dc>
    6600:	0009a683          	lw	a3,0(s3)
    6604:	01d00793          	li	a5,29
    6608:	00c41703          	lh	a4,12(s0)
    660c:	16d7ea63          	bltu	a5,a3,6780 <__sflush_r+0x238>
    6610:	204007b7          	lui	a5,0x20400
    6614:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    6618:	00d7d7b3          	srl	a5,a5,a3
    661c:	0017f793          	and	a5,a5,1
    6620:	16078063          	beqz	a5,6780 <__sflush_r+0x238>
    6624:	01042603          	lw	a2,16(s0)
    6628:	fffff7b7          	lui	a5,0xfffff
    662c:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6630:	00f777b3          	and	a5,a4,a5
    6634:	00f41623          	sh	a5,12(s0)
    6638:	00042223          	sw	zero,4(s0)
    663c:	00c42023          	sw	a2,0(s0)
    6640:	01371793          	sll	a5,a4,0x13
    6644:	0007d463          	bgez	a5,664c <__sflush_r+0x104>
    6648:	10068263          	beqz	a3,674c <__sflush_r+0x204>
    664c:	03042583          	lw	a1,48(s0)
    6650:	0099a023          	sw	s1,0(s3)
    6654:	10058463          	beqz	a1,675c <__sflush_r+0x214>
    6658:	04040793          	add	a5,s0,64
    665c:	00f58663          	beq	a1,a5,6668 <__sflush_r+0x120>
    6660:	00098513          	mv	a0,s3
    6664:	c5dfa0ef          	jal	12c0 <_free_r>
    6668:	01412483          	lw	s1,20(sp)
    666c:	02042823          	sw	zero,48(s0)
    6670:	00000513          	li	a0,0
    6674:	01c12083          	lw	ra,28(sp)
    6678:	01812403          	lw	s0,24(sp)
    667c:	00c12983          	lw	s3,12(sp)
    6680:	02010113          	add	sp,sp,32
    6684:	00008067          	ret
    6688:	01212823          	sw	s2,16(sp)
    668c:	0105a903          	lw	s2,16(a1)
    6690:	08090263          	beqz	s2,6714 <__sflush_r+0x1cc>
    6694:	00912a23          	sw	s1,20(sp)
    6698:	0005a483          	lw	s1,0(a1)
    669c:	00377713          	and	a4,a4,3
    66a0:	0125a023          	sw	s2,0(a1)
    66a4:	412484b3          	sub	s1,s1,s2
    66a8:	00000793          	li	a5,0
    66ac:	00071463          	bnez	a4,66b4 <__sflush_r+0x16c>
    66b0:	0145a783          	lw	a5,20(a1)
    66b4:	00f42423          	sw	a5,8(s0)
    66b8:	00904863          	bgtz	s1,66c8 <__sflush_r+0x180>
    66bc:	0540006f          	j	6710 <__sflush_r+0x1c8>
    66c0:	00a90933          	add	s2,s2,a0
    66c4:	04905663          	blez	s1,6710 <__sflush_r+0x1c8>
    66c8:	02442783          	lw	a5,36(s0)
    66cc:	01c42583          	lw	a1,28(s0)
    66d0:	00048693          	mv	a3,s1
    66d4:	00090613          	mv	a2,s2
    66d8:	00098513          	mv	a0,s3
    66dc:	000780e7          	jalr	a5
    66e0:	40a484b3          	sub	s1,s1,a0
    66e4:	fca04ee3          	bgtz	a0,66c0 <__sflush_r+0x178>
    66e8:	00c41703          	lh	a4,12(s0)
    66ec:	01012903          	lw	s2,16(sp)
    66f0:	04076713          	or	a4,a4,64
    66f4:	01412483          	lw	s1,20(sp)
    66f8:	00e41623          	sh	a4,12(s0)
    66fc:	fff00513          	li	a0,-1
    6700:	f75ff06f          	j	6674 <__sflush_r+0x12c>
    6704:	03c5a683          	lw	a3,60(a1)
    6708:	e6d04ee3          	bgtz	a3,6584 <__sflush_r+0x3c>
    670c:	f65ff06f          	j	6670 <__sflush_r+0x128>
    6710:	01412483          	lw	s1,20(sp)
    6714:	01012903          	lw	s2,16(sp)
    6718:	f59ff06f          	j	6670 <__sflush_r+0x128>
    671c:	05042603          	lw	a2,80(s0)
    6720:	eadff06f          	j	65cc <__sflush_r+0x84>
    6724:	00c41703          	lh	a4,12(s0)
    6728:	01042683          	lw	a3,16(s0)
    672c:	fffff7b7          	lui	a5,0xfffff
    6730:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6734:	00f777b3          	and	a5,a4,a5
    6738:	00f41623          	sh	a5,12(s0)
    673c:	00042223          	sw	zero,4(s0)
    6740:	00d42023          	sw	a3,0(s0)
    6744:	01371793          	sll	a5,a4,0x13
    6748:	f007d2e3          	bgez	a5,664c <__sflush_r+0x104>
    674c:	03042583          	lw	a1,48(s0)
    6750:	04a42823          	sw	a0,80(s0)
    6754:	0099a023          	sw	s1,0(s3)
    6758:	f00590e3          	bnez	a1,6658 <__sflush_r+0x110>
    675c:	01412483          	lw	s1,20(sp)
    6760:	f11ff06f          	j	6670 <__sflush_r+0x128>
    6764:	0009a783          	lw	a5,0(s3)
    6768:	e4078ce3          	beqz	a5,65c0 <__sflush_r+0x78>
    676c:	01d00713          	li	a4,29
    6770:	00e78c63          	beq	a5,a4,6788 <__sflush_r+0x240>
    6774:	01600713          	li	a4,22
    6778:	00e78863          	beq	a5,a4,6788 <__sflush_r+0x240>
    677c:	00c41703          	lh	a4,12(s0)
    6780:	04076713          	or	a4,a4,64
    6784:	f71ff06f          	j	66f4 <__sflush_r+0x1ac>
    6788:	0099a023          	sw	s1,0(s3)
    678c:	01412483          	lw	s1,20(sp)
    6790:	ee1ff06f          	j	6670 <__sflush_r+0x128>

00006794 <_fflush_r>:
    6794:	ff010113          	add	sp,sp,-16
    6798:	00812423          	sw	s0,8(sp)
    679c:	00912223          	sw	s1,4(sp)
    67a0:	00112623          	sw	ra,12(sp)
    67a4:	01212023          	sw	s2,0(sp)
    67a8:	00050493          	mv	s1,a0
    67ac:	00058413          	mv	s0,a1
    67b0:	00050663          	beqz	a0,67bc <_fflush_r+0x28>
    67b4:	03452783          	lw	a5,52(a0)
    67b8:	0a078a63          	beqz	a5,686c <_fflush_r+0xd8>
    67bc:	00c41783          	lh	a5,12(s0)
    67c0:	00000913          	li	s2,0
    67c4:	04078063          	beqz	a5,6804 <_fflush_r+0x70>
    67c8:	06442703          	lw	a4,100(s0)
    67cc:	00177713          	and	a4,a4,1
    67d0:	00071663          	bnez	a4,67dc <_fflush_r+0x48>
    67d4:	2007f793          	and	a5,a5,512
    67d8:	04078463          	beqz	a5,6820 <_fflush_r+0x8c>
    67dc:	00040593          	mv	a1,s0
    67e0:	00048513          	mv	a0,s1
    67e4:	d65ff0ef          	jal	6548 <__sflush_r>
    67e8:	06442783          	lw	a5,100(s0)
    67ec:	00050913          	mv	s2,a0
    67f0:	0017f793          	and	a5,a5,1
    67f4:	00079863          	bnez	a5,6804 <_fflush_r+0x70>
    67f8:	00c45783          	lhu	a5,12(s0)
    67fc:	2007f793          	and	a5,a5,512
    6800:	04078463          	beqz	a5,6848 <_fflush_r+0xb4>
    6804:	00c12083          	lw	ra,12(sp)
    6808:	00812403          	lw	s0,8(sp)
    680c:	00412483          	lw	s1,4(sp)
    6810:	00090513          	mv	a0,s2
    6814:	00012903          	lw	s2,0(sp)
    6818:	01010113          	add	sp,sp,16
    681c:	00008067          	ret
    6820:	05842503          	lw	a0,88(s0)
    6824:	e44fa0ef          	jal	e68 <__retarget_lock_acquire_recursive>
    6828:	00040593          	mv	a1,s0
    682c:	00048513          	mv	a0,s1
    6830:	d19ff0ef          	jal	6548 <__sflush_r>
    6834:	06442783          	lw	a5,100(s0)
    6838:	00050913          	mv	s2,a0
    683c:	0017f793          	and	a5,a5,1
    6840:	fc0792e3          	bnez	a5,6804 <_fflush_r+0x70>
    6844:	fb5ff06f          	j	67f8 <_fflush_r+0x64>
    6848:	05842503          	lw	a0,88(s0)
    684c:	e20fa0ef          	jal	e6c <__retarget_lock_release_recursive>
    6850:	00c12083          	lw	ra,12(sp)
    6854:	00812403          	lw	s0,8(sp)
    6858:	00412483          	lw	s1,4(sp)
    685c:	00090513          	mv	a0,s2
    6860:	00012903          	lw	s2,0(sp)
    6864:	01010113          	add	sp,sp,16
    6868:	00008067          	ret
    686c:	224000ef          	jal	6a90 <__sinit>
    6870:	f4dff06f          	j	67bc <_fflush_r+0x28>

00006874 <stdio_exit_handler>:
    6874:	7fffa617          	auipc	a2,0x7fffa
    6878:	cb460613          	add	a2,a2,-844 # 80000528 <__sglue>
    687c:	00004597          	auipc	a1,0x4
    6880:	00058593          	mv	a1,a1
    6884:	7fff9517          	auipc	a0,0x7fff9
    6888:	77c50513          	add	a0,a0,1916 # 80000000 <_impure_data>
    688c:	7a00006f          	j	702c <_fwalk_sglue>

00006890 <cleanup_stdio>:
    6890:	00452583          	lw	a1,4(a0)
    6894:	ff010113          	add	sp,sp,-16
    6898:	00812423          	sw	s0,8(sp)
    689c:	00112623          	sw	ra,12(sp)
    68a0:	7fffa797          	auipc	a5,0x7fffa
    68a4:	6fc78793          	add	a5,a5,1788 # 80000f9c <__sf>
    68a8:	00050413          	mv	s0,a0
    68ac:	00f58463          	beq	a1,a5,68b4 <cleanup_stdio+0x24>
    68b0:	7cd030ef          	jal	a87c <_fclose_r>
    68b4:	00842583          	lw	a1,8(s0)
    68b8:	7fffa797          	auipc	a5,0x7fffa
    68bc:	74c78793          	add	a5,a5,1868 # 80001004 <__sf+0x68>
    68c0:	00f58663          	beq	a1,a5,68cc <cleanup_stdio+0x3c>
    68c4:	00040513          	mv	a0,s0
    68c8:	7b5030ef          	jal	a87c <_fclose_r>
    68cc:	00c42583          	lw	a1,12(s0)
    68d0:	7fffa797          	auipc	a5,0x7fffa
    68d4:	79c78793          	add	a5,a5,1948 # 8000106c <__sf+0xd0>
    68d8:	00f58c63          	beq	a1,a5,68f0 <cleanup_stdio+0x60>
    68dc:	00040513          	mv	a0,s0
    68e0:	00812403          	lw	s0,8(sp)
    68e4:	00c12083          	lw	ra,12(sp)
    68e8:	01010113          	add	sp,sp,16
    68ec:	7910306f          	j	a87c <_fclose_r>
    68f0:	00c12083          	lw	ra,12(sp)
    68f4:	00812403          	lw	s0,8(sp)
    68f8:	01010113          	add	sp,sp,16
    68fc:	00008067          	ret

00006900 <global_stdio_init.part.0>:
    6900:	fe010113          	add	sp,sp,-32
    6904:	00000797          	auipc	a5,0x0
    6908:	f7078793          	add	a5,a5,-144 # 6874 <stdio_exit_handler>
    690c:	00112e23          	sw	ra,28(sp)
    6910:	00812c23          	sw	s0,24(sp)
    6914:	00912a23          	sw	s1,20(sp)
    6918:	7fffa417          	auipc	s0,0x7fffa
    691c:	68440413          	add	s0,s0,1668 # 80000f9c <__sf>
    6920:	01212823          	sw	s2,16(sp)
    6924:	01312623          	sw	s3,12(sp)
    6928:	01412423          	sw	s4,8(sp)
    692c:	00800613          	li	a2,8
    6930:	00000593          	li	a1,0
    6934:	7fffa717          	auipc	a4,0x7fffa
    6938:	def72e23          	sw	a5,-516(a4) # 80000730 <__stdio_exit_handler>
    693c:	7fffa517          	auipc	a0,0x7fffa
    6940:	6bc50513          	add	a0,a0,1724 # 80000ff8 <__sf+0x5c>
    6944:	00400793          	li	a5,4
    6948:	00f42623          	sw	a5,12(s0)
    694c:	00042023          	sw	zero,0(s0)
    6950:	00042223          	sw	zero,4(s0)
    6954:	00042423          	sw	zero,8(s0)
    6958:	06042223          	sw	zero,100(s0)
    695c:	00042823          	sw	zero,16(s0)
    6960:	00042a23          	sw	zero,20(s0)
    6964:	00042c23          	sw	zero,24(s0)
    6968:	d08fa0ef          	jal	e70 <memset>
    696c:	00000a17          	auipc	s4,0x0
    6970:	774a0a13          	add	s4,s4,1908 # 70e0 <__sread>
    6974:	00000997          	auipc	s3,0x0
    6978:	7c898993          	add	s3,s3,1992 # 713c <__swrite>
    697c:	00001917          	auipc	s2,0x1
    6980:	84890913          	add	s2,s2,-1976 # 71c4 <__sseek>
    6984:	00001497          	auipc	s1,0x1
    6988:	8b848493          	add	s1,s1,-1864 # 723c <__sclose>
    698c:	7fffa517          	auipc	a0,0x7fffa
    6990:	66850513          	add	a0,a0,1640 # 80000ff4 <__sf+0x58>
    6994:	03442023          	sw	s4,32(s0)
    6998:	03342223          	sw	s3,36(s0)
    699c:	03242423          	sw	s2,40(s0)
    69a0:	02942623          	sw	s1,44(s0)
    69a4:	00842e23          	sw	s0,28(s0)
    69a8:	cb8fa0ef          	jal	e60 <__retarget_lock_init_recursive>
    69ac:	000107b7          	lui	a5,0x10
    69b0:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x7a9>
    69b4:	00800613          	li	a2,8
    69b8:	00000593          	li	a1,0
    69bc:	7fffa517          	auipc	a0,0x7fffa
    69c0:	6a450513          	add	a0,a0,1700 # 80001060 <__sf+0xc4>
    69c4:	06f42a23          	sw	a5,116(s0)
    69c8:	06042423          	sw	zero,104(s0)
    69cc:	06042623          	sw	zero,108(s0)
    69d0:	06042823          	sw	zero,112(s0)
    69d4:	0c042623          	sw	zero,204(s0)
    69d8:	06042c23          	sw	zero,120(s0)
    69dc:	06042e23          	sw	zero,124(s0)
    69e0:	08042023          	sw	zero,128(s0)
    69e4:	c8cfa0ef          	jal	e70 <memset>
    69e8:	7fffa797          	auipc	a5,0x7fffa
    69ec:	61c78793          	add	a5,a5,1564 # 80001004 <__sf+0x68>
    69f0:	7fffa517          	auipc	a0,0x7fffa
    69f4:	66c50513          	add	a0,a0,1644 # 8000105c <__sf+0xc0>
    69f8:	08f42223          	sw	a5,132(s0)
    69fc:	09442423          	sw	s4,136(s0)
    6a00:	09342623          	sw	s3,140(s0)
    6a04:	09242823          	sw	s2,144(s0)
    6a08:	08942a23          	sw	s1,148(s0)
    6a0c:	c54fa0ef          	jal	e60 <__retarget_lock_init_recursive>
    6a10:	000207b7          	lui	a5,0x20
    6a14:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6a18:	00800613          	li	a2,8
    6a1c:	00000593          	li	a1,0
    6a20:	7fffa517          	auipc	a0,0x7fffa
    6a24:	6a850513          	add	a0,a0,1704 # 800010c8 <__sf+0x12c>
    6a28:	0cf42e23          	sw	a5,220(s0)
    6a2c:	0c042823          	sw	zero,208(s0)
    6a30:	0c042a23          	sw	zero,212(s0)
    6a34:	0c042c23          	sw	zero,216(s0)
    6a38:	12042a23          	sw	zero,308(s0)
    6a3c:	0e042023          	sw	zero,224(s0)
    6a40:	0e042223          	sw	zero,228(s0)
    6a44:	0e042423          	sw	zero,232(s0)
    6a48:	c28fa0ef          	jal	e70 <memset>
    6a4c:	7fffa797          	auipc	a5,0x7fffa
    6a50:	62078793          	add	a5,a5,1568 # 8000106c <__sf+0xd0>
    6a54:	0f442823          	sw	s4,240(s0)
    6a58:	0f342a23          	sw	s3,244(s0)
    6a5c:	0f242c23          	sw	s2,248(s0)
    6a60:	0e942e23          	sw	s1,252(s0)
    6a64:	0ef42623          	sw	a5,236(s0)
    6a68:	01812403          	lw	s0,24(sp)
    6a6c:	01c12083          	lw	ra,28(sp)
    6a70:	01412483          	lw	s1,20(sp)
    6a74:	01012903          	lw	s2,16(sp)
    6a78:	00c12983          	lw	s3,12(sp)
    6a7c:	00812a03          	lw	s4,8(sp)
    6a80:	7fffa517          	auipc	a0,0x7fffa
    6a84:	64450513          	add	a0,a0,1604 # 800010c4 <__sf+0x128>
    6a88:	02010113          	add	sp,sp,32
    6a8c:	bd4fa06f          	j	e60 <__retarget_lock_init_recursive>

00006a90 <__sinit>:
    6a90:	ff010113          	add	sp,sp,-16
    6a94:	00812423          	sw	s0,8(sp)
    6a98:	00050413          	mv	s0,a0
    6a9c:	7fffa517          	auipc	a0,0x7fffa
    6aa0:	c8450513          	add	a0,a0,-892 # 80000720 <__lock___sfp_recursive_mutex>
    6aa4:	00112623          	sw	ra,12(sp)
    6aa8:	bc0fa0ef          	jal	e68 <__retarget_lock_acquire_recursive>
    6aac:	03442783          	lw	a5,52(s0)
    6ab0:	00079e63          	bnez	a5,6acc <__sinit+0x3c>
    6ab4:	00000797          	auipc	a5,0x0
    6ab8:	ddc78793          	add	a5,a5,-548 # 6890 <cleanup_stdio>
    6abc:	02f42a23          	sw	a5,52(s0)
    6ac0:	7fffa797          	auipc	a5,0x7fffa
    6ac4:	c707a783          	lw	a5,-912(a5) # 80000730 <__stdio_exit_handler>
    6ac8:	00078e63          	beqz	a5,6ae4 <__sinit+0x54>
    6acc:	00812403          	lw	s0,8(sp)
    6ad0:	00c12083          	lw	ra,12(sp)
    6ad4:	7fffa517          	auipc	a0,0x7fffa
    6ad8:	c4c50513          	add	a0,a0,-948 # 80000720 <__lock___sfp_recursive_mutex>
    6adc:	01010113          	add	sp,sp,16
    6ae0:	b8cfa06f          	j	e6c <__retarget_lock_release_recursive>
    6ae4:	e1dff0ef          	jal	6900 <global_stdio_init.part.0>
    6ae8:	00812403          	lw	s0,8(sp)
    6aec:	00c12083          	lw	ra,12(sp)
    6af0:	7fffa517          	auipc	a0,0x7fffa
    6af4:	c3050513          	add	a0,a0,-976 # 80000720 <__lock___sfp_recursive_mutex>
    6af8:	01010113          	add	sp,sp,16
    6afc:	b70fa06f          	j	e6c <__retarget_lock_release_recursive>

00006b00 <__sfp_lock_acquire>:
    6b00:	7fffa517          	auipc	a0,0x7fffa
    6b04:	c2050513          	add	a0,a0,-992 # 80000720 <__lock___sfp_recursive_mutex>
    6b08:	b60fa06f          	j	e68 <__retarget_lock_acquire_recursive>

00006b0c <__sfp_lock_release>:
    6b0c:	7fffa517          	auipc	a0,0x7fffa
    6b10:	c1450513          	add	a0,a0,-1004 # 80000720 <__lock___sfp_recursive_mutex>
    6b14:	b58fa06f          	j	e6c <__retarget_lock_release_recursive>

00006b18 <__sfvwrite_r>:
    6b18:	00862783          	lw	a5,8(a2)
    6b1c:	2c078463          	beqz	a5,6de4 <__sfvwrite_r+0x2cc>
    6b20:	00c59683          	lh	a3,12(a1) # a888 <_fclose_r+0xc>
    6b24:	fd010113          	add	sp,sp,-48
    6b28:	02812423          	sw	s0,40(sp)
    6b2c:	01412c23          	sw	s4,24(sp)
    6b30:	01612823          	sw	s6,16(sp)
    6b34:	02112623          	sw	ra,44(sp)
    6b38:	0086f793          	and	a5,a3,8
    6b3c:	00060b13          	mv	s6,a2
    6b40:	00050a13          	mv	s4,a0
    6b44:	00058413          	mv	s0,a1
    6b48:	08078e63          	beqz	a5,6be4 <__sfvwrite_r+0xcc>
    6b4c:	0105a783          	lw	a5,16(a1)
    6b50:	08078a63          	beqz	a5,6be4 <__sfvwrite_r+0xcc>
    6b54:	02912223          	sw	s1,36(sp)
    6b58:	03212023          	sw	s2,32(sp)
    6b5c:	01312e23          	sw	s3,28(sp)
    6b60:	01512a23          	sw	s5,20(sp)
    6b64:	0026f793          	and	a5,a3,2
    6b68:	000b2483          	lw	s1,0(s6)
    6b6c:	0a078463          	beqz	a5,6c14 <__sfvwrite_r+0xfc>
    6b70:	02442783          	lw	a5,36(s0)
    6b74:	01c42583          	lw	a1,28(s0)
    6b78:	80000ab7          	lui	s5,0x80000
    6b7c:	00000993          	li	s3,0
    6b80:	00000913          	li	s2,0
    6b84:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6b88:	00098613          	mv	a2,s3
    6b8c:	000a0513          	mv	a0,s4
    6b90:	04090263          	beqz	s2,6bd4 <__sfvwrite_r+0xbc>
    6b94:	00090693          	mv	a3,s2
    6b98:	012af463          	bgeu	s5,s2,6ba0 <__sfvwrite_r+0x88>
    6b9c:	000a8693          	mv	a3,s5
    6ba0:	000780e7          	jalr	a5
    6ba4:	46a05263          	blez	a0,7008 <__sfvwrite_r+0x4f0>
    6ba8:	008b2783          	lw	a5,8(s6)
    6bac:	00a989b3          	add	s3,s3,a0
    6bb0:	40a90933          	sub	s2,s2,a0
    6bb4:	40a787b3          	sub	a5,a5,a0
    6bb8:	00fb2423          	sw	a5,8(s6)
    6bbc:	1a078663          	beqz	a5,6d68 <__sfvwrite_r+0x250>
    6bc0:	02442783          	lw	a5,36(s0)
    6bc4:	01c42583          	lw	a1,28(s0)
    6bc8:	00098613          	mv	a2,s3
    6bcc:	000a0513          	mv	a0,s4
    6bd0:	fc0912e3          	bnez	s2,6b94 <__sfvwrite_r+0x7c>
    6bd4:	0004a983          	lw	s3,0(s1)
    6bd8:	0044a903          	lw	s2,4(s1)
    6bdc:	00848493          	add	s1,s1,8
    6be0:	fa9ff06f          	j	6b88 <__sfvwrite_r+0x70>
    6be4:	00040593          	mv	a1,s0
    6be8:	000a0513          	mv	a0,s4
    6bec:	658000ef          	jal	7244 <__swsetup_r>
    6bf0:	1c051c63          	bnez	a0,6dc8 <__sfvwrite_r+0x2b0>
    6bf4:	00c41683          	lh	a3,12(s0)
    6bf8:	02912223          	sw	s1,36(sp)
    6bfc:	03212023          	sw	s2,32(sp)
    6c00:	01312e23          	sw	s3,28(sp)
    6c04:	01512a23          	sw	s5,20(sp)
    6c08:	0026f793          	and	a5,a3,2
    6c0c:	000b2483          	lw	s1,0(s6)
    6c10:	f60790e3          	bnez	a5,6b70 <__sfvwrite_r+0x58>
    6c14:	01712623          	sw	s7,12(sp)
    6c18:	01812423          	sw	s8,8(sp)
    6c1c:	0016f793          	and	a5,a3,1
    6c20:	1c079663          	bnez	a5,6dec <__sfvwrite_r+0x2d4>
    6c24:	00042783          	lw	a5,0(s0)
    6c28:	00842703          	lw	a4,8(s0)
    6c2c:	80000ab7          	lui	s5,0x80000
    6c30:	01912223          	sw	s9,4(sp)
    6c34:	00000b93          	li	s7,0
    6c38:	00000993          	li	s3,0
    6c3c:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6c40:	00078513          	mv	a0,a5
    6c44:	00070c13          	mv	s8,a4
    6c48:	10098263          	beqz	s3,6d4c <__sfvwrite_r+0x234>
    6c4c:	2006f613          	and	a2,a3,512
    6c50:	28060863          	beqz	a2,6ee0 <__sfvwrite_r+0x3c8>
    6c54:	00070c93          	mv	s9,a4
    6c58:	32e9e863          	bltu	s3,a4,6f88 <__sfvwrite_r+0x470>
    6c5c:	4806f713          	and	a4,a3,1152
    6c60:	08070a63          	beqz	a4,6cf4 <__sfvwrite_r+0x1dc>
    6c64:	01442603          	lw	a2,20(s0)
    6c68:	01042583          	lw	a1,16(s0)
    6c6c:	00161713          	sll	a4,a2,0x1
    6c70:	00c70733          	add	a4,a4,a2
    6c74:	40b78933          	sub	s2,a5,a1
    6c78:	01f75c13          	srl	s8,a4,0x1f
    6c7c:	00ec0c33          	add	s8,s8,a4
    6c80:	00190793          	add	a5,s2,1
    6c84:	401c5c13          	sra	s8,s8,0x1
    6c88:	013787b3          	add	a5,a5,s3
    6c8c:	000c0613          	mv	a2,s8
    6c90:	00fc7663          	bgeu	s8,a5,6c9c <__sfvwrite_r+0x184>
    6c94:	00078c13          	mv	s8,a5
    6c98:	00078613          	mv	a2,a5
    6c9c:	4006f693          	and	a3,a3,1024
    6ca0:	32068063          	beqz	a3,6fc0 <__sfvwrite_r+0x4a8>
    6ca4:	00060593          	mv	a1,a2
    6ca8:	000a0513          	mv	a0,s4
    6cac:	921fa0ef          	jal	15cc <_malloc_r>
    6cb0:	00050c93          	mv	s9,a0
    6cb4:	34050e63          	beqz	a0,7010 <__sfvwrite_r+0x4f8>
    6cb8:	01042583          	lw	a1,16(s0)
    6cbc:	00090613          	mv	a2,s2
    6cc0:	a8cfa0ef          	jal	f4c <memcpy>
    6cc4:	00c45783          	lhu	a5,12(s0)
    6cc8:	b7f7f793          	and	a5,a5,-1153
    6ccc:	0807e793          	or	a5,a5,128
    6cd0:	00f41623          	sh	a5,12(s0)
    6cd4:	012c8533          	add	a0,s9,s2
    6cd8:	412c07b3          	sub	a5,s8,s2
    6cdc:	01942823          	sw	s9,16(s0)
    6ce0:	01842a23          	sw	s8,20(s0)
    6ce4:	00a42023          	sw	a0,0(s0)
    6ce8:	00098c13          	mv	s8,s3
    6cec:	00f42423          	sw	a5,8(s0)
    6cf0:	00098c93          	mv	s9,s3
    6cf4:	000c8613          	mv	a2,s9
    6cf8:	000b8593          	mv	a1,s7
    6cfc:	41d000ef          	jal	7918 <memmove>
    6d00:	00842703          	lw	a4,8(s0)
    6d04:	00042783          	lw	a5,0(s0)
    6d08:	00098913          	mv	s2,s3
    6d0c:	41870733          	sub	a4,a4,s8
    6d10:	019787b3          	add	a5,a5,s9
    6d14:	00e42423          	sw	a4,8(s0)
    6d18:	00f42023          	sw	a5,0(s0)
    6d1c:	00000993          	li	s3,0
    6d20:	008b2783          	lw	a5,8(s6)
    6d24:	012b8bb3          	add	s7,s7,s2
    6d28:	412787b3          	sub	a5,a5,s2
    6d2c:	00fb2423          	sw	a5,8(s6)
    6d30:	02078663          	beqz	a5,6d5c <__sfvwrite_r+0x244>
    6d34:	00042783          	lw	a5,0(s0)
    6d38:	00842703          	lw	a4,8(s0)
    6d3c:	00c41683          	lh	a3,12(s0)
    6d40:	00078513          	mv	a0,a5
    6d44:	00070c13          	mv	s8,a4
    6d48:	f00992e3          	bnez	s3,6c4c <__sfvwrite_r+0x134>
    6d4c:	0004ab83          	lw	s7,0(s1)
    6d50:	0044a983          	lw	s3,4(s1)
    6d54:	00848493          	add	s1,s1,8
    6d58:	ee9ff06f          	j	6c40 <__sfvwrite_r+0x128>
    6d5c:	00c12b83          	lw	s7,12(sp)
    6d60:	00812c03          	lw	s8,8(sp)
    6d64:	00412c83          	lw	s9,4(sp)
    6d68:	02c12083          	lw	ra,44(sp)
    6d6c:	02812403          	lw	s0,40(sp)
    6d70:	02412483          	lw	s1,36(sp)
    6d74:	02012903          	lw	s2,32(sp)
    6d78:	01c12983          	lw	s3,28(sp)
    6d7c:	01412a83          	lw	s5,20(sp)
    6d80:	01812a03          	lw	s4,24(sp)
    6d84:	01012b03          	lw	s6,16(sp)
    6d88:	00000513          	li	a0,0
    6d8c:	03010113          	add	sp,sp,48
    6d90:	00008067          	ret
    6d94:	00040593          	mv	a1,s0
    6d98:	000a0513          	mv	a0,s4
    6d9c:	9f9ff0ef          	jal	6794 <_fflush_r>
    6da0:	0a050e63          	beqz	a0,6e5c <__sfvwrite_r+0x344>
    6da4:	00c41783          	lh	a5,12(s0)
    6da8:	00c12b83          	lw	s7,12(sp)
    6dac:	00812c03          	lw	s8,8(sp)
    6db0:	02412483          	lw	s1,36(sp)
    6db4:	02012903          	lw	s2,32(sp)
    6db8:	01c12983          	lw	s3,28(sp)
    6dbc:	01412a83          	lw	s5,20(sp)
    6dc0:	0407e793          	or	a5,a5,64
    6dc4:	00f41623          	sh	a5,12(s0)
    6dc8:	02c12083          	lw	ra,44(sp)
    6dcc:	02812403          	lw	s0,40(sp)
    6dd0:	01812a03          	lw	s4,24(sp)
    6dd4:	01012b03          	lw	s6,16(sp)
    6dd8:	fff00513          	li	a0,-1
    6ddc:	03010113          	add	sp,sp,48
    6de0:	00008067          	ret
    6de4:	00000513          	li	a0,0
    6de8:	00008067          	ret
    6dec:	00000a93          	li	s5,0
    6df0:	00000513          	li	a0,0
    6df4:	00000c13          	li	s8,0
    6df8:	00000993          	li	s3,0
    6dfc:	08098263          	beqz	s3,6e80 <__sfvwrite_r+0x368>
    6e00:	08050a63          	beqz	a0,6e94 <__sfvwrite_r+0x37c>
    6e04:	000a8793          	mv	a5,s5
    6e08:	00098b93          	mv	s7,s3
    6e0c:	0137f463          	bgeu	a5,s3,6e14 <__sfvwrite_r+0x2fc>
    6e10:	00078b93          	mv	s7,a5
    6e14:	00042503          	lw	a0,0(s0)
    6e18:	01042783          	lw	a5,16(s0)
    6e1c:	00842903          	lw	s2,8(s0)
    6e20:	01442683          	lw	a3,20(s0)
    6e24:	00a7f663          	bgeu	a5,a0,6e30 <__sfvwrite_r+0x318>
    6e28:	00d90933          	add	s2,s2,a3
    6e2c:	09794463          	blt	s2,s7,6eb4 <__sfvwrite_r+0x39c>
    6e30:	16dbc263          	blt	s7,a3,6f94 <__sfvwrite_r+0x47c>
    6e34:	02442783          	lw	a5,36(s0)
    6e38:	01c42583          	lw	a1,28(s0)
    6e3c:	000c0613          	mv	a2,s8
    6e40:	000a0513          	mv	a0,s4
    6e44:	000780e7          	jalr	a5
    6e48:	00050913          	mv	s2,a0
    6e4c:	f4a05ce3          	blez	a0,6da4 <__sfvwrite_r+0x28c>
    6e50:	412a8ab3          	sub	s5,s5,s2
    6e54:	00100513          	li	a0,1
    6e58:	f20a8ee3          	beqz	s5,6d94 <__sfvwrite_r+0x27c>
    6e5c:	008b2783          	lw	a5,8(s6)
    6e60:	012c0c33          	add	s8,s8,s2
    6e64:	412989b3          	sub	s3,s3,s2
    6e68:	412787b3          	sub	a5,a5,s2
    6e6c:	00fb2423          	sw	a5,8(s6)
    6e70:	f80796e3          	bnez	a5,6dfc <__sfvwrite_r+0x2e4>
    6e74:	00c12b83          	lw	s7,12(sp)
    6e78:	00812c03          	lw	s8,8(sp)
    6e7c:	eedff06f          	j	6d68 <__sfvwrite_r+0x250>
    6e80:	0044a983          	lw	s3,4(s1)
    6e84:	00048793          	mv	a5,s1
    6e88:	00848493          	add	s1,s1,8
    6e8c:	fe098ae3          	beqz	s3,6e80 <__sfvwrite_r+0x368>
    6e90:	0007ac03          	lw	s8,0(a5)
    6e94:	00098613          	mv	a2,s3
    6e98:	00a00593          	li	a1,10
    6e9c:	000c0513          	mv	a0,s8
    6ea0:	714000ef          	jal	75b4 <memchr>
    6ea4:	14050c63          	beqz	a0,6ffc <__sfvwrite_r+0x4e4>
    6ea8:	00150513          	add	a0,a0,1
    6eac:	41850ab3          	sub	s5,a0,s8
    6eb0:	f55ff06f          	j	6e04 <__sfvwrite_r+0x2ec>
    6eb4:	000c0593          	mv	a1,s8
    6eb8:	00090613          	mv	a2,s2
    6ebc:	25d000ef          	jal	7918 <memmove>
    6ec0:	00042783          	lw	a5,0(s0)
    6ec4:	00040593          	mv	a1,s0
    6ec8:	000a0513          	mv	a0,s4
    6ecc:	012787b3          	add	a5,a5,s2
    6ed0:	00f42023          	sw	a5,0(s0)
    6ed4:	8c1ff0ef          	jal	6794 <_fflush_r>
    6ed8:	f6050ce3          	beqz	a0,6e50 <__sfvwrite_r+0x338>
    6edc:	ec9ff06f          	j	6da4 <__sfvwrite_r+0x28c>
    6ee0:	01042683          	lw	a3,16(s0)
    6ee4:	04f6e463          	bltu	a3,a5,6f2c <__sfvwrite_r+0x414>
    6ee8:	01442583          	lw	a1,20(s0)
    6eec:	04b9e063          	bltu	s3,a1,6f2c <__sfvwrite_r+0x414>
    6ef0:	00098913          	mv	s2,s3
    6ef4:	013af463          	bgeu	s5,s3,6efc <__sfvwrite_r+0x3e4>
    6ef8:	000a8913          	mv	s2,s5
    6efc:	00090513          	mv	a0,s2
    6f00:	561070ef          	jal	ec60 <__modsi3>
    6f04:	02442783          	lw	a5,36(s0)
    6f08:	01c42583          	lw	a1,28(s0)
    6f0c:	40a906b3          	sub	a3,s2,a0
    6f10:	000b8613          	mv	a2,s7
    6f14:	000a0513          	mv	a0,s4
    6f18:	000780e7          	jalr	a5
    6f1c:	00050913          	mv	s2,a0
    6f20:	04a05a63          	blez	a0,6f74 <__sfvwrite_r+0x45c>
    6f24:	412989b3          	sub	s3,s3,s2
    6f28:	df9ff06f          	j	6d20 <__sfvwrite_r+0x208>
    6f2c:	00070913          	mv	s2,a4
    6f30:	00e9f463          	bgeu	s3,a4,6f38 <__sfvwrite_r+0x420>
    6f34:	00098913          	mv	s2,s3
    6f38:	00078513          	mv	a0,a5
    6f3c:	00090613          	mv	a2,s2
    6f40:	000b8593          	mv	a1,s7
    6f44:	1d5000ef          	jal	7918 <memmove>
    6f48:	00842703          	lw	a4,8(s0)
    6f4c:	00042783          	lw	a5,0(s0)
    6f50:	41270733          	sub	a4,a4,s2
    6f54:	012787b3          	add	a5,a5,s2
    6f58:	00e42423          	sw	a4,8(s0)
    6f5c:	00f42023          	sw	a5,0(s0)
    6f60:	fc0712e3          	bnez	a4,6f24 <__sfvwrite_r+0x40c>
    6f64:	00040593          	mv	a1,s0
    6f68:	000a0513          	mv	a0,s4
    6f6c:	829ff0ef          	jal	6794 <_fflush_r>
    6f70:	fa050ae3          	beqz	a0,6f24 <__sfvwrite_r+0x40c>
    6f74:	00c41783          	lh	a5,12(s0)
    6f78:	00c12b83          	lw	s7,12(sp)
    6f7c:	00812c03          	lw	s8,8(sp)
    6f80:	00412c83          	lw	s9,4(sp)
    6f84:	e2dff06f          	j	6db0 <__sfvwrite_r+0x298>
    6f88:	00098c13          	mv	s8,s3
    6f8c:	00098c93          	mv	s9,s3
    6f90:	d65ff06f          	j	6cf4 <__sfvwrite_r+0x1dc>
    6f94:	000b8613          	mv	a2,s7
    6f98:	000c0593          	mv	a1,s8
    6f9c:	17d000ef          	jal	7918 <memmove>
    6fa0:	00842703          	lw	a4,8(s0)
    6fa4:	00042783          	lw	a5,0(s0)
    6fa8:	000b8913          	mv	s2,s7
    6fac:	41770733          	sub	a4,a4,s7
    6fb0:	017787b3          	add	a5,a5,s7
    6fb4:	00e42423          	sw	a4,8(s0)
    6fb8:	00f42023          	sw	a5,0(s0)
    6fbc:	e95ff06f          	j	6e50 <__sfvwrite_r+0x338>
    6fc0:	000a0513          	mv	a0,s4
    6fc4:	27c030ef          	jal	a240 <_realloc_r>
    6fc8:	00050c93          	mv	s9,a0
    6fcc:	d00514e3          	bnez	a0,6cd4 <__sfvwrite_r+0x1bc>
    6fd0:	01042583          	lw	a1,16(s0)
    6fd4:	000a0513          	mv	a0,s4
    6fd8:	ae8fa0ef          	jal	12c0 <_free_r>
    6fdc:	00c41783          	lh	a5,12(s0)
    6fe0:	00c00713          	li	a4,12
    6fe4:	00c12b83          	lw	s7,12(sp)
    6fe8:	00812c03          	lw	s8,8(sp)
    6fec:	00412c83          	lw	s9,4(sp)
    6ff0:	00ea2023          	sw	a4,0(s4)
    6ff4:	f7f7f793          	and	a5,a5,-129
    6ff8:	db9ff06f          	j	6db0 <__sfvwrite_r+0x298>
    6ffc:	00198793          	add	a5,s3,1
    7000:	00078a93          	mv	s5,a5
    7004:	e05ff06f          	j	6e08 <__sfvwrite_r+0x2f0>
    7008:	00c41783          	lh	a5,12(s0)
    700c:	da5ff06f          	j	6db0 <__sfvwrite_r+0x298>
    7010:	00c00713          	li	a4,12
    7014:	00c41783          	lh	a5,12(s0)
    7018:	00c12b83          	lw	s7,12(sp)
    701c:	00812c03          	lw	s8,8(sp)
    7020:	00412c83          	lw	s9,4(sp)
    7024:	00ea2023          	sw	a4,0(s4)
    7028:	d89ff06f          	j	6db0 <__sfvwrite_r+0x298>

0000702c <_fwalk_sglue>:
    702c:	fd010113          	add	sp,sp,-48
    7030:	03212023          	sw	s2,32(sp)
    7034:	01312e23          	sw	s3,28(sp)
    7038:	01412c23          	sw	s4,24(sp)
    703c:	01512a23          	sw	s5,20(sp)
    7040:	01612823          	sw	s6,16(sp)
    7044:	01712623          	sw	s7,12(sp)
    7048:	02112623          	sw	ra,44(sp)
    704c:	02812423          	sw	s0,40(sp)
    7050:	02912223          	sw	s1,36(sp)
    7054:	00050b13          	mv	s6,a0
    7058:	00058b93          	mv	s7,a1
    705c:	00060a93          	mv	s5,a2
    7060:	00000a13          	li	s4,0
    7064:	00100993          	li	s3,1
    7068:	fff00913          	li	s2,-1
    706c:	004aa483          	lw	s1,4(s5)
    7070:	008aa403          	lw	s0,8(s5)
    7074:	fff48493          	add	s1,s1,-1
    7078:	0204c863          	bltz	s1,70a8 <_fwalk_sglue+0x7c>
    707c:	00c45783          	lhu	a5,12(s0)
    7080:	00f9fe63          	bgeu	s3,a5,709c <_fwalk_sglue+0x70>
    7084:	00e41783          	lh	a5,14(s0)
    7088:	00040593          	mv	a1,s0
    708c:	000b0513          	mv	a0,s6
    7090:	01278663          	beq	a5,s2,709c <_fwalk_sglue+0x70>
    7094:	000b80e7          	jalr	s7
    7098:	00aa6a33          	or	s4,s4,a0
    709c:	fff48493          	add	s1,s1,-1
    70a0:	06840413          	add	s0,s0,104
    70a4:	fd249ce3          	bne	s1,s2,707c <_fwalk_sglue+0x50>
    70a8:	000aaa83          	lw	s5,0(s5)
    70ac:	fc0a90e3          	bnez	s5,706c <_fwalk_sglue+0x40>
    70b0:	02c12083          	lw	ra,44(sp)
    70b4:	02812403          	lw	s0,40(sp)
    70b8:	02412483          	lw	s1,36(sp)
    70bc:	02012903          	lw	s2,32(sp)
    70c0:	01c12983          	lw	s3,28(sp)
    70c4:	01412a83          	lw	s5,20(sp)
    70c8:	01012b03          	lw	s6,16(sp)
    70cc:	00c12b83          	lw	s7,12(sp)
    70d0:	000a0513          	mv	a0,s4
    70d4:	01812a03          	lw	s4,24(sp)
    70d8:	03010113          	add	sp,sp,48
    70dc:	00008067          	ret

000070e0 <__sread>:
    70e0:	ff010113          	add	sp,sp,-16
    70e4:	00812423          	sw	s0,8(sp)
    70e8:	00058413          	mv	s0,a1
    70ec:	00e59583          	lh	a1,14(a1)
    70f0:	00112623          	sw	ra,12(sp)
    70f4:	704000ef          	jal	77f8 <_read_r>
    70f8:	02054063          	bltz	a0,7118 <__sread+0x38>
    70fc:	05042783          	lw	a5,80(s0)
    7100:	00c12083          	lw	ra,12(sp)
    7104:	00a787b3          	add	a5,a5,a0
    7108:	04f42823          	sw	a5,80(s0)
    710c:	00812403          	lw	s0,8(sp)
    7110:	01010113          	add	sp,sp,16
    7114:	00008067          	ret
    7118:	00c45783          	lhu	a5,12(s0)
    711c:	fffff737          	lui	a4,0xfffff
    7120:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7124:	00e7f7b3          	and	a5,a5,a4
    7128:	00c12083          	lw	ra,12(sp)
    712c:	00f41623          	sh	a5,12(s0)
    7130:	00812403          	lw	s0,8(sp)
    7134:	01010113          	add	sp,sp,16
    7138:	00008067          	ret

0000713c <__swrite>:
    713c:	00c59783          	lh	a5,12(a1)
    7140:	fe010113          	add	sp,sp,-32
    7144:	00812c23          	sw	s0,24(sp)
    7148:	00912a23          	sw	s1,20(sp)
    714c:	01212823          	sw	s2,16(sp)
    7150:	01312623          	sw	s3,12(sp)
    7154:	00112e23          	sw	ra,28(sp)
    7158:	1007f713          	and	a4,a5,256
    715c:	00058413          	mv	s0,a1
    7160:	00050493          	mv	s1,a0
    7164:	00060913          	mv	s2,a2
    7168:	00068993          	mv	s3,a3
    716c:	04071063          	bnez	a4,71ac <__swrite+0x70>
    7170:	fffff737          	lui	a4,0xfffff
    7174:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7178:	00e7f7b3          	and	a5,a5,a4
    717c:	00e41583          	lh	a1,14(s0)
    7180:	00f41623          	sh	a5,12(s0)
    7184:	01812403          	lw	s0,24(sp)
    7188:	01c12083          	lw	ra,28(sp)
    718c:	00098693          	mv	a3,s3
    7190:	00090613          	mv	a2,s2
    7194:	00c12983          	lw	s3,12(sp)
    7198:	01012903          	lw	s2,16(sp)
    719c:	00048513          	mv	a0,s1
    71a0:	01412483          	lw	s1,20(sp)
    71a4:	02010113          	add	sp,sp,32
    71a8:	70c0006f          	j	78b4 <_write_r>
    71ac:	00e59583          	lh	a1,14(a1)
    71b0:	00200693          	li	a3,2
    71b4:	00000613          	li	a2,0
    71b8:	5dc000ef          	jal	7794 <_lseek_r>
    71bc:	00c41783          	lh	a5,12(s0)
    71c0:	fb1ff06f          	j	7170 <__swrite+0x34>

000071c4 <__sseek>:
    71c4:	ff010113          	add	sp,sp,-16
    71c8:	00812423          	sw	s0,8(sp)
    71cc:	00058413          	mv	s0,a1
    71d0:	00e59583          	lh	a1,14(a1)
    71d4:	00112623          	sw	ra,12(sp)
    71d8:	5bc000ef          	jal	7794 <_lseek_r>
    71dc:	fff00793          	li	a5,-1
    71e0:	02f50863          	beq	a0,a5,7210 <__sseek+0x4c>
    71e4:	00c45783          	lhu	a5,12(s0)
    71e8:	00001737          	lui	a4,0x1
    71ec:	00c12083          	lw	ra,12(sp)
    71f0:	00e7e7b3          	or	a5,a5,a4
    71f4:	01079793          	sll	a5,a5,0x10
    71f8:	4107d793          	sra	a5,a5,0x10
    71fc:	04a42823          	sw	a0,80(s0)
    7200:	00f41623          	sh	a5,12(s0)
    7204:	00812403          	lw	s0,8(sp)
    7208:	01010113          	add	sp,sp,16
    720c:	00008067          	ret
    7210:	00c45783          	lhu	a5,12(s0)
    7214:	fffff737          	lui	a4,0xfffff
    7218:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    721c:	00e7f7b3          	and	a5,a5,a4
    7220:	01079793          	sll	a5,a5,0x10
    7224:	4107d793          	sra	a5,a5,0x10
    7228:	00c12083          	lw	ra,12(sp)
    722c:	00f41623          	sh	a5,12(s0)
    7230:	00812403          	lw	s0,8(sp)
    7234:	01010113          	add	sp,sp,16
    7238:	00008067          	ret

0000723c <__sclose>:
    723c:	00e59583          	lh	a1,14(a1)
    7240:	4fc0006f          	j	773c <_close_r>

00007244 <__swsetup_r>:
    7244:	ff010113          	add	sp,sp,-16
    7248:	00812423          	sw	s0,8(sp)
    724c:	00912223          	sw	s1,4(sp)
    7250:	00112623          	sw	ra,12(sp)
    7254:	7fff9797          	auipc	a5,0x7fff9
    7258:	4b47a783          	lw	a5,1204(a5) # 80000708 <_impure_ptr>
    725c:	00050493          	mv	s1,a0
    7260:	00058413          	mv	s0,a1
    7264:	00078663          	beqz	a5,7270 <__swsetup_r+0x2c>
    7268:	0347a703          	lw	a4,52(a5)
    726c:	0e070c63          	beqz	a4,7364 <__swsetup_r+0x120>
    7270:	00c41783          	lh	a5,12(s0)
    7274:	0087f713          	and	a4,a5,8
    7278:	06070a63          	beqz	a4,72ec <__swsetup_r+0xa8>
    727c:	01042703          	lw	a4,16(s0)
    7280:	08070663          	beqz	a4,730c <__swsetup_r+0xc8>
    7284:	0017f693          	and	a3,a5,1
    7288:	02068863          	beqz	a3,72b8 <__swsetup_r+0x74>
    728c:	01442683          	lw	a3,20(s0)
    7290:	00042423          	sw	zero,8(s0)
    7294:	00000513          	li	a0,0
    7298:	40d006b3          	neg	a3,a3
    729c:	00d42c23          	sw	a3,24(s0)
    72a0:	02070a63          	beqz	a4,72d4 <__swsetup_r+0x90>
    72a4:	00c12083          	lw	ra,12(sp)
    72a8:	00812403          	lw	s0,8(sp)
    72ac:	00412483          	lw	s1,4(sp)
    72b0:	01010113          	add	sp,sp,16
    72b4:	00008067          	ret
    72b8:	0027f693          	and	a3,a5,2
    72bc:	00000613          	li	a2,0
    72c0:	00069463          	bnez	a3,72c8 <__swsetup_r+0x84>
    72c4:	01442603          	lw	a2,20(s0)
    72c8:	00c42423          	sw	a2,8(s0)
    72cc:	00000513          	li	a0,0
    72d0:	fc071ae3          	bnez	a4,72a4 <__swsetup_r+0x60>
    72d4:	0807f713          	and	a4,a5,128
    72d8:	fc0706e3          	beqz	a4,72a4 <__swsetup_r+0x60>
    72dc:	0407e793          	or	a5,a5,64
    72e0:	00f41623          	sh	a5,12(s0)
    72e4:	fff00513          	li	a0,-1
    72e8:	fbdff06f          	j	72a4 <__swsetup_r+0x60>
    72ec:	0107f713          	and	a4,a5,16
    72f0:	08070063          	beqz	a4,7370 <__swsetup_r+0x12c>
    72f4:	0047f713          	and	a4,a5,4
    72f8:	02071c63          	bnez	a4,7330 <__swsetup_r+0xec>
    72fc:	01042703          	lw	a4,16(s0)
    7300:	0087e793          	or	a5,a5,8
    7304:	00f41623          	sh	a5,12(s0)
    7308:	f6071ee3          	bnez	a4,7284 <__swsetup_r+0x40>
    730c:	2807f693          	and	a3,a5,640
    7310:	20000613          	li	a2,512
    7314:	f6c688e3          	beq	a3,a2,7284 <__swsetup_r+0x40>
    7318:	00040593          	mv	a1,s0
    731c:	00048513          	mv	a0,s1
    7320:	6cc030ef          	jal	a9ec <__smakebuf_r>
    7324:	00c41783          	lh	a5,12(s0)
    7328:	01042703          	lw	a4,16(s0)
    732c:	f59ff06f          	j	7284 <__swsetup_r+0x40>
    7330:	03042583          	lw	a1,48(s0)
    7334:	00058e63          	beqz	a1,7350 <__swsetup_r+0x10c>
    7338:	04040713          	add	a4,s0,64
    733c:	00e58863          	beq	a1,a4,734c <__swsetup_r+0x108>
    7340:	00048513          	mv	a0,s1
    7344:	f7df90ef          	jal	12c0 <_free_r>
    7348:	00c41783          	lh	a5,12(s0)
    734c:	02042823          	sw	zero,48(s0)
    7350:	01042703          	lw	a4,16(s0)
    7354:	fdb7f793          	and	a5,a5,-37
    7358:	00042223          	sw	zero,4(s0)
    735c:	00e42023          	sw	a4,0(s0)
    7360:	fa1ff06f          	j	7300 <__swsetup_r+0xbc>
    7364:	00078513          	mv	a0,a5
    7368:	f28ff0ef          	jal	6a90 <__sinit>
    736c:	f05ff06f          	j	7270 <__swsetup_r+0x2c>
    7370:	00900713          	li	a4,9
    7374:	00e4a023          	sw	a4,0(s1)
    7378:	0407e793          	or	a5,a5,64
    737c:	00f41623          	sh	a5,12(s0)
    7380:	fff00513          	li	a0,-1
    7384:	f21ff06f          	j	72a4 <__swsetup_r+0x60>

00007388 <__fputwc>:
    7388:	fc010113          	add	sp,sp,-64
    738c:	02812c23          	sw	s0,56(sp)
    7390:	03412423          	sw	s4,40(sp)
    7394:	03512223          	sw	s5,36(sp)
    7398:	02112e23          	sw	ra,60(sp)
    739c:	02912a23          	sw	s1,52(sp)
    73a0:	03312623          	sw	s3,44(sp)
    73a4:	00050a13          	mv	s4,a0
    73a8:	00058a93          	mv	s5,a1
    73ac:	00060413          	mv	s0,a2
    73b0:	374000ef          	jal	7724 <__locale_mb_cur_max>
    73b4:	00100793          	li	a5,1
    73b8:	02f51663          	bne	a0,a5,73e4 <__fputwc+0x5c>
    73bc:	fffa8793          	add	a5,s5,-1
    73c0:	0fe00713          	li	a4,254
    73c4:	02f76063          	bltu	a4,a5,73e4 <__fputwc+0x5c>
    73c8:	03212823          	sw	s2,48(sp)
    73cc:	03612023          	sw	s6,32(sp)
    73d0:	01712e23          	sw	s7,28(sp)
    73d4:	01510423          	sb	s5,8(sp)
    73d8:	00100993          	li	s3,1
    73dc:	00810493          	add	s1,sp,8
    73e0:	0380006f          	j	7418 <__fputwc+0x90>
    73e4:	00810493          	add	s1,sp,8
    73e8:	05c40693          	add	a3,s0,92
    73ec:	000a8613          	mv	a2,s5
    73f0:	00048593          	mv	a1,s1
    73f4:	000a0513          	mv	a0,s4
    73f8:	3e8030ef          	jal	a7e0 <_wcrtomb_r>
    73fc:	fff00793          	li	a5,-1
    7400:	00050993          	mv	s3,a0
    7404:	0cf50a63          	beq	a0,a5,74d8 <__fputwc+0x150>
    7408:	0a050663          	beqz	a0,74b4 <__fputwc+0x12c>
    740c:	03212823          	sw	s2,48(sp)
    7410:	03612023          	sw	s6,32(sp)
    7414:	01712e23          	sw	s7,28(sp)
    7418:	00000913          	li	s2,0
    741c:	fff00b13          	li	s6,-1
    7420:	00a00b93          	li	s7,10
    7424:	0200006f          	j	7444 <__fputwc+0xbc>
    7428:	00042783          	lw	a5,0(s0)
    742c:	00178693          	add	a3,a5,1
    7430:	00d42023          	sw	a3,0(s0)
    7434:	00e78023          	sb	a4,0(a5)
    7438:	00190913          	add	s2,s2,1
    743c:	00148493          	add	s1,s1,1
    7440:	07397463          	bgeu	s2,s3,74a8 <__fputwc+0x120>
    7444:	00842783          	lw	a5,8(s0)
    7448:	0004c703          	lbu	a4,0(s1)
    744c:	fff78793          	add	a5,a5,-1
    7450:	00f42423          	sw	a5,8(s0)
    7454:	fc07dae3          	bgez	a5,7428 <__fputwc+0xa0>
    7458:	01842683          	lw	a3,24(s0)
    745c:	00040613          	mv	a2,s0
    7460:	00070593          	mv	a1,a4
    7464:	000a0513          	mv	a0,s4
    7468:	00d7c463          	blt	a5,a3,7470 <__fputwc+0xe8>
    746c:	fb771ee3          	bne	a4,s7,7428 <__fputwc+0xa0>
    7470:	714030ef          	jal	ab84 <__swbuf_r>
    7474:	fd6512e3          	bne	a0,s6,7438 <__fputwc+0xb0>
    7478:	03012903          	lw	s2,48(sp)
    747c:	02012b03          	lw	s6,32(sp)
    7480:	01c12b83          	lw	s7,28(sp)
    7484:	03c12083          	lw	ra,60(sp)
    7488:	03812403          	lw	s0,56(sp)
    748c:	03412483          	lw	s1,52(sp)
    7490:	02c12983          	lw	s3,44(sp)
    7494:	02812a03          	lw	s4,40(sp)
    7498:	02412a83          	lw	s5,36(sp)
    749c:	fff00513          	li	a0,-1
    74a0:	04010113          	add	sp,sp,64
    74a4:	00008067          	ret
    74a8:	03012903          	lw	s2,48(sp)
    74ac:	02012b03          	lw	s6,32(sp)
    74b0:	01c12b83          	lw	s7,28(sp)
    74b4:	03c12083          	lw	ra,60(sp)
    74b8:	03812403          	lw	s0,56(sp)
    74bc:	03412483          	lw	s1,52(sp)
    74c0:	02c12983          	lw	s3,44(sp)
    74c4:	02812a03          	lw	s4,40(sp)
    74c8:	000a8513          	mv	a0,s5
    74cc:	02412a83          	lw	s5,36(sp)
    74d0:	04010113          	add	sp,sp,64
    74d4:	00008067          	ret
    74d8:	00c45783          	lhu	a5,12(s0)
    74dc:	0407e793          	or	a5,a5,64
    74e0:	00f41623          	sh	a5,12(s0)
    74e4:	fa1ff06f          	j	7484 <__fputwc+0xfc>

000074e8 <_fputwc_r>:
    74e8:	06462783          	lw	a5,100(a2)
    74ec:	fe010113          	add	sp,sp,-32
    74f0:	00812c23          	sw	s0,24(sp)
    74f4:	00912a23          	sw	s1,20(sp)
    74f8:	0017f713          	and	a4,a5,1
    74fc:	00112e23          	sw	ra,28(sp)
    7500:	00c61783          	lh	a5,12(a2)
    7504:	00060413          	mv	s0,a2
    7508:	00050493          	mv	s1,a0
    750c:	00071663          	bnez	a4,7518 <_fputwc_r+0x30>
    7510:	2007f713          	and	a4,a5,512
    7514:	08070463          	beqz	a4,759c <_fputwc_r+0xb4>
    7518:	01279713          	sll	a4,a5,0x12
    751c:	02074063          	bltz	a4,753c <_fputwc_r+0x54>
    7520:	06442703          	lw	a4,100(s0)
    7524:	000026b7          	lui	a3,0x2
    7528:	00d7e7b3          	or	a5,a5,a3
    752c:	000026b7          	lui	a3,0x2
    7530:	00d76733          	or	a4,a4,a3
    7534:	00f41623          	sh	a5,12(s0)
    7538:	06e42223          	sw	a4,100(s0)
    753c:	00048513          	mv	a0,s1
    7540:	00040613          	mv	a2,s0
    7544:	e45ff0ef          	jal	7388 <__fputwc>
    7548:	06442783          	lw	a5,100(s0)
    754c:	00050493          	mv	s1,a0
    7550:	0017f793          	and	a5,a5,1
    7554:	00079863          	bnez	a5,7564 <_fputwc_r+0x7c>
    7558:	00c45783          	lhu	a5,12(s0)
    755c:	2007f793          	and	a5,a5,512
    7560:	00078e63          	beqz	a5,757c <_fputwc_r+0x94>
    7564:	01c12083          	lw	ra,28(sp)
    7568:	01812403          	lw	s0,24(sp)
    756c:	00048513          	mv	a0,s1
    7570:	01412483          	lw	s1,20(sp)
    7574:	02010113          	add	sp,sp,32
    7578:	00008067          	ret
    757c:	05842503          	lw	a0,88(s0)
    7580:	8edf90ef          	jal	e6c <__retarget_lock_release_recursive>
    7584:	01c12083          	lw	ra,28(sp)
    7588:	01812403          	lw	s0,24(sp)
    758c:	00048513          	mv	a0,s1
    7590:	01412483          	lw	s1,20(sp)
    7594:	02010113          	add	sp,sp,32
    7598:	00008067          	ret
    759c:	05862503          	lw	a0,88(a2)
    75a0:	00b12623          	sw	a1,12(sp)
    75a4:	8c5f90ef          	jal	e68 <__retarget_lock_acquire_recursive>
    75a8:	00c41783          	lh	a5,12(s0)
    75ac:	00c12583          	lw	a1,12(sp)
    75b0:	f69ff06f          	j	7518 <_fputwc_r+0x30>

000075b4 <memchr>:
    75b4:	00357793          	and	a5,a0,3
    75b8:	0ff5f693          	zext.b	a3,a1
    75bc:	02078a63          	beqz	a5,75f0 <memchr+0x3c>
    75c0:	fff60793          	add	a5,a2,-1
    75c4:	02060e63          	beqz	a2,7600 <memchr+0x4c>
    75c8:	fff00613          	li	a2,-1
    75cc:	0180006f          	j	75e4 <memchr+0x30>
    75d0:	00150513          	add	a0,a0,1
    75d4:	00357713          	and	a4,a0,3
    75d8:	00070e63          	beqz	a4,75f4 <memchr+0x40>
    75dc:	fff78793          	add	a5,a5,-1
    75e0:	02c78063          	beq	a5,a2,7600 <memchr+0x4c>
    75e4:	00054703          	lbu	a4,0(a0)
    75e8:	fed714e3          	bne	a4,a3,75d0 <memchr+0x1c>
    75ec:	00008067          	ret
    75f0:	00060793          	mv	a5,a2
    75f4:	00300713          	li	a4,3
    75f8:	00f76863          	bltu	a4,a5,7608 <memchr+0x54>
    75fc:	06079063          	bnez	a5,765c <memchr+0xa8>
    7600:	00000513          	li	a0,0
    7604:	00008067          	ret
    7608:	0ff5f593          	zext.b	a1,a1
    760c:	00859713          	sll	a4,a1,0x8
    7610:	00b705b3          	add	a1,a4,a1
    7614:	01059713          	sll	a4,a1,0x10
    7618:	feff08b7          	lui	a7,0xfeff0
    761c:	80808837          	lui	a6,0x80808
    7620:	00e585b3          	add	a1,a1,a4
    7624:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7628:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    762c:	00300313          	li	t1,3
    7630:	0100006f          	j	7640 <memchr+0x8c>
    7634:	ffc78793          	add	a5,a5,-4
    7638:	00450513          	add	a0,a0,4
    763c:	fcf370e3          	bgeu	t1,a5,75fc <memchr+0x48>
    7640:	00052703          	lw	a4,0(a0)
    7644:	00e5c733          	xor	a4,a1,a4
    7648:	01170633          	add	a2,a4,a7
    764c:	fff74713          	not	a4,a4
    7650:	00e67733          	and	a4,a2,a4
    7654:	01077733          	and	a4,a4,a6
    7658:	fc070ee3          	beqz	a4,7634 <memchr+0x80>
    765c:	00f507b3          	add	a5,a0,a5
    7660:	00c0006f          	j	766c <memchr+0xb8>
    7664:	00150513          	add	a0,a0,1
    7668:	f8f50ce3          	beq	a0,a5,7600 <memchr+0x4c>
    766c:	00054703          	lbu	a4,0(a0)
    7670:	fed71ae3          	bne	a4,a3,7664 <memchr+0xb0>
    7674:	00008067          	ret

00007678 <strncpy>:
    7678:	00a5e7b3          	or	a5,a1,a0
    767c:	0037f793          	and	a5,a5,3
    7680:	00079663          	bnez	a5,768c <strncpy+0x14>
    7684:	00300793          	li	a5,3
    7688:	04c7e663          	bltu	a5,a2,76d4 <strncpy+0x5c>
    768c:	00050713          	mv	a4,a0
    7690:	01c0006f          	j	76ac <strncpy+0x34>
    7694:	fff5c683          	lbu	a3,-1(a1)
    7698:	fff60813          	add	a6,a2,-1
    769c:	fed78fa3          	sb	a3,-1(a5)
    76a0:	00068e63          	beqz	a3,76bc <strncpy+0x44>
    76a4:	00078713          	mv	a4,a5
    76a8:	00080613          	mv	a2,a6
    76ac:	00158593          	add	a1,a1,1
    76b0:	00170793          	add	a5,a4,1
    76b4:	fe0610e3          	bnez	a2,7694 <strncpy+0x1c>
    76b8:	00008067          	ret
    76bc:	00c70733          	add	a4,a4,a2
    76c0:	06080063          	beqz	a6,7720 <strncpy+0xa8>
    76c4:	00178793          	add	a5,a5,1
    76c8:	fe078fa3          	sb	zero,-1(a5)
    76cc:	fee79ce3          	bne	a5,a4,76c4 <strncpy+0x4c>
    76d0:	00008067          	ret
    76d4:	feff0337          	lui	t1,0xfeff0
    76d8:	808088b7          	lui	a7,0x80808
    76dc:	00050713          	mv	a4,a0
    76e0:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    76e4:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    76e8:	00300e13          	li	t3,3
    76ec:	0180006f          	j	7704 <strncpy+0x8c>
    76f0:	00d72023          	sw	a3,0(a4)
    76f4:	ffc60613          	add	a2,a2,-4
    76f8:	00470713          	add	a4,a4,4
    76fc:	00458593          	add	a1,a1,4
    7700:	face76e3          	bgeu	t3,a2,76ac <strncpy+0x34>
    7704:	0005a683          	lw	a3,0(a1)
    7708:	006687b3          	add	a5,a3,t1
    770c:	fff6c813          	not	a6,a3
    7710:	0107f7b3          	and	a5,a5,a6
    7714:	0117f7b3          	and	a5,a5,a7
    7718:	fc078ce3          	beqz	a5,76f0 <strncpy+0x78>
    771c:	f91ff06f          	j	76ac <strncpy+0x34>
    7720:	00008067          	ret

00007724 <__locale_mb_cur_max>:
    7724:	7fff9517          	auipc	a0,0x7fff9
    7728:	f3854503          	lbu	a0,-200(a0) # 8000065c <__global_locale+0x128>
    772c:	00008067          	ret

00007730 <_localeconv_r>:
    7730:	7fff9517          	auipc	a0,0x7fff9
    7734:	ef450513          	add	a0,a0,-268 # 80000624 <__global_locale+0xf0>
    7738:	00008067          	ret

0000773c <_close_r>:
    773c:	ff010113          	add	sp,sp,-16
    7740:	00812423          	sw	s0,8(sp)
    7744:	00050413          	mv	s0,a0
    7748:	00058513          	mv	a0,a1
    774c:	7fff9797          	auipc	a5,0x7fff9
    7750:	fc07a623          	sw	zero,-52(a5) # 80000718 <errno>
    7754:	00112623          	sw	ra,12(sp)
    7758:	b00f90ef          	jal	a58 <_close>
    775c:	fff00793          	li	a5,-1
    7760:	00f50a63          	beq	a0,a5,7774 <_close_r+0x38>
    7764:	00c12083          	lw	ra,12(sp)
    7768:	00812403          	lw	s0,8(sp)
    776c:	01010113          	add	sp,sp,16
    7770:	00008067          	ret
    7774:	7fff9797          	auipc	a5,0x7fff9
    7778:	fa47a783          	lw	a5,-92(a5) # 80000718 <errno>
    777c:	fe0784e3          	beqz	a5,7764 <_close_r+0x28>
    7780:	00c12083          	lw	ra,12(sp)
    7784:	00f42023          	sw	a5,0(s0)
    7788:	00812403          	lw	s0,8(sp)
    778c:	01010113          	add	sp,sp,16
    7790:	00008067          	ret

00007794 <_lseek_r>:
    7794:	ff010113          	add	sp,sp,-16
    7798:	00058713          	mv	a4,a1
    779c:	00812423          	sw	s0,8(sp)
    77a0:	00060593          	mv	a1,a2
    77a4:	00050413          	mv	s0,a0
    77a8:	00068613          	mv	a2,a3
    77ac:	00070513          	mv	a0,a4
    77b0:	7fff9797          	auipc	a5,0x7fff9
    77b4:	f607a423          	sw	zero,-152(a5) # 80000718 <errno>
    77b8:	00112623          	sw	ra,12(sp)
    77bc:	ad8f90ef          	jal	a94 <_lseek>
    77c0:	fff00793          	li	a5,-1
    77c4:	00f50a63          	beq	a0,a5,77d8 <_lseek_r+0x44>
    77c8:	00c12083          	lw	ra,12(sp)
    77cc:	00812403          	lw	s0,8(sp)
    77d0:	01010113          	add	sp,sp,16
    77d4:	00008067          	ret
    77d8:	7fff9797          	auipc	a5,0x7fff9
    77dc:	f407a783          	lw	a5,-192(a5) # 80000718 <errno>
    77e0:	fe0784e3          	beqz	a5,77c8 <_lseek_r+0x34>
    77e4:	00c12083          	lw	ra,12(sp)
    77e8:	00f42023          	sw	a5,0(s0)
    77ec:	00812403          	lw	s0,8(sp)
    77f0:	01010113          	add	sp,sp,16
    77f4:	00008067          	ret

000077f8 <_read_r>:
    77f8:	ff010113          	add	sp,sp,-16
    77fc:	00058713          	mv	a4,a1
    7800:	00812423          	sw	s0,8(sp)
    7804:	00060593          	mv	a1,a2
    7808:	00050413          	mv	s0,a0
    780c:	00068613          	mv	a2,a3
    7810:	00070513          	mv	a0,a4
    7814:	7fff9797          	auipc	a5,0x7fff9
    7818:	f007a223          	sw	zero,-252(a5) # 80000718 <errno>
    781c:	00112623          	sw	ra,12(sp)
    7820:	a7cf90ef          	jal	a9c <_read>
    7824:	fff00793          	li	a5,-1
    7828:	00f50a63          	beq	a0,a5,783c <_read_r+0x44>
    782c:	00c12083          	lw	ra,12(sp)
    7830:	00812403          	lw	s0,8(sp)
    7834:	01010113          	add	sp,sp,16
    7838:	00008067          	ret
    783c:	7fff9797          	auipc	a5,0x7fff9
    7840:	edc7a783          	lw	a5,-292(a5) # 80000718 <errno>
    7844:	fe0784e3          	beqz	a5,782c <_read_r+0x34>
    7848:	00c12083          	lw	ra,12(sp)
    784c:	00f42023          	sw	a5,0(s0)
    7850:	00812403          	lw	s0,8(sp)
    7854:	01010113          	add	sp,sp,16
    7858:	00008067          	ret

0000785c <_sbrk_r>:
    785c:	ff010113          	add	sp,sp,-16
    7860:	00812423          	sw	s0,8(sp)
    7864:	00050413          	mv	s0,a0
    7868:	00058513          	mv	a0,a1
    786c:	7fff9797          	auipc	a5,0x7fff9
    7870:	ea07a623          	sw	zero,-340(a5) # 80000718 <errno>
    7874:	00112623          	sw	ra,12(sp)
    7878:	ba4f90ef          	jal	c1c <_sbrk>
    787c:	fff00793          	li	a5,-1
    7880:	00f50a63          	beq	a0,a5,7894 <_sbrk_r+0x38>
    7884:	00c12083          	lw	ra,12(sp)
    7888:	00812403          	lw	s0,8(sp)
    788c:	01010113          	add	sp,sp,16
    7890:	00008067          	ret
    7894:	7fff9797          	auipc	a5,0x7fff9
    7898:	e847a783          	lw	a5,-380(a5) # 80000718 <errno>
    789c:	fe0784e3          	beqz	a5,7884 <_sbrk_r+0x28>
    78a0:	00c12083          	lw	ra,12(sp)
    78a4:	00f42023          	sw	a5,0(s0)
    78a8:	00812403          	lw	s0,8(sp)
    78ac:	01010113          	add	sp,sp,16
    78b0:	00008067          	ret

000078b4 <_write_r>:
    78b4:	ff010113          	add	sp,sp,-16
    78b8:	00058713          	mv	a4,a1
    78bc:	00812423          	sw	s0,8(sp)
    78c0:	00060593          	mv	a1,a2
    78c4:	00050413          	mv	s0,a0
    78c8:	00068613          	mv	a2,a3
    78cc:	00070513          	mv	a0,a4
    78d0:	7fff9797          	auipc	a5,0x7fff9
    78d4:	e407a423          	sw	zero,-440(a5) # 80000718 <errno>
    78d8:	00112623          	sw	ra,12(sp)
    78dc:	a9cf90ef          	jal	b78 <_write>
    78e0:	fff00793          	li	a5,-1
    78e4:	00f50a63          	beq	a0,a5,78f8 <_write_r+0x44>
    78e8:	00c12083          	lw	ra,12(sp)
    78ec:	00812403          	lw	s0,8(sp)
    78f0:	01010113          	add	sp,sp,16
    78f4:	00008067          	ret
    78f8:	7fff9797          	auipc	a5,0x7fff9
    78fc:	e207a783          	lw	a5,-480(a5) # 80000718 <errno>
    7900:	fe0784e3          	beqz	a5,78e8 <_write_r+0x34>
    7904:	00c12083          	lw	ra,12(sp)
    7908:	00f42023          	sw	a5,0(s0)
    790c:	00812403          	lw	s0,8(sp)
    7910:	01010113          	add	sp,sp,16
    7914:	00008067          	ret

00007918 <memmove>:
    7918:	02a5f663          	bgeu	a1,a0,7944 <memmove+0x2c>
    791c:	00c58733          	add	a4,a1,a2
    7920:	02e57263          	bgeu	a0,a4,7944 <memmove+0x2c>
    7924:	00c507b3          	add	a5,a0,a2
    7928:	04060663          	beqz	a2,7974 <memmove+0x5c>
    792c:	fff74683          	lbu	a3,-1(a4)
    7930:	fff78793          	add	a5,a5,-1
    7934:	fff70713          	add	a4,a4,-1
    7938:	00d78023          	sb	a3,0(a5)
    793c:	fef518e3          	bne	a0,a5,792c <memmove+0x14>
    7940:	00008067          	ret
    7944:	00f00793          	li	a5,15
    7948:	02c7e863          	bltu	a5,a2,7978 <memmove+0x60>
    794c:	00050793          	mv	a5,a0
    7950:	fff60693          	add	a3,a2,-1
    7954:	0c060263          	beqz	a2,7a18 <memmove+0x100>
    7958:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x23d>
    795c:	00d786b3          	add	a3,a5,a3
    7960:	0005c703          	lbu	a4,0(a1)
    7964:	00178793          	add	a5,a5,1
    7968:	00158593          	add	a1,a1,1
    796c:	fee78fa3          	sb	a4,-1(a5)
    7970:	fed798e3          	bne	a5,a3,7960 <memmove+0x48>
    7974:	00008067          	ret
    7978:	00b567b3          	or	a5,a0,a1
    797c:	0037f793          	and	a5,a5,3
    7980:	08079663          	bnez	a5,7a0c <memmove+0xf4>
    7984:	ff060893          	add	a7,a2,-16
    7988:	ff08f893          	and	a7,a7,-16
    798c:	01088893          	add	a7,a7,16
    7990:	011506b3          	add	a3,a0,a7
    7994:	00058713          	mv	a4,a1
    7998:	00050793          	mv	a5,a0
    799c:	00072803          	lw	a6,0(a4)
    79a0:	01070713          	add	a4,a4,16
    79a4:	01078793          	add	a5,a5,16
    79a8:	ff07a823          	sw	a6,-16(a5)
    79ac:	ff472803          	lw	a6,-12(a4)
    79b0:	ff07aa23          	sw	a6,-12(a5)
    79b4:	ff872803          	lw	a6,-8(a4)
    79b8:	ff07ac23          	sw	a6,-8(a5)
    79bc:	ffc72803          	lw	a6,-4(a4)
    79c0:	ff07ae23          	sw	a6,-4(a5)
    79c4:	fcd79ce3          	bne	a5,a3,799c <memmove+0x84>
    79c8:	00c67813          	and	a6,a2,12
    79cc:	011585b3          	add	a1,a1,a7
    79d0:	00f67713          	and	a4,a2,15
    79d4:	04080463          	beqz	a6,7a1c <memmove+0x104>
    79d8:	ffc70813          	add	a6,a4,-4
    79dc:	ffc87813          	and	a6,a6,-4
    79e0:	00480813          	add	a6,a6,4
    79e4:	010687b3          	add	a5,a3,a6
    79e8:	00058713          	mv	a4,a1
    79ec:	00072883          	lw	a7,0(a4)
    79f0:	00468693          	add	a3,a3,4
    79f4:	00470713          	add	a4,a4,4
    79f8:	ff16ae23          	sw	a7,-4(a3)
    79fc:	fef698e3          	bne	a3,a5,79ec <memmove+0xd4>
    7a00:	00367613          	and	a2,a2,3
    7a04:	010585b3          	add	a1,a1,a6
    7a08:	f49ff06f          	j	7950 <memmove+0x38>
    7a0c:	fff60693          	add	a3,a2,-1
    7a10:	00050793          	mv	a5,a0
    7a14:	f45ff06f          	j	7958 <memmove+0x40>
    7a18:	00008067          	ret
    7a1c:	00070613          	mv	a2,a4
    7a20:	f31ff06f          	j	7950 <memmove+0x38>

00007a24 <frexp>:
    7a24:	ff010113          	add	sp,sp,-16
    7a28:	00912223          	sw	s1,4(sp)
    7a2c:	800004b7          	lui	s1,0x80000
    7a30:	00812423          	sw	s0,8(sp)
    7a34:	00112623          	sw	ra,12(sp)
    7a38:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7a3c:	00060413          	mv	s0,a2
    7a40:	00062023          	sw	zero,0(a2)
    7a44:	00b4f6b3          	and	a3,s1,a1
    7a48:	7ff00637          	lui	a2,0x7ff00
    7a4c:	00058793          	mv	a5,a1
    7a50:	00050713          	mv	a4,a0
    7a54:	04c6f063          	bgeu	a3,a2,7a94 <frexp+0x70>
    7a58:	00a6e633          	or	a2,a3,a0
    7a5c:	02060c63          	beqz	a2,7a94 <frexp+0x70>
    7a60:	0145d613          	srl	a2,a1,0x14
    7a64:	7ff67613          	and	a2,a2,2047
    7a68:	04060463          	beqz	a2,7ab0 <frexp+0x8c>
    7a6c:	00000593          	li	a1,0
    7a70:	80100637          	lui	a2,0x80100
    7a74:	4146d693          	sra	a3,a3,0x14
    7a78:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7a7c:	c0268693          	add	a3,a3,-1022
    7a80:	00c7f7b3          	and	a5,a5,a2
    7a84:	00b686b3          	add	a3,a3,a1
    7a88:	3fe00637          	lui	a2,0x3fe00
    7a8c:	00c7e7b3          	or	a5,a5,a2
    7a90:	00d42023          	sw	a3,0(s0)
    7a94:	00c12083          	lw	ra,12(sp)
    7a98:	00812403          	lw	s0,8(sp)
    7a9c:	00412483          	lw	s1,4(sp)
    7aa0:	00070513          	mv	a0,a4
    7aa4:	00078593          	mv	a1,a5
    7aa8:	01010113          	add	sp,sp,16
    7aac:	00008067          	ret
    7ab0:	7fff9797          	auipc	a5,0x7fff9
    7ab4:	c1078793          	add	a5,a5,-1008 # 800006c0 <__global_locale+0x18c>
    7ab8:	0047a683          	lw	a3,4(a5)
    7abc:	0007a603          	lw	a2,0(a5)
    7ac0:	199050ef          	jal	d458 <__muldf3>
    7ac4:	00058793          	mv	a5,a1
    7ac8:	00b4f6b3          	and	a3,s1,a1
    7acc:	00050713          	mv	a4,a0
    7ad0:	fca00593          	li	a1,-54
    7ad4:	f9dff06f          	j	7a70 <frexp+0x4c>

00007ad8 <quorem>:
    7ad8:	fb010113          	add	sp,sp,-80
    7adc:	04912223          	sw	s1,68(sp)
    7ae0:	01052783          	lw	a5,16(a0)
    7ae4:	0105a483          	lw	s1,16(a1)
    7ae8:	04112623          	sw	ra,76(sp)
    7aec:	00b12423          	sw	a1,8(sp)
    7af0:	2097ca63          	blt	a5,s1,7d04 <quorem+0x22c>
    7af4:	fff48493          	add	s1,s1,-1
    7af8:	03512a23          	sw	s5,52(sp)
    7afc:	03812423          	sw	s8,40(sp)
    7b00:	00249a93          	sll	s5,s1,0x2
    7b04:	01458c13          	add	s8,a1,20
    7b08:	05212023          	sw	s2,64(sp)
    7b0c:	03312e23          	sw	s3,60(sp)
    7b10:	015c0933          	add	s2,s8,s5
    7b14:	01450993          	add	s3,a0,20
    7b18:	015987b3          	add	a5,s3,s5
    7b1c:	03712623          	sw	s7,44(sp)
    7b20:	00092b83          	lw	s7,0(s2)
    7b24:	03912223          	sw	s9,36(sp)
    7b28:	0007ac83          	lw	s9,0(a5)
    7b2c:	001b8b93          	add	s7,s7,1
    7b30:	03412c23          	sw	s4,56(sp)
    7b34:	000b8593          	mv	a1,s7
    7b38:	00050a13          	mv	s4,a0
    7b3c:	000c8513          	mv	a0,s9
    7b40:	04812423          	sw	s0,72(sp)
    7b44:	00f12623          	sw	a5,12(sp)
    7b48:	09c070ef          	jal	ebe4 <__hidden___udivsi3>
    7b4c:	00050413          	mv	s0,a0
    7b50:	0d7cee63          	bltu	s9,s7,7c2c <quorem+0x154>
    7b54:	03a12023          	sw	s10,32(sp)
    7b58:	00010d37          	lui	s10,0x10
    7b5c:	01b12e23          	sw	s11,28(sp)
    7b60:	03612823          	sw	s6,48(sp)
    7b64:	000c0a93          	mv	s5,s8
    7b68:	00098d93          	mv	s11,s3
    7b6c:	00000c93          	li	s9,0
    7b70:	00000b93          	li	s7,0
    7b74:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    7b78:	000aab03          	lw	s6,0(s5)
    7b7c:	00040593          	mv	a1,s0
    7b80:	004d8d93          	add	s11,s11,4
    7b84:	01ab7533          	and	a0,s6,s10
    7b88:	799060ef          	jal	eb20 <__mulsi3>
    7b8c:	00050793          	mv	a5,a0
    7b90:	00040593          	mv	a1,s0
    7b94:	010b5513          	srl	a0,s6,0x10
    7b98:	01978cb3          	add	s9,a5,s9
    7b9c:	785060ef          	jal	eb20 <__mulsi3>
    7ba0:	ffcda603          	lw	a2,-4(s11)
    7ba4:	01acf733          	and	a4,s9,s10
    7ba8:	010cdc93          	srl	s9,s9,0x10
    7bac:	01a677b3          	and	a5,a2,s10
    7bb0:	40e787b3          	sub	a5,a5,a4
    7bb4:	017787b3          	add	a5,a5,s7
    7bb8:	01950533          	add	a0,a0,s9
    7bbc:	4107d713          	sra	a4,a5,0x10
    7bc0:	01a575b3          	and	a1,a0,s10
    7bc4:	01065613          	srl	a2,a2,0x10
    7bc8:	40b70733          	sub	a4,a4,a1
    7bcc:	00c70733          	add	a4,a4,a2
    7bd0:	01a7f7b3          	and	a5,a5,s10
    7bd4:	01071613          	sll	a2,a4,0x10
    7bd8:	00c7e7b3          	or	a5,a5,a2
    7bdc:	004a8a93          	add	s5,s5,4
    7be0:	fefdae23          	sw	a5,-4(s11)
    7be4:	01055c93          	srl	s9,a0,0x10
    7be8:	41075b93          	sra	s7,a4,0x10
    7bec:	f95976e3          	bgeu	s2,s5,7b78 <quorem+0xa0>
    7bf0:	00c12703          	lw	a4,12(sp)
    7bf4:	00072783          	lw	a5,0(a4)
    7bf8:	12079063          	bnez	a5,7d18 <quorem+0x240>
    7bfc:	ffc70a93          	add	s5,a4,-4
    7c00:	0159e863          	bltu	s3,s5,7c10 <quorem+0x138>
    7c04:	0180006f          	j	7c1c <quorem+0x144>
    7c08:	fff48493          	add	s1,s1,-1
    7c0c:	0159f863          	bgeu	s3,s5,7c1c <quorem+0x144>
    7c10:	000aa783          	lw	a5,0(s5)
    7c14:	ffca8a93          	add	s5,s5,-4
    7c18:	fe0788e3          	beqz	a5,7c08 <quorem+0x130>
    7c1c:	03012b03          	lw	s6,48(sp)
    7c20:	02012d03          	lw	s10,32(sp)
    7c24:	01c12d83          	lw	s11,28(sp)
    7c28:	009a2823          	sw	s1,16(s4)
    7c2c:	00812583          	lw	a1,8(sp)
    7c30:	000a0513          	mv	a0,s4
    7c34:	1fc020ef          	jal	9e30 <__mcmp>
    7c38:	08054c63          	bltz	a0,7cd0 <quorem+0x1f8>
    7c3c:	00010537          	lui	a0,0x10
    7c40:	00098593          	mv	a1,s3
    7c44:	00000713          	li	a4,0
    7c48:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    7c4c:	0005a683          	lw	a3,0(a1)
    7c50:	000c2603          	lw	a2,0(s8)
    7c54:	00458593          	add	a1,a1,4
    7c58:	00a6f7b3          	and	a5,a3,a0
    7c5c:	00a67833          	and	a6,a2,a0
    7c60:	410787b3          	sub	a5,a5,a6
    7c64:	00e787b3          	add	a5,a5,a4
    7c68:	4107d713          	sra	a4,a5,0x10
    7c6c:	01065613          	srl	a2,a2,0x10
    7c70:	0106d693          	srl	a3,a3,0x10
    7c74:	40c70733          	sub	a4,a4,a2
    7c78:	00d70733          	add	a4,a4,a3
    7c7c:	01071693          	sll	a3,a4,0x10
    7c80:	00a7f7b3          	and	a5,a5,a0
    7c84:	00d7e7b3          	or	a5,a5,a3
    7c88:	004c0c13          	add	s8,s8,4
    7c8c:	fef5ae23          	sw	a5,-4(a1)
    7c90:	41075713          	sra	a4,a4,0x10
    7c94:	fb897ce3          	bgeu	s2,s8,7c4c <quorem+0x174>
    7c98:	00249793          	sll	a5,s1,0x2
    7c9c:	00f987b3          	add	a5,s3,a5
    7ca0:	0007a703          	lw	a4,0(a5)
    7ca4:	02071463          	bnez	a4,7ccc <quorem+0x1f4>
    7ca8:	ffc78793          	add	a5,a5,-4
    7cac:	00f9e863          	bltu	s3,a5,7cbc <quorem+0x1e4>
    7cb0:	0180006f          	j	7cc8 <quorem+0x1f0>
    7cb4:	fff48493          	add	s1,s1,-1
    7cb8:	00f9f863          	bgeu	s3,a5,7cc8 <quorem+0x1f0>
    7cbc:	0007a703          	lw	a4,0(a5)
    7cc0:	ffc78793          	add	a5,a5,-4
    7cc4:	fe0708e3          	beqz	a4,7cb4 <quorem+0x1dc>
    7cc8:	009a2823          	sw	s1,16(s4)
    7ccc:	00140413          	add	s0,s0,1
    7cd0:	04c12083          	lw	ra,76(sp)
    7cd4:	00040513          	mv	a0,s0
    7cd8:	04812403          	lw	s0,72(sp)
    7cdc:	04012903          	lw	s2,64(sp)
    7ce0:	03c12983          	lw	s3,60(sp)
    7ce4:	03812a03          	lw	s4,56(sp)
    7ce8:	03412a83          	lw	s5,52(sp)
    7cec:	02c12b83          	lw	s7,44(sp)
    7cf0:	02812c03          	lw	s8,40(sp)
    7cf4:	02412c83          	lw	s9,36(sp)
    7cf8:	04412483          	lw	s1,68(sp)
    7cfc:	05010113          	add	sp,sp,80
    7d00:	00008067          	ret
    7d04:	04c12083          	lw	ra,76(sp)
    7d08:	04412483          	lw	s1,68(sp)
    7d0c:	00000513          	li	a0,0
    7d10:	05010113          	add	sp,sp,80
    7d14:	00008067          	ret
    7d18:	00812583          	lw	a1,8(sp)
    7d1c:	000a0513          	mv	a0,s4
    7d20:	03012b03          	lw	s6,48(sp)
    7d24:	02012d03          	lw	s10,32(sp)
    7d28:	01c12d83          	lw	s11,28(sp)
    7d2c:	104020ef          	jal	9e30 <__mcmp>
    7d30:	f00556e3          	bgez	a0,7c3c <quorem+0x164>
    7d34:	f9dff06f          	j	7cd0 <quorem+0x1f8>

00007d38 <_dtoa_r>:
    7d38:	03852303          	lw	t1,56(a0)
    7d3c:	f5010113          	add	sp,sp,-176
    7d40:	0a812423          	sw	s0,168(sp)
    7d44:	0a912223          	sw	s1,164(sp)
    7d48:	0b212023          	sw	s2,160(sp)
    7d4c:	09412c23          	sw	s4,152(sp)
    7d50:	07b12e23          	sw	s11,124(sp)
    7d54:	0a112623          	sw	ra,172(sp)
    7d58:	09312e23          	sw	s3,156(sp)
    7d5c:	09512a23          	sw	s5,148(sp)
    7d60:	00e12a23          	sw	a4,20(sp)
    7d64:	00f12623          	sw	a5,12(sp)
    7d68:	01112423          	sw	a7,8(sp)
    7d6c:	02b12223          	sw	a1,36(sp)
    7d70:	00c12023          	sw	a2,0(sp)
    7d74:	00050413          	mv	s0,a0
    7d78:	00058d93          	mv	s11,a1
    7d7c:	00060493          	mv	s1,a2
    7d80:	00068a13          	mv	s4,a3
    7d84:	00080913          	mv	s2,a6
    7d88:	02030263          	beqz	t1,7dac <_dtoa_r+0x74>
    7d8c:	03c52703          	lw	a4,60(a0)
    7d90:	00100793          	li	a5,1
    7d94:	00030593          	mv	a1,t1
    7d98:	00e797b3          	sll	a5,a5,a4
    7d9c:	00e32223          	sw	a4,4(t1)
    7da0:	00f32423          	sw	a5,8(t1)
    7da4:	734010ef          	jal	94d8 <_Bfree>
    7da8:	02042c23          	sw	zero,56(s0)
    7dac:	00048993          	mv	s3,s1
    7db0:	00000693          	li	a3,0
    7db4:	0004dc63          	bgez	s1,7dcc <_dtoa_r+0x94>
    7db8:	00149493          	sll	s1,s1,0x1
    7dbc:	0014d793          	srl	a5,s1,0x1
    7dc0:	00f12023          	sw	a5,0(sp)
    7dc4:	00078993          	mv	s3,a5
    7dc8:	00100693          	li	a3,1
    7dcc:	7ff00737          	lui	a4,0x7ff00
    7dd0:	00d92023          	sw	a3,0(s2)
    7dd4:	00e9f6b3          	and	a3,s3,a4
    7dd8:	64e68463          	beq	a3,a4,8420 <_dtoa_r+0x6e8>
    7ddc:	00012483          	lw	s1,0(sp)
    7de0:	000d8513          	mv	a0,s11
    7de4:	00000613          	li	a2,0
    7de8:	00048593          	mv	a1,s1
    7dec:	00000693          	li	a3,0
    7df0:	01b12c23          	sw	s11,24(sp)
    7df4:	00912e23          	sw	s1,28(sp)
    7df8:	3cc050ef          	jal	d1c4 <__eqdf2>
    7dfc:	04051c63          	bnez	a0,7e54 <_dtoa_r+0x11c>
    7e00:	00c12703          	lw	a4,12(sp)
    7e04:	00100793          	li	a5,1
    7e08:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    7e0c:	00812703          	lw	a4,8(sp)
    7e10:	00070863          	beqz	a4,7e20 <_dtoa_r+0xe8>
    7e14:	00007797          	auipc	a5,0x7
    7e18:	1a978793          	add	a5,a5,425 # efbd <__fini_array_end+0x2a5>
    7e1c:	00f72023          	sw	a5,0(a4)
    7e20:	00007a97          	auipc	s5,0x7
    7e24:	19ca8a93          	add	s5,s5,412 # efbc <__fini_array_end+0x2a4>
    7e28:	0ac12083          	lw	ra,172(sp)
    7e2c:	0a812403          	lw	s0,168(sp)
    7e30:	0a412483          	lw	s1,164(sp)
    7e34:	0a012903          	lw	s2,160(sp)
    7e38:	09c12983          	lw	s3,156(sp)
    7e3c:	09812a03          	lw	s4,152(sp)
    7e40:	07c12d83          	lw	s11,124(sp)
    7e44:	000a8513          	mv	a0,s5
    7e48:	09412a83          	lw	s5,148(sp)
    7e4c:	0b010113          	add	sp,sp,176
    7e50:	00008067          	ret
    7e54:	00048613          	mv	a2,s1
    7e58:	06810713          	add	a4,sp,104
    7e5c:	06c10693          	add	a3,sp,108
    7e60:	000d8593          	mv	a1,s11
    7e64:	00040513          	mv	a0,s0
    7e68:	09612823          	sw	s6,144(sp)
    7e6c:	09712623          	sw	s7,140(sp)
    7e70:	09812423          	sw	s8,136(sp)
    7e74:	09912223          	sw	s9,132(sp)
    7e78:	09a12023          	sw	s10,128(sp)
    7e7c:	0149d913          	srl	s2,s3,0x14
    7e80:	268020ef          	jal	a0e8 <__d2b>
    7e84:	00050493          	mv	s1,a0
    7e88:	5c091e63          	bnez	s2,8464 <_dtoa_r+0x72c>
    7e8c:	06812a83          	lw	s5,104(sp)
    7e90:	06c12903          	lw	s2,108(sp)
    7e94:	02000793          	li	a5,32
    7e98:	012a8933          	add	s2,s5,s2
    7e9c:	43290713          	add	a4,s2,1074
    7ea0:	36e7dae3          	bge	a5,a4,8a14 <_dtoa_r+0xcdc>
    7ea4:	04000793          	li	a5,64
    7ea8:	40e787b3          	sub	a5,a5,a4
    7eac:	41290513          	add	a0,s2,1042
    7eb0:	00f997b3          	sll	a5,s3,a5
    7eb4:	00add533          	srl	a0,s11,a0
    7eb8:	00a7e533          	or	a0,a5,a0
    7ebc:	7c4060ef          	jal	e680 <__floatunsidf>
    7ec0:	fe1007b7          	lui	a5,0xfe100
    7ec4:	00100693          	li	a3,1
    7ec8:	00050713          	mv	a4,a0
    7ecc:	00b787b3          	add	a5,a5,a1
    7ed0:	fff90913          	add	s2,s2,-1
    7ed4:	02d12c23          	sw	a3,56(sp)
    7ed8:	7fff8697          	auipc	a3,0x7fff8
    7edc:	7f068693          	add	a3,a3,2032 # 800006c8 <__global_locale+0x194>
    7ee0:	0006a603          	lw	a2,0(a3)
    7ee4:	0046a683          	lw	a3,4(a3)
    7ee8:	00070513          	mv	a0,a4
    7eec:	00078593          	mv	a1,a5
    7ef0:	4f9050ef          	jal	dbe8 <__subdf3>
    7ef4:	7fff8797          	auipc	a5,0x7fff8
    7ef8:	7dc78793          	add	a5,a5,2012 # 800006d0 <__global_locale+0x19c>
    7efc:	0007a603          	lw	a2,0(a5)
    7f00:	0047a683          	lw	a3,4(a5)
    7f04:	554050ef          	jal	d458 <__muldf3>
    7f08:	7fff8797          	auipc	a5,0x7fff8
    7f0c:	7d078793          	add	a5,a5,2000 # 800006d8 <__global_locale+0x1a4>
    7f10:	0007a603          	lw	a2,0(a5)
    7f14:	0047a683          	lw	a3,4(a5)
    7f18:	138040ef          	jal	c050 <__adddf3>
    7f1c:	00050b13          	mv	s6,a0
    7f20:	00090513          	mv	a0,s2
    7f24:	00058993          	mv	s3,a1
    7f28:	6a0060ef          	jal	e5c8 <__floatsidf>
    7f2c:	7fff8797          	auipc	a5,0x7fff8
    7f30:	7b478793          	add	a5,a5,1972 # 800006e0 <__global_locale+0x1ac>
    7f34:	0007a603          	lw	a2,0(a5)
    7f38:	0047a683          	lw	a3,4(a5)
    7f3c:	51c050ef          	jal	d458 <__muldf3>
    7f40:	00050613          	mv	a2,a0
    7f44:	00058693          	mv	a3,a1
    7f48:	000b0513          	mv	a0,s6
    7f4c:	00098593          	mv	a1,s3
    7f50:	100040ef          	jal	c050 <__adddf3>
    7f54:	00050b93          	mv	s7,a0
    7f58:	00058b13          	mv	s6,a1
    7f5c:	5e8060ef          	jal	e544 <__fixdfsi>
    7f60:	00050993          	mv	s3,a0
    7f64:	000b0593          	mv	a1,s6
    7f68:	000b8513          	mv	a0,s7
    7f6c:	00000613          	li	a2,0
    7f70:	00000693          	li	a3,0
    7f74:	3dc050ef          	jal	d350 <__ledf2>
    7f78:	02055063          	bgez	a0,7f98 <_dtoa_r+0x260>
    7f7c:	00098513          	mv	a0,s3
    7f80:	648060ef          	jal	e5c8 <__floatsidf>
    7f84:	000b8613          	mv	a2,s7
    7f88:	000b0693          	mv	a3,s6
    7f8c:	238050ef          	jal	d1c4 <__eqdf2>
    7f90:	00a03533          	snez	a0,a0
    7f94:	40a989b3          	sub	s3,s3,a0
    7f98:	412a8ab3          	sub	s5,s5,s2
    7f9c:	01600793          	li	a5,22
    7fa0:	fffa8b13          	add	s6,s5,-1
    7fa4:	2137e2e3          	bltu	a5,s3,89a8 <_dtoa_r+0xc70>
    7fa8:	00399713          	sll	a4,s3,0x3
    7fac:	00007797          	auipc	a5,0x7
    7fb0:	6ac78793          	add	a5,a5,1708 # f658 <__mprec_tens>
    7fb4:	00e787b3          	add	a5,a5,a4
    7fb8:	0007a603          	lw	a2,0(a5)
    7fbc:	0047a683          	lw	a3,4(a5)
    7fc0:	01812503          	lw	a0,24(sp)
    7fc4:	01c12583          	lw	a1,28(sp)
    7fc8:	388050ef          	jal	d350 <__ledf2>
    7fcc:	220554e3          	bgez	a0,89f4 <_dtoa_r+0xcbc>
    7fd0:	fff98993          	add	s3,s3,-1
    7fd4:	02012a23          	sw	zero,52(sp)
    7fd8:	00012823          	sw	zero,16(sp)
    7fdc:	4a0b4863          	bltz	s6,848c <_dtoa_r+0x754>
    7fe0:	4c09d063          	bgez	s3,84a0 <_dtoa_r+0x768>
    7fe4:	01012783          	lw	a5,16(sp)
    7fe8:	03312023          	sw	s3,32(sp)
    7fec:	413787b3          	sub	a5,a5,s3
    7ff0:	00f12823          	sw	a5,16(sp)
    7ff4:	413007b3          	neg	a5,s3
    7ff8:	02f12823          	sw	a5,48(sp)
    7ffc:	00900793          	li	a5,9
    8000:	00000993          	li	s3,0
    8004:	4b47e863          	bltu	a5,s4,84b4 <_dtoa_r+0x77c>
    8008:	00500793          	li	a5,5
    800c:	2147dae3          	bge	a5,s4,8a20 <_dtoa_r+0xce8>
    8010:	ffca0a13          	add	s4,s4,-4
    8014:	00300793          	li	a5,3
    8018:	00000913          	li	s2,0
    801c:	66fa02e3          	beq	s4,a5,8e80 <_dtoa_r+0x1148>
    8020:	6147dae3          	bge	a5,s4,8e34 <_dtoa_r+0x10fc>
    8024:	00400793          	li	a5,4
    8028:	54fa1ae3          	bne	s4,a5,8d7c <_dtoa_r+0x1044>
    802c:	00100793          	li	a5,1
    8030:	02f12423          	sw	a5,40(sp)
    8034:	01412603          	lw	a2,20(sp)
    8038:	62c05ce3          	blez	a2,8e70 <_dtoa_r+0x1138>
    803c:	02c12e23          	sw	a2,60(sp)
    8040:	00060c13          	mv	s8,a2
    8044:	01700693          	li	a3,23
    8048:	00100713          	li	a4,1
    804c:	00400793          	li	a5,4
    8050:	00c6c463          	blt	a3,a2,8058 <_dtoa_r+0x320>
    8054:	3540106f          	j	93a8 <_dtoa_r+0x1670>
    8058:	00179793          	sll	a5,a5,0x1
    805c:	01478693          	add	a3,a5,20
    8060:	00070593          	mv	a1,a4
    8064:	00170713          	add	a4,a4,1
    8068:	fed678e3          	bgeu	a2,a3,8058 <_dtoa_r+0x320>
    806c:	02b42e23          	sw	a1,60(s0)
    8070:	00040513          	mv	a0,s0
    8074:	3b0010ef          	jal	9424 <_Balloc>
    8078:	00050a93          	mv	s5,a0
    807c:	00051463          	bnez	a0,8084 <_dtoa_r+0x34c>
    8080:	30c0106f          	j	938c <_dtoa_r+0x1654>
    8084:	02a42c23          	sw	a0,56(s0)
    8088:	00e00793          	li	a5,14
    808c:	5187ea63          	bltu	a5,s8,85a0 <_dtoa_r+0x868>
    8090:	50090863          	beqz	s2,85a0 <_dtoa_r+0x868>
    8094:	02012783          	lw	a5,32(sp)
    8098:	62f054e3          	blez	a5,8ec0 <_dtoa_r+0x1188>
    809c:	00f7f713          	and	a4,a5,15
    80a0:	00371713          	sll	a4,a4,0x3
    80a4:	4047dc93          	sra	s9,a5,0x4
    80a8:	00007797          	auipc	a5,0x7
    80ac:	5b078793          	add	a5,a5,1456 # f658 <__mprec_tens>
    80b0:	00e787b3          	add	a5,a5,a4
    80b4:	010cf693          	and	a3,s9,16
    80b8:	0007a803          	lw	a6,0(a5)
    80bc:	0047a703          	lw	a4,4(a5)
    80c0:	560682e3          	beqz	a3,8e24 <_dtoa_r+0x10ec>
    80c4:	00007797          	auipc	a5,0x7
    80c8:	56c78793          	add	a5,a5,1388 # f630 <__mprec_bigtens>
    80cc:	0207a603          	lw	a2,32(a5)
    80d0:	0247a683          	lw	a3,36(a5)
    80d4:	01812503          	lw	a0,24(sp)
    80d8:	01c12583          	lw	a1,28(sp)
    80dc:	04e12423          	sw	a4,72(sp)
    80e0:	05012023          	sw	a6,64(sp)
    80e4:	035040ef          	jal	c918 <__divdf3>
    80e8:	04012803          	lw	a6,64(sp)
    80ec:	04812703          	lw	a4,72(sp)
    80f0:	00fcfc93          	and	s9,s9,15
    80f4:	00050313          	mv	t1,a0
    80f8:	00058d13          	mv	s10,a1
    80fc:	00300913          	li	s2,3
    8100:	040c8c63          	beqz	s9,8158 <_dtoa_r+0x420>
    8104:	04812023          	sw	s0,64(sp)
    8108:	00007b97          	auipc	s7,0x7
    810c:	528b8b93          	add	s7,s7,1320 # f630 <__mprec_bigtens>
    8110:	00090413          	mv	s0,s2
    8114:	00070593          	mv	a1,a4
    8118:	00030913          	mv	s2,t1
    811c:	001cf793          	and	a5,s9,1
    8120:	00078e63          	beqz	a5,813c <_dtoa_r+0x404>
    8124:	000ba603          	lw	a2,0(s7)
    8128:	004ba683          	lw	a3,4(s7)
    812c:	00080513          	mv	a0,a6
    8130:	00140413          	add	s0,s0,1
    8134:	324050ef          	jal	d458 <__muldf3>
    8138:	00050813          	mv	a6,a0
    813c:	401cdc93          	sra	s9,s9,0x1
    8140:	008b8b93          	add	s7,s7,8
    8144:	fc0c9ce3          	bnez	s9,811c <_dtoa_r+0x3e4>
    8148:	00090313          	mv	t1,s2
    814c:	00040913          	mv	s2,s0
    8150:	04012403          	lw	s0,64(sp)
    8154:	00058713          	mv	a4,a1
    8158:	00070693          	mv	a3,a4
    815c:	00080613          	mv	a2,a6
    8160:	00030513          	mv	a0,t1
    8164:	000d0593          	mv	a1,s10
    8168:	7b0040ef          	jal	c918 <__divdf3>
    816c:	00050713          	mv	a4,a0
    8170:	00058793          	mv	a5,a1
    8174:	03412683          	lw	a3,52(sp)
    8178:	02068c63          	beqz	a3,81b0 <_dtoa_r+0x478>
    817c:	7fff8697          	auipc	a3,0x7fff8
    8180:	56c68693          	add	a3,a3,1388 # 800006e8 <__global_locale+0x1b4>
    8184:	0006a603          	lw	a2,0(a3)
    8188:	0046a683          	lw	a3,4(a3)
    818c:	00070513          	mv	a0,a4
    8190:	00078593          	mv	a1,a5
    8194:	04e12423          	sw	a4,72(sp)
    8198:	04f12023          	sw	a5,64(sp)
    819c:	1b4050ef          	jal	d350 <__ledf2>
    81a0:	04012783          	lw	a5,64(sp)
    81a4:	04812703          	lw	a4,72(sp)
    81a8:	00055463          	bgez	a0,81b0 <_dtoa_r+0x478>
    81ac:	04c0106f          	j	91f8 <_dtoa_r+0x14c0>
    81b0:	00090513          	mv	a0,s2
    81b4:	04f12623          	sw	a5,76(sp)
    81b8:	04e12023          	sw	a4,64(sp)
    81bc:	40c060ef          	jal	e5c8 <__floatsidf>
    81c0:	04012703          	lw	a4,64(sp)
    81c4:	04c12783          	lw	a5,76(sp)
    81c8:	00070613          	mv	a2,a4
    81cc:	00078693          	mv	a3,a5
    81d0:	04e12423          	sw	a4,72(sp)
    81d4:	04f12023          	sw	a5,64(sp)
    81d8:	280050ef          	jal	d458 <__muldf3>
    81dc:	7fff8697          	auipc	a3,0x7fff8
    81e0:	51c68693          	add	a3,a3,1308 # 800006f8 <__global_locale+0x1c4>
    81e4:	0006a603          	lw	a2,0(a3)
    81e8:	0046a683          	lw	a3,4(a3)
    81ec:	665030ef          	jal	c050 <__adddf3>
    81f0:	fcc006b7          	lui	a3,0xfcc00
    81f4:	04012783          	lw	a5,64(sp)
    81f8:	04812703          	lw	a4,72(sp)
    81fc:	00050c93          	mv	s9,a0
    8200:	00b68bb3          	add	s7,a3,a1
    8204:	340c0463          	beqz	s8,854c <_dtoa_r+0x814>
    8208:	02012683          	lw	a3,32(sp)
    820c:	05812423          	sw	s8,72(sp)
    8210:	04d12e23          	sw	a3,92(sp)
    8214:	00070513          	mv	a0,a4
    8218:	00078593          	mv	a1,a5
    821c:	04e12623          	sw	a4,76(sp)
    8220:	04f12023          	sw	a5,64(sp)
    8224:	320060ef          	jal	e544 <__fixdfsi>
    8228:	04812783          	lw	a5,72(sp)
    822c:	00050913          	mv	s2,a0
    8230:	05912c23          	sw	s9,88(sp)
    8234:	fff78693          	add	a3,a5,-1
    8238:	00369693          	sll	a3,a3,0x3
    823c:	00007797          	auipc	a5,0x7
    8240:	41c78793          	add	a5,a5,1052 # f658 <__mprec_tens>
    8244:	00d786b3          	add	a3,a5,a3
    8248:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    824c:	0046a803          	lw	a6,4(a3)
    8250:	001a8d13          	add	s10,s5,1
    8254:	04f12823          	sw	a5,80(sp)
    8258:	05012a23          	sw	a6,84(sp)
    825c:	36c060ef          	jal	e5c8 <__floatsidf>
    8260:	04c12703          	lw	a4,76(sp)
    8264:	04012783          	lw	a5,64(sp)
    8268:	00050613          	mv	a2,a0
    826c:	00058693          	mv	a3,a1
    8270:	00070513          	mv	a0,a4
    8274:	00078593          	mv	a1,a5
    8278:	171050ef          	jal	dbe8 <__subdf3>
    827c:	02812703          	lw	a4,40(sp)
    8280:	03090313          	add	t1,s2,48
    8284:	05a12023          	sw	s10,64(sp)
    8288:	00050c93          	mv	s9,a0
    828c:	0ff37313          	zext.b	t1,t1
    8290:	5c0706e3          	beqz	a4,905c <_dtoa_r+0x1324>
    8294:	7fff8797          	auipc	a5,0x7fff8
    8298:	42478793          	add	a5,a5,1060 # 800006b8 <__global_locale+0x184>
    829c:	0007a503          	lw	a0,0(a5)
    82a0:	05012603          	lw	a2,80(sp)
    82a4:	05412683          	lw	a3,84(sp)
    82a8:	04b12023          	sw	a1,64(sp)
    82ac:	0047a583          	lw	a1,4(a5)
    82b0:	04612623          	sw	t1,76(sp)
    82b4:	664040ef          	jal	c918 <__divdf3>
    82b8:	05812603          	lw	a2,88(sp)
    82bc:	000b8693          	mv	a3,s7
    82c0:	129050ef          	jal	dbe8 <__subdf3>
    82c4:	04012883          	lw	a7,64(sp)
    82c8:	04c12303          	lw	t1,76(sp)
    82cc:	000c8613          	mv	a2,s9
    82d0:	00088693          	mv	a3,a7
    82d4:	006a8023          	sb	t1,0(s5)
    82d8:	00050913          	mv	s2,a0
    82dc:	00058b93          	mv	s7,a1
    82e0:	771040ef          	jal	d250 <__gedf2>
    82e4:	04012883          	lw	a7,64(sp)
    82e8:	00a05463          	blez	a0,82f0 <_dtoa_r+0x5b8>
    82ec:	7c90006f          	j	92b4 <_dtoa_r+0x157c>
    82f0:	7fff8697          	auipc	a3,0x7fff8
    82f4:	3f868693          	add	a3,a3,1016 # 800006e8 <__global_locale+0x1b4>
    82f8:	0006a783          	lw	a5,0(a3)
    82fc:	0046a803          	lw	a6,4(a3)
    8300:	05312623          	sw	s3,76(sp)
    8304:	04f12023          	sw	a5,64(sp)
    8308:	00000793          	li	a5,0
    830c:	05612823          	sw	s6,80(sp)
    8310:	05812c23          	sw	s8,88(sp)
    8314:	05012223          	sw	a6,68(sp)
    8318:	04812c03          	lw	s8,72(sp)
    831c:	00078b13          	mv	s6,a5
    8320:	05412423          	sw	s4,72(sp)
    8324:	00088993          	mv	s3,a7
    8328:	0980006f          	j	83c0 <_dtoa_r+0x688>
    832c:	001b0b13          	add	s6,s6,1
    8330:	018b4463          	blt	s6,s8,8338 <_dtoa_r+0x600>
    8334:	7d10006f          	j	9304 <_dtoa_r+0x15cc>
    8338:	7fff8a17          	auipc	s4,0x7fff8
    833c:	3b8a0a13          	add	s4,s4,952 # 800006f0 <__global_locale+0x1bc>
    8340:	000a2603          	lw	a2,0(s4)
    8344:	004a2683          	lw	a3,4(s4)
    8348:	00090513          	mv	a0,s2
    834c:	000b8593          	mv	a1,s7
    8350:	108050ef          	jal	d458 <__muldf3>
    8354:	000a2603          	lw	a2,0(s4)
    8358:	004a2683          	lw	a3,4(s4)
    835c:	00050913          	mv	s2,a0
    8360:	00058b93          	mv	s7,a1
    8364:	000c8513          	mv	a0,s9
    8368:	00098593          	mv	a1,s3
    836c:	0ec050ef          	jal	d458 <__muldf3>
    8370:	00058c93          	mv	s9,a1
    8374:	00050a13          	mv	s4,a0
    8378:	1cc060ef          	jal	e544 <__fixdfsi>
    837c:	00050993          	mv	s3,a0
    8380:	248060ef          	jal	e5c8 <__floatsidf>
    8384:	00050613          	mv	a2,a0
    8388:	00058693          	mv	a3,a1
    838c:	000a0513          	mv	a0,s4
    8390:	000c8593          	mv	a1,s9
    8394:	055050ef          	jal	dbe8 <__subdf3>
    8398:	03098793          	add	a5,s3,48
    839c:	00090613          	mv	a2,s2
    83a0:	000b8693          	mv	a3,s7
    83a4:	00fd0023          	sb	a5,0(s10)
    83a8:	001d0d13          	add	s10,s10,1
    83ac:	00050c93          	mv	s9,a0
    83b0:	00058993          	mv	s3,a1
    83b4:	79d040ef          	jal	d350 <__ledf2>
    83b8:	00055463          	bgez	a0,83c0 <_dtoa_r+0x688>
    83bc:	6f90006f          	j	92b4 <_dtoa_r+0x157c>
    83c0:	04012503          	lw	a0,64(sp)
    83c4:	04412583          	lw	a1,68(sp)
    83c8:	000c8613          	mv	a2,s9
    83cc:	00098693          	mv	a3,s3
    83d0:	019050ef          	jal	dbe8 <__subdf3>
    83d4:	00090613          	mv	a2,s2
    83d8:	000b8693          	mv	a3,s7
    83dc:	775040ef          	jal	d350 <__ledf2>
    83e0:	f40556e3          	bgez	a0,832c <_dtoa_r+0x5f4>
    83e4:	05c12783          	lw	a5,92(sp)
    83e8:	000d0b93          	mv	s7,s10
    83ec:	00178c13          	add	s8,a5,1
    83f0:	03900613          	li	a2,57
    83f4:	0080006f          	j	83fc <_dtoa_r+0x6c4>
    83f8:	697a88e3          	beq	s5,s7,9288 <_dtoa_r+0x1550>
    83fc:	fffbc683          	lbu	a3,-1(s7)
    8400:	000b8d13          	mv	s10,s7
    8404:	fffb8b93          	add	s7,s7,-1
    8408:	fec688e3          	beq	a3,a2,83f8 <_dtoa_r+0x6c0>
    840c:	00168693          	add	a3,a3,1
    8410:	0ff6f693          	zext.b	a3,a3
    8414:	00db8023          	sb	a3,0(s7)
    8418:	000c0a13          	mv	s4,s8
    841c:	4f00006f          	j	890c <_dtoa_r+0xbd4>
    8420:	00c12683          	lw	a3,12(sp)
    8424:	00002737          	lui	a4,0x2
    8428:	00c99793          	sll	a5,s3,0xc
    842c:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x94b>
    8430:	00c7d793          	srl	a5,a5,0xc
    8434:	00e6a023          	sw	a4,0(a3)
    8438:	01b7e7b3          	or	a5,a5,s11
    843c:	0a078063          	beqz	a5,84dc <_dtoa_r+0x7a4>
    8440:	00812783          	lw	a5,8(sp)
    8444:	00007a97          	auipc	s5,0x7
    8448:	bd0a8a93          	add	s5,s5,-1072 # f014 <__fini_array_end+0x2fc>
    844c:	9c078ee3          	beqz	a5,7e28 <_dtoa_r+0xf0>
    8450:	00007797          	auipc	a5,0x7
    8454:	bc778793          	add	a5,a5,-1081 # f017 <__fini_array_end+0x2ff>
    8458:	00812703          	lw	a4,8(sp)
    845c:	00f72023          	sw	a5,0(a4)
    8460:	9c9ff06f          	j	7e28 <_dtoa_r+0xf0>
    8464:	01c12783          	lw	a5,28(sp)
    8468:	3ff006b7          	lui	a3,0x3ff00
    846c:	06812a83          	lw	s5,104(sp)
    8470:	00c79793          	sll	a5,a5,0xc
    8474:	00c7d793          	srl	a5,a5,0xc
    8478:	01812703          	lw	a4,24(sp)
    847c:	00d7e7b3          	or	a5,a5,a3
    8480:	c0190913          	add	s2,s2,-1023
    8484:	02012c23          	sw	zero,56(sp)
    8488:	a51ff06f          	j	7ed8 <_dtoa_r+0x1a0>
    848c:	00100793          	li	a5,1
    8490:	415787b3          	sub	a5,a5,s5
    8494:	00f12823          	sw	a5,16(sp)
    8498:	00000b13          	li	s6,0
    849c:	b409c4e3          	bltz	s3,7fe4 <_dtoa_r+0x2ac>
    84a0:	03312023          	sw	s3,32(sp)
    84a4:	02012823          	sw	zero,48(sp)
    84a8:	00900793          	li	a5,9
    84ac:	013b0b33          	add	s6,s6,s3
    84b0:	b547fce3          	bgeu	a5,s4,8008 <_dtoa_r+0x2d0>
    84b4:	00100793          	li	a5,1
    84b8:	00100913          	li	s2,1
    84bc:	00000a13          	li	s4,0
    84c0:	02f12423          	sw	a5,40(sp)
    84c4:	fff00c13          	li	s8,-1
    84c8:	00012a23          	sw	zero,20(sp)
    84cc:	02042e23          	sw	zero,60(s0)
    84d0:	03812e23          	sw	s8,60(sp)
    84d4:	00000593          	li	a1,0
    84d8:	b99ff06f          	j	8070 <_dtoa_r+0x338>
    84dc:	00812703          	lw	a4,8(sp)
    84e0:	00007a97          	auipc	s5,0x7
    84e4:	b28a8a93          	add	s5,s5,-1240 # f008 <__fini_array_end+0x2f0>
    84e8:	00007797          	auipc	a5,0x7
    84ec:	b2878793          	add	a5,a5,-1240 # f010 <__fini_array_end+0x2f8>
    84f0:	f60714e3          	bnez	a4,8458 <_dtoa_r+0x720>
    84f4:	935ff06f          	j	7e28 <_dtoa_r+0xf0>
    84f8:	00090513          	mv	a0,s2
    84fc:	04f12623          	sw	a5,76(sp)
    8500:	04e12023          	sw	a4,64(sp)
    8504:	0c4060ef          	jal	e5c8 <__floatsidf>
    8508:	04012703          	lw	a4,64(sp)
    850c:	04c12783          	lw	a5,76(sp)
    8510:	00070613          	mv	a2,a4
    8514:	00078693          	mv	a3,a5
    8518:	04e12423          	sw	a4,72(sp)
    851c:	04f12023          	sw	a5,64(sp)
    8520:	739040ef          	jal	d458 <__muldf3>
    8524:	7fff8697          	auipc	a3,0x7fff8
    8528:	1d468693          	add	a3,a3,468 # 800006f8 <__global_locale+0x1c4>
    852c:	0006a603          	lw	a2,0(a3)
    8530:	0046a683          	lw	a3,4(a3)
    8534:	31d030ef          	jal	c050 <__adddf3>
    8538:	04012783          	lw	a5,64(sp)
    853c:	04812703          	lw	a4,72(sp)
    8540:	fcc006b7          	lui	a3,0xfcc00
    8544:	00050c93          	mv	s9,a0
    8548:	00b68bb3          	add	s7,a3,a1
    854c:	7fff8697          	auipc	a3,0x7fff8
    8550:	1b468693          	add	a3,a3,436 # 80000700 <__global_locale+0x1cc>
    8554:	0006a603          	lw	a2,0(a3)
    8558:	0046a683          	lw	a3,4(a3)
    855c:	00070513          	mv	a0,a4
    8560:	00078593          	mv	a1,a5
    8564:	684050ef          	jal	dbe8 <__subdf3>
    8568:	000c8613          	mv	a2,s9
    856c:	000b8693          	mv	a3,s7
    8570:	00050d13          	mv	s10,a0
    8574:	00058913          	mv	s2,a1
    8578:	4d9040ef          	jal	d250 <__gedf2>
    857c:	50a04ce3          	bgtz	a0,9294 <_dtoa_r+0x155c>
    8580:	800007b7          	lui	a5,0x80000
    8584:	0177c7b3          	xor	a5,a5,s7
    8588:	000c8613          	mv	a2,s9
    858c:	000d0513          	mv	a0,s10
    8590:	00078693          	mv	a3,a5
    8594:	00090593          	mv	a1,s2
    8598:	5b9040ef          	jal	d350 <__ledf2>
    859c:	06054c63          	bltz	a0,8614 <_dtoa_r+0x8dc>
    85a0:	06c12783          	lw	a5,108(sp)
    85a4:	1a07c663          	bltz	a5,8750 <_dtoa_r+0xa18>
    85a8:	02012683          	lw	a3,32(sp)
    85ac:	00e00713          	li	a4,14
    85b0:	1ad74063          	blt	a4,a3,8750 <_dtoa_r+0xa18>
    85b4:	02012783          	lw	a5,32(sp)
    85b8:	00379713          	sll	a4,a5,0x3
    85bc:	00007797          	auipc	a5,0x7
    85c0:	09c78793          	add	a5,a5,156 # f658 <__mprec_tens>
    85c4:	00e787b3          	add	a5,a5,a4
    85c8:	0007a903          	lw	s2,0(a5)
    85cc:	0047a983          	lw	s3,4(a5)
    85d0:	01412783          	lw	a5,20(sp)
    85d4:	0407dc63          	bgez	a5,862c <_dtoa_r+0x8f4>
    85d8:	05804a63          	bgtz	s8,862c <_dtoa_r+0x8f4>
    85dc:	020c1c63          	bnez	s8,8614 <_dtoa_r+0x8dc>
    85e0:	7fff8797          	auipc	a5,0x7fff8
    85e4:	12078793          	add	a5,a5,288 # 80000700 <__global_locale+0x1cc>
    85e8:	0007a603          	lw	a2,0(a5)
    85ec:	0047a683          	lw	a3,4(a5)
    85f0:	00090513          	mv	a0,s2
    85f4:	00098593          	mv	a1,s3
    85f8:	661040ef          	jal	d458 <__muldf3>
    85fc:	00050613          	mv	a2,a0
    8600:	00058693          	mv	a3,a1
    8604:	01812503          	lw	a0,24(sp)
    8608:	01c12583          	lw	a1,28(sp)
    860c:	545040ef          	jal	d350 <__ledf2>
    8610:	48a042e3          	bgtz	a0,9294 <_dtoa_r+0x155c>
    8614:	000a8d13          	mv	s10,s5
    8618:	00012c23          	sw	zero,24(sp)
    861c:	00000913          	li	s2,0
    8620:	01412783          	lw	a5,20(sp)
    8624:	fff7ca13          	not	s4,a5
    8628:	6980006f          	j	8cc0 <_dtoa_r+0xf88>
    862c:	001a8793          	add	a5,s5,1
    8630:	04f12023          	sw	a5,64(sp)
    8634:	01812b03          	lw	s6,24(sp)
    8638:	01c12a03          	lw	s4,28(sp)
    863c:	00090613          	mv	a2,s2
    8640:	00098693          	mv	a3,s3
    8644:	000b0513          	mv	a0,s6
    8648:	000a0593          	mv	a1,s4
    864c:	2cc040ef          	jal	c918 <__divdf3>
    8650:	6f5050ef          	jal	e544 <__fixdfsi>
    8654:	00050d13          	mv	s10,a0
    8658:	771050ef          	jal	e5c8 <__floatsidf>
    865c:	00090613          	mv	a2,s2
    8660:	00098693          	mv	a3,s3
    8664:	5f5040ef          	jal	d458 <__muldf3>
    8668:	00050613          	mv	a2,a0
    866c:	00058693          	mv	a3,a1
    8670:	000b0513          	mv	a0,s6
    8674:	000a0593          	mv	a1,s4
    8678:	570050ef          	jal	dbe8 <__subdf3>
    867c:	030d0793          	add	a5,s10,48
    8680:	00fa8023          	sb	a5,0(s5)
    8684:	00100613          	li	a2,1
    8688:	04012b83          	lw	s7,64(sp)
    868c:	00050713          	mv	a4,a0
    8690:	00058693          	mv	a3,a1
    8694:	0ccc0ee3          	beq	s8,a2,8f70 <_dtoa_r+0x1238>
    8698:	7fff8617          	auipc	a2,0x7fff8
    869c:	05860613          	add	a2,a2,88 # 800006f0 <__global_locale+0x1bc>
    86a0:	00062783          	lw	a5,0(a2)
    86a4:	00462803          	lw	a6,4(a2)
    86a8:	00100d93          	li	s11,1
    86ac:	00f12023          	sw	a5,0(sp)
    86b0:	01012223          	sw	a6,4(sp)
    86b4:	0600006f          	j	8714 <_dtoa_r+0x9dc>
    86b8:	00090613          	mv	a2,s2
    86bc:	00098693          	mv	a3,s3
    86c0:	000b0513          	mv	a0,s6
    86c4:	000a0593          	mv	a1,s4
    86c8:	250040ef          	jal	c918 <__divdf3>
    86cc:	679050ef          	jal	e544 <__fixdfsi>
    86d0:	00050d13          	mv	s10,a0
    86d4:	6f5050ef          	jal	e5c8 <__floatsidf>
    86d8:	00090613          	mv	a2,s2
    86dc:	00098693          	mv	a3,s3
    86e0:	579040ef          	jal	d458 <__muldf3>
    86e4:	00058693          	mv	a3,a1
    86e8:	00050613          	mv	a2,a0
    86ec:	000a0593          	mv	a1,s4
    86f0:	000b0513          	mv	a0,s6
    86f4:	4f4050ef          	jal	dbe8 <__subdf3>
    86f8:	001b8b93          	add	s7,s7,1
    86fc:	030d0793          	add	a5,s10,48
    8700:	001d8d93          	add	s11,s11,1
    8704:	fefb8fa3          	sb	a5,-1(s7)
    8708:	00050713          	mv	a4,a0
    870c:	00058693          	mv	a3,a1
    8710:	07bc00e3          	beq	s8,s11,8f70 <_dtoa_r+0x1238>
    8714:	00012603          	lw	a2,0(sp)
    8718:	00068593          	mv	a1,a3
    871c:	00412683          	lw	a3,4(sp)
    8720:	00070513          	mv	a0,a4
    8724:	535040ef          	jal	d458 <__muldf3>
    8728:	00000613          	li	a2,0
    872c:	00000693          	li	a3,0
    8730:	00050b13          	mv	s6,a0
    8734:	00058a13          	mv	s4,a1
    8738:	28d040ef          	jal	d1c4 <__eqdf2>
    873c:	f6051ee3          	bnez	a0,86b8 <_dtoa_r+0x980>
    8740:	02012783          	lw	a5,32(sp)
    8744:	000b8d13          	mv	s10,s7
    8748:	00178a13          	add	s4,a5,1
    874c:	1c00006f          	j	890c <_dtoa_r+0xbd4>
    8750:	02812703          	lw	a4,40(sp)
    8754:	26071463          	bnez	a4,89bc <_dtoa_r+0xc84>
    8758:	03012b83          	lw	s7,48(sp)
    875c:	01012c83          	lw	s9,16(sp)
    8760:	02012423          	sw	zero,40(sp)
    8764:	00000913          	li	s2,0
    8768:	020c8263          	beqz	s9,878c <_dtoa_r+0xa54>
    876c:	03605063          	blez	s6,878c <_dtoa_r+0xa54>
    8770:	000c8793          	mv	a5,s9
    8774:	679b4263          	blt	s6,s9,8dd8 <_dtoa_r+0x10a0>
    8778:	01012703          	lw	a4,16(sp)
    877c:	40fc8cb3          	sub	s9,s9,a5
    8780:	40fb0b33          	sub	s6,s6,a5
    8784:	40f70733          	sub	a4,a4,a5
    8788:	00e12823          	sw	a4,16(sp)
    878c:	03012783          	lw	a5,48(sp)
    8790:	02078263          	beqz	a5,87b4 <_dtoa_r+0xa7c>
    8794:	02812783          	lw	a5,40(sp)
    8798:	00078463          	beqz	a5,87a0 <_dtoa_r+0xa68>
    879c:	060b9ae3          	bnez	s7,9010 <_dtoa_r+0x12d8>
    87a0:	03012603          	lw	a2,48(sp)
    87a4:	00048593          	mv	a1,s1
    87a8:	00040513          	mv	a0,s0
    87ac:	3a4010ef          	jal	9b50 <__pow5mult>
    87b0:	00050493          	mv	s1,a0
    87b4:	00100593          	li	a1,1
    87b8:	00040513          	mv	a0,s0
    87bc:	01c010ef          	jal	97d8 <__i2b>
    87c0:	00a12c23          	sw	a0,24(sp)
    87c4:	50099a63          	bnez	s3,8cd8 <_dtoa_r+0xfa0>
    87c8:	00100793          	li	a5,1
    87cc:	5547da63          	bge	a5,s4,8d20 <_dtoa_r+0xfe8>
    87d0:	016787b3          	add	a5,a5,s6
    87d4:	01f7f793          	and	a5,a5,31
    87d8:	1c078e63          	beqz	a5,89b4 <_dtoa_r+0xc7c>
    87dc:	02000713          	li	a4,32
    87e0:	40f70733          	sub	a4,a4,a5
    87e4:	00400693          	li	a3,4
    87e8:	58e6d263          	bge	a3,a4,8d6c <_dtoa_r+0x1034>
    87ec:	01c00713          	li	a4,28
    87f0:	40f707b3          	sub	a5,a4,a5
    87f4:	01012703          	lw	a4,16(sp)
    87f8:	00fc8cb3          	add	s9,s9,a5
    87fc:	00fb0b33          	add	s6,s6,a5
    8800:	00f70733          	add	a4,a4,a5
    8804:	00e12823          	sw	a4,16(sp)
    8808:	01012783          	lw	a5,16(sp)
    880c:	12f04e63          	bgtz	a5,8948 <_dtoa_r+0xc10>
    8810:	01605c63          	blez	s6,8828 <_dtoa_r+0xaf0>
    8814:	01812583          	lw	a1,24(sp)
    8818:	000b0613          	mv	a2,s6
    881c:	00040513          	mv	a0,s0
    8820:	480010ef          	jal	9ca0 <__lshift>
    8824:	00a12c23          	sw	a0,24(sp)
    8828:	03412783          	lw	a5,52(sp)
    882c:	12079a63          	bnez	a5,8960 <_dtoa_r+0xc28>
    8830:	45805263          	blez	s8,8c74 <_dtoa_r+0xf3c>
    8834:	02812783          	lw	a5,40(sp)
    8838:	24079e63          	bnez	a5,8a94 <_dtoa_r+0xd5c>
    883c:	02012783          	lw	a5,32(sp)
    8840:	00178a13          	add	s4,a5,1
    8844:	01812b03          	lw	s6,24(sp)
    8848:	00100993          	li	s3,1
    884c:	0200006f          	j	886c <_dtoa_r+0xb34>
    8850:	00048593          	mv	a1,s1
    8854:	00000693          	li	a3,0
    8858:	00a00613          	li	a2,10
    885c:	00040513          	mv	a0,s0
    8860:	49d000ef          	jal	94fc <__multadd>
    8864:	00050493          	mv	s1,a0
    8868:	00198993          	add	s3,s3,1
    886c:	000b0593          	mv	a1,s6
    8870:	00048513          	mv	a0,s1
    8874:	a64ff0ef          	jal	7ad8 <quorem>
    8878:	03050b93          	add	s7,a0,48
    887c:	013a87b3          	add	a5,s5,s3
    8880:	ff778fa3          	sb	s7,-1(a5)
    8884:	fd89c6e3          	blt	s3,s8,8850 <_dtoa_r+0xb18>
    8888:	00100993          	li	s3,1
    888c:	55804263          	bgtz	s8,8dd0 <_dtoa_r+0x1098>
    8890:	013a89b3          	add	s3,s5,s3
    8894:	00000c13          	li	s8,0
    8898:	00048593          	mv	a1,s1
    889c:	00100613          	li	a2,1
    88a0:	00040513          	mv	a0,s0
    88a4:	3fc010ef          	jal	9ca0 <__lshift>
    88a8:	01812583          	lw	a1,24(sp)
    88ac:	00050493          	mv	s1,a0
    88b0:	580010ef          	jal	9e30 <__mcmp>
    88b4:	4ea05c63          	blez	a0,8dac <_dtoa_r+0x1074>
    88b8:	03900693          	li	a3,57
    88bc:	0080006f          	j	88c4 <_dtoa_r+0xb8c>
    88c0:	5f3a8863          	beq	s5,s3,8eb0 <_dtoa_r+0x1178>
    88c4:	fff9c783          	lbu	a5,-1(s3)
    88c8:	00098d13          	mv	s10,s3
    88cc:	fff98993          	add	s3,s3,-1
    88d0:	fed788e3          	beq	a5,a3,88c0 <_dtoa_r+0xb88>
    88d4:	00178793          	add	a5,a5,1
    88d8:	00f98023          	sb	a5,0(s3)
    88dc:	01812583          	lw	a1,24(sp)
    88e0:	00040513          	mv	a0,s0
    88e4:	3f5000ef          	jal	94d8 <_Bfree>
    88e8:	02090263          	beqz	s2,890c <_dtoa_r+0xbd4>
    88ec:	000c0a63          	beqz	s8,8900 <_dtoa_r+0xbc8>
    88f0:	012c0863          	beq	s8,s2,8900 <_dtoa_r+0xbc8>
    88f4:	000c0593          	mv	a1,s8
    88f8:	00040513          	mv	a0,s0
    88fc:	3dd000ef          	jal	94d8 <_Bfree>
    8900:	00090593          	mv	a1,s2
    8904:	00040513          	mv	a0,s0
    8908:	3d1000ef          	jal	94d8 <_Bfree>
    890c:	00048593          	mv	a1,s1
    8910:	00040513          	mv	a0,s0
    8914:	3c5000ef          	jal	94d8 <_Bfree>
    8918:	00c12783          	lw	a5,12(sp)
    891c:	000d0023          	sb	zero,0(s10)
    8920:	0147a023          	sw	s4,0(a5)
    8924:	00812783          	lw	a5,8(sp)
    8928:	00078463          	beqz	a5,8930 <_dtoa_r+0xbf8>
    892c:	01a7a023          	sw	s10,0(a5)
    8930:	09012b03          	lw	s6,144(sp)
    8934:	08c12b83          	lw	s7,140(sp)
    8938:	08812c03          	lw	s8,136(sp)
    893c:	08412c83          	lw	s9,132(sp)
    8940:	08012d03          	lw	s10,128(sp)
    8944:	ce4ff06f          	j	7e28 <_dtoa_r+0xf0>
    8948:	00048593          	mv	a1,s1
    894c:	00078613          	mv	a2,a5
    8950:	00040513          	mv	a0,s0
    8954:	34c010ef          	jal	9ca0 <__lshift>
    8958:	00050493          	mv	s1,a0
    895c:	eb5ff06f          	j	8810 <_dtoa_r+0xad8>
    8960:	01812583          	lw	a1,24(sp)
    8964:	00048513          	mv	a0,s1
    8968:	4c8010ef          	jal	9e30 <__mcmp>
    896c:	ec0552e3          	bgez	a0,8830 <_dtoa_r+0xaf8>
    8970:	02012783          	lw	a5,32(sp)
    8974:	00048593          	mv	a1,s1
    8978:	00000693          	li	a3,0
    897c:	00a00613          	li	a2,10
    8980:	00040513          	mv	a0,s0
    8984:	fff78b13          	add	s6,a5,-1
    8988:	375000ef          	jal	94fc <__multadd>
    898c:	02812783          	lw	a5,40(sp)
    8990:	00050493          	mv	s1,a0
    8994:	0c079e63          	bnez	a5,8a70 <_dtoa_r+0xd38>
    8998:	03c12c03          	lw	s8,60(sp)
    899c:	17805ee3          	blez	s8,9318 <_dtoa_r+0x15e0>
    89a0:	02012a03          	lw	s4,32(sp)
    89a4:	ea1ff06f          	j	8844 <_dtoa_r+0xb0c>
    89a8:	00100793          	li	a5,1
    89ac:	02f12a23          	sw	a5,52(sp)
    89b0:	e28ff06f          	j	7fd8 <_dtoa_r+0x2a0>
    89b4:	01c00793          	li	a5,28
    89b8:	e3dff06f          	j	87f4 <_dtoa_r+0xabc>
    89bc:	00100713          	li	a4,1
    89c0:	4d475463          	bge	a4,s4,8e88 <_dtoa_r+0x1150>
    89c4:	03012783          	lw	a5,48(sp)
    89c8:	fffc0b93          	add	s7,s8,-1
    89cc:	4177ca63          	blt	a5,s7,8de0 <_dtoa_r+0x10a8>
    89d0:	41778bb3          	sub	s7,a5,s7
    89d4:	01012783          	lw	a5,16(sp)
    89d8:	41878cb3          	sub	s9,a5,s8
    89dc:	100c54e3          	bgez	s8,92e4 <_dtoa_r+0x15ac>
    89e0:	00100593          	li	a1,1
    89e4:	00040513          	mv	a0,s0
    89e8:	5f1000ef          	jal	97d8 <__i2b>
    89ec:	00050913          	mv	s2,a0
    89f0:	d79ff06f          	j	8768 <_dtoa_r+0xa30>
    89f4:	02012a23          	sw	zero,52(sp)
    89f8:	00012823          	sw	zero,16(sp)
    89fc:	ab5042e3          	bgtz	s5,84a0 <_dtoa_r+0x768>
    8a00:	00100793          	li	a5,1
    8a04:	415787b3          	sub	a5,a5,s5
    8a08:	00f12823          	sw	a5,16(sp)
    8a0c:	00000b13          	li	s6,0
    8a10:	a91ff06f          	j	84a0 <_dtoa_r+0x768>
    8a14:	40e787b3          	sub	a5,a5,a4
    8a18:	00fd9533          	sll	a0,s11,a5
    8a1c:	ca0ff06f          	j	7ebc <_dtoa_r+0x184>
    8a20:	00300793          	li	a5,3
    8a24:	00100913          	li	s2,1
    8a28:	44fa0c63          	beq	s4,a5,8e80 <_dtoa_r+0x1148>
    8a2c:	df47cc63          	blt	a5,s4,8024 <_dtoa_r+0x2ec>
    8a30:	00200793          	li	a5,2
    8a34:	18fa00e3          	beq	s4,a5,93b4 <_dtoa_r+0x167c>
    8a38:	02042e23          	sw	zero,60(s0)
    8a3c:	00000593          	li	a1,0
    8a40:	00040513          	mv	a0,s0
    8a44:	1e1000ef          	jal	9424 <_Balloc>
    8a48:	00050a93          	mv	s5,a0
    8a4c:	140500e3          	beqz	a0,938c <_dtoa_r+0x1654>
    8a50:	00100793          	li	a5,1
    8a54:	02f12423          	sw	a5,40(sp)
    8a58:	fff00793          	li	a5,-1
    8a5c:	02a42c23          	sw	a0,56(s0)
    8a60:	02f12e23          	sw	a5,60(sp)
    8a64:	fff00c13          	li	s8,-1
    8a68:	00012a23          	sw	zero,20(sp)
    8a6c:	b35ff06f          	j	85a0 <_dtoa_r+0x868>
    8a70:	00090593          	mv	a1,s2
    8a74:	00000693          	li	a3,0
    8a78:	00a00613          	li	a2,10
    8a7c:	00040513          	mv	a0,s0
    8a80:	27d000ef          	jal	94fc <__multadd>
    8a84:	03c12c03          	lw	s8,60(sp)
    8a88:	00050913          	mv	s2,a0
    8a8c:	0b805ae3          	blez	s8,9340 <_dtoa_r+0x1608>
    8a90:	03612023          	sw	s6,32(sp)
    8a94:	01905c63          	blez	s9,8aac <_dtoa_r+0xd74>
    8a98:	00090593          	mv	a1,s2
    8a9c:	000c8613          	mv	a2,s9
    8aa0:	00040513          	mv	a0,s0
    8aa4:	1fc010ef          	jal	9ca0 <__lshift>
    8aa8:	00050913          	mv	s2,a0
    8aac:	00090b13          	mv	s6,s2
    8ab0:	50099e63          	bnez	s3,8fcc <_dtoa_r+0x1294>
    8ab4:	02412783          	lw	a5,36(sp)
    8ab8:	fffa8d13          	add	s10,s5,-1
    8abc:	000a8c93          	mv	s9,s5
    8ac0:	01512823          	sw	s5,16(sp)
    8ac4:	01812a83          	lw	s5,24(sp)
    8ac8:	0017f793          	and	a5,a5,1
    8acc:	018d0d33          	add	s10,s10,s8
    8ad0:	00f12023          	sw	a5,0(sp)
    8ad4:	01b12a23          	sw	s11,20(sp)
    8ad8:	000a8593          	mv	a1,s5
    8adc:	00048513          	mv	a0,s1
    8ae0:	ff9fe0ef          	jal	7ad8 <quorem>
    8ae4:	00050c13          	mv	s8,a0
    8ae8:	00090593          	mv	a1,s2
    8aec:	00048513          	mv	a0,s1
    8af0:	340010ef          	jal	9e30 <__mcmp>
    8af4:	00050993          	mv	s3,a0
    8af8:	000b0613          	mv	a2,s6
    8afc:	000a8593          	mv	a1,s5
    8b00:	00040513          	mv	a0,s0
    8b04:	384010ef          	jal	9e88 <__mdiff>
    8b08:	00c52703          	lw	a4,12(a0)
    8b0c:	030c0b93          	add	s7,s8,48
    8b10:	00050d93          	mv	s11,a0
    8b14:	08071c63          	bnez	a4,8bac <_dtoa_r+0xe74>
    8b18:	00050593          	mv	a1,a0
    8b1c:	00048513          	mv	a0,s1
    8b20:	310010ef          	jal	9e30 <__mcmp>
    8b24:	00050713          	mv	a4,a0
    8b28:	000d8593          	mv	a1,s11
    8b2c:	00040513          	mv	a0,s0
    8b30:	00070d93          	mv	s11,a4
    8b34:	1a5000ef          	jal	94d8 <_Bfree>
    8b38:	014de6b3          	or	a3,s11,s4
    8b3c:	0e069a63          	bnez	a3,8c30 <_dtoa_r+0xef8>
    8b40:	00012783          	lw	a5,0(sp)
    8b44:	76078e63          	beqz	a5,92c0 <_dtoa_r+0x1588>
    8b48:	7809c663          	bltz	s3,92d4 <_dtoa_r+0x159c>
    8b4c:	017c8023          	sb	s7,0(s9)
    8b50:	001c8993          	add	s3,s9,1
    8b54:	679d0e63          	beq	s10,s9,91d0 <_dtoa_r+0x1498>
    8b58:	00048593          	mv	a1,s1
    8b5c:	00000693          	li	a3,0
    8b60:	00a00613          	li	a2,10
    8b64:	00040513          	mv	a0,s0
    8b68:	195000ef          	jal	94fc <__multadd>
    8b6c:	00050493          	mv	s1,a0
    8b70:	00000693          	li	a3,0
    8b74:	00a00613          	li	a2,10
    8b78:	00090593          	mv	a1,s2
    8b7c:	00040513          	mv	a0,s0
    8b80:	09690e63          	beq	s2,s6,8c1c <_dtoa_r+0xee4>
    8b84:	179000ef          	jal	94fc <__multadd>
    8b88:	000b0593          	mv	a1,s6
    8b8c:	00050913          	mv	s2,a0
    8b90:	00000693          	li	a3,0
    8b94:	00a00613          	li	a2,10
    8b98:	00040513          	mv	a0,s0
    8b9c:	161000ef          	jal	94fc <__multadd>
    8ba0:	00050b13          	mv	s6,a0
    8ba4:	00098c93          	mv	s9,s3
    8ba8:	f31ff06f          	j	8ad8 <_dtoa_r+0xda0>
    8bac:	00050593          	mv	a1,a0
    8bb0:	00040513          	mv	a0,s0
    8bb4:	01012a83          	lw	s5,16(sp)
    8bb8:	01412d83          	lw	s11,20(sp)
    8bbc:	11d000ef          	jal	94d8 <_Bfree>
    8bc0:	0009ca63          	bltz	s3,8bd4 <_dtoa_r+0xe9c>
    8bc4:	001df713          	and	a4,s11,1
    8bc8:	0149e9b3          	or	s3,s3,s4
    8bcc:	01376733          	or	a4,a4,s3
    8bd0:	06071e63          	bnez	a4,8c4c <_dtoa_r+0xf14>
    8bd4:	00048593          	mv	a1,s1
    8bd8:	00100613          	li	a2,1
    8bdc:	00040513          	mv	a0,s0
    8be0:	0c0010ef          	jal	9ca0 <__lshift>
    8be4:	01812583          	lw	a1,24(sp)
    8be8:	00050493          	mv	s1,a0
    8bec:	244010ef          	jal	9e30 <__mcmp>
    8bf0:	24a05863          	blez	a0,8e40 <_dtoa_r+0x1108>
    8bf4:	03900713          	li	a4,57
    8bf8:	24eb8c63          	beq	s7,a4,8e50 <_dtoa_r+0x1118>
    8bfc:	031c0b93          	add	s7,s8,49
    8c00:	02012783          	lw	a5,32(sp)
    8c04:	00090c13          	mv	s8,s2
    8c08:	001c8d13          	add	s10,s9,1
    8c0c:	017c8023          	sb	s7,0(s9)
    8c10:	00178a13          	add	s4,a5,1
    8c14:	000b0913          	mv	s2,s6
    8c18:	cc5ff06f          	j	88dc <_dtoa_r+0xba4>
    8c1c:	0e1000ef          	jal	94fc <__multadd>
    8c20:	00050913          	mv	s2,a0
    8c24:	00050b13          	mv	s6,a0
    8c28:	00098c93          	mv	s9,s3
    8c2c:	eadff06f          	j	8ad8 <_dtoa_r+0xda0>
    8c30:	7409c863          	bltz	s3,9380 <_dtoa_r+0x1648>
    8c34:	00012783          	lw	a5,0(sp)
    8c38:	0149e9b3          	or	s3,s3,s4
    8c3c:	0137e9b3          	or	s3,a5,s3
    8c40:	74098063          	beqz	s3,9380 <_dtoa_r+0x1648>
    8c44:	f1b054e3          	blez	s11,8b4c <_dtoa_r+0xe14>
    8c48:	01012a83          	lw	s5,16(sp)
    8c4c:	03900713          	li	a4,57
    8c50:	20eb8063          	beq	s7,a4,8e50 <_dtoa_r+0x1118>
    8c54:	02012703          	lw	a4,32(sp)
    8c58:	001b8793          	add	a5,s7,1
    8c5c:	00090c13          	mv	s8,s2
    8c60:	001c8d13          	add	s10,s9,1
    8c64:	00170a13          	add	s4,a4,1
    8c68:	00fc8023          	sb	a5,0(s9)
    8c6c:	000b0913          	mv	s2,s6
    8c70:	c6dff06f          	j	88dc <_dtoa_r+0xba4>
    8c74:	00200793          	li	a5,2
    8c78:	bb47dee3          	bge	a5,s4,8834 <_dtoa_r+0xafc>
    8c7c:	000a8d13          	mv	s10,s5
    8c80:	9a0c10e3          	bnez	s8,8620 <_dtoa_r+0x8e8>
    8c84:	01812583          	lw	a1,24(sp)
    8c88:	00000693          	li	a3,0
    8c8c:	00500613          	li	a2,5
    8c90:	00040513          	mv	a0,s0
    8c94:	069000ef          	jal	94fc <__multadd>
    8c98:	00050593          	mv	a1,a0
    8c9c:	00a12c23          	sw	a0,24(sp)
    8ca0:	00048513          	mv	a0,s1
    8ca4:	18c010ef          	jal	9e30 <__mcmp>
    8ca8:	96a05ce3          	blez	a0,8620 <_dtoa_r+0x8e8>
    8cac:	03100793          	li	a5,49
    8cb0:	00fa8023          	sb	a5,0(s5)
    8cb4:	02012783          	lw	a5,32(sp)
    8cb8:	001a8d13          	add	s10,s5,1
    8cbc:	00178a13          	add	s4,a5,1
    8cc0:	01812583          	lw	a1,24(sp)
    8cc4:	00040513          	mv	a0,s0
    8cc8:	001a0a13          	add	s4,s4,1
    8ccc:	00d000ef          	jal	94d8 <_Bfree>
    8cd0:	c20918e3          	bnez	s2,8900 <_dtoa_r+0xbc8>
    8cd4:	c39ff06f          	j	890c <_dtoa_r+0xbd4>
    8cd8:	00050593          	mv	a1,a0
    8cdc:	00098613          	mv	a2,s3
    8ce0:	00040513          	mv	a0,s0
    8ce4:	66d000ef          	jal	9b50 <__pow5mult>
    8ce8:	00100793          	li	a5,1
    8cec:	00a12c23          	sw	a0,24(sp)
    8cf0:	1147de63          	bge	a5,s4,8e0c <_dtoa_r+0x10d4>
    8cf4:	00000993          	li	s3,0
    8cf8:	01812703          	lw	a4,24(sp)
    8cfc:	01072783          	lw	a5,16(a4)
    8d00:	00378793          	add	a5,a5,3
    8d04:	00279793          	sll	a5,a5,0x2
    8d08:	00f707b3          	add	a5,a4,a5
    8d0c:	0047a503          	lw	a0,4(a5)
    8d10:	171000ef          	jal	9680 <__hi0bits>
    8d14:	02000793          	li	a5,32
    8d18:	40a787b3          	sub	a5,a5,a0
    8d1c:	ab5ff06f          	j	87d0 <_dtoa_r+0xa98>
    8d20:	02412783          	lw	a5,36(sp)
    8d24:	04079063          	bnez	a5,8d64 <_dtoa_r+0x102c>
    8d28:	00012783          	lw	a5,0(sp)
    8d2c:	00c79793          	sll	a5,a5,0xc
    8d30:	02079a63          	bnez	a5,8d64 <_dtoa_r+0x102c>
    8d34:	00012683          	lw	a3,0(sp)
    8d38:	00000793          	li	a5,0
    8d3c:	0146d713          	srl	a4,a3,0x14
    8d40:	7ff77713          	and	a4,a4,2047
    8d44:	00070c63          	beqz	a4,8d5c <_dtoa_r+0x1024>
    8d48:	01012783          	lw	a5,16(sp)
    8d4c:	001b0b13          	add	s6,s6,1
    8d50:	00178793          	add	a5,a5,1
    8d54:	00f12823          	sw	a5,16(sp)
    8d58:	00100793          	li	a5,1
    8d5c:	58099063          	bnez	s3,92dc <_dtoa_r+0x15a4>
    8d60:	00078993          	mv	s3,a5
    8d64:	00100793          	li	a5,1
    8d68:	a69ff06f          	j	87d0 <_dtoa_r+0xa98>
    8d6c:	a8d70ee3          	beq	a4,a3,8808 <_dtoa_r+0xad0>
    8d70:	03c00713          	li	a4,60
    8d74:	40f707b3          	sub	a5,a4,a5
    8d78:	a7dff06f          	j	87f4 <_dtoa_r+0xabc>
    8d7c:	00100793          	li	a5,1
    8d80:	00500a13          	li	s4,5
    8d84:	02f12423          	sw	a5,40(sp)
    8d88:	01412783          	lw	a5,20(sp)
    8d8c:	02012703          	lw	a4,32(sp)
    8d90:	00e787b3          	add	a5,a5,a4
    8d94:	00178c13          	add	s8,a5,1
    8d98:	02f12e23          	sw	a5,60(sp)
    8d9c:	000c0613          	mv	a2,s8
    8da0:	ab804263          	bgtz	s8,8044 <_dtoa_r+0x30c>
    8da4:	00100613          	li	a2,1
    8da8:	a9cff06f          	j	8044 <_dtoa_r+0x30c>
    8dac:	00051663          	bnez	a0,8db8 <_dtoa_r+0x1080>
    8db0:	001bf793          	and	a5,s7,1
    8db4:	b00792e3          	bnez	a5,88b8 <_dtoa_r+0xb80>
    8db8:	03000693          	li	a3,48
    8dbc:	fff9c783          	lbu	a5,-1(s3)
    8dc0:	00098d13          	mv	s10,s3
    8dc4:	fff98993          	add	s3,s3,-1
    8dc8:	fed78ae3          	beq	a5,a3,8dbc <_dtoa_r+0x1084>
    8dcc:	b11ff06f          	j	88dc <_dtoa_r+0xba4>
    8dd0:	000c0993          	mv	s3,s8
    8dd4:	abdff06f          	j	8890 <_dtoa_r+0xb58>
    8dd8:	000b0793          	mv	a5,s6
    8ddc:	99dff06f          	j	8778 <_dtoa_r+0xa40>
    8de0:	03012783          	lw	a5,48(sp)
    8de4:	01012703          	lw	a4,16(sp)
    8de8:	03712823          	sw	s7,48(sp)
    8dec:	40fb87b3          	sub	a5,s7,a5
    8df0:	00f989b3          	add	s3,s3,a5
    8df4:	018707b3          	add	a5,a4,s8
    8df8:	00070c93          	mv	s9,a4
    8dfc:	018b0b33          	add	s6,s6,s8
    8e00:	00f12823          	sw	a5,16(sp)
    8e04:	00000b93          	li	s7,0
    8e08:	bd9ff06f          	j	89e0 <_dtoa_r+0xca8>
    8e0c:	02412783          	lw	a5,36(sp)
    8e10:	ee0792e3          	bnez	a5,8cf4 <_dtoa_r+0xfbc>
    8e14:	00012783          	lw	a5,0(sp)
    8e18:	00c79793          	sll	a5,a5,0xc
    8e1c:	ec079ce3          	bnez	a5,8cf4 <_dtoa_r+0xfbc>
    8e20:	f15ff06f          	j	8d34 <_dtoa_r+0xffc>
    8e24:	01812303          	lw	t1,24(sp)
    8e28:	01c12d03          	lw	s10,28(sp)
    8e2c:	00200913          	li	s2,2
    8e30:	ad0ff06f          	j	8100 <_dtoa_r+0x3c8>
    8e34:	00200a13          	li	s4,2
    8e38:	02012423          	sw	zero,40(sp)
    8e3c:	9f8ff06f          	j	8034 <_dtoa_r+0x2fc>
    8e40:	dc0510e3          	bnez	a0,8c00 <_dtoa_r+0xec8>
    8e44:	001bf713          	and	a4,s7,1
    8e48:	da0716e3          	bnez	a4,8bf4 <_dtoa_r+0xebc>
    8e4c:	db5ff06f          	j	8c00 <_dtoa_r+0xec8>
    8e50:	03900793          	li	a5,57
    8e54:	00fc8023          	sb	a5,0(s9)
    8e58:	02012783          	lw	a5,32(sp)
    8e5c:	00090c13          	mv	s8,s2
    8e60:	001c8993          	add	s3,s9,1
    8e64:	00178a13          	add	s4,a5,1
    8e68:	000b0913          	mv	s2,s6
    8e6c:	a4dff06f          	j	88b8 <_dtoa_r+0xb80>
    8e70:	00100793          	li	a5,1
    8e74:	00100c13          	li	s8,1
    8e78:	00f12a23          	sw	a5,20(sp)
    8e7c:	e50ff06f          	j	84cc <_dtoa_r+0x794>
    8e80:	02012423          	sw	zero,40(sp)
    8e84:	f05ff06f          	j	8d88 <_dtoa_r+0x1050>
    8e88:	03812703          	lw	a4,56(sp)
    8e8c:	30070e63          	beqz	a4,91a8 <_dtoa_r+0x1470>
    8e90:	01012703          	lw	a4,16(sp)
    8e94:	43378793          	add	a5,a5,1075
    8e98:	00fb0b33          	add	s6,s6,a5
    8e9c:	00f707b3          	add	a5,a4,a5
    8ea0:	03012b83          	lw	s7,48(sp)
    8ea4:	00070c93          	mv	s9,a4
    8ea8:	00f12823          	sw	a5,16(sp)
    8eac:	b35ff06f          	j	89e0 <_dtoa_r+0xca8>
    8eb0:	03100793          	li	a5,49
    8eb4:	00fa8023          	sb	a5,0(s5)
    8eb8:	001a0a13          	add	s4,s4,1
    8ebc:	a21ff06f          	j	88dc <_dtoa_r+0xba4>
    8ec0:	02012783          	lw	a5,32(sp)
    8ec4:	32078263          	beqz	a5,91e8 <_dtoa_r+0x14b0>
    8ec8:	40f00bb3          	neg	s7,a5
    8ecc:	00fbf713          	and	a4,s7,15
    8ed0:	00371713          	sll	a4,a4,0x3
    8ed4:	00006797          	auipc	a5,0x6
    8ed8:	78478793          	add	a5,a5,1924 # f658 <__mprec_tens>
    8edc:	00e787b3          	add	a5,a5,a4
    8ee0:	0007a603          	lw	a2,0(a5)
    8ee4:	0047a683          	lw	a3,4(a5)
    8ee8:	01812503          	lw	a0,24(sp)
    8eec:	01c12583          	lw	a1,28(sp)
    8ef0:	404bdb93          	sra	s7,s7,0x4
    8ef4:	564040ef          	jal	d458 <__muldf3>
    8ef8:	00058d13          	mv	s10,a1
    8efc:	440b8c63          	beqz	s7,9354 <_dtoa_r+0x161c>
    8f00:	00200913          	li	s2,2
    8f04:	04812023          	sw	s0,64(sp)
    8f08:	00006c97          	auipc	s9,0x6
    8f0c:	728c8c93          	add	s9,s9,1832 # f630 <__mprec_bigtens>
    8f10:	00090413          	mv	s0,s2
    8f14:	00050713          	mv	a4,a0
    8f18:	00000613          	li	a2,0
    8f1c:	00050913          	mv	s2,a0
    8f20:	001bf693          	and	a3,s7,1
    8f24:	02068063          	beqz	a3,8f44 <_dtoa_r+0x120c>
    8f28:	000ca603          	lw	a2,0(s9)
    8f2c:	004ca683          	lw	a3,4(s9)
    8f30:	00070513          	mv	a0,a4
    8f34:	00140413          	add	s0,s0,1
    8f38:	520040ef          	jal	d458 <__muldf3>
    8f3c:	00050713          	mv	a4,a0
    8f40:	00100613          	li	a2,1
    8f44:	401bdb93          	sra	s7,s7,0x1
    8f48:	008c8c93          	add	s9,s9,8
    8f4c:	fc0b9ae3          	bnez	s7,8f20 <_dtoa_r+0x11e8>
    8f50:	00090513          	mv	a0,s2
    8f54:	00058793          	mv	a5,a1
    8f58:	00040913          	mv	s2,s0
    8f5c:	04012403          	lw	s0,64(sp)
    8f60:	a0061a63          	bnez	a2,8174 <_dtoa_r+0x43c>
    8f64:	00050713          	mv	a4,a0
    8f68:	000d0793          	mv	a5,s10
    8f6c:	a08ff06f          	j	8174 <_dtoa_r+0x43c>
    8f70:	00068593          	mv	a1,a3
    8f74:	00070613          	mv	a2,a4
    8f78:	00070513          	mv	a0,a4
    8f7c:	0d4030ef          	jal	c050 <__adddf3>
    8f80:	02012783          	lw	a5,32(sp)
    8f84:	00090613          	mv	a2,s2
    8f88:	00098693          	mv	a3,s3
    8f8c:	00178a13          	add	s4,a5,1
    8f90:	00050c93          	mv	s9,a0
    8f94:	00058b13          	mv	s6,a1
    8f98:	000a0c13          	mv	s8,s4
    8f9c:	2b4040ef          	jal	d250 <__gedf2>
    8fa0:	c4a04863          	bgtz	a0,83f0 <_dtoa_r+0x6b8>
    8fa4:	000c8513          	mv	a0,s9
    8fa8:	000b0593          	mv	a1,s6
    8fac:	00090613          	mv	a2,s2
    8fb0:	00098693          	mv	a3,s3
    8fb4:	210040ef          	jal	d1c4 <__eqdf2>
    8fb8:	00051663          	bnez	a0,8fc4 <_dtoa_r+0x128c>
    8fbc:	001d7d13          	and	s10,s10,1
    8fc0:	c20d1863          	bnez	s10,83f0 <_dtoa_r+0x6b8>
    8fc4:	000b8d13          	mv	s10,s7
    8fc8:	945ff06f          	j	890c <_dtoa_r+0xbd4>
    8fcc:	00492583          	lw	a1,4(s2)
    8fd0:	00040513          	mv	a0,s0
    8fd4:	450000ef          	jal	9424 <_Balloc>
    8fd8:	00050993          	mv	s3,a0
    8fdc:	38050463          	beqz	a0,9364 <_dtoa_r+0x162c>
    8fe0:	01092603          	lw	a2,16(s2)
    8fe4:	00c90593          	add	a1,s2,12
    8fe8:	00c50513          	add	a0,a0,12
    8fec:	00260613          	add	a2,a2,2
    8ff0:	00261613          	sll	a2,a2,0x2
    8ff4:	f59f70ef          	jal	f4c <memcpy>
    8ff8:	00100613          	li	a2,1
    8ffc:	00098593          	mv	a1,s3
    9000:	00040513          	mv	a0,s0
    9004:	49d000ef          	jal	9ca0 <__lshift>
    9008:	00050b13          	mv	s6,a0
    900c:	aa9ff06f          	j	8ab4 <_dtoa_r+0xd7c>
    9010:	00090593          	mv	a1,s2
    9014:	000b8613          	mv	a2,s7
    9018:	00040513          	mv	a0,s0
    901c:	335000ef          	jal	9b50 <__pow5mult>
    9020:	00048613          	mv	a2,s1
    9024:	00050593          	mv	a1,a0
    9028:	00050913          	mv	s2,a0
    902c:	00040513          	mv	a0,s0
    9030:	059000ef          	jal	9888 <__multiply>
    9034:	00050793          	mv	a5,a0
    9038:	00048593          	mv	a1,s1
    903c:	00040513          	mv	a0,s0
    9040:	00078493          	mv	s1,a5
    9044:	494000ef          	jal	94d8 <_Bfree>
    9048:	03012783          	lw	a5,48(sp)
    904c:	417787b3          	sub	a5,a5,s7
    9050:	02f12823          	sw	a5,48(sp)
    9054:	f6078063          	beqz	a5,87b4 <_dtoa_r+0xa7c>
    9058:	f48ff06f          	j	87a0 <_dtoa_r+0xa68>
    905c:	05012603          	lw	a2,80(sp)
    9060:	05412683          	lw	a3,84(sp)
    9064:	05812503          	lw	a0,88(sp)
    9068:	04b12623          	sw	a1,76(sp)
    906c:	000b8593          	mv	a1,s7
    9070:	02612423          	sw	t1,40(sp)
    9074:	3e4040ef          	jal	d458 <__muldf3>
    9078:	02812303          	lw	t1,40(sp)
    907c:	04812783          	lw	a5,72(sp)
    9080:	00100693          	li	a3,1
    9084:	006a8023          	sb	t1,0(s5)
    9088:	02a12c23          	sw	a0,56(sp)
    908c:	04c12883          	lw	a7,76(sp)
    9090:	00058913          	mv	s2,a1
    9094:	00fa8bb3          	add	s7,s5,a5
    9098:	7fff7617          	auipc	a2,0x7fff7
    909c:	65860613          	add	a2,a2,1624 # 800006f0 <__global_locale+0x1bc>
    90a0:	28d78c63          	beq	a5,a3,9338 <_dtoa_r+0x1600>
    90a4:	00062783          	lw	a5,0(a2)
    90a8:	00462803          	lw	a6,4(a2)
    90ac:	04912423          	sw	s1,72(sp)
    90b0:	02f12423          	sw	a5,40(sp)
    90b4:	03012623          	sw	a6,44(sp)
    90b8:	04812623          	sw	s0,76(sp)
    90bc:	000c8513          	mv	a0,s9
    90c0:	00088593          	mv	a1,a7
    90c4:	02812603          	lw	a2,40(sp)
    90c8:	02c12683          	lw	a3,44(sp)
    90cc:	001d0d13          	add	s10,s10,1
    90d0:	388040ef          	jal	d458 <__muldf3>
    90d4:	00058413          	mv	s0,a1
    90d8:	00050493          	mv	s1,a0
    90dc:	468050ef          	jal	e544 <__fixdfsi>
    90e0:	00050c93          	mv	s9,a0
    90e4:	4e4050ef          	jal	e5c8 <__floatsidf>
    90e8:	00050613          	mv	a2,a0
    90ec:	00058693          	mv	a3,a1
    90f0:	00048513          	mv	a0,s1
    90f4:	00040593          	mv	a1,s0
    90f8:	030c8c93          	add	s9,s9,48
    90fc:	2ed040ef          	jal	dbe8 <__subdf3>
    9100:	ff9d0fa3          	sb	s9,-1(s10)
    9104:	fdab90e3          	bne	s7,s10,90c4 <_dtoa_r+0x138c>
    9108:	04812483          	lw	s1,72(sp)
    910c:	04c12403          	lw	s0,76(sp)
    9110:	00050c93          	mv	s9,a0
    9114:	00058893          	mv	a7,a1
    9118:	7fff7d17          	auipc	s10,0x7fff7
    911c:	5a0d0d13          	add	s10,s10,1440 # 800006b8 <__global_locale+0x184>
    9120:	000d2603          	lw	a2,0(s10)
    9124:	004d2683          	lw	a3,4(s10)
    9128:	03812503          	lw	a0,56(sp)
    912c:	00090593          	mv	a1,s2
    9130:	03112423          	sw	a7,40(sp)
    9134:	71d020ef          	jal	c050 <__adddf3>
    9138:	02812883          	lw	a7,40(sp)
    913c:	000c8613          	mv	a2,s9
    9140:	00088693          	mv	a3,a7
    9144:	20c040ef          	jal	d350 <__ledf2>
    9148:	1a054863          	bltz	a0,92f8 <_dtoa_r+0x15c0>
    914c:	03812603          	lw	a2,56(sp)
    9150:	000d2503          	lw	a0,0(s10)
    9154:	004d2583          	lw	a1,4(s10)
    9158:	00090693          	mv	a3,s2
    915c:	28d040ef          	jal	dbe8 <__subdf3>
    9160:	02812883          	lw	a7,40(sp)
    9164:	000c8613          	mv	a2,s9
    9168:	00088693          	mv	a3,a7
    916c:	0e4040ef          	jal	d250 <__gedf2>
    9170:	12a04863          	bgtz	a0,92a0 <_dtoa_r+0x1568>
    9174:	06c12783          	lw	a5,108(sp)
    9178:	de07c063          	bltz	a5,8758 <_dtoa_r+0xa20>
    917c:	02012703          	lw	a4,32(sp)
    9180:	00e00793          	li	a5,14
    9184:	dce7ca63          	blt	a5,a4,8758 <_dtoa_r+0xa20>
    9188:	02012783          	lw	a5,32(sp)
    918c:	00006717          	auipc	a4,0x6
    9190:	4cc70713          	add	a4,a4,1228 # f658 <__mprec_tens>
    9194:	00379793          	sll	a5,a5,0x3
    9198:	00f707b3          	add	a5,a4,a5
    919c:	0007a903          	lw	s2,0(a5)
    91a0:	0047a983          	lw	s3,4(a5)
    91a4:	c90ff06f          	j	8634 <_dtoa_r+0x8fc>
    91a8:	06812703          	lw	a4,104(sp)
    91ac:	01012683          	lw	a3,16(sp)
    91b0:	03600793          	li	a5,54
    91b4:	40e787b3          	sub	a5,a5,a4
    91b8:	00fb0b33          	add	s6,s6,a5
    91bc:	00f687b3          	add	a5,a3,a5
    91c0:	03012b83          	lw	s7,48(sp)
    91c4:	00068c93          	mv	s9,a3
    91c8:	00f12823          	sw	a5,16(sp)
    91cc:	815ff06f          	j	89e0 <_dtoa_r+0xca8>
    91d0:	02012783          	lw	a5,32(sp)
    91d4:	00090c13          	mv	s8,s2
    91d8:	01012a83          	lw	s5,16(sp)
    91dc:	00178a13          	add	s4,a5,1
    91e0:	000b0913          	mv	s2,s6
    91e4:	eb4ff06f          	j	8898 <_dtoa_r+0xb60>
    91e8:	01812703          	lw	a4,24(sp)
    91ec:	01c12783          	lw	a5,28(sp)
    91f0:	00200913          	li	s2,2
    91f4:	f81fe06f          	j	8174 <_dtoa_r+0x43c>
    91f8:	b00c0063          	beqz	s8,84f8 <_dtoa_r+0x7c0>
    91fc:	03c12d03          	lw	s10,60(sp)
    9200:	bba05063          	blez	s10,85a0 <_dtoa_r+0x868>
    9204:	7fff7617          	auipc	a2,0x7fff7
    9208:	4ec60613          	add	a2,a2,1260 # 800006f0 <__global_locale+0x1bc>
    920c:	00078593          	mv	a1,a5
    9210:	02012783          	lw	a5,32(sp)
    9214:	00462683          	lw	a3,4(a2)
    9218:	00062603          	lw	a2,0(a2)
    921c:	fff78793          	add	a5,a5,-1
    9220:	00070513          	mv	a0,a4
    9224:	04f12e23          	sw	a5,92(sp)
    9228:	230040ef          	jal	d458 <__muldf3>
    922c:	00050713          	mv	a4,a0
    9230:	00190513          	add	a0,s2,1
    9234:	04e12423          	sw	a4,72(sp)
    9238:	04b12023          	sw	a1,64(sp)
    923c:	38c050ef          	jal	e5c8 <__floatsidf>
    9240:	04812703          	lw	a4,72(sp)
    9244:	04012783          	lw	a5,64(sp)
    9248:	00070613          	mv	a2,a4
    924c:	00078693          	mv	a3,a5
    9250:	04e12623          	sw	a4,76(sp)
    9254:	204040ef          	jal	d458 <__muldf3>
    9258:	7fff7697          	auipc	a3,0x7fff7
    925c:	4a068693          	add	a3,a3,1184 # 800006f8 <__global_locale+0x1c4>
    9260:	0006a603          	lw	a2,0(a3)
    9264:	0046a683          	lw	a3,4(a3)
    9268:	5e9020ef          	jal	c050 <__adddf3>
    926c:	fcc006b7          	lui	a3,0xfcc00
    9270:	04012783          	lw	a5,64(sp)
    9274:	04c12703          	lw	a4,76(sp)
    9278:	00050c93          	mv	s9,a0
    927c:	00b68bb3          	add	s7,a3,a1
    9280:	05a12423          	sw	s10,72(sp)
    9284:	f91fe06f          	j	8214 <_dtoa_r+0x4dc>
    9288:	03100693          	li	a3,49
    928c:	001c0c13          	add	s8,s8,1
    9290:	984ff06f          	j	8414 <_dtoa_r+0x6dc>
    9294:	00012c23          	sw	zero,24(sp)
    9298:	00000913          	li	s2,0
    929c:	a11ff06f          	j	8cac <_dtoa_r+0xf74>
    92a0:	03000613          	li	a2,48
    92a4:	fffbc783          	lbu	a5,-1(s7)
    92a8:	000b8d13          	mv	s10,s7
    92ac:	fffb8b93          	add	s7,s7,-1
    92b0:	fec78ae3          	beq	a5,a2,92a4 <_dtoa_r+0x156c>
    92b4:	05c12783          	lw	a5,92(sp)
    92b8:	00178a13          	add	s4,a5,1
    92bc:	e50ff06f          	j	890c <_dtoa_r+0xbd4>
    92c0:	03900713          	li	a4,57
    92c4:	01012a83          	lw	s5,16(sp)
    92c8:	b8eb84e3          	beq	s7,a4,8e50 <_dtoa_r+0x1118>
    92cc:	933048e3          	bgtz	s3,8bfc <_dtoa_r+0xec4>
    92d0:	931ff06f          	j	8c00 <_dtoa_r+0xec8>
    92d4:	01012a83          	lw	s5,16(sp)
    92d8:	929ff06f          	j	8c00 <_dtoa_r+0xec8>
    92dc:	00078993          	mv	s3,a5
    92e0:	a19ff06f          	j	8cf8 <_dtoa_r+0xfc0>
    92e4:	00078c93          	mv	s9,a5
    92e8:	018787b3          	add	a5,a5,s8
    92ec:	018b0b33          	add	s6,s6,s8
    92f0:	00f12823          	sw	a5,16(sp)
    92f4:	eecff06f          	j	89e0 <_dtoa_r+0xca8>
    92f8:	05c12783          	lw	a5,92(sp)
    92fc:	00178c13          	add	s8,a5,1
    9300:	8f0ff06f          	j	83f0 <_dtoa_r+0x6b8>
    9304:	04c12983          	lw	s3,76(sp)
    9308:	05012b03          	lw	s6,80(sp)
    930c:	05812c03          	lw	s8,88(sp)
    9310:	04812a03          	lw	s4,72(sp)
    9314:	a8cff06f          	j	85a0 <_dtoa_r+0x868>
    9318:	00200793          	li	a5,2
    931c:	0147c863          	blt	a5,s4,932c <_dtoa_r+0x15f4>
    9320:	02012a03          	lw	s4,32(sp)
    9324:	03c12c03          	lw	s8,60(sp)
    9328:	d1cff06f          	j	8844 <_dtoa_r+0xb0c>
    932c:	03c12c03          	lw	s8,60(sp)
    9330:	03612023          	sw	s6,32(sp)
    9334:	949ff06f          	j	8c7c <_dtoa_r+0xf44>
    9338:	04012b83          	lw	s7,64(sp)
    933c:	dddff06f          	j	9118 <_dtoa_r+0x13e0>
    9340:	00200793          	li	a5,2
    9344:	ff47c4e3          	blt	a5,s4,932c <_dtoa_r+0x15f4>
    9348:	03c12c03          	lw	s8,60(sp)
    934c:	03612023          	sw	s6,32(sp)
    9350:	f44ff06f          	j	8a94 <_dtoa_r+0xd5c>
    9354:	00050713          	mv	a4,a0
    9358:	00058793          	mv	a5,a1
    935c:	00200913          	li	s2,2
    9360:	e15fe06f          	j	8174 <_dtoa_r+0x43c>
    9364:	00006697          	auipc	a3,0x6
    9368:	cb468693          	add	a3,a3,-844 # f018 <__fini_array_end+0x300>
    936c:	00000613          	li	a2,0
    9370:	2ef00593          	li	a1,751
    9374:	00006517          	auipc	a0,0x6
    9378:	cb850513          	add	a0,a0,-840 # f02c <__fini_array_end+0x314>
    937c:	25d010ef          	jal	add8 <__assert_func>
    9380:	01012a83          	lw	s5,16(sp)
    9384:	85b048e3          	bgtz	s11,8bd4 <_dtoa_r+0xe9c>
    9388:	879ff06f          	j	8c00 <_dtoa_r+0xec8>
    938c:	00006697          	auipc	a3,0x6
    9390:	c8c68693          	add	a3,a3,-884 # f018 <__fini_array_end+0x300>
    9394:	00000613          	li	a2,0
    9398:	1af00593          	li	a1,431
    939c:	00006517          	auipc	a0,0x6
    93a0:	c9050513          	add	a0,a0,-880 # f02c <__fini_array_end+0x314>
    93a4:	235010ef          	jal	add8 <__assert_func>
    93a8:	02042e23          	sw	zero,60(s0)
    93ac:	00000593          	li	a1,0
    93b0:	cc1fe06f          	j	8070 <_dtoa_r+0x338>
    93b4:	02012423          	sw	zero,40(sp)
    93b8:	c7dfe06f          	j	8034 <_dtoa_r+0x2fc>

000093bc <__ascii_mbtowc>:
    93bc:	02058063          	beqz	a1,93dc <__ascii_mbtowc+0x20>
    93c0:	04060263          	beqz	a2,9404 <__ascii_mbtowc+0x48>
    93c4:	04068863          	beqz	a3,9414 <__ascii_mbtowc+0x58>
    93c8:	00064783          	lbu	a5,0(a2)
    93cc:	00f5a023          	sw	a5,0(a1)
    93d0:	00064503          	lbu	a0,0(a2)
    93d4:	00a03533          	snez	a0,a0
    93d8:	00008067          	ret
    93dc:	ff010113          	add	sp,sp,-16
    93e0:	00c10593          	add	a1,sp,12
    93e4:	02060463          	beqz	a2,940c <__ascii_mbtowc+0x50>
    93e8:	02068a63          	beqz	a3,941c <__ascii_mbtowc+0x60>
    93ec:	00064783          	lbu	a5,0(a2)
    93f0:	00f5a023          	sw	a5,0(a1)
    93f4:	00064503          	lbu	a0,0(a2)
    93f8:	00a03533          	snez	a0,a0
    93fc:	01010113          	add	sp,sp,16
    9400:	00008067          	ret
    9404:	00000513          	li	a0,0
    9408:	00008067          	ret
    940c:	00000513          	li	a0,0
    9410:	fedff06f          	j	93fc <__ascii_mbtowc+0x40>
    9414:	ffe00513          	li	a0,-2
    9418:	00008067          	ret
    941c:	ffe00513          	li	a0,-2
    9420:	fddff06f          	j	93fc <__ascii_mbtowc+0x40>

00009424 <_Balloc>:
    9424:	04452783          	lw	a5,68(a0)
    9428:	ff010113          	add	sp,sp,-16
    942c:	00812423          	sw	s0,8(sp)
    9430:	00912223          	sw	s1,4(sp)
    9434:	00112623          	sw	ra,12(sp)
    9438:	00050413          	mv	s0,a0
    943c:	00058493          	mv	s1,a1
    9440:	02078c63          	beqz	a5,9478 <_Balloc+0x54>
    9444:	00249713          	sll	a4,s1,0x2
    9448:	00e787b3          	add	a5,a5,a4
    944c:	0007a503          	lw	a0,0(a5)
    9450:	04050463          	beqz	a0,9498 <_Balloc+0x74>
    9454:	00052703          	lw	a4,0(a0)
    9458:	00e7a023          	sw	a4,0(a5)
    945c:	00052823          	sw	zero,16(a0)
    9460:	00052623          	sw	zero,12(a0)
    9464:	00c12083          	lw	ra,12(sp)
    9468:	00812403          	lw	s0,8(sp)
    946c:	00412483          	lw	s1,4(sp)
    9470:	01010113          	add	sp,sp,16
    9474:	00008067          	ret
    9478:	02100613          	li	a2,33
    947c:	00400593          	li	a1,4
    9480:	1b1010ef          	jal	ae30 <_calloc_r>
    9484:	04a42223          	sw	a0,68(s0)
    9488:	00050793          	mv	a5,a0
    948c:	fa051ce3          	bnez	a0,9444 <_Balloc+0x20>
    9490:	00000513          	li	a0,0
    9494:	fd1ff06f          	j	9464 <_Balloc+0x40>
    9498:	01212023          	sw	s2,0(sp)
    949c:	00100913          	li	s2,1
    94a0:	00991933          	sll	s2,s2,s1
    94a4:	00590613          	add	a2,s2,5
    94a8:	00261613          	sll	a2,a2,0x2
    94ac:	00100593          	li	a1,1
    94b0:	00040513          	mv	a0,s0
    94b4:	17d010ef          	jal	ae30 <_calloc_r>
    94b8:	00050a63          	beqz	a0,94cc <_Balloc+0xa8>
    94bc:	01252423          	sw	s2,8(a0)
    94c0:	00952223          	sw	s1,4(a0)
    94c4:	00012903          	lw	s2,0(sp)
    94c8:	f95ff06f          	j	945c <_Balloc+0x38>
    94cc:	00012903          	lw	s2,0(sp)
    94d0:	00000513          	li	a0,0
    94d4:	f91ff06f          	j	9464 <_Balloc+0x40>

000094d8 <_Bfree>:
    94d8:	02058063          	beqz	a1,94f8 <_Bfree+0x20>
    94dc:	0045a703          	lw	a4,4(a1)
    94e0:	04452783          	lw	a5,68(a0)
    94e4:	00271713          	sll	a4,a4,0x2
    94e8:	00e787b3          	add	a5,a5,a4
    94ec:	0007a703          	lw	a4,0(a5)
    94f0:	00e5a023          	sw	a4,0(a1)
    94f4:	00b7a023          	sw	a1,0(a5)
    94f8:	00008067          	ret

000094fc <__multadd>:
    94fc:	fd010113          	add	sp,sp,-48
    9500:	01412c23          	sw	s4,24(sp)
    9504:	0105aa03          	lw	s4,16(a1)
    9508:	01912223          	sw	s9,4(sp)
    950c:	00010cb7          	lui	s9,0x10
    9510:	02912223          	sw	s1,36(sp)
    9514:	03212023          	sw	s2,32(sp)
    9518:	01312e23          	sw	s3,28(sp)
    951c:	01512a23          	sw	s5,20(sp)
    9520:	01612823          	sw	s6,16(sp)
    9524:	01712623          	sw	s7,12(sp)
    9528:	02112623          	sw	ra,44(sp)
    952c:	02812423          	sw	s0,40(sp)
    9530:	01812423          	sw	s8,8(sp)
    9534:	00058a93          	mv	s5,a1
    9538:	00050b13          	mv	s6,a0
    953c:	00060993          	mv	s3,a2
    9540:	00068493          	mv	s1,a3
    9544:	01458913          	add	s2,a1,20
    9548:	00000b93          	li	s7,0
    954c:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    9550:	00092c03          	lw	s8,0(s2)
    9554:	00098593          	mv	a1,s3
    9558:	00490913          	add	s2,s2,4
    955c:	019c7533          	and	a0,s8,s9
    9560:	5c0050ef          	jal	eb20 <__mulsi3>
    9564:	00050413          	mv	s0,a0
    9568:	00098593          	mv	a1,s3
    956c:	010c5513          	srl	a0,s8,0x10
    9570:	00940433          	add	s0,s0,s1
    9574:	5ac050ef          	jal	eb20 <__mulsi3>
    9578:	01045793          	srl	a5,s0,0x10
    957c:	00f50533          	add	a0,a0,a5
    9580:	01051793          	sll	a5,a0,0x10
    9584:	01947433          	and	s0,s0,s9
    9588:	008787b3          	add	a5,a5,s0
    958c:	fef92e23          	sw	a5,-4(s2)
    9590:	001b8b93          	add	s7,s7,1
    9594:	01055493          	srl	s1,a0,0x10
    9598:	fb4bcce3          	blt	s7,s4,9550 <__multadd+0x54>
    959c:	02048263          	beqz	s1,95c0 <__multadd+0xc4>
    95a0:	008aa783          	lw	a5,8(s5)
    95a4:	04fa5a63          	bge	s4,a5,95f8 <__multadd+0xfc>
    95a8:	004a0793          	add	a5,s4,4
    95ac:	00279793          	sll	a5,a5,0x2
    95b0:	00fa87b3          	add	a5,s5,a5
    95b4:	0097a223          	sw	s1,4(a5)
    95b8:	001a0a13          	add	s4,s4,1
    95bc:	014aa823          	sw	s4,16(s5)
    95c0:	02c12083          	lw	ra,44(sp)
    95c4:	02812403          	lw	s0,40(sp)
    95c8:	02412483          	lw	s1,36(sp)
    95cc:	02012903          	lw	s2,32(sp)
    95d0:	01c12983          	lw	s3,28(sp)
    95d4:	01812a03          	lw	s4,24(sp)
    95d8:	01012b03          	lw	s6,16(sp)
    95dc:	00c12b83          	lw	s7,12(sp)
    95e0:	00812c03          	lw	s8,8(sp)
    95e4:	00412c83          	lw	s9,4(sp)
    95e8:	000a8513          	mv	a0,s5
    95ec:	01412a83          	lw	s5,20(sp)
    95f0:	03010113          	add	sp,sp,48
    95f4:	00008067          	ret
    95f8:	004aa583          	lw	a1,4(s5)
    95fc:	000b0513          	mv	a0,s6
    9600:	00158593          	add	a1,a1,1
    9604:	e21ff0ef          	jal	9424 <_Balloc>
    9608:	00050413          	mv	s0,a0
    960c:	04050c63          	beqz	a0,9664 <__multadd+0x168>
    9610:	010aa603          	lw	a2,16(s5)
    9614:	00ca8593          	add	a1,s5,12
    9618:	00c50513          	add	a0,a0,12
    961c:	00260613          	add	a2,a2,2
    9620:	00261613          	sll	a2,a2,0x2
    9624:	929f70ef          	jal	f4c <memcpy>
    9628:	004aa703          	lw	a4,4(s5)
    962c:	044b2783          	lw	a5,68(s6)
    9630:	00271713          	sll	a4,a4,0x2
    9634:	00e787b3          	add	a5,a5,a4
    9638:	0007a703          	lw	a4,0(a5)
    963c:	00eaa023          	sw	a4,0(s5)
    9640:	0157a023          	sw	s5,0(a5)
    9644:	004a0793          	add	a5,s4,4
    9648:	00040a93          	mv	s5,s0
    964c:	00279793          	sll	a5,a5,0x2
    9650:	00fa87b3          	add	a5,s5,a5
    9654:	0097a223          	sw	s1,4(a5)
    9658:	001a0a13          	add	s4,s4,1
    965c:	014aa823          	sw	s4,16(s5)
    9660:	f61ff06f          	j	95c0 <__multadd+0xc4>
    9664:	00006697          	auipc	a3,0x6
    9668:	9b468693          	add	a3,a3,-1612 # f018 <__fini_array_end+0x300>
    966c:	00000613          	li	a2,0
    9670:	0ba00593          	li	a1,186
    9674:	00006517          	auipc	a0,0x6
    9678:	a3850513          	add	a0,a0,-1480 # f0ac <__fini_array_end+0x394>
    967c:	75c010ef          	jal	add8 <__assert_func>

00009680 <__hi0bits>:
    9680:	00050793          	mv	a5,a0
    9684:	00010737          	lui	a4,0x10
    9688:	00000513          	li	a0,0
    968c:	00e7f663          	bgeu	a5,a4,9698 <__hi0bits+0x18>
    9690:	01079793          	sll	a5,a5,0x10
    9694:	01000513          	li	a0,16
    9698:	01000737          	lui	a4,0x1000
    969c:	00e7f663          	bgeu	a5,a4,96a8 <__hi0bits+0x28>
    96a0:	00850513          	add	a0,a0,8
    96a4:	00879793          	sll	a5,a5,0x8
    96a8:	10000737          	lui	a4,0x10000
    96ac:	00e7f663          	bgeu	a5,a4,96b8 <__hi0bits+0x38>
    96b0:	00450513          	add	a0,a0,4
    96b4:	00479793          	sll	a5,a5,0x4
    96b8:	40000737          	lui	a4,0x40000
    96bc:	00e7ea63          	bltu	a5,a4,96d0 <__hi0bits+0x50>
    96c0:	fff7c793          	not	a5,a5
    96c4:	01f7d793          	srl	a5,a5,0x1f
    96c8:	00f50533          	add	a0,a0,a5
    96cc:	00008067          	ret
    96d0:	00279793          	sll	a5,a5,0x2
    96d4:	0007ca63          	bltz	a5,96e8 <__hi0bits+0x68>
    96d8:	00179713          	sll	a4,a5,0x1
    96dc:	00074a63          	bltz	a4,96f0 <__hi0bits+0x70>
    96e0:	02000513          	li	a0,32
    96e4:	00008067          	ret
    96e8:	00250513          	add	a0,a0,2
    96ec:	00008067          	ret
    96f0:	00350513          	add	a0,a0,3
    96f4:	00008067          	ret

000096f8 <__lo0bits>:
    96f8:	00052783          	lw	a5,0(a0)
    96fc:	00050713          	mv	a4,a0
    9700:	0077f693          	and	a3,a5,7
    9704:	02068463          	beqz	a3,972c <__lo0bits+0x34>
    9708:	0017f693          	and	a3,a5,1
    970c:	00000513          	li	a0,0
    9710:	04069e63          	bnez	a3,976c <__lo0bits+0x74>
    9714:	0027f693          	and	a3,a5,2
    9718:	0a068863          	beqz	a3,97c8 <__lo0bits+0xd0>
    971c:	0017d793          	srl	a5,a5,0x1
    9720:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9724:	00100513          	li	a0,1
    9728:	00008067          	ret
    972c:	01079693          	sll	a3,a5,0x10
    9730:	0106d693          	srl	a3,a3,0x10
    9734:	00000513          	li	a0,0
    9738:	06068e63          	beqz	a3,97b4 <__lo0bits+0xbc>
    973c:	0ff7f693          	zext.b	a3,a5
    9740:	06068063          	beqz	a3,97a0 <__lo0bits+0xa8>
    9744:	00f7f693          	and	a3,a5,15
    9748:	04068263          	beqz	a3,978c <__lo0bits+0x94>
    974c:	0037f693          	and	a3,a5,3
    9750:	02068463          	beqz	a3,9778 <__lo0bits+0x80>
    9754:	0017f693          	and	a3,a5,1
    9758:	00069c63          	bnez	a3,9770 <__lo0bits+0x78>
    975c:	0017d793          	srl	a5,a5,0x1
    9760:	00150513          	add	a0,a0,1
    9764:	00079663          	bnez	a5,9770 <__lo0bits+0x78>
    9768:	02000513          	li	a0,32
    976c:	00008067          	ret
    9770:	00f72023          	sw	a5,0(a4)
    9774:	00008067          	ret
    9778:	0027d793          	srl	a5,a5,0x2
    977c:	0017f693          	and	a3,a5,1
    9780:	00250513          	add	a0,a0,2
    9784:	fe0696e3          	bnez	a3,9770 <__lo0bits+0x78>
    9788:	fd5ff06f          	j	975c <__lo0bits+0x64>
    978c:	0047d793          	srl	a5,a5,0x4
    9790:	0037f693          	and	a3,a5,3
    9794:	00450513          	add	a0,a0,4
    9798:	fa069ee3          	bnez	a3,9754 <__lo0bits+0x5c>
    979c:	fddff06f          	j	9778 <__lo0bits+0x80>
    97a0:	0087d793          	srl	a5,a5,0x8
    97a4:	00f7f693          	and	a3,a5,15
    97a8:	00850513          	add	a0,a0,8
    97ac:	fa0690e3          	bnez	a3,974c <__lo0bits+0x54>
    97b0:	fddff06f          	j	978c <__lo0bits+0x94>
    97b4:	0107d793          	srl	a5,a5,0x10
    97b8:	0ff7f693          	zext.b	a3,a5
    97bc:	01000513          	li	a0,16
    97c0:	f80692e3          	bnez	a3,9744 <__lo0bits+0x4c>
    97c4:	fddff06f          	j	97a0 <__lo0bits+0xa8>
    97c8:	0027d793          	srl	a5,a5,0x2
    97cc:	00f72023          	sw	a5,0(a4)
    97d0:	00200513          	li	a0,2
    97d4:	00008067          	ret

000097d8 <__i2b>:
    97d8:	04452783          	lw	a5,68(a0)
    97dc:	ff010113          	add	sp,sp,-16
    97e0:	00812423          	sw	s0,8(sp)
    97e4:	00912223          	sw	s1,4(sp)
    97e8:	00112623          	sw	ra,12(sp)
    97ec:	00050413          	mv	s0,a0
    97f0:	00058493          	mv	s1,a1
    97f4:	02078c63          	beqz	a5,982c <__i2b+0x54>
    97f8:	0047a503          	lw	a0,4(a5)
    97fc:	06050263          	beqz	a0,9860 <__i2b+0x88>
    9800:	00052703          	lw	a4,0(a0)
    9804:	00e7a223          	sw	a4,4(a5)
    9808:	00c12083          	lw	ra,12(sp)
    980c:	00812403          	lw	s0,8(sp)
    9810:	00100793          	li	a5,1
    9814:	00952a23          	sw	s1,20(a0)
    9818:	00052623          	sw	zero,12(a0)
    981c:	00f52823          	sw	a5,16(a0)
    9820:	00412483          	lw	s1,4(sp)
    9824:	01010113          	add	sp,sp,16
    9828:	00008067          	ret
    982c:	02100613          	li	a2,33
    9830:	00400593          	li	a1,4
    9834:	5fc010ef          	jal	ae30 <_calloc_r>
    9838:	04a42223          	sw	a0,68(s0)
    983c:	00050793          	mv	a5,a0
    9840:	fa051ce3          	bnez	a0,97f8 <__i2b+0x20>
    9844:	00005697          	auipc	a3,0x5
    9848:	7d468693          	add	a3,a3,2004 # f018 <__fini_array_end+0x300>
    984c:	00000613          	li	a2,0
    9850:	14500593          	li	a1,325
    9854:	00006517          	auipc	a0,0x6
    9858:	85850513          	add	a0,a0,-1960 # f0ac <__fini_array_end+0x394>
    985c:	57c010ef          	jal	add8 <__assert_func>
    9860:	01c00613          	li	a2,28
    9864:	00100593          	li	a1,1
    9868:	00040513          	mv	a0,s0
    986c:	5c4010ef          	jal	ae30 <_calloc_r>
    9870:	fc050ae3          	beqz	a0,9844 <__i2b+0x6c>
    9874:	00100793          	li	a5,1
    9878:	00f52223          	sw	a5,4(a0)
    987c:	00200793          	li	a5,2
    9880:	00f52423          	sw	a5,8(a0)
    9884:	f85ff06f          	j	9808 <__i2b+0x30>

00009888 <__multiply>:
    9888:	fb010113          	add	sp,sp,-80
    988c:	03312e23          	sw	s3,60(sp)
    9890:	03812423          	sw	s8,40(sp)
    9894:	01062983          	lw	s3,16(a2)
    9898:	0105ac03          	lw	s8,16(a1)
    989c:	04812423          	sw	s0,72(sp)
    98a0:	03412c23          	sw	s4,56(sp)
    98a4:	04112623          	sw	ra,76(sp)
    98a8:	03712623          	sw	s7,44(sp)
    98ac:	00058a13          	mv	s4,a1
    98b0:	00060413          	mv	s0,a2
    98b4:	013c4c63          	blt	s8,s3,98cc <__multiply+0x44>
    98b8:	00098713          	mv	a4,s3
    98bc:	00058413          	mv	s0,a1
    98c0:	000c0993          	mv	s3,s8
    98c4:	00060a13          	mv	s4,a2
    98c8:	00070c13          	mv	s8,a4
    98cc:	00842783          	lw	a5,8(s0)
    98d0:	00442583          	lw	a1,4(s0)
    98d4:	01898bb3          	add	s7,s3,s8
    98d8:	0177a7b3          	slt	a5,a5,s7
    98dc:	00f585b3          	add	a1,a1,a5
    98e0:	b45ff0ef          	jal	9424 <_Balloc>
    98e4:	00a12623          	sw	a0,12(sp)
    98e8:	22050863          	beqz	a0,9b18 <__multiply+0x290>
    98ec:	00c12783          	lw	a5,12(sp)
    98f0:	03512a23          	sw	s5,52(sp)
    98f4:	03612823          	sw	s6,48(sp)
    98f8:	002b9a93          	sll	s5,s7,0x2
    98fc:	01478b13          	add	s6,a5,20
    9900:	015b0ab3          	add	s5,s6,s5
    9904:	000b0793          	mv	a5,s6
    9908:	015b7863          	bgeu	s6,s5,9918 <__multiply+0x90>
    990c:	0007a023          	sw	zero,0(a5)
    9910:	00478793          	add	a5,a5,4
    9914:	ff57ece3          	bltu	a5,s5,990c <__multiply+0x84>
    9918:	014a0a13          	add	s4,s4,20
    991c:	002c1c13          	sll	s8,s8,0x2
    9920:	01440793          	add	a5,s0,20
    9924:	018a0733          	add	a4,s4,s8
    9928:	00299993          	sll	s3,s3,0x2
    992c:	00f12423          	sw	a5,8(sp)
    9930:	00e12023          	sw	a4,0(sp)
    9934:	013789b3          	add	s3,a5,s3
    9938:	16ea7c63          	bgeu	s4,a4,9ab0 <__multiply+0x228>
    993c:	00400713          	li	a4,4
    9940:	04912223          	sw	s1,68(sp)
    9944:	05212023          	sw	s2,64(sp)
    9948:	03912223          	sw	s9,36(sp)
    994c:	03a12023          	sw	s10,32(sp)
    9950:	01b12e23          	sw	s11,28(sp)
    9954:	01540793          	add	a5,s0,21
    9958:	00e12223          	sw	a4,4(sp)
    995c:	1af9f263          	bgeu	s3,a5,9b00 <__multiply+0x278>
    9960:	00010437          	lui	s0,0x10
    9964:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    9968:	01c0006f          	j	9984 <__multiply+0xfc>
    996c:	01095913          	srl	s2,s2,0x10
    9970:	0a091063          	bnez	s2,9a10 <__multiply+0x188>
    9974:	00012783          	lw	a5,0(sp)
    9978:	004a0a13          	add	s4,s4,4
    997c:	004b0b13          	add	s6,s6,4
    9980:	10fa7e63          	bgeu	s4,a5,9a9c <__multiply+0x214>
    9984:	000a2903          	lw	s2,0(s4)
    9988:	008974b3          	and	s1,s2,s0
    998c:	fe0480e3          	beqz	s1,996c <__multiply+0xe4>
    9990:	00812c83          	lw	s9,8(sp)
    9994:	000b0d13          	mv	s10,s6
    9998:	00000c13          	li	s8,0
    999c:	000cad83          	lw	s11,0(s9)
    99a0:	000d2903          	lw	s2,0(s10)
    99a4:	00048593          	mv	a1,s1
    99a8:	008df533          	and	a0,s11,s0
    99ac:	174050ef          	jal	eb20 <__mulsi3>
    99b0:	00897733          	and	a4,s2,s0
    99b4:	00e50733          	add	a4,a0,a4
    99b8:	00048593          	mv	a1,s1
    99bc:	010dd513          	srl	a0,s11,0x10
    99c0:	01870c33          	add	s8,a4,s8
    99c4:	01095913          	srl	s2,s2,0x10
    99c8:	158050ef          	jal	eb20 <__mulsi3>
    99cc:	010c5713          	srl	a4,s8,0x10
    99d0:	01250533          	add	a0,a0,s2
    99d4:	00e50533          	add	a0,a0,a4
    99d8:	008c77b3          	and	a5,s8,s0
    99dc:	01051713          	sll	a4,a0,0x10
    99e0:	004d0d13          	add	s10,s10,4
    99e4:	00f767b3          	or	a5,a4,a5
    99e8:	004c8c93          	add	s9,s9,4
    99ec:	fefd2e23          	sw	a5,-4(s10)
    99f0:	01055c13          	srl	s8,a0,0x10
    99f4:	fb3ce4e3          	bltu	s9,s3,999c <__multiply+0x114>
    99f8:	00412783          	lw	a5,4(sp)
    99fc:	00fb0733          	add	a4,s6,a5
    9a00:	01872023          	sw	s8,0(a4)
    9a04:	000a2903          	lw	s2,0(s4)
    9a08:	01095913          	srl	s2,s2,0x10
    9a0c:	f60904e3          	beqz	s2,9974 <__multiply+0xec>
    9a10:	000b2c83          	lw	s9,0(s6)
    9a14:	00812d03          	lw	s10,8(sp)
    9a18:	000b0c13          	mv	s8,s6
    9a1c:	000c8493          	mv	s1,s9
    9a20:	00000d93          	li	s11,0
    9a24:	000d2503          	lw	a0,0(s10)
    9a28:	00090593          	mv	a1,s2
    9a2c:	0104d493          	srl	s1,s1,0x10
    9a30:	00857533          	and	a0,a0,s0
    9a34:	0ec050ef          	jal	eb20 <__mulsi3>
    9a38:	01b50733          	add	a4,a0,s11
    9a3c:	00970db3          	add	s11,a4,s1
    9a40:	010d9593          	sll	a1,s11,0x10
    9a44:	008cf7b3          	and	a5,s9,s0
    9a48:	00f5e7b3          	or	a5,a1,a5
    9a4c:	00fc2023          	sw	a5,0(s8)
    9a50:	002d5503          	lhu	a0,2(s10)
    9a54:	004c2483          	lw	s1,4(s8)
    9a58:	00090593          	mv	a1,s2
    9a5c:	0c4050ef          	jal	eb20 <__mulsi3>
    9a60:	0084f7b3          	and	a5,s1,s0
    9a64:	010dd713          	srl	a4,s11,0x10
    9a68:	00f507b3          	add	a5,a0,a5
    9a6c:	004d0d13          	add	s10,s10,4
    9a70:	00e78cb3          	add	s9,a5,a4
    9a74:	004c0c13          	add	s8,s8,4
    9a78:	010cdd93          	srl	s11,s9,0x10
    9a7c:	fb3d64e3          	bltu	s10,s3,9a24 <__multiply+0x19c>
    9a80:	00412783          	lw	a5,4(sp)
    9a84:	004a0a13          	add	s4,s4,4
    9a88:	00fb0733          	add	a4,s6,a5
    9a8c:	00012783          	lw	a5,0(sp)
    9a90:	01972023          	sw	s9,0(a4)
    9a94:	004b0b13          	add	s6,s6,4
    9a98:	eefa66e3          	bltu	s4,a5,9984 <__multiply+0xfc>
    9a9c:	04412483          	lw	s1,68(sp)
    9aa0:	04012903          	lw	s2,64(sp)
    9aa4:	02412c83          	lw	s9,36(sp)
    9aa8:	02012d03          	lw	s10,32(sp)
    9aac:	01c12d83          	lw	s11,28(sp)
    9ab0:	01704863          	bgtz	s7,9ac0 <__multiply+0x238>
    9ab4:	0180006f          	j	9acc <__multiply+0x244>
    9ab8:	fffb8b93          	add	s7,s7,-1
    9abc:	000b8863          	beqz	s7,9acc <__multiply+0x244>
    9ac0:	ffcaa783          	lw	a5,-4(s5)
    9ac4:	ffca8a93          	add	s5,s5,-4
    9ac8:	fe0788e3          	beqz	a5,9ab8 <__multiply+0x230>
    9acc:	00c12783          	lw	a5,12(sp)
    9ad0:	04c12083          	lw	ra,76(sp)
    9ad4:	04812403          	lw	s0,72(sp)
    9ad8:	0177a823          	sw	s7,16(a5)
    9adc:	03412a83          	lw	s5,52(sp)
    9ae0:	03012b03          	lw	s6,48(sp)
    9ae4:	03c12983          	lw	s3,60(sp)
    9ae8:	03812a03          	lw	s4,56(sp)
    9aec:	02c12b83          	lw	s7,44(sp)
    9af0:	02812c03          	lw	s8,40(sp)
    9af4:	00078513          	mv	a0,a5
    9af8:	05010113          	add	sp,sp,80
    9afc:	00008067          	ret
    9b00:	408987b3          	sub	a5,s3,s0
    9b04:	feb78793          	add	a5,a5,-21
    9b08:	ffc7f793          	and	a5,a5,-4
    9b0c:	00478793          	add	a5,a5,4
    9b10:	00f12223          	sw	a5,4(sp)
    9b14:	e4dff06f          	j	9960 <__multiply+0xd8>
    9b18:	00005697          	auipc	a3,0x5
    9b1c:	50068693          	add	a3,a3,1280 # f018 <__fini_array_end+0x300>
    9b20:	00000613          	li	a2,0
    9b24:	16200593          	li	a1,354
    9b28:	00005517          	auipc	a0,0x5
    9b2c:	58450513          	add	a0,a0,1412 # f0ac <__fini_array_end+0x394>
    9b30:	04912223          	sw	s1,68(sp)
    9b34:	05212023          	sw	s2,64(sp)
    9b38:	03512a23          	sw	s5,52(sp)
    9b3c:	03612823          	sw	s6,48(sp)
    9b40:	03912223          	sw	s9,36(sp)
    9b44:	03a12023          	sw	s10,32(sp)
    9b48:	01b12e23          	sw	s11,28(sp)
    9b4c:	28c010ef          	jal	add8 <__assert_func>

00009b50 <__pow5mult>:
    9b50:	fe010113          	add	sp,sp,-32
    9b54:	00812c23          	sw	s0,24(sp)
    9b58:	01212823          	sw	s2,16(sp)
    9b5c:	01312623          	sw	s3,12(sp)
    9b60:	00112e23          	sw	ra,28(sp)
    9b64:	00367793          	and	a5,a2,3
    9b68:	00060413          	mv	s0,a2
    9b6c:	00050993          	mv	s3,a0
    9b70:	00058913          	mv	s2,a1
    9b74:	0a079c63          	bnez	a5,9c2c <__pow5mult+0xdc>
    9b78:	40245413          	sra	s0,s0,0x2
    9b7c:	06040a63          	beqz	s0,9bf0 <__pow5mult+0xa0>
    9b80:	00912a23          	sw	s1,20(sp)
    9b84:	0409a483          	lw	s1,64(s3)
    9b88:	0c048663          	beqz	s1,9c54 <__pow5mult+0x104>
    9b8c:	00147793          	and	a5,s0,1
    9b90:	02079063          	bnez	a5,9bb0 <__pow5mult+0x60>
    9b94:	40145413          	sra	s0,s0,0x1
    9b98:	04040a63          	beqz	s0,9bec <__pow5mult+0x9c>
    9b9c:	0004a503          	lw	a0,0(s1)
    9ba0:	06050663          	beqz	a0,9c0c <__pow5mult+0xbc>
    9ba4:	00050493          	mv	s1,a0
    9ba8:	00147793          	and	a5,s0,1
    9bac:	fe0784e3          	beqz	a5,9b94 <__pow5mult+0x44>
    9bb0:	00048613          	mv	a2,s1
    9bb4:	00090593          	mv	a1,s2
    9bb8:	00098513          	mv	a0,s3
    9bbc:	ccdff0ef          	jal	9888 <__multiply>
    9bc0:	02090063          	beqz	s2,9be0 <__pow5mult+0x90>
    9bc4:	00492703          	lw	a4,4(s2)
    9bc8:	0449a783          	lw	a5,68(s3)
    9bcc:	00271713          	sll	a4,a4,0x2
    9bd0:	00e787b3          	add	a5,a5,a4
    9bd4:	0007a703          	lw	a4,0(a5)
    9bd8:	00e92023          	sw	a4,0(s2)
    9bdc:	0127a023          	sw	s2,0(a5)
    9be0:	40145413          	sra	s0,s0,0x1
    9be4:	00050913          	mv	s2,a0
    9be8:	fa041ae3          	bnez	s0,9b9c <__pow5mult+0x4c>
    9bec:	01412483          	lw	s1,20(sp)
    9bf0:	01c12083          	lw	ra,28(sp)
    9bf4:	01812403          	lw	s0,24(sp)
    9bf8:	00c12983          	lw	s3,12(sp)
    9bfc:	00090513          	mv	a0,s2
    9c00:	01012903          	lw	s2,16(sp)
    9c04:	02010113          	add	sp,sp,32
    9c08:	00008067          	ret
    9c0c:	00048613          	mv	a2,s1
    9c10:	00048593          	mv	a1,s1
    9c14:	00098513          	mv	a0,s3
    9c18:	c71ff0ef          	jal	9888 <__multiply>
    9c1c:	00a4a023          	sw	a0,0(s1)
    9c20:	00052023          	sw	zero,0(a0)
    9c24:	00050493          	mv	s1,a0
    9c28:	f81ff06f          	j	9ba8 <__pow5mult+0x58>
    9c2c:	fff78793          	add	a5,a5,-1
    9c30:	00006717          	auipc	a4,0x6
    9c34:	9f070713          	add	a4,a4,-1552 # f620 <p05.0>
    9c38:	00279793          	sll	a5,a5,0x2
    9c3c:	00f707b3          	add	a5,a4,a5
    9c40:	0007a603          	lw	a2,0(a5)
    9c44:	00000693          	li	a3,0
    9c48:	8b5ff0ef          	jal	94fc <__multadd>
    9c4c:	00050913          	mv	s2,a0
    9c50:	f29ff06f          	j	9b78 <__pow5mult+0x28>
    9c54:	00100593          	li	a1,1
    9c58:	00098513          	mv	a0,s3
    9c5c:	fc8ff0ef          	jal	9424 <_Balloc>
    9c60:	00050493          	mv	s1,a0
    9c64:	02050063          	beqz	a0,9c84 <__pow5mult+0x134>
    9c68:	27100793          	li	a5,625
    9c6c:	00f52a23          	sw	a5,20(a0)
    9c70:	00100793          	li	a5,1
    9c74:	00f52823          	sw	a5,16(a0)
    9c78:	04a9a023          	sw	a0,64(s3)
    9c7c:	00052023          	sw	zero,0(a0)
    9c80:	f0dff06f          	j	9b8c <__pow5mult+0x3c>
    9c84:	00005697          	auipc	a3,0x5
    9c88:	39468693          	add	a3,a3,916 # f018 <__fini_array_end+0x300>
    9c8c:	00000613          	li	a2,0
    9c90:	14500593          	li	a1,325
    9c94:	00005517          	auipc	a0,0x5
    9c98:	41850513          	add	a0,a0,1048 # f0ac <__fini_array_end+0x394>
    9c9c:	13c010ef          	jal	add8 <__assert_func>

00009ca0 <__lshift>:
    9ca0:	fe010113          	add	sp,sp,-32
    9ca4:	01512223          	sw	s5,4(sp)
    9ca8:	0105aa83          	lw	s5,16(a1)
    9cac:	0085a783          	lw	a5,8(a1)
    9cb0:	01312623          	sw	s3,12(sp)
    9cb4:	40565993          	sra	s3,a2,0x5
    9cb8:	01598ab3          	add	s5,s3,s5
    9cbc:	00812c23          	sw	s0,24(sp)
    9cc0:	00912a23          	sw	s1,20(sp)
    9cc4:	01212823          	sw	s2,16(sp)
    9cc8:	01412423          	sw	s4,8(sp)
    9ccc:	00112e23          	sw	ra,28(sp)
    9cd0:	001a8913          	add	s2,s5,1
    9cd4:	00058493          	mv	s1,a1
    9cd8:	00060413          	mv	s0,a2
    9cdc:	0045a583          	lw	a1,4(a1)
    9ce0:	00050a13          	mv	s4,a0
    9ce4:	0127d863          	bge	a5,s2,9cf4 <__lshift+0x54>
    9ce8:	00179793          	sll	a5,a5,0x1
    9cec:	00158593          	add	a1,a1,1
    9cf0:	ff27cce3          	blt	a5,s2,9ce8 <__lshift+0x48>
    9cf4:	000a0513          	mv	a0,s4
    9cf8:	f2cff0ef          	jal	9424 <_Balloc>
    9cfc:	10050c63          	beqz	a0,9e14 <__lshift+0x174>
    9d00:	01450813          	add	a6,a0,20
    9d04:	03305463          	blez	s3,9d2c <__lshift+0x8c>
    9d08:	00598993          	add	s3,s3,5
    9d0c:	00299993          	sll	s3,s3,0x2
    9d10:	01350733          	add	a4,a0,s3
    9d14:	00080793          	mv	a5,a6
    9d18:	00478793          	add	a5,a5,4
    9d1c:	fe07ae23          	sw	zero,-4(a5)
    9d20:	fee79ce3          	bne	a5,a4,9d18 <__lshift+0x78>
    9d24:	fec98993          	add	s3,s3,-20
    9d28:	01380833          	add	a6,a6,s3
    9d2c:	0104a883          	lw	a7,16(s1)
    9d30:	01448793          	add	a5,s1,20
    9d34:	01f47613          	and	a2,s0,31
    9d38:	00289893          	sll	a7,a7,0x2
    9d3c:	011788b3          	add	a7,a5,a7
    9d40:	0a060463          	beqz	a2,9de8 <__lshift+0x148>
    9d44:	02000593          	li	a1,32
    9d48:	40c585b3          	sub	a1,a1,a2
    9d4c:	00080313          	mv	t1,a6
    9d50:	00000693          	li	a3,0
    9d54:	0007a703          	lw	a4,0(a5)
    9d58:	00430313          	add	t1,t1,4
    9d5c:	00478793          	add	a5,a5,4
    9d60:	00c71733          	sll	a4,a4,a2
    9d64:	00d76733          	or	a4,a4,a3
    9d68:	fee32e23          	sw	a4,-4(t1)
    9d6c:	ffc7a683          	lw	a3,-4(a5)
    9d70:	00b6d6b3          	srl	a3,a3,a1
    9d74:	ff17e0e3          	bltu	a5,a7,9d54 <__lshift+0xb4>
    9d78:	01548793          	add	a5,s1,21
    9d7c:	00400713          	li	a4,4
    9d80:	00f8ea63          	bltu	a7,a5,9d94 <__lshift+0xf4>
    9d84:	409887b3          	sub	a5,a7,s1
    9d88:	feb78793          	add	a5,a5,-21
    9d8c:	ffc7f793          	and	a5,a5,-4
    9d90:	00478713          	add	a4,a5,4
    9d94:	00e80833          	add	a6,a6,a4
    9d98:	00d82023          	sw	a3,0(a6)
    9d9c:	00069463          	bnez	a3,9da4 <__lshift+0x104>
    9da0:	000a8913          	mv	s2,s5
    9da4:	0044a703          	lw	a4,4(s1)
    9da8:	044a2783          	lw	a5,68(s4)
    9dac:	01c12083          	lw	ra,28(sp)
    9db0:	00271713          	sll	a4,a4,0x2
    9db4:	00e787b3          	add	a5,a5,a4
    9db8:	0007a703          	lw	a4,0(a5)
    9dbc:	01252823          	sw	s2,16(a0)
    9dc0:	01812403          	lw	s0,24(sp)
    9dc4:	00e4a023          	sw	a4,0(s1)
    9dc8:	0097a023          	sw	s1,0(a5)
    9dcc:	01012903          	lw	s2,16(sp)
    9dd0:	01412483          	lw	s1,20(sp)
    9dd4:	00c12983          	lw	s3,12(sp)
    9dd8:	00812a03          	lw	s4,8(sp)
    9ddc:	00412a83          	lw	s5,4(sp)
    9de0:	02010113          	add	sp,sp,32
    9de4:	00008067          	ret
    9de8:	0007a703          	lw	a4,0(a5)
    9dec:	00478793          	add	a5,a5,4
    9df0:	00480813          	add	a6,a6,4
    9df4:	fee82e23          	sw	a4,-4(a6)
    9df8:	fb17f4e3          	bgeu	a5,a7,9da0 <__lshift+0x100>
    9dfc:	0007a703          	lw	a4,0(a5)
    9e00:	00478793          	add	a5,a5,4
    9e04:	00480813          	add	a6,a6,4
    9e08:	fee82e23          	sw	a4,-4(a6)
    9e0c:	fd17eee3          	bltu	a5,a7,9de8 <__lshift+0x148>
    9e10:	f91ff06f          	j	9da0 <__lshift+0x100>
    9e14:	00005697          	auipc	a3,0x5
    9e18:	20468693          	add	a3,a3,516 # f018 <__fini_array_end+0x300>
    9e1c:	00000613          	li	a2,0
    9e20:	1de00593          	li	a1,478
    9e24:	00005517          	auipc	a0,0x5
    9e28:	28850513          	add	a0,a0,648 # f0ac <__fini_array_end+0x394>
    9e2c:	7ad000ef          	jal	add8 <__assert_func>

00009e30 <__mcmp>:
    9e30:	01052703          	lw	a4,16(a0)
    9e34:	0105a783          	lw	a5,16(a1)
    9e38:	00050813          	mv	a6,a0
    9e3c:	40f70533          	sub	a0,a4,a5
    9e40:	04f71263          	bne	a4,a5,9e84 <__mcmp+0x54>
    9e44:	00279793          	sll	a5,a5,0x2
    9e48:	01480813          	add	a6,a6,20
    9e4c:	01458593          	add	a1,a1,20
    9e50:	00f80733          	add	a4,a6,a5
    9e54:	00f587b3          	add	a5,a1,a5
    9e58:	0080006f          	j	9e60 <__mcmp+0x30>
    9e5c:	02e87463          	bgeu	a6,a4,9e84 <__mcmp+0x54>
    9e60:	ffc72603          	lw	a2,-4(a4)
    9e64:	ffc7a683          	lw	a3,-4(a5)
    9e68:	ffc70713          	add	a4,a4,-4
    9e6c:	ffc78793          	add	a5,a5,-4
    9e70:	fed606e3          	beq	a2,a3,9e5c <__mcmp+0x2c>
    9e74:	00100513          	li	a0,1
    9e78:	00d67663          	bgeu	a2,a3,9e84 <__mcmp+0x54>
    9e7c:	fff00513          	li	a0,-1
    9e80:	00008067          	ret
    9e84:	00008067          	ret

00009e88 <__mdiff>:
    9e88:	0105a703          	lw	a4,16(a1)
    9e8c:	01062783          	lw	a5,16(a2)
    9e90:	ff010113          	add	sp,sp,-16
    9e94:	00812423          	sw	s0,8(sp)
    9e98:	00912223          	sw	s1,4(sp)
    9e9c:	00112623          	sw	ra,12(sp)
    9ea0:	01212023          	sw	s2,0(sp)
    9ea4:	00058413          	mv	s0,a1
    9ea8:	00060493          	mv	s1,a2
    9eac:	40f706b3          	sub	a3,a4,a5
    9eb0:	18f71e63          	bne	a4,a5,a04c <__mdiff+0x1c4>
    9eb4:	00279693          	sll	a3,a5,0x2
    9eb8:	01458613          	add	a2,a1,20
    9ebc:	01448713          	add	a4,s1,20
    9ec0:	00d607b3          	add	a5,a2,a3
    9ec4:	00d70733          	add	a4,a4,a3
    9ec8:	0080006f          	j	9ed0 <__mdiff+0x48>
    9ecc:	18f67c63          	bgeu	a2,a5,a064 <__mdiff+0x1dc>
    9ed0:	ffc7a583          	lw	a1,-4(a5)
    9ed4:	ffc72683          	lw	a3,-4(a4)
    9ed8:	ffc78793          	add	a5,a5,-4
    9edc:	ffc70713          	add	a4,a4,-4
    9ee0:	fed586e3          	beq	a1,a3,9ecc <__mdiff+0x44>
    9ee4:	00100913          	li	s2,1
    9ee8:	00d5ea63          	bltu	a1,a3,9efc <__mdiff+0x74>
    9eec:	00048793          	mv	a5,s1
    9ef0:	00000913          	li	s2,0
    9ef4:	00040493          	mv	s1,s0
    9ef8:	00078413          	mv	s0,a5
    9efc:	0044a583          	lw	a1,4(s1)
    9f00:	d24ff0ef          	jal	9424 <_Balloc>
    9f04:	1a050663          	beqz	a0,a0b0 <__mdiff+0x228>
    9f08:	0104a883          	lw	a7,16(s1)
    9f0c:	01042283          	lw	t0,16(s0)
    9f10:	01448f93          	add	t6,s1,20
    9f14:	00289313          	sll	t1,a7,0x2
    9f18:	01440813          	add	a6,s0,20
    9f1c:	00229293          	sll	t0,t0,0x2
    9f20:	01450593          	add	a1,a0,20
    9f24:	00010e37          	lui	t3,0x10
    9f28:	01252623          	sw	s2,12(a0)
    9f2c:	006f8333          	add	t1,t6,t1
    9f30:	005802b3          	add	t0,a6,t0
    9f34:	00058f13          	mv	t5,a1
    9f38:	000f8e93          	mv	t4,t6
    9f3c:	00000693          	li	a3,0
    9f40:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    9f44:	000ea703          	lw	a4,0(t4)
    9f48:	00082603          	lw	a2,0(a6)
    9f4c:	004f0f13          	add	t5,t5,4
    9f50:	01c777b3          	and	a5,a4,t3
    9f54:	01c673b3          	and	t2,a2,t3
    9f58:	407787b3          	sub	a5,a5,t2
    9f5c:	00d787b3          	add	a5,a5,a3
    9f60:	01075713          	srl	a4,a4,0x10
    9f64:	01065613          	srl	a2,a2,0x10
    9f68:	4107d693          	sra	a3,a5,0x10
    9f6c:	40c70733          	sub	a4,a4,a2
    9f70:	00d70733          	add	a4,a4,a3
    9f74:	01071693          	sll	a3,a4,0x10
    9f78:	01c7f7b3          	and	a5,a5,t3
    9f7c:	00d7e7b3          	or	a5,a5,a3
    9f80:	00480813          	add	a6,a6,4
    9f84:	feff2e23          	sw	a5,-4(t5)
    9f88:	004e8e93          	add	t4,t4,4
    9f8c:	41075693          	sra	a3,a4,0x10
    9f90:	fa586ae3          	bltu	a6,t0,9f44 <__mdiff+0xbc>
    9f94:	01540713          	add	a4,s0,21
    9f98:	40828433          	sub	s0,t0,s0
    9f9c:	feb40413          	add	s0,s0,-21
    9fa0:	00e2b2b3          	sltu	t0,t0,a4
    9fa4:	0012cf13          	xor	t5,t0,1
    9fa8:	00245413          	srl	s0,s0,0x2
    9fac:	00400713          	li	a4,4
    9fb0:	0a028463          	beqz	t0,a058 <__mdiff+0x1d0>
    9fb4:	00ef8fb3          	add	t6,t6,a4
    9fb8:	00e58833          	add	a6,a1,a4
    9fbc:	00010eb7          	lui	t4,0x10
    9fc0:	00080e13          	mv	t3,a6
    9fc4:	000f8613          	mv	a2,t6
    9fc8:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    9fcc:	0c6ff463          	bgeu	t6,t1,a094 <__mdiff+0x20c>
    9fd0:	00062783          	lw	a5,0(a2)
    9fd4:	004e0e13          	add	t3,t3,4
    9fd8:	00460613          	add	a2,a2,4
    9fdc:	01d7f733          	and	a4,a5,t4
    9fe0:	00d70733          	add	a4,a4,a3
    9fe4:	0107d593          	srl	a1,a5,0x10
    9fe8:	41075713          	sra	a4,a4,0x10
    9fec:	00b70733          	add	a4,a4,a1
    9ff0:	00d787b3          	add	a5,a5,a3
    9ff4:	01d7f7b3          	and	a5,a5,t4
    9ff8:	01071693          	sll	a3,a4,0x10
    9ffc:	00d7e7b3          	or	a5,a5,a3
    a000:	fefe2e23          	sw	a5,-4(t3)
    a004:	41075693          	sra	a3,a4,0x10
    a008:	fc6664e3          	bltu	a2,t1,9fd0 <__mdiff+0x148>
    a00c:	fff30313          	add	t1,t1,-1
    a010:	41f30333          	sub	t1,t1,t6
    a014:	ffc37313          	and	t1,t1,-4
    a018:	00680733          	add	a4,a6,t1
    a01c:	00079a63          	bnez	a5,a030 <__mdiff+0x1a8>
    a020:	ffc72783          	lw	a5,-4(a4)
    a024:	fff88893          	add	a7,a7,-1
    a028:	ffc70713          	add	a4,a4,-4
    a02c:	fe078ae3          	beqz	a5,a020 <__mdiff+0x198>
    a030:	00c12083          	lw	ra,12(sp)
    a034:	00812403          	lw	s0,8(sp)
    a038:	01152823          	sw	a7,16(a0)
    a03c:	00412483          	lw	s1,4(sp)
    a040:	00012903          	lw	s2,0(sp)
    a044:	01010113          	add	sp,sp,16
    a048:	00008067          	ret
    a04c:	00100913          	li	s2,1
    a050:	e806dee3          	bgez	a3,9eec <__mdiff+0x64>
    a054:	ea9ff06f          	j	9efc <__mdiff+0x74>
    a058:	00140713          	add	a4,s0,1
    a05c:	00271713          	sll	a4,a4,0x2
    a060:	f55ff06f          	j	9fb4 <__mdiff+0x12c>
    a064:	00000593          	li	a1,0
    a068:	bbcff0ef          	jal	9424 <_Balloc>
    a06c:	06050063          	beqz	a0,a0cc <__mdiff+0x244>
    a070:	00c12083          	lw	ra,12(sp)
    a074:	00812403          	lw	s0,8(sp)
    a078:	00100793          	li	a5,1
    a07c:	00f52823          	sw	a5,16(a0)
    a080:	00052a23          	sw	zero,20(a0)
    a084:	00412483          	lw	s1,4(sp)
    a088:	00012903          	lw	s2,0(sp)
    a08c:	01010113          	add	sp,sp,16
    a090:	00008067          	ret
    a094:	00000713          	li	a4,0
    a098:	000f1663          	bnez	t5,a0a4 <__mdiff+0x21c>
    a09c:	00e58733          	add	a4,a1,a4
    a0a0:	f7dff06f          	j	a01c <__mdiff+0x194>
    a0a4:	00241713          	sll	a4,s0,0x2
    a0a8:	00e58733          	add	a4,a1,a4
    a0ac:	f71ff06f          	j	a01c <__mdiff+0x194>
    a0b0:	00005697          	auipc	a3,0x5
    a0b4:	f6868693          	add	a3,a3,-152 # f018 <__fini_array_end+0x300>
    a0b8:	00000613          	li	a2,0
    a0bc:	24500593          	li	a1,581
    a0c0:	00005517          	auipc	a0,0x5
    a0c4:	fec50513          	add	a0,a0,-20 # f0ac <__fini_array_end+0x394>
    a0c8:	511000ef          	jal	add8 <__assert_func>
    a0cc:	00005697          	auipc	a3,0x5
    a0d0:	f4c68693          	add	a3,a3,-180 # f018 <__fini_array_end+0x300>
    a0d4:	00000613          	li	a2,0
    a0d8:	23700593          	li	a1,567
    a0dc:	00005517          	auipc	a0,0x5
    a0e0:	fd050513          	add	a0,a0,-48 # f0ac <__fini_array_end+0x394>
    a0e4:	4f5000ef          	jal	add8 <__assert_func>

0000a0e8 <__d2b>:
    a0e8:	fd010113          	add	sp,sp,-48
    a0ec:	01512a23          	sw	s5,20(sp)
    a0f0:	00058a93          	mv	s5,a1
    a0f4:	00100593          	li	a1,1
    a0f8:	02912223          	sw	s1,36(sp)
    a0fc:	01312e23          	sw	s3,28(sp)
    a100:	01412c23          	sw	s4,24(sp)
    a104:	02112623          	sw	ra,44(sp)
    a108:	02812423          	sw	s0,40(sp)
    a10c:	03212023          	sw	s2,32(sp)
    a110:	00060493          	mv	s1,a2
    a114:	00068a13          	mv	s4,a3
    a118:	00070993          	mv	s3,a4
    a11c:	b08ff0ef          	jal	9424 <_Balloc>
    a120:	10050263          	beqz	a0,a224 <__d2b+0x13c>
    a124:	00100737          	lui	a4,0x100
    a128:	0144d913          	srl	s2,s1,0x14
    a12c:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a130:	7ff97913          	and	s2,s2,2047
    a134:	00050413          	mv	s0,a0
    a138:	0097f7b3          	and	a5,a5,s1
    a13c:	00090463          	beqz	s2,a144 <__d2b+0x5c>
    a140:	00e7e7b3          	or	a5,a5,a4
    a144:	00f12623          	sw	a5,12(sp)
    a148:	060a9263          	bnez	s5,a1ac <__d2b+0xc4>
    a14c:	00c10513          	add	a0,sp,12
    a150:	da8ff0ef          	jal	96f8 <__lo0bits>
    a154:	00c12703          	lw	a4,12(sp)
    a158:	00100493          	li	s1,1
    a15c:	00942823          	sw	s1,16(s0)
    a160:	00e42a23          	sw	a4,20(s0)
    a164:	02050793          	add	a5,a0,32
    a168:	08090863          	beqz	s2,a1f8 <__d2b+0x110>
    a16c:	bcd90913          	add	s2,s2,-1075
    a170:	00f90933          	add	s2,s2,a5
    a174:	03500493          	li	s1,53
    a178:	012a2023          	sw	s2,0(s4)
    a17c:	40f48533          	sub	a0,s1,a5
    a180:	00a9a023          	sw	a0,0(s3)
    a184:	02c12083          	lw	ra,44(sp)
    a188:	00040513          	mv	a0,s0
    a18c:	02812403          	lw	s0,40(sp)
    a190:	02412483          	lw	s1,36(sp)
    a194:	02012903          	lw	s2,32(sp)
    a198:	01c12983          	lw	s3,28(sp)
    a19c:	01812a03          	lw	s4,24(sp)
    a1a0:	01412a83          	lw	s5,20(sp)
    a1a4:	03010113          	add	sp,sp,48
    a1a8:	00008067          	ret
    a1ac:	00810513          	add	a0,sp,8
    a1b0:	01512423          	sw	s5,8(sp)
    a1b4:	d44ff0ef          	jal	96f8 <__lo0bits>
    a1b8:	00c12703          	lw	a4,12(sp)
    a1bc:	00050793          	mv	a5,a0
    a1c0:	04050e63          	beqz	a0,a21c <__d2b+0x134>
    a1c4:	00812603          	lw	a2,8(sp)
    a1c8:	02000693          	li	a3,32
    a1cc:	40a686b3          	sub	a3,a3,a0
    a1d0:	00d716b3          	sll	a3,a4,a3
    a1d4:	00a75733          	srl	a4,a4,a0
    a1d8:	00c6e6b3          	or	a3,a3,a2
    a1dc:	00e12623          	sw	a4,12(sp)
    a1e0:	00e034b3          	snez	s1,a4
    a1e4:	00148493          	add	s1,s1,1
    a1e8:	00d42a23          	sw	a3,20(s0)
    a1ec:	00e42c23          	sw	a4,24(s0)
    a1f0:	00942823          	sw	s1,16(s0)
    a1f4:	f6091ce3          	bnez	s2,a16c <__d2b+0x84>
    a1f8:	00249713          	sll	a4,s1,0x2
    a1fc:	00e40733          	add	a4,s0,a4
    a200:	01072503          	lw	a0,16(a4)
    a204:	bce78793          	add	a5,a5,-1074
    a208:	00fa2023          	sw	a5,0(s4)
    a20c:	c74ff0ef          	jal	9680 <__hi0bits>
    a210:	00549493          	sll	s1,s1,0x5
    a214:	40a48533          	sub	a0,s1,a0
    a218:	f69ff06f          	j	a180 <__d2b+0x98>
    a21c:	00812683          	lw	a3,8(sp)
    a220:	fc1ff06f          	j	a1e0 <__d2b+0xf8>
    a224:	00005697          	auipc	a3,0x5
    a228:	df468693          	add	a3,a3,-524 # f018 <__fini_array_end+0x300>
    a22c:	00000613          	li	a2,0
    a230:	30f00593          	li	a1,783
    a234:	00005517          	auipc	a0,0x5
    a238:	e7850513          	add	a0,a0,-392 # f0ac <__fini_array_end+0x394>
    a23c:	39d000ef          	jal	add8 <__assert_func>

0000a240 <_realloc_r>:
    a240:	fd010113          	add	sp,sp,-48
    a244:	02912223          	sw	s1,36(sp)
    a248:	02112623          	sw	ra,44(sp)
    a24c:	00060493          	mv	s1,a2
    a250:	1e058863          	beqz	a1,a440 <_realloc_r+0x200>
    a254:	02812423          	sw	s0,40(sp)
    a258:	03212023          	sw	s2,32(sp)
    a25c:	00058413          	mv	s0,a1
    a260:	01312e23          	sw	s3,28(sp)
    a264:	01512a23          	sw	s5,20(sp)
    a268:	01412c23          	sw	s4,24(sp)
    a26c:	00050913          	mv	s2,a0
    a270:	b3df70ef          	jal	1dac <__malloc_lock>
    a274:	ffc42703          	lw	a4,-4(s0)
    a278:	00b48793          	add	a5,s1,11
    a27c:	01600693          	li	a3,22
    a280:	ff840a93          	add	s5,s0,-8
    a284:	ffc77993          	and	s3,a4,-4
    a288:	10f6f263          	bgeu	a3,a5,a38c <_realloc_r+0x14c>
    a28c:	ff87fa13          	and	s4,a5,-8
    a290:	1007c263          	bltz	a5,a394 <_realloc_r+0x154>
    a294:	109a6063          	bltu	s4,s1,a394 <_realloc_r+0x154>
    a298:	1349d263          	bge	s3,s4,a3bc <_realloc_r+0x17c>
    a29c:	01812423          	sw	s8,8(sp)
    a2a0:	7fff6c17          	auipc	s8,0x7fff6
    a2a4:	e80c0c13          	add	s8,s8,-384 # 80000120 <__malloc_av_>
    a2a8:	008c2603          	lw	a2,8(s8)
    a2ac:	013a86b3          	add	a3,s5,s3
    a2b0:	0046a783          	lw	a5,4(a3)
    a2b4:	1cd60863          	beq	a2,a3,a484 <_realloc_r+0x244>
    a2b8:	ffe7f613          	and	a2,a5,-2
    a2bc:	00c68633          	add	a2,a3,a2
    a2c0:	00462603          	lw	a2,4(a2)
    a2c4:	00167613          	and	a2,a2,1
    a2c8:	14061a63          	bnez	a2,a41c <_realloc_r+0x1dc>
    a2cc:	ffc7f793          	and	a5,a5,-4
    a2d0:	00f98633          	add	a2,s3,a5
    a2d4:	0d465863          	bge	a2,s4,a3a4 <_realloc_r+0x164>
    a2d8:	00177713          	and	a4,a4,1
    a2dc:	02071c63          	bnez	a4,a314 <_realloc_r+0xd4>
    a2e0:	01712623          	sw	s7,12(sp)
    a2e4:	ff842b83          	lw	s7,-8(s0)
    a2e8:	01612823          	sw	s6,16(sp)
    a2ec:	417a8bb3          	sub	s7,s5,s7
    a2f0:	004ba703          	lw	a4,4(s7)
    a2f4:	ffc77713          	and	a4,a4,-4
    a2f8:	00e787b3          	add	a5,a5,a4
    a2fc:	01378b33          	add	s6,a5,s3
    a300:	334b5c63          	bge	s6,s4,a638 <_realloc_r+0x3f8>
    a304:	00e98b33          	add	s6,s3,a4
    a308:	294b5863          	bge	s6,s4,a598 <_realloc_r+0x358>
    a30c:	01012b03          	lw	s6,16(sp)
    a310:	00c12b83          	lw	s7,12(sp)
    a314:	00048593          	mv	a1,s1
    a318:	00090513          	mv	a0,s2
    a31c:	ab0f70ef          	jal	15cc <_malloc_r>
    a320:	00050493          	mv	s1,a0
    a324:	40050863          	beqz	a0,a734 <_realloc_r+0x4f4>
    a328:	ffc42783          	lw	a5,-4(s0)
    a32c:	ff850713          	add	a4,a0,-8
    a330:	ffe7f793          	and	a5,a5,-2
    a334:	00fa87b3          	add	a5,s5,a5
    a338:	24e78663          	beq	a5,a4,a584 <_realloc_r+0x344>
    a33c:	ffc98613          	add	a2,s3,-4
    a340:	02400793          	li	a5,36
    a344:	2ec7e463          	bltu	a5,a2,a62c <_realloc_r+0x3ec>
    a348:	01300713          	li	a4,19
    a34c:	20c76a63          	bltu	a4,a2,a560 <_realloc_r+0x320>
    a350:	00050793          	mv	a5,a0
    a354:	00040713          	mv	a4,s0
    a358:	00072683          	lw	a3,0(a4)
    a35c:	00d7a023          	sw	a3,0(a5)
    a360:	00472683          	lw	a3,4(a4)
    a364:	00d7a223          	sw	a3,4(a5)
    a368:	00872703          	lw	a4,8(a4)
    a36c:	00e7a423          	sw	a4,8(a5)
    a370:	00040593          	mv	a1,s0
    a374:	00090513          	mv	a0,s2
    a378:	f49f60ef          	jal	12c0 <_free_r>
    a37c:	00090513          	mv	a0,s2
    a380:	a39f70ef          	jal	1db8 <__malloc_unlock>
    a384:	00812c03          	lw	s8,8(sp)
    a388:	06c0006f          	j	a3f4 <_realloc_r+0x1b4>
    a38c:	01000a13          	li	s4,16
    a390:	f09a74e3          	bgeu	s4,s1,a298 <_realloc_r+0x58>
    a394:	00c00793          	li	a5,12
    a398:	00f92023          	sw	a5,0(s2)
    a39c:	00000493          	li	s1,0
    a3a0:	0540006f          	j	a3f4 <_realloc_r+0x1b4>
    a3a4:	00c6a783          	lw	a5,12(a3)
    a3a8:	0086a703          	lw	a4,8(a3)
    a3ac:	00812c03          	lw	s8,8(sp)
    a3b0:	00060993          	mv	s3,a2
    a3b4:	00f72623          	sw	a5,12(a4)
    a3b8:	00e7a423          	sw	a4,8(a5)
    a3bc:	004aa783          	lw	a5,4(s5)
    a3c0:	414986b3          	sub	a3,s3,s4
    a3c4:	00f00613          	li	a2,15
    a3c8:	0017f793          	and	a5,a5,1
    a3cc:	013a8733          	add	a4,s5,s3
    a3d0:	08d66263          	bltu	a2,a3,a454 <_realloc_r+0x214>
    a3d4:	0137e7b3          	or	a5,a5,s3
    a3d8:	00faa223          	sw	a5,4(s5)
    a3dc:	00472783          	lw	a5,4(a4)
    a3e0:	0017e793          	or	a5,a5,1
    a3e4:	00f72223          	sw	a5,4(a4)
    a3e8:	00090513          	mv	a0,s2
    a3ec:	9cdf70ef          	jal	1db8 <__malloc_unlock>
    a3f0:	00040493          	mv	s1,s0
    a3f4:	02812403          	lw	s0,40(sp)
    a3f8:	02c12083          	lw	ra,44(sp)
    a3fc:	02012903          	lw	s2,32(sp)
    a400:	01c12983          	lw	s3,28(sp)
    a404:	01812a03          	lw	s4,24(sp)
    a408:	01412a83          	lw	s5,20(sp)
    a40c:	00048513          	mv	a0,s1
    a410:	02412483          	lw	s1,36(sp)
    a414:	03010113          	add	sp,sp,48
    a418:	00008067          	ret
    a41c:	00177713          	and	a4,a4,1
    a420:	ee071ae3          	bnez	a4,a314 <_realloc_r+0xd4>
    a424:	01712623          	sw	s7,12(sp)
    a428:	ff842b83          	lw	s7,-8(s0)
    a42c:	01612823          	sw	s6,16(sp)
    a430:	417a8bb3          	sub	s7,s5,s7
    a434:	004ba703          	lw	a4,4(s7)
    a438:	ffc77713          	and	a4,a4,-4
    a43c:	ec9ff06f          	j	a304 <_realloc_r+0xc4>
    a440:	02c12083          	lw	ra,44(sp)
    a444:	02412483          	lw	s1,36(sp)
    a448:	00060593          	mv	a1,a2
    a44c:	03010113          	add	sp,sp,48
    a450:	97cf706f          	j	15cc <_malloc_r>
    a454:	0147e7b3          	or	a5,a5,s4
    a458:	00faa223          	sw	a5,4(s5)
    a45c:	014a85b3          	add	a1,s5,s4
    a460:	0016e693          	or	a3,a3,1
    a464:	00d5a223          	sw	a3,4(a1)
    a468:	00472783          	lw	a5,4(a4)
    a46c:	00858593          	add	a1,a1,8
    a470:	00090513          	mv	a0,s2
    a474:	0017e793          	or	a5,a5,1
    a478:	00f72223          	sw	a5,4(a4)
    a47c:	e45f60ef          	jal	12c0 <_free_r>
    a480:	f69ff06f          	j	a3e8 <_realloc_r+0x1a8>
    a484:	ffc7f793          	and	a5,a5,-4
    a488:	013786b3          	add	a3,a5,s3
    a48c:	010a0613          	add	a2,s4,16
    a490:	26c6d063          	bge	a3,a2,a6f0 <_realloc_r+0x4b0>
    a494:	00177713          	and	a4,a4,1
    a498:	e6071ee3          	bnez	a4,a314 <_realloc_r+0xd4>
    a49c:	01712623          	sw	s7,12(sp)
    a4a0:	ff842b83          	lw	s7,-8(s0)
    a4a4:	01612823          	sw	s6,16(sp)
    a4a8:	417a8bb3          	sub	s7,s5,s7
    a4ac:	004ba703          	lw	a4,4(s7)
    a4b0:	ffc77713          	and	a4,a4,-4
    a4b4:	00e787b3          	add	a5,a5,a4
    a4b8:	01378b33          	add	s6,a5,s3
    a4bc:	e4cb44e3          	blt	s6,a2,a304 <_realloc_r+0xc4>
    a4c0:	00cba783          	lw	a5,12(s7)
    a4c4:	008ba703          	lw	a4,8(s7)
    a4c8:	ffc98613          	add	a2,s3,-4
    a4cc:	02400693          	li	a3,36
    a4d0:	00f72623          	sw	a5,12(a4)
    a4d4:	00e7a423          	sw	a4,8(a5)
    a4d8:	008b8493          	add	s1,s7,8
    a4dc:	28c6e463          	bltu	a3,a2,a764 <_realloc_r+0x524>
    a4e0:	01300713          	li	a4,19
    a4e4:	00048793          	mv	a5,s1
    a4e8:	02c77263          	bgeu	a4,a2,a50c <_realloc_r+0x2cc>
    a4ec:	00042703          	lw	a4,0(s0)
    a4f0:	01b00793          	li	a5,27
    a4f4:	00eba423          	sw	a4,8(s7)
    a4f8:	00442703          	lw	a4,4(s0)
    a4fc:	00eba623          	sw	a4,12(s7)
    a500:	26c7ea63          	bltu	a5,a2,a774 <_realloc_r+0x534>
    a504:	00840413          	add	s0,s0,8
    a508:	010b8793          	add	a5,s7,16
    a50c:	00042703          	lw	a4,0(s0)
    a510:	00e7a023          	sw	a4,0(a5)
    a514:	00442703          	lw	a4,4(s0)
    a518:	00e7a223          	sw	a4,4(a5)
    a51c:	00842703          	lw	a4,8(s0)
    a520:	00e7a423          	sw	a4,8(a5)
    a524:	014b8733          	add	a4,s7,s4
    a528:	414b07b3          	sub	a5,s6,s4
    a52c:	00ec2423          	sw	a4,8(s8)
    a530:	0017e793          	or	a5,a5,1
    a534:	00f72223          	sw	a5,4(a4)
    a538:	004ba783          	lw	a5,4(s7)
    a53c:	00090513          	mv	a0,s2
    a540:	0017f793          	and	a5,a5,1
    a544:	0147e7b3          	or	a5,a5,s4
    a548:	00fba223          	sw	a5,4(s7)
    a54c:	86df70ef          	jal	1db8 <__malloc_unlock>
    a550:	01012b03          	lw	s6,16(sp)
    a554:	00c12b83          	lw	s7,12(sp)
    a558:	00812c03          	lw	s8,8(sp)
    a55c:	e99ff06f          	j	a3f4 <_realloc_r+0x1b4>
    a560:	00042683          	lw	a3,0(s0)
    a564:	01b00713          	li	a4,27
    a568:	00d52023          	sw	a3,0(a0)
    a56c:	00442683          	lw	a3,4(s0)
    a570:	00d52223          	sw	a3,4(a0)
    a574:	14c76e63          	bltu	a4,a2,a6d0 <_realloc_r+0x490>
    a578:	00840713          	add	a4,s0,8
    a57c:	00850793          	add	a5,a0,8
    a580:	dd9ff06f          	j	a358 <_realloc_r+0x118>
    a584:	ffc52783          	lw	a5,-4(a0)
    a588:	00812c03          	lw	s8,8(sp)
    a58c:	ffc7f793          	and	a5,a5,-4
    a590:	00f989b3          	add	s3,s3,a5
    a594:	e29ff06f          	j	a3bc <_realloc_r+0x17c>
    a598:	00cba783          	lw	a5,12(s7)
    a59c:	008ba703          	lw	a4,8(s7)
    a5a0:	ffc98613          	add	a2,s3,-4
    a5a4:	02400693          	li	a3,36
    a5a8:	00f72623          	sw	a5,12(a4)
    a5ac:	00e7a423          	sw	a4,8(a5)
    a5b0:	008b8493          	add	s1,s7,8
    a5b4:	10c6e663          	bltu	a3,a2,a6c0 <_realloc_r+0x480>
    a5b8:	01300713          	li	a4,19
    a5bc:	00048793          	mv	a5,s1
    a5c0:	02c77c63          	bgeu	a4,a2,a5f8 <_realloc_r+0x3b8>
    a5c4:	00042703          	lw	a4,0(s0)
    a5c8:	01b00793          	li	a5,27
    a5cc:	00eba423          	sw	a4,8(s7)
    a5d0:	00442703          	lw	a4,4(s0)
    a5d4:	00eba623          	sw	a4,12(s7)
    a5d8:	14c7f863          	bgeu	a5,a2,a728 <_realloc_r+0x4e8>
    a5dc:	00842783          	lw	a5,8(s0)
    a5e0:	00fba823          	sw	a5,16(s7)
    a5e4:	00c42783          	lw	a5,12(s0)
    a5e8:	00fbaa23          	sw	a5,20(s7)
    a5ec:	0ad60c63          	beq	a2,a3,a6a4 <_realloc_r+0x464>
    a5f0:	01040413          	add	s0,s0,16
    a5f4:	018b8793          	add	a5,s7,24
    a5f8:	00042703          	lw	a4,0(s0)
    a5fc:	00e7a023          	sw	a4,0(a5)
    a600:	00442703          	lw	a4,4(s0)
    a604:	00e7a223          	sw	a4,4(a5)
    a608:	00842703          	lw	a4,8(s0)
    a60c:	00e7a423          	sw	a4,8(a5)
    a610:	000b0993          	mv	s3,s6
    a614:	000b8a93          	mv	s5,s7
    a618:	01012b03          	lw	s6,16(sp)
    a61c:	00c12b83          	lw	s7,12(sp)
    a620:	00812c03          	lw	s8,8(sp)
    a624:	00048413          	mv	s0,s1
    a628:	d95ff06f          	j	a3bc <_realloc_r+0x17c>
    a62c:	00040593          	mv	a1,s0
    a630:	ae8fd0ef          	jal	7918 <memmove>
    a634:	d3dff06f          	j	a370 <_realloc_r+0x130>
    a638:	00c6a783          	lw	a5,12(a3)
    a63c:	0086a703          	lw	a4,8(a3)
    a640:	ffc98613          	add	a2,s3,-4
    a644:	02400693          	li	a3,36
    a648:	00f72623          	sw	a5,12(a4)
    a64c:	00e7a423          	sw	a4,8(a5)
    a650:	008ba703          	lw	a4,8(s7)
    a654:	00cba783          	lw	a5,12(s7)
    a658:	008b8493          	add	s1,s7,8
    a65c:	00f72623          	sw	a5,12(a4)
    a660:	00e7a423          	sw	a4,8(a5)
    a664:	04c6ee63          	bltu	a3,a2,a6c0 <_realloc_r+0x480>
    a668:	01300713          	li	a4,19
    a66c:	00048793          	mv	a5,s1
    a670:	f8c774e3          	bgeu	a4,a2,a5f8 <_realloc_r+0x3b8>
    a674:	00042703          	lw	a4,0(s0)
    a678:	01b00793          	li	a5,27
    a67c:	00eba423          	sw	a4,8(s7)
    a680:	00442703          	lw	a4,4(s0)
    a684:	00eba623          	sw	a4,12(s7)
    a688:	0ac7f063          	bgeu	a5,a2,a728 <_realloc_r+0x4e8>
    a68c:	00842703          	lw	a4,8(s0)
    a690:	02400793          	li	a5,36
    a694:	00eba823          	sw	a4,16(s7)
    a698:	00c42703          	lw	a4,12(s0)
    a69c:	00ebaa23          	sw	a4,20(s7)
    a6a0:	f4f618e3          	bne	a2,a5,a5f0 <_realloc_r+0x3b0>
    a6a4:	01042703          	lw	a4,16(s0)
    a6a8:	020b8793          	add	a5,s7,32
    a6ac:	01840413          	add	s0,s0,24
    a6b0:	00ebac23          	sw	a4,24(s7)
    a6b4:	ffc42703          	lw	a4,-4(s0)
    a6b8:	00ebae23          	sw	a4,28(s7)
    a6bc:	f3dff06f          	j	a5f8 <_realloc_r+0x3b8>
    a6c0:	00040593          	mv	a1,s0
    a6c4:	00048513          	mv	a0,s1
    a6c8:	a50fd0ef          	jal	7918 <memmove>
    a6cc:	f45ff06f          	j	a610 <_realloc_r+0x3d0>
    a6d0:	00842703          	lw	a4,8(s0)
    a6d4:	00e52423          	sw	a4,8(a0)
    a6d8:	00c42703          	lw	a4,12(s0)
    a6dc:	00e52623          	sw	a4,12(a0)
    a6e0:	06f60463          	beq	a2,a5,a748 <_realloc_r+0x508>
    a6e4:	01040713          	add	a4,s0,16
    a6e8:	01050793          	add	a5,a0,16
    a6ec:	c6dff06f          	j	a358 <_realloc_r+0x118>
    a6f0:	014a8ab3          	add	s5,s5,s4
    a6f4:	414687b3          	sub	a5,a3,s4
    a6f8:	015c2423          	sw	s5,8(s8)
    a6fc:	0017e793          	or	a5,a5,1
    a700:	00faa223          	sw	a5,4(s5)
    a704:	ffc42783          	lw	a5,-4(s0)
    a708:	00090513          	mv	a0,s2
    a70c:	00040493          	mv	s1,s0
    a710:	0017f793          	and	a5,a5,1
    a714:	0147e7b3          	or	a5,a5,s4
    a718:	fef42e23          	sw	a5,-4(s0)
    a71c:	e9cf70ef          	jal	1db8 <__malloc_unlock>
    a720:	00812c03          	lw	s8,8(sp)
    a724:	cd1ff06f          	j	a3f4 <_realloc_r+0x1b4>
    a728:	00840413          	add	s0,s0,8
    a72c:	010b8793          	add	a5,s7,16
    a730:	ec9ff06f          	j	a5f8 <_realloc_r+0x3b8>
    a734:	00090513          	mv	a0,s2
    a738:	e80f70ef          	jal	1db8 <__malloc_unlock>
    a73c:	00000493          	li	s1,0
    a740:	00812c03          	lw	s8,8(sp)
    a744:	cb1ff06f          	j	a3f4 <_realloc_r+0x1b4>
    a748:	01042683          	lw	a3,16(s0)
    a74c:	01840713          	add	a4,s0,24
    a750:	01850793          	add	a5,a0,24
    a754:	00d52823          	sw	a3,16(a0)
    a758:	01442683          	lw	a3,20(s0)
    a75c:	00d52a23          	sw	a3,20(a0)
    a760:	bf9ff06f          	j	a358 <_realloc_r+0x118>
    a764:	00040593          	mv	a1,s0
    a768:	00048513          	mv	a0,s1
    a76c:	9acfd0ef          	jal	7918 <memmove>
    a770:	db5ff06f          	j	a524 <_realloc_r+0x2e4>
    a774:	00842783          	lw	a5,8(s0)
    a778:	00fba823          	sw	a5,16(s7)
    a77c:	00c42783          	lw	a5,12(s0)
    a780:	00fbaa23          	sw	a5,20(s7)
    a784:	00d60863          	beq	a2,a3,a794 <_realloc_r+0x554>
    a788:	01040413          	add	s0,s0,16
    a78c:	018b8793          	add	a5,s7,24
    a790:	d7dff06f          	j	a50c <_realloc_r+0x2cc>
    a794:	01042703          	lw	a4,16(s0)
    a798:	020b8793          	add	a5,s7,32
    a79c:	01840413          	add	s0,s0,24
    a7a0:	00ebac23          	sw	a4,24(s7)
    a7a4:	ffc42703          	lw	a4,-4(s0)
    a7a8:	00ebae23          	sw	a4,28(s7)
    a7ac:	d61ff06f          	j	a50c <_realloc_r+0x2cc>

0000a7b0 <__ascii_wctomb>:
    a7b0:	02058463          	beqz	a1,a7d8 <__ascii_wctomb+0x28>
    a7b4:	0ff00793          	li	a5,255
    a7b8:	00c7e863          	bltu	a5,a2,a7c8 <__ascii_wctomb+0x18>
    a7bc:	00c58023          	sb	a2,0(a1)
    a7c0:	00100513          	li	a0,1
    a7c4:	00008067          	ret
    a7c8:	08a00793          	li	a5,138
    a7cc:	00f52023          	sw	a5,0(a0)
    a7d0:	fff00513          	li	a0,-1
    a7d4:	00008067          	ret
    a7d8:	00000513          	li	a0,0
    a7dc:	00008067          	ret

0000a7e0 <_wcrtomb_r>:
    a7e0:	fe010113          	add	sp,sp,-32
    a7e4:	00812c23          	sw	s0,24(sp)
    a7e8:	00912a23          	sw	s1,20(sp)
    a7ec:	00112e23          	sw	ra,28(sp)
    a7f0:	00050493          	mv	s1,a0
    a7f4:	10450413          	add	s0,a0,260
    a7f8:	00068463          	beqz	a3,a800 <_wcrtomb_r+0x20>
    a7fc:	00068413          	mv	s0,a3
    a800:	7fff6797          	auipc	a5,0x7fff6
    a804:	e147a783          	lw	a5,-492(a5) # 80000614 <__global_locale+0xe0>
    a808:	00040693          	mv	a3,s0
    a80c:	02058463          	beqz	a1,a834 <_wcrtomb_r+0x54>
    a810:	00048513          	mv	a0,s1
    a814:	000780e7          	jalr	a5
    a818:	fff00793          	li	a5,-1
    a81c:	02f50863          	beq	a0,a5,a84c <_wcrtomb_r+0x6c>
    a820:	01c12083          	lw	ra,28(sp)
    a824:	01812403          	lw	s0,24(sp)
    a828:	01412483          	lw	s1,20(sp)
    a82c:	02010113          	add	sp,sp,32
    a830:	00008067          	ret
    a834:	00000613          	li	a2,0
    a838:	00410593          	add	a1,sp,4
    a83c:	00048513          	mv	a0,s1
    a840:	000780e7          	jalr	a5
    a844:	fff00793          	li	a5,-1
    a848:	fcf51ce3          	bne	a0,a5,a820 <_wcrtomb_r+0x40>
    a84c:	00042023          	sw	zero,0(s0)
    a850:	01c12083          	lw	ra,28(sp)
    a854:	01812403          	lw	s0,24(sp)
    a858:	08a00793          	li	a5,138
    a85c:	00f4a023          	sw	a5,0(s1)
    a860:	01412483          	lw	s1,20(sp)
    a864:	02010113          	add	sp,sp,32
    a868:	00008067          	ret

0000a86c <_wcsrtombs_r>:
    a86c:	00070793          	mv	a5,a4
    a870:	00068713          	mv	a4,a3
    a874:	fff00693          	li	a3,-1
    a878:	1350006f          	j	b1ac <_wcsnrtombs_r>

0000a87c <_fclose_r>:
    a87c:	ff010113          	add	sp,sp,-16
    a880:	00112623          	sw	ra,12(sp)
    a884:	01212023          	sw	s2,0(sp)
    a888:	0e058263          	beqz	a1,a96c <_fclose_r+0xf0>
    a88c:	00812423          	sw	s0,8(sp)
    a890:	00912223          	sw	s1,4(sp)
    a894:	00058413          	mv	s0,a1
    a898:	00050493          	mv	s1,a0
    a89c:	00050663          	beqz	a0,a8a8 <_fclose_r+0x2c>
    a8a0:	03452783          	lw	a5,52(a0)
    a8a4:	10078063          	beqz	a5,a9a4 <_fclose_r+0x128>
    a8a8:	06442783          	lw	a5,100(s0)
    a8ac:	00c41703          	lh	a4,12(s0)
    a8b0:	0017f793          	and	a5,a5,1
    a8b4:	0a079663          	bnez	a5,a960 <_fclose_r+0xe4>
    a8b8:	20077713          	and	a4,a4,512
    a8bc:	0e070863          	beqz	a4,a9ac <_fclose_r+0x130>
    a8c0:	00040593          	mv	a1,s0
    a8c4:	00048513          	mv	a0,s1
    a8c8:	c81fb0ef          	jal	6548 <__sflush_r>
    a8cc:	02c42783          	lw	a5,44(s0)
    a8d0:	00050913          	mv	s2,a0
    a8d4:	00078a63          	beqz	a5,a8e8 <_fclose_r+0x6c>
    a8d8:	01c42583          	lw	a1,28(s0)
    a8dc:	00048513          	mv	a0,s1
    a8e0:	000780e7          	jalr	a5
    a8e4:	0a054063          	bltz	a0,a984 <_fclose_r+0x108>
    a8e8:	00c45783          	lhu	a5,12(s0)
    a8ec:	0807f793          	and	a5,a5,128
    a8f0:	0a079263          	bnez	a5,a994 <_fclose_r+0x118>
    a8f4:	03042583          	lw	a1,48(s0)
    a8f8:	00058c63          	beqz	a1,a910 <_fclose_r+0x94>
    a8fc:	04040793          	add	a5,s0,64
    a900:	00f58663          	beq	a1,a5,a90c <_fclose_r+0x90>
    a904:	00048513          	mv	a0,s1
    a908:	9b9f60ef          	jal	12c0 <_free_r>
    a90c:	02042823          	sw	zero,48(s0)
    a910:	04442583          	lw	a1,68(s0)
    a914:	00058863          	beqz	a1,a924 <_fclose_r+0xa8>
    a918:	00048513          	mv	a0,s1
    a91c:	9a5f60ef          	jal	12c0 <_free_r>
    a920:	04042223          	sw	zero,68(s0)
    a924:	9dcfc0ef          	jal	6b00 <__sfp_lock_acquire>
    a928:	06442783          	lw	a5,100(s0)
    a92c:	00041623          	sh	zero,12(s0)
    a930:	0017f793          	and	a5,a5,1
    a934:	0a078663          	beqz	a5,a9e0 <_fclose_r+0x164>
    a938:	05842503          	lw	a0,88(s0)
    a93c:	d28f60ef          	jal	e64 <__retarget_lock_close_recursive>
    a940:	9ccfc0ef          	jal	6b0c <__sfp_lock_release>
    a944:	00c12083          	lw	ra,12(sp)
    a948:	00812403          	lw	s0,8(sp)
    a94c:	00412483          	lw	s1,4(sp)
    a950:	00090513          	mv	a0,s2
    a954:	00012903          	lw	s2,0(sp)
    a958:	01010113          	add	sp,sp,16
    a95c:	00008067          	ret
    a960:	f60710e3          	bnez	a4,a8c0 <_fclose_r+0x44>
    a964:	00812403          	lw	s0,8(sp)
    a968:	00412483          	lw	s1,4(sp)
    a96c:	00000913          	li	s2,0
    a970:	00c12083          	lw	ra,12(sp)
    a974:	00090513          	mv	a0,s2
    a978:	00012903          	lw	s2,0(sp)
    a97c:	01010113          	add	sp,sp,16
    a980:	00008067          	ret
    a984:	00c45783          	lhu	a5,12(s0)
    a988:	fff00913          	li	s2,-1
    a98c:	0807f793          	and	a5,a5,128
    a990:	f60782e3          	beqz	a5,a8f4 <_fclose_r+0x78>
    a994:	01042583          	lw	a1,16(s0)
    a998:	00048513          	mv	a0,s1
    a99c:	925f60ef          	jal	12c0 <_free_r>
    a9a0:	f55ff06f          	j	a8f4 <_fclose_r+0x78>
    a9a4:	8ecfc0ef          	jal	6a90 <__sinit>
    a9a8:	f01ff06f          	j	a8a8 <_fclose_r+0x2c>
    a9ac:	05842503          	lw	a0,88(s0)
    a9b0:	cb8f60ef          	jal	e68 <__retarget_lock_acquire_recursive>
    a9b4:	00c41783          	lh	a5,12(s0)
    a9b8:	f00794e3          	bnez	a5,a8c0 <_fclose_r+0x44>
    a9bc:	06442783          	lw	a5,100(s0)
    a9c0:	0017f793          	and	a5,a5,1
    a9c4:	fa0790e3          	bnez	a5,a964 <_fclose_r+0xe8>
    a9c8:	05842503          	lw	a0,88(s0)
    a9cc:	00000913          	li	s2,0
    a9d0:	c9cf60ef          	jal	e6c <__retarget_lock_release_recursive>
    a9d4:	00812403          	lw	s0,8(sp)
    a9d8:	00412483          	lw	s1,4(sp)
    a9dc:	f95ff06f          	j	a970 <_fclose_r+0xf4>
    a9e0:	05842503          	lw	a0,88(s0)
    a9e4:	c88f60ef          	jal	e6c <__retarget_lock_release_recursive>
    a9e8:	f51ff06f          	j	a938 <_fclose_r+0xbc>

0000a9ec <__smakebuf_r>:
    a9ec:	00c59783          	lh	a5,12(a1)
    a9f0:	f8010113          	add	sp,sp,-128
    a9f4:	06812c23          	sw	s0,120(sp)
    a9f8:	06112e23          	sw	ra,124(sp)
    a9fc:	0027f713          	and	a4,a5,2
    aa00:	00058413          	mv	s0,a1
    aa04:	02070463          	beqz	a4,aa2c <__smakebuf_r+0x40>
    aa08:	04358793          	add	a5,a1,67
    aa0c:	00f5a023          	sw	a5,0(a1)
    aa10:	00f5a823          	sw	a5,16(a1)
    aa14:	00100793          	li	a5,1
    aa18:	00f5aa23          	sw	a5,20(a1)
    aa1c:	07c12083          	lw	ra,124(sp)
    aa20:	07812403          	lw	s0,120(sp)
    aa24:	08010113          	add	sp,sp,128
    aa28:	00008067          	ret
    aa2c:	00e59583          	lh	a1,14(a1)
    aa30:	06912a23          	sw	s1,116(sp)
    aa34:	07212823          	sw	s2,112(sp)
    aa38:	07312623          	sw	s3,108(sp)
    aa3c:	07412423          	sw	s4,104(sp)
    aa40:	00050493          	mv	s1,a0
    aa44:	0805c663          	bltz	a1,aad0 <__smakebuf_r+0xe4>
    aa48:	00810613          	add	a2,sp,8
    aa4c:	2c8000ef          	jal	ad14 <_fstat_r>
    aa50:	06054e63          	bltz	a0,aacc <__smakebuf_r+0xe0>
    aa54:	00c12783          	lw	a5,12(sp)
    aa58:	0000f937          	lui	s2,0xf
    aa5c:	000019b7          	lui	s3,0x1
    aa60:	00f97933          	and	s2,s2,a5
    aa64:	ffffe7b7          	lui	a5,0xffffe
    aa68:	00f90933          	add	s2,s2,a5
    aa6c:	00193913          	seqz	s2,s2
    aa70:	40000a13          	li	s4,1024
    aa74:	80098993          	add	s3,s3,-2048 # 800 <main+0x530>
    aa78:	000a0593          	mv	a1,s4
    aa7c:	00048513          	mv	a0,s1
    aa80:	b4df60ef          	jal	15cc <_malloc_r>
    aa84:	00c41783          	lh	a5,12(s0)
    aa88:	06050863          	beqz	a0,aaf8 <__smakebuf_r+0x10c>
    aa8c:	0807e793          	or	a5,a5,128
    aa90:	00a42023          	sw	a0,0(s0)
    aa94:	00a42823          	sw	a0,16(s0)
    aa98:	00f41623          	sh	a5,12(s0)
    aa9c:	01442a23          	sw	s4,20(s0)
    aaa0:	0a091063          	bnez	s2,ab40 <__smakebuf_r+0x154>
    aaa4:	0137e7b3          	or	a5,a5,s3
    aaa8:	07c12083          	lw	ra,124(sp)
    aaac:	00f41623          	sh	a5,12(s0)
    aab0:	07812403          	lw	s0,120(sp)
    aab4:	07412483          	lw	s1,116(sp)
    aab8:	07012903          	lw	s2,112(sp)
    aabc:	06c12983          	lw	s3,108(sp)
    aac0:	06812a03          	lw	s4,104(sp)
    aac4:	08010113          	add	sp,sp,128
    aac8:	00008067          	ret
    aacc:	00c41783          	lh	a5,12(s0)
    aad0:	0807f793          	and	a5,a5,128
    aad4:	00000913          	li	s2,0
    aad8:	04078e63          	beqz	a5,ab34 <__smakebuf_r+0x148>
    aadc:	04000a13          	li	s4,64
    aae0:	000a0593          	mv	a1,s4
    aae4:	00048513          	mv	a0,s1
    aae8:	ae5f60ef          	jal	15cc <_malloc_r>
    aaec:	00c41783          	lh	a5,12(s0)
    aaf0:	00000993          	li	s3,0
    aaf4:	f8051ce3          	bnez	a0,aa8c <__smakebuf_r+0xa0>
    aaf8:	2007f713          	and	a4,a5,512
    aafc:	04071e63          	bnez	a4,ab58 <__smakebuf_r+0x16c>
    ab00:	ffc7f793          	and	a5,a5,-4
    ab04:	0027e793          	or	a5,a5,2
    ab08:	04340713          	add	a4,s0,67
    ab0c:	00f41623          	sh	a5,12(s0)
    ab10:	00100793          	li	a5,1
    ab14:	07412483          	lw	s1,116(sp)
    ab18:	07012903          	lw	s2,112(sp)
    ab1c:	06c12983          	lw	s3,108(sp)
    ab20:	06812a03          	lw	s4,104(sp)
    ab24:	00e42023          	sw	a4,0(s0)
    ab28:	00e42823          	sw	a4,16(s0)
    ab2c:	00f42a23          	sw	a5,20(s0)
    ab30:	eedff06f          	j	aa1c <__smakebuf_r+0x30>
    ab34:	40000a13          	li	s4,1024
    ab38:	00000993          	li	s3,0
    ab3c:	f3dff06f          	j	aa78 <__smakebuf_r+0x8c>
    ab40:	00e41583          	lh	a1,14(s0)
    ab44:	00048513          	mv	a0,s1
    ab48:	22c000ef          	jal	ad74 <_isatty_r>
    ab4c:	02051063          	bnez	a0,ab6c <__smakebuf_r+0x180>
    ab50:	00c41783          	lh	a5,12(s0)
    ab54:	f51ff06f          	j	aaa4 <__smakebuf_r+0xb8>
    ab58:	07412483          	lw	s1,116(sp)
    ab5c:	07012903          	lw	s2,112(sp)
    ab60:	06c12983          	lw	s3,108(sp)
    ab64:	06812a03          	lw	s4,104(sp)
    ab68:	eb5ff06f          	j	aa1c <__smakebuf_r+0x30>
    ab6c:	00c45783          	lhu	a5,12(s0)
    ab70:	ffc7f793          	and	a5,a5,-4
    ab74:	0017e793          	or	a5,a5,1
    ab78:	01079793          	sll	a5,a5,0x10
    ab7c:	4107d793          	sra	a5,a5,0x10
    ab80:	f25ff06f          	j	aaa4 <__smakebuf_r+0xb8>

0000ab84 <__swbuf_r>:
    ab84:	fe010113          	add	sp,sp,-32
    ab88:	00812c23          	sw	s0,24(sp)
    ab8c:	00912a23          	sw	s1,20(sp)
    ab90:	01212823          	sw	s2,16(sp)
    ab94:	00112e23          	sw	ra,28(sp)
    ab98:	00050913          	mv	s2,a0
    ab9c:	00058493          	mv	s1,a1
    aba0:	00060413          	mv	s0,a2
    aba4:	00050663          	beqz	a0,abb0 <__swbuf_r+0x2c>
    aba8:	03452783          	lw	a5,52(a0)
    abac:	16078063          	beqz	a5,ad0c <__swbuf_r+0x188>
    abb0:	01842783          	lw	a5,24(s0)
    abb4:	00c41703          	lh	a4,12(s0)
    abb8:	00f42423          	sw	a5,8(s0)
    abbc:	00877793          	and	a5,a4,8
    abc0:	08078063          	beqz	a5,ac40 <__swbuf_r+0xbc>
    abc4:	01042783          	lw	a5,16(s0)
    abc8:	06078c63          	beqz	a5,ac40 <__swbuf_r+0xbc>
    abcc:	01312623          	sw	s3,12(sp)
    abd0:	01271693          	sll	a3,a4,0x12
    abd4:	0ff4f993          	zext.b	s3,s1
    abd8:	0ff4f493          	zext.b	s1,s1
    abdc:	0806d863          	bgez	a3,ac6c <__swbuf_r+0xe8>
    abe0:	00042703          	lw	a4,0(s0)
    abe4:	01442683          	lw	a3,20(s0)
    abe8:	40f707b3          	sub	a5,a4,a5
    abec:	0ad7d863          	bge	a5,a3,ac9c <__swbuf_r+0x118>
    abf0:	00842683          	lw	a3,8(s0)
    abf4:	00170613          	add	a2,a4,1
    abf8:	00c42023          	sw	a2,0(s0)
    abfc:	fff68693          	add	a3,a3,-1
    ac00:	00d42423          	sw	a3,8(s0)
    ac04:	01370023          	sb	s3,0(a4)
    ac08:	01442703          	lw	a4,20(s0)
    ac0c:	00178793          	add	a5,a5,1 # ffffe001 <__crt0_ram_last+0x7ff7e002>
    ac10:	0cf70263          	beq	a4,a5,acd4 <__swbuf_r+0x150>
    ac14:	00c45783          	lhu	a5,12(s0)
    ac18:	0017f793          	and	a5,a5,1
    ac1c:	0c079a63          	bnez	a5,acf0 <__swbuf_r+0x16c>
    ac20:	00c12983          	lw	s3,12(sp)
    ac24:	01c12083          	lw	ra,28(sp)
    ac28:	01812403          	lw	s0,24(sp)
    ac2c:	01012903          	lw	s2,16(sp)
    ac30:	00048513          	mv	a0,s1
    ac34:	01412483          	lw	s1,20(sp)
    ac38:	02010113          	add	sp,sp,32
    ac3c:	00008067          	ret
    ac40:	00040593          	mv	a1,s0
    ac44:	00090513          	mv	a0,s2
    ac48:	dfcfc0ef          	jal	7244 <__swsetup_r>
    ac4c:	08051e63          	bnez	a0,ace8 <__swbuf_r+0x164>
    ac50:	00c41703          	lh	a4,12(s0)
    ac54:	01312623          	sw	s3,12(sp)
    ac58:	01042783          	lw	a5,16(s0)
    ac5c:	01271693          	sll	a3,a4,0x12
    ac60:	0ff4f993          	zext.b	s3,s1
    ac64:	0ff4f493          	zext.b	s1,s1
    ac68:	f606cce3          	bltz	a3,abe0 <__swbuf_r+0x5c>
    ac6c:	06442683          	lw	a3,100(s0)
    ac70:	ffffe637          	lui	a2,0xffffe
    ac74:	000025b7          	lui	a1,0x2
    ac78:	00b76733          	or	a4,a4,a1
    ac7c:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    ac80:	00c6f6b3          	and	a3,a3,a2
    ac84:	00e41623          	sh	a4,12(s0)
    ac88:	00042703          	lw	a4,0(s0)
    ac8c:	06d42223          	sw	a3,100(s0)
    ac90:	01442683          	lw	a3,20(s0)
    ac94:	40f707b3          	sub	a5,a4,a5
    ac98:	f4d7cce3          	blt	a5,a3,abf0 <__swbuf_r+0x6c>
    ac9c:	00040593          	mv	a1,s0
    aca0:	00090513          	mv	a0,s2
    aca4:	af1fb0ef          	jal	6794 <_fflush_r>
    aca8:	02051e63          	bnez	a0,ace4 <__swbuf_r+0x160>
    acac:	00042703          	lw	a4,0(s0)
    acb0:	00842683          	lw	a3,8(s0)
    acb4:	00100793          	li	a5,1
    acb8:	00170613          	add	a2,a4,1
    acbc:	fff68693          	add	a3,a3,-1
    acc0:	00c42023          	sw	a2,0(s0)
    acc4:	00d42423          	sw	a3,8(s0)
    acc8:	01370023          	sb	s3,0(a4)
    accc:	01442703          	lw	a4,20(s0)
    acd0:	f4f712e3          	bne	a4,a5,ac14 <__swbuf_r+0x90>
    acd4:	00040593          	mv	a1,s0
    acd8:	00090513          	mv	a0,s2
    acdc:	ab9fb0ef          	jal	6794 <_fflush_r>
    ace0:	f40500e3          	beqz	a0,ac20 <__swbuf_r+0x9c>
    ace4:	00c12983          	lw	s3,12(sp)
    ace8:	fff00493          	li	s1,-1
    acec:	f39ff06f          	j	ac24 <__swbuf_r+0xa0>
    acf0:	00a00793          	li	a5,10
    acf4:	f2f496e3          	bne	s1,a5,ac20 <__swbuf_r+0x9c>
    acf8:	00040593          	mv	a1,s0
    acfc:	00090513          	mv	a0,s2
    ad00:	a95fb0ef          	jal	6794 <_fflush_r>
    ad04:	f0050ee3          	beqz	a0,ac20 <__swbuf_r+0x9c>
    ad08:	fddff06f          	j	ace4 <__swbuf_r+0x160>
    ad0c:	d85fb0ef          	jal	6a90 <__sinit>
    ad10:	ea1ff06f          	j	abb0 <__swbuf_r+0x2c>

0000ad14 <_fstat_r>:
    ad14:	ff010113          	add	sp,sp,-16
    ad18:	00058713          	mv	a4,a1
    ad1c:	00812423          	sw	s0,8(sp)
    ad20:	00060593          	mv	a1,a2
    ad24:	00050413          	mv	s0,a0
    ad28:	00070513          	mv	a0,a4
    ad2c:	7fff6797          	auipc	a5,0x7fff6
    ad30:	9e07a623          	sw	zero,-1556(a5) # 80000718 <errno>
    ad34:	00112623          	sw	ra,12(sp)
    ad38:	d29f50ef          	jal	a60 <_fstat>
    ad3c:	fff00793          	li	a5,-1
    ad40:	00f50a63          	beq	a0,a5,ad54 <_fstat_r+0x40>
    ad44:	00c12083          	lw	ra,12(sp)
    ad48:	00812403          	lw	s0,8(sp)
    ad4c:	01010113          	add	sp,sp,16
    ad50:	00008067          	ret
    ad54:	7fff6797          	auipc	a5,0x7fff6
    ad58:	9c47a783          	lw	a5,-1596(a5) # 80000718 <errno>
    ad5c:	fe0784e3          	beqz	a5,ad44 <_fstat_r+0x30>
    ad60:	00c12083          	lw	ra,12(sp)
    ad64:	00f42023          	sw	a5,0(s0)
    ad68:	00812403          	lw	s0,8(sp)
    ad6c:	01010113          	add	sp,sp,16
    ad70:	00008067          	ret

0000ad74 <_isatty_r>:
    ad74:	ff010113          	add	sp,sp,-16
    ad78:	00812423          	sw	s0,8(sp)
    ad7c:	00050413          	mv	s0,a0
    ad80:	00058513          	mv	a0,a1
    ad84:	7fff6797          	auipc	a5,0x7fff6
    ad88:	9807aa23          	sw	zero,-1644(a5) # 80000718 <errno>
    ad8c:	00112623          	sw	ra,12(sp)
    ad90:	ce9f50ef          	jal	a78 <_isatty>
    ad94:	fff00793          	li	a5,-1
    ad98:	00f50a63          	beq	a0,a5,adac <_isatty_r+0x38>
    ad9c:	00c12083          	lw	ra,12(sp)
    ada0:	00812403          	lw	s0,8(sp)
    ada4:	01010113          	add	sp,sp,16
    ada8:	00008067          	ret
    adac:	7fff6797          	auipc	a5,0x7fff6
    adb0:	96c7a783          	lw	a5,-1684(a5) # 80000718 <errno>
    adb4:	fe0784e3          	beqz	a5,ad9c <_isatty_r+0x28>
    adb8:	00c12083          	lw	ra,12(sp)
    adbc:	00f42023          	sw	a5,0(s0)
    adc0:	00812403          	lw	s0,8(sp)
    adc4:	01010113          	add	sp,sp,16
    adc8:	00008067          	ret

0000adcc <__errno>:
    adcc:	7fff6517          	auipc	a0,0x7fff6
    add0:	93c52503          	lw	a0,-1732(a0) # 80000708 <_impure_ptr>
    add4:	00008067          	ret

0000add8 <__assert_func>:
    add8:	ff010113          	add	sp,sp,-16
    addc:	00068793          	mv	a5,a3
    ade0:	7fff6717          	auipc	a4,0x7fff6
    ade4:	92872703          	lw	a4,-1752(a4) # 80000708 <_impure_ptr>
    ade8:	00060813          	mv	a6,a2
    adec:	00112623          	sw	ra,12(sp)
    adf0:	00c72883          	lw	a7,12(a4)
    adf4:	00078613          	mv	a2,a5
    adf8:	00050693          	mv	a3,a0
    adfc:	00058713          	mv	a4,a1
    ae00:	00004797          	auipc	a5,0x4
    ae04:	32c78793          	add	a5,a5,812 # f12c <__fini_array_end+0x414>
    ae08:	00080c63          	beqz	a6,ae20 <__assert_func+0x48>
    ae0c:	00004597          	auipc	a1,0x4
    ae10:	33058593          	add	a1,a1,816 # f13c <__fini_array_end+0x424>
    ae14:	00088513          	mv	a0,a7
    ae18:	3a8000ef          	jal	b1c0 <fiprintf>
    ae1c:	3f0000ef          	jal	b20c <abort>
    ae20:	00004797          	auipc	a5,0x4
    ae24:	07c78793          	add	a5,a5,124 # ee9c <__fini_array_end+0x184>
    ae28:	00078813          	mv	a6,a5
    ae2c:	fe1ff06f          	j	ae0c <__assert_func+0x34>

0000ae30 <_calloc_r>:
    ae30:	fe010113          	add	sp,sp,-32
    ae34:	00812c23          	sw	s0,24(sp)
    ae38:	00112e23          	sw	ra,28(sp)
    ae3c:	0105d693          	srl	a3,a1,0x10
    ae40:	00058793          	mv	a5,a1
    ae44:	00050413          	mv	s0,a0
    ae48:	01065713          	srl	a4,a2,0x10
    ae4c:	0c069063          	bnez	a3,af0c <_calloc_r+0xdc>
    ae50:	14071a63          	bnez	a4,afa4 <_calloc_r+0x174>
    ae54:	01061593          	sll	a1,a2,0x10
    ae58:	01079513          	sll	a0,a5,0x10
    ae5c:	0105d593          	srl	a1,a1,0x10
    ae60:	01055513          	srl	a0,a0,0x10
    ae64:	4bd030ef          	jal	eb20 <__mulsi3>
    ae68:	00050593          	mv	a1,a0
    ae6c:	00040513          	mv	a0,s0
    ae70:	f5cf60ef          	jal	15cc <_malloc_r>
    ae74:	00050413          	mv	s0,a0
    ae78:	10050a63          	beqz	a0,af8c <_calloc_r+0x15c>
    ae7c:	ffc52603          	lw	a2,-4(a0)
    ae80:	02400713          	li	a4,36
    ae84:	ffc67613          	and	a2,a2,-4
    ae88:	ffc60613          	add	a2,a2,-4
    ae8c:	04c76863          	bltu	a4,a2,aedc <_calloc_r+0xac>
    ae90:	01300693          	li	a3,19
    ae94:	00050793          	mv	a5,a0
    ae98:	02c6f263          	bgeu	a3,a2,aebc <_calloc_r+0x8c>
    ae9c:	00052023          	sw	zero,0(a0)
    aea0:	00052223          	sw	zero,4(a0)
    aea4:	01b00793          	li	a5,27
    aea8:	04c7f863          	bgeu	a5,a2,aef8 <_calloc_r+0xc8>
    aeac:	00052423          	sw	zero,8(a0)
    aeb0:	00052623          	sw	zero,12(a0)
    aeb4:	01050793          	add	a5,a0,16
    aeb8:	10e60263          	beq	a2,a4,afbc <_calloc_r+0x18c>
    aebc:	0007a023          	sw	zero,0(a5)
    aec0:	0007a223          	sw	zero,4(a5)
    aec4:	0007a423          	sw	zero,8(a5)
    aec8:	01c12083          	lw	ra,28(sp)
    aecc:	00040513          	mv	a0,s0
    aed0:	01812403          	lw	s0,24(sp)
    aed4:	02010113          	add	sp,sp,32
    aed8:	00008067          	ret
    aedc:	00000593          	li	a1,0
    aee0:	f91f50ef          	jal	e70 <memset>
    aee4:	01c12083          	lw	ra,28(sp)
    aee8:	00040513          	mv	a0,s0
    aeec:	01812403          	lw	s0,24(sp)
    aef0:	02010113          	add	sp,sp,32
    aef4:	00008067          	ret
    aef8:	00850793          	add	a5,a0,8
    aefc:	0007a023          	sw	zero,0(a5)
    af00:	0007a223          	sw	zero,4(a5)
    af04:	0007a423          	sw	zero,8(a5)
    af08:	fc1ff06f          	j	aec8 <_calloc_r+0x98>
    af0c:	0c071663          	bnez	a4,afd8 <_calloc_r+0x1a8>
    af10:	01212823          	sw	s2,16(sp)
    af14:	01312623          	sw	s3,12(sp)
    af18:	00912a23          	sw	s1,20(sp)
    af1c:	00068913          	mv	s2,a3
    af20:	00060993          	mv	s3,a2
    af24:	01079513          	sll	a0,a5,0x10
    af28:	01061593          	sll	a1,a2,0x10
    af2c:	0105d593          	srl	a1,a1,0x10
    af30:	01055513          	srl	a0,a0,0x10
    af34:	3ed030ef          	jal	eb20 <__mulsi3>
    af38:	00050493          	mv	s1,a0
    af3c:	01091593          	sll	a1,s2,0x10
    af40:	01099513          	sll	a0,s3,0x10
    af44:	0105d593          	srl	a1,a1,0x10
    af48:	01055513          	srl	a0,a0,0x10
    af4c:	3d5030ef          	jal	eb20 <__mulsi3>
    af50:	0104d793          	srl	a5,s1,0x10
    af54:	00f505b3          	add	a1,a0,a5
    af58:	0105d793          	srl	a5,a1,0x10
    af5c:	06079863          	bnez	a5,afcc <_calloc_r+0x19c>
    af60:	01049493          	sll	s1,s1,0x10
    af64:	0104d493          	srl	s1,s1,0x10
    af68:	01059593          	sll	a1,a1,0x10
    af6c:	0095e5b3          	or	a1,a1,s1
    af70:	00040513          	mv	a0,s0
    af74:	01412483          	lw	s1,20(sp)
    af78:	01012903          	lw	s2,16(sp)
    af7c:	00c12983          	lw	s3,12(sp)
    af80:	e4cf60ef          	jal	15cc <_malloc_r>
    af84:	00050413          	mv	s0,a0
    af88:	ee051ae3          	bnez	a0,ae7c <_calloc_r+0x4c>
    af8c:	00000413          	li	s0,0
    af90:	01c12083          	lw	ra,28(sp)
    af94:	00040513          	mv	a0,s0
    af98:	01812403          	lw	s0,24(sp)
    af9c:	02010113          	add	sp,sp,32
    afa0:	00008067          	ret
    afa4:	01212823          	sw	s2,16(sp)
    afa8:	01312623          	sw	s3,12(sp)
    afac:	00912a23          	sw	s1,20(sp)
    afb0:	00070913          	mv	s2,a4
    afb4:	00058993          	mv	s3,a1
    afb8:	f6dff06f          	j	af24 <_calloc_r+0xf4>
    afbc:	00052823          	sw	zero,16(a0)
    afc0:	01850793          	add	a5,a0,24
    afc4:	00052a23          	sw	zero,20(a0)
    afc8:	ef5ff06f          	j	aebc <_calloc_r+0x8c>
    afcc:	01412483          	lw	s1,20(sp)
    afd0:	01012903          	lw	s2,16(sp)
    afd4:	00c12983          	lw	s3,12(sp)
    afd8:	df5ff0ef          	jal	adcc <__errno>
    afdc:	00c00793          	li	a5,12
    afe0:	00f52023          	sw	a5,0(a0)
    afe4:	00000413          	li	s0,0
    afe8:	fa9ff06f          	j	af90 <_calloc_r+0x160>

0000afec <_wcsnrtombs_l>:
    afec:	fa010113          	add	sp,sp,-96
    aff0:	04912a23          	sw	s1,84(sp)
    aff4:	05212823          	sw	s2,80(sp)
    aff8:	05312623          	sw	s3,76(sp)
    affc:	05412423          	sw	s4,72(sp)
    b000:	05512223          	sw	s5,68(sp)
    b004:	04112e23          	sw	ra,92(sp)
    b008:	03912a23          	sw	s9,52(sp)
    b00c:	03a12823          	sw	s10,48(sp)
    b010:	00a12623          	sw	a0,12(sp)
    b014:	00058a13          	mv	s4,a1
    b018:	00060a93          	mv	s5,a2
    b01c:	00070913          	mv	s2,a4
    b020:	00080993          	mv	s3,a6
    b024:	00078493          	mv	s1,a5
    b028:	12078063          	beqz	a5,b148 <_wcsnrtombs_l+0x15c>
    b02c:	000aac83          	lw	s9,0(s5)
    b030:	120a0263          	beqz	s4,b154 <_wcsnrtombs_l+0x168>
    b034:	14090e63          	beqz	s2,b190 <_wcsnrtombs_l+0x1a4>
    b038:	05612023          	sw	s6,64(sp)
    b03c:	fff68b13          	add	s6,a3,-1
    b040:	16068063          	beqz	a3,b1a0 <_wcsnrtombs_l+0x1b4>
    b044:	04812c23          	sw	s0,88(sp)
    b048:	03b12623          	sw	s11,44(sp)
    b04c:	03712e23          	sw	s7,60(sp)
    b050:	03812c23          	sw	s8,56(sp)
    b054:	000a0413          	mv	s0,s4
    b058:	00000d13          	li	s10,0
    b05c:	fff00d93          	li	s11,-1
    b060:	0240006f          	j	b084 <_wcsnrtombs_l+0x98>
    b064:	080a1a63          	bnez	s4,b0f8 <_wcsnrtombs_l+0x10c>
    b068:	000ca783          	lw	a5,0(s9)
    b06c:	004c8c93          	add	s9,s9,4
    b070:	0c078263          	beqz	a5,b134 <_wcsnrtombs_l+0x148>
    b074:	1326f263          	bgeu	a3,s2,b198 <_wcsnrtombs_l+0x1ac>
    b078:	fffb0b13          	add	s6,s6,-1
    b07c:	00068d13          	mv	s10,a3
    b080:	03bb0c63          	beq	s6,s11,b0b8 <_wcsnrtombs_l+0xcc>
    b084:	0e09a783          	lw	a5,224(s3)
    b088:	000ca603          	lw	a2,0(s9)
    b08c:	00c12503          	lw	a0,12(sp)
    b090:	00048693          	mv	a3,s1
    b094:	01410593          	add	a1,sp,20
    b098:	0004ac03          	lw	s8,0(s1)
    b09c:	0044ab83          	lw	s7,4(s1)
    b0a0:	000780e7          	jalr	a5
    b0a4:	0bb50e63          	beq	a0,s11,b160 <_wcsnrtombs_l+0x174>
    b0a8:	01a506b3          	add	a3,a0,s10
    b0ac:	fad97ce3          	bgeu	s2,a3,b064 <_wcsnrtombs_l+0x78>
    b0b0:	0184a023          	sw	s8,0(s1)
    b0b4:	0174a223          	sw	s7,4(s1)
    b0b8:	05812403          	lw	s0,88(sp)
    b0bc:	04012b03          	lw	s6,64(sp)
    b0c0:	03c12b83          	lw	s7,60(sp)
    b0c4:	03812c03          	lw	s8,56(sp)
    b0c8:	02c12d83          	lw	s11,44(sp)
    b0cc:	05c12083          	lw	ra,92(sp)
    b0d0:	05412483          	lw	s1,84(sp)
    b0d4:	05012903          	lw	s2,80(sp)
    b0d8:	04c12983          	lw	s3,76(sp)
    b0dc:	04812a03          	lw	s4,72(sp)
    b0e0:	04412a83          	lw	s5,68(sp)
    b0e4:	03412c83          	lw	s9,52(sp)
    b0e8:	000d0513          	mv	a0,s10
    b0ec:	03012d03          	lw	s10,48(sp)
    b0f0:	06010113          	add	sp,sp,96
    b0f4:	00008067          	ret
    b0f8:	08a05063          	blez	a0,b178 <_wcsnrtombs_l+0x18c>
    b0fc:	01410893          	add	a7,sp,20
    b100:	00a40533          	add	a0,s0,a0
    b104:	0008c783          	lbu	a5,0(a7)
    b108:	00140413          	add	s0,s0,1
    b10c:	00188893          	add	a7,a7,1
    b110:	fef40fa3          	sb	a5,-1(s0)
    b114:	fe8518e3          	bne	a0,s0,b104 <_wcsnrtombs_l+0x118>
    b118:	000aa783          	lw	a5,0(s5)
    b11c:	00050413          	mv	s0,a0
    b120:	00478793          	add	a5,a5,4
    b124:	00faa023          	sw	a5,0(s5)
    b128:	000ca783          	lw	a5,0(s9)
    b12c:	004c8c93          	add	s9,s9,4
    b130:	f40792e3          	bnez	a5,b074 <_wcsnrtombs_l+0x88>
    b134:	000a0463          	beqz	s4,b13c <_wcsnrtombs_l+0x150>
    b138:	000aa023          	sw	zero,0(s5)
    b13c:	0004a023          	sw	zero,0(s1)
    b140:	fff68d13          	add	s10,a3,-1
    b144:	f75ff06f          	j	b0b8 <_wcsnrtombs_l+0xcc>
    b148:	000aac83          	lw	s9,0(s5)
    b14c:	10c50493          	add	s1,a0,268
    b150:	ee0a12e3          	bnez	s4,b034 <_wcsnrtombs_l+0x48>
    b154:	05612023          	sw	s6,64(sp)
    b158:	fff00913          	li	s2,-1
    b15c:	ee1ff06f          	j	b03c <_wcsnrtombs_l+0x50>
    b160:	00c12703          	lw	a4,12(sp)
    b164:	08a00793          	li	a5,138
    b168:	fff00d13          	li	s10,-1
    b16c:	00f72023          	sw	a5,0(a4)
    b170:	0004a023          	sw	zero,0(s1)
    b174:	f45ff06f          	j	b0b8 <_wcsnrtombs_l+0xcc>
    b178:	000aa783          	lw	a5,0(s5)
    b17c:	00040513          	mv	a0,s0
    b180:	00050413          	mv	s0,a0
    b184:	00478793          	add	a5,a5,4
    b188:	00faa023          	sw	a5,0(s5)
    b18c:	f9dff06f          	j	b128 <_wcsnrtombs_l+0x13c>
    b190:	00000d13          	li	s10,0
    b194:	f39ff06f          	j	b0cc <_wcsnrtombs_l+0xe0>
    b198:	00068d13          	mv	s10,a3
    b19c:	f1dff06f          	j	b0b8 <_wcsnrtombs_l+0xcc>
    b1a0:	04012b03          	lw	s6,64(sp)
    b1a4:	00000d13          	li	s10,0
    b1a8:	f25ff06f          	j	b0cc <_wcsnrtombs_l+0xe0>

0000b1ac <_wcsnrtombs_r>:
    b1ac:	7fff5817          	auipc	a6,0x7fff5
    b1b0:	38880813          	add	a6,a6,904 # 80000534 <__global_locale>
    b1b4:	7fff5517          	auipc	a0,0x7fff5
    b1b8:	55452503          	lw	a0,1364(a0) # 80000708 <_impure_ptr>
    b1bc:	e31ff06f          	j	afec <_wcsnrtombs_l>

0000b1c0 <fiprintf>:
    b1c0:	fc010113          	add	sp,sp,-64
    b1c4:	02810313          	add	t1,sp,40
    b1c8:	02c12423          	sw	a2,40(sp)
    b1cc:	02d12623          	sw	a3,44(sp)
    b1d0:	00058613          	mv	a2,a1
    b1d4:	00030693          	mv	a3,t1
    b1d8:	00050593          	mv	a1,a0
    b1dc:	7fff5517          	auipc	a0,0x7fff5
    b1e0:	52c52503          	lw	a0,1324(a0) # 80000708 <_impure_ptr>
    b1e4:	00112e23          	sw	ra,28(sp)
    b1e8:	02e12823          	sw	a4,48(sp)
    b1ec:	02f12a23          	sw	a5,52(sp)
    b1f0:	03012c23          	sw	a6,56(sp)
    b1f4:	03112e23          	sw	a7,60(sp)
    b1f8:	00612623          	sw	t1,12(sp)
    b1fc:	a9df90ef          	jal	4c98 <_vfiprintf_r>
    b200:	01c12083          	lw	ra,28(sp)
    b204:	04010113          	add	sp,sp,64
    b208:	00008067          	ret

0000b20c <abort>:
    b20c:	ff010113          	add	sp,sp,-16
    b210:	00600513          	li	a0,6
    b214:	00112623          	sw	ra,12(sp)
    b218:	00c000ef          	jal	b224 <raise>
    b21c:	00100513          	li	a0,1
    b220:	829f50ef          	jal	a48 <_exit>

0000b224 <raise>:
    b224:	ff010113          	add	sp,sp,-16
    b228:	00912223          	sw	s1,4(sp)
    b22c:	00112623          	sw	ra,12(sp)
    b230:	01f00793          	li	a5,31
    b234:	7fff5497          	auipc	s1,0x7fff5
    b238:	4d44a483          	lw	s1,1236(s1) # 80000708 <_impure_ptr>
    b23c:	08a7ee63          	bltu	a5,a0,b2d8 <raise+0xb4>
    b240:	1184a783          	lw	a5,280(s1)
    b244:	00812423          	sw	s0,8(sp)
    b248:	00050413          	mv	s0,a0
    b24c:	04078263          	beqz	a5,b290 <raise+0x6c>
    b250:	00251713          	sll	a4,a0,0x2
    b254:	00e787b3          	add	a5,a5,a4
    b258:	0007a703          	lw	a4,0(a5)
    b25c:	02070a63          	beqz	a4,b290 <raise+0x6c>
    b260:	00100693          	li	a3,1
    b264:	00d70a63          	beq	a4,a3,b278 <raise+0x54>
    b268:	fff00693          	li	a3,-1
    b26c:	04d70663          	beq	a4,a3,b2b8 <raise+0x94>
    b270:	0007a023          	sw	zero,0(a5)
    b274:	000700e7          	jalr	a4
    b278:	00812403          	lw	s0,8(sp)
    b27c:	00000513          	li	a0,0
    b280:	00c12083          	lw	ra,12(sp)
    b284:	00412483          	lw	s1,4(sp)
    b288:	01010113          	add	sp,sp,16
    b28c:	00008067          	ret
    b290:	00048513          	mv	a0,s1
    b294:	0b4000ef          	jal	b348 <_getpid_r>
    b298:	00040613          	mv	a2,s0
    b29c:	00812403          	lw	s0,8(sp)
    b2a0:	00c12083          	lw	ra,12(sp)
    b2a4:	00050593          	mv	a1,a0
    b2a8:	00048513          	mv	a0,s1
    b2ac:	00412483          	lw	s1,4(sp)
    b2b0:	01010113          	add	sp,sp,16
    b2b4:	0340006f          	j	b2e8 <_kill_r>
    b2b8:	00812403          	lw	s0,8(sp)
    b2bc:	00c12083          	lw	ra,12(sp)
    b2c0:	01600793          	li	a5,22
    b2c4:	00f4a023          	sw	a5,0(s1)
    b2c8:	00100513          	li	a0,1
    b2cc:	00412483          	lw	s1,4(sp)
    b2d0:	01010113          	add	sp,sp,16
    b2d4:	00008067          	ret
    b2d8:	01600793          	li	a5,22
    b2dc:	00f4a023          	sw	a5,0(s1)
    b2e0:	fff00513          	li	a0,-1
    b2e4:	f9dff06f          	j	b280 <raise+0x5c>

0000b2e8 <_kill_r>:
    b2e8:	ff010113          	add	sp,sp,-16
    b2ec:	00058713          	mv	a4,a1
    b2f0:	00812423          	sw	s0,8(sp)
    b2f4:	00060593          	mv	a1,a2
    b2f8:	00050413          	mv	s0,a0
    b2fc:	00070513          	mv	a0,a4
    b300:	7fff5797          	auipc	a5,0x7fff5
    b304:	4007ac23          	sw	zero,1048(a5) # 80000718 <errno>
    b308:	00112623          	sw	ra,12(sp)
    b30c:	f74f50ef          	jal	a80 <_kill>
    b310:	fff00793          	li	a5,-1
    b314:	00f50a63          	beq	a0,a5,b328 <_kill_r+0x40>
    b318:	00c12083          	lw	ra,12(sp)
    b31c:	00812403          	lw	s0,8(sp)
    b320:	01010113          	add	sp,sp,16
    b324:	00008067          	ret
    b328:	7fff5797          	auipc	a5,0x7fff5
    b32c:	3f07a783          	lw	a5,1008(a5) # 80000718 <errno>
    b330:	fe0784e3          	beqz	a5,b318 <_kill_r+0x30>
    b334:	00c12083          	lw	ra,12(sp)
    b338:	00f42023          	sw	a5,0(s0)
    b33c:	00812403          	lw	s0,8(sp)
    b340:	01010113          	add	sp,sp,16
    b344:	00008067          	ret

0000b348 <_getpid_r>:
    b348:	f28f506f          	j	a70 <_getpid>

0000b34c <__udivdi3>:
    b34c:	fd010113          	add	sp,sp,-48
    b350:	01312e23          	sw	s3,28(sp)
    b354:	02112623          	sw	ra,44(sp)
    b358:	01612823          	sw	s6,16(sp)
    b35c:	00050993          	mv	s3,a0
    b360:	16069663          	bnez	a3,b4cc <__udivdi3+0x180>
    b364:	02812423          	sw	s0,40(sp)
    b368:	01512a23          	sw	s5,20(sp)
    b36c:	02912223          	sw	s1,36(sp)
    b370:	03212023          	sw	s2,32(sp)
    b374:	01412c23          	sw	s4,24(sp)
    b378:	00060a93          	mv	s5,a2
    b37c:	00050413          	mv	s0,a0
    b380:	1cc5f063          	bgeu	a1,a2,b540 <__udivdi3+0x1f4>
    b384:	000107b7          	lui	a5,0x10
    b388:	00058493          	mv	s1,a1
    b38c:	2af66e63          	bltu	a2,a5,b648 <__udivdi3+0x2fc>
    b390:	010007b7          	lui	a5,0x1000
    b394:	01800713          	li	a4,24
    b398:	00f67463          	bgeu	a2,a5,b3a0 <__udivdi3+0x54>
    b39c:	01000713          	li	a4,16
    b3a0:	00e656b3          	srl	a3,a2,a4
    b3a4:	00004797          	auipc	a5,0x4
    b3a8:	3bc78793          	add	a5,a5,956 # f760 <__clz_tab>
    b3ac:	00d787b3          	add	a5,a5,a3
    b3b0:	0007c783          	lbu	a5,0(a5)
    b3b4:	02000693          	li	a3,32
    b3b8:	00e787b3          	add	a5,a5,a4
    b3bc:	40f68733          	sub	a4,a3,a5
    b3c0:	00f68c63          	beq	a3,a5,b3d8 <__udivdi3+0x8c>
    b3c4:	00e594b3          	sll	s1,a1,a4
    b3c8:	00f9d7b3          	srl	a5,s3,a5
    b3cc:	00e61ab3          	sll	s5,a2,a4
    b3d0:	0097e4b3          	or	s1,a5,s1
    b3d4:	00e99433          	sll	s0,s3,a4
    b3d8:	010ada13          	srl	s4,s5,0x10
    b3dc:	000a0593          	mv	a1,s4
    b3e0:	00048513          	mv	a0,s1
    b3e4:	010a9b13          	sll	s6,s5,0x10
    b3e8:	7fc030ef          	jal	ebe4 <__hidden___udivsi3>
    b3ec:	010b5b13          	srl	s6,s6,0x10
    b3f0:	00050593          	mv	a1,a0
    b3f4:	00050913          	mv	s2,a0
    b3f8:	000b0513          	mv	a0,s6
    b3fc:	724030ef          	jal	eb20 <__mulsi3>
    b400:	00050793          	mv	a5,a0
    b404:	000a0593          	mv	a1,s4
    b408:	00048513          	mv	a0,s1
    b40c:	00078493          	mv	s1,a5
    b410:	01d030ef          	jal	ec2c <__umodsi3>
    b414:	01051513          	sll	a0,a0,0x10
    b418:	01045793          	srl	a5,s0,0x10
    b41c:	00a7e7b3          	or	a5,a5,a0
    b420:	0097fc63          	bgeu	a5,s1,b438 <__udivdi3+0xec>
    b424:	00fa87b3          	add	a5,s5,a5
    b428:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0x2e7>
    b42c:	0157e463          	bltu	a5,s5,b434 <__udivdi3+0xe8>
    b430:	5a97e863          	bltu	a5,s1,b9e0 <__udivdi3+0x694>
    b434:	00070913          	mv	s2,a4
    b438:	409784b3          	sub	s1,a5,s1
    b43c:	000a0593          	mv	a1,s4
    b440:	00048513          	mv	a0,s1
    b444:	7a0030ef          	jal	ebe4 <__hidden___udivsi3>
    b448:	00050593          	mv	a1,a0
    b44c:	00050993          	mv	s3,a0
    b450:	000b0513          	mv	a0,s6
    b454:	6cc030ef          	jal	eb20 <__mulsi3>
    b458:	00050793          	mv	a5,a0
    b45c:	000a0593          	mv	a1,s4
    b460:	00048513          	mv	a0,s1
    b464:	01041413          	sll	s0,s0,0x10
    b468:	00078493          	mv	s1,a5
    b46c:	7c0030ef          	jal	ec2c <__umodsi3>
    b470:	01051513          	sll	a0,a0,0x10
    b474:	01045413          	srl	s0,s0,0x10
    b478:	00a46433          	or	s0,s0,a0
    b47c:	00947c63          	bgeu	s0,s1,b494 <__udivdi3+0x148>
    b480:	008a8433          	add	s0,s5,s0
    b484:	fff98793          	add	a5,s3,-1
    b488:	4d546e63          	bltu	s0,s5,b964 <__udivdi3+0x618>
    b48c:	ffe98993          	add	s3,s3,-2
    b490:	4c947a63          	bgeu	s0,s1,b964 <__udivdi3+0x618>
    b494:	01091613          	sll	a2,s2,0x10
    b498:	01366533          	or	a0,a2,s3
    b49c:	00000b13          	li	s6,0
    b4a0:	02812403          	lw	s0,40(sp)
    b4a4:	02c12083          	lw	ra,44(sp)
    b4a8:	02412483          	lw	s1,36(sp)
    b4ac:	02012903          	lw	s2,32(sp)
    b4b0:	01812a03          	lw	s4,24(sp)
    b4b4:	01412a83          	lw	s5,20(sp)
    b4b8:	01c12983          	lw	s3,28(sp)
    b4bc:	000b0593          	mv	a1,s6
    b4c0:	01012b03          	lw	s6,16(sp)
    b4c4:	03010113          	add	sp,sp,48
    b4c8:	00008067          	ret
    b4cc:	02d5f263          	bgeu	a1,a3,b4f0 <__udivdi3+0x1a4>
    b4d0:	00000b13          	li	s6,0
    b4d4:	00000513          	li	a0,0
    b4d8:	02c12083          	lw	ra,44(sp)
    b4dc:	01c12983          	lw	s3,28(sp)
    b4e0:	000b0593          	mv	a1,s6
    b4e4:	01012b03          	lw	s6,16(sp)
    b4e8:	03010113          	add	sp,sp,48
    b4ec:	00008067          	ret
    b4f0:	000107b7          	lui	a5,0x10
    b4f4:	26f6ee63          	bltu	a3,a5,b770 <__udivdi3+0x424>
    b4f8:	01000737          	lui	a4,0x1000
    b4fc:	01800793          	li	a5,24
    b500:	00e6f463          	bgeu	a3,a4,b508 <__udivdi3+0x1bc>
    b504:	01000793          	li	a5,16
    b508:	00f6d533          	srl	a0,a3,a5
    b50c:	00004717          	auipc	a4,0x4
    b510:	25470713          	add	a4,a4,596 # f760 <__clz_tab>
    b514:	00a70733          	add	a4,a4,a0
    b518:	00074703          	lbu	a4,0(a4)
    b51c:	02000513          	li	a0,32
    b520:	00f70733          	add	a4,a4,a5
    b524:	40e50b33          	sub	s6,a0,a4
    b528:	26e51c63          	bne	a0,a4,b7a0 <__udivdi3+0x454>
    b52c:	46b6ee63          	bltu	a3,a1,b9a8 <__udivdi3+0x65c>
    b530:	00c9b533          	sltu	a0,s3,a2
    b534:	00153513          	seqz	a0,a0
    b538:	00000b13          	li	s6,0
    b53c:	f9dff06f          	j	b4d8 <__udivdi3+0x18c>
    b540:	10060c63          	beqz	a2,b658 <__udivdi3+0x30c>
    b544:	000107b7          	lui	a5,0x10
    b548:	44f67663          	bgeu	a2,a5,b994 <__udivdi3+0x648>
    b54c:	10063713          	sltiu	a4,a2,256
    b550:	00173713          	seqz	a4,a4
    b554:	00371713          	sll	a4,a4,0x3
    b558:	00e656b3          	srl	a3,a2,a4
    b55c:	00004797          	auipc	a5,0x4
    b560:	20478793          	add	a5,a5,516 # f760 <__clz_tab>
    b564:	00d787b3          	add	a5,a5,a3
    b568:	0007c483          	lbu	s1,0(a5)
    b56c:	02000793          	li	a5,32
    b570:	00e484b3          	add	s1,s1,a4
    b574:	40978733          	sub	a4,a5,s1
    b578:	10979463          	bne	a5,s1,b680 <__udivdi3+0x334>
    b57c:	01061a13          	sll	s4,a2,0x10
    b580:	40c584b3          	sub	s1,a1,a2
    b584:	01065913          	srl	s2,a2,0x10
    b588:	010a5a13          	srl	s4,s4,0x10
    b58c:	00100b13          	li	s6,1
    b590:	00090593          	mv	a1,s2
    b594:	00048513          	mv	a0,s1
    b598:	64c030ef          	jal	ebe4 <__hidden___udivsi3>
    b59c:	000a0593          	mv	a1,s4
    b5a0:	00050993          	mv	s3,a0
    b5a4:	57c030ef          	jal	eb20 <__mulsi3>
    b5a8:	00050793          	mv	a5,a0
    b5ac:	00090593          	mv	a1,s2
    b5b0:	00048513          	mv	a0,s1
    b5b4:	00078493          	mv	s1,a5
    b5b8:	674030ef          	jal	ec2c <__umodsi3>
    b5bc:	01051513          	sll	a0,a0,0x10
    b5c0:	01045793          	srl	a5,s0,0x10
    b5c4:	00a7e7b3          	or	a5,a5,a0
    b5c8:	0097fc63          	bgeu	a5,s1,b5e0 <__udivdi3+0x294>
    b5cc:	00fa87b3          	add	a5,s5,a5
    b5d0:	fff98713          	add	a4,s3,-1
    b5d4:	0157e463          	bltu	a5,s5,b5dc <__udivdi3+0x290>
    b5d8:	3e97ee63          	bltu	a5,s1,b9d4 <__udivdi3+0x688>
    b5dc:	00070993          	mv	s3,a4
    b5e0:	409784b3          	sub	s1,a5,s1
    b5e4:	00090593          	mv	a1,s2
    b5e8:	00048513          	mv	a0,s1
    b5ec:	5f8030ef          	jal	ebe4 <__hidden___udivsi3>
    b5f0:	000a0593          	mv	a1,s4
    b5f4:	00050a13          	mv	s4,a0
    b5f8:	528030ef          	jal	eb20 <__mulsi3>
    b5fc:	00050793          	mv	a5,a0
    b600:	00090593          	mv	a1,s2
    b604:	00048513          	mv	a0,s1
    b608:	01041413          	sll	s0,s0,0x10
    b60c:	00078493          	mv	s1,a5
    b610:	61c030ef          	jal	ec2c <__umodsi3>
    b614:	01051513          	sll	a0,a0,0x10
    b618:	01045413          	srl	s0,s0,0x10
    b61c:	00a46433          	or	s0,s0,a0
    b620:	00947e63          	bgeu	s0,s1,b63c <__udivdi3+0x2f0>
    b624:	008a8433          	add	s0,s5,s0
    b628:	fffa0793          	add	a5,s4,-1
    b62c:	01546663          	bltu	s0,s5,b638 <__udivdi3+0x2ec>
    b630:	ffea0a13          	add	s4,s4,-2
    b634:	00946463          	bltu	s0,s1,b63c <__udivdi3+0x2f0>
    b638:	00078a13          	mv	s4,a5
    b63c:	01099613          	sll	a2,s3,0x10
    b640:	01466533          	or	a0,a2,s4
    b644:	e5dff06f          	j	b4a0 <__udivdi3+0x154>
    b648:	10063713          	sltiu	a4,a2,256
    b64c:	00173713          	seqz	a4,a4
    b650:	00371713          	sll	a4,a4,0x3
    b654:	d4dff06f          	j	b3a0 <__udivdi3+0x54>
    b658:	00000693          	li	a3,0
    b65c:	00004797          	auipc	a5,0x4
    b660:	10478793          	add	a5,a5,260 # f760 <__clz_tab>
    b664:	00d787b3          	add	a5,a5,a3
    b668:	0007c483          	lbu	s1,0(a5)
    b66c:	00000713          	li	a4,0
    b670:	02000793          	li	a5,32
    b674:	00e484b3          	add	s1,s1,a4
    b678:	40978733          	sub	a4,a5,s1
    b67c:	f09780e3          	beq	a5,s1,b57c <__udivdi3+0x230>
    b680:	00e61ab3          	sll	s5,a2,a4
    b684:	01712623          	sw	s7,12(sp)
    b688:	010ad913          	srl	s2,s5,0x10
    b68c:	0095dbb3          	srl	s7,a1,s1
    b690:	00e597b3          	sll	a5,a1,a4
    b694:	0099d4b3          	srl	s1,s3,s1
    b698:	00090593          	mv	a1,s2
    b69c:	000b8513          	mv	a0,s7
    b6a0:	010a9a13          	sll	s4,s5,0x10
    b6a4:	00f4e4b3          	or	s1,s1,a5
    b6a8:	00e99433          	sll	s0,s3,a4
    b6ac:	010a5a13          	srl	s4,s4,0x10
    b6b0:	534030ef          	jal	ebe4 <__hidden___udivsi3>
    b6b4:	00050593          	mv	a1,a0
    b6b8:	00050b13          	mv	s6,a0
    b6bc:	000a0513          	mv	a0,s4
    b6c0:	460030ef          	jal	eb20 <__mulsi3>
    b6c4:	00050993          	mv	s3,a0
    b6c8:	00090593          	mv	a1,s2
    b6cc:	000b8513          	mv	a0,s7
    b6d0:	55c030ef          	jal	ec2c <__umodsi3>
    b6d4:	01051513          	sll	a0,a0,0x10
    b6d8:	0104d793          	srl	a5,s1,0x10
    b6dc:	00a7e7b3          	or	a5,a5,a0
    b6e0:	0137fe63          	bgeu	a5,s3,b6fc <__udivdi3+0x3b0>
    b6e4:	00fa87b3          	add	a5,s5,a5
    b6e8:	fffb0713          	add	a4,s6,-1
    b6ec:	2d57ec63          	bltu	a5,s5,b9c4 <__udivdi3+0x678>
    b6f0:	2d37fa63          	bgeu	a5,s3,b9c4 <__udivdi3+0x678>
    b6f4:	ffeb0b13          	add	s6,s6,-2
    b6f8:	015787b3          	add	a5,a5,s5
    b6fc:	413789b3          	sub	s3,a5,s3
    b700:	00090593          	mv	a1,s2
    b704:	00098513          	mv	a0,s3
    b708:	4dc030ef          	jal	ebe4 <__hidden___udivsi3>
    b70c:	00050593          	mv	a1,a0
    b710:	00050b93          	mv	s7,a0
    b714:	000a0513          	mv	a0,s4
    b718:	408030ef          	jal	eb20 <__mulsi3>
    b71c:	00050793          	mv	a5,a0
    b720:	00090593          	mv	a1,s2
    b724:	00098513          	mv	a0,s3
    b728:	01049493          	sll	s1,s1,0x10
    b72c:	00078993          	mv	s3,a5
    b730:	4fc030ef          	jal	ec2c <__umodsi3>
    b734:	01051513          	sll	a0,a0,0x10
    b738:	0104d493          	srl	s1,s1,0x10
    b73c:	00a4e4b3          	or	s1,s1,a0
    b740:	0134fe63          	bgeu	s1,s3,b75c <__udivdi3+0x410>
    b744:	009a84b3          	add	s1,s5,s1
    b748:	fffb8793          	add	a5,s7,-1
    b74c:	2754e463          	bltu	s1,s5,b9b4 <__udivdi3+0x668>
    b750:	2734f263          	bgeu	s1,s3,b9b4 <__udivdi3+0x668>
    b754:	ffeb8b93          	add	s7,s7,-2
    b758:	015484b3          	add	s1,s1,s5
    b75c:	010b1b13          	sll	s6,s6,0x10
    b760:	017b6b33          	or	s6,s6,s7
    b764:	413484b3          	sub	s1,s1,s3
    b768:	00c12b83          	lw	s7,12(sp)
    b76c:	e25ff06f          	j	b590 <__udivdi3+0x244>
    b770:	1006b793          	sltiu	a5,a3,256
    b774:	0017b793          	seqz	a5,a5
    b778:	00379793          	sll	a5,a5,0x3
    b77c:	00f6d533          	srl	a0,a3,a5
    b780:	00004717          	auipc	a4,0x4
    b784:	fe070713          	add	a4,a4,-32 # f760 <__clz_tab>
    b788:	00a70733          	add	a4,a4,a0
    b78c:	00074703          	lbu	a4,0(a4)
    b790:	02000513          	li	a0,32
    b794:	00f70733          	add	a4,a4,a5
    b798:	40e50b33          	sub	s6,a0,a4
    b79c:	d8e508e3          	beq	a0,a4,b52c <__udivdi3+0x1e0>
    b7a0:	016696b3          	sll	a3,a3,s6
    b7a4:	01912223          	sw	s9,4(sp)
    b7a8:	00e65cb3          	srl	s9,a2,a4
    b7ac:	00dcecb3          	or	s9,s9,a3
    b7b0:	01512a23          	sw	s5,20(sp)
    b7b4:	01712623          	sw	s7,12(sp)
    b7b8:	010cda93          	srl	s5,s9,0x10
    b7bc:	00e5dbb3          	srl	s7,a1,a4
    b7c0:	016597b3          	sll	a5,a1,s6
    b7c4:	00e9d733          	srl	a4,s3,a4
    b7c8:	01812423          	sw	s8,8(sp)
    b7cc:	000a8593          	mv	a1,s5
    b7d0:	000b8513          	mv	a0,s7
    b7d4:	010c9c13          	sll	s8,s9,0x10
    b7d8:	02812423          	sw	s0,40(sp)
    b7dc:	02912223          	sw	s1,36(sp)
    b7e0:	03212023          	sw	s2,32(sp)
    b7e4:	00f764b3          	or	s1,a4,a5
    b7e8:	01661933          	sll	s2,a2,s6
    b7ec:	01412c23          	sw	s4,24(sp)
    b7f0:	010c5c13          	srl	s8,s8,0x10
    b7f4:	3f0030ef          	jal	ebe4 <__hidden___udivsi3>
    b7f8:	00050593          	mv	a1,a0
    b7fc:	00050413          	mv	s0,a0
    b800:	000c0513          	mv	a0,s8
    b804:	31c030ef          	jal	eb20 <__mulsi3>
    b808:	00050a13          	mv	s4,a0
    b80c:	000a8593          	mv	a1,s5
    b810:	000b8513          	mv	a0,s7
    b814:	418030ef          	jal	ec2c <__umodsi3>
    b818:	01051513          	sll	a0,a0,0x10
    b81c:	0104d793          	srl	a5,s1,0x10
    b820:	00a7e7b3          	or	a5,a5,a0
    b824:	0147fe63          	bgeu	a5,s4,b840 <__udivdi3+0x4f4>
    b828:	00fc87b3          	add	a5,s9,a5
    b82c:	fff40713          	add	a4,s0,-1
    b830:	1997ee63          	bltu	a5,s9,b9cc <__udivdi3+0x680>
    b834:	1947fc63          	bgeu	a5,s4,b9cc <__udivdi3+0x680>
    b838:	ffe40413          	add	s0,s0,-2
    b83c:	019787b3          	add	a5,a5,s9
    b840:	41478a33          	sub	s4,a5,s4
    b844:	000a8593          	mv	a1,s5
    b848:	000a0513          	mv	a0,s4
    b84c:	398030ef          	jal	ebe4 <__hidden___udivsi3>
    b850:	00050593          	mv	a1,a0
    b854:	00050b93          	mv	s7,a0
    b858:	000c0513          	mv	a0,s8
    b85c:	2c4030ef          	jal	eb20 <__mulsi3>
    b860:	00050793          	mv	a5,a0
    b864:	000a8593          	mv	a1,s5
    b868:	000a0513          	mv	a0,s4
    b86c:	00078a13          	mv	s4,a5
    b870:	3bc030ef          	jal	ec2c <__umodsi3>
    b874:	01049713          	sll	a4,s1,0x10
    b878:	01051513          	sll	a0,a0,0x10
    b87c:	01075713          	srl	a4,a4,0x10
    b880:	00a76733          	or	a4,a4,a0
    b884:	01477e63          	bgeu	a4,s4,b8a0 <__udivdi3+0x554>
    b888:	00ec8733          	add	a4,s9,a4
    b88c:	fffb8793          	add	a5,s7,-1
    b890:	13976663          	bltu	a4,s9,b9bc <__udivdi3+0x670>
    b894:	13477463          	bgeu	a4,s4,b9bc <__udivdi3+0x670>
    b898:	ffeb8b93          	add	s7,s7,-2
    b89c:	01970733          	add	a4,a4,s9
    b8a0:	00010e37          	lui	t3,0x10
    b8a4:	01041413          	sll	s0,s0,0x10
    b8a8:	01746433          	or	s0,s0,s7
    b8ac:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    b8b0:	00f47833          	and	a6,s0,a5
    b8b4:	00f977b3          	and	a5,s2,a5
    b8b8:	41470733          	sub	a4,a4,s4
    b8bc:	01045e93          	srl	t4,s0,0x10
    b8c0:	01095913          	srl	s2,s2,0x10
    b8c4:	00080513          	mv	a0,a6
    b8c8:	00078593          	mv	a1,a5
    b8cc:	254030ef          	jal	eb20 <__mulsi3>
    b8d0:	00050313          	mv	t1,a0
    b8d4:	00090593          	mv	a1,s2
    b8d8:	00080513          	mv	a0,a6
    b8dc:	244030ef          	jal	eb20 <__mulsi3>
    b8e0:	00050813          	mv	a6,a0
    b8e4:	00078593          	mv	a1,a5
    b8e8:	000e8513          	mv	a0,t4
    b8ec:	234030ef          	jal	eb20 <__mulsi3>
    b8f0:	00050893          	mv	a7,a0
    b8f4:	00090593          	mv	a1,s2
    b8f8:	000e8513          	mv	a0,t4
    b8fc:	224030ef          	jal	eb20 <__mulsi3>
    b900:	01035793          	srl	a5,t1,0x10
    b904:	01180833          	add	a6,a6,a7
    b908:	010787b3          	add	a5,a5,a6
    b90c:	0117f463          	bgeu	a5,a7,b914 <__udivdi3+0x5c8>
    b910:	01c50533          	add	a0,a0,t3
    b914:	0107d693          	srl	a3,a5,0x10
    b918:	00a686b3          	add	a3,a3,a0
    b91c:	06d76863          	bltu	a4,a3,b98c <__udivdi3+0x640>
    b920:	04d70663          	beq	a4,a3,b96c <__udivdi3+0x620>
    b924:	00040513          	mv	a0,s0
    b928:	02812403          	lw	s0,40(sp)
    b92c:	02c12083          	lw	ra,44(sp)
    b930:	00000b13          	li	s6,0
    b934:	02412483          	lw	s1,36(sp)
    b938:	02012903          	lw	s2,32(sp)
    b93c:	01812a03          	lw	s4,24(sp)
    b940:	01412a83          	lw	s5,20(sp)
    b944:	00c12b83          	lw	s7,12(sp)
    b948:	00812c03          	lw	s8,8(sp)
    b94c:	00412c83          	lw	s9,4(sp)
    b950:	01c12983          	lw	s3,28(sp)
    b954:	000b0593          	mv	a1,s6
    b958:	01012b03          	lw	s6,16(sp)
    b95c:	03010113          	add	sp,sp,48
    b960:	00008067          	ret
    b964:	00078993          	mv	s3,a5
    b968:	b2dff06f          	j	b494 <__udivdi3+0x148>
    b96c:	00010737          	lui	a4,0x10
    b970:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    b974:	00e7f7b3          	and	a5,a5,a4
    b978:	01079793          	sll	a5,a5,0x10
    b97c:	00e37333          	and	t1,t1,a4
    b980:	01699533          	sll	a0,s3,s6
    b984:	006787b3          	add	a5,a5,t1
    b988:	f8f57ee3          	bgeu	a0,a5,b924 <__udivdi3+0x5d8>
    b98c:	fff40513          	add	a0,s0,-1
    b990:	f99ff06f          	j	b928 <__udivdi3+0x5dc>
    b994:	010007b7          	lui	a5,0x1000
    b998:	04f67a63          	bgeu	a2,a5,b9ec <__udivdi3+0x6a0>
    b99c:	01065693          	srl	a3,a2,0x10
    b9a0:	01000713          	li	a4,16
    b9a4:	bb9ff06f          	j	b55c <__udivdi3+0x210>
    b9a8:	00000b13          	li	s6,0
    b9ac:	00100513          	li	a0,1
    b9b0:	b29ff06f          	j	b4d8 <__udivdi3+0x18c>
    b9b4:	00078b93          	mv	s7,a5
    b9b8:	da5ff06f          	j	b75c <__udivdi3+0x410>
    b9bc:	00078b93          	mv	s7,a5
    b9c0:	ee1ff06f          	j	b8a0 <__udivdi3+0x554>
    b9c4:	00070b13          	mv	s6,a4
    b9c8:	d35ff06f          	j	b6fc <__udivdi3+0x3b0>
    b9cc:	00070413          	mv	s0,a4
    b9d0:	e71ff06f          	j	b840 <__udivdi3+0x4f4>
    b9d4:	ffe98993          	add	s3,s3,-2
    b9d8:	015787b3          	add	a5,a5,s5
    b9dc:	c05ff06f          	j	b5e0 <__udivdi3+0x294>
    b9e0:	ffe90913          	add	s2,s2,-2
    b9e4:	015787b3          	add	a5,a5,s5
    b9e8:	a51ff06f          	j	b438 <__udivdi3+0xec>
    b9ec:	01865693          	srl	a3,a2,0x18
    b9f0:	01800713          	li	a4,24
    b9f4:	b69ff06f          	j	b55c <__udivdi3+0x210>

0000b9f8 <__umoddi3>:
    b9f8:	fd010113          	add	sp,sp,-48
    b9fc:	02112623          	sw	ra,44(sp)
    ba00:	00050793          	mv	a5,a0
    ba04:	14069663          	bnez	a3,bb50 <__umoddi3+0x158>
    ba08:	03212023          	sw	s2,32(sp)
    ba0c:	01412c23          	sw	s4,24(sp)
    ba10:	02812423          	sw	s0,40(sp)
    ba14:	02912223          	sw	s1,36(sp)
    ba18:	01312e23          	sw	s3,28(sp)
    ba1c:	01512a23          	sw	s5,20(sp)
    ba20:	00060a13          	mv	s4,a2
    ba24:	00050913          	mv	s2,a0
    ba28:	1ac5f663          	bgeu	a1,a2,bbd4 <__umoddi3+0x1dc>
    ba2c:	01612823          	sw	s6,16(sp)
    ba30:	00010737          	lui	a4,0x10
    ba34:	00058993          	mv	s3,a1
    ba38:	28e66063          	bltu	a2,a4,bcb8 <__umoddi3+0x2c0>
    ba3c:	01000737          	lui	a4,0x1000
    ba40:	01800693          	li	a3,24
    ba44:	00e67463          	bgeu	a2,a4,ba4c <__umoddi3+0x54>
    ba48:	01000693          	li	a3,16
    ba4c:	00d65533          	srl	a0,a2,a3
    ba50:	00004717          	auipc	a4,0x4
    ba54:	d1070713          	add	a4,a4,-752 # f760 <__clz_tab>
    ba58:	00a70733          	add	a4,a4,a0
    ba5c:	00074703          	lbu	a4,0(a4)
    ba60:	02000513          	li	a0,32
    ba64:	00d70733          	add	a4,a4,a3
    ba68:	40e504b3          	sub	s1,a0,a4
    ba6c:	00e50c63          	beq	a0,a4,ba84 <__umoddi3+0x8c>
    ba70:	009599b3          	sll	s3,a1,s1
    ba74:	00e7d733          	srl	a4,a5,a4
    ba78:	00961a33          	sll	s4,a2,s1
    ba7c:	013769b3          	or	s3,a4,s3
    ba80:	00979933          	sll	s2,a5,s1
    ba84:	010a5a93          	srl	s5,s4,0x10
    ba88:	000a8593          	mv	a1,s5
    ba8c:	00098513          	mv	a0,s3
    ba90:	010a1b13          	sll	s6,s4,0x10
    ba94:	150030ef          	jal	ebe4 <__hidden___udivsi3>
    ba98:	010b5b13          	srl	s6,s6,0x10
    ba9c:	000b0593          	mv	a1,s6
    baa0:	080030ef          	jal	eb20 <__mulsi3>
    baa4:	00050413          	mv	s0,a0
    baa8:	000a8593          	mv	a1,s5
    baac:	00098513          	mv	a0,s3
    bab0:	17c030ef          	jal	ec2c <__umodsi3>
    bab4:	01051513          	sll	a0,a0,0x10
    bab8:	01095793          	srl	a5,s2,0x10
    babc:	00a7e7b3          	or	a5,a5,a0
    bac0:	0087f863          	bgeu	a5,s0,bad0 <__umoddi3+0xd8>
    bac4:	00fa07b3          	add	a5,s4,a5
    bac8:	0147e463          	bltu	a5,s4,bad0 <__umoddi3+0xd8>
    bacc:	5687e863          	bltu	a5,s0,c03c <__umoddi3+0x644>
    bad0:	40878433          	sub	s0,a5,s0
    bad4:	000a8593          	mv	a1,s5
    bad8:	00040513          	mv	a0,s0
    badc:	108030ef          	jal	ebe4 <__hidden___udivsi3>
    bae0:	000b0593          	mv	a1,s6
    bae4:	03c030ef          	jal	eb20 <__mulsi3>
    bae8:	00050793          	mv	a5,a0
    baec:	000a8593          	mv	a1,s5
    baf0:	00040513          	mv	a0,s0
    baf4:	00078413          	mv	s0,a5
    baf8:	134030ef          	jal	ec2c <__umodsi3>
    bafc:	01091793          	sll	a5,s2,0x10
    bb00:	01051513          	sll	a0,a0,0x10
    bb04:	0107d793          	srl	a5,a5,0x10
    bb08:	00a7e7b3          	or	a5,a5,a0
    bb0c:	0087f863          	bgeu	a5,s0,bb1c <__umoddi3+0x124>
    bb10:	00fa07b3          	add	a5,s4,a5
    bb14:	0147e463          	bltu	a5,s4,bb1c <__umoddi3+0x124>
    bb18:	5087ea63          	bltu	a5,s0,c02c <__umoddi3+0x634>
    bb1c:	01012b03          	lw	s6,16(sp)
    bb20:	408787b3          	sub	a5,a5,s0
    bb24:	0097d533          	srl	a0,a5,s1
    bb28:	02812403          	lw	s0,40(sp)
    bb2c:	02412483          	lw	s1,36(sp)
    bb30:	02012903          	lw	s2,32(sp)
    bb34:	01c12983          	lw	s3,28(sp)
    bb38:	01812a03          	lw	s4,24(sp)
    bb3c:	01412a83          	lw	s5,20(sp)
    bb40:	00000593          	li	a1,0
    bb44:	02c12083          	lw	ra,44(sp)
    bb48:	03010113          	add	sp,sp,48
    bb4c:	00008067          	ret
    bb50:	00050893          	mv	a7,a0
    bb54:	fed5e8e3          	bltu	a1,a3,bb44 <__umoddi3+0x14c>
    bb58:	03212023          	sw	s2,32(sp)
    bb5c:	01312e23          	sw	s3,28(sp)
    bb60:	00010737          	lui	a4,0x10
    bb64:	00058813          	mv	a6,a1
    bb68:	24e6ec63          	bltu	a3,a4,bdc0 <__umoddi3+0x3c8>
    bb6c:	01000737          	lui	a4,0x1000
    bb70:	01800513          	li	a0,24
    bb74:	00e6f463          	bgeu	a3,a4,bb7c <__umoddi3+0x184>
    bb78:	01000513          	li	a0,16
    bb7c:	00a6d333          	srl	t1,a3,a0
    bb80:	00004717          	auipc	a4,0x4
    bb84:	be070713          	add	a4,a4,-1056 # f760 <__clz_tab>
    bb88:	00670733          	add	a4,a4,t1
    bb8c:	00074703          	lbu	a4,0(a4)
    bb90:	02000313          	li	t1,32
    bb94:	00a709b3          	add	s3,a4,a0
    bb98:	41330933          	sub	s2,t1,s3
    bb9c:	25331a63          	bne	t1,s3,bdf0 <__umoddi3+0x3f8>
    bba0:	00b6e463          	bltu	a3,a1,bba8 <__umoddi3+0x1b0>
    bba4:	00c7ea63          	bltu	a5,a2,bbb8 <__umoddi3+0x1c0>
    bba8:	40c788b3          	sub	a7,a5,a2
    bbac:	40d586b3          	sub	a3,a1,a3
    bbb0:	0117b833          	sltu	a6,a5,a7
    bbb4:	41068833          	sub	a6,a3,a6
    bbb8:	02c12083          	lw	ra,44(sp)
    bbbc:	02012903          	lw	s2,32(sp)
    bbc0:	01c12983          	lw	s3,28(sp)
    bbc4:	00088513          	mv	a0,a7
    bbc8:	00080593          	mv	a1,a6
    bbcc:	03010113          	add	sp,sp,48
    bbd0:	00008067          	ret
    bbd4:	0e060a63          	beqz	a2,bcc8 <__umoddi3+0x2d0>
    bbd8:	00010737          	lui	a4,0x10
    bbdc:	42e67663          	bgeu	a2,a4,c008 <__umoddi3+0x610>
    bbe0:	10063693          	sltiu	a3,a2,256
    bbe4:	0016b693          	seqz	a3,a3
    bbe8:	00369693          	sll	a3,a3,0x3
    bbec:	00d65533          	srl	a0,a2,a3
    bbf0:	00004717          	auipc	a4,0x4
    bbf4:	b7070713          	add	a4,a4,-1168 # f760 <__clz_tab>
    bbf8:	00a70733          	add	a4,a4,a0
    bbfc:	00074983          	lbu	s3,0(a4)
    bc00:	02000713          	li	a4,32
    bc04:	00d989b3          	add	s3,s3,a3
    bc08:	413704b3          	sub	s1,a4,s3
    bc0c:	0f371263          	bne	a4,s3,bcf0 <__umoddi3+0x2f8>
    bc10:	01061413          	sll	s0,a2,0x10
    bc14:	40c589b3          	sub	s3,a1,a2
    bc18:	01065a93          	srl	s5,a2,0x10
    bc1c:	01045413          	srl	s0,s0,0x10
    bc20:	000a8593          	mv	a1,s5
    bc24:	00098513          	mv	a0,s3
    bc28:	7bd020ef          	jal	ebe4 <__hidden___udivsi3>
    bc2c:	00040593          	mv	a1,s0
    bc30:	6f1020ef          	jal	eb20 <__mulsi3>
    bc34:	00050793          	mv	a5,a0
    bc38:	000a8593          	mv	a1,s5
    bc3c:	00098513          	mv	a0,s3
    bc40:	00078993          	mv	s3,a5
    bc44:	7e9020ef          	jal	ec2c <__umodsi3>
    bc48:	01051513          	sll	a0,a0,0x10
    bc4c:	01095793          	srl	a5,s2,0x10
    bc50:	00a7e7b3          	or	a5,a5,a0
    bc54:	0137f863          	bgeu	a5,s3,bc64 <__umoddi3+0x26c>
    bc58:	00fa07b3          	add	a5,s4,a5
    bc5c:	0147e463          	bltu	a5,s4,bc64 <__umoddi3+0x26c>
    bc60:	3d37ea63          	bltu	a5,s3,c034 <__umoddi3+0x63c>
    bc64:	413789b3          	sub	s3,a5,s3
    bc68:	000a8593          	mv	a1,s5
    bc6c:	00098513          	mv	a0,s3
    bc70:	775020ef          	jal	ebe4 <__hidden___udivsi3>
    bc74:	00040593          	mv	a1,s0
    bc78:	6a9020ef          	jal	eb20 <__mulsi3>
    bc7c:	00050413          	mv	s0,a0
    bc80:	000a8593          	mv	a1,s5
    bc84:	00098513          	mv	a0,s3
    bc88:	7a5020ef          	jal	ec2c <__umodsi3>
    bc8c:	01091913          	sll	s2,s2,0x10
    bc90:	01051793          	sll	a5,a0,0x10
    bc94:	01095913          	srl	s2,s2,0x10
    bc98:	00f967b3          	or	a5,s2,a5
    bc9c:	0087fa63          	bgeu	a5,s0,bcb0 <__umoddi3+0x2b8>
    bca0:	00fa07b3          	add	a5,s4,a5
    bca4:	0147e663          	bltu	a5,s4,bcb0 <__umoddi3+0x2b8>
    bca8:	0087f463          	bgeu	a5,s0,bcb0 <__umoddi3+0x2b8>
    bcac:	014787b3          	add	a5,a5,s4
    bcb0:	408787b3          	sub	a5,a5,s0
    bcb4:	e71ff06f          	j	bb24 <__umoddi3+0x12c>
    bcb8:	10063693          	sltiu	a3,a2,256
    bcbc:	0016b693          	seqz	a3,a3
    bcc0:	00369693          	sll	a3,a3,0x3
    bcc4:	d89ff06f          	j	ba4c <__umoddi3+0x54>
    bcc8:	00000513          	li	a0,0
    bccc:	00004717          	auipc	a4,0x4
    bcd0:	a9470713          	add	a4,a4,-1388 # f760 <__clz_tab>
    bcd4:	00a70733          	add	a4,a4,a0
    bcd8:	00074983          	lbu	s3,0(a4)
    bcdc:	00000693          	li	a3,0
    bce0:	02000713          	li	a4,32
    bce4:	00d989b3          	add	s3,s3,a3
    bce8:	413704b3          	sub	s1,a4,s3
    bcec:	f33702e3          	beq	a4,s3,bc10 <__umoddi3+0x218>
    bcf0:	00961a33          	sll	s4,a2,s1
    bcf4:	01712623          	sw	s7,12(sp)
    bcf8:	010a5a93          	srl	s5,s4,0x10
    bcfc:	0135dbb3          	srl	s7,a1,s3
    bd00:	00959733          	sll	a4,a1,s1
    bd04:	0137d9b3          	srl	s3,a5,s3
    bd08:	000a8593          	mv	a1,s5
    bd0c:	000b8513          	mv	a0,s7
    bd10:	010a1413          	sll	s0,s4,0x10
    bd14:	00e9e9b3          	or	s3,s3,a4
    bd18:	00979933          	sll	s2,a5,s1
    bd1c:	01612823          	sw	s6,16(sp)
    bd20:	01045413          	srl	s0,s0,0x10
    bd24:	6c1020ef          	jal	ebe4 <__hidden___udivsi3>
    bd28:	00040593          	mv	a1,s0
    bd2c:	5f5020ef          	jal	eb20 <__mulsi3>
    bd30:	00050b13          	mv	s6,a0
    bd34:	000a8593          	mv	a1,s5
    bd38:	000b8513          	mv	a0,s7
    bd3c:	6f1020ef          	jal	ec2c <__umodsi3>
    bd40:	01051513          	sll	a0,a0,0x10
    bd44:	0109d793          	srl	a5,s3,0x10
    bd48:	00a7e7b3          	or	a5,a5,a0
    bd4c:	0167fa63          	bgeu	a5,s6,bd60 <__umoddi3+0x368>
    bd50:	00fa07b3          	add	a5,s4,a5
    bd54:	0147e663          	bltu	a5,s4,bd60 <__umoddi3+0x368>
    bd58:	0167f463          	bgeu	a5,s6,bd60 <__umoddi3+0x368>
    bd5c:	014787b3          	add	a5,a5,s4
    bd60:	41678b33          	sub	s6,a5,s6
    bd64:	000a8593          	mv	a1,s5
    bd68:	000b0513          	mv	a0,s6
    bd6c:	679020ef          	jal	ebe4 <__hidden___udivsi3>
    bd70:	00040593          	mv	a1,s0
    bd74:	5ad020ef          	jal	eb20 <__mulsi3>
    bd78:	00050793          	mv	a5,a0
    bd7c:	000a8593          	mv	a1,s5
    bd80:	000b0513          	mv	a0,s6
    bd84:	01099993          	sll	s3,s3,0x10
    bd88:	00078b13          	mv	s6,a5
    bd8c:	6a1020ef          	jal	ec2c <__umodsi3>
    bd90:	01051513          	sll	a0,a0,0x10
    bd94:	0109d993          	srl	s3,s3,0x10
    bd98:	00a9e9b3          	or	s3,s3,a0
    bd9c:	0169fa63          	bgeu	s3,s6,bdb0 <__umoddi3+0x3b8>
    bda0:	013a09b3          	add	s3,s4,s3
    bda4:	0149e663          	bltu	s3,s4,bdb0 <__umoddi3+0x3b8>
    bda8:	0169f463          	bgeu	s3,s6,bdb0 <__umoddi3+0x3b8>
    bdac:	014989b3          	add	s3,s3,s4
    bdb0:	416989b3          	sub	s3,s3,s6
    bdb4:	00c12b83          	lw	s7,12(sp)
    bdb8:	01012b03          	lw	s6,16(sp)
    bdbc:	e65ff06f          	j	bc20 <__umoddi3+0x228>
    bdc0:	1006b513          	sltiu	a0,a3,256
    bdc4:	00153513          	seqz	a0,a0
    bdc8:	00351513          	sll	a0,a0,0x3
    bdcc:	00a6d333          	srl	t1,a3,a0
    bdd0:	00004717          	auipc	a4,0x4
    bdd4:	99070713          	add	a4,a4,-1648 # f760 <__clz_tab>
    bdd8:	00670733          	add	a4,a4,t1
    bddc:	00074703          	lbu	a4,0(a4)
    bde0:	02000313          	li	t1,32
    bde4:	00a709b3          	add	s3,a4,a0
    bde8:	41330933          	sub	s2,t1,s3
    bdec:	db330ae3          	beq	t1,s3,bba0 <__umoddi3+0x1a8>
    bdf0:	01512a23          	sw	s5,20(sp)
    bdf4:	012696b3          	sll	a3,a3,s2
    bdf8:	01365ab3          	srl	s5,a2,s3
    bdfc:	00daeab3          	or	s5,s5,a3
    be00:	01712623          	sw	s7,12(sp)
    be04:	01a12023          	sw	s10,0(sp)
    be08:	010adb93          	srl	s7,s5,0x10
    be0c:	0135dd33          	srl	s10,a1,s3
    be10:	01259733          	sll	a4,a1,s2
    be14:	0137d6b3          	srl	a3,a5,s3
    be18:	01912223          	sw	s9,4(sp)
    be1c:	000b8593          	mv	a1,s7
    be20:	000d0513          	mv	a0,s10
    be24:	010a9c93          	sll	s9,s5,0x10
    be28:	02812423          	sw	s0,40(sp)
    be2c:	02912223          	sw	s1,36(sp)
    be30:	01261433          	sll	s0,a2,s2
    be34:	012794b3          	sll	s1,a5,s2
    be38:	01412c23          	sw	s4,24(sp)
    be3c:	01612823          	sw	s6,16(sp)
    be40:	00e6ea33          	or	s4,a3,a4
    be44:	01812423          	sw	s8,8(sp)
    be48:	010cdc93          	srl	s9,s9,0x10
    be4c:	599020ef          	jal	ebe4 <__hidden___udivsi3>
    be50:	00050593          	mv	a1,a0
    be54:	00050b13          	mv	s6,a0
    be58:	000c8513          	mv	a0,s9
    be5c:	4c5020ef          	jal	eb20 <__mulsi3>
    be60:	00050c13          	mv	s8,a0
    be64:	000b8593          	mv	a1,s7
    be68:	000d0513          	mv	a0,s10
    be6c:	5c1020ef          	jal	ec2c <__umodsi3>
    be70:	01051513          	sll	a0,a0,0x10
    be74:	010a5793          	srl	a5,s4,0x10
    be78:	00a7e7b3          	or	a5,a5,a0
    be7c:	0187fe63          	bgeu	a5,s8,be98 <__umoddi3+0x4a0>
    be80:	00fa87b3          	add	a5,s5,a5
    be84:	fffb0713          	add	a4,s6,-1
    be88:	1957ee63          	bltu	a5,s5,c024 <__umoddi3+0x62c>
    be8c:	1987fc63          	bgeu	a5,s8,c024 <__umoddi3+0x62c>
    be90:	ffeb0b13          	add	s6,s6,-2
    be94:	015787b3          	add	a5,a5,s5
    be98:	41878c33          	sub	s8,a5,s8
    be9c:	000b8593          	mv	a1,s7
    bea0:	000c0513          	mv	a0,s8
    bea4:	541020ef          	jal	ebe4 <__hidden___udivsi3>
    bea8:	00050593          	mv	a1,a0
    beac:	00050d13          	mv	s10,a0
    beb0:	000c8513          	mv	a0,s9
    beb4:	46d020ef          	jal	eb20 <__mulsi3>
    beb8:	00050793          	mv	a5,a0
    bebc:	000b8593          	mv	a1,s7
    bec0:	000c0513          	mv	a0,s8
    bec4:	00078b93          	mv	s7,a5
    bec8:	565020ef          	jal	ec2c <__umodsi3>
    becc:	010a1593          	sll	a1,s4,0x10
    bed0:	01051513          	sll	a0,a0,0x10
    bed4:	0105d593          	srl	a1,a1,0x10
    bed8:	00a5e5b3          	or	a1,a1,a0
    bedc:	0175fe63          	bgeu	a1,s7,bef8 <__umoddi3+0x500>
    bee0:	00ba85b3          	add	a1,s5,a1
    bee4:	fffd0793          	add	a5,s10,-1
    bee8:	1355ea63          	bltu	a1,s5,c01c <__umoddi3+0x624>
    beec:	1375f863          	bgeu	a1,s7,c01c <__umoddi3+0x624>
    bef0:	ffed0d13          	add	s10,s10,-2
    bef4:	015585b3          	add	a1,a1,s5
    bef8:	010b1793          	sll	a5,s6,0x10
    befc:	00010e37          	lui	t3,0x10
    bf00:	01a7e7b3          	or	a5,a5,s10
    bf04:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    bf08:	0067f8b3          	and	a7,a5,t1
    bf0c:	00647333          	and	t1,s0,t1
    bf10:	41758733          	sub	a4,a1,s7
    bf14:	0107d793          	srl	a5,a5,0x10
    bf18:	01045e93          	srl	t4,s0,0x10
    bf1c:	00088513          	mv	a0,a7
    bf20:	00030593          	mv	a1,t1
    bf24:	3fd020ef          	jal	eb20 <__mulsi3>
    bf28:	00050813          	mv	a6,a0
    bf2c:	000e8593          	mv	a1,t4
    bf30:	00088513          	mv	a0,a7
    bf34:	3ed020ef          	jal	eb20 <__mulsi3>
    bf38:	00050893          	mv	a7,a0
    bf3c:	00030593          	mv	a1,t1
    bf40:	00078513          	mv	a0,a5
    bf44:	3dd020ef          	jal	eb20 <__mulsi3>
    bf48:	00050313          	mv	t1,a0
    bf4c:	000e8593          	mv	a1,t4
    bf50:	00078513          	mv	a0,a5
    bf54:	3cd020ef          	jal	eb20 <__mulsi3>
    bf58:	01085793          	srl	a5,a6,0x10
    bf5c:	006888b3          	add	a7,a7,t1
    bf60:	011787b3          	add	a5,a5,a7
    bf64:	0067f463          	bgeu	a5,t1,bf6c <__umoddi3+0x574>
    bf68:	01c50533          	add	a0,a0,t3
    bf6c:	00010637          	lui	a2,0x10
    bf70:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    bf74:	0107d693          	srl	a3,a5,0x10
    bf78:	00c7f7b3          	and	a5,a5,a2
    bf7c:	01079793          	sll	a5,a5,0x10
    bf80:	00c87833          	and	a6,a6,a2
    bf84:	00a686b3          	add	a3,a3,a0
    bf88:	010787b3          	add	a5,a5,a6
    bf8c:	06d76263          	bltu	a4,a3,bff0 <__umoddi3+0x5f8>
    bf90:	04d70e63          	beq	a4,a3,bfec <__umoddi3+0x5f4>
    bf94:	40f487b3          	sub	a5,s1,a5
    bf98:	00f4b4b3          	sltu	s1,s1,a5
    bf9c:	02812403          	lw	s0,40(sp)
    bfa0:	02c12083          	lw	ra,44(sp)
    bfa4:	40d705b3          	sub	a1,a4,a3
    bfa8:	409585b3          	sub	a1,a1,s1
    bfac:	01359733          	sll	a4,a1,s3
    bfb0:	0127d7b3          	srl	a5,a5,s2
    bfb4:	02412483          	lw	s1,36(sp)
    bfb8:	01c12983          	lw	s3,28(sp)
    bfbc:	01812a03          	lw	s4,24(sp)
    bfc0:	01412a83          	lw	s5,20(sp)
    bfc4:	01012b03          	lw	s6,16(sp)
    bfc8:	00c12b83          	lw	s7,12(sp)
    bfcc:	00812c03          	lw	s8,8(sp)
    bfd0:	00412c83          	lw	s9,4(sp)
    bfd4:	00012d03          	lw	s10,0(sp)
    bfd8:	0125d5b3          	srl	a1,a1,s2
    bfdc:	00f76533          	or	a0,a4,a5
    bfe0:	02012903          	lw	s2,32(sp)
    bfe4:	03010113          	add	sp,sp,48
    bfe8:	00008067          	ret
    bfec:	faf4f4e3          	bgeu	s1,a5,bf94 <__umoddi3+0x59c>
    bff0:	40878433          	sub	s0,a5,s0
    bff4:	0087b7b3          	sltu	a5,a5,s0
    bff8:	01578ab3          	add	s5,a5,s5
    bffc:	415686b3          	sub	a3,a3,s5
    c000:	00040793          	mv	a5,s0
    c004:	f91ff06f          	j	bf94 <__umoddi3+0x59c>
    c008:	01000737          	lui	a4,0x1000
    c00c:	02e67c63          	bgeu	a2,a4,c044 <__umoddi3+0x64c>
    c010:	01065513          	srl	a0,a2,0x10
    c014:	01000693          	li	a3,16
    c018:	bd9ff06f          	j	bbf0 <__umoddi3+0x1f8>
    c01c:	00078d13          	mv	s10,a5
    c020:	ed9ff06f          	j	bef8 <__umoddi3+0x500>
    c024:	00070b13          	mv	s6,a4
    c028:	e71ff06f          	j	be98 <__umoddi3+0x4a0>
    c02c:	014787b3          	add	a5,a5,s4
    c030:	aedff06f          	j	bb1c <__umoddi3+0x124>
    c034:	014787b3          	add	a5,a5,s4
    c038:	c2dff06f          	j	bc64 <__umoddi3+0x26c>
    c03c:	014787b3          	add	a5,a5,s4
    c040:	a91ff06f          	j	bad0 <__umoddi3+0xd8>
    c044:	01865513          	srl	a0,a2,0x18
    c048:	01800693          	li	a3,24
    c04c:	ba5ff06f          	j	bbf0 <__umoddi3+0x1f8>

0000c050 <__adddf3>:
    c050:	001007b7          	lui	a5,0x100
    c054:	fe010113          	add	sp,sp,-32
    c058:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c05c:	00bef833          	and	a6,t4,a1
    c060:	00def7b3          	and	a5,t4,a3
    c064:	0146d313          	srl	t1,a3,0x14
    c068:	01212823          	sw	s2,16(sp)
    c06c:	0145d913          	srl	s2,a1,0x14
    c070:	00379793          	sll	a5,a5,0x3
    c074:	00812c23          	sw	s0,24(sp)
    c078:	00381813          	sll	a6,a6,0x3
    c07c:	01f5d413          	srl	s0,a1,0x1f
    c080:	01d55713          	srl	a4,a0,0x1d
    c084:	01d65893          	srl	a7,a2,0x1d
    c088:	7ff97913          	and	s2,s2,2047
    c08c:	7ff37313          	and	t1,t1,2047
    c090:	00112e23          	sw	ra,28(sp)
    c094:	00912a23          	sw	s1,20(sp)
    c098:	01312623          	sw	s3,12(sp)
    c09c:	01f6d693          	srl	a3,a3,0x1f
    c0a0:	00f8e8b3          	or	a7,a7,a5
    c0a4:	01076733          	or	a4,a4,a6
    c0a8:	00351593          	sll	a1,a0,0x3
    c0ac:	00361f13          	sll	t5,a2,0x3
    c0b0:	406907b3          	sub	a5,s2,t1
    c0b4:	1ed40463          	beq	s0,a3,c29c <__adddf3+0x24c>
    c0b8:	16f05263          	blez	a5,c21c <__adddf3+0x1cc>
    c0bc:	28030663          	beqz	t1,c348 <__adddf3+0x2f8>
    c0c0:	7ff00693          	li	a3,2047
    c0c4:	42d90663          	beq	s2,a3,c4f0 <__adddf3+0x4a0>
    c0c8:	03800693          	li	a3,56
    c0cc:	00100613          	li	a2,1
    c0d0:	02f6ce63          	blt	a3,a5,c10c <__adddf3+0xbc>
    c0d4:	008006b7          	lui	a3,0x800
    c0d8:	00d8e8b3          	or	a7,a7,a3
    c0dc:	01f00693          	li	a3,31
    c0e0:	52f6ce63          	blt	a3,a5,c61c <__adddf3+0x5cc>
    c0e4:	02000693          	li	a3,32
    c0e8:	40f686b3          	sub	a3,a3,a5
    c0ec:	00d89633          	sll	a2,a7,a3
    c0f0:	00ff5533          	srl	a0,t5,a5
    c0f4:	00df16b3          	sll	a3,t5,a3
    c0f8:	00a66633          	or	a2,a2,a0
    c0fc:	00d036b3          	snez	a3,a3
    c100:	00f8d8b3          	srl	a7,a7,a5
    c104:	00d66633          	or	a2,a2,a3
    c108:	41170733          	sub	a4,a4,a7
    c10c:	40c58633          	sub	a2,a1,a2
    c110:	00c5b5b3          	sltu	a1,a1,a2
    c114:	00060493          	mv	s1,a2
    c118:	40b709b3          	sub	s3,a4,a1
    c11c:	00899793          	sll	a5,s3,0x8
    c120:	3207da63          	bgez	a5,c454 <__adddf3+0x404>
    c124:	008007b7          	lui	a5,0x800
    c128:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c12c:	00f9f9b3          	and	s3,s3,a5
    c130:	2c098863          	beqz	s3,c400 <__adddf3+0x3b0>
    c134:	00098513          	mv	a0,s3
    c138:	359020ef          	jal	ec90 <__clzsi2>
    c13c:	ff850793          	add	a5,a0,-8
    c140:	02000693          	li	a3,32
    c144:	40f68733          	sub	a4,a3,a5
    c148:	00e4d733          	srl	a4,s1,a4
    c14c:	00f999b3          	sll	s3,s3,a5
    c150:	01376733          	or	a4,a4,s3
    c154:	00f494b3          	sll	s1,s1,a5
    c158:	4b27c863          	blt	a5,s2,c608 <__adddf3+0x5b8>
    c15c:	412787b3          	sub	a5,a5,s2
    c160:	00178793          	add	a5,a5,1
    c164:	40f686b3          	sub	a3,a3,a5
    c168:	00d49633          	sll	a2,s1,a3
    c16c:	00f4d9b3          	srl	s3,s1,a5
    c170:	00c03633          	snez	a2,a2
    c174:	01366633          	or	a2,a2,s3
    c178:	00d716b3          	sll	a3,a4,a3
    c17c:	00c6e4b3          	or	s1,a3,a2
    c180:	00f759b3          	srl	s3,a4,a5
    c184:	00000913          	li	s2,0
    c188:	0074f793          	and	a5,s1,7
    c18c:	02078063          	beqz	a5,c1ac <__adddf3+0x15c>
    c190:	00f4f793          	and	a5,s1,15
    c194:	00400713          	li	a4,4
    c198:	00e78a63          	beq	a5,a4,c1ac <__adddf3+0x15c>
    c19c:	00448793          	add	a5,s1,4
    c1a0:	0097b633          	sltu	a2,a5,s1
    c1a4:	00c989b3          	add	s3,s3,a2
    c1a8:	00078493          	mv	s1,a5
    c1ac:	00899793          	sll	a5,s3,0x8
    c1b0:	6e07da63          	bgez	a5,c8a4 <__adddf3+0x854>
    c1b4:	00190793          	add	a5,s2,1
    c1b8:	7ff00713          	li	a4,2047
    c1bc:	00040e13          	mv	t3,s0
    c1c0:	2ae78663          	beq	a5,a4,c46c <__adddf3+0x41c>
    c1c4:	ff800737          	lui	a4,0xff800
    c1c8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c1cc:	00e9f733          	and	a4,s3,a4
    c1d0:	7ff7f793          	and	a5,a5,2047
    c1d4:	01d71813          	sll	a6,a4,0x1d
    c1d8:	0034d613          	srl	a2,s1,0x3
    c1dc:	00971713          	sll	a4,a4,0x9
    c1e0:	00c86833          	or	a6,a6,a2
    c1e4:	00c75713          	srl	a4,a4,0xc
    c1e8:	01c12083          	lw	ra,28(sp)
    c1ec:	01812403          	lw	s0,24(sp)
    c1f0:	01479793          	sll	a5,a5,0x14
    c1f4:	00e7e7b3          	or	a5,a5,a4
    c1f8:	01fe1713          	sll	a4,t3,0x1f
    c1fc:	00e7e7b3          	or	a5,a5,a4
    c200:	01412483          	lw	s1,20(sp)
    c204:	01012903          	lw	s2,16(sp)
    c208:	00c12983          	lw	s3,12(sp)
    c20c:	00080513          	mv	a0,a6
    c210:	00078593          	mv	a1,a5
    c214:	02010113          	add	sp,sp,32
    c218:	00008067          	ret
    c21c:	14078c63          	beqz	a5,c374 <__adddf3+0x324>
    c220:	412307b3          	sub	a5,t1,s2
    c224:	3c091263          	bnez	s2,c5e8 <__adddf3+0x598>
    c228:	00b76533          	or	a0,a4,a1
    c22c:	4c050463          	beqz	a0,c6f4 <__adddf3+0x6a4>
    c230:	fff78513          	add	a0,a5,-1
    c234:	60050263          	beqz	a0,c838 <__adddf3+0x7e8>
    c238:	7ff00813          	li	a6,2047
    c23c:	57078663          	beq	a5,a6,c7a8 <__adddf3+0x758>
    c240:	03800793          	li	a5,56
    c244:	00100613          	li	a2,1
    c248:	02a7cc63          	blt	a5,a0,c280 <__adddf3+0x230>
    c24c:	00050793          	mv	a5,a0
    c250:	01f00613          	li	a2,31
    c254:	56f64c63          	blt	a2,a5,c7cc <__adddf3+0x77c>
    c258:	02000513          	li	a0,32
    c25c:	40f50533          	sub	a0,a0,a5
    c260:	00a71633          	sll	a2,a4,a0
    c264:	00f5d833          	srl	a6,a1,a5
    c268:	00a59533          	sll	a0,a1,a0
    c26c:	01066633          	or	a2,a2,a6
    c270:	00a03533          	snez	a0,a0
    c274:	00f75733          	srl	a4,a4,a5
    c278:	00a66633          	or	a2,a2,a0
    c27c:	40e888b3          	sub	a7,a7,a4
    c280:	40cf0633          	sub	a2,t5,a2
    c284:	00cf3733          	sltu	a4,t5,a2
    c288:	00060493          	mv	s1,a2
    c28c:	40e889b3          	sub	s3,a7,a4
    c290:	00030913          	mv	s2,t1
    c294:	00068413          	mv	s0,a3
    c298:	e85ff06f          	j	c11c <__adddf3+0xcc>
    c29c:	1ef05063          	blez	a5,c47c <__adddf3+0x42c>
    c2a0:	14031063          	bnez	t1,c3e0 <__adddf3+0x390>
    c2a4:	01e8e6b3          	or	a3,a7,t5
    c2a8:	26068c63          	beqz	a3,c520 <__adddf3+0x4d0>
    c2ac:	fff78693          	add	a3,a5,-1
    c2b0:	48068063          	beqz	a3,c730 <__adddf3+0x6e0>
    c2b4:	7ff00613          	li	a2,2047
    c2b8:	22c78c63          	beq	a5,a2,c4f0 <__adddf3+0x4a0>
    c2bc:	03800793          	li	a5,56
    c2c0:	00100993          	li	s3,1
    c2c4:	02d7cc63          	blt	a5,a3,c2fc <__adddf3+0x2ac>
    c2c8:	00068793          	mv	a5,a3
    c2cc:	01f00693          	li	a3,31
    c2d0:	4af6c063          	blt	a3,a5,c770 <__adddf3+0x720>
    c2d4:	02000693          	li	a3,32
    c2d8:	40f686b3          	sub	a3,a3,a5
    c2dc:	00d899b3          	sll	s3,a7,a3
    c2e0:	00ff5633          	srl	a2,t5,a5
    c2e4:	00df16b3          	sll	a3,t5,a3
    c2e8:	00c9e9b3          	or	s3,s3,a2
    c2ec:	00d036b3          	snez	a3,a3
    c2f0:	00f8d8b3          	srl	a7,a7,a5
    c2f4:	00d9e9b3          	or	s3,s3,a3
    c2f8:	01170733          	add	a4,a4,a7
    c2fc:	00b985b3          	add	a1,s3,a1
    c300:	0135b9b3          	sltu	s3,a1,s3
    c304:	00058493          	mv	s1,a1
    c308:	00e989b3          	add	s3,s3,a4
    c30c:	00899793          	sll	a5,s3,0x8
    c310:	1407d263          	bgez	a5,c454 <__adddf3+0x404>
    c314:	00190913          	add	s2,s2,1
    c318:	7ff00793          	li	a5,2047
    c31c:	36f90c63          	beq	s2,a5,c694 <__adddf3+0x644>
    c320:	ff8007b7          	lui	a5,0xff800
    c324:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c328:	0014f613          	and	a2,s1,1
    c32c:	00f9f7b3          	and	a5,s3,a5
    c330:	0014d713          	srl	a4,s1,0x1
    c334:	00c76733          	or	a4,a4,a2
    c338:	01f79613          	sll	a2,a5,0x1f
    c33c:	00e664b3          	or	s1,a2,a4
    c340:	0017d993          	srl	s3,a5,0x1
    c344:	e45ff06f          	j	c188 <__adddf3+0x138>
    c348:	01e8e6b3          	or	a3,a7,t5
    c34c:	1c068a63          	beqz	a3,c520 <__adddf3+0x4d0>
    c350:	fff78693          	add	a3,a5,-1
    c354:	40068063          	beqz	a3,c754 <__adddf3+0x704>
    c358:	7ff00613          	li	a2,2047
    c35c:	18c78a63          	beq	a5,a2,c4f0 <__adddf3+0x4a0>
    c360:	03800793          	li	a5,56
    c364:	00100613          	li	a2,1
    c368:	dad7c2e3          	blt	a5,a3,c10c <__adddf3+0xbc>
    c36c:	00068793          	mv	a5,a3
    c370:	d6dff06f          	j	c0dc <__adddf3+0x8c>
    c374:	00190813          	add	a6,s2,1
    c378:	7fe87813          	and	a6,a6,2046
    c37c:	22081c63          	bnez	a6,c5b4 <__adddf3+0x564>
    c380:	00b76333          	or	t1,a4,a1
    c384:	01e8e833          	or	a6,a7,t5
    c388:	38091063          	bnez	s2,c708 <__adddf3+0x6b8>
    c38c:	46030e63          	beqz	t1,c808 <__adddf3+0x7b8>
    c390:	40080663          	beqz	a6,c79c <__adddf3+0x74c>
    c394:	41e589b3          	sub	s3,a1,t5
    c398:	0135b533          	sltu	a0,a1,s3
    c39c:	41170633          	sub	a2,a4,a7
    c3a0:	40a60633          	sub	a2,a2,a0
    c3a4:	00861513          	sll	a0,a2,0x8
    c3a8:	50055e63          	bgez	a0,c8c4 <__adddf3+0x874>
    c3ac:	40bf05b3          	sub	a1,t5,a1
    c3b0:	40e88733          	sub	a4,a7,a4
    c3b4:	00bf3f33          	sltu	t5,t5,a1
    c3b8:	41e70733          	sub	a4,a4,t5
    c3bc:	00871613          	sll	a2,a4,0x8
    c3c0:	00058493          	mv	s1,a1
    c3c4:	52065e63          	bgez	a2,c900 <__adddf3+0x8b0>
    c3c8:	ff8007b7          	lui	a5,0xff800
    c3cc:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c3d0:	00f77733          	and	a4,a4,a5
    c3d4:	00068e13          	mv	t3,a3
    c3d8:	00100793          	li	a5,1
    c3dc:	df9ff06f          	j	c1d4 <__adddf3+0x184>
    c3e0:	7ff00693          	li	a3,2047
    c3e4:	10d90663          	beq	s2,a3,c4f0 <__adddf3+0x4a0>
    c3e8:	03800693          	li	a3,56
    c3ec:	00100993          	li	s3,1
    c3f0:	f0f6c6e3          	blt	a3,a5,c2fc <__adddf3+0x2ac>
    c3f4:	008006b7          	lui	a3,0x800
    c3f8:	00d8e8b3          	or	a7,a7,a3
    c3fc:	ed1ff06f          	j	c2cc <__adddf3+0x27c>
    c400:	00048513          	mv	a0,s1
    c404:	08d020ef          	jal	ec90 <__clzsi2>
    c408:	01850793          	add	a5,a0,24
    c40c:	01f00693          	li	a3,31
    c410:	d2f6d8e3          	bge	a3,a5,c140 <__adddf3+0xf0>
    c414:	ff850713          	add	a4,a0,-8
    c418:	00e49733          	sll	a4,s1,a4
    c41c:	2327c663          	blt	a5,s2,c648 <__adddf3+0x5f8>
    c420:	41278933          	sub	s2,a5,s2
    c424:	00190793          	add	a5,s2,1
    c428:	48f6d663          	bge	a3,a5,c8b4 <__adddf3+0x864>
    c42c:	fe190913          	add	s2,s2,-31
    c430:	02000693          	li	a3,32
    c434:	012754b3          	srl	s1,a4,s2
    c438:	00d78c63          	beq	a5,a3,c450 <__adddf3+0x400>
    c43c:	04000693          	li	a3,64
    c440:	40f687b3          	sub	a5,a3,a5
    c444:	00f71733          	sll	a4,a4,a5
    c448:	00e03733          	snez	a4,a4
    c44c:	00e4e4b3          	or	s1,s1,a4
    c450:	00000913          	li	s2,0
    c454:	0074f793          	and	a5,s1,7
    c458:	d2079ce3          	bnez	a5,c190 <__adddf3+0x140>
    c45c:	00090793          	mv	a5,s2
    c460:	0034d613          	srl	a2,s1,0x3
    c464:	00098713          	mv	a4,s3
    c468:	0c00006f          	j	c528 <__adddf3+0x4d8>
    c46c:	7ff00793          	li	a5,2047
    c470:	00000713          	li	a4,0
    c474:	00000813          	li	a6,0
    c478:	d71ff06f          	j	c1e8 <__adddf3+0x198>
    c47c:	0c078a63          	beqz	a5,c550 <__adddf3+0x500>
    c480:	412307b3          	sub	a5,t1,s2
    c484:	1e090263          	beqz	s2,c668 <__adddf3+0x618>
    c488:	7ff00693          	li	a3,2047
    c48c:	32d30863          	beq	t1,a3,c7bc <__adddf3+0x76c>
    c490:	03800693          	li	a3,56
    c494:	00100993          	li	s3,1
    c498:	02f6ce63          	blt	a3,a5,c4d4 <__adddf3+0x484>
    c49c:	008006b7          	lui	a3,0x800
    c4a0:	00d76733          	or	a4,a4,a3
    c4a4:	01f00693          	li	a3,31
    c4a8:	3cf6c863          	blt	a3,a5,c878 <__adddf3+0x828>
    c4ac:	02000693          	li	a3,32
    c4b0:	40f686b3          	sub	a3,a3,a5
    c4b4:	00d719b3          	sll	s3,a4,a3
    c4b8:	00f5d633          	srl	a2,a1,a5
    c4bc:	00d596b3          	sll	a3,a1,a3
    c4c0:	00c9e9b3          	or	s3,s3,a2
    c4c4:	00d036b3          	snez	a3,a3
    c4c8:	00f75733          	srl	a4,a4,a5
    c4cc:	00d9e9b3          	or	s3,s3,a3
    c4d0:	00e888b3          	add	a7,a7,a4
    c4d4:	01e98733          	add	a4,s3,t5
    c4d8:	013739b3          	sltu	s3,a4,s3
    c4dc:	00070493          	mv	s1,a4
    c4e0:	011989b3          	add	s3,s3,a7
    c4e4:	00030913          	mv	s2,t1
    c4e8:	e25ff06f          	j	c30c <__adddf3+0x2bc>
    c4ec:	02081063          	bnez	a6,c50c <__adddf3+0x4bc>
    c4f0:	00351613          	sll	a2,a0,0x3
    c4f4:	00365613          	srl	a2,a2,0x3
    c4f8:	01d71813          	sll	a6,a4,0x1d
    c4fc:	00c86833          	or	a6,a6,a2
    c500:	00375713          	srl	a4,a4,0x3
    c504:	01076733          	or	a4,a4,a6
    c508:	18070663          	beqz	a4,c694 <__adddf3+0x644>
    c50c:	00000e13          	li	t3,0
    c510:	7ff00793          	li	a5,2047
    c514:	00080737          	lui	a4,0x80
    c518:	00000813          	li	a6,0
    c51c:	ccdff06f          	j	c1e8 <__adddf3+0x198>
    c520:	00351613          	sll	a2,a0,0x3
    c524:	00365613          	srl	a2,a2,0x3
    c528:	01d71813          	sll	a6,a4,0x1d
    c52c:	7ff00693          	li	a3,2047
    c530:	00c86833          	or	a6,a6,a2
    c534:	00375713          	srl	a4,a4,0x3
    c538:	fcd786e3          	beq	a5,a3,c504 <__adddf3+0x4b4>
    c53c:	00c71713          	sll	a4,a4,0xc
    c540:	00c75713          	srl	a4,a4,0xc
    c544:	7ff7f793          	and	a5,a5,2047
    c548:	00040e13          	mv	t3,s0
    c54c:	c9dff06f          	j	c1e8 <__adddf3+0x198>
    c550:	00190693          	add	a3,s2,1
    c554:	7fe6f813          	and	a6,a3,2046
    c558:	14081863          	bnez	a6,c6a8 <__adddf3+0x658>
    c55c:	00b766b3          	or	a3,a4,a1
    c560:	28091c63          	bnez	s2,c7f8 <__adddf3+0x7a8>
    c564:	30068263          	beqz	a3,c868 <__adddf3+0x818>
    c568:	01e8e6b3          	or	a3,a7,t5
    c56c:	22068863          	beqz	a3,c79c <__adddf3+0x74c>
    c570:	01e587b3          	add	a5,a1,t5
    c574:	00b7b5b3          	sltu	a1,a5,a1
    c578:	01170733          	add	a4,a4,a7
    c57c:	00b70733          	add	a4,a4,a1
    c580:	0037d813          	srl	a6,a5,0x3
    c584:	00871793          	sll	a5,a4,0x8
    c588:	00040e13          	mv	t3,s0
    c58c:	3407de63          	bgez	a5,c8e8 <__adddf3+0x898>
    c590:	ff8007b7          	lui	a5,0xff800
    c594:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c598:	00f77733          	and	a4,a4,a5
    c59c:	01d71793          	sll	a5,a4,0x1d
    c5a0:	00375713          	srl	a4,a4,0x3
    c5a4:	0107e833          	or	a6,a5,a6
    c5a8:	01d77733          	and	a4,a4,t4
    c5ac:	00100793          	li	a5,1
    c5b0:	c39ff06f          	j	c1e8 <__adddf3+0x198>
    c5b4:	41e58833          	sub	a6,a1,t5
    c5b8:	0105b7b3          	sltu	a5,a1,a6
    c5bc:	411709b3          	sub	s3,a4,a7
    c5c0:	40f989b3          	sub	s3,s3,a5
    c5c4:	00899793          	sll	a5,s3,0x8
    c5c8:	00080493          	mv	s1,a6
    c5cc:	1007c663          	bltz	a5,c6d8 <__adddf3+0x688>
    c5d0:	01386833          	or	a6,a6,s3
    c5d4:	b4081ee3          	bnez	a6,c130 <__adddf3+0xe0>
    c5d8:	00000e13          	li	t3,0
    c5dc:	00000793          	li	a5,0
    c5e0:	00000713          	li	a4,0
    c5e4:	c05ff06f          	j	c1e8 <__adddf3+0x198>
    c5e8:	7ff00513          	li	a0,2047
    c5ec:	1aa30e63          	beq	t1,a0,c7a8 <__adddf3+0x758>
    c5f0:	03800513          	li	a0,56
    c5f4:	00100613          	li	a2,1
    c5f8:	c8f544e3          	blt	a0,a5,c280 <__adddf3+0x230>
    c5fc:	00800637          	lui	a2,0x800
    c600:	00c76733          	or	a4,a4,a2
    c604:	c4dff06f          	j	c250 <__adddf3+0x200>
    c608:	ff8009b7          	lui	s3,0xff800
    c60c:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c610:	40f90933          	sub	s2,s2,a5
    c614:	013779b3          	and	s3,a4,s3
    c618:	b71ff06f          	j	c188 <__adddf3+0x138>
    c61c:	fe078693          	add	a3,a5,-32
    c620:	02000613          	li	a2,32
    c624:	00d8d6b3          	srl	a3,a7,a3
    c628:	00c78a63          	beq	a5,a2,c63c <__adddf3+0x5ec>
    c62c:	04000613          	li	a2,64
    c630:	40f607b3          	sub	a5,a2,a5
    c634:	00f897b3          	sll	a5,a7,a5
    c638:	00ff6f33          	or	t5,t5,a5
    c63c:	01e03633          	snez	a2,t5
    c640:	00d66633          	or	a2,a2,a3
    c644:	ac9ff06f          	j	c10c <__adddf3+0xbc>
    c648:	ff8006b7          	lui	a3,0xff800
    c64c:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c650:	40f907b3          	sub	a5,s2,a5
    c654:	00d77733          	and	a4,a4,a3
    c658:	01d71813          	sll	a6,a4,0x1d
    c65c:	01386833          	or	a6,a6,s3
    c660:	00375713          	srl	a4,a4,0x3
    c664:	ed9ff06f          	j	c53c <__adddf3+0x4ec>
    c668:	00b766b3          	or	a3,a4,a1
    c66c:	1e068663          	beqz	a3,c858 <__adddf3+0x808>
    c670:	fff78693          	add	a3,a5,-1
    c674:	0a068e63          	beqz	a3,c730 <__adddf3+0x6e0>
    c678:	7ff00513          	li	a0,2047
    c67c:	14a78063          	beq	a5,a0,c7bc <__adddf3+0x76c>
    c680:	03800793          	li	a5,56
    c684:	00100993          	li	s3,1
    c688:	e4d7c6e3          	blt	a5,a3,c4d4 <__adddf3+0x484>
    c68c:	00068793          	mv	a5,a3
    c690:	e15ff06f          	j	c4a4 <__adddf3+0x454>
    c694:	00040e13          	mv	t3,s0
    c698:	7ff00793          	li	a5,2047
    c69c:	00000713          	li	a4,0
    c6a0:	00000813          	li	a6,0
    c6a4:	b45ff06f          	j	c1e8 <__adddf3+0x198>
    c6a8:	7ff00793          	li	a5,2047
    c6ac:	fef684e3          	beq	a3,a5,c694 <__adddf3+0x644>
    c6b0:	01e58f33          	add	t5,a1,t5
    c6b4:	00bf35b3          	sltu	a1,t5,a1
    c6b8:	011707b3          	add	a5,a4,a7
    c6bc:	00b787b3          	add	a5,a5,a1
    c6c0:	01f79613          	sll	a2,a5,0x1f
    c6c4:	001f5f13          	srl	t5,t5,0x1
    c6c8:	01e664b3          	or	s1,a2,t5
    c6cc:	0017d993          	srl	s3,a5,0x1
    c6d0:	00068913          	mv	s2,a3
    c6d4:	ab5ff06f          	j	c188 <__adddf3+0x138>
    c6d8:	40bf0633          	sub	a2,t5,a1
    c6dc:	40e887b3          	sub	a5,a7,a4
    c6e0:	00cf3733          	sltu	a4,t5,a2
    c6e4:	00060493          	mv	s1,a2
    c6e8:	40e789b3          	sub	s3,a5,a4
    c6ec:	00068413          	mv	s0,a3
    c6f0:	a41ff06f          	j	c130 <__adddf3+0xe0>
    c6f4:	00361613          	sll	a2,a2,0x3
    c6f8:	00365613          	srl	a2,a2,0x3
    c6fc:	00068413          	mv	s0,a3
    c700:	00088713          	mv	a4,a7
    c704:	e25ff06f          	j	c528 <__adddf3+0x4d8>
    c708:	de0312e3          	bnez	t1,c4ec <__adddf3+0x49c>
    c70c:	1c080663          	beqz	a6,c8d8 <__adddf3+0x888>
    c710:	0038d713          	srl	a4,a7,0x3
    c714:	00361613          	sll	a2,a2,0x3
    c718:	01d89893          	sll	a7,a7,0x1d
    c71c:	01176733          	or	a4,a4,a7
    c720:	00365613          	srl	a2,a2,0x3
    c724:	00c76733          	or	a4,a4,a2
    c728:	00068413          	mv	s0,a3
    c72c:	dddff06f          	j	c508 <__adddf3+0x4b8>
    c730:	01e58f33          	add	t5,a1,t5
    c734:	011708b3          	add	a7,a4,a7
    c738:	00bf35b3          	sltu	a1,t5,a1
    c73c:	00b889b3          	add	s3,a7,a1
    c740:	00899793          	sll	a5,s3,0x8
    c744:	000f0493          	mv	s1,t5
    c748:	0e07d463          	bgez	a5,c830 <__adddf3+0x7e0>
    c74c:	00200913          	li	s2,2
    c750:	bd1ff06f          	j	c320 <__adddf3+0x2d0>
    c754:	41e58f33          	sub	t5,a1,t5
    c758:	411708b3          	sub	a7,a4,a7
    c75c:	01e5b5b3          	sltu	a1,a1,t5
    c760:	000f0493          	mv	s1,t5
    c764:	40b889b3          	sub	s3,a7,a1
    c768:	00100913          	li	s2,1
    c76c:	9b1ff06f          	j	c11c <__adddf3+0xcc>
    c770:	fe078693          	add	a3,a5,-32
    c774:	02000613          	li	a2,32
    c778:	00d8d6b3          	srl	a3,a7,a3
    c77c:	00c78a63          	beq	a5,a2,c790 <__adddf3+0x740>
    c780:	04000613          	li	a2,64
    c784:	40f607b3          	sub	a5,a2,a5
    c788:	00f897b3          	sll	a5,a7,a5
    c78c:	00ff6f33          	or	t5,t5,a5
    c790:	01e039b3          	snez	s3,t5
    c794:	00d9e9b3          	or	s3,s3,a3
    c798:	b65ff06f          	j	c2fc <__adddf3+0x2ac>
    c79c:	00351613          	sll	a2,a0,0x3
    c7a0:	00365993          	srl	s3,a2,0x3
    c7a4:	eb5ff06f          	j	c658 <__adddf3+0x608>
    c7a8:	00361613          	sll	a2,a2,0x3
    c7ac:	00365613          	srl	a2,a2,0x3
    c7b0:	00068413          	mv	s0,a3
    c7b4:	00088713          	mv	a4,a7
    c7b8:	d41ff06f          	j	c4f8 <__adddf3+0x4a8>
    c7bc:	00361613          	sll	a2,a2,0x3
    c7c0:	00365613          	srl	a2,a2,0x3
    c7c4:	00088713          	mv	a4,a7
    c7c8:	d31ff06f          	j	c4f8 <__adddf3+0x4a8>
    c7cc:	fe078513          	add	a0,a5,-32
    c7d0:	02000613          	li	a2,32
    c7d4:	00a75533          	srl	a0,a4,a0
    c7d8:	00c78a63          	beq	a5,a2,c7ec <__adddf3+0x79c>
    c7dc:	04000613          	li	a2,64
    c7e0:	40f607b3          	sub	a5,a2,a5
    c7e4:	00f717b3          	sll	a5,a4,a5
    c7e8:	00f5e5b3          	or	a1,a1,a5
    c7ec:	00b03633          	snez	a2,a1
    c7f0:	00a66633          	or	a2,a2,a0
    c7f4:	a8dff06f          	j	c280 <__adddf3+0x230>
    c7f8:	fc0682e3          	beqz	a3,c7bc <__adddf3+0x76c>
    c7fc:	01e8ef33          	or	t5,a7,t5
    c800:	d00f16e3          	bnez	t5,c50c <__adddf3+0x4bc>
    c804:	cedff06f          	j	c4f0 <__adddf3+0x4a0>
    c808:	dc0808e3          	beqz	a6,c5d8 <__adddf3+0x588>
    c80c:	00361813          	sll	a6,a2,0x3
    c810:	01d89793          	sll	a5,a7,0x1d
    c814:	00385813          	srl	a6,a6,0x3
    c818:	0038d713          	srl	a4,a7,0x3
    c81c:	00f86833          	or	a6,a6,a5
    c820:	01d77733          	and	a4,a4,t4
    c824:	00068e13          	mv	t3,a3
    c828:	00000793          	li	a5,0
    c82c:	9bdff06f          	j	c1e8 <__adddf3+0x198>
    c830:	00100793          	li	a5,1
    c834:	c2dff06f          	j	c460 <__adddf3+0x410>
    c838:	40bf05b3          	sub	a1,t5,a1
    c83c:	40e888b3          	sub	a7,a7,a4
    c840:	00bf3733          	sltu	a4,t5,a1
    c844:	00058493          	mv	s1,a1
    c848:	40e889b3          	sub	s3,a7,a4
    c84c:	00068413          	mv	s0,a3
    c850:	00100913          	li	s2,1
    c854:	8c9ff06f          	j	c11c <__adddf3+0xcc>
    c858:	00361613          	sll	a2,a2,0x3
    c85c:	00365613          	srl	a2,a2,0x3
    c860:	00088713          	mv	a4,a7
    c864:	cc5ff06f          	j	c528 <__adddf3+0x4d8>
    c868:	00361613          	sll	a2,a2,0x3
    c86c:	00365993          	srl	s3,a2,0x3
    c870:	00088713          	mv	a4,a7
    c874:	de5ff06f          	j	c658 <__adddf3+0x608>
    c878:	fe078693          	add	a3,a5,-32
    c87c:	02000613          	li	a2,32
    c880:	00d756b3          	srl	a3,a4,a3
    c884:	00c78a63          	beq	a5,a2,c898 <__adddf3+0x848>
    c888:	04000613          	li	a2,64
    c88c:	40f607b3          	sub	a5,a2,a5
    c890:	00f717b3          	sll	a5,a4,a5
    c894:	00f5e5b3          	or	a1,a1,a5
    c898:	00b039b3          	snez	s3,a1
    c89c:	00d9e9b3          	or	s3,s3,a3
    c8a0:	c35ff06f          	j	c4d4 <__adddf3+0x484>
    c8a4:	0034d613          	srl	a2,s1,0x3
    c8a8:	00090793          	mv	a5,s2
    c8ac:	00098713          	mv	a4,s3
    c8b0:	c79ff06f          	j	c528 <__adddf3+0x4d8>
    c8b4:	02000693          	li	a3,32
    c8b8:	40f686b3          	sub	a3,a3,a5
    c8bc:	00000613          	li	a2,0
    c8c0:	8b5ff06f          	j	c174 <__adddf3+0x124>
    c8c4:	00c9e833          	or	a6,s3,a2
    c8c8:	d00808e3          	beqz	a6,c5d8 <__adddf3+0x588>
    c8cc:	0039d993          	srl	s3,s3,0x3
    c8d0:	00060713          	mv	a4,a2
    c8d4:	d85ff06f          	j	c658 <__adddf3+0x608>
    c8d8:	00000e13          	li	t3,0
    c8dc:	7ff00793          	li	a5,2047
    c8e0:	00080737          	lui	a4,0x80
    c8e4:	905ff06f          	j	c1e8 <__adddf3+0x198>
    c8e8:	01d71793          	sll	a5,a4,0x1d
    c8ec:	00375713          	srl	a4,a4,0x3
    c8f0:	0107e833          	or	a6,a5,a6
    c8f4:	01d77733          	and	a4,a4,t4
    c8f8:	00000793          	li	a5,0
    c8fc:	8edff06f          	j	c1e8 <__adddf3+0x198>
    c900:	01d71813          	sll	a6,a4,0x1d
    c904:	0035d593          	srl	a1,a1,0x3
    c908:	00b86833          	or	a6,a6,a1
    c90c:	00375713          	srl	a4,a4,0x3
    c910:	00068413          	mv	s0,a3
    c914:	c29ff06f          	j	c53c <__adddf3+0x4ec>

0000c918 <__divdf3>:
    c918:	fb010113          	add	sp,sp,-80
    c91c:	0145d793          	srl	a5,a1,0x14
    c920:	04812423          	sw	s0,72(sp)
    c924:	04912223          	sw	s1,68(sp)
    c928:	05212023          	sw	s2,64(sp)
    c92c:	03412c23          	sw	s4,56(sp)
    c930:	03512a23          	sw	s5,52(sp)
    c934:	00c59493          	sll	s1,a1,0xc
    c938:	04112623          	sw	ra,76(sp)
    c93c:	03312e23          	sw	s3,60(sp)
    c940:	03612823          	sw	s6,48(sp)
    c944:	03712623          	sw	s7,44(sp)
    c948:	03812423          	sw	s8,40(sp)
    c94c:	7ff7f793          	and	a5,a5,2047
    c950:	00050413          	mv	s0,a0
    c954:	00060a13          	mv	s4,a2
    c958:	00068913          	mv	s2,a3
    c95c:	00c4d493          	srl	s1,s1,0xc
    c960:	01f5da93          	srl	s5,a1,0x1f
    c964:	18078c63          	beqz	a5,cafc <__divdf3+0x1e4>
    c968:	7ff00713          	li	a4,2047
    c96c:	08e78a63          	beq	a5,a4,ca00 <__divdf3+0xe8>
    c970:	01d55b13          	srl	s6,a0,0x1d
    c974:	00349493          	sll	s1,s1,0x3
    c978:	009b64b3          	or	s1,s6,s1
    c97c:	00800737          	lui	a4,0x800
    c980:	00e4eb33          	or	s6,s1,a4
    c984:	00351b93          	sll	s7,a0,0x3
    c988:	c0178993          	add	s3,a5,-1023
    c98c:	00000493          	li	s1,0
    c990:	00000c13          	li	s8,0
    c994:	01495793          	srl	a5,s2,0x14
    c998:	00c91413          	sll	s0,s2,0xc
    c99c:	7ff7f793          	and	a5,a5,2047
    c9a0:	00c45413          	srl	s0,s0,0xc
    c9a4:	01f95913          	srl	s2,s2,0x1f
    c9a8:	08078463          	beqz	a5,ca30 <__divdf3+0x118>
    c9ac:	7ff00713          	li	a4,2047
    c9b0:	18e78c63          	beq	a5,a4,cb48 <__divdf3+0x230>
    c9b4:	00341413          	sll	s0,s0,0x3
    c9b8:	01da5713          	srl	a4,s4,0x1d
    c9bc:	00876733          	or	a4,a4,s0
    c9c0:	c0178793          	add	a5,a5,-1023
    c9c4:	00800437          	lui	s0,0x800
    c9c8:	40f989b3          	sub	s3,s3,a5
    c9cc:	00876433          	or	s0,a4,s0
    c9d0:	003a1813          	sll	a6,s4,0x3
    c9d4:	00000793          	li	a5,0
    c9d8:	00f00713          	li	a4,15
    c9dc:	012aca33          	xor	s4,s5,s2
    c9e0:	24976663          	bltu	a4,s1,cc2c <__divdf3+0x314>
    c9e4:	00003697          	auipc	a3,0x3
    c9e8:	d3c68693          	add	a3,a3,-708 # f720 <__mprec_tens+0xc8>
    c9ec:	00249493          	sll	s1,s1,0x2
    c9f0:	00d484b3          	add	s1,s1,a3
    c9f4:	0004a703          	lw	a4,0(s1)
    c9f8:	00d70733          	add	a4,a4,a3
    c9fc:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    ca00:	00a4eb33          	or	s6,s1,a0
    ca04:	1c0b1e63          	bnez	s6,cbe0 <__divdf3+0x2c8>
    ca08:	01495793          	srl	a5,s2,0x14
    ca0c:	00c91413          	sll	s0,s2,0xc
    ca10:	7ff7f793          	and	a5,a5,2047
    ca14:	00000b93          	li	s7,0
    ca18:	00800493          	li	s1,8
    ca1c:	7ff00993          	li	s3,2047
    ca20:	00200c13          	li	s8,2
    ca24:	00c45413          	srl	s0,s0,0xc
    ca28:	01f95913          	srl	s2,s2,0x1f
    ca2c:	f80790e3          	bnez	a5,c9ac <__divdf3+0x94>
    ca30:	01446833          	or	a6,s0,s4
    ca34:	1c080263          	beqz	a6,cbf8 <__divdf3+0x2e0>
    ca38:	5c040663          	beqz	s0,d004 <__divdf3+0x6ec>
    ca3c:	00040513          	mv	a0,s0
    ca40:	250020ef          	jal	ec90 <__clzsi2>
    ca44:	00050793          	mv	a5,a0
    ca48:	ff550693          	add	a3,a0,-11
    ca4c:	01d00713          	li	a4,29
    ca50:	ff878813          	add	a6,a5,-8
    ca54:	40d70733          	sub	a4,a4,a3
    ca58:	01041433          	sll	s0,s0,a6
    ca5c:	00ea5733          	srl	a4,s4,a4
    ca60:	00876433          	or	s0,a4,s0
    ca64:	010a1833          	sll	a6,s4,a6
    ca68:	013787b3          	add	a5,a5,s3
    ca6c:	3f378993          	add	s3,a5,1011
    ca70:	00000793          	li	a5,0
    ca74:	f65ff06f          	j	c9d8 <__divdf3+0xc0>
    ca78:	40f70733          	sub	a4,a4,a5
    ca7c:	03800693          	li	a3,56
    ca80:	60e6d063          	bge	a3,a4,d080 <__divdf3+0x768>
    ca84:	00000793          	li	a5,0
    ca88:	00000693          	li	a3,0
    ca8c:	00000713          	li	a4,0
    ca90:	04c12083          	lw	ra,76(sp)
    ca94:	04812403          	lw	s0,72(sp)
    ca98:	01479793          	sll	a5,a5,0x14
    ca9c:	00d7e7b3          	or	a5,a5,a3
    caa0:	01fa1693          	sll	a3,s4,0x1f
    caa4:	00d7e7b3          	or	a5,a5,a3
    caa8:	04412483          	lw	s1,68(sp)
    caac:	04012903          	lw	s2,64(sp)
    cab0:	03c12983          	lw	s3,60(sp)
    cab4:	03812a03          	lw	s4,56(sp)
    cab8:	03412a83          	lw	s5,52(sp)
    cabc:	03012b03          	lw	s6,48(sp)
    cac0:	02c12b83          	lw	s7,44(sp)
    cac4:	02812c03          	lw	s8,40(sp)
    cac8:	00070513          	mv	a0,a4
    cacc:	00078593          	mv	a1,a5
    cad0:	05010113          	add	sp,sp,80
    cad4:	00008067          	ret
    cad8:	7ff00793          	li	a5,2047
    cadc:	00000693          	li	a3,0
    cae0:	00000713          	li	a4,0
    cae4:	fadff06f          	j	ca90 <__divdf3+0x178>
    cae8:	00000a13          	li	s4,0
    caec:	7ff00793          	li	a5,2047
    caf0:	000806b7          	lui	a3,0x80
    caf4:	00000713          	li	a4,0
    caf8:	f99ff06f          	j	ca90 <__divdf3+0x178>
    cafc:	00a4eb33          	or	s6,s1,a0
    cb00:	100b0c63          	beqz	s6,cc18 <__divdf3+0x300>
    cb04:	52048463          	beqz	s1,d02c <__divdf3+0x714>
    cb08:	00048513          	mv	a0,s1
    cb0c:	184020ef          	jal	ec90 <__clzsi2>
    cb10:	00050713          	mv	a4,a0
    cb14:	ff550793          	add	a5,a0,-11
    cb18:	01d00b13          	li	s6,29
    cb1c:	ff870b93          	add	s7,a4,-8
    cb20:	40fb0b33          	sub	s6,s6,a5
    cb24:	017494b3          	sll	s1,s1,s7
    cb28:	01645b33          	srl	s6,s0,s6
    cb2c:	009b6b33          	or	s6,s6,s1
    cb30:	01741bb3          	sll	s7,s0,s7
    cb34:	c0d00793          	li	a5,-1011
    cb38:	40e789b3          	sub	s3,a5,a4
    cb3c:	00000493          	li	s1,0
    cb40:	00000c13          	li	s8,0
    cb44:	e51ff06f          	j	c994 <__divdf3+0x7c>
    cb48:	01446833          	or	a6,s0,s4
    cb4c:	80198993          	add	s3,s3,-2047
    cb50:	0a081c63          	bnez	a6,cc08 <__divdf3+0x2f0>
    cb54:	0024e493          	or	s1,s1,2
    cb58:	00000413          	li	s0,0
    cb5c:	00200793          	li	a5,2
    cb60:	e79ff06f          	j	c9d8 <__divdf3+0xc0>
    cb64:	000a8913          	mv	s2,s5
    cb68:	000b0413          	mv	s0,s6
    cb6c:	000b8813          	mv	a6,s7
    cb70:	00200793          	li	a5,2
    cb74:	60fc0863          	beq	s8,a5,d184 <__divdf3+0x86c>
    cb78:	00300793          	li	a5,3
    cb7c:	f6fc06e3          	beq	s8,a5,cae8 <__divdf3+0x1d0>
    cb80:	00100793          	li	a5,1
    cb84:	00090a13          	mv	s4,s2
    cb88:	eefc0ee3          	beq	s8,a5,ca84 <__divdf3+0x16c>
    cb8c:	3ff98793          	add	a5,s3,1023
    cb90:	3cf05263          	blez	a5,cf54 <__divdf3+0x63c>
    cb94:	00787713          	and	a4,a6,7
    cb98:	5c071663          	bnez	a4,d164 <__divdf3+0x84c>
    cb9c:	00741713          	sll	a4,s0,0x7
    cba0:	00075a63          	bgez	a4,cbb4 <__divdf3+0x29c>
    cba4:	ff0007b7          	lui	a5,0xff000
    cba8:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cbac:	00f47433          	and	s0,s0,a5
    cbb0:	40098793          	add	a5,s3,1024
    cbb4:	7fe00713          	li	a4,2046
    cbb8:	f2f740e3          	blt	a4,a5,cad8 <__divdf3+0x1c0>
    cbbc:	00385813          	srl	a6,a6,0x3
    cbc0:	01d41713          	sll	a4,s0,0x1d
    cbc4:	00941693          	sll	a3,s0,0x9
    cbc8:	01076733          	or	a4,a4,a6
    cbcc:	00c6d693          	srl	a3,a3,0xc
    cbd0:	7ff7f793          	and	a5,a5,2047
    cbd4:	ebdff06f          	j	ca90 <__divdf3+0x178>
    cbd8:	00078c13          	mv	s8,a5
    cbdc:	f95ff06f          	j	cb70 <__divdf3+0x258>
    cbe0:	00048b13          	mv	s6,s1
    cbe4:	00050b93          	mv	s7,a0
    cbe8:	00c00493          	li	s1,12
    cbec:	7ff00993          	li	s3,2047
    cbf0:	00300c13          	li	s8,3
    cbf4:	da1ff06f          	j	c994 <__divdf3+0x7c>
    cbf8:	0014e493          	or	s1,s1,1
    cbfc:	00000413          	li	s0,0
    cc00:	00100793          	li	a5,1
    cc04:	dd5ff06f          	j	c9d8 <__divdf3+0xc0>
    cc08:	0034e493          	or	s1,s1,3
    cc0c:	000a0813          	mv	a6,s4
    cc10:	00300793          	li	a5,3
    cc14:	dc5ff06f          	j	c9d8 <__divdf3+0xc0>
    cc18:	00000b93          	li	s7,0
    cc1c:	00400493          	li	s1,4
    cc20:	00000993          	li	s3,0
    cc24:	00100c13          	li	s8,1
    cc28:	d6dff06f          	j	c994 <__divdf3+0x7c>
    cc2c:	03912223          	sw	s9,36(sp)
    cc30:	03a12023          	sw	s10,32(sp)
    cc34:	01b12e23          	sw	s11,28(sp)
    cc38:	3b646a63          	bltu	s0,s6,cfec <__divdf3+0x6d4>
    cc3c:	3a8b0663          	beq	s6,s0,cfe8 <__divdf3+0x6d0>
    cc40:	fff98993          	add	s3,s3,-1
    cc44:	000b8c13          	mv	s8,s7
    cc48:	000b0493          	mv	s1,s6
    cc4c:	00000d13          	li	s10,0
    cc50:	01885c93          	srl	s9,a6,0x18
    cc54:	00841413          	sll	s0,s0,0x8
    cc58:	01045913          	srl	s2,s0,0x10
    cc5c:	008cecb3          	or	s9,s9,s0
    cc60:	00090593          	mv	a1,s2
    cc64:	00048513          	mv	a0,s1
    cc68:	010c9b13          	sll	s6,s9,0x10
    cc6c:	00881a93          	sll	s5,a6,0x8
    cc70:	010b5b13          	srl	s6,s6,0x10
    cc74:	771010ef          	jal	ebe4 <__hidden___udivsi3>
    cc78:	00050593          	mv	a1,a0
    cc7c:	00050413          	mv	s0,a0
    cc80:	000b0513          	mv	a0,s6
    cc84:	69d010ef          	jal	eb20 <__mulsi3>
    cc88:	00050793          	mv	a5,a0
    cc8c:	00090593          	mv	a1,s2
    cc90:	00048513          	mv	a0,s1
    cc94:	00078493          	mv	s1,a5
    cc98:	795010ef          	jal	ec2c <__umodsi3>
    cc9c:	01051513          	sll	a0,a0,0x10
    cca0:	010c5793          	srl	a5,s8,0x10
    cca4:	00a7e7b3          	or	a5,a5,a0
    cca8:	0097fa63          	bgeu	a5,s1,ccbc <__divdf3+0x3a4>
    ccac:	00fc87b3          	add	a5,s9,a5
    ccb0:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    ccb4:	3b97fe63          	bgeu	a5,s9,d070 <__divdf3+0x758>
    ccb8:	00070413          	mv	s0,a4
    ccbc:	409784b3          	sub	s1,a5,s1
    ccc0:	00090593          	mv	a1,s2
    ccc4:	00048513          	mv	a0,s1
    ccc8:	71d010ef          	jal	ebe4 <__hidden___udivsi3>
    cccc:	00050593          	mv	a1,a0
    ccd0:	00050b93          	mv	s7,a0
    ccd4:	000b0513          	mv	a0,s6
    ccd8:	649010ef          	jal	eb20 <__mulsi3>
    ccdc:	00050793          	mv	a5,a0
    cce0:	00090593          	mv	a1,s2
    cce4:	00048513          	mv	a0,s1
    cce8:	00078493          	mv	s1,a5
    ccec:	741010ef          	jal	ec2c <__umodsi3>
    ccf0:	010c1793          	sll	a5,s8,0x10
    ccf4:	01051513          	sll	a0,a0,0x10
    ccf8:	0107d793          	srl	a5,a5,0x10
    ccfc:	00a7e7b3          	or	a5,a5,a0
    cd00:	0097fa63          	bgeu	a5,s1,cd14 <__divdf3+0x3fc>
    cd04:	00fc87b3          	add	a5,s9,a5
    cd08:	fffb8713          	add	a4,s7,-1
    cd0c:	3597fa63          	bgeu	a5,s9,d060 <__divdf3+0x748>
    cd10:	00070b93          	mv	s7,a4
    cd14:	00010337          	lui	t1,0x10
    cd18:	01041413          	sll	s0,s0,0x10
    cd1c:	01746433          	or	s0,s0,s7
    cd20:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    cd24:	01b478b3          	and	a7,s0,s11
    cd28:	01bafdb3          	and	s11,s5,s11
    cd2c:	40978bb3          	sub	s7,a5,s1
    cd30:	010adc13          	srl	s8,s5,0x10
    cd34:	01045793          	srl	a5,s0,0x10
    cd38:	00088513          	mv	a0,a7
    cd3c:	000d8593          	mv	a1,s11
    cd40:	5e1010ef          	jal	eb20 <__mulsi3>
    cd44:	00050813          	mv	a6,a0
    cd48:	000c0593          	mv	a1,s8
    cd4c:	00088513          	mv	a0,a7
    cd50:	5d1010ef          	jal	eb20 <__mulsi3>
    cd54:	00050893          	mv	a7,a0
    cd58:	000d8593          	mv	a1,s11
    cd5c:	00078513          	mv	a0,a5
    cd60:	5c1010ef          	jal	eb20 <__mulsi3>
    cd64:	00050e13          	mv	t3,a0
    cd68:	000c0593          	mv	a1,s8
    cd6c:	00078513          	mv	a0,a5
    cd70:	5b1010ef          	jal	eb20 <__mulsi3>
    cd74:	01085793          	srl	a5,a6,0x10
    cd78:	01c888b3          	add	a7,a7,t3
    cd7c:	011787b3          	add	a5,a5,a7
    cd80:	01c7f463          	bgeu	a5,t3,cd88 <__divdf3+0x470>
    cd84:	00650533          	add	a0,a0,t1
    cd88:	00010637          	lui	a2,0x10
    cd8c:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    cd90:	00c7f4b3          	and	s1,a5,a2
    cd94:	0107d693          	srl	a3,a5,0x10
    cd98:	01049493          	sll	s1,s1,0x10
    cd9c:	00c87833          	and	a6,a6,a2
    cda0:	00a687b3          	add	a5,a3,a0
    cda4:	010484b3          	add	s1,s1,a6
    cda8:	20fbea63          	bltu	s7,a5,cfbc <__divdf3+0x6a4>
    cdac:	20fb8663          	beq	s7,a5,cfb8 <__divdf3+0x6a0>
    cdb0:	409d04b3          	sub	s1,s10,s1
    cdb4:	40fb8bb3          	sub	s7,s7,a5
    cdb8:	009d3d33          	sltu	s10,s10,s1
    cdbc:	41ab8bb3          	sub	s7,s7,s10
    cdc0:	377c8a63          	beq	s9,s7,d134 <__divdf3+0x81c>
    cdc4:	00090593          	mv	a1,s2
    cdc8:	000b8513          	mv	a0,s7
    cdcc:	619010ef          	jal	ebe4 <__hidden___udivsi3>
    cdd0:	00050593          	mv	a1,a0
    cdd4:	00a12623          	sw	a0,12(sp)
    cdd8:	00050d13          	mv	s10,a0
    cddc:	000b0513          	mv	a0,s6
    cde0:	541010ef          	jal	eb20 <__mulsi3>
    cde4:	00050793          	mv	a5,a0
    cde8:	00090593          	mv	a1,s2
    cdec:	000b8513          	mv	a0,s7
    cdf0:	00078b93          	mv	s7,a5
    cdf4:	639010ef          	jal	ec2c <__umodsi3>
    cdf8:	01051513          	sll	a0,a0,0x10
    cdfc:	0104d793          	srl	a5,s1,0x10
    ce00:	00a7e7b3          	or	a5,a5,a0
    ce04:	0377f063          	bgeu	a5,s7,ce24 <__divdf3+0x50c>
    ce08:	00fc87b3          	add	a5,s9,a5
    ce0c:	fffd0693          	add	a3,s10,-1
    ce10:	3797e263          	bltu	a5,s9,d174 <__divdf3+0x85c>
    ce14:	3777f063          	bgeu	a5,s7,d174 <__divdf3+0x85c>
    ce18:	ffed0713          	add	a4,s10,-2
    ce1c:	00e12623          	sw	a4,12(sp)
    ce20:	019787b3          	add	a5,a5,s9
    ce24:	41778bb3          	sub	s7,a5,s7
    ce28:	00090593          	mv	a1,s2
    ce2c:	000b8513          	mv	a0,s7
    ce30:	5b5010ef          	jal	ebe4 <__hidden___udivsi3>
    ce34:	00050593          	mv	a1,a0
    ce38:	00050d13          	mv	s10,a0
    ce3c:	000b0513          	mv	a0,s6
    ce40:	4e1010ef          	jal	eb20 <__mulsi3>
    ce44:	00050793          	mv	a5,a0
    ce48:	00090593          	mv	a1,s2
    ce4c:	000b8513          	mv	a0,s7
    ce50:	00078913          	mv	s2,a5
    ce54:	01049493          	sll	s1,s1,0x10
    ce58:	5d5010ef          	jal	ec2c <__umodsi3>
    ce5c:	01051513          	sll	a0,a0,0x10
    ce60:	0104d493          	srl	s1,s1,0x10
    ce64:	00a4e4b3          	or	s1,s1,a0
    ce68:	0124fe63          	bgeu	s1,s2,ce84 <__divdf3+0x56c>
    ce6c:	009c84b3          	add	s1,s9,s1
    ce70:	fffd0793          	add	a5,s10,-1
    ce74:	3194e463          	bltu	s1,s9,d17c <__divdf3+0x864>
    ce78:	3124f263          	bgeu	s1,s2,d17c <__divdf3+0x864>
    ce7c:	ffed0d13          	add	s10,s10,-2
    ce80:	019484b3          	add	s1,s1,s9
    ce84:	00c12783          	lw	a5,12(sp)
    ce88:	412484b3          	sub	s1,s1,s2
    ce8c:	000d8593          	mv	a1,s11
    ce90:	01079813          	sll	a6,a5,0x10
    ce94:	01a86833          	or	a6,a6,s10
    ce98:	01081313          	sll	t1,a6,0x10
    ce9c:	01035313          	srl	t1,t1,0x10
    cea0:	01085793          	srl	a5,a6,0x10
    cea4:	00030513          	mv	a0,t1
    cea8:	479010ef          	jal	eb20 <__mulsi3>
    ceac:	00050893          	mv	a7,a0
    ceb0:	000c0593          	mv	a1,s8
    ceb4:	00030513          	mv	a0,t1
    ceb8:	469010ef          	jal	eb20 <__mulsi3>
    cebc:	00050313          	mv	t1,a0
    cec0:	000d8593          	mv	a1,s11
    cec4:	00078513          	mv	a0,a5
    cec8:	459010ef          	jal	eb20 <__mulsi3>
    cecc:	00050e13          	mv	t3,a0
    ced0:	000c0593          	mv	a1,s8
    ced4:	00078513          	mv	a0,a5
    ced8:	449010ef          	jal	eb20 <__mulsi3>
    cedc:	0108d793          	srl	a5,a7,0x10
    cee0:	01c30333          	add	t1,t1,t3
    cee4:	006787b3          	add	a5,a5,t1
    cee8:	01c7f663          	bgeu	a5,t3,cef4 <__divdf3+0x5dc>
    ceec:	00010737          	lui	a4,0x10
    cef0:	00e50533          	add	a0,a0,a4
    cef4:	000106b7          	lui	a3,0x10
    cef8:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    cefc:	0107d713          	srl	a4,a5,0x10
    cf00:	00d7f7b3          	and	a5,a5,a3
    cf04:	01079793          	sll	a5,a5,0x10
    cf08:	00d8f8b3          	and	a7,a7,a3
    cf0c:	00a70733          	add	a4,a4,a0
    cf10:	011787b3          	add	a5,a5,a7
    cf14:	02e4e063          	bltu	s1,a4,cf34 <__divdf3+0x61c>
    cf18:	00e48c63          	beq	s1,a4,cf30 <__divdf3+0x618>
    cf1c:	02412c83          	lw	s9,36(sp)
    cf20:	02012d03          	lw	s10,32(sp)
    cf24:	01c12d83          	lw	s11,28(sp)
    cf28:	00186813          	or	a6,a6,1
    cf2c:	c61ff06f          	j	cb8c <__divdf3+0x274>
    cf30:	1c078a63          	beqz	a5,d104 <__divdf3+0x7ec>
    cf34:	009c84b3          	add	s1,s9,s1
    cf38:	fff80613          	add	a2,a6,-1
    cf3c:	00048693          	mv	a3,s1
    cf40:	1b94ec63          	bltu	s1,s9,d0f8 <__divdf3+0x7e0>
    cf44:	24e4ea63          	bltu	s1,a4,d198 <__divdf3+0x880>
    cf48:	26e48863          	beq	s1,a4,d1b8 <__divdf3+0x8a0>
    cf4c:	00060813          	mv	a6,a2
    cf50:	fcdff06f          	j	cf1c <__divdf3+0x604>
    cf54:	00100713          	li	a4,1
    cf58:	b20790e3          	bnez	a5,ca78 <__divdf3+0x160>
    cf5c:	41e98793          	add	a5,s3,1054
    cf60:	00f816b3          	sll	a3,a6,a5
    cf64:	00d036b3          	snez	a3,a3
    cf68:	00f417b3          	sll	a5,s0,a5
    cf6c:	00f6e7b3          	or	a5,a3,a5
    cf70:	00e85833          	srl	a6,a6,a4
    cf74:	00f86833          	or	a6,a6,a5
    cf78:	00787793          	and	a5,a6,7
    cf7c:	00e45433          	srl	s0,s0,a4
    cf80:	02078063          	beqz	a5,cfa0 <__divdf3+0x688>
    cf84:	00f87793          	and	a5,a6,15
    cf88:	00400713          	li	a4,4
    cf8c:	00e78a63          	beq	a5,a4,cfa0 <__divdf3+0x688>
    cf90:	00480793          	add	a5,a6,4
    cf94:	0107b833          	sltu	a6,a5,a6
    cf98:	01040433          	add	s0,s0,a6
    cf9c:	00078813          	mv	a6,a5
    cfa0:	00841613          	sll	a2,s0,0x8
    cfa4:	00100793          	li	a5,1
    cfa8:	00000693          	li	a3,0
    cfac:	00000713          	li	a4,0
    cfb0:	ae0640e3          	bltz	a2,ca90 <__divdf3+0x178>
    cfb4:	1280006f          	j	d0dc <__divdf3+0x7c4>
    cfb8:	de9d7ce3          	bgeu	s10,s1,cdb0 <__divdf3+0x498>
    cfbc:	015d06b3          	add	a3,s10,s5
    cfc0:	01a6b633          	sltu	a2,a3,s10
    cfc4:	019605b3          	add	a1,a2,s9
    cfc8:	00bb8bb3          	add	s7,s7,a1
    cfcc:	00068d13          	mv	s10,a3
    cfd0:	fff40593          	add	a1,s0,-1
    cfd4:	077cfe63          	bgeu	s9,s7,d050 <__divdf3+0x738>
    cfd8:	14fbe063          	bltu	s7,a5,d118 <__divdf3+0x800>
    cfdc:	13778c63          	beq	a5,s7,d114 <__divdf3+0x7fc>
    cfe0:	00058413          	mv	s0,a1
    cfe4:	dcdff06f          	j	cdb0 <__divdf3+0x498>
    cfe8:	c50bece3          	bltu	s7,a6,cc40 <__divdf3+0x328>
    cfec:	01fb1c13          	sll	s8,s6,0x1f
    cff0:	001bd713          	srl	a4,s7,0x1
    cff4:	001b5493          	srl	s1,s6,0x1
    cff8:	00ec6c33          	or	s8,s8,a4
    cffc:	01fb9d13          	sll	s10,s7,0x1f
    d000:	c51ff06f          	j	cc50 <__divdf3+0x338>
    d004:	000a0513          	mv	a0,s4
    d008:	489010ef          	jal	ec90 <__clzsi2>
    d00c:	01550693          	add	a3,a0,21
    d010:	01c00713          	li	a4,28
    d014:	02050793          	add	a5,a0,32
    d018:	a2d75ae3          	bge	a4,a3,ca4c <__divdf3+0x134>
    d01c:	ff850513          	add	a0,a0,-8
    d020:	00000813          	li	a6,0
    d024:	00aa1433          	sll	s0,s4,a0
    d028:	a41ff06f          	j	ca68 <__divdf3+0x150>
    d02c:	465010ef          	jal	ec90 <__clzsi2>
    d030:	01550793          	add	a5,a0,21
    d034:	01c00693          	li	a3,28
    d038:	02050713          	add	a4,a0,32
    d03c:	acf6dee3          	bge	a3,a5,cb18 <__divdf3+0x200>
    d040:	ff850493          	add	s1,a0,-8
    d044:	00941b33          	sll	s6,s0,s1
    d048:	00000b93          	li	s7,0
    d04c:	ae9ff06f          	j	cb34 <__divdf3+0x21c>
    d050:	f97c98e3          	bne	s9,s7,cfe0 <__divdf3+0x6c8>
    d054:	f80602e3          	beqz	a2,cfd8 <__divdf3+0x6c0>
    d058:	00058413          	mv	s0,a1
    d05c:	d55ff06f          	j	cdb0 <__divdf3+0x498>
    d060:	ca97f8e3          	bgeu	a5,s1,cd10 <__divdf3+0x3f8>
    d064:	ffeb8b93          	add	s7,s7,-2
    d068:	019787b3          	add	a5,a5,s9
    d06c:	ca9ff06f          	j	cd14 <__divdf3+0x3fc>
    d070:	c497f4e3          	bgeu	a5,s1,ccb8 <__divdf3+0x3a0>
    d074:	ffe40413          	add	s0,s0,-2
    d078:	019787b3          	add	a5,a5,s9
    d07c:	c41ff06f          	j	ccbc <__divdf3+0x3a4>
    d080:	01f00693          	li	a3,31
    d084:	ece6dce3          	bge	a3,a4,cf5c <__divdf3+0x644>
    d088:	fe100693          	li	a3,-31
    d08c:	40f686b3          	sub	a3,a3,a5
    d090:	02000793          	li	a5,32
    d094:	00d456b3          	srl	a3,s0,a3
    d098:	00f70863          	beq	a4,a5,d0a8 <__divdf3+0x790>
    d09c:	43e98793          	add	a5,s3,1086
    d0a0:	00f417b3          	sll	a5,s0,a5
    d0a4:	00f86833          	or	a6,a6,a5
    d0a8:	01003833          	snez	a6,a6
    d0ac:	00d86833          	or	a6,a6,a3
    d0b0:	00787713          	and	a4,a6,7
    d0b4:	00000693          	li	a3,0
    d0b8:	02070863          	beqz	a4,d0e8 <__divdf3+0x7d0>
    d0bc:	00f87793          	and	a5,a6,15
    d0c0:	00400713          	li	a4,4
    d0c4:	00000413          	li	s0,0
    d0c8:	00e78a63          	beq	a5,a4,d0dc <__divdf3+0x7c4>
    d0cc:	00480793          	add	a5,a6,4
    d0d0:	0107b833          	sltu	a6,a5,a6
    d0d4:	01003433          	snez	s0,a6
    d0d8:	00078813          	mv	a6,a5
    d0dc:	00941693          	sll	a3,s0,0x9
    d0e0:	01d41713          	sll	a4,s0,0x1d
    d0e4:	00c6d693          	srl	a3,a3,0xc
    d0e8:	00385813          	srl	a6,a6,0x3
    d0ec:	00e86733          	or	a4,a6,a4
    d0f0:	00000793          	li	a5,0
    d0f4:	99dff06f          	j	ca90 <__divdf3+0x178>
    d0f8:	00060813          	mv	a6,a2
    d0fc:	e2e690e3          	bne	a3,a4,cf1c <__divdf3+0x604>
    d100:	e1579ee3          	bne	a5,s5,cf1c <__divdf3+0x604>
    d104:	02412c83          	lw	s9,36(sp)
    d108:	02012d03          	lw	s10,32(sp)
    d10c:	01c12d83          	lw	s11,28(sp)
    d110:	a7dff06f          	j	cb8c <__divdf3+0x274>
    d114:	ec96f6e3          	bgeu	a3,s1,cfe0 <__divdf3+0x6c8>
    d118:	00da86b3          	add	a3,s5,a3
    d11c:	0156b633          	sltu	a2,a3,s5
    d120:	01960633          	add	a2,a2,s9
    d124:	ffe40413          	add	s0,s0,-2
    d128:	00068d13          	mv	s10,a3
    d12c:	00cb8bb3          	add	s7,s7,a2
    d130:	c81ff06f          	j	cdb0 <__divdf3+0x498>
    d134:	c0200713          	li	a4,-1022
    d138:	02412c83          	lw	s9,36(sp)
    d13c:	02012d03          	lw	s10,32(sp)
    d140:	01c12d83          	lw	s11,28(sp)
    d144:	3ff98793          	add	a5,s3,1023
    d148:	fff00813          	li	a6,-1
    d14c:	e0e9c4e3          	blt	s3,a4,cf54 <__divdf3+0x63c>
    d150:	00480713          	add	a4,a6,4
    d154:	01073833          	sltu	a6,a4,a6
    d158:	01040433          	add	s0,s0,a6
    d15c:	00070813          	mv	a6,a4
    d160:	a3dff06f          	j	cb9c <__divdf3+0x284>
    d164:	00f87713          	and	a4,a6,15
    d168:	00400693          	li	a3,4
    d16c:	a2d708e3          	beq	a4,a3,cb9c <__divdf3+0x284>
    d170:	fe1ff06f          	j	d150 <__divdf3+0x838>
    d174:	00d12623          	sw	a3,12(sp)
    d178:	cadff06f          	j	ce24 <__divdf3+0x50c>
    d17c:	00078d13          	mv	s10,a5
    d180:	d05ff06f          	j	ce84 <__divdf3+0x56c>
    d184:	00090a13          	mv	s4,s2
    d188:	7ff00793          	li	a5,2047
    d18c:	00000693          	li	a3,0
    d190:	00000713          	li	a4,0
    d194:	8fdff06f          	j	ca90 <__divdf3+0x178>
    d198:	001a9613          	sll	a2,s5,0x1
    d19c:	015636b3          	sltu	a3,a2,s5
    d1a0:	019686b3          	add	a3,a3,s9
    d1a4:	00d486b3          	add	a3,s1,a3
    d1a8:	ffe80813          	add	a6,a6,-2
    d1ac:	00060a93          	mv	s5,a2
    d1b0:	f4e688e3          	beq	a3,a4,d100 <__divdf3+0x7e8>
    d1b4:	d69ff06f          	j	cf1c <__divdf3+0x604>
    d1b8:	fefae0e3          	bltu	s5,a5,d198 <__divdf3+0x880>
    d1bc:	00060813          	mv	a6,a2
    d1c0:	f41ff06f          	j	d100 <__divdf3+0x7e8>

0000d1c4 <__eqdf2>:
    d1c4:	0145d713          	srl	a4,a1,0x14
    d1c8:	001007b7          	lui	a5,0x100
    d1cc:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d1d0:	0146d813          	srl	a6,a3,0x14
    d1d4:	7ff77713          	and	a4,a4,2047
    d1d8:	7ff00313          	li	t1,2047
    d1dc:	00b7fe33          	and	t3,a5,a1
    d1e0:	00050893          	mv	a7,a0
    d1e4:	00d7f7b3          	and	a5,a5,a3
    d1e8:	01f5d593          	srl	a1,a1,0x1f
    d1ec:	7ff87813          	and	a6,a6,2047
    d1f0:	01f6d693          	srl	a3,a3,0x1f
    d1f4:	00100513          	li	a0,1
    d1f8:	00670c63          	beq	a4,t1,d210 <__eqdf2+0x4c>
    d1fc:	00680863          	beq	a6,t1,d20c <__eqdf2+0x48>
    d200:	01071463          	bne	a4,a6,d208 <__eqdf2+0x44>
    d204:	02fe0663          	beq	t3,a5,d230 <__eqdf2+0x6c>
    d208:	00008067          	ret
    d20c:	00008067          	ret
    d210:	fee81ce3          	bne	a6,a4,d208 <__eqdf2+0x44>
    d214:	00fe67b3          	or	a5,t3,a5
    d218:	00c7e7b3          	or	a5,a5,a2
    d21c:	0117e7b3          	or	a5,a5,a7
    d220:	fe0794e3          	bnez	a5,d208 <__eqdf2+0x44>
    d224:	40d585b3          	sub	a1,a1,a3
    d228:	00b03533          	snez	a0,a1
    d22c:	00008067          	ret
    d230:	fcc89ce3          	bne	a7,a2,d208 <__eqdf2+0x44>
    d234:	00d58a63          	beq	a1,a3,d248 <__eqdf2+0x84>
    d238:	fc0718e3          	bnez	a4,d208 <__eqdf2+0x44>
    d23c:	011e6e33          	or	t3,t3,a7
    d240:	01c03533          	snez	a0,t3
    d244:	00008067          	ret
    d248:	00000513          	li	a0,0
    d24c:	00008067          	ret

0000d250 <__gedf2>:
    d250:	0145d893          	srl	a7,a1,0x14
    d254:	001007b7          	lui	a5,0x100
    d258:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d25c:	0146d713          	srl	a4,a3,0x14
    d260:	7ff8f893          	and	a7,a7,2047
    d264:	7ff00e13          	li	t3,2047
    d268:	00b7f333          	and	t1,a5,a1
    d26c:	00050813          	mv	a6,a0
    d270:	00050e93          	mv	t4,a0
    d274:	00d7f7b3          	and	a5,a5,a3
    d278:	01f5d593          	srl	a1,a1,0x1f
    d27c:	00060f13          	mv	t5,a2
    d280:	7ff77513          	and	a0,a4,2047
    d284:	01f6d693          	srl	a3,a3,0x1f
    d288:	05c88863          	beq	a7,t3,d2d8 <__gedf2+0x88>
    d28c:	03c50463          	beq	a0,t3,d2b4 <__gedf2+0x64>
    d290:	06089a63          	bnez	a7,d304 <__gedf2+0xb4>
    d294:	01036833          	or	a6,t1,a6
    d298:	06051063          	bnez	a0,d2f8 <__gedf2+0xa8>
    d29c:	00c7e633          	or	a2,a5,a2
    d2a0:	08060c63          	beqz	a2,d338 <__gedf2+0xe8>
    d2a4:	0a081263          	bnez	a6,d348 <__gedf2+0xf8>
    d2a8:	00100513          	li	a0,1
    d2ac:	08068263          	beqz	a3,d330 <__gedf2+0xe0>
    d2b0:	00008067          	ret
    d2b4:	00c7e633          	or	a2,a5,a2
    d2b8:	08061463          	bnez	a2,d340 <__gedf2+0xf0>
    d2bc:	00089663          	bnez	a7,d2c8 <__gedf2+0x78>
    d2c0:	01036333          	or	t1,t1,a6
    d2c4:	fe0302e3          	beqz	t1,d2a8 <__gedf2+0x58>
    d2c8:	06d58063          	beq	a1,a3,d328 <__gedf2+0xd8>
    d2cc:	06059263          	bnez	a1,d330 <__gedf2+0xe0>
    d2d0:	00100513          	li	a0,1
    d2d4:	00008067          	ret
    d2d8:	01036333          	or	t1,t1,a6
    d2dc:	06031263          	bnez	t1,d340 <__gedf2+0xf0>
    d2e0:	ff1516e3          	bne	a0,a7,d2cc <__gedf2+0x7c>
    d2e4:	00c7e7b3          	or	a5,a5,a2
    d2e8:	04079c63          	bnez	a5,d340 <__gedf2+0xf0>
    d2ec:	fed590e3          	bne	a1,a3,d2cc <__gedf2+0x7c>
    d2f0:	00000513          	li	a0,0
    d2f4:	00008067          	ret
    d2f8:	fa0808e3          	beqz	a6,d2a8 <__gedf2+0x58>
    d2fc:	fcd598e3          	bne	a1,a3,d2cc <__gedf2+0x7c>
    d300:	0280006f          	j	d328 <__gedf2+0xd8>
    d304:	fc0504e3          	beqz	a0,d2cc <__gedf2+0x7c>
    d308:	fcd592e3          	bne	a1,a3,d2cc <__gedf2+0x7c>
    d30c:	fd1540e3          	blt	a0,a7,d2cc <__gedf2+0x7c>
    d310:	00a8cc63          	blt	a7,a0,d328 <__gedf2+0xd8>
    d314:	fa67ece3          	bltu	a5,t1,d2cc <__gedf2+0x7c>
    d318:	00f31863          	bne	t1,a5,d328 <__gedf2+0xd8>
    d31c:	fbdf68e3          	bltu	t5,t4,d2cc <__gedf2+0x7c>
    d320:	00000513          	li	a0,0
    d324:	f9eef6e3          	bgeu	t4,t5,d2b0 <__gedf2+0x60>
    d328:	00100513          	li	a0,1
    d32c:	f80592e3          	bnez	a1,d2b0 <__gedf2+0x60>
    d330:	fff00513          	li	a0,-1
    d334:	00008067          	ret
    d338:	f8081ae3          	bnez	a6,d2cc <__gedf2+0x7c>
    d33c:	00008067          	ret
    d340:	ffe00513          	li	a0,-2
    d344:	00008067          	ret
    d348:	fcd586e3          	beq	a1,a3,d314 <__gedf2+0xc4>
    d34c:	f81ff06f          	j	d2cc <__gedf2+0x7c>

0000d350 <__ledf2>:
    d350:	0145d893          	srl	a7,a1,0x14
    d354:	001007b7          	lui	a5,0x100
    d358:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d35c:	0146d713          	srl	a4,a3,0x14
    d360:	7ff8f893          	and	a7,a7,2047
    d364:	7ff00313          	li	t1,2047
    d368:	00b7fe33          	and	t3,a5,a1
    d36c:	00050813          	mv	a6,a0
    d370:	00050e93          	mv	t4,a0
    d374:	00d7f7b3          	and	a5,a5,a3
    d378:	01f5d593          	srl	a1,a1,0x1f
    d37c:	00060f13          	mv	t5,a2
    d380:	7ff77513          	and	a0,a4,2047
    d384:	01f6d693          	srl	a3,a3,0x1f
    d388:	04688a63          	beq	a7,t1,d3dc <__ledf2+0x8c>
    d38c:	02650463          	beq	a0,t1,d3b4 <__ledf2+0x64>
    d390:	06089863          	bnez	a7,d400 <__ledf2+0xb0>
    d394:	010e6833          	or	a6,t3,a6
    d398:	08051e63          	bnez	a0,d434 <__ledf2+0xe4>
    d39c:	00c7e633          	or	a2,a5,a2
    d3a0:	0a060463          	beqz	a2,d448 <__ledf2+0xf8>
    d3a4:	0a081663          	bnez	a6,d450 <__ledf2+0x100>
    d3a8:	00100513          	li	a0,1
    d3ac:	08068063          	beqz	a3,d42c <__ledf2+0xdc>
    d3b0:	00008067          	ret
    d3b4:	00c7e633          	or	a2,a5,a2
    d3b8:	00200513          	li	a0,2
    d3bc:	fe061ae3          	bnez	a2,d3b0 <__ledf2+0x60>
    d3c0:	00089663          	bnez	a7,d3cc <__ledf2+0x7c>
    d3c4:	010e6e33          	or	t3,t3,a6
    d3c8:	fe0e00e3          	beqz	t3,d3a8 <__ledf2+0x58>
    d3cc:	04d58c63          	beq	a1,a3,d424 <__ledf2+0xd4>
    d3d0:	04059e63          	bnez	a1,d42c <__ledf2+0xdc>
    d3d4:	00100513          	li	a0,1
    d3d8:	00008067          	ret
    d3dc:	010e6e33          	or	t3,t3,a6
    d3e0:	060e1063          	bnez	t3,d440 <__ledf2+0xf0>
    d3e4:	ff1516e3          	bne	a0,a7,d3d0 <__ledf2+0x80>
    d3e8:	00c7e7b3          	or	a5,a5,a2
    d3ec:	00200513          	li	a0,2
    d3f0:	fc0790e3          	bnez	a5,d3b0 <__ledf2+0x60>
    d3f4:	fcd59ee3          	bne	a1,a3,d3d0 <__ledf2+0x80>
    d3f8:	00000513          	li	a0,0
    d3fc:	00008067          	ret
    d400:	fc0508e3          	beqz	a0,d3d0 <__ledf2+0x80>
    d404:	fcd596e3          	bne	a1,a3,d3d0 <__ledf2+0x80>
    d408:	fd1544e3          	blt	a0,a7,d3d0 <__ledf2+0x80>
    d40c:	00a8cc63          	blt	a7,a0,d424 <__ledf2+0xd4>
    d410:	fdc7e0e3          	bltu	a5,t3,d3d0 <__ledf2+0x80>
    d414:	00fe1863          	bne	t3,a5,d424 <__ledf2+0xd4>
    d418:	fbdf6ce3          	bltu	t5,t4,d3d0 <__ledf2+0x80>
    d41c:	00000513          	li	a0,0
    d420:	f9eef8e3          	bgeu	t4,t5,d3b0 <__ledf2+0x60>
    d424:	00100513          	li	a0,1
    d428:	f80594e3          	bnez	a1,d3b0 <__ledf2+0x60>
    d42c:	fff00513          	li	a0,-1
    d430:	00008067          	ret
    d434:	f6080ae3          	beqz	a6,d3a8 <__ledf2+0x58>
    d438:	f8d59ce3          	bne	a1,a3,d3d0 <__ledf2+0x80>
    d43c:	fe9ff06f          	j	d424 <__ledf2+0xd4>
    d440:	00200513          	li	a0,2
    d444:	00008067          	ret
    d448:	f80814e3          	bnez	a6,d3d0 <__ledf2+0x80>
    d44c:	00008067          	ret
    d450:	fcd580e3          	beq	a1,a3,d410 <__ledf2+0xc0>
    d454:	f7dff06f          	j	d3d0 <__ledf2+0x80>

0000d458 <__muldf3>:
    d458:	fd010113          	add	sp,sp,-48
    d45c:	0145d793          	srl	a5,a1,0x14
    d460:	02812423          	sw	s0,40(sp)
    d464:	02912223          	sw	s1,36(sp)
    d468:	03212023          	sw	s2,32(sp)
    d46c:	01312e23          	sw	s3,28(sp)
    d470:	01512a23          	sw	s5,20(sp)
    d474:	00c59493          	sll	s1,a1,0xc
    d478:	02112623          	sw	ra,44(sp)
    d47c:	01412c23          	sw	s4,24(sp)
    d480:	01612823          	sw	s6,16(sp)
    d484:	01712623          	sw	s7,12(sp)
    d488:	01812423          	sw	s8,8(sp)
    d48c:	7ff7f793          	and	a5,a5,2047
    d490:	00050413          	mv	s0,a0
    d494:	00060a93          	mv	s5,a2
    d498:	00068993          	mv	s3,a3
    d49c:	00c4d493          	srl	s1,s1,0xc
    d4a0:	01f5d913          	srl	s2,a1,0x1f
    d4a4:	4e078063          	beqz	a5,d984 <__muldf3+0x52c>
    d4a8:	7ff00713          	li	a4,2047
    d4ac:	0ae78663          	beq	a5,a4,d558 <__muldf3+0x100>
    d4b0:	00349693          	sll	a3,s1,0x3
    d4b4:	01d55713          	srl	a4,a0,0x1d
    d4b8:	00d76733          	or	a4,a4,a3
    d4bc:	008006b7          	lui	a3,0x800
    d4c0:	00d764b3          	or	s1,a4,a3
    d4c4:	00351a13          	sll	s4,a0,0x3
    d4c8:	c0178c13          	add	s8,a5,-1023
    d4cc:	00000b13          	li	s6,0
    d4d0:	00000b93          	li	s7,0
    d4d4:	0149d793          	srl	a5,s3,0x14
    d4d8:	00c99713          	sll	a4,s3,0xc
    d4dc:	7ff7f793          	and	a5,a5,2047
    d4e0:	000a8e13          	mv	t3,s5
    d4e4:	00c75413          	srl	s0,a4,0xc
    d4e8:	01f9d993          	srl	s3,s3,0x1f
    d4ec:	0a078063          	beqz	a5,d58c <__muldf3+0x134>
    d4f0:	7ff00713          	li	a4,2047
    d4f4:	14e78e63          	beq	a5,a4,d650 <__muldf3+0x1f8>
    d4f8:	00341713          	sll	a4,s0,0x3
    d4fc:	01dad693          	srl	a3,s5,0x1d
    d500:	00e6e6b3          	or	a3,a3,a4
    d504:	c0178793          	add	a5,a5,-1023
    d508:	00800737          	lui	a4,0x800
    d50c:	00e6e433          	or	s0,a3,a4
    d510:	003a9e13          	sll	t3,s5,0x3
    d514:	01878333          	add	t1,a5,s8
    d518:	00000693          	li	a3,0
    d51c:	00a00793          	li	a5,10
    d520:	00130893          	add	a7,t1,1
    d524:	0b67cc63          	blt	a5,s6,d5dc <__muldf3+0x184>
    d528:	013945b3          	xor	a1,s2,s3
    d52c:	00200793          	li	a5,2
    d530:	00058813          	mv	a6,a1
    d534:	1567c663          	blt	a5,s6,d680 <__muldf3+0x228>
    d538:	fffb0b13          	add	s6,s6,-1
    d53c:	00100713          	li	a4,1
    d540:	17676063          	bltu	a4,s6,d6a0 <__muldf3+0x248>
    d544:	48f68663          	beq	a3,a5,d9d0 <__muldf3+0x578>
    d548:	00040493          	mv	s1,s0
    d54c:	000e0a13          	mv	s4,t3
    d550:	00068b93          	mv	s7,a3
    d554:	09c0006f          	j	d5f0 <__muldf3+0x198>
    d558:	00a4ea33          	or	s4,s1,a0
    d55c:	480a1463          	bnez	s4,d9e4 <__muldf3+0x58c>
    d560:	0149d793          	srl	a5,s3,0x14
    d564:	00c99713          	sll	a4,s3,0xc
    d568:	7ff7f793          	and	a5,a5,2047
    d56c:	00000493          	li	s1,0
    d570:	00800b13          	li	s6,8
    d574:	7ff00c13          	li	s8,2047
    d578:	00200b93          	li	s7,2
    d57c:	000a8e13          	mv	t3,s5
    d580:	00c75413          	srl	s0,a4,0xc
    d584:	01f9d993          	srl	s3,s3,0x1f
    d588:	f60794e3          	bnez	a5,d4f0 <__muldf3+0x98>
    d58c:	015467b3          	or	a5,s0,s5
    d590:	46078e63          	beqz	a5,da0c <__muldf3+0x5b4>
    d594:	54040c63          	beqz	s0,daec <__muldf3+0x694>
    d598:	00040513          	mv	a0,s0
    d59c:	6f4010ef          	jal	ec90 <__clzsi2>
    d5a0:	00050313          	mv	t1,a0
    d5a4:	ff550713          	add	a4,a0,-11
    d5a8:	01d00793          	li	a5,29
    d5ac:	ff830e13          	add	t3,t1,-8
    d5b0:	40e787b3          	sub	a5,a5,a4
    d5b4:	00fad7b3          	srl	a5,s5,a5
    d5b8:	01c41733          	sll	a4,s0,t3
    d5bc:	00e7e433          	or	s0,a5,a4
    d5c0:	01ca9e33          	sll	t3,s5,t3
    d5c4:	406c0333          	sub	t1,s8,t1
    d5c8:	c0d30313          	add	t1,t1,-1011
    d5cc:	00a00793          	li	a5,10
    d5d0:	00000693          	li	a3,0
    d5d4:	00130893          	add	a7,t1,1
    d5d8:	f567d8e3          	bge	a5,s6,d528 <__muldf3+0xd0>
    d5dc:	00090593          	mv	a1,s2
    d5e0:	00200793          	li	a5,2
    d5e4:	3efb8663          	beq	s7,a5,d9d0 <__muldf3+0x578>
    d5e8:	00300793          	li	a5,3
    d5ec:	54fb8863          	beq	s7,a5,db3c <__muldf3+0x6e4>
    d5f0:	00100793          	li	a5,1
    d5f4:	00058813          	mv	a6,a1
    d5f8:	52fb9663          	bne	s7,a5,db24 <__muldf3+0x6cc>
    d5fc:	00000793          	li	a5,0
    d600:	00000693          	li	a3,0
    d604:	00000713          	li	a4,0
    d608:	02c12083          	lw	ra,44(sp)
    d60c:	02812403          	lw	s0,40(sp)
    d610:	01479793          	sll	a5,a5,0x14
    d614:	00d7e7b3          	or	a5,a5,a3
    d618:	01f81813          	sll	a6,a6,0x1f
    d61c:	0107e7b3          	or	a5,a5,a6
    d620:	02412483          	lw	s1,36(sp)
    d624:	02012903          	lw	s2,32(sp)
    d628:	01c12983          	lw	s3,28(sp)
    d62c:	01812a03          	lw	s4,24(sp)
    d630:	01412a83          	lw	s5,20(sp)
    d634:	01012b03          	lw	s6,16(sp)
    d638:	00c12b83          	lw	s7,12(sp)
    d63c:	00812c03          	lw	s8,8(sp)
    d640:	00070513          	mv	a0,a4
    d644:	00078593          	mv	a1,a5
    d648:	03010113          	add	sp,sp,48
    d64c:	00008067          	ret
    d650:	01546733          	or	a4,s0,s5
    d654:	7ffc0313          	add	t1,s8,2047
    d658:	3c070663          	beqz	a4,da24 <__muldf3+0x5cc>
    d65c:	00001737          	lui	a4,0x1
    d660:	01394833          	xor	a6,s2,s3
    d664:	80070713          	add	a4,a4,-2048 # 800 <main+0x530>
    d668:	003b6b13          	or	s6,s6,3
    d66c:	00a00693          	li	a3,10
    d670:	00080593          	mv	a1,a6
    d674:	00ec08b3          	add	a7,s8,a4
    d678:	4366cc63          	blt	a3,s6,dab0 <__muldf3+0x658>
    d67c:	00300693          	li	a3,3
    d680:	00100613          	li	a2,1
    d684:	01661633          	sll	a2,a2,s6
    d688:	53067713          	and	a4,a2,1328
    d68c:	f4071ae3          	bnez	a4,d5e0 <__muldf3+0x188>
    d690:	24067793          	and	a5,a2,576
    d694:	48079063          	bnez	a5,db14 <__muldf3+0x6bc>
    d698:	08867613          	and	a2,a2,136
    d69c:	38061e63          	bnez	a2,da38 <__muldf3+0x5e0>
    d6a0:	00010fb7          	lui	t6,0x10
    d6a4:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d6a8:	005a7f33          	and	t5,s4,t0
    d6ac:	005e72b3          	and	t0,t3,t0
    d6b0:	010a5a13          	srl	s4,s4,0x10
    d6b4:	010e5e13          	srl	t3,t3,0x10
    d6b8:	000f0513          	mv	a0,t5
    d6bc:	00028593          	mv	a1,t0
    d6c0:	460010ef          	jal	eb20 <__mulsi3>
    d6c4:	00050713          	mv	a4,a0
    d6c8:	000e0593          	mv	a1,t3
    d6cc:	000f0513          	mv	a0,t5
    d6d0:	450010ef          	jal	eb20 <__mulsi3>
    d6d4:	00050793          	mv	a5,a0
    d6d8:	00028593          	mv	a1,t0
    d6dc:	000a0513          	mv	a0,s4
    d6e0:	440010ef          	jal	eb20 <__mulsi3>
    d6e4:	00050e93          	mv	t4,a0
    d6e8:	000e0593          	mv	a1,t3
    d6ec:	000a0513          	mv	a0,s4
    d6f0:	430010ef          	jal	eb20 <__mulsi3>
    d6f4:	01d786b3          	add	a3,a5,t4
    d6f8:	01075393          	srl	t2,a4,0x10
    d6fc:	00d383b3          	add	t2,t2,a3
    d700:	00050793          	mv	a5,a0
    d704:	01d3f463          	bgeu	t2,t4,d70c <__muldf3+0x2b4>
    d708:	01f507b3          	add	a5,a0,t6
    d70c:	000109b7          	lui	s3,0x10
    d710:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d714:	0123feb3          	and	t4,t2,s2
    d718:	01277733          	and	a4,a4,s2
    d71c:	010e9e93          	sll	t4,t4,0x10
    d720:	01247933          	and	s2,s0,s2
    d724:	0103d393          	srl	t2,t2,0x10
    d728:	00ee8eb3          	add	t4,t4,a4
    d72c:	01045413          	srl	s0,s0,0x10
    d730:	000f0513          	mv	a0,t5
    d734:	00090593          	mv	a1,s2
    d738:	3e8010ef          	jal	eb20 <__mulsi3>
    d73c:	00050f93          	mv	t6,a0
    d740:	00040593          	mv	a1,s0
    d744:	000f0513          	mv	a0,t5
    d748:	3d8010ef          	jal	eb20 <__mulsi3>
    d74c:	00050713          	mv	a4,a0
    d750:	00090593          	mv	a1,s2
    d754:	000a0513          	mv	a0,s4
    d758:	3c8010ef          	jal	eb20 <__mulsi3>
    d75c:	00050f13          	mv	t5,a0
    d760:	00040593          	mv	a1,s0
    d764:	000a0513          	mv	a0,s4
    d768:	3b8010ef          	jal	eb20 <__mulsi3>
    d76c:	010fd693          	srl	a3,t6,0x10
    d770:	01e70733          	add	a4,a4,t5
    d774:	00e686b3          	add	a3,a3,a4
    d778:	01e6f463          	bgeu	a3,t5,d780 <__muldf3+0x328>
    d77c:	01350533          	add	a0,a0,s3
    d780:	00010a37          	lui	s4,0x10
    d784:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d788:	01e6f733          	and	a4,a3,t5
    d78c:	01efffb3          	and	t6,t6,t5
    d790:	01071713          	sll	a4,a4,0x10
    d794:	01f70733          	add	a4,a4,t6
    d798:	01e4ff33          	and	t5,s1,t5
    d79c:	0106d693          	srl	a3,a3,0x10
    d7a0:	00a68fb3          	add	t6,a3,a0
    d7a4:	00e383b3          	add	t2,t2,a4
    d7a8:	0104d493          	srl	s1,s1,0x10
    d7ac:	000f0513          	mv	a0,t5
    d7b0:	00028593          	mv	a1,t0
    d7b4:	36c010ef          	jal	eb20 <__mulsi3>
    d7b8:	00050a93          	mv	s5,a0
    d7bc:	000e0593          	mv	a1,t3
    d7c0:	000f0513          	mv	a0,t5
    d7c4:	35c010ef          	jal	eb20 <__mulsi3>
    d7c8:	00050993          	mv	s3,a0
    d7cc:	00028593          	mv	a1,t0
    d7d0:	00048513          	mv	a0,s1
    d7d4:	34c010ef          	jal	eb20 <__mulsi3>
    d7d8:	00050293          	mv	t0,a0
    d7dc:	000e0593          	mv	a1,t3
    d7e0:	00048513          	mv	a0,s1
    d7e4:	33c010ef          	jal	eb20 <__mulsi3>
    d7e8:	010ad613          	srl	a2,s5,0x10
    d7ec:	005989b3          	add	s3,s3,t0
    d7f0:	01360633          	add	a2,a2,s3
    d7f4:	00567463          	bgeu	a2,t0,d7fc <__muldf3+0x3a4>
    d7f8:	01450533          	add	a0,a0,s4
    d7fc:	00010a37          	lui	s4,0x10
    d800:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d804:	00d672b3          	and	t0,a2,a3
    d808:	00dafab3          	and	s5,s5,a3
    d80c:	01065613          	srl	a2,a2,0x10
    d810:	01029293          	sll	t0,t0,0x10
    d814:	00a60e33          	add	t3,a2,a0
    d818:	015282b3          	add	t0,t0,s5
    d81c:	000f0513          	mv	a0,t5
    d820:	00090593          	mv	a1,s2
    d824:	2fc010ef          	jal	eb20 <__mulsi3>
    d828:	00050993          	mv	s3,a0
    d82c:	00040593          	mv	a1,s0
    d830:	000f0513          	mv	a0,t5
    d834:	2ec010ef          	jal	eb20 <__mulsi3>
    d838:	00050f13          	mv	t5,a0
    d83c:	00090593          	mv	a1,s2
    d840:	00048513          	mv	a0,s1
    d844:	2dc010ef          	jal	eb20 <__mulsi3>
    d848:	00050913          	mv	s2,a0
    d84c:	00040593          	mv	a1,s0
    d850:	00048513          	mv	a0,s1
    d854:	2cc010ef          	jal	eb20 <__mulsi3>
    d858:	012f06b3          	add	a3,t5,s2
    d85c:	0109d593          	srl	a1,s3,0x10
    d860:	00d58433          	add	s0,a1,a3
    d864:	00050f13          	mv	t5,a0
    d868:	01247463          	bgeu	s0,s2,d870 <__muldf3+0x418>
    d86c:	01450f33          	add	t5,a0,s4
    d870:	00010637          	lui	a2,0x10
    d874:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d878:	00c476b3          	and	a3,s0,a2
    d87c:	00c9f9b3          	and	s3,s3,a2
    d880:	01069693          	sll	a3,a3,0x10
    d884:	007787b3          	add	a5,a5,t2
    d888:	013686b3          	add	a3,a3,s3
    d88c:	01f685b3          	add	a1,a3,t6
    d890:	00e7b733          	sltu	a4,a5,a4
    d894:	00e58733          	add	a4,a1,a4
    d898:	005782b3          	add	t0,a5,t0
    d89c:	01c70633          	add	a2,a4,t3
    d8a0:	00f2b7b3          	sltu	a5,t0,a5
    d8a4:	00f607b3          	add	a5,a2,a5
    d8a8:	00d5b6b3          	sltu	a3,a1,a3
    d8ac:	00b735b3          	sltu	a1,a4,a1
    d8b0:	00b6e6b3          	or	a3,a3,a1
    d8b4:	00e63733          	sltu	a4,a2,a4
    d8b8:	01045593          	srl	a1,s0,0x10
    d8bc:	00c7b633          	sltu	a2,a5,a2
    d8c0:	00b686b3          	add	a3,a3,a1
    d8c4:	00929a13          	sll	s4,t0,0x9
    d8c8:	00c76733          	or	a4,a4,a2
    d8cc:	00d70733          	add	a4,a4,a3
    d8d0:	01da6a33          	or	s4,s4,t4
    d8d4:	01e70733          	add	a4,a4,t5
    d8d8:	01403a33          	snez	s4,s4
    d8dc:	0172d293          	srl	t0,t0,0x17
    d8e0:	00971713          	sll	a4,a4,0x9
    d8e4:	0177d693          	srl	a3,a5,0x17
    d8e8:	005a6a33          	or	s4,s4,t0
    d8ec:	00979793          	sll	a5,a5,0x9
    d8f0:	00fa6a33          	or	s4,s4,a5
    d8f4:	00771793          	sll	a5,a4,0x7
    d8f8:	00d764b3          	or	s1,a4,a3
    d8fc:	0207d063          	bgez	a5,d91c <__muldf3+0x4c4>
    d900:	001a5793          	srl	a5,s4,0x1
    d904:	001a7a13          	and	s4,s4,1
    d908:	01f49713          	sll	a4,s1,0x1f
    d90c:	0147e7b3          	or	a5,a5,s4
    d910:	00e7ea33          	or	s4,a5,a4
    d914:	0014d493          	srl	s1,s1,0x1
    d918:	00088313          	mv	t1,a7
    d91c:	3ff30793          	add	a5,t1,1023
    d920:	12f05663          	blez	a5,da4c <__muldf3+0x5f4>
    d924:	007a7713          	and	a4,s4,7
    d928:	02070063          	beqz	a4,d948 <__muldf3+0x4f0>
    d92c:	00fa7713          	and	a4,s4,15
    d930:	00400693          	li	a3,4
    d934:	00d70a63          	beq	a4,a3,d948 <__muldf3+0x4f0>
    d938:	004a0713          	add	a4,s4,4
    d93c:	01473a33          	sltu	s4,a4,s4
    d940:	014484b3          	add	s1,s1,s4
    d944:	00070a13          	mv	s4,a4
    d948:	00749713          	sll	a4,s1,0x7
    d94c:	00075a63          	bgez	a4,d960 <__muldf3+0x508>
    d950:	ff0007b7          	lui	a5,0xff000
    d954:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    d958:	00f4f4b3          	and	s1,s1,a5
    d95c:	40030793          	add	a5,t1,1024
    d960:	7fe00713          	li	a4,2046
    d964:	1cf74463          	blt	a4,a5,db2c <__muldf3+0x6d4>
    d968:	003a5a13          	srl	s4,s4,0x3
    d96c:	01d49713          	sll	a4,s1,0x1d
    d970:	00949693          	sll	a3,s1,0x9
    d974:	01476733          	or	a4,a4,s4
    d978:	00c6d693          	srl	a3,a3,0xc
    d97c:	7ff7f793          	and	a5,a5,2047
    d980:	c89ff06f          	j	d608 <__muldf3+0x1b0>
    d984:	00a4ea33          	or	s4,s1,a0
    d988:	060a0863          	beqz	s4,d9f8 <__muldf3+0x5a0>
    d98c:	12048e63          	beqz	s1,dac8 <__muldf3+0x670>
    d990:	00048513          	mv	a0,s1
    d994:	2fc010ef          	jal	ec90 <__clzsi2>
    d998:	00050713          	mv	a4,a0
    d99c:	ff550693          	add	a3,a0,-11
    d9a0:	01d00793          	li	a5,29
    d9a4:	ff870a13          	add	s4,a4,-8
    d9a8:	40d787b3          	sub	a5,a5,a3
    d9ac:	00f457b3          	srl	a5,s0,a5
    d9b0:	014496b3          	sll	a3,s1,s4
    d9b4:	00d7e4b3          	or	s1,a5,a3
    d9b8:	01441a33          	sll	s4,s0,s4
    d9bc:	c0d00793          	li	a5,-1011
    d9c0:	40e78c33          	sub	s8,a5,a4
    d9c4:	00000b13          	li	s6,0
    d9c8:	00000b93          	li	s7,0
    d9cc:	b09ff06f          	j	d4d4 <__muldf3+0x7c>
    d9d0:	00058813          	mv	a6,a1
    d9d4:	7ff00793          	li	a5,2047
    d9d8:	00000693          	li	a3,0
    d9dc:	00000713          	li	a4,0
    d9e0:	c29ff06f          	j	d608 <__muldf3+0x1b0>
    d9e4:	00050a13          	mv	s4,a0
    d9e8:	00c00b13          	li	s6,12
    d9ec:	7ff00c13          	li	s8,2047
    d9f0:	00300b93          	li	s7,3
    d9f4:	ae1ff06f          	j	d4d4 <__muldf3+0x7c>
    d9f8:	00000493          	li	s1,0
    d9fc:	00400b13          	li	s6,4
    da00:	00000c13          	li	s8,0
    da04:	00100b93          	li	s7,1
    da08:	acdff06f          	j	d4d4 <__muldf3+0x7c>
    da0c:	001b6b13          	or	s6,s6,1
    da10:	000c0313          	mv	t1,s8
    da14:	00000413          	li	s0,0
    da18:	00000e13          	li	t3,0
    da1c:	00100693          	li	a3,1
    da20:	afdff06f          	j	d51c <__muldf3+0xc4>
    da24:	002b6b13          	or	s6,s6,2
    da28:	00000413          	li	s0,0
    da2c:	00000e13          	li	t3,0
    da30:	00200693          	li	a3,2
    da34:	ae9ff06f          	j	d51c <__muldf3+0xc4>
    da38:	00040493          	mv	s1,s0
    da3c:	000e0a13          	mv	s4,t3
    da40:	00068b93          	mv	s7,a3
    da44:	00098593          	mv	a1,s3
    da48:	b99ff06f          	j	d5e0 <__muldf3+0x188>
    da4c:	00100713          	li	a4,1
    da50:	10079063          	bnez	a5,db50 <__muldf3+0x6f8>
    da54:	41e30313          	add	t1,t1,1054
    da58:	006a1633          	sll	a2,s4,t1
    da5c:	00c03633          	snez	a2,a2
    da60:	00649333          	sll	t1,s1,t1
    da64:	00ea5a33          	srl	s4,s4,a4
    da68:	00666633          	or	a2,a2,t1
    da6c:	01466633          	or	a2,a2,s4
    da70:	00767793          	and	a5,a2,7
    da74:	00e4d5b3          	srl	a1,s1,a4
    da78:	02078063          	beqz	a5,da98 <__muldf3+0x640>
    da7c:	00f67793          	and	a5,a2,15
    da80:	00400713          	li	a4,4
    da84:	00e78a63          	beq	a5,a4,da98 <__muldf3+0x640>
    da88:	00460793          	add	a5,a2,4
    da8c:	00c7b633          	sltu	a2,a5,a2
    da90:	00c585b3          	add	a1,a1,a2
    da94:	00078613          	mv	a2,a5
    da98:	00859513          	sll	a0,a1,0x8
    da9c:	00100793          	li	a5,1
    daa0:	00000693          	li	a3,0
    daa4:	00000713          	li	a4,0
    daa8:	b60540e3          	bltz	a0,d608 <__muldf3+0x1b0>
    daac:	10c0006f          	j	dbb8 <__muldf3+0x760>
    dab0:	00f00713          	li	a4,15
    dab4:	12eb1063          	bne	s6,a4,dbd4 <__muldf3+0x77c>
    dab8:	00000813          	li	a6,0
    dabc:	000806b7          	lui	a3,0x80
    dac0:	00000713          	li	a4,0
    dac4:	b45ff06f          	j	d608 <__muldf3+0x1b0>
    dac8:	1c8010ef          	jal	ec90 <__clzsi2>
    dacc:	01550693          	add	a3,a0,21
    dad0:	01c00793          	li	a5,28
    dad4:	02050713          	add	a4,a0,32
    dad8:	ecd7d4e3          	bge	a5,a3,d9a0 <__muldf3+0x548>
    dadc:	ff850513          	add	a0,a0,-8
    dae0:	00000a13          	li	s4,0
    dae4:	00a414b3          	sll	s1,s0,a0
    dae8:	ed5ff06f          	j	d9bc <__muldf3+0x564>
    daec:	000a8513          	mv	a0,s5
    daf0:	1a0010ef          	jal	ec90 <__clzsi2>
    daf4:	01550713          	add	a4,a0,21
    daf8:	01c00793          	li	a5,28
    dafc:	02050313          	add	t1,a0,32
    db00:	aae7d4e3          	bge	a5,a4,d5a8 <__muldf3+0x150>
    db04:	ff850513          	add	a0,a0,-8
    db08:	00000e13          	li	t3,0
    db0c:	00aa9433          	sll	s0,s5,a0
    db10:	ab5ff06f          	j	d5c4 <__muldf3+0x16c>
    db14:	00000813          	li	a6,0
    db18:	7ff00793          	li	a5,2047
    db1c:	000806b7          	lui	a3,0x80
    db20:	ae9ff06f          	j	d608 <__muldf3+0x1b0>
    db24:	00088313          	mv	t1,a7
    db28:	df5ff06f          	j	d91c <__muldf3+0x4c4>
    db2c:	7ff00793          	li	a5,2047
    db30:	00000693          	li	a3,0
    db34:	00000713          	li	a4,0
    db38:	ad1ff06f          	j	d608 <__muldf3+0x1b0>
    db3c:	00000813          	li	a6,0
    db40:	7ff00793          	li	a5,2047
    db44:	000806b7          	lui	a3,0x80
    db48:	00000713          	li	a4,0
    db4c:	abdff06f          	j	d608 <__muldf3+0x1b0>
    db50:	40f70733          	sub	a4,a4,a5
    db54:	03800693          	li	a3,56
    db58:	aae6c2e3          	blt	a3,a4,d5fc <__muldf3+0x1a4>
    db5c:	01f00693          	li	a3,31
    db60:	eee6dae3          	bge	a3,a4,da54 <__muldf3+0x5fc>
    db64:	fe100693          	li	a3,-31
    db68:	40f687b3          	sub	a5,a3,a5
    db6c:	02000693          	li	a3,32
    db70:	00f4d7b3          	srl	a5,s1,a5
    db74:	00d70863          	beq	a4,a3,db84 <__muldf3+0x72c>
    db78:	43e30313          	add	t1,t1,1086
    db7c:	00649333          	sll	t1,s1,t1
    db80:	006a6a33          	or	s4,s4,t1
    db84:	01403633          	snez	a2,s4
    db88:	00f66633          	or	a2,a2,a5
    db8c:	00767713          	and	a4,a2,7
    db90:	00000693          	li	a3,0
    db94:	02070863          	beqz	a4,dbc4 <__muldf3+0x76c>
    db98:	00f67793          	and	a5,a2,15
    db9c:	00400713          	li	a4,4
    dba0:	00000593          	li	a1,0
    dba4:	00e78a63          	beq	a5,a4,dbb8 <__muldf3+0x760>
    dba8:	00460793          	add	a5,a2,4
    dbac:	00c7b633          	sltu	a2,a5,a2
    dbb0:	00c035b3          	snez	a1,a2
    dbb4:	00078613          	mv	a2,a5
    dbb8:	00959693          	sll	a3,a1,0x9
    dbbc:	01d59713          	sll	a4,a1,0x1d
    dbc0:	00c6d693          	srl	a3,a3,0xc
    dbc4:	00365613          	srl	a2,a2,0x3
    dbc8:	00e66733          	or	a4,a2,a4
    dbcc:	00000793          	li	a5,0
    dbd0:	a39ff06f          	j	d608 <__muldf3+0x1b0>
    dbd4:	00040493          	mv	s1,s0
    dbd8:	000a8a13          	mv	s4,s5
    dbdc:	00300b93          	li	s7,3
    dbe0:	00098593          	mv	a1,s3
    dbe4:	9fdff06f          	j	d5e0 <__muldf3+0x188>

0000dbe8 <__subdf3>:
    dbe8:	001007b7          	lui	a5,0x100
    dbec:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    dbf0:	fe010113          	add	sp,sp,-32
    dbf4:	00b7f8b3          	and	a7,a5,a1
    dbf8:	00d7f833          	and	a6,a5,a3
    dbfc:	0146d793          	srl	a5,a3,0x14
    dc00:	00389893          	sll	a7,a7,0x3
    dc04:	00812c23          	sw	s0,24(sp)
    dc08:	01312623          	sw	s3,12(sp)
    dc0c:	01f5d413          	srl	s0,a1,0x1f
    dc10:	0145d993          	srl	s3,a1,0x14
    dc14:	01d55713          	srl	a4,a0,0x1d
    dc18:	00381813          	sll	a6,a6,0x3
    dc1c:	01d65593          	srl	a1,a2,0x1d
    dc20:	00112e23          	sw	ra,28(sp)
    dc24:	00912a23          	sw	s1,20(sp)
    dc28:	01212823          	sw	s2,16(sp)
    dc2c:	7ff7ff13          	and	t5,a5,2047
    dc30:	7ff00313          	li	t1,2047
    dc34:	01176733          	or	a4,a4,a7
    dc38:	7ff9f993          	and	s3,s3,2047
    dc3c:	00040e13          	mv	t3,s0
    dc40:	00351893          	sll	a7,a0,0x3
    dc44:	01f6d693          	srl	a3,a3,0x1f
    dc48:	0105e5b3          	or	a1,a1,a6
    dc4c:	00361e93          	sll	t4,a2,0x3
    dc50:	206f0c63          	beq	t5,t1,de68 <__subdf3+0x280>
    dc54:	0016c693          	xor	a3,a3,1
    dc58:	41e987b3          	sub	a5,s3,t5
    dc5c:	16d40263          	beq	s0,a3,ddc0 <__subdf3+0x1d8>
    dc60:	00f05ae3          	blez	a5,e474 <__subdf3+0x88c>
    dc64:	240f0a63          	beqz	t5,deb8 <__subdf3+0x2d0>
    dc68:	3c698463          	beq	s3,t1,e030 <__subdf3+0x448>
    dc6c:	03800693          	li	a3,56
    dc70:	00100513          	li	a0,1
    dc74:	02f6ce63          	blt	a3,a5,dcb0 <__subdf3+0xc8>
    dc78:	008006b7          	lui	a3,0x800
    dc7c:	00d5e5b3          	or	a1,a1,a3
    dc80:	01f00693          	li	a3,31
    dc84:	4ef6c463          	blt	a3,a5,e16c <__subdf3+0x584>
    dc88:	02000693          	li	a3,32
    dc8c:	40f686b3          	sub	a3,a3,a5
    dc90:	00d59533          	sll	a0,a1,a3
    dc94:	00fed633          	srl	a2,t4,a5
    dc98:	00de96b3          	sll	a3,t4,a3
    dc9c:	00c56533          	or	a0,a0,a2
    dca0:	00d036b3          	snez	a3,a3
    dca4:	00f5d7b3          	srl	a5,a1,a5
    dca8:	00d56533          	or	a0,a0,a3
    dcac:	40f70733          	sub	a4,a4,a5
    dcb0:	40a88533          	sub	a0,a7,a0
    dcb4:	00a8b633          	sltu	a2,a7,a0
    dcb8:	00050493          	mv	s1,a0
    dcbc:	40c70933          	sub	s2,a4,a2
    dcc0:	00891793          	sll	a5,s2,0x8
    dcc4:	3407d863          	bgez	a5,e014 <__subdf3+0x42c>
    dcc8:	008007b7          	lui	a5,0x800
    dccc:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    dcd0:	00f97933          	and	s2,s2,a5
    dcd4:	2e090663          	beqz	s2,dfc0 <__subdf3+0x3d8>
    dcd8:	00090513          	mv	a0,s2
    dcdc:	7b5000ef          	jal	ec90 <__clzsi2>
    dce0:	ff850793          	add	a5,a0,-8
    dce4:	02000693          	li	a3,32
    dce8:	40f68733          	sub	a4,a3,a5
    dcec:	00e4d733          	srl	a4,s1,a4
    dcf0:	00f91933          	sll	s2,s2,a5
    dcf4:	01276733          	or	a4,a4,s2
    dcf8:	00f494b3          	sll	s1,s1,a5
    dcfc:	3f37c463          	blt	a5,s3,e0e4 <__subdf3+0x4fc>
    dd00:	413787b3          	sub	a5,a5,s3
    dd04:	00178793          	add	a5,a5,1
    dd08:	40f686b3          	sub	a3,a3,a5
    dd0c:	00d49633          	sll	a2,s1,a3
    dd10:	00f4d933          	srl	s2,s1,a5
    dd14:	00c03633          	snez	a2,a2
    dd18:	00c96633          	or	a2,s2,a2
    dd1c:	00d716b3          	sll	a3,a4,a3
    dd20:	00c6e4b3          	or	s1,a3,a2
    dd24:	00f75933          	srl	s2,a4,a5
    dd28:	00000993          	li	s3,0
    dd2c:	0074f793          	and	a5,s1,7
    dd30:	02078063          	beqz	a5,dd50 <__subdf3+0x168>
    dd34:	00f4f793          	and	a5,s1,15
    dd38:	00400713          	li	a4,4
    dd3c:	00e78a63          	beq	a5,a4,dd50 <__subdf3+0x168>
    dd40:	00448793          	add	a5,s1,4
    dd44:	0097b533          	sltu	a0,a5,s1
    dd48:	00a90933          	add	s2,s2,a0
    dd4c:	00078493          	mv	s1,a5
    dd50:	00891793          	sll	a5,s2,0x8
    dd54:	6c07d063          	bgez	a5,e414 <__subdf3+0x82c>
    dd58:	00198793          	add	a5,s3,1
    dd5c:	7ff00713          	li	a4,2047
    dd60:	24e78663          	beq	a5,a4,dfac <__subdf3+0x3c4>
    dd64:	ff800737          	lui	a4,0xff800
    dd68:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dd6c:	00e97733          	and	a4,s2,a4
    dd70:	7ff7f793          	and	a5,a5,2047
    dd74:	01d71813          	sll	a6,a4,0x1d
    dd78:	0034d513          	srl	a0,s1,0x3
    dd7c:	00971713          	sll	a4,a4,0x9
    dd80:	00a86833          	or	a6,a6,a0
    dd84:	00c75713          	srl	a4,a4,0xc
    dd88:	00147e13          	and	t3,s0,1
    dd8c:	01c12083          	lw	ra,28(sp)
    dd90:	01812403          	lw	s0,24(sp)
    dd94:	01479793          	sll	a5,a5,0x14
    dd98:	00e7e7b3          	or	a5,a5,a4
    dd9c:	01fe1713          	sll	a4,t3,0x1f
    dda0:	00e7e7b3          	or	a5,a5,a4
    dda4:	01412483          	lw	s1,20(sp)
    dda8:	01012903          	lw	s2,16(sp)
    ddac:	00c12983          	lw	s3,12(sp)
    ddb0:	00080513          	mv	a0,a6
    ddb4:	00078593          	mv	a1,a5
    ddb8:	02010113          	add	sp,sp,32
    ddbc:	00008067          	ret
    ddc0:	70f05263          	blez	a5,e4c4 <__subdf3+0x8dc>
    ddc4:	1c0f1663          	bnez	t5,df90 <__subdf3+0x3a8>
    ddc8:	01d5e6b3          	or	a3,a1,t4
    ddcc:	26068e63          	beqz	a3,e048 <__subdf3+0x460>
    ddd0:	fff78693          	add	a3,a5,-1
    ddd4:	46068863          	beqz	a3,e244 <__subdf3+0x65c>
    ddd8:	24678c63          	beq	a5,t1,e030 <__subdf3+0x448>
    dddc:	03800793          	li	a5,56
    dde0:	00100913          	li	s2,1
    dde4:	02d7cc63          	blt	a5,a3,de1c <__subdf3+0x234>
    dde8:	00068793          	mv	a5,a3
    ddec:	01f00693          	li	a3,31
    ddf0:	48f6ca63          	blt	a3,a5,e284 <__subdf3+0x69c>
    ddf4:	02000693          	li	a3,32
    ddf8:	40f686b3          	sub	a3,a3,a5
    ddfc:	00d59933          	sll	s2,a1,a3
    de00:	00fed633          	srl	a2,t4,a5
    de04:	00de96b3          	sll	a3,t4,a3
    de08:	00c96933          	or	s2,s2,a2
    de0c:	00d036b3          	snez	a3,a3
    de10:	00f5d7b3          	srl	a5,a1,a5
    de14:	00d96933          	or	s2,s2,a3
    de18:	00f70733          	add	a4,a4,a5
    de1c:	01190633          	add	a2,s2,a7
    de20:	01263933          	sltu	s2,a2,s2
    de24:	00060493          	mv	s1,a2
    de28:	00e90933          	add	s2,s2,a4
    de2c:	00891793          	sll	a5,s2,0x8
    de30:	1e07d263          	bgez	a5,e014 <__subdf3+0x42c>
    de34:	00198993          	add	s3,s3,1
    de38:	7ff00793          	li	a5,2047
    de3c:	16f98863          	beq	s3,a5,dfac <__subdf3+0x3c4>
    de40:	ff8007b7          	lui	a5,0xff800
    de44:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    de48:	0014f513          	and	a0,s1,1
    de4c:	00f977b3          	and	a5,s2,a5
    de50:	0014d713          	srl	a4,s1,0x1
    de54:	00a76733          	or	a4,a4,a0
    de58:	01f79513          	sll	a0,a5,0x1f
    de5c:	00e564b3          	or	s1,a0,a4
    de60:	0017d913          	srl	s2,a5,0x1
    de64:	ec9ff06f          	j	dd2c <__subdf3+0x144>
    de68:	01d5e833          	or	a6,a1,t4
    de6c:	80198313          	add	t1,s3,-2047
    de70:	06080863          	beqz	a6,dee0 <__subdf3+0x2f8>
    de74:	06d40a63          	beq	s0,a3,dee8 <__subdf3+0x300>
    de78:	0e030463          	beqz	t1,df60 <__subdf3+0x378>
    de7c:	26098e63          	beqz	s3,e0f8 <__subdf3+0x510>
    de80:	00361513          	sll	a0,a2,0x3
    de84:	00355513          	srl	a0,a0,0x3
    de88:	00068413          	mv	s0,a3
    de8c:	00058713          	mv	a4,a1
    de90:	01d71813          	sll	a6,a4,0x1d
    de94:	00a86833          	or	a6,a6,a0
    de98:	00375713          	srl	a4,a4,0x3
    de9c:	01076733          	or	a4,a4,a6
    dea0:	10070663          	beqz	a4,dfac <__subdf3+0x3c4>
    dea4:	00000e13          	li	t3,0
    dea8:	7ff00793          	li	a5,2047
    deac:	00080737          	lui	a4,0x80
    deb0:	00000813          	li	a6,0
    deb4:	ed9ff06f          	j	dd8c <__subdf3+0x1a4>
    deb8:	01d5e6b3          	or	a3,a1,t4
    debc:	18068663          	beqz	a3,e048 <__subdf3+0x460>
    dec0:	fff78693          	add	a3,a5,-1
    dec4:	3a068263          	beqz	a3,e268 <__subdf3+0x680>
    dec8:	16678463          	beq	a5,t1,e030 <__subdf3+0x448>
    decc:	03800793          	li	a5,56
    ded0:	00100513          	li	a0,1
    ded4:	dcd7cee3          	blt	a5,a3,dcb0 <__subdf3+0xc8>
    ded8:	00068793          	mv	a5,a3
    dedc:	da5ff06f          	j	dc80 <__subdf3+0x98>
    dee0:	0016c693          	xor	a3,a3,1
    dee4:	f8d41ae3          	bne	s0,a3,de78 <__subdf3+0x290>
    dee8:	18030863          	beqz	t1,e078 <__subdf3+0x490>
    deec:	2c099063          	bnez	s3,e1ac <__subdf3+0x5c4>
    def0:	7ff00793          	li	a5,2047
    def4:	011766b3          	or	a3,a4,a7
    def8:	48068863          	beqz	a3,e388 <__subdf3+0x7a0>
    defc:	fff78693          	add	a3,a5,-1
    df00:	34068263          	beqz	a3,e244 <__subdf3+0x65c>
    df04:	7ff00513          	li	a0,2047
    df08:	2aa78263          	beq	a5,a0,e1ac <__subdf3+0x5c4>
    df0c:	03800793          	li	a5,56
    df10:	00100913          	li	s2,1
    df14:	02d7ca63          	blt	a5,a3,df48 <__subdf3+0x360>
    df18:	01f00793          	li	a5,31
    df1c:	4cd7c663          	blt	a5,a3,e3e8 <__subdf3+0x800>
    df20:	02000793          	li	a5,32
    df24:	40d787b3          	sub	a5,a5,a3
    df28:	00f71933          	sll	s2,a4,a5
    df2c:	00d8d633          	srl	a2,a7,a3
    df30:	00f897b3          	sll	a5,a7,a5
    df34:	00c96933          	or	s2,s2,a2
    df38:	00f037b3          	snez	a5,a5
    df3c:	00d756b3          	srl	a3,a4,a3
    df40:	00f96933          	or	s2,s2,a5
    df44:	00d585b3          	add	a1,a1,a3
    df48:	01d90733          	add	a4,s2,t4
    df4c:	01273933          	sltu	s2,a4,s2
    df50:	00070493          	mv	s1,a4
    df54:	00b90933          	add	s2,s2,a1
    df58:	000f0993          	mv	s3,t5
    df5c:	ed1ff06f          	j	de2c <__subdf3+0x244>
    df60:	00198793          	add	a5,s3,1
    df64:	7fe7f793          	and	a5,a5,2046
    df68:	14079463          	bnez	a5,e0b0 <__subdf3+0x4c8>
    df6c:	01d5e833          	or	a6,a1,t4
    df70:	011767b3          	or	a5,a4,a7
    df74:	2a099463          	bnez	s3,e21c <__subdf3+0x634>
    df78:	38078e63          	beqz	a5,e314 <__subdf3+0x72c>
    df7c:	3c081063          	bnez	a6,e33c <__subdf3+0x754>
    df80:	00351513          	sll	a0,a0,0x3
    df84:	00355913          	srl	s2,a0,0x3
    df88:	00000793          	li	a5,0
    df8c:	1140006f          	j	e0a0 <__subdf3+0x4b8>
    df90:	0a698063          	beq	s3,t1,e030 <__subdf3+0x448>
    df94:	03800693          	li	a3,56
    df98:	00100913          	li	s2,1
    df9c:	e8f6c0e3          	blt	a3,a5,de1c <__subdf3+0x234>
    dfa0:	008006b7          	lui	a3,0x800
    dfa4:	00d5e5b3          	or	a1,a1,a3
    dfa8:	e45ff06f          	j	ddec <__subdf3+0x204>
    dfac:	00147e13          	and	t3,s0,1
    dfb0:	7ff00793          	li	a5,2047
    dfb4:	00000713          	li	a4,0
    dfb8:	00000813          	li	a6,0
    dfbc:	dd1ff06f          	j	dd8c <__subdf3+0x1a4>
    dfc0:	00048513          	mv	a0,s1
    dfc4:	4cd000ef          	jal	ec90 <__clzsi2>
    dfc8:	01850793          	add	a5,a0,24
    dfcc:	01f00693          	li	a3,31
    dfd0:	d0f6dae3          	bge	a3,a5,dce4 <__subdf3+0xfc>
    dfd4:	ff850713          	add	a4,a0,-8
    dfd8:	00e49733          	sll	a4,s1,a4
    dfdc:	1b37ce63          	blt	a5,s3,e198 <__subdf3+0x5b0>
    dfe0:	413789b3          	sub	s3,a5,s3
    dfe4:	00198793          	add	a5,s3,1
    dfe8:	42f6de63          	bge	a3,a5,e424 <__subdf3+0x83c>
    dfec:	fe198993          	add	s3,s3,-31
    dff0:	02000693          	li	a3,32
    dff4:	013754b3          	srl	s1,a4,s3
    dff8:	00d78c63          	beq	a5,a3,e010 <__subdf3+0x428>
    dffc:	04000693          	li	a3,64
    e000:	40f687b3          	sub	a5,a3,a5
    e004:	00f71733          	sll	a4,a4,a5
    e008:	00e03733          	snez	a4,a4
    e00c:	00e4e4b3          	or	s1,s1,a4
    e010:	00000993          	li	s3,0
    e014:	0074f793          	and	a5,s1,7
    e018:	d0079ee3          	bnez	a5,dd34 <__subdf3+0x14c>
    e01c:	00098793          	mv	a5,s3
    e020:	0034d513          	srl	a0,s1,0x3
    e024:	00090713          	mv	a4,s2
    e028:	0280006f          	j	e050 <__subdf3+0x468>
    e02c:	e6081ce3          	bnez	a6,dea4 <__subdf3+0x2bc>
    e030:	00351513          	sll	a0,a0,0x3
    e034:	01d71813          	sll	a6,a4,0x1d
    e038:	00355513          	srl	a0,a0,0x3
    e03c:	00a86833          	or	a6,a6,a0
    e040:	00375713          	srl	a4,a4,0x3
    e044:	e59ff06f          	j	de9c <__subdf3+0x2b4>
    e048:	00351513          	sll	a0,a0,0x3
    e04c:	00355513          	srl	a0,a0,0x3
    e050:	01d71813          	sll	a6,a4,0x1d
    e054:	7ff00693          	li	a3,2047
    e058:	00a86833          	or	a6,a6,a0
    e05c:	00375713          	srl	a4,a4,0x3
    e060:	e2d78ee3          	beq	a5,a3,de9c <__subdf3+0x2b4>
    e064:	00c71713          	sll	a4,a4,0xc
    e068:	00c75713          	srl	a4,a4,0xc
    e06c:	7ff7f793          	and	a5,a5,2047
    e070:	00147e13          	and	t3,s0,1
    e074:	d19ff06f          	j	dd8c <__subdf3+0x1a4>
    e078:	00198693          	add	a3,s3,1
    e07c:	7fe6f793          	and	a5,a3,2046
    e080:	12079e63          	bnez	a5,e1bc <__subdf3+0x5d4>
    e084:	011767b3          	or	a5,a4,a7
    e088:	24099a63          	bnez	s3,e2dc <__subdf3+0x6f4>
    e08c:	30078663          	beqz	a5,e398 <__subdf3+0x7b0>
    e090:	01d5e7b3          	or	a5,a1,t4
    e094:	30079a63          	bnez	a5,e3a8 <__subdf3+0x7c0>
    e098:	00351513          	sll	a0,a0,0x3
    e09c:	00355913          	srl	s2,a0,0x3
    e0a0:	01d71813          	sll	a6,a4,0x1d
    e0a4:	01286833          	or	a6,a6,s2
    e0a8:	00375713          	srl	a4,a4,0x3
    e0ac:	fb9ff06f          	j	e064 <__subdf3+0x47c>
    e0b0:	41d88833          	sub	a6,a7,t4
    e0b4:	0108b7b3          	sltu	a5,a7,a6
    e0b8:	40b70933          	sub	s2,a4,a1
    e0bc:	40f90933          	sub	s2,s2,a5
    e0c0:	00891793          	sll	a5,s2,0x8
    e0c4:	00080493          	mv	s1,a6
    e0c8:	1207c263          	bltz	a5,e1ec <__subdf3+0x604>
    e0cc:	01286833          	or	a6,a6,s2
    e0d0:	c00812e3          	bnez	a6,dcd4 <__subdf3+0xec>
    e0d4:	00000e13          	li	t3,0
    e0d8:	00000793          	li	a5,0
    e0dc:	00000713          	li	a4,0
    e0e0:	cadff06f          	j	dd8c <__subdf3+0x1a4>
    e0e4:	ff800937          	lui	s2,0xff800
    e0e8:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e0ec:	40f989b3          	sub	s3,s3,a5
    e0f0:	01277933          	and	s2,a4,s2
    e0f4:	c39ff06f          	j	dd2c <__subdf3+0x144>
    e0f8:	7ff00793          	li	a5,2047
    e0fc:	01176533          	or	a0,a4,a7
    e100:	10050463          	beqz	a0,e208 <__subdf3+0x620>
    e104:	fff78813          	add	a6,a5,-1
    e108:	1e080263          	beqz	a6,e2ec <__subdf3+0x704>
    e10c:	7ff00513          	li	a0,2047
    e110:	d6a788e3          	beq	a5,a0,de80 <__subdf3+0x298>
    e114:	03800793          	li	a5,56
    e118:	00068413          	mv	s0,a3
    e11c:	00100513          	li	a0,1
    e120:	0307ca63          	blt	a5,a6,e154 <__subdf3+0x56c>
    e124:	01f00793          	li	a5,31
    e128:	1907c463          	blt	a5,a6,e2b0 <__subdf3+0x6c8>
    e12c:	02000793          	li	a5,32
    e130:	410787b3          	sub	a5,a5,a6
    e134:	00f71533          	sll	a0,a4,a5
    e138:	0108d6b3          	srl	a3,a7,a6
    e13c:	00f897b3          	sll	a5,a7,a5
    e140:	00d56533          	or	a0,a0,a3
    e144:	00f037b3          	snez	a5,a5
    e148:	01075833          	srl	a6,a4,a6
    e14c:	00f56533          	or	a0,a0,a5
    e150:	410585b3          	sub	a1,a1,a6
    e154:	40ae8533          	sub	a0,t4,a0
    e158:	00aeb733          	sltu	a4,t4,a0
    e15c:	00050493          	mv	s1,a0
    e160:	40e58933          	sub	s2,a1,a4
    e164:	000f0993          	mv	s3,t5
    e168:	b59ff06f          	j	dcc0 <__subdf3+0xd8>
    e16c:	fe078693          	add	a3,a5,-32
    e170:	02000613          	li	a2,32
    e174:	00d5d6b3          	srl	a3,a1,a3
    e178:	00c78a63          	beq	a5,a2,e18c <__subdf3+0x5a4>
    e17c:	04000613          	li	a2,64
    e180:	40f607b3          	sub	a5,a2,a5
    e184:	00f597b3          	sll	a5,a1,a5
    e188:	00feeeb3          	or	t4,t4,a5
    e18c:	01d03533          	snez	a0,t4
    e190:	00d56533          	or	a0,a0,a3
    e194:	b1dff06f          	j	dcb0 <__subdf3+0xc8>
    e198:	ff8006b7          	lui	a3,0xff800
    e19c:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e1a0:	40f987b3          	sub	a5,s3,a5
    e1a4:	00d77733          	and	a4,a4,a3
    e1a8:	ef9ff06f          	j	e0a0 <__subdf3+0x4b8>
    e1ac:	00361513          	sll	a0,a2,0x3
    e1b0:	00355513          	srl	a0,a0,0x3
    e1b4:	00058713          	mv	a4,a1
    e1b8:	cd9ff06f          	j	de90 <__subdf3+0x2a8>
    e1bc:	7ff00793          	li	a5,2047
    e1c0:	def686e3          	beq	a3,a5,dfac <__subdf3+0x3c4>
    e1c4:	01d88eb3          	add	t4,a7,t4
    e1c8:	011eb633          	sltu	a2,t4,a7
    e1cc:	00b707b3          	add	a5,a4,a1
    e1d0:	00c787b3          	add	a5,a5,a2
    e1d4:	01f79513          	sll	a0,a5,0x1f
    e1d8:	001ede93          	srl	t4,t4,0x1
    e1dc:	01d564b3          	or	s1,a0,t4
    e1e0:	0017d913          	srl	s2,a5,0x1
    e1e4:	00068993          	mv	s3,a3
    e1e8:	b45ff06f          	j	dd2c <__subdf3+0x144>
    e1ec:	411e8633          	sub	a2,t4,a7
    e1f0:	40e587b3          	sub	a5,a1,a4
    e1f4:	00ceb733          	sltu	a4,t4,a2
    e1f8:	00060493          	mv	s1,a2
    e1fc:	40e78933          	sub	s2,a5,a4
    e200:	00068413          	mv	s0,a3
    e204:	ad1ff06f          	j	dcd4 <__subdf3+0xec>
    e208:	00361613          	sll	a2,a2,0x3
    e20c:	00365513          	srl	a0,a2,0x3
    e210:	00068413          	mv	s0,a3
    e214:	00058713          	mv	a4,a1
    e218:	e39ff06f          	j	e050 <__subdf3+0x468>
    e21c:	e00798e3          	bnez	a5,e02c <__subdf3+0x444>
    e220:	22080663          	beqz	a6,e44c <__subdf3+0x864>
    e224:	0035d713          	srl	a4,a1,0x3
    e228:	00361613          	sll	a2,a2,0x3
    e22c:	01d59593          	sll	a1,a1,0x1d
    e230:	00b76733          	or	a4,a4,a1
    e234:	00365613          	srl	a2,a2,0x3
    e238:	00c76733          	or	a4,a4,a2
    e23c:	00068413          	mv	s0,a3
    e240:	c61ff06f          	j	dea0 <__subdf3+0x2b8>
    e244:	01d88eb3          	add	t4,a7,t4
    e248:	00b705b3          	add	a1,a4,a1
    e24c:	011eb633          	sltu	a2,t4,a7
    e250:	00c58933          	add	s2,a1,a2
    e254:	00891793          	sll	a5,s2,0x8
    e258:	000e8493          	mv	s1,t4
    e25c:	0a07d863          	bgez	a5,e30c <__subdf3+0x724>
    e260:	00200993          	li	s3,2
    e264:	bddff06f          	j	de40 <__subdf3+0x258>
    e268:	41d88eb3          	sub	t4,a7,t4
    e26c:	40b705b3          	sub	a1,a4,a1
    e270:	01d8b633          	sltu	a2,a7,t4
    e274:	000e8493          	mv	s1,t4
    e278:	40c58933          	sub	s2,a1,a2
    e27c:	00100993          	li	s3,1
    e280:	a41ff06f          	j	dcc0 <__subdf3+0xd8>
    e284:	fe078693          	add	a3,a5,-32
    e288:	02000613          	li	a2,32
    e28c:	00d5d6b3          	srl	a3,a1,a3
    e290:	00c78a63          	beq	a5,a2,e2a4 <__subdf3+0x6bc>
    e294:	04000613          	li	a2,64
    e298:	40f607b3          	sub	a5,a2,a5
    e29c:	00f597b3          	sll	a5,a1,a5
    e2a0:	00feeeb3          	or	t4,t4,a5
    e2a4:	01d03933          	snez	s2,t4
    e2a8:	00d96933          	or	s2,s2,a3
    e2ac:	b71ff06f          	j	de1c <__subdf3+0x234>
    e2b0:	fe080793          	add	a5,a6,-32
    e2b4:	02000693          	li	a3,32
    e2b8:	00f757b3          	srl	a5,a4,a5
    e2bc:	00d80a63          	beq	a6,a3,e2d0 <__subdf3+0x6e8>
    e2c0:	04000693          	li	a3,64
    e2c4:	410686b3          	sub	a3,a3,a6
    e2c8:	00d71733          	sll	a4,a4,a3
    e2cc:	00e8e8b3          	or	a7,a7,a4
    e2d0:	01103533          	snez	a0,a7
    e2d4:	00f56533          	or	a0,a0,a5
    e2d8:	e7dff06f          	j	e154 <__subdf3+0x56c>
    e2dc:	ec0788e3          	beqz	a5,e1ac <__subdf3+0x5c4>
    e2e0:	01d5eeb3          	or	t4,a1,t4
    e2e4:	bc0e90e3          	bnez	t4,dea4 <__subdf3+0x2bc>
    e2e8:	d49ff06f          	j	e030 <__subdf3+0x448>
    e2ec:	411e8633          	sub	a2,t4,a7
    e2f0:	40e585b3          	sub	a1,a1,a4
    e2f4:	00ceb733          	sltu	a4,t4,a2
    e2f8:	00060493          	mv	s1,a2
    e2fc:	40e58933          	sub	s2,a1,a4
    e300:	00068413          	mv	s0,a3
    e304:	00100993          	li	s3,1
    e308:	9b9ff06f          	j	dcc0 <__subdf3+0xd8>
    e30c:	00100793          	li	a5,1
    e310:	d11ff06f          	j	e020 <__subdf3+0x438>
    e314:	dc0800e3          	beqz	a6,e0d4 <__subdf3+0x4ec>
    e318:	00361613          	sll	a2,a2,0x3
    e31c:	00365793          	srl	a5,a2,0x3
    e320:	01d59813          	sll	a6,a1,0x1d
    e324:	00959713          	sll	a4,a1,0x9
    e328:	00f86833          	or	a6,a6,a5
    e32c:	00c75713          	srl	a4,a4,0xc
    e330:	00068e13          	mv	t3,a3
    e334:	00000793          	li	a5,0
    e338:	a55ff06f          	j	dd8c <__subdf3+0x1a4>
    e33c:	41d88933          	sub	s2,a7,t4
    e340:	0128b7b3          	sltu	a5,a7,s2
    e344:	40b70633          	sub	a2,a4,a1
    e348:	40f60633          	sub	a2,a2,a5
    e34c:	00861793          	sll	a5,a2,0x8
    e350:	0e07d263          	bgez	a5,e434 <__subdf3+0x84c>
    e354:	411e8633          	sub	a2,t4,a7
    e358:	40e58733          	sub	a4,a1,a4
    e35c:	00cebeb3          	sltu	t4,t4,a2
    e360:	41d70733          	sub	a4,a4,t4
    e364:	00871793          	sll	a5,a4,0x8
    e368:	00060493          	mv	s1,a2
    e36c:	1207de63          	bgez	a5,e4a8 <__subdf3+0x8c0>
    e370:	ff8007b7          	lui	a5,0xff800
    e374:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e378:	00f77733          	and	a4,a4,a5
    e37c:	00068413          	mv	s0,a3
    e380:	00100793          	li	a5,1
    e384:	9f1ff06f          	j	dd74 <__subdf3+0x18c>
    e388:	00361613          	sll	a2,a2,0x3
    e38c:	00365513          	srl	a0,a2,0x3
    e390:	00058713          	mv	a4,a1
    e394:	cbdff06f          	j	e050 <__subdf3+0x468>
    e398:	00361613          	sll	a2,a2,0x3
    e39c:	00365913          	srl	s2,a2,0x3
    e3a0:	00058713          	mv	a4,a1
    e3a4:	cfdff06f          	j	e0a0 <__subdf3+0x4b8>
    e3a8:	01d886b3          	add	a3,a7,t4
    e3ac:	00b707b3          	add	a5,a4,a1
    e3b0:	0116b633          	sltu	a2,a3,a7
    e3b4:	00c787b3          	add	a5,a5,a2
    e3b8:	00879713          	sll	a4,a5,0x8
    e3bc:	0036d813          	srl	a6,a3,0x3
    e3c0:	08075e63          	bgez	a4,e45c <__subdf3+0x874>
    e3c4:	ff800737          	lui	a4,0xff800
    e3c8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e3cc:	00e7f7b3          	and	a5,a5,a4
    e3d0:	01d79713          	sll	a4,a5,0x1d
    e3d4:	00979793          	sll	a5,a5,0x9
    e3d8:	01076833          	or	a6,a4,a6
    e3dc:	00c7d713          	srl	a4,a5,0xc
    e3e0:	00100793          	li	a5,1
    e3e4:	9a9ff06f          	j	dd8c <__subdf3+0x1a4>
    e3e8:	fe068793          	add	a5,a3,-32
    e3ec:	02000613          	li	a2,32
    e3f0:	00f757b3          	srl	a5,a4,a5
    e3f4:	00c68a63          	beq	a3,a2,e408 <__subdf3+0x820>
    e3f8:	04000613          	li	a2,64
    e3fc:	40d606b3          	sub	a3,a2,a3
    e400:	00d71733          	sll	a4,a4,a3
    e404:	00e8e8b3          	or	a7,a7,a4
    e408:	01103933          	snez	s2,a7
    e40c:	00f96933          	or	s2,s2,a5
    e410:	b39ff06f          	j	df48 <__subdf3+0x360>
    e414:	0034d513          	srl	a0,s1,0x3
    e418:	00098793          	mv	a5,s3
    e41c:	00090713          	mv	a4,s2
    e420:	c31ff06f          	j	e050 <__subdf3+0x468>
    e424:	02000693          	li	a3,32
    e428:	40f686b3          	sub	a3,a3,a5
    e42c:	00000613          	li	a2,0
    e430:	8e9ff06f          	j	dd18 <__subdf3+0x130>
    e434:	00c96833          	or	a6,s2,a2
    e438:	c8080ee3          	beqz	a6,e0d4 <__subdf3+0x4ec>
    e43c:	00395913          	srl	s2,s2,0x3
    e440:	00000793          	li	a5,0
    e444:	00060713          	mv	a4,a2
    e448:	c59ff06f          	j	e0a0 <__subdf3+0x4b8>
    e44c:	00000e13          	li	t3,0
    e450:	7ff00793          	li	a5,2047
    e454:	00080737          	lui	a4,0x80
    e458:	935ff06f          	j	dd8c <__subdf3+0x1a4>
    e45c:	01d79713          	sll	a4,a5,0x1d
    e460:	00979793          	sll	a5,a5,0x9
    e464:	01076833          	or	a6,a4,a6
    e468:	00c7d713          	srl	a4,a5,0xc
    e46c:	00000793          	li	a5,0
    e470:	91dff06f          	j	dd8c <__subdf3+0x1a4>
    e474:	ae0786e3          	beqz	a5,df60 <__subdf3+0x378>
    e478:	413f0833          	sub	a6,t5,s3
    e47c:	00080793          	mv	a5,a6
    e480:	c6098ee3          	beqz	s3,e0fc <__subdf3+0x514>
    e484:	03800793          	li	a5,56
    e488:	0107ca63          	blt	a5,a6,e49c <__subdf3+0x8b4>
    e48c:	008007b7          	lui	a5,0x800
    e490:	00f76733          	or	a4,a4,a5
    e494:	00068413          	mv	s0,a3
    e498:	c8dff06f          	j	e124 <__subdf3+0x53c>
    e49c:	00068413          	mv	s0,a3
    e4a0:	00100513          	li	a0,1
    e4a4:	cb1ff06f          	j	e154 <__subdf3+0x56c>
    e4a8:	01d71813          	sll	a6,a4,0x1d
    e4ac:	00365613          	srl	a2,a2,0x3
    e4b0:	00c86833          	or	a6,a6,a2
    e4b4:	00375713          	srl	a4,a4,0x3
    e4b8:	00000793          	li	a5,0
    e4bc:	00068413          	mv	s0,a3
    e4c0:	ba5ff06f          	j	e064 <__subdf3+0x47c>
    e4c4:	ba078ae3          	beqz	a5,e078 <__subdf3+0x490>
    e4c8:	413f06b3          	sub	a3,t5,s3
    e4cc:	00099663          	bnez	s3,e4d8 <__subdf3+0x8f0>
    e4d0:	00068793          	mv	a5,a3
    e4d4:	a21ff06f          	j	def4 <__subdf3+0x30c>
    e4d8:	03800793          	li	a5,56
    e4dc:	00100913          	li	s2,1
    e4e0:	a6d7c4e3          	blt	a5,a3,df48 <__subdf3+0x360>
    e4e4:	008007b7          	lui	a5,0x800
    e4e8:	00f76733          	or	a4,a4,a5
    e4ec:	a2dff06f          	j	df18 <__subdf3+0x330>

0000e4f0 <__unorddf2>:
    e4f0:	0145d713          	srl	a4,a1,0x14
    e4f4:	001007b7          	lui	a5,0x100
    e4f8:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e4fc:	fff74713          	not	a4,a4
    e500:	0146d813          	srl	a6,a3,0x14
    e504:	00b7f5b3          	and	a1,a5,a1
    e508:	00d7f7b3          	and	a5,a5,a3
    e50c:	01571693          	sll	a3,a4,0x15
    e510:	7ff87813          	and	a6,a6,2047
    e514:	02068063          	beqz	a3,e534 <__unorddf2+0x44>
    e518:	7ff00713          	li	a4,2047
    e51c:	00000513          	li	a0,0
    e520:	00e80463          	beq	a6,a4,e528 <__unorddf2+0x38>
    e524:	00008067          	ret
    e528:	00c7e7b3          	or	a5,a5,a2
    e52c:	00f03533          	snez	a0,a5
    e530:	00008067          	ret
    e534:	00a5e5b3          	or	a1,a1,a0
    e538:	00100513          	li	a0,1
    e53c:	fc058ee3          	beqz	a1,e518 <__unorddf2+0x28>
    e540:	00008067          	ret

0000e544 <__fixdfsi>:
    e544:	0145d793          	srl	a5,a1,0x14
    e548:	001006b7          	lui	a3,0x100
    e54c:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e550:	7ff7f793          	and	a5,a5,2047
    e554:	3fe00613          	li	a2,1022
    e558:	00b77733          	and	a4,a4,a1
    e55c:	01f5d593          	srl	a1,a1,0x1f
    e560:	00f65e63          	bge	a2,a5,e57c <__fixdfsi+0x38>
    e564:	41d00613          	li	a2,1053
    e568:	00f65e63          	bge	a2,a5,e584 <__fixdfsi+0x40>
    e56c:	80000537          	lui	a0,0x80000
    e570:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e574:	00a58533          	add	a0,a1,a0
    e578:	00008067          	ret
    e57c:	00000513          	li	a0,0
    e580:	00008067          	ret
    e584:	43300613          	li	a2,1075
    e588:	40f60633          	sub	a2,a2,a5
    e58c:	01f00813          	li	a6,31
    e590:	00d76733          	or	a4,a4,a3
    e594:	02c85063          	bge	a6,a2,e5b4 <__fixdfsi+0x70>
    e598:	41300693          	li	a3,1043
    e59c:	40f687b3          	sub	a5,a3,a5
    e5a0:	00f75733          	srl	a4,a4,a5
    e5a4:	40e00533          	neg	a0,a4
    e5a8:	fc059ce3          	bnez	a1,e580 <__fixdfsi+0x3c>
    e5ac:	00070513          	mv	a0,a4
    e5b0:	00008067          	ret
    e5b4:	bed78793          	add	a5,a5,-1043
    e5b8:	00f71733          	sll	a4,a4,a5
    e5bc:	00c55533          	srl	a0,a0,a2
    e5c0:	00a76733          	or	a4,a4,a0
    e5c4:	fe1ff06f          	j	e5a4 <__fixdfsi+0x60>

0000e5c8 <__floatsidf>:
    e5c8:	ff010113          	add	sp,sp,-16
    e5cc:	00112623          	sw	ra,12(sp)
    e5d0:	00812423          	sw	s0,8(sp)
    e5d4:	00912223          	sw	s1,4(sp)
    e5d8:	04050a63          	beqz	a0,e62c <__floatsidf+0x64>
    e5dc:	41f55713          	sra	a4,a0,0x1f
    e5e0:	00a744b3          	xor	s1,a4,a0
    e5e4:	40e484b3          	sub	s1,s1,a4
    e5e8:	00050793          	mv	a5,a0
    e5ec:	00048513          	mv	a0,s1
    e5f0:	01f7d413          	srl	s0,a5,0x1f
    e5f4:	69c000ef          	jal	ec90 <__clzsi2>
    e5f8:	41e00793          	li	a5,1054
    e5fc:	40a787b3          	sub	a5,a5,a0
    e600:	00a00713          	li	a4,10
    e604:	7ff7f793          	and	a5,a5,2047
    e608:	06a74063          	blt	a4,a0,e668 <__floatsidf+0xa0>
    e60c:	00b00713          	li	a4,11
    e610:	40a70733          	sub	a4,a4,a0
    e614:	00e4d733          	srl	a4,s1,a4
    e618:	01550513          	add	a0,a0,21
    e61c:	00c71713          	sll	a4,a4,0xc
    e620:	00a494b3          	sll	s1,s1,a0
    e624:	00c75713          	srl	a4,a4,0xc
    e628:	0140006f          	j	e63c <__floatsidf+0x74>
    e62c:	00000413          	li	s0,0
    e630:	00000793          	li	a5,0
    e634:	00000713          	li	a4,0
    e638:	00000493          	li	s1,0
    e63c:	01479793          	sll	a5,a5,0x14
    e640:	01f41413          	sll	s0,s0,0x1f
    e644:	00e7e7b3          	or	a5,a5,a4
    e648:	00c12083          	lw	ra,12(sp)
    e64c:	0087e7b3          	or	a5,a5,s0
    e650:	00812403          	lw	s0,8(sp)
    e654:	00048513          	mv	a0,s1
    e658:	00078593          	mv	a1,a5
    e65c:	00412483          	lw	s1,4(sp)
    e660:	01010113          	add	sp,sp,16
    e664:	00008067          	ret
    e668:	ff550513          	add	a0,a0,-11
    e66c:	00a49733          	sll	a4,s1,a0
    e670:	00c71713          	sll	a4,a4,0xc
    e674:	00c75713          	srl	a4,a4,0xc
    e678:	00000493          	li	s1,0
    e67c:	fc1ff06f          	j	e63c <__floatsidf+0x74>

0000e680 <__floatunsidf>:
    e680:	ff010113          	add	sp,sp,-16
    e684:	00812423          	sw	s0,8(sp)
    e688:	00112623          	sw	ra,12(sp)
    e68c:	00050413          	mv	s0,a0
    e690:	04050c63          	beqz	a0,e6e8 <__floatunsidf+0x68>
    e694:	5fc000ef          	jal	ec90 <__clzsi2>
    e698:	41e00793          	li	a5,1054
    e69c:	40a787b3          	sub	a5,a5,a0
    e6a0:	00a00713          	li	a4,10
    e6a4:	7ff7f793          	and	a5,a5,2047
    e6a8:	06a74463          	blt	a4,a0,e710 <__floatunsidf+0x90>
    e6ac:	00b00713          	li	a4,11
    e6b0:	40a70733          	sub	a4,a4,a0
    e6b4:	01550513          	add	a0,a0,21
    e6b8:	00e45733          	srl	a4,s0,a4
    e6bc:	00a41433          	sll	s0,s0,a0
    e6c0:	00c12083          	lw	ra,12(sp)
    e6c4:	00040513          	mv	a0,s0
    e6c8:	00c71713          	sll	a4,a4,0xc
    e6cc:	00812403          	lw	s0,8(sp)
    e6d0:	00c75713          	srl	a4,a4,0xc
    e6d4:	01479793          	sll	a5,a5,0x14
    e6d8:	00e7e7b3          	or	a5,a5,a4
    e6dc:	00078593          	mv	a1,a5
    e6e0:	01010113          	add	sp,sp,16
    e6e4:	00008067          	ret
    e6e8:	00c12083          	lw	ra,12(sp)
    e6ec:	00040513          	mv	a0,s0
    e6f0:	00000793          	li	a5,0
    e6f4:	00812403          	lw	s0,8(sp)
    e6f8:	00000713          	li	a4,0
    e6fc:	01479793          	sll	a5,a5,0x14
    e700:	00e7e7b3          	or	a5,a5,a4
    e704:	00078593          	mv	a1,a5
    e708:	01010113          	add	sp,sp,16
    e70c:	00008067          	ret
    e710:	ff550513          	add	a0,a0,-11
    e714:	00a41733          	sll	a4,s0,a0
    e718:	00000413          	li	s0,0
    e71c:	00c12083          	lw	ra,12(sp)
    e720:	00040513          	mv	a0,s0
    e724:	00c71713          	sll	a4,a4,0xc
    e728:	00812403          	lw	s0,8(sp)
    e72c:	00c75713          	srl	a4,a4,0xc
    e730:	01479793          	sll	a5,a5,0x14
    e734:	00e7e7b3          	or	a5,a5,a4
    e738:	00078593          	mv	a1,a5
    e73c:	01010113          	add	sp,sp,16
    e740:	00008067          	ret

0000e744 <__trunctfdf2>:
    e744:	00c52583          	lw	a1,12(a0)
    e748:	00852783          	lw	a5,8(a0)
    e74c:	00052803          	lw	a6,0(a0)
    e750:	00452683          	lw	a3,4(a0)
    e754:	01059613          	sll	a2,a1,0x10
    e758:	fe010113          	add	sp,sp,-32
    e75c:	00159713          	sll	a4,a1,0x1
    e760:	01065613          	srl	a2,a2,0x10
    e764:	00f12423          	sw	a5,8(sp)
    e768:	00b12623          	sw	a1,12(sp)
    e76c:	00f12c23          	sw	a5,24(sp)
    e770:	01012023          	sw	a6,0(sp)
    e774:	00d12223          	sw	a3,4(sp)
    e778:	01012823          	sw	a6,16(sp)
    e77c:	00d12a23          	sw	a3,20(sp)
    e780:	00c12e23          	sw	a2,28(sp)
    e784:	01175713          	srl	a4,a4,0x11
    e788:	01f5d593          	srl	a1,a1,0x1f
    e78c:	01010893          	add	a7,sp,16
    e790:	01c10793          	add	a5,sp,28
    e794:	00361513          	sll	a0,a2,0x3
    e798:	ffc7a603          	lw	a2,-4(a5)
    e79c:	ffc78793          	add	a5,a5,-4
    e7a0:	01d65693          	srl	a3,a2,0x1d
    e7a4:	00a6e6b3          	or	a3,a3,a0
    e7a8:	00d7a223          	sw	a3,4(a5)
    e7ac:	fef894e3          	bne	a7,a5,e794 <__trunctfdf2+0x50>
    e7b0:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e7b4:	00381813          	sll	a6,a6,0x3
    e7b8:	01169613          	sll	a2,a3,0x11
    e7bc:	01012823          	sw	a6,16(sp)
    e7c0:	01265613          	srl	a2,a2,0x12
    e7c4:	04060263          	beqz	a2,e808 <__trunctfdf2+0xc4>
    e7c8:	ffffc6b7          	lui	a3,0xffffc
    e7cc:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e7d0:	00d70733          	add	a4,a4,a3
    e7d4:	7fe00693          	li	a3,2046
    e7d8:	10e6d463          	bge	a3,a4,e8e0 <__trunctfdf2+0x19c>
    e7dc:	7ff00793          	li	a5,2047
    e7e0:	00000613          	li	a2,0
    e7e4:	00000693          	li	a3,0
    e7e8:	01479793          	sll	a5,a5,0x14
    e7ec:	01f59593          	sll	a1,a1,0x1f
    e7f0:	00c7e7b3          	or	a5,a5,a2
    e7f4:	00b7e7b3          	or	a5,a5,a1
    e7f8:	00068513          	mv	a0,a3
    e7fc:	00078593          	mv	a1,a5
    e800:	02010113          	add	sp,sp,32
    e804:	00008067          	ret
    e808:	01412603          	lw	a2,20(sp)
    e80c:	01812883          	lw	a7,24(sp)
    e810:	01c12503          	lw	a0,28(sp)
    e814:	011666b3          	or	a3,a2,a7
    e818:	00a6e6b3          	or	a3,a3,a0
    e81c:	0106e6b3          	or	a3,a3,a6
    e820:	04071463          	bnez	a4,e868 <__trunctfdf2+0x124>
    e824:	14068263          	beqz	a3,e968 <__trunctfdf2+0x224>
    e828:	00500693          	li	a3,5
    e82c:	00000613          	li	a2,0
    e830:	0036d793          	srl	a5,a3,0x3
    e834:	01d61693          	sll	a3,a2,0x1d
    e838:	00f6e6b3          	or	a3,a3,a5
    e83c:	00961613          	sll	a2,a2,0x9
    e840:	7ff77793          	and	a5,a4,2047
    e844:	00c65613          	srl	a2,a2,0xc
    e848:	01479793          	sll	a5,a5,0x14
    e84c:	01f59593          	sll	a1,a1,0x1f
    e850:	00c7e7b3          	or	a5,a5,a2
    e854:	00b7e7b3          	or	a5,a5,a1
    e858:	00068513          	mv	a0,a3
    e85c:	00078593          	mv	a1,a5
    e860:	02010113          	add	sp,sp,32
    e864:	00008067          	ret
    e868:	12068463          	beqz	a3,e990 <__trunctfdf2+0x24c>
    e86c:	01c8d793          	srl	a5,a7,0x1c
    e870:	00451513          	sll	a0,a0,0x4
    e874:	00a7e7b3          	or	a5,a5,a0
    e878:	008006b7          	lui	a3,0x800
    e87c:	00d7f6b3          	and	a3,a5,a3
    e880:	1c068263          	beqz	a3,ea44 <__trunctfdf2+0x300>
    e884:	ff800737          	lui	a4,0xff800
    e888:	01c65693          	srl	a3,a2,0x1c
    e88c:	00489893          	sll	a7,a7,0x4
    e890:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e894:	00e7f633          	and	a2,a5,a4
    e898:	0116e6b3          	or	a3,a3,a7
    e89c:	004007b7          	lui	a5,0x400
    e8a0:	00f66633          	or	a2,a2,a5
    e8a4:	ff86f693          	and	a3,a3,-8
    e8a8:	00000793          	li	a5,0
    e8ac:	0036d713          	srl	a4,a3,0x3
    e8b0:	01d61693          	sll	a3,a2,0x1d
    e8b4:	00961613          	sll	a2,a2,0x9
    e8b8:	00c65613          	srl	a2,a2,0xc
    e8bc:	01479793          	sll	a5,a5,0x14
    e8c0:	01f59593          	sll	a1,a1,0x1f
    e8c4:	00c7e7b3          	or	a5,a5,a2
    e8c8:	00e6e6b3          	or	a3,a3,a4
    e8cc:	00b7e7b3          	or	a5,a5,a1
    e8d0:	00068513          	mv	a0,a3
    e8d4:	00078593          	mv	a1,a5
    e8d8:	02010113          	add	sp,sp,32
    e8dc:	00008067          	ret
    e8e0:	0ce05c63          	blez	a4,e9b8 <__trunctfdf2+0x274>
    e8e4:	01412783          	lw	a5,20(sp)
    e8e8:	01812503          	lw	a0,24(sp)
    e8ec:	01c12603          	lw	a2,28(sp)
    e8f0:	00479693          	sll	a3,a5,0x4
    e8f4:	0106e6b3          	or	a3,a3,a6
    e8f8:	01c7d793          	srl	a5,a5,0x1c
    e8fc:	00451813          	sll	a6,a0,0x4
    e900:	00461613          	sll	a2,a2,0x4
    e904:	01c55513          	srl	a0,a0,0x1c
    e908:	00d036b3          	snez	a3,a3
    e90c:	0107e7b3          	or	a5,a5,a6
    e910:	00a66633          	or	a2,a2,a0
    e914:	00f6e6b3          	or	a3,a3,a5
    e918:	0076f793          	and	a5,a3,7
    e91c:	02078063          	beqz	a5,e93c <__trunctfdf2+0x1f8>
    e920:	00f6f793          	and	a5,a3,15
    e924:	00400513          	li	a0,4
    e928:	00a78a63          	beq	a5,a0,e93c <__trunctfdf2+0x1f8>
    e92c:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    e930:	00d7b6b3          	sltu	a3,a5,a3
    e934:	00d60633          	add	a2,a2,a3
    e938:	00078693          	mv	a3,a5
    e93c:	008007b7          	lui	a5,0x800
    e940:	00f677b3          	and	a5,a2,a5
    e944:	ee0786e3          	beqz	a5,e830 <__trunctfdf2+0xec>
    e948:	00170713          	add	a4,a4,1
    e94c:	7ff00793          	li	a5,2047
    e950:	e8f706e3          	beq	a4,a5,e7dc <__trunctfdf2+0x98>
    e954:	ff8007b7          	lui	a5,0xff800
    e958:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e95c:	00f67633          	and	a2,a2,a5
    e960:	7ff77793          	and	a5,a4,2047
    e964:	f49ff06f          	j	e8ac <__trunctfdf2+0x168>
    e968:	00000793          	li	a5,0
    e96c:	00000613          	li	a2,0
    e970:	01479793          	sll	a5,a5,0x14
    e974:	01f59593          	sll	a1,a1,0x1f
    e978:	00c7e7b3          	or	a5,a5,a2
    e97c:	00b7e7b3          	or	a5,a5,a1
    e980:	00068513          	mv	a0,a3
    e984:	00078593          	mv	a1,a5
    e988:	02010113          	add	sp,sp,32
    e98c:	00008067          	ret
    e990:	7ff00793          	li	a5,2047
    e994:	00000613          	li	a2,0
    e998:	01479793          	sll	a5,a5,0x14
    e99c:	01f59593          	sll	a1,a1,0x1f
    e9a0:	00c7e7b3          	or	a5,a5,a2
    e9a4:	00b7e7b3          	or	a5,a5,a1
    e9a8:	00068513          	mv	a0,a3
    e9ac:	00078593          	mv	a1,a5
    e9b0:	02010113          	add	sp,sp,32
    e9b4:	00008067          	ret
    e9b8:	fcc00693          	li	a3,-52
    e9bc:	08d74c63          	blt	a4,a3,ea54 <__trunctfdf2+0x310>
    e9c0:	03d00693          	li	a3,61
    e9c4:	40e686b3          	sub	a3,a3,a4
    e9c8:	01c12703          	lw	a4,28(sp)
    e9cc:	4056de13          	sra	t3,a3,0x5
    e9d0:	00080eb7          	lui	t4,0x80
    e9d4:	00eeeeb3          	or	t4,t4,a4
    e9d8:	002e1513          	sll	a0,t3,0x2
    e9dc:	01d12e23          	sw	t4,28(sp)
    e9e0:	01f6f693          	and	a3,a3,31
    e9e4:	00a88833          	add	a6,a7,a0
    e9e8:	00088613          	mv	a2,a7
    e9ec:	00000713          	li	a4,0
    e9f0:	00062303          	lw	t1,0(a2)
    e9f4:	00460613          	add	a2,a2,4
    e9f8:	00676733          	or	a4,a4,t1
    e9fc:	fec81ae3          	bne	a6,a2,e9f0 <__trunctfdf2+0x2ac>
    ea00:	00300613          	li	a2,3
    ea04:	41c60633          	sub	a2,a2,t3
    ea08:	04069a63          	bnez	a3,ea5c <__trunctfdf2+0x318>
    ea0c:	00082803          	lw	a6,0(a6)
    ea10:	00168693          	add	a3,a3,1
    ea14:	00478793          	add	a5,a5,4
    ea18:	ff07ae23          	sw	a6,-4(a5)
    ea1c:	00d64e63          	blt	a2,a3,ea38 <__trunctfdf2+0x2f4>
    ea20:	00a78833          	add	a6,a5,a0
    ea24:	00082803          	lw	a6,0(a6)
    ea28:	00168693          	add	a3,a3,1
    ea2c:	00478793          	add	a5,a5,4
    ea30:	ff07ae23          	sw	a6,-4(a5)
    ea34:	fed656e3          	bge	a2,a3,ea20 <__trunctfdf2+0x2dc>
    ea38:	00400793          	li	a5,4
    ea3c:	41c787b3          	sub	a5,a5,t3
    ea40:	0840006f          	j	eac4 <__trunctfdf2+0x380>
    ea44:	00000593          	li	a1,0
    ea48:	7ff00793          	li	a5,2047
    ea4c:	00080637          	lui	a2,0x80
    ea50:	d99ff06f          	j	e7e8 <__trunctfdf2+0xa4>
    ea54:	00000713          	li	a4,0
    ea58:	dd1ff06f          	j	e828 <__trunctfdf2+0xe4>
    ea5c:	02050813          	add	a6,a0,32
    ea60:	00280833          	add	a6,a6,sp
    ea64:	ff082803          	lw	a6,-16(a6)
    ea68:	02000f13          	li	t5,32
    ea6c:	40df0f33          	sub	t5,t5,a3
    ea70:	01e81833          	sll	a6,a6,t5
    ea74:	01076733          	or	a4,a4,a6
    ea78:	08060e63          	beqz	a2,eb14 <__trunctfdf2+0x3d0>
    ea7c:	00261813          	sll	a6,a2,0x2
    ea80:	00f80fb3          	add	t6,a6,a5
    ea84:	00a88633          	add	a2,a7,a0
    ea88:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    ea8c:	00462303          	lw	t1,4(a2)
    ea90:	00478793          	add	a5,a5,4
    ea94:	00d55533          	srl	a0,a0,a3
    ea98:	01e31333          	sll	t1,t1,t5
    ea9c:	00656533          	or	a0,a0,t1
    eaa0:	fea7ae23          	sw	a0,-4(a5)
    eaa4:	00460613          	add	a2,a2,4
    eaa8:	feff90e3          	bne	t6,a5,ea88 <__trunctfdf2+0x344>
    eaac:	00400793          	li	a5,4
    eab0:	41c787b3          	sub	a5,a5,t3
    eab4:	02080613          	add	a2,a6,32
    eab8:	00260633          	add	a2,a2,sp
    eabc:	00dedeb3          	srl	t4,t4,a3
    eac0:	ffd62823          	sw	t4,-16(a2)
    eac4:	00400693          	li	a3,4
    eac8:	40f686b3          	sub	a3,a3,a5
    eacc:	00269693          	sll	a3,a3,0x2
    ead0:	00279793          	sll	a5,a5,0x2
    ead4:	00800613          	li	a2,8
    ead8:	00f888b3          	add	a7,a7,a5
    eadc:	00c6ea63          	bltu	a3,a2,eaf0 <__trunctfdf2+0x3ac>
    eae0:	0008a023          	sw	zero,0(a7)
    eae4:	0008a223          	sw	zero,4(a7)
    eae8:	ff868693          	add	a3,a3,-8
    eaec:	00888893          	add	a7,a7,8
    eaf0:	00400793          	li	a5,4
    eaf4:	00f6e463          	bltu	a3,a5,eafc <__trunctfdf2+0x3b8>
    eaf8:	0008a023          	sw	zero,0(a7)
    eafc:	01012783          	lw	a5,16(sp)
    eb00:	00e03733          	snez	a4,a4
    eb04:	01412603          	lw	a2,20(sp)
    eb08:	00f766b3          	or	a3,a4,a5
    eb0c:	00000713          	li	a4,0
    eb10:	e09ff06f          	j	e918 <__trunctfdf2+0x1d4>
    eb14:	00100793          	li	a5,1
    eb18:	00000813          	li	a6,0
    eb1c:	f99ff06f          	j	eab4 <__trunctfdf2+0x370>

0000eb20 <__mulsi3>:
    eb20:	00050613          	mv	a2,a0
    eb24:	00000513          	li	a0,0
    eb28:	0015f693          	and	a3,a1,1
    eb2c:	00068463          	beqz	a3,eb34 <__mulsi3+0x14>
    eb30:	00c50533          	add	a0,a0,a2
    eb34:	0015d593          	srl	a1,a1,0x1
    eb38:	00161613          	sll	a2,a2,0x1
    eb3c:	fe0596e3          	bnez	a1,eb28 <__mulsi3+0x8>
    eb40:	00008067          	ret

0000eb44 <__muldi3>:
    eb44:	ff010113          	add	sp,sp,-16
    eb48:	00812423          	sw	s0,8(sp)
    eb4c:	00050413          	mv	s0,a0
    eb50:	00112623          	sw	ra,12(sp)
    eb54:	00060513          	mv	a0,a2
    eb58:	00068393          	mv	t2,a3
    eb5c:	00040713          	mv	a4,s0
    eb60:	00060813          	mv	a6,a2
    eb64:	00000793          	li	a5,0
    eb68:	00000313          	li	t1,0
    eb6c:	00000f13          	li	t5,0
    eb70:	01e708b3          	add	a7,a4,t5
    eb74:	00187e93          	and	t4,a6,1
    eb78:	00f30fb3          	add	t6,t1,a5
    eb7c:	01f75e13          	srl	t3,a4,0x1f
    eb80:	00185813          	srl	a6,a6,0x1
    eb84:	00e8b2b3          	sltu	t0,a7,a4
    eb88:	00179793          	sll	a5,a5,0x1
    eb8c:	000e8663          	beqz	t4,eb98 <__muldi3+0x54>
    eb90:	00088f13          	mv	t5,a7
    eb94:	01f28333          	add	t1,t0,t6
    eb98:	00171713          	sll	a4,a4,0x1
    eb9c:	01c7e7b3          	or	a5,a5,t3
    eba0:	fc0818e3          	bnez	a6,eb70 <__muldi3+0x2c>
    eba4:	00058663          	beqz	a1,ebb0 <__muldi3+0x6c>
    eba8:	f79ff0ef          	jal	eb20 <__mulsi3>
    ebac:	00650333          	add	t1,a0,t1
    ebb0:	00038a63          	beqz	t2,ebc4 <__muldi3+0x80>
    ebb4:	00040513          	mv	a0,s0
    ebb8:	00038593          	mv	a1,t2
    ebbc:	f65ff0ef          	jal	eb20 <__mulsi3>
    ebc0:	00650333          	add	t1,a0,t1
    ebc4:	00c12083          	lw	ra,12(sp)
    ebc8:	00812403          	lw	s0,8(sp)
    ebcc:	000f0513          	mv	a0,t5
    ebd0:	00030593          	mv	a1,t1
    ebd4:	01010113          	add	sp,sp,16
    ebd8:	00008067          	ret

0000ebdc <__divsi3>:
    ebdc:	06054063          	bltz	a0,ec3c <__umodsi3+0x10>
    ebe0:	0605c663          	bltz	a1,ec4c <__umodsi3+0x20>

0000ebe4 <__hidden___udivsi3>:
    ebe4:	00058613          	mv	a2,a1
    ebe8:	00050593          	mv	a1,a0
    ebec:	fff00513          	li	a0,-1
    ebf0:	02060c63          	beqz	a2,ec28 <__hidden___udivsi3+0x44>
    ebf4:	00100693          	li	a3,1
    ebf8:	00b67a63          	bgeu	a2,a1,ec0c <__hidden___udivsi3+0x28>
    ebfc:	00c05863          	blez	a2,ec0c <__hidden___udivsi3+0x28>
    ec00:	00161613          	sll	a2,a2,0x1
    ec04:	00169693          	sll	a3,a3,0x1
    ec08:	feb66ae3          	bltu	a2,a1,ebfc <__hidden___udivsi3+0x18>
    ec0c:	00000513          	li	a0,0
    ec10:	00c5e663          	bltu	a1,a2,ec1c <__hidden___udivsi3+0x38>
    ec14:	40c585b3          	sub	a1,a1,a2
    ec18:	00d56533          	or	a0,a0,a3
    ec1c:	0016d693          	srl	a3,a3,0x1
    ec20:	00165613          	srl	a2,a2,0x1
    ec24:	fe0696e3          	bnez	a3,ec10 <__hidden___udivsi3+0x2c>
    ec28:	00008067          	ret

0000ec2c <__umodsi3>:
    ec2c:	00008293          	mv	t0,ra
    ec30:	fb5ff0ef          	jal	ebe4 <__hidden___udivsi3>
    ec34:	00058513          	mv	a0,a1
    ec38:	00028067          	jr	t0
    ec3c:	40a00533          	neg	a0,a0
    ec40:	00b04863          	bgtz	a1,ec50 <__umodsi3+0x24>
    ec44:	40b005b3          	neg	a1,a1
    ec48:	f9dff06f          	j	ebe4 <__hidden___udivsi3>
    ec4c:	40b005b3          	neg	a1,a1
    ec50:	00008293          	mv	t0,ra
    ec54:	f91ff0ef          	jal	ebe4 <__hidden___udivsi3>
    ec58:	40a00533          	neg	a0,a0
    ec5c:	00028067          	jr	t0

0000ec60 <__modsi3>:
    ec60:	00008293          	mv	t0,ra
    ec64:	0005ca63          	bltz	a1,ec78 <__modsi3+0x18>
    ec68:	00054c63          	bltz	a0,ec80 <__modsi3+0x20>
    ec6c:	f79ff0ef          	jal	ebe4 <__hidden___udivsi3>
    ec70:	00058513          	mv	a0,a1
    ec74:	00028067          	jr	t0
    ec78:	40b005b3          	neg	a1,a1
    ec7c:	fe0558e3          	bgez	a0,ec6c <__modsi3+0xc>
    ec80:	40a00533          	neg	a0,a0
    ec84:	f61ff0ef          	jal	ebe4 <__hidden___udivsi3>
    ec88:	40b00533          	neg	a0,a1
    ec8c:	00028067          	jr	t0

0000ec90 <__clzsi2>:
    ec90:	000107b7          	lui	a5,0x10
    ec94:	02f57a63          	bgeu	a0,a5,ecc8 <__clzsi2+0x38>
    ec98:	10053793          	sltiu	a5,a0,256
    ec9c:	0017b793          	seqz	a5,a5
    eca0:	00379793          	sll	a5,a5,0x3
    eca4:	02000713          	li	a4,32
    eca8:	40f70733          	sub	a4,a4,a5
    ecac:	00f55533          	srl	a0,a0,a5
    ecb0:	00001797          	auipc	a5,0x1
    ecb4:	ab078793          	add	a5,a5,-1360 # f760 <__clz_tab>
    ecb8:	00a787b3          	add	a5,a5,a0
    ecbc:	0007c503          	lbu	a0,0(a5)
    ecc0:	40a70533          	sub	a0,a4,a0
    ecc4:	00008067          	ret
    ecc8:	010007b7          	lui	a5,0x1000
    eccc:	02f57463          	bgeu	a0,a5,ecf4 <__clzsi2+0x64>
    ecd0:	01000793          	li	a5,16
    ecd4:	00f55533          	srl	a0,a0,a5
    ecd8:	00001797          	auipc	a5,0x1
    ecdc:	a8878793          	add	a5,a5,-1400 # f760 <__clz_tab>
    ece0:	00a787b3          	add	a5,a5,a0
    ece4:	0007c503          	lbu	a0,0(a5)
    ece8:	01000713          	li	a4,16
    ecec:	40a70533          	sub	a0,a4,a0
    ecf0:	00008067          	ret
    ecf4:	01800793          	li	a5,24
    ecf8:	00f55533          	srl	a0,a0,a5
    ecfc:	00001797          	auipc	a5,0x1
    ed00:	a6478793          	add	a5,a5,-1436 # f760 <__clz_tab>
    ed04:	00a787b3          	add	a5,a5,a0
    ed08:	0007c503          	lbu	a0,0(a5)
    ed0c:	00800713          	li	a4,8
    ed10:	40a70533          	sub	a0,a4,a0
    ed14:	00008067          	ret
