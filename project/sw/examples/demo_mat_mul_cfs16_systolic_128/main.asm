
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x240>
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
      58:	c8058593          	add	a1,a1,-896 # 80000cd4 <__crt0_bss_end>
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
     110:	c0040413          	add	s0,s0,-1024 # ed0c <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	bf848493          	add	s1,s1,-1032 # ed0c <__fini_array_end>

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
     178:	b9840413          	add	s0,s0,-1128 # ed0c <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	b9048493          	add	s1,s1,-1136 # ed0c <__fini_array_end>

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
   ------------------------- */
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

/* -------------------------
   Fixed-point printer (X.YYYx)
   ------------------------- */
static void print_speedup_fixed(uint64_t num, uint64_t den) {
  if (!den) { printf("   n/a    "); return; }
     20c:	00d667b3          	or	a5,a2,a3
     210:	00079863          	bnez	a5,220 <print_speedup_fixed+0x14>
     214:	0000f537          	lui	a0,0xf
     218:	d1050513          	add	a0,a0,-752 # ed10 <__fini_array_end+0x4>
     21c:	2ad0006f          	j	cc8 <printf>
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
     240:	0f90e0ef          	jal	eb38 <__muldi3>
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
     270:	0d00b0ef          	jal	b340 <__udivdi3>
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     274:	3e800613          	li	a2,1000
     278:	00000693          	li	a3,0
  uint64_t s = (num * 1000ull + den/2) / den;
     27c:	00050493          	mv	s1,a0
     280:	00058413          	mv	s0,a1
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     284:	7680b0ef          	jal	b9ec <__umoddi3>
     288:	00a12623          	sw	a0,12(sp)
     28c:	00b12423          	sw	a1,8(sp)
     290:	3e800613          	li	a2,1000
     294:	00000693          	li	a3,0
     298:	00048513          	mv	a0,s1
     29c:	00040593          	mv	a1,s0
     2a0:	0a00b0ef          	jal	b340 <__udivdi3>
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
     2c4:	d1c50513          	add	a0,a0,-740 # ed1c <__fini_array_end+0x10>
}
     2c8:	02010113          	add	sp,sp,32
  printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2cc:	1fd0006f          	j	cc8 <printf>

000002d0 <main>:
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     2d0:	ffeb07b7          	lui	a5,0xffeb0
     2d4:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>

/* -------------------------
   Main
   ------------------------- */
int main(void) {
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     2d8:	0000f537          	lui	a0,0xf
int main(void) {
     2dc:	f6010113          	add	sp,sp,-160
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     2e0:	d5c50513          	add	a0,a0,-676 # ed5c <__fini_array_end+0x50>
int main(void) {
     2e4:	08112e23          	sw	ra,156(sp)
     2e8:	09212823          	sw	s2,144(sp)
     2ec:	09312623          	sw	s3,140(sp)
     2f0:	09412423          	sw	s4,136(sp)
     2f4:	09512223          	sw	s5,132(sp)
     2f8:	07a12823          	sw	s10,112(sp)
     2fc:	07b12623          	sw	s11,108(sp)
     300:	08812c23          	sw	s0,152(sp)
     304:	08912a23          	sw	s1,148(sp)
     308:	09612023          	sw	s6,128(sp)
     30c:	07712e23          	sw	s7,124(sp)
     310:	07812c23          	sw	s8,120(sp)
     314:	07912a23          	sw	s9,116(sp)
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     318:	1b1000ef          	jal	cc8 <printf>
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     31c:	ec9ff0ef          	jal	1e4 <rdcycle>
     320:	00050913          	mv	s2,a0
     324:	00058a93          	mv	s5,a1
     328:	ed1ff0ef          	jal	1f8 <rdinstret>
     32c:	00050a13          	mv	s4,a0
     330:	00058993          	mv	s3,a1
     334:	00100d93          	li	s11,1
  int64_t checksum = 0;
     338:	00000d13          	li	s10,0
     33c:	00000893          	li	a7,0
    for (int j = 0; j < N; ++j) {
     340:	0ffdf693          	zext.b	a3,s11
     344:	00269793          	sll	a5,a3,0x2
     348:	40f687b3          	sub	a5,a3,a5
     34c:	0ff7f793          	zext.b	a5,a5
      int32_t s = 0;
     350:	00200493          	li	s1,2
     354:	0f600b13          	li	s6,246
     358:	0880006f          	j	3e0 <main+0x110>
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     35c:	00fbf513          	and	a0,s7,15
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     360:	00fc7593          	and	a1,s8,15
        s += (int32_t)pattA(i, k) * (int32_t)pattB(k, j);
     364:	ff858593          	add	a1,a1,-8
     368:	ff850513          	add	a0,a0,-8
     36c:	03112023          	sw	a7,32(sp)
     370:	00d12e23          	sw	a3,28(sp)
     374:	00f12c23          	sw	a5,24(sp)
     378:	79c0e0ef          	jal	eb14 <__mulsi3>
      for (int k = 0; k < N; ++k) {
     37c:	01c12683          	lw	a3,28(sp)
     380:	01848c33          	add	s8,s1,s8
     384:	fffc8c93          	add	s9,s9,-1
     388:	01768bb3          	add	s7,a3,s7
     38c:	01812783          	lw	a5,24(sp)
     390:	02012883          	lw	a7,32(sp)
        s += (int32_t)pattA(i, k) * (int32_t)pattB(k, j);
     394:	00a40433          	add	s0,s0,a0
      for (int k = 0; k < N; ++k) {
     398:	0ffbfb93          	zext.b	s7,s7
     39c:	0ffc7c13          	zext.b	s8,s8
     3a0:	08200613          	li	a2,130
     3a4:	08100813          	li	a6,129
     3a8:	fa0c9ae3          	bnez	s9,35c <main+0x8c>
      checksum += (int64_t)s;
     3ac:	41f45713          	sra	a4,s0,0x1f
     3b0:	008d0433          	add	s0,s10,s0
     3b4:	01a43d33          	sltu	s10,s0,s10
     3b8:	00e88733          	add	a4,a7,a4
     3bc:	00ed0733          	add	a4,s10,a4
    for (int j = 0; j < N; ++j) {
     3c0:	fff48493          	add	s1,s1,-1
     3c4:	005b0b13          	add	s6,s6,5
      checksum += (int64_t)s;
     3c8:	00e12c23          	sw	a4,24(sp)
    for (int j = 0; j < N; ++j) {
     3cc:	0ff4f493          	zext.b	s1,s1
      checksum += (int64_t)s;
     3d0:	00040d13          	mv	s10,s0
     3d4:	00070893          	mv	a7,a4
    for (int j = 0; j < N; ++j) {
     3d8:	0ffb7b13          	zext.b	s6,s6
     3dc:	00c48c63          	beq	s1,a2,3f4 <main+0x124>
int main(void) {
     3e0:	000b0c13          	mv	s8,s6
     3e4:	00078b93          	mv	s7,a5
     3e8:	08000c93          	li	s9,128
      int32_t s = 0;
     3ec:	00000413          	li	s0,0
     3f0:	f6dff06f          	j	35c <main+0x8c>
  for (int i = 0; i < N; ++i) {
     3f4:	001d8d93          	add	s11,s11,1
     3f8:	f50d94e3          	bne	s11,a6,340 <main+0x70>
  uint64_t i1 = rdinstret(), c1 = rdcycle();
     3fc:	dfdff0ef          	jal	1f8 <rdinstret>
     400:	00050493          	mv	s1,a0
     404:	00058b13          	mv	s6,a1
     408:	dddff0ef          	jal	1e4 <rdcycle>
  *out_cycles  = c1 - c0;
     40c:	412507b3          	sub	a5,a0,s2
     410:	00f12e23          	sw	a5,28(sp)
     414:	415585b3          	sub	a1,a1,s5
     418:	00f537b3          	sltu	a5,a0,a5
     41c:	40f587b3          	sub	a5,a1,a5
     420:	02f12023          	sw	a5,32(sp)
  *out_instret = i1 - i0;
     424:	414487b3          	sub	a5,s1,s4
     428:	413b0b33          	sub	s6,s6,s3
     42c:	00f4b4b3          	sltu	s1,s1,a5
     430:	02f12223          	sw	a5,36(sp)
     434:	409b07b3          	sub	a5,s6,s1
     438:	02f12623          	sw	a5,44(sp)
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     43c:	da9ff0ef          	jal	1e4 <rdcycle>
     440:	02a12823          	sw	a0,48(sp)
     444:	02b12a23          	sw	a1,52(sp)
     448:	db1ff0ef          	jal	1f8 <rdinstret>
     44c:	800017b7          	lui	a5,0x80001
     450:	97478793          	add	a5,a5,-1676 # 80000974 <A_flat.2>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     454:	ffeb0937          	lui	s2,0xffeb0
     458:	ffeb0337          	lui	t1,0xffeb0
     45c:	ffeb0e37          	lui	t3,0xffeb0
     460:	ffeb0eb7          	lui	t4,0xffeb0
     464:	ffeb0f37          	lui	t5,0xffeb0
     468:	ffeb0fb7          	lui	t6,0xffeb0
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     46c:	02a12c23          	sw	a0,56(sp)
     470:	02b12e23          	sw	a1,60(sp)
  int64_t checksum = 0;
     474:	00000a13          	li	s4,0
     478:	00000993          	li	s3,0
  for (int i0 = 0; i0 < N; i0 += TILE) {
     47c:	00000693          	li	a3,0
     480:	02f12423          	sw	a5,40(sp)
     484:	80000c37          	lui	s8,0x80000
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     488:	00490913          	add	s2,s2,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     48c:	00830313          	add	t1,t1,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     490:	00ce0e13          	add	t3,t3,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     494:	010e8e93          	add	t4,t4,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     498:	014f0f13          	add	t5,t5,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     49c:	018f8f93          	add	t6,t6,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
    for (int r = 0; r < TILE; ++r)
     4a0:	00168793          	add	a5,a3,1
     4a4:	0ff7f793          	zext.b	a5,a5
      for (int k = 0; k < N; ++k)
     4a8:	00000613          	li	a2,0
     4ac:	08000893          	li	a7,128
    for (int r = 0; r < TILE; ++r)
     4b0:	20000813          	li	a6,512
     4b4:	0340006f          	j	4e8 <main+0x218>
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     4b8:	00f77513          	and	a0,a4,15
        A_flat[r*LDA + k] = pattA(i0 + r, k);
     4bc:	00b283b3          	add	t2,t0,a1
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     4c0:	ff850513          	add	a0,a0,-8
      for (int k = 0; k < N; ++k)
     4c4:	00e78733          	add	a4,a5,a4
        A_flat[r*LDA + k] = pattA(i0 + r, k);
     4c8:	00a38023          	sb	a0,0(t2)
      for (int k = 0; k < N; ++k)
     4cc:	00158593          	add	a1,a1,1
     4d0:	0ff77713          	zext.b	a4,a4
     4d4:	ff1592e3          	bne	a1,a7,4b8 <main+0x1e8>
    for (int r = 0; r < TILE; ++r)
     4d8:	00178793          	add	a5,a5,1
     4dc:	08060613          	add	a2,a2,128
     4e0:	0ff7f793          	zext.b	a5,a5
     4e4:	03060063          	beq	a2,a6,504 <main+0x234>
        A_flat[r*LDA + k] = pattA(i0 + r, k);
     4e8:	02812503          	lw	a0,40(sp)
     4ec:	00279713          	sll	a4,a5,0x2
     4f0:	40e78733          	sub	a4,a5,a4
     4f4:	0ff77713          	zext.b	a4,a4
      for (int k = 0; k < N; ++k)
     4f8:	00000593          	li	a1,0
        A_flat[r*LDA + k] = pattA(i0 + r, k);
     4fc:	00c502b3          	add	t0,a0,a2
     500:	fb9ff06f          	j	4b8 <main+0x1e8>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     504:	ffeb02b7          	lui	t0,0xffeb0
     508:	ffeb03b7          	lui	t2,0xffeb0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     50c:	ffeb00b7          	lui	ra,0xffeb0
     510:	00200793          	li	a5,2
     514:	0f600713          	li	a4,246
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     518:	01c28293          	add	t0,t0,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     51c:	02038393          	add	t2,t2,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     520:	04008093          	add	ra,ra,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
      for (int k = 0; k < N; ++k) {
     524:	fff78b13          	add	s6,a5,-1
     528:	00570813          	add	a6,a4,5
     52c:	ffe78a93          	add	s5,a5,-2
     530:	00a70513          	add	a0,a4,10
     534:	ffd78493          	add	s1,a5,-3
     538:	00f70593          	add	a1,a4,15
     53c:	0ffb7b13          	zext.b	s6,s6
     540:	0ff87813          	zext.b	a6,a6
     544:	0ffafa93          	zext.b	s5,s5
     548:	0ff57513          	zext.b	a0,a0
     54c:	0ff4f493          	zext.b	s1,s1
     550:	0ff5f593          	zext.b	a1,a1
      for (int k = 0; k < N; ++k)
     554:	774c0613          	add	a2,s8,1908 # 80000774 <B_flat.1>
     558:	00070893          	mv	a7,a4
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     55c:	00f8fb93          	and	s7,a7,15
     560:	ff8b8b93          	add	s7,s7,-8
        B_flat[k*LDB + 0] = pattB(k, j0 + 0);
     564:	01760023          	sb	s7,0(a2)
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     568:	00f87b93          	and	s7,a6,15
     56c:	ff8b8b93          	add	s7,s7,-8
        B_flat[k*LDB + 1] = pattB(k, j0 + 1);
     570:	017600a3          	sb	s7,1(a2)
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     574:	00f57b93          	and	s7,a0,15
     578:	ff8b8b93          	add	s7,s7,-8
        B_flat[k*LDB + 2] = pattB(k, j0 + 2);
     57c:	01760123          	sb	s7,2(a2)
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     580:	00f5fb93          	and	s7,a1,15
     584:	ff8b8b93          	add	s7,s7,-8
        B_flat[k*LDB + 3] = pattB(k, j0 + 3);
     588:	017601a3          	sb	s7,3(a2)
      for (int k = 0; k < N; ++k) {
     58c:	80001bb7          	lui	s7,0x80001
     590:	00f888b3          	add	a7,a7,a5
     594:	01680833          	add	a6,a6,s6
     598:	00aa8533          	add	a0,s5,a0
     59c:	00b485b3          	add	a1,s1,a1
     5a0:	00460613          	add	a2,a2,4
     5a4:	974b8b93          	add	s7,s7,-1676 # 80000974 <A_flat.2>
     5a8:	0ff8f893          	zext.b	a7,a7
     5ac:	0ff87813          	zext.b	a6,a6
     5b0:	0ff57513          	zext.b	a0,a0
     5b4:	0ff5f593          	zext.b	a1,a1
     5b8:	fb7612e3          	bne	a2,s7,55c <main+0x28c>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5bc:	00200613          	li	a2,2
     5c0:	ffeb05b7          	lui	a1,0xffeb0
     5c4:	00c5a023          	sw	a2,0(a1) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  for (int t = 0; t < T; t += 4) {
     5c8:	00000513          	li	a0,0
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
     5cc:	07f00a93          	li	s5,127
      for (int s = 0; s < 4; ++s) {
     5d0:	00400613          	li	a2,4
    int steps = (t + 4 <= T) ? 4 : (T - t);
     5d4:	08200b93          	li	s7,130
  for (int t = 0; t < T; t += 4) {
     5d8:	08800b13          	li	s6,136
    int8_t b_bytes[TILE][4] = {{0}};
     5dc:	02812483          	lw	s1,40(sp)
    int8_t a_bytes[TILE][4] = {{0}};
     5e0:	04012023          	sw	zero,64(sp)
     5e4:	04012223          	sw	zero,68(sp)
     5e8:	04012423          	sw	zero,72(sp)
     5ec:	04012623          	sw	zero,76(sp)
    int8_t b_bytes[TILE][4] = {{0}};
     5f0:	04012823          	sw	zero,80(sp)
     5f4:	04012a23          	sw	zero,84(sp)
     5f8:	04012c23          	sw	zero,88(sp)
     5fc:	04012e23          	sw	zero,92(sp)
    for (int i = 0; i < TILE; ++i)
     600:	04010c93          	add	s9,sp,64
     604:	00000893          	li	a7,0
      for (int s = 0; s < 4; ++s) {
     608:	41150833          	sub	a6,a0,a7
     60c:	00000593          	li	a1,0
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
     610:	010aea63          	bltu	s5,a6,624 <main+0x354>
     614:	01048db3          	add	s11,s1,a6
     618:	000dcd83          	lbu	s11,0(s11)
     61c:	00bc8d33          	add	s10,s9,a1
     620:	01bd0023          	sb	s11,0(s10)
      for (int s = 0; s < 4; ++s) {
     624:	00158593          	add	a1,a1,1
     628:	00180813          	add	a6,a6,1
     62c:	fec592e3          	bne	a1,a2,610 <main+0x340>
    for (int i = 0; i < TILE; ++i)
     630:	00188893          	add	a7,a7,1
     634:	08048493          	add	s1,s1,128
     638:	004c8c93          	add	s9,s9,4
     63c:	fcc896e3          	bne	a7,a2,608 <main+0x338>
     640:	05010493          	add	s1,sp,80
    for (int j = 0; j < TILE; ++j)
     644:	00000593          	li	a1,0
        if (k >= 0 && k < K) b_bytes[j][s] = B_flat[k*LDB + j];
     648:	80000cb7          	lui	s9,0x80000
     64c:	774c8c93          	add	s9,s9,1908 # 80000774 <B_flat.1>
     650:	40b508b3          	sub	a7,a0,a1
      for (int s = 0; s < 4; ++s) {
     654:	00000813          	li	a6,0
        if (k >= 0 && k < K) b_bytes[j][s] = B_flat[k*LDB + j];
     658:	00bc8d33          	add	s10,s9,a1
     65c:	011aec63          	bltu	s5,a7,674 <main+0x3a4>
     660:	00289d93          	sll	s11,a7,0x2
     664:	01bd0db3          	add	s11,s10,s11
     668:	000dcd83          	lbu	s11,0(s11)
     66c:	01048cb3          	add	s9,s1,a6
     670:	01bc8023          	sb	s11,0(s9)
      for (int s = 0; s < 4; ++s) {
     674:	00180813          	add	a6,a6,1
     678:	00188893          	add	a7,a7,1
     67c:	fec810e3          	bne	a6,a2,65c <main+0x38c>
    for (int j = 0; j < TILE; ++j)
     680:	00158593          	add	a1,a1,1
     684:	00448493          	add	s1,s1,4
     688:	fcc590e3          	bne	a1,a2,648 <main+0x378>
         (((uint32_t)(uint8_t)x2) << 16) |
     68c:	04012803          	lw	a6,64(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     690:	01092023          	sw	a6,0(s2)
         (((uint32_t)(uint8_t)x2) << 16) |
     694:	04412803          	lw	a6,68(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     698:	01032023          	sw	a6,0(t1)
         (((uint32_t)(uint8_t)x2) << 16) |
     69c:	04812803          	lw	a6,72(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6a0:	010e2023          	sw	a6,0(t3)
         (((uint32_t)(uint8_t)x2) << 16) |
     6a4:	04c12803          	lw	a6,76(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6a8:	010ea023          	sw	a6,0(t4)
         (((uint32_t)(uint8_t)x2) << 16) |
     6ac:	05012803          	lw	a6,80(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6b0:	010f2023          	sw	a6,0(t5)
         (((uint32_t)(uint8_t)x2) << 16) |
     6b4:	05412803          	lw	a6,84(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6b8:	010fa023          	sw	a6,0(t6)
         (((uint32_t)(uint8_t)x2) << 16) |
     6bc:	05812803          	lw	a6,88(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6c0:	0102a023          	sw	a6,0(t0)
         (((uint32_t)(uint8_t)x2) << 16) |
     6c4:	05c12803          	lw	a6,92(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6c8:	0103a023          	sw	a6,0(t2)
    int steps = (t + 4 <= T) ? 4 : (T - t);
     6cc:	00abd463          	bge	s7,a0,6d4 <main+0x404>
     6d0:	00200593          	li	a1,2
    for (int s = 0; s < steps; ++s) cfs_step();
     6d4:	00000813          	li	a6,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6d8:	ffeb08b7          	lui	a7,0xffeb0
     6dc:	00100493          	li	s1,1
     6e0:	0098a023          	sw	s1,0(a7) # ffeb0000 <__crt0_ram_last+0x7fe30001>
    for (int s = 0; s < steps; ++s) cfs_step();
     6e4:	00180813          	add	a6,a6,1
     6e8:	ff0598e3          	bne	a1,a6,6d8 <main+0x408>
  for (int t = 0; t < T; t += 4) {
     6ec:	00450513          	add	a0,a0,4
     6f0:	ef6516e3          	bne	a0,s6,5dc <main+0x30c>
     6f4:	800005b7          	lui	a1,0x80000
     6f8:	73458613          	add	a2,a1,1844 # 80000734 <C4.0>
     6fc:	73458893          	add	a7,a1,1844
     700:	00000513          	li	a0,0
    for (int j = 0; j < TILE; ++j)
     704:	01000493          	li	s1,16
     708:	00251813          	sll	a6,a0,0x2
      C4[i][j] = (int32_t)cfs_read(CFS_C0 + i*TILE + j);
     70c:	00000593          	li	a1,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     710:	00180833          	add	a6,a6,ra
     714:	00b80ab3          	add	s5,a6,a1
     718:	000aab03          	lw	s6,0(s5)
      C4[i][j] = (int32_t)cfs_read(CFS_C0 + i*TILE + j);
     71c:	00b88ab3          	add	s5,a7,a1
    for (int j = 0; j < TILE; ++j)
     720:	00458593          	add	a1,a1,4
      C4[i][j] = (int32_t)cfs_read(CFS_C0 + i*TILE + j);
     724:	016aa023          	sw	s6,0(s5)
    for (int j = 0; j < TILE; ++j)
     728:	fe9596e3          	bne	a1,s1,714 <main+0x444>
  for (int i = 0; i < TILE; ++i)
     72c:	00450513          	add	a0,a0,4
     730:	01088893          	add	a7,a7,16
     734:	fcb51ae3          	bne	a0,a1,708 <main+0x438>
     738:	04060593          	add	a1,a2,64
          checksum += (int64_t)C4[r][c];
     73c:	00062503          	lw	a0,0(a2)
      for (int r = 0; r < TILE; ++r)
     740:	01060613          	add	a2,a2,16
          checksum += (int64_t)C4[r][c];
     744:	01450ab3          	add	s5,a0,s4
     748:	41f55813          	sra	a6,a0,0x1f
     74c:	01380833          	add	a6,a6,s3
     750:	00aab533          	sltu	a0,s5,a0
     754:	010508b3          	add	a7,a0,a6
     758:	ff462503          	lw	a0,-12(a2)
     75c:	41f55493          	sra	s1,a0,0x1f
     760:	01550ab3          	add	s5,a0,s5
     764:	00aab533          	sltu	a0,s5,a0
     768:	011484b3          	add	s1,s1,a7
     76c:	00950833          	add	a6,a0,s1
     770:	ff862503          	lw	a0,-8(a2)
     774:	ffc62483          	lw	s1,-4(a2)
     778:	41f55893          	sra	a7,a0,0x1f
     77c:	01550ab3          	add	s5,a0,s5
     780:	00aab533          	sltu	a0,s5,a0
     784:	010888b3          	add	a7,a7,a6
     788:	01548ab3          	add	s5,s1,s5
     78c:	41f4d813          	sra	a6,s1,0x1f
     790:	01150533          	add	a0,a0,a7
     794:	009ab4b3          	sltu	s1,s5,s1
     798:	00a80833          	add	a6,a6,a0
     79c:	010484b3          	add	s1,s1,a6
     7a0:	000a8a13          	mv	s4,s5
     7a4:	00048993          	mv	s3,s1
      for (int r = 0; r < TILE; ++r)
     7a8:	f8b61ae3          	bne	a2,a1,73c <main+0x46c>
    for (int j0 = 0; j0 < N; j0 += TILE) {
     7ac:	ffc78793          	add	a5,a5,-4
     7b0:	01470713          	add	a4,a4,20
     7b4:	0ff7f793          	zext.b	a5,a5
     7b8:	08200613          	li	a2,130
     7bc:	0ff77713          	zext.b	a4,a4
     7c0:	d6c792e3          	bne	a5,a2,524 <main+0x254>
  for (int i0 = 0; i0 < N; i0 += TILE) {
     7c4:	00468693          	add	a3,a3,4
     7c8:	08000793          	li	a5,128
     7cc:	ccf69ae3          	bne	a3,a5,4a0 <main+0x1d0>
  uint64_t i1 = rdinstret(), c1 = rdcycle();
     7d0:	a29ff0ef          	jal	1f8 <rdinstret>
     7d4:	00050d13          	mv	s10,a0
     7d8:	00058b13          	mv	s6,a1
     7dc:	a09ff0ef          	jal	1e4 <rdcycle>
  *out_cycles  = c1 - c0;
     7e0:	03012783          	lw	a5,48(sp)
  print_speedup_fixed(sw_ins, cfs_ins);  printf("     | %9lld\n", (long long)cfs_sum);

  /* Optional efficiency: cycles per MAC for each path (MACs = N^3) */
  uint64_t macs = (uint64_t)N*(uint64_t)N*(uint64_t)N; /* 2,097,152 */
  if (macs) {
    uint64_t sw_cpM = (sw_cyc * 1000ull + macs/2) / macs;
     7e4:	00100937          	lui	s2,0x100
  *out_cycles  = c1 - c0;
     7e8:	40f50c33          	sub	s8,a0,a5
     7ec:	03412783          	lw	a5,52(sp)
     7f0:	01853533          	sltu	a0,a0,s8
     7f4:	40f58bb3          	sub	s7,a1,a5
  *out_instret = i1 - i0;
     7f8:	03812783          	lw	a5,56(sp)
  *out_cycles  = c1 - c0;
     7fc:	40ab8bb3          	sub	s7,s7,a0
  printf("GEMM 128x128 comparison (int8 -> int32)\n");
     800:	0000f537          	lui	a0,0xf
  *out_instret = i1 - i0;
     804:	40fd0cb3          	sub	s9,s10,a5
     808:	03c12783          	lw	a5,60(sp)
  printf("GEMM 128x128 comparison (int8 -> int32)\n");
     80c:	d8450513          	add	a0,a0,-636 # ed84 <__fini_array_end+0x78>
  *out_instret = i1 - i0;
     810:	019d3d33          	sltu	s10,s10,s9
     814:	40fb0b33          	sub	s6,s6,a5
  printf("GEMM 128x128 comparison (int8 -> int32)\n");
     818:	62c000ef          	jal	e44 <puts>
  printf("Path |      cycles |     instret |  Speedup(cyc) | Speedup(inst) |  checksum\n");
     81c:	0000f537          	lui	a0,0xf
     820:	dac50513          	add	a0,a0,-596 # edac <__fini_array_end+0xa0>
     824:	620000ef          	jal	e44 <puts>
  printf("-----+-------------+-------------+---------------+---------------+-----------\n");
     828:	0000f537          	lui	a0,0xf
     82c:	dfc50513          	add	a0,a0,-516 # edfc <__fini_array_end+0xf0>
     830:	614000ef          	jal	e44 <puts>
  printf(" SW  | %11" PRIu64 " | %11" PRIu64 " |       --      |       --      | %9lld\n",
     834:	01812883          	lw	a7,24(sp)
     838:	02412703          	lw	a4,36(sp)
     83c:	02c12783          	lw	a5,44(sp)
     840:	01c12603          	lw	a2,28(sp)
     844:	02012683          	lw	a3,32(sp)
     848:	0000f537          	lui	a0,0xf
     84c:	00040813          	mv	a6,s0
     850:	e4c50513          	add	a0,a0,-436 # ee4c <__fini_array_end+0x140>
     854:	474000ef          	jal	cc8 <printf>
  *out_instret = i1 - i0;
     858:	41ab0b33          	sub	s6,s6,s10
  printf(" CFS | %11" PRIu64 " | %11" PRIu64 " |    ", cfs_cyc, cfs_ins);
     85c:	0000f537          	lui	a0,0xf
     860:	000c8713          	mv	a4,s9
     864:	000b0793          	mv	a5,s6
     868:	000c0613          	mv	a2,s8
     86c:	000b8693          	mv	a3,s7
     870:	e8c50513          	add	a0,a0,-372 # ee8c <__fini_array_end+0x180>
     874:	454000ef          	jal	cc8 <printf>
  print_speedup_fixed(sw_cyc, cfs_cyc);  printf("     |    ");
     878:	02012583          	lw	a1,32(sp)
     87c:	01c12503          	lw	a0,28(sp)
     880:	000c0613          	mv	a2,s8
     884:	000b8693          	mv	a3,s7
     888:	985ff0ef          	jal	20c <print_speedup_fixed>
     88c:	0000f537          	lui	a0,0xf
     890:	eac50513          	add	a0,a0,-340 # eeac <__fini_array_end+0x1a0>
     894:	434000ef          	jal	cc8 <printf>
  print_speedup_fixed(sw_ins, cfs_ins);  printf("     | %9lld\n", (long long)cfs_sum);
     898:	02c12583          	lw	a1,44(sp)
     89c:	02412503          	lw	a0,36(sp)
     8a0:	000c8613          	mv	a2,s9
     8a4:	000b0693          	mv	a3,s6
     8a8:	965ff0ef          	jal	20c <print_speedup_fixed>
     8ac:	0000f537          	lui	a0,0xf
     8b0:	000a8613          	mv	a2,s5
     8b4:	00048693          	mv	a3,s1
     8b8:	eb850513          	add	a0,a0,-328 # eeb8 <__fini_array_end+0x1ac>
     8bc:	40c000ef          	jal	cc8 <printf>
    uint64_t sw_cpM = (sw_cyc * 1000ull + macs/2) / macs;
     8c0:	01c12503          	lw	a0,28(sp)
     8c4:	02012583          	lw	a1,32(sp)
     8c8:	3e800613          	li	a2,1000
     8cc:	00000693          	li	a3,0
     8d0:	2680e0ef          	jal	eb38 <__muldi3>
     8d4:	01250cb3          	add	s9,a0,s2
     8d8:	00acbb33          	sltu	s6,s9,a0
     8dc:	00bb0b33          	add	s6,s6,a1
     8e0:	00bb1793          	sll	a5,s6,0xb
    uint64_t cf_cpM = (cfs_cyc * 1000ull + macs/2) / macs;
     8e4:	3e800613          	li	a2,1000
     8e8:	00000693          	li	a3,0
     8ec:	000c0513          	mv	a0,s8
     8f0:	000b8593          	mv	a1,s7
    uint64_t sw_cpM = (sw_cyc * 1000ull + macs/2) / macs;
     8f4:	015cdc93          	srl	s9,s9,0x15
     8f8:	0197ecb3          	or	s9,a5,s9
    uint64_t cf_cpM = (cfs_cyc * 1000ull + macs/2) / macs;
     8fc:	23c0e0ef          	jal	eb38 <__muldi3>
     900:	01250c33          	add	s8,a0,s2
     904:	00ac3933          	sltu	s2,s8,a0
     908:	00b90933          	add	s2,s2,a1
     90c:	00b91793          	sll	a5,s2,0xb
     910:	015c5c13          	srl	s8,s8,0x15
     914:	0187ec33          	or	s8,a5,s8
     918:	01595913          	srl	s2,s2,0x15
    printf("\nCycles/MAC (scaled x1000): SW=%" PRIu64 ".%03" PRIu64
     91c:	3e800613          	li	a2,1000
     920:	00000693          	li	a3,0
     924:	000c0513          	mv	a0,s8
     928:	00090593          	mv	a1,s2
     92c:	2150a0ef          	jal	b340 <__udivdi3>
    uint64_t sw_cpM = (sw_cyc * 1000ull + macs/2) / macs;
     930:	015b5b13          	srl	s6,s6,0x15
    printf("\nCycles/MAC (scaled x1000): SW=%" PRIu64 ".%03" PRIu64
     934:	02a12423          	sw	a0,40(sp)
     938:	02b12223          	sw	a1,36(sp)
     93c:	3e800613          	li	a2,1000
     940:	00000693          	li	a3,0
     944:	000b0593          	mv	a1,s6
     948:	000c8513          	mv	a0,s9
     94c:	0a00b0ef          	jal	b9ec <__umoddi3>
     950:	02a12023          	sw	a0,32(sp)
     954:	00b12e23          	sw	a1,28(sp)
     958:	3e800613          	li	a2,1000
     95c:	00000693          	li	a3,0
     960:	000b0593          	mv	a1,s6
     964:	000c8513          	mv	a0,s9
     968:	1d90a0ef          	jal	b340 <__udivdi3>
     96c:	00050b93          	mv	s7,a0
     970:	00058b13          	mv	s6,a1
     974:	3e800613          	li	a2,1000
     978:	00000693          	li	a3,0
     97c:	000c0513          	mv	a0,s8
     980:	00090593          	mv	a1,s2
     984:	0680b0ef          	jal	b9ec <__umoddi3>
     988:	02812803          	lw	a6,40(sp)
     98c:	02412883          	lw	a7,36(sp)
     990:	02012703          	lw	a4,32(sp)
     994:	01c12783          	lw	a5,28(sp)
     998:	00a12023          	sw	a0,0(sp)
     99c:	0000f537          	lui	a0,0xf
     9a0:	00b12223          	sw	a1,4(sp)
     9a4:	000b8613          	mv	a2,s7
     9a8:	000b0693          	mv	a3,s6
     9ac:	ec850513          	add	a0,a0,-312 # eec8 <__fini_array_end+0x1bc>
     9b0:	318000ef          	jal	cc8 <printf>
           "  CFS=%" PRIu64 ".%03" PRIu64 "\n",
           sw_cpM/1000, sw_cpM%1000, cf_cpM/1000, cf_cpM%1000);
  }

  printf("\nVerdict: %s\n", ok ? "PASS (checksums match)" : "FAIL (checksums differ)");
     9b4:	07541e63          	bne	s0,s5,a30 <main+0x760>
     9b8:	01812783          	lw	a5,24(sp)
     9bc:	06979a63          	bne	a5,s1,a30 <main+0x760>
     9c0:	0000f5b7          	lui	a1,0xf
     9c4:	d2c58593          	add	a1,a1,-724 # ed2c <__fini_array_end+0x20>
     9c8:	0000f537          	lui	a0,0xf
     9cc:	f0850513          	add	a0,a0,-248 # ef08 <__fini_array_end+0x1fc>
     9d0:	2f8000ef          	jal	cc8 <printf>
  printf("Tip: If SW takes too long, you can temporarily change N to 64 to sanity-check, then restore 128.\n");
     9d4:	0000f537          	lui	a0,0xf
     9d8:	f1850513          	add	a0,a0,-232 # ef18 <__fini_array_end+0x20c>
     9dc:	468000ef          	jal	e44 <puts>
  return ok ? 0 : 1;
     9e0:	01812783          	lw	a5,24(sp)
     9e4:	01544533          	xor	a0,s0,s5
}
     9e8:	09c12083          	lw	ra,156(sp)
     9ec:	09812403          	lw	s0,152(sp)
  return ok ? 0 : 1;
     9f0:	0097c7b3          	xor	a5,a5,s1
     9f4:	00f56533          	or	a0,a0,a5
}
     9f8:	09412483          	lw	s1,148(sp)
     9fc:	09012903          	lw	s2,144(sp)
     a00:	08c12983          	lw	s3,140(sp)
     a04:	08812a03          	lw	s4,136(sp)
     a08:	08412a83          	lw	s5,132(sp)
     a0c:	08012b03          	lw	s6,128(sp)
     a10:	07c12b83          	lw	s7,124(sp)
     a14:	07812c03          	lw	s8,120(sp)
     a18:	07412c83          	lw	s9,116(sp)
     a1c:	07012d03          	lw	s10,112(sp)
     a20:	06c12d83          	lw	s11,108(sp)
     a24:	00a03533          	snez	a0,a0
     a28:	0a010113          	add	sp,sp,160
     a2c:	00008067          	ret
  printf("\nVerdict: %s\n", ok ? "PASS (checksums match)" : "FAIL (checksums differ)");
     a30:	0000f5b7          	lui	a1,0xf
     a34:	d4458593          	add	a1,a1,-700 # ed44 <__fini_array_end+0x38>
     a38:	f91ff06f          	j	9c8 <main+0x6f8>

00000a3c <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     a3c:	fffff097          	auipc	ra,0xfffff
     a40:	71c08093          	add	ra,ra,1820 # 158 <__crt0_main_exit>
     a44:	00050513          	mv	a0,a0
     a48:	00008067          	ret

00000a4c <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     a4c:	fff00513          	li	a0,-1
     a50:	00008067          	ret

00000a54 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     a54:	000027b7          	lui	a5,0x2
     a58:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     a5c:	00000513          	li	a0,0
     a60:	00008067          	ret

00000a64 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     a64:	00100513          	li	a0,1
     a68:	00008067          	ret

00000a6c <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     a6c:	00100513          	li	a0,1
     a70:	00008067          	ret

00000a74 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     a74:	800007b7          	lui	a5,0x80000
     a78:	01600713          	li	a4,22
     a7c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     a80:	fff00513          	li	a0,-1
     a84:	00008067          	ret

00000a88 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     a88:	00000513          	li	a0,0
     a8c:	00008067          	ret

00000a90 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     a90:	fe010113          	add	sp,sp,-32
     a94:	00912a23          	sw	s1,20(sp)
     a98:	01212823          	sw	s2,16(sp)
     a9c:	00112e23          	sw	ra,28(sp)
     aa0:	00812c23          	sw	s0,24(sp)
     aa4:	01312623          	sw	s3,12(sp)
     aa8:	01412423          	sw	s4,8(sp)
     aac:	00058913          	mv	s2,a1
     ab0:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     ab4:	06051463          	bnez	a0,b1c <_read+0x8c>
     ab8:	00050413          	mv	s0,a0
     abc:	fff50537          	lui	a0,0xfff50
     ac0:	1a0000ef          	jal	c60 <neorv32_uart_available>
     ac4:	04050c63          	beqz	a0,b1c <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     ac8:	00a00993          	li	s3,10
     acc:	00d00a13          	li	s4,13
    while (len--) {
     ad0:	00941663          	bne	s0,s1,adc <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     ad4:	00048413          	mv	s0,s1
     ad8:	0200006f          	j	af8 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     adc:	fff50537          	lui	a0,0xfff50
     ae0:	1d0000ef          	jal	cb0 <neorv32_uart_getc>
      *ptr++ = c;
     ae4:	008907b3          	add	a5,s2,s0
     ae8:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     aec:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     af0:	01350463          	beq	a0,s3,af8 <_read+0x68>
     af4:	fd451ee3          	bne	a0,s4,ad0 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     af8:	01c12083          	lw	ra,28(sp)
     afc:	00040513          	mv	a0,s0
     b00:	01812403          	lw	s0,24(sp)
     b04:	01412483          	lw	s1,20(sp)
     b08:	01012903          	lw	s2,16(sp)
     b0c:	00c12983          	lw	s3,12(sp)
     b10:	00812a03          	lw	s4,8(sp)
     b14:	02010113          	add	sp,sp,32
     b18:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     b1c:	fff60537          	lui	a0,0xfff60
     b20:	140000ef          	jal	c60 <neorv32_uart_available>
  int read_cnt = 0;
     b24:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     b28:	02050863          	beqz	a0,b58 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     b2c:	00a00993          	li	s3,10
     b30:	00d00a13          	li	s4,13
    while (len--) {
     b34:	fa9400e3          	beq	s0,s1,ad4 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     b38:	fff60537          	lui	a0,0xfff60
     b3c:	174000ef          	jal	cb0 <neorv32_uart_getc>
      *ptr++ = c;
     b40:	008907b3          	add	a5,s2,s0
     b44:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     b48:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     b4c:	fb3506e3          	beq	a0,s3,af8 <_read+0x68>
     b50:	ff4512e3          	bne	a0,s4,b34 <_read+0xa4>
     b54:	fa5ff06f          	j	af8 <_read+0x68>
    errno = ENOSYS;
     b58:	800007b7          	lui	a5,0x80000
     b5c:	05800713          	li	a4,88
     b60:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     b64:	fff00413          	li	s0,-1
     b68:	f91ff06f          	j	af8 <_read+0x68>

00000b6c <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     b6c:	ff010113          	add	sp,sp,-16
     b70:	00812423          	sw	s0,8(sp)
     b74:	00912223          	sw	s1,4(sp)
     b78:	00112623          	sw	ra,12(sp)
     b7c:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     b80:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     b84:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     b88:	00058413          	mv	s0,a1
     b8c:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     b90:	04a7ec63          	bltu	a5,a0,be8 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     b94:	fff50537          	lui	a0,0xfff50
     b98:	0c8000ef          	jal	c60 <neorv32_uart_available>
     b9c:	00940933          	add	s2,s0,s1
     ba0:	02051463          	bnez	a0,bc8 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     ba4:	800007b7          	lui	a5,0x80000
     ba8:	05800713          	li	a4,88
     bac:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     bb0:	fff00493          	li	s1,-1
     bb4:	0180006f          	j	bcc <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     bb8:	00044583          	lbu	a1,0(s0)
     bbc:	fff50537          	lui	a0,0xfff50
     bc0:	00140413          	add	s0,s0,1
     bc4:	0d8000ef          	jal	c9c <neorv32_uart_putc>
      while (len--) {
     bc8:	fe8918e3          	bne	s2,s0,bb8 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     bcc:	00c12083          	lw	ra,12(sp)
     bd0:	00812403          	lw	s0,8(sp)
     bd4:	00012903          	lw	s2,0(sp)
     bd8:	00048513          	mv	a0,s1
     bdc:	00412483          	lw	s1,4(sp)
     be0:	01010113          	add	sp,sp,16
     be4:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     be8:	fff60537          	lui	a0,0xfff60
     bec:	074000ef          	jal	c60 <neorv32_uart_available>
     bf0:	00940933          	add	s2,s0,s1
     bf4:	fa0508e3          	beqz	a0,ba4 <_write+0x38>
    while (len--) {
     bf8:	fd240ae3          	beq	s0,s2,bcc <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     bfc:	00044583          	lbu	a1,0(s0)
     c00:	fff60537          	lui	a0,0xfff60
     c04:	00140413          	add	s0,s0,1
     c08:	094000ef          	jal	c9c <neorv32_uart_putc>
      write_cnt++;
     c0c:	fedff06f          	j	bf8 <_write+0x8c>

00000c10 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     c10:	80000737          	lui	a4,0x80000
     c14:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     c18:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     c1c:	00050793          	mv	a5,a0
     c20:	cd460613          	add	a2,a2,-812 # 80000cd4 <__crt0_bss_end>
  if (curr_heap == NULL) {
     c24:	00069463          	bnez	a3,c2c <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     c28:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     c2c:	800016b7          	lui	a3,0x80001
     c30:	cd468693          	add	a3,a3,-812 # 80000cd4 <__crt0_bss_end>
     c34:	00c69c63          	bne	a3,a2,c4c <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     c38:	800007b7          	lui	a5,0x80000
     c3c:	00c00713          	li	a4,12
     c40:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     c44:	fff00513          	li	a0,-1
     c48:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     c4c:	71472503          	lw	a0,1812(a4)
     c50:	00f507b3          	add	a5,a0,a5
     c54:	fed7f2e3          	bgeu	a5,a3,c38 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     c58:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     c5c:	00008067          	ret

00000c60 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     c60:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     c64:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     c68:	00e51c63          	bne	a0,a4,c80 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     c6c:	fffe07b7          	lui	a5,0xfffe0
     c70:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     c74:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     c78:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     c7c:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     c80:	fff60737          	lui	a4,0xfff60
    return 0;
     c84:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     c88:	fee79ae3          	bne	a5,a4,c7c <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     c8c:	fffe07b7          	lui	a5,0xfffe0
     c90:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     c94:	020007b7          	lui	a5,0x2000
     c98:	fe1ff06f          	j	c78 <neorv32_uart_available+0x18>

00000c9c <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     c9c:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     ca0:	00a79713          	sll	a4,a5,0xa
     ca4:	fe075ce3          	bgez	a4,c9c <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     ca8:	00b52223          	sw	a1,4(a0)
}
     cac:	00008067          	ret

00000cb0 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     cb0:	00052783          	lw	a5,0(a0)
     cb4:	00f79713          	sll	a4,a5,0xf
     cb8:	fe075ce3          	bgez	a4,cb0 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     cbc:	00452503          	lw	a0,4(a0)
}
     cc0:	0ff57513          	zext.b	a0,a0
     cc4:	00008067          	ret

00000cc8 <printf>:
     cc8:	fc010113          	add	sp,sp,-64
     ccc:	02c12423          	sw	a2,40(sp)
     cd0:	02d12623          	sw	a3,44(sp)
     cd4:	80000317          	auipc	t1,0x80000
     cd8:	a3432303          	lw	t1,-1484(t1) # 80000708 <_impure_ptr>
     cdc:	02b12223          	sw	a1,36(sp)
     ce0:	02e12823          	sw	a4,48(sp)
     ce4:	02f12a23          	sw	a5,52(sp)
     ce8:	03012c23          	sw	a6,56(sp)
     cec:	03112e23          	sw	a7,60(sp)
     cf0:	00832583          	lw	a1,8(t1)
     cf4:	02410693          	add	a3,sp,36
     cf8:	00050613          	mv	a2,a0
     cfc:	00030513          	mv	a0,t1
     d00:	00112e23          	sw	ra,28(sp)
     d04:	00d12623          	sw	a3,12(sp)
     d08:	0b0010ef          	jal	1db8 <_vfprintf_r>
     d0c:	01c12083          	lw	ra,28(sp)
     d10:	04010113          	add	sp,sp,64
     d14:	00008067          	ret

00000d18 <_puts_r>:
     d18:	fd010113          	add	sp,sp,-48
     d1c:	02812423          	sw	s0,40(sp)
     d20:	00050413          	mv	s0,a0
     d24:	00058513          	mv	a0,a1
     d28:	02912223          	sw	s1,36(sp)
     d2c:	02112623          	sw	ra,44(sp)
     d30:	00058493          	mv	s1,a1
     d34:	3b0000ef          	jal	10e4 <strlen>
     d38:	00150713          	add	a4,a0,1
     d3c:	0000e697          	auipc	a3,0xe
     d40:	18868693          	add	a3,a3,392 # eec4 <__fini_array_end+0x1b8>
     d44:	00e12623          	sw	a4,12(sp)
     d48:	03442783          	lw	a5,52(s0)
     d4c:	01010713          	add	a4,sp,16
     d50:	00d12c23          	sw	a3,24(sp)
     d54:	00e12223          	sw	a4,4(sp)
     d58:	00100693          	li	a3,1
     d5c:	00200713          	li	a4,2
     d60:	00912823          	sw	s1,16(sp)
     d64:	00a12a23          	sw	a0,20(sp)
     d68:	00d12e23          	sw	a3,28(sp)
     d6c:	00e12423          	sw	a4,8(sp)
     d70:	00842483          	lw	s1,8(s0)
     d74:	0c078263          	beqz	a5,e38 <_puts_r+0x120>
     d78:	0644a703          	lw	a4,100(s1)
     d7c:	00c49783          	lh	a5,12(s1)
     d80:	00177713          	and	a4,a4,1
     d84:	00071663          	bnez	a4,d90 <_puts_r+0x78>
     d88:	2007f713          	and	a4,a5,512
     d8c:	08070e63          	beqz	a4,e28 <_puts_r+0x110>
     d90:	01279713          	sll	a4,a5,0x12
     d94:	02074263          	bltz	a4,db8 <_puts_r+0xa0>
     d98:	0644a703          	lw	a4,100(s1)
     d9c:	ffffe6b7          	lui	a3,0xffffe
     da0:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     da4:	00002637          	lui	a2,0x2
     da8:	00c7e7b3          	or	a5,a5,a2
     dac:	00d77733          	and	a4,a4,a3
     db0:	00f49623          	sh	a5,12(s1)
     db4:	06e4a223          	sw	a4,100(s1)
     db8:	00040513          	mv	a0,s0
     dbc:	00410613          	add	a2,sp,4
     dc0:	00048593          	mv	a1,s1
     dc4:	549050ef          	jal	6b0c <__sfvwrite_r>
     dc8:	0644a783          	lw	a5,100(s1)
     dcc:	00153413          	seqz	s0,a0
     dd0:	40800433          	neg	s0,s0
     dd4:	00b47413          	and	s0,s0,11
     dd8:	0017f793          	and	a5,a5,1
     ddc:	fff40413          	add	s0,s0,-1
     de0:	00079863          	bnez	a5,df0 <_puts_r+0xd8>
     de4:	00c4d783          	lhu	a5,12(s1)
     de8:	2007f793          	and	a5,a5,512
     dec:	00078e63          	beqz	a5,e08 <_puts_r+0xf0>
     df0:	02c12083          	lw	ra,44(sp)
     df4:	00040513          	mv	a0,s0
     df8:	02812403          	lw	s0,40(sp)
     dfc:	02412483          	lw	s1,36(sp)
     e00:	03010113          	add	sp,sp,48
     e04:	00008067          	ret
     e08:	0584a503          	lw	a0,88(s1)
     e0c:	054000ef          	jal	e60 <__retarget_lock_release_recursive>
     e10:	02c12083          	lw	ra,44(sp)
     e14:	00040513          	mv	a0,s0
     e18:	02812403          	lw	s0,40(sp)
     e1c:	02412483          	lw	s1,36(sp)
     e20:	03010113          	add	sp,sp,48
     e24:	00008067          	ret
     e28:	0584a503          	lw	a0,88(s1)
     e2c:	030000ef          	jal	e5c <__retarget_lock_acquire_recursive>
     e30:	00c49783          	lh	a5,12(s1)
     e34:	f5dff06f          	j	d90 <_puts_r+0x78>
     e38:	00040513          	mv	a0,s0
     e3c:	449050ef          	jal	6a84 <__sinit>
     e40:	f39ff06f          	j	d78 <_puts_r+0x60>

00000e44 <puts>:
     e44:	00050593          	mv	a1,a0
     e48:	80000517          	auipc	a0,0x80000
     e4c:	8c052503          	lw	a0,-1856(a0) # 80000708 <_impure_ptr>
     e50:	ec9ff06f          	j	d18 <_puts_r>

00000e54 <__retarget_lock_init_recursive>:
     e54:	00008067          	ret

00000e58 <__retarget_lock_close_recursive>:
     e58:	00008067          	ret

00000e5c <__retarget_lock_acquire_recursive>:
     e5c:	00008067          	ret

00000e60 <__retarget_lock_release_recursive>:
     e60:	00008067          	ret

00000e64 <memset>:
     e64:	00f00313          	li	t1,15
     e68:	00050713          	mv	a4,a0
     e6c:	02c37e63          	bgeu	t1,a2,ea8 <memset+0x44>
     e70:	00f77793          	and	a5,a4,15
     e74:	0a079063          	bnez	a5,f14 <memset+0xb0>
     e78:	08059263          	bnez	a1,efc <memset+0x98>
     e7c:	ff067693          	and	a3,a2,-16
     e80:	00f67613          	and	a2,a2,15
     e84:	00e686b3          	add	a3,a3,a4
     e88:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     e8c:	00b72223          	sw	a1,4(a4)
     e90:	00b72423          	sw	a1,8(a4)
     e94:	00b72623          	sw	a1,12(a4)
     e98:	01070713          	add	a4,a4,16
     e9c:	fed766e3          	bltu	a4,a3,e88 <memset+0x24>
     ea0:	00061463          	bnez	a2,ea8 <memset+0x44>
     ea4:	00008067          	ret
     ea8:	40c306b3          	sub	a3,t1,a2
     eac:	00269693          	sll	a3,a3,0x2
     eb0:	00000297          	auipc	t0,0x0
     eb4:	005686b3          	add	a3,a3,t0
     eb8:	00c68067          	jr	12(a3)
     ebc:	00b70723          	sb	a1,14(a4)
     ec0:	00b706a3          	sb	a1,13(a4)
     ec4:	00b70623          	sb	a1,12(a4)
     ec8:	00b705a3          	sb	a1,11(a4)
     ecc:	00b70523          	sb	a1,10(a4)
     ed0:	00b704a3          	sb	a1,9(a4)
     ed4:	00b70423          	sb	a1,8(a4)
     ed8:	00b703a3          	sb	a1,7(a4)
     edc:	00b70323          	sb	a1,6(a4)
     ee0:	00b702a3          	sb	a1,5(a4)
     ee4:	00b70223          	sb	a1,4(a4)
     ee8:	00b701a3          	sb	a1,3(a4)
     eec:	00b70123          	sb	a1,2(a4)
     ef0:	00b700a3          	sb	a1,1(a4)
     ef4:	00b70023          	sb	a1,0(a4)
     ef8:	00008067          	ret
     efc:	0ff5f593          	zext.b	a1,a1
     f00:	00859693          	sll	a3,a1,0x8
     f04:	00d5e5b3          	or	a1,a1,a3
     f08:	01059693          	sll	a3,a1,0x10
     f0c:	00d5e5b3          	or	a1,a1,a3
     f10:	f6dff06f          	j	e7c <memset+0x18>
     f14:	00279693          	sll	a3,a5,0x2
     f18:	00000297          	auipc	t0,0x0
     f1c:	005686b3          	add	a3,a3,t0
     f20:	00008293          	mv	t0,ra
     f24:	fa0680e7          	jalr	-96(a3)
     f28:	00028093          	mv	ra,t0
     f2c:	ff078793          	add	a5,a5,-16 # 1fffff0 <__neorv32_ram_size+0x1f7fff0>
     f30:	40f70733          	sub	a4,a4,a5
     f34:	00f60633          	add	a2,a2,a5
     f38:	f6c378e3          	bgeu	t1,a2,ea8 <memset+0x44>
     f3c:	f3dff06f          	j	e78 <memset+0x14>

00000f40 <memcpy>:
     f40:	00a5c7b3          	xor	a5,a1,a0
     f44:	0037f793          	and	a5,a5,3
     f48:	00c508b3          	add	a7,a0,a2
     f4c:	06079463          	bnez	a5,fb4 <memcpy+0x74>
     f50:	00300793          	li	a5,3
     f54:	06c7f063          	bgeu	a5,a2,fb4 <memcpy+0x74>
     f58:	00357793          	and	a5,a0,3
     f5c:	00050713          	mv	a4,a0
     f60:	06079a63          	bnez	a5,fd4 <memcpy+0x94>
     f64:	ffc8f613          	and	a2,a7,-4
     f68:	40e606b3          	sub	a3,a2,a4
     f6c:	02000793          	li	a5,32
     f70:	08d7ce63          	blt	a5,a3,100c <memcpy+0xcc>
     f74:	00058693          	mv	a3,a1
     f78:	00070793          	mv	a5,a4
     f7c:	02c77863          	bgeu	a4,a2,fac <memcpy+0x6c>
     f80:	0006a803          	lw	a6,0(a3)
     f84:	00478793          	add	a5,a5,4
     f88:	00468693          	add	a3,a3,4
     f8c:	ff07ae23          	sw	a6,-4(a5)
     f90:	fec7e8e3          	bltu	a5,a2,f80 <memcpy+0x40>
     f94:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x247>
     f98:	40e787b3          	sub	a5,a5,a4
     f9c:	ffc7f793          	and	a5,a5,-4
     fa0:	00478793          	add	a5,a5,4
     fa4:	00f70733          	add	a4,a4,a5
     fa8:	00f585b3          	add	a1,a1,a5
     fac:	01176863          	bltu	a4,a7,fbc <memcpy+0x7c>
     fb0:	00008067          	ret
     fb4:	00050713          	mv	a4,a0
     fb8:	05157863          	bgeu	a0,a7,1008 <memcpy+0xc8>
     fbc:	0005c783          	lbu	a5,0(a1)
     fc0:	00170713          	add	a4,a4,1
     fc4:	00158593          	add	a1,a1,1
     fc8:	fef70fa3          	sb	a5,-1(a4)
     fcc:	fee898e3          	bne	a7,a4,fbc <memcpy+0x7c>
     fd0:	00008067          	ret
     fd4:	0005c683          	lbu	a3,0(a1)
     fd8:	00170713          	add	a4,a4,1
     fdc:	00377793          	and	a5,a4,3
     fe0:	fed70fa3          	sb	a3,-1(a4)
     fe4:	00158593          	add	a1,a1,1
     fe8:	f6078ee3          	beqz	a5,f64 <memcpy+0x24>
     fec:	0005c683          	lbu	a3,0(a1)
     ff0:	00170713          	add	a4,a4,1
     ff4:	00377793          	and	a5,a4,3
     ff8:	fed70fa3          	sb	a3,-1(a4)
     ffc:	00158593          	add	a1,a1,1
    1000:	fc079ae3          	bnez	a5,fd4 <memcpy+0x94>
    1004:	f61ff06f          	j	f64 <memcpy+0x24>
    1008:	00008067          	ret
    100c:	ff010113          	add	sp,sp,-16
    1010:	00812623          	sw	s0,12(sp)
    1014:	02000413          	li	s0,32
    1018:	0005a383          	lw	t2,0(a1)
    101c:	0045a283          	lw	t0,4(a1)
    1020:	0085af83          	lw	t6,8(a1)
    1024:	00c5af03          	lw	t5,12(a1)
    1028:	0105ae83          	lw	t4,16(a1)
    102c:	0145ae03          	lw	t3,20(a1)
    1030:	0185a303          	lw	t1,24(a1)
    1034:	01c5a803          	lw	a6,28(a1)
    1038:	0205a683          	lw	a3,32(a1)
    103c:	02470713          	add	a4,a4,36
    1040:	40e607b3          	sub	a5,a2,a4
    1044:	fc772e23          	sw	t2,-36(a4)
    1048:	fe572023          	sw	t0,-32(a4)
    104c:	fff72223          	sw	t6,-28(a4)
    1050:	ffe72423          	sw	t5,-24(a4)
    1054:	ffd72623          	sw	t4,-20(a4)
    1058:	ffc72823          	sw	t3,-16(a4)
    105c:	fe672a23          	sw	t1,-12(a4)
    1060:	ff072c23          	sw	a6,-8(a4)
    1064:	fed72e23          	sw	a3,-4(a4)
    1068:	02458593          	add	a1,a1,36
    106c:	faf446e3          	blt	s0,a5,1018 <memcpy+0xd8>
    1070:	00058693          	mv	a3,a1
    1074:	00070793          	mv	a5,a4
    1078:	02c77863          	bgeu	a4,a2,10a8 <memcpy+0x168>
    107c:	0006a803          	lw	a6,0(a3)
    1080:	00478793          	add	a5,a5,4
    1084:	00468693          	add	a3,a3,4
    1088:	ff07ae23          	sw	a6,-4(a5)
    108c:	fec7e8e3          	bltu	a5,a2,107c <memcpy+0x13c>
    1090:	fff60793          	add	a5,a2,-1
    1094:	40e787b3          	sub	a5,a5,a4
    1098:	ffc7f793          	and	a5,a5,-4
    109c:	00478793          	add	a5,a5,4
    10a0:	00f70733          	add	a4,a4,a5
    10a4:	00f585b3          	add	a1,a1,a5
    10a8:	01176863          	bltu	a4,a7,10b8 <memcpy+0x178>
    10ac:	00c12403          	lw	s0,12(sp)
    10b0:	01010113          	add	sp,sp,16
    10b4:	00008067          	ret
    10b8:	0005c783          	lbu	a5,0(a1)
    10bc:	00170713          	add	a4,a4,1
    10c0:	00158593          	add	a1,a1,1
    10c4:	fef70fa3          	sb	a5,-1(a4)
    10c8:	fee882e3          	beq	a7,a4,10ac <memcpy+0x16c>
    10cc:	0005c783          	lbu	a5,0(a1)
    10d0:	00170713          	add	a4,a4,1
    10d4:	00158593          	add	a1,a1,1
    10d8:	fef70fa3          	sb	a5,-1(a4)
    10dc:	fce89ee3          	bne	a7,a4,10b8 <memcpy+0x178>
    10e0:	fcdff06f          	j	10ac <memcpy+0x16c>

000010e4 <strlen>:
    10e4:	00357793          	and	a5,a0,3
    10e8:	00050713          	mv	a4,a0
    10ec:	04079c63          	bnez	a5,1144 <strlen+0x60>
    10f0:	7f7f86b7          	lui	a3,0x7f7f8
    10f4:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    10f8:	fff00593          	li	a1,-1
    10fc:	00072603          	lw	a2,0(a4)
    1100:	00470713          	add	a4,a4,4
    1104:	00d677b3          	and	a5,a2,a3
    1108:	00d787b3          	add	a5,a5,a3
    110c:	00c7e7b3          	or	a5,a5,a2
    1110:	00d7e7b3          	or	a5,a5,a3
    1114:	feb784e3          	beq	a5,a1,10fc <strlen+0x18>
    1118:	ffc74683          	lbu	a3,-4(a4)
    111c:	40a707b3          	sub	a5,a4,a0
    1120:	04068463          	beqz	a3,1168 <strlen+0x84>
    1124:	ffd74683          	lbu	a3,-3(a4)
    1128:	02068c63          	beqz	a3,1160 <strlen+0x7c>
    112c:	ffe74503          	lbu	a0,-2(a4)
    1130:	00a03533          	snez	a0,a0
    1134:	00f50533          	add	a0,a0,a5
    1138:	ffe50513          	add	a0,a0,-2
    113c:	00008067          	ret
    1140:	fa0688e3          	beqz	a3,10f0 <strlen+0xc>
    1144:	00074783          	lbu	a5,0(a4)
    1148:	00170713          	add	a4,a4,1
    114c:	00377693          	and	a3,a4,3
    1150:	fe0798e3          	bnez	a5,1140 <strlen+0x5c>
    1154:	40a70733          	sub	a4,a4,a0
    1158:	fff70513          	add	a0,a4,-1
    115c:	00008067          	ret
    1160:	ffd78513          	add	a0,a5,-3
    1164:	00008067          	ret
    1168:	ffc78513          	add	a0,a5,-4
    116c:	00008067          	ret

00001170 <_malloc_trim_r>:
    1170:	fe010113          	add	sp,sp,-32
    1174:	00812c23          	sw	s0,24(sp)
    1178:	00912a23          	sw	s1,20(sp)
    117c:	01212823          	sw	s2,16(sp)
    1180:	01312623          	sw	s3,12(sp)
    1184:	01412423          	sw	s4,8(sp)
    1188:	00058993          	mv	s3,a1
    118c:	00112e23          	sw	ra,28(sp)
    1190:	00050913          	mv	s2,a0
    1194:	7ffffa17          	auipc	s4,0x7ffff
    1198:	f8ca0a13          	add	s4,s4,-116 # 80000120 <__malloc_av_>
    119c:	405000ef          	jal	1da0 <__malloc_lock>
    11a0:	008a2703          	lw	a4,8(s4)
    11a4:	000017b7          	lui	a5,0x1
    11a8:	fef78793          	add	a5,a5,-17 # fef <memcpy+0xaf>
    11ac:	00472483          	lw	s1,4(a4)
    11b0:	00001737          	lui	a4,0x1
    11b4:	ffc4f493          	and	s1,s1,-4
    11b8:	00f48433          	add	s0,s1,a5
    11bc:	41340433          	sub	s0,s0,s3
    11c0:	00c45413          	srl	s0,s0,0xc
    11c4:	fff40413          	add	s0,s0,-1
    11c8:	00c41413          	sll	s0,s0,0xc
    11cc:	00e44e63          	blt	s0,a4,11e8 <_malloc_trim_r+0x78>
    11d0:	00000593          	li	a1,0
    11d4:	00090513          	mv	a0,s2
    11d8:	678060ef          	jal	7850 <_sbrk_r>
    11dc:	008a2783          	lw	a5,8(s4)
    11e0:	009787b3          	add	a5,a5,s1
    11e4:	02f50863          	beq	a0,a5,1214 <_malloc_trim_r+0xa4>
    11e8:	00090513          	mv	a0,s2
    11ec:	3c1000ef          	jal	1dac <__malloc_unlock>
    11f0:	01c12083          	lw	ra,28(sp)
    11f4:	01812403          	lw	s0,24(sp)
    11f8:	01412483          	lw	s1,20(sp)
    11fc:	01012903          	lw	s2,16(sp)
    1200:	00c12983          	lw	s3,12(sp)
    1204:	00812a03          	lw	s4,8(sp)
    1208:	00000513          	li	a0,0
    120c:	02010113          	add	sp,sp,32
    1210:	00008067          	ret
    1214:	408005b3          	neg	a1,s0
    1218:	00090513          	mv	a0,s2
    121c:	634060ef          	jal	7850 <_sbrk_r>
    1220:	fff00793          	li	a5,-1
    1224:	04f50a63          	beq	a0,a5,1278 <_malloc_trim_r+0x108>
    1228:	80000717          	auipc	a4,0x80000
    122c:	94c70713          	add	a4,a4,-1716 # 80000b74 <__malloc_current_mallinfo>
    1230:	00072783          	lw	a5,0(a4)
    1234:	008a2683          	lw	a3,8(s4)
    1238:	408484b3          	sub	s1,s1,s0
    123c:	0014e493          	or	s1,s1,1
    1240:	408787b3          	sub	a5,a5,s0
    1244:	00090513          	mv	a0,s2
    1248:	0096a223          	sw	s1,4(a3)
    124c:	00f72023          	sw	a5,0(a4)
    1250:	35d000ef          	jal	1dac <__malloc_unlock>
    1254:	01c12083          	lw	ra,28(sp)
    1258:	01812403          	lw	s0,24(sp)
    125c:	01412483          	lw	s1,20(sp)
    1260:	01012903          	lw	s2,16(sp)
    1264:	00c12983          	lw	s3,12(sp)
    1268:	00812a03          	lw	s4,8(sp)
    126c:	00100513          	li	a0,1
    1270:	02010113          	add	sp,sp,32
    1274:	00008067          	ret
    1278:	00000593          	li	a1,0
    127c:	00090513          	mv	a0,s2
    1280:	5d0060ef          	jal	7850 <_sbrk_r>
    1284:	008a2703          	lw	a4,8(s4)
    1288:	00f00693          	li	a3,15
    128c:	40e507b3          	sub	a5,a0,a4
    1290:	f4f6dce3          	bge	a3,a5,11e8 <_malloc_trim_r+0x78>
    1294:	7ffff697          	auipc	a3,0x7ffff
    1298:	4786a683          	lw	a3,1144(a3) # 8000070c <__malloc_sbrk_base>
    129c:	40d50533          	sub	a0,a0,a3
    12a0:	0017e793          	or	a5,a5,1
    12a4:	80000697          	auipc	a3,0x80000
    12a8:	8ca6a823          	sw	a0,-1840(a3) # 80000b74 <__malloc_current_mallinfo>
    12ac:	00f72223          	sw	a5,4(a4)
    12b0:	f39ff06f          	j	11e8 <_malloc_trim_r+0x78>

000012b4 <_free_r>:
    12b4:	18058263          	beqz	a1,1438 <_free_r+0x184>
    12b8:	ff010113          	add	sp,sp,-16
    12bc:	00812423          	sw	s0,8(sp)
    12c0:	00912223          	sw	s1,4(sp)
    12c4:	00058413          	mv	s0,a1
    12c8:	00050493          	mv	s1,a0
    12cc:	00112623          	sw	ra,12(sp)
    12d0:	2d1000ef          	jal	1da0 <__malloc_lock>
    12d4:	ffc42583          	lw	a1,-4(s0)
    12d8:	ff840713          	add	a4,s0,-8
    12dc:	7ffff517          	auipc	a0,0x7ffff
    12e0:	e4450513          	add	a0,a0,-444 # 80000120 <__malloc_av_>
    12e4:	ffe5f793          	and	a5,a1,-2
    12e8:	00f70633          	add	a2,a4,a5
    12ec:	00462683          	lw	a3,4(a2)
    12f0:	00852803          	lw	a6,8(a0)
    12f4:	ffc6f693          	and	a3,a3,-4
    12f8:	1ac80263          	beq	a6,a2,149c <_free_r+0x1e8>
    12fc:	00d62223          	sw	a3,4(a2)
    1300:	0015f593          	and	a1,a1,1
    1304:	00d60833          	add	a6,a2,a3
    1308:	0a059063          	bnez	a1,13a8 <_free_r+0xf4>
    130c:	ff842303          	lw	t1,-8(s0)
    1310:	00482583          	lw	a1,4(a6)
    1314:	7ffff897          	auipc	a7,0x7ffff
    1318:	e1488893          	add	a7,a7,-492 # 80000128 <__malloc_av_+0x8>
    131c:	40670733          	sub	a4,a4,t1
    1320:	00872803          	lw	a6,8(a4)
    1324:	006787b3          	add	a5,a5,t1
    1328:	0015f593          	and	a1,a1,1
    132c:	15180263          	beq	a6,a7,1470 <_free_r+0x1bc>
    1330:	00c72303          	lw	t1,12(a4)
    1334:	00682623          	sw	t1,12(a6)
    1338:	01032423          	sw	a6,8(t1)
    133c:	1a058a63          	beqz	a1,14f0 <_free_r+0x23c>
    1340:	0017e693          	or	a3,a5,1
    1344:	00d72223          	sw	a3,4(a4)
    1348:	00f62023          	sw	a5,0(a2)
    134c:	1ff00693          	li	a3,511
    1350:	06f6ec63          	bltu	a3,a5,13c8 <_free_r+0x114>
    1354:	ff87f693          	and	a3,a5,-8
    1358:	00868693          	add	a3,a3,8
    135c:	00452583          	lw	a1,4(a0)
    1360:	00d506b3          	add	a3,a0,a3
    1364:	0006a603          	lw	a2,0(a3)
    1368:	0057d813          	srl	a6,a5,0x5
    136c:	00100793          	li	a5,1
    1370:	010797b3          	sll	a5,a5,a6
    1374:	00b7e7b3          	or	a5,a5,a1
    1378:	ff868593          	add	a1,a3,-8
    137c:	00b72623          	sw	a1,12(a4)
    1380:	00c72423          	sw	a2,8(a4)
    1384:	00f52223          	sw	a5,4(a0)
    1388:	00e6a023          	sw	a4,0(a3)
    138c:	00e62623          	sw	a4,12(a2)
    1390:	00812403          	lw	s0,8(sp)
    1394:	00c12083          	lw	ra,12(sp)
    1398:	00048513          	mv	a0,s1
    139c:	00412483          	lw	s1,4(sp)
    13a0:	01010113          	add	sp,sp,16
    13a4:	2090006f          	j	1dac <__malloc_unlock>
    13a8:	00482583          	lw	a1,4(a6)
    13ac:	0015f593          	and	a1,a1,1
    13b0:	08058663          	beqz	a1,143c <_free_r+0x188>
    13b4:	0017e693          	or	a3,a5,1
    13b8:	fed42e23          	sw	a3,-4(s0)
    13bc:	00f62023          	sw	a5,0(a2)
    13c0:	1ff00693          	li	a3,511
    13c4:	f8f6f8e3          	bgeu	a3,a5,1354 <_free_r+0xa0>
    13c8:	0097d693          	srl	a3,a5,0x9
    13cc:	00400613          	li	a2,4
    13d0:	12d66463          	bltu	a2,a3,14f8 <_free_r+0x244>
    13d4:	0067d693          	srl	a3,a5,0x6
    13d8:	03968593          	add	a1,a3,57
    13dc:	03868613          	add	a2,a3,56
    13e0:	00359593          	sll	a1,a1,0x3
    13e4:	00b505b3          	add	a1,a0,a1
    13e8:	0005a683          	lw	a3,0(a1)
    13ec:	ff858593          	add	a1,a1,-8
    13f0:	00d59863          	bne	a1,a3,1400 <_free_r+0x14c>
    13f4:	15c0006f          	j	1550 <_free_r+0x29c>
    13f8:	0086a683          	lw	a3,8(a3)
    13fc:	00d58863          	beq	a1,a3,140c <_free_r+0x158>
    1400:	0046a603          	lw	a2,4(a3)
    1404:	ffc67613          	and	a2,a2,-4
    1408:	fec7e8e3          	bltu	a5,a2,13f8 <_free_r+0x144>
    140c:	00c6a583          	lw	a1,12(a3)
    1410:	00b72623          	sw	a1,12(a4)
    1414:	00d72423          	sw	a3,8(a4)
    1418:	00812403          	lw	s0,8(sp)
    141c:	00c12083          	lw	ra,12(sp)
    1420:	00e5a423          	sw	a4,8(a1)
    1424:	00048513          	mv	a0,s1
    1428:	00412483          	lw	s1,4(sp)
    142c:	00e6a623          	sw	a4,12(a3)
    1430:	01010113          	add	sp,sp,16
    1434:	1790006f          	j	1dac <__malloc_unlock>
    1438:	00008067          	ret
    143c:	00d787b3          	add	a5,a5,a3
    1440:	7ffff897          	auipc	a7,0x7ffff
    1444:	ce888893          	add	a7,a7,-792 # 80000128 <__malloc_av_+0x8>
    1448:	00862683          	lw	a3,8(a2)
    144c:	0f168063          	beq	a3,a7,152c <_free_r+0x278>
    1450:	00c62803          	lw	a6,12(a2)
    1454:	0017e593          	or	a1,a5,1
    1458:	00f70633          	add	a2,a4,a5
    145c:	0106a623          	sw	a6,12(a3)
    1460:	00d82423          	sw	a3,8(a6)
    1464:	00b72223          	sw	a1,4(a4)
    1468:	00f62023          	sw	a5,0(a2)
    146c:	ee1ff06f          	j	134c <_free_r+0x98>
    1470:	14059063          	bnez	a1,15b0 <_free_r+0x2fc>
    1474:	00862583          	lw	a1,8(a2)
    1478:	00c62603          	lw	a2,12(a2)
    147c:	00f686b3          	add	a3,a3,a5
    1480:	0016e793          	or	a5,a3,1
    1484:	00c5a623          	sw	a2,12(a1)
    1488:	00b62423          	sw	a1,8(a2)
    148c:	00f72223          	sw	a5,4(a4)
    1490:	00d70733          	add	a4,a4,a3
    1494:	00d72023          	sw	a3,0(a4)
    1498:	ef9ff06f          	j	1390 <_free_r+0xdc>
    149c:	0015f593          	and	a1,a1,1
    14a0:	00d786b3          	add	a3,a5,a3
    14a4:	02059063          	bnez	a1,14c4 <_free_r+0x210>
    14a8:	ff842583          	lw	a1,-8(s0)
    14ac:	40b70733          	sub	a4,a4,a1
    14b0:	00c72783          	lw	a5,12(a4)
    14b4:	00872603          	lw	a2,8(a4)
    14b8:	00b686b3          	add	a3,a3,a1
    14bc:	00f62623          	sw	a5,12(a2)
    14c0:	00c7a423          	sw	a2,8(a5)
    14c4:	0016e793          	or	a5,a3,1
    14c8:	00f72223          	sw	a5,4(a4)
    14cc:	00e52423          	sw	a4,8(a0)
    14d0:	7ffff797          	auipc	a5,0x7ffff
    14d4:	2407a783          	lw	a5,576(a5) # 80000710 <__malloc_trim_threshold>
    14d8:	eaf6ece3          	bltu	a3,a5,1390 <_free_r+0xdc>
    14dc:	7ffff597          	auipc	a1,0x7ffff
    14e0:	2505a583          	lw	a1,592(a1) # 8000072c <__malloc_top_pad>
    14e4:	00048513          	mv	a0,s1
    14e8:	c89ff0ef          	jal	1170 <_malloc_trim_r>
    14ec:	ea5ff06f          	j	1390 <_free_r+0xdc>
    14f0:	00d787b3          	add	a5,a5,a3
    14f4:	f55ff06f          	j	1448 <_free_r+0x194>
    14f8:	01400613          	li	a2,20
    14fc:	02d67063          	bgeu	a2,a3,151c <_free_r+0x268>
    1500:	05400613          	li	a2,84
    1504:	06d66463          	bltu	a2,a3,156c <_free_r+0x2b8>
    1508:	00c7d693          	srl	a3,a5,0xc
    150c:	06f68593          	add	a1,a3,111
    1510:	06e68613          	add	a2,a3,110
    1514:	00359593          	sll	a1,a1,0x3
    1518:	ecdff06f          	j	13e4 <_free_r+0x130>
    151c:	05c68593          	add	a1,a3,92
    1520:	05b68613          	add	a2,a3,91
    1524:	00359593          	sll	a1,a1,0x3
    1528:	ebdff06f          	j	13e4 <_free_r+0x130>
    152c:	00e52a23          	sw	a4,20(a0)
    1530:	00e52823          	sw	a4,16(a0)
    1534:	0017e693          	or	a3,a5,1
    1538:	01172623          	sw	a7,12(a4)
    153c:	01172423          	sw	a7,8(a4)
    1540:	00d72223          	sw	a3,4(a4)
    1544:	00f70733          	add	a4,a4,a5
    1548:	00f72023          	sw	a5,0(a4)
    154c:	e45ff06f          	j	1390 <_free_r+0xdc>
    1550:	00452803          	lw	a6,4(a0)
    1554:	40265613          	sra	a2,a2,0x2
    1558:	00100793          	li	a5,1
    155c:	00c797b3          	sll	a5,a5,a2
    1560:	0107e7b3          	or	a5,a5,a6
    1564:	00f52223          	sw	a5,4(a0)
    1568:	ea9ff06f          	j	1410 <_free_r+0x15c>
    156c:	15400613          	li	a2,340
    1570:	00d66c63          	bltu	a2,a3,1588 <_free_r+0x2d4>
    1574:	00f7d693          	srl	a3,a5,0xf
    1578:	07868593          	add	a1,a3,120
    157c:	07768613          	add	a2,a3,119
    1580:	00359593          	sll	a1,a1,0x3
    1584:	e61ff06f          	j	13e4 <_free_r+0x130>
    1588:	55400613          	li	a2,1364
    158c:	00d66c63          	bltu	a2,a3,15a4 <_free_r+0x2f0>
    1590:	0127d693          	srl	a3,a5,0x12
    1594:	07d68593          	add	a1,a3,125
    1598:	07c68613          	add	a2,a3,124
    159c:	00359593          	sll	a1,a1,0x3
    15a0:	e45ff06f          	j	13e4 <_free_r+0x130>
    15a4:	3f800593          	li	a1,1016
    15a8:	07e00613          	li	a2,126
    15ac:	e39ff06f          	j	13e4 <_free_r+0x130>
    15b0:	0017e693          	or	a3,a5,1
    15b4:	00d72223          	sw	a3,4(a4)
    15b8:	00f62023          	sw	a5,0(a2)
    15bc:	dd5ff06f          	j	1390 <_free_r+0xdc>

000015c0 <_malloc_r>:
    15c0:	fd010113          	add	sp,sp,-48
    15c4:	03212023          	sw	s2,32(sp)
    15c8:	02112623          	sw	ra,44(sp)
    15cc:	02812423          	sw	s0,40(sp)
    15d0:	02912223          	sw	s1,36(sp)
    15d4:	01312e23          	sw	s3,28(sp)
    15d8:	00b58793          	add	a5,a1,11
    15dc:	01600713          	li	a4,22
    15e0:	00050913          	mv	s2,a0
    15e4:	08f76263          	bltu	a4,a5,1668 <_malloc_r+0xa8>
    15e8:	01000793          	li	a5,16
    15ec:	20b7e663          	bltu	a5,a1,17f8 <_malloc_r+0x238>
    15f0:	7b0000ef          	jal	1da0 <__malloc_lock>
    15f4:	01800793          	li	a5,24
    15f8:	00200593          	li	a1,2
    15fc:	01000493          	li	s1,16
    1600:	7ffff997          	auipc	s3,0x7ffff
    1604:	b2098993          	add	s3,s3,-1248 # 80000120 <__malloc_av_>
    1608:	00f987b3          	add	a5,s3,a5
    160c:	0047a403          	lw	s0,4(a5)
    1610:	ff878713          	add	a4,a5,-8
    1614:	36e40463          	beq	s0,a4,197c <_malloc_r+0x3bc>
    1618:	00442783          	lw	a5,4(s0)
    161c:	00c42683          	lw	a3,12(s0)
    1620:	00842603          	lw	a2,8(s0)
    1624:	ffc7f793          	and	a5,a5,-4
    1628:	00f407b3          	add	a5,s0,a5
    162c:	0047a703          	lw	a4,4(a5)
    1630:	00d62623          	sw	a3,12(a2)
    1634:	00c6a423          	sw	a2,8(a3)
    1638:	00176713          	or	a4,a4,1
    163c:	00090513          	mv	a0,s2
    1640:	00e7a223          	sw	a4,4(a5)
    1644:	768000ef          	jal	1dac <__malloc_unlock>
    1648:	00840513          	add	a0,s0,8
    164c:	02c12083          	lw	ra,44(sp)
    1650:	02812403          	lw	s0,40(sp)
    1654:	02412483          	lw	s1,36(sp)
    1658:	02012903          	lw	s2,32(sp)
    165c:	01c12983          	lw	s3,28(sp)
    1660:	03010113          	add	sp,sp,48
    1664:	00008067          	ret
    1668:	ff87f493          	and	s1,a5,-8
    166c:	1807c663          	bltz	a5,17f8 <_malloc_r+0x238>
    1670:	18b4e463          	bltu	s1,a1,17f8 <_malloc_r+0x238>
    1674:	72c000ef          	jal	1da0 <__malloc_lock>
    1678:	1f700793          	li	a5,503
    167c:	4097fa63          	bgeu	a5,s1,1a90 <_malloc_r+0x4d0>
    1680:	0094d793          	srl	a5,s1,0x9
    1684:	18078263          	beqz	a5,1808 <_malloc_r+0x248>
    1688:	00400713          	li	a4,4
    168c:	36f76063          	bltu	a4,a5,19ec <_malloc_r+0x42c>
    1690:	0064d793          	srl	a5,s1,0x6
    1694:	03978593          	add	a1,a5,57
    1698:	03878813          	add	a6,a5,56
    169c:	00359613          	sll	a2,a1,0x3
    16a0:	7ffff997          	auipc	s3,0x7ffff
    16a4:	a8098993          	add	s3,s3,-1408 # 80000120 <__malloc_av_>
    16a8:	00c98633          	add	a2,s3,a2
    16ac:	00462403          	lw	s0,4(a2)
    16b0:	ff860613          	add	a2,a2,-8
    16b4:	02860863          	beq	a2,s0,16e4 <_malloc_r+0x124>
    16b8:	00f00513          	li	a0,15
    16bc:	0140006f          	j	16d0 <_malloc_r+0x110>
    16c0:	00c42683          	lw	a3,12(s0)
    16c4:	2a075863          	bgez	a4,1974 <_malloc_r+0x3b4>
    16c8:	00d60e63          	beq	a2,a3,16e4 <_malloc_r+0x124>
    16cc:	00068413          	mv	s0,a3
    16d0:	00442783          	lw	a5,4(s0)
    16d4:	ffc7f793          	and	a5,a5,-4
    16d8:	40978733          	sub	a4,a5,s1
    16dc:	fee552e3          	bge	a0,a4,16c0 <_malloc_r+0x100>
    16e0:	00080593          	mv	a1,a6
    16e4:	0109a403          	lw	s0,16(s3)
    16e8:	7ffff897          	auipc	a7,0x7ffff
    16ec:	a4088893          	add	a7,a7,-1472 # 80000128 <__malloc_av_+0x8>
    16f0:	27140e63          	beq	s0,a7,196c <_malloc_r+0x3ac>
    16f4:	00442783          	lw	a5,4(s0)
    16f8:	00f00693          	li	a3,15
    16fc:	ffc7f793          	and	a5,a5,-4
    1700:	40978733          	sub	a4,a5,s1
    1704:	38e6cc63          	blt	a3,a4,1a9c <_malloc_r+0x4dc>
    1708:	0119aa23          	sw	a7,20(s3)
    170c:	0119a823          	sw	a7,16(s3)
    1710:	36075063          	bgez	a4,1a70 <_malloc_r+0x4b0>
    1714:	1ff00713          	li	a4,511
    1718:	0049a503          	lw	a0,4(s3)
    171c:	26f76863          	bltu	a4,a5,198c <_malloc_r+0x3cc>
    1720:	ff87f713          	and	a4,a5,-8
    1724:	00870713          	add	a4,a4,8
    1728:	00e98733          	add	a4,s3,a4
    172c:	00072683          	lw	a3,0(a4)
    1730:	0057d613          	srl	a2,a5,0x5
    1734:	00100793          	li	a5,1
    1738:	00c797b3          	sll	a5,a5,a2
    173c:	00f56533          	or	a0,a0,a5
    1740:	ff870793          	add	a5,a4,-8
    1744:	00f42623          	sw	a5,12(s0)
    1748:	00d42423          	sw	a3,8(s0)
    174c:	00a9a223          	sw	a0,4(s3)
    1750:	00872023          	sw	s0,0(a4)
    1754:	0086a623          	sw	s0,12(a3)
    1758:	4025d793          	sra	a5,a1,0x2
    175c:	00100613          	li	a2,1
    1760:	00f61633          	sll	a2,a2,a5
    1764:	0ac56a63          	bltu	a0,a2,1818 <_malloc_r+0x258>
    1768:	00a677b3          	and	a5,a2,a0
    176c:	02079463          	bnez	a5,1794 <_malloc_r+0x1d4>
    1770:	00161613          	sll	a2,a2,0x1
    1774:	ffc5f593          	and	a1,a1,-4
    1778:	00a677b3          	and	a5,a2,a0
    177c:	00458593          	add	a1,a1,4
    1780:	00079a63          	bnez	a5,1794 <_malloc_r+0x1d4>
    1784:	00161613          	sll	a2,a2,0x1
    1788:	00a677b3          	and	a5,a2,a0
    178c:	00458593          	add	a1,a1,4
    1790:	fe078ae3          	beqz	a5,1784 <_malloc_r+0x1c4>
    1794:	00f00813          	li	a6,15
    1798:	00359313          	sll	t1,a1,0x3
    179c:	00698333          	add	t1,s3,t1
    17a0:	00030513          	mv	a0,t1
    17a4:	00c52783          	lw	a5,12(a0)
    17a8:	00058e13          	mv	t3,a1
    17ac:	26f50263          	beq	a0,a5,1a10 <_malloc_r+0x450>
    17b0:	0047a703          	lw	a4,4(a5)
    17b4:	00078413          	mv	s0,a5
    17b8:	00c7a783          	lw	a5,12(a5)
    17bc:	ffc77713          	and	a4,a4,-4
    17c0:	409706b3          	sub	a3,a4,s1
    17c4:	26d84263          	blt	a6,a3,1a28 <_malloc_r+0x468>
    17c8:	fe06c2e3          	bltz	a3,17ac <_malloc_r+0x1ec>
    17cc:	00e40733          	add	a4,s0,a4
    17d0:	00472683          	lw	a3,4(a4)
    17d4:	00842603          	lw	a2,8(s0)
    17d8:	00090513          	mv	a0,s2
    17dc:	0016e693          	or	a3,a3,1
    17e0:	00d72223          	sw	a3,4(a4)
    17e4:	00f62623          	sw	a5,12(a2)
    17e8:	00c7a423          	sw	a2,8(a5)
    17ec:	5c0000ef          	jal	1dac <__malloc_unlock>
    17f0:	00840513          	add	a0,s0,8
    17f4:	e59ff06f          	j	164c <_malloc_r+0x8c>
    17f8:	00c00793          	li	a5,12
    17fc:	00f92023          	sw	a5,0(s2) # 100000 <__neorv32_ram_size+0x80000>
    1800:	00000513          	li	a0,0
    1804:	e49ff06f          	j	164c <_malloc_r+0x8c>
    1808:	20000613          	li	a2,512
    180c:	04000593          	li	a1,64
    1810:	03f00813          	li	a6,63
    1814:	e8dff06f          	j	16a0 <_malloc_r+0xe0>
    1818:	0089a403          	lw	s0,8(s3)
    181c:	01612823          	sw	s6,16(sp)
    1820:	00442783          	lw	a5,4(s0)
    1824:	ffc7fb13          	and	s6,a5,-4
    1828:	009b6863          	bltu	s6,s1,1838 <_malloc_r+0x278>
    182c:	409b0733          	sub	a4,s6,s1
    1830:	00f00793          	li	a5,15
    1834:	0ee7ca63          	blt	a5,a4,1928 <_malloc_r+0x368>
    1838:	01912223          	sw	s9,4(sp)
    183c:	7ffffc97          	auipc	s9,0x7ffff
    1840:	ed0c8c93          	add	s9,s9,-304 # 8000070c <__malloc_sbrk_base>
    1844:	000ca703          	lw	a4,0(s9)
    1848:	01412c23          	sw	s4,24(sp)
    184c:	01512a23          	sw	s5,20(sp)
    1850:	01712623          	sw	s7,12(sp)
    1854:	7ffffa97          	auipc	s5,0x7ffff
    1858:	ed8aaa83          	lw	s5,-296(s5) # 8000072c <__malloc_top_pad>
    185c:	fff00793          	li	a5,-1
    1860:	01640a33          	add	s4,s0,s6
    1864:	01548ab3          	add	s5,s1,s5
    1868:	3ef70263          	beq	a4,a5,1c4c <_malloc_r+0x68c>
    186c:	000017b7          	lui	a5,0x1
    1870:	00f78793          	add	a5,a5,15 # 100f <memcpy+0xcf>
    1874:	00fa8ab3          	add	s5,s5,a5
    1878:	fffff7b7          	lui	a5,0xfffff
    187c:	00fafab3          	and	s5,s5,a5
    1880:	000a8593          	mv	a1,s5
    1884:	00090513          	mv	a0,s2
    1888:	7c9050ef          	jal	7850 <_sbrk_r>
    188c:	fff00793          	li	a5,-1
    1890:	00050b93          	mv	s7,a0
    1894:	46f50663          	beq	a0,a5,1d00 <_malloc_r+0x740>
    1898:	01812423          	sw	s8,8(sp)
    189c:	25456863          	bltu	a0,s4,1aec <_malloc_r+0x52c>
    18a0:	7ffffc17          	auipc	s8,0x7ffff
    18a4:	2d4c0c13          	add	s8,s8,724 # 80000b74 <__malloc_current_mallinfo>
    18a8:	000c2583          	lw	a1,0(s8)
    18ac:	00ba85b3          	add	a1,s5,a1
    18b0:	00bc2023          	sw	a1,0(s8)
    18b4:	00058713          	mv	a4,a1
    18b8:	2caa1063          	bne	s4,a0,1b78 <_malloc_r+0x5b8>
    18bc:	01451793          	sll	a5,a0,0x14
    18c0:	2a079c63          	bnez	a5,1b78 <_malloc_r+0x5b8>
    18c4:	0089ab83          	lw	s7,8(s3)
    18c8:	015b07b3          	add	a5,s6,s5
    18cc:	0017e793          	or	a5,a5,1
    18d0:	00fba223          	sw	a5,4(s7)
    18d4:	7ffff717          	auipc	a4,0x7ffff
    18d8:	e5470713          	add	a4,a4,-428 # 80000728 <__malloc_max_sbrked_mem>
    18dc:	00072683          	lw	a3,0(a4)
    18e0:	00b6f463          	bgeu	a3,a1,18e8 <_malloc_r+0x328>
    18e4:	00b72023          	sw	a1,0(a4)
    18e8:	7ffff717          	auipc	a4,0x7ffff
    18ec:	e3c70713          	add	a4,a4,-452 # 80000724 <__malloc_max_total_mem>
    18f0:	00072683          	lw	a3,0(a4)
    18f4:	00b6f463          	bgeu	a3,a1,18fc <_malloc_r+0x33c>
    18f8:	00b72023          	sw	a1,0(a4)
    18fc:	00812c03          	lw	s8,8(sp)
    1900:	000b8413          	mv	s0,s7
    1904:	ffc7f793          	and	a5,a5,-4
    1908:	40978733          	sub	a4,a5,s1
    190c:	3897ec63          	bltu	a5,s1,1ca4 <_malloc_r+0x6e4>
    1910:	00f00793          	li	a5,15
    1914:	38e7d863          	bge	a5,a4,1ca4 <_malloc_r+0x6e4>
    1918:	01812a03          	lw	s4,24(sp)
    191c:	01412a83          	lw	s5,20(sp)
    1920:	00c12b83          	lw	s7,12(sp)
    1924:	00412c83          	lw	s9,4(sp)
    1928:	0014e793          	or	a5,s1,1
    192c:	00f42223          	sw	a5,4(s0)
    1930:	009404b3          	add	s1,s0,s1
    1934:	0099a423          	sw	s1,8(s3)
    1938:	00176713          	or	a4,a4,1
    193c:	00090513          	mv	a0,s2
    1940:	00e4a223          	sw	a4,4(s1)
    1944:	468000ef          	jal	1dac <__malloc_unlock>
    1948:	02c12083          	lw	ra,44(sp)
    194c:	00840513          	add	a0,s0,8
    1950:	02812403          	lw	s0,40(sp)
    1954:	01012b03          	lw	s6,16(sp)
    1958:	02412483          	lw	s1,36(sp)
    195c:	02012903          	lw	s2,32(sp)
    1960:	01c12983          	lw	s3,28(sp)
    1964:	03010113          	add	sp,sp,48
    1968:	00008067          	ret
    196c:	0049a503          	lw	a0,4(s3)
    1970:	de9ff06f          	j	1758 <_malloc_r+0x198>
    1974:	00842603          	lw	a2,8(s0)
    1978:	cb1ff06f          	j	1628 <_malloc_r+0x68>
    197c:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1980:	00258593          	add	a1,a1,2
    1984:	d68780e3          	beq	a5,s0,16e4 <_malloc_r+0x124>
    1988:	c91ff06f          	j	1618 <_malloc_r+0x58>
    198c:	0097d713          	srl	a4,a5,0x9
    1990:	00400693          	li	a3,4
    1994:	14e6f263          	bgeu	a3,a4,1ad8 <_malloc_r+0x518>
    1998:	01400693          	li	a3,20
    199c:	32e6e663          	bltu	a3,a4,1cc8 <_malloc_r+0x708>
    19a0:	05c70613          	add	a2,a4,92
    19a4:	05b70693          	add	a3,a4,91
    19a8:	00361613          	sll	a2,a2,0x3
    19ac:	00c98633          	add	a2,s3,a2
    19b0:	00062703          	lw	a4,0(a2)
    19b4:	ff860613          	add	a2,a2,-8
    19b8:	00e61863          	bne	a2,a4,19c8 <_malloc_r+0x408>
    19bc:	2980006f          	j	1c54 <_malloc_r+0x694>
    19c0:	00872703          	lw	a4,8(a4)
    19c4:	00e60863          	beq	a2,a4,19d4 <_malloc_r+0x414>
    19c8:	00472683          	lw	a3,4(a4)
    19cc:	ffc6f693          	and	a3,a3,-4
    19d0:	fed7e8e3          	bltu	a5,a3,19c0 <_malloc_r+0x400>
    19d4:	00c72603          	lw	a2,12(a4)
    19d8:	00c42623          	sw	a2,12(s0)
    19dc:	00e42423          	sw	a4,8(s0)
    19e0:	00862423          	sw	s0,8(a2)
    19e4:	00872623          	sw	s0,12(a4)
    19e8:	d71ff06f          	j	1758 <_malloc_r+0x198>
    19ec:	01400713          	li	a4,20
    19f0:	10f77863          	bgeu	a4,a5,1b00 <_malloc_r+0x540>
    19f4:	05400713          	li	a4,84
    19f8:	2ef76663          	bltu	a4,a5,1ce4 <_malloc_r+0x724>
    19fc:	00c4d793          	srl	a5,s1,0xc
    1a00:	06f78593          	add	a1,a5,111
    1a04:	06e78813          	add	a6,a5,110
    1a08:	00359613          	sll	a2,a1,0x3
    1a0c:	c95ff06f          	j	16a0 <_malloc_r+0xe0>
    1a10:	001e0e13          	add	t3,t3,1
    1a14:	003e7793          	and	a5,t3,3
    1a18:	00850513          	add	a0,a0,8
    1a1c:	10078063          	beqz	a5,1b1c <_malloc_r+0x55c>
    1a20:	00c52783          	lw	a5,12(a0)
    1a24:	d89ff06f          	j	17ac <_malloc_r+0x1ec>
    1a28:	00842603          	lw	a2,8(s0)
    1a2c:	0014e593          	or	a1,s1,1
    1a30:	00b42223          	sw	a1,4(s0)
    1a34:	00f62623          	sw	a5,12(a2)
    1a38:	00c7a423          	sw	a2,8(a5)
    1a3c:	009404b3          	add	s1,s0,s1
    1a40:	0099aa23          	sw	s1,20(s3)
    1a44:	0099a823          	sw	s1,16(s3)
    1a48:	0016e793          	or	a5,a3,1
    1a4c:	0114a623          	sw	a7,12(s1)
    1a50:	0114a423          	sw	a7,8(s1)
    1a54:	00f4a223          	sw	a5,4(s1)
    1a58:	00e40733          	add	a4,s0,a4
    1a5c:	00090513          	mv	a0,s2
    1a60:	00d72023          	sw	a3,0(a4)
    1a64:	348000ef          	jal	1dac <__malloc_unlock>
    1a68:	00840513          	add	a0,s0,8
    1a6c:	be1ff06f          	j	164c <_malloc_r+0x8c>
    1a70:	00f407b3          	add	a5,s0,a5
    1a74:	0047a703          	lw	a4,4(a5)
    1a78:	00090513          	mv	a0,s2
    1a7c:	00176713          	or	a4,a4,1
    1a80:	00e7a223          	sw	a4,4(a5)
    1a84:	328000ef          	jal	1dac <__malloc_unlock>
    1a88:	00840513          	add	a0,s0,8
    1a8c:	bc1ff06f          	j	164c <_malloc_r+0x8c>
    1a90:	0034d593          	srl	a1,s1,0x3
    1a94:	00848793          	add	a5,s1,8
    1a98:	b69ff06f          	j	1600 <_malloc_r+0x40>
    1a9c:	0014e693          	or	a3,s1,1
    1aa0:	00d42223          	sw	a3,4(s0)
    1aa4:	009404b3          	add	s1,s0,s1
    1aa8:	0099aa23          	sw	s1,20(s3)
    1aac:	0099a823          	sw	s1,16(s3)
    1ab0:	00176693          	or	a3,a4,1
    1ab4:	0114a623          	sw	a7,12(s1)
    1ab8:	0114a423          	sw	a7,8(s1)
    1abc:	00d4a223          	sw	a3,4(s1)
    1ac0:	00f407b3          	add	a5,s0,a5
    1ac4:	00090513          	mv	a0,s2
    1ac8:	00e7a023          	sw	a4,0(a5)
    1acc:	2e0000ef          	jal	1dac <__malloc_unlock>
    1ad0:	00840513          	add	a0,s0,8
    1ad4:	b79ff06f          	j	164c <_malloc_r+0x8c>
    1ad8:	0067d713          	srl	a4,a5,0x6
    1adc:	03970613          	add	a2,a4,57
    1ae0:	03870693          	add	a3,a4,56
    1ae4:	00361613          	sll	a2,a2,0x3
    1ae8:	ec5ff06f          	j	19ac <_malloc_r+0x3ec>
    1aec:	07340c63          	beq	s0,s3,1b64 <_malloc_r+0x5a4>
    1af0:	0089a403          	lw	s0,8(s3)
    1af4:	00812c03          	lw	s8,8(sp)
    1af8:	00442783          	lw	a5,4(s0)
    1afc:	e09ff06f          	j	1904 <_malloc_r+0x344>
    1b00:	05c78593          	add	a1,a5,92
    1b04:	05b78813          	add	a6,a5,91
    1b08:	00359613          	sll	a2,a1,0x3
    1b0c:	b95ff06f          	j	16a0 <_malloc_r+0xe0>
    1b10:	00832783          	lw	a5,8(t1)
    1b14:	fff58593          	add	a1,a1,-1
    1b18:	28679063          	bne	a5,t1,1d98 <_malloc_r+0x7d8>
    1b1c:	0035f793          	and	a5,a1,3
    1b20:	ff830313          	add	t1,t1,-8
    1b24:	fe0796e3          	bnez	a5,1b10 <_malloc_r+0x550>
    1b28:	0049a703          	lw	a4,4(s3)
    1b2c:	fff64793          	not	a5,a2
    1b30:	00e7f7b3          	and	a5,a5,a4
    1b34:	00f9a223          	sw	a5,4(s3)
    1b38:	00161613          	sll	a2,a2,0x1
    1b3c:	ccc7eee3          	bltu	a5,a2,1818 <_malloc_r+0x258>
    1b40:	cc060ce3          	beqz	a2,1818 <_malloc_r+0x258>
    1b44:	00f67733          	and	a4,a2,a5
    1b48:	00071a63          	bnez	a4,1b5c <_malloc_r+0x59c>
    1b4c:	00161613          	sll	a2,a2,0x1
    1b50:	00f67733          	and	a4,a2,a5
    1b54:	004e0e13          	add	t3,t3,4
    1b58:	fe070ae3          	beqz	a4,1b4c <_malloc_r+0x58c>
    1b5c:	000e0593          	mv	a1,t3
    1b60:	c39ff06f          	j	1798 <_malloc_r+0x1d8>
    1b64:	7ffffc17          	auipc	s8,0x7ffff
    1b68:	010c0c13          	add	s8,s8,16 # 80000b74 <__malloc_current_mallinfo>
    1b6c:	000c2703          	lw	a4,0(s8)
    1b70:	00ea8733          	add	a4,s5,a4
    1b74:	00ec2023          	sw	a4,0(s8)
    1b78:	000ca683          	lw	a3,0(s9)
    1b7c:	fff00793          	li	a5,-1
    1b80:	18f68663          	beq	a3,a5,1d0c <_malloc_r+0x74c>
    1b84:	414b87b3          	sub	a5,s7,s4
    1b88:	00e787b3          	add	a5,a5,a4
    1b8c:	00fc2023          	sw	a5,0(s8)
    1b90:	007bfc93          	and	s9,s7,7
    1b94:	0c0c8c63          	beqz	s9,1c6c <_malloc_r+0x6ac>
    1b98:	419b8bb3          	sub	s7,s7,s9
    1b9c:	000017b7          	lui	a5,0x1
    1ba0:	00878793          	add	a5,a5,8 # 1008 <memcpy+0xc8>
    1ba4:	008b8b93          	add	s7,s7,8
    1ba8:	419785b3          	sub	a1,a5,s9
    1bac:	015b8ab3          	add	s5,s7,s5
    1bb0:	415585b3          	sub	a1,a1,s5
    1bb4:	01459593          	sll	a1,a1,0x14
    1bb8:	0145da13          	srl	s4,a1,0x14
    1bbc:	000a0593          	mv	a1,s4
    1bc0:	00090513          	mv	a0,s2
    1bc4:	48d050ef          	jal	7850 <_sbrk_r>
    1bc8:	fff00793          	li	a5,-1
    1bcc:	18f50063          	beq	a0,a5,1d4c <_malloc_r+0x78c>
    1bd0:	41750533          	sub	a0,a0,s7
    1bd4:	01450ab3          	add	s5,a0,s4
    1bd8:	000c2703          	lw	a4,0(s8)
    1bdc:	0179a423          	sw	s7,8(s3)
    1be0:	001ae793          	or	a5,s5,1
    1be4:	00ea05b3          	add	a1,s4,a4
    1be8:	00bc2023          	sw	a1,0(s8)
    1bec:	00fba223          	sw	a5,4(s7)
    1bf0:	cf3402e3          	beq	s0,s3,18d4 <_malloc_r+0x314>
    1bf4:	00f00693          	li	a3,15
    1bf8:	0b66f063          	bgeu	a3,s6,1c98 <_malloc_r+0x6d8>
    1bfc:	00442703          	lw	a4,4(s0)
    1c00:	ff4b0793          	add	a5,s6,-12
    1c04:	ff87f793          	and	a5,a5,-8
    1c08:	00177713          	and	a4,a4,1
    1c0c:	00f76733          	or	a4,a4,a5
    1c10:	00e42223          	sw	a4,4(s0)
    1c14:	00500613          	li	a2,5
    1c18:	00f40733          	add	a4,s0,a5
    1c1c:	00c72223          	sw	a2,4(a4)
    1c20:	00c72423          	sw	a2,8(a4)
    1c24:	00f6e663          	bltu	a3,a5,1c30 <_malloc_r+0x670>
    1c28:	004ba783          	lw	a5,4(s7)
    1c2c:	ca9ff06f          	j	18d4 <_malloc_r+0x314>
    1c30:	00840593          	add	a1,s0,8
    1c34:	00090513          	mv	a0,s2
    1c38:	e7cff0ef          	jal	12b4 <_free_r>
    1c3c:	0089ab83          	lw	s7,8(s3)
    1c40:	000c2583          	lw	a1,0(s8)
    1c44:	004ba783          	lw	a5,4(s7)
    1c48:	c8dff06f          	j	18d4 <_malloc_r+0x314>
    1c4c:	010a8a93          	add	s5,s5,16
    1c50:	c31ff06f          	j	1880 <_malloc_r+0x2c0>
    1c54:	4026d693          	sra	a3,a3,0x2
    1c58:	00100793          	li	a5,1
    1c5c:	00d797b3          	sll	a5,a5,a3
    1c60:	00f56533          	or	a0,a0,a5
    1c64:	00a9a223          	sw	a0,4(s3)
    1c68:	d71ff06f          	j	19d8 <_malloc_r+0x418>
    1c6c:	015b85b3          	add	a1,s7,s5
    1c70:	40b005b3          	neg	a1,a1
    1c74:	01459593          	sll	a1,a1,0x14
    1c78:	0145da13          	srl	s4,a1,0x14
    1c7c:	000a0593          	mv	a1,s4
    1c80:	00090513          	mv	a0,s2
    1c84:	3cd050ef          	jal	7850 <_sbrk_r>
    1c88:	fff00793          	li	a5,-1
    1c8c:	f4f512e3          	bne	a0,a5,1bd0 <_malloc_r+0x610>
    1c90:	00000a13          	li	s4,0
    1c94:	f45ff06f          	j	1bd8 <_malloc_r+0x618>
    1c98:	00812c03          	lw	s8,8(sp)
    1c9c:	00100793          	li	a5,1
    1ca0:	00fba223          	sw	a5,4(s7)
    1ca4:	00090513          	mv	a0,s2
    1ca8:	104000ef          	jal	1dac <__malloc_unlock>
    1cac:	00000513          	li	a0,0
    1cb0:	01812a03          	lw	s4,24(sp)
    1cb4:	01412a83          	lw	s5,20(sp)
    1cb8:	01012b03          	lw	s6,16(sp)
    1cbc:	00c12b83          	lw	s7,12(sp)
    1cc0:	00412c83          	lw	s9,4(sp)
    1cc4:	989ff06f          	j	164c <_malloc_r+0x8c>
    1cc8:	05400693          	li	a3,84
    1ccc:	04e6e463          	bltu	a3,a4,1d14 <_malloc_r+0x754>
    1cd0:	00c7d713          	srl	a4,a5,0xc
    1cd4:	06f70613          	add	a2,a4,111
    1cd8:	06e70693          	add	a3,a4,110
    1cdc:	00361613          	sll	a2,a2,0x3
    1ce0:	ccdff06f          	j	19ac <_malloc_r+0x3ec>
    1ce4:	15400713          	li	a4,340
    1ce8:	04f76463          	bltu	a4,a5,1d30 <_malloc_r+0x770>
    1cec:	00f4d793          	srl	a5,s1,0xf
    1cf0:	07878593          	add	a1,a5,120
    1cf4:	07778813          	add	a6,a5,119
    1cf8:	00359613          	sll	a2,a1,0x3
    1cfc:	9a5ff06f          	j	16a0 <_malloc_r+0xe0>
    1d00:	0089a403          	lw	s0,8(s3)
    1d04:	00442783          	lw	a5,4(s0)
    1d08:	bfdff06f          	j	1904 <_malloc_r+0x344>
    1d0c:	017ca023          	sw	s7,0(s9)
    1d10:	e81ff06f          	j	1b90 <_malloc_r+0x5d0>
    1d14:	15400693          	li	a3,340
    1d18:	04e6e463          	bltu	a3,a4,1d60 <_malloc_r+0x7a0>
    1d1c:	00f7d713          	srl	a4,a5,0xf
    1d20:	07870613          	add	a2,a4,120
    1d24:	07770693          	add	a3,a4,119
    1d28:	00361613          	sll	a2,a2,0x3
    1d2c:	c81ff06f          	j	19ac <_malloc_r+0x3ec>
    1d30:	55400713          	li	a4,1364
    1d34:	04f76463          	bltu	a4,a5,1d7c <_malloc_r+0x7bc>
    1d38:	0124d793          	srl	a5,s1,0x12
    1d3c:	07d78593          	add	a1,a5,125
    1d40:	07c78813          	add	a6,a5,124
    1d44:	00359613          	sll	a2,a1,0x3
    1d48:	959ff06f          	j	16a0 <_malloc_r+0xe0>
    1d4c:	ff8c8c93          	add	s9,s9,-8
    1d50:	019a8ab3          	add	s5,s5,s9
    1d54:	417a8ab3          	sub	s5,s5,s7
    1d58:	00000a13          	li	s4,0
    1d5c:	e7dff06f          	j	1bd8 <_malloc_r+0x618>
    1d60:	55400693          	li	a3,1364
    1d64:	02e6e463          	bltu	a3,a4,1d8c <_malloc_r+0x7cc>
    1d68:	0127d713          	srl	a4,a5,0x12
    1d6c:	07d70613          	add	a2,a4,125
    1d70:	07c70693          	add	a3,a4,124
    1d74:	00361613          	sll	a2,a2,0x3
    1d78:	c35ff06f          	j	19ac <_malloc_r+0x3ec>
    1d7c:	3f800613          	li	a2,1016
    1d80:	07f00593          	li	a1,127
    1d84:	07e00813          	li	a6,126
    1d88:	919ff06f          	j	16a0 <_malloc_r+0xe0>
    1d8c:	3f800613          	li	a2,1016
    1d90:	07e00693          	li	a3,126
    1d94:	c19ff06f          	j	19ac <_malloc_r+0x3ec>
    1d98:	0049a783          	lw	a5,4(s3)
    1d9c:	d9dff06f          	j	1b38 <_malloc_r+0x578>

00001da0 <__malloc_lock>:
    1da0:	7ffff517          	auipc	a0,0x7ffff
    1da4:	97c50513          	add	a0,a0,-1668 # 8000071c <__lock___malloc_recursive_mutex>
    1da8:	8b4ff06f          	j	e5c <__retarget_lock_acquire_recursive>

00001dac <__malloc_unlock>:
    1dac:	7ffff517          	auipc	a0,0x7ffff
    1db0:	97050513          	add	a0,a0,-1680 # 8000071c <__lock___malloc_recursive_mutex>
    1db4:	8acff06f          	j	e60 <__retarget_lock_release_recursive>

00001db8 <_vfprintf_r>:
    1db8:	e7010113          	add	sp,sp,-400
    1dbc:	18112623          	sw	ra,396(sp)
    1dc0:	00b12423          	sw	a1,8(sp)
    1dc4:	00c12623          	sw	a2,12(sp)
    1dc8:	00d12a23          	sw	a3,20(sp)
    1dcc:	17312e23          	sw	s3,380(sp)
    1dd0:	18812423          	sw	s0,392(sp)
    1dd4:	00050993          	mv	s3,a0
    1dd8:	14d050ef          	jal	7724 <_localeconv_r>
    1ddc:	00052783          	lw	a5,0(a0)
    1de0:	00078513          	mv	a0,a5
    1de4:	02f12a23          	sw	a5,52(sp)
    1de8:	afcff0ef          	jal	10e4 <strlen>
    1dec:	00050713          	mv	a4,a0
    1df0:	00800613          	li	a2,8
    1df4:	00000593          	li	a1,0
    1df8:	09010513          	add	a0,sp,144
    1dfc:	02e12823          	sw	a4,48(sp)
    1e00:	864ff0ef          	jal	e64 <memset>
    1e04:	00c12783          	lw	a5,12(sp)
    1e08:	00098863          	beqz	s3,1e18 <_vfprintf_r+0x60>
    1e0c:	0349a703          	lw	a4,52(s3)
    1e10:	00071463          	bnez	a4,1e18 <_vfprintf_r+0x60>
    1e14:	29d0106f          	j	38b0 <_vfprintf_r+0x1af8>
    1e18:	00812703          	lw	a4,8(sp)
    1e1c:	06472683          	lw	a3,100(a4)
    1e20:	00c71703          	lh	a4,12(a4)
    1e24:	0016f693          	and	a3,a3,1
    1e28:	00069863          	bnez	a3,1e38 <_vfprintf_r+0x80>
    1e2c:	20077693          	and	a3,a4,512
    1e30:	00069463          	bnez	a3,1e38 <_vfprintf_r+0x80>
    1e34:	3ec0106f          	j	3220 <_vfprintf_r+0x1468>
    1e38:	01271693          	sll	a3,a4,0x12
    1e3c:	0206c863          	bltz	a3,1e6c <_vfprintf_r+0xb4>
    1e40:	00812503          	lw	a0,8(sp)
    1e44:	000025b7          	lui	a1,0x2
    1e48:	ffffe637          	lui	a2,0xffffe
    1e4c:	06452683          	lw	a3,100(a0)
    1e50:	00b76733          	or	a4,a4,a1
    1e54:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1e58:	01071713          	sll	a4,a4,0x10
    1e5c:	41075713          	sra	a4,a4,0x10
    1e60:	00c6f6b3          	and	a3,a3,a2
    1e64:	00e51623          	sh	a4,12(a0)
    1e68:	06d52223          	sw	a3,100(a0)
    1e6c:	00877693          	and	a3,a4,8
    1e70:	2a068063          	beqz	a3,2110 <_vfprintf_r+0x358>
    1e74:	00812683          	lw	a3,8(sp)
    1e78:	0106a683          	lw	a3,16(a3)
    1e7c:	28068a63          	beqz	a3,2110 <_vfprintf_r+0x358>
    1e80:	01a77693          	and	a3,a4,26
    1e84:	00a00613          	li	a2,10
    1e88:	2ac68c63          	beq	a3,a2,2140 <_vfprintf_r+0x388>
    1e8c:	0ac10713          	add	a4,sp,172
    1e90:	17512a23          	sw	s5,372(sp)
    1e94:	17812423          	sw	s8,360(sp)
    1e98:	15b12e23          	sw	s11,348(sp)
    1e9c:	18912223          	sw	s1,388(sp)
    1ea0:	19212023          	sw	s2,384(sp)
    1ea4:	17412c23          	sw	s4,376(sp)
    1ea8:	17612823          	sw	s6,368(sp)
    1eac:	17712623          	sw	s7,364(sp)
    1eb0:	17912223          	sw	s9,356(sp)
    1eb4:	17a12023          	sw	s10,352(sp)
    1eb8:	0ae12023          	sw	a4,160(sp)
    1ebc:	0a012423          	sw	zero,168(sp)
    1ec0:	0a012223          	sw	zero,164(sp)
    1ec4:	00012c23          	sw	zero,24(sp)
    1ec8:	02012423          	sw	zero,40(sp)
    1ecc:	02012623          	sw	zero,44(sp)
    1ed0:	00070413          	mv	s0,a4
    1ed4:	02012c23          	sw	zero,56(sp)
    1ed8:	04012023          	sw	zero,64(sp)
    1edc:	02012e23          	sw	zero,60(sp)
    1ee0:	04012623          	sw	zero,76(sp)
    1ee4:	04012423          	sw	zero,72(sp)
    1ee8:	00012623          	sw	zero,12(sp)
    1eec:	7fffea97          	auipc	s5,0x7fffe
    1ef0:	648a8a93          	add	s5,s5,1608 # 80000534 <__global_locale>
    1ef4:	02500d93          	li	s11,37
    1ef8:	00078c13          	mv	s8,a5
    1efc:	000c0913          	mv	s2,s8
    1f00:	0e4aa483          	lw	s1,228(s5)
    1f04:	015050ef          	jal	7718 <__locale_mb_cur_max>
    1f08:	00050693          	mv	a3,a0
    1f0c:	09010713          	add	a4,sp,144
    1f10:	00090613          	mv	a2,s2
    1f14:	08010593          	add	a1,sp,128
    1f18:	00098513          	mv	a0,s3
    1f1c:	000480e7          	jalr	s1
    1f20:	2c050a63          	beqz	a0,21f4 <_vfprintf_r+0x43c>
    1f24:	2a054a63          	bltz	a0,21d8 <_vfprintf_r+0x420>
    1f28:	08012783          	lw	a5,128(sp)
    1f2c:	01b78663          	beq	a5,s11,1f38 <_vfprintf_r+0x180>
    1f30:	00a90933          	add	s2,s2,a0
    1f34:	fcdff06f          	j	1f00 <_vfprintf_r+0x148>
    1f38:	00050493          	mv	s1,a0
    1f3c:	41890cb3          	sub	s9,s2,s8
    1f40:	2d891063          	bne	s2,s8,2200 <_vfprintf_r+0x448>
    1f44:	fff00313          	li	t1,-1
    1f48:	00000e93          	li	t4,0
    1f4c:	00194e03          	lbu	t3,1(s2)
    1f50:	06010ba3          	sb	zero,119(sp)
    1f54:	00190913          	add	s2,s2,1
    1f58:	00000b93          	li	s7,0
    1f5c:	05a00493          	li	s1,90
    1f60:	000e8a13          	mv	s4,t4
    1f64:	00030b13          	mv	s6,t1
    1f68:	00190913          	add	s2,s2,1
    1f6c:	fe0e0793          	add	a5,t3,-32
    1f70:	04f4ea63          	bltu	s1,a5,1fc4 <_vfprintf_r+0x20c>
    1f74:	0000d717          	auipc	a4,0xd
    1f78:	2fc70713          	add	a4,a4,764 # f270 <_ctype_+0x104>
    1f7c:	00279793          	sll	a5,a5,0x2
    1f80:	00e787b3          	add	a5,a5,a4
    1f84:	0007a783          	lw	a5,0(a5)
    1f88:	00e787b3          	add	a5,a5,a4
    1f8c:	00078067          	jr	a5
    1f90:	00000b93          	li	s7,0
    1f94:	fd0e0713          	add	a4,t3,-48
    1f98:	00900693          	li	a3,9
    1f9c:	00094e03          	lbu	t3,0(s2)
    1fa0:	002b9793          	sll	a5,s7,0x2
    1fa4:	017787b3          	add	a5,a5,s7
    1fa8:	00179793          	sll	a5,a5,0x1
    1fac:	00f70bb3          	add	s7,a4,a5
    1fb0:	fd0e0713          	add	a4,t3,-48
    1fb4:	00190913          	add	s2,s2,1
    1fb8:	fee6f2e3          	bgeu	a3,a4,1f9c <_vfprintf_r+0x1e4>
    1fbc:	fe0e0793          	add	a5,t3,-32
    1fc0:	faf4fae3          	bgeu	s1,a5,1f74 <_vfprintf_r+0x1bc>
    1fc4:	000a0e93          	mv	t4,s4
    1fc8:	260e0a63          	beqz	t3,223c <_vfprintf_r+0x484>
    1fcc:	0fc10623          	sb	t3,236(sp)
    1fd0:	06010ba3          	sb	zero,119(sp)
    1fd4:	00100c93          	li	s9,1
    1fd8:	00000613          	li	a2,0
    1fdc:	00012823          	sw	zero,16(sp)
    1fe0:	00100d13          	li	s10,1
    1fe4:	00000313          	li	t1,0
    1fe8:	02012223          	sw	zero,36(sp)
    1fec:	02012023          	sw	zero,32(sp)
    1ff0:	00000a13          	li	s4,0
    1ff4:	0ec10c13          	add	s8,sp,236
    1ff8:	002ef293          	and	t0,t4,2
    1ffc:	00028463          	beqz	t0,2004 <_vfprintf_r+0x24c>
    2000:	002c8c93          	add	s9,s9,2
    2004:	084eff93          	and	t6,t4,132
    2008:	0a812483          	lw	s1,168(sp)
    200c:	000f9663          	bnez	t6,2018 <_vfprintf_r+0x260>
    2010:	419b8733          	sub	a4,s7,s9
    2014:	40e04663          	bgtz	a4,2420 <_vfprintf_r+0x668>
    2018:	02060a63          	beqz	a2,204c <_vfprintf_r+0x294>
    201c:	0a412703          	lw	a4,164(sp)
    2020:	07710613          	add	a2,sp,119
    2024:	00148493          	add	s1,s1,1
    2028:	00170713          	add	a4,a4,1
    202c:	00100793          	li	a5,1
    2030:	00c42023          	sw	a2,0(s0)
    2034:	00f42223          	sw	a5,4(s0)
    2038:	0a912423          	sw	s1,168(sp)
    203c:	0ae12223          	sw	a4,164(sp)
    2040:	00700613          	li	a2,7
    2044:	00840413          	add	s0,s0,8
    2048:	4ce64863          	blt	a2,a4,2518 <_vfprintf_r+0x760>
    204c:	02028a63          	beqz	t0,2080 <_vfprintf_r+0x2c8>
    2050:	0a412703          	lw	a4,164(sp)
    2054:	07810613          	add	a2,sp,120
    2058:	00c42023          	sw	a2,0(s0)
    205c:	00248493          	add	s1,s1,2
    2060:	00200613          	li	a2,2
    2064:	00170713          	add	a4,a4,1
    2068:	00c42223          	sw	a2,4(s0)
    206c:	0a912423          	sw	s1,168(sp)
    2070:	0ae12223          	sw	a4,164(sp)
    2074:	00700613          	li	a2,7
    2078:	00840413          	add	s0,s0,8
    207c:	5ce644e3          	blt	a2,a4,2e44 <_vfprintf_r+0x108c>
    2080:	08000713          	li	a4,128
    2084:	3aef80e3          	beq	t6,a4,2c24 <_vfprintf_r+0xe6c>
    2088:	41a30b33          	sub	s6,t1,s10
    208c:	4b604ae3          	bgtz	s6,2d40 <_vfprintf_r+0xf88>
    2090:	100ef713          	and	a4,t4,256
    2094:	1a0710e3          	bnez	a4,2a34 <_vfprintf_r+0xc7c>
    2098:	0a412783          	lw	a5,164(sp)
    209c:	01a484b3          	add	s1,s1,s10
    20a0:	01842023          	sw	s8,0(s0)
    20a4:	00178793          	add	a5,a5,1
    20a8:	01a42223          	sw	s10,4(s0)
    20ac:	0a912423          	sw	s1,168(sp)
    20b0:	0af12223          	sw	a5,164(sp)
    20b4:	00700713          	li	a4,7
    20b8:	58f74c63          	blt	a4,a5,2650 <_vfprintf_r+0x898>
    20bc:	00840413          	add	s0,s0,8
    20c0:	004eff13          	and	t5,t4,4
    20c4:	000f0663          	beqz	t5,20d0 <_vfprintf_r+0x318>
    20c8:	419b8d33          	sub	s10,s7,s9
    20cc:	5ba04ce3          	bgtz	s10,2e84 <_vfprintf_r+0x10cc>
    20d0:	000b8e93          	mv	t4,s7
    20d4:	019bd463          	bge	s7,s9,20dc <_vfprintf_r+0x324>
    20d8:	000c8e93          	mv	t4,s9
    20dc:	00c12783          	lw	a5,12(sp)
    20e0:	01d787b3          	add	a5,a5,t4
    20e4:	00f12623          	sw	a5,12(sp)
    20e8:	18049663          	bnez	s1,2274 <_vfprintf_r+0x4bc>
    20ec:	01012783          	lw	a5,16(sp)
    20f0:	0a012223          	sw	zero,164(sp)
    20f4:	00078863          	beqz	a5,2104 <_vfprintf_r+0x34c>
    20f8:	01012583          	lw	a1,16(sp)
    20fc:	00098513          	mv	a0,s3
    2100:	9b4ff0ef          	jal	12b4 <_free_r>
    2104:	0ac10413          	add	s0,sp,172
    2108:	00090c13          	mv	s8,s2
    210c:	df1ff06f          	j	1efc <_vfprintf_r+0x144>
    2110:	00812403          	lw	s0,8(sp)
    2114:	00098513          	mv	a0,s3
    2118:	00f12623          	sw	a5,12(sp)
    211c:	00040593          	mv	a1,s0
    2120:	118050ef          	jal	7238 <__swsetup_r>
    2124:	00050463          	beqz	a0,212c <_vfprintf_r+0x374>
    2128:	5600206f          	j	4688 <_vfprintf_r+0x28d0>
    212c:	00c41703          	lh	a4,12(s0)
    2130:	00a00613          	li	a2,10
    2134:	00c12783          	lw	a5,12(sp)
    2138:	01a77693          	and	a3,a4,26
    213c:	d4c698e3          	bne	a3,a2,1e8c <_vfprintf_r+0xd4>
    2140:	00812603          	lw	a2,8(sp)
    2144:	00e61683          	lh	a3,14(a2)
    2148:	d406c2e3          	bltz	a3,1e8c <_vfprintf_r+0xd4>
    214c:	06462683          	lw	a3,100(a2)
    2150:	0016f693          	and	a3,a3,1
    2154:	00069863          	bnez	a3,2164 <_vfprintf_r+0x3ac>
    2158:	20077713          	and	a4,a4,512
    215c:	00071463          	bnez	a4,2164 <_vfprintf_r+0x3ac>
    2160:	53d0106f          	j	3e9c <_vfprintf_r+0x20e4>
    2164:	01412683          	lw	a3,20(sp)
    2168:	00812583          	lw	a1,8(sp)
    216c:	00098513          	mv	a0,s3
    2170:	00078613          	mv	a2,a5
    2174:	0e5020ef          	jal	4a58 <__sbprintf>
    2178:	18c12083          	lw	ra,396(sp)
    217c:	18812403          	lw	s0,392(sp)
    2180:	00a12623          	sw	a0,12(sp)
    2184:	00c12503          	lw	a0,12(sp)
    2188:	17c12983          	lw	s3,380(sp)
    218c:	19010113          	add	sp,sp,400
    2190:	00008067          	ret
    2194:	00098513          	mv	a0,s3
    2198:	58c050ef          	jal	7724 <_localeconv_r>
    219c:	00452783          	lw	a5,4(a0)
    21a0:	00078513          	mv	a0,a5
    21a4:	04f12423          	sw	a5,72(sp)
    21a8:	f3dfe0ef          	jal	10e4 <strlen>
    21ac:	00050793          	mv	a5,a0
    21b0:	00098513          	mv	a0,s3
    21b4:	00078c93          	mv	s9,a5
    21b8:	04f12623          	sw	a5,76(sp)
    21bc:	568050ef          	jal	7724 <_localeconv_r>
    21c0:	00852703          	lw	a4,8(a0)
    21c4:	02e12e23          	sw	a4,60(sp)
    21c8:	000c8463          	beqz	s9,21d0 <_vfprintf_r+0x418>
    21cc:	1ec0106f          	j	33b8 <_vfprintf_r+0x1600>
    21d0:	00094e03          	lbu	t3,0(s2)
    21d4:	d95ff06f          	j	1f68 <_vfprintf_r+0x1b0>
    21d8:	00800613          	li	a2,8
    21dc:	00000593          	li	a1,0
    21e0:	09010513          	add	a0,sp,144
    21e4:	c81fe0ef          	jal	e64 <memset>
    21e8:	00100513          	li	a0,1
    21ec:	00a90933          	add	s2,s2,a0
    21f0:	d11ff06f          	j	1f00 <_vfprintf_r+0x148>
    21f4:	00050493          	mv	s1,a0
    21f8:	41890cb3          	sub	s9,s2,s8
    21fc:	05890063          	beq	s2,s8,223c <_vfprintf_r+0x484>
    2200:	0a812683          	lw	a3,168(sp)
    2204:	0a412703          	lw	a4,164(sp)
    2208:	01842023          	sw	s8,0(s0)
    220c:	019686b3          	add	a3,a3,s9
    2210:	00170713          	add	a4,a4,1
    2214:	01942223          	sw	s9,4(s0)
    2218:	0ad12423          	sw	a3,168(sp)
    221c:	0ae12223          	sw	a4,164(sp)
    2220:	00700693          	li	a3,7
    2224:	00840413          	add	s0,s0,8
    2228:	02e6c863          	blt	a3,a4,2258 <_vfprintf_r+0x4a0>
    222c:	00c12783          	lw	a5,12(sp)
    2230:	019787b3          	add	a5,a5,s9
    2234:	00f12623          	sw	a5,12(sp)
    2238:	d00496e3          	bnez	s1,1f44 <_vfprintf_r+0x18c>
    223c:	0a812783          	lw	a5,168(sp)
    2240:	00078463          	beqz	a5,2248 <_vfprintf_r+0x490>
    2244:	4090106f          	j	3e4c <_vfprintf_r+0x2094>
    2248:	00812783          	lw	a5,8(sp)
    224c:	0a012223          	sw	zero,164(sp)
    2250:	00c79783          	lh	a5,12(a5)
    2254:	0500006f          	j	22a4 <_vfprintf_r+0x4ec>
    2258:	00812583          	lw	a1,8(sp)
    225c:	0a010613          	add	a2,sp,160
    2260:	00098513          	mv	a0,s3
    2264:	211020ef          	jal	4c74 <__sprint_r>
    2268:	02051a63          	bnez	a0,229c <_vfprintf_r+0x4e4>
    226c:	0ac10413          	add	s0,sp,172
    2270:	fbdff06f          	j	222c <_vfprintf_r+0x474>
    2274:	00812583          	lw	a1,8(sp)
    2278:	0a010613          	add	a2,sp,160
    227c:	00098513          	mv	a0,s3
    2280:	1f5020ef          	jal	4c74 <__sprint_r>
    2284:	e60504e3          	beqz	a0,20ec <_vfprintf_r+0x334>
    2288:	01012283          	lw	t0,16(sp)
    228c:	00028863          	beqz	t0,229c <_vfprintf_r+0x4e4>
    2290:	00028593          	mv	a1,t0
    2294:	00098513          	mv	a0,s3
    2298:	81cff0ef          	jal	12b4 <_free_r>
    229c:	00812783          	lw	a5,8(sp)
    22a0:	00c79783          	lh	a5,12(a5)
    22a4:	00812703          	lw	a4,8(sp)
    22a8:	06472703          	lw	a4,100(a4)
    22ac:	00177713          	and	a4,a4,1
    22b0:	3c070463          	beqz	a4,2678 <_vfprintf_r+0x8c0>
    22b4:	0407f793          	and	a5,a5,64
    22b8:	18412483          	lw	s1,388(sp)
    22bc:	18012903          	lw	s2,384(sp)
    22c0:	17812a03          	lw	s4,376(sp)
    22c4:	17412a83          	lw	s5,372(sp)
    22c8:	17012b03          	lw	s6,368(sp)
    22cc:	16c12b83          	lw	s7,364(sp)
    22d0:	16812c03          	lw	s8,360(sp)
    22d4:	16412c83          	lw	s9,356(sp)
    22d8:	16012d03          	lw	s10,352(sp)
    22dc:	15c12d83          	lw	s11,348(sp)
    22e0:	00078463          	beqz	a5,22e8 <_vfprintf_r+0x530>
    22e4:	3d00206f          	j	46b4 <_vfprintf_r+0x28fc>
    22e8:	18c12083          	lw	ra,396(sp)
    22ec:	18812403          	lw	s0,392(sp)
    22f0:	00c12503          	lw	a0,12(sp)
    22f4:	17c12983          	lw	s3,380(sp)
    22f8:	19010113          	add	sp,sp,400
    22fc:	00008067          	ret
    2300:	008a7713          	and	a4,s4,8
    2304:	000a0e93          	mv	t4,s4
    2308:	000b0313          	mv	t1,s6
    230c:	00070463          	beqz	a4,2314 <_vfprintf_r+0x55c>
    2310:	0200106f          	j	3330 <_vfprintf_r+0x1578>
    2314:	01412783          	lw	a5,20(sp)
    2318:	00778b13          	add	s6,a5,7
    231c:	ff8b7b13          	and	s6,s6,-8
    2320:	000b2783          	lw	a5,0(s6)
    2324:	02f12423          	sw	a5,40(sp)
    2328:	004b2783          	lw	a5,4(s6)
    232c:	02f12623          	sw	a5,44(sp)
    2330:	008b0793          	add	a5,s6,8
    2334:	00f12a23          	sw	a5,20(sp)
    2338:	02c12a03          	lw	s4,44(sp)
    233c:	7fffe717          	auipc	a4,0x7fffe
    2340:	36470713          	add	a4,a4,868 # 800006a0 <__global_locale+0x16c>
    2344:	00072c83          	lw	s9,0(a4)
    2348:	00472d03          	lw	s10,4(a4)
    234c:	02812b03          	lw	s6,40(sp)
    2350:	001a1493          	sll	s1,s4,0x1
    2354:	0014d493          	srl	s1,s1,0x1
    2358:	000b0513          	mv	a0,s6
    235c:	00048593          	mv	a1,s1
    2360:	000c8613          	mv	a2,s9
    2364:	000d0693          	mv	a3,s10
    2368:	02612223          	sw	t1,36(sp)
    236c:	03c12023          	sw	t3,32(sp)
    2370:	01d12823          	sw	t4,16(sp)
    2374:	1700c0ef          	jal	e4e4 <__unorddf2>
    2378:	01012e83          	lw	t4,16(sp)
    237c:	02012e03          	lw	t3,32(sp)
    2380:	02412303          	lw	t1,36(sp)
    2384:	00050463          	beqz	a0,238c <_vfprintf_r+0x5d4>
    2388:	4080106f          	j	3790 <_vfprintf_r+0x19d8>
    238c:	000b0513          	mv	a0,s6
    2390:	00048593          	mv	a1,s1
    2394:	000c8613          	mv	a2,s9
    2398:	000d0693          	mv	a3,s10
    239c:	7a90a0ef          	jal	d344 <__ledf2>
    23a0:	01012e83          	lw	t4,16(sp)
    23a4:	02012e03          	lw	t3,32(sp)
    23a8:	02412303          	lw	t1,36(sp)
    23ac:	00a04463          	bgtz	a0,23b4 <_vfprintf_r+0x5fc>
    23b0:	3e00106f          	j	3790 <_vfprintf_r+0x19d8>
    23b4:	000b0513          	mv	a0,s6
    23b8:	000a0593          	mv	a1,s4
    23bc:	00000613          	li	a2,0
    23c0:	00000693          	li	a3,0
    23c4:	7810a0ef          	jal	d344 <__ledf2>
    23c8:	01012e83          	lw	t4,16(sp)
    23cc:	02012e03          	lw	t3,32(sp)
    23d0:	00055463          	bgez	a0,23d8 <_vfprintf_r+0x620>
    23d4:	6650106f          	j	4238 <_vfprintf_r+0x2480>
    23d8:	07714603          	lbu	a2,119(sp)
    23dc:	04700713          	li	a4,71
    23e0:	0000dc17          	auipc	s8,0xd
    23e4:	ba0c0c13          	add	s8,s8,-1120 # ef80 <__fini_array_end+0x274>
    23e8:	01c74663          	blt	a4,t3,23f4 <_vfprintf_r+0x63c>
    23ec:	0000dc17          	auipc	s8,0xd
    23f0:	b90c0c13          	add	s8,s8,-1136 # ef7c <__fini_array_end+0x270>
    23f4:	00012823          	sw	zero,16(sp)
    23f8:	02012223          	sw	zero,36(sp)
    23fc:	02012023          	sw	zero,32(sp)
    2400:	f7fefe93          	and	t4,t4,-129
    2404:	00300c93          	li	s9,3
    2408:	00300d13          	li	s10,3
    240c:	00000313          	li	t1,0
    2410:	00000a13          	li	s4,0
    2414:	be0602e3          	beqz	a2,1ff8 <_vfprintf_r+0x240>
    2418:	001c8c93          	add	s9,s9,1
    241c:	bddff06f          	j	1ff8 <_vfprintf_r+0x240>
    2420:	01000593          	li	a1,16
    2424:	0a412603          	lw	a2,164(sp)
    2428:	0000db17          	auipc	s6,0xd
    242c:	05cb0b13          	add	s6,s6,92 # f484 <blanks.1>
    2430:	0ae5dc63          	bge	a1,a4,24e8 <_vfprintf_r+0x730>
    2434:	00040793          	mv	a5,s0
    2438:	00048693          	mv	a3,s1
    243c:	01000893          	li	a7,16
    2440:	000b0493          	mv	s1,s6
    2444:	00700393          	li	t2,7
    2448:	000a0b13          	mv	s6,s4
    244c:	04512223          	sw	t0,68(sp)
    2450:	05f12823          	sw	t6,80(sp)
    2454:	05d12a23          	sw	t4,84(sp)
    2458:	05c12c23          	sw	t3,88(sp)
    245c:	00070413          	mv	s0,a4
    2460:	00030a13          	mv	s4,t1
    2464:	00c0006f          	j	2470 <_vfprintf_r+0x6b8>
    2468:	ff040413          	add	s0,s0,-16
    246c:	0488da63          	bge	a7,s0,24c0 <_vfprintf_r+0x708>
    2470:	01068693          	add	a3,a3,16
    2474:	00160613          	add	a2,a2,1
    2478:	0097a023          	sw	s1,0(a5)
    247c:	0117a223          	sw	a7,4(a5)
    2480:	0ad12423          	sw	a3,168(sp)
    2484:	0ac12223          	sw	a2,164(sp)
    2488:	00878793          	add	a5,a5,8
    248c:	fcc3dee3          	bge	t2,a2,2468 <_vfprintf_r+0x6b0>
    2490:	00812583          	lw	a1,8(sp)
    2494:	0a010613          	add	a2,sp,160
    2498:	00098513          	mv	a0,s3
    249c:	7d8020ef          	jal	4c74 <__sprint_r>
    24a0:	de0514e3          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    24a4:	01000893          	li	a7,16
    24a8:	ff040413          	add	s0,s0,-16
    24ac:	0a812683          	lw	a3,168(sp)
    24b0:	0a412603          	lw	a2,164(sp)
    24b4:	0ac10793          	add	a5,sp,172
    24b8:	00700393          	li	t2,7
    24bc:	fa88cae3          	blt	a7,s0,2470 <_vfprintf_r+0x6b8>
    24c0:	04412283          	lw	t0,68(sp)
    24c4:	05012f83          	lw	t6,80(sp)
    24c8:	05412e83          	lw	t4,84(sp)
    24cc:	05812e03          	lw	t3,88(sp)
    24d0:	000a0313          	mv	t1,s4
    24d4:	00040713          	mv	a4,s0
    24d8:	000b0a13          	mv	s4,s6
    24dc:	00078413          	mv	s0,a5
    24e0:	00048b13          	mv	s6,s1
    24e4:	00068493          	mv	s1,a3
    24e8:	00e484b3          	add	s1,s1,a4
    24ec:	00160613          	add	a2,a2,1
    24f0:	00e42223          	sw	a4,4(s0)
    24f4:	01642023          	sw	s6,0(s0)
    24f8:	0a912423          	sw	s1,168(sp)
    24fc:	0ac12223          	sw	a2,164(sp)
    2500:	00700713          	li	a4,7
    2504:	00c75463          	bge	a4,a2,250c <_vfprintf_r+0x754>
    2508:	2380106f          	j	3740 <_vfprintf_r+0x1988>
    250c:	07714603          	lbu	a2,119(sp)
    2510:	00840413          	add	s0,s0,8
    2514:	b05ff06f          	j	2018 <_vfprintf_r+0x260>
    2518:	00812583          	lw	a1,8(sp)
    251c:	0a010613          	add	a2,sp,160
    2520:	00098513          	mv	a0,s3
    2524:	04612e23          	sw	t1,92(sp)
    2528:	05c12c23          	sw	t3,88(sp)
    252c:	05d12a23          	sw	t4,84(sp)
    2530:	05f12823          	sw	t6,80(sp)
    2534:	04512223          	sw	t0,68(sp)
    2538:	73c020ef          	jal	4c74 <__sprint_r>
    253c:	d40516e3          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2540:	0a812483          	lw	s1,168(sp)
    2544:	05c12303          	lw	t1,92(sp)
    2548:	05812e03          	lw	t3,88(sp)
    254c:	05412e83          	lw	t4,84(sp)
    2550:	05012f83          	lw	t6,80(sp)
    2554:	04412283          	lw	t0,68(sp)
    2558:	0ac10413          	add	s0,sp,172
    255c:	af1ff06f          	j	204c <_vfprintf_r+0x294>
    2560:	0a412d03          	lw	s10,164(sp)
    2564:	01812783          	lw	a5,24(sp)
    2568:	00100693          	li	a3,1
    256c:	01842023          	sw	s8,0(s0)
    2570:	00148493          	add	s1,s1,1
    2574:	001d0d13          	add	s10,s10,1
    2578:	00840b13          	add	s6,s0,8
    257c:	32f6d0e3          	bge	a3,a5,309c <_vfprintf_r+0x12e4>
    2580:	00100693          	li	a3,1
    2584:	00d42223          	sw	a3,4(s0)
    2588:	0a912423          	sw	s1,168(sp)
    258c:	0ba12223          	sw	s10,164(sp)
    2590:	00700693          	li	a3,7
    2594:	01a6d463          	bge	a3,s10,259c <_vfprintf_r+0x7e4>
    2598:	0680106f          	j	3600 <_vfprintf_r+0x1848>
    259c:	03012783          	lw	a5,48(sp)
    25a0:	03412703          	lw	a4,52(sp)
    25a4:	001d0d13          	add	s10,s10,1
    25a8:	00f484b3          	add	s1,s1,a5
    25ac:	00eb2023          	sw	a4,0(s6)
    25b0:	00fb2223          	sw	a5,4(s6)
    25b4:	0a912423          	sw	s1,168(sp)
    25b8:	0ba12223          	sw	s10,164(sp)
    25bc:	00700693          	li	a3,7
    25c0:	008b0b13          	add	s6,s6,8
    25c4:	01a6d463          	bge	a3,s10,25cc <_vfprintf_r+0x814>
    25c8:	0680106f          	j	3630 <_vfprintf_r+0x1878>
    25cc:	02812603          	lw	a2,40(sp)
    25d0:	02c12683          	lw	a3,44(sp)
    25d4:	01812783          	lw	a5,24(sp)
    25d8:	00060513          	mv	a0,a2
    25dc:	00068593          	mv	a1,a3
    25e0:	00000613          	li	a2,0
    25e4:	00000693          	li	a3,0
    25e8:	03d12023          	sw	t4,32(sp)
    25ec:	fff78413          	add	s0,a5,-1
    25f0:	3c90a0ef          	jal	d1b8 <__eqdf2>
    25f4:	02012e83          	lw	t4,32(sp)
    25f8:	2e0506e3          	beqz	a0,30e4 <_vfprintf_r+0x132c>
    25fc:	001c0793          	add	a5,s8,1
    2600:	001d0d13          	add	s10,s10,1
    2604:	008484b3          	add	s1,s1,s0
    2608:	00fb2023          	sw	a5,0(s6)
    260c:	008b2223          	sw	s0,4(s6)
    2610:	0a912423          	sw	s1,168(sp)
    2614:	0ba12223          	sw	s10,164(sp)
    2618:	00700793          	li	a5,7
    261c:	008b0b13          	add	s6,s6,8
    2620:	29a7cce3          	blt	a5,s10,30b8 <_vfprintf_r+0x1300>
    2624:	04012703          	lw	a4,64(sp)
    2628:	08810793          	add	a5,sp,136
    262c:	001d0d13          	add	s10,s10,1
    2630:	009704b3          	add	s1,a4,s1
    2634:	00fb2023          	sw	a5,0(s6)
    2638:	00eb2223          	sw	a4,4(s6)
    263c:	0a912423          	sw	s1,168(sp)
    2640:	0ba12223          	sw	s10,164(sp)
    2644:	00700793          	li	a5,7
    2648:	008b0413          	add	s0,s6,8
    264c:	a7a7dae3          	bge	a5,s10,20c0 <_vfprintf_r+0x308>
    2650:	00812583          	lw	a1,8(sp)
    2654:	0a010613          	add	a2,sp,160
    2658:	00098513          	mv	a0,s3
    265c:	03d12023          	sw	t4,32(sp)
    2660:	614020ef          	jal	4c74 <__sprint_r>
    2664:	c20512e3          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2668:	0a812483          	lw	s1,168(sp)
    266c:	02012e83          	lw	t4,32(sp)
    2670:	0ac10413          	add	s0,sp,172
    2674:	a4dff06f          	j	20c0 <_vfprintf_r+0x308>
    2678:	2007f713          	and	a4,a5,512
    267c:	c2071ce3          	bnez	a4,22b4 <_vfprintf_r+0x4fc>
    2680:	00812403          	lw	s0,8(sp)
    2684:	05842503          	lw	a0,88(s0)
    2688:	fd8fe0ef          	jal	e60 <__retarget_lock_release_recursive>
    268c:	00c41783          	lh	a5,12(s0)
    2690:	c25ff06f          	j	22b4 <_vfprintf_r+0x4fc>
    2694:	00094e03          	lbu	t3,0(s2)
    2698:	020a6a13          	or	s4,s4,32
    269c:	8cdff06f          	j	1f68 <_vfprintf_r+0x1b0>
    26a0:	01412703          	lw	a4,20(sp)
    26a4:	04300793          	li	a5,67
    26a8:	000a0e93          	mv	t4,s4
    26ac:	00470493          	add	s1,a4,4
    26b0:	64fe08e3          	beq	t3,a5,3500 <_vfprintf_r+0x1748>
    26b4:	010a7793          	and	a5,s4,16
    26b8:	640794e3          	bnez	a5,3500 <_vfprintf_r+0x1748>
    26bc:	01412783          	lw	a5,20(sp)
    26c0:	00100c93          	li	s9,1
    26c4:	00100d13          	li	s10,1
    26c8:	0007a783          	lw	a5,0(a5)
    26cc:	0ec10c13          	add	s8,sp,236
    26d0:	0ef10623          	sb	a5,236(sp)
    26d4:	06010ba3          	sb	zero,119(sp)
    26d8:	00912a23          	sw	s1,20(sp)
    26dc:	00000613          	li	a2,0
    26e0:	00012823          	sw	zero,16(sp)
    26e4:	00000313          	li	t1,0
    26e8:	02012223          	sw	zero,36(sp)
    26ec:	02012023          	sw	zero,32(sp)
    26f0:	00000a13          	li	s4,0
    26f4:	905ff06f          	j	1ff8 <_vfprintf_r+0x240>
    26f8:	01412783          	lw	a5,20(sp)
    26fc:	06010ba3          	sb	zero,119(sp)
    2700:	000b0313          	mv	t1,s6
    2704:	0007ac03          	lw	s8,0(a5)
    2708:	000a0e93          	mv	t4,s4
    270c:	00478b13          	add	s6,a5,4
    2710:	5a0c0ce3          	beqz	s8,34c8 <_vfprintf_r+0x1710>
    2714:	05300713          	li	a4,83
    2718:	00ee1463          	bne	t3,a4,2720 <_vfprintf_r+0x968>
    271c:	1d00106f          	j	38ec <_vfprintf_r+0x1b34>
    2720:	010a7a13          	and	s4,s4,16
    2724:	000a0463          	beqz	s4,272c <_vfprintf_r+0x974>
    2728:	1c40106f          	j	38ec <_vfprintf_r+0x1b34>
    272c:	00035463          	bgez	t1,2734 <_vfprintf_r+0x97c>
    2730:	6d40106f          	j	3e04 <_vfprintf_r+0x204c>
    2734:	00030613          	mv	a2,t1
    2738:	00000593          	li	a1,0
    273c:	000c0513          	mv	a0,s8
    2740:	03d12023          	sw	t4,32(sp)
    2744:	00612a23          	sw	t1,20(sp)
    2748:	661040ef          	jal	75a8 <memchr>
    274c:	00a12823          	sw	a0,16(sp)
    2750:	01412303          	lw	t1,20(sp)
    2754:	02012e83          	lw	t4,32(sp)
    2758:	00051463          	bnez	a0,2760 <_vfprintf_r+0x9a8>
    275c:	1780206f          	j	48d4 <_vfprintf_r+0x2b1c>
    2760:	01012783          	lw	a5,16(sp)
    2764:	07714603          	lbu	a2,119(sp)
    2768:	01612a23          	sw	s6,20(sp)
    276c:	41878d33          	sub	s10,a5,s8
    2770:	fffd4813          	not	a6,s10
    2774:	41f85813          	sra	a6,a6,0x1f
    2778:	02012223          	sw	zero,36(sp)
    277c:	02012023          	sw	zero,32(sp)
    2780:	00012823          	sw	zero,16(sp)
    2784:	010d7cb3          	and	s9,s10,a6
    2788:	00000313          	li	t1,0
    278c:	07300e13          	li	t3,115
    2790:	860604e3          	beqz	a2,1ff8 <_vfprintf_r+0x240>
    2794:	c85ff06f          	j	2418 <_vfprintf_r+0x660>
    2798:	01412783          	lw	a5,20(sp)
    279c:	0007ab83          	lw	s7,0(a5)
    27a0:	00478793          	add	a5,a5,4
    27a4:	2a0bdae3          	bgez	s7,3258 <_vfprintf_r+0x14a0>
    27a8:	41700bb3          	neg	s7,s7
    27ac:	00f12a23          	sw	a5,20(sp)
    27b0:	00094e03          	lbu	t3,0(s2)
    27b4:	004a6a13          	or	s4,s4,4
    27b8:	fb0ff06f          	j	1f68 <_vfprintf_r+0x1b0>
    27bc:	02b00793          	li	a5,43
    27c0:	00094e03          	lbu	t3,0(s2)
    27c4:	06f10ba3          	sb	a5,119(sp)
    27c8:	fa0ff06f          	j	1f68 <_vfprintf_r+0x1b0>
    27cc:	000b0313          	mv	t1,s6
    27d0:	010a6613          	or	a2,s4,16
    27d4:	02067793          	and	a5,a2,32
    27d8:	1c0780e3          	beqz	a5,3198 <_vfprintf_r+0x13e0>
    27dc:	01412783          	lw	a5,20(sp)
    27e0:	00778b13          	add	s6,a5,7
    27e4:	ff8b7b13          	and	s6,s6,-8
    27e8:	000b2d03          	lw	s10,0(s6)
    27ec:	004b2c83          	lw	s9,4(s6)
    27f0:	008b0793          	add	a5,s6,8
    27f4:	00f12a23          	sw	a5,20(sp)
    27f8:	00100793          	li	a5,1
    27fc:	00000713          	li	a4,0
    2800:	06e10ba3          	sb	a4,119(sp)
    2804:	34034c63          	bltz	t1,2b5c <_vfprintf_r+0xda4>
    2808:	019d6733          	or	a4,s10,s9
    280c:	f7f67e93          	and	t4,a2,-129
    2810:	34071463          	bnez	a4,2b58 <_vfprintf_r+0xda0>
    2814:	3a031a63          	bnez	t1,2bc8 <_vfprintf_r+0xe10>
    2818:	5c079ee3          	bnez	a5,35f4 <_vfprintf_r+0x183c>
    281c:	00167d13          	and	s10,a2,1
    2820:	15010c13          	add	s8,sp,336
    2824:	2c0d10e3          	bnez	s10,32e4 <_vfprintf_r+0x152c>
    2828:	07714603          	lbu	a2,119(sp)
    282c:	00030c93          	mv	s9,t1
    2830:	01a35463          	bge	t1,s10,2838 <_vfprintf_r+0xa80>
    2834:	000d0c93          	mv	s9,s10
    2838:	00012823          	sw	zero,16(sp)
    283c:	02012223          	sw	zero,36(sp)
    2840:	02012023          	sw	zero,32(sp)
    2844:	00000a13          	li	s4,0
    2848:	fa060863          	beqz	a2,1ff8 <_vfprintf_r+0x240>
    284c:	bcdff06f          	j	2418 <_vfprintf_r+0x660>
    2850:	00094e03          	lbu	t3,0(s2)
    2854:	080a6a13          	or	s4,s4,128
    2858:	f10ff06f          	j	1f68 <_vfprintf_r+0x1b0>
    285c:	00094e03          	lbu	t3,0(s2)
    2860:	02a00793          	li	a5,42
    2864:	00190693          	add	a3,s2,1
    2868:	00fe1463          	bne	t3,a5,2870 <_vfprintf_r+0xab8>
    286c:	1100206f          	j	497c <_vfprintf_r+0x2bc4>
    2870:	fd0e0713          	add	a4,t3,-48
    2874:	00900793          	li	a5,9
    2878:	00000b13          	li	s6,0
    287c:	00900613          	li	a2,9
    2880:	02e7e463          	bltu	a5,a4,28a8 <_vfprintf_r+0xaf0>
    2884:	0006ce03          	lbu	t3,0(a3)
    2888:	002b1793          	sll	a5,s6,0x2
    288c:	016787b3          	add	a5,a5,s6
    2890:	00179793          	sll	a5,a5,0x1
    2894:	00e78b33          	add	s6,a5,a4
    2898:	fd0e0713          	add	a4,t3,-48
    289c:	00168693          	add	a3,a3,1
    28a0:	fee672e3          	bgeu	a2,a4,2884 <_vfprintf_r+0xacc>
    28a4:	320b4ce3          	bltz	s6,33dc <_vfprintf_r+0x1624>
    28a8:	00068913          	mv	s2,a3
    28ac:	ec0ff06f          	j	1f6c <_vfprintf_r+0x1b4>
    28b0:	00094e03          	lbu	t3,0(s2)
    28b4:	001a6a13          	or	s4,s4,1
    28b8:	eb0ff06f          	j	1f68 <_vfprintf_r+0x1b0>
    28bc:	07714783          	lbu	a5,119(sp)
    28c0:	00094e03          	lbu	t3,0(s2)
    28c4:	ea079263          	bnez	a5,1f68 <_vfprintf_r+0x1b0>
    28c8:	02000793          	li	a5,32
    28cc:	06f10ba3          	sb	a5,119(sp)
    28d0:	e98ff06f          	j	1f68 <_vfprintf_r+0x1b0>
    28d4:	00094e03          	lbu	t3,0(s2)
    28d8:	06c00793          	li	a5,108
    28dc:	3afe00e3          	beq	t3,a5,347c <_vfprintf_r+0x16c4>
    28e0:	010a6a13          	or	s4,s4,16
    28e4:	e84ff06f          	j	1f68 <_vfprintf_r+0x1b0>
    28e8:	00094e03          	lbu	t3,0(s2)
    28ec:	008a6a13          	or	s4,s4,8
    28f0:	e78ff06f          	j	1f68 <_vfprintf_r+0x1b0>
    28f4:	000b0313          	mv	t1,s6
    28f8:	010a6e93          	or	t4,s4,16
    28fc:	020ef793          	and	a5,t4,32
    2900:	0c0786e3          	beqz	a5,31cc <_vfprintf_r+0x1414>
    2904:	01412783          	lw	a5,20(sp)
    2908:	00778b13          	add	s6,a5,7
    290c:	ff8b7b13          	and	s6,s6,-8
    2910:	004b2783          	lw	a5,4(s6)
    2914:	000b2d03          	lw	s10,0(s6)
    2918:	008b0713          	add	a4,s6,8
    291c:	00e12a23          	sw	a4,20(sp)
    2920:	00078c93          	mv	s9,a5
    2924:	0c07cee3          	bltz	a5,3200 <_vfprintf_r+0x1448>
    2928:	000e8613          	mv	a2,t4
    292c:	02034263          	bltz	t1,2950 <_vfprintf_r+0xb98>
    2930:	019d67b3          	or	a5,s10,s9
    2934:	f7fef613          	and	a2,t4,-129
    2938:	00079c63          	bnez	a5,2950 <_vfprintf_r+0xb98>
    293c:	02031063          	bnez	t1,295c <_vfprintf_r+0xba4>
    2940:	00000d13          	li	s10,0
    2944:	00060e93          	mv	t4,a2
    2948:	15010c13          	add	s8,sp,336
    294c:	eddff06f          	j	2828 <_vfprintf_r+0xa70>
    2950:	520c90e3          	bnez	s9,3670 <_vfprintf_r+0x18b8>
    2954:	00900793          	li	a5,9
    2958:	51a7ece3          	bltu	a5,s10,3670 <_vfprintf_r+0x18b8>
    295c:	030d0d13          	add	s10,s10,48
    2960:	15a107a3          	sb	s10,335(sp)
    2964:	00060e93          	mv	t4,a2
    2968:	00100d13          	li	s10,1
    296c:	14f10c13          	add	s8,sp,335
    2970:	eb9ff06f          	j	2828 <_vfprintf_r+0xa70>
    2974:	000b0313          	mv	t1,s6
    2978:	010a6e93          	or	t4,s4,16
    297c:	020ef793          	and	a5,t4,32
    2980:	7e078463          	beqz	a5,3168 <_vfprintf_r+0x13b0>
    2984:	01412783          	lw	a5,20(sp)
    2988:	00778b13          	add	s6,a5,7
    298c:	ff8b7b13          	and	s6,s6,-8
    2990:	000b2d03          	lw	s10,0(s6)
    2994:	004b2c83          	lw	s9,4(s6)
    2998:	008b0793          	add	a5,s6,8
    299c:	00f12a23          	sw	a5,20(sp)
    29a0:	bffef613          	and	a2,t4,-1025
    29a4:	00000793          	li	a5,0
    29a8:	e55ff06f          	j	27fc <_vfprintf_r+0xa44>
    29ac:	00094e03          	lbu	t3,0(s2)
    29b0:	06800793          	li	a5,104
    29b4:	2cfe0ce3          	beq	t3,a5,348c <_vfprintf_r+0x16d4>
    29b8:	040a6a13          	or	s4,s4,64
    29bc:	dacff06f          	j	1f68 <_vfprintf_r+0x1b0>
    29c0:	01412703          	lw	a4,20(sp)
    29c4:	000087b7          	lui	a5,0x8
    29c8:	83078793          	add	a5,a5,-2000 # 7830 <_read_r+0x44>
    29cc:	06f11c23          	sh	a5,120(sp)
    29d0:	00470793          	add	a5,a4,4
    29d4:	00f12a23          	sw	a5,20(sp)
    29d8:	0000c797          	auipc	a5,0xc
    29dc:	5b478793          	add	a5,a5,1460 # ef8c <__fini_array_end+0x280>
    29e0:	02f12c23          	sw	a5,56(sp)
    29e4:	00072d03          	lw	s10,0(a4)
    29e8:	000b0313          	mv	t1,s6
    29ec:	00000c93          	li	s9,0
    29f0:	002a6613          	or	a2,s4,2
    29f4:	00200793          	li	a5,2
    29f8:	07800e13          	li	t3,120
    29fc:	e01ff06f          	j	27fc <_vfprintf_r+0xa44>
    2a00:	020a7793          	and	a5,s4,32
    2a04:	180784e3          	beqz	a5,338c <_vfprintf_r+0x15d4>
    2a08:	01412783          	lw	a5,20(sp)
    2a0c:	00c12683          	lw	a3,12(sp)
    2a10:	0007a783          	lw	a5,0(a5)
    2a14:	41f6d713          	sra	a4,a3,0x1f
    2a18:	00d7a023          	sw	a3,0(a5)
    2a1c:	00e7a223          	sw	a4,4(a5)
    2a20:	01412783          	lw	a5,20(sp)
    2a24:	00090c13          	mv	s8,s2
    2a28:	00478793          	add	a5,a5,4
    2a2c:	00f12a23          	sw	a5,20(sp)
    2a30:	cccff06f          	j	1efc <_vfprintf_r+0x144>
    2a34:	06500713          	li	a4,101
    2a38:	b3c754e3          	bge	a4,t3,2560 <_vfprintf_r+0x7a8>
    2a3c:	02812683          	lw	a3,40(sp)
    2a40:	02c12703          	lw	a4,44(sp)
    2a44:	00000613          	li	a2,0
    2a48:	00068513          	mv	a0,a3
    2a4c:	00070593          	mv	a1,a4
    2a50:	00000693          	li	a3,0
    2a54:	05d12223          	sw	t4,68(sp)
    2a58:	7600a0ef          	jal	d1b8 <__eqdf2>
    2a5c:	04412e83          	lw	t4,68(sp)
    2a60:	4e051463          	bnez	a0,2f48 <_vfprintf_r+0x1190>
    2a64:	0a412783          	lw	a5,164(sp)
    2a68:	0000c717          	auipc	a4,0xc
    2a6c:	55470713          	add	a4,a4,1364 # efbc <__fini_array_end+0x2b0>
    2a70:	00e42023          	sw	a4,0(s0)
    2a74:	00148493          	add	s1,s1,1
    2a78:	00100713          	li	a4,1
    2a7c:	00178793          	add	a5,a5,1
    2a80:	00e42223          	sw	a4,4(s0)
    2a84:	0a912423          	sw	s1,168(sp)
    2a88:	0af12223          	sw	a5,164(sp)
    2a8c:	00700713          	li	a4,7
    2a90:	00840413          	add	s0,s0,8
    2a94:	62f746e3          	blt	a4,a5,38c0 <_vfprintf_r+0x1b08>
    2a98:	07c12783          	lw	a5,124(sp)
    2a9c:	01812703          	lw	a4,24(sp)
    2aa0:	78e7de63          	bge	a5,a4,323c <_vfprintf_r+0x1484>
    2aa4:	03412783          	lw	a5,52(sp)
    2aa8:	03012703          	lw	a4,48(sp)
    2aac:	00840413          	add	s0,s0,8
    2ab0:	fef42c23          	sw	a5,-8(s0)
    2ab4:	0a412783          	lw	a5,164(sp)
    2ab8:	00e484b3          	add	s1,s1,a4
    2abc:	fee42e23          	sw	a4,-4(s0)
    2ac0:	00178793          	add	a5,a5,1
    2ac4:	0a912423          	sw	s1,168(sp)
    2ac8:	0af12223          	sw	a5,164(sp)
    2acc:	00700713          	li	a4,7
    2ad0:	1cf746e3          	blt	a4,a5,349c <_vfprintf_r+0x16e4>
    2ad4:	01812783          	lw	a5,24(sp)
    2ad8:	fff78d13          	add	s10,a5,-1
    2adc:	dfa05263          	blez	s10,20c0 <_vfprintf_r+0x308>
    2ae0:	01000713          	li	a4,16
    2ae4:	0a412783          	lw	a5,164(sp)
    2ae8:	0000d297          	auipc	t0,0xd
    2aec:	98c28293          	add	t0,t0,-1652 # f474 <zeroes.0>
    2af0:	77a752e3          	bge	a4,s10,3a54 <_vfprintf_r+0x1c9c>
    2af4:	00048713          	mv	a4,s1
    2af8:	01000c13          	li	s8,16
    2afc:	00700b13          	li	s6,7
    2b00:	000e8493          	mv	s1,t4
    2b04:	00028a13          	mv	s4,t0
    2b08:	00c0006f          	j	2b14 <_vfprintf_r+0xd5c>
    2b0c:	ff0d0d13          	add	s10,s10,-16
    2b10:	73ac5ce3          	bge	s8,s10,3a48 <_vfprintf_r+0x1c90>
    2b14:	01070713          	add	a4,a4,16
    2b18:	00178793          	add	a5,a5,1
    2b1c:	01442023          	sw	s4,0(s0)
    2b20:	01842223          	sw	s8,4(s0)
    2b24:	0ae12423          	sw	a4,168(sp)
    2b28:	0af12223          	sw	a5,164(sp)
    2b2c:	00840413          	add	s0,s0,8
    2b30:	fcfb5ee3          	bge	s6,a5,2b0c <_vfprintf_r+0xd54>
    2b34:	00812583          	lw	a1,8(sp)
    2b38:	0a010613          	add	a2,sp,160
    2b3c:	00098513          	mv	a0,s3
    2b40:	134020ef          	jal	4c74 <__sprint_r>
    2b44:	f4051263          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2b48:	0a812703          	lw	a4,168(sp)
    2b4c:	0a412783          	lw	a5,164(sp)
    2b50:	0ac10413          	add	s0,sp,172
    2b54:	fb9ff06f          	j	2b0c <_vfprintf_r+0xd54>
    2b58:	000e8613          	mv	a2,t4
    2b5c:	00100713          	li	a4,1
    2b60:	dee788e3          	beq	a5,a4,2950 <_vfprintf_r+0xb98>
    2b64:	00200713          	li	a4,2
    2b68:	06e78c63          	beq	a5,a4,2be0 <_vfprintf_r+0xe28>
    2b6c:	15010c13          	add	s8,sp,336
    2b70:	01dc9793          	sll	a5,s9,0x1d
    2b74:	007d7713          	and	a4,s10,7
    2b78:	003d5d13          	srl	s10,s10,0x3
    2b7c:	03070713          	add	a4,a4,48
    2b80:	01a7ed33          	or	s10,a5,s10
    2b84:	003cdc93          	srl	s9,s9,0x3
    2b88:	feec0fa3          	sb	a4,-1(s8)
    2b8c:	019d67b3          	or	a5,s10,s9
    2b90:	000c0593          	mv	a1,s8
    2b94:	fffc0c13          	add	s8,s8,-1
    2b98:	fc079ce3          	bnez	a5,2b70 <_vfprintf_r+0xdb8>
    2b9c:	00167693          	and	a3,a2,1
    2ba0:	06068a63          	beqz	a3,2c14 <_vfprintf_r+0xe5c>
    2ba4:	03000693          	li	a3,48
    2ba8:	06d70663          	beq	a4,a3,2c14 <_vfprintf_r+0xe5c>
    2bac:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x246>
    2bb0:	15010793          	add	a5,sp,336
    2bb4:	fedc0fa3          	sb	a3,-1(s8)
    2bb8:	40b78d33          	sub	s10,a5,a1
    2bbc:	00060e93          	mv	t4,a2
    2bc0:	00058c13          	mv	s8,a1
    2bc4:	c65ff06f          	j	2828 <_vfprintf_r+0xa70>
    2bc8:	00100713          	li	a4,1
    2bcc:	00e79463          	bne	a5,a4,2bd4 <_vfprintf_r+0xe1c>
    2bd0:	2b10106f          	j	4680 <_vfprintf_r+0x28c8>
    2bd4:	00200713          	li	a4,2
    2bd8:	000e8613          	mv	a2,t4
    2bdc:	f8e798e3          	bne	a5,a4,2b6c <_vfprintf_r+0xdb4>
    2be0:	03812683          	lw	a3,56(sp)
    2be4:	15010c13          	add	s8,sp,336
    2be8:	00fd7793          	and	a5,s10,15
    2bec:	00f687b3          	add	a5,a3,a5
    2bf0:	0007c703          	lbu	a4,0(a5)
    2bf4:	004d5d13          	srl	s10,s10,0x4
    2bf8:	01cc9793          	sll	a5,s9,0x1c
    2bfc:	01a7ed33          	or	s10,a5,s10
    2c00:	004cdc93          	srl	s9,s9,0x4
    2c04:	feec0fa3          	sb	a4,-1(s8)
    2c08:	019d67b3          	or	a5,s10,s9
    2c0c:	fffc0c13          	add	s8,s8,-1
    2c10:	fc079ce3          	bnez	a5,2be8 <_vfprintf_r+0xe30>
    2c14:	15010793          	add	a5,sp,336
    2c18:	41878d33          	sub	s10,a5,s8
    2c1c:	00060e93          	mv	t4,a2
    2c20:	c09ff06f          	j	2828 <_vfprintf_r+0xa70>
    2c24:	419b8b33          	sub	s6,s7,s9
    2c28:	c7605063          	blez	s6,2088 <_vfprintf_r+0x2d0>
    2c2c:	01000593          	li	a1,16
    2c30:	0a412603          	lw	a2,164(sp)
    2c34:	0000d297          	auipc	t0,0xd
    2c38:	84028293          	add	t0,t0,-1984 # f474 <zeroes.0>
    2c3c:	0b65d463          	bge	a1,s6,2ce4 <_vfprintf_r+0xf2c>
    2c40:	00040793          	mv	a5,s0
    2c44:	00048713          	mv	a4,s1
    2c48:	000b0413          	mv	s0,s6
    2c4c:	01000893          	li	a7,16
    2c50:	000a0b13          	mv	s6,s4
    2c54:	00700f93          	li	t6,7
    2c58:	05d12223          	sw	t4,68(sp)
    2c5c:	05c12823          	sw	t3,80(sp)
    2c60:	00030a13          	mv	s4,t1
    2c64:	00028493          	mv	s1,t0
    2c68:	00c0006f          	j	2c74 <_vfprintf_r+0xebc>
    2c6c:	ff040413          	add	s0,s0,-16
    2c70:	0488da63          	bge	a7,s0,2cc4 <_vfprintf_r+0xf0c>
    2c74:	01070713          	add	a4,a4,16
    2c78:	00160613          	add	a2,a2,1
    2c7c:	0097a023          	sw	s1,0(a5)
    2c80:	0117a223          	sw	a7,4(a5)
    2c84:	0ae12423          	sw	a4,168(sp)
    2c88:	0ac12223          	sw	a2,164(sp)
    2c8c:	00878793          	add	a5,a5,8
    2c90:	fccfdee3          	bge	t6,a2,2c6c <_vfprintf_r+0xeb4>
    2c94:	00812583          	lw	a1,8(sp)
    2c98:	0a010613          	add	a2,sp,160
    2c9c:	00098513          	mv	a0,s3
    2ca0:	7d5010ef          	jal	4c74 <__sprint_r>
    2ca4:	de051263          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2ca8:	01000893          	li	a7,16
    2cac:	ff040413          	add	s0,s0,-16
    2cb0:	0a812703          	lw	a4,168(sp)
    2cb4:	0a412603          	lw	a2,164(sp)
    2cb8:	0ac10793          	add	a5,sp,172
    2cbc:	00700f93          	li	t6,7
    2cc0:	fa88cae3          	blt	a7,s0,2c74 <_vfprintf_r+0xebc>
    2cc4:	04412e83          	lw	t4,68(sp)
    2cc8:	05012e03          	lw	t3,80(sp)
    2ccc:	000a0313          	mv	t1,s4
    2cd0:	00048293          	mv	t0,s1
    2cd4:	000b0a13          	mv	s4,s6
    2cd8:	00070493          	mv	s1,a4
    2cdc:	00040b13          	mv	s6,s0
    2ce0:	00078413          	mv	s0,a5
    2ce4:	016484b3          	add	s1,s1,s6
    2ce8:	00160613          	add	a2,a2,1
    2cec:	00542023          	sw	t0,0(s0)
    2cf0:	01642223          	sw	s6,4(s0)
    2cf4:	0a912423          	sw	s1,168(sp)
    2cf8:	0ac12223          	sw	a2,164(sp)
    2cfc:	00700713          	li	a4,7
    2d00:	00840413          	add	s0,s0,8
    2d04:	b8c75263          	bge	a4,a2,2088 <_vfprintf_r+0x2d0>
    2d08:	00812583          	lw	a1,8(sp)
    2d0c:	0a010613          	add	a2,sp,160
    2d10:	00098513          	mv	a0,s3
    2d14:	04612a23          	sw	t1,84(sp)
    2d18:	05c12823          	sw	t3,80(sp)
    2d1c:	05d12223          	sw	t4,68(sp)
    2d20:	755010ef          	jal	4c74 <__sprint_r>
    2d24:	d6051263          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2d28:	0a812483          	lw	s1,168(sp)
    2d2c:	05412303          	lw	t1,84(sp)
    2d30:	05012e03          	lw	t3,80(sp)
    2d34:	04412e83          	lw	t4,68(sp)
    2d38:	0ac10413          	add	s0,sp,172
    2d3c:	b4cff06f          	j	2088 <_vfprintf_r+0x2d0>
    2d40:	01000713          	li	a4,16
    2d44:	0a412603          	lw	a2,164(sp)
    2d48:	0000c297          	auipc	t0,0xc
    2d4c:	72c28293          	add	t0,t0,1836 # f474 <zeroes.0>
    2d50:	0b675063          	bge	a4,s6,2df0 <_vfprintf_r+0x1038>
    2d54:	00040793          	mv	a5,s0
    2d58:	00048693          	mv	a3,s1
    2d5c:	000b0413          	mv	s0,s6
    2d60:	01000713          	li	a4,16
    2d64:	00700893          	li	a7,7
    2d68:	05d12223          	sw	t4,68(sp)
    2d6c:	000e0493          	mv	s1,t3
    2d70:	00028b13          	mv	s6,t0
    2d74:	00c0006f          	j	2d80 <_vfprintf_r+0xfc8>
    2d78:	ff040413          	add	s0,s0,-16
    2d7c:	04875e63          	bge	a4,s0,2dd8 <_vfprintf_r+0x1020>
    2d80:	01068693          	add	a3,a3,16
    2d84:	00160613          	add	a2,a2,1
    2d88:	0000c597          	auipc	a1,0xc
    2d8c:	6ec58593          	add	a1,a1,1772 # f474 <zeroes.0>
    2d90:	00b7a023          	sw	a1,0(a5)
    2d94:	00e7a223          	sw	a4,4(a5)
    2d98:	0ad12423          	sw	a3,168(sp)
    2d9c:	0ac12223          	sw	a2,164(sp)
    2da0:	00878793          	add	a5,a5,8
    2da4:	fcc8dae3          	bge	a7,a2,2d78 <_vfprintf_r+0xfc0>
    2da8:	00812583          	lw	a1,8(sp)
    2dac:	0a010613          	add	a2,sp,160
    2db0:	00098513          	mv	a0,s3
    2db4:	6c1010ef          	jal	4c74 <__sprint_r>
    2db8:	cc051863          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2dbc:	01000713          	li	a4,16
    2dc0:	ff040413          	add	s0,s0,-16
    2dc4:	0a812683          	lw	a3,168(sp)
    2dc8:	0a412603          	lw	a2,164(sp)
    2dcc:	0ac10793          	add	a5,sp,172
    2dd0:	00700893          	li	a7,7
    2dd4:	fa8746e3          	blt	a4,s0,2d80 <_vfprintf_r+0xfc8>
    2dd8:	04412e83          	lw	t4,68(sp)
    2ddc:	00048e13          	mv	t3,s1
    2de0:	000b0293          	mv	t0,s6
    2de4:	00068493          	mv	s1,a3
    2de8:	00040b13          	mv	s6,s0
    2dec:	00078413          	mv	s0,a5
    2df0:	016484b3          	add	s1,s1,s6
    2df4:	00160613          	add	a2,a2,1
    2df8:	00542023          	sw	t0,0(s0)
    2dfc:	01642223          	sw	s6,4(s0)
    2e00:	0a912423          	sw	s1,168(sp)
    2e04:	0ac12223          	sw	a2,164(sp)
    2e08:	00700713          	li	a4,7
    2e0c:	00840413          	add	s0,s0,8
    2e10:	a8c75063          	bge	a4,a2,2090 <_vfprintf_r+0x2d8>
    2e14:	00812583          	lw	a1,8(sp)
    2e18:	0a010613          	add	a2,sp,160
    2e1c:	00098513          	mv	a0,s3
    2e20:	05c12823          	sw	t3,80(sp)
    2e24:	05d12223          	sw	t4,68(sp)
    2e28:	64d010ef          	jal	4c74 <__sprint_r>
    2e2c:	c4051e63          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2e30:	0a812483          	lw	s1,168(sp)
    2e34:	05012e03          	lw	t3,80(sp)
    2e38:	04412e83          	lw	t4,68(sp)
    2e3c:	0ac10413          	add	s0,sp,172
    2e40:	a50ff06f          	j	2090 <_vfprintf_r+0x2d8>
    2e44:	00812583          	lw	a1,8(sp)
    2e48:	0a010613          	add	a2,sp,160
    2e4c:	00098513          	mv	a0,s3
    2e50:	04612c23          	sw	t1,88(sp)
    2e54:	05c12a23          	sw	t3,84(sp)
    2e58:	05d12823          	sw	t4,80(sp)
    2e5c:	05f12223          	sw	t6,68(sp)
    2e60:	615010ef          	jal	4c74 <__sprint_r>
    2e64:	c2051263          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2e68:	0a812483          	lw	s1,168(sp)
    2e6c:	05812303          	lw	t1,88(sp)
    2e70:	05412e03          	lw	t3,84(sp)
    2e74:	05012e83          	lw	t4,80(sp)
    2e78:	04412f83          	lw	t6,68(sp)
    2e7c:	0ac10413          	add	s0,sp,172
    2e80:	a00ff06f          	j	2080 <_vfprintf_r+0x2c8>
    2e84:	01000713          	li	a4,16
    2e88:	0a412783          	lw	a5,164(sp)
    2e8c:	0000cb17          	auipc	s6,0xc
    2e90:	5f8b0b13          	add	s6,s6,1528 # f484 <blanks.1>
    2e94:	07a75c63          	bge	a4,s10,2f0c <_vfprintf_r+0x1154>
    2e98:	000b0713          	mv	a4,s6
    2e9c:	01000c13          	li	s8,16
    2ea0:	00090b13          	mv	s6,s2
    2ea4:	00700a13          	li	s4,7
    2ea8:	00070913          	mv	s2,a4
    2eac:	00c0006f          	j	2eb8 <_vfprintf_r+0x1100>
    2eb0:	ff0d0d13          	add	s10,s10,-16
    2eb4:	05ac5663          	bge	s8,s10,2f00 <_vfprintf_r+0x1148>
    2eb8:	01048493          	add	s1,s1,16
    2ebc:	00178793          	add	a5,a5,1
    2ec0:	01242023          	sw	s2,0(s0)
    2ec4:	01842223          	sw	s8,4(s0)
    2ec8:	0a912423          	sw	s1,168(sp)
    2ecc:	0af12223          	sw	a5,164(sp)
    2ed0:	00840413          	add	s0,s0,8
    2ed4:	fcfa5ee3          	bge	s4,a5,2eb0 <_vfprintf_r+0x10f8>
    2ed8:	00812583          	lw	a1,8(sp)
    2edc:	0a010613          	add	a2,sp,160
    2ee0:	00098513          	mv	a0,s3
    2ee4:	591010ef          	jal	4c74 <__sprint_r>
    2ee8:	ba051063          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2eec:	ff0d0d13          	add	s10,s10,-16
    2ef0:	0a812483          	lw	s1,168(sp)
    2ef4:	0a412783          	lw	a5,164(sp)
    2ef8:	0ac10413          	add	s0,sp,172
    2efc:	fbac4ee3          	blt	s8,s10,2eb8 <_vfprintf_r+0x1100>
    2f00:	00090713          	mv	a4,s2
    2f04:	000b0913          	mv	s2,s6
    2f08:	00070b13          	mv	s6,a4
    2f0c:	01a484b3          	add	s1,s1,s10
    2f10:	00178793          	add	a5,a5,1
    2f14:	01642023          	sw	s6,0(s0)
    2f18:	01a42223          	sw	s10,4(s0)
    2f1c:	0a912423          	sw	s1,168(sp)
    2f20:	0af12223          	sw	a5,164(sp)
    2f24:	00700713          	li	a4,7
    2f28:	9af75463          	bge	a4,a5,20d0 <_vfprintf_r+0x318>
    2f2c:	00812583          	lw	a1,8(sp)
    2f30:	0a010613          	add	a2,sp,160
    2f34:	00098513          	mv	a0,s3
    2f38:	53d010ef          	jal	4c74 <__sprint_r>
    2f3c:	b4051663          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    2f40:	0a812483          	lw	s1,168(sp)
    2f44:	98cff06f          	j	20d0 <_vfprintf_r+0x318>
    2f48:	07c12683          	lw	a3,124(sp)
    2f4c:	30d05c63          	blez	a3,3264 <_vfprintf_r+0x14ac>
    2f50:	01812783          	lw	a5,24(sp)
    2f54:	000a0b13          	mv	s6,s4
    2f58:	0147d463          	bge	a5,s4,2f60 <_vfprintf_r+0x11a8>
    2f5c:	00078b13          	mv	s6,a5
    2f60:	03605863          	blez	s6,2f90 <_vfprintf_r+0x11d8>
    2f64:	0a412683          	lw	a3,164(sp)
    2f68:	016484b3          	add	s1,s1,s6
    2f6c:	01842023          	sw	s8,0(s0)
    2f70:	00168693          	add	a3,a3,1
    2f74:	01642223          	sw	s6,4(s0)
    2f78:	0a912423          	sw	s1,168(sp)
    2f7c:	0ad12223          	sw	a3,164(sp)
    2f80:	00700613          	li	a2,7
    2f84:	00840413          	add	s0,s0,8
    2f88:	00d65463          	bge	a2,a3,2f90 <_vfprintf_r+0x11d8>
    2f8c:	5c40106f          	j	4550 <_vfprintf_r+0x2798>
    2f90:	fffb4693          	not	a3,s6
    2f94:	41f6d693          	sra	a3,a3,0x1f
    2f98:	00db7733          	and	a4,s6,a3
    2f9c:	40ea0b33          	sub	s6,s4,a4
    2fa0:	35604ae3          	bgtz	s6,3af4 <_vfprintf_r+0x1d3c>
    2fa4:	400ef713          	and	a4,t4,1024
    2fa8:	014c0333          	add	t1,s8,s4
    2fac:	00070463          	beqz	a4,2fb4 <_vfprintf_r+0x11fc>
    2fb0:	2980106f          	j	4248 <_vfprintf_r+0x2490>
    2fb4:	07c12d03          	lw	s10,124(sp)
    2fb8:	01812783          	lw	a5,24(sp)
    2fbc:	5afd4063          	blt	s10,a5,355c <_vfprintf_r+0x17a4>
    2fc0:	001ef713          	and	a4,t4,1
    2fc4:	58071c63          	bnez	a4,355c <_vfprintf_r+0x17a4>
    2fc8:	01812703          	lw	a4,24(sp)
    2fcc:	00ec07b3          	add	a5,s8,a4
    2fd0:	41a70d33          	sub	s10,a4,s10
    2fd4:	40678b33          	sub	s6,a5,t1
    2fd8:	016d5463          	bge	s10,s6,2fe0 <_vfprintf_r+0x1228>
    2fdc:	000d0b13          	mv	s6,s10
    2fe0:	03605863          	blez	s6,3010 <_vfprintf_r+0x1258>
    2fe4:	0a412703          	lw	a4,164(sp)
    2fe8:	016484b3          	add	s1,s1,s6
    2fec:	00642023          	sw	t1,0(s0)
    2ff0:	00170713          	add	a4,a4,1
    2ff4:	01642223          	sw	s6,4(s0)
    2ff8:	0a912423          	sw	s1,168(sp)
    2ffc:	0ae12223          	sw	a4,164(sp)
    3000:	00700693          	li	a3,7
    3004:	00840413          	add	s0,s0,8
    3008:	00e6d463          	bge	a3,a4,3010 <_vfprintf_r+0x1258>
    300c:	5880106f          	j	4594 <_vfprintf_r+0x27dc>
    3010:	fffb4713          	not	a4,s6
    3014:	41f75713          	sra	a4,a4,0x1f
    3018:	00eb77b3          	and	a5,s6,a4
    301c:	40fd0d33          	sub	s10,s10,a5
    3020:	8ba05063          	blez	s10,20c0 <_vfprintf_r+0x308>
    3024:	01000713          	li	a4,16
    3028:	0a412783          	lw	a5,164(sp)
    302c:	0000c297          	auipc	t0,0xc
    3030:	44828293          	add	t0,t0,1096 # f474 <zeroes.0>
    3034:	23a750e3          	bge	a4,s10,3a54 <_vfprintf_r+0x1c9c>
    3038:	00048713          	mv	a4,s1
    303c:	01000c13          	li	s8,16
    3040:	00700b13          	li	s6,7
    3044:	000e8493          	mv	s1,t4
    3048:	00028a13          	mv	s4,t0
    304c:	00c0006f          	j	3058 <_vfprintf_r+0x12a0>
    3050:	ff0d0d13          	add	s10,s10,-16
    3054:	1fac5ae3          	bge	s8,s10,3a48 <_vfprintf_r+0x1c90>
    3058:	01070713          	add	a4,a4,16
    305c:	00178793          	add	a5,a5,1
    3060:	01442023          	sw	s4,0(s0)
    3064:	01842223          	sw	s8,4(s0)
    3068:	0ae12423          	sw	a4,168(sp)
    306c:	0af12223          	sw	a5,164(sp)
    3070:	00840413          	add	s0,s0,8
    3074:	fcfb5ee3          	bge	s6,a5,3050 <_vfprintf_r+0x1298>
    3078:	00812583          	lw	a1,8(sp)
    307c:	0a010613          	add	a2,sp,160
    3080:	00098513          	mv	a0,s3
    3084:	3f1010ef          	jal	4c74 <__sprint_r>
    3088:	a0051063          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    308c:	0a812703          	lw	a4,168(sp)
    3090:	0a412783          	lw	a5,164(sp)
    3094:	0ac10413          	add	s0,sp,172
    3098:	fb9ff06f          	j	3050 <_vfprintf_r+0x1298>
    309c:	001ef613          	and	a2,t4,1
    30a0:	ce061063          	bnez	a2,2580 <_vfprintf_r+0x7c8>
    30a4:	00d42223          	sw	a3,4(s0)
    30a8:	0a912423          	sw	s1,168(sp)
    30ac:	0ba12223          	sw	s10,164(sp)
    30b0:	00700793          	li	a5,7
    30b4:	d7a7d863          	bge	a5,s10,2624 <_vfprintf_r+0x86c>
    30b8:	00812583          	lw	a1,8(sp)
    30bc:	0a010613          	add	a2,sp,160
    30c0:	00098513          	mv	a0,s3
    30c4:	03d12023          	sw	t4,32(sp)
    30c8:	3ad010ef          	jal	4c74 <__sprint_r>
    30cc:	9a051e63          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    30d0:	0a812483          	lw	s1,168(sp)
    30d4:	0a412d03          	lw	s10,164(sp)
    30d8:	02012e83          	lw	t4,32(sp)
    30dc:	0ac10b13          	add	s6,sp,172
    30e0:	d44ff06f          	j	2624 <_vfprintf_r+0x86c>
    30e4:	01812703          	lw	a4,24(sp)
    30e8:	00100793          	li	a5,1
    30ec:	d2e7dc63          	bge	a5,a4,2624 <_vfprintf_r+0x86c>
    30f0:	01100793          	li	a5,17
    30f4:	0000c297          	auipc	t0,0xc
    30f8:	38028293          	add	t0,t0,896 # f474 <zeroes.0>
    30fc:	18e7d4e3          	bge	a5,a4,3a84 <_vfprintf_r+0x1ccc>
    3100:	00040a13          	mv	s4,s0
    3104:	01000793          	li	a5,16
    3108:	00700c13          	li	s8,7
    310c:	03d12023          	sw	t4,32(sp)
    3110:	00028413          	mv	s0,t0
    3114:	00c0006f          	j	3120 <_vfprintf_r+0x1368>
    3118:	ff0a0a13          	add	s4,s4,-16
    311c:	1547dee3          	bge	a5,s4,3a78 <_vfprintf_r+0x1cc0>
    3120:	01048493          	add	s1,s1,16
    3124:	001d0d13          	add	s10,s10,1
    3128:	008b2023          	sw	s0,0(s6)
    312c:	00fb2223          	sw	a5,4(s6)
    3130:	0a912423          	sw	s1,168(sp)
    3134:	0ba12223          	sw	s10,164(sp)
    3138:	008b0b13          	add	s6,s6,8
    313c:	fdac5ee3          	bge	s8,s10,3118 <_vfprintf_r+0x1360>
    3140:	00812583          	lw	a1,8(sp)
    3144:	0a010613          	add	a2,sp,160
    3148:	00098513          	mv	a0,s3
    314c:	329010ef          	jal	4c74 <__sprint_r>
    3150:	92051c63          	bnez	a0,2288 <_vfprintf_r+0x4d0>
    3154:	0a812483          	lw	s1,168(sp)
    3158:	0a412d03          	lw	s10,164(sp)
    315c:	0ac10b13          	add	s6,sp,172
    3160:	01000793          	li	a5,16
    3164:	fb5ff06f          	j	3118 <_vfprintf_r+0x1360>
    3168:	01412703          	lw	a4,20(sp)
    316c:	010ef793          	and	a5,t4,16
    3170:	00072d03          	lw	s10,0(a4)
    3174:	00470713          	add	a4,a4,4
    3178:	00e12a23          	sw	a4,20(sp)
    317c:	1a079663          	bnez	a5,3328 <_vfprintf_r+0x1570>
    3180:	040ef793          	and	a5,t4,64
    3184:	18078e63          	beqz	a5,3320 <_vfprintf_r+0x1568>
    3188:	010d1d13          	sll	s10,s10,0x10
    318c:	010d5d13          	srl	s10,s10,0x10
    3190:	00000c93          	li	s9,0
    3194:	80dff06f          	j	29a0 <_vfprintf_r+0xbe8>
    3198:	01412703          	lw	a4,20(sp)
    319c:	01067793          	and	a5,a2,16
    31a0:	00072d03          	lw	s10,0(a4)
    31a4:	00470713          	add	a4,a4,4
    31a8:	00e12a23          	sw	a4,20(sp)
    31ac:	14079a63          	bnez	a5,3300 <_vfprintf_r+0x1548>
    31b0:	04067793          	and	a5,a2,64
    31b4:	14078063          	beqz	a5,32f4 <_vfprintf_r+0x153c>
    31b8:	010d1d13          	sll	s10,s10,0x10
    31bc:	010d5d13          	srl	s10,s10,0x10
    31c0:	00000c93          	li	s9,0
    31c4:	00100793          	li	a5,1
    31c8:	e34ff06f          	j	27fc <_vfprintf_r+0xa44>
    31cc:	01412703          	lw	a4,20(sp)
    31d0:	010ef793          	and	a5,t4,16
    31d4:	00072d03          	lw	s10,0(a4)
    31d8:	00470713          	add	a4,a4,4
    31dc:	00e12a23          	sw	a4,20(sp)
    31e0:	12079a63          	bnez	a5,3314 <_vfprintf_r+0x155c>
    31e4:	040ef793          	and	a5,t4,64
    31e8:	12078263          	beqz	a5,330c <_vfprintf_r+0x1554>
    31ec:	010d1d13          	sll	s10,s10,0x10
    31f0:	410d5d13          	sra	s10,s10,0x10
    31f4:	41fd5c93          	sra	s9,s10,0x1f
    31f8:	000c8793          	mv	a5,s9
    31fc:	f207d663          	bgez	a5,2928 <_vfprintf_r+0xb70>
    3200:	01a037b3          	snez	a5,s10
    3204:	419000b3          	neg	ra,s9
    3208:	40f08cb3          	sub	s9,ra,a5
    320c:	41a00d33          	neg	s10,s10
    3210:	000e8613          	mv	a2,t4
    3214:	02d00713          	li	a4,45
    3218:	00100793          	li	a5,1
    321c:	de4ff06f          	j	2800 <_vfprintf_r+0xa48>
    3220:	00812403          	lw	s0,8(sp)
    3224:	00f12623          	sw	a5,12(sp)
    3228:	05842503          	lw	a0,88(s0)
    322c:	c31fd0ef          	jal	e5c <__retarget_lock_acquire_recursive>
    3230:	00c41703          	lh	a4,12(s0)
    3234:	00c12783          	lw	a5,12(sp)
    3238:	c01fe06f          	j	1e38 <_vfprintf_r+0x80>
    323c:	001ef793          	and	a5,t4,1
    3240:	00079463          	bnez	a5,3248 <_vfprintf_r+0x1490>
    3244:	e7dfe06f          	j	20c0 <_vfprintf_r+0x308>
    3248:	85dff06f          	j	2aa4 <_vfprintf_r+0xcec>
    324c:	000a0e93          	mv	t4,s4
    3250:	000b0313          	mv	t1,s6
    3254:	ea8ff06f          	j	28fc <_vfprintf_r+0xb44>
    3258:	00094e03          	lbu	t3,0(s2)
    325c:	00f12a23          	sw	a5,20(sp)
    3260:	d09fe06f          	j	1f68 <_vfprintf_r+0x1b0>
    3264:	0a412703          	lw	a4,164(sp)
    3268:	0000c617          	auipc	a2,0xc
    326c:	d5460613          	add	a2,a2,-684 # efbc <__fini_array_end+0x2b0>
    3270:	00c42023          	sw	a2,0(s0)
    3274:	00148493          	add	s1,s1,1
    3278:	00100613          	li	a2,1
    327c:	00170713          	add	a4,a4,1
    3280:	00c42223          	sw	a2,4(s0)
    3284:	0a912423          	sw	s1,168(sp)
    3288:	0ae12223          	sw	a4,164(sp)
    328c:	00700613          	li	a2,7
    3290:	00840413          	add	s0,s0,8
    3294:	2ee64ce3          	blt	a2,a4,3d8c <_vfprintf_r+0x1fd4>
    3298:	7e069e63          	bnez	a3,3a94 <_vfprintf_r+0x1cdc>
    329c:	01812783          	lw	a5,24(sp)
    32a0:	001ef713          	and	a4,t4,1
    32a4:	00f76733          	or	a4,a4,a5
    32a8:	00071463          	bnez	a4,32b0 <_vfprintf_r+0x14f8>
    32ac:	e15fe06f          	j	20c0 <_vfprintf_r+0x308>
    32b0:	03412703          	lw	a4,52(sp)
    32b4:	03012783          	lw	a5,48(sp)
    32b8:	00700693          	li	a3,7
    32bc:	00e42023          	sw	a4,0(s0)
    32c0:	0a412703          	lw	a4,164(sp)
    32c4:	009784b3          	add	s1,a5,s1
    32c8:	00f42223          	sw	a5,4(s0)
    32cc:	00170713          	add	a4,a4,1
    32d0:	0a912423          	sw	s1,168(sp)
    32d4:	0ae12223          	sw	a4,164(sp)
    32d8:	38e6c8e3          	blt	a3,a4,3e68 <_vfprintf_r+0x20b0>
    32dc:	00840413          	add	s0,s0,8
    32e0:	7e80006f          	j	3ac8 <_vfprintf_r+0x1d10>
    32e4:	03000793          	li	a5,48
    32e8:	14f107a3          	sb	a5,335(sp)
    32ec:	14f10c13          	add	s8,sp,335
    32f0:	d38ff06f          	j	2828 <_vfprintf_r+0xa70>
    32f4:	20067793          	and	a5,a2,512
    32f8:	00078463          	beqz	a5,3300 <_vfprintf_r+0x1548>
    32fc:	0ffd7d13          	zext.b	s10,s10
    3300:	00000c93          	li	s9,0
    3304:	00100793          	li	a5,1
    3308:	cf4ff06f          	j	27fc <_vfprintf_r+0xa44>
    330c:	200ef793          	and	a5,t4,512
    3310:	2c0796e3          	bnez	a5,3ddc <_vfprintf_r+0x2024>
    3314:	41fd5c93          	sra	s9,s10,0x1f
    3318:	000c8793          	mv	a5,s9
    331c:	e08ff06f          	j	2924 <_vfprintf_r+0xb6c>
    3320:	200ef793          	and	a5,t4,512
    3324:	2a0790e3          	bnez	a5,3dc4 <_vfprintf_r+0x200c>
    3328:	00000c93          	li	s9,0
    332c:	e74ff06f          	j	29a0 <_vfprintf_r+0xbe8>
    3330:	01412783          	lw	a5,20(sp)
    3334:	06010513          	add	a0,sp,96
    3338:	03612223          	sw	s6,36(sp)
    333c:	0007a703          	lw	a4,0(a5)
    3340:	03c12023          	sw	t3,32(sp)
    3344:	00478b13          	add	s6,a5,4
    3348:	00072683          	lw	a3,0(a4)
    334c:	01412823          	sw	s4,16(sp)
    3350:	06d12023          	sw	a3,96(sp)
    3354:	00472683          	lw	a3,4(a4)
    3358:	06d12223          	sw	a3,100(sp)
    335c:	00872683          	lw	a3,8(a4)
    3360:	06d12423          	sw	a3,104(sp)
    3364:	00c72703          	lw	a4,12(a4)
    3368:	06e12623          	sw	a4,108(sp)
    336c:	3cc0b0ef          	jal	e738 <__trunctfdf2>
    3370:	02012e03          	lw	t3,32(sp)
    3374:	02412303          	lw	t1,36(sp)
    3378:	02a12423          	sw	a0,40(sp)
    337c:	02b12623          	sw	a1,44(sp)
    3380:	01612a23          	sw	s6,20(sp)
    3384:	000a0e93          	mv	t4,s4
    3388:	fb1fe06f          	j	2338 <_vfprintf_r+0x580>
    338c:	010a7793          	and	a5,s4,16
    3390:	6c079a63          	bnez	a5,3a64 <_vfprintf_r+0x1cac>
    3394:	040a7793          	and	a5,s4,64
    3398:	24079ce3          	bnez	a5,3df0 <_vfprintf_r+0x2038>
    339c:	200a7f13          	and	t5,s4,512
    33a0:	6c0f0263          	beqz	t5,3a64 <_vfprintf_r+0x1cac>
    33a4:	01412783          	lw	a5,20(sp)
    33a8:	00c12703          	lw	a4,12(sp)
    33ac:	0007a783          	lw	a5,0(a5)
    33b0:	00e78023          	sb	a4,0(a5)
    33b4:	e6cff06f          	j	2a20 <_vfprintf_r+0xc68>
    33b8:	03c12783          	lw	a5,60(sp)
    33bc:	00094e03          	lbu	t3,0(s2)
    33c0:	00079463          	bnez	a5,33c8 <_vfprintf_r+0x1610>
    33c4:	ba5fe06f          	j	1f68 <_vfprintf_r+0x1b0>
    33c8:	0007c783          	lbu	a5,0(a5)
    33cc:	00079463          	bnez	a5,33d4 <_vfprintf_r+0x161c>
    33d0:	b99fe06f          	j	1f68 <_vfprintf_r+0x1b0>
    33d4:	400a6a13          	or	s4,s4,1024
    33d8:	b91fe06f          	j	1f68 <_vfprintf_r+0x1b0>
    33dc:	fff00b13          	li	s6,-1
    33e0:	00068913          	mv	s2,a3
    33e4:	b89fe06f          	j	1f6c <_vfprintf_r+0x1b4>
    33e8:	0000c797          	auipc	a5,0xc
    33ec:	bb878793          	add	a5,a5,-1096 # efa0 <__fini_array_end+0x294>
    33f0:	000a0e93          	mv	t4,s4
    33f4:	000b0313          	mv	t1,s6
    33f8:	02f12c23          	sw	a5,56(sp)
    33fc:	020ef793          	and	a5,t4,32
    3400:	1c078263          	beqz	a5,35c4 <_vfprintf_r+0x180c>
    3404:	01412783          	lw	a5,20(sp)
    3408:	00778b13          	add	s6,a5,7
    340c:	ff8b7b13          	and	s6,s6,-8
    3410:	000b2d03          	lw	s10,0(s6)
    3414:	004b2c83          	lw	s9,4(s6)
    3418:	008b0793          	add	a5,s6,8
    341c:	00f12a23          	sw	a5,20(sp)
    3420:	001ef793          	and	a5,t4,1
    3424:	00078e63          	beqz	a5,3440 <_vfprintf_r+0x1688>
    3428:	019d67b3          	or	a5,s10,s9
    342c:	00078a63          	beqz	a5,3440 <_vfprintf_r+0x1688>
    3430:	03000793          	li	a5,48
    3434:	06f10c23          	sb	a5,120(sp)
    3438:	07c10ca3          	sb	t3,121(sp)
    343c:	002eee93          	or	t4,t4,2
    3440:	bffef613          	and	a2,t4,-1025
    3444:	00200793          	li	a5,2
    3448:	bb4ff06f          	j	27fc <_vfprintf_r+0xa44>
    344c:	000b0313          	mv	t1,s6
    3450:	000a0613          	mv	a2,s4
    3454:	b80ff06f          	j	27d4 <_vfprintf_r+0xa1c>
    3458:	000a0e93          	mv	t4,s4
    345c:	000b0313          	mv	t1,s6
    3460:	d1cff06f          	j	297c <_vfprintf_r+0xbc4>
    3464:	0000c797          	auipc	a5,0xc
    3468:	b2878793          	add	a5,a5,-1240 # ef8c <__fini_array_end+0x280>
    346c:	000a0e93          	mv	t4,s4
    3470:	000b0313          	mv	t1,s6
    3474:	02f12c23          	sw	a5,56(sp)
    3478:	f85ff06f          	j	33fc <_vfprintf_r+0x1644>
    347c:	00194e03          	lbu	t3,1(s2)
    3480:	020a6a13          	or	s4,s4,32
    3484:	00190913          	add	s2,s2,1
    3488:	ae1fe06f          	j	1f68 <_vfprintf_r+0x1b0>
    348c:	00194e03          	lbu	t3,1(s2)
    3490:	200a6a13          	or	s4,s4,512
    3494:	00190913          	add	s2,s2,1
    3498:	ad1fe06f          	j	1f68 <_vfprintf_r+0x1b0>
    349c:	00812583          	lw	a1,8(sp)
    34a0:	0a010613          	add	a2,sp,160
    34a4:	00098513          	mv	a0,s3
    34a8:	03d12023          	sw	t4,32(sp)
    34ac:	7c8010ef          	jal	4c74 <__sprint_r>
    34b0:	00050463          	beqz	a0,34b8 <_vfprintf_r+0x1700>
    34b4:	dd5fe06f          	j	2288 <_vfprintf_r+0x4d0>
    34b8:	0a812483          	lw	s1,168(sp)
    34bc:	02012e83          	lw	t4,32(sp)
    34c0:	0ac10413          	add	s0,sp,172
    34c4:	e10ff06f          	j	2ad4 <_vfprintf_r+0xd1c>
    34c8:	00600793          	li	a5,6
    34cc:	00030c93          	mv	s9,t1
    34d0:	0e67e6e3          	bltu	a5,t1,3dbc <_vfprintf_r+0x2004>
    34d4:	01612a23          	sw	s6,20(sp)
    34d8:	00012823          	sw	zero,16(sp)
    34dc:	000c8d13          	mv	s10,s9
    34e0:	00000613          	li	a2,0
    34e4:	00000313          	li	t1,0
    34e8:	02012223          	sw	zero,36(sp)
    34ec:	02012023          	sw	zero,32(sp)
    34f0:	00000a13          	li	s4,0
    34f4:	0000cc17          	auipc	s8,0xc
    34f8:	ac0c0c13          	add	s8,s8,-1344 # efb4 <__fini_array_end+0x2a8>
    34fc:	afdfe06f          	j	1ff8 <_vfprintf_r+0x240>
    3500:	00800613          	li	a2,8
    3504:	00000593          	li	a1,0
    3508:	09810513          	add	a0,sp,152
    350c:	03c12023          	sw	t3,32(sp)
    3510:	01d12823          	sw	t4,16(sp)
    3514:	951fd0ef          	jal	e64 <memset>
    3518:	01412783          	lw	a5,20(sp)
    351c:	0ec10c13          	add	s8,sp,236
    3520:	09810693          	add	a3,sp,152
    3524:	0007a603          	lw	a2,0(a5)
    3528:	000c0593          	mv	a1,s8
    352c:	00098513          	mv	a0,s3
    3530:	2a4070ef          	jal	a7d4 <_wcrtomb_r>
    3534:	fff00793          	li	a5,-1
    3538:	01012e83          	lw	t4,16(sp)
    353c:	02012e03          	lw	t3,32(sp)
    3540:	00050d13          	mv	s10,a0
    3544:	00f51463          	bne	a0,a5,354c <_vfprintf_r+0x1794>
    3548:	4980106f          	j	49e0 <_vfprintf_r+0x2c28>
    354c:	fff54813          	not	a6,a0
    3550:	41f85813          	sra	a6,a6,0x1f
    3554:	01057cb3          	and	s9,a0,a6
    3558:	97cff06f          	j	26d4 <_vfprintf_r+0x91c>
    355c:	03412703          	lw	a4,52(sp)
    3560:	03012783          	lw	a5,48(sp)
    3564:	00700693          	li	a3,7
    3568:	00e42023          	sw	a4,0(s0)
    356c:	0a412703          	lw	a4,164(sp)
    3570:	00f484b3          	add	s1,s1,a5
    3574:	00f42223          	sw	a5,4(s0)
    3578:	00170713          	add	a4,a4,1
    357c:	0a912423          	sw	s1,168(sp)
    3580:	0ae12223          	sw	a4,164(sp)
    3584:	00840413          	add	s0,s0,8
    3588:	a4e6d0e3          	bge	a3,a4,2fc8 <_vfprintf_r+0x1210>
    358c:	00812583          	lw	a1,8(sp)
    3590:	0a010613          	add	a2,sp,160
    3594:	00098513          	mv	a0,s3
    3598:	02612223          	sw	t1,36(sp)
    359c:	03d12023          	sw	t4,32(sp)
    35a0:	6d4010ef          	jal	4c74 <__sprint_r>
    35a4:	00050463          	beqz	a0,35ac <_vfprintf_r+0x17f4>
    35a8:	ce1fe06f          	j	2288 <_vfprintf_r+0x4d0>
    35ac:	07c12d03          	lw	s10,124(sp)
    35b0:	0a812483          	lw	s1,168(sp)
    35b4:	02412303          	lw	t1,36(sp)
    35b8:	02012e83          	lw	t4,32(sp)
    35bc:	0ac10413          	add	s0,sp,172
    35c0:	a09ff06f          	j	2fc8 <_vfprintf_r+0x1210>
    35c4:	01412703          	lw	a4,20(sp)
    35c8:	010ef793          	and	a5,t4,16
    35cc:	00072d03          	lw	s10,0(a4)
    35d0:	00470713          	add	a4,a4,4
    35d4:	00e12a23          	sw	a4,20(sp)
    35d8:	08079863          	bnez	a5,3668 <_vfprintf_r+0x18b0>
    35dc:	040ef793          	and	a5,t4,64
    35e0:	08078063          	beqz	a5,3660 <_vfprintf_r+0x18a8>
    35e4:	010d1d13          	sll	s10,s10,0x10
    35e8:	010d5d13          	srl	s10,s10,0x10
    35ec:	00000c93          	li	s9,0
    35f0:	e31ff06f          	j	3420 <_vfprintf_r+0x1668>
    35f4:	00000d13          	li	s10,0
    35f8:	15010c13          	add	s8,sp,336
    35fc:	a2cff06f          	j	2828 <_vfprintf_r+0xa70>
    3600:	00812583          	lw	a1,8(sp)
    3604:	0a010613          	add	a2,sp,160
    3608:	00098513          	mv	a0,s3
    360c:	03d12023          	sw	t4,32(sp)
    3610:	664010ef          	jal	4c74 <__sprint_r>
    3614:	00050463          	beqz	a0,361c <_vfprintf_r+0x1864>
    3618:	c71fe06f          	j	2288 <_vfprintf_r+0x4d0>
    361c:	0a812483          	lw	s1,168(sp)
    3620:	0a412d03          	lw	s10,164(sp)
    3624:	02012e83          	lw	t4,32(sp)
    3628:	0ac10b13          	add	s6,sp,172
    362c:	f71fe06f          	j	259c <_vfprintf_r+0x7e4>
    3630:	00812583          	lw	a1,8(sp)
    3634:	0a010613          	add	a2,sp,160
    3638:	00098513          	mv	a0,s3
    363c:	03d12023          	sw	t4,32(sp)
    3640:	634010ef          	jal	4c74 <__sprint_r>
    3644:	00050463          	beqz	a0,364c <_vfprintf_r+0x1894>
    3648:	c41fe06f          	j	2288 <_vfprintf_r+0x4d0>
    364c:	0a812483          	lw	s1,168(sp)
    3650:	0a412d03          	lw	s10,164(sp)
    3654:	02012e83          	lw	t4,32(sp)
    3658:	0ac10b13          	add	s6,sp,172
    365c:	f71fe06f          	j	25cc <_vfprintf_r+0x814>
    3660:	200ef793          	and	a5,t4,512
    3664:	76079663          	bnez	a5,3dd0 <_vfprintf_r+0x2018>
    3668:	00000c93          	li	s9,0
    366c:	db5ff06f          	j	3420 <_vfprintf_r+0x1668>
    3670:	00000793          	li	a5,0
    3674:	15010b13          	add	s6,sp,336
    3678:	01212823          	sw	s2,16(sp)
    367c:	00078913          	mv	s2,a5
    3680:	00098793          	mv	a5,s3
    3684:	04812823          	sw	s0,80(sp)
    3688:	000b0993          	mv	s3,s6
    368c:	03c12403          	lw	s0,60(sp)
    3690:	40067493          	and	s1,a2,1024
    3694:	0ff00a13          	li	s4,255
    3698:	03c12023          	sw	t3,32(sp)
    369c:	02c12223          	sw	a2,36(sp)
    36a0:	04612223          	sw	t1,68(sp)
    36a4:	00078b13          	mv	s6,a5
    36a8:	0280006f          	j	36d0 <_vfprintf_r+0x1918>
    36ac:	00a00613          	li	a2,10
    36b0:	00000693          	li	a3,0
    36b4:	000d0513          	mv	a0,s10
    36b8:	000c8593          	mv	a1,s9
    36bc:	485070ef          	jal	b340 <__udivdi3>
    36c0:	6a0c8ee3          	beqz	s9,457c <_vfprintf_r+0x27c4>
    36c4:	00050d13          	mv	s10,a0
    36c8:	00058c93          	mv	s9,a1
    36cc:	000c0993          	mv	s3,s8
    36d0:	00a00613          	li	a2,10
    36d4:	00000693          	li	a3,0
    36d8:	000d0513          	mv	a0,s10
    36dc:	000c8593          	mv	a1,s9
    36e0:	30c080ef          	jal	b9ec <__umoddi3>
    36e4:	03050513          	add	a0,a0,48
    36e8:	fea98fa3          	sb	a0,-1(s3)
    36ec:	fff98c13          	add	s8,s3,-1
    36f0:	00190913          	add	s2,s2,1
    36f4:	fa048ce3          	beqz	s1,36ac <_vfprintf_r+0x18f4>
    36f8:	00044783          	lbu	a5,0(s0)
    36fc:	faf918e3          	bne	s2,a5,36ac <_vfprintf_r+0x18f4>
    3700:	fb4906e3          	beq	s2,s4,36ac <_vfprintf_r+0x18f4>
    3704:	560c9ae3          	bnez	s9,4478 <_vfprintf_r+0x26c0>
    3708:	00900793          	li	a5,9
    370c:	57a7e6e3          	bltu	a5,s10,4478 <_vfprintf_r+0x26c0>
    3710:	02412603          	lw	a2,36(sp)
    3714:	15010793          	add	a5,sp,336
    3718:	02812e23          	sw	s0,60(sp)
    371c:	01212c23          	sw	s2,24(sp)
    3720:	02012e03          	lw	t3,32(sp)
    3724:	01012903          	lw	s2,16(sp)
    3728:	04412303          	lw	t1,68(sp)
    372c:	05012403          	lw	s0,80(sp)
    3730:	000b0993          	mv	s3,s6
    3734:	41878d33          	sub	s10,a5,s8
    3738:	00060e93          	mv	t4,a2
    373c:	8ecff06f          	j	2828 <_vfprintf_r+0xa70>
    3740:	00812583          	lw	a1,8(sp)
    3744:	0a010613          	add	a2,sp,160
    3748:	00098513          	mv	a0,s3
    374c:	04612e23          	sw	t1,92(sp)
    3750:	05c12c23          	sw	t3,88(sp)
    3754:	05d12a23          	sw	t4,84(sp)
    3758:	05f12823          	sw	t6,80(sp)
    375c:	04512223          	sw	t0,68(sp)
    3760:	514010ef          	jal	4c74 <__sprint_r>
    3764:	00050463          	beqz	a0,376c <_vfprintf_r+0x19b4>
    3768:	b21fe06f          	j	2288 <_vfprintf_r+0x4d0>
    376c:	07714603          	lbu	a2,119(sp)
    3770:	0a812483          	lw	s1,168(sp)
    3774:	05c12303          	lw	t1,92(sp)
    3778:	05812e03          	lw	t3,88(sp)
    377c:	05412e83          	lw	t4,84(sp)
    3780:	05012f83          	lw	t6,80(sp)
    3784:	04412283          	lw	t0,68(sp)
    3788:	0ac10413          	add	s0,sp,172
    378c:	88dfe06f          	j	2018 <_vfprintf_r+0x260>
    3790:	02812883          	lw	a7,40(sp)
    3794:	02c12703          	lw	a4,44(sp)
    3798:	02612223          	sw	t1,36(sp)
    379c:	00088613          	mv	a2,a7
    37a0:	00088513          	mv	a0,a7
    37a4:	00070693          	mv	a3,a4
    37a8:	00070593          	mv	a1,a4
    37ac:	03c12023          	sw	t3,32(sp)
    37b0:	01d12823          	sw	t4,16(sp)
    37b4:	5310a0ef          	jal	e4e4 <__unorddf2>
    37b8:	01012e83          	lw	t4,16(sp)
    37bc:	02012e03          	lw	t3,32(sp)
    37c0:	02412303          	lw	t1,36(sp)
    37c4:	00050463          	beqz	a0,37cc <_vfprintf_r+0x1a14>
    37c8:	0e00106f          	j	48a8 <_vfprintf_r+0x2af0>
    37cc:	06100713          	li	a4,97
    37d0:	08ee0263          	beq	t3,a4,3854 <_vfprintf_r+0x1a9c>
    37d4:	04100713          	li	a4,65
    37d8:	05800793          	li	a5,88
    37dc:	06ee0e63          	beq	t3,a4,3858 <_vfprintf_r+0x1aa0>
    37e0:	fff00713          	li	a4,-1
    37e4:	00e31463          	bne	t1,a4,37ec <_vfprintf_r+0x1a34>
    37e8:	01c0106f          	j	4804 <_vfprintf_r+0x2a4c>
    37ec:	fdfe7713          	and	a4,t3,-33
    37f0:	04700693          	li	a3,71
    37f4:	00012823          	sw	zero,16(sp)
    37f8:	00d71663          	bne	a4,a3,3804 <_vfprintf_r+0x1a4c>
    37fc:	00031463          	bnez	t1,3804 <_vfprintf_r+0x1a4c>
    3800:	00100313          	li	t1,1
    3804:	100ee793          	or	a5,t4,256
    3808:	00078b13          	mv	s6,a5
    380c:	02c12783          	lw	a5,44(sp)
    3810:	04012223          	sw	zero,68(sp)
    3814:	00078493          	mv	s1,a5
    3818:	0007da63          	bgez	a5,382c <_vfprintf_r+0x1a74>
    381c:	800004b7          	lui	s1,0x80000
    3820:	00f4c4b3          	xor	s1,s1,a5
    3824:	02d00793          	li	a5,45
    3828:	04f12223          	sw	a5,68(sp)
    382c:	fbfe0713          	add	a4,t3,-65
    3830:	02500693          	li	a3,37
    3834:	3ae6e463          	bltu	a3,a4,3bdc <_vfprintf_r+0x1e24>
    3838:	0000c697          	auipc	a3,0xc
    383c:	ba468693          	add	a3,a3,-1116 # f3dc <_ctype_+0x270>
    3840:	00271713          	sll	a4,a4,0x2
    3844:	00d70733          	add	a4,a4,a3
    3848:	00072703          	lw	a4,0(a4)
    384c:	00d70733          	add	a4,a4,a3
    3850:	00070067          	jr	a4
    3854:	07800793          	li	a5,120
    3858:	03000713          	li	a4,48
    385c:	06e10c23          	sb	a4,120(sp)
    3860:	06f10ca3          	sb	a5,121(sp)
    3864:	06300713          	li	a4,99
    3868:	00012823          	sw	zero,16(sp)
    386c:	002eee93          	or	t4,t4,2
    3870:	0ec10c13          	add	s8,sp,236
    3874:	f86758e3          	bge	a4,t1,3804 <_vfprintf_r+0x1a4c>
    3878:	00130593          	add	a1,t1,1
    387c:	00098513          	mv	a0,s3
    3880:	03c12023          	sw	t3,32(sp)
    3884:	01d12c23          	sw	t4,24(sp)
    3888:	00612823          	sw	t1,16(sp)
    388c:	d35fd0ef          	jal	15c0 <_malloc_r>
    3890:	01012303          	lw	t1,16(sp)
    3894:	01812e83          	lw	t4,24(sp)
    3898:	02012e03          	lw	t3,32(sp)
    389c:	00050c13          	mv	s8,a0
    38a0:	00051463          	bnez	a0,38a8 <_vfprintf_r+0x1af0>
    38a4:	13c0106f          	j	49e0 <_vfprintf_r+0x2c28>
    38a8:	00a12823          	sw	a0,16(sp)
    38ac:	f59ff06f          	j	3804 <_vfprintf_r+0x1a4c>
    38b0:	00098513          	mv	a0,s3
    38b4:	1d0030ef          	jal	6a84 <__sinit>
    38b8:	00c12783          	lw	a5,12(sp)
    38bc:	d5cfe06f          	j	1e18 <_vfprintf_r+0x60>
    38c0:	00812583          	lw	a1,8(sp)
    38c4:	0a010613          	add	a2,sp,160
    38c8:	00098513          	mv	a0,s3
    38cc:	03d12023          	sw	t4,32(sp)
    38d0:	3a4010ef          	jal	4c74 <__sprint_r>
    38d4:	00050463          	beqz	a0,38dc <_vfprintf_r+0x1b24>
    38d8:	9b1fe06f          	j	2288 <_vfprintf_r+0x4d0>
    38dc:	0a812483          	lw	s1,168(sp)
    38e0:	02012e83          	lw	t4,32(sp)
    38e4:	0ac10413          	add	s0,sp,172
    38e8:	9b0ff06f          	j	2a98 <_vfprintf_r+0xce0>
    38ec:	00800613          	li	a2,8
    38f0:	00000593          	li	a1,0
    38f4:	09810513          	add	a0,sp,152
    38f8:	02612023          	sw	t1,32(sp)
    38fc:	01c12a23          	sw	t3,20(sp)
    3900:	01d12823          	sw	t4,16(sp)
    3904:	09812223          	sw	s8,132(sp)
    3908:	d5cfd0ef          	jal	e64 <memset>
    390c:	02012303          	lw	t1,32(sp)
    3910:	01012e83          	lw	t4,16(sp)
    3914:	01412e03          	lw	t3,20(sp)
    3918:	3a0340e3          	bltz	t1,44b8 <_vfprintf_r+0x2700>
    391c:	00000d13          	li	s10,0
    3920:	01212823          	sw	s2,16(sp)
    3924:	000c0c93          	mv	s9,s8
    3928:	fff00493          	li	s1,-1
    392c:	000b0c13          	mv	s8,s6
    3930:	000e8a13          	mv	s4,t4
    3934:	00040b13          	mv	s6,s0
    3938:	000d0913          	mv	s2,s10
    393c:	00030413          	mv	s0,t1
    3940:	0300006f          	j	3970 <_vfprintf_r+0x1bb8>
    3944:	09810693          	add	a3,sp,152
    3948:	0ec10593          	add	a1,sp,236
    394c:	00098513          	mv	a0,s3
    3950:	685060ef          	jal	a7d4 <_wcrtomb_r>
    3954:	68950ae3          	beq	a0,s1,47e8 <_vfprintf_r+0x2a30>
    3958:	00a907b3          	add	a5,s2,a0
    395c:	02f44263          	blt	s0,a5,3980 <_vfprintf_r+0x1bc8>
    3960:	004d0d13          	add	s10,s10,4
    3964:	00879463          	bne	a5,s0,396c <_vfprintf_r+0x1bb4>
    3968:	7990006f          	j	4900 <_vfprintf_r+0x2b48>
    396c:	00078913          	mv	s2,a5
    3970:	08412783          	lw	a5,132(sp)
    3974:	01a787b3          	add	a5,a5,s10
    3978:	0007a603          	lw	a2,0(a5)
    397c:	fc0614e3          	bnez	a2,3944 <_vfprintf_r+0x1b8c>
    3980:	00090d13          	mv	s10,s2
    3984:	01412e03          	lw	t3,20(sp)
    3988:	01012903          	lw	s2,16(sp)
    398c:	000b0413          	mv	s0,s6
    3990:	000a0e93          	mv	t4,s4
    3994:	000c0b13          	mv	s6,s8
    3998:	000c8c13          	mv	s8,s9
    399c:	340d0ce3          	beqz	s10,44f4 <_vfprintf_r+0x273c>
    39a0:	06300793          	li	a5,99
    39a4:	59a7dee3          	bge	a5,s10,4740 <_vfprintf_r+0x2988>
    39a8:	001d0593          	add	a1,s10,1
    39ac:	00098513          	mv	a0,s3
    39b0:	01c12a23          	sw	t3,20(sp)
    39b4:	01d12823          	sw	t4,16(sp)
    39b8:	c09fd0ef          	jal	15c0 <_malloc_r>
    39bc:	01012e83          	lw	t4,16(sp)
    39c0:	01412e03          	lw	t3,20(sp)
    39c4:	00050c13          	mv	s8,a0
    39c8:	620500e3          	beqz	a0,47e8 <_vfprintf_r+0x2a30>
    39cc:	00a12823          	sw	a0,16(sp)
    39d0:	00800613          	li	a2,8
    39d4:	00000593          	li	a1,0
    39d8:	09810513          	add	a0,sp,152
    39dc:	03c12023          	sw	t3,32(sp)
    39e0:	01d12a23          	sw	t4,20(sp)
    39e4:	c80fd0ef          	jal	e64 <memset>
    39e8:	09810713          	add	a4,sp,152
    39ec:	000d0693          	mv	a3,s10
    39f0:	08410613          	add	a2,sp,132
    39f4:	000c0593          	mv	a1,s8
    39f8:	00098513          	mv	a0,s3
    39fc:	665060ef          	jal	a860 <_wcsrtombs_r>
    3a00:	01412e83          	lw	t4,20(sp)
    3a04:	02012e03          	lw	t3,32(sp)
    3a08:	00ad0463          	beq	s10,a0,3a10 <_vfprintf_r+0x1c58>
    3a0c:	0240106f          	j	4a30 <_vfprintf_r+0x2c78>
    3a10:	01ac0733          	add	a4,s8,s10
    3a14:	00070023          	sb	zero,0(a4)
    3a18:	07714603          	lbu	a2,119(sp)
    3a1c:	fffd4813          	not	a6,s10
    3a20:	41f85813          	sra	a6,a6,0x1f
    3a24:	01612a23          	sw	s6,20(sp)
    3a28:	02012223          	sw	zero,36(sp)
    3a2c:	02012023          	sw	zero,32(sp)
    3a30:	010d7cb3          	and	s9,s10,a6
    3a34:	00000313          	li	t1,0
    3a38:	00000a13          	li	s4,0
    3a3c:	00061463          	bnez	a2,3a44 <_vfprintf_r+0x1c8c>
    3a40:	db8fe06f          	j	1ff8 <_vfprintf_r+0x240>
    3a44:	9d5fe06f          	j	2418 <_vfprintf_r+0x660>
    3a48:	00048e93          	mv	t4,s1
    3a4c:	000a0293          	mv	t0,s4
    3a50:	00070493          	mv	s1,a4
    3a54:	01a484b3          	add	s1,s1,s10
    3a58:	00178793          	add	a5,a5,1
    3a5c:	00542023          	sw	t0,0(s0)
    3a60:	e48fe06f          	j	20a8 <_vfprintf_r+0x2f0>
    3a64:	01412783          	lw	a5,20(sp)
    3a68:	00c12703          	lw	a4,12(sp)
    3a6c:	0007a783          	lw	a5,0(a5)
    3a70:	00e7a023          	sw	a4,0(a5)
    3a74:	fadfe06f          	j	2a20 <_vfprintf_r+0xc68>
    3a78:	02012e83          	lw	t4,32(sp)
    3a7c:	00040293          	mv	t0,s0
    3a80:	000a0413          	mv	s0,s4
    3a84:	008484b3          	add	s1,s1,s0
    3a88:	001d0d13          	add	s10,s10,1
    3a8c:	005b2023          	sw	t0,0(s6)
    3a90:	b7dfe06f          	j	260c <_vfprintf_r+0x854>
    3a94:	03412703          	lw	a4,52(sp)
    3a98:	03012783          	lw	a5,48(sp)
    3a9c:	00700613          	li	a2,7
    3aa0:	00e42023          	sw	a4,0(s0)
    3aa4:	0a412703          	lw	a4,164(sp)
    3aa8:	009784b3          	add	s1,a5,s1
    3aac:	00f42223          	sw	a5,4(s0)
    3ab0:	00170713          	add	a4,a4,1
    3ab4:	0a912423          	sw	s1,168(sp)
    3ab8:	0ae12223          	sw	a4,164(sp)
    3abc:	00840413          	add	s0,s0,8
    3ac0:	3ae64463          	blt	a2,a4,3e68 <_vfprintf_r+0x20b0>
    3ac4:	3e06cee3          	bltz	a3,46c0 <_vfprintf_r+0x2908>
    3ac8:	01812783          	lw	a5,24(sp)
    3acc:	00170713          	add	a4,a4,1
    3ad0:	01842023          	sw	s8,0(s0)
    3ad4:	009784b3          	add	s1,a5,s1
    3ad8:	00f42223          	sw	a5,4(s0)
    3adc:	0a912423          	sw	s1,168(sp)
    3ae0:	0ae12223          	sw	a4,164(sp)
    3ae4:	00700793          	li	a5,7
    3ae8:	00e7c463          	blt	a5,a4,3af0 <_vfprintf_r+0x1d38>
    3aec:	dd0fe06f          	j	20bc <_vfprintf_r+0x304>
    3af0:	b61fe06f          	j	2650 <_vfprintf_r+0x898>
    3af4:	01000613          	li	a2,16
    3af8:	0a412683          	lw	a3,164(sp)
    3afc:	0000c297          	auipc	t0,0xc
    3b00:	97828293          	add	t0,t0,-1672 # f474 <zeroes.0>
    3b04:	09665463          	bge	a2,s6,3b8c <_vfprintf_r+0x1dd4>
    3b08:	00040793          	mv	a5,s0
    3b0c:	00048713          	mv	a4,s1
    3b10:	00812403          	lw	s0,8(sp)
    3b14:	01000893          	li	a7,16
    3b18:	00700d13          	li	s10,7
    3b1c:	05d12223          	sw	t4,68(sp)
    3b20:	00028493          	mv	s1,t0
    3b24:	00c0006f          	j	3b30 <_vfprintf_r+0x1d78>
    3b28:	ff0b0b13          	add	s6,s6,-16
    3b2c:	0568d863          	bge	a7,s6,3b7c <_vfprintf_r+0x1dc4>
    3b30:	01070713          	add	a4,a4,16
    3b34:	00168693          	add	a3,a3,1
    3b38:	0097a023          	sw	s1,0(a5)
    3b3c:	0117a223          	sw	a7,4(a5)
    3b40:	0ae12423          	sw	a4,168(sp)
    3b44:	0ad12223          	sw	a3,164(sp)
    3b48:	00878793          	add	a5,a5,8
    3b4c:	fcdd5ee3          	bge	s10,a3,3b28 <_vfprintf_r+0x1d70>
    3b50:	0a010613          	add	a2,sp,160
    3b54:	00040593          	mv	a1,s0
    3b58:	00098513          	mv	a0,s3
    3b5c:	118010ef          	jal	4c74 <__sprint_r>
    3b60:	00050463          	beqz	a0,3b68 <_vfprintf_r+0x1db0>
    3b64:	f24fe06f          	j	2288 <_vfprintf_r+0x4d0>
    3b68:	0a812703          	lw	a4,168(sp)
    3b6c:	0a412683          	lw	a3,164(sp)
    3b70:	0ac10793          	add	a5,sp,172
    3b74:	01000893          	li	a7,16
    3b78:	fb1ff06f          	j	3b28 <_vfprintf_r+0x1d70>
    3b7c:	04412e83          	lw	t4,68(sp)
    3b80:	00048293          	mv	t0,s1
    3b84:	00078413          	mv	s0,a5
    3b88:	00070493          	mv	s1,a4
    3b8c:	016484b3          	add	s1,s1,s6
    3b90:	00168693          	add	a3,a3,1
    3b94:	00542023          	sw	t0,0(s0)
    3b98:	01642223          	sw	s6,4(s0)
    3b9c:	0a912423          	sw	s1,168(sp)
    3ba0:	0ad12223          	sw	a3,164(sp)
    3ba4:	00700713          	li	a4,7
    3ba8:	00840413          	add	s0,s0,8
    3bac:	bed75c63          	bge	a4,a3,2fa4 <_vfprintf_r+0x11ec>
    3bb0:	00812583          	lw	a1,8(sp)
    3bb4:	0a010613          	add	a2,sp,160
    3bb8:	00098513          	mv	a0,s3
    3bbc:	05d12223          	sw	t4,68(sp)
    3bc0:	0b4010ef          	jal	4c74 <__sprint_r>
    3bc4:	00050463          	beqz	a0,3bcc <_vfprintf_r+0x1e14>
    3bc8:	ec0fe06f          	j	2288 <_vfprintf_r+0x4d0>
    3bcc:	0a812483          	lw	s1,168(sp)
    3bd0:	04412e83          	lw	t4,68(sp)
    3bd4:	0ac10413          	add	s0,sp,172
    3bd8:	bccff06f          	j	2fa4 <_vfprintf_r+0x11ec>
    3bdc:	02812703          	lw	a4,40(sp)
    3be0:	09810893          	add	a7,sp,152
    3be4:	08410813          	add	a6,sp,132
    3be8:	00070513          	mv	a0,a4
    3bec:	00050593          	mv	a1,a0
    3bf0:	00030713          	mv	a4,t1
    3bf4:	07c10793          	add	a5,sp,124
    3bf8:	00200693          	li	a3,2
    3bfc:	00048613          	mv	a2,s1
    3c00:	00098513          	mv	a0,s3
    3c04:	03c12223          	sw	t3,36(sp)
    3c08:	03d12023          	sw	t4,32(sp)
    3c0c:	00612c23          	sw	t1,24(sp)
    3c10:	11c040ef          	jal	7d2c <_dtoa_r>
    3c14:	02012e83          	lw	t4,32(sp)
    3c18:	01812303          	lw	t1,24(sp)
    3c1c:	02412e03          	lw	t3,36(sp)
    3c20:	001ef713          	and	a4,t4,1
    3c24:	00050c13          	mv	s8,a0
    3c28:	1a0712e3          	bnez	a4,45cc <_vfprintf_r+0x2814>
    3c2c:	09812783          	lw	a5,152(sp)
    3c30:	07c12a03          	lw	s4,124(sp)
    3c34:	40a787b3          	sub	a5,a5,a0
    3c38:	00f12c23          	sw	a5,24(sp)
    3c3c:	ffd00713          	li	a4,-3
    3c40:	00ea4463          	blt	s4,a4,3c48 <_vfprintf_r+0x1e90>
    3c44:	5b435663          	bge	t1,s4,41f0 <_vfprintf_r+0x2438>
    3c48:	ffee0e13          	add	t3,t3,-2
    3c4c:	fffa0d13          	add	s10,s4,-1
    3c50:	07a12e23          	sw	s10,124(sp)
    3c54:	0ffe7693          	zext.b	a3,t3
    3c58:	00000613          	li	a2,0
    3c5c:	08d10423          	sb	a3,136(sp)
    3c60:	02b00693          	li	a3,43
    3c64:	000d5863          	bgez	s10,3c74 <_vfprintf_r+0x1ebc>
    3c68:	00100713          	li	a4,1
    3c6c:	41470d33          	sub	s10,a4,s4
    3c70:	02d00693          	li	a3,45
    3c74:	08d104a3          	sb	a3,137(sp)
    3c78:	00900693          	li	a3,9
    3c7c:	33a6d8e3          	bge	a3,s10,47ac <_vfprintf_r+0x29f4>
    3c80:	000c0793          	mv	a5,s8
    3c84:	09f10493          	add	s1,sp,159
    3c88:	03212023          	sw	s2,32(sp)
    3c8c:	00040c13          	mv	s8,s0
    3c90:	06300a13          	li	s4,99
    3c94:	000d0413          	mv	s0,s10
    3c98:	03d12223          	sw	t4,36(sp)
    3c9c:	05c12023          	sw	t3,64(sp)
    3ca0:	00048913          	mv	s2,s1
    3ca4:	00098c93          	mv	s9,s3
    3ca8:	00078d13          	mv	s10,a5
    3cac:	00a00593          	li	a1,10
    3cb0:	00040513          	mv	a0,s0
    3cb4:	7a10a0ef          	jal	ec54 <__modsi3>
    3cb8:	03050713          	add	a4,a0,48
    3cbc:	00090b13          	mv	s6,s2
    3cc0:	00040513          	mv	a0,s0
    3cc4:	feeb0fa3          	sb	a4,-1(s6)
    3cc8:	00a00593          	li	a1,10
    3ccc:	00040993          	mv	s3,s0
    3cd0:	7010a0ef          	jal	ebd0 <__divsi3>
    3cd4:	fff90913          	add	s2,s2,-1
    3cd8:	00050413          	mv	s0,a0
    3cdc:	fd3a48e3          	blt	s4,s3,3cac <_vfprintf_r+0x1ef4>
    3ce0:	000c8993          	mv	s3,s9
    3ce4:	03050713          	add	a4,a0,48
    3ce8:	00090c93          	mv	s9,s2
    3cec:	ffeb0693          	add	a3,s6,-2
    3cf0:	feec8fa3          	sb	a4,-1(s9)
    3cf4:	000c0413          	mv	s0,s8
    3cf8:	02412e83          	lw	t4,36(sp)
    3cfc:	04012e03          	lw	t3,64(sp)
    3d00:	02012903          	lw	s2,32(sp)
    3d04:	000d0c13          	mv	s8,s10
    3d08:	4c96f6e3          	bgeu	a3,s1,49d4 <_vfprintf_r+0x2c1c>
    3d0c:	08a10713          	add	a4,sp,138
    3d10:	0006c783          	lbu	a5,0(a3)
    3d14:	00168693          	add	a3,a3,1
    3d18:	00170713          	add	a4,a4,1
    3d1c:	fef70fa3          	sb	a5,-1(a4)
    3d20:	fe9698e3          	bne	a3,s1,3d10 <_vfprintf_r+0x1f58>
    3d24:	15010793          	add	a5,sp,336
    3d28:	41678633          	sub	a2,a5,s6
    3d2c:	f5360793          	add	a5,a2,-173
    3d30:	04f12023          	sw	a5,64(sp)
    3d34:	01812783          	lw	a5,24(sp)
    3d38:	04012683          	lw	a3,64(sp)
    3d3c:	00100713          	li	a4,1
    3d40:	00d78d33          	add	s10,a5,a3
    3d44:	28f75ce3          	bge	a4,a5,47dc <_vfprintf_r+0x2a24>
    3d48:	03012783          	lw	a5,48(sp)
    3d4c:	00fd0d33          	add	s10,s10,a5
    3d50:	fffd4813          	not	a6,s10
    3d54:	bffeff13          	and	t5,t4,-1025
    3d58:	41f85813          	sra	a6,a6,0x1f
    3d5c:	100f6e93          	or	t4,t5,256
    3d60:	010d7cb3          	and	s9,s10,a6
    3d64:	02012223          	sw	zero,36(sp)
    3d68:	02012023          	sw	zero,32(sp)
    3d6c:	00000a13          	li	s4,0
    3d70:	04412783          	lw	a5,68(sp)
    3d74:	46079263          	bnez	a5,41d8 <_vfprintf_r+0x2420>
    3d78:	07714603          	lbu	a2,119(sp)
    3d7c:	00000313          	li	t1,0
    3d80:	00061463          	bnez	a2,3d88 <_vfprintf_r+0x1fd0>
    3d84:	a74fe06f          	j	1ff8 <_vfprintf_r+0x240>
    3d88:	e90fe06f          	j	2418 <_vfprintf_r+0x660>
    3d8c:	00812583          	lw	a1,8(sp)
    3d90:	0a010613          	add	a2,sp,160
    3d94:	00098513          	mv	a0,s3
    3d98:	03d12023          	sw	t4,32(sp)
    3d9c:	6d9000ef          	jal	4c74 <__sprint_r>
    3da0:	00050463          	beqz	a0,3da8 <_vfprintf_r+0x1ff0>
    3da4:	ce4fe06f          	j	2288 <_vfprintf_r+0x4d0>
    3da8:	07c12683          	lw	a3,124(sp)
    3dac:	0a812483          	lw	s1,168(sp)
    3db0:	02012e83          	lw	t4,32(sp)
    3db4:	0ac10413          	add	s0,sp,172
    3db8:	ce0ff06f          	j	3298 <_vfprintf_r+0x14e0>
    3dbc:	00600c93          	li	s9,6
    3dc0:	f14ff06f          	j	34d4 <_vfprintf_r+0x171c>
    3dc4:	0ffd7d13          	zext.b	s10,s10
    3dc8:	00000c93          	li	s9,0
    3dcc:	bd5fe06f          	j	29a0 <_vfprintf_r+0xbe8>
    3dd0:	0ffd7d13          	zext.b	s10,s10
    3dd4:	00000c93          	li	s9,0
    3dd8:	e48ff06f          	j	3420 <_vfprintf_r+0x1668>
    3ddc:	018d1d13          	sll	s10,s10,0x18
    3de0:	418d5d13          	sra	s10,s10,0x18
    3de4:	41fd5c93          	sra	s9,s10,0x1f
    3de8:	000c8793          	mv	a5,s9
    3dec:	b39fe06f          	j	2924 <_vfprintf_r+0xb6c>
    3df0:	01412783          	lw	a5,20(sp)
    3df4:	00c12703          	lw	a4,12(sp)
    3df8:	0007a783          	lw	a5,0(a5)
    3dfc:	00e79023          	sh	a4,0(a5)
    3e00:	c21fe06f          	j	2a20 <_vfprintf_r+0xc68>
    3e04:	000c0513          	mv	a0,s8
    3e08:	05d12223          	sw	t4,68(sp)
    3e0c:	ad8fd0ef          	jal	10e4 <strlen>
    3e10:	07714603          	lbu	a2,119(sp)
    3e14:	fff54813          	not	a6,a0
    3e18:	41f85813          	sra	a6,a6,0x1f
    3e1c:	01612a23          	sw	s6,20(sp)
    3e20:	02012223          	sw	zero,36(sp)
    3e24:	02012023          	sw	zero,32(sp)
    3e28:	00012823          	sw	zero,16(sp)
    3e2c:	04412e83          	lw	t4,68(sp)
    3e30:	00050d13          	mv	s10,a0
    3e34:	01057cb3          	and	s9,a0,a6
    3e38:	00000313          	li	t1,0
    3e3c:	07300e13          	li	t3,115
    3e40:	00061463          	bnez	a2,3e48 <_vfprintf_r+0x2090>
    3e44:	9b4fe06f          	j	1ff8 <_vfprintf_r+0x240>
    3e48:	dd0fe06f          	j	2418 <_vfprintf_r+0x660>
    3e4c:	00812583          	lw	a1,8(sp)
    3e50:	0a010613          	add	a2,sp,160
    3e54:	00098513          	mv	a0,s3
    3e58:	61d000ef          	jal	4c74 <__sprint_r>
    3e5c:	00051463          	bnez	a0,3e64 <_vfprintf_r+0x20ac>
    3e60:	be8fe06f          	j	2248 <_vfprintf_r+0x490>
    3e64:	c38fe06f          	j	229c <_vfprintf_r+0x4e4>
    3e68:	00812583          	lw	a1,8(sp)
    3e6c:	0a010613          	add	a2,sp,160
    3e70:	00098513          	mv	a0,s3
    3e74:	03d12023          	sw	t4,32(sp)
    3e78:	5fd000ef          	jal	4c74 <__sprint_r>
    3e7c:	00050463          	beqz	a0,3e84 <_vfprintf_r+0x20cc>
    3e80:	c08fe06f          	j	2288 <_vfprintf_r+0x4d0>
    3e84:	07c12683          	lw	a3,124(sp)
    3e88:	0a812483          	lw	s1,168(sp)
    3e8c:	0a412703          	lw	a4,164(sp)
    3e90:	02012e83          	lw	t4,32(sp)
    3e94:	0ac10413          	add	s0,sp,172
    3e98:	c2dff06f          	j	3ac4 <_vfprintf_r+0x1d0c>
    3e9c:	05862503          	lw	a0,88(a2)
    3ea0:	00f12623          	sw	a5,12(sp)
    3ea4:	fbdfc0ef          	jal	e60 <__retarget_lock_release_recursive>
    3ea8:	00c12783          	lw	a5,12(sp)
    3eac:	ab8fe06f          	j	2164 <_vfprintf_r+0x3ac>
    3eb0:	00130a13          	add	s4,t1,1
    3eb4:	00200693          	li	a3,2
    3eb8:	02812703          	lw	a4,40(sp)
    3ebc:	09810893          	add	a7,sp,152
    3ec0:	08410813          	add	a6,sp,132
    3ec4:	00070513          	mv	a0,a4
    3ec8:	00050593          	mv	a1,a0
    3ecc:	000a0713          	mv	a4,s4
    3ed0:	07c10793          	add	a5,sp,124
    3ed4:	00048613          	mv	a2,s1
    3ed8:	00098513          	mv	a0,s3
    3edc:	02612223          	sw	t1,36(sp)
    3ee0:	03c12023          	sw	t3,32(sp)
    3ee4:	01d12c23          	sw	t4,24(sp)
    3ee8:	645030ef          	jal	7d2c <_dtoa_r>
    3eec:	02012e03          	lw	t3,32(sp)
    3ef0:	04600693          	li	a3,70
    3ef4:	01812e83          	lw	t4,24(sp)
    3ef8:	fdfe7d13          	and	s10,t3,-33
    3efc:	02412303          	lw	t1,36(sp)
    3f00:	00050c13          	mv	s8,a0
    3f04:	01450733          	add	a4,a0,s4
    3f08:	34dd14e3          	bne	s10,a3,4a50 <_vfprintf_r+0x2c98>
    3f0c:	000c4603          	lbu	a2,0(s8)
    3f10:	03000693          	li	a3,48
    3f14:	6cd60263          	beq	a2,a3,45d8 <_vfprintf_r+0x2820>
    3f18:	07c12683          	lw	a3,124(sp)
    3f1c:	00d70733          	add	a4,a4,a3
    3f20:	02812683          	lw	a3,40(sp)
    3f24:	00048593          	mv	a1,s1
    3f28:	00000613          	li	a2,0
    3f2c:	00068513          	mv	a0,a3
    3f30:	00000693          	li	a3,0
    3f34:	04e12823          	sw	a4,80(sp)
    3f38:	02612223          	sw	t1,36(sp)
    3f3c:	03c12023          	sw	t3,32(sp)
    3f40:	01d12c23          	sw	t4,24(sp)
    3f44:	274090ef          	jal	d1b8 <__eqdf2>
    3f48:	01812e83          	lw	t4,24(sp)
    3f4c:	02012e03          	lw	t3,32(sp)
    3f50:	02412303          	lw	t1,36(sp)
    3f54:	05012703          	lw	a4,80(sp)
    3f58:	62050863          	beqz	a0,4588 <_vfprintf_r+0x27d0>
    3f5c:	09812783          	lw	a5,152(sp)
    3f60:	00e7fe63          	bgeu	a5,a4,3f7c <_vfprintf_r+0x21c4>
    3f64:	03000613          	li	a2,48
    3f68:	00178693          	add	a3,a5,1
    3f6c:	08d12c23          	sw	a3,152(sp)
    3f70:	00c78023          	sb	a2,0(a5)
    3f74:	09812783          	lw	a5,152(sp)
    3f78:	fee7e8e3          	bltu	a5,a4,3f68 <_vfprintf_r+0x21b0>
    3f7c:	07c12a03          	lw	s4,124(sp)
    3f80:	418787b3          	sub	a5,a5,s8
    3f84:	04700713          	li	a4,71
    3f88:	00f12c23          	sw	a5,24(sp)
    3f8c:	caed08e3          	beq	s10,a4,3c3c <_vfprintf_r+0x1e84>
    3f90:	04600713          	li	a4,70
    3f94:	68ed0863          	beq	s10,a4,4624 <_vfprintf_r+0x286c>
    3f98:	fffa0d13          	add	s10,s4,-1
    3f9c:	cb5ff06f          	j	3c50 <_vfprintf_r+0x1e98>
    3fa0:	02812703          	lw	a4,40(sp)
    3fa4:	07c10613          	add	a2,sp,124
    3fa8:	00048593          	mv	a1,s1
    3fac:	00070513          	mv	a0,a4
    3fb0:	02612223          	sw	t1,36(sp)
    3fb4:	03c12023          	sw	t3,32(sp)
    3fb8:	01d12c23          	sw	t4,24(sp)
    3fbc:	25d030ef          	jal	7a18 <frexp>
    3fc0:	7fffc717          	auipc	a4,0x7fffc
    3fc4:	6e870713          	add	a4,a4,1768 # 800006a8 <__global_locale+0x174>
    3fc8:	00072603          	lw	a2,0(a4)
    3fcc:	00472683          	lw	a3,4(a4)
    3fd0:	47c090ef          	jal	d44c <__muldf3>
    3fd4:	00000613          	li	a2,0
    3fd8:	00000693          	li	a3,0
    3fdc:	00050a13          	mv	s4,a0
    3fe0:	00058d13          	mv	s10,a1
    3fe4:	1d4090ef          	jal	d1b8 <__eqdf2>
    3fe8:	01812e83          	lw	t4,24(sp)
    3fec:	02012e03          	lw	t3,32(sp)
    3ff0:	02412303          	lw	t1,36(sp)
    3ff4:	00051663          	bnez	a0,4000 <_vfprintf_r+0x2248>
    3ff8:	00100713          	li	a4,1
    3ffc:	06e12e23          	sw	a4,124(sp)
    4000:	0000b797          	auipc	a5,0xb
    4004:	fa078793          	add	a5,a5,-96 # efa0 <__fini_array_end+0x294>
    4008:	06100713          	li	a4,97
    400c:	02f12023          	sw	a5,32(sp)
    4010:	00ee1863          	bne	t3,a4,4020 <_vfprintf_r+0x2268>
    4014:	0000b797          	auipc	a5,0xb
    4018:	f7878793          	add	a5,a5,-136 # ef8c <__fini_array_end+0x280>
    401c:	02f12023          	sw	a5,32(sp)
    4020:	7fffc717          	auipc	a4,0x7fffc
    4024:	69070713          	add	a4,a4,1680 # 800006b0 <__global_locale+0x17c>
    4028:	00072783          	lw	a5,0(a4)
    402c:	00472803          	lw	a6,4(a4)
    4030:	000c0493          	mv	s1,s8
    4034:	00f12c23          	sw	a5,24(sp)
    4038:	000d0793          	mv	a5,s10
    403c:	03212223          	sw	s2,36(sp)
    4040:	000c0d13          	mv	s10,s8
    4044:	02012903          	lw	s2,32(sp)
    4048:	00098c13          	mv	s8,s3
    404c:	01012e23          	sw	a6,28(sp)
    4050:	fff30b13          	add	s6,t1,-1
    4054:	fff00c93          	li	s9,-1
    4058:	05d12023          	sw	t4,64(sp)
    405c:	05c12823          	sw	t3,80(sp)
    4060:	04812a23          	sw	s0,84(sp)
    4064:	00078993          	mv	s3,a5
    4068:	01c0006f          	j	4084 <_vfprintf_r+0x22cc>
    406c:	00000613          	li	a2,0
    4070:	00000693          	li	a3,0
    4074:	fffb0413          	add	s0,s6,-1
    4078:	140090ef          	jal	d1b8 <__eqdf2>
    407c:	0a0504e3          	beqz	a0,4924 <_vfprintf_r+0x2b6c>
    4080:	00040b13          	mv	s6,s0
    4084:	01812603          	lw	a2,24(sp)
    4088:	01c12683          	lw	a3,28(sp)
    408c:	000a0513          	mv	a0,s4
    4090:	00098593          	mv	a1,s3
    4094:	3b8090ef          	jal	d44c <__muldf3>
    4098:	00058a13          	mv	s4,a1
    409c:	00050993          	mv	s3,a0
    40a0:	4980a0ef          	jal	e538 <__fixdfsi>
    40a4:	00050413          	mv	s0,a0
    40a8:	5140a0ef          	jal	e5bc <__floatsidf>
    40ac:	00050613          	mv	a2,a0
    40b0:	00058693          	mv	a3,a1
    40b4:	00098513          	mv	a0,s3
    40b8:	000a0593          	mv	a1,s4
    40bc:	321090ef          	jal	dbdc <__subdf3>
    40c0:	00890733          	add	a4,s2,s0
    40c4:	00074703          	lbu	a4,0(a4)
    40c8:	00048813          	mv	a6,s1
    40cc:	00050a13          	mv	s4,a0
    40d0:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    40d4:	00058993          	mv	s3,a1
    40d8:	00148493          	add	s1,s1,1
    40dc:	f99b18e3          	bne	s6,s9,406c <_vfprintf_r+0x22b4>
    40e0:	7fffc697          	auipc	a3,0x7fffc
    40e4:	5d868693          	add	a3,a3,1496 # 800006b8 <__global_locale+0x184>
    40e8:	0006a303          	lw	t1,0(a3)
    40ec:	0046a383          	lw	t2,4(a3)
    40f0:	05012e03          	lw	t3,80(sp)
    40f4:	00030613          	mv	a2,t1
    40f8:	00038693          	mv	a3,t2
    40fc:	01012c23          	sw	a6,24(sp)
    4100:	02412903          	lw	s2,36(sp)
    4104:	000c0993          	mv	s3,s8
    4108:	03c12223          	sw	t3,36(sp)
    410c:	000d0c13          	mv	s8,s10
    4110:	00058d13          	mv	s10,a1
    4114:	130090ef          	jal	d244 <__gedf2>
    4118:	7fffc797          	auipc	a5,0x7fffc
    411c:	5a078793          	add	a5,a5,1440 # 800006b8 <__global_locale+0x184>
    4120:	00040b13          	mv	s6,s0
    4124:	0007a303          	lw	t1,0(a5)
    4128:	05412403          	lw	s0,84(sp)
    412c:	0047a383          	lw	t2,4(a5)
    4130:	01812803          	lw	a6,24(sp)
    4134:	02412e03          	lw	t3,36(sp)
    4138:	04012e83          	lw	t4,64(sp)
    413c:	0aa05ce3          	blez	a0,49f4 <_vfprintf_r+0x2c3c>
    4140:	02012783          	lw	a5,32(sp)
    4144:	09012c23          	sw	a6,152(sp)
    4148:	fff4c603          	lbu	a2,-1(s1)
    414c:	00f7c583          	lbu	a1,15(a5)
    4150:	00048693          	mv	a3,s1
    4154:	02b61063          	bne	a2,a1,4174 <_vfprintf_r+0x23bc>
    4158:	03000513          	li	a0,48
    415c:	fea68fa3          	sb	a0,-1(a3)
    4160:	09812683          	lw	a3,152(sp)
    4164:	fff68793          	add	a5,a3,-1
    4168:	08f12c23          	sw	a5,152(sp)
    416c:	fff6c603          	lbu	a2,-1(a3)
    4170:	feb606e3          	beq	a2,a1,415c <_vfprintf_r+0x23a4>
    4174:	00160593          	add	a1,a2,1
    4178:	03900513          	li	a0,57
    417c:	0ff5f593          	zext.b	a1,a1
    4180:	04a60463          	beq	a2,a0,41c8 <_vfprintf_r+0x2410>
    4184:	feb68fa3          	sb	a1,-1(a3)
    4188:	00048793          	mv	a5,s1
    418c:	07c12a03          	lw	s4,124(sp)
    4190:	418787b3          	sub	a5,a5,s8
    4194:	06100613          	li	a2,97
    4198:	fffa0d13          	add	s10,s4,-1
    419c:	00f12c23          	sw	a5,24(sp)
    41a0:	07a12e23          	sw	s10,124(sp)
    41a4:	07000693          	li	a3,112
    41a8:	00ce0663          	beq	t3,a2,41b4 <_vfprintf_r+0x23fc>
    41ac:	05000693          	li	a3,80
    41b0:	04100e13          	li	t3,65
    41b4:	00100613          	li	a2,1
    41b8:	aa5ff06f          	j	3c5c <_vfprintf_r+0x1ea4>
    41bc:	00030a13          	mv	s4,t1
    41c0:	00300693          	li	a3,3
    41c4:	cf5ff06f          	j	3eb8 <_vfprintf_r+0x2100>
    41c8:	02012783          	lw	a5,32(sp)
    41cc:	00a7c583          	lbu	a1,10(a5)
    41d0:	feb68fa3          	sb	a1,-1(a3)
    41d4:	fb5ff06f          	j	4188 <_vfprintf_r+0x23d0>
    41d8:	02d00713          	li	a4,45
    41dc:	06e10ba3          	sb	a4,119(sp)
    41e0:	02d00613          	li	a2,45
    41e4:	00000313          	li	t1,0
    41e8:	001c8c93          	add	s9,s9,1
    41ec:	e0dfd06f          	j	1ff8 <_vfprintf_r+0x240>
    41f0:	01812783          	lw	a5,24(sp)
    41f4:	46fa4063          	blt	s4,a5,4654 <_vfprintf_r+0x289c>
    41f8:	001ef713          	and	a4,t4,1
    41fc:	000a0d13          	mv	s10,s4
    4200:	00070663          	beqz	a4,420c <_vfprintf_r+0x2454>
    4204:	03012783          	lw	a5,48(sp)
    4208:	00fa0d33          	add	s10,s4,a5
    420c:	400eff13          	and	t5,t4,1024
    4210:	000f0463          	beqz	t5,4218 <_vfprintf_r+0x2460>
    4214:	5f404e63          	bgtz	s4,4810 <_vfprintf_r+0x2a58>
    4218:	fffd4813          	not	a6,s10
    421c:	41f85813          	sra	a6,a6,0x1f
    4220:	010d7cb3          	and	s9,s10,a6
    4224:	06700e13          	li	t3,103
    4228:	000b0e93          	mv	t4,s6
    422c:	02012223          	sw	zero,36(sp)
    4230:	02012023          	sw	zero,32(sp)
    4234:	b3dff06f          	j	3d70 <_vfprintf_r+0x1fb8>
    4238:	02d00793          	li	a5,45
    423c:	06f10ba3          	sb	a5,119(sp)
    4240:	02d00613          	li	a2,45
    4244:	998fe06f          	j	23dc <_vfprintf_r+0x624>
    4248:	01812783          	lw	a5,24(sp)
    424c:	02012a03          	lw	s4,32(sp)
    4250:	05212823          	sw	s2,80(sp)
    4254:	00fc07b3          	add	a5,s8,a5
    4258:	05712c23          	sw	s7,88(sp)
    425c:	05912e23          	sw	s9,92(sp)
    4260:	00040713          	mv	a4,s0
    4264:	04f12223          	sw	a5,68(sp)
    4268:	02412403          	lw	s0,36(sp)
    426c:	05d12a23          	sw	t4,84(sp)
    4270:	03812223          	sw	s8,36(sp)
    4274:	03c12b83          	lw	s7,60(sp)
    4278:	04c12c83          	lw	s9,76(sp)
    427c:	00812903          	lw	s2,8(sp)
    4280:	00700693          	li	a3,7
    4284:	01000d13          	li	s10,16
    4288:	0000bb17          	auipc	s6,0xb
    428c:	1ecb0b13          	add	s6,s6,492 # f474 <zeroes.0>
    4290:	00048613          	mv	a2,s1
    4294:	00030c13          	mv	s8,t1
    4298:	09405863          	blez	s4,4328 <_vfprintf_r+0x2570>
    429c:	16805e63          	blez	s0,4418 <_vfprintf_r+0x2660>
    42a0:	fff40413          	add	s0,s0,-1
    42a4:	04812783          	lw	a5,72(sp)
    42a8:	01960633          	add	a2,a2,s9
    42ac:	01972223          	sw	s9,4(a4)
    42b0:	00f72023          	sw	a5,0(a4)
    42b4:	0a412783          	lw	a5,164(sp)
    42b8:	0ac12423          	sw	a2,168(sp)
    42bc:	00870713          	add	a4,a4,8
    42c0:	00178793          	add	a5,a5,1
    42c4:	0af12223          	sw	a5,164(sp)
    42c8:	14f6ce63          	blt	a3,a5,4424 <_vfprintf_r+0x266c>
    42cc:	04412783          	lw	a5,68(sp)
    42d0:	000bc583          	lbu	a1,0(s7)
    42d4:	418784b3          	sub	s1,a5,s8
    42d8:	0095d463          	bge	a1,s1,42e0 <_vfprintf_r+0x2528>
    42dc:	00058493          	mv	s1,a1
    42e0:	02905663          	blez	s1,430c <_vfprintf_r+0x2554>
    42e4:	0a412583          	lw	a1,164(sp)
    42e8:	00960633          	add	a2,a2,s1
    42ec:	01872023          	sw	s8,0(a4)
    42f0:	00158593          	add	a1,a1,1
    42f4:	00972223          	sw	s1,4(a4)
    42f8:	0ac12423          	sw	a2,168(sp)
    42fc:	0ab12223          	sw	a1,164(sp)
    4300:	14b6c663          	blt	a3,a1,444c <_vfprintf_r+0x2694>
    4304:	000bc583          	lbu	a1,0(s7)
    4308:	00870713          	add	a4,a4,8
    430c:	fff4c513          	not	a0,s1
    4310:	41f55513          	sra	a0,a0,0x1f
    4314:	00a4f7b3          	and	a5,s1,a0
    4318:	40f584b3          	sub	s1,a1,a5
    431c:	04904663          	bgtz	s1,4368 <_vfprintf_r+0x25b0>
    4320:	00bc0c33          	add	s8,s8,a1
    4324:	f7404ce3          	bgtz	s4,429c <_vfprintf_r+0x24e4>
    4328:	f6804ce3          	bgtz	s0,42a0 <_vfprintf_r+0x24e8>
    432c:	01812783          	lw	a5,24(sp)
    4330:	000c0313          	mv	t1,s8
    4334:	02412c03          	lw	s8,36(sp)
    4338:	03712e23          	sw	s7,60(sp)
    433c:	00070413          	mv	s0,a4
    4340:	00fc0733          	add	a4,s8,a5
    4344:	05012903          	lw	s2,80(sp)
    4348:	05412e83          	lw	t4,84(sp)
    434c:	05812b83          	lw	s7,88(sp)
    4350:	05c12c83          	lw	s9,92(sp)
    4354:	00060493          	mv	s1,a2
    4358:	00676463          	bltu	a4,t1,4360 <_vfprintf_r+0x25a8>
    435c:	c59fe06f          	j	2fb4 <_vfprintf_r+0x11fc>
    4360:	00070313          	mv	t1,a4
    4364:	c51fe06f          	j	2fb4 <_vfprintf_r+0x11fc>
    4368:	0a412583          	lw	a1,164(sp)
    436c:	0000be97          	auipc	t4,0xb
    4370:	108e8e93          	add	t4,t4,264 # f474 <zeroes.0>
    4374:	069d5c63          	bge	s10,s1,43ec <_vfprintf_r+0x2634>
    4378:	02812023          	sw	s0,32(sp)
    437c:	00048413          	mv	s0,s1
    4380:	000b0493          	mv	s1,s6
    4384:	00c0006f          	j	4390 <_vfprintf_r+0x25d8>
    4388:	ff040413          	add	s0,s0,-16
    438c:	048d5a63          	bge	s10,s0,43e0 <_vfprintf_r+0x2628>
    4390:	01060613          	add	a2,a2,16
    4394:	00158593          	add	a1,a1,1
    4398:	01672023          	sw	s6,0(a4)
    439c:	01a72223          	sw	s10,4(a4)
    43a0:	0ac12423          	sw	a2,168(sp)
    43a4:	0ab12223          	sw	a1,164(sp)
    43a8:	00870713          	add	a4,a4,8
    43ac:	fcb6dee3          	bge	a3,a1,4388 <_vfprintf_r+0x25d0>
    43b0:	0a010613          	add	a2,sp,160
    43b4:	00090593          	mv	a1,s2
    43b8:	00098513          	mv	a0,s3
    43bc:	0b9000ef          	jal	4c74 <__sprint_r>
    43c0:	00050463          	beqz	a0,43c8 <_vfprintf_r+0x2610>
    43c4:	ec5fd06f          	j	2288 <_vfprintf_r+0x4d0>
    43c8:	ff040413          	add	s0,s0,-16
    43cc:	0a812603          	lw	a2,168(sp)
    43d0:	0a412583          	lw	a1,164(sp)
    43d4:	0ac10713          	add	a4,sp,172
    43d8:	00700693          	li	a3,7
    43dc:	fa8d4ae3          	blt	s10,s0,4390 <_vfprintf_r+0x25d8>
    43e0:	00048e93          	mv	t4,s1
    43e4:	00040493          	mv	s1,s0
    43e8:	02012403          	lw	s0,32(sp)
    43ec:	00960633          	add	a2,a2,s1
    43f0:	00158593          	add	a1,a1,1
    43f4:	01d72023          	sw	t4,0(a4)
    43f8:	00972223          	sw	s1,4(a4)
    43fc:	0ac12423          	sw	a2,168(sp)
    4400:	0ab12223          	sw	a1,164(sp)
    4404:	10b6ce63          	blt	a3,a1,4520 <_vfprintf_r+0x2768>
    4408:	000bc583          	lbu	a1,0(s7)
    440c:	00870713          	add	a4,a4,8
    4410:	00bc0c33          	add	s8,s8,a1
    4414:	f11ff06f          	j	4324 <_vfprintf_r+0x256c>
    4418:	fffb8b93          	add	s7,s7,-1
    441c:	fffa0a13          	add	s4,s4,-1
    4420:	e85ff06f          	j	42a4 <_vfprintf_r+0x24ec>
    4424:	0a010613          	add	a2,sp,160
    4428:	00090593          	mv	a1,s2
    442c:	00098513          	mv	a0,s3
    4430:	045000ef          	jal	4c74 <__sprint_r>
    4434:	00050463          	beqz	a0,443c <_vfprintf_r+0x2684>
    4438:	e51fd06f          	j	2288 <_vfprintf_r+0x4d0>
    443c:	0a812603          	lw	a2,168(sp)
    4440:	0ac10713          	add	a4,sp,172
    4444:	00700693          	li	a3,7
    4448:	e85ff06f          	j	42cc <_vfprintf_r+0x2514>
    444c:	0a010613          	add	a2,sp,160
    4450:	00090593          	mv	a1,s2
    4454:	00098513          	mv	a0,s3
    4458:	01d000ef          	jal	4c74 <__sprint_r>
    445c:	00050463          	beqz	a0,4464 <_vfprintf_r+0x26ac>
    4460:	e29fd06f          	j	2288 <_vfprintf_r+0x4d0>
    4464:	000bc583          	lbu	a1,0(s7)
    4468:	0a812603          	lw	a2,168(sp)
    446c:	0ac10713          	add	a4,sp,172
    4470:	00700693          	li	a3,7
    4474:	e99ff06f          	j	430c <_vfprintf_r+0x2554>
    4478:	04c12783          	lw	a5,76(sp)
    447c:	04812583          	lw	a1,72(sp)
    4480:	00000913          	li	s2,0
    4484:	40fc0c33          	sub	s8,s8,a5
    4488:	00078613          	mv	a2,a5
    448c:	000c0513          	mv	a0,s8
    4490:	1dc030ef          	jal	766c <strncpy>
    4494:	00144783          	lbu	a5,1(s0)
    4498:	00a00613          	li	a2,10
    449c:	00000693          	li	a3,0
    44a0:	00f037b3          	snez	a5,a5
    44a4:	000d0513          	mv	a0,s10
    44a8:	000c8593          	mv	a1,s9
    44ac:	00f40433          	add	s0,s0,a5
    44b0:	691060ef          	jal	b340 <__udivdi3>
    44b4:	a10ff06f          	j	36c4 <_vfprintf_r+0x190c>
    44b8:	09810713          	add	a4,sp,152
    44bc:	00000693          	li	a3,0
    44c0:	08410613          	add	a2,sp,132
    44c4:	00000593          	li	a1,0
    44c8:	00098513          	mv	a0,s3
    44cc:	01c12a23          	sw	t3,20(sp)
    44d0:	01d12823          	sw	t4,16(sp)
    44d4:	38c060ef          	jal	a860 <_wcsrtombs_r>
    44d8:	fff00713          	li	a4,-1
    44dc:	01012e83          	lw	t4,16(sp)
    44e0:	01412e03          	lw	t3,20(sp)
    44e4:	00050d13          	mv	s10,a0
    44e8:	30e50063          	beq	a0,a4,47e8 <_vfprintf_r+0x2a30>
    44ec:	09812223          	sw	s8,132(sp)
    44f0:	cacff06f          	j	399c <_vfprintf_r+0x1be4>
    44f4:	07714603          	lbu	a2,119(sp)
    44f8:	01612a23          	sw	s6,20(sp)
    44fc:	02012223          	sw	zero,36(sp)
    4500:	02012023          	sw	zero,32(sp)
    4504:	00012823          	sw	zero,16(sp)
    4508:	00000c93          	li	s9,0
    450c:	00000313          	li	t1,0
    4510:	00000a13          	li	s4,0
    4514:	00061463          	bnez	a2,451c <_vfprintf_r+0x2764>
    4518:	ae1fd06f          	j	1ff8 <_vfprintf_r+0x240>
    451c:	efdfd06f          	j	2418 <_vfprintf_r+0x660>
    4520:	0a010613          	add	a2,sp,160
    4524:	00090593          	mv	a1,s2
    4528:	00098513          	mv	a0,s3
    452c:	748000ef          	jal	4c74 <__sprint_r>
    4530:	00050463          	beqz	a0,4538 <_vfprintf_r+0x2780>
    4534:	d55fd06f          	j	2288 <_vfprintf_r+0x4d0>
    4538:	000bc583          	lbu	a1,0(s7)
    453c:	0a812603          	lw	a2,168(sp)
    4540:	0ac10713          	add	a4,sp,172
    4544:	00700693          	li	a3,7
    4548:	00bc0c33          	add	s8,s8,a1
    454c:	dd9ff06f          	j	4324 <_vfprintf_r+0x256c>
    4550:	00812583          	lw	a1,8(sp)
    4554:	0a010613          	add	a2,sp,160
    4558:	00098513          	mv	a0,s3
    455c:	05d12223          	sw	t4,68(sp)
    4560:	714000ef          	jal	4c74 <__sprint_r>
    4564:	00050463          	beqz	a0,456c <_vfprintf_r+0x27b4>
    4568:	d21fd06f          	j	2288 <_vfprintf_r+0x4d0>
    456c:	0a812483          	lw	s1,168(sp)
    4570:	04412e83          	lw	t4,68(sp)
    4574:	0ac10413          	add	s0,sp,172
    4578:	a19fe06f          	j	2f90 <_vfprintf_r+0x11d8>
    457c:	00900793          	li	a5,9
    4580:	95a7e263          	bltu	a5,s10,36c4 <_vfprintf_r+0x190c>
    4584:	98cff06f          	j	3710 <_vfprintf_r+0x1958>
    4588:	07c12a03          	lw	s4,124(sp)
    458c:	00070793          	mv	a5,a4
    4590:	9f1ff06f          	j	3f80 <_vfprintf_r+0x21c8>
    4594:	00812583          	lw	a1,8(sp)
    4598:	0a010613          	add	a2,sp,160
    459c:	00098513          	mv	a0,s3
    45a0:	03d12023          	sw	t4,32(sp)
    45a4:	6d0000ef          	jal	4c74 <__sprint_r>
    45a8:	00050463          	beqz	a0,45b0 <_vfprintf_r+0x27f8>
    45ac:	cddfd06f          	j	2288 <_vfprintf_r+0x4d0>
    45b0:	07c12d03          	lw	s10,124(sp)
    45b4:	01812783          	lw	a5,24(sp)
    45b8:	0a812483          	lw	s1,168(sp)
    45bc:	02012e83          	lw	t4,32(sp)
    45c0:	0ac10413          	add	s0,sp,172
    45c4:	41a78d33          	sub	s10,a5,s10
    45c8:	a49fe06f          	j	3010 <_vfprintf_r+0x1258>
    45cc:	00650733          	add	a4,a0,t1
    45d0:	04700d13          	li	s10,71
    45d4:	94dff06f          	j	3f20 <_vfprintf_r+0x2168>
    45d8:	02812603          	lw	a2,40(sp)
    45dc:	00048593          	mv	a1,s1
    45e0:	00000693          	li	a3,0
    45e4:	00060513          	mv	a0,a2
    45e8:	00000613          	li	a2,0
    45ec:	04e12823          	sw	a4,80(sp)
    45f0:	02612223          	sw	t1,36(sp)
    45f4:	03c12023          	sw	t3,32(sp)
    45f8:	01d12c23          	sw	t4,24(sp)
    45fc:	3bd080ef          	jal	d1b8 <__eqdf2>
    4600:	01812e83          	lw	t4,24(sp)
    4604:	02012e03          	lw	t3,32(sp)
    4608:	02412303          	lw	t1,36(sp)
    460c:	05012703          	lw	a4,80(sp)
    4610:	34051e63          	bnez	a0,496c <_vfprintf_r+0x2bb4>
    4614:	07c12a03          	lw	s4,124(sp)
    4618:	01470733          	add	a4,a4,s4
    461c:	418707b3          	sub	a5,a4,s8
    4620:	00f12c23          	sw	a5,24(sp)
    4624:	001ef713          	and	a4,t4,1
    4628:	00676733          	or	a4,a4,t1
    462c:	37405a63          	blez	s4,49a0 <_vfprintf_r+0x2be8>
    4630:	26071263          	bnez	a4,4894 <_vfprintf_r+0x2adc>
    4634:	000a0d13          	mv	s10,s4
    4638:	06600e13          	li	t3,102
    463c:	400eff13          	and	t5,t4,1024
    4640:	1c0f1a63          	bnez	t5,4814 <_vfprintf_r+0x2a5c>
    4644:	fffd4813          	not	a6,s10
    4648:	41f85813          	sra	a6,a6,0x1f
    464c:	010d7cb3          	and	s9,s10,a6
    4650:	bd9ff06f          	j	4228 <_vfprintf_r+0x2470>
    4654:	01812783          	lw	a5,24(sp)
    4658:	03012703          	lw	a4,48(sp)
    465c:	06700e13          	li	t3,103
    4660:	00e78d33          	add	s10,a5,a4
    4664:	fd404ce3          	bgtz	s4,463c <_vfprintf_r+0x2884>
    4668:	414d06b3          	sub	a3,s10,s4
    466c:	00168d13          	add	s10,a3,1
    4670:	fffd4813          	not	a6,s10
    4674:	41f85813          	sra	a6,a6,0x1f
    4678:	010d7cb3          	and	s9,s10,a6
    467c:	badff06f          	j	4228 <_vfprintf_r+0x2470>
    4680:	000e8613          	mv	a2,t4
    4684:	ad8fe06f          	j	295c <_vfprintf_r+0xba4>
    4688:	00812783          	lw	a5,8(sp)
    468c:	0647a783          	lw	a5,100(a5)
    4690:	0017f793          	and	a5,a5,1
    4694:	02079063          	bnez	a5,46b4 <_vfprintf_r+0x28fc>
    4698:	00812783          	lw	a5,8(sp)
    469c:	00c7d783          	lhu	a5,12(a5)
    46a0:	2007f793          	and	a5,a5,512
    46a4:	00079863          	bnez	a5,46b4 <_vfprintf_r+0x28fc>
    46a8:	00812783          	lw	a5,8(sp)
    46ac:	0587a503          	lw	a0,88(a5)
    46b0:	fb0fc0ef          	jal	e60 <__retarget_lock_release_recursive>
    46b4:	fff00793          	li	a5,-1
    46b8:	00f12623          	sw	a5,12(sp)
    46bc:	c2dfd06f          	j	22e8 <_vfprintf_r+0x530>
    46c0:	ff000613          	li	a2,-16
    46c4:	40d00d33          	neg	s10,a3
    46c8:	0000b297          	auipc	t0,0xb
    46cc:	dac28293          	add	t0,t0,-596 # f474 <zeroes.0>
    46d0:	08c6d463          	bge	a3,a2,4758 <_vfprintf_r+0x29a0>
    46d4:	03212023          	sw	s2,32(sp)
    46d8:	01000693          	li	a3,16
    46dc:	00700b13          	li	s6,7
    46e0:	000e8a13          	mv	s4,t4
    46e4:	00028913          	mv	s2,t0
    46e8:	00c0006f          	j	46f4 <_vfprintf_r+0x293c>
    46ec:	ff0d0d13          	add	s10,s10,-16
    46f0:	05a6de63          	bge	a3,s10,474c <_vfprintf_r+0x2994>
    46f4:	01048493          	add	s1,s1,16
    46f8:	00170713          	add	a4,a4,1
    46fc:	01242023          	sw	s2,0(s0)
    4700:	00d42223          	sw	a3,4(s0)
    4704:	0a912423          	sw	s1,168(sp)
    4708:	0ae12223          	sw	a4,164(sp)
    470c:	00840413          	add	s0,s0,8
    4710:	fceb5ee3          	bge	s6,a4,46ec <_vfprintf_r+0x2934>
    4714:	00812583          	lw	a1,8(sp)
    4718:	0a010613          	add	a2,sp,160
    471c:	00098513          	mv	a0,s3
    4720:	554000ef          	jal	4c74 <__sprint_r>
    4724:	00050463          	beqz	a0,472c <_vfprintf_r+0x2974>
    4728:	b61fd06f          	j	2288 <_vfprintf_r+0x4d0>
    472c:	0a812483          	lw	s1,168(sp)
    4730:	0a412703          	lw	a4,164(sp)
    4734:	0ac10413          	add	s0,sp,172
    4738:	01000693          	li	a3,16
    473c:	fb1ff06f          	j	46ec <_vfprintf_r+0x2934>
    4740:	00012823          	sw	zero,16(sp)
    4744:	0ec10c13          	add	s8,sp,236
    4748:	a88ff06f          	j	39d0 <_vfprintf_r+0x1c18>
    474c:	00090293          	mv	t0,s2
    4750:	02012903          	lw	s2,32(sp)
    4754:	000a0e93          	mv	t4,s4
    4758:	01a484b3          	add	s1,s1,s10
    475c:	00170713          	add	a4,a4,1
    4760:	00542023          	sw	t0,0(s0)
    4764:	01a42223          	sw	s10,4(s0)
    4768:	0a912423          	sw	s1,168(sp)
    476c:	0ae12223          	sw	a4,164(sp)
    4770:	00700693          	li	a3,7
    4774:	00e6c463          	blt	a3,a4,477c <_vfprintf_r+0x29c4>
    4778:	b65fe06f          	j	32dc <_vfprintf_r+0x1524>
    477c:	00812583          	lw	a1,8(sp)
    4780:	0a010613          	add	a2,sp,160
    4784:	00098513          	mv	a0,s3
    4788:	03d12023          	sw	t4,32(sp)
    478c:	4e8000ef          	jal	4c74 <__sprint_r>
    4790:	00050463          	beqz	a0,4798 <_vfprintf_r+0x29e0>
    4794:	af5fd06f          	j	2288 <_vfprintf_r+0x4d0>
    4798:	0a812483          	lw	s1,168(sp)
    479c:	0a412703          	lw	a4,164(sp)
    47a0:	02012e83          	lw	t4,32(sp)
    47a4:	0ac10413          	add	s0,sp,172
    47a8:	b20ff06f          	j	3ac8 <_vfprintf_r+0x1d10>
    47ac:	08a10693          	add	a3,sp,138
    47b0:	00061863          	bnez	a2,47c0 <_vfprintf_r+0x2a08>
    47b4:	03000693          	li	a3,48
    47b8:	08d10523          	sb	a3,138(sp)
    47bc:	08b10693          	add	a3,sp,139
    47c0:	15010793          	add	a5,sp,336
    47c4:	40f68633          	sub	a2,a3,a5
    47c8:	030d0713          	add	a4,s10,48
    47cc:	0c960793          	add	a5,a2,201
    47d0:	00e68023          	sb	a4,0(a3)
    47d4:	04f12023          	sw	a5,64(sp)
    47d8:	d5cff06f          	j	3d34 <_vfprintf_r+0x1f7c>
    47dc:	001ef713          	and	a4,t4,1
    47e0:	d6070863          	beqz	a4,3d50 <_vfprintf_r+0x1f98>
    47e4:	d64ff06f          	j	3d48 <_vfprintf_r+0x1f90>
    47e8:	00812783          	lw	a5,8(sp)
    47ec:	00000293          	li	t0,0
    47f0:	00c79783          	lh	a5,12(a5)
    47f4:	0407e793          	or	a5,a5,64
    47f8:	00812703          	lw	a4,8(sp)
    47fc:	00f71623          	sh	a5,12(a4)
    4800:	a8dfd06f          	j	228c <_vfprintf_r+0x4d4>
    4804:	00012823          	sw	zero,16(sp)
    4808:	00600313          	li	t1,6
    480c:	ff9fe06f          	j	3804 <_vfprintf_r+0x1a4c>
    4810:	06700e13          	li	t3,103
    4814:	03c12783          	lw	a5,60(sp)
    4818:	0ff00613          	li	a2,255
    481c:	0007c703          	lbu	a4,0(a5)
    4820:	22c70263          	beq	a4,a2,4a44 <_vfprintf_r+0x2c8c>
    4824:	00000593          	li	a1,0
    4828:	00000693          	li	a3,0
    482c:	01475e63          	bge	a4,s4,4848 <_vfprintf_r+0x2a90>
    4830:	40ea0a33          	sub	s4,s4,a4
    4834:	0017c703          	lbu	a4,1(a5)
    4838:	04070863          	beqz	a4,4888 <_vfprintf_r+0x2ad0>
    483c:	00168693          	add	a3,a3,1
    4840:	00178793          	add	a5,a5,1
    4844:	fec714e3          	bne	a4,a2,482c <_vfprintf_r+0x2a74>
    4848:	02f12e23          	sw	a5,60(sp)
    484c:	02d12023          	sw	a3,32(sp)
    4850:	02b12223          	sw	a1,36(sp)
    4854:	02012783          	lw	a5,32(sp)
    4858:	02412703          	lw	a4,36(sp)
    485c:	04c12583          	lw	a1,76(sp)
    4860:	05c12823          	sw	t3,80(sp)
    4864:	00e78533          	add	a0,a5,a4
    4868:	2ac0a0ef          	jal	eb14 <__mulsi3>
    486c:	01a50d33          	add	s10,a0,s10
    4870:	fffd4813          	not	a6,s10
    4874:	41f85813          	sra	a6,a6,0x1f
    4878:	05012e03          	lw	t3,80(sp)
    487c:	010d7cb3          	and	s9,s10,a6
    4880:	000b0e93          	mv	t4,s6
    4884:	cecff06f          	j	3d70 <_vfprintf_r+0x1fb8>
    4888:	0007c703          	lbu	a4,0(a5)
    488c:	00158593          	add	a1,a1,1
    4890:	fb5ff06f          	j	4844 <_vfprintf_r+0x2a8c>
    4894:	03012783          	lw	a5,48(sp)
    4898:	06600e13          	li	t3,102
    489c:	00f306b3          	add	a3,t1,a5
    48a0:	01468d33          	add	s10,a3,s4
    48a4:	d99ff06f          	j	463c <_vfprintf_r+0x2884>
    48a8:	02c12783          	lw	a5,44(sp)
    48ac:	0a07c863          	bltz	a5,495c <_vfprintf_r+0x2ba4>
    48b0:	07714603          	lbu	a2,119(sp)
    48b4:	04700713          	li	a4,71
    48b8:	0000ac17          	auipc	s8,0xa
    48bc:	6d0c0c13          	add	s8,s8,1744 # ef88 <__fini_array_end+0x27c>
    48c0:	01c75463          	bge	a4,t3,48c8 <_vfprintf_r+0x2b10>
    48c4:	b31fd06f          	j	23f4 <_vfprintf_r+0x63c>
    48c8:	0000ac17          	auipc	s8,0xa
    48cc:	6bcc0c13          	add	s8,s8,1724 # ef84 <__fini_array_end+0x278>
    48d0:	b25fd06f          	j	23f4 <_vfprintf_r+0x63c>
    48d4:	07714603          	lbu	a2,119(sp)
    48d8:	01612a23          	sw	s6,20(sp)
    48dc:	02012223          	sw	zero,36(sp)
    48e0:	02012023          	sw	zero,32(sp)
    48e4:	00030c93          	mv	s9,t1
    48e8:	00030d13          	mv	s10,t1
    48ec:	07300e13          	li	t3,115
    48f0:	00000313          	li	t1,0
    48f4:	00061463          	bnez	a2,48fc <_vfprintf_r+0x2b44>
    48f8:	f00fd06f          	j	1ff8 <_vfprintf_r+0x240>
    48fc:	b1dfd06f          	j	2418 <_vfprintf_r+0x660>
    4900:	00040313          	mv	t1,s0
    4904:	01012903          	lw	s2,16(sp)
    4908:	000b0413          	mv	s0,s6
    490c:	01412e03          	lw	t3,20(sp)
    4910:	000c0b13          	mv	s6,s8
    4914:	000a0e93          	mv	t4,s4
    4918:	000c8c13          	mv	s8,s9
    491c:	00030d13          	mv	s10,t1
    4920:	87cff06f          	j	399c <_vfprintf_r+0x1be4>
    4924:	001b0793          	add	a5,s6,1
    4928:	000c0993          	mv	s3,s8
    492c:	02412903          	lw	s2,36(sp)
    4930:	04012e83          	lw	t4,64(sp)
    4934:	05012e03          	lw	t3,80(sp)
    4938:	05412403          	lw	s0,84(sp)
    493c:	000d0c13          	mv	s8,s10
    4940:	00f487b3          	add	a5,s1,a5
    4944:	03000693          	li	a3,48
    4948:	840b40e3          	bltz	s6,4188 <_vfprintf_r+0x23d0>
    494c:	00148493          	add	s1,s1,1
    4950:	fed48fa3          	sb	a3,-1(s1)
    4954:	fe979ce3          	bne	a5,s1,494c <_vfprintf_r+0x2b94>
    4958:	835ff06f          	j	418c <_vfprintf_r+0x23d4>
    495c:	02d00793          	li	a5,45
    4960:	06f10ba3          	sb	a5,119(sp)
    4964:	02d00613          	li	a2,45
    4968:	f4dff06f          	j	48b4 <_vfprintf_r+0x2afc>
    496c:	00100693          	li	a3,1
    4970:	414686b3          	sub	a3,a3,s4
    4974:	06d12e23          	sw	a3,124(sp)
    4978:	da4ff06f          	j	3f1c <_vfprintf_r+0x2164>
    497c:	01412783          	lw	a5,20(sp)
    4980:	0007ab03          	lw	s6,0(a5)
    4984:	00478793          	add	a5,a5,4
    4988:	000b5463          	bgez	s6,4990 <_vfprintf_r+0x2bd8>
    498c:	fff00b13          	li	s6,-1
    4990:	00194e03          	lbu	t3,1(s2)
    4994:	00f12a23          	sw	a5,20(sp)
    4998:	00068913          	mv	s2,a3
    499c:	dccfd06f          	j	1f68 <_vfprintf_r+0x1b0>
    49a0:	00071a63          	bnez	a4,49b4 <_vfprintf_r+0x2bfc>
    49a4:	00100c93          	li	s9,1
    49a8:	06600e13          	li	t3,102
    49ac:	00100d13          	li	s10,1
    49b0:	879ff06f          	j	4228 <_vfprintf_r+0x2470>
    49b4:	03012783          	lw	a5,48(sp)
    49b8:	06600e13          	li	t3,102
    49bc:	00178693          	add	a3,a5,1
    49c0:	00668d33          	add	s10,a3,t1
    49c4:	fffd4813          	not	a6,s10
    49c8:	41f85813          	sra	a6,a6,0x1f
    49cc:	010d7cb3          	and	s9,s10,a6
    49d0:	859ff06f          	j	4228 <_vfprintf_r+0x2470>
    49d4:	00200793          	li	a5,2
    49d8:	04f12023          	sw	a5,64(sp)
    49dc:	b58ff06f          	j	3d34 <_vfprintf_r+0x1f7c>
    49e0:	00812703          	lw	a4,8(sp)
    49e4:	00c71783          	lh	a5,12(a4)
    49e8:	0407e793          	or	a5,a5,64
    49ec:	00f71623          	sh	a5,12(a4)
    49f0:	8b5fd06f          	j	22a4 <_vfprintf_r+0x4ec>
    49f4:	000a0513          	mv	a0,s4
    49f8:	000d0593          	mv	a1,s10
    49fc:	00030613          	mv	a2,t1
    4a00:	00038693          	mv	a3,t2
    4a04:	05012023          	sw	a6,64(sp)
    4a08:	03c12223          	sw	t3,36(sp)
    4a0c:	01d12c23          	sw	t4,24(sp)
    4a10:	7a8080ef          	jal	d1b8 <__eqdf2>
    4a14:	01812e83          	lw	t4,24(sp)
    4a18:	02412e03          	lw	t3,36(sp)
    4a1c:	04012803          	lw	a6,64(sp)
    4a20:	f6051463          	bnez	a0,4188 <_vfprintf_r+0x23d0>
    4a24:	001b7693          	and	a3,s6,1
    4a28:	f6068063          	beqz	a3,4188 <_vfprintf_r+0x23d0>
    4a2c:	f14ff06f          	j	4140 <_vfprintf_r+0x2388>
    4a30:	00812783          	lw	a5,8(sp)
    4a34:	01012283          	lw	t0,16(sp)
    4a38:	00c79783          	lh	a5,12(a5)
    4a3c:	0407e793          	or	a5,a5,64
    4a40:	db9ff06f          	j	47f8 <_vfprintf_r+0x2a40>
    4a44:	02012223          	sw	zero,36(sp)
    4a48:	02012023          	sw	zero,32(sp)
    4a4c:	e09ff06f          	j	4854 <_vfprintf_r+0x2a9c>
    4a50:	04500d13          	li	s10,69
    4a54:	cccff06f          	j	3f20 <_vfprintf_r+0x2168>

00004a58 <__sbprintf>:
    4a58:	b7010113          	add	sp,sp,-1168
    4a5c:	00c59783          	lh	a5,12(a1)
    4a60:	00e5d703          	lhu	a4,14(a1)
    4a64:	48812423          	sw	s0,1160(sp)
    4a68:	00058413          	mv	s0,a1
    4a6c:	000105b7          	lui	a1,0x10
    4a70:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x79d>
    4a74:	06442303          	lw	t1,100(s0)
    4a78:	01c42883          	lw	a7,28(s0)
    4a7c:	02442803          	lw	a6,36(s0)
    4a80:	01071713          	sll	a4,a4,0x10
    4a84:	00b7f7b3          	and	a5,a5,a1
    4a88:	00e7e7b3          	or	a5,a5,a4
    4a8c:	40000593          	li	a1,1024
    4a90:	49212023          	sw	s2,1152(sp)
    4a94:	00f12a23          	sw	a5,20(sp)
    4a98:	00050913          	mv	s2,a0
    4a9c:	07010793          	add	a5,sp,112
    4aa0:	06010513          	add	a0,sp,96
    4aa4:	48112623          	sw	ra,1164(sp)
    4aa8:	48912223          	sw	s1,1156(sp)
    4aac:	47312e23          	sw	s3,1148(sp)
    4ab0:	00060493          	mv	s1,a2
    4ab4:	00068993          	mv	s3,a3
    4ab8:	06612623          	sw	t1,108(sp)
    4abc:	03112223          	sw	a7,36(sp)
    4ac0:	03012623          	sw	a6,44(sp)
    4ac4:	00f12423          	sw	a5,8(sp)
    4ac8:	00f12c23          	sw	a5,24(sp)
    4acc:	00b12823          	sw	a1,16(sp)
    4ad0:	00b12e23          	sw	a1,28(sp)
    4ad4:	02012023          	sw	zero,32(sp)
    4ad8:	b7cfc0ef          	jal	e54 <__retarget_lock_init_recursive>
    4adc:	00048613          	mv	a2,s1
    4ae0:	00098693          	mv	a3,s3
    4ae4:	00810593          	add	a1,sp,8
    4ae8:	00090513          	mv	a0,s2
    4aec:	accfd0ef          	jal	1db8 <_vfprintf_r>
    4af0:	00050493          	mv	s1,a0
    4af4:	04055263          	bgez	a0,4b38 <__sbprintf+0xe0>
    4af8:	01415783          	lhu	a5,20(sp)
    4afc:	0407f793          	and	a5,a5,64
    4b00:	00078863          	beqz	a5,4b10 <__sbprintf+0xb8>
    4b04:	00c45783          	lhu	a5,12(s0)
    4b08:	0407e793          	or	a5,a5,64
    4b0c:	00f41623          	sh	a5,12(s0)
    4b10:	06012503          	lw	a0,96(sp)
    4b14:	b44fc0ef          	jal	e58 <__retarget_lock_close_recursive>
    4b18:	48c12083          	lw	ra,1164(sp)
    4b1c:	48812403          	lw	s0,1160(sp)
    4b20:	48012903          	lw	s2,1152(sp)
    4b24:	47c12983          	lw	s3,1148(sp)
    4b28:	00048513          	mv	a0,s1
    4b2c:	48412483          	lw	s1,1156(sp)
    4b30:	49010113          	add	sp,sp,1168
    4b34:	00008067          	ret
    4b38:	00810593          	add	a1,sp,8
    4b3c:	00090513          	mv	a0,s2
    4b40:	449010ef          	jal	6788 <_fflush_r>
    4b44:	fa050ae3          	beqz	a0,4af8 <__sbprintf+0xa0>
    4b48:	fff00493          	li	s1,-1
    4b4c:	fadff06f          	j	4af8 <__sbprintf+0xa0>

00004b50 <__sprint_r.part.0>:
    4b50:	0645a783          	lw	a5,100(a1)
    4b54:	fd010113          	add	sp,sp,-48
    4b58:	01612823          	sw	s6,16(sp)
    4b5c:	02112623          	sw	ra,44(sp)
    4b60:	01279713          	sll	a4,a5,0x12
    4b64:	00060b13          	mv	s6,a2
    4b68:	0e075863          	bgez	a4,4c58 <__sprint_r.part.0+0x108>
    4b6c:	00862783          	lw	a5,8(a2)
    4b70:	03212023          	sw	s2,32(sp)
    4b74:	01312e23          	sw	s3,28(sp)
    4b78:	01512a23          	sw	s5,20(sp)
    4b7c:	01712623          	sw	s7,12(sp)
    4b80:	00058913          	mv	s2,a1
    4b84:	00062b83          	lw	s7,0(a2)
    4b88:	00050993          	mv	s3,a0
    4b8c:	fff00a93          	li	s5,-1
    4b90:	0a078863          	beqz	a5,4c40 <__sprint_r.part.0+0xf0>
    4b94:	02812423          	sw	s0,40(sp)
    4b98:	02912223          	sw	s1,36(sp)
    4b9c:	01412c23          	sw	s4,24(sp)
    4ba0:	01812423          	sw	s8,8(sp)
    4ba4:	004bac03          	lw	s8,4(s7)
    4ba8:	000ba403          	lw	s0,0(s7)
    4bac:	002c5a13          	srl	s4,s8,0x2
    4bb0:	060a0663          	beqz	s4,4c1c <__sprint_r.part.0+0xcc>
    4bb4:	00000493          	li	s1,0
    4bb8:	00c0006f          	j	4bc4 <__sprint_r.part.0+0x74>
    4bbc:	00440413          	add	s0,s0,4
    4bc0:	049a0c63          	beq	s4,s1,4c18 <__sprint_r.part.0+0xc8>
    4bc4:	00042583          	lw	a1,0(s0)
    4bc8:	00090613          	mv	a2,s2
    4bcc:	00098513          	mv	a0,s3
    4bd0:	10d020ef          	jal	74dc <_fputwc_r>
    4bd4:	00148493          	add	s1,s1,1
    4bd8:	ff5512e3          	bne	a0,s5,4bbc <__sprint_r.part.0+0x6c>
    4bdc:	02812403          	lw	s0,40(sp)
    4be0:	02412483          	lw	s1,36(sp)
    4be4:	02012903          	lw	s2,32(sp)
    4be8:	01c12983          	lw	s3,28(sp)
    4bec:	01812a03          	lw	s4,24(sp)
    4bf0:	01412a83          	lw	s5,20(sp)
    4bf4:	00c12b83          	lw	s7,12(sp)
    4bf8:	00812c03          	lw	s8,8(sp)
    4bfc:	fff00513          	li	a0,-1
    4c00:	02c12083          	lw	ra,44(sp)
    4c04:	000b2423          	sw	zero,8(s6)
    4c08:	000b2223          	sw	zero,4(s6)
    4c0c:	01012b03          	lw	s6,16(sp)
    4c10:	03010113          	add	sp,sp,48
    4c14:	00008067          	ret
    4c18:	008b2783          	lw	a5,8(s6)
    4c1c:	ffcc7c13          	and	s8,s8,-4
    4c20:	418787b3          	sub	a5,a5,s8
    4c24:	00fb2423          	sw	a5,8(s6)
    4c28:	008b8b93          	add	s7,s7,8
    4c2c:	f6079ce3          	bnez	a5,4ba4 <__sprint_r.part.0+0x54>
    4c30:	02812403          	lw	s0,40(sp)
    4c34:	02412483          	lw	s1,36(sp)
    4c38:	01812a03          	lw	s4,24(sp)
    4c3c:	00812c03          	lw	s8,8(sp)
    4c40:	02012903          	lw	s2,32(sp)
    4c44:	01c12983          	lw	s3,28(sp)
    4c48:	01412a83          	lw	s5,20(sp)
    4c4c:	00c12b83          	lw	s7,12(sp)
    4c50:	00000513          	li	a0,0
    4c54:	fadff06f          	j	4c00 <__sprint_r.part.0+0xb0>
    4c58:	6b5010ef          	jal	6b0c <__sfvwrite_r>
    4c5c:	02c12083          	lw	ra,44(sp)
    4c60:	000b2423          	sw	zero,8(s6)
    4c64:	000b2223          	sw	zero,4(s6)
    4c68:	01012b03          	lw	s6,16(sp)
    4c6c:	03010113          	add	sp,sp,48
    4c70:	00008067          	ret

00004c74 <__sprint_r>:
    4c74:	00862703          	lw	a4,8(a2)
    4c78:	00070463          	beqz	a4,4c80 <__sprint_r+0xc>
    4c7c:	ed5ff06f          	j	4b50 <__sprint_r.part.0>
    4c80:	00062223          	sw	zero,4(a2)
    4c84:	00000513          	li	a0,0
    4c88:	00008067          	ret

00004c8c <_vfiprintf_r>:
    4c8c:	eb010113          	add	sp,sp,-336
    4c90:	14812423          	sw	s0,328(sp)
    4c94:	13312e23          	sw	s3,316(sp)
    4c98:	13812423          	sw	s8,296(sp)
    4c9c:	00050413          	mv	s0,a0
    4ca0:	00058993          	mv	s3,a1
    4ca4:	00060c13          	mv	s8,a2
    4ca8:	00000593          	li	a1,0
    4cac:	00800613          	li	a2,8
    4cb0:	05010513          	add	a0,sp,80
    4cb4:	13512a23          	sw	s5,308(sp)
    4cb8:	14112623          	sw	ra,332(sp)
    4cbc:	00068a93          	mv	s5,a3
    4cc0:	9a4fc0ef          	jal	e64 <memset>
    4cc4:	00040863          	beqz	s0,4cd4 <_vfiprintf_r+0x48>
    4cc8:	03442783          	lw	a5,52(s0)
    4ccc:	00079463          	bnez	a5,4cd4 <_vfiprintf_r+0x48>
    4cd0:	49c0106f          	j	616c <_vfiprintf_r+0x14e0>
    4cd4:	0649a703          	lw	a4,100(s3)
    4cd8:	00c99783          	lh	a5,12(s3)
    4cdc:	00177713          	and	a4,a4,1
    4ce0:	00071863          	bnez	a4,4cf0 <_vfiprintf_r+0x64>
    4ce4:	2007f713          	and	a4,a5,512
    4ce8:	00071463          	bnez	a4,4cf0 <_vfiprintf_r+0x64>
    4cec:	0b80106f          	j	5da4 <_vfiprintf_r+0x1118>
    4cf0:	01279713          	sll	a4,a5,0x12
    4cf4:	02074663          	bltz	a4,4d20 <_vfiprintf_r+0x94>
    4cf8:	0649a703          	lw	a4,100(s3)
    4cfc:	00002637          	lui	a2,0x2
    4d00:	ffffe6b7          	lui	a3,0xffffe
    4d04:	00c7e7b3          	or	a5,a5,a2
    4d08:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4d0c:	01079793          	sll	a5,a5,0x10
    4d10:	4107d793          	sra	a5,a5,0x10
    4d14:	00d77733          	and	a4,a4,a3
    4d18:	00f99623          	sh	a5,12(s3)
    4d1c:	06e9a223          	sw	a4,100(s3)
    4d20:	0087f713          	and	a4,a5,8
    4d24:	2e070463          	beqz	a4,500c <_vfiprintf_r+0x380>
    4d28:	0109a703          	lw	a4,16(s3)
    4d2c:	2e070063          	beqz	a4,500c <_vfiprintf_r+0x380>
    4d30:	01a7f713          	and	a4,a5,26
    4d34:	00a00693          	li	a3,10
    4d38:	2ed70c63          	beq	a4,a3,5030 <_vfiprintf_r+0x3a4>
    4d3c:	13412c23          	sw	s4,312(sp)
    4d40:	06c10a13          	add	s4,sp,108
    4d44:	14912223          	sw	s1,324(sp)
    4d48:	15212023          	sw	s2,320(sp)
    4d4c:	13612823          	sw	s6,304(sp)
    4d50:	13712623          	sw	s7,300(sp)
    4d54:	13912223          	sw	s9,292(sp)
    4d58:	13a12023          	sw	s10,288(sp)
    4d5c:	000c0c93          	mv	s9,s8
    4d60:	11b12e23          	sw	s11,284(sp)
    4d64:	07412023          	sw	s4,96(sp)
    4d68:	06012423          	sw	zero,104(sp)
    4d6c:	06012223          	sw	zero,100(sp)
    4d70:	00012a23          	sw	zero,20(sp)
    4d74:	02012623          	sw	zero,44(sp)
    4d78:	02012823          	sw	zero,48(sp)
    4d7c:	02012a23          	sw	zero,52(sp)
    4d80:	00012623          	sw	zero,12(sp)
    4d84:	7fffb497          	auipc	s1,0x7fffb
    4d88:	7b048493          	add	s1,s1,1968 # 80000534 <__global_locale>
    4d8c:	02500913          	li	s2,37
    4d90:	0000ab97          	auipc	s7,0xa
    4d94:	704b8b93          	add	s7,s7,1796 # f494 <blanks.1+0x10>
    4d98:	0000bb17          	auipc	s6,0xb
    4d9c:	868b0b13          	add	s6,s6,-1944 # f600 <zeroes.0>
    4da0:	000a0c13          	mv	s8,s4
    4da4:	000c8d93          	mv	s11,s9
    4da8:	0e44ad03          	lw	s10,228(s1)
    4dac:	16d020ef          	jal	7718 <__locale_mb_cur_max>
    4db0:	00050693          	mv	a3,a0
    4db4:	05010713          	add	a4,sp,80
    4db8:	000d8613          	mv	a2,s11
    4dbc:	04810593          	add	a1,sp,72
    4dc0:	00040513          	mv	a0,s0
    4dc4:	000d00e7          	jalr	s10
    4dc8:	2e050e63          	beqz	a0,50c4 <_vfiprintf_r+0x438>
    4dcc:	2c054e63          	bltz	a0,50a8 <_vfiprintf_r+0x41c>
    4dd0:	04812783          	lw	a5,72(sp)
    4dd4:	01278663          	beq	a5,s2,4de0 <_vfiprintf_r+0x154>
    4dd8:	00ad8db3          	add	s11,s11,a0
    4ddc:	fcdff06f          	j	4da8 <_vfiprintf_r+0x11c>
    4de0:	00050d13          	mv	s10,a0
    4de4:	419d87b3          	sub	a5,s11,s9
    4de8:	2f9d9463          	bne	s11,s9,50d0 <_vfiprintf_r+0x444>
    4dec:	00000e13          	li	t3,0
    4df0:	001dc683          	lbu	a3,1(s11)
    4df4:	001d8c93          	add	s9,s11,1
    4df8:	040101a3          	sb	zero,67(sp)
    4dfc:	fff00713          	li	a4,-1
    4e00:	00000893          	li	a7,0
    4e04:	05a00d13          	li	s10,90
    4e08:	000e0d93          	mv	s11,t3
    4e0c:	001c8c93          	add	s9,s9,1
    4e10:	fe068793          	add	a5,a3,-32
    4e14:	04fd6663          	bltu	s10,a5,4e60 <_vfiprintf_r+0x1d4>
    4e18:	00279793          	sll	a5,a5,0x2
    4e1c:	017787b3          	add	a5,a5,s7
    4e20:	0007a783          	lw	a5,0(a5)
    4e24:	017787b3          	add	a5,a5,s7
    4e28:	00078067          	jr	a5
    4e2c:	00000893          	li	a7,0
    4e30:	fd068793          	add	a5,a3,-48
    4e34:	00900593          	li	a1,9
    4e38:	000cc683          	lbu	a3,0(s9)
    4e3c:	00289613          	sll	a2,a7,0x2
    4e40:	011608b3          	add	a7,a2,a7
    4e44:	00189893          	sll	a7,a7,0x1
    4e48:	011788b3          	add	a7,a5,a7
    4e4c:	fd068793          	add	a5,a3,-48
    4e50:	001c8c93          	add	s9,s9,1
    4e54:	fef5f2e3          	bgeu	a1,a5,4e38 <_vfiprintf_r+0x1ac>
    4e58:	fe068793          	add	a5,a3,-32
    4e5c:	fafd7ee3          	bgeu	s10,a5,4e18 <_vfiprintf_r+0x18c>
    4e60:	000d8e13          	mv	t3,s11
    4e64:	2c068663          	beqz	a3,5130 <_vfiprintf_r+0x4a4>
    4e68:	0ad10623          	sb	a3,172(sp)
    4e6c:	040101a3          	sb	zero,67(sp)
    4e70:	00100e93          	li	t4,1
    4e74:	00100d13          	li	s10,1
    4e78:	0ac10813          	add	a6,sp,172
    4e7c:	00012823          	sw	zero,16(sp)
    4e80:	00000713          	li	a4,0
    4e84:	00000f93          	li	t6,0
    4e88:	06412603          	lw	a2,100(sp)
    4e8c:	084e7293          	and	t0,t3,132
    4e90:	06812783          	lw	a5,104(sp)
    4e94:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x249>
    4e98:	00058f13          	mv	t5,a1
    4e9c:	00029663          	bnez	t0,4ea8 <_vfiprintf_r+0x21c>
    4ea0:	41d88db3          	sub	s11,a7,t4
    4ea4:	47b046e3          	bgtz	s11,5b10 <_vfiprintf_r+0xe84>
    4ea8:	04314583          	lbu	a1,67(sp)
    4eac:	02058a63          	beqz	a1,4ee0 <_vfiprintf_r+0x254>
    4eb0:	04310613          	add	a2,sp,67
    4eb4:	00178793          	add	a5,a5,1
    4eb8:	00100693          	li	a3,1
    4ebc:	00cc2023          	sw	a2,0(s8)
    4ec0:	00dc2223          	sw	a3,4(s8)
    4ec4:	06f12423          	sw	a5,104(sp)
    4ec8:	07e12223          	sw	t5,100(sp)
    4ecc:	00700613          	li	a2,7
    4ed0:	35e64ce3          	blt	a2,t5,5a28 <_vfiprintf_r+0xd9c>
    4ed4:	000f0613          	mv	a2,t5
    4ed8:	008c0c13          	add	s8,s8,8
    4edc:	001f0f13          	add	t5,t5,1
    4ee0:	080f8063          	beqz	t6,4f60 <_vfiprintf_r+0x2d4>
    4ee4:	00200613          	li	a2,2
    4ee8:	00278793          	add	a5,a5,2
    4eec:	04410693          	add	a3,sp,68
    4ef0:	00cc2223          	sw	a2,4(s8)
    4ef4:	00dc2023          	sw	a3,0(s8)
    4ef8:	06f12423          	sw	a5,104(sp)
    4efc:	07e12223          	sw	t5,100(sp)
    4f00:	00700613          	li	a2,7
    4f04:	3be652e3          	bge	a2,t5,5aa8 <_vfiprintf_r+0xe1c>
    4f08:	60078ae3          	beqz	a5,5d1c <_vfiprintf_r+0x1090>
    4f0c:	06010613          	add	a2,sp,96
    4f10:	00098593          	mv	a1,s3
    4f14:	00040513          	mv	a0,s0
    4f18:	03d12c23          	sw	t4,56(sp)
    4f1c:	02e12423          	sw	a4,40(sp)
    4f20:	03112223          	sw	a7,36(sp)
    4f24:	03012023          	sw	a6,32(sp)
    4f28:	00512e23          	sw	t0,28(sp)
    4f2c:	01c12c23          	sw	t3,24(sp)
    4f30:	c21ff0ef          	jal	4b50 <__sprint_r.part.0>
    4f34:	22051463          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    4f38:	06412603          	lw	a2,100(sp)
    4f3c:	06812783          	lw	a5,104(sp)
    4f40:	03812e83          	lw	t4,56(sp)
    4f44:	02812703          	lw	a4,40(sp)
    4f48:	02412883          	lw	a7,36(sp)
    4f4c:	02012803          	lw	a6,32(sp)
    4f50:	01c12283          	lw	t0,28(sp)
    4f54:	01812e03          	lw	t3,24(sp)
    4f58:	000a0c13          	mv	s8,s4
    4f5c:	00160f13          	add	t5,a2,1
    4f60:	08000593          	li	a1,128
    4f64:	06b286e3          	beq	t0,a1,57d0 <_vfiprintf_r+0xb44>
    4f68:	41a70733          	sub	a4,a4,s10
    4f6c:	1ae04ae3          	bgtz	a4,5920 <_vfiprintf_r+0xc94>
    4f70:	00fd07b3          	add	a5,s10,a5
    4f74:	010c2023          	sw	a6,0(s8)
    4f78:	01ac2223          	sw	s10,4(s8)
    4f7c:	06f12423          	sw	a5,104(sp)
    4f80:	07e12223          	sw	t5,100(sp)
    4f84:	00700713          	li	a4,7
    4f88:	03e758e3          	bge	a4,t5,57b8 <_vfiprintf_r+0xb2c>
    4f8c:	24078063          	beqz	a5,51cc <_vfiprintf_r+0x540>
    4f90:	06010613          	add	a2,sp,96
    4f94:	00098593          	mv	a1,s3
    4f98:	00040513          	mv	a0,s0
    4f9c:	03d12023          	sw	t4,32(sp)
    4fa0:	01112e23          	sw	a7,28(sp)
    4fa4:	01c12c23          	sw	t3,24(sp)
    4fa8:	ba9ff0ef          	jal	4b50 <__sprint_r.part.0>
    4fac:	1a051863          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    4fb0:	06812783          	lw	a5,104(sp)
    4fb4:	02012e83          	lw	t4,32(sp)
    4fb8:	01c12883          	lw	a7,28(sp)
    4fbc:	01812e03          	lw	t3,24(sp)
    4fc0:	000a0c13          	mv	s8,s4
    4fc4:	004e7e13          	and	t3,t3,4
    4fc8:	000e0663          	beqz	t3,4fd4 <_vfiprintf_r+0x348>
    4fcc:	41d88db3          	sub	s11,a7,t4
    4fd0:	21b04a63          	bgtz	s11,51e4 <_vfiprintf_r+0x558>
    4fd4:	01d8d463          	bge	a7,t4,4fdc <_vfiprintf_r+0x350>
    4fd8:	000e8893          	mv	a7,t4
    4fdc:	00c12703          	lw	a4,12(sp)
    4fe0:	01170733          	add	a4,a4,a7
    4fe4:	00e12623          	sw	a4,12(sp)
    4fe8:	16079063          	bnez	a5,5148 <_vfiprintf_r+0x4bc>
    4fec:	01012783          	lw	a5,16(sp)
    4ff0:	06012223          	sw	zero,100(sp)
    4ff4:	00078863          	beqz	a5,5004 <_vfiprintf_r+0x378>
    4ff8:	00078593          	mv	a1,a5
    4ffc:	00040513          	mv	a0,s0
    5000:	ab4fc0ef          	jal	12b4 <_free_r>
    5004:	000a0c13          	mv	s8,s4
    5008:	d9dff06f          	j	4da4 <_vfiprintf_r+0x118>
    500c:	00098593          	mv	a1,s3
    5010:	00040513          	mv	a0,s0
    5014:	224020ef          	jal	7238 <__swsetup_r>
    5018:	00050463          	beqz	a0,5020 <_vfiprintf_r+0x394>
    501c:	3840106f          	j	63a0 <_vfiprintf_r+0x1714>
    5020:	00c99783          	lh	a5,12(s3)
    5024:	00a00693          	li	a3,10
    5028:	01a7f713          	and	a4,a5,26
    502c:	d0d718e3          	bne	a4,a3,4d3c <_vfiprintf_r+0xb0>
    5030:	00e99703          	lh	a4,14(s3)
    5034:	d00744e3          	bltz	a4,4d3c <_vfiprintf_r+0xb0>
    5038:	0649a703          	lw	a4,100(s3)
    503c:	00177713          	and	a4,a4,1
    5040:	00071863          	bnez	a4,5050 <_vfiprintf_r+0x3c4>
    5044:	2007f793          	and	a5,a5,512
    5048:	00079463          	bnez	a5,5050 <_vfiprintf_r+0x3c4>
    504c:	2ac0106f          	j	62f8 <_vfiprintf_r+0x166c>
    5050:	000a8693          	mv	a3,s5
    5054:	000c0613          	mv	a2,s8
    5058:	00098593          	mv	a1,s3
    505c:	00040513          	mv	a0,s0
    5060:	3e4010ef          	jal	6444 <__sbprintf>
    5064:	14c12083          	lw	ra,332(sp)
    5068:	14812403          	lw	s0,328(sp)
    506c:	00a12623          	sw	a0,12(sp)
    5070:	00c12503          	lw	a0,12(sp)
    5074:	13c12983          	lw	s3,316(sp)
    5078:	13412a83          	lw	s5,308(sp)
    507c:	12812c03          	lw	s8,296(sp)
    5080:	15010113          	add	sp,sp,336
    5084:	00008067          	ret
    5088:	000aa883          	lw	a7,0(s5)
    508c:	004a8a93          	add	s5,s5,4
    5090:	3608cc63          	bltz	a7,5408 <_vfiprintf_r+0x77c>
    5094:	000cc683          	lbu	a3,0(s9)
    5098:	d75ff06f          	j	4e0c <_vfiprintf_r+0x180>
    509c:	000cc683          	lbu	a3,0(s9)
    50a0:	020ded93          	or	s11,s11,32
    50a4:	d69ff06f          	j	4e0c <_vfiprintf_r+0x180>
    50a8:	00800613          	li	a2,8
    50ac:	00000593          	li	a1,0
    50b0:	05010513          	add	a0,sp,80
    50b4:	db1fb0ef          	jal	e64 <memset>
    50b8:	00100513          	li	a0,1
    50bc:	00ad8db3          	add	s11,s11,a0
    50c0:	ce9ff06f          	j	4da8 <_vfiprintf_r+0x11c>
    50c4:	00050d13          	mv	s10,a0
    50c8:	419d87b3          	sub	a5,s11,s9
    50cc:	079d8263          	beq	s11,s9,5130 <_vfiprintf_r+0x4a4>
    50d0:	06812683          	lw	a3,104(sp)
    50d4:	06412703          	lw	a4,100(sp)
    50d8:	019c2023          	sw	s9,0(s8)
    50dc:	00d786b3          	add	a3,a5,a3
    50e0:	00170713          	add	a4,a4,1
    50e4:	00fc2223          	sw	a5,4(s8)
    50e8:	06d12423          	sw	a3,104(sp)
    50ec:	06e12223          	sw	a4,100(sp)
    50f0:	00700613          	li	a2,7
    50f4:	008c0c13          	add	s8,s8,8
    50f8:	02e65463          	bge	a2,a4,5120 <_vfiprintf_r+0x494>
    50fc:	38068ce3          	beqz	a3,5c94 <_vfiprintf_r+0x1008>
    5100:	06010613          	add	a2,sp,96
    5104:	00098593          	mv	a1,s3
    5108:	00040513          	mv	a0,s0
    510c:	00f12823          	sw	a5,16(sp)
    5110:	a41ff0ef          	jal	4b50 <__sprint_r.part.0>
    5114:	01012783          	lw	a5,16(sp)
    5118:	04051c63          	bnez	a0,5170 <_vfiprintf_r+0x4e4>
    511c:	000a0c13          	mv	s8,s4
    5120:	00c12703          	lw	a4,12(sp)
    5124:	00f707b3          	add	a5,a4,a5
    5128:	00f12623          	sw	a5,12(sp)
    512c:	cc0d10e3          	bnez	s10,4dec <_vfiprintf_r+0x160>
    5130:	06812783          	lw	a5,104(sp)
    5134:	00078463          	beqz	a5,513c <_vfiprintf_r+0x4b0>
    5138:	22c0106f          	j	6364 <_vfiprintf_r+0x16d8>
    513c:	00c99783          	lh	a5,12(s3)
    5140:	06012223          	sw	zero,100(sp)
    5144:	0300006f          	j	5174 <_vfiprintf_r+0x4e8>
    5148:	06010613          	add	a2,sp,96
    514c:	00098593          	mv	a1,s3
    5150:	00040513          	mv	a0,s0
    5154:	9fdff0ef          	jal	4b50 <__sprint_r.part.0>
    5158:	e8050ae3          	beqz	a0,4fec <_vfiprintf_r+0x360>
    515c:	01012783          	lw	a5,16(sp)
    5160:	00078863          	beqz	a5,5170 <_vfiprintf_r+0x4e4>
    5164:	01012583          	lw	a1,16(sp)
    5168:	00040513          	mv	a0,s0
    516c:	948fc0ef          	jal	12b4 <_free_r>
    5170:	00c99783          	lh	a5,12(s3)
    5174:	0649a703          	lw	a4,100(s3)
    5178:	00177713          	and	a4,a4,1
    517c:	16070a63          	beqz	a4,52f0 <_vfiprintf_r+0x664>
    5180:	0407f793          	and	a5,a5,64
    5184:	14412483          	lw	s1,324(sp)
    5188:	14012903          	lw	s2,320(sp)
    518c:	13812a03          	lw	s4,312(sp)
    5190:	13012b03          	lw	s6,304(sp)
    5194:	12c12b83          	lw	s7,300(sp)
    5198:	12412c83          	lw	s9,292(sp)
    519c:	12012d03          	lw	s10,288(sp)
    51a0:	11c12d83          	lw	s11,284(sp)
    51a4:	00078463          	beqz	a5,51ac <_vfiprintf_r+0x520>
    51a8:	2180106f          	j	63c0 <_vfiprintf_r+0x1734>
    51ac:	14c12083          	lw	ra,332(sp)
    51b0:	14812403          	lw	s0,328(sp)
    51b4:	00c12503          	lw	a0,12(sp)
    51b8:	13c12983          	lw	s3,316(sp)
    51bc:	13412a83          	lw	s5,308(sp)
    51c0:	12812c03          	lw	s8,296(sp)
    51c4:	15010113          	add	sp,sp,336
    51c8:	00008067          	ret
    51cc:	06012223          	sw	zero,100(sp)
    51d0:	004e7e13          	and	t3,t3,4
    51d4:	240e0ee3          	beqz	t3,5c30 <_vfiprintf_r+0xfa4>
    51d8:	41d88db3          	sub	s11,a7,t4
    51dc:	25b05ae3          	blez	s11,5c30 <_vfiprintf_r+0xfa4>
    51e0:	000a0c13          	mv	s8,s4
    51e4:	01000713          	li	a4,16
    51e8:	06412683          	lw	a3,100(sp)
    51ec:	01b74463          	blt	a4,s11,51f4 <_vfiprintf_r+0x568>
    51f0:	1900106f          	j	6380 <_vfiprintf_r+0x16f4>
    51f4:	000a8713          	mv	a4,s5
    51f8:	0000a317          	auipc	t1,0xa
    51fc:	41830313          	add	t1,t1,1048 # f610 <blanks.1>
    5200:	000c0593          	mv	a1,s8
    5204:	000d8a93          	mv	s5,s11
    5208:	01000813          	li	a6,16
    520c:	00700d13          	li	s10,7
    5210:	01112c23          	sw	a7,24(sp)
    5214:	01d12e23          	sw	t4,28(sp)
    5218:	00030c13          	mv	s8,t1
    521c:	00070d93          	mv	s11,a4
    5220:	0180006f          	j	5238 <_vfiprintf_r+0x5ac>
    5224:	00268613          	add	a2,a3,2
    5228:	00858593          	add	a1,a1,8
    522c:	00070693          	mv	a3,a4
    5230:	ff0a8a93          	add	s5,s5,-16
    5234:	05585a63          	bge	a6,s5,5288 <_vfiprintf_r+0x5fc>
    5238:	01078793          	add	a5,a5,16
    523c:	00168713          	add	a4,a3,1
    5240:	0185a023          	sw	s8,0(a1)
    5244:	0105a223          	sw	a6,4(a1)
    5248:	06f12423          	sw	a5,104(sp)
    524c:	06e12223          	sw	a4,100(sp)
    5250:	fced5ae3          	bge	s10,a4,5224 <_vfiprintf_r+0x598>
    5254:	56078663          	beqz	a5,57c0 <_vfiprintf_r+0xb34>
    5258:	06010613          	add	a2,sp,96
    525c:	00098593          	mv	a1,s3
    5260:	00040513          	mv	a0,s0
    5264:	8edff0ef          	jal	4b50 <__sprint_r.part.0>
    5268:	ee051ae3          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    526c:	06412683          	lw	a3,100(sp)
    5270:	01000813          	li	a6,16
    5274:	ff0a8a93          	add	s5,s5,-16
    5278:	06812783          	lw	a5,104(sp)
    527c:	000a0593          	mv	a1,s4
    5280:	00168613          	add	a2,a3,1
    5284:	fb584ae3          	blt	a6,s5,5238 <_vfiprintf_r+0x5ac>
    5288:	01812883          	lw	a7,24(sp)
    528c:	01c12e83          	lw	t4,28(sp)
    5290:	000d8713          	mv	a4,s11
    5294:	000c0313          	mv	t1,s8
    5298:	000a8d93          	mv	s11,s5
    529c:	00058c13          	mv	s8,a1
    52a0:	00070a93          	mv	s5,a4
    52a4:	01b787b3          	add	a5,a5,s11
    52a8:	006c2023          	sw	t1,0(s8)
    52ac:	01bc2223          	sw	s11,4(s8)
    52b0:	06f12423          	sw	a5,104(sp)
    52b4:	06c12223          	sw	a2,100(sp)
    52b8:	00700713          	li	a4,7
    52bc:	d0c75ce3          	bge	a4,a2,4fd4 <_vfiprintf_r+0x348>
    52c0:	160788e3          	beqz	a5,5c30 <_vfiprintf_r+0xfa4>
    52c4:	06010613          	add	a2,sp,96
    52c8:	00098593          	mv	a1,s3
    52cc:	00040513          	mv	a0,s0
    52d0:	01d12e23          	sw	t4,28(sp)
    52d4:	01112c23          	sw	a7,24(sp)
    52d8:	879ff0ef          	jal	4b50 <__sprint_r.part.0>
    52dc:	e80510e3          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    52e0:	06812783          	lw	a5,104(sp)
    52e4:	01c12e83          	lw	t4,28(sp)
    52e8:	01812883          	lw	a7,24(sp)
    52ec:	ce9ff06f          	j	4fd4 <_vfiprintf_r+0x348>
    52f0:	2007f713          	and	a4,a5,512
    52f4:	e80716e3          	bnez	a4,5180 <_vfiprintf_r+0x4f4>
    52f8:	0589a503          	lw	a0,88(s3)
    52fc:	b65fb0ef          	jal	e60 <__retarget_lock_release_recursive>
    5300:	00c99783          	lh	a5,12(s3)
    5304:	e7dff06f          	j	5180 <_vfiprintf_r+0x4f4>
    5308:	000aa803          	lw	a6,0(s5)
    530c:	040101a3          	sb	zero,67(sp)
    5310:	000d8e13          	mv	t3,s11
    5314:	004a8a93          	add	s5,s5,4
    5318:	68080ae3          	beqz	a6,61ac <_vfiprintf_r+0x1520>
    531c:	05300793          	li	a5,83
    5320:	3cf68ce3          	beq	a3,a5,5ef8 <_vfiprintf_r+0x126c>
    5324:	010df793          	and	a5,s11,16
    5328:	3c0798e3          	bnez	a5,5ef8 <_vfiprintf_r+0x126c>
    532c:	00075463          	bgez	a4,5334 <_vfiprintf_r+0x6a8>
    5330:	7fd0006f          	j	632c <_vfiprintf_r+0x16a0>
    5334:	00070613          	mv	a2,a4
    5338:	00080513          	mv	a0,a6
    533c:	00000593          	li	a1,0
    5340:	03112223          	sw	a7,36(sp)
    5344:	00e12e23          	sw	a4,28(sp)
    5348:	01012c23          	sw	a6,24(sp)
    534c:	03b12023          	sw	s11,32(sp)
    5350:	258020ef          	jal	75a8 <memchr>
    5354:	00a12823          	sw	a0,16(sp)
    5358:	01812803          	lw	a6,24(sp)
    535c:	01c12703          	lw	a4,28(sp)
    5360:	02012e03          	lw	t3,32(sp)
    5364:	02412883          	lw	a7,36(sp)
    5368:	00051463          	bnez	a0,5370 <_vfiprintf_r+0x6e4>
    536c:	7990006f          	j	6304 <_vfiprintf_r+0x1678>
    5370:	41050d33          	sub	s10,a0,a6
    5374:	fffd4e93          	not	t4,s10
    5378:	41fede93          	sra	t4,t4,0x1f
    537c:	01dd7eb3          	and	t4,s10,t4
    5380:	00012823          	sw	zero,16(sp)
    5384:	6dd0006f          	j	6260 <_vfiprintf_r+0x15d4>
    5388:	04300793          	li	a5,67
    538c:	000d8e13          	mv	t3,s11
    5390:	004a8d93          	add	s11,s5,4
    5394:	00f68663          	beq	a3,a5,53a0 <_vfiprintf_r+0x714>
    5398:	010e7793          	and	a5,t3,16
    539c:	280788e3          	beqz	a5,5e2c <_vfiprintf_r+0x11a0>
    53a0:	00800613          	li	a2,8
    53a4:	00000593          	li	a1,0
    53a8:	05810513          	add	a0,sp,88
    53ac:	01112e23          	sw	a7,28(sp)
    53b0:	01c12c23          	sw	t3,24(sp)
    53b4:	ab1fb0ef          	jal	e64 <memset>
    53b8:	000aa603          	lw	a2,0(s5)
    53bc:	0ac10593          	add	a1,sp,172
    53c0:	05810693          	add	a3,sp,88
    53c4:	00040513          	mv	a0,s0
    53c8:	00b12823          	sw	a1,16(sp)
    53cc:	408050ef          	jal	a7d4 <_wcrtomb_r>
    53d0:	fff00793          	li	a5,-1
    53d4:	01012583          	lw	a1,16(sp)
    53d8:	01812e03          	lw	t3,24(sp)
    53dc:	01c12883          	lw	a7,28(sp)
    53e0:	00050d13          	mv	s10,a0
    53e4:	00f51463          	bne	a0,a5,53ec <_vfiprintf_r+0x760>
    53e8:	0200106f          	j	6408 <_vfiprintf_r+0x177c>
    53ec:	fff54e93          	not	t4,a0
    53f0:	41fede93          	sra	t4,t4,0x1f
    53f4:	01d57eb3          	and	t4,a0,t4
    53f8:	040101a3          	sb	zero,67(sp)
    53fc:	000d8a93          	mv	s5,s11
    5400:	00058813          	mv	a6,a1
    5404:	a79ff06f          	j	4e7c <_vfiprintf_r+0x1f0>
    5408:	411008b3          	neg	a7,a7
    540c:	000cc683          	lbu	a3,0(s9)
    5410:	004ded93          	or	s11,s11,4
    5414:	9f9ff06f          	j	4e0c <_vfiprintf_r+0x180>
    5418:	010dee13          	or	t3,s11,16
    541c:	020e7793          	and	a5,t3,32
    5420:	0c0788e3          	beqz	a5,5cf0 <_vfiprintf_r+0x1064>
    5424:	007a8a93          	add	s5,s5,7
    5428:	ff8afa93          	and	s5,s5,-8
    542c:	004aa683          	lw	a3,4(s5)
    5430:	000aad83          	lw	s11,0(s5)
    5434:	008a8a93          	add	s5,s5,8
    5438:	00068d13          	mv	s10,a3
    543c:	3006c263          	bltz	a3,5740 <_vfiprintf_r+0xab4>
    5440:	32074063          	bltz	a4,5760 <_vfiprintf_r+0xad4>
    5444:	01ade6b3          	or	a3,s11,s10
    5448:	f7fe7e13          	and	t3,t3,-129
    544c:	30069a63          	bnez	a3,5760 <_vfiprintf_r+0xad4>
    5450:	68071ae3          	bnez	a4,62e4 <_vfiprintf_r+0x1658>
    5454:	04314783          	lbu	a5,67(sp)
    5458:	00012823          	sw	zero,16(sp)
    545c:	00000e93          	li	t4,0
    5460:	00000d13          	li	s10,0
    5464:	11010813          	add	a6,sp,272
    5468:	00078463          	beqz	a5,5470 <_vfiprintf_r+0x7e4>
    546c:	001e8e93          	add	t4,t4,1
    5470:	002e7f93          	and	t6,t3,2
    5474:	a00f8ae3          	beqz	t6,4e88 <_vfiprintf_r+0x1fc>
    5478:	002e8e93          	add	t4,t4,2
    547c:	00200f93          	li	t6,2
    5480:	a09ff06f          	j	4e88 <_vfiprintf_r+0x1fc>
    5484:	000cc683          	lbu	a3,0(s9)
    5488:	06800793          	li	a5,104
    548c:	4ef686e3          	beq	a3,a5,6178 <_vfiprintf_r+0x14ec>
    5490:	040ded93          	or	s11,s11,64
    5494:	979ff06f          	j	4e0c <_vfiprintf_r+0x180>
    5498:	010de613          	or	a2,s11,16
    549c:	02067793          	and	a5,a2,32
    54a0:	000780e3          	beqz	a5,5ca0 <_vfiprintf_r+0x1014>
    54a4:	007a8a93          	add	s5,s5,7
    54a8:	ff8afa93          	and	s5,s5,-8
    54ac:	000aad83          	lw	s11,0(s5)
    54b0:	004aad03          	lw	s10,4(s5)
    54b4:	008a8a93          	add	s5,s5,8
    54b8:	040101a3          	sb	zero,67(sp)
    54bc:	00060e13          	mv	t3,a2
    54c0:	2a074063          	bltz	a4,5760 <_vfiprintf_r+0xad4>
    54c4:	01ade6b3          	or	a3,s11,s10
    54c8:	f7f67e13          	and	t3,a2,-129
    54cc:	28069a63          	bnez	a3,5760 <_vfiprintf_r+0xad4>
    54d0:	00100793          	li	a5,1
    54d4:	06071e63          	bnez	a4,5550 <_vfiprintf_r+0x8c4>
    54d8:	f6079ee3          	bnez	a5,5454 <_vfiprintf_r+0x7c8>
    54dc:	00167d13          	and	s10,a2,1
    54e0:	0a0d0ce3          	beqz	s10,5d98 <_vfiprintf_r+0x110c>
    54e4:	03000793          	li	a5,48
    54e8:	10f107a3          	sb	a5,271(sp)
    54ec:	000d0e93          	mv	t4,s10
    54f0:	10f10813          	add	a6,sp,271
    54f4:	2980006f          	j	578c <_vfiprintf_r+0xb00>
    54f8:	02b00793          	li	a5,43
    54fc:	000cc683          	lbu	a3,0(s9)
    5500:	04f101a3          	sb	a5,67(sp)
    5504:	909ff06f          	j	4e0c <_vfiprintf_r+0x180>
    5508:	010de693          	or	a3,s11,16
    550c:	0206f793          	and	a5,a3,32
    5510:	7a078c63          	beqz	a5,5cc8 <_vfiprintf_r+0x103c>
    5514:	007a8a93          	add	s5,s5,7
    5518:	ff8afa93          	and	s5,s5,-8
    551c:	000aa783          	lw	a5,0(s5)
    5520:	004aa583          	lw	a1,4(s5)
    5524:	008a8a93          	add	s5,s5,8
    5528:	040101a3          	sb	zero,67(sp)
    552c:	bff6fe13          	and	t3,a3,-1025
    5530:	02074c63          	bltz	a4,5568 <_vfiprintf_r+0x8dc>
    5534:	00b7e633          	or	a2,a5,a1
    5538:	b7f6f693          	and	a3,a3,-1153
    553c:	420610e3          	bnez	a2,615c <_vfiprintf_r+0x14d0>
    5540:	000e0613          	mv	a2,t3
    5544:	00000793          	li	a5,0
    5548:	00068e13          	mv	t3,a3
    554c:	f80706e3          	beqz	a4,54d8 <_vfiprintf_r+0x84c>
    5550:	00100693          	li	a3,1
    5554:	58d788e3          	beq	a5,a3,62e4 <_vfiprintf_r+0x1658>
    5558:	00200693          	li	a3,2
    555c:	46d786e3          	beq	a5,a3,61c8 <_vfiprintf_r+0x153c>
    5560:	00000793          	li	a5,0
    5564:	00000593          	li	a1,0
    5568:	11010813          	add	a6,sp,272
    556c:	01d59613          	sll	a2,a1,0x1d
    5570:	0077f693          	and	a3,a5,7
    5574:	0037d793          	srl	a5,a5,0x3
    5578:	03068693          	add	a3,a3,48
    557c:	00f667b3          	or	a5,a2,a5
    5580:	0035d593          	srl	a1,a1,0x3
    5584:	fed80fa3          	sb	a3,-1(a6)
    5588:	00b7e633          	or	a2,a5,a1
    558c:	00080513          	mv	a0,a6
    5590:	fff80813          	add	a6,a6,-1
    5594:	fc061ce3          	bnez	a2,556c <_vfiprintf_r+0x8e0>
    5598:	001e7793          	and	a5,t3,1
    559c:	54078e63          	beqz	a5,5af8 <_vfiprintf_r+0xe6c>
    55a0:	03000793          	li	a5,48
    55a4:	54f68a63          	beq	a3,a5,5af8 <_vfiprintf_r+0xe6c>
    55a8:	ffe50513          	add	a0,a0,-2
    55ac:	fef80fa3          	sb	a5,-1(a6)
    55b0:	11010793          	add	a5,sp,272
    55b4:	40a78d33          	sub	s10,a5,a0
    55b8:	00070e93          	mv	t4,a4
    55bc:	09a744e3          	blt	a4,s10,5e44 <_vfiprintf_r+0x11b8>
    55c0:	00050813          	mv	a6,a0
    55c4:	1c80006f          	j	578c <_vfiprintf_r+0xb00>
    55c8:	000086b7          	lui	a3,0x8
    55cc:	83068693          	add	a3,a3,-2000 # 7830 <_read_r+0x44>
    55d0:	04d11223          	sh	a3,68(sp)
    55d4:	0000a697          	auipc	a3,0xa
    55d8:	9b868693          	add	a3,a3,-1608 # ef8c <__fini_array_end+0x280>
    55dc:	000aa783          	lw	a5,0(s5)
    55e0:	00000593          	li	a1,0
    55e4:	002dee13          	or	t3,s11,2
    55e8:	004a8a93          	add	s5,s5,4
    55ec:	00d12a23          	sw	a3,20(sp)
    55f0:	040101a3          	sb	zero,67(sp)
    55f4:	4c074863          	bltz	a4,5ac4 <_vfiprintf_r+0xe38>
    55f8:	00b7e6b3          	or	a3,a5,a1
    55fc:	f7fe7513          	and	a0,t3,-129
    5600:	4a069c63          	bnez	a3,5ab8 <_vfiprintf_r+0xe2c>
    5604:	000e0613          	mv	a2,t3
    5608:	00200793          	li	a5,2
    560c:	00050e13          	mv	t3,a0
    5610:	ec5ff06f          	j	54d4 <_vfiprintf_r+0x848>
    5614:	00040513          	mv	a0,s0
    5618:	00e12c23          	sw	a4,24(sp)
    561c:	01112823          	sw	a7,16(sp)
    5620:	104020ef          	jal	7724 <_localeconv_r>
    5624:	00452783          	lw	a5,4(a0)
    5628:	00078513          	mv	a0,a5
    562c:	02f12a23          	sw	a5,52(sp)
    5630:	ab5fb0ef          	jal	10e4 <strlen>
    5634:	00050793          	mv	a5,a0
    5638:	00040513          	mv	a0,s0
    563c:	02f12823          	sw	a5,48(sp)
    5640:	0e4020ef          	jal	7724 <_localeconv_r>
    5644:	00852703          	lw	a4,8(a0)
    5648:	03012783          	lw	a5,48(sp)
    564c:	01012883          	lw	a7,16(sp)
    5650:	02e12623          	sw	a4,44(sp)
    5654:	01812703          	lw	a4,24(sp)
    5658:	a2078ee3          	beqz	a5,5094 <_vfiprintf_r+0x408>
    565c:	02c12783          	lw	a5,44(sp)
    5660:	000cc683          	lbu	a3,0(s9)
    5664:	fa078463          	beqz	a5,4e0c <_vfiprintf_r+0x180>
    5668:	0007c783          	lbu	a5,0(a5)
    566c:	fa078063          	beqz	a5,4e0c <_vfiprintf_r+0x180>
    5670:	400ded93          	or	s11,s11,1024
    5674:	f98ff06f          	j	4e0c <_vfiprintf_r+0x180>
    5678:	020df793          	and	a5,s11,32
    567c:	78079263          	bnez	a5,5e00 <_vfiprintf_r+0x1174>
    5680:	010df793          	and	a5,s11,16
    5684:	30079ae3          	bnez	a5,6198 <_vfiprintf_r+0x150c>
    5688:	040df793          	and	a5,s11,64
    568c:	400796e3          	bnez	a5,6298 <_vfiprintf_r+0x160c>
    5690:	200dfe13          	and	t3,s11,512
    5694:	300e02e3          	beqz	t3,6198 <_vfiprintf_r+0x150c>
    5698:	000aa783          	lw	a5,0(s5)
    569c:	00c12703          	lw	a4,12(sp)
    56a0:	004a8a93          	add	s5,s5,4
    56a4:	00e78023          	sb	a4,0(a5)
    56a8:	efcff06f          	j	4da4 <_vfiprintf_r+0x118>
    56ac:	000cc683          	lbu	a3,0(s9)
    56b0:	06c00793          	li	a5,108
    56b4:	2cf68ae3          	beq	a3,a5,6188 <_vfiprintf_r+0x14fc>
    56b8:	010ded93          	or	s11,s11,16
    56bc:	f50ff06f          	j	4e0c <_vfiprintf_r+0x180>
    56c0:	000cc683          	lbu	a3,0(s9)
    56c4:	080ded93          	or	s11,s11,128
    56c8:	f44ff06f          	j	4e0c <_vfiprintf_r+0x180>
    56cc:	000cc683          	lbu	a3,0(s9)
    56d0:	02a00793          	li	a5,42
    56d4:	001c8593          	add	a1,s9,1
    56d8:	54f680e3          	beq	a3,a5,6418 <_vfiprintf_r+0x178c>
    56dc:	fd068793          	add	a5,a3,-48
    56e0:	00900613          	li	a2,9
    56e4:	00000713          	li	a4,0
    56e8:	00900513          	li	a0,9
    56ec:	02f66463          	bltu	a2,a5,5714 <_vfiprintf_r+0xa88>
    56f0:	0005c683          	lbu	a3,0(a1)
    56f4:	00271613          	sll	a2,a4,0x2
    56f8:	00e60733          	add	a4,a2,a4
    56fc:	00171713          	sll	a4,a4,0x1
    5700:	00f70733          	add	a4,a4,a5
    5704:	fd068793          	add	a5,a3,-48
    5708:	00158593          	add	a1,a1,1
    570c:	fef572e3          	bgeu	a0,a5,56f0 <_vfiprintf_r+0xa64>
    5710:	74074063          	bltz	a4,5e50 <_vfiprintf_r+0x11c4>
    5714:	00058c93          	mv	s9,a1
    5718:	ef8ff06f          	j	4e10 <_vfiprintf_r+0x184>
    571c:	000cc683          	lbu	a3,0(s9)
    5720:	001ded93          	or	s11,s11,1
    5724:	ee8ff06f          	j	4e0c <_vfiprintf_r+0x180>
    5728:	04314783          	lbu	a5,67(sp)
    572c:	000cc683          	lbu	a3,0(s9)
    5730:	ec079e63          	bnez	a5,4e0c <_vfiprintf_r+0x180>
    5734:	02000793          	li	a5,32
    5738:	04f101a3          	sb	a5,67(sp)
    573c:	ed0ff06f          	j	4e0c <_vfiprintf_r+0x180>
    5740:	02d00613          	li	a2,45
    5744:	01b036b3          	snez	a3,s11
    5748:	41a000b3          	neg	ra,s10
    574c:	04c101a3          	sb	a2,67(sp)
    5750:	40d08d33          	sub	s10,ra,a3
    5754:	41b00db3          	neg	s11,s11
    5758:	00074463          	bltz	a4,5760 <_vfiprintf_r+0xad4>
    575c:	f7fe7e13          	and	t3,t3,-129
    5760:	120d14e3          	bnez	s10,6088 <_vfiprintf_r+0x13fc>
    5764:	00900693          	li	a3,9
    5768:	13b6e0e3          	bltu	a3,s11,6088 <_vfiprintf_r+0x13fc>
    576c:	030d8793          	add	a5,s11,48
    5770:	0ff7f793          	zext.b	a5,a5
    5774:	10f107a3          	sb	a5,271(sp)
    5778:	00070e93          	mv	t4,a4
    577c:	00e04463          	bgtz	a4,5784 <_vfiprintf_r+0xaf8>
    5780:	00100e93          	li	t4,1
    5784:	00100d13          	li	s10,1
    5788:	10f10813          	add	a6,sp,271
    578c:	04314783          	lbu	a5,67(sp)
    5790:	00012823          	sw	zero,16(sp)
    5794:	cc079ce3          	bnez	a5,546c <_vfiprintf_r+0x7e0>
    5798:	cd9ff06f          	j	5470 <_vfiprintf_r+0x7e4>
    579c:	00100713          	li	a4,1
    57a0:	000d0793          	mv	a5,s10
    57a4:	07012623          	sw	a6,108(sp)
    57a8:	07a12823          	sw	s10,112(sp)
    57ac:	07a12423          	sw	s10,104(sp)
    57b0:	06e12223          	sw	a4,100(sp)
    57b4:	000a0c13          	mv	s8,s4
    57b8:	008c0c13          	add	s8,s8,8
    57bc:	809ff06f          	j	4fc4 <_vfiprintf_r+0x338>
    57c0:	00100613          	li	a2,1
    57c4:	00000693          	li	a3,0
    57c8:	000a0593          	mv	a1,s4
    57cc:	a65ff06f          	j	5230 <_vfiprintf_r+0x5a4>
    57d0:	41d88db3          	sub	s11,a7,t4
    57d4:	f9b05a63          	blez	s11,4f68 <_vfiprintf_r+0x2dc>
    57d8:	01000593          	li	a1,16
    57dc:	3bb5dae3          	bge	a1,s11,6390 <_vfiprintf_r+0x1704>
    57e0:	0000af97          	auipc	t6,0xa
    57e4:	e20f8f93          	add	t6,t6,-480 # f600 <zeroes.0>
    57e8:	02e12223          	sw	a4,36(sp)
    57ec:	000a8713          	mv	a4,s5
    57f0:	000c0693          	mv	a3,s8
    57f4:	000d8a93          	mv	s5,s11
    57f8:	01000f13          	li	t5,16
    57fc:	00700293          	li	t0,7
    5800:	01c12c23          	sw	t3,24(sp)
    5804:	01012e23          	sw	a6,28(sp)
    5808:	03112023          	sw	a7,32(sp)
    580c:	03d12423          	sw	t4,40(sp)
    5810:	000f8c13          	mv	s8,t6
    5814:	00070d93          	mv	s11,a4
    5818:	0180006f          	j	5830 <_vfiprintf_r+0xba4>
    581c:	00260513          	add	a0,a2,2
    5820:	00868693          	add	a3,a3,8
    5824:	00070613          	mv	a2,a4
    5828:	ff0a8a93          	add	s5,s5,-16
    582c:	055f5c63          	bge	t5,s5,5884 <_vfiprintf_r+0xbf8>
    5830:	01078793          	add	a5,a5,16
    5834:	00160713          	add	a4,a2,1
    5838:	0186a023          	sw	s8,0(a3)
    583c:	01e6a223          	sw	t5,4(a3)
    5840:	06f12423          	sw	a5,104(sp)
    5844:	06e12223          	sw	a4,100(sp)
    5848:	fce2dae3          	bge	t0,a4,581c <_vfiprintf_r+0xb90>
    584c:	1c078663          	beqz	a5,5a18 <_vfiprintf_r+0xd8c>
    5850:	06010613          	add	a2,sp,96
    5854:	00098593          	mv	a1,s3
    5858:	00040513          	mv	a0,s0
    585c:	af4ff0ef          	jal	4b50 <__sprint_r.part.0>
    5860:	8e051ee3          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    5864:	06412603          	lw	a2,100(sp)
    5868:	01000f13          	li	t5,16
    586c:	ff0a8a93          	add	s5,s5,-16
    5870:	06812783          	lw	a5,104(sp)
    5874:	000a0693          	mv	a3,s4
    5878:	00160513          	add	a0,a2,1
    587c:	00700293          	li	t0,7
    5880:	fb5f48e3          	blt	t5,s5,5830 <_vfiprintf_r+0xba4>
    5884:	01812e03          	lw	t3,24(sp)
    5888:	01c12803          	lw	a6,28(sp)
    588c:	02012883          	lw	a7,32(sp)
    5890:	02412703          	lw	a4,36(sp)
    5894:	02812e83          	lw	t4,40(sp)
    5898:	000d8613          	mv	a2,s11
    589c:	000c0f93          	mv	t6,s8
    58a0:	000a8d93          	mv	s11,s5
    58a4:	00068c13          	mv	s8,a3
    58a8:	00060a93          	mv	s5,a2
    58ac:	01b787b3          	add	a5,a5,s11
    58b0:	01fc2023          	sw	t6,0(s8)
    58b4:	01bc2223          	sw	s11,4(s8)
    58b8:	06f12423          	sw	a5,104(sp)
    58bc:	06a12223          	sw	a0,100(sp)
    58c0:	00700613          	li	a2,7
    58c4:	4ea65863          	bge	a2,a0,5db4 <_vfiprintf_r+0x1128>
    58c8:	1a0786e3          	beqz	a5,6274 <_vfiprintf_r+0x15e8>
    58cc:	06010613          	add	a2,sp,96
    58d0:	00098593          	mv	a1,s3
    58d4:	00040513          	mv	a0,s0
    58d8:	03d12423          	sw	t4,40(sp)
    58dc:	02e12223          	sw	a4,36(sp)
    58e0:	03112023          	sw	a7,32(sp)
    58e4:	01012e23          	sw	a6,28(sp)
    58e8:	01c12c23          	sw	t3,24(sp)
    58ec:	a64ff0ef          	jal	4b50 <__sprint_r.part.0>
    58f0:	860516e3          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    58f4:	02412703          	lw	a4,36(sp)
    58f8:	06412603          	lw	a2,100(sp)
    58fc:	06812783          	lw	a5,104(sp)
    5900:	41a70733          	sub	a4,a4,s10
    5904:	02812e83          	lw	t4,40(sp)
    5908:	02012883          	lw	a7,32(sp)
    590c:	01c12803          	lw	a6,28(sp)
    5910:	01812e03          	lw	t3,24(sp)
    5914:	000a0c13          	mv	s8,s4
    5918:	00160f13          	add	t5,a2,1
    591c:	e4e05a63          	blez	a4,4f70 <_vfiprintf_r+0x2e4>
    5920:	01000593          	li	a1,16
    5924:	0000af97          	auipc	t6,0xa
    5928:	cdcf8f93          	add	t6,t6,-804 # f600 <zeroes.0>
    592c:	0ae5da63          	bge	a1,a4,59e0 <_vfiprintf_r+0xd54>
    5930:	000c0593          	mv	a1,s8
    5934:	03512423          	sw	s5,40(sp)
    5938:	01000d93          	li	s11,16
    593c:	00700293          	li	t0,7
    5940:	01c12c23          	sw	t3,24(sp)
    5944:	01012e23          	sw	a6,28(sp)
    5948:	03112023          	sw	a7,32(sp)
    594c:	03d12223          	sw	t4,36(sp)
    5950:	00070a93          	mv	s5,a4
    5954:	000b0c13          	mv	s8,s6
    5958:	0180006f          	j	5970 <_vfiprintf_r+0xce4>
    595c:	00260f13          	add	t5,a2,2
    5960:	00858593          	add	a1,a1,8
    5964:	00068613          	mv	a2,a3
    5968:	ff0a8a93          	add	s5,s5,-16
    596c:	055dda63          	bge	s11,s5,59c0 <_vfiprintf_r+0xd34>
    5970:	01078793          	add	a5,a5,16
    5974:	00160693          	add	a3,a2,1
    5978:	0165a023          	sw	s6,0(a1)
    597c:	01b5a223          	sw	s11,4(a1)
    5980:	06f12423          	sw	a5,104(sp)
    5984:	06d12223          	sw	a3,100(sp)
    5988:	fcd2dae3          	bge	t0,a3,595c <_vfiprintf_r+0xcd0>
    598c:	06078e63          	beqz	a5,5a08 <_vfiprintf_r+0xd7c>
    5990:	06010613          	add	a2,sp,96
    5994:	00098593          	mv	a1,s3
    5998:	00040513          	mv	a0,s0
    599c:	9b4ff0ef          	jal	4b50 <__sprint_r.part.0>
    59a0:	fa051e63          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    59a4:	06412603          	lw	a2,100(sp)
    59a8:	ff0a8a93          	add	s5,s5,-16
    59ac:	06812783          	lw	a5,104(sp)
    59b0:	000a0593          	mv	a1,s4
    59b4:	00160f13          	add	t5,a2,1
    59b8:	00700293          	li	t0,7
    59bc:	fb5dcae3          	blt	s11,s5,5970 <_vfiprintf_r+0xce4>
    59c0:	000a8713          	mv	a4,s5
    59c4:	01812e03          	lw	t3,24(sp)
    59c8:	01c12803          	lw	a6,28(sp)
    59cc:	02012883          	lw	a7,32(sp)
    59d0:	02412e83          	lw	t4,36(sp)
    59d4:	02812a83          	lw	s5,40(sp)
    59d8:	000c0f93          	mv	t6,s8
    59dc:	00058c13          	mv	s8,a1
    59e0:	00e787b3          	add	a5,a5,a4
    59e4:	00ec2223          	sw	a4,4(s8)
    59e8:	01fc2023          	sw	t6,0(s8)
    59ec:	06f12423          	sw	a5,104(sp)
    59f0:	07e12223          	sw	t5,100(sp)
    59f4:	00700713          	li	a4,7
    59f8:	25e74863          	blt	a4,t5,5c48 <_vfiprintf_r+0xfbc>
    59fc:	008c0c13          	add	s8,s8,8
    5a00:	001f0f13          	add	t5,t5,1
    5a04:	d6cff06f          	j	4f70 <_vfiprintf_r+0x2e4>
    5a08:	00100f13          	li	t5,1
    5a0c:	00000613          	li	a2,0
    5a10:	000a0593          	mv	a1,s4
    5a14:	f55ff06f          	j	5968 <_vfiprintf_r+0xcdc>
    5a18:	00100513          	li	a0,1
    5a1c:	00000613          	li	a2,0
    5a20:	000a0693          	mv	a3,s4
    5a24:	e05ff06f          	j	5828 <_vfiprintf_r+0xb9c>
    5a28:	06078263          	beqz	a5,5a8c <_vfiprintf_r+0xe00>
    5a2c:	06010613          	add	a2,sp,96
    5a30:	00098593          	mv	a1,s3
    5a34:	00040513          	mv	a0,s0
    5a38:	03d12e23          	sw	t4,60(sp)
    5a3c:	02e12c23          	sw	a4,56(sp)
    5a40:	03112423          	sw	a7,40(sp)
    5a44:	03012223          	sw	a6,36(sp)
    5a48:	02512023          	sw	t0,32(sp)
    5a4c:	01f12e23          	sw	t6,28(sp)
    5a50:	01c12c23          	sw	t3,24(sp)
    5a54:	8fcff0ef          	jal	4b50 <__sprint_r.part.0>
    5a58:	f0051263          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    5a5c:	06412603          	lw	a2,100(sp)
    5a60:	06812783          	lw	a5,104(sp)
    5a64:	03c12e83          	lw	t4,60(sp)
    5a68:	03812703          	lw	a4,56(sp)
    5a6c:	02812883          	lw	a7,40(sp)
    5a70:	02412803          	lw	a6,36(sp)
    5a74:	02012283          	lw	t0,32(sp)
    5a78:	01c12f83          	lw	t6,28(sp)
    5a7c:	01812e03          	lw	t3,24(sp)
    5a80:	000a0c13          	mv	s8,s4
    5a84:	00160f13          	add	t5,a2,1
    5a88:	c58ff06f          	j	4ee0 <_vfiprintf_r+0x254>
    5a8c:	380f8863          	beqz	t6,5e1c <_vfiprintf_r+0x1190>
    5a90:	04410793          	add	a5,sp,68
    5a94:	06f12623          	sw	a5,108(sp)
    5a98:	00200793          	li	a5,2
    5a9c:	06f12823          	sw	a5,112(sp)
    5aa0:	00100f13          	li	t5,1
    5aa4:	000a0c13          	mv	s8,s4
    5aa8:	000f0613          	mv	a2,t5
    5aac:	008c0c13          	add	s8,s8,8
    5ab0:	001f0f13          	add	t5,t5,1
    5ab4:	cacff06f          	j	4f60 <_vfiprintf_r+0x2d4>
    5ab8:	00200693          	li	a3,2
    5abc:	00050e13          	mv	t3,a0
    5ac0:	aa0684e3          	beqz	a3,5568 <_vfiprintf_r+0x8dc>
    5ac4:	01412503          	lw	a0,20(sp)
    5ac8:	11010813          	add	a6,sp,272
    5acc:	00f7f693          	and	a3,a5,15
    5ad0:	00d506b3          	add	a3,a0,a3
    5ad4:	0006c603          	lbu	a2,0(a3)
    5ad8:	0047d793          	srl	a5,a5,0x4
    5adc:	01c59693          	sll	a3,a1,0x1c
    5ae0:	00f6e7b3          	or	a5,a3,a5
    5ae4:	0045d593          	srl	a1,a1,0x4
    5ae8:	fec80fa3          	sb	a2,-1(a6)
    5aec:	00b7e6b3          	or	a3,a5,a1
    5af0:	fff80813          	add	a6,a6,-1
    5af4:	fc069ce3          	bnez	a3,5acc <_vfiprintf_r+0xe40>
    5af8:	11010793          	add	a5,sp,272
    5afc:	41078d33          	sub	s10,a5,a6
    5b00:	00070e93          	mv	t4,a4
    5b04:	c9a754e3          	bge	a4,s10,578c <_vfiprintf_r+0xb00>
    5b08:	000d0e93          	mv	t4,s10
    5b0c:	c81ff06f          	j	578c <_vfiprintf_r+0xb00>
    5b10:	01000513          	li	a0,16
    5b14:	01b554e3          	bge	a0,s11,631c <_vfiprintf_r+0x1690>
    5b18:	000a8693          	mv	a3,s5
    5b1c:	0000a317          	auipc	t1,0xa
    5b20:	af430313          	add	t1,t1,-1292 # f610 <blanks.1>
    5b24:	02e12c23          	sw	a4,56(sp)
    5b28:	000d8a93          	mv	s5,s11
    5b2c:	000c0713          	mv	a4,s8
    5b30:	01000f13          	li	t5,16
    5b34:	00700393          	li	t2,7
    5b38:	01c12c23          	sw	t3,24(sp)
    5b3c:	01f12e23          	sw	t6,28(sp)
    5b40:	02512023          	sw	t0,32(sp)
    5b44:	03012223          	sw	a6,36(sp)
    5b48:	03112423          	sw	a7,40(sp)
    5b4c:	03d12e23          	sw	t4,60(sp)
    5b50:	00030c13          	mv	s8,t1
    5b54:	00068d93          	mv	s11,a3
    5b58:	01c0006f          	j	5b74 <_vfiprintf_r+0xee8>
    5b5c:	00260513          	add	a0,a2,2
    5b60:	00870713          	add	a4,a4,8
    5b64:	00058613          	mv	a2,a1
    5b68:	ff0a8a93          	add	s5,s5,-16
    5b6c:	055f5c63          	bge	t5,s5,5bc4 <_vfiprintf_r+0xf38>
    5b70:	00160593          	add	a1,a2,1
    5b74:	01078793          	add	a5,a5,16
    5b78:	01872023          	sw	s8,0(a4)
    5b7c:	01e72223          	sw	t5,4(a4)
    5b80:	06f12423          	sw	a5,104(sp)
    5b84:	06b12223          	sw	a1,100(sp)
    5b88:	fcb3dae3          	bge	t2,a1,5b5c <_vfiprintf_r+0xed0>
    5b8c:	08078a63          	beqz	a5,5c20 <_vfiprintf_r+0xf94>
    5b90:	06010613          	add	a2,sp,96
    5b94:	00098593          	mv	a1,s3
    5b98:	00040513          	mv	a0,s0
    5b9c:	fb5fe0ef          	jal	4b50 <__sprint_r.part.0>
    5ba0:	da051e63          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    5ba4:	06412603          	lw	a2,100(sp)
    5ba8:	01000f13          	li	t5,16
    5bac:	ff0a8a93          	add	s5,s5,-16
    5bb0:	06812783          	lw	a5,104(sp)
    5bb4:	000a0713          	mv	a4,s4
    5bb8:	00160513          	add	a0,a2,1
    5bbc:	00700393          	li	t2,7
    5bc0:	fb5f48e3          	blt	t5,s5,5b70 <_vfiprintf_r+0xee4>
    5bc4:	000c0313          	mv	t1,s8
    5bc8:	01812e03          	lw	t3,24(sp)
    5bcc:	00070c13          	mv	s8,a4
    5bd0:	01c12f83          	lw	t6,28(sp)
    5bd4:	02012283          	lw	t0,32(sp)
    5bd8:	02412803          	lw	a6,36(sp)
    5bdc:	02812883          	lw	a7,40(sp)
    5be0:	03c12e83          	lw	t4,60(sp)
    5be4:	03812703          	lw	a4,56(sp)
    5be8:	000d8693          	mv	a3,s11
    5bec:	000a8d93          	mv	s11,s5
    5bf0:	00068a93          	mv	s5,a3
    5bf4:	01b787b3          	add	a5,a5,s11
    5bf8:	006c2023          	sw	t1,0(s8)
    5bfc:	01bc2223          	sw	s11,4(s8)
    5c00:	06f12423          	sw	a5,104(sp)
    5c04:	06a12223          	sw	a0,100(sp)
    5c08:	00700613          	li	a2,7
    5c0c:	12a64063          	blt	a2,a0,5d2c <_vfiprintf_r+0x10a0>
    5c10:	008c0c13          	add	s8,s8,8
    5c14:	00150f13          	add	t5,a0,1
    5c18:	00050613          	mv	a2,a0
    5c1c:	a8cff06f          	j	4ea8 <_vfiprintf_r+0x21c>
    5c20:	00000613          	li	a2,0
    5c24:	00100513          	li	a0,1
    5c28:	000a0713          	mv	a4,s4
    5c2c:	f3dff06f          	j	5b68 <_vfiprintf_r+0xedc>
    5c30:	01d8d463          	bge	a7,t4,5c38 <_vfiprintf_r+0xfac>
    5c34:	000e8893          	mv	a7,t4
    5c38:	00c12783          	lw	a5,12(sp)
    5c3c:	011787b3          	add	a5,a5,a7
    5c40:	00f12623          	sw	a5,12(sp)
    5c44:	ba8ff06f          	j	4fec <_vfiprintf_r+0x360>
    5c48:	b4078ae3          	beqz	a5,579c <_vfiprintf_r+0xb10>
    5c4c:	06010613          	add	a2,sp,96
    5c50:	00098593          	mv	a1,s3
    5c54:	00040513          	mv	a0,s0
    5c58:	03d12223          	sw	t4,36(sp)
    5c5c:	03112023          	sw	a7,32(sp)
    5c60:	01012e23          	sw	a6,28(sp)
    5c64:	01c12c23          	sw	t3,24(sp)
    5c68:	ee9fe0ef          	jal	4b50 <__sprint_r.part.0>
    5c6c:	ce051863          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    5c70:	06412f03          	lw	t5,100(sp)
    5c74:	06812783          	lw	a5,104(sp)
    5c78:	02412e83          	lw	t4,36(sp)
    5c7c:	02012883          	lw	a7,32(sp)
    5c80:	01c12803          	lw	a6,28(sp)
    5c84:	01812e03          	lw	t3,24(sp)
    5c88:	000a0c13          	mv	s8,s4
    5c8c:	001f0f13          	add	t5,t5,1
    5c90:	ae0ff06f          	j	4f70 <_vfiprintf_r+0x2e4>
    5c94:	06012223          	sw	zero,100(sp)
    5c98:	000a0c13          	mv	s8,s4
    5c9c:	c84ff06f          	j	5120 <_vfiprintf_r+0x494>
    5ca0:	01067693          	and	a3,a2,16
    5ca4:	000aa783          	lw	a5,0(s5)
    5ca8:	004a8a93          	add	s5,s5,4
    5cac:	12069c63          	bnez	a3,5de4 <_vfiprintf_r+0x1158>
    5cb0:	04067693          	and	a3,a2,64
    5cb4:	12068463          	beqz	a3,5ddc <_vfiprintf_r+0x1150>
    5cb8:	01079d93          	sll	s11,a5,0x10
    5cbc:	010ddd93          	srl	s11,s11,0x10
    5cc0:	00000d13          	li	s10,0
    5cc4:	ff4ff06f          	j	54b8 <_vfiprintf_r+0x82c>
    5cc8:	0106f613          	and	a2,a3,16
    5ccc:	000aa783          	lw	a5,0(s5)
    5cd0:	004a8a93          	add	s5,s5,4
    5cd4:	12061263          	bnez	a2,5df8 <_vfiprintf_r+0x116c>
    5cd8:	0406f613          	and	a2,a3,64
    5cdc:	10060a63          	beqz	a2,5df0 <_vfiprintf_r+0x1164>
    5ce0:	01079793          	sll	a5,a5,0x10
    5ce4:	0107d793          	srl	a5,a5,0x10
    5ce8:	00000593          	li	a1,0
    5cec:	83dff06f          	j	5528 <_vfiprintf_r+0x89c>
    5cf0:	010e7693          	and	a3,t3,16
    5cf4:	000aa783          	lw	a5,0(s5)
    5cf8:	004a8a93          	add	s5,s5,4
    5cfc:	0c069863          	bnez	a3,5dcc <_vfiprintf_r+0x1140>
    5d00:	040e7693          	and	a3,t3,64
    5d04:	0c068063          	beqz	a3,5dc4 <_vfiprintf_r+0x1138>
    5d08:	01079d93          	sll	s11,a5,0x10
    5d0c:	410ddd93          	sra	s11,s11,0x10
    5d10:	41fddd13          	sra	s10,s11,0x1f
    5d14:	000d0693          	mv	a3,s10
    5d18:	f24ff06f          	j	543c <_vfiprintf_r+0x7b0>
    5d1c:	00100f13          	li	t5,1
    5d20:	00000613          	li	a2,0
    5d24:	000a0c13          	mv	s8,s4
    5d28:	a38ff06f          	j	4f60 <_vfiprintf_r+0x2d4>
    5d2c:	1a078463          	beqz	a5,5ed4 <_vfiprintf_r+0x1248>
    5d30:	06010613          	add	a2,sp,96
    5d34:	00098593          	mv	a1,s3
    5d38:	00040513          	mv	a0,s0
    5d3c:	03d12e23          	sw	t4,60(sp)
    5d40:	02e12c23          	sw	a4,56(sp)
    5d44:	03112423          	sw	a7,40(sp)
    5d48:	03012223          	sw	a6,36(sp)
    5d4c:	02512023          	sw	t0,32(sp)
    5d50:	01f12e23          	sw	t6,28(sp)
    5d54:	01c12c23          	sw	t3,24(sp)
    5d58:	df9fe0ef          	jal	4b50 <__sprint_r.part.0>
    5d5c:	c0051063          	bnez	a0,515c <_vfiprintf_r+0x4d0>
    5d60:	06412603          	lw	a2,100(sp)
    5d64:	06812783          	lw	a5,104(sp)
    5d68:	03c12e83          	lw	t4,60(sp)
    5d6c:	03812703          	lw	a4,56(sp)
    5d70:	02812883          	lw	a7,40(sp)
    5d74:	02412803          	lw	a6,36(sp)
    5d78:	02012283          	lw	t0,32(sp)
    5d7c:	01c12f83          	lw	t6,28(sp)
    5d80:	01812e03          	lw	t3,24(sp)
    5d84:	000a0c13          	mv	s8,s4
    5d88:	00160f13          	add	t5,a2,1
    5d8c:	91cff06f          	j	4ea8 <_vfiprintf_r+0x21c>
    5d90:	000d8e13          	mv	t3,s11
    5d94:	e88ff06f          	j	541c <_vfiprintf_r+0x790>
    5d98:	00000e93          	li	t4,0
    5d9c:	11010813          	add	a6,sp,272
    5da0:	9edff06f          	j	578c <_vfiprintf_r+0xb00>
    5da4:	0589a503          	lw	a0,88(s3)
    5da8:	8b4fb0ef          	jal	e5c <__retarget_lock_acquire_recursive>
    5dac:	00c99783          	lh	a5,12(s3)
    5db0:	f41fe06f          	j	4cf0 <_vfiprintf_r+0x64>
    5db4:	008c0c13          	add	s8,s8,8
    5db8:	00150f13          	add	t5,a0,1
    5dbc:	00050613          	mv	a2,a0
    5dc0:	9a8ff06f          	j	4f68 <_vfiprintf_r+0x2dc>
    5dc4:	200e7693          	and	a3,t3,512
    5dc8:	50069463          	bnez	a3,62d0 <_vfiprintf_r+0x1644>
    5dcc:	41f7dd13          	sra	s10,a5,0x1f
    5dd0:	00078d93          	mv	s11,a5
    5dd4:	000d0693          	mv	a3,s10
    5dd8:	e64ff06f          	j	543c <_vfiprintf_r+0x7b0>
    5ddc:	20067693          	and	a3,a2,512
    5de0:	4c069663          	bnez	a3,62ac <_vfiprintf_r+0x1620>
    5de4:	00078d93          	mv	s11,a5
    5de8:	00000d13          	li	s10,0
    5dec:	eccff06f          	j	54b8 <_vfiprintf_r+0x82c>
    5df0:	2006f613          	and	a2,a3,512
    5df4:	4c061863          	bnez	a2,62c4 <_vfiprintf_r+0x1638>
    5df8:	00000593          	li	a1,0
    5dfc:	f2cff06f          	j	5528 <_vfiprintf_r+0x89c>
    5e00:	00c12683          	lw	a3,12(sp)
    5e04:	000aa783          	lw	a5,0(s5)
    5e08:	004a8a93          	add	s5,s5,4
    5e0c:	41f6d713          	sra	a4,a3,0x1f
    5e10:	00d7a023          	sw	a3,0(a5)
    5e14:	00e7a223          	sw	a4,4(a5)
    5e18:	f8dfe06f          	j	4da4 <_vfiprintf_r+0x118>
    5e1c:	00000613          	li	a2,0
    5e20:	00100f13          	li	t5,1
    5e24:	000a0c13          	mv	s8,s4
    5e28:	938ff06f          	j	4f60 <_vfiprintf_r+0x2d4>
    5e2c:	000aa783          	lw	a5,0(s5)
    5e30:	00100e93          	li	t4,1
    5e34:	00100d13          	li	s10,1
    5e38:	0af10623          	sb	a5,172(sp)
    5e3c:	0ac10593          	add	a1,sp,172
    5e40:	db8ff06f          	j	53f8 <_vfiprintf_r+0x76c>
    5e44:	000d0e93          	mv	t4,s10
    5e48:	00050813          	mv	a6,a0
    5e4c:	941ff06f          	j	578c <_vfiprintf_r+0xb00>
    5e50:	fff00713          	li	a4,-1
    5e54:	00058c93          	mv	s9,a1
    5e58:	fb9fe06f          	j	4e10 <_vfiprintf_r+0x184>
    5e5c:	000d8613          	mv	a2,s11
    5e60:	e3cff06f          	j	549c <_vfiprintf_r+0x810>
    5e64:	00009797          	auipc	a5,0x9
    5e68:	13c78793          	add	a5,a5,316 # efa0 <__fini_array_end+0x294>
    5e6c:	000d8e13          	mv	t3,s11
    5e70:	00f12a23          	sw	a5,20(sp)
    5e74:	020e7793          	and	a5,t3,32
    5e78:	1c078c63          	beqz	a5,6050 <_vfiprintf_r+0x13c4>
    5e7c:	007a8a93          	add	s5,s5,7
    5e80:	ff8afa93          	and	s5,s5,-8
    5e84:	000aa783          	lw	a5,0(s5)
    5e88:	004aa583          	lw	a1,4(s5)
    5e8c:	008a8a93          	add	s5,s5,8
    5e90:	001e7613          	and	a2,t3,1
    5e94:	00060e63          	beqz	a2,5eb0 <_vfiprintf_r+0x1224>
    5e98:	00b7e633          	or	a2,a5,a1
    5e9c:	00060a63          	beqz	a2,5eb0 <_vfiprintf_r+0x1224>
    5ea0:	03000613          	li	a2,48
    5ea4:	04c10223          	sb	a2,68(sp)
    5ea8:	04d102a3          	sb	a3,69(sp)
    5eac:	002e6e13          	or	t3,t3,2
    5eb0:	bffe7e13          	and	t3,t3,-1025
    5eb4:	f3cff06f          	j	55f0 <_vfiprintf_r+0x964>
    5eb8:	000d8693          	mv	a3,s11
    5ebc:	e50ff06f          	j	550c <_vfiprintf_r+0x880>
    5ec0:	00009797          	auipc	a5,0x9
    5ec4:	0cc78793          	add	a5,a5,204 # ef8c <__fini_array_end+0x280>
    5ec8:	000d8e13          	mv	t3,s11
    5ecc:	00f12a23          	sw	a5,20(sp)
    5ed0:	fa5ff06f          	j	5e74 <_vfiprintf_r+0x11e8>
    5ed4:	04314603          	lbu	a2,67(sp)
    5ed8:	3a060a63          	beqz	a2,628c <_vfiprintf_r+0x1600>
    5edc:	04310793          	add	a5,sp,67
    5ee0:	06f12623          	sw	a5,108(sp)
    5ee4:	00100793          	li	a5,1
    5ee8:	06f12823          	sw	a5,112(sp)
    5eec:	00100f13          	li	t5,1
    5ef0:	000a0c13          	mv	s8,s4
    5ef4:	fe1fe06f          	j	4ed4 <_vfiprintf_r+0x248>
    5ef8:	00800613          	li	a2,8
    5efc:	00000593          	li	a1,0
    5f00:	05810513          	add	a0,sp,88
    5f04:	02e12023          	sw	a4,32(sp)
    5f08:	01112e23          	sw	a7,28(sp)
    5f0c:	01c12c23          	sw	t3,24(sp)
    5f10:	05012623          	sw	a6,76(sp)
    5f14:	01012823          	sw	a6,16(sp)
    5f18:	f4dfa0ef          	jal	e64 <memset>
    5f1c:	02012703          	lw	a4,32(sp)
    5f20:	01012803          	lw	a6,16(sp)
    5f24:	01812e03          	lw	t3,24(sp)
    5f28:	01c12883          	lw	a7,28(sp)
    5f2c:	2a074463          	bltz	a4,61d4 <_vfiprintf_r+0x1548>
    5f30:	00000d93          	li	s11,0
    5f34:	00000d13          	li	s10,0
    5f38:	01812823          	sw	s8,16(sp)
    5f3c:	01012e23          	sw	a6,28(sp)
    5f40:	000d8c13          	mv	s8,s11
    5f44:	03112023          	sw	a7,32(sp)
    5f48:	000c8d93          	mv	s11,s9
    5f4c:	000a8c93          	mv	s9,s5
    5f50:	000d0a93          	mv	s5,s10
    5f54:	00098d13          	mv	s10,s3
    5f58:	00070993          	mv	s3,a4
    5f5c:	0300006f          	j	5f8c <_vfiprintf_r+0x1300>
    5f60:	05810693          	add	a3,sp,88
    5f64:	0ac10593          	add	a1,sp,172
    5f68:	00040513          	mv	a0,s0
    5f6c:	069040ef          	jal	a7d4 <_wcrtomb_r>
    5f70:	fff00793          	li	a5,-1
    5f74:	48f50063          	beq	a0,a5,63f4 <_vfiprintf_r+0x1768>
    5f78:	00aa87b3          	add	a5,s5,a0
    5f7c:	02f9c063          	blt	s3,a5,5f9c <_vfiprintf_r+0x1310>
    5f80:	004c0c13          	add	s8,s8,4
    5f84:	45378463          	beq	a5,s3,63cc <_vfiprintf_r+0x1740>
    5f88:	00078a93          	mv	s5,a5
    5f8c:	04c12783          	lw	a5,76(sp)
    5f90:	018787b3          	add	a5,a5,s8
    5f94:	0007a603          	lw	a2,0(a5)
    5f98:	fc0614e3          	bnez	a2,5f60 <_vfiprintf_r+0x12d4>
    5f9c:	01012c03          	lw	s8,16(sp)
    5fa0:	01812e03          	lw	t3,24(sp)
    5fa4:	01c12803          	lw	a6,28(sp)
    5fa8:	02012883          	lw	a7,32(sp)
    5fac:	000d0993          	mv	s3,s10
    5fb0:	000a8d13          	mv	s10,s5
    5fb4:	000c8a93          	mv	s5,s9
    5fb8:	000d8c93          	mv	s9,s11
    5fbc:	280d0e63          	beqz	s10,6258 <_vfiprintf_r+0x15cc>
    5fc0:	06300793          	li	a5,99
    5fc4:	33a7d463          	bge	a5,s10,62ec <_vfiprintf_r+0x1660>
    5fc8:	001d0593          	add	a1,s10,1
    5fcc:	00040513          	mv	a0,s0
    5fd0:	01112c23          	sw	a7,24(sp)
    5fd4:	01c12823          	sw	t3,16(sp)
    5fd8:	de8fb0ef          	jal	15c0 <_malloc_r>
    5fdc:	01012e03          	lw	t3,16(sp)
    5fe0:	01812883          	lw	a7,24(sp)
    5fe4:	00050813          	mv	a6,a0
    5fe8:	42050063          	beqz	a0,6408 <_vfiprintf_r+0x177c>
    5fec:	00a12823          	sw	a0,16(sp)
    5ff0:	00800613          	li	a2,8
    5ff4:	00000593          	li	a1,0
    5ff8:	05810513          	add	a0,sp,88
    5ffc:	03112023          	sw	a7,32(sp)
    6000:	01c12e23          	sw	t3,28(sp)
    6004:	01012c23          	sw	a6,24(sp)
    6008:	e5dfa0ef          	jal	e64 <memset>
    600c:	01812803          	lw	a6,24(sp)
    6010:	05810713          	add	a4,sp,88
    6014:	000d0693          	mv	a3,s10
    6018:	00080593          	mv	a1,a6
    601c:	04c10613          	add	a2,sp,76
    6020:	00040513          	mv	a0,s0
    6024:	03d040ef          	jal	a860 <_wcsrtombs_r>
    6028:	01812803          	lw	a6,24(sp)
    602c:	01c12e03          	lw	t3,28(sp)
    6030:	02012883          	lw	a7,32(sp)
    6034:	40ad1063          	bne	s10,a0,6434 <_vfiprintf_r+0x17a8>
    6038:	fffd4e93          	not	t4,s10
    603c:	01a807b3          	add	a5,a6,s10
    6040:	41fede93          	sra	t4,t4,0x1f
    6044:	00078023          	sb	zero,0(a5)
    6048:	01dd7eb3          	and	t4,s10,t4
    604c:	2140006f          	j	6260 <_vfiprintf_r+0x15d4>
    6050:	010e7613          	and	a2,t3,16
    6054:	000aa783          	lw	a5,0(s5)
    6058:	004a8a93          	add	s5,s5,4
    605c:	02061263          	bnez	a2,6080 <_vfiprintf_r+0x13f4>
    6060:	040e7613          	and	a2,t3,64
    6064:	00060a63          	beqz	a2,6078 <_vfiprintf_r+0x13ec>
    6068:	01079793          	sll	a5,a5,0x10
    606c:	0107d793          	srl	a5,a5,0x10
    6070:	00000593          	li	a1,0
    6074:	e1dff06f          	j	5e90 <_vfiprintf_r+0x1204>
    6078:	200e7613          	and	a2,t3,512
    607c:	22061e63          	bnez	a2,62b8 <_vfiprintf_r+0x162c>
    6080:	00000593          	li	a1,0
    6084:	e0dff06f          	j	5e90 <_vfiprintf_r+0x1204>
    6088:	400e7793          	and	a5,t3,1024
    608c:	00000693          	li	a3,0
    6090:	11010e93          	add	t4,sp,272
    6094:	01812823          	sw	s8,16(sp)
    6098:	02812223          	sw	s0,36(sp)
    609c:	03912c23          	sw	s9,56(sp)
    60a0:	03512e23          	sw	s5,60(sp)
    60a4:	02c12c83          	lw	s9,44(sp)
    60a8:	01c12c23          	sw	t3,24(sp)
    60ac:	01112e23          	sw	a7,28(sp)
    60b0:	02e12023          	sw	a4,32(sp)
    60b4:	00078c13          	mv	s8,a5
    60b8:	00068413          	mv	s0,a3
    60bc:	03312423          	sw	s3,40(sp)
    60c0:	000e8a93          	mv	s5,t4
    60c4:	0280006f          	j	60ec <_vfiprintf_r+0x1460>
    60c8:	00a00613          	li	a2,10
    60cc:	00000693          	li	a3,0
    60d0:	000d8513          	mv	a0,s11
    60d4:	000d0593          	mv	a1,s10
    60d8:	268050ef          	jal	b340 <__udivdi3>
    60dc:	220d0a63          	beqz	s10,6310 <_vfiprintf_r+0x1684>
    60e0:	00050d93          	mv	s11,a0
    60e4:	00058d13          	mv	s10,a1
    60e8:	00098a93          	mv	s5,s3
    60ec:	00a00613          	li	a2,10
    60f0:	00000693          	li	a3,0
    60f4:	000d8513          	mv	a0,s11
    60f8:	000d0593          	mv	a1,s10
    60fc:	0f1050ef          	jal	b9ec <__umoddi3>
    6100:	03050513          	add	a0,a0,48
    6104:	feaa8fa3          	sb	a0,-1(s5)
    6108:	fffa8993          	add	s3,s5,-1
    610c:	00140413          	add	s0,s0,1
    6110:	fa0c0ce3          	beqz	s8,60c8 <_vfiprintf_r+0x143c>
    6114:	000cc783          	lbu	a5,0(s9)
    6118:	fa8798e3          	bne	a5,s0,60c8 <_vfiprintf_r+0x143c>
    611c:	0ff00793          	li	a5,255
    6120:	faf404e3          	beq	s0,a5,60c8 <_vfiprintf_r+0x143c>
    6124:	0e0d1a63          	bnez	s10,6218 <_vfiprintf_r+0x158c>
    6128:	00900793          	li	a5,9
    612c:	0fb7e663          	bltu	a5,s11,6218 <_vfiprintf_r+0x158c>
    6130:	00098813          	mv	a6,s3
    6134:	03912623          	sw	s9,44(sp)
    6138:	01012c03          	lw	s8,16(sp)
    613c:	01812e03          	lw	t3,24(sp)
    6140:	01c12883          	lw	a7,28(sp)
    6144:	02012703          	lw	a4,32(sp)
    6148:	02412403          	lw	s0,36(sp)
    614c:	02812983          	lw	s3,40(sp)
    6150:	03812c83          	lw	s9,56(sp)
    6154:	03c12a83          	lw	s5,60(sp)
    6158:	9a1ff06f          	j	5af8 <_vfiprintf_r+0xe6c>
    615c:	00068e13          	mv	t3,a3
    6160:	00000693          	li	a3,0
    6164:	c0068263          	beqz	a3,5568 <_vfiprintf_r+0x8dc>
    6168:	95dff06f          	j	5ac4 <_vfiprintf_r+0xe38>
    616c:	00040513          	mv	a0,s0
    6170:	115000ef          	jal	6a84 <__sinit>
    6174:	b61fe06f          	j	4cd4 <_vfiprintf_r+0x48>
    6178:	001cc683          	lbu	a3,1(s9)
    617c:	200ded93          	or	s11,s11,512
    6180:	001c8c93          	add	s9,s9,1
    6184:	c89fe06f          	j	4e0c <_vfiprintf_r+0x180>
    6188:	001cc683          	lbu	a3,1(s9)
    618c:	020ded93          	or	s11,s11,32
    6190:	001c8c93          	add	s9,s9,1
    6194:	c79fe06f          	j	4e0c <_vfiprintf_r+0x180>
    6198:	000aa783          	lw	a5,0(s5)
    619c:	00c12703          	lw	a4,12(sp)
    61a0:	004a8a93          	add	s5,s5,4
    61a4:	00e7a023          	sw	a4,0(a5)
    61a8:	bfdfe06f          	j	4da4 <_vfiprintf_r+0x118>
    61ac:	00600793          	li	a5,6
    61b0:	00070d13          	mv	s10,a4
    61b4:	0ce7e863          	bltu	a5,a4,6284 <_vfiprintf_r+0x15f8>
    61b8:	000d0e93          	mv	t4,s10
    61bc:	00009817          	auipc	a6,0x9
    61c0:	df880813          	add	a6,a6,-520 # efb4 <__fini_array_end+0x2a8>
    61c4:	cb9fe06f          	j	4e7c <_vfiprintf_r+0x1f0>
    61c8:	00000793          	li	a5,0
    61cc:	00000593          	li	a1,0
    61d0:	8f5ff06f          	j	5ac4 <_vfiprintf_r+0xe38>
    61d4:	05810713          	add	a4,sp,88
    61d8:	00000693          	li	a3,0
    61dc:	04c10613          	add	a2,sp,76
    61e0:	00000593          	li	a1,0
    61e4:	00040513          	mv	a0,s0
    61e8:	01112e23          	sw	a7,28(sp)
    61ec:	01012c23          	sw	a6,24(sp)
    61f0:	01c12823          	sw	t3,16(sp)
    61f4:	66c040ef          	jal	a860 <_wcsrtombs_r>
    61f8:	fff00793          	li	a5,-1
    61fc:	01012e03          	lw	t3,16(sp)
    6200:	01812803          	lw	a6,24(sp)
    6204:	01c12883          	lw	a7,28(sp)
    6208:	00050d13          	mv	s10,a0
    620c:	1ef50e63          	beq	a0,a5,6408 <_vfiprintf_r+0x177c>
    6210:	05012623          	sw	a6,76(sp)
    6214:	da9ff06f          	j	5fbc <_vfiprintf_r+0x1330>
    6218:	03012783          	lw	a5,48(sp)
    621c:	03412583          	lw	a1,52(sp)
    6220:	00000413          	li	s0,0
    6224:	40f989b3          	sub	s3,s3,a5
    6228:	00078613          	mv	a2,a5
    622c:	00098513          	mv	a0,s3
    6230:	43c010ef          	jal	766c <strncpy>
    6234:	001cc783          	lbu	a5,1(s9)
    6238:	00a00613          	li	a2,10
    623c:	00000693          	li	a3,0
    6240:	00f037b3          	snez	a5,a5
    6244:	000d8513          	mv	a0,s11
    6248:	000d0593          	mv	a1,s10
    624c:	00fc8cb3          	add	s9,s9,a5
    6250:	0f0050ef          	jal	b340 <__udivdi3>
    6254:	e8dff06f          	j	60e0 <_vfiprintf_r+0x1454>
    6258:	00000e93          	li	t4,0
    625c:	00012823          	sw	zero,16(sp)
    6260:	04314783          	lbu	a5,67(sp)
    6264:	00000713          	li	a4,0
    6268:	00000f93          	li	t6,0
    626c:	a0079063          	bnez	a5,546c <_vfiprintf_r+0x7e0>
    6270:	c19fe06f          	j	4e88 <_vfiprintf_r+0x1fc>
    6274:	00100f13          	li	t5,1
    6278:	00000613          	li	a2,0
    627c:	000a0c13          	mv	s8,s4
    6280:	ce9fe06f          	j	4f68 <_vfiprintf_r+0x2dc>
    6284:	00600d13          	li	s10,6
    6288:	f31ff06f          	j	61b8 <_vfiprintf_r+0x152c>
    628c:	00100f13          	li	t5,1
    6290:	000a0c13          	mv	s8,s4
    6294:	c4dfe06f          	j	4ee0 <_vfiprintf_r+0x254>
    6298:	000aa783          	lw	a5,0(s5)
    629c:	00c12703          	lw	a4,12(sp)
    62a0:	004a8a93          	add	s5,s5,4
    62a4:	00e79023          	sh	a4,0(a5)
    62a8:	afdfe06f          	j	4da4 <_vfiprintf_r+0x118>
    62ac:	0ff7fd93          	zext.b	s11,a5
    62b0:	00000d13          	li	s10,0
    62b4:	a04ff06f          	j	54b8 <_vfiprintf_r+0x82c>
    62b8:	0ff7f793          	zext.b	a5,a5
    62bc:	00000593          	li	a1,0
    62c0:	bd1ff06f          	j	5e90 <_vfiprintf_r+0x1204>
    62c4:	0ff7f793          	zext.b	a5,a5
    62c8:	00000593          	li	a1,0
    62cc:	a5cff06f          	j	5528 <_vfiprintf_r+0x89c>
    62d0:	01879d93          	sll	s11,a5,0x18
    62d4:	418ddd93          	sra	s11,s11,0x18
    62d8:	41fddd13          	sra	s10,s11,0x1f
    62dc:	000d0693          	mv	a3,s10
    62e0:	95cff06f          	j	543c <_vfiprintf_r+0x7b0>
    62e4:	03000793          	li	a5,48
    62e8:	c8cff06f          	j	5774 <_vfiprintf_r+0xae8>
    62ec:	00012823          	sw	zero,16(sp)
    62f0:	0ac10813          	add	a6,sp,172
    62f4:	cfdff06f          	j	5ff0 <_vfiprintf_r+0x1364>
    62f8:	0589a503          	lw	a0,88(s3)
    62fc:	b65fa0ef          	jal	e60 <__retarget_lock_release_recursive>
    6300:	d51fe06f          	j	5050 <_vfiprintf_r+0x3c4>
    6304:	00070e93          	mv	t4,a4
    6308:	00070d13          	mv	s10,a4
    630c:	f55ff06f          	j	6260 <_vfiprintf_r+0x15d4>
    6310:	00900793          	li	a5,9
    6314:	ddb7e6e3          	bltu	a5,s11,60e0 <_vfiprintf_r+0x1454>
    6318:	e19ff06f          	j	6130 <_vfiprintf_r+0x14a4>
    631c:	00058513          	mv	a0,a1
    6320:	00009317          	auipc	t1,0x9
    6324:	2f030313          	add	t1,t1,752 # f610 <blanks.1>
    6328:	8cdff06f          	j	5bf4 <_vfiprintf_r+0xf68>
    632c:	00080513          	mv	a0,a6
    6330:	03112023          	sw	a7,32(sp)
    6334:	01012c23          	sw	a6,24(sp)
    6338:	01b12e23          	sw	s11,28(sp)
    633c:	da9fa0ef          	jal	10e4 <strlen>
    6340:	fff54e93          	not	t4,a0
    6344:	41fede93          	sra	t4,t4,0x1f
    6348:	01812803          	lw	a6,24(sp)
    634c:	01c12e03          	lw	t3,28(sp)
    6350:	02012883          	lw	a7,32(sp)
    6354:	00050d13          	mv	s10,a0
    6358:	01d57eb3          	and	t4,a0,t4
    635c:	00012823          	sw	zero,16(sp)
    6360:	f01ff06f          	j	6260 <_vfiprintf_r+0x15d4>
    6364:	06010613          	add	a2,sp,96
    6368:	00098593          	mv	a1,s3
    636c:	00040513          	mv	a0,s0
    6370:	fe0fe0ef          	jal	4b50 <__sprint_r.part.0>
    6374:	00051463          	bnez	a0,637c <_vfiprintf_r+0x16f0>
    6378:	dc5fe06f          	j	513c <_vfiprintf_r+0x4b0>
    637c:	df5fe06f          	j	5170 <_vfiprintf_r+0x4e4>
    6380:	00168613          	add	a2,a3,1
    6384:	00009317          	auipc	t1,0x9
    6388:	28c30313          	add	t1,t1,652 # f610 <blanks.1>
    638c:	f19fe06f          	j	52a4 <_vfiprintf_r+0x618>
    6390:	000f0513          	mv	a0,t5
    6394:	00009f97          	auipc	t6,0x9
    6398:	26cf8f93          	add	t6,t6,620 # f600 <zeroes.0>
    639c:	d10ff06f          	j	58ac <_vfiprintf_r+0xc20>
    63a0:	0649a783          	lw	a5,100(s3)
    63a4:	0017f793          	and	a5,a5,1
    63a8:	00079c63          	bnez	a5,63c0 <_vfiprintf_r+0x1734>
    63ac:	00c9d783          	lhu	a5,12(s3)
    63b0:	2007f793          	and	a5,a5,512
    63b4:	00079663          	bnez	a5,63c0 <_vfiprintf_r+0x1734>
    63b8:	0589a503          	lw	a0,88(s3)
    63bc:	aa5fa0ef          	jal	e60 <__retarget_lock_release_recursive>
    63c0:	fff00793          	li	a5,-1
    63c4:	00f12623          	sw	a5,12(sp)
    63c8:	de5fe06f          	j	51ac <_vfiprintf_r+0x520>
    63cc:	00098713          	mv	a4,s3
    63d0:	000c8a93          	mv	s5,s9
    63d4:	000d0993          	mv	s3,s10
    63d8:	01012c03          	lw	s8,16(sp)
    63dc:	01812e03          	lw	t3,24(sp)
    63e0:	01c12803          	lw	a6,28(sp)
    63e4:	02012883          	lw	a7,32(sp)
    63e8:	000d8c93          	mv	s9,s11
    63ec:	00070d13          	mv	s10,a4
    63f0:	bcdff06f          	j	5fbc <_vfiprintf_r+0x1330>
    63f4:	00cd1783          	lh	a5,12(s10)
    63f8:	000d0993          	mv	s3,s10
    63fc:	0407e793          	or	a5,a5,64
    6400:	00fd1623          	sh	a5,12(s10)
    6404:	d71fe06f          	j	5174 <_vfiprintf_r+0x4e8>
    6408:	00c99783          	lh	a5,12(s3)
    640c:	0407e793          	or	a5,a5,64
    6410:	00f99623          	sh	a5,12(s3)
    6414:	d61fe06f          	j	5174 <_vfiprintf_r+0x4e8>
    6418:	000aa703          	lw	a4,0(s5)
    641c:	004a8a93          	add	s5,s5,4
    6420:	00075463          	bgez	a4,6428 <_vfiprintf_r+0x179c>
    6424:	fff00713          	li	a4,-1
    6428:	001cc683          	lbu	a3,1(s9)
    642c:	00058c93          	mv	s9,a1
    6430:	9ddfe06f          	j	4e0c <_vfiprintf_r+0x180>
    6434:	00c9d783          	lhu	a5,12(s3)
    6438:	0407e793          	or	a5,a5,64
    643c:	00f99623          	sh	a5,12(s3)
    6440:	d1dfe06f          	j	515c <_vfiprintf_r+0x4d0>

00006444 <__sbprintf>:
    6444:	b7010113          	add	sp,sp,-1168
    6448:	00c59783          	lh	a5,12(a1)
    644c:	00e5d703          	lhu	a4,14(a1)
    6450:	48812423          	sw	s0,1160(sp)
    6454:	00058413          	mv	s0,a1
    6458:	000105b7          	lui	a1,0x10
    645c:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x79d>
    6460:	06442303          	lw	t1,100(s0)
    6464:	01c42883          	lw	a7,28(s0)
    6468:	02442803          	lw	a6,36(s0)
    646c:	01071713          	sll	a4,a4,0x10
    6470:	00b7f7b3          	and	a5,a5,a1
    6474:	00e7e7b3          	or	a5,a5,a4
    6478:	40000593          	li	a1,1024
    647c:	49212023          	sw	s2,1152(sp)
    6480:	00f12a23          	sw	a5,20(sp)
    6484:	00050913          	mv	s2,a0
    6488:	07010793          	add	a5,sp,112
    648c:	06010513          	add	a0,sp,96
    6490:	48112623          	sw	ra,1164(sp)
    6494:	48912223          	sw	s1,1156(sp)
    6498:	47312e23          	sw	s3,1148(sp)
    649c:	00060493          	mv	s1,a2
    64a0:	00068993          	mv	s3,a3
    64a4:	06612623          	sw	t1,108(sp)
    64a8:	03112223          	sw	a7,36(sp)
    64ac:	03012623          	sw	a6,44(sp)
    64b0:	00f12423          	sw	a5,8(sp)
    64b4:	00f12c23          	sw	a5,24(sp)
    64b8:	00b12823          	sw	a1,16(sp)
    64bc:	00b12e23          	sw	a1,28(sp)
    64c0:	02012023          	sw	zero,32(sp)
    64c4:	991fa0ef          	jal	e54 <__retarget_lock_init_recursive>
    64c8:	00048613          	mv	a2,s1
    64cc:	00098693          	mv	a3,s3
    64d0:	00810593          	add	a1,sp,8
    64d4:	00090513          	mv	a0,s2
    64d8:	fb4fe0ef          	jal	4c8c <_vfiprintf_r>
    64dc:	00050493          	mv	s1,a0
    64e0:	04055263          	bgez	a0,6524 <__sbprintf+0xe0>
    64e4:	01415783          	lhu	a5,20(sp)
    64e8:	0407f793          	and	a5,a5,64
    64ec:	00078863          	beqz	a5,64fc <__sbprintf+0xb8>
    64f0:	00c45783          	lhu	a5,12(s0)
    64f4:	0407e793          	or	a5,a5,64
    64f8:	00f41623          	sh	a5,12(s0)
    64fc:	06012503          	lw	a0,96(sp)
    6500:	959fa0ef          	jal	e58 <__retarget_lock_close_recursive>
    6504:	48c12083          	lw	ra,1164(sp)
    6508:	48812403          	lw	s0,1160(sp)
    650c:	48012903          	lw	s2,1152(sp)
    6510:	47c12983          	lw	s3,1148(sp)
    6514:	00048513          	mv	a0,s1
    6518:	48412483          	lw	s1,1156(sp)
    651c:	49010113          	add	sp,sp,1168
    6520:	00008067          	ret
    6524:	00810593          	add	a1,sp,8
    6528:	00090513          	mv	a0,s2
    652c:	25c000ef          	jal	6788 <_fflush_r>
    6530:	fa050ae3          	beqz	a0,64e4 <__sbprintf+0xa0>
    6534:	fff00493          	li	s1,-1
    6538:	fadff06f          	j	64e4 <__sbprintf+0xa0>

0000653c <__sflush_r>:
    653c:	00c59703          	lh	a4,12(a1)
    6540:	fe010113          	add	sp,sp,-32
    6544:	00812c23          	sw	s0,24(sp)
    6548:	01312623          	sw	s3,12(sp)
    654c:	00112e23          	sw	ra,28(sp)
    6550:	00877793          	and	a5,a4,8
    6554:	00058413          	mv	s0,a1
    6558:	00050993          	mv	s3,a0
    655c:	12079063          	bnez	a5,667c <__sflush_r+0x140>
    6560:	000017b7          	lui	a5,0x1
    6564:	80078793          	add	a5,a5,-2048 # 800 <main+0x530>
    6568:	0045a683          	lw	a3,4(a1)
    656c:	00f767b3          	or	a5,a4,a5
    6570:	00f59623          	sh	a5,12(a1)
    6574:	18d05263          	blez	a3,66f8 <__sflush_r+0x1bc>
    6578:	02842803          	lw	a6,40(s0)
    657c:	0e080463          	beqz	a6,6664 <__sflush_r+0x128>
    6580:	00912a23          	sw	s1,20(sp)
    6584:	01371693          	sll	a3,a4,0x13
    6588:	0009a483          	lw	s1,0(s3)
    658c:	0009a023          	sw	zero,0(s3)
    6590:	01c42583          	lw	a1,28(s0)
    6594:	1606ce63          	bltz	a3,6710 <__sflush_r+0x1d4>
    6598:	00000613          	li	a2,0
    659c:	00100693          	li	a3,1
    65a0:	00098513          	mv	a0,s3
    65a4:	000800e7          	jalr	a6
    65a8:	fff00793          	li	a5,-1
    65ac:	00050613          	mv	a2,a0
    65b0:	1af50463          	beq	a0,a5,6758 <__sflush_r+0x21c>
    65b4:	00c41783          	lh	a5,12(s0)
    65b8:	02842803          	lw	a6,40(s0)
    65bc:	01c42583          	lw	a1,28(s0)
    65c0:	0047f793          	and	a5,a5,4
    65c4:	00078e63          	beqz	a5,65e0 <__sflush_r+0xa4>
    65c8:	00442703          	lw	a4,4(s0)
    65cc:	03042783          	lw	a5,48(s0)
    65d0:	40e60633          	sub	a2,a2,a4
    65d4:	00078663          	beqz	a5,65e0 <__sflush_r+0xa4>
    65d8:	03c42783          	lw	a5,60(s0)
    65dc:	40f60633          	sub	a2,a2,a5
    65e0:	00000693          	li	a3,0
    65e4:	00098513          	mv	a0,s3
    65e8:	000800e7          	jalr	a6
    65ec:	fff00793          	li	a5,-1
    65f0:	12f51463          	bne	a0,a5,6718 <__sflush_r+0x1dc>
    65f4:	0009a683          	lw	a3,0(s3)
    65f8:	01d00793          	li	a5,29
    65fc:	00c41703          	lh	a4,12(s0)
    6600:	16d7ea63          	bltu	a5,a3,6774 <__sflush_r+0x238>
    6604:	204007b7          	lui	a5,0x20400
    6608:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    660c:	00d7d7b3          	srl	a5,a5,a3
    6610:	0017f793          	and	a5,a5,1
    6614:	16078063          	beqz	a5,6774 <__sflush_r+0x238>
    6618:	01042603          	lw	a2,16(s0)
    661c:	fffff7b7          	lui	a5,0xfffff
    6620:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6624:	00f777b3          	and	a5,a4,a5
    6628:	00f41623          	sh	a5,12(s0)
    662c:	00042223          	sw	zero,4(s0)
    6630:	00c42023          	sw	a2,0(s0)
    6634:	01371793          	sll	a5,a4,0x13
    6638:	0007d463          	bgez	a5,6640 <__sflush_r+0x104>
    663c:	10068263          	beqz	a3,6740 <__sflush_r+0x204>
    6640:	03042583          	lw	a1,48(s0)
    6644:	0099a023          	sw	s1,0(s3)
    6648:	10058463          	beqz	a1,6750 <__sflush_r+0x214>
    664c:	04040793          	add	a5,s0,64
    6650:	00f58663          	beq	a1,a5,665c <__sflush_r+0x120>
    6654:	00098513          	mv	a0,s3
    6658:	c5dfa0ef          	jal	12b4 <_free_r>
    665c:	01412483          	lw	s1,20(sp)
    6660:	02042823          	sw	zero,48(s0)
    6664:	00000513          	li	a0,0
    6668:	01c12083          	lw	ra,28(sp)
    666c:	01812403          	lw	s0,24(sp)
    6670:	00c12983          	lw	s3,12(sp)
    6674:	02010113          	add	sp,sp,32
    6678:	00008067          	ret
    667c:	01212823          	sw	s2,16(sp)
    6680:	0105a903          	lw	s2,16(a1)
    6684:	08090263          	beqz	s2,6708 <__sflush_r+0x1cc>
    6688:	00912a23          	sw	s1,20(sp)
    668c:	0005a483          	lw	s1,0(a1)
    6690:	00377713          	and	a4,a4,3
    6694:	0125a023          	sw	s2,0(a1)
    6698:	412484b3          	sub	s1,s1,s2
    669c:	00000793          	li	a5,0
    66a0:	00071463          	bnez	a4,66a8 <__sflush_r+0x16c>
    66a4:	0145a783          	lw	a5,20(a1)
    66a8:	00f42423          	sw	a5,8(s0)
    66ac:	00904863          	bgtz	s1,66bc <__sflush_r+0x180>
    66b0:	0540006f          	j	6704 <__sflush_r+0x1c8>
    66b4:	00a90933          	add	s2,s2,a0
    66b8:	04905663          	blez	s1,6704 <__sflush_r+0x1c8>
    66bc:	02442783          	lw	a5,36(s0)
    66c0:	01c42583          	lw	a1,28(s0)
    66c4:	00048693          	mv	a3,s1
    66c8:	00090613          	mv	a2,s2
    66cc:	00098513          	mv	a0,s3
    66d0:	000780e7          	jalr	a5
    66d4:	40a484b3          	sub	s1,s1,a0
    66d8:	fca04ee3          	bgtz	a0,66b4 <__sflush_r+0x178>
    66dc:	00c41703          	lh	a4,12(s0)
    66e0:	01012903          	lw	s2,16(sp)
    66e4:	04076713          	or	a4,a4,64
    66e8:	01412483          	lw	s1,20(sp)
    66ec:	00e41623          	sh	a4,12(s0)
    66f0:	fff00513          	li	a0,-1
    66f4:	f75ff06f          	j	6668 <__sflush_r+0x12c>
    66f8:	03c5a683          	lw	a3,60(a1)
    66fc:	e6d04ee3          	bgtz	a3,6578 <__sflush_r+0x3c>
    6700:	f65ff06f          	j	6664 <__sflush_r+0x128>
    6704:	01412483          	lw	s1,20(sp)
    6708:	01012903          	lw	s2,16(sp)
    670c:	f59ff06f          	j	6664 <__sflush_r+0x128>
    6710:	05042603          	lw	a2,80(s0)
    6714:	eadff06f          	j	65c0 <__sflush_r+0x84>
    6718:	00c41703          	lh	a4,12(s0)
    671c:	01042683          	lw	a3,16(s0)
    6720:	fffff7b7          	lui	a5,0xfffff
    6724:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6728:	00f777b3          	and	a5,a4,a5
    672c:	00f41623          	sh	a5,12(s0)
    6730:	00042223          	sw	zero,4(s0)
    6734:	00d42023          	sw	a3,0(s0)
    6738:	01371793          	sll	a5,a4,0x13
    673c:	f007d2e3          	bgez	a5,6640 <__sflush_r+0x104>
    6740:	03042583          	lw	a1,48(s0)
    6744:	04a42823          	sw	a0,80(s0)
    6748:	0099a023          	sw	s1,0(s3)
    674c:	f00590e3          	bnez	a1,664c <__sflush_r+0x110>
    6750:	01412483          	lw	s1,20(sp)
    6754:	f11ff06f          	j	6664 <__sflush_r+0x128>
    6758:	0009a783          	lw	a5,0(s3)
    675c:	e4078ce3          	beqz	a5,65b4 <__sflush_r+0x78>
    6760:	01d00713          	li	a4,29
    6764:	00e78c63          	beq	a5,a4,677c <__sflush_r+0x240>
    6768:	01600713          	li	a4,22
    676c:	00e78863          	beq	a5,a4,677c <__sflush_r+0x240>
    6770:	00c41703          	lh	a4,12(s0)
    6774:	04076713          	or	a4,a4,64
    6778:	f71ff06f          	j	66e8 <__sflush_r+0x1ac>
    677c:	0099a023          	sw	s1,0(s3)
    6780:	01412483          	lw	s1,20(sp)
    6784:	ee1ff06f          	j	6664 <__sflush_r+0x128>

00006788 <_fflush_r>:
    6788:	ff010113          	add	sp,sp,-16
    678c:	00812423          	sw	s0,8(sp)
    6790:	00912223          	sw	s1,4(sp)
    6794:	00112623          	sw	ra,12(sp)
    6798:	01212023          	sw	s2,0(sp)
    679c:	00050493          	mv	s1,a0
    67a0:	00058413          	mv	s0,a1
    67a4:	00050663          	beqz	a0,67b0 <_fflush_r+0x28>
    67a8:	03452783          	lw	a5,52(a0)
    67ac:	0a078a63          	beqz	a5,6860 <_fflush_r+0xd8>
    67b0:	00c41783          	lh	a5,12(s0)
    67b4:	00000913          	li	s2,0
    67b8:	04078063          	beqz	a5,67f8 <_fflush_r+0x70>
    67bc:	06442703          	lw	a4,100(s0)
    67c0:	00177713          	and	a4,a4,1
    67c4:	00071663          	bnez	a4,67d0 <_fflush_r+0x48>
    67c8:	2007f793          	and	a5,a5,512
    67cc:	04078463          	beqz	a5,6814 <_fflush_r+0x8c>
    67d0:	00040593          	mv	a1,s0
    67d4:	00048513          	mv	a0,s1
    67d8:	d65ff0ef          	jal	653c <__sflush_r>
    67dc:	06442783          	lw	a5,100(s0)
    67e0:	00050913          	mv	s2,a0
    67e4:	0017f793          	and	a5,a5,1
    67e8:	00079863          	bnez	a5,67f8 <_fflush_r+0x70>
    67ec:	00c45783          	lhu	a5,12(s0)
    67f0:	2007f793          	and	a5,a5,512
    67f4:	04078463          	beqz	a5,683c <_fflush_r+0xb4>
    67f8:	00c12083          	lw	ra,12(sp)
    67fc:	00812403          	lw	s0,8(sp)
    6800:	00412483          	lw	s1,4(sp)
    6804:	00090513          	mv	a0,s2
    6808:	00012903          	lw	s2,0(sp)
    680c:	01010113          	add	sp,sp,16
    6810:	00008067          	ret
    6814:	05842503          	lw	a0,88(s0)
    6818:	e44fa0ef          	jal	e5c <__retarget_lock_acquire_recursive>
    681c:	00040593          	mv	a1,s0
    6820:	00048513          	mv	a0,s1
    6824:	d19ff0ef          	jal	653c <__sflush_r>
    6828:	06442783          	lw	a5,100(s0)
    682c:	00050913          	mv	s2,a0
    6830:	0017f793          	and	a5,a5,1
    6834:	fc0792e3          	bnez	a5,67f8 <_fflush_r+0x70>
    6838:	fb5ff06f          	j	67ec <_fflush_r+0x64>
    683c:	05842503          	lw	a0,88(s0)
    6840:	e20fa0ef          	jal	e60 <__retarget_lock_release_recursive>
    6844:	00c12083          	lw	ra,12(sp)
    6848:	00812403          	lw	s0,8(sp)
    684c:	00412483          	lw	s1,4(sp)
    6850:	00090513          	mv	a0,s2
    6854:	00012903          	lw	s2,0(sp)
    6858:	01010113          	add	sp,sp,16
    685c:	00008067          	ret
    6860:	224000ef          	jal	6a84 <__sinit>
    6864:	f4dff06f          	j	67b0 <_fflush_r+0x28>

00006868 <stdio_exit_handler>:
    6868:	7fffa617          	auipc	a2,0x7fffa
    686c:	cc060613          	add	a2,a2,-832 # 80000528 <__sglue>
    6870:	00004597          	auipc	a1,0x4
    6874:	00058593          	mv	a1,a1
    6878:	7fff9517          	auipc	a0,0x7fff9
    687c:	78850513          	add	a0,a0,1928 # 80000000 <_impure_data>
    6880:	7a00006f          	j	7020 <_fwalk_sglue>

00006884 <cleanup_stdio>:
    6884:	00452583          	lw	a1,4(a0)
    6888:	ff010113          	add	sp,sp,-16
    688c:	00812423          	sw	s0,8(sp)
    6890:	00112623          	sw	ra,12(sp)
    6894:	7fffa797          	auipc	a5,0x7fffa
    6898:	30878793          	add	a5,a5,776 # 80000b9c <__sf>
    689c:	00050413          	mv	s0,a0
    68a0:	00f58463          	beq	a1,a5,68a8 <cleanup_stdio+0x24>
    68a4:	7cd030ef          	jal	a870 <_fclose_r>
    68a8:	00842583          	lw	a1,8(s0)
    68ac:	7fffa797          	auipc	a5,0x7fffa
    68b0:	35878793          	add	a5,a5,856 # 80000c04 <__sf+0x68>
    68b4:	00f58663          	beq	a1,a5,68c0 <cleanup_stdio+0x3c>
    68b8:	00040513          	mv	a0,s0
    68bc:	7b5030ef          	jal	a870 <_fclose_r>
    68c0:	00c42583          	lw	a1,12(s0)
    68c4:	7fffa797          	auipc	a5,0x7fffa
    68c8:	3a878793          	add	a5,a5,936 # 80000c6c <__sf+0xd0>
    68cc:	00f58c63          	beq	a1,a5,68e4 <cleanup_stdio+0x60>
    68d0:	00040513          	mv	a0,s0
    68d4:	00812403          	lw	s0,8(sp)
    68d8:	00c12083          	lw	ra,12(sp)
    68dc:	01010113          	add	sp,sp,16
    68e0:	7910306f          	j	a870 <_fclose_r>
    68e4:	00c12083          	lw	ra,12(sp)
    68e8:	00812403          	lw	s0,8(sp)
    68ec:	01010113          	add	sp,sp,16
    68f0:	00008067          	ret

000068f4 <global_stdio_init.part.0>:
    68f4:	fe010113          	add	sp,sp,-32
    68f8:	00000797          	auipc	a5,0x0
    68fc:	f7078793          	add	a5,a5,-144 # 6868 <stdio_exit_handler>
    6900:	00112e23          	sw	ra,28(sp)
    6904:	00812c23          	sw	s0,24(sp)
    6908:	00912a23          	sw	s1,20(sp)
    690c:	7fffa417          	auipc	s0,0x7fffa
    6910:	29040413          	add	s0,s0,656 # 80000b9c <__sf>
    6914:	01212823          	sw	s2,16(sp)
    6918:	01312623          	sw	s3,12(sp)
    691c:	01412423          	sw	s4,8(sp)
    6920:	00800613          	li	a2,8
    6924:	00000593          	li	a1,0
    6928:	7fffa717          	auipc	a4,0x7fffa
    692c:	e0f72423          	sw	a5,-504(a4) # 80000730 <__stdio_exit_handler>
    6930:	7fffa517          	auipc	a0,0x7fffa
    6934:	2c850513          	add	a0,a0,712 # 80000bf8 <__sf+0x5c>
    6938:	00400793          	li	a5,4
    693c:	00f42623          	sw	a5,12(s0)
    6940:	00042023          	sw	zero,0(s0)
    6944:	00042223          	sw	zero,4(s0)
    6948:	00042423          	sw	zero,8(s0)
    694c:	06042223          	sw	zero,100(s0)
    6950:	00042823          	sw	zero,16(s0)
    6954:	00042a23          	sw	zero,20(s0)
    6958:	00042c23          	sw	zero,24(s0)
    695c:	d08fa0ef          	jal	e64 <memset>
    6960:	00000a17          	auipc	s4,0x0
    6964:	774a0a13          	add	s4,s4,1908 # 70d4 <__sread>
    6968:	00000997          	auipc	s3,0x0
    696c:	7c898993          	add	s3,s3,1992 # 7130 <__swrite>
    6970:	00001917          	auipc	s2,0x1
    6974:	84890913          	add	s2,s2,-1976 # 71b8 <__sseek>
    6978:	00001497          	auipc	s1,0x1
    697c:	8b848493          	add	s1,s1,-1864 # 7230 <__sclose>
    6980:	7fffa517          	auipc	a0,0x7fffa
    6984:	27450513          	add	a0,a0,628 # 80000bf4 <__sf+0x58>
    6988:	03442023          	sw	s4,32(s0)
    698c:	03342223          	sw	s3,36(s0)
    6990:	03242423          	sw	s2,40(s0)
    6994:	02942623          	sw	s1,44(s0)
    6998:	00842e23          	sw	s0,28(s0)
    699c:	cb8fa0ef          	jal	e54 <__retarget_lock_init_recursive>
    69a0:	000107b7          	lui	a5,0x10
    69a4:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x7a9>
    69a8:	00800613          	li	a2,8
    69ac:	00000593          	li	a1,0
    69b0:	7fffa517          	auipc	a0,0x7fffa
    69b4:	2b050513          	add	a0,a0,688 # 80000c60 <__sf+0xc4>
    69b8:	06f42a23          	sw	a5,116(s0)
    69bc:	06042423          	sw	zero,104(s0)
    69c0:	06042623          	sw	zero,108(s0)
    69c4:	06042823          	sw	zero,112(s0)
    69c8:	0c042623          	sw	zero,204(s0)
    69cc:	06042c23          	sw	zero,120(s0)
    69d0:	06042e23          	sw	zero,124(s0)
    69d4:	08042023          	sw	zero,128(s0)
    69d8:	c8cfa0ef          	jal	e64 <memset>
    69dc:	7fffa797          	auipc	a5,0x7fffa
    69e0:	22878793          	add	a5,a5,552 # 80000c04 <__sf+0x68>
    69e4:	7fffa517          	auipc	a0,0x7fffa
    69e8:	27850513          	add	a0,a0,632 # 80000c5c <__sf+0xc0>
    69ec:	08f42223          	sw	a5,132(s0)
    69f0:	09442423          	sw	s4,136(s0)
    69f4:	09342623          	sw	s3,140(s0)
    69f8:	09242823          	sw	s2,144(s0)
    69fc:	08942a23          	sw	s1,148(s0)
    6a00:	c54fa0ef          	jal	e54 <__retarget_lock_init_recursive>
    6a04:	000207b7          	lui	a5,0x20
    6a08:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6a0c:	00800613          	li	a2,8
    6a10:	00000593          	li	a1,0
    6a14:	7fffa517          	auipc	a0,0x7fffa
    6a18:	2b450513          	add	a0,a0,692 # 80000cc8 <__sf+0x12c>
    6a1c:	0cf42e23          	sw	a5,220(s0)
    6a20:	0c042823          	sw	zero,208(s0)
    6a24:	0c042a23          	sw	zero,212(s0)
    6a28:	0c042c23          	sw	zero,216(s0)
    6a2c:	12042a23          	sw	zero,308(s0)
    6a30:	0e042023          	sw	zero,224(s0)
    6a34:	0e042223          	sw	zero,228(s0)
    6a38:	0e042423          	sw	zero,232(s0)
    6a3c:	c28fa0ef          	jal	e64 <memset>
    6a40:	7fffa797          	auipc	a5,0x7fffa
    6a44:	22c78793          	add	a5,a5,556 # 80000c6c <__sf+0xd0>
    6a48:	0f442823          	sw	s4,240(s0)
    6a4c:	0f342a23          	sw	s3,244(s0)
    6a50:	0f242c23          	sw	s2,248(s0)
    6a54:	0e942e23          	sw	s1,252(s0)
    6a58:	0ef42623          	sw	a5,236(s0)
    6a5c:	01812403          	lw	s0,24(sp)
    6a60:	01c12083          	lw	ra,28(sp)
    6a64:	01412483          	lw	s1,20(sp)
    6a68:	01012903          	lw	s2,16(sp)
    6a6c:	00c12983          	lw	s3,12(sp)
    6a70:	00812a03          	lw	s4,8(sp)
    6a74:	7fffa517          	auipc	a0,0x7fffa
    6a78:	25050513          	add	a0,a0,592 # 80000cc4 <__sf+0x128>
    6a7c:	02010113          	add	sp,sp,32
    6a80:	bd4fa06f          	j	e54 <__retarget_lock_init_recursive>

00006a84 <__sinit>:
    6a84:	ff010113          	add	sp,sp,-16
    6a88:	00812423          	sw	s0,8(sp)
    6a8c:	00050413          	mv	s0,a0
    6a90:	7fffa517          	auipc	a0,0x7fffa
    6a94:	c9050513          	add	a0,a0,-880 # 80000720 <__lock___sfp_recursive_mutex>
    6a98:	00112623          	sw	ra,12(sp)
    6a9c:	bc0fa0ef          	jal	e5c <__retarget_lock_acquire_recursive>
    6aa0:	03442783          	lw	a5,52(s0)
    6aa4:	00079e63          	bnez	a5,6ac0 <__sinit+0x3c>
    6aa8:	00000797          	auipc	a5,0x0
    6aac:	ddc78793          	add	a5,a5,-548 # 6884 <cleanup_stdio>
    6ab0:	02f42a23          	sw	a5,52(s0)
    6ab4:	7fffa797          	auipc	a5,0x7fffa
    6ab8:	c7c7a783          	lw	a5,-900(a5) # 80000730 <__stdio_exit_handler>
    6abc:	00078e63          	beqz	a5,6ad8 <__sinit+0x54>
    6ac0:	00812403          	lw	s0,8(sp)
    6ac4:	00c12083          	lw	ra,12(sp)
    6ac8:	7fffa517          	auipc	a0,0x7fffa
    6acc:	c5850513          	add	a0,a0,-936 # 80000720 <__lock___sfp_recursive_mutex>
    6ad0:	01010113          	add	sp,sp,16
    6ad4:	b8cfa06f          	j	e60 <__retarget_lock_release_recursive>
    6ad8:	e1dff0ef          	jal	68f4 <global_stdio_init.part.0>
    6adc:	00812403          	lw	s0,8(sp)
    6ae0:	00c12083          	lw	ra,12(sp)
    6ae4:	7fffa517          	auipc	a0,0x7fffa
    6ae8:	c3c50513          	add	a0,a0,-964 # 80000720 <__lock___sfp_recursive_mutex>
    6aec:	01010113          	add	sp,sp,16
    6af0:	b70fa06f          	j	e60 <__retarget_lock_release_recursive>

00006af4 <__sfp_lock_acquire>:
    6af4:	7fffa517          	auipc	a0,0x7fffa
    6af8:	c2c50513          	add	a0,a0,-980 # 80000720 <__lock___sfp_recursive_mutex>
    6afc:	b60fa06f          	j	e5c <__retarget_lock_acquire_recursive>

00006b00 <__sfp_lock_release>:
    6b00:	7fffa517          	auipc	a0,0x7fffa
    6b04:	c2050513          	add	a0,a0,-992 # 80000720 <__lock___sfp_recursive_mutex>
    6b08:	b58fa06f          	j	e60 <__retarget_lock_release_recursive>

00006b0c <__sfvwrite_r>:
    6b0c:	00862783          	lw	a5,8(a2)
    6b10:	2c078463          	beqz	a5,6dd8 <__sfvwrite_r+0x2cc>
    6b14:	00c59683          	lh	a3,12(a1) # a87c <_fclose_r+0xc>
    6b18:	fd010113          	add	sp,sp,-48
    6b1c:	02812423          	sw	s0,40(sp)
    6b20:	01412c23          	sw	s4,24(sp)
    6b24:	01612823          	sw	s6,16(sp)
    6b28:	02112623          	sw	ra,44(sp)
    6b2c:	0086f793          	and	a5,a3,8
    6b30:	00060b13          	mv	s6,a2
    6b34:	00050a13          	mv	s4,a0
    6b38:	00058413          	mv	s0,a1
    6b3c:	08078e63          	beqz	a5,6bd8 <__sfvwrite_r+0xcc>
    6b40:	0105a783          	lw	a5,16(a1)
    6b44:	08078a63          	beqz	a5,6bd8 <__sfvwrite_r+0xcc>
    6b48:	02912223          	sw	s1,36(sp)
    6b4c:	03212023          	sw	s2,32(sp)
    6b50:	01312e23          	sw	s3,28(sp)
    6b54:	01512a23          	sw	s5,20(sp)
    6b58:	0026f793          	and	a5,a3,2
    6b5c:	000b2483          	lw	s1,0(s6)
    6b60:	0a078463          	beqz	a5,6c08 <__sfvwrite_r+0xfc>
    6b64:	02442783          	lw	a5,36(s0)
    6b68:	01c42583          	lw	a1,28(s0)
    6b6c:	80000ab7          	lui	s5,0x80000
    6b70:	00000993          	li	s3,0
    6b74:	00000913          	li	s2,0
    6b78:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6b7c:	00098613          	mv	a2,s3
    6b80:	000a0513          	mv	a0,s4
    6b84:	04090263          	beqz	s2,6bc8 <__sfvwrite_r+0xbc>
    6b88:	00090693          	mv	a3,s2
    6b8c:	012af463          	bgeu	s5,s2,6b94 <__sfvwrite_r+0x88>
    6b90:	000a8693          	mv	a3,s5
    6b94:	000780e7          	jalr	a5
    6b98:	46a05263          	blez	a0,6ffc <__sfvwrite_r+0x4f0>
    6b9c:	008b2783          	lw	a5,8(s6)
    6ba0:	00a989b3          	add	s3,s3,a0
    6ba4:	40a90933          	sub	s2,s2,a0
    6ba8:	40a787b3          	sub	a5,a5,a0
    6bac:	00fb2423          	sw	a5,8(s6)
    6bb0:	1a078663          	beqz	a5,6d5c <__sfvwrite_r+0x250>
    6bb4:	02442783          	lw	a5,36(s0)
    6bb8:	01c42583          	lw	a1,28(s0)
    6bbc:	00098613          	mv	a2,s3
    6bc0:	000a0513          	mv	a0,s4
    6bc4:	fc0912e3          	bnez	s2,6b88 <__sfvwrite_r+0x7c>
    6bc8:	0004a983          	lw	s3,0(s1)
    6bcc:	0044a903          	lw	s2,4(s1)
    6bd0:	00848493          	add	s1,s1,8
    6bd4:	fa9ff06f          	j	6b7c <__sfvwrite_r+0x70>
    6bd8:	00040593          	mv	a1,s0
    6bdc:	000a0513          	mv	a0,s4
    6be0:	658000ef          	jal	7238 <__swsetup_r>
    6be4:	1c051c63          	bnez	a0,6dbc <__sfvwrite_r+0x2b0>
    6be8:	00c41683          	lh	a3,12(s0)
    6bec:	02912223          	sw	s1,36(sp)
    6bf0:	03212023          	sw	s2,32(sp)
    6bf4:	01312e23          	sw	s3,28(sp)
    6bf8:	01512a23          	sw	s5,20(sp)
    6bfc:	0026f793          	and	a5,a3,2
    6c00:	000b2483          	lw	s1,0(s6)
    6c04:	f60790e3          	bnez	a5,6b64 <__sfvwrite_r+0x58>
    6c08:	01712623          	sw	s7,12(sp)
    6c0c:	01812423          	sw	s8,8(sp)
    6c10:	0016f793          	and	a5,a3,1
    6c14:	1c079663          	bnez	a5,6de0 <__sfvwrite_r+0x2d4>
    6c18:	00042783          	lw	a5,0(s0)
    6c1c:	00842703          	lw	a4,8(s0)
    6c20:	80000ab7          	lui	s5,0x80000
    6c24:	01912223          	sw	s9,4(sp)
    6c28:	00000b93          	li	s7,0
    6c2c:	00000993          	li	s3,0
    6c30:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6c34:	00078513          	mv	a0,a5
    6c38:	00070c13          	mv	s8,a4
    6c3c:	10098263          	beqz	s3,6d40 <__sfvwrite_r+0x234>
    6c40:	2006f613          	and	a2,a3,512
    6c44:	28060863          	beqz	a2,6ed4 <__sfvwrite_r+0x3c8>
    6c48:	00070c93          	mv	s9,a4
    6c4c:	32e9e863          	bltu	s3,a4,6f7c <__sfvwrite_r+0x470>
    6c50:	4806f713          	and	a4,a3,1152
    6c54:	08070a63          	beqz	a4,6ce8 <__sfvwrite_r+0x1dc>
    6c58:	01442603          	lw	a2,20(s0)
    6c5c:	01042583          	lw	a1,16(s0)
    6c60:	00161713          	sll	a4,a2,0x1
    6c64:	00c70733          	add	a4,a4,a2
    6c68:	40b78933          	sub	s2,a5,a1
    6c6c:	01f75c13          	srl	s8,a4,0x1f
    6c70:	00ec0c33          	add	s8,s8,a4
    6c74:	00190793          	add	a5,s2,1
    6c78:	401c5c13          	sra	s8,s8,0x1
    6c7c:	013787b3          	add	a5,a5,s3
    6c80:	000c0613          	mv	a2,s8
    6c84:	00fc7663          	bgeu	s8,a5,6c90 <__sfvwrite_r+0x184>
    6c88:	00078c13          	mv	s8,a5
    6c8c:	00078613          	mv	a2,a5
    6c90:	4006f693          	and	a3,a3,1024
    6c94:	32068063          	beqz	a3,6fb4 <__sfvwrite_r+0x4a8>
    6c98:	00060593          	mv	a1,a2
    6c9c:	000a0513          	mv	a0,s4
    6ca0:	921fa0ef          	jal	15c0 <_malloc_r>
    6ca4:	00050c93          	mv	s9,a0
    6ca8:	34050e63          	beqz	a0,7004 <__sfvwrite_r+0x4f8>
    6cac:	01042583          	lw	a1,16(s0)
    6cb0:	00090613          	mv	a2,s2
    6cb4:	a8cfa0ef          	jal	f40 <memcpy>
    6cb8:	00c45783          	lhu	a5,12(s0)
    6cbc:	b7f7f793          	and	a5,a5,-1153
    6cc0:	0807e793          	or	a5,a5,128
    6cc4:	00f41623          	sh	a5,12(s0)
    6cc8:	012c8533          	add	a0,s9,s2
    6ccc:	412c07b3          	sub	a5,s8,s2
    6cd0:	01942823          	sw	s9,16(s0)
    6cd4:	01842a23          	sw	s8,20(s0)
    6cd8:	00a42023          	sw	a0,0(s0)
    6cdc:	00098c13          	mv	s8,s3
    6ce0:	00f42423          	sw	a5,8(s0)
    6ce4:	00098c93          	mv	s9,s3
    6ce8:	000c8613          	mv	a2,s9
    6cec:	000b8593          	mv	a1,s7
    6cf0:	41d000ef          	jal	790c <memmove>
    6cf4:	00842703          	lw	a4,8(s0)
    6cf8:	00042783          	lw	a5,0(s0)
    6cfc:	00098913          	mv	s2,s3
    6d00:	41870733          	sub	a4,a4,s8
    6d04:	019787b3          	add	a5,a5,s9
    6d08:	00e42423          	sw	a4,8(s0)
    6d0c:	00f42023          	sw	a5,0(s0)
    6d10:	00000993          	li	s3,0
    6d14:	008b2783          	lw	a5,8(s6)
    6d18:	012b8bb3          	add	s7,s7,s2
    6d1c:	412787b3          	sub	a5,a5,s2
    6d20:	00fb2423          	sw	a5,8(s6)
    6d24:	02078663          	beqz	a5,6d50 <__sfvwrite_r+0x244>
    6d28:	00042783          	lw	a5,0(s0)
    6d2c:	00842703          	lw	a4,8(s0)
    6d30:	00c41683          	lh	a3,12(s0)
    6d34:	00078513          	mv	a0,a5
    6d38:	00070c13          	mv	s8,a4
    6d3c:	f00992e3          	bnez	s3,6c40 <__sfvwrite_r+0x134>
    6d40:	0004ab83          	lw	s7,0(s1)
    6d44:	0044a983          	lw	s3,4(s1)
    6d48:	00848493          	add	s1,s1,8
    6d4c:	ee9ff06f          	j	6c34 <__sfvwrite_r+0x128>
    6d50:	00c12b83          	lw	s7,12(sp)
    6d54:	00812c03          	lw	s8,8(sp)
    6d58:	00412c83          	lw	s9,4(sp)
    6d5c:	02c12083          	lw	ra,44(sp)
    6d60:	02812403          	lw	s0,40(sp)
    6d64:	02412483          	lw	s1,36(sp)
    6d68:	02012903          	lw	s2,32(sp)
    6d6c:	01c12983          	lw	s3,28(sp)
    6d70:	01412a83          	lw	s5,20(sp)
    6d74:	01812a03          	lw	s4,24(sp)
    6d78:	01012b03          	lw	s6,16(sp)
    6d7c:	00000513          	li	a0,0
    6d80:	03010113          	add	sp,sp,48
    6d84:	00008067          	ret
    6d88:	00040593          	mv	a1,s0
    6d8c:	000a0513          	mv	a0,s4
    6d90:	9f9ff0ef          	jal	6788 <_fflush_r>
    6d94:	0a050e63          	beqz	a0,6e50 <__sfvwrite_r+0x344>
    6d98:	00c41783          	lh	a5,12(s0)
    6d9c:	00c12b83          	lw	s7,12(sp)
    6da0:	00812c03          	lw	s8,8(sp)
    6da4:	02412483          	lw	s1,36(sp)
    6da8:	02012903          	lw	s2,32(sp)
    6dac:	01c12983          	lw	s3,28(sp)
    6db0:	01412a83          	lw	s5,20(sp)
    6db4:	0407e793          	or	a5,a5,64
    6db8:	00f41623          	sh	a5,12(s0)
    6dbc:	02c12083          	lw	ra,44(sp)
    6dc0:	02812403          	lw	s0,40(sp)
    6dc4:	01812a03          	lw	s4,24(sp)
    6dc8:	01012b03          	lw	s6,16(sp)
    6dcc:	fff00513          	li	a0,-1
    6dd0:	03010113          	add	sp,sp,48
    6dd4:	00008067          	ret
    6dd8:	00000513          	li	a0,0
    6ddc:	00008067          	ret
    6de0:	00000a93          	li	s5,0
    6de4:	00000513          	li	a0,0
    6de8:	00000c13          	li	s8,0
    6dec:	00000993          	li	s3,0
    6df0:	08098263          	beqz	s3,6e74 <__sfvwrite_r+0x368>
    6df4:	08050a63          	beqz	a0,6e88 <__sfvwrite_r+0x37c>
    6df8:	000a8793          	mv	a5,s5
    6dfc:	00098b93          	mv	s7,s3
    6e00:	0137f463          	bgeu	a5,s3,6e08 <__sfvwrite_r+0x2fc>
    6e04:	00078b93          	mv	s7,a5
    6e08:	00042503          	lw	a0,0(s0)
    6e0c:	01042783          	lw	a5,16(s0)
    6e10:	00842903          	lw	s2,8(s0)
    6e14:	01442683          	lw	a3,20(s0)
    6e18:	00a7f663          	bgeu	a5,a0,6e24 <__sfvwrite_r+0x318>
    6e1c:	00d90933          	add	s2,s2,a3
    6e20:	09794463          	blt	s2,s7,6ea8 <__sfvwrite_r+0x39c>
    6e24:	16dbc263          	blt	s7,a3,6f88 <__sfvwrite_r+0x47c>
    6e28:	02442783          	lw	a5,36(s0)
    6e2c:	01c42583          	lw	a1,28(s0)
    6e30:	000c0613          	mv	a2,s8
    6e34:	000a0513          	mv	a0,s4
    6e38:	000780e7          	jalr	a5
    6e3c:	00050913          	mv	s2,a0
    6e40:	f4a05ce3          	blez	a0,6d98 <__sfvwrite_r+0x28c>
    6e44:	412a8ab3          	sub	s5,s5,s2
    6e48:	00100513          	li	a0,1
    6e4c:	f20a8ee3          	beqz	s5,6d88 <__sfvwrite_r+0x27c>
    6e50:	008b2783          	lw	a5,8(s6)
    6e54:	012c0c33          	add	s8,s8,s2
    6e58:	412989b3          	sub	s3,s3,s2
    6e5c:	412787b3          	sub	a5,a5,s2
    6e60:	00fb2423          	sw	a5,8(s6)
    6e64:	f80796e3          	bnez	a5,6df0 <__sfvwrite_r+0x2e4>
    6e68:	00c12b83          	lw	s7,12(sp)
    6e6c:	00812c03          	lw	s8,8(sp)
    6e70:	eedff06f          	j	6d5c <__sfvwrite_r+0x250>
    6e74:	0044a983          	lw	s3,4(s1)
    6e78:	00048793          	mv	a5,s1
    6e7c:	00848493          	add	s1,s1,8
    6e80:	fe098ae3          	beqz	s3,6e74 <__sfvwrite_r+0x368>
    6e84:	0007ac03          	lw	s8,0(a5)
    6e88:	00098613          	mv	a2,s3
    6e8c:	00a00593          	li	a1,10
    6e90:	000c0513          	mv	a0,s8
    6e94:	714000ef          	jal	75a8 <memchr>
    6e98:	14050c63          	beqz	a0,6ff0 <__sfvwrite_r+0x4e4>
    6e9c:	00150513          	add	a0,a0,1
    6ea0:	41850ab3          	sub	s5,a0,s8
    6ea4:	f55ff06f          	j	6df8 <__sfvwrite_r+0x2ec>
    6ea8:	000c0593          	mv	a1,s8
    6eac:	00090613          	mv	a2,s2
    6eb0:	25d000ef          	jal	790c <memmove>
    6eb4:	00042783          	lw	a5,0(s0)
    6eb8:	00040593          	mv	a1,s0
    6ebc:	000a0513          	mv	a0,s4
    6ec0:	012787b3          	add	a5,a5,s2
    6ec4:	00f42023          	sw	a5,0(s0)
    6ec8:	8c1ff0ef          	jal	6788 <_fflush_r>
    6ecc:	f6050ce3          	beqz	a0,6e44 <__sfvwrite_r+0x338>
    6ed0:	ec9ff06f          	j	6d98 <__sfvwrite_r+0x28c>
    6ed4:	01042683          	lw	a3,16(s0)
    6ed8:	04f6e463          	bltu	a3,a5,6f20 <__sfvwrite_r+0x414>
    6edc:	01442583          	lw	a1,20(s0)
    6ee0:	04b9e063          	bltu	s3,a1,6f20 <__sfvwrite_r+0x414>
    6ee4:	00098913          	mv	s2,s3
    6ee8:	013af463          	bgeu	s5,s3,6ef0 <__sfvwrite_r+0x3e4>
    6eec:	000a8913          	mv	s2,s5
    6ef0:	00090513          	mv	a0,s2
    6ef4:	561070ef          	jal	ec54 <__modsi3>
    6ef8:	02442783          	lw	a5,36(s0)
    6efc:	01c42583          	lw	a1,28(s0)
    6f00:	40a906b3          	sub	a3,s2,a0
    6f04:	000b8613          	mv	a2,s7
    6f08:	000a0513          	mv	a0,s4
    6f0c:	000780e7          	jalr	a5
    6f10:	00050913          	mv	s2,a0
    6f14:	04a05a63          	blez	a0,6f68 <__sfvwrite_r+0x45c>
    6f18:	412989b3          	sub	s3,s3,s2
    6f1c:	df9ff06f          	j	6d14 <__sfvwrite_r+0x208>
    6f20:	00070913          	mv	s2,a4
    6f24:	00e9f463          	bgeu	s3,a4,6f2c <__sfvwrite_r+0x420>
    6f28:	00098913          	mv	s2,s3
    6f2c:	00078513          	mv	a0,a5
    6f30:	00090613          	mv	a2,s2
    6f34:	000b8593          	mv	a1,s7
    6f38:	1d5000ef          	jal	790c <memmove>
    6f3c:	00842703          	lw	a4,8(s0)
    6f40:	00042783          	lw	a5,0(s0)
    6f44:	41270733          	sub	a4,a4,s2
    6f48:	012787b3          	add	a5,a5,s2
    6f4c:	00e42423          	sw	a4,8(s0)
    6f50:	00f42023          	sw	a5,0(s0)
    6f54:	fc0712e3          	bnez	a4,6f18 <__sfvwrite_r+0x40c>
    6f58:	00040593          	mv	a1,s0
    6f5c:	000a0513          	mv	a0,s4
    6f60:	829ff0ef          	jal	6788 <_fflush_r>
    6f64:	fa050ae3          	beqz	a0,6f18 <__sfvwrite_r+0x40c>
    6f68:	00c41783          	lh	a5,12(s0)
    6f6c:	00c12b83          	lw	s7,12(sp)
    6f70:	00812c03          	lw	s8,8(sp)
    6f74:	00412c83          	lw	s9,4(sp)
    6f78:	e2dff06f          	j	6da4 <__sfvwrite_r+0x298>
    6f7c:	00098c13          	mv	s8,s3
    6f80:	00098c93          	mv	s9,s3
    6f84:	d65ff06f          	j	6ce8 <__sfvwrite_r+0x1dc>
    6f88:	000b8613          	mv	a2,s7
    6f8c:	000c0593          	mv	a1,s8
    6f90:	17d000ef          	jal	790c <memmove>
    6f94:	00842703          	lw	a4,8(s0)
    6f98:	00042783          	lw	a5,0(s0)
    6f9c:	000b8913          	mv	s2,s7
    6fa0:	41770733          	sub	a4,a4,s7
    6fa4:	017787b3          	add	a5,a5,s7
    6fa8:	00e42423          	sw	a4,8(s0)
    6fac:	00f42023          	sw	a5,0(s0)
    6fb0:	e95ff06f          	j	6e44 <__sfvwrite_r+0x338>
    6fb4:	000a0513          	mv	a0,s4
    6fb8:	27c030ef          	jal	a234 <_realloc_r>
    6fbc:	00050c93          	mv	s9,a0
    6fc0:	d00514e3          	bnez	a0,6cc8 <__sfvwrite_r+0x1bc>
    6fc4:	01042583          	lw	a1,16(s0)
    6fc8:	000a0513          	mv	a0,s4
    6fcc:	ae8fa0ef          	jal	12b4 <_free_r>
    6fd0:	00c41783          	lh	a5,12(s0)
    6fd4:	00c00713          	li	a4,12
    6fd8:	00c12b83          	lw	s7,12(sp)
    6fdc:	00812c03          	lw	s8,8(sp)
    6fe0:	00412c83          	lw	s9,4(sp)
    6fe4:	00ea2023          	sw	a4,0(s4)
    6fe8:	f7f7f793          	and	a5,a5,-129
    6fec:	db9ff06f          	j	6da4 <__sfvwrite_r+0x298>
    6ff0:	00198793          	add	a5,s3,1
    6ff4:	00078a93          	mv	s5,a5
    6ff8:	e05ff06f          	j	6dfc <__sfvwrite_r+0x2f0>
    6ffc:	00c41783          	lh	a5,12(s0)
    7000:	da5ff06f          	j	6da4 <__sfvwrite_r+0x298>
    7004:	00c00713          	li	a4,12
    7008:	00c41783          	lh	a5,12(s0)
    700c:	00c12b83          	lw	s7,12(sp)
    7010:	00812c03          	lw	s8,8(sp)
    7014:	00412c83          	lw	s9,4(sp)
    7018:	00ea2023          	sw	a4,0(s4)
    701c:	d89ff06f          	j	6da4 <__sfvwrite_r+0x298>

00007020 <_fwalk_sglue>:
    7020:	fd010113          	add	sp,sp,-48
    7024:	03212023          	sw	s2,32(sp)
    7028:	01312e23          	sw	s3,28(sp)
    702c:	01412c23          	sw	s4,24(sp)
    7030:	01512a23          	sw	s5,20(sp)
    7034:	01612823          	sw	s6,16(sp)
    7038:	01712623          	sw	s7,12(sp)
    703c:	02112623          	sw	ra,44(sp)
    7040:	02812423          	sw	s0,40(sp)
    7044:	02912223          	sw	s1,36(sp)
    7048:	00050b13          	mv	s6,a0
    704c:	00058b93          	mv	s7,a1
    7050:	00060a93          	mv	s5,a2
    7054:	00000a13          	li	s4,0
    7058:	00100993          	li	s3,1
    705c:	fff00913          	li	s2,-1
    7060:	004aa483          	lw	s1,4(s5)
    7064:	008aa403          	lw	s0,8(s5)
    7068:	fff48493          	add	s1,s1,-1
    706c:	0204c863          	bltz	s1,709c <_fwalk_sglue+0x7c>
    7070:	00c45783          	lhu	a5,12(s0)
    7074:	00f9fe63          	bgeu	s3,a5,7090 <_fwalk_sglue+0x70>
    7078:	00e41783          	lh	a5,14(s0)
    707c:	00040593          	mv	a1,s0
    7080:	000b0513          	mv	a0,s6
    7084:	01278663          	beq	a5,s2,7090 <_fwalk_sglue+0x70>
    7088:	000b80e7          	jalr	s7
    708c:	00aa6a33          	or	s4,s4,a0
    7090:	fff48493          	add	s1,s1,-1
    7094:	06840413          	add	s0,s0,104
    7098:	fd249ce3          	bne	s1,s2,7070 <_fwalk_sglue+0x50>
    709c:	000aaa83          	lw	s5,0(s5)
    70a0:	fc0a90e3          	bnez	s5,7060 <_fwalk_sglue+0x40>
    70a4:	02c12083          	lw	ra,44(sp)
    70a8:	02812403          	lw	s0,40(sp)
    70ac:	02412483          	lw	s1,36(sp)
    70b0:	02012903          	lw	s2,32(sp)
    70b4:	01c12983          	lw	s3,28(sp)
    70b8:	01412a83          	lw	s5,20(sp)
    70bc:	01012b03          	lw	s6,16(sp)
    70c0:	00c12b83          	lw	s7,12(sp)
    70c4:	000a0513          	mv	a0,s4
    70c8:	01812a03          	lw	s4,24(sp)
    70cc:	03010113          	add	sp,sp,48
    70d0:	00008067          	ret

000070d4 <__sread>:
    70d4:	ff010113          	add	sp,sp,-16
    70d8:	00812423          	sw	s0,8(sp)
    70dc:	00058413          	mv	s0,a1
    70e0:	00e59583          	lh	a1,14(a1)
    70e4:	00112623          	sw	ra,12(sp)
    70e8:	704000ef          	jal	77ec <_read_r>
    70ec:	02054063          	bltz	a0,710c <__sread+0x38>
    70f0:	05042783          	lw	a5,80(s0)
    70f4:	00c12083          	lw	ra,12(sp)
    70f8:	00a787b3          	add	a5,a5,a0
    70fc:	04f42823          	sw	a5,80(s0)
    7100:	00812403          	lw	s0,8(sp)
    7104:	01010113          	add	sp,sp,16
    7108:	00008067          	ret
    710c:	00c45783          	lhu	a5,12(s0)
    7110:	fffff737          	lui	a4,0xfffff
    7114:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7118:	00e7f7b3          	and	a5,a5,a4
    711c:	00c12083          	lw	ra,12(sp)
    7120:	00f41623          	sh	a5,12(s0)
    7124:	00812403          	lw	s0,8(sp)
    7128:	01010113          	add	sp,sp,16
    712c:	00008067          	ret

00007130 <__swrite>:
    7130:	00c59783          	lh	a5,12(a1)
    7134:	fe010113          	add	sp,sp,-32
    7138:	00812c23          	sw	s0,24(sp)
    713c:	00912a23          	sw	s1,20(sp)
    7140:	01212823          	sw	s2,16(sp)
    7144:	01312623          	sw	s3,12(sp)
    7148:	00112e23          	sw	ra,28(sp)
    714c:	1007f713          	and	a4,a5,256
    7150:	00058413          	mv	s0,a1
    7154:	00050493          	mv	s1,a0
    7158:	00060913          	mv	s2,a2
    715c:	00068993          	mv	s3,a3
    7160:	04071063          	bnez	a4,71a0 <__swrite+0x70>
    7164:	fffff737          	lui	a4,0xfffff
    7168:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    716c:	00e7f7b3          	and	a5,a5,a4
    7170:	00e41583          	lh	a1,14(s0)
    7174:	00f41623          	sh	a5,12(s0)
    7178:	01812403          	lw	s0,24(sp)
    717c:	01c12083          	lw	ra,28(sp)
    7180:	00098693          	mv	a3,s3
    7184:	00090613          	mv	a2,s2
    7188:	00c12983          	lw	s3,12(sp)
    718c:	01012903          	lw	s2,16(sp)
    7190:	00048513          	mv	a0,s1
    7194:	01412483          	lw	s1,20(sp)
    7198:	02010113          	add	sp,sp,32
    719c:	70c0006f          	j	78a8 <_write_r>
    71a0:	00e59583          	lh	a1,14(a1)
    71a4:	00200693          	li	a3,2
    71a8:	00000613          	li	a2,0
    71ac:	5dc000ef          	jal	7788 <_lseek_r>
    71b0:	00c41783          	lh	a5,12(s0)
    71b4:	fb1ff06f          	j	7164 <__swrite+0x34>

000071b8 <__sseek>:
    71b8:	ff010113          	add	sp,sp,-16
    71bc:	00812423          	sw	s0,8(sp)
    71c0:	00058413          	mv	s0,a1
    71c4:	00e59583          	lh	a1,14(a1)
    71c8:	00112623          	sw	ra,12(sp)
    71cc:	5bc000ef          	jal	7788 <_lseek_r>
    71d0:	fff00793          	li	a5,-1
    71d4:	02f50863          	beq	a0,a5,7204 <__sseek+0x4c>
    71d8:	00c45783          	lhu	a5,12(s0)
    71dc:	00001737          	lui	a4,0x1
    71e0:	00c12083          	lw	ra,12(sp)
    71e4:	00e7e7b3          	or	a5,a5,a4
    71e8:	01079793          	sll	a5,a5,0x10
    71ec:	4107d793          	sra	a5,a5,0x10
    71f0:	04a42823          	sw	a0,80(s0)
    71f4:	00f41623          	sh	a5,12(s0)
    71f8:	00812403          	lw	s0,8(sp)
    71fc:	01010113          	add	sp,sp,16
    7200:	00008067          	ret
    7204:	00c45783          	lhu	a5,12(s0)
    7208:	fffff737          	lui	a4,0xfffff
    720c:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7210:	00e7f7b3          	and	a5,a5,a4
    7214:	01079793          	sll	a5,a5,0x10
    7218:	4107d793          	sra	a5,a5,0x10
    721c:	00c12083          	lw	ra,12(sp)
    7220:	00f41623          	sh	a5,12(s0)
    7224:	00812403          	lw	s0,8(sp)
    7228:	01010113          	add	sp,sp,16
    722c:	00008067          	ret

00007230 <__sclose>:
    7230:	00e59583          	lh	a1,14(a1)
    7234:	4fc0006f          	j	7730 <_close_r>

00007238 <__swsetup_r>:
    7238:	ff010113          	add	sp,sp,-16
    723c:	00812423          	sw	s0,8(sp)
    7240:	00912223          	sw	s1,4(sp)
    7244:	00112623          	sw	ra,12(sp)
    7248:	7fff9797          	auipc	a5,0x7fff9
    724c:	4c07a783          	lw	a5,1216(a5) # 80000708 <_impure_ptr>
    7250:	00050493          	mv	s1,a0
    7254:	00058413          	mv	s0,a1
    7258:	00078663          	beqz	a5,7264 <__swsetup_r+0x2c>
    725c:	0347a703          	lw	a4,52(a5)
    7260:	0e070c63          	beqz	a4,7358 <__swsetup_r+0x120>
    7264:	00c41783          	lh	a5,12(s0)
    7268:	0087f713          	and	a4,a5,8
    726c:	06070a63          	beqz	a4,72e0 <__swsetup_r+0xa8>
    7270:	01042703          	lw	a4,16(s0)
    7274:	08070663          	beqz	a4,7300 <__swsetup_r+0xc8>
    7278:	0017f693          	and	a3,a5,1
    727c:	02068863          	beqz	a3,72ac <__swsetup_r+0x74>
    7280:	01442683          	lw	a3,20(s0)
    7284:	00042423          	sw	zero,8(s0)
    7288:	00000513          	li	a0,0
    728c:	40d006b3          	neg	a3,a3
    7290:	00d42c23          	sw	a3,24(s0)
    7294:	02070a63          	beqz	a4,72c8 <__swsetup_r+0x90>
    7298:	00c12083          	lw	ra,12(sp)
    729c:	00812403          	lw	s0,8(sp)
    72a0:	00412483          	lw	s1,4(sp)
    72a4:	01010113          	add	sp,sp,16
    72a8:	00008067          	ret
    72ac:	0027f693          	and	a3,a5,2
    72b0:	00000613          	li	a2,0
    72b4:	00069463          	bnez	a3,72bc <__swsetup_r+0x84>
    72b8:	01442603          	lw	a2,20(s0)
    72bc:	00c42423          	sw	a2,8(s0)
    72c0:	00000513          	li	a0,0
    72c4:	fc071ae3          	bnez	a4,7298 <__swsetup_r+0x60>
    72c8:	0807f713          	and	a4,a5,128
    72cc:	fc0706e3          	beqz	a4,7298 <__swsetup_r+0x60>
    72d0:	0407e793          	or	a5,a5,64
    72d4:	00f41623          	sh	a5,12(s0)
    72d8:	fff00513          	li	a0,-1
    72dc:	fbdff06f          	j	7298 <__swsetup_r+0x60>
    72e0:	0107f713          	and	a4,a5,16
    72e4:	08070063          	beqz	a4,7364 <__swsetup_r+0x12c>
    72e8:	0047f713          	and	a4,a5,4
    72ec:	02071c63          	bnez	a4,7324 <__swsetup_r+0xec>
    72f0:	01042703          	lw	a4,16(s0)
    72f4:	0087e793          	or	a5,a5,8
    72f8:	00f41623          	sh	a5,12(s0)
    72fc:	f6071ee3          	bnez	a4,7278 <__swsetup_r+0x40>
    7300:	2807f693          	and	a3,a5,640
    7304:	20000613          	li	a2,512
    7308:	f6c688e3          	beq	a3,a2,7278 <__swsetup_r+0x40>
    730c:	00040593          	mv	a1,s0
    7310:	00048513          	mv	a0,s1
    7314:	6cc030ef          	jal	a9e0 <__smakebuf_r>
    7318:	00c41783          	lh	a5,12(s0)
    731c:	01042703          	lw	a4,16(s0)
    7320:	f59ff06f          	j	7278 <__swsetup_r+0x40>
    7324:	03042583          	lw	a1,48(s0)
    7328:	00058e63          	beqz	a1,7344 <__swsetup_r+0x10c>
    732c:	04040713          	add	a4,s0,64
    7330:	00e58863          	beq	a1,a4,7340 <__swsetup_r+0x108>
    7334:	00048513          	mv	a0,s1
    7338:	f7df90ef          	jal	12b4 <_free_r>
    733c:	00c41783          	lh	a5,12(s0)
    7340:	02042823          	sw	zero,48(s0)
    7344:	01042703          	lw	a4,16(s0)
    7348:	fdb7f793          	and	a5,a5,-37
    734c:	00042223          	sw	zero,4(s0)
    7350:	00e42023          	sw	a4,0(s0)
    7354:	fa1ff06f          	j	72f4 <__swsetup_r+0xbc>
    7358:	00078513          	mv	a0,a5
    735c:	f28ff0ef          	jal	6a84 <__sinit>
    7360:	f05ff06f          	j	7264 <__swsetup_r+0x2c>
    7364:	00900713          	li	a4,9
    7368:	00e4a023          	sw	a4,0(s1)
    736c:	0407e793          	or	a5,a5,64
    7370:	00f41623          	sh	a5,12(s0)
    7374:	fff00513          	li	a0,-1
    7378:	f21ff06f          	j	7298 <__swsetup_r+0x60>

0000737c <__fputwc>:
    737c:	fc010113          	add	sp,sp,-64
    7380:	02812c23          	sw	s0,56(sp)
    7384:	03412423          	sw	s4,40(sp)
    7388:	03512223          	sw	s5,36(sp)
    738c:	02112e23          	sw	ra,60(sp)
    7390:	02912a23          	sw	s1,52(sp)
    7394:	03312623          	sw	s3,44(sp)
    7398:	00050a13          	mv	s4,a0
    739c:	00058a93          	mv	s5,a1
    73a0:	00060413          	mv	s0,a2
    73a4:	374000ef          	jal	7718 <__locale_mb_cur_max>
    73a8:	00100793          	li	a5,1
    73ac:	02f51663          	bne	a0,a5,73d8 <__fputwc+0x5c>
    73b0:	fffa8793          	add	a5,s5,-1
    73b4:	0fe00713          	li	a4,254
    73b8:	02f76063          	bltu	a4,a5,73d8 <__fputwc+0x5c>
    73bc:	03212823          	sw	s2,48(sp)
    73c0:	03612023          	sw	s6,32(sp)
    73c4:	01712e23          	sw	s7,28(sp)
    73c8:	01510423          	sb	s5,8(sp)
    73cc:	00100993          	li	s3,1
    73d0:	00810493          	add	s1,sp,8
    73d4:	0380006f          	j	740c <__fputwc+0x90>
    73d8:	00810493          	add	s1,sp,8
    73dc:	05c40693          	add	a3,s0,92
    73e0:	000a8613          	mv	a2,s5
    73e4:	00048593          	mv	a1,s1
    73e8:	000a0513          	mv	a0,s4
    73ec:	3e8030ef          	jal	a7d4 <_wcrtomb_r>
    73f0:	fff00793          	li	a5,-1
    73f4:	00050993          	mv	s3,a0
    73f8:	0cf50a63          	beq	a0,a5,74cc <__fputwc+0x150>
    73fc:	0a050663          	beqz	a0,74a8 <__fputwc+0x12c>
    7400:	03212823          	sw	s2,48(sp)
    7404:	03612023          	sw	s6,32(sp)
    7408:	01712e23          	sw	s7,28(sp)
    740c:	00000913          	li	s2,0
    7410:	fff00b13          	li	s6,-1
    7414:	00a00b93          	li	s7,10
    7418:	0200006f          	j	7438 <__fputwc+0xbc>
    741c:	00042783          	lw	a5,0(s0)
    7420:	00178693          	add	a3,a5,1
    7424:	00d42023          	sw	a3,0(s0)
    7428:	00e78023          	sb	a4,0(a5)
    742c:	00190913          	add	s2,s2,1
    7430:	00148493          	add	s1,s1,1
    7434:	07397463          	bgeu	s2,s3,749c <__fputwc+0x120>
    7438:	00842783          	lw	a5,8(s0)
    743c:	0004c703          	lbu	a4,0(s1)
    7440:	fff78793          	add	a5,a5,-1
    7444:	00f42423          	sw	a5,8(s0)
    7448:	fc07dae3          	bgez	a5,741c <__fputwc+0xa0>
    744c:	01842683          	lw	a3,24(s0)
    7450:	00040613          	mv	a2,s0
    7454:	00070593          	mv	a1,a4
    7458:	000a0513          	mv	a0,s4
    745c:	00d7c463          	blt	a5,a3,7464 <__fputwc+0xe8>
    7460:	fb771ee3          	bne	a4,s7,741c <__fputwc+0xa0>
    7464:	714030ef          	jal	ab78 <__swbuf_r>
    7468:	fd6512e3          	bne	a0,s6,742c <__fputwc+0xb0>
    746c:	03012903          	lw	s2,48(sp)
    7470:	02012b03          	lw	s6,32(sp)
    7474:	01c12b83          	lw	s7,28(sp)
    7478:	03c12083          	lw	ra,60(sp)
    747c:	03812403          	lw	s0,56(sp)
    7480:	03412483          	lw	s1,52(sp)
    7484:	02c12983          	lw	s3,44(sp)
    7488:	02812a03          	lw	s4,40(sp)
    748c:	02412a83          	lw	s5,36(sp)
    7490:	fff00513          	li	a0,-1
    7494:	04010113          	add	sp,sp,64
    7498:	00008067          	ret
    749c:	03012903          	lw	s2,48(sp)
    74a0:	02012b03          	lw	s6,32(sp)
    74a4:	01c12b83          	lw	s7,28(sp)
    74a8:	03c12083          	lw	ra,60(sp)
    74ac:	03812403          	lw	s0,56(sp)
    74b0:	03412483          	lw	s1,52(sp)
    74b4:	02c12983          	lw	s3,44(sp)
    74b8:	02812a03          	lw	s4,40(sp)
    74bc:	000a8513          	mv	a0,s5
    74c0:	02412a83          	lw	s5,36(sp)
    74c4:	04010113          	add	sp,sp,64
    74c8:	00008067          	ret
    74cc:	00c45783          	lhu	a5,12(s0)
    74d0:	0407e793          	or	a5,a5,64
    74d4:	00f41623          	sh	a5,12(s0)
    74d8:	fa1ff06f          	j	7478 <__fputwc+0xfc>

000074dc <_fputwc_r>:
    74dc:	06462783          	lw	a5,100(a2)
    74e0:	fe010113          	add	sp,sp,-32
    74e4:	00812c23          	sw	s0,24(sp)
    74e8:	00912a23          	sw	s1,20(sp)
    74ec:	0017f713          	and	a4,a5,1
    74f0:	00112e23          	sw	ra,28(sp)
    74f4:	00c61783          	lh	a5,12(a2)
    74f8:	00060413          	mv	s0,a2
    74fc:	00050493          	mv	s1,a0
    7500:	00071663          	bnez	a4,750c <_fputwc_r+0x30>
    7504:	2007f713          	and	a4,a5,512
    7508:	08070463          	beqz	a4,7590 <_fputwc_r+0xb4>
    750c:	01279713          	sll	a4,a5,0x12
    7510:	02074063          	bltz	a4,7530 <_fputwc_r+0x54>
    7514:	06442703          	lw	a4,100(s0)
    7518:	000026b7          	lui	a3,0x2
    751c:	00d7e7b3          	or	a5,a5,a3
    7520:	000026b7          	lui	a3,0x2
    7524:	00d76733          	or	a4,a4,a3
    7528:	00f41623          	sh	a5,12(s0)
    752c:	06e42223          	sw	a4,100(s0)
    7530:	00048513          	mv	a0,s1
    7534:	00040613          	mv	a2,s0
    7538:	e45ff0ef          	jal	737c <__fputwc>
    753c:	06442783          	lw	a5,100(s0)
    7540:	00050493          	mv	s1,a0
    7544:	0017f793          	and	a5,a5,1
    7548:	00079863          	bnez	a5,7558 <_fputwc_r+0x7c>
    754c:	00c45783          	lhu	a5,12(s0)
    7550:	2007f793          	and	a5,a5,512
    7554:	00078e63          	beqz	a5,7570 <_fputwc_r+0x94>
    7558:	01c12083          	lw	ra,28(sp)
    755c:	01812403          	lw	s0,24(sp)
    7560:	00048513          	mv	a0,s1
    7564:	01412483          	lw	s1,20(sp)
    7568:	02010113          	add	sp,sp,32
    756c:	00008067          	ret
    7570:	05842503          	lw	a0,88(s0)
    7574:	8edf90ef          	jal	e60 <__retarget_lock_release_recursive>
    7578:	01c12083          	lw	ra,28(sp)
    757c:	01812403          	lw	s0,24(sp)
    7580:	00048513          	mv	a0,s1
    7584:	01412483          	lw	s1,20(sp)
    7588:	02010113          	add	sp,sp,32
    758c:	00008067          	ret
    7590:	05862503          	lw	a0,88(a2)
    7594:	00b12623          	sw	a1,12(sp)
    7598:	8c5f90ef          	jal	e5c <__retarget_lock_acquire_recursive>
    759c:	00c41783          	lh	a5,12(s0)
    75a0:	00c12583          	lw	a1,12(sp)
    75a4:	f69ff06f          	j	750c <_fputwc_r+0x30>

000075a8 <memchr>:
    75a8:	00357793          	and	a5,a0,3
    75ac:	0ff5f693          	zext.b	a3,a1
    75b0:	02078a63          	beqz	a5,75e4 <memchr+0x3c>
    75b4:	fff60793          	add	a5,a2,-1
    75b8:	02060e63          	beqz	a2,75f4 <memchr+0x4c>
    75bc:	fff00613          	li	a2,-1
    75c0:	0180006f          	j	75d8 <memchr+0x30>
    75c4:	00150513          	add	a0,a0,1
    75c8:	00357713          	and	a4,a0,3
    75cc:	00070e63          	beqz	a4,75e8 <memchr+0x40>
    75d0:	fff78793          	add	a5,a5,-1
    75d4:	02c78063          	beq	a5,a2,75f4 <memchr+0x4c>
    75d8:	00054703          	lbu	a4,0(a0)
    75dc:	fed714e3          	bne	a4,a3,75c4 <memchr+0x1c>
    75e0:	00008067          	ret
    75e4:	00060793          	mv	a5,a2
    75e8:	00300713          	li	a4,3
    75ec:	00f76863          	bltu	a4,a5,75fc <memchr+0x54>
    75f0:	06079063          	bnez	a5,7650 <memchr+0xa8>
    75f4:	00000513          	li	a0,0
    75f8:	00008067          	ret
    75fc:	0ff5f593          	zext.b	a1,a1
    7600:	00859713          	sll	a4,a1,0x8
    7604:	00b705b3          	add	a1,a4,a1
    7608:	01059713          	sll	a4,a1,0x10
    760c:	feff08b7          	lui	a7,0xfeff0
    7610:	80808837          	lui	a6,0x80808
    7614:	00e585b3          	add	a1,a1,a4
    7618:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    761c:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7620:	00300313          	li	t1,3
    7624:	0100006f          	j	7634 <memchr+0x8c>
    7628:	ffc78793          	add	a5,a5,-4
    762c:	00450513          	add	a0,a0,4
    7630:	fcf370e3          	bgeu	t1,a5,75f0 <memchr+0x48>
    7634:	00052703          	lw	a4,0(a0)
    7638:	00e5c733          	xor	a4,a1,a4
    763c:	01170633          	add	a2,a4,a7
    7640:	fff74713          	not	a4,a4
    7644:	00e67733          	and	a4,a2,a4
    7648:	01077733          	and	a4,a4,a6
    764c:	fc070ee3          	beqz	a4,7628 <memchr+0x80>
    7650:	00f507b3          	add	a5,a0,a5
    7654:	00c0006f          	j	7660 <memchr+0xb8>
    7658:	00150513          	add	a0,a0,1
    765c:	f8f50ce3          	beq	a0,a5,75f4 <memchr+0x4c>
    7660:	00054703          	lbu	a4,0(a0)
    7664:	fed71ae3          	bne	a4,a3,7658 <memchr+0xb0>
    7668:	00008067          	ret

0000766c <strncpy>:
    766c:	00a5e7b3          	or	a5,a1,a0
    7670:	0037f793          	and	a5,a5,3
    7674:	00079663          	bnez	a5,7680 <strncpy+0x14>
    7678:	00300793          	li	a5,3
    767c:	04c7e663          	bltu	a5,a2,76c8 <strncpy+0x5c>
    7680:	00050713          	mv	a4,a0
    7684:	01c0006f          	j	76a0 <strncpy+0x34>
    7688:	fff5c683          	lbu	a3,-1(a1)
    768c:	fff60813          	add	a6,a2,-1
    7690:	fed78fa3          	sb	a3,-1(a5)
    7694:	00068e63          	beqz	a3,76b0 <strncpy+0x44>
    7698:	00078713          	mv	a4,a5
    769c:	00080613          	mv	a2,a6
    76a0:	00158593          	add	a1,a1,1
    76a4:	00170793          	add	a5,a4,1
    76a8:	fe0610e3          	bnez	a2,7688 <strncpy+0x1c>
    76ac:	00008067          	ret
    76b0:	00c70733          	add	a4,a4,a2
    76b4:	06080063          	beqz	a6,7714 <strncpy+0xa8>
    76b8:	00178793          	add	a5,a5,1
    76bc:	fe078fa3          	sb	zero,-1(a5)
    76c0:	fee79ce3          	bne	a5,a4,76b8 <strncpy+0x4c>
    76c4:	00008067          	ret
    76c8:	feff0337          	lui	t1,0xfeff0
    76cc:	808088b7          	lui	a7,0x80808
    76d0:	00050713          	mv	a4,a0
    76d4:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    76d8:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    76dc:	00300e13          	li	t3,3
    76e0:	0180006f          	j	76f8 <strncpy+0x8c>
    76e4:	00d72023          	sw	a3,0(a4)
    76e8:	ffc60613          	add	a2,a2,-4
    76ec:	00470713          	add	a4,a4,4
    76f0:	00458593          	add	a1,a1,4
    76f4:	face76e3          	bgeu	t3,a2,76a0 <strncpy+0x34>
    76f8:	0005a683          	lw	a3,0(a1)
    76fc:	006687b3          	add	a5,a3,t1
    7700:	fff6c813          	not	a6,a3
    7704:	0107f7b3          	and	a5,a5,a6
    7708:	0117f7b3          	and	a5,a5,a7
    770c:	fc078ce3          	beqz	a5,76e4 <strncpy+0x78>
    7710:	f91ff06f          	j	76a0 <strncpy+0x34>
    7714:	00008067          	ret

00007718 <__locale_mb_cur_max>:
    7718:	7fff9517          	auipc	a0,0x7fff9
    771c:	f4454503          	lbu	a0,-188(a0) # 8000065c <__global_locale+0x128>
    7720:	00008067          	ret

00007724 <_localeconv_r>:
    7724:	7fff9517          	auipc	a0,0x7fff9
    7728:	f0050513          	add	a0,a0,-256 # 80000624 <__global_locale+0xf0>
    772c:	00008067          	ret

00007730 <_close_r>:
    7730:	ff010113          	add	sp,sp,-16
    7734:	00812423          	sw	s0,8(sp)
    7738:	00050413          	mv	s0,a0
    773c:	00058513          	mv	a0,a1
    7740:	7fff9797          	auipc	a5,0x7fff9
    7744:	fc07ac23          	sw	zero,-40(a5) # 80000718 <errno>
    7748:	00112623          	sw	ra,12(sp)
    774c:	b00f90ef          	jal	a4c <_close>
    7750:	fff00793          	li	a5,-1
    7754:	00f50a63          	beq	a0,a5,7768 <_close_r+0x38>
    7758:	00c12083          	lw	ra,12(sp)
    775c:	00812403          	lw	s0,8(sp)
    7760:	01010113          	add	sp,sp,16
    7764:	00008067          	ret
    7768:	7fff9797          	auipc	a5,0x7fff9
    776c:	fb07a783          	lw	a5,-80(a5) # 80000718 <errno>
    7770:	fe0784e3          	beqz	a5,7758 <_close_r+0x28>
    7774:	00c12083          	lw	ra,12(sp)
    7778:	00f42023          	sw	a5,0(s0)
    777c:	00812403          	lw	s0,8(sp)
    7780:	01010113          	add	sp,sp,16
    7784:	00008067          	ret

00007788 <_lseek_r>:
    7788:	ff010113          	add	sp,sp,-16
    778c:	00058713          	mv	a4,a1
    7790:	00812423          	sw	s0,8(sp)
    7794:	00060593          	mv	a1,a2
    7798:	00050413          	mv	s0,a0
    779c:	00068613          	mv	a2,a3
    77a0:	00070513          	mv	a0,a4
    77a4:	7fff9797          	auipc	a5,0x7fff9
    77a8:	f607aa23          	sw	zero,-140(a5) # 80000718 <errno>
    77ac:	00112623          	sw	ra,12(sp)
    77b0:	ad8f90ef          	jal	a88 <_lseek>
    77b4:	fff00793          	li	a5,-1
    77b8:	00f50a63          	beq	a0,a5,77cc <_lseek_r+0x44>
    77bc:	00c12083          	lw	ra,12(sp)
    77c0:	00812403          	lw	s0,8(sp)
    77c4:	01010113          	add	sp,sp,16
    77c8:	00008067          	ret
    77cc:	7fff9797          	auipc	a5,0x7fff9
    77d0:	f4c7a783          	lw	a5,-180(a5) # 80000718 <errno>
    77d4:	fe0784e3          	beqz	a5,77bc <_lseek_r+0x34>
    77d8:	00c12083          	lw	ra,12(sp)
    77dc:	00f42023          	sw	a5,0(s0)
    77e0:	00812403          	lw	s0,8(sp)
    77e4:	01010113          	add	sp,sp,16
    77e8:	00008067          	ret

000077ec <_read_r>:
    77ec:	ff010113          	add	sp,sp,-16
    77f0:	00058713          	mv	a4,a1
    77f4:	00812423          	sw	s0,8(sp)
    77f8:	00060593          	mv	a1,a2
    77fc:	00050413          	mv	s0,a0
    7800:	00068613          	mv	a2,a3
    7804:	00070513          	mv	a0,a4
    7808:	7fff9797          	auipc	a5,0x7fff9
    780c:	f007a823          	sw	zero,-240(a5) # 80000718 <errno>
    7810:	00112623          	sw	ra,12(sp)
    7814:	a7cf90ef          	jal	a90 <_read>
    7818:	fff00793          	li	a5,-1
    781c:	00f50a63          	beq	a0,a5,7830 <_read_r+0x44>
    7820:	00c12083          	lw	ra,12(sp)
    7824:	00812403          	lw	s0,8(sp)
    7828:	01010113          	add	sp,sp,16
    782c:	00008067          	ret
    7830:	7fff9797          	auipc	a5,0x7fff9
    7834:	ee87a783          	lw	a5,-280(a5) # 80000718 <errno>
    7838:	fe0784e3          	beqz	a5,7820 <_read_r+0x34>
    783c:	00c12083          	lw	ra,12(sp)
    7840:	00f42023          	sw	a5,0(s0)
    7844:	00812403          	lw	s0,8(sp)
    7848:	01010113          	add	sp,sp,16
    784c:	00008067          	ret

00007850 <_sbrk_r>:
    7850:	ff010113          	add	sp,sp,-16
    7854:	00812423          	sw	s0,8(sp)
    7858:	00050413          	mv	s0,a0
    785c:	00058513          	mv	a0,a1
    7860:	7fff9797          	auipc	a5,0x7fff9
    7864:	ea07ac23          	sw	zero,-328(a5) # 80000718 <errno>
    7868:	00112623          	sw	ra,12(sp)
    786c:	ba4f90ef          	jal	c10 <_sbrk>
    7870:	fff00793          	li	a5,-1
    7874:	00f50a63          	beq	a0,a5,7888 <_sbrk_r+0x38>
    7878:	00c12083          	lw	ra,12(sp)
    787c:	00812403          	lw	s0,8(sp)
    7880:	01010113          	add	sp,sp,16
    7884:	00008067          	ret
    7888:	7fff9797          	auipc	a5,0x7fff9
    788c:	e907a783          	lw	a5,-368(a5) # 80000718 <errno>
    7890:	fe0784e3          	beqz	a5,7878 <_sbrk_r+0x28>
    7894:	00c12083          	lw	ra,12(sp)
    7898:	00f42023          	sw	a5,0(s0)
    789c:	00812403          	lw	s0,8(sp)
    78a0:	01010113          	add	sp,sp,16
    78a4:	00008067          	ret

000078a8 <_write_r>:
    78a8:	ff010113          	add	sp,sp,-16
    78ac:	00058713          	mv	a4,a1
    78b0:	00812423          	sw	s0,8(sp)
    78b4:	00060593          	mv	a1,a2
    78b8:	00050413          	mv	s0,a0
    78bc:	00068613          	mv	a2,a3
    78c0:	00070513          	mv	a0,a4
    78c4:	7fff9797          	auipc	a5,0x7fff9
    78c8:	e407aa23          	sw	zero,-428(a5) # 80000718 <errno>
    78cc:	00112623          	sw	ra,12(sp)
    78d0:	a9cf90ef          	jal	b6c <_write>
    78d4:	fff00793          	li	a5,-1
    78d8:	00f50a63          	beq	a0,a5,78ec <_write_r+0x44>
    78dc:	00c12083          	lw	ra,12(sp)
    78e0:	00812403          	lw	s0,8(sp)
    78e4:	01010113          	add	sp,sp,16
    78e8:	00008067          	ret
    78ec:	7fff9797          	auipc	a5,0x7fff9
    78f0:	e2c7a783          	lw	a5,-468(a5) # 80000718 <errno>
    78f4:	fe0784e3          	beqz	a5,78dc <_write_r+0x34>
    78f8:	00c12083          	lw	ra,12(sp)
    78fc:	00f42023          	sw	a5,0(s0)
    7900:	00812403          	lw	s0,8(sp)
    7904:	01010113          	add	sp,sp,16
    7908:	00008067          	ret

0000790c <memmove>:
    790c:	02a5f663          	bgeu	a1,a0,7938 <memmove+0x2c>
    7910:	00c58733          	add	a4,a1,a2
    7914:	02e57263          	bgeu	a0,a4,7938 <memmove+0x2c>
    7918:	00c507b3          	add	a5,a0,a2
    791c:	04060663          	beqz	a2,7968 <memmove+0x5c>
    7920:	fff74683          	lbu	a3,-1(a4)
    7924:	fff78793          	add	a5,a5,-1
    7928:	fff70713          	add	a4,a4,-1
    792c:	00d78023          	sb	a3,0(a5)
    7930:	fef518e3          	bne	a0,a5,7920 <memmove+0x14>
    7934:	00008067          	ret
    7938:	00f00793          	li	a5,15
    793c:	02c7e863          	bltu	a5,a2,796c <memmove+0x60>
    7940:	00050793          	mv	a5,a0
    7944:	fff60693          	add	a3,a2,-1
    7948:	0c060263          	beqz	a2,7a0c <memmove+0x100>
    794c:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x249>
    7950:	00d786b3          	add	a3,a5,a3
    7954:	0005c703          	lbu	a4,0(a1)
    7958:	00178793          	add	a5,a5,1
    795c:	00158593          	add	a1,a1,1
    7960:	fee78fa3          	sb	a4,-1(a5)
    7964:	fed798e3          	bne	a5,a3,7954 <memmove+0x48>
    7968:	00008067          	ret
    796c:	00b567b3          	or	a5,a0,a1
    7970:	0037f793          	and	a5,a5,3
    7974:	08079663          	bnez	a5,7a00 <memmove+0xf4>
    7978:	ff060893          	add	a7,a2,-16
    797c:	ff08f893          	and	a7,a7,-16
    7980:	01088893          	add	a7,a7,16
    7984:	011506b3          	add	a3,a0,a7
    7988:	00058713          	mv	a4,a1
    798c:	00050793          	mv	a5,a0
    7990:	00072803          	lw	a6,0(a4)
    7994:	01070713          	add	a4,a4,16
    7998:	01078793          	add	a5,a5,16
    799c:	ff07a823          	sw	a6,-16(a5)
    79a0:	ff472803          	lw	a6,-12(a4)
    79a4:	ff07aa23          	sw	a6,-12(a5)
    79a8:	ff872803          	lw	a6,-8(a4)
    79ac:	ff07ac23          	sw	a6,-8(a5)
    79b0:	ffc72803          	lw	a6,-4(a4)
    79b4:	ff07ae23          	sw	a6,-4(a5)
    79b8:	fcd79ce3          	bne	a5,a3,7990 <memmove+0x84>
    79bc:	00c67813          	and	a6,a2,12
    79c0:	011585b3          	add	a1,a1,a7
    79c4:	00f67713          	and	a4,a2,15
    79c8:	04080463          	beqz	a6,7a10 <memmove+0x104>
    79cc:	ffc70813          	add	a6,a4,-4
    79d0:	ffc87813          	and	a6,a6,-4
    79d4:	00480813          	add	a6,a6,4
    79d8:	010687b3          	add	a5,a3,a6
    79dc:	00058713          	mv	a4,a1
    79e0:	00072883          	lw	a7,0(a4)
    79e4:	00468693          	add	a3,a3,4
    79e8:	00470713          	add	a4,a4,4
    79ec:	ff16ae23          	sw	a7,-4(a3)
    79f0:	fef698e3          	bne	a3,a5,79e0 <memmove+0xd4>
    79f4:	00367613          	and	a2,a2,3
    79f8:	010585b3          	add	a1,a1,a6
    79fc:	f49ff06f          	j	7944 <memmove+0x38>
    7a00:	fff60693          	add	a3,a2,-1
    7a04:	00050793          	mv	a5,a0
    7a08:	f45ff06f          	j	794c <memmove+0x40>
    7a0c:	00008067          	ret
    7a10:	00070613          	mv	a2,a4
    7a14:	f31ff06f          	j	7944 <memmove+0x38>

00007a18 <frexp>:
    7a18:	ff010113          	add	sp,sp,-16
    7a1c:	00912223          	sw	s1,4(sp)
    7a20:	800004b7          	lui	s1,0x80000
    7a24:	00812423          	sw	s0,8(sp)
    7a28:	00112623          	sw	ra,12(sp)
    7a2c:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7a30:	00060413          	mv	s0,a2
    7a34:	00062023          	sw	zero,0(a2)
    7a38:	00b4f6b3          	and	a3,s1,a1
    7a3c:	7ff00637          	lui	a2,0x7ff00
    7a40:	00058793          	mv	a5,a1
    7a44:	00050713          	mv	a4,a0
    7a48:	04c6f063          	bgeu	a3,a2,7a88 <frexp+0x70>
    7a4c:	00a6e633          	or	a2,a3,a0
    7a50:	02060c63          	beqz	a2,7a88 <frexp+0x70>
    7a54:	0145d613          	srl	a2,a1,0x14
    7a58:	7ff67613          	and	a2,a2,2047
    7a5c:	04060463          	beqz	a2,7aa4 <frexp+0x8c>
    7a60:	00000593          	li	a1,0
    7a64:	80100637          	lui	a2,0x80100
    7a68:	4146d693          	sra	a3,a3,0x14
    7a6c:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7a70:	c0268693          	add	a3,a3,-1022
    7a74:	00c7f7b3          	and	a5,a5,a2
    7a78:	00b686b3          	add	a3,a3,a1
    7a7c:	3fe00637          	lui	a2,0x3fe00
    7a80:	00c7e7b3          	or	a5,a5,a2
    7a84:	00d42023          	sw	a3,0(s0)
    7a88:	00c12083          	lw	ra,12(sp)
    7a8c:	00812403          	lw	s0,8(sp)
    7a90:	00412483          	lw	s1,4(sp)
    7a94:	00070513          	mv	a0,a4
    7a98:	00078593          	mv	a1,a5
    7a9c:	01010113          	add	sp,sp,16
    7aa0:	00008067          	ret
    7aa4:	7fff9797          	auipc	a5,0x7fff9
    7aa8:	c1c78793          	add	a5,a5,-996 # 800006c0 <__global_locale+0x18c>
    7aac:	0047a683          	lw	a3,4(a5)
    7ab0:	0007a603          	lw	a2,0(a5)
    7ab4:	199050ef          	jal	d44c <__muldf3>
    7ab8:	00058793          	mv	a5,a1
    7abc:	00b4f6b3          	and	a3,s1,a1
    7ac0:	00050713          	mv	a4,a0
    7ac4:	fca00593          	li	a1,-54
    7ac8:	f9dff06f          	j	7a64 <frexp+0x4c>

00007acc <quorem>:
    7acc:	fb010113          	add	sp,sp,-80
    7ad0:	04912223          	sw	s1,68(sp)
    7ad4:	01052783          	lw	a5,16(a0)
    7ad8:	0105a483          	lw	s1,16(a1)
    7adc:	04112623          	sw	ra,76(sp)
    7ae0:	00b12423          	sw	a1,8(sp)
    7ae4:	2097ca63          	blt	a5,s1,7cf8 <quorem+0x22c>
    7ae8:	fff48493          	add	s1,s1,-1
    7aec:	03512a23          	sw	s5,52(sp)
    7af0:	03812423          	sw	s8,40(sp)
    7af4:	00249a93          	sll	s5,s1,0x2
    7af8:	01458c13          	add	s8,a1,20
    7afc:	05212023          	sw	s2,64(sp)
    7b00:	03312e23          	sw	s3,60(sp)
    7b04:	015c0933          	add	s2,s8,s5
    7b08:	01450993          	add	s3,a0,20
    7b0c:	015987b3          	add	a5,s3,s5
    7b10:	03712623          	sw	s7,44(sp)
    7b14:	00092b83          	lw	s7,0(s2)
    7b18:	03912223          	sw	s9,36(sp)
    7b1c:	0007ac83          	lw	s9,0(a5)
    7b20:	001b8b93          	add	s7,s7,1
    7b24:	03412c23          	sw	s4,56(sp)
    7b28:	000b8593          	mv	a1,s7
    7b2c:	00050a13          	mv	s4,a0
    7b30:	000c8513          	mv	a0,s9
    7b34:	04812423          	sw	s0,72(sp)
    7b38:	00f12623          	sw	a5,12(sp)
    7b3c:	09c070ef          	jal	ebd8 <__hidden___udivsi3>
    7b40:	00050413          	mv	s0,a0
    7b44:	0d7cee63          	bltu	s9,s7,7c20 <quorem+0x154>
    7b48:	03a12023          	sw	s10,32(sp)
    7b4c:	00010d37          	lui	s10,0x10
    7b50:	01b12e23          	sw	s11,28(sp)
    7b54:	03612823          	sw	s6,48(sp)
    7b58:	000c0a93          	mv	s5,s8
    7b5c:	00098d93          	mv	s11,s3
    7b60:	00000c93          	li	s9,0
    7b64:	00000b93          	li	s7,0
    7b68:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    7b6c:	000aab03          	lw	s6,0(s5)
    7b70:	00040593          	mv	a1,s0
    7b74:	004d8d93          	add	s11,s11,4
    7b78:	01ab7533          	and	a0,s6,s10
    7b7c:	799060ef          	jal	eb14 <__mulsi3>
    7b80:	00050793          	mv	a5,a0
    7b84:	00040593          	mv	a1,s0
    7b88:	010b5513          	srl	a0,s6,0x10
    7b8c:	01978cb3          	add	s9,a5,s9
    7b90:	785060ef          	jal	eb14 <__mulsi3>
    7b94:	ffcda603          	lw	a2,-4(s11)
    7b98:	01acf733          	and	a4,s9,s10
    7b9c:	010cdc93          	srl	s9,s9,0x10
    7ba0:	01a677b3          	and	a5,a2,s10
    7ba4:	40e787b3          	sub	a5,a5,a4
    7ba8:	017787b3          	add	a5,a5,s7
    7bac:	01950533          	add	a0,a0,s9
    7bb0:	4107d713          	sra	a4,a5,0x10
    7bb4:	01a575b3          	and	a1,a0,s10
    7bb8:	01065613          	srl	a2,a2,0x10
    7bbc:	40b70733          	sub	a4,a4,a1
    7bc0:	00c70733          	add	a4,a4,a2
    7bc4:	01a7f7b3          	and	a5,a5,s10
    7bc8:	01071613          	sll	a2,a4,0x10
    7bcc:	00c7e7b3          	or	a5,a5,a2
    7bd0:	004a8a93          	add	s5,s5,4
    7bd4:	fefdae23          	sw	a5,-4(s11)
    7bd8:	01055c93          	srl	s9,a0,0x10
    7bdc:	41075b93          	sra	s7,a4,0x10
    7be0:	f95976e3          	bgeu	s2,s5,7b6c <quorem+0xa0>
    7be4:	00c12703          	lw	a4,12(sp)
    7be8:	00072783          	lw	a5,0(a4)
    7bec:	12079063          	bnez	a5,7d0c <quorem+0x240>
    7bf0:	ffc70a93          	add	s5,a4,-4
    7bf4:	0159e863          	bltu	s3,s5,7c04 <quorem+0x138>
    7bf8:	0180006f          	j	7c10 <quorem+0x144>
    7bfc:	fff48493          	add	s1,s1,-1
    7c00:	0159f863          	bgeu	s3,s5,7c10 <quorem+0x144>
    7c04:	000aa783          	lw	a5,0(s5)
    7c08:	ffca8a93          	add	s5,s5,-4
    7c0c:	fe0788e3          	beqz	a5,7bfc <quorem+0x130>
    7c10:	03012b03          	lw	s6,48(sp)
    7c14:	02012d03          	lw	s10,32(sp)
    7c18:	01c12d83          	lw	s11,28(sp)
    7c1c:	009a2823          	sw	s1,16(s4)
    7c20:	00812583          	lw	a1,8(sp)
    7c24:	000a0513          	mv	a0,s4
    7c28:	1fc020ef          	jal	9e24 <__mcmp>
    7c2c:	08054c63          	bltz	a0,7cc4 <quorem+0x1f8>
    7c30:	00010537          	lui	a0,0x10
    7c34:	00098593          	mv	a1,s3
    7c38:	00000713          	li	a4,0
    7c3c:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    7c40:	0005a683          	lw	a3,0(a1)
    7c44:	000c2603          	lw	a2,0(s8)
    7c48:	00458593          	add	a1,a1,4
    7c4c:	00a6f7b3          	and	a5,a3,a0
    7c50:	00a67833          	and	a6,a2,a0
    7c54:	410787b3          	sub	a5,a5,a6
    7c58:	00e787b3          	add	a5,a5,a4
    7c5c:	4107d713          	sra	a4,a5,0x10
    7c60:	01065613          	srl	a2,a2,0x10
    7c64:	0106d693          	srl	a3,a3,0x10
    7c68:	40c70733          	sub	a4,a4,a2
    7c6c:	00d70733          	add	a4,a4,a3
    7c70:	01071693          	sll	a3,a4,0x10
    7c74:	00a7f7b3          	and	a5,a5,a0
    7c78:	00d7e7b3          	or	a5,a5,a3
    7c7c:	004c0c13          	add	s8,s8,4
    7c80:	fef5ae23          	sw	a5,-4(a1)
    7c84:	41075713          	sra	a4,a4,0x10
    7c88:	fb897ce3          	bgeu	s2,s8,7c40 <quorem+0x174>
    7c8c:	00249793          	sll	a5,s1,0x2
    7c90:	00f987b3          	add	a5,s3,a5
    7c94:	0007a703          	lw	a4,0(a5)
    7c98:	02071463          	bnez	a4,7cc0 <quorem+0x1f4>
    7c9c:	ffc78793          	add	a5,a5,-4
    7ca0:	00f9e863          	bltu	s3,a5,7cb0 <quorem+0x1e4>
    7ca4:	0180006f          	j	7cbc <quorem+0x1f0>
    7ca8:	fff48493          	add	s1,s1,-1
    7cac:	00f9f863          	bgeu	s3,a5,7cbc <quorem+0x1f0>
    7cb0:	0007a703          	lw	a4,0(a5)
    7cb4:	ffc78793          	add	a5,a5,-4
    7cb8:	fe0708e3          	beqz	a4,7ca8 <quorem+0x1dc>
    7cbc:	009a2823          	sw	s1,16(s4)
    7cc0:	00140413          	add	s0,s0,1
    7cc4:	04c12083          	lw	ra,76(sp)
    7cc8:	00040513          	mv	a0,s0
    7ccc:	04812403          	lw	s0,72(sp)
    7cd0:	04012903          	lw	s2,64(sp)
    7cd4:	03c12983          	lw	s3,60(sp)
    7cd8:	03812a03          	lw	s4,56(sp)
    7cdc:	03412a83          	lw	s5,52(sp)
    7ce0:	02c12b83          	lw	s7,44(sp)
    7ce4:	02812c03          	lw	s8,40(sp)
    7ce8:	02412c83          	lw	s9,36(sp)
    7cec:	04412483          	lw	s1,68(sp)
    7cf0:	05010113          	add	sp,sp,80
    7cf4:	00008067          	ret
    7cf8:	04c12083          	lw	ra,76(sp)
    7cfc:	04412483          	lw	s1,68(sp)
    7d00:	00000513          	li	a0,0
    7d04:	05010113          	add	sp,sp,80
    7d08:	00008067          	ret
    7d0c:	00812583          	lw	a1,8(sp)
    7d10:	000a0513          	mv	a0,s4
    7d14:	03012b03          	lw	s6,48(sp)
    7d18:	02012d03          	lw	s10,32(sp)
    7d1c:	01c12d83          	lw	s11,28(sp)
    7d20:	104020ef          	jal	9e24 <__mcmp>
    7d24:	f00556e3          	bgez	a0,7c30 <quorem+0x164>
    7d28:	f9dff06f          	j	7cc4 <quorem+0x1f8>

00007d2c <_dtoa_r>:
    7d2c:	03852303          	lw	t1,56(a0)
    7d30:	f5010113          	add	sp,sp,-176
    7d34:	0a812423          	sw	s0,168(sp)
    7d38:	0a912223          	sw	s1,164(sp)
    7d3c:	0b212023          	sw	s2,160(sp)
    7d40:	09412c23          	sw	s4,152(sp)
    7d44:	07b12e23          	sw	s11,124(sp)
    7d48:	0a112623          	sw	ra,172(sp)
    7d4c:	09312e23          	sw	s3,156(sp)
    7d50:	09512a23          	sw	s5,148(sp)
    7d54:	00e12a23          	sw	a4,20(sp)
    7d58:	00f12623          	sw	a5,12(sp)
    7d5c:	01112423          	sw	a7,8(sp)
    7d60:	02b12223          	sw	a1,36(sp)
    7d64:	00c12023          	sw	a2,0(sp)
    7d68:	00050413          	mv	s0,a0
    7d6c:	00058d93          	mv	s11,a1
    7d70:	00060493          	mv	s1,a2
    7d74:	00068a13          	mv	s4,a3
    7d78:	00080913          	mv	s2,a6
    7d7c:	02030263          	beqz	t1,7da0 <_dtoa_r+0x74>
    7d80:	03c52703          	lw	a4,60(a0)
    7d84:	00100793          	li	a5,1
    7d88:	00030593          	mv	a1,t1
    7d8c:	00e797b3          	sll	a5,a5,a4
    7d90:	00e32223          	sw	a4,4(t1)
    7d94:	00f32423          	sw	a5,8(t1)
    7d98:	734010ef          	jal	94cc <_Bfree>
    7d9c:	02042c23          	sw	zero,56(s0)
    7da0:	00048993          	mv	s3,s1
    7da4:	00000693          	li	a3,0
    7da8:	0004dc63          	bgez	s1,7dc0 <_dtoa_r+0x94>
    7dac:	00149493          	sll	s1,s1,0x1
    7db0:	0014d793          	srl	a5,s1,0x1
    7db4:	00f12023          	sw	a5,0(sp)
    7db8:	00078993          	mv	s3,a5
    7dbc:	00100693          	li	a3,1
    7dc0:	7ff00737          	lui	a4,0x7ff00
    7dc4:	00d92023          	sw	a3,0(s2)
    7dc8:	00e9f6b3          	and	a3,s3,a4
    7dcc:	64e68463          	beq	a3,a4,8414 <_dtoa_r+0x6e8>
    7dd0:	00012483          	lw	s1,0(sp)
    7dd4:	000d8513          	mv	a0,s11
    7dd8:	00000613          	li	a2,0
    7ddc:	00048593          	mv	a1,s1
    7de0:	00000693          	li	a3,0
    7de4:	01b12c23          	sw	s11,24(sp)
    7de8:	00912e23          	sw	s1,28(sp)
    7dec:	3cc050ef          	jal	d1b8 <__eqdf2>
    7df0:	04051c63          	bnez	a0,7e48 <_dtoa_r+0x11c>
    7df4:	00c12703          	lw	a4,12(sp)
    7df8:	00100793          	li	a5,1
    7dfc:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    7e00:	00812703          	lw	a4,8(sp)
    7e04:	00070863          	beqz	a4,7e14 <_dtoa_r+0xe8>
    7e08:	00007797          	auipc	a5,0x7
    7e0c:	1b578793          	add	a5,a5,437 # efbd <__fini_array_end+0x2b1>
    7e10:	00f72023          	sw	a5,0(a4)
    7e14:	00007a97          	auipc	s5,0x7
    7e18:	1a8a8a93          	add	s5,s5,424 # efbc <__fini_array_end+0x2b0>
    7e1c:	0ac12083          	lw	ra,172(sp)
    7e20:	0a812403          	lw	s0,168(sp)
    7e24:	0a412483          	lw	s1,164(sp)
    7e28:	0a012903          	lw	s2,160(sp)
    7e2c:	09c12983          	lw	s3,156(sp)
    7e30:	09812a03          	lw	s4,152(sp)
    7e34:	07c12d83          	lw	s11,124(sp)
    7e38:	000a8513          	mv	a0,s5
    7e3c:	09412a83          	lw	s5,148(sp)
    7e40:	0b010113          	add	sp,sp,176
    7e44:	00008067          	ret
    7e48:	00048613          	mv	a2,s1
    7e4c:	06810713          	add	a4,sp,104
    7e50:	06c10693          	add	a3,sp,108
    7e54:	000d8593          	mv	a1,s11
    7e58:	00040513          	mv	a0,s0
    7e5c:	09612823          	sw	s6,144(sp)
    7e60:	09712623          	sw	s7,140(sp)
    7e64:	09812423          	sw	s8,136(sp)
    7e68:	09912223          	sw	s9,132(sp)
    7e6c:	09a12023          	sw	s10,128(sp)
    7e70:	0149d913          	srl	s2,s3,0x14
    7e74:	268020ef          	jal	a0dc <__d2b>
    7e78:	00050493          	mv	s1,a0
    7e7c:	5c091e63          	bnez	s2,8458 <_dtoa_r+0x72c>
    7e80:	06812a83          	lw	s5,104(sp)
    7e84:	06c12903          	lw	s2,108(sp)
    7e88:	02000793          	li	a5,32
    7e8c:	012a8933          	add	s2,s5,s2
    7e90:	43290713          	add	a4,s2,1074
    7e94:	36e7dae3          	bge	a5,a4,8a08 <_dtoa_r+0xcdc>
    7e98:	04000793          	li	a5,64
    7e9c:	40e787b3          	sub	a5,a5,a4
    7ea0:	41290513          	add	a0,s2,1042
    7ea4:	00f997b3          	sll	a5,s3,a5
    7ea8:	00add533          	srl	a0,s11,a0
    7eac:	00a7e533          	or	a0,a5,a0
    7eb0:	7c4060ef          	jal	e674 <__floatunsidf>
    7eb4:	fe1007b7          	lui	a5,0xfe100
    7eb8:	00100693          	li	a3,1
    7ebc:	00050713          	mv	a4,a0
    7ec0:	00b787b3          	add	a5,a5,a1
    7ec4:	fff90913          	add	s2,s2,-1
    7ec8:	02d12c23          	sw	a3,56(sp)
    7ecc:	7fff8697          	auipc	a3,0x7fff8
    7ed0:	7fc68693          	add	a3,a3,2044 # 800006c8 <__global_locale+0x194>
    7ed4:	0006a603          	lw	a2,0(a3)
    7ed8:	0046a683          	lw	a3,4(a3)
    7edc:	00070513          	mv	a0,a4
    7ee0:	00078593          	mv	a1,a5
    7ee4:	4f9050ef          	jal	dbdc <__subdf3>
    7ee8:	7fff8797          	auipc	a5,0x7fff8
    7eec:	7e878793          	add	a5,a5,2024 # 800006d0 <__global_locale+0x19c>
    7ef0:	0007a603          	lw	a2,0(a5)
    7ef4:	0047a683          	lw	a3,4(a5)
    7ef8:	554050ef          	jal	d44c <__muldf3>
    7efc:	7fff8797          	auipc	a5,0x7fff8
    7f00:	7dc78793          	add	a5,a5,2012 # 800006d8 <__global_locale+0x1a4>
    7f04:	0007a603          	lw	a2,0(a5)
    7f08:	0047a683          	lw	a3,4(a5)
    7f0c:	138040ef          	jal	c044 <__adddf3>
    7f10:	00050b13          	mv	s6,a0
    7f14:	00090513          	mv	a0,s2
    7f18:	00058993          	mv	s3,a1
    7f1c:	6a0060ef          	jal	e5bc <__floatsidf>
    7f20:	7fff8797          	auipc	a5,0x7fff8
    7f24:	7c078793          	add	a5,a5,1984 # 800006e0 <__global_locale+0x1ac>
    7f28:	0007a603          	lw	a2,0(a5)
    7f2c:	0047a683          	lw	a3,4(a5)
    7f30:	51c050ef          	jal	d44c <__muldf3>
    7f34:	00050613          	mv	a2,a0
    7f38:	00058693          	mv	a3,a1
    7f3c:	000b0513          	mv	a0,s6
    7f40:	00098593          	mv	a1,s3
    7f44:	100040ef          	jal	c044 <__adddf3>
    7f48:	00050b93          	mv	s7,a0
    7f4c:	00058b13          	mv	s6,a1
    7f50:	5e8060ef          	jal	e538 <__fixdfsi>
    7f54:	00050993          	mv	s3,a0
    7f58:	000b0593          	mv	a1,s6
    7f5c:	000b8513          	mv	a0,s7
    7f60:	00000613          	li	a2,0
    7f64:	00000693          	li	a3,0
    7f68:	3dc050ef          	jal	d344 <__ledf2>
    7f6c:	02055063          	bgez	a0,7f8c <_dtoa_r+0x260>
    7f70:	00098513          	mv	a0,s3
    7f74:	648060ef          	jal	e5bc <__floatsidf>
    7f78:	000b8613          	mv	a2,s7
    7f7c:	000b0693          	mv	a3,s6
    7f80:	238050ef          	jal	d1b8 <__eqdf2>
    7f84:	00a03533          	snez	a0,a0
    7f88:	40a989b3          	sub	s3,s3,a0
    7f8c:	412a8ab3          	sub	s5,s5,s2
    7f90:	01600793          	li	a5,22
    7f94:	fffa8b13          	add	s6,s5,-1
    7f98:	2137e2e3          	bltu	a5,s3,899c <_dtoa_r+0xc70>
    7f9c:	00399713          	sll	a4,s3,0x3
    7fa0:	00007797          	auipc	a5,0x7
    7fa4:	6b878793          	add	a5,a5,1720 # f658 <__mprec_tens>
    7fa8:	00e787b3          	add	a5,a5,a4
    7fac:	0007a603          	lw	a2,0(a5)
    7fb0:	0047a683          	lw	a3,4(a5)
    7fb4:	01812503          	lw	a0,24(sp)
    7fb8:	01c12583          	lw	a1,28(sp)
    7fbc:	388050ef          	jal	d344 <__ledf2>
    7fc0:	220554e3          	bgez	a0,89e8 <_dtoa_r+0xcbc>
    7fc4:	fff98993          	add	s3,s3,-1
    7fc8:	02012a23          	sw	zero,52(sp)
    7fcc:	00012823          	sw	zero,16(sp)
    7fd0:	4a0b4863          	bltz	s6,8480 <_dtoa_r+0x754>
    7fd4:	4c09d063          	bgez	s3,8494 <_dtoa_r+0x768>
    7fd8:	01012783          	lw	a5,16(sp)
    7fdc:	03312023          	sw	s3,32(sp)
    7fe0:	413787b3          	sub	a5,a5,s3
    7fe4:	00f12823          	sw	a5,16(sp)
    7fe8:	413007b3          	neg	a5,s3
    7fec:	02f12823          	sw	a5,48(sp)
    7ff0:	00900793          	li	a5,9
    7ff4:	00000993          	li	s3,0
    7ff8:	4b47e863          	bltu	a5,s4,84a8 <_dtoa_r+0x77c>
    7ffc:	00500793          	li	a5,5
    8000:	2147dae3          	bge	a5,s4,8a14 <_dtoa_r+0xce8>
    8004:	ffca0a13          	add	s4,s4,-4
    8008:	00300793          	li	a5,3
    800c:	00000913          	li	s2,0
    8010:	66fa02e3          	beq	s4,a5,8e74 <_dtoa_r+0x1148>
    8014:	6147dae3          	bge	a5,s4,8e28 <_dtoa_r+0x10fc>
    8018:	00400793          	li	a5,4
    801c:	54fa1ae3          	bne	s4,a5,8d70 <_dtoa_r+0x1044>
    8020:	00100793          	li	a5,1
    8024:	02f12423          	sw	a5,40(sp)
    8028:	01412603          	lw	a2,20(sp)
    802c:	62c05ce3          	blez	a2,8e64 <_dtoa_r+0x1138>
    8030:	02c12e23          	sw	a2,60(sp)
    8034:	00060c13          	mv	s8,a2
    8038:	01700693          	li	a3,23
    803c:	00100713          	li	a4,1
    8040:	00400793          	li	a5,4
    8044:	00c6c463          	blt	a3,a2,804c <_dtoa_r+0x320>
    8048:	3540106f          	j	939c <_dtoa_r+0x1670>
    804c:	00179793          	sll	a5,a5,0x1
    8050:	01478693          	add	a3,a5,20
    8054:	00070593          	mv	a1,a4
    8058:	00170713          	add	a4,a4,1
    805c:	fed678e3          	bgeu	a2,a3,804c <_dtoa_r+0x320>
    8060:	02b42e23          	sw	a1,60(s0)
    8064:	00040513          	mv	a0,s0
    8068:	3b0010ef          	jal	9418 <_Balloc>
    806c:	00050a93          	mv	s5,a0
    8070:	00051463          	bnez	a0,8078 <_dtoa_r+0x34c>
    8074:	30c0106f          	j	9380 <_dtoa_r+0x1654>
    8078:	02a42c23          	sw	a0,56(s0)
    807c:	00e00793          	li	a5,14
    8080:	5187ea63          	bltu	a5,s8,8594 <_dtoa_r+0x868>
    8084:	50090863          	beqz	s2,8594 <_dtoa_r+0x868>
    8088:	02012783          	lw	a5,32(sp)
    808c:	62f054e3          	blez	a5,8eb4 <_dtoa_r+0x1188>
    8090:	00f7f713          	and	a4,a5,15
    8094:	00371713          	sll	a4,a4,0x3
    8098:	4047dc93          	sra	s9,a5,0x4
    809c:	00007797          	auipc	a5,0x7
    80a0:	5bc78793          	add	a5,a5,1468 # f658 <__mprec_tens>
    80a4:	00e787b3          	add	a5,a5,a4
    80a8:	010cf693          	and	a3,s9,16
    80ac:	0007a803          	lw	a6,0(a5)
    80b0:	0047a703          	lw	a4,4(a5)
    80b4:	560682e3          	beqz	a3,8e18 <_dtoa_r+0x10ec>
    80b8:	00007797          	auipc	a5,0x7
    80bc:	57878793          	add	a5,a5,1400 # f630 <__mprec_bigtens>
    80c0:	0207a603          	lw	a2,32(a5)
    80c4:	0247a683          	lw	a3,36(a5)
    80c8:	01812503          	lw	a0,24(sp)
    80cc:	01c12583          	lw	a1,28(sp)
    80d0:	04e12423          	sw	a4,72(sp)
    80d4:	05012023          	sw	a6,64(sp)
    80d8:	035040ef          	jal	c90c <__divdf3>
    80dc:	04012803          	lw	a6,64(sp)
    80e0:	04812703          	lw	a4,72(sp)
    80e4:	00fcfc93          	and	s9,s9,15
    80e8:	00050313          	mv	t1,a0
    80ec:	00058d13          	mv	s10,a1
    80f0:	00300913          	li	s2,3
    80f4:	040c8c63          	beqz	s9,814c <_dtoa_r+0x420>
    80f8:	04812023          	sw	s0,64(sp)
    80fc:	00007b97          	auipc	s7,0x7
    8100:	534b8b93          	add	s7,s7,1332 # f630 <__mprec_bigtens>
    8104:	00090413          	mv	s0,s2
    8108:	00070593          	mv	a1,a4
    810c:	00030913          	mv	s2,t1
    8110:	001cf793          	and	a5,s9,1
    8114:	00078e63          	beqz	a5,8130 <_dtoa_r+0x404>
    8118:	000ba603          	lw	a2,0(s7)
    811c:	004ba683          	lw	a3,4(s7)
    8120:	00080513          	mv	a0,a6
    8124:	00140413          	add	s0,s0,1
    8128:	324050ef          	jal	d44c <__muldf3>
    812c:	00050813          	mv	a6,a0
    8130:	401cdc93          	sra	s9,s9,0x1
    8134:	008b8b93          	add	s7,s7,8
    8138:	fc0c9ce3          	bnez	s9,8110 <_dtoa_r+0x3e4>
    813c:	00090313          	mv	t1,s2
    8140:	00040913          	mv	s2,s0
    8144:	04012403          	lw	s0,64(sp)
    8148:	00058713          	mv	a4,a1
    814c:	00070693          	mv	a3,a4
    8150:	00080613          	mv	a2,a6
    8154:	00030513          	mv	a0,t1
    8158:	000d0593          	mv	a1,s10
    815c:	7b0040ef          	jal	c90c <__divdf3>
    8160:	00050713          	mv	a4,a0
    8164:	00058793          	mv	a5,a1
    8168:	03412683          	lw	a3,52(sp)
    816c:	02068c63          	beqz	a3,81a4 <_dtoa_r+0x478>
    8170:	7fff8697          	auipc	a3,0x7fff8
    8174:	57868693          	add	a3,a3,1400 # 800006e8 <__global_locale+0x1b4>
    8178:	0006a603          	lw	a2,0(a3)
    817c:	0046a683          	lw	a3,4(a3)
    8180:	00070513          	mv	a0,a4
    8184:	00078593          	mv	a1,a5
    8188:	04e12423          	sw	a4,72(sp)
    818c:	04f12023          	sw	a5,64(sp)
    8190:	1b4050ef          	jal	d344 <__ledf2>
    8194:	04012783          	lw	a5,64(sp)
    8198:	04812703          	lw	a4,72(sp)
    819c:	00055463          	bgez	a0,81a4 <_dtoa_r+0x478>
    81a0:	04c0106f          	j	91ec <_dtoa_r+0x14c0>
    81a4:	00090513          	mv	a0,s2
    81a8:	04f12623          	sw	a5,76(sp)
    81ac:	04e12023          	sw	a4,64(sp)
    81b0:	40c060ef          	jal	e5bc <__floatsidf>
    81b4:	04012703          	lw	a4,64(sp)
    81b8:	04c12783          	lw	a5,76(sp)
    81bc:	00070613          	mv	a2,a4
    81c0:	00078693          	mv	a3,a5
    81c4:	04e12423          	sw	a4,72(sp)
    81c8:	04f12023          	sw	a5,64(sp)
    81cc:	280050ef          	jal	d44c <__muldf3>
    81d0:	7fff8697          	auipc	a3,0x7fff8
    81d4:	52868693          	add	a3,a3,1320 # 800006f8 <__global_locale+0x1c4>
    81d8:	0006a603          	lw	a2,0(a3)
    81dc:	0046a683          	lw	a3,4(a3)
    81e0:	665030ef          	jal	c044 <__adddf3>
    81e4:	fcc006b7          	lui	a3,0xfcc00
    81e8:	04012783          	lw	a5,64(sp)
    81ec:	04812703          	lw	a4,72(sp)
    81f0:	00050c93          	mv	s9,a0
    81f4:	00b68bb3          	add	s7,a3,a1
    81f8:	340c0463          	beqz	s8,8540 <_dtoa_r+0x814>
    81fc:	02012683          	lw	a3,32(sp)
    8200:	05812423          	sw	s8,72(sp)
    8204:	04d12e23          	sw	a3,92(sp)
    8208:	00070513          	mv	a0,a4
    820c:	00078593          	mv	a1,a5
    8210:	04e12623          	sw	a4,76(sp)
    8214:	04f12023          	sw	a5,64(sp)
    8218:	320060ef          	jal	e538 <__fixdfsi>
    821c:	04812783          	lw	a5,72(sp)
    8220:	00050913          	mv	s2,a0
    8224:	05912c23          	sw	s9,88(sp)
    8228:	fff78693          	add	a3,a5,-1
    822c:	00369693          	sll	a3,a3,0x3
    8230:	00007797          	auipc	a5,0x7
    8234:	42878793          	add	a5,a5,1064 # f658 <__mprec_tens>
    8238:	00d786b3          	add	a3,a5,a3
    823c:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    8240:	0046a803          	lw	a6,4(a3)
    8244:	001a8d13          	add	s10,s5,1
    8248:	04f12823          	sw	a5,80(sp)
    824c:	05012a23          	sw	a6,84(sp)
    8250:	36c060ef          	jal	e5bc <__floatsidf>
    8254:	04c12703          	lw	a4,76(sp)
    8258:	04012783          	lw	a5,64(sp)
    825c:	00050613          	mv	a2,a0
    8260:	00058693          	mv	a3,a1
    8264:	00070513          	mv	a0,a4
    8268:	00078593          	mv	a1,a5
    826c:	171050ef          	jal	dbdc <__subdf3>
    8270:	02812703          	lw	a4,40(sp)
    8274:	03090313          	add	t1,s2,48
    8278:	05a12023          	sw	s10,64(sp)
    827c:	00050c93          	mv	s9,a0
    8280:	0ff37313          	zext.b	t1,t1
    8284:	5c0706e3          	beqz	a4,9050 <_dtoa_r+0x1324>
    8288:	7fff8797          	auipc	a5,0x7fff8
    828c:	43078793          	add	a5,a5,1072 # 800006b8 <__global_locale+0x184>
    8290:	0007a503          	lw	a0,0(a5)
    8294:	05012603          	lw	a2,80(sp)
    8298:	05412683          	lw	a3,84(sp)
    829c:	04b12023          	sw	a1,64(sp)
    82a0:	0047a583          	lw	a1,4(a5)
    82a4:	04612623          	sw	t1,76(sp)
    82a8:	664040ef          	jal	c90c <__divdf3>
    82ac:	05812603          	lw	a2,88(sp)
    82b0:	000b8693          	mv	a3,s7
    82b4:	129050ef          	jal	dbdc <__subdf3>
    82b8:	04012883          	lw	a7,64(sp)
    82bc:	04c12303          	lw	t1,76(sp)
    82c0:	000c8613          	mv	a2,s9
    82c4:	00088693          	mv	a3,a7
    82c8:	006a8023          	sb	t1,0(s5)
    82cc:	00050913          	mv	s2,a0
    82d0:	00058b93          	mv	s7,a1
    82d4:	771040ef          	jal	d244 <__gedf2>
    82d8:	04012883          	lw	a7,64(sp)
    82dc:	00a05463          	blez	a0,82e4 <_dtoa_r+0x5b8>
    82e0:	7c90006f          	j	92a8 <_dtoa_r+0x157c>
    82e4:	7fff8697          	auipc	a3,0x7fff8
    82e8:	40468693          	add	a3,a3,1028 # 800006e8 <__global_locale+0x1b4>
    82ec:	0006a783          	lw	a5,0(a3)
    82f0:	0046a803          	lw	a6,4(a3)
    82f4:	05312623          	sw	s3,76(sp)
    82f8:	04f12023          	sw	a5,64(sp)
    82fc:	00000793          	li	a5,0
    8300:	05612823          	sw	s6,80(sp)
    8304:	05812c23          	sw	s8,88(sp)
    8308:	05012223          	sw	a6,68(sp)
    830c:	04812c03          	lw	s8,72(sp)
    8310:	00078b13          	mv	s6,a5
    8314:	05412423          	sw	s4,72(sp)
    8318:	00088993          	mv	s3,a7
    831c:	0980006f          	j	83b4 <_dtoa_r+0x688>
    8320:	001b0b13          	add	s6,s6,1
    8324:	018b4463          	blt	s6,s8,832c <_dtoa_r+0x600>
    8328:	7d10006f          	j	92f8 <_dtoa_r+0x15cc>
    832c:	7fff8a17          	auipc	s4,0x7fff8
    8330:	3c4a0a13          	add	s4,s4,964 # 800006f0 <__global_locale+0x1bc>
    8334:	000a2603          	lw	a2,0(s4)
    8338:	004a2683          	lw	a3,4(s4)
    833c:	00090513          	mv	a0,s2
    8340:	000b8593          	mv	a1,s7
    8344:	108050ef          	jal	d44c <__muldf3>
    8348:	000a2603          	lw	a2,0(s4)
    834c:	004a2683          	lw	a3,4(s4)
    8350:	00050913          	mv	s2,a0
    8354:	00058b93          	mv	s7,a1
    8358:	000c8513          	mv	a0,s9
    835c:	00098593          	mv	a1,s3
    8360:	0ec050ef          	jal	d44c <__muldf3>
    8364:	00058c93          	mv	s9,a1
    8368:	00050a13          	mv	s4,a0
    836c:	1cc060ef          	jal	e538 <__fixdfsi>
    8370:	00050993          	mv	s3,a0
    8374:	248060ef          	jal	e5bc <__floatsidf>
    8378:	00050613          	mv	a2,a0
    837c:	00058693          	mv	a3,a1
    8380:	000a0513          	mv	a0,s4
    8384:	000c8593          	mv	a1,s9
    8388:	055050ef          	jal	dbdc <__subdf3>
    838c:	03098793          	add	a5,s3,48
    8390:	00090613          	mv	a2,s2
    8394:	000b8693          	mv	a3,s7
    8398:	00fd0023          	sb	a5,0(s10)
    839c:	001d0d13          	add	s10,s10,1
    83a0:	00050c93          	mv	s9,a0
    83a4:	00058993          	mv	s3,a1
    83a8:	79d040ef          	jal	d344 <__ledf2>
    83ac:	00055463          	bgez	a0,83b4 <_dtoa_r+0x688>
    83b0:	6f90006f          	j	92a8 <_dtoa_r+0x157c>
    83b4:	04012503          	lw	a0,64(sp)
    83b8:	04412583          	lw	a1,68(sp)
    83bc:	000c8613          	mv	a2,s9
    83c0:	00098693          	mv	a3,s3
    83c4:	019050ef          	jal	dbdc <__subdf3>
    83c8:	00090613          	mv	a2,s2
    83cc:	000b8693          	mv	a3,s7
    83d0:	775040ef          	jal	d344 <__ledf2>
    83d4:	f40556e3          	bgez	a0,8320 <_dtoa_r+0x5f4>
    83d8:	05c12783          	lw	a5,92(sp)
    83dc:	000d0b93          	mv	s7,s10
    83e0:	00178c13          	add	s8,a5,1
    83e4:	03900613          	li	a2,57
    83e8:	0080006f          	j	83f0 <_dtoa_r+0x6c4>
    83ec:	697a88e3          	beq	s5,s7,927c <_dtoa_r+0x1550>
    83f0:	fffbc683          	lbu	a3,-1(s7)
    83f4:	000b8d13          	mv	s10,s7
    83f8:	fffb8b93          	add	s7,s7,-1
    83fc:	fec688e3          	beq	a3,a2,83ec <_dtoa_r+0x6c0>
    8400:	00168693          	add	a3,a3,1
    8404:	0ff6f693          	zext.b	a3,a3
    8408:	00db8023          	sb	a3,0(s7)
    840c:	000c0a13          	mv	s4,s8
    8410:	4f00006f          	j	8900 <_dtoa_r+0xbd4>
    8414:	00c12683          	lw	a3,12(sp)
    8418:	00002737          	lui	a4,0x2
    841c:	00c99793          	sll	a5,s3,0xc
    8420:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x957>
    8424:	00c7d793          	srl	a5,a5,0xc
    8428:	00e6a023          	sw	a4,0(a3)
    842c:	01b7e7b3          	or	a5,a5,s11
    8430:	0a078063          	beqz	a5,84d0 <_dtoa_r+0x7a4>
    8434:	00812783          	lw	a5,8(sp)
    8438:	00007a97          	auipc	s5,0x7
    843c:	bdca8a93          	add	s5,s5,-1060 # f014 <__fini_array_end+0x308>
    8440:	9c078ee3          	beqz	a5,7e1c <_dtoa_r+0xf0>
    8444:	00007797          	auipc	a5,0x7
    8448:	bd378793          	add	a5,a5,-1069 # f017 <__fini_array_end+0x30b>
    844c:	00812703          	lw	a4,8(sp)
    8450:	00f72023          	sw	a5,0(a4)
    8454:	9c9ff06f          	j	7e1c <_dtoa_r+0xf0>
    8458:	01c12783          	lw	a5,28(sp)
    845c:	3ff006b7          	lui	a3,0x3ff00
    8460:	06812a83          	lw	s5,104(sp)
    8464:	00c79793          	sll	a5,a5,0xc
    8468:	00c7d793          	srl	a5,a5,0xc
    846c:	01812703          	lw	a4,24(sp)
    8470:	00d7e7b3          	or	a5,a5,a3
    8474:	c0190913          	add	s2,s2,-1023
    8478:	02012c23          	sw	zero,56(sp)
    847c:	a51ff06f          	j	7ecc <_dtoa_r+0x1a0>
    8480:	00100793          	li	a5,1
    8484:	415787b3          	sub	a5,a5,s5
    8488:	00f12823          	sw	a5,16(sp)
    848c:	00000b13          	li	s6,0
    8490:	b409c4e3          	bltz	s3,7fd8 <_dtoa_r+0x2ac>
    8494:	03312023          	sw	s3,32(sp)
    8498:	02012823          	sw	zero,48(sp)
    849c:	00900793          	li	a5,9
    84a0:	013b0b33          	add	s6,s6,s3
    84a4:	b547fce3          	bgeu	a5,s4,7ffc <_dtoa_r+0x2d0>
    84a8:	00100793          	li	a5,1
    84ac:	00100913          	li	s2,1
    84b0:	00000a13          	li	s4,0
    84b4:	02f12423          	sw	a5,40(sp)
    84b8:	fff00c13          	li	s8,-1
    84bc:	00012a23          	sw	zero,20(sp)
    84c0:	02042e23          	sw	zero,60(s0)
    84c4:	03812e23          	sw	s8,60(sp)
    84c8:	00000593          	li	a1,0
    84cc:	b99ff06f          	j	8064 <_dtoa_r+0x338>
    84d0:	00812703          	lw	a4,8(sp)
    84d4:	00007a97          	auipc	s5,0x7
    84d8:	b34a8a93          	add	s5,s5,-1228 # f008 <__fini_array_end+0x2fc>
    84dc:	00007797          	auipc	a5,0x7
    84e0:	b3478793          	add	a5,a5,-1228 # f010 <__fini_array_end+0x304>
    84e4:	f60714e3          	bnez	a4,844c <_dtoa_r+0x720>
    84e8:	935ff06f          	j	7e1c <_dtoa_r+0xf0>
    84ec:	00090513          	mv	a0,s2
    84f0:	04f12623          	sw	a5,76(sp)
    84f4:	04e12023          	sw	a4,64(sp)
    84f8:	0c4060ef          	jal	e5bc <__floatsidf>
    84fc:	04012703          	lw	a4,64(sp)
    8500:	04c12783          	lw	a5,76(sp)
    8504:	00070613          	mv	a2,a4
    8508:	00078693          	mv	a3,a5
    850c:	04e12423          	sw	a4,72(sp)
    8510:	04f12023          	sw	a5,64(sp)
    8514:	739040ef          	jal	d44c <__muldf3>
    8518:	7fff8697          	auipc	a3,0x7fff8
    851c:	1e068693          	add	a3,a3,480 # 800006f8 <__global_locale+0x1c4>
    8520:	0006a603          	lw	a2,0(a3)
    8524:	0046a683          	lw	a3,4(a3)
    8528:	31d030ef          	jal	c044 <__adddf3>
    852c:	04012783          	lw	a5,64(sp)
    8530:	04812703          	lw	a4,72(sp)
    8534:	fcc006b7          	lui	a3,0xfcc00
    8538:	00050c93          	mv	s9,a0
    853c:	00b68bb3          	add	s7,a3,a1
    8540:	7fff8697          	auipc	a3,0x7fff8
    8544:	1c068693          	add	a3,a3,448 # 80000700 <__global_locale+0x1cc>
    8548:	0006a603          	lw	a2,0(a3)
    854c:	0046a683          	lw	a3,4(a3)
    8550:	00070513          	mv	a0,a4
    8554:	00078593          	mv	a1,a5
    8558:	684050ef          	jal	dbdc <__subdf3>
    855c:	000c8613          	mv	a2,s9
    8560:	000b8693          	mv	a3,s7
    8564:	00050d13          	mv	s10,a0
    8568:	00058913          	mv	s2,a1
    856c:	4d9040ef          	jal	d244 <__gedf2>
    8570:	50a04ce3          	bgtz	a0,9288 <_dtoa_r+0x155c>
    8574:	800007b7          	lui	a5,0x80000
    8578:	0177c7b3          	xor	a5,a5,s7
    857c:	000c8613          	mv	a2,s9
    8580:	000d0513          	mv	a0,s10
    8584:	00078693          	mv	a3,a5
    8588:	00090593          	mv	a1,s2
    858c:	5b9040ef          	jal	d344 <__ledf2>
    8590:	06054c63          	bltz	a0,8608 <_dtoa_r+0x8dc>
    8594:	06c12783          	lw	a5,108(sp)
    8598:	1a07c663          	bltz	a5,8744 <_dtoa_r+0xa18>
    859c:	02012683          	lw	a3,32(sp)
    85a0:	00e00713          	li	a4,14
    85a4:	1ad74063          	blt	a4,a3,8744 <_dtoa_r+0xa18>
    85a8:	02012783          	lw	a5,32(sp)
    85ac:	00379713          	sll	a4,a5,0x3
    85b0:	00007797          	auipc	a5,0x7
    85b4:	0a878793          	add	a5,a5,168 # f658 <__mprec_tens>
    85b8:	00e787b3          	add	a5,a5,a4
    85bc:	0007a903          	lw	s2,0(a5)
    85c0:	0047a983          	lw	s3,4(a5)
    85c4:	01412783          	lw	a5,20(sp)
    85c8:	0407dc63          	bgez	a5,8620 <_dtoa_r+0x8f4>
    85cc:	05804a63          	bgtz	s8,8620 <_dtoa_r+0x8f4>
    85d0:	020c1c63          	bnez	s8,8608 <_dtoa_r+0x8dc>
    85d4:	7fff8797          	auipc	a5,0x7fff8
    85d8:	12c78793          	add	a5,a5,300 # 80000700 <__global_locale+0x1cc>
    85dc:	0007a603          	lw	a2,0(a5)
    85e0:	0047a683          	lw	a3,4(a5)
    85e4:	00090513          	mv	a0,s2
    85e8:	00098593          	mv	a1,s3
    85ec:	661040ef          	jal	d44c <__muldf3>
    85f0:	00050613          	mv	a2,a0
    85f4:	00058693          	mv	a3,a1
    85f8:	01812503          	lw	a0,24(sp)
    85fc:	01c12583          	lw	a1,28(sp)
    8600:	545040ef          	jal	d344 <__ledf2>
    8604:	48a042e3          	bgtz	a0,9288 <_dtoa_r+0x155c>
    8608:	000a8d13          	mv	s10,s5
    860c:	00012c23          	sw	zero,24(sp)
    8610:	00000913          	li	s2,0
    8614:	01412783          	lw	a5,20(sp)
    8618:	fff7ca13          	not	s4,a5
    861c:	6980006f          	j	8cb4 <_dtoa_r+0xf88>
    8620:	001a8793          	add	a5,s5,1
    8624:	04f12023          	sw	a5,64(sp)
    8628:	01812b03          	lw	s6,24(sp)
    862c:	01c12a03          	lw	s4,28(sp)
    8630:	00090613          	mv	a2,s2
    8634:	00098693          	mv	a3,s3
    8638:	000b0513          	mv	a0,s6
    863c:	000a0593          	mv	a1,s4
    8640:	2cc040ef          	jal	c90c <__divdf3>
    8644:	6f5050ef          	jal	e538 <__fixdfsi>
    8648:	00050d13          	mv	s10,a0
    864c:	771050ef          	jal	e5bc <__floatsidf>
    8650:	00090613          	mv	a2,s2
    8654:	00098693          	mv	a3,s3
    8658:	5f5040ef          	jal	d44c <__muldf3>
    865c:	00050613          	mv	a2,a0
    8660:	00058693          	mv	a3,a1
    8664:	000b0513          	mv	a0,s6
    8668:	000a0593          	mv	a1,s4
    866c:	570050ef          	jal	dbdc <__subdf3>
    8670:	030d0793          	add	a5,s10,48
    8674:	00fa8023          	sb	a5,0(s5)
    8678:	00100613          	li	a2,1
    867c:	04012b83          	lw	s7,64(sp)
    8680:	00050713          	mv	a4,a0
    8684:	00058693          	mv	a3,a1
    8688:	0ccc0ee3          	beq	s8,a2,8f64 <_dtoa_r+0x1238>
    868c:	7fff8617          	auipc	a2,0x7fff8
    8690:	06460613          	add	a2,a2,100 # 800006f0 <__global_locale+0x1bc>
    8694:	00062783          	lw	a5,0(a2)
    8698:	00462803          	lw	a6,4(a2)
    869c:	00100d93          	li	s11,1
    86a0:	00f12023          	sw	a5,0(sp)
    86a4:	01012223          	sw	a6,4(sp)
    86a8:	0600006f          	j	8708 <_dtoa_r+0x9dc>
    86ac:	00090613          	mv	a2,s2
    86b0:	00098693          	mv	a3,s3
    86b4:	000b0513          	mv	a0,s6
    86b8:	000a0593          	mv	a1,s4
    86bc:	250040ef          	jal	c90c <__divdf3>
    86c0:	679050ef          	jal	e538 <__fixdfsi>
    86c4:	00050d13          	mv	s10,a0
    86c8:	6f5050ef          	jal	e5bc <__floatsidf>
    86cc:	00090613          	mv	a2,s2
    86d0:	00098693          	mv	a3,s3
    86d4:	579040ef          	jal	d44c <__muldf3>
    86d8:	00058693          	mv	a3,a1
    86dc:	00050613          	mv	a2,a0
    86e0:	000a0593          	mv	a1,s4
    86e4:	000b0513          	mv	a0,s6
    86e8:	4f4050ef          	jal	dbdc <__subdf3>
    86ec:	001b8b93          	add	s7,s7,1
    86f0:	030d0793          	add	a5,s10,48
    86f4:	001d8d93          	add	s11,s11,1
    86f8:	fefb8fa3          	sb	a5,-1(s7)
    86fc:	00050713          	mv	a4,a0
    8700:	00058693          	mv	a3,a1
    8704:	07bc00e3          	beq	s8,s11,8f64 <_dtoa_r+0x1238>
    8708:	00012603          	lw	a2,0(sp)
    870c:	00068593          	mv	a1,a3
    8710:	00412683          	lw	a3,4(sp)
    8714:	00070513          	mv	a0,a4
    8718:	535040ef          	jal	d44c <__muldf3>
    871c:	00000613          	li	a2,0
    8720:	00000693          	li	a3,0
    8724:	00050b13          	mv	s6,a0
    8728:	00058a13          	mv	s4,a1
    872c:	28d040ef          	jal	d1b8 <__eqdf2>
    8730:	f6051ee3          	bnez	a0,86ac <_dtoa_r+0x980>
    8734:	02012783          	lw	a5,32(sp)
    8738:	000b8d13          	mv	s10,s7
    873c:	00178a13          	add	s4,a5,1
    8740:	1c00006f          	j	8900 <_dtoa_r+0xbd4>
    8744:	02812703          	lw	a4,40(sp)
    8748:	26071463          	bnez	a4,89b0 <_dtoa_r+0xc84>
    874c:	03012b83          	lw	s7,48(sp)
    8750:	01012c83          	lw	s9,16(sp)
    8754:	02012423          	sw	zero,40(sp)
    8758:	00000913          	li	s2,0
    875c:	020c8263          	beqz	s9,8780 <_dtoa_r+0xa54>
    8760:	03605063          	blez	s6,8780 <_dtoa_r+0xa54>
    8764:	000c8793          	mv	a5,s9
    8768:	679b4263          	blt	s6,s9,8dcc <_dtoa_r+0x10a0>
    876c:	01012703          	lw	a4,16(sp)
    8770:	40fc8cb3          	sub	s9,s9,a5
    8774:	40fb0b33          	sub	s6,s6,a5
    8778:	40f70733          	sub	a4,a4,a5
    877c:	00e12823          	sw	a4,16(sp)
    8780:	03012783          	lw	a5,48(sp)
    8784:	02078263          	beqz	a5,87a8 <_dtoa_r+0xa7c>
    8788:	02812783          	lw	a5,40(sp)
    878c:	00078463          	beqz	a5,8794 <_dtoa_r+0xa68>
    8790:	060b9ae3          	bnez	s7,9004 <_dtoa_r+0x12d8>
    8794:	03012603          	lw	a2,48(sp)
    8798:	00048593          	mv	a1,s1
    879c:	00040513          	mv	a0,s0
    87a0:	3a4010ef          	jal	9b44 <__pow5mult>
    87a4:	00050493          	mv	s1,a0
    87a8:	00100593          	li	a1,1
    87ac:	00040513          	mv	a0,s0
    87b0:	01c010ef          	jal	97cc <__i2b>
    87b4:	00a12c23          	sw	a0,24(sp)
    87b8:	50099a63          	bnez	s3,8ccc <_dtoa_r+0xfa0>
    87bc:	00100793          	li	a5,1
    87c0:	5547da63          	bge	a5,s4,8d14 <_dtoa_r+0xfe8>
    87c4:	016787b3          	add	a5,a5,s6
    87c8:	01f7f793          	and	a5,a5,31
    87cc:	1c078e63          	beqz	a5,89a8 <_dtoa_r+0xc7c>
    87d0:	02000713          	li	a4,32
    87d4:	40f70733          	sub	a4,a4,a5
    87d8:	00400693          	li	a3,4
    87dc:	58e6d263          	bge	a3,a4,8d60 <_dtoa_r+0x1034>
    87e0:	01c00713          	li	a4,28
    87e4:	40f707b3          	sub	a5,a4,a5
    87e8:	01012703          	lw	a4,16(sp)
    87ec:	00fc8cb3          	add	s9,s9,a5
    87f0:	00fb0b33          	add	s6,s6,a5
    87f4:	00f70733          	add	a4,a4,a5
    87f8:	00e12823          	sw	a4,16(sp)
    87fc:	01012783          	lw	a5,16(sp)
    8800:	12f04e63          	bgtz	a5,893c <_dtoa_r+0xc10>
    8804:	01605c63          	blez	s6,881c <_dtoa_r+0xaf0>
    8808:	01812583          	lw	a1,24(sp)
    880c:	000b0613          	mv	a2,s6
    8810:	00040513          	mv	a0,s0
    8814:	480010ef          	jal	9c94 <__lshift>
    8818:	00a12c23          	sw	a0,24(sp)
    881c:	03412783          	lw	a5,52(sp)
    8820:	12079a63          	bnez	a5,8954 <_dtoa_r+0xc28>
    8824:	45805263          	blez	s8,8c68 <_dtoa_r+0xf3c>
    8828:	02812783          	lw	a5,40(sp)
    882c:	24079e63          	bnez	a5,8a88 <_dtoa_r+0xd5c>
    8830:	02012783          	lw	a5,32(sp)
    8834:	00178a13          	add	s4,a5,1
    8838:	01812b03          	lw	s6,24(sp)
    883c:	00100993          	li	s3,1
    8840:	0200006f          	j	8860 <_dtoa_r+0xb34>
    8844:	00048593          	mv	a1,s1
    8848:	00000693          	li	a3,0
    884c:	00a00613          	li	a2,10
    8850:	00040513          	mv	a0,s0
    8854:	49d000ef          	jal	94f0 <__multadd>
    8858:	00050493          	mv	s1,a0
    885c:	00198993          	add	s3,s3,1
    8860:	000b0593          	mv	a1,s6
    8864:	00048513          	mv	a0,s1
    8868:	a64ff0ef          	jal	7acc <quorem>
    886c:	03050b93          	add	s7,a0,48
    8870:	013a87b3          	add	a5,s5,s3
    8874:	ff778fa3          	sb	s7,-1(a5)
    8878:	fd89c6e3          	blt	s3,s8,8844 <_dtoa_r+0xb18>
    887c:	00100993          	li	s3,1
    8880:	55804263          	bgtz	s8,8dc4 <_dtoa_r+0x1098>
    8884:	013a89b3          	add	s3,s5,s3
    8888:	00000c13          	li	s8,0
    888c:	00048593          	mv	a1,s1
    8890:	00100613          	li	a2,1
    8894:	00040513          	mv	a0,s0
    8898:	3fc010ef          	jal	9c94 <__lshift>
    889c:	01812583          	lw	a1,24(sp)
    88a0:	00050493          	mv	s1,a0
    88a4:	580010ef          	jal	9e24 <__mcmp>
    88a8:	4ea05c63          	blez	a0,8da0 <_dtoa_r+0x1074>
    88ac:	03900693          	li	a3,57
    88b0:	0080006f          	j	88b8 <_dtoa_r+0xb8c>
    88b4:	5f3a8863          	beq	s5,s3,8ea4 <_dtoa_r+0x1178>
    88b8:	fff9c783          	lbu	a5,-1(s3)
    88bc:	00098d13          	mv	s10,s3
    88c0:	fff98993          	add	s3,s3,-1
    88c4:	fed788e3          	beq	a5,a3,88b4 <_dtoa_r+0xb88>
    88c8:	00178793          	add	a5,a5,1
    88cc:	00f98023          	sb	a5,0(s3)
    88d0:	01812583          	lw	a1,24(sp)
    88d4:	00040513          	mv	a0,s0
    88d8:	3f5000ef          	jal	94cc <_Bfree>
    88dc:	02090263          	beqz	s2,8900 <_dtoa_r+0xbd4>
    88e0:	000c0a63          	beqz	s8,88f4 <_dtoa_r+0xbc8>
    88e4:	012c0863          	beq	s8,s2,88f4 <_dtoa_r+0xbc8>
    88e8:	000c0593          	mv	a1,s8
    88ec:	00040513          	mv	a0,s0
    88f0:	3dd000ef          	jal	94cc <_Bfree>
    88f4:	00090593          	mv	a1,s2
    88f8:	00040513          	mv	a0,s0
    88fc:	3d1000ef          	jal	94cc <_Bfree>
    8900:	00048593          	mv	a1,s1
    8904:	00040513          	mv	a0,s0
    8908:	3c5000ef          	jal	94cc <_Bfree>
    890c:	00c12783          	lw	a5,12(sp)
    8910:	000d0023          	sb	zero,0(s10)
    8914:	0147a023          	sw	s4,0(a5)
    8918:	00812783          	lw	a5,8(sp)
    891c:	00078463          	beqz	a5,8924 <_dtoa_r+0xbf8>
    8920:	01a7a023          	sw	s10,0(a5)
    8924:	09012b03          	lw	s6,144(sp)
    8928:	08c12b83          	lw	s7,140(sp)
    892c:	08812c03          	lw	s8,136(sp)
    8930:	08412c83          	lw	s9,132(sp)
    8934:	08012d03          	lw	s10,128(sp)
    8938:	ce4ff06f          	j	7e1c <_dtoa_r+0xf0>
    893c:	00048593          	mv	a1,s1
    8940:	00078613          	mv	a2,a5
    8944:	00040513          	mv	a0,s0
    8948:	34c010ef          	jal	9c94 <__lshift>
    894c:	00050493          	mv	s1,a0
    8950:	eb5ff06f          	j	8804 <_dtoa_r+0xad8>
    8954:	01812583          	lw	a1,24(sp)
    8958:	00048513          	mv	a0,s1
    895c:	4c8010ef          	jal	9e24 <__mcmp>
    8960:	ec0552e3          	bgez	a0,8824 <_dtoa_r+0xaf8>
    8964:	02012783          	lw	a5,32(sp)
    8968:	00048593          	mv	a1,s1
    896c:	00000693          	li	a3,0
    8970:	00a00613          	li	a2,10
    8974:	00040513          	mv	a0,s0
    8978:	fff78b13          	add	s6,a5,-1
    897c:	375000ef          	jal	94f0 <__multadd>
    8980:	02812783          	lw	a5,40(sp)
    8984:	00050493          	mv	s1,a0
    8988:	0c079e63          	bnez	a5,8a64 <_dtoa_r+0xd38>
    898c:	03c12c03          	lw	s8,60(sp)
    8990:	17805ee3          	blez	s8,930c <_dtoa_r+0x15e0>
    8994:	02012a03          	lw	s4,32(sp)
    8998:	ea1ff06f          	j	8838 <_dtoa_r+0xb0c>
    899c:	00100793          	li	a5,1
    89a0:	02f12a23          	sw	a5,52(sp)
    89a4:	e28ff06f          	j	7fcc <_dtoa_r+0x2a0>
    89a8:	01c00793          	li	a5,28
    89ac:	e3dff06f          	j	87e8 <_dtoa_r+0xabc>
    89b0:	00100713          	li	a4,1
    89b4:	4d475463          	bge	a4,s4,8e7c <_dtoa_r+0x1150>
    89b8:	03012783          	lw	a5,48(sp)
    89bc:	fffc0b93          	add	s7,s8,-1
    89c0:	4177ca63          	blt	a5,s7,8dd4 <_dtoa_r+0x10a8>
    89c4:	41778bb3          	sub	s7,a5,s7
    89c8:	01012783          	lw	a5,16(sp)
    89cc:	41878cb3          	sub	s9,a5,s8
    89d0:	100c54e3          	bgez	s8,92d8 <_dtoa_r+0x15ac>
    89d4:	00100593          	li	a1,1
    89d8:	00040513          	mv	a0,s0
    89dc:	5f1000ef          	jal	97cc <__i2b>
    89e0:	00050913          	mv	s2,a0
    89e4:	d79ff06f          	j	875c <_dtoa_r+0xa30>
    89e8:	02012a23          	sw	zero,52(sp)
    89ec:	00012823          	sw	zero,16(sp)
    89f0:	ab5042e3          	bgtz	s5,8494 <_dtoa_r+0x768>
    89f4:	00100793          	li	a5,1
    89f8:	415787b3          	sub	a5,a5,s5
    89fc:	00f12823          	sw	a5,16(sp)
    8a00:	00000b13          	li	s6,0
    8a04:	a91ff06f          	j	8494 <_dtoa_r+0x768>
    8a08:	40e787b3          	sub	a5,a5,a4
    8a0c:	00fd9533          	sll	a0,s11,a5
    8a10:	ca0ff06f          	j	7eb0 <_dtoa_r+0x184>
    8a14:	00300793          	li	a5,3
    8a18:	00100913          	li	s2,1
    8a1c:	44fa0c63          	beq	s4,a5,8e74 <_dtoa_r+0x1148>
    8a20:	df47cc63          	blt	a5,s4,8018 <_dtoa_r+0x2ec>
    8a24:	00200793          	li	a5,2
    8a28:	18fa00e3          	beq	s4,a5,93a8 <_dtoa_r+0x167c>
    8a2c:	02042e23          	sw	zero,60(s0)
    8a30:	00000593          	li	a1,0
    8a34:	00040513          	mv	a0,s0
    8a38:	1e1000ef          	jal	9418 <_Balloc>
    8a3c:	00050a93          	mv	s5,a0
    8a40:	140500e3          	beqz	a0,9380 <_dtoa_r+0x1654>
    8a44:	00100793          	li	a5,1
    8a48:	02f12423          	sw	a5,40(sp)
    8a4c:	fff00793          	li	a5,-1
    8a50:	02a42c23          	sw	a0,56(s0)
    8a54:	02f12e23          	sw	a5,60(sp)
    8a58:	fff00c13          	li	s8,-1
    8a5c:	00012a23          	sw	zero,20(sp)
    8a60:	b35ff06f          	j	8594 <_dtoa_r+0x868>
    8a64:	00090593          	mv	a1,s2
    8a68:	00000693          	li	a3,0
    8a6c:	00a00613          	li	a2,10
    8a70:	00040513          	mv	a0,s0
    8a74:	27d000ef          	jal	94f0 <__multadd>
    8a78:	03c12c03          	lw	s8,60(sp)
    8a7c:	00050913          	mv	s2,a0
    8a80:	0b805ae3          	blez	s8,9334 <_dtoa_r+0x1608>
    8a84:	03612023          	sw	s6,32(sp)
    8a88:	01905c63          	blez	s9,8aa0 <_dtoa_r+0xd74>
    8a8c:	00090593          	mv	a1,s2
    8a90:	000c8613          	mv	a2,s9
    8a94:	00040513          	mv	a0,s0
    8a98:	1fc010ef          	jal	9c94 <__lshift>
    8a9c:	00050913          	mv	s2,a0
    8aa0:	00090b13          	mv	s6,s2
    8aa4:	50099e63          	bnez	s3,8fc0 <_dtoa_r+0x1294>
    8aa8:	02412783          	lw	a5,36(sp)
    8aac:	fffa8d13          	add	s10,s5,-1
    8ab0:	000a8c93          	mv	s9,s5
    8ab4:	01512823          	sw	s5,16(sp)
    8ab8:	01812a83          	lw	s5,24(sp)
    8abc:	0017f793          	and	a5,a5,1
    8ac0:	018d0d33          	add	s10,s10,s8
    8ac4:	00f12023          	sw	a5,0(sp)
    8ac8:	01b12a23          	sw	s11,20(sp)
    8acc:	000a8593          	mv	a1,s5
    8ad0:	00048513          	mv	a0,s1
    8ad4:	ff9fe0ef          	jal	7acc <quorem>
    8ad8:	00050c13          	mv	s8,a0
    8adc:	00090593          	mv	a1,s2
    8ae0:	00048513          	mv	a0,s1
    8ae4:	340010ef          	jal	9e24 <__mcmp>
    8ae8:	00050993          	mv	s3,a0
    8aec:	000b0613          	mv	a2,s6
    8af0:	000a8593          	mv	a1,s5
    8af4:	00040513          	mv	a0,s0
    8af8:	384010ef          	jal	9e7c <__mdiff>
    8afc:	00c52703          	lw	a4,12(a0)
    8b00:	030c0b93          	add	s7,s8,48
    8b04:	00050d93          	mv	s11,a0
    8b08:	08071c63          	bnez	a4,8ba0 <_dtoa_r+0xe74>
    8b0c:	00050593          	mv	a1,a0
    8b10:	00048513          	mv	a0,s1
    8b14:	310010ef          	jal	9e24 <__mcmp>
    8b18:	00050713          	mv	a4,a0
    8b1c:	000d8593          	mv	a1,s11
    8b20:	00040513          	mv	a0,s0
    8b24:	00070d93          	mv	s11,a4
    8b28:	1a5000ef          	jal	94cc <_Bfree>
    8b2c:	014de6b3          	or	a3,s11,s4
    8b30:	0e069a63          	bnez	a3,8c24 <_dtoa_r+0xef8>
    8b34:	00012783          	lw	a5,0(sp)
    8b38:	76078e63          	beqz	a5,92b4 <_dtoa_r+0x1588>
    8b3c:	7809c663          	bltz	s3,92c8 <_dtoa_r+0x159c>
    8b40:	017c8023          	sb	s7,0(s9)
    8b44:	001c8993          	add	s3,s9,1
    8b48:	679d0e63          	beq	s10,s9,91c4 <_dtoa_r+0x1498>
    8b4c:	00048593          	mv	a1,s1
    8b50:	00000693          	li	a3,0
    8b54:	00a00613          	li	a2,10
    8b58:	00040513          	mv	a0,s0
    8b5c:	195000ef          	jal	94f0 <__multadd>
    8b60:	00050493          	mv	s1,a0
    8b64:	00000693          	li	a3,0
    8b68:	00a00613          	li	a2,10
    8b6c:	00090593          	mv	a1,s2
    8b70:	00040513          	mv	a0,s0
    8b74:	09690e63          	beq	s2,s6,8c10 <_dtoa_r+0xee4>
    8b78:	179000ef          	jal	94f0 <__multadd>
    8b7c:	000b0593          	mv	a1,s6
    8b80:	00050913          	mv	s2,a0
    8b84:	00000693          	li	a3,0
    8b88:	00a00613          	li	a2,10
    8b8c:	00040513          	mv	a0,s0
    8b90:	161000ef          	jal	94f0 <__multadd>
    8b94:	00050b13          	mv	s6,a0
    8b98:	00098c93          	mv	s9,s3
    8b9c:	f31ff06f          	j	8acc <_dtoa_r+0xda0>
    8ba0:	00050593          	mv	a1,a0
    8ba4:	00040513          	mv	a0,s0
    8ba8:	01012a83          	lw	s5,16(sp)
    8bac:	01412d83          	lw	s11,20(sp)
    8bb0:	11d000ef          	jal	94cc <_Bfree>
    8bb4:	0009ca63          	bltz	s3,8bc8 <_dtoa_r+0xe9c>
    8bb8:	001df713          	and	a4,s11,1
    8bbc:	0149e9b3          	or	s3,s3,s4
    8bc0:	01376733          	or	a4,a4,s3
    8bc4:	06071e63          	bnez	a4,8c40 <_dtoa_r+0xf14>
    8bc8:	00048593          	mv	a1,s1
    8bcc:	00100613          	li	a2,1
    8bd0:	00040513          	mv	a0,s0
    8bd4:	0c0010ef          	jal	9c94 <__lshift>
    8bd8:	01812583          	lw	a1,24(sp)
    8bdc:	00050493          	mv	s1,a0
    8be0:	244010ef          	jal	9e24 <__mcmp>
    8be4:	24a05863          	blez	a0,8e34 <_dtoa_r+0x1108>
    8be8:	03900713          	li	a4,57
    8bec:	24eb8c63          	beq	s7,a4,8e44 <_dtoa_r+0x1118>
    8bf0:	031c0b93          	add	s7,s8,49
    8bf4:	02012783          	lw	a5,32(sp)
    8bf8:	00090c13          	mv	s8,s2
    8bfc:	001c8d13          	add	s10,s9,1
    8c00:	017c8023          	sb	s7,0(s9)
    8c04:	00178a13          	add	s4,a5,1
    8c08:	000b0913          	mv	s2,s6
    8c0c:	cc5ff06f          	j	88d0 <_dtoa_r+0xba4>
    8c10:	0e1000ef          	jal	94f0 <__multadd>
    8c14:	00050913          	mv	s2,a0
    8c18:	00050b13          	mv	s6,a0
    8c1c:	00098c93          	mv	s9,s3
    8c20:	eadff06f          	j	8acc <_dtoa_r+0xda0>
    8c24:	7409c863          	bltz	s3,9374 <_dtoa_r+0x1648>
    8c28:	00012783          	lw	a5,0(sp)
    8c2c:	0149e9b3          	or	s3,s3,s4
    8c30:	0137e9b3          	or	s3,a5,s3
    8c34:	74098063          	beqz	s3,9374 <_dtoa_r+0x1648>
    8c38:	f1b054e3          	blez	s11,8b40 <_dtoa_r+0xe14>
    8c3c:	01012a83          	lw	s5,16(sp)
    8c40:	03900713          	li	a4,57
    8c44:	20eb8063          	beq	s7,a4,8e44 <_dtoa_r+0x1118>
    8c48:	02012703          	lw	a4,32(sp)
    8c4c:	001b8793          	add	a5,s7,1
    8c50:	00090c13          	mv	s8,s2
    8c54:	001c8d13          	add	s10,s9,1
    8c58:	00170a13          	add	s4,a4,1
    8c5c:	00fc8023          	sb	a5,0(s9)
    8c60:	000b0913          	mv	s2,s6
    8c64:	c6dff06f          	j	88d0 <_dtoa_r+0xba4>
    8c68:	00200793          	li	a5,2
    8c6c:	bb47dee3          	bge	a5,s4,8828 <_dtoa_r+0xafc>
    8c70:	000a8d13          	mv	s10,s5
    8c74:	9a0c10e3          	bnez	s8,8614 <_dtoa_r+0x8e8>
    8c78:	01812583          	lw	a1,24(sp)
    8c7c:	00000693          	li	a3,0
    8c80:	00500613          	li	a2,5
    8c84:	00040513          	mv	a0,s0
    8c88:	069000ef          	jal	94f0 <__multadd>
    8c8c:	00050593          	mv	a1,a0
    8c90:	00a12c23          	sw	a0,24(sp)
    8c94:	00048513          	mv	a0,s1
    8c98:	18c010ef          	jal	9e24 <__mcmp>
    8c9c:	96a05ce3          	blez	a0,8614 <_dtoa_r+0x8e8>
    8ca0:	03100793          	li	a5,49
    8ca4:	00fa8023          	sb	a5,0(s5)
    8ca8:	02012783          	lw	a5,32(sp)
    8cac:	001a8d13          	add	s10,s5,1
    8cb0:	00178a13          	add	s4,a5,1
    8cb4:	01812583          	lw	a1,24(sp)
    8cb8:	00040513          	mv	a0,s0
    8cbc:	001a0a13          	add	s4,s4,1
    8cc0:	00d000ef          	jal	94cc <_Bfree>
    8cc4:	c20918e3          	bnez	s2,88f4 <_dtoa_r+0xbc8>
    8cc8:	c39ff06f          	j	8900 <_dtoa_r+0xbd4>
    8ccc:	00050593          	mv	a1,a0
    8cd0:	00098613          	mv	a2,s3
    8cd4:	00040513          	mv	a0,s0
    8cd8:	66d000ef          	jal	9b44 <__pow5mult>
    8cdc:	00100793          	li	a5,1
    8ce0:	00a12c23          	sw	a0,24(sp)
    8ce4:	1147de63          	bge	a5,s4,8e00 <_dtoa_r+0x10d4>
    8ce8:	00000993          	li	s3,0
    8cec:	01812703          	lw	a4,24(sp)
    8cf0:	01072783          	lw	a5,16(a4)
    8cf4:	00378793          	add	a5,a5,3
    8cf8:	00279793          	sll	a5,a5,0x2
    8cfc:	00f707b3          	add	a5,a4,a5
    8d00:	0047a503          	lw	a0,4(a5)
    8d04:	171000ef          	jal	9674 <__hi0bits>
    8d08:	02000793          	li	a5,32
    8d0c:	40a787b3          	sub	a5,a5,a0
    8d10:	ab5ff06f          	j	87c4 <_dtoa_r+0xa98>
    8d14:	02412783          	lw	a5,36(sp)
    8d18:	04079063          	bnez	a5,8d58 <_dtoa_r+0x102c>
    8d1c:	00012783          	lw	a5,0(sp)
    8d20:	00c79793          	sll	a5,a5,0xc
    8d24:	02079a63          	bnez	a5,8d58 <_dtoa_r+0x102c>
    8d28:	00012683          	lw	a3,0(sp)
    8d2c:	00000793          	li	a5,0
    8d30:	0146d713          	srl	a4,a3,0x14
    8d34:	7ff77713          	and	a4,a4,2047
    8d38:	00070c63          	beqz	a4,8d50 <_dtoa_r+0x1024>
    8d3c:	01012783          	lw	a5,16(sp)
    8d40:	001b0b13          	add	s6,s6,1
    8d44:	00178793          	add	a5,a5,1
    8d48:	00f12823          	sw	a5,16(sp)
    8d4c:	00100793          	li	a5,1
    8d50:	58099063          	bnez	s3,92d0 <_dtoa_r+0x15a4>
    8d54:	00078993          	mv	s3,a5
    8d58:	00100793          	li	a5,1
    8d5c:	a69ff06f          	j	87c4 <_dtoa_r+0xa98>
    8d60:	a8d70ee3          	beq	a4,a3,87fc <_dtoa_r+0xad0>
    8d64:	03c00713          	li	a4,60
    8d68:	40f707b3          	sub	a5,a4,a5
    8d6c:	a7dff06f          	j	87e8 <_dtoa_r+0xabc>
    8d70:	00100793          	li	a5,1
    8d74:	00500a13          	li	s4,5
    8d78:	02f12423          	sw	a5,40(sp)
    8d7c:	01412783          	lw	a5,20(sp)
    8d80:	02012703          	lw	a4,32(sp)
    8d84:	00e787b3          	add	a5,a5,a4
    8d88:	00178c13          	add	s8,a5,1
    8d8c:	02f12e23          	sw	a5,60(sp)
    8d90:	000c0613          	mv	a2,s8
    8d94:	ab804263          	bgtz	s8,8038 <_dtoa_r+0x30c>
    8d98:	00100613          	li	a2,1
    8d9c:	a9cff06f          	j	8038 <_dtoa_r+0x30c>
    8da0:	00051663          	bnez	a0,8dac <_dtoa_r+0x1080>
    8da4:	001bf793          	and	a5,s7,1
    8da8:	b00792e3          	bnez	a5,88ac <_dtoa_r+0xb80>
    8dac:	03000693          	li	a3,48
    8db0:	fff9c783          	lbu	a5,-1(s3)
    8db4:	00098d13          	mv	s10,s3
    8db8:	fff98993          	add	s3,s3,-1
    8dbc:	fed78ae3          	beq	a5,a3,8db0 <_dtoa_r+0x1084>
    8dc0:	b11ff06f          	j	88d0 <_dtoa_r+0xba4>
    8dc4:	000c0993          	mv	s3,s8
    8dc8:	abdff06f          	j	8884 <_dtoa_r+0xb58>
    8dcc:	000b0793          	mv	a5,s6
    8dd0:	99dff06f          	j	876c <_dtoa_r+0xa40>
    8dd4:	03012783          	lw	a5,48(sp)
    8dd8:	01012703          	lw	a4,16(sp)
    8ddc:	03712823          	sw	s7,48(sp)
    8de0:	40fb87b3          	sub	a5,s7,a5
    8de4:	00f989b3          	add	s3,s3,a5
    8de8:	018707b3          	add	a5,a4,s8
    8dec:	00070c93          	mv	s9,a4
    8df0:	018b0b33          	add	s6,s6,s8
    8df4:	00f12823          	sw	a5,16(sp)
    8df8:	00000b93          	li	s7,0
    8dfc:	bd9ff06f          	j	89d4 <_dtoa_r+0xca8>
    8e00:	02412783          	lw	a5,36(sp)
    8e04:	ee0792e3          	bnez	a5,8ce8 <_dtoa_r+0xfbc>
    8e08:	00012783          	lw	a5,0(sp)
    8e0c:	00c79793          	sll	a5,a5,0xc
    8e10:	ec079ce3          	bnez	a5,8ce8 <_dtoa_r+0xfbc>
    8e14:	f15ff06f          	j	8d28 <_dtoa_r+0xffc>
    8e18:	01812303          	lw	t1,24(sp)
    8e1c:	01c12d03          	lw	s10,28(sp)
    8e20:	00200913          	li	s2,2
    8e24:	ad0ff06f          	j	80f4 <_dtoa_r+0x3c8>
    8e28:	00200a13          	li	s4,2
    8e2c:	02012423          	sw	zero,40(sp)
    8e30:	9f8ff06f          	j	8028 <_dtoa_r+0x2fc>
    8e34:	dc0510e3          	bnez	a0,8bf4 <_dtoa_r+0xec8>
    8e38:	001bf713          	and	a4,s7,1
    8e3c:	da0716e3          	bnez	a4,8be8 <_dtoa_r+0xebc>
    8e40:	db5ff06f          	j	8bf4 <_dtoa_r+0xec8>
    8e44:	03900793          	li	a5,57
    8e48:	00fc8023          	sb	a5,0(s9)
    8e4c:	02012783          	lw	a5,32(sp)
    8e50:	00090c13          	mv	s8,s2
    8e54:	001c8993          	add	s3,s9,1
    8e58:	00178a13          	add	s4,a5,1
    8e5c:	000b0913          	mv	s2,s6
    8e60:	a4dff06f          	j	88ac <_dtoa_r+0xb80>
    8e64:	00100793          	li	a5,1
    8e68:	00100c13          	li	s8,1
    8e6c:	00f12a23          	sw	a5,20(sp)
    8e70:	e50ff06f          	j	84c0 <_dtoa_r+0x794>
    8e74:	02012423          	sw	zero,40(sp)
    8e78:	f05ff06f          	j	8d7c <_dtoa_r+0x1050>
    8e7c:	03812703          	lw	a4,56(sp)
    8e80:	30070e63          	beqz	a4,919c <_dtoa_r+0x1470>
    8e84:	01012703          	lw	a4,16(sp)
    8e88:	43378793          	add	a5,a5,1075
    8e8c:	00fb0b33          	add	s6,s6,a5
    8e90:	00f707b3          	add	a5,a4,a5
    8e94:	03012b83          	lw	s7,48(sp)
    8e98:	00070c93          	mv	s9,a4
    8e9c:	00f12823          	sw	a5,16(sp)
    8ea0:	b35ff06f          	j	89d4 <_dtoa_r+0xca8>
    8ea4:	03100793          	li	a5,49
    8ea8:	00fa8023          	sb	a5,0(s5)
    8eac:	001a0a13          	add	s4,s4,1
    8eb0:	a21ff06f          	j	88d0 <_dtoa_r+0xba4>
    8eb4:	02012783          	lw	a5,32(sp)
    8eb8:	32078263          	beqz	a5,91dc <_dtoa_r+0x14b0>
    8ebc:	40f00bb3          	neg	s7,a5
    8ec0:	00fbf713          	and	a4,s7,15
    8ec4:	00371713          	sll	a4,a4,0x3
    8ec8:	00006797          	auipc	a5,0x6
    8ecc:	79078793          	add	a5,a5,1936 # f658 <__mprec_tens>
    8ed0:	00e787b3          	add	a5,a5,a4
    8ed4:	0007a603          	lw	a2,0(a5)
    8ed8:	0047a683          	lw	a3,4(a5)
    8edc:	01812503          	lw	a0,24(sp)
    8ee0:	01c12583          	lw	a1,28(sp)
    8ee4:	404bdb93          	sra	s7,s7,0x4
    8ee8:	564040ef          	jal	d44c <__muldf3>
    8eec:	00058d13          	mv	s10,a1
    8ef0:	440b8c63          	beqz	s7,9348 <_dtoa_r+0x161c>
    8ef4:	00200913          	li	s2,2
    8ef8:	04812023          	sw	s0,64(sp)
    8efc:	00006c97          	auipc	s9,0x6
    8f00:	734c8c93          	add	s9,s9,1844 # f630 <__mprec_bigtens>
    8f04:	00090413          	mv	s0,s2
    8f08:	00050713          	mv	a4,a0
    8f0c:	00000613          	li	a2,0
    8f10:	00050913          	mv	s2,a0
    8f14:	001bf693          	and	a3,s7,1
    8f18:	02068063          	beqz	a3,8f38 <_dtoa_r+0x120c>
    8f1c:	000ca603          	lw	a2,0(s9)
    8f20:	004ca683          	lw	a3,4(s9)
    8f24:	00070513          	mv	a0,a4
    8f28:	00140413          	add	s0,s0,1
    8f2c:	520040ef          	jal	d44c <__muldf3>
    8f30:	00050713          	mv	a4,a0
    8f34:	00100613          	li	a2,1
    8f38:	401bdb93          	sra	s7,s7,0x1
    8f3c:	008c8c93          	add	s9,s9,8
    8f40:	fc0b9ae3          	bnez	s7,8f14 <_dtoa_r+0x11e8>
    8f44:	00090513          	mv	a0,s2
    8f48:	00058793          	mv	a5,a1
    8f4c:	00040913          	mv	s2,s0
    8f50:	04012403          	lw	s0,64(sp)
    8f54:	a0061a63          	bnez	a2,8168 <_dtoa_r+0x43c>
    8f58:	00050713          	mv	a4,a0
    8f5c:	000d0793          	mv	a5,s10
    8f60:	a08ff06f          	j	8168 <_dtoa_r+0x43c>
    8f64:	00068593          	mv	a1,a3
    8f68:	00070613          	mv	a2,a4
    8f6c:	00070513          	mv	a0,a4
    8f70:	0d4030ef          	jal	c044 <__adddf3>
    8f74:	02012783          	lw	a5,32(sp)
    8f78:	00090613          	mv	a2,s2
    8f7c:	00098693          	mv	a3,s3
    8f80:	00178a13          	add	s4,a5,1
    8f84:	00050c93          	mv	s9,a0
    8f88:	00058b13          	mv	s6,a1
    8f8c:	000a0c13          	mv	s8,s4
    8f90:	2b4040ef          	jal	d244 <__gedf2>
    8f94:	c4a04863          	bgtz	a0,83e4 <_dtoa_r+0x6b8>
    8f98:	000c8513          	mv	a0,s9
    8f9c:	000b0593          	mv	a1,s6
    8fa0:	00090613          	mv	a2,s2
    8fa4:	00098693          	mv	a3,s3
    8fa8:	210040ef          	jal	d1b8 <__eqdf2>
    8fac:	00051663          	bnez	a0,8fb8 <_dtoa_r+0x128c>
    8fb0:	001d7d13          	and	s10,s10,1
    8fb4:	c20d1863          	bnez	s10,83e4 <_dtoa_r+0x6b8>
    8fb8:	000b8d13          	mv	s10,s7
    8fbc:	945ff06f          	j	8900 <_dtoa_r+0xbd4>
    8fc0:	00492583          	lw	a1,4(s2)
    8fc4:	00040513          	mv	a0,s0
    8fc8:	450000ef          	jal	9418 <_Balloc>
    8fcc:	00050993          	mv	s3,a0
    8fd0:	38050463          	beqz	a0,9358 <_dtoa_r+0x162c>
    8fd4:	01092603          	lw	a2,16(s2)
    8fd8:	00c90593          	add	a1,s2,12
    8fdc:	00c50513          	add	a0,a0,12
    8fe0:	00260613          	add	a2,a2,2
    8fe4:	00261613          	sll	a2,a2,0x2
    8fe8:	f59f70ef          	jal	f40 <memcpy>
    8fec:	00100613          	li	a2,1
    8ff0:	00098593          	mv	a1,s3
    8ff4:	00040513          	mv	a0,s0
    8ff8:	49d000ef          	jal	9c94 <__lshift>
    8ffc:	00050b13          	mv	s6,a0
    9000:	aa9ff06f          	j	8aa8 <_dtoa_r+0xd7c>
    9004:	00090593          	mv	a1,s2
    9008:	000b8613          	mv	a2,s7
    900c:	00040513          	mv	a0,s0
    9010:	335000ef          	jal	9b44 <__pow5mult>
    9014:	00048613          	mv	a2,s1
    9018:	00050593          	mv	a1,a0
    901c:	00050913          	mv	s2,a0
    9020:	00040513          	mv	a0,s0
    9024:	059000ef          	jal	987c <__multiply>
    9028:	00050793          	mv	a5,a0
    902c:	00048593          	mv	a1,s1
    9030:	00040513          	mv	a0,s0
    9034:	00078493          	mv	s1,a5
    9038:	494000ef          	jal	94cc <_Bfree>
    903c:	03012783          	lw	a5,48(sp)
    9040:	417787b3          	sub	a5,a5,s7
    9044:	02f12823          	sw	a5,48(sp)
    9048:	f6078063          	beqz	a5,87a8 <_dtoa_r+0xa7c>
    904c:	f48ff06f          	j	8794 <_dtoa_r+0xa68>
    9050:	05012603          	lw	a2,80(sp)
    9054:	05412683          	lw	a3,84(sp)
    9058:	05812503          	lw	a0,88(sp)
    905c:	04b12623          	sw	a1,76(sp)
    9060:	000b8593          	mv	a1,s7
    9064:	02612423          	sw	t1,40(sp)
    9068:	3e4040ef          	jal	d44c <__muldf3>
    906c:	02812303          	lw	t1,40(sp)
    9070:	04812783          	lw	a5,72(sp)
    9074:	00100693          	li	a3,1
    9078:	006a8023          	sb	t1,0(s5)
    907c:	02a12c23          	sw	a0,56(sp)
    9080:	04c12883          	lw	a7,76(sp)
    9084:	00058913          	mv	s2,a1
    9088:	00fa8bb3          	add	s7,s5,a5
    908c:	7fff7617          	auipc	a2,0x7fff7
    9090:	66460613          	add	a2,a2,1636 # 800006f0 <__global_locale+0x1bc>
    9094:	28d78c63          	beq	a5,a3,932c <_dtoa_r+0x1600>
    9098:	00062783          	lw	a5,0(a2)
    909c:	00462803          	lw	a6,4(a2)
    90a0:	04912423          	sw	s1,72(sp)
    90a4:	02f12423          	sw	a5,40(sp)
    90a8:	03012623          	sw	a6,44(sp)
    90ac:	04812623          	sw	s0,76(sp)
    90b0:	000c8513          	mv	a0,s9
    90b4:	00088593          	mv	a1,a7
    90b8:	02812603          	lw	a2,40(sp)
    90bc:	02c12683          	lw	a3,44(sp)
    90c0:	001d0d13          	add	s10,s10,1
    90c4:	388040ef          	jal	d44c <__muldf3>
    90c8:	00058413          	mv	s0,a1
    90cc:	00050493          	mv	s1,a0
    90d0:	468050ef          	jal	e538 <__fixdfsi>
    90d4:	00050c93          	mv	s9,a0
    90d8:	4e4050ef          	jal	e5bc <__floatsidf>
    90dc:	00050613          	mv	a2,a0
    90e0:	00058693          	mv	a3,a1
    90e4:	00048513          	mv	a0,s1
    90e8:	00040593          	mv	a1,s0
    90ec:	030c8c93          	add	s9,s9,48
    90f0:	2ed040ef          	jal	dbdc <__subdf3>
    90f4:	ff9d0fa3          	sb	s9,-1(s10)
    90f8:	fdab90e3          	bne	s7,s10,90b8 <_dtoa_r+0x138c>
    90fc:	04812483          	lw	s1,72(sp)
    9100:	04c12403          	lw	s0,76(sp)
    9104:	00050c93          	mv	s9,a0
    9108:	00058893          	mv	a7,a1
    910c:	7fff7d17          	auipc	s10,0x7fff7
    9110:	5acd0d13          	add	s10,s10,1452 # 800006b8 <__global_locale+0x184>
    9114:	000d2603          	lw	a2,0(s10)
    9118:	004d2683          	lw	a3,4(s10)
    911c:	03812503          	lw	a0,56(sp)
    9120:	00090593          	mv	a1,s2
    9124:	03112423          	sw	a7,40(sp)
    9128:	71d020ef          	jal	c044 <__adddf3>
    912c:	02812883          	lw	a7,40(sp)
    9130:	000c8613          	mv	a2,s9
    9134:	00088693          	mv	a3,a7
    9138:	20c040ef          	jal	d344 <__ledf2>
    913c:	1a054863          	bltz	a0,92ec <_dtoa_r+0x15c0>
    9140:	03812603          	lw	a2,56(sp)
    9144:	000d2503          	lw	a0,0(s10)
    9148:	004d2583          	lw	a1,4(s10)
    914c:	00090693          	mv	a3,s2
    9150:	28d040ef          	jal	dbdc <__subdf3>
    9154:	02812883          	lw	a7,40(sp)
    9158:	000c8613          	mv	a2,s9
    915c:	00088693          	mv	a3,a7
    9160:	0e4040ef          	jal	d244 <__gedf2>
    9164:	12a04863          	bgtz	a0,9294 <_dtoa_r+0x1568>
    9168:	06c12783          	lw	a5,108(sp)
    916c:	de07c063          	bltz	a5,874c <_dtoa_r+0xa20>
    9170:	02012703          	lw	a4,32(sp)
    9174:	00e00793          	li	a5,14
    9178:	dce7ca63          	blt	a5,a4,874c <_dtoa_r+0xa20>
    917c:	02012783          	lw	a5,32(sp)
    9180:	00006717          	auipc	a4,0x6
    9184:	4d870713          	add	a4,a4,1240 # f658 <__mprec_tens>
    9188:	00379793          	sll	a5,a5,0x3
    918c:	00f707b3          	add	a5,a4,a5
    9190:	0007a903          	lw	s2,0(a5)
    9194:	0047a983          	lw	s3,4(a5)
    9198:	c90ff06f          	j	8628 <_dtoa_r+0x8fc>
    919c:	06812703          	lw	a4,104(sp)
    91a0:	01012683          	lw	a3,16(sp)
    91a4:	03600793          	li	a5,54
    91a8:	40e787b3          	sub	a5,a5,a4
    91ac:	00fb0b33          	add	s6,s6,a5
    91b0:	00f687b3          	add	a5,a3,a5
    91b4:	03012b83          	lw	s7,48(sp)
    91b8:	00068c93          	mv	s9,a3
    91bc:	00f12823          	sw	a5,16(sp)
    91c0:	815ff06f          	j	89d4 <_dtoa_r+0xca8>
    91c4:	02012783          	lw	a5,32(sp)
    91c8:	00090c13          	mv	s8,s2
    91cc:	01012a83          	lw	s5,16(sp)
    91d0:	00178a13          	add	s4,a5,1
    91d4:	000b0913          	mv	s2,s6
    91d8:	eb4ff06f          	j	888c <_dtoa_r+0xb60>
    91dc:	01812703          	lw	a4,24(sp)
    91e0:	01c12783          	lw	a5,28(sp)
    91e4:	00200913          	li	s2,2
    91e8:	f81fe06f          	j	8168 <_dtoa_r+0x43c>
    91ec:	b00c0063          	beqz	s8,84ec <_dtoa_r+0x7c0>
    91f0:	03c12d03          	lw	s10,60(sp)
    91f4:	bba05063          	blez	s10,8594 <_dtoa_r+0x868>
    91f8:	7fff7617          	auipc	a2,0x7fff7
    91fc:	4f860613          	add	a2,a2,1272 # 800006f0 <__global_locale+0x1bc>
    9200:	00078593          	mv	a1,a5
    9204:	02012783          	lw	a5,32(sp)
    9208:	00462683          	lw	a3,4(a2)
    920c:	00062603          	lw	a2,0(a2)
    9210:	fff78793          	add	a5,a5,-1
    9214:	00070513          	mv	a0,a4
    9218:	04f12e23          	sw	a5,92(sp)
    921c:	230040ef          	jal	d44c <__muldf3>
    9220:	00050713          	mv	a4,a0
    9224:	00190513          	add	a0,s2,1
    9228:	04e12423          	sw	a4,72(sp)
    922c:	04b12023          	sw	a1,64(sp)
    9230:	38c050ef          	jal	e5bc <__floatsidf>
    9234:	04812703          	lw	a4,72(sp)
    9238:	04012783          	lw	a5,64(sp)
    923c:	00070613          	mv	a2,a4
    9240:	00078693          	mv	a3,a5
    9244:	04e12623          	sw	a4,76(sp)
    9248:	204040ef          	jal	d44c <__muldf3>
    924c:	7fff7697          	auipc	a3,0x7fff7
    9250:	4ac68693          	add	a3,a3,1196 # 800006f8 <__global_locale+0x1c4>
    9254:	0006a603          	lw	a2,0(a3)
    9258:	0046a683          	lw	a3,4(a3)
    925c:	5e9020ef          	jal	c044 <__adddf3>
    9260:	fcc006b7          	lui	a3,0xfcc00
    9264:	04012783          	lw	a5,64(sp)
    9268:	04c12703          	lw	a4,76(sp)
    926c:	00050c93          	mv	s9,a0
    9270:	00b68bb3          	add	s7,a3,a1
    9274:	05a12423          	sw	s10,72(sp)
    9278:	f91fe06f          	j	8208 <_dtoa_r+0x4dc>
    927c:	03100693          	li	a3,49
    9280:	001c0c13          	add	s8,s8,1
    9284:	984ff06f          	j	8408 <_dtoa_r+0x6dc>
    9288:	00012c23          	sw	zero,24(sp)
    928c:	00000913          	li	s2,0
    9290:	a11ff06f          	j	8ca0 <_dtoa_r+0xf74>
    9294:	03000613          	li	a2,48
    9298:	fffbc783          	lbu	a5,-1(s7)
    929c:	000b8d13          	mv	s10,s7
    92a0:	fffb8b93          	add	s7,s7,-1
    92a4:	fec78ae3          	beq	a5,a2,9298 <_dtoa_r+0x156c>
    92a8:	05c12783          	lw	a5,92(sp)
    92ac:	00178a13          	add	s4,a5,1
    92b0:	e50ff06f          	j	8900 <_dtoa_r+0xbd4>
    92b4:	03900713          	li	a4,57
    92b8:	01012a83          	lw	s5,16(sp)
    92bc:	b8eb84e3          	beq	s7,a4,8e44 <_dtoa_r+0x1118>
    92c0:	933048e3          	bgtz	s3,8bf0 <_dtoa_r+0xec4>
    92c4:	931ff06f          	j	8bf4 <_dtoa_r+0xec8>
    92c8:	01012a83          	lw	s5,16(sp)
    92cc:	929ff06f          	j	8bf4 <_dtoa_r+0xec8>
    92d0:	00078993          	mv	s3,a5
    92d4:	a19ff06f          	j	8cec <_dtoa_r+0xfc0>
    92d8:	00078c93          	mv	s9,a5
    92dc:	018787b3          	add	a5,a5,s8
    92e0:	018b0b33          	add	s6,s6,s8
    92e4:	00f12823          	sw	a5,16(sp)
    92e8:	eecff06f          	j	89d4 <_dtoa_r+0xca8>
    92ec:	05c12783          	lw	a5,92(sp)
    92f0:	00178c13          	add	s8,a5,1
    92f4:	8f0ff06f          	j	83e4 <_dtoa_r+0x6b8>
    92f8:	04c12983          	lw	s3,76(sp)
    92fc:	05012b03          	lw	s6,80(sp)
    9300:	05812c03          	lw	s8,88(sp)
    9304:	04812a03          	lw	s4,72(sp)
    9308:	a8cff06f          	j	8594 <_dtoa_r+0x868>
    930c:	00200793          	li	a5,2
    9310:	0147c863          	blt	a5,s4,9320 <_dtoa_r+0x15f4>
    9314:	02012a03          	lw	s4,32(sp)
    9318:	03c12c03          	lw	s8,60(sp)
    931c:	d1cff06f          	j	8838 <_dtoa_r+0xb0c>
    9320:	03c12c03          	lw	s8,60(sp)
    9324:	03612023          	sw	s6,32(sp)
    9328:	949ff06f          	j	8c70 <_dtoa_r+0xf44>
    932c:	04012b83          	lw	s7,64(sp)
    9330:	dddff06f          	j	910c <_dtoa_r+0x13e0>
    9334:	00200793          	li	a5,2
    9338:	ff47c4e3          	blt	a5,s4,9320 <_dtoa_r+0x15f4>
    933c:	03c12c03          	lw	s8,60(sp)
    9340:	03612023          	sw	s6,32(sp)
    9344:	f44ff06f          	j	8a88 <_dtoa_r+0xd5c>
    9348:	00050713          	mv	a4,a0
    934c:	00058793          	mv	a5,a1
    9350:	00200913          	li	s2,2
    9354:	e15fe06f          	j	8168 <_dtoa_r+0x43c>
    9358:	00006697          	auipc	a3,0x6
    935c:	cc068693          	add	a3,a3,-832 # f018 <__fini_array_end+0x30c>
    9360:	00000613          	li	a2,0
    9364:	2ef00593          	li	a1,751
    9368:	00006517          	auipc	a0,0x6
    936c:	cc450513          	add	a0,a0,-828 # f02c <__fini_array_end+0x320>
    9370:	25d010ef          	jal	adcc <__assert_func>
    9374:	01012a83          	lw	s5,16(sp)
    9378:	85b048e3          	bgtz	s11,8bc8 <_dtoa_r+0xe9c>
    937c:	879ff06f          	j	8bf4 <_dtoa_r+0xec8>
    9380:	00006697          	auipc	a3,0x6
    9384:	c9868693          	add	a3,a3,-872 # f018 <__fini_array_end+0x30c>
    9388:	00000613          	li	a2,0
    938c:	1af00593          	li	a1,431
    9390:	00006517          	auipc	a0,0x6
    9394:	c9c50513          	add	a0,a0,-868 # f02c <__fini_array_end+0x320>
    9398:	235010ef          	jal	adcc <__assert_func>
    939c:	02042e23          	sw	zero,60(s0)
    93a0:	00000593          	li	a1,0
    93a4:	cc1fe06f          	j	8064 <_dtoa_r+0x338>
    93a8:	02012423          	sw	zero,40(sp)
    93ac:	c7dfe06f          	j	8028 <_dtoa_r+0x2fc>

000093b0 <__ascii_mbtowc>:
    93b0:	02058063          	beqz	a1,93d0 <__ascii_mbtowc+0x20>
    93b4:	04060263          	beqz	a2,93f8 <__ascii_mbtowc+0x48>
    93b8:	04068863          	beqz	a3,9408 <__ascii_mbtowc+0x58>
    93bc:	00064783          	lbu	a5,0(a2)
    93c0:	00f5a023          	sw	a5,0(a1)
    93c4:	00064503          	lbu	a0,0(a2)
    93c8:	00a03533          	snez	a0,a0
    93cc:	00008067          	ret
    93d0:	ff010113          	add	sp,sp,-16
    93d4:	00c10593          	add	a1,sp,12
    93d8:	02060463          	beqz	a2,9400 <__ascii_mbtowc+0x50>
    93dc:	02068a63          	beqz	a3,9410 <__ascii_mbtowc+0x60>
    93e0:	00064783          	lbu	a5,0(a2)
    93e4:	00f5a023          	sw	a5,0(a1)
    93e8:	00064503          	lbu	a0,0(a2)
    93ec:	00a03533          	snez	a0,a0
    93f0:	01010113          	add	sp,sp,16
    93f4:	00008067          	ret
    93f8:	00000513          	li	a0,0
    93fc:	00008067          	ret
    9400:	00000513          	li	a0,0
    9404:	fedff06f          	j	93f0 <__ascii_mbtowc+0x40>
    9408:	ffe00513          	li	a0,-2
    940c:	00008067          	ret
    9410:	ffe00513          	li	a0,-2
    9414:	fddff06f          	j	93f0 <__ascii_mbtowc+0x40>

00009418 <_Balloc>:
    9418:	04452783          	lw	a5,68(a0)
    941c:	ff010113          	add	sp,sp,-16
    9420:	00812423          	sw	s0,8(sp)
    9424:	00912223          	sw	s1,4(sp)
    9428:	00112623          	sw	ra,12(sp)
    942c:	00050413          	mv	s0,a0
    9430:	00058493          	mv	s1,a1
    9434:	02078c63          	beqz	a5,946c <_Balloc+0x54>
    9438:	00249713          	sll	a4,s1,0x2
    943c:	00e787b3          	add	a5,a5,a4
    9440:	0007a503          	lw	a0,0(a5)
    9444:	04050463          	beqz	a0,948c <_Balloc+0x74>
    9448:	00052703          	lw	a4,0(a0)
    944c:	00e7a023          	sw	a4,0(a5)
    9450:	00052823          	sw	zero,16(a0)
    9454:	00052623          	sw	zero,12(a0)
    9458:	00c12083          	lw	ra,12(sp)
    945c:	00812403          	lw	s0,8(sp)
    9460:	00412483          	lw	s1,4(sp)
    9464:	01010113          	add	sp,sp,16
    9468:	00008067          	ret
    946c:	02100613          	li	a2,33
    9470:	00400593          	li	a1,4
    9474:	1b1010ef          	jal	ae24 <_calloc_r>
    9478:	04a42223          	sw	a0,68(s0)
    947c:	00050793          	mv	a5,a0
    9480:	fa051ce3          	bnez	a0,9438 <_Balloc+0x20>
    9484:	00000513          	li	a0,0
    9488:	fd1ff06f          	j	9458 <_Balloc+0x40>
    948c:	01212023          	sw	s2,0(sp)
    9490:	00100913          	li	s2,1
    9494:	00991933          	sll	s2,s2,s1
    9498:	00590613          	add	a2,s2,5
    949c:	00261613          	sll	a2,a2,0x2
    94a0:	00100593          	li	a1,1
    94a4:	00040513          	mv	a0,s0
    94a8:	17d010ef          	jal	ae24 <_calloc_r>
    94ac:	00050a63          	beqz	a0,94c0 <_Balloc+0xa8>
    94b0:	01252423          	sw	s2,8(a0)
    94b4:	00952223          	sw	s1,4(a0)
    94b8:	00012903          	lw	s2,0(sp)
    94bc:	f95ff06f          	j	9450 <_Balloc+0x38>
    94c0:	00012903          	lw	s2,0(sp)
    94c4:	00000513          	li	a0,0
    94c8:	f91ff06f          	j	9458 <_Balloc+0x40>

000094cc <_Bfree>:
    94cc:	02058063          	beqz	a1,94ec <_Bfree+0x20>
    94d0:	0045a703          	lw	a4,4(a1)
    94d4:	04452783          	lw	a5,68(a0)
    94d8:	00271713          	sll	a4,a4,0x2
    94dc:	00e787b3          	add	a5,a5,a4
    94e0:	0007a703          	lw	a4,0(a5)
    94e4:	00e5a023          	sw	a4,0(a1)
    94e8:	00b7a023          	sw	a1,0(a5)
    94ec:	00008067          	ret

000094f0 <__multadd>:
    94f0:	fd010113          	add	sp,sp,-48
    94f4:	01412c23          	sw	s4,24(sp)
    94f8:	0105aa03          	lw	s4,16(a1)
    94fc:	01912223          	sw	s9,4(sp)
    9500:	00010cb7          	lui	s9,0x10
    9504:	02912223          	sw	s1,36(sp)
    9508:	03212023          	sw	s2,32(sp)
    950c:	01312e23          	sw	s3,28(sp)
    9510:	01512a23          	sw	s5,20(sp)
    9514:	01612823          	sw	s6,16(sp)
    9518:	01712623          	sw	s7,12(sp)
    951c:	02112623          	sw	ra,44(sp)
    9520:	02812423          	sw	s0,40(sp)
    9524:	01812423          	sw	s8,8(sp)
    9528:	00058a93          	mv	s5,a1
    952c:	00050b13          	mv	s6,a0
    9530:	00060993          	mv	s3,a2
    9534:	00068493          	mv	s1,a3
    9538:	01458913          	add	s2,a1,20
    953c:	00000b93          	li	s7,0
    9540:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    9544:	00092c03          	lw	s8,0(s2)
    9548:	00098593          	mv	a1,s3
    954c:	00490913          	add	s2,s2,4
    9550:	019c7533          	and	a0,s8,s9
    9554:	5c0050ef          	jal	eb14 <__mulsi3>
    9558:	00050413          	mv	s0,a0
    955c:	00098593          	mv	a1,s3
    9560:	010c5513          	srl	a0,s8,0x10
    9564:	00940433          	add	s0,s0,s1
    9568:	5ac050ef          	jal	eb14 <__mulsi3>
    956c:	01045793          	srl	a5,s0,0x10
    9570:	00f50533          	add	a0,a0,a5
    9574:	01051793          	sll	a5,a0,0x10
    9578:	01947433          	and	s0,s0,s9
    957c:	008787b3          	add	a5,a5,s0
    9580:	fef92e23          	sw	a5,-4(s2)
    9584:	001b8b93          	add	s7,s7,1
    9588:	01055493          	srl	s1,a0,0x10
    958c:	fb4bcce3          	blt	s7,s4,9544 <__multadd+0x54>
    9590:	02048263          	beqz	s1,95b4 <__multadd+0xc4>
    9594:	008aa783          	lw	a5,8(s5)
    9598:	04fa5a63          	bge	s4,a5,95ec <__multadd+0xfc>
    959c:	004a0793          	add	a5,s4,4
    95a0:	00279793          	sll	a5,a5,0x2
    95a4:	00fa87b3          	add	a5,s5,a5
    95a8:	0097a223          	sw	s1,4(a5)
    95ac:	001a0a13          	add	s4,s4,1
    95b0:	014aa823          	sw	s4,16(s5)
    95b4:	02c12083          	lw	ra,44(sp)
    95b8:	02812403          	lw	s0,40(sp)
    95bc:	02412483          	lw	s1,36(sp)
    95c0:	02012903          	lw	s2,32(sp)
    95c4:	01c12983          	lw	s3,28(sp)
    95c8:	01812a03          	lw	s4,24(sp)
    95cc:	01012b03          	lw	s6,16(sp)
    95d0:	00c12b83          	lw	s7,12(sp)
    95d4:	00812c03          	lw	s8,8(sp)
    95d8:	00412c83          	lw	s9,4(sp)
    95dc:	000a8513          	mv	a0,s5
    95e0:	01412a83          	lw	s5,20(sp)
    95e4:	03010113          	add	sp,sp,48
    95e8:	00008067          	ret
    95ec:	004aa583          	lw	a1,4(s5)
    95f0:	000b0513          	mv	a0,s6
    95f4:	00158593          	add	a1,a1,1
    95f8:	e21ff0ef          	jal	9418 <_Balloc>
    95fc:	00050413          	mv	s0,a0
    9600:	04050c63          	beqz	a0,9658 <__multadd+0x168>
    9604:	010aa603          	lw	a2,16(s5)
    9608:	00ca8593          	add	a1,s5,12
    960c:	00c50513          	add	a0,a0,12
    9610:	00260613          	add	a2,a2,2
    9614:	00261613          	sll	a2,a2,0x2
    9618:	929f70ef          	jal	f40 <memcpy>
    961c:	004aa703          	lw	a4,4(s5)
    9620:	044b2783          	lw	a5,68(s6)
    9624:	00271713          	sll	a4,a4,0x2
    9628:	00e787b3          	add	a5,a5,a4
    962c:	0007a703          	lw	a4,0(a5)
    9630:	00eaa023          	sw	a4,0(s5)
    9634:	0157a023          	sw	s5,0(a5)
    9638:	004a0793          	add	a5,s4,4
    963c:	00040a93          	mv	s5,s0
    9640:	00279793          	sll	a5,a5,0x2
    9644:	00fa87b3          	add	a5,s5,a5
    9648:	0097a223          	sw	s1,4(a5)
    964c:	001a0a13          	add	s4,s4,1
    9650:	014aa823          	sw	s4,16(s5)
    9654:	f61ff06f          	j	95b4 <__multadd+0xc4>
    9658:	00006697          	auipc	a3,0x6
    965c:	9c068693          	add	a3,a3,-1600 # f018 <__fini_array_end+0x30c>
    9660:	00000613          	li	a2,0
    9664:	0ba00593          	li	a1,186
    9668:	00006517          	auipc	a0,0x6
    966c:	a4450513          	add	a0,a0,-1468 # f0ac <__fini_array_end+0x3a0>
    9670:	75c010ef          	jal	adcc <__assert_func>

00009674 <__hi0bits>:
    9674:	00050793          	mv	a5,a0
    9678:	00010737          	lui	a4,0x10
    967c:	00000513          	li	a0,0
    9680:	00e7f663          	bgeu	a5,a4,968c <__hi0bits+0x18>
    9684:	01079793          	sll	a5,a5,0x10
    9688:	01000513          	li	a0,16
    968c:	01000737          	lui	a4,0x1000
    9690:	00e7f663          	bgeu	a5,a4,969c <__hi0bits+0x28>
    9694:	00850513          	add	a0,a0,8
    9698:	00879793          	sll	a5,a5,0x8
    969c:	10000737          	lui	a4,0x10000
    96a0:	00e7f663          	bgeu	a5,a4,96ac <__hi0bits+0x38>
    96a4:	00450513          	add	a0,a0,4
    96a8:	00479793          	sll	a5,a5,0x4
    96ac:	40000737          	lui	a4,0x40000
    96b0:	00e7ea63          	bltu	a5,a4,96c4 <__hi0bits+0x50>
    96b4:	fff7c793          	not	a5,a5
    96b8:	01f7d793          	srl	a5,a5,0x1f
    96bc:	00f50533          	add	a0,a0,a5
    96c0:	00008067          	ret
    96c4:	00279793          	sll	a5,a5,0x2
    96c8:	0007ca63          	bltz	a5,96dc <__hi0bits+0x68>
    96cc:	00179713          	sll	a4,a5,0x1
    96d0:	00074a63          	bltz	a4,96e4 <__hi0bits+0x70>
    96d4:	02000513          	li	a0,32
    96d8:	00008067          	ret
    96dc:	00250513          	add	a0,a0,2
    96e0:	00008067          	ret
    96e4:	00350513          	add	a0,a0,3
    96e8:	00008067          	ret

000096ec <__lo0bits>:
    96ec:	00052783          	lw	a5,0(a0)
    96f0:	00050713          	mv	a4,a0
    96f4:	0077f693          	and	a3,a5,7
    96f8:	02068463          	beqz	a3,9720 <__lo0bits+0x34>
    96fc:	0017f693          	and	a3,a5,1
    9700:	00000513          	li	a0,0
    9704:	04069e63          	bnez	a3,9760 <__lo0bits+0x74>
    9708:	0027f693          	and	a3,a5,2
    970c:	0a068863          	beqz	a3,97bc <__lo0bits+0xd0>
    9710:	0017d793          	srl	a5,a5,0x1
    9714:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9718:	00100513          	li	a0,1
    971c:	00008067          	ret
    9720:	01079693          	sll	a3,a5,0x10
    9724:	0106d693          	srl	a3,a3,0x10
    9728:	00000513          	li	a0,0
    972c:	06068e63          	beqz	a3,97a8 <__lo0bits+0xbc>
    9730:	0ff7f693          	zext.b	a3,a5
    9734:	06068063          	beqz	a3,9794 <__lo0bits+0xa8>
    9738:	00f7f693          	and	a3,a5,15
    973c:	04068263          	beqz	a3,9780 <__lo0bits+0x94>
    9740:	0037f693          	and	a3,a5,3
    9744:	02068463          	beqz	a3,976c <__lo0bits+0x80>
    9748:	0017f693          	and	a3,a5,1
    974c:	00069c63          	bnez	a3,9764 <__lo0bits+0x78>
    9750:	0017d793          	srl	a5,a5,0x1
    9754:	00150513          	add	a0,a0,1
    9758:	00079663          	bnez	a5,9764 <__lo0bits+0x78>
    975c:	02000513          	li	a0,32
    9760:	00008067          	ret
    9764:	00f72023          	sw	a5,0(a4)
    9768:	00008067          	ret
    976c:	0027d793          	srl	a5,a5,0x2
    9770:	0017f693          	and	a3,a5,1
    9774:	00250513          	add	a0,a0,2
    9778:	fe0696e3          	bnez	a3,9764 <__lo0bits+0x78>
    977c:	fd5ff06f          	j	9750 <__lo0bits+0x64>
    9780:	0047d793          	srl	a5,a5,0x4
    9784:	0037f693          	and	a3,a5,3
    9788:	00450513          	add	a0,a0,4
    978c:	fa069ee3          	bnez	a3,9748 <__lo0bits+0x5c>
    9790:	fddff06f          	j	976c <__lo0bits+0x80>
    9794:	0087d793          	srl	a5,a5,0x8
    9798:	00f7f693          	and	a3,a5,15
    979c:	00850513          	add	a0,a0,8
    97a0:	fa0690e3          	bnez	a3,9740 <__lo0bits+0x54>
    97a4:	fddff06f          	j	9780 <__lo0bits+0x94>
    97a8:	0107d793          	srl	a5,a5,0x10
    97ac:	0ff7f693          	zext.b	a3,a5
    97b0:	01000513          	li	a0,16
    97b4:	f80692e3          	bnez	a3,9738 <__lo0bits+0x4c>
    97b8:	fddff06f          	j	9794 <__lo0bits+0xa8>
    97bc:	0027d793          	srl	a5,a5,0x2
    97c0:	00f72023          	sw	a5,0(a4)
    97c4:	00200513          	li	a0,2
    97c8:	00008067          	ret

000097cc <__i2b>:
    97cc:	04452783          	lw	a5,68(a0)
    97d0:	ff010113          	add	sp,sp,-16
    97d4:	00812423          	sw	s0,8(sp)
    97d8:	00912223          	sw	s1,4(sp)
    97dc:	00112623          	sw	ra,12(sp)
    97e0:	00050413          	mv	s0,a0
    97e4:	00058493          	mv	s1,a1
    97e8:	02078c63          	beqz	a5,9820 <__i2b+0x54>
    97ec:	0047a503          	lw	a0,4(a5)
    97f0:	06050263          	beqz	a0,9854 <__i2b+0x88>
    97f4:	00052703          	lw	a4,0(a0)
    97f8:	00e7a223          	sw	a4,4(a5)
    97fc:	00c12083          	lw	ra,12(sp)
    9800:	00812403          	lw	s0,8(sp)
    9804:	00100793          	li	a5,1
    9808:	00952a23          	sw	s1,20(a0)
    980c:	00052623          	sw	zero,12(a0)
    9810:	00f52823          	sw	a5,16(a0)
    9814:	00412483          	lw	s1,4(sp)
    9818:	01010113          	add	sp,sp,16
    981c:	00008067          	ret
    9820:	02100613          	li	a2,33
    9824:	00400593          	li	a1,4
    9828:	5fc010ef          	jal	ae24 <_calloc_r>
    982c:	04a42223          	sw	a0,68(s0)
    9830:	00050793          	mv	a5,a0
    9834:	fa051ce3          	bnez	a0,97ec <__i2b+0x20>
    9838:	00005697          	auipc	a3,0x5
    983c:	7e068693          	add	a3,a3,2016 # f018 <__fini_array_end+0x30c>
    9840:	00000613          	li	a2,0
    9844:	14500593          	li	a1,325
    9848:	00006517          	auipc	a0,0x6
    984c:	86450513          	add	a0,a0,-1948 # f0ac <__fini_array_end+0x3a0>
    9850:	57c010ef          	jal	adcc <__assert_func>
    9854:	01c00613          	li	a2,28
    9858:	00100593          	li	a1,1
    985c:	00040513          	mv	a0,s0
    9860:	5c4010ef          	jal	ae24 <_calloc_r>
    9864:	fc050ae3          	beqz	a0,9838 <__i2b+0x6c>
    9868:	00100793          	li	a5,1
    986c:	00f52223          	sw	a5,4(a0)
    9870:	00200793          	li	a5,2
    9874:	00f52423          	sw	a5,8(a0)
    9878:	f85ff06f          	j	97fc <__i2b+0x30>

0000987c <__multiply>:
    987c:	fb010113          	add	sp,sp,-80
    9880:	03312e23          	sw	s3,60(sp)
    9884:	03812423          	sw	s8,40(sp)
    9888:	01062983          	lw	s3,16(a2)
    988c:	0105ac03          	lw	s8,16(a1)
    9890:	04812423          	sw	s0,72(sp)
    9894:	03412c23          	sw	s4,56(sp)
    9898:	04112623          	sw	ra,76(sp)
    989c:	03712623          	sw	s7,44(sp)
    98a0:	00058a13          	mv	s4,a1
    98a4:	00060413          	mv	s0,a2
    98a8:	013c4c63          	blt	s8,s3,98c0 <__multiply+0x44>
    98ac:	00098713          	mv	a4,s3
    98b0:	00058413          	mv	s0,a1
    98b4:	000c0993          	mv	s3,s8
    98b8:	00060a13          	mv	s4,a2
    98bc:	00070c13          	mv	s8,a4
    98c0:	00842783          	lw	a5,8(s0)
    98c4:	00442583          	lw	a1,4(s0)
    98c8:	01898bb3          	add	s7,s3,s8
    98cc:	0177a7b3          	slt	a5,a5,s7
    98d0:	00f585b3          	add	a1,a1,a5
    98d4:	b45ff0ef          	jal	9418 <_Balloc>
    98d8:	00a12623          	sw	a0,12(sp)
    98dc:	22050863          	beqz	a0,9b0c <__multiply+0x290>
    98e0:	00c12783          	lw	a5,12(sp)
    98e4:	03512a23          	sw	s5,52(sp)
    98e8:	03612823          	sw	s6,48(sp)
    98ec:	002b9a93          	sll	s5,s7,0x2
    98f0:	01478b13          	add	s6,a5,20
    98f4:	015b0ab3          	add	s5,s6,s5
    98f8:	000b0793          	mv	a5,s6
    98fc:	015b7863          	bgeu	s6,s5,990c <__multiply+0x90>
    9900:	0007a023          	sw	zero,0(a5)
    9904:	00478793          	add	a5,a5,4
    9908:	ff57ece3          	bltu	a5,s5,9900 <__multiply+0x84>
    990c:	014a0a13          	add	s4,s4,20
    9910:	002c1c13          	sll	s8,s8,0x2
    9914:	01440793          	add	a5,s0,20
    9918:	018a0733          	add	a4,s4,s8
    991c:	00299993          	sll	s3,s3,0x2
    9920:	00f12423          	sw	a5,8(sp)
    9924:	00e12023          	sw	a4,0(sp)
    9928:	013789b3          	add	s3,a5,s3
    992c:	16ea7c63          	bgeu	s4,a4,9aa4 <__multiply+0x228>
    9930:	00400713          	li	a4,4
    9934:	04912223          	sw	s1,68(sp)
    9938:	05212023          	sw	s2,64(sp)
    993c:	03912223          	sw	s9,36(sp)
    9940:	03a12023          	sw	s10,32(sp)
    9944:	01b12e23          	sw	s11,28(sp)
    9948:	01540793          	add	a5,s0,21
    994c:	00e12223          	sw	a4,4(sp)
    9950:	1af9f263          	bgeu	s3,a5,9af4 <__multiply+0x278>
    9954:	00010437          	lui	s0,0x10
    9958:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    995c:	01c0006f          	j	9978 <__multiply+0xfc>
    9960:	01095913          	srl	s2,s2,0x10
    9964:	0a091063          	bnez	s2,9a04 <__multiply+0x188>
    9968:	00012783          	lw	a5,0(sp)
    996c:	004a0a13          	add	s4,s4,4
    9970:	004b0b13          	add	s6,s6,4
    9974:	10fa7e63          	bgeu	s4,a5,9a90 <__multiply+0x214>
    9978:	000a2903          	lw	s2,0(s4)
    997c:	008974b3          	and	s1,s2,s0
    9980:	fe0480e3          	beqz	s1,9960 <__multiply+0xe4>
    9984:	00812c83          	lw	s9,8(sp)
    9988:	000b0d13          	mv	s10,s6
    998c:	00000c13          	li	s8,0
    9990:	000cad83          	lw	s11,0(s9)
    9994:	000d2903          	lw	s2,0(s10)
    9998:	00048593          	mv	a1,s1
    999c:	008df533          	and	a0,s11,s0
    99a0:	174050ef          	jal	eb14 <__mulsi3>
    99a4:	00897733          	and	a4,s2,s0
    99a8:	00e50733          	add	a4,a0,a4
    99ac:	00048593          	mv	a1,s1
    99b0:	010dd513          	srl	a0,s11,0x10
    99b4:	01870c33          	add	s8,a4,s8
    99b8:	01095913          	srl	s2,s2,0x10
    99bc:	158050ef          	jal	eb14 <__mulsi3>
    99c0:	010c5713          	srl	a4,s8,0x10
    99c4:	01250533          	add	a0,a0,s2
    99c8:	00e50533          	add	a0,a0,a4
    99cc:	008c77b3          	and	a5,s8,s0
    99d0:	01051713          	sll	a4,a0,0x10
    99d4:	004d0d13          	add	s10,s10,4
    99d8:	00f767b3          	or	a5,a4,a5
    99dc:	004c8c93          	add	s9,s9,4
    99e0:	fefd2e23          	sw	a5,-4(s10)
    99e4:	01055c13          	srl	s8,a0,0x10
    99e8:	fb3ce4e3          	bltu	s9,s3,9990 <__multiply+0x114>
    99ec:	00412783          	lw	a5,4(sp)
    99f0:	00fb0733          	add	a4,s6,a5
    99f4:	01872023          	sw	s8,0(a4)
    99f8:	000a2903          	lw	s2,0(s4)
    99fc:	01095913          	srl	s2,s2,0x10
    9a00:	f60904e3          	beqz	s2,9968 <__multiply+0xec>
    9a04:	000b2c83          	lw	s9,0(s6)
    9a08:	00812d03          	lw	s10,8(sp)
    9a0c:	000b0c13          	mv	s8,s6
    9a10:	000c8493          	mv	s1,s9
    9a14:	00000d93          	li	s11,0
    9a18:	000d2503          	lw	a0,0(s10)
    9a1c:	00090593          	mv	a1,s2
    9a20:	0104d493          	srl	s1,s1,0x10
    9a24:	00857533          	and	a0,a0,s0
    9a28:	0ec050ef          	jal	eb14 <__mulsi3>
    9a2c:	01b50733          	add	a4,a0,s11
    9a30:	00970db3          	add	s11,a4,s1
    9a34:	010d9593          	sll	a1,s11,0x10
    9a38:	008cf7b3          	and	a5,s9,s0
    9a3c:	00f5e7b3          	or	a5,a1,a5
    9a40:	00fc2023          	sw	a5,0(s8)
    9a44:	002d5503          	lhu	a0,2(s10)
    9a48:	004c2483          	lw	s1,4(s8)
    9a4c:	00090593          	mv	a1,s2
    9a50:	0c4050ef          	jal	eb14 <__mulsi3>
    9a54:	0084f7b3          	and	a5,s1,s0
    9a58:	010dd713          	srl	a4,s11,0x10
    9a5c:	00f507b3          	add	a5,a0,a5
    9a60:	004d0d13          	add	s10,s10,4
    9a64:	00e78cb3          	add	s9,a5,a4
    9a68:	004c0c13          	add	s8,s8,4
    9a6c:	010cdd93          	srl	s11,s9,0x10
    9a70:	fb3d64e3          	bltu	s10,s3,9a18 <__multiply+0x19c>
    9a74:	00412783          	lw	a5,4(sp)
    9a78:	004a0a13          	add	s4,s4,4
    9a7c:	00fb0733          	add	a4,s6,a5
    9a80:	00012783          	lw	a5,0(sp)
    9a84:	01972023          	sw	s9,0(a4)
    9a88:	004b0b13          	add	s6,s6,4
    9a8c:	eefa66e3          	bltu	s4,a5,9978 <__multiply+0xfc>
    9a90:	04412483          	lw	s1,68(sp)
    9a94:	04012903          	lw	s2,64(sp)
    9a98:	02412c83          	lw	s9,36(sp)
    9a9c:	02012d03          	lw	s10,32(sp)
    9aa0:	01c12d83          	lw	s11,28(sp)
    9aa4:	01704863          	bgtz	s7,9ab4 <__multiply+0x238>
    9aa8:	0180006f          	j	9ac0 <__multiply+0x244>
    9aac:	fffb8b93          	add	s7,s7,-1
    9ab0:	000b8863          	beqz	s7,9ac0 <__multiply+0x244>
    9ab4:	ffcaa783          	lw	a5,-4(s5)
    9ab8:	ffca8a93          	add	s5,s5,-4
    9abc:	fe0788e3          	beqz	a5,9aac <__multiply+0x230>
    9ac0:	00c12783          	lw	a5,12(sp)
    9ac4:	04c12083          	lw	ra,76(sp)
    9ac8:	04812403          	lw	s0,72(sp)
    9acc:	0177a823          	sw	s7,16(a5)
    9ad0:	03412a83          	lw	s5,52(sp)
    9ad4:	03012b03          	lw	s6,48(sp)
    9ad8:	03c12983          	lw	s3,60(sp)
    9adc:	03812a03          	lw	s4,56(sp)
    9ae0:	02c12b83          	lw	s7,44(sp)
    9ae4:	02812c03          	lw	s8,40(sp)
    9ae8:	00078513          	mv	a0,a5
    9aec:	05010113          	add	sp,sp,80
    9af0:	00008067          	ret
    9af4:	408987b3          	sub	a5,s3,s0
    9af8:	feb78793          	add	a5,a5,-21
    9afc:	ffc7f793          	and	a5,a5,-4
    9b00:	00478793          	add	a5,a5,4
    9b04:	00f12223          	sw	a5,4(sp)
    9b08:	e4dff06f          	j	9954 <__multiply+0xd8>
    9b0c:	00005697          	auipc	a3,0x5
    9b10:	50c68693          	add	a3,a3,1292 # f018 <__fini_array_end+0x30c>
    9b14:	00000613          	li	a2,0
    9b18:	16200593          	li	a1,354
    9b1c:	00005517          	auipc	a0,0x5
    9b20:	59050513          	add	a0,a0,1424 # f0ac <__fini_array_end+0x3a0>
    9b24:	04912223          	sw	s1,68(sp)
    9b28:	05212023          	sw	s2,64(sp)
    9b2c:	03512a23          	sw	s5,52(sp)
    9b30:	03612823          	sw	s6,48(sp)
    9b34:	03912223          	sw	s9,36(sp)
    9b38:	03a12023          	sw	s10,32(sp)
    9b3c:	01b12e23          	sw	s11,28(sp)
    9b40:	28c010ef          	jal	adcc <__assert_func>

00009b44 <__pow5mult>:
    9b44:	fe010113          	add	sp,sp,-32
    9b48:	00812c23          	sw	s0,24(sp)
    9b4c:	01212823          	sw	s2,16(sp)
    9b50:	01312623          	sw	s3,12(sp)
    9b54:	00112e23          	sw	ra,28(sp)
    9b58:	00367793          	and	a5,a2,3
    9b5c:	00060413          	mv	s0,a2
    9b60:	00050993          	mv	s3,a0
    9b64:	00058913          	mv	s2,a1
    9b68:	0a079c63          	bnez	a5,9c20 <__pow5mult+0xdc>
    9b6c:	40245413          	sra	s0,s0,0x2
    9b70:	06040a63          	beqz	s0,9be4 <__pow5mult+0xa0>
    9b74:	00912a23          	sw	s1,20(sp)
    9b78:	0409a483          	lw	s1,64(s3)
    9b7c:	0c048663          	beqz	s1,9c48 <__pow5mult+0x104>
    9b80:	00147793          	and	a5,s0,1
    9b84:	02079063          	bnez	a5,9ba4 <__pow5mult+0x60>
    9b88:	40145413          	sra	s0,s0,0x1
    9b8c:	04040a63          	beqz	s0,9be0 <__pow5mult+0x9c>
    9b90:	0004a503          	lw	a0,0(s1)
    9b94:	06050663          	beqz	a0,9c00 <__pow5mult+0xbc>
    9b98:	00050493          	mv	s1,a0
    9b9c:	00147793          	and	a5,s0,1
    9ba0:	fe0784e3          	beqz	a5,9b88 <__pow5mult+0x44>
    9ba4:	00048613          	mv	a2,s1
    9ba8:	00090593          	mv	a1,s2
    9bac:	00098513          	mv	a0,s3
    9bb0:	ccdff0ef          	jal	987c <__multiply>
    9bb4:	02090063          	beqz	s2,9bd4 <__pow5mult+0x90>
    9bb8:	00492703          	lw	a4,4(s2)
    9bbc:	0449a783          	lw	a5,68(s3)
    9bc0:	00271713          	sll	a4,a4,0x2
    9bc4:	00e787b3          	add	a5,a5,a4
    9bc8:	0007a703          	lw	a4,0(a5)
    9bcc:	00e92023          	sw	a4,0(s2)
    9bd0:	0127a023          	sw	s2,0(a5)
    9bd4:	40145413          	sra	s0,s0,0x1
    9bd8:	00050913          	mv	s2,a0
    9bdc:	fa041ae3          	bnez	s0,9b90 <__pow5mult+0x4c>
    9be0:	01412483          	lw	s1,20(sp)
    9be4:	01c12083          	lw	ra,28(sp)
    9be8:	01812403          	lw	s0,24(sp)
    9bec:	00c12983          	lw	s3,12(sp)
    9bf0:	00090513          	mv	a0,s2
    9bf4:	01012903          	lw	s2,16(sp)
    9bf8:	02010113          	add	sp,sp,32
    9bfc:	00008067          	ret
    9c00:	00048613          	mv	a2,s1
    9c04:	00048593          	mv	a1,s1
    9c08:	00098513          	mv	a0,s3
    9c0c:	c71ff0ef          	jal	987c <__multiply>
    9c10:	00a4a023          	sw	a0,0(s1)
    9c14:	00052023          	sw	zero,0(a0)
    9c18:	00050493          	mv	s1,a0
    9c1c:	f81ff06f          	j	9b9c <__pow5mult+0x58>
    9c20:	fff78793          	add	a5,a5,-1
    9c24:	00006717          	auipc	a4,0x6
    9c28:	9fc70713          	add	a4,a4,-1540 # f620 <p05.0>
    9c2c:	00279793          	sll	a5,a5,0x2
    9c30:	00f707b3          	add	a5,a4,a5
    9c34:	0007a603          	lw	a2,0(a5)
    9c38:	00000693          	li	a3,0
    9c3c:	8b5ff0ef          	jal	94f0 <__multadd>
    9c40:	00050913          	mv	s2,a0
    9c44:	f29ff06f          	j	9b6c <__pow5mult+0x28>
    9c48:	00100593          	li	a1,1
    9c4c:	00098513          	mv	a0,s3
    9c50:	fc8ff0ef          	jal	9418 <_Balloc>
    9c54:	00050493          	mv	s1,a0
    9c58:	02050063          	beqz	a0,9c78 <__pow5mult+0x134>
    9c5c:	27100793          	li	a5,625
    9c60:	00f52a23          	sw	a5,20(a0)
    9c64:	00100793          	li	a5,1
    9c68:	00f52823          	sw	a5,16(a0)
    9c6c:	04a9a023          	sw	a0,64(s3)
    9c70:	00052023          	sw	zero,0(a0)
    9c74:	f0dff06f          	j	9b80 <__pow5mult+0x3c>
    9c78:	00005697          	auipc	a3,0x5
    9c7c:	3a068693          	add	a3,a3,928 # f018 <__fini_array_end+0x30c>
    9c80:	00000613          	li	a2,0
    9c84:	14500593          	li	a1,325
    9c88:	00005517          	auipc	a0,0x5
    9c8c:	42450513          	add	a0,a0,1060 # f0ac <__fini_array_end+0x3a0>
    9c90:	13c010ef          	jal	adcc <__assert_func>

00009c94 <__lshift>:
    9c94:	fe010113          	add	sp,sp,-32
    9c98:	01512223          	sw	s5,4(sp)
    9c9c:	0105aa83          	lw	s5,16(a1)
    9ca0:	0085a783          	lw	a5,8(a1)
    9ca4:	01312623          	sw	s3,12(sp)
    9ca8:	40565993          	sra	s3,a2,0x5
    9cac:	01598ab3          	add	s5,s3,s5
    9cb0:	00812c23          	sw	s0,24(sp)
    9cb4:	00912a23          	sw	s1,20(sp)
    9cb8:	01212823          	sw	s2,16(sp)
    9cbc:	01412423          	sw	s4,8(sp)
    9cc0:	00112e23          	sw	ra,28(sp)
    9cc4:	001a8913          	add	s2,s5,1
    9cc8:	00058493          	mv	s1,a1
    9ccc:	00060413          	mv	s0,a2
    9cd0:	0045a583          	lw	a1,4(a1)
    9cd4:	00050a13          	mv	s4,a0
    9cd8:	0127d863          	bge	a5,s2,9ce8 <__lshift+0x54>
    9cdc:	00179793          	sll	a5,a5,0x1
    9ce0:	00158593          	add	a1,a1,1
    9ce4:	ff27cce3          	blt	a5,s2,9cdc <__lshift+0x48>
    9ce8:	000a0513          	mv	a0,s4
    9cec:	f2cff0ef          	jal	9418 <_Balloc>
    9cf0:	10050c63          	beqz	a0,9e08 <__lshift+0x174>
    9cf4:	01450813          	add	a6,a0,20
    9cf8:	03305463          	blez	s3,9d20 <__lshift+0x8c>
    9cfc:	00598993          	add	s3,s3,5
    9d00:	00299993          	sll	s3,s3,0x2
    9d04:	01350733          	add	a4,a0,s3
    9d08:	00080793          	mv	a5,a6
    9d0c:	00478793          	add	a5,a5,4
    9d10:	fe07ae23          	sw	zero,-4(a5)
    9d14:	fee79ce3          	bne	a5,a4,9d0c <__lshift+0x78>
    9d18:	fec98993          	add	s3,s3,-20
    9d1c:	01380833          	add	a6,a6,s3
    9d20:	0104a883          	lw	a7,16(s1)
    9d24:	01448793          	add	a5,s1,20
    9d28:	01f47613          	and	a2,s0,31
    9d2c:	00289893          	sll	a7,a7,0x2
    9d30:	011788b3          	add	a7,a5,a7
    9d34:	0a060463          	beqz	a2,9ddc <__lshift+0x148>
    9d38:	02000593          	li	a1,32
    9d3c:	40c585b3          	sub	a1,a1,a2
    9d40:	00080313          	mv	t1,a6
    9d44:	00000693          	li	a3,0
    9d48:	0007a703          	lw	a4,0(a5)
    9d4c:	00430313          	add	t1,t1,4
    9d50:	00478793          	add	a5,a5,4
    9d54:	00c71733          	sll	a4,a4,a2
    9d58:	00d76733          	or	a4,a4,a3
    9d5c:	fee32e23          	sw	a4,-4(t1)
    9d60:	ffc7a683          	lw	a3,-4(a5)
    9d64:	00b6d6b3          	srl	a3,a3,a1
    9d68:	ff17e0e3          	bltu	a5,a7,9d48 <__lshift+0xb4>
    9d6c:	01548793          	add	a5,s1,21
    9d70:	00400713          	li	a4,4
    9d74:	00f8ea63          	bltu	a7,a5,9d88 <__lshift+0xf4>
    9d78:	409887b3          	sub	a5,a7,s1
    9d7c:	feb78793          	add	a5,a5,-21
    9d80:	ffc7f793          	and	a5,a5,-4
    9d84:	00478713          	add	a4,a5,4
    9d88:	00e80833          	add	a6,a6,a4
    9d8c:	00d82023          	sw	a3,0(a6)
    9d90:	00069463          	bnez	a3,9d98 <__lshift+0x104>
    9d94:	000a8913          	mv	s2,s5
    9d98:	0044a703          	lw	a4,4(s1)
    9d9c:	044a2783          	lw	a5,68(s4)
    9da0:	01c12083          	lw	ra,28(sp)
    9da4:	00271713          	sll	a4,a4,0x2
    9da8:	00e787b3          	add	a5,a5,a4
    9dac:	0007a703          	lw	a4,0(a5)
    9db0:	01252823          	sw	s2,16(a0)
    9db4:	01812403          	lw	s0,24(sp)
    9db8:	00e4a023          	sw	a4,0(s1)
    9dbc:	0097a023          	sw	s1,0(a5)
    9dc0:	01012903          	lw	s2,16(sp)
    9dc4:	01412483          	lw	s1,20(sp)
    9dc8:	00c12983          	lw	s3,12(sp)
    9dcc:	00812a03          	lw	s4,8(sp)
    9dd0:	00412a83          	lw	s5,4(sp)
    9dd4:	02010113          	add	sp,sp,32
    9dd8:	00008067          	ret
    9ddc:	0007a703          	lw	a4,0(a5)
    9de0:	00478793          	add	a5,a5,4
    9de4:	00480813          	add	a6,a6,4
    9de8:	fee82e23          	sw	a4,-4(a6)
    9dec:	fb17f4e3          	bgeu	a5,a7,9d94 <__lshift+0x100>
    9df0:	0007a703          	lw	a4,0(a5)
    9df4:	00478793          	add	a5,a5,4
    9df8:	00480813          	add	a6,a6,4
    9dfc:	fee82e23          	sw	a4,-4(a6)
    9e00:	fd17eee3          	bltu	a5,a7,9ddc <__lshift+0x148>
    9e04:	f91ff06f          	j	9d94 <__lshift+0x100>
    9e08:	00005697          	auipc	a3,0x5
    9e0c:	21068693          	add	a3,a3,528 # f018 <__fini_array_end+0x30c>
    9e10:	00000613          	li	a2,0
    9e14:	1de00593          	li	a1,478
    9e18:	00005517          	auipc	a0,0x5
    9e1c:	29450513          	add	a0,a0,660 # f0ac <__fini_array_end+0x3a0>
    9e20:	7ad000ef          	jal	adcc <__assert_func>

00009e24 <__mcmp>:
    9e24:	01052703          	lw	a4,16(a0)
    9e28:	0105a783          	lw	a5,16(a1)
    9e2c:	00050813          	mv	a6,a0
    9e30:	40f70533          	sub	a0,a4,a5
    9e34:	04f71263          	bne	a4,a5,9e78 <__mcmp+0x54>
    9e38:	00279793          	sll	a5,a5,0x2
    9e3c:	01480813          	add	a6,a6,20
    9e40:	01458593          	add	a1,a1,20
    9e44:	00f80733          	add	a4,a6,a5
    9e48:	00f587b3          	add	a5,a1,a5
    9e4c:	0080006f          	j	9e54 <__mcmp+0x30>
    9e50:	02e87463          	bgeu	a6,a4,9e78 <__mcmp+0x54>
    9e54:	ffc72603          	lw	a2,-4(a4)
    9e58:	ffc7a683          	lw	a3,-4(a5)
    9e5c:	ffc70713          	add	a4,a4,-4
    9e60:	ffc78793          	add	a5,a5,-4
    9e64:	fed606e3          	beq	a2,a3,9e50 <__mcmp+0x2c>
    9e68:	00100513          	li	a0,1
    9e6c:	00d67663          	bgeu	a2,a3,9e78 <__mcmp+0x54>
    9e70:	fff00513          	li	a0,-1
    9e74:	00008067          	ret
    9e78:	00008067          	ret

00009e7c <__mdiff>:
    9e7c:	0105a703          	lw	a4,16(a1)
    9e80:	01062783          	lw	a5,16(a2)
    9e84:	ff010113          	add	sp,sp,-16
    9e88:	00812423          	sw	s0,8(sp)
    9e8c:	00912223          	sw	s1,4(sp)
    9e90:	00112623          	sw	ra,12(sp)
    9e94:	01212023          	sw	s2,0(sp)
    9e98:	00058413          	mv	s0,a1
    9e9c:	00060493          	mv	s1,a2
    9ea0:	40f706b3          	sub	a3,a4,a5
    9ea4:	18f71e63          	bne	a4,a5,a040 <__mdiff+0x1c4>
    9ea8:	00279693          	sll	a3,a5,0x2
    9eac:	01458613          	add	a2,a1,20
    9eb0:	01448713          	add	a4,s1,20
    9eb4:	00d607b3          	add	a5,a2,a3
    9eb8:	00d70733          	add	a4,a4,a3
    9ebc:	0080006f          	j	9ec4 <__mdiff+0x48>
    9ec0:	18f67c63          	bgeu	a2,a5,a058 <__mdiff+0x1dc>
    9ec4:	ffc7a583          	lw	a1,-4(a5)
    9ec8:	ffc72683          	lw	a3,-4(a4)
    9ecc:	ffc78793          	add	a5,a5,-4
    9ed0:	ffc70713          	add	a4,a4,-4
    9ed4:	fed586e3          	beq	a1,a3,9ec0 <__mdiff+0x44>
    9ed8:	00100913          	li	s2,1
    9edc:	00d5ea63          	bltu	a1,a3,9ef0 <__mdiff+0x74>
    9ee0:	00048793          	mv	a5,s1
    9ee4:	00000913          	li	s2,0
    9ee8:	00040493          	mv	s1,s0
    9eec:	00078413          	mv	s0,a5
    9ef0:	0044a583          	lw	a1,4(s1)
    9ef4:	d24ff0ef          	jal	9418 <_Balloc>
    9ef8:	1a050663          	beqz	a0,a0a4 <__mdiff+0x228>
    9efc:	0104a883          	lw	a7,16(s1)
    9f00:	01042283          	lw	t0,16(s0)
    9f04:	01448f93          	add	t6,s1,20
    9f08:	00289313          	sll	t1,a7,0x2
    9f0c:	01440813          	add	a6,s0,20
    9f10:	00229293          	sll	t0,t0,0x2
    9f14:	01450593          	add	a1,a0,20
    9f18:	00010e37          	lui	t3,0x10
    9f1c:	01252623          	sw	s2,12(a0)
    9f20:	006f8333          	add	t1,t6,t1
    9f24:	005802b3          	add	t0,a6,t0
    9f28:	00058f13          	mv	t5,a1
    9f2c:	000f8e93          	mv	t4,t6
    9f30:	00000693          	li	a3,0
    9f34:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    9f38:	000ea703          	lw	a4,0(t4)
    9f3c:	00082603          	lw	a2,0(a6)
    9f40:	004f0f13          	add	t5,t5,4
    9f44:	01c777b3          	and	a5,a4,t3
    9f48:	01c673b3          	and	t2,a2,t3
    9f4c:	407787b3          	sub	a5,a5,t2
    9f50:	00d787b3          	add	a5,a5,a3
    9f54:	01075713          	srl	a4,a4,0x10
    9f58:	01065613          	srl	a2,a2,0x10
    9f5c:	4107d693          	sra	a3,a5,0x10
    9f60:	40c70733          	sub	a4,a4,a2
    9f64:	00d70733          	add	a4,a4,a3
    9f68:	01071693          	sll	a3,a4,0x10
    9f6c:	01c7f7b3          	and	a5,a5,t3
    9f70:	00d7e7b3          	or	a5,a5,a3
    9f74:	00480813          	add	a6,a6,4
    9f78:	feff2e23          	sw	a5,-4(t5)
    9f7c:	004e8e93          	add	t4,t4,4
    9f80:	41075693          	sra	a3,a4,0x10
    9f84:	fa586ae3          	bltu	a6,t0,9f38 <__mdiff+0xbc>
    9f88:	01540713          	add	a4,s0,21
    9f8c:	40828433          	sub	s0,t0,s0
    9f90:	feb40413          	add	s0,s0,-21
    9f94:	00e2b2b3          	sltu	t0,t0,a4
    9f98:	0012cf13          	xor	t5,t0,1
    9f9c:	00245413          	srl	s0,s0,0x2
    9fa0:	00400713          	li	a4,4
    9fa4:	0a028463          	beqz	t0,a04c <__mdiff+0x1d0>
    9fa8:	00ef8fb3          	add	t6,t6,a4
    9fac:	00e58833          	add	a6,a1,a4
    9fb0:	00010eb7          	lui	t4,0x10
    9fb4:	00080e13          	mv	t3,a6
    9fb8:	000f8613          	mv	a2,t6
    9fbc:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    9fc0:	0c6ff463          	bgeu	t6,t1,a088 <__mdiff+0x20c>
    9fc4:	00062783          	lw	a5,0(a2)
    9fc8:	004e0e13          	add	t3,t3,4
    9fcc:	00460613          	add	a2,a2,4
    9fd0:	01d7f733          	and	a4,a5,t4
    9fd4:	00d70733          	add	a4,a4,a3
    9fd8:	0107d593          	srl	a1,a5,0x10
    9fdc:	41075713          	sra	a4,a4,0x10
    9fe0:	00b70733          	add	a4,a4,a1
    9fe4:	00d787b3          	add	a5,a5,a3
    9fe8:	01d7f7b3          	and	a5,a5,t4
    9fec:	01071693          	sll	a3,a4,0x10
    9ff0:	00d7e7b3          	or	a5,a5,a3
    9ff4:	fefe2e23          	sw	a5,-4(t3)
    9ff8:	41075693          	sra	a3,a4,0x10
    9ffc:	fc6664e3          	bltu	a2,t1,9fc4 <__mdiff+0x148>
    a000:	fff30313          	add	t1,t1,-1
    a004:	41f30333          	sub	t1,t1,t6
    a008:	ffc37313          	and	t1,t1,-4
    a00c:	00680733          	add	a4,a6,t1
    a010:	00079a63          	bnez	a5,a024 <__mdiff+0x1a8>
    a014:	ffc72783          	lw	a5,-4(a4)
    a018:	fff88893          	add	a7,a7,-1
    a01c:	ffc70713          	add	a4,a4,-4
    a020:	fe078ae3          	beqz	a5,a014 <__mdiff+0x198>
    a024:	00c12083          	lw	ra,12(sp)
    a028:	00812403          	lw	s0,8(sp)
    a02c:	01152823          	sw	a7,16(a0)
    a030:	00412483          	lw	s1,4(sp)
    a034:	00012903          	lw	s2,0(sp)
    a038:	01010113          	add	sp,sp,16
    a03c:	00008067          	ret
    a040:	00100913          	li	s2,1
    a044:	e806dee3          	bgez	a3,9ee0 <__mdiff+0x64>
    a048:	ea9ff06f          	j	9ef0 <__mdiff+0x74>
    a04c:	00140713          	add	a4,s0,1
    a050:	00271713          	sll	a4,a4,0x2
    a054:	f55ff06f          	j	9fa8 <__mdiff+0x12c>
    a058:	00000593          	li	a1,0
    a05c:	bbcff0ef          	jal	9418 <_Balloc>
    a060:	06050063          	beqz	a0,a0c0 <__mdiff+0x244>
    a064:	00c12083          	lw	ra,12(sp)
    a068:	00812403          	lw	s0,8(sp)
    a06c:	00100793          	li	a5,1
    a070:	00f52823          	sw	a5,16(a0)
    a074:	00052a23          	sw	zero,20(a0)
    a078:	00412483          	lw	s1,4(sp)
    a07c:	00012903          	lw	s2,0(sp)
    a080:	01010113          	add	sp,sp,16
    a084:	00008067          	ret
    a088:	00000713          	li	a4,0
    a08c:	000f1663          	bnez	t5,a098 <__mdiff+0x21c>
    a090:	00e58733          	add	a4,a1,a4
    a094:	f7dff06f          	j	a010 <__mdiff+0x194>
    a098:	00241713          	sll	a4,s0,0x2
    a09c:	00e58733          	add	a4,a1,a4
    a0a0:	f71ff06f          	j	a010 <__mdiff+0x194>
    a0a4:	00005697          	auipc	a3,0x5
    a0a8:	f7468693          	add	a3,a3,-140 # f018 <__fini_array_end+0x30c>
    a0ac:	00000613          	li	a2,0
    a0b0:	24500593          	li	a1,581
    a0b4:	00005517          	auipc	a0,0x5
    a0b8:	ff850513          	add	a0,a0,-8 # f0ac <__fini_array_end+0x3a0>
    a0bc:	511000ef          	jal	adcc <__assert_func>
    a0c0:	00005697          	auipc	a3,0x5
    a0c4:	f5868693          	add	a3,a3,-168 # f018 <__fini_array_end+0x30c>
    a0c8:	00000613          	li	a2,0
    a0cc:	23700593          	li	a1,567
    a0d0:	00005517          	auipc	a0,0x5
    a0d4:	fdc50513          	add	a0,a0,-36 # f0ac <__fini_array_end+0x3a0>
    a0d8:	4f5000ef          	jal	adcc <__assert_func>

0000a0dc <__d2b>:
    a0dc:	fd010113          	add	sp,sp,-48
    a0e0:	01512a23          	sw	s5,20(sp)
    a0e4:	00058a93          	mv	s5,a1
    a0e8:	00100593          	li	a1,1
    a0ec:	02912223          	sw	s1,36(sp)
    a0f0:	01312e23          	sw	s3,28(sp)
    a0f4:	01412c23          	sw	s4,24(sp)
    a0f8:	02112623          	sw	ra,44(sp)
    a0fc:	02812423          	sw	s0,40(sp)
    a100:	03212023          	sw	s2,32(sp)
    a104:	00060493          	mv	s1,a2
    a108:	00068a13          	mv	s4,a3
    a10c:	00070993          	mv	s3,a4
    a110:	b08ff0ef          	jal	9418 <_Balloc>
    a114:	10050263          	beqz	a0,a218 <__d2b+0x13c>
    a118:	00100737          	lui	a4,0x100
    a11c:	0144d913          	srl	s2,s1,0x14
    a120:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a124:	7ff97913          	and	s2,s2,2047
    a128:	00050413          	mv	s0,a0
    a12c:	0097f7b3          	and	a5,a5,s1
    a130:	00090463          	beqz	s2,a138 <__d2b+0x5c>
    a134:	00e7e7b3          	or	a5,a5,a4
    a138:	00f12623          	sw	a5,12(sp)
    a13c:	060a9263          	bnez	s5,a1a0 <__d2b+0xc4>
    a140:	00c10513          	add	a0,sp,12
    a144:	da8ff0ef          	jal	96ec <__lo0bits>
    a148:	00c12703          	lw	a4,12(sp)
    a14c:	00100493          	li	s1,1
    a150:	00942823          	sw	s1,16(s0)
    a154:	00e42a23          	sw	a4,20(s0)
    a158:	02050793          	add	a5,a0,32
    a15c:	08090863          	beqz	s2,a1ec <__d2b+0x110>
    a160:	bcd90913          	add	s2,s2,-1075
    a164:	00f90933          	add	s2,s2,a5
    a168:	03500493          	li	s1,53
    a16c:	012a2023          	sw	s2,0(s4)
    a170:	40f48533          	sub	a0,s1,a5
    a174:	00a9a023          	sw	a0,0(s3)
    a178:	02c12083          	lw	ra,44(sp)
    a17c:	00040513          	mv	a0,s0
    a180:	02812403          	lw	s0,40(sp)
    a184:	02412483          	lw	s1,36(sp)
    a188:	02012903          	lw	s2,32(sp)
    a18c:	01c12983          	lw	s3,28(sp)
    a190:	01812a03          	lw	s4,24(sp)
    a194:	01412a83          	lw	s5,20(sp)
    a198:	03010113          	add	sp,sp,48
    a19c:	00008067          	ret
    a1a0:	00810513          	add	a0,sp,8
    a1a4:	01512423          	sw	s5,8(sp)
    a1a8:	d44ff0ef          	jal	96ec <__lo0bits>
    a1ac:	00c12703          	lw	a4,12(sp)
    a1b0:	00050793          	mv	a5,a0
    a1b4:	04050e63          	beqz	a0,a210 <__d2b+0x134>
    a1b8:	00812603          	lw	a2,8(sp)
    a1bc:	02000693          	li	a3,32
    a1c0:	40a686b3          	sub	a3,a3,a0
    a1c4:	00d716b3          	sll	a3,a4,a3
    a1c8:	00a75733          	srl	a4,a4,a0
    a1cc:	00c6e6b3          	or	a3,a3,a2
    a1d0:	00e12623          	sw	a4,12(sp)
    a1d4:	00e034b3          	snez	s1,a4
    a1d8:	00148493          	add	s1,s1,1
    a1dc:	00d42a23          	sw	a3,20(s0)
    a1e0:	00e42c23          	sw	a4,24(s0)
    a1e4:	00942823          	sw	s1,16(s0)
    a1e8:	f6091ce3          	bnez	s2,a160 <__d2b+0x84>
    a1ec:	00249713          	sll	a4,s1,0x2
    a1f0:	00e40733          	add	a4,s0,a4
    a1f4:	01072503          	lw	a0,16(a4)
    a1f8:	bce78793          	add	a5,a5,-1074
    a1fc:	00fa2023          	sw	a5,0(s4)
    a200:	c74ff0ef          	jal	9674 <__hi0bits>
    a204:	00549493          	sll	s1,s1,0x5
    a208:	40a48533          	sub	a0,s1,a0
    a20c:	f69ff06f          	j	a174 <__d2b+0x98>
    a210:	00812683          	lw	a3,8(sp)
    a214:	fc1ff06f          	j	a1d4 <__d2b+0xf8>
    a218:	00005697          	auipc	a3,0x5
    a21c:	e0068693          	add	a3,a3,-512 # f018 <__fini_array_end+0x30c>
    a220:	00000613          	li	a2,0
    a224:	30f00593          	li	a1,783
    a228:	00005517          	auipc	a0,0x5
    a22c:	e8450513          	add	a0,a0,-380 # f0ac <__fini_array_end+0x3a0>
    a230:	39d000ef          	jal	adcc <__assert_func>

0000a234 <_realloc_r>:
    a234:	fd010113          	add	sp,sp,-48
    a238:	02912223          	sw	s1,36(sp)
    a23c:	02112623          	sw	ra,44(sp)
    a240:	00060493          	mv	s1,a2
    a244:	1e058863          	beqz	a1,a434 <_realloc_r+0x200>
    a248:	02812423          	sw	s0,40(sp)
    a24c:	03212023          	sw	s2,32(sp)
    a250:	00058413          	mv	s0,a1
    a254:	01312e23          	sw	s3,28(sp)
    a258:	01512a23          	sw	s5,20(sp)
    a25c:	01412c23          	sw	s4,24(sp)
    a260:	00050913          	mv	s2,a0
    a264:	b3df70ef          	jal	1da0 <__malloc_lock>
    a268:	ffc42703          	lw	a4,-4(s0)
    a26c:	00b48793          	add	a5,s1,11
    a270:	01600693          	li	a3,22
    a274:	ff840a93          	add	s5,s0,-8
    a278:	ffc77993          	and	s3,a4,-4
    a27c:	10f6f263          	bgeu	a3,a5,a380 <_realloc_r+0x14c>
    a280:	ff87fa13          	and	s4,a5,-8
    a284:	1007c263          	bltz	a5,a388 <_realloc_r+0x154>
    a288:	109a6063          	bltu	s4,s1,a388 <_realloc_r+0x154>
    a28c:	1349d263          	bge	s3,s4,a3b0 <_realloc_r+0x17c>
    a290:	01812423          	sw	s8,8(sp)
    a294:	7fff6c17          	auipc	s8,0x7fff6
    a298:	e8cc0c13          	add	s8,s8,-372 # 80000120 <__malloc_av_>
    a29c:	008c2603          	lw	a2,8(s8)
    a2a0:	013a86b3          	add	a3,s5,s3
    a2a4:	0046a783          	lw	a5,4(a3)
    a2a8:	1cd60863          	beq	a2,a3,a478 <_realloc_r+0x244>
    a2ac:	ffe7f613          	and	a2,a5,-2
    a2b0:	00c68633          	add	a2,a3,a2
    a2b4:	00462603          	lw	a2,4(a2)
    a2b8:	00167613          	and	a2,a2,1
    a2bc:	14061a63          	bnez	a2,a410 <_realloc_r+0x1dc>
    a2c0:	ffc7f793          	and	a5,a5,-4
    a2c4:	00f98633          	add	a2,s3,a5
    a2c8:	0d465863          	bge	a2,s4,a398 <_realloc_r+0x164>
    a2cc:	00177713          	and	a4,a4,1
    a2d0:	02071c63          	bnez	a4,a308 <_realloc_r+0xd4>
    a2d4:	01712623          	sw	s7,12(sp)
    a2d8:	ff842b83          	lw	s7,-8(s0)
    a2dc:	01612823          	sw	s6,16(sp)
    a2e0:	417a8bb3          	sub	s7,s5,s7
    a2e4:	004ba703          	lw	a4,4(s7)
    a2e8:	ffc77713          	and	a4,a4,-4
    a2ec:	00e787b3          	add	a5,a5,a4
    a2f0:	01378b33          	add	s6,a5,s3
    a2f4:	334b5c63          	bge	s6,s4,a62c <_realloc_r+0x3f8>
    a2f8:	00e98b33          	add	s6,s3,a4
    a2fc:	294b5863          	bge	s6,s4,a58c <_realloc_r+0x358>
    a300:	01012b03          	lw	s6,16(sp)
    a304:	00c12b83          	lw	s7,12(sp)
    a308:	00048593          	mv	a1,s1
    a30c:	00090513          	mv	a0,s2
    a310:	ab0f70ef          	jal	15c0 <_malloc_r>
    a314:	00050493          	mv	s1,a0
    a318:	40050863          	beqz	a0,a728 <_realloc_r+0x4f4>
    a31c:	ffc42783          	lw	a5,-4(s0)
    a320:	ff850713          	add	a4,a0,-8
    a324:	ffe7f793          	and	a5,a5,-2
    a328:	00fa87b3          	add	a5,s5,a5
    a32c:	24e78663          	beq	a5,a4,a578 <_realloc_r+0x344>
    a330:	ffc98613          	add	a2,s3,-4
    a334:	02400793          	li	a5,36
    a338:	2ec7e463          	bltu	a5,a2,a620 <_realloc_r+0x3ec>
    a33c:	01300713          	li	a4,19
    a340:	20c76a63          	bltu	a4,a2,a554 <_realloc_r+0x320>
    a344:	00050793          	mv	a5,a0
    a348:	00040713          	mv	a4,s0
    a34c:	00072683          	lw	a3,0(a4)
    a350:	00d7a023          	sw	a3,0(a5)
    a354:	00472683          	lw	a3,4(a4)
    a358:	00d7a223          	sw	a3,4(a5)
    a35c:	00872703          	lw	a4,8(a4)
    a360:	00e7a423          	sw	a4,8(a5)
    a364:	00040593          	mv	a1,s0
    a368:	00090513          	mv	a0,s2
    a36c:	f49f60ef          	jal	12b4 <_free_r>
    a370:	00090513          	mv	a0,s2
    a374:	a39f70ef          	jal	1dac <__malloc_unlock>
    a378:	00812c03          	lw	s8,8(sp)
    a37c:	06c0006f          	j	a3e8 <_realloc_r+0x1b4>
    a380:	01000a13          	li	s4,16
    a384:	f09a74e3          	bgeu	s4,s1,a28c <_realloc_r+0x58>
    a388:	00c00793          	li	a5,12
    a38c:	00f92023          	sw	a5,0(s2)
    a390:	00000493          	li	s1,0
    a394:	0540006f          	j	a3e8 <_realloc_r+0x1b4>
    a398:	00c6a783          	lw	a5,12(a3)
    a39c:	0086a703          	lw	a4,8(a3)
    a3a0:	00812c03          	lw	s8,8(sp)
    a3a4:	00060993          	mv	s3,a2
    a3a8:	00f72623          	sw	a5,12(a4)
    a3ac:	00e7a423          	sw	a4,8(a5)
    a3b0:	004aa783          	lw	a5,4(s5)
    a3b4:	414986b3          	sub	a3,s3,s4
    a3b8:	00f00613          	li	a2,15
    a3bc:	0017f793          	and	a5,a5,1
    a3c0:	013a8733          	add	a4,s5,s3
    a3c4:	08d66263          	bltu	a2,a3,a448 <_realloc_r+0x214>
    a3c8:	0137e7b3          	or	a5,a5,s3
    a3cc:	00faa223          	sw	a5,4(s5)
    a3d0:	00472783          	lw	a5,4(a4)
    a3d4:	0017e793          	or	a5,a5,1
    a3d8:	00f72223          	sw	a5,4(a4)
    a3dc:	00090513          	mv	a0,s2
    a3e0:	9cdf70ef          	jal	1dac <__malloc_unlock>
    a3e4:	00040493          	mv	s1,s0
    a3e8:	02812403          	lw	s0,40(sp)
    a3ec:	02c12083          	lw	ra,44(sp)
    a3f0:	02012903          	lw	s2,32(sp)
    a3f4:	01c12983          	lw	s3,28(sp)
    a3f8:	01812a03          	lw	s4,24(sp)
    a3fc:	01412a83          	lw	s5,20(sp)
    a400:	00048513          	mv	a0,s1
    a404:	02412483          	lw	s1,36(sp)
    a408:	03010113          	add	sp,sp,48
    a40c:	00008067          	ret
    a410:	00177713          	and	a4,a4,1
    a414:	ee071ae3          	bnez	a4,a308 <_realloc_r+0xd4>
    a418:	01712623          	sw	s7,12(sp)
    a41c:	ff842b83          	lw	s7,-8(s0)
    a420:	01612823          	sw	s6,16(sp)
    a424:	417a8bb3          	sub	s7,s5,s7
    a428:	004ba703          	lw	a4,4(s7)
    a42c:	ffc77713          	and	a4,a4,-4
    a430:	ec9ff06f          	j	a2f8 <_realloc_r+0xc4>
    a434:	02c12083          	lw	ra,44(sp)
    a438:	02412483          	lw	s1,36(sp)
    a43c:	00060593          	mv	a1,a2
    a440:	03010113          	add	sp,sp,48
    a444:	97cf706f          	j	15c0 <_malloc_r>
    a448:	0147e7b3          	or	a5,a5,s4
    a44c:	00faa223          	sw	a5,4(s5)
    a450:	014a85b3          	add	a1,s5,s4
    a454:	0016e693          	or	a3,a3,1
    a458:	00d5a223          	sw	a3,4(a1)
    a45c:	00472783          	lw	a5,4(a4)
    a460:	00858593          	add	a1,a1,8
    a464:	00090513          	mv	a0,s2
    a468:	0017e793          	or	a5,a5,1
    a46c:	00f72223          	sw	a5,4(a4)
    a470:	e45f60ef          	jal	12b4 <_free_r>
    a474:	f69ff06f          	j	a3dc <_realloc_r+0x1a8>
    a478:	ffc7f793          	and	a5,a5,-4
    a47c:	013786b3          	add	a3,a5,s3
    a480:	010a0613          	add	a2,s4,16
    a484:	26c6d063          	bge	a3,a2,a6e4 <_realloc_r+0x4b0>
    a488:	00177713          	and	a4,a4,1
    a48c:	e6071ee3          	bnez	a4,a308 <_realloc_r+0xd4>
    a490:	01712623          	sw	s7,12(sp)
    a494:	ff842b83          	lw	s7,-8(s0)
    a498:	01612823          	sw	s6,16(sp)
    a49c:	417a8bb3          	sub	s7,s5,s7
    a4a0:	004ba703          	lw	a4,4(s7)
    a4a4:	ffc77713          	and	a4,a4,-4
    a4a8:	00e787b3          	add	a5,a5,a4
    a4ac:	01378b33          	add	s6,a5,s3
    a4b0:	e4cb44e3          	blt	s6,a2,a2f8 <_realloc_r+0xc4>
    a4b4:	00cba783          	lw	a5,12(s7)
    a4b8:	008ba703          	lw	a4,8(s7)
    a4bc:	ffc98613          	add	a2,s3,-4
    a4c0:	02400693          	li	a3,36
    a4c4:	00f72623          	sw	a5,12(a4)
    a4c8:	00e7a423          	sw	a4,8(a5)
    a4cc:	008b8493          	add	s1,s7,8
    a4d0:	28c6e463          	bltu	a3,a2,a758 <_realloc_r+0x524>
    a4d4:	01300713          	li	a4,19
    a4d8:	00048793          	mv	a5,s1
    a4dc:	02c77263          	bgeu	a4,a2,a500 <_realloc_r+0x2cc>
    a4e0:	00042703          	lw	a4,0(s0)
    a4e4:	01b00793          	li	a5,27
    a4e8:	00eba423          	sw	a4,8(s7)
    a4ec:	00442703          	lw	a4,4(s0)
    a4f0:	00eba623          	sw	a4,12(s7)
    a4f4:	26c7ea63          	bltu	a5,a2,a768 <_realloc_r+0x534>
    a4f8:	00840413          	add	s0,s0,8
    a4fc:	010b8793          	add	a5,s7,16
    a500:	00042703          	lw	a4,0(s0)
    a504:	00e7a023          	sw	a4,0(a5)
    a508:	00442703          	lw	a4,4(s0)
    a50c:	00e7a223          	sw	a4,4(a5)
    a510:	00842703          	lw	a4,8(s0)
    a514:	00e7a423          	sw	a4,8(a5)
    a518:	014b8733          	add	a4,s7,s4
    a51c:	414b07b3          	sub	a5,s6,s4
    a520:	00ec2423          	sw	a4,8(s8)
    a524:	0017e793          	or	a5,a5,1
    a528:	00f72223          	sw	a5,4(a4)
    a52c:	004ba783          	lw	a5,4(s7)
    a530:	00090513          	mv	a0,s2
    a534:	0017f793          	and	a5,a5,1
    a538:	0147e7b3          	or	a5,a5,s4
    a53c:	00fba223          	sw	a5,4(s7)
    a540:	86df70ef          	jal	1dac <__malloc_unlock>
    a544:	01012b03          	lw	s6,16(sp)
    a548:	00c12b83          	lw	s7,12(sp)
    a54c:	00812c03          	lw	s8,8(sp)
    a550:	e99ff06f          	j	a3e8 <_realloc_r+0x1b4>
    a554:	00042683          	lw	a3,0(s0)
    a558:	01b00713          	li	a4,27
    a55c:	00d52023          	sw	a3,0(a0)
    a560:	00442683          	lw	a3,4(s0)
    a564:	00d52223          	sw	a3,4(a0)
    a568:	14c76e63          	bltu	a4,a2,a6c4 <_realloc_r+0x490>
    a56c:	00840713          	add	a4,s0,8
    a570:	00850793          	add	a5,a0,8
    a574:	dd9ff06f          	j	a34c <_realloc_r+0x118>
    a578:	ffc52783          	lw	a5,-4(a0)
    a57c:	00812c03          	lw	s8,8(sp)
    a580:	ffc7f793          	and	a5,a5,-4
    a584:	00f989b3          	add	s3,s3,a5
    a588:	e29ff06f          	j	a3b0 <_realloc_r+0x17c>
    a58c:	00cba783          	lw	a5,12(s7)
    a590:	008ba703          	lw	a4,8(s7)
    a594:	ffc98613          	add	a2,s3,-4
    a598:	02400693          	li	a3,36
    a59c:	00f72623          	sw	a5,12(a4)
    a5a0:	00e7a423          	sw	a4,8(a5)
    a5a4:	008b8493          	add	s1,s7,8
    a5a8:	10c6e663          	bltu	a3,a2,a6b4 <_realloc_r+0x480>
    a5ac:	01300713          	li	a4,19
    a5b0:	00048793          	mv	a5,s1
    a5b4:	02c77c63          	bgeu	a4,a2,a5ec <_realloc_r+0x3b8>
    a5b8:	00042703          	lw	a4,0(s0)
    a5bc:	01b00793          	li	a5,27
    a5c0:	00eba423          	sw	a4,8(s7)
    a5c4:	00442703          	lw	a4,4(s0)
    a5c8:	00eba623          	sw	a4,12(s7)
    a5cc:	14c7f863          	bgeu	a5,a2,a71c <_realloc_r+0x4e8>
    a5d0:	00842783          	lw	a5,8(s0)
    a5d4:	00fba823          	sw	a5,16(s7)
    a5d8:	00c42783          	lw	a5,12(s0)
    a5dc:	00fbaa23          	sw	a5,20(s7)
    a5e0:	0ad60c63          	beq	a2,a3,a698 <_realloc_r+0x464>
    a5e4:	01040413          	add	s0,s0,16
    a5e8:	018b8793          	add	a5,s7,24
    a5ec:	00042703          	lw	a4,0(s0)
    a5f0:	00e7a023          	sw	a4,0(a5)
    a5f4:	00442703          	lw	a4,4(s0)
    a5f8:	00e7a223          	sw	a4,4(a5)
    a5fc:	00842703          	lw	a4,8(s0)
    a600:	00e7a423          	sw	a4,8(a5)
    a604:	000b0993          	mv	s3,s6
    a608:	000b8a93          	mv	s5,s7
    a60c:	01012b03          	lw	s6,16(sp)
    a610:	00c12b83          	lw	s7,12(sp)
    a614:	00812c03          	lw	s8,8(sp)
    a618:	00048413          	mv	s0,s1
    a61c:	d95ff06f          	j	a3b0 <_realloc_r+0x17c>
    a620:	00040593          	mv	a1,s0
    a624:	ae8fd0ef          	jal	790c <memmove>
    a628:	d3dff06f          	j	a364 <_realloc_r+0x130>
    a62c:	00c6a783          	lw	a5,12(a3)
    a630:	0086a703          	lw	a4,8(a3)
    a634:	ffc98613          	add	a2,s3,-4
    a638:	02400693          	li	a3,36
    a63c:	00f72623          	sw	a5,12(a4)
    a640:	00e7a423          	sw	a4,8(a5)
    a644:	008ba703          	lw	a4,8(s7)
    a648:	00cba783          	lw	a5,12(s7)
    a64c:	008b8493          	add	s1,s7,8
    a650:	00f72623          	sw	a5,12(a4)
    a654:	00e7a423          	sw	a4,8(a5)
    a658:	04c6ee63          	bltu	a3,a2,a6b4 <_realloc_r+0x480>
    a65c:	01300713          	li	a4,19
    a660:	00048793          	mv	a5,s1
    a664:	f8c774e3          	bgeu	a4,a2,a5ec <_realloc_r+0x3b8>
    a668:	00042703          	lw	a4,0(s0)
    a66c:	01b00793          	li	a5,27
    a670:	00eba423          	sw	a4,8(s7)
    a674:	00442703          	lw	a4,4(s0)
    a678:	00eba623          	sw	a4,12(s7)
    a67c:	0ac7f063          	bgeu	a5,a2,a71c <_realloc_r+0x4e8>
    a680:	00842703          	lw	a4,8(s0)
    a684:	02400793          	li	a5,36
    a688:	00eba823          	sw	a4,16(s7)
    a68c:	00c42703          	lw	a4,12(s0)
    a690:	00ebaa23          	sw	a4,20(s7)
    a694:	f4f618e3          	bne	a2,a5,a5e4 <_realloc_r+0x3b0>
    a698:	01042703          	lw	a4,16(s0)
    a69c:	020b8793          	add	a5,s7,32
    a6a0:	01840413          	add	s0,s0,24
    a6a4:	00ebac23          	sw	a4,24(s7)
    a6a8:	ffc42703          	lw	a4,-4(s0)
    a6ac:	00ebae23          	sw	a4,28(s7)
    a6b0:	f3dff06f          	j	a5ec <_realloc_r+0x3b8>
    a6b4:	00040593          	mv	a1,s0
    a6b8:	00048513          	mv	a0,s1
    a6bc:	a50fd0ef          	jal	790c <memmove>
    a6c0:	f45ff06f          	j	a604 <_realloc_r+0x3d0>
    a6c4:	00842703          	lw	a4,8(s0)
    a6c8:	00e52423          	sw	a4,8(a0)
    a6cc:	00c42703          	lw	a4,12(s0)
    a6d0:	00e52623          	sw	a4,12(a0)
    a6d4:	06f60463          	beq	a2,a5,a73c <_realloc_r+0x508>
    a6d8:	01040713          	add	a4,s0,16
    a6dc:	01050793          	add	a5,a0,16
    a6e0:	c6dff06f          	j	a34c <_realloc_r+0x118>
    a6e4:	014a8ab3          	add	s5,s5,s4
    a6e8:	414687b3          	sub	a5,a3,s4
    a6ec:	015c2423          	sw	s5,8(s8)
    a6f0:	0017e793          	or	a5,a5,1
    a6f4:	00faa223          	sw	a5,4(s5)
    a6f8:	ffc42783          	lw	a5,-4(s0)
    a6fc:	00090513          	mv	a0,s2
    a700:	00040493          	mv	s1,s0
    a704:	0017f793          	and	a5,a5,1
    a708:	0147e7b3          	or	a5,a5,s4
    a70c:	fef42e23          	sw	a5,-4(s0)
    a710:	e9cf70ef          	jal	1dac <__malloc_unlock>
    a714:	00812c03          	lw	s8,8(sp)
    a718:	cd1ff06f          	j	a3e8 <_realloc_r+0x1b4>
    a71c:	00840413          	add	s0,s0,8
    a720:	010b8793          	add	a5,s7,16
    a724:	ec9ff06f          	j	a5ec <_realloc_r+0x3b8>
    a728:	00090513          	mv	a0,s2
    a72c:	e80f70ef          	jal	1dac <__malloc_unlock>
    a730:	00000493          	li	s1,0
    a734:	00812c03          	lw	s8,8(sp)
    a738:	cb1ff06f          	j	a3e8 <_realloc_r+0x1b4>
    a73c:	01042683          	lw	a3,16(s0)
    a740:	01840713          	add	a4,s0,24
    a744:	01850793          	add	a5,a0,24
    a748:	00d52823          	sw	a3,16(a0)
    a74c:	01442683          	lw	a3,20(s0)
    a750:	00d52a23          	sw	a3,20(a0)
    a754:	bf9ff06f          	j	a34c <_realloc_r+0x118>
    a758:	00040593          	mv	a1,s0
    a75c:	00048513          	mv	a0,s1
    a760:	9acfd0ef          	jal	790c <memmove>
    a764:	db5ff06f          	j	a518 <_realloc_r+0x2e4>
    a768:	00842783          	lw	a5,8(s0)
    a76c:	00fba823          	sw	a5,16(s7)
    a770:	00c42783          	lw	a5,12(s0)
    a774:	00fbaa23          	sw	a5,20(s7)
    a778:	00d60863          	beq	a2,a3,a788 <_realloc_r+0x554>
    a77c:	01040413          	add	s0,s0,16
    a780:	018b8793          	add	a5,s7,24
    a784:	d7dff06f          	j	a500 <_realloc_r+0x2cc>
    a788:	01042703          	lw	a4,16(s0)
    a78c:	020b8793          	add	a5,s7,32
    a790:	01840413          	add	s0,s0,24
    a794:	00ebac23          	sw	a4,24(s7)
    a798:	ffc42703          	lw	a4,-4(s0)
    a79c:	00ebae23          	sw	a4,28(s7)
    a7a0:	d61ff06f          	j	a500 <_realloc_r+0x2cc>

0000a7a4 <__ascii_wctomb>:
    a7a4:	02058463          	beqz	a1,a7cc <__ascii_wctomb+0x28>
    a7a8:	0ff00793          	li	a5,255
    a7ac:	00c7e863          	bltu	a5,a2,a7bc <__ascii_wctomb+0x18>
    a7b0:	00c58023          	sb	a2,0(a1)
    a7b4:	00100513          	li	a0,1
    a7b8:	00008067          	ret
    a7bc:	08a00793          	li	a5,138
    a7c0:	00f52023          	sw	a5,0(a0)
    a7c4:	fff00513          	li	a0,-1
    a7c8:	00008067          	ret
    a7cc:	00000513          	li	a0,0
    a7d0:	00008067          	ret

0000a7d4 <_wcrtomb_r>:
    a7d4:	fe010113          	add	sp,sp,-32
    a7d8:	00812c23          	sw	s0,24(sp)
    a7dc:	00912a23          	sw	s1,20(sp)
    a7e0:	00112e23          	sw	ra,28(sp)
    a7e4:	00050493          	mv	s1,a0
    a7e8:	10450413          	add	s0,a0,260
    a7ec:	00068463          	beqz	a3,a7f4 <_wcrtomb_r+0x20>
    a7f0:	00068413          	mv	s0,a3
    a7f4:	7fff6797          	auipc	a5,0x7fff6
    a7f8:	e207a783          	lw	a5,-480(a5) # 80000614 <__global_locale+0xe0>
    a7fc:	00040693          	mv	a3,s0
    a800:	02058463          	beqz	a1,a828 <_wcrtomb_r+0x54>
    a804:	00048513          	mv	a0,s1
    a808:	000780e7          	jalr	a5
    a80c:	fff00793          	li	a5,-1
    a810:	02f50863          	beq	a0,a5,a840 <_wcrtomb_r+0x6c>
    a814:	01c12083          	lw	ra,28(sp)
    a818:	01812403          	lw	s0,24(sp)
    a81c:	01412483          	lw	s1,20(sp)
    a820:	02010113          	add	sp,sp,32
    a824:	00008067          	ret
    a828:	00000613          	li	a2,0
    a82c:	00410593          	add	a1,sp,4
    a830:	00048513          	mv	a0,s1
    a834:	000780e7          	jalr	a5
    a838:	fff00793          	li	a5,-1
    a83c:	fcf51ce3          	bne	a0,a5,a814 <_wcrtomb_r+0x40>
    a840:	00042023          	sw	zero,0(s0)
    a844:	01c12083          	lw	ra,28(sp)
    a848:	01812403          	lw	s0,24(sp)
    a84c:	08a00793          	li	a5,138
    a850:	00f4a023          	sw	a5,0(s1)
    a854:	01412483          	lw	s1,20(sp)
    a858:	02010113          	add	sp,sp,32
    a85c:	00008067          	ret

0000a860 <_wcsrtombs_r>:
    a860:	00070793          	mv	a5,a4
    a864:	00068713          	mv	a4,a3
    a868:	fff00693          	li	a3,-1
    a86c:	1350006f          	j	b1a0 <_wcsnrtombs_r>

0000a870 <_fclose_r>:
    a870:	ff010113          	add	sp,sp,-16
    a874:	00112623          	sw	ra,12(sp)
    a878:	01212023          	sw	s2,0(sp)
    a87c:	0e058263          	beqz	a1,a960 <_fclose_r+0xf0>
    a880:	00812423          	sw	s0,8(sp)
    a884:	00912223          	sw	s1,4(sp)
    a888:	00058413          	mv	s0,a1
    a88c:	00050493          	mv	s1,a0
    a890:	00050663          	beqz	a0,a89c <_fclose_r+0x2c>
    a894:	03452783          	lw	a5,52(a0)
    a898:	10078063          	beqz	a5,a998 <_fclose_r+0x128>
    a89c:	06442783          	lw	a5,100(s0)
    a8a0:	00c41703          	lh	a4,12(s0)
    a8a4:	0017f793          	and	a5,a5,1
    a8a8:	0a079663          	bnez	a5,a954 <_fclose_r+0xe4>
    a8ac:	20077713          	and	a4,a4,512
    a8b0:	0e070863          	beqz	a4,a9a0 <_fclose_r+0x130>
    a8b4:	00040593          	mv	a1,s0
    a8b8:	00048513          	mv	a0,s1
    a8bc:	c81fb0ef          	jal	653c <__sflush_r>
    a8c0:	02c42783          	lw	a5,44(s0)
    a8c4:	00050913          	mv	s2,a0
    a8c8:	00078a63          	beqz	a5,a8dc <_fclose_r+0x6c>
    a8cc:	01c42583          	lw	a1,28(s0)
    a8d0:	00048513          	mv	a0,s1
    a8d4:	000780e7          	jalr	a5
    a8d8:	0a054063          	bltz	a0,a978 <_fclose_r+0x108>
    a8dc:	00c45783          	lhu	a5,12(s0)
    a8e0:	0807f793          	and	a5,a5,128
    a8e4:	0a079263          	bnez	a5,a988 <_fclose_r+0x118>
    a8e8:	03042583          	lw	a1,48(s0)
    a8ec:	00058c63          	beqz	a1,a904 <_fclose_r+0x94>
    a8f0:	04040793          	add	a5,s0,64
    a8f4:	00f58663          	beq	a1,a5,a900 <_fclose_r+0x90>
    a8f8:	00048513          	mv	a0,s1
    a8fc:	9b9f60ef          	jal	12b4 <_free_r>
    a900:	02042823          	sw	zero,48(s0)
    a904:	04442583          	lw	a1,68(s0)
    a908:	00058863          	beqz	a1,a918 <_fclose_r+0xa8>
    a90c:	00048513          	mv	a0,s1
    a910:	9a5f60ef          	jal	12b4 <_free_r>
    a914:	04042223          	sw	zero,68(s0)
    a918:	9dcfc0ef          	jal	6af4 <__sfp_lock_acquire>
    a91c:	06442783          	lw	a5,100(s0)
    a920:	00041623          	sh	zero,12(s0)
    a924:	0017f793          	and	a5,a5,1
    a928:	0a078663          	beqz	a5,a9d4 <_fclose_r+0x164>
    a92c:	05842503          	lw	a0,88(s0)
    a930:	d28f60ef          	jal	e58 <__retarget_lock_close_recursive>
    a934:	9ccfc0ef          	jal	6b00 <__sfp_lock_release>
    a938:	00c12083          	lw	ra,12(sp)
    a93c:	00812403          	lw	s0,8(sp)
    a940:	00412483          	lw	s1,4(sp)
    a944:	00090513          	mv	a0,s2
    a948:	00012903          	lw	s2,0(sp)
    a94c:	01010113          	add	sp,sp,16
    a950:	00008067          	ret
    a954:	f60710e3          	bnez	a4,a8b4 <_fclose_r+0x44>
    a958:	00812403          	lw	s0,8(sp)
    a95c:	00412483          	lw	s1,4(sp)
    a960:	00000913          	li	s2,0
    a964:	00c12083          	lw	ra,12(sp)
    a968:	00090513          	mv	a0,s2
    a96c:	00012903          	lw	s2,0(sp)
    a970:	01010113          	add	sp,sp,16
    a974:	00008067          	ret
    a978:	00c45783          	lhu	a5,12(s0)
    a97c:	fff00913          	li	s2,-1
    a980:	0807f793          	and	a5,a5,128
    a984:	f60782e3          	beqz	a5,a8e8 <_fclose_r+0x78>
    a988:	01042583          	lw	a1,16(s0)
    a98c:	00048513          	mv	a0,s1
    a990:	925f60ef          	jal	12b4 <_free_r>
    a994:	f55ff06f          	j	a8e8 <_fclose_r+0x78>
    a998:	8ecfc0ef          	jal	6a84 <__sinit>
    a99c:	f01ff06f          	j	a89c <_fclose_r+0x2c>
    a9a0:	05842503          	lw	a0,88(s0)
    a9a4:	cb8f60ef          	jal	e5c <__retarget_lock_acquire_recursive>
    a9a8:	00c41783          	lh	a5,12(s0)
    a9ac:	f00794e3          	bnez	a5,a8b4 <_fclose_r+0x44>
    a9b0:	06442783          	lw	a5,100(s0)
    a9b4:	0017f793          	and	a5,a5,1
    a9b8:	fa0790e3          	bnez	a5,a958 <_fclose_r+0xe8>
    a9bc:	05842503          	lw	a0,88(s0)
    a9c0:	00000913          	li	s2,0
    a9c4:	c9cf60ef          	jal	e60 <__retarget_lock_release_recursive>
    a9c8:	00812403          	lw	s0,8(sp)
    a9cc:	00412483          	lw	s1,4(sp)
    a9d0:	f95ff06f          	j	a964 <_fclose_r+0xf4>
    a9d4:	05842503          	lw	a0,88(s0)
    a9d8:	c88f60ef          	jal	e60 <__retarget_lock_release_recursive>
    a9dc:	f51ff06f          	j	a92c <_fclose_r+0xbc>

0000a9e0 <__smakebuf_r>:
    a9e0:	00c59783          	lh	a5,12(a1)
    a9e4:	f8010113          	add	sp,sp,-128
    a9e8:	06812c23          	sw	s0,120(sp)
    a9ec:	06112e23          	sw	ra,124(sp)
    a9f0:	0027f713          	and	a4,a5,2
    a9f4:	00058413          	mv	s0,a1
    a9f8:	02070463          	beqz	a4,aa20 <__smakebuf_r+0x40>
    a9fc:	04358793          	add	a5,a1,67
    aa00:	00f5a023          	sw	a5,0(a1)
    aa04:	00f5a823          	sw	a5,16(a1)
    aa08:	00100793          	li	a5,1
    aa0c:	00f5aa23          	sw	a5,20(a1)
    aa10:	07c12083          	lw	ra,124(sp)
    aa14:	07812403          	lw	s0,120(sp)
    aa18:	08010113          	add	sp,sp,128
    aa1c:	00008067          	ret
    aa20:	00e59583          	lh	a1,14(a1)
    aa24:	06912a23          	sw	s1,116(sp)
    aa28:	07212823          	sw	s2,112(sp)
    aa2c:	07312623          	sw	s3,108(sp)
    aa30:	07412423          	sw	s4,104(sp)
    aa34:	00050493          	mv	s1,a0
    aa38:	0805c663          	bltz	a1,aac4 <__smakebuf_r+0xe4>
    aa3c:	00810613          	add	a2,sp,8
    aa40:	2c8000ef          	jal	ad08 <_fstat_r>
    aa44:	06054e63          	bltz	a0,aac0 <__smakebuf_r+0xe0>
    aa48:	00c12783          	lw	a5,12(sp)
    aa4c:	0000f937          	lui	s2,0xf
    aa50:	000019b7          	lui	s3,0x1
    aa54:	00f97933          	and	s2,s2,a5
    aa58:	ffffe7b7          	lui	a5,0xffffe
    aa5c:	00f90933          	add	s2,s2,a5
    aa60:	00193913          	seqz	s2,s2
    aa64:	40000a13          	li	s4,1024
    aa68:	80098993          	add	s3,s3,-2048 # 800 <main+0x530>
    aa6c:	000a0593          	mv	a1,s4
    aa70:	00048513          	mv	a0,s1
    aa74:	b4df60ef          	jal	15c0 <_malloc_r>
    aa78:	00c41783          	lh	a5,12(s0)
    aa7c:	06050863          	beqz	a0,aaec <__smakebuf_r+0x10c>
    aa80:	0807e793          	or	a5,a5,128
    aa84:	00a42023          	sw	a0,0(s0)
    aa88:	00a42823          	sw	a0,16(s0)
    aa8c:	00f41623          	sh	a5,12(s0)
    aa90:	01442a23          	sw	s4,20(s0)
    aa94:	0a091063          	bnez	s2,ab34 <__smakebuf_r+0x154>
    aa98:	0137e7b3          	or	a5,a5,s3
    aa9c:	07c12083          	lw	ra,124(sp)
    aaa0:	00f41623          	sh	a5,12(s0)
    aaa4:	07812403          	lw	s0,120(sp)
    aaa8:	07412483          	lw	s1,116(sp)
    aaac:	07012903          	lw	s2,112(sp)
    aab0:	06c12983          	lw	s3,108(sp)
    aab4:	06812a03          	lw	s4,104(sp)
    aab8:	08010113          	add	sp,sp,128
    aabc:	00008067          	ret
    aac0:	00c41783          	lh	a5,12(s0)
    aac4:	0807f793          	and	a5,a5,128
    aac8:	00000913          	li	s2,0
    aacc:	04078e63          	beqz	a5,ab28 <__smakebuf_r+0x148>
    aad0:	04000a13          	li	s4,64
    aad4:	000a0593          	mv	a1,s4
    aad8:	00048513          	mv	a0,s1
    aadc:	ae5f60ef          	jal	15c0 <_malloc_r>
    aae0:	00c41783          	lh	a5,12(s0)
    aae4:	00000993          	li	s3,0
    aae8:	f8051ce3          	bnez	a0,aa80 <__smakebuf_r+0xa0>
    aaec:	2007f713          	and	a4,a5,512
    aaf0:	04071e63          	bnez	a4,ab4c <__smakebuf_r+0x16c>
    aaf4:	ffc7f793          	and	a5,a5,-4
    aaf8:	0027e793          	or	a5,a5,2
    aafc:	04340713          	add	a4,s0,67
    ab00:	00f41623          	sh	a5,12(s0)
    ab04:	00100793          	li	a5,1
    ab08:	07412483          	lw	s1,116(sp)
    ab0c:	07012903          	lw	s2,112(sp)
    ab10:	06c12983          	lw	s3,108(sp)
    ab14:	06812a03          	lw	s4,104(sp)
    ab18:	00e42023          	sw	a4,0(s0)
    ab1c:	00e42823          	sw	a4,16(s0)
    ab20:	00f42a23          	sw	a5,20(s0)
    ab24:	eedff06f          	j	aa10 <__smakebuf_r+0x30>
    ab28:	40000a13          	li	s4,1024
    ab2c:	00000993          	li	s3,0
    ab30:	f3dff06f          	j	aa6c <__smakebuf_r+0x8c>
    ab34:	00e41583          	lh	a1,14(s0)
    ab38:	00048513          	mv	a0,s1
    ab3c:	22c000ef          	jal	ad68 <_isatty_r>
    ab40:	02051063          	bnez	a0,ab60 <__smakebuf_r+0x180>
    ab44:	00c41783          	lh	a5,12(s0)
    ab48:	f51ff06f          	j	aa98 <__smakebuf_r+0xb8>
    ab4c:	07412483          	lw	s1,116(sp)
    ab50:	07012903          	lw	s2,112(sp)
    ab54:	06c12983          	lw	s3,108(sp)
    ab58:	06812a03          	lw	s4,104(sp)
    ab5c:	eb5ff06f          	j	aa10 <__smakebuf_r+0x30>
    ab60:	00c45783          	lhu	a5,12(s0)
    ab64:	ffc7f793          	and	a5,a5,-4
    ab68:	0017e793          	or	a5,a5,1
    ab6c:	01079793          	sll	a5,a5,0x10
    ab70:	4107d793          	sra	a5,a5,0x10
    ab74:	f25ff06f          	j	aa98 <__smakebuf_r+0xb8>

0000ab78 <__swbuf_r>:
    ab78:	fe010113          	add	sp,sp,-32
    ab7c:	00812c23          	sw	s0,24(sp)
    ab80:	00912a23          	sw	s1,20(sp)
    ab84:	01212823          	sw	s2,16(sp)
    ab88:	00112e23          	sw	ra,28(sp)
    ab8c:	00050913          	mv	s2,a0
    ab90:	00058493          	mv	s1,a1
    ab94:	00060413          	mv	s0,a2
    ab98:	00050663          	beqz	a0,aba4 <__swbuf_r+0x2c>
    ab9c:	03452783          	lw	a5,52(a0)
    aba0:	16078063          	beqz	a5,ad00 <__swbuf_r+0x188>
    aba4:	01842783          	lw	a5,24(s0)
    aba8:	00c41703          	lh	a4,12(s0)
    abac:	00f42423          	sw	a5,8(s0)
    abb0:	00877793          	and	a5,a4,8
    abb4:	08078063          	beqz	a5,ac34 <__swbuf_r+0xbc>
    abb8:	01042783          	lw	a5,16(s0)
    abbc:	06078c63          	beqz	a5,ac34 <__swbuf_r+0xbc>
    abc0:	01312623          	sw	s3,12(sp)
    abc4:	01271693          	sll	a3,a4,0x12
    abc8:	0ff4f993          	zext.b	s3,s1
    abcc:	0ff4f493          	zext.b	s1,s1
    abd0:	0806d863          	bgez	a3,ac60 <__swbuf_r+0xe8>
    abd4:	00042703          	lw	a4,0(s0)
    abd8:	01442683          	lw	a3,20(s0)
    abdc:	40f707b3          	sub	a5,a4,a5
    abe0:	0ad7d863          	bge	a5,a3,ac90 <__swbuf_r+0x118>
    abe4:	00842683          	lw	a3,8(s0)
    abe8:	00170613          	add	a2,a4,1
    abec:	00c42023          	sw	a2,0(s0)
    abf0:	fff68693          	add	a3,a3,-1
    abf4:	00d42423          	sw	a3,8(s0)
    abf8:	01370023          	sb	s3,0(a4)
    abfc:	01442703          	lw	a4,20(s0)
    ac00:	00178793          	add	a5,a5,1 # ffffe001 <__crt0_ram_last+0x7ff7e002>
    ac04:	0cf70263          	beq	a4,a5,acc8 <__swbuf_r+0x150>
    ac08:	00c45783          	lhu	a5,12(s0)
    ac0c:	0017f793          	and	a5,a5,1
    ac10:	0c079a63          	bnez	a5,ace4 <__swbuf_r+0x16c>
    ac14:	00c12983          	lw	s3,12(sp)
    ac18:	01c12083          	lw	ra,28(sp)
    ac1c:	01812403          	lw	s0,24(sp)
    ac20:	01012903          	lw	s2,16(sp)
    ac24:	00048513          	mv	a0,s1
    ac28:	01412483          	lw	s1,20(sp)
    ac2c:	02010113          	add	sp,sp,32
    ac30:	00008067          	ret
    ac34:	00040593          	mv	a1,s0
    ac38:	00090513          	mv	a0,s2
    ac3c:	dfcfc0ef          	jal	7238 <__swsetup_r>
    ac40:	08051e63          	bnez	a0,acdc <__swbuf_r+0x164>
    ac44:	00c41703          	lh	a4,12(s0)
    ac48:	01312623          	sw	s3,12(sp)
    ac4c:	01042783          	lw	a5,16(s0)
    ac50:	01271693          	sll	a3,a4,0x12
    ac54:	0ff4f993          	zext.b	s3,s1
    ac58:	0ff4f493          	zext.b	s1,s1
    ac5c:	f606cce3          	bltz	a3,abd4 <__swbuf_r+0x5c>
    ac60:	06442683          	lw	a3,100(s0)
    ac64:	ffffe637          	lui	a2,0xffffe
    ac68:	000025b7          	lui	a1,0x2
    ac6c:	00b76733          	or	a4,a4,a1
    ac70:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    ac74:	00c6f6b3          	and	a3,a3,a2
    ac78:	00e41623          	sh	a4,12(s0)
    ac7c:	00042703          	lw	a4,0(s0)
    ac80:	06d42223          	sw	a3,100(s0)
    ac84:	01442683          	lw	a3,20(s0)
    ac88:	40f707b3          	sub	a5,a4,a5
    ac8c:	f4d7cce3          	blt	a5,a3,abe4 <__swbuf_r+0x6c>
    ac90:	00040593          	mv	a1,s0
    ac94:	00090513          	mv	a0,s2
    ac98:	af1fb0ef          	jal	6788 <_fflush_r>
    ac9c:	02051e63          	bnez	a0,acd8 <__swbuf_r+0x160>
    aca0:	00042703          	lw	a4,0(s0)
    aca4:	00842683          	lw	a3,8(s0)
    aca8:	00100793          	li	a5,1
    acac:	00170613          	add	a2,a4,1
    acb0:	fff68693          	add	a3,a3,-1
    acb4:	00c42023          	sw	a2,0(s0)
    acb8:	00d42423          	sw	a3,8(s0)
    acbc:	01370023          	sb	s3,0(a4)
    acc0:	01442703          	lw	a4,20(s0)
    acc4:	f4f712e3          	bne	a4,a5,ac08 <__swbuf_r+0x90>
    acc8:	00040593          	mv	a1,s0
    accc:	00090513          	mv	a0,s2
    acd0:	ab9fb0ef          	jal	6788 <_fflush_r>
    acd4:	f40500e3          	beqz	a0,ac14 <__swbuf_r+0x9c>
    acd8:	00c12983          	lw	s3,12(sp)
    acdc:	fff00493          	li	s1,-1
    ace0:	f39ff06f          	j	ac18 <__swbuf_r+0xa0>
    ace4:	00a00793          	li	a5,10
    ace8:	f2f496e3          	bne	s1,a5,ac14 <__swbuf_r+0x9c>
    acec:	00040593          	mv	a1,s0
    acf0:	00090513          	mv	a0,s2
    acf4:	a95fb0ef          	jal	6788 <_fflush_r>
    acf8:	f0050ee3          	beqz	a0,ac14 <__swbuf_r+0x9c>
    acfc:	fddff06f          	j	acd8 <__swbuf_r+0x160>
    ad00:	d85fb0ef          	jal	6a84 <__sinit>
    ad04:	ea1ff06f          	j	aba4 <__swbuf_r+0x2c>

0000ad08 <_fstat_r>:
    ad08:	ff010113          	add	sp,sp,-16
    ad0c:	00058713          	mv	a4,a1
    ad10:	00812423          	sw	s0,8(sp)
    ad14:	00060593          	mv	a1,a2
    ad18:	00050413          	mv	s0,a0
    ad1c:	00070513          	mv	a0,a4
    ad20:	7fff6797          	auipc	a5,0x7fff6
    ad24:	9e07ac23          	sw	zero,-1544(a5) # 80000718 <errno>
    ad28:	00112623          	sw	ra,12(sp)
    ad2c:	d29f50ef          	jal	a54 <_fstat>
    ad30:	fff00793          	li	a5,-1
    ad34:	00f50a63          	beq	a0,a5,ad48 <_fstat_r+0x40>
    ad38:	00c12083          	lw	ra,12(sp)
    ad3c:	00812403          	lw	s0,8(sp)
    ad40:	01010113          	add	sp,sp,16
    ad44:	00008067          	ret
    ad48:	7fff6797          	auipc	a5,0x7fff6
    ad4c:	9d07a783          	lw	a5,-1584(a5) # 80000718 <errno>
    ad50:	fe0784e3          	beqz	a5,ad38 <_fstat_r+0x30>
    ad54:	00c12083          	lw	ra,12(sp)
    ad58:	00f42023          	sw	a5,0(s0)
    ad5c:	00812403          	lw	s0,8(sp)
    ad60:	01010113          	add	sp,sp,16
    ad64:	00008067          	ret

0000ad68 <_isatty_r>:
    ad68:	ff010113          	add	sp,sp,-16
    ad6c:	00812423          	sw	s0,8(sp)
    ad70:	00050413          	mv	s0,a0
    ad74:	00058513          	mv	a0,a1
    ad78:	7fff6797          	auipc	a5,0x7fff6
    ad7c:	9a07a023          	sw	zero,-1632(a5) # 80000718 <errno>
    ad80:	00112623          	sw	ra,12(sp)
    ad84:	ce9f50ef          	jal	a6c <_isatty>
    ad88:	fff00793          	li	a5,-1
    ad8c:	00f50a63          	beq	a0,a5,ada0 <_isatty_r+0x38>
    ad90:	00c12083          	lw	ra,12(sp)
    ad94:	00812403          	lw	s0,8(sp)
    ad98:	01010113          	add	sp,sp,16
    ad9c:	00008067          	ret
    ada0:	7fff6797          	auipc	a5,0x7fff6
    ada4:	9787a783          	lw	a5,-1672(a5) # 80000718 <errno>
    ada8:	fe0784e3          	beqz	a5,ad90 <_isatty_r+0x28>
    adac:	00c12083          	lw	ra,12(sp)
    adb0:	00f42023          	sw	a5,0(s0)
    adb4:	00812403          	lw	s0,8(sp)
    adb8:	01010113          	add	sp,sp,16
    adbc:	00008067          	ret

0000adc0 <__errno>:
    adc0:	7fff6517          	auipc	a0,0x7fff6
    adc4:	94852503          	lw	a0,-1720(a0) # 80000708 <_impure_ptr>
    adc8:	00008067          	ret

0000adcc <__assert_func>:
    adcc:	ff010113          	add	sp,sp,-16
    add0:	00068793          	mv	a5,a3
    add4:	7fff6717          	auipc	a4,0x7fff6
    add8:	93472703          	lw	a4,-1740(a4) # 80000708 <_impure_ptr>
    addc:	00060813          	mv	a6,a2
    ade0:	00112623          	sw	ra,12(sp)
    ade4:	00c72883          	lw	a7,12(a4)
    ade8:	00078613          	mv	a2,a5
    adec:	00050693          	mv	a3,a0
    adf0:	00058713          	mv	a4,a1
    adf4:	00004797          	auipc	a5,0x4
    adf8:	33878793          	add	a5,a5,824 # f12c <__fini_array_end+0x420>
    adfc:	00080c63          	beqz	a6,ae14 <__assert_func+0x48>
    ae00:	00004597          	auipc	a1,0x4
    ae04:	33c58593          	add	a1,a1,828 # f13c <__fini_array_end+0x430>
    ae08:	00088513          	mv	a0,a7
    ae0c:	3a8000ef          	jal	b1b4 <fiprintf>
    ae10:	3f0000ef          	jal	b200 <abort>
    ae14:	00004797          	auipc	a5,0x4
    ae18:	0f078793          	add	a5,a5,240 # ef04 <__fini_array_end+0x1f8>
    ae1c:	00078813          	mv	a6,a5
    ae20:	fe1ff06f          	j	ae00 <__assert_func+0x34>

0000ae24 <_calloc_r>:
    ae24:	fe010113          	add	sp,sp,-32
    ae28:	00812c23          	sw	s0,24(sp)
    ae2c:	00112e23          	sw	ra,28(sp)
    ae30:	0105d693          	srl	a3,a1,0x10
    ae34:	00058793          	mv	a5,a1
    ae38:	00050413          	mv	s0,a0
    ae3c:	01065713          	srl	a4,a2,0x10
    ae40:	0c069063          	bnez	a3,af00 <_calloc_r+0xdc>
    ae44:	14071a63          	bnez	a4,af98 <_calloc_r+0x174>
    ae48:	01061593          	sll	a1,a2,0x10
    ae4c:	01079513          	sll	a0,a5,0x10
    ae50:	0105d593          	srl	a1,a1,0x10
    ae54:	01055513          	srl	a0,a0,0x10
    ae58:	4bd030ef          	jal	eb14 <__mulsi3>
    ae5c:	00050593          	mv	a1,a0
    ae60:	00040513          	mv	a0,s0
    ae64:	f5cf60ef          	jal	15c0 <_malloc_r>
    ae68:	00050413          	mv	s0,a0
    ae6c:	10050a63          	beqz	a0,af80 <_calloc_r+0x15c>
    ae70:	ffc52603          	lw	a2,-4(a0)
    ae74:	02400713          	li	a4,36
    ae78:	ffc67613          	and	a2,a2,-4
    ae7c:	ffc60613          	add	a2,a2,-4
    ae80:	04c76863          	bltu	a4,a2,aed0 <_calloc_r+0xac>
    ae84:	01300693          	li	a3,19
    ae88:	00050793          	mv	a5,a0
    ae8c:	02c6f263          	bgeu	a3,a2,aeb0 <_calloc_r+0x8c>
    ae90:	00052023          	sw	zero,0(a0)
    ae94:	00052223          	sw	zero,4(a0)
    ae98:	01b00793          	li	a5,27
    ae9c:	04c7f863          	bgeu	a5,a2,aeec <_calloc_r+0xc8>
    aea0:	00052423          	sw	zero,8(a0)
    aea4:	00052623          	sw	zero,12(a0)
    aea8:	01050793          	add	a5,a0,16
    aeac:	10e60263          	beq	a2,a4,afb0 <_calloc_r+0x18c>
    aeb0:	0007a023          	sw	zero,0(a5)
    aeb4:	0007a223          	sw	zero,4(a5)
    aeb8:	0007a423          	sw	zero,8(a5)
    aebc:	01c12083          	lw	ra,28(sp)
    aec0:	00040513          	mv	a0,s0
    aec4:	01812403          	lw	s0,24(sp)
    aec8:	02010113          	add	sp,sp,32
    aecc:	00008067          	ret
    aed0:	00000593          	li	a1,0
    aed4:	f91f50ef          	jal	e64 <memset>
    aed8:	01c12083          	lw	ra,28(sp)
    aedc:	00040513          	mv	a0,s0
    aee0:	01812403          	lw	s0,24(sp)
    aee4:	02010113          	add	sp,sp,32
    aee8:	00008067          	ret
    aeec:	00850793          	add	a5,a0,8
    aef0:	0007a023          	sw	zero,0(a5)
    aef4:	0007a223          	sw	zero,4(a5)
    aef8:	0007a423          	sw	zero,8(a5)
    aefc:	fc1ff06f          	j	aebc <_calloc_r+0x98>
    af00:	0c071663          	bnez	a4,afcc <_calloc_r+0x1a8>
    af04:	01212823          	sw	s2,16(sp)
    af08:	01312623          	sw	s3,12(sp)
    af0c:	00912a23          	sw	s1,20(sp)
    af10:	00068913          	mv	s2,a3
    af14:	00060993          	mv	s3,a2
    af18:	01079513          	sll	a0,a5,0x10
    af1c:	01061593          	sll	a1,a2,0x10
    af20:	0105d593          	srl	a1,a1,0x10
    af24:	01055513          	srl	a0,a0,0x10
    af28:	3ed030ef          	jal	eb14 <__mulsi3>
    af2c:	00050493          	mv	s1,a0
    af30:	01091593          	sll	a1,s2,0x10
    af34:	01099513          	sll	a0,s3,0x10
    af38:	0105d593          	srl	a1,a1,0x10
    af3c:	01055513          	srl	a0,a0,0x10
    af40:	3d5030ef          	jal	eb14 <__mulsi3>
    af44:	0104d793          	srl	a5,s1,0x10
    af48:	00f505b3          	add	a1,a0,a5
    af4c:	0105d793          	srl	a5,a1,0x10
    af50:	06079863          	bnez	a5,afc0 <_calloc_r+0x19c>
    af54:	01049493          	sll	s1,s1,0x10
    af58:	0104d493          	srl	s1,s1,0x10
    af5c:	01059593          	sll	a1,a1,0x10
    af60:	0095e5b3          	or	a1,a1,s1
    af64:	00040513          	mv	a0,s0
    af68:	01412483          	lw	s1,20(sp)
    af6c:	01012903          	lw	s2,16(sp)
    af70:	00c12983          	lw	s3,12(sp)
    af74:	e4cf60ef          	jal	15c0 <_malloc_r>
    af78:	00050413          	mv	s0,a0
    af7c:	ee051ae3          	bnez	a0,ae70 <_calloc_r+0x4c>
    af80:	00000413          	li	s0,0
    af84:	01c12083          	lw	ra,28(sp)
    af88:	00040513          	mv	a0,s0
    af8c:	01812403          	lw	s0,24(sp)
    af90:	02010113          	add	sp,sp,32
    af94:	00008067          	ret
    af98:	01212823          	sw	s2,16(sp)
    af9c:	01312623          	sw	s3,12(sp)
    afa0:	00912a23          	sw	s1,20(sp)
    afa4:	00070913          	mv	s2,a4
    afa8:	00058993          	mv	s3,a1
    afac:	f6dff06f          	j	af18 <_calloc_r+0xf4>
    afb0:	00052823          	sw	zero,16(a0)
    afb4:	01850793          	add	a5,a0,24
    afb8:	00052a23          	sw	zero,20(a0)
    afbc:	ef5ff06f          	j	aeb0 <_calloc_r+0x8c>
    afc0:	01412483          	lw	s1,20(sp)
    afc4:	01012903          	lw	s2,16(sp)
    afc8:	00c12983          	lw	s3,12(sp)
    afcc:	df5ff0ef          	jal	adc0 <__errno>
    afd0:	00c00793          	li	a5,12
    afd4:	00f52023          	sw	a5,0(a0)
    afd8:	00000413          	li	s0,0
    afdc:	fa9ff06f          	j	af84 <_calloc_r+0x160>

0000afe0 <_wcsnrtombs_l>:
    afe0:	fa010113          	add	sp,sp,-96
    afe4:	04912a23          	sw	s1,84(sp)
    afe8:	05212823          	sw	s2,80(sp)
    afec:	05312623          	sw	s3,76(sp)
    aff0:	05412423          	sw	s4,72(sp)
    aff4:	05512223          	sw	s5,68(sp)
    aff8:	04112e23          	sw	ra,92(sp)
    affc:	03912a23          	sw	s9,52(sp)
    b000:	03a12823          	sw	s10,48(sp)
    b004:	00a12623          	sw	a0,12(sp)
    b008:	00058a13          	mv	s4,a1
    b00c:	00060a93          	mv	s5,a2
    b010:	00070913          	mv	s2,a4
    b014:	00080993          	mv	s3,a6
    b018:	00078493          	mv	s1,a5
    b01c:	12078063          	beqz	a5,b13c <_wcsnrtombs_l+0x15c>
    b020:	000aac83          	lw	s9,0(s5)
    b024:	120a0263          	beqz	s4,b148 <_wcsnrtombs_l+0x168>
    b028:	14090e63          	beqz	s2,b184 <_wcsnrtombs_l+0x1a4>
    b02c:	05612023          	sw	s6,64(sp)
    b030:	fff68b13          	add	s6,a3,-1
    b034:	16068063          	beqz	a3,b194 <_wcsnrtombs_l+0x1b4>
    b038:	04812c23          	sw	s0,88(sp)
    b03c:	03b12623          	sw	s11,44(sp)
    b040:	03712e23          	sw	s7,60(sp)
    b044:	03812c23          	sw	s8,56(sp)
    b048:	000a0413          	mv	s0,s4
    b04c:	00000d13          	li	s10,0
    b050:	fff00d93          	li	s11,-1
    b054:	0240006f          	j	b078 <_wcsnrtombs_l+0x98>
    b058:	080a1a63          	bnez	s4,b0ec <_wcsnrtombs_l+0x10c>
    b05c:	000ca783          	lw	a5,0(s9)
    b060:	004c8c93          	add	s9,s9,4
    b064:	0c078263          	beqz	a5,b128 <_wcsnrtombs_l+0x148>
    b068:	1326f263          	bgeu	a3,s2,b18c <_wcsnrtombs_l+0x1ac>
    b06c:	fffb0b13          	add	s6,s6,-1
    b070:	00068d13          	mv	s10,a3
    b074:	03bb0c63          	beq	s6,s11,b0ac <_wcsnrtombs_l+0xcc>
    b078:	0e09a783          	lw	a5,224(s3)
    b07c:	000ca603          	lw	a2,0(s9)
    b080:	00c12503          	lw	a0,12(sp)
    b084:	00048693          	mv	a3,s1
    b088:	01410593          	add	a1,sp,20
    b08c:	0004ac03          	lw	s8,0(s1)
    b090:	0044ab83          	lw	s7,4(s1)
    b094:	000780e7          	jalr	a5
    b098:	0bb50e63          	beq	a0,s11,b154 <_wcsnrtombs_l+0x174>
    b09c:	01a506b3          	add	a3,a0,s10
    b0a0:	fad97ce3          	bgeu	s2,a3,b058 <_wcsnrtombs_l+0x78>
    b0a4:	0184a023          	sw	s8,0(s1)
    b0a8:	0174a223          	sw	s7,4(s1)
    b0ac:	05812403          	lw	s0,88(sp)
    b0b0:	04012b03          	lw	s6,64(sp)
    b0b4:	03c12b83          	lw	s7,60(sp)
    b0b8:	03812c03          	lw	s8,56(sp)
    b0bc:	02c12d83          	lw	s11,44(sp)
    b0c0:	05c12083          	lw	ra,92(sp)
    b0c4:	05412483          	lw	s1,84(sp)
    b0c8:	05012903          	lw	s2,80(sp)
    b0cc:	04c12983          	lw	s3,76(sp)
    b0d0:	04812a03          	lw	s4,72(sp)
    b0d4:	04412a83          	lw	s5,68(sp)
    b0d8:	03412c83          	lw	s9,52(sp)
    b0dc:	000d0513          	mv	a0,s10
    b0e0:	03012d03          	lw	s10,48(sp)
    b0e4:	06010113          	add	sp,sp,96
    b0e8:	00008067          	ret
    b0ec:	08a05063          	blez	a0,b16c <_wcsnrtombs_l+0x18c>
    b0f0:	01410893          	add	a7,sp,20
    b0f4:	00a40533          	add	a0,s0,a0
    b0f8:	0008c783          	lbu	a5,0(a7)
    b0fc:	00140413          	add	s0,s0,1
    b100:	00188893          	add	a7,a7,1
    b104:	fef40fa3          	sb	a5,-1(s0)
    b108:	fe8518e3          	bne	a0,s0,b0f8 <_wcsnrtombs_l+0x118>
    b10c:	000aa783          	lw	a5,0(s5)
    b110:	00050413          	mv	s0,a0
    b114:	00478793          	add	a5,a5,4
    b118:	00faa023          	sw	a5,0(s5)
    b11c:	000ca783          	lw	a5,0(s9)
    b120:	004c8c93          	add	s9,s9,4
    b124:	f40792e3          	bnez	a5,b068 <_wcsnrtombs_l+0x88>
    b128:	000a0463          	beqz	s4,b130 <_wcsnrtombs_l+0x150>
    b12c:	000aa023          	sw	zero,0(s5)
    b130:	0004a023          	sw	zero,0(s1)
    b134:	fff68d13          	add	s10,a3,-1
    b138:	f75ff06f          	j	b0ac <_wcsnrtombs_l+0xcc>
    b13c:	000aac83          	lw	s9,0(s5)
    b140:	10c50493          	add	s1,a0,268
    b144:	ee0a12e3          	bnez	s4,b028 <_wcsnrtombs_l+0x48>
    b148:	05612023          	sw	s6,64(sp)
    b14c:	fff00913          	li	s2,-1
    b150:	ee1ff06f          	j	b030 <_wcsnrtombs_l+0x50>
    b154:	00c12703          	lw	a4,12(sp)
    b158:	08a00793          	li	a5,138
    b15c:	fff00d13          	li	s10,-1
    b160:	00f72023          	sw	a5,0(a4)
    b164:	0004a023          	sw	zero,0(s1)
    b168:	f45ff06f          	j	b0ac <_wcsnrtombs_l+0xcc>
    b16c:	000aa783          	lw	a5,0(s5)
    b170:	00040513          	mv	a0,s0
    b174:	00050413          	mv	s0,a0
    b178:	00478793          	add	a5,a5,4
    b17c:	00faa023          	sw	a5,0(s5)
    b180:	f9dff06f          	j	b11c <_wcsnrtombs_l+0x13c>
    b184:	00000d13          	li	s10,0
    b188:	f39ff06f          	j	b0c0 <_wcsnrtombs_l+0xe0>
    b18c:	00068d13          	mv	s10,a3
    b190:	f1dff06f          	j	b0ac <_wcsnrtombs_l+0xcc>
    b194:	04012b03          	lw	s6,64(sp)
    b198:	00000d13          	li	s10,0
    b19c:	f25ff06f          	j	b0c0 <_wcsnrtombs_l+0xe0>

0000b1a0 <_wcsnrtombs_r>:
    b1a0:	7fff5817          	auipc	a6,0x7fff5
    b1a4:	39480813          	add	a6,a6,916 # 80000534 <__global_locale>
    b1a8:	7fff5517          	auipc	a0,0x7fff5
    b1ac:	56052503          	lw	a0,1376(a0) # 80000708 <_impure_ptr>
    b1b0:	e31ff06f          	j	afe0 <_wcsnrtombs_l>

0000b1b4 <fiprintf>:
    b1b4:	fc010113          	add	sp,sp,-64
    b1b8:	02810313          	add	t1,sp,40
    b1bc:	02c12423          	sw	a2,40(sp)
    b1c0:	02d12623          	sw	a3,44(sp)
    b1c4:	00058613          	mv	a2,a1
    b1c8:	00030693          	mv	a3,t1
    b1cc:	00050593          	mv	a1,a0
    b1d0:	7fff5517          	auipc	a0,0x7fff5
    b1d4:	53852503          	lw	a0,1336(a0) # 80000708 <_impure_ptr>
    b1d8:	00112e23          	sw	ra,28(sp)
    b1dc:	02e12823          	sw	a4,48(sp)
    b1e0:	02f12a23          	sw	a5,52(sp)
    b1e4:	03012c23          	sw	a6,56(sp)
    b1e8:	03112e23          	sw	a7,60(sp)
    b1ec:	00612623          	sw	t1,12(sp)
    b1f0:	a9df90ef          	jal	4c8c <_vfiprintf_r>
    b1f4:	01c12083          	lw	ra,28(sp)
    b1f8:	04010113          	add	sp,sp,64
    b1fc:	00008067          	ret

0000b200 <abort>:
    b200:	ff010113          	add	sp,sp,-16
    b204:	00600513          	li	a0,6
    b208:	00112623          	sw	ra,12(sp)
    b20c:	00c000ef          	jal	b218 <raise>
    b210:	00100513          	li	a0,1
    b214:	829f50ef          	jal	a3c <_exit>

0000b218 <raise>:
    b218:	ff010113          	add	sp,sp,-16
    b21c:	00912223          	sw	s1,4(sp)
    b220:	00112623          	sw	ra,12(sp)
    b224:	01f00793          	li	a5,31
    b228:	7fff5497          	auipc	s1,0x7fff5
    b22c:	4e04a483          	lw	s1,1248(s1) # 80000708 <_impure_ptr>
    b230:	08a7ee63          	bltu	a5,a0,b2cc <raise+0xb4>
    b234:	1184a783          	lw	a5,280(s1)
    b238:	00812423          	sw	s0,8(sp)
    b23c:	00050413          	mv	s0,a0
    b240:	04078263          	beqz	a5,b284 <raise+0x6c>
    b244:	00251713          	sll	a4,a0,0x2
    b248:	00e787b3          	add	a5,a5,a4
    b24c:	0007a703          	lw	a4,0(a5)
    b250:	02070a63          	beqz	a4,b284 <raise+0x6c>
    b254:	00100693          	li	a3,1
    b258:	00d70a63          	beq	a4,a3,b26c <raise+0x54>
    b25c:	fff00693          	li	a3,-1
    b260:	04d70663          	beq	a4,a3,b2ac <raise+0x94>
    b264:	0007a023          	sw	zero,0(a5)
    b268:	000700e7          	jalr	a4
    b26c:	00812403          	lw	s0,8(sp)
    b270:	00000513          	li	a0,0
    b274:	00c12083          	lw	ra,12(sp)
    b278:	00412483          	lw	s1,4(sp)
    b27c:	01010113          	add	sp,sp,16
    b280:	00008067          	ret
    b284:	00048513          	mv	a0,s1
    b288:	0b4000ef          	jal	b33c <_getpid_r>
    b28c:	00040613          	mv	a2,s0
    b290:	00812403          	lw	s0,8(sp)
    b294:	00c12083          	lw	ra,12(sp)
    b298:	00050593          	mv	a1,a0
    b29c:	00048513          	mv	a0,s1
    b2a0:	00412483          	lw	s1,4(sp)
    b2a4:	01010113          	add	sp,sp,16
    b2a8:	0340006f          	j	b2dc <_kill_r>
    b2ac:	00812403          	lw	s0,8(sp)
    b2b0:	00c12083          	lw	ra,12(sp)
    b2b4:	01600793          	li	a5,22
    b2b8:	00f4a023          	sw	a5,0(s1)
    b2bc:	00100513          	li	a0,1
    b2c0:	00412483          	lw	s1,4(sp)
    b2c4:	01010113          	add	sp,sp,16
    b2c8:	00008067          	ret
    b2cc:	01600793          	li	a5,22
    b2d0:	00f4a023          	sw	a5,0(s1)
    b2d4:	fff00513          	li	a0,-1
    b2d8:	f9dff06f          	j	b274 <raise+0x5c>

0000b2dc <_kill_r>:
    b2dc:	ff010113          	add	sp,sp,-16
    b2e0:	00058713          	mv	a4,a1
    b2e4:	00812423          	sw	s0,8(sp)
    b2e8:	00060593          	mv	a1,a2
    b2ec:	00050413          	mv	s0,a0
    b2f0:	00070513          	mv	a0,a4
    b2f4:	7fff5797          	auipc	a5,0x7fff5
    b2f8:	4207a223          	sw	zero,1060(a5) # 80000718 <errno>
    b2fc:	00112623          	sw	ra,12(sp)
    b300:	f74f50ef          	jal	a74 <_kill>
    b304:	fff00793          	li	a5,-1
    b308:	00f50a63          	beq	a0,a5,b31c <_kill_r+0x40>
    b30c:	00c12083          	lw	ra,12(sp)
    b310:	00812403          	lw	s0,8(sp)
    b314:	01010113          	add	sp,sp,16
    b318:	00008067          	ret
    b31c:	7fff5797          	auipc	a5,0x7fff5
    b320:	3fc7a783          	lw	a5,1020(a5) # 80000718 <errno>
    b324:	fe0784e3          	beqz	a5,b30c <_kill_r+0x30>
    b328:	00c12083          	lw	ra,12(sp)
    b32c:	00f42023          	sw	a5,0(s0)
    b330:	00812403          	lw	s0,8(sp)
    b334:	01010113          	add	sp,sp,16
    b338:	00008067          	ret

0000b33c <_getpid_r>:
    b33c:	f28f506f          	j	a64 <_getpid>

0000b340 <__udivdi3>:
    b340:	fd010113          	add	sp,sp,-48
    b344:	01312e23          	sw	s3,28(sp)
    b348:	02112623          	sw	ra,44(sp)
    b34c:	01612823          	sw	s6,16(sp)
    b350:	00050993          	mv	s3,a0
    b354:	16069663          	bnez	a3,b4c0 <__udivdi3+0x180>
    b358:	02812423          	sw	s0,40(sp)
    b35c:	01512a23          	sw	s5,20(sp)
    b360:	02912223          	sw	s1,36(sp)
    b364:	03212023          	sw	s2,32(sp)
    b368:	01412c23          	sw	s4,24(sp)
    b36c:	00060a93          	mv	s5,a2
    b370:	00050413          	mv	s0,a0
    b374:	1cc5f063          	bgeu	a1,a2,b534 <__udivdi3+0x1f4>
    b378:	000107b7          	lui	a5,0x10
    b37c:	00058493          	mv	s1,a1
    b380:	2af66e63          	bltu	a2,a5,b63c <__udivdi3+0x2fc>
    b384:	010007b7          	lui	a5,0x1000
    b388:	01800713          	li	a4,24
    b38c:	00f67463          	bgeu	a2,a5,b394 <__udivdi3+0x54>
    b390:	01000713          	li	a4,16
    b394:	00e656b3          	srl	a3,a2,a4
    b398:	00004797          	auipc	a5,0x4
    b39c:	3c878793          	add	a5,a5,968 # f760 <__clz_tab>
    b3a0:	00d787b3          	add	a5,a5,a3
    b3a4:	0007c783          	lbu	a5,0(a5)
    b3a8:	02000693          	li	a3,32
    b3ac:	00e787b3          	add	a5,a5,a4
    b3b0:	40f68733          	sub	a4,a3,a5
    b3b4:	00f68c63          	beq	a3,a5,b3cc <__udivdi3+0x8c>
    b3b8:	00e594b3          	sll	s1,a1,a4
    b3bc:	00f9d7b3          	srl	a5,s3,a5
    b3c0:	00e61ab3          	sll	s5,a2,a4
    b3c4:	0097e4b3          	or	s1,a5,s1
    b3c8:	00e99433          	sll	s0,s3,a4
    b3cc:	010ada13          	srl	s4,s5,0x10
    b3d0:	000a0593          	mv	a1,s4
    b3d4:	00048513          	mv	a0,s1
    b3d8:	010a9b13          	sll	s6,s5,0x10
    b3dc:	7fc030ef          	jal	ebd8 <__hidden___udivsi3>
    b3e0:	010b5b13          	srl	s6,s6,0x10
    b3e4:	00050593          	mv	a1,a0
    b3e8:	00050913          	mv	s2,a0
    b3ec:	000b0513          	mv	a0,s6
    b3f0:	724030ef          	jal	eb14 <__mulsi3>
    b3f4:	00050793          	mv	a5,a0
    b3f8:	000a0593          	mv	a1,s4
    b3fc:	00048513          	mv	a0,s1
    b400:	00078493          	mv	s1,a5
    b404:	01d030ef          	jal	ec20 <__umodsi3>
    b408:	01051513          	sll	a0,a0,0x10
    b40c:	01045793          	srl	a5,s0,0x10
    b410:	00a7e7b3          	or	a5,a5,a0
    b414:	0097fc63          	bgeu	a5,s1,b42c <__udivdi3+0xec>
    b418:	00fa87b3          	add	a5,s5,a5
    b41c:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0x2f3>
    b420:	0157e463          	bltu	a5,s5,b428 <__udivdi3+0xe8>
    b424:	5a97e863          	bltu	a5,s1,b9d4 <__udivdi3+0x694>
    b428:	00070913          	mv	s2,a4
    b42c:	409784b3          	sub	s1,a5,s1
    b430:	000a0593          	mv	a1,s4
    b434:	00048513          	mv	a0,s1
    b438:	7a0030ef          	jal	ebd8 <__hidden___udivsi3>
    b43c:	00050593          	mv	a1,a0
    b440:	00050993          	mv	s3,a0
    b444:	000b0513          	mv	a0,s6
    b448:	6cc030ef          	jal	eb14 <__mulsi3>
    b44c:	00050793          	mv	a5,a0
    b450:	000a0593          	mv	a1,s4
    b454:	00048513          	mv	a0,s1
    b458:	01041413          	sll	s0,s0,0x10
    b45c:	00078493          	mv	s1,a5
    b460:	7c0030ef          	jal	ec20 <__umodsi3>
    b464:	01051513          	sll	a0,a0,0x10
    b468:	01045413          	srl	s0,s0,0x10
    b46c:	00a46433          	or	s0,s0,a0
    b470:	00947c63          	bgeu	s0,s1,b488 <__udivdi3+0x148>
    b474:	008a8433          	add	s0,s5,s0
    b478:	fff98793          	add	a5,s3,-1
    b47c:	4d546e63          	bltu	s0,s5,b958 <__udivdi3+0x618>
    b480:	ffe98993          	add	s3,s3,-2
    b484:	4c947a63          	bgeu	s0,s1,b958 <__udivdi3+0x618>
    b488:	01091613          	sll	a2,s2,0x10
    b48c:	01366533          	or	a0,a2,s3
    b490:	00000b13          	li	s6,0
    b494:	02812403          	lw	s0,40(sp)
    b498:	02c12083          	lw	ra,44(sp)
    b49c:	02412483          	lw	s1,36(sp)
    b4a0:	02012903          	lw	s2,32(sp)
    b4a4:	01812a03          	lw	s4,24(sp)
    b4a8:	01412a83          	lw	s5,20(sp)
    b4ac:	01c12983          	lw	s3,28(sp)
    b4b0:	000b0593          	mv	a1,s6
    b4b4:	01012b03          	lw	s6,16(sp)
    b4b8:	03010113          	add	sp,sp,48
    b4bc:	00008067          	ret
    b4c0:	02d5f263          	bgeu	a1,a3,b4e4 <__udivdi3+0x1a4>
    b4c4:	00000b13          	li	s6,0
    b4c8:	00000513          	li	a0,0
    b4cc:	02c12083          	lw	ra,44(sp)
    b4d0:	01c12983          	lw	s3,28(sp)
    b4d4:	000b0593          	mv	a1,s6
    b4d8:	01012b03          	lw	s6,16(sp)
    b4dc:	03010113          	add	sp,sp,48
    b4e0:	00008067          	ret
    b4e4:	000107b7          	lui	a5,0x10
    b4e8:	26f6ee63          	bltu	a3,a5,b764 <__udivdi3+0x424>
    b4ec:	01000737          	lui	a4,0x1000
    b4f0:	01800793          	li	a5,24
    b4f4:	00e6f463          	bgeu	a3,a4,b4fc <__udivdi3+0x1bc>
    b4f8:	01000793          	li	a5,16
    b4fc:	00f6d533          	srl	a0,a3,a5
    b500:	00004717          	auipc	a4,0x4
    b504:	26070713          	add	a4,a4,608 # f760 <__clz_tab>
    b508:	00a70733          	add	a4,a4,a0
    b50c:	00074703          	lbu	a4,0(a4)
    b510:	02000513          	li	a0,32
    b514:	00f70733          	add	a4,a4,a5
    b518:	40e50b33          	sub	s6,a0,a4
    b51c:	26e51c63          	bne	a0,a4,b794 <__udivdi3+0x454>
    b520:	46b6ee63          	bltu	a3,a1,b99c <__udivdi3+0x65c>
    b524:	00c9b533          	sltu	a0,s3,a2
    b528:	00153513          	seqz	a0,a0
    b52c:	00000b13          	li	s6,0
    b530:	f9dff06f          	j	b4cc <__udivdi3+0x18c>
    b534:	10060c63          	beqz	a2,b64c <__udivdi3+0x30c>
    b538:	000107b7          	lui	a5,0x10
    b53c:	44f67663          	bgeu	a2,a5,b988 <__udivdi3+0x648>
    b540:	10063713          	sltiu	a4,a2,256
    b544:	00173713          	seqz	a4,a4
    b548:	00371713          	sll	a4,a4,0x3
    b54c:	00e656b3          	srl	a3,a2,a4
    b550:	00004797          	auipc	a5,0x4
    b554:	21078793          	add	a5,a5,528 # f760 <__clz_tab>
    b558:	00d787b3          	add	a5,a5,a3
    b55c:	0007c483          	lbu	s1,0(a5)
    b560:	02000793          	li	a5,32
    b564:	00e484b3          	add	s1,s1,a4
    b568:	40978733          	sub	a4,a5,s1
    b56c:	10979463          	bne	a5,s1,b674 <__udivdi3+0x334>
    b570:	01061a13          	sll	s4,a2,0x10
    b574:	40c584b3          	sub	s1,a1,a2
    b578:	01065913          	srl	s2,a2,0x10
    b57c:	010a5a13          	srl	s4,s4,0x10
    b580:	00100b13          	li	s6,1
    b584:	00090593          	mv	a1,s2
    b588:	00048513          	mv	a0,s1
    b58c:	64c030ef          	jal	ebd8 <__hidden___udivsi3>
    b590:	000a0593          	mv	a1,s4
    b594:	00050993          	mv	s3,a0
    b598:	57c030ef          	jal	eb14 <__mulsi3>
    b59c:	00050793          	mv	a5,a0
    b5a0:	00090593          	mv	a1,s2
    b5a4:	00048513          	mv	a0,s1
    b5a8:	00078493          	mv	s1,a5
    b5ac:	674030ef          	jal	ec20 <__umodsi3>
    b5b0:	01051513          	sll	a0,a0,0x10
    b5b4:	01045793          	srl	a5,s0,0x10
    b5b8:	00a7e7b3          	or	a5,a5,a0
    b5bc:	0097fc63          	bgeu	a5,s1,b5d4 <__udivdi3+0x294>
    b5c0:	00fa87b3          	add	a5,s5,a5
    b5c4:	fff98713          	add	a4,s3,-1
    b5c8:	0157e463          	bltu	a5,s5,b5d0 <__udivdi3+0x290>
    b5cc:	3e97ee63          	bltu	a5,s1,b9c8 <__udivdi3+0x688>
    b5d0:	00070993          	mv	s3,a4
    b5d4:	409784b3          	sub	s1,a5,s1
    b5d8:	00090593          	mv	a1,s2
    b5dc:	00048513          	mv	a0,s1
    b5e0:	5f8030ef          	jal	ebd8 <__hidden___udivsi3>
    b5e4:	000a0593          	mv	a1,s4
    b5e8:	00050a13          	mv	s4,a0
    b5ec:	528030ef          	jal	eb14 <__mulsi3>
    b5f0:	00050793          	mv	a5,a0
    b5f4:	00090593          	mv	a1,s2
    b5f8:	00048513          	mv	a0,s1
    b5fc:	01041413          	sll	s0,s0,0x10
    b600:	00078493          	mv	s1,a5
    b604:	61c030ef          	jal	ec20 <__umodsi3>
    b608:	01051513          	sll	a0,a0,0x10
    b60c:	01045413          	srl	s0,s0,0x10
    b610:	00a46433          	or	s0,s0,a0
    b614:	00947e63          	bgeu	s0,s1,b630 <__udivdi3+0x2f0>
    b618:	008a8433          	add	s0,s5,s0
    b61c:	fffa0793          	add	a5,s4,-1
    b620:	01546663          	bltu	s0,s5,b62c <__udivdi3+0x2ec>
    b624:	ffea0a13          	add	s4,s4,-2
    b628:	00946463          	bltu	s0,s1,b630 <__udivdi3+0x2f0>
    b62c:	00078a13          	mv	s4,a5
    b630:	01099613          	sll	a2,s3,0x10
    b634:	01466533          	or	a0,a2,s4
    b638:	e5dff06f          	j	b494 <__udivdi3+0x154>
    b63c:	10063713          	sltiu	a4,a2,256
    b640:	00173713          	seqz	a4,a4
    b644:	00371713          	sll	a4,a4,0x3
    b648:	d4dff06f          	j	b394 <__udivdi3+0x54>
    b64c:	00000693          	li	a3,0
    b650:	00004797          	auipc	a5,0x4
    b654:	11078793          	add	a5,a5,272 # f760 <__clz_tab>
    b658:	00d787b3          	add	a5,a5,a3
    b65c:	0007c483          	lbu	s1,0(a5)
    b660:	00000713          	li	a4,0
    b664:	02000793          	li	a5,32
    b668:	00e484b3          	add	s1,s1,a4
    b66c:	40978733          	sub	a4,a5,s1
    b670:	f09780e3          	beq	a5,s1,b570 <__udivdi3+0x230>
    b674:	00e61ab3          	sll	s5,a2,a4
    b678:	01712623          	sw	s7,12(sp)
    b67c:	010ad913          	srl	s2,s5,0x10
    b680:	0095dbb3          	srl	s7,a1,s1
    b684:	00e597b3          	sll	a5,a1,a4
    b688:	0099d4b3          	srl	s1,s3,s1
    b68c:	00090593          	mv	a1,s2
    b690:	000b8513          	mv	a0,s7
    b694:	010a9a13          	sll	s4,s5,0x10
    b698:	00f4e4b3          	or	s1,s1,a5
    b69c:	00e99433          	sll	s0,s3,a4
    b6a0:	010a5a13          	srl	s4,s4,0x10
    b6a4:	534030ef          	jal	ebd8 <__hidden___udivsi3>
    b6a8:	00050593          	mv	a1,a0
    b6ac:	00050b13          	mv	s6,a0
    b6b0:	000a0513          	mv	a0,s4
    b6b4:	460030ef          	jal	eb14 <__mulsi3>
    b6b8:	00050993          	mv	s3,a0
    b6bc:	00090593          	mv	a1,s2
    b6c0:	000b8513          	mv	a0,s7
    b6c4:	55c030ef          	jal	ec20 <__umodsi3>
    b6c8:	01051513          	sll	a0,a0,0x10
    b6cc:	0104d793          	srl	a5,s1,0x10
    b6d0:	00a7e7b3          	or	a5,a5,a0
    b6d4:	0137fe63          	bgeu	a5,s3,b6f0 <__udivdi3+0x3b0>
    b6d8:	00fa87b3          	add	a5,s5,a5
    b6dc:	fffb0713          	add	a4,s6,-1
    b6e0:	2d57ec63          	bltu	a5,s5,b9b8 <__udivdi3+0x678>
    b6e4:	2d37fa63          	bgeu	a5,s3,b9b8 <__udivdi3+0x678>
    b6e8:	ffeb0b13          	add	s6,s6,-2
    b6ec:	015787b3          	add	a5,a5,s5
    b6f0:	413789b3          	sub	s3,a5,s3
    b6f4:	00090593          	mv	a1,s2
    b6f8:	00098513          	mv	a0,s3
    b6fc:	4dc030ef          	jal	ebd8 <__hidden___udivsi3>
    b700:	00050593          	mv	a1,a0
    b704:	00050b93          	mv	s7,a0
    b708:	000a0513          	mv	a0,s4
    b70c:	408030ef          	jal	eb14 <__mulsi3>
    b710:	00050793          	mv	a5,a0
    b714:	00090593          	mv	a1,s2
    b718:	00098513          	mv	a0,s3
    b71c:	01049493          	sll	s1,s1,0x10
    b720:	00078993          	mv	s3,a5
    b724:	4fc030ef          	jal	ec20 <__umodsi3>
    b728:	01051513          	sll	a0,a0,0x10
    b72c:	0104d493          	srl	s1,s1,0x10
    b730:	00a4e4b3          	or	s1,s1,a0
    b734:	0134fe63          	bgeu	s1,s3,b750 <__udivdi3+0x410>
    b738:	009a84b3          	add	s1,s5,s1
    b73c:	fffb8793          	add	a5,s7,-1
    b740:	2754e463          	bltu	s1,s5,b9a8 <__udivdi3+0x668>
    b744:	2734f263          	bgeu	s1,s3,b9a8 <__udivdi3+0x668>
    b748:	ffeb8b93          	add	s7,s7,-2
    b74c:	015484b3          	add	s1,s1,s5
    b750:	010b1b13          	sll	s6,s6,0x10
    b754:	017b6b33          	or	s6,s6,s7
    b758:	413484b3          	sub	s1,s1,s3
    b75c:	00c12b83          	lw	s7,12(sp)
    b760:	e25ff06f          	j	b584 <__udivdi3+0x244>
    b764:	1006b793          	sltiu	a5,a3,256
    b768:	0017b793          	seqz	a5,a5
    b76c:	00379793          	sll	a5,a5,0x3
    b770:	00f6d533          	srl	a0,a3,a5
    b774:	00004717          	auipc	a4,0x4
    b778:	fec70713          	add	a4,a4,-20 # f760 <__clz_tab>
    b77c:	00a70733          	add	a4,a4,a0
    b780:	00074703          	lbu	a4,0(a4)
    b784:	02000513          	li	a0,32
    b788:	00f70733          	add	a4,a4,a5
    b78c:	40e50b33          	sub	s6,a0,a4
    b790:	d8e508e3          	beq	a0,a4,b520 <__udivdi3+0x1e0>
    b794:	016696b3          	sll	a3,a3,s6
    b798:	01912223          	sw	s9,4(sp)
    b79c:	00e65cb3          	srl	s9,a2,a4
    b7a0:	00dcecb3          	or	s9,s9,a3
    b7a4:	01512a23          	sw	s5,20(sp)
    b7a8:	01712623          	sw	s7,12(sp)
    b7ac:	010cda93          	srl	s5,s9,0x10
    b7b0:	00e5dbb3          	srl	s7,a1,a4
    b7b4:	016597b3          	sll	a5,a1,s6
    b7b8:	00e9d733          	srl	a4,s3,a4
    b7bc:	01812423          	sw	s8,8(sp)
    b7c0:	000a8593          	mv	a1,s5
    b7c4:	000b8513          	mv	a0,s7
    b7c8:	010c9c13          	sll	s8,s9,0x10
    b7cc:	02812423          	sw	s0,40(sp)
    b7d0:	02912223          	sw	s1,36(sp)
    b7d4:	03212023          	sw	s2,32(sp)
    b7d8:	00f764b3          	or	s1,a4,a5
    b7dc:	01661933          	sll	s2,a2,s6
    b7e0:	01412c23          	sw	s4,24(sp)
    b7e4:	010c5c13          	srl	s8,s8,0x10
    b7e8:	3f0030ef          	jal	ebd8 <__hidden___udivsi3>
    b7ec:	00050593          	mv	a1,a0
    b7f0:	00050413          	mv	s0,a0
    b7f4:	000c0513          	mv	a0,s8
    b7f8:	31c030ef          	jal	eb14 <__mulsi3>
    b7fc:	00050a13          	mv	s4,a0
    b800:	000a8593          	mv	a1,s5
    b804:	000b8513          	mv	a0,s7
    b808:	418030ef          	jal	ec20 <__umodsi3>
    b80c:	01051513          	sll	a0,a0,0x10
    b810:	0104d793          	srl	a5,s1,0x10
    b814:	00a7e7b3          	or	a5,a5,a0
    b818:	0147fe63          	bgeu	a5,s4,b834 <__udivdi3+0x4f4>
    b81c:	00fc87b3          	add	a5,s9,a5
    b820:	fff40713          	add	a4,s0,-1
    b824:	1997ee63          	bltu	a5,s9,b9c0 <__udivdi3+0x680>
    b828:	1947fc63          	bgeu	a5,s4,b9c0 <__udivdi3+0x680>
    b82c:	ffe40413          	add	s0,s0,-2
    b830:	019787b3          	add	a5,a5,s9
    b834:	41478a33          	sub	s4,a5,s4
    b838:	000a8593          	mv	a1,s5
    b83c:	000a0513          	mv	a0,s4
    b840:	398030ef          	jal	ebd8 <__hidden___udivsi3>
    b844:	00050593          	mv	a1,a0
    b848:	00050b93          	mv	s7,a0
    b84c:	000c0513          	mv	a0,s8
    b850:	2c4030ef          	jal	eb14 <__mulsi3>
    b854:	00050793          	mv	a5,a0
    b858:	000a8593          	mv	a1,s5
    b85c:	000a0513          	mv	a0,s4
    b860:	00078a13          	mv	s4,a5
    b864:	3bc030ef          	jal	ec20 <__umodsi3>
    b868:	01049713          	sll	a4,s1,0x10
    b86c:	01051513          	sll	a0,a0,0x10
    b870:	01075713          	srl	a4,a4,0x10
    b874:	00a76733          	or	a4,a4,a0
    b878:	01477e63          	bgeu	a4,s4,b894 <__udivdi3+0x554>
    b87c:	00ec8733          	add	a4,s9,a4
    b880:	fffb8793          	add	a5,s7,-1
    b884:	13976663          	bltu	a4,s9,b9b0 <__udivdi3+0x670>
    b888:	13477463          	bgeu	a4,s4,b9b0 <__udivdi3+0x670>
    b88c:	ffeb8b93          	add	s7,s7,-2
    b890:	01970733          	add	a4,a4,s9
    b894:	00010e37          	lui	t3,0x10
    b898:	01041413          	sll	s0,s0,0x10
    b89c:	01746433          	or	s0,s0,s7
    b8a0:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    b8a4:	00f47833          	and	a6,s0,a5
    b8a8:	00f977b3          	and	a5,s2,a5
    b8ac:	41470733          	sub	a4,a4,s4
    b8b0:	01045e93          	srl	t4,s0,0x10
    b8b4:	01095913          	srl	s2,s2,0x10
    b8b8:	00080513          	mv	a0,a6
    b8bc:	00078593          	mv	a1,a5
    b8c0:	254030ef          	jal	eb14 <__mulsi3>
    b8c4:	00050313          	mv	t1,a0
    b8c8:	00090593          	mv	a1,s2
    b8cc:	00080513          	mv	a0,a6
    b8d0:	244030ef          	jal	eb14 <__mulsi3>
    b8d4:	00050813          	mv	a6,a0
    b8d8:	00078593          	mv	a1,a5
    b8dc:	000e8513          	mv	a0,t4
    b8e0:	234030ef          	jal	eb14 <__mulsi3>
    b8e4:	00050893          	mv	a7,a0
    b8e8:	00090593          	mv	a1,s2
    b8ec:	000e8513          	mv	a0,t4
    b8f0:	224030ef          	jal	eb14 <__mulsi3>
    b8f4:	01035793          	srl	a5,t1,0x10
    b8f8:	01180833          	add	a6,a6,a7
    b8fc:	010787b3          	add	a5,a5,a6
    b900:	0117f463          	bgeu	a5,a7,b908 <__udivdi3+0x5c8>
    b904:	01c50533          	add	a0,a0,t3
    b908:	0107d693          	srl	a3,a5,0x10
    b90c:	00a686b3          	add	a3,a3,a0
    b910:	06d76863          	bltu	a4,a3,b980 <__udivdi3+0x640>
    b914:	04d70663          	beq	a4,a3,b960 <__udivdi3+0x620>
    b918:	00040513          	mv	a0,s0
    b91c:	02812403          	lw	s0,40(sp)
    b920:	02c12083          	lw	ra,44(sp)
    b924:	00000b13          	li	s6,0
    b928:	02412483          	lw	s1,36(sp)
    b92c:	02012903          	lw	s2,32(sp)
    b930:	01812a03          	lw	s4,24(sp)
    b934:	01412a83          	lw	s5,20(sp)
    b938:	00c12b83          	lw	s7,12(sp)
    b93c:	00812c03          	lw	s8,8(sp)
    b940:	00412c83          	lw	s9,4(sp)
    b944:	01c12983          	lw	s3,28(sp)
    b948:	000b0593          	mv	a1,s6
    b94c:	01012b03          	lw	s6,16(sp)
    b950:	03010113          	add	sp,sp,48
    b954:	00008067          	ret
    b958:	00078993          	mv	s3,a5
    b95c:	b2dff06f          	j	b488 <__udivdi3+0x148>
    b960:	00010737          	lui	a4,0x10
    b964:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    b968:	00e7f7b3          	and	a5,a5,a4
    b96c:	01079793          	sll	a5,a5,0x10
    b970:	00e37333          	and	t1,t1,a4
    b974:	01699533          	sll	a0,s3,s6
    b978:	006787b3          	add	a5,a5,t1
    b97c:	f8f57ee3          	bgeu	a0,a5,b918 <__udivdi3+0x5d8>
    b980:	fff40513          	add	a0,s0,-1
    b984:	f99ff06f          	j	b91c <__udivdi3+0x5dc>
    b988:	010007b7          	lui	a5,0x1000
    b98c:	04f67a63          	bgeu	a2,a5,b9e0 <__udivdi3+0x6a0>
    b990:	01065693          	srl	a3,a2,0x10
    b994:	01000713          	li	a4,16
    b998:	bb9ff06f          	j	b550 <__udivdi3+0x210>
    b99c:	00000b13          	li	s6,0
    b9a0:	00100513          	li	a0,1
    b9a4:	b29ff06f          	j	b4cc <__udivdi3+0x18c>
    b9a8:	00078b93          	mv	s7,a5
    b9ac:	da5ff06f          	j	b750 <__udivdi3+0x410>
    b9b0:	00078b93          	mv	s7,a5
    b9b4:	ee1ff06f          	j	b894 <__udivdi3+0x554>
    b9b8:	00070b13          	mv	s6,a4
    b9bc:	d35ff06f          	j	b6f0 <__udivdi3+0x3b0>
    b9c0:	00070413          	mv	s0,a4
    b9c4:	e71ff06f          	j	b834 <__udivdi3+0x4f4>
    b9c8:	ffe98993          	add	s3,s3,-2
    b9cc:	015787b3          	add	a5,a5,s5
    b9d0:	c05ff06f          	j	b5d4 <__udivdi3+0x294>
    b9d4:	ffe90913          	add	s2,s2,-2
    b9d8:	015787b3          	add	a5,a5,s5
    b9dc:	a51ff06f          	j	b42c <__udivdi3+0xec>
    b9e0:	01865693          	srl	a3,a2,0x18
    b9e4:	01800713          	li	a4,24
    b9e8:	b69ff06f          	j	b550 <__udivdi3+0x210>

0000b9ec <__umoddi3>:
    b9ec:	fd010113          	add	sp,sp,-48
    b9f0:	02112623          	sw	ra,44(sp)
    b9f4:	00050793          	mv	a5,a0
    b9f8:	14069663          	bnez	a3,bb44 <__umoddi3+0x158>
    b9fc:	03212023          	sw	s2,32(sp)
    ba00:	01412c23          	sw	s4,24(sp)
    ba04:	02812423          	sw	s0,40(sp)
    ba08:	02912223          	sw	s1,36(sp)
    ba0c:	01312e23          	sw	s3,28(sp)
    ba10:	01512a23          	sw	s5,20(sp)
    ba14:	00060a13          	mv	s4,a2
    ba18:	00050913          	mv	s2,a0
    ba1c:	1ac5f663          	bgeu	a1,a2,bbc8 <__umoddi3+0x1dc>
    ba20:	01612823          	sw	s6,16(sp)
    ba24:	00010737          	lui	a4,0x10
    ba28:	00058993          	mv	s3,a1
    ba2c:	28e66063          	bltu	a2,a4,bcac <__umoddi3+0x2c0>
    ba30:	01000737          	lui	a4,0x1000
    ba34:	01800693          	li	a3,24
    ba38:	00e67463          	bgeu	a2,a4,ba40 <__umoddi3+0x54>
    ba3c:	01000693          	li	a3,16
    ba40:	00d65533          	srl	a0,a2,a3
    ba44:	00004717          	auipc	a4,0x4
    ba48:	d1c70713          	add	a4,a4,-740 # f760 <__clz_tab>
    ba4c:	00a70733          	add	a4,a4,a0
    ba50:	00074703          	lbu	a4,0(a4)
    ba54:	02000513          	li	a0,32
    ba58:	00d70733          	add	a4,a4,a3
    ba5c:	40e504b3          	sub	s1,a0,a4
    ba60:	00e50c63          	beq	a0,a4,ba78 <__umoddi3+0x8c>
    ba64:	009599b3          	sll	s3,a1,s1
    ba68:	00e7d733          	srl	a4,a5,a4
    ba6c:	00961a33          	sll	s4,a2,s1
    ba70:	013769b3          	or	s3,a4,s3
    ba74:	00979933          	sll	s2,a5,s1
    ba78:	010a5a93          	srl	s5,s4,0x10
    ba7c:	000a8593          	mv	a1,s5
    ba80:	00098513          	mv	a0,s3
    ba84:	010a1b13          	sll	s6,s4,0x10
    ba88:	150030ef          	jal	ebd8 <__hidden___udivsi3>
    ba8c:	010b5b13          	srl	s6,s6,0x10
    ba90:	000b0593          	mv	a1,s6
    ba94:	080030ef          	jal	eb14 <__mulsi3>
    ba98:	00050413          	mv	s0,a0
    ba9c:	000a8593          	mv	a1,s5
    baa0:	00098513          	mv	a0,s3
    baa4:	17c030ef          	jal	ec20 <__umodsi3>
    baa8:	01051513          	sll	a0,a0,0x10
    baac:	01095793          	srl	a5,s2,0x10
    bab0:	00a7e7b3          	or	a5,a5,a0
    bab4:	0087f863          	bgeu	a5,s0,bac4 <__umoddi3+0xd8>
    bab8:	00fa07b3          	add	a5,s4,a5
    babc:	0147e463          	bltu	a5,s4,bac4 <__umoddi3+0xd8>
    bac0:	5687e863          	bltu	a5,s0,c030 <__umoddi3+0x644>
    bac4:	40878433          	sub	s0,a5,s0
    bac8:	000a8593          	mv	a1,s5
    bacc:	00040513          	mv	a0,s0
    bad0:	108030ef          	jal	ebd8 <__hidden___udivsi3>
    bad4:	000b0593          	mv	a1,s6
    bad8:	03c030ef          	jal	eb14 <__mulsi3>
    badc:	00050793          	mv	a5,a0
    bae0:	000a8593          	mv	a1,s5
    bae4:	00040513          	mv	a0,s0
    bae8:	00078413          	mv	s0,a5
    baec:	134030ef          	jal	ec20 <__umodsi3>
    baf0:	01091793          	sll	a5,s2,0x10
    baf4:	01051513          	sll	a0,a0,0x10
    baf8:	0107d793          	srl	a5,a5,0x10
    bafc:	00a7e7b3          	or	a5,a5,a0
    bb00:	0087f863          	bgeu	a5,s0,bb10 <__umoddi3+0x124>
    bb04:	00fa07b3          	add	a5,s4,a5
    bb08:	0147e463          	bltu	a5,s4,bb10 <__umoddi3+0x124>
    bb0c:	5087ea63          	bltu	a5,s0,c020 <__umoddi3+0x634>
    bb10:	01012b03          	lw	s6,16(sp)
    bb14:	408787b3          	sub	a5,a5,s0
    bb18:	0097d533          	srl	a0,a5,s1
    bb1c:	02812403          	lw	s0,40(sp)
    bb20:	02412483          	lw	s1,36(sp)
    bb24:	02012903          	lw	s2,32(sp)
    bb28:	01c12983          	lw	s3,28(sp)
    bb2c:	01812a03          	lw	s4,24(sp)
    bb30:	01412a83          	lw	s5,20(sp)
    bb34:	00000593          	li	a1,0
    bb38:	02c12083          	lw	ra,44(sp)
    bb3c:	03010113          	add	sp,sp,48
    bb40:	00008067          	ret
    bb44:	00050893          	mv	a7,a0
    bb48:	fed5e8e3          	bltu	a1,a3,bb38 <__umoddi3+0x14c>
    bb4c:	03212023          	sw	s2,32(sp)
    bb50:	01312e23          	sw	s3,28(sp)
    bb54:	00010737          	lui	a4,0x10
    bb58:	00058813          	mv	a6,a1
    bb5c:	24e6ec63          	bltu	a3,a4,bdb4 <__umoddi3+0x3c8>
    bb60:	01000737          	lui	a4,0x1000
    bb64:	01800513          	li	a0,24
    bb68:	00e6f463          	bgeu	a3,a4,bb70 <__umoddi3+0x184>
    bb6c:	01000513          	li	a0,16
    bb70:	00a6d333          	srl	t1,a3,a0
    bb74:	00004717          	auipc	a4,0x4
    bb78:	bec70713          	add	a4,a4,-1044 # f760 <__clz_tab>
    bb7c:	00670733          	add	a4,a4,t1
    bb80:	00074703          	lbu	a4,0(a4)
    bb84:	02000313          	li	t1,32
    bb88:	00a709b3          	add	s3,a4,a0
    bb8c:	41330933          	sub	s2,t1,s3
    bb90:	25331a63          	bne	t1,s3,bde4 <__umoddi3+0x3f8>
    bb94:	00b6e463          	bltu	a3,a1,bb9c <__umoddi3+0x1b0>
    bb98:	00c7ea63          	bltu	a5,a2,bbac <__umoddi3+0x1c0>
    bb9c:	40c788b3          	sub	a7,a5,a2
    bba0:	40d586b3          	sub	a3,a1,a3
    bba4:	0117b833          	sltu	a6,a5,a7
    bba8:	41068833          	sub	a6,a3,a6
    bbac:	02c12083          	lw	ra,44(sp)
    bbb0:	02012903          	lw	s2,32(sp)
    bbb4:	01c12983          	lw	s3,28(sp)
    bbb8:	00088513          	mv	a0,a7
    bbbc:	00080593          	mv	a1,a6
    bbc0:	03010113          	add	sp,sp,48
    bbc4:	00008067          	ret
    bbc8:	0e060a63          	beqz	a2,bcbc <__umoddi3+0x2d0>
    bbcc:	00010737          	lui	a4,0x10
    bbd0:	42e67663          	bgeu	a2,a4,bffc <__umoddi3+0x610>
    bbd4:	10063693          	sltiu	a3,a2,256
    bbd8:	0016b693          	seqz	a3,a3
    bbdc:	00369693          	sll	a3,a3,0x3
    bbe0:	00d65533          	srl	a0,a2,a3
    bbe4:	00004717          	auipc	a4,0x4
    bbe8:	b7c70713          	add	a4,a4,-1156 # f760 <__clz_tab>
    bbec:	00a70733          	add	a4,a4,a0
    bbf0:	00074983          	lbu	s3,0(a4)
    bbf4:	02000713          	li	a4,32
    bbf8:	00d989b3          	add	s3,s3,a3
    bbfc:	413704b3          	sub	s1,a4,s3
    bc00:	0f371263          	bne	a4,s3,bce4 <__umoddi3+0x2f8>
    bc04:	01061413          	sll	s0,a2,0x10
    bc08:	40c589b3          	sub	s3,a1,a2
    bc0c:	01065a93          	srl	s5,a2,0x10
    bc10:	01045413          	srl	s0,s0,0x10
    bc14:	000a8593          	mv	a1,s5
    bc18:	00098513          	mv	a0,s3
    bc1c:	7bd020ef          	jal	ebd8 <__hidden___udivsi3>
    bc20:	00040593          	mv	a1,s0
    bc24:	6f1020ef          	jal	eb14 <__mulsi3>
    bc28:	00050793          	mv	a5,a0
    bc2c:	000a8593          	mv	a1,s5
    bc30:	00098513          	mv	a0,s3
    bc34:	00078993          	mv	s3,a5
    bc38:	7e9020ef          	jal	ec20 <__umodsi3>
    bc3c:	01051513          	sll	a0,a0,0x10
    bc40:	01095793          	srl	a5,s2,0x10
    bc44:	00a7e7b3          	or	a5,a5,a0
    bc48:	0137f863          	bgeu	a5,s3,bc58 <__umoddi3+0x26c>
    bc4c:	00fa07b3          	add	a5,s4,a5
    bc50:	0147e463          	bltu	a5,s4,bc58 <__umoddi3+0x26c>
    bc54:	3d37ea63          	bltu	a5,s3,c028 <__umoddi3+0x63c>
    bc58:	413789b3          	sub	s3,a5,s3
    bc5c:	000a8593          	mv	a1,s5
    bc60:	00098513          	mv	a0,s3
    bc64:	775020ef          	jal	ebd8 <__hidden___udivsi3>
    bc68:	00040593          	mv	a1,s0
    bc6c:	6a9020ef          	jal	eb14 <__mulsi3>
    bc70:	00050413          	mv	s0,a0
    bc74:	000a8593          	mv	a1,s5
    bc78:	00098513          	mv	a0,s3
    bc7c:	7a5020ef          	jal	ec20 <__umodsi3>
    bc80:	01091913          	sll	s2,s2,0x10
    bc84:	01051793          	sll	a5,a0,0x10
    bc88:	01095913          	srl	s2,s2,0x10
    bc8c:	00f967b3          	or	a5,s2,a5
    bc90:	0087fa63          	bgeu	a5,s0,bca4 <__umoddi3+0x2b8>
    bc94:	00fa07b3          	add	a5,s4,a5
    bc98:	0147e663          	bltu	a5,s4,bca4 <__umoddi3+0x2b8>
    bc9c:	0087f463          	bgeu	a5,s0,bca4 <__umoddi3+0x2b8>
    bca0:	014787b3          	add	a5,a5,s4
    bca4:	408787b3          	sub	a5,a5,s0
    bca8:	e71ff06f          	j	bb18 <__umoddi3+0x12c>
    bcac:	10063693          	sltiu	a3,a2,256
    bcb0:	0016b693          	seqz	a3,a3
    bcb4:	00369693          	sll	a3,a3,0x3
    bcb8:	d89ff06f          	j	ba40 <__umoddi3+0x54>
    bcbc:	00000513          	li	a0,0
    bcc0:	00004717          	auipc	a4,0x4
    bcc4:	aa070713          	add	a4,a4,-1376 # f760 <__clz_tab>
    bcc8:	00a70733          	add	a4,a4,a0
    bccc:	00074983          	lbu	s3,0(a4)
    bcd0:	00000693          	li	a3,0
    bcd4:	02000713          	li	a4,32
    bcd8:	00d989b3          	add	s3,s3,a3
    bcdc:	413704b3          	sub	s1,a4,s3
    bce0:	f33702e3          	beq	a4,s3,bc04 <__umoddi3+0x218>
    bce4:	00961a33          	sll	s4,a2,s1
    bce8:	01712623          	sw	s7,12(sp)
    bcec:	010a5a93          	srl	s5,s4,0x10
    bcf0:	0135dbb3          	srl	s7,a1,s3
    bcf4:	00959733          	sll	a4,a1,s1
    bcf8:	0137d9b3          	srl	s3,a5,s3
    bcfc:	000a8593          	mv	a1,s5
    bd00:	000b8513          	mv	a0,s7
    bd04:	010a1413          	sll	s0,s4,0x10
    bd08:	00e9e9b3          	or	s3,s3,a4
    bd0c:	00979933          	sll	s2,a5,s1
    bd10:	01612823          	sw	s6,16(sp)
    bd14:	01045413          	srl	s0,s0,0x10
    bd18:	6c1020ef          	jal	ebd8 <__hidden___udivsi3>
    bd1c:	00040593          	mv	a1,s0
    bd20:	5f5020ef          	jal	eb14 <__mulsi3>
    bd24:	00050b13          	mv	s6,a0
    bd28:	000a8593          	mv	a1,s5
    bd2c:	000b8513          	mv	a0,s7
    bd30:	6f1020ef          	jal	ec20 <__umodsi3>
    bd34:	01051513          	sll	a0,a0,0x10
    bd38:	0109d793          	srl	a5,s3,0x10
    bd3c:	00a7e7b3          	or	a5,a5,a0
    bd40:	0167fa63          	bgeu	a5,s6,bd54 <__umoddi3+0x368>
    bd44:	00fa07b3          	add	a5,s4,a5
    bd48:	0147e663          	bltu	a5,s4,bd54 <__umoddi3+0x368>
    bd4c:	0167f463          	bgeu	a5,s6,bd54 <__umoddi3+0x368>
    bd50:	014787b3          	add	a5,a5,s4
    bd54:	41678b33          	sub	s6,a5,s6
    bd58:	000a8593          	mv	a1,s5
    bd5c:	000b0513          	mv	a0,s6
    bd60:	679020ef          	jal	ebd8 <__hidden___udivsi3>
    bd64:	00040593          	mv	a1,s0
    bd68:	5ad020ef          	jal	eb14 <__mulsi3>
    bd6c:	00050793          	mv	a5,a0
    bd70:	000a8593          	mv	a1,s5
    bd74:	000b0513          	mv	a0,s6
    bd78:	01099993          	sll	s3,s3,0x10
    bd7c:	00078b13          	mv	s6,a5
    bd80:	6a1020ef          	jal	ec20 <__umodsi3>
    bd84:	01051513          	sll	a0,a0,0x10
    bd88:	0109d993          	srl	s3,s3,0x10
    bd8c:	00a9e9b3          	or	s3,s3,a0
    bd90:	0169fa63          	bgeu	s3,s6,bda4 <__umoddi3+0x3b8>
    bd94:	013a09b3          	add	s3,s4,s3
    bd98:	0149e663          	bltu	s3,s4,bda4 <__umoddi3+0x3b8>
    bd9c:	0169f463          	bgeu	s3,s6,bda4 <__umoddi3+0x3b8>
    bda0:	014989b3          	add	s3,s3,s4
    bda4:	416989b3          	sub	s3,s3,s6
    bda8:	00c12b83          	lw	s7,12(sp)
    bdac:	01012b03          	lw	s6,16(sp)
    bdb0:	e65ff06f          	j	bc14 <__umoddi3+0x228>
    bdb4:	1006b513          	sltiu	a0,a3,256
    bdb8:	00153513          	seqz	a0,a0
    bdbc:	00351513          	sll	a0,a0,0x3
    bdc0:	00a6d333          	srl	t1,a3,a0
    bdc4:	00004717          	auipc	a4,0x4
    bdc8:	99c70713          	add	a4,a4,-1636 # f760 <__clz_tab>
    bdcc:	00670733          	add	a4,a4,t1
    bdd0:	00074703          	lbu	a4,0(a4)
    bdd4:	02000313          	li	t1,32
    bdd8:	00a709b3          	add	s3,a4,a0
    bddc:	41330933          	sub	s2,t1,s3
    bde0:	db330ae3          	beq	t1,s3,bb94 <__umoddi3+0x1a8>
    bde4:	01512a23          	sw	s5,20(sp)
    bde8:	012696b3          	sll	a3,a3,s2
    bdec:	01365ab3          	srl	s5,a2,s3
    bdf0:	00daeab3          	or	s5,s5,a3
    bdf4:	01712623          	sw	s7,12(sp)
    bdf8:	01a12023          	sw	s10,0(sp)
    bdfc:	010adb93          	srl	s7,s5,0x10
    be00:	0135dd33          	srl	s10,a1,s3
    be04:	01259733          	sll	a4,a1,s2
    be08:	0137d6b3          	srl	a3,a5,s3
    be0c:	01912223          	sw	s9,4(sp)
    be10:	000b8593          	mv	a1,s7
    be14:	000d0513          	mv	a0,s10
    be18:	010a9c93          	sll	s9,s5,0x10
    be1c:	02812423          	sw	s0,40(sp)
    be20:	02912223          	sw	s1,36(sp)
    be24:	01261433          	sll	s0,a2,s2
    be28:	012794b3          	sll	s1,a5,s2
    be2c:	01412c23          	sw	s4,24(sp)
    be30:	01612823          	sw	s6,16(sp)
    be34:	00e6ea33          	or	s4,a3,a4
    be38:	01812423          	sw	s8,8(sp)
    be3c:	010cdc93          	srl	s9,s9,0x10
    be40:	599020ef          	jal	ebd8 <__hidden___udivsi3>
    be44:	00050593          	mv	a1,a0
    be48:	00050b13          	mv	s6,a0
    be4c:	000c8513          	mv	a0,s9
    be50:	4c5020ef          	jal	eb14 <__mulsi3>
    be54:	00050c13          	mv	s8,a0
    be58:	000b8593          	mv	a1,s7
    be5c:	000d0513          	mv	a0,s10
    be60:	5c1020ef          	jal	ec20 <__umodsi3>
    be64:	01051513          	sll	a0,a0,0x10
    be68:	010a5793          	srl	a5,s4,0x10
    be6c:	00a7e7b3          	or	a5,a5,a0
    be70:	0187fe63          	bgeu	a5,s8,be8c <__umoddi3+0x4a0>
    be74:	00fa87b3          	add	a5,s5,a5
    be78:	fffb0713          	add	a4,s6,-1
    be7c:	1957ee63          	bltu	a5,s5,c018 <__umoddi3+0x62c>
    be80:	1987fc63          	bgeu	a5,s8,c018 <__umoddi3+0x62c>
    be84:	ffeb0b13          	add	s6,s6,-2
    be88:	015787b3          	add	a5,a5,s5
    be8c:	41878c33          	sub	s8,a5,s8
    be90:	000b8593          	mv	a1,s7
    be94:	000c0513          	mv	a0,s8
    be98:	541020ef          	jal	ebd8 <__hidden___udivsi3>
    be9c:	00050593          	mv	a1,a0
    bea0:	00050d13          	mv	s10,a0
    bea4:	000c8513          	mv	a0,s9
    bea8:	46d020ef          	jal	eb14 <__mulsi3>
    beac:	00050793          	mv	a5,a0
    beb0:	000b8593          	mv	a1,s7
    beb4:	000c0513          	mv	a0,s8
    beb8:	00078b93          	mv	s7,a5
    bebc:	565020ef          	jal	ec20 <__umodsi3>
    bec0:	010a1593          	sll	a1,s4,0x10
    bec4:	01051513          	sll	a0,a0,0x10
    bec8:	0105d593          	srl	a1,a1,0x10
    becc:	00a5e5b3          	or	a1,a1,a0
    bed0:	0175fe63          	bgeu	a1,s7,beec <__umoddi3+0x500>
    bed4:	00ba85b3          	add	a1,s5,a1
    bed8:	fffd0793          	add	a5,s10,-1
    bedc:	1355ea63          	bltu	a1,s5,c010 <__umoddi3+0x624>
    bee0:	1375f863          	bgeu	a1,s7,c010 <__umoddi3+0x624>
    bee4:	ffed0d13          	add	s10,s10,-2
    bee8:	015585b3          	add	a1,a1,s5
    beec:	010b1793          	sll	a5,s6,0x10
    bef0:	00010e37          	lui	t3,0x10
    bef4:	01a7e7b3          	or	a5,a5,s10
    bef8:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    befc:	0067f8b3          	and	a7,a5,t1
    bf00:	00647333          	and	t1,s0,t1
    bf04:	41758733          	sub	a4,a1,s7
    bf08:	0107d793          	srl	a5,a5,0x10
    bf0c:	01045e93          	srl	t4,s0,0x10
    bf10:	00088513          	mv	a0,a7
    bf14:	00030593          	mv	a1,t1
    bf18:	3fd020ef          	jal	eb14 <__mulsi3>
    bf1c:	00050813          	mv	a6,a0
    bf20:	000e8593          	mv	a1,t4
    bf24:	00088513          	mv	a0,a7
    bf28:	3ed020ef          	jal	eb14 <__mulsi3>
    bf2c:	00050893          	mv	a7,a0
    bf30:	00030593          	mv	a1,t1
    bf34:	00078513          	mv	a0,a5
    bf38:	3dd020ef          	jal	eb14 <__mulsi3>
    bf3c:	00050313          	mv	t1,a0
    bf40:	000e8593          	mv	a1,t4
    bf44:	00078513          	mv	a0,a5
    bf48:	3cd020ef          	jal	eb14 <__mulsi3>
    bf4c:	01085793          	srl	a5,a6,0x10
    bf50:	006888b3          	add	a7,a7,t1
    bf54:	011787b3          	add	a5,a5,a7
    bf58:	0067f463          	bgeu	a5,t1,bf60 <__umoddi3+0x574>
    bf5c:	01c50533          	add	a0,a0,t3
    bf60:	00010637          	lui	a2,0x10
    bf64:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    bf68:	0107d693          	srl	a3,a5,0x10
    bf6c:	00c7f7b3          	and	a5,a5,a2
    bf70:	01079793          	sll	a5,a5,0x10
    bf74:	00c87833          	and	a6,a6,a2
    bf78:	00a686b3          	add	a3,a3,a0
    bf7c:	010787b3          	add	a5,a5,a6
    bf80:	06d76263          	bltu	a4,a3,bfe4 <__umoddi3+0x5f8>
    bf84:	04d70e63          	beq	a4,a3,bfe0 <__umoddi3+0x5f4>
    bf88:	40f487b3          	sub	a5,s1,a5
    bf8c:	00f4b4b3          	sltu	s1,s1,a5
    bf90:	02812403          	lw	s0,40(sp)
    bf94:	02c12083          	lw	ra,44(sp)
    bf98:	40d705b3          	sub	a1,a4,a3
    bf9c:	409585b3          	sub	a1,a1,s1
    bfa0:	01359733          	sll	a4,a1,s3
    bfa4:	0127d7b3          	srl	a5,a5,s2
    bfa8:	02412483          	lw	s1,36(sp)
    bfac:	01c12983          	lw	s3,28(sp)
    bfb0:	01812a03          	lw	s4,24(sp)
    bfb4:	01412a83          	lw	s5,20(sp)
    bfb8:	01012b03          	lw	s6,16(sp)
    bfbc:	00c12b83          	lw	s7,12(sp)
    bfc0:	00812c03          	lw	s8,8(sp)
    bfc4:	00412c83          	lw	s9,4(sp)
    bfc8:	00012d03          	lw	s10,0(sp)
    bfcc:	0125d5b3          	srl	a1,a1,s2
    bfd0:	00f76533          	or	a0,a4,a5
    bfd4:	02012903          	lw	s2,32(sp)
    bfd8:	03010113          	add	sp,sp,48
    bfdc:	00008067          	ret
    bfe0:	faf4f4e3          	bgeu	s1,a5,bf88 <__umoddi3+0x59c>
    bfe4:	40878433          	sub	s0,a5,s0
    bfe8:	0087b7b3          	sltu	a5,a5,s0
    bfec:	01578ab3          	add	s5,a5,s5
    bff0:	415686b3          	sub	a3,a3,s5
    bff4:	00040793          	mv	a5,s0
    bff8:	f91ff06f          	j	bf88 <__umoddi3+0x59c>
    bffc:	01000737          	lui	a4,0x1000
    c000:	02e67c63          	bgeu	a2,a4,c038 <__umoddi3+0x64c>
    c004:	01065513          	srl	a0,a2,0x10
    c008:	01000693          	li	a3,16
    c00c:	bd9ff06f          	j	bbe4 <__umoddi3+0x1f8>
    c010:	00078d13          	mv	s10,a5
    c014:	ed9ff06f          	j	beec <__umoddi3+0x500>
    c018:	00070b13          	mv	s6,a4
    c01c:	e71ff06f          	j	be8c <__umoddi3+0x4a0>
    c020:	014787b3          	add	a5,a5,s4
    c024:	aedff06f          	j	bb10 <__umoddi3+0x124>
    c028:	014787b3          	add	a5,a5,s4
    c02c:	c2dff06f          	j	bc58 <__umoddi3+0x26c>
    c030:	014787b3          	add	a5,a5,s4
    c034:	a91ff06f          	j	bac4 <__umoddi3+0xd8>
    c038:	01865513          	srl	a0,a2,0x18
    c03c:	01800693          	li	a3,24
    c040:	ba5ff06f          	j	bbe4 <__umoddi3+0x1f8>

0000c044 <__adddf3>:
    c044:	001007b7          	lui	a5,0x100
    c048:	fe010113          	add	sp,sp,-32
    c04c:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c050:	00bef833          	and	a6,t4,a1
    c054:	00def7b3          	and	a5,t4,a3
    c058:	0146d313          	srl	t1,a3,0x14
    c05c:	01212823          	sw	s2,16(sp)
    c060:	0145d913          	srl	s2,a1,0x14
    c064:	00379793          	sll	a5,a5,0x3
    c068:	00812c23          	sw	s0,24(sp)
    c06c:	00381813          	sll	a6,a6,0x3
    c070:	01f5d413          	srl	s0,a1,0x1f
    c074:	01d55713          	srl	a4,a0,0x1d
    c078:	01d65893          	srl	a7,a2,0x1d
    c07c:	7ff97913          	and	s2,s2,2047
    c080:	7ff37313          	and	t1,t1,2047
    c084:	00112e23          	sw	ra,28(sp)
    c088:	00912a23          	sw	s1,20(sp)
    c08c:	01312623          	sw	s3,12(sp)
    c090:	01f6d693          	srl	a3,a3,0x1f
    c094:	00f8e8b3          	or	a7,a7,a5
    c098:	01076733          	or	a4,a4,a6
    c09c:	00351593          	sll	a1,a0,0x3
    c0a0:	00361f13          	sll	t5,a2,0x3
    c0a4:	406907b3          	sub	a5,s2,t1
    c0a8:	1ed40463          	beq	s0,a3,c290 <__adddf3+0x24c>
    c0ac:	16f05263          	blez	a5,c210 <__adddf3+0x1cc>
    c0b0:	28030663          	beqz	t1,c33c <__adddf3+0x2f8>
    c0b4:	7ff00693          	li	a3,2047
    c0b8:	42d90663          	beq	s2,a3,c4e4 <__adddf3+0x4a0>
    c0bc:	03800693          	li	a3,56
    c0c0:	00100613          	li	a2,1
    c0c4:	02f6ce63          	blt	a3,a5,c100 <__adddf3+0xbc>
    c0c8:	008006b7          	lui	a3,0x800
    c0cc:	00d8e8b3          	or	a7,a7,a3
    c0d0:	01f00693          	li	a3,31
    c0d4:	52f6ce63          	blt	a3,a5,c610 <__adddf3+0x5cc>
    c0d8:	02000693          	li	a3,32
    c0dc:	40f686b3          	sub	a3,a3,a5
    c0e0:	00d89633          	sll	a2,a7,a3
    c0e4:	00ff5533          	srl	a0,t5,a5
    c0e8:	00df16b3          	sll	a3,t5,a3
    c0ec:	00a66633          	or	a2,a2,a0
    c0f0:	00d036b3          	snez	a3,a3
    c0f4:	00f8d8b3          	srl	a7,a7,a5
    c0f8:	00d66633          	or	a2,a2,a3
    c0fc:	41170733          	sub	a4,a4,a7
    c100:	40c58633          	sub	a2,a1,a2
    c104:	00c5b5b3          	sltu	a1,a1,a2
    c108:	00060493          	mv	s1,a2
    c10c:	40b709b3          	sub	s3,a4,a1
    c110:	00899793          	sll	a5,s3,0x8
    c114:	3207da63          	bgez	a5,c448 <__adddf3+0x404>
    c118:	008007b7          	lui	a5,0x800
    c11c:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c120:	00f9f9b3          	and	s3,s3,a5
    c124:	2c098863          	beqz	s3,c3f4 <__adddf3+0x3b0>
    c128:	00098513          	mv	a0,s3
    c12c:	359020ef          	jal	ec84 <__clzsi2>
    c130:	ff850793          	add	a5,a0,-8
    c134:	02000693          	li	a3,32
    c138:	40f68733          	sub	a4,a3,a5
    c13c:	00e4d733          	srl	a4,s1,a4
    c140:	00f999b3          	sll	s3,s3,a5
    c144:	01376733          	or	a4,a4,s3
    c148:	00f494b3          	sll	s1,s1,a5
    c14c:	4b27c863          	blt	a5,s2,c5fc <__adddf3+0x5b8>
    c150:	412787b3          	sub	a5,a5,s2
    c154:	00178793          	add	a5,a5,1
    c158:	40f686b3          	sub	a3,a3,a5
    c15c:	00d49633          	sll	a2,s1,a3
    c160:	00f4d9b3          	srl	s3,s1,a5
    c164:	00c03633          	snez	a2,a2
    c168:	01366633          	or	a2,a2,s3
    c16c:	00d716b3          	sll	a3,a4,a3
    c170:	00c6e4b3          	or	s1,a3,a2
    c174:	00f759b3          	srl	s3,a4,a5
    c178:	00000913          	li	s2,0
    c17c:	0074f793          	and	a5,s1,7
    c180:	02078063          	beqz	a5,c1a0 <__adddf3+0x15c>
    c184:	00f4f793          	and	a5,s1,15
    c188:	00400713          	li	a4,4
    c18c:	00e78a63          	beq	a5,a4,c1a0 <__adddf3+0x15c>
    c190:	00448793          	add	a5,s1,4
    c194:	0097b633          	sltu	a2,a5,s1
    c198:	00c989b3          	add	s3,s3,a2
    c19c:	00078493          	mv	s1,a5
    c1a0:	00899793          	sll	a5,s3,0x8
    c1a4:	6e07da63          	bgez	a5,c898 <__adddf3+0x854>
    c1a8:	00190793          	add	a5,s2,1
    c1ac:	7ff00713          	li	a4,2047
    c1b0:	00040e13          	mv	t3,s0
    c1b4:	2ae78663          	beq	a5,a4,c460 <__adddf3+0x41c>
    c1b8:	ff800737          	lui	a4,0xff800
    c1bc:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c1c0:	00e9f733          	and	a4,s3,a4
    c1c4:	7ff7f793          	and	a5,a5,2047
    c1c8:	01d71813          	sll	a6,a4,0x1d
    c1cc:	0034d613          	srl	a2,s1,0x3
    c1d0:	00971713          	sll	a4,a4,0x9
    c1d4:	00c86833          	or	a6,a6,a2
    c1d8:	00c75713          	srl	a4,a4,0xc
    c1dc:	01c12083          	lw	ra,28(sp)
    c1e0:	01812403          	lw	s0,24(sp)
    c1e4:	01479793          	sll	a5,a5,0x14
    c1e8:	00e7e7b3          	or	a5,a5,a4
    c1ec:	01fe1713          	sll	a4,t3,0x1f
    c1f0:	00e7e7b3          	or	a5,a5,a4
    c1f4:	01412483          	lw	s1,20(sp)
    c1f8:	01012903          	lw	s2,16(sp)
    c1fc:	00c12983          	lw	s3,12(sp)
    c200:	00080513          	mv	a0,a6
    c204:	00078593          	mv	a1,a5
    c208:	02010113          	add	sp,sp,32
    c20c:	00008067          	ret
    c210:	14078c63          	beqz	a5,c368 <__adddf3+0x324>
    c214:	412307b3          	sub	a5,t1,s2
    c218:	3c091263          	bnez	s2,c5dc <__adddf3+0x598>
    c21c:	00b76533          	or	a0,a4,a1
    c220:	4c050463          	beqz	a0,c6e8 <__adddf3+0x6a4>
    c224:	fff78513          	add	a0,a5,-1
    c228:	60050263          	beqz	a0,c82c <__adddf3+0x7e8>
    c22c:	7ff00813          	li	a6,2047
    c230:	57078663          	beq	a5,a6,c79c <__adddf3+0x758>
    c234:	03800793          	li	a5,56
    c238:	00100613          	li	a2,1
    c23c:	02a7cc63          	blt	a5,a0,c274 <__adddf3+0x230>
    c240:	00050793          	mv	a5,a0
    c244:	01f00613          	li	a2,31
    c248:	56f64c63          	blt	a2,a5,c7c0 <__adddf3+0x77c>
    c24c:	02000513          	li	a0,32
    c250:	40f50533          	sub	a0,a0,a5
    c254:	00a71633          	sll	a2,a4,a0
    c258:	00f5d833          	srl	a6,a1,a5
    c25c:	00a59533          	sll	a0,a1,a0
    c260:	01066633          	or	a2,a2,a6
    c264:	00a03533          	snez	a0,a0
    c268:	00f75733          	srl	a4,a4,a5
    c26c:	00a66633          	or	a2,a2,a0
    c270:	40e888b3          	sub	a7,a7,a4
    c274:	40cf0633          	sub	a2,t5,a2
    c278:	00cf3733          	sltu	a4,t5,a2
    c27c:	00060493          	mv	s1,a2
    c280:	40e889b3          	sub	s3,a7,a4
    c284:	00030913          	mv	s2,t1
    c288:	00068413          	mv	s0,a3
    c28c:	e85ff06f          	j	c110 <__adddf3+0xcc>
    c290:	1ef05063          	blez	a5,c470 <__adddf3+0x42c>
    c294:	14031063          	bnez	t1,c3d4 <__adddf3+0x390>
    c298:	01e8e6b3          	or	a3,a7,t5
    c29c:	26068c63          	beqz	a3,c514 <__adddf3+0x4d0>
    c2a0:	fff78693          	add	a3,a5,-1
    c2a4:	48068063          	beqz	a3,c724 <__adddf3+0x6e0>
    c2a8:	7ff00613          	li	a2,2047
    c2ac:	22c78c63          	beq	a5,a2,c4e4 <__adddf3+0x4a0>
    c2b0:	03800793          	li	a5,56
    c2b4:	00100993          	li	s3,1
    c2b8:	02d7cc63          	blt	a5,a3,c2f0 <__adddf3+0x2ac>
    c2bc:	00068793          	mv	a5,a3
    c2c0:	01f00693          	li	a3,31
    c2c4:	4af6c063          	blt	a3,a5,c764 <__adddf3+0x720>
    c2c8:	02000693          	li	a3,32
    c2cc:	40f686b3          	sub	a3,a3,a5
    c2d0:	00d899b3          	sll	s3,a7,a3
    c2d4:	00ff5633          	srl	a2,t5,a5
    c2d8:	00df16b3          	sll	a3,t5,a3
    c2dc:	00c9e9b3          	or	s3,s3,a2
    c2e0:	00d036b3          	snez	a3,a3
    c2e4:	00f8d8b3          	srl	a7,a7,a5
    c2e8:	00d9e9b3          	or	s3,s3,a3
    c2ec:	01170733          	add	a4,a4,a7
    c2f0:	00b985b3          	add	a1,s3,a1
    c2f4:	0135b9b3          	sltu	s3,a1,s3
    c2f8:	00058493          	mv	s1,a1
    c2fc:	00e989b3          	add	s3,s3,a4
    c300:	00899793          	sll	a5,s3,0x8
    c304:	1407d263          	bgez	a5,c448 <__adddf3+0x404>
    c308:	00190913          	add	s2,s2,1
    c30c:	7ff00793          	li	a5,2047
    c310:	36f90c63          	beq	s2,a5,c688 <__adddf3+0x644>
    c314:	ff8007b7          	lui	a5,0xff800
    c318:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c31c:	0014f613          	and	a2,s1,1
    c320:	00f9f7b3          	and	a5,s3,a5
    c324:	0014d713          	srl	a4,s1,0x1
    c328:	00c76733          	or	a4,a4,a2
    c32c:	01f79613          	sll	a2,a5,0x1f
    c330:	00e664b3          	or	s1,a2,a4
    c334:	0017d993          	srl	s3,a5,0x1
    c338:	e45ff06f          	j	c17c <__adddf3+0x138>
    c33c:	01e8e6b3          	or	a3,a7,t5
    c340:	1c068a63          	beqz	a3,c514 <__adddf3+0x4d0>
    c344:	fff78693          	add	a3,a5,-1
    c348:	40068063          	beqz	a3,c748 <__adddf3+0x704>
    c34c:	7ff00613          	li	a2,2047
    c350:	18c78a63          	beq	a5,a2,c4e4 <__adddf3+0x4a0>
    c354:	03800793          	li	a5,56
    c358:	00100613          	li	a2,1
    c35c:	dad7c2e3          	blt	a5,a3,c100 <__adddf3+0xbc>
    c360:	00068793          	mv	a5,a3
    c364:	d6dff06f          	j	c0d0 <__adddf3+0x8c>
    c368:	00190813          	add	a6,s2,1
    c36c:	7fe87813          	and	a6,a6,2046
    c370:	22081c63          	bnez	a6,c5a8 <__adddf3+0x564>
    c374:	00b76333          	or	t1,a4,a1
    c378:	01e8e833          	or	a6,a7,t5
    c37c:	38091063          	bnez	s2,c6fc <__adddf3+0x6b8>
    c380:	46030e63          	beqz	t1,c7fc <__adddf3+0x7b8>
    c384:	40080663          	beqz	a6,c790 <__adddf3+0x74c>
    c388:	41e589b3          	sub	s3,a1,t5
    c38c:	0135b533          	sltu	a0,a1,s3
    c390:	41170633          	sub	a2,a4,a7
    c394:	40a60633          	sub	a2,a2,a0
    c398:	00861513          	sll	a0,a2,0x8
    c39c:	50055e63          	bgez	a0,c8b8 <__adddf3+0x874>
    c3a0:	40bf05b3          	sub	a1,t5,a1
    c3a4:	40e88733          	sub	a4,a7,a4
    c3a8:	00bf3f33          	sltu	t5,t5,a1
    c3ac:	41e70733          	sub	a4,a4,t5
    c3b0:	00871613          	sll	a2,a4,0x8
    c3b4:	00058493          	mv	s1,a1
    c3b8:	52065e63          	bgez	a2,c8f4 <__adddf3+0x8b0>
    c3bc:	ff8007b7          	lui	a5,0xff800
    c3c0:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c3c4:	00f77733          	and	a4,a4,a5
    c3c8:	00068e13          	mv	t3,a3
    c3cc:	00100793          	li	a5,1
    c3d0:	df9ff06f          	j	c1c8 <__adddf3+0x184>
    c3d4:	7ff00693          	li	a3,2047
    c3d8:	10d90663          	beq	s2,a3,c4e4 <__adddf3+0x4a0>
    c3dc:	03800693          	li	a3,56
    c3e0:	00100993          	li	s3,1
    c3e4:	f0f6c6e3          	blt	a3,a5,c2f0 <__adddf3+0x2ac>
    c3e8:	008006b7          	lui	a3,0x800
    c3ec:	00d8e8b3          	or	a7,a7,a3
    c3f0:	ed1ff06f          	j	c2c0 <__adddf3+0x27c>
    c3f4:	00048513          	mv	a0,s1
    c3f8:	08d020ef          	jal	ec84 <__clzsi2>
    c3fc:	01850793          	add	a5,a0,24
    c400:	01f00693          	li	a3,31
    c404:	d2f6d8e3          	bge	a3,a5,c134 <__adddf3+0xf0>
    c408:	ff850713          	add	a4,a0,-8
    c40c:	00e49733          	sll	a4,s1,a4
    c410:	2327c663          	blt	a5,s2,c63c <__adddf3+0x5f8>
    c414:	41278933          	sub	s2,a5,s2
    c418:	00190793          	add	a5,s2,1
    c41c:	48f6d663          	bge	a3,a5,c8a8 <__adddf3+0x864>
    c420:	fe190913          	add	s2,s2,-31
    c424:	02000693          	li	a3,32
    c428:	012754b3          	srl	s1,a4,s2
    c42c:	00d78c63          	beq	a5,a3,c444 <__adddf3+0x400>
    c430:	04000693          	li	a3,64
    c434:	40f687b3          	sub	a5,a3,a5
    c438:	00f71733          	sll	a4,a4,a5
    c43c:	00e03733          	snez	a4,a4
    c440:	00e4e4b3          	or	s1,s1,a4
    c444:	00000913          	li	s2,0
    c448:	0074f793          	and	a5,s1,7
    c44c:	d2079ce3          	bnez	a5,c184 <__adddf3+0x140>
    c450:	00090793          	mv	a5,s2
    c454:	0034d613          	srl	a2,s1,0x3
    c458:	00098713          	mv	a4,s3
    c45c:	0c00006f          	j	c51c <__adddf3+0x4d8>
    c460:	7ff00793          	li	a5,2047
    c464:	00000713          	li	a4,0
    c468:	00000813          	li	a6,0
    c46c:	d71ff06f          	j	c1dc <__adddf3+0x198>
    c470:	0c078a63          	beqz	a5,c544 <__adddf3+0x500>
    c474:	412307b3          	sub	a5,t1,s2
    c478:	1e090263          	beqz	s2,c65c <__adddf3+0x618>
    c47c:	7ff00693          	li	a3,2047
    c480:	32d30863          	beq	t1,a3,c7b0 <__adddf3+0x76c>
    c484:	03800693          	li	a3,56
    c488:	00100993          	li	s3,1
    c48c:	02f6ce63          	blt	a3,a5,c4c8 <__adddf3+0x484>
    c490:	008006b7          	lui	a3,0x800
    c494:	00d76733          	or	a4,a4,a3
    c498:	01f00693          	li	a3,31
    c49c:	3cf6c863          	blt	a3,a5,c86c <__adddf3+0x828>
    c4a0:	02000693          	li	a3,32
    c4a4:	40f686b3          	sub	a3,a3,a5
    c4a8:	00d719b3          	sll	s3,a4,a3
    c4ac:	00f5d633          	srl	a2,a1,a5
    c4b0:	00d596b3          	sll	a3,a1,a3
    c4b4:	00c9e9b3          	or	s3,s3,a2
    c4b8:	00d036b3          	snez	a3,a3
    c4bc:	00f75733          	srl	a4,a4,a5
    c4c0:	00d9e9b3          	or	s3,s3,a3
    c4c4:	00e888b3          	add	a7,a7,a4
    c4c8:	01e98733          	add	a4,s3,t5
    c4cc:	013739b3          	sltu	s3,a4,s3
    c4d0:	00070493          	mv	s1,a4
    c4d4:	011989b3          	add	s3,s3,a7
    c4d8:	00030913          	mv	s2,t1
    c4dc:	e25ff06f          	j	c300 <__adddf3+0x2bc>
    c4e0:	02081063          	bnez	a6,c500 <__adddf3+0x4bc>
    c4e4:	00351613          	sll	a2,a0,0x3
    c4e8:	00365613          	srl	a2,a2,0x3
    c4ec:	01d71813          	sll	a6,a4,0x1d
    c4f0:	00c86833          	or	a6,a6,a2
    c4f4:	00375713          	srl	a4,a4,0x3
    c4f8:	01076733          	or	a4,a4,a6
    c4fc:	18070663          	beqz	a4,c688 <__adddf3+0x644>
    c500:	00000e13          	li	t3,0
    c504:	7ff00793          	li	a5,2047
    c508:	00080737          	lui	a4,0x80
    c50c:	00000813          	li	a6,0
    c510:	ccdff06f          	j	c1dc <__adddf3+0x198>
    c514:	00351613          	sll	a2,a0,0x3
    c518:	00365613          	srl	a2,a2,0x3
    c51c:	01d71813          	sll	a6,a4,0x1d
    c520:	7ff00693          	li	a3,2047
    c524:	00c86833          	or	a6,a6,a2
    c528:	00375713          	srl	a4,a4,0x3
    c52c:	fcd786e3          	beq	a5,a3,c4f8 <__adddf3+0x4b4>
    c530:	00c71713          	sll	a4,a4,0xc
    c534:	00c75713          	srl	a4,a4,0xc
    c538:	7ff7f793          	and	a5,a5,2047
    c53c:	00040e13          	mv	t3,s0
    c540:	c9dff06f          	j	c1dc <__adddf3+0x198>
    c544:	00190693          	add	a3,s2,1
    c548:	7fe6f813          	and	a6,a3,2046
    c54c:	14081863          	bnez	a6,c69c <__adddf3+0x658>
    c550:	00b766b3          	or	a3,a4,a1
    c554:	28091c63          	bnez	s2,c7ec <__adddf3+0x7a8>
    c558:	30068263          	beqz	a3,c85c <__adddf3+0x818>
    c55c:	01e8e6b3          	or	a3,a7,t5
    c560:	22068863          	beqz	a3,c790 <__adddf3+0x74c>
    c564:	01e587b3          	add	a5,a1,t5
    c568:	00b7b5b3          	sltu	a1,a5,a1
    c56c:	01170733          	add	a4,a4,a7
    c570:	00b70733          	add	a4,a4,a1
    c574:	0037d813          	srl	a6,a5,0x3
    c578:	00871793          	sll	a5,a4,0x8
    c57c:	00040e13          	mv	t3,s0
    c580:	3407de63          	bgez	a5,c8dc <__adddf3+0x898>
    c584:	ff8007b7          	lui	a5,0xff800
    c588:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c58c:	00f77733          	and	a4,a4,a5
    c590:	01d71793          	sll	a5,a4,0x1d
    c594:	00375713          	srl	a4,a4,0x3
    c598:	0107e833          	or	a6,a5,a6
    c59c:	01d77733          	and	a4,a4,t4
    c5a0:	00100793          	li	a5,1
    c5a4:	c39ff06f          	j	c1dc <__adddf3+0x198>
    c5a8:	41e58833          	sub	a6,a1,t5
    c5ac:	0105b7b3          	sltu	a5,a1,a6
    c5b0:	411709b3          	sub	s3,a4,a7
    c5b4:	40f989b3          	sub	s3,s3,a5
    c5b8:	00899793          	sll	a5,s3,0x8
    c5bc:	00080493          	mv	s1,a6
    c5c0:	1007c663          	bltz	a5,c6cc <__adddf3+0x688>
    c5c4:	01386833          	or	a6,a6,s3
    c5c8:	b4081ee3          	bnez	a6,c124 <__adddf3+0xe0>
    c5cc:	00000e13          	li	t3,0
    c5d0:	00000793          	li	a5,0
    c5d4:	00000713          	li	a4,0
    c5d8:	c05ff06f          	j	c1dc <__adddf3+0x198>
    c5dc:	7ff00513          	li	a0,2047
    c5e0:	1aa30e63          	beq	t1,a0,c79c <__adddf3+0x758>
    c5e4:	03800513          	li	a0,56
    c5e8:	00100613          	li	a2,1
    c5ec:	c8f544e3          	blt	a0,a5,c274 <__adddf3+0x230>
    c5f0:	00800637          	lui	a2,0x800
    c5f4:	00c76733          	or	a4,a4,a2
    c5f8:	c4dff06f          	j	c244 <__adddf3+0x200>
    c5fc:	ff8009b7          	lui	s3,0xff800
    c600:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c604:	40f90933          	sub	s2,s2,a5
    c608:	013779b3          	and	s3,a4,s3
    c60c:	b71ff06f          	j	c17c <__adddf3+0x138>
    c610:	fe078693          	add	a3,a5,-32
    c614:	02000613          	li	a2,32
    c618:	00d8d6b3          	srl	a3,a7,a3
    c61c:	00c78a63          	beq	a5,a2,c630 <__adddf3+0x5ec>
    c620:	04000613          	li	a2,64
    c624:	40f607b3          	sub	a5,a2,a5
    c628:	00f897b3          	sll	a5,a7,a5
    c62c:	00ff6f33          	or	t5,t5,a5
    c630:	01e03633          	snez	a2,t5
    c634:	00d66633          	or	a2,a2,a3
    c638:	ac9ff06f          	j	c100 <__adddf3+0xbc>
    c63c:	ff8006b7          	lui	a3,0xff800
    c640:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c644:	40f907b3          	sub	a5,s2,a5
    c648:	00d77733          	and	a4,a4,a3
    c64c:	01d71813          	sll	a6,a4,0x1d
    c650:	01386833          	or	a6,a6,s3
    c654:	00375713          	srl	a4,a4,0x3
    c658:	ed9ff06f          	j	c530 <__adddf3+0x4ec>
    c65c:	00b766b3          	or	a3,a4,a1
    c660:	1e068663          	beqz	a3,c84c <__adddf3+0x808>
    c664:	fff78693          	add	a3,a5,-1
    c668:	0a068e63          	beqz	a3,c724 <__adddf3+0x6e0>
    c66c:	7ff00513          	li	a0,2047
    c670:	14a78063          	beq	a5,a0,c7b0 <__adddf3+0x76c>
    c674:	03800793          	li	a5,56
    c678:	00100993          	li	s3,1
    c67c:	e4d7c6e3          	blt	a5,a3,c4c8 <__adddf3+0x484>
    c680:	00068793          	mv	a5,a3
    c684:	e15ff06f          	j	c498 <__adddf3+0x454>
    c688:	00040e13          	mv	t3,s0
    c68c:	7ff00793          	li	a5,2047
    c690:	00000713          	li	a4,0
    c694:	00000813          	li	a6,0
    c698:	b45ff06f          	j	c1dc <__adddf3+0x198>
    c69c:	7ff00793          	li	a5,2047
    c6a0:	fef684e3          	beq	a3,a5,c688 <__adddf3+0x644>
    c6a4:	01e58f33          	add	t5,a1,t5
    c6a8:	00bf35b3          	sltu	a1,t5,a1
    c6ac:	011707b3          	add	a5,a4,a7
    c6b0:	00b787b3          	add	a5,a5,a1
    c6b4:	01f79613          	sll	a2,a5,0x1f
    c6b8:	001f5f13          	srl	t5,t5,0x1
    c6bc:	01e664b3          	or	s1,a2,t5
    c6c0:	0017d993          	srl	s3,a5,0x1
    c6c4:	00068913          	mv	s2,a3
    c6c8:	ab5ff06f          	j	c17c <__adddf3+0x138>
    c6cc:	40bf0633          	sub	a2,t5,a1
    c6d0:	40e887b3          	sub	a5,a7,a4
    c6d4:	00cf3733          	sltu	a4,t5,a2
    c6d8:	00060493          	mv	s1,a2
    c6dc:	40e789b3          	sub	s3,a5,a4
    c6e0:	00068413          	mv	s0,a3
    c6e4:	a41ff06f          	j	c124 <__adddf3+0xe0>
    c6e8:	00361613          	sll	a2,a2,0x3
    c6ec:	00365613          	srl	a2,a2,0x3
    c6f0:	00068413          	mv	s0,a3
    c6f4:	00088713          	mv	a4,a7
    c6f8:	e25ff06f          	j	c51c <__adddf3+0x4d8>
    c6fc:	de0312e3          	bnez	t1,c4e0 <__adddf3+0x49c>
    c700:	1c080663          	beqz	a6,c8cc <__adddf3+0x888>
    c704:	0038d713          	srl	a4,a7,0x3
    c708:	00361613          	sll	a2,a2,0x3
    c70c:	01d89893          	sll	a7,a7,0x1d
    c710:	01176733          	or	a4,a4,a7
    c714:	00365613          	srl	a2,a2,0x3
    c718:	00c76733          	or	a4,a4,a2
    c71c:	00068413          	mv	s0,a3
    c720:	dddff06f          	j	c4fc <__adddf3+0x4b8>
    c724:	01e58f33          	add	t5,a1,t5
    c728:	011708b3          	add	a7,a4,a7
    c72c:	00bf35b3          	sltu	a1,t5,a1
    c730:	00b889b3          	add	s3,a7,a1
    c734:	00899793          	sll	a5,s3,0x8
    c738:	000f0493          	mv	s1,t5
    c73c:	0e07d463          	bgez	a5,c824 <__adddf3+0x7e0>
    c740:	00200913          	li	s2,2
    c744:	bd1ff06f          	j	c314 <__adddf3+0x2d0>
    c748:	41e58f33          	sub	t5,a1,t5
    c74c:	411708b3          	sub	a7,a4,a7
    c750:	01e5b5b3          	sltu	a1,a1,t5
    c754:	000f0493          	mv	s1,t5
    c758:	40b889b3          	sub	s3,a7,a1
    c75c:	00100913          	li	s2,1
    c760:	9b1ff06f          	j	c110 <__adddf3+0xcc>
    c764:	fe078693          	add	a3,a5,-32
    c768:	02000613          	li	a2,32
    c76c:	00d8d6b3          	srl	a3,a7,a3
    c770:	00c78a63          	beq	a5,a2,c784 <__adddf3+0x740>
    c774:	04000613          	li	a2,64
    c778:	40f607b3          	sub	a5,a2,a5
    c77c:	00f897b3          	sll	a5,a7,a5
    c780:	00ff6f33          	or	t5,t5,a5
    c784:	01e039b3          	snez	s3,t5
    c788:	00d9e9b3          	or	s3,s3,a3
    c78c:	b65ff06f          	j	c2f0 <__adddf3+0x2ac>
    c790:	00351613          	sll	a2,a0,0x3
    c794:	00365993          	srl	s3,a2,0x3
    c798:	eb5ff06f          	j	c64c <__adddf3+0x608>
    c79c:	00361613          	sll	a2,a2,0x3
    c7a0:	00365613          	srl	a2,a2,0x3
    c7a4:	00068413          	mv	s0,a3
    c7a8:	00088713          	mv	a4,a7
    c7ac:	d41ff06f          	j	c4ec <__adddf3+0x4a8>
    c7b0:	00361613          	sll	a2,a2,0x3
    c7b4:	00365613          	srl	a2,a2,0x3
    c7b8:	00088713          	mv	a4,a7
    c7bc:	d31ff06f          	j	c4ec <__adddf3+0x4a8>
    c7c0:	fe078513          	add	a0,a5,-32
    c7c4:	02000613          	li	a2,32
    c7c8:	00a75533          	srl	a0,a4,a0
    c7cc:	00c78a63          	beq	a5,a2,c7e0 <__adddf3+0x79c>
    c7d0:	04000613          	li	a2,64
    c7d4:	40f607b3          	sub	a5,a2,a5
    c7d8:	00f717b3          	sll	a5,a4,a5
    c7dc:	00f5e5b3          	or	a1,a1,a5
    c7e0:	00b03633          	snez	a2,a1
    c7e4:	00a66633          	or	a2,a2,a0
    c7e8:	a8dff06f          	j	c274 <__adddf3+0x230>
    c7ec:	fc0682e3          	beqz	a3,c7b0 <__adddf3+0x76c>
    c7f0:	01e8ef33          	or	t5,a7,t5
    c7f4:	d00f16e3          	bnez	t5,c500 <__adddf3+0x4bc>
    c7f8:	cedff06f          	j	c4e4 <__adddf3+0x4a0>
    c7fc:	dc0808e3          	beqz	a6,c5cc <__adddf3+0x588>
    c800:	00361813          	sll	a6,a2,0x3
    c804:	01d89793          	sll	a5,a7,0x1d
    c808:	00385813          	srl	a6,a6,0x3
    c80c:	0038d713          	srl	a4,a7,0x3
    c810:	00f86833          	or	a6,a6,a5
    c814:	01d77733          	and	a4,a4,t4
    c818:	00068e13          	mv	t3,a3
    c81c:	00000793          	li	a5,0
    c820:	9bdff06f          	j	c1dc <__adddf3+0x198>
    c824:	00100793          	li	a5,1
    c828:	c2dff06f          	j	c454 <__adddf3+0x410>
    c82c:	40bf05b3          	sub	a1,t5,a1
    c830:	40e888b3          	sub	a7,a7,a4
    c834:	00bf3733          	sltu	a4,t5,a1
    c838:	00058493          	mv	s1,a1
    c83c:	40e889b3          	sub	s3,a7,a4
    c840:	00068413          	mv	s0,a3
    c844:	00100913          	li	s2,1
    c848:	8c9ff06f          	j	c110 <__adddf3+0xcc>
    c84c:	00361613          	sll	a2,a2,0x3
    c850:	00365613          	srl	a2,a2,0x3
    c854:	00088713          	mv	a4,a7
    c858:	cc5ff06f          	j	c51c <__adddf3+0x4d8>
    c85c:	00361613          	sll	a2,a2,0x3
    c860:	00365993          	srl	s3,a2,0x3
    c864:	00088713          	mv	a4,a7
    c868:	de5ff06f          	j	c64c <__adddf3+0x608>
    c86c:	fe078693          	add	a3,a5,-32
    c870:	02000613          	li	a2,32
    c874:	00d756b3          	srl	a3,a4,a3
    c878:	00c78a63          	beq	a5,a2,c88c <__adddf3+0x848>
    c87c:	04000613          	li	a2,64
    c880:	40f607b3          	sub	a5,a2,a5
    c884:	00f717b3          	sll	a5,a4,a5
    c888:	00f5e5b3          	or	a1,a1,a5
    c88c:	00b039b3          	snez	s3,a1
    c890:	00d9e9b3          	or	s3,s3,a3
    c894:	c35ff06f          	j	c4c8 <__adddf3+0x484>
    c898:	0034d613          	srl	a2,s1,0x3
    c89c:	00090793          	mv	a5,s2
    c8a0:	00098713          	mv	a4,s3
    c8a4:	c79ff06f          	j	c51c <__adddf3+0x4d8>
    c8a8:	02000693          	li	a3,32
    c8ac:	40f686b3          	sub	a3,a3,a5
    c8b0:	00000613          	li	a2,0
    c8b4:	8b5ff06f          	j	c168 <__adddf3+0x124>
    c8b8:	00c9e833          	or	a6,s3,a2
    c8bc:	d00808e3          	beqz	a6,c5cc <__adddf3+0x588>
    c8c0:	0039d993          	srl	s3,s3,0x3
    c8c4:	00060713          	mv	a4,a2
    c8c8:	d85ff06f          	j	c64c <__adddf3+0x608>
    c8cc:	00000e13          	li	t3,0
    c8d0:	7ff00793          	li	a5,2047
    c8d4:	00080737          	lui	a4,0x80
    c8d8:	905ff06f          	j	c1dc <__adddf3+0x198>
    c8dc:	01d71793          	sll	a5,a4,0x1d
    c8e0:	00375713          	srl	a4,a4,0x3
    c8e4:	0107e833          	or	a6,a5,a6
    c8e8:	01d77733          	and	a4,a4,t4
    c8ec:	00000793          	li	a5,0
    c8f0:	8edff06f          	j	c1dc <__adddf3+0x198>
    c8f4:	01d71813          	sll	a6,a4,0x1d
    c8f8:	0035d593          	srl	a1,a1,0x3
    c8fc:	00b86833          	or	a6,a6,a1
    c900:	00375713          	srl	a4,a4,0x3
    c904:	00068413          	mv	s0,a3
    c908:	c29ff06f          	j	c530 <__adddf3+0x4ec>

0000c90c <__divdf3>:
    c90c:	fb010113          	add	sp,sp,-80
    c910:	0145d793          	srl	a5,a1,0x14
    c914:	04812423          	sw	s0,72(sp)
    c918:	04912223          	sw	s1,68(sp)
    c91c:	05212023          	sw	s2,64(sp)
    c920:	03412c23          	sw	s4,56(sp)
    c924:	03512a23          	sw	s5,52(sp)
    c928:	00c59493          	sll	s1,a1,0xc
    c92c:	04112623          	sw	ra,76(sp)
    c930:	03312e23          	sw	s3,60(sp)
    c934:	03612823          	sw	s6,48(sp)
    c938:	03712623          	sw	s7,44(sp)
    c93c:	03812423          	sw	s8,40(sp)
    c940:	7ff7f793          	and	a5,a5,2047
    c944:	00050413          	mv	s0,a0
    c948:	00060a13          	mv	s4,a2
    c94c:	00068913          	mv	s2,a3
    c950:	00c4d493          	srl	s1,s1,0xc
    c954:	01f5da93          	srl	s5,a1,0x1f
    c958:	18078c63          	beqz	a5,caf0 <__divdf3+0x1e4>
    c95c:	7ff00713          	li	a4,2047
    c960:	08e78a63          	beq	a5,a4,c9f4 <__divdf3+0xe8>
    c964:	01d55b13          	srl	s6,a0,0x1d
    c968:	00349493          	sll	s1,s1,0x3
    c96c:	009b64b3          	or	s1,s6,s1
    c970:	00800737          	lui	a4,0x800
    c974:	00e4eb33          	or	s6,s1,a4
    c978:	00351b93          	sll	s7,a0,0x3
    c97c:	c0178993          	add	s3,a5,-1023
    c980:	00000493          	li	s1,0
    c984:	00000c13          	li	s8,0
    c988:	01495793          	srl	a5,s2,0x14
    c98c:	00c91413          	sll	s0,s2,0xc
    c990:	7ff7f793          	and	a5,a5,2047
    c994:	00c45413          	srl	s0,s0,0xc
    c998:	01f95913          	srl	s2,s2,0x1f
    c99c:	08078463          	beqz	a5,ca24 <__divdf3+0x118>
    c9a0:	7ff00713          	li	a4,2047
    c9a4:	18e78c63          	beq	a5,a4,cb3c <__divdf3+0x230>
    c9a8:	00341413          	sll	s0,s0,0x3
    c9ac:	01da5713          	srl	a4,s4,0x1d
    c9b0:	00876733          	or	a4,a4,s0
    c9b4:	c0178793          	add	a5,a5,-1023
    c9b8:	00800437          	lui	s0,0x800
    c9bc:	40f989b3          	sub	s3,s3,a5
    c9c0:	00876433          	or	s0,a4,s0
    c9c4:	003a1813          	sll	a6,s4,0x3
    c9c8:	00000793          	li	a5,0
    c9cc:	00f00713          	li	a4,15
    c9d0:	012aca33          	xor	s4,s5,s2
    c9d4:	24976663          	bltu	a4,s1,cc20 <__divdf3+0x314>
    c9d8:	00003697          	auipc	a3,0x3
    c9dc:	d4868693          	add	a3,a3,-696 # f720 <__mprec_tens+0xc8>
    c9e0:	00249493          	sll	s1,s1,0x2
    c9e4:	00d484b3          	add	s1,s1,a3
    c9e8:	0004a703          	lw	a4,0(s1)
    c9ec:	00d70733          	add	a4,a4,a3
    c9f0:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    c9f4:	00a4eb33          	or	s6,s1,a0
    c9f8:	1c0b1e63          	bnez	s6,cbd4 <__divdf3+0x2c8>
    c9fc:	01495793          	srl	a5,s2,0x14
    ca00:	00c91413          	sll	s0,s2,0xc
    ca04:	7ff7f793          	and	a5,a5,2047
    ca08:	00000b93          	li	s7,0
    ca0c:	00800493          	li	s1,8
    ca10:	7ff00993          	li	s3,2047
    ca14:	00200c13          	li	s8,2
    ca18:	00c45413          	srl	s0,s0,0xc
    ca1c:	01f95913          	srl	s2,s2,0x1f
    ca20:	f80790e3          	bnez	a5,c9a0 <__divdf3+0x94>
    ca24:	01446833          	or	a6,s0,s4
    ca28:	1c080263          	beqz	a6,cbec <__divdf3+0x2e0>
    ca2c:	5c040663          	beqz	s0,cff8 <__divdf3+0x6ec>
    ca30:	00040513          	mv	a0,s0
    ca34:	250020ef          	jal	ec84 <__clzsi2>
    ca38:	00050793          	mv	a5,a0
    ca3c:	ff550693          	add	a3,a0,-11
    ca40:	01d00713          	li	a4,29
    ca44:	ff878813          	add	a6,a5,-8
    ca48:	40d70733          	sub	a4,a4,a3
    ca4c:	01041433          	sll	s0,s0,a6
    ca50:	00ea5733          	srl	a4,s4,a4
    ca54:	00876433          	or	s0,a4,s0
    ca58:	010a1833          	sll	a6,s4,a6
    ca5c:	013787b3          	add	a5,a5,s3
    ca60:	3f378993          	add	s3,a5,1011
    ca64:	00000793          	li	a5,0
    ca68:	f65ff06f          	j	c9cc <__divdf3+0xc0>
    ca6c:	40f70733          	sub	a4,a4,a5
    ca70:	03800693          	li	a3,56
    ca74:	60e6d063          	bge	a3,a4,d074 <__divdf3+0x768>
    ca78:	00000793          	li	a5,0
    ca7c:	00000693          	li	a3,0
    ca80:	00000713          	li	a4,0
    ca84:	04c12083          	lw	ra,76(sp)
    ca88:	04812403          	lw	s0,72(sp)
    ca8c:	01479793          	sll	a5,a5,0x14
    ca90:	00d7e7b3          	or	a5,a5,a3
    ca94:	01fa1693          	sll	a3,s4,0x1f
    ca98:	00d7e7b3          	or	a5,a5,a3
    ca9c:	04412483          	lw	s1,68(sp)
    caa0:	04012903          	lw	s2,64(sp)
    caa4:	03c12983          	lw	s3,60(sp)
    caa8:	03812a03          	lw	s4,56(sp)
    caac:	03412a83          	lw	s5,52(sp)
    cab0:	03012b03          	lw	s6,48(sp)
    cab4:	02c12b83          	lw	s7,44(sp)
    cab8:	02812c03          	lw	s8,40(sp)
    cabc:	00070513          	mv	a0,a4
    cac0:	00078593          	mv	a1,a5
    cac4:	05010113          	add	sp,sp,80
    cac8:	00008067          	ret
    cacc:	7ff00793          	li	a5,2047
    cad0:	00000693          	li	a3,0
    cad4:	00000713          	li	a4,0
    cad8:	fadff06f          	j	ca84 <__divdf3+0x178>
    cadc:	00000a13          	li	s4,0
    cae0:	7ff00793          	li	a5,2047
    cae4:	000806b7          	lui	a3,0x80
    cae8:	00000713          	li	a4,0
    caec:	f99ff06f          	j	ca84 <__divdf3+0x178>
    caf0:	00a4eb33          	or	s6,s1,a0
    caf4:	100b0c63          	beqz	s6,cc0c <__divdf3+0x300>
    caf8:	52048463          	beqz	s1,d020 <__divdf3+0x714>
    cafc:	00048513          	mv	a0,s1
    cb00:	184020ef          	jal	ec84 <__clzsi2>
    cb04:	00050713          	mv	a4,a0
    cb08:	ff550793          	add	a5,a0,-11
    cb0c:	01d00b13          	li	s6,29
    cb10:	ff870b93          	add	s7,a4,-8
    cb14:	40fb0b33          	sub	s6,s6,a5
    cb18:	017494b3          	sll	s1,s1,s7
    cb1c:	01645b33          	srl	s6,s0,s6
    cb20:	009b6b33          	or	s6,s6,s1
    cb24:	01741bb3          	sll	s7,s0,s7
    cb28:	c0d00793          	li	a5,-1011
    cb2c:	40e789b3          	sub	s3,a5,a4
    cb30:	00000493          	li	s1,0
    cb34:	00000c13          	li	s8,0
    cb38:	e51ff06f          	j	c988 <__divdf3+0x7c>
    cb3c:	01446833          	or	a6,s0,s4
    cb40:	80198993          	add	s3,s3,-2047
    cb44:	0a081c63          	bnez	a6,cbfc <__divdf3+0x2f0>
    cb48:	0024e493          	or	s1,s1,2
    cb4c:	00000413          	li	s0,0
    cb50:	00200793          	li	a5,2
    cb54:	e79ff06f          	j	c9cc <__divdf3+0xc0>
    cb58:	000a8913          	mv	s2,s5
    cb5c:	000b0413          	mv	s0,s6
    cb60:	000b8813          	mv	a6,s7
    cb64:	00200793          	li	a5,2
    cb68:	60fc0863          	beq	s8,a5,d178 <__divdf3+0x86c>
    cb6c:	00300793          	li	a5,3
    cb70:	f6fc06e3          	beq	s8,a5,cadc <__divdf3+0x1d0>
    cb74:	00100793          	li	a5,1
    cb78:	00090a13          	mv	s4,s2
    cb7c:	eefc0ee3          	beq	s8,a5,ca78 <__divdf3+0x16c>
    cb80:	3ff98793          	add	a5,s3,1023
    cb84:	3cf05263          	blez	a5,cf48 <__divdf3+0x63c>
    cb88:	00787713          	and	a4,a6,7
    cb8c:	5c071663          	bnez	a4,d158 <__divdf3+0x84c>
    cb90:	00741713          	sll	a4,s0,0x7
    cb94:	00075a63          	bgez	a4,cba8 <__divdf3+0x29c>
    cb98:	ff0007b7          	lui	a5,0xff000
    cb9c:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cba0:	00f47433          	and	s0,s0,a5
    cba4:	40098793          	add	a5,s3,1024
    cba8:	7fe00713          	li	a4,2046
    cbac:	f2f740e3          	blt	a4,a5,cacc <__divdf3+0x1c0>
    cbb0:	00385813          	srl	a6,a6,0x3
    cbb4:	01d41713          	sll	a4,s0,0x1d
    cbb8:	00941693          	sll	a3,s0,0x9
    cbbc:	01076733          	or	a4,a4,a6
    cbc0:	00c6d693          	srl	a3,a3,0xc
    cbc4:	7ff7f793          	and	a5,a5,2047
    cbc8:	ebdff06f          	j	ca84 <__divdf3+0x178>
    cbcc:	00078c13          	mv	s8,a5
    cbd0:	f95ff06f          	j	cb64 <__divdf3+0x258>
    cbd4:	00048b13          	mv	s6,s1
    cbd8:	00050b93          	mv	s7,a0
    cbdc:	00c00493          	li	s1,12
    cbe0:	7ff00993          	li	s3,2047
    cbe4:	00300c13          	li	s8,3
    cbe8:	da1ff06f          	j	c988 <__divdf3+0x7c>
    cbec:	0014e493          	or	s1,s1,1
    cbf0:	00000413          	li	s0,0
    cbf4:	00100793          	li	a5,1
    cbf8:	dd5ff06f          	j	c9cc <__divdf3+0xc0>
    cbfc:	0034e493          	or	s1,s1,3
    cc00:	000a0813          	mv	a6,s4
    cc04:	00300793          	li	a5,3
    cc08:	dc5ff06f          	j	c9cc <__divdf3+0xc0>
    cc0c:	00000b93          	li	s7,0
    cc10:	00400493          	li	s1,4
    cc14:	00000993          	li	s3,0
    cc18:	00100c13          	li	s8,1
    cc1c:	d6dff06f          	j	c988 <__divdf3+0x7c>
    cc20:	03912223          	sw	s9,36(sp)
    cc24:	03a12023          	sw	s10,32(sp)
    cc28:	01b12e23          	sw	s11,28(sp)
    cc2c:	3b646a63          	bltu	s0,s6,cfe0 <__divdf3+0x6d4>
    cc30:	3a8b0663          	beq	s6,s0,cfdc <__divdf3+0x6d0>
    cc34:	fff98993          	add	s3,s3,-1
    cc38:	000b8c13          	mv	s8,s7
    cc3c:	000b0493          	mv	s1,s6
    cc40:	00000d13          	li	s10,0
    cc44:	01885c93          	srl	s9,a6,0x18
    cc48:	00841413          	sll	s0,s0,0x8
    cc4c:	01045913          	srl	s2,s0,0x10
    cc50:	008cecb3          	or	s9,s9,s0
    cc54:	00090593          	mv	a1,s2
    cc58:	00048513          	mv	a0,s1
    cc5c:	010c9b13          	sll	s6,s9,0x10
    cc60:	00881a93          	sll	s5,a6,0x8
    cc64:	010b5b13          	srl	s6,s6,0x10
    cc68:	771010ef          	jal	ebd8 <__hidden___udivsi3>
    cc6c:	00050593          	mv	a1,a0
    cc70:	00050413          	mv	s0,a0
    cc74:	000b0513          	mv	a0,s6
    cc78:	69d010ef          	jal	eb14 <__mulsi3>
    cc7c:	00050793          	mv	a5,a0
    cc80:	00090593          	mv	a1,s2
    cc84:	00048513          	mv	a0,s1
    cc88:	00078493          	mv	s1,a5
    cc8c:	795010ef          	jal	ec20 <__umodsi3>
    cc90:	01051513          	sll	a0,a0,0x10
    cc94:	010c5793          	srl	a5,s8,0x10
    cc98:	00a7e7b3          	or	a5,a5,a0
    cc9c:	0097fa63          	bgeu	a5,s1,ccb0 <__divdf3+0x3a4>
    cca0:	00fc87b3          	add	a5,s9,a5
    cca4:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    cca8:	3b97fe63          	bgeu	a5,s9,d064 <__divdf3+0x758>
    ccac:	00070413          	mv	s0,a4
    ccb0:	409784b3          	sub	s1,a5,s1
    ccb4:	00090593          	mv	a1,s2
    ccb8:	00048513          	mv	a0,s1
    ccbc:	71d010ef          	jal	ebd8 <__hidden___udivsi3>
    ccc0:	00050593          	mv	a1,a0
    ccc4:	00050b93          	mv	s7,a0
    ccc8:	000b0513          	mv	a0,s6
    cccc:	649010ef          	jal	eb14 <__mulsi3>
    ccd0:	00050793          	mv	a5,a0
    ccd4:	00090593          	mv	a1,s2
    ccd8:	00048513          	mv	a0,s1
    ccdc:	00078493          	mv	s1,a5
    cce0:	741010ef          	jal	ec20 <__umodsi3>
    cce4:	010c1793          	sll	a5,s8,0x10
    cce8:	01051513          	sll	a0,a0,0x10
    ccec:	0107d793          	srl	a5,a5,0x10
    ccf0:	00a7e7b3          	or	a5,a5,a0
    ccf4:	0097fa63          	bgeu	a5,s1,cd08 <__divdf3+0x3fc>
    ccf8:	00fc87b3          	add	a5,s9,a5
    ccfc:	fffb8713          	add	a4,s7,-1
    cd00:	3597fa63          	bgeu	a5,s9,d054 <__divdf3+0x748>
    cd04:	00070b93          	mv	s7,a4
    cd08:	00010337          	lui	t1,0x10
    cd0c:	01041413          	sll	s0,s0,0x10
    cd10:	01746433          	or	s0,s0,s7
    cd14:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    cd18:	01b478b3          	and	a7,s0,s11
    cd1c:	01bafdb3          	and	s11,s5,s11
    cd20:	40978bb3          	sub	s7,a5,s1
    cd24:	010adc13          	srl	s8,s5,0x10
    cd28:	01045793          	srl	a5,s0,0x10
    cd2c:	00088513          	mv	a0,a7
    cd30:	000d8593          	mv	a1,s11
    cd34:	5e1010ef          	jal	eb14 <__mulsi3>
    cd38:	00050813          	mv	a6,a0
    cd3c:	000c0593          	mv	a1,s8
    cd40:	00088513          	mv	a0,a7
    cd44:	5d1010ef          	jal	eb14 <__mulsi3>
    cd48:	00050893          	mv	a7,a0
    cd4c:	000d8593          	mv	a1,s11
    cd50:	00078513          	mv	a0,a5
    cd54:	5c1010ef          	jal	eb14 <__mulsi3>
    cd58:	00050e13          	mv	t3,a0
    cd5c:	000c0593          	mv	a1,s8
    cd60:	00078513          	mv	a0,a5
    cd64:	5b1010ef          	jal	eb14 <__mulsi3>
    cd68:	01085793          	srl	a5,a6,0x10
    cd6c:	01c888b3          	add	a7,a7,t3
    cd70:	011787b3          	add	a5,a5,a7
    cd74:	01c7f463          	bgeu	a5,t3,cd7c <__divdf3+0x470>
    cd78:	00650533          	add	a0,a0,t1
    cd7c:	00010637          	lui	a2,0x10
    cd80:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    cd84:	00c7f4b3          	and	s1,a5,a2
    cd88:	0107d693          	srl	a3,a5,0x10
    cd8c:	01049493          	sll	s1,s1,0x10
    cd90:	00c87833          	and	a6,a6,a2
    cd94:	00a687b3          	add	a5,a3,a0
    cd98:	010484b3          	add	s1,s1,a6
    cd9c:	20fbea63          	bltu	s7,a5,cfb0 <__divdf3+0x6a4>
    cda0:	20fb8663          	beq	s7,a5,cfac <__divdf3+0x6a0>
    cda4:	409d04b3          	sub	s1,s10,s1
    cda8:	40fb8bb3          	sub	s7,s7,a5
    cdac:	009d3d33          	sltu	s10,s10,s1
    cdb0:	41ab8bb3          	sub	s7,s7,s10
    cdb4:	377c8a63          	beq	s9,s7,d128 <__divdf3+0x81c>
    cdb8:	00090593          	mv	a1,s2
    cdbc:	000b8513          	mv	a0,s7
    cdc0:	619010ef          	jal	ebd8 <__hidden___udivsi3>
    cdc4:	00050593          	mv	a1,a0
    cdc8:	00a12623          	sw	a0,12(sp)
    cdcc:	00050d13          	mv	s10,a0
    cdd0:	000b0513          	mv	a0,s6
    cdd4:	541010ef          	jal	eb14 <__mulsi3>
    cdd8:	00050793          	mv	a5,a0
    cddc:	00090593          	mv	a1,s2
    cde0:	000b8513          	mv	a0,s7
    cde4:	00078b93          	mv	s7,a5
    cde8:	639010ef          	jal	ec20 <__umodsi3>
    cdec:	01051513          	sll	a0,a0,0x10
    cdf0:	0104d793          	srl	a5,s1,0x10
    cdf4:	00a7e7b3          	or	a5,a5,a0
    cdf8:	0377f063          	bgeu	a5,s7,ce18 <__divdf3+0x50c>
    cdfc:	00fc87b3          	add	a5,s9,a5
    ce00:	fffd0693          	add	a3,s10,-1
    ce04:	3797e263          	bltu	a5,s9,d168 <__divdf3+0x85c>
    ce08:	3777f063          	bgeu	a5,s7,d168 <__divdf3+0x85c>
    ce0c:	ffed0713          	add	a4,s10,-2
    ce10:	00e12623          	sw	a4,12(sp)
    ce14:	019787b3          	add	a5,a5,s9
    ce18:	41778bb3          	sub	s7,a5,s7
    ce1c:	00090593          	mv	a1,s2
    ce20:	000b8513          	mv	a0,s7
    ce24:	5b5010ef          	jal	ebd8 <__hidden___udivsi3>
    ce28:	00050593          	mv	a1,a0
    ce2c:	00050d13          	mv	s10,a0
    ce30:	000b0513          	mv	a0,s6
    ce34:	4e1010ef          	jal	eb14 <__mulsi3>
    ce38:	00050793          	mv	a5,a0
    ce3c:	00090593          	mv	a1,s2
    ce40:	000b8513          	mv	a0,s7
    ce44:	00078913          	mv	s2,a5
    ce48:	01049493          	sll	s1,s1,0x10
    ce4c:	5d5010ef          	jal	ec20 <__umodsi3>
    ce50:	01051513          	sll	a0,a0,0x10
    ce54:	0104d493          	srl	s1,s1,0x10
    ce58:	00a4e4b3          	or	s1,s1,a0
    ce5c:	0124fe63          	bgeu	s1,s2,ce78 <__divdf3+0x56c>
    ce60:	009c84b3          	add	s1,s9,s1
    ce64:	fffd0793          	add	a5,s10,-1
    ce68:	3194e463          	bltu	s1,s9,d170 <__divdf3+0x864>
    ce6c:	3124f263          	bgeu	s1,s2,d170 <__divdf3+0x864>
    ce70:	ffed0d13          	add	s10,s10,-2
    ce74:	019484b3          	add	s1,s1,s9
    ce78:	00c12783          	lw	a5,12(sp)
    ce7c:	412484b3          	sub	s1,s1,s2
    ce80:	000d8593          	mv	a1,s11
    ce84:	01079813          	sll	a6,a5,0x10
    ce88:	01a86833          	or	a6,a6,s10
    ce8c:	01081313          	sll	t1,a6,0x10
    ce90:	01035313          	srl	t1,t1,0x10
    ce94:	01085793          	srl	a5,a6,0x10
    ce98:	00030513          	mv	a0,t1
    ce9c:	479010ef          	jal	eb14 <__mulsi3>
    cea0:	00050893          	mv	a7,a0
    cea4:	000c0593          	mv	a1,s8
    cea8:	00030513          	mv	a0,t1
    ceac:	469010ef          	jal	eb14 <__mulsi3>
    ceb0:	00050313          	mv	t1,a0
    ceb4:	000d8593          	mv	a1,s11
    ceb8:	00078513          	mv	a0,a5
    cebc:	459010ef          	jal	eb14 <__mulsi3>
    cec0:	00050e13          	mv	t3,a0
    cec4:	000c0593          	mv	a1,s8
    cec8:	00078513          	mv	a0,a5
    cecc:	449010ef          	jal	eb14 <__mulsi3>
    ced0:	0108d793          	srl	a5,a7,0x10
    ced4:	01c30333          	add	t1,t1,t3
    ced8:	006787b3          	add	a5,a5,t1
    cedc:	01c7f663          	bgeu	a5,t3,cee8 <__divdf3+0x5dc>
    cee0:	00010737          	lui	a4,0x10
    cee4:	00e50533          	add	a0,a0,a4
    cee8:	000106b7          	lui	a3,0x10
    ceec:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    cef0:	0107d713          	srl	a4,a5,0x10
    cef4:	00d7f7b3          	and	a5,a5,a3
    cef8:	01079793          	sll	a5,a5,0x10
    cefc:	00d8f8b3          	and	a7,a7,a3
    cf00:	00a70733          	add	a4,a4,a0
    cf04:	011787b3          	add	a5,a5,a7
    cf08:	02e4e063          	bltu	s1,a4,cf28 <__divdf3+0x61c>
    cf0c:	00e48c63          	beq	s1,a4,cf24 <__divdf3+0x618>
    cf10:	02412c83          	lw	s9,36(sp)
    cf14:	02012d03          	lw	s10,32(sp)
    cf18:	01c12d83          	lw	s11,28(sp)
    cf1c:	00186813          	or	a6,a6,1
    cf20:	c61ff06f          	j	cb80 <__divdf3+0x274>
    cf24:	1c078a63          	beqz	a5,d0f8 <__divdf3+0x7ec>
    cf28:	009c84b3          	add	s1,s9,s1
    cf2c:	fff80613          	add	a2,a6,-1
    cf30:	00048693          	mv	a3,s1
    cf34:	1b94ec63          	bltu	s1,s9,d0ec <__divdf3+0x7e0>
    cf38:	24e4ea63          	bltu	s1,a4,d18c <__divdf3+0x880>
    cf3c:	26e48863          	beq	s1,a4,d1ac <__divdf3+0x8a0>
    cf40:	00060813          	mv	a6,a2
    cf44:	fcdff06f          	j	cf10 <__divdf3+0x604>
    cf48:	00100713          	li	a4,1
    cf4c:	b20790e3          	bnez	a5,ca6c <__divdf3+0x160>
    cf50:	41e98793          	add	a5,s3,1054
    cf54:	00f816b3          	sll	a3,a6,a5
    cf58:	00d036b3          	snez	a3,a3
    cf5c:	00f417b3          	sll	a5,s0,a5
    cf60:	00f6e7b3          	or	a5,a3,a5
    cf64:	00e85833          	srl	a6,a6,a4
    cf68:	00f86833          	or	a6,a6,a5
    cf6c:	00787793          	and	a5,a6,7
    cf70:	00e45433          	srl	s0,s0,a4
    cf74:	02078063          	beqz	a5,cf94 <__divdf3+0x688>
    cf78:	00f87793          	and	a5,a6,15
    cf7c:	00400713          	li	a4,4
    cf80:	00e78a63          	beq	a5,a4,cf94 <__divdf3+0x688>
    cf84:	00480793          	add	a5,a6,4
    cf88:	0107b833          	sltu	a6,a5,a6
    cf8c:	01040433          	add	s0,s0,a6
    cf90:	00078813          	mv	a6,a5
    cf94:	00841613          	sll	a2,s0,0x8
    cf98:	00100793          	li	a5,1
    cf9c:	00000693          	li	a3,0
    cfa0:	00000713          	li	a4,0
    cfa4:	ae0640e3          	bltz	a2,ca84 <__divdf3+0x178>
    cfa8:	1280006f          	j	d0d0 <__divdf3+0x7c4>
    cfac:	de9d7ce3          	bgeu	s10,s1,cda4 <__divdf3+0x498>
    cfb0:	015d06b3          	add	a3,s10,s5
    cfb4:	01a6b633          	sltu	a2,a3,s10
    cfb8:	019605b3          	add	a1,a2,s9
    cfbc:	00bb8bb3          	add	s7,s7,a1
    cfc0:	00068d13          	mv	s10,a3
    cfc4:	fff40593          	add	a1,s0,-1
    cfc8:	077cfe63          	bgeu	s9,s7,d044 <__divdf3+0x738>
    cfcc:	14fbe063          	bltu	s7,a5,d10c <__divdf3+0x800>
    cfd0:	13778c63          	beq	a5,s7,d108 <__divdf3+0x7fc>
    cfd4:	00058413          	mv	s0,a1
    cfd8:	dcdff06f          	j	cda4 <__divdf3+0x498>
    cfdc:	c50bece3          	bltu	s7,a6,cc34 <__divdf3+0x328>
    cfe0:	01fb1c13          	sll	s8,s6,0x1f
    cfe4:	001bd713          	srl	a4,s7,0x1
    cfe8:	001b5493          	srl	s1,s6,0x1
    cfec:	00ec6c33          	or	s8,s8,a4
    cff0:	01fb9d13          	sll	s10,s7,0x1f
    cff4:	c51ff06f          	j	cc44 <__divdf3+0x338>
    cff8:	000a0513          	mv	a0,s4
    cffc:	489010ef          	jal	ec84 <__clzsi2>
    d000:	01550693          	add	a3,a0,21
    d004:	01c00713          	li	a4,28
    d008:	02050793          	add	a5,a0,32
    d00c:	a2d75ae3          	bge	a4,a3,ca40 <__divdf3+0x134>
    d010:	ff850513          	add	a0,a0,-8
    d014:	00000813          	li	a6,0
    d018:	00aa1433          	sll	s0,s4,a0
    d01c:	a41ff06f          	j	ca5c <__divdf3+0x150>
    d020:	465010ef          	jal	ec84 <__clzsi2>
    d024:	01550793          	add	a5,a0,21
    d028:	01c00693          	li	a3,28
    d02c:	02050713          	add	a4,a0,32
    d030:	acf6dee3          	bge	a3,a5,cb0c <__divdf3+0x200>
    d034:	ff850493          	add	s1,a0,-8
    d038:	00941b33          	sll	s6,s0,s1
    d03c:	00000b93          	li	s7,0
    d040:	ae9ff06f          	j	cb28 <__divdf3+0x21c>
    d044:	f97c98e3          	bne	s9,s7,cfd4 <__divdf3+0x6c8>
    d048:	f80602e3          	beqz	a2,cfcc <__divdf3+0x6c0>
    d04c:	00058413          	mv	s0,a1
    d050:	d55ff06f          	j	cda4 <__divdf3+0x498>
    d054:	ca97f8e3          	bgeu	a5,s1,cd04 <__divdf3+0x3f8>
    d058:	ffeb8b93          	add	s7,s7,-2
    d05c:	019787b3          	add	a5,a5,s9
    d060:	ca9ff06f          	j	cd08 <__divdf3+0x3fc>
    d064:	c497f4e3          	bgeu	a5,s1,ccac <__divdf3+0x3a0>
    d068:	ffe40413          	add	s0,s0,-2
    d06c:	019787b3          	add	a5,a5,s9
    d070:	c41ff06f          	j	ccb0 <__divdf3+0x3a4>
    d074:	01f00693          	li	a3,31
    d078:	ece6dce3          	bge	a3,a4,cf50 <__divdf3+0x644>
    d07c:	fe100693          	li	a3,-31
    d080:	40f686b3          	sub	a3,a3,a5
    d084:	02000793          	li	a5,32
    d088:	00d456b3          	srl	a3,s0,a3
    d08c:	00f70863          	beq	a4,a5,d09c <__divdf3+0x790>
    d090:	43e98793          	add	a5,s3,1086
    d094:	00f417b3          	sll	a5,s0,a5
    d098:	00f86833          	or	a6,a6,a5
    d09c:	01003833          	snez	a6,a6
    d0a0:	00d86833          	or	a6,a6,a3
    d0a4:	00787713          	and	a4,a6,7
    d0a8:	00000693          	li	a3,0
    d0ac:	02070863          	beqz	a4,d0dc <__divdf3+0x7d0>
    d0b0:	00f87793          	and	a5,a6,15
    d0b4:	00400713          	li	a4,4
    d0b8:	00000413          	li	s0,0
    d0bc:	00e78a63          	beq	a5,a4,d0d0 <__divdf3+0x7c4>
    d0c0:	00480793          	add	a5,a6,4
    d0c4:	0107b833          	sltu	a6,a5,a6
    d0c8:	01003433          	snez	s0,a6
    d0cc:	00078813          	mv	a6,a5
    d0d0:	00941693          	sll	a3,s0,0x9
    d0d4:	01d41713          	sll	a4,s0,0x1d
    d0d8:	00c6d693          	srl	a3,a3,0xc
    d0dc:	00385813          	srl	a6,a6,0x3
    d0e0:	00e86733          	or	a4,a6,a4
    d0e4:	00000793          	li	a5,0
    d0e8:	99dff06f          	j	ca84 <__divdf3+0x178>
    d0ec:	00060813          	mv	a6,a2
    d0f0:	e2e690e3          	bne	a3,a4,cf10 <__divdf3+0x604>
    d0f4:	e1579ee3          	bne	a5,s5,cf10 <__divdf3+0x604>
    d0f8:	02412c83          	lw	s9,36(sp)
    d0fc:	02012d03          	lw	s10,32(sp)
    d100:	01c12d83          	lw	s11,28(sp)
    d104:	a7dff06f          	j	cb80 <__divdf3+0x274>
    d108:	ec96f6e3          	bgeu	a3,s1,cfd4 <__divdf3+0x6c8>
    d10c:	00da86b3          	add	a3,s5,a3
    d110:	0156b633          	sltu	a2,a3,s5
    d114:	01960633          	add	a2,a2,s9
    d118:	ffe40413          	add	s0,s0,-2
    d11c:	00068d13          	mv	s10,a3
    d120:	00cb8bb3          	add	s7,s7,a2
    d124:	c81ff06f          	j	cda4 <__divdf3+0x498>
    d128:	c0200713          	li	a4,-1022
    d12c:	02412c83          	lw	s9,36(sp)
    d130:	02012d03          	lw	s10,32(sp)
    d134:	01c12d83          	lw	s11,28(sp)
    d138:	3ff98793          	add	a5,s3,1023
    d13c:	fff00813          	li	a6,-1
    d140:	e0e9c4e3          	blt	s3,a4,cf48 <__divdf3+0x63c>
    d144:	00480713          	add	a4,a6,4
    d148:	01073833          	sltu	a6,a4,a6
    d14c:	01040433          	add	s0,s0,a6
    d150:	00070813          	mv	a6,a4
    d154:	a3dff06f          	j	cb90 <__divdf3+0x284>
    d158:	00f87713          	and	a4,a6,15
    d15c:	00400693          	li	a3,4
    d160:	a2d708e3          	beq	a4,a3,cb90 <__divdf3+0x284>
    d164:	fe1ff06f          	j	d144 <__divdf3+0x838>
    d168:	00d12623          	sw	a3,12(sp)
    d16c:	cadff06f          	j	ce18 <__divdf3+0x50c>
    d170:	00078d13          	mv	s10,a5
    d174:	d05ff06f          	j	ce78 <__divdf3+0x56c>
    d178:	00090a13          	mv	s4,s2
    d17c:	7ff00793          	li	a5,2047
    d180:	00000693          	li	a3,0
    d184:	00000713          	li	a4,0
    d188:	8fdff06f          	j	ca84 <__divdf3+0x178>
    d18c:	001a9613          	sll	a2,s5,0x1
    d190:	015636b3          	sltu	a3,a2,s5
    d194:	019686b3          	add	a3,a3,s9
    d198:	00d486b3          	add	a3,s1,a3
    d19c:	ffe80813          	add	a6,a6,-2
    d1a0:	00060a93          	mv	s5,a2
    d1a4:	f4e688e3          	beq	a3,a4,d0f4 <__divdf3+0x7e8>
    d1a8:	d69ff06f          	j	cf10 <__divdf3+0x604>
    d1ac:	fefae0e3          	bltu	s5,a5,d18c <__divdf3+0x880>
    d1b0:	00060813          	mv	a6,a2
    d1b4:	f41ff06f          	j	d0f4 <__divdf3+0x7e8>

0000d1b8 <__eqdf2>:
    d1b8:	0145d713          	srl	a4,a1,0x14
    d1bc:	001007b7          	lui	a5,0x100
    d1c0:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d1c4:	0146d813          	srl	a6,a3,0x14
    d1c8:	7ff77713          	and	a4,a4,2047
    d1cc:	7ff00313          	li	t1,2047
    d1d0:	00b7fe33          	and	t3,a5,a1
    d1d4:	00050893          	mv	a7,a0
    d1d8:	00d7f7b3          	and	a5,a5,a3
    d1dc:	01f5d593          	srl	a1,a1,0x1f
    d1e0:	7ff87813          	and	a6,a6,2047
    d1e4:	01f6d693          	srl	a3,a3,0x1f
    d1e8:	00100513          	li	a0,1
    d1ec:	00670c63          	beq	a4,t1,d204 <__eqdf2+0x4c>
    d1f0:	00680863          	beq	a6,t1,d200 <__eqdf2+0x48>
    d1f4:	01071463          	bne	a4,a6,d1fc <__eqdf2+0x44>
    d1f8:	02fe0663          	beq	t3,a5,d224 <__eqdf2+0x6c>
    d1fc:	00008067          	ret
    d200:	00008067          	ret
    d204:	fee81ce3          	bne	a6,a4,d1fc <__eqdf2+0x44>
    d208:	00fe67b3          	or	a5,t3,a5
    d20c:	00c7e7b3          	or	a5,a5,a2
    d210:	0117e7b3          	or	a5,a5,a7
    d214:	fe0794e3          	bnez	a5,d1fc <__eqdf2+0x44>
    d218:	40d585b3          	sub	a1,a1,a3
    d21c:	00b03533          	snez	a0,a1
    d220:	00008067          	ret
    d224:	fcc89ce3          	bne	a7,a2,d1fc <__eqdf2+0x44>
    d228:	00d58a63          	beq	a1,a3,d23c <__eqdf2+0x84>
    d22c:	fc0718e3          	bnez	a4,d1fc <__eqdf2+0x44>
    d230:	011e6e33          	or	t3,t3,a7
    d234:	01c03533          	snez	a0,t3
    d238:	00008067          	ret
    d23c:	00000513          	li	a0,0
    d240:	00008067          	ret

0000d244 <__gedf2>:
    d244:	0145d893          	srl	a7,a1,0x14
    d248:	001007b7          	lui	a5,0x100
    d24c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d250:	0146d713          	srl	a4,a3,0x14
    d254:	7ff8f893          	and	a7,a7,2047
    d258:	7ff00e13          	li	t3,2047
    d25c:	00b7f333          	and	t1,a5,a1
    d260:	00050813          	mv	a6,a0
    d264:	00050e93          	mv	t4,a0
    d268:	00d7f7b3          	and	a5,a5,a3
    d26c:	01f5d593          	srl	a1,a1,0x1f
    d270:	00060f13          	mv	t5,a2
    d274:	7ff77513          	and	a0,a4,2047
    d278:	01f6d693          	srl	a3,a3,0x1f
    d27c:	05c88863          	beq	a7,t3,d2cc <__gedf2+0x88>
    d280:	03c50463          	beq	a0,t3,d2a8 <__gedf2+0x64>
    d284:	06089a63          	bnez	a7,d2f8 <__gedf2+0xb4>
    d288:	01036833          	or	a6,t1,a6
    d28c:	06051063          	bnez	a0,d2ec <__gedf2+0xa8>
    d290:	00c7e633          	or	a2,a5,a2
    d294:	08060c63          	beqz	a2,d32c <__gedf2+0xe8>
    d298:	0a081263          	bnez	a6,d33c <__gedf2+0xf8>
    d29c:	00100513          	li	a0,1
    d2a0:	08068263          	beqz	a3,d324 <__gedf2+0xe0>
    d2a4:	00008067          	ret
    d2a8:	00c7e633          	or	a2,a5,a2
    d2ac:	08061463          	bnez	a2,d334 <__gedf2+0xf0>
    d2b0:	00089663          	bnez	a7,d2bc <__gedf2+0x78>
    d2b4:	01036333          	or	t1,t1,a6
    d2b8:	fe0302e3          	beqz	t1,d29c <__gedf2+0x58>
    d2bc:	06d58063          	beq	a1,a3,d31c <__gedf2+0xd8>
    d2c0:	06059263          	bnez	a1,d324 <__gedf2+0xe0>
    d2c4:	00100513          	li	a0,1
    d2c8:	00008067          	ret
    d2cc:	01036333          	or	t1,t1,a6
    d2d0:	06031263          	bnez	t1,d334 <__gedf2+0xf0>
    d2d4:	ff1516e3          	bne	a0,a7,d2c0 <__gedf2+0x7c>
    d2d8:	00c7e7b3          	or	a5,a5,a2
    d2dc:	04079c63          	bnez	a5,d334 <__gedf2+0xf0>
    d2e0:	fed590e3          	bne	a1,a3,d2c0 <__gedf2+0x7c>
    d2e4:	00000513          	li	a0,0
    d2e8:	00008067          	ret
    d2ec:	fa0808e3          	beqz	a6,d29c <__gedf2+0x58>
    d2f0:	fcd598e3          	bne	a1,a3,d2c0 <__gedf2+0x7c>
    d2f4:	0280006f          	j	d31c <__gedf2+0xd8>
    d2f8:	fc0504e3          	beqz	a0,d2c0 <__gedf2+0x7c>
    d2fc:	fcd592e3          	bne	a1,a3,d2c0 <__gedf2+0x7c>
    d300:	fd1540e3          	blt	a0,a7,d2c0 <__gedf2+0x7c>
    d304:	00a8cc63          	blt	a7,a0,d31c <__gedf2+0xd8>
    d308:	fa67ece3          	bltu	a5,t1,d2c0 <__gedf2+0x7c>
    d30c:	00f31863          	bne	t1,a5,d31c <__gedf2+0xd8>
    d310:	fbdf68e3          	bltu	t5,t4,d2c0 <__gedf2+0x7c>
    d314:	00000513          	li	a0,0
    d318:	f9eef6e3          	bgeu	t4,t5,d2a4 <__gedf2+0x60>
    d31c:	00100513          	li	a0,1
    d320:	f80592e3          	bnez	a1,d2a4 <__gedf2+0x60>
    d324:	fff00513          	li	a0,-1
    d328:	00008067          	ret
    d32c:	f8081ae3          	bnez	a6,d2c0 <__gedf2+0x7c>
    d330:	00008067          	ret
    d334:	ffe00513          	li	a0,-2
    d338:	00008067          	ret
    d33c:	fcd586e3          	beq	a1,a3,d308 <__gedf2+0xc4>
    d340:	f81ff06f          	j	d2c0 <__gedf2+0x7c>

0000d344 <__ledf2>:
    d344:	0145d893          	srl	a7,a1,0x14
    d348:	001007b7          	lui	a5,0x100
    d34c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d350:	0146d713          	srl	a4,a3,0x14
    d354:	7ff8f893          	and	a7,a7,2047
    d358:	7ff00313          	li	t1,2047
    d35c:	00b7fe33          	and	t3,a5,a1
    d360:	00050813          	mv	a6,a0
    d364:	00050e93          	mv	t4,a0
    d368:	00d7f7b3          	and	a5,a5,a3
    d36c:	01f5d593          	srl	a1,a1,0x1f
    d370:	00060f13          	mv	t5,a2
    d374:	7ff77513          	and	a0,a4,2047
    d378:	01f6d693          	srl	a3,a3,0x1f
    d37c:	04688a63          	beq	a7,t1,d3d0 <__ledf2+0x8c>
    d380:	02650463          	beq	a0,t1,d3a8 <__ledf2+0x64>
    d384:	06089863          	bnez	a7,d3f4 <__ledf2+0xb0>
    d388:	010e6833          	or	a6,t3,a6
    d38c:	08051e63          	bnez	a0,d428 <__ledf2+0xe4>
    d390:	00c7e633          	or	a2,a5,a2
    d394:	0a060463          	beqz	a2,d43c <__ledf2+0xf8>
    d398:	0a081663          	bnez	a6,d444 <__ledf2+0x100>
    d39c:	00100513          	li	a0,1
    d3a0:	08068063          	beqz	a3,d420 <__ledf2+0xdc>
    d3a4:	00008067          	ret
    d3a8:	00c7e633          	or	a2,a5,a2
    d3ac:	00200513          	li	a0,2
    d3b0:	fe061ae3          	bnez	a2,d3a4 <__ledf2+0x60>
    d3b4:	00089663          	bnez	a7,d3c0 <__ledf2+0x7c>
    d3b8:	010e6e33          	or	t3,t3,a6
    d3bc:	fe0e00e3          	beqz	t3,d39c <__ledf2+0x58>
    d3c0:	04d58c63          	beq	a1,a3,d418 <__ledf2+0xd4>
    d3c4:	04059e63          	bnez	a1,d420 <__ledf2+0xdc>
    d3c8:	00100513          	li	a0,1
    d3cc:	00008067          	ret
    d3d0:	010e6e33          	or	t3,t3,a6
    d3d4:	060e1063          	bnez	t3,d434 <__ledf2+0xf0>
    d3d8:	ff1516e3          	bne	a0,a7,d3c4 <__ledf2+0x80>
    d3dc:	00c7e7b3          	or	a5,a5,a2
    d3e0:	00200513          	li	a0,2
    d3e4:	fc0790e3          	bnez	a5,d3a4 <__ledf2+0x60>
    d3e8:	fcd59ee3          	bne	a1,a3,d3c4 <__ledf2+0x80>
    d3ec:	00000513          	li	a0,0
    d3f0:	00008067          	ret
    d3f4:	fc0508e3          	beqz	a0,d3c4 <__ledf2+0x80>
    d3f8:	fcd596e3          	bne	a1,a3,d3c4 <__ledf2+0x80>
    d3fc:	fd1544e3          	blt	a0,a7,d3c4 <__ledf2+0x80>
    d400:	00a8cc63          	blt	a7,a0,d418 <__ledf2+0xd4>
    d404:	fdc7e0e3          	bltu	a5,t3,d3c4 <__ledf2+0x80>
    d408:	00fe1863          	bne	t3,a5,d418 <__ledf2+0xd4>
    d40c:	fbdf6ce3          	bltu	t5,t4,d3c4 <__ledf2+0x80>
    d410:	00000513          	li	a0,0
    d414:	f9eef8e3          	bgeu	t4,t5,d3a4 <__ledf2+0x60>
    d418:	00100513          	li	a0,1
    d41c:	f80594e3          	bnez	a1,d3a4 <__ledf2+0x60>
    d420:	fff00513          	li	a0,-1
    d424:	00008067          	ret
    d428:	f6080ae3          	beqz	a6,d39c <__ledf2+0x58>
    d42c:	f8d59ce3          	bne	a1,a3,d3c4 <__ledf2+0x80>
    d430:	fe9ff06f          	j	d418 <__ledf2+0xd4>
    d434:	00200513          	li	a0,2
    d438:	00008067          	ret
    d43c:	f80814e3          	bnez	a6,d3c4 <__ledf2+0x80>
    d440:	00008067          	ret
    d444:	fcd580e3          	beq	a1,a3,d404 <__ledf2+0xc0>
    d448:	f7dff06f          	j	d3c4 <__ledf2+0x80>

0000d44c <__muldf3>:
    d44c:	fd010113          	add	sp,sp,-48
    d450:	0145d793          	srl	a5,a1,0x14
    d454:	02812423          	sw	s0,40(sp)
    d458:	02912223          	sw	s1,36(sp)
    d45c:	03212023          	sw	s2,32(sp)
    d460:	01312e23          	sw	s3,28(sp)
    d464:	01512a23          	sw	s5,20(sp)
    d468:	00c59493          	sll	s1,a1,0xc
    d46c:	02112623          	sw	ra,44(sp)
    d470:	01412c23          	sw	s4,24(sp)
    d474:	01612823          	sw	s6,16(sp)
    d478:	01712623          	sw	s7,12(sp)
    d47c:	01812423          	sw	s8,8(sp)
    d480:	7ff7f793          	and	a5,a5,2047
    d484:	00050413          	mv	s0,a0
    d488:	00060a93          	mv	s5,a2
    d48c:	00068993          	mv	s3,a3
    d490:	00c4d493          	srl	s1,s1,0xc
    d494:	01f5d913          	srl	s2,a1,0x1f
    d498:	4e078063          	beqz	a5,d978 <__muldf3+0x52c>
    d49c:	7ff00713          	li	a4,2047
    d4a0:	0ae78663          	beq	a5,a4,d54c <__muldf3+0x100>
    d4a4:	00349693          	sll	a3,s1,0x3
    d4a8:	01d55713          	srl	a4,a0,0x1d
    d4ac:	00d76733          	or	a4,a4,a3
    d4b0:	008006b7          	lui	a3,0x800
    d4b4:	00d764b3          	or	s1,a4,a3
    d4b8:	00351a13          	sll	s4,a0,0x3
    d4bc:	c0178c13          	add	s8,a5,-1023
    d4c0:	00000b13          	li	s6,0
    d4c4:	00000b93          	li	s7,0
    d4c8:	0149d793          	srl	a5,s3,0x14
    d4cc:	00c99713          	sll	a4,s3,0xc
    d4d0:	7ff7f793          	and	a5,a5,2047
    d4d4:	000a8e13          	mv	t3,s5
    d4d8:	00c75413          	srl	s0,a4,0xc
    d4dc:	01f9d993          	srl	s3,s3,0x1f
    d4e0:	0a078063          	beqz	a5,d580 <__muldf3+0x134>
    d4e4:	7ff00713          	li	a4,2047
    d4e8:	14e78e63          	beq	a5,a4,d644 <__muldf3+0x1f8>
    d4ec:	00341713          	sll	a4,s0,0x3
    d4f0:	01dad693          	srl	a3,s5,0x1d
    d4f4:	00e6e6b3          	or	a3,a3,a4
    d4f8:	c0178793          	add	a5,a5,-1023
    d4fc:	00800737          	lui	a4,0x800
    d500:	00e6e433          	or	s0,a3,a4
    d504:	003a9e13          	sll	t3,s5,0x3
    d508:	01878333          	add	t1,a5,s8
    d50c:	00000693          	li	a3,0
    d510:	00a00793          	li	a5,10
    d514:	00130893          	add	a7,t1,1
    d518:	0b67cc63          	blt	a5,s6,d5d0 <__muldf3+0x184>
    d51c:	013945b3          	xor	a1,s2,s3
    d520:	00200793          	li	a5,2
    d524:	00058813          	mv	a6,a1
    d528:	1567c663          	blt	a5,s6,d674 <__muldf3+0x228>
    d52c:	fffb0b13          	add	s6,s6,-1
    d530:	00100713          	li	a4,1
    d534:	17676063          	bltu	a4,s6,d694 <__muldf3+0x248>
    d538:	48f68663          	beq	a3,a5,d9c4 <__muldf3+0x578>
    d53c:	00040493          	mv	s1,s0
    d540:	000e0a13          	mv	s4,t3
    d544:	00068b93          	mv	s7,a3
    d548:	09c0006f          	j	d5e4 <__muldf3+0x198>
    d54c:	00a4ea33          	or	s4,s1,a0
    d550:	480a1463          	bnez	s4,d9d8 <__muldf3+0x58c>
    d554:	0149d793          	srl	a5,s3,0x14
    d558:	00c99713          	sll	a4,s3,0xc
    d55c:	7ff7f793          	and	a5,a5,2047
    d560:	00000493          	li	s1,0
    d564:	00800b13          	li	s6,8
    d568:	7ff00c13          	li	s8,2047
    d56c:	00200b93          	li	s7,2
    d570:	000a8e13          	mv	t3,s5
    d574:	00c75413          	srl	s0,a4,0xc
    d578:	01f9d993          	srl	s3,s3,0x1f
    d57c:	f60794e3          	bnez	a5,d4e4 <__muldf3+0x98>
    d580:	015467b3          	or	a5,s0,s5
    d584:	46078e63          	beqz	a5,da00 <__muldf3+0x5b4>
    d588:	54040c63          	beqz	s0,dae0 <__muldf3+0x694>
    d58c:	00040513          	mv	a0,s0
    d590:	6f4010ef          	jal	ec84 <__clzsi2>
    d594:	00050313          	mv	t1,a0
    d598:	ff550713          	add	a4,a0,-11
    d59c:	01d00793          	li	a5,29
    d5a0:	ff830e13          	add	t3,t1,-8
    d5a4:	40e787b3          	sub	a5,a5,a4
    d5a8:	00fad7b3          	srl	a5,s5,a5
    d5ac:	01c41733          	sll	a4,s0,t3
    d5b0:	00e7e433          	or	s0,a5,a4
    d5b4:	01ca9e33          	sll	t3,s5,t3
    d5b8:	406c0333          	sub	t1,s8,t1
    d5bc:	c0d30313          	add	t1,t1,-1011
    d5c0:	00a00793          	li	a5,10
    d5c4:	00000693          	li	a3,0
    d5c8:	00130893          	add	a7,t1,1
    d5cc:	f567d8e3          	bge	a5,s6,d51c <__muldf3+0xd0>
    d5d0:	00090593          	mv	a1,s2
    d5d4:	00200793          	li	a5,2
    d5d8:	3efb8663          	beq	s7,a5,d9c4 <__muldf3+0x578>
    d5dc:	00300793          	li	a5,3
    d5e0:	54fb8863          	beq	s7,a5,db30 <__muldf3+0x6e4>
    d5e4:	00100793          	li	a5,1
    d5e8:	00058813          	mv	a6,a1
    d5ec:	52fb9663          	bne	s7,a5,db18 <__muldf3+0x6cc>
    d5f0:	00000793          	li	a5,0
    d5f4:	00000693          	li	a3,0
    d5f8:	00000713          	li	a4,0
    d5fc:	02c12083          	lw	ra,44(sp)
    d600:	02812403          	lw	s0,40(sp)
    d604:	01479793          	sll	a5,a5,0x14
    d608:	00d7e7b3          	or	a5,a5,a3
    d60c:	01f81813          	sll	a6,a6,0x1f
    d610:	0107e7b3          	or	a5,a5,a6
    d614:	02412483          	lw	s1,36(sp)
    d618:	02012903          	lw	s2,32(sp)
    d61c:	01c12983          	lw	s3,28(sp)
    d620:	01812a03          	lw	s4,24(sp)
    d624:	01412a83          	lw	s5,20(sp)
    d628:	01012b03          	lw	s6,16(sp)
    d62c:	00c12b83          	lw	s7,12(sp)
    d630:	00812c03          	lw	s8,8(sp)
    d634:	00070513          	mv	a0,a4
    d638:	00078593          	mv	a1,a5
    d63c:	03010113          	add	sp,sp,48
    d640:	00008067          	ret
    d644:	01546733          	or	a4,s0,s5
    d648:	7ffc0313          	add	t1,s8,2047
    d64c:	3c070663          	beqz	a4,da18 <__muldf3+0x5cc>
    d650:	00001737          	lui	a4,0x1
    d654:	01394833          	xor	a6,s2,s3
    d658:	80070713          	add	a4,a4,-2048 # 800 <main+0x530>
    d65c:	003b6b13          	or	s6,s6,3
    d660:	00a00693          	li	a3,10
    d664:	00080593          	mv	a1,a6
    d668:	00ec08b3          	add	a7,s8,a4
    d66c:	4366cc63          	blt	a3,s6,daa4 <__muldf3+0x658>
    d670:	00300693          	li	a3,3
    d674:	00100613          	li	a2,1
    d678:	01661633          	sll	a2,a2,s6
    d67c:	53067713          	and	a4,a2,1328
    d680:	f4071ae3          	bnez	a4,d5d4 <__muldf3+0x188>
    d684:	24067793          	and	a5,a2,576
    d688:	48079063          	bnez	a5,db08 <__muldf3+0x6bc>
    d68c:	08867613          	and	a2,a2,136
    d690:	38061e63          	bnez	a2,da2c <__muldf3+0x5e0>
    d694:	00010fb7          	lui	t6,0x10
    d698:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d69c:	005a7f33          	and	t5,s4,t0
    d6a0:	005e72b3          	and	t0,t3,t0
    d6a4:	010a5a13          	srl	s4,s4,0x10
    d6a8:	010e5e13          	srl	t3,t3,0x10
    d6ac:	000f0513          	mv	a0,t5
    d6b0:	00028593          	mv	a1,t0
    d6b4:	460010ef          	jal	eb14 <__mulsi3>
    d6b8:	00050713          	mv	a4,a0
    d6bc:	000e0593          	mv	a1,t3
    d6c0:	000f0513          	mv	a0,t5
    d6c4:	450010ef          	jal	eb14 <__mulsi3>
    d6c8:	00050793          	mv	a5,a0
    d6cc:	00028593          	mv	a1,t0
    d6d0:	000a0513          	mv	a0,s4
    d6d4:	440010ef          	jal	eb14 <__mulsi3>
    d6d8:	00050e93          	mv	t4,a0
    d6dc:	000e0593          	mv	a1,t3
    d6e0:	000a0513          	mv	a0,s4
    d6e4:	430010ef          	jal	eb14 <__mulsi3>
    d6e8:	01d786b3          	add	a3,a5,t4
    d6ec:	01075393          	srl	t2,a4,0x10
    d6f0:	00d383b3          	add	t2,t2,a3
    d6f4:	00050793          	mv	a5,a0
    d6f8:	01d3f463          	bgeu	t2,t4,d700 <__muldf3+0x2b4>
    d6fc:	01f507b3          	add	a5,a0,t6
    d700:	000109b7          	lui	s3,0x10
    d704:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d708:	0123feb3          	and	t4,t2,s2
    d70c:	01277733          	and	a4,a4,s2
    d710:	010e9e93          	sll	t4,t4,0x10
    d714:	01247933          	and	s2,s0,s2
    d718:	0103d393          	srl	t2,t2,0x10
    d71c:	00ee8eb3          	add	t4,t4,a4
    d720:	01045413          	srl	s0,s0,0x10
    d724:	000f0513          	mv	a0,t5
    d728:	00090593          	mv	a1,s2
    d72c:	3e8010ef          	jal	eb14 <__mulsi3>
    d730:	00050f93          	mv	t6,a0
    d734:	00040593          	mv	a1,s0
    d738:	000f0513          	mv	a0,t5
    d73c:	3d8010ef          	jal	eb14 <__mulsi3>
    d740:	00050713          	mv	a4,a0
    d744:	00090593          	mv	a1,s2
    d748:	000a0513          	mv	a0,s4
    d74c:	3c8010ef          	jal	eb14 <__mulsi3>
    d750:	00050f13          	mv	t5,a0
    d754:	00040593          	mv	a1,s0
    d758:	000a0513          	mv	a0,s4
    d75c:	3b8010ef          	jal	eb14 <__mulsi3>
    d760:	010fd693          	srl	a3,t6,0x10
    d764:	01e70733          	add	a4,a4,t5
    d768:	00e686b3          	add	a3,a3,a4
    d76c:	01e6f463          	bgeu	a3,t5,d774 <__muldf3+0x328>
    d770:	01350533          	add	a0,a0,s3
    d774:	00010a37          	lui	s4,0x10
    d778:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d77c:	01e6f733          	and	a4,a3,t5
    d780:	01efffb3          	and	t6,t6,t5
    d784:	01071713          	sll	a4,a4,0x10
    d788:	01f70733          	add	a4,a4,t6
    d78c:	01e4ff33          	and	t5,s1,t5
    d790:	0106d693          	srl	a3,a3,0x10
    d794:	00a68fb3          	add	t6,a3,a0
    d798:	00e383b3          	add	t2,t2,a4
    d79c:	0104d493          	srl	s1,s1,0x10
    d7a0:	000f0513          	mv	a0,t5
    d7a4:	00028593          	mv	a1,t0
    d7a8:	36c010ef          	jal	eb14 <__mulsi3>
    d7ac:	00050a93          	mv	s5,a0
    d7b0:	000e0593          	mv	a1,t3
    d7b4:	000f0513          	mv	a0,t5
    d7b8:	35c010ef          	jal	eb14 <__mulsi3>
    d7bc:	00050993          	mv	s3,a0
    d7c0:	00028593          	mv	a1,t0
    d7c4:	00048513          	mv	a0,s1
    d7c8:	34c010ef          	jal	eb14 <__mulsi3>
    d7cc:	00050293          	mv	t0,a0
    d7d0:	000e0593          	mv	a1,t3
    d7d4:	00048513          	mv	a0,s1
    d7d8:	33c010ef          	jal	eb14 <__mulsi3>
    d7dc:	010ad613          	srl	a2,s5,0x10
    d7e0:	005989b3          	add	s3,s3,t0
    d7e4:	01360633          	add	a2,a2,s3
    d7e8:	00567463          	bgeu	a2,t0,d7f0 <__muldf3+0x3a4>
    d7ec:	01450533          	add	a0,a0,s4
    d7f0:	00010a37          	lui	s4,0x10
    d7f4:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d7f8:	00d672b3          	and	t0,a2,a3
    d7fc:	00dafab3          	and	s5,s5,a3
    d800:	01065613          	srl	a2,a2,0x10
    d804:	01029293          	sll	t0,t0,0x10
    d808:	00a60e33          	add	t3,a2,a0
    d80c:	015282b3          	add	t0,t0,s5
    d810:	000f0513          	mv	a0,t5
    d814:	00090593          	mv	a1,s2
    d818:	2fc010ef          	jal	eb14 <__mulsi3>
    d81c:	00050993          	mv	s3,a0
    d820:	00040593          	mv	a1,s0
    d824:	000f0513          	mv	a0,t5
    d828:	2ec010ef          	jal	eb14 <__mulsi3>
    d82c:	00050f13          	mv	t5,a0
    d830:	00090593          	mv	a1,s2
    d834:	00048513          	mv	a0,s1
    d838:	2dc010ef          	jal	eb14 <__mulsi3>
    d83c:	00050913          	mv	s2,a0
    d840:	00040593          	mv	a1,s0
    d844:	00048513          	mv	a0,s1
    d848:	2cc010ef          	jal	eb14 <__mulsi3>
    d84c:	012f06b3          	add	a3,t5,s2
    d850:	0109d593          	srl	a1,s3,0x10
    d854:	00d58433          	add	s0,a1,a3
    d858:	00050f13          	mv	t5,a0
    d85c:	01247463          	bgeu	s0,s2,d864 <__muldf3+0x418>
    d860:	01450f33          	add	t5,a0,s4
    d864:	00010637          	lui	a2,0x10
    d868:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x79f>
    d86c:	00c476b3          	and	a3,s0,a2
    d870:	00c9f9b3          	and	s3,s3,a2
    d874:	01069693          	sll	a3,a3,0x10
    d878:	007787b3          	add	a5,a5,t2
    d87c:	013686b3          	add	a3,a3,s3
    d880:	01f685b3          	add	a1,a3,t6
    d884:	00e7b733          	sltu	a4,a5,a4
    d888:	00e58733          	add	a4,a1,a4
    d88c:	005782b3          	add	t0,a5,t0
    d890:	01c70633          	add	a2,a4,t3
    d894:	00f2b7b3          	sltu	a5,t0,a5
    d898:	00f607b3          	add	a5,a2,a5
    d89c:	00d5b6b3          	sltu	a3,a1,a3
    d8a0:	00b735b3          	sltu	a1,a4,a1
    d8a4:	00b6e6b3          	or	a3,a3,a1
    d8a8:	00e63733          	sltu	a4,a2,a4
    d8ac:	01045593          	srl	a1,s0,0x10
    d8b0:	00c7b633          	sltu	a2,a5,a2
    d8b4:	00b686b3          	add	a3,a3,a1
    d8b8:	00929a13          	sll	s4,t0,0x9
    d8bc:	00c76733          	or	a4,a4,a2
    d8c0:	00d70733          	add	a4,a4,a3
    d8c4:	01da6a33          	or	s4,s4,t4
    d8c8:	01e70733          	add	a4,a4,t5
    d8cc:	01403a33          	snez	s4,s4
    d8d0:	0172d293          	srl	t0,t0,0x17
    d8d4:	00971713          	sll	a4,a4,0x9
    d8d8:	0177d693          	srl	a3,a5,0x17
    d8dc:	005a6a33          	or	s4,s4,t0
    d8e0:	00979793          	sll	a5,a5,0x9
    d8e4:	00fa6a33          	or	s4,s4,a5
    d8e8:	00771793          	sll	a5,a4,0x7
    d8ec:	00d764b3          	or	s1,a4,a3
    d8f0:	0207d063          	bgez	a5,d910 <__muldf3+0x4c4>
    d8f4:	001a5793          	srl	a5,s4,0x1
    d8f8:	001a7a13          	and	s4,s4,1
    d8fc:	01f49713          	sll	a4,s1,0x1f
    d900:	0147e7b3          	or	a5,a5,s4
    d904:	00e7ea33          	or	s4,a5,a4
    d908:	0014d493          	srl	s1,s1,0x1
    d90c:	00088313          	mv	t1,a7
    d910:	3ff30793          	add	a5,t1,1023
    d914:	12f05663          	blez	a5,da40 <__muldf3+0x5f4>
    d918:	007a7713          	and	a4,s4,7
    d91c:	02070063          	beqz	a4,d93c <__muldf3+0x4f0>
    d920:	00fa7713          	and	a4,s4,15
    d924:	00400693          	li	a3,4
    d928:	00d70a63          	beq	a4,a3,d93c <__muldf3+0x4f0>
    d92c:	004a0713          	add	a4,s4,4
    d930:	01473a33          	sltu	s4,a4,s4
    d934:	014484b3          	add	s1,s1,s4
    d938:	00070a13          	mv	s4,a4
    d93c:	00749713          	sll	a4,s1,0x7
    d940:	00075a63          	bgez	a4,d954 <__muldf3+0x508>
    d944:	ff0007b7          	lui	a5,0xff000
    d948:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    d94c:	00f4f4b3          	and	s1,s1,a5
    d950:	40030793          	add	a5,t1,1024
    d954:	7fe00713          	li	a4,2046
    d958:	1cf74463          	blt	a4,a5,db20 <__muldf3+0x6d4>
    d95c:	003a5a13          	srl	s4,s4,0x3
    d960:	01d49713          	sll	a4,s1,0x1d
    d964:	00949693          	sll	a3,s1,0x9
    d968:	01476733          	or	a4,a4,s4
    d96c:	00c6d693          	srl	a3,a3,0xc
    d970:	7ff7f793          	and	a5,a5,2047
    d974:	c89ff06f          	j	d5fc <__muldf3+0x1b0>
    d978:	00a4ea33          	or	s4,s1,a0
    d97c:	060a0863          	beqz	s4,d9ec <__muldf3+0x5a0>
    d980:	12048e63          	beqz	s1,dabc <__muldf3+0x670>
    d984:	00048513          	mv	a0,s1
    d988:	2fc010ef          	jal	ec84 <__clzsi2>
    d98c:	00050713          	mv	a4,a0
    d990:	ff550693          	add	a3,a0,-11
    d994:	01d00793          	li	a5,29
    d998:	ff870a13          	add	s4,a4,-8
    d99c:	40d787b3          	sub	a5,a5,a3
    d9a0:	00f457b3          	srl	a5,s0,a5
    d9a4:	014496b3          	sll	a3,s1,s4
    d9a8:	00d7e4b3          	or	s1,a5,a3
    d9ac:	01441a33          	sll	s4,s0,s4
    d9b0:	c0d00793          	li	a5,-1011
    d9b4:	40e78c33          	sub	s8,a5,a4
    d9b8:	00000b13          	li	s6,0
    d9bc:	00000b93          	li	s7,0
    d9c0:	b09ff06f          	j	d4c8 <__muldf3+0x7c>
    d9c4:	00058813          	mv	a6,a1
    d9c8:	7ff00793          	li	a5,2047
    d9cc:	00000693          	li	a3,0
    d9d0:	00000713          	li	a4,0
    d9d4:	c29ff06f          	j	d5fc <__muldf3+0x1b0>
    d9d8:	00050a13          	mv	s4,a0
    d9dc:	00c00b13          	li	s6,12
    d9e0:	7ff00c13          	li	s8,2047
    d9e4:	00300b93          	li	s7,3
    d9e8:	ae1ff06f          	j	d4c8 <__muldf3+0x7c>
    d9ec:	00000493          	li	s1,0
    d9f0:	00400b13          	li	s6,4
    d9f4:	00000c13          	li	s8,0
    d9f8:	00100b93          	li	s7,1
    d9fc:	acdff06f          	j	d4c8 <__muldf3+0x7c>
    da00:	001b6b13          	or	s6,s6,1
    da04:	000c0313          	mv	t1,s8
    da08:	00000413          	li	s0,0
    da0c:	00000e13          	li	t3,0
    da10:	00100693          	li	a3,1
    da14:	afdff06f          	j	d510 <__muldf3+0xc4>
    da18:	002b6b13          	or	s6,s6,2
    da1c:	00000413          	li	s0,0
    da20:	00000e13          	li	t3,0
    da24:	00200693          	li	a3,2
    da28:	ae9ff06f          	j	d510 <__muldf3+0xc4>
    da2c:	00040493          	mv	s1,s0
    da30:	000e0a13          	mv	s4,t3
    da34:	00068b93          	mv	s7,a3
    da38:	00098593          	mv	a1,s3
    da3c:	b99ff06f          	j	d5d4 <__muldf3+0x188>
    da40:	00100713          	li	a4,1
    da44:	10079063          	bnez	a5,db44 <__muldf3+0x6f8>
    da48:	41e30313          	add	t1,t1,1054
    da4c:	006a1633          	sll	a2,s4,t1
    da50:	00c03633          	snez	a2,a2
    da54:	00649333          	sll	t1,s1,t1
    da58:	00ea5a33          	srl	s4,s4,a4
    da5c:	00666633          	or	a2,a2,t1
    da60:	01466633          	or	a2,a2,s4
    da64:	00767793          	and	a5,a2,7
    da68:	00e4d5b3          	srl	a1,s1,a4
    da6c:	02078063          	beqz	a5,da8c <__muldf3+0x640>
    da70:	00f67793          	and	a5,a2,15
    da74:	00400713          	li	a4,4
    da78:	00e78a63          	beq	a5,a4,da8c <__muldf3+0x640>
    da7c:	00460793          	add	a5,a2,4
    da80:	00c7b633          	sltu	a2,a5,a2
    da84:	00c585b3          	add	a1,a1,a2
    da88:	00078613          	mv	a2,a5
    da8c:	00859513          	sll	a0,a1,0x8
    da90:	00100793          	li	a5,1
    da94:	00000693          	li	a3,0
    da98:	00000713          	li	a4,0
    da9c:	b60540e3          	bltz	a0,d5fc <__muldf3+0x1b0>
    daa0:	10c0006f          	j	dbac <__muldf3+0x760>
    daa4:	00f00713          	li	a4,15
    daa8:	12eb1063          	bne	s6,a4,dbc8 <__muldf3+0x77c>
    daac:	00000813          	li	a6,0
    dab0:	000806b7          	lui	a3,0x80
    dab4:	00000713          	li	a4,0
    dab8:	b45ff06f          	j	d5fc <__muldf3+0x1b0>
    dabc:	1c8010ef          	jal	ec84 <__clzsi2>
    dac0:	01550693          	add	a3,a0,21
    dac4:	01c00793          	li	a5,28
    dac8:	02050713          	add	a4,a0,32
    dacc:	ecd7d4e3          	bge	a5,a3,d994 <__muldf3+0x548>
    dad0:	ff850513          	add	a0,a0,-8
    dad4:	00000a13          	li	s4,0
    dad8:	00a414b3          	sll	s1,s0,a0
    dadc:	ed5ff06f          	j	d9b0 <__muldf3+0x564>
    dae0:	000a8513          	mv	a0,s5
    dae4:	1a0010ef          	jal	ec84 <__clzsi2>
    dae8:	01550713          	add	a4,a0,21
    daec:	01c00793          	li	a5,28
    daf0:	02050313          	add	t1,a0,32
    daf4:	aae7d4e3          	bge	a5,a4,d59c <__muldf3+0x150>
    daf8:	ff850513          	add	a0,a0,-8
    dafc:	00000e13          	li	t3,0
    db00:	00aa9433          	sll	s0,s5,a0
    db04:	ab5ff06f          	j	d5b8 <__muldf3+0x16c>
    db08:	00000813          	li	a6,0
    db0c:	7ff00793          	li	a5,2047
    db10:	000806b7          	lui	a3,0x80
    db14:	ae9ff06f          	j	d5fc <__muldf3+0x1b0>
    db18:	00088313          	mv	t1,a7
    db1c:	df5ff06f          	j	d910 <__muldf3+0x4c4>
    db20:	7ff00793          	li	a5,2047
    db24:	00000693          	li	a3,0
    db28:	00000713          	li	a4,0
    db2c:	ad1ff06f          	j	d5fc <__muldf3+0x1b0>
    db30:	00000813          	li	a6,0
    db34:	7ff00793          	li	a5,2047
    db38:	000806b7          	lui	a3,0x80
    db3c:	00000713          	li	a4,0
    db40:	abdff06f          	j	d5fc <__muldf3+0x1b0>
    db44:	40f70733          	sub	a4,a4,a5
    db48:	03800693          	li	a3,56
    db4c:	aae6c2e3          	blt	a3,a4,d5f0 <__muldf3+0x1a4>
    db50:	01f00693          	li	a3,31
    db54:	eee6dae3          	bge	a3,a4,da48 <__muldf3+0x5fc>
    db58:	fe100693          	li	a3,-31
    db5c:	40f687b3          	sub	a5,a3,a5
    db60:	02000693          	li	a3,32
    db64:	00f4d7b3          	srl	a5,s1,a5
    db68:	00d70863          	beq	a4,a3,db78 <__muldf3+0x72c>
    db6c:	43e30313          	add	t1,t1,1086
    db70:	00649333          	sll	t1,s1,t1
    db74:	006a6a33          	or	s4,s4,t1
    db78:	01403633          	snez	a2,s4
    db7c:	00f66633          	or	a2,a2,a5
    db80:	00767713          	and	a4,a2,7
    db84:	00000693          	li	a3,0
    db88:	02070863          	beqz	a4,dbb8 <__muldf3+0x76c>
    db8c:	00f67793          	and	a5,a2,15
    db90:	00400713          	li	a4,4
    db94:	00000593          	li	a1,0
    db98:	00e78a63          	beq	a5,a4,dbac <__muldf3+0x760>
    db9c:	00460793          	add	a5,a2,4
    dba0:	00c7b633          	sltu	a2,a5,a2
    dba4:	00c035b3          	snez	a1,a2
    dba8:	00078613          	mv	a2,a5
    dbac:	00959693          	sll	a3,a1,0x9
    dbb0:	01d59713          	sll	a4,a1,0x1d
    dbb4:	00c6d693          	srl	a3,a3,0xc
    dbb8:	00365613          	srl	a2,a2,0x3
    dbbc:	00e66733          	or	a4,a2,a4
    dbc0:	00000793          	li	a5,0
    dbc4:	a39ff06f          	j	d5fc <__muldf3+0x1b0>
    dbc8:	00040493          	mv	s1,s0
    dbcc:	000a8a13          	mv	s4,s5
    dbd0:	00300b93          	li	s7,3
    dbd4:	00098593          	mv	a1,s3
    dbd8:	9fdff06f          	j	d5d4 <__muldf3+0x188>

0000dbdc <__subdf3>:
    dbdc:	001007b7          	lui	a5,0x100
    dbe0:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    dbe4:	fe010113          	add	sp,sp,-32
    dbe8:	00b7f8b3          	and	a7,a5,a1
    dbec:	00d7f833          	and	a6,a5,a3
    dbf0:	0146d793          	srl	a5,a3,0x14
    dbf4:	00389893          	sll	a7,a7,0x3
    dbf8:	00812c23          	sw	s0,24(sp)
    dbfc:	01312623          	sw	s3,12(sp)
    dc00:	01f5d413          	srl	s0,a1,0x1f
    dc04:	0145d993          	srl	s3,a1,0x14
    dc08:	01d55713          	srl	a4,a0,0x1d
    dc0c:	00381813          	sll	a6,a6,0x3
    dc10:	01d65593          	srl	a1,a2,0x1d
    dc14:	00112e23          	sw	ra,28(sp)
    dc18:	00912a23          	sw	s1,20(sp)
    dc1c:	01212823          	sw	s2,16(sp)
    dc20:	7ff7ff13          	and	t5,a5,2047
    dc24:	7ff00313          	li	t1,2047
    dc28:	01176733          	or	a4,a4,a7
    dc2c:	7ff9f993          	and	s3,s3,2047
    dc30:	00040e13          	mv	t3,s0
    dc34:	00351893          	sll	a7,a0,0x3
    dc38:	01f6d693          	srl	a3,a3,0x1f
    dc3c:	0105e5b3          	or	a1,a1,a6
    dc40:	00361e93          	sll	t4,a2,0x3
    dc44:	206f0c63          	beq	t5,t1,de5c <__subdf3+0x280>
    dc48:	0016c693          	xor	a3,a3,1
    dc4c:	41e987b3          	sub	a5,s3,t5
    dc50:	16d40263          	beq	s0,a3,ddb4 <__subdf3+0x1d8>
    dc54:	00f05ae3          	blez	a5,e468 <__subdf3+0x88c>
    dc58:	240f0a63          	beqz	t5,deac <__subdf3+0x2d0>
    dc5c:	3c698463          	beq	s3,t1,e024 <__subdf3+0x448>
    dc60:	03800693          	li	a3,56
    dc64:	00100513          	li	a0,1
    dc68:	02f6ce63          	blt	a3,a5,dca4 <__subdf3+0xc8>
    dc6c:	008006b7          	lui	a3,0x800
    dc70:	00d5e5b3          	or	a1,a1,a3
    dc74:	01f00693          	li	a3,31
    dc78:	4ef6c463          	blt	a3,a5,e160 <__subdf3+0x584>
    dc7c:	02000693          	li	a3,32
    dc80:	40f686b3          	sub	a3,a3,a5
    dc84:	00d59533          	sll	a0,a1,a3
    dc88:	00fed633          	srl	a2,t4,a5
    dc8c:	00de96b3          	sll	a3,t4,a3
    dc90:	00c56533          	or	a0,a0,a2
    dc94:	00d036b3          	snez	a3,a3
    dc98:	00f5d7b3          	srl	a5,a1,a5
    dc9c:	00d56533          	or	a0,a0,a3
    dca0:	40f70733          	sub	a4,a4,a5
    dca4:	40a88533          	sub	a0,a7,a0
    dca8:	00a8b633          	sltu	a2,a7,a0
    dcac:	00050493          	mv	s1,a0
    dcb0:	40c70933          	sub	s2,a4,a2
    dcb4:	00891793          	sll	a5,s2,0x8
    dcb8:	3407d863          	bgez	a5,e008 <__subdf3+0x42c>
    dcbc:	008007b7          	lui	a5,0x800
    dcc0:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    dcc4:	00f97933          	and	s2,s2,a5
    dcc8:	2e090663          	beqz	s2,dfb4 <__subdf3+0x3d8>
    dccc:	00090513          	mv	a0,s2
    dcd0:	7b5000ef          	jal	ec84 <__clzsi2>
    dcd4:	ff850793          	add	a5,a0,-8
    dcd8:	02000693          	li	a3,32
    dcdc:	40f68733          	sub	a4,a3,a5
    dce0:	00e4d733          	srl	a4,s1,a4
    dce4:	00f91933          	sll	s2,s2,a5
    dce8:	01276733          	or	a4,a4,s2
    dcec:	00f494b3          	sll	s1,s1,a5
    dcf0:	3f37c463          	blt	a5,s3,e0d8 <__subdf3+0x4fc>
    dcf4:	413787b3          	sub	a5,a5,s3
    dcf8:	00178793          	add	a5,a5,1
    dcfc:	40f686b3          	sub	a3,a3,a5
    dd00:	00d49633          	sll	a2,s1,a3
    dd04:	00f4d933          	srl	s2,s1,a5
    dd08:	00c03633          	snez	a2,a2
    dd0c:	00c96633          	or	a2,s2,a2
    dd10:	00d716b3          	sll	a3,a4,a3
    dd14:	00c6e4b3          	or	s1,a3,a2
    dd18:	00f75933          	srl	s2,a4,a5
    dd1c:	00000993          	li	s3,0
    dd20:	0074f793          	and	a5,s1,7
    dd24:	02078063          	beqz	a5,dd44 <__subdf3+0x168>
    dd28:	00f4f793          	and	a5,s1,15
    dd2c:	00400713          	li	a4,4
    dd30:	00e78a63          	beq	a5,a4,dd44 <__subdf3+0x168>
    dd34:	00448793          	add	a5,s1,4
    dd38:	0097b533          	sltu	a0,a5,s1
    dd3c:	00a90933          	add	s2,s2,a0
    dd40:	00078493          	mv	s1,a5
    dd44:	00891793          	sll	a5,s2,0x8
    dd48:	6c07d063          	bgez	a5,e408 <__subdf3+0x82c>
    dd4c:	00198793          	add	a5,s3,1
    dd50:	7ff00713          	li	a4,2047
    dd54:	24e78663          	beq	a5,a4,dfa0 <__subdf3+0x3c4>
    dd58:	ff800737          	lui	a4,0xff800
    dd5c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dd60:	00e97733          	and	a4,s2,a4
    dd64:	7ff7f793          	and	a5,a5,2047
    dd68:	01d71813          	sll	a6,a4,0x1d
    dd6c:	0034d513          	srl	a0,s1,0x3
    dd70:	00971713          	sll	a4,a4,0x9
    dd74:	00a86833          	or	a6,a6,a0
    dd78:	00c75713          	srl	a4,a4,0xc
    dd7c:	00147e13          	and	t3,s0,1
    dd80:	01c12083          	lw	ra,28(sp)
    dd84:	01812403          	lw	s0,24(sp)
    dd88:	01479793          	sll	a5,a5,0x14
    dd8c:	00e7e7b3          	or	a5,a5,a4
    dd90:	01fe1713          	sll	a4,t3,0x1f
    dd94:	00e7e7b3          	or	a5,a5,a4
    dd98:	01412483          	lw	s1,20(sp)
    dd9c:	01012903          	lw	s2,16(sp)
    dda0:	00c12983          	lw	s3,12(sp)
    dda4:	00080513          	mv	a0,a6
    dda8:	00078593          	mv	a1,a5
    ddac:	02010113          	add	sp,sp,32
    ddb0:	00008067          	ret
    ddb4:	70f05263          	blez	a5,e4b8 <__subdf3+0x8dc>
    ddb8:	1c0f1663          	bnez	t5,df84 <__subdf3+0x3a8>
    ddbc:	01d5e6b3          	or	a3,a1,t4
    ddc0:	26068e63          	beqz	a3,e03c <__subdf3+0x460>
    ddc4:	fff78693          	add	a3,a5,-1
    ddc8:	46068863          	beqz	a3,e238 <__subdf3+0x65c>
    ddcc:	24678c63          	beq	a5,t1,e024 <__subdf3+0x448>
    ddd0:	03800793          	li	a5,56
    ddd4:	00100913          	li	s2,1
    ddd8:	02d7cc63          	blt	a5,a3,de10 <__subdf3+0x234>
    dddc:	00068793          	mv	a5,a3
    dde0:	01f00693          	li	a3,31
    dde4:	48f6ca63          	blt	a3,a5,e278 <__subdf3+0x69c>
    dde8:	02000693          	li	a3,32
    ddec:	40f686b3          	sub	a3,a3,a5
    ddf0:	00d59933          	sll	s2,a1,a3
    ddf4:	00fed633          	srl	a2,t4,a5
    ddf8:	00de96b3          	sll	a3,t4,a3
    ddfc:	00c96933          	or	s2,s2,a2
    de00:	00d036b3          	snez	a3,a3
    de04:	00f5d7b3          	srl	a5,a1,a5
    de08:	00d96933          	or	s2,s2,a3
    de0c:	00f70733          	add	a4,a4,a5
    de10:	01190633          	add	a2,s2,a7
    de14:	01263933          	sltu	s2,a2,s2
    de18:	00060493          	mv	s1,a2
    de1c:	00e90933          	add	s2,s2,a4
    de20:	00891793          	sll	a5,s2,0x8
    de24:	1e07d263          	bgez	a5,e008 <__subdf3+0x42c>
    de28:	00198993          	add	s3,s3,1
    de2c:	7ff00793          	li	a5,2047
    de30:	16f98863          	beq	s3,a5,dfa0 <__subdf3+0x3c4>
    de34:	ff8007b7          	lui	a5,0xff800
    de38:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    de3c:	0014f513          	and	a0,s1,1
    de40:	00f977b3          	and	a5,s2,a5
    de44:	0014d713          	srl	a4,s1,0x1
    de48:	00a76733          	or	a4,a4,a0
    de4c:	01f79513          	sll	a0,a5,0x1f
    de50:	00e564b3          	or	s1,a0,a4
    de54:	0017d913          	srl	s2,a5,0x1
    de58:	ec9ff06f          	j	dd20 <__subdf3+0x144>
    de5c:	01d5e833          	or	a6,a1,t4
    de60:	80198313          	add	t1,s3,-2047
    de64:	06080863          	beqz	a6,ded4 <__subdf3+0x2f8>
    de68:	06d40a63          	beq	s0,a3,dedc <__subdf3+0x300>
    de6c:	0e030463          	beqz	t1,df54 <__subdf3+0x378>
    de70:	26098e63          	beqz	s3,e0ec <__subdf3+0x510>
    de74:	00361513          	sll	a0,a2,0x3
    de78:	00355513          	srl	a0,a0,0x3
    de7c:	00068413          	mv	s0,a3
    de80:	00058713          	mv	a4,a1
    de84:	01d71813          	sll	a6,a4,0x1d
    de88:	00a86833          	or	a6,a6,a0
    de8c:	00375713          	srl	a4,a4,0x3
    de90:	01076733          	or	a4,a4,a6
    de94:	10070663          	beqz	a4,dfa0 <__subdf3+0x3c4>
    de98:	00000e13          	li	t3,0
    de9c:	7ff00793          	li	a5,2047
    dea0:	00080737          	lui	a4,0x80
    dea4:	00000813          	li	a6,0
    dea8:	ed9ff06f          	j	dd80 <__subdf3+0x1a4>
    deac:	01d5e6b3          	or	a3,a1,t4
    deb0:	18068663          	beqz	a3,e03c <__subdf3+0x460>
    deb4:	fff78693          	add	a3,a5,-1
    deb8:	3a068263          	beqz	a3,e25c <__subdf3+0x680>
    debc:	16678463          	beq	a5,t1,e024 <__subdf3+0x448>
    dec0:	03800793          	li	a5,56
    dec4:	00100513          	li	a0,1
    dec8:	dcd7cee3          	blt	a5,a3,dca4 <__subdf3+0xc8>
    decc:	00068793          	mv	a5,a3
    ded0:	da5ff06f          	j	dc74 <__subdf3+0x98>
    ded4:	0016c693          	xor	a3,a3,1
    ded8:	f8d41ae3          	bne	s0,a3,de6c <__subdf3+0x290>
    dedc:	18030863          	beqz	t1,e06c <__subdf3+0x490>
    dee0:	2c099063          	bnez	s3,e1a0 <__subdf3+0x5c4>
    dee4:	7ff00793          	li	a5,2047
    dee8:	011766b3          	or	a3,a4,a7
    deec:	48068863          	beqz	a3,e37c <__subdf3+0x7a0>
    def0:	fff78693          	add	a3,a5,-1
    def4:	34068263          	beqz	a3,e238 <__subdf3+0x65c>
    def8:	7ff00513          	li	a0,2047
    defc:	2aa78263          	beq	a5,a0,e1a0 <__subdf3+0x5c4>
    df00:	03800793          	li	a5,56
    df04:	00100913          	li	s2,1
    df08:	02d7ca63          	blt	a5,a3,df3c <__subdf3+0x360>
    df0c:	01f00793          	li	a5,31
    df10:	4cd7c663          	blt	a5,a3,e3dc <__subdf3+0x800>
    df14:	02000793          	li	a5,32
    df18:	40d787b3          	sub	a5,a5,a3
    df1c:	00f71933          	sll	s2,a4,a5
    df20:	00d8d633          	srl	a2,a7,a3
    df24:	00f897b3          	sll	a5,a7,a5
    df28:	00c96933          	or	s2,s2,a2
    df2c:	00f037b3          	snez	a5,a5
    df30:	00d756b3          	srl	a3,a4,a3
    df34:	00f96933          	or	s2,s2,a5
    df38:	00d585b3          	add	a1,a1,a3
    df3c:	01d90733          	add	a4,s2,t4
    df40:	01273933          	sltu	s2,a4,s2
    df44:	00070493          	mv	s1,a4
    df48:	00b90933          	add	s2,s2,a1
    df4c:	000f0993          	mv	s3,t5
    df50:	ed1ff06f          	j	de20 <__subdf3+0x244>
    df54:	00198793          	add	a5,s3,1
    df58:	7fe7f793          	and	a5,a5,2046
    df5c:	14079463          	bnez	a5,e0a4 <__subdf3+0x4c8>
    df60:	01d5e833          	or	a6,a1,t4
    df64:	011767b3          	or	a5,a4,a7
    df68:	2a099463          	bnez	s3,e210 <__subdf3+0x634>
    df6c:	38078e63          	beqz	a5,e308 <__subdf3+0x72c>
    df70:	3c081063          	bnez	a6,e330 <__subdf3+0x754>
    df74:	00351513          	sll	a0,a0,0x3
    df78:	00355913          	srl	s2,a0,0x3
    df7c:	00000793          	li	a5,0
    df80:	1140006f          	j	e094 <__subdf3+0x4b8>
    df84:	0a698063          	beq	s3,t1,e024 <__subdf3+0x448>
    df88:	03800693          	li	a3,56
    df8c:	00100913          	li	s2,1
    df90:	e8f6c0e3          	blt	a3,a5,de10 <__subdf3+0x234>
    df94:	008006b7          	lui	a3,0x800
    df98:	00d5e5b3          	or	a1,a1,a3
    df9c:	e45ff06f          	j	dde0 <__subdf3+0x204>
    dfa0:	00147e13          	and	t3,s0,1
    dfa4:	7ff00793          	li	a5,2047
    dfa8:	00000713          	li	a4,0
    dfac:	00000813          	li	a6,0
    dfb0:	dd1ff06f          	j	dd80 <__subdf3+0x1a4>
    dfb4:	00048513          	mv	a0,s1
    dfb8:	4cd000ef          	jal	ec84 <__clzsi2>
    dfbc:	01850793          	add	a5,a0,24
    dfc0:	01f00693          	li	a3,31
    dfc4:	d0f6dae3          	bge	a3,a5,dcd8 <__subdf3+0xfc>
    dfc8:	ff850713          	add	a4,a0,-8
    dfcc:	00e49733          	sll	a4,s1,a4
    dfd0:	1b37ce63          	blt	a5,s3,e18c <__subdf3+0x5b0>
    dfd4:	413789b3          	sub	s3,a5,s3
    dfd8:	00198793          	add	a5,s3,1
    dfdc:	42f6de63          	bge	a3,a5,e418 <__subdf3+0x83c>
    dfe0:	fe198993          	add	s3,s3,-31
    dfe4:	02000693          	li	a3,32
    dfe8:	013754b3          	srl	s1,a4,s3
    dfec:	00d78c63          	beq	a5,a3,e004 <__subdf3+0x428>
    dff0:	04000693          	li	a3,64
    dff4:	40f687b3          	sub	a5,a3,a5
    dff8:	00f71733          	sll	a4,a4,a5
    dffc:	00e03733          	snez	a4,a4
    e000:	00e4e4b3          	or	s1,s1,a4
    e004:	00000993          	li	s3,0
    e008:	0074f793          	and	a5,s1,7
    e00c:	d0079ee3          	bnez	a5,dd28 <__subdf3+0x14c>
    e010:	00098793          	mv	a5,s3
    e014:	0034d513          	srl	a0,s1,0x3
    e018:	00090713          	mv	a4,s2
    e01c:	0280006f          	j	e044 <__subdf3+0x468>
    e020:	e6081ce3          	bnez	a6,de98 <__subdf3+0x2bc>
    e024:	00351513          	sll	a0,a0,0x3
    e028:	01d71813          	sll	a6,a4,0x1d
    e02c:	00355513          	srl	a0,a0,0x3
    e030:	00a86833          	or	a6,a6,a0
    e034:	00375713          	srl	a4,a4,0x3
    e038:	e59ff06f          	j	de90 <__subdf3+0x2b4>
    e03c:	00351513          	sll	a0,a0,0x3
    e040:	00355513          	srl	a0,a0,0x3
    e044:	01d71813          	sll	a6,a4,0x1d
    e048:	7ff00693          	li	a3,2047
    e04c:	00a86833          	or	a6,a6,a0
    e050:	00375713          	srl	a4,a4,0x3
    e054:	e2d78ee3          	beq	a5,a3,de90 <__subdf3+0x2b4>
    e058:	00c71713          	sll	a4,a4,0xc
    e05c:	00c75713          	srl	a4,a4,0xc
    e060:	7ff7f793          	and	a5,a5,2047
    e064:	00147e13          	and	t3,s0,1
    e068:	d19ff06f          	j	dd80 <__subdf3+0x1a4>
    e06c:	00198693          	add	a3,s3,1
    e070:	7fe6f793          	and	a5,a3,2046
    e074:	12079e63          	bnez	a5,e1b0 <__subdf3+0x5d4>
    e078:	011767b3          	or	a5,a4,a7
    e07c:	24099a63          	bnez	s3,e2d0 <__subdf3+0x6f4>
    e080:	30078663          	beqz	a5,e38c <__subdf3+0x7b0>
    e084:	01d5e7b3          	or	a5,a1,t4
    e088:	30079a63          	bnez	a5,e39c <__subdf3+0x7c0>
    e08c:	00351513          	sll	a0,a0,0x3
    e090:	00355913          	srl	s2,a0,0x3
    e094:	01d71813          	sll	a6,a4,0x1d
    e098:	01286833          	or	a6,a6,s2
    e09c:	00375713          	srl	a4,a4,0x3
    e0a0:	fb9ff06f          	j	e058 <__subdf3+0x47c>
    e0a4:	41d88833          	sub	a6,a7,t4
    e0a8:	0108b7b3          	sltu	a5,a7,a6
    e0ac:	40b70933          	sub	s2,a4,a1
    e0b0:	40f90933          	sub	s2,s2,a5
    e0b4:	00891793          	sll	a5,s2,0x8
    e0b8:	00080493          	mv	s1,a6
    e0bc:	1207c263          	bltz	a5,e1e0 <__subdf3+0x604>
    e0c0:	01286833          	or	a6,a6,s2
    e0c4:	c00812e3          	bnez	a6,dcc8 <__subdf3+0xec>
    e0c8:	00000e13          	li	t3,0
    e0cc:	00000793          	li	a5,0
    e0d0:	00000713          	li	a4,0
    e0d4:	cadff06f          	j	dd80 <__subdf3+0x1a4>
    e0d8:	ff800937          	lui	s2,0xff800
    e0dc:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e0e0:	40f989b3          	sub	s3,s3,a5
    e0e4:	01277933          	and	s2,a4,s2
    e0e8:	c39ff06f          	j	dd20 <__subdf3+0x144>
    e0ec:	7ff00793          	li	a5,2047
    e0f0:	01176533          	or	a0,a4,a7
    e0f4:	10050463          	beqz	a0,e1fc <__subdf3+0x620>
    e0f8:	fff78813          	add	a6,a5,-1
    e0fc:	1e080263          	beqz	a6,e2e0 <__subdf3+0x704>
    e100:	7ff00513          	li	a0,2047
    e104:	d6a788e3          	beq	a5,a0,de74 <__subdf3+0x298>
    e108:	03800793          	li	a5,56
    e10c:	00068413          	mv	s0,a3
    e110:	00100513          	li	a0,1
    e114:	0307ca63          	blt	a5,a6,e148 <__subdf3+0x56c>
    e118:	01f00793          	li	a5,31
    e11c:	1907c463          	blt	a5,a6,e2a4 <__subdf3+0x6c8>
    e120:	02000793          	li	a5,32
    e124:	410787b3          	sub	a5,a5,a6
    e128:	00f71533          	sll	a0,a4,a5
    e12c:	0108d6b3          	srl	a3,a7,a6
    e130:	00f897b3          	sll	a5,a7,a5
    e134:	00d56533          	or	a0,a0,a3
    e138:	00f037b3          	snez	a5,a5
    e13c:	01075833          	srl	a6,a4,a6
    e140:	00f56533          	or	a0,a0,a5
    e144:	410585b3          	sub	a1,a1,a6
    e148:	40ae8533          	sub	a0,t4,a0
    e14c:	00aeb733          	sltu	a4,t4,a0
    e150:	00050493          	mv	s1,a0
    e154:	40e58933          	sub	s2,a1,a4
    e158:	000f0993          	mv	s3,t5
    e15c:	b59ff06f          	j	dcb4 <__subdf3+0xd8>
    e160:	fe078693          	add	a3,a5,-32
    e164:	02000613          	li	a2,32
    e168:	00d5d6b3          	srl	a3,a1,a3
    e16c:	00c78a63          	beq	a5,a2,e180 <__subdf3+0x5a4>
    e170:	04000613          	li	a2,64
    e174:	40f607b3          	sub	a5,a2,a5
    e178:	00f597b3          	sll	a5,a1,a5
    e17c:	00feeeb3          	or	t4,t4,a5
    e180:	01d03533          	snez	a0,t4
    e184:	00d56533          	or	a0,a0,a3
    e188:	b1dff06f          	j	dca4 <__subdf3+0xc8>
    e18c:	ff8006b7          	lui	a3,0xff800
    e190:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e194:	40f987b3          	sub	a5,s3,a5
    e198:	00d77733          	and	a4,a4,a3
    e19c:	ef9ff06f          	j	e094 <__subdf3+0x4b8>
    e1a0:	00361513          	sll	a0,a2,0x3
    e1a4:	00355513          	srl	a0,a0,0x3
    e1a8:	00058713          	mv	a4,a1
    e1ac:	cd9ff06f          	j	de84 <__subdf3+0x2a8>
    e1b0:	7ff00793          	li	a5,2047
    e1b4:	def686e3          	beq	a3,a5,dfa0 <__subdf3+0x3c4>
    e1b8:	01d88eb3          	add	t4,a7,t4
    e1bc:	011eb633          	sltu	a2,t4,a7
    e1c0:	00b707b3          	add	a5,a4,a1
    e1c4:	00c787b3          	add	a5,a5,a2
    e1c8:	01f79513          	sll	a0,a5,0x1f
    e1cc:	001ede93          	srl	t4,t4,0x1
    e1d0:	01d564b3          	or	s1,a0,t4
    e1d4:	0017d913          	srl	s2,a5,0x1
    e1d8:	00068993          	mv	s3,a3
    e1dc:	b45ff06f          	j	dd20 <__subdf3+0x144>
    e1e0:	411e8633          	sub	a2,t4,a7
    e1e4:	40e587b3          	sub	a5,a1,a4
    e1e8:	00ceb733          	sltu	a4,t4,a2
    e1ec:	00060493          	mv	s1,a2
    e1f0:	40e78933          	sub	s2,a5,a4
    e1f4:	00068413          	mv	s0,a3
    e1f8:	ad1ff06f          	j	dcc8 <__subdf3+0xec>
    e1fc:	00361613          	sll	a2,a2,0x3
    e200:	00365513          	srl	a0,a2,0x3
    e204:	00068413          	mv	s0,a3
    e208:	00058713          	mv	a4,a1
    e20c:	e39ff06f          	j	e044 <__subdf3+0x468>
    e210:	e00798e3          	bnez	a5,e020 <__subdf3+0x444>
    e214:	22080663          	beqz	a6,e440 <__subdf3+0x864>
    e218:	0035d713          	srl	a4,a1,0x3
    e21c:	00361613          	sll	a2,a2,0x3
    e220:	01d59593          	sll	a1,a1,0x1d
    e224:	00b76733          	or	a4,a4,a1
    e228:	00365613          	srl	a2,a2,0x3
    e22c:	00c76733          	or	a4,a4,a2
    e230:	00068413          	mv	s0,a3
    e234:	c61ff06f          	j	de94 <__subdf3+0x2b8>
    e238:	01d88eb3          	add	t4,a7,t4
    e23c:	00b705b3          	add	a1,a4,a1
    e240:	011eb633          	sltu	a2,t4,a7
    e244:	00c58933          	add	s2,a1,a2
    e248:	00891793          	sll	a5,s2,0x8
    e24c:	000e8493          	mv	s1,t4
    e250:	0a07d863          	bgez	a5,e300 <__subdf3+0x724>
    e254:	00200993          	li	s3,2
    e258:	bddff06f          	j	de34 <__subdf3+0x258>
    e25c:	41d88eb3          	sub	t4,a7,t4
    e260:	40b705b3          	sub	a1,a4,a1
    e264:	01d8b633          	sltu	a2,a7,t4
    e268:	000e8493          	mv	s1,t4
    e26c:	40c58933          	sub	s2,a1,a2
    e270:	00100993          	li	s3,1
    e274:	a41ff06f          	j	dcb4 <__subdf3+0xd8>
    e278:	fe078693          	add	a3,a5,-32
    e27c:	02000613          	li	a2,32
    e280:	00d5d6b3          	srl	a3,a1,a3
    e284:	00c78a63          	beq	a5,a2,e298 <__subdf3+0x6bc>
    e288:	04000613          	li	a2,64
    e28c:	40f607b3          	sub	a5,a2,a5
    e290:	00f597b3          	sll	a5,a1,a5
    e294:	00feeeb3          	or	t4,t4,a5
    e298:	01d03933          	snez	s2,t4
    e29c:	00d96933          	or	s2,s2,a3
    e2a0:	b71ff06f          	j	de10 <__subdf3+0x234>
    e2a4:	fe080793          	add	a5,a6,-32
    e2a8:	02000693          	li	a3,32
    e2ac:	00f757b3          	srl	a5,a4,a5
    e2b0:	00d80a63          	beq	a6,a3,e2c4 <__subdf3+0x6e8>
    e2b4:	04000693          	li	a3,64
    e2b8:	410686b3          	sub	a3,a3,a6
    e2bc:	00d71733          	sll	a4,a4,a3
    e2c0:	00e8e8b3          	or	a7,a7,a4
    e2c4:	01103533          	snez	a0,a7
    e2c8:	00f56533          	or	a0,a0,a5
    e2cc:	e7dff06f          	j	e148 <__subdf3+0x56c>
    e2d0:	ec0788e3          	beqz	a5,e1a0 <__subdf3+0x5c4>
    e2d4:	01d5eeb3          	or	t4,a1,t4
    e2d8:	bc0e90e3          	bnez	t4,de98 <__subdf3+0x2bc>
    e2dc:	d49ff06f          	j	e024 <__subdf3+0x448>
    e2e0:	411e8633          	sub	a2,t4,a7
    e2e4:	40e585b3          	sub	a1,a1,a4
    e2e8:	00ceb733          	sltu	a4,t4,a2
    e2ec:	00060493          	mv	s1,a2
    e2f0:	40e58933          	sub	s2,a1,a4
    e2f4:	00068413          	mv	s0,a3
    e2f8:	00100993          	li	s3,1
    e2fc:	9b9ff06f          	j	dcb4 <__subdf3+0xd8>
    e300:	00100793          	li	a5,1
    e304:	d11ff06f          	j	e014 <__subdf3+0x438>
    e308:	dc0800e3          	beqz	a6,e0c8 <__subdf3+0x4ec>
    e30c:	00361613          	sll	a2,a2,0x3
    e310:	00365793          	srl	a5,a2,0x3
    e314:	01d59813          	sll	a6,a1,0x1d
    e318:	00959713          	sll	a4,a1,0x9
    e31c:	00f86833          	or	a6,a6,a5
    e320:	00c75713          	srl	a4,a4,0xc
    e324:	00068e13          	mv	t3,a3
    e328:	00000793          	li	a5,0
    e32c:	a55ff06f          	j	dd80 <__subdf3+0x1a4>
    e330:	41d88933          	sub	s2,a7,t4
    e334:	0128b7b3          	sltu	a5,a7,s2
    e338:	40b70633          	sub	a2,a4,a1
    e33c:	40f60633          	sub	a2,a2,a5
    e340:	00861793          	sll	a5,a2,0x8
    e344:	0e07d263          	bgez	a5,e428 <__subdf3+0x84c>
    e348:	411e8633          	sub	a2,t4,a7
    e34c:	40e58733          	sub	a4,a1,a4
    e350:	00cebeb3          	sltu	t4,t4,a2
    e354:	41d70733          	sub	a4,a4,t4
    e358:	00871793          	sll	a5,a4,0x8
    e35c:	00060493          	mv	s1,a2
    e360:	1207de63          	bgez	a5,e49c <__subdf3+0x8c0>
    e364:	ff8007b7          	lui	a5,0xff800
    e368:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e36c:	00f77733          	and	a4,a4,a5
    e370:	00068413          	mv	s0,a3
    e374:	00100793          	li	a5,1
    e378:	9f1ff06f          	j	dd68 <__subdf3+0x18c>
    e37c:	00361613          	sll	a2,a2,0x3
    e380:	00365513          	srl	a0,a2,0x3
    e384:	00058713          	mv	a4,a1
    e388:	cbdff06f          	j	e044 <__subdf3+0x468>
    e38c:	00361613          	sll	a2,a2,0x3
    e390:	00365913          	srl	s2,a2,0x3
    e394:	00058713          	mv	a4,a1
    e398:	cfdff06f          	j	e094 <__subdf3+0x4b8>
    e39c:	01d886b3          	add	a3,a7,t4
    e3a0:	00b707b3          	add	a5,a4,a1
    e3a4:	0116b633          	sltu	a2,a3,a7
    e3a8:	00c787b3          	add	a5,a5,a2
    e3ac:	00879713          	sll	a4,a5,0x8
    e3b0:	0036d813          	srl	a6,a3,0x3
    e3b4:	08075e63          	bgez	a4,e450 <__subdf3+0x874>
    e3b8:	ff800737          	lui	a4,0xff800
    e3bc:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e3c0:	00e7f7b3          	and	a5,a5,a4
    e3c4:	01d79713          	sll	a4,a5,0x1d
    e3c8:	00979793          	sll	a5,a5,0x9
    e3cc:	01076833          	or	a6,a4,a6
    e3d0:	00c7d713          	srl	a4,a5,0xc
    e3d4:	00100793          	li	a5,1
    e3d8:	9a9ff06f          	j	dd80 <__subdf3+0x1a4>
    e3dc:	fe068793          	add	a5,a3,-32
    e3e0:	02000613          	li	a2,32
    e3e4:	00f757b3          	srl	a5,a4,a5
    e3e8:	00c68a63          	beq	a3,a2,e3fc <__subdf3+0x820>
    e3ec:	04000613          	li	a2,64
    e3f0:	40d606b3          	sub	a3,a2,a3
    e3f4:	00d71733          	sll	a4,a4,a3
    e3f8:	00e8e8b3          	or	a7,a7,a4
    e3fc:	01103933          	snez	s2,a7
    e400:	00f96933          	or	s2,s2,a5
    e404:	b39ff06f          	j	df3c <__subdf3+0x360>
    e408:	0034d513          	srl	a0,s1,0x3
    e40c:	00098793          	mv	a5,s3
    e410:	00090713          	mv	a4,s2
    e414:	c31ff06f          	j	e044 <__subdf3+0x468>
    e418:	02000693          	li	a3,32
    e41c:	40f686b3          	sub	a3,a3,a5
    e420:	00000613          	li	a2,0
    e424:	8e9ff06f          	j	dd0c <__subdf3+0x130>
    e428:	00c96833          	or	a6,s2,a2
    e42c:	c8080ee3          	beqz	a6,e0c8 <__subdf3+0x4ec>
    e430:	00395913          	srl	s2,s2,0x3
    e434:	00000793          	li	a5,0
    e438:	00060713          	mv	a4,a2
    e43c:	c59ff06f          	j	e094 <__subdf3+0x4b8>
    e440:	00000e13          	li	t3,0
    e444:	7ff00793          	li	a5,2047
    e448:	00080737          	lui	a4,0x80
    e44c:	935ff06f          	j	dd80 <__subdf3+0x1a4>
    e450:	01d79713          	sll	a4,a5,0x1d
    e454:	00979793          	sll	a5,a5,0x9
    e458:	01076833          	or	a6,a4,a6
    e45c:	00c7d713          	srl	a4,a5,0xc
    e460:	00000793          	li	a5,0
    e464:	91dff06f          	j	dd80 <__subdf3+0x1a4>
    e468:	ae0786e3          	beqz	a5,df54 <__subdf3+0x378>
    e46c:	413f0833          	sub	a6,t5,s3
    e470:	00080793          	mv	a5,a6
    e474:	c6098ee3          	beqz	s3,e0f0 <__subdf3+0x514>
    e478:	03800793          	li	a5,56
    e47c:	0107ca63          	blt	a5,a6,e490 <__subdf3+0x8b4>
    e480:	008007b7          	lui	a5,0x800
    e484:	00f76733          	or	a4,a4,a5
    e488:	00068413          	mv	s0,a3
    e48c:	c8dff06f          	j	e118 <__subdf3+0x53c>
    e490:	00068413          	mv	s0,a3
    e494:	00100513          	li	a0,1
    e498:	cb1ff06f          	j	e148 <__subdf3+0x56c>
    e49c:	01d71813          	sll	a6,a4,0x1d
    e4a0:	00365613          	srl	a2,a2,0x3
    e4a4:	00c86833          	or	a6,a6,a2
    e4a8:	00375713          	srl	a4,a4,0x3
    e4ac:	00000793          	li	a5,0
    e4b0:	00068413          	mv	s0,a3
    e4b4:	ba5ff06f          	j	e058 <__subdf3+0x47c>
    e4b8:	ba078ae3          	beqz	a5,e06c <__subdf3+0x490>
    e4bc:	413f06b3          	sub	a3,t5,s3
    e4c0:	00099663          	bnez	s3,e4cc <__subdf3+0x8f0>
    e4c4:	00068793          	mv	a5,a3
    e4c8:	a21ff06f          	j	dee8 <__subdf3+0x30c>
    e4cc:	03800793          	li	a5,56
    e4d0:	00100913          	li	s2,1
    e4d4:	a6d7c4e3          	blt	a5,a3,df3c <__subdf3+0x360>
    e4d8:	008007b7          	lui	a5,0x800
    e4dc:	00f76733          	or	a4,a4,a5
    e4e0:	a2dff06f          	j	df0c <__subdf3+0x330>

0000e4e4 <__unorddf2>:
    e4e4:	0145d713          	srl	a4,a1,0x14
    e4e8:	001007b7          	lui	a5,0x100
    e4ec:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e4f0:	fff74713          	not	a4,a4
    e4f4:	0146d813          	srl	a6,a3,0x14
    e4f8:	00b7f5b3          	and	a1,a5,a1
    e4fc:	00d7f7b3          	and	a5,a5,a3
    e500:	01571693          	sll	a3,a4,0x15
    e504:	7ff87813          	and	a6,a6,2047
    e508:	02068063          	beqz	a3,e528 <__unorddf2+0x44>
    e50c:	7ff00713          	li	a4,2047
    e510:	00000513          	li	a0,0
    e514:	00e80463          	beq	a6,a4,e51c <__unorddf2+0x38>
    e518:	00008067          	ret
    e51c:	00c7e7b3          	or	a5,a5,a2
    e520:	00f03533          	snez	a0,a5
    e524:	00008067          	ret
    e528:	00a5e5b3          	or	a1,a1,a0
    e52c:	00100513          	li	a0,1
    e530:	fc058ee3          	beqz	a1,e50c <__unorddf2+0x28>
    e534:	00008067          	ret

0000e538 <__fixdfsi>:
    e538:	0145d793          	srl	a5,a1,0x14
    e53c:	001006b7          	lui	a3,0x100
    e540:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e544:	7ff7f793          	and	a5,a5,2047
    e548:	3fe00613          	li	a2,1022
    e54c:	00b77733          	and	a4,a4,a1
    e550:	01f5d593          	srl	a1,a1,0x1f
    e554:	00f65e63          	bge	a2,a5,e570 <__fixdfsi+0x38>
    e558:	41d00613          	li	a2,1053
    e55c:	00f65e63          	bge	a2,a5,e578 <__fixdfsi+0x40>
    e560:	80000537          	lui	a0,0x80000
    e564:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e568:	00a58533          	add	a0,a1,a0
    e56c:	00008067          	ret
    e570:	00000513          	li	a0,0
    e574:	00008067          	ret
    e578:	43300613          	li	a2,1075
    e57c:	40f60633          	sub	a2,a2,a5
    e580:	01f00813          	li	a6,31
    e584:	00d76733          	or	a4,a4,a3
    e588:	02c85063          	bge	a6,a2,e5a8 <__fixdfsi+0x70>
    e58c:	41300693          	li	a3,1043
    e590:	40f687b3          	sub	a5,a3,a5
    e594:	00f75733          	srl	a4,a4,a5
    e598:	40e00533          	neg	a0,a4
    e59c:	fc059ce3          	bnez	a1,e574 <__fixdfsi+0x3c>
    e5a0:	00070513          	mv	a0,a4
    e5a4:	00008067          	ret
    e5a8:	bed78793          	add	a5,a5,-1043
    e5ac:	00f71733          	sll	a4,a4,a5
    e5b0:	00c55533          	srl	a0,a0,a2
    e5b4:	00a76733          	or	a4,a4,a0
    e5b8:	fe1ff06f          	j	e598 <__fixdfsi+0x60>

0000e5bc <__floatsidf>:
    e5bc:	ff010113          	add	sp,sp,-16
    e5c0:	00112623          	sw	ra,12(sp)
    e5c4:	00812423          	sw	s0,8(sp)
    e5c8:	00912223          	sw	s1,4(sp)
    e5cc:	04050a63          	beqz	a0,e620 <__floatsidf+0x64>
    e5d0:	41f55713          	sra	a4,a0,0x1f
    e5d4:	00a744b3          	xor	s1,a4,a0
    e5d8:	40e484b3          	sub	s1,s1,a4
    e5dc:	00050793          	mv	a5,a0
    e5e0:	00048513          	mv	a0,s1
    e5e4:	01f7d413          	srl	s0,a5,0x1f
    e5e8:	69c000ef          	jal	ec84 <__clzsi2>
    e5ec:	41e00793          	li	a5,1054
    e5f0:	40a787b3          	sub	a5,a5,a0
    e5f4:	00a00713          	li	a4,10
    e5f8:	7ff7f793          	and	a5,a5,2047
    e5fc:	06a74063          	blt	a4,a0,e65c <__floatsidf+0xa0>
    e600:	00b00713          	li	a4,11
    e604:	40a70733          	sub	a4,a4,a0
    e608:	00e4d733          	srl	a4,s1,a4
    e60c:	01550513          	add	a0,a0,21
    e610:	00c71713          	sll	a4,a4,0xc
    e614:	00a494b3          	sll	s1,s1,a0
    e618:	00c75713          	srl	a4,a4,0xc
    e61c:	0140006f          	j	e630 <__floatsidf+0x74>
    e620:	00000413          	li	s0,0
    e624:	00000793          	li	a5,0
    e628:	00000713          	li	a4,0
    e62c:	00000493          	li	s1,0
    e630:	01479793          	sll	a5,a5,0x14
    e634:	01f41413          	sll	s0,s0,0x1f
    e638:	00e7e7b3          	or	a5,a5,a4
    e63c:	00c12083          	lw	ra,12(sp)
    e640:	0087e7b3          	or	a5,a5,s0
    e644:	00812403          	lw	s0,8(sp)
    e648:	00048513          	mv	a0,s1
    e64c:	00078593          	mv	a1,a5
    e650:	00412483          	lw	s1,4(sp)
    e654:	01010113          	add	sp,sp,16
    e658:	00008067          	ret
    e65c:	ff550513          	add	a0,a0,-11
    e660:	00a49733          	sll	a4,s1,a0
    e664:	00c71713          	sll	a4,a4,0xc
    e668:	00c75713          	srl	a4,a4,0xc
    e66c:	00000493          	li	s1,0
    e670:	fc1ff06f          	j	e630 <__floatsidf+0x74>

0000e674 <__floatunsidf>:
    e674:	ff010113          	add	sp,sp,-16
    e678:	00812423          	sw	s0,8(sp)
    e67c:	00112623          	sw	ra,12(sp)
    e680:	00050413          	mv	s0,a0
    e684:	04050c63          	beqz	a0,e6dc <__floatunsidf+0x68>
    e688:	5fc000ef          	jal	ec84 <__clzsi2>
    e68c:	41e00793          	li	a5,1054
    e690:	40a787b3          	sub	a5,a5,a0
    e694:	00a00713          	li	a4,10
    e698:	7ff7f793          	and	a5,a5,2047
    e69c:	06a74463          	blt	a4,a0,e704 <__floatunsidf+0x90>
    e6a0:	00b00713          	li	a4,11
    e6a4:	40a70733          	sub	a4,a4,a0
    e6a8:	01550513          	add	a0,a0,21
    e6ac:	00e45733          	srl	a4,s0,a4
    e6b0:	00a41433          	sll	s0,s0,a0
    e6b4:	00c12083          	lw	ra,12(sp)
    e6b8:	00040513          	mv	a0,s0
    e6bc:	00c71713          	sll	a4,a4,0xc
    e6c0:	00812403          	lw	s0,8(sp)
    e6c4:	00c75713          	srl	a4,a4,0xc
    e6c8:	01479793          	sll	a5,a5,0x14
    e6cc:	00e7e7b3          	or	a5,a5,a4
    e6d0:	00078593          	mv	a1,a5
    e6d4:	01010113          	add	sp,sp,16
    e6d8:	00008067          	ret
    e6dc:	00c12083          	lw	ra,12(sp)
    e6e0:	00040513          	mv	a0,s0
    e6e4:	00000793          	li	a5,0
    e6e8:	00812403          	lw	s0,8(sp)
    e6ec:	00000713          	li	a4,0
    e6f0:	01479793          	sll	a5,a5,0x14
    e6f4:	00e7e7b3          	or	a5,a5,a4
    e6f8:	00078593          	mv	a1,a5
    e6fc:	01010113          	add	sp,sp,16
    e700:	00008067          	ret
    e704:	ff550513          	add	a0,a0,-11
    e708:	00a41733          	sll	a4,s0,a0
    e70c:	00000413          	li	s0,0
    e710:	00c12083          	lw	ra,12(sp)
    e714:	00040513          	mv	a0,s0
    e718:	00c71713          	sll	a4,a4,0xc
    e71c:	00812403          	lw	s0,8(sp)
    e720:	00c75713          	srl	a4,a4,0xc
    e724:	01479793          	sll	a5,a5,0x14
    e728:	00e7e7b3          	or	a5,a5,a4
    e72c:	00078593          	mv	a1,a5
    e730:	01010113          	add	sp,sp,16
    e734:	00008067          	ret

0000e738 <__trunctfdf2>:
    e738:	00c52583          	lw	a1,12(a0)
    e73c:	00852783          	lw	a5,8(a0)
    e740:	00052803          	lw	a6,0(a0)
    e744:	00452683          	lw	a3,4(a0)
    e748:	01059613          	sll	a2,a1,0x10
    e74c:	fe010113          	add	sp,sp,-32
    e750:	00159713          	sll	a4,a1,0x1
    e754:	01065613          	srl	a2,a2,0x10
    e758:	00f12423          	sw	a5,8(sp)
    e75c:	00b12623          	sw	a1,12(sp)
    e760:	00f12c23          	sw	a5,24(sp)
    e764:	01012023          	sw	a6,0(sp)
    e768:	00d12223          	sw	a3,4(sp)
    e76c:	01012823          	sw	a6,16(sp)
    e770:	00d12a23          	sw	a3,20(sp)
    e774:	00c12e23          	sw	a2,28(sp)
    e778:	01175713          	srl	a4,a4,0x11
    e77c:	01f5d593          	srl	a1,a1,0x1f
    e780:	01010893          	add	a7,sp,16
    e784:	01c10793          	add	a5,sp,28
    e788:	00361513          	sll	a0,a2,0x3
    e78c:	ffc7a603          	lw	a2,-4(a5)
    e790:	ffc78793          	add	a5,a5,-4
    e794:	01d65693          	srl	a3,a2,0x1d
    e798:	00a6e6b3          	or	a3,a3,a0
    e79c:	00d7a223          	sw	a3,4(a5)
    e7a0:	fef894e3          	bne	a7,a5,e788 <__trunctfdf2+0x50>
    e7a4:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e7a8:	00381813          	sll	a6,a6,0x3
    e7ac:	01169613          	sll	a2,a3,0x11
    e7b0:	01012823          	sw	a6,16(sp)
    e7b4:	01265613          	srl	a2,a2,0x12
    e7b8:	04060263          	beqz	a2,e7fc <__trunctfdf2+0xc4>
    e7bc:	ffffc6b7          	lui	a3,0xffffc
    e7c0:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e7c4:	00d70733          	add	a4,a4,a3
    e7c8:	7fe00693          	li	a3,2046
    e7cc:	10e6d463          	bge	a3,a4,e8d4 <__trunctfdf2+0x19c>
    e7d0:	7ff00793          	li	a5,2047
    e7d4:	00000613          	li	a2,0
    e7d8:	00000693          	li	a3,0
    e7dc:	01479793          	sll	a5,a5,0x14
    e7e0:	01f59593          	sll	a1,a1,0x1f
    e7e4:	00c7e7b3          	or	a5,a5,a2
    e7e8:	00b7e7b3          	or	a5,a5,a1
    e7ec:	00068513          	mv	a0,a3
    e7f0:	00078593          	mv	a1,a5
    e7f4:	02010113          	add	sp,sp,32
    e7f8:	00008067          	ret
    e7fc:	01412603          	lw	a2,20(sp)
    e800:	01812883          	lw	a7,24(sp)
    e804:	01c12503          	lw	a0,28(sp)
    e808:	011666b3          	or	a3,a2,a7
    e80c:	00a6e6b3          	or	a3,a3,a0
    e810:	0106e6b3          	or	a3,a3,a6
    e814:	04071463          	bnez	a4,e85c <__trunctfdf2+0x124>
    e818:	14068263          	beqz	a3,e95c <__trunctfdf2+0x224>
    e81c:	00500693          	li	a3,5
    e820:	00000613          	li	a2,0
    e824:	0036d793          	srl	a5,a3,0x3
    e828:	01d61693          	sll	a3,a2,0x1d
    e82c:	00f6e6b3          	or	a3,a3,a5
    e830:	00961613          	sll	a2,a2,0x9
    e834:	7ff77793          	and	a5,a4,2047
    e838:	00c65613          	srl	a2,a2,0xc
    e83c:	01479793          	sll	a5,a5,0x14
    e840:	01f59593          	sll	a1,a1,0x1f
    e844:	00c7e7b3          	or	a5,a5,a2
    e848:	00b7e7b3          	or	a5,a5,a1
    e84c:	00068513          	mv	a0,a3
    e850:	00078593          	mv	a1,a5
    e854:	02010113          	add	sp,sp,32
    e858:	00008067          	ret
    e85c:	12068463          	beqz	a3,e984 <__trunctfdf2+0x24c>
    e860:	01c8d793          	srl	a5,a7,0x1c
    e864:	00451513          	sll	a0,a0,0x4
    e868:	00a7e7b3          	or	a5,a5,a0
    e86c:	008006b7          	lui	a3,0x800
    e870:	00d7f6b3          	and	a3,a5,a3
    e874:	1c068263          	beqz	a3,ea38 <__trunctfdf2+0x300>
    e878:	ff800737          	lui	a4,0xff800
    e87c:	01c65693          	srl	a3,a2,0x1c
    e880:	00489893          	sll	a7,a7,0x4
    e884:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e888:	00e7f633          	and	a2,a5,a4
    e88c:	0116e6b3          	or	a3,a3,a7
    e890:	004007b7          	lui	a5,0x400
    e894:	00f66633          	or	a2,a2,a5
    e898:	ff86f693          	and	a3,a3,-8
    e89c:	00000793          	li	a5,0
    e8a0:	0036d713          	srl	a4,a3,0x3
    e8a4:	01d61693          	sll	a3,a2,0x1d
    e8a8:	00961613          	sll	a2,a2,0x9
    e8ac:	00c65613          	srl	a2,a2,0xc
    e8b0:	01479793          	sll	a5,a5,0x14
    e8b4:	01f59593          	sll	a1,a1,0x1f
    e8b8:	00c7e7b3          	or	a5,a5,a2
    e8bc:	00e6e6b3          	or	a3,a3,a4
    e8c0:	00b7e7b3          	or	a5,a5,a1
    e8c4:	00068513          	mv	a0,a3
    e8c8:	00078593          	mv	a1,a5
    e8cc:	02010113          	add	sp,sp,32
    e8d0:	00008067          	ret
    e8d4:	0ce05c63          	blez	a4,e9ac <__trunctfdf2+0x274>
    e8d8:	01412783          	lw	a5,20(sp)
    e8dc:	01812503          	lw	a0,24(sp)
    e8e0:	01c12603          	lw	a2,28(sp)
    e8e4:	00479693          	sll	a3,a5,0x4
    e8e8:	0106e6b3          	or	a3,a3,a6
    e8ec:	01c7d793          	srl	a5,a5,0x1c
    e8f0:	00451813          	sll	a6,a0,0x4
    e8f4:	00461613          	sll	a2,a2,0x4
    e8f8:	01c55513          	srl	a0,a0,0x1c
    e8fc:	00d036b3          	snez	a3,a3
    e900:	0107e7b3          	or	a5,a5,a6
    e904:	00a66633          	or	a2,a2,a0
    e908:	00f6e6b3          	or	a3,a3,a5
    e90c:	0076f793          	and	a5,a3,7
    e910:	02078063          	beqz	a5,e930 <__trunctfdf2+0x1f8>
    e914:	00f6f793          	and	a5,a3,15
    e918:	00400513          	li	a0,4
    e91c:	00a78a63          	beq	a5,a0,e930 <__trunctfdf2+0x1f8>
    e920:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    e924:	00d7b6b3          	sltu	a3,a5,a3
    e928:	00d60633          	add	a2,a2,a3
    e92c:	00078693          	mv	a3,a5
    e930:	008007b7          	lui	a5,0x800
    e934:	00f677b3          	and	a5,a2,a5
    e938:	ee0786e3          	beqz	a5,e824 <__trunctfdf2+0xec>
    e93c:	00170713          	add	a4,a4,1
    e940:	7ff00793          	li	a5,2047
    e944:	e8f706e3          	beq	a4,a5,e7d0 <__trunctfdf2+0x98>
    e948:	ff8007b7          	lui	a5,0xff800
    e94c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e950:	00f67633          	and	a2,a2,a5
    e954:	7ff77793          	and	a5,a4,2047
    e958:	f49ff06f          	j	e8a0 <__trunctfdf2+0x168>
    e95c:	00000793          	li	a5,0
    e960:	00000613          	li	a2,0
    e964:	01479793          	sll	a5,a5,0x14
    e968:	01f59593          	sll	a1,a1,0x1f
    e96c:	00c7e7b3          	or	a5,a5,a2
    e970:	00b7e7b3          	or	a5,a5,a1
    e974:	00068513          	mv	a0,a3
    e978:	00078593          	mv	a1,a5
    e97c:	02010113          	add	sp,sp,32
    e980:	00008067          	ret
    e984:	7ff00793          	li	a5,2047
    e988:	00000613          	li	a2,0
    e98c:	01479793          	sll	a5,a5,0x14
    e990:	01f59593          	sll	a1,a1,0x1f
    e994:	00c7e7b3          	or	a5,a5,a2
    e998:	00b7e7b3          	or	a5,a5,a1
    e99c:	00068513          	mv	a0,a3
    e9a0:	00078593          	mv	a1,a5
    e9a4:	02010113          	add	sp,sp,32
    e9a8:	00008067          	ret
    e9ac:	fcc00693          	li	a3,-52
    e9b0:	08d74c63          	blt	a4,a3,ea48 <__trunctfdf2+0x310>
    e9b4:	03d00693          	li	a3,61
    e9b8:	40e686b3          	sub	a3,a3,a4
    e9bc:	01c12703          	lw	a4,28(sp)
    e9c0:	4056de13          	sra	t3,a3,0x5
    e9c4:	00080eb7          	lui	t4,0x80
    e9c8:	00eeeeb3          	or	t4,t4,a4
    e9cc:	002e1513          	sll	a0,t3,0x2
    e9d0:	01d12e23          	sw	t4,28(sp)
    e9d4:	01f6f693          	and	a3,a3,31
    e9d8:	00a88833          	add	a6,a7,a0
    e9dc:	00088613          	mv	a2,a7
    e9e0:	00000713          	li	a4,0
    e9e4:	00062303          	lw	t1,0(a2)
    e9e8:	00460613          	add	a2,a2,4
    e9ec:	00676733          	or	a4,a4,t1
    e9f0:	fec81ae3          	bne	a6,a2,e9e4 <__trunctfdf2+0x2ac>
    e9f4:	00300613          	li	a2,3
    e9f8:	41c60633          	sub	a2,a2,t3
    e9fc:	04069a63          	bnez	a3,ea50 <__trunctfdf2+0x318>
    ea00:	00082803          	lw	a6,0(a6)
    ea04:	00168693          	add	a3,a3,1
    ea08:	00478793          	add	a5,a5,4
    ea0c:	ff07ae23          	sw	a6,-4(a5)
    ea10:	00d64e63          	blt	a2,a3,ea2c <__trunctfdf2+0x2f4>
    ea14:	00a78833          	add	a6,a5,a0
    ea18:	00082803          	lw	a6,0(a6)
    ea1c:	00168693          	add	a3,a3,1
    ea20:	00478793          	add	a5,a5,4
    ea24:	ff07ae23          	sw	a6,-4(a5)
    ea28:	fed656e3          	bge	a2,a3,ea14 <__trunctfdf2+0x2dc>
    ea2c:	00400793          	li	a5,4
    ea30:	41c787b3          	sub	a5,a5,t3
    ea34:	0840006f          	j	eab8 <__trunctfdf2+0x380>
    ea38:	00000593          	li	a1,0
    ea3c:	7ff00793          	li	a5,2047
    ea40:	00080637          	lui	a2,0x80
    ea44:	d99ff06f          	j	e7dc <__trunctfdf2+0xa4>
    ea48:	00000713          	li	a4,0
    ea4c:	dd1ff06f          	j	e81c <__trunctfdf2+0xe4>
    ea50:	02050813          	add	a6,a0,32
    ea54:	00280833          	add	a6,a6,sp
    ea58:	ff082803          	lw	a6,-16(a6)
    ea5c:	02000f13          	li	t5,32
    ea60:	40df0f33          	sub	t5,t5,a3
    ea64:	01e81833          	sll	a6,a6,t5
    ea68:	01076733          	or	a4,a4,a6
    ea6c:	08060e63          	beqz	a2,eb08 <__trunctfdf2+0x3d0>
    ea70:	00261813          	sll	a6,a2,0x2
    ea74:	00f80fb3          	add	t6,a6,a5
    ea78:	00a88633          	add	a2,a7,a0
    ea7c:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    ea80:	00462303          	lw	t1,4(a2)
    ea84:	00478793          	add	a5,a5,4
    ea88:	00d55533          	srl	a0,a0,a3
    ea8c:	01e31333          	sll	t1,t1,t5
    ea90:	00656533          	or	a0,a0,t1
    ea94:	fea7ae23          	sw	a0,-4(a5)
    ea98:	00460613          	add	a2,a2,4
    ea9c:	feff90e3          	bne	t6,a5,ea7c <__trunctfdf2+0x344>
    eaa0:	00400793          	li	a5,4
    eaa4:	41c787b3          	sub	a5,a5,t3
    eaa8:	02080613          	add	a2,a6,32
    eaac:	00260633          	add	a2,a2,sp
    eab0:	00dedeb3          	srl	t4,t4,a3
    eab4:	ffd62823          	sw	t4,-16(a2)
    eab8:	00400693          	li	a3,4
    eabc:	40f686b3          	sub	a3,a3,a5
    eac0:	00269693          	sll	a3,a3,0x2
    eac4:	00279793          	sll	a5,a5,0x2
    eac8:	00800613          	li	a2,8
    eacc:	00f888b3          	add	a7,a7,a5
    ead0:	00c6ea63          	bltu	a3,a2,eae4 <__trunctfdf2+0x3ac>
    ead4:	0008a023          	sw	zero,0(a7)
    ead8:	0008a223          	sw	zero,4(a7)
    eadc:	ff868693          	add	a3,a3,-8
    eae0:	00888893          	add	a7,a7,8
    eae4:	00400793          	li	a5,4
    eae8:	00f6e463          	bltu	a3,a5,eaf0 <__trunctfdf2+0x3b8>
    eaec:	0008a023          	sw	zero,0(a7)
    eaf0:	01012783          	lw	a5,16(sp)
    eaf4:	00e03733          	snez	a4,a4
    eaf8:	01412603          	lw	a2,20(sp)
    eafc:	00f766b3          	or	a3,a4,a5
    eb00:	00000713          	li	a4,0
    eb04:	e09ff06f          	j	e90c <__trunctfdf2+0x1d4>
    eb08:	00100793          	li	a5,1
    eb0c:	00000813          	li	a6,0
    eb10:	f99ff06f          	j	eaa8 <__trunctfdf2+0x370>

0000eb14 <__mulsi3>:
    eb14:	00050613          	mv	a2,a0
    eb18:	00000513          	li	a0,0
    eb1c:	0015f693          	and	a3,a1,1
    eb20:	00068463          	beqz	a3,eb28 <__mulsi3+0x14>
    eb24:	00c50533          	add	a0,a0,a2
    eb28:	0015d593          	srl	a1,a1,0x1
    eb2c:	00161613          	sll	a2,a2,0x1
    eb30:	fe0596e3          	bnez	a1,eb1c <__mulsi3+0x8>
    eb34:	00008067          	ret

0000eb38 <__muldi3>:
    eb38:	ff010113          	add	sp,sp,-16
    eb3c:	00812423          	sw	s0,8(sp)
    eb40:	00050413          	mv	s0,a0
    eb44:	00112623          	sw	ra,12(sp)
    eb48:	00060513          	mv	a0,a2
    eb4c:	00068393          	mv	t2,a3
    eb50:	00040713          	mv	a4,s0
    eb54:	00060813          	mv	a6,a2
    eb58:	00000793          	li	a5,0
    eb5c:	00000313          	li	t1,0
    eb60:	00000f13          	li	t5,0
    eb64:	01e708b3          	add	a7,a4,t5
    eb68:	00187e93          	and	t4,a6,1
    eb6c:	00f30fb3          	add	t6,t1,a5
    eb70:	01f75e13          	srl	t3,a4,0x1f
    eb74:	00185813          	srl	a6,a6,0x1
    eb78:	00e8b2b3          	sltu	t0,a7,a4
    eb7c:	00179793          	sll	a5,a5,0x1
    eb80:	000e8663          	beqz	t4,eb8c <__muldi3+0x54>
    eb84:	00088f13          	mv	t5,a7
    eb88:	01f28333          	add	t1,t0,t6
    eb8c:	00171713          	sll	a4,a4,0x1
    eb90:	01c7e7b3          	or	a5,a5,t3
    eb94:	fc0818e3          	bnez	a6,eb64 <__muldi3+0x2c>
    eb98:	00058663          	beqz	a1,eba4 <__muldi3+0x6c>
    eb9c:	f79ff0ef          	jal	eb14 <__mulsi3>
    eba0:	00650333          	add	t1,a0,t1
    eba4:	00038a63          	beqz	t2,ebb8 <__muldi3+0x80>
    eba8:	00040513          	mv	a0,s0
    ebac:	00038593          	mv	a1,t2
    ebb0:	f65ff0ef          	jal	eb14 <__mulsi3>
    ebb4:	00650333          	add	t1,a0,t1
    ebb8:	00c12083          	lw	ra,12(sp)
    ebbc:	00812403          	lw	s0,8(sp)
    ebc0:	000f0513          	mv	a0,t5
    ebc4:	00030593          	mv	a1,t1
    ebc8:	01010113          	add	sp,sp,16
    ebcc:	00008067          	ret

0000ebd0 <__divsi3>:
    ebd0:	06054063          	bltz	a0,ec30 <__umodsi3+0x10>
    ebd4:	0605c663          	bltz	a1,ec40 <__umodsi3+0x20>

0000ebd8 <__hidden___udivsi3>:
    ebd8:	00058613          	mv	a2,a1
    ebdc:	00050593          	mv	a1,a0
    ebe0:	fff00513          	li	a0,-1
    ebe4:	02060c63          	beqz	a2,ec1c <__hidden___udivsi3+0x44>
    ebe8:	00100693          	li	a3,1
    ebec:	00b67a63          	bgeu	a2,a1,ec00 <__hidden___udivsi3+0x28>
    ebf0:	00c05863          	blez	a2,ec00 <__hidden___udivsi3+0x28>
    ebf4:	00161613          	sll	a2,a2,0x1
    ebf8:	00169693          	sll	a3,a3,0x1
    ebfc:	feb66ae3          	bltu	a2,a1,ebf0 <__hidden___udivsi3+0x18>
    ec00:	00000513          	li	a0,0
    ec04:	00c5e663          	bltu	a1,a2,ec10 <__hidden___udivsi3+0x38>
    ec08:	40c585b3          	sub	a1,a1,a2
    ec0c:	00d56533          	or	a0,a0,a3
    ec10:	0016d693          	srl	a3,a3,0x1
    ec14:	00165613          	srl	a2,a2,0x1
    ec18:	fe0696e3          	bnez	a3,ec04 <__hidden___udivsi3+0x2c>
    ec1c:	00008067          	ret

0000ec20 <__umodsi3>:
    ec20:	00008293          	mv	t0,ra
    ec24:	fb5ff0ef          	jal	ebd8 <__hidden___udivsi3>
    ec28:	00058513          	mv	a0,a1
    ec2c:	00028067          	jr	t0
    ec30:	40a00533          	neg	a0,a0
    ec34:	00b04863          	bgtz	a1,ec44 <__umodsi3+0x24>
    ec38:	40b005b3          	neg	a1,a1
    ec3c:	f9dff06f          	j	ebd8 <__hidden___udivsi3>
    ec40:	40b005b3          	neg	a1,a1
    ec44:	00008293          	mv	t0,ra
    ec48:	f91ff0ef          	jal	ebd8 <__hidden___udivsi3>
    ec4c:	40a00533          	neg	a0,a0
    ec50:	00028067          	jr	t0

0000ec54 <__modsi3>:
    ec54:	00008293          	mv	t0,ra
    ec58:	0005ca63          	bltz	a1,ec6c <__modsi3+0x18>
    ec5c:	00054c63          	bltz	a0,ec74 <__modsi3+0x20>
    ec60:	f79ff0ef          	jal	ebd8 <__hidden___udivsi3>
    ec64:	00058513          	mv	a0,a1
    ec68:	00028067          	jr	t0
    ec6c:	40b005b3          	neg	a1,a1
    ec70:	fe0558e3          	bgez	a0,ec60 <__modsi3+0xc>
    ec74:	40a00533          	neg	a0,a0
    ec78:	f61ff0ef          	jal	ebd8 <__hidden___udivsi3>
    ec7c:	40b00533          	neg	a0,a1
    ec80:	00028067          	jr	t0

0000ec84 <__clzsi2>:
    ec84:	000107b7          	lui	a5,0x10
    ec88:	02f57a63          	bgeu	a0,a5,ecbc <__clzsi2+0x38>
    ec8c:	10053793          	sltiu	a5,a0,256
    ec90:	0017b793          	seqz	a5,a5
    ec94:	00379793          	sll	a5,a5,0x3
    ec98:	02000713          	li	a4,32
    ec9c:	40f70733          	sub	a4,a4,a5
    eca0:	00f55533          	srl	a0,a0,a5
    eca4:	00001797          	auipc	a5,0x1
    eca8:	abc78793          	add	a5,a5,-1348 # f760 <__clz_tab>
    ecac:	00a787b3          	add	a5,a5,a0
    ecb0:	0007c503          	lbu	a0,0(a5)
    ecb4:	40a70533          	sub	a0,a4,a0
    ecb8:	00008067          	ret
    ecbc:	010007b7          	lui	a5,0x1000
    ecc0:	02f57463          	bgeu	a0,a5,ece8 <__clzsi2+0x64>
    ecc4:	01000793          	li	a5,16
    ecc8:	00f55533          	srl	a0,a0,a5
    eccc:	00001797          	auipc	a5,0x1
    ecd0:	a9478793          	add	a5,a5,-1388 # f760 <__clz_tab>
    ecd4:	00a787b3          	add	a5,a5,a0
    ecd8:	0007c503          	lbu	a0,0(a5)
    ecdc:	01000713          	li	a4,16
    ece0:	40a70533          	sub	a0,a4,a0
    ece4:	00008067          	ret
    ece8:	01800793          	li	a5,24
    ecec:	00f55533          	srl	a0,a0,a5
    ecf0:	00001797          	auipc	a5,0x1
    ecf4:	a7078793          	add	a5,a5,-1424 # f760 <__clz_tab>
    ecf8:	00a787b3          	add	a5,a5,a0
    ecfc:	0007c503          	lbu	a0,0(a5)
    ed00:	00800713          	li	a4,8
    ed04:	40a70533          	sub	a0,a4,a0
    ed08:	00008067          	ret
