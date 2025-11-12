
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x3a0>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	0000f397          	auipc	t2,0xf
      38:	6b438393          	add	t2,t2,1716 # f6e8 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80001597          	auipc	a1,0x80001
      58:	0c058593          	add	a1,a1,192 # 80001114 <__crt0_bss_end>
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
     110:	aa040413          	add	s0,s0,-1376 # ebac <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	a9848493          	add	s1,s1,-1384 # ebac <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	1c860613          	add	a2,a2,456 # 2f8 <main>

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
     178:	a3840413          	add	s0,s0,-1480 # ebac <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	a3048493          	add	s1,s1,-1488 # ebac <__fini_array_end>

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
   RV CSR timing (RV32/RV64, no FP/heap)
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

0000020c <print_speedup_fixed.constprop.0>:
/* Deterministic small signed data (keeps values in -8..7) */
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }

/* Print fixed-point speedup (no floats): (num/den) as X.YYYx */
static void print_speedup_fixed(const char* label, uint64_t num, uint64_t den) {
     20c:	fe010113          	add	sp,sp,-32
     210:	01212823          	sw	s2,16(sp)
     214:	00112e23          	sw	ra,28(sp)
     218:	00812c23          	sw	s0,24(sp)
     21c:	00912a23          	sw	s1,20(sp)
  if (!den) { printf("%s: n/a\n", label); return; }
     220:	00d667b3          	or	a5,a2,a3
     224:	0000f937          	lui	s2,0xf
     228:	02079463          	bnez	a5,250 <print_speedup_fixed.constprop.0+0x44>
  uint64_t scaled = (num * 1000ull + den/2) / den; /* rounded */
  printf("%s: %" PRIu64 ".%03" PRIu64 "x", label, scaled/1000ull, scaled%1000ull);
}
     22c:	01812403          	lw	s0,24(sp)
     230:	01c12083          	lw	ra,28(sp)
     234:	01412483          	lw	s1,20(sp)
  if (!den) { printf("%s: n/a\n", label); return; }
     238:	bb890593          	add	a1,s2,-1096 # ebb8 <__fini_array_end+0xc>
}
     23c:	01012903          	lw	s2,16(sp)
  if (!den) { printf("%s: n/a\n", label); return; }
     240:	0000f537          	lui	a0,0xf
     244:	bb050513          	add	a0,a0,-1104 # ebb0 <__fini_array_end+0x4>
}
     248:	02010113          	add	sp,sp,32
  if (!den) { printf("%s: n/a\n", label); return; }
     24c:	11d0006f          	j	b68 <printf>
     250:	00068413          	mv	s0,a3
  uint64_t scaled = (num * 1000ull + den/2) / den; /* rounded */
     254:	00060493          	mv	s1,a2
     258:	00000693          	li	a3,0
     25c:	3e800613          	li	a2,1000
     260:	7780e0ef          	jal	e9d8 <__muldi3>
     264:	00050793          	mv	a5,a0
     268:	01f41713          	sll	a4,s0,0x1f
     26c:	0014d513          	srl	a0,s1,0x1
     270:	00a76533          	or	a0,a4,a0
     274:	00a78533          	add	a0,a5,a0
     278:	00145713          	srl	a4,s0,0x1
     27c:	00f537b3          	sltu	a5,a0,a5
     280:	00e585b3          	add	a1,a1,a4
     284:	00b785b3          	add	a1,a5,a1
     288:	00048613          	mv	a2,s1
     28c:	00040693          	mv	a3,s0
     290:	7510a0ef          	jal	b1e0 <__udivdi3>
  printf("%s: %" PRIu64 ".%03" PRIu64 "x", label, scaled/1000ull, scaled%1000ull);
     294:	3e800613          	li	a2,1000
     298:	00000693          	li	a3,0
  uint64_t scaled = (num * 1000ull + den/2) / den; /* rounded */
     29c:	00050493          	mv	s1,a0
     2a0:	00058413          	mv	s0,a1
  printf("%s: %" PRIu64 ".%03" PRIu64 "x", label, scaled/1000ull, scaled%1000ull);
     2a4:	5e80b0ef          	jal	b88c <__umoddi3>
     2a8:	00a12623          	sw	a0,12(sp)
     2ac:	00b12423          	sw	a1,8(sp)
     2b0:	3e800613          	li	a2,1000
     2b4:	00000693          	li	a3,0
     2b8:	00048513          	mv	a0,s1
     2bc:	00040593          	mv	a1,s0
     2c0:	7210a0ef          	jal	b1e0 <__udivdi3>
}
     2c4:	01812403          	lw	s0,24(sp)
  printf("%s: %" PRIu64 ".%03" PRIu64 "x", label, scaled/1000ull, scaled%1000ull);
     2c8:	00c12703          	lw	a4,12(sp)
     2cc:	00812783          	lw	a5,8(sp)
}
     2d0:	01c12083          	lw	ra,28(sp)
     2d4:	01412483          	lw	s1,20(sp)
  printf("%s: %" PRIu64 ".%03" PRIu64 "x", label, scaled/1000ull, scaled%1000ull);
     2d8:	00058693          	mv	a3,a1
     2dc:	bb890593          	add	a1,s2,-1096
}
     2e0:	01012903          	lw	s2,16(sp)
  printf("%s: %" PRIu64 ".%03" PRIu64 "x", label, scaled/1000ull, scaled%1000ull);
     2e4:	00050613          	mv	a2,a0
     2e8:	0000f537          	lui	a0,0xf
     2ec:	bbc50513          	add	a0,a0,-1092 # ebbc <__fini_array_end+0x10>
}
     2f0:	02010113          	add	sp,sp,32
  printf("%s: %" PRIu64 ".%03" PRIu64 "x", label, scaled/1000ull, scaled%1000ull);
     2f4:	0750006f          	j	b68 <printf>

000002f8 <main>:
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     2f8:	ffeb07b7          	lui	a5,0xffeb0
     2fc:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
/* =======================
   Main
   ======================= */
int main(void) {
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);
     300:	0000f537          	lui	a0,0xf
int main(void) {
     304:	f7010113          	add	sp,sp,-144
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);
     308:	be050513          	add	a0,a0,-1056 # ebe0 <__fini_array_end+0x34>
int main(void) {
     30c:	08112623          	sw	ra,140(sp)
     310:	09212023          	sw	s2,128(sp)
     314:	07612823          	sw	s6,112(sp)
     318:	07712623          	sw	s7,108(sp)
     31c:	07812423          	sw	s8,104(sp)
     320:	07912223          	sw	s9,100(sp)
     324:	08812423          	sw	s0,136(sp)
     328:	08912223          	sw	s1,132(sp)
     32c:	07312e23          	sw	s3,124(sp)
     330:	07412c23          	sw	s4,120(sp)
     334:	07512a23          	sw	s5,116(sp)
     338:	07a12023          	sw	s10,96(sp)
     33c:	05b12e23          	sw	s11,92(sp)
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", id);
     340:	029000ef          	jal	b68 <printf>
  /* Shared flat buffers */
  static int8_t  A_flat[4 * LDA];   /* 4 rows, MAXK columns */
  static int8_t  B_flat[MAXK * LDB];/* up to MAXK rows, 4 columns */
  static int32_t C_sw[4][4], C_hw[4][4];

  printf(" K |   SW cycles |  CFS cycles |   SW inst |  CFS inst |   Speedup(cyc)   Speedup(ins)   Result\n");
     344:	0000f537          	lui	a0,0xf
     348:	c0850513          	add	a0,a0,-1016 # ec08 <__fini_array_end+0x5c>
     34c:	199000ef          	jal	ce4 <puts>
  printf("----+------------+-------------+-----------+-----------+-----------------+--------------+--------\n");
     350:	0000f537          	lui	a0,0xf
     354:	c6850513          	add	a0,a0,-920 # ec68 <__fini_array_end+0xbc>
     358:	18d000ef          	jal	ce4 <puts>

  for (int idx = 0; idx < NUM_KS; ++idx) {
     35c:	800017b7          	lui	a5,0x80001
     360:	bb478b13          	add	s6,a5,-1100 # 80000bb4 <A_flat.3>
    /* Line: K, cycles, inst, speedups, result */
    printf("%3d | %10" PRIu64 " | %11" PRIu64 " | %9" PRIu64 " | %9" PRIu64 " | ",
           K, sw_cyc, cfs_cyc, sw_ins, cfs_ins);
    print_speedup_fixed("", sw_cyc, cfs_cyc);   printf("   ");
    print_speedup_fixed("", sw_ins, cfs_ins);   printf("   ");
    printf("%s\n", ok ? "PASS" : "FAIL");
     364:	0000f7b7          	lui	a5,0xf
     368:	0000f937          	lui	s2,0xf
     36c:	80000bb7          	lui	s7,0x80000
     370:	bd878793          	add	a5,a5,-1064 # ebd8 <__fini_array_end+0x2c>
     374:	fe090913          	add	s2,s2,-32 # efe0 <Ks>
     378:	7b4b8c13          	add	s8,s7,1972 # 800007b4 <B_flat.2>
     37c:	80000cb7          	lui	s9,0x80000
     380:	02f12423          	sw	a5,40(sp)
    int K = Ks[idx];
     384:	00092403          	lw	s0,0(s2)
    if (K > MAXK) continue;
     388:	10000493          	li	s1,256
     38c:	4c84c863          	blt	s1,s0,85c <main+0x564>
     390:	800017b7          	lui	a5,0x80001
     394:	bb478a13          	add	s4,a5,-1100 # 80000bb4 <A_flat.3>
     398:	00100993          	li	s3,1
      for (int k = K; k < MAXK; ++k) A_flat[i*LDA + k] = 0;
     39c:	408484b3          	sub	s1,s1,s0
    for (int i = 0; i < 4; ++i) {
     3a0:	00500a93          	li	s5,5
     3a4:	0ff9f693          	zext.b	a3,s3
     3a8:	00269793          	sll	a5,a3,0x2
     3ac:	40f687b3          	sub	a5,a3,a5
     3b0:	0ff7f793          	zext.b	a5,a5
      for (int k = 0; k < K; ++k) {
     3b4:	00000713          	li	a4,0
     3b8:	0200006f          	j	3d8 <main+0xe0>
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     3bc:	00f7f613          	and	a2,a5,15
        A_flat[i*LDA + k] = pattA(i, k);
     3c0:	00ea05b3          	add	a1,s4,a4
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     3c4:	ff860613          	add	a2,a2,-8
     3c8:	00f687b3          	add	a5,a3,a5
        A_flat[i*LDA + k] = pattA(i, k);
     3cc:	00c58023          	sb	a2,0(a1)
      for (int k = 0; k < K; ++k) {
     3d0:	00170713          	add	a4,a4,1
     3d4:	0ff7f793          	zext.b	a5,a5
     3d8:	fe8742e3          	blt	a4,s0,3bc <main+0xc4>
      for (int k = K; k < MAXK; ++k) A_flat[i*LDA + k] = 0;
     3dc:	01440533          	add	a0,s0,s4
     3e0:	00048613          	mv	a2,s1
     3e4:	00000593          	li	a1,0
    for (int i = 0; i < 4; ++i) {
     3e8:	00198993          	add	s3,s3,1
      for (int k = K; k < MAXK; ++k) A_flat[i*LDA + k] = 0;
     3ec:	119000ef          	jal	d04 <memset>
    for (int i = 0; i < 4; ++i) {
     3f0:	100a0a13          	add	s4,s4,256
     3f4:	fb5998e3          	bne	s3,s5,3a4 <main+0xac>
     3f8:	7b4b8693          	add	a3,s7,1972
    for (int k = 0; k < K; ++k) {
     3fc:	00000613          	li	a2,0
      B_flat[k*LDB + 2] = pattB(k, 2);
     400:	ff800593          	li	a1,-8
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     404:	00500513          	li	a0,5
    for (int k = 0; k < K; ++k) {
     408:	1c864c63          	blt	a2,s0,5e0 <main+0x2e8>
    uint64_t c0 = rdcycle(), i0 = rdinstret();
     40c:	dd9ff0ef          	jal	1e4 <rdcycle>
      C[i][j] = 0;
     410:	800004b7          	lui	s1,0x80000
    uint64_t c0 = rdcycle(), i0 = rdinstret();
     414:	00050a13          	mv	s4,a0
     418:	00058a93          	mv	s5,a1
     41c:	dddff0ef          	jal	1f8 <rdinstret>
      C[i][j] = 0;
     420:	04000613          	li	a2,64
    uint64_t c0 = rdcycle(), i0 = rdinstret();
     424:	00050993          	mv	s3,a0
     428:	00058d93          	mv	s11,a1
      C[i][j] = 0;
     42c:	77448513          	add	a0,s1,1908 # 80000774 <C_sw.1>
     430:	00000593          	li	a1,0
     434:	0d1000ef          	jal	d04 <memset>
     438:	77448493          	add	s1,s1,1908
     43c:	00000793          	li	a5,0
  for (int i = 0; i < 4; ++i) {
     440:	40000613          	li	a2,1024
    for (int k = 0; k < K; ++k) {
     444:	000c0d13          	mv	s10,s8
     448:	00000713          	li	a4,0
      int32_t a = (int32_t)A[aoff + k];
     44c:	01678833          	add	a6,a5,s6
    for (int k = 0; k < K; ++k) {
     450:	1c874c63          	blt	a4,s0,628 <main+0x330>
  for (int i = 0; i < 4; ++i) {
     454:	10078793          	add	a5,a5,256
     458:	01048493          	add	s1,s1,16
     45c:	fec794e3          	bne	a5,a2,444 <main+0x14c>
    uint64_t i1 = rdinstret(), c1 = rdcycle();
     460:	d99ff0ef          	jal	1f8 <rdinstret>
     464:	00050d13          	mv	s10,a0
     468:	00058493          	mv	s1,a1
     46c:	d79ff0ef          	jal	1e4 <rdcycle>
    uint64_t sw_cyc = c1 - c0, sw_ins = i1 - i0;
     470:	41450a33          	sub	s4,a0,s4
     474:	41558ab3          	sub	s5,a1,s5
     478:	01453533          	sltu	a0,a0,s4
     47c:	413d09b3          	sub	s3,s10,s3
     480:	40aa87b3          	sub	a5,s5,a0
     484:	41b484b3          	sub	s1,s1,s11
     488:	013d3d33          	sltu	s10,s10,s3
     48c:	00f12c23          	sw	a5,24(sp)
     490:	41a487b3          	sub	a5,s1,s10
     494:	00f12e23          	sw	a5,28(sp)
    c0 = rdcycle(); i0 = rdinstret();
     498:	d4dff0ef          	jal	1e4 <rdcycle>
     49c:	02a12023          	sw	a0,32(sp)
     4a0:	02b12223          	sw	a1,36(sp)
     4a4:	d55ff0ef          	jal	1f8 <rdinstret>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     4a8:	ffeb07b7          	lui	a5,0xffeb0
     4ac:	00200713          	li	a4,2
     4b0:	ffeb0837          	lui	a6,0xffeb0
     4b4:	ffeb08b7          	lui	a7,0xffeb0
     4b8:	ffeb0337          	lui	t1,0xffeb0
     4bc:	ffeb0e37          	lui	t3,0xffeb0
     4c0:	ffeb0eb7          	lui	t4,0xffeb0
     4c4:	ffeb0f37          	lui	t5,0xffeb0
     4c8:	ffeb0fb7          	lui	t6,0xffeb0
     4cc:	ffeb02b7          	lui	t0,0xffeb0
    c0 = rdcycle(); i0 = rdinstret();
     4d0:	00050a93          	mv	s5,a0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     4d4:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
    c0 = rdcycle(); i0 = rdinstret();
     4d8:	00058493          	mv	s1,a1
  const int T = K + 6;  /* total STEPs = K + (4-1)+(4-1) */
     4dc:	00640513          	add	a0,s0,6
  for (int t = 0; t < T; t += 4) {
     4e0:	00000793          	li	a5,0
      for (int s = 0; s < 4; ++s) {
     4e4:	00400613          	li	a2,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     4e8:	00480813          	add	a6,a6,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     4ec:	00888893          	add	a7,a7,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     4f0:	00c30313          	add	t1,t1,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     4f4:	010e0e13          	add	t3,t3,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     4f8:	014e8e93          	add	t4,t4,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     4fc:	018f0f13          	add	t5,t5,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     500:	01cf8f93          	add	t6,t6,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     504:	02028293          	add	t0,t0,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
  for (int t = 0; t < T; t += 4) {
     508:	1aa7c863          	blt	a5,a0,6b8 <main+0x3c0>
    i1 = rdinstret(); c1 = rdcycle();
     50c:	cedff0ef          	jal	1f8 <rdinstret>
     510:	00050d93          	mv	s11,a0
     514:	02b12623          	sw	a1,44(sp)
     518:	ccdff0ef          	jal	1e4 <rdcycle>
    uint64_t cfs_cyc = c1 - c0, cfs_ins = i1 - i0;
     51c:	02012783          	lw	a5,32(sp)
     520:	02c12683          	lw	a3,44(sp)
     524:	415d8ab3          	sub	s5,s11,s5
     528:	40f50733          	sub	a4,a0,a5
     52c:	02412783          	lw	a5,36(sp)
     530:	00e53533          	sltu	a0,a0,a4
    for (int j = 0; j < 4; ++j)
     534:	01000813          	li	a6,16
    uint64_t cfs_cyc = c1 - c0, cfs_ins = i1 - i0;
     538:	40f58d33          	sub	s10,a1,a5
     53c:	015db7b3          	sltu	a5,s11,s5
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     540:	ffeb05b7          	lui	a1,0xffeb0
    uint64_t cfs_cyc = c1 - c0, cfs_ins = i1 - i0;
     544:	40968db3          	sub	s11,a3,s1
     548:	40ad0d33          	sub	s10,s10,a0
     54c:	40fd8db3          	sub	s11,s11,a5
     550:	734c8513          	add	a0,s9,1844 # 80000734 <C_hw.0>
     554:	00000693          	li	a3,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     558:	04058593          	add	a1,a1,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
    for (int j = 0; j < 4; ++j)
     55c:	00269613          	sll	a2,a3,0x2
      C[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     560:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     564:	00b60633          	add	a2,a2,a1
     568:	00f608b3          	add	a7,a2,a5
     56c:	0008ae03          	lw	t3,0(a7)
      C[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     570:	00f508b3          	add	a7,a0,a5
    for (int j = 0; j < 4; ++j)
     574:	00478793          	add	a5,a5,4
      C[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     578:	01c8a023          	sw	t3,0(a7)
    for (int j = 0; j < 4; ++j)
     57c:	ff0796e3          	bne	a5,a6,568 <main+0x270>
  for (int i = 0; i < 4; ++i)
     580:	00468693          	add	a3,a3,4
     584:	01050513          	add	a0,a0,16
     588:	fcf69ae3          	bne	a3,a5,55c <main+0x264>
     58c:	00000693          	li	a3,0
    for (int j = 0; j < 4; ++j)
     590:	01000893          	li	a7,16
  for (int i = 0; i < 4; ++i)
     594:	04000e13          	li	t3,64
      if (A[i][j] != B[i][j]) return 0;
     598:	800007b7          	lui	a5,0x80000
     59c:	73478793          	add	a5,a5,1844 # 80000734 <C_hw.0>
     5a0:	00d78833          	add	a6,a5,a3
     5a4:	800007b7          	lui	a5,0x80000
     5a8:	77478793          	add	a5,a5,1908 # 80000774 <C_sw.1>
     5ac:	00d78533          	add	a0,a5,a3
     5b0:	00000793          	li	a5,0
     5b4:	00f805b3          	add	a1,a6,a5
     5b8:	00f50633          	add	a2,a0,a5
     5bc:	0005a583          	lw	a1,0(a1)
     5c0:	00062603          	lw	a2,0(a2)
     5c4:	20c59863          	bne	a1,a2,7d4 <main+0x4dc>
    for (int j = 0; j < 4; ++j)
     5c8:	00478793          	add	a5,a5,4
     5cc:	ff1794e3          	bne	a5,a7,5b4 <main+0x2bc>
  for (int i = 0; i < 4; ++i)
     5d0:	01068693          	add	a3,a3,16
     5d4:	fdc692e3          	bne	a3,t3,598 <main+0x2a0>
  return 1;
     5d8:	00100493          	li	s1,1
     5dc:	1fc0006f          	j	7d8 <main+0x4e0>
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     5e0:	0ff67793          	zext.b	a5,a2
     5e4:	00179713          	sll	a4,a5,0x1
     5e8:	ff670713          	add	a4,a4,-10
     5ec:	00f77713          	and	a4,a4,15
     5f0:	ff870713          	add	a4,a4,-8
      B_flat[k*LDB + 0] = pattB(k, 0);
     5f4:	00e68023          	sb	a4,0(a3)
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     5f8:	ffb78713          	add	a4,a5,-5
     5fc:	40f507b3          	sub	a5,a0,a5
     600:	00f77713          	and	a4,a4,15
     604:	00f7f793          	and	a5,a5,15
     608:	ff870713          	add	a4,a4,-8
     60c:	ff878793          	add	a5,a5,-8
      B_flat[k*LDB + 1] = pattB(k, 1);
     610:	00e680a3          	sb	a4,1(a3)
      B_flat[k*LDB + 2] = pattB(k, 2);
     614:	00b68123          	sb	a1,2(a3)
      B_flat[k*LDB + 3] = pattB(k, 3);
     618:	00f681a3          	sb	a5,3(a3)
    for (int k = 0; k < K; ++k) {
     61c:	00160613          	add	a2,a2,1
     620:	00468693          	add	a3,a3,4
     624:	de5ff06f          	j	408 <main+0x110>
      int32_t a = (int32_t)A[aoff + k];
     628:	00e806b3          	add	a3,a6,a4
     62c:	00068583          	lb	a1,0(a3)
      C[i][0] += a * (int32_t)B[boff + 0];
     630:	000d0503          	lb	a0,0(s10)
     634:	02f12223          	sw	a5,36(sp)
      int32_t a = (int32_t)A[aoff + k];
     638:	02e12023          	sw	a4,32(sp)
     63c:	01012e23          	sw	a6,28(sp)
      C[i][0] += a * (int32_t)B[boff + 0];
     640:	00b12c23          	sw	a1,24(sp)
     644:	3700e0ef          	jal	e9b4 <__mulsi3>
     648:	0004a683          	lw	a3,0(s1)
      C[i][1] += a * (int32_t)B[boff + 1];
     64c:	01812583          	lw	a1,24(sp)
     650:	004d0d13          	add	s10,s10,4
      C[i][0] += a * (int32_t)B[boff + 0];
     654:	00a686b3          	add	a3,a3,a0
      C[i][1] += a * (int32_t)B[boff + 1];
     658:	ffdd0503          	lb	a0,-3(s10)
      C[i][0] += a * (int32_t)B[boff + 0];
     65c:	00d4a023          	sw	a3,0(s1)
      C[i][1] += a * (int32_t)B[boff + 1];
     660:	3540e0ef          	jal	e9b4 <__mulsi3>
     664:	0044a683          	lw	a3,4(s1)
      C[i][2] += a * (int32_t)B[boff + 2];
     668:	01812583          	lw	a1,24(sp)
      C[i][1] += a * (int32_t)B[boff + 1];
     66c:	00a686b3          	add	a3,a3,a0
      C[i][2] += a * (int32_t)B[boff + 2];
     670:	ffed0503          	lb	a0,-2(s10)
      C[i][1] += a * (int32_t)B[boff + 1];
     674:	00d4a223          	sw	a3,4(s1)
      C[i][2] += a * (int32_t)B[boff + 2];
     678:	33c0e0ef          	jal	e9b4 <__mulsi3>
     67c:	0084a683          	lw	a3,8(s1)
      C[i][3] += a * (int32_t)B[boff + 3];
     680:	01812583          	lw	a1,24(sp)
      C[i][2] += a * (int32_t)B[boff + 2];
     684:	00a686b3          	add	a3,a3,a0
      C[i][3] += a * (int32_t)B[boff + 3];
     688:	fffd0503          	lb	a0,-1(s10)
      C[i][2] += a * (int32_t)B[boff + 2];
     68c:	00d4a423          	sw	a3,8(s1)
      C[i][3] += a * (int32_t)B[boff + 3];
     690:	3240e0ef          	jal	e9b4 <__mulsi3>
     694:	00c4a683          	lw	a3,12(s1)
    for (int k = 0; k < K; ++k) {
     698:	02012703          	lw	a4,32(sp)
     69c:	02412783          	lw	a5,36(sp)
      C[i][3] += a * (int32_t)B[boff + 3];
     6a0:	00a686b3          	add	a3,a3,a0
     6a4:	01c12803          	lw	a6,28(sp)
     6a8:	00d4a623          	sw	a3,12(s1)
    for (int k = 0; k < K; ++k) {
     6ac:	00170713          	add	a4,a4,1
     6b0:	40000613          	li	a2,1024
     6b4:	d9dff06f          	j	450 <main+0x158>
    int8_t a_bytes[4][4] = {{0}};
     6b8:	02012823          	sw	zero,48(sp)
     6bc:	02012a23          	sw	zero,52(sp)
     6c0:	02012c23          	sw	zero,56(sp)
     6c4:	02012e23          	sw	zero,60(sp)
    int8_t b_bytes[4][4] = {{0}};
     6c8:	04012023          	sw	zero,64(sp)
     6cc:	04012223          	sw	zero,68(sp)
     6d0:	04012423          	sw	zero,72(sp)
     6d4:	04012623          	sw	zero,76(sp)
    for (int i = 0; i < 4; ++i)
     6d8:	03010093          	add	ra,sp,48
    int8_t b_bytes[4][4] = {{0}};
     6dc:	000b0393          	mv	t2,s6
    for (int i = 0; i < 4; ++i)
     6e0:	00000593          	li	a1,0
      for (int s = 0; s < 4; ++s) {
     6e4:	40b78733          	sub	a4,a5,a1
     6e8:	00000693          	li	a3,0
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
     6ec:	00074c63          	bltz	a4,704 <main+0x40c>
     6f0:	00875a63          	bge	a4,s0,704 <main+0x40c>
     6f4:	00e38db3          	add	s11,t2,a4
     6f8:	000dcd83          	lbu	s11,0(s11)
     6fc:	00d08d33          	add	s10,ra,a3
     700:	01bd0023          	sb	s11,0(s10)
      for (int s = 0; s < 4; ++s) {
     704:	00168693          	add	a3,a3,1
     708:	00170713          	add	a4,a4,1
     70c:	fec690e3          	bne	a3,a2,6ec <main+0x3f4>
    for (int i = 0; i < 4; ++i)
     710:	00158593          	add	a1,a1,1
     714:	10038393          	add	t2,t2,256
     718:	00408093          	add	ra,ra,4
     71c:	fcc594e3          	bne	a1,a2,6e4 <main+0x3ec>
     720:	04010393          	add	t2,sp,64
    for (int j = 0; j < 4; ++j)
     724:	00000713          	li	a4,0
      for (int s = 0; s < 4; ++s) {
     728:	40e786b3          	sub	a3,a5,a4
     72c:	00000593          	li	a1,0
        if (k >= 0 && k < K) b_bytes[j][s] = B_flat[k*LDB + j];
     730:	00ec0d33          	add	s10,s8,a4
     734:	0006ce63          	bltz	a3,750 <main+0x458>
     738:	0086dc63          	bge	a3,s0,750 <main+0x458>
     73c:	00269d93          	sll	s11,a3,0x2
     740:	01bd0db3          	add	s11,s10,s11
     744:	000dcd83          	lbu	s11,0(s11)
     748:	00b380b3          	add	ra,t2,a1
     74c:	01b08023          	sb	s11,0(ra)
      for (int s = 0; s < 4; ++s) {
     750:	00158593          	add	a1,a1,1
     754:	00168693          	add	a3,a3,1
     758:	fcc59ee3          	bne	a1,a2,734 <main+0x43c>
    for (int j = 0; j < 4; ++j)
     75c:	00170713          	add	a4,a4,1
     760:	00438393          	add	t2,t2,4
     764:	fcc712e3          	bne	a4,a2,728 <main+0x430>
         (((uint32_t)(uint8_t)x2) << 16) |
     768:	03012683          	lw	a3,48(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     76c:	00d82023          	sw	a3,0(a6)
         (((uint32_t)(uint8_t)x2) << 16) |
     770:	03412683          	lw	a3,52(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     774:	00d8a023          	sw	a3,0(a7)
         (((uint32_t)(uint8_t)x2) << 16) |
     778:	03812683          	lw	a3,56(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     77c:	00d32023          	sw	a3,0(t1)
         (((uint32_t)(uint8_t)x2) << 16) |
     780:	03c12683          	lw	a3,60(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     784:	00de2023          	sw	a3,0(t3)
         (((uint32_t)(uint8_t)x2) << 16) |
     788:	04012683          	lw	a3,64(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     78c:	00dea023          	sw	a3,0(t4)
         (((uint32_t)(uint8_t)x2) << 16) |
     790:	04412683          	lw	a3,68(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     794:	00df2023          	sw	a3,0(t5)
         (((uint32_t)(uint8_t)x2) << 16) |
     798:	04812683          	lw	a3,72(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     79c:	00dfa023          	sw	a3,0(t6)
         (((uint32_t)(uint8_t)x2) << 16) |
     7a0:	04c12683          	lw	a3,76(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7a4:	00d2a023          	sw	a3,0(t0)
    int steps = (t + 4 <= T) ? 4 : (T - t);
     7a8:	00378693          	add	a3,a5,3
     7ac:	00a6c463          	blt	a3,a0,7b4 <main+0x4bc>
     7b0:	40f50733          	sub	a4,a0,a5
    for (int s = 0; s < steps; ++s) cfs_step();
     7b4:	00000693          	li	a3,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7b8:	ffeb05b7          	lui	a1,0xffeb0
     7bc:	00100393          	li	t2,1
     7c0:	0075a023          	sw	t2,0(a1) # ffeb0000 <__crt0_ram_last+0x7fe30001>
    for (int s = 0; s < steps; ++s) cfs_step();
     7c4:	00168693          	add	a3,a3,1
     7c8:	fee698e3          	bne	a3,a4,7b8 <main+0x4c0>
  for (int t = 0; t < T; t += 4) {
     7cc:	00478793          	add	a5,a5,4
     7d0:	d39ff06f          	j	508 <main+0x210>
      if (A[i][j] != B[i][j]) return 0;
     7d4:	00000493          	li	s1,0
    printf("%3d | %10" PRIu64 " | %11" PRIu64 " | %9" PRIu64 " | %9" PRIu64 " | ",
     7d8:	01c12883          	lw	a7,28(sp)
     7dc:	01812683          	lw	a3,24(sp)
     7e0:	0000f537          	lui	a0,0xf
     7e4:	00098813          	mv	a6,s3
     7e8:	000d0793          	mv	a5,s10
     7ec:	00040593          	mv	a1,s0
     7f0:	000a0613          	mv	a2,s4
     7f4:	01512023          	sw	s5,0(sp)
     7f8:	01b12223          	sw	s11,4(sp)
     7fc:	ccc50513          	add	a0,a0,-820 # eccc <__fini_array_end+0x120>
     800:	02e12023          	sw	a4,32(sp)
     804:	364000ef          	jal	b68 <printf>
    print_speedup_fixed("", sw_cyc, cfs_cyc);   printf("   ");
     808:	02012703          	lw	a4,32(sp)
     80c:	01812583          	lw	a1,24(sp)
     810:	000d0693          	mv	a3,s10
     814:	00070613          	mv	a2,a4
     818:	000a0513          	mv	a0,s4
     81c:	9f1ff0ef          	jal	20c <print_speedup_fixed.constprop.0>
     820:	0000f437          	lui	s0,0xf
     824:	cf840513          	add	a0,s0,-776 # ecf8 <__fini_array_end+0x14c>
     828:	340000ef          	jal	b68 <printf>
    print_speedup_fixed("", sw_ins, cfs_ins);   printf("   ");
     82c:	01c12583          	lw	a1,28(sp)
     830:	000a8613          	mv	a2,s5
     834:	000d8693          	mv	a3,s11
     838:	00098513          	mv	a0,s3
     83c:	9d1ff0ef          	jal	20c <print_speedup_fixed.constprop.0>
     840:	cf840513          	add	a0,s0,-776
     844:	324000ef          	jal	b68 <printf>
    printf("%s\n", ok ? "PASS" : "FAIL");
     848:	02812503          	lw	a0,40(sp)
     84c:	00048663          	beqz	s1,858 <main+0x560>
     850:	0000f537          	lui	a0,0xf
     854:	bd050513          	add	a0,a0,-1072 # ebd0 <__fini_array_end+0x24>
     858:	48c000ef          	jal	ce4 <puts>
  for (int idx = 0; idx < NUM_KS; ++idx) {
     85c:	0000f7b7          	lui	a5,0xf
     860:	00490913          	add	s2,s2,4
     864:	ff878793          	add	a5,a5,-8 # eff8 <_ctype_>
     868:	b1279ee3          	bne	a5,s2,384 <main+0x8c>
  }

  printf("\nNote:\n");
     86c:	0000f537          	lui	a0,0xf
     870:	cfc50513          	add	a0,a0,-772 # ecfc <__fini_array_end+0x150>
     874:	470000ef          	jal	ce4 <puts>
  printf("- For small K, SW may win due to MMIO and pipeline flush (+6 steps).\n");
     878:	0000f537          	lui	a0,0xf
     87c:	d0450513          	add	a0,a0,-764 # ed04 <__fini_array_end+0x158>
     880:	464000ef          	jal	ce4 <puts>
  printf("- As K grows, CFS amortizes overhead: total steps = K + 6, doing 16 MACs/step.\n");
     884:	0000f537          	lui	a0,0xf
     888:	d4c50513          	add	a0,a0,-692 # ed4c <__fini_array_end+0x1a0>
     88c:	458000ef          	jal	ce4 <puts>
  printf("- To reduce MMIO further, add an on-CFS step sequencer (GO+LEN) or small FIFOs.\n");
     890:	0000f537          	lui	a0,0xf
     894:	d9c50513          	add	a0,a0,-612 # ed9c <__fini_array_end+0x1f0>
     898:	44c000ef          	jal	ce4 <puts>
  return 0;
}
     89c:	08c12083          	lw	ra,140(sp)
     8a0:	08812403          	lw	s0,136(sp)
     8a4:	08412483          	lw	s1,132(sp)
     8a8:	08012903          	lw	s2,128(sp)
     8ac:	07c12983          	lw	s3,124(sp)
     8b0:	07812a03          	lw	s4,120(sp)
     8b4:	07412a83          	lw	s5,116(sp)
     8b8:	07012b03          	lw	s6,112(sp)
     8bc:	06c12b83          	lw	s7,108(sp)
     8c0:	06812c03          	lw	s8,104(sp)
     8c4:	06412c83          	lw	s9,100(sp)
     8c8:	06012d03          	lw	s10,96(sp)
     8cc:	05c12d83          	lw	s11,92(sp)
     8d0:	00000513          	li	a0,0
     8d4:	09010113          	add	sp,sp,144
     8d8:	00008067          	ret

000008dc <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     8dc:	00000097          	auipc	ra,0x0
     8e0:	87c08093          	add	ra,ra,-1924 # 158 <__crt0_main_exit>
     8e4:	00050513          	mv	a0,a0
     8e8:	00008067          	ret

000008ec <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     8ec:	fff00513          	li	a0,-1
     8f0:	00008067          	ret

000008f4 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     8f4:	000027b7          	lui	a5,0x2
     8f8:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     8fc:	00000513          	li	a0,0
     900:	00008067          	ret

00000904 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     904:	00100513          	li	a0,1
     908:	00008067          	ret

0000090c <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     90c:	00100513          	li	a0,1
     910:	00008067          	ret

00000914 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     914:	800007b7          	lui	a5,0x80000
     918:	01600713          	li	a4,22
     91c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     920:	fff00513          	li	a0,-1
     924:	00008067          	ret

00000928 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     928:	00000513          	li	a0,0
     92c:	00008067          	ret

00000930 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     930:	fe010113          	add	sp,sp,-32
     934:	00912a23          	sw	s1,20(sp)
     938:	01212823          	sw	s2,16(sp)
     93c:	00112e23          	sw	ra,28(sp)
     940:	00812c23          	sw	s0,24(sp)
     944:	01312623          	sw	s3,12(sp)
     948:	01412423          	sw	s4,8(sp)
     94c:	00058913          	mv	s2,a1
     950:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     954:	06051463          	bnez	a0,9bc <_read+0x8c>
     958:	00050413          	mv	s0,a0
     95c:	fff50537          	lui	a0,0xfff50
     960:	1a0000ef          	jal	b00 <neorv32_uart_available>
     964:	04050c63          	beqz	a0,9bc <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     968:	00a00993          	li	s3,10
     96c:	00d00a13          	li	s4,13
    while (len--) {
     970:	00941663          	bne	s0,s1,97c <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     974:	00048413          	mv	s0,s1
     978:	0200006f          	j	998 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     97c:	fff50537          	lui	a0,0xfff50
     980:	1d0000ef          	jal	b50 <neorv32_uart_getc>
      *ptr++ = c;
     984:	008907b3          	add	a5,s2,s0
     988:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     98c:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     990:	01350463          	beq	a0,s3,998 <_read+0x68>
     994:	fd451ee3          	bne	a0,s4,970 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     998:	01c12083          	lw	ra,28(sp)
     99c:	00040513          	mv	a0,s0
     9a0:	01812403          	lw	s0,24(sp)
     9a4:	01412483          	lw	s1,20(sp)
     9a8:	01012903          	lw	s2,16(sp)
     9ac:	00c12983          	lw	s3,12(sp)
     9b0:	00812a03          	lw	s4,8(sp)
     9b4:	02010113          	add	sp,sp,32
     9b8:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     9bc:	fff60537          	lui	a0,0xfff60
     9c0:	140000ef          	jal	b00 <neorv32_uart_available>
  int read_cnt = 0;
     9c4:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     9c8:	02050863          	beqz	a0,9f8 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     9cc:	00a00993          	li	s3,10
     9d0:	00d00a13          	li	s4,13
    while (len--) {
     9d4:	fa9400e3          	beq	s0,s1,974 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     9d8:	fff60537          	lui	a0,0xfff60
     9dc:	174000ef          	jal	b50 <neorv32_uart_getc>
      *ptr++ = c;
     9e0:	008907b3          	add	a5,s2,s0
     9e4:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     9e8:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     9ec:	fb3506e3          	beq	a0,s3,998 <_read+0x68>
     9f0:	ff4512e3          	bne	a0,s4,9d4 <_read+0xa4>
     9f4:	fa5ff06f          	j	998 <_read+0x68>
    errno = ENOSYS;
     9f8:	800007b7          	lui	a5,0x80000
     9fc:	05800713          	li	a4,88
     a00:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     a04:	fff00413          	li	s0,-1
     a08:	f91ff06f          	j	998 <_read+0x68>

00000a0c <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     a0c:	ff010113          	add	sp,sp,-16
     a10:	00812423          	sw	s0,8(sp)
     a14:	00912223          	sw	s1,4(sp)
     a18:	00112623          	sw	ra,12(sp)
     a1c:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     a20:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     a24:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     a28:	00058413          	mv	s0,a1
     a2c:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     a30:	04a7ec63          	bltu	a5,a0,a88 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     a34:	fff50537          	lui	a0,0xfff50
     a38:	0c8000ef          	jal	b00 <neorv32_uart_available>
     a3c:	00940933          	add	s2,s0,s1
     a40:	02051463          	bnez	a0,a68 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     a44:	800007b7          	lui	a5,0x80000
     a48:	05800713          	li	a4,88
     a4c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     a50:	fff00493          	li	s1,-1
     a54:	0180006f          	j	a6c <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     a58:	00044583          	lbu	a1,0(s0)
     a5c:	fff50537          	lui	a0,0xfff50
     a60:	00140413          	add	s0,s0,1
     a64:	0d8000ef          	jal	b3c <neorv32_uart_putc>
      while (len--) {
     a68:	fe8918e3          	bne	s2,s0,a58 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     a6c:	00c12083          	lw	ra,12(sp)
     a70:	00812403          	lw	s0,8(sp)
     a74:	00012903          	lw	s2,0(sp)
     a78:	00048513          	mv	a0,s1
     a7c:	00412483          	lw	s1,4(sp)
     a80:	01010113          	add	sp,sp,16
     a84:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     a88:	fff60537          	lui	a0,0xfff60
     a8c:	074000ef          	jal	b00 <neorv32_uart_available>
     a90:	00940933          	add	s2,s0,s1
     a94:	fa0508e3          	beqz	a0,a44 <_write+0x38>
    while (len--) {
     a98:	fd240ae3          	beq	s0,s2,a6c <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     a9c:	00044583          	lbu	a1,0(s0)
     aa0:	fff60537          	lui	a0,0xfff60
     aa4:	00140413          	add	s0,s0,1
     aa8:	094000ef          	jal	b3c <neorv32_uart_putc>
      write_cnt++;
     aac:	fedff06f          	j	a98 <_write+0x8c>

00000ab0 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     ab0:	80000737          	lui	a4,0x80000
     ab4:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     ab8:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     abc:	00050793          	mv	a5,a0
     ac0:	11460613          	add	a2,a2,276 # 80001114 <__crt0_bss_end>
  if (curr_heap == NULL) {
     ac4:	00069463          	bnez	a3,acc <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     ac8:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     acc:	800016b7          	lui	a3,0x80001
     ad0:	11468693          	add	a3,a3,276 # 80001114 <__crt0_bss_end>
     ad4:	00c69c63          	bne	a3,a2,aec <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     ad8:	800007b7          	lui	a5,0x80000
     adc:	00c00713          	li	a4,12
     ae0:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     ae4:	fff00513          	li	a0,-1
     ae8:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     aec:	71472503          	lw	a0,1812(a4)
     af0:	00f507b3          	add	a5,a0,a5
     af4:	fed7f2e3          	bgeu	a5,a3,ad8 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     af8:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     afc:	00008067          	ret

00000b00 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     b00:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     b04:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     b08:	00e51c63          	bne	a0,a4,b20 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     b0c:	fffe07b7          	lui	a5,0xfffe0
     b10:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     b14:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     b18:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     b1c:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     b20:	fff60737          	lui	a4,0xfff60
    return 0;
     b24:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     b28:	fee79ae3          	bne	a5,a4,b1c <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     b2c:	fffe07b7          	lui	a5,0xfffe0
     b30:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     b34:	020007b7          	lui	a5,0x2000
     b38:	fe1ff06f          	j	b18 <neorv32_uart_available+0x18>

00000b3c <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     b3c:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     b40:	00a79713          	sll	a4,a5,0xa
     b44:	fe075ce3          	bgez	a4,b3c <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     b48:	00b52223          	sw	a1,4(a0)
}
     b4c:	00008067          	ret

00000b50 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     b50:	00052783          	lw	a5,0(a0)
     b54:	00f79713          	sll	a4,a5,0xf
     b58:	fe075ce3          	bgez	a4,b50 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     b5c:	00452503          	lw	a0,4(a0)
}
     b60:	0ff57513          	zext.b	a0,a0
     b64:	00008067          	ret

00000b68 <printf>:
     b68:	fc010113          	add	sp,sp,-64
     b6c:	02c12423          	sw	a2,40(sp)
     b70:	02d12623          	sw	a3,44(sp)
     b74:	80000317          	auipc	t1,0x80000
     b78:	b9432303          	lw	t1,-1132(t1) # 80000708 <_impure_ptr>
     b7c:	02b12223          	sw	a1,36(sp)
     b80:	02e12823          	sw	a4,48(sp)
     b84:	02f12a23          	sw	a5,52(sp)
     b88:	03012c23          	sw	a6,56(sp)
     b8c:	03112e23          	sw	a7,60(sp)
     b90:	00832583          	lw	a1,8(t1)
     b94:	02410693          	add	a3,sp,36
     b98:	00050613          	mv	a2,a0
     b9c:	00030513          	mv	a0,t1
     ba0:	00112e23          	sw	ra,28(sp)
     ba4:	00d12623          	sw	a3,12(sp)
     ba8:	0b0010ef          	jal	1c58 <_vfprintf_r>
     bac:	01c12083          	lw	ra,28(sp)
     bb0:	04010113          	add	sp,sp,64
     bb4:	00008067          	ret

00000bb8 <_puts_r>:
     bb8:	fd010113          	add	sp,sp,-48
     bbc:	02812423          	sw	s0,40(sp)
     bc0:	00050413          	mv	s0,a0
     bc4:	00058513          	mv	a0,a1
     bc8:	02912223          	sw	s1,36(sp)
     bcc:	02112623          	sw	ra,44(sp)
     bd0:	00058493          	mv	s1,a1
     bd4:	3b0000ef          	jal	f84 <strlen>
     bd8:	00150713          	add	a4,a0,1
     bdc:	0000e697          	auipc	a3,0xe
     be0:	21068693          	add	a3,a3,528 # edec <__fini_array_end+0x240>
     be4:	00e12623          	sw	a4,12(sp)
     be8:	03442783          	lw	a5,52(s0)
     bec:	01010713          	add	a4,sp,16
     bf0:	00d12c23          	sw	a3,24(sp)
     bf4:	00e12223          	sw	a4,4(sp)
     bf8:	00100693          	li	a3,1
     bfc:	00200713          	li	a4,2
     c00:	00912823          	sw	s1,16(sp)
     c04:	00a12a23          	sw	a0,20(sp)
     c08:	00d12e23          	sw	a3,28(sp)
     c0c:	00e12423          	sw	a4,8(sp)
     c10:	00842483          	lw	s1,8(s0)
     c14:	0c078263          	beqz	a5,cd8 <_puts_r+0x120>
     c18:	0644a703          	lw	a4,100(s1)
     c1c:	00c49783          	lh	a5,12(s1)
     c20:	00177713          	and	a4,a4,1
     c24:	00071663          	bnez	a4,c30 <_puts_r+0x78>
     c28:	2007f713          	and	a4,a5,512
     c2c:	08070e63          	beqz	a4,cc8 <_puts_r+0x110>
     c30:	01279713          	sll	a4,a5,0x12
     c34:	02074263          	bltz	a4,c58 <_puts_r+0xa0>
     c38:	0644a703          	lw	a4,100(s1)
     c3c:	ffffe6b7          	lui	a3,0xffffe
     c40:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     c44:	00002637          	lui	a2,0x2
     c48:	00c7e7b3          	or	a5,a5,a2
     c4c:	00d77733          	and	a4,a4,a3
     c50:	00f49623          	sh	a5,12(s1)
     c54:	06e4a223          	sw	a4,100(s1)
     c58:	00040513          	mv	a0,s0
     c5c:	00410613          	add	a2,sp,4
     c60:	00048593          	mv	a1,s1
     c64:	549050ef          	jal	69ac <__sfvwrite_r>
     c68:	0644a783          	lw	a5,100(s1)
     c6c:	00153413          	seqz	s0,a0
     c70:	40800433          	neg	s0,s0
     c74:	00b47413          	and	s0,s0,11
     c78:	0017f793          	and	a5,a5,1
     c7c:	fff40413          	add	s0,s0,-1
     c80:	00079863          	bnez	a5,c90 <_puts_r+0xd8>
     c84:	00c4d783          	lhu	a5,12(s1)
     c88:	2007f793          	and	a5,a5,512
     c8c:	00078e63          	beqz	a5,ca8 <_puts_r+0xf0>
     c90:	02c12083          	lw	ra,44(sp)
     c94:	00040513          	mv	a0,s0
     c98:	02812403          	lw	s0,40(sp)
     c9c:	02412483          	lw	s1,36(sp)
     ca0:	03010113          	add	sp,sp,48
     ca4:	00008067          	ret
     ca8:	0584a503          	lw	a0,88(s1)
     cac:	054000ef          	jal	d00 <__retarget_lock_release_recursive>
     cb0:	02c12083          	lw	ra,44(sp)
     cb4:	00040513          	mv	a0,s0
     cb8:	02812403          	lw	s0,40(sp)
     cbc:	02412483          	lw	s1,36(sp)
     cc0:	03010113          	add	sp,sp,48
     cc4:	00008067          	ret
     cc8:	0584a503          	lw	a0,88(s1)
     ccc:	030000ef          	jal	cfc <__retarget_lock_acquire_recursive>
     cd0:	00c49783          	lh	a5,12(s1)
     cd4:	f5dff06f          	j	c30 <_puts_r+0x78>
     cd8:	00040513          	mv	a0,s0
     cdc:	449050ef          	jal	6924 <__sinit>
     ce0:	f39ff06f          	j	c18 <_puts_r+0x60>

00000ce4 <puts>:
     ce4:	00050593          	mv	a1,a0
     ce8:	80000517          	auipc	a0,0x80000
     cec:	a2052503          	lw	a0,-1504(a0) # 80000708 <_impure_ptr>
     cf0:	ec9ff06f          	j	bb8 <_puts_r>

00000cf4 <__retarget_lock_init_recursive>:
     cf4:	00008067          	ret

00000cf8 <__retarget_lock_close_recursive>:
     cf8:	00008067          	ret

00000cfc <__retarget_lock_acquire_recursive>:
     cfc:	00008067          	ret

00000d00 <__retarget_lock_release_recursive>:
     d00:	00008067          	ret

00000d04 <memset>:
     d04:	00f00313          	li	t1,15
     d08:	00050713          	mv	a4,a0
     d0c:	02c37e63          	bgeu	t1,a2,d48 <memset+0x44>
     d10:	00f77793          	and	a5,a4,15
     d14:	0a079063          	bnez	a5,db4 <memset+0xb0>
     d18:	08059263          	bnez	a1,d9c <memset+0x98>
     d1c:	ff067693          	and	a3,a2,-16
     d20:	00f67613          	and	a2,a2,15
     d24:	00e686b3          	add	a3,a3,a4
     d28:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     d2c:	00b72223          	sw	a1,4(a4)
     d30:	00b72423          	sw	a1,8(a4)
     d34:	00b72623          	sw	a1,12(a4)
     d38:	01070713          	add	a4,a4,16
     d3c:	fed766e3          	bltu	a4,a3,d28 <memset+0x24>
     d40:	00061463          	bnez	a2,d48 <memset+0x44>
     d44:	00008067          	ret
     d48:	40c306b3          	sub	a3,t1,a2
     d4c:	00269693          	sll	a3,a3,0x2
     d50:	00000297          	auipc	t0,0x0
     d54:	005686b3          	add	a3,a3,t0
     d58:	00c68067          	jr	12(a3)
     d5c:	00b70723          	sb	a1,14(a4)
     d60:	00b706a3          	sb	a1,13(a4)
     d64:	00b70623          	sb	a1,12(a4)
     d68:	00b705a3          	sb	a1,11(a4)
     d6c:	00b70523          	sb	a1,10(a4)
     d70:	00b704a3          	sb	a1,9(a4)
     d74:	00b70423          	sb	a1,8(a4)
     d78:	00b703a3          	sb	a1,7(a4)
     d7c:	00b70323          	sb	a1,6(a4)
     d80:	00b702a3          	sb	a1,5(a4)
     d84:	00b70223          	sb	a1,4(a4)
     d88:	00b701a3          	sb	a1,3(a4)
     d8c:	00b70123          	sb	a1,2(a4)
     d90:	00b700a3          	sb	a1,1(a4)
     d94:	00b70023          	sb	a1,0(a4)
     d98:	00008067          	ret
     d9c:	0ff5f593          	zext.b	a1,a1
     da0:	00859693          	sll	a3,a1,0x8
     da4:	00d5e5b3          	or	a1,a1,a3
     da8:	01059693          	sll	a3,a1,0x10
     dac:	00d5e5b3          	or	a1,a1,a3
     db0:	f6dff06f          	j	d1c <memset+0x18>
     db4:	00279693          	sll	a3,a5,0x2
     db8:	00000297          	auipc	t0,0x0
     dbc:	005686b3          	add	a3,a3,t0
     dc0:	00008293          	mv	t0,ra
     dc4:	fa0680e7          	jalr	-96(a3)
     dc8:	00028093          	mv	ra,t0
     dcc:	ff078793          	add	a5,a5,-16 # 1fffff0 <__neorv32_ram_size+0x1f7fff0>
     dd0:	40f70733          	sub	a4,a4,a5
     dd4:	00f60633          	add	a2,a2,a5
     dd8:	f6c378e3          	bgeu	t1,a2,d48 <memset+0x44>
     ddc:	f3dff06f          	j	d18 <memset+0x14>

00000de0 <memcpy>:
     de0:	00a5c7b3          	xor	a5,a1,a0
     de4:	0037f793          	and	a5,a5,3
     de8:	00c508b3          	add	a7,a0,a2
     dec:	06079463          	bnez	a5,e54 <memcpy+0x74>
     df0:	00300793          	li	a5,3
     df4:	06c7f063          	bgeu	a5,a2,e54 <memcpy+0x74>
     df8:	00357793          	and	a5,a0,3
     dfc:	00050713          	mv	a4,a0
     e00:	06079a63          	bnez	a5,e74 <memcpy+0x94>
     e04:	ffc8f613          	and	a2,a7,-4
     e08:	40e606b3          	sub	a3,a2,a4
     e0c:	02000793          	li	a5,32
     e10:	08d7ce63          	blt	a5,a3,eac <memcpy+0xcc>
     e14:	00058693          	mv	a3,a1
     e18:	00070793          	mv	a5,a4
     e1c:	02c77863          	bgeu	a4,a2,e4c <memcpy+0x6c>
     e20:	0006a803          	lw	a6,0(a3)
     e24:	00478793          	add	a5,a5,4
     e28:	00468693          	add	a3,a3,4
     e2c:	ff07ae23          	sw	a6,-4(a5)
     e30:	fec7e8e3          	bltu	a5,a2,e20 <memcpy+0x40>
     e34:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x3a7>
     e38:	40e787b3          	sub	a5,a5,a4
     e3c:	ffc7f793          	and	a5,a5,-4
     e40:	00478793          	add	a5,a5,4
     e44:	00f70733          	add	a4,a4,a5
     e48:	00f585b3          	add	a1,a1,a5
     e4c:	01176863          	bltu	a4,a7,e5c <memcpy+0x7c>
     e50:	00008067          	ret
     e54:	00050713          	mv	a4,a0
     e58:	05157863          	bgeu	a0,a7,ea8 <memcpy+0xc8>
     e5c:	0005c783          	lbu	a5,0(a1)
     e60:	00170713          	add	a4,a4,1
     e64:	00158593          	add	a1,a1,1
     e68:	fef70fa3          	sb	a5,-1(a4)
     e6c:	fee898e3          	bne	a7,a4,e5c <memcpy+0x7c>
     e70:	00008067          	ret
     e74:	0005c683          	lbu	a3,0(a1)
     e78:	00170713          	add	a4,a4,1
     e7c:	00377793          	and	a5,a4,3
     e80:	fed70fa3          	sb	a3,-1(a4)
     e84:	00158593          	add	a1,a1,1
     e88:	f6078ee3          	beqz	a5,e04 <memcpy+0x24>
     e8c:	0005c683          	lbu	a3,0(a1)
     e90:	00170713          	add	a4,a4,1
     e94:	00377793          	and	a5,a4,3
     e98:	fed70fa3          	sb	a3,-1(a4)
     e9c:	00158593          	add	a1,a1,1
     ea0:	fc079ae3          	bnez	a5,e74 <memcpy+0x94>
     ea4:	f61ff06f          	j	e04 <memcpy+0x24>
     ea8:	00008067          	ret
     eac:	ff010113          	add	sp,sp,-16
     eb0:	00812623          	sw	s0,12(sp)
     eb4:	02000413          	li	s0,32
     eb8:	0005a383          	lw	t2,0(a1)
     ebc:	0045a283          	lw	t0,4(a1)
     ec0:	0085af83          	lw	t6,8(a1)
     ec4:	00c5af03          	lw	t5,12(a1)
     ec8:	0105ae83          	lw	t4,16(a1)
     ecc:	0145ae03          	lw	t3,20(a1)
     ed0:	0185a303          	lw	t1,24(a1)
     ed4:	01c5a803          	lw	a6,28(a1)
     ed8:	0205a683          	lw	a3,32(a1)
     edc:	02470713          	add	a4,a4,36
     ee0:	40e607b3          	sub	a5,a2,a4
     ee4:	fc772e23          	sw	t2,-36(a4)
     ee8:	fe572023          	sw	t0,-32(a4)
     eec:	fff72223          	sw	t6,-28(a4)
     ef0:	ffe72423          	sw	t5,-24(a4)
     ef4:	ffd72623          	sw	t4,-20(a4)
     ef8:	ffc72823          	sw	t3,-16(a4)
     efc:	fe672a23          	sw	t1,-12(a4)
     f00:	ff072c23          	sw	a6,-8(a4)
     f04:	fed72e23          	sw	a3,-4(a4)
     f08:	02458593          	add	a1,a1,36
     f0c:	faf446e3          	blt	s0,a5,eb8 <memcpy+0xd8>
     f10:	00058693          	mv	a3,a1
     f14:	00070793          	mv	a5,a4
     f18:	02c77863          	bgeu	a4,a2,f48 <memcpy+0x168>
     f1c:	0006a803          	lw	a6,0(a3)
     f20:	00478793          	add	a5,a5,4
     f24:	00468693          	add	a3,a3,4
     f28:	ff07ae23          	sw	a6,-4(a5)
     f2c:	fec7e8e3          	bltu	a5,a2,f1c <memcpy+0x13c>
     f30:	fff60793          	add	a5,a2,-1
     f34:	40e787b3          	sub	a5,a5,a4
     f38:	ffc7f793          	and	a5,a5,-4
     f3c:	00478793          	add	a5,a5,4
     f40:	00f70733          	add	a4,a4,a5
     f44:	00f585b3          	add	a1,a1,a5
     f48:	01176863          	bltu	a4,a7,f58 <memcpy+0x178>
     f4c:	00c12403          	lw	s0,12(sp)
     f50:	01010113          	add	sp,sp,16
     f54:	00008067          	ret
     f58:	0005c783          	lbu	a5,0(a1)
     f5c:	00170713          	add	a4,a4,1
     f60:	00158593          	add	a1,a1,1
     f64:	fef70fa3          	sb	a5,-1(a4)
     f68:	fee882e3          	beq	a7,a4,f4c <memcpy+0x16c>
     f6c:	0005c783          	lbu	a5,0(a1)
     f70:	00170713          	add	a4,a4,1
     f74:	00158593          	add	a1,a1,1
     f78:	fef70fa3          	sb	a5,-1(a4)
     f7c:	fce89ee3          	bne	a7,a4,f58 <memcpy+0x178>
     f80:	fcdff06f          	j	f4c <memcpy+0x16c>

00000f84 <strlen>:
     f84:	00357793          	and	a5,a0,3
     f88:	00050713          	mv	a4,a0
     f8c:	04079c63          	bnez	a5,fe4 <strlen+0x60>
     f90:	7f7f86b7          	lui	a3,0x7f7f8
     f94:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
     f98:	fff00593          	li	a1,-1
     f9c:	00072603          	lw	a2,0(a4)
     fa0:	00470713          	add	a4,a4,4
     fa4:	00d677b3          	and	a5,a2,a3
     fa8:	00d787b3          	add	a5,a5,a3
     fac:	00c7e7b3          	or	a5,a5,a2
     fb0:	00d7e7b3          	or	a5,a5,a3
     fb4:	feb784e3          	beq	a5,a1,f9c <strlen+0x18>
     fb8:	ffc74683          	lbu	a3,-4(a4)
     fbc:	40a707b3          	sub	a5,a4,a0
     fc0:	04068463          	beqz	a3,1008 <strlen+0x84>
     fc4:	ffd74683          	lbu	a3,-3(a4)
     fc8:	02068c63          	beqz	a3,1000 <strlen+0x7c>
     fcc:	ffe74503          	lbu	a0,-2(a4)
     fd0:	00a03533          	snez	a0,a0
     fd4:	00f50533          	add	a0,a0,a5
     fd8:	ffe50513          	add	a0,a0,-2
     fdc:	00008067          	ret
     fe0:	fa0688e3          	beqz	a3,f90 <strlen+0xc>
     fe4:	00074783          	lbu	a5,0(a4)
     fe8:	00170713          	add	a4,a4,1
     fec:	00377693          	and	a3,a4,3
     ff0:	fe0798e3          	bnez	a5,fe0 <strlen+0x5c>
     ff4:	40a70733          	sub	a4,a4,a0
     ff8:	fff70513          	add	a0,a4,-1
     ffc:	00008067          	ret
    1000:	ffd78513          	add	a0,a5,-3
    1004:	00008067          	ret
    1008:	ffc78513          	add	a0,a5,-4
    100c:	00008067          	ret

00001010 <_malloc_trim_r>:
    1010:	fe010113          	add	sp,sp,-32
    1014:	00812c23          	sw	s0,24(sp)
    1018:	00912a23          	sw	s1,20(sp)
    101c:	01212823          	sw	s2,16(sp)
    1020:	01312623          	sw	s3,12(sp)
    1024:	01412423          	sw	s4,8(sp)
    1028:	00058993          	mv	s3,a1
    102c:	00112e23          	sw	ra,28(sp)
    1030:	00050913          	mv	s2,a0
    1034:	7ffffa17          	auipc	s4,0x7ffff
    1038:	0eca0a13          	add	s4,s4,236 # 80000120 <__malloc_av_>
    103c:	405000ef          	jal	1c40 <__malloc_lock>
    1040:	008a2703          	lw	a4,8(s4)
    1044:	000017b7          	lui	a5,0x1
    1048:	fef78793          	add	a5,a5,-17 # fef <strlen+0x6b>
    104c:	00472483          	lw	s1,4(a4)
    1050:	00001737          	lui	a4,0x1
    1054:	ffc4f493          	and	s1,s1,-4
    1058:	00f48433          	add	s0,s1,a5
    105c:	41340433          	sub	s0,s0,s3
    1060:	00c45413          	srl	s0,s0,0xc
    1064:	fff40413          	add	s0,s0,-1
    1068:	00c41413          	sll	s0,s0,0xc
    106c:	00e44e63          	blt	s0,a4,1088 <_malloc_trim_r+0x78>
    1070:	00000593          	li	a1,0
    1074:	00090513          	mv	a0,s2
    1078:	678060ef          	jal	76f0 <_sbrk_r>
    107c:	008a2783          	lw	a5,8(s4)
    1080:	009787b3          	add	a5,a5,s1
    1084:	02f50863          	beq	a0,a5,10b4 <_malloc_trim_r+0xa4>
    1088:	00090513          	mv	a0,s2
    108c:	3c1000ef          	jal	1c4c <__malloc_unlock>
    1090:	01c12083          	lw	ra,28(sp)
    1094:	01812403          	lw	s0,24(sp)
    1098:	01412483          	lw	s1,20(sp)
    109c:	01012903          	lw	s2,16(sp)
    10a0:	00c12983          	lw	s3,12(sp)
    10a4:	00812a03          	lw	s4,8(sp)
    10a8:	00000513          	li	a0,0
    10ac:	02010113          	add	sp,sp,32
    10b0:	00008067          	ret
    10b4:	408005b3          	neg	a1,s0
    10b8:	00090513          	mv	a0,s2
    10bc:	634060ef          	jal	76f0 <_sbrk_r>
    10c0:	fff00793          	li	a5,-1
    10c4:	04f50a63          	beq	a0,a5,1118 <_malloc_trim_r+0x108>
    10c8:	80000717          	auipc	a4,0x80000
    10cc:	eec70713          	add	a4,a4,-276 # 80000fb4 <__malloc_current_mallinfo>
    10d0:	00072783          	lw	a5,0(a4)
    10d4:	008a2683          	lw	a3,8(s4)
    10d8:	408484b3          	sub	s1,s1,s0
    10dc:	0014e493          	or	s1,s1,1
    10e0:	408787b3          	sub	a5,a5,s0
    10e4:	00090513          	mv	a0,s2
    10e8:	0096a223          	sw	s1,4(a3)
    10ec:	00f72023          	sw	a5,0(a4)
    10f0:	35d000ef          	jal	1c4c <__malloc_unlock>
    10f4:	01c12083          	lw	ra,28(sp)
    10f8:	01812403          	lw	s0,24(sp)
    10fc:	01412483          	lw	s1,20(sp)
    1100:	01012903          	lw	s2,16(sp)
    1104:	00c12983          	lw	s3,12(sp)
    1108:	00812a03          	lw	s4,8(sp)
    110c:	00100513          	li	a0,1
    1110:	02010113          	add	sp,sp,32
    1114:	00008067          	ret
    1118:	00000593          	li	a1,0
    111c:	00090513          	mv	a0,s2
    1120:	5d0060ef          	jal	76f0 <_sbrk_r>
    1124:	008a2703          	lw	a4,8(s4)
    1128:	00f00693          	li	a3,15
    112c:	40e507b3          	sub	a5,a0,a4
    1130:	f4f6dce3          	bge	a3,a5,1088 <_malloc_trim_r+0x78>
    1134:	7ffff697          	auipc	a3,0x7ffff
    1138:	5d86a683          	lw	a3,1496(a3) # 8000070c <__malloc_sbrk_base>
    113c:	40d50533          	sub	a0,a0,a3
    1140:	0017e793          	or	a5,a5,1
    1144:	80000697          	auipc	a3,0x80000
    1148:	e6a6a823          	sw	a0,-400(a3) # 80000fb4 <__malloc_current_mallinfo>
    114c:	00f72223          	sw	a5,4(a4)
    1150:	f39ff06f          	j	1088 <_malloc_trim_r+0x78>

00001154 <_free_r>:
    1154:	18058263          	beqz	a1,12d8 <_free_r+0x184>
    1158:	ff010113          	add	sp,sp,-16
    115c:	00812423          	sw	s0,8(sp)
    1160:	00912223          	sw	s1,4(sp)
    1164:	00058413          	mv	s0,a1
    1168:	00050493          	mv	s1,a0
    116c:	00112623          	sw	ra,12(sp)
    1170:	2d1000ef          	jal	1c40 <__malloc_lock>
    1174:	ffc42583          	lw	a1,-4(s0)
    1178:	ff840713          	add	a4,s0,-8
    117c:	7ffff517          	auipc	a0,0x7ffff
    1180:	fa450513          	add	a0,a0,-92 # 80000120 <__malloc_av_>
    1184:	ffe5f793          	and	a5,a1,-2
    1188:	00f70633          	add	a2,a4,a5
    118c:	00462683          	lw	a3,4(a2)
    1190:	00852803          	lw	a6,8(a0)
    1194:	ffc6f693          	and	a3,a3,-4
    1198:	1ac80263          	beq	a6,a2,133c <_free_r+0x1e8>
    119c:	00d62223          	sw	a3,4(a2)
    11a0:	0015f593          	and	a1,a1,1
    11a4:	00d60833          	add	a6,a2,a3
    11a8:	0a059063          	bnez	a1,1248 <_free_r+0xf4>
    11ac:	ff842303          	lw	t1,-8(s0)
    11b0:	00482583          	lw	a1,4(a6)
    11b4:	7ffff897          	auipc	a7,0x7ffff
    11b8:	f7488893          	add	a7,a7,-140 # 80000128 <__malloc_av_+0x8>
    11bc:	40670733          	sub	a4,a4,t1
    11c0:	00872803          	lw	a6,8(a4)
    11c4:	006787b3          	add	a5,a5,t1
    11c8:	0015f593          	and	a1,a1,1
    11cc:	15180263          	beq	a6,a7,1310 <_free_r+0x1bc>
    11d0:	00c72303          	lw	t1,12(a4)
    11d4:	00682623          	sw	t1,12(a6)
    11d8:	01032423          	sw	a6,8(t1)
    11dc:	1a058a63          	beqz	a1,1390 <_free_r+0x23c>
    11e0:	0017e693          	or	a3,a5,1
    11e4:	00d72223          	sw	a3,4(a4)
    11e8:	00f62023          	sw	a5,0(a2)
    11ec:	1ff00693          	li	a3,511
    11f0:	06f6ec63          	bltu	a3,a5,1268 <_free_r+0x114>
    11f4:	ff87f693          	and	a3,a5,-8
    11f8:	00868693          	add	a3,a3,8
    11fc:	00452583          	lw	a1,4(a0)
    1200:	00d506b3          	add	a3,a0,a3
    1204:	0006a603          	lw	a2,0(a3)
    1208:	0057d813          	srl	a6,a5,0x5
    120c:	00100793          	li	a5,1
    1210:	010797b3          	sll	a5,a5,a6
    1214:	00b7e7b3          	or	a5,a5,a1
    1218:	ff868593          	add	a1,a3,-8
    121c:	00b72623          	sw	a1,12(a4)
    1220:	00c72423          	sw	a2,8(a4)
    1224:	00f52223          	sw	a5,4(a0)
    1228:	00e6a023          	sw	a4,0(a3)
    122c:	00e62623          	sw	a4,12(a2)
    1230:	00812403          	lw	s0,8(sp)
    1234:	00c12083          	lw	ra,12(sp)
    1238:	00048513          	mv	a0,s1
    123c:	00412483          	lw	s1,4(sp)
    1240:	01010113          	add	sp,sp,16
    1244:	2090006f          	j	1c4c <__malloc_unlock>
    1248:	00482583          	lw	a1,4(a6)
    124c:	0015f593          	and	a1,a1,1
    1250:	08058663          	beqz	a1,12dc <_free_r+0x188>
    1254:	0017e693          	or	a3,a5,1
    1258:	fed42e23          	sw	a3,-4(s0)
    125c:	00f62023          	sw	a5,0(a2)
    1260:	1ff00693          	li	a3,511
    1264:	f8f6f8e3          	bgeu	a3,a5,11f4 <_free_r+0xa0>
    1268:	0097d693          	srl	a3,a5,0x9
    126c:	00400613          	li	a2,4
    1270:	12d66463          	bltu	a2,a3,1398 <_free_r+0x244>
    1274:	0067d693          	srl	a3,a5,0x6
    1278:	03968593          	add	a1,a3,57
    127c:	03868613          	add	a2,a3,56
    1280:	00359593          	sll	a1,a1,0x3
    1284:	00b505b3          	add	a1,a0,a1
    1288:	0005a683          	lw	a3,0(a1)
    128c:	ff858593          	add	a1,a1,-8
    1290:	00d59863          	bne	a1,a3,12a0 <_free_r+0x14c>
    1294:	15c0006f          	j	13f0 <_free_r+0x29c>
    1298:	0086a683          	lw	a3,8(a3)
    129c:	00d58863          	beq	a1,a3,12ac <_free_r+0x158>
    12a0:	0046a603          	lw	a2,4(a3)
    12a4:	ffc67613          	and	a2,a2,-4
    12a8:	fec7e8e3          	bltu	a5,a2,1298 <_free_r+0x144>
    12ac:	00c6a583          	lw	a1,12(a3)
    12b0:	00b72623          	sw	a1,12(a4)
    12b4:	00d72423          	sw	a3,8(a4)
    12b8:	00812403          	lw	s0,8(sp)
    12bc:	00c12083          	lw	ra,12(sp)
    12c0:	00e5a423          	sw	a4,8(a1)
    12c4:	00048513          	mv	a0,s1
    12c8:	00412483          	lw	s1,4(sp)
    12cc:	00e6a623          	sw	a4,12(a3)
    12d0:	01010113          	add	sp,sp,16
    12d4:	1790006f          	j	1c4c <__malloc_unlock>
    12d8:	00008067          	ret
    12dc:	00d787b3          	add	a5,a5,a3
    12e0:	7ffff897          	auipc	a7,0x7ffff
    12e4:	e4888893          	add	a7,a7,-440 # 80000128 <__malloc_av_+0x8>
    12e8:	00862683          	lw	a3,8(a2)
    12ec:	0f168063          	beq	a3,a7,13cc <_free_r+0x278>
    12f0:	00c62803          	lw	a6,12(a2)
    12f4:	0017e593          	or	a1,a5,1
    12f8:	00f70633          	add	a2,a4,a5
    12fc:	0106a623          	sw	a6,12(a3)
    1300:	00d82423          	sw	a3,8(a6)
    1304:	00b72223          	sw	a1,4(a4)
    1308:	00f62023          	sw	a5,0(a2)
    130c:	ee1ff06f          	j	11ec <_free_r+0x98>
    1310:	14059063          	bnez	a1,1450 <_free_r+0x2fc>
    1314:	00862583          	lw	a1,8(a2)
    1318:	00c62603          	lw	a2,12(a2)
    131c:	00f686b3          	add	a3,a3,a5
    1320:	0016e793          	or	a5,a3,1
    1324:	00c5a623          	sw	a2,12(a1)
    1328:	00b62423          	sw	a1,8(a2)
    132c:	00f72223          	sw	a5,4(a4)
    1330:	00d70733          	add	a4,a4,a3
    1334:	00d72023          	sw	a3,0(a4)
    1338:	ef9ff06f          	j	1230 <_free_r+0xdc>
    133c:	0015f593          	and	a1,a1,1
    1340:	00d786b3          	add	a3,a5,a3
    1344:	02059063          	bnez	a1,1364 <_free_r+0x210>
    1348:	ff842583          	lw	a1,-8(s0)
    134c:	40b70733          	sub	a4,a4,a1
    1350:	00c72783          	lw	a5,12(a4)
    1354:	00872603          	lw	a2,8(a4)
    1358:	00b686b3          	add	a3,a3,a1
    135c:	00f62623          	sw	a5,12(a2)
    1360:	00c7a423          	sw	a2,8(a5)
    1364:	0016e793          	or	a5,a3,1
    1368:	00f72223          	sw	a5,4(a4)
    136c:	00e52423          	sw	a4,8(a0)
    1370:	7ffff797          	auipc	a5,0x7ffff
    1374:	3a07a783          	lw	a5,928(a5) # 80000710 <__malloc_trim_threshold>
    1378:	eaf6ece3          	bltu	a3,a5,1230 <_free_r+0xdc>
    137c:	7ffff597          	auipc	a1,0x7ffff
    1380:	3b05a583          	lw	a1,944(a1) # 8000072c <__malloc_top_pad>
    1384:	00048513          	mv	a0,s1
    1388:	c89ff0ef          	jal	1010 <_malloc_trim_r>
    138c:	ea5ff06f          	j	1230 <_free_r+0xdc>
    1390:	00d787b3          	add	a5,a5,a3
    1394:	f55ff06f          	j	12e8 <_free_r+0x194>
    1398:	01400613          	li	a2,20
    139c:	02d67063          	bgeu	a2,a3,13bc <_free_r+0x268>
    13a0:	05400613          	li	a2,84
    13a4:	06d66463          	bltu	a2,a3,140c <_free_r+0x2b8>
    13a8:	00c7d693          	srl	a3,a5,0xc
    13ac:	06f68593          	add	a1,a3,111
    13b0:	06e68613          	add	a2,a3,110
    13b4:	00359593          	sll	a1,a1,0x3
    13b8:	ecdff06f          	j	1284 <_free_r+0x130>
    13bc:	05c68593          	add	a1,a3,92
    13c0:	05b68613          	add	a2,a3,91
    13c4:	00359593          	sll	a1,a1,0x3
    13c8:	ebdff06f          	j	1284 <_free_r+0x130>
    13cc:	00e52a23          	sw	a4,20(a0)
    13d0:	00e52823          	sw	a4,16(a0)
    13d4:	0017e693          	or	a3,a5,1
    13d8:	01172623          	sw	a7,12(a4)
    13dc:	01172423          	sw	a7,8(a4)
    13e0:	00d72223          	sw	a3,4(a4)
    13e4:	00f70733          	add	a4,a4,a5
    13e8:	00f72023          	sw	a5,0(a4)
    13ec:	e45ff06f          	j	1230 <_free_r+0xdc>
    13f0:	00452803          	lw	a6,4(a0)
    13f4:	40265613          	sra	a2,a2,0x2
    13f8:	00100793          	li	a5,1
    13fc:	00c797b3          	sll	a5,a5,a2
    1400:	0107e7b3          	or	a5,a5,a6
    1404:	00f52223          	sw	a5,4(a0)
    1408:	ea9ff06f          	j	12b0 <_free_r+0x15c>
    140c:	15400613          	li	a2,340
    1410:	00d66c63          	bltu	a2,a3,1428 <_free_r+0x2d4>
    1414:	00f7d693          	srl	a3,a5,0xf
    1418:	07868593          	add	a1,a3,120
    141c:	07768613          	add	a2,a3,119
    1420:	00359593          	sll	a1,a1,0x3
    1424:	e61ff06f          	j	1284 <_free_r+0x130>
    1428:	55400613          	li	a2,1364
    142c:	00d66c63          	bltu	a2,a3,1444 <_free_r+0x2f0>
    1430:	0127d693          	srl	a3,a5,0x12
    1434:	07d68593          	add	a1,a3,125
    1438:	07c68613          	add	a2,a3,124
    143c:	00359593          	sll	a1,a1,0x3
    1440:	e45ff06f          	j	1284 <_free_r+0x130>
    1444:	3f800593          	li	a1,1016
    1448:	07e00613          	li	a2,126
    144c:	e39ff06f          	j	1284 <_free_r+0x130>
    1450:	0017e693          	or	a3,a5,1
    1454:	00d72223          	sw	a3,4(a4)
    1458:	00f62023          	sw	a5,0(a2)
    145c:	dd5ff06f          	j	1230 <_free_r+0xdc>

00001460 <_malloc_r>:
    1460:	fd010113          	add	sp,sp,-48
    1464:	03212023          	sw	s2,32(sp)
    1468:	02112623          	sw	ra,44(sp)
    146c:	02812423          	sw	s0,40(sp)
    1470:	02912223          	sw	s1,36(sp)
    1474:	01312e23          	sw	s3,28(sp)
    1478:	00b58793          	add	a5,a1,11
    147c:	01600713          	li	a4,22
    1480:	00050913          	mv	s2,a0
    1484:	08f76263          	bltu	a4,a5,1508 <_malloc_r+0xa8>
    1488:	01000793          	li	a5,16
    148c:	20b7e663          	bltu	a5,a1,1698 <_malloc_r+0x238>
    1490:	7b0000ef          	jal	1c40 <__malloc_lock>
    1494:	01800793          	li	a5,24
    1498:	00200593          	li	a1,2
    149c:	01000493          	li	s1,16
    14a0:	7ffff997          	auipc	s3,0x7ffff
    14a4:	c8098993          	add	s3,s3,-896 # 80000120 <__malloc_av_>
    14a8:	00f987b3          	add	a5,s3,a5
    14ac:	0047a403          	lw	s0,4(a5)
    14b0:	ff878713          	add	a4,a5,-8
    14b4:	36e40463          	beq	s0,a4,181c <_malloc_r+0x3bc>
    14b8:	00442783          	lw	a5,4(s0)
    14bc:	00c42683          	lw	a3,12(s0)
    14c0:	00842603          	lw	a2,8(s0)
    14c4:	ffc7f793          	and	a5,a5,-4
    14c8:	00f407b3          	add	a5,s0,a5
    14cc:	0047a703          	lw	a4,4(a5)
    14d0:	00d62623          	sw	a3,12(a2)
    14d4:	00c6a423          	sw	a2,8(a3)
    14d8:	00176713          	or	a4,a4,1
    14dc:	00090513          	mv	a0,s2
    14e0:	00e7a223          	sw	a4,4(a5)
    14e4:	768000ef          	jal	1c4c <__malloc_unlock>
    14e8:	00840513          	add	a0,s0,8
    14ec:	02c12083          	lw	ra,44(sp)
    14f0:	02812403          	lw	s0,40(sp)
    14f4:	02412483          	lw	s1,36(sp)
    14f8:	02012903          	lw	s2,32(sp)
    14fc:	01c12983          	lw	s3,28(sp)
    1500:	03010113          	add	sp,sp,48
    1504:	00008067          	ret
    1508:	ff87f493          	and	s1,a5,-8
    150c:	1807c663          	bltz	a5,1698 <_malloc_r+0x238>
    1510:	18b4e463          	bltu	s1,a1,1698 <_malloc_r+0x238>
    1514:	72c000ef          	jal	1c40 <__malloc_lock>
    1518:	1f700793          	li	a5,503
    151c:	4097fa63          	bgeu	a5,s1,1930 <_malloc_r+0x4d0>
    1520:	0094d793          	srl	a5,s1,0x9
    1524:	18078263          	beqz	a5,16a8 <_malloc_r+0x248>
    1528:	00400713          	li	a4,4
    152c:	36f76063          	bltu	a4,a5,188c <_malloc_r+0x42c>
    1530:	0064d793          	srl	a5,s1,0x6
    1534:	03978593          	add	a1,a5,57
    1538:	03878813          	add	a6,a5,56
    153c:	00359613          	sll	a2,a1,0x3
    1540:	7ffff997          	auipc	s3,0x7ffff
    1544:	be098993          	add	s3,s3,-1056 # 80000120 <__malloc_av_>
    1548:	00c98633          	add	a2,s3,a2
    154c:	00462403          	lw	s0,4(a2)
    1550:	ff860613          	add	a2,a2,-8
    1554:	02860863          	beq	a2,s0,1584 <_malloc_r+0x124>
    1558:	00f00513          	li	a0,15
    155c:	0140006f          	j	1570 <_malloc_r+0x110>
    1560:	00c42683          	lw	a3,12(s0)
    1564:	2a075863          	bgez	a4,1814 <_malloc_r+0x3b4>
    1568:	00d60e63          	beq	a2,a3,1584 <_malloc_r+0x124>
    156c:	00068413          	mv	s0,a3
    1570:	00442783          	lw	a5,4(s0)
    1574:	ffc7f793          	and	a5,a5,-4
    1578:	40978733          	sub	a4,a5,s1
    157c:	fee552e3          	bge	a0,a4,1560 <_malloc_r+0x100>
    1580:	00080593          	mv	a1,a6
    1584:	0109a403          	lw	s0,16(s3)
    1588:	7ffff897          	auipc	a7,0x7ffff
    158c:	ba088893          	add	a7,a7,-1120 # 80000128 <__malloc_av_+0x8>
    1590:	27140e63          	beq	s0,a7,180c <_malloc_r+0x3ac>
    1594:	00442783          	lw	a5,4(s0)
    1598:	00f00693          	li	a3,15
    159c:	ffc7f793          	and	a5,a5,-4
    15a0:	40978733          	sub	a4,a5,s1
    15a4:	38e6cc63          	blt	a3,a4,193c <_malloc_r+0x4dc>
    15a8:	0119aa23          	sw	a7,20(s3)
    15ac:	0119a823          	sw	a7,16(s3)
    15b0:	36075063          	bgez	a4,1910 <_malloc_r+0x4b0>
    15b4:	1ff00713          	li	a4,511
    15b8:	0049a503          	lw	a0,4(s3)
    15bc:	26f76863          	bltu	a4,a5,182c <_malloc_r+0x3cc>
    15c0:	ff87f713          	and	a4,a5,-8
    15c4:	00870713          	add	a4,a4,8
    15c8:	00e98733          	add	a4,s3,a4
    15cc:	00072683          	lw	a3,0(a4)
    15d0:	0057d613          	srl	a2,a5,0x5
    15d4:	00100793          	li	a5,1
    15d8:	00c797b3          	sll	a5,a5,a2
    15dc:	00f56533          	or	a0,a0,a5
    15e0:	ff870793          	add	a5,a4,-8
    15e4:	00f42623          	sw	a5,12(s0)
    15e8:	00d42423          	sw	a3,8(s0)
    15ec:	00a9a223          	sw	a0,4(s3)
    15f0:	00872023          	sw	s0,0(a4)
    15f4:	0086a623          	sw	s0,12(a3)
    15f8:	4025d793          	sra	a5,a1,0x2
    15fc:	00100613          	li	a2,1
    1600:	00f61633          	sll	a2,a2,a5
    1604:	0ac56a63          	bltu	a0,a2,16b8 <_malloc_r+0x258>
    1608:	00a677b3          	and	a5,a2,a0
    160c:	02079463          	bnez	a5,1634 <_malloc_r+0x1d4>
    1610:	00161613          	sll	a2,a2,0x1
    1614:	ffc5f593          	and	a1,a1,-4
    1618:	00a677b3          	and	a5,a2,a0
    161c:	00458593          	add	a1,a1,4
    1620:	00079a63          	bnez	a5,1634 <_malloc_r+0x1d4>
    1624:	00161613          	sll	a2,a2,0x1
    1628:	00a677b3          	and	a5,a2,a0
    162c:	00458593          	add	a1,a1,4
    1630:	fe078ae3          	beqz	a5,1624 <_malloc_r+0x1c4>
    1634:	00f00813          	li	a6,15
    1638:	00359313          	sll	t1,a1,0x3
    163c:	00698333          	add	t1,s3,t1
    1640:	00030513          	mv	a0,t1
    1644:	00c52783          	lw	a5,12(a0)
    1648:	00058e13          	mv	t3,a1
    164c:	26f50263          	beq	a0,a5,18b0 <_malloc_r+0x450>
    1650:	0047a703          	lw	a4,4(a5)
    1654:	00078413          	mv	s0,a5
    1658:	00c7a783          	lw	a5,12(a5)
    165c:	ffc77713          	and	a4,a4,-4
    1660:	409706b3          	sub	a3,a4,s1
    1664:	26d84263          	blt	a6,a3,18c8 <_malloc_r+0x468>
    1668:	fe06c2e3          	bltz	a3,164c <_malloc_r+0x1ec>
    166c:	00e40733          	add	a4,s0,a4
    1670:	00472683          	lw	a3,4(a4)
    1674:	00842603          	lw	a2,8(s0)
    1678:	00090513          	mv	a0,s2
    167c:	0016e693          	or	a3,a3,1
    1680:	00d72223          	sw	a3,4(a4)
    1684:	00f62623          	sw	a5,12(a2)
    1688:	00c7a423          	sw	a2,8(a5)
    168c:	5c0000ef          	jal	1c4c <__malloc_unlock>
    1690:	00840513          	add	a0,s0,8
    1694:	e59ff06f          	j	14ec <_malloc_r+0x8c>
    1698:	00c00793          	li	a5,12
    169c:	00f92023          	sw	a5,0(s2)
    16a0:	00000513          	li	a0,0
    16a4:	e49ff06f          	j	14ec <_malloc_r+0x8c>
    16a8:	20000613          	li	a2,512
    16ac:	04000593          	li	a1,64
    16b0:	03f00813          	li	a6,63
    16b4:	e8dff06f          	j	1540 <_malloc_r+0xe0>
    16b8:	0089a403          	lw	s0,8(s3)
    16bc:	01612823          	sw	s6,16(sp)
    16c0:	00442783          	lw	a5,4(s0)
    16c4:	ffc7fb13          	and	s6,a5,-4
    16c8:	009b6863          	bltu	s6,s1,16d8 <_malloc_r+0x278>
    16cc:	409b0733          	sub	a4,s6,s1
    16d0:	00f00793          	li	a5,15
    16d4:	0ee7ca63          	blt	a5,a4,17c8 <_malloc_r+0x368>
    16d8:	01912223          	sw	s9,4(sp)
    16dc:	7ffffc97          	auipc	s9,0x7ffff
    16e0:	030c8c93          	add	s9,s9,48 # 8000070c <__malloc_sbrk_base>
    16e4:	000ca703          	lw	a4,0(s9)
    16e8:	01412c23          	sw	s4,24(sp)
    16ec:	01512a23          	sw	s5,20(sp)
    16f0:	01712623          	sw	s7,12(sp)
    16f4:	7ffffa97          	auipc	s5,0x7ffff
    16f8:	038aaa83          	lw	s5,56(s5) # 8000072c <__malloc_top_pad>
    16fc:	fff00793          	li	a5,-1
    1700:	01640a33          	add	s4,s0,s6
    1704:	01548ab3          	add	s5,s1,s5
    1708:	3ef70263          	beq	a4,a5,1aec <_malloc_r+0x68c>
    170c:	000017b7          	lui	a5,0x1
    1710:	00f78793          	add	a5,a5,15 # 100f <strlen+0x8b>
    1714:	00fa8ab3          	add	s5,s5,a5
    1718:	fffff7b7          	lui	a5,0xfffff
    171c:	00fafab3          	and	s5,s5,a5
    1720:	000a8593          	mv	a1,s5
    1724:	00090513          	mv	a0,s2
    1728:	7c9050ef          	jal	76f0 <_sbrk_r>
    172c:	fff00793          	li	a5,-1
    1730:	00050b93          	mv	s7,a0
    1734:	46f50663          	beq	a0,a5,1ba0 <_malloc_r+0x740>
    1738:	01812423          	sw	s8,8(sp)
    173c:	25456863          	bltu	a0,s4,198c <_malloc_r+0x52c>
    1740:	80000c17          	auipc	s8,0x80000
    1744:	874c0c13          	add	s8,s8,-1932 # 80000fb4 <__malloc_current_mallinfo>
    1748:	000c2583          	lw	a1,0(s8)
    174c:	00ba85b3          	add	a1,s5,a1
    1750:	00bc2023          	sw	a1,0(s8)
    1754:	00058713          	mv	a4,a1
    1758:	2caa1063          	bne	s4,a0,1a18 <_malloc_r+0x5b8>
    175c:	01451793          	sll	a5,a0,0x14
    1760:	2a079c63          	bnez	a5,1a18 <_malloc_r+0x5b8>
    1764:	0089ab83          	lw	s7,8(s3)
    1768:	015b07b3          	add	a5,s6,s5
    176c:	0017e793          	or	a5,a5,1
    1770:	00fba223          	sw	a5,4(s7)
    1774:	7ffff717          	auipc	a4,0x7ffff
    1778:	fb470713          	add	a4,a4,-76 # 80000728 <__malloc_max_sbrked_mem>
    177c:	00072683          	lw	a3,0(a4)
    1780:	00b6f463          	bgeu	a3,a1,1788 <_malloc_r+0x328>
    1784:	00b72023          	sw	a1,0(a4)
    1788:	7ffff717          	auipc	a4,0x7ffff
    178c:	f9c70713          	add	a4,a4,-100 # 80000724 <__malloc_max_total_mem>
    1790:	00072683          	lw	a3,0(a4)
    1794:	00b6f463          	bgeu	a3,a1,179c <_malloc_r+0x33c>
    1798:	00b72023          	sw	a1,0(a4)
    179c:	00812c03          	lw	s8,8(sp)
    17a0:	000b8413          	mv	s0,s7
    17a4:	ffc7f793          	and	a5,a5,-4
    17a8:	40978733          	sub	a4,a5,s1
    17ac:	3897ec63          	bltu	a5,s1,1b44 <_malloc_r+0x6e4>
    17b0:	00f00793          	li	a5,15
    17b4:	38e7d863          	bge	a5,a4,1b44 <_malloc_r+0x6e4>
    17b8:	01812a03          	lw	s4,24(sp)
    17bc:	01412a83          	lw	s5,20(sp)
    17c0:	00c12b83          	lw	s7,12(sp)
    17c4:	00412c83          	lw	s9,4(sp)
    17c8:	0014e793          	or	a5,s1,1
    17cc:	00f42223          	sw	a5,4(s0)
    17d0:	009404b3          	add	s1,s0,s1
    17d4:	0099a423          	sw	s1,8(s3)
    17d8:	00176713          	or	a4,a4,1
    17dc:	00090513          	mv	a0,s2
    17e0:	00e4a223          	sw	a4,4(s1)
    17e4:	468000ef          	jal	1c4c <__malloc_unlock>
    17e8:	02c12083          	lw	ra,44(sp)
    17ec:	00840513          	add	a0,s0,8
    17f0:	02812403          	lw	s0,40(sp)
    17f4:	01012b03          	lw	s6,16(sp)
    17f8:	02412483          	lw	s1,36(sp)
    17fc:	02012903          	lw	s2,32(sp)
    1800:	01c12983          	lw	s3,28(sp)
    1804:	03010113          	add	sp,sp,48
    1808:	00008067          	ret
    180c:	0049a503          	lw	a0,4(s3)
    1810:	de9ff06f          	j	15f8 <_malloc_r+0x198>
    1814:	00842603          	lw	a2,8(s0)
    1818:	cb1ff06f          	j	14c8 <_malloc_r+0x68>
    181c:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1820:	00258593          	add	a1,a1,2
    1824:	d68780e3          	beq	a5,s0,1584 <_malloc_r+0x124>
    1828:	c91ff06f          	j	14b8 <_malloc_r+0x58>
    182c:	0097d713          	srl	a4,a5,0x9
    1830:	00400693          	li	a3,4
    1834:	14e6f263          	bgeu	a3,a4,1978 <_malloc_r+0x518>
    1838:	01400693          	li	a3,20
    183c:	32e6e663          	bltu	a3,a4,1b68 <_malloc_r+0x708>
    1840:	05c70613          	add	a2,a4,92
    1844:	05b70693          	add	a3,a4,91
    1848:	00361613          	sll	a2,a2,0x3
    184c:	00c98633          	add	a2,s3,a2
    1850:	00062703          	lw	a4,0(a2)
    1854:	ff860613          	add	a2,a2,-8
    1858:	00e61863          	bne	a2,a4,1868 <_malloc_r+0x408>
    185c:	2980006f          	j	1af4 <_malloc_r+0x694>
    1860:	00872703          	lw	a4,8(a4)
    1864:	00e60863          	beq	a2,a4,1874 <_malloc_r+0x414>
    1868:	00472683          	lw	a3,4(a4)
    186c:	ffc6f693          	and	a3,a3,-4
    1870:	fed7e8e3          	bltu	a5,a3,1860 <_malloc_r+0x400>
    1874:	00c72603          	lw	a2,12(a4)
    1878:	00c42623          	sw	a2,12(s0)
    187c:	00e42423          	sw	a4,8(s0)
    1880:	00862423          	sw	s0,8(a2)
    1884:	00872623          	sw	s0,12(a4)
    1888:	d71ff06f          	j	15f8 <_malloc_r+0x198>
    188c:	01400713          	li	a4,20
    1890:	10f77863          	bgeu	a4,a5,19a0 <_malloc_r+0x540>
    1894:	05400713          	li	a4,84
    1898:	2ef76663          	bltu	a4,a5,1b84 <_malloc_r+0x724>
    189c:	00c4d793          	srl	a5,s1,0xc
    18a0:	06f78593          	add	a1,a5,111
    18a4:	06e78813          	add	a6,a5,110
    18a8:	00359613          	sll	a2,a1,0x3
    18ac:	c95ff06f          	j	1540 <_malloc_r+0xe0>
    18b0:	001e0e13          	add	t3,t3,1
    18b4:	003e7793          	and	a5,t3,3
    18b8:	00850513          	add	a0,a0,8
    18bc:	10078063          	beqz	a5,19bc <_malloc_r+0x55c>
    18c0:	00c52783          	lw	a5,12(a0)
    18c4:	d89ff06f          	j	164c <_malloc_r+0x1ec>
    18c8:	00842603          	lw	a2,8(s0)
    18cc:	0014e593          	or	a1,s1,1
    18d0:	00b42223          	sw	a1,4(s0)
    18d4:	00f62623          	sw	a5,12(a2)
    18d8:	00c7a423          	sw	a2,8(a5)
    18dc:	009404b3          	add	s1,s0,s1
    18e0:	0099aa23          	sw	s1,20(s3)
    18e4:	0099a823          	sw	s1,16(s3)
    18e8:	0016e793          	or	a5,a3,1
    18ec:	0114a623          	sw	a7,12(s1)
    18f0:	0114a423          	sw	a7,8(s1)
    18f4:	00f4a223          	sw	a5,4(s1)
    18f8:	00e40733          	add	a4,s0,a4
    18fc:	00090513          	mv	a0,s2
    1900:	00d72023          	sw	a3,0(a4)
    1904:	348000ef          	jal	1c4c <__malloc_unlock>
    1908:	00840513          	add	a0,s0,8
    190c:	be1ff06f          	j	14ec <_malloc_r+0x8c>
    1910:	00f407b3          	add	a5,s0,a5
    1914:	0047a703          	lw	a4,4(a5)
    1918:	00090513          	mv	a0,s2
    191c:	00176713          	or	a4,a4,1
    1920:	00e7a223          	sw	a4,4(a5)
    1924:	328000ef          	jal	1c4c <__malloc_unlock>
    1928:	00840513          	add	a0,s0,8
    192c:	bc1ff06f          	j	14ec <_malloc_r+0x8c>
    1930:	0034d593          	srl	a1,s1,0x3
    1934:	00848793          	add	a5,s1,8
    1938:	b69ff06f          	j	14a0 <_malloc_r+0x40>
    193c:	0014e693          	or	a3,s1,1
    1940:	00d42223          	sw	a3,4(s0)
    1944:	009404b3          	add	s1,s0,s1
    1948:	0099aa23          	sw	s1,20(s3)
    194c:	0099a823          	sw	s1,16(s3)
    1950:	00176693          	or	a3,a4,1
    1954:	0114a623          	sw	a7,12(s1)
    1958:	0114a423          	sw	a7,8(s1)
    195c:	00d4a223          	sw	a3,4(s1)
    1960:	00f407b3          	add	a5,s0,a5
    1964:	00090513          	mv	a0,s2
    1968:	00e7a023          	sw	a4,0(a5)
    196c:	2e0000ef          	jal	1c4c <__malloc_unlock>
    1970:	00840513          	add	a0,s0,8
    1974:	b79ff06f          	j	14ec <_malloc_r+0x8c>
    1978:	0067d713          	srl	a4,a5,0x6
    197c:	03970613          	add	a2,a4,57
    1980:	03870693          	add	a3,a4,56
    1984:	00361613          	sll	a2,a2,0x3
    1988:	ec5ff06f          	j	184c <_malloc_r+0x3ec>
    198c:	07340c63          	beq	s0,s3,1a04 <_malloc_r+0x5a4>
    1990:	0089a403          	lw	s0,8(s3)
    1994:	00812c03          	lw	s8,8(sp)
    1998:	00442783          	lw	a5,4(s0)
    199c:	e09ff06f          	j	17a4 <_malloc_r+0x344>
    19a0:	05c78593          	add	a1,a5,92
    19a4:	05b78813          	add	a6,a5,91
    19a8:	00359613          	sll	a2,a1,0x3
    19ac:	b95ff06f          	j	1540 <_malloc_r+0xe0>
    19b0:	00832783          	lw	a5,8(t1)
    19b4:	fff58593          	add	a1,a1,-1
    19b8:	28679063          	bne	a5,t1,1c38 <_malloc_r+0x7d8>
    19bc:	0035f793          	and	a5,a1,3
    19c0:	ff830313          	add	t1,t1,-8
    19c4:	fe0796e3          	bnez	a5,19b0 <_malloc_r+0x550>
    19c8:	0049a703          	lw	a4,4(s3)
    19cc:	fff64793          	not	a5,a2
    19d0:	00e7f7b3          	and	a5,a5,a4
    19d4:	00f9a223          	sw	a5,4(s3)
    19d8:	00161613          	sll	a2,a2,0x1
    19dc:	ccc7eee3          	bltu	a5,a2,16b8 <_malloc_r+0x258>
    19e0:	cc060ce3          	beqz	a2,16b8 <_malloc_r+0x258>
    19e4:	00f67733          	and	a4,a2,a5
    19e8:	00071a63          	bnez	a4,19fc <_malloc_r+0x59c>
    19ec:	00161613          	sll	a2,a2,0x1
    19f0:	00f67733          	and	a4,a2,a5
    19f4:	004e0e13          	add	t3,t3,4
    19f8:	fe070ae3          	beqz	a4,19ec <_malloc_r+0x58c>
    19fc:	000e0593          	mv	a1,t3
    1a00:	c39ff06f          	j	1638 <_malloc_r+0x1d8>
    1a04:	7ffffc17          	auipc	s8,0x7ffff
    1a08:	5b0c0c13          	add	s8,s8,1456 # 80000fb4 <__malloc_current_mallinfo>
    1a0c:	000c2703          	lw	a4,0(s8)
    1a10:	00ea8733          	add	a4,s5,a4
    1a14:	00ec2023          	sw	a4,0(s8)
    1a18:	000ca683          	lw	a3,0(s9)
    1a1c:	fff00793          	li	a5,-1
    1a20:	18f68663          	beq	a3,a5,1bac <_malloc_r+0x74c>
    1a24:	414b87b3          	sub	a5,s7,s4
    1a28:	00e787b3          	add	a5,a5,a4
    1a2c:	00fc2023          	sw	a5,0(s8)
    1a30:	007bfc93          	and	s9,s7,7
    1a34:	0c0c8c63          	beqz	s9,1b0c <_malloc_r+0x6ac>
    1a38:	419b8bb3          	sub	s7,s7,s9
    1a3c:	000017b7          	lui	a5,0x1
    1a40:	00878793          	add	a5,a5,8 # 1008 <strlen+0x84>
    1a44:	008b8b93          	add	s7,s7,8
    1a48:	419785b3          	sub	a1,a5,s9
    1a4c:	015b8ab3          	add	s5,s7,s5
    1a50:	415585b3          	sub	a1,a1,s5
    1a54:	01459593          	sll	a1,a1,0x14
    1a58:	0145da13          	srl	s4,a1,0x14
    1a5c:	000a0593          	mv	a1,s4
    1a60:	00090513          	mv	a0,s2
    1a64:	48d050ef          	jal	76f0 <_sbrk_r>
    1a68:	fff00793          	li	a5,-1
    1a6c:	18f50063          	beq	a0,a5,1bec <_malloc_r+0x78c>
    1a70:	41750533          	sub	a0,a0,s7
    1a74:	01450ab3          	add	s5,a0,s4
    1a78:	000c2703          	lw	a4,0(s8)
    1a7c:	0179a423          	sw	s7,8(s3)
    1a80:	001ae793          	or	a5,s5,1
    1a84:	00ea05b3          	add	a1,s4,a4
    1a88:	00bc2023          	sw	a1,0(s8)
    1a8c:	00fba223          	sw	a5,4(s7)
    1a90:	cf3402e3          	beq	s0,s3,1774 <_malloc_r+0x314>
    1a94:	00f00693          	li	a3,15
    1a98:	0b66f063          	bgeu	a3,s6,1b38 <_malloc_r+0x6d8>
    1a9c:	00442703          	lw	a4,4(s0)
    1aa0:	ff4b0793          	add	a5,s6,-12
    1aa4:	ff87f793          	and	a5,a5,-8
    1aa8:	00177713          	and	a4,a4,1
    1aac:	00f76733          	or	a4,a4,a5
    1ab0:	00e42223          	sw	a4,4(s0)
    1ab4:	00500613          	li	a2,5
    1ab8:	00f40733          	add	a4,s0,a5
    1abc:	00c72223          	sw	a2,4(a4)
    1ac0:	00c72423          	sw	a2,8(a4)
    1ac4:	00f6e663          	bltu	a3,a5,1ad0 <_malloc_r+0x670>
    1ac8:	004ba783          	lw	a5,4(s7)
    1acc:	ca9ff06f          	j	1774 <_malloc_r+0x314>
    1ad0:	00840593          	add	a1,s0,8
    1ad4:	00090513          	mv	a0,s2
    1ad8:	e7cff0ef          	jal	1154 <_free_r>
    1adc:	0089ab83          	lw	s7,8(s3)
    1ae0:	000c2583          	lw	a1,0(s8)
    1ae4:	004ba783          	lw	a5,4(s7)
    1ae8:	c8dff06f          	j	1774 <_malloc_r+0x314>
    1aec:	010a8a93          	add	s5,s5,16
    1af0:	c31ff06f          	j	1720 <_malloc_r+0x2c0>
    1af4:	4026d693          	sra	a3,a3,0x2
    1af8:	00100793          	li	a5,1
    1afc:	00d797b3          	sll	a5,a5,a3
    1b00:	00f56533          	or	a0,a0,a5
    1b04:	00a9a223          	sw	a0,4(s3)
    1b08:	d71ff06f          	j	1878 <_malloc_r+0x418>
    1b0c:	015b85b3          	add	a1,s7,s5
    1b10:	40b005b3          	neg	a1,a1
    1b14:	01459593          	sll	a1,a1,0x14
    1b18:	0145da13          	srl	s4,a1,0x14
    1b1c:	000a0593          	mv	a1,s4
    1b20:	00090513          	mv	a0,s2
    1b24:	3cd050ef          	jal	76f0 <_sbrk_r>
    1b28:	fff00793          	li	a5,-1
    1b2c:	f4f512e3          	bne	a0,a5,1a70 <_malloc_r+0x610>
    1b30:	00000a13          	li	s4,0
    1b34:	f45ff06f          	j	1a78 <_malloc_r+0x618>
    1b38:	00812c03          	lw	s8,8(sp)
    1b3c:	00100793          	li	a5,1
    1b40:	00fba223          	sw	a5,4(s7)
    1b44:	00090513          	mv	a0,s2
    1b48:	104000ef          	jal	1c4c <__malloc_unlock>
    1b4c:	00000513          	li	a0,0
    1b50:	01812a03          	lw	s4,24(sp)
    1b54:	01412a83          	lw	s5,20(sp)
    1b58:	01012b03          	lw	s6,16(sp)
    1b5c:	00c12b83          	lw	s7,12(sp)
    1b60:	00412c83          	lw	s9,4(sp)
    1b64:	989ff06f          	j	14ec <_malloc_r+0x8c>
    1b68:	05400693          	li	a3,84
    1b6c:	04e6e463          	bltu	a3,a4,1bb4 <_malloc_r+0x754>
    1b70:	00c7d713          	srl	a4,a5,0xc
    1b74:	06f70613          	add	a2,a4,111
    1b78:	06e70693          	add	a3,a4,110
    1b7c:	00361613          	sll	a2,a2,0x3
    1b80:	ccdff06f          	j	184c <_malloc_r+0x3ec>
    1b84:	15400713          	li	a4,340
    1b88:	04f76463          	bltu	a4,a5,1bd0 <_malloc_r+0x770>
    1b8c:	00f4d793          	srl	a5,s1,0xf
    1b90:	07878593          	add	a1,a5,120
    1b94:	07778813          	add	a6,a5,119
    1b98:	00359613          	sll	a2,a1,0x3
    1b9c:	9a5ff06f          	j	1540 <_malloc_r+0xe0>
    1ba0:	0089a403          	lw	s0,8(s3)
    1ba4:	00442783          	lw	a5,4(s0)
    1ba8:	bfdff06f          	j	17a4 <_malloc_r+0x344>
    1bac:	017ca023          	sw	s7,0(s9)
    1bb0:	e81ff06f          	j	1a30 <_malloc_r+0x5d0>
    1bb4:	15400693          	li	a3,340
    1bb8:	04e6e463          	bltu	a3,a4,1c00 <_malloc_r+0x7a0>
    1bbc:	00f7d713          	srl	a4,a5,0xf
    1bc0:	07870613          	add	a2,a4,120
    1bc4:	07770693          	add	a3,a4,119
    1bc8:	00361613          	sll	a2,a2,0x3
    1bcc:	c81ff06f          	j	184c <_malloc_r+0x3ec>
    1bd0:	55400713          	li	a4,1364
    1bd4:	04f76463          	bltu	a4,a5,1c1c <_malloc_r+0x7bc>
    1bd8:	0124d793          	srl	a5,s1,0x12
    1bdc:	07d78593          	add	a1,a5,125
    1be0:	07c78813          	add	a6,a5,124
    1be4:	00359613          	sll	a2,a1,0x3
    1be8:	959ff06f          	j	1540 <_malloc_r+0xe0>
    1bec:	ff8c8c93          	add	s9,s9,-8
    1bf0:	019a8ab3          	add	s5,s5,s9
    1bf4:	417a8ab3          	sub	s5,s5,s7
    1bf8:	00000a13          	li	s4,0
    1bfc:	e7dff06f          	j	1a78 <_malloc_r+0x618>
    1c00:	55400693          	li	a3,1364
    1c04:	02e6e463          	bltu	a3,a4,1c2c <_malloc_r+0x7cc>
    1c08:	0127d713          	srl	a4,a5,0x12
    1c0c:	07d70613          	add	a2,a4,125
    1c10:	07c70693          	add	a3,a4,124
    1c14:	00361613          	sll	a2,a2,0x3
    1c18:	c35ff06f          	j	184c <_malloc_r+0x3ec>
    1c1c:	3f800613          	li	a2,1016
    1c20:	07f00593          	li	a1,127
    1c24:	07e00813          	li	a6,126
    1c28:	919ff06f          	j	1540 <_malloc_r+0xe0>
    1c2c:	3f800613          	li	a2,1016
    1c30:	07e00693          	li	a3,126
    1c34:	c19ff06f          	j	184c <_malloc_r+0x3ec>
    1c38:	0049a783          	lw	a5,4(s3)
    1c3c:	d9dff06f          	j	19d8 <_malloc_r+0x578>

00001c40 <__malloc_lock>:
    1c40:	7ffff517          	auipc	a0,0x7ffff
    1c44:	adc50513          	add	a0,a0,-1316 # 8000071c <__lock___malloc_recursive_mutex>
    1c48:	8b4ff06f          	j	cfc <__retarget_lock_acquire_recursive>

00001c4c <__malloc_unlock>:
    1c4c:	7ffff517          	auipc	a0,0x7ffff
    1c50:	ad050513          	add	a0,a0,-1328 # 8000071c <__lock___malloc_recursive_mutex>
    1c54:	8acff06f          	j	d00 <__retarget_lock_release_recursive>

00001c58 <_vfprintf_r>:
    1c58:	e7010113          	add	sp,sp,-400
    1c5c:	18112623          	sw	ra,396(sp)
    1c60:	00b12423          	sw	a1,8(sp)
    1c64:	00c12623          	sw	a2,12(sp)
    1c68:	00d12a23          	sw	a3,20(sp)
    1c6c:	17312e23          	sw	s3,380(sp)
    1c70:	18812423          	sw	s0,392(sp)
    1c74:	00050993          	mv	s3,a0
    1c78:	14d050ef          	jal	75c4 <_localeconv_r>
    1c7c:	00052783          	lw	a5,0(a0)
    1c80:	00078513          	mv	a0,a5
    1c84:	02f12a23          	sw	a5,52(sp)
    1c88:	afcff0ef          	jal	f84 <strlen>
    1c8c:	00050713          	mv	a4,a0
    1c90:	00800613          	li	a2,8
    1c94:	00000593          	li	a1,0
    1c98:	09010513          	add	a0,sp,144
    1c9c:	02e12823          	sw	a4,48(sp)
    1ca0:	864ff0ef          	jal	d04 <memset>
    1ca4:	00c12783          	lw	a5,12(sp)
    1ca8:	00098863          	beqz	s3,1cb8 <_vfprintf_r+0x60>
    1cac:	0349a703          	lw	a4,52(s3)
    1cb0:	00071463          	bnez	a4,1cb8 <_vfprintf_r+0x60>
    1cb4:	29d0106f          	j	3750 <_vfprintf_r+0x1af8>
    1cb8:	00812703          	lw	a4,8(sp)
    1cbc:	06472683          	lw	a3,100(a4)
    1cc0:	00c71703          	lh	a4,12(a4)
    1cc4:	0016f693          	and	a3,a3,1
    1cc8:	00069863          	bnez	a3,1cd8 <_vfprintf_r+0x80>
    1ccc:	20077693          	and	a3,a4,512
    1cd0:	00069463          	bnez	a3,1cd8 <_vfprintf_r+0x80>
    1cd4:	3ec0106f          	j	30c0 <_vfprintf_r+0x1468>
    1cd8:	01271693          	sll	a3,a4,0x12
    1cdc:	0206c863          	bltz	a3,1d0c <_vfprintf_r+0xb4>
    1ce0:	00812503          	lw	a0,8(sp)
    1ce4:	000025b7          	lui	a1,0x2
    1ce8:	ffffe637          	lui	a2,0xffffe
    1cec:	06452683          	lw	a3,100(a0)
    1cf0:	00b76733          	or	a4,a4,a1
    1cf4:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1cf8:	01071713          	sll	a4,a4,0x10
    1cfc:	41075713          	sra	a4,a4,0x10
    1d00:	00c6f6b3          	and	a3,a3,a2
    1d04:	00e51623          	sh	a4,12(a0)
    1d08:	06d52223          	sw	a3,100(a0)
    1d0c:	00877693          	and	a3,a4,8
    1d10:	2a068063          	beqz	a3,1fb0 <_vfprintf_r+0x358>
    1d14:	00812683          	lw	a3,8(sp)
    1d18:	0106a683          	lw	a3,16(a3)
    1d1c:	28068a63          	beqz	a3,1fb0 <_vfprintf_r+0x358>
    1d20:	01a77693          	and	a3,a4,26
    1d24:	00a00613          	li	a2,10
    1d28:	2ac68c63          	beq	a3,a2,1fe0 <_vfprintf_r+0x388>
    1d2c:	0ac10713          	add	a4,sp,172
    1d30:	17512a23          	sw	s5,372(sp)
    1d34:	17812423          	sw	s8,360(sp)
    1d38:	15b12e23          	sw	s11,348(sp)
    1d3c:	18912223          	sw	s1,388(sp)
    1d40:	19212023          	sw	s2,384(sp)
    1d44:	17412c23          	sw	s4,376(sp)
    1d48:	17612823          	sw	s6,368(sp)
    1d4c:	17712623          	sw	s7,364(sp)
    1d50:	17912223          	sw	s9,356(sp)
    1d54:	17a12023          	sw	s10,352(sp)
    1d58:	0ae12023          	sw	a4,160(sp)
    1d5c:	0a012423          	sw	zero,168(sp)
    1d60:	0a012223          	sw	zero,164(sp)
    1d64:	00012c23          	sw	zero,24(sp)
    1d68:	02012423          	sw	zero,40(sp)
    1d6c:	02012623          	sw	zero,44(sp)
    1d70:	00070413          	mv	s0,a4
    1d74:	02012c23          	sw	zero,56(sp)
    1d78:	04012023          	sw	zero,64(sp)
    1d7c:	02012e23          	sw	zero,60(sp)
    1d80:	04012623          	sw	zero,76(sp)
    1d84:	04012423          	sw	zero,72(sp)
    1d88:	00012623          	sw	zero,12(sp)
    1d8c:	7fffea97          	auipc	s5,0x7fffe
    1d90:	7a8a8a93          	add	s5,s5,1960 # 80000534 <__global_locale>
    1d94:	02500d93          	li	s11,37
    1d98:	00078c13          	mv	s8,a5
    1d9c:	000c0913          	mv	s2,s8
    1da0:	0e4aa483          	lw	s1,228(s5)
    1da4:	015050ef          	jal	75b8 <__locale_mb_cur_max>
    1da8:	00050693          	mv	a3,a0
    1dac:	09010713          	add	a4,sp,144
    1db0:	00090613          	mv	a2,s2
    1db4:	08010593          	add	a1,sp,128
    1db8:	00098513          	mv	a0,s3
    1dbc:	000480e7          	jalr	s1
    1dc0:	2c050a63          	beqz	a0,2094 <_vfprintf_r+0x43c>
    1dc4:	2a054a63          	bltz	a0,2078 <_vfprintf_r+0x420>
    1dc8:	08012783          	lw	a5,128(sp)
    1dcc:	01b78663          	beq	a5,s11,1dd8 <_vfprintf_r+0x180>
    1dd0:	00a90933          	add	s2,s2,a0
    1dd4:	fcdff06f          	j	1da0 <_vfprintf_r+0x148>
    1dd8:	00050493          	mv	s1,a0
    1ddc:	41890cb3          	sub	s9,s2,s8
    1de0:	2d891063          	bne	s2,s8,20a0 <_vfprintf_r+0x448>
    1de4:	fff00313          	li	t1,-1
    1de8:	00000e93          	li	t4,0
    1dec:	00194e03          	lbu	t3,1(s2)
    1df0:	06010ba3          	sb	zero,119(sp)
    1df4:	00190913          	add	s2,s2,1
    1df8:	00000b93          	li	s7,0
    1dfc:	05a00493          	li	s1,90
    1e00:	000e8a13          	mv	s4,t4
    1e04:	00030b13          	mv	s6,t1
    1e08:	00190913          	add	s2,s2,1
    1e0c:	fe0e0793          	add	a5,t3,-32
    1e10:	04f4ea63          	bltu	s1,a5,1e64 <_vfprintf_r+0x20c>
    1e14:	0000d717          	auipc	a4,0xd
    1e18:	2e870713          	add	a4,a4,744 # f0fc <_ctype_+0x104>
    1e1c:	00279793          	sll	a5,a5,0x2
    1e20:	00e787b3          	add	a5,a5,a4
    1e24:	0007a783          	lw	a5,0(a5)
    1e28:	00e787b3          	add	a5,a5,a4
    1e2c:	00078067          	jr	a5
    1e30:	00000b93          	li	s7,0
    1e34:	fd0e0713          	add	a4,t3,-48
    1e38:	00900693          	li	a3,9
    1e3c:	00094e03          	lbu	t3,0(s2)
    1e40:	002b9793          	sll	a5,s7,0x2
    1e44:	017787b3          	add	a5,a5,s7
    1e48:	00179793          	sll	a5,a5,0x1
    1e4c:	00f70bb3          	add	s7,a4,a5
    1e50:	fd0e0713          	add	a4,t3,-48
    1e54:	00190913          	add	s2,s2,1
    1e58:	fee6f2e3          	bgeu	a3,a4,1e3c <_vfprintf_r+0x1e4>
    1e5c:	fe0e0793          	add	a5,t3,-32
    1e60:	faf4fae3          	bgeu	s1,a5,1e14 <_vfprintf_r+0x1bc>
    1e64:	000a0e93          	mv	t4,s4
    1e68:	260e0a63          	beqz	t3,20dc <_vfprintf_r+0x484>
    1e6c:	0fc10623          	sb	t3,236(sp)
    1e70:	06010ba3          	sb	zero,119(sp)
    1e74:	00100c93          	li	s9,1
    1e78:	00000613          	li	a2,0
    1e7c:	00012823          	sw	zero,16(sp)
    1e80:	00100d13          	li	s10,1
    1e84:	00000313          	li	t1,0
    1e88:	02012223          	sw	zero,36(sp)
    1e8c:	02012023          	sw	zero,32(sp)
    1e90:	00000a13          	li	s4,0
    1e94:	0ec10c13          	add	s8,sp,236
    1e98:	002ef293          	and	t0,t4,2
    1e9c:	00028463          	beqz	t0,1ea4 <_vfprintf_r+0x24c>
    1ea0:	002c8c93          	add	s9,s9,2
    1ea4:	084eff93          	and	t6,t4,132
    1ea8:	0a812483          	lw	s1,168(sp)
    1eac:	000f9663          	bnez	t6,1eb8 <_vfprintf_r+0x260>
    1eb0:	419b8733          	sub	a4,s7,s9
    1eb4:	40e04663          	bgtz	a4,22c0 <_vfprintf_r+0x668>
    1eb8:	02060a63          	beqz	a2,1eec <_vfprintf_r+0x294>
    1ebc:	0a412703          	lw	a4,164(sp)
    1ec0:	07710613          	add	a2,sp,119
    1ec4:	00148493          	add	s1,s1,1
    1ec8:	00170713          	add	a4,a4,1
    1ecc:	00100793          	li	a5,1
    1ed0:	00c42023          	sw	a2,0(s0)
    1ed4:	00f42223          	sw	a5,4(s0)
    1ed8:	0a912423          	sw	s1,168(sp)
    1edc:	0ae12223          	sw	a4,164(sp)
    1ee0:	00700613          	li	a2,7
    1ee4:	00840413          	add	s0,s0,8
    1ee8:	4ce64863          	blt	a2,a4,23b8 <_vfprintf_r+0x760>
    1eec:	02028a63          	beqz	t0,1f20 <_vfprintf_r+0x2c8>
    1ef0:	0a412703          	lw	a4,164(sp)
    1ef4:	07810613          	add	a2,sp,120
    1ef8:	00c42023          	sw	a2,0(s0)
    1efc:	00248493          	add	s1,s1,2
    1f00:	00200613          	li	a2,2
    1f04:	00170713          	add	a4,a4,1
    1f08:	00c42223          	sw	a2,4(s0)
    1f0c:	0a912423          	sw	s1,168(sp)
    1f10:	0ae12223          	sw	a4,164(sp)
    1f14:	00700613          	li	a2,7
    1f18:	00840413          	add	s0,s0,8
    1f1c:	5ce644e3          	blt	a2,a4,2ce4 <_vfprintf_r+0x108c>
    1f20:	08000713          	li	a4,128
    1f24:	3aef80e3          	beq	t6,a4,2ac4 <_vfprintf_r+0xe6c>
    1f28:	41a30b33          	sub	s6,t1,s10
    1f2c:	4b604ae3          	bgtz	s6,2be0 <_vfprintf_r+0xf88>
    1f30:	100ef713          	and	a4,t4,256
    1f34:	1a0710e3          	bnez	a4,28d4 <_vfprintf_r+0xc7c>
    1f38:	0a412783          	lw	a5,164(sp)
    1f3c:	01a484b3          	add	s1,s1,s10
    1f40:	01842023          	sw	s8,0(s0)
    1f44:	00178793          	add	a5,a5,1
    1f48:	01a42223          	sw	s10,4(s0)
    1f4c:	0a912423          	sw	s1,168(sp)
    1f50:	0af12223          	sw	a5,164(sp)
    1f54:	00700713          	li	a4,7
    1f58:	58f74c63          	blt	a4,a5,24f0 <_vfprintf_r+0x898>
    1f5c:	00840413          	add	s0,s0,8
    1f60:	004eff13          	and	t5,t4,4
    1f64:	000f0663          	beqz	t5,1f70 <_vfprintf_r+0x318>
    1f68:	419b8d33          	sub	s10,s7,s9
    1f6c:	5ba04ce3          	bgtz	s10,2d24 <_vfprintf_r+0x10cc>
    1f70:	000b8e93          	mv	t4,s7
    1f74:	019bd463          	bge	s7,s9,1f7c <_vfprintf_r+0x324>
    1f78:	000c8e93          	mv	t4,s9
    1f7c:	00c12783          	lw	a5,12(sp)
    1f80:	01d787b3          	add	a5,a5,t4
    1f84:	00f12623          	sw	a5,12(sp)
    1f88:	18049663          	bnez	s1,2114 <_vfprintf_r+0x4bc>
    1f8c:	01012783          	lw	a5,16(sp)
    1f90:	0a012223          	sw	zero,164(sp)
    1f94:	00078863          	beqz	a5,1fa4 <_vfprintf_r+0x34c>
    1f98:	01012583          	lw	a1,16(sp)
    1f9c:	00098513          	mv	a0,s3
    1fa0:	9b4ff0ef          	jal	1154 <_free_r>
    1fa4:	0ac10413          	add	s0,sp,172
    1fa8:	00090c13          	mv	s8,s2
    1fac:	df1ff06f          	j	1d9c <_vfprintf_r+0x144>
    1fb0:	00812403          	lw	s0,8(sp)
    1fb4:	00098513          	mv	a0,s3
    1fb8:	00f12623          	sw	a5,12(sp)
    1fbc:	00040593          	mv	a1,s0
    1fc0:	118050ef          	jal	70d8 <__swsetup_r>
    1fc4:	00050463          	beqz	a0,1fcc <_vfprintf_r+0x374>
    1fc8:	5600206f          	j	4528 <_vfprintf_r+0x28d0>
    1fcc:	00c41703          	lh	a4,12(s0)
    1fd0:	00a00613          	li	a2,10
    1fd4:	00c12783          	lw	a5,12(sp)
    1fd8:	01a77693          	and	a3,a4,26
    1fdc:	d4c698e3          	bne	a3,a2,1d2c <_vfprintf_r+0xd4>
    1fe0:	00812603          	lw	a2,8(sp)
    1fe4:	00e61683          	lh	a3,14(a2)
    1fe8:	d406c2e3          	bltz	a3,1d2c <_vfprintf_r+0xd4>
    1fec:	06462683          	lw	a3,100(a2)
    1ff0:	0016f693          	and	a3,a3,1
    1ff4:	00069863          	bnez	a3,2004 <_vfprintf_r+0x3ac>
    1ff8:	20077713          	and	a4,a4,512
    1ffc:	00071463          	bnez	a4,2004 <_vfprintf_r+0x3ac>
    2000:	53d0106f          	j	3d3c <_vfprintf_r+0x20e4>
    2004:	01412683          	lw	a3,20(sp)
    2008:	00812583          	lw	a1,8(sp)
    200c:	00098513          	mv	a0,s3
    2010:	00078613          	mv	a2,a5
    2014:	0e5020ef          	jal	48f8 <__sbprintf>
    2018:	18c12083          	lw	ra,396(sp)
    201c:	18812403          	lw	s0,392(sp)
    2020:	00a12623          	sw	a0,12(sp)
    2024:	00c12503          	lw	a0,12(sp)
    2028:	17c12983          	lw	s3,380(sp)
    202c:	19010113          	add	sp,sp,400
    2030:	00008067          	ret
    2034:	00098513          	mv	a0,s3
    2038:	58c050ef          	jal	75c4 <_localeconv_r>
    203c:	00452783          	lw	a5,4(a0)
    2040:	00078513          	mv	a0,a5
    2044:	04f12423          	sw	a5,72(sp)
    2048:	f3dfe0ef          	jal	f84 <strlen>
    204c:	00050793          	mv	a5,a0
    2050:	00098513          	mv	a0,s3
    2054:	00078c93          	mv	s9,a5
    2058:	04f12623          	sw	a5,76(sp)
    205c:	568050ef          	jal	75c4 <_localeconv_r>
    2060:	00852703          	lw	a4,8(a0)
    2064:	02e12e23          	sw	a4,60(sp)
    2068:	000c8463          	beqz	s9,2070 <_vfprintf_r+0x418>
    206c:	1ec0106f          	j	3258 <_vfprintf_r+0x1600>
    2070:	00094e03          	lbu	t3,0(s2)
    2074:	d95ff06f          	j	1e08 <_vfprintf_r+0x1b0>
    2078:	00800613          	li	a2,8
    207c:	00000593          	li	a1,0
    2080:	09010513          	add	a0,sp,144
    2084:	c81fe0ef          	jal	d04 <memset>
    2088:	00100513          	li	a0,1
    208c:	00a90933          	add	s2,s2,a0
    2090:	d11ff06f          	j	1da0 <_vfprintf_r+0x148>
    2094:	00050493          	mv	s1,a0
    2098:	41890cb3          	sub	s9,s2,s8
    209c:	05890063          	beq	s2,s8,20dc <_vfprintf_r+0x484>
    20a0:	0a812683          	lw	a3,168(sp)
    20a4:	0a412703          	lw	a4,164(sp)
    20a8:	01842023          	sw	s8,0(s0)
    20ac:	019686b3          	add	a3,a3,s9
    20b0:	00170713          	add	a4,a4,1
    20b4:	01942223          	sw	s9,4(s0)
    20b8:	0ad12423          	sw	a3,168(sp)
    20bc:	0ae12223          	sw	a4,164(sp)
    20c0:	00700693          	li	a3,7
    20c4:	00840413          	add	s0,s0,8
    20c8:	02e6c863          	blt	a3,a4,20f8 <_vfprintf_r+0x4a0>
    20cc:	00c12783          	lw	a5,12(sp)
    20d0:	019787b3          	add	a5,a5,s9
    20d4:	00f12623          	sw	a5,12(sp)
    20d8:	d00496e3          	bnez	s1,1de4 <_vfprintf_r+0x18c>
    20dc:	0a812783          	lw	a5,168(sp)
    20e0:	00078463          	beqz	a5,20e8 <_vfprintf_r+0x490>
    20e4:	4090106f          	j	3cec <_vfprintf_r+0x2094>
    20e8:	00812783          	lw	a5,8(sp)
    20ec:	0a012223          	sw	zero,164(sp)
    20f0:	00c79783          	lh	a5,12(a5)
    20f4:	0500006f          	j	2144 <_vfprintf_r+0x4ec>
    20f8:	00812583          	lw	a1,8(sp)
    20fc:	0a010613          	add	a2,sp,160
    2100:	00098513          	mv	a0,s3
    2104:	211020ef          	jal	4b14 <__sprint_r>
    2108:	02051a63          	bnez	a0,213c <_vfprintf_r+0x4e4>
    210c:	0ac10413          	add	s0,sp,172
    2110:	fbdff06f          	j	20cc <_vfprintf_r+0x474>
    2114:	00812583          	lw	a1,8(sp)
    2118:	0a010613          	add	a2,sp,160
    211c:	00098513          	mv	a0,s3
    2120:	1f5020ef          	jal	4b14 <__sprint_r>
    2124:	e60504e3          	beqz	a0,1f8c <_vfprintf_r+0x334>
    2128:	01012283          	lw	t0,16(sp)
    212c:	00028863          	beqz	t0,213c <_vfprintf_r+0x4e4>
    2130:	00028593          	mv	a1,t0
    2134:	00098513          	mv	a0,s3
    2138:	81cff0ef          	jal	1154 <_free_r>
    213c:	00812783          	lw	a5,8(sp)
    2140:	00c79783          	lh	a5,12(a5)
    2144:	00812703          	lw	a4,8(sp)
    2148:	06472703          	lw	a4,100(a4)
    214c:	00177713          	and	a4,a4,1
    2150:	3c070463          	beqz	a4,2518 <_vfprintf_r+0x8c0>
    2154:	0407f793          	and	a5,a5,64
    2158:	18412483          	lw	s1,388(sp)
    215c:	18012903          	lw	s2,384(sp)
    2160:	17812a03          	lw	s4,376(sp)
    2164:	17412a83          	lw	s5,372(sp)
    2168:	17012b03          	lw	s6,368(sp)
    216c:	16c12b83          	lw	s7,364(sp)
    2170:	16812c03          	lw	s8,360(sp)
    2174:	16412c83          	lw	s9,356(sp)
    2178:	16012d03          	lw	s10,352(sp)
    217c:	15c12d83          	lw	s11,348(sp)
    2180:	00078463          	beqz	a5,2188 <_vfprintf_r+0x530>
    2184:	3d00206f          	j	4554 <_vfprintf_r+0x28fc>
    2188:	18c12083          	lw	ra,396(sp)
    218c:	18812403          	lw	s0,392(sp)
    2190:	00c12503          	lw	a0,12(sp)
    2194:	17c12983          	lw	s3,380(sp)
    2198:	19010113          	add	sp,sp,400
    219c:	00008067          	ret
    21a0:	008a7713          	and	a4,s4,8
    21a4:	000a0e93          	mv	t4,s4
    21a8:	000b0313          	mv	t1,s6
    21ac:	00070463          	beqz	a4,21b4 <_vfprintf_r+0x55c>
    21b0:	0200106f          	j	31d0 <_vfprintf_r+0x1578>
    21b4:	01412783          	lw	a5,20(sp)
    21b8:	00778b13          	add	s6,a5,7
    21bc:	ff8b7b13          	and	s6,s6,-8
    21c0:	000b2783          	lw	a5,0(s6)
    21c4:	02f12423          	sw	a5,40(sp)
    21c8:	004b2783          	lw	a5,4(s6)
    21cc:	02f12623          	sw	a5,44(sp)
    21d0:	008b0793          	add	a5,s6,8
    21d4:	00f12a23          	sw	a5,20(sp)
    21d8:	02c12a03          	lw	s4,44(sp)
    21dc:	7fffe717          	auipc	a4,0x7fffe
    21e0:	4c470713          	add	a4,a4,1220 # 800006a0 <__global_locale+0x16c>
    21e4:	00072c83          	lw	s9,0(a4)
    21e8:	00472d03          	lw	s10,4(a4)
    21ec:	02812b03          	lw	s6,40(sp)
    21f0:	001a1493          	sll	s1,s4,0x1
    21f4:	0014d493          	srl	s1,s1,0x1
    21f8:	000b0513          	mv	a0,s6
    21fc:	00048593          	mv	a1,s1
    2200:	000c8613          	mv	a2,s9
    2204:	000d0693          	mv	a3,s10
    2208:	02612223          	sw	t1,36(sp)
    220c:	03c12023          	sw	t3,32(sp)
    2210:	01d12823          	sw	t4,16(sp)
    2214:	1700c0ef          	jal	e384 <__unorddf2>
    2218:	01012e83          	lw	t4,16(sp)
    221c:	02012e03          	lw	t3,32(sp)
    2220:	02412303          	lw	t1,36(sp)
    2224:	00050463          	beqz	a0,222c <_vfprintf_r+0x5d4>
    2228:	4080106f          	j	3630 <_vfprintf_r+0x19d8>
    222c:	000b0513          	mv	a0,s6
    2230:	00048593          	mv	a1,s1
    2234:	000c8613          	mv	a2,s9
    2238:	000d0693          	mv	a3,s10
    223c:	7a90a0ef          	jal	d1e4 <__ledf2>
    2240:	01012e83          	lw	t4,16(sp)
    2244:	02012e03          	lw	t3,32(sp)
    2248:	02412303          	lw	t1,36(sp)
    224c:	00a04463          	bgtz	a0,2254 <_vfprintf_r+0x5fc>
    2250:	3e00106f          	j	3630 <_vfprintf_r+0x19d8>
    2254:	000b0513          	mv	a0,s6
    2258:	000a0593          	mv	a1,s4
    225c:	00000613          	li	a2,0
    2260:	00000693          	li	a3,0
    2264:	7810a0ef          	jal	d1e4 <__ledf2>
    2268:	01012e83          	lw	t4,16(sp)
    226c:	02012e03          	lw	t3,32(sp)
    2270:	00055463          	bgez	a0,2278 <_vfprintf_r+0x620>
    2274:	6650106f          	j	40d8 <_vfprintf_r+0x2480>
    2278:	07714603          	lbu	a2,119(sp)
    227c:	04700713          	li	a4,71
    2280:	0000dc17          	auipc	s8,0xd
    2284:	b74c0c13          	add	s8,s8,-1164 # edf4 <__fini_array_end+0x248>
    2288:	01c74663          	blt	a4,t3,2294 <_vfprintf_r+0x63c>
    228c:	0000dc17          	auipc	s8,0xd
    2290:	b64c0c13          	add	s8,s8,-1180 # edf0 <__fini_array_end+0x244>
    2294:	00012823          	sw	zero,16(sp)
    2298:	02012223          	sw	zero,36(sp)
    229c:	02012023          	sw	zero,32(sp)
    22a0:	f7fefe93          	and	t4,t4,-129
    22a4:	00300c93          	li	s9,3
    22a8:	00300d13          	li	s10,3
    22ac:	00000313          	li	t1,0
    22b0:	00000a13          	li	s4,0
    22b4:	be0602e3          	beqz	a2,1e98 <_vfprintf_r+0x240>
    22b8:	001c8c93          	add	s9,s9,1
    22bc:	bddff06f          	j	1e98 <_vfprintf_r+0x240>
    22c0:	01000593          	li	a1,16
    22c4:	0a412603          	lw	a2,164(sp)
    22c8:	0000db17          	auipc	s6,0xd
    22cc:	048b0b13          	add	s6,s6,72 # f310 <blanks.1>
    22d0:	0ae5dc63          	bge	a1,a4,2388 <_vfprintf_r+0x730>
    22d4:	00040793          	mv	a5,s0
    22d8:	00048693          	mv	a3,s1
    22dc:	01000893          	li	a7,16
    22e0:	000b0493          	mv	s1,s6
    22e4:	00700393          	li	t2,7
    22e8:	000a0b13          	mv	s6,s4
    22ec:	04512223          	sw	t0,68(sp)
    22f0:	05f12823          	sw	t6,80(sp)
    22f4:	05d12a23          	sw	t4,84(sp)
    22f8:	05c12c23          	sw	t3,88(sp)
    22fc:	00070413          	mv	s0,a4
    2300:	00030a13          	mv	s4,t1
    2304:	00c0006f          	j	2310 <_vfprintf_r+0x6b8>
    2308:	ff040413          	add	s0,s0,-16
    230c:	0488da63          	bge	a7,s0,2360 <_vfprintf_r+0x708>
    2310:	01068693          	add	a3,a3,16
    2314:	00160613          	add	a2,a2,1
    2318:	0097a023          	sw	s1,0(a5)
    231c:	0117a223          	sw	a7,4(a5)
    2320:	0ad12423          	sw	a3,168(sp)
    2324:	0ac12223          	sw	a2,164(sp)
    2328:	00878793          	add	a5,a5,8
    232c:	fcc3dee3          	bge	t2,a2,2308 <_vfprintf_r+0x6b0>
    2330:	00812583          	lw	a1,8(sp)
    2334:	0a010613          	add	a2,sp,160
    2338:	00098513          	mv	a0,s3
    233c:	7d8020ef          	jal	4b14 <__sprint_r>
    2340:	de0514e3          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2344:	01000893          	li	a7,16
    2348:	ff040413          	add	s0,s0,-16
    234c:	0a812683          	lw	a3,168(sp)
    2350:	0a412603          	lw	a2,164(sp)
    2354:	0ac10793          	add	a5,sp,172
    2358:	00700393          	li	t2,7
    235c:	fa88cae3          	blt	a7,s0,2310 <_vfprintf_r+0x6b8>
    2360:	04412283          	lw	t0,68(sp)
    2364:	05012f83          	lw	t6,80(sp)
    2368:	05412e83          	lw	t4,84(sp)
    236c:	05812e03          	lw	t3,88(sp)
    2370:	000a0313          	mv	t1,s4
    2374:	00040713          	mv	a4,s0
    2378:	000b0a13          	mv	s4,s6
    237c:	00078413          	mv	s0,a5
    2380:	00048b13          	mv	s6,s1
    2384:	00068493          	mv	s1,a3
    2388:	00e484b3          	add	s1,s1,a4
    238c:	00160613          	add	a2,a2,1
    2390:	00e42223          	sw	a4,4(s0)
    2394:	01642023          	sw	s6,0(s0)
    2398:	0a912423          	sw	s1,168(sp)
    239c:	0ac12223          	sw	a2,164(sp)
    23a0:	00700713          	li	a4,7
    23a4:	00c75463          	bge	a4,a2,23ac <_vfprintf_r+0x754>
    23a8:	2380106f          	j	35e0 <_vfprintf_r+0x1988>
    23ac:	07714603          	lbu	a2,119(sp)
    23b0:	00840413          	add	s0,s0,8
    23b4:	b05ff06f          	j	1eb8 <_vfprintf_r+0x260>
    23b8:	00812583          	lw	a1,8(sp)
    23bc:	0a010613          	add	a2,sp,160
    23c0:	00098513          	mv	a0,s3
    23c4:	04612e23          	sw	t1,92(sp)
    23c8:	05c12c23          	sw	t3,88(sp)
    23cc:	05d12a23          	sw	t4,84(sp)
    23d0:	05f12823          	sw	t6,80(sp)
    23d4:	04512223          	sw	t0,68(sp)
    23d8:	73c020ef          	jal	4b14 <__sprint_r>
    23dc:	d40516e3          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    23e0:	0a812483          	lw	s1,168(sp)
    23e4:	05c12303          	lw	t1,92(sp)
    23e8:	05812e03          	lw	t3,88(sp)
    23ec:	05412e83          	lw	t4,84(sp)
    23f0:	05012f83          	lw	t6,80(sp)
    23f4:	04412283          	lw	t0,68(sp)
    23f8:	0ac10413          	add	s0,sp,172
    23fc:	af1ff06f          	j	1eec <_vfprintf_r+0x294>
    2400:	0a412d03          	lw	s10,164(sp)
    2404:	01812783          	lw	a5,24(sp)
    2408:	00100693          	li	a3,1
    240c:	01842023          	sw	s8,0(s0)
    2410:	00148493          	add	s1,s1,1
    2414:	001d0d13          	add	s10,s10,1
    2418:	00840b13          	add	s6,s0,8
    241c:	32f6d0e3          	bge	a3,a5,2f3c <_vfprintf_r+0x12e4>
    2420:	00100693          	li	a3,1
    2424:	00d42223          	sw	a3,4(s0)
    2428:	0a912423          	sw	s1,168(sp)
    242c:	0ba12223          	sw	s10,164(sp)
    2430:	00700693          	li	a3,7
    2434:	01a6d463          	bge	a3,s10,243c <_vfprintf_r+0x7e4>
    2438:	0680106f          	j	34a0 <_vfprintf_r+0x1848>
    243c:	03012783          	lw	a5,48(sp)
    2440:	03412703          	lw	a4,52(sp)
    2444:	001d0d13          	add	s10,s10,1
    2448:	00f484b3          	add	s1,s1,a5
    244c:	00eb2023          	sw	a4,0(s6)
    2450:	00fb2223          	sw	a5,4(s6)
    2454:	0a912423          	sw	s1,168(sp)
    2458:	0ba12223          	sw	s10,164(sp)
    245c:	00700693          	li	a3,7
    2460:	008b0b13          	add	s6,s6,8
    2464:	01a6d463          	bge	a3,s10,246c <_vfprintf_r+0x814>
    2468:	0680106f          	j	34d0 <_vfprintf_r+0x1878>
    246c:	02812603          	lw	a2,40(sp)
    2470:	02c12683          	lw	a3,44(sp)
    2474:	01812783          	lw	a5,24(sp)
    2478:	00060513          	mv	a0,a2
    247c:	00068593          	mv	a1,a3
    2480:	00000613          	li	a2,0
    2484:	00000693          	li	a3,0
    2488:	03d12023          	sw	t4,32(sp)
    248c:	fff78413          	add	s0,a5,-1
    2490:	3c90a0ef          	jal	d058 <__eqdf2>
    2494:	02012e83          	lw	t4,32(sp)
    2498:	2e0506e3          	beqz	a0,2f84 <_vfprintf_r+0x132c>
    249c:	001c0793          	add	a5,s8,1
    24a0:	001d0d13          	add	s10,s10,1
    24a4:	008484b3          	add	s1,s1,s0
    24a8:	00fb2023          	sw	a5,0(s6)
    24ac:	008b2223          	sw	s0,4(s6)
    24b0:	0a912423          	sw	s1,168(sp)
    24b4:	0ba12223          	sw	s10,164(sp)
    24b8:	00700793          	li	a5,7
    24bc:	008b0b13          	add	s6,s6,8
    24c0:	29a7cce3          	blt	a5,s10,2f58 <_vfprintf_r+0x1300>
    24c4:	04012703          	lw	a4,64(sp)
    24c8:	08810793          	add	a5,sp,136
    24cc:	001d0d13          	add	s10,s10,1
    24d0:	009704b3          	add	s1,a4,s1
    24d4:	00fb2023          	sw	a5,0(s6)
    24d8:	00eb2223          	sw	a4,4(s6)
    24dc:	0a912423          	sw	s1,168(sp)
    24e0:	0ba12223          	sw	s10,164(sp)
    24e4:	00700793          	li	a5,7
    24e8:	008b0413          	add	s0,s6,8
    24ec:	a7a7dae3          	bge	a5,s10,1f60 <_vfprintf_r+0x308>
    24f0:	00812583          	lw	a1,8(sp)
    24f4:	0a010613          	add	a2,sp,160
    24f8:	00098513          	mv	a0,s3
    24fc:	03d12023          	sw	t4,32(sp)
    2500:	614020ef          	jal	4b14 <__sprint_r>
    2504:	c20512e3          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2508:	0a812483          	lw	s1,168(sp)
    250c:	02012e83          	lw	t4,32(sp)
    2510:	0ac10413          	add	s0,sp,172
    2514:	a4dff06f          	j	1f60 <_vfprintf_r+0x308>
    2518:	2007f713          	and	a4,a5,512
    251c:	c2071ce3          	bnez	a4,2154 <_vfprintf_r+0x4fc>
    2520:	00812403          	lw	s0,8(sp)
    2524:	05842503          	lw	a0,88(s0)
    2528:	fd8fe0ef          	jal	d00 <__retarget_lock_release_recursive>
    252c:	00c41783          	lh	a5,12(s0)
    2530:	c25ff06f          	j	2154 <_vfprintf_r+0x4fc>
    2534:	00094e03          	lbu	t3,0(s2)
    2538:	020a6a13          	or	s4,s4,32
    253c:	8cdff06f          	j	1e08 <_vfprintf_r+0x1b0>
    2540:	01412703          	lw	a4,20(sp)
    2544:	04300793          	li	a5,67
    2548:	000a0e93          	mv	t4,s4
    254c:	00470493          	add	s1,a4,4
    2550:	64fe08e3          	beq	t3,a5,33a0 <_vfprintf_r+0x1748>
    2554:	010a7793          	and	a5,s4,16
    2558:	640794e3          	bnez	a5,33a0 <_vfprintf_r+0x1748>
    255c:	01412783          	lw	a5,20(sp)
    2560:	00100c93          	li	s9,1
    2564:	00100d13          	li	s10,1
    2568:	0007a783          	lw	a5,0(a5)
    256c:	0ec10c13          	add	s8,sp,236
    2570:	0ef10623          	sb	a5,236(sp)
    2574:	06010ba3          	sb	zero,119(sp)
    2578:	00912a23          	sw	s1,20(sp)
    257c:	00000613          	li	a2,0
    2580:	00012823          	sw	zero,16(sp)
    2584:	00000313          	li	t1,0
    2588:	02012223          	sw	zero,36(sp)
    258c:	02012023          	sw	zero,32(sp)
    2590:	00000a13          	li	s4,0
    2594:	905ff06f          	j	1e98 <_vfprintf_r+0x240>
    2598:	01412783          	lw	a5,20(sp)
    259c:	06010ba3          	sb	zero,119(sp)
    25a0:	000b0313          	mv	t1,s6
    25a4:	0007ac03          	lw	s8,0(a5)
    25a8:	000a0e93          	mv	t4,s4
    25ac:	00478b13          	add	s6,a5,4
    25b0:	5a0c0ce3          	beqz	s8,3368 <_vfprintf_r+0x1710>
    25b4:	05300713          	li	a4,83
    25b8:	00ee1463          	bne	t3,a4,25c0 <_vfprintf_r+0x968>
    25bc:	1d00106f          	j	378c <_vfprintf_r+0x1b34>
    25c0:	010a7a13          	and	s4,s4,16
    25c4:	000a0463          	beqz	s4,25cc <_vfprintf_r+0x974>
    25c8:	1c40106f          	j	378c <_vfprintf_r+0x1b34>
    25cc:	00035463          	bgez	t1,25d4 <_vfprintf_r+0x97c>
    25d0:	6d40106f          	j	3ca4 <_vfprintf_r+0x204c>
    25d4:	00030613          	mv	a2,t1
    25d8:	00000593          	li	a1,0
    25dc:	000c0513          	mv	a0,s8
    25e0:	03d12023          	sw	t4,32(sp)
    25e4:	00612a23          	sw	t1,20(sp)
    25e8:	661040ef          	jal	7448 <memchr>
    25ec:	00a12823          	sw	a0,16(sp)
    25f0:	01412303          	lw	t1,20(sp)
    25f4:	02012e83          	lw	t4,32(sp)
    25f8:	00051463          	bnez	a0,2600 <_vfprintf_r+0x9a8>
    25fc:	1780206f          	j	4774 <_vfprintf_r+0x2b1c>
    2600:	01012783          	lw	a5,16(sp)
    2604:	07714603          	lbu	a2,119(sp)
    2608:	01612a23          	sw	s6,20(sp)
    260c:	41878d33          	sub	s10,a5,s8
    2610:	fffd4813          	not	a6,s10
    2614:	41f85813          	sra	a6,a6,0x1f
    2618:	02012223          	sw	zero,36(sp)
    261c:	02012023          	sw	zero,32(sp)
    2620:	00012823          	sw	zero,16(sp)
    2624:	010d7cb3          	and	s9,s10,a6
    2628:	00000313          	li	t1,0
    262c:	07300e13          	li	t3,115
    2630:	860604e3          	beqz	a2,1e98 <_vfprintf_r+0x240>
    2634:	c85ff06f          	j	22b8 <_vfprintf_r+0x660>
    2638:	01412783          	lw	a5,20(sp)
    263c:	0007ab83          	lw	s7,0(a5)
    2640:	00478793          	add	a5,a5,4
    2644:	2a0bdae3          	bgez	s7,30f8 <_vfprintf_r+0x14a0>
    2648:	41700bb3          	neg	s7,s7
    264c:	00f12a23          	sw	a5,20(sp)
    2650:	00094e03          	lbu	t3,0(s2)
    2654:	004a6a13          	or	s4,s4,4
    2658:	fb0ff06f          	j	1e08 <_vfprintf_r+0x1b0>
    265c:	02b00793          	li	a5,43
    2660:	00094e03          	lbu	t3,0(s2)
    2664:	06f10ba3          	sb	a5,119(sp)
    2668:	fa0ff06f          	j	1e08 <_vfprintf_r+0x1b0>
    266c:	000b0313          	mv	t1,s6
    2670:	010a6613          	or	a2,s4,16
    2674:	02067793          	and	a5,a2,32
    2678:	1c0780e3          	beqz	a5,3038 <_vfprintf_r+0x13e0>
    267c:	01412783          	lw	a5,20(sp)
    2680:	00778b13          	add	s6,a5,7
    2684:	ff8b7b13          	and	s6,s6,-8
    2688:	000b2d03          	lw	s10,0(s6)
    268c:	004b2c83          	lw	s9,4(s6)
    2690:	008b0793          	add	a5,s6,8
    2694:	00f12a23          	sw	a5,20(sp)
    2698:	00100793          	li	a5,1
    269c:	00000713          	li	a4,0
    26a0:	06e10ba3          	sb	a4,119(sp)
    26a4:	34034c63          	bltz	t1,29fc <_vfprintf_r+0xda4>
    26a8:	019d6733          	or	a4,s10,s9
    26ac:	f7f67e93          	and	t4,a2,-129
    26b0:	34071463          	bnez	a4,29f8 <_vfprintf_r+0xda0>
    26b4:	3a031a63          	bnez	t1,2a68 <_vfprintf_r+0xe10>
    26b8:	5c079ee3          	bnez	a5,3494 <_vfprintf_r+0x183c>
    26bc:	00167d13          	and	s10,a2,1
    26c0:	15010c13          	add	s8,sp,336
    26c4:	2c0d10e3          	bnez	s10,3184 <_vfprintf_r+0x152c>
    26c8:	07714603          	lbu	a2,119(sp)
    26cc:	00030c93          	mv	s9,t1
    26d0:	01a35463          	bge	t1,s10,26d8 <_vfprintf_r+0xa80>
    26d4:	000d0c93          	mv	s9,s10
    26d8:	00012823          	sw	zero,16(sp)
    26dc:	02012223          	sw	zero,36(sp)
    26e0:	02012023          	sw	zero,32(sp)
    26e4:	00000a13          	li	s4,0
    26e8:	fa060863          	beqz	a2,1e98 <_vfprintf_r+0x240>
    26ec:	bcdff06f          	j	22b8 <_vfprintf_r+0x660>
    26f0:	00094e03          	lbu	t3,0(s2)
    26f4:	080a6a13          	or	s4,s4,128
    26f8:	f10ff06f          	j	1e08 <_vfprintf_r+0x1b0>
    26fc:	00094e03          	lbu	t3,0(s2)
    2700:	02a00793          	li	a5,42
    2704:	00190693          	add	a3,s2,1
    2708:	00fe1463          	bne	t3,a5,2710 <_vfprintf_r+0xab8>
    270c:	1100206f          	j	481c <_vfprintf_r+0x2bc4>
    2710:	fd0e0713          	add	a4,t3,-48
    2714:	00900793          	li	a5,9
    2718:	00000b13          	li	s6,0
    271c:	00900613          	li	a2,9
    2720:	02e7e463          	bltu	a5,a4,2748 <_vfprintf_r+0xaf0>
    2724:	0006ce03          	lbu	t3,0(a3)
    2728:	002b1793          	sll	a5,s6,0x2
    272c:	016787b3          	add	a5,a5,s6
    2730:	00179793          	sll	a5,a5,0x1
    2734:	00e78b33          	add	s6,a5,a4
    2738:	fd0e0713          	add	a4,t3,-48
    273c:	00168693          	add	a3,a3,1
    2740:	fee672e3          	bgeu	a2,a4,2724 <_vfprintf_r+0xacc>
    2744:	320b4ce3          	bltz	s6,327c <_vfprintf_r+0x1624>
    2748:	00068913          	mv	s2,a3
    274c:	ec0ff06f          	j	1e0c <_vfprintf_r+0x1b4>
    2750:	00094e03          	lbu	t3,0(s2)
    2754:	001a6a13          	or	s4,s4,1
    2758:	eb0ff06f          	j	1e08 <_vfprintf_r+0x1b0>
    275c:	07714783          	lbu	a5,119(sp)
    2760:	00094e03          	lbu	t3,0(s2)
    2764:	ea079263          	bnez	a5,1e08 <_vfprintf_r+0x1b0>
    2768:	02000793          	li	a5,32
    276c:	06f10ba3          	sb	a5,119(sp)
    2770:	e98ff06f          	j	1e08 <_vfprintf_r+0x1b0>
    2774:	00094e03          	lbu	t3,0(s2)
    2778:	06c00793          	li	a5,108
    277c:	3afe00e3          	beq	t3,a5,331c <_vfprintf_r+0x16c4>
    2780:	010a6a13          	or	s4,s4,16
    2784:	e84ff06f          	j	1e08 <_vfprintf_r+0x1b0>
    2788:	00094e03          	lbu	t3,0(s2)
    278c:	008a6a13          	or	s4,s4,8
    2790:	e78ff06f          	j	1e08 <_vfprintf_r+0x1b0>
    2794:	000b0313          	mv	t1,s6
    2798:	010a6e93          	or	t4,s4,16
    279c:	020ef793          	and	a5,t4,32
    27a0:	0c0786e3          	beqz	a5,306c <_vfprintf_r+0x1414>
    27a4:	01412783          	lw	a5,20(sp)
    27a8:	00778b13          	add	s6,a5,7
    27ac:	ff8b7b13          	and	s6,s6,-8
    27b0:	004b2783          	lw	a5,4(s6)
    27b4:	000b2d03          	lw	s10,0(s6)
    27b8:	008b0713          	add	a4,s6,8
    27bc:	00e12a23          	sw	a4,20(sp)
    27c0:	00078c93          	mv	s9,a5
    27c4:	0c07cee3          	bltz	a5,30a0 <_vfprintf_r+0x1448>
    27c8:	000e8613          	mv	a2,t4
    27cc:	02034263          	bltz	t1,27f0 <_vfprintf_r+0xb98>
    27d0:	019d67b3          	or	a5,s10,s9
    27d4:	f7fef613          	and	a2,t4,-129
    27d8:	00079c63          	bnez	a5,27f0 <_vfprintf_r+0xb98>
    27dc:	02031063          	bnez	t1,27fc <_vfprintf_r+0xba4>
    27e0:	00000d13          	li	s10,0
    27e4:	00060e93          	mv	t4,a2
    27e8:	15010c13          	add	s8,sp,336
    27ec:	eddff06f          	j	26c8 <_vfprintf_r+0xa70>
    27f0:	520c90e3          	bnez	s9,3510 <_vfprintf_r+0x18b8>
    27f4:	00900793          	li	a5,9
    27f8:	51a7ece3          	bltu	a5,s10,3510 <_vfprintf_r+0x18b8>
    27fc:	030d0d13          	add	s10,s10,48
    2800:	15a107a3          	sb	s10,335(sp)
    2804:	00060e93          	mv	t4,a2
    2808:	00100d13          	li	s10,1
    280c:	14f10c13          	add	s8,sp,335
    2810:	eb9ff06f          	j	26c8 <_vfprintf_r+0xa70>
    2814:	000b0313          	mv	t1,s6
    2818:	010a6e93          	or	t4,s4,16
    281c:	020ef793          	and	a5,t4,32
    2820:	7e078463          	beqz	a5,3008 <_vfprintf_r+0x13b0>
    2824:	01412783          	lw	a5,20(sp)
    2828:	00778b13          	add	s6,a5,7
    282c:	ff8b7b13          	and	s6,s6,-8
    2830:	000b2d03          	lw	s10,0(s6)
    2834:	004b2c83          	lw	s9,4(s6)
    2838:	008b0793          	add	a5,s6,8
    283c:	00f12a23          	sw	a5,20(sp)
    2840:	bffef613          	and	a2,t4,-1025
    2844:	00000793          	li	a5,0
    2848:	e55ff06f          	j	269c <_vfprintf_r+0xa44>
    284c:	00094e03          	lbu	t3,0(s2)
    2850:	06800793          	li	a5,104
    2854:	2cfe0ce3          	beq	t3,a5,332c <_vfprintf_r+0x16d4>
    2858:	040a6a13          	or	s4,s4,64
    285c:	dacff06f          	j	1e08 <_vfprintf_r+0x1b0>
    2860:	01412703          	lw	a4,20(sp)
    2864:	000087b7          	lui	a5,0x8
    2868:	83078793          	add	a5,a5,-2000 # 7830 <memmove+0x84>
    286c:	06f11c23          	sh	a5,120(sp)
    2870:	00470793          	add	a5,a4,4
    2874:	00f12a23          	sw	a5,20(sp)
    2878:	0000c797          	auipc	a5,0xc
    287c:	58878793          	add	a5,a5,1416 # ee00 <__fini_array_end+0x254>
    2880:	02f12c23          	sw	a5,56(sp)
    2884:	00072d03          	lw	s10,0(a4)
    2888:	000b0313          	mv	t1,s6
    288c:	00000c93          	li	s9,0
    2890:	002a6613          	or	a2,s4,2
    2894:	00200793          	li	a5,2
    2898:	07800e13          	li	t3,120
    289c:	e01ff06f          	j	269c <_vfprintf_r+0xa44>
    28a0:	020a7793          	and	a5,s4,32
    28a4:	180784e3          	beqz	a5,322c <_vfprintf_r+0x15d4>
    28a8:	01412783          	lw	a5,20(sp)
    28ac:	00c12683          	lw	a3,12(sp)
    28b0:	0007a783          	lw	a5,0(a5)
    28b4:	41f6d713          	sra	a4,a3,0x1f
    28b8:	00d7a023          	sw	a3,0(a5)
    28bc:	00e7a223          	sw	a4,4(a5)
    28c0:	01412783          	lw	a5,20(sp)
    28c4:	00090c13          	mv	s8,s2
    28c8:	00478793          	add	a5,a5,4
    28cc:	00f12a23          	sw	a5,20(sp)
    28d0:	cccff06f          	j	1d9c <_vfprintf_r+0x144>
    28d4:	06500713          	li	a4,101
    28d8:	b3c754e3          	bge	a4,t3,2400 <_vfprintf_r+0x7a8>
    28dc:	02812683          	lw	a3,40(sp)
    28e0:	02c12703          	lw	a4,44(sp)
    28e4:	00000613          	li	a2,0
    28e8:	00068513          	mv	a0,a3
    28ec:	00070593          	mv	a1,a4
    28f0:	00000693          	li	a3,0
    28f4:	05d12223          	sw	t4,68(sp)
    28f8:	7600a0ef          	jal	d058 <__eqdf2>
    28fc:	04412e83          	lw	t4,68(sp)
    2900:	4e051463          	bnez	a0,2de8 <_vfprintf_r+0x1190>
    2904:	0a412783          	lw	a5,164(sp)
    2908:	0000c717          	auipc	a4,0xc
    290c:	52870713          	add	a4,a4,1320 # ee30 <__fini_array_end+0x284>
    2910:	00e42023          	sw	a4,0(s0)
    2914:	00148493          	add	s1,s1,1
    2918:	00100713          	li	a4,1
    291c:	00178793          	add	a5,a5,1
    2920:	00e42223          	sw	a4,4(s0)
    2924:	0a912423          	sw	s1,168(sp)
    2928:	0af12223          	sw	a5,164(sp)
    292c:	00700713          	li	a4,7
    2930:	00840413          	add	s0,s0,8
    2934:	62f746e3          	blt	a4,a5,3760 <_vfprintf_r+0x1b08>
    2938:	07c12783          	lw	a5,124(sp)
    293c:	01812703          	lw	a4,24(sp)
    2940:	78e7de63          	bge	a5,a4,30dc <_vfprintf_r+0x1484>
    2944:	03412783          	lw	a5,52(sp)
    2948:	03012703          	lw	a4,48(sp)
    294c:	00840413          	add	s0,s0,8
    2950:	fef42c23          	sw	a5,-8(s0)
    2954:	0a412783          	lw	a5,164(sp)
    2958:	00e484b3          	add	s1,s1,a4
    295c:	fee42e23          	sw	a4,-4(s0)
    2960:	00178793          	add	a5,a5,1
    2964:	0a912423          	sw	s1,168(sp)
    2968:	0af12223          	sw	a5,164(sp)
    296c:	00700713          	li	a4,7
    2970:	1cf746e3          	blt	a4,a5,333c <_vfprintf_r+0x16e4>
    2974:	01812783          	lw	a5,24(sp)
    2978:	fff78d13          	add	s10,a5,-1
    297c:	dfa05263          	blez	s10,1f60 <_vfprintf_r+0x308>
    2980:	01000713          	li	a4,16
    2984:	0a412783          	lw	a5,164(sp)
    2988:	0000d297          	auipc	t0,0xd
    298c:	97828293          	add	t0,t0,-1672 # f300 <zeroes.0>
    2990:	77a752e3          	bge	a4,s10,38f4 <_vfprintf_r+0x1c9c>
    2994:	00048713          	mv	a4,s1
    2998:	01000c13          	li	s8,16
    299c:	00700b13          	li	s6,7
    29a0:	000e8493          	mv	s1,t4
    29a4:	00028a13          	mv	s4,t0
    29a8:	00c0006f          	j	29b4 <_vfprintf_r+0xd5c>
    29ac:	ff0d0d13          	add	s10,s10,-16
    29b0:	73ac5ce3          	bge	s8,s10,38e8 <_vfprintf_r+0x1c90>
    29b4:	01070713          	add	a4,a4,16
    29b8:	00178793          	add	a5,a5,1
    29bc:	01442023          	sw	s4,0(s0)
    29c0:	01842223          	sw	s8,4(s0)
    29c4:	0ae12423          	sw	a4,168(sp)
    29c8:	0af12223          	sw	a5,164(sp)
    29cc:	00840413          	add	s0,s0,8
    29d0:	fcfb5ee3          	bge	s6,a5,29ac <_vfprintf_r+0xd54>
    29d4:	00812583          	lw	a1,8(sp)
    29d8:	0a010613          	add	a2,sp,160
    29dc:	00098513          	mv	a0,s3
    29e0:	134020ef          	jal	4b14 <__sprint_r>
    29e4:	f4051263          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    29e8:	0a812703          	lw	a4,168(sp)
    29ec:	0a412783          	lw	a5,164(sp)
    29f0:	0ac10413          	add	s0,sp,172
    29f4:	fb9ff06f          	j	29ac <_vfprintf_r+0xd54>
    29f8:	000e8613          	mv	a2,t4
    29fc:	00100713          	li	a4,1
    2a00:	dee788e3          	beq	a5,a4,27f0 <_vfprintf_r+0xb98>
    2a04:	00200713          	li	a4,2
    2a08:	06e78c63          	beq	a5,a4,2a80 <_vfprintf_r+0xe28>
    2a0c:	15010c13          	add	s8,sp,336
    2a10:	01dc9793          	sll	a5,s9,0x1d
    2a14:	007d7713          	and	a4,s10,7
    2a18:	003d5d13          	srl	s10,s10,0x3
    2a1c:	03070713          	add	a4,a4,48
    2a20:	01a7ed33          	or	s10,a5,s10
    2a24:	003cdc93          	srl	s9,s9,0x3
    2a28:	feec0fa3          	sb	a4,-1(s8)
    2a2c:	019d67b3          	or	a5,s10,s9
    2a30:	000c0593          	mv	a1,s8
    2a34:	fffc0c13          	add	s8,s8,-1
    2a38:	fc079ce3          	bnez	a5,2a10 <_vfprintf_r+0xdb8>
    2a3c:	00167693          	and	a3,a2,1
    2a40:	06068a63          	beqz	a3,2ab4 <_vfprintf_r+0xe5c>
    2a44:	03000693          	li	a3,48
    2a48:	06d70663          	beq	a4,a3,2ab4 <_vfprintf_r+0xe5c>
    2a4c:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x3a6>
    2a50:	15010793          	add	a5,sp,336
    2a54:	fedc0fa3          	sb	a3,-1(s8)
    2a58:	40b78d33          	sub	s10,a5,a1
    2a5c:	00060e93          	mv	t4,a2
    2a60:	00058c13          	mv	s8,a1
    2a64:	c65ff06f          	j	26c8 <_vfprintf_r+0xa70>
    2a68:	00100713          	li	a4,1
    2a6c:	00e79463          	bne	a5,a4,2a74 <_vfprintf_r+0xe1c>
    2a70:	2b10106f          	j	4520 <_vfprintf_r+0x28c8>
    2a74:	00200713          	li	a4,2
    2a78:	000e8613          	mv	a2,t4
    2a7c:	f8e798e3          	bne	a5,a4,2a0c <_vfprintf_r+0xdb4>
    2a80:	03812683          	lw	a3,56(sp)
    2a84:	15010c13          	add	s8,sp,336
    2a88:	00fd7793          	and	a5,s10,15
    2a8c:	00f687b3          	add	a5,a3,a5
    2a90:	0007c703          	lbu	a4,0(a5)
    2a94:	004d5d13          	srl	s10,s10,0x4
    2a98:	01cc9793          	sll	a5,s9,0x1c
    2a9c:	01a7ed33          	or	s10,a5,s10
    2aa0:	004cdc93          	srl	s9,s9,0x4
    2aa4:	feec0fa3          	sb	a4,-1(s8)
    2aa8:	019d67b3          	or	a5,s10,s9
    2aac:	fffc0c13          	add	s8,s8,-1
    2ab0:	fc079ce3          	bnez	a5,2a88 <_vfprintf_r+0xe30>
    2ab4:	15010793          	add	a5,sp,336
    2ab8:	41878d33          	sub	s10,a5,s8
    2abc:	00060e93          	mv	t4,a2
    2ac0:	c09ff06f          	j	26c8 <_vfprintf_r+0xa70>
    2ac4:	419b8b33          	sub	s6,s7,s9
    2ac8:	c7605063          	blez	s6,1f28 <_vfprintf_r+0x2d0>
    2acc:	01000593          	li	a1,16
    2ad0:	0a412603          	lw	a2,164(sp)
    2ad4:	0000d297          	auipc	t0,0xd
    2ad8:	82c28293          	add	t0,t0,-2004 # f300 <zeroes.0>
    2adc:	0b65d463          	bge	a1,s6,2b84 <_vfprintf_r+0xf2c>
    2ae0:	00040793          	mv	a5,s0
    2ae4:	00048713          	mv	a4,s1
    2ae8:	000b0413          	mv	s0,s6
    2aec:	01000893          	li	a7,16
    2af0:	000a0b13          	mv	s6,s4
    2af4:	00700f93          	li	t6,7
    2af8:	05d12223          	sw	t4,68(sp)
    2afc:	05c12823          	sw	t3,80(sp)
    2b00:	00030a13          	mv	s4,t1
    2b04:	00028493          	mv	s1,t0
    2b08:	00c0006f          	j	2b14 <_vfprintf_r+0xebc>
    2b0c:	ff040413          	add	s0,s0,-16
    2b10:	0488da63          	bge	a7,s0,2b64 <_vfprintf_r+0xf0c>
    2b14:	01070713          	add	a4,a4,16
    2b18:	00160613          	add	a2,a2,1
    2b1c:	0097a023          	sw	s1,0(a5)
    2b20:	0117a223          	sw	a7,4(a5)
    2b24:	0ae12423          	sw	a4,168(sp)
    2b28:	0ac12223          	sw	a2,164(sp)
    2b2c:	00878793          	add	a5,a5,8
    2b30:	fccfdee3          	bge	t6,a2,2b0c <_vfprintf_r+0xeb4>
    2b34:	00812583          	lw	a1,8(sp)
    2b38:	0a010613          	add	a2,sp,160
    2b3c:	00098513          	mv	a0,s3
    2b40:	7d5010ef          	jal	4b14 <__sprint_r>
    2b44:	de051263          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2b48:	01000893          	li	a7,16
    2b4c:	ff040413          	add	s0,s0,-16
    2b50:	0a812703          	lw	a4,168(sp)
    2b54:	0a412603          	lw	a2,164(sp)
    2b58:	0ac10793          	add	a5,sp,172
    2b5c:	00700f93          	li	t6,7
    2b60:	fa88cae3          	blt	a7,s0,2b14 <_vfprintf_r+0xebc>
    2b64:	04412e83          	lw	t4,68(sp)
    2b68:	05012e03          	lw	t3,80(sp)
    2b6c:	000a0313          	mv	t1,s4
    2b70:	00048293          	mv	t0,s1
    2b74:	000b0a13          	mv	s4,s6
    2b78:	00070493          	mv	s1,a4
    2b7c:	00040b13          	mv	s6,s0
    2b80:	00078413          	mv	s0,a5
    2b84:	016484b3          	add	s1,s1,s6
    2b88:	00160613          	add	a2,a2,1
    2b8c:	00542023          	sw	t0,0(s0)
    2b90:	01642223          	sw	s6,4(s0)
    2b94:	0a912423          	sw	s1,168(sp)
    2b98:	0ac12223          	sw	a2,164(sp)
    2b9c:	00700713          	li	a4,7
    2ba0:	00840413          	add	s0,s0,8
    2ba4:	b8c75263          	bge	a4,a2,1f28 <_vfprintf_r+0x2d0>
    2ba8:	00812583          	lw	a1,8(sp)
    2bac:	0a010613          	add	a2,sp,160
    2bb0:	00098513          	mv	a0,s3
    2bb4:	04612a23          	sw	t1,84(sp)
    2bb8:	05c12823          	sw	t3,80(sp)
    2bbc:	05d12223          	sw	t4,68(sp)
    2bc0:	755010ef          	jal	4b14 <__sprint_r>
    2bc4:	d6051263          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2bc8:	0a812483          	lw	s1,168(sp)
    2bcc:	05412303          	lw	t1,84(sp)
    2bd0:	05012e03          	lw	t3,80(sp)
    2bd4:	04412e83          	lw	t4,68(sp)
    2bd8:	0ac10413          	add	s0,sp,172
    2bdc:	b4cff06f          	j	1f28 <_vfprintf_r+0x2d0>
    2be0:	01000713          	li	a4,16
    2be4:	0a412603          	lw	a2,164(sp)
    2be8:	0000c297          	auipc	t0,0xc
    2bec:	71828293          	add	t0,t0,1816 # f300 <zeroes.0>
    2bf0:	0b675063          	bge	a4,s6,2c90 <_vfprintf_r+0x1038>
    2bf4:	00040793          	mv	a5,s0
    2bf8:	00048693          	mv	a3,s1
    2bfc:	000b0413          	mv	s0,s6
    2c00:	01000713          	li	a4,16
    2c04:	00700893          	li	a7,7
    2c08:	05d12223          	sw	t4,68(sp)
    2c0c:	000e0493          	mv	s1,t3
    2c10:	00028b13          	mv	s6,t0
    2c14:	00c0006f          	j	2c20 <_vfprintf_r+0xfc8>
    2c18:	ff040413          	add	s0,s0,-16
    2c1c:	04875e63          	bge	a4,s0,2c78 <_vfprintf_r+0x1020>
    2c20:	01068693          	add	a3,a3,16
    2c24:	00160613          	add	a2,a2,1
    2c28:	0000c597          	auipc	a1,0xc
    2c2c:	6d858593          	add	a1,a1,1752 # f300 <zeroes.0>
    2c30:	00b7a023          	sw	a1,0(a5)
    2c34:	00e7a223          	sw	a4,4(a5)
    2c38:	0ad12423          	sw	a3,168(sp)
    2c3c:	0ac12223          	sw	a2,164(sp)
    2c40:	00878793          	add	a5,a5,8
    2c44:	fcc8dae3          	bge	a7,a2,2c18 <_vfprintf_r+0xfc0>
    2c48:	00812583          	lw	a1,8(sp)
    2c4c:	0a010613          	add	a2,sp,160
    2c50:	00098513          	mv	a0,s3
    2c54:	6c1010ef          	jal	4b14 <__sprint_r>
    2c58:	cc051863          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2c5c:	01000713          	li	a4,16
    2c60:	ff040413          	add	s0,s0,-16
    2c64:	0a812683          	lw	a3,168(sp)
    2c68:	0a412603          	lw	a2,164(sp)
    2c6c:	0ac10793          	add	a5,sp,172
    2c70:	00700893          	li	a7,7
    2c74:	fa8746e3          	blt	a4,s0,2c20 <_vfprintf_r+0xfc8>
    2c78:	04412e83          	lw	t4,68(sp)
    2c7c:	00048e13          	mv	t3,s1
    2c80:	000b0293          	mv	t0,s6
    2c84:	00068493          	mv	s1,a3
    2c88:	00040b13          	mv	s6,s0
    2c8c:	00078413          	mv	s0,a5
    2c90:	016484b3          	add	s1,s1,s6
    2c94:	00160613          	add	a2,a2,1
    2c98:	00542023          	sw	t0,0(s0)
    2c9c:	01642223          	sw	s6,4(s0)
    2ca0:	0a912423          	sw	s1,168(sp)
    2ca4:	0ac12223          	sw	a2,164(sp)
    2ca8:	00700713          	li	a4,7
    2cac:	00840413          	add	s0,s0,8
    2cb0:	a8c75063          	bge	a4,a2,1f30 <_vfprintf_r+0x2d8>
    2cb4:	00812583          	lw	a1,8(sp)
    2cb8:	0a010613          	add	a2,sp,160
    2cbc:	00098513          	mv	a0,s3
    2cc0:	05c12823          	sw	t3,80(sp)
    2cc4:	05d12223          	sw	t4,68(sp)
    2cc8:	64d010ef          	jal	4b14 <__sprint_r>
    2ccc:	c4051e63          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2cd0:	0a812483          	lw	s1,168(sp)
    2cd4:	05012e03          	lw	t3,80(sp)
    2cd8:	04412e83          	lw	t4,68(sp)
    2cdc:	0ac10413          	add	s0,sp,172
    2ce0:	a50ff06f          	j	1f30 <_vfprintf_r+0x2d8>
    2ce4:	00812583          	lw	a1,8(sp)
    2ce8:	0a010613          	add	a2,sp,160
    2cec:	00098513          	mv	a0,s3
    2cf0:	04612c23          	sw	t1,88(sp)
    2cf4:	05c12a23          	sw	t3,84(sp)
    2cf8:	05d12823          	sw	t4,80(sp)
    2cfc:	05f12223          	sw	t6,68(sp)
    2d00:	615010ef          	jal	4b14 <__sprint_r>
    2d04:	c2051263          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2d08:	0a812483          	lw	s1,168(sp)
    2d0c:	05812303          	lw	t1,88(sp)
    2d10:	05412e03          	lw	t3,84(sp)
    2d14:	05012e83          	lw	t4,80(sp)
    2d18:	04412f83          	lw	t6,68(sp)
    2d1c:	0ac10413          	add	s0,sp,172
    2d20:	a00ff06f          	j	1f20 <_vfprintf_r+0x2c8>
    2d24:	01000713          	li	a4,16
    2d28:	0a412783          	lw	a5,164(sp)
    2d2c:	0000cb17          	auipc	s6,0xc
    2d30:	5e4b0b13          	add	s6,s6,1508 # f310 <blanks.1>
    2d34:	07a75c63          	bge	a4,s10,2dac <_vfprintf_r+0x1154>
    2d38:	000b0713          	mv	a4,s6
    2d3c:	01000c13          	li	s8,16
    2d40:	00090b13          	mv	s6,s2
    2d44:	00700a13          	li	s4,7
    2d48:	00070913          	mv	s2,a4
    2d4c:	00c0006f          	j	2d58 <_vfprintf_r+0x1100>
    2d50:	ff0d0d13          	add	s10,s10,-16
    2d54:	05ac5663          	bge	s8,s10,2da0 <_vfprintf_r+0x1148>
    2d58:	01048493          	add	s1,s1,16
    2d5c:	00178793          	add	a5,a5,1
    2d60:	01242023          	sw	s2,0(s0)
    2d64:	01842223          	sw	s8,4(s0)
    2d68:	0a912423          	sw	s1,168(sp)
    2d6c:	0af12223          	sw	a5,164(sp)
    2d70:	00840413          	add	s0,s0,8
    2d74:	fcfa5ee3          	bge	s4,a5,2d50 <_vfprintf_r+0x10f8>
    2d78:	00812583          	lw	a1,8(sp)
    2d7c:	0a010613          	add	a2,sp,160
    2d80:	00098513          	mv	a0,s3
    2d84:	591010ef          	jal	4b14 <__sprint_r>
    2d88:	ba051063          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2d8c:	ff0d0d13          	add	s10,s10,-16
    2d90:	0a812483          	lw	s1,168(sp)
    2d94:	0a412783          	lw	a5,164(sp)
    2d98:	0ac10413          	add	s0,sp,172
    2d9c:	fbac4ee3          	blt	s8,s10,2d58 <_vfprintf_r+0x1100>
    2da0:	00090713          	mv	a4,s2
    2da4:	000b0913          	mv	s2,s6
    2da8:	00070b13          	mv	s6,a4
    2dac:	01a484b3          	add	s1,s1,s10
    2db0:	00178793          	add	a5,a5,1
    2db4:	01642023          	sw	s6,0(s0)
    2db8:	01a42223          	sw	s10,4(s0)
    2dbc:	0a912423          	sw	s1,168(sp)
    2dc0:	0af12223          	sw	a5,164(sp)
    2dc4:	00700713          	li	a4,7
    2dc8:	9af75463          	bge	a4,a5,1f70 <_vfprintf_r+0x318>
    2dcc:	00812583          	lw	a1,8(sp)
    2dd0:	0a010613          	add	a2,sp,160
    2dd4:	00098513          	mv	a0,s3
    2dd8:	53d010ef          	jal	4b14 <__sprint_r>
    2ddc:	b4051663          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2de0:	0a812483          	lw	s1,168(sp)
    2de4:	98cff06f          	j	1f70 <_vfprintf_r+0x318>
    2de8:	07c12683          	lw	a3,124(sp)
    2dec:	30d05c63          	blez	a3,3104 <_vfprintf_r+0x14ac>
    2df0:	01812783          	lw	a5,24(sp)
    2df4:	000a0b13          	mv	s6,s4
    2df8:	0147d463          	bge	a5,s4,2e00 <_vfprintf_r+0x11a8>
    2dfc:	00078b13          	mv	s6,a5
    2e00:	03605863          	blez	s6,2e30 <_vfprintf_r+0x11d8>
    2e04:	0a412683          	lw	a3,164(sp)
    2e08:	016484b3          	add	s1,s1,s6
    2e0c:	01842023          	sw	s8,0(s0)
    2e10:	00168693          	add	a3,a3,1
    2e14:	01642223          	sw	s6,4(s0)
    2e18:	0a912423          	sw	s1,168(sp)
    2e1c:	0ad12223          	sw	a3,164(sp)
    2e20:	00700613          	li	a2,7
    2e24:	00840413          	add	s0,s0,8
    2e28:	00d65463          	bge	a2,a3,2e30 <_vfprintf_r+0x11d8>
    2e2c:	5c40106f          	j	43f0 <_vfprintf_r+0x2798>
    2e30:	fffb4693          	not	a3,s6
    2e34:	41f6d693          	sra	a3,a3,0x1f
    2e38:	00db7733          	and	a4,s6,a3
    2e3c:	40ea0b33          	sub	s6,s4,a4
    2e40:	35604ae3          	bgtz	s6,3994 <_vfprintf_r+0x1d3c>
    2e44:	400ef713          	and	a4,t4,1024
    2e48:	014c0333          	add	t1,s8,s4
    2e4c:	00070463          	beqz	a4,2e54 <_vfprintf_r+0x11fc>
    2e50:	2980106f          	j	40e8 <_vfprintf_r+0x2490>
    2e54:	07c12d03          	lw	s10,124(sp)
    2e58:	01812783          	lw	a5,24(sp)
    2e5c:	5afd4063          	blt	s10,a5,33fc <_vfprintf_r+0x17a4>
    2e60:	001ef713          	and	a4,t4,1
    2e64:	58071c63          	bnez	a4,33fc <_vfprintf_r+0x17a4>
    2e68:	01812703          	lw	a4,24(sp)
    2e6c:	00ec07b3          	add	a5,s8,a4
    2e70:	41a70d33          	sub	s10,a4,s10
    2e74:	40678b33          	sub	s6,a5,t1
    2e78:	016d5463          	bge	s10,s6,2e80 <_vfprintf_r+0x1228>
    2e7c:	000d0b13          	mv	s6,s10
    2e80:	03605863          	blez	s6,2eb0 <_vfprintf_r+0x1258>
    2e84:	0a412703          	lw	a4,164(sp)
    2e88:	016484b3          	add	s1,s1,s6
    2e8c:	00642023          	sw	t1,0(s0)
    2e90:	00170713          	add	a4,a4,1
    2e94:	01642223          	sw	s6,4(s0)
    2e98:	0a912423          	sw	s1,168(sp)
    2e9c:	0ae12223          	sw	a4,164(sp)
    2ea0:	00700693          	li	a3,7
    2ea4:	00840413          	add	s0,s0,8
    2ea8:	00e6d463          	bge	a3,a4,2eb0 <_vfprintf_r+0x1258>
    2eac:	5880106f          	j	4434 <_vfprintf_r+0x27dc>
    2eb0:	fffb4713          	not	a4,s6
    2eb4:	41f75713          	sra	a4,a4,0x1f
    2eb8:	00eb77b3          	and	a5,s6,a4
    2ebc:	40fd0d33          	sub	s10,s10,a5
    2ec0:	8ba05063          	blez	s10,1f60 <_vfprintf_r+0x308>
    2ec4:	01000713          	li	a4,16
    2ec8:	0a412783          	lw	a5,164(sp)
    2ecc:	0000c297          	auipc	t0,0xc
    2ed0:	43428293          	add	t0,t0,1076 # f300 <zeroes.0>
    2ed4:	23a750e3          	bge	a4,s10,38f4 <_vfprintf_r+0x1c9c>
    2ed8:	00048713          	mv	a4,s1
    2edc:	01000c13          	li	s8,16
    2ee0:	00700b13          	li	s6,7
    2ee4:	000e8493          	mv	s1,t4
    2ee8:	00028a13          	mv	s4,t0
    2eec:	00c0006f          	j	2ef8 <_vfprintf_r+0x12a0>
    2ef0:	ff0d0d13          	add	s10,s10,-16
    2ef4:	1fac5ae3          	bge	s8,s10,38e8 <_vfprintf_r+0x1c90>
    2ef8:	01070713          	add	a4,a4,16
    2efc:	00178793          	add	a5,a5,1
    2f00:	01442023          	sw	s4,0(s0)
    2f04:	01842223          	sw	s8,4(s0)
    2f08:	0ae12423          	sw	a4,168(sp)
    2f0c:	0af12223          	sw	a5,164(sp)
    2f10:	00840413          	add	s0,s0,8
    2f14:	fcfb5ee3          	bge	s6,a5,2ef0 <_vfprintf_r+0x1298>
    2f18:	00812583          	lw	a1,8(sp)
    2f1c:	0a010613          	add	a2,sp,160
    2f20:	00098513          	mv	a0,s3
    2f24:	3f1010ef          	jal	4b14 <__sprint_r>
    2f28:	a0051063          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2f2c:	0a812703          	lw	a4,168(sp)
    2f30:	0a412783          	lw	a5,164(sp)
    2f34:	0ac10413          	add	s0,sp,172
    2f38:	fb9ff06f          	j	2ef0 <_vfprintf_r+0x1298>
    2f3c:	001ef613          	and	a2,t4,1
    2f40:	ce061063          	bnez	a2,2420 <_vfprintf_r+0x7c8>
    2f44:	00d42223          	sw	a3,4(s0)
    2f48:	0a912423          	sw	s1,168(sp)
    2f4c:	0ba12223          	sw	s10,164(sp)
    2f50:	00700793          	li	a5,7
    2f54:	d7a7d863          	bge	a5,s10,24c4 <_vfprintf_r+0x86c>
    2f58:	00812583          	lw	a1,8(sp)
    2f5c:	0a010613          	add	a2,sp,160
    2f60:	00098513          	mv	a0,s3
    2f64:	03d12023          	sw	t4,32(sp)
    2f68:	3ad010ef          	jal	4b14 <__sprint_r>
    2f6c:	9a051e63          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2f70:	0a812483          	lw	s1,168(sp)
    2f74:	0a412d03          	lw	s10,164(sp)
    2f78:	02012e83          	lw	t4,32(sp)
    2f7c:	0ac10b13          	add	s6,sp,172
    2f80:	d44ff06f          	j	24c4 <_vfprintf_r+0x86c>
    2f84:	01812703          	lw	a4,24(sp)
    2f88:	00100793          	li	a5,1
    2f8c:	d2e7dc63          	bge	a5,a4,24c4 <_vfprintf_r+0x86c>
    2f90:	01100793          	li	a5,17
    2f94:	0000c297          	auipc	t0,0xc
    2f98:	36c28293          	add	t0,t0,876 # f300 <zeroes.0>
    2f9c:	18e7d4e3          	bge	a5,a4,3924 <_vfprintf_r+0x1ccc>
    2fa0:	00040a13          	mv	s4,s0
    2fa4:	01000793          	li	a5,16
    2fa8:	00700c13          	li	s8,7
    2fac:	03d12023          	sw	t4,32(sp)
    2fb0:	00028413          	mv	s0,t0
    2fb4:	00c0006f          	j	2fc0 <_vfprintf_r+0x1368>
    2fb8:	ff0a0a13          	add	s4,s4,-16
    2fbc:	1547dee3          	bge	a5,s4,3918 <_vfprintf_r+0x1cc0>
    2fc0:	01048493          	add	s1,s1,16
    2fc4:	001d0d13          	add	s10,s10,1
    2fc8:	008b2023          	sw	s0,0(s6)
    2fcc:	00fb2223          	sw	a5,4(s6)
    2fd0:	0a912423          	sw	s1,168(sp)
    2fd4:	0ba12223          	sw	s10,164(sp)
    2fd8:	008b0b13          	add	s6,s6,8
    2fdc:	fdac5ee3          	bge	s8,s10,2fb8 <_vfprintf_r+0x1360>
    2fe0:	00812583          	lw	a1,8(sp)
    2fe4:	0a010613          	add	a2,sp,160
    2fe8:	00098513          	mv	a0,s3
    2fec:	329010ef          	jal	4b14 <__sprint_r>
    2ff0:	92051c63          	bnez	a0,2128 <_vfprintf_r+0x4d0>
    2ff4:	0a812483          	lw	s1,168(sp)
    2ff8:	0a412d03          	lw	s10,164(sp)
    2ffc:	0ac10b13          	add	s6,sp,172
    3000:	01000793          	li	a5,16
    3004:	fb5ff06f          	j	2fb8 <_vfprintf_r+0x1360>
    3008:	01412703          	lw	a4,20(sp)
    300c:	010ef793          	and	a5,t4,16
    3010:	00072d03          	lw	s10,0(a4)
    3014:	00470713          	add	a4,a4,4
    3018:	00e12a23          	sw	a4,20(sp)
    301c:	1a079663          	bnez	a5,31c8 <_vfprintf_r+0x1570>
    3020:	040ef793          	and	a5,t4,64
    3024:	18078e63          	beqz	a5,31c0 <_vfprintf_r+0x1568>
    3028:	010d1d13          	sll	s10,s10,0x10
    302c:	010d5d13          	srl	s10,s10,0x10
    3030:	00000c93          	li	s9,0
    3034:	80dff06f          	j	2840 <_vfprintf_r+0xbe8>
    3038:	01412703          	lw	a4,20(sp)
    303c:	01067793          	and	a5,a2,16
    3040:	00072d03          	lw	s10,0(a4)
    3044:	00470713          	add	a4,a4,4
    3048:	00e12a23          	sw	a4,20(sp)
    304c:	14079a63          	bnez	a5,31a0 <_vfprintf_r+0x1548>
    3050:	04067793          	and	a5,a2,64
    3054:	14078063          	beqz	a5,3194 <_vfprintf_r+0x153c>
    3058:	010d1d13          	sll	s10,s10,0x10
    305c:	010d5d13          	srl	s10,s10,0x10
    3060:	00000c93          	li	s9,0
    3064:	00100793          	li	a5,1
    3068:	e34ff06f          	j	269c <_vfprintf_r+0xa44>
    306c:	01412703          	lw	a4,20(sp)
    3070:	010ef793          	and	a5,t4,16
    3074:	00072d03          	lw	s10,0(a4)
    3078:	00470713          	add	a4,a4,4
    307c:	00e12a23          	sw	a4,20(sp)
    3080:	12079a63          	bnez	a5,31b4 <_vfprintf_r+0x155c>
    3084:	040ef793          	and	a5,t4,64
    3088:	12078263          	beqz	a5,31ac <_vfprintf_r+0x1554>
    308c:	010d1d13          	sll	s10,s10,0x10
    3090:	410d5d13          	sra	s10,s10,0x10
    3094:	41fd5c93          	sra	s9,s10,0x1f
    3098:	000c8793          	mv	a5,s9
    309c:	f207d663          	bgez	a5,27c8 <_vfprintf_r+0xb70>
    30a0:	01a037b3          	snez	a5,s10
    30a4:	419000b3          	neg	ra,s9
    30a8:	40f08cb3          	sub	s9,ra,a5
    30ac:	41a00d33          	neg	s10,s10
    30b0:	000e8613          	mv	a2,t4
    30b4:	02d00713          	li	a4,45
    30b8:	00100793          	li	a5,1
    30bc:	de4ff06f          	j	26a0 <_vfprintf_r+0xa48>
    30c0:	00812403          	lw	s0,8(sp)
    30c4:	00f12623          	sw	a5,12(sp)
    30c8:	05842503          	lw	a0,88(s0)
    30cc:	c31fd0ef          	jal	cfc <__retarget_lock_acquire_recursive>
    30d0:	00c41703          	lh	a4,12(s0)
    30d4:	00c12783          	lw	a5,12(sp)
    30d8:	c01fe06f          	j	1cd8 <_vfprintf_r+0x80>
    30dc:	001ef793          	and	a5,t4,1
    30e0:	00079463          	bnez	a5,30e8 <_vfprintf_r+0x1490>
    30e4:	e7dfe06f          	j	1f60 <_vfprintf_r+0x308>
    30e8:	85dff06f          	j	2944 <_vfprintf_r+0xcec>
    30ec:	000a0e93          	mv	t4,s4
    30f0:	000b0313          	mv	t1,s6
    30f4:	ea8ff06f          	j	279c <_vfprintf_r+0xb44>
    30f8:	00094e03          	lbu	t3,0(s2)
    30fc:	00f12a23          	sw	a5,20(sp)
    3100:	d09fe06f          	j	1e08 <_vfprintf_r+0x1b0>
    3104:	0a412703          	lw	a4,164(sp)
    3108:	0000c617          	auipc	a2,0xc
    310c:	d2860613          	add	a2,a2,-728 # ee30 <__fini_array_end+0x284>
    3110:	00c42023          	sw	a2,0(s0)
    3114:	00148493          	add	s1,s1,1
    3118:	00100613          	li	a2,1
    311c:	00170713          	add	a4,a4,1
    3120:	00c42223          	sw	a2,4(s0)
    3124:	0a912423          	sw	s1,168(sp)
    3128:	0ae12223          	sw	a4,164(sp)
    312c:	00700613          	li	a2,7
    3130:	00840413          	add	s0,s0,8
    3134:	2ee64ce3          	blt	a2,a4,3c2c <_vfprintf_r+0x1fd4>
    3138:	7e069e63          	bnez	a3,3934 <_vfprintf_r+0x1cdc>
    313c:	01812783          	lw	a5,24(sp)
    3140:	001ef713          	and	a4,t4,1
    3144:	00f76733          	or	a4,a4,a5
    3148:	00071463          	bnez	a4,3150 <_vfprintf_r+0x14f8>
    314c:	e15fe06f          	j	1f60 <_vfprintf_r+0x308>
    3150:	03412703          	lw	a4,52(sp)
    3154:	03012783          	lw	a5,48(sp)
    3158:	00700693          	li	a3,7
    315c:	00e42023          	sw	a4,0(s0)
    3160:	0a412703          	lw	a4,164(sp)
    3164:	009784b3          	add	s1,a5,s1
    3168:	00f42223          	sw	a5,4(s0)
    316c:	00170713          	add	a4,a4,1
    3170:	0a912423          	sw	s1,168(sp)
    3174:	0ae12223          	sw	a4,164(sp)
    3178:	38e6c8e3          	blt	a3,a4,3d08 <_vfprintf_r+0x20b0>
    317c:	00840413          	add	s0,s0,8
    3180:	7e80006f          	j	3968 <_vfprintf_r+0x1d10>
    3184:	03000793          	li	a5,48
    3188:	14f107a3          	sb	a5,335(sp)
    318c:	14f10c13          	add	s8,sp,335
    3190:	d38ff06f          	j	26c8 <_vfprintf_r+0xa70>
    3194:	20067793          	and	a5,a2,512
    3198:	00078463          	beqz	a5,31a0 <_vfprintf_r+0x1548>
    319c:	0ffd7d13          	zext.b	s10,s10
    31a0:	00000c93          	li	s9,0
    31a4:	00100793          	li	a5,1
    31a8:	cf4ff06f          	j	269c <_vfprintf_r+0xa44>
    31ac:	200ef793          	and	a5,t4,512
    31b0:	2c0796e3          	bnez	a5,3c7c <_vfprintf_r+0x2024>
    31b4:	41fd5c93          	sra	s9,s10,0x1f
    31b8:	000c8793          	mv	a5,s9
    31bc:	e08ff06f          	j	27c4 <_vfprintf_r+0xb6c>
    31c0:	200ef793          	and	a5,t4,512
    31c4:	2a0790e3          	bnez	a5,3c64 <_vfprintf_r+0x200c>
    31c8:	00000c93          	li	s9,0
    31cc:	e74ff06f          	j	2840 <_vfprintf_r+0xbe8>
    31d0:	01412783          	lw	a5,20(sp)
    31d4:	06010513          	add	a0,sp,96
    31d8:	03612223          	sw	s6,36(sp)
    31dc:	0007a703          	lw	a4,0(a5)
    31e0:	03c12023          	sw	t3,32(sp)
    31e4:	00478b13          	add	s6,a5,4
    31e8:	00072683          	lw	a3,0(a4)
    31ec:	01412823          	sw	s4,16(sp)
    31f0:	06d12023          	sw	a3,96(sp)
    31f4:	00472683          	lw	a3,4(a4)
    31f8:	06d12223          	sw	a3,100(sp)
    31fc:	00872683          	lw	a3,8(a4)
    3200:	06d12423          	sw	a3,104(sp)
    3204:	00c72703          	lw	a4,12(a4)
    3208:	06e12623          	sw	a4,108(sp)
    320c:	3cc0b0ef          	jal	e5d8 <__trunctfdf2>
    3210:	02012e03          	lw	t3,32(sp)
    3214:	02412303          	lw	t1,36(sp)
    3218:	02a12423          	sw	a0,40(sp)
    321c:	02b12623          	sw	a1,44(sp)
    3220:	01612a23          	sw	s6,20(sp)
    3224:	000a0e93          	mv	t4,s4
    3228:	fb1fe06f          	j	21d8 <_vfprintf_r+0x580>
    322c:	010a7793          	and	a5,s4,16
    3230:	6c079a63          	bnez	a5,3904 <_vfprintf_r+0x1cac>
    3234:	040a7793          	and	a5,s4,64
    3238:	24079ce3          	bnez	a5,3c90 <_vfprintf_r+0x2038>
    323c:	200a7f13          	and	t5,s4,512
    3240:	6c0f0263          	beqz	t5,3904 <_vfprintf_r+0x1cac>
    3244:	01412783          	lw	a5,20(sp)
    3248:	00c12703          	lw	a4,12(sp)
    324c:	0007a783          	lw	a5,0(a5)
    3250:	00e78023          	sb	a4,0(a5)
    3254:	e6cff06f          	j	28c0 <_vfprintf_r+0xc68>
    3258:	03c12783          	lw	a5,60(sp)
    325c:	00094e03          	lbu	t3,0(s2)
    3260:	00079463          	bnez	a5,3268 <_vfprintf_r+0x1610>
    3264:	ba5fe06f          	j	1e08 <_vfprintf_r+0x1b0>
    3268:	0007c783          	lbu	a5,0(a5)
    326c:	00079463          	bnez	a5,3274 <_vfprintf_r+0x161c>
    3270:	b99fe06f          	j	1e08 <_vfprintf_r+0x1b0>
    3274:	400a6a13          	or	s4,s4,1024
    3278:	b91fe06f          	j	1e08 <_vfprintf_r+0x1b0>
    327c:	fff00b13          	li	s6,-1
    3280:	00068913          	mv	s2,a3
    3284:	b89fe06f          	j	1e0c <_vfprintf_r+0x1b4>
    3288:	0000c797          	auipc	a5,0xc
    328c:	b8c78793          	add	a5,a5,-1140 # ee14 <__fini_array_end+0x268>
    3290:	000a0e93          	mv	t4,s4
    3294:	000b0313          	mv	t1,s6
    3298:	02f12c23          	sw	a5,56(sp)
    329c:	020ef793          	and	a5,t4,32
    32a0:	1c078263          	beqz	a5,3464 <_vfprintf_r+0x180c>
    32a4:	01412783          	lw	a5,20(sp)
    32a8:	00778b13          	add	s6,a5,7
    32ac:	ff8b7b13          	and	s6,s6,-8
    32b0:	000b2d03          	lw	s10,0(s6)
    32b4:	004b2c83          	lw	s9,4(s6)
    32b8:	008b0793          	add	a5,s6,8
    32bc:	00f12a23          	sw	a5,20(sp)
    32c0:	001ef793          	and	a5,t4,1
    32c4:	00078e63          	beqz	a5,32e0 <_vfprintf_r+0x1688>
    32c8:	019d67b3          	or	a5,s10,s9
    32cc:	00078a63          	beqz	a5,32e0 <_vfprintf_r+0x1688>
    32d0:	03000793          	li	a5,48
    32d4:	06f10c23          	sb	a5,120(sp)
    32d8:	07c10ca3          	sb	t3,121(sp)
    32dc:	002eee93          	or	t4,t4,2
    32e0:	bffef613          	and	a2,t4,-1025
    32e4:	00200793          	li	a5,2
    32e8:	bb4ff06f          	j	269c <_vfprintf_r+0xa44>
    32ec:	000b0313          	mv	t1,s6
    32f0:	000a0613          	mv	a2,s4
    32f4:	b80ff06f          	j	2674 <_vfprintf_r+0xa1c>
    32f8:	000a0e93          	mv	t4,s4
    32fc:	000b0313          	mv	t1,s6
    3300:	d1cff06f          	j	281c <_vfprintf_r+0xbc4>
    3304:	0000c797          	auipc	a5,0xc
    3308:	afc78793          	add	a5,a5,-1284 # ee00 <__fini_array_end+0x254>
    330c:	000a0e93          	mv	t4,s4
    3310:	000b0313          	mv	t1,s6
    3314:	02f12c23          	sw	a5,56(sp)
    3318:	f85ff06f          	j	329c <_vfprintf_r+0x1644>
    331c:	00194e03          	lbu	t3,1(s2)
    3320:	020a6a13          	or	s4,s4,32
    3324:	00190913          	add	s2,s2,1
    3328:	ae1fe06f          	j	1e08 <_vfprintf_r+0x1b0>
    332c:	00194e03          	lbu	t3,1(s2)
    3330:	200a6a13          	or	s4,s4,512
    3334:	00190913          	add	s2,s2,1
    3338:	ad1fe06f          	j	1e08 <_vfprintf_r+0x1b0>
    333c:	00812583          	lw	a1,8(sp)
    3340:	0a010613          	add	a2,sp,160
    3344:	00098513          	mv	a0,s3
    3348:	03d12023          	sw	t4,32(sp)
    334c:	7c8010ef          	jal	4b14 <__sprint_r>
    3350:	00050463          	beqz	a0,3358 <_vfprintf_r+0x1700>
    3354:	dd5fe06f          	j	2128 <_vfprintf_r+0x4d0>
    3358:	0a812483          	lw	s1,168(sp)
    335c:	02012e83          	lw	t4,32(sp)
    3360:	0ac10413          	add	s0,sp,172
    3364:	e10ff06f          	j	2974 <_vfprintf_r+0xd1c>
    3368:	00600793          	li	a5,6
    336c:	00030c93          	mv	s9,t1
    3370:	0e67e6e3          	bltu	a5,t1,3c5c <_vfprintf_r+0x2004>
    3374:	01612a23          	sw	s6,20(sp)
    3378:	00012823          	sw	zero,16(sp)
    337c:	000c8d13          	mv	s10,s9
    3380:	00000613          	li	a2,0
    3384:	00000313          	li	t1,0
    3388:	02012223          	sw	zero,36(sp)
    338c:	02012023          	sw	zero,32(sp)
    3390:	00000a13          	li	s4,0
    3394:	0000cc17          	auipc	s8,0xc
    3398:	a94c0c13          	add	s8,s8,-1388 # ee28 <__fini_array_end+0x27c>
    339c:	afdfe06f          	j	1e98 <_vfprintf_r+0x240>
    33a0:	00800613          	li	a2,8
    33a4:	00000593          	li	a1,0
    33a8:	09810513          	add	a0,sp,152
    33ac:	03c12023          	sw	t3,32(sp)
    33b0:	01d12823          	sw	t4,16(sp)
    33b4:	951fd0ef          	jal	d04 <memset>
    33b8:	01412783          	lw	a5,20(sp)
    33bc:	0ec10c13          	add	s8,sp,236
    33c0:	09810693          	add	a3,sp,152
    33c4:	0007a603          	lw	a2,0(a5)
    33c8:	000c0593          	mv	a1,s8
    33cc:	00098513          	mv	a0,s3
    33d0:	2a4070ef          	jal	a674 <_wcrtomb_r>
    33d4:	fff00793          	li	a5,-1
    33d8:	01012e83          	lw	t4,16(sp)
    33dc:	02012e03          	lw	t3,32(sp)
    33e0:	00050d13          	mv	s10,a0
    33e4:	00f51463          	bne	a0,a5,33ec <_vfprintf_r+0x1794>
    33e8:	4980106f          	j	4880 <_vfprintf_r+0x2c28>
    33ec:	fff54813          	not	a6,a0
    33f0:	41f85813          	sra	a6,a6,0x1f
    33f4:	01057cb3          	and	s9,a0,a6
    33f8:	97cff06f          	j	2574 <_vfprintf_r+0x91c>
    33fc:	03412703          	lw	a4,52(sp)
    3400:	03012783          	lw	a5,48(sp)
    3404:	00700693          	li	a3,7
    3408:	00e42023          	sw	a4,0(s0)
    340c:	0a412703          	lw	a4,164(sp)
    3410:	00f484b3          	add	s1,s1,a5
    3414:	00f42223          	sw	a5,4(s0)
    3418:	00170713          	add	a4,a4,1
    341c:	0a912423          	sw	s1,168(sp)
    3420:	0ae12223          	sw	a4,164(sp)
    3424:	00840413          	add	s0,s0,8
    3428:	a4e6d0e3          	bge	a3,a4,2e68 <_vfprintf_r+0x1210>
    342c:	00812583          	lw	a1,8(sp)
    3430:	0a010613          	add	a2,sp,160
    3434:	00098513          	mv	a0,s3
    3438:	02612223          	sw	t1,36(sp)
    343c:	03d12023          	sw	t4,32(sp)
    3440:	6d4010ef          	jal	4b14 <__sprint_r>
    3444:	00050463          	beqz	a0,344c <_vfprintf_r+0x17f4>
    3448:	ce1fe06f          	j	2128 <_vfprintf_r+0x4d0>
    344c:	07c12d03          	lw	s10,124(sp)
    3450:	0a812483          	lw	s1,168(sp)
    3454:	02412303          	lw	t1,36(sp)
    3458:	02012e83          	lw	t4,32(sp)
    345c:	0ac10413          	add	s0,sp,172
    3460:	a09ff06f          	j	2e68 <_vfprintf_r+0x1210>
    3464:	01412703          	lw	a4,20(sp)
    3468:	010ef793          	and	a5,t4,16
    346c:	00072d03          	lw	s10,0(a4)
    3470:	00470713          	add	a4,a4,4
    3474:	00e12a23          	sw	a4,20(sp)
    3478:	08079863          	bnez	a5,3508 <_vfprintf_r+0x18b0>
    347c:	040ef793          	and	a5,t4,64
    3480:	08078063          	beqz	a5,3500 <_vfprintf_r+0x18a8>
    3484:	010d1d13          	sll	s10,s10,0x10
    3488:	010d5d13          	srl	s10,s10,0x10
    348c:	00000c93          	li	s9,0
    3490:	e31ff06f          	j	32c0 <_vfprintf_r+0x1668>
    3494:	00000d13          	li	s10,0
    3498:	15010c13          	add	s8,sp,336
    349c:	a2cff06f          	j	26c8 <_vfprintf_r+0xa70>
    34a0:	00812583          	lw	a1,8(sp)
    34a4:	0a010613          	add	a2,sp,160
    34a8:	00098513          	mv	a0,s3
    34ac:	03d12023          	sw	t4,32(sp)
    34b0:	664010ef          	jal	4b14 <__sprint_r>
    34b4:	00050463          	beqz	a0,34bc <_vfprintf_r+0x1864>
    34b8:	c71fe06f          	j	2128 <_vfprintf_r+0x4d0>
    34bc:	0a812483          	lw	s1,168(sp)
    34c0:	0a412d03          	lw	s10,164(sp)
    34c4:	02012e83          	lw	t4,32(sp)
    34c8:	0ac10b13          	add	s6,sp,172
    34cc:	f71fe06f          	j	243c <_vfprintf_r+0x7e4>
    34d0:	00812583          	lw	a1,8(sp)
    34d4:	0a010613          	add	a2,sp,160
    34d8:	00098513          	mv	a0,s3
    34dc:	03d12023          	sw	t4,32(sp)
    34e0:	634010ef          	jal	4b14 <__sprint_r>
    34e4:	00050463          	beqz	a0,34ec <_vfprintf_r+0x1894>
    34e8:	c41fe06f          	j	2128 <_vfprintf_r+0x4d0>
    34ec:	0a812483          	lw	s1,168(sp)
    34f0:	0a412d03          	lw	s10,164(sp)
    34f4:	02012e83          	lw	t4,32(sp)
    34f8:	0ac10b13          	add	s6,sp,172
    34fc:	f71fe06f          	j	246c <_vfprintf_r+0x814>
    3500:	200ef793          	and	a5,t4,512
    3504:	76079663          	bnez	a5,3c70 <_vfprintf_r+0x2018>
    3508:	00000c93          	li	s9,0
    350c:	db5ff06f          	j	32c0 <_vfprintf_r+0x1668>
    3510:	00000793          	li	a5,0
    3514:	15010b13          	add	s6,sp,336
    3518:	01212823          	sw	s2,16(sp)
    351c:	00078913          	mv	s2,a5
    3520:	00098793          	mv	a5,s3
    3524:	04812823          	sw	s0,80(sp)
    3528:	000b0993          	mv	s3,s6
    352c:	03c12403          	lw	s0,60(sp)
    3530:	40067493          	and	s1,a2,1024
    3534:	0ff00a13          	li	s4,255
    3538:	03c12023          	sw	t3,32(sp)
    353c:	02c12223          	sw	a2,36(sp)
    3540:	04612223          	sw	t1,68(sp)
    3544:	00078b13          	mv	s6,a5
    3548:	0280006f          	j	3570 <_vfprintf_r+0x1918>
    354c:	00a00613          	li	a2,10
    3550:	00000693          	li	a3,0
    3554:	000d0513          	mv	a0,s10
    3558:	000c8593          	mv	a1,s9
    355c:	485070ef          	jal	b1e0 <__udivdi3>
    3560:	6a0c8ee3          	beqz	s9,441c <_vfprintf_r+0x27c4>
    3564:	00050d13          	mv	s10,a0
    3568:	00058c93          	mv	s9,a1
    356c:	000c0993          	mv	s3,s8
    3570:	00a00613          	li	a2,10
    3574:	00000693          	li	a3,0
    3578:	000d0513          	mv	a0,s10
    357c:	000c8593          	mv	a1,s9
    3580:	30c080ef          	jal	b88c <__umoddi3>
    3584:	03050513          	add	a0,a0,48
    3588:	fea98fa3          	sb	a0,-1(s3)
    358c:	fff98c13          	add	s8,s3,-1
    3590:	00190913          	add	s2,s2,1
    3594:	fa048ce3          	beqz	s1,354c <_vfprintf_r+0x18f4>
    3598:	00044783          	lbu	a5,0(s0)
    359c:	faf918e3          	bne	s2,a5,354c <_vfprintf_r+0x18f4>
    35a0:	fb4906e3          	beq	s2,s4,354c <_vfprintf_r+0x18f4>
    35a4:	560c9ae3          	bnez	s9,4318 <_vfprintf_r+0x26c0>
    35a8:	00900793          	li	a5,9
    35ac:	57a7e6e3          	bltu	a5,s10,4318 <_vfprintf_r+0x26c0>
    35b0:	02412603          	lw	a2,36(sp)
    35b4:	15010793          	add	a5,sp,336
    35b8:	02812e23          	sw	s0,60(sp)
    35bc:	01212c23          	sw	s2,24(sp)
    35c0:	02012e03          	lw	t3,32(sp)
    35c4:	01012903          	lw	s2,16(sp)
    35c8:	04412303          	lw	t1,68(sp)
    35cc:	05012403          	lw	s0,80(sp)
    35d0:	000b0993          	mv	s3,s6
    35d4:	41878d33          	sub	s10,a5,s8
    35d8:	00060e93          	mv	t4,a2
    35dc:	8ecff06f          	j	26c8 <_vfprintf_r+0xa70>
    35e0:	00812583          	lw	a1,8(sp)
    35e4:	0a010613          	add	a2,sp,160
    35e8:	00098513          	mv	a0,s3
    35ec:	04612e23          	sw	t1,92(sp)
    35f0:	05c12c23          	sw	t3,88(sp)
    35f4:	05d12a23          	sw	t4,84(sp)
    35f8:	05f12823          	sw	t6,80(sp)
    35fc:	04512223          	sw	t0,68(sp)
    3600:	514010ef          	jal	4b14 <__sprint_r>
    3604:	00050463          	beqz	a0,360c <_vfprintf_r+0x19b4>
    3608:	b21fe06f          	j	2128 <_vfprintf_r+0x4d0>
    360c:	07714603          	lbu	a2,119(sp)
    3610:	0a812483          	lw	s1,168(sp)
    3614:	05c12303          	lw	t1,92(sp)
    3618:	05812e03          	lw	t3,88(sp)
    361c:	05412e83          	lw	t4,84(sp)
    3620:	05012f83          	lw	t6,80(sp)
    3624:	04412283          	lw	t0,68(sp)
    3628:	0ac10413          	add	s0,sp,172
    362c:	88dfe06f          	j	1eb8 <_vfprintf_r+0x260>
    3630:	02812883          	lw	a7,40(sp)
    3634:	02c12703          	lw	a4,44(sp)
    3638:	02612223          	sw	t1,36(sp)
    363c:	00088613          	mv	a2,a7
    3640:	00088513          	mv	a0,a7
    3644:	00070693          	mv	a3,a4
    3648:	00070593          	mv	a1,a4
    364c:	03c12023          	sw	t3,32(sp)
    3650:	01d12823          	sw	t4,16(sp)
    3654:	5310a0ef          	jal	e384 <__unorddf2>
    3658:	01012e83          	lw	t4,16(sp)
    365c:	02012e03          	lw	t3,32(sp)
    3660:	02412303          	lw	t1,36(sp)
    3664:	00050463          	beqz	a0,366c <_vfprintf_r+0x1a14>
    3668:	0e00106f          	j	4748 <_vfprintf_r+0x2af0>
    366c:	06100713          	li	a4,97
    3670:	08ee0263          	beq	t3,a4,36f4 <_vfprintf_r+0x1a9c>
    3674:	04100713          	li	a4,65
    3678:	05800793          	li	a5,88
    367c:	06ee0e63          	beq	t3,a4,36f8 <_vfprintf_r+0x1aa0>
    3680:	fff00713          	li	a4,-1
    3684:	00e31463          	bne	t1,a4,368c <_vfprintf_r+0x1a34>
    3688:	01c0106f          	j	46a4 <_vfprintf_r+0x2a4c>
    368c:	fdfe7713          	and	a4,t3,-33
    3690:	04700693          	li	a3,71
    3694:	00012823          	sw	zero,16(sp)
    3698:	00d71663          	bne	a4,a3,36a4 <_vfprintf_r+0x1a4c>
    369c:	00031463          	bnez	t1,36a4 <_vfprintf_r+0x1a4c>
    36a0:	00100313          	li	t1,1
    36a4:	100ee793          	or	a5,t4,256
    36a8:	00078b13          	mv	s6,a5
    36ac:	02c12783          	lw	a5,44(sp)
    36b0:	04012223          	sw	zero,68(sp)
    36b4:	00078493          	mv	s1,a5
    36b8:	0007da63          	bgez	a5,36cc <_vfprintf_r+0x1a74>
    36bc:	800004b7          	lui	s1,0x80000
    36c0:	00f4c4b3          	xor	s1,s1,a5
    36c4:	02d00793          	li	a5,45
    36c8:	04f12223          	sw	a5,68(sp)
    36cc:	fbfe0713          	add	a4,t3,-65
    36d0:	02500693          	li	a3,37
    36d4:	3ae6e463          	bltu	a3,a4,3a7c <_vfprintf_r+0x1e24>
    36d8:	0000c697          	auipc	a3,0xc
    36dc:	b9068693          	add	a3,a3,-1136 # f268 <_ctype_+0x270>
    36e0:	00271713          	sll	a4,a4,0x2
    36e4:	00d70733          	add	a4,a4,a3
    36e8:	00072703          	lw	a4,0(a4)
    36ec:	00d70733          	add	a4,a4,a3
    36f0:	00070067          	jr	a4
    36f4:	07800793          	li	a5,120
    36f8:	03000713          	li	a4,48
    36fc:	06e10c23          	sb	a4,120(sp)
    3700:	06f10ca3          	sb	a5,121(sp)
    3704:	06300713          	li	a4,99
    3708:	00012823          	sw	zero,16(sp)
    370c:	002eee93          	or	t4,t4,2
    3710:	0ec10c13          	add	s8,sp,236
    3714:	f86758e3          	bge	a4,t1,36a4 <_vfprintf_r+0x1a4c>
    3718:	00130593          	add	a1,t1,1
    371c:	00098513          	mv	a0,s3
    3720:	03c12023          	sw	t3,32(sp)
    3724:	01d12c23          	sw	t4,24(sp)
    3728:	00612823          	sw	t1,16(sp)
    372c:	d35fd0ef          	jal	1460 <_malloc_r>
    3730:	01012303          	lw	t1,16(sp)
    3734:	01812e83          	lw	t4,24(sp)
    3738:	02012e03          	lw	t3,32(sp)
    373c:	00050c13          	mv	s8,a0
    3740:	00051463          	bnez	a0,3748 <_vfprintf_r+0x1af0>
    3744:	13c0106f          	j	4880 <_vfprintf_r+0x2c28>
    3748:	00a12823          	sw	a0,16(sp)
    374c:	f59ff06f          	j	36a4 <_vfprintf_r+0x1a4c>
    3750:	00098513          	mv	a0,s3
    3754:	1d0030ef          	jal	6924 <__sinit>
    3758:	00c12783          	lw	a5,12(sp)
    375c:	d5cfe06f          	j	1cb8 <_vfprintf_r+0x60>
    3760:	00812583          	lw	a1,8(sp)
    3764:	0a010613          	add	a2,sp,160
    3768:	00098513          	mv	a0,s3
    376c:	03d12023          	sw	t4,32(sp)
    3770:	3a4010ef          	jal	4b14 <__sprint_r>
    3774:	00050463          	beqz	a0,377c <_vfprintf_r+0x1b24>
    3778:	9b1fe06f          	j	2128 <_vfprintf_r+0x4d0>
    377c:	0a812483          	lw	s1,168(sp)
    3780:	02012e83          	lw	t4,32(sp)
    3784:	0ac10413          	add	s0,sp,172
    3788:	9b0ff06f          	j	2938 <_vfprintf_r+0xce0>
    378c:	00800613          	li	a2,8
    3790:	00000593          	li	a1,0
    3794:	09810513          	add	a0,sp,152
    3798:	02612023          	sw	t1,32(sp)
    379c:	01c12a23          	sw	t3,20(sp)
    37a0:	01d12823          	sw	t4,16(sp)
    37a4:	09812223          	sw	s8,132(sp)
    37a8:	d5cfd0ef          	jal	d04 <memset>
    37ac:	02012303          	lw	t1,32(sp)
    37b0:	01012e83          	lw	t4,16(sp)
    37b4:	01412e03          	lw	t3,20(sp)
    37b8:	3a0340e3          	bltz	t1,4358 <_vfprintf_r+0x2700>
    37bc:	00000d13          	li	s10,0
    37c0:	01212823          	sw	s2,16(sp)
    37c4:	000c0c93          	mv	s9,s8
    37c8:	fff00493          	li	s1,-1
    37cc:	000b0c13          	mv	s8,s6
    37d0:	000e8a13          	mv	s4,t4
    37d4:	00040b13          	mv	s6,s0
    37d8:	000d0913          	mv	s2,s10
    37dc:	00030413          	mv	s0,t1
    37e0:	0300006f          	j	3810 <_vfprintf_r+0x1bb8>
    37e4:	09810693          	add	a3,sp,152
    37e8:	0ec10593          	add	a1,sp,236
    37ec:	00098513          	mv	a0,s3
    37f0:	685060ef          	jal	a674 <_wcrtomb_r>
    37f4:	68950ae3          	beq	a0,s1,4688 <_vfprintf_r+0x2a30>
    37f8:	00a907b3          	add	a5,s2,a0
    37fc:	02f44263          	blt	s0,a5,3820 <_vfprintf_r+0x1bc8>
    3800:	004d0d13          	add	s10,s10,4
    3804:	00879463          	bne	a5,s0,380c <_vfprintf_r+0x1bb4>
    3808:	7990006f          	j	47a0 <_vfprintf_r+0x2b48>
    380c:	00078913          	mv	s2,a5
    3810:	08412783          	lw	a5,132(sp)
    3814:	01a787b3          	add	a5,a5,s10
    3818:	0007a603          	lw	a2,0(a5)
    381c:	fc0614e3          	bnez	a2,37e4 <_vfprintf_r+0x1b8c>
    3820:	00090d13          	mv	s10,s2
    3824:	01412e03          	lw	t3,20(sp)
    3828:	01012903          	lw	s2,16(sp)
    382c:	000b0413          	mv	s0,s6
    3830:	000a0e93          	mv	t4,s4
    3834:	000c0b13          	mv	s6,s8
    3838:	000c8c13          	mv	s8,s9
    383c:	340d0ce3          	beqz	s10,4394 <_vfprintf_r+0x273c>
    3840:	06300793          	li	a5,99
    3844:	59a7dee3          	bge	a5,s10,45e0 <_vfprintf_r+0x2988>
    3848:	001d0593          	add	a1,s10,1
    384c:	00098513          	mv	a0,s3
    3850:	01c12a23          	sw	t3,20(sp)
    3854:	01d12823          	sw	t4,16(sp)
    3858:	c09fd0ef          	jal	1460 <_malloc_r>
    385c:	01012e83          	lw	t4,16(sp)
    3860:	01412e03          	lw	t3,20(sp)
    3864:	00050c13          	mv	s8,a0
    3868:	620500e3          	beqz	a0,4688 <_vfprintf_r+0x2a30>
    386c:	00a12823          	sw	a0,16(sp)
    3870:	00800613          	li	a2,8
    3874:	00000593          	li	a1,0
    3878:	09810513          	add	a0,sp,152
    387c:	03c12023          	sw	t3,32(sp)
    3880:	01d12a23          	sw	t4,20(sp)
    3884:	c80fd0ef          	jal	d04 <memset>
    3888:	09810713          	add	a4,sp,152
    388c:	000d0693          	mv	a3,s10
    3890:	08410613          	add	a2,sp,132
    3894:	000c0593          	mv	a1,s8
    3898:	00098513          	mv	a0,s3
    389c:	665060ef          	jal	a700 <_wcsrtombs_r>
    38a0:	01412e83          	lw	t4,20(sp)
    38a4:	02012e03          	lw	t3,32(sp)
    38a8:	00ad0463          	beq	s10,a0,38b0 <_vfprintf_r+0x1c58>
    38ac:	0240106f          	j	48d0 <_vfprintf_r+0x2c78>
    38b0:	01ac0733          	add	a4,s8,s10
    38b4:	00070023          	sb	zero,0(a4)
    38b8:	07714603          	lbu	a2,119(sp)
    38bc:	fffd4813          	not	a6,s10
    38c0:	41f85813          	sra	a6,a6,0x1f
    38c4:	01612a23          	sw	s6,20(sp)
    38c8:	02012223          	sw	zero,36(sp)
    38cc:	02012023          	sw	zero,32(sp)
    38d0:	010d7cb3          	and	s9,s10,a6
    38d4:	00000313          	li	t1,0
    38d8:	00000a13          	li	s4,0
    38dc:	00061463          	bnez	a2,38e4 <_vfprintf_r+0x1c8c>
    38e0:	db8fe06f          	j	1e98 <_vfprintf_r+0x240>
    38e4:	9d5fe06f          	j	22b8 <_vfprintf_r+0x660>
    38e8:	00048e93          	mv	t4,s1
    38ec:	000a0293          	mv	t0,s4
    38f0:	00070493          	mv	s1,a4
    38f4:	01a484b3          	add	s1,s1,s10
    38f8:	00178793          	add	a5,a5,1
    38fc:	00542023          	sw	t0,0(s0)
    3900:	e48fe06f          	j	1f48 <_vfprintf_r+0x2f0>
    3904:	01412783          	lw	a5,20(sp)
    3908:	00c12703          	lw	a4,12(sp)
    390c:	0007a783          	lw	a5,0(a5)
    3910:	00e7a023          	sw	a4,0(a5)
    3914:	fadfe06f          	j	28c0 <_vfprintf_r+0xc68>
    3918:	02012e83          	lw	t4,32(sp)
    391c:	00040293          	mv	t0,s0
    3920:	000a0413          	mv	s0,s4
    3924:	008484b3          	add	s1,s1,s0
    3928:	001d0d13          	add	s10,s10,1
    392c:	005b2023          	sw	t0,0(s6)
    3930:	b7dfe06f          	j	24ac <_vfprintf_r+0x854>
    3934:	03412703          	lw	a4,52(sp)
    3938:	03012783          	lw	a5,48(sp)
    393c:	00700613          	li	a2,7
    3940:	00e42023          	sw	a4,0(s0)
    3944:	0a412703          	lw	a4,164(sp)
    3948:	009784b3          	add	s1,a5,s1
    394c:	00f42223          	sw	a5,4(s0)
    3950:	00170713          	add	a4,a4,1
    3954:	0a912423          	sw	s1,168(sp)
    3958:	0ae12223          	sw	a4,164(sp)
    395c:	00840413          	add	s0,s0,8
    3960:	3ae64463          	blt	a2,a4,3d08 <_vfprintf_r+0x20b0>
    3964:	3e06cee3          	bltz	a3,4560 <_vfprintf_r+0x2908>
    3968:	01812783          	lw	a5,24(sp)
    396c:	00170713          	add	a4,a4,1
    3970:	01842023          	sw	s8,0(s0)
    3974:	009784b3          	add	s1,a5,s1
    3978:	00f42223          	sw	a5,4(s0)
    397c:	0a912423          	sw	s1,168(sp)
    3980:	0ae12223          	sw	a4,164(sp)
    3984:	00700793          	li	a5,7
    3988:	00e7c463          	blt	a5,a4,3990 <_vfprintf_r+0x1d38>
    398c:	dd0fe06f          	j	1f5c <_vfprintf_r+0x304>
    3990:	b61fe06f          	j	24f0 <_vfprintf_r+0x898>
    3994:	01000613          	li	a2,16
    3998:	0a412683          	lw	a3,164(sp)
    399c:	0000c297          	auipc	t0,0xc
    39a0:	96428293          	add	t0,t0,-1692 # f300 <zeroes.0>
    39a4:	09665463          	bge	a2,s6,3a2c <_vfprintf_r+0x1dd4>
    39a8:	00040793          	mv	a5,s0
    39ac:	00048713          	mv	a4,s1
    39b0:	00812403          	lw	s0,8(sp)
    39b4:	01000893          	li	a7,16
    39b8:	00700d13          	li	s10,7
    39bc:	05d12223          	sw	t4,68(sp)
    39c0:	00028493          	mv	s1,t0
    39c4:	00c0006f          	j	39d0 <_vfprintf_r+0x1d78>
    39c8:	ff0b0b13          	add	s6,s6,-16
    39cc:	0568d863          	bge	a7,s6,3a1c <_vfprintf_r+0x1dc4>
    39d0:	01070713          	add	a4,a4,16
    39d4:	00168693          	add	a3,a3,1
    39d8:	0097a023          	sw	s1,0(a5)
    39dc:	0117a223          	sw	a7,4(a5)
    39e0:	0ae12423          	sw	a4,168(sp)
    39e4:	0ad12223          	sw	a3,164(sp)
    39e8:	00878793          	add	a5,a5,8
    39ec:	fcdd5ee3          	bge	s10,a3,39c8 <_vfprintf_r+0x1d70>
    39f0:	0a010613          	add	a2,sp,160
    39f4:	00040593          	mv	a1,s0
    39f8:	00098513          	mv	a0,s3
    39fc:	118010ef          	jal	4b14 <__sprint_r>
    3a00:	00050463          	beqz	a0,3a08 <_vfprintf_r+0x1db0>
    3a04:	f24fe06f          	j	2128 <_vfprintf_r+0x4d0>
    3a08:	0a812703          	lw	a4,168(sp)
    3a0c:	0a412683          	lw	a3,164(sp)
    3a10:	0ac10793          	add	a5,sp,172
    3a14:	01000893          	li	a7,16
    3a18:	fb1ff06f          	j	39c8 <_vfprintf_r+0x1d70>
    3a1c:	04412e83          	lw	t4,68(sp)
    3a20:	00048293          	mv	t0,s1
    3a24:	00078413          	mv	s0,a5
    3a28:	00070493          	mv	s1,a4
    3a2c:	016484b3          	add	s1,s1,s6
    3a30:	00168693          	add	a3,a3,1
    3a34:	00542023          	sw	t0,0(s0)
    3a38:	01642223          	sw	s6,4(s0)
    3a3c:	0a912423          	sw	s1,168(sp)
    3a40:	0ad12223          	sw	a3,164(sp)
    3a44:	00700713          	li	a4,7
    3a48:	00840413          	add	s0,s0,8
    3a4c:	bed75c63          	bge	a4,a3,2e44 <_vfprintf_r+0x11ec>
    3a50:	00812583          	lw	a1,8(sp)
    3a54:	0a010613          	add	a2,sp,160
    3a58:	00098513          	mv	a0,s3
    3a5c:	05d12223          	sw	t4,68(sp)
    3a60:	0b4010ef          	jal	4b14 <__sprint_r>
    3a64:	00050463          	beqz	a0,3a6c <_vfprintf_r+0x1e14>
    3a68:	ec0fe06f          	j	2128 <_vfprintf_r+0x4d0>
    3a6c:	0a812483          	lw	s1,168(sp)
    3a70:	04412e83          	lw	t4,68(sp)
    3a74:	0ac10413          	add	s0,sp,172
    3a78:	bccff06f          	j	2e44 <_vfprintf_r+0x11ec>
    3a7c:	02812703          	lw	a4,40(sp)
    3a80:	09810893          	add	a7,sp,152
    3a84:	08410813          	add	a6,sp,132
    3a88:	00070513          	mv	a0,a4
    3a8c:	00050593          	mv	a1,a0
    3a90:	00030713          	mv	a4,t1
    3a94:	07c10793          	add	a5,sp,124
    3a98:	00200693          	li	a3,2
    3a9c:	00048613          	mv	a2,s1
    3aa0:	00098513          	mv	a0,s3
    3aa4:	03c12223          	sw	t3,36(sp)
    3aa8:	03d12023          	sw	t4,32(sp)
    3aac:	00612c23          	sw	t1,24(sp)
    3ab0:	11c040ef          	jal	7bcc <_dtoa_r>
    3ab4:	02012e83          	lw	t4,32(sp)
    3ab8:	01812303          	lw	t1,24(sp)
    3abc:	02412e03          	lw	t3,36(sp)
    3ac0:	001ef713          	and	a4,t4,1
    3ac4:	00050c13          	mv	s8,a0
    3ac8:	1a0712e3          	bnez	a4,446c <_vfprintf_r+0x2814>
    3acc:	09812783          	lw	a5,152(sp)
    3ad0:	07c12a03          	lw	s4,124(sp)
    3ad4:	40a787b3          	sub	a5,a5,a0
    3ad8:	00f12c23          	sw	a5,24(sp)
    3adc:	ffd00713          	li	a4,-3
    3ae0:	00ea4463          	blt	s4,a4,3ae8 <_vfprintf_r+0x1e90>
    3ae4:	5b435663          	bge	t1,s4,4090 <_vfprintf_r+0x2438>
    3ae8:	ffee0e13          	add	t3,t3,-2
    3aec:	fffa0d13          	add	s10,s4,-1
    3af0:	07a12e23          	sw	s10,124(sp)
    3af4:	0ffe7693          	zext.b	a3,t3
    3af8:	00000613          	li	a2,0
    3afc:	08d10423          	sb	a3,136(sp)
    3b00:	02b00693          	li	a3,43
    3b04:	000d5863          	bgez	s10,3b14 <_vfprintf_r+0x1ebc>
    3b08:	00100713          	li	a4,1
    3b0c:	41470d33          	sub	s10,a4,s4
    3b10:	02d00693          	li	a3,45
    3b14:	08d104a3          	sb	a3,137(sp)
    3b18:	00900693          	li	a3,9
    3b1c:	33a6d8e3          	bge	a3,s10,464c <_vfprintf_r+0x29f4>
    3b20:	000c0793          	mv	a5,s8
    3b24:	09f10493          	add	s1,sp,159
    3b28:	03212023          	sw	s2,32(sp)
    3b2c:	00040c13          	mv	s8,s0
    3b30:	06300a13          	li	s4,99
    3b34:	000d0413          	mv	s0,s10
    3b38:	03d12223          	sw	t4,36(sp)
    3b3c:	05c12023          	sw	t3,64(sp)
    3b40:	00048913          	mv	s2,s1
    3b44:	00098c93          	mv	s9,s3
    3b48:	00078d13          	mv	s10,a5
    3b4c:	00a00593          	li	a1,10
    3b50:	00040513          	mv	a0,s0
    3b54:	7a10a0ef          	jal	eaf4 <__modsi3>
    3b58:	03050713          	add	a4,a0,48
    3b5c:	00090b13          	mv	s6,s2
    3b60:	00040513          	mv	a0,s0
    3b64:	feeb0fa3          	sb	a4,-1(s6)
    3b68:	00a00593          	li	a1,10
    3b6c:	00040993          	mv	s3,s0
    3b70:	7010a0ef          	jal	ea70 <__divsi3>
    3b74:	fff90913          	add	s2,s2,-1
    3b78:	00050413          	mv	s0,a0
    3b7c:	fd3a48e3          	blt	s4,s3,3b4c <_vfprintf_r+0x1ef4>
    3b80:	000c8993          	mv	s3,s9
    3b84:	03050713          	add	a4,a0,48
    3b88:	00090c93          	mv	s9,s2
    3b8c:	ffeb0693          	add	a3,s6,-2
    3b90:	feec8fa3          	sb	a4,-1(s9)
    3b94:	000c0413          	mv	s0,s8
    3b98:	02412e83          	lw	t4,36(sp)
    3b9c:	04012e03          	lw	t3,64(sp)
    3ba0:	02012903          	lw	s2,32(sp)
    3ba4:	000d0c13          	mv	s8,s10
    3ba8:	4c96f6e3          	bgeu	a3,s1,4874 <_vfprintf_r+0x2c1c>
    3bac:	08a10713          	add	a4,sp,138
    3bb0:	0006c783          	lbu	a5,0(a3)
    3bb4:	00168693          	add	a3,a3,1
    3bb8:	00170713          	add	a4,a4,1
    3bbc:	fef70fa3          	sb	a5,-1(a4)
    3bc0:	fe9698e3          	bne	a3,s1,3bb0 <_vfprintf_r+0x1f58>
    3bc4:	15010793          	add	a5,sp,336
    3bc8:	41678633          	sub	a2,a5,s6
    3bcc:	f5360793          	add	a5,a2,-173
    3bd0:	04f12023          	sw	a5,64(sp)
    3bd4:	01812783          	lw	a5,24(sp)
    3bd8:	04012683          	lw	a3,64(sp)
    3bdc:	00100713          	li	a4,1
    3be0:	00d78d33          	add	s10,a5,a3
    3be4:	28f75ce3          	bge	a4,a5,467c <_vfprintf_r+0x2a24>
    3be8:	03012783          	lw	a5,48(sp)
    3bec:	00fd0d33          	add	s10,s10,a5
    3bf0:	fffd4813          	not	a6,s10
    3bf4:	bffeff13          	and	t5,t4,-1025
    3bf8:	41f85813          	sra	a6,a6,0x1f
    3bfc:	100f6e93          	or	t4,t5,256
    3c00:	010d7cb3          	and	s9,s10,a6
    3c04:	02012223          	sw	zero,36(sp)
    3c08:	02012023          	sw	zero,32(sp)
    3c0c:	00000a13          	li	s4,0
    3c10:	04412783          	lw	a5,68(sp)
    3c14:	46079263          	bnez	a5,4078 <_vfprintf_r+0x2420>
    3c18:	07714603          	lbu	a2,119(sp)
    3c1c:	00000313          	li	t1,0
    3c20:	00061463          	bnez	a2,3c28 <_vfprintf_r+0x1fd0>
    3c24:	a74fe06f          	j	1e98 <_vfprintf_r+0x240>
    3c28:	e90fe06f          	j	22b8 <_vfprintf_r+0x660>
    3c2c:	00812583          	lw	a1,8(sp)
    3c30:	0a010613          	add	a2,sp,160
    3c34:	00098513          	mv	a0,s3
    3c38:	03d12023          	sw	t4,32(sp)
    3c3c:	6d9000ef          	jal	4b14 <__sprint_r>
    3c40:	00050463          	beqz	a0,3c48 <_vfprintf_r+0x1ff0>
    3c44:	ce4fe06f          	j	2128 <_vfprintf_r+0x4d0>
    3c48:	07c12683          	lw	a3,124(sp)
    3c4c:	0a812483          	lw	s1,168(sp)
    3c50:	02012e83          	lw	t4,32(sp)
    3c54:	0ac10413          	add	s0,sp,172
    3c58:	ce0ff06f          	j	3138 <_vfprintf_r+0x14e0>
    3c5c:	00600c93          	li	s9,6
    3c60:	f14ff06f          	j	3374 <_vfprintf_r+0x171c>
    3c64:	0ffd7d13          	zext.b	s10,s10
    3c68:	00000c93          	li	s9,0
    3c6c:	bd5fe06f          	j	2840 <_vfprintf_r+0xbe8>
    3c70:	0ffd7d13          	zext.b	s10,s10
    3c74:	00000c93          	li	s9,0
    3c78:	e48ff06f          	j	32c0 <_vfprintf_r+0x1668>
    3c7c:	018d1d13          	sll	s10,s10,0x18
    3c80:	418d5d13          	sra	s10,s10,0x18
    3c84:	41fd5c93          	sra	s9,s10,0x1f
    3c88:	000c8793          	mv	a5,s9
    3c8c:	b39fe06f          	j	27c4 <_vfprintf_r+0xb6c>
    3c90:	01412783          	lw	a5,20(sp)
    3c94:	00c12703          	lw	a4,12(sp)
    3c98:	0007a783          	lw	a5,0(a5)
    3c9c:	00e79023          	sh	a4,0(a5)
    3ca0:	c21fe06f          	j	28c0 <_vfprintf_r+0xc68>
    3ca4:	000c0513          	mv	a0,s8
    3ca8:	05d12223          	sw	t4,68(sp)
    3cac:	ad8fd0ef          	jal	f84 <strlen>
    3cb0:	07714603          	lbu	a2,119(sp)
    3cb4:	fff54813          	not	a6,a0
    3cb8:	41f85813          	sra	a6,a6,0x1f
    3cbc:	01612a23          	sw	s6,20(sp)
    3cc0:	02012223          	sw	zero,36(sp)
    3cc4:	02012023          	sw	zero,32(sp)
    3cc8:	00012823          	sw	zero,16(sp)
    3ccc:	04412e83          	lw	t4,68(sp)
    3cd0:	00050d13          	mv	s10,a0
    3cd4:	01057cb3          	and	s9,a0,a6
    3cd8:	00000313          	li	t1,0
    3cdc:	07300e13          	li	t3,115
    3ce0:	00061463          	bnez	a2,3ce8 <_vfprintf_r+0x2090>
    3ce4:	9b4fe06f          	j	1e98 <_vfprintf_r+0x240>
    3ce8:	dd0fe06f          	j	22b8 <_vfprintf_r+0x660>
    3cec:	00812583          	lw	a1,8(sp)
    3cf0:	0a010613          	add	a2,sp,160
    3cf4:	00098513          	mv	a0,s3
    3cf8:	61d000ef          	jal	4b14 <__sprint_r>
    3cfc:	00051463          	bnez	a0,3d04 <_vfprintf_r+0x20ac>
    3d00:	be8fe06f          	j	20e8 <_vfprintf_r+0x490>
    3d04:	c38fe06f          	j	213c <_vfprintf_r+0x4e4>
    3d08:	00812583          	lw	a1,8(sp)
    3d0c:	0a010613          	add	a2,sp,160
    3d10:	00098513          	mv	a0,s3
    3d14:	03d12023          	sw	t4,32(sp)
    3d18:	5fd000ef          	jal	4b14 <__sprint_r>
    3d1c:	00050463          	beqz	a0,3d24 <_vfprintf_r+0x20cc>
    3d20:	c08fe06f          	j	2128 <_vfprintf_r+0x4d0>
    3d24:	07c12683          	lw	a3,124(sp)
    3d28:	0a812483          	lw	s1,168(sp)
    3d2c:	0a412703          	lw	a4,164(sp)
    3d30:	02012e83          	lw	t4,32(sp)
    3d34:	0ac10413          	add	s0,sp,172
    3d38:	c2dff06f          	j	3964 <_vfprintf_r+0x1d0c>
    3d3c:	05862503          	lw	a0,88(a2)
    3d40:	00f12623          	sw	a5,12(sp)
    3d44:	fbdfc0ef          	jal	d00 <__retarget_lock_release_recursive>
    3d48:	00c12783          	lw	a5,12(sp)
    3d4c:	ab8fe06f          	j	2004 <_vfprintf_r+0x3ac>
    3d50:	00130a13          	add	s4,t1,1
    3d54:	00200693          	li	a3,2
    3d58:	02812703          	lw	a4,40(sp)
    3d5c:	09810893          	add	a7,sp,152
    3d60:	08410813          	add	a6,sp,132
    3d64:	00070513          	mv	a0,a4
    3d68:	00050593          	mv	a1,a0
    3d6c:	000a0713          	mv	a4,s4
    3d70:	07c10793          	add	a5,sp,124
    3d74:	00048613          	mv	a2,s1
    3d78:	00098513          	mv	a0,s3
    3d7c:	02612223          	sw	t1,36(sp)
    3d80:	03c12023          	sw	t3,32(sp)
    3d84:	01d12c23          	sw	t4,24(sp)
    3d88:	645030ef          	jal	7bcc <_dtoa_r>
    3d8c:	02012e03          	lw	t3,32(sp)
    3d90:	04600693          	li	a3,70
    3d94:	01812e83          	lw	t4,24(sp)
    3d98:	fdfe7d13          	and	s10,t3,-33
    3d9c:	02412303          	lw	t1,36(sp)
    3da0:	00050c13          	mv	s8,a0
    3da4:	01450733          	add	a4,a0,s4
    3da8:	34dd14e3          	bne	s10,a3,48f0 <_vfprintf_r+0x2c98>
    3dac:	000c4603          	lbu	a2,0(s8)
    3db0:	03000693          	li	a3,48
    3db4:	6cd60263          	beq	a2,a3,4478 <_vfprintf_r+0x2820>
    3db8:	07c12683          	lw	a3,124(sp)
    3dbc:	00d70733          	add	a4,a4,a3
    3dc0:	02812683          	lw	a3,40(sp)
    3dc4:	00048593          	mv	a1,s1
    3dc8:	00000613          	li	a2,0
    3dcc:	00068513          	mv	a0,a3
    3dd0:	00000693          	li	a3,0
    3dd4:	04e12823          	sw	a4,80(sp)
    3dd8:	02612223          	sw	t1,36(sp)
    3ddc:	03c12023          	sw	t3,32(sp)
    3de0:	01d12c23          	sw	t4,24(sp)
    3de4:	274090ef          	jal	d058 <__eqdf2>
    3de8:	01812e83          	lw	t4,24(sp)
    3dec:	02012e03          	lw	t3,32(sp)
    3df0:	02412303          	lw	t1,36(sp)
    3df4:	05012703          	lw	a4,80(sp)
    3df8:	62050863          	beqz	a0,4428 <_vfprintf_r+0x27d0>
    3dfc:	09812783          	lw	a5,152(sp)
    3e00:	00e7fe63          	bgeu	a5,a4,3e1c <_vfprintf_r+0x21c4>
    3e04:	03000613          	li	a2,48
    3e08:	00178693          	add	a3,a5,1
    3e0c:	08d12c23          	sw	a3,152(sp)
    3e10:	00c78023          	sb	a2,0(a5)
    3e14:	09812783          	lw	a5,152(sp)
    3e18:	fee7e8e3          	bltu	a5,a4,3e08 <_vfprintf_r+0x21b0>
    3e1c:	07c12a03          	lw	s4,124(sp)
    3e20:	418787b3          	sub	a5,a5,s8
    3e24:	04700713          	li	a4,71
    3e28:	00f12c23          	sw	a5,24(sp)
    3e2c:	caed08e3          	beq	s10,a4,3adc <_vfprintf_r+0x1e84>
    3e30:	04600713          	li	a4,70
    3e34:	68ed0863          	beq	s10,a4,44c4 <_vfprintf_r+0x286c>
    3e38:	fffa0d13          	add	s10,s4,-1
    3e3c:	cb5ff06f          	j	3af0 <_vfprintf_r+0x1e98>
    3e40:	02812703          	lw	a4,40(sp)
    3e44:	07c10613          	add	a2,sp,124
    3e48:	00048593          	mv	a1,s1
    3e4c:	00070513          	mv	a0,a4
    3e50:	02612223          	sw	t1,36(sp)
    3e54:	03c12023          	sw	t3,32(sp)
    3e58:	01d12c23          	sw	t4,24(sp)
    3e5c:	25d030ef          	jal	78b8 <frexp>
    3e60:	7fffd717          	auipc	a4,0x7fffd
    3e64:	84870713          	add	a4,a4,-1976 # 800006a8 <__global_locale+0x174>
    3e68:	00072603          	lw	a2,0(a4)
    3e6c:	00472683          	lw	a3,4(a4)
    3e70:	47c090ef          	jal	d2ec <__muldf3>
    3e74:	00000613          	li	a2,0
    3e78:	00000693          	li	a3,0
    3e7c:	00050a13          	mv	s4,a0
    3e80:	00058d13          	mv	s10,a1
    3e84:	1d4090ef          	jal	d058 <__eqdf2>
    3e88:	01812e83          	lw	t4,24(sp)
    3e8c:	02012e03          	lw	t3,32(sp)
    3e90:	02412303          	lw	t1,36(sp)
    3e94:	00051663          	bnez	a0,3ea0 <_vfprintf_r+0x2248>
    3e98:	00100713          	li	a4,1
    3e9c:	06e12e23          	sw	a4,124(sp)
    3ea0:	0000b797          	auipc	a5,0xb
    3ea4:	f7478793          	add	a5,a5,-140 # ee14 <__fini_array_end+0x268>
    3ea8:	06100713          	li	a4,97
    3eac:	02f12023          	sw	a5,32(sp)
    3eb0:	00ee1863          	bne	t3,a4,3ec0 <_vfprintf_r+0x2268>
    3eb4:	0000b797          	auipc	a5,0xb
    3eb8:	f4c78793          	add	a5,a5,-180 # ee00 <__fini_array_end+0x254>
    3ebc:	02f12023          	sw	a5,32(sp)
    3ec0:	7fffc717          	auipc	a4,0x7fffc
    3ec4:	7f070713          	add	a4,a4,2032 # 800006b0 <__global_locale+0x17c>
    3ec8:	00072783          	lw	a5,0(a4)
    3ecc:	00472803          	lw	a6,4(a4)
    3ed0:	000c0493          	mv	s1,s8
    3ed4:	00f12c23          	sw	a5,24(sp)
    3ed8:	000d0793          	mv	a5,s10
    3edc:	03212223          	sw	s2,36(sp)
    3ee0:	000c0d13          	mv	s10,s8
    3ee4:	02012903          	lw	s2,32(sp)
    3ee8:	00098c13          	mv	s8,s3
    3eec:	01012e23          	sw	a6,28(sp)
    3ef0:	fff30b13          	add	s6,t1,-1
    3ef4:	fff00c93          	li	s9,-1
    3ef8:	05d12023          	sw	t4,64(sp)
    3efc:	05c12823          	sw	t3,80(sp)
    3f00:	04812a23          	sw	s0,84(sp)
    3f04:	00078993          	mv	s3,a5
    3f08:	01c0006f          	j	3f24 <_vfprintf_r+0x22cc>
    3f0c:	00000613          	li	a2,0
    3f10:	00000693          	li	a3,0
    3f14:	fffb0413          	add	s0,s6,-1
    3f18:	140090ef          	jal	d058 <__eqdf2>
    3f1c:	0a0504e3          	beqz	a0,47c4 <_vfprintf_r+0x2b6c>
    3f20:	00040b13          	mv	s6,s0
    3f24:	01812603          	lw	a2,24(sp)
    3f28:	01c12683          	lw	a3,28(sp)
    3f2c:	000a0513          	mv	a0,s4
    3f30:	00098593          	mv	a1,s3
    3f34:	3b8090ef          	jal	d2ec <__muldf3>
    3f38:	00058a13          	mv	s4,a1
    3f3c:	00050993          	mv	s3,a0
    3f40:	4980a0ef          	jal	e3d8 <__fixdfsi>
    3f44:	00050413          	mv	s0,a0
    3f48:	5140a0ef          	jal	e45c <__floatsidf>
    3f4c:	00050613          	mv	a2,a0
    3f50:	00058693          	mv	a3,a1
    3f54:	00098513          	mv	a0,s3
    3f58:	000a0593          	mv	a1,s4
    3f5c:	321090ef          	jal	da7c <__subdf3>
    3f60:	00890733          	add	a4,s2,s0
    3f64:	00074703          	lbu	a4,0(a4)
    3f68:	00048813          	mv	a6,s1
    3f6c:	00050a13          	mv	s4,a0
    3f70:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    3f74:	00058993          	mv	s3,a1
    3f78:	00148493          	add	s1,s1,1
    3f7c:	f99b18e3          	bne	s6,s9,3f0c <_vfprintf_r+0x22b4>
    3f80:	7fffc697          	auipc	a3,0x7fffc
    3f84:	73868693          	add	a3,a3,1848 # 800006b8 <__global_locale+0x184>
    3f88:	0006a303          	lw	t1,0(a3)
    3f8c:	0046a383          	lw	t2,4(a3)
    3f90:	05012e03          	lw	t3,80(sp)
    3f94:	00030613          	mv	a2,t1
    3f98:	00038693          	mv	a3,t2
    3f9c:	01012c23          	sw	a6,24(sp)
    3fa0:	02412903          	lw	s2,36(sp)
    3fa4:	000c0993          	mv	s3,s8
    3fa8:	03c12223          	sw	t3,36(sp)
    3fac:	000d0c13          	mv	s8,s10
    3fb0:	00058d13          	mv	s10,a1
    3fb4:	130090ef          	jal	d0e4 <__gedf2>
    3fb8:	7fffc797          	auipc	a5,0x7fffc
    3fbc:	70078793          	add	a5,a5,1792 # 800006b8 <__global_locale+0x184>
    3fc0:	00040b13          	mv	s6,s0
    3fc4:	0007a303          	lw	t1,0(a5)
    3fc8:	05412403          	lw	s0,84(sp)
    3fcc:	0047a383          	lw	t2,4(a5)
    3fd0:	01812803          	lw	a6,24(sp)
    3fd4:	02412e03          	lw	t3,36(sp)
    3fd8:	04012e83          	lw	t4,64(sp)
    3fdc:	0aa05ce3          	blez	a0,4894 <_vfprintf_r+0x2c3c>
    3fe0:	02012783          	lw	a5,32(sp)
    3fe4:	09012c23          	sw	a6,152(sp)
    3fe8:	fff4c603          	lbu	a2,-1(s1)
    3fec:	00f7c583          	lbu	a1,15(a5)
    3ff0:	00048693          	mv	a3,s1
    3ff4:	02b61063          	bne	a2,a1,4014 <_vfprintf_r+0x23bc>
    3ff8:	03000513          	li	a0,48
    3ffc:	fea68fa3          	sb	a0,-1(a3)
    4000:	09812683          	lw	a3,152(sp)
    4004:	fff68793          	add	a5,a3,-1
    4008:	08f12c23          	sw	a5,152(sp)
    400c:	fff6c603          	lbu	a2,-1(a3)
    4010:	feb606e3          	beq	a2,a1,3ffc <_vfprintf_r+0x23a4>
    4014:	00160593          	add	a1,a2,1
    4018:	03900513          	li	a0,57
    401c:	0ff5f593          	zext.b	a1,a1
    4020:	04a60463          	beq	a2,a0,4068 <_vfprintf_r+0x2410>
    4024:	feb68fa3          	sb	a1,-1(a3)
    4028:	00048793          	mv	a5,s1
    402c:	07c12a03          	lw	s4,124(sp)
    4030:	418787b3          	sub	a5,a5,s8
    4034:	06100613          	li	a2,97
    4038:	fffa0d13          	add	s10,s4,-1
    403c:	00f12c23          	sw	a5,24(sp)
    4040:	07a12e23          	sw	s10,124(sp)
    4044:	07000693          	li	a3,112
    4048:	00ce0663          	beq	t3,a2,4054 <_vfprintf_r+0x23fc>
    404c:	05000693          	li	a3,80
    4050:	04100e13          	li	t3,65
    4054:	00100613          	li	a2,1
    4058:	aa5ff06f          	j	3afc <_vfprintf_r+0x1ea4>
    405c:	00030a13          	mv	s4,t1
    4060:	00300693          	li	a3,3
    4064:	cf5ff06f          	j	3d58 <_vfprintf_r+0x2100>
    4068:	02012783          	lw	a5,32(sp)
    406c:	00a7c583          	lbu	a1,10(a5)
    4070:	feb68fa3          	sb	a1,-1(a3)
    4074:	fb5ff06f          	j	4028 <_vfprintf_r+0x23d0>
    4078:	02d00713          	li	a4,45
    407c:	06e10ba3          	sb	a4,119(sp)
    4080:	02d00613          	li	a2,45
    4084:	00000313          	li	t1,0
    4088:	001c8c93          	add	s9,s9,1
    408c:	e0dfd06f          	j	1e98 <_vfprintf_r+0x240>
    4090:	01812783          	lw	a5,24(sp)
    4094:	46fa4063          	blt	s4,a5,44f4 <_vfprintf_r+0x289c>
    4098:	001ef713          	and	a4,t4,1
    409c:	000a0d13          	mv	s10,s4
    40a0:	00070663          	beqz	a4,40ac <_vfprintf_r+0x2454>
    40a4:	03012783          	lw	a5,48(sp)
    40a8:	00fa0d33          	add	s10,s4,a5
    40ac:	400eff13          	and	t5,t4,1024
    40b0:	000f0463          	beqz	t5,40b8 <_vfprintf_r+0x2460>
    40b4:	5f404e63          	bgtz	s4,46b0 <_vfprintf_r+0x2a58>
    40b8:	fffd4813          	not	a6,s10
    40bc:	41f85813          	sra	a6,a6,0x1f
    40c0:	010d7cb3          	and	s9,s10,a6
    40c4:	06700e13          	li	t3,103
    40c8:	000b0e93          	mv	t4,s6
    40cc:	02012223          	sw	zero,36(sp)
    40d0:	02012023          	sw	zero,32(sp)
    40d4:	b3dff06f          	j	3c10 <_vfprintf_r+0x1fb8>
    40d8:	02d00793          	li	a5,45
    40dc:	06f10ba3          	sb	a5,119(sp)
    40e0:	02d00613          	li	a2,45
    40e4:	998fe06f          	j	227c <_vfprintf_r+0x624>
    40e8:	01812783          	lw	a5,24(sp)
    40ec:	02012a03          	lw	s4,32(sp)
    40f0:	05212823          	sw	s2,80(sp)
    40f4:	00fc07b3          	add	a5,s8,a5
    40f8:	05712c23          	sw	s7,88(sp)
    40fc:	05912e23          	sw	s9,92(sp)
    4100:	00040713          	mv	a4,s0
    4104:	04f12223          	sw	a5,68(sp)
    4108:	02412403          	lw	s0,36(sp)
    410c:	05d12a23          	sw	t4,84(sp)
    4110:	03812223          	sw	s8,36(sp)
    4114:	03c12b83          	lw	s7,60(sp)
    4118:	04c12c83          	lw	s9,76(sp)
    411c:	00812903          	lw	s2,8(sp)
    4120:	00700693          	li	a3,7
    4124:	01000d13          	li	s10,16
    4128:	0000bb17          	auipc	s6,0xb
    412c:	1d8b0b13          	add	s6,s6,472 # f300 <zeroes.0>
    4130:	00048613          	mv	a2,s1
    4134:	00030c13          	mv	s8,t1
    4138:	09405863          	blez	s4,41c8 <_vfprintf_r+0x2570>
    413c:	16805e63          	blez	s0,42b8 <_vfprintf_r+0x2660>
    4140:	fff40413          	add	s0,s0,-1
    4144:	04812783          	lw	a5,72(sp)
    4148:	01960633          	add	a2,a2,s9
    414c:	01972223          	sw	s9,4(a4)
    4150:	00f72023          	sw	a5,0(a4)
    4154:	0a412783          	lw	a5,164(sp)
    4158:	0ac12423          	sw	a2,168(sp)
    415c:	00870713          	add	a4,a4,8
    4160:	00178793          	add	a5,a5,1
    4164:	0af12223          	sw	a5,164(sp)
    4168:	14f6ce63          	blt	a3,a5,42c4 <_vfprintf_r+0x266c>
    416c:	04412783          	lw	a5,68(sp)
    4170:	000bc583          	lbu	a1,0(s7)
    4174:	418784b3          	sub	s1,a5,s8
    4178:	0095d463          	bge	a1,s1,4180 <_vfprintf_r+0x2528>
    417c:	00058493          	mv	s1,a1
    4180:	02905663          	blez	s1,41ac <_vfprintf_r+0x2554>
    4184:	0a412583          	lw	a1,164(sp)
    4188:	00960633          	add	a2,a2,s1
    418c:	01872023          	sw	s8,0(a4)
    4190:	00158593          	add	a1,a1,1
    4194:	00972223          	sw	s1,4(a4)
    4198:	0ac12423          	sw	a2,168(sp)
    419c:	0ab12223          	sw	a1,164(sp)
    41a0:	14b6c663          	blt	a3,a1,42ec <_vfprintf_r+0x2694>
    41a4:	000bc583          	lbu	a1,0(s7)
    41a8:	00870713          	add	a4,a4,8
    41ac:	fff4c513          	not	a0,s1
    41b0:	41f55513          	sra	a0,a0,0x1f
    41b4:	00a4f7b3          	and	a5,s1,a0
    41b8:	40f584b3          	sub	s1,a1,a5
    41bc:	04904663          	bgtz	s1,4208 <_vfprintf_r+0x25b0>
    41c0:	00bc0c33          	add	s8,s8,a1
    41c4:	f7404ce3          	bgtz	s4,413c <_vfprintf_r+0x24e4>
    41c8:	f6804ce3          	bgtz	s0,4140 <_vfprintf_r+0x24e8>
    41cc:	01812783          	lw	a5,24(sp)
    41d0:	000c0313          	mv	t1,s8
    41d4:	02412c03          	lw	s8,36(sp)
    41d8:	03712e23          	sw	s7,60(sp)
    41dc:	00070413          	mv	s0,a4
    41e0:	00fc0733          	add	a4,s8,a5
    41e4:	05012903          	lw	s2,80(sp)
    41e8:	05412e83          	lw	t4,84(sp)
    41ec:	05812b83          	lw	s7,88(sp)
    41f0:	05c12c83          	lw	s9,92(sp)
    41f4:	00060493          	mv	s1,a2
    41f8:	00676463          	bltu	a4,t1,4200 <_vfprintf_r+0x25a8>
    41fc:	c59fe06f          	j	2e54 <_vfprintf_r+0x11fc>
    4200:	00070313          	mv	t1,a4
    4204:	c51fe06f          	j	2e54 <_vfprintf_r+0x11fc>
    4208:	0a412583          	lw	a1,164(sp)
    420c:	0000be97          	auipc	t4,0xb
    4210:	0f4e8e93          	add	t4,t4,244 # f300 <zeroes.0>
    4214:	069d5c63          	bge	s10,s1,428c <_vfprintf_r+0x2634>
    4218:	02812023          	sw	s0,32(sp)
    421c:	00048413          	mv	s0,s1
    4220:	000b0493          	mv	s1,s6
    4224:	00c0006f          	j	4230 <_vfprintf_r+0x25d8>
    4228:	ff040413          	add	s0,s0,-16
    422c:	048d5a63          	bge	s10,s0,4280 <_vfprintf_r+0x2628>
    4230:	01060613          	add	a2,a2,16
    4234:	00158593          	add	a1,a1,1
    4238:	01672023          	sw	s6,0(a4)
    423c:	01a72223          	sw	s10,4(a4)
    4240:	0ac12423          	sw	a2,168(sp)
    4244:	0ab12223          	sw	a1,164(sp)
    4248:	00870713          	add	a4,a4,8
    424c:	fcb6dee3          	bge	a3,a1,4228 <_vfprintf_r+0x25d0>
    4250:	0a010613          	add	a2,sp,160
    4254:	00090593          	mv	a1,s2
    4258:	00098513          	mv	a0,s3
    425c:	0b9000ef          	jal	4b14 <__sprint_r>
    4260:	00050463          	beqz	a0,4268 <_vfprintf_r+0x2610>
    4264:	ec5fd06f          	j	2128 <_vfprintf_r+0x4d0>
    4268:	ff040413          	add	s0,s0,-16
    426c:	0a812603          	lw	a2,168(sp)
    4270:	0a412583          	lw	a1,164(sp)
    4274:	0ac10713          	add	a4,sp,172
    4278:	00700693          	li	a3,7
    427c:	fa8d4ae3          	blt	s10,s0,4230 <_vfprintf_r+0x25d8>
    4280:	00048e93          	mv	t4,s1
    4284:	00040493          	mv	s1,s0
    4288:	02012403          	lw	s0,32(sp)
    428c:	00960633          	add	a2,a2,s1
    4290:	00158593          	add	a1,a1,1
    4294:	01d72023          	sw	t4,0(a4)
    4298:	00972223          	sw	s1,4(a4)
    429c:	0ac12423          	sw	a2,168(sp)
    42a0:	0ab12223          	sw	a1,164(sp)
    42a4:	10b6ce63          	blt	a3,a1,43c0 <_vfprintf_r+0x2768>
    42a8:	000bc583          	lbu	a1,0(s7)
    42ac:	00870713          	add	a4,a4,8
    42b0:	00bc0c33          	add	s8,s8,a1
    42b4:	f11ff06f          	j	41c4 <_vfprintf_r+0x256c>
    42b8:	fffb8b93          	add	s7,s7,-1
    42bc:	fffa0a13          	add	s4,s4,-1
    42c0:	e85ff06f          	j	4144 <_vfprintf_r+0x24ec>
    42c4:	0a010613          	add	a2,sp,160
    42c8:	00090593          	mv	a1,s2
    42cc:	00098513          	mv	a0,s3
    42d0:	045000ef          	jal	4b14 <__sprint_r>
    42d4:	00050463          	beqz	a0,42dc <_vfprintf_r+0x2684>
    42d8:	e51fd06f          	j	2128 <_vfprintf_r+0x4d0>
    42dc:	0a812603          	lw	a2,168(sp)
    42e0:	0ac10713          	add	a4,sp,172
    42e4:	00700693          	li	a3,7
    42e8:	e85ff06f          	j	416c <_vfprintf_r+0x2514>
    42ec:	0a010613          	add	a2,sp,160
    42f0:	00090593          	mv	a1,s2
    42f4:	00098513          	mv	a0,s3
    42f8:	01d000ef          	jal	4b14 <__sprint_r>
    42fc:	00050463          	beqz	a0,4304 <_vfprintf_r+0x26ac>
    4300:	e29fd06f          	j	2128 <_vfprintf_r+0x4d0>
    4304:	000bc583          	lbu	a1,0(s7)
    4308:	0a812603          	lw	a2,168(sp)
    430c:	0ac10713          	add	a4,sp,172
    4310:	00700693          	li	a3,7
    4314:	e99ff06f          	j	41ac <_vfprintf_r+0x2554>
    4318:	04c12783          	lw	a5,76(sp)
    431c:	04812583          	lw	a1,72(sp)
    4320:	00000913          	li	s2,0
    4324:	40fc0c33          	sub	s8,s8,a5
    4328:	00078613          	mv	a2,a5
    432c:	000c0513          	mv	a0,s8
    4330:	1dc030ef          	jal	750c <strncpy>
    4334:	00144783          	lbu	a5,1(s0)
    4338:	00a00613          	li	a2,10
    433c:	00000693          	li	a3,0
    4340:	00f037b3          	snez	a5,a5
    4344:	000d0513          	mv	a0,s10
    4348:	000c8593          	mv	a1,s9
    434c:	00f40433          	add	s0,s0,a5
    4350:	691060ef          	jal	b1e0 <__udivdi3>
    4354:	a10ff06f          	j	3564 <_vfprintf_r+0x190c>
    4358:	09810713          	add	a4,sp,152
    435c:	00000693          	li	a3,0
    4360:	08410613          	add	a2,sp,132
    4364:	00000593          	li	a1,0
    4368:	00098513          	mv	a0,s3
    436c:	01c12a23          	sw	t3,20(sp)
    4370:	01d12823          	sw	t4,16(sp)
    4374:	38c060ef          	jal	a700 <_wcsrtombs_r>
    4378:	fff00713          	li	a4,-1
    437c:	01012e83          	lw	t4,16(sp)
    4380:	01412e03          	lw	t3,20(sp)
    4384:	00050d13          	mv	s10,a0
    4388:	30e50063          	beq	a0,a4,4688 <_vfprintf_r+0x2a30>
    438c:	09812223          	sw	s8,132(sp)
    4390:	cacff06f          	j	383c <_vfprintf_r+0x1be4>
    4394:	07714603          	lbu	a2,119(sp)
    4398:	01612a23          	sw	s6,20(sp)
    439c:	02012223          	sw	zero,36(sp)
    43a0:	02012023          	sw	zero,32(sp)
    43a4:	00012823          	sw	zero,16(sp)
    43a8:	00000c93          	li	s9,0
    43ac:	00000313          	li	t1,0
    43b0:	00000a13          	li	s4,0
    43b4:	00061463          	bnez	a2,43bc <_vfprintf_r+0x2764>
    43b8:	ae1fd06f          	j	1e98 <_vfprintf_r+0x240>
    43bc:	efdfd06f          	j	22b8 <_vfprintf_r+0x660>
    43c0:	0a010613          	add	a2,sp,160
    43c4:	00090593          	mv	a1,s2
    43c8:	00098513          	mv	a0,s3
    43cc:	748000ef          	jal	4b14 <__sprint_r>
    43d0:	00050463          	beqz	a0,43d8 <_vfprintf_r+0x2780>
    43d4:	d55fd06f          	j	2128 <_vfprintf_r+0x4d0>
    43d8:	000bc583          	lbu	a1,0(s7)
    43dc:	0a812603          	lw	a2,168(sp)
    43e0:	0ac10713          	add	a4,sp,172
    43e4:	00700693          	li	a3,7
    43e8:	00bc0c33          	add	s8,s8,a1
    43ec:	dd9ff06f          	j	41c4 <_vfprintf_r+0x256c>
    43f0:	00812583          	lw	a1,8(sp)
    43f4:	0a010613          	add	a2,sp,160
    43f8:	00098513          	mv	a0,s3
    43fc:	05d12223          	sw	t4,68(sp)
    4400:	714000ef          	jal	4b14 <__sprint_r>
    4404:	00050463          	beqz	a0,440c <_vfprintf_r+0x27b4>
    4408:	d21fd06f          	j	2128 <_vfprintf_r+0x4d0>
    440c:	0a812483          	lw	s1,168(sp)
    4410:	04412e83          	lw	t4,68(sp)
    4414:	0ac10413          	add	s0,sp,172
    4418:	a19fe06f          	j	2e30 <_vfprintf_r+0x11d8>
    441c:	00900793          	li	a5,9
    4420:	95a7e263          	bltu	a5,s10,3564 <_vfprintf_r+0x190c>
    4424:	98cff06f          	j	35b0 <_vfprintf_r+0x1958>
    4428:	07c12a03          	lw	s4,124(sp)
    442c:	00070793          	mv	a5,a4
    4430:	9f1ff06f          	j	3e20 <_vfprintf_r+0x21c8>
    4434:	00812583          	lw	a1,8(sp)
    4438:	0a010613          	add	a2,sp,160
    443c:	00098513          	mv	a0,s3
    4440:	03d12023          	sw	t4,32(sp)
    4444:	6d0000ef          	jal	4b14 <__sprint_r>
    4448:	00050463          	beqz	a0,4450 <_vfprintf_r+0x27f8>
    444c:	cddfd06f          	j	2128 <_vfprintf_r+0x4d0>
    4450:	07c12d03          	lw	s10,124(sp)
    4454:	01812783          	lw	a5,24(sp)
    4458:	0a812483          	lw	s1,168(sp)
    445c:	02012e83          	lw	t4,32(sp)
    4460:	0ac10413          	add	s0,sp,172
    4464:	41a78d33          	sub	s10,a5,s10
    4468:	a49fe06f          	j	2eb0 <_vfprintf_r+0x1258>
    446c:	00650733          	add	a4,a0,t1
    4470:	04700d13          	li	s10,71
    4474:	94dff06f          	j	3dc0 <_vfprintf_r+0x2168>
    4478:	02812603          	lw	a2,40(sp)
    447c:	00048593          	mv	a1,s1
    4480:	00000693          	li	a3,0
    4484:	00060513          	mv	a0,a2
    4488:	00000613          	li	a2,0
    448c:	04e12823          	sw	a4,80(sp)
    4490:	02612223          	sw	t1,36(sp)
    4494:	03c12023          	sw	t3,32(sp)
    4498:	01d12c23          	sw	t4,24(sp)
    449c:	3bd080ef          	jal	d058 <__eqdf2>
    44a0:	01812e83          	lw	t4,24(sp)
    44a4:	02012e03          	lw	t3,32(sp)
    44a8:	02412303          	lw	t1,36(sp)
    44ac:	05012703          	lw	a4,80(sp)
    44b0:	34051e63          	bnez	a0,480c <_vfprintf_r+0x2bb4>
    44b4:	07c12a03          	lw	s4,124(sp)
    44b8:	01470733          	add	a4,a4,s4
    44bc:	418707b3          	sub	a5,a4,s8
    44c0:	00f12c23          	sw	a5,24(sp)
    44c4:	001ef713          	and	a4,t4,1
    44c8:	00676733          	or	a4,a4,t1
    44cc:	37405a63          	blez	s4,4840 <_vfprintf_r+0x2be8>
    44d0:	26071263          	bnez	a4,4734 <_vfprintf_r+0x2adc>
    44d4:	000a0d13          	mv	s10,s4
    44d8:	06600e13          	li	t3,102
    44dc:	400eff13          	and	t5,t4,1024
    44e0:	1c0f1a63          	bnez	t5,46b4 <_vfprintf_r+0x2a5c>
    44e4:	fffd4813          	not	a6,s10
    44e8:	41f85813          	sra	a6,a6,0x1f
    44ec:	010d7cb3          	and	s9,s10,a6
    44f0:	bd9ff06f          	j	40c8 <_vfprintf_r+0x2470>
    44f4:	01812783          	lw	a5,24(sp)
    44f8:	03012703          	lw	a4,48(sp)
    44fc:	06700e13          	li	t3,103
    4500:	00e78d33          	add	s10,a5,a4
    4504:	fd404ce3          	bgtz	s4,44dc <_vfprintf_r+0x2884>
    4508:	414d06b3          	sub	a3,s10,s4
    450c:	00168d13          	add	s10,a3,1
    4510:	fffd4813          	not	a6,s10
    4514:	41f85813          	sra	a6,a6,0x1f
    4518:	010d7cb3          	and	s9,s10,a6
    451c:	badff06f          	j	40c8 <_vfprintf_r+0x2470>
    4520:	000e8613          	mv	a2,t4
    4524:	ad8fe06f          	j	27fc <_vfprintf_r+0xba4>
    4528:	00812783          	lw	a5,8(sp)
    452c:	0647a783          	lw	a5,100(a5)
    4530:	0017f793          	and	a5,a5,1
    4534:	02079063          	bnez	a5,4554 <_vfprintf_r+0x28fc>
    4538:	00812783          	lw	a5,8(sp)
    453c:	00c7d783          	lhu	a5,12(a5)
    4540:	2007f793          	and	a5,a5,512
    4544:	00079863          	bnez	a5,4554 <_vfprintf_r+0x28fc>
    4548:	00812783          	lw	a5,8(sp)
    454c:	0587a503          	lw	a0,88(a5)
    4550:	fb0fc0ef          	jal	d00 <__retarget_lock_release_recursive>
    4554:	fff00793          	li	a5,-1
    4558:	00f12623          	sw	a5,12(sp)
    455c:	c2dfd06f          	j	2188 <_vfprintf_r+0x530>
    4560:	ff000613          	li	a2,-16
    4564:	40d00d33          	neg	s10,a3
    4568:	0000b297          	auipc	t0,0xb
    456c:	d9828293          	add	t0,t0,-616 # f300 <zeroes.0>
    4570:	08c6d463          	bge	a3,a2,45f8 <_vfprintf_r+0x29a0>
    4574:	03212023          	sw	s2,32(sp)
    4578:	01000693          	li	a3,16
    457c:	00700b13          	li	s6,7
    4580:	000e8a13          	mv	s4,t4
    4584:	00028913          	mv	s2,t0
    4588:	00c0006f          	j	4594 <_vfprintf_r+0x293c>
    458c:	ff0d0d13          	add	s10,s10,-16
    4590:	05a6de63          	bge	a3,s10,45ec <_vfprintf_r+0x2994>
    4594:	01048493          	add	s1,s1,16
    4598:	00170713          	add	a4,a4,1
    459c:	01242023          	sw	s2,0(s0)
    45a0:	00d42223          	sw	a3,4(s0)
    45a4:	0a912423          	sw	s1,168(sp)
    45a8:	0ae12223          	sw	a4,164(sp)
    45ac:	00840413          	add	s0,s0,8
    45b0:	fceb5ee3          	bge	s6,a4,458c <_vfprintf_r+0x2934>
    45b4:	00812583          	lw	a1,8(sp)
    45b8:	0a010613          	add	a2,sp,160
    45bc:	00098513          	mv	a0,s3
    45c0:	554000ef          	jal	4b14 <__sprint_r>
    45c4:	00050463          	beqz	a0,45cc <_vfprintf_r+0x2974>
    45c8:	b61fd06f          	j	2128 <_vfprintf_r+0x4d0>
    45cc:	0a812483          	lw	s1,168(sp)
    45d0:	0a412703          	lw	a4,164(sp)
    45d4:	0ac10413          	add	s0,sp,172
    45d8:	01000693          	li	a3,16
    45dc:	fb1ff06f          	j	458c <_vfprintf_r+0x2934>
    45e0:	00012823          	sw	zero,16(sp)
    45e4:	0ec10c13          	add	s8,sp,236
    45e8:	a88ff06f          	j	3870 <_vfprintf_r+0x1c18>
    45ec:	00090293          	mv	t0,s2
    45f0:	02012903          	lw	s2,32(sp)
    45f4:	000a0e93          	mv	t4,s4
    45f8:	01a484b3          	add	s1,s1,s10
    45fc:	00170713          	add	a4,a4,1
    4600:	00542023          	sw	t0,0(s0)
    4604:	01a42223          	sw	s10,4(s0)
    4608:	0a912423          	sw	s1,168(sp)
    460c:	0ae12223          	sw	a4,164(sp)
    4610:	00700693          	li	a3,7
    4614:	00e6c463          	blt	a3,a4,461c <_vfprintf_r+0x29c4>
    4618:	b65fe06f          	j	317c <_vfprintf_r+0x1524>
    461c:	00812583          	lw	a1,8(sp)
    4620:	0a010613          	add	a2,sp,160
    4624:	00098513          	mv	a0,s3
    4628:	03d12023          	sw	t4,32(sp)
    462c:	4e8000ef          	jal	4b14 <__sprint_r>
    4630:	00050463          	beqz	a0,4638 <_vfprintf_r+0x29e0>
    4634:	af5fd06f          	j	2128 <_vfprintf_r+0x4d0>
    4638:	0a812483          	lw	s1,168(sp)
    463c:	0a412703          	lw	a4,164(sp)
    4640:	02012e83          	lw	t4,32(sp)
    4644:	0ac10413          	add	s0,sp,172
    4648:	b20ff06f          	j	3968 <_vfprintf_r+0x1d10>
    464c:	08a10693          	add	a3,sp,138
    4650:	00061863          	bnez	a2,4660 <_vfprintf_r+0x2a08>
    4654:	03000693          	li	a3,48
    4658:	08d10523          	sb	a3,138(sp)
    465c:	08b10693          	add	a3,sp,139
    4660:	15010793          	add	a5,sp,336
    4664:	40f68633          	sub	a2,a3,a5
    4668:	030d0713          	add	a4,s10,48
    466c:	0c960793          	add	a5,a2,201
    4670:	00e68023          	sb	a4,0(a3)
    4674:	04f12023          	sw	a5,64(sp)
    4678:	d5cff06f          	j	3bd4 <_vfprintf_r+0x1f7c>
    467c:	001ef713          	and	a4,t4,1
    4680:	d6070863          	beqz	a4,3bf0 <_vfprintf_r+0x1f98>
    4684:	d64ff06f          	j	3be8 <_vfprintf_r+0x1f90>
    4688:	00812783          	lw	a5,8(sp)
    468c:	00000293          	li	t0,0
    4690:	00c79783          	lh	a5,12(a5)
    4694:	0407e793          	or	a5,a5,64
    4698:	00812703          	lw	a4,8(sp)
    469c:	00f71623          	sh	a5,12(a4)
    46a0:	a8dfd06f          	j	212c <_vfprintf_r+0x4d4>
    46a4:	00012823          	sw	zero,16(sp)
    46a8:	00600313          	li	t1,6
    46ac:	ff9fe06f          	j	36a4 <_vfprintf_r+0x1a4c>
    46b0:	06700e13          	li	t3,103
    46b4:	03c12783          	lw	a5,60(sp)
    46b8:	0ff00613          	li	a2,255
    46bc:	0007c703          	lbu	a4,0(a5)
    46c0:	22c70263          	beq	a4,a2,48e4 <_vfprintf_r+0x2c8c>
    46c4:	00000593          	li	a1,0
    46c8:	00000693          	li	a3,0
    46cc:	01475e63          	bge	a4,s4,46e8 <_vfprintf_r+0x2a90>
    46d0:	40ea0a33          	sub	s4,s4,a4
    46d4:	0017c703          	lbu	a4,1(a5)
    46d8:	04070863          	beqz	a4,4728 <_vfprintf_r+0x2ad0>
    46dc:	00168693          	add	a3,a3,1
    46e0:	00178793          	add	a5,a5,1
    46e4:	fec714e3          	bne	a4,a2,46cc <_vfprintf_r+0x2a74>
    46e8:	02f12e23          	sw	a5,60(sp)
    46ec:	02d12023          	sw	a3,32(sp)
    46f0:	02b12223          	sw	a1,36(sp)
    46f4:	02012783          	lw	a5,32(sp)
    46f8:	02412703          	lw	a4,36(sp)
    46fc:	04c12583          	lw	a1,76(sp)
    4700:	05c12823          	sw	t3,80(sp)
    4704:	00e78533          	add	a0,a5,a4
    4708:	2ac0a0ef          	jal	e9b4 <__mulsi3>
    470c:	01a50d33          	add	s10,a0,s10
    4710:	fffd4813          	not	a6,s10
    4714:	41f85813          	sra	a6,a6,0x1f
    4718:	05012e03          	lw	t3,80(sp)
    471c:	010d7cb3          	and	s9,s10,a6
    4720:	000b0e93          	mv	t4,s6
    4724:	cecff06f          	j	3c10 <_vfprintf_r+0x1fb8>
    4728:	0007c703          	lbu	a4,0(a5)
    472c:	00158593          	add	a1,a1,1
    4730:	fb5ff06f          	j	46e4 <_vfprintf_r+0x2a8c>
    4734:	03012783          	lw	a5,48(sp)
    4738:	06600e13          	li	t3,102
    473c:	00f306b3          	add	a3,t1,a5
    4740:	01468d33          	add	s10,a3,s4
    4744:	d99ff06f          	j	44dc <_vfprintf_r+0x2884>
    4748:	02c12783          	lw	a5,44(sp)
    474c:	0a07c863          	bltz	a5,47fc <_vfprintf_r+0x2ba4>
    4750:	07714603          	lbu	a2,119(sp)
    4754:	04700713          	li	a4,71
    4758:	0000ac17          	auipc	s8,0xa
    475c:	6a4c0c13          	add	s8,s8,1700 # edfc <__fini_array_end+0x250>
    4760:	01c75463          	bge	a4,t3,4768 <_vfprintf_r+0x2b10>
    4764:	b31fd06f          	j	2294 <_vfprintf_r+0x63c>
    4768:	0000ac17          	auipc	s8,0xa
    476c:	690c0c13          	add	s8,s8,1680 # edf8 <__fini_array_end+0x24c>
    4770:	b25fd06f          	j	2294 <_vfprintf_r+0x63c>
    4774:	07714603          	lbu	a2,119(sp)
    4778:	01612a23          	sw	s6,20(sp)
    477c:	02012223          	sw	zero,36(sp)
    4780:	02012023          	sw	zero,32(sp)
    4784:	00030c93          	mv	s9,t1
    4788:	00030d13          	mv	s10,t1
    478c:	07300e13          	li	t3,115
    4790:	00000313          	li	t1,0
    4794:	00061463          	bnez	a2,479c <_vfprintf_r+0x2b44>
    4798:	f00fd06f          	j	1e98 <_vfprintf_r+0x240>
    479c:	b1dfd06f          	j	22b8 <_vfprintf_r+0x660>
    47a0:	00040313          	mv	t1,s0
    47a4:	01012903          	lw	s2,16(sp)
    47a8:	000b0413          	mv	s0,s6
    47ac:	01412e03          	lw	t3,20(sp)
    47b0:	000c0b13          	mv	s6,s8
    47b4:	000a0e93          	mv	t4,s4
    47b8:	000c8c13          	mv	s8,s9
    47bc:	00030d13          	mv	s10,t1
    47c0:	87cff06f          	j	383c <_vfprintf_r+0x1be4>
    47c4:	001b0793          	add	a5,s6,1
    47c8:	000c0993          	mv	s3,s8
    47cc:	02412903          	lw	s2,36(sp)
    47d0:	04012e83          	lw	t4,64(sp)
    47d4:	05012e03          	lw	t3,80(sp)
    47d8:	05412403          	lw	s0,84(sp)
    47dc:	000d0c13          	mv	s8,s10
    47e0:	00f487b3          	add	a5,s1,a5
    47e4:	03000693          	li	a3,48
    47e8:	840b40e3          	bltz	s6,4028 <_vfprintf_r+0x23d0>
    47ec:	00148493          	add	s1,s1,1
    47f0:	fed48fa3          	sb	a3,-1(s1)
    47f4:	fe979ce3          	bne	a5,s1,47ec <_vfprintf_r+0x2b94>
    47f8:	835ff06f          	j	402c <_vfprintf_r+0x23d4>
    47fc:	02d00793          	li	a5,45
    4800:	06f10ba3          	sb	a5,119(sp)
    4804:	02d00613          	li	a2,45
    4808:	f4dff06f          	j	4754 <_vfprintf_r+0x2afc>
    480c:	00100693          	li	a3,1
    4810:	414686b3          	sub	a3,a3,s4
    4814:	06d12e23          	sw	a3,124(sp)
    4818:	da4ff06f          	j	3dbc <_vfprintf_r+0x2164>
    481c:	01412783          	lw	a5,20(sp)
    4820:	0007ab03          	lw	s6,0(a5)
    4824:	00478793          	add	a5,a5,4
    4828:	000b5463          	bgez	s6,4830 <_vfprintf_r+0x2bd8>
    482c:	fff00b13          	li	s6,-1
    4830:	00194e03          	lbu	t3,1(s2)
    4834:	00f12a23          	sw	a5,20(sp)
    4838:	00068913          	mv	s2,a3
    483c:	dccfd06f          	j	1e08 <_vfprintf_r+0x1b0>
    4840:	00071a63          	bnez	a4,4854 <_vfprintf_r+0x2bfc>
    4844:	00100c93          	li	s9,1
    4848:	06600e13          	li	t3,102
    484c:	00100d13          	li	s10,1
    4850:	879ff06f          	j	40c8 <_vfprintf_r+0x2470>
    4854:	03012783          	lw	a5,48(sp)
    4858:	06600e13          	li	t3,102
    485c:	00178693          	add	a3,a5,1
    4860:	00668d33          	add	s10,a3,t1
    4864:	fffd4813          	not	a6,s10
    4868:	41f85813          	sra	a6,a6,0x1f
    486c:	010d7cb3          	and	s9,s10,a6
    4870:	859ff06f          	j	40c8 <_vfprintf_r+0x2470>
    4874:	00200793          	li	a5,2
    4878:	04f12023          	sw	a5,64(sp)
    487c:	b58ff06f          	j	3bd4 <_vfprintf_r+0x1f7c>
    4880:	00812703          	lw	a4,8(sp)
    4884:	00c71783          	lh	a5,12(a4)
    4888:	0407e793          	or	a5,a5,64
    488c:	00f71623          	sh	a5,12(a4)
    4890:	8b5fd06f          	j	2144 <_vfprintf_r+0x4ec>
    4894:	000a0513          	mv	a0,s4
    4898:	000d0593          	mv	a1,s10
    489c:	00030613          	mv	a2,t1
    48a0:	00038693          	mv	a3,t2
    48a4:	05012023          	sw	a6,64(sp)
    48a8:	03c12223          	sw	t3,36(sp)
    48ac:	01d12c23          	sw	t4,24(sp)
    48b0:	7a8080ef          	jal	d058 <__eqdf2>
    48b4:	01812e83          	lw	t4,24(sp)
    48b8:	02412e03          	lw	t3,36(sp)
    48bc:	04012803          	lw	a6,64(sp)
    48c0:	f6051463          	bnez	a0,4028 <_vfprintf_r+0x23d0>
    48c4:	001b7693          	and	a3,s6,1
    48c8:	f6068063          	beqz	a3,4028 <_vfprintf_r+0x23d0>
    48cc:	f14ff06f          	j	3fe0 <_vfprintf_r+0x2388>
    48d0:	00812783          	lw	a5,8(sp)
    48d4:	01012283          	lw	t0,16(sp)
    48d8:	00c79783          	lh	a5,12(a5)
    48dc:	0407e793          	or	a5,a5,64
    48e0:	db9ff06f          	j	4698 <_vfprintf_r+0x2a40>
    48e4:	02012223          	sw	zero,36(sp)
    48e8:	02012023          	sw	zero,32(sp)
    48ec:	e09ff06f          	j	46f4 <_vfprintf_r+0x2a9c>
    48f0:	04500d13          	li	s10,69
    48f4:	cccff06f          	j	3dc0 <_vfprintf_r+0x2168>

000048f8 <__sbprintf>:
    48f8:	b7010113          	add	sp,sp,-1168
    48fc:	00c59783          	lh	a5,12(a1)
    4900:	00e5d703          	lhu	a4,14(a1)
    4904:	48812423          	sw	s0,1160(sp)
    4908:	00058413          	mv	s0,a1
    490c:	000105b7          	lui	a1,0x10
    4910:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x915>
    4914:	06442303          	lw	t1,100(s0)
    4918:	01c42883          	lw	a7,28(s0)
    491c:	02442803          	lw	a6,36(s0)
    4920:	01071713          	sll	a4,a4,0x10
    4924:	00b7f7b3          	and	a5,a5,a1
    4928:	00e7e7b3          	or	a5,a5,a4
    492c:	40000593          	li	a1,1024
    4930:	49212023          	sw	s2,1152(sp)
    4934:	00f12a23          	sw	a5,20(sp)
    4938:	00050913          	mv	s2,a0
    493c:	07010793          	add	a5,sp,112
    4940:	06010513          	add	a0,sp,96
    4944:	48112623          	sw	ra,1164(sp)
    4948:	48912223          	sw	s1,1156(sp)
    494c:	47312e23          	sw	s3,1148(sp)
    4950:	00060493          	mv	s1,a2
    4954:	00068993          	mv	s3,a3
    4958:	06612623          	sw	t1,108(sp)
    495c:	03112223          	sw	a7,36(sp)
    4960:	03012623          	sw	a6,44(sp)
    4964:	00f12423          	sw	a5,8(sp)
    4968:	00f12c23          	sw	a5,24(sp)
    496c:	00b12823          	sw	a1,16(sp)
    4970:	00b12e23          	sw	a1,28(sp)
    4974:	02012023          	sw	zero,32(sp)
    4978:	b7cfc0ef          	jal	cf4 <__retarget_lock_init_recursive>
    497c:	00048613          	mv	a2,s1
    4980:	00098693          	mv	a3,s3
    4984:	00810593          	add	a1,sp,8
    4988:	00090513          	mv	a0,s2
    498c:	accfd0ef          	jal	1c58 <_vfprintf_r>
    4990:	00050493          	mv	s1,a0
    4994:	04055263          	bgez	a0,49d8 <__sbprintf+0xe0>
    4998:	01415783          	lhu	a5,20(sp)
    499c:	0407f793          	and	a5,a5,64
    49a0:	00078863          	beqz	a5,49b0 <__sbprintf+0xb8>
    49a4:	00c45783          	lhu	a5,12(s0)
    49a8:	0407e793          	or	a5,a5,64
    49ac:	00f41623          	sh	a5,12(s0)
    49b0:	06012503          	lw	a0,96(sp)
    49b4:	b44fc0ef          	jal	cf8 <__retarget_lock_close_recursive>
    49b8:	48c12083          	lw	ra,1164(sp)
    49bc:	48812403          	lw	s0,1160(sp)
    49c0:	48012903          	lw	s2,1152(sp)
    49c4:	47c12983          	lw	s3,1148(sp)
    49c8:	00048513          	mv	a0,s1
    49cc:	48412483          	lw	s1,1156(sp)
    49d0:	49010113          	add	sp,sp,1168
    49d4:	00008067          	ret
    49d8:	00810593          	add	a1,sp,8
    49dc:	00090513          	mv	a0,s2
    49e0:	449010ef          	jal	6628 <_fflush_r>
    49e4:	fa050ae3          	beqz	a0,4998 <__sbprintf+0xa0>
    49e8:	fff00493          	li	s1,-1
    49ec:	fadff06f          	j	4998 <__sbprintf+0xa0>

000049f0 <__sprint_r.part.0>:
    49f0:	0645a783          	lw	a5,100(a1)
    49f4:	fd010113          	add	sp,sp,-48
    49f8:	01612823          	sw	s6,16(sp)
    49fc:	02112623          	sw	ra,44(sp)
    4a00:	01279713          	sll	a4,a5,0x12
    4a04:	00060b13          	mv	s6,a2
    4a08:	0e075863          	bgez	a4,4af8 <__sprint_r.part.0+0x108>
    4a0c:	00862783          	lw	a5,8(a2)
    4a10:	03212023          	sw	s2,32(sp)
    4a14:	01312e23          	sw	s3,28(sp)
    4a18:	01512a23          	sw	s5,20(sp)
    4a1c:	01712623          	sw	s7,12(sp)
    4a20:	00058913          	mv	s2,a1
    4a24:	00062b83          	lw	s7,0(a2)
    4a28:	00050993          	mv	s3,a0
    4a2c:	fff00a93          	li	s5,-1
    4a30:	0a078863          	beqz	a5,4ae0 <__sprint_r.part.0+0xf0>
    4a34:	02812423          	sw	s0,40(sp)
    4a38:	02912223          	sw	s1,36(sp)
    4a3c:	01412c23          	sw	s4,24(sp)
    4a40:	01812423          	sw	s8,8(sp)
    4a44:	004bac03          	lw	s8,4(s7)
    4a48:	000ba403          	lw	s0,0(s7)
    4a4c:	002c5a13          	srl	s4,s8,0x2
    4a50:	060a0663          	beqz	s4,4abc <__sprint_r.part.0+0xcc>
    4a54:	00000493          	li	s1,0
    4a58:	00c0006f          	j	4a64 <__sprint_r.part.0+0x74>
    4a5c:	00440413          	add	s0,s0,4
    4a60:	049a0c63          	beq	s4,s1,4ab8 <__sprint_r.part.0+0xc8>
    4a64:	00042583          	lw	a1,0(s0)
    4a68:	00090613          	mv	a2,s2
    4a6c:	00098513          	mv	a0,s3
    4a70:	10d020ef          	jal	737c <_fputwc_r>
    4a74:	00148493          	add	s1,s1,1
    4a78:	ff5512e3          	bne	a0,s5,4a5c <__sprint_r.part.0+0x6c>
    4a7c:	02812403          	lw	s0,40(sp)
    4a80:	02412483          	lw	s1,36(sp)
    4a84:	02012903          	lw	s2,32(sp)
    4a88:	01c12983          	lw	s3,28(sp)
    4a8c:	01812a03          	lw	s4,24(sp)
    4a90:	01412a83          	lw	s5,20(sp)
    4a94:	00c12b83          	lw	s7,12(sp)
    4a98:	00812c03          	lw	s8,8(sp)
    4a9c:	fff00513          	li	a0,-1
    4aa0:	02c12083          	lw	ra,44(sp)
    4aa4:	000b2423          	sw	zero,8(s6)
    4aa8:	000b2223          	sw	zero,4(s6)
    4aac:	01012b03          	lw	s6,16(sp)
    4ab0:	03010113          	add	sp,sp,48
    4ab4:	00008067          	ret
    4ab8:	008b2783          	lw	a5,8(s6)
    4abc:	ffcc7c13          	and	s8,s8,-4
    4ac0:	418787b3          	sub	a5,a5,s8
    4ac4:	00fb2423          	sw	a5,8(s6)
    4ac8:	008b8b93          	add	s7,s7,8
    4acc:	f6079ce3          	bnez	a5,4a44 <__sprint_r.part.0+0x54>
    4ad0:	02812403          	lw	s0,40(sp)
    4ad4:	02412483          	lw	s1,36(sp)
    4ad8:	01812a03          	lw	s4,24(sp)
    4adc:	00812c03          	lw	s8,8(sp)
    4ae0:	02012903          	lw	s2,32(sp)
    4ae4:	01c12983          	lw	s3,28(sp)
    4ae8:	01412a83          	lw	s5,20(sp)
    4aec:	00c12b83          	lw	s7,12(sp)
    4af0:	00000513          	li	a0,0
    4af4:	fadff06f          	j	4aa0 <__sprint_r.part.0+0xb0>
    4af8:	6b5010ef          	jal	69ac <__sfvwrite_r>
    4afc:	02c12083          	lw	ra,44(sp)
    4b00:	000b2423          	sw	zero,8(s6)
    4b04:	000b2223          	sw	zero,4(s6)
    4b08:	01012b03          	lw	s6,16(sp)
    4b0c:	03010113          	add	sp,sp,48
    4b10:	00008067          	ret

00004b14 <__sprint_r>:
    4b14:	00862703          	lw	a4,8(a2)
    4b18:	00070463          	beqz	a4,4b20 <__sprint_r+0xc>
    4b1c:	ed5ff06f          	j	49f0 <__sprint_r.part.0>
    4b20:	00062223          	sw	zero,4(a2)
    4b24:	00000513          	li	a0,0
    4b28:	00008067          	ret

00004b2c <_vfiprintf_r>:
    4b2c:	eb010113          	add	sp,sp,-336
    4b30:	14812423          	sw	s0,328(sp)
    4b34:	13312e23          	sw	s3,316(sp)
    4b38:	13812423          	sw	s8,296(sp)
    4b3c:	00050413          	mv	s0,a0
    4b40:	00058993          	mv	s3,a1
    4b44:	00060c13          	mv	s8,a2
    4b48:	00000593          	li	a1,0
    4b4c:	00800613          	li	a2,8
    4b50:	05010513          	add	a0,sp,80
    4b54:	13512a23          	sw	s5,308(sp)
    4b58:	14112623          	sw	ra,332(sp)
    4b5c:	00068a93          	mv	s5,a3
    4b60:	9a4fc0ef          	jal	d04 <memset>
    4b64:	00040863          	beqz	s0,4b74 <_vfiprintf_r+0x48>
    4b68:	03442783          	lw	a5,52(s0)
    4b6c:	00079463          	bnez	a5,4b74 <_vfiprintf_r+0x48>
    4b70:	49c0106f          	j	600c <_vfiprintf_r+0x14e0>
    4b74:	0649a703          	lw	a4,100(s3)
    4b78:	00c99783          	lh	a5,12(s3)
    4b7c:	00177713          	and	a4,a4,1
    4b80:	00071863          	bnez	a4,4b90 <_vfiprintf_r+0x64>
    4b84:	2007f713          	and	a4,a5,512
    4b88:	00071463          	bnez	a4,4b90 <_vfiprintf_r+0x64>
    4b8c:	0b80106f          	j	5c44 <_vfiprintf_r+0x1118>
    4b90:	01279713          	sll	a4,a5,0x12
    4b94:	02074663          	bltz	a4,4bc0 <_vfiprintf_r+0x94>
    4b98:	0649a703          	lw	a4,100(s3)
    4b9c:	00002637          	lui	a2,0x2
    4ba0:	ffffe6b7          	lui	a3,0xffffe
    4ba4:	00c7e7b3          	or	a5,a5,a2
    4ba8:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4bac:	01079793          	sll	a5,a5,0x10
    4bb0:	4107d793          	sra	a5,a5,0x10
    4bb4:	00d77733          	and	a4,a4,a3
    4bb8:	00f99623          	sh	a5,12(s3)
    4bbc:	06e9a223          	sw	a4,100(s3)
    4bc0:	0087f713          	and	a4,a5,8
    4bc4:	2e070463          	beqz	a4,4eac <_vfiprintf_r+0x380>
    4bc8:	0109a703          	lw	a4,16(s3)
    4bcc:	2e070063          	beqz	a4,4eac <_vfiprintf_r+0x380>
    4bd0:	01a7f713          	and	a4,a5,26
    4bd4:	00a00693          	li	a3,10
    4bd8:	2ed70c63          	beq	a4,a3,4ed0 <_vfiprintf_r+0x3a4>
    4bdc:	13412c23          	sw	s4,312(sp)
    4be0:	06c10a13          	add	s4,sp,108
    4be4:	14912223          	sw	s1,324(sp)
    4be8:	15212023          	sw	s2,320(sp)
    4bec:	13612823          	sw	s6,304(sp)
    4bf0:	13712623          	sw	s7,300(sp)
    4bf4:	13912223          	sw	s9,292(sp)
    4bf8:	13a12023          	sw	s10,288(sp)
    4bfc:	000c0c93          	mv	s9,s8
    4c00:	11b12e23          	sw	s11,284(sp)
    4c04:	07412023          	sw	s4,96(sp)
    4c08:	06012423          	sw	zero,104(sp)
    4c0c:	06012223          	sw	zero,100(sp)
    4c10:	00012a23          	sw	zero,20(sp)
    4c14:	02012623          	sw	zero,44(sp)
    4c18:	02012823          	sw	zero,48(sp)
    4c1c:	02012a23          	sw	zero,52(sp)
    4c20:	00012623          	sw	zero,12(sp)
    4c24:	7fffc497          	auipc	s1,0x7fffc
    4c28:	91048493          	add	s1,s1,-1776 # 80000534 <__global_locale>
    4c2c:	02500913          	li	s2,37
    4c30:	0000ab97          	auipc	s7,0xa
    4c34:	6f0b8b93          	add	s7,s7,1776 # f320 <blanks.1+0x10>
    4c38:	0000bb17          	auipc	s6,0xb
    4c3c:	854b0b13          	add	s6,s6,-1964 # f48c <zeroes.0>
    4c40:	000a0c13          	mv	s8,s4
    4c44:	000c8d93          	mv	s11,s9
    4c48:	0e44ad03          	lw	s10,228(s1)
    4c4c:	16d020ef          	jal	75b8 <__locale_mb_cur_max>
    4c50:	00050693          	mv	a3,a0
    4c54:	05010713          	add	a4,sp,80
    4c58:	000d8613          	mv	a2,s11
    4c5c:	04810593          	add	a1,sp,72
    4c60:	00040513          	mv	a0,s0
    4c64:	000d00e7          	jalr	s10
    4c68:	2e050e63          	beqz	a0,4f64 <_vfiprintf_r+0x438>
    4c6c:	2c054e63          	bltz	a0,4f48 <_vfiprintf_r+0x41c>
    4c70:	04812783          	lw	a5,72(sp)
    4c74:	01278663          	beq	a5,s2,4c80 <_vfiprintf_r+0x154>
    4c78:	00ad8db3          	add	s11,s11,a0
    4c7c:	fcdff06f          	j	4c48 <_vfiprintf_r+0x11c>
    4c80:	00050d13          	mv	s10,a0
    4c84:	419d87b3          	sub	a5,s11,s9
    4c88:	2f9d9463          	bne	s11,s9,4f70 <_vfiprintf_r+0x444>
    4c8c:	00000e13          	li	t3,0
    4c90:	001dc683          	lbu	a3,1(s11)
    4c94:	001d8c93          	add	s9,s11,1
    4c98:	040101a3          	sb	zero,67(sp)
    4c9c:	fff00713          	li	a4,-1
    4ca0:	00000893          	li	a7,0
    4ca4:	05a00d13          	li	s10,90
    4ca8:	000e0d93          	mv	s11,t3
    4cac:	001c8c93          	add	s9,s9,1
    4cb0:	fe068793          	add	a5,a3,-32
    4cb4:	04fd6663          	bltu	s10,a5,4d00 <_vfiprintf_r+0x1d4>
    4cb8:	00279793          	sll	a5,a5,0x2
    4cbc:	017787b3          	add	a5,a5,s7
    4cc0:	0007a783          	lw	a5,0(a5)
    4cc4:	017787b3          	add	a5,a5,s7
    4cc8:	00078067          	jr	a5
    4ccc:	00000893          	li	a7,0
    4cd0:	fd068793          	add	a5,a3,-48
    4cd4:	00900593          	li	a1,9
    4cd8:	000cc683          	lbu	a3,0(s9)
    4cdc:	00289613          	sll	a2,a7,0x2
    4ce0:	011608b3          	add	a7,a2,a7
    4ce4:	00189893          	sll	a7,a7,0x1
    4ce8:	011788b3          	add	a7,a5,a7
    4cec:	fd068793          	add	a5,a3,-48
    4cf0:	001c8c93          	add	s9,s9,1
    4cf4:	fef5f2e3          	bgeu	a1,a5,4cd8 <_vfiprintf_r+0x1ac>
    4cf8:	fe068793          	add	a5,a3,-32
    4cfc:	fafd7ee3          	bgeu	s10,a5,4cb8 <_vfiprintf_r+0x18c>
    4d00:	000d8e13          	mv	t3,s11
    4d04:	2c068663          	beqz	a3,4fd0 <_vfiprintf_r+0x4a4>
    4d08:	0ad10623          	sb	a3,172(sp)
    4d0c:	040101a3          	sb	zero,67(sp)
    4d10:	00100e93          	li	t4,1
    4d14:	00100d13          	li	s10,1
    4d18:	0ac10813          	add	a6,sp,172
    4d1c:	00012823          	sw	zero,16(sp)
    4d20:	00000713          	li	a4,0
    4d24:	00000f93          	li	t6,0
    4d28:	06412603          	lw	a2,100(sp)
    4d2c:	084e7293          	and	t0,t3,132
    4d30:	06812783          	lw	a5,104(sp)
    4d34:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x3a9>
    4d38:	00058f13          	mv	t5,a1
    4d3c:	00029663          	bnez	t0,4d48 <_vfiprintf_r+0x21c>
    4d40:	41d88db3          	sub	s11,a7,t4
    4d44:	47b046e3          	bgtz	s11,59b0 <_vfiprintf_r+0xe84>
    4d48:	04314583          	lbu	a1,67(sp)
    4d4c:	02058a63          	beqz	a1,4d80 <_vfiprintf_r+0x254>
    4d50:	04310613          	add	a2,sp,67
    4d54:	00178793          	add	a5,a5,1
    4d58:	00100693          	li	a3,1
    4d5c:	00cc2023          	sw	a2,0(s8)
    4d60:	00dc2223          	sw	a3,4(s8)
    4d64:	06f12423          	sw	a5,104(sp)
    4d68:	07e12223          	sw	t5,100(sp)
    4d6c:	00700613          	li	a2,7
    4d70:	35e64ce3          	blt	a2,t5,58c8 <_vfiprintf_r+0xd9c>
    4d74:	000f0613          	mv	a2,t5
    4d78:	008c0c13          	add	s8,s8,8
    4d7c:	001f0f13          	add	t5,t5,1
    4d80:	080f8063          	beqz	t6,4e00 <_vfiprintf_r+0x2d4>
    4d84:	00200613          	li	a2,2
    4d88:	00278793          	add	a5,a5,2
    4d8c:	04410693          	add	a3,sp,68
    4d90:	00cc2223          	sw	a2,4(s8)
    4d94:	00dc2023          	sw	a3,0(s8)
    4d98:	06f12423          	sw	a5,104(sp)
    4d9c:	07e12223          	sw	t5,100(sp)
    4da0:	00700613          	li	a2,7
    4da4:	3be652e3          	bge	a2,t5,5948 <_vfiprintf_r+0xe1c>
    4da8:	60078ae3          	beqz	a5,5bbc <_vfiprintf_r+0x1090>
    4dac:	06010613          	add	a2,sp,96
    4db0:	00098593          	mv	a1,s3
    4db4:	00040513          	mv	a0,s0
    4db8:	03d12c23          	sw	t4,56(sp)
    4dbc:	02e12423          	sw	a4,40(sp)
    4dc0:	03112223          	sw	a7,36(sp)
    4dc4:	03012023          	sw	a6,32(sp)
    4dc8:	00512e23          	sw	t0,28(sp)
    4dcc:	01c12c23          	sw	t3,24(sp)
    4dd0:	c21ff0ef          	jal	49f0 <__sprint_r.part.0>
    4dd4:	22051463          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    4dd8:	06412603          	lw	a2,100(sp)
    4ddc:	06812783          	lw	a5,104(sp)
    4de0:	03812e83          	lw	t4,56(sp)
    4de4:	02812703          	lw	a4,40(sp)
    4de8:	02412883          	lw	a7,36(sp)
    4dec:	02012803          	lw	a6,32(sp)
    4df0:	01c12283          	lw	t0,28(sp)
    4df4:	01812e03          	lw	t3,24(sp)
    4df8:	000a0c13          	mv	s8,s4
    4dfc:	00160f13          	add	t5,a2,1
    4e00:	08000593          	li	a1,128
    4e04:	06b286e3          	beq	t0,a1,5670 <_vfiprintf_r+0xb44>
    4e08:	41a70733          	sub	a4,a4,s10
    4e0c:	1ae04ae3          	bgtz	a4,57c0 <_vfiprintf_r+0xc94>
    4e10:	00fd07b3          	add	a5,s10,a5
    4e14:	010c2023          	sw	a6,0(s8)
    4e18:	01ac2223          	sw	s10,4(s8)
    4e1c:	06f12423          	sw	a5,104(sp)
    4e20:	07e12223          	sw	t5,100(sp)
    4e24:	00700713          	li	a4,7
    4e28:	03e758e3          	bge	a4,t5,5658 <_vfiprintf_r+0xb2c>
    4e2c:	24078063          	beqz	a5,506c <_vfiprintf_r+0x540>
    4e30:	06010613          	add	a2,sp,96
    4e34:	00098593          	mv	a1,s3
    4e38:	00040513          	mv	a0,s0
    4e3c:	03d12023          	sw	t4,32(sp)
    4e40:	01112e23          	sw	a7,28(sp)
    4e44:	01c12c23          	sw	t3,24(sp)
    4e48:	ba9ff0ef          	jal	49f0 <__sprint_r.part.0>
    4e4c:	1a051863          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    4e50:	06812783          	lw	a5,104(sp)
    4e54:	02012e83          	lw	t4,32(sp)
    4e58:	01c12883          	lw	a7,28(sp)
    4e5c:	01812e03          	lw	t3,24(sp)
    4e60:	000a0c13          	mv	s8,s4
    4e64:	004e7e13          	and	t3,t3,4
    4e68:	000e0663          	beqz	t3,4e74 <_vfiprintf_r+0x348>
    4e6c:	41d88db3          	sub	s11,a7,t4
    4e70:	21b04a63          	bgtz	s11,5084 <_vfiprintf_r+0x558>
    4e74:	01d8d463          	bge	a7,t4,4e7c <_vfiprintf_r+0x350>
    4e78:	000e8893          	mv	a7,t4
    4e7c:	00c12703          	lw	a4,12(sp)
    4e80:	01170733          	add	a4,a4,a7
    4e84:	00e12623          	sw	a4,12(sp)
    4e88:	16079063          	bnez	a5,4fe8 <_vfiprintf_r+0x4bc>
    4e8c:	01012783          	lw	a5,16(sp)
    4e90:	06012223          	sw	zero,100(sp)
    4e94:	00078863          	beqz	a5,4ea4 <_vfiprintf_r+0x378>
    4e98:	00078593          	mv	a1,a5
    4e9c:	00040513          	mv	a0,s0
    4ea0:	ab4fc0ef          	jal	1154 <_free_r>
    4ea4:	000a0c13          	mv	s8,s4
    4ea8:	d9dff06f          	j	4c44 <_vfiprintf_r+0x118>
    4eac:	00098593          	mv	a1,s3
    4eb0:	00040513          	mv	a0,s0
    4eb4:	224020ef          	jal	70d8 <__swsetup_r>
    4eb8:	00050463          	beqz	a0,4ec0 <_vfiprintf_r+0x394>
    4ebc:	3840106f          	j	6240 <_vfiprintf_r+0x1714>
    4ec0:	00c99783          	lh	a5,12(s3)
    4ec4:	00a00693          	li	a3,10
    4ec8:	01a7f713          	and	a4,a5,26
    4ecc:	d0d718e3          	bne	a4,a3,4bdc <_vfiprintf_r+0xb0>
    4ed0:	00e99703          	lh	a4,14(s3)
    4ed4:	d00744e3          	bltz	a4,4bdc <_vfiprintf_r+0xb0>
    4ed8:	0649a703          	lw	a4,100(s3)
    4edc:	00177713          	and	a4,a4,1
    4ee0:	00071863          	bnez	a4,4ef0 <_vfiprintf_r+0x3c4>
    4ee4:	2007f793          	and	a5,a5,512
    4ee8:	00079463          	bnez	a5,4ef0 <_vfiprintf_r+0x3c4>
    4eec:	2ac0106f          	j	6198 <_vfiprintf_r+0x166c>
    4ef0:	000a8693          	mv	a3,s5
    4ef4:	000c0613          	mv	a2,s8
    4ef8:	00098593          	mv	a1,s3
    4efc:	00040513          	mv	a0,s0
    4f00:	3e4010ef          	jal	62e4 <__sbprintf>
    4f04:	14c12083          	lw	ra,332(sp)
    4f08:	14812403          	lw	s0,328(sp)
    4f0c:	00a12623          	sw	a0,12(sp)
    4f10:	00c12503          	lw	a0,12(sp)
    4f14:	13c12983          	lw	s3,316(sp)
    4f18:	13412a83          	lw	s5,308(sp)
    4f1c:	12812c03          	lw	s8,296(sp)
    4f20:	15010113          	add	sp,sp,336
    4f24:	00008067          	ret
    4f28:	000aa883          	lw	a7,0(s5)
    4f2c:	004a8a93          	add	s5,s5,4
    4f30:	3608cc63          	bltz	a7,52a8 <_vfiprintf_r+0x77c>
    4f34:	000cc683          	lbu	a3,0(s9)
    4f38:	d75ff06f          	j	4cac <_vfiprintf_r+0x180>
    4f3c:	000cc683          	lbu	a3,0(s9)
    4f40:	020ded93          	or	s11,s11,32
    4f44:	d69ff06f          	j	4cac <_vfiprintf_r+0x180>
    4f48:	00800613          	li	a2,8
    4f4c:	00000593          	li	a1,0
    4f50:	05010513          	add	a0,sp,80
    4f54:	db1fb0ef          	jal	d04 <memset>
    4f58:	00100513          	li	a0,1
    4f5c:	00ad8db3          	add	s11,s11,a0
    4f60:	ce9ff06f          	j	4c48 <_vfiprintf_r+0x11c>
    4f64:	00050d13          	mv	s10,a0
    4f68:	419d87b3          	sub	a5,s11,s9
    4f6c:	079d8263          	beq	s11,s9,4fd0 <_vfiprintf_r+0x4a4>
    4f70:	06812683          	lw	a3,104(sp)
    4f74:	06412703          	lw	a4,100(sp)
    4f78:	019c2023          	sw	s9,0(s8)
    4f7c:	00d786b3          	add	a3,a5,a3
    4f80:	00170713          	add	a4,a4,1
    4f84:	00fc2223          	sw	a5,4(s8)
    4f88:	06d12423          	sw	a3,104(sp)
    4f8c:	06e12223          	sw	a4,100(sp)
    4f90:	00700613          	li	a2,7
    4f94:	008c0c13          	add	s8,s8,8
    4f98:	02e65463          	bge	a2,a4,4fc0 <_vfiprintf_r+0x494>
    4f9c:	38068ce3          	beqz	a3,5b34 <_vfiprintf_r+0x1008>
    4fa0:	06010613          	add	a2,sp,96
    4fa4:	00098593          	mv	a1,s3
    4fa8:	00040513          	mv	a0,s0
    4fac:	00f12823          	sw	a5,16(sp)
    4fb0:	a41ff0ef          	jal	49f0 <__sprint_r.part.0>
    4fb4:	01012783          	lw	a5,16(sp)
    4fb8:	04051c63          	bnez	a0,5010 <_vfiprintf_r+0x4e4>
    4fbc:	000a0c13          	mv	s8,s4
    4fc0:	00c12703          	lw	a4,12(sp)
    4fc4:	00f707b3          	add	a5,a4,a5
    4fc8:	00f12623          	sw	a5,12(sp)
    4fcc:	cc0d10e3          	bnez	s10,4c8c <_vfiprintf_r+0x160>
    4fd0:	06812783          	lw	a5,104(sp)
    4fd4:	00078463          	beqz	a5,4fdc <_vfiprintf_r+0x4b0>
    4fd8:	22c0106f          	j	6204 <_vfiprintf_r+0x16d8>
    4fdc:	00c99783          	lh	a5,12(s3)
    4fe0:	06012223          	sw	zero,100(sp)
    4fe4:	0300006f          	j	5014 <_vfiprintf_r+0x4e8>
    4fe8:	06010613          	add	a2,sp,96
    4fec:	00098593          	mv	a1,s3
    4ff0:	00040513          	mv	a0,s0
    4ff4:	9fdff0ef          	jal	49f0 <__sprint_r.part.0>
    4ff8:	e8050ae3          	beqz	a0,4e8c <_vfiprintf_r+0x360>
    4ffc:	01012783          	lw	a5,16(sp)
    5000:	00078863          	beqz	a5,5010 <_vfiprintf_r+0x4e4>
    5004:	01012583          	lw	a1,16(sp)
    5008:	00040513          	mv	a0,s0
    500c:	948fc0ef          	jal	1154 <_free_r>
    5010:	00c99783          	lh	a5,12(s3)
    5014:	0649a703          	lw	a4,100(s3)
    5018:	00177713          	and	a4,a4,1
    501c:	16070a63          	beqz	a4,5190 <_vfiprintf_r+0x664>
    5020:	0407f793          	and	a5,a5,64
    5024:	14412483          	lw	s1,324(sp)
    5028:	14012903          	lw	s2,320(sp)
    502c:	13812a03          	lw	s4,312(sp)
    5030:	13012b03          	lw	s6,304(sp)
    5034:	12c12b83          	lw	s7,300(sp)
    5038:	12412c83          	lw	s9,292(sp)
    503c:	12012d03          	lw	s10,288(sp)
    5040:	11c12d83          	lw	s11,284(sp)
    5044:	00078463          	beqz	a5,504c <_vfiprintf_r+0x520>
    5048:	2180106f          	j	6260 <_vfiprintf_r+0x1734>
    504c:	14c12083          	lw	ra,332(sp)
    5050:	14812403          	lw	s0,328(sp)
    5054:	00c12503          	lw	a0,12(sp)
    5058:	13c12983          	lw	s3,316(sp)
    505c:	13412a83          	lw	s5,308(sp)
    5060:	12812c03          	lw	s8,296(sp)
    5064:	15010113          	add	sp,sp,336
    5068:	00008067          	ret
    506c:	06012223          	sw	zero,100(sp)
    5070:	004e7e13          	and	t3,t3,4
    5074:	240e0ee3          	beqz	t3,5ad0 <_vfiprintf_r+0xfa4>
    5078:	41d88db3          	sub	s11,a7,t4
    507c:	25b05ae3          	blez	s11,5ad0 <_vfiprintf_r+0xfa4>
    5080:	000a0c13          	mv	s8,s4
    5084:	01000713          	li	a4,16
    5088:	06412683          	lw	a3,100(sp)
    508c:	01b74463          	blt	a4,s11,5094 <_vfiprintf_r+0x568>
    5090:	1900106f          	j	6220 <_vfiprintf_r+0x16f4>
    5094:	000a8713          	mv	a4,s5
    5098:	0000a317          	auipc	t1,0xa
    509c:	40430313          	add	t1,t1,1028 # f49c <blanks.1>
    50a0:	000c0593          	mv	a1,s8
    50a4:	000d8a93          	mv	s5,s11
    50a8:	01000813          	li	a6,16
    50ac:	00700d13          	li	s10,7
    50b0:	01112c23          	sw	a7,24(sp)
    50b4:	01d12e23          	sw	t4,28(sp)
    50b8:	00030c13          	mv	s8,t1
    50bc:	00070d93          	mv	s11,a4
    50c0:	0180006f          	j	50d8 <_vfiprintf_r+0x5ac>
    50c4:	00268613          	add	a2,a3,2
    50c8:	00858593          	add	a1,a1,8
    50cc:	00070693          	mv	a3,a4
    50d0:	ff0a8a93          	add	s5,s5,-16
    50d4:	05585a63          	bge	a6,s5,5128 <_vfiprintf_r+0x5fc>
    50d8:	01078793          	add	a5,a5,16
    50dc:	00168713          	add	a4,a3,1
    50e0:	0185a023          	sw	s8,0(a1)
    50e4:	0105a223          	sw	a6,4(a1)
    50e8:	06f12423          	sw	a5,104(sp)
    50ec:	06e12223          	sw	a4,100(sp)
    50f0:	fced5ae3          	bge	s10,a4,50c4 <_vfiprintf_r+0x598>
    50f4:	56078663          	beqz	a5,5660 <_vfiprintf_r+0xb34>
    50f8:	06010613          	add	a2,sp,96
    50fc:	00098593          	mv	a1,s3
    5100:	00040513          	mv	a0,s0
    5104:	8edff0ef          	jal	49f0 <__sprint_r.part.0>
    5108:	ee051ae3          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    510c:	06412683          	lw	a3,100(sp)
    5110:	01000813          	li	a6,16
    5114:	ff0a8a93          	add	s5,s5,-16
    5118:	06812783          	lw	a5,104(sp)
    511c:	000a0593          	mv	a1,s4
    5120:	00168613          	add	a2,a3,1
    5124:	fb584ae3          	blt	a6,s5,50d8 <_vfiprintf_r+0x5ac>
    5128:	01812883          	lw	a7,24(sp)
    512c:	01c12e83          	lw	t4,28(sp)
    5130:	000d8713          	mv	a4,s11
    5134:	000c0313          	mv	t1,s8
    5138:	000a8d93          	mv	s11,s5
    513c:	00058c13          	mv	s8,a1
    5140:	00070a93          	mv	s5,a4
    5144:	01b787b3          	add	a5,a5,s11
    5148:	006c2023          	sw	t1,0(s8)
    514c:	01bc2223          	sw	s11,4(s8)
    5150:	06f12423          	sw	a5,104(sp)
    5154:	06c12223          	sw	a2,100(sp)
    5158:	00700713          	li	a4,7
    515c:	d0c75ce3          	bge	a4,a2,4e74 <_vfiprintf_r+0x348>
    5160:	160788e3          	beqz	a5,5ad0 <_vfiprintf_r+0xfa4>
    5164:	06010613          	add	a2,sp,96
    5168:	00098593          	mv	a1,s3
    516c:	00040513          	mv	a0,s0
    5170:	01d12e23          	sw	t4,28(sp)
    5174:	01112c23          	sw	a7,24(sp)
    5178:	879ff0ef          	jal	49f0 <__sprint_r.part.0>
    517c:	e80510e3          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    5180:	06812783          	lw	a5,104(sp)
    5184:	01c12e83          	lw	t4,28(sp)
    5188:	01812883          	lw	a7,24(sp)
    518c:	ce9ff06f          	j	4e74 <_vfiprintf_r+0x348>
    5190:	2007f713          	and	a4,a5,512
    5194:	e80716e3          	bnez	a4,5020 <_vfiprintf_r+0x4f4>
    5198:	0589a503          	lw	a0,88(s3)
    519c:	b65fb0ef          	jal	d00 <__retarget_lock_release_recursive>
    51a0:	00c99783          	lh	a5,12(s3)
    51a4:	e7dff06f          	j	5020 <_vfiprintf_r+0x4f4>
    51a8:	000aa803          	lw	a6,0(s5)
    51ac:	040101a3          	sb	zero,67(sp)
    51b0:	000d8e13          	mv	t3,s11
    51b4:	004a8a93          	add	s5,s5,4
    51b8:	68080ae3          	beqz	a6,604c <_vfiprintf_r+0x1520>
    51bc:	05300793          	li	a5,83
    51c0:	3cf68ce3          	beq	a3,a5,5d98 <_vfiprintf_r+0x126c>
    51c4:	010df793          	and	a5,s11,16
    51c8:	3c0798e3          	bnez	a5,5d98 <_vfiprintf_r+0x126c>
    51cc:	00075463          	bgez	a4,51d4 <_vfiprintf_r+0x6a8>
    51d0:	7fd0006f          	j	61cc <_vfiprintf_r+0x16a0>
    51d4:	00070613          	mv	a2,a4
    51d8:	00080513          	mv	a0,a6
    51dc:	00000593          	li	a1,0
    51e0:	03112223          	sw	a7,36(sp)
    51e4:	00e12e23          	sw	a4,28(sp)
    51e8:	01012c23          	sw	a6,24(sp)
    51ec:	03b12023          	sw	s11,32(sp)
    51f0:	258020ef          	jal	7448 <memchr>
    51f4:	00a12823          	sw	a0,16(sp)
    51f8:	01812803          	lw	a6,24(sp)
    51fc:	01c12703          	lw	a4,28(sp)
    5200:	02012e03          	lw	t3,32(sp)
    5204:	02412883          	lw	a7,36(sp)
    5208:	00051463          	bnez	a0,5210 <_vfiprintf_r+0x6e4>
    520c:	7990006f          	j	61a4 <_vfiprintf_r+0x1678>
    5210:	41050d33          	sub	s10,a0,a6
    5214:	fffd4e93          	not	t4,s10
    5218:	41fede93          	sra	t4,t4,0x1f
    521c:	01dd7eb3          	and	t4,s10,t4
    5220:	00012823          	sw	zero,16(sp)
    5224:	6dd0006f          	j	6100 <_vfiprintf_r+0x15d4>
    5228:	04300793          	li	a5,67
    522c:	000d8e13          	mv	t3,s11
    5230:	004a8d93          	add	s11,s5,4
    5234:	00f68663          	beq	a3,a5,5240 <_vfiprintf_r+0x714>
    5238:	010e7793          	and	a5,t3,16
    523c:	280788e3          	beqz	a5,5ccc <_vfiprintf_r+0x11a0>
    5240:	00800613          	li	a2,8
    5244:	00000593          	li	a1,0
    5248:	05810513          	add	a0,sp,88
    524c:	01112e23          	sw	a7,28(sp)
    5250:	01c12c23          	sw	t3,24(sp)
    5254:	ab1fb0ef          	jal	d04 <memset>
    5258:	000aa603          	lw	a2,0(s5)
    525c:	0ac10593          	add	a1,sp,172
    5260:	05810693          	add	a3,sp,88
    5264:	00040513          	mv	a0,s0
    5268:	00b12823          	sw	a1,16(sp)
    526c:	408050ef          	jal	a674 <_wcrtomb_r>
    5270:	fff00793          	li	a5,-1
    5274:	01012583          	lw	a1,16(sp)
    5278:	01812e03          	lw	t3,24(sp)
    527c:	01c12883          	lw	a7,28(sp)
    5280:	00050d13          	mv	s10,a0
    5284:	00f51463          	bne	a0,a5,528c <_vfiprintf_r+0x760>
    5288:	0200106f          	j	62a8 <_vfiprintf_r+0x177c>
    528c:	fff54e93          	not	t4,a0
    5290:	41fede93          	sra	t4,t4,0x1f
    5294:	01d57eb3          	and	t4,a0,t4
    5298:	040101a3          	sb	zero,67(sp)
    529c:	000d8a93          	mv	s5,s11
    52a0:	00058813          	mv	a6,a1
    52a4:	a79ff06f          	j	4d1c <_vfiprintf_r+0x1f0>
    52a8:	411008b3          	neg	a7,a7
    52ac:	000cc683          	lbu	a3,0(s9)
    52b0:	004ded93          	or	s11,s11,4
    52b4:	9f9ff06f          	j	4cac <_vfiprintf_r+0x180>
    52b8:	010dee13          	or	t3,s11,16
    52bc:	020e7793          	and	a5,t3,32
    52c0:	0c0788e3          	beqz	a5,5b90 <_vfiprintf_r+0x1064>
    52c4:	007a8a93          	add	s5,s5,7
    52c8:	ff8afa93          	and	s5,s5,-8
    52cc:	004aa683          	lw	a3,4(s5)
    52d0:	000aad83          	lw	s11,0(s5)
    52d4:	008a8a93          	add	s5,s5,8
    52d8:	00068d13          	mv	s10,a3
    52dc:	3006c263          	bltz	a3,55e0 <_vfiprintf_r+0xab4>
    52e0:	32074063          	bltz	a4,5600 <_vfiprintf_r+0xad4>
    52e4:	01ade6b3          	or	a3,s11,s10
    52e8:	f7fe7e13          	and	t3,t3,-129
    52ec:	30069a63          	bnez	a3,5600 <_vfiprintf_r+0xad4>
    52f0:	68071ae3          	bnez	a4,6184 <_vfiprintf_r+0x1658>
    52f4:	04314783          	lbu	a5,67(sp)
    52f8:	00012823          	sw	zero,16(sp)
    52fc:	00000e93          	li	t4,0
    5300:	00000d13          	li	s10,0
    5304:	11010813          	add	a6,sp,272
    5308:	00078463          	beqz	a5,5310 <_vfiprintf_r+0x7e4>
    530c:	001e8e93          	add	t4,t4,1
    5310:	002e7f93          	and	t6,t3,2
    5314:	a00f8ae3          	beqz	t6,4d28 <_vfiprintf_r+0x1fc>
    5318:	002e8e93          	add	t4,t4,2
    531c:	00200f93          	li	t6,2
    5320:	a09ff06f          	j	4d28 <_vfiprintf_r+0x1fc>
    5324:	000cc683          	lbu	a3,0(s9)
    5328:	06800793          	li	a5,104
    532c:	4ef686e3          	beq	a3,a5,6018 <_vfiprintf_r+0x14ec>
    5330:	040ded93          	or	s11,s11,64
    5334:	979ff06f          	j	4cac <_vfiprintf_r+0x180>
    5338:	010de613          	or	a2,s11,16
    533c:	02067793          	and	a5,a2,32
    5340:	000780e3          	beqz	a5,5b40 <_vfiprintf_r+0x1014>
    5344:	007a8a93          	add	s5,s5,7
    5348:	ff8afa93          	and	s5,s5,-8
    534c:	000aad83          	lw	s11,0(s5)
    5350:	004aad03          	lw	s10,4(s5)
    5354:	008a8a93          	add	s5,s5,8
    5358:	040101a3          	sb	zero,67(sp)
    535c:	00060e13          	mv	t3,a2
    5360:	2a074063          	bltz	a4,5600 <_vfiprintf_r+0xad4>
    5364:	01ade6b3          	or	a3,s11,s10
    5368:	f7f67e13          	and	t3,a2,-129
    536c:	28069a63          	bnez	a3,5600 <_vfiprintf_r+0xad4>
    5370:	00100793          	li	a5,1
    5374:	06071e63          	bnez	a4,53f0 <_vfiprintf_r+0x8c4>
    5378:	f6079ee3          	bnez	a5,52f4 <_vfiprintf_r+0x7c8>
    537c:	00167d13          	and	s10,a2,1
    5380:	0a0d0ce3          	beqz	s10,5c38 <_vfiprintf_r+0x110c>
    5384:	03000793          	li	a5,48
    5388:	10f107a3          	sb	a5,271(sp)
    538c:	000d0e93          	mv	t4,s10
    5390:	10f10813          	add	a6,sp,271
    5394:	2980006f          	j	562c <_vfiprintf_r+0xb00>
    5398:	02b00793          	li	a5,43
    539c:	000cc683          	lbu	a3,0(s9)
    53a0:	04f101a3          	sb	a5,67(sp)
    53a4:	909ff06f          	j	4cac <_vfiprintf_r+0x180>
    53a8:	010de693          	or	a3,s11,16
    53ac:	0206f793          	and	a5,a3,32
    53b0:	7a078c63          	beqz	a5,5b68 <_vfiprintf_r+0x103c>
    53b4:	007a8a93          	add	s5,s5,7
    53b8:	ff8afa93          	and	s5,s5,-8
    53bc:	000aa783          	lw	a5,0(s5)
    53c0:	004aa583          	lw	a1,4(s5)
    53c4:	008a8a93          	add	s5,s5,8
    53c8:	040101a3          	sb	zero,67(sp)
    53cc:	bff6fe13          	and	t3,a3,-1025
    53d0:	02074c63          	bltz	a4,5408 <_vfiprintf_r+0x8dc>
    53d4:	00b7e633          	or	a2,a5,a1
    53d8:	b7f6f693          	and	a3,a3,-1153
    53dc:	420610e3          	bnez	a2,5ffc <_vfiprintf_r+0x14d0>
    53e0:	000e0613          	mv	a2,t3
    53e4:	00000793          	li	a5,0
    53e8:	00068e13          	mv	t3,a3
    53ec:	f80706e3          	beqz	a4,5378 <_vfiprintf_r+0x84c>
    53f0:	00100693          	li	a3,1
    53f4:	58d788e3          	beq	a5,a3,6184 <_vfiprintf_r+0x1658>
    53f8:	00200693          	li	a3,2
    53fc:	46d786e3          	beq	a5,a3,6068 <_vfiprintf_r+0x153c>
    5400:	00000793          	li	a5,0
    5404:	00000593          	li	a1,0
    5408:	11010813          	add	a6,sp,272
    540c:	01d59613          	sll	a2,a1,0x1d
    5410:	0077f693          	and	a3,a5,7
    5414:	0037d793          	srl	a5,a5,0x3
    5418:	03068693          	add	a3,a3,48
    541c:	00f667b3          	or	a5,a2,a5
    5420:	0035d593          	srl	a1,a1,0x3
    5424:	fed80fa3          	sb	a3,-1(a6)
    5428:	00b7e633          	or	a2,a5,a1
    542c:	00080513          	mv	a0,a6
    5430:	fff80813          	add	a6,a6,-1
    5434:	fc061ce3          	bnez	a2,540c <_vfiprintf_r+0x8e0>
    5438:	001e7793          	and	a5,t3,1
    543c:	54078e63          	beqz	a5,5998 <_vfiprintf_r+0xe6c>
    5440:	03000793          	li	a5,48
    5444:	54f68a63          	beq	a3,a5,5998 <_vfiprintf_r+0xe6c>
    5448:	ffe50513          	add	a0,a0,-2
    544c:	fef80fa3          	sb	a5,-1(a6)
    5450:	11010793          	add	a5,sp,272
    5454:	40a78d33          	sub	s10,a5,a0
    5458:	00070e93          	mv	t4,a4
    545c:	09a744e3          	blt	a4,s10,5ce4 <_vfiprintf_r+0x11b8>
    5460:	00050813          	mv	a6,a0
    5464:	1c80006f          	j	562c <_vfiprintf_r+0xb00>
    5468:	000086b7          	lui	a3,0x8
    546c:	83068693          	add	a3,a3,-2000 # 7830 <memmove+0x84>
    5470:	04d11223          	sh	a3,68(sp)
    5474:	0000a697          	auipc	a3,0xa
    5478:	98c68693          	add	a3,a3,-1652 # ee00 <__fini_array_end+0x254>
    547c:	000aa783          	lw	a5,0(s5)
    5480:	00000593          	li	a1,0
    5484:	002dee13          	or	t3,s11,2
    5488:	004a8a93          	add	s5,s5,4
    548c:	00d12a23          	sw	a3,20(sp)
    5490:	040101a3          	sb	zero,67(sp)
    5494:	4c074863          	bltz	a4,5964 <_vfiprintf_r+0xe38>
    5498:	00b7e6b3          	or	a3,a5,a1
    549c:	f7fe7513          	and	a0,t3,-129
    54a0:	4a069c63          	bnez	a3,5958 <_vfiprintf_r+0xe2c>
    54a4:	000e0613          	mv	a2,t3
    54a8:	00200793          	li	a5,2
    54ac:	00050e13          	mv	t3,a0
    54b0:	ec5ff06f          	j	5374 <_vfiprintf_r+0x848>
    54b4:	00040513          	mv	a0,s0
    54b8:	00e12c23          	sw	a4,24(sp)
    54bc:	01112823          	sw	a7,16(sp)
    54c0:	104020ef          	jal	75c4 <_localeconv_r>
    54c4:	00452783          	lw	a5,4(a0)
    54c8:	00078513          	mv	a0,a5
    54cc:	02f12a23          	sw	a5,52(sp)
    54d0:	ab5fb0ef          	jal	f84 <strlen>
    54d4:	00050793          	mv	a5,a0
    54d8:	00040513          	mv	a0,s0
    54dc:	02f12823          	sw	a5,48(sp)
    54e0:	0e4020ef          	jal	75c4 <_localeconv_r>
    54e4:	00852703          	lw	a4,8(a0)
    54e8:	03012783          	lw	a5,48(sp)
    54ec:	01012883          	lw	a7,16(sp)
    54f0:	02e12623          	sw	a4,44(sp)
    54f4:	01812703          	lw	a4,24(sp)
    54f8:	a2078ee3          	beqz	a5,4f34 <_vfiprintf_r+0x408>
    54fc:	02c12783          	lw	a5,44(sp)
    5500:	000cc683          	lbu	a3,0(s9)
    5504:	fa078463          	beqz	a5,4cac <_vfiprintf_r+0x180>
    5508:	0007c783          	lbu	a5,0(a5)
    550c:	fa078063          	beqz	a5,4cac <_vfiprintf_r+0x180>
    5510:	400ded93          	or	s11,s11,1024
    5514:	f98ff06f          	j	4cac <_vfiprintf_r+0x180>
    5518:	020df793          	and	a5,s11,32
    551c:	78079263          	bnez	a5,5ca0 <_vfiprintf_r+0x1174>
    5520:	010df793          	and	a5,s11,16
    5524:	30079ae3          	bnez	a5,6038 <_vfiprintf_r+0x150c>
    5528:	040df793          	and	a5,s11,64
    552c:	400796e3          	bnez	a5,6138 <_vfiprintf_r+0x160c>
    5530:	200dfe13          	and	t3,s11,512
    5534:	300e02e3          	beqz	t3,6038 <_vfiprintf_r+0x150c>
    5538:	000aa783          	lw	a5,0(s5)
    553c:	00c12703          	lw	a4,12(sp)
    5540:	004a8a93          	add	s5,s5,4
    5544:	00e78023          	sb	a4,0(a5)
    5548:	efcff06f          	j	4c44 <_vfiprintf_r+0x118>
    554c:	000cc683          	lbu	a3,0(s9)
    5550:	06c00793          	li	a5,108
    5554:	2cf68ae3          	beq	a3,a5,6028 <_vfiprintf_r+0x14fc>
    5558:	010ded93          	or	s11,s11,16
    555c:	f50ff06f          	j	4cac <_vfiprintf_r+0x180>
    5560:	000cc683          	lbu	a3,0(s9)
    5564:	080ded93          	or	s11,s11,128
    5568:	f44ff06f          	j	4cac <_vfiprintf_r+0x180>
    556c:	000cc683          	lbu	a3,0(s9)
    5570:	02a00793          	li	a5,42
    5574:	001c8593          	add	a1,s9,1
    5578:	54f680e3          	beq	a3,a5,62b8 <_vfiprintf_r+0x178c>
    557c:	fd068793          	add	a5,a3,-48
    5580:	00900613          	li	a2,9
    5584:	00000713          	li	a4,0
    5588:	00900513          	li	a0,9
    558c:	02f66463          	bltu	a2,a5,55b4 <_vfiprintf_r+0xa88>
    5590:	0005c683          	lbu	a3,0(a1)
    5594:	00271613          	sll	a2,a4,0x2
    5598:	00e60733          	add	a4,a2,a4
    559c:	00171713          	sll	a4,a4,0x1
    55a0:	00f70733          	add	a4,a4,a5
    55a4:	fd068793          	add	a5,a3,-48
    55a8:	00158593          	add	a1,a1,1
    55ac:	fef572e3          	bgeu	a0,a5,5590 <_vfiprintf_r+0xa64>
    55b0:	74074063          	bltz	a4,5cf0 <_vfiprintf_r+0x11c4>
    55b4:	00058c93          	mv	s9,a1
    55b8:	ef8ff06f          	j	4cb0 <_vfiprintf_r+0x184>
    55bc:	000cc683          	lbu	a3,0(s9)
    55c0:	001ded93          	or	s11,s11,1
    55c4:	ee8ff06f          	j	4cac <_vfiprintf_r+0x180>
    55c8:	04314783          	lbu	a5,67(sp)
    55cc:	000cc683          	lbu	a3,0(s9)
    55d0:	ec079e63          	bnez	a5,4cac <_vfiprintf_r+0x180>
    55d4:	02000793          	li	a5,32
    55d8:	04f101a3          	sb	a5,67(sp)
    55dc:	ed0ff06f          	j	4cac <_vfiprintf_r+0x180>
    55e0:	02d00613          	li	a2,45
    55e4:	01b036b3          	snez	a3,s11
    55e8:	41a000b3          	neg	ra,s10
    55ec:	04c101a3          	sb	a2,67(sp)
    55f0:	40d08d33          	sub	s10,ra,a3
    55f4:	41b00db3          	neg	s11,s11
    55f8:	00074463          	bltz	a4,5600 <_vfiprintf_r+0xad4>
    55fc:	f7fe7e13          	and	t3,t3,-129
    5600:	120d14e3          	bnez	s10,5f28 <_vfiprintf_r+0x13fc>
    5604:	00900693          	li	a3,9
    5608:	13b6e0e3          	bltu	a3,s11,5f28 <_vfiprintf_r+0x13fc>
    560c:	030d8793          	add	a5,s11,48
    5610:	0ff7f793          	zext.b	a5,a5
    5614:	10f107a3          	sb	a5,271(sp)
    5618:	00070e93          	mv	t4,a4
    561c:	00e04463          	bgtz	a4,5624 <_vfiprintf_r+0xaf8>
    5620:	00100e93          	li	t4,1
    5624:	00100d13          	li	s10,1
    5628:	10f10813          	add	a6,sp,271
    562c:	04314783          	lbu	a5,67(sp)
    5630:	00012823          	sw	zero,16(sp)
    5634:	cc079ce3          	bnez	a5,530c <_vfiprintf_r+0x7e0>
    5638:	cd9ff06f          	j	5310 <_vfiprintf_r+0x7e4>
    563c:	00100713          	li	a4,1
    5640:	000d0793          	mv	a5,s10
    5644:	07012623          	sw	a6,108(sp)
    5648:	07a12823          	sw	s10,112(sp)
    564c:	07a12423          	sw	s10,104(sp)
    5650:	06e12223          	sw	a4,100(sp)
    5654:	000a0c13          	mv	s8,s4
    5658:	008c0c13          	add	s8,s8,8
    565c:	809ff06f          	j	4e64 <_vfiprintf_r+0x338>
    5660:	00100613          	li	a2,1
    5664:	00000693          	li	a3,0
    5668:	000a0593          	mv	a1,s4
    566c:	a65ff06f          	j	50d0 <_vfiprintf_r+0x5a4>
    5670:	41d88db3          	sub	s11,a7,t4
    5674:	f9b05a63          	blez	s11,4e08 <_vfiprintf_r+0x2dc>
    5678:	01000593          	li	a1,16
    567c:	3bb5dae3          	bge	a1,s11,6230 <_vfiprintf_r+0x1704>
    5680:	0000af97          	auipc	t6,0xa
    5684:	e0cf8f93          	add	t6,t6,-500 # f48c <zeroes.0>
    5688:	02e12223          	sw	a4,36(sp)
    568c:	000a8713          	mv	a4,s5
    5690:	000c0693          	mv	a3,s8
    5694:	000d8a93          	mv	s5,s11
    5698:	01000f13          	li	t5,16
    569c:	00700293          	li	t0,7
    56a0:	01c12c23          	sw	t3,24(sp)
    56a4:	01012e23          	sw	a6,28(sp)
    56a8:	03112023          	sw	a7,32(sp)
    56ac:	03d12423          	sw	t4,40(sp)
    56b0:	000f8c13          	mv	s8,t6
    56b4:	00070d93          	mv	s11,a4
    56b8:	0180006f          	j	56d0 <_vfiprintf_r+0xba4>
    56bc:	00260513          	add	a0,a2,2
    56c0:	00868693          	add	a3,a3,8
    56c4:	00070613          	mv	a2,a4
    56c8:	ff0a8a93          	add	s5,s5,-16
    56cc:	055f5c63          	bge	t5,s5,5724 <_vfiprintf_r+0xbf8>
    56d0:	01078793          	add	a5,a5,16
    56d4:	00160713          	add	a4,a2,1
    56d8:	0186a023          	sw	s8,0(a3)
    56dc:	01e6a223          	sw	t5,4(a3)
    56e0:	06f12423          	sw	a5,104(sp)
    56e4:	06e12223          	sw	a4,100(sp)
    56e8:	fce2dae3          	bge	t0,a4,56bc <_vfiprintf_r+0xb90>
    56ec:	1c078663          	beqz	a5,58b8 <_vfiprintf_r+0xd8c>
    56f0:	06010613          	add	a2,sp,96
    56f4:	00098593          	mv	a1,s3
    56f8:	00040513          	mv	a0,s0
    56fc:	af4ff0ef          	jal	49f0 <__sprint_r.part.0>
    5700:	8e051ee3          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    5704:	06412603          	lw	a2,100(sp)
    5708:	01000f13          	li	t5,16
    570c:	ff0a8a93          	add	s5,s5,-16
    5710:	06812783          	lw	a5,104(sp)
    5714:	000a0693          	mv	a3,s4
    5718:	00160513          	add	a0,a2,1
    571c:	00700293          	li	t0,7
    5720:	fb5f48e3          	blt	t5,s5,56d0 <_vfiprintf_r+0xba4>
    5724:	01812e03          	lw	t3,24(sp)
    5728:	01c12803          	lw	a6,28(sp)
    572c:	02012883          	lw	a7,32(sp)
    5730:	02412703          	lw	a4,36(sp)
    5734:	02812e83          	lw	t4,40(sp)
    5738:	000d8613          	mv	a2,s11
    573c:	000c0f93          	mv	t6,s8
    5740:	000a8d93          	mv	s11,s5
    5744:	00068c13          	mv	s8,a3
    5748:	00060a93          	mv	s5,a2
    574c:	01b787b3          	add	a5,a5,s11
    5750:	01fc2023          	sw	t6,0(s8)
    5754:	01bc2223          	sw	s11,4(s8)
    5758:	06f12423          	sw	a5,104(sp)
    575c:	06a12223          	sw	a0,100(sp)
    5760:	00700613          	li	a2,7
    5764:	4ea65863          	bge	a2,a0,5c54 <_vfiprintf_r+0x1128>
    5768:	1a0786e3          	beqz	a5,6114 <_vfiprintf_r+0x15e8>
    576c:	06010613          	add	a2,sp,96
    5770:	00098593          	mv	a1,s3
    5774:	00040513          	mv	a0,s0
    5778:	03d12423          	sw	t4,40(sp)
    577c:	02e12223          	sw	a4,36(sp)
    5780:	03112023          	sw	a7,32(sp)
    5784:	01012e23          	sw	a6,28(sp)
    5788:	01c12c23          	sw	t3,24(sp)
    578c:	a64ff0ef          	jal	49f0 <__sprint_r.part.0>
    5790:	860516e3          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    5794:	02412703          	lw	a4,36(sp)
    5798:	06412603          	lw	a2,100(sp)
    579c:	06812783          	lw	a5,104(sp)
    57a0:	41a70733          	sub	a4,a4,s10
    57a4:	02812e83          	lw	t4,40(sp)
    57a8:	02012883          	lw	a7,32(sp)
    57ac:	01c12803          	lw	a6,28(sp)
    57b0:	01812e03          	lw	t3,24(sp)
    57b4:	000a0c13          	mv	s8,s4
    57b8:	00160f13          	add	t5,a2,1
    57bc:	e4e05a63          	blez	a4,4e10 <_vfiprintf_r+0x2e4>
    57c0:	01000593          	li	a1,16
    57c4:	0000af97          	auipc	t6,0xa
    57c8:	cc8f8f93          	add	t6,t6,-824 # f48c <zeroes.0>
    57cc:	0ae5da63          	bge	a1,a4,5880 <_vfiprintf_r+0xd54>
    57d0:	000c0593          	mv	a1,s8
    57d4:	03512423          	sw	s5,40(sp)
    57d8:	01000d93          	li	s11,16
    57dc:	00700293          	li	t0,7
    57e0:	01c12c23          	sw	t3,24(sp)
    57e4:	01012e23          	sw	a6,28(sp)
    57e8:	03112023          	sw	a7,32(sp)
    57ec:	03d12223          	sw	t4,36(sp)
    57f0:	00070a93          	mv	s5,a4
    57f4:	000b0c13          	mv	s8,s6
    57f8:	0180006f          	j	5810 <_vfiprintf_r+0xce4>
    57fc:	00260f13          	add	t5,a2,2
    5800:	00858593          	add	a1,a1,8
    5804:	00068613          	mv	a2,a3
    5808:	ff0a8a93          	add	s5,s5,-16
    580c:	055dda63          	bge	s11,s5,5860 <_vfiprintf_r+0xd34>
    5810:	01078793          	add	a5,a5,16
    5814:	00160693          	add	a3,a2,1
    5818:	0165a023          	sw	s6,0(a1)
    581c:	01b5a223          	sw	s11,4(a1)
    5820:	06f12423          	sw	a5,104(sp)
    5824:	06d12223          	sw	a3,100(sp)
    5828:	fcd2dae3          	bge	t0,a3,57fc <_vfiprintf_r+0xcd0>
    582c:	06078e63          	beqz	a5,58a8 <_vfiprintf_r+0xd7c>
    5830:	06010613          	add	a2,sp,96
    5834:	00098593          	mv	a1,s3
    5838:	00040513          	mv	a0,s0
    583c:	9b4ff0ef          	jal	49f0 <__sprint_r.part.0>
    5840:	fa051e63          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    5844:	06412603          	lw	a2,100(sp)
    5848:	ff0a8a93          	add	s5,s5,-16
    584c:	06812783          	lw	a5,104(sp)
    5850:	000a0593          	mv	a1,s4
    5854:	00160f13          	add	t5,a2,1
    5858:	00700293          	li	t0,7
    585c:	fb5dcae3          	blt	s11,s5,5810 <_vfiprintf_r+0xce4>
    5860:	000a8713          	mv	a4,s5
    5864:	01812e03          	lw	t3,24(sp)
    5868:	01c12803          	lw	a6,28(sp)
    586c:	02012883          	lw	a7,32(sp)
    5870:	02412e83          	lw	t4,36(sp)
    5874:	02812a83          	lw	s5,40(sp)
    5878:	000c0f93          	mv	t6,s8
    587c:	00058c13          	mv	s8,a1
    5880:	00e787b3          	add	a5,a5,a4
    5884:	00ec2223          	sw	a4,4(s8)
    5888:	01fc2023          	sw	t6,0(s8)
    588c:	06f12423          	sw	a5,104(sp)
    5890:	07e12223          	sw	t5,100(sp)
    5894:	00700713          	li	a4,7
    5898:	25e74863          	blt	a4,t5,5ae8 <_vfiprintf_r+0xfbc>
    589c:	008c0c13          	add	s8,s8,8
    58a0:	001f0f13          	add	t5,t5,1
    58a4:	d6cff06f          	j	4e10 <_vfiprintf_r+0x2e4>
    58a8:	00100f13          	li	t5,1
    58ac:	00000613          	li	a2,0
    58b0:	000a0593          	mv	a1,s4
    58b4:	f55ff06f          	j	5808 <_vfiprintf_r+0xcdc>
    58b8:	00100513          	li	a0,1
    58bc:	00000613          	li	a2,0
    58c0:	000a0693          	mv	a3,s4
    58c4:	e05ff06f          	j	56c8 <_vfiprintf_r+0xb9c>
    58c8:	06078263          	beqz	a5,592c <_vfiprintf_r+0xe00>
    58cc:	06010613          	add	a2,sp,96
    58d0:	00098593          	mv	a1,s3
    58d4:	00040513          	mv	a0,s0
    58d8:	03d12e23          	sw	t4,60(sp)
    58dc:	02e12c23          	sw	a4,56(sp)
    58e0:	03112423          	sw	a7,40(sp)
    58e4:	03012223          	sw	a6,36(sp)
    58e8:	02512023          	sw	t0,32(sp)
    58ec:	01f12e23          	sw	t6,28(sp)
    58f0:	01c12c23          	sw	t3,24(sp)
    58f4:	8fcff0ef          	jal	49f0 <__sprint_r.part.0>
    58f8:	f0051263          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    58fc:	06412603          	lw	a2,100(sp)
    5900:	06812783          	lw	a5,104(sp)
    5904:	03c12e83          	lw	t4,60(sp)
    5908:	03812703          	lw	a4,56(sp)
    590c:	02812883          	lw	a7,40(sp)
    5910:	02412803          	lw	a6,36(sp)
    5914:	02012283          	lw	t0,32(sp)
    5918:	01c12f83          	lw	t6,28(sp)
    591c:	01812e03          	lw	t3,24(sp)
    5920:	000a0c13          	mv	s8,s4
    5924:	00160f13          	add	t5,a2,1
    5928:	c58ff06f          	j	4d80 <_vfiprintf_r+0x254>
    592c:	380f8863          	beqz	t6,5cbc <_vfiprintf_r+0x1190>
    5930:	04410793          	add	a5,sp,68
    5934:	06f12623          	sw	a5,108(sp)
    5938:	00200793          	li	a5,2
    593c:	06f12823          	sw	a5,112(sp)
    5940:	00100f13          	li	t5,1
    5944:	000a0c13          	mv	s8,s4
    5948:	000f0613          	mv	a2,t5
    594c:	008c0c13          	add	s8,s8,8
    5950:	001f0f13          	add	t5,t5,1
    5954:	cacff06f          	j	4e00 <_vfiprintf_r+0x2d4>
    5958:	00200693          	li	a3,2
    595c:	00050e13          	mv	t3,a0
    5960:	aa0684e3          	beqz	a3,5408 <_vfiprintf_r+0x8dc>
    5964:	01412503          	lw	a0,20(sp)
    5968:	11010813          	add	a6,sp,272
    596c:	00f7f693          	and	a3,a5,15
    5970:	00d506b3          	add	a3,a0,a3
    5974:	0006c603          	lbu	a2,0(a3)
    5978:	0047d793          	srl	a5,a5,0x4
    597c:	01c59693          	sll	a3,a1,0x1c
    5980:	00f6e7b3          	or	a5,a3,a5
    5984:	0045d593          	srl	a1,a1,0x4
    5988:	fec80fa3          	sb	a2,-1(a6)
    598c:	00b7e6b3          	or	a3,a5,a1
    5990:	fff80813          	add	a6,a6,-1
    5994:	fc069ce3          	bnez	a3,596c <_vfiprintf_r+0xe40>
    5998:	11010793          	add	a5,sp,272
    599c:	41078d33          	sub	s10,a5,a6
    59a0:	00070e93          	mv	t4,a4
    59a4:	c9a754e3          	bge	a4,s10,562c <_vfiprintf_r+0xb00>
    59a8:	000d0e93          	mv	t4,s10
    59ac:	c81ff06f          	j	562c <_vfiprintf_r+0xb00>
    59b0:	01000513          	li	a0,16
    59b4:	01b554e3          	bge	a0,s11,61bc <_vfiprintf_r+0x1690>
    59b8:	000a8693          	mv	a3,s5
    59bc:	0000a317          	auipc	t1,0xa
    59c0:	ae030313          	add	t1,t1,-1312 # f49c <blanks.1>
    59c4:	02e12c23          	sw	a4,56(sp)
    59c8:	000d8a93          	mv	s5,s11
    59cc:	000c0713          	mv	a4,s8
    59d0:	01000f13          	li	t5,16
    59d4:	00700393          	li	t2,7
    59d8:	01c12c23          	sw	t3,24(sp)
    59dc:	01f12e23          	sw	t6,28(sp)
    59e0:	02512023          	sw	t0,32(sp)
    59e4:	03012223          	sw	a6,36(sp)
    59e8:	03112423          	sw	a7,40(sp)
    59ec:	03d12e23          	sw	t4,60(sp)
    59f0:	00030c13          	mv	s8,t1
    59f4:	00068d93          	mv	s11,a3
    59f8:	01c0006f          	j	5a14 <_vfiprintf_r+0xee8>
    59fc:	00260513          	add	a0,a2,2
    5a00:	00870713          	add	a4,a4,8
    5a04:	00058613          	mv	a2,a1
    5a08:	ff0a8a93          	add	s5,s5,-16
    5a0c:	055f5c63          	bge	t5,s5,5a64 <_vfiprintf_r+0xf38>
    5a10:	00160593          	add	a1,a2,1
    5a14:	01078793          	add	a5,a5,16
    5a18:	01872023          	sw	s8,0(a4)
    5a1c:	01e72223          	sw	t5,4(a4)
    5a20:	06f12423          	sw	a5,104(sp)
    5a24:	06b12223          	sw	a1,100(sp)
    5a28:	fcb3dae3          	bge	t2,a1,59fc <_vfiprintf_r+0xed0>
    5a2c:	08078a63          	beqz	a5,5ac0 <_vfiprintf_r+0xf94>
    5a30:	06010613          	add	a2,sp,96
    5a34:	00098593          	mv	a1,s3
    5a38:	00040513          	mv	a0,s0
    5a3c:	fb5fe0ef          	jal	49f0 <__sprint_r.part.0>
    5a40:	da051e63          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    5a44:	06412603          	lw	a2,100(sp)
    5a48:	01000f13          	li	t5,16
    5a4c:	ff0a8a93          	add	s5,s5,-16
    5a50:	06812783          	lw	a5,104(sp)
    5a54:	000a0713          	mv	a4,s4
    5a58:	00160513          	add	a0,a2,1
    5a5c:	00700393          	li	t2,7
    5a60:	fb5f48e3          	blt	t5,s5,5a10 <_vfiprintf_r+0xee4>
    5a64:	000c0313          	mv	t1,s8
    5a68:	01812e03          	lw	t3,24(sp)
    5a6c:	00070c13          	mv	s8,a4
    5a70:	01c12f83          	lw	t6,28(sp)
    5a74:	02012283          	lw	t0,32(sp)
    5a78:	02412803          	lw	a6,36(sp)
    5a7c:	02812883          	lw	a7,40(sp)
    5a80:	03c12e83          	lw	t4,60(sp)
    5a84:	03812703          	lw	a4,56(sp)
    5a88:	000d8693          	mv	a3,s11
    5a8c:	000a8d93          	mv	s11,s5
    5a90:	00068a93          	mv	s5,a3
    5a94:	01b787b3          	add	a5,a5,s11
    5a98:	006c2023          	sw	t1,0(s8)
    5a9c:	01bc2223          	sw	s11,4(s8)
    5aa0:	06f12423          	sw	a5,104(sp)
    5aa4:	06a12223          	sw	a0,100(sp)
    5aa8:	00700613          	li	a2,7
    5aac:	12a64063          	blt	a2,a0,5bcc <_vfiprintf_r+0x10a0>
    5ab0:	008c0c13          	add	s8,s8,8
    5ab4:	00150f13          	add	t5,a0,1
    5ab8:	00050613          	mv	a2,a0
    5abc:	a8cff06f          	j	4d48 <_vfiprintf_r+0x21c>
    5ac0:	00000613          	li	a2,0
    5ac4:	00100513          	li	a0,1
    5ac8:	000a0713          	mv	a4,s4
    5acc:	f3dff06f          	j	5a08 <_vfiprintf_r+0xedc>
    5ad0:	01d8d463          	bge	a7,t4,5ad8 <_vfiprintf_r+0xfac>
    5ad4:	000e8893          	mv	a7,t4
    5ad8:	00c12783          	lw	a5,12(sp)
    5adc:	011787b3          	add	a5,a5,a7
    5ae0:	00f12623          	sw	a5,12(sp)
    5ae4:	ba8ff06f          	j	4e8c <_vfiprintf_r+0x360>
    5ae8:	b4078ae3          	beqz	a5,563c <_vfiprintf_r+0xb10>
    5aec:	06010613          	add	a2,sp,96
    5af0:	00098593          	mv	a1,s3
    5af4:	00040513          	mv	a0,s0
    5af8:	03d12223          	sw	t4,36(sp)
    5afc:	03112023          	sw	a7,32(sp)
    5b00:	01012e23          	sw	a6,28(sp)
    5b04:	01c12c23          	sw	t3,24(sp)
    5b08:	ee9fe0ef          	jal	49f0 <__sprint_r.part.0>
    5b0c:	ce051863          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    5b10:	06412f03          	lw	t5,100(sp)
    5b14:	06812783          	lw	a5,104(sp)
    5b18:	02412e83          	lw	t4,36(sp)
    5b1c:	02012883          	lw	a7,32(sp)
    5b20:	01c12803          	lw	a6,28(sp)
    5b24:	01812e03          	lw	t3,24(sp)
    5b28:	000a0c13          	mv	s8,s4
    5b2c:	001f0f13          	add	t5,t5,1
    5b30:	ae0ff06f          	j	4e10 <_vfiprintf_r+0x2e4>
    5b34:	06012223          	sw	zero,100(sp)
    5b38:	000a0c13          	mv	s8,s4
    5b3c:	c84ff06f          	j	4fc0 <_vfiprintf_r+0x494>
    5b40:	01067693          	and	a3,a2,16
    5b44:	000aa783          	lw	a5,0(s5)
    5b48:	004a8a93          	add	s5,s5,4
    5b4c:	12069c63          	bnez	a3,5c84 <_vfiprintf_r+0x1158>
    5b50:	04067693          	and	a3,a2,64
    5b54:	12068463          	beqz	a3,5c7c <_vfiprintf_r+0x1150>
    5b58:	01079d93          	sll	s11,a5,0x10
    5b5c:	010ddd93          	srl	s11,s11,0x10
    5b60:	00000d13          	li	s10,0
    5b64:	ff4ff06f          	j	5358 <_vfiprintf_r+0x82c>
    5b68:	0106f613          	and	a2,a3,16
    5b6c:	000aa783          	lw	a5,0(s5)
    5b70:	004a8a93          	add	s5,s5,4
    5b74:	12061263          	bnez	a2,5c98 <_vfiprintf_r+0x116c>
    5b78:	0406f613          	and	a2,a3,64
    5b7c:	10060a63          	beqz	a2,5c90 <_vfiprintf_r+0x1164>
    5b80:	01079793          	sll	a5,a5,0x10
    5b84:	0107d793          	srl	a5,a5,0x10
    5b88:	00000593          	li	a1,0
    5b8c:	83dff06f          	j	53c8 <_vfiprintf_r+0x89c>
    5b90:	010e7693          	and	a3,t3,16
    5b94:	000aa783          	lw	a5,0(s5)
    5b98:	004a8a93          	add	s5,s5,4
    5b9c:	0c069863          	bnez	a3,5c6c <_vfiprintf_r+0x1140>
    5ba0:	040e7693          	and	a3,t3,64
    5ba4:	0c068063          	beqz	a3,5c64 <_vfiprintf_r+0x1138>
    5ba8:	01079d93          	sll	s11,a5,0x10
    5bac:	410ddd93          	sra	s11,s11,0x10
    5bb0:	41fddd13          	sra	s10,s11,0x1f
    5bb4:	000d0693          	mv	a3,s10
    5bb8:	f24ff06f          	j	52dc <_vfiprintf_r+0x7b0>
    5bbc:	00100f13          	li	t5,1
    5bc0:	00000613          	li	a2,0
    5bc4:	000a0c13          	mv	s8,s4
    5bc8:	a38ff06f          	j	4e00 <_vfiprintf_r+0x2d4>
    5bcc:	1a078463          	beqz	a5,5d74 <_vfiprintf_r+0x1248>
    5bd0:	06010613          	add	a2,sp,96
    5bd4:	00098593          	mv	a1,s3
    5bd8:	00040513          	mv	a0,s0
    5bdc:	03d12e23          	sw	t4,60(sp)
    5be0:	02e12c23          	sw	a4,56(sp)
    5be4:	03112423          	sw	a7,40(sp)
    5be8:	03012223          	sw	a6,36(sp)
    5bec:	02512023          	sw	t0,32(sp)
    5bf0:	01f12e23          	sw	t6,28(sp)
    5bf4:	01c12c23          	sw	t3,24(sp)
    5bf8:	df9fe0ef          	jal	49f0 <__sprint_r.part.0>
    5bfc:	c0051063          	bnez	a0,4ffc <_vfiprintf_r+0x4d0>
    5c00:	06412603          	lw	a2,100(sp)
    5c04:	06812783          	lw	a5,104(sp)
    5c08:	03c12e83          	lw	t4,60(sp)
    5c0c:	03812703          	lw	a4,56(sp)
    5c10:	02812883          	lw	a7,40(sp)
    5c14:	02412803          	lw	a6,36(sp)
    5c18:	02012283          	lw	t0,32(sp)
    5c1c:	01c12f83          	lw	t6,28(sp)
    5c20:	01812e03          	lw	t3,24(sp)
    5c24:	000a0c13          	mv	s8,s4
    5c28:	00160f13          	add	t5,a2,1
    5c2c:	91cff06f          	j	4d48 <_vfiprintf_r+0x21c>
    5c30:	000d8e13          	mv	t3,s11
    5c34:	e88ff06f          	j	52bc <_vfiprintf_r+0x790>
    5c38:	00000e93          	li	t4,0
    5c3c:	11010813          	add	a6,sp,272
    5c40:	9edff06f          	j	562c <_vfiprintf_r+0xb00>
    5c44:	0589a503          	lw	a0,88(s3)
    5c48:	8b4fb0ef          	jal	cfc <__retarget_lock_acquire_recursive>
    5c4c:	00c99783          	lh	a5,12(s3)
    5c50:	f41fe06f          	j	4b90 <_vfiprintf_r+0x64>
    5c54:	008c0c13          	add	s8,s8,8
    5c58:	00150f13          	add	t5,a0,1
    5c5c:	00050613          	mv	a2,a0
    5c60:	9a8ff06f          	j	4e08 <_vfiprintf_r+0x2dc>
    5c64:	200e7693          	and	a3,t3,512
    5c68:	50069463          	bnez	a3,6170 <_vfiprintf_r+0x1644>
    5c6c:	41f7dd13          	sra	s10,a5,0x1f
    5c70:	00078d93          	mv	s11,a5
    5c74:	000d0693          	mv	a3,s10
    5c78:	e64ff06f          	j	52dc <_vfiprintf_r+0x7b0>
    5c7c:	20067693          	and	a3,a2,512
    5c80:	4c069663          	bnez	a3,614c <_vfiprintf_r+0x1620>
    5c84:	00078d93          	mv	s11,a5
    5c88:	00000d13          	li	s10,0
    5c8c:	eccff06f          	j	5358 <_vfiprintf_r+0x82c>
    5c90:	2006f613          	and	a2,a3,512
    5c94:	4c061863          	bnez	a2,6164 <_vfiprintf_r+0x1638>
    5c98:	00000593          	li	a1,0
    5c9c:	f2cff06f          	j	53c8 <_vfiprintf_r+0x89c>
    5ca0:	00c12683          	lw	a3,12(sp)
    5ca4:	000aa783          	lw	a5,0(s5)
    5ca8:	004a8a93          	add	s5,s5,4
    5cac:	41f6d713          	sra	a4,a3,0x1f
    5cb0:	00d7a023          	sw	a3,0(a5)
    5cb4:	00e7a223          	sw	a4,4(a5)
    5cb8:	f8dfe06f          	j	4c44 <_vfiprintf_r+0x118>
    5cbc:	00000613          	li	a2,0
    5cc0:	00100f13          	li	t5,1
    5cc4:	000a0c13          	mv	s8,s4
    5cc8:	938ff06f          	j	4e00 <_vfiprintf_r+0x2d4>
    5ccc:	000aa783          	lw	a5,0(s5)
    5cd0:	00100e93          	li	t4,1
    5cd4:	00100d13          	li	s10,1
    5cd8:	0af10623          	sb	a5,172(sp)
    5cdc:	0ac10593          	add	a1,sp,172
    5ce0:	db8ff06f          	j	5298 <_vfiprintf_r+0x76c>
    5ce4:	000d0e93          	mv	t4,s10
    5ce8:	00050813          	mv	a6,a0
    5cec:	941ff06f          	j	562c <_vfiprintf_r+0xb00>
    5cf0:	fff00713          	li	a4,-1
    5cf4:	00058c93          	mv	s9,a1
    5cf8:	fb9fe06f          	j	4cb0 <_vfiprintf_r+0x184>
    5cfc:	000d8613          	mv	a2,s11
    5d00:	e3cff06f          	j	533c <_vfiprintf_r+0x810>
    5d04:	00009797          	auipc	a5,0x9
    5d08:	11078793          	add	a5,a5,272 # ee14 <__fini_array_end+0x268>
    5d0c:	000d8e13          	mv	t3,s11
    5d10:	00f12a23          	sw	a5,20(sp)
    5d14:	020e7793          	and	a5,t3,32
    5d18:	1c078c63          	beqz	a5,5ef0 <_vfiprintf_r+0x13c4>
    5d1c:	007a8a93          	add	s5,s5,7
    5d20:	ff8afa93          	and	s5,s5,-8
    5d24:	000aa783          	lw	a5,0(s5)
    5d28:	004aa583          	lw	a1,4(s5)
    5d2c:	008a8a93          	add	s5,s5,8
    5d30:	001e7613          	and	a2,t3,1
    5d34:	00060e63          	beqz	a2,5d50 <_vfiprintf_r+0x1224>
    5d38:	00b7e633          	or	a2,a5,a1
    5d3c:	00060a63          	beqz	a2,5d50 <_vfiprintf_r+0x1224>
    5d40:	03000613          	li	a2,48
    5d44:	04c10223          	sb	a2,68(sp)
    5d48:	04d102a3          	sb	a3,69(sp)
    5d4c:	002e6e13          	or	t3,t3,2
    5d50:	bffe7e13          	and	t3,t3,-1025
    5d54:	f3cff06f          	j	5490 <_vfiprintf_r+0x964>
    5d58:	000d8693          	mv	a3,s11
    5d5c:	e50ff06f          	j	53ac <_vfiprintf_r+0x880>
    5d60:	00009797          	auipc	a5,0x9
    5d64:	0a078793          	add	a5,a5,160 # ee00 <__fini_array_end+0x254>
    5d68:	000d8e13          	mv	t3,s11
    5d6c:	00f12a23          	sw	a5,20(sp)
    5d70:	fa5ff06f          	j	5d14 <_vfiprintf_r+0x11e8>
    5d74:	04314603          	lbu	a2,67(sp)
    5d78:	3a060a63          	beqz	a2,612c <_vfiprintf_r+0x1600>
    5d7c:	04310793          	add	a5,sp,67
    5d80:	06f12623          	sw	a5,108(sp)
    5d84:	00100793          	li	a5,1
    5d88:	06f12823          	sw	a5,112(sp)
    5d8c:	00100f13          	li	t5,1
    5d90:	000a0c13          	mv	s8,s4
    5d94:	fe1fe06f          	j	4d74 <_vfiprintf_r+0x248>
    5d98:	00800613          	li	a2,8
    5d9c:	00000593          	li	a1,0
    5da0:	05810513          	add	a0,sp,88
    5da4:	02e12023          	sw	a4,32(sp)
    5da8:	01112e23          	sw	a7,28(sp)
    5dac:	01c12c23          	sw	t3,24(sp)
    5db0:	05012623          	sw	a6,76(sp)
    5db4:	01012823          	sw	a6,16(sp)
    5db8:	f4dfa0ef          	jal	d04 <memset>
    5dbc:	02012703          	lw	a4,32(sp)
    5dc0:	01012803          	lw	a6,16(sp)
    5dc4:	01812e03          	lw	t3,24(sp)
    5dc8:	01c12883          	lw	a7,28(sp)
    5dcc:	2a074463          	bltz	a4,6074 <_vfiprintf_r+0x1548>
    5dd0:	00000d93          	li	s11,0
    5dd4:	00000d13          	li	s10,0
    5dd8:	01812823          	sw	s8,16(sp)
    5ddc:	01012e23          	sw	a6,28(sp)
    5de0:	000d8c13          	mv	s8,s11
    5de4:	03112023          	sw	a7,32(sp)
    5de8:	000c8d93          	mv	s11,s9
    5dec:	000a8c93          	mv	s9,s5
    5df0:	000d0a93          	mv	s5,s10
    5df4:	00098d13          	mv	s10,s3
    5df8:	00070993          	mv	s3,a4
    5dfc:	0300006f          	j	5e2c <_vfiprintf_r+0x1300>
    5e00:	05810693          	add	a3,sp,88
    5e04:	0ac10593          	add	a1,sp,172
    5e08:	00040513          	mv	a0,s0
    5e0c:	069040ef          	jal	a674 <_wcrtomb_r>
    5e10:	fff00793          	li	a5,-1
    5e14:	48f50063          	beq	a0,a5,6294 <_vfiprintf_r+0x1768>
    5e18:	00aa87b3          	add	a5,s5,a0
    5e1c:	02f9c063          	blt	s3,a5,5e3c <_vfiprintf_r+0x1310>
    5e20:	004c0c13          	add	s8,s8,4
    5e24:	45378463          	beq	a5,s3,626c <_vfiprintf_r+0x1740>
    5e28:	00078a93          	mv	s5,a5
    5e2c:	04c12783          	lw	a5,76(sp)
    5e30:	018787b3          	add	a5,a5,s8
    5e34:	0007a603          	lw	a2,0(a5)
    5e38:	fc0614e3          	bnez	a2,5e00 <_vfiprintf_r+0x12d4>
    5e3c:	01012c03          	lw	s8,16(sp)
    5e40:	01812e03          	lw	t3,24(sp)
    5e44:	01c12803          	lw	a6,28(sp)
    5e48:	02012883          	lw	a7,32(sp)
    5e4c:	000d0993          	mv	s3,s10
    5e50:	000a8d13          	mv	s10,s5
    5e54:	000c8a93          	mv	s5,s9
    5e58:	000d8c93          	mv	s9,s11
    5e5c:	280d0e63          	beqz	s10,60f8 <_vfiprintf_r+0x15cc>
    5e60:	06300793          	li	a5,99
    5e64:	33a7d463          	bge	a5,s10,618c <_vfiprintf_r+0x1660>
    5e68:	001d0593          	add	a1,s10,1
    5e6c:	00040513          	mv	a0,s0
    5e70:	01112c23          	sw	a7,24(sp)
    5e74:	01c12823          	sw	t3,16(sp)
    5e78:	de8fb0ef          	jal	1460 <_malloc_r>
    5e7c:	01012e03          	lw	t3,16(sp)
    5e80:	01812883          	lw	a7,24(sp)
    5e84:	00050813          	mv	a6,a0
    5e88:	42050063          	beqz	a0,62a8 <_vfiprintf_r+0x177c>
    5e8c:	00a12823          	sw	a0,16(sp)
    5e90:	00800613          	li	a2,8
    5e94:	00000593          	li	a1,0
    5e98:	05810513          	add	a0,sp,88
    5e9c:	03112023          	sw	a7,32(sp)
    5ea0:	01c12e23          	sw	t3,28(sp)
    5ea4:	01012c23          	sw	a6,24(sp)
    5ea8:	e5dfa0ef          	jal	d04 <memset>
    5eac:	01812803          	lw	a6,24(sp)
    5eb0:	05810713          	add	a4,sp,88
    5eb4:	000d0693          	mv	a3,s10
    5eb8:	00080593          	mv	a1,a6
    5ebc:	04c10613          	add	a2,sp,76
    5ec0:	00040513          	mv	a0,s0
    5ec4:	03d040ef          	jal	a700 <_wcsrtombs_r>
    5ec8:	01812803          	lw	a6,24(sp)
    5ecc:	01c12e03          	lw	t3,28(sp)
    5ed0:	02012883          	lw	a7,32(sp)
    5ed4:	40ad1063          	bne	s10,a0,62d4 <_vfiprintf_r+0x17a8>
    5ed8:	fffd4e93          	not	t4,s10
    5edc:	01a807b3          	add	a5,a6,s10
    5ee0:	41fede93          	sra	t4,t4,0x1f
    5ee4:	00078023          	sb	zero,0(a5)
    5ee8:	01dd7eb3          	and	t4,s10,t4
    5eec:	2140006f          	j	6100 <_vfiprintf_r+0x15d4>
    5ef0:	010e7613          	and	a2,t3,16
    5ef4:	000aa783          	lw	a5,0(s5)
    5ef8:	004a8a93          	add	s5,s5,4
    5efc:	02061263          	bnez	a2,5f20 <_vfiprintf_r+0x13f4>
    5f00:	040e7613          	and	a2,t3,64
    5f04:	00060a63          	beqz	a2,5f18 <_vfiprintf_r+0x13ec>
    5f08:	01079793          	sll	a5,a5,0x10
    5f0c:	0107d793          	srl	a5,a5,0x10
    5f10:	00000593          	li	a1,0
    5f14:	e1dff06f          	j	5d30 <_vfiprintf_r+0x1204>
    5f18:	200e7613          	and	a2,t3,512
    5f1c:	22061e63          	bnez	a2,6158 <_vfiprintf_r+0x162c>
    5f20:	00000593          	li	a1,0
    5f24:	e0dff06f          	j	5d30 <_vfiprintf_r+0x1204>
    5f28:	400e7793          	and	a5,t3,1024
    5f2c:	00000693          	li	a3,0
    5f30:	11010e93          	add	t4,sp,272
    5f34:	01812823          	sw	s8,16(sp)
    5f38:	02812223          	sw	s0,36(sp)
    5f3c:	03912c23          	sw	s9,56(sp)
    5f40:	03512e23          	sw	s5,60(sp)
    5f44:	02c12c83          	lw	s9,44(sp)
    5f48:	01c12c23          	sw	t3,24(sp)
    5f4c:	01112e23          	sw	a7,28(sp)
    5f50:	02e12023          	sw	a4,32(sp)
    5f54:	00078c13          	mv	s8,a5
    5f58:	00068413          	mv	s0,a3
    5f5c:	03312423          	sw	s3,40(sp)
    5f60:	000e8a93          	mv	s5,t4
    5f64:	0280006f          	j	5f8c <_vfiprintf_r+0x1460>
    5f68:	00a00613          	li	a2,10
    5f6c:	00000693          	li	a3,0
    5f70:	000d8513          	mv	a0,s11
    5f74:	000d0593          	mv	a1,s10
    5f78:	268050ef          	jal	b1e0 <__udivdi3>
    5f7c:	220d0a63          	beqz	s10,61b0 <_vfiprintf_r+0x1684>
    5f80:	00050d93          	mv	s11,a0
    5f84:	00058d13          	mv	s10,a1
    5f88:	00098a93          	mv	s5,s3
    5f8c:	00a00613          	li	a2,10
    5f90:	00000693          	li	a3,0
    5f94:	000d8513          	mv	a0,s11
    5f98:	000d0593          	mv	a1,s10
    5f9c:	0f1050ef          	jal	b88c <__umoddi3>
    5fa0:	03050513          	add	a0,a0,48
    5fa4:	feaa8fa3          	sb	a0,-1(s5)
    5fa8:	fffa8993          	add	s3,s5,-1
    5fac:	00140413          	add	s0,s0,1
    5fb0:	fa0c0ce3          	beqz	s8,5f68 <_vfiprintf_r+0x143c>
    5fb4:	000cc783          	lbu	a5,0(s9)
    5fb8:	fa8798e3          	bne	a5,s0,5f68 <_vfiprintf_r+0x143c>
    5fbc:	0ff00793          	li	a5,255
    5fc0:	faf404e3          	beq	s0,a5,5f68 <_vfiprintf_r+0x143c>
    5fc4:	0e0d1a63          	bnez	s10,60b8 <_vfiprintf_r+0x158c>
    5fc8:	00900793          	li	a5,9
    5fcc:	0fb7e663          	bltu	a5,s11,60b8 <_vfiprintf_r+0x158c>
    5fd0:	00098813          	mv	a6,s3
    5fd4:	03912623          	sw	s9,44(sp)
    5fd8:	01012c03          	lw	s8,16(sp)
    5fdc:	01812e03          	lw	t3,24(sp)
    5fe0:	01c12883          	lw	a7,28(sp)
    5fe4:	02012703          	lw	a4,32(sp)
    5fe8:	02412403          	lw	s0,36(sp)
    5fec:	02812983          	lw	s3,40(sp)
    5ff0:	03812c83          	lw	s9,56(sp)
    5ff4:	03c12a83          	lw	s5,60(sp)
    5ff8:	9a1ff06f          	j	5998 <_vfiprintf_r+0xe6c>
    5ffc:	00068e13          	mv	t3,a3
    6000:	00000693          	li	a3,0
    6004:	c0068263          	beqz	a3,5408 <_vfiprintf_r+0x8dc>
    6008:	95dff06f          	j	5964 <_vfiprintf_r+0xe38>
    600c:	00040513          	mv	a0,s0
    6010:	115000ef          	jal	6924 <__sinit>
    6014:	b61fe06f          	j	4b74 <_vfiprintf_r+0x48>
    6018:	001cc683          	lbu	a3,1(s9)
    601c:	200ded93          	or	s11,s11,512
    6020:	001c8c93          	add	s9,s9,1
    6024:	c89fe06f          	j	4cac <_vfiprintf_r+0x180>
    6028:	001cc683          	lbu	a3,1(s9)
    602c:	020ded93          	or	s11,s11,32
    6030:	001c8c93          	add	s9,s9,1
    6034:	c79fe06f          	j	4cac <_vfiprintf_r+0x180>
    6038:	000aa783          	lw	a5,0(s5)
    603c:	00c12703          	lw	a4,12(sp)
    6040:	004a8a93          	add	s5,s5,4
    6044:	00e7a023          	sw	a4,0(a5)
    6048:	bfdfe06f          	j	4c44 <_vfiprintf_r+0x118>
    604c:	00600793          	li	a5,6
    6050:	00070d13          	mv	s10,a4
    6054:	0ce7e863          	bltu	a5,a4,6124 <_vfiprintf_r+0x15f8>
    6058:	000d0e93          	mv	t4,s10
    605c:	00009817          	auipc	a6,0x9
    6060:	dcc80813          	add	a6,a6,-564 # ee28 <__fini_array_end+0x27c>
    6064:	cb9fe06f          	j	4d1c <_vfiprintf_r+0x1f0>
    6068:	00000793          	li	a5,0
    606c:	00000593          	li	a1,0
    6070:	8f5ff06f          	j	5964 <_vfiprintf_r+0xe38>
    6074:	05810713          	add	a4,sp,88
    6078:	00000693          	li	a3,0
    607c:	04c10613          	add	a2,sp,76
    6080:	00000593          	li	a1,0
    6084:	00040513          	mv	a0,s0
    6088:	01112e23          	sw	a7,28(sp)
    608c:	01012c23          	sw	a6,24(sp)
    6090:	01c12823          	sw	t3,16(sp)
    6094:	66c040ef          	jal	a700 <_wcsrtombs_r>
    6098:	fff00793          	li	a5,-1
    609c:	01012e03          	lw	t3,16(sp)
    60a0:	01812803          	lw	a6,24(sp)
    60a4:	01c12883          	lw	a7,28(sp)
    60a8:	00050d13          	mv	s10,a0
    60ac:	1ef50e63          	beq	a0,a5,62a8 <_vfiprintf_r+0x177c>
    60b0:	05012623          	sw	a6,76(sp)
    60b4:	da9ff06f          	j	5e5c <_vfiprintf_r+0x1330>
    60b8:	03012783          	lw	a5,48(sp)
    60bc:	03412583          	lw	a1,52(sp)
    60c0:	00000413          	li	s0,0
    60c4:	40f989b3          	sub	s3,s3,a5
    60c8:	00078613          	mv	a2,a5
    60cc:	00098513          	mv	a0,s3
    60d0:	43c010ef          	jal	750c <strncpy>
    60d4:	001cc783          	lbu	a5,1(s9)
    60d8:	00a00613          	li	a2,10
    60dc:	00000693          	li	a3,0
    60e0:	00f037b3          	snez	a5,a5
    60e4:	000d8513          	mv	a0,s11
    60e8:	000d0593          	mv	a1,s10
    60ec:	00fc8cb3          	add	s9,s9,a5
    60f0:	0f0050ef          	jal	b1e0 <__udivdi3>
    60f4:	e8dff06f          	j	5f80 <_vfiprintf_r+0x1454>
    60f8:	00000e93          	li	t4,0
    60fc:	00012823          	sw	zero,16(sp)
    6100:	04314783          	lbu	a5,67(sp)
    6104:	00000713          	li	a4,0
    6108:	00000f93          	li	t6,0
    610c:	a0079063          	bnez	a5,530c <_vfiprintf_r+0x7e0>
    6110:	c19fe06f          	j	4d28 <_vfiprintf_r+0x1fc>
    6114:	00100f13          	li	t5,1
    6118:	00000613          	li	a2,0
    611c:	000a0c13          	mv	s8,s4
    6120:	ce9fe06f          	j	4e08 <_vfiprintf_r+0x2dc>
    6124:	00600d13          	li	s10,6
    6128:	f31ff06f          	j	6058 <_vfiprintf_r+0x152c>
    612c:	00100f13          	li	t5,1
    6130:	000a0c13          	mv	s8,s4
    6134:	c4dfe06f          	j	4d80 <_vfiprintf_r+0x254>
    6138:	000aa783          	lw	a5,0(s5)
    613c:	00c12703          	lw	a4,12(sp)
    6140:	004a8a93          	add	s5,s5,4
    6144:	00e79023          	sh	a4,0(a5)
    6148:	afdfe06f          	j	4c44 <_vfiprintf_r+0x118>
    614c:	0ff7fd93          	zext.b	s11,a5
    6150:	00000d13          	li	s10,0
    6154:	a04ff06f          	j	5358 <_vfiprintf_r+0x82c>
    6158:	0ff7f793          	zext.b	a5,a5
    615c:	00000593          	li	a1,0
    6160:	bd1ff06f          	j	5d30 <_vfiprintf_r+0x1204>
    6164:	0ff7f793          	zext.b	a5,a5
    6168:	00000593          	li	a1,0
    616c:	a5cff06f          	j	53c8 <_vfiprintf_r+0x89c>
    6170:	01879d93          	sll	s11,a5,0x18
    6174:	418ddd93          	sra	s11,s11,0x18
    6178:	41fddd13          	sra	s10,s11,0x1f
    617c:	000d0693          	mv	a3,s10
    6180:	95cff06f          	j	52dc <_vfiprintf_r+0x7b0>
    6184:	03000793          	li	a5,48
    6188:	c8cff06f          	j	5614 <_vfiprintf_r+0xae8>
    618c:	00012823          	sw	zero,16(sp)
    6190:	0ac10813          	add	a6,sp,172
    6194:	cfdff06f          	j	5e90 <_vfiprintf_r+0x1364>
    6198:	0589a503          	lw	a0,88(s3)
    619c:	b65fa0ef          	jal	d00 <__retarget_lock_release_recursive>
    61a0:	d51fe06f          	j	4ef0 <_vfiprintf_r+0x3c4>
    61a4:	00070e93          	mv	t4,a4
    61a8:	00070d13          	mv	s10,a4
    61ac:	f55ff06f          	j	6100 <_vfiprintf_r+0x15d4>
    61b0:	00900793          	li	a5,9
    61b4:	ddb7e6e3          	bltu	a5,s11,5f80 <_vfiprintf_r+0x1454>
    61b8:	e19ff06f          	j	5fd0 <_vfiprintf_r+0x14a4>
    61bc:	00058513          	mv	a0,a1
    61c0:	00009317          	auipc	t1,0x9
    61c4:	2dc30313          	add	t1,t1,732 # f49c <blanks.1>
    61c8:	8cdff06f          	j	5a94 <_vfiprintf_r+0xf68>
    61cc:	00080513          	mv	a0,a6
    61d0:	03112023          	sw	a7,32(sp)
    61d4:	01012c23          	sw	a6,24(sp)
    61d8:	01b12e23          	sw	s11,28(sp)
    61dc:	da9fa0ef          	jal	f84 <strlen>
    61e0:	fff54e93          	not	t4,a0
    61e4:	41fede93          	sra	t4,t4,0x1f
    61e8:	01812803          	lw	a6,24(sp)
    61ec:	01c12e03          	lw	t3,28(sp)
    61f0:	02012883          	lw	a7,32(sp)
    61f4:	00050d13          	mv	s10,a0
    61f8:	01d57eb3          	and	t4,a0,t4
    61fc:	00012823          	sw	zero,16(sp)
    6200:	f01ff06f          	j	6100 <_vfiprintf_r+0x15d4>
    6204:	06010613          	add	a2,sp,96
    6208:	00098593          	mv	a1,s3
    620c:	00040513          	mv	a0,s0
    6210:	fe0fe0ef          	jal	49f0 <__sprint_r.part.0>
    6214:	00051463          	bnez	a0,621c <_vfiprintf_r+0x16f0>
    6218:	dc5fe06f          	j	4fdc <_vfiprintf_r+0x4b0>
    621c:	df5fe06f          	j	5010 <_vfiprintf_r+0x4e4>
    6220:	00168613          	add	a2,a3,1
    6224:	00009317          	auipc	t1,0x9
    6228:	27830313          	add	t1,t1,632 # f49c <blanks.1>
    622c:	f19fe06f          	j	5144 <_vfiprintf_r+0x618>
    6230:	000f0513          	mv	a0,t5
    6234:	00009f97          	auipc	t6,0x9
    6238:	258f8f93          	add	t6,t6,600 # f48c <zeroes.0>
    623c:	d10ff06f          	j	574c <_vfiprintf_r+0xc20>
    6240:	0649a783          	lw	a5,100(s3)
    6244:	0017f793          	and	a5,a5,1
    6248:	00079c63          	bnez	a5,6260 <_vfiprintf_r+0x1734>
    624c:	00c9d783          	lhu	a5,12(s3)
    6250:	2007f793          	and	a5,a5,512
    6254:	00079663          	bnez	a5,6260 <_vfiprintf_r+0x1734>
    6258:	0589a503          	lw	a0,88(s3)
    625c:	aa5fa0ef          	jal	d00 <__retarget_lock_release_recursive>
    6260:	fff00793          	li	a5,-1
    6264:	00f12623          	sw	a5,12(sp)
    6268:	de5fe06f          	j	504c <_vfiprintf_r+0x520>
    626c:	00098713          	mv	a4,s3
    6270:	000c8a93          	mv	s5,s9
    6274:	000d0993          	mv	s3,s10
    6278:	01012c03          	lw	s8,16(sp)
    627c:	01812e03          	lw	t3,24(sp)
    6280:	01c12803          	lw	a6,28(sp)
    6284:	02012883          	lw	a7,32(sp)
    6288:	000d8c93          	mv	s9,s11
    628c:	00070d13          	mv	s10,a4
    6290:	bcdff06f          	j	5e5c <_vfiprintf_r+0x1330>
    6294:	00cd1783          	lh	a5,12(s10)
    6298:	000d0993          	mv	s3,s10
    629c:	0407e793          	or	a5,a5,64
    62a0:	00fd1623          	sh	a5,12(s10)
    62a4:	d71fe06f          	j	5014 <_vfiprintf_r+0x4e8>
    62a8:	00c99783          	lh	a5,12(s3)
    62ac:	0407e793          	or	a5,a5,64
    62b0:	00f99623          	sh	a5,12(s3)
    62b4:	d61fe06f          	j	5014 <_vfiprintf_r+0x4e8>
    62b8:	000aa703          	lw	a4,0(s5)
    62bc:	004a8a93          	add	s5,s5,4
    62c0:	00075463          	bgez	a4,62c8 <_vfiprintf_r+0x179c>
    62c4:	fff00713          	li	a4,-1
    62c8:	001cc683          	lbu	a3,1(s9)
    62cc:	00058c93          	mv	s9,a1
    62d0:	9ddfe06f          	j	4cac <_vfiprintf_r+0x180>
    62d4:	00c9d783          	lhu	a5,12(s3)
    62d8:	0407e793          	or	a5,a5,64
    62dc:	00f99623          	sh	a5,12(s3)
    62e0:	d1dfe06f          	j	4ffc <_vfiprintf_r+0x4d0>

000062e4 <__sbprintf>:
    62e4:	b7010113          	add	sp,sp,-1168
    62e8:	00c59783          	lh	a5,12(a1)
    62ec:	00e5d703          	lhu	a4,14(a1)
    62f0:	48812423          	sw	s0,1160(sp)
    62f4:	00058413          	mv	s0,a1
    62f8:	000105b7          	lui	a1,0x10
    62fc:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x915>
    6300:	06442303          	lw	t1,100(s0)
    6304:	01c42883          	lw	a7,28(s0)
    6308:	02442803          	lw	a6,36(s0)
    630c:	01071713          	sll	a4,a4,0x10
    6310:	00b7f7b3          	and	a5,a5,a1
    6314:	00e7e7b3          	or	a5,a5,a4
    6318:	40000593          	li	a1,1024
    631c:	49212023          	sw	s2,1152(sp)
    6320:	00f12a23          	sw	a5,20(sp)
    6324:	00050913          	mv	s2,a0
    6328:	07010793          	add	a5,sp,112
    632c:	06010513          	add	a0,sp,96
    6330:	48112623          	sw	ra,1164(sp)
    6334:	48912223          	sw	s1,1156(sp)
    6338:	47312e23          	sw	s3,1148(sp)
    633c:	00060493          	mv	s1,a2
    6340:	00068993          	mv	s3,a3
    6344:	06612623          	sw	t1,108(sp)
    6348:	03112223          	sw	a7,36(sp)
    634c:	03012623          	sw	a6,44(sp)
    6350:	00f12423          	sw	a5,8(sp)
    6354:	00f12c23          	sw	a5,24(sp)
    6358:	00b12823          	sw	a1,16(sp)
    635c:	00b12e23          	sw	a1,28(sp)
    6360:	02012023          	sw	zero,32(sp)
    6364:	991fa0ef          	jal	cf4 <__retarget_lock_init_recursive>
    6368:	00048613          	mv	a2,s1
    636c:	00098693          	mv	a3,s3
    6370:	00810593          	add	a1,sp,8
    6374:	00090513          	mv	a0,s2
    6378:	fb4fe0ef          	jal	4b2c <_vfiprintf_r>
    637c:	00050493          	mv	s1,a0
    6380:	04055263          	bgez	a0,63c4 <__sbprintf+0xe0>
    6384:	01415783          	lhu	a5,20(sp)
    6388:	0407f793          	and	a5,a5,64
    638c:	00078863          	beqz	a5,639c <__sbprintf+0xb8>
    6390:	00c45783          	lhu	a5,12(s0)
    6394:	0407e793          	or	a5,a5,64
    6398:	00f41623          	sh	a5,12(s0)
    639c:	06012503          	lw	a0,96(sp)
    63a0:	959fa0ef          	jal	cf8 <__retarget_lock_close_recursive>
    63a4:	48c12083          	lw	ra,1164(sp)
    63a8:	48812403          	lw	s0,1160(sp)
    63ac:	48012903          	lw	s2,1152(sp)
    63b0:	47c12983          	lw	s3,1148(sp)
    63b4:	00048513          	mv	a0,s1
    63b8:	48412483          	lw	s1,1156(sp)
    63bc:	49010113          	add	sp,sp,1168
    63c0:	00008067          	ret
    63c4:	00810593          	add	a1,sp,8
    63c8:	00090513          	mv	a0,s2
    63cc:	25c000ef          	jal	6628 <_fflush_r>
    63d0:	fa050ae3          	beqz	a0,6384 <__sbprintf+0xa0>
    63d4:	fff00493          	li	s1,-1
    63d8:	fadff06f          	j	6384 <__sbprintf+0xa0>

000063dc <__sflush_r>:
    63dc:	00c59703          	lh	a4,12(a1)
    63e0:	fe010113          	add	sp,sp,-32
    63e4:	00812c23          	sw	s0,24(sp)
    63e8:	01312623          	sw	s3,12(sp)
    63ec:	00112e23          	sw	ra,28(sp)
    63f0:	00877793          	and	a5,a4,8
    63f4:	00058413          	mv	s0,a1
    63f8:	00050993          	mv	s3,a0
    63fc:	12079063          	bnez	a5,651c <__sflush_r+0x140>
    6400:	000017b7          	lui	a5,0x1
    6404:	80078793          	add	a5,a5,-2048 # 800 <main+0x508>
    6408:	0045a683          	lw	a3,4(a1)
    640c:	00f767b3          	or	a5,a4,a5
    6410:	00f59623          	sh	a5,12(a1)
    6414:	18d05263          	blez	a3,6598 <__sflush_r+0x1bc>
    6418:	02842803          	lw	a6,40(s0)
    641c:	0e080463          	beqz	a6,6504 <__sflush_r+0x128>
    6420:	00912a23          	sw	s1,20(sp)
    6424:	01371693          	sll	a3,a4,0x13
    6428:	0009a483          	lw	s1,0(s3)
    642c:	0009a023          	sw	zero,0(s3)
    6430:	01c42583          	lw	a1,28(s0)
    6434:	1606ce63          	bltz	a3,65b0 <__sflush_r+0x1d4>
    6438:	00000613          	li	a2,0
    643c:	00100693          	li	a3,1
    6440:	00098513          	mv	a0,s3
    6444:	000800e7          	jalr	a6
    6448:	fff00793          	li	a5,-1
    644c:	00050613          	mv	a2,a0
    6450:	1af50463          	beq	a0,a5,65f8 <__sflush_r+0x21c>
    6454:	00c41783          	lh	a5,12(s0)
    6458:	02842803          	lw	a6,40(s0)
    645c:	01c42583          	lw	a1,28(s0)
    6460:	0047f793          	and	a5,a5,4
    6464:	00078e63          	beqz	a5,6480 <__sflush_r+0xa4>
    6468:	00442703          	lw	a4,4(s0)
    646c:	03042783          	lw	a5,48(s0)
    6470:	40e60633          	sub	a2,a2,a4
    6474:	00078663          	beqz	a5,6480 <__sflush_r+0xa4>
    6478:	03c42783          	lw	a5,60(s0)
    647c:	40f60633          	sub	a2,a2,a5
    6480:	00000693          	li	a3,0
    6484:	00098513          	mv	a0,s3
    6488:	000800e7          	jalr	a6
    648c:	fff00793          	li	a5,-1
    6490:	12f51463          	bne	a0,a5,65b8 <__sflush_r+0x1dc>
    6494:	0009a683          	lw	a3,0(s3)
    6498:	01d00793          	li	a5,29
    649c:	00c41703          	lh	a4,12(s0)
    64a0:	16d7ea63          	bltu	a5,a3,6614 <__sflush_r+0x238>
    64a4:	204007b7          	lui	a5,0x20400
    64a8:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    64ac:	00d7d7b3          	srl	a5,a5,a3
    64b0:	0017f793          	and	a5,a5,1
    64b4:	16078063          	beqz	a5,6614 <__sflush_r+0x238>
    64b8:	01042603          	lw	a2,16(s0)
    64bc:	fffff7b7          	lui	a5,0xfffff
    64c0:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    64c4:	00f777b3          	and	a5,a4,a5
    64c8:	00f41623          	sh	a5,12(s0)
    64cc:	00042223          	sw	zero,4(s0)
    64d0:	00c42023          	sw	a2,0(s0)
    64d4:	01371793          	sll	a5,a4,0x13
    64d8:	0007d463          	bgez	a5,64e0 <__sflush_r+0x104>
    64dc:	10068263          	beqz	a3,65e0 <__sflush_r+0x204>
    64e0:	03042583          	lw	a1,48(s0)
    64e4:	0099a023          	sw	s1,0(s3)
    64e8:	10058463          	beqz	a1,65f0 <__sflush_r+0x214>
    64ec:	04040793          	add	a5,s0,64
    64f0:	00f58663          	beq	a1,a5,64fc <__sflush_r+0x120>
    64f4:	00098513          	mv	a0,s3
    64f8:	c5dfa0ef          	jal	1154 <_free_r>
    64fc:	01412483          	lw	s1,20(sp)
    6500:	02042823          	sw	zero,48(s0)
    6504:	00000513          	li	a0,0
    6508:	01c12083          	lw	ra,28(sp)
    650c:	01812403          	lw	s0,24(sp)
    6510:	00c12983          	lw	s3,12(sp)
    6514:	02010113          	add	sp,sp,32
    6518:	00008067          	ret
    651c:	01212823          	sw	s2,16(sp)
    6520:	0105a903          	lw	s2,16(a1)
    6524:	08090263          	beqz	s2,65a8 <__sflush_r+0x1cc>
    6528:	00912a23          	sw	s1,20(sp)
    652c:	0005a483          	lw	s1,0(a1)
    6530:	00377713          	and	a4,a4,3
    6534:	0125a023          	sw	s2,0(a1)
    6538:	412484b3          	sub	s1,s1,s2
    653c:	00000793          	li	a5,0
    6540:	00071463          	bnez	a4,6548 <__sflush_r+0x16c>
    6544:	0145a783          	lw	a5,20(a1)
    6548:	00f42423          	sw	a5,8(s0)
    654c:	00904863          	bgtz	s1,655c <__sflush_r+0x180>
    6550:	0540006f          	j	65a4 <__sflush_r+0x1c8>
    6554:	00a90933          	add	s2,s2,a0
    6558:	04905663          	blez	s1,65a4 <__sflush_r+0x1c8>
    655c:	02442783          	lw	a5,36(s0)
    6560:	01c42583          	lw	a1,28(s0)
    6564:	00048693          	mv	a3,s1
    6568:	00090613          	mv	a2,s2
    656c:	00098513          	mv	a0,s3
    6570:	000780e7          	jalr	a5
    6574:	40a484b3          	sub	s1,s1,a0
    6578:	fca04ee3          	bgtz	a0,6554 <__sflush_r+0x178>
    657c:	00c41703          	lh	a4,12(s0)
    6580:	01012903          	lw	s2,16(sp)
    6584:	04076713          	or	a4,a4,64
    6588:	01412483          	lw	s1,20(sp)
    658c:	00e41623          	sh	a4,12(s0)
    6590:	fff00513          	li	a0,-1
    6594:	f75ff06f          	j	6508 <__sflush_r+0x12c>
    6598:	03c5a683          	lw	a3,60(a1)
    659c:	e6d04ee3          	bgtz	a3,6418 <__sflush_r+0x3c>
    65a0:	f65ff06f          	j	6504 <__sflush_r+0x128>
    65a4:	01412483          	lw	s1,20(sp)
    65a8:	01012903          	lw	s2,16(sp)
    65ac:	f59ff06f          	j	6504 <__sflush_r+0x128>
    65b0:	05042603          	lw	a2,80(s0)
    65b4:	eadff06f          	j	6460 <__sflush_r+0x84>
    65b8:	00c41703          	lh	a4,12(s0)
    65bc:	01042683          	lw	a3,16(s0)
    65c0:	fffff7b7          	lui	a5,0xfffff
    65c4:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    65c8:	00f777b3          	and	a5,a4,a5
    65cc:	00f41623          	sh	a5,12(s0)
    65d0:	00042223          	sw	zero,4(s0)
    65d4:	00d42023          	sw	a3,0(s0)
    65d8:	01371793          	sll	a5,a4,0x13
    65dc:	f007d2e3          	bgez	a5,64e0 <__sflush_r+0x104>
    65e0:	03042583          	lw	a1,48(s0)
    65e4:	04a42823          	sw	a0,80(s0)
    65e8:	0099a023          	sw	s1,0(s3)
    65ec:	f00590e3          	bnez	a1,64ec <__sflush_r+0x110>
    65f0:	01412483          	lw	s1,20(sp)
    65f4:	f11ff06f          	j	6504 <__sflush_r+0x128>
    65f8:	0009a783          	lw	a5,0(s3)
    65fc:	e4078ce3          	beqz	a5,6454 <__sflush_r+0x78>
    6600:	01d00713          	li	a4,29
    6604:	00e78c63          	beq	a5,a4,661c <__sflush_r+0x240>
    6608:	01600713          	li	a4,22
    660c:	00e78863          	beq	a5,a4,661c <__sflush_r+0x240>
    6610:	00c41703          	lh	a4,12(s0)
    6614:	04076713          	or	a4,a4,64
    6618:	f71ff06f          	j	6588 <__sflush_r+0x1ac>
    661c:	0099a023          	sw	s1,0(s3)
    6620:	01412483          	lw	s1,20(sp)
    6624:	ee1ff06f          	j	6504 <__sflush_r+0x128>

00006628 <_fflush_r>:
    6628:	ff010113          	add	sp,sp,-16
    662c:	00812423          	sw	s0,8(sp)
    6630:	00912223          	sw	s1,4(sp)
    6634:	00112623          	sw	ra,12(sp)
    6638:	01212023          	sw	s2,0(sp)
    663c:	00050493          	mv	s1,a0
    6640:	00058413          	mv	s0,a1
    6644:	00050663          	beqz	a0,6650 <_fflush_r+0x28>
    6648:	03452783          	lw	a5,52(a0)
    664c:	0a078a63          	beqz	a5,6700 <_fflush_r+0xd8>
    6650:	00c41783          	lh	a5,12(s0)
    6654:	00000913          	li	s2,0
    6658:	04078063          	beqz	a5,6698 <_fflush_r+0x70>
    665c:	06442703          	lw	a4,100(s0)
    6660:	00177713          	and	a4,a4,1
    6664:	00071663          	bnez	a4,6670 <_fflush_r+0x48>
    6668:	2007f793          	and	a5,a5,512
    666c:	04078463          	beqz	a5,66b4 <_fflush_r+0x8c>
    6670:	00040593          	mv	a1,s0
    6674:	00048513          	mv	a0,s1
    6678:	d65ff0ef          	jal	63dc <__sflush_r>
    667c:	06442783          	lw	a5,100(s0)
    6680:	00050913          	mv	s2,a0
    6684:	0017f793          	and	a5,a5,1
    6688:	00079863          	bnez	a5,6698 <_fflush_r+0x70>
    668c:	00c45783          	lhu	a5,12(s0)
    6690:	2007f793          	and	a5,a5,512
    6694:	04078463          	beqz	a5,66dc <_fflush_r+0xb4>
    6698:	00c12083          	lw	ra,12(sp)
    669c:	00812403          	lw	s0,8(sp)
    66a0:	00412483          	lw	s1,4(sp)
    66a4:	00090513          	mv	a0,s2
    66a8:	00012903          	lw	s2,0(sp)
    66ac:	01010113          	add	sp,sp,16
    66b0:	00008067          	ret
    66b4:	05842503          	lw	a0,88(s0)
    66b8:	e44fa0ef          	jal	cfc <__retarget_lock_acquire_recursive>
    66bc:	00040593          	mv	a1,s0
    66c0:	00048513          	mv	a0,s1
    66c4:	d19ff0ef          	jal	63dc <__sflush_r>
    66c8:	06442783          	lw	a5,100(s0)
    66cc:	00050913          	mv	s2,a0
    66d0:	0017f793          	and	a5,a5,1
    66d4:	fc0792e3          	bnez	a5,6698 <_fflush_r+0x70>
    66d8:	fb5ff06f          	j	668c <_fflush_r+0x64>
    66dc:	05842503          	lw	a0,88(s0)
    66e0:	e20fa0ef          	jal	d00 <__retarget_lock_release_recursive>
    66e4:	00c12083          	lw	ra,12(sp)
    66e8:	00812403          	lw	s0,8(sp)
    66ec:	00412483          	lw	s1,4(sp)
    66f0:	00090513          	mv	a0,s2
    66f4:	00012903          	lw	s2,0(sp)
    66f8:	01010113          	add	sp,sp,16
    66fc:	00008067          	ret
    6700:	224000ef          	jal	6924 <__sinit>
    6704:	f4dff06f          	j	6650 <_fflush_r+0x28>

00006708 <stdio_exit_handler>:
    6708:	7fffa617          	auipc	a2,0x7fffa
    670c:	e2060613          	add	a2,a2,-480 # 80000528 <__sglue>
    6710:	00004597          	auipc	a1,0x4
    6714:	00058593          	mv	a1,a1
    6718:	7fffa517          	auipc	a0,0x7fffa
    671c:	8e850513          	add	a0,a0,-1816 # 80000000 <_impure_data>
    6720:	7a00006f          	j	6ec0 <_fwalk_sglue>

00006724 <cleanup_stdio>:
    6724:	00452583          	lw	a1,4(a0)
    6728:	ff010113          	add	sp,sp,-16
    672c:	00812423          	sw	s0,8(sp)
    6730:	00112623          	sw	ra,12(sp)
    6734:	7fffb797          	auipc	a5,0x7fffb
    6738:	8a878793          	add	a5,a5,-1880 # 80000fdc <__sf>
    673c:	00050413          	mv	s0,a0
    6740:	00f58463          	beq	a1,a5,6748 <cleanup_stdio+0x24>
    6744:	7cd030ef          	jal	a710 <_fclose_r>
    6748:	00842583          	lw	a1,8(s0)
    674c:	7fffb797          	auipc	a5,0x7fffb
    6750:	8f878793          	add	a5,a5,-1800 # 80001044 <__sf+0x68>
    6754:	00f58663          	beq	a1,a5,6760 <cleanup_stdio+0x3c>
    6758:	00040513          	mv	a0,s0
    675c:	7b5030ef          	jal	a710 <_fclose_r>
    6760:	00c42583          	lw	a1,12(s0)
    6764:	7fffb797          	auipc	a5,0x7fffb
    6768:	94878793          	add	a5,a5,-1720 # 800010ac <__sf+0xd0>
    676c:	00f58c63          	beq	a1,a5,6784 <cleanup_stdio+0x60>
    6770:	00040513          	mv	a0,s0
    6774:	00812403          	lw	s0,8(sp)
    6778:	00c12083          	lw	ra,12(sp)
    677c:	01010113          	add	sp,sp,16
    6780:	7910306f          	j	a710 <_fclose_r>
    6784:	00c12083          	lw	ra,12(sp)
    6788:	00812403          	lw	s0,8(sp)
    678c:	01010113          	add	sp,sp,16
    6790:	00008067          	ret

00006794 <global_stdio_init.part.0>:
    6794:	fe010113          	add	sp,sp,-32
    6798:	00000797          	auipc	a5,0x0
    679c:	f7078793          	add	a5,a5,-144 # 6708 <stdio_exit_handler>
    67a0:	00112e23          	sw	ra,28(sp)
    67a4:	00812c23          	sw	s0,24(sp)
    67a8:	00912a23          	sw	s1,20(sp)
    67ac:	7fffb417          	auipc	s0,0x7fffb
    67b0:	83040413          	add	s0,s0,-2000 # 80000fdc <__sf>
    67b4:	01212823          	sw	s2,16(sp)
    67b8:	01312623          	sw	s3,12(sp)
    67bc:	01412423          	sw	s4,8(sp)
    67c0:	00800613          	li	a2,8
    67c4:	00000593          	li	a1,0
    67c8:	7fffa717          	auipc	a4,0x7fffa
    67cc:	f6f72423          	sw	a5,-152(a4) # 80000730 <__stdio_exit_handler>
    67d0:	7fffb517          	auipc	a0,0x7fffb
    67d4:	86850513          	add	a0,a0,-1944 # 80001038 <__sf+0x5c>
    67d8:	00400793          	li	a5,4
    67dc:	00f42623          	sw	a5,12(s0)
    67e0:	00042023          	sw	zero,0(s0)
    67e4:	00042223          	sw	zero,4(s0)
    67e8:	00042423          	sw	zero,8(s0)
    67ec:	06042223          	sw	zero,100(s0)
    67f0:	00042823          	sw	zero,16(s0)
    67f4:	00042a23          	sw	zero,20(s0)
    67f8:	00042c23          	sw	zero,24(s0)
    67fc:	d08fa0ef          	jal	d04 <memset>
    6800:	00000a17          	auipc	s4,0x0
    6804:	774a0a13          	add	s4,s4,1908 # 6f74 <__sread>
    6808:	00000997          	auipc	s3,0x0
    680c:	7c898993          	add	s3,s3,1992 # 6fd0 <__swrite>
    6810:	00001917          	auipc	s2,0x1
    6814:	84890913          	add	s2,s2,-1976 # 7058 <__sseek>
    6818:	00001497          	auipc	s1,0x1
    681c:	8b848493          	add	s1,s1,-1864 # 70d0 <__sclose>
    6820:	7fffb517          	auipc	a0,0x7fffb
    6824:	81450513          	add	a0,a0,-2028 # 80001034 <__sf+0x58>
    6828:	03442023          	sw	s4,32(s0)
    682c:	03342223          	sw	s3,36(s0)
    6830:	03242423          	sw	s2,40(s0)
    6834:	02942623          	sw	s1,44(s0)
    6838:	00842e23          	sw	s0,28(s0)
    683c:	cb8fa0ef          	jal	cf4 <__retarget_lock_init_recursive>
    6840:	000107b7          	lui	a5,0x10
    6844:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x921>
    6848:	00800613          	li	a2,8
    684c:	00000593          	li	a1,0
    6850:	7fffb517          	auipc	a0,0x7fffb
    6854:	85050513          	add	a0,a0,-1968 # 800010a0 <__sf+0xc4>
    6858:	06f42a23          	sw	a5,116(s0)
    685c:	06042423          	sw	zero,104(s0)
    6860:	06042623          	sw	zero,108(s0)
    6864:	06042823          	sw	zero,112(s0)
    6868:	0c042623          	sw	zero,204(s0)
    686c:	06042c23          	sw	zero,120(s0)
    6870:	06042e23          	sw	zero,124(s0)
    6874:	08042023          	sw	zero,128(s0)
    6878:	c8cfa0ef          	jal	d04 <memset>
    687c:	7fffa797          	auipc	a5,0x7fffa
    6880:	7c878793          	add	a5,a5,1992 # 80001044 <__sf+0x68>
    6884:	7fffb517          	auipc	a0,0x7fffb
    6888:	81850513          	add	a0,a0,-2024 # 8000109c <__sf+0xc0>
    688c:	08f42223          	sw	a5,132(s0)
    6890:	09442423          	sw	s4,136(s0)
    6894:	09342623          	sw	s3,140(s0)
    6898:	09242823          	sw	s2,144(s0)
    689c:	08942a23          	sw	s1,148(s0)
    68a0:	c54fa0ef          	jal	cf4 <__retarget_lock_init_recursive>
    68a4:	000207b7          	lui	a5,0x20
    68a8:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    68ac:	00800613          	li	a2,8
    68b0:	00000593          	li	a1,0
    68b4:	7fffb517          	auipc	a0,0x7fffb
    68b8:	85450513          	add	a0,a0,-1964 # 80001108 <__sf+0x12c>
    68bc:	0cf42e23          	sw	a5,220(s0)
    68c0:	0c042823          	sw	zero,208(s0)
    68c4:	0c042a23          	sw	zero,212(s0)
    68c8:	0c042c23          	sw	zero,216(s0)
    68cc:	12042a23          	sw	zero,308(s0)
    68d0:	0e042023          	sw	zero,224(s0)
    68d4:	0e042223          	sw	zero,228(s0)
    68d8:	0e042423          	sw	zero,232(s0)
    68dc:	c28fa0ef          	jal	d04 <memset>
    68e0:	7fffa797          	auipc	a5,0x7fffa
    68e4:	7cc78793          	add	a5,a5,1996 # 800010ac <__sf+0xd0>
    68e8:	0f442823          	sw	s4,240(s0)
    68ec:	0f342a23          	sw	s3,244(s0)
    68f0:	0f242c23          	sw	s2,248(s0)
    68f4:	0e942e23          	sw	s1,252(s0)
    68f8:	0ef42623          	sw	a5,236(s0)
    68fc:	01812403          	lw	s0,24(sp)
    6900:	01c12083          	lw	ra,28(sp)
    6904:	01412483          	lw	s1,20(sp)
    6908:	01012903          	lw	s2,16(sp)
    690c:	00c12983          	lw	s3,12(sp)
    6910:	00812a03          	lw	s4,8(sp)
    6914:	7fffa517          	auipc	a0,0x7fffa
    6918:	7f050513          	add	a0,a0,2032 # 80001104 <__sf+0x128>
    691c:	02010113          	add	sp,sp,32
    6920:	bd4fa06f          	j	cf4 <__retarget_lock_init_recursive>

00006924 <__sinit>:
    6924:	ff010113          	add	sp,sp,-16
    6928:	00812423          	sw	s0,8(sp)
    692c:	00050413          	mv	s0,a0
    6930:	7fffa517          	auipc	a0,0x7fffa
    6934:	df050513          	add	a0,a0,-528 # 80000720 <__lock___sfp_recursive_mutex>
    6938:	00112623          	sw	ra,12(sp)
    693c:	bc0fa0ef          	jal	cfc <__retarget_lock_acquire_recursive>
    6940:	03442783          	lw	a5,52(s0)
    6944:	00079e63          	bnez	a5,6960 <__sinit+0x3c>
    6948:	00000797          	auipc	a5,0x0
    694c:	ddc78793          	add	a5,a5,-548 # 6724 <cleanup_stdio>
    6950:	02f42a23          	sw	a5,52(s0)
    6954:	7fffa797          	auipc	a5,0x7fffa
    6958:	ddc7a783          	lw	a5,-548(a5) # 80000730 <__stdio_exit_handler>
    695c:	00078e63          	beqz	a5,6978 <__sinit+0x54>
    6960:	00812403          	lw	s0,8(sp)
    6964:	00c12083          	lw	ra,12(sp)
    6968:	7fffa517          	auipc	a0,0x7fffa
    696c:	db850513          	add	a0,a0,-584 # 80000720 <__lock___sfp_recursive_mutex>
    6970:	01010113          	add	sp,sp,16
    6974:	b8cfa06f          	j	d00 <__retarget_lock_release_recursive>
    6978:	e1dff0ef          	jal	6794 <global_stdio_init.part.0>
    697c:	00812403          	lw	s0,8(sp)
    6980:	00c12083          	lw	ra,12(sp)
    6984:	7fffa517          	auipc	a0,0x7fffa
    6988:	d9c50513          	add	a0,a0,-612 # 80000720 <__lock___sfp_recursive_mutex>
    698c:	01010113          	add	sp,sp,16
    6990:	b70fa06f          	j	d00 <__retarget_lock_release_recursive>

00006994 <__sfp_lock_acquire>:
    6994:	7fffa517          	auipc	a0,0x7fffa
    6998:	d8c50513          	add	a0,a0,-628 # 80000720 <__lock___sfp_recursive_mutex>
    699c:	b60fa06f          	j	cfc <__retarget_lock_acquire_recursive>

000069a0 <__sfp_lock_release>:
    69a0:	7fffa517          	auipc	a0,0x7fffa
    69a4:	d8050513          	add	a0,a0,-640 # 80000720 <__lock___sfp_recursive_mutex>
    69a8:	b58fa06f          	j	d00 <__retarget_lock_release_recursive>

000069ac <__sfvwrite_r>:
    69ac:	00862783          	lw	a5,8(a2)
    69b0:	2c078463          	beqz	a5,6c78 <__sfvwrite_r+0x2cc>
    69b4:	00c59683          	lh	a3,12(a1) # a71c <_fclose_r+0xc>
    69b8:	fd010113          	add	sp,sp,-48
    69bc:	02812423          	sw	s0,40(sp)
    69c0:	01412c23          	sw	s4,24(sp)
    69c4:	01612823          	sw	s6,16(sp)
    69c8:	02112623          	sw	ra,44(sp)
    69cc:	0086f793          	and	a5,a3,8
    69d0:	00060b13          	mv	s6,a2
    69d4:	00050a13          	mv	s4,a0
    69d8:	00058413          	mv	s0,a1
    69dc:	08078e63          	beqz	a5,6a78 <__sfvwrite_r+0xcc>
    69e0:	0105a783          	lw	a5,16(a1)
    69e4:	08078a63          	beqz	a5,6a78 <__sfvwrite_r+0xcc>
    69e8:	02912223          	sw	s1,36(sp)
    69ec:	03212023          	sw	s2,32(sp)
    69f0:	01312e23          	sw	s3,28(sp)
    69f4:	01512a23          	sw	s5,20(sp)
    69f8:	0026f793          	and	a5,a3,2
    69fc:	000b2483          	lw	s1,0(s6)
    6a00:	0a078463          	beqz	a5,6aa8 <__sfvwrite_r+0xfc>
    6a04:	02442783          	lw	a5,36(s0)
    6a08:	01c42583          	lw	a1,28(s0)
    6a0c:	80000ab7          	lui	s5,0x80000
    6a10:	00000993          	li	s3,0
    6a14:	00000913          	li	s2,0
    6a18:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6a1c:	00098613          	mv	a2,s3
    6a20:	000a0513          	mv	a0,s4
    6a24:	04090263          	beqz	s2,6a68 <__sfvwrite_r+0xbc>
    6a28:	00090693          	mv	a3,s2
    6a2c:	012af463          	bgeu	s5,s2,6a34 <__sfvwrite_r+0x88>
    6a30:	000a8693          	mv	a3,s5
    6a34:	000780e7          	jalr	a5
    6a38:	46a05263          	blez	a0,6e9c <__sfvwrite_r+0x4f0>
    6a3c:	008b2783          	lw	a5,8(s6)
    6a40:	00a989b3          	add	s3,s3,a0
    6a44:	40a90933          	sub	s2,s2,a0
    6a48:	40a787b3          	sub	a5,a5,a0
    6a4c:	00fb2423          	sw	a5,8(s6)
    6a50:	1a078663          	beqz	a5,6bfc <__sfvwrite_r+0x250>
    6a54:	02442783          	lw	a5,36(s0)
    6a58:	01c42583          	lw	a1,28(s0)
    6a5c:	00098613          	mv	a2,s3
    6a60:	000a0513          	mv	a0,s4
    6a64:	fc0912e3          	bnez	s2,6a28 <__sfvwrite_r+0x7c>
    6a68:	0004a983          	lw	s3,0(s1)
    6a6c:	0044a903          	lw	s2,4(s1)
    6a70:	00848493          	add	s1,s1,8
    6a74:	fa9ff06f          	j	6a1c <__sfvwrite_r+0x70>
    6a78:	00040593          	mv	a1,s0
    6a7c:	000a0513          	mv	a0,s4
    6a80:	658000ef          	jal	70d8 <__swsetup_r>
    6a84:	1c051c63          	bnez	a0,6c5c <__sfvwrite_r+0x2b0>
    6a88:	00c41683          	lh	a3,12(s0)
    6a8c:	02912223          	sw	s1,36(sp)
    6a90:	03212023          	sw	s2,32(sp)
    6a94:	01312e23          	sw	s3,28(sp)
    6a98:	01512a23          	sw	s5,20(sp)
    6a9c:	0026f793          	and	a5,a3,2
    6aa0:	000b2483          	lw	s1,0(s6)
    6aa4:	f60790e3          	bnez	a5,6a04 <__sfvwrite_r+0x58>
    6aa8:	01712623          	sw	s7,12(sp)
    6aac:	01812423          	sw	s8,8(sp)
    6ab0:	0016f793          	and	a5,a3,1
    6ab4:	1c079663          	bnez	a5,6c80 <__sfvwrite_r+0x2d4>
    6ab8:	00042783          	lw	a5,0(s0)
    6abc:	00842703          	lw	a4,8(s0)
    6ac0:	80000ab7          	lui	s5,0x80000
    6ac4:	01912223          	sw	s9,4(sp)
    6ac8:	00000b93          	li	s7,0
    6acc:	00000993          	li	s3,0
    6ad0:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6ad4:	00078513          	mv	a0,a5
    6ad8:	00070c13          	mv	s8,a4
    6adc:	10098263          	beqz	s3,6be0 <__sfvwrite_r+0x234>
    6ae0:	2006f613          	and	a2,a3,512
    6ae4:	28060863          	beqz	a2,6d74 <__sfvwrite_r+0x3c8>
    6ae8:	00070c93          	mv	s9,a4
    6aec:	32e9e863          	bltu	s3,a4,6e1c <__sfvwrite_r+0x470>
    6af0:	4806f713          	and	a4,a3,1152
    6af4:	08070a63          	beqz	a4,6b88 <__sfvwrite_r+0x1dc>
    6af8:	01442603          	lw	a2,20(s0)
    6afc:	01042583          	lw	a1,16(s0)
    6b00:	00161713          	sll	a4,a2,0x1
    6b04:	00c70733          	add	a4,a4,a2
    6b08:	40b78933          	sub	s2,a5,a1
    6b0c:	01f75c13          	srl	s8,a4,0x1f
    6b10:	00ec0c33          	add	s8,s8,a4
    6b14:	00190793          	add	a5,s2,1
    6b18:	401c5c13          	sra	s8,s8,0x1
    6b1c:	013787b3          	add	a5,a5,s3
    6b20:	000c0613          	mv	a2,s8
    6b24:	00fc7663          	bgeu	s8,a5,6b30 <__sfvwrite_r+0x184>
    6b28:	00078c13          	mv	s8,a5
    6b2c:	00078613          	mv	a2,a5
    6b30:	4006f693          	and	a3,a3,1024
    6b34:	32068063          	beqz	a3,6e54 <__sfvwrite_r+0x4a8>
    6b38:	00060593          	mv	a1,a2
    6b3c:	000a0513          	mv	a0,s4
    6b40:	921fa0ef          	jal	1460 <_malloc_r>
    6b44:	00050c93          	mv	s9,a0
    6b48:	34050e63          	beqz	a0,6ea4 <__sfvwrite_r+0x4f8>
    6b4c:	01042583          	lw	a1,16(s0)
    6b50:	00090613          	mv	a2,s2
    6b54:	a8cfa0ef          	jal	de0 <memcpy>
    6b58:	00c45783          	lhu	a5,12(s0)
    6b5c:	b7f7f793          	and	a5,a5,-1153
    6b60:	0807e793          	or	a5,a5,128
    6b64:	00f41623          	sh	a5,12(s0)
    6b68:	012c8533          	add	a0,s9,s2
    6b6c:	412c07b3          	sub	a5,s8,s2
    6b70:	01942823          	sw	s9,16(s0)
    6b74:	01842a23          	sw	s8,20(s0)
    6b78:	00a42023          	sw	a0,0(s0)
    6b7c:	00098c13          	mv	s8,s3
    6b80:	00f42423          	sw	a5,8(s0)
    6b84:	00098c93          	mv	s9,s3
    6b88:	000c8613          	mv	a2,s9
    6b8c:	000b8593          	mv	a1,s7
    6b90:	41d000ef          	jal	77ac <memmove>
    6b94:	00842703          	lw	a4,8(s0)
    6b98:	00042783          	lw	a5,0(s0)
    6b9c:	00098913          	mv	s2,s3
    6ba0:	41870733          	sub	a4,a4,s8
    6ba4:	019787b3          	add	a5,a5,s9
    6ba8:	00e42423          	sw	a4,8(s0)
    6bac:	00f42023          	sw	a5,0(s0)
    6bb0:	00000993          	li	s3,0
    6bb4:	008b2783          	lw	a5,8(s6)
    6bb8:	012b8bb3          	add	s7,s7,s2
    6bbc:	412787b3          	sub	a5,a5,s2
    6bc0:	00fb2423          	sw	a5,8(s6)
    6bc4:	02078663          	beqz	a5,6bf0 <__sfvwrite_r+0x244>
    6bc8:	00042783          	lw	a5,0(s0)
    6bcc:	00842703          	lw	a4,8(s0)
    6bd0:	00c41683          	lh	a3,12(s0)
    6bd4:	00078513          	mv	a0,a5
    6bd8:	00070c13          	mv	s8,a4
    6bdc:	f00992e3          	bnez	s3,6ae0 <__sfvwrite_r+0x134>
    6be0:	0004ab83          	lw	s7,0(s1)
    6be4:	0044a983          	lw	s3,4(s1)
    6be8:	00848493          	add	s1,s1,8
    6bec:	ee9ff06f          	j	6ad4 <__sfvwrite_r+0x128>
    6bf0:	00c12b83          	lw	s7,12(sp)
    6bf4:	00812c03          	lw	s8,8(sp)
    6bf8:	00412c83          	lw	s9,4(sp)
    6bfc:	02c12083          	lw	ra,44(sp)
    6c00:	02812403          	lw	s0,40(sp)
    6c04:	02412483          	lw	s1,36(sp)
    6c08:	02012903          	lw	s2,32(sp)
    6c0c:	01c12983          	lw	s3,28(sp)
    6c10:	01412a83          	lw	s5,20(sp)
    6c14:	01812a03          	lw	s4,24(sp)
    6c18:	01012b03          	lw	s6,16(sp)
    6c1c:	00000513          	li	a0,0
    6c20:	03010113          	add	sp,sp,48
    6c24:	00008067          	ret
    6c28:	00040593          	mv	a1,s0
    6c2c:	000a0513          	mv	a0,s4
    6c30:	9f9ff0ef          	jal	6628 <_fflush_r>
    6c34:	0a050e63          	beqz	a0,6cf0 <__sfvwrite_r+0x344>
    6c38:	00c41783          	lh	a5,12(s0)
    6c3c:	00c12b83          	lw	s7,12(sp)
    6c40:	00812c03          	lw	s8,8(sp)
    6c44:	02412483          	lw	s1,36(sp)
    6c48:	02012903          	lw	s2,32(sp)
    6c4c:	01c12983          	lw	s3,28(sp)
    6c50:	01412a83          	lw	s5,20(sp)
    6c54:	0407e793          	or	a5,a5,64
    6c58:	00f41623          	sh	a5,12(s0)
    6c5c:	02c12083          	lw	ra,44(sp)
    6c60:	02812403          	lw	s0,40(sp)
    6c64:	01812a03          	lw	s4,24(sp)
    6c68:	01012b03          	lw	s6,16(sp)
    6c6c:	fff00513          	li	a0,-1
    6c70:	03010113          	add	sp,sp,48
    6c74:	00008067          	ret
    6c78:	00000513          	li	a0,0
    6c7c:	00008067          	ret
    6c80:	00000a93          	li	s5,0
    6c84:	00000513          	li	a0,0
    6c88:	00000c13          	li	s8,0
    6c8c:	00000993          	li	s3,0
    6c90:	08098263          	beqz	s3,6d14 <__sfvwrite_r+0x368>
    6c94:	08050a63          	beqz	a0,6d28 <__sfvwrite_r+0x37c>
    6c98:	000a8793          	mv	a5,s5
    6c9c:	00098b93          	mv	s7,s3
    6ca0:	0137f463          	bgeu	a5,s3,6ca8 <__sfvwrite_r+0x2fc>
    6ca4:	00078b93          	mv	s7,a5
    6ca8:	00042503          	lw	a0,0(s0)
    6cac:	01042783          	lw	a5,16(s0)
    6cb0:	00842903          	lw	s2,8(s0)
    6cb4:	01442683          	lw	a3,20(s0)
    6cb8:	00a7f663          	bgeu	a5,a0,6cc4 <__sfvwrite_r+0x318>
    6cbc:	00d90933          	add	s2,s2,a3
    6cc0:	09794463          	blt	s2,s7,6d48 <__sfvwrite_r+0x39c>
    6cc4:	16dbc263          	blt	s7,a3,6e28 <__sfvwrite_r+0x47c>
    6cc8:	02442783          	lw	a5,36(s0)
    6ccc:	01c42583          	lw	a1,28(s0)
    6cd0:	000c0613          	mv	a2,s8
    6cd4:	000a0513          	mv	a0,s4
    6cd8:	000780e7          	jalr	a5
    6cdc:	00050913          	mv	s2,a0
    6ce0:	f4a05ce3          	blez	a0,6c38 <__sfvwrite_r+0x28c>
    6ce4:	412a8ab3          	sub	s5,s5,s2
    6ce8:	00100513          	li	a0,1
    6cec:	f20a8ee3          	beqz	s5,6c28 <__sfvwrite_r+0x27c>
    6cf0:	008b2783          	lw	a5,8(s6)
    6cf4:	012c0c33          	add	s8,s8,s2
    6cf8:	412989b3          	sub	s3,s3,s2
    6cfc:	412787b3          	sub	a5,a5,s2
    6d00:	00fb2423          	sw	a5,8(s6)
    6d04:	f80796e3          	bnez	a5,6c90 <__sfvwrite_r+0x2e4>
    6d08:	00c12b83          	lw	s7,12(sp)
    6d0c:	00812c03          	lw	s8,8(sp)
    6d10:	eedff06f          	j	6bfc <__sfvwrite_r+0x250>
    6d14:	0044a983          	lw	s3,4(s1)
    6d18:	00048793          	mv	a5,s1
    6d1c:	00848493          	add	s1,s1,8
    6d20:	fe098ae3          	beqz	s3,6d14 <__sfvwrite_r+0x368>
    6d24:	0007ac03          	lw	s8,0(a5)
    6d28:	00098613          	mv	a2,s3
    6d2c:	00a00593          	li	a1,10
    6d30:	000c0513          	mv	a0,s8
    6d34:	714000ef          	jal	7448 <memchr>
    6d38:	14050c63          	beqz	a0,6e90 <__sfvwrite_r+0x4e4>
    6d3c:	00150513          	add	a0,a0,1
    6d40:	41850ab3          	sub	s5,a0,s8
    6d44:	f55ff06f          	j	6c98 <__sfvwrite_r+0x2ec>
    6d48:	000c0593          	mv	a1,s8
    6d4c:	00090613          	mv	a2,s2
    6d50:	25d000ef          	jal	77ac <memmove>
    6d54:	00042783          	lw	a5,0(s0)
    6d58:	00040593          	mv	a1,s0
    6d5c:	000a0513          	mv	a0,s4
    6d60:	012787b3          	add	a5,a5,s2
    6d64:	00f42023          	sw	a5,0(s0)
    6d68:	8c1ff0ef          	jal	6628 <_fflush_r>
    6d6c:	f6050ce3          	beqz	a0,6ce4 <__sfvwrite_r+0x338>
    6d70:	ec9ff06f          	j	6c38 <__sfvwrite_r+0x28c>
    6d74:	01042683          	lw	a3,16(s0)
    6d78:	04f6e463          	bltu	a3,a5,6dc0 <__sfvwrite_r+0x414>
    6d7c:	01442583          	lw	a1,20(s0)
    6d80:	04b9e063          	bltu	s3,a1,6dc0 <__sfvwrite_r+0x414>
    6d84:	00098913          	mv	s2,s3
    6d88:	013af463          	bgeu	s5,s3,6d90 <__sfvwrite_r+0x3e4>
    6d8c:	000a8913          	mv	s2,s5
    6d90:	00090513          	mv	a0,s2
    6d94:	561070ef          	jal	eaf4 <__modsi3>
    6d98:	02442783          	lw	a5,36(s0)
    6d9c:	01c42583          	lw	a1,28(s0)
    6da0:	40a906b3          	sub	a3,s2,a0
    6da4:	000b8613          	mv	a2,s7
    6da8:	000a0513          	mv	a0,s4
    6dac:	000780e7          	jalr	a5
    6db0:	00050913          	mv	s2,a0
    6db4:	04a05a63          	blez	a0,6e08 <__sfvwrite_r+0x45c>
    6db8:	412989b3          	sub	s3,s3,s2
    6dbc:	df9ff06f          	j	6bb4 <__sfvwrite_r+0x208>
    6dc0:	00070913          	mv	s2,a4
    6dc4:	00e9f463          	bgeu	s3,a4,6dcc <__sfvwrite_r+0x420>
    6dc8:	00098913          	mv	s2,s3
    6dcc:	00078513          	mv	a0,a5
    6dd0:	00090613          	mv	a2,s2
    6dd4:	000b8593          	mv	a1,s7
    6dd8:	1d5000ef          	jal	77ac <memmove>
    6ddc:	00842703          	lw	a4,8(s0)
    6de0:	00042783          	lw	a5,0(s0)
    6de4:	41270733          	sub	a4,a4,s2
    6de8:	012787b3          	add	a5,a5,s2
    6dec:	00e42423          	sw	a4,8(s0)
    6df0:	00f42023          	sw	a5,0(s0)
    6df4:	fc0712e3          	bnez	a4,6db8 <__sfvwrite_r+0x40c>
    6df8:	00040593          	mv	a1,s0
    6dfc:	000a0513          	mv	a0,s4
    6e00:	829ff0ef          	jal	6628 <_fflush_r>
    6e04:	fa050ae3          	beqz	a0,6db8 <__sfvwrite_r+0x40c>
    6e08:	00c41783          	lh	a5,12(s0)
    6e0c:	00c12b83          	lw	s7,12(sp)
    6e10:	00812c03          	lw	s8,8(sp)
    6e14:	00412c83          	lw	s9,4(sp)
    6e18:	e2dff06f          	j	6c44 <__sfvwrite_r+0x298>
    6e1c:	00098c13          	mv	s8,s3
    6e20:	00098c93          	mv	s9,s3
    6e24:	d65ff06f          	j	6b88 <__sfvwrite_r+0x1dc>
    6e28:	000b8613          	mv	a2,s7
    6e2c:	000c0593          	mv	a1,s8
    6e30:	17d000ef          	jal	77ac <memmove>
    6e34:	00842703          	lw	a4,8(s0)
    6e38:	00042783          	lw	a5,0(s0)
    6e3c:	000b8913          	mv	s2,s7
    6e40:	41770733          	sub	a4,a4,s7
    6e44:	017787b3          	add	a5,a5,s7
    6e48:	00e42423          	sw	a4,8(s0)
    6e4c:	00f42023          	sw	a5,0(s0)
    6e50:	e95ff06f          	j	6ce4 <__sfvwrite_r+0x338>
    6e54:	000a0513          	mv	a0,s4
    6e58:	27c030ef          	jal	a0d4 <_realloc_r>
    6e5c:	00050c93          	mv	s9,a0
    6e60:	d00514e3          	bnez	a0,6b68 <__sfvwrite_r+0x1bc>
    6e64:	01042583          	lw	a1,16(s0)
    6e68:	000a0513          	mv	a0,s4
    6e6c:	ae8fa0ef          	jal	1154 <_free_r>
    6e70:	00c41783          	lh	a5,12(s0)
    6e74:	00c00713          	li	a4,12
    6e78:	00c12b83          	lw	s7,12(sp)
    6e7c:	00812c03          	lw	s8,8(sp)
    6e80:	00412c83          	lw	s9,4(sp)
    6e84:	00ea2023          	sw	a4,0(s4)
    6e88:	f7f7f793          	and	a5,a5,-129
    6e8c:	db9ff06f          	j	6c44 <__sfvwrite_r+0x298>
    6e90:	00198793          	add	a5,s3,1
    6e94:	00078a93          	mv	s5,a5
    6e98:	e05ff06f          	j	6c9c <__sfvwrite_r+0x2f0>
    6e9c:	00c41783          	lh	a5,12(s0)
    6ea0:	da5ff06f          	j	6c44 <__sfvwrite_r+0x298>
    6ea4:	00c00713          	li	a4,12
    6ea8:	00c41783          	lh	a5,12(s0)
    6eac:	00c12b83          	lw	s7,12(sp)
    6eb0:	00812c03          	lw	s8,8(sp)
    6eb4:	00412c83          	lw	s9,4(sp)
    6eb8:	00ea2023          	sw	a4,0(s4)
    6ebc:	d89ff06f          	j	6c44 <__sfvwrite_r+0x298>

00006ec0 <_fwalk_sglue>:
    6ec0:	fd010113          	add	sp,sp,-48
    6ec4:	03212023          	sw	s2,32(sp)
    6ec8:	01312e23          	sw	s3,28(sp)
    6ecc:	01412c23          	sw	s4,24(sp)
    6ed0:	01512a23          	sw	s5,20(sp)
    6ed4:	01612823          	sw	s6,16(sp)
    6ed8:	01712623          	sw	s7,12(sp)
    6edc:	02112623          	sw	ra,44(sp)
    6ee0:	02812423          	sw	s0,40(sp)
    6ee4:	02912223          	sw	s1,36(sp)
    6ee8:	00050b13          	mv	s6,a0
    6eec:	00058b93          	mv	s7,a1
    6ef0:	00060a93          	mv	s5,a2
    6ef4:	00000a13          	li	s4,0
    6ef8:	00100993          	li	s3,1
    6efc:	fff00913          	li	s2,-1
    6f00:	004aa483          	lw	s1,4(s5)
    6f04:	008aa403          	lw	s0,8(s5)
    6f08:	fff48493          	add	s1,s1,-1
    6f0c:	0204c863          	bltz	s1,6f3c <_fwalk_sglue+0x7c>
    6f10:	00c45783          	lhu	a5,12(s0)
    6f14:	00f9fe63          	bgeu	s3,a5,6f30 <_fwalk_sglue+0x70>
    6f18:	00e41783          	lh	a5,14(s0)
    6f1c:	00040593          	mv	a1,s0
    6f20:	000b0513          	mv	a0,s6
    6f24:	01278663          	beq	a5,s2,6f30 <_fwalk_sglue+0x70>
    6f28:	000b80e7          	jalr	s7
    6f2c:	00aa6a33          	or	s4,s4,a0
    6f30:	fff48493          	add	s1,s1,-1
    6f34:	06840413          	add	s0,s0,104
    6f38:	fd249ce3          	bne	s1,s2,6f10 <_fwalk_sglue+0x50>
    6f3c:	000aaa83          	lw	s5,0(s5)
    6f40:	fc0a90e3          	bnez	s5,6f00 <_fwalk_sglue+0x40>
    6f44:	02c12083          	lw	ra,44(sp)
    6f48:	02812403          	lw	s0,40(sp)
    6f4c:	02412483          	lw	s1,36(sp)
    6f50:	02012903          	lw	s2,32(sp)
    6f54:	01c12983          	lw	s3,28(sp)
    6f58:	01412a83          	lw	s5,20(sp)
    6f5c:	01012b03          	lw	s6,16(sp)
    6f60:	00c12b83          	lw	s7,12(sp)
    6f64:	000a0513          	mv	a0,s4
    6f68:	01812a03          	lw	s4,24(sp)
    6f6c:	03010113          	add	sp,sp,48
    6f70:	00008067          	ret

00006f74 <__sread>:
    6f74:	ff010113          	add	sp,sp,-16
    6f78:	00812423          	sw	s0,8(sp)
    6f7c:	00058413          	mv	s0,a1
    6f80:	00e59583          	lh	a1,14(a1)
    6f84:	00112623          	sw	ra,12(sp)
    6f88:	704000ef          	jal	768c <_read_r>
    6f8c:	02054063          	bltz	a0,6fac <__sread+0x38>
    6f90:	05042783          	lw	a5,80(s0)
    6f94:	00c12083          	lw	ra,12(sp)
    6f98:	00a787b3          	add	a5,a5,a0
    6f9c:	04f42823          	sw	a5,80(s0)
    6fa0:	00812403          	lw	s0,8(sp)
    6fa4:	01010113          	add	sp,sp,16
    6fa8:	00008067          	ret
    6fac:	00c45783          	lhu	a5,12(s0)
    6fb0:	fffff737          	lui	a4,0xfffff
    6fb4:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    6fb8:	00e7f7b3          	and	a5,a5,a4
    6fbc:	00c12083          	lw	ra,12(sp)
    6fc0:	00f41623          	sh	a5,12(s0)
    6fc4:	00812403          	lw	s0,8(sp)
    6fc8:	01010113          	add	sp,sp,16
    6fcc:	00008067          	ret

00006fd0 <__swrite>:
    6fd0:	00c59783          	lh	a5,12(a1)
    6fd4:	fe010113          	add	sp,sp,-32
    6fd8:	00812c23          	sw	s0,24(sp)
    6fdc:	00912a23          	sw	s1,20(sp)
    6fe0:	01212823          	sw	s2,16(sp)
    6fe4:	01312623          	sw	s3,12(sp)
    6fe8:	00112e23          	sw	ra,28(sp)
    6fec:	1007f713          	and	a4,a5,256
    6ff0:	00058413          	mv	s0,a1
    6ff4:	00050493          	mv	s1,a0
    6ff8:	00060913          	mv	s2,a2
    6ffc:	00068993          	mv	s3,a3
    7000:	04071063          	bnez	a4,7040 <__swrite+0x70>
    7004:	fffff737          	lui	a4,0xfffff
    7008:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    700c:	00e7f7b3          	and	a5,a5,a4
    7010:	00e41583          	lh	a1,14(s0)
    7014:	00f41623          	sh	a5,12(s0)
    7018:	01812403          	lw	s0,24(sp)
    701c:	01c12083          	lw	ra,28(sp)
    7020:	00098693          	mv	a3,s3
    7024:	00090613          	mv	a2,s2
    7028:	00c12983          	lw	s3,12(sp)
    702c:	01012903          	lw	s2,16(sp)
    7030:	00048513          	mv	a0,s1
    7034:	01412483          	lw	s1,20(sp)
    7038:	02010113          	add	sp,sp,32
    703c:	70c0006f          	j	7748 <_write_r>
    7040:	00e59583          	lh	a1,14(a1)
    7044:	00200693          	li	a3,2
    7048:	00000613          	li	a2,0
    704c:	5dc000ef          	jal	7628 <_lseek_r>
    7050:	00c41783          	lh	a5,12(s0)
    7054:	fb1ff06f          	j	7004 <__swrite+0x34>

00007058 <__sseek>:
    7058:	ff010113          	add	sp,sp,-16
    705c:	00812423          	sw	s0,8(sp)
    7060:	00058413          	mv	s0,a1
    7064:	00e59583          	lh	a1,14(a1)
    7068:	00112623          	sw	ra,12(sp)
    706c:	5bc000ef          	jal	7628 <_lseek_r>
    7070:	fff00793          	li	a5,-1
    7074:	02f50863          	beq	a0,a5,70a4 <__sseek+0x4c>
    7078:	00c45783          	lhu	a5,12(s0)
    707c:	00001737          	lui	a4,0x1
    7080:	00c12083          	lw	ra,12(sp)
    7084:	00e7e7b3          	or	a5,a5,a4
    7088:	01079793          	sll	a5,a5,0x10
    708c:	4107d793          	sra	a5,a5,0x10
    7090:	04a42823          	sw	a0,80(s0)
    7094:	00f41623          	sh	a5,12(s0)
    7098:	00812403          	lw	s0,8(sp)
    709c:	01010113          	add	sp,sp,16
    70a0:	00008067          	ret
    70a4:	00c45783          	lhu	a5,12(s0)
    70a8:	fffff737          	lui	a4,0xfffff
    70ac:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    70b0:	00e7f7b3          	and	a5,a5,a4
    70b4:	01079793          	sll	a5,a5,0x10
    70b8:	4107d793          	sra	a5,a5,0x10
    70bc:	00c12083          	lw	ra,12(sp)
    70c0:	00f41623          	sh	a5,12(s0)
    70c4:	00812403          	lw	s0,8(sp)
    70c8:	01010113          	add	sp,sp,16
    70cc:	00008067          	ret

000070d0 <__sclose>:
    70d0:	00e59583          	lh	a1,14(a1)
    70d4:	4fc0006f          	j	75d0 <_close_r>

000070d8 <__swsetup_r>:
    70d8:	ff010113          	add	sp,sp,-16
    70dc:	00812423          	sw	s0,8(sp)
    70e0:	00912223          	sw	s1,4(sp)
    70e4:	00112623          	sw	ra,12(sp)
    70e8:	7fff9797          	auipc	a5,0x7fff9
    70ec:	6207a783          	lw	a5,1568(a5) # 80000708 <_impure_ptr>
    70f0:	00050493          	mv	s1,a0
    70f4:	00058413          	mv	s0,a1
    70f8:	00078663          	beqz	a5,7104 <__swsetup_r+0x2c>
    70fc:	0347a703          	lw	a4,52(a5)
    7100:	0e070c63          	beqz	a4,71f8 <__swsetup_r+0x120>
    7104:	00c41783          	lh	a5,12(s0)
    7108:	0087f713          	and	a4,a5,8
    710c:	06070a63          	beqz	a4,7180 <__swsetup_r+0xa8>
    7110:	01042703          	lw	a4,16(s0)
    7114:	08070663          	beqz	a4,71a0 <__swsetup_r+0xc8>
    7118:	0017f693          	and	a3,a5,1
    711c:	02068863          	beqz	a3,714c <__swsetup_r+0x74>
    7120:	01442683          	lw	a3,20(s0)
    7124:	00042423          	sw	zero,8(s0)
    7128:	00000513          	li	a0,0
    712c:	40d006b3          	neg	a3,a3
    7130:	00d42c23          	sw	a3,24(s0)
    7134:	02070a63          	beqz	a4,7168 <__swsetup_r+0x90>
    7138:	00c12083          	lw	ra,12(sp)
    713c:	00812403          	lw	s0,8(sp)
    7140:	00412483          	lw	s1,4(sp)
    7144:	01010113          	add	sp,sp,16
    7148:	00008067          	ret
    714c:	0027f693          	and	a3,a5,2
    7150:	00000613          	li	a2,0
    7154:	00069463          	bnez	a3,715c <__swsetup_r+0x84>
    7158:	01442603          	lw	a2,20(s0)
    715c:	00c42423          	sw	a2,8(s0)
    7160:	00000513          	li	a0,0
    7164:	fc071ae3          	bnez	a4,7138 <__swsetup_r+0x60>
    7168:	0807f713          	and	a4,a5,128
    716c:	fc0706e3          	beqz	a4,7138 <__swsetup_r+0x60>
    7170:	0407e793          	or	a5,a5,64
    7174:	00f41623          	sh	a5,12(s0)
    7178:	fff00513          	li	a0,-1
    717c:	fbdff06f          	j	7138 <__swsetup_r+0x60>
    7180:	0107f713          	and	a4,a5,16
    7184:	08070063          	beqz	a4,7204 <__swsetup_r+0x12c>
    7188:	0047f713          	and	a4,a5,4
    718c:	02071c63          	bnez	a4,71c4 <__swsetup_r+0xec>
    7190:	01042703          	lw	a4,16(s0)
    7194:	0087e793          	or	a5,a5,8
    7198:	00f41623          	sh	a5,12(s0)
    719c:	f6071ee3          	bnez	a4,7118 <__swsetup_r+0x40>
    71a0:	2807f693          	and	a3,a5,640
    71a4:	20000613          	li	a2,512
    71a8:	f6c688e3          	beq	a3,a2,7118 <__swsetup_r+0x40>
    71ac:	00040593          	mv	a1,s0
    71b0:	00048513          	mv	a0,s1
    71b4:	6cc030ef          	jal	a880 <__smakebuf_r>
    71b8:	00c41783          	lh	a5,12(s0)
    71bc:	01042703          	lw	a4,16(s0)
    71c0:	f59ff06f          	j	7118 <__swsetup_r+0x40>
    71c4:	03042583          	lw	a1,48(s0)
    71c8:	00058e63          	beqz	a1,71e4 <__swsetup_r+0x10c>
    71cc:	04040713          	add	a4,s0,64
    71d0:	00e58863          	beq	a1,a4,71e0 <__swsetup_r+0x108>
    71d4:	00048513          	mv	a0,s1
    71d8:	f7df90ef          	jal	1154 <_free_r>
    71dc:	00c41783          	lh	a5,12(s0)
    71e0:	02042823          	sw	zero,48(s0)
    71e4:	01042703          	lw	a4,16(s0)
    71e8:	fdb7f793          	and	a5,a5,-37
    71ec:	00042223          	sw	zero,4(s0)
    71f0:	00e42023          	sw	a4,0(s0)
    71f4:	fa1ff06f          	j	7194 <__swsetup_r+0xbc>
    71f8:	00078513          	mv	a0,a5
    71fc:	f28ff0ef          	jal	6924 <__sinit>
    7200:	f05ff06f          	j	7104 <__swsetup_r+0x2c>
    7204:	00900713          	li	a4,9
    7208:	00e4a023          	sw	a4,0(s1)
    720c:	0407e793          	or	a5,a5,64
    7210:	00f41623          	sh	a5,12(s0)
    7214:	fff00513          	li	a0,-1
    7218:	f21ff06f          	j	7138 <__swsetup_r+0x60>

0000721c <__fputwc>:
    721c:	fc010113          	add	sp,sp,-64
    7220:	02812c23          	sw	s0,56(sp)
    7224:	03412423          	sw	s4,40(sp)
    7228:	03512223          	sw	s5,36(sp)
    722c:	02112e23          	sw	ra,60(sp)
    7230:	02912a23          	sw	s1,52(sp)
    7234:	03312623          	sw	s3,44(sp)
    7238:	00050a13          	mv	s4,a0
    723c:	00058a93          	mv	s5,a1
    7240:	00060413          	mv	s0,a2
    7244:	374000ef          	jal	75b8 <__locale_mb_cur_max>
    7248:	00100793          	li	a5,1
    724c:	02f51663          	bne	a0,a5,7278 <__fputwc+0x5c>
    7250:	fffa8793          	add	a5,s5,-1
    7254:	0fe00713          	li	a4,254
    7258:	02f76063          	bltu	a4,a5,7278 <__fputwc+0x5c>
    725c:	03212823          	sw	s2,48(sp)
    7260:	03612023          	sw	s6,32(sp)
    7264:	01712e23          	sw	s7,28(sp)
    7268:	01510423          	sb	s5,8(sp)
    726c:	00100993          	li	s3,1
    7270:	00810493          	add	s1,sp,8
    7274:	0380006f          	j	72ac <__fputwc+0x90>
    7278:	00810493          	add	s1,sp,8
    727c:	05c40693          	add	a3,s0,92
    7280:	000a8613          	mv	a2,s5
    7284:	00048593          	mv	a1,s1
    7288:	000a0513          	mv	a0,s4
    728c:	3e8030ef          	jal	a674 <_wcrtomb_r>
    7290:	fff00793          	li	a5,-1
    7294:	00050993          	mv	s3,a0
    7298:	0cf50a63          	beq	a0,a5,736c <__fputwc+0x150>
    729c:	0a050663          	beqz	a0,7348 <__fputwc+0x12c>
    72a0:	03212823          	sw	s2,48(sp)
    72a4:	03612023          	sw	s6,32(sp)
    72a8:	01712e23          	sw	s7,28(sp)
    72ac:	00000913          	li	s2,0
    72b0:	fff00b13          	li	s6,-1
    72b4:	00a00b93          	li	s7,10
    72b8:	0200006f          	j	72d8 <__fputwc+0xbc>
    72bc:	00042783          	lw	a5,0(s0)
    72c0:	00178693          	add	a3,a5,1
    72c4:	00d42023          	sw	a3,0(s0)
    72c8:	00e78023          	sb	a4,0(a5)
    72cc:	00190913          	add	s2,s2,1
    72d0:	00148493          	add	s1,s1,1
    72d4:	07397463          	bgeu	s2,s3,733c <__fputwc+0x120>
    72d8:	00842783          	lw	a5,8(s0)
    72dc:	0004c703          	lbu	a4,0(s1)
    72e0:	fff78793          	add	a5,a5,-1
    72e4:	00f42423          	sw	a5,8(s0)
    72e8:	fc07dae3          	bgez	a5,72bc <__fputwc+0xa0>
    72ec:	01842683          	lw	a3,24(s0)
    72f0:	00040613          	mv	a2,s0
    72f4:	00070593          	mv	a1,a4
    72f8:	000a0513          	mv	a0,s4
    72fc:	00d7c463          	blt	a5,a3,7304 <__fputwc+0xe8>
    7300:	fb771ee3          	bne	a4,s7,72bc <__fputwc+0xa0>
    7304:	714030ef          	jal	aa18 <__swbuf_r>
    7308:	fd6512e3          	bne	a0,s6,72cc <__fputwc+0xb0>
    730c:	03012903          	lw	s2,48(sp)
    7310:	02012b03          	lw	s6,32(sp)
    7314:	01c12b83          	lw	s7,28(sp)
    7318:	03c12083          	lw	ra,60(sp)
    731c:	03812403          	lw	s0,56(sp)
    7320:	03412483          	lw	s1,52(sp)
    7324:	02c12983          	lw	s3,44(sp)
    7328:	02812a03          	lw	s4,40(sp)
    732c:	02412a83          	lw	s5,36(sp)
    7330:	fff00513          	li	a0,-1
    7334:	04010113          	add	sp,sp,64
    7338:	00008067          	ret
    733c:	03012903          	lw	s2,48(sp)
    7340:	02012b03          	lw	s6,32(sp)
    7344:	01c12b83          	lw	s7,28(sp)
    7348:	03c12083          	lw	ra,60(sp)
    734c:	03812403          	lw	s0,56(sp)
    7350:	03412483          	lw	s1,52(sp)
    7354:	02c12983          	lw	s3,44(sp)
    7358:	02812a03          	lw	s4,40(sp)
    735c:	000a8513          	mv	a0,s5
    7360:	02412a83          	lw	s5,36(sp)
    7364:	04010113          	add	sp,sp,64
    7368:	00008067          	ret
    736c:	00c45783          	lhu	a5,12(s0)
    7370:	0407e793          	or	a5,a5,64
    7374:	00f41623          	sh	a5,12(s0)
    7378:	fa1ff06f          	j	7318 <__fputwc+0xfc>

0000737c <_fputwc_r>:
    737c:	06462783          	lw	a5,100(a2)
    7380:	fe010113          	add	sp,sp,-32
    7384:	00812c23          	sw	s0,24(sp)
    7388:	00912a23          	sw	s1,20(sp)
    738c:	0017f713          	and	a4,a5,1
    7390:	00112e23          	sw	ra,28(sp)
    7394:	00c61783          	lh	a5,12(a2)
    7398:	00060413          	mv	s0,a2
    739c:	00050493          	mv	s1,a0
    73a0:	00071663          	bnez	a4,73ac <_fputwc_r+0x30>
    73a4:	2007f713          	and	a4,a5,512
    73a8:	08070463          	beqz	a4,7430 <_fputwc_r+0xb4>
    73ac:	01279713          	sll	a4,a5,0x12
    73b0:	02074063          	bltz	a4,73d0 <_fputwc_r+0x54>
    73b4:	06442703          	lw	a4,100(s0)
    73b8:	000026b7          	lui	a3,0x2
    73bc:	00d7e7b3          	or	a5,a5,a3
    73c0:	000026b7          	lui	a3,0x2
    73c4:	00d76733          	or	a4,a4,a3
    73c8:	00f41623          	sh	a5,12(s0)
    73cc:	06e42223          	sw	a4,100(s0)
    73d0:	00048513          	mv	a0,s1
    73d4:	00040613          	mv	a2,s0
    73d8:	e45ff0ef          	jal	721c <__fputwc>
    73dc:	06442783          	lw	a5,100(s0)
    73e0:	00050493          	mv	s1,a0
    73e4:	0017f793          	and	a5,a5,1
    73e8:	00079863          	bnez	a5,73f8 <_fputwc_r+0x7c>
    73ec:	00c45783          	lhu	a5,12(s0)
    73f0:	2007f793          	and	a5,a5,512
    73f4:	00078e63          	beqz	a5,7410 <_fputwc_r+0x94>
    73f8:	01c12083          	lw	ra,28(sp)
    73fc:	01812403          	lw	s0,24(sp)
    7400:	00048513          	mv	a0,s1
    7404:	01412483          	lw	s1,20(sp)
    7408:	02010113          	add	sp,sp,32
    740c:	00008067          	ret
    7410:	05842503          	lw	a0,88(s0)
    7414:	8edf90ef          	jal	d00 <__retarget_lock_release_recursive>
    7418:	01c12083          	lw	ra,28(sp)
    741c:	01812403          	lw	s0,24(sp)
    7420:	00048513          	mv	a0,s1
    7424:	01412483          	lw	s1,20(sp)
    7428:	02010113          	add	sp,sp,32
    742c:	00008067          	ret
    7430:	05862503          	lw	a0,88(a2)
    7434:	00b12623          	sw	a1,12(sp)
    7438:	8c5f90ef          	jal	cfc <__retarget_lock_acquire_recursive>
    743c:	00c41783          	lh	a5,12(s0)
    7440:	00c12583          	lw	a1,12(sp)
    7444:	f69ff06f          	j	73ac <_fputwc_r+0x30>

00007448 <memchr>:
    7448:	00357793          	and	a5,a0,3
    744c:	0ff5f693          	zext.b	a3,a1
    7450:	02078a63          	beqz	a5,7484 <memchr+0x3c>
    7454:	fff60793          	add	a5,a2,-1
    7458:	02060e63          	beqz	a2,7494 <memchr+0x4c>
    745c:	fff00613          	li	a2,-1
    7460:	0180006f          	j	7478 <memchr+0x30>
    7464:	00150513          	add	a0,a0,1
    7468:	00357713          	and	a4,a0,3
    746c:	00070e63          	beqz	a4,7488 <memchr+0x40>
    7470:	fff78793          	add	a5,a5,-1
    7474:	02c78063          	beq	a5,a2,7494 <memchr+0x4c>
    7478:	00054703          	lbu	a4,0(a0)
    747c:	fed714e3          	bne	a4,a3,7464 <memchr+0x1c>
    7480:	00008067          	ret
    7484:	00060793          	mv	a5,a2
    7488:	00300713          	li	a4,3
    748c:	00f76863          	bltu	a4,a5,749c <memchr+0x54>
    7490:	06079063          	bnez	a5,74f0 <memchr+0xa8>
    7494:	00000513          	li	a0,0
    7498:	00008067          	ret
    749c:	0ff5f593          	zext.b	a1,a1
    74a0:	00859713          	sll	a4,a1,0x8
    74a4:	00b705b3          	add	a1,a4,a1
    74a8:	01059713          	sll	a4,a1,0x10
    74ac:	feff08b7          	lui	a7,0xfeff0
    74b0:	80808837          	lui	a6,0x80808
    74b4:	00e585b3          	add	a1,a1,a4
    74b8:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    74bc:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    74c0:	00300313          	li	t1,3
    74c4:	0100006f          	j	74d4 <memchr+0x8c>
    74c8:	ffc78793          	add	a5,a5,-4
    74cc:	00450513          	add	a0,a0,4
    74d0:	fcf370e3          	bgeu	t1,a5,7490 <memchr+0x48>
    74d4:	00052703          	lw	a4,0(a0)
    74d8:	00e5c733          	xor	a4,a1,a4
    74dc:	01170633          	add	a2,a4,a7
    74e0:	fff74713          	not	a4,a4
    74e4:	00e67733          	and	a4,a2,a4
    74e8:	01077733          	and	a4,a4,a6
    74ec:	fc070ee3          	beqz	a4,74c8 <memchr+0x80>
    74f0:	00f507b3          	add	a5,a0,a5
    74f4:	00c0006f          	j	7500 <memchr+0xb8>
    74f8:	00150513          	add	a0,a0,1
    74fc:	f8f50ce3          	beq	a0,a5,7494 <memchr+0x4c>
    7500:	00054703          	lbu	a4,0(a0)
    7504:	fed71ae3          	bne	a4,a3,74f8 <memchr+0xb0>
    7508:	00008067          	ret

0000750c <strncpy>:
    750c:	00a5e7b3          	or	a5,a1,a0
    7510:	0037f793          	and	a5,a5,3
    7514:	00079663          	bnez	a5,7520 <strncpy+0x14>
    7518:	00300793          	li	a5,3
    751c:	04c7e663          	bltu	a5,a2,7568 <strncpy+0x5c>
    7520:	00050713          	mv	a4,a0
    7524:	01c0006f          	j	7540 <strncpy+0x34>
    7528:	fff5c683          	lbu	a3,-1(a1)
    752c:	fff60813          	add	a6,a2,-1
    7530:	fed78fa3          	sb	a3,-1(a5)
    7534:	00068e63          	beqz	a3,7550 <strncpy+0x44>
    7538:	00078713          	mv	a4,a5
    753c:	00080613          	mv	a2,a6
    7540:	00158593          	add	a1,a1,1
    7544:	00170793          	add	a5,a4,1
    7548:	fe0610e3          	bnez	a2,7528 <strncpy+0x1c>
    754c:	00008067          	ret
    7550:	00c70733          	add	a4,a4,a2
    7554:	06080063          	beqz	a6,75b4 <strncpy+0xa8>
    7558:	00178793          	add	a5,a5,1
    755c:	fe078fa3          	sb	zero,-1(a5)
    7560:	fee79ce3          	bne	a5,a4,7558 <strncpy+0x4c>
    7564:	00008067          	ret
    7568:	feff0337          	lui	t1,0xfeff0
    756c:	808088b7          	lui	a7,0x80808
    7570:	00050713          	mv	a4,a0
    7574:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7578:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    757c:	00300e13          	li	t3,3
    7580:	0180006f          	j	7598 <strncpy+0x8c>
    7584:	00d72023          	sw	a3,0(a4)
    7588:	ffc60613          	add	a2,a2,-4
    758c:	00470713          	add	a4,a4,4
    7590:	00458593          	add	a1,a1,4
    7594:	face76e3          	bgeu	t3,a2,7540 <strncpy+0x34>
    7598:	0005a683          	lw	a3,0(a1)
    759c:	006687b3          	add	a5,a3,t1
    75a0:	fff6c813          	not	a6,a3
    75a4:	0107f7b3          	and	a5,a5,a6
    75a8:	0117f7b3          	and	a5,a5,a7
    75ac:	fc078ce3          	beqz	a5,7584 <strncpy+0x78>
    75b0:	f91ff06f          	j	7540 <strncpy+0x34>
    75b4:	00008067          	ret

000075b8 <__locale_mb_cur_max>:
    75b8:	7fff9517          	auipc	a0,0x7fff9
    75bc:	0a454503          	lbu	a0,164(a0) # 8000065c <__global_locale+0x128>
    75c0:	00008067          	ret

000075c4 <_localeconv_r>:
    75c4:	7fff9517          	auipc	a0,0x7fff9
    75c8:	06050513          	add	a0,a0,96 # 80000624 <__global_locale+0xf0>
    75cc:	00008067          	ret

000075d0 <_close_r>:
    75d0:	ff010113          	add	sp,sp,-16
    75d4:	00812423          	sw	s0,8(sp)
    75d8:	00050413          	mv	s0,a0
    75dc:	00058513          	mv	a0,a1
    75e0:	7fff9797          	auipc	a5,0x7fff9
    75e4:	1207ac23          	sw	zero,312(a5) # 80000718 <errno>
    75e8:	00112623          	sw	ra,12(sp)
    75ec:	b00f90ef          	jal	8ec <_close>
    75f0:	fff00793          	li	a5,-1
    75f4:	00f50a63          	beq	a0,a5,7608 <_close_r+0x38>
    75f8:	00c12083          	lw	ra,12(sp)
    75fc:	00812403          	lw	s0,8(sp)
    7600:	01010113          	add	sp,sp,16
    7604:	00008067          	ret
    7608:	7fff9797          	auipc	a5,0x7fff9
    760c:	1107a783          	lw	a5,272(a5) # 80000718 <errno>
    7610:	fe0784e3          	beqz	a5,75f8 <_close_r+0x28>
    7614:	00c12083          	lw	ra,12(sp)
    7618:	00f42023          	sw	a5,0(s0)
    761c:	00812403          	lw	s0,8(sp)
    7620:	01010113          	add	sp,sp,16
    7624:	00008067          	ret

00007628 <_lseek_r>:
    7628:	ff010113          	add	sp,sp,-16
    762c:	00058713          	mv	a4,a1
    7630:	00812423          	sw	s0,8(sp)
    7634:	00060593          	mv	a1,a2
    7638:	00050413          	mv	s0,a0
    763c:	00068613          	mv	a2,a3
    7640:	00070513          	mv	a0,a4
    7644:	7fff9797          	auipc	a5,0x7fff9
    7648:	0c07aa23          	sw	zero,212(a5) # 80000718 <errno>
    764c:	00112623          	sw	ra,12(sp)
    7650:	ad8f90ef          	jal	928 <_lseek>
    7654:	fff00793          	li	a5,-1
    7658:	00f50a63          	beq	a0,a5,766c <_lseek_r+0x44>
    765c:	00c12083          	lw	ra,12(sp)
    7660:	00812403          	lw	s0,8(sp)
    7664:	01010113          	add	sp,sp,16
    7668:	00008067          	ret
    766c:	7fff9797          	auipc	a5,0x7fff9
    7670:	0ac7a783          	lw	a5,172(a5) # 80000718 <errno>
    7674:	fe0784e3          	beqz	a5,765c <_lseek_r+0x34>
    7678:	00c12083          	lw	ra,12(sp)
    767c:	00f42023          	sw	a5,0(s0)
    7680:	00812403          	lw	s0,8(sp)
    7684:	01010113          	add	sp,sp,16
    7688:	00008067          	ret

0000768c <_read_r>:
    768c:	ff010113          	add	sp,sp,-16
    7690:	00058713          	mv	a4,a1
    7694:	00812423          	sw	s0,8(sp)
    7698:	00060593          	mv	a1,a2
    769c:	00050413          	mv	s0,a0
    76a0:	00068613          	mv	a2,a3
    76a4:	00070513          	mv	a0,a4
    76a8:	7fff9797          	auipc	a5,0x7fff9
    76ac:	0607a823          	sw	zero,112(a5) # 80000718 <errno>
    76b0:	00112623          	sw	ra,12(sp)
    76b4:	a7cf90ef          	jal	930 <_read>
    76b8:	fff00793          	li	a5,-1
    76bc:	00f50a63          	beq	a0,a5,76d0 <_read_r+0x44>
    76c0:	00c12083          	lw	ra,12(sp)
    76c4:	00812403          	lw	s0,8(sp)
    76c8:	01010113          	add	sp,sp,16
    76cc:	00008067          	ret
    76d0:	7fff9797          	auipc	a5,0x7fff9
    76d4:	0487a783          	lw	a5,72(a5) # 80000718 <errno>
    76d8:	fe0784e3          	beqz	a5,76c0 <_read_r+0x34>
    76dc:	00c12083          	lw	ra,12(sp)
    76e0:	00f42023          	sw	a5,0(s0)
    76e4:	00812403          	lw	s0,8(sp)
    76e8:	01010113          	add	sp,sp,16
    76ec:	00008067          	ret

000076f0 <_sbrk_r>:
    76f0:	ff010113          	add	sp,sp,-16
    76f4:	00812423          	sw	s0,8(sp)
    76f8:	00050413          	mv	s0,a0
    76fc:	00058513          	mv	a0,a1
    7700:	7fff9797          	auipc	a5,0x7fff9
    7704:	0007ac23          	sw	zero,24(a5) # 80000718 <errno>
    7708:	00112623          	sw	ra,12(sp)
    770c:	ba4f90ef          	jal	ab0 <_sbrk>
    7710:	fff00793          	li	a5,-1
    7714:	00f50a63          	beq	a0,a5,7728 <_sbrk_r+0x38>
    7718:	00c12083          	lw	ra,12(sp)
    771c:	00812403          	lw	s0,8(sp)
    7720:	01010113          	add	sp,sp,16
    7724:	00008067          	ret
    7728:	7fff9797          	auipc	a5,0x7fff9
    772c:	ff07a783          	lw	a5,-16(a5) # 80000718 <errno>
    7730:	fe0784e3          	beqz	a5,7718 <_sbrk_r+0x28>
    7734:	00c12083          	lw	ra,12(sp)
    7738:	00f42023          	sw	a5,0(s0)
    773c:	00812403          	lw	s0,8(sp)
    7740:	01010113          	add	sp,sp,16
    7744:	00008067          	ret

00007748 <_write_r>:
    7748:	ff010113          	add	sp,sp,-16
    774c:	00058713          	mv	a4,a1
    7750:	00812423          	sw	s0,8(sp)
    7754:	00060593          	mv	a1,a2
    7758:	00050413          	mv	s0,a0
    775c:	00068613          	mv	a2,a3
    7760:	00070513          	mv	a0,a4
    7764:	7fff9797          	auipc	a5,0x7fff9
    7768:	fa07aa23          	sw	zero,-76(a5) # 80000718 <errno>
    776c:	00112623          	sw	ra,12(sp)
    7770:	a9cf90ef          	jal	a0c <_write>
    7774:	fff00793          	li	a5,-1
    7778:	00f50a63          	beq	a0,a5,778c <_write_r+0x44>
    777c:	00c12083          	lw	ra,12(sp)
    7780:	00812403          	lw	s0,8(sp)
    7784:	01010113          	add	sp,sp,16
    7788:	00008067          	ret
    778c:	7fff9797          	auipc	a5,0x7fff9
    7790:	f8c7a783          	lw	a5,-116(a5) # 80000718 <errno>
    7794:	fe0784e3          	beqz	a5,777c <_write_r+0x34>
    7798:	00c12083          	lw	ra,12(sp)
    779c:	00f42023          	sw	a5,0(s0)
    77a0:	00812403          	lw	s0,8(sp)
    77a4:	01010113          	add	sp,sp,16
    77a8:	00008067          	ret

000077ac <memmove>:
    77ac:	02a5f663          	bgeu	a1,a0,77d8 <memmove+0x2c>
    77b0:	00c58733          	add	a4,a1,a2
    77b4:	02e57263          	bgeu	a0,a4,77d8 <memmove+0x2c>
    77b8:	00c507b3          	add	a5,a0,a2
    77bc:	04060663          	beqz	a2,7808 <memmove+0x5c>
    77c0:	fff74683          	lbu	a3,-1(a4)
    77c4:	fff78793          	add	a5,a5,-1
    77c8:	fff70713          	add	a4,a4,-1
    77cc:	00d78023          	sb	a3,0(a5)
    77d0:	fef518e3          	bne	a0,a5,77c0 <memmove+0x14>
    77d4:	00008067          	ret
    77d8:	00f00793          	li	a5,15
    77dc:	02c7e863          	bltu	a5,a2,780c <memmove+0x60>
    77e0:	00050793          	mv	a5,a0
    77e4:	fff60693          	add	a3,a2,-1
    77e8:	0c060263          	beqz	a2,78ac <memmove+0x100>
    77ec:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x3a9>
    77f0:	00d786b3          	add	a3,a5,a3
    77f4:	0005c703          	lbu	a4,0(a1)
    77f8:	00178793          	add	a5,a5,1
    77fc:	00158593          	add	a1,a1,1
    7800:	fee78fa3          	sb	a4,-1(a5)
    7804:	fed798e3          	bne	a5,a3,77f4 <memmove+0x48>
    7808:	00008067          	ret
    780c:	00b567b3          	or	a5,a0,a1
    7810:	0037f793          	and	a5,a5,3
    7814:	08079663          	bnez	a5,78a0 <memmove+0xf4>
    7818:	ff060893          	add	a7,a2,-16
    781c:	ff08f893          	and	a7,a7,-16
    7820:	01088893          	add	a7,a7,16
    7824:	011506b3          	add	a3,a0,a7
    7828:	00058713          	mv	a4,a1
    782c:	00050793          	mv	a5,a0
    7830:	00072803          	lw	a6,0(a4)
    7834:	01070713          	add	a4,a4,16
    7838:	01078793          	add	a5,a5,16
    783c:	ff07a823          	sw	a6,-16(a5)
    7840:	ff472803          	lw	a6,-12(a4)
    7844:	ff07aa23          	sw	a6,-12(a5)
    7848:	ff872803          	lw	a6,-8(a4)
    784c:	ff07ac23          	sw	a6,-8(a5)
    7850:	ffc72803          	lw	a6,-4(a4)
    7854:	ff07ae23          	sw	a6,-4(a5)
    7858:	fcd79ce3          	bne	a5,a3,7830 <memmove+0x84>
    785c:	00c67813          	and	a6,a2,12
    7860:	011585b3          	add	a1,a1,a7
    7864:	00f67713          	and	a4,a2,15
    7868:	04080463          	beqz	a6,78b0 <memmove+0x104>
    786c:	ffc70813          	add	a6,a4,-4
    7870:	ffc87813          	and	a6,a6,-4
    7874:	00480813          	add	a6,a6,4
    7878:	010687b3          	add	a5,a3,a6
    787c:	00058713          	mv	a4,a1
    7880:	00072883          	lw	a7,0(a4)
    7884:	00468693          	add	a3,a3,4
    7888:	00470713          	add	a4,a4,4
    788c:	ff16ae23          	sw	a7,-4(a3)
    7890:	fef698e3          	bne	a3,a5,7880 <memmove+0xd4>
    7894:	00367613          	and	a2,a2,3
    7898:	010585b3          	add	a1,a1,a6
    789c:	f49ff06f          	j	77e4 <memmove+0x38>
    78a0:	fff60693          	add	a3,a2,-1
    78a4:	00050793          	mv	a5,a0
    78a8:	f45ff06f          	j	77ec <memmove+0x40>
    78ac:	00008067          	ret
    78b0:	00070613          	mv	a2,a4
    78b4:	f31ff06f          	j	77e4 <memmove+0x38>

000078b8 <frexp>:
    78b8:	ff010113          	add	sp,sp,-16
    78bc:	00912223          	sw	s1,4(sp)
    78c0:	800004b7          	lui	s1,0x80000
    78c4:	00812423          	sw	s0,8(sp)
    78c8:	00112623          	sw	ra,12(sp)
    78cc:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    78d0:	00060413          	mv	s0,a2
    78d4:	00062023          	sw	zero,0(a2)
    78d8:	00b4f6b3          	and	a3,s1,a1
    78dc:	7ff00637          	lui	a2,0x7ff00
    78e0:	00058793          	mv	a5,a1
    78e4:	00050713          	mv	a4,a0
    78e8:	04c6f063          	bgeu	a3,a2,7928 <frexp+0x70>
    78ec:	00a6e633          	or	a2,a3,a0
    78f0:	02060c63          	beqz	a2,7928 <frexp+0x70>
    78f4:	0145d613          	srl	a2,a1,0x14
    78f8:	7ff67613          	and	a2,a2,2047
    78fc:	04060463          	beqz	a2,7944 <frexp+0x8c>
    7900:	00000593          	li	a1,0
    7904:	80100637          	lui	a2,0x80100
    7908:	4146d693          	sra	a3,a3,0x14
    790c:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7910:	c0268693          	add	a3,a3,-1022
    7914:	00c7f7b3          	and	a5,a5,a2
    7918:	00b686b3          	add	a3,a3,a1
    791c:	3fe00637          	lui	a2,0x3fe00
    7920:	00c7e7b3          	or	a5,a5,a2
    7924:	00d42023          	sw	a3,0(s0)
    7928:	00c12083          	lw	ra,12(sp)
    792c:	00812403          	lw	s0,8(sp)
    7930:	00412483          	lw	s1,4(sp)
    7934:	00070513          	mv	a0,a4
    7938:	00078593          	mv	a1,a5
    793c:	01010113          	add	sp,sp,16
    7940:	00008067          	ret
    7944:	7fff9797          	auipc	a5,0x7fff9
    7948:	d7c78793          	add	a5,a5,-644 # 800006c0 <__global_locale+0x18c>
    794c:	0047a683          	lw	a3,4(a5)
    7950:	0007a603          	lw	a2,0(a5)
    7954:	199050ef          	jal	d2ec <__muldf3>
    7958:	00058793          	mv	a5,a1
    795c:	00b4f6b3          	and	a3,s1,a1
    7960:	00050713          	mv	a4,a0
    7964:	fca00593          	li	a1,-54
    7968:	f9dff06f          	j	7904 <frexp+0x4c>

0000796c <quorem>:
    796c:	fb010113          	add	sp,sp,-80
    7970:	04912223          	sw	s1,68(sp)
    7974:	01052783          	lw	a5,16(a0)
    7978:	0105a483          	lw	s1,16(a1)
    797c:	04112623          	sw	ra,76(sp)
    7980:	00b12423          	sw	a1,8(sp)
    7984:	2097ca63          	blt	a5,s1,7b98 <quorem+0x22c>
    7988:	fff48493          	add	s1,s1,-1
    798c:	03512a23          	sw	s5,52(sp)
    7990:	03812423          	sw	s8,40(sp)
    7994:	00249a93          	sll	s5,s1,0x2
    7998:	01458c13          	add	s8,a1,20
    799c:	05212023          	sw	s2,64(sp)
    79a0:	03312e23          	sw	s3,60(sp)
    79a4:	015c0933          	add	s2,s8,s5
    79a8:	01450993          	add	s3,a0,20
    79ac:	015987b3          	add	a5,s3,s5
    79b0:	03712623          	sw	s7,44(sp)
    79b4:	00092b83          	lw	s7,0(s2)
    79b8:	03912223          	sw	s9,36(sp)
    79bc:	0007ac83          	lw	s9,0(a5)
    79c0:	001b8b93          	add	s7,s7,1
    79c4:	03412c23          	sw	s4,56(sp)
    79c8:	000b8593          	mv	a1,s7
    79cc:	00050a13          	mv	s4,a0
    79d0:	000c8513          	mv	a0,s9
    79d4:	04812423          	sw	s0,72(sp)
    79d8:	00f12623          	sw	a5,12(sp)
    79dc:	09c070ef          	jal	ea78 <__hidden___udivsi3>
    79e0:	00050413          	mv	s0,a0
    79e4:	0d7cee63          	bltu	s9,s7,7ac0 <quorem+0x154>
    79e8:	03a12023          	sw	s10,32(sp)
    79ec:	00010d37          	lui	s10,0x10
    79f0:	01b12e23          	sw	s11,28(sp)
    79f4:	03612823          	sw	s6,48(sp)
    79f8:	000c0a93          	mv	s5,s8
    79fc:	00098d93          	mv	s11,s3
    7a00:	00000c93          	li	s9,0
    7a04:	00000b93          	li	s7,0
    7a08:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    7a0c:	000aab03          	lw	s6,0(s5)
    7a10:	00040593          	mv	a1,s0
    7a14:	004d8d93          	add	s11,s11,4
    7a18:	01ab7533          	and	a0,s6,s10
    7a1c:	799060ef          	jal	e9b4 <__mulsi3>
    7a20:	00050793          	mv	a5,a0
    7a24:	00040593          	mv	a1,s0
    7a28:	010b5513          	srl	a0,s6,0x10
    7a2c:	01978cb3          	add	s9,a5,s9
    7a30:	785060ef          	jal	e9b4 <__mulsi3>
    7a34:	ffcda603          	lw	a2,-4(s11)
    7a38:	01acf733          	and	a4,s9,s10
    7a3c:	010cdc93          	srl	s9,s9,0x10
    7a40:	01a677b3          	and	a5,a2,s10
    7a44:	40e787b3          	sub	a5,a5,a4
    7a48:	017787b3          	add	a5,a5,s7
    7a4c:	01950533          	add	a0,a0,s9
    7a50:	4107d713          	sra	a4,a5,0x10
    7a54:	01a575b3          	and	a1,a0,s10
    7a58:	01065613          	srl	a2,a2,0x10
    7a5c:	40b70733          	sub	a4,a4,a1
    7a60:	00c70733          	add	a4,a4,a2
    7a64:	01a7f7b3          	and	a5,a5,s10
    7a68:	01071613          	sll	a2,a4,0x10
    7a6c:	00c7e7b3          	or	a5,a5,a2
    7a70:	004a8a93          	add	s5,s5,4
    7a74:	fefdae23          	sw	a5,-4(s11)
    7a78:	01055c93          	srl	s9,a0,0x10
    7a7c:	41075b93          	sra	s7,a4,0x10
    7a80:	f95976e3          	bgeu	s2,s5,7a0c <quorem+0xa0>
    7a84:	00c12703          	lw	a4,12(sp)
    7a88:	00072783          	lw	a5,0(a4)
    7a8c:	12079063          	bnez	a5,7bac <quorem+0x240>
    7a90:	ffc70a93          	add	s5,a4,-4
    7a94:	0159e863          	bltu	s3,s5,7aa4 <quorem+0x138>
    7a98:	0180006f          	j	7ab0 <quorem+0x144>
    7a9c:	fff48493          	add	s1,s1,-1
    7aa0:	0159f863          	bgeu	s3,s5,7ab0 <quorem+0x144>
    7aa4:	000aa783          	lw	a5,0(s5)
    7aa8:	ffca8a93          	add	s5,s5,-4
    7aac:	fe0788e3          	beqz	a5,7a9c <quorem+0x130>
    7ab0:	03012b03          	lw	s6,48(sp)
    7ab4:	02012d03          	lw	s10,32(sp)
    7ab8:	01c12d83          	lw	s11,28(sp)
    7abc:	009a2823          	sw	s1,16(s4)
    7ac0:	00812583          	lw	a1,8(sp)
    7ac4:	000a0513          	mv	a0,s4
    7ac8:	1fc020ef          	jal	9cc4 <__mcmp>
    7acc:	08054c63          	bltz	a0,7b64 <quorem+0x1f8>
    7ad0:	00010537          	lui	a0,0x10
    7ad4:	00098593          	mv	a1,s3
    7ad8:	00000713          	li	a4,0
    7adc:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    7ae0:	0005a683          	lw	a3,0(a1)
    7ae4:	000c2603          	lw	a2,0(s8)
    7ae8:	00458593          	add	a1,a1,4
    7aec:	00a6f7b3          	and	a5,a3,a0
    7af0:	00a67833          	and	a6,a2,a0
    7af4:	410787b3          	sub	a5,a5,a6
    7af8:	00e787b3          	add	a5,a5,a4
    7afc:	4107d713          	sra	a4,a5,0x10
    7b00:	01065613          	srl	a2,a2,0x10
    7b04:	0106d693          	srl	a3,a3,0x10
    7b08:	40c70733          	sub	a4,a4,a2
    7b0c:	00d70733          	add	a4,a4,a3
    7b10:	01071693          	sll	a3,a4,0x10
    7b14:	00a7f7b3          	and	a5,a5,a0
    7b18:	00d7e7b3          	or	a5,a5,a3
    7b1c:	004c0c13          	add	s8,s8,4
    7b20:	fef5ae23          	sw	a5,-4(a1)
    7b24:	41075713          	sra	a4,a4,0x10
    7b28:	fb897ce3          	bgeu	s2,s8,7ae0 <quorem+0x174>
    7b2c:	00249793          	sll	a5,s1,0x2
    7b30:	00f987b3          	add	a5,s3,a5
    7b34:	0007a703          	lw	a4,0(a5)
    7b38:	02071463          	bnez	a4,7b60 <quorem+0x1f4>
    7b3c:	ffc78793          	add	a5,a5,-4
    7b40:	00f9e863          	bltu	s3,a5,7b50 <quorem+0x1e4>
    7b44:	0180006f          	j	7b5c <quorem+0x1f0>
    7b48:	fff48493          	add	s1,s1,-1
    7b4c:	00f9f863          	bgeu	s3,a5,7b5c <quorem+0x1f0>
    7b50:	0007a703          	lw	a4,0(a5)
    7b54:	ffc78793          	add	a5,a5,-4
    7b58:	fe0708e3          	beqz	a4,7b48 <quorem+0x1dc>
    7b5c:	009a2823          	sw	s1,16(s4)
    7b60:	00140413          	add	s0,s0,1
    7b64:	04c12083          	lw	ra,76(sp)
    7b68:	00040513          	mv	a0,s0
    7b6c:	04812403          	lw	s0,72(sp)
    7b70:	04012903          	lw	s2,64(sp)
    7b74:	03c12983          	lw	s3,60(sp)
    7b78:	03812a03          	lw	s4,56(sp)
    7b7c:	03412a83          	lw	s5,52(sp)
    7b80:	02c12b83          	lw	s7,44(sp)
    7b84:	02812c03          	lw	s8,40(sp)
    7b88:	02412c83          	lw	s9,36(sp)
    7b8c:	04412483          	lw	s1,68(sp)
    7b90:	05010113          	add	sp,sp,80
    7b94:	00008067          	ret
    7b98:	04c12083          	lw	ra,76(sp)
    7b9c:	04412483          	lw	s1,68(sp)
    7ba0:	00000513          	li	a0,0
    7ba4:	05010113          	add	sp,sp,80
    7ba8:	00008067          	ret
    7bac:	00812583          	lw	a1,8(sp)
    7bb0:	000a0513          	mv	a0,s4
    7bb4:	03012b03          	lw	s6,48(sp)
    7bb8:	02012d03          	lw	s10,32(sp)
    7bbc:	01c12d83          	lw	s11,28(sp)
    7bc0:	104020ef          	jal	9cc4 <__mcmp>
    7bc4:	f00556e3          	bgez	a0,7ad0 <quorem+0x164>
    7bc8:	f9dff06f          	j	7b64 <quorem+0x1f8>

00007bcc <_dtoa_r>:
    7bcc:	03852303          	lw	t1,56(a0)
    7bd0:	f5010113          	add	sp,sp,-176
    7bd4:	0a812423          	sw	s0,168(sp)
    7bd8:	0a912223          	sw	s1,164(sp)
    7bdc:	0b212023          	sw	s2,160(sp)
    7be0:	09412c23          	sw	s4,152(sp)
    7be4:	07b12e23          	sw	s11,124(sp)
    7be8:	0a112623          	sw	ra,172(sp)
    7bec:	09312e23          	sw	s3,156(sp)
    7bf0:	09512a23          	sw	s5,148(sp)
    7bf4:	00e12a23          	sw	a4,20(sp)
    7bf8:	00f12623          	sw	a5,12(sp)
    7bfc:	01112423          	sw	a7,8(sp)
    7c00:	02b12223          	sw	a1,36(sp)
    7c04:	00c12023          	sw	a2,0(sp)
    7c08:	00050413          	mv	s0,a0
    7c0c:	00058d93          	mv	s11,a1
    7c10:	00060493          	mv	s1,a2
    7c14:	00068a13          	mv	s4,a3
    7c18:	00080913          	mv	s2,a6
    7c1c:	02030263          	beqz	t1,7c40 <_dtoa_r+0x74>
    7c20:	03c52703          	lw	a4,60(a0)
    7c24:	00100793          	li	a5,1
    7c28:	00030593          	mv	a1,t1
    7c2c:	00e797b3          	sll	a5,a5,a4
    7c30:	00e32223          	sw	a4,4(t1)
    7c34:	00f32423          	sw	a5,8(t1)
    7c38:	734010ef          	jal	936c <_Bfree>
    7c3c:	02042c23          	sw	zero,56(s0)
    7c40:	00048993          	mv	s3,s1
    7c44:	00000693          	li	a3,0
    7c48:	0004dc63          	bgez	s1,7c60 <_dtoa_r+0x94>
    7c4c:	00149493          	sll	s1,s1,0x1
    7c50:	0014d793          	srl	a5,s1,0x1
    7c54:	00f12023          	sw	a5,0(sp)
    7c58:	00078993          	mv	s3,a5
    7c5c:	00100693          	li	a3,1
    7c60:	7ff00737          	lui	a4,0x7ff00
    7c64:	00d92023          	sw	a3,0(s2)
    7c68:	00e9f6b3          	and	a3,s3,a4
    7c6c:	64e68463          	beq	a3,a4,82b4 <_dtoa_r+0x6e8>
    7c70:	00012483          	lw	s1,0(sp)
    7c74:	000d8513          	mv	a0,s11
    7c78:	00000613          	li	a2,0
    7c7c:	00048593          	mv	a1,s1
    7c80:	00000693          	li	a3,0
    7c84:	01b12c23          	sw	s11,24(sp)
    7c88:	00912e23          	sw	s1,28(sp)
    7c8c:	3cc050ef          	jal	d058 <__eqdf2>
    7c90:	04051c63          	bnez	a0,7ce8 <_dtoa_r+0x11c>
    7c94:	00c12703          	lw	a4,12(sp)
    7c98:	00100793          	li	a5,1
    7c9c:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    7ca0:	00812703          	lw	a4,8(sp)
    7ca4:	00070863          	beqz	a4,7cb4 <_dtoa_r+0xe8>
    7ca8:	00007797          	auipc	a5,0x7
    7cac:	18978793          	add	a5,a5,393 # ee31 <__fini_array_end+0x285>
    7cb0:	00f72023          	sw	a5,0(a4)
    7cb4:	00007a97          	auipc	s5,0x7
    7cb8:	17ca8a93          	add	s5,s5,380 # ee30 <__fini_array_end+0x284>
    7cbc:	0ac12083          	lw	ra,172(sp)
    7cc0:	0a812403          	lw	s0,168(sp)
    7cc4:	0a412483          	lw	s1,164(sp)
    7cc8:	0a012903          	lw	s2,160(sp)
    7ccc:	09c12983          	lw	s3,156(sp)
    7cd0:	09812a03          	lw	s4,152(sp)
    7cd4:	07c12d83          	lw	s11,124(sp)
    7cd8:	000a8513          	mv	a0,s5
    7cdc:	09412a83          	lw	s5,148(sp)
    7ce0:	0b010113          	add	sp,sp,176
    7ce4:	00008067          	ret
    7ce8:	00048613          	mv	a2,s1
    7cec:	06810713          	add	a4,sp,104
    7cf0:	06c10693          	add	a3,sp,108
    7cf4:	000d8593          	mv	a1,s11
    7cf8:	00040513          	mv	a0,s0
    7cfc:	09612823          	sw	s6,144(sp)
    7d00:	09712623          	sw	s7,140(sp)
    7d04:	09812423          	sw	s8,136(sp)
    7d08:	09912223          	sw	s9,132(sp)
    7d0c:	09a12023          	sw	s10,128(sp)
    7d10:	0149d913          	srl	s2,s3,0x14
    7d14:	268020ef          	jal	9f7c <__d2b>
    7d18:	00050493          	mv	s1,a0
    7d1c:	5c091e63          	bnez	s2,82f8 <_dtoa_r+0x72c>
    7d20:	06812a83          	lw	s5,104(sp)
    7d24:	06c12903          	lw	s2,108(sp)
    7d28:	02000793          	li	a5,32
    7d2c:	012a8933          	add	s2,s5,s2
    7d30:	43290713          	add	a4,s2,1074
    7d34:	36e7dae3          	bge	a5,a4,88a8 <_dtoa_r+0xcdc>
    7d38:	04000793          	li	a5,64
    7d3c:	40e787b3          	sub	a5,a5,a4
    7d40:	41290513          	add	a0,s2,1042
    7d44:	00f997b3          	sll	a5,s3,a5
    7d48:	00add533          	srl	a0,s11,a0
    7d4c:	00a7e533          	or	a0,a5,a0
    7d50:	7c4060ef          	jal	e514 <__floatunsidf>
    7d54:	fe1007b7          	lui	a5,0xfe100
    7d58:	00100693          	li	a3,1
    7d5c:	00050713          	mv	a4,a0
    7d60:	00b787b3          	add	a5,a5,a1
    7d64:	fff90913          	add	s2,s2,-1
    7d68:	02d12c23          	sw	a3,56(sp)
    7d6c:	7fff9697          	auipc	a3,0x7fff9
    7d70:	95c68693          	add	a3,a3,-1700 # 800006c8 <__global_locale+0x194>
    7d74:	0006a603          	lw	a2,0(a3)
    7d78:	0046a683          	lw	a3,4(a3)
    7d7c:	00070513          	mv	a0,a4
    7d80:	00078593          	mv	a1,a5
    7d84:	4f9050ef          	jal	da7c <__subdf3>
    7d88:	7fff9797          	auipc	a5,0x7fff9
    7d8c:	94878793          	add	a5,a5,-1720 # 800006d0 <__global_locale+0x19c>
    7d90:	0007a603          	lw	a2,0(a5)
    7d94:	0047a683          	lw	a3,4(a5)
    7d98:	554050ef          	jal	d2ec <__muldf3>
    7d9c:	7fff9797          	auipc	a5,0x7fff9
    7da0:	93c78793          	add	a5,a5,-1732 # 800006d8 <__global_locale+0x1a4>
    7da4:	0007a603          	lw	a2,0(a5)
    7da8:	0047a683          	lw	a3,4(a5)
    7dac:	138040ef          	jal	bee4 <__adddf3>
    7db0:	00050b13          	mv	s6,a0
    7db4:	00090513          	mv	a0,s2
    7db8:	00058993          	mv	s3,a1
    7dbc:	6a0060ef          	jal	e45c <__floatsidf>
    7dc0:	7fff9797          	auipc	a5,0x7fff9
    7dc4:	92078793          	add	a5,a5,-1760 # 800006e0 <__global_locale+0x1ac>
    7dc8:	0007a603          	lw	a2,0(a5)
    7dcc:	0047a683          	lw	a3,4(a5)
    7dd0:	51c050ef          	jal	d2ec <__muldf3>
    7dd4:	00050613          	mv	a2,a0
    7dd8:	00058693          	mv	a3,a1
    7ddc:	000b0513          	mv	a0,s6
    7de0:	00098593          	mv	a1,s3
    7de4:	100040ef          	jal	bee4 <__adddf3>
    7de8:	00050b93          	mv	s7,a0
    7dec:	00058b13          	mv	s6,a1
    7df0:	5e8060ef          	jal	e3d8 <__fixdfsi>
    7df4:	00050993          	mv	s3,a0
    7df8:	000b0593          	mv	a1,s6
    7dfc:	000b8513          	mv	a0,s7
    7e00:	00000613          	li	a2,0
    7e04:	00000693          	li	a3,0
    7e08:	3dc050ef          	jal	d1e4 <__ledf2>
    7e0c:	02055063          	bgez	a0,7e2c <_dtoa_r+0x260>
    7e10:	00098513          	mv	a0,s3
    7e14:	648060ef          	jal	e45c <__floatsidf>
    7e18:	000b8613          	mv	a2,s7
    7e1c:	000b0693          	mv	a3,s6
    7e20:	238050ef          	jal	d058 <__eqdf2>
    7e24:	00a03533          	snez	a0,a0
    7e28:	40a989b3          	sub	s3,s3,a0
    7e2c:	412a8ab3          	sub	s5,s5,s2
    7e30:	01600793          	li	a5,22
    7e34:	fffa8b13          	add	s6,s5,-1
    7e38:	2137e2e3          	bltu	a5,s3,883c <_dtoa_r+0xc70>
    7e3c:	00399713          	sll	a4,s3,0x3
    7e40:	00007797          	auipc	a5,0x7
    7e44:	6a078793          	add	a5,a5,1696 # f4e0 <__mprec_tens>
    7e48:	00e787b3          	add	a5,a5,a4
    7e4c:	0007a603          	lw	a2,0(a5)
    7e50:	0047a683          	lw	a3,4(a5)
    7e54:	01812503          	lw	a0,24(sp)
    7e58:	01c12583          	lw	a1,28(sp)
    7e5c:	388050ef          	jal	d1e4 <__ledf2>
    7e60:	220554e3          	bgez	a0,8888 <_dtoa_r+0xcbc>
    7e64:	fff98993          	add	s3,s3,-1
    7e68:	02012a23          	sw	zero,52(sp)
    7e6c:	00012823          	sw	zero,16(sp)
    7e70:	4a0b4863          	bltz	s6,8320 <_dtoa_r+0x754>
    7e74:	4c09d063          	bgez	s3,8334 <_dtoa_r+0x768>
    7e78:	01012783          	lw	a5,16(sp)
    7e7c:	03312023          	sw	s3,32(sp)
    7e80:	413787b3          	sub	a5,a5,s3
    7e84:	00f12823          	sw	a5,16(sp)
    7e88:	413007b3          	neg	a5,s3
    7e8c:	02f12823          	sw	a5,48(sp)
    7e90:	00900793          	li	a5,9
    7e94:	00000993          	li	s3,0
    7e98:	4b47e863          	bltu	a5,s4,8348 <_dtoa_r+0x77c>
    7e9c:	00500793          	li	a5,5
    7ea0:	2147dae3          	bge	a5,s4,88b4 <_dtoa_r+0xce8>
    7ea4:	ffca0a13          	add	s4,s4,-4
    7ea8:	00300793          	li	a5,3
    7eac:	00000913          	li	s2,0
    7eb0:	66fa02e3          	beq	s4,a5,8d14 <_dtoa_r+0x1148>
    7eb4:	6147dae3          	bge	a5,s4,8cc8 <_dtoa_r+0x10fc>
    7eb8:	00400793          	li	a5,4
    7ebc:	54fa1ae3          	bne	s4,a5,8c10 <_dtoa_r+0x1044>
    7ec0:	00100793          	li	a5,1
    7ec4:	02f12423          	sw	a5,40(sp)
    7ec8:	01412603          	lw	a2,20(sp)
    7ecc:	62c05ce3          	blez	a2,8d04 <_dtoa_r+0x1138>
    7ed0:	02c12e23          	sw	a2,60(sp)
    7ed4:	00060c13          	mv	s8,a2
    7ed8:	01700693          	li	a3,23
    7edc:	00100713          	li	a4,1
    7ee0:	00400793          	li	a5,4
    7ee4:	00c6c463          	blt	a3,a2,7eec <_dtoa_r+0x320>
    7ee8:	3540106f          	j	923c <_dtoa_r+0x1670>
    7eec:	00179793          	sll	a5,a5,0x1
    7ef0:	01478693          	add	a3,a5,20
    7ef4:	00070593          	mv	a1,a4
    7ef8:	00170713          	add	a4,a4,1
    7efc:	fed678e3          	bgeu	a2,a3,7eec <_dtoa_r+0x320>
    7f00:	02b42e23          	sw	a1,60(s0)
    7f04:	00040513          	mv	a0,s0
    7f08:	3b0010ef          	jal	92b8 <_Balloc>
    7f0c:	00050a93          	mv	s5,a0
    7f10:	00051463          	bnez	a0,7f18 <_dtoa_r+0x34c>
    7f14:	30c0106f          	j	9220 <_dtoa_r+0x1654>
    7f18:	02a42c23          	sw	a0,56(s0)
    7f1c:	00e00793          	li	a5,14
    7f20:	5187ea63          	bltu	a5,s8,8434 <_dtoa_r+0x868>
    7f24:	50090863          	beqz	s2,8434 <_dtoa_r+0x868>
    7f28:	02012783          	lw	a5,32(sp)
    7f2c:	62f054e3          	blez	a5,8d54 <_dtoa_r+0x1188>
    7f30:	00f7f713          	and	a4,a5,15
    7f34:	00371713          	sll	a4,a4,0x3
    7f38:	4047dc93          	sra	s9,a5,0x4
    7f3c:	00007797          	auipc	a5,0x7
    7f40:	5a478793          	add	a5,a5,1444 # f4e0 <__mprec_tens>
    7f44:	00e787b3          	add	a5,a5,a4
    7f48:	010cf693          	and	a3,s9,16
    7f4c:	0007a803          	lw	a6,0(a5)
    7f50:	0047a703          	lw	a4,4(a5)
    7f54:	560682e3          	beqz	a3,8cb8 <_dtoa_r+0x10ec>
    7f58:	00007797          	auipc	a5,0x7
    7f5c:	56078793          	add	a5,a5,1376 # f4b8 <__mprec_bigtens>
    7f60:	0207a603          	lw	a2,32(a5)
    7f64:	0247a683          	lw	a3,36(a5)
    7f68:	01812503          	lw	a0,24(sp)
    7f6c:	01c12583          	lw	a1,28(sp)
    7f70:	04e12423          	sw	a4,72(sp)
    7f74:	05012023          	sw	a6,64(sp)
    7f78:	035040ef          	jal	c7ac <__divdf3>
    7f7c:	04012803          	lw	a6,64(sp)
    7f80:	04812703          	lw	a4,72(sp)
    7f84:	00fcfc93          	and	s9,s9,15
    7f88:	00050313          	mv	t1,a0
    7f8c:	00058d13          	mv	s10,a1
    7f90:	00300913          	li	s2,3
    7f94:	040c8c63          	beqz	s9,7fec <_dtoa_r+0x420>
    7f98:	04812023          	sw	s0,64(sp)
    7f9c:	00007b97          	auipc	s7,0x7
    7fa0:	51cb8b93          	add	s7,s7,1308 # f4b8 <__mprec_bigtens>
    7fa4:	00090413          	mv	s0,s2
    7fa8:	00070593          	mv	a1,a4
    7fac:	00030913          	mv	s2,t1
    7fb0:	001cf793          	and	a5,s9,1
    7fb4:	00078e63          	beqz	a5,7fd0 <_dtoa_r+0x404>
    7fb8:	000ba603          	lw	a2,0(s7)
    7fbc:	004ba683          	lw	a3,4(s7)
    7fc0:	00080513          	mv	a0,a6
    7fc4:	00140413          	add	s0,s0,1
    7fc8:	324050ef          	jal	d2ec <__muldf3>
    7fcc:	00050813          	mv	a6,a0
    7fd0:	401cdc93          	sra	s9,s9,0x1
    7fd4:	008b8b93          	add	s7,s7,8
    7fd8:	fc0c9ce3          	bnez	s9,7fb0 <_dtoa_r+0x3e4>
    7fdc:	00090313          	mv	t1,s2
    7fe0:	00040913          	mv	s2,s0
    7fe4:	04012403          	lw	s0,64(sp)
    7fe8:	00058713          	mv	a4,a1
    7fec:	00070693          	mv	a3,a4
    7ff0:	00080613          	mv	a2,a6
    7ff4:	00030513          	mv	a0,t1
    7ff8:	000d0593          	mv	a1,s10
    7ffc:	7b0040ef          	jal	c7ac <__divdf3>
    8000:	00050713          	mv	a4,a0
    8004:	00058793          	mv	a5,a1
    8008:	03412683          	lw	a3,52(sp)
    800c:	02068c63          	beqz	a3,8044 <_dtoa_r+0x478>
    8010:	7fff8697          	auipc	a3,0x7fff8
    8014:	6d868693          	add	a3,a3,1752 # 800006e8 <__global_locale+0x1b4>
    8018:	0006a603          	lw	a2,0(a3)
    801c:	0046a683          	lw	a3,4(a3)
    8020:	00070513          	mv	a0,a4
    8024:	00078593          	mv	a1,a5
    8028:	04e12423          	sw	a4,72(sp)
    802c:	04f12023          	sw	a5,64(sp)
    8030:	1b4050ef          	jal	d1e4 <__ledf2>
    8034:	04012783          	lw	a5,64(sp)
    8038:	04812703          	lw	a4,72(sp)
    803c:	00055463          	bgez	a0,8044 <_dtoa_r+0x478>
    8040:	04c0106f          	j	908c <_dtoa_r+0x14c0>
    8044:	00090513          	mv	a0,s2
    8048:	04f12623          	sw	a5,76(sp)
    804c:	04e12023          	sw	a4,64(sp)
    8050:	40c060ef          	jal	e45c <__floatsidf>
    8054:	04012703          	lw	a4,64(sp)
    8058:	04c12783          	lw	a5,76(sp)
    805c:	00070613          	mv	a2,a4
    8060:	00078693          	mv	a3,a5
    8064:	04e12423          	sw	a4,72(sp)
    8068:	04f12023          	sw	a5,64(sp)
    806c:	280050ef          	jal	d2ec <__muldf3>
    8070:	7fff8697          	auipc	a3,0x7fff8
    8074:	68868693          	add	a3,a3,1672 # 800006f8 <__global_locale+0x1c4>
    8078:	0006a603          	lw	a2,0(a3)
    807c:	0046a683          	lw	a3,4(a3)
    8080:	665030ef          	jal	bee4 <__adddf3>
    8084:	fcc006b7          	lui	a3,0xfcc00
    8088:	04012783          	lw	a5,64(sp)
    808c:	04812703          	lw	a4,72(sp)
    8090:	00050c93          	mv	s9,a0
    8094:	00b68bb3          	add	s7,a3,a1
    8098:	340c0463          	beqz	s8,83e0 <_dtoa_r+0x814>
    809c:	02012683          	lw	a3,32(sp)
    80a0:	05812423          	sw	s8,72(sp)
    80a4:	04d12e23          	sw	a3,92(sp)
    80a8:	00070513          	mv	a0,a4
    80ac:	00078593          	mv	a1,a5
    80b0:	04e12623          	sw	a4,76(sp)
    80b4:	04f12023          	sw	a5,64(sp)
    80b8:	320060ef          	jal	e3d8 <__fixdfsi>
    80bc:	04812783          	lw	a5,72(sp)
    80c0:	00050913          	mv	s2,a0
    80c4:	05912c23          	sw	s9,88(sp)
    80c8:	fff78693          	add	a3,a5,-1
    80cc:	00369693          	sll	a3,a3,0x3
    80d0:	00007797          	auipc	a5,0x7
    80d4:	41078793          	add	a5,a5,1040 # f4e0 <__mprec_tens>
    80d8:	00d786b3          	add	a3,a5,a3
    80dc:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    80e0:	0046a803          	lw	a6,4(a3)
    80e4:	001a8d13          	add	s10,s5,1
    80e8:	04f12823          	sw	a5,80(sp)
    80ec:	05012a23          	sw	a6,84(sp)
    80f0:	36c060ef          	jal	e45c <__floatsidf>
    80f4:	04c12703          	lw	a4,76(sp)
    80f8:	04012783          	lw	a5,64(sp)
    80fc:	00050613          	mv	a2,a0
    8100:	00058693          	mv	a3,a1
    8104:	00070513          	mv	a0,a4
    8108:	00078593          	mv	a1,a5
    810c:	171050ef          	jal	da7c <__subdf3>
    8110:	02812703          	lw	a4,40(sp)
    8114:	03090313          	add	t1,s2,48
    8118:	05a12023          	sw	s10,64(sp)
    811c:	00050c93          	mv	s9,a0
    8120:	0ff37313          	zext.b	t1,t1
    8124:	5c0706e3          	beqz	a4,8ef0 <_dtoa_r+0x1324>
    8128:	7fff8797          	auipc	a5,0x7fff8
    812c:	59078793          	add	a5,a5,1424 # 800006b8 <__global_locale+0x184>
    8130:	0007a503          	lw	a0,0(a5)
    8134:	05012603          	lw	a2,80(sp)
    8138:	05412683          	lw	a3,84(sp)
    813c:	04b12023          	sw	a1,64(sp)
    8140:	0047a583          	lw	a1,4(a5)
    8144:	04612623          	sw	t1,76(sp)
    8148:	664040ef          	jal	c7ac <__divdf3>
    814c:	05812603          	lw	a2,88(sp)
    8150:	000b8693          	mv	a3,s7
    8154:	129050ef          	jal	da7c <__subdf3>
    8158:	04012883          	lw	a7,64(sp)
    815c:	04c12303          	lw	t1,76(sp)
    8160:	000c8613          	mv	a2,s9
    8164:	00088693          	mv	a3,a7
    8168:	006a8023          	sb	t1,0(s5)
    816c:	00050913          	mv	s2,a0
    8170:	00058b93          	mv	s7,a1
    8174:	771040ef          	jal	d0e4 <__gedf2>
    8178:	04012883          	lw	a7,64(sp)
    817c:	00a05463          	blez	a0,8184 <_dtoa_r+0x5b8>
    8180:	7c90006f          	j	9148 <_dtoa_r+0x157c>
    8184:	7fff8697          	auipc	a3,0x7fff8
    8188:	56468693          	add	a3,a3,1380 # 800006e8 <__global_locale+0x1b4>
    818c:	0006a783          	lw	a5,0(a3)
    8190:	0046a803          	lw	a6,4(a3)
    8194:	05312623          	sw	s3,76(sp)
    8198:	04f12023          	sw	a5,64(sp)
    819c:	00000793          	li	a5,0
    81a0:	05612823          	sw	s6,80(sp)
    81a4:	05812c23          	sw	s8,88(sp)
    81a8:	05012223          	sw	a6,68(sp)
    81ac:	04812c03          	lw	s8,72(sp)
    81b0:	00078b13          	mv	s6,a5
    81b4:	05412423          	sw	s4,72(sp)
    81b8:	00088993          	mv	s3,a7
    81bc:	0980006f          	j	8254 <_dtoa_r+0x688>
    81c0:	001b0b13          	add	s6,s6,1
    81c4:	018b4463          	blt	s6,s8,81cc <_dtoa_r+0x600>
    81c8:	7d10006f          	j	9198 <_dtoa_r+0x15cc>
    81cc:	7fff8a17          	auipc	s4,0x7fff8
    81d0:	524a0a13          	add	s4,s4,1316 # 800006f0 <__global_locale+0x1bc>
    81d4:	000a2603          	lw	a2,0(s4)
    81d8:	004a2683          	lw	a3,4(s4)
    81dc:	00090513          	mv	a0,s2
    81e0:	000b8593          	mv	a1,s7
    81e4:	108050ef          	jal	d2ec <__muldf3>
    81e8:	000a2603          	lw	a2,0(s4)
    81ec:	004a2683          	lw	a3,4(s4)
    81f0:	00050913          	mv	s2,a0
    81f4:	00058b93          	mv	s7,a1
    81f8:	000c8513          	mv	a0,s9
    81fc:	00098593          	mv	a1,s3
    8200:	0ec050ef          	jal	d2ec <__muldf3>
    8204:	00058c93          	mv	s9,a1
    8208:	00050a13          	mv	s4,a0
    820c:	1cc060ef          	jal	e3d8 <__fixdfsi>
    8210:	00050993          	mv	s3,a0
    8214:	248060ef          	jal	e45c <__floatsidf>
    8218:	00050613          	mv	a2,a0
    821c:	00058693          	mv	a3,a1
    8220:	000a0513          	mv	a0,s4
    8224:	000c8593          	mv	a1,s9
    8228:	055050ef          	jal	da7c <__subdf3>
    822c:	03098793          	add	a5,s3,48
    8230:	00090613          	mv	a2,s2
    8234:	000b8693          	mv	a3,s7
    8238:	00fd0023          	sb	a5,0(s10)
    823c:	001d0d13          	add	s10,s10,1
    8240:	00050c93          	mv	s9,a0
    8244:	00058993          	mv	s3,a1
    8248:	79d040ef          	jal	d1e4 <__ledf2>
    824c:	00055463          	bgez	a0,8254 <_dtoa_r+0x688>
    8250:	6f90006f          	j	9148 <_dtoa_r+0x157c>
    8254:	04012503          	lw	a0,64(sp)
    8258:	04412583          	lw	a1,68(sp)
    825c:	000c8613          	mv	a2,s9
    8260:	00098693          	mv	a3,s3
    8264:	019050ef          	jal	da7c <__subdf3>
    8268:	00090613          	mv	a2,s2
    826c:	000b8693          	mv	a3,s7
    8270:	775040ef          	jal	d1e4 <__ledf2>
    8274:	f40556e3          	bgez	a0,81c0 <_dtoa_r+0x5f4>
    8278:	05c12783          	lw	a5,92(sp)
    827c:	000d0b93          	mv	s7,s10
    8280:	00178c13          	add	s8,a5,1
    8284:	03900613          	li	a2,57
    8288:	0080006f          	j	8290 <_dtoa_r+0x6c4>
    828c:	697a88e3          	beq	s5,s7,911c <_dtoa_r+0x1550>
    8290:	fffbc683          	lbu	a3,-1(s7)
    8294:	000b8d13          	mv	s10,s7
    8298:	fffb8b93          	add	s7,s7,-1
    829c:	fec688e3          	beq	a3,a2,828c <_dtoa_r+0x6c0>
    82a0:	00168693          	add	a3,a3,1
    82a4:	0ff6f693          	zext.b	a3,a3
    82a8:	00db8023          	sb	a3,0(s7)
    82ac:	000c0a13          	mv	s4,s8
    82b0:	4f00006f          	j	87a0 <_dtoa_r+0xbd4>
    82b4:	00c12683          	lw	a3,12(sp)
    82b8:	00002737          	lui	a4,0x2
    82bc:	00c99793          	sll	a5,s3,0xc
    82c0:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0xab7>
    82c4:	00c7d793          	srl	a5,a5,0xc
    82c8:	00e6a023          	sw	a4,0(a3)
    82cc:	01b7e7b3          	or	a5,a5,s11
    82d0:	0a078063          	beqz	a5,8370 <_dtoa_r+0x7a4>
    82d4:	00812783          	lw	a5,8(sp)
    82d8:	00007a97          	auipc	s5,0x7
    82dc:	bb0a8a93          	add	s5,s5,-1104 # ee88 <__fini_array_end+0x2dc>
    82e0:	9c078ee3          	beqz	a5,7cbc <_dtoa_r+0xf0>
    82e4:	00007797          	auipc	a5,0x7
    82e8:	ba778793          	add	a5,a5,-1113 # ee8b <__fini_array_end+0x2df>
    82ec:	00812703          	lw	a4,8(sp)
    82f0:	00f72023          	sw	a5,0(a4)
    82f4:	9c9ff06f          	j	7cbc <_dtoa_r+0xf0>
    82f8:	01c12783          	lw	a5,28(sp)
    82fc:	3ff006b7          	lui	a3,0x3ff00
    8300:	06812a83          	lw	s5,104(sp)
    8304:	00c79793          	sll	a5,a5,0xc
    8308:	00c7d793          	srl	a5,a5,0xc
    830c:	01812703          	lw	a4,24(sp)
    8310:	00d7e7b3          	or	a5,a5,a3
    8314:	c0190913          	add	s2,s2,-1023
    8318:	02012c23          	sw	zero,56(sp)
    831c:	a51ff06f          	j	7d6c <_dtoa_r+0x1a0>
    8320:	00100793          	li	a5,1
    8324:	415787b3          	sub	a5,a5,s5
    8328:	00f12823          	sw	a5,16(sp)
    832c:	00000b13          	li	s6,0
    8330:	b409c4e3          	bltz	s3,7e78 <_dtoa_r+0x2ac>
    8334:	03312023          	sw	s3,32(sp)
    8338:	02012823          	sw	zero,48(sp)
    833c:	00900793          	li	a5,9
    8340:	013b0b33          	add	s6,s6,s3
    8344:	b547fce3          	bgeu	a5,s4,7e9c <_dtoa_r+0x2d0>
    8348:	00100793          	li	a5,1
    834c:	00100913          	li	s2,1
    8350:	00000a13          	li	s4,0
    8354:	02f12423          	sw	a5,40(sp)
    8358:	fff00c13          	li	s8,-1
    835c:	00012a23          	sw	zero,20(sp)
    8360:	02042e23          	sw	zero,60(s0)
    8364:	03812e23          	sw	s8,60(sp)
    8368:	00000593          	li	a1,0
    836c:	b99ff06f          	j	7f04 <_dtoa_r+0x338>
    8370:	00812703          	lw	a4,8(sp)
    8374:	00007a97          	auipc	s5,0x7
    8378:	b08a8a93          	add	s5,s5,-1272 # ee7c <__fini_array_end+0x2d0>
    837c:	00007797          	auipc	a5,0x7
    8380:	b0878793          	add	a5,a5,-1272 # ee84 <__fini_array_end+0x2d8>
    8384:	f60714e3          	bnez	a4,82ec <_dtoa_r+0x720>
    8388:	935ff06f          	j	7cbc <_dtoa_r+0xf0>
    838c:	00090513          	mv	a0,s2
    8390:	04f12623          	sw	a5,76(sp)
    8394:	04e12023          	sw	a4,64(sp)
    8398:	0c4060ef          	jal	e45c <__floatsidf>
    839c:	04012703          	lw	a4,64(sp)
    83a0:	04c12783          	lw	a5,76(sp)
    83a4:	00070613          	mv	a2,a4
    83a8:	00078693          	mv	a3,a5
    83ac:	04e12423          	sw	a4,72(sp)
    83b0:	04f12023          	sw	a5,64(sp)
    83b4:	739040ef          	jal	d2ec <__muldf3>
    83b8:	7fff8697          	auipc	a3,0x7fff8
    83bc:	34068693          	add	a3,a3,832 # 800006f8 <__global_locale+0x1c4>
    83c0:	0006a603          	lw	a2,0(a3)
    83c4:	0046a683          	lw	a3,4(a3)
    83c8:	31d030ef          	jal	bee4 <__adddf3>
    83cc:	04012783          	lw	a5,64(sp)
    83d0:	04812703          	lw	a4,72(sp)
    83d4:	fcc006b7          	lui	a3,0xfcc00
    83d8:	00050c93          	mv	s9,a0
    83dc:	00b68bb3          	add	s7,a3,a1
    83e0:	7fff8697          	auipc	a3,0x7fff8
    83e4:	32068693          	add	a3,a3,800 # 80000700 <__global_locale+0x1cc>
    83e8:	0006a603          	lw	a2,0(a3)
    83ec:	0046a683          	lw	a3,4(a3)
    83f0:	00070513          	mv	a0,a4
    83f4:	00078593          	mv	a1,a5
    83f8:	684050ef          	jal	da7c <__subdf3>
    83fc:	000c8613          	mv	a2,s9
    8400:	000b8693          	mv	a3,s7
    8404:	00050d13          	mv	s10,a0
    8408:	00058913          	mv	s2,a1
    840c:	4d9040ef          	jal	d0e4 <__gedf2>
    8410:	50a04ce3          	bgtz	a0,9128 <_dtoa_r+0x155c>
    8414:	800007b7          	lui	a5,0x80000
    8418:	0177c7b3          	xor	a5,a5,s7
    841c:	000c8613          	mv	a2,s9
    8420:	000d0513          	mv	a0,s10
    8424:	00078693          	mv	a3,a5
    8428:	00090593          	mv	a1,s2
    842c:	5b9040ef          	jal	d1e4 <__ledf2>
    8430:	06054c63          	bltz	a0,84a8 <_dtoa_r+0x8dc>
    8434:	06c12783          	lw	a5,108(sp)
    8438:	1a07c663          	bltz	a5,85e4 <_dtoa_r+0xa18>
    843c:	02012683          	lw	a3,32(sp)
    8440:	00e00713          	li	a4,14
    8444:	1ad74063          	blt	a4,a3,85e4 <_dtoa_r+0xa18>
    8448:	02012783          	lw	a5,32(sp)
    844c:	00379713          	sll	a4,a5,0x3
    8450:	00007797          	auipc	a5,0x7
    8454:	09078793          	add	a5,a5,144 # f4e0 <__mprec_tens>
    8458:	00e787b3          	add	a5,a5,a4
    845c:	0007a903          	lw	s2,0(a5)
    8460:	0047a983          	lw	s3,4(a5)
    8464:	01412783          	lw	a5,20(sp)
    8468:	0407dc63          	bgez	a5,84c0 <_dtoa_r+0x8f4>
    846c:	05804a63          	bgtz	s8,84c0 <_dtoa_r+0x8f4>
    8470:	020c1c63          	bnez	s8,84a8 <_dtoa_r+0x8dc>
    8474:	7fff8797          	auipc	a5,0x7fff8
    8478:	28c78793          	add	a5,a5,652 # 80000700 <__global_locale+0x1cc>
    847c:	0007a603          	lw	a2,0(a5)
    8480:	0047a683          	lw	a3,4(a5)
    8484:	00090513          	mv	a0,s2
    8488:	00098593          	mv	a1,s3
    848c:	661040ef          	jal	d2ec <__muldf3>
    8490:	00050613          	mv	a2,a0
    8494:	00058693          	mv	a3,a1
    8498:	01812503          	lw	a0,24(sp)
    849c:	01c12583          	lw	a1,28(sp)
    84a0:	545040ef          	jal	d1e4 <__ledf2>
    84a4:	48a042e3          	bgtz	a0,9128 <_dtoa_r+0x155c>
    84a8:	000a8d13          	mv	s10,s5
    84ac:	00012c23          	sw	zero,24(sp)
    84b0:	00000913          	li	s2,0
    84b4:	01412783          	lw	a5,20(sp)
    84b8:	fff7ca13          	not	s4,a5
    84bc:	6980006f          	j	8b54 <_dtoa_r+0xf88>
    84c0:	001a8793          	add	a5,s5,1
    84c4:	04f12023          	sw	a5,64(sp)
    84c8:	01812b03          	lw	s6,24(sp)
    84cc:	01c12a03          	lw	s4,28(sp)
    84d0:	00090613          	mv	a2,s2
    84d4:	00098693          	mv	a3,s3
    84d8:	000b0513          	mv	a0,s6
    84dc:	000a0593          	mv	a1,s4
    84e0:	2cc040ef          	jal	c7ac <__divdf3>
    84e4:	6f5050ef          	jal	e3d8 <__fixdfsi>
    84e8:	00050d13          	mv	s10,a0
    84ec:	771050ef          	jal	e45c <__floatsidf>
    84f0:	00090613          	mv	a2,s2
    84f4:	00098693          	mv	a3,s3
    84f8:	5f5040ef          	jal	d2ec <__muldf3>
    84fc:	00050613          	mv	a2,a0
    8500:	00058693          	mv	a3,a1
    8504:	000b0513          	mv	a0,s6
    8508:	000a0593          	mv	a1,s4
    850c:	570050ef          	jal	da7c <__subdf3>
    8510:	030d0793          	add	a5,s10,48
    8514:	00fa8023          	sb	a5,0(s5)
    8518:	00100613          	li	a2,1
    851c:	04012b83          	lw	s7,64(sp)
    8520:	00050713          	mv	a4,a0
    8524:	00058693          	mv	a3,a1
    8528:	0ccc0ee3          	beq	s8,a2,8e04 <_dtoa_r+0x1238>
    852c:	7fff8617          	auipc	a2,0x7fff8
    8530:	1c460613          	add	a2,a2,452 # 800006f0 <__global_locale+0x1bc>
    8534:	00062783          	lw	a5,0(a2)
    8538:	00462803          	lw	a6,4(a2)
    853c:	00100d93          	li	s11,1
    8540:	00f12023          	sw	a5,0(sp)
    8544:	01012223          	sw	a6,4(sp)
    8548:	0600006f          	j	85a8 <_dtoa_r+0x9dc>
    854c:	00090613          	mv	a2,s2
    8550:	00098693          	mv	a3,s3
    8554:	000b0513          	mv	a0,s6
    8558:	000a0593          	mv	a1,s4
    855c:	250040ef          	jal	c7ac <__divdf3>
    8560:	679050ef          	jal	e3d8 <__fixdfsi>
    8564:	00050d13          	mv	s10,a0
    8568:	6f5050ef          	jal	e45c <__floatsidf>
    856c:	00090613          	mv	a2,s2
    8570:	00098693          	mv	a3,s3
    8574:	579040ef          	jal	d2ec <__muldf3>
    8578:	00058693          	mv	a3,a1
    857c:	00050613          	mv	a2,a0
    8580:	000a0593          	mv	a1,s4
    8584:	000b0513          	mv	a0,s6
    8588:	4f4050ef          	jal	da7c <__subdf3>
    858c:	001b8b93          	add	s7,s7,1
    8590:	030d0793          	add	a5,s10,48
    8594:	001d8d93          	add	s11,s11,1
    8598:	fefb8fa3          	sb	a5,-1(s7)
    859c:	00050713          	mv	a4,a0
    85a0:	00058693          	mv	a3,a1
    85a4:	07bc00e3          	beq	s8,s11,8e04 <_dtoa_r+0x1238>
    85a8:	00012603          	lw	a2,0(sp)
    85ac:	00068593          	mv	a1,a3
    85b0:	00412683          	lw	a3,4(sp)
    85b4:	00070513          	mv	a0,a4
    85b8:	535040ef          	jal	d2ec <__muldf3>
    85bc:	00000613          	li	a2,0
    85c0:	00000693          	li	a3,0
    85c4:	00050b13          	mv	s6,a0
    85c8:	00058a13          	mv	s4,a1
    85cc:	28d040ef          	jal	d058 <__eqdf2>
    85d0:	f6051ee3          	bnez	a0,854c <_dtoa_r+0x980>
    85d4:	02012783          	lw	a5,32(sp)
    85d8:	000b8d13          	mv	s10,s7
    85dc:	00178a13          	add	s4,a5,1
    85e0:	1c00006f          	j	87a0 <_dtoa_r+0xbd4>
    85e4:	02812703          	lw	a4,40(sp)
    85e8:	26071463          	bnez	a4,8850 <_dtoa_r+0xc84>
    85ec:	03012b83          	lw	s7,48(sp)
    85f0:	01012c83          	lw	s9,16(sp)
    85f4:	02012423          	sw	zero,40(sp)
    85f8:	00000913          	li	s2,0
    85fc:	020c8263          	beqz	s9,8620 <_dtoa_r+0xa54>
    8600:	03605063          	blez	s6,8620 <_dtoa_r+0xa54>
    8604:	000c8793          	mv	a5,s9
    8608:	679b4263          	blt	s6,s9,8c6c <_dtoa_r+0x10a0>
    860c:	01012703          	lw	a4,16(sp)
    8610:	40fc8cb3          	sub	s9,s9,a5
    8614:	40fb0b33          	sub	s6,s6,a5
    8618:	40f70733          	sub	a4,a4,a5
    861c:	00e12823          	sw	a4,16(sp)
    8620:	03012783          	lw	a5,48(sp)
    8624:	02078263          	beqz	a5,8648 <_dtoa_r+0xa7c>
    8628:	02812783          	lw	a5,40(sp)
    862c:	00078463          	beqz	a5,8634 <_dtoa_r+0xa68>
    8630:	060b9ae3          	bnez	s7,8ea4 <_dtoa_r+0x12d8>
    8634:	03012603          	lw	a2,48(sp)
    8638:	00048593          	mv	a1,s1
    863c:	00040513          	mv	a0,s0
    8640:	3a4010ef          	jal	99e4 <__pow5mult>
    8644:	00050493          	mv	s1,a0
    8648:	00100593          	li	a1,1
    864c:	00040513          	mv	a0,s0
    8650:	01c010ef          	jal	966c <__i2b>
    8654:	00a12c23          	sw	a0,24(sp)
    8658:	50099a63          	bnez	s3,8b6c <_dtoa_r+0xfa0>
    865c:	00100793          	li	a5,1
    8660:	5547da63          	bge	a5,s4,8bb4 <_dtoa_r+0xfe8>
    8664:	016787b3          	add	a5,a5,s6
    8668:	01f7f793          	and	a5,a5,31
    866c:	1c078e63          	beqz	a5,8848 <_dtoa_r+0xc7c>
    8670:	02000713          	li	a4,32
    8674:	40f70733          	sub	a4,a4,a5
    8678:	00400693          	li	a3,4
    867c:	58e6d263          	bge	a3,a4,8c00 <_dtoa_r+0x1034>
    8680:	01c00713          	li	a4,28
    8684:	40f707b3          	sub	a5,a4,a5
    8688:	01012703          	lw	a4,16(sp)
    868c:	00fc8cb3          	add	s9,s9,a5
    8690:	00fb0b33          	add	s6,s6,a5
    8694:	00f70733          	add	a4,a4,a5
    8698:	00e12823          	sw	a4,16(sp)
    869c:	01012783          	lw	a5,16(sp)
    86a0:	12f04e63          	bgtz	a5,87dc <_dtoa_r+0xc10>
    86a4:	01605c63          	blez	s6,86bc <_dtoa_r+0xaf0>
    86a8:	01812583          	lw	a1,24(sp)
    86ac:	000b0613          	mv	a2,s6
    86b0:	00040513          	mv	a0,s0
    86b4:	480010ef          	jal	9b34 <__lshift>
    86b8:	00a12c23          	sw	a0,24(sp)
    86bc:	03412783          	lw	a5,52(sp)
    86c0:	12079a63          	bnez	a5,87f4 <_dtoa_r+0xc28>
    86c4:	45805263          	blez	s8,8b08 <_dtoa_r+0xf3c>
    86c8:	02812783          	lw	a5,40(sp)
    86cc:	24079e63          	bnez	a5,8928 <_dtoa_r+0xd5c>
    86d0:	02012783          	lw	a5,32(sp)
    86d4:	00178a13          	add	s4,a5,1
    86d8:	01812b03          	lw	s6,24(sp)
    86dc:	00100993          	li	s3,1
    86e0:	0200006f          	j	8700 <_dtoa_r+0xb34>
    86e4:	00048593          	mv	a1,s1
    86e8:	00000693          	li	a3,0
    86ec:	00a00613          	li	a2,10
    86f0:	00040513          	mv	a0,s0
    86f4:	49d000ef          	jal	9390 <__multadd>
    86f8:	00050493          	mv	s1,a0
    86fc:	00198993          	add	s3,s3,1
    8700:	000b0593          	mv	a1,s6
    8704:	00048513          	mv	a0,s1
    8708:	a64ff0ef          	jal	796c <quorem>
    870c:	03050b93          	add	s7,a0,48
    8710:	013a87b3          	add	a5,s5,s3
    8714:	ff778fa3          	sb	s7,-1(a5)
    8718:	fd89c6e3          	blt	s3,s8,86e4 <_dtoa_r+0xb18>
    871c:	00100993          	li	s3,1
    8720:	55804263          	bgtz	s8,8c64 <_dtoa_r+0x1098>
    8724:	013a89b3          	add	s3,s5,s3
    8728:	00000c13          	li	s8,0
    872c:	00048593          	mv	a1,s1
    8730:	00100613          	li	a2,1
    8734:	00040513          	mv	a0,s0
    8738:	3fc010ef          	jal	9b34 <__lshift>
    873c:	01812583          	lw	a1,24(sp)
    8740:	00050493          	mv	s1,a0
    8744:	580010ef          	jal	9cc4 <__mcmp>
    8748:	4ea05c63          	blez	a0,8c40 <_dtoa_r+0x1074>
    874c:	03900693          	li	a3,57
    8750:	0080006f          	j	8758 <_dtoa_r+0xb8c>
    8754:	5f3a8863          	beq	s5,s3,8d44 <_dtoa_r+0x1178>
    8758:	fff9c783          	lbu	a5,-1(s3)
    875c:	00098d13          	mv	s10,s3
    8760:	fff98993          	add	s3,s3,-1
    8764:	fed788e3          	beq	a5,a3,8754 <_dtoa_r+0xb88>
    8768:	00178793          	add	a5,a5,1
    876c:	00f98023          	sb	a5,0(s3)
    8770:	01812583          	lw	a1,24(sp)
    8774:	00040513          	mv	a0,s0
    8778:	3f5000ef          	jal	936c <_Bfree>
    877c:	02090263          	beqz	s2,87a0 <_dtoa_r+0xbd4>
    8780:	000c0a63          	beqz	s8,8794 <_dtoa_r+0xbc8>
    8784:	012c0863          	beq	s8,s2,8794 <_dtoa_r+0xbc8>
    8788:	000c0593          	mv	a1,s8
    878c:	00040513          	mv	a0,s0
    8790:	3dd000ef          	jal	936c <_Bfree>
    8794:	00090593          	mv	a1,s2
    8798:	00040513          	mv	a0,s0
    879c:	3d1000ef          	jal	936c <_Bfree>
    87a0:	00048593          	mv	a1,s1
    87a4:	00040513          	mv	a0,s0
    87a8:	3c5000ef          	jal	936c <_Bfree>
    87ac:	00c12783          	lw	a5,12(sp)
    87b0:	000d0023          	sb	zero,0(s10)
    87b4:	0147a023          	sw	s4,0(a5)
    87b8:	00812783          	lw	a5,8(sp)
    87bc:	00078463          	beqz	a5,87c4 <_dtoa_r+0xbf8>
    87c0:	01a7a023          	sw	s10,0(a5)
    87c4:	09012b03          	lw	s6,144(sp)
    87c8:	08c12b83          	lw	s7,140(sp)
    87cc:	08812c03          	lw	s8,136(sp)
    87d0:	08412c83          	lw	s9,132(sp)
    87d4:	08012d03          	lw	s10,128(sp)
    87d8:	ce4ff06f          	j	7cbc <_dtoa_r+0xf0>
    87dc:	00048593          	mv	a1,s1
    87e0:	00078613          	mv	a2,a5
    87e4:	00040513          	mv	a0,s0
    87e8:	34c010ef          	jal	9b34 <__lshift>
    87ec:	00050493          	mv	s1,a0
    87f0:	eb5ff06f          	j	86a4 <_dtoa_r+0xad8>
    87f4:	01812583          	lw	a1,24(sp)
    87f8:	00048513          	mv	a0,s1
    87fc:	4c8010ef          	jal	9cc4 <__mcmp>
    8800:	ec0552e3          	bgez	a0,86c4 <_dtoa_r+0xaf8>
    8804:	02012783          	lw	a5,32(sp)
    8808:	00048593          	mv	a1,s1
    880c:	00000693          	li	a3,0
    8810:	00a00613          	li	a2,10
    8814:	00040513          	mv	a0,s0
    8818:	fff78b13          	add	s6,a5,-1
    881c:	375000ef          	jal	9390 <__multadd>
    8820:	02812783          	lw	a5,40(sp)
    8824:	00050493          	mv	s1,a0
    8828:	0c079e63          	bnez	a5,8904 <_dtoa_r+0xd38>
    882c:	03c12c03          	lw	s8,60(sp)
    8830:	17805ee3          	blez	s8,91ac <_dtoa_r+0x15e0>
    8834:	02012a03          	lw	s4,32(sp)
    8838:	ea1ff06f          	j	86d8 <_dtoa_r+0xb0c>
    883c:	00100793          	li	a5,1
    8840:	02f12a23          	sw	a5,52(sp)
    8844:	e28ff06f          	j	7e6c <_dtoa_r+0x2a0>
    8848:	01c00793          	li	a5,28
    884c:	e3dff06f          	j	8688 <_dtoa_r+0xabc>
    8850:	00100713          	li	a4,1
    8854:	4d475463          	bge	a4,s4,8d1c <_dtoa_r+0x1150>
    8858:	03012783          	lw	a5,48(sp)
    885c:	fffc0b93          	add	s7,s8,-1
    8860:	4177ca63          	blt	a5,s7,8c74 <_dtoa_r+0x10a8>
    8864:	41778bb3          	sub	s7,a5,s7
    8868:	01012783          	lw	a5,16(sp)
    886c:	41878cb3          	sub	s9,a5,s8
    8870:	100c54e3          	bgez	s8,9178 <_dtoa_r+0x15ac>
    8874:	00100593          	li	a1,1
    8878:	00040513          	mv	a0,s0
    887c:	5f1000ef          	jal	966c <__i2b>
    8880:	00050913          	mv	s2,a0
    8884:	d79ff06f          	j	85fc <_dtoa_r+0xa30>
    8888:	02012a23          	sw	zero,52(sp)
    888c:	00012823          	sw	zero,16(sp)
    8890:	ab5042e3          	bgtz	s5,8334 <_dtoa_r+0x768>
    8894:	00100793          	li	a5,1
    8898:	415787b3          	sub	a5,a5,s5
    889c:	00f12823          	sw	a5,16(sp)
    88a0:	00000b13          	li	s6,0
    88a4:	a91ff06f          	j	8334 <_dtoa_r+0x768>
    88a8:	40e787b3          	sub	a5,a5,a4
    88ac:	00fd9533          	sll	a0,s11,a5
    88b0:	ca0ff06f          	j	7d50 <_dtoa_r+0x184>
    88b4:	00300793          	li	a5,3
    88b8:	00100913          	li	s2,1
    88bc:	44fa0c63          	beq	s4,a5,8d14 <_dtoa_r+0x1148>
    88c0:	df47cc63          	blt	a5,s4,7eb8 <_dtoa_r+0x2ec>
    88c4:	00200793          	li	a5,2
    88c8:	18fa00e3          	beq	s4,a5,9248 <_dtoa_r+0x167c>
    88cc:	02042e23          	sw	zero,60(s0)
    88d0:	00000593          	li	a1,0
    88d4:	00040513          	mv	a0,s0
    88d8:	1e1000ef          	jal	92b8 <_Balloc>
    88dc:	00050a93          	mv	s5,a0
    88e0:	140500e3          	beqz	a0,9220 <_dtoa_r+0x1654>
    88e4:	00100793          	li	a5,1
    88e8:	02f12423          	sw	a5,40(sp)
    88ec:	fff00793          	li	a5,-1
    88f0:	02a42c23          	sw	a0,56(s0)
    88f4:	02f12e23          	sw	a5,60(sp)
    88f8:	fff00c13          	li	s8,-1
    88fc:	00012a23          	sw	zero,20(sp)
    8900:	b35ff06f          	j	8434 <_dtoa_r+0x868>
    8904:	00090593          	mv	a1,s2
    8908:	00000693          	li	a3,0
    890c:	00a00613          	li	a2,10
    8910:	00040513          	mv	a0,s0
    8914:	27d000ef          	jal	9390 <__multadd>
    8918:	03c12c03          	lw	s8,60(sp)
    891c:	00050913          	mv	s2,a0
    8920:	0b805ae3          	blez	s8,91d4 <_dtoa_r+0x1608>
    8924:	03612023          	sw	s6,32(sp)
    8928:	01905c63          	blez	s9,8940 <_dtoa_r+0xd74>
    892c:	00090593          	mv	a1,s2
    8930:	000c8613          	mv	a2,s9
    8934:	00040513          	mv	a0,s0
    8938:	1fc010ef          	jal	9b34 <__lshift>
    893c:	00050913          	mv	s2,a0
    8940:	00090b13          	mv	s6,s2
    8944:	50099e63          	bnez	s3,8e60 <_dtoa_r+0x1294>
    8948:	02412783          	lw	a5,36(sp)
    894c:	fffa8d13          	add	s10,s5,-1
    8950:	000a8c93          	mv	s9,s5
    8954:	01512823          	sw	s5,16(sp)
    8958:	01812a83          	lw	s5,24(sp)
    895c:	0017f793          	and	a5,a5,1
    8960:	018d0d33          	add	s10,s10,s8
    8964:	00f12023          	sw	a5,0(sp)
    8968:	01b12a23          	sw	s11,20(sp)
    896c:	000a8593          	mv	a1,s5
    8970:	00048513          	mv	a0,s1
    8974:	ff9fe0ef          	jal	796c <quorem>
    8978:	00050c13          	mv	s8,a0
    897c:	00090593          	mv	a1,s2
    8980:	00048513          	mv	a0,s1
    8984:	340010ef          	jal	9cc4 <__mcmp>
    8988:	00050993          	mv	s3,a0
    898c:	000b0613          	mv	a2,s6
    8990:	000a8593          	mv	a1,s5
    8994:	00040513          	mv	a0,s0
    8998:	384010ef          	jal	9d1c <__mdiff>
    899c:	00c52703          	lw	a4,12(a0)
    89a0:	030c0b93          	add	s7,s8,48
    89a4:	00050d93          	mv	s11,a0
    89a8:	08071c63          	bnez	a4,8a40 <_dtoa_r+0xe74>
    89ac:	00050593          	mv	a1,a0
    89b0:	00048513          	mv	a0,s1
    89b4:	310010ef          	jal	9cc4 <__mcmp>
    89b8:	00050713          	mv	a4,a0
    89bc:	000d8593          	mv	a1,s11
    89c0:	00040513          	mv	a0,s0
    89c4:	00070d93          	mv	s11,a4
    89c8:	1a5000ef          	jal	936c <_Bfree>
    89cc:	014de6b3          	or	a3,s11,s4
    89d0:	0e069a63          	bnez	a3,8ac4 <_dtoa_r+0xef8>
    89d4:	00012783          	lw	a5,0(sp)
    89d8:	76078e63          	beqz	a5,9154 <_dtoa_r+0x1588>
    89dc:	7809c663          	bltz	s3,9168 <_dtoa_r+0x159c>
    89e0:	017c8023          	sb	s7,0(s9)
    89e4:	001c8993          	add	s3,s9,1
    89e8:	679d0e63          	beq	s10,s9,9064 <_dtoa_r+0x1498>
    89ec:	00048593          	mv	a1,s1
    89f0:	00000693          	li	a3,0
    89f4:	00a00613          	li	a2,10
    89f8:	00040513          	mv	a0,s0
    89fc:	195000ef          	jal	9390 <__multadd>
    8a00:	00050493          	mv	s1,a0
    8a04:	00000693          	li	a3,0
    8a08:	00a00613          	li	a2,10
    8a0c:	00090593          	mv	a1,s2
    8a10:	00040513          	mv	a0,s0
    8a14:	09690e63          	beq	s2,s6,8ab0 <_dtoa_r+0xee4>
    8a18:	179000ef          	jal	9390 <__multadd>
    8a1c:	000b0593          	mv	a1,s6
    8a20:	00050913          	mv	s2,a0
    8a24:	00000693          	li	a3,0
    8a28:	00a00613          	li	a2,10
    8a2c:	00040513          	mv	a0,s0
    8a30:	161000ef          	jal	9390 <__multadd>
    8a34:	00050b13          	mv	s6,a0
    8a38:	00098c93          	mv	s9,s3
    8a3c:	f31ff06f          	j	896c <_dtoa_r+0xda0>
    8a40:	00050593          	mv	a1,a0
    8a44:	00040513          	mv	a0,s0
    8a48:	01012a83          	lw	s5,16(sp)
    8a4c:	01412d83          	lw	s11,20(sp)
    8a50:	11d000ef          	jal	936c <_Bfree>
    8a54:	0009ca63          	bltz	s3,8a68 <_dtoa_r+0xe9c>
    8a58:	001df713          	and	a4,s11,1
    8a5c:	0149e9b3          	or	s3,s3,s4
    8a60:	01376733          	or	a4,a4,s3
    8a64:	06071e63          	bnez	a4,8ae0 <_dtoa_r+0xf14>
    8a68:	00048593          	mv	a1,s1
    8a6c:	00100613          	li	a2,1
    8a70:	00040513          	mv	a0,s0
    8a74:	0c0010ef          	jal	9b34 <__lshift>
    8a78:	01812583          	lw	a1,24(sp)
    8a7c:	00050493          	mv	s1,a0
    8a80:	244010ef          	jal	9cc4 <__mcmp>
    8a84:	24a05863          	blez	a0,8cd4 <_dtoa_r+0x1108>
    8a88:	03900713          	li	a4,57
    8a8c:	24eb8c63          	beq	s7,a4,8ce4 <_dtoa_r+0x1118>
    8a90:	031c0b93          	add	s7,s8,49
    8a94:	02012783          	lw	a5,32(sp)
    8a98:	00090c13          	mv	s8,s2
    8a9c:	001c8d13          	add	s10,s9,1
    8aa0:	017c8023          	sb	s7,0(s9)
    8aa4:	00178a13          	add	s4,a5,1
    8aa8:	000b0913          	mv	s2,s6
    8aac:	cc5ff06f          	j	8770 <_dtoa_r+0xba4>
    8ab0:	0e1000ef          	jal	9390 <__multadd>
    8ab4:	00050913          	mv	s2,a0
    8ab8:	00050b13          	mv	s6,a0
    8abc:	00098c93          	mv	s9,s3
    8ac0:	eadff06f          	j	896c <_dtoa_r+0xda0>
    8ac4:	7409c863          	bltz	s3,9214 <_dtoa_r+0x1648>
    8ac8:	00012783          	lw	a5,0(sp)
    8acc:	0149e9b3          	or	s3,s3,s4
    8ad0:	0137e9b3          	or	s3,a5,s3
    8ad4:	74098063          	beqz	s3,9214 <_dtoa_r+0x1648>
    8ad8:	f1b054e3          	blez	s11,89e0 <_dtoa_r+0xe14>
    8adc:	01012a83          	lw	s5,16(sp)
    8ae0:	03900713          	li	a4,57
    8ae4:	20eb8063          	beq	s7,a4,8ce4 <_dtoa_r+0x1118>
    8ae8:	02012703          	lw	a4,32(sp)
    8aec:	001b8793          	add	a5,s7,1
    8af0:	00090c13          	mv	s8,s2
    8af4:	001c8d13          	add	s10,s9,1
    8af8:	00170a13          	add	s4,a4,1
    8afc:	00fc8023          	sb	a5,0(s9)
    8b00:	000b0913          	mv	s2,s6
    8b04:	c6dff06f          	j	8770 <_dtoa_r+0xba4>
    8b08:	00200793          	li	a5,2
    8b0c:	bb47dee3          	bge	a5,s4,86c8 <_dtoa_r+0xafc>
    8b10:	000a8d13          	mv	s10,s5
    8b14:	9a0c10e3          	bnez	s8,84b4 <_dtoa_r+0x8e8>
    8b18:	01812583          	lw	a1,24(sp)
    8b1c:	00000693          	li	a3,0
    8b20:	00500613          	li	a2,5
    8b24:	00040513          	mv	a0,s0
    8b28:	069000ef          	jal	9390 <__multadd>
    8b2c:	00050593          	mv	a1,a0
    8b30:	00a12c23          	sw	a0,24(sp)
    8b34:	00048513          	mv	a0,s1
    8b38:	18c010ef          	jal	9cc4 <__mcmp>
    8b3c:	96a05ce3          	blez	a0,84b4 <_dtoa_r+0x8e8>
    8b40:	03100793          	li	a5,49
    8b44:	00fa8023          	sb	a5,0(s5)
    8b48:	02012783          	lw	a5,32(sp)
    8b4c:	001a8d13          	add	s10,s5,1
    8b50:	00178a13          	add	s4,a5,1
    8b54:	01812583          	lw	a1,24(sp)
    8b58:	00040513          	mv	a0,s0
    8b5c:	001a0a13          	add	s4,s4,1
    8b60:	00d000ef          	jal	936c <_Bfree>
    8b64:	c20918e3          	bnez	s2,8794 <_dtoa_r+0xbc8>
    8b68:	c39ff06f          	j	87a0 <_dtoa_r+0xbd4>
    8b6c:	00050593          	mv	a1,a0
    8b70:	00098613          	mv	a2,s3
    8b74:	00040513          	mv	a0,s0
    8b78:	66d000ef          	jal	99e4 <__pow5mult>
    8b7c:	00100793          	li	a5,1
    8b80:	00a12c23          	sw	a0,24(sp)
    8b84:	1147de63          	bge	a5,s4,8ca0 <_dtoa_r+0x10d4>
    8b88:	00000993          	li	s3,0
    8b8c:	01812703          	lw	a4,24(sp)
    8b90:	01072783          	lw	a5,16(a4)
    8b94:	00378793          	add	a5,a5,3
    8b98:	00279793          	sll	a5,a5,0x2
    8b9c:	00f707b3          	add	a5,a4,a5
    8ba0:	0047a503          	lw	a0,4(a5)
    8ba4:	171000ef          	jal	9514 <__hi0bits>
    8ba8:	02000793          	li	a5,32
    8bac:	40a787b3          	sub	a5,a5,a0
    8bb0:	ab5ff06f          	j	8664 <_dtoa_r+0xa98>
    8bb4:	02412783          	lw	a5,36(sp)
    8bb8:	04079063          	bnez	a5,8bf8 <_dtoa_r+0x102c>
    8bbc:	00012783          	lw	a5,0(sp)
    8bc0:	00c79793          	sll	a5,a5,0xc
    8bc4:	02079a63          	bnez	a5,8bf8 <_dtoa_r+0x102c>
    8bc8:	00012683          	lw	a3,0(sp)
    8bcc:	00000793          	li	a5,0
    8bd0:	0146d713          	srl	a4,a3,0x14
    8bd4:	7ff77713          	and	a4,a4,2047
    8bd8:	00070c63          	beqz	a4,8bf0 <_dtoa_r+0x1024>
    8bdc:	01012783          	lw	a5,16(sp)
    8be0:	001b0b13          	add	s6,s6,1
    8be4:	00178793          	add	a5,a5,1
    8be8:	00f12823          	sw	a5,16(sp)
    8bec:	00100793          	li	a5,1
    8bf0:	58099063          	bnez	s3,9170 <_dtoa_r+0x15a4>
    8bf4:	00078993          	mv	s3,a5
    8bf8:	00100793          	li	a5,1
    8bfc:	a69ff06f          	j	8664 <_dtoa_r+0xa98>
    8c00:	a8d70ee3          	beq	a4,a3,869c <_dtoa_r+0xad0>
    8c04:	03c00713          	li	a4,60
    8c08:	40f707b3          	sub	a5,a4,a5
    8c0c:	a7dff06f          	j	8688 <_dtoa_r+0xabc>
    8c10:	00100793          	li	a5,1
    8c14:	00500a13          	li	s4,5
    8c18:	02f12423          	sw	a5,40(sp)
    8c1c:	01412783          	lw	a5,20(sp)
    8c20:	02012703          	lw	a4,32(sp)
    8c24:	00e787b3          	add	a5,a5,a4
    8c28:	00178c13          	add	s8,a5,1
    8c2c:	02f12e23          	sw	a5,60(sp)
    8c30:	000c0613          	mv	a2,s8
    8c34:	ab804263          	bgtz	s8,7ed8 <_dtoa_r+0x30c>
    8c38:	00100613          	li	a2,1
    8c3c:	a9cff06f          	j	7ed8 <_dtoa_r+0x30c>
    8c40:	00051663          	bnez	a0,8c4c <_dtoa_r+0x1080>
    8c44:	001bf793          	and	a5,s7,1
    8c48:	b00792e3          	bnez	a5,874c <_dtoa_r+0xb80>
    8c4c:	03000693          	li	a3,48
    8c50:	fff9c783          	lbu	a5,-1(s3)
    8c54:	00098d13          	mv	s10,s3
    8c58:	fff98993          	add	s3,s3,-1
    8c5c:	fed78ae3          	beq	a5,a3,8c50 <_dtoa_r+0x1084>
    8c60:	b11ff06f          	j	8770 <_dtoa_r+0xba4>
    8c64:	000c0993          	mv	s3,s8
    8c68:	abdff06f          	j	8724 <_dtoa_r+0xb58>
    8c6c:	000b0793          	mv	a5,s6
    8c70:	99dff06f          	j	860c <_dtoa_r+0xa40>
    8c74:	03012783          	lw	a5,48(sp)
    8c78:	01012703          	lw	a4,16(sp)
    8c7c:	03712823          	sw	s7,48(sp)
    8c80:	40fb87b3          	sub	a5,s7,a5
    8c84:	00f989b3          	add	s3,s3,a5
    8c88:	018707b3          	add	a5,a4,s8
    8c8c:	00070c93          	mv	s9,a4
    8c90:	018b0b33          	add	s6,s6,s8
    8c94:	00f12823          	sw	a5,16(sp)
    8c98:	00000b93          	li	s7,0
    8c9c:	bd9ff06f          	j	8874 <_dtoa_r+0xca8>
    8ca0:	02412783          	lw	a5,36(sp)
    8ca4:	ee0792e3          	bnez	a5,8b88 <_dtoa_r+0xfbc>
    8ca8:	00012783          	lw	a5,0(sp)
    8cac:	00c79793          	sll	a5,a5,0xc
    8cb0:	ec079ce3          	bnez	a5,8b88 <_dtoa_r+0xfbc>
    8cb4:	f15ff06f          	j	8bc8 <_dtoa_r+0xffc>
    8cb8:	01812303          	lw	t1,24(sp)
    8cbc:	01c12d03          	lw	s10,28(sp)
    8cc0:	00200913          	li	s2,2
    8cc4:	ad0ff06f          	j	7f94 <_dtoa_r+0x3c8>
    8cc8:	00200a13          	li	s4,2
    8ccc:	02012423          	sw	zero,40(sp)
    8cd0:	9f8ff06f          	j	7ec8 <_dtoa_r+0x2fc>
    8cd4:	dc0510e3          	bnez	a0,8a94 <_dtoa_r+0xec8>
    8cd8:	001bf713          	and	a4,s7,1
    8cdc:	da0716e3          	bnez	a4,8a88 <_dtoa_r+0xebc>
    8ce0:	db5ff06f          	j	8a94 <_dtoa_r+0xec8>
    8ce4:	03900793          	li	a5,57
    8ce8:	00fc8023          	sb	a5,0(s9)
    8cec:	02012783          	lw	a5,32(sp)
    8cf0:	00090c13          	mv	s8,s2
    8cf4:	001c8993          	add	s3,s9,1
    8cf8:	00178a13          	add	s4,a5,1
    8cfc:	000b0913          	mv	s2,s6
    8d00:	a4dff06f          	j	874c <_dtoa_r+0xb80>
    8d04:	00100793          	li	a5,1
    8d08:	00100c13          	li	s8,1
    8d0c:	00f12a23          	sw	a5,20(sp)
    8d10:	e50ff06f          	j	8360 <_dtoa_r+0x794>
    8d14:	02012423          	sw	zero,40(sp)
    8d18:	f05ff06f          	j	8c1c <_dtoa_r+0x1050>
    8d1c:	03812703          	lw	a4,56(sp)
    8d20:	30070e63          	beqz	a4,903c <_dtoa_r+0x1470>
    8d24:	01012703          	lw	a4,16(sp)
    8d28:	43378793          	add	a5,a5,1075
    8d2c:	00fb0b33          	add	s6,s6,a5
    8d30:	00f707b3          	add	a5,a4,a5
    8d34:	03012b83          	lw	s7,48(sp)
    8d38:	00070c93          	mv	s9,a4
    8d3c:	00f12823          	sw	a5,16(sp)
    8d40:	b35ff06f          	j	8874 <_dtoa_r+0xca8>
    8d44:	03100793          	li	a5,49
    8d48:	00fa8023          	sb	a5,0(s5)
    8d4c:	001a0a13          	add	s4,s4,1
    8d50:	a21ff06f          	j	8770 <_dtoa_r+0xba4>
    8d54:	02012783          	lw	a5,32(sp)
    8d58:	32078263          	beqz	a5,907c <_dtoa_r+0x14b0>
    8d5c:	40f00bb3          	neg	s7,a5
    8d60:	00fbf713          	and	a4,s7,15
    8d64:	00371713          	sll	a4,a4,0x3
    8d68:	00006797          	auipc	a5,0x6
    8d6c:	77878793          	add	a5,a5,1912 # f4e0 <__mprec_tens>
    8d70:	00e787b3          	add	a5,a5,a4
    8d74:	0007a603          	lw	a2,0(a5)
    8d78:	0047a683          	lw	a3,4(a5)
    8d7c:	01812503          	lw	a0,24(sp)
    8d80:	01c12583          	lw	a1,28(sp)
    8d84:	404bdb93          	sra	s7,s7,0x4
    8d88:	564040ef          	jal	d2ec <__muldf3>
    8d8c:	00058d13          	mv	s10,a1
    8d90:	440b8c63          	beqz	s7,91e8 <_dtoa_r+0x161c>
    8d94:	00200913          	li	s2,2
    8d98:	04812023          	sw	s0,64(sp)
    8d9c:	00006c97          	auipc	s9,0x6
    8da0:	71cc8c93          	add	s9,s9,1820 # f4b8 <__mprec_bigtens>
    8da4:	00090413          	mv	s0,s2
    8da8:	00050713          	mv	a4,a0
    8dac:	00000613          	li	a2,0
    8db0:	00050913          	mv	s2,a0
    8db4:	001bf693          	and	a3,s7,1
    8db8:	02068063          	beqz	a3,8dd8 <_dtoa_r+0x120c>
    8dbc:	000ca603          	lw	a2,0(s9)
    8dc0:	004ca683          	lw	a3,4(s9)
    8dc4:	00070513          	mv	a0,a4
    8dc8:	00140413          	add	s0,s0,1
    8dcc:	520040ef          	jal	d2ec <__muldf3>
    8dd0:	00050713          	mv	a4,a0
    8dd4:	00100613          	li	a2,1
    8dd8:	401bdb93          	sra	s7,s7,0x1
    8ddc:	008c8c93          	add	s9,s9,8
    8de0:	fc0b9ae3          	bnez	s7,8db4 <_dtoa_r+0x11e8>
    8de4:	00090513          	mv	a0,s2
    8de8:	00058793          	mv	a5,a1
    8dec:	00040913          	mv	s2,s0
    8df0:	04012403          	lw	s0,64(sp)
    8df4:	a0061a63          	bnez	a2,8008 <_dtoa_r+0x43c>
    8df8:	00050713          	mv	a4,a0
    8dfc:	000d0793          	mv	a5,s10
    8e00:	a08ff06f          	j	8008 <_dtoa_r+0x43c>
    8e04:	00068593          	mv	a1,a3
    8e08:	00070613          	mv	a2,a4
    8e0c:	00070513          	mv	a0,a4
    8e10:	0d4030ef          	jal	bee4 <__adddf3>
    8e14:	02012783          	lw	a5,32(sp)
    8e18:	00090613          	mv	a2,s2
    8e1c:	00098693          	mv	a3,s3
    8e20:	00178a13          	add	s4,a5,1
    8e24:	00050c93          	mv	s9,a0
    8e28:	00058b13          	mv	s6,a1
    8e2c:	000a0c13          	mv	s8,s4
    8e30:	2b4040ef          	jal	d0e4 <__gedf2>
    8e34:	c4a04863          	bgtz	a0,8284 <_dtoa_r+0x6b8>
    8e38:	000c8513          	mv	a0,s9
    8e3c:	000b0593          	mv	a1,s6
    8e40:	00090613          	mv	a2,s2
    8e44:	00098693          	mv	a3,s3
    8e48:	210040ef          	jal	d058 <__eqdf2>
    8e4c:	00051663          	bnez	a0,8e58 <_dtoa_r+0x128c>
    8e50:	001d7d13          	and	s10,s10,1
    8e54:	c20d1863          	bnez	s10,8284 <_dtoa_r+0x6b8>
    8e58:	000b8d13          	mv	s10,s7
    8e5c:	945ff06f          	j	87a0 <_dtoa_r+0xbd4>
    8e60:	00492583          	lw	a1,4(s2)
    8e64:	00040513          	mv	a0,s0
    8e68:	450000ef          	jal	92b8 <_Balloc>
    8e6c:	00050993          	mv	s3,a0
    8e70:	38050463          	beqz	a0,91f8 <_dtoa_r+0x162c>
    8e74:	01092603          	lw	a2,16(s2)
    8e78:	00c90593          	add	a1,s2,12
    8e7c:	00c50513          	add	a0,a0,12
    8e80:	00260613          	add	a2,a2,2
    8e84:	00261613          	sll	a2,a2,0x2
    8e88:	f59f70ef          	jal	de0 <memcpy>
    8e8c:	00100613          	li	a2,1
    8e90:	00098593          	mv	a1,s3
    8e94:	00040513          	mv	a0,s0
    8e98:	49d000ef          	jal	9b34 <__lshift>
    8e9c:	00050b13          	mv	s6,a0
    8ea0:	aa9ff06f          	j	8948 <_dtoa_r+0xd7c>
    8ea4:	00090593          	mv	a1,s2
    8ea8:	000b8613          	mv	a2,s7
    8eac:	00040513          	mv	a0,s0
    8eb0:	335000ef          	jal	99e4 <__pow5mult>
    8eb4:	00048613          	mv	a2,s1
    8eb8:	00050593          	mv	a1,a0
    8ebc:	00050913          	mv	s2,a0
    8ec0:	00040513          	mv	a0,s0
    8ec4:	059000ef          	jal	971c <__multiply>
    8ec8:	00050793          	mv	a5,a0
    8ecc:	00048593          	mv	a1,s1
    8ed0:	00040513          	mv	a0,s0
    8ed4:	00078493          	mv	s1,a5
    8ed8:	494000ef          	jal	936c <_Bfree>
    8edc:	03012783          	lw	a5,48(sp)
    8ee0:	417787b3          	sub	a5,a5,s7
    8ee4:	02f12823          	sw	a5,48(sp)
    8ee8:	f6078063          	beqz	a5,8648 <_dtoa_r+0xa7c>
    8eec:	f48ff06f          	j	8634 <_dtoa_r+0xa68>
    8ef0:	05012603          	lw	a2,80(sp)
    8ef4:	05412683          	lw	a3,84(sp)
    8ef8:	05812503          	lw	a0,88(sp)
    8efc:	04b12623          	sw	a1,76(sp)
    8f00:	000b8593          	mv	a1,s7
    8f04:	02612423          	sw	t1,40(sp)
    8f08:	3e4040ef          	jal	d2ec <__muldf3>
    8f0c:	02812303          	lw	t1,40(sp)
    8f10:	04812783          	lw	a5,72(sp)
    8f14:	00100693          	li	a3,1
    8f18:	006a8023          	sb	t1,0(s5)
    8f1c:	02a12c23          	sw	a0,56(sp)
    8f20:	04c12883          	lw	a7,76(sp)
    8f24:	00058913          	mv	s2,a1
    8f28:	00fa8bb3          	add	s7,s5,a5
    8f2c:	7fff7617          	auipc	a2,0x7fff7
    8f30:	7c460613          	add	a2,a2,1988 # 800006f0 <__global_locale+0x1bc>
    8f34:	28d78c63          	beq	a5,a3,91cc <_dtoa_r+0x1600>
    8f38:	00062783          	lw	a5,0(a2)
    8f3c:	00462803          	lw	a6,4(a2)
    8f40:	04912423          	sw	s1,72(sp)
    8f44:	02f12423          	sw	a5,40(sp)
    8f48:	03012623          	sw	a6,44(sp)
    8f4c:	04812623          	sw	s0,76(sp)
    8f50:	000c8513          	mv	a0,s9
    8f54:	00088593          	mv	a1,a7
    8f58:	02812603          	lw	a2,40(sp)
    8f5c:	02c12683          	lw	a3,44(sp)
    8f60:	001d0d13          	add	s10,s10,1
    8f64:	388040ef          	jal	d2ec <__muldf3>
    8f68:	00058413          	mv	s0,a1
    8f6c:	00050493          	mv	s1,a0
    8f70:	468050ef          	jal	e3d8 <__fixdfsi>
    8f74:	00050c93          	mv	s9,a0
    8f78:	4e4050ef          	jal	e45c <__floatsidf>
    8f7c:	00050613          	mv	a2,a0
    8f80:	00058693          	mv	a3,a1
    8f84:	00048513          	mv	a0,s1
    8f88:	00040593          	mv	a1,s0
    8f8c:	030c8c93          	add	s9,s9,48
    8f90:	2ed040ef          	jal	da7c <__subdf3>
    8f94:	ff9d0fa3          	sb	s9,-1(s10)
    8f98:	fdab90e3          	bne	s7,s10,8f58 <_dtoa_r+0x138c>
    8f9c:	04812483          	lw	s1,72(sp)
    8fa0:	04c12403          	lw	s0,76(sp)
    8fa4:	00050c93          	mv	s9,a0
    8fa8:	00058893          	mv	a7,a1
    8fac:	7fff7d17          	auipc	s10,0x7fff7
    8fb0:	70cd0d13          	add	s10,s10,1804 # 800006b8 <__global_locale+0x184>
    8fb4:	000d2603          	lw	a2,0(s10)
    8fb8:	004d2683          	lw	a3,4(s10)
    8fbc:	03812503          	lw	a0,56(sp)
    8fc0:	00090593          	mv	a1,s2
    8fc4:	03112423          	sw	a7,40(sp)
    8fc8:	71d020ef          	jal	bee4 <__adddf3>
    8fcc:	02812883          	lw	a7,40(sp)
    8fd0:	000c8613          	mv	a2,s9
    8fd4:	00088693          	mv	a3,a7
    8fd8:	20c040ef          	jal	d1e4 <__ledf2>
    8fdc:	1a054863          	bltz	a0,918c <_dtoa_r+0x15c0>
    8fe0:	03812603          	lw	a2,56(sp)
    8fe4:	000d2503          	lw	a0,0(s10)
    8fe8:	004d2583          	lw	a1,4(s10)
    8fec:	00090693          	mv	a3,s2
    8ff0:	28d040ef          	jal	da7c <__subdf3>
    8ff4:	02812883          	lw	a7,40(sp)
    8ff8:	000c8613          	mv	a2,s9
    8ffc:	00088693          	mv	a3,a7
    9000:	0e4040ef          	jal	d0e4 <__gedf2>
    9004:	12a04863          	bgtz	a0,9134 <_dtoa_r+0x1568>
    9008:	06c12783          	lw	a5,108(sp)
    900c:	de07c063          	bltz	a5,85ec <_dtoa_r+0xa20>
    9010:	02012703          	lw	a4,32(sp)
    9014:	00e00793          	li	a5,14
    9018:	dce7ca63          	blt	a5,a4,85ec <_dtoa_r+0xa20>
    901c:	02012783          	lw	a5,32(sp)
    9020:	00006717          	auipc	a4,0x6
    9024:	4c070713          	add	a4,a4,1216 # f4e0 <__mprec_tens>
    9028:	00379793          	sll	a5,a5,0x3
    902c:	00f707b3          	add	a5,a4,a5
    9030:	0007a903          	lw	s2,0(a5)
    9034:	0047a983          	lw	s3,4(a5)
    9038:	c90ff06f          	j	84c8 <_dtoa_r+0x8fc>
    903c:	06812703          	lw	a4,104(sp)
    9040:	01012683          	lw	a3,16(sp)
    9044:	03600793          	li	a5,54
    9048:	40e787b3          	sub	a5,a5,a4
    904c:	00fb0b33          	add	s6,s6,a5
    9050:	00f687b3          	add	a5,a3,a5
    9054:	03012b83          	lw	s7,48(sp)
    9058:	00068c93          	mv	s9,a3
    905c:	00f12823          	sw	a5,16(sp)
    9060:	815ff06f          	j	8874 <_dtoa_r+0xca8>
    9064:	02012783          	lw	a5,32(sp)
    9068:	00090c13          	mv	s8,s2
    906c:	01012a83          	lw	s5,16(sp)
    9070:	00178a13          	add	s4,a5,1
    9074:	000b0913          	mv	s2,s6
    9078:	eb4ff06f          	j	872c <_dtoa_r+0xb60>
    907c:	01812703          	lw	a4,24(sp)
    9080:	01c12783          	lw	a5,28(sp)
    9084:	00200913          	li	s2,2
    9088:	f81fe06f          	j	8008 <_dtoa_r+0x43c>
    908c:	b00c0063          	beqz	s8,838c <_dtoa_r+0x7c0>
    9090:	03c12d03          	lw	s10,60(sp)
    9094:	bba05063          	blez	s10,8434 <_dtoa_r+0x868>
    9098:	7fff7617          	auipc	a2,0x7fff7
    909c:	65860613          	add	a2,a2,1624 # 800006f0 <__global_locale+0x1bc>
    90a0:	00078593          	mv	a1,a5
    90a4:	02012783          	lw	a5,32(sp)
    90a8:	00462683          	lw	a3,4(a2)
    90ac:	00062603          	lw	a2,0(a2)
    90b0:	fff78793          	add	a5,a5,-1
    90b4:	00070513          	mv	a0,a4
    90b8:	04f12e23          	sw	a5,92(sp)
    90bc:	230040ef          	jal	d2ec <__muldf3>
    90c0:	00050713          	mv	a4,a0
    90c4:	00190513          	add	a0,s2,1
    90c8:	04e12423          	sw	a4,72(sp)
    90cc:	04b12023          	sw	a1,64(sp)
    90d0:	38c050ef          	jal	e45c <__floatsidf>
    90d4:	04812703          	lw	a4,72(sp)
    90d8:	04012783          	lw	a5,64(sp)
    90dc:	00070613          	mv	a2,a4
    90e0:	00078693          	mv	a3,a5
    90e4:	04e12623          	sw	a4,76(sp)
    90e8:	204040ef          	jal	d2ec <__muldf3>
    90ec:	7fff7697          	auipc	a3,0x7fff7
    90f0:	60c68693          	add	a3,a3,1548 # 800006f8 <__global_locale+0x1c4>
    90f4:	0006a603          	lw	a2,0(a3)
    90f8:	0046a683          	lw	a3,4(a3)
    90fc:	5e9020ef          	jal	bee4 <__adddf3>
    9100:	fcc006b7          	lui	a3,0xfcc00
    9104:	04012783          	lw	a5,64(sp)
    9108:	04c12703          	lw	a4,76(sp)
    910c:	00050c93          	mv	s9,a0
    9110:	00b68bb3          	add	s7,a3,a1
    9114:	05a12423          	sw	s10,72(sp)
    9118:	f91fe06f          	j	80a8 <_dtoa_r+0x4dc>
    911c:	03100693          	li	a3,49
    9120:	001c0c13          	add	s8,s8,1
    9124:	984ff06f          	j	82a8 <_dtoa_r+0x6dc>
    9128:	00012c23          	sw	zero,24(sp)
    912c:	00000913          	li	s2,0
    9130:	a11ff06f          	j	8b40 <_dtoa_r+0xf74>
    9134:	03000613          	li	a2,48
    9138:	fffbc783          	lbu	a5,-1(s7)
    913c:	000b8d13          	mv	s10,s7
    9140:	fffb8b93          	add	s7,s7,-1
    9144:	fec78ae3          	beq	a5,a2,9138 <_dtoa_r+0x156c>
    9148:	05c12783          	lw	a5,92(sp)
    914c:	00178a13          	add	s4,a5,1
    9150:	e50ff06f          	j	87a0 <_dtoa_r+0xbd4>
    9154:	03900713          	li	a4,57
    9158:	01012a83          	lw	s5,16(sp)
    915c:	b8eb84e3          	beq	s7,a4,8ce4 <_dtoa_r+0x1118>
    9160:	933048e3          	bgtz	s3,8a90 <_dtoa_r+0xec4>
    9164:	931ff06f          	j	8a94 <_dtoa_r+0xec8>
    9168:	01012a83          	lw	s5,16(sp)
    916c:	929ff06f          	j	8a94 <_dtoa_r+0xec8>
    9170:	00078993          	mv	s3,a5
    9174:	a19ff06f          	j	8b8c <_dtoa_r+0xfc0>
    9178:	00078c93          	mv	s9,a5
    917c:	018787b3          	add	a5,a5,s8
    9180:	018b0b33          	add	s6,s6,s8
    9184:	00f12823          	sw	a5,16(sp)
    9188:	eecff06f          	j	8874 <_dtoa_r+0xca8>
    918c:	05c12783          	lw	a5,92(sp)
    9190:	00178c13          	add	s8,a5,1
    9194:	8f0ff06f          	j	8284 <_dtoa_r+0x6b8>
    9198:	04c12983          	lw	s3,76(sp)
    919c:	05012b03          	lw	s6,80(sp)
    91a0:	05812c03          	lw	s8,88(sp)
    91a4:	04812a03          	lw	s4,72(sp)
    91a8:	a8cff06f          	j	8434 <_dtoa_r+0x868>
    91ac:	00200793          	li	a5,2
    91b0:	0147c863          	blt	a5,s4,91c0 <_dtoa_r+0x15f4>
    91b4:	02012a03          	lw	s4,32(sp)
    91b8:	03c12c03          	lw	s8,60(sp)
    91bc:	d1cff06f          	j	86d8 <_dtoa_r+0xb0c>
    91c0:	03c12c03          	lw	s8,60(sp)
    91c4:	03612023          	sw	s6,32(sp)
    91c8:	949ff06f          	j	8b10 <_dtoa_r+0xf44>
    91cc:	04012b83          	lw	s7,64(sp)
    91d0:	dddff06f          	j	8fac <_dtoa_r+0x13e0>
    91d4:	00200793          	li	a5,2
    91d8:	ff47c4e3          	blt	a5,s4,91c0 <_dtoa_r+0x15f4>
    91dc:	03c12c03          	lw	s8,60(sp)
    91e0:	03612023          	sw	s6,32(sp)
    91e4:	f44ff06f          	j	8928 <_dtoa_r+0xd5c>
    91e8:	00050713          	mv	a4,a0
    91ec:	00058793          	mv	a5,a1
    91f0:	00200913          	li	s2,2
    91f4:	e15fe06f          	j	8008 <_dtoa_r+0x43c>
    91f8:	00006697          	auipc	a3,0x6
    91fc:	c9468693          	add	a3,a3,-876 # ee8c <__fini_array_end+0x2e0>
    9200:	00000613          	li	a2,0
    9204:	2ef00593          	li	a1,751
    9208:	00006517          	auipc	a0,0x6
    920c:	c9850513          	add	a0,a0,-872 # eea0 <__fini_array_end+0x2f4>
    9210:	25d010ef          	jal	ac6c <__assert_func>
    9214:	01012a83          	lw	s5,16(sp)
    9218:	85b048e3          	bgtz	s11,8a68 <_dtoa_r+0xe9c>
    921c:	879ff06f          	j	8a94 <_dtoa_r+0xec8>
    9220:	00006697          	auipc	a3,0x6
    9224:	c6c68693          	add	a3,a3,-916 # ee8c <__fini_array_end+0x2e0>
    9228:	00000613          	li	a2,0
    922c:	1af00593          	li	a1,431
    9230:	00006517          	auipc	a0,0x6
    9234:	c7050513          	add	a0,a0,-912 # eea0 <__fini_array_end+0x2f4>
    9238:	235010ef          	jal	ac6c <__assert_func>
    923c:	02042e23          	sw	zero,60(s0)
    9240:	00000593          	li	a1,0
    9244:	cc1fe06f          	j	7f04 <_dtoa_r+0x338>
    9248:	02012423          	sw	zero,40(sp)
    924c:	c7dfe06f          	j	7ec8 <_dtoa_r+0x2fc>

00009250 <__ascii_mbtowc>:
    9250:	02058063          	beqz	a1,9270 <__ascii_mbtowc+0x20>
    9254:	04060263          	beqz	a2,9298 <__ascii_mbtowc+0x48>
    9258:	04068863          	beqz	a3,92a8 <__ascii_mbtowc+0x58>
    925c:	00064783          	lbu	a5,0(a2)
    9260:	00f5a023          	sw	a5,0(a1)
    9264:	00064503          	lbu	a0,0(a2)
    9268:	00a03533          	snez	a0,a0
    926c:	00008067          	ret
    9270:	ff010113          	add	sp,sp,-16
    9274:	00c10593          	add	a1,sp,12
    9278:	02060463          	beqz	a2,92a0 <__ascii_mbtowc+0x50>
    927c:	02068a63          	beqz	a3,92b0 <__ascii_mbtowc+0x60>
    9280:	00064783          	lbu	a5,0(a2)
    9284:	00f5a023          	sw	a5,0(a1)
    9288:	00064503          	lbu	a0,0(a2)
    928c:	00a03533          	snez	a0,a0
    9290:	01010113          	add	sp,sp,16
    9294:	00008067          	ret
    9298:	00000513          	li	a0,0
    929c:	00008067          	ret
    92a0:	00000513          	li	a0,0
    92a4:	fedff06f          	j	9290 <__ascii_mbtowc+0x40>
    92a8:	ffe00513          	li	a0,-2
    92ac:	00008067          	ret
    92b0:	ffe00513          	li	a0,-2
    92b4:	fddff06f          	j	9290 <__ascii_mbtowc+0x40>

000092b8 <_Balloc>:
    92b8:	04452783          	lw	a5,68(a0)
    92bc:	ff010113          	add	sp,sp,-16
    92c0:	00812423          	sw	s0,8(sp)
    92c4:	00912223          	sw	s1,4(sp)
    92c8:	00112623          	sw	ra,12(sp)
    92cc:	00050413          	mv	s0,a0
    92d0:	00058493          	mv	s1,a1
    92d4:	02078c63          	beqz	a5,930c <_Balloc+0x54>
    92d8:	00249713          	sll	a4,s1,0x2
    92dc:	00e787b3          	add	a5,a5,a4
    92e0:	0007a503          	lw	a0,0(a5)
    92e4:	04050463          	beqz	a0,932c <_Balloc+0x74>
    92e8:	00052703          	lw	a4,0(a0)
    92ec:	00e7a023          	sw	a4,0(a5)
    92f0:	00052823          	sw	zero,16(a0)
    92f4:	00052623          	sw	zero,12(a0)
    92f8:	00c12083          	lw	ra,12(sp)
    92fc:	00812403          	lw	s0,8(sp)
    9300:	00412483          	lw	s1,4(sp)
    9304:	01010113          	add	sp,sp,16
    9308:	00008067          	ret
    930c:	02100613          	li	a2,33
    9310:	00400593          	li	a1,4
    9314:	1b1010ef          	jal	acc4 <_calloc_r>
    9318:	04a42223          	sw	a0,68(s0)
    931c:	00050793          	mv	a5,a0
    9320:	fa051ce3          	bnez	a0,92d8 <_Balloc+0x20>
    9324:	00000513          	li	a0,0
    9328:	fd1ff06f          	j	92f8 <_Balloc+0x40>
    932c:	01212023          	sw	s2,0(sp)
    9330:	00100913          	li	s2,1
    9334:	00991933          	sll	s2,s2,s1
    9338:	00590613          	add	a2,s2,5
    933c:	00261613          	sll	a2,a2,0x2
    9340:	00100593          	li	a1,1
    9344:	00040513          	mv	a0,s0
    9348:	17d010ef          	jal	acc4 <_calloc_r>
    934c:	00050a63          	beqz	a0,9360 <_Balloc+0xa8>
    9350:	01252423          	sw	s2,8(a0)
    9354:	00952223          	sw	s1,4(a0)
    9358:	00012903          	lw	s2,0(sp)
    935c:	f95ff06f          	j	92f0 <_Balloc+0x38>
    9360:	00012903          	lw	s2,0(sp)
    9364:	00000513          	li	a0,0
    9368:	f91ff06f          	j	92f8 <_Balloc+0x40>

0000936c <_Bfree>:
    936c:	02058063          	beqz	a1,938c <_Bfree+0x20>
    9370:	0045a703          	lw	a4,4(a1)
    9374:	04452783          	lw	a5,68(a0)
    9378:	00271713          	sll	a4,a4,0x2
    937c:	00e787b3          	add	a5,a5,a4
    9380:	0007a703          	lw	a4,0(a5)
    9384:	00e5a023          	sw	a4,0(a1)
    9388:	00b7a023          	sw	a1,0(a5)
    938c:	00008067          	ret

00009390 <__multadd>:
    9390:	fd010113          	add	sp,sp,-48
    9394:	01412c23          	sw	s4,24(sp)
    9398:	0105aa03          	lw	s4,16(a1)
    939c:	01912223          	sw	s9,4(sp)
    93a0:	00010cb7          	lui	s9,0x10
    93a4:	02912223          	sw	s1,36(sp)
    93a8:	03212023          	sw	s2,32(sp)
    93ac:	01312e23          	sw	s3,28(sp)
    93b0:	01512a23          	sw	s5,20(sp)
    93b4:	01612823          	sw	s6,16(sp)
    93b8:	01712623          	sw	s7,12(sp)
    93bc:	02112623          	sw	ra,44(sp)
    93c0:	02812423          	sw	s0,40(sp)
    93c4:	01812423          	sw	s8,8(sp)
    93c8:	00058a93          	mv	s5,a1
    93cc:	00050b13          	mv	s6,a0
    93d0:	00060993          	mv	s3,a2
    93d4:	00068493          	mv	s1,a3
    93d8:	01458913          	add	s2,a1,20
    93dc:	00000b93          	li	s7,0
    93e0:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    93e4:	00092c03          	lw	s8,0(s2)
    93e8:	00098593          	mv	a1,s3
    93ec:	00490913          	add	s2,s2,4
    93f0:	019c7533          	and	a0,s8,s9
    93f4:	5c0050ef          	jal	e9b4 <__mulsi3>
    93f8:	00050413          	mv	s0,a0
    93fc:	00098593          	mv	a1,s3
    9400:	010c5513          	srl	a0,s8,0x10
    9404:	00940433          	add	s0,s0,s1
    9408:	5ac050ef          	jal	e9b4 <__mulsi3>
    940c:	01045793          	srl	a5,s0,0x10
    9410:	00f50533          	add	a0,a0,a5
    9414:	01051793          	sll	a5,a0,0x10
    9418:	01947433          	and	s0,s0,s9
    941c:	008787b3          	add	a5,a5,s0
    9420:	fef92e23          	sw	a5,-4(s2)
    9424:	001b8b93          	add	s7,s7,1
    9428:	01055493          	srl	s1,a0,0x10
    942c:	fb4bcce3          	blt	s7,s4,93e4 <__multadd+0x54>
    9430:	02048263          	beqz	s1,9454 <__multadd+0xc4>
    9434:	008aa783          	lw	a5,8(s5)
    9438:	04fa5a63          	bge	s4,a5,948c <__multadd+0xfc>
    943c:	004a0793          	add	a5,s4,4
    9440:	00279793          	sll	a5,a5,0x2
    9444:	00fa87b3          	add	a5,s5,a5
    9448:	0097a223          	sw	s1,4(a5)
    944c:	001a0a13          	add	s4,s4,1
    9450:	014aa823          	sw	s4,16(s5)
    9454:	02c12083          	lw	ra,44(sp)
    9458:	02812403          	lw	s0,40(sp)
    945c:	02412483          	lw	s1,36(sp)
    9460:	02012903          	lw	s2,32(sp)
    9464:	01c12983          	lw	s3,28(sp)
    9468:	01812a03          	lw	s4,24(sp)
    946c:	01012b03          	lw	s6,16(sp)
    9470:	00c12b83          	lw	s7,12(sp)
    9474:	00812c03          	lw	s8,8(sp)
    9478:	00412c83          	lw	s9,4(sp)
    947c:	000a8513          	mv	a0,s5
    9480:	01412a83          	lw	s5,20(sp)
    9484:	03010113          	add	sp,sp,48
    9488:	00008067          	ret
    948c:	004aa583          	lw	a1,4(s5)
    9490:	000b0513          	mv	a0,s6
    9494:	00158593          	add	a1,a1,1
    9498:	e21ff0ef          	jal	92b8 <_Balloc>
    949c:	00050413          	mv	s0,a0
    94a0:	04050c63          	beqz	a0,94f8 <__multadd+0x168>
    94a4:	010aa603          	lw	a2,16(s5)
    94a8:	00ca8593          	add	a1,s5,12
    94ac:	00c50513          	add	a0,a0,12
    94b0:	00260613          	add	a2,a2,2
    94b4:	00261613          	sll	a2,a2,0x2
    94b8:	929f70ef          	jal	de0 <memcpy>
    94bc:	004aa703          	lw	a4,4(s5)
    94c0:	044b2783          	lw	a5,68(s6)
    94c4:	00271713          	sll	a4,a4,0x2
    94c8:	00e787b3          	add	a5,a5,a4
    94cc:	0007a703          	lw	a4,0(a5)
    94d0:	00eaa023          	sw	a4,0(s5)
    94d4:	0157a023          	sw	s5,0(a5)
    94d8:	004a0793          	add	a5,s4,4
    94dc:	00040a93          	mv	s5,s0
    94e0:	00279793          	sll	a5,a5,0x2
    94e4:	00fa87b3          	add	a5,s5,a5
    94e8:	0097a223          	sw	s1,4(a5)
    94ec:	001a0a13          	add	s4,s4,1
    94f0:	014aa823          	sw	s4,16(s5)
    94f4:	f61ff06f          	j	9454 <__multadd+0xc4>
    94f8:	00006697          	auipc	a3,0x6
    94fc:	99468693          	add	a3,a3,-1644 # ee8c <__fini_array_end+0x2e0>
    9500:	00000613          	li	a2,0
    9504:	0ba00593          	li	a1,186
    9508:	00006517          	auipc	a0,0x6
    950c:	a1850513          	add	a0,a0,-1512 # ef20 <__fini_array_end+0x374>
    9510:	75c010ef          	jal	ac6c <__assert_func>

00009514 <__hi0bits>:
    9514:	00050793          	mv	a5,a0
    9518:	00010737          	lui	a4,0x10
    951c:	00000513          	li	a0,0
    9520:	00e7f663          	bgeu	a5,a4,952c <__hi0bits+0x18>
    9524:	01079793          	sll	a5,a5,0x10
    9528:	01000513          	li	a0,16
    952c:	01000737          	lui	a4,0x1000
    9530:	00e7f663          	bgeu	a5,a4,953c <__hi0bits+0x28>
    9534:	00850513          	add	a0,a0,8
    9538:	00879793          	sll	a5,a5,0x8
    953c:	10000737          	lui	a4,0x10000
    9540:	00e7f663          	bgeu	a5,a4,954c <__hi0bits+0x38>
    9544:	00450513          	add	a0,a0,4
    9548:	00479793          	sll	a5,a5,0x4
    954c:	40000737          	lui	a4,0x40000
    9550:	00e7ea63          	bltu	a5,a4,9564 <__hi0bits+0x50>
    9554:	fff7c793          	not	a5,a5
    9558:	01f7d793          	srl	a5,a5,0x1f
    955c:	00f50533          	add	a0,a0,a5
    9560:	00008067          	ret
    9564:	00279793          	sll	a5,a5,0x2
    9568:	0007ca63          	bltz	a5,957c <__hi0bits+0x68>
    956c:	00179713          	sll	a4,a5,0x1
    9570:	00074a63          	bltz	a4,9584 <__hi0bits+0x70>
    9574:	02000513          	li	a0,32
    9578:	00008067          	ret
    957c:	00250513          	add	a0,a0,2
    9580:	00008067          	ret
    9584:	00350513          	add	a0,a0,3
    9588:	00008067          	ret

0000958c <__lo0bits>:
    958c:	00052783          	lw	a5,0(a0)
    9590:	00050713          	mv	a4,a0
    9594:	0077f693          	and	a3,a5,7
    9598:	02068463          	beqz	a3,95c0 <__lo0bits+0x34>
    959c:	0017f693          	and	a3,a5,1
    95a0:	00000513          	li	a0,0
    95a4:	04069e63          	bnez	a3,9600 <__lo0bits+0x74>
    95a8:	0027f693          	and	a3,a5,2
    95ac:	0a068863          	beqz	a3,965c <__lo0bits+0xd0>
    95b0:	0017d793          	srl	a5,a5,0x1
    95b4:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    95b8:	00100513          	li	a0,1
    95bc:	00008067          	ret
    95c0:	01079693          	sll	a3,a5,0x10
    95c4:	0106d693          	srl	a3,a3,0x10
    95c8:	00000513          	li	a0,0
    95cc:	06068e63          	beqz	a3,9648 <__lo0bits+0xbc>
    95d0:	0ff7f693          	zext.b	a3,a5
    95d4:	06068063          	beqz	a3,9634 <__lo0bits+0xa8>
    95d8:	00f7f693          	and	a3,a5,15
    95dc:	04068263          	beqz	a3,9620 <__lo0bits+0x94>
    95e0:	0037f693          	and	a3,a5,3
    95e4:	02068463          	beqz	a3,960c <__lo0bits+0x80>
    95e8:	0017f693          	and	a3,a5,1
    95ec:	00069c63          	bnez	a3,9604 <__lo0bits+0x78>
    95f0:	0017d793          	srl	a5,a5,0x1
    95f4:	00150513          	add	a0,a0,1
    95f8:	00079663          	bnez	a5,9604 <__lo0bits+0x78>
    95fc:	02000513          	li	a0,32
    9600:	00008067          	ret
    9604:	00f72023          	sw	a5,0(a4)
    9608:	00008067          	ret
    960c:	0027d793          	srl	a5,a5,0x2
    9610:	0017f693          	and	a3,a5,1
    9614:	00250513          	add	a0,a0,2
    9618:	fe0696e3          	bnez	a3,9604 <__lo0bits+0x78>
    961c:	fd5ff06f          	j	95f0 <__lo0bits+0x64>
    9620:	0047d793          	srl	a5,a5,0x4
    9624:	0037f693          	and	a3,a5,3
    9628:	00450513          	add	a0,a0,4
    962c:	fa069ee3          	bnez	a3,95e8 <__lo0bits+0x5c>
    9630:	fddff06f          	j	960c <__lo0bits+0x80>
    9634:	0087d793          	srl	a5,a5,0x8
    9638:	00f7f693          	and	a3,a5,15
    963c:	00850513          	add	a0,a0,8
    9640:	fa0690e3          	bnez	a3,95e0 <__lo0bits+0x54>
    9644:	fddff06f          	j	9620 <__lo0bits+0x94>
    9648:	0107d793          	srl	a5,a5,0x10
    964c:	0ff7f693          	zext.b	a3,a5
    9650:	01000513          	li	a0,16
    9654:	f80692e3          	bnez	a3,95d8 <__lo0bits+0x4c>
    9658:	fddff06f          	j	9634 <__lo0bits+0xa8>
    965c:	0027d793          	srl	a5,a5,0x2
    9660:	00f72023          	sw	a5,0(a4)
    9664:	00200513          	li	a0,2
    9668:	00008067          	ret

0000966c <__i2b>:
    966c:	04452783          	lw	a5,68(a0)
    9670:	ff010113          	add	sp,sp,-16
    9674:	00812423          	sw	s0,8(sp)
    9678:	00912223          	sw	s1,4(sp)
    967c:	00112623          	sw	ra,12(sp)
    9680:	00050413          	mv	s0,a0
    9684:	00058493          	mv	s1,a1
    9688:	02078c63          	beqz	a5,96c0 <__i2b+0x54>
    968c:	0047a503          	lw	a0,4(a5)
    9690:	06050263          	beqz	a0,96f4 <__i2b+0x88>
    9694:	00052703          	lw	a4,0(a0)
    9698:	00e7a223          	sw	a4,4(a5)
    969c:	00c12083          	lw	ra,12(sp)
    96a0:	00812403          	lw	s0,8(sp)
    96a4:	00100793          	li	a5,1
    96a8:	00952a23          	sw	s1,20(a0)
    96ac:	00052623          	sw	zero,12(a0)
    96b0:	00f52823          	sw	a5,16(a0)
    96b4:	00412483          	lw	s1,4(sp)
    96b8:	01010113          	add	sp,sp,16
    96bc:	00008067          	ret
    96c0:	02100613          	li	a2,33
    96c4:	00400593          	li	a1,4
    96c8:	5fc010ef          	jal	acc4 <_calloc_r>
    96cc:	04a42223          	sw	a0,68(s0)
    96d0:	00050793          	mv	a5,a0
    96d4:	fa051ce3          	bnez	a0,968c <__i2b+0x20>
    96d8:	00005697          	auipc	a3,0x5
    96dc:	7b468693          	add	a3,a3,1972 # ee8c <__fini_array_end+0x2e0>
    96e0:	00000613          	li	a2,0
    96e4:	14500593          	li	a1,325
    96e8:	00006517          	auipc	a0,0x6
    96ec:	83850513          	add	a0,a0,-1992 # ef20 <__fini_array_end+0x374>
    96f0:	57c010ef          	jal	ac6c <__assert_func>
    96f4:	01c00613          	li	a2,28
    96f8:	00100593          	li	a1,1
    96fc:	00040513          	mv	a0,s0
    9700:	5c4010ef          	jal	acc4 <_calloc_r>
    9704:	fc050ae3          	beqz	a0,96d8 <__i2b+0x6c>
    9708:	00100793          	li	a5,1
    970c:	00f52223          	sw	a5,4(a0)
    9710:	00200793          	li	a5,2
    9714:	00f52423          	sw	a5,8(a0)
    9718:	f85ff06f          	j	969c <__i2b+0x30>

0000971c <__multiply>:
    971c:	fb010113          	add	sp,sp,-80
    9720:	03312e23          	sw	s3,60(sp)
    9724:	03812423          	sw	s8,40(sp)
    9728:	01062983          	lw	s3,16(a2)
    972c:	0105ac03          	lw	s8,16(a1)
    9730:	04812423          	sw	s0,72(sp)
    9734:	03412c23          	sw	s4,56(sp)
    9738:	04112623          	sw	ra,76(sp)
    973c:	03712623          	sw	s7,44(sp)
    9740:	00058a13          	mv	s4,a1
    9744:	00060413          	mv	s0,a2
    9748:	013c4c63          	blt	s8,s3,9760 <__multiply+0x44>
    974c:	00098713          	mv	a4,s3
    9750:	00058413          	mv	s0,a1
    9754:	000c0993          	mv	s3,s8
    9758:	00060a13          	mv	s4,a2
    975c:	00070c13          	mv	s8,a4
    9760:	00842783          	lw	a5,8(s0)
    9764:	00442583          	lw	a1,4(s0)
    9768:	01898bb3          	add	s7,s3,s8
    976c:	0177a7b3          	slt	a5,a5,s7
    9770:	00f585b3          	add	a1,a1,a5
    9774:	b45ff0ef          	jal	92b8 <_Balloc>
    9778:	00a12623          	sw	a0,12(sp)
    977c:	22050863          	beqz	a0,99ac <__multiply+0x290>
    9780:	00c12783          	lw	a5,12(sp)
    9784:	03512a23          	sw	s5,52(sp)
    9788:	03612823          	sw	s6,48(sp)
    978c:	002b9a93          	sll	s5,s7,0x2
    9790:	01478b13          	add	s6,a5,20
    9794:	015b0ab3          	add	s5,s6,s5
    9798:	000b0793          	mv	a5,s6
    979c:	015b7863          	bgeu	s6,s5,97ac <__multiply+0x90>
    97a0:	0007a023          	sw	zero,0(a5)
    97a4:	00478793          	add	a5,a5,4
    97a8:	ff57ece3          	bltu	a5,s5,97a0 <__multiply+0x84>
    97ac:	014a0a13          	add	s4,s4,20
    97b0:	002c1c13          	sll	s8,s8,0x2
    97b4:	01440793          	add	a5,s0,20
    97b8:	018a0733          	add	a4,s4,s8
    97bc:	00299993          	sll	s3,s3,0x2
    97c0:	00f12423          	sw	a5,8(sp)
    97c4:	00e12023          	sw	a4,0(sp)
    97c8:	013789b3          	add	s3,a5,s3
    97cc:	16ea7c63          	bgeu	s4,a4,9944 <__multiply+0x228>
    97d0:	00400713          	li	a4,4
    97d4:	04912223          	sw	s1,68(sp)
    97d8:	05212023          	sw	s2,64(sp)
    97dc:	03912223          	sw	s9,36(sp)
    97e0:	03a12023          	sw	s10,32(sp)
    97e4:	01b12e23          	sw	s11,28(sp)
    97e8:	01540793          	add	a5,s0,21
    97ec:	00e12223          	sw	a4,4(sp)
    97f0:	1af9f263          	bgeu	s3,a5,9994 <__multiply+0x278>
    97f4:	00010437          	lui	s0,0x10
    97f8:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    97fc:	01c0006f          	j	9818 <__multiply+0xfc>
    9800:	01095913          	srl	s2,s2,0x10
    9804:	0a091063          	bnez	s2,98a4 <__multiply+0x188>
    9808:	00012783          	lw	a5,0(sp)
    980c:	004a0a13          	add	s4,s4,4
    9810:	004b0b13          	add	s6,s6,4
    9814:	10fa7e63          	bgeu	s4,a5,9930 <__multiply+0x214>
    9818:	000a2903          	lw	s2,0(s4)
    981c:	008974b3          	and	s1,s2,s0
    9820:	fe0480e3          	beqz	s1,9800 <__multiply+0xe4>
    9824:	00812c83          	lw	s9,8(sp)
    9828:	000b0d13          	mv	s10,s6
    982c:	00000c13          	li	s8,0
    9830:	000cad83          	lw	s11,0(s9)
    9834:	000d2903          	lw	s2,0(s10)
    9838:	00048593          	mv	a1,s1
    983c:	008df533          	and	a0,s11,s0
    9840:	174050ef          	jal	e9b4 <__mulsi3>
    9844:	00897733          	and	a4,s2,s0
    9848:	00e50733          	add	a4,a0,a4
    984c:	00048593          	mv	a1,s1
    9850:	010dd513          	srl	a0,s11,0x10
    9854:	01870c33          	add	s8,a4,s8
    9858:	01095913          	srl	s2,s2,0x10
    985c:	158050ef          	jal	e9b4 <__mulsi3>
    9860:	010c5713          	srl	a4,s8,0x10
    9864:	01250533          	add	a0,a0,s2
    9868:	00e50533          	add	a0,a0,a4
    986c:	008c77b3          	and	a5,s8,s0
    9870:	01051713          	sll	a4,a0,0x10
    9874:	004d0d13          	add	s10,s10,4
    9878:	00f767b3          	or	a5,a4,a5
    987c:	004c8c93          	add	s9,s9,4
    9880:	fefd2e23          	sw	a5,-4(s10)
    9884:	01055c13          	srl	s8,a0,0x10
    9888:	fb3ce4e3          	bltu	s9,s3,9830 <__multiply+0x114>
    988c:	00412783          	lw	a5,4(sp)
    9890:	00fb0733          	add	a4,s6,a5
    9894:	01872023          	sw	s8,0(a4)
    9898:	000a2903          	lw	s2,0(s4)
    989c:	01095913          	srl	s2,s2,0x10
    98a0:	f60904e3          	beqz	s2,9808 <__multiply+0xec>
    98a4:	000b2c83          	lw	s9,0(s6)
    98a8:	00812d03          	lw	s10,8(sp)
    98ac:	000b0c13          	mv	s8,s6
    98b0:	000c8493          	mv	s1,s9
    98b4:	00000d93          	li	s11,0
    98b8:	000d2503          	lw	a0,0(s10)
    98bc:	00090593          	mv	a1,s2
    98c0:	0104d493          	srl	s1,s1,0x10
    98c4:	00857533          	and	a0,a0,s0
    98c8:	0ec050ef          	jal	e9b4 <__mulsi3>
    98cc:	01b50733          	add	a4,a0,s11
    98d0:	00970db3          	add	s11,a4,s1
    98d4:	010d9593          	sll	a1,s11,0x10
    98d8:	008cf7b3          	and	a5,s9,s0
    98dc:	00f5e7b3          	or	a5,a1,a5
    98e0:	00fc2023          	sw	a5,0(s8)
    98e4:	002d5503          	lhu	a0,2(s10)
    98e8:	004c2483          	lw	s1,4(s8)
    98ec:	00090593          	mv	a1,s2
    98f0:	0c4050ef          	jal	e9b4 <__mulsi3>
    98f4:	0084f7b3          	and	a5,s1,s0
    98f8:	010dd713          	srl	a4,s11,0x10
    98fc:	00f507b3          	add	a5,a0,a5
    9900:	004d0d13          	add	s10,s10,4
    9904:	00e78cb3          	add	s9,a5,a4
    9908:	004c0c13          	add	s8,s8,4
    990c:	010cdd93          	srl	s11,s9,0x10
    9910:	fb3d64e3          	bltu	s10,s3,98b8 <__multiply+0x19c>
    9914:	00412783          	lw	a5,4(sp)
    9918:	004a0a13          	add	s4,s4,4
    991c:	00fb0733          	add	a4,s6,a5
    9920:	00012783          	lw	a5,0(sp)
    9924:	01972023          	sw	s9,0(a4)
    9928:	004b0b13          	add	s6,s6,4
    992c:	eefa66e3          	bltu	s4,a5,9818 <__multiply+0xfc>
    9930:	04412483          	lw	s1,68(sp)
    9934:	04012903          	lw	s2,64(sp)
    9938:	02412c83          	lw	s9,36(sp)
    993c:	02012d03          	lw	s10,32(sp)
    9940:	01c12d83          	lw	s11,28(sp)
    9944:	01704863          	bgtz	s7,9954 <__multiply+0x238>
    9948:	0180006f          	j	9960 <__multiply+0x244>
    994c:	fffb8b93          	add	s7,s7,-1
    9950:	000b8863          	beqz	s7,9960 <__multiply+0x244>
    9954:	ffcaa783          	lw	a5,-4(s5)
    9958:	ffca8a93          	add	s5,s5,-4
    995c:	fe0788e3          	beqz	a5,994c <__multiply+0x230>
    9960:	00c12783          	lw	a5,12(sp)
    9964:	04c12083          	lw	ra,76(sp)
    9968:	04812403          	lw	s0,72(sp)
    996c:	0177a823          	sw	s7,16(a5)
    9970:	03412a83          	lw	s5,52(sp)
    9974:	03012b03          	lw	s6,48(sp)
    9978:	03c12983          	lw	s3,60(sp)
    997c:	03812a03          	lw	s4,56(sp)
    9980:	02c12b83          	lw	s7,44(sp)
    9984:	02812c03          	lw	s8,40(sp)
    9988:	00078513          	mv	a0,a5
    998c:	05010113          	add	sp,sp,80
    9990:	00008067          	ret
    9994:	408987b3          	sub	a5,s3,s0
    9998:	feb78793          	add	a5,a5,-21
    999c:	ffc7f793          	and	a5,a5,-4
    99a0:	00478793          	add	a5,a5,4
    99a4:	00f12223          	sw	a5,4(sp)
    99a8:	e4dff06f          	j	97f4 <__multiply+0xd8>
    99ac:	00005697          	auipc	a3,0x5
    99b0:	4e068693          	add	a3,a3,1248 # ee8c <__fini_array_end+0x2e0>
    99b4:	00000613          	li	a2,0
    99b8:	16200593          	li	a1,354
    99bc:	00005517          	auipc	a0,0x5
    99c0:	56450513          	add	a0,a0,1380 # ef20 <__fini_array_end+0x374>
    99c4:	04912223          	sw	s1,68(sp)
    99c8:	05212023          	sw	s2,64(sp)
    99cc:	03512a23          	sw	s5,52(sp)
    99d0:	03612823          	sw	s6,48(sp)
    99d4:	03912223          	sw	s9,36(sp)
    99d8:	03a12023          	sw	s10,32(sp)
    99dc:	01b12e23          	sw	s11,28(sp)
    99e0:	28c010ef          	jal	ac6c <__assert_func>

000099e4 <__pow5mult>:
    99e4:	fe010113          	add	sp,sp,-32
    99e8:	00812c23          	sw	s0,24(sp)
    99ec:	01212823          	sw	s2,16(sp)
    99f0:	01312623          	sw	s3,12(sp)
    99f4:	00112e23          	sw	ra,28(sp)
    99f8:	00367793          	and	a5,a2,3
    99fc:	00060413          	mv	s0,a2
    9a00:	00050993          	mv	s3,a0
    9a04:	00058913          	mv	s2,a1
    9a08:	0a079c63          	bnez	a5,9ac0 <__pow5mult+0xdc>
    9a0c:	40245413          	sra	s0,s0,0x2
    9a10:	06040a63          	beqz	s0,9a84 <__pow5mult+0xa0>
    9a14:	00912a23          	sw	s1,20(sp)
    9a18:	0409a483          	lw	s1,64(s3)
    9a1c:	0c048663          	beqz	s1,9ae8 <__pow5mult+0x104>
    9a20:	00147793          	and	a5,s0,1
    9a24:	02079063          	bnez	a5,9a44 <__pow5mult+0x60>
    9a28:	40145413          	sra	s0,s0,0x1
    9a2c:	04040a63          	beqz	s0,9a80 <__pow5mult+0x9c>
    9a30:	0004a503          	lw	a0,0(s1)
    9a34:	06050663          	beqz	a0,9aa0 <__pow5mult+0xbc>
    9a38:	00050493          	mv	s1,a0
    9a3c:	00147793          	and	a5,s0,1
    9a40:	fe0784e3          	beqz	a5,9a28 <__pow5mult+0x44>
    9a44:	00048613          	mv	a2,s1
    9a48:	00090593          	mv	a1,s2
    9a4c:	00098513          	mv	a0,s3
    9a50:	ccdff0ef          	jal	971c <__multiply>
    9a54:	02090063          	beqz	s2,9a74 <__pow5mult+0x90>
    9a58:	00492703          	lw	a4,4(s2)
    9a5c:	0449a783          	lw	a5,68(s3)
    9a60:	00271713          	sll	a4,a4,0x2
    9a64:	00e787b3          	add	a5,a5,a4
    9a68:	0007a703          	lw	a4,0(a5)
    9a6c:	00e92023          	sw	a4,0(s2)
    9a70:	0127a023          	sw	s2,0(a5)
    9a74:	40145413          	sra	s0,s0,0x1
    9a78:	00050913          	mv	s2,a0
    9a7c:	fa041ae3          	bnez	s0,9a30 <__pow5mult+0x4c>
    9a80:	01412483          	lw	s1,20(sp)
    9a84:	01c12083          	lw	ra,28(sp)
    9a88:	01812403          	lw	s0,24(sp)
    9a8c:	00c12983          	lw	s3,12(sp)
    9a90:	00090513          	mv	a0,s2
    9a94:	01012903          	lw	s2,16(sp)
    9a98:	02010113          	add	sp,sp,32
    9a9c:	00008067          	ret
    9aa0:	00048613          	mv	a2,s1
    9aa4:	00048593          	mv	a1,s1
    9aa8:	00098513          	mv	a0,s3
    9aac:	c71ff0ef          	jal	971c <__multiply>
    9ab0:	00a4a023          	sw	a0,0(s1)
    9ab4:	00052023          	sw	zero,0(a0)
    9ab8:	00050493          	mv	s1,a0
    9abc:	f81ff06f          	j	9a3c <__pow5mult+0x58>
    9ac0:	fff78793          	add	a5,a5,-1
    9ac4:	00006717          	auipc	a4,0x6
    9ac8:	9e870713          	add	a4,a4,-1560 # f4ac <p05.0>
    9acc:	00279793          	sll	a5,a5,0x2
    9ad0:	00f707b3          	add	a5,a4,a5
    9ad4:	0007a603          	lw	a2,0(a5)
    9ad8:	00000693          	li	a3,0
    9adc:	8b5ff0ef          	jal	9390 <__multadd>
    9ae0:	00050913          	mv	s2,a0
    9ae4:	f29ff06f          	j	9a0c <__pow5mult+0x28>
    9ae8:	00100593          	li	a1,1
    9aec:	00098513          	mv	a0,s3
    9af0:	fc8ff0ef          	jal	92b8 <_Balloc>
    9af4:	00050493          	mv	s1,a0
    9af8:	02050063          	beqz	a0,9b18 <__pow5mult+0x134>
    9afc:	27100793          	li	a5,625
    9b00:	00f52a23          	sw	a5,20(a0)
    9b04:	00100793          	li	a5,1
    9b08:	00f52823          	sw	a5,16(a0)
    9b0c:	04a9a023          	sw	a0,64(s3)
    9b10:	00052023          	sw	zero,0(a0)
    9b14:	f0dff06f          	j	9a20 <__pow5mult+0x3c>
    9b18:	00005697          	auipc	a3,0x5
    9b1c:	37468693          	add	a3,a3,884 # ee8c <__fini_array_end+0x2e0>
    9b20:	00000613          	li	a2,0
    9b24:	14500593          	li	a1,325
    9b28:	00005517          	auipc	a0,0x5
    9b2c:	3f850513          	add	a0,a0,1016 # ef20 <__fini_array_end+0x374>
    9b30:	13c010ef          	jal	ac6c <__assert_func>

00009b34 <__lshift>:
    9b34:	fe010113          	add	sp,sp,-32
    9b38:	01512223          	sw	s5,4(sp)
    9b3c:	0105aa83          	lw	s5,16(a1)
    9b40:	0085a783          	lw	a5,8(a1)
    9b44:	01312623          	sw	s3,12(sp)
    9b48:	40565993          	sra	s3,a2,0x5
    9b4c:	01598ab3          	add	s5,s3,s5
    9b50:	00812c23          	sw	s0,24(sp)
    9b54:	00912a23          	sw	s1,20(sp)
    9b58:	01212823          	sw	s2,16(sp)
    9b5c:	01412423          	sw	s4,8(sp)
    9b60:	00112e23          	sw	ra,28(sp)
    9b64:	001a8913          	add	s2,s5,1
    9b68:	00058493          	mv	s1,a1
    9b6c:	00060413          	mv	s0,a2
    9b70:	0045a583          	lw	a1,4(a1)
    9b74:	00050a13          	mv	s4,a0
    9b78:	0127d863          	bge	a5,s2,9b88 <__lshift+0x54>
    9b7c:	00179793          	sll	a5,a5,0x1
    9b80:	00158593          	add	a1,a1,1
    9b84:	ff27cce3          	blt	a5,s2,9b7c <__lshift+0x48>
    9b88:	000a0513          	mv	a0,s4
    9b8c:	f2cff0ef          	jal	92b8 <_Balloc>
    9b90:	10050c63          	beqz	a0,9ca8 <__lshift+0x174>
    9b94:	01450813          	add	a6,a0,20
    9b98:	03305463          	blez	s3,9bc0 <__lshift+0x8c>
    9b9c:	00598993          	add	s3,s3,5
    9ba0:	00299993          	sll	s3,s3,0x2
    9ba4:	01350733          	add	a4,a0,s3
    9ba8:	00080793          	mv	a5,a6
    9bac:	00478793          	add	a5,a5,4
    9bb0:	fe07ae23          	sw	zero,-4(a5)
    9bb4:	fee79ce3          	bne	a5,a4,9bac <__lshift+0x78>
    9bb8:	fec98993          	add	s3,s3,-20
    9bbc:	01380833          	add	a6,a6,s3
    9bc0:	0104a883          	lw	a7,16(s1)
    9bc4:	01448793          	add	a5,s1,20
    9bc8:	01f47613          	and	a2,s0,31
    9bcc:	00289893          	sll	a7,a7,0x2
    9bd0:	011788b3          	add	a7,a5,a7
    9bd4:	0a060463          	beqz	a2,9c7c <__lshift+0x148>
    9bd8:	02000593          	li	a1,32
    9bdc:	40c585b3          	sub	a1,a1,a2
    9be0:	00080313          	mv	t1,a6
    9be4:	00000693          	li	a3,0
    9be8:	0007a703          	lw	a4,0(a5)
    9bec:	00430313          	add	t1,t1,4
    9bf0:	00478793          	add	a5,a5,4
    9bf4:	00c71733          	sll	a4,a4,a2
    9bf8:	00d76733          	or	a4,a4,a3
    9bfc:	fee32e23          	sw	a4,-4(t1)
    9c00:	ffc7a683          	lw	a3,-4(a5)
    9c04:	00b6d6b3          	srl	a3,a3,a1
    9c08:	ff17e0e3          	bltu	a5,a7,9be8 <__lshift+0xb4>
    9c0c:	01548793          	add	a5,s1,21
    9c10:	00400713          	li	a4,4
    9c14:	00f8ea63          	bltu	a7,a5,9c28 <__lshift+0xf4>
    9c18:	409887b3          	sub	a5,a7,s1
    9c1c:	feb78793          	add	a5,a5,-21
    9c20:	ffc7f793          	and	a5,a5,-4
    9c24:	00478713          	add	a4,a5,4
    9c28:	00e80833          	add	a6,a6,a4
    9c2c:	00d82023          	sw	a3,0(a6)
    9c30:	00069463          	bnez	a3,9c38 <__lshift+0x104>
    9c34:	000a8913          	mv	s2,s5
    9c38:	0044a703          	lw	a4,4(s1)
    9c3c:	044a2783          	lw	a5,68(s4)
    9c40:	01c12083          	lw	ra,28(sp)
    9c44:	00271713          	sll	a4,a4,0x2
    9c48:	00e787b3          	add	a5,a5,a4
    9c4c:	0007a703          	lw	a4,0(a5)
    9c50:	01252823          	sw	s2,16(a0)
    9c54:	01812403          	lw	s0,24(sp)
    9c58:	00e4a023          	sw	a4,0(s1)
    9c5c:	0097a023          	sw	s1,0(a5)
    9c60:	01012903          	lw	s2,16(sp)
    9c64:	01412483          	lw	s1,20(sp)
    9c68:	00c12983          	lw	s3,12(sp)
    9c6c:	00812a03          	lw	s4,8(sp)
    9c70:	00412a83          	lw	s5,4(sp)
    9c74:	02010113          	add	sp,sp,32
    9c78:	00008067          	ret
    9c7c:	0007a703          	lw	a4,0(a5)
    9c80:	00478793          	add	a5,a5,4
    9c84:	00480813          	add	a6,a6,4
    9c88:	fee82e23          	sw	a4,-4(a6)
    9c8c:	fb17f4e3          	bgeu	a5,a7,9c34 <__lshift+0x100>
    9c90:	0007a703          	lw	a4,0(a5)
    9c94:	00478793          	add	a5,a5,4
    9c98:	00480813          	add	a6,a6,4
    9c9c:	fee82e23          	sw	a4,-4(a6)
    9ca0:	fd17eee3          	bltu	a5,a7,9c7c <__lshift+0x148>
    9ca4:	f91ff06f          	j	9c34 <__lshift+0x100>
    9ca8:	00005697          	auipc	a3,0x5
    9cac:	1e468693          	add	a3,a3,484 # ee8c <__fini_array_end+0x2e0>
    9cb0:	00000613          	li	a2,0
    9cb4:	1de00593          	li	a1,478
    9cb8:	00005517          	auipc	a0,0x5
    9cbc:	26850513          	add	a0,a0,616 # ef20 <__fini_array_end+0x374>
    9cc0:	7ad000ef          	jal	ac6c <__assert_func>

00009cc4 <__mcmp>:
    9cc4:	01052703          	lw	a4,16(a0)
    9cc8:	0105a783          	lw	a5,16(a1)
    9ccc:	00050813          	mv	a6,a0
    9cd0:	40f70533          	sub	a0,a4,a5
    9cd4:	04f71263          	bne	a4,a5,9d18 <__mcmp+0x54>
    9cd8:	00279793          	sll	a5,a5,0x2
    9cdc:	01480813          	add	a6,a6,20
    9ce0:	01458593          	add	a1,a1,20
    9ce4:	00f80733          	add	a4,a6,a5
    9ce8:	00f587b3          	add	a5,a1,a5
    9cec:	0080006f          	j	9cf4 <__mcmp+0x30>
    9cf0:	02e87463          	bgeu	a6,a4,9d18 <__mcmp+0x54>
    9cf4:	ffc72603          	lw	a2,-4(a4)
    9cf8:	ffc7a683          	lw	a3,-4(a5)
    9cfc:	ffc70713          	add	a4,a4,-4
    9d00:	ffc78793          	add	a5,a5,-4
    9d04:	fed606e3          	beq	a2,a3,9cf0 <__mcmp+0x2c>
    9d08:	00100513          	li	a0,1
    9d0c:	00d67663          	bgeu	a2,a3,9d18 <__mcmp+0x54>
    9d10:	fff00513          	li	a0,-1
    9d14:	00008067          	ret
    9d18:	00008067          	ret

00009d1c <__mdiff>:
    9d1c:	0105a703          	lw	a4,16(a1)
    9d20:	01062783          	lw	a5,16(a2)
    9d24:	ff010113          	add	sp,sp,-16
    9d28:	00812423          	sw	s0,8(sp)
    9d2c:	00912223          	sw	s1,4(sp)
    9d30:	00112623          	sw	ra,12(sp)
    9d34:	01212023          	sw	s2,0(sp)
    9d38:	00058413          	mv	s0,a1
    9d3c:	00060493          	mv	s1,a2
    9d40:	40f706b3          	sub	a3,a4,a5
    9d44:	18f71e63          	bne	a4,a5,9ee0 <__mdiff+0x1c4>
    9d48:	00279693          	sll	a3,a5,0x2
    9d4c:	01458613          	add	a2,a1,20
    9d50:	01448713          	add	a4,s1,20
    9d54:	00d607b3          	add	a5,a2,a3
    9d58:	00d70733          	add	a4,a4,a3
    9d5c:	0080006f          	j	9d64 <__mdiff+0x48>
    9d60:	18f67c63          	bgeu	a2,a5,9ef8 <__mdiff+0x1dc>
    9d64:	ffc7a583          	lw	a1,-4(a5)
    9d68:	ffc72683          	lw	a3,-4(a4)
    9d6c:	ffc78793          	add	a5,a5,-4
    9d70:	ffc70713          	add	a4,a4,-4
    9d74:	fed586e3          	beq	a1,a3,9d60 <__mdiff+0x44>
    9d78:	00100913          	li	s2,1
    9d7c:	00d5ea63          	bltu	a1,a3,9d90 <__mdiff+0x74>
    9d80:	00048793          	mv	a5,s1
    9d84:	00000913          	li	s2,0
    9d88:	00040493          	mv	s1,s0
    9d8c:	00078413          	mv	s0,a5
    9d90:	0044a583          	lw	a1,4(s1)
    9d94:	d24ff0ef          	jal	92b8 <_Balloc>
    9d98:	1a050663          	beqz	a0,9f44 <__mdiff+0x228>
    9d9c:	0104a883          	lw	a7,16(s1)
    9da0:	01042283          	lw	t0,16(s0)
    9da4:	01448f93          	add	t6,s1,20
    9da8:	00289313          	sll	t1,a7,0x2
    9dac:	01440813          	add	a6,s0,20
    9db0:	00229293          	sll	t0,t0,0x2
    9db4:	01450593          	add	a1,a0,20
    9db8:	00010e37          	lui	t3,0x10
    9dbc:	01252623          	sw	s2,12(a0)
    9dc0:	006f8333          	add	t1,t6,t1
    9dc4:	005802b3          	add	t0,a6,t0
    9dc8:	00058f13          	mv	t5,a1
    9dcc:	000f8e93          	mv	t4,t6
    9dd0:	00000693          	li	a3,0
    9dd4:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    9dd8:	000ea703          	lw	a4,0(t4)
    9ddc:	00082603          	lw	a2,0(a6)
    9de0:	004f0f13          	add	t5,t5,4
    9de4:	01c777b3          	and	a5,a4,t3
    9de8:	01c673b3          	and	t2,a2,t3
    9dec:	407787b3          	sub	a5,a5,t2
    9df0:	00d787b3          	add	a5,a5,a3
    9df4:	01075713          	srl	a4,a4,0x10
    9df8:	01065613          	srl	a2,a2,0x10
    9dfc:	4107d693          	sra	a3,a5,0x10
    9e00:	40c70733          	sub	a4,a4,a2
    9e04:	00d70733          	add	a4,a4,a3
    9e08:	01071693          	sll	a3,a4,0x10
    9e0c:	01c7f7b3          	and	a5,a5,t3
    9e10:	00d7e7b3          	or	a5,a5,a3
    9e14:	00480813          	add	a6,a6,4
    9e18:	feff2e23          	sw	a5,-4(t5)
    9e1c:	004e8e93          	add	t4,t4,4
    9e20:	41075693          	sra	a3,a4,0x10
    9e24:	fa586ae3          	bltu	a6,t0,9dd8 <__mdiff+0xbc>
    9e28:	01540713          	add	a4,s0,21
    9e2c:	40828433          	sub	s0,t0,s0
    9e30:	feb40413          	add	s0,s0,-21
    9e34:	00e2b2b3          	sltu	t0,t0,a4
    9e38:	0012cf13          	xor	t5,t0,1
    9e3c:	00245413          	srl	s0,s0,0x2
    9e40:	00400713          	li	a4,4
    9e44:	0a028463          	beqz	t0,9eec <__mdiff+0x1d0>
    9e48:	00ef8fb3          	add	t6,t6,a4
    9e4c:	00e58833          	add	a6,a1,a4
    9e50:	00010eb7          	lui	t4,0x10
    9e54:	00080e13          	mv	t3,a6
    9e58:	000f8613          	mv	a2,t6
    9e5c:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    9e60:	0c6ff463          	bgeu	t6,t1,9f28 <__mdiff+0x20c>
    9e64:	00062783          	lw	a5,0(a2)
    9e68:	004e0e13          	add	t3,t3,4
    9e6c:	00460613          	add	a2,a2,4
    9e70:	01d7f733          	and	a4,a5,t4
    9e74:	00d70733          	add	a4,a4,a3
    9e78:	0107d593          	srl	a1,a5,0x10
    9e7c:	41075713          	sra	a4,a4,0x10
    9e80:	00b70733          	add	a4,a4,a1
    9e84:	00d787b3          	add	a5,a5,a3
    9e88:	01d7f7b3          	and	a5,a5,t4
    9e8c:	01071693          	sll	a3,a4,0x10
    9e90:	00d7e7b3          	or	a5,a5,a3
    9e94:	fefe2e23          	sw	a5,-4(t3)
    9e98:	41075693          	sra	a3,a4,0x10
    9e9c:	fc6664e3          	bltu	a2,t1,9e64 <__mdiff+0x148>
    9ea0:	fff30313          	add	t1,t1,-1
    9ea4:	41f30333          	sub	t1,t1,t6
    9ea8:	ffc37313          	and	t1,t1,-4
    9eac:	00680733          	add	a4,a6,t1
    9eb0:	00079a63          	bnez	a5,9ec4 <__mdiff+0x1a8>
    9eb4:	ffc72783          	lw	a5,-4(a4)
    9eb8:	fff88893          	add	a7,a7,-1
    9ebc:	ffc70713          	add	a4,a4,-4
    9ec0:	fe078ae3          	beqz	a5,9eb4 <__mdiff+0x198>
    9ec4:	00c12083          	lw	ra,12(sp)
    9ec8:	00812403          	lw	s0,8(sp)
    9ecc:	01152823          	sw	a7,16(a0)
    9ed0:	00412483          	lw	s1,4(sp)
    9ed4:	00012903          	lw	s2,0(sp)
    9ed8:	01010113          	add	sp,sp,16
    9edc:	00008067          	ret
    9ee0:	00100913          	li	s2,1
    9ee4:	e806dee3          	bgez	a3,9d80 <__mdiff+0x64>
    9ee8:	ea9ff06f          	j	9d90 <__mdiff+0x74>
    9eec:	00140713          	add	a4,s0,1
    9ef0:	00271713          	sll	a4,a4,0x2
    9ef4:	f55ff06f          	j	9e48 <__mdiff+0x12c>
    9ef8:	00000593          	li	a1,0
    9efc:	bbcff0ef          	jal	92b8 <_Balloc>
    9f00:	06050063          	beqz	a0,9f60 <__mdiff+0x244>
    9f04:	00c12083          	lw	ra,12(sp)
    9f08:	00812403          	lw	s0,8(sp)
    9f0c:	00100793          	li	a5,1
    9f10:	00f52823          	sw	a5,16(a0)
    9f14:	00052a23          	sw	zero,20(a0)
    9f18:	00412483          	lw	s1,4(sp)
    9f1c:	00012903          	lw	s2,0(sp)
    9f20:	01010113          	add	sp,sp,16
    9f24:	00008067          	ret
    9f28:	00000713          	li	a4,0
    9f2c:	000f1663          	bnez	t5,9f38 <__mdiff+0x21c>
    9f30:	00e58733          	add	a4,a1,a4
    9f34:	f7dff06f          	j	9eb0 <__mdiff+0x194>
    9f38:	00241713          	sll	a4,s0,0x2
    9f3c:	00e58733          	add	a4,a1,a4
    9f40:	f71ff06f          	j	9eb0 <__mdiff+0x194>
    9f44:	00005697          	auipc	a3,0x5
    9f48:	f4868693          	add	a3,a3,-184 # ee8c <__fini_array_end+0x2e0>
    9f4c:	00000613          	li	a2,0
    9f50:	24500593          	li	a1,581
    9f54:	00005517          	auipc	a0,0x5
    9f58:	fcc50513          	add	a0,a0,-52 # ef20 <__fini_array_end+0x374>
    9f5c:	511000ef          	jal	ac6c <__assert_func>
    9f60:	00005697          	auipc	a3,0x5
    9f64:	f2c68693          	add	a3,a3,-212 # ee8c <__fini_array_end+0x2e0>
    9f68:	00000613          	li	a2,0
    9f6c:	23700593          	li	a1,567
    9f70:	00005517          	auipc	a0,0x5
    9f74:	fb050513          	add	a0,a0,-80 # ef20 <__fini_array_end+0x374>
    9f78:	4f5000ef          	jal	ac6c <__assert_func>

00009f7c <__d2b>:
    9f7c:	fd010113          	add	sp,sp,-48
    9f80:	01512a23          	sw	s5,20(sp)
    9f84:	00058a93          	mv	s5,a1
    9f88:	00100593          	li	a1,1
    9f8c:	02912223          	sw	s1,36(sp)
    9f90:	01312e23          	sw	s3,28(sp)
    9f94:	01412c23          	sw	s4,24(sp)
    9f98:	02112623          	sw	ra,44(sp)
    9f9c:	02812423          	sw	s0,40(sp)
    9fa0:	03212023          	sw	s2,32(sp)
    9fa4:	00060493          	mv	s1,a2
    9fa8:	00068a13          	mv	s4,a3
    9fac:	00070993          	mv	s3,a4
    9fb0:	b08ff0ef          	jal	92b8 <_Balloc>
    9fb4:	10050263          	beqz	a0,a0b8 <__d2b+0x13c>
    9fb8:	00100737          	lui	a4,0x100
    9fbc:	0144d913          	srl	s2,s1,0x14
    9fc0:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    9fc4:	7ff97913          	and	s2,s2,2047
    9fc8:	00050413          	mv	s0,a0
    9fcc:	0097f7b3          	and	a5,a5,s1
    9fd0:	00090463          	beqz	s2,9fd8 <__d2b+0x5c>
    9fd4:	00e7e7b3          	or	a5,a5,a4
    9fd8:	00f12623          	sw	a5,12(sp)
    9fdc:	060a9263          	bnez	s5,a040 <__d2b+0xc4>
    9fe0:	00c10513          	add	a0,sp,12
    9fe4:	da8ff0ef          	jal	958c <__lo0bits>
    9fe8:	00c12703          	lw	a4,12(sp)
    9fec:	00100493          	li	s1,1
    9ff0:	00942823          	sw	s1,16(s0)
    9ff4:	00e42a23          	sw	a4,20(s0)
    9ff8:	02050793          	add	a5,a0,32
    9ffc:	08090863          	beqz	s2,a08c <__d2b+0x110>
    a000:	bcd90913          	add	s2,s2,-1075
    a004:	00f90933          	add	s2,s2,a5
    a008:	03500493          	li	s1,53
    a00c:	012a2023          	sw	s2,0(s4)
    a010:	40f48533          	sub	a0,s1,a5
    a014:	00a9a023          	sw	a0,0(s3)
    a018:	02c12083          	lw	ra,44(sp)
    a01c:	00040513          	mv	a0,s0
    a020:	02812403          	lw	s0,40(sp)
    a024:	02412483          	lw	s1,36(sp)
    a028:	02012903          	lw	s2,32(sp)
    a02c:	01c12983          	lw	s3,28(sp)
    a030:	01812a03          	lw	s4,24(sp)
    a034:	01412a83          	lw	s5,20(sp)
    a038:	03010113          	add	sp,sp,48
    a03c:	00008067          	ret
    a040:	00810513          	add	a0,sp,8
    a044:	01512423          	sw	s5,8(sp)
    a048:	d44ff0ef          	jal	958c <__lo0bits>
    a04c:	00c12703          	lw	a4,12(sp)
    a050:	00050793          	mv	a5,a0
    a054:	04050e63          	beqz	a0,a0b0 <__d2b+0x134>
    a058:	00812603          	lw	a2,8(sp)
    a05c:	02000693          	li	a3,32
    a060:	40a686b3          	sub	a3,a3,a0
    a064:	00d716b3          	sll	a3,a4,a3
    a068:	00a75733          	srl	a4,a4,a0
    a06c:	00c6e6b3          	or	a3,a3,a2
    a070:	00e12623          	sw	a4,12(sp)
    a074:	00e034b3          	snez	s1,a4
    a078:	00148493          	add	s1,s1,1
    a07c:	00d42a23          	sw	a3,20(s0)
    a080:	00e42c23          	sw	a4,24(s0)
    a084:	00942823          	sw	s1,16(s0)
    a088:	f6091ce3          	bnez	s2,a000 <__d2b+0x84>
    a08c:	00249713          	sll	a4,s1,0x2
    a090:	00e40733          	add	a4,s0,a4
    a094:	01072503          	lw	a0,16(a4)
    a098:	bce78793          	add	a5,a5,-1074
    a09c:	00fa2023          	sw	a5,0(s4)
    a0a0:	c74ff0ef          	jal	9514 <__hi0bits>
    a0a4:	00549493          	sll	s1,s1,0x5
    a0a8:	40a48533          	sub	a0,s1,a0
    a0ac:	f69ff06f          	j	a014 <__d2b+0x98>
    a0b0:	00812683          	lw	a3,8(sp)
    a0b4:	fc1ff06f          	j	a074 <__d2b+0xf8>
    a0b8:	00005697          	auipc	a3,0x5
    a0bc:	dd468693          	add	a3,a3,-556 # ee8c <__fini_array_end+0x2e0>
    a0c0:	00000613          	li	a2,0
    a0c4:	30f00593          	li	a1,783
    a0c8:	00005517          	auipc	a0,0x5
    a0cc:	e5850513          	add	a0,a0,-424 # ef20 <__fini_array_end+0x374>
    a0d0:	39d000ef          	jal	ac6c <__assert_func>

0000a0d4 <_realloc_r>:
    a0d4:	fd010113          	add	sp,sp,-48
    a0d8:	02912223          	sw	s1,36(sp)
    a0dc:	02112623          	sw	ra,44(sp)
    a0e0:	00060493          	mv	s1,a2
    a0e4:	1e058863          	beqz	a1,a2d4 <_realloc_r+0x200>
    a0e8:	02812423          	sw	s0,40(sp)
    a0ec:	03212023          	sw	s2,32(sp)
    a0f0:	00058413          	mv	s0,a1
    a0f4:	01312e23          	sw	s3,28(sp)
    a0f8:	01512a23          	sw	s5,20(sp)
    a0fc:	01412c23          	sw	s4,24(sp)
    a100:	00050913          	mv	s2,a0
    a104:	b3df70ef          	jal	1c40 <__malloc_lock>
    a108:	ffc42703          	lw	a4,-4(s0)
    a10c:	00b48793          	add	a5,s1,11
    a110:	01600693          	li	a3,22
    a114:	ff840a93          	add	s5,s0,-8
    a118:	ffc77993          	and	s3,a4,-4
    a11c:	10f6f263          	bgeu	a3,a5,a220 <_realloc_r+0x14c>
    a120:	ff87fa13          	and	s4,a5,-8
    a124:	1007c263          	bltz	a5,a228 <_realloc_r+0x154>
    a128:	109a6063          	bltu	s4,s1,a228 <_realloc_r+0x154>
    a12c:	1349d263          	bge	s3,s4,a250 <_realloc_r+0x17c>
    a130:	01812423          	sw	s8,8(sp)
    a134:	7fff6c17          	auipc	s8,0x7fff6
    a138:	fecc0c13          	add	s8,s8,-20 # 80000120 <__malloc_av_>
    a13c:	008c2603          	lw	a2,8(s8)
    a140:	013a86b3          	add	a3,s5,s3
    a144:	0046a783          	lw	a5,4(a3)
    a148:	1cd60863          	beq	a2,a3,a318 <_realloc_r+0x244>
    a14c:	ffe7f613          	and	a2,a5,-2
    a150:	00c68633          	add	a2,a3,a2
    a154:	00462603          	lw	a2,4(a2)
    a158:	00167613          	and	a2,a2,1
    a15c:	14061a63          	bnez	a2,a2b0 <_realloc_r+0x1dc>
    a160:	ffc7f793          	and	a5,a5,-4
    a164:	00f98633          	add	a2,s3,a5
    a168:	0d465863          	bge	a2,s4,a238 <_realloc_r+0x164>
    a16c:	00177713          	and	a4,a4,1
    a170:	02071c63          	bnez	a4,a1a8 <_realloc_r+0xd4>
    a174:	01712623          	sw	s7,12(sp)
    a178:	ff842b83          	lw	s7,-8(s0)
    a17c:	01612823          	sw	s6,16(sp)
    a180:	417a8bb3          	sub	s7,s5,s7
    a184:	004ba703          	lw	a4,4(s7)
    a188:	ffc77713          	and	a4,a4,-4
    a18c:	00e787b3          	add	a5,a5,a4
    a190:	01378b33          	add	s6,a5,s3
    a194:	334b5c63          	bge	s6,s4,a4cc <_realloc_r+0x3f8>
    a198:	00e98b33          	add	s6,s3,a4
    a19c:	294b5863          	bge	s6,s4,a42c <_realloc_r+0x358>
    a1a0:	01012b03          	lw	s6,16(sp)
    a1a4:	00c12b83          	lw	s7,12(sp)
    a1a8:	00048593          	mv	a1,s1
    a1ac:	00090513          	mv	a0,s2
    a1b0:	ab0f70ef          	jal	1460 <_malloc_r>
    a1b4:	00050493          	mv	s1,a0
    a1b8:	40050863          	beqz	a0,a5c8 <_realloc_r+0x4f4>
    a1bc:	ffc42783          	lw	a5,-4(s0)
    a1c0:	ff850713          	add	a4,a0,-8
    a1c4:	ffe7f793          	and	a5,a5,-2
    a1c8:	00fa87b3          	add	a5,s5,a5
    a1cc:	24e78663          	beq	a5,a4,a418 <_realloc_r+0x344>
    a1d0:	ffc98613          	add	a2,s3,-4
    a1d4:	02400793          	li	a5,36
    a1d8:	2ec7e463          	bltu	a5,a2,a4c0 <_realloc_r+0x3ec>
    a1dc:	01300713          	li	a4,19
    a1e0:	20c76a63          	bltu	a4,a2,a3f4 <_realloc_r+0x320>
    a1e4:	00050793          	mv	a5,a0
    a1e8:	00040713          	mv	a4,s0
    a1ec:	00072683          	lw	a3,0(a4)
    a1f0:	00d7a023          	sw	a3,0(a5)
    a1f4:	00472683          	lw	a3,4(a4)
    a1f8:	00d7a223          	sw	a3,4(a5)
    a1fc:	00872703          	lw	a4,8(a4)
    a200:	00e7a423          	sw	a4,8(a5)
    a204:	00040593          	mv	a1,s0
    a208:	00090513          	mv	a0,s2
    a20c:	f49f60ef          	jal	1154 <_free_r>
    a210:	00090513          	mv	a0,s2
    a214:	a39f70ef          	jal	1c4c <__malloc_unlock>
    a218:	00812c03          	lw	s8,8(sp)
    a21c:	06c0006f          	j	a288 <_realloc_r+0x1b4>
    a220:	01000a13          	li	s4,16
    a224:	f09a74e3          	bgeu	s4,s1,a12c <_realloc_r+0x58>
    a228:	00c00793          	li	a5,12
    a22c:	00f92023          	sw	a5,0(s2)
    a230:	00000493          	li	s1,0
    a234:	0540006f          	j	a288 <_realloc_r+0x1b4>
    a238:	00c6a783          	lw	a5,12(a3)
    a23c:	0086a703          	lw	a4,8(a3)
    a240:	00812c03          	lw	s8,8(sp)
    a244:	00060993          	mv	s3,a2
    a248:	00f72623          	sw	a5,12(a4)
    a24c:	00e7a423          	sw	a4,8(a5)
    a250:	004aa783          	lw	a5,4(s5)
    a254:	414986b3          	sub	a3,s3,s4
    a258:	00f00613          	li	a2,15
    a25c:	0017f793          	and	a5,a5,1
    a260:	013a8733          	add	a4,s5,s3
    a264:	08d66263          	bltu	a2,a3,a2e8 <_realloc_r+0x214>
    a268:	0137e7b3          	or	a5,a5,s3
    a26c:	00faa223          	sw	a5,4(s5)
    a270:	00472783          	lw	a5,4(a4)
    a274:	0017e793          	or	a5,a5,1
    a278:	00f72223          	sw	a5,4(a4)
    a27c:	00090513          	mv	a0,s2
    a280:	9cdf70ef          	jal	1c4c <__malloc_unlock>
    a284:	00040493          	mv	s1,s0
    a288:	02812403          	lw	s0,40(sp)
    a28c:	02c12083          	lw	ra,44(sp)
    a290:	02012903          	lw	s2,32(sp)
    a294:	01c12983          	lw	s3,28(sp)
    a298:	01812a03          	lw	s4,24(sp)
    a29c:	01412a83          	lw	s5,20(sp)
    a2a0:	00048513          	mv	a0,s1
    a2a4:	02412483          	lw	s1,36(sp)
    a2a8:	03010113          	add	sp,sp,48
    a2ac:	00008067          	ret
    a2b0:	00177713          	and	a4,a4,1
    a2b4:	ee071ae3          	bnez	a4,a1a8 <_realloc_r+0xd4>
    a2b8:	01712623          	sw	s7,12(sp)
    a2bc:	ff842b83          	lw	s7,-8(s0)
    a2c0:	01612823          	sw	s6,16(sp)
    a2c4:	417a8bb3          	sub	s7,s5,s7
    a2c8:	004ba703          	lw	a4,4(s7)
    a2cc:	ffc77713          	and	a4,a4,-4
    a2d0:	ec9ff06f          	j	a198 <_realloc_r+0xc4>
    a2d4:	02c12083          	lw	ra,44(sp)
    a2d8:	02412483          	lw	s1,36(sp)
    a2dc:	00060593          	mv	a1,a2
    a2e0:	03010113          	add	sp,sp,48
    a2e4:	97cf706f          	j	1460 <_malloc_r>
    a2e8:	0147e7b3          	or	a5,a5,s4
    a2ec:	00faa223          	sw	a5,4(s5)
    a2f0:	014a85b3          	add	a1,s5,s4
    a2f4:	0016e693          	or	a3,a3,1
    a2f8:	00d5a223          	sw	a3,4(a1)
    a2fc:	00472783          	lw	a5,4(a4)
    a300:	00858593          	add	a1,a1,8
    a304:	00090513          	mv	a0,s2
    a308:	0017e793          	or	a5,a5,1
    a30c:	00f72223          	sw	a5,4(a4)
    a310:	e45f60ef          	jal	1154 <_free_r>
    a314:	f69ff06f          	j	a27c <_realloc_r+0x1a8>
    a318:	ffc7f793          	and	a5,a5,-4
    a31c:	013786b3          	add	a3,a5,s3
    a320:	010a0613          	add	a2,s4,16
    a324:	26c6d063          	bge	a3,a2,a584 <_realloc_r+0x4b0>
    a328:	00177713          	and	a4,a4,1
    a32c:	e6071ee3          	bnez	a4,a1a8 <_realloc_r+0xd4>
    a330:	01712623          	sw	s7,12(sp)
    a334:	ff842b83          	lw	s7,-8(s0)
    a338:	01612823          	sw	s6,16(sp)
    a33c:	417a8bb3          	sub	s7,s5,s7
    a340:	004ba703          	lw	a4,4(s7)
    a344:	ffc77713          	and	a4,a4,-4
    a348:	00e787b3          	add	a5,a5,a4
    a34c:	01378b33          	add	s6,a5,s3
    a350:	e4cb44e3          	blt	s6,a2,a198 <_realloc_r+0xc4>
    a354:	00cba783          	lw	a5,12(s7)
    a358:	008ba703          	lw	a4,8(s7)
    a35c:	ffc98613          	add	a2,s3,-4
    a360:	02400693          	li	a3,36
    a364:	00f72623          	sw	a5,12(a4)
    a368:	00e7a423          	sw	a4,8(a5)
    a36c:	008b8493          	add	s1,s7,8
    a370:	28c6e463          	bltu	a3,a2,a5f8 <_realloc_r+0x524>
    a374:	01300713          	li	a4,19
    a378:	00048793          	mv	a5,s1
    a37c:	02c77263          	bgeu	a4,a2,a3a0 <_realloc_r+0x2cc>
    a380:	00042703          	lw	a4,0(s0)
    a384:	01b00793          	li	a5,27
    a388:	00eba423          	sw	a4,8(s7)
    a38c:	00442703          	lw	a4,4(s0)
    a390:	00eba623          	sw	a4,12(s7)
    a394:	26c7ea63          	bltu	a5,a2,a608 <_realloc_r+0x534>
    a398:	00840413          	add	s0,s0,8
    a39c:	010b8793          	add	a5,s7,16
    a3a0:	00042703          	lw	a4,0(s0)
    a3a4:	00e7a023          	sw	a4,0(a5)
    a3a8:	00442703          	lw	a4,4(s0)
    a3ac:	00e7a223          	sw	a4,4(a5)
    a3b0:	00842703          	lw	a4,8(s0)
    a3b4:	00e7a423          	sw	a4,8(a5)
    a3b8:	014b8733          	add	a4,s7,s4
    a3bc:	414b07b3          	sub	a5,s6,s4
    a3c0:	00ec2423          	sw	a4,8(s8)
    a3c4:	0017e793          	or	a5,a5,1
    a3c8:	00f72223          	sw	a5,4(a4)
    a3cc:	004ba783          	lw	a5,4(s7)
    a3d0:	00090513          	mv	a0,s2
    a3d4:	0017f793          	and	a5,a5,1
    a3d8:	0147e7b3          	or	a5,a5,s4
    a3dc:	00fba223          	sw	a5,4(s7)
    a3e0:	86df70ef          	jal	1c4c <__malloc_unlock>
    a3e4:	01012b03          	lw	s6,16(sp)
    a3e8:	00c12b83          	lw	s7,12(sp)
    a3ec:	00812c03          	lw	s8,8(sp)
    a3f0:	e99ff06f          	j	a288 <_realloc_r+0x1b4>
    a3f4:	00042683          	lw	a3,0(s0)
    a3f8:	01b00713          	li	a4,27
    a3fc:	00d52023          	sw	a3,0(a0)
    a400:	00442683          	lw	a3,4(s0)
    a404:	00d52223          	sw	a3,4(a0)
    a408:	14c76e63          	bltu	a4,a2,a564 <_realloc_r+0x490>
    a40c:	00840713          	add	a4,s0,8
    a410:	00850793          	add	a5,a0,8
    a414:	dd9ff06f          	j	a1ec <_realloc_r+0x118>
    a418:	ffc52783          	lw	a5,-4(a0)
    a41c:	00812c03          	lw	s8,8(sp)
    a420:	ffc7f793          	and	a5,a5,-4
    a424:	00f989b3          	add	s3,s3,a5
    a428:	e29ff06f          	j	a250 <_realloc_r+0x17c>
    a42c:	00cba783          	lw	a5,12(s7)
    a430:	008ba703          	lw	a4,8(s7)
    a434:	ffc98613          	add	a2,s3,-4
    a438:	02400693          	li	a3,36
    a43c:	00f72623          	sw	a5,12(a4)
    a440:	00e7a423          	sw	a4,8(a5)
    a444:	008b8493          	add	s1,s7,8
    a448:	10c6e663          	bltu	a3,a2,a554 <_realloc_r+0x480>
    a44c:	01300713          	li	a4,19
    a450:	00048793          	mv	a5,s1
    a454:	02c77c63          	bgeu	a4,a2,a48c <_realloc_r+0x3b8>
    a458:	00042703          	lw	a4,0(s0)
    a45c:	01b00793          	li	a5,27
    a460:	00eba423          	sw	a4,8(s7)
    a464:	00442703          	lw	a4,4(s0)
    a468:	00eba623          	sw	a4,12(s7)
    a46c:	14c7f863          	bgeu	a5,a2,a5bc <_realloc_r+0x4e8>
    a470:	00842783          	lw	a5,8(s0)
    a474:	00fba823          	sw	a5,16(s7)
    a478:	00c42783          	lw	a5,12(s0)
    a47c:	00fbaa23          	sw	a5,20(s7)
    a480:	0ad60c63          	beq	a2,a3,a538 <_realloc_r+0x464>
    a484:	01040413          	add	s0,s0,16
    a488:	018b8793          	add	a5,s7,24
    a48c:	00042703          	lw	a4,0(s0)
    a490:	00e7a023          	sw	a4,0(a5)
    a494:	00442703          	lw	a4,4(s0)
    a498:	00e7a223          	sw	a4,4(a5)
    a49c:	00842703          	lw	a4,8(s0)
    a4a0:	00e7a423          	sw	a4,8(a5)
    a4a4:	000b0993          	mv	s3,s6
    a4a8:	000b8a93          	mv	s5,s7
    a4ac:	01012b03          	lw	s6,16(sp)
    a4b0:	00c12b83          	lw	s7,12(sp)
    a4b4:	00812c03          	lw	s8,8(sp)
    a4b8:	00048413          	mv	s0,s1
    a4bc:	d95ff06f          	j	a250 <_realloc_r+0x17c>
    a4c0:	00040593          	mv	a1,s0
    a4c4:	ae8fd0ef          	jal	77ac <memmove>
    a4c8:	d3dff06f          	j	a204 <_realloc_r+0x130>
    a4cc:	00c6a783          	lw	a5,12(a3)
    a4d0:	0086a703          	lw	a4,8(a3)
    a4d4:	ffc98613          	add	a2,s3,-4
    a4d8:	02400693          	li	a3,36
    a4dc:	00f72623          	sw	a5,12(a4)
    a4e0:	00e7a423          	sw	a4,8(a5)
    a4e4:	008ba703          	lw	a4,8(s7)
    a4e8:	00cba783          	lw	a5,12(s7)
    a4ec:	008b8493          	add	s1,s7,8
    a4f0:	00f72623          	sw	a5,12(a4)
    a4f4:	00e7a423          	sw	a4,8(a5)
    a4f8:	04c6ee63          	bltu	a3,a2,a554 <_realloc_r+0x480>
    a4fc:	01300713          	li	a4,19
    a500:	00048793          	mv	a5,s1
    a504:	f8c774e3          	bgeu	a4,a2,a48c <_realloc_r+0x3b8>
    a508:	00042703          	lw	a4,0(s0)
    a50c:	01b00793          	li	a5,27
    a510:	00eba423          	sw	a4,8(s7)
    a514:	00442703          	lw	a4,4(s0)
    a518:	00eba623          	sw	a4,12(s7)
    a51c:	0ac7f063          	bgeu	a5,a2,a5bc <_realloc_r+0x4e8>
    a520:	00842703          	lw	a4,8(s0)
    a524:	02400793          	li	a5,36
    a528:	00eba823          	sw	a4,16(s7)
    a52c:	00c42703          	lw	a4,12(s0)
    a530:	00ebaa23          	sw	a4,20(s7)
    a534:	f4f618e3          	bne	a2,a5,a484 <_realloc_r+0x3b0>
    a538:	01042703          	lw	a4,16(s0)
    a53c:	020b8793          	add	a5,s7,32
    a540:	01840413          	add	s0,s0,24
    a544:	00ebac23          	sw	a4,24(s7)
    a548:	ffc42703          	lw	a4,-4(s0)
    a54c:	00ebae23          	sw	a4,28(s7)
    a550:	f3dff06f          	j	a48c <_realloc_r+0x3b8>
    a554:	00040593          	mv	a1,s0
    a558:	00048513          	mv	a0,s1
    a55c:	a50fd0ef          	jal	77ac <memmove>
    a560:	f45ff06f          	j	a4a4 <_realloc_r+0x3d0>
    a564:	00842703          	lw	a4,8(s0)
    a568:	00e52423          	sw	a4,8(a0)
    a56c:	00c42703          	lw	a4,12(s0)
    a570:	00e52623          	sw	a4,12(a0)
    a574:	06f60463          	beq	a2,a5,a5dc <_realloc_r+0x508>
    a578:	01040713          	add	a4,s0,16
    a57c:	01050793          	add	a5,a0,16
    a580:	c6dff06f          	j	a1ec <_realloc_r+0x118>
    a584:	014a8ab3          	add	s5,s5,s4
    a588:	414687b3          	sub	a5,a3,s4
    a58c:	015c2423          	sw	s5,8(s8)
    a590:	0017e793          	or	a5,a5,1
    a594:	00faa223          	sw	a5,4(s5)
    a598:	ffc42783          	lw	a5,-4(s0)
    a59c:	00090513          	mv	a0,s2
    a5a0:	00040493          	mv	s1,s0
    a5a4:	0017f793          	and	a5,a5,1
    a5a8:	0147e7b3          	or	a5,a5,s4
    a5ac:	fef42e23          	sw	a5,-4(s0)
    a5b0:	e9cf70ef          	jal	1c4c <__malloc_unlock>
    a5b4:	00812c03          	lw	s8,8(sp)
    a5b8:	cd1ff06f          	j	a288 <_realloc_r+0x1b4>
    a5bc:	00840413          	add	s0,s0,8
    a5c0:	010b8793          	add	a5,s7,16
    a5c4:	ec9ff06f          	j	a48c <_realloc_r+0x3b8>
    a5c8:	00090513          	mv	a0,s2
    a5cc:	e80f70ef          	jal	1c4c <__malloc_unlock>
    a5d0:	00000493          	li	s1,0
    a5d4:	00812c03          	lw	s8,8(sp)
    a5d8:	cb1ff06f          	j	a288 <_realloc_r+0x1b4>
    a5dc:	01042683          	lw	a3,16(s0)
    a5e0:	01840713          	add	a4,s0,24
    a5e4:	01850793          	add	a5,a0,24
    a5e8:	00d52823          	sw	a3,16(a0)
    a5ec:	01442683          	lw	a3,20(s0)
    a5f0:	00d52a23          	sw	a3,20(a0)
    a5f4:	bf9ff06f          	j	a1ec <_realloc_r+0x118>
    a5f8:	00040593          	mv	a1,s0
    a5fc:	00048513          	mv	a0,s1
    a600:	9acfd0ef          	jal	77ac <memmove>
    a604:	db5ff06f          	j	a3b8 <_realloc_r+0x2e4>
    a608:	00842783          	lw	a5,8(s0)
    a60c:	00fba823          	sw	a5,16(s7)
    a610:	00c42783          	lw	a5,12(s0)
    a614:	00fbaa23          	sw	a5,20(s7)
    a618:	00d60863          	beq	a2,a3,a628 <_realloc_r+0x554>
    a61c:	01040413          	add	s0,s0,16
    a620:	018b8793          	add	a5,s7,24
    a624:	d7dff06f          	j	a3a0 <_realloc_r+0x2cc>
    a628:	01042703          	lw	a4,16(s0)
    a62c:	020b8793          	add	a5,s7,32
    a630:	01840413          	add	s0,s0,24
    a634:	00ebac23          	sw	a4,24(s7)
    a638:	ffc42703          	lw	a4,-4(s0)
    a63c:	00ebae23          	sw	a4,28(s7)
    a640:	d61ff06f          	j	a3a0 <_realloc_r+0x2cc>

0000a644 <__ascii_wctomb>:
    a644:	02058463          	beqz	a1,a66c <__ascii_wctomb+0x28>
    a648:	0ff00793          	li	a5,255
    a64c:	00c7e863          	bltu	a5,a2,a65c <__ascii_wctomb+0x18>
    a650:	00c58023          	sb	a2,0(a1)
    a654:	00100513          	li	a0,1
    a658:	00008067          	ret
    a65c:	08a00793          	li	a5,138
    a660:	00f52023          	sw	a5,0(a0)
    a664:	fff00513          	li	a0,-1
    a668:	00008067          	ret
    a66c:	00000513          	li	a0,0
    a670:	00008067          	ret

0000a674 <_wcrtomb_r>:
    a674:	fe010113          	add	sp,sp,-32
    a678:	00812c23          	sw	s0,24(sp)
    a67c:	00912a23          	sw	s1,20(sp)
    a680:	00112e23          	sw	ra,28(sp)
    a684:	00050493          	mv	s1,a0
    a688:	10450413          	add	s0,a0,260
    a68c:	00068463          	beqz	a3,a694 <_wcrtomb_r+0x20>
    a690:	00068413          	mv	s0,a3
    a694:	7fff6797          	auipc	a5,0x7fff6
    a698:	f807a783          	lw	a5,-128(a5) # 80000614 <__global_locale+0xe0>
    a69c:	00040693          	mv	a3,s0
    a6a0:	02058463          	beqz	a1,a6c8 <_wcrtomb_r+0x54>
    a6a4:	00048513          	mv	a0,s1
    a6a8:	000780e7          	jalr	a5
    a6ac:	fff00793          	li	a5,-1
    a6b0:	02f50863          	beq	a0,a5,a6e0 <_wcrtomb_r+0x6c>
    a6b4:	01c12083          	lw	ra,28(sp)
    a6b8:	01812403          	lw	s0,24(sp)
    a6bc:	01412483          	lw	s1,20(sp)
    a6c0:	02010113          	add	sp,sp,32
    a6c4:	00008067          	ret
    a6c8:	00000613          	li	a2,0
    a6cc:	00410593          	add	a1,sp,4
    a6d0:	00048513          	mv	a0,s1
    a6d4:	000780e7          	jalr	a5
    a6d8:	fff00793          	li	a5,-1
    a6dc:	fcf51ce3          	bne	a0,a5,a6b4 <_wcrtomb_r+0x40>
    a6e0:	00042023          	sw	zero,0(s0)
    a6e4:	01c12083          	lw	ra,28(sp)
    a6e8:	01812403          	lw	s0,24(sp)
    a6ec:	08a00793          	li	a5,138
    a6f0:	00f4a023          	sw	a5,0(s1)
    a6f4:	01412483          	lw	s1,20(sp)
    a6f8:	02010113          	add	sp,sp,32
    a6fc:	00008067          	ret

0000a700 <_wcsrtombs_r>:
    a700:	00070793          	mv	a5,a4
    a704:	00068713          	mv	a4,a3
    a708:	fff00693          	li	a3,-1
    a70c:	1350006f          	j	b040 <_wcsnrtombs_r>

0000a710 <_fclose_r>:
    a710:	ff010113          	add	sp,sp,-16
    a714:	00112623          	sw	ra,12(sp)
    a718:	01212023          	sw	s2,0(sp)
    a71c:	0e058263          	beqz	a1,a800 <_fclose_r+0xf0>
    a720:	00812423          	sw	s0,8(sp)
    a724:	00912223          	sw	s1,4(sp)
    a728:	00058413          	mv	s0,a1
    a72c:	00050493          	mv	s1,a0
    a730:	00050663          	beqz	a0,a73c <_fclose_r+0x2c>
    a734:	03452783          	lw	a5,52(a0)
    a738:	10078063          	beqz	a5,a838 <_fclose_r+0x128>
    a73c:	06442783          	lw	a5,100(s0)
    a740:	00c41703          	lh	a4,12(s0)
    a744:	0017f793          	and	a5,a5,1
    a748:	0a079663          	bnez	a5,a7f4 <_fclose_r+0xe4>
    a74c:	20077713          	and	a4,a4,512
    a750:	0e070863          	beqz	a4,a840 <_fclose_r+0x130>
    a754:	00040593          	mv	a1,s0
    a758:	00048513          	mv	a0,s1
    a75c:	c81fb0ef          	jal	63dc <__sflush_r>
    a760:	02c42783          	lw	a5,44(s0)
    a764:	00050913          	mv	s2,a0
    a768:	00078a63          	beqz	a5,a77c <_fclose_r+0x6c>
    a76c:	01c42583          	lw	a1,28(s0)
    a770:	00048513          	mv	a0,s1
    a774:	000780e7          	jalr	a5
    a778:	0a054063          	bltz	a0,a818 <_fclose_r+0x108>
    a77c:	00c45783          	lhu	a5,12(s0)
    a780:	0807f793          	and	a5,a5,128
    a784:	0a079263          	bnez	a5,a828 <_fclose_r+0x118>
    a788:	03042583          	lw	a1,48(s0)
    a78c:	00058c63          	beqz	a1,a7a4 <_fclose_r+0x94>
    a790:	04040793          	add	a5,s0,64
    a794:	00f58663          	beq	a1,a5,a7a0 <_fclose_r+0x90>
    a798:	00048513          	mv	a0,s1
    a79c:	9b9f60ef          	jal	1154 <_free_r>
    a7a0:	02042823          	sw	zero,48(s0)
    a7a4:	04442583          	lw	a1,68(s0)
    a7a8:	00058863          	beqz	a1,a7b8 <_fclose_r+0xa8>
    a7ac:	00048513          	mv	a0,s1
    a7b0:	9a5f60ef          	jal	1154 <_free_r>
    a7b4:	04042223          	sw	zero,68(s0)
    a7b8:	9dcfc0ef          	jal	6994 <__sfp_lock_acquire>
    a7bc:	06442783          	lw	a5,100(s0)
    a7c0:	00041623          	sh	zero,12(s0)
    a7c4:	0017f793          	and	a5,a5,1
    a7c8:	0a078663          	beqz	a5,a874 <_fclose_r+0x164>
    a7cc:	05842503          	lw	a0,88(s0)
    a7d0:	d28f60ef          	jal	cf8 <__retarget_lock_close_recursive>
    a7d4:	9ccfc0ef          	jal	69a0 <__sfp_lock_release>
    a7d8:	00c12083          	lw	ra,12(sp)
    a7dc:	00812403          	lw	s0,8(sp)
    a7e0:	00412483          	lw	s1,4(sp)
    a7e4:	00090513          	mv	a0,s2
    a7e8:	00012903          	lw	s2,0(sp)
    a7ec:	01010113          	add	sp,sp,16
    a7f0:	00008067          	ret
    a7f4:	f60710e3          	bnez	a4,a754 <_fclose_r+0x44>
    a7f8:	00812403          	lw	s0,8(sp)
    a7fc:	00412483          	lw	s1,4(sp)
    a800:	00000913          	li	s2,0
    a804:	00c12083          	lw	ra,12(sp)
    a808:	00090513          	mv	a0,s2
    a80c:	00012903          	lw	s2,0(sp)
    a810:	01010113          	add	sp,sp,16
    a814:	00008067          	ret
    a818:	00c45783          	lhu	a5,12(s0)
    a81c:	fff00913          	li	s2,-1
    a820:	0807f793          	and	a5,a5,128
    a824:	f60782e3          	beqz	a5,a788 <_fclose_r+0x78>
    a828:	01042583          	lw	a1,16(s0)
    a82c:	00048513          	mv	a0,s1
    a830:	925f60ef          	jal	1154 <_free_r>
    a834:	f55ff06f          	j	a788 <_fclose_r+0x78>
    a838:	8ecfc0ef          	jal	6924 <__sinit>
    a83c:	f01ff06f          	j	a73c <_fclose_r+0x2c>
    a840:	05842503          	lw	a0,88(s0)
    a844:	cb8f60ef          	jal	cfc <__retarget_lock_acquire_recursive>
    a848:	00c41783          	lh	a5,12(s0)
    a84c:	f00794e3          	bnez	a5,a754 <_fclose_r+0x44>
    a850:	06442783          	lw	a5,100(s0)
    a854:	0017f793          	and	a5,a5,1
    a858:	fa0790e3          	bnez	a5,a7f8 <_fclose_r+0xe8>
    a85c:	05842503          	lw	a0,88(s0)
    a860:	00000913          	li	s2,0
    a864:	c9cf60ef          	jal	d00 <__retarget_lock_release_recursive>
    a868:	00812403          	lw	s0,8(sp)
    a86c:	00412483          	lw	s1,4(sp)
    a870:	f95ff06f          	j	a804 <_fclose_r+0xf4>
    a874:	05842503          	lw	a0,88(s0)
    a878:	c88f60ef          	jal	d00 <__retarget_lock_release_recursive>
    a87c:	f51ff06f          	j	a7cc <_fclose_r+0xbc>

0000a880 <__smakebuf_r>:
    a880:	00c59783          	lh	a5,12(a1)
    a884:	f8010113          	add	sp,sp,-128
    a888:	06812c23          	sw	s0,120(sp)
    a88c:	06112e23          	sw	ra,124(sp)
    a890:	0027f713          	and	a4,a5,2
    a894:	00058413          	mv	s0,a1
    a898:	02070463          	beqz	a4,a8c0 <__smakebuf_r+0x40>
    a89c:	04358793          	add	a5,a1,67
    a8a0:	00f5a023          	sw	a5,0(a1)
    a8a4:	00f5a823          	sw	a5,16(a1)
    a8a8:	00100793          	li	a5,1
    a8ac:	00f5aa23          	sw	a5,20(a1)
    a8b0:	07c12083          	lw	ra,124(sp)
    a8b4:	07812403          	lw	s0,120(sp)
    a8b8:	08010113          	add	sp,sp,128
    a8bc:	00008067          	ret
    a8c0:	00e59583          	lh	a1,14(a1)
    a8c4:	06912a23          	sw	s1,116(sp)
    a8c8:	07212823          	sw	s2,112(sp)
    a8cc:	07312623          	sw	s3,108(sp)
    a8d0:	07412423          	sw	s4,104(sp)
    a8d4:	00050493          	mv	s1,a0
    a8d8:	0805c663          	bltz	a1,a964 <__smakebuf_r+0xe4>
    a8dc:	00810613          	add	a2,sp,8
    a8e0:	2c8000ef          	jal	aba8 <_fstat_r>
    a8e4:	06054e63          	bltz	a0,a960 <__smakebuf_r+0xe0>
    a8e8:	00c12783          	lw	a5,12(sp)
    a8ec:	0000f937          	lui	s2,0xf
    a8f0:	000019b7          	lui	s3,0x1
    a8f4:	00f97933          	and	s2,s2,a5
    a8f8:	ffffe7b7          	lui	a5,0xffffe
    a8fc:	00f90933          	add	s2,s2,a5
    a900:	00193913          	seqz	s2,s2
    a904:	40000a13          	li	s4,1024
    a908:	80098993          	add	s3,s3,-2048 # 800 <main+0x508>
    a90c:	000a0593          	mv	a1,s4
    a910:	00048513          	mv	a0,s1
    a914:	b4df60ef          	jal	1460 <_malloc_r>
    a918:	00c41783          	lh	a5,12(s0)
    a91c:	06050863          	beqz	a0,a98c <__smakebuf_r+0x10c>
    a920:	0807e793          	or	a5,a5,128
    a924:	00a42023          	sw	a0,0(s0)
    a928:	00a42823          	sw	a0,16(s0)
    a92c:	00f41623          	sh	a5,12(s0)
    a930:	01442a23          	sw	s4,20(s0)
    a934:	0a091063          	bnez	s2,a9d4 <__smakebuf_r+0x154>
    a938:	0137e7b3          	or	a5,a5,s3
    a93c:	07c12083          	lw	ra,124(sp)
    a940:	00f41623          	sh	a5,12(s0)
    a944:	07812403          	lw	s0,120(sp)
    a948:	07412483          	lw	s1,116(sp)
    a94c:	07012903          	lw	s2,112(sp)
    a950:	06c12983          	lw	s3,108(sp)
    a954:	06812a03          	lw	s4,104(sp)
    a958:	08010113          	add	sp,sp,128
    a95c:	00008067          	ret
    a960:	00c41783          	lh	a5,12(s0)
    a964:	0807f793          	and	a5,a5,128
    a968:	00000913          	li	s2,0
    a96c:	04078e63          	beqz	a5,a9c8 <__smakebuf_r+0x148>
    a970:	04000a13          	li	s4,64
    a974:	000a0593          	mv	a1,s4
    a978:	00048513          	mv	a0,s1
    a97c:	ae5f60ef          	jal	1460 <_malloc_r>
    a980:	00c41783          	lh	a5,12(s0)
    a984:	00000993          	li	s3,0
    a988:	f8051ce3          	bnez	a0,a920 <__smakebuf_r+0xa0>
    a98c:	2007f713          	and	a4,a5,512
    a990:	04071e63          	bnez	a4,a9ec <__smakebuf_r+0x16c>
    a994:	ffc7f793          	and	a5,a5,-4
    a998:	0027e793          	or	a5,a5,2
    a99c:	04340713          	add	a4,s0,67
    a9a0:	00f41623          	sh	a5,12(s0)
    a9a4:	00100793          	li	a5,1
    a9a8:	07412483          	lw	s1,116(sp)
    a9ac:	07012903          	lw	s2,112(sp)
    a9b0:	06c12983          	lw	s3,108(sp)
    a9b4:	06812a03          	lw	s4,104(sp)
    a9b8:	00e42023          	sw	a4,0(s0)
    a9bc:	00e42823          	sw	a4,16(s0)
    a9c0:	00f42a23          	sw	a5,20(s0)
    a9c4:	eedff06f          	j	a8b0 <__smakebuf_r+0x30>
    a9c8:	40000a13          	li	s4,1024
    a9cc:	00000993          	li	s3,0
    a9d0:	f3dff06f          	j	a90c <__smakebuf_r+0x8c>
    a9d4:	00e41583          	lh	a1,14(s0)
    a9d8:	00048513          	mv	a0,s1
    a9dc:	22c000ef          	jal	ac08 <_isatty_r>
    a9e0:	02051063          	bnez	a0,aa00 <__smakebuf_r+0x180>
    a9e4:	00c41783          	lh	a5,12(s0)
    a9e8:	f51ff06f          	j	a938 <__smakebuf_r+0xb8>
    a9ec:	07412483          	lw	s1,116(sp)
    a9f0:	07012903          	lw	s2,112(sp)
    a9f4:	06c12983          	lw	s3,108(sp)
    a9f8:	06812a03          	lw	s4,104(sp)
    a9fc:	eb5ff06f          	j	a8b0 <__smakebuf_r+0x30>
    aa00:	00c45783          	lhu	a5,12(s0)
    aa04:	ffc7f793          	and	a5,a5,-4
    aa08:	0017e793          	or	a5,a5,1
    aa0c:	01079793          	sll	a5,a5,0x10
    aa10:	4107d793          	sra	a5,a5,0x10
    aa14:	f25ff06f          	j	a938 <__smakebuf_r+0xb8>

0000aa18 <__swbuf_r>:
    aa18:	fe010113          	add	sp,sp,-32
    aa1c:	00812c23          	sw	s0,24(sp)
    aa20:	00912a23          	sw	s1,20(sp)
    aa24:	01212823          	sw	s2,16(sp)
    aa28:	00112e23          	sw	ra,28(sp)
    aa2c:	00050913          	mv	s2,a0
    aa30:	00058493          	mv	s1,a1
    aa34:	00060413          	mv	s0,a2
    aa38:	00050663          	beqz	a0,aa44 <__swbuf_r+0x2c>
    aa3c:	03452783          	lw	a5,52(a0)
    aa40:	16078063          	beqz	a5,aba0 <__swbuf_r+0x188>
    aa44:	01842783          	lw	a5,24(s0)
    aa48:	00c41703          	lh	a4,12(s0)
    aa4c:	00f42423          	sw	a5,8(s0)
    aa50:	00877793          	and	a5,a4,8
    aa54:	08078063          	beqz	a5,aad4 <__swbuf_r+0xbc>
    aa58:	01042783          	lw	a5,16(s0)
    aa5c:	06078c63          	beqz	a5,aad4 <__swbuf_r+0xbc>
    aa60:	01312623          	sw	s3,12(sp)
    aa64:	01271693          	sll	a3,a4,0x12
    aa68:	0ff4f993          	zext.b	s3,s1
    aa6c:	0ff4f493          	zext.b	s1,s1
    aa70:	0806d863          	bgez	a3,ab00 <__swbuf_r+0xe8>
    aa74:	00042703          	lw	a4,0(s0)
    aa78:	01442683          	lw	a3,20(s0)
    aa7c:	40f707b3          	sub	a5,a4,a5
    aa80:	0ad7d863          	bge	a5,a3,ab30 <__swbuf_r+0x118>
    aa84:	00842683          	lw	a3,8(s0)
    aa88:	00170613          	add	a2,a4,1
    aa8c:	00c42023          	sw	a2,0(s0)
    aa90:	fff68693          	add	a3,a3,-1
    aa94:	00d42423          	sw	a3,8(s0)
    aa98:	01370023          	sb	s3,0(a4)
    aa9c:	01442703          	lw	a4,20(s0)
    aaa0:	00178793          	add	a5,a5,1 # ffffe001 <__crt0_ram_last+0x7ff7e002>
    aaa4:	0cf70263          	beq	a4,a5,ab68 <__swbuf_r+0x150>
    aaa8:	00c45783          	lhu	a5,12(s0)
    aaac:	0017f793          	and	a5,a5,1
    aab0:	0c079a63          	bnez	a5,ab84 <__swbuf_r+0x16c>
    aab4:	00c12983          	lw	s3,12(sp)
    aab8:	01c12083          	lw	ra,28(sp)
    aabc:	01812403          	lw	s0,24(sp)
    aac0:	01012903          	lw	s2,16(sp)
    aac4:	00048513          	mv	a0,s1
    aac8:	01412483          	lw	s1,20(sp)
    aacc:	02010113          	add	sp,sp,32
    aad0:	00008067          	ret
    aad4:	00040593          	mv	a1,s0
    aad8:	00090513          	mv	a0,s2
    aadc:	dfcfc0ef          	jal	70d8 <__swsetup_r>
    aae0:	08051e63          	bnez	a0,ab7c <__swbuf_r+0x164>
    aae4:	00c41703          	lh	a4,12(s0)
    aae8:	01312623          	sw	s3,12(sp)
    aaec:	01042783          	lw	a5,16(s0)
    aaf0:	01271693          	sll	a3,a4,0x12
    aaf4:	0ff4f993          	zext.b	s3,s1
    aaf8:	0ff4f493          	zext.b	s1,s1
    aafc:	f606cce3          	bltz	a3,aa74 <__swbuf_r+0x5c>
    ab00:	06442683          	lw	a3,100(s0)
    ab04:	ffffe637          	lui	a2,0xffffe
    ab08:	000025b7          	lui	a1,0x2
    ab0c:	00b76733          	or	a4,a4,a1
    ab10:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    ab14:	00c6f6b3          	and	a3,a3,a2
    ab18:	00e41623          	sh	a4,12(s0)
    ab1c:	00042703          	lw	a4,0(s0)
    ab20:	06d42223          	sw	a3,100(s0)
    ab24:	01442683          	lw	a3,20(s0)
    ab28:	40f707b3          	sub	a5,a4,a5
    ab2c:	f4d7cce3          	blt	a5,a3,aa84 <__swbuf_r+0x6c>
    ab30:	00040593          	mv	a1,s0
    ab34:	00090513          	mv	a0,s2
    ab38:	af1fb0ef          	jal	6628 <_fflush_r>
    ab3c:	02051e63          	bnez	a0,ab78 <__swbuf_r+0x160>
    ab40:	00042703          	lw	a4,0(s0)
    ab44:	00842683          	lw	a3,8(s0)
    ab48:	00100793          	li	a5,1
    ab4c:	00170613          	add	a2,a4,1
    ab50:	fff68693          	add	a3,a3,-1
    ab54:	00c42023          	sw	a2,0(s0)
    ab58:	00d42423          	sw	a3,8(s0)
    ab5c:	01370023          	sb	s3,0(a4)
    ab60:	01442703          	lw	a4,20(s0)
    ab64:	f4f712e3          	bne	a4,a5,aaa8 <__swbuf_r+0x90>
    ab68:	00040593          	mv	a1,s0
    ab6c:	00090513          	mv	a0,s2
    ab70:	ab9fb0ef          	jal	6628 <_fflush_r>
    ab74:	f40500e3          	beqz	a0,aab4 <__swbuf_r+0x9c>
    ab78:	00c12983          	lw	s3,12(sp)
    ab7c:	fff00493          	li	s1,-1
    ab80:	f39ff06f          	j	aab8 <__swbuf_r+0xa0>
    ab84:	00a00793          	li	a5,10
    ab88:	f2f496e3          	bne	s1,a5,aab4 <__swbuf_r+0x9c>
    ab8c:	00040593          	mv	a1,s0
    ab90:	00090513          	mv	a0,s2
    ab94:	a95fb0ef          	jal	6628 <_fflush_r>
    ab98:	f0050ee3          	beqz	a0,aab4 <__swbuf_r+0x9c>
    ab9c:	fddff06f          	j	ab78 <__swbuf_r+0x160>
    aba0:	d85fb0ef          	jal	6924 <__sinit>
    aba4:	ea1ff06f          	j	aa44 <__swbuf_r+0x2c>

0000aba8 <_fstat_r>:
    aba8:	ff010113          	add	sp,sp,-16
    abac:	00058713          	mv	a4,a1
    abb0:	00812423          	sw	s0,8(sp)
    abb4:	00060593          	mv	a1,a2
    abb8:	00050413          	mv	s0,a0
    abbc:	00070513          	mv	a0,a4
    abc0:	7fff6797          	auipc	a5,0x7fff6
    abc4:	b407ac23          	sw	zero,-1192(a5) # 80000718 <errno>
    abc8:	00112623          	sw	ra,12(sp)
    abcc:	d29f50ef          	jal	8f4 <_fstat>
    abd0:	fff00793          	li	a5,-1
    abd4:	00f50a63          	beq	a0,a5,abe8 <_fstat_r+0x40>
    abd8:	00c12083          	lw	ra,12(sp)
    abdc:	00812403          	lw	s0,8(sp)
    abe0:	01010113          	add	sp,sp,16
    abe4:	00008067          	ret
    abe8:	7fff6797          	auipc	a5,0x7fff6
    abec:	b307a783          	lw	a5,-1232(a5) # 80000718 <errno>
    abf0:	fe0784e3          	beqz	a5,abd8 <_fstat_r+0x30>
    abf4:	00c12083          	lw	ra,12(sp)
    abf8:	00f42023          	sw	a5,0(s0)
    abfc:	00812403          	lw	s0,8(sp)
    ac00:	01010113          	add	sp,sp,16
    ac04:	00008067          	ret

0000ac08 <_isatty_r>:
    ac08:	ff010113          	add	sp,sp,-16
    ac0c:	00812423          	sw	s0,8(sp)
    ac10:	00050413          	mv	s0,a0
    ac14:	00058513          	mv	a0,a1
    ac18:	7fff6797          	auipc	a5,0x7fff6
    ac1c:	b007a023          	sw	zero,-1280(a5) # 80000718 <errno>
    ac20:	00112623          	sw	ra,12(sp)
    ac24:	ce9f50ef          	jal	90c <_isatty>
    ac28:	fff00793          	li	a5,-1
    ac2c:	00f50a63          	beq	a0,a5,ac40 <_isatty_r+0x38>
    ac30:	00c12083          	lw	ra,12(sp)
    ac34:	00812403          	lw	s0,8(sp)
    ac38:	01010113          	add	sp,sp,16
    ac3c:	00008067          	ret
    ac40:	7fff6797          	auipc	a5,0x7fff6
    ac44:	ad87a783          	lw	a5,-1320(a5) # 80000718 <errno>
    ac48:	fe0784e3          	beqz	a5,ac30 <_isatty_r+0x28>
    ac4c:	00c12083          	lw	ra,12(sp)
    ac50:	00f42023          	sw	a5,0(s0)
    ac54:	00812403          	lw	s0,8(sp)
    ac58:	01010113          	add	sp,sp,16
    ac5c:	00008067          	ret

0000ac60 <__errno>:
    ac60:	7fff6517          	auipc	a0,0x7fff6
    ac64:	aa852503          	lw	a0,-1368(a0) # 80000708 <_impure_ptr>
    ac68:	00008067          	ret

0000ac6c <__assert_func>:
    ac6c:	ff010113          	add	sp,sp,-16
    ac70:	00068793          	mv	a5,a3
    ac74:	7fff6717          	auipc	a4,0x7fff6
    ac78:	a9472703          	lw	a4,-1388(a4) # 80000708 <_impure_ptr>
    ac7c:	00060813          	mv	a6,a2
    ac80:	00112623          	sw	ra,12(sp)
    ac84:	00c72883          	lw	a7,12(a4)
    ac88:	00078613          	mv	a2,a5
    ac8c:	00050693          	mv	a3,a0
    ac90:	00058713          	mv	a4,a1
    ac94:	00004797          	auipc	a5,0x4
    ac98:	30c78793          	add	a5,a5,780 # efa0 <__fini_array_end+0x3f4>
    ac9c:	00080c63          	beqz	a6,acb4 <__assert_func+0x48>
    aca0:	00004597          	auipc	a1,0x4
    aca4:	31058593          	add	a1,a1,784 # efb0 <__fini_array_end+0x404>
    aca8:	00088513          	mv	a0,a7
    acac:	3a8000ef          	jal	b054 <fiprintf>
    acb0:	3f0000ef          	jal	b0a0 <abort>
    acb4:	00004797          	auipc	a5,0x4
    acb8:	f0478793          	add	a5,a5,-252 # ebb8 <__fini_array_end+0xc>
    acbc:	00078813          	mv	a6,a5
    acc0:	fe1ff06f          	j	aca0 <__assert_func+0x34>

0000acc4 <_calloc_r>:
    acc4:	fe010113          	add	sp,sp,-32
    acc8:	00812c23          	sw	s0,24(sp)
    accc:	00112e23          	sw	ra,28(sp)
    acd0:	0105d693          	srl	a3,a1,0x10
    acd4:	00058793          	mv	a5,a1
    acd8:	00050413          	mv	s0,a0
    acdc:	01065713          	srl	a4,a2,0x10
    ace0:	0c069063          	bnez	a3,ada0 <_calloc_r+0xdc>
    ace4:	14071a63          	bnez	a4,ae38 <_calloc_r+0x174>
    ace8:	01061593          	sll	a1,a2,0x10
    acec:	01079513          	sll	a0,a5,0x10
    acf0:	0105d593          	srl	a1,a1,0x10
    acf4:	01055513          	srl	a0,a0,0x10
    acf8:	4bd030ef          	jal	e9b4 <__mulsi3>
    acfc:	00050593          	mv	a1,a0
    ad00:	00040513          	mv	a0,s0
    ad04:	f5cf60ef          	jal	1460 <_malloc_r>
    ad08:	00050413          	mv	s0,a0
    ad0c:	10050a63          	beqz	a0,ae20 <_calloc_r+0x15c>
    ad10:	ffc52603          	lw	a2,-4(a0)
    ad14:	02400713          	li	a4,36
    ad18:	ffc67613          	and	a2,a2,-4
    ad1c:	ffc60613          	add	a2,a2,-4
    ad20:	04c76863          	bltu	a4,a2,ad70 <_calloc_r+0xac>
    ad24:	01300693          	li	a3,19
    ad28:	00050793          	mv	a5,a0
    ad2c:	02c6f263          	bgeu	a3,a2,ad50 <_calloc_r+0x8c>
    ad30:	00052023          	sw	zero,0(a0)
    ad34:	00052223          	sw	zero,4(a0)
    ad38:	01b00793          	li	a5,27
    ad3c:	04c7f863          	bgeu	a5,a2,ad8c <_calloc_r+0xc8>
    ad40:	00052423          	sw	zero,8(a0)
    ad44:	00052623          	sw	zero,12(a0)
    ad48:	01050793          	add	a5,a0,16
    ad4c:	10e60263          	beq	a2,a4,ae50 <_calloc_r+0x18c>
    ad50:	0007a023          	sw	zero,0(a5)
    ad54:	0007a223          	sw	zero,4(a5)
    ad58:	0007a423          	sw	zero,8(a5)
    ad5c:	01c12083          	lw	ra,28(sp)
    ad60:	00040513          	mv	a0,s0
    ad64:	01812403          	lw	s0,24(sp)
    ad68:	02010113          	add	sp,sp,32
    ad6c:	00008067          	ret
    ad70:	00000593          	li	a1,0
    ad74:	f91f50ef          	jal	d04 <memset>
    ad78:	01c12083          	lw	ra,28(sp)
    ad7c:	00040513          	mv	a0,s0
    ad80:	01812403          	lw	s0,24(sp)
    ad84:	02010113          	add	sp,sp,32
    ad88:	00008067          	ret
    ad8c:	00850793          	add	a5,a0,8
    ad90:	0007a023          	sw	zero,0(a5)
    ad94:	0007a223          	sw	zero,4(a5)
    ad98:	0007a423          	sw	zero,8(a5)
    ad9c:	fc1ff06f          	j	ad5c <_calloc_r+0x98>
    ada0:	0c071663          	bnez	a4,ae6c <_calloc_r+0x1a8>
    ada4:	01212823          	sw	s2,16(sp)
    ada8:	01312623          	sw	s3,12(sp)
    adac:	00912a23          	sw	s1,20(sp)
    adb0:	00068913          	mv	s2,a3
    adb4:	00060993          	mv	s3,a2
    adb8:	01079513          	sll	a0,a5,0x10
    adbc:	01061593          	sll	a1,a2,0x10
    adc0:	0105d593          	srl	a1,a1,0x10
    adc4:	01055513          	srl	a0,a0,0x10
    adc8:	3ed030ef          	jal	e9b4 <__mulsi3>
    adcc:	00050493          	mv	s1,a0
    add0:	01091593          	sll	a1,s2,0x10
    add4:	01099513          	sll	a0,s3,0x10
    add8:	0105d593          	srl	a1,a1,0x10
    addc:	01055513          	srl	a0,a0,0x10
    ade0:	3d5030ef          	jal	e9b4 <__mulsi3>
    ade4:	0104d793          	srl	a5,s1,0x10
    ade8:	00f505b3          	add	a1,a0,a5
    adec:	0105d793          	srl	a5,a1,0x10
    adf0:	06079863          	bnez	a5,ae60 <_calloc_r+0x19c>
    adf4:	01049493          	sll	s1,s1,0x10
    adf8:	0104d493          	srl	s1,s1,0x10
    adfc:	01059593          	sll	a1,a1,0x10
    ae00:	0095e5b3          	or	a1,a1,s1
    ae04:	00040513          	mv	a0,s0
    ae08:	01412483          	lw	s1,20(sp)
    ae0c:	01012903          	lw	s2,16(sp)
    ae10:	00c12983          	lw	s3,12(sp)
    ae14:	e4cf60ef          	jal	1460 <_malloc_r>
    ae18:	00050413          	mv	s0,a0
    ae1c:	ee051ae3          	bnez	a0,ad10 <_calloc_r+0x4c>
    ae20:	00000413          	li	s0,0
    ae24:	01c12083          	lw	ra,28(sp)
    ae28:	00040513          	mv	a0,s0
    ae2c:	01812403          	lw	s0,24(sp)
    ae30:	02010113          	add	sp,sp,32
    ae34:	00008067          	ret
    ae38:	01212823          	sw	s2,16(sp)
    ae3c:	01312623          	sw	s3,12(sp)
    ae40:	00912a23          	sw	s1,20(sp)
    ae44:	00070913          	mv	s2,a4
    ae48:	00058993          	mv	s3,a1
    ae4c:	f6dff06f          	j	adb8 <_calloc_r+0xf4>
    ae50:	00052823          	sw	zero,16(a0)
    ae54:	01850793          	add	a5,a0,24
    ae58:	00052a23          	sw	zero,20(a0)
    ae5c:	ef5ff06f          	j	ad50 <_calloc_r+0x8c>
    ae60:	01412483          	lw	s1,20(sp)
    ae64:	01012903          	lw	s2,16(sp)
    ae68:	00c12983          	lw	s3,12(sp)
    ae6c:	df5ff0ef          	jal	ac60 <__errno>
    ae70:	00c00793          	li	a5,12
    ae74:	00f52023          	sw	a5,0(a0)
    ae78:	00000413          	li	s0,0
    ae7c:	fa9ff06f          	j	ae24 <_calloc_r+0x160>

0000ae80 <_wcsnrtombs_l>:
    ae80:	fa010113          	add	sp,sp,-96
    ae84:	04912a23          	sw	s1,84(sp)
    ae88:	05212823          	sw	s2,80(sp)
    ae8c:	05312623          	sw	s3,76(sp)
    ae90:	05412423          	sw	s4,72(sp)
    ae94:	05512223          	sw	s5,68(sp)
    ae98:	04112e23          	sw	ra,92(sp)
    ae9c:	03912a23          	sw	s9,52(sp)
    aea0:	03a12823          	sw	s10,48(sp)
    aea4:	00a12623          	sw	a0,12(sp)
    aea8:	00058a13          	mv	s4,a1
    aeac:	00060a93          	mv	s5,a2
    aeb0:	00070913          	mv	s2,a4
    aeb4:	00080993          	mv	s3,a6
    aeb8:	00078493          	mv	s1,a5
    aebc:	12078063          	beqz	a5,afdc <_wcsnrtombs_l+0x15c>
    aec0:	000aac83          	lw	s9,0(s5)
    aec4:	120a0263          	beqz	s4,afe8 <_wcsnrtombs_l+0x168>
    aec8:	14090e63          	beqz	s2,b024 <_wcsnrtombs_l+0x1a4>
    aecc:	05612023          	sw	s6,64(sp)
    aed0:	fff68b13          	add	s6,a3,-1
    aed4:	16068063          	beqz	a3,b034 <_wcsnrtombs_l+0x1b4>
    aed8:	04812c23          	sw	s0,88(sp)
    aedc:	03b12623          	sw	s11,44(sp)
    aee0:	03712e23          	sw	s7,60(sp)
    aee4:	03812c23          	sw	s8,56(sp)
    aee8:	000a0413          	mv	s0,s4
    aeec:	00000d13          	li	s10,0
    aef0:	fff00d93          	li	s11,-1
    aef4:	0240006f          	j	af18 <_wcsnrtombs_l+0x98>
    aef8:	080a1a63          	bnez	s4,af8c <_wcsnrtombs_l+0x10c>
    aefc:	000ca783          	lw	a5,0(s9)
    af00:	004c8c93          	add	s9,s9,4
    af04:	0c078263          	beqz	a5,afc8 <_wcsnrtombs_l+0x148>
    af08:	1326f263          	bgeu	a3,s2,b02c <_wcsnrtombs_l+0x1ac>
    af0c:	fffb0b13          	add	s6,s6,-1
    af10:	00068d13          	mv	s10,a3
    af14:	03bb0c63          	beq	s6,s11,af4c <_wcsnrtombs_l+0xcc>
    af18:	0e09a783          	lw	a5,224(s3)
    af1c:	000ca603          	lw	a2,0(s9)
    af20:	00c12503          	lw	a0,12(sp)
    af24:	00048693          	mv	a3,s1
    af28:	01410593          	add	a1,sp,20
    af2c:	0004ac03          	lw	s8,0(s1)
    af30:	0044ab83          	lw	s7,4(s1)
    af34:	000780e7          	jalr	a5
    af38:	0bb50e63          	beq	a0,s11,aff4 <_wcsnrtombs_l+0x174>
    af3c:	01a506b3          	add	a3,a0,s10
    af40:	fad97ce3          	bgeu	s2,a3,aef8 <_wcsnrtombs_l+0x78>
    af44:	0184a023          	sw	s8,0(s1)
    af48:	0174a223          	sw	s7,4(s1)
    af4c:	05812403          	lw	s0,88(sp)
    af50:	04012b03          	lw	s6,64(sp)
    af54:	03c12b83          	lw	s7,60(sp)
    af58:	03812c03          	lw	s8,56(sp)
    af5c:	02c12d83          	lw	s11,44(sp)
    af60:	05c12083          	lw	ra,92(sp)
    af64:	05412483          	lw	s1,84(sp)
    af68:	05012903          	lw	s2,80(sp)
    af6c:	04c12983          	lw	s3,76(sp)
    af70:	04812a03          	lw	s4,72(sp)
    af74:	04412a83          	lw	s5,68(sp)
    af78:	03412c83          	lw	s9,52(sp)
    af7c:	000d0513          	mv	a0,s10
    af80:	03012d03          	lw	s10,48(sp)
    af84:	06010113          	add	sp,sp,96
    af88:	00008067          	ret
    af8c:	08a05063          	blez	a0,b00c <_wcsnrtombs_l+0x18c>
    af90:	01410893          	add	a7,sp,20
    af94:	00a40533          	add	a0,s0,a0
    af98:	0008c783          	lbu	a5,0(a7)
    af9c:	00140413          	add	s0,s0,1
    afa0:	00188893          	add	a7,a7,1
    afa4:	fef40fa3          	sb	a5,-1(s0)
    afa8:	fe8518e3          	bne	a0,s0,af98 <_wcsnrtombs_l+0x118>
    afac:	000aa783          	lw	a5,0(s5)
    afb0:	00050413          	mv	s0,a0
    afb4:	00478793          	add	a5,a5,4
    afb8:	00faa023          	sw	a5,0(s5)
    afbc:	000ca783          	lw	a5,0(s9)
    afc0:	004c8c93          	add	s9,s9,4
    afc4:	f40792e3          	bnez	a5,af08 <_wcsnrtombs_l+0x88>
    afc8:	000a0463          	beqz	s4,afd0 <_wcsnrtombs_l+0x150>
    afcc:	000aa023          	sw	zero,0(s5)
    afd0:	0004a023          	sw	zero,0(s1)
    afd4:	fff68d13          	add	s10,a3,-1
    afd8:	f75ff06f          	j	af4c <_wcsnrtombs_l+0xcc>
    afdc:	000aac83          	lw	s9,0(s5)
    afe0:	10c50493          	add	s1,a0,268
    afe4:	ee0a12e3          	bnez	s4,aec8 <_wcsnrtombs_l+0x48>
    afe8:	05612023          	sw	s6,64(sp)
    afec:	fff00913          	li	s2,-1
    aff0:	ee1ff06f          	j	aed0 <_wcsnrtombs_l+0x50>
    aff4:	00c12703          	lw	a4,12(sp)
    aff8:	08a00793          	li	a5,138
    affc:	fff00d13          	li	s10,-1
    b000:	00f72023          	sw	a5,0(a4)
    b004:	0004a023          	sw	zero,0(s1)
    b008:	f45ff06f          	j	af4c <_wcsnrtombs_l+0xcc>
    b00c:	000aa783          	lw	a5,0(s5)
    b010:	00040513          	mv	a0,s0
    b014:	00050413          	mv	s0,a0
    b018:	00478793          	add	a5,a5,4
    b01c:	00faa023          	sw	a5,0(s5)
    b020:	f9dff06f          	j	afbc <_wcsnrtombs_l+0x13c>
    b024:	00000d13          	li	s10,0
    b028:	f39ff06f          	j	af60 <_wcsnrtombs_l+0xe0>
    b02c:	00068d13          	mv	s10,a3
    b030:	f1dff06f          	j	af4c <_wcsnrtombs_l+0xcc>
    b034:	04012b03          	lw	s6,64(sp)
    b038:	00000d13          	li	s10,0
    b03c:	f25ff06f          	j	af60 <_wcsnrtombs_l+0xe0>

0000b040 <_wcsnrtombs_r>:
    b040:	7fff5817          	auipc	a6,0x7fff5
    b044:	4f480813          	add	a6,a6,1268 # 80000534 <__global_locale>
    b048:	7fff5517          	auipc	a0,0x7fff5
    b04c:	6c052503          	lw	a0,1728(a0) # 80000708 <_impure_ptr>
    b050:	e31ff06f          	j	ae80 <_wcsnrtombs_l>

0000b054 <fiprintf>:
    b054:	fc010113          	add	sp,sp,-64
    b058:	02810313          	add	t1,sp,40
    b05c:	02c12423          	sw	a2,40(sp)
    b060:	02d12623          	sw	a3,44(sp)
    b064:	00058613          	mv	a2,a1
    b068:	00030693          	mv	a3,t1
    b06c:	00050593          	mv	a1,a0
    b070:	7fff5517          	auipc	a0,0x7fff5
    b074:	69852503          	lw	a0,1688(a0) # 80000708 <_impure_ptr>
    b078:	00112e23          	sw	ra,28(sp)
    b07c:	02e12823          	sw	a4,48(sp)
    b080:	02f12a23          	sw	a5,52(sp)
    b084:	03012c23          	sw	a6,56(sp)
    b088:	03112e23          	sw	a7,60(sp)
    b08c:	00612623          	sw	t1,12(sp)
    b090:	a9df90ef          	jal	4b2c <_vfiprintf_r>
    b094:	01c12083          	lw	ra,28(sp)
    b098:	04010113          	add	sp,sp,64
    b09c:	00008067          	ret

0000b0a0 <abort>:
    b0a0:	ff010113          	add	sp,sp,-16
    b0a4:	00600513          	li	a0,6
    b0a8:	00112623          	sw	ra,12(sp)
    b0ac:	00c000ef          	jal	b0b8 <raise>
    b0b0:	00100513          	li	a0,1
    b0b4:	829f50ef          	jal	8dc <_exit>

0000b0b8 <raise>:
    b0b8:	ff010113          	add	sp,sp,-16
    b0bc:	00912223          	sw	s1,4(sp)
    b0c0:	00112623          	sw	ra,12(sp)
    b0c4:	01f00793          	li	a5,31
    b0c8:	7fff5497          	auipc	s1,0x7fff5
    b0cc:	6404a483          	lw	s1,1600(s1) # 80000708 <_impure_ptr>
    b0d0:	08a7ee63          	bltu	a5,a0,b16c <raise+0xb4>
    b0d4:	1184a783          	lw	a5,280(s1)
    b0d8:	00812423          	sw	s0,8(sp)
    b0dc:	00050413          	mv	s0,a0
    b0e0:	04078263          	beqz	a5,b124 <raise+0x6c>
    b0e4:	00251713          	sll	a4,a0,0x2
    b0e8:	00e787b3          	add	a5,a5,a4
    b0ec:	0007a703          	lw	a4,0(a5)
    b0f0:	02070a63          	beqz	a4,b124 <raise+0x6c>
    b0f4:	00100693          	li	a3,1
    b0f8:	00d70a63          	beq	a4,a3,b10c <raise+0x54>
    b0fc:	fff00693          	li	a3,-1
    b100:	04d70663          	beq	a4,a3,b14c <raise+0x94>
    b104:	0007a023          	sw	zero,0(a5)
    b108:	000700e7          	jalr	a4
    b10c:	00812403          	lw	s0,8(sp)
    b110:	00000513          	li	a0,0
    b114:	00c12083          	lw	ra,12(sp)
    b118:	00412483          	lw	s1,4(sp)
    b11c:	01010113          	add	sp,sp,16
    b120:	00008067          	ret
    b124:	00048513          	mv	a0,s1
    b128:	0b4000ef          	jal	b1dc <_getpid_r>
    b12c:	00040613          	mv	a2,s0
    b130:	00812403          	lw	s0,8(sp)
    b134:	00c12083          	lw	ra,12(sp)
    b138:	00050593          	mv	a1,a0
    b13c:	00048513          	mv	a0,s1
    b140:	00412483          	lw	s1,4(sp)
    b144:	01010113          	add	sp,sp,16
    b148:	0340006f          	j	b17c <_kill_r>
    b14c:	00812403          	lw	s0,8(sp)
    b150:	00c12083          	lw	ra,12(sp)
    b154:	01600793          	li	a5,22
    b158:	00f4a023          	sw	a5,0(s1)
    b15c:	00100513          	li	a0,1
    b160:	00412483          	lw	s1,4(sp)
    b164:	01010113          	add	sp,sp,16
    b168:	00008067          	ret
    b16c:	01600793          	li	a5,22
    b170:	00f4a023          	sw	a5,0(s1)
    b174:	fff00513          	li	a0,-1
    b178:	f9dff06f          	j	b114 <raise+0x5c>

0000b17c <_kill_r>:
    b17c:	ff010113          	add	sp,sp,-16
    b180:	00058713          	mv	a4,a1
    b184:	00812423          	sw	s0,8(sp)
    b188:	00060593          	mv	a1,a2
    b18c:	00050413          	mv	s0,a0
    b190:	00070513          	mv	a0,a4
    b194:	7fff5797          	auipc	a5,0x7fff5
    b198:	5807a223          	sw	zero,1412(a5) # 80000718 <errno>
    b19c:	00112623          	sw	ra,12(sp)
    b1a0:	f74f50ef          	jal	914 <_kill>
    b1a4:	fff00793          	li	a5,-1
    b1a8:	00f50a63          	beq	a0,a5,b1bc <_kill_r+0x40>
    b1ac:	00c12083          	lw	ra,12(sp)
    b1b0:	00812403          	lw	s0,8(sp)
    b1b4:	01010113          	add	sp,sp,16
    b1b8:	00008067          	ret
    b1bc:	7fff5797          	auipc	a5,0x7fff5
    b1c0:	55c7a783          	lw	a5,1372(a5) # 80000718 <errno>
    b1c4:	fe0784e3          	beqz	a5,b1ac <_kill_r+0x30>
    b1c8:	00c12083          	lw	ra,12(sp)
    b1cc:	00f42023          	sw	a5,0(s0)
    b1d0:	00812403          	lw	s0,8(sp)
    b1d4:	01010113          	add	sp,sp,16
    b1d8:	00008067          	ret

0000b1dc <_getpid_r>:
    b1dc:	f28f506f          	j	904 <_getpid>

0000b1e0 <__udivdi3>:
    b1e0:	fd010113          	add	sp,sp,-48
    b1e4:	01312e23          	sw	s3,28(sp)
    b1e8:	02112623          	sw	ra,44(sp)
    b1ec:	01612823          	sw	s6,16(sp)
    b1f0:	00050993          	mv	s3,a0
    b1f4:	16069663          	bnez	a3,b360 <__udivdi3+0x180>
    b1f8:	02812423          	sw	s0,40(sp)
    b1fc:	01512a23          	sw	s5,20(sp)
    b200:	02912223          	sw	s1,36(sp)
    b204:	03212023          	sw	s2,32(sp)
    b208:	01412c23          	sw	s4,24(sp)
    b20c:	00060a93          	mv	s5,a2
    b210:	00050413          	mv	s0,a0
    b214:	1cc5f063          	bgeu	a1,a2,b3d4 <__udivdi3+0x1f4>
    b218:	000107b7          	lui	a5,0x10
    b21c:	00058493          	mv	s1,a1
    b220:	2af66e63          	bltu	a2,a5,b4dc <__udivdi3+0x2fc>
    b224:	010007b7          	lui	a5,0x1000
    b228:	01800713          	li	a4,24
    b22c:	00f67463          	bgeu	a2,a5,b234 <__udivdi3+0x54>
    b230:	01000713          	li	a4,16
    b234:	00e656b3          	srl	a3,a2,a4
    b238:	00004797          	auipc	a5,0x4
    b23c:	3b078793          	add	a5,a5,944 # f5e8 <__clz_tab>
    b240:	00d787b3          	add	a5,a5,a3
    b244:	0007c783          	lbu	a5,0(a5)
    b248:	02000693          	li	a3,32
    b24c:	00e787b3          	add	a5,a5,a4
    b250:	40f68733          	sub	a4,a3,a5
    b254:	00f68c63          	beq	a3,a5,b26c <__udivdi3+0x8c>
    b258:	00e594b3          	sll	s1,a1,a4
    b25c:	00f9d7b3          	srl	a5,s3,a5
    b260:	00e61ab3          	sll	s5,a2,a4
    b264:	0097e4b3          	or	s1,a5,s1
    b268:	00e99433          	sll	s0,s3,a4
    b26c:	010ada13          	srl	s4,s5,0x10
    b270:	000a0593          	mv	a1,s4
    b274:	00048513          	mv	a0,s1
    b278:	010a9b13          	sll	s6,s5,0x10
    b27c:	7fc030ef          	jal	ea78 <__hidden___udivsi3>
    b280:	010b5b13          	srl	s6,s6,0x10
    b284:	00050593          	mv	a1,a0
    b288:	00050913          	mv	s2,a0
    b28c:	000b0513          	mv	a0,s6
    b290:	724030ef          	jal	e9b4 <__mulsi3>
    b294:	00050793          	mv	a5,a0
    b298:	000a0593          	mv	a1,s4
    b29c:	00048513          	mv	a0,s1
    b2a0:	00078493          	mv	s1,a5
    b2a4:	01d030ef          	jal	eac0 <__umodsi3>
    b2a8:	01051513          	sll	a0,a0,0x10
    b2ac:	01045793          	srl	a5,s0,0x10
    b2b0:	00a7e7b3          	or	a5,a5,a0
    b2b4:	0097fc63          	bgeu	a5,s1,b2cc <__udivdi3+0xec>
    b2b8:	00fa87b3          	add	a5,s5,a5
    b2bc:	fff90713          	add	a4,s2,-1 # efff <_ctype_+0x7>
    b2c0:	0157e463          	bltu	a5,s5,b2c8 <__udivdi3+0xe8>
    b2c4:	5a97e863          	bltu	a5,s1,b874 <__udivdi3+0x694>
    b2c8:	00070913          	mv	s2,a4
    b2cc:	409784b3          	sub	s1,a5,s1
    b2d0:	000a0593          	mv	a1,s4
    b2d4:	00048513          	mv	a0,s1
    b2d8:	7a0030ef          	jal	ea78 <__hidden___udivsi3>
    b2dc:	00050593          	mv	a1,a0
    b2e0:	00050993          	mv	s3,a0
    b2e4:	000b0513          	mv	a0,s6
    b2e8:	6cc030ef          	jal	e9b4 <__mulsi3>
    b2ec:	00050793          	mv	a5,a0
    b2f0:	000a0593          	mv	a1,s4
    b2f4:	00048513          	mv	a0,s1
    b2f8:	01041413          	sll	s0,s0,0x10
    b2fc:	00078493          	mv	s1,a5
    b300:	7c0030ef          	jal	eac0 <__umodsi3>
    b304:	01051513          	sll	a0,a0,0x10
    b308:	01045413          	srl	s0,s0,0x10
    b30c:	00a46433          	or	s0,s0,a0
    b310:	00947c63          	bgeu	s0,s1,b328 <__udivdi3+0x148>
    b314:	008a8433          	add	s0,s5,s0
    b318:	fff98793          	add	a5,s3,-1
    b31c:	4d546e63          	bltu	s0,s5,b7f8 <__udivdi3+0x618>
    b320:	ffe98993          	add	s3,s3,-2
    b324:	4c947a63          	bgeu	s0,s1,b7f8 <__udivdi3+0x618>
    b328:	01091613          	sll	a2,s2,0x10
    b32c:	01366533          	or	a0,a2,s3
    b330:	00000b13          	li	s6,0
    b334:	02812403          	lw	s0,40(sp)
    b338:	02c12083          	lw	ra,44(sp)
    b33c:	02412483          	lw	s1,36(sp)
    b340:	02012903          	lw	s2,32(sp)
    b344:	01812a03          	lw	s4,24(sp)
    b348:	01412a83          	lw	s5,20(sp)
    b34c:	01c12983          	lw	s3,28(sp)
    b350:	000b0593          	mv	a1,s6
    b354:	01012b03          	lw	s6,16(sp)
    b358:	03010113          	add	sp,sp,48
    b35c:	00008067          	ret
    b360:	02d5f263          	bgeu	a1,a3,b384 <__udivdi3+0x1a4>
    b364:	00000b13          	li	s6,0
    b368:	00000513          	li	a0,0
    b36c:	02c12083          	lw	ra,44(sp)
    b370:	01c12983          	lw	s3,28(sp)
    b374:	000b0593          	mv	a1,s6
    b378:	01012b03          	lw	s6,16(sp)
    b37c:	03010113          	add	sp,sp,48
    b380:	00008067          	ret
    b384:	000107b7          	lui	a5,0x10
    b388:	26f6ee63          	bltu	a3,a5,b604 <__udivdi3+0x424>
    b38c:	01000737          	lui	a4,0x1000
    b390:	01800793          	li	a5,24
    b394:	00e6f463          	bgeu	a3,a4,b39c <__udivdi3+0x1bc>
    b398:	01000793          	li	a5,16
    b39c:	00f6d533          	srl	a0,a3,a5
    b3a0:	00004717          	auipc	a4,0x4
    b3a4:	24870713          	add	a4,a4,584 # f5e8 <__clz_tab>
    b3a8:	00a70733          	add	a4,a4,a0
    b3ac:	00074703          	lbu	a4,0(a4)
    b3b0:	02000513          	li	a0,32
    b3b4:	00f70733          	add	a4,a4,a5
    b3b8:	40e50b33          	sub	s6,a0,a4
    b3bc:	26e51c63          	bne	a0,a4,b634 <__udivdi3+0x454>
    b3c0:	46b6ee63          	bltu	a3,a1,b83c <__udivdi3+0x65c>
    b3c4:	00c9b533          	sltu	a0,s3,a2
    b3c8:	00153513          	seqz	a0,a0
    b3cc:	00000b13          	li	s6,0
    b3d0:	f9dff06f          	j	b36c <__udivdi3+0x18c>
    b3d4:	10060c63          	beqz	a2,b4ec <__udivdi3+0x30c>
    b3d8:	000107b7          	lui	a5,0x10
    b3dc:	44f67663          	bgeu	a2,a5,b828 <__udivdi3+0x648>
    b3e0:	10063713          	sltiu	a4,a2,256
    b3e4:	00173713          	seqz	a4,a4
    b3e8:	00371713          	sll	a4,a4,0x3
    b3ec:	00e656b3          	srl	a3,a2,a4
    b3f0:	00004797          	auipc	a5,0x4
    b3f4:	1f878793          	add	a5,a5,504 # f5e8 <__clz_tab>
    b3f8:	00d787b3          	add	a5,a5,a3
    b3fc:	0007c483          	lbu	s1,0(a5)
    b400:	02000793          	li	a5,32
    b404:	00e484b3          	add	s1,s1,a4
    b408:	40978733          	sub	a4,a5,s1
    b40c:	10979463          	bne	a5,s1,b514 <__udivdi3+0x334>
    b410:	01061a13          	sll	s4,a2,0x10
    b414:	40c584b3          	sub	s1,a1,a2
    b418:	01065913          	srl	s2,a2,0x10
    b41c:	010a5a13          	srl	s4,s4,0x10
    b420:	00100b13          	li	s6,1
    b424:	00090593          	mv	a1,s2
    b428:	00048513          	mv	a0,s1
    b42c:	64c030ef          	jal	ea78 <__hidden___udivsi3>
    b430:	000a0593          	mv	a1,s4
    b434:	00050993          	mv	s3,a0
    b438:	57c030ef          	jal	e9b4 <__mulsi3>
    b43c:	00050793          	mv	a5,a0
    b440:	00090593          	mv	a1,s2
    b444:	00048513          	mv	a0,s1
    b448:	00078493          	mv	s1,a5
    b44c:	674030ef          	jal	eac0 <__umodsi3>
    b450:	01051513          	sll	a0,a0,0x10
    b454:	01045793          	srl	a5,s0,0x10
    b458:	00a7e7b3          	or	a5,a5,a0
    b45c:	0097fc63          	bgeu	a5,s1,b474 <__udivdi3+0x294>
    b460:	00fa87b3          	add	a5,s5,a5
    b464:	fff98713          	add	a4,s3,-1
    b468:	0157e463          	bltu	a5,s5,b470 <__udivdi3+0x290>
    b46c:	3e97ee63          	bltu	a5,s1,b868 <__udivdi3+0x688>
    b470:	00070993          	mv	s3,a4
    b474:	409784b3          	sub	s1,a5,s1
    b478:	00090593          	mv	a1,s2
    b47c:	00048513          	mv	a0,s1
    b480:	5f8030ef          	jal	ea78 <__hidden___udivsi3>
    b484:	000a0593          	mv	a1,s4
    b488:	00050a13          	mv	s4,a0
    b48c:	528030ef          	jal	e9b4 <__mulsi3>
    b490:	00050793          	mv	a5,a0
    b494:	00090593          	mv	a1,s2
    b498:	00048513          	mv	a0,s1
    b49c:	01041413          	sll	s0,s0,0x10
    b4a0:	00078493          	mv	s1,a5
    b4a4:	61c030ef          	jal	eac0 <__umodsi3>
    b4a8:	01051513          	sll	a0,a0,0x10
    b4ac:	01045413          	srl	s0,s0,0x10
    b4b0:	00a46433          	or	s0,s0,a0
    b4b4:	00947e63          	bgeu	s0,s1,b4d0 <__udivdi3+0x2f0>
    b4b8:	008a8433          	add	s0,s5,s0
    b4bc:	fffa0793          	add	a5,s4,-1
    b4c0:	01546663          	bltu	s0,s5,b4cc <__udivdi3+0x2ec>
    b4c4:	ffea0a13          	add	s4,s4,-2
    b4c8:	00946463          	bltu	s0,s1,b4d0 <__udivdi3+0x2f0>
    b4cc:	00078a13          	mv	s4,a5
    b4d0:	01099613          	sll	a2,s3,0x10
    b4d4:	01466533          	or	a0,a2,s4
    b4d8:	e5dff06f          	j	b334 <__udivdi3+0x154>
    b4dc:	10063713          	sltiu	a4,a2,256
    b4e0:	00173713          	seqz	a4,a4
    b4e4:	00371713          	sll	a4,a4,0x3
    b4e8:	d4dff06f          	j	b234 <__udivdi3+0x54>
    b4ec:	00000693          	li	a3,0
    b4f0:	00004797          	auipc	a5,0x4
    b4f4:	0f878793          	add	a5,a5,248 # f5e8 <__clz_tab>
    b4f8:	00d787b3          	add	a5,a5,a3
    b4fc:	0007c483          	lbu	s1,0(a5)
    b500:	00000713          	li	a4,0
    b504:	02000793          	li	a5,32
    b508:	00e484b3          	add	s1,s1,a4
    b50c:	40978733          	sub	a4,a5,s1
    b510:	f09780e3          	beq	a5,s1,b410 <__udivdi3+0x230>
    b514:	00e61ab3          	sll	s5,a2,a4
    b518:	01712623          	sw	s7,12(sp)
    b51c:	010ad913          	srl	s2,s5,0x10
    b520:	0095dbb3          	srl	s7,a1,s1
    b524:	00e597b3          	sll	a5,a1,a4
    b528:	0099d4b3          	srl	s1,s3,s1
    b52c:	00090593          	mv	a1,s2
    b530:	000b8513          	mv	a0,s7
    b534:	010a9a13          	sll	s4,s5,0x10
    b538:	00f4e4b3          	or	s1,s1,a5
    b53c:	00e99433          	sll	s0,s3,a4
    b540:	010a5a13          	srl	s4,s4,0x10
    b544:	534030ef          	jal	ea78 <__hidden___udivsi3>
    b548:	00050593          	mv	a1,a0
    b54c:	00050b13          	mv	s6,a0
    b550:	000a0513          	mv	a0,s4
    b554:	460030ef          	jal	e9b4 <__mulsi3>
    b558:	00050993          	mv	s3,a0
    b55c:	00090593          	mv	a1,s2
    b560:	000b8513          	mv	a0,s7
    b564:	55c030ef          	jal	eac0 <__umodsi3>
    b568:	01051513          	sll	a0,a0,0x10
    b56c:	0104d793          	srl	a5,s1,0x10
    b570:	00a7e7b3          	or	a5,a5,a0
    b574:	0137fe63          	bgeu	a5,s3,b590 <__udivdi3+0x3b0>
    b578:	00fa87b3          	add	a5,s5,a5
    b57c:	fffb0713          	add	a4,s6,-1
    b580:	2d57ec63          	bltu	a5,s5,b858 <__udivdi3+0x678>
    b584:	2d37fa63          	bgeu	a5,s3,b858 <__udivdi3+0x678>
    b588:	ffeb0b13          	add	s6,s6,-2
    b58c:	015787b3          	add	a5,a5,s5
    b590:	413789b3          	sub	s3,a5,s3
    b594:	00090593          	mv	a1,s2
    b598:	00098513          	mv	a0,s3
    b59c:	4dc030ef          	jal	ea78 <__hidden___udivsi3>
    b5a0:	00050593          	mv	a1,a0
    b5a4:	00050b93          	mv	s7,a0
    b5a8:	000a0513          	mv	a0,s4
    b5ac:	408030ef          	jal	e9b4 <__mulsi3>
    b5b0:	00050793          	mv	a5,a0
    b5b4:	00090593          	mv	a1,s2
    b5b8:	00098513          	mv	a0,s3
    b5bc:	01049493          	sll	s1,s1,0x10
    b5c0:	00078993          	mv	s3,a5
    b5c4:	4fc030ef          	jal	eac0 <__umodsi3>
    b5c8:	01051513          	sll	a0,a0,0x10
    b5cc:	0104d493          	srl	s1,s1,0x10
    b5d0:	00a4e4b3          	or	s1,s1,a0
    b5d4:	0134fe63          	bgeu	s1,s3,b5f0 <__udivdi3+0x410>
    b5d8:	009a84b3          	add	s1,s5,s1
    b5dc:	fffb8793          	add	a5,s7,-1
    b5e0:	2754e463          	bltu	s1,s5,b848 <__udivdi3+0x668>
    b5e4:	2734f263          	bgeu	s1,s3,b848 <__udivdi3+0x668>
    b5e8:	ffeb8b93          	add	s7,s7,-2
    b5ec:	015484b3          	add	s1,s1,s5
    b5f0:	010b1b13          	sll	s6,s6,0x10
    b5f4:	017b6b33          	or	s6,s6,s7
    b5f8:	413484b3          	sub	s1,s1,s3
    b5fc:	00c12b83          	lw	s7,12(sp)
    b600:	e25ff06f          	j	b424 <__udivdi3+0x244>
    b604:	1006b793          	sltiu	a5,a3,256
    b608:	0017b793          	seqz	a5,a5
    b60c:	00379793          	sll	a5,a5,0x3
    b610:	00f6d533          	srl	a0,a3,a5
    b614:	00004717          	auipc	a4,0x4
    b618:	fd470713          	add	a4,a4,-44 # f5e8 <__clz_tab>
    b61c:	00a70733          	add	a4,a4,a0
    b620:	00074703          	lbu	a4,0(a4)
    b624:	02000513          	li	a0,32
    b628:	00f70733          	add	a4,a4,a5
    b62c:	40e50b33          	sub	s6,a0,a4
    b630:	d8e508e3          	beq	a0,a4,b3c0 <__udivdi3+0x1e0>
    b634:	016696b3          	sll	a3,a3,s6
    b638:	01912223          	sw	s9,4(sp)
    b63c:	00e65cb3          	srl	s9,a2,a4
    b640:	00dcecb3          	or	s9,s9,a3
    b644:	01512a23          	sw	s5,20(sp)
    b648:	01712623          	sw	s7,12(sp)
    b64c:	010cda93          	srl	s5,s9,0x10
    b650:	00e5dbb3          	srl	s7,a1,a4
    b654:	016597b3          	sll	a5,a1,s6
    b658:	00e9d733          	srl	a4,s3,a4
    b65c:	01812423          	sw	s8,8(sp)
    b660:	000a8593          	mv	a1,s5
    b664:	000b8513          	mv	a0,s7
    b668:	010c9c13          	sll	s8,s9,0x10
    b66c:	02812423          	sw	s0,40(sp)
    b670:	02912223          	sw	s1,36(sp)
    b674:	03212023          	sw	s2,32(sp)
    b678:	00f764b3          	or	s1,a4,a5
    b67c:	01661933          	sll	s2,a2,s6
    b680:	01412c23          	sw	s4,24(sp)
    b684:	010c5c13          	srl	s8,s8,0x10
    b688:	3f0030ef          	jal	ea78 <__hidden___udivsi3>
    b68c:	00050593          	mv	a1,a0
    b690:	00050413          	mv	s0,a0
    b694:	000c0513          	mv	a0,s8
    b698:	31c030ef          	jal	e9b4 <__mulsi3>
    b69c:	00050a13          	mv	s4,a0
    b6a0:	000a8593          	mv	a1,s5
    b6a4:	000b8513          	mv	a0,s7
    b6a8:	418030ef          	jal	eac0 <__umodsi3>
    b6ac:	01051513          	sll	a0,a0,0x10
    b6b0:	0104d793          	srl	a5,s1,0x10
    b6b4:	00a7e7b3          	or	a5,a5,a0
    b6b8:	0147fe63          	bgeu	a5,s4,b6d4 <__udivdi3+0x4f4>
    b6bc:	00fc87b3          	add	a5,s9,a5
    b6c0:	fff40713          	add	a4,s0,-1
    b6c4:	1997ee63          	bltu	a5,s9,b860 <__udivdi3+0x680>
    b6c8:	1947fc63          	bgeu	a5,s4,b860 <__udivdi3+0x680>
    b6cc:	ffe40413          	add	s0,s0,-2
    b6d0:	019787b3          	add	a5,a5,s9
    b6d4:	41478a33          	sub	s4,a5,s4
    b6d8:	000a8593          	mv	a1,s5
    b6dc:	000a0513          	mv	a0,s4
    b6e0:	398030ef          	jal	ea78 <__hidden___udivsi3>
    b6e4:	00050593          	mv	a1,a0
    b6e8:	00050b93          	mv	s7,a0
    b6ec:	000c0513          	mv	a0,s8
    b6f0:	2c4030ef          	jal	e9b4 <__mulsi3>
    b6f4:	00050793          	mv	a5,a0
    b6f8:	000a8593          	mv	a1,s5
    b6fc:	000a0513          	mv	a0,s4
    b700:	00078a13          	mv	s4,a5
    b704:	3bc030ef          	jal	eac0 <__umodsi3>
    b708:	01049713          	sll	a4,s1,0x10
    b70c:	01051513          	sll	a0,a0,0x10
    b710:	01075713          	srl	a4,a4,0x10
    b714:	00a76733          	or	a4,a4,a0
    b718:	01477e63          	bgeu	a4,s4,b734 <__udivdi3+0x554>
    b71c:	00ec8733          	add	a4,s9,a4
    b720:	fffb8793          	add	a5,s7,-1
    b724:	13976663          	bltu	a4,s9,b850 <__udivdi3+0x670>
    b728:	13477463          	bgeu	a4,s4,b850 <__udivdi3+0x670>
    b72c:	ffeb8b93          	add	s7,s7,-2
    b730:	01970733          	add	a4,a4,s9
    b734:	00010e37          	lui	t3,0x10
    b738:	01041413          	sll	s0,s0,0x10
    b73c:	01746433          	or	s0,s0,s7
    b740:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    b744:	00f47833          	and	a6,s0,a5
    b748:	00f977b3          	and	a5,s2,a5
    b74c:	41470733          	sub	a4,a4,s4
    b750:	01045e93          	srl	t4,s0,0x10
    b754:	01095913          	srl	s2,s2,0x10
    b758:	00080513          	mv	a0,a6
    b75c:	00078593          	mv	a1,a5
    b760:	254030ef          	jal	e9b4 <__mulsi3>
    b764:	00050313          	mv	t1,a0
    b768:	00090593          	mv	a1,s2
    b76c:	00080513          	mv	a0,a6
    b770:	244030ef          	jal	e9b4 <__mulsi3>
    b774:	00050813          	mv	a6,a0
    b778:	00078593          	mv	a1,a5
    b77c:	000e8513          	mv	a0,t4
    b780:	234030ef          	jal	e9b4 <__mulsi3>
    b784:	00050893          	mv	a7,a0
    b788:	00090593          	mv	a1,s2
    b78c:	000e8513          	mv	a0,t4
    b790:	224030ef          	jal	e9b4 <__mulsi3>
    b794:	01035793          	srl	a5,t1,0x10
    b798:	01180833          	add	a6,a6,a7
    b79c:	010787b3          	add	a5,a5,a6
    b7a0:	0117f463          	bgeu	a5,a7,b7a8 <__udivdi3+0x5c8>
    b7a4:	01c50533          	add	a0,a0,t3
    b7a8:	0107d693          	srl	a3,a5,0x10
    b7ac:	00a686b3          	add	a3,a3,a0
    b7b0:	06d76863          	bltu	a4,a3,b820 <__udivdi3+0x640>
    b7b4:	04d70663          	beq	a4,a3,b800 <__udivdi3+0x620>
    b7b8:	00040513          	mv	a0,s0
    b7bc:	02812403          	lw	s0,40(sp)
    b7c0:	02c12083          	lw	ra,44(sp)
    b7c4:	00000b13          	li	s6,0
    b7c8:	02412483          	lw	s1,36(sp)
    b7cc:	02012903          	lw	s2,32(sp)
    b7d0:	01812a03          	lw	s4,24(sp)
    b7d4:	01412a83          	lw	s5,20(sp)
    b7d8:	00c12b83          	lw	s7,12(sp)
    b7dc:	00812c03          	lw	s8,8(sp)
    b7e0:	00412c83          	lw	s9,4(sp)
    b7e4:	01c12983          	lw	s3,28(sp)
    b7e8:	000b0593          	mv	a1,s6
    b7ec:	01012b03          	lw	s6,16(sp)
    b7f0:	03010113          	add	sp,sp,48
    b7f4:	00008067          	ret
    b7f8:	00078993          	mv	s3,a5
    b7fc:	b2dff06f          	j	b328 <__udivdi3+0x148>
    b800:	00010737          	lui	a4,0x10
    b804:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    b808:	00e7f7b3          	and	a5,a5,a4
    b80c:	01079793          	sll	a5,a5,0x10
    b810:	00e37333          	and	t1,t1,a4
    b814:	01699533          	sll	a0,s3,s6
    b818:	006787b3          	add	a5,a5,t1
    b81c:	f8f57ee3          	bgeu	a0,a5,b7b8 <__udivdi3+0x5d8>
    b820:	fff40513          	add	a0,s0,-1
    b824:	f99ff06f          	j	b7bc <__udivdi3+0x5dc>
    b828:	010007b7          	lui	a5,0x1000
    b82c:	04f67a63          	bgeu	a2,a5,b880 <__udivdi3+0x6a0>
    b830:	01065693          	srl	a3,a2,0x10
    b834:	01000713          	li	a4,16
    b838:	bb9ff06f          	j	b3f0 <__udivdi3+0x210>
    b83c:	00000b13          	li	s6,0
    b840:	00100513          	li	a0,1
    b844:	b29ff06f          	j	b36c <__udivdi3+0x18c>
    b848:	00078b93          	mv	s7,a5
    b84c:	da5ff06f          	j	b5f0 <__udivdi3+0x410>
    b850:	00078b93          	mv	s7,a5
    b854:	ee1ff06f          	j	b734 <__udivdi3+0x554>
    b858:	00070b13          	mv	s6,a4
    b85c:	d35ff06f          	j	b590 <__udivdi3+0x3b0>
    b860:	00070413          	mv	s0,a4
    b864:	e71ff06f          	j	b6d4 <__udivdi3+0x4f4>
    b868:	ffe98993          	add	s3,s3,-2
    b86c:	015787b3          	add	a5,a5,s5
    b870:	c05ff06f          	j	b474 <__udivdi3+0x294>
    b874:	ffe90913          	add	s2,s2,-2
    b878:	015787b3          	add	a5,a5,s5
    b87c:	a51ff06f          	j	b2cc <__udivdi3+0xec>
    b880:	01865693          	srl	a3,a2,0x18
    b884:	01800713          	li	a4,24
    b888:	b69ff06f          	j	b3f0 <__udivdi3+0x210>

0000b88c <__umoddi3>:
    b88c:	fd010113          	add	sp,sp,-48
    b890:	02112623          	sw	ra,44(sp)
    b894:	00050793          	mv	a5,a0
    b898:	14069663          	bnez	a3,b9e4 <__umoddi3+0x158>
    b89c:	03212023          	sw	s2,32(sp)
    b8a0:	01412c23          	sw	s4,24(sp)
    b8a4:	02812423          	sw	s0,40(sp)
    b8a8:	02912223          	sw	s1,36(sp)
    b8ac:	01312e23          	sw	s3,28(sp)
    b8b0:	01512a23          	sw	s5,20(sp)
    b8b4:	00060a13          	mv	s4,a2
    b8b8:	00050913          	mv	s2,a0
    b8bc:	1ac5f663          	bgeu	a1,a2,ba68 <__umoddi3+0x1dc>
    b8c0:	01612823          	sw	s6,16(sp)
    b8c4:	00010737          	lui	a4,0x10
    b8c8:	00058993          	mv	s3,a1
    b8cc:	28e66063          	bltu	a2,a4,bb4c <__umoddi3+0x2c0>
    b8d0:	01000737          	lui	a4,0x1000
    b8d4:	01800693          	li	a3,24
    b8d8:	00e67463          	bgeu	a2,a4,b8e0 <__umoddi3+0x54>
    b8dc:	01000693          	li	a3,16
    b8e0:	00d65533          	srl	a0,a2,a3
    b8e4:	00004717          	auipc	a4,0x4
    b8e8:	d0470713          	add	a4,a4,-764 # f5e8 <__clz_tab>
    b8ec:	00a70733          	add	a4,a4,a0
    b8f0:	00074703          	lbu	a4,0(a4)
    b8f4:	02000513          	li	a0,32
    b8f8:	00d70733          	add	a4,a4,a3
    b8fc:	40e504b3          	sub	s1,a0,a4
    b900:	00e50c63          	beq	a0,a4,b918 <__umoddi3+0x8c>
    b904:	009599b3          	sll	s3,a1,s1
    b908:	00e7d733          	srl	a4,a5,a4
    b90c:	00961a33          	sll	s4,a2,s1
    b910:	013769b3          	or	s3,a4,s3
    b914:	00979933          	sll	s2,a5,s1
    b918:	010a5a93          	srl	s5,s4,0x10
    b91c:	000a8593          	mv	a1,s5
    b920:	00098513          	mv	a0,s3
    b924:	010a1b13          	sll	s6,s4,0x10
    b928:	150030ef          	jal	ea78 <__hidden___udivsi3>
    b92c:	010b5b13          	srl	s6,s6,0x10
    b930:	000b0593          	mv	a1,s6
    b934:	080030ef          	jal	e9b4 <__mulsi3>
    b938:	00050413          	mv	s0,a0
    b93c:	000a8593          	mv	a1,s5
    b940:	00098513          	mv	a0,s3
    b944:	17c030ef          	jal	eac0 <__umodsi3>
    b948:	01051513          	sll	a0,a0,0x10
    b94c:	01095793          	srl	a5,s2,0x10
    b950:	00a7e7b3          	or	a5,a5,a0
    b954:	0087f863          	bgeu	a5,s0,b964 <__umoddi3+0xd8>
    b958:	00fa07b3          	add	a5,s4,a5
    b95c:	0147e463          	bltu	a5,s4,b964 <__umoddi3+0xd8>
    b960:	5687e863          	bltu	a5,s0,bed0 <__umoddi3+0x644>
    b964:	40878433          	sub	s0,a5,s0
    b968:	000a8593          	mv	a1,s5
    b96c:	00040513          	mv	a0,s0
    b970:	108030ef          	jal	ea78 <__hidden___udivsi3>
    b974:	000b0593          	mv	a1,s6
    b978:	03c030ef          	jal	e9b4 <__mulsi3>
    b97c:	00050793          	mv	a5,a0
    b980:	000a8593          	mv	a1,s5
    b984:	00040513          	mv	a0,s0
    b988:	00078413          	mv	s0,a5
    b98c:	134030ef          	jal	eac0 <__umodsi3>
    b990:	01091793          	sll	a5,s2,0x10
    b994:	01051513          	sll	a0,a0,0x10
    b998:	0107d793          	srl	a5,a5,0x10
    b99c:	00a7e7b3          	or	a5,a5,a0
    b9a0:	0087f863          	bgeu	a5,s0,b9b0 <__umoddi3+0x124>
    b9a4:	00fa07b3          	add	a5,s4,a5
    b9a8:	0147e463          	bltu	a5,s4,b9b0 <__umoddi3+0x124>
    b9ac:	5087ea63          	bltu	a5,s0,bec0 <__umoddi3+0x634>
    b9b0:	01012b03          	lw	s6,16(sp)
    b9b4:	408787b3          	sub	a5,a5,s0
    b9b8:	0097d533          	srl	a0,a5,s1
    b9bc:	02812403          	lw	s0,40(sp)
    b9c0:	02412483          	lw	s1,36(sp)
    b9c4:	02012903          	lw	s2,32(sp)
    b9c8:	01c12983          	lw	s3,28(sp)
    b9cc:	01812a03          	lw	s4,24(sp)
    b9d0:	01412a83          	lw	s5,20(sp)
    b9d4:	00000593          	li	a1,0
    b9d8:	02c12083          	lw	ra,44(sp)
    b9dc:	03010113          	add	sp,sp,48
    b9e0:	00008067          	ret
    b9e4:	00050893          	mv	a7,a0
    b9e8:	fed5e8e3          	bltu	a1,a3,b9d8 <__umoddi3+0x14c>
    b9ec:	03212023          	sw	s2,32(sp)
    b9f0:	01312e23          	sw	s3,28(sp)
    b9f4:	00010737          	lui	a4,0x10
    b9f8:	00058813          	mv	a6,a1
    b9fc:	24e6ec63          	bltu	a3,a4,bc54 <__umoddi3+0x3c8>
    ba00:	01000737          	lui	a4,0x1000
    ba04:	01800513          	li	a0,24
    ba08:	00e6f463          	bgeu	a3,a4,ba10 <__umoddi3+0x184>
    ba0c:	01000513          	li	a0,16
    ba10:	00a6d333          	srl	t1,a3,a0
    ba14:	00004717          	auipc	a4,0x4
    ba18:	bd470713          	add	a4,a4,-1068 # f5e8 <__clz_tab>
    ba1c:	00670733          	add	a4,a4,t1
    ba20:	00074703          	lbu	a4,0(a4)
    ba24:	02000313          	li	t1,32
    ba28:	00a709b3          	add	s3,a4,a0
    ba2c:	41330933          	sub	s2,t1,s3
    ba30:	25331a63          	bne	t1,s3,bc84 <__umoddi3+0x3f8>
    ba34:	00b6e463          	bltu	a3,a1,ba3c <__umoddi3+0x1b0>
    ba38:	00c7ea63          	bltu	a5,a2,ba4c <__umoddi3+0x1c0>
    ba3c:	40c788b3          	sub	a7,a5,a2
    ba40:	40d586b3          	sub	a3,a1,a3
    ba44:	0117b833          	sltu	a6,a5,a7
    ba48:	41068833          	sub	a6,a3,a6
    ba4c:	02c12083          	lw	ra,44(sp)
    ba50:	02012903          	lw	s2,32(sp)
    ba54:	01c12983          	lw	s3,28(sp)
    ba58:	00088513          	mv	a0,a7
    ba5c:	00080593          	mv	a1,a6
    ba60:	03010113          	add	sp,sp,48
    ba64:	00008067          	ret
    ba68:	0e060a63          	beqz	a2,bb5c <__umoddi3+0x2d0>
    ba6c:	00010737          	lui	a4,0x10
    ba70:	42e67663          	bgeu	a2,a4,be9c <__umoddi3+0x610>
    ba74:	10063693          	sltiu	a3,a2,256
    ba78:	0016b693          	seqz	a3,a3
    ba7c:	00369693          	sll	a3,a3,0x3
    ba80:	00d65533          	srl	a0,a2,a3
    ba84:	00004717          	auipc	a4,0x4
    ba88:	b6470713          	add	a4,a4,-1180 # f5e8 <__clz_tab>
    ba8c:	00a70733          	add	a4,a4,a0
    ba90:	00074983          	lbu	s3,0(a4)
    ba94:	02000713          	li	a4,32
    ba98:	00d989b3          	add	s3,s3,a3
    ba9c:	413704b3          	sub	s1,a4,s3
    baa0:	0f371263          	bne	a4,s3,bb84 <__umoddi3+0x2f8>
    baa4:	01061413          	sll	s0,a2,0x10
    baa8:	40c589b3          	sub	s3,a1,a2
    baac:	01065a93          	srl	s5,a2,0x10
    bab0:	01045413          	srl	s0,s0,0x10
    bab4:	000a8593          	mv	a1,s5
    bab8:	00098513          	mv	a0,s3
    babc:	7bd020ef          	jal	ea78 <__hidden___udivsi3>
    bac0:	00040593          	mv	a1,s0
    bac4:	6f1020ef          	jal	e9b4 <__mulsi3>
    bac8:	00050793          	mv	a5,a0
    bacc:	000a8593          	mv	a1,s5
    bad0:	00098513          	mv	a0,s3
    bad4:	00078993          	mv	s3,a5
    bad8:	7e9020ef          	jal	eac0 <__umodsi3>
    badc:	01051513          	sll	a0,a0,0x10
    bae0:	01095793          	srl	a5,s2,0x10
    bae4:	00a7e7b3          	or	a5,a5,a0
    bae8:	0137f863          	bgeu	a5,s3,baf8 <__umoddi3+0x26c>
    baec:	00fa07b3          	add	a5,s4,a5
    baf0:	0147e463          	bltu	a5,s4,baf8 <__umoddi3+0x26c>
    baf4:	3d37ea63          	bltu	a5,s3,bec8 <__umoddi3+0x63c>
    baf8:	413789b3          	sub	s3,a5,s3
    bafc:	000a8593          	mv	a1,s5
    bb00:	00098513          	mv	a0,s3
    bb04:	775020ef          	jal	ea78 <__hidden___udivsi3>
    bb08:	00040593          	mv	a1,s0
    bb0c:	6a9020ef          	jal	e9b4 <__mulsi3>
    bb10:	00050413          	mv	s0,a0
    bb14:	000a8593          	mv	a1,s5
    bb18:	00098513          	mv	a0,s3
    bb1c:	7a5020ef          	jal	eac0 <__umodsi3>
    bb20:	01091913          	sll	s2,s2,0x10
    bb24:	01051793          	sll	a5,a0,0x10
    bb28:	01095913          	srl	s2,s2,0x10
    bb2c:	00f967b3          	or	a5,s2,a5
    bb30:	0087fa63          	bgeu	a5,s0,bb44 <__umoddi3+0x2b8>
    bb34:	00fa07b3          	add	a5,s4,a5
    bb38:	0147e663          	bltu	a5,s4,bb44 <__umoddi3+0x2b8>
    bb3c:	0087f463          	bgeu	a5,s0,bb44 <__umoddi3+0x2b8>
    bb40:	014787b3          	add	a5,a5,s4
    bb44:	408787b3          	sub	a5,a5,s0
    bb48:	e71ff06f          	j	b9b8 <__umoddi3+0x12c>
    bb4c:	10063693          	sltiu	a3,a2,256
    bb50:	0016b693          	seqz	a3,a3
    bb54:	00369693          	sll	a3,a3,0x3
    bb58:	d89ff06f          	j	b8e0 <__umoddi3+0x54>
    bb5c:	00000513          	li	a0,0
    bb60:	00004717          	auipc	a4,0x4
    bb64:	a8870713          	add	a4,a4,-1400 # f5e8 <__clz_tab>
    bb68:	00a70733          	add	a4,a4,a0
    bb6c:	00074983          	lbu	s3,0(a4)
    bb70:	00000693          	li	a3,0
    bb74:	02000713          	li	a4,32
    bb78:	00d989b3          	add	s3,s3,a3
    bb7c:	413704b3          	sub	s1,a4,s3
    bb80:	f33702e3          	beq	a4,s3,baa4 <__umoddi3+0x218>
    bb84:	00961a33          	sll	s4,a2,s1
    bb88:	01712623          	sw	s7,12(sp)
    bb8c:	010a5a93          	srl	s5,s4,0x10
    bb90:	0135dbb3          	srl	s7,a1,s3
    bb94:	00959733          	sll	a4,a1,s1
    bb98:	0137d9b3          	srl	s3,a5,s3
    bb9c:	000a8593          	mv	a1,s5
    bba0:	000b8513          	mv	a0,s7
    bba4:	010a1413          	sll	s0,s4,0x10
    bba8:	00e9e9b3          	or	s3,s3,a4
    bbac:	00979933          	sll	s2,a5,s1
    bbb0:	01612823          	sw	s6,16(sp)
    bbb4:	01045413          	srl	s0,s0,0x10
    bbb8:	6c1020ef          	jal	ea78 <__hidden___udivsi3>
    bbbc:	00040593          	mv	a1,s0
    bbc0:	5f5020ef          	jal	e9b4 <__mulsi3>
    bbc4:	00050b13          	mv	s6,a0
    bbc8:	000a8593          	mv	a1,s5
    bbcc:	000b8513          	mv	a0,s7
    bbd0:	6f1020ef          	jal	eac0 <__umodsi3>
    bbd4:	01051513          	sll	a0,a0,0x10
    bbd8:	0109d793          	srl	a5,s3,0x10
    bbdc:	00a7e7b3          	or	a5,a5,a0
    bbe0:	0167fa63          	bgeu	a5,s6,bbf4 <__umoddi3+0x368>
    bbe4:	00fa07b3          	add	a5,s4,a5
    bbe8:	0147e663          	bltu	a5,s4,bbf4 <__umoddi3+0x368>
    bbec:	0167f463          	bgeu	a5,s6,bbf4 <__umoddi3+0x368>
    bbf0:	014787b3          	add	a5,a5,s4
    bbf4:	41678b33          	sub	s6,a5,s6
    bbf8:	000a8593          	mv	a1,s5
    bbfc:	000b0513          	mv	a0,s6
    bc00:	679020ef          	jal	ea78 <__hidden___udivsi3>
    bc04:	00040593          	mv	a1,s0
    bc08:	5ad020ef          	jal	e9b4 <__mulsi3>
    bc0c:	00050793          	mv	a5,a0
    bc10:	000a8593          	mv	a1,s5
    bc14:	000b0513          	mv	a0,s6
    bc18:	01099993          	sll	s3,s3,0x10
    bc1c:	00078b13          	mv	s6,a5
    bc20:	6a1020ef          	jal	eac0 <__umodsi3>
    bc24:	01051513          	sll	a0,a0,0x10
    bc28:	0109d993          	srl	s3,s3,0x10
    bc2c:	00a9e9b3          	or	s3,s3,a0
    bc30:	0169fa63          	bgeu	s3,s6,bc44 <__umoddi3+0x3b8>
    bc34:	013a09b3          	add	s3,s4,s3
    bc38:	0149e663          	bltu	s3,s4,bc44 <__umoddi3+0x3b8>
    bc3c:	0169f463          	bgeu	s3,s6,bc44 <__umoddi3+0x3b8>
    bc40:	014989b3          	add	s3,s3,s4
    bc44:	416989b3          	sub	s3,s3,s6
    bc48:	00c12b83          	lw	s7,12(sp)
    bc4c:	01012b03          	lw	s6,16(sp)
    bc50:	e65ff06f          	j	bab4 <__umoddi3+0x228>
    bc54:	1006b513          	sltiu	a0,a3,256
    bc58:	00153513          	seqz	a0,a0
    bc5c:	00351513          	sll	a0,a0,0x3
    bc60:	00a6d333          	srl	t1,a3,a0
    bc64:	00004717          	auipc	a4,0x4
    bc68:	98470713          	add	a4,a4,-1660 # f5e8 <__clz_tab>
    bc6c:	00670733          	add	a4,a4,t1
    bc70:	00074703          	lbu	a4,0(a4)
    bc74:	02000313          	li	t1,32
    bc78:	00a709b3          	add	s3,a4,a0
    bc7c:	41330933          	sub	s2,t1,s3
    bc80:	db330ae3          	beq	t1,s3,ba34 <__umoddi3+0x1a8>
    bc84:	01512a23          	sw	s5,20(sp)
    bc88:	012696b3          	sll	a3,a3,s2
    bc8c:	01365ab3          	srl	s5,a2,s3
    bc90:	00daeab3          	or	s5,s5,a3
    bc94:	01712623          	sw	s7,12(sp)
    bc98:	01a12023          	sw	s10,0(sp)
    bc9c:	010adb93          	srl	s7,s5,0x10
    bca0:	0135dd33          	srl	s10,a1,s3
    bca4:	01259733          	sll	a4,a1,s2
    bca8:	0137d6b3          	srl	a3,a5,s3
    bcac:	01912223          	sw	s9,4(sp)
    bcb0:	000b8593          	mv	a1,s7
    bcb4:	000d0513          	mv	a0,s10
    bcb8:	010a9c93          	sll	s9,s5,0x10
    bcbc:	02812423          	sw	s0,40(sp)
    bcc0:	02912223          	sw	s1,36(sp)
    bcc4:	01261433          	sll	s0,a2,s2
    bcc8:	012794b3          	sll	s1,a5,s2
    bccc:	01412c23          	sw	s4,24(sp)
    bcd0:	01612823          	sw	s6,16(sp)
    bcd4:	00e6ea33          	or	s4,a3,a4
    bcd8:	01812423          	sw	s8,8(sp)
    bcdc:	010cdc93          	srl	s9,s9,0x10
    bce0:	599020ef          	jal	ea78 <__hidden___udivsi3>
    bce4:	00050593          	mv	a1,a0
    bce8:	00050b13          	mv	s6,a0
    bcec:	000c8513          	mv	a0,s9
    bcf0:	4c5020ef          	jal	e9b4 <__mulsi3>
    bcf4:	00050c13          	mv	s8,a0
    bcf8:	000b8593          	mv	a1,s7
    bcfc:	000d0513          	mv	a0,s10
    bd00:	5c1020ef          	jal	eac0 <__umodsi3>
    bd04:	01051513          	sll	a0,a0,0x10
    bd08:	010a5793          	srl	a5,s4,0x10
    bd0c:	00a7e7b3          	or	a5,a5,a0
    bd10:	0187fe63          	bgeu	a5,s8,bd2c <__umoddi3+0x4a0>
    bd14:	00fa87b3          	add	a5,s5,a5
    bd18:	fffb0713          	add	a4,s6,-1
    bd1c:	1957ee63          	bltu	a5,s5,beb8 <__umoddi3+0x62c>
    bd20:	1987fc63          	bgeu	a5,s8,beb8 <__umoddi3+0x62c>
    bd24:	ffeb0b13          	add	s6,s6,-2
    bd28:	015787b3          	add	a5,a5,s5
    bd2c:	41878c33          	sub	s8,a5,s8
    bd30:	000b8593          	mv	a1,s7
    bd34:	000c0513          	mv	a0,s8
    bd38:	541020ef          	jal	ea78 <__hidden___udivsi3>
    bd3c:	00050593          	mv	a1,a0
    bd40:	00050d13          	mv	s10,a0
    bd44:	000c8513          	mv	a0,s9
    bd48:	46d020ef          	jal	e9b4 <__mulsi3>
    bd4c:	00050793          	mv	a5,a0
    bd50:	000b8593          	mv	a1,s7
    bd54:	000c0513          	mv	a0,s8
    bd58:	00078b93          	mv	s7,a5
    bd5c:	565020ef          	jal	eac0 <__umodsi3>
    bd60:	010a1593          	sll	a1,s4,0x10
    bd64:	01051513          	sll	a0,a0,0x10
    bd68:	0105d593          	srl	a1,a1,0x10
    bd6c:	00a5e5b3          	or	a1,a1,a0
    bd70:	0175fe63          	bgeu	a1,s7,bd8c <__umoddi3+0x500>
    bd74:	00ba85b3          	add	a1,s5,a1
    bd78:	fffd0793          	add	a5,s10,-1
    bd7c:	1355ea63          	bltu	a1,s5,beb0 <__umoddi3+0x624>
    bd80:	1375f863          	bgeu	a1,s7,beb0 <__umoddi3+0x624>
    bd84:	ffed0d13          	add	s10,s10,-2
    bd88:	015585b3          	add	a1,a1,s5
    bd8c:	010b1793          	sll	a5,s6,0x10
    bd90:	00010e37          	lui	t3,0x10
    bd94:	01a7e7b3          	or	a5,a5,s10
    bd98:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    bd9c:	0067f8b3          	and	a7,a5,t1
    bda0:	00647333          	and	t1,s0,t1
    bda4:	41758733          	sub	a4,a1,s7
    bda8:	0107d793          	srl	a5,a5,0x10
    bdac:	01045e93          	srl	t4,s0,0x10
    bdb0:	00088513          	mv	a0,a7
    bdb4:	00030593          	mv	a1,t1
    bdb8:	3fd020ef          	jal	e9b4 <__mulsi3>
    bdbc:	00050813          	mv	a6,a0
    bdc0:	000e8593          	mv	a1,t4
    bdc4:	00088513          	mv	a0,a7
    bdc8:	3ed020ef          	jal	e9b4 <__mulsi3>
    bdcc:	00050893          	mv	a7,a0
    bdd0:	00030593          	mv	a1,t1
    bdd4:	00078513          	mv	a0,a5
    bdd8:	3dd020ef          	jal	e9b4 <__mulsi3>
    bddc:	00050313          	mv	t1,a0
    bde0:	000e8593          	mv	a1,t4
    bde4:	00078513          	mv	a0,a5
    bde8:	3cd020ef          	jal	e9b4 <__mulsi3>
    bdec:	01085793          	srl	a5,a6,0x10
    bdf0:	006888b3          	add	a7,a7,t1
    bdf4:	011787b3          	add	a5,a5,a7
    bdf8:	0067f463          	bgeu	a5,t1,be00 <__umoddi3+0x574>
    bdfc:	01c50533          	add	a0,a0,t3
    be00:	00010637          	lui	a2,0x10
    be04:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    be08:	0107d693          	srl	a3,a5,0x10
    be0c:	00c7f7b3          	and	a5,a5,a2
    be10:	01079793          	sll	a5,a5,0x10
    be14:	00c87833          	and	a6,a6,a2
    be18:	00a686b3          	add	a3,a3,a0
    be1c:	010787b3          	add	a5,a5,a6
    be20:	06d76263          	bltu	a4,a3,be84 <__umoddi3+0x5f8>
    be24:	04d70e63          	beq	a4,a3,be80 <__umoddi3+0x5f4>
    be28:	40f487b3          	sub	a5,s1,a5
    be2c:	00f4b4b3          	sltu	s1,s1,a5
    be30:	02812403          	lw	s0,40(sp)
    be34:	02c12083          	lw	ra,44(sp)
    be38:	40d705b3          	sub	a1,a4,a3
    be3c:	409585b3          	sub	a1,a1,s1
    be40:	01359733          	sll	a4,a1,s3
    be44:	0127d7b3          	srl	a5,a5,s2
    be48:	02412483          	lw	s1,36(sp)
    be4c:	01c12983          	lw	s3,28(sp)
    be50:	01812a03          	lw	s4,24(sp)
    be54:	01412a83          	lw	s5,20(sp)
    be58:	01012b03          	lw	s6,16(sp)
    be5c:	00c12b83          	lw	s7,12(sp)
    be60:	00812c03          	lw	s8,8(sp)
    be64:	00412c83          	lw	s9,4(sp)
    be68:	00012d03          	lw	s10,0(sp)
    be6c:	0125d5b3          	srl	a1,a1,s2
    be70:	00f76533          	or	a0,a4,a5
    be74:	02012903          	lw	s2,32(sp)
    be78:	03010113          	add	sp,sp,48
    be7c:	00008067          	ret
    be80:	faf4f4e3          	bgeu	s1,a5,be28 <__umoddi3+0x59c>
    be84:	40878433          	sub	s0,a5,s0
    be88:	0087b7b3          	sltu	a5,a5,s0
    be8c:	01578ab3          	add	s5,a5,s5
    be90:	415686b3          	sub	a3,a3,s5
    be94:	00040793          	mv	a5,s0
    be98:	f91ff06f          	j	be28 <__umoddi3+0x59c>
    be9c:	01000737          	lui	a4,0x1000
    bea0:	02e67c63          	bgeu	a2,a4,bed8 <__umoddi3+0x64c>
    bea4:	01065513          	srl	a0,a2,0x10
    bea8:	01000693          	li	a3,16
    beac:	bd9ff06f          	j	ba84 <__umoddi3+0x1f8>
    beb0:	00078d13          	mv	s10,a5
    beb4:	ed9ff06f          	j	bd8c <__umoddi3+0x500>
    beb8:	00070b13          	mv	s6,a4
    bebc:	e71ff06f          	j	bd2c <__umoddi3+0x4a0>
    bec0:	014787b3          	add	a5,a5,s4
    bec4:	aedff06f          	j	b9b0 <__umoddi3+0x124>
    bec8:	014787b3          	add	a5,a5,s4
    becc:	c2dff06f          	j	baf8 <__umoddi3+0x26c>
    bed0:	014787b3          	add	a5,a5,s4
    bed4:	a91ff06f          	j	b964 <__umoddi3+0xd8>
    bed8:	01865513          	srl	a0,a2,0x18
    bedc:	01800693          	li	a3,24
    bee0:	ba5ff06f          	j	ba84 <__umoddi3+0x1f8>

0000bee4 <__adddf3>:
    bee4:	001007b7          	lui	a5,0x100
    bee8:	fe010113          	add	sp,sp,-32
    beec:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    bef0:	00bef833          	and	a6,t4,a1
    bef4:	00def7b3          	and	a5,t4,a3
    bef8:	0146d313          	srl	t1,a3,0x14
    befc:	01212823          	sw	s2,16(sp)
    bf00:	0145d913          	srl	s2,a1,0x14
    bf04:	00379793          	sll	a5,a5,0x3
    bf08:	00812c23          	sw	s0,24(sp)
    bf0c:	00381813          	sll	a6,a6,0x3
    bf10:	01f5d413          	srl	s0,a1,0x1f
    bf14:	01d55713          	srl	a4,a0,0x1d
    bf18:	01d65893          	srl	a7,a2,0x1d
    bf1c:	7ff97913          	and	s2,s2,2047
    bf20:	7ff37313          	and	t1,t1,2047
    bf24:	00112e23          	sw	ra,28(sp)
    bf28:	00912a23          	sw	s1,20(sp)
    bf2c:	01312623          	sw	s3,12(sp)
    bf30:	01f6d693          	srl	a3,a3,0x1f
    bf34:	00f8e8b3          	or	a7,a7,a5
    bf38:	01076733          	or	a4,a4,a6
    bf3c:	00351593          	sll	a1,a0,0x3
    bf40:	00361f13          	sll	t5,a2,0x3
    bf44:	406907b3          	sub	a5,s2,t1
    bf48:	1ed40463          	beq	s0,a3,c130 <__adddf3+0x24c>
    bf4c:	16f05263          	blez	a5,c0b0 <__adddf3+0x1cc>
    bf50:	28030663          	beqz	t1,c1dc <__adddf3+0x2f8>
    bf54:	7ff00693          	li	a3,2047
    bf58:	42d90663          	beq	s2,a3,c384 <__adddf3+0x4a0>
    bf5c:	03800693          	li	a3,56
    bf60:	00100613          	li	a2,1
    bf64:	02f6ce63          	blt	a3,a5,bfa0 <__adddf3+0xbc>
    bf68:	008006b7          	lui	a3,0x800
    bf6c:	00d8e8b3          	or	a7,a7,a3
    bf70:	01f00693          	li	a3,31
    bf74:	52f6ce63          	blt	a3,a5,c4b0 <__adddf3+0x5cc>
    bf78:	02000693          	li	a3,32
    bf7c:	40f686b3          	sub	a3,a3,a5
    bf80:	00d89633          	sll	a2,a7,a3
    bf84:	00ff5533          	srl	a0,t5,a5
    bf88:	00df16b3          	sll	a3,t5,a3
    bf8c:	00a66633          	or	a2,a2,a0
    bf90:	00d036b3          	snez	a3,a3
    bf94:	00f8d8b3          	srl	a7,a7,a5
    bf98:	00d66633          	or	a2,a2,a3
    bf9c:	41170733          	sub	a4,a4,a7
    bfa0:	40c58633          	sub	a2,a1,a2
    bfa4:	00c5b5b3          	sltu	a1,a1,a2
    bfa8:	00060493          	mv	s1,a2
    bfac:	40b709b3          	sub	s3,a4,a1
    bfb0:	00899793          	sll	a5,s3,0x8
    bfb4:	3207da63          	bgez	a5,c2e8 <__adddf3+0x404>
    bfb8:	008007b7          	lui	a5,0x800
    bfbc:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    bfc0:	00f9f9b3          	and	s3,s3,a5
    bfc4:	2c098863          	beqz	s3,c294 <__adddf3+0x3b0>
    bfc8:	00098513          	mv	a0,s3
    bfcc:	359020ef          	jal	eb24 <__clzsi2>
    bfd0:	ff850793          	add	a5,a0,-8
    bfd4:	02000693          	li	a3,32
    bfd8:	40f68733          	sub	a4,a3,a5
    bfdc:	00e4d733          	srl	a4,s1,a4
    bfe0:	00f999b3          	sll	s3,s3,a5
    bfe4:	01376733          	or	a4,a4,s3
    bfe8:	00f494b3          	sll	s1,s1,a5
    bfec:	4b27c863          	blt	a5,s2,c49c <__adddf3+0x5b8>
    bff0:	412787b3          	sub	a5,a5,s2
    bff4:	00178793          	add	a5,a5,1
    bff8:	40f686b3          	sub	a3,a3,a5
    bffc:	00d49633          	sll	a2,s1,a3
    c000:	00f4d9b3          	srl	s3,s1,a5
    c004:	00c03633          	snez	a2,a2
    c008:	01366633          	or	a2,a2,s3
    c00c:	00d716b3          	sll	a3,a4,a3
    c010:	00c6e4b3          	or	s1,a3,a2
    c014:	00f759b3          	srl	s3,a4,a5
    c018:	00000913          	li	s2,0
    c01c:	0074f793          	and	a5,s1,7
    c020:	02078063          	beqz	a5,c040 <__adddf3+0x15c>
    c024:	00f4f793          	and	a5,s1,15
    c028:	00400713          	li	a4,4
    c02c:	00e78a63          	beq	a5,a4,c040 <__adddf3+0x15c>
    c030:	00448793          	add	a5,s1,4
    c034:	0097b633          	sltu	a2,a5,s1
    c038:	00c989b3          	add	s3,s3,a2
    c03c:	00078493          	mv	s1,a5
    c040:	00899793          	sll	a5,s3,0x8
    c044:	6e07da63          	bgez	a5,c738 <__adddf3+0x854>
    c048:	00190793          	add	a5,s2,1
    c04c:	7ff00713          	li	a4,2047
    c050:	00040e13          	mv	t3,s0
    c054:	2ae78663          	beq	a5,a4,c300 <__adddf3+0x41c>
    c058:	ff800737          	lui	a4,0xff800
    c05c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c060:	00e9f733          	and	a4,s3,a4
    c064:	7ff7f793          	and	a5,a5,2047
    c068:	01d71813          	sll	a6,a4,0x1d
    c06c:	0034d613          	srl	a2,s1,0x3
    c070:	00971713          	sll	a4,a4,0x9
    c074:	00c86833          	or	a6,a6,a2
    c078:	00c75713          	srl	a4,a4,0xc
    c07c:	01c12083          	lw	ra,28(sp)
    c080:	01812403          	lw	s0,24(sp)
    c084:	01479793          	sll	a5,a5,0x14
    c088:	00e7e7b3          	or	a5,a5,a4
    c08c:	01fe1713          	sll	a4,t3,0x1f
    c090:	00e7e7b3          	or	a5,a5,a4
    c094:	01412483          	lw	s1,20(sp)
    c098:	01012903          	lw	s2,16(sp)
    c09c:	00c12983          	lw	s3,12(sp)
    c0a0:	00080513          	mv	a0,a6
    c0a4:	00078593          	mv	a1,a5
    c0a8:	02010113          	add	sp,sp,32
    c0ac:	00008067          	ret
    c0b0:	14078c63          	beqz	a5,c208 <__adddf3+0x324>
    c0b4:	412307b3          	sub	a5,t1,s2
    c0b8:	3c091263          	bnez	s2,c47c <__adddf3+0x598>
    c0bc:	00b76533          	or	a0,a4,a1
    c0c0:	4c050463          	beqz	a0,c588 <__adddf3+0x6a4>
    c0c4:	fff78513          	add	a0,a5,-1
    c0c8:	60050263          	beqz	a0,c6cc <__adddf3+0x7e8>
    c0cc:	7ff00813          	li	a6,2047
    c0d0:	57078663          	beq	a5,a6,c63c <__adddf3+0x758>
    c0d4:	03800793          	li	a5,56
    c0d8:	00100613          	li	a2,1
    c0dc:	02a7cc63          	blt	a5,a0,c114 <__adddf3+0x230>
    c0e0:	00050793          	mv	a5,a0
    c0e4:	01f00613          	li	a2,31
    c0e8:	56f64c63          	blt	a2,a5,c660 <__adddf3+0x77c>
    c0ec:	02000513          	li	a0,32
    c0f0:	40f50533          	sub	a0,a0,a5
    c0f4:	00a71633          	sll	a2,a4,a0
    c0f8:	00f5d833          	srl	a6,a1,a5
    c0fc:	00a59533          	sll	a0,a1,a0
    c100:	01066633          	or	a2,a2,a6
    c104:	00a03533          	snez	a0,a0
    c108:	00f75733          	srl	a4,a4,a5
    c10c:	00a66633          	or	a2,a2,a0
    c110:	40e888b3          	sub	a7,a7,a4
    c114:	40cf0633          	sub	a2,t5,a2
    c118:	00cf3733          	sltu	a4,t5,a2
    c11c:	00060493          	mv	s1,a2
    c120:	40e889b3          	sub	s3,a7,a4
    c124:	00030913          	mv	s2,t1
    c128:	00068413          	mv	s0,a3
    c12c:	e85ff06f          	j	bfb0 <__adddf3+0xcc>
    c130:	1ef05063          	blez	a5,c310 <__adddf3+0x42c>
    c134:	14031063          	bnez	t1,c274 <__adddf3+0x390>
    c138:	01e8e6b3          	or	a3,a7,t5
    c13c:	26068c63          	beqz	a3,c3b4 <__adddf3+0x4d0>
    c140:	fff78693          	add	a3,a5,-1
    c144:	48068063          	beqz	a3,c5c4 <__adddf3+0x6e0>
    c148:	7ff00613          	li	a2,2047
    c14c:	22c78c63          	beq	a5,a2,c384 <__adddf3+0x4a0>
    c150:	03800793          	li	a5,56
    c154:	00100993          	li	s3,1
    c158:	02d7cc63          	blt	a5,a3,c190 <__adddf3+0x2ac>
    c15c:	00068793          	mv	a5,a3
    c160:	01f00693          	li	a3,31
    c164:	4af6c063          	blt	a3,a5,c604 <__adddf3+0x720>
    c168:	02000693          	li	a3,32
    c16c:	40f686b3          	sub	a3,a3,a5
    c170:	00d899b3          	sll	s3,a7,a3
    c174:	00ff5633          	srl	a2,t5,a5
    c178:	00df16b3          	sll	a3,t5,a3
    c17c:	00c9e9b3          	or	s3,s3,a2
    c180:	00d036b3          	snez	a3,a3
    c184:	00f8d8b3          	srl	a7,a7,a5
    c188:	00d9e9b3          	or	s3,s3,a3
    c18c:	01170733          	add	a4,a4,a7
    c190:	00b985b3          	add	a1,s3,a1
    c194:	0135b9b3          	sltu	s3,a1,s3
    c198:	00058493          	mv	s1,a1
    c19c:	00e989b3          	add	s3,s3,a4
    c1a0:	00899793          	sll	a5,s3,0x8
    c1a4:	1407d263          	bgez	a5,c2e8 <__adddf3+0x404>
    c1a8:	00190913          	add	s2,s2,1
    c1ac:	7ff00793          	li	a5,2047
    c1b0:	36f90c63          	beq	s2,a5,c528 <__adddf3+0x644>
    c1b4:	ff8007b7          	lui	a5,0xff800
    c1b8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c1bc:	0014f613          	and	a2,s1,1
    c1c0:	00f9f7b3          	and	a5,s3,a5
    c1c4:	0014d713          	srl	a4,s1,0x1
    c1c8:	00c76733          	or	a4,a4,a2
    c1cc:	01f79613          	sll	a2,a5,0x1f
    c1d0:	00e664b3          	or	s1,a2,a4
    c1d4:	0017d993          	srl	s3,a5,0x1
    c1d8:	e45ff06f          	j	c01c <__adddf3+0x138>
    c1dc:	01e8e6b3          	or	a3,a7,t5
    c1e0:	1c068a63          	beqz	a3,c3b4 <__adddf3+0x4d0>
    c1e4:	fff78693          	add	a3,a5,-1
    c1e8:	40068063          	beqz	a3,c5e8 <__adddf3+0x704>
    c1ec:	7ff00613          	li	a2,2047
    c1f0:	18c78a63          	beq	a5,a2,c384 <__adddf3+0x4a0>
    c1f4:	03800793          	li	a5,56
    c1f8:	00100613          	li	a2,1
    c1fc:	dad7c2e3          	blt	a5,a3,bfa0 <__adddf3+0xbc>
    c200:	00068793          	mv	a5,a3
    c204:	d6dff06f          	j	bf70 <__adddf3+0x8c>
    c208:	00190813          	add	a6,s2,1
    c20c:	7fe87813          	and	a6,a6,2046
    c210:	22081c63          	bnez	a6,c448 <__adddf3+0x564>
    c214:	00b76333          	or	t1,a4,a1
    c218:	01e8e833          	or	a6,a7,t5
    c21c:	38091063          	bnez	s2,c59c <__adddf3+0x6b8>
    c220:	46030e63          	beqz	t1,c69c <__adddf3+0x7b8>
    c224:	40080663          	beqz	a6,c630 <__adddf3+0x74c>
    c228:	41e589b3          	sub	s3,a1,t5
    c22c:	0135b533          	sltu	a0,a1,s3
    c230:	41170633          	sub	a2,a4,a7
    c234:	40a60633          	sub	a2,a2,a0
    c238:	00861513          	sll	a0,a2,0x8
    c23c:	50055e63          	bgez	a0,c758 <__adddf3+0x874>
    c240:	40bf05b3          	sub	a1,t5,a1
    c244:	40e88733          	sub	a4,a7,a4
    c248:	00bf3f33          	sltu	t5,t5,a1
    c24c:	41e70733          	sub	a4,a4,t5
    c250:	00871613          	sll	a2,a4,0x8
    c254:	00058493          	mv	s1,a1
    c258:	52065e63          	bgez	a2,c794 <__adddf3+0x8b0>
    c25c:	ff8007b7          	lui	a5,0xff800
    c260:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c264:	00f77733          	and	a4,a4,a5
    c268:	00068e13          	mv	t3,a3
    c26c:	00100793          	li	a5,1
    c270:	df9ff06f          	j	c068 <__adddf3+0x184>
    c274:	7ff00693          	li	a3,2047
    c278:	10d90663          	beq	s2,a3,c384 <__adddf3+0x4a0>
    c27c:	03800693          	li	a3,56
    c280:	00100993          	li	s3,1
    c284:	f0f6c6e3          	blt	a3,a5,c190 <__adddf3+0x2ac>
    c288:	008006b7          	lui	a3,0x800
    c28c:	00d8e8b3          	or	a7,a7,a3
    c290:	ed1ff06f          	j	c160 <__adddf3+0x27c>
    c294:	00048513          	mv	a0,s1
    c298:	08d020ef          	jal	eb24 <__clzsi2>
    c29c:	01850793          	add	a5,a0,24
    c2a0:	01f00693          	li	a3,31
    c2a4:	d2f6d8e3          	bge	a3,a5,bfd4 <__adddf3+0xf0>
    c2a8:	ff850713          	add	a4,a0,-8
    c2ac:	00e49733          	sll	a4,s1,a4
    c2b0:	2327c663          	blt	a5,s2,c4dc <__adddf3+0x5f8>
    c2b4:	41278933          	sub	s2,a5,s2
    c2b8:	00190793          	add	a5,s2,1
    c2bc:	48f6d663          	bge	a3,a5,c748 <__adddf3+0x864>
    c2c0:	fe190913          	add	s2,s2,-31
    c2c4:	02000693          	li	a3,32
    c2c8:	012754b3          	srl	s1,a4,s2
    c2cc:	00d78c63          	beq	a5,a3,c2e4 <__adddf3+0x400>
    c2d0:	04000693          	li	a3,64
    c2d4:	40f687b3          	sub	a5,a3,a5
    c2d8:	00f71733          	sll	a4,a4,a5
    c2dc:	00e03733          	snez	a4,a4
    c2e0:	00e4e4b3          	or	s1,s1,a4
    c2e4:	00000913          	li	s2,0
    c2e8:	0074f793          	and	a5,s1,7
    c2ec:	d2079ce3          	bnez	a5,c024 <__adddf3+0x140>
    c2f0:	00090793          	mv	a5,s2
    c2f4:	0034d613          	srl	a2,s1,0x3
    c2f8:	00098713          	mv	a4,s3
    c2fc:	0c00006f          	j	c3bc <__adddf3+0x4d8>
    c300:	7ff00793          	li	a5,2047
    c304:	00000713          	li	a4,0
    c308:	00000813          	li	a6,0
    c30c:	d71ff06f          	j	c07c <__adddf3+0x198>
    c310:	0c078a63          	beqz	a5,c3e4 <__adddf3+0x500>
    c314:	412307b3          	sub	a5,t1,s2
    c318:	1e090263          	beqz	s2,c4fc <__adddf3+0x618>
    c31c:	7ff00693          	li	a3,2047
    c320:	32d30863          	beq	t1,a3,c650 <__adddf3+0x76c>
    c324:	03800693          	li	a3,56
    c328:	00100993          	li	s3,1
    c32c:	02f6ce63          	blt	a3,a5,c368 <__adddf3+0x484>
    c330:	008006b7          	lui	a3,0x800
    c334:	00d76733          	or	a4,a4,a3
    c338:	01f00693          	li	a3,31
    c33c:	3cf6c863          	blt	a3,a5,c70c <__adddf3+0x828>
    c340:	02000693          	li	a3,32
    c344:	40f686b3          	sub	a3,a3,a5
    c348:	00d719b3          	sll	s3,a4,a3
    c34c:	00f5d633          	srl	a2,a1,a5
    c350:	00d596b3          	sll	a3,a1,a3
    c354:	00c9e9b3          	or	s3,s3,a2
    c358:	00d036b3          	snez	a3,a3
    c35c:	00f75733          	srl	a4,a4,a5
    c360:	00d9e9b3          	or	s3,s3,a3
    c364:	00e888b3          	add	a7,a7,a4
    c368:	01e98733          	add	a4,s3,t5
    c36c:	013739b3          	sltu	s3,a4,s3
    c370:	00070493          	mv	s1,a4
    c374:	011989b3          	add	s3,s3,a7
    c378:	00030913          	mv	s2,t1
    c37c:	e25ff06f          	j	c1a0 <__adddf3+0x2bc>
    c380:	02081063          	bnez	a6,c3a0 <__adddf3+0x4bc>
    c384:	00351613          	sll	a2,a0,0x3
    c388:	00365613          	srl	a2,a2,0x3
    c38c:	01d71813          	sll	a6,a4,0x1d
    c390:	00c86833          	or	a6,a6,a2
    c394:	00375713          	srl	a4,a4,0x3
    c398:	01076733          	or	a4,a4,a6
    c39c:	18070663          	beqz	a4,c528 <__adddf3+0x644>
    c3a0:	00000e13          	li	t3,0
    c3a4:	7ff00793          	li	a5,2047
    c3a8:	00080737          	lui	a4,0x80
    c3ac:	00000813          	li	a6,0
    c3b0:	ccdff06f          	j	c07c <__adddf3+0x198>
    c3b4:	00351613          	sll	a2,a0,0x3
    c3b8:	00365613          	srl	a2,a2,0x3
    c3bc:	01d71813          	sll	a6,a4,0x1d
    c3c0:	7ff00693          	li	a3,2047
    c3c4:	00c86833          	or	a6,a6,a2
    c3c8:	00375713          	srl	a4,a4,0x3
    c3cc:	fcd786e3          	beq	a5,a3,c398 <__adddf3+0x4b4>
    c3d0:	00c71713          	sll	a4,a4,0xc
    c3d4:	00c75713          	srl	a4,a4,0xc
    c3d8:	7ff7f793          	and	a5,a5,2047
    c3dc:	00040e13          	mv	t3,s0
    c3e0:	c9dff06f          	j	c07c <__adddf3+0x198>
    c3e4:	00190693          	add	a3,s2,1
    c3e8:	7fe6f813          	and	a6,a3,2046
    c3ec:	14081863          	bnez	a6,c53c <__adddf3+0x658>
    c3f0:	00b766b3          	or	a3,a4,a1
    c3f4:	28091c63          	bnez	s2,c68c <__adddf3+0x7a8>
    c3f8:	30068263          	beqz	a3,c6fc <__adddf3+0x818>
    c3fc:	01e8e6b3          	or	a3,a7,t5
    c400:	22068863          	beqz	a3,c630 <__adddf3+0x74c>
    c404:	01e587b3          	add	a5,a1,t5
    c408:	00b7b5b3          	sltu	a1,a5,a1
    c40c:	01170733          	add	a4,a4,a7
    c410:	00b70733          	add	a4,a4,a1
    c414:	0037d813          	srl	a6,a5,0x3
    c418:	00871793          	sll	a5,a4,0x8
    c41c:	00040e13          	mv	t3,s0
    c420:	3407de63          	bgez	a5,c77c <__adddf3+0x898>
    c424:	ff8007b7          	lui	a5,0xff800
    c428:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c42c:	00f77733          	and	a4,a4,a5
    c430:	01d71793          	sll	a5,a4,0x1d
    c434:	00375713          	srl	a4,a4,0x3
    c438:	0107e833          	or	a6,a5,a6
    c43c:	01d77733          	and	a4,a4,t4
    c440:	00100793          	li	a5,1
    c444:	c39ff06f          	j	c07c <__adddf3+0x198>
    c448:	41e58833          	sub	a6,a1,t5
    c44c:	0105b7b3          	sltu	a5,a1,a6
    c450:	411709b3          	sub	s3,a4,a7
    c454:	40f989b3          	sub	s3,s3,a5
    c458:	00899793          	sll	a5,s3,0x8
    c45c:	00080493          	mv	s1,a6
    c460:	1007c663          	bltz	a5,c56c <__adddf3+0x688>
    c464:	01386833          	or	a6,a6,s3
    c468:	b4081ee3          	bnez	a6,bfc4 <__adddf3+0xe0>
    c46c:	00000e13          	li	t3,0
    c470:	00000793          	li	a5,0
    c474:	00000713          	li	a4,0
    c478:	c05ff06f          	j	c07c <__adddf3+0x198>
    c47c:	7ff00513          	li	a0,2047
    c480:	1aa30e63          	beq	t1,a0,c63c <__adddf3+0x758>
    c484:	03800513          	li	a0,56
    c488:	00100613          	li	a2,1
    c48c:	c8f544e3          	blt	a0,a5,c114 <__adddf3+0x230>
    c490:	00800637          	lui	a2,0x800
    c494:	00c76733          	or	a4,a4,a2
    c498:	c4dff06f          	j	c0e4 <__adddf3+0x200>
    c49c:	ff8009b7          	lui	s3,0xff800
    c4a0:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c4a4:	40f90933          	sub	s2,s2,a5
    c4a8:	013779b3          	and	s3,a4,s3
    c4ac:	b71ff06f          	j	c01c <__adddf3+0x138>
    c4b0:	fe078693          	add	a3,a5,-32
    c4b4:	02000613          	li	a2,32
    c4b8:	00d8d6b3          	srl	a3,a7,a3
    c4bc:	00c78a63          	beq	a5,a2,c4d0 <__adddf3+0x5ec>
    c4c0:	04000613          	li	a2,64
    c4c4:	40f607b3          	sub	a5,a2,a5
    c4c8:	00f897b3          	sll	a5,a7,a5
    c4cc:	00ff6f33          	or	t5,t5,a5
    c4d0:	01e03633          	snez	a2,t5
    c4d4:	00d66633          	or	a2,a2,a3
    c4d8:	ac9ff06f          	j	bfa0 <__adddf3+0xbc>
    c4dc:	ff8006b7          	lui	a3,0xff800
    c4e0:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c4e4:	40f907b3          	sub	a5,s2,a5
    c4e8:	00d77733          	and	a4,a4,a3
    c4ec:	01d71813          	sll	a6,a4,0x1d
    c4f0:	01386833          	or	a6,a6,s3
    c4f4:	00375713          	srl	a4,a4,0x3
    c4f8:	ed9ff06f          	j	c3d0 <__adddf3+0x4ec>
    c4fc:	00b766b3          	or	a3,a4,a1
    c500:	1e068663          	beqz	a3,c6ec <__adddf3+0x808>
    c504:	fff78693          	add	a3,a5,-1
    c508:	0a068e63          	beqz	a3,c5c4 <__adddf3+0x6e0>
    c50c:	7ff00513          	li	a0,2047
    c510:	14a78063          	beq	a5,a0,c650 <__adddf3+0x76c>
    c514:	03800793          	li	a5,56
    c518:	00100993          	li	s3,1
    c51c:	e4d7c6e3          	blt	a5,a3,c368 <__adddf3+0x484>
    c520:	00068793          	mv	a5,a3
    c524:	e15ff06f          	j	c338 <__adddf3+0x454>
    c528:	00040e13          	mv	t3,s0
    c52c:	7ff00793          	li	a5,2047
    c530:	00000713          	li	a4,0
    c534:	00000813          	li	a6,0
    c538:	b45ff06f          	j	c07c <__adddf3+0x198>
    c53c:	7ff00793          	li	a5,2047
    c540:	fef684e3          	beq	a3,a5,c528 <__adddf3+0x644>
    c544:	01e58f33          	add	t5,a1,t5
    c548:	00bf35b3          	sltu	a1,t5,a1
    c54c:	011707b3          	add	a5,a4,a7
    c550:	00b787b3          	add	a5,a5,a1
    c554:	01f79613          	sll	a2,a5,0x1f
    c558:	001f5f13          	srl	t5,t5,0x1
    c55c:	01e664b3          	or	s1,a2,t5
    c560:	0017d993          	srl	s3,a5,0x1
    c564:	00068913          	mv	s2,a3
    c568:	ab5ff06f          	j	c01c <__adddf3+0x138>
    c56c:	40bf0633          	sub	a2,t5,a1
    c570:	40e887b3          	sub	a5,a7,a4
    c574:	00cf3733          	sltu	a4,t5,a2
    c578:	00060493          	mv	s1,a2
    c57c:	40e789b3          	sub	s3,a5,a4
    c580:	00068413          	mv	s0,a3
    c584:	a41ff06f          	j	bfc4 <__adddf3+0xe0>
    c588:	00361613          	sll	a2,a2,0x3
    c58c:	00365613          	srl	a2,a2,0x3
    c590:	00068413          	mv	s0,a3
    c594:	00088713          	mv	a4,a7
    c598:	e25ff06f          	j	c3bc <__adddf3+0x4d8>
    c59c:	de0312e3          	bnez	t1,c380 <__adddf3+0x49c>
    c5a0:	1c080663          	beqz	a6,c76c <__adddf3+0x888>
    c5a4:	0038d713          	srl	a4,a7,0x3
    c5a8:	00361613          	sll	a2,a2,0x3
    c5ac:	01d89893          	sll	a7,a7,0x1d
    c5b0:	01176733          	or	a4,a4,a7
    c5b4:	00365613          	srl	a2,a2,0x3
    c5b8:	00c76733          	or	a4,a4,a2
    c5bc:	00068413          	mv	s0,a3
    c5c0:	dddff06f          	j	c39c <__adddf3+0x4b8>
    c5c4:	01e58f33          	add	t5,a1,t5
    c5c8:	011708b3          	add	a7,a4,a7
    c5cc:	00bf35b3          	sltu	a1,t5,a1
    c5d0:	00b889b3          	add	s3,a7,a1
    c5d4:	00899793          	sll	a5,s3,0x8
    c5d8:	000f0493          	mv	s1,t5
    c5dc:	0e07d463          	bgez	a5,c6c4 <__adddf3+0x7e0>
    c5e0:	00200913          	li	s2,2
    c5e4:	bd1ff06f          	j	c1b4 <__adddf3+0x2d0>
    c5e8:	41e58f33          	sub	t5,a1,t5
    c5ec:	411708b3          	sub	a7,a4,a7
    c5f0:	01e5b5b3          	sltu	a1,a1,t5
    c5f4:	000f0493          	mv	s1,t5
    c5f8:	40b889b3          	sub	s3,a7,a1
    c5fc:	00100913          	li	s2,1
    c600:	9b1ff06f          	j	bfb0 <__adddf3+0xcc>
    c604:	fe078693          	add	a3,a5,-32
    c608:	02000613          	li	a2,32
    c60c:	00d8d6b3          	srl	a3,a7,a3
    c610:	00c78a63          	beq	a5,a2,c624 <__adddf3+0x740>
    c614:	04000613          	li	a2,64
    c618:	40f607b3          	sub	a5,a2,a5
    c61c:	00f897b3          	sll	a5,a7,a5
    c620:	00ff6f33          	or	t5,t5,a5
    c624:	01e039b3          	snez	s3,t5
    c628:	00d9e9b3          	or	s3,s3,a3
    c62c:	b65ff06f          	j	c190 <__adddf3+0x2ac>
    c630:	00351613          	sll	a2,a0,0x3
    c634:	00365993          	srl	s3,a2,0x3
    c638:	eb5ff06f          	j	c4ec <__adddf3+0x608>
    c63c:	00361613          	sll	a2,a2,0x3
    c640:	00365613          	srl	a2,a2,0x3
    c644:	00068413          	mv	s0,a3
    c648:	00088713          	mv	a4,a7
    c64c:	d41ff06f          	j	c38c <__adddf3+0x4a8>
    c650:	00361613          	sll	a2,a2,0x3
    c654:	00365613          	srl	a2,a2,0x3
    c658:	00088713          	mv	a4,a7
    c65c:	d31ff06f          	j	c38c <__adddf3+0x4a8>
    c660:	fe078513          	add	a0,a5,-32
    c664:	02000613          	li	a2,32
    c668:	00a75533          	srl	a0,a4,a0
    c66c:	00c78a63          	beq	a5,a2,c680 <__adddf3+0x79c>
    c670:	04000613          	li	a2,64
    c674:	40f607b3          	sub	a5,a2,a5
    c678:	00f717b3          	sll	a5,a4,a5
    c67c:	00f5e5b3          	or	a1,a1,a5
    c680:	00b03633          	snez	a2,a1
    c684:	00a66633          	or	a2,a2,a0
    c688:	a8dff06f          	j	c114 <__adddf3+0x230>
    c68c:	fc0682e3          	beqz	a3,c650 <__adddf3+0x76c>
    c690:	01e8ef33          	or	t5,a7,t5
    c694:	d00f16e3          	bnez	t5,c3a0 <__adddf3+0x4bc>
    c698:	cedff06f          	j	c384 <__adddf3+0x4a0>
    c69c:	dc0808e3          	beqz	a6,c46c <__adddf3+0x588>
    c6a0:	00361813          	sll	a6,a2,0x3
    c6a4:	01d89793          	sll	a5,a7,0x1d
    c6a8:	00385813          	srl	a6,a6,0x3
    c6ac:	0038d713          	srl	a4,a7,0x3
    c6b0:	00f86833          	or	a6,a6,a5
    c6b4:	01d77733          	and	a4,a4,t4
    c6b8:	00068e13          	mv	t3,a3
    c6bc:	00000793          	li	a5,0
    c6c0:	9bdff06f          	j	c07c <__adddf3+0x198>
    c6c4:	00100793          	li	a5,1
    c6c8:	c2dff06f          	j	c2f4 <__adddf3+0x410>
    c6cc:	40bf05b3          	sub	a1,t5,a1
    c6d0:	40e888b3          	sub	a7,a7,a4
    c6d4:	00bf3733          	sltu	a4,t5,a1
    c6d8:	00058493          	mv	s1,a1
    c6dc:	40e889b3          	sub	s3,a7,a4
    c6e0:	00068413          	mv	s0,a3
    c6e4:	00100913          	li	s2,1
    c6e8:	8c9ff06f          	j	bfb0 <__adddf3+0xcc>
    c6ec:	00361613          	sll	a2,a2,0x3
    c6f0:	00365613          	srl	a2,a2,0x3
    c6f4:	00088713          	mv	a4,a7
    c6f8:	cc5ff06f          	j	c3bc <__adddf3+0x4d8>
    c6fc:	00361613          	sll	a2,a2,0x3
    c700:	00365993          	srl	s3,a2,0x3
    c704:	00088713          	mv	a4,a7
    c708:	de5ff06f          	j	c4ec <__adddf3+0x608>
    c70c:	fe078693          	add	a3,a5,-32
    c710:	02000613          	li	a2,32
    c714:	00d756b3          	srl	a3,a4,a3
    c718:	00c78a63          	beq	a5,a2,c72c <__adddf3+0x848>
    c71c:	04000613          	li	a2,64
    c720:	40f607b3          	sub	a5,a2,a5
    c724:	00f717b3          	sll	a5,a4,a5
    c728:	00f5e5b3          	or	a1,a1,a5
    c72c:	00b039b3          	snez	s3,a1
    c730:	00d9e9b3          	or	s3,s3,a3
    c734:	c35ff06f          	j	c368 <__adddf3+0x484>
    c738:	0034d613          	srl	a2,s1,0x3
    c73c:	00090793          	mv	a5,s2
    c740:	00098713          	mv	a4,s3
    c744:	c79ff06f          	j	c3bc <__adddf3+0x4d8>
    c748:	02000693          	li	a3,32
    c74c:	40f686b3          	sub	a3,a3,a5
    c750:	00000613          	li	a2,0
    c754:	8b5ff06f          	j	c008 <__adddf3+0x124>
    c758:	00c9e833          	or	a6,s3,a2
    c75c:	d00808e3          	beqz	a6,c46c <__adddf3+0x588>
    c760:	0039d993          	srl	s3,s3,0x3
    c764:	00060713          	mv	a4,a2
    c768:	d85ff06f          	j	c4ec <__adddf3+0x608>
    c76c:	00000e13          	li	t3,0
    c770:	7ff00793          	li	a5,2047
    c774:	00080737          	lui	a4,0x80
    c778:	905ff06f          	j	c07c <__adddf3+0x198>
    c77c:	01d71793          	sll	a5,a4,0x1d
    c780:	00375713          	srl	a4,a4,0x3
    c784:	0107e833          	or	a6,a5,a6
    c788:	01d77733          	and	a4,a4,t4
    c78c:	00000793          	li	a5,0
    c790:	8edff06f          	j	c07c <__adddf3+0x198>
    c794:	01d71813          	sll	a6,a4,0x1d
    c798:	0035d593          	srl	a1,a1,0x3
    c79c:	00b86833          	or	a6,a6,a1
    c7a0:	00375713          	srl	a4,a4,0x3
    c7a4:	00068413          	mv	s0,a3
    c7a8:	c29ff06f          	j	c3d0 <__adddf3+0x4ec>

0000c7ac <__divdf3>:
    c7ac:	fb010113          	add	sp,sp,-80
    c7b0:	0145d793          	srl	a5,a1,0x14
    c7b4:	04812423          	sw	s0,72(sp)
    c7b8:	04912223          	sw	s1,68(sp)
    c7bc:	05212023          	sw	s2,64(sp)
    c7c0:	03412c23          	sw	s4,56(sp)
    c7c4:	03512a23          	sw	s5,52(sp)
    c7c8:	00c59493          	sll	s1,a1,0xc
    c7cc:	04112623          	sw	ra,76(sp)
    c7d0:	03312e23          	sw	s3,60(sp)
    c7d4:	03612823          	sw	s6,48(sp)
    c7d8:	03712623          	sw	s7,44(sp)
    c7dc:	03812423          	sw	s8,40(sp)
    c7e0:	7ff7f793          	and	a5,a5,2047
    c7e4:	00050413          	mv	s0,a0
    c7e8:	00060a13          	mv	s4,a2
    c7ec:	00068913          	mv	s2,a3
    c7f0:	00c4d493          	srl	s1,s1,0xc
    c7f4:	01f5da93          	srl	s5,a1,0x1f
    c7f8:	18078c63          	beqz	a5,c990 <__divdf3+0x1e4>
    c7fc:	7ff00713          	li	a4,2047
    c800:	08e78a63          	beq	a5,a4,c894 <__divdf3+0xe8>
    c804:	01d55b13          	srl	s6,a0,0x1d
    c808:	00349493          	sll	s1,s1,0x3
    c80c:	009b64b3          	or	s1,s6,s1
    c810:	00800737          	lui	a4,0x800
    c814:	00e4eb33          	or	s6,s1,a4
    c818:	00351b93          	sll	s7,a0,0x3
    c81c:	c0178993          	add	s3,a5,-1023
    c820:	00000493          	li	s1,0
    c824:	00000c13          	li	s8,0
    c828:	01495793          	srl	a5,s2,0x14
    c82c:	00c91413          	sll	s0,s2,0xc
    c830:	7ff7f793          	and	a5,a5,2047
    c834:	00c45413          	srl	s0,s0,0xc
    c838:	01f95913          	srl	s2,s2,0x1f
    c83c:	08078463          	beqz	a5,c8c4 <__divdf3+0x118>
    c840:	7ff00713          	li	a4,2047
    c844:	18e78c63          	beq	a5,a4,c9dc <__divdf3+0x230>
    c848:	00341413          	sll	s0,s0,0x3
    c84c:	01da5713          	srl	a4,s4,0x1d
    c850:	00876733          	or	a4,a4,s0
    c854:	c0178793          	add	a5,a5,-1023
    c858:	00800437          	lui	s0,0x800
    c85c:	40f989b3          	sub	s3,s3,a5
    c860:	00876433          	or	s0,a4,s0
    c864:	003a1813          	sll	a6,s4,0x3
    c868:	00000793          	li	a5,0
    c86c:	00f00713          	li	a4,15
    c870:	012aca33          	xor	s4,s5,s2
    c874:	24976663          	bltu	a4,s1,cac0 <__divdf3+0x314>
    c878:	00003697          	auipc	a3,0x3
    c87c:	d3068693          	add	a3,a3,-720 # f5a8 <__mprec_tens+0xc8>
    c880:	00249493          	sll	s1,s1,0x2
    c884:	00d484b3          	add	s1,s1,a3
    c888:	0004a703          	lw	a4,0(s1)
    c88c:	00d70733          	add	a4,a4,a3
    c890:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    c894:	00a4eb33          	or	s6,s1,a0
    c898:	1c0b1e63          	bnez	s6,ca74 <__divdf3+0x2c8>
    c89c:	01495793          	srl	a5,s2,0x14
    c8a0:	00c91413          	sll	s0,s2,0xc
    c8a4:	7ff7f793          	and	a5,a5,2047
    c8a8:	00000b93          	li	s7,0
    c8ac:	00800493          	li	s1,8
    c8b0:	7ff00993          	li	s3,2047
    c8b4:	00200c13          	li	s8,2
    c8b8:	00c45413          	srl	s0,s0,0xc
    c8bc:	01f95913          	srl	s2,s2,0x1f
    c8c0:	f80790e3          	bnez	a5,c840 <__divdf3+0x94>
    c8c4:	01446833          	or	a6,s0,s4
    c8c8:	1c080263          	beqz	a6,ca8c <__divdf3+0x2e0>
    c8cc:	5c040663          	beqz	s0,ce98 <__divdf3+0x6ec>
    c8d0:	00040513          	mv	a0,s0
    c8d4:	250020ef          	jal	eb24 <__clzsi2>
    c8d8:	00050793          	mv	a5,a0
    c8dc:	ff550693          	add	a3,a0,-11
    c8e0:	01d00713          	li	a4,29
    c8e4:	ff878813          	add	a6,a5,-8
    c8e8:	40d70733          	sub	a4,a4,a3
    c8ec:	01041433          	sll	s0,s0,a6
    c8f0:	00ea5733          	srl	a4,s4,a4
    c8f4:	00876433          	or	s0,a4,s0
    c8f8:	010a1833          	sll	a6,s4,a6
    c8fc:	013787b3          	add	a5,a5,s3
    c900:	3f378993          	add	s3,a5,1011
    c904:	00000793          	li	a5,0
    c908:	f65ff06f          	j	c86c <__divdf3+0xc0>
    c90c:	40f70733          	sub	a4,a4,a5
    c910:	03800693          	li	a3,56
    c914:	60e6d063          	bge	a3,a4,cf14 <__divdf3+0x768>
    c918:	00000793          	li	a5,0
    c91c:	00000693          	li	a3,0
    c920:	00000713          	li	a4,0
    c924:	04c12083          	lw	ra,76(sp)
    c928:	04812403          	lw	s0,72(sp)
    c92c:	01479793          	sll	a5,a5,0x14
    c930:	00d7e7b3          	or	a5,a5,a3
    c934:	01fa1693          	sll	a3,s4,0x1f
    c938:	00d7e7b3          	or	a5,a5,a3
    c93c:	04412483          	lw	s1,68(sp)
    c940:	04012903          	lw	s2,64(sp)
    c944:	03c12983          	lw	s3,60(sp)
    c948:	03812a03          	lw	s4,56(sp)
    c94c:	03412a83          	lw	s5,52(sp)
    c950:	03012b03          	lw	s6,48(sp)
    c954:	02c12b83          	lw	s7,44(sp)
    c958:	02812c03          	lw	s8,40(sp)
    c95c:	00070513          	mv	a0,a4
    c960:	00078593          	mv	a1,a5
    c964:	05010113          	add	sp,sp,80
    c968:	00008067          	ret
    c96c:	7ff00793          	li	a5,2047
    c970:	00000693          	li	a3,0
    c974:	00000713          	li	a4,0
    c978:	fadff06f          	j	c924 <__divdf3+0x178>
    c97c:	00000a13          	li	s4,0
    c980:	7ff00793          	li	a5,2047
    c984:	000806b7          	lui	a3,0x80
    c988:	00000713          	li	a4,0
    c98c:	f99ff06f          	j	c924 <__divdf3+0x178>
    c990:	00a4eb33          	or	s6,s1,a0
    c994:	100b0c63          	beqz	s6,caac <__divdf3+0x300>
    c998:	52048463          	beqz	s1,cec0 <__divdf3+0x714>
    c99c:	00048513          	mv	a0,s1
    c9a0:	184020ef          	jal	eb24 <__clzsi2>
    c9a4:	00050713          	mv	a4,a0
    c9a8:	ff550793          	add	a5,a0,-11
    c9ac:	01d00b13          	li	s6,29
    c9b0:	ff870b93          	add	s7,a4,-8
    c9b4:	40fb0b33          	sub	s6,s6,a5
    c9b8:	017494b3          	sll	s1,s1,s7
    c9bc:	01645b33          	srl	s6,s0,s6
    c9c0:	009b6b33          	or	s6,s6,s1
    c9c4:	01741bb3          	sll	s7,s0,s7
    c9c8:	c0d00793          	li	a5,-1011
    c9cc:	40e789b3          	sub	s3,a5,a4
    c9d0:	00000493          	li	s1,0
    c9d4:	00000c13          	li	s8,0
    c9d8:	e51ff06f          	j	c828 <__divdf3+0x7c>
    c9dc:	01446833          	or	a6,s0,s4
    c9e0:	80198993          	add	s3,s3,-2047
    c9e4:	0a081c63          	bnez	a6,ca9c <__divdf3+0x2f0>
    c9e8:	0024e493          	or	s1,s1,2
    c9ec:	00000413          	li	s0,0
    c9f0:	00200793          	li	a5,2
    c9f4:	e79ff06f          	j	c86c <__divdf3+0xc0>
    c9f8:	000a8913          	mv	s2,s5
    c9fc:	000b0413          	mv	s0,s6
    ca00:	000b8813          	mv	a6,s7
    ca04:	00200793          	li	a5,2
    ca08:	60fc0863          	beq	s8,a5,d018 <__divdf3+0x86c>
    ca0c:	00300793          	li	a5,3
    ca10:	f6fc06e3          	beq	s8,a5,c97c <__divdf3+0x1d0>
    ca14:	00100793          	li	a5,1
    ca18:	00090a13          	mv	s4,s2
    ca1c:	eefc0ee3          	beq	s8,a5,c918 <__divdf3+0x16c>
    ca20:	3ff98793          	add	a5,s3,1023
    ca24:	3cf05263          	blez	a5,cde8 <__divdf3+0x63c>
    ca28:	00787713          	and	a4,a6,7
    ca2c:	5c071663          	bnez	a4,cff8 <__divdf3+0x84c>
    ca30:	00741713          	sll	a4,s0,0x7
    ca34:	00075a63          	bgez	a4,ca48 <__divdf3+0x29c>
    ca38:	ff0007b7          	lui	a5,0xff000
    ca3c:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    ca40:	00f47433          	and	s0,s0,a5
    ca44:	40098793          	add	a5,s3,1024
    ca48:	7fe00713          	li	a4,2046
    ca4c:	f2f740e3          	blt	a4,a5,c96c <__divdf3+0x1c0>
    ca50:	00385813          	srl	a6,a6,0x3
    ca54:	01d41713          	sll	a4,s0,0x1d
    ca58:	00941693          	sll	a3,s0,0x9
    ca5c:	01076733          	or	a4,a4,a6
    ca60:	00c6d693          	srl	a3,a3,0xc
    ca64:	7ff7f793          	and	a5,a5,2047
    ca68:	ebdff06f          	j	c924 <__divdf3+0x178>
    ca6c:	00078c13          	mv	s8,a5
    ca70:	f95ff06f          	j	ca04 <__divdf3+0x258>
    ca74:	00048b13          	mv	s6,s1
    ca78:	00050b93          	mv	s7,a0
    ca7c:	00c00493          	li	s1,12
    ca80:	7ff00993          	li	s3,2047
    ca84:	00300c13          	li	s8,3
    ca88:	da1ff06f          	j	c828 <__divdf3+0x7c>
    ca8c:	0014e493          	or	s1,s1,1
    ca90:	00000413          	li	s0,0
    ca94:	00100793          	li	a5,1
    ca98:	dd5ff06f          	j	c86c <__divdf3+0xc0>
    ca9c:	0034e493          	or	s1,s1,3
    caa0:	000a0813          	mv	a6,s4
    caa4:	00300793          	li	a5,3
    caa8:	dc5ff06f          	j	c86c <__divdf3+0xc0>
    caac:	00000b93          	li	s7,0
    cab0:	00400493          	li	s1,4
    cab4:	00000993          	li	s3,0
    cab8:	00100c13          	li	s8,1
    cabc:	d6dff06f          	j	c828 <__divdf3+0x7c>
    cac0:	03912223          	sw	s9,36(sp)
    cac4:	03a12023          	sw	s10,32(sp)
    cac8:	01b12e23          	sw	s11,28(sp)
    cacc:	3b646a63          	bltu	s0,s6,ce80 <__divdf3+0x6d4>
    cad0:	3a8b0663          	beq	s6,s0,ce7c <__divdf3+0x6d0>
    cad4:	fff98993          	add	s3,s3,-1
    cad8:	000b8c13          	mv	s8,s7
    cadc:	000b0493          	mv	s1,s6
    cae0:	00000d13          	li	s10,0
    cae4:	01885c93          	srl	s9,a6,0x18
    cae8:	00841413          	sll	s0,s0,0x8
    caec:	01045913          	srl	s2,s0,0x10
    caf0:	008cecb3          	or	s9,s9,s0
    caf4:	00090593          	mv	a1,s2
    caf8:	00048513          	mv	a0,s1
    cafc:	010c9b13          	sll	s6,s9,0x10
    cb00:	00881a93          	sll	s5,a6,0x8
    cb04:	010b5b13          	srl	s6,s6,0x10
    cb08:	771010ef          	jal	ea78 <__hidden___udivsi3>
    cb0c:	00050593          	mv	a1,a0
    cb10:	00050413          	mv	s0,a0
    cb14:	000b0513          	mv	a0,s6
    cb18:	69d010ef          	jal	e9b4 <__mulsi3>
    cb1c:	00050793          	mv	a5,a0
    cb20:	00090593          	mv	a1,s2
    cb24:	00048513          	mv	a0,s1
    cb28:	00078493          	mv	s1,a5
    cb2c:	795010ef          	jal	eac0 <__umodsi3>
    cb30:	01051513          	sll	a0,a0,0x10
    cb34:	010c5793          	srl	a5,s8,0x10
    cb38:	00a7e7b3          	or	a5,a5,a0
    cb3c:	0097fa63          	bgeu	a5,s1,cb50 <__divdf3+0x3a4>
    cb40:	00fc87b3          	add	a5,s9,a5
    cb44:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    cb48:	3b97fe63          	bgeu	a5,s9,cf04 <__divdf3+0x758>
    cb4c:	00070413          	mv	s0,a4
    cb50:	409784b3          	sub	s1,a5,s1
    cb54:	00090593          	mv	a1,s2
    cb58:	00048513          	mv	a0,s1
    cb5c:	71d010ef          	jal	ea78 <__hidden___udivsi3>
    cb60:	00050593          	mv	a1,a0
    cb64:	00050b93          	mv	s7,a0
    cb68:	000b0513          	mv	a0,s6
    cb6c:	649010ef          	jal	e9b4 <__mulsi3>
    cb70:	00050793          	mv	a5,a0
    cb74:	00090593          	mv	a1,s2
    cb78:	00048513          	mv	a0,s1
    cb7c:	00078493          	mv	s1,a5
    cb80:	741010ef          	jal	eac0 <__umodsi3>
    cb84:	010c1793          	sll	a5,s8,0x10
    cb88:	01051513          	sll	a0,a0,0x10
    cb8c:	0107d793          	srl	a5,a5,0x10
    cb90:	00a7e7b3          	or	a5,a5,a0
    cb94:	0097fa63          	bgeu	a5,s1,cba8 <__divdf3+0x3fc>
    cb98:	00fc87b3          	add	a5,s9,a5
    cb9c:	fffb8713          	add	a4,s7,-1
    cba0:	3597fa63          	bgeu	a5,s9,cef4 <__divdf3+0x748>
    cba4:	00070b93          	mv	s7,a4
    cba8:	00010337          	lui	t1,0x10
    cbac:	01041413          	sll	s0,s0,0x10
    cbb0:	01746433          	or	s0,s0,s7
    cbb4:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    cbb8:	01b478b3          	and	a7,s0,s11
    cbbc:	01bafdb3          	and	s11,s5,s11
    cbc0:	40978bb3          	sub	s7,a5,s1
    cbc4:	010adc13          	srl	s8,s5,0x10
    cbc8:	01045793          	srl	a5,s0,0x10
    cbcc:	00088513          	mv	a0,a7
    cbd0:	000d8593          	mv	a1,s11
    cbd4:	5e1010ef          	jal	e9b4 <__mulsi3>
    cbd8:	00050813          	mv	a6,a0
    cbdc:	000c0593          	mv	a1,s8
    cbe0:	00088513          	mv	a0,a7
    cbe4:	5d1010ef          	jal	e9b4 <__mulsi3>
    cbe8:	00050893          	mv	a7,a0
    cbec:	000d8593          	mv	a1,s11
    cbf0:	00078513          	mv	a0,a5
    cbf4:	5c1010ef          	jal	e9b4 <__mulsi3>
    cbf8:	00050e13          	mv	t3,a0
    cbfc:	000c0593          	mv	a1,s8
    cc00:	00078513          	mv	a0,a5
    cc04:	5b1010ef          	jal	e9b4 <__mulsi3>
    cc08:	01085793          	srl	a5,a6,0x10
    cc0c:	01c888b3          	add	a7,a7,t3
    cc10:	011787b3          	add	a5,a5,a7
    cc14:	01c7f463          	bgeu	a5,t3,cc1c <__divdf3+0x470>
    cc18:	00650533          	add	a0,a0,t1
    cc1c:	00010637          	lui	a2,0x10
    cc20:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    cc24:	00c7f4b3          	and	s1,a5,a2
    cc28:	0107d693          	srl	a3,a5,0x10
    cc2c:	01049493          	sll	s1,s1,0x10
    cc30:	00c87833          	and	a6,a6,a2
    cc34:	00a687b3          	add	a5,a3,a0
    cc38:	010484b3          	add	s1,s1,a6
    cc3c:	20fbea63          	bltu	s7,a5,ce50 <__divdf3+0x6a4>
    cc40:	20fb8663          	beq	s7,a5,ce4c <__divdf3+0x6a0>
    cc44:	409d04b3          	sub	s1,s10,s1
    cc48:	40fb8bb3          	sub	s7,s7,a5
    cc4c:	009d3d33          	sltu	s10,s10,s1
    cc50:	41ab8bb3          	sub	s7,s7,s10
    cc54:	377c8a63          	beq	s9,s7,cfc8 <__divdf3+0x81c>
    cc58:	00090593          	mv	a1,s2
    cc5c:	000b8513          	mv	a0,s7
    cc60:	619010ef          	jal	ea78 <__hidden___udivsi3>
    cc64:	00050593          	mv	a1,a0
    cc68:	00a12623          	sw	a0,12(sp)
    cc6c:	00050d13          	mv	s10,a0
    cc70:	000b0513          	mv	a0,s6
    cc74:	541010ef          	jal	e9b4 <__mulsi3>
    cc78:	00050793          	mv	a5,a0
    cc7c:	00090593          	mv	a1,s2
    cc80:	000b8513          	mv	a0,s7
    cc84:	00078b93          	mv	s7,a5
    cc88:	639010ef          	jal	eac0 <__umodsi3>
    cc8c:	01051513          	sll	a0,a0,0x10
    cc90:	0104d793          	srl	a5,s1,0x10
    cc94:	00a7e7b3          	or	a5,a5,a0
    cc98:	0377f063          	bgeu	a5,s7,ccb8 <__divdf3+0x50c>
    cc9c:	00fc87b3          	add	a5,s9,a5
    cca0:	fffd0693          	add	a3,s10,-1
    cca4:	3797e263          	bltu	a5,s9,d008 <__divdf3+0x85c>
    cca8:	3777f063          	bgeu	a5,s7,d008 <__divdf3+0x85c>
    ccac:	ffed0713          	add	a4,s10,-2
    ccb0:	00e12623          	sw	a4,12(sp)
    ccb4:	019787b3          	add	a5,a5,s9
    ccb8:	41778bb3          	sub	s7,a5,s7
    ccbc:	00090593          	mv	a1,s2
    ccc0:	000b8513          	mv	a0,s7
    ccc4:	5b5010ef          	jal	ea78 <__hidden___udivsi3>
    ccc8:	00050593          	mv	a1,a0
    cccc:	00050d13          	mv	s10,a0
    ccd0:	000b0513          	mv	a0,s6
    ccd4:	4e1010ef          	jal	e9b4 <__mulsi3>
    ccd8:	00050793          	mv	a5,a0
    ccdc:	00090593          	mv	a1,s2
    cce0:	000b8513          	mv	a0,s7
    cce4:	00078913          	mv	s2,a5
    cce8:	01049493          	sll	s1,s1,0x10
    ccec:	5d5010ef          	jal	eac0 <__umodsi3>
    ccf0:	01051513          	sll	a0,a0,0x10
    ccf4:	0104d493          	srl	s1,s1,0x10
    ccf8:	00a4e4b3          	or	s1,s1,a0
    ccfc:	0124fe63          	bgeu	s1,s2,cd18 <__divdf3+0x56c>
    cd00:	009c84b3          	add	s1,s9,s1
    cd04:	fffd0793          	add	a5,s10,-1
    cd08:	3194e463          	bltu	s1,s9,d010 <__divdf3+0x864>
    cd0c:	3124f263          	bgeu	s1,s2,d010 <__divdf3+0x864>
    cd10:	ffed0d13          	add	s10,s10,-2
    cd14:	019484b3          	add	s1,s1,s9
    cd18:	00c12783          	lw	a5,12(sp)
    cd1c:	412484b3          	sub	s1,s1,s2
    cd20:	000d8593          	mv	a1,s11
    cd24:	01079813          	sll	a6,a5,0x10
    cd28:	01a86833          	or	a6,a6,s10
    cd2c:	01081313          	sll	t1,a6,0x10
    cd30:	01035313          	srl	t1,t1,0x10
    cd34:	01085793          	srl	a5,a6,0x10
    cd38:	00030513          	mv	a0,t1
    cd3c:	479010ef          	jal	e9b4 <__mulsi3>
    cd40:	00050893          	mv	a7,a0
    cd44:	000c0593          	mv	a1,s8
    cd48:	00030513          	mv	a0,t1
    cd4c:	469010ef          	jal	e9b4 <__mulsi3>
    cd50:	00050313          	mv	t1,a0
    cd54:	000d8593          	mv	a1,s11
    cd58:	00078513          	mv	a0,a5
    cd5c:	459010ef          	jal	e9b4 <__mulsi3>
    cd60:	00050e13          	mv	t3,a0
    cd64:	000c0593          	mv	a1,s8
    cd68:	00078513          	mv	a0,a5
    cd6c:	449010ef          	jal	e9b4 <__mulsi3>
    cd70:	0108d793          	srl	a5,a7,0x10
    cd74:	01c30333          	add	t1,t1,t3
    cd78:	006787b3          	add	a5,a5,t1
    cd7c:	01c7f663          	bgeu	a5,t3,cd88 <__divdf3+0x5dc>
    cd80:	00010737          	lui	a4,0x10
    cd84:	00e50533          	add	a0,a0,a4
    cd88:	000106b7          	lui	a3,0x10
    cd8c:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    cd90:	0107d713          	srl	a4,a5,0x10
    cd94:	00d7f7b3          	and	a5,a5,a3
    cd98:	01079793          	sll	a5,a5,0x10
    cd9c:	00d8f8b3          	and	a7,a7,a3
    cda0:	00a70733          	add	a4,a4,a0
    cda4:	011787b3          	add	a5,a5,a7
    cda8:	02e4e063          	bltu	s1,a4,cdc8 <__divdf3+0x61c>
    cdac:	00e48c63          	beq	s1,a4,cdc4 <__divdf3+0x618>
    cdb0:	02412c83          	lw	s9,36(sp)
    cdb4:	02012d03          	lw	s10,32(sp)
    cdb8:	01c12d83          	lw	s11,28(sp)
    cdbc:	00186813          	or	a6,a6,1
    cdc0:	c61ff06f          	j	ca20 <__divdf3+0x274>
    cdc4:	1c078a63          	beqz	a5,cf98 <__divdf3+0x7ec>
    cdc8:	009c84b3          	add	s1,s9,s1
    cdcc:	fff80613          	add	a2,a6,-1
    cdd0:	00048693          	mv	a3,s1
    cdd4:	1b94ec63          	bltu	s1,s9,cf8c <__divdf3+0x7e0>
    cdd8:	24e4ea63          	bltu	s1,a4,d02c <__divdf3+0x880>
    cddc:	26e48863          	beq	s1,a4,d04c <__divdf3+0x8a0>
    cde0:	00060813          	mv	a6,a2
    cde4:	fcdff06f          	j	cdb0 <__divdf3+0x604>
    cde8:	00100713          	li	a4,1
    cdec:	b20790e3          	bnez	a5,c90c <__divdf3+0x160>
    cdf0:	41e98793          	add	a5,s3,1054
    cdf4:	00f816b3          	sll	a3,a6,a5
    cdf8:	00d036b3          	snez	a3,a3
    cdfc:	00f417b3          	sll	a5,s0,a5
    ce00:	00f6e7b3          	or	a5,a3,a5
    ce04:	00e85833          	srl	a6,a6,a4
    ce08:	00f86833          	or	a6,a6,a5
    ce0c:	00787793          	and	a5,a6,7
    ce10:	00e45433          	srl	s0,s0,a4
    ce14:	02078063          	beqz	a5,ce34 <__divdf3+0x688>
    ce18:	00f87793          	and	a5,a6,15
    ce1c:	00400713          	li	a4,4
    ce20:	00e78a63          	beq	a5,a4,ce34 <__divdf3+0x688>
    ce24:	00480793          	add	a5,a6,4
    ce28:	0107b833          	sltu	a6,a5,a6
    ce2c:	01040433          	add	s0,s0,a6
    ce30:	00078813          	mv	a6,a5
    ce34:	00841613          	sll	a2,s0,0x8
    ce38:	00100793          	li	a5,1
    ce3c:	00000693          	li	a3,0
    ce40:	00000713          	li	a4,0
    ce44:	ae0640e3          	bltz	a2,c924 <__divdf3+0x178>
    ce48:	1280006f          	j	cf70 <__divdf3+0x7c4>
    ce4c:	de9d7ce3          	bgeu	s10,s1,cc44 <__divdf3+0x498>
    ce50:	015d06b3          	add	a3,s10,s5
    ce54:	01a6b633          	sltu	a2,a3,s10
    ce58:	019605b3          	add	a1,a2,s9
    ce5c:	00bb8bb3          	add	s7,s7,a1
    ce60:	00068d13          	mv	s10,a3
    ce64:	fff40593          	add	a1,s0,-1
    ce68:	077cfe63          	bgeu	s9,s7,cee4 <__divdf3+0x738>
    ce6c:	14fbe063          	bltu	s7,a5,cfac <__divdf3+0x800>
    ce70:	13778c63          	beq	a5,s7,cfa8 <__divdf3+0x7fc>
    ce74:	00058413          	mv	s0,a1
    ce78:	dcdff06f          	j	cc44 <__divdf3+0x498>
    ce7c:	c50bece3          	bltu	s7,a6,cad4 <__divdf3+0x328>
    ce80:	01fb1c13          	sll	s8,s6,0x1f
    ce84:	001bd713          	srl	a4,s7,0x1
    ce88:	001b5493          	srl	s1,s6,0x1
    ce8c:	00ec6c33          	or	s8,s8,a4
    ce90:	01fb9d13          	sll	s10,s7,0x1f
    ce94:	c51ff06f          	j	cae4 <__divdf3+0x338>
    ce98:	000a0513          	mv	a0,s4
    ce9c:	489010ef          	jal	eb24 <__clzsi2>
    cea0:	01550693          	add	a3,a0,21
    cea4:	01c00713          	li	a4,28
    cea8:	02050793          	add	a5,a0,32
    ceac:	a2d75ae3          	bge	a4,a3,c8e0 <__divdf3+0x134>
    ceb0:	ff850513          	add	a0,a0,-8
    ceb4:	00000813          	li	a6,0
    ceb8:	00aa1433          	sll	s0,s4,a0
    cebc:	a41ff06f          	j	c8fc <__divdf3+0x150>
    cec0:	465010ef          	jal	eb24 <__clzsi2>
    cec4:	01550793          	add	a5,a0,21
    cec8:	01c00693          	li	a3,28
    cecc:	02050713          	add	a4,a0,32
    ced0:	acf6dee3          	bge	a3,a5,c9ac <__divdf3+0x200>
    ced4:	ff850493          	add	s1,a0,-8
    ced8:	00941b33          	sll	s6,s0,s1
    cedc:	00000b93          	li	s7,0
    cee0:	ae9ff06f          	j	c9c8 <__divdf3+0x21c>
    cee4:	f97c98e3          	bne	s9,s7,ce74 <__divdf3+0x6c8>
    cee8:	f80602e3          	beqz	a2,ce6c <__divdf3+0x6c0>
    ceec:	00058413          	mv	s0,a1
    cef0:	d55ff06f          	j	cc44 <__divdf3+0x498>
    cef4:	ca97f8e3          	bgeu	a5,s1,cba4 <__divdf3+0x3f8>
    cef8:	ffeb8b93          	add	s7,s7,-2
    cefc:	019787b3          	add	a5,a5,s9
    cf00:	ca9ff06f          	j	cba8 <__divdf3+0x3fc>
    cf04:	c497f4e3          	bgeu	a5,s1,cb4c <__divdf3+0x3a0>
    cf08:	ffe40413          	add	s0,s0,-2
    cf0c:	019787b3          	add	a5,a5,s9
    cf10:	c41ff06f          	j	cb50 <__divdf3+0x3a4>
    cf14:	01f00693          	li	a3,31
    cf18:	ece6dce3          	bge	a3,a4,cdf0 <__divdf3+0x644>
    cf1c:	fe100693          	li	a3,-31
    cf20:	40f686b3          	sub	a3,a3,a5
    cf24:	02000793          	li	a5,32
    cf28:	00d456b3          	srl	a3,s0,a3
    cf2c:	00f70863          	beq	a4,a5,cf3c <__divdf3+0x790>
    cf30:	43e98793          	add	a5,s3,1086
    cf34:	00f417b3          	sll	a5,s0,a5
    cf38:	00f86833          	or	a6,a6,a5
    cf3c:	01003833          	snez	a6,a6
    cf40:	00d86833          	or	a6,a6,a3
    cf44:	00787713          	and	a4,a6,7
    cf48:	00000693          	li	a3,0
    cf4c:	02070863          	beqz	a4,cf7c <__divdf3+0x7d0>
    cf50:	00f87793          	and	a5,a6,15
    cf54:	00400713          	li	a4,4
    cf58:	00000413          	li	s0,0
    cf5c:	00e78a63          	beq	a5,a4,cf70 <__divdf3+0x7c4>
    cf60:	00480793          	add	a5,a6,4
    cf64:	0107b833          	sltu	a6,a5,a6
    cf68:	01003433          	snez	s0,a6
    cf6c:	00078813          	mv	a6,a5
    cf70:	00941693          	sll	a3,s0,0x9
    cf74:	01d41713          	sll	a4,s0,0x1d
    cf78:	00c6d693          	srl	a3,a3,0xc
    cf7c:	00385813          	srl	a6,a6,0x3
    cf80:	00e86733          	or	a4,a6,a4
    cf84:	00000793          	li	a5,0
    cf88:	99dff06f          	j	c924 <__divdf3+0x178>
    cf8c:	00060813          	mv	a6,a2
    cf90:	e2e690e3          	bne	a3,a4,cdb0 <__divdf3+0x604>
    cf94:	e1579ee3          	bne	a5,s5,cdb0 <__divdf3+0x604>
    cf98:	02412c83          	lw	s9,36(sp)
    cf9c:	02012d03          	lw	s10,32(sp)
    cfa0:	01c12d83          	lw	s11,28(sp)
    cfa4:	a7dff06f          	j	ca20 <__divdf3+0x274>
    cfa8:	ec96f6e3          	bgeu	a3,s1,ce74 <__divdf3+0x6c8>
    cfac:	00da86b3          	add	a3,s5,a3
    cfb0:	0156b633          	sltu	a2,a3,s5
    cfb4:	01960633          	add	a2,a2,s9
    cfb8:	ffe40413          	add	s0,s0,-2
    cfbc:	00068d13          	mv	s10,a3
    cfc0:	00cb8bb3          	add	s7,s7,a2
    cfc4:	c81ff06f          	j	cc44 <__divdf3+0x498>
    cfc8:	c0200713          	li	a4,-1022
    cfcc:	02412c83          	lw	s9,36(sp)
    cfd0:	02012d03          	lw	s10,32(sp)
    cfd4:	01c12d83          	lw	s11,28(sp)
    cfd8:	3ff98793          	add	a5,s3,1023
    cfdc:	fff00813          	li	a6,-1
    cfe0:	e0e9c4e3          	blt	s3,a4,cde8 <__divdf3+0x63c>
    cfe4:	00480713          	add	a4,a6,4
    cfe8:	01073833          	sltu	a6,a4,a6
    cfec:	01040433          	add	s0,s0,a6
    cff0:	00070813          	mv	a6,a4
    cff4:	a3dff06f          	j	ca30 <__divdf3+0x284>
    cff8:	00f87713          	and	a4,a6,15
    cffc:	00400693          	li	a3,4
    d000:	a2d708e3          	beq	a4,a3,ca30 <__divdf3+0x284>
    d004:	fe1ff06f          	j	cfe4 <__divdf3+0x838>
    d008:	00d12623          	sw	a3,12(sp)
    d00c:	cadff06f          	j	ccb8 <__divdf3+0x50c>
    d010:	00078d13          	mv	s10,a5
    d014:	d05ff06f          	j	cd18 <__divdf3+0x56c>
    d018:	00090a13          	mv	s4,s2
    d01c:	7ff00793          	li	a5,2047
    d020:	00000693          	li	a3,0
    d024:	00000713          	li	a4,0
    d028:	8fdff06f          	j	c924 <__divdf3+0x178>
    d02c:	001a9613          	sll	a2,s5,0x1
    d030:	015636b3          	sltu	a3,a2,s5
    d034:	019686b3          	add	a3,a3,s9
    d038:	00d486b3          	add	a3,s1,a3
    d03c:	ffe80813          	add	a6,a6,-2
    d040:	00060a93          	mv	s5,a2
    d044:	f4e688e3          	beq	a3,a4,cf94 <__divdf3+0x7e8>
    d048:	d69ff06f          	j	cdb0 <__divdf3+0x604>
    d04c:	fefae0e3          	bltu	s5,a5,d02c <__divdf3+0x880>
    d050:	00060813          	mv	a6,a2
    d054:	f41ff06f          	j	cf94 <__divdf3+0x7e8>

0000d058 <__eqdf2>:
    d058:	0145d713          	srl	a4,a1,0x14
    d05c:	001007b7          	lui	a5,0x100
    d060:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d064:	0146d813          	srl	a6,a3,0x14
    d068:	7ff77713          	and	a4,a4,2047
    d06c:	7ff00313          	li	t1,2047
    d070:	00b7fe33          	and	t3,a5,a1
    d074:	00050893          	mv	a7,a0
    d078:	00d7f7b3          	and	a5,a5,a3
    d07c:	01f5d593          	srl	a1,a1,0x1f
    d080:	7ff87813          	and	a6,a6,2047
    d084:	01f6d693          	srl	a3,a3,0x1f
    d088:	00100513          	li	a0,1
    d08c:	00670c63          	beq	a4,t1,d0a4 <__eqdf2+0x4c>
    d090:	00680863          	beq	a6,t1,d0a0 <__eqdf2+0x48>
    d094:	01071463          	bne	a4,a6,d09c <__eqdf2+0x44>
    d098:	02fe0663          	beq	t3,a5,d0c4 <__eqdf2+0x6c>
    d09c:	00008067          	ret
    d0a0:	00008067          	ret
    d0a4:	fee81ce3          	bne	a6,a4,d09c <__eqdf2+0x44>
    d0a8:	00fe67b3          	or	a5,t3,a5
    d0ac:	00c7e7b3          	or	a5,a5,a2
    d0b0:	0117e7b3          	or	a5,a5,a7
    d0b4:	fe0794e3          	bnez	a5,d09c <__eqdf2+0x44>
    d0b8:	40d585b3          	sub	a1,a1,a3
    d0bc:	00b03533          	snez	a0,a1
    d0c0:	00008067          	ret
    d0c4:	fcc89ce3          	bne	a7,a2,d09c <__eqdf2+0x44>
    d0c8:	00d58a63          	beq	a1,a3,d0dc <__eqdf2+0x84>
    d0cc:	fc0718e3          	bnez	a4,d09c <__eqdf2+0x44>
    d0d0:	011e6e33          	or	t3,t3,a7
    d0d4:	01c03533          	snez	a0,t3
    d0d8:	00008067          	ret
    d0dc:	00000513          	li	a0,0
    d0e0:	00008067          	ret

0000d0e4 <__gedf2>:
    d0e4:	0145d893          	srl	a7,a1,0x14
    d0e8:	001007b7          	lui	a5,0x100
    d0ec:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d0f0:	0146d713          	srl	a4,a3,0x14
    d0f4:	7ff8f893          	and	a7,a7,2047
    d0f8:	7ff00e13          	li	t3,2047
    d0fc:	00b7f333          	and	t1,a5,a1
    d100:	00050813          	mv	a6,a0
    d104:	00050e93          	mv	t4,a0
    d108:	00d7f7b3          	and	a5,a5,a3
    d10c:	01f5d593          	srl	a1,a1,0x1f
    d110:	00060f13          	mv	t5,a2
    d114:	7ff77513          	and	a0,a4,2047
    d118:	01f6d693          	srl	a3,a3,0x1f
    d11c:	05c88863          	beq	a7,t3,d16c <__gedf2+0x88>
    d120:	03c50463          	beq	a0,t3,d148 <__gedf2+0x64>
    d124:	06089a63          	bnez	a7,d198 <__gedf2+0xb4>
    d128:	01036833          	or	a6,t1,a6
    d12c:	06051063          	bnez	a0,d18c <__gedf2+0xa8>
    d130:	00c7e633          	or	a2,a5,a2
    d134:	08060c63          	beqz	a2,d1cc <__gedf2+0xe8>
    d138:	0a081263          	bnez	a6,d1dc <__gedf2+0xf8>
    d13c:	00100513          	li	a0,1
    d140:	08068263          	beqz	a3,d1c4 <__gedf2+0xe0>
    d144:	00008067          	ret
    d148:	00c7e633          	or	a2,a5,a2
    d14c:	08061463          	bnez	a2,d1d4 <__gedf2+0xf0>
    d150:	00089663          	bnez	a7,d15c <__gedf2+0x78>
    d154:	01036333          	or	t1,t1,a6
    d158:	fe0302e3          	beqz	t1,d13c <__gedf2+0x58>
    d15c:	06d58063          	beq	a1,a3,d1bc <__gedf2+0xd8>
    d160:	06059263          	bnez	a1,d1c4 <__gedf2+0xe0>
    d164:	00100513          	li	a0,1
    d168:	00008067          	ret
    d16c:	01036333          	or	t1,t1,a6
    d170:	06031263          	bnez	t1,d1d4 <__gedf2+0xf0>
    d174:	ff1516e3          	bne	a0,a7,d160 <__gedf2+0x7c>
    d178:	00c7e7b3          	or	a5,a5,a2
    d17c:	04079c63          	bnez	a5,d1d4 <__gedf2+0xf0>
    d180:	fed590e3          	bne	a1,a3,d160 <__gedf2+0x7c>
    d184:	00000513          	li	a0,0
    d188:	00008067          	ret
    d18c:	fa0808e3          	beqz	a6,d13c <__gedf2+0x58>
    d190:	fcd598e3          	bne	a1,a3,d160 <__gedf2+0x7c>
    d194:	0280006f          	j	d1bc <__gedf2+0xd8>
    d198:	fc0504e3          	beqz	a0,d160 <__gedf2+0x7c>
    d19c:	fcd592e3          	bne	a1,a3,d160 <__gedf2+0x7c>
    d1a0:	fd1540e3          	blt	a0,a7,d160 <__gedf2+0x7c>
    d1a4:	00a8cc63          	blt	a7,a0,d1bc <__gedf2+0xd8>
    d1a8:	fa67ece3          	bltu	a5,t1,d160 <__gedf2+0x7c>
    d1ac:	00f31863          	bne	t1,a5,d1bc <__gedf2+0xd8>
    d1b0:	fbdf68e3          	bltu	t5,t4,d160 <__gedf2+0x7c>
    d1b4:	00000513          	li	a0,0
    d1b8:	f9eef6e3          	bgeu	t4,t5,d144 <__gedf2+0x60>
    d1bc:	00100513          	li	a0,1
    d1c0:	f80592e3          	bnez	a1,d144 <__gedf2+0x60>
    d1c4:	fff00513          	li	a0,-1
    d1c8:	00008067          	ret
    d1cc:	f8081ae3          	bnez	a6,d160 <__gedf2+0x7c>
    d1d0:	00008067          	ret
    d1d4:	ffe00513          	li	a0,-2
    d1d8:	00008067          	ret
    d1dc:	fcd586e3          	beq	a1,a3,d1a8 <__gedf2+0xc4>
    d1e0:	f81ff06f          	j	d160 <__gedf2+0x7c>

0000d1e4 <__ledf2>:
    d1e4:	0145d893          	srl	a7,a1,0x14
    d1e8:	001007b7          	lui	a5,0x100
    d1ec:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d1f0:	0146d713          	srl	a4,a3,0x14
    d1f4:	7ff8f893          	and	a7,a7,2047
    d1f8:	7ff00313          	li	t1,2047
    d1fc:	00b7fe33          	and	t3,a5,a1
    d200:	00050813          	mv	a6,a0
    d204:	00050e93          	mv	t4,a0
    d208:	00d7f7b3          	and	a5,a5,a3
    d20c:	01f5d593          	srl	a1,a1,0x1f
    d210:	00060f13          	mv	t5,a2
    d214:	7ff77513          	and	a0,a4,2047
    d218:	01f6d693          	srl	a3,a3,0x1f
    d21c:	04688a63          	beq	a7,t1,d270 <__ledf2+0x8c>
    d220:	02650463          	beq	a0,t1,d248 <__ledf2+0x64>
    d224:	06089863          	bnez	a7,d294 <__ledf2+0xb0>
    d228:	010e6833          	or	a6,t3,a6
    d22c:	08051e63          	bnez	a0,d2c8 <__ledf2+0xe4>
    d230:	00c7e633          	or	a2,a5,a2
    d234:	0a060463          	beqz	a2,d2dc <__ledf2+0xf8>
    d238:	0a081663          	bnez	a6,d2e4 <__ledf2+0x100>
    d23c:	00100513          	li	a0,1
    d240:	08068063          	beqz	a3,d2c0 <__ledf2+0xdc>
    d244:	00008067          	ret
    d248:	00c7e633          	or	a2,a5,a2
    d24c:	00200513          	li	a0,2
    d250:	fe061ae3          	bnez	a2,d244 <__ledf2+0x60>
    d254:	00089663          	bnez	a7,d260 <__ledf2+0x7c>
    d258:	010e6e33          	or	t3,t3,a6
    d25c:	fe0e00e3          	beqz	t3,d23c <__ledf2+0x58>
    d260:	04d58c63          	beq	a1,a3,d2b8 <__ledf2+0xd4>
    d264:	04059e63          	bnez	a1,d2c0 <__ledf2+0xdc>
    d268:	00100513          	li	a0,1
    d26c:	00008067          	ret
    d270:	010e6e33          	or	t3,t3,a6
    d274:	060e1063          	bnez	t3,d2d4 <__ledf2+0xf0>
    d278:	ff1516e3          	bne	a0,a7,d264 <__ledf2+0x80>
    d27c:	00c7e7b3          	or	a5,a5,a2
    d280:	00200513          	li	a0,2
    d284:	fc0790e3          	bnez	a5,d244 <__ledf2+0x60>
    d288:	fcd59ee3          	bne	a1,a3,d264 <__ledf2+0x80>
    d28c:	00000513          	li	a0,0
    d290:	00008067          	ret
    d294:	fc0508e3          	beqz	a0,d264 <__ledf2+0x80>
    d298:	fcd596e3          	bne	a1,a3,d264 <__ledf2+0x80>
    d29c:	fd1544e3          	blt	a0,a7,d264 <__ledf2+0x80>
    d2a0:	00a8cc63          	blt	a7,a0,d2b8 <__ledf2+0xd4>
    d2a4:	fdc7e0e3          	bltu	a5,t3,d264 <__ledf2+0x80>
    d2a8:	00fe1863          	bne	t3,a5,d2b8 <__ledf2+0xd4>
    d2ac:	fbdf6ce3          	bltu	t5,t4,d264 <__ledf2+0x80>
    d2b0:	00000513          	li	a0,0
    d2b4:	f9eef8e3          	bgeu	t4,t5,d244 <__ledf2+0x60>
    d2b8:	00100513          	li	a0,1
    d2bc:	f80594e3          	bnez	a1,d244 <__ledf2+0x60>
    d2c0:	fff00513          	li	a0,-1
    d2c4:	00008067          	ret
    d2c8:	f6080ae3          	beqz	a6,d23c <__ledf2+0x58>
    d2cc:	f8d59ce3          	bne	a1,a3,d264 <__ledf2+0x80>
    d2d0:	fe9ff06f          	j	d2b8 <__ledf2+0xd4>
    d2d4:	00200513          	li	a0,2
    d2d8:	00008067          	ret
    d2dc:	f80814e3          	bnez	a6,d264 <__ledf2+0x80>
    d2e0:	00008067          	ret
    d2e4:	fcd580e3          	beq	a1,a3,d2a4 <__ledf2+0xc0>
    d2e8:	f7dff06f          	j	d264 <__ledf2+0x80>

0000d2ec <__muldf3>:
    d2ec:	fd010113          	add	sp,sp,-48
    d2f0:	0145d793          	srl	a5,a1,0x14
    d2f4:	02812423          	sw	s0,40(sp)
    d2f8:	02912223          	sw	s1,36(sp)
    d2fc:	03212023          	sw	s2,32(sp)
    d300:	01312e23          	sw	s3,28(sp)
    d304:	01512a23          	sw	s5,20(sp)
    d308:	00c59493          	sll	s1,a1,0xc
    d30c:	02112623          	sw	ra,44(sp)
    d310:	01412c23          	sw	s4,24(sp)
    d314:	01612823          	sw	s6,16(sp)
    d318:	01712623          	sw	s7,12(sp)
    d31c:	01812423          	sw	s8,8(sp)
    d320:	7ff7f793          	and	a5,a5,2047
    d324:	00050413          	mv	s0,a0
    d328:	00060a93          	mv	s5,a2
    d32c:	00068993          	mv	s3,a3
    d330:	00c4d493          	srl	s1,s1,0xc
    d334:	01f5d913          	srl	s2,a1,0x1f
    d338:	4e078063          	beqz	a5,d818 <__muldf3+0x52c>
    d33c:	7ff00713          	li	a4,2047
    d340:	0ae78663          	beq	a5,a4,d3ec <__muldf3+0x100>
    d344:	00349693          	sll	a3,s1,0x3
    d348:	01d55713          	srl	a4,a0,0x1d
    d34c:	00d76733          	or	a4,a4,a3
    d350:	008006b7          	lui	a3,0x800
    d354:	00d764b3          	or	s1,a4,a3
    d358:	00351a13          	sll	s4,a0,0x3
    d35c:	c0178c13          	add	s8,a5,-1023
    d360:	00000b13          	li	s6,0
    d364:	00000b93          	li	s7,0
    d368:	0149d793          	srl	a5,s3,0x14
    d36c:	00c99713          	sll	a4,s3,0xc
    d370:	7ff7f793          	and	a5,a5,2047
    d374:	000a8e13          	mv	t3,s5
    d378:	00c75413          	srl	s0,a4,0xc
    d37c:	01f9d993          	srl	s3,s3,0x1f
    d380:	0a078063          	beqz	a5,d420 <__muldf3+0x134>
    d384:	7ff00713          	li	a4,2047
    d388:	14e78e63          	beq	a5,a4,d4e4 <__muldf3+0x1f8>
    d38c:	00341713          	sll	a4,s0,0x3
    d390:	01dad693          	srl	a3,s5,0x1d
    d394:	00e6e6b3          	or	a3,a3,a4
    d398:	c0178793          	add	a5,a5,-1023
    d39c:	00800737          	lui	a4,0x800
    d3a0:	00e6e433          	or	s0,a3,a4
    d3a4:	003a9e13          	sll	t3,s5,0x3
    d3a8:	01878333          	add	t1,a5,s8
    d3ac:	00000693          	li	a3,0
    d3b0:	00a00793          	li	a5,10
    d3b4:	00130893          	add	a7,t1,1
    d3b8:	0b67cc63          	blt	a5,s6,d470 <__muldf3+0x184>
    d3bc:	013945b3          	xor	a1,s2,s3
    d3c0:	00200793          	li	a5,2
    d3c4:	00058813          	mv	a6,a1
    d3c8:	1567c663          	blt	a5,s6,d514 <__muldf3+0x228>
    d3cc:	fffb0b13          	add	s6,s6,-1
    d3d0:	00100713          	li	a4,1
    d3d4:	17676063          	bltu	a4,s6,d534 <__muldf3+0x248>
    d3d8:	48f68663          	beq	a3,a5,d864 <__muldf3+0x578>
    d3dc:	00040493          	mv	s1,s0
    d3e0:	000e0a13          	mv	s4,t3
    d3e4:	00068b93          	mv	s7,a3
    d3e8:	09c0006f          	j	d484 <__muldf3+0x198>
    d3ec:	00a4ea33          	or	s4,s1,a0
    d3f0:	480a1463          	bnez	s4,d878 <__muldf3+0x58c>
    d3f4:	0149d793          	srl	a5,s3,0x14
    d3f8:	00c99713          	sll	a4,s3,0xc
    d3fc:	7ff7f793          	and	a5,a5,2047
    d400:	00000493          	li	s1,0
    d404:	00800b13          	li	s6,8
    d408:	7ff00c13          	li	s8,2047
    d40c:	00200b93          	li	s7,2
    d410:	000a8e13          	mv	t3,s5
    d414:	00c75413          	srl	s0,a4,0xc
    d418:	01f9d993          	srl	s3,s3,0x1f
    d41c:	f60794e3          	bnez	a5,d384 <__muldf3+0x98>
    d420:	015467b3          	or	a5,s0,s5
    d424:	46078e63          	beqz	a5,d8a0 <__muldf3+0x5b4>
    d428:	54040c63          	beqz	s0,d980 <__muldf3+0x694>
    d42c:	00040513          	mv	a0,s0
    d430:	6f4010ef          	jal	eb24 <__clzsi2>
    d434:	00050313          	mv	t1,a0
    d438:	ff550713          	add	a4,a0,-11
    d43c:	01d00793          	li	a5,29
    d440:	ff830e13          	add	t3,t1,-8
    d444:	40e787b3          	sub	a5,a5,a4
    d448:	00fad7b3          	srl	a5,s5,a5
    d44c:	01c41733          	sll	a4,s0,t3
    d450:	00e7e433          	or	s0,a5,a4
    d454:	01ca9e33          	sll	t3,s5,t3
    d458:	406c0333          	sub	t1,s8,t1
    d45c:	c0d30313          	add	t1,t1,-1011
    d460:	00a00793          	li	a5,10
    d464:	00000693          	li	a3,0
    d468:	00130893          	add	a7,t1,1
    d46c:	f567d8e3          	bge	a5,s6,d3bc <__muldf3+0xd0>
    d470:	00090593          	mv	a1,s2
    d474:	00200793          	li	a5,2
    d478:	3efb8663          	beq	s7,a5,d864 <__muldf3+0x578>
    d47c:	00300793          	li	a5,3
    d480:	54fb8863          	beq	s7,a5,d9d0 <__muldf3+0x6e4>
    d484:	00100793          	li	a5,1
    d488:	00058813          	mv	a6,a1
    d48c:	52fb9663          	bne	s7,a5,d9b8 <__muldf3+0x6cc>
    d490:	00000793          	li	a5,0
    d494:	00000693          	li	a3,0
    d498:	00000713          	li	a4,0
    d49c:	02c12083          	lw	ra,44(sp)
    d4a0:	02812403          	lw	s0,40(sp)
    d4a4:	01479793          	sll	a5,a5,0x14
    d4a8:	00d7e7b3          	or	a5,a5,a3
    d4ac:	01f81813          	sll	a6,a6,0x1f
    d4b0:	0107e7b3          	or	a5,a5,a6
    d4b4:	02412483          	lw	s1,36(sp)
    d4b8:	02012903          	lw	s2,32(sp)
    d4bc:	01c12983          	lw	s3,28(sp)
    d4c0:	01812a03          	lw	s4,24(sp)
    d4c4:	01412a83          	lw	s5,20(sp)
    d4c8:	01012b03          	lw	s6,16(sp)
    d4cc:	00c12b83          	lw	s7,12(sp)
    d4d0:	00812c03          	lw	s8,8(sp)
    d4d4:	00070513          	mv	a0,a4
    d4d8:	00078593          	mv	a1,a5
    d4dc:	03010113          	add	sp,sp,48
    d4e0:	00008067          	ret
    d4e4:	01546733          	or	a4,s0,s5
    d4e8:	7ffc0313          	add	t1,s8,2047
    d4ec:	3c070663          	beqz	a4,d8b8 <__muldf3+0x5cc>
    d4f0:	00001737          	lui	a4,0x1
    d4f4:	01394833          	xor	a6,s2,s3
    d4f8:	80070713          	add	a4,a4,-2048 # 800 <main+0x508>
    d4fc:	003b6b13          	or	s6,s6,3
    d500:	00a00693          	li	a3,10
    d504:	00080593          	mv	a1,a6
    d508:	00ec08b3          	add	a7,s8,a4
    d50c:	4366cc63          	blt	a3,s6,d944 <__muldf3+0x658>
    d510:	00300693          	li	a3,3
    d514:	00100613          	li	a2,1
    d518:	01661633          	sll	a2,a2,s6
    d51c:	53067713          	and	a4,a2,1328
    d520:	f4071ae3          	bnez	a4,d474 <__muldf3+0x188>
    d524:	24067793          	and	a5,a2,576
    d528:	48079063          	bnez	a5,d9a8 <__muldf3+0x6bc>
    d52c:	08867613          	and	a2,a2,136
    d530:	38061e63          	bnez	a2,d8cc <__muldf3+0x5e0>
    d534:	00010fb7          	lui	t6,0x10
    d538:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    d53c:	005a7f33          	and	t5,s4,t0
    d540:	005e72b3          	and	t0,t3,t0
    d544:	010a5a13          	srl	s4,s4,0x10
    d548:	010e5e13          	srl	t3,t3,0x10
    d54c:	000f0513          	mv	a0,t5
    d550:	00028593          	mv	a1,t0
    d554:	460010ef          	jal	e9b4 <__mulsi3>
    d558:	00050713          	mv	a4,a0
    d55c:	000e0593          	mv	a1,t3
    d560:	000f0513          	mv	a0,t5
    d564:	450010ef          	jal	e9b4 <__mulsi3>
    d568:	00050793          	mv	a5,a0
    d56c:	00028593          	mv	a1,t0
    d570:	000a0513          	mv	a0,s4
    d574:	440010ef          	jal	e9b4 <__mulsi3>
    d578:	00050e93          	mv	t4,a0
    d57c:	000e0593          	mv	a1,t3
    d580:	000a0513          	mv	a0,s4
    d584:	430010ef          	jal	e9b4 <__mulsi3>
    d588:	01d786b3          	add	a3,a5,t4
    d58c:	01075393          	srl	t2,a4,0x10
    d590:	00d383b3          	add	t2,t2,a3
    d594:	00050793          	mv	a5,a0
    d598:	01d3f463          	bgeu	t2,t4,d5a0 <__muldf3+0x2b4>
    d59c:	01f507b3          	add	a5,a0,t6
    d5a0:	000109b7          	lui	s3,0x10
    d5a4:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    d5a8:	0123feb3          	and	t4,t2,s2
    d5ac:	01277733          	and	a4,a4,s2
    d5b0:	010e9e93          	sll	t4,t4,0x10
    d5b4:	01247933          	and	s2,s0,s2
    d5b8:	0103d393          	srl	t2,t2,0x10
    d5bc:	00ee8eb3          	add	t4,t4,a4
    d5c0:	01045413          	srl	s0,s0,0x10
    d5c4:	000f0513          	mv	a0,t5
    d5c8:	00090593          	mv	a1,s2
    d5cc:	3e8010ef          	jal	e9b4 <__mulsi3>
    d5d0:	00050f93          	mv	t6,a0
    d5d4:	00040593          	mv	a1,s0
    d5d8:	000f0513          	mv	a0,t5
    d5dc:	3d8010ef          	jal	e9b4 <__mulsi3>
    d5e0:	00050713          	mv	a4,a0
    d5e4:	00090593          	mv	a1,s2
    d5e8:	000a0513          	mv	a0,s4
    d5ec:	3c8010ef          	jal	e9b4 <__mulsi3>
    d5f0:	00050f13          	mv	t5,a0
    d5f4:	00040593          	mv	a1,s0
    d5f8:	000a0513          	mv	a0,s4
    d5fc:	3b8010ef          	jal	e9b4 <__mulsi3>
    d600:	010fd693          	srl	a3,t6,0x10
    d604:	01e70733          	add	a4,a4,t5
    d608:	00e686b3          	add	a3,a3,a4
    d60c:	01e6f463          	bgeu	a3,t5,d614 <__muldf3+0x328>
    d610:	01350533          	add	a0,a0,s3
    d614:	00010a37          	lui	s4,0x10
    d618:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    d61c:	01e6f733          	and	a4,a3,t5
    d620:	01efffb3          	and	t6,t6,t5
    d624:	01071713          	sll	a4,a4,0x10
    d628:	01f70733          	add	a4,a4,t6
    d62c:	01e4ff33          	and	t5,s1,t5
    d630:	0106d693          	srl	a3,a3,0x10
    d634:	00a68fb3          	add	t6,a3,a0
    d638:	00e383b3          	add	t2,t2,a4
    d63c:	0104d493          	srl	s1,s1,0x10
    d640:	000f0513          	mv	a0,t5
    d644:	00028593          	mv	a1,t0
    d648:	36c010ef          	jal	e9b4 <__mulsi3>
    d64c:	00050a93          	mv	s5,a0
    d650:	000e0593          	mv	a1,t3
    d654:	000f0513          	mv	a0,t5
    d658:	35c010ef          	jal	e9b4 <__mulsi3>
    d65c:	00050993          	mv	s3,a0
    d660:	00028593          	mv	a1,t0
    d664:	00048513          	mv	a0,s1
    d668:	34c010ef          	jal	e9b4 <__mulsi3>
    d66c:	00050293          	mv	t0,a0
    d670:	000e0593          	mv	a1,t3
    d674:	00048513          	mv	a0,s1
    d678:	33c010ef          	jal	e9b4 <__mulsi3>
    d67c:	010ad613          	srl	a2,s5,0x10
    d680:	005989b3          	add	s3,s3,t0
    d684:	01360633          	add	a2,a2,s3
    d688:	00567463          	bgeu	a2,t0,d690 <__muldf3+0x3a4>
    d68c:	01450533          	add	a0,a0,s4
    d690:	00010a37          	lui	s4,0x10
    d694:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    d698:	00d672b3          	and	t0,a2,a3
    d69c:	00dafab3          	and	s5,s5,a3
    d6a0:	01065613          	srl	a2,a2,0x10
    d6a4:	01029293          	sll	t0,t0,0x10
    d6a8:	00a60e33          	add	t3,a2,a0
    d6ac:	015282b3          	add	t0,t0,s5
    d6b0:	000f0513          	mv	a0,t5
    d6b4:	00090593          	mv	a1,s2
    d6b8:	2fc010ef          	jal	e9b4 <__mulsi3>
    d6bc:	00050993          	mv	s3,a0
    d6c0:	00040593          	mv	a1,s0
    d6c4:	000f0513          	mv	a0,t5
    d6c8:	2ec010ef          	jal	e9b4 <__mulsi3>
    d6cc:	00050f13          	mv	t5,a0
    d6d0:	00090593          	mv	a1,s2
    d6d4:	00048513          	mv	a0,s1
    d6d8:	2dc010ef          	jal	e9b4 <__mulsi3>
    d6dc:	00050913          	mv	s2,a0
    d6e0:	00040593          	mv	a1,s0
    d6e4:	00048513          	mv	a0,s1
    d6e8:	2cc010ef          	jal	e9b4 <__mulsi3>
    d6ec:	012f06b3          	add	a3,t5,s2
    d6f0:	0109d593          	srl	a1,s3,0x10
    d6f4:	00d58433          	add	s0,a1,a3
    d6f8:	00050f13          	mv	t5,a0
    d6fc:	01247463          	bgeu	s0,s2,d704 <__muldf3+0x418>
    d700:	01450f33          	add	t5,a0,s4
    d704:	00010637          	lui	a2,0x10
    d708:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x917>
    d70c:	00c476b3          	and	a3,s0,a2
    d710:	00c9f9b3          	and	s3,s3,a2
    d714:	01069693          	sll	a3,a3,0x10
    d718:	007787b3          	add	a5,a5,t2
    d71c:	013686b3          	add	a3,a3,s3
    d720:	01f685b3          	add	a1,a3,t6
    d724:	00e7b733          	sltu	a4,a5,a4
    d728:	00e58733          	add	a4,a1,a4
    d72c:	005782b3          	add	t0,a5,t0
    d730:	01c70633          	add	a2,a4,t3
    d734:	00f2b7b3          	sltu	a5,t0,a5
    d738:	00f607b3          	add	a5,a2,a5
    d73c:	00d5b6b3          	sltu	a3,a1,a3
    d740:	00b735b3          	sltu	a1,a4,a1
    d744:	00b6e6b3          	or	a3,a3,a1
    d748:	00e63733          	sltu	a4,a2,a4
    d74c:	01045593          	srl	a1,s0,0x10
    d750:	00c7b633          	sltu	a2,a5,a2
    d754:	00b686b3          	add	a3,a3,a1
    d758:	00929a13          	sll	s4,t0,0x9
    d75c:	00c76733          	or	a4,a4,a2
    d760:	00d70733          	add	a4,a4,a3
    d764:	01da6a33          	or	s4,s4,t4
    d768:	01e70733          	add	a4,a4,t5
    d76c:	01403a33          	snez	s4,s4
    d770:	0172d293          	srl	t0,t0,0x17
    d774:	00971713          	sll	a4,a4,0x9
    d778:	0177d693          	srl	a3,a5,0x17
    d77c:	005a6a33          	or	s4,s4,t0
    d780:	00979793          	sll	a5,a5,0x9
    d784:	00fa6a33          	or	s4,s4,a5
    d788:	00771793          	sll	a5,a4,0x7
    d78c:	00d764b3          	or	s1,a4,a3
    d790:	0207d063          	bgez	a5,d7b0 <__muldf3+0x4c4>
    d794:	001a5793          	srl	a5,s4,0x1
    d798:	001a7a13          	and	s4,s4,1
    d79c:	01f49713          	sll	a4,s1,0x1f
    d7a0:	0147e7b3          	or	a5,a5,s4
    d7a4:	00e7ea33          	or	s4,a5,a4
    d7a8:	0014d493          	srl	s1,s1,0x1
    d7ac:	00088313          	mv	t1,a7
    d7b0:	3ff30793          	add	a5,t1,1023
    d7b4:	12f05663          	blez	a5,d8e0 <__muldf3+0x5f4>
    d7b8:	007a7713          	and	a4,s4,7
    d7bc:	02070063          	beqz	a4,d7dc <__muldf3+0x4f0>
    d7c0:	00fa7713          	and	a4,s4,15
    d7c4:	00400693          	li	a3,4
    d7c8:	00d70a63          	beq	a4,a3,d7dc <__muldf3+0x4f0>
    d7cc:	004a0713          	add	a4,s4,4
    d7d0:	01473a33          	sltu	s4,a4,s4
    d7d4:	014484b3          	add	s1,s1,s4
    d7d8:	00070a13          	mv	s4,a4
    d7dc:	00749713          	sll	a4,s1,0x7
    d7e0:	00075a63          	bgez	a4,d7f4 <__muldf3+0x508>
    d7e4:	ff0007b7          	lui	a5,0xff000
    d7e8:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    d7ec:	00f4f4b3          	and	s1,s1,a5
    d7f0:	40030793          	add	a5,t1,1024
    d7f4:	7fe00713          	li	a4,2046
    d7f8:	1cf74463          	blt	a4,a5,d9c0 <__muldf3+0x6d4>
    d7fc:	003a5a13          	srl	s4,s4,0x3
    d800:	01d49713          	sll	a4,s1,0x1d
    d804:	00949693          	sll	a3,s1,0x9
    d808:	01476733          	or	a4,a4,s4
    d80c:	00c6d693          	srl	a3,a3,0xc
    d810:	7ff7f793          	and	a5,a5,2047
    d814:	c89ff06f          	j	d49c <__muldf3+0x1b0>
    d818:	00a4ea33          	or	s4,s1,a0
    d81c:	060a0863          	beqz	s4,d88c <__muldf3+0x5a0>
    d820:	12048e63          	beqz	s1,d95c <__muldf3+0x670>
    d824:	00048513          	mv	a0,s1
    d828:	2fc010ef          	jal	eb24 <__clzsi2>
    d82c:	00050713          	mv	a4,a0
    d830:	ff550693          	add	a3,a0,-11
    d834:	01d00793          	li	a5,29
    d838:	ff870a13          	add	s4,a4,-8
    d83c:	40d787b3          	sub	a5,a5,a3
    d840:	00f457b3          	srl	a5,s0,a5
    d844:	014496b3          	sll	a3,s1,s4
    d848:	00d7e4b3          	or	s1,a5,a3
    d84c:	01441a33          	sll	s4,s0,s4
    d850:	c0d00793          	li	a5,-1011
    d854:	40e78c33          	sub	s8,a5,a4
    d858:	00000b13          	li	s6,0
    d85c:	00000b93          	li	s7,0
    d860:	b09ff06f          	j	d368 <__muldf3+0x7c>
    d864:	00058813          	mv	a6,a1
    d868:	7ff00793          	li	a5,2047
    d86c:	00000693          	li	a3,0
    d870:	00000713          	li	a4,0
    d874:	c29ff06f          	j	d49c <__muldf3+0x1b0>
    d878:	00050a13          	mv	s4,a0
    d87c:	00c00b13          	li	s6,12
    d880:	7ff00c13          	li	s8,2047
    d884:	00300b93          	li	s7,3
    d888:	ae1ff06f          	j	d368 <__muldf3+0x7c>
    d88c:	00000493          	li	s1,0
    d890:	00400b13          	li	s6,4
    d894:	00000c13          	li	s8,0
    d898:	00100b93          	li	s7,1
    d89c:	acdff06f          	j	d368 <__muldf3+0x7c>
    d8a0:	001b6b13          	or	s6,s6,1
    d8a4:	000c0313          	mv	t1,s8
    d8a8:	00000413          	li	s0,0
    d8ac:	00000e13          	li	t3,0
    d8b0:	00100693          	li	a3,1
    d8b4:	afdff06f          	j	d3b0 <__muldf3+0xc4>
    d8b8:	002b6b13          	or	s6,s6,2
    d8bc:	00000413          	li	s0,0
    d8c0:	00000e13          	li	t3,0
    d8c4:	00200693          	li	a3,2
    d8c8:	ae9ff06f          	j	d3b0 <__muldf3+0xc4>
    d8cc:	00040493          	mv	s1,s0
    d8d0:	000e0a13          	mv	s4,t3
    d8d4:	00068b93          	mv	s7,a3
    d8d8:	00098593          	mv	a1,s3
    d8dc:	b99ff06f          	j	d474 <__muldf3+0x188>
    d8e0:	00100713          	li	a4,1
    d8e4:	10079063          	bnez	a5,d9e4 <__muldf3+0x6f8>
    d8e8:	41e30313          	add	t1,t1,1054
    d8ec:	006a1633          	sll	a2,s4,t1
    d8f0:	00c03633          	snez	a2,a2
    d8f4:	00649333          	sll	t1,s1,t1
    d8f8:	00ea5a33          	srl	s4,s4,a4
    d8fc:	00666633          	or	a2,a2,t1
    d900:	01466633          	or	a2,a2,s4
    d904:	00767793          	and	a5,a2,7
    d908:	00e4d5b3          	srl	a1,s1,a4
    d90c:	02078063          	beqz	a5,d92c <__muldf3+0x640>
    d910:	00f67793          	and	a5,a2,15
    d914:	00400713          	li	a4,4
    d918:	00e78a63          	beq	a5,a4,d92c <__muldf3+0x640>
    d91c:	00460793          	add	a5,a2,4
    d920:	00c7b633          	sltu	a2,a5,a2
    d924:	00c585b3          	add	a1,a1,a2
    d928:	00078613          	mv	a2,a5
    d92c:	00859513          	sll	a0,a1,0x8
    d930:	00100793          	li	a5,1
    d934:	00000693          	li	a3,0
    d938:	00000713          	li	a4,0
    d93c:	b60540e3          	bltz	a0,d49c <__muldf3+0x1b0>
    d940:	10c0006f          	j	da4c <__muldf3+0x760>
    d944:	00f00713          	li	a4,15
    d948:	12eb1063          	bne	s6,a4,da68 <__muldf3+0x77c>
    d94c:	00000813          	li	a6,0
    d950:	000806b7          	lui	a3,0x80
    d954:	00000713          	li	a4,0
    d958:	b45ff06f          	j	d49c <__muldf3+0x1b0>
    d95c:	1c8010ef          	jal	eb24 <__clzsi2>
    d960:	01550693          	add	a3,a0,21
    d964:	01c00793          	li	a5,28
    d968:	02050713          	add	a4,a0,32
    d96c:	ecd7d4e3          	bge	a5,a3,d834 <__muldf3+0x548>
    d970:	ff850513          	add	a0,a0,-8
    d974:	00000a13          	li	s4,0
    d978:	00a414b3          	sll	s1,s0,a0
    d97c:	ed5ff06f          	j	d850 <__muldf3+0x564>
    d980:	000a8513          	mv	a0,s5
    d984:	1a0010ef          	jal	eb24 <__clzsi2>
    d988:	01550713          	add	a4,a0,21
    d98c:	01c00793          	li	a5,28
    d990:	02050313          	add	t1,a0,32
    d994:	aae7d4e3          	bge	a5,a4,d43c <__muldf3+0x150>
    d998:	ff850513          	add	a0,a0,-8
    d99c:	00000e13          	li	t3,0
    d9a0:	00aa9433          	sll	s0,s5,a0
    d9a4:	ab5ff06f          	j	d458 <__muldf3+0x16c>
    d9a8:	00000813          	li	a6,0
    d9ac:	7ff00793          	li	a5,2047
    d9b0:	000806b7          	lui	a3,0x80
    d9b4:	ae9ff06f          	j	d49c <__muldf3+0x1b0>
    d9b8:	00088313          	mv	t1,a7
    d9bc:	df5ff06f          	j	d7b0 <__muldf3+0x4c4>
    d9c0:	7ff00793          	li	a5,2047
    d9c4:	00000693          	li	a3,0
    d9c8:	00000713          	li	a4,0
    d9cc:	ad1ff06f          	j	d49c <__muldf3+0x1b0>
    d9d0:	00000813          	li	a6,0
    d9d4:	7ff00793          	li	a5,2047
    d9d8:	000806b7          	lui	a3,0x80
    d9dc:	00000713          	li	a4,0
    d9e0:	abdff06f          	j	d49c <__muldf3+0x1b0>
    d9e4:	40f70733          	sub	a4,a4,a5
    d9e8:	03800693          	li	a3,56
    d9ec:	aae6c2e3          	blt	a3,a4,d490 <__muldf3+0x1a4>
    d9f0:	01f00693          	li	a3,31
    d9f4:	eee6dae3          	bge	a3,a4,d8e8 <__muldf3+0x5fc>
    d9f8:	fe100693          	li	a3,-31
    d9fc:	40f687b3          	sub	a5,a3,a5
    da00:	02000693          	li	a3,32
    da04:	00f4d7b3          	srl	a5,s1,a5
    da08:	00d70863          	beq	a4,a3,da18 <__muldf3+0x72c>
    da0c:	43e30313          	add	t1,t1,1086
    da10:	00649333          	sll	t1,s1,t1
    da14:	006a6a33          	or	s4,s4,t1
    da18:	01403633          	snez	a2,s4
    da1c:	00f66633          	or	a2,a2,a5
    da20:	00767713          	and	a4,a2,7
    da24:	00000693          	li	a3,0
    da28:	02070863          	beqz	a4,da58 <__muldf3+0x76c>
    da2c:	00f67793          	and	a5,a2,15
    da30:	00400713          	li	a4,4
    da34:	00000593          	li	a1,0
    da38:	00e78a63          	beq	a5,a4,da4c <__muldf3+0x760>
    da3c:	00460793          	add	a5,a2,4
    da40:	00c7b633          	sltu	a2,a5,a2
    da44:	00c035b3          	snez	a1,a2
    da48:	00078613          	mv	a2,a5
    da4c:	00959693          	sll	a3,a1,0x9
    da50:	01d59713          	sll	a4,a1,0x1d
    da54:	00c6d693          	srl	a3,a3,0xc
    da58:	00365613          	srl	a2,a2,0x3
    da5c:	00e66733          	or	a4,a2,a4
    da60:	00000793          	li	a5,0
    da64:	a39ff06f          	j	d49c <__muldf3+0x1b0>
    da68:	00040493          	mv	s1,s0
    da6c:	000a8a13          	mv	s4,s5
    da70:	00300b93          	li	s7,3
    da74:	00098593          	mv	a1,s3
    da78:	9fdff06f          	j	d474 <__muldf3+0x188>

0000da7c <__subdf3>:
    da7c:	001007b7          	lui	a5,0x100
    da80:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    da84:	fe010113          	add	sp,sp,-32
    da88:	00b7f8b3          	and	a7,a5,a1
    da8c:	00d7f833          	and	a6,a5,a3
    da90:	0146d793          	srl	a5,a3,0x14
    da94:	00389893          	sll	a7,a7,0x3
    da98:	00812c23          	sw	s0,24(sp)
    da9c:	01312623          	sw	s3,12(sp)
    daa0:	01f5d413          	srl	s0,a1,0x1f
    daa4:	0145d993          	srl	s3,a1,0x14
    daa8:	01d55713          	srl	a4,a0,0x1d
    daac:	00381813          	sll	a6,a6,0x3
    dab0:	01d65593          	srl	a1,a2,0x1d
    dab4:	00112e23          	sw	ra,28(sp)
    dab8:	00912a23          	sw	s1,20(sp)
    dabc:	01212823          	sw	s2,16(sp)
    dac0:	7ff7ff13          	and	t5,a5,2047
    dac4:	7ff00313          	li	t1,2047
    dac8:	01176733          	or	a4,a4,a7
    dacc:	7ff9f993          	and	s3,s3,2047
    dad0:	00040e13          	mv	t3,s0
    dad4:	00351893          	sll	a7,a0,0x3
    dad8:	01f6d693          	srl	a3,a3,0x1f
    dadc:	0105e5b3          	or	a1,a1,a6
    dae0:	00361e93          	sll	t4,a2,0x3
    dae4:	206f0c63          	beq	t5,t1,dcfc <__subdf3+0x280>
    dae8:	0016c693          	xor	a3,a3,1
    daec:	41e987b3          	sub	a5,s3,t5
    daf0:	16d40263          	beq	s0,a3,dc54 <__subdf3+0x1d8>
    daf4:	00f05ae3          	blez	a5,e308 <__subdf3+0x88c>
    daf8:	240f0a63          	beqz	t5,dd4c <__subdf3+0x2d0>
    dafc:	3c698463          	beq	s3,t1,dec4 <__subdf3+0x448>
    db00:	03800693          	li	a3,56
    db04:	00100513          	li	a0,1
    db08:	02f6ce63          	blt	a3,a5,db44 <__subdf3+0xc8>
    db0c:	008006b7          	lui	a3,0x800
    db10:	00d5e5b3          	or	a1,a1,a3
    db14:	01f00693          	li	a3,31
    db18:	4ef6c463          	blt	a3,a5,e000 <__subdf3+0x584>
    db1c:	02000693          	li	a3,32
    db20:	40f686b3          	sub	a3,a3,a5
    db24:	00d59533          	sll	a0,a1,a3
    db28:	00fed633          	srl	a2,t4,a5
    db2c:	00de96b3          	sll	a3,t4,a3
    db30:	00c56533          	or	a0,a0,a2
    db34:	00d036b3          	snez	a3,a3
    db38:	00f5d7b3          	srl	a5,a1,a5
    db3c:	00d56533          	or	a0,a0,a3
    db40:	40f70733          	sub	a4,a4,a5
    db44:	40a88533          	sub	a0,a7,a0
    db48:	00a8b633          	sltu	a2,a7,a0
    db4c:	00050493          	mv	s1,a0
    db50:	40c70933          	sub	s2,a4,a2
    db54:	00891793          	sll	a5,s2,0x8
    db58:	3407d863          	bgez	a5,dea8 <__subdf3+0x42c>
    db5c:	008007b7          	lui	a5,0x800
    db60:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    db64:	00f97933          	and	s2,s2,a5
    db68:	2e090663          	beqz	s2,de54 <__subdf3+0x3d8>
    db6c:	00090513          	mv	a0,s2
    db70:	7b5000ef          	jal	eb24 <__clzsi2>
    db74:	ff850793          	add	a5,a0,-8
    db78:	02000693          	li	a3,32
    db7c:	40f68733          	sub	a4,a3,a5
    db80:	00e4d733          	srl	a4,s1,a4
    db84:	00f91933          	sll	s2,s2,a5
    db88:	01276733          	or	a4,a4,s2
    db8c:	00f494b3          	sll	s1,s1,a5
    db90:	3f37c463          	blt	a5,s3,df78 <__subdf3+0x4fc>
    db94:	413787b3          	sub	a5,a5,s3
    db98:	00178793          	add	a5,a5,1
    db9c:	40f686b3          	sub	a3,a3,a5
    dba0:	00d49633          	sll	a2,s1,a3
    dba4:	00f4d933          	srl	s2,s1,a5
    dba8:	00c03633          	snez	a2,a2
    dbac:	00c96633          	or	a2,s2,a2
    dbb0:	00d716b3          	sll	a3,a4,a3
    dbb4:	00c6e4b3          	or	s1,a3,a2
    dbb8:	00f75933          	srl	s2,a4,a5
    dbbc:	00000993          	li	s3,0
    dbc0:	0074f793          	and	a5,s1,7
    dbc4:	02078063          	beqz	a5,dbe4 <__subdf3+0x168>
    dbc8:	00f4f793          	and	a5,s1,15
    dbcc:	00400713          	li	a4,4
    dbd0:	00e78a63          	beq	a5,a4,dbe4 <__subdf3+0x168>
    dbd4:	00448793          	add	a5,s1,4
    dbd8:	0097b533          	sltu	a0,a5,s1
    dbdc:	00a90933          	add	s2,s2,a0
    dbe0:	00078493          	mv	s1,a5
    dbe4:	00891793          	sll	a5,s2,0x8
    dbe8:	6c07d063          	bgez	a5,e2a8 <__subdf3+0x82c>
    dbec:	00198793          	add	a5,s3,1
    dbf0:	7ff00713          	li	a4,2047
    dbf4:	24e78663          	beq	a5,a4,de40 <__subdf3+0x3c4>
    dbf8:	ff800737          	lui	a4,0xff800
    dbfc:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dc00:	00e97733          	and	a4,s2,a4
    dc04:	7ff7f793          	and	a5,a5,2047
    dc08:	01d71813          	sll	a6,a4,0x1d
    dc0c:	0034d513          	srl	a0,s1,0x3
    dc10:	00971713          	sll	a4,a4,0x9
    dc14:	00a86833          	or	a6,a6,a0
    dc18:	00c75713          	srl	a4,a4,0xc
    dc1c:	00147e13          	and	t3,s0,1
    dc20:	01c12083          	lw	ra,28(sp)
    dc24:	01812403          	lw	s0,24(sp)
    dc28:	01479793          	sll	a5,a5,0x14
    dc2c:	00e7e7b3          	or	a5,a5,a4
    dc30:	01fe1713          	sll	a4,t3,0x1f
    dc34:	00e7e7b3          	or	a5,a5,a4
    dc38:	01412483          	lw	s1,20(sp)
    dc3c:	01012903          	lw	s2,16(sp)
    dc40:	00c12983          	lw	s3,12(sp)
    dc44:	00080513          	mv	a0,a6
    dc48:	00078593          	mv	a1,a5
    dc4c:	02010113          	add	sp,sp,32
    dc50:	00008067          	ret
    dc54:	70f05263          	blez	a5,e358 <__subdf3+0x8dc>
    dc58:	1c0f1663          	bnez	t5,de24 <__subdf3+0x3a8>
    dc5c:	01d5e6b3          	or	a3,a1,t4
    dc60:	26068e63          	beqz	a3,dedc <__subdf3+0x460>
    dc64:	fff78693          	add	a3,a5,-1
    dc68:	46068863          	beqz	a3,e0d8 <__subdf3+0x65c>
    dc6c:	24678c63          	beq	a5,t1,dec4 <__subdf3+0x448>
    dc70:	03800793          	li	a5,56
    dc74:	00100913          	li	s2,1
    dc78:	02d7cc63          	blt	a5,a3,dcb0 <__subdf3+0x234>
    dc7c:	00068793          	mv	a5,a3
    dc80:	01f00693          	li	a3,31
    dc84:	48f6ca63          	blt	a3,a5,e118 <__subdf3+0x69c>
    dc88:	02000693          	li	a3,32
    dc8c:	40f686b3          	sub	a3,a3,a5
    dc90:	00d59933          	sll	s2,a1,a3
    dc94:	00fed633          	srl	a2,t4,a5
    dc98:	00de96b3          	sll	a3,t4,a3
    dc9c:	00c96933          	or	s2,s2,a2
    dca0:	00d036b3          	snez	a3,a3
    dca4:	00f5d7b3          	srl	a5,a1,a5
    dca8:	00d96933          	or	s2,s2,a3
    dcac:	00f70733          	add	a4,a4,a5
    dcb0:	01190633          	add	a2,s2,a7
    dcb4:	01263933          	sltu	s2,a2,s2
    dcb8:	00060493          	mv	s1,a2
    dcbc:	00e90933          	add	s2,s2,a4
    dcc0:	00891793          	sll	a5,s2,0x8
    dcc4:	1e07d263          	bgez	a5,dea8 <__subdf3+0x42c>
    dcc8:	00198993          	add	s3,s3,1
    dccc:	7ff00793          	li	a5,2047
    dcd0:	16f98863          	beq	s3,a5,de40 <__subdf3+0x3c4>
    dcd4:	ff8007b7          	lui	a5,0xff800
    dcd8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dcdc:	0014f513          	and	a0,s1,1
    dce0:	00f977b3          	and	a5,s2,a5
    dce4:	0014d713          	srl	a4,s1,0x1
    dce8:	00a76733          	or	a4,a4,a0
    dcec:	01f79513          	sll	a0,a5,0x1f
    dcf0:	00e564b3          	or	s1,a0,a4
    dcf4:	0017d913          	srl	s2,a5,0x1
    dcf8:	ec9ff06f          	j	dbc0 <__subdf3+0x144>
    dcfc:	01d5e833          	or	a6,a1,t4
    dd00:	80198313          	add	t1,s3,-2047
    dd04:	06080863          	beqz	a6,dd74 <__subdf3+0x2f8>
    dd08:	06d40a63          	beq	s0,a3,dd7c <__subdf3+0x300>
    dd0c:	0e030463          	beqz	t1,ddf4 <__subdf3+0x378>
    dd10:	26098e63          	beqz	s3,df8c <__subdf3+0x510>
    dd14:	00361513          	sll	a0,a2,0x3
    dd18:	00355513          	srl	a0,a0,0x3
    dd1c:	00068413          	mv	s0,a3
    dd20:	00058713          	mv	a4,a1
    dd24:	01d71813          	sll	a6,a4,0x1d
    dd28:	00a86833          	or	a6,a6,a0
    dd2c:	00375713          	srl	a4,a4,0x3
    dd30:	01076733          	or	a4,a4,a6
    dd34:	10070663          	beqz	a4,de40 <__subdf3+0x3c4>
    dd38:	00000e13          	li	t3,0
    dd3c:	7ff00793          	li	a5,2047
    dd40:	00080737          	lui	a4,0x80
    dd44:	00000813          	li	a6,0
    dd48:	ed9ff06f          	j	dc20 <__subdf3+0x1a4>
    dd4c:	01d5e6b3          	or	a3,a1,t4
    dd50:	18068663          	beqz	a3,dedc <__subdf3+0x460>
    dd54:	fff78693          	add	a3,a5,-1
    dd58:	3a068263          	beqz	a3,e0fc <__subdf3+0x680>
    dd5c:	16678463          	beq	a5,t1,dec4 <__subdf3+0x448>
    dd60:	03800793          	li	a5,56
    dd64:	00100513          	li	a0,1
    dd68:	dcd7cee3          	blt	a5,a3,db44 <__subdf3+0xc8>
    dd6c:	00068793          	mv	a5,a3
    dd70:	da5ff06f          	j	db14 <__subdf3+0x98>
    dd74:	0016c693          	xor	a3,a3,1
    dd78:	f8d41ae3          	bne	s0,a3,dd0c <__subdf3+0x290>
    dd7c:	18030863          	beqz	t1,df0c <__subdf3+0x490>
    dd80:	2c099063          	bnez	s3,e040 <__subdf3+0x5c4>
    dd84:	7ff00793          	li	a5,2047
    dd88:	011766b3          	or	a3,a4,a7
    dd8c:	48068863          	beqz	a3,e21c <__subdf3+0x7a0>
    dd90:	fff78693          	add	a3,a5,-1
    dd94:	34068263          	beqz	a3,e0d8 <__subdf3+0x65c>
    dd98:	7ff00513          	li	a0,2047
    dd9c:	2aa78263          	beq	a5,a0,e040 <__subdf3+0x5c4>
    dda0:	03800793          	li	a5,56
    dda4:	00100913          	li	s2,1
    dda8:	02d7ca63          	blt	a5,a3,dddc <__subdf3+0x360>
    ddac:	01f00793          	li	a5,31
    ddb0:	4cd7c663          	blt	a5,a3,e27c <__subdf3+0x800>
    ddb4:	02000793          	li	a5,32
    ddb8:	40d787b3          	sub	a5,a5,a3
    ddbc:	00f71933          	sll	s2,a4,a5
    ddc0:	00d8d633          	srl	a2,a7,a3
    ddc4:	00f897b3          	sll	a5,a7,a5
    ddc8:	00c96933          	or	s2,s2,a2
    ddcc:	00f037b3          	snez	a5,a5
    ddd0:	00d756b3          	srl	a3,a4,a3
    ddd4:	00f96933          	or	s2,s2,a5
    ddd8:	00d585b3          	add	a1,a1,a3
    dddc:	01d90733          	add	a4,s2,t4
    dde0:	01273933          	sltu	s2,a4,s2
    dde4:	00070493          	mv	s1,a4
    dde8:	00b90933          	add	s2,s2,a1
    ddec:	000f0993          	mv	s3,t5
    ddf0:	ed1ff06f          	j	dcc0 <__subdf3+0x244>
    ddf4:	00198793          	add	a5,s3,1
    ddf8:	7fe7f793          	and	a5,a5,2046
    ddfc:	14079463          	bnez	a5,df44 <__subdf3+0x4c8>
    de00:	01d5e833          	or	a6,a1,t4
    de04:	011767b3          	or	a5,a4,a7
    de08:	2a099463          	bnez	s3,e0b0 <__subdf3+0x634>
    de0c:	38078e63          	beqz	a5,e1a8 <__subdf3+0x72c>
    de10:	3c081063          	bnez	a6,e1d0 <__subdf3+0x754>
    de14:	00351513          	sll	a0,a0,0x3
    de18:	00355913          	srl	s2,a0,0x3
    de1c:	00000793          	li	a5,0
    de20:	1140006f          	j	df34 <__subdf3+0x4b8>
    de24:	0a698063          	beq	s3,t1,dec4 <__subdf3+0x448>
    de28:	03800693          	li	a3,56
    de2c:	00100913          	li	s2,1
    de30:	e8f6c0e3          	blt	a3,a5,dcb0 <__subdf3+0x234>
    de34:	008006b7          	lui	a3,0x800
    de38:	00d5e5b3          	or	a1,a1,a3
    de3c:	e45ff06f          	j	dc80 <__subdf3+0x204>
    de40:	00147e13          	and	t3,s0,1
    de44:	7ff00793          	li	a5,2047
    de48:	00000713          	li	a4,0
    de4c:	00000813          	li	a6,0
    de50:	dd1ff06f          	j	dc20 <__subdf3+0x1a4>
    de54:	00048513          	mv	a0,s1
    de58:	4cd000ef          	jal	eb24 <__clzsi2>
    de5c:	01850793          	add	a5,a0,24
    de60:	01f00693          	li	a3,31
    de64:	d0f6dae3          	bge	a3,a5,db78 <__subdf3+0xfc>
    de68:	ff850713          	add	a4,a0,-8
    de6c:	00e49733          	sll	a4,s1,a4
    de70:	1b37ce63          	blt	a5,s3,e02c <__subdf3+0x5b0>
    de74:	413789b3          	sub	s3,a5,s3
    de78:	00198793          	add	a5,s3,1
    de7c:	42f6de63          	bge	a3,a5,e2b8 <__subdf3+0x83c>
    de80:	fe198993          	add	s3,s3,-31
    de84:	02000693          	li	a3,32
    de88:	013754b3          	srl	s1,a4,s3
    de8c:	00d78c63          	beq	a5,a3,dea4 <__subdf3+0x428>
    de90:	04000693          	li	a3,64
    de94:	40f687b3          	sub	a5,a3,a5
    de98:	00f71733          	sll	a4,a4,a5
    de9c:	00e03733          	snez	a4,a4
    dea0:	00e4e4b3          	or	s1,s1,a4
    dea4:	00000993          	li	s3,0
    dea8:	0074f793          	and	a5,s1,7
    deac:	d0079ee3          	bnez	a5,dbc8 <__subdf3+0x14c>
    deb0:	00098793          	mv	a5,s3
    deb4:	0034d513          	srl	a0,s1,0x3
    deb8:	00090713          	mv	a4,s2
    debc:	0280006f          	j	dee4 <__subdf3+0x468>
    dec0:	e6081ce3          	bnez	a6,dd38 <__subdf3+0x2bc>
    dec4:	00351513          	sll	a0,a0,0x3
    dec8:	01d71813          	sll	a6,a4,0x1d
    decc:	00355513          	srl	a0,a0,0x3
    ded0:	00a86833          	or	a6,a6,a0
    ded4:	00375713          	srl	a4,a4,0x3
    ded8:	e59ff06f          	j	dd30 <__subdf3+0x2b4>
    dedc:	00351513          	sll	a0,a0,0x3
    dee0:	00355513          	srl	a0,a0,0x3
    dee4:	01d71813          	sll	a6,a4,0x1d
    dee8:	7ff00693          	li	a3,2047
    deec:	00a86833          	or	a6,a6,a0
    def0:	00375713          	srl	a4,a4,0x3
    def4:	e2d78ee3          	beq	a5,a3,dd30 <__subdf3+0x2b4>
    def8:	00c71713          	sll	a4,a4,0xc
    defc:	00c75713          	srl	a4,a4,0xc
    df00:	7ff7f793          	and	a5,a5,2047
    df04:	00147e13          	and	t3,s0,1
    df08:	d19ff06f          	j	dc20 <__subdf3+0x1a4>
    df0c:	00198693          	add	a3,s3,1
    df10:	7fe6f793          	and	a5,a3,2046
    df14:	12079e63          	bnez	a5,e050 <__subdf3+0x5d4>
    df18:	011767b3          	or	a5,a4,a7
    df1c:	24099a63          	bnez	s3,e170 <__subdf3+0x6f4>
    df20:	30078663          	beqz	a5,e22c <__subdf3+0x7b0>
    df24:	01d5e7b3          	or	a5,a1,t4
    df28:	30079a63          	bnez	a5,e23c <__subdf3+0x7c0>
    df2c:	00351513          	sll	a0,a0,0x3
    df30:	00355913          	srl	s2,a0,0x3
    df34:	01d71813          	sll	a6,a4,0x1d
    df38:	01286833          	or	a6,a6,s2
    df3c:	00375713          	srl	a4,a4,0x3
    df40:	fb9ff06f          	j	def8 <__subdf3+0x47c>
    df44:	41d88833          	sub	a6,a7,t4
    df48:	0108b7b3          	sltu	a5,a7,a6
    df4c:	40b70933          	sub	s2,a4,a1
    df50:	40f90933          	sub	s2,s2,a5
    df54:	00891793          	sll	a5,s2,0x8
    df58:	00080493          	mv	s1,a6
    df5c:	1207c263          	bltz	a5,e080 <__subdf3+0x604>
    df60:	01286833          	or	a6,a6,s2
    df64:	c00812e3          	bnez	a6,db68 <__subdf3+0xec>
    df68:	00000e13          	li	t3,0
    df6c:	00000793          	li	a5,0
    df70:	00000713          	li	a4,0
    df74:	cadff06f          	j	dc20 <__subdf3+0x1a4>
    df78:	ff800937          	lui	s2,0xff800
    df7c:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    df80:	40f989b3          	sub	s3,s3,a5
    df84:	01277933          	and	s2,a4,s2
    df88:	c39ff06f          	j	dbc0 <__subdf3+0x144>
    df8c:	7ff00793          	li	a5,2047
    df90:	01176533          	or	a0,a4,a7
    df94:	10050463          	beqz	a0,e09c <__subdf3+0x620>
    df98:	fff78813          	add	a6,a5,-1
    df9c:	1e080263          	beqz	a6,e180 <__subdf3+0x704>
    dfa0:	7ff00513          	li	a0,2047
    dfa4:	d6a788e3          	beq	a5,a0,dd14 <__subdf3+0x298>
    dfa8:	03800793          	li	a5,56
    dfac:	00068413          	mv	s0,a3
    dfb0:	00100513          	li	a0,1
    dfb4:	0307ca63          	blt	a5,a6,dfe8 <__subdf3+0x56c>
    dfb8:	01f00793          	li	a5,31
    dfbc:	1907c463          	blt	a5,a6,e144 <__subdf3+0x6c8>
    dfc0:	02000793          	li	a5,32
    dfc4:	410787b3          	sub	a5,a5,a6
    dfc8:	00f71533          	sll	a0,a4,a5
    dfcc:	0108d6b3          	srl	a3,a7,a6
    dfd0:	00f897b3          	sll	a5,a7,a5
    dfd4:	00d56533          	or	a0,a0,a3
    dfd8:	00f037b3          	snez	a5,a5
    dfdc:	01075833          	srl	a6,a4,a6
    dfe0:	00f56533          	or	a0,a0,a5
    dfe4:	410585b3          	sub	a1,a1,a6
    dfe8:	40ae8533          	sub	a0,t4,a0
    dfec:	00aeb733          	sltu	a4,t4,a0
    dff0:	00050493          	mv	s1,a0
    dff4:	40e58933          	sub	s2,a1,a4
    dff8:	000f0993          	mv	s3,t5
    dffc:	b59ff06f          	j	db54 <__subdf3+0xd8>
    e000:	fe078693          	add	a3,a5,-32
    e004:	02000613          	li	a2,32
    e008:	00d5d6b3          	srl	a3,a1,a3
    e00c:	00c78a63          	beq	a5,a2,e020 <__subdf3+0x5a4>
    e010:	04000613          	li	a2,64
    e014:	40f607b3          	sub	a5,a2,a5
    e018:	00f597b3          	sll	a5,a1,a5
    e01c:	00feeeb3          	or	t4,t4,a5
    e020:	01d03533          	snez	a0,t4
    e024:	00d56533          	or	a0,a0,a3
    e028:	b1dff06f          	j	db44 <__subdf3+0xc8>
    e02c:	ff8006b7          	lui	a3,0xff800
    e030:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e034:	40f987b3          	sub	a5,s3,a5
    e038:	00d77733          	and	a4,a4,a3
    e03c:	ef9ff06f          	j	df34 <__subdf3+0x4b8>
    e040:	00361513          	sll	a0,a2,0x3
    e044:	00355513          	srl	a0,a0,0x3
    e048:	00058713          	mv	a4,a1
    e04c:	cd9ff06f          	j	dd24 <__subdf3+0x2a8>
    e050:	7ff00793          	li	a5,2047
    e054:	def686e3          	beq	a3,a5,de40 <__subdf3+0x3c4>
    e058:	01d88eb3          	add	t4,a7,t4
    e05c:	011eb633          	sltu	a2,t4,a7
    e060:	00b707b3          	add	a5,a4,a1
    e064:	00c787b3          	add	a5,a5,a2
    e068:	01f79513          	sll	a0,a5,0x1f
    e06c:	001ede93          	srl	t4,t4,0x1
    e070:	01d564b3          	or	s1,a0,t4
    e074:	0017d913          	srl	s2,a5,0x1
    e078:	00068993          	mv	s3,a3
    e07c:	b45ff06f          	j	dbc0 <__subdf3+0x144>
    e080:	411e8633          	sub	a2,t4,a7
    e084:	40e587b3          	sub	a5,a1,a4
    e088:	00ceb733          	sltu	a4,t4,a2
    e08c:	00060493          	mv	s1,a2
    e090:	40e78933          	sub	s2,a5,a4
    e094:	00068413          	mv	s0,a3
    e098:	ad1ff06f          	j	db68 <__subdf3+0xec>
    e09c:	00361613          	sll	a2,a2,0x3
    e0a0:	00365513          	srl	a0,a2,0x3
    e0a4:	00068413          	mv	s0,a3
    e0a8:	00058713          	mv	a4,a1
    e0ac:	e39ff06f          	j	dee4 <__subdf3+0x468>
    e0b0:	e00798e3          	bnez	a5,dec0 <__subdf3+0x444>
    e0b4:	22080663          	beqz	a6,e2e0 <__subdf3+0x864>
    e0b8:	0035d713          	srl	a4,a1,0x3
    e0bc:	00361613          	sll	a2,a2,0x3
    e0c0:	01d59593          	sll	a1,a1,0x1d
    e0c4:	00b76733          	or	a4,a4,a1
    e0c8:	00365613          	srl	a2,a2,0x3
    e0cc:	00c76733          	or	a4,a4,a2
    e0d0:	00068413          	mv	s0,a3
    e0d4:	c61ff06f          	j	dd34 <__subdf3+0x2b8>
    e0d8:	01d88eb3          	add	t4,a7,t4
    e0dc:	00b705b3          	add	a1,a4,a1
    e0e0:	011eb633          	sltu	a2,t4,a7
    e0e4:	00c58933          	add	s2,a1,a2
    e0e8:	00891793          	sll	a5,s2,0x8
    e0ec:	000e8493          	mv	s1,t4
    e0f0:	0a07d863          	bgez	a5,e1a0 <__subdf3+0x724>
    e0f4:	00200993          	li	s3,2
    e0f8:	bddff06f          	j	dcd4 <__subdf3+0x258>
    e0fc:	41d88eb3          	sub	t4,a7,t4
    e100:	40b705b3          	sub	a1,a4,a1
    e104:	01d8b633          	sltu	a2,a7,t4
    e108:	000e8493          	mv	s1,t4
    e10c:	40c58933          	sub	s2,a1,a2
    e110:	00100993          	li	s3,1
    e114:	a41ff06f          	j	db54 <__subdf3+0xd8>
    e118:	fe078693          	add	a3,a5,-32
    e11c:	02000613          	li	a2,32
    e120:	00d5d6b3          	srl	a3,a1,a3
    e124:	00c78a63          	beq	a5,a2,e138 <__subdf3+0x6bc>
    e128:	04000613          	li	a2,64
    e12c:	40f607b3          	sub	a5,a2,a5
    e130:	00f597b3          	sll	a5,a1,a5
    e134:	00feeeb3          	or	t4,t4,a5
    e138:	01d03933          	snez	s2,t4
    e13c:	00d96933          	or	s2,s2,a3
    e140:	b71ff06f          	j	dcb0 <__subdf3+0x234>
    e144:	fe080793          	add	a5,a6,-32
    e148:	02000693          	li	a3,32
    e14c:	00f757b3          	srl	a5,a4,a5
    e150:	00d80a63          	beq	a6,a3,e164 <__subdf3+0x6e8>
    e154:	04000693          	li	a3,64
    e158:	410686b3          	sub	a3,a3,a6
    e15c:	00d71733          	sll	a4,a4,a3
    e160:	00e8e8b3          	or	a7,a7,a4
    e164:	01103533          	snez	a0,a7
    e168:	00f56533          	or	a0,a0,a5
    e16c:	e7dff06f          	j	dfe8 <__subdf3+0x56c>
    e170:	ec0788e3          	beqz	a5,e040 <__subdf3+0x5c4>
    e174:	01d5eeb3          	or	t4,a1,t4
    e178:	bc0e90e3          	bnez	t4,dd38 <__subdf3+0x2bc>
    e17c:	d49ff06f          	j	dec4 <__subdf3+0x448>
    e180:	411e8633          	sub	a2,t4,a7
    e184:	40e585b3          	sub	a1,a1,a4
    e188:	00ceb733          	sltu	a4,t4,a2
    e18c:	00060493          	mv	s1,a2
    e190:	40e58933          	sub	s2,a1,a4
    e194:	00068413          	mv	s0,a3
    e198:	00100993          	li	s3,1
    e19c:	9b9ff06f          	j	db54 <__subdf3+0xd8>
    e1a0:	00100793          	li	a5,1
    e1a4:	d11ff06f          	j	deb4 <__subdf3+0x438>
    e1a8:	dc0800e3          	beqz	a6,df68 <__subdf3+0x4ec>
    e1ac:	00361613          	sll	a2,a2,0x3
    e1b0:	00365793          	srl	a5,a2,0x3
    e1b4:	01d59813          	sll	a6,a1,0x1d
    e1b8:	00959713          	sll	a4,a1,0x9
    e1bc:	00f86833          	or	a6,a6,a5
    e1c0:	00c75713          	srl	a4,a4,0xc
    e1c4:	00068e13          	mv	t3,a3
    e1c8:	00000793          	li	a5,0
    e1cc:	a55ff06f          	j	dc20 <__subdf3+0x1a4>
    e1d0:	41d88933          	sub	s2,a7,t4
    e1d4:	0128b7b3          	sltu	a5,a7,s2
    e1d8:	40b70633          	sub	a2,a4,a1
    e1dc:	40f60633          	sub	a2,a2,a5
    e1e0:	00861793          	sll	a5,a2,0x8
    e1e4:	0e07d263          	bgez	a5,e2c8 <__subdf3+0x84c>
    e1e8:	411e8633          	sub	a2,t4,a7
    e1ec:	40e58733          	sub	a4,a1,a4
    e1f0:	00cebeb3          	sltu	t4,t4,a2
    e1f4:	41d70733          	sub	a4,a4,t4
    e1f8:	00871793          	sll	a5,a4,0x8
    e1fc:	00060493          	mv	s1,a2
    e200:	1207de63          	bgez	a5,e33c <__subdf3+0x8c0>
    e204:	ff8007b7          	lui	a5,0xff800
    e208:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e20c:	00f77733          	and	a4,a4,a5
    e210:	00068413          	mv	s0,a3
    e214:	00100793          	li	a5,1
    e218:	9f1ff06f          	j	dc08 <__subdf3+0x18c>
    e21c:	00361613          	sll	a2,a2,0x3
    e220:	00365513          	srl	a0,a2,0x3
    e224:	00058713          	mv	a4,a1
    e228:	cbdff06f          	j	dee4 <__subdf3+0x468>
    e22c:	00361613          	sll	a2,a2,0x3
    e230:	00365913          	srl	s2,a2,0x3
    e234:	00058713          	mv	a4,a1
    e238:	cfdff06f          	j	df34 <__subdf3+0x4b8>
    e23c:	01d886b3          	add	a3,a7,t4
    e240:	00b707b3          	add	a5,a4,a1
    e244:	0116b633          	sltu	a2,a3,a7
    e248:	00c787b3          	add	a5,a5,a2
    e24c:	00879713          	sll	a4,a5,0x8
    e250:	0036d813          	srl	a6,a3,0x3
    e254:	08075e63          	bgez	a4,e2f0 <__subdf3+0x874>
    e258:	ff800737          	lui	a4,0xff800
    e25c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e260:	00e7f7b3          	and	a5,a5,a4
    e264:	01d79713          	sll	a4,a5,0x1d
    e268:	00979793          	sll	a5,a5,0x9
    e26c:	01076833          	or	a6,a4,a6
    e270:	00c7d713          	srl	a4,a5,0xc
    e274:	00100793          	li	a5,1
    e278:	9a9ff06f          	j	dc20 <__subdf3+0x1a4>
    e27c:	fe068793          	add	a5,a3,-32
    e280:	02000613          	li	a2,32
    e284:	00f757b3          	srl	a5,a4,a5
    e288:	00c68a63          	beq	a3,a2,e29c <__subdf3+0x820>
    e28c:	04000613          	li	a2,64
    e290:	40d606b3          	sub	a3,a2,a3
    e294:	00d71733          	sll	a4,a4,a3
    e298:	00e8e8b3          	or	a7,a7,a4
    e29c:	01103933          	snez	s2,a7
    e2a0:	00f96933          	or	s2,s2,a5
    e2a4:	b39ff06f          	j	dddc <__subdf3+0x360>
    e2a8:	0034d513          	srl	a0,s1,0x3
    e2ac:	00098793          	mv	a5,s3
    e2b0:	00090713          	mv	a4,s2
    e2b4:	c31ff06f          	j	dee4 <__subdf3+0x468>
    e2b8:	02000693          	li	a3,32
    e2bc:	40f686b3          	sub	a3,a3,a5
    e2c0:	00000613          	li	a2,0
    e2c4:	8e9ff06f          	j	dbac <__subdf3+0x130>
    e2c8:	00c96833          	or	a6,s2,a2
    e2cc:	c8080ee3          	beqz	a6,df68 <__subdf3+0x4ec>
    e2d0:	00395913          	srl	s2,s2,0x3
    e2d4:	00000793          	li	a5,0
    e2d8:	00060713          	mv	a4,a2
    e2dc:	c59ff06f          	j	df34 <__subdf3+0x4b8>
    e2e0:	00000e13          	li	t3,0
    e2e4:	7ff00793          	li	a5,2047
    e2e8:	00080737          	lui	a4,0x80
    e2ec:	935ff06f          	j	dc20 <__subdf3+0x1a4>
    e2f0:	01d79713          	sll	a4,a5,0x1d
    e2f4:	00979793          	sll	a5,a5,0x9
    e2f8:	01076833          	or	a6,a4,a6
    e2fc:	00c7d713          	srl	a4,a5,0xc
    e300:	00000793          	li	a5,0
    e304:	91dff06f          	j	dc20 <__subdf3+0x1a4>
    e308:	ae0786e3          	beqz	a5,ddf4 <__subdf3+0x378>
    e30c:	413f0833          	sub	a6,t5,s3
    e310:	00080793          	mv	a5,a6
    e314:	c6098ee3          	beqz	s3,df90 <__subdf3+0x514>
    e318:	03800793          	li	a5,56
    e31c:	0107ca63          	blt	a5,a6,e330 <__subdf3+0x8b4>
    e320:	008007b7          	lui	a5,0x800
    e324:	00f76733          	or	a4,a4,a5
    e328:	00068413          	mv	s0,a3
    e32c:	c8dff06f          	j	dfb8 <__subdf3+0x53c>
    e330:	00068413          	mv	s0,a3
    e334:	00100513          	li	a0,1
    e338:	cb1ff06f          	j	dfe8 <__subdf3+0x56c>
    e33c:	01d71813          	sll	a6,a4,0x1d
    e340:	00365613          	srl	a2,a2,0x3
    e344:	00c86833          	or	a6,a6,a2
    e348:	00375713          	srl	a4,a4,0x3
    e34c:	00000793          	li	a5,0
    e350:	00068413          	mv	s0,a3
    e354:	ba5ff06f          	j	def8 <__subdf3+0x47c>
    e358:	ba078ae3          	beqz	a5,df0c <__subdf3+0x490>
    e35c:	413f06b3          	sub	a3,t5,s3
    e360:	00099663          	bnez	s3,e36c <__subdf3+0x8f0>
    e364:	00068793          	mv	a5,a3
    e368:	a21ff06f          	j	dd88 <__subdf3+0x30c>
    e36c:	03800793          	li	a5,56
    e370:	00100913          	li	s2,1
    e374:	a6d7c4e3          	blt	a5,a3,dddc <__subdf3+0x360>
    e378:	008007b7          	lui	a5,0x800
    e37c:	00f76733          	or	a4,a4,a5
    e380:	a2dff06f          	j	ddac <__subdf3+0x330>

0000e384 <__unorddf2>:
    e384:	0145d713          	srl	a4,a1,0x14
    e388:	001007b7          	lui	a5,0x100
    e38c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e390:	fff74713          	not	a4,a4
    e394:	0146d813          	srl	a6,a3,0x14
    e398:	00b7f5b3          	and	a1,a5,a1
    e39c:	00d7f7b3          	and	a5,a5,a3
    e3a0:	01571693          	sll	a3,a4,0x15
    e3a4:	7ff87813          	and	a6,a6,2047
    e3a8:	02068063          	beqz	a3,e3c8 <__unorddf2+0x44>
    e3ac:	7ff00713          	li	a4,2047
    e3b0:	00000513          	li	a0,0
    e3b4:	00e80463          	beq	a6,a4,e3bc <__unorddf2+0x38>
    e3b8:	00008067          	ret
    e3bc:	00c7e7b3          	or	a5,a5,a2
    e3c0:	00f03533          	snez	a0,a5
    e3c4:	00008067          	ret
    e3c8:	00a5e5b3          	or	a1,a1,a0
    e3cc:	00100513          	li	a0,1
    e3d0:	fc058ee3          	beqz	a1,e3ac <__unorddf2+0x28>
    e3d4:	00008067          	ret

0000e3d8 <__fixdfsi>:
    e3d8:	0145d793          	srl	a5,a1,0x14
    e3dc:	001006b7          	lui	a3,0x100
    e3e0:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e3e4:	7ff7f793          	and	a5,a5,2047
    e3e8:	3fe00613          	li	a2,1022
    e3ec:	00b77733          	and	a4,a4,a1
    e3f0:	01f5d593          	srl	a1,a1,0x1f
    e3f4:	00f65e63          	bge	a2,a5,e410 <__fixdfsi+0x38>
    e3f8:	41d00613          	li	a2,1053
    e3fc:	00f65e63          	bge	a2,a5,e418 <__fixdfsi+0x40>
    e400:	80000537          	lui	a0,0x80000
    e404:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e408:	00a58533          	add	a0,a1,a0
    e40c:	00008067          	ret
    e410:	00000513          	li	a0,0
    e414:	00008067          	ret
    e418:	43300613          	li	a2,1075
    e41c:	40f60633          	sub	a2,a2,a5
    e420:	01f00813          	li	a6,31
    e424:	00d76733          	or	a4,a4,a3
    e428:	02c85063          	bge	a6,a2,e448 <__fixdfsi+0x70>
    e42c:	41300693          	li	a3,1043
    e430:	40f687b3          	sub	a5,a3,a5
    e434:	00f75733          	srl	a4,a4,a5
    e438:	40e00533          	neg	a0,a4
    e43c:	fc059ce3          	bnez	a1,e414 <__fixdfsi+0x3c>
    e440:	00070513          	mv	a0,a4
    e444:	00008067          	ret
    e448:	bed78793          	add	a5,a5,-1043
    e44c:	00f71733          	sll	a4,a4,a5
    e450:	00c55533          	srl	a0,a0,a2
    e454:	00a76733          	or	a4,a4,a0
    e458:	fe1ff06f          	j	e438 <__fixdfsi+0x60>

0000e45c <__floatsidf>:
    e45c:	ff010113          	add	sp,sp,-16
    e460:	00112623          	sw	ra,12(sp)
    e464:	00812423          	sw	s0,8(sp)
    e468:	00912223          	sw	s1,4(sp)
    e46c:	04050a63          	beqz	a0,e4c0 <__floatsidf+0x64>
    e470:	41f55713          	sra	a4,a0,0x1f
    e474:	00a744b3          	xor	s1,a4,a0
    e478:	40e484b3          	sub	s1,s1,a4
    e47c:	00050793          	mv	a5,a0
    e480:	00048513          	mv	a0,s1
    e484:	01f7d413          	srl	s0,a5,0x1f
    e488:	69c000ef          	jal	eb24 <__clzsi2>
    e48c:	41e00793          	li	a5,1054
    e490:	40a787b3          	sub	a5,a5,a0
    e494:	00a00713          	li	a4,10
    e498:	7ff7f793          	and	a5,a5,2047
    e49c:	06a74063          	blt	a4,a0,e4fc <__floatsidf+0xa0>
    e4a0:	00b00713          	li	a4,11
    e4a4:	40a70733          	sub	a4,a4,a0
    e4a8:	00e4d733          	srl	a4,s1,a4
    e4ac:	01550513          	add	a0,a0,21
    e4b0:	00c71713          	sll	a4,a4,0xc
    e4b4:	00a494b3          	sll	s1,s1,a0
    e4b8:	00c75713          	srl	a4,a4,0xc
    e4bc:	0140006f          	j	e4d0 <__floatsidf+0x74>
    e4c0:	00000413          	li	s0,0
    e4c4:	00000793          	li	a5,0
    e4c8:	00000713          	li	a4,0
    e4cc:	00000493          	li	s1,0
    e4d0:	01479793          	sll	a5,a5,0x14
    e4d4:	01f41413          	sll	s0,s0,0x1f
    e4d8:	00e7e7b3          	or	a5,a5,a4
    e4dc:	00c12083          	lw	ra,12(sp)
    e4e0:	0087e7b3          	or	a5,a5,s0
    e4e4:	00812403          	lw	s0,8(sp)
    e4e8:	00048513          	mv	a0,s1
    e4ec:	00078593          	mv	a1,a5
    e4f0:	00412483          	lw	s1,4(sp)
    e4f4:	01010113          	add	sp,sp,16
    e4f8:	00008067          	ret
    e4fc:	ff550513          	add	a0,a0,-11
    e500:	00a49733          	sll	a4,s1,a0
    e504:	00c71713          	sll	a4,a4,0xc
    e508:	00c75713          	srl	a4,a4,0xc
    e50c:	00000493          	li	s1,0
    e510:	fc1ff06f          	j	e4d0 <__floatsidf+0x74>

0000e514 <__floatunsidf>:
    e514:	ff010113          	add	sp,sp,-16
    e518:	00812423          	sw	s0,8(sp)
    e51c:	00112623          	sw	ra,12(sp)
    e520:	00050413          	mv	s0,a0
    e524:	04050c63          	beqz	a0,e57c <__floatunsidf+0x68>
    e528:	5fc000ef          	jal	eb24 <__clzsi2>
    e52c:	41e00793          	li	a5,1054
    e530:	40a787b3          	sub	a5,a5,a0
    e534:	00a00713          	li	a4,10
    e538:	7ff7f793          	and	a5,a5,2047
    e53c:	06a74463          	blt	a4,a0,e5a4 <__floatunsidf+0x90>
    e540:	00b00713          	li	a4,11
    e544:	40a70733          	sub	a4,a4,a0
    e548:	01550513          	add	a0,a0,21
    e54c:	00e45733          	srl	a4,s0,a4
    e550:	00a41433          	sll	s0,s0,a0
    e554:	00c12083          	lw	ra,12(sp)
    e558:	00040513          	mv	a0,s0
    e55c:	00c71713          	sll	a4,a4,0xc
    e560:	00812403          	lw	s0,8(sp)
    e564:	00c75713          	srl	a4,a4,0xc
    e568:	01479793          	sll	a5,a5,0x14
    e56c:	00e7e7b3          	or	a5,a5,a4
    e570:	00078593          	mv	a1,a5
    e574:	01010113          	add	sp,sp,16
    e578:	00008067          	ret
    e57c:	00c12083          	lw	ra,12(sp)
    e580:	00040513          	mv	a0,s0
    e584:	00000793          	li	a5,0
    e588:	00812403          	lw	s0,8(sp)
    e58c:	00000713          	li	a4,0
    e590:	01479793          	sll	a5,a5,0x14
    e594:	00e7e7b3          	or	a5,a5,a4
    e598:	00078593          	mv	a1,a5
    e59c:	01010113          	add	sp,sp,16
    e5a0:	00008067          	ret
    e5a4:	ff550513          	add	a0,a0,-11
    e5a8:	00a41733          	sll	a4,s0,a0
    e5ac:	00000413          	li	s0,0
    e5b0:	00c12083          	lw	ra,12(sp)
    e5b4:	00040513          	mv	a0,s0
    e5b8:	00c71713          	sll	a4,a4,0xc
    e5bc:	00812403          	lw	s0,8(sp)
    e5c0:	00c75713          	srl	a4,a4,0xc
    e5c4:	01479793          	sll	a5,a5,0x14
    e5c8:	00e7e7b3          	or	a5,a5,a4
    e5cc:	00078593          	mv	a1,a5
    e5d0:	01010113          	add	sp,sp,16
    e5d4:	00008067          	ret

0000e5d8 <__trunctfdf2>:
    e5d8:	00c52583          	lw	a1,12(a0)
    e5dc:	00852783          	lw	a5,8(a0)
    e5e0:	00052803          	lw	a6,0(a0)
    e5e4:	00452683          	lw	a3,4(a0)
    e5e8:	01059613          	sll	a2,a1,0x10
    e5ec:	fe010113          	add	sp,sp,-32
    e5f0:	00159713          	sll	a4,a1,0x1
    e5f4:	01065613          	srl	a2,a2,0x10
    e5f8:	00f12423          	sw	a5,8(sp)
    e5fc:	00b12623          	sw	a1,12(sp)
    e600:	00f12c23          	sw	a5,24(sp)
    e604:	01012023          	sw	a6,0(sp)
    e608:	00d12223          	sw	a3,4(sp)
    e60c:	01012823          	sw	a6,16(sp)
    e610:	00d12a23          	sw	a3,20(sp)
    e614:	00c12e23          	sw	a2,28(sp)
    e618:	01175713          	srl	a4,a4,0x11
    e61c:	01f5d593          	srl	a1,a1,0x1f
    e620:	01010893          	add	a7,sp,16
    e624:	01c10793          	add	a5,sp,28
    e628:	00361513          	sll	a0,a2,0x3
    e62c:	ffc7a603          	lw	a2,-4(a5)
    e630:	ffc78793          	add	a5,a5,-4
    e634:	01d65693          	srl	a3,a2,0x1d
    e638:	00a6e6b3          	or	a3,a3,a0
    e63c:	00d7a223          	sw	a3,4(a5)
    e640:	fef894e3          	bne	a7,a5,e628 <__trunctfdf2+0x50>
    e644:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e648:	00381813          	sll	a6,a6,0x3
    e64c:	01169613          	sll	a2,a3,0x11
    e650:	01012823          	sw	a6,16(sp)
    e654:	01265613          	srl	a2,a2,0x12
    e658:	04060263          	beqz	a2,e69c <__trunctfdf2+0xc4>
    e65c:	ffffc6b7          	lui	a3,0xffffc
    e660:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e664:	00d70733          	add	a4,a4,a3
    e668:	7fe00693          	li	a3,2046
    e66c:	10e6d463          	bge	a3,a4,e774 <__trunctfdf2+0x19c>
    e670:	7ff00793          	li	a5,2047
    e674:	00000613          	li	a2,0
    e678:	00000693          	li	a3,0
    e67c:	01479793          	sll	a5,a5,0x14
    e680:	01f59593          	sll	a1,a1,0x1f
    e684:	00c7e7b3          	or	a5,a5,a2
    e688:	00b7e7b3          	or	a5,a5,a1
    e68c:	00068513          	mv	a0,a3
    e690:	00078593          	mv	a1,a5
    e694:	02010113          	add	sp,sp,32
    e698:	00008067          	ret
    e69c:	01412603          	lw	a2,20(sp)
    e6a0:	01812883          	lw	a7,24(sp)
    e6a4:	01c12503          	lw	a0,28(sp)
    e6a8:	011666b3          	or	a3,a2,a7
    e6ac:	00a6e6b3          	or	a3,a3,a0
    e6b0:	0106e6b3          	or	a3,a3,a6
    e6b4:	04071463          	bnez	a4,e6fc <__trunctfdf2+0x124>
    e6b8:	14068263          	beqz	a3,e7fc <__trunctfdf2+0x224>
    e6bc:	00500693          	li	a3,5
    e6c0:	00000613          	li	a2,0
    e6c4:	0036d793          	srl	a5,a3,0x3
    e6c8:	01d61693          	sll	a3,a2,0x1d
    e6cc:	00f6e6b3          	or	a3,a3,a5
    e6d0:	00961613          	sll	a2,a2,0x9
    e6d4:	7ff77793          	and	a5,a4,2047
    e6d8:	00c65613          	srl	a2,a2,0xc
    e6dc:	01479793          	sll	a5,a5,0x14
    e6e0:	01f59593          	sll	a1,a1,0x1f
    e6e4:	00c7e7b3          	or	a5,a5,a2
    e6e8:	00b7e7b3          	or	a5,a5,a1
    e6ec:	00068513          	mv	a0,a3
    e6f0:	00078593          	mv	a1,a5
    e6f4:	02010113          	add	sp,sp,32
    e6f8:	00008067          	ret
    e6fc:	12068463          	beqz	a3,e824 <__trunctfdf2+0x24c>
    e700:	01c8d793          	srl	a5,a7,0x1c
    e704:	00451513          	sll	a0,a0,0x4
    e708:	00a7e7b3          	or	a5,a5,a0
    e70c:	008006b7          	lui	a3,0x800
    e710:	00d7f6b3          	and	a3,a5,a3
    e714:	1c068263          	beqz	a3,e8d8 <__trunctfdf2+0x300>
    e718:	ff800737          	lui	a4,0xff800
    e71c:	01c65693          	srl	a3,a2,0x1c
    e720:	00489893          	sll	a7,a7,0x4
    e724:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e728:	00e7f633          	and	a2,a5,a4
    e72c:	0116e6b3          	or	a3,a3,a7
    e730:	004007b7          	lui	a5,0x400
    e734:	00f66633          	or	a2,a2,a5
    e738:	ff86f693          	and	a3,a3,-8
    e73c:	00000793          	li	a5,0
    e740:	0036d713          	srl	a4,a3,0x3
    e744:	01d61693          	sll	a3,a2,0x1d
    e748:	00961613          	sll	a2,a2,0x9
    e74c:	00c65613          	srl	a2,a2,0xc
    e750:	01479793          	sll	a5,a5,0x14
    e754:	01f59593          	sll	a1,a1,0x1f
    e758:	00c7e7b3          	or	a5,a5,a2
    e75c:	00e6e6b3          	or	a3,a3,a4
    e760:	00b7e7b3          	or	a5,a5,a1
    e764:	00068513          	mv	a0,a3
    e768:	00078593          	mv	a1,a5
    e76c:	02010113          	add	sp,sp,32
    e770:	00008067          	ret
    e774:	0ce05c63          	blez	a4,e84c <__trunctfdf2+0x274>
    e778:	01412783          	lw	a5,20(sp)
    e77c:	01812503          	lw	a0,24(sp)
    e780:	01c12603          	lw	a2,28(sp)
    e784:	00479693          	sll	a3,a5,0x4
    e788:	0106e6b3          	or	a3,a3,a6
    e78c:	01c7d793          	srl	a5,a5,0x1c
    e790:	00451813          	sll	a6,a0,0x4
    e794:	00461613          	sll	a2,a2,0x4
    e798:	01c55513          	srl	a0,a0,0x1c
    e79c:	00d036b3          	snez	a3,a3
    e7a0:	0107e7b3          	or	a5,a5,a6
    e7a4:	00a66633          	or	a2,a2,a0
    e7a8:	00f6e6b3          	or	a3,a3,a5
    e7ac:	0076f793          	and	a5,a3,7
    e7b0:	02078063          	beqz	a5,e7d0 <__trunctfdf2+0x1f8>
    e7b4:	00f6f793          	and	a5,a3,15
    e7b8:	00400513          	li	a0,4
    e7bc:	00a78a63          	beq	a5,a0,e7d0 <__trunctfdf2+0x1f8>
    e7c0:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    e7c4:	00d7b6b3          	sltu	a3,a5,a3
    e7c8:	00d60633          	add	a2,a2,a3
    e7cc:	00078693          	mv	a3,a5
    e7d0:	008007b7          	lui	a5,0x800
    e7d4:	00f677b3          	and	a5,a2,a5
    e7d8:	ee0786e3          	beqz	a5,e6c4 <__trunctfdf2+0xec>
    e7dc:	00170713          	add	a4,a4,1
    e7e0:	7ff00793          	li	a5,2047
    e7e4:	e8f706e3          	beq	a4,a5,e670 <__trunctfdf2+0x98>
    e7e8:	ff8007b7          	lui	a5,0xff800
    e7ec:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e7f0:	00f67633          	and	a2,a2,a5
    e7f4:	7ff77793          	and	a5,a4,2047
    e7f8:	f49ff06f          	j	e740 <__trunctfdf2+0x168>
    e7fc:	00000793          	li	a5,0
    e800:	00000613          	li	a2,0
    e804:	01479793          	sll	a5,a5,0x14
    e808:	01f59593          	sll	a1,a1,0x1f
    e80c:	00c7e7b3          	or	a5,a5,a2
    e810:	00b7e7b3          	or	a5,a5,a1
    e814:	00068513          	mv	a0,a3
    e818:	00078593          	mv	a1,a5
    e81c:	02010113          	add	sp,sp,32
    e820:	00008067          	ret
    e824:	7ff00793          	li	a5,2047
    e828:	00000613          	li	a2,0
    e82c:	01479793          	sll	a5,a5,0x14
    e830:	01f59593          	sll	a1,a1,0x1f
    e834:	00c7e7b3          	or	a5,a5,a2
    e838:	00b7e7b3          	or	a5,a5,a1
    e83c:	00068513          	mv	a0,a3
    e840:	00078593          	mv	a1,a5
    e844:	02010113          	add	sp,sp,32
    e848:	00008067          	ret
    e84c:	fcc00693          	li	a3,-52
    e850:	08d74c63          	blt	a4,a3,e8e8 <__trunctfdf2+0x310>
    e854:	03d00693          	li	a3,61
    e858:	40e686b3          	sub	a3,a3,a4
    e85c:	01c12703          	lw	a4,28(sp)
    e860:	4056de13          	sra	t3,a3,0x5
    e864:	00080eb7          	lui	t4,0x80
    e868:	00eeeeb3          	or	t4,t4,a4
    e86c:	002e1513          	sll	a0,t3,0x2
    e870:	01d12e23          	sw	t4,28(sp)
    e874:	01f6f693          	and	a3,a3,31
    e878:	00a88833          	add	a6,a7,a0
    e87c:	00088613          	mv	a2,a7
    e880:	00000713          	li	a4,0
    e884:	00062303          	lw	t1,0(a2)
    e888:	00460613          	add	a2,a2,4
    e88c:	00676733          	or	a4,a4,t1
    e890:	fec81ae3          	bne	a6,a2,e884 <__trunctfdf2+0x2ac>
    e894:	00300613          	li	a2,3
    e898:	41c60633          	sub	a2,a2,t3
    e89c:	04069a63          	bnez	a3,e8f0 <__trunctfdf2+0x318>
    e8a0:	00082803          	lw	a6,0(a6)
    e8a4:	00168693          	add	a3,a3,1
    e8a8:	00478793          	add	a5,a5,4
    e8ac:	ff07ae23          	sw	a6,-4(a5)
    e8b0:	00d64e63          	blt	a2,a3,e8cc <__trunctfdf2+0x2f4>
    e8b4:	00a78833          	add	a6,a5,a0
    e8b8:	00082803          	lw	a6,0(a6)
    e8bc:	00168693          	add	a3,a3,1
    e8c0:	00478793          	add	a5,a5,4
    e8c4:	ff07ae23          	sw	a6,-4(a5)
    e8c8:	fed656e3          	bge	a2,a3,e8b4 <__trunctfdf2+0x2dc>
    e8cc:	00400793          	li	a5,4
    e8d0:	41c787b3          	sub	a5,a5,t3
    e8d4:	0840006f          	j	e958 <__trunctfdf2+0x380>
    e8d8:	00000593          	li	a1,0
    e8dc:	7ff00793          	li	a5,2047
    e8e0:	00080637          	lui	a2,0x80
    e8e4:	d99ff06f          	j	e67c <__trunctfdf2+0xa4>
    e8e8:	00000713          	li	a4,0
    e8ec:	dd1ff06f          	j	e6bc <__trunctfdf2+0xe4>
    e8f0:	02050813          	add	a6,a0,32
    e8f4:	00280833          	add	a6,a6,sp
    e8f8:	ff082803          	lw	a6,-16(a6)
    e8fc:	02000f13          	li	t5,32
    e900:	40df0f33          	sub	t5,t5,a3
    e904:	01e81833          	sll	a6,a6,t5
    e908:	01076733          	or	a4,a4,a6
    e90c:	08060e63          	beqz	a2,e9a8 <__trunctfdf2+0x3d0>
    e910:	00261813          	sll	a6,a2,0x2
    e914:	00f80fb3          	add	t6,a6,a5
    e918:	00a88633          	add	a2,a7,a0
    e91c:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    e920:	00462303          	lw	t1,4(a2)
    e924:	00478793          	add	a5,a5,4
    e928:	00d55533          	srl	a0,a0,a3
    e92c:	01e31333          	sll	t1,t1,t5
    e930:	00656533          	or	a0,a0,t1
    e934:	fea7ae23          	sw	a0,-4(a5)
    e938:	00460613          	add	a2,a2,4
    e93c:	feff90e3          	bne	t6,a5,e91c <__trunctfdf2+0x344>
    e940:	00400793          	li	a5,4
    e944:	41c787b3          	sub	a5,a5,t3
    e948:	02080613          	add	a2,a6,32
    e94c:	00260633          	add	a2,a2,sp
    e950:	00dedeb3          	srl	t4,t4,a3
    e954:	ffd62823          	sw	t4,-16(a2)
    e958:	00400693          	li	a3,4
    e95c:	40f686b3          	sub	a3,a3,a5
    e960:	00269693          	sll	a3,a3,0x2
    e964:	00279793          	sll	a5,a5,0x2
    e968:	00800613          	li	a2,8
    e96c:	00f888b3          	add	a7,a7,a5
    e970:	00c6ea63          	bltu	a3,a2,e984 <__trunctfdf2+0x3ac>
    e974:	0008a023          	sw	zero,0(a7)
    e978:	0008a223          	sw	zero,4(a7)
    e97c:	ff868693          	add	a3,a3,-8
    e980:	00888893          	add	a7,a7,8
    e984:	00400793          	li	a5,4
    e988:	00f6e463          	bltu	a3,a5,e990 <__trunctfdf2+0x3b8>
    e98c:	0008a023          	sw	zero,0(a7)
    e990:	01012783          	lw	a5,16(sp)
    e994:	00e03733          	snez	a4,a4
    e998:	01412603          	lw	a2,20(sp)
    e99c:	00f766b3          	or	a3,a4,a5
    e9a0:	00000713          	li	a4,0
    e9a4:	e09ff06f          	j	e7ac <__trunctfdf2+0x1d4>
    e9a8:	00100793          	li	a5,1
    e9ac:	00000813          	li	a6,0
    e9b0:	f99ff06f          	j	e948 <__trunctfdf2+0x370>

0000e9b4 <__mulsi3>:
    e9b4:	00050613          	mv	a2,a0
    e9b8:	00000513          	li	a0,0
    e9bc:	0015f693          	and	a3,a1,1
    e9c0:	00068463          	beqz	a3,e9c8 <__mulsi3+0x14>
    e9c4:	00c50533          	add	a0,a0,a2
    e9c8:	0015d593          	srl	a1,a1,0x1
    e9cc:	00161613          	sll	a2,a2,0x1
    e9d0:	fe0596e3          	bnez	a1,e9bc <__mulsi3+0x8>
    e9d4:	00008067          	ret

0000e9d8 <__muldi3>:
    e9d8:	ff010113          	add	sp,sp,-16
    e9dc:	00812423          	sw	s0,8(sp)
    e9e0:	00050413          	mv	s0,a0
    e9e4:	00112623          	sw	ra,12(sp)
    e9e8:	00060513          	mv	a0,a2
    e9ec:	00068393          	mv	t2,a3
    e9f0:	00040713          	mv	a4,s0
    e9f4:	00060813          	mv	a6,a2
    e9f8:	00000793          	li	a5,0
    e9fc:	00000313          	li	t1,0
    ea00:	00000f13          	li	t5,0
    ea04:	01e708b3          	add	a7,a4,t5
    ea08:	00187e93          	and	t4,a6,1
    ea0c:	00f30fb3          	add	t6,t1,a5
    ea10:	01f75e13          	srl	t3,a4,0x1f
    ea14:	00185813          	srl	a6,a6,0x1
    ea18:	00e8b2b3          	sltu	t0,a7,a4
    ea1c:	00179793          	sll	a5,a5,0x1
    ea20:	000e8663          	beqz	t4,ea2c <__muldi3+0x54>
    ea24:	00088f13          	mv	t5,a7
    ea28:	01f28333          	add	t1,t0,t6
    ea2c:	00171713          	sll	a4,a4,0x1
    ea30:	01c7e7b3          	or	a5,a5,t3
    ea34:	fc0818e3          	bnez	a6,ea04 <__muldi3+0x2c>
    ea38:	00058663          	beqz	a1,ea44 <__muldi3+0x6c>
    ea3c:	f79ff0ef          	jal	e9b4 <__mulsi3>
    ea40:	00650333          	add	t1,a0,t1
    ea44:	00038a63          	beqz	t2,ea58 <__muldi3+0x80>
    ea48:	00040513          	mv	a0,s0
    ea4c:	00038593          	mv	a1,t2
    ea50:	f65ff0ef          	jal	e9b4 <__mulsi3>
    ea54:	00650333          	add	t1,a0,t1
    ea58:	00c12083          	lw	ra,12(sp)
    ea5c:	00812403          	lw	s0,8(sp)
    ea60:	000f0513          	mv	a0,t5
    ea64:	00030593          	mv	a1,t1
    ea68:	01010113          	add	sp,sp,16
    ea6c:	00008067          	ret

0000ea70 <__divsi3>:
    ea70:	06054063          	bltz	a0,ead0 <__umodsi3+0x10>
    ea74:	0605c663          	bltz	a1,eae0 <__umodsi3+0x20>

0000ea78 <__hidden___udivsi3>:
    ea78:	00058613          	mv	a2,a1
    ea7c:	00050593          	mv	a1,a0
    ea80:	fff00513          	li	a0,-1
    ea84:	02060c63          	beqz	a2,eabc <__hidden___udivsi3+0x44>
    ea88:	00100693          	li	a3,1
    ea8c:	00b67a63          	bgeu	a2,a1,eaa0 <__hidden___udivsi3+0x28>
    ea90:	00c05863          	blez	a2,eaa0 <__hidden___udivsi3+0x28>
    ea94:	00161613          	sll	a2,a2,0x1
    ea98:	00169693          	sll	a3,a3,0x1
    ea9c:	feb66ae3          	bltu	a2,a1,ea90 <__hidden___udivsi3+0x18>
    eaa0:	00000513          	li	a0,0
    eaa4:	00c5e663          	bltu	a1,a2,eab0 <__hidden___udivsi3+0x38>
    eaa8:	40c585b3          	sub	a1,a1,a2
    eaac:	00d56533          	or	a0,a0,a3
    eab0:	0016d693          	srl	a3,a3,0x1
    eab4:	00165613          	srl	a2,a2,0x1
    eab8:	fe0696e3          	bnez	a3,eaa4 <__hidden___udivsi3+0x2c>
    eabc:	00008067          	ret

0000eac0 <__umodsi3>:
    eac0:	00008293          	mv	t0,ra
    eac4:	fb5ff0ef          	jal	ea78 <__hidden___udivsi3>
    eac8:	00058513          	mv	a0,a1
    eacc:	00028067          	jr	t0
    ead0:	40a00533          	neg	a0,a0
    ead4:	00b04863          	bgtz	a1,eae4 <__umodsi3+0x24>
    ead8:	40b005b3          	neg	a1,a1
    eadc:	f9dff06f          	j	ea78 <__hidden___udivsi3>
    eae0:	40b005b3          	neg	a1,a1
    eae4:	00008293          	mv	t0,ra
    eae8:	f91ff0ef          	jal	ea78 <__hidden___udivsi3>
    eaec:	40a00533          	neg	a0,a0
    eaf0:	00028067          	jr	t0

0000eaf4 <__modsi3>:
    eaf4:	00008293          	mv	t0,ra
    eaf8:	0005ca63          	bltz	a1,eb0c <__modsi3+0x18>
    eafc:	00054c63          	bltz	a0,eb14 <__modsi3+0x20>
    eb00:	f79ff0ef          	jal	ea78 <__hidden___udivsi3>
    eb04:	00058513          	mv	a0,a1
    eb08:	00028067          	jr	t0
    eb0c:	40b005b3          	neg	a1,a1
    eb10:	fe0558e3          	bgez	a0,eb00 <__modsi3+0xc>
    eb14:	40a00533          	neg	a0,a0
    eb18:	f61ff0ef          	jal	ea78 <__hidden___udivsi3>
    eb1c:	40b00533          	neg	a0,a1
    eb20:	00028067          	jr	t0

0000eb24 <__clzsi2>:
    eb24:	000107b7          	lui	a5,0x10
    eb28:	02f57a63          	bgeu	a0,a5,eb5c <__clzsi2+0x38>
    eb2c:	10053793          	sltiu	a5,a0,256
    eb30:	0017b793          	seqz	a5,a5
    eb34:	00379793          	sll	a5,a5,0x3
    eb38:	02000713          	li	a4,32
    eb3c:	40f70733          	sub	a4,a4,a5
    eb40:	00f55533          	srl	a0,a0,a5
    eb44:	00001797          	auipc	a5,0x1
    eb48:	aa478793          	add	a5,a5,-1372 # f5e8 <__clz_tab>
    eb4c:	00a787b3          	add	a5,a5,a0
    eb50:	0007c503          	lbu	a0,0(a5)
    eb54:	40a70533          	sub	a0,a4,a0
    eb58:	00008067          	ret
    eb5c:	010007b7          	lui	a5,0x1000
    eb60:	02f57463          	bgeu	a0,a5,eb88 <__clzsi2+0x64>
    eb64:	01000793          	li	a5,16
    eb68:	00f55533          	srl	a0,a0,a5
    eb6c:	00001797          	auipc	a5,0x1
    eb70:	a7c78793          	add	a5,a5,-1412 # f5e8 <__clz_tab>
    eb74:	00a787b3          	add	a5,a5,a0
    eb78:	0007c503          	lbu	a0,0(a5)
    eb7c:	01000713          	li	a4,16
    eb80:	40a70533          	sub	a0,a4,a0
    eb84:	00008067          	ret
    eb88:	01800793          	li	a5,24
    eb8c:	00f55533          	srl	a0,a0,a5
    eb90:	00001797          	auipc	a5,0x1
    eb94:	a5878793          	add	a5,a5,-1448 # f5e8 <__clz_tab>
    eb98:	00a787b3          	add	a5,a5,a0
    eb9c:	0007c503          	lbu	a0,0(a5)
    eba0:	00800713          	li	a4,8
    eba4:	40a70533          	sub	a0,a4,a0
    eba8:	00008067          	ret
