
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x600>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	0000f397          	auipc	t2,0xf
      38:	31c38393          	add	t2,t2,796 # f350 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80001597          	auipc	a1,0x80001
      58:	8c058593          	add	a1,a1,-1856 # 80000914 <__crt0_bss_end>
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
     110:	85040413          	add	s0,s0,-1968 # e95c <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	84848493          	add	s1,s1,-1976 # e95c <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	22860613          	add	a2,a2,552 # 358 <main>

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
     174:	0000e417          	auipc	s0,0xe
     178:	7e840413          	add	s0,s0,2024 # e95c <__fini_array_end>
     17c:	0000e497          	auipc	s1,0xe
     180:	7e048493          	add	s1,s1,2016 # e95c <__fini_array_end>

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
   ======================= */
static inline uint64_t rdcycle(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do {
    __asm__ volatile ("csrr %0, mcycleh" : "=r"(hi1));
     1e4:	b80025f3          	csrr	a1,mcycleh
    __asm__ volatile ("csrr %0, mcycle"  : "=r"(lo));
     1e8:	b0002573          	csrr	a0,mcycle
    __asm__ volatile ("csrr %0, mcycleh" : "=r"(hi2));
     1ec:	b80027f3          	csrr	a5,mcycleh
  } while (hi1 != hi2);
     1f0:	fef59ae3          	bne	a1,a5,1e4 <rdcycle>
  return ((uint64_t)hi1 << 32) | lo;
#else
  uint64_t v; __asm__ volatile ("csrr %0, mcycle" : "=r"(v)); return v;
#endif
}
     1f4:	00008067          	ret

000001f8 <rdinstret>:
static inline uint64_t rdinstret(void) {
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do {
    __asm__ volatile ("csrr %0, minstreth" : "=r"(hi1));
     1f8:	b82025f3          	csrr	a1,minstreth
    __asm__ volatile ("csrr %0, minstret"  : "=r"(lo));
     1fc:	b0202573          	csrr	a0,minstret
    __asm__ volatile ("csrr %0, minstreth" : "=r"(hi2));
     200:	b82027f3          	csrr	a5,minstreth
  } while (hi1 != hi2);
     204:	fef59ae3          	bne	a1,a5,1f8 <rdinstret>
  return ((uint64_t)hi1 << 32) | lo;
#else
  uint64_t v; __asm__ volatile ("csrr %0, minstret" : "=r"(v)); return v;
#endif
}
     208:	00008067          	ret

0000020c <print_i32_2x2>:
}

/* =======================
   Utilities
   ======================= */
static void print_i32_2x2(const char* name, const int32_t C[2][2]) {
     20c:	ff010113          	add	sp,sp,-16
     210:	00812423          	sw	s0,8(sp)
     214:	00058413          	mv	s0,a1
  printf("%s:\n", name);
     218:	00050593          	mv	a1,a0
     21c:	0000f537          	lui	a0,0xf
     220:	96050513          	add	a0,a0,-1696 # e960 <__fini_array_end+0x4>
static void print_i32_2x2(const char* name, const int32_t C[2][2]) {
     224:	00112623          	sw	ra,12(sp)
     228:	00912223          	sw	s1,4(sp)
  printf("%s:\n", name);
     22c:	029000ef          	jal	a54 <printf>
  printf("%6ld %6ld\n", (long)C[0][0], (long)C[0][1]);
     230:	00442603          	lw	a2,4(s0)
     234:	00042583          	lw	a1,0(s0)
     238:	0000f4b7          	lui	s1,0xf
     23c:	96848513          	add	a0,s1,-1688 # e968 <__fini_array_end+0xc>
     240:	015000ef          	jal	a54 <printf>
  printf("%6ld %6ld\n", (long)C[1][0], (long)C[1][1]);
     244:	00c42603          	lw	a2,12(s0)
     248:	00842583          	lw	a1,8(s0)
}
     24c:	00812403          	lw	s0,8(sp)
     250:	00c12083          	lw	ra,12(sp)
  printf("%6ld %6ld\n", (long)C[1][0], (long)C[1][1]);
     254:	96848513          	add	a0,s1,-1688
}
     258:	00412483          	lw	s1,4(sp)
     25c:	01010113          	add	sp,sp,16
  printf("%6ld %6ld\n", (long)C[1][0], (long)C[1][1]);
     260:	7f40006f          	j	a54 <printf>

00000264 <print_speedup_fixed>:

/* Print speedup as fixed-point with 3 decimals: (num/den) ≈ X.YYYx */
static void print_speedup_fixed(const char* label, uint64_t num, uint64_t den) {
     264:	fe010113          	add	sp,sp,-32
     268:	01212823          	sw	s2,16(sp)
     26c:	00112e23          	sw	ra,28(sp)
     270:	00812c23          	sw	s0,24(sp)
     274:	00912a23          	sw	s1,20(sp)
  if (den == 0) { printf("%s: n/a\n", label); return; }
     278:	00e6e7b3          	or	a5,a3,a4
static void print_speedup_fixed(const char* label, uint64_t num, uint64_t den) {
     27c:	00050913          	mv	s2,a0
  if (den == 0) { printf("%s: n/a\n", label); return; }
     280:	02079463          	bnez	a5,2a8 <print_speedup_fixed+0x44>
  uint64_t scaled = (num * 1000ull + den/2) / den; /* rounded */
  uint64_t i = scaled / 1000ull;
  uint64_t f = scaled % 1000ull;
  printf("%s: %" PRIu64 ".%03" PRIu64 "x\n", label, i, f);
}
     284:	01812403          	lw	s0,24(sp)
     288:	01c12083          	lw	ra,28(sp)
     28c:	01412483          	lw	s1,20(sp)
     290:	01012903          	lw	s2,16(sp)
  if (den == 0) { printf("%s: n/a\n", label); return; }
     294:	00050593          	mv	a1,a0
     298:	0000f537          	lui	a0,0xf
     29c:	97450513          	add	a0,a0,-1676 # e974 <__fini_array_end+0x18>
}
     2a0:	02010113          	add	sp,sp,32
  if (den == 0) { printf("%s: n/a\n", label); return; }
     2a4:	7b00006f          	j	a54 <printf>
     2a8:	00068493          	mv	s1,a3
     2ac:	00058513          	mv	a0,a1
  uint64_t scaled = (num * 1000ull + den/2) / den; /* rounded */
     2b0:	00000693          	li	a3,0
     2b4:	00060593          	mv	a1,a2
     2b8:	3e800613          	li	a2,1000
     2bc:	00070413          	mv	s0,a4
     2c0:	4c80e0ef          	jal	e788 <__muldi3>
     2c4:	01f41713          	sll	a4,s0,0x1f
     2c8:	0014d813          	srl	a6,s1,0x1
     2cc:	01076833          	or	a6,a4,a6
     2d0:	00050793          	mv	a5,a0
     2d4:	00145713          	srl	a4,s0,0x1
     2d8:	01050533          	add	a0,a0,a6
     2dc:	00f537b3          	sltu	a5,a0,a5
     2e0:	00e585b3          	add	a1,a1,a4
     2e4:	00b785b3          	add	a1,a5,a1
     2e8:	00048613          	mv	a2,s1
     2ec:	00040693          	mv	a3,s0
     2f0:	4a10a0ef          	jal	af90 <__udivdi3>
  uint64_t f = scaled % 1000ull;
     2f4:	3e800613          	li	a2,1000
     2f8:	00000693          	li	a3,0
  uint64_t scaled = (num * 1000ull + den/2) / den; /* rounded */
     2fc:	00050493          	mv	s1,a0
     300:	00058413          	mv	s0,a1
  uint64_t f = scaled % 1000ull;
     304:	3380b0ef          	jal	b63c <__umoddi3>
     308:	00a12623          	sw	a0,12(sp)
     30c:	00b12423          	sw	a1,8(sp)
  uint64_t i = scaled / 1000ull;
     310:	3e800613          	li	a2,1000
     314:	00000693          	li	a3,0
     318:	00048513          	mv	a0,s1
     31c:	00040593          	mv	a1,s0
     320:	4710a0ef          	jal	af90 <__udivdi3>
}
     324:	01812403          	lw	s0,24(sp)
  printf("%s: %" PRIu64 ".%03" PRIu64 "x\n", label, i, f);
     328:	00c12703          	lw	a4,12(sp)
     32c:	00812783          	lw	a5,8(sp)
}
     330:	01c12083          	lw	ra,28(sp)
     334:	01412483          	lw	s1,20(sp)
  uint64_t i = scaled / 1000ull;
     338:	00058693          	mv	a3,a1
  printf("%s: %" PRIu64 ".%03" PRIu64 "x\n", label, i, f);
     33c:	00090593          	mv	a1,s2
}
     340:	01012903          	lw	s2,16(sp)
  uint64_t i = scaled / 1000ull;
     344:	00050613          	mv	a2,a0
  printf("%s: %" PRIu64 ".%03" PRIu64 "x\n", label, i, f);
     348:	0000f537          	lui	a0,0xf
     34c:	98050513          	add	a0,a0,-1664 # e980 <__fini_array_end+0x24>
}
     350:	02010113          	add	sp,sp,32
  printf("%s: %" PRIu64 ".%03" PRIu64 "x\n", label, i, f);
     354:	7000006f          	j	a54 <printf>

00000358 <main>:
  /* B = [[5,6],[7,8]] */
  BKx2[0*LDB2 + 0] = 5;  BKx2[0*LDB2 + 1] = 6;
  BKx2[1*LDB2 + 0] = 7;  BKx2[1*LDB2 + 1] = 8;
}

int main(void) {
     358:	f5010113          	add	sp,sp,-176
     35c:	09612823          	sw	s6,144(sp)
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     360:	ffeb0b37          	lui	s6,0xffeb0
     364:	000b2583          	lw	a1,0(s6) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  /* Check ID */
  uint32_t id = cfs_read(CFS_CTL);
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n", id);
     368:	0000f537          	lui	a0,0xf
     36c:	9bc50513          	add	a0,a0,-1604 # e9bc <__fini_array_end+0x60>
int main(void) {
     370:	0a112623          	sw	ra,172(sp)
     374:	0a812423          	sw	s0,168(sp)
     378:	0a912223          	sw	s1,164(sp)
     37c:	0b212023          	sw	s2,160(sp)
     380:	09312e23          	sw	s3,156(sp)
     384:	09412c23          	sw	s4,152(sp)
     388:	09512a23          	sw	s5,148(sp)
     38c:	09712623          	sw	s7,140(sp)
     390:	09812423          	sw	s8,136(sp)
     394:	09912223          	sw	s9,132(sp)
     398:	09a12023          	sw	s10,128(sp)
     39c:	07b12e23          	sw	s11,124(sp)
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n", id);
     3a0:	6b4000ef          	jal	a54 <printf>
  int8_t A2xK[2*2], BKx2[2*2]; int K;
  make_example_2x2(A2xK, LDA2, BKx2, LDB2, &K);

  /* ===== SW multiply timing ===== */
  int32_t C_sw[2][2];
  uint64_t c0 = rdcycle(), i0 = rdinstret();
     3a4:	e41ff0ef          	jal	1e4 <rdcycle>
     3a8:	00058a13          	mv	s4,a1
     3ac:	00050913          	mv	s2,a0
     3b0:	e49ff0ef          	jal	1f8 <rdinstret>
     3b4:	01300793          	li	a5,19
     3b8:	00f12823          	sw	a5,16(sp)
     3bc:	01600793          	li	a5,22
     3c0:	00f12a23          	sw	a5,20(sp)
     3c4:	02b00793          	li	a5,43
     3c8:	00f12c23          	sw	a5,24(sp)
     3cc:	03200793          	li	a5,50
     3d0:	00058a93          	mv	s5,a1
     3d4:	00f12e23          	sw	a5,28(sp)
     3d8:	00050493          	mv	s1,a0
  gemm_ref_2xK_Kx2(A2xK, LDA2, BKx2, LDB2, K, C_sw);
  uint64_t i1 = rdinstret(), c1 = rdcycle();
     3dc:	e1dff0ef          	jal	1f8 <rdinstret>
     3e0:	00050993          	mv	s3,a0
     3e4:	00058413          	mv	s0,a1
     3e8:	dfdff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cycles  = c1 - c0;
     3ec:	41250933          	sub	s2,a0,s2
     3f0:	012537b3          	sltu	a5,a0,s2
     3f4:	414585b3          	sub	a1,a1,s4
  uint64_t sw_instret = i1 - i0;
     3f8:	409984b3          	sub	s1,s3,s1
  uint64_t sw_cycles  = c1 - c0;
     3fc:	40f58a33          	sub	s4,a1,a5
  uint64_t sw_instret = i1 - i0;
     400:	0099b9b3          	sltu	s3,s3,s1

  /* ===== CFS multiply timing ===== */
  int32_t C_hw[2][2];
  c0 = rdcycle(); i0 = rdinstret();
     404:	de1ff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_instret = i1 - i0;
     408:	41540433          	sub	s0,s0,s5
     40c:	41340433          	sub	s0,s0,s3
  c0 = rdcycle(); i0 = rdinstret();
     410:	00b12023          	sw	a1,0(sp)
     414:	00050993          	mv	s3,a0
     418:	de1ff0ef          	jal	1f8 <rdinstret>
     41c:	00a12223          	sw	a0,4(sp)
  for (int i = 0; i < 4*LDA; ++i) A_flat[i] = 0;
     420:	80000537          	lui	a0,0x80000
     424:	03e00613          	li	a2,62
  c0 = rdcycle(); i0 = rdinstret();
     428:	00058a93          	mv	s5,a1
  for (int i = 0; i < 4*LDA; ++i) A_flat[i] = 0;
     42c:	77650513          	add	a0,a0,1910 # 80000776 <A_flat.1+0x2>
     430:	00000593          	li	a1,0
     434:	670000ef          	jal	aa4 <memset>
  for (int k = 0; k < MAXK*LDB; ++k) B_flat[k] = 0;
     438:	80000537          	lui	a0,0x80000
     43c:	03e00613          	li	a2,62
     440:	00000593          	li	a1,0
     444:	73650513          	add	a0,a0,1846 # 80000736 <B_flat.0+0x2>
     448:	65c000ef          	jal	aa4 <memset>
    for (int k = 0; k < K; ++k) A_flat[i*LDA + k] = A2xK[i*LDA2 + k];
     44c:	80000637          	lui	a2,0x80000
     450:	20100793          	li	a5,513
     454:	76f61a23          	sh	a5,1908(a2) # 80000774 <A_flat.1>
     458:	40300713          	li	a4,1027
     45c:	77460793          	add	a5,a2,1908
     460:	00e79823          	sh	a4,16(a5)
    B_flat[k*LDB + 0] = B_Kx2[k*LDB2 + 0];
     464:	800005b7          	lui	a1,0x80000
     468:	60500793          	li	a5,1541
     46c:	72f59a23          	sh	a5,1844(a1) # 80000734 <B_flat.0>
     470:	000017b7          	lui	a5,0x1
     474:	73458713          	add	a4,a1,1844
     478:	80778793          	add	a5,a5,-2041 # 807 <_kill+0x7>
     47c:	00f71223          	sh	a5,4(a4)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     480:	ffeb0bb7          	lui	s7,0xffeb0
     484:	00200793          	li	a5,2
     488:	ffeb00b7          	lui	ra,0xffeb0
     48c:	ffeb03b7          	lui	t2,0xffeb0
     490:	ffeb02b7          	lui	t0,0xffeb0
     494:	ffeb0fb7          	lui	t6,0xffeb0
     498:	ffeb0f37          	lui	t5,0xffeb0
     49c:	ffeb0eb7          	lui	t4,0xffeb0
     4a0:	00fb2023          	sw	a5,0(s6)
  for (int t = 0; t < T; t += 4) {
     4a4:	00000813          	li	a6,0
     4a8:	77460613          	add	a2,a2,1908
     4ac:	73458593          	add	a1,a1,1844
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
     4b0:	00100713          	li	a4,1
      for (int s = 0; s < 4; ++s) {
     4b4:	00400c13          	li	s8,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     4b8:	ffeb08b7          	lui	a7,0xffeb0
     4bc:	004b8b93          	add	s7,s7,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     4c0:	008b0b13          	add	s6,s6,8
     4c4:	00c08093          	add	ra,ra,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     4c8:	01038393          	add	t2,t2,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     4cc:	01428293          	add	t0,t0,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     4d0:	018f8f93          	add	t6,t6,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     4d4:	01cf0f13          	add	t5,t5,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     4d8:	020e8e93          	add	t4,t4,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
    int8_t a_bytes[4][4] = {{0}};
     4dc:	02012023          	sw	zero,32(sp)
     4e0:	02012223          	sw	zero,36(sp)
     4e4:	02012423          	sw	zero,40(sp)
     4e8:	02012623          	sw	zero,44(sp)
    int8_t b_bytes[4][4] = {{0}};
     4ec:	02012823          	sw	zero,48(sp)
     4f0:	02012a23          	sw	zero,52(sp)
     4f4:	02012c23          	sw	zero,56(sp)
     4f8:	02012e23          	sw	zero,60(sp)
    for (int i = 0; i < 4; ++i)
     4fc:	00060e13          	mv	t3,a2
     500:	02010313          	add	t1,sp,32
     504:	00000513          	li	a0,0
      for (int s = 0; s < 4; ++s) {
     508:	40a806b3          	sub	a3,a6,a0
     50c:	00000793          	li	a5,0
        if (k >= 0 && k < K) a_bytes[i][s] = A_flat[i*LDA + k];
     510:	00d76a63          	bltu	a4,a3,524 <main+0x1cc>
     514:	00de0d33          	add	s10,t3,a3
     518:	000d4d03          	lbu	s10,0(s10)
     51c:	00f30cb3          	add	s9,t1,a5
     520:	01ac8023          	sb	s10,0(s9)
      for (int s = 0; s < 4; ++s) {
     524:	00178793          	add	a5,a5,1
     528:	00168693          	add	a3,a3,1
     52c:	ff8792e3          	bne	a5,s8,510 <main+0x1b8>
    for (int i = 0; i < 4; ++i)
     530:	00150513          	add	a0,a0,1
     534:	010e0e13          	add	t3,t3,16
     538:	00430313          	add	t1,t1,4
     53c:	fd8516e3          	bne	a0,s8,508 <main+0x1b0>
     540:	03010e13          	add	t3,sp,48
    for (int j = 0; j < 4; ++j)
     544:	00000793          	li	a5,0
     548:	000e0693          	mv	a3,t3
      for (int s = 0; s < 4; ++s) {
     54c:	40f80333          	sub	t1,a6,a5
     550:	00000513          	li	a0,0
        if (k >= 0 && k < K) b_bytes[j][s] = B_flat[k*LDB + j];
     554:	00f58d33          	add	s10,a1,a5
     558:	00676c63          	bltu	a4,t1,570 <main+0x218>
     55c:	00231d93          	sll	s11,t1,0x2
     560:	01bd0db3          	add	s11,s10,s11
     564:	000dcd83          	lbu	s11,0(s11)
     568:	00ae0cb3          	add	s9,t3,a0
     56c:	01bc8023          	sb	s11,0(s9)
      for (int s = 0; s < 4; ++s) {
     570:	00150513          	add	a0,a0,1
     574:	00130313          	add	t1,t1,1
     578:	ff8510e3          	bne	a0,s8,558 <main+0x200>
    for (int j = 0; j < 4; ++j)
     57c:	00178793          	add	a5,a5,1
     580:	004e0e13          	add	t3,t3,4
     584:	fca794e3          	bne	a5,a0,54c <main+0x1f4>
         (((uint32_t)(uint8_t)x2) << 16) |
     588:	02012503          	lw	a0,32(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     58c:	00aba023          	sw	a0,0(s7)
         (((uint32_t)(uint8_t)x2) << 16) |
     590:	02412503          	lw	a0,36(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     594:	00ab2023          	sw	a0,0(s6)
         (((uint32_t)(uint8_t)x2) << 16) |
     598:	02812503          	lw	a0,40(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     59c:	00a0a023          	sw	a0,0(ra)
         (((uint32_t)(uint8_t)x2) << 16) |
     5a0:	02c12503          	lw	a0,44(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5a4:	00a3a023          	sw	a0,0(t2)
         (((uint32_t)(uint8_t)x2) << 16) |
     5a8:	03012503          	lw	a0,48(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5ac:	00a2a023          	sw	a0,0(t0)
         (((uint32_t)(uint8_t)x2) << 16) |
     5b0:	03412503          	lw	a0,52(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5b4:	00afa023          	sw	a0,0(t6)
         (((uint32_t)(uint8_t)x2) << 16) |
     5b8:	03812503          	lw	a0,56(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5bc:	00af2023          	sw	a0,0(t5)
         (((uint32_t)(uint8_t)x2) << 16) |
     5c0:	03c12503          	lw	a0,60(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5c4:	00aea023          	sw	a0,0(t4)
     5c8:	00e8a023          	sw	a4,0(a7) # ffeb0000 <__crt0_ram_last+0x7fe30001>
     5cc:	00e8a023          	sw	a4,0(a7)
     5d0:	00e8a023          	sw	a4,0(a7)
     5d4:	00e8a023          	sw	a4,0(a7)
  for (int t = 0; t < T; t += 4) {
     5d8:	1cf81e63          	bne	a6,a5,7b4 <main+0x45c>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     5dc:	ffeb05b7          	lui	a1,0xffeb0
  for (int t = 0; t < T; t += 4) {
     5e0:	00000713          	li	a4,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     5e4:	04058593          	add	a1,a1,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
    for (int j = 0; j < 4; ++j)
     5e8:	01000513          	li	a0,16
     5ec:	00271613          	sll	a2,a4,0x2
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     5f0:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     5f4:	00b60633          	add	a2,a2,a1
     5f8:	00f60833          	add	a6,a2,a5
     5fc:	00082883          	lw	a7,0(a6)
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     600:	00f68833          	add	a6,a3,a5
    for (int j = 0; j < 4; ++j)
     604:	00478793          	add	a5,a5,4
      dst[i][j] = (int32_t)cfs_read(CFS_C0 + i*4 + j);
     608:	01182023          	sw	a7,0(a6)
    for (int j = 0; j < 4; ++j)
     60c:	fea796e3          	bne	a5,a0,5f8 <main+0x2a0>
  for (int i = 0; i < 4; ++i)
     610:	00470713          	add	a4,a4,4
     614:	01068693          	add	a3,a3,16
     618:	fcf71ae3          	bne	a4,a5,5ec <main+0x294>
  C2x2[0][0] = C4[0][0]; C2x2[0][1] = C4[0][1];
     61c:	03012703          	lw	a4,48(sp)
     620:	03412783          	lw	a5,52(sp)
  C2x2[1][0] = C4[1][0]; C2x2[1][1] = C4[1][1];
     624:	04012d83          	lw	s11,64(sp)
     628:	04412d03          	lw	s10,68(sp)
  C2x2[0][0] = C4[0][0]; C2x2[0][1] = C4[0][1];
     62c:	02e12023          	sw	a4,32(sp)
     630:	00e12623          	sw	a4,12(sp)
     634:	02f12223          	sw	a5,36(sp)
     638:	00f12423          	sw	a5,8(sp)
  C2x2[1][0] = C4[1][0]; C2x2[1][1] = C4[1][1];
     63c:	03b12423          	sw	s11,40(sp)
     640:	03a12623          	sw	s10,44(sp)
  cfs_gemm_2xK_Kx2(A2xK, LDA2, BKx2, LDB2, K, C_hw);
  i1 = rdinstret(); c1 = rdcycle();
     644:	bb5ff0ef          	jal	1f8 <rdinstret>
     648:	00050c13          	mv	s8,a0
     64c:	00058b13          	mv	s6,a1
     650:	b95ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cycles  = c1 - c0;
     654:	00012783          	lw	a5,0(sp)
     658:	413509b3          	sub	s3,a0,s3
     65c:	01353533          	sltu	a0,a0,s3
     660:	40f58bb3          	sub	s7,a1,a5
  uint64_t cfs_instret = i1 - i0;
     664:	00412783          	lw	a5,4(sp)
  uint64_t cfs_cycles  = c1 - c0;
     668:	40ab8bb3          	sub	s7,s7,a0

  /* Output */
  print_i32_2x2("C (HW)", C_hw);
     66c:	0000f537          	lui	a0,0xf
     670:	02010593          	add	a1,sp,32
     674:	9e450513          	add	a0,a0,-1564 # e9e4 <__fini_array_end+0x88>
  uint64_t cfs_instret = i1 - i0;
     678:	40fc0cb3          	sub	s9,s8,a5
  print_i32_2x2("C (HW)", C_hw);
     67c:	b91ff0ef          	jal	20c <print_i32_2x2>
  print_i32_2x2("C (SW)", C_sw);
     680:	0000f537          	lui	a0,0xf
     684:	01010593          	add	a1,sp,16
     688:	9ec50513          	add	a0,a0,-1556 # e9ec <__fini_array_end+0x90>
     68c:	b81ff0ef          	jal	20c <print_i32_2x2>

  int pass = (C_hw[0][0]==C_sw[0][0]) && (C_hw[0][1]==C_sw[0][1]) &&
             (C_hw[1][0]==C_sw[1][0]) && (C_hw[1][1]==C_sw[1][1]);
     690:	01012683          	lw	a3,16(sp)
     694:	00c12703          	lw	a4,12(sp)
  uint64_t cfs_instret = i1 - i0;
     698:	415b0b33          	sub	s6,s6,s5
     69c:	019c3c33          	sltu	s8,s8,s9
             (C_hw[1][0]==C_sw[1][0]) && (C_hw[1][1]==C_sw[1][1]);
     6a0:	00812783          	lw	a5,8(sp)
  uint64_t cfs_instret = i1 - i0;
     6a4:	418b0b33          	sub	s6,s6,s8
             (C_hw[1][0]==C_sw[1][0]) && (C_hw[1][1]==C_sw[1][1]);
     6a8:	00000a93          	li	s5,0
     6ac:	02e69063          	bne	a3,a4,6cc <main+0x374>
  int pass = (C_hw[0][0]==C_sw[0][0]) && (C_hw[0][1]==C_sw[0][1]) &&
     6b0:	01412703          	lw	a4,20(sp)
     6b4:	00f71c63          	bne	a4,a5,6cc <main+0x374>
     6b8:	01812783          	lw	a5,24(sp)
     6bc:	01b79863          	bne	a5,s11,6cc <main+0x374>
             (C_hw[1][0]==C_sw[1][0]) && (C_hw[1][1]==C_sw[1][1]);
     6c0:	01c12a83          	lw	s5,28(sp)
     6c4:	41aa8ab3          	sub	s5,s5,s10
     6c8:	001aba93          	seqz	s5,s5

  printf("\nSW:  cycles=%" PRIu64 "  instret=%" PRIu64 "\n", sw_cycles,  sw_instret);
     6cc:	0000f537          	lui	a0,0xf
     6d0:	00048713          	mv	a4,s1
     6d4:	00040793          	mv	a5,s0
     6d8:	00090613          	mv	a2,s2
     6dc:	000a0693          	mv	a3,s4
     6e0:	9f450513          	add	a0,a0,-1548 # e9f4 <__fini_array_end+0x98>
     6e4:	370000ef          	jal	a54 <printf>
  printf("CFS: cycles=%" PRIu64 "  instret=%" PRIu64 "\n", cfs_cycles, cfs_instret);
     6e8:	0000f537          	lui	a0,0xf
     6ec:	000b0793          	mv	a5,s6
     6f0:	000c8713          	mv	a4,s9
     6f4:	00098613          	mv	a2,s3
     6f8:	000b8693          	mv	a3,s7
     6fc:	a1850513          	add	a0,a0,-1512 # ea18 <__fini_array_end+0xbc>
     700:	354000ef          	jal	a54 <printf>

  if (sw_cycles && cfs_cycles) {
     704:	014967b3          	or	a5,s2,s4
     708:	02078463          	beqz	a5,730 <main+0x3d8>
     70c:	0179e7b3          	or	a5,s3,s7
     710:	02078063          	beqz	a5,730 <main+0x3d8>
    print_speedup_fixed("Speedup (cycles)",  sw_cycles,  cfs_cycles);
     714:	0000f537          	lui	a0,0xf
     718:	00098693          	mv	a3,s3
     71c:	000b8713          	mv	a4,s7
     720:	00090593          	mv	a1,s2
     724:	000a0613          	mv	a2,s4
     728:	a3850513          	add	a0,a0,-1480 # ea38 <__fini_array_end+0xdc>
     72c:	b39ff0ef          	jal	264 <print_speedup_fixed>
  }
  if (sw_instret && cfs_instret) {
     730:	0084e7b3          	or	a5,s1,s0
     734:	02078463          	beqz	a5,75c <main+0x404>
     738:	016ce7b3          	or	a5,s9,s6
     73c:	02078063          	beqz	a5,75c <main+0x404>
    print_speedup_fixed("Speedup (instret)", sw_instret, cfs_instret);
     740:	0000f537          	lui	a0,0xf
     744:	000c8693          	mv	a3,s9
     748:	000b0713          	mv	a4,s6
     74c:	00048593          	mv	a1,s1
     750:	00040613          	mv	a2,s0
     754:	a4c50513          	add	a0,a0,-1460 # ea4c <__fini_array_end+0xf0>
     758:	b0dff0ef          	jal	264 <print_speedup_fixed>
  }

  printf("\nVerdict: %s\n", pass ? "PASS (HW matches SW)" : "FAIL (mismatch)");
     75c:	060a8063          	beqz	s5,7bc <main+0x464>
     760:	0000f5b7          	lui	a1,0xf
     764:	99458593          	add	a1,a1,-1644 # e994 <__fini_array_end+0x38>
     768:	0000f537          	lui	a0,0xf
     76c:	a6050513          	add	a0,a0,-1440 # ea60 <__fini_array_end+0x104>
     770:	2e4000ef          	jal	a54 <printf>
  return pass ? 0 : 1;
}
     774:	0ac12083          	lw	ra,172(sp)
     778:	0a812403          	lw	s0,168(sp)
     77c:	0a412483          	lw	s1,164(sp)
     780:	0a012903          	lw	s2,160(sp)
     784:	09c12983          	lw	s3,156(sp)
     788:	09812a03          	lw	s4,152(sp)
     78c:	09012b03          	lw	s6,144(sp)
     790:	08c12b83          	lw	s7,140(sp)
     794:	08812c03          	lw	s8,136(sp)
     798:	08412c83          	lw	s9,132(sp)
     79c:	08012d03          	lw	s10,128(sp)
     7a0:	07c12d83          	lw	s11,124(sp)
     7a4:	001ac513          	xor	a0,s5,1
     7a8:	09412a83          	lw	s5,148(sp)
     7ac:	0b010113          	add	sp,sp,176
     7b0:	00008067          	ret
     7b4:	00400813          	li	a6,4
     7b8:	d25ff06f          	j	4dc <main+0x184>
  printf("\nVerdict: %s\n", pass ? "PASS (HW matches SW)" : "FAIL (mismatch)");
     7bc:	0000f5b7          	lui	a1,0xf
     7c0:	9ac58593          	add	a1,a1,-1620 # e9ac <__fini_array_end+0x50>
     7c4:	fa5ff06f          	j	768 <main+0x410>

000007c8 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     7c8:	00000097          	auipc	ra,0x0
     7cc:	99008093          	add	ra,ra,-1648 # 158 <__crt0_main_exit>
     7d0:	00050513          	mv	a0,a0
     7d4:	00008067          	ret

000007d8 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     7d8:	fff00513          	li	a0,-1
     7dc:	00008067          	ret

000007e0 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     7e0:	000027b7          	lui	a5,0x2
     7e4:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     7e8:	00000513          	li	a0,0
     7ec:	00008067          	ret

000007f0 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     7f0:	00100513          	li	a0,1
     7f4:	00008067          	ret

000007f8 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     7f8:	00100513          	li	a0,1
     7fc:	00008067          	ret

00000800 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     800:	800007b7          	lui	a5,0x80000
     804:	01600713          	li	a4,22
     808:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     80c:	fff00513          	li	a0,-1
     810:	00008067          	ret

00000814 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     814:	00000513          	li	a0,0
     818:	00008067          	ret

0000081c <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     81c:	fe010113          	add	sp,sp,-32
     820:	00912a23          	sw	s1,20(sp)
     824:	01212823          	sw	s2,16(sp)
     828:	00112e23          	sw	ra,28(sp)
     82c:	00812c23          	sw	s0,24(sp)
     830:	01312623          	sw	s3,12(sp)
     834:	01412423          	sw	s4,8(sp)
     838:	00058913          	mv	s2,a1
     83c:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     840:	06051463          	bnez	a0,8a8 <_read+0x8c>
     844:	00050413          	mv	s0,a0
     848:	fff50537          	lui	a0,0xfff50
     84c:	1a0000ef          	jal	9ec <neorv32_uart_available>
     850:	04050c63          	beqz	a0,8a8 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     854:	00a00993          	li	s3,10
     858:	00d00a13          	li	s4,13
    while (len--) {
     85c:	00941663          	bne	s0,s1,868 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     860:	00048413          	mv	s0,s1
     864:	0200006f          	j	884 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     868:	fff50537          	lui	a0,0xfff50
     86c:	1d0000ef          	jal	a3c <neorv32_uart_getc>
      *ptr++ = c;
     870:	008907b3          	add	a5,s2,s0
     874:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     878:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     87c:	01350463          	beq	a0,s3,884 <_read+0x68>
     880:	fd451ee3          	bne	a0,s4,85c <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     884:	01c12083          	lw	ra,28(sp)
     888:	00040513          	mv	a0,s0
     88c:	01812403          	lw	s0,24(sp)
     890:	01412483          	lw	s1,20(sp)
     894:	01012903          	lw	s2,16(sp)
     898:	00c12983          	lw	s3,12(sp)
     89c:	00812a03          	lw	s4,8(sp)
     8a0:	02010113          	add	sp,sp,32
     8a4:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     8a8:	fff60537          	lui	a0,0xfff60
     8ac:	140000ef          	jal	9ec <neorv32_uart_available>
  int read_cnt = 0;
     8b0:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     8b4:	02050863          	beqz	a0,8e4 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     8b8:	00a00993          	li	s3,10
     8bc:	00d00a13          	li	s4,13
    while (len--) {
     8c0:	fa9400e3          	beq	s0,s1,860 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     8c4:	fff60537          	lui	a0,0xfff60
     8c8:	174000ef          	jal	a3c <neorv32_uart_getc>
      *ptr++ = c;
     8cc:	008907b3          	add	a5,s2,s0
     8d0:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     8d4:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     8d8:	fb3506e3          	beq	a0,s3,884 <_read+0x68>
     8dc:	ff4512e3          	bne	a0,s4,8c0 <_read+0xa4>
     8e0:	fa5ff06f          	j	884 <_read+0x68>
    errno = ENOSYS;
     8e4:	800007b7          	lui	a5,0x80000
     8e8:	05800713          	li	a4,88
     8ec:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     8f0:	fff00413          	li	s0,-1
     8f4:	f91ff06f          	j	884 <_read+0x68>

000008f8 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     8f8:	ff010113          	add	sp,sp,-16
     8fc:	00812423          	sw	s0,8(sp)
     900:	00912223          	sw	s1,4(sp)
     904:	00112623          	sw	ra,12(sp)
     908:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     90c:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     910:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     914:	00058413          	mv	s0,a1
     918:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     91c:	04a7ec63          	bltu	a5,a0,974 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     920:	fff50537          	lui	a0,0xfff50
     924:	0c8000ef          	jal	9ec <neorv32_uart_available>
     928:	00940933          	add	s2,s0,s1
     92c:	02051463          	bnez	a0,954 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     930:	800007b7          	lui	a5,0x80000
     934:	05800713          	li	a4,88
     938:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     93c:	fff00493          	li	s1,-1
     940:	0180006f          	j	958 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     944:	00044583          	lbu	a1,0(s0)
     948:	fff50537          	lui	a0,0xfff50
     94c:	00140413          	add	s0,s0,1
     950:	0d8000ef          	jal	a28 <neorv32_uart_putc>
      while (len--) {
     954:	fe8918e3          	bne	s2,s0,944 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     958:	00c12083          	lw	ra,12(sp)
     95c:	00812403          	lw	s0,8(sp)
     960:	00012903          	lw	s2,0(sp)
     964:	00048513          	mv	a0,s1
     968:	00412483          	lw	s1,4(sp)
     96c:	01010113          	add	sp,sp,16
     970:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     974:	fff60537          	lui	a0,0xfff60
     978:	074000ef          	jal	9ec <neorv32_uart_available>
     97c:	00940933          	add	s2,s0,s1
     980:	fa0508e3          	beqz	a0,930 <_write+0x38>
    while (len--) {
     984:	fd240ae3          	beq	s0,s2,958 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     988:	00044583          	lbu	a1,0(s0)
     98c:	fff60537          	lui	a0,0xfff60
     990:	00140413          	add	s0,s0,1
     994:	094000ef          	jal	a28 <neorv32_uart_putc>
      write_cnt++;
     998:	fedff06f          	j	984 <_write+0x8c>

0000099c <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     99c:	80000737          	lui	a4,0x80000
     9a0:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     9a4:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     9a8:	00050793          	mv	a5,a0
     9ac:	91460613          	add	a2,a2,-1772 # 80000914 <__crt0_bss_end>
  if (curr_heap == NULL) {
     9b0:	00069463          	bnez	a3,9b8 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     9b4:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     9b8:	800016b7          	lui	a3,0x80001
     9bc:	91468693          	add	a3,a3,-1772 # 80000914 <__crt0_bss_end>
     9c0:	00c69c63          	bne	a3,a2,9d8 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     9c4:	800007b7          	lui	a5,0x80000
     9c8:	00c00713          	li	a4,12
     9cc:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     9d0:	fff00513          	li	a0,-1
     9d4:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     9d8:	71472503          	lw	a0,1812(a4)
     9dc:	00f507b3          	add	a5,a0,a5
     9e0:	fed7f2e3          	bgeu	a5,a3,9c4 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     9e4:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     9e8:	00008067          	ret

000009ec <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     9ec:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     9f0:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     9f4:	00e51c63          	bne	a0,a4,a0c <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     9f8:	fffe07b7          	lui	a5,0xfffe0
     9fc:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     a00:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     a04:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     a08:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     a0c:	fff60737          	lui	a4,0xfff60
    return 0;
     a10:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     a14:	fee79ae3          	bne	a5,a4,a08 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     a18:	fffe07b7          	lui	a5,0xfffe0
     a1c:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     a20:	020007b7          	lui	a5,0x2000
     a24:	fe1ff06f          	j	a04 <neorv32_uart_available+0x18>

00000a28 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     a28:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     a2c:	00a79713          	sll	a4,a5,0xa
     a30:	fe075ce3          	bgez	a4,a28 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     a34:	00b52223          	sw	a1,4(a0)
}
     a38:	00008067          	ret

00000a3c <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     a3c:	00052783          	lw	a5,0(a0)
     a40:	00f79713          	sll	a4,a5,0xf
     a44:	fe075ce3          	bgez	a4,a3c <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     a48:	00452503          	lw	a0,4(a0)
}
     a4c:	0ff57513          	zext.b	a0,a0
     a50:	00008067          	ret

00000a54 <printf>:
     a54:	fc010113          	add	sp,sp,-64
     a58:	02c12423          	sw	a2,40(sp)
     a5c:	02d12623          	sw	a3,44(sp)
     a60:	80000317          	auipc	t1,0x80000
     a64:	ca832303          	lw	t1,-856(t1) # 80000708 <_impure_ptr>
     a68:	02b12223          	sw	a1,36(sp)
     a6c:	02e12823          	sw	a4,48(sp)
     a70:	02f12a23          	sw	a5,52(sp)
     a74:	03012c23          	sw	a6,56(sp)
     a78:	03112e23          	sw	a7,60(sp)
     a7c:	00832583          	lw	a1,8(t1)
     a80:	02410693          	add	a3,sp,36
     a84:	00050613          	mv	a2,a0
     a88:	00030513          	mv	a0,t1
     a8c:	00112e23          	sw	ra,28(sp)
     a90:	00d12623          	sw	a3,12(sp)
     a94:	765000ef          	jal	19f8 <_vfprintf_r>
     a98:	01c12083          	lw	ra,28(sp)
     a9c:	04010113          	add	sp,sp,64
     aa0:	00008067          	ret

00000aa4 <memset>:
     aa4:	00f00313          	li	t1,15
     aa8:	00050713          	mv	a4,a0
     aac:	02c37e63          	bgeu	t1,a2,ae8 <memset+0x44>
     ab0:	00f77793          	and	a5,a4,15
     ab4:	0a079063          	bnez	a5,b54 <memset+0xb0>
     ab8:	08059263          	bnez	a1,b3c <memset+0x98>
     abc:	ff067693          	and	a3,a2,-16
     ac0:	00f67613          	and	a2,a2,15
     ac4:	00e686b3          	add	a3,a3,a4
     ac8:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     acc:	00b72223          	sw	a1,4(a4)
     ad0:	00b72423          	sw	a1,8(a4)
     ad4:	00b72623          	sw	a1,12(a4)
     ad8:	01070713          	add	a4,a4,16
     adc:	fed766e3          	bltu	a4,a3,ac8 <memset+0x24>
     ae0:	00061463          	bnez	a2,ae8 <memset+0x44>
     ae4:	00008067          	ret
     ae8:	40c306b3          	sub	a3,t1,a2
     aec:	00269693          	sll	a3,a3,0x2
     af0:	00000297          	auipc	t0,0x0
     af4:	005686b3          	add	a3,a3,t0
     af8:	00c68067          	jr	12(a3)
     afc:	00b70723          	sb	a1,14(a4)
     b00:	00b706a3          	sb	a1,13(a4)
     b04:	00b70623          	sb	a1,12(a4)
     b08:	00b705a3          	sb	a1,11(a4)
     b0c:	00b70523          	sb	a1,10(a4)
     b10:	00b704a3          	sb	a1,9(a4)
     b14:	00b70423          	sb	a1,8(a4)
     b18:	00b703a3          	sb	a1,7(a4)
     b1c:	00b70323          	sb	a1,6(a4)
     b20:	00b702a3          	sb	a1,5(a4)
     b24:	00b70223          	sb	a1,4(a4)
     b28:	00b701a3          	sb	a1,3(a4)
     b2c:	00b70123          	sb	a1,2(a4)
     b30:	00b700a3          	sb	a1,1(a4)
     b34:	00b70023          	sb	a1,0(a4)
     b38:	00008067          	ret
     b3c:	0ff5f593          	zext.b	a1,a1
     b40:	00859693          	sll	a3,a1,0x8
     b44:	00d5e5b3          	or	a1,a1,a3
     b48:	01059693          	sll	a3,a1,0x10
     b4c:	00d5e5b3          	or	a1,a1,a3
     b50:	f6dff06f          	j	abc <memset+0x18>
     b54:	00279693          	sll	a3,a5,0x2
     b58:	00000297          	auipc	t0,0x0
     b5c:	005686b3          	add	a3,a3,t0
     b60:	00008293          	mv	t0,ra
     b64:	fa0680e7          	jalr	-96(a3)
     b68:	00028093          	mv	ra,t0
     b6c:	ff078793          	add	a5,a5,-16 # 1fffff0 <__neorv32_ram_size+0x1f7fff0>
     b70:	40f70733          	sub	a4,a4,a5
     b74:	00f60633          	add	a2,a2,a5
     b78:	f6c378e3          	bgeu	t1,a2,ae8 <memset+0x44>
     b7c:	f3dff06f          	j	ab8 <memset+0x14>

00000b80 <memcpy>:
     b80:	00a5c7b3          	xor	a5,a1,a0
     b84:	0037f793          	and	a5,a5,3
     b88:	00c508b3          	add	a7,a0,a2
     b8c:	06079463          	bnez	a5,bf4 <memcpy+0x74>
     b90:	00300793          	li	a5,3
     b94:	06c7f063          	bgeu	a5,a2,bf4 <memcpy+0x74>
     b98:	00357793          	and	a5,a0,3
     b9c:	00050713          	mv	a4,a0
     ba0:	06079a63          	bnez	a5,c14 <memcpy+0x94>
     ba4:	ffc8f613          	and	a2,a7,-4
     ba8:	40e606b3          	sub	a3,a2,a4
     bac:	02000793          	li	a5,32
     bb0:	08d7ce63          	blt	a5,a3,c4c <memcpy+0xcc>
     bb4:	00058693          	mv	a3,a1
     bb8:	00070793          	mv	a5,a4
     bbc:	02c77863          	bgeu	a4,a2,bec <memcpy+0x6c>
     bc0:	0006a803          	lw	a6,0(a3)
     bc4:	00478793          	add	a5,a5,4
     bc8:	00468693          	add	a3,a3,4
     bcc:	ff07ae23          	sw	a6,-4(a5)
     bd0:	fec7e8e3          	bltu	a5,a2,bc0 <memcpy+0x40>
     bd4:	fff60793          	add	a5,a2,-1
     bd8:	40e787b3          	sub	a5,a5,a4
     bdc:	ffc7f793          	and	a5,a5,-4
     be0:	00478793          	add	a5,a5,4
     be4:	00f70733          	add	a4,a4,a5
     be8:	00f585b3          	add	a1,a1,a5
     bec:	01176863          	bltu	a4,a7,bfc <memcpy+0x7c>
     bf0:	00008067          	ret
     bf4:	00050713          	mv	a4,a0
     bf8:	05157863          	bgeu	a0,a7,c48 <memcpy+0xc8>
     bfc:	0005c783          	lbu	a5,0(a1)
     c00:	00170713          	add	a4,a4,1
     c04:	00158593          	add	a1,a1,1
     c08:	fef70fa3          	sb	a5,-1(a4)
     c0c:	fee898e3          	bne	a7,a4,bfc <memcpy+0x7c>
     c10:	00008067          	ret
     c14:	0005c683          	lbu	a3,0(a1)
     c18:	00170713          	add	a4,a4,1
     c1c:	00377793          	and	a5,a4,3
     c20:	fed70fa3          	sb	a3,-1(a4)
     c24:	00158593          	add	a1,a1,1
     c28:	f6078ee3          	beqz	a5,ba4 <memcpy+0x24>
     c2c:	0005c683          	lbu	a3,0(a1)
     c30:	00170713          	add	a4,a4,1
     c34:	00377793          	and	a5,a4,3
     c38:	fed70fa3          	sb	a3,-1(a4)
     c3c:	00158593          	add	a1,a1,1
     c40:	fc079ae3          	bnez	a5,c14 <memcpy+0x94>
     c44:	f61ff06f          	j	ba4 <memcpy+0x24>
     c48:	00008067          	ret
     c4c:	ff010113          	add	sp,sp,-16
     c50:	00812623          	sw	s0,12(sp)
     c54:	02000413          	li	s0,32
     c58:	0005a383          	lw	t2,0(a1)
     c5c:	0045a283          	lw	t0,4(a1)
     c60:	0085af83          	lw	t6,8(a1)
     c64:	00c5af03          	lw	t5,12(a1)
     c68:	0105ae83          	lw	t4,16(a1)
     c6c:	0145ae03          	lw	t3,20(a1)
     c70:	0185a303          	lw	t1,24(a1)
     c74:	01c5a803          	lw	a6,28(a1)
     c78:	0205a683          	lw	a3,32(a1)
     c7c:	02470713          	add	a4,a4,36
     c80:	40e607b3          	sub	a5,a2,a4
     c84:	fc772e23          	sw	t2,-36(a4)
     c88:	fe572023          	sw	t0,-32(a4)
     c8c:	fff72223          	sw	t6,-28(a4)
     c90:	ffe72423          	sw	t5,-24(a4)
     c94:	ffd72623          	sw	t4,-20(a4)
     c98:	ffc72823          	sw	t3,-16(a4)
     c9c:	fe672a23          	sw	t1,-12(a4)
     ca0:	ff072c23          	sw	a6,-8(a4)
     ca4:	fed72e23          	sw	a3,-4(a4)
     ca8:	02458593          	add	a1,a1,36
     cac:	faf446e3          	blt	s0,a5,c58 <memcpy+0xd8>
     cb0:	00058693          	mv	a3,a1
     cb4:	00070793          	mv	a5,a4
     cb8:	02c77863          	bgeu	a4,a2,ce8 <memcpy+0x168>
     cbc:	0006a803          	lw	a6,0(a3)
     cc0:	00478793          	add	a5,a5,4
     cc4:	00468693          	add	a3,a3,4
     cc8:	ff07ae23          	sw	a6,-4(a5)
     ccc:	fec7e8e3          	bltu	a5,a2,cbc <memcpy+0x13c>
     cd0:	fff60793          	add	a5,a2,-1
     cd4:	40e787b3          	sub	a5,a5,a4
     cd8:	ffc7f793          	and	a5,a5,-4
     cdc:	00478793          	add	a5,a5,4
     ce0:	00f70733          	add	a4,a4,a5
     ce4:	00f585b3          	add	a1,a1,a5
     ce8:	01176863          	bltu	a4,a7,cf8 <memcpy+0x178>
     cec:	00c12403          	lw	s0,12(sp)
     cf0:	01010113          	add	sp,sp,16
     cf4:	00008067          	ret
     cf8:	0005c783          	lbu	a5,0(a1)
     cfc:	00170713          	add	a4,a4,1
     d00:	00158593          	add	a1,a1,1
     d04:	fef70fa3          	sb	a5,-1(a4)
     d08:	fee882e3          	beq	a7,a4,cec <memcpy+0x16c>
     d0c:	0005c783          	lbu	a5,0(a1)
     d10:	00170713          	add	a4,a4,1
     d14:	00158593          	add	a1,a1,1
     d18:	fef70fa3          	sb	a5,-1(a4)
     d1c:	fce89ee3          	bne	a7,a4,cf8 <memcpy+0x178>
     d20:	fcdff06f          	j	cec <memcpy+0x16c>

00000d24 <strlen>:
     d24:	00357793          	and	a5,a0,3
     d28:	00050713          	mv	a4,a0
     d2c:	04079c63          	bnez	a5,d84 <strlen+0x60>
     d30:	7f7f86b7          	lui	a3,0x7f7f8
     d34:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
     d38:	fff00593          	li	a1,-1
     d3c:	00072603          	lw	a2,0(a4)
     d40:	00470713          	add	a4,a4,4
     d44:	00d677b3          	and	a5,a2,a3
     d48:	00d787b3          	add	a5,a5,a3
     d4c:	00c7e7b3          	or	a5,a5,a2
     d50:	00d7e7b3          	or	a5,a5,a3
     d54:	feb784e3          	beq	a5,a1,d3c <strlen+0x18>
     d58:	ffc74683          	lbu	a3,-4(a4)
     d5c:	40a707b3          	sub	a5,a4,a0
     d60:	04068463          	beqz	a3,da8 <strlen+0x84>
     d64:	ffd74683          	lbu	a3,-3(a4)
     d68:	02068c63          	beqz	a3,da0 <strlen+0x7c>
     d6c:	ffe74503          	lbu	a0,-2(a4)
     d70:	00a03533          	snez	a0,a0
     d74:	00f50533          	add	a0,a0,a5
     d78:	ffe50513          	add	a0,a0,-2
     d7c:	00008067          	ret
     d80:	fa0688e3          	beqz	a3,d30 <strlen+0xc>
     d84:	00074783          	lbu	a5,0(a4)
     d88:	00170713          	add	a4,a4,1
     d8c:	00377693          	and	a3,a4,3
     d90:	fe0798e3          	bnez	a5,d80 <strlen+0x5c>
     d94:	40a70733          	sub	a4,a4,a0
     d98:	fff70513          	add	a0,a4,-1
     d9c:	00008067          	ret
     da0:	ffd78513          	add	a0,a5,-3
     da4:	00008067          	ret
     da8:	ffc78513          	add	a0,a5,-4
     dac:	00008067          	ret

00000db0 <_malloc_trim_r>:
     db0:	fe010113          	add	sp,sp,-32
     db4:	00812c23          	sw	s0,24(sp)
     db8:	00912a23          	sw	s1,20(sp)
     dbc:	01212823          	sw	s2,16(sp)
     dc0:	01312623          	sw	s3,12(sp)
     dc4:	01412423          	sw	s4,8(sp)
     dc8:	00058993          	mv	s3,a1
     dcc:	00112e23          	sw	ra,28(sp)
     dd0:	00050913          	mv	s2,a0
     dd4:	7ffffa17          	auipc	s4,0x7ffff
     dd8:	34ca0a13          	add	s4,s4,844 # 80000120 <__malloc_av_>
     ddc:	405000ef          	jal	19e0 <__malloc_lock>
     de0:	008a2703          	lw	a4,8(s4)
     de4:	000017b7          	lui	a5,0x1
     de8:	fef78793          	add	a5,a5,-17 # fef <_free_r+0xfb>
     dec:	00472483          	lw	s1,4(a4)
     df0:	00001737          	lui	a4,0x1
     df4:	ffc4f493          	and	s1,s1,-4
     df8:	00f48433          	add	s0,s1,a5
     dfc:	41340433          	sub	s0,s0,s3
     e00:	00c45413          	srl	s0,s0,0xc
     e04:	fff40413          	add	s0,s0,-1
     e08:	00c41413          	sll	s0,s0,0xc
     e0c:	00e44e63          	blt	s0,a4,e28 <_malloc_trim_r+0x78>
     e10:	00000593          	li	a1,0
     e14:	00090513          	mv	a0,s2
     e18:	678060ef          	jal	7490 <_sbrk_r>
     e1c:	008a2783          	lw	a5,8(s4)
     e20:	009787b3          	add	a5,a5,s1
     e24:	02f50863          	beq	a0,a5,e54 <_malloc_trim_r+0xa4>
     e28:	00090513          	mv	a0,s2
     e2c:	3c1000ef          	jal	19ec <__malloc_unlock>
     e30:	01c12083          	lw	ra,28(sp)
     e34:	01812403          	lw	s0,24(sp)
     e38:	01412483          	lw	s1,20(sp)
     e3c:	01012903          	lw	s2,16(sp)
     e40:	00c12983          	lw	s3,12(sp)
     e44:	00812a03          	lw	s4,8(sp)
     e48:	00000513          	li	a0,0
     e4c:	02010113          	add	sp,sp,32
     e50:	00008067          	ret
     e54:	408005b3          	neg	a1,s0
     e58:	00090513          	mv	a0,s2
     e5c:	634060ef          	jal	7490 <_sbrk_r>
     e60:	fff00793          	li	a5,-1
     e64:	04f50a63          	beq	a0,a5,eb8 <_malloc_trim_r+0x108>
     e68:	80000717          	auipc	a4,0x80000
     e6c:	94c70713          	add	a4,a4,-1716 # 800007b4 <__malloc_current_mallinfo>
     e70:	00072783          	lw	a5,0(a4)
     e74:	008a2683          	lw	a3,8(s4)
     e78:	408484b3          	sub	s1,s1,s0
     e7c:	0014e493          	or	s1,s1,1
     e80:	408787b3          	sub	a5,a5,s0
     e84:	00090513          	mv	a0,s2
     e88:	0096a223          	sw	s1,4(a3)
     e8c:	00f72023          	sw	a5,0(a4)
     e90:	35d000ef          	jal	19ec <__malloc_unlock>
     e94:	01c12083          	lw	ra,28(sp)
     e98:	01812403          	lw	s0,24(sp)
     e9c:	01412483          	lw	s1,20(sp)
     ea0:	01012903          	lw	s2,16(sp)
     ea4:	00c12983          	lw	s3,12(sp)
     ea8:	00812a03          	lw	s4,8(sp)
     eac:	00100513          	li	a0,1
     eb0:	02010113          	add	sp,sp,32
     eb4:	00008067          	ret
     eb8:	00000593          	li	a1,0
     ebc:	00090513          	mv	a0,s2
     ec0:	5d0060ef          	jal	7490 <_sbrk_r>
     ec4:	008a2703          	lw	a4,8(s4)
     ec8:	00f00693          	li	a3,15
     ecc:	40e507b3          	sub	a5,a0,a4
     ed0:	f4f6dce3          	bge	a3,a5,e28 <_malloc_trim_r+0x78>
     ed4:	80000697          	auipc	a3,0x80000
     ed8:	8386a683          	lw	a3,-1992(a3) # 8000070c <__malloc_sbrk_base>
     edc:	40d50533          	sub	a0,a0,a3
     ee0:	0017e793          	or	a5,a5,1
     ee4:	80000697          	auipc	a3,0x80000
     ee8:	8ca6a823          	sw	a0,-1840(a3) # 800007b4 <__malloc_current_mallinfo>
     eec:	00f72223          	sw	a5,4(a4)
     ef0:	f39ff06f          	j	e28 <_malloc_trim_r+0x78>

00000ef4 <_free_r>:
     ef4:	18058263          	beqz	a1,1078 <_free_r+0x184>
     ef8:	ff010113          	add	sp,sp,-16
     efc:	00812423          	sw	s0,8(sp)
     f00:	00912223          	sw	s1,4(sp)
     f04:	00058413          	mv	s0,a1
     f08:	00050493          	mv	s1,a0
     f0c:	00112623          	sw	ra,12(sp)
     f10:	2d1000ef          	jal	19e0 <__malloc_lock>
     f14:	ffc42583          	lw	a1,-4(s0)
     f18:	ff840713          	add	a4,s0,-8
     f1c:	7ffff517          	auipc	a0,0x7ffff
     f20:	20450513          	add	a0,a0,516 # 80000120 <__malloc_av_>
     f24:	ffe5f793          	and	a5,a1,-2
     f28:	00f70633          	add	a2,a4,a5
     f2c:	00462683          	lw	a3,4(a2)
     f30:	00852803          	lw	a6,8(a0)
     f34:	ffc6f693          	and	a3,a3,-4
     f38:	1ac80263          	beq	a6,a2,10dc <_free_r+0x1e8>
     f3c:	00d62223          	sw	a3,4(a2)
     f40:	0015f593          	and	a1,a1,1
     f44:	00d60833          	add	a6,a2,a3
     f48:	0a059063          	bnez	a1,fe8 <_free_r+0xf4>
     f4c:	ff842303          	lw	t1,-8(s0)
     f50:	00482583          	lw	a1,4(a6)
     f54:	7ffff897          	auipc	a7,0x7ffff
     f58:	1d488893          	add	a7,a7,468 # 80000128 <__malloc_av_+0x8>
     f5c:	40670733          	sub	a4,a4,t1
     f60:	00872803          	lw	a6,8(a4)
     f64:	006787b3          	add	a5,a5,t1
     f68:	0015f593          	and	a1,a1,1
     f6c:	15180263          	beq	a6,a7,10b0 <_free_r+0x1bc>
     f70:	00c72303          	lw	t1,12(a4)
     f74:	00682623          	sw	t1,12(a6)
     f78:	01032423          	sw	a6,8(t1)
     f7c:	1a058a63          	beqz	a1,1130 <_free_r+0x23c>
     f80:	0017e693          	or	a3,a5,1
     f84:	00d72223          	sw	a3,4(a4)
     f88:	00f62023          	sw	a5,0(a2)
     f8c:	1ff00693          	li	a3,511
     f90:	06f6ec63          	bltu	a3,a5,1008 <_free_r+0x114>
     f94:	ff87f693          	and	a3,a5,-8
     f98:	00868693          	add	a3,a3,8
     f9c:	00452583          	lw	a1,4(a0)
     fa0:	00d506b3          	add	a3,a0,a3
     fa4:	0006a603          	lw	a2,0(a3)
     fa8:	0057d813          	srl	a6,a5,0x5
     fac:	00100793          	li	a5,1
     fb0:	010797b3          	sll	a5,a5,a6
     fb4:	00b7e7b3          	or	a5,a5,a1
     fb8:	ff868593          	add	a1,a3,-8
     fbc:	00b72623          	sw	a1,12(a4)
     fc0:	00c72423          	sw	a2,8(a4)
     fc4:	00f52223          	sw	a5,4(a0)
     fc8:	00e6a023          	sw	a4,0(a3)
     fcc:	00e62623          	sw	a4,12(a2)
     fd0:	00812403          	lw	s0,8(sp)
     fd4:	00c12083          	lw	ra,12(sp)
     fd8:	00048513          	mv	a0,s1
     fdc:	00412483          	lw	s1,4(sp)
     fe0:	01010113          	add	sp,sp,16
     fe4:	2090006f          	j	19ec <__malloc_unlock>
     fe8:	00482583          	lw	a1,4(a6)
     fec:	0015f593          	and	a1,a1,1
     ff0:	08058663          	beqz	a1,107c <_free_r+0x188>
     ff4:	0017e693          	or	a3,a5,1
     ff8:	fed42e23          	sw	a3,-4(s0)
     ffc:	00f62023          	sw	a5,0(a2)
    1000:	1ff00693          	li	a3,511
    1004:	f8f6f8e3          	bgeu	a3,a5,f94 <_free_r+0xa0>
    1008:	0097d693          	srl	a3,a5,0x9
    100c:	00400613          	li	a2,4
    1010:	12d66463          	bltu	a2,a3,1138 <_free_r+0x244>
    1014:	0067d693          	srl	a3,a5,0x6
    1018:	03968593          	add	a1,a3,57
    101c:	03868613          	add	a2,a3,56
    1020:	00359593          	sll	a1,a1,0x3
    1024:	00b505b3          	add	a1,a0,a1
    1028:	0005a683          	lw	a3,0(a1)
    102c:	ff858593          	add	a1,a1,-8
    1030:	00d59863          	bne	a1,a3,1040 <_free_r+0x14c>
    1034:	15c0006f          	j	1190 <_free_r+0x29c>
    1038:	0086a683          	lw	a3,8(a3)
    103c:	00d58863          	beq	a1,a3,104c <_free_r+0x158>
    1040:	0046a603          	lw	a2,4(a3)
    1044:	ffc67613          	and	a2,a2,-4
    1048:	fec7e8e3          	bltu	a5,a2,1038 <_free_r+0x144>
    104c:	00c6a583          	lw	a1,12(a3)
    1050:	00b72623          	sw	a1,12(a4)
    1054:	00d72423          	sw	a3,8(a4)
    1058:	00812403          	lw	s0,8(sp)
    105c:	00c12083          	lw	ra,12(sp)
    1060:	00e5a423          	sw	a4,8(a1)
    1064:	00048513          	mv	a0,s1
    1068:	00412483          	lw	s1,4(sp)
    106c:	00e6a623          	sw	a4,12(a3)
    1070:	01010113          	add	sp,sp,16
    1074:	1790006f          	j	19ec <__malloc_unlock>
    1078:	00008067          	ret
    107c:	00d787b3          	add	a5,a5,a3
    1080:	7ffff897          	auipc	a7,0x7ffff
    1084:	0a888893          	add	a7,a7,168 # 80000128 <__malloc_av_+0x8>
    1088:	00862683          	lw	a3,8(a2)
    108c:	0f168063          	beq	a3,a7,116c <_free_r+0x278>
    1090:	00c62803          	lw	a6,12(a2)
    1094:	0017e593          	or	a1,a5,1
    1098:	00f70633          	add	a2,a4,a5
    109c:	0106a623          	sw	a6,12(a3)
    10a0:	00d82423          	sw	a3,8(a6)
    10a4:	00b72223          	sw	a1,4(a4)
    10a8:	00f62023          	sw	a5,0(a2)
    10ac:	ee1ff06f          	j	f8c <_free_r+0x98>
    10b0:	14059063          	bnez	a1,11f0 <_free_r+0x2fc>
    10b4:	00862583          	lw	a1,8(a2)
    10b8:	00c62603          	lw	a2,12(a2)
    10bc:	00f686b3          	add	a3,a3,a5
    10c0:	0016e793          	or	a5,a3,1
    10c4:	00c5a623          	sw	a2,12(a1)
    10c8:	00b62423          	sw	a1,8(a2)
    10cc:	00f72223          	sw	a5,4(a4)
    10d0:	00d70733          	add	a4,a4,a3
    10d4:	00d72023          	sw	a3,0(a4)
    10d8:	ef9ff06f          	j	fd0 <_free_r+0xdc>
    10dc:	0015f593          	and	a1,a1,1
    10e0:	00d786b3          	add	a3,a5,a3
    10e4:	02059063          	bnez	a1,1104 <_free_r+0x210>
    10e8:	ff842583          	lw	a1,-8(s0)
    10ec:	40b70733          	sub	a4,a4,a1
    10f0:	00c72783          	lw	a5,12(a4)
    10f4:	00872603          	lw	a2,8(a4)
    10f8:	00b686b3          	add	a3,a3,a1
    10fc:	00f62623          	sw	a5,12(a2)
    1100:	00c7a423          	sw	a2,8(a5)
    1104:	0016e793          	or	a5,a3,1
    1108:	00f72223          	sw	a5,4(a4)
    110c:	00e52423          	sw	a4,8(a0)
    1110:	7ffff797          	auipc	a5,0x7ffff
    1114:	6007a783          	lw	a5,1536(a5) # 80000710 <__malloc_trim_threshold>
    1118:	eaf6ece3          	bltu	a3,a5,fd0 <_free_r+0xdc>
    111c:	7ffff597          	auipc	a1,0x7ffff
    1120:	6085a583          	lw	a1,1544(a1) # 80000724 <__malloc_top_pad>
    1124:	00048513          	mv	a0,s1
    1128:	c89ff0ef          	jal	db0 <_malloc_trim_r>
    112c:	ea5ff06f          	j	fd0 <_free_r+0xdc>
    1130:	00d787b3          	add	a5,a5,a3
    1134:	f55ff06f          	j	1088 <_free_r+0x194>
    1138:	01400613          	li	a2,20
    113c:	02d67063          	bgeu	a2,a3,115c <_free_r+0x268>
    1140:	05400613          	li	a2,84
    1144:	06d66463          	bltu	a2,a3,11ac <_free_r+0x2b8>
    1148:	00c7d693          	srl	a3,a5,0xc
    114c:	06f68593          	add	a1,a3,111
    1150:	06e68613          	add	a2,a3,110
    1154:	00359593          	sll	a1,a1,0x3
    1158:	ecdff06f          	j	1024 <_free_r+0x130>
    115c:	05c68593          	add	a1,a3,92
    1160:	05b68613          	add	a2,a3,91
    1164:	00359593          	sll	a1,a1,0x3
    1168:	ebdff06f          	j	1024 <_free_r+0x130>
    116c:	00e52a23          	sw	a4,20(a0)
    1170:	00e52823          	sw	a4,16(a0)
    1174:	0017e693          	or	a3,a5,1
    1178:	01172623          	sw	a7,12(a4)
    117c:	01172423          	sw	a7,8(a4)
    1180:	00d72223          	sw	a3,4(a4)
    1184:	00f70733          	add	a4,a4,a5
    1188:	00f72023          	sw	a5,0(a4)
    118c:	e45ff06f          	j	fd0 <_free_r+0xdc>
    1190:	00452803          	lw	a6,4(a0)
    1194:	40265613          	sra	a2,a2,0x2
    1198:	00100793          	li	a5,1
    119c:	00c797b3          	sll	a5,a5,a2
    11a0:	0107e7b3          	or	a5,a5,a6
    11a4:	00f52223          	sw	a5,4(a0)
    11a8:	ea9ff06f          	j	1050 <_free_r+0x15c>
    11ac:	15400613          	li	a2,340
    11b0:	00d66c63          	bltu	a2,a3,11c8 <_free_r+0x2d4>
    11b4:	00f7d693          	srl	a3,a5,0xf
    11b8:	07868593          	add	a1,a3,120
    11bc:	07768613          	add	a2,a3,119
    11c0:	00359593          	sll	a1,a1,0x3
    11c4:	e61ff06f          	j	1024 <_free_r+0x130>
    11c8:	55400613          	li	a2,1364
    11cc:	00d66c63          	bltu	a2,a3,11e4 <_free_r+0x2f0>
    11d0:	0127d693          	srl	a3,a5,0x12
    11d4:	07d68593          	add	a1,a3,125
    11d8:	07c68613          	add	a2,a3,124
    11dc:	00359593          	sll	a1,a1,0x3
    11e0:	e45ff06f          	j	1024 <_free_r+0x130>
    11e4:	3f800593          	li	a1,1016
    11e8:	07e00613          	li	a2,126
    11ec:	e39ff06f          	j	1024 <_free_r+0x130>
    11f0:	0017e693          	or	a3,a5,1
    11f4:	00d72223          	sw	a3,4(a4)
    11f8:	00f62023          	sw	a5,0(a2)
    11fc:	dd5ff06f          	j	fd0 <_free_r+0xdc>

00001200 <_malloc_r>:
    1200:	fd010113          	add	sp,sp,-48
    1204:	03212023          	sw	s2,32(sp)
    1208:	02112623          	sw	ra,44(sp)
    120c:	02812423          	sw	s0,40(sp)
    1210:	02912223          	sw	s1,36(sp)
    1214:	01312e23          	sw	s3,28(sp)
    1218:	00b58793          	add	a5,a1,11
    121c:	01600713          	li	a4,22
    1220:	00050913          	mv	s2,a0
    1224:	08f76263          	bltu	a4,a5,12a8 <_malloc_r+0xa8>
    1228:	01000793          	li	a5,16
    122c:	20b7e663          	bltu	a5,a1,1438 <_malloc_r+0x238>
    1230:	7b0000ef          	jal	19e0 <__malloc_lock>
    1234:	01800793          	li	a5,24
    1238:	00200593          	li	a1,2
    123c:	01000493          	li	s1,16
    1240:	7ffff997          	auipc	s3,0x7ffff
    1244:	ee098993          	add	s3,s3,-288 # 80000120 <__malloc_av_>
    1248:	00f987b3          	add	a5,s3,a5
    124c:	0047a403          	lw	s0,4(a5)
    1250:	ff878713          	add	a4,a5,-8
    1254:	36e40463          	beq	s0,a4,15bc <_malloc_r+0x3bc>
    1258:	00442783          	lw	a5,4(s0)
    125c:	00c42683          	lw	a3,12(s0)
    1260:	00842603          	lw	a2,8(s0)
    1264:	ffc7f793          	and	a5,a5,-4
    1268:	00f407b3          	add	a5,s0,a5
    126c:	0047a703          	lw	a4,4(a5)
    1270:	00d62623          	sw	a3,12(a2)
    1274:	00c6a423          	sw	a2,8(a3)
    1278:	00176713          	or	a4,a4,1
    127c:	00090513          	mv	a0,s2
    1280:	00e7a223          	sw	a4,4(a5)
    1284:	768000ef          	jal	19ec <__malloc_unlock>
    1288:	00840513          	add	a0,s0,8
    128c:	02c12083          	lw	ra,44(sp)
    1290:	02812403          	lw	s0,40(sp)
    1294:	02412483          	lw	s1,36(sp)
    1298:	02012903          	lw	s2,32(sp)
    129c:	01c12983          	lw	s3,28(sp)
    12a0:	03010113          	add	sp,sp,48
    12a4:	00008067          	ret
    12a8:	ff87f493          	and	s1,a5,-8
    12ac:	1807c663          	bltz	a5,1438 <_malloc_r+0x238>
    12b0:	18b4e463          	bltu	s1,a1,1438 <_malloc_r+0x238>
    12b4:	72c000ef          	jal	19e0 <__malloc_lock>
    12b8:	1f700793          	li	a5,503
    12bc:	4097fa63          	bgeu	a5,s1,16d0 <_malloc_r+0x4d0>
    12c0:	0094d793          	srl	a5,s1,0x9
    12c4:	18078263          	beqz	a5,1448 <_malloc_r+0x248>
    12c8:	00400713          	li	a4,4
    12cc:	36f76063          	bltu	a4,a5,162c <_malloc_r+0x42c>
    12d0:	0064d793          	srl	a5,s1,0x6
    12d4:	03978593          	add	a1,a5,57
    12d8:	03878813          	add	a6,a5,56
    12dc:	00359613          	sll	a2,a1,0x3
    12e0:	7ffff997          	auipc	s3,0x7ffff
    12e4:	e4098993          	add	s3,s3,-448 # 80000120 <__malloc_av_>
    12e8:	00c98633          	add	a2,s3,a2
    12ec:	00462403          	lw	s0,4(a2)
    12f0:	ff860613          	add	a2,a2,-8
    12f4:	02860863          	beq	a2,s0,1324 <_malloc_r+0x124>
    12f8:	00f00513          	li	a0,15
    12fc:	0140006f          	j	1310 <_malloc_r+0x110>
    1300:	00c42683          	lw	a3,12(s0)
    1304:	2a075863          	bgez	a4,15b4 <_malloc_r+0x3b4>
    1308:	00d60e63          	beq	a2,a3,1324 <_malloc_r+0x124>
    130c:	00068413          	mv	s0,a3
    1310:	00442783          	lw	a5,4(s0)
    1314:	ffc7f793          	and	a5,a5,-4
    1318:	40978733          	sub	a4,a5,s1
    131c:	fee552e3          	bge	a0,a4,1300 <_malloc_r+0x100>
    1320:	00080593          	mv	a1,a6
    1324:	0109a403          	lw	s0,16(s3)
    1328:	7ffff897          	auipc	a7,0x7ffff
    132c:	e0088893          	add	a7,a7,-512 # 80000128 <__malloc_av_+0x8>
    1330:	27140e63          	beq	s0,a7,15ac <_malloc_r+0x3ac>
    1334:	00442783          	lw	a5,4(s0)
    1338:	00f00693          	li	a3,15
    133c:	ffc7f793          	and	a5,a5,-4
    1340:	40978733          	sub	a4,a5,s1
    1344:	38e6cc63          	blt	a3,a4,16dc <_malloc_r+0x4dc>
    1348:	0119aa23          	sw	a7,20(s3)
    134c:	0119a823          	sw	a7,16(s3)
    1350:	36075063          	bgez	a4,16b0 <_malloc_r+0x4b0>
    1354:	1ff00713          	li	a4,511
    1358:	0049a503          	lw	a0,4(s3)
    135c:	26f76863          	bltu	a4,a5,15cc <_malloc_r+0x3cc>
    1360:	ff87f713          	and	a4,a5,-8
    1364:	00870713          	add	a4,a4,8
    1368:	00e98733          	add	a4,s3,a4
    136c:	00072683          	lw	a3,0(a4)
    1370:	0057d613          	srl	a2,a5,0x5
    1374:	00100793          	li	a5,1
    1378:	00c797b3          	sll	a5,a5,a2
    137c:	00f56533          	or	a0,a0,a5
    1380:	ff870793          	add	a5,a4,-8
    1384:	00f42623          	sw	a5,12(s0)
    1388:	00d42423          	sw	a3,8(s0)
    138c:	00a9a223          	sw	a0,4(s3)
    1390:	00872023          	sw	s0,0(a4)
    1394:	0086a623          	sw	s0,12(a3)
    1398:	4025d793          	sra	a5,a1,0x2
    139c:	00100613          	li	a2,1
    13a0:	00f61633          	sll	a2,a2,a5
    13a4:	0ac56a63          	bltu	a0,a2,1458 <_malloc_r+0x258>
    13a8:	00a677b3          	and	a5,a2,a0
    13ac:	02079463          	bnez	a5,13d4 <_malloc_r+0x1d4>
    13b0:	00161613          	sll	a2,a2,0x1
    13b4:	ffc5f593          	and	a1,a1,-4
    13b8:	00a677b3          	and	a5,a2,a0
    13bc:	00458593          	add	a1,a1,4
    13c0:	00079a63          	bnez	a5,13d4 <_malloc_r+0x1d4>
    13c4:	00161613          	sll	a2,a2,0x1
    13c8:	00a677b3          	and	a5,a2,a0
    13cc:	00458593          	add	a1,a1,4
    13d0:	fe078ae3          	beqz	a5,13c4 <_malloc_r+0x1c4>
    13d4:	00f00813          	li	a6,15
    13d8:	00359313          	sll	t1,a1,0x3
    13dc:	00698333          	add	t1,s3,t1
    13e0:	00030513          	mv	a0,t1
    13e4:	00c52783          	lw	a5,12(a0)
    13e8:	00058e13          	mv	t3,a1
    13ec:	26f50263          	beq	a0,a5,1650 <_malloc_r+0x450>
    13f0:	0047a703          	lw	a4,4(a5)
    13f4:	00078413          	mv	s0,a5
    13f8:	00c7a783          	lw	a5,12(a5)
    13fc:	ffc77713          	and	a4,a4,-4
    1400:	409706b3          	sub	a3,a4,s1
    1404:	26d84263          	blt	a6,a3,1668 <_malloc_r+0x468>
    1408:	fe06c2e3          	bltz	a3,13ec <_malloc_r+0x1ec>
    140c:	00e40733          	add	a4,s0,a4
    1410:	00472683          	lw	a3,4(a4)
    1414:	00842603          	lw	a2,8(s0)
    1418:	00090513          	mv	a0,s2
    141c:	0016e693          	or	a3,a3,1
    1420:	00d72223          	sw	a3,4(a4)
    1424:	00f62623          	sw	a5,12(a2)
    1428:	00c7a423          	sw	a2,8(a5)
    142c:	5c0000ef          	jal	19ec <__malloc_unlock>
    1430:	00840513          	add	a0,s0,8
    1434:	e59ff06f          	j	128c <_malloc_r+0x8c>
    1438:	00c00793          	li	a5,12
    143c:	00f92023          	sw	a5,0(s2)
    1440:	00000513          	li	a0,0
    1444:	e49ff06f          	j	128c <_malloc_r+0x8c>
    1448:	20000613          	li	a2,512
    144c:	04000593          	li	a1,64
    1450:	03f00813          	li	a6,63
    1454:	e8dff06f          	j	12e0 <_malloc_r+0xe0>
    1458:	0089a403          	lw	s0,8(s3)
    145c:	01612823          	sw	s6,16(sp)
    1460:	00442783          	lw	a5,4(s0)
    1464:	ffc7fb13          	and	s6,a5,-4
    1468:	009b6863          	bltu	s6,s1,1478 <_malloc_r+0x278>
    146c:	409b0733          	sub	a4,s6,s1
    1470:	00f00793          	li	a5,15
    1474:	0ee7ca63          	blt	a5,a4,1568 <_malloc_r+0x368>
    1478:	01912223          	sw	s9,4(sp)
    147c:	7ffffc97          	auipc	s9,0x7ffff
    1480:	290c8c93          	add	s9,s9,656 # 8000070c <__malloc_sbrk_base>
    1484:	000ca703          	lw	a4,0(s9)
    1488:	01412c23          	sw	s4,24(sp)
    148c:	01512a23          	sw	s5,20(sp)
    1490:	01712623          	sw	s7,12(sp)
    1494:	7ffffa97          	auipc	s5,0x7ffff
    1498:	290aaa83          	lw	s5,656(s5) # 80000724 <__malloc_top_pad>
    149c:	fff00793          	li	a5,-1
    14a0:	01640a33          	add	s4,s0,s6
    14a4:	01548ab3          	add	s5,s1,s5
    14a8:	3ef70263          	beq	a4,a5,188c <_malloc_r+0x68c>
    14ac:	000017b7          	lui	a5,0x1
    14b0:	00f78793          	add	a5,a5,15 # 100f <_free_r+0x11b>
    14b4:	00fa8ab3          	add	s5,s5,a5
    14b8:	fffff7b7          	lui	a5,0xfffff
    14bc:	00fafab3          	and	s5,s5,a5
    14c0:	000a8593          	mv	a1,s5
    14c4:	00090513          	mv	a0,s2
    14c8:	7c9050ef          	jal	7490 <_sbrk_r>
    14cc:	fff00793          	li	a5,-1
    14d0:	00050b93          	mv	s7,a0
    14d4:	46f50663          	beq	a0,a5,1940 <_malloc_r+0x740>
    14d8:	01812423          	sw	s8,8(sp)
    14dc:	25456863          	bltu	a0,s4,172c <_malloc_r+0x52c>
    14e0:	7ffffc17          	auipc	s8,0x7ffff
    14e4:	2d4c0c13          	add	s8,s8,724 # 800007b4 <__malloc_current_mallinfo>
    14e8:	000c2583          	lw	a1,0(s8)
    14ec:	00ba85b3          	add	a1,s5,a1
    14f0:	00bc2023          	sw	a1,0(s8)
    14f4:	00058713          	mv	a4,a1
    14f8:	2caa1063          	bne	s4,a0,17b8 <_malloc_r+0x5b8>
    14fc:	01451793          	sll	a5,a0,0x14
    1500:	2a079c63          	bnez	a5,17b8 <_malloc_r+0x5b8>
    1504:	0089ab83          	lw	s7,8(s3)
    1508:	015b07b3          	add	a5,s6,s5
    150c:	0017e793          	or	a5,a5,1
    1510:	00fba223          	sw	a5,4(s7)
    1514:	7ffff717          	auipc	a4,0x7ffff
    1518:	20c70713          	add	a4,a4,524 # 80000720 <__malloc_max_sbrked_mem>
    151c:	00072683          	lw	a3,0(a4)
    1520:	00b6f463          	bgeu	a3,a1,1528 <_malloc_r+0x328>
    1524:	00b72023          	sw	a1,0(a4)
    1528:	7ffff717          	auipc	a4,0x7ffff
    152c:	1f470713          	add	a4,a4,500 # 8000071c <__malloc_max_total_mem>
    1530:	00072683          	lw	a3,0(a4)
    1534:	00b6f463          	bgeu	a3,a1,153c <_malloc_r+0x33c>
    1538:	00b72023          	sw	a1,0(a4)
    153c:	00812c03          	lw	s8,8(sp)
    1540:	000b8413          	mv	s0,s7
    1544:	ffc7f793          	and	a5,a5,-4
    1548:	40978733          	sub	a4,a5,s1
    154c:	3897ec63          	bltu	a5,s1,18e4 <_malloc_r+0x6e4>
    1550:	00f00793          	li	a5,15
    1554:	38e7d863          	bge	a5,a4,18e4 <_malloc_r+0x6e4>
    1558:	01812a03          	lw	s4,24(sp)
    155c:	01412a83          	lw	s5,20(sp)
    1560:	00c12b83          	lw	s7,12(sp)
    1564:	00412c83          	lw	s9,4(sp)
    1568:	0014e793          	or	a5,s1,1
    156c:	00f42223          	sw	a5,4(s0)
    1570:	009404b3          	add	s1,s0,s1
    1574:	0099a423          	sw	s1,8(s3)
    1578:	00176713          	or	a4,a4,1
    157c:	00090513          	mv	a0,s2
    1580:	00e4a223          	sw	a4,4(s1)
    1584:	468000ef          	jal	19ec <__malloc_unlock>
    1588:	02c12083          	lw	ra,44(sp)
    158c:	00840513          	add	a0,s0,8
    1590:	02812403          	lw	s0,40(sp)
    1594:	01012b03          	lw	s6,16(sp)
    1598:	02412483          	lw	s1,36(sp)
    159c:	02012903          	lw	s2,32(sp)
    15a0:	01c12983          	lw	s3,28(sp)
    15a4:	03010113          	add	sp,sp,48
    15a8:	00008067          	ret
    15ac:	0049a503          	lw	a0,4(s3)
    15b0:	de9ff06f          	j	1398 <_malloc_r+0x198>
    15b4:	00842603          	lw	a2,8(s0)
    15b8:	cb1ff06f          	j	1268 <_malloc_r+0x68>
    15bc:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    15c0:	00258593          	add	a1,a1,2
    15c4:	d68780e3          	beq	a5,s0,1324 <_malloc_r+0x124>
    15c8:	c91ff06f          	j	1258 <_malloc_r+0x58>
    15cc:	0097d713          	srl	a4,a5,0x9
    15d0:	00400693          	li	a3,4
    15d4:	14e6f263          	bgeu	a3,a4,1718 <_malloc_r+0x518>
    15d8:	01400693          	li	a3,20
    15dc:	32e6e663          	bltu	a3,a4,1908 <_malloc_r+0x708>
    15e0:	05c70613          	add	a2,a4,92
    15e4:	05b70693          	add	a3,a4,91
    15e8:	00361613          	sll	a2,a2,0x3
    15ec:	00c98633          	add	a2,s3,a2
    15f0:	00062703          	lw	a4,0(a2)
    15f4:	ff860613          	add	a2,a2,-8
    15f8:	00e61863          	bne	a2,a4,1608 <_malloc_r+0x408>
    15fc:	2980006f          	j	1894 <_malloc_r+0x694>
    1600:	00872703          	lw	a4,8(a4)
    1604:	00e60863          	beq	a2,a4,1614 <_malloc_r+0x414>
    1608:	00472683          	lw	a3,4(a4)
    160c:	ffc6f693          	and	a3,a3,-4
    1610:	fed7e8e3          	bltu	a5,a3,1600 <_malloc_r+0x400>
    1614:	00c72603          	lw	a2,12(a4)
    1618:	00c42623          	sw	a2,12(s0)
    161c:	00e42423          	sw	a4,8(s0)
    1620:	00862423          	sw	s0,8(a2)
    1624:	00872623          	sw	s0,12(a4)
    1628:	d71ff06f          	j	1398 <_malloc_r+0x198>
    162c:	01400713          	li	a4,20
    1630:	10f77863          	bgeu	a4,a5,1740 <_malloc_r+0x540>
    1634:	05400713          	li	a4,84
    1638:	2ef76663          	bltu	a4,a5,1924 <_malloc_r+0x724>
    163c:	00c4d793          	srl	a5,s1,0xc
    1640:	06f78593          	add	a1,a5,111
    1644:	06e78813          	add	a6,a5,110
    1648:	00359613          	sll	a2,a1,0x3
    164c:	c95ff06f          	j	12e0 <_malloc_r+0xe0>
    1650:	001e0e13          	add	t3,t3,1
    1654:	003e7793          	and	a5,t3,3
    1658:	00850513          	add	a0,a0,8
    165c:	10078063          	beqz	a5,175c <_malloc_r+0x55c>
    1660:	00c52783          	lw	a5,12(a0)
    1664:	d89ff06f          	j	13ec <_malloc_r+0x1ec>
    1668:	00842603          	lw	a2,8(s0)
    166c:	0014e593          	or	a1,s1,1
    1670:	00b42223          	sw	a1,4(s0)
    1674:	00f62623          	sw	a5,12(a2)
    1678:	00c7a423          	sw	a2,8(a5)
    167c:	009404b3          	add	s1,s0,s1
    1680:	0099aa23          	sw	s1,20(s3)
    1684:	0099a823          	sw	s1,16(s3)
    1688:	0016e793          	or	a5,a3,1
    168c:	0114a623          	sw	a7,12(s1)
    1690:	0114a423          	sw	a7,8(s1)
    1694:	00f4a223          	sw	a5,4(s1)
    1698:	00e40733          	add	a4,s0,a4
    169c:	00090513          	mv	a0,s2
    16a0:	00d72023          	sw	a3,0(a4)
    16a4:	348000ef          	jal	19ec <__malloc_unlock>
    16a8:	00840513          	add	a0,s0,8
    16ac:	be1ff06f          	j	128c <_malloc_r+0x8c>
    16b0:	00f407b3          	add	a5,s0,a5
    16b4:	0047a703          	lw	a4,4(a5)
    16b8:	00090513          	mv	a0,s2
    16bc:	00176713          	or	a4,a4,1
    16c0:	00e7a223          	sw	a4,4(a5)
    16c4:	328000ef          	jal	19ec <__malloc_unlock>
    16c8:	00840513          	add	a0,s0,8
    16cc:	bc1ff06f          	j	128c <_malloc_r+0x8c>
    16d0:	0034d593          	srl	a1,s1,0x3
    16d4:	00848793          	add	a5,s1,8
    16d8:	b69ff06f          	j	1240 <_malloc_r+0x40>
    16dc:	0014e693          	or	a3,s1,1
    16e0:	00d42223          	sw	a3,4(s0)
    16e4:	009404b3          	add	s1,s0,s1
    16e8:	0099aa23          	sw	s1,20(s3)
    16ec:	0099a823          	sw	s1,16(s3)
    16f0:	00176693          	or	a3,a4,1
    16f4:	0114a623          	sw	a7,12(s1)
    16f8:	0114a423          	sw	a7,8(s1)
    16fc:	00d4a223          	sw	a3,4(s1)
    1700:	00f407b3          	add	a5,s0,a5
    1704:	00090513          	mv	a0,s2
    1708:	00e7a023          	sw	a4,0(a5)
    170c:	2e0000ef          	jal	19ec <__malloc_unlock>
    1710:	00840513          	add	a0,s0,8
    1714:	b79ff06f          	j	128c <_malloc_r+0x8c>
    1718:	0067d713          	srl	a4,a5,0x6
    171c:	03970613          	add	a2,a4,57
    1720:	03870693          	add	a3,a4,56
    1724:	00361613          	sll	a2,a2,0x3
    1728:	ec5ff06f          	j	15ec <_malloc_r+0x3ec>
    172c:	07340c63          	beq	s0,s3,17a4 <_malloc_r+0x5a4>
    1730:	0089a403          	lw	s0,8(s3)
    1734:	00812c03          	lw	s8,8(sp)
    1738:	00442783          	lw	a5,4(s0)
    173c:	e09ff06f          	j	1544 <_malloc_r+0x344>
    1740:	05c78593          	add	a1,a5,92
    1744:	05b78813          	add	a6,a5,91
    1748:	00359613          	sll	a2,a1,0x3
    174c:	b95ff06f          	j	12e0 <_malloc_r+0xe0>
    1750:	00832783          	lw	a5,8(t1)
    1754:	fff58593          	add	a1,a1,-1
    1758:	28679063          	bne	a5,t1,19d8 <_malloc_r+0x7d8>
    175c:	0035f793          	and	a5,a1,3
    1760:	ff830313          	add	t1,t1,-8
    1764:	fe0796e3          	bnez	a5,1750 <_malloc_r+0x550>
    1768:	0049a703          	lw	a4,4(s3)
    176c:	fff64793          	not	a5,a2
    1770:	00e7f7b3          	and	a5,a5,a4
    1774:	00f9a223          	sw	a5,4(s3)
    1778:	00161613          	sll	a2,a2,0x1
    177c:	ccc7eee3          	bltu	a5,a2,1458 <_malloc_r+0x258>
    1780:	cc060ce3          	beqz	a2,1458 <_malloc_r+0x258>
    1784:	00f67733          	and	a4,a2,a5
    1788:	00071a63          	bnez	a4,179c <_malloc_r+0x59c>
    178c:	00161613          	sll	a2,a2,0x1
    1790:	00f67733          	and	a4,a2,a5
    1794:	004e0e13          	add	t3,t3,4
    1798:	fe070ae3          	beqz	a4,178c <_malloc_r+0x58c>
    179c:	000e0593          	mv	a1,t3
    17a0:	c39ff06f          	j	13d8 <_malloc_r+0x1d8>
    17a4:	7ffffc17          	auipc	s8,0x7ffff
    17a8:	010c0c13          	add	s8,s8,16 # 800007b4 <__malloc_current_mallinfo>
    17ac:	000c2703          	lw	a4,0(s8)
    17b0:	00ea8733          	add	a4,s5,a4
    17b4:	00ec2023          	sw	a4,0(s8)
    17b8:	000ca683          	lw	a3,0(s9)
    17bc:	fff00793          	li	a5,-1
    17c0:	18f68663          	beq	a3,a5,194c <_malloc_r+0x74c>
    17c4:	414b87b3          	sub	a5,s7,s4
    17c8:	00e787b3          	add	a5,a5,a4
    17cc:	00fc2023          	sw	a5,0(s8)
    17d0:	007bfc93          	and	s9,s7,7
    17d4:	0c0c8c63          	beqz	s9,18ac <_malloc_r+0x6ac>
    17d8:	419b8bb3          	sub	s7,s7,s9
    17dc:	000017b7          	lui	a5,0x1
    17e0:	00878793          	add	a5,a5,8 # 1008 <_free_r+0x114>
    17e4:	008b8b93          	add	s7,s7,8
    17e8:	419785b3          	sub	a1,a5,s9
    17ec:	015b8ab3          	add	s5,s7,s5
    17f0:	415585b3          	sub	a1,a1,s5
    17f4:	01459593          	sll	a1,a1,0x14
    17f8:	0145da13          	srl	s4,a1,0x14
    17fc:	000a0593          	mv	a1,s4
    1800:	00090513          	mv	a0,s2
    1804:	48d050ef          	jal	7490 <_sbrk_r>
    1808:	fff00793          	li	a5,-1
    180c:	18f50063          	beq	a0,a5,198c <_malloc_r+0x78c>
    1810:	41750533          	sub	a0,a0,s7
    1814:	01450ab3          	add	s5,a0,s4
    1818:	000c2703          	lw	a4,0(s8)
    181c:	0179a423          	sw	s7,8(s3)
    1820:	001ae793          	or	a5,s5,1
    1824:	00ea05b3          	add	a1,s4,a4
    1828:	00bc2023          	sw	a1,0(s8)
    182c:	00fba223          	sw	a5,4(s7)
    1830:	cf3402e3          	beq	s0,s3,1514 <_malloc_r+0x314>
    1834:	00f00693          	li	a3,15
    1838:	0b66f063          	bgeu	a3,s6,18d8 <_malloc_r+0x6d8>
    183c:	00442703          	lw	a4,4(s0)
    1840:	ff4b0793          	add	a5,s6,-12
    1844:	ff87f793          	and	a5,a5,-8
    1848:	00177713          	and	a4,a4,1
    184c:	00f76733          	or	a4,a4,a5
    1850:	00e42223          	sw	a4,4(s0)
    1854:	00500613          	li	a2,5
    1858:	00f40733          	add	a4,s0,a5
    185c:	00c72223          	sw	a2,4(a4)
    1860:	00c72423          	sw	a2,8(a4)
    1864:	00f6e663          	bltu	a3,a5,1870 <_malloc_r+0x670>
    1868:	004ba783          	lw	a5,4(s7)
    186c:	ca9ff06f          	j	1514 <_malloc_r+0x314>
    1870:	00840593          	add	a1,s0,8
    1874:	00090513          	mv	a0,s2
    1878:	e7cff0ef          	jal	ef4 <_free_r>
    187c:	0089ab83          	lw	s7,8(s3)
    1880:	000c2583          	lw	a1,0(s8)
    1884:	004ba783          	lw	a5,4(s7)
    1888:	c8dff06f          	j	1514 <_malloc_r+0x314>
    188c:	010a8a93          	add	s5,s5,16
    1890:	c31ff06f          	j	14c0 <_malloc_r+0x2c0>
    1894:	4026d693          	sra	a3,a3,0x2
    1898:	00100793          	li	a5,1
    189c:	00d797b3          	sll	a5,a5,a3
    18a0:	00f56533          	or	a0,a0,a5
    18a4:	00a9a223          	sw	a0,4(s3)
    18a8:	d71ff06f          	j	1618 <_malloc_r+0x418>
    18ac:	015b85b3          	add	a1,s7,s5
    18b0:	40b005b3          	neg	a1,a1
    18b4:	01459593          	sll	a1,a1,0x14
    18b8:	0145da13          	srl	s4,a1,0x14
    18bc:	000a0593          	mv	a1,s4
    18c0:	00090513          	mv	a0,s2
    18c4:	3cd050ef          	jal	7490 <_sbrk_r>
    18c8:	fff00793          	li	a5,-1
    18cc:	f4f512e3          	bne	a0,a5,1810 <_malloc_r+0x610>
    18d0:	00000a13          	li	s4,0
    18d4:	f45ff06f          	j	1818 <_malloc_r+0x618>
    18d8:	00812c03          	lw	s8,8(sp)
    18dc:	00100793          	li	a5,1
    18e0:	00fba223          	sw	a5,4(s7)
    18e4:	00090513          	mv	a0,s2
    18e8:	104000ef          	jal	19ec <__malloc_unlock>
    18ec:	00000513          	li	a0,0
    18f0:	01812a03          	lw	s4,24(sp)
    18f4:	01412a83          	lw	s5,20(sp)
    18f8:	01012b03          	lw	s6,16(sp)
    18fc:	00c12b83          	lw	s7,12(sp)
    1900:	00412c83          	lw	s9,4(sp)
    1904:	989ff06f          	j	128c <_malloc_r+0x8c>
    1908:	05400693          	li	a3,84
    190c:	04e6e463          	bltu	a3,a4,1954 <_malloc_r+0x754>
    1910:	00c7d713          	srl	a4,a5,0xc
    1914:	06f70613          	add	a2,a4,111
    1918:	06e70693          	add	a3,a4,110
    191c:	00361613          	sll	a2,a2,0x3
    1920:	ccdff06f          	j	15ec <_malloc_r+0x3ec>
    1924:	15400713          	li	a4,340
    1928:	04f76463          	bltu	a4,a5,1970 <_malloc_r+0x770>
    192c:	00f4d793          	srl	a5,s1,0xf
    1930:	07878593          	add	a1,a5,120
    1934:	07778813          	add	a6,a5,119
    1938:	00359613          	sll	a2,a1,0x3
    193c:	9a5ff06f          	j	12e0 <_malloc_r+0xe0>
    1940:	0089a403          	lw	s0,8(s3)
    1944:	00442783          	lw	a5,4(s0)
    1948:	bfdff06f          	j	1544 <_malloc_r+0x344>
    194c:	017ca023          	sw	s7,0(s9)
    1950:	e81ff06f          	j	17d0 <_malloc_r+0x5d0>
    1954:	15400693          	li	a3,340
    1958:	04e6e463          	bltu	a3,a4,19a0 <_malloc_r+0x7a0>
    195c:	00f7d713          	srl	a4,a5,0xf
    1960:	07870613          	add	a2,a4,120
    1964:	07770693          	add	a3,a4,119
    1968:	00361613          	sll	a2,a2,0x3
    196c:	c81ff06f          	j	15ec <_malloc_r+0x3ec>
    1970:	55400713          	li	a4,1364
    1974:	04f76463          	bltu	a4,a5,19bc <_malloc_r+0x7bc>
    1978:	0124d793          	srl	a5,s1,0x12
    197c:	07d78593          	add	a1,a5,125
    1980:	07c78813          	add	a6,a5,124
    1984:	00359613          	sll	a2,a1,0x3
    1988:	959ff06f          	j	12e0 <_malloc_r+0xe0>
    198c:	ff8c8c93          	add	s9,s9,-8
    1990:	019a8ab3          	add	s5,s5,s9
    1994:	417a8ab3          	sub	s5,s5,s7
    1998:	00000a13          	li	s4,0
    199c:	e7dff06f          	j	1818 <_malloc_r+0x618>
    19a0:	55400693          	li	a3,1364
    19a4:	02e6e463          	bltu	a3,a4,19cc <_malloc_r+0x7cc>
    19a8:	0127d713          	srl	a4,a5,0x12
    19ac:	07d70613          	add	a2,a4,125
    19b0:	07c70693          	add	a3,a4,124
    19b4:	00361613          	sll	a2,a2,0x3
    19b8:	c35ff06f          	j	15ec <_malloc_r+0x3ec>
    19bc:	3f800613          	li	a2,1016
    19c0:	07f00593          	li	a1,127
    19c4:	07e00813          	li	a6,126
    19c8:	919ff06f          	j	12e0 <_malloc_r+0xe0>
    19cc:	3f800613          	li	a2,1016
    19d0:	07e00693          	li	a3,126
    19d4:	c19ff06f          	j	15ec <_malloc_r+0x3ec>
    19d8:	0049a783          	lw	a5,4(s3)
    19dc:	d9dff06f          	j	1778 <_malloc_r+0x578>

000019e0 <__malloc_lock>:
    19e0:	7ffff517          	auipc	a0,0x7ffff
    19e4:	d4c50513          	add	a0,a0,-692 # 8000072c <__lock___malloc_recursive_mutex>
    19e8:	36d0506f          	j	7554 <__retarget_lock_acquire_recursive>

000019ec <__malloc_unlock>:
    19ec:	7ffff517          	auipc	a0,0x7ffff
    19f0:	d4050513          	add	a0,a0,-704 # 8000072c <__lock___malloc_recursive_mutex>
    19f4:	3650506f          	j	7558 <__retarget_lock_release_recursive>

000019f8 <_vfprintf_r>:
    19f8:	e7010113          	add	sp,sp,-400
    19fc:	18112623          	sw	ra,396(sp)
    1a00:	00b12423          	sw	a1,8(sp)
    1a04:	00c12623          	sw	a2,12(sp)
    1a08:	00d12a23          	sw	a3,20(sp)
    1a0c:	17312e23          	sw	s3,380(sp)
    1a10:	18812423          	sw	s0,392(sp)
    1a14:	00050993          	mv	s3,a0
    1a18:	14d050ef          	jal	7364 <_localeconv_r>
    1a1c:	00052783          	lw	a5,0(a0)
    1a20:	00078513          	mv	a0,a5
    1a24:	02f12a23          	sw	a5,52(sp)
    1a28:	afcff0ef          	jal	d24 <strlen>
    1a2c:	00050713          	mv	a4,a0
    1a30:	00800613          	li	a2,8
    1a34:	00000593          	li	a1,0
    1a38:	09010513          	add	a0,sp,144
    1a3c:	02e12823          	sw	a4,48(sp)
    1a40:	864ff0ef          	jal	aa4 <memset>
    1a44:	00c12783          	lw	a5,12(sp)
    1a48:	00098863          	beqz	s3,1a58 <_vfprintf_r+0x60>
    1a4c:	0349a703          	lw	a4,52(s3)
    1a50:	00071463          	bnez	a4,1a58 <_vfprintf_r+0x60>
    1a54:	29d0106f          	j	34f0 <_vfprintf_r+0x1af8>
    1a58:	00812703          	lw	a4,8(sp)
    1a5c:	06472683          	lw	a3,100(a4)
    1a60:	00c71703          	lh	a4,12(a4)
    1a64:	0016f693          	and	a3,a3,1
    1a68:	00069863          	bnez	a3,1a78 <_vfprintf_r+0x80>
    1a6c:	20077693          	and	a3,a4,512
    1a70:	00069463          	bnez	a3,1a78 <_vfprintf_r+0x80>
    1a74:	3ec0106f          	j	2e60 <_vfprintf_r+0x1468>
    1a78:	01271693          	sll	a3,a4,0x12
    1a7c:	0206c863          	bltz	a3,1aac <_vfprintf_r+0xb4>
    1a80:	00812503          	lw	a0,8(sp)
    1a84:	000025b7          	lui	a1,0x2
    1a88:	ffffe637          	lui	a2,0xffffe
    1a8c:	06452683          	lw	a3,100(a0)
    1a90:	00b76733          	or	a4,a4,a1
    1a94:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1a98:	01071713          	sll	a4,a4,0x10
    1a9c:	41075713          	sra	a4,a4,0x10
    1aa0:	00c6f6b3          	and	a3,a3,a2
    1aa4:	00e51623          	sh	a4,12(a0)
    1aa8:	06d52223          	sw	a3,100(a0)
    1aac:	00877693          	and	a3,a4,8
    1ab0:	2a068063          	beqz	a3,1d50 <_vfprintf_r+0x358>
    1ab4:	00812683          	lw	a3,8(sp)
    1ab8:	0106a683          	lw	a3,16(a3)
    1abc:	28068a63          	beqz	a3,1d50 <_vfprintf_r+0x358>
    1ac0:	01a77693          	and	a3,a4,26
    1ac4:	00a00613          	li	a2,10
    1ac8:	2ac68c63          	beq	a3,a2,1d80 <_vfprintf_r+0x388>
    1acc:	0ac10713          	add	a4,sp,172
    1ad0:	17512a23          	sw	s5,372(sp)
    1ad4:	17812423          	sw	s8,360(sp)
    1ad8:	15b12e23          	sw	s11,348(sp)
    1adc:	18912223          	sw	s1,388(sp)
    1ae0:	19212023          	sw	s2,384(sp)
    1ae4:	17412c23          	sw	s4,376(sp)
    1ae8:	17612823          	sw	s6,368(sp)
    1aec:	17712623          	sw	s7,364(sp)
    1af0:	17912223          	sw	s9,356(sp)
    1af4:	17a12023          	sw	s10,352(sp)
    1af8:	0ae12023          	sw	a4,160(sp)
    1afc:	0a012423          	sw	zero,168(sp)
    1b00:	0a012223          	sw	zero,164(sp)
    1b04:	00012c23          	sw	zero,24(sp)
    1b08:	02012423          	sw	zero,40(sp)
    1b0c:	02012623          	sw	zero,44(sp)
    1b10:	00070413          	mv	s0,a4
    1b14:	02012c23          	sw	zero,56(sp)
    1b18:	04012023          	sw	zero,64(sp)
    1b1c:	02012e23          	sw	zero,60(sp)
    1b20:	04012623          	sw	zero,76(sp)
    1b24:	04012423          	sw	zero,72(sp)
    1b28:	00012623          	sw	zero,12(sp)
    1b2c:	7ffffa97          	auipc	s5,0x7ffff
    1b30:	a08a8a93          	add	s5,s5,-1528 # 80000534 <__global_locale>
    1b34:	02500d93          	li	s11,37
    1b38:	00078c13          	mv	s8,a5
    1b3c:	000c0913          	mv	s2,s8
    1b40:	0e4aa483          	lw	s1,228(s5)
    1b44:	015050ef          	jal	7358 <__locale_mb_cur_max>
    1b48:	00050693          	mv	a3,a0
    1b4c:	09010713          	add	a4,sp,144
    1b50:	00090613          	mv	a2,s2
    1b54:	08010593          	add	a1,sp,128
    1b58:	00098513          	mv	a0,s3
    1b5c:	000480e7          	jalr	s1
    1b60:	2c050a63          	beqz	a0,1e34 <_vfprintf_r+0x43c>
    1b64:	2a054a63          	bltz	a0,1e18 <_vfprintf_r+0x420>
    1b68:	08012783          	lw	a5,128(sp)
    1b6c:	01b78663          	beq	a5,s11,1b78 <_vfprintf_r+0x180>
    1b70:	00a90933          	add	s2,s2,a0
    1b74:	fcdff06f          	j	1b40 <_vfprintf_r+0x148>
    1b78:	00050493          	mv	s1,a0
    1b7c:	41890cb3          	sub	s9,s2,s8
    1b80:	2d891063          	bne	s2,s8,1e40 <_vfprintf_r+0x448>
    1b84:	fff00313          	li	t1,-1
    1b88:	00000e93          	li	t4,0
    1b8c:	00194e03          	lbu	t3,1(s2)
    1b90:	06010ba3          	sb	zero,119(sp)
    1b94:	00190913          	add	s2,s2,1
    1b98:	00000b93          	li	s7,0
    1b9c:	05a00493          	li	s1,90
    1ba0:	000e8a13          	mv	s4,t4
    1ba4:	00030b13          	mv	s6,t1
    1ba8:	00190913          	add	s2,s2,1
    1bac:	fe0e0793          	add	a5,t3,-32
    1bb0:	04f4ea63          	bltu	s1,a5,1c04 <_vfprintf_r+0x20c>
    1bb4:	0000d717          	auipc	a4,0xd
    1bb8:	1b070713          	add	a4,a4,432 # ed64 <_ctype_+0x104>
    1bbc:	00279793          	sll	a5,a5,0x2
    1bc0:	00e787b3          	add	a5,a5,a4
    1bc4:	0007a783          	lw	a5,0(a5)
    1bc8:	00e787b3          	add	a5,a5,a4
    1bcc:	00078067          	jr	a5
    1bd0:	00000b93          	li	s7,0
    1bd4:	fd0e0713          	add	a4,t3,-48
    1bd8:	00900693          	li	a3,9
    1bdc:	00094e03          	lbu	t3,0(s2)
    1be0:	002b9793          	sll	a5,s7,0x2
    1be4:	017787b3          	add	a5,a5,s7
    1be8:	00179793          	sll	a5,a5,0x1
    1bec:	00f70bb3          	add	s7,a4,a5
    1bf0:	fd0e0713          	add	a4,t3,-48
    1bf4:	00190913          	add	s2,s2,1
    1bf8:	fee6f2e3          	bgeu	a3,a4,1bdc <_vfprintf_r+0x1e4>
    1bfc:	fe0e0793          	add	a5,t3,-32
    1c00:	faf4fae3          	bgeu	s1,a5,1bb4 <_vfprintf_r+0x1bc>
    1c04:	000a0e93          	mv	t4,s4
    1c08:	260e0a63          	beqz	t3,1e7c <_vfprintf_r+0x484>
    1c0c:	0fc10623          	sb	t3,236(sp)
    1c10:	06010ba3          	sb	zero,119(sp)
    1c14:	00100c93          	li	s9,1
    1c18:	00000613          	li	a2,0
    1c1c:	00012823          	sw	zero,16(sp)
    1c20:	00100d13          	li	s10,1
    1c24:	00000313          	li	t1,0
    1c28:	02012223          	sw	zero,36(sp)
    1c2c:	02012023          	sw	zero,32(sp)
    1c30:	00000a13          	li	s4,0
    1c34:	0ec10c13          	add	s8,sp,236
    1c38:	002ef293          	and	t0,t4,2
    1c3c:	00028463          	beqz	t0,1c44 <_vfprintf_r+0x24c>
    1c40:	002c8c93          	add	s9,s9,2
    1c44:	084eff93          	and	t6,t4,132
    1c48:	0a812483          	lw	s1,168(sp)
    1c4c:	000f9663          	bnez	t6,1c58 <_vfprintf_r+0x260>
    1c50:	419b8733          	sub	a4,s7,s9
    1c54:	40e04663          	bgtz	a4,2060 <_vfprintf_r+0x668>
    1c58:	02060a63          	beqz	a2,1c8c <_vfprintf_r+0x294>
    1c5c:	0a412703          	lw	a4,164(sp)
    1c60:	07710613          	add	a2,sp,119
    1c64:	00148493          	add	s1,s1,1
    1c68:	00170713          	add	a4,a4,1
    1c6c:	00100793          	li	a5,1
    1c70:	00c42023          	sw	a2,0(s0)
    1c74:	00f42223          	sw	a5,4(s0)
    1c78:	0a912423          	sw	s1,168(sp)
    1c7c:	0ae12223          	sw	a4,164(sp)
    1c80:	00700613          	li	a2,7
    1c84:	00840413          	add	s0,s0,8
    1c88:	4ce64863          	blt	a2,a4,2158 <_vfprintf_r+0x760>
    1c8c:	02028a63          	beqz	t0,1cc0 <_vfprintf_r+0x2c8>
    1c90:	0a412703          	lw	a4,164(sp)
    1c94:	07810613          	add	a2,sp,120
    1c98:	00c42023          	sw	a2,0(s0)
    1c9c:	00248493          	add	s1,s1,2
    1ca0:	00200613          	li	a2,2
    1ca4:	00170713          	add	a4,a4,1
    1ca8:	00c42223          	sw	a2,4(s0)
    1cac:	0a912423          	sw	s1,168(sp)
    1cb0:	0ae12223          	sw	a4,164(sp)
    1cb4:	00700613          	li	a2,7
    1cb8:	00840413          	add	s0,s0,8
    1cbc:	5ce644e3          	blt	a2,a4,2a84 <_vfprintf_r+0x108c>
    1cc0:	08000713          	li	a4,128
    1cc4:	3aef80e3          	beq	t6,a4,2864 <_vfprintf_r+0xe6c>
    1cc8:	41a30b33          	sub	s6,t1,s10
    1ccc:	4b604ae3          	bgtz	s6,2980 <_vfprintf_r+0xf88>
    1cd0:	100ef713          	and	a4,t4,256
    1cd4:	1a0710e3          	bnez	a4,2674 <_vfprintf_r+0xc7c>
    1cd8:	0a412783          	lw	a5,164(sp)
    1cdc:	01a484b3          	add	s1,s1,s10
    1ce0:	01842023          	sw	s8,0(s0)
    1ce4:	00178793          	add	a5,a5,1
    1ce8:	01a42223          	sw	s10,4(s0)
    1cec:	0a912423          	sw	s1,168(sp)
    1cf0:	0af12223          	sw	a5,164(sp)
    1cf4:	00700713          	li	a4,7
    1cf8:	58f74c63          	blt	a4,a5,2290 <_vfprintf_r+0x898>
    1cfc:	00840413          	add	s0,s0,8
    1d00:	004eff13          	and	t5,t4,4
    1d04:	000f0663          	beqz	t5,1d10 <_vfprintf_r+0x318>
    1d08:	419b8d33          	sub	s10,s7,s9
    1d0c:	5ba04ce3          	bgtz	s10,2ac4 <_vfprintf_r+0x10cc>
    1d10:	000b8e93          	mv	t4,s7
    1d14:	019bd463          	bge	s7,s9,1d1c <_vfprintf_r+0x324>
    1d18:	000c8e93          	mv	t4,s9
    1d1c:	00c12783          	lw	a5,12(sp)
    1d20:	01d787b3          	add	a5,a5,t4
    1d24:	00f12623          	sw	a5,12(sp)
    1d28:	18049663          	bnez	s1,1eb4 <_vfprintf_r+0x4bc>
    1d2c:	01012783          	lw	a5,16(sp)
    1d30:	0a012223          	sw	zero,164(sp)
    1d34:	00078863          	beqz	a5,1d44 <_vfprintf_r+0x34c>
    1d38:	01012583          	lw	a1,16(sp)
    1d3c:	00098513          	mv	a0,s3
    1d40:	9b4ff0ef          	jal	ef4 <_free_r>
    1d44:	0ac10413          	add	s0,sp,172
    1d48:	00090c13          	mv	s8,s2
    1d4c:	df1ff06f          	j	1b3c <_vfprintf_r+0x144>
    1d50:	00812403          	lw	s0,8(sp)
    1d54:	00098513          	mv	a0,s3
    1d58:	00f12623          	sw	a5,12(sp)
    1d5c:	00040593          	mv	a1,s0
    1d60:	118050ef          	jal	6e78 <__swsetup_r>
    1d64:	00050463          	beqz	a0,1d6c <_vfprintf_r+0x374>
    1d68:	5600206f          	j	42c8 <_vfprintf_r+0x28d0>
    1d6c:	00c41703          	lh	a4,12(s0)
    1d70:	00a00613          	li	a2,10
    1d74:	00c12783          	lw	a5,12(sp)
    1d78:	01a77693          	and	a3,a4,26
    1d7c:	d4c698e3          	bne	a3,a2,1acc <_vfprintf_r+0xd4>
    1d80:	00812603          	lw	a2,8(sp)
    1d84:	00e61683          	lh	a3,14(a2)
    1d88:	d406c2e3          	bltz	a3,1acc <_vfprintf_r+0xd4>
    1d8c:	06462683          	lw	a3,100(a2)
    1d90:	0016f693          	and	a3,a3,1
    1d94:	00069863          	bnez	a3,1da4 <_vfprintf_r+0x3ac>
    1d98:	20077713          	and	a4,a4,512
    1d9c:	00071463          	bnez	a4,1da4 <_vfprintf_r+0x3ac>
    1da0:	53d0106f          	j	3adc <_vfprintf_r+0x20e4>
    1da4:	01412683          	lw	a3,20(sp)
    1da8:	00812583          	lw	a1,8(sp)
    1dac:	00098513          	mv	a0,s3
    1db0:	00078613          	mv	a2,a5
    1db4:	0e5020ef          	jal	4698 <__sbprintf>
    1db8:	18c12083          	lw	ra,396(sp)
    1dbc:	18812403          	lw	s0,392(sp)
    1dc0:	00a12623          	sw	a0,12(sp)
    1dc4:	00c12503          	lw	a0,12(sp)
    1dc8:	17c12983          	lw	s3,380(sp)
    1dcc:	19010113          	add	sp,sp,400
    1dd0:	00008067          	ret
    1dd4:	00098513          	mv	a0,s3
    1dd8:	58c050ef          	jal	7364 <_localeconv_r>
    1ddc:	00452783          	lw	a5,4(a0)
    1de0:	00078513          	mv	a0,a5
    1de4:	04f12423          	sw	a5,72(sp)
    1de8:	f3dfe0ef          	jal	d24 <strlen>
    1dec:	00050793          	mv	a5,a0
    1df0:	00098513          	mv	a0,s3
    1df4:	00078c93          	mv	s9,a5
    1df8:	04f12623          	sw	a5,76(sp)
    1dfc:	568050ef          	jal	7364 <_localeconv_r>
    1e00:	00852703          	lw	a4,8(a0)
    1e04:	02e12e23          	sw	a4,60(sp)
    1e08:	000c8463          	beqz	s9,1e10 <_vfprintf_r+0x418>
    1e0c:	1ec0106f          	j	2ff8 <_vfprintf_r+0x1600>
    1e10:	00094e03          	lbu	t3,0(s2)
    1e14:	d95ff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    1e18:	00800613          	li	a2,8
    1e1c:	00000593          	li	a1,0
    1e20:	09010513          	add	a0,sp,144
    1e24:	c81fe0ef          	jal	aa4 <memset>
    1e28:	00100513          	li	a0,1
    1e2c:	00a90933          	add	s2,s2,a0
    1e30:	d11ff06f          	j	1b40 <_vfprintf_r+0x148>
    1e34:	00050493          	mv	s1,a0
    1e38:	41890cb3          	sub	s9,s2,s8
    1e3c:	05890063          	beq	s2,s8,1e7c <_vfprintf_r+0x484>
    1e40:	0a812683          	lw	a3,168(sp)
    1e44:	0a412703          	lw	a4,164(sp)
    1e48:	01842023          	sw	s8,0(s0)
    1e4c:	019686b3          	add	a3,a3,s9
    1e50:	00170713          	add	a4,a4,1
    1e54:	01942223          	sw	s9,4(s0)
    1e58:	0ad12423          	sw	a3,168(sp)
    1e5c:	0ae12223          	sw	a4,164(sp)
    1e60:	00700693          	li	a3,7
    1e64:	00840413          	add	s0,s0,8
    1e68:	02e6c863          	blt	a3,a4,1e98 <_vfprintf_r+0x4a0>
    1e6c:	00c12783          	lw	a5,12(sp)
    1e70:	019787b3          	add	a5,a5,s9
    1e74:	00f12623          	sw	a5,12(sp)
    1e78:	d00496e3          	bnez	s1,1b84 <_vfprintf_r+0x18c>
    1e7c:	0a812783          	lw	a5,168(sp)
    1e80:	00078463          	beqz	a5,1e88 <_vfprintf_r+0x490>
    1e84:	4090106f          	j	3a8c <_vfprintf_r+0x2094>
    1e88:	00812783          	lw	a5,8(sp)
    1e8c:	0a012223          	sw	zero,164(sp)
    1e90:	00c79783          	lh	a5,12(a5)
    1e94:	0500006f          	j	1ee4 <_vfprintf_r+0x4ec>
    1e98:	00812583          	lw	a1,8(sp)
    1e9c:	0a010613          	add	a2,sp,160
    1ea0:	00098513          	mv	a0,s3
    1ea4:	211020ef          	jal	48b4 <__sprint_r>
    1ea8:	02051a63          	bnez	a0,1edc <_vfprintf_r+0x4e4>
    1eac:	0ac10413          	add	s0,sp,172
    1eb0:	fbdff06f          	j	1e6c <_vfprintf_r+0x474>
    1eb4:	00812583          	lw	a1,8(sp)
    1eb8:	0a010613          	add	a2,sp,160
    1ebc:	00098513          	mv	a0,s3
    1ec0:	1f5020ef          	jal	48b4 <__sprint_r>
    1ec4:	e60504e3          	beqz	a0,1d2c <_vfprintf_r+0x334>
    1ec8:	01012283          	lw	t0,16(sp)
    1ecc:	00028863          	beqz	t0,1edc <_vfprintf_r+0x4e4>
    1ed0:	00028593          	mv	a1,t0
    1ed4:	00098513          	mv	a0,s3
    1ed8:	81cff0ef          	jal	ef4 <_free_r>
    1edc:	00812783          	lw	a5,8(sp)
    1ee0:	00c79783          	lh	a5,12(a5)
    1ee4:	00812703          	lw	a4,8(sp)
    1ee8:	06472703          	lw	a4,100(a4)
    1eec:	00177713          	and	a4,a4,1
    1ef0:	3c070463          	beqz	a4,22b8 <_vfprintf_r+0x8c0>
    1ef4:	0407f793          	and	a5,a5,64
    1ef8:	18412483          	lw	s1,388(sp)
    1efc:	18012903          	lw	s2,384(sp)
    1f00:	17812a03          	lw	s4,376(sp)
    1f04:	17412a83          	lw	s5,372(sp)
    1f08:	17012b03          	lw	s6,368(sp)
    1f0c:	16c12b83          	lw	s7,364(sp)
    1f10:	16812c03          	lw	s8,360(sp)
    1f14:	16412c83          	lw	s9,356(sp)
    1f18:	16012d03          	lw	s10,352(sp)
    1f1c:	15c12d83          	lw	s11,348(sp)
    1f20:	00078463          	beqz	a5,1f28 <_vfprintf_r+0x530>
    1f24:	3d00206f          	j	42f4 <_vfprintf_r+0x28fc>
    1f28:	18c12083          	lw	ra,396(sp)
    1f2c:	18812403          	lw	s0,392(sp)
    1f30:	00c12503          	lw	a0,12(sp)
    1f34:	17c12983          	lw	s3,380(sp)
    1f38:	19010113          	add	sp,sp,400
    1f3c:	00008067          	ret
    1f40:	008a7713          	and	a4,s4,8
    1f44:	000a0e93          	mv	t4,s4
    1f48:	000b0313          	mv	t1,s6
    1f4c:	00070463          	beqz	a4,1f54 <_vfprintf_r+0x55c>
    1f50:	0200106f          	j	2f70 <_vfprintf_r+0x1578>
    1f54:	01412783          	lw	a5,20(sp)
    1f58:	00778b13          	add	s6,a5,7
    1f5c:	ff8b7b13          	and	s6,s6,-8
    1f60:	000b2783          	lw	a5,0(s6)
    1f64:	02f12423          	sw	a5,40(sp)
    1f68:	004b2783          	lw	a5,4(s6)
    1f6c:	02f12623          	sw	a5,44(sp)
    1f70:	008b0793          	add	a5,s6,8
    1f74:	00f12a23          	sw	a5,20(sp)
    1f78:	02c12a03          	lw	s4,44(sp)
    1f7c:	7fffe717          	auipc	a4,0x7fffe
    1f80:	72470713          	add	a4,a4,1828 # 800006a0 <__global_locale+0x16c>
    1f84:	00072c83          	lw	s9,0(a4)
    1f88:	00472d03          	lw	s10,4(a4)
    1f8c:	02812b03          	lw	s6,40(sp)
    1f90:	001a1493          	sll	s1,s4,0x1
    1f94:	0014d493          	srl	s1,s1,0x1
    1f98:	000b0513          	mv	a0,s6
    1f9c:	00048593          	mv	a1,s1
    1fa0:	000c8613          	mv	a2,s9
    1fa4:	000d0693          	mv	a3,s10
    1fa8:	02612223          	sw	t1,36(sp)
    1fac:	03c12023          	sw	t3,32(sp)
    1fb0:	01d12823          	sw	t4,16(sp)
    1fb4:	1800c0ef          	jal	e134 <__unorddf2>
    1fb8:	01012e83          	lw	t4,16(sp)
    1fbc:	02012e03          	lw	t3,32(sp)
    1fc0:	02412303          	lw	t1,36(sp)
    1fc4:	00050463          	beqz	a0,1fcc <_vfprintf_r+0x5d4>
    1fc8:	4080106f          	j	33d0 <_vfprintf_r+0x19d8>
    1fcc:	000b0513          	mv	a0,s6
    1fd0:	00048593          	mv	a1,s1
    1fd4:	000c8613          	mv	a2,s9
    1fd8:	000d0693          	mv	a3,s10
    1fdc:	7b90a0ef          	jal	cf94 <__ledf2>
    1fe0:	01012e83          	lw	t4,16(sp)
    1fe4:	02012e03          	lw	t3,32(sp)
    1fe8:	02412303          	lw	t1,36(sp)
    1fec:	00a04463          	bgtz	a0,1ff4 <_vfprintf_r+0x5fc>
    1ff0:	3e00106f          	j	33d0 <_vfprintf_r+0x19d8>
    1ff4:	000b0513          	mv	a0,s6
    1ff8:	000a0593          	mv	a1,s4
    1ffc:	00000613          	li	a2,0
    2000:	00000693          	li	a3,0
    2004:	7910a0ef          	jal	cf94 <__ledf2>
    2008:	01012e83          	lw	t4,16(sp)
    200c:	02012e03          	lw	t3,32(sp)
    2010:	00055463          	bgez	a0,2018 <_vfprintf_r+0x620>
    2014:	6650106f          	j	3e78 <_vfprintf_r+0x2480>
    2018:	07714603          	lbu	a2,119(sp)
    201c:	04700713          	li	a4,71
    2020:	0000dc17          	auipc	s8,0xd
    2024:	a54c0c13          	add	s8,s8,-1452 # ea74 <__fini_array_end+0x118>
    2028:	01c74663          	blt	a4,t3,2034 <_vfprintf_r+0x63c>
    202c:	0000dc17          	auipc	s8,0xd
    2030:	a44c0c13          	add	s8,s8,-1468 # ea70 <__fini_array_end+0x114>
    2034:	00012823          	sw	zero,16(sp)
    2038:	02012223          	sw	zero,36(sp)
    203c:	02012023          	sw	zero,32(sp)
    2040:	f7fefe93          	and	t4,t4,-129
    2044:	00300c93          	li	s9,3
    2048:	00300d13          	li	s10,3
    204c:	00000313          	li	t1,0
    2050:	00000a13          	li	s4,0
    2054:	be0602e3          	beqz	a2,1c38 <_vfprintf_r+0x240>
    2058:	001c8c93          	add	s9,s9,1
    205c:	bddff06f          	j	1c38 <_vfprintf_r+0x240>
    2060:	01000593          	li	a1,16
    2064:	0a412603          	lw	a2,164(sp)
    2068:	0000db17          	auipc	s6,0xd
    206c:	f10b0b13          	add	s6,s6,-240 # ef78 <blanks.1>
    2070:	0ae5dc63          	bge	a1,a4,2128 <_vfprintf_r+0x730>
    2074:	00040793          	mv	a5,s0
    2078:	00048693          	mv	a3,s1
    207c:	01000893          	li	a7,16
    2080:	000b0493          	mv	s1,s6
    2084:	00700393          	li	t2,7
    2088:	000a0b13          	mv	s6,s4
    208c:	04512223          	sw	t0,68(sp)
    2090:	05f12823          	sw	t6,80(sp)
    2094:	05d12a23          	sw	t4,84(sp)
    2098:	05c12c23          	sw	t3,88(sp)
    209c:	00070413          	mv	s0,a4
    20a0:	00030a13          	mv	s4,t1
    20a4:	00c0006f          	j	20b0 <_vfprintf_r+0x6b8>
    20a8:	ff040413          	add	s0,s0,-16
    20ac:	0488da63          	bge	a7,s0,2100 <_vfprintf_r+0x708>
    20b0:	01068693          	add	a3,a3,16
    20b4:	00160613          	add	a2,a2,1
    20b8:	0097a023          	sw	s1,0(a5)
    20bc:	0117a223          	sw	a7,4(a5)
    20c0:	0ad12423          	sw	a3,168(sp)
    20c4:	0ac12223          	sw	a2,164(sp)
    20c8:	00878793          	add	a5,a5,8
    20cc:	fcc3dee3          	bge	t2,a2,20a8 <_vfprintf_r+0x6b0>
    20d0:	00812583          	lw	a1,8(sp)
    20d4:	0a010613          	add	a2,sp,160
    20d8:	00098513          	mv	a0,s3
    20dc:	7d8020ef          	jal	48b4 <__sprint_r>
    20e0:	de0514e3          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    20e4:	01000893          	li	a7,16
    20e8:	ff040413          	add	s0,s0,-16
    20ec:	0a812683          	lw	a3,168(sp)
    20f0:	0a412603          	lw	a2,164(sp)
    20f4:	0ac10793          	add	a5,sp,172
    20f8:	00700393          	li	t2,7
    20fc:	fa88cae3          	blt	a7,s0,20b0 <_vfprintf_r+0x6b8>
    2100:	04412283          	lw	t0,68(sp)
    2104:	05012f83          	lw	t6,80(sp)
    2108:	05412e83          	lw	t4,84(sp)
    210c:	05812e03          	lw	t3,88(sp)
    2110:	000a0313          	mv	t1,s4
    2114:	00040713          	mv	a4,s0
    2118:	000b0a13          	mv	s4,s6
    211c:	00078413          	mv	s0,a5
    2120:	00048b13          	mv	s6,s1
    2124:	00068493          	mv	s1,a3
    2128:	00e484b3          	add	s1,s1,a4
    212c:	00160613          	add	a2,a2,1
    2130:	00e42223          	sw	a4,4(s0)
    2134:	01642023          	sw	s6,0(s0)
    2138:	0a912423          	sw	s1,168(sp)
    213c:	0ac12223          	sw	a2,164(sp)
    2140:	00700713          	li	a4,7
    2144:	00c75463          	bge	a4,a2,214c <_vfprintf_r+0x754>
    2148:	2380106f          	j	3380 <_vfprintf_r+0x1988>
    214c:	07714603          	lbu	a2,119(sp)
    2150:	00840413          	add	s0,s0,8
    2154:	b05ff06f          	j	1c58 <_vfprintf_r+0x260>
    2158:	00812583          	lw	a1,8(sp)
    215c:	0a010613          	add	a2,sp,160
    2160:	00098513          	mv	a0,s3
    2164:	04612e23          	sw	t1,92(sp)
    2168:	05c12c23          	sw	t3,88(sp)
    216c:	05d12a23          	sw	t4,84(sp)
    2170:	05f12823          	sw	t6,80(sp)
    2174:	04512223          	sw	t0,68(sp)
    2178:	73c020ef          	jal	48b4 <__sprint_r>
    217c:	d40516e3          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2180:	0a812483          	lw	s1,168(sp)
    2184:	05c12303          	lw	t1,92(sp)
    2188:	05812e03          	lw	t3,88(sp)
    218c:	05412e83          	lw	t4,84(sp)
    2190:	05012f83          	lw	t6,80(sp)
    2194:	04412283          	lw	t0,68(sp)
    2198:	0ac10413          	add	s0,sp,172
    219c:	af1ff06f          	j	1c8c <_vfprintf_r+0x294>
    21a0:	0a412d03          	lw	s10,164(sp)
    21a4:	01812783          	lw	a5,24(sp)
    21a8:	00100693          	li	a3,1
    21ac:	01842023          	sw	s8,0(s0)
    21b0:	00148493          	add	s1,s1,1
    21b4:	001d0d13          	add	s10,s10,1
    21b8:	00840b13          	add	s6,s0,8
    21bc:	32f6d0e3          	bge	a3,a5,2cdc <_vfprintf_r+0x12e4>
    21c0:	00100693          	li	a3,1
    21c4:	00d42223          	sw	a3,4(s0)
    21c8:	0a912423          	sw	s1,168(sp)
    21cc:	0ba12223          	sw	s10,164(sp)
    21d0:	00700693          	li	a3,7
    21d4:	01a6d463          	bge	a3,s10,21dc <_vfprintf_r+0x7e4>
    21d8:	0680106f          	j	3240 <_vfprintf_r+0x1848>
    21dc:	03012783          	lw	a5,48(sp)
    21e0:	03412703          	lw	a4,52(sp)
    21e4:	001d0d13          	add	s10,s10,1
    21e8:	00f484b3          	add	s1,s1,a5
    21ec:	00eb2023          	sw	a4,0(s6)
    21f0:	00fb2223          	sw	a5,4(s6)
    21f4:	0a912423          	sw	s1,168(sp)
    21f8:	0ba12223          	sw	s10,164(sp)
    21fc:	00700693          	li	a3,7
    2200:	008b0b13          	add	s6,s6,8
    2204:	01a6d463          	bge	a3,s10,220c <_vfprintf_r+0x814>
    2208:	0680106f          	j	3270 <_vfprintf_r+0x1878>
    220c:	02812603          	lw	a2,40(sp)
    2210:	02c12683          	lw	a3,44(sp)
    2214:	01812783          	lw	a5,24(sp)
    2218:	00060513          	mv	a0,a2
    221c:	00068593          	mv	a1,a3
    2220:	00000613          	li	a2,0
    2224:	00000693          	li	a3,0
    2228:	03d12023          	sw	t4,32(sp)
    222c:	fff78413          	add	s0,a5,-1
    2230:	3d90a0ef          	jal	ce08 <__eqdf2>
    2234:	02012e83          	lw	t4,32(sp)
    2238:	2e0506e3          	beqz	a0,2d24 <_vfprintf_r+0x132c>
    223c:	001c0793          	add	a5,s8,1
    2240:	001d0d13          	add	s10,s10,1
    2244:	008484b3          	add	s1,s1,s0
    2248:	00fb2023          	sw	a5,0(s6)
    224c:	008b2223          	sw	s0,4(s6)
    2250:	0a912423          	sw	s1,168(sp)
    2254:	0ba12223          	sw	s10,164(sp)
    2258:	00700793          	li	a5,7
    225c:	008b0b13          	add	s6,s6,8
    2260:	29a7cce3          	blt	a5,s10,2cf8 <_vfprintf_r+0x1300>
    2264:	04012703          	lw	a4,64(sp)
    2268:	08810793          	add	a5,sp,136
    226c:	001d0d13          	add	s10,s10,1
    2270:	009704b3          	add	s1,a4,s1
    2274:	00fb2023          	sw	a5,0(s6)
    2278:	00eb2223          	sw	a4,4(s6)
    227c:	0a912423          	sw	s1,168(sp)
    2280:	0ba12223          	sw	s10,164(sp)
    2284:	00700793          	li	a5,7
    2288:	008b0413          	add	s0,s6,8
    228c:	a7a7dae3          	bge	a5,s10,1d00 <_vfprintf_r+0x308>
    2290:	00812583          	lw	a1,8(sp)
    2294:	0a010613          	add	a2,sp,160
    2298:	00098513          	mv	a0,s3
    229c:	03d12023          	sw	t4,32(sp)
    22a0:	614020ef          	jal	48b4 <__sprint_r>
    22a4:	c20512e3          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    22a8:	0a812483          	lw	s1,168(sp)
    22ac:	02012e83          	lw	t4,32(sp)
    22b0:	0ac10413          	add	s0,sp,172
    22b4:	a4dff06f          	j	1d00 <_vfprintf_r+0x308>
    22b8:	2007f713          	and	a4,a5,512
    22bc:	c2071ce3          	bnez	a4,1ef4 <_vfprintf_r+0x4fc>
    22c0:	00812403          	lw	s0,8(sp)
    22c4:	05842503          	lw	a0,88(s0)
    22c8:	290050ef          	jal	7558 <__retarget_lock_release_recursive>
    22cc:	00c41783          	lh	a5,12(s0)
    22d0:	c25ff06f          	j	1ef4 <_vfprintf_r+0x4fc>
    22d4:	00094e03          	lbu	t3,0(s2)
    22d8:	020a6a13          	or	s4,s4,32
    22dc:	8cdff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    22e0:	01412703          	lw	a4,20(sp)
    22e4:	04300793          	li	a5,67
    22e8:	000a0e93          	mv	t4,s4
    22ec:	00470493          	add	s1,a4,4
    22f0:	64fe08e3          	beq	t3,a5,3140 <_vfprintf_r+0x1748>
    22f4:	010a7793          	and	a5,s4,16
    22f8:	640794e3          	bnez	a5,3140 <_vfprintf_r+0x1748>
    22fc:	01412783          	lw	a5,20(sp)
    2300:	00100c93          	li	s9,1
    2304:	00100d13          	li	s10,1
    2308:	0007a783          	lw	a5,0(a5)
    230c:	0ec10c13          	add	s8,sp,236
    2310:	0ef10623          	sb	a5,236(sp)
    2314:	06010ba3          	sb	zero,119(sp)
    2318:	00912a23          	sw	s1,20(sp)
    231c:	00000613          	li	a2,0
    2320:	00012823          	sw	zero,16(sp)
    2324:	00000313          	li	t1,0
    2328:	02012223          	sw	zero,36(sp)
    232c:	02012023          	sw	zero,32(sp)
    2330:	00000a13          	li	s4,0
    2334:	905ff06f          	j	1c38 <_vfprintf_r+0x240>
    2338:	01412783          	lw	a5,20(sp)
    233c:	06010ba3          	sb	zero,119(sp)
    2340:	000b0313          	mv	t1,s6
    2344:	0007ac03          	lw	s8,0(a5)
    2348:	000a0e93          	mv	t4,s4
    234c:	00478b13          	add	s6,a5,4
    2350:	5a0c0ce3          	beqz	s8,3108 <_vfprintf_r+0x1710>
    2354:	05300713          	li	a4,83
    2358:	00ee1463          	bne	t3,a4,2360 <_vfprintf_r+0x968>
    235c:	1d00106f          	j	352c <_vfprintf_r+0x1b34>
    2360:	010a7a13          	and	s4,s4,16
    2364:	000a0463          	beqz	s4,236c <_vfprintf_r+0x974>
    2368:	1c40106f          	j	352c <_vfprintf_r+0x1b34>
    236c:	00035463          	bgez	t1,2374 <_vfprintf_r+0x97c>
    2370:	6d40106f          	j	3a44 <_vfprintf_r+0x204c>
    2374:	00030613          	mv	a2,t1
    2378:	00000593          	li	a1,0
    237c:	000c0513          	mv	a0,s8
    2380:	03d12023          	sw	t4,32(sp)
    2384:	00612a23          	sw	t1,20(sp)
    2388:	661040ef          	jal	71e8 <memchr>
    238c:	00a12823          	sw	a0,16(sp)
    2390:	01412303          	lw	t1,20(sp)
    2394:	02012e83          	lw	t4,32(sp)
    2398:	00051463          	bnez	a0,23a0 <_vfprintf_r+0x9a8>
    239c:	1780206f          	j	4514 <_vfprintf_r+0x2b1c>
    23a0:	01012783          	lw	a5,16(sp)
    23a4:	07714603          	lbu	a2,119(sp)
    23a8:	01612a23          	sw	s6,20(sp)
    23ac:	41878d33          	sub	s10,a5,s8
    23b0:	fffd4813          	not	a6,s10
    23b4:	41f85813          	sra	a6,a6,0x1f
    23b8:	02012223          	sw	zero,36(sp)
    23bc:	02012023          	sw	zero,32(sp)
    23c0:	00012823          	sw	zero,16(sp)
    23c4:	010d7cb3          	and	s9,s10,a6
    23c8:	00000313          	li	t1,0
    23cc:	07300e13          	li	t3,115
    23d0:	860604e3          	beqz	a2,1c38 <_vfprintf_r+0x240>
    23d4:	c85ff06f          	j	2058 <_vfprintf_r+0x660>
    23d8:	01412783          	lw	a5,20(sp)
    23dc:	0007ab83          	lw	s7,0(a5)
    23e0:	00478793          	add	a5,a5,4
    23e4:	2a0bdae3          	bgez	s7,2e98 <_vfprintf_r+0x14a0>
    23e8:	41700bb3          	neg	s7,s7
    23ec:	00f12a23          	sw	a5,20(sp)
    23f0:	00094e03          	lbu	t3,0(s2)
    23f4:	004a6a13          	or	s4,s4,4
    23f8:	fb0ff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    23fc:	02b00793          	li	a5,43
    2400:	00094e03          	lbu	t3,0(s2)
    2404:	06f10ba3          	sb	a5,119(sp)
    2408:	fa0ff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    240c:	000b0313          	mv	t1,s6
    2410:	010a6613          	or	a2,s4,16
    2414:	02067793          	and	a5,a2,32
    2418:	1c0780e3          	beqz	a5,2dd8 <_vfprintf_r+0x13e0>
    241c:	01412783          	lw	a5,20(sp)
    2420:	00778b13          	add	s6,a5,7
    2424:	ff8b7b13          	and	s6,s6,-8
    2428:	000b2d03          	lw	s10,0(s6)
    242c:	004b2c83          	lw	s9,4(s6)
    2430:	008b0793          	add	a5,s6,8
    2434:	00f12a23          	sw	a5,20(sp)
    2438:	00100793          	li	a5,1
    243c:	00000713          	li	a4,0
    2440:	06e10ba3          	sb	a4,119(sp)
    2444:	34034c63          	bltz	t1,279c <_vfprintf_r+0xda4>
    2448:	019d6733          	or	a4,s10,s9
    244c:	f7f67e93          	and	t4,a2,-129
    2450:	34071463          	bnez	a4,2798 <_vfprintf_r+0xda0>
    2454:	3a031a63          	bnez	t1,2808 <_vfprintf_r+0xe10>
    2458:	5c079ee3          	bnez	a5,3234 <_vfprintf_r+0x183c>
    245c:	00167d13          	and	s10,a2,1
    2460:	15010c13          	add	s8,sp,336
    2464:	2c0d10e3          	bnez	s10,2f24 <_vfprintf_r+0x152c>
    2468:	07714603          	lbu	a2,119(sp)
    246c:	00030c93          	mv	s9,t1
    2470:	01a35463          	bge	t1,s10,2478 <_vfprintf_r+0xa80>
    2474:	000d0c93          	mv	s9,s10
    2478:	00012823          	sw	zero,16(sp)
    247c:	02012223          	sw	zero,36(sp)
    2480:	02012023          	sw	zero,32(sp)
    2484:	00000a13          	li	s4,0
    2488:	fa060863          	beqz	a2,1c38 <_vfprintf_r+0x240>
    248c:	bcdff06f          	j	2058 <_vfprintf_r+0x660>
    2490:	00094e03          	lbu	t3,0(s2)
    2494:	080a6a13          	or	s4,s4,128
    2498:	f10ff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    249c:	00094e03          	lbu	t3,0(s2)
    24a0:	02a00793          	li	a5,42
    24a4:	00190693          	add	a3,s2,1
    24a8:	00fe1463          	bne	t3,a5,24b0 <_vfprintf_r+0xab8>
    24ac:	1100206f          	j	45bc <_vfprintf_r+0x2bc4>
    24b0:	fd0e0713          	add	a4,t3,-48
    24b4:	00900793          	li	a5,9
    24b8:	00000b13          	li	s6,0
    24bc:	00900613          	li	a2,9
    24c0:	02e7e463          	bltu	a5,a4,24e8 <_vfprintf_r+0xaf0>
    24c4:	0006ce03          	lbu	t3,0(a3)
    24c8:	002b1793          	sll	a5,s6,0x2
    24cc:	016787b3          	add	a5,a5,s6
    24d0:	00179793          	sll	a5,a5,0x1
    24d4:	00e78b33          	add	s6,a5,a4
    24d8:	fd0e0713          	add	a4,t3,-48
    24dc:	00168693          	add	a3,a3,1
    24e0:	fee672e3          	bgeu	a2,a4,24c4 <_vfprintf_r+0xacc>
    24e4:	320b4ce3          	bltz	s6,301c <_vfprintf_r+0x1624>
    24e8:	00068913          	mv	s2,a3
    24ec:	ec0ff06f          	j	1bac <_vfprintf_r+0x1b4>
    24f0:	00094e03          	lbu	t3,0(s2)
    24f4:	001a6a13          	or	s4,s4,1
    24f8:	eb0ff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    24fc:	07714783          	lbu	a5,119(sp)
    2500:	00094e03          	lbu	t3,0(s2)
    2504:	ea079263          	bnez	a5,1ba8 <_vfprintf_r+0x1b0>
    2508:	02000793          	li	a5,32
    250c:	06f10ba3          	sb	a5,119(sp)
    2510:	e98ff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    2514:	00094e03          	lbu	t3,0(s2)
    2518:	06c00793          	li	a5,108
    251c:	3afe00e3          	beq	t3,a5,30bc <_vfprintf_r+0x16c4>
    2520:	010a6a13          	or	s4,s4,16
    2524:	e84ff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    2528:	00094e03          	lbu	t3,0(s2)
    252c:	008a6a13          	or	s4,s4,8
    2530:	e78ff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    2534:	000b0313          	mv	t1,s6
    2538:	010a6e93          	or	t4,s4,16
    253c:	020ef793          	and	a5,t4,32
    2540:	0c0786e3          	beqz	a5,2e0c <_vfprintf_r+0x1414>
    2544:	01412783          	lw	a5,20(sp)
    2548:	00778b13          	add	s6,a5,7
    254c:	ff8b7b13          	and	s6,s6,-8
    2550:	004b2783          	lw	a5,4(s6)
    2554:	000b2d03          	lw	s10,0(s6)
    2558:	008b0713          	add	a4,s6,8
    255c:	00e12a23          	sw	a4,20(sp)
    2560:	00078c93          	mv	s9,a5
    2564:	0c07cee3          	bltz	a5,2e40 <_vfprintf_r+0x1448>
    2568:	000e8613          	mv	a2,t4
    256c:	02034263          	bltz	t1,2590 <_vfprintf_r+0xb98>
    2570:	019d67b3          	or	a5,s10,s9
    2574:	f7fef613          	and	a2,t4,-129
    2578:	00079c63          	bnez	a5,2590 <_vfprintf_r+0xb98>
    257c:	02031063          	bnez	t1,259c <_vfprintf_r+0xba4>
    2580:	00000d13          	li	s10,0
    2584:	00060e93          	mv	t4,a2
    2588:	15010c13          	add	s8,sp,336
    258c:	eddff06f          	j	2468 <_vfprintf_r+0xa70>
    2590:	520c90e3          	bnez	s9,32b0 <_vfprintf_r+0x18b8>
    2594:	00900793          	li	a5,9
    2598:	51a7ece3          	bltu	a5,s10,32b0 <_vfprintf_r+0x18b8>
    259c:	030d0d13          	add	s10,s10,48
    25a0:	15a107a3          	sb	s10,335(sp)
    25a4:	00060e93          	mv	t4,a2
    25a8:	00100d13          	li	s10,1
    25ac:	14f10c13          	add	s8,sp,335
    25b0:	eb9ff06f          	j	2468 <_vfprintf_r+0xa70>
    25b4:	000b0313          	mv	t1,s6
    25b8:	010a6e93          	or	t4,s4,16
    25bc:	020ef793          	and	a5,t4,32
    25c0:	7e078463          	beqz	a5,2da8 <_vfprintf_r+0x13b0>
    25c4:	01412783          	lw	a5,20(sp)
    25c8:	00778b13          	add	s6,a5,7
    25cc:	ff8b7b13          	and	s6,s6,-8
    25d0:	000b2d03          	lw	s10,0(s6)
    25d4:	004b2c83          	lw	s9,4(s6)
    25d8:	008b0793          	add	a5,s6,8
    25dc:	00f12a23          	sw	a5,20(sp)
    25e0:	bffef613          	and	a2,t4,-1025
    25e4:	00000793          	li	a5,0
    25e8:	e55ff06f          	j	243c <_vfprintf_r+0xa44>
    25ec:	00094e03          	lbu	t3,0(s2)
    25f0:	06800793          	li	a5,104
    25f4:	2cfe0ce3          	beq	t3,a5,30cc <_vfprintf_r+0x16d4>
    25f8:	040a6a13          	or	s4,s4,64
    25fc:	dacff06f          	j	1ba8 <_vfprintf_r+0x1b0>
    2600:	01412703          	lw	a4,20(sp)
    2604:	000087b7          	lui	a5,0x8
    2608:	83078793          	add	a5,a5,-2000 # 7830 <quorem+0x114>
    260c:	06f11c23          	sh	a5,120(sp)
    2610:	00470793          	add	a5,a4,4
    2614:	00f12a23          	sw	a5,20(sp)
    2618:	0000c797          	auipc	a5,0xc
    261c:	46878793          	add	a5,a5,1128 # ea80 <__fini_array_end+0x124>
    2620:	02f12c23          	sw	a5,56(sp)
    2624:	00072d03          	lw	s10,0(a4)
    2628:	000b0313          	mv	t1,s6
    262c:	00000c93          	li	s9,0
    2630:	002a6613          	or	a2,s4,2
    2634:	00200793          	li	a5,2
    2638:	07800e13          	li	t3,120
    263c:	e01ff06f          	j	243c <_vfprintf_r+0xa44>
    2640:	020a7793          	and	a5,s4,32
    2644:	180784e3          	beqz	a5,2fcc <_vfprintf_r+0x15d4>
    2648:	01412783          	lw	a5,20(sp)
    264c:	00c12683          	lw	a3,12(sp)
    2650:	0007a783          	lw	a5,0(a5)
    2654:	41f6d713          	sra	a4,a3,0x1f
    2658:	00d7a023          	sw	a3,0(a5)
    265c:	00e7a223          	sw	a4,4(a5)
    2660:	01412783          	lw	a5,20(sp)
    2664:	00090c13          	mv	s8,s2
    2668:	00478793          	add	a5,a5,4
    266c:	00f12a23          	sw	a5,20(sp)
    2670:	cccff06f          	j	1b3c <_vfprintf_r+0x144>
    2674:	06500713          	li	a4,101
    2678:	b3c754e3          	bge	a4,t3,21a0 <_vfprintf_r+0x7a8>
    267c:	02812683          	lw	a3,40(sp)
    2680:	02c12703          	lw	a4,44(sp)
    2684:	00000613          	li	a2,0
    2688:	00068513          	mv	a0,a3
    268c:	00070593          	mv	a1,a4
    2690:	00000693          	li	a3,0
    2694:	05d12223          	sw	t4,68(sp)
    2698:	7700a0ef          	jal	ce08 <__eqdf2>
    269c:	04412e83          	lw	t4,68(sp)
    26a0:	4e051463          	bnez	a0,2b88 <_vfprintf_r+0x1190>
    26a4:	0a412783          	lw	a5,164(sp)
    26a8:	0000c717          	auipc	a4,0xc
    26ac:	40870713          	add	a4,a4,1032 # eab0 <__fini_array_end+0x154>
    26b0:	00e42023          	sw	a4,0(s0)
    26b4:	00148493          	add	s1,s1,1
    26b8:	00100713          	li	a4,1
    26bc:	00178793          	add	a5,a5,1
    26c0:	00e42223          	sw	a4,4(s0)
    26c4:	0a912423          	sw	s1,168(sp)
    26c8:	0af12223          	sw	a5,164(sp)
    26cc:	00700713          	li	a4,7
    26d0:	00840413          	add	s0,s0,8
    26d4:	62f746e3          	blt	a4,a5,3500 <_vfprintf_r+0x1b08>
    26d8:	07c12783          	lw	a5,124(sp)
    26dc:	01812703          	lw	a4,24(sp)
    26e0:	78e7de63          	bge	a5,a4,2e7c <_vfprintf_r+0x1484>
    26e4:	03412783          	lw	a5,52(sp)
    26e8:	03012703          	lw	a4,48(sp)
    26ec:	00840413          	add	s0,s0,8
    26f0:	fef42c23          	sw	a5,-8(s0)
    26f4:	0a412783          	lw	a5,164(sp)
    26f8:	00e484b3          	add	s1,s1,a4
    26fc:	fee42e23          	sw	a4,-4(s0)
    2700:	00178793          	add	a5,a5,1
    2704:	0a912423          	sw	s1,168(sp)
    2708:	0af12223          	sw	a5,164(sp)
    270c:	00700713          	li	a4,7
    2710:	1cf746e3          	blt	a4,a5,30dc <_vfprintf_r+0x16e4>
    2714:	01812783          	lw	a5,24(sp)
    2718:	fff78d13          	add	s10,a5,-1
    271c:	dfa05263          	blez	s10,1d00 <_vfprintf_r+0x308>
    2720:	01000713          	li	a4,16
    2724:	0a412783          	lw	a5,164(sp)
    2728:	0000d297          	auipc	t0,0xd
    272c:	84028293          	add	t0,t0,-1984 # ef68 <zeroes.0>
    2730:	77a752e3          	bge	a4,s10,3694 <_vfprintf_r+0x1c9c>
    2734:	00048713          	mv	a4,s1
    2738:	01000c13          	li	s8,16
    273c:	00700b13          	li	s6,7
    2740:	000e8493          	mv	s1,t4
    2744:	00028a13          	mv	s4,t0
    2748:	00c0006f          	j	2754 <_vfprintf_r+0xd5c>
    274c:	ff0d0d13          	add	s10,s10,-16
    2750:	73ac5ce3          	bge	s8,s10,3688 <_vfprintf_r+0x1c90>
    2754:	01070713          	add	a4,a4,16
    2758:	00178793          	add	a5,a5,1
    275c:	01442023          	sw	s4,0(s0)
    2760:	01842223          	sw	s8,4(s0)
    2764:	0ae12423          	sw	a4,168(sp)
    2768:	0af12223          	sw	a5,164(sp)
    276c:	00840413          	add	s0,s0,8
    2770:	fcfb5ee3          	bge	s6,a5,274c <_vfprintf_r+0xd54>
    2774:	00812583          	lw	a1,8(sp)
    2778:	0a010613          	add	a2,sp,160
    277c:	00098513          	mv	a0,s3
    2780:	134020ef          	jal	48b4 <__sprint_r>
    2784:	f4051263          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2788:	0a812703          	lw	a4,168(sp)
    278c:	0a412783          	lw	a5,164(sp)
    2790:	0ac10413          	add	s0,sp,172
    2794:	fb9ff06f          	j	274c <_vfprintf_r+0xd54>
    2798:	000e8613          	mv	a2,t4
    279c:	00100713          	li	a4,1
    27a0:	dee788e3          	beq	a5,a4,2590 <_vfprintf_r+0xb98>
    27a4:	00200713          	li	a4,2
    27a8:	06e78c63          	beq	a5,a4,2820 <_vfprintf_r+0xe28>
    27ac:	15010c13          	add	s8,sp,336
    27b0:	01dc9793          	sll	a5,s9,0x1d
    27b4:	007d7713          	and	a4,s10,7
    27b8:	003d5d13          	srl	s10,s10,0x3
    27bc:	03070713          	add	a4,a4,48
    27c0:	01a7ed33          	or	s10,a5,s10
    27c4:	003cdc93          	srl	s9,s9,0x3
    27c8:	feec0fa3          	sb	a4,-1(s8)
    27cc:	019d67b3          	or	a5,s10,s9
    27d0:	000c0593          	mv	a1,s8
    27d4:	fffc0c13          	add	s8,s8,-1
    27d8:	fc079ce3          	bnez	a5,27b0 <_vfprintf_r+0xdb8>
    27dc:	00167693          	and	a3,a2,1
    27e0:	06068a63          	beqz	a3,2854 <_vfprintf_r+0xe5c>
    27e4:	03000693          	li	a3,48
    27e8:	06d70663          	beq	a4,a3,2854 <_vfprintf_r+0xe5c>
    27ec:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x606>
    27f0:	15010793          	add	a5,sp,336
    27f4:	fedc0fa3          	sb	a3,-1(s8)
    27f8:	40b78d33          	sub	s10,a5,a1
    27fc:	00060e93          	mv	t4,a2
    2800:	00058c13          	mv	s8,a1
    2804:	c65ff06f          	j	2468 <_vfprintf_r+0xa70>
    2808:	00100713          	li	a4,1
    280c:	00e79463          	bne	a5,a4,2814 <_vfprintf_r+0xe1c>
    2810:	2b10106f          	j	42c0 <_vfprintf_r+0x28c8>
    2814:	00200713          	li	a4,2
    2818:	000e8613          	mv	a2,t4
    281c:	f8e798e3          	bne	a5,a4,27ac <_vfprintf_r+0xdb4>
    2820:	03812683          	lw	a3,56(sp)
    2824:	15010c13          	add	s8,sp,336
    2828:	00fd7793          	and	a5,s10,15
    282c:	00f687b3          	add	a5,a3,a5
    2830:	0007c703          	lbu	a4,0(a5)
    2834:	004d5d13          	srl	s10,s10,0x4
    2838:	01cc9793          	sll	a5,s9,0x1c
    283c:	01a7ed33          	or	s10,a5,s10
    2840:	004cdc93          	srl	s9,s9,0x4
    2844:	feec0fa3          	sb	a4,-1(s8)
    2848:	019d67b3          	or	a5,s10,s9
    284c:	fffc0c13          	add	s8,s8,-1
    2850:	fc079ce3          	bnez	a5,2828 <_vfprintf_r+0xe30>
    2854:	15010793          	add	a5,sp,336
    2858:	41878d33          	sub	s10,a5,s8
    285c:	00060e93          	mv	t4,a2
    2860:	c09ff06f          	j	2468 <_vfprintf_r+0xa70>
    2864:	419b8b33          	sub	s6,s7,s9
    2868:	c7605063          	blez	s6,1cc8 <_vfprintf_r+0x2d0>
    286c:	01000593          	li	a1,16
    2870:	0a412603          	lw	a2,164(sp)
    2874:	0000c297          	auipc	t0,0xc
    2878:	6f428293          	add	t0,t0,1780 # ef68 <zeroes.0>
    287c:	0b65d463          	bge	a1,s6,2924 <_vfprintf_r+0xf2c>
    2880:	00040793          	mv	a5,s0
    2884:	00048713          	mv	a4,s1
    2888:	000b0413          	mv	s0,s6
    288c:	01000893          	li	a7,16
    2890:	000a0b13          	mv	s6,s4
    2894:	00700f93          	li	t6,7
    2898:	05d12223          	sw	t4,68(sp)
    289c:	05c12823          	sw	t3,80(sp)
    28a0:	00030a13          	mv	s4,t1
    28a4:	00028493          	mv	s1,t0
    28a8:	00c0006f          	j	28b4 <_vfprintf_r+0xebc>
    28ac:	ff040413          	add	s0,s0,-16
    28b0:	0488da63          	bge	a7,s0,2904 <_vfprintf_r+0xf0c>
    28b4:	01070713          	add	a4,a4,16
    28b8:	00160613          	add	a2,a2,1
    28bc:	0097a023          	sw	s1,0(a5)
    28c0:	0117a223          	sw	a7,4(a5)
    28c4:	0ae12423          	sw	a4,168(sp)
    28c8:	0ac12223          	sw	a2,164(sp)
    28cc:	00878793          	add	a5,a5,8
    28d0:	fccfdee3          	bge	t6,a2,28ac <_vfprintf_r+0xeb4>
    28d4:	00812583          	lw	a1,8(sp)
    28d8:	0a010613          	add	a2,sp,160
    28dc:	00098513          	mv	a0,s3
    28e0:	7d5010ef          	jal	48b4 <__sprint_r>
    28e4:	de051263          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    28e8:	01000893          	li	a7,16
    28ec:	ff040413          	add	s0,s0,-16
    28f0:	0a812703          	lw	a4,168(sp)
    28f4:	0a412603          	lw	a2,164(sp)
    28f8:	0ac10793          	add	a5,sp,172
    28fc:	00700f93          	li	t6,7
    2900:	fa88cae3          	blt	a7,s0,28b4 <_vfprintf_r+0xebc>
    2904:	04412e83          	lw	t4,68(sp)
    2908:	05012e03          	lw	t3,80(sp)
    290c:	000a0313          	mv	t1,s4
    2910:	00048293          	mv	t0,s1
    2914:	000b0a13          	mv	s4,s6
    2918:	00070493          	mv	s1,a4
    291c:	00040b13          	mv	s6,s0
    2920:	00078413          	mv	s0,a5
    2924:	016484b3          	add	s1,s1,s6
    2928:	00160613          	add	a2,a2,1
    292c:	00542023          	sw	t0,0(s0)
    2930:	01642223          	sw	s6,4(s0)
    2934:	0a912423          	sw	s1,168(sp)
    2938:	0ac12223          	sw	a2,164(sp)
    293c:	00700713          	li	a4,7
    2940:	00840413          	add	s0,s0,8
    2944:	b8c75263          	bge	a4,a2,1cc8 <_vfprintf_r+0x2d0>
    2948:	00812583          	lw	a1,8(sp)
    294c:	0a010613          	add	a2,sp,160
    2950:	00098513          	mv	a0,s3
    2954:	04612a23          	sw	t1,84(sp)
    2958:	05c12823          	sw	t3,80(sp)
    295c:	05d12223          	sw	t4,68(sp)
    2960:	755010ef          	jal	48b4 <__sprint_r>
    2964:	d6051263          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2968:	0a812483          	lw	s1,168(sp)
    296c:	05412303          	lw	t1,84(sp)
    2970:	05012e03          	lw	t3,80(sp)
    2974:	04412e83          	lw	t4,68(sp)
    2978:	0ac10413          	add	s0,sp,172
    297c:	b4cff06f          	j	1cc8 <_vfprintf_r+0x2d0>
    2980:	01000713          	li	a4,16
    2984:	0a412603          	lw	a2,164(sp)
    2988:	0000c297          	auipc	t0,0xc
    298c:	5e028293          	add	t0,t0,1504 # ef68 <zeroes.0>
    2990:	0b675063          	bge	a4,s6,2a30 <_vfprintf_r+0x1038>
    2994:	00040793          	mv	a5,s0
    2998:	00048693          	mv	a3,s1
    299c:	000b0413          	mv	s0,s6
    29a0:	01000713          	li	a4,16
    29a4:	00700893          	li	a7,7
    29a8:	05d12223          	sw	t4,68(sp)
    29ac:	000e0493          	mv	s1,t3
    29b0:	00028b13          	mv	s6,t0
    29b4:	00c0006f          	j	29c0 <_vfprintf_r+0xfc8>
    29b8:	ff040413          	add	s0,s0,-16
    29bc:	04875e63          	bge	a4,s0,2a18 <_vfprintf_r+0x1020>
    29c0:	01068693          	add	a3,a3,16
    29c4:	00160613          	add	a2,a2,1
    29c8:	0000c597          	auipc	a1,0xc
    29cc:	5a058593          	add	a1,a1,1440 # ef68 <zeroes.0>
    29d0:	00b7a023          	sw	a1,0(a5)
    29d4:	00e7a223          	sw	a4,4(a5)
    29d8:	0ad12423          	sw	a3,168(sp)
    29dc:	0ac12223          	sw	a2,164(sp)
    29e0:	00878793          	add	a5,a5,8
    29e4:	fcc8dae3          	bge	a7,a2,29b8 <_vfprintf_r+0xfc0>
    29e8:	00812583          	lw	a1,8(sp)
    29ec:	0a010613          	add	a2,sp,160
    29f0:	00098513          	mv	a0,s3
    29f4:	6c1010ef          	jal	48b4 <__sprint_r>
    29f8:	cc051863          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    29fc:	01000713          	li	a4,16
    2a00:	ff040413          	add	s0,s0,-16
    2a04:	0a812683          	lw	a3,168(sp)
    2a08:	0a412603          	lw	a2,164(sp)
    2a0c:	0ac10793          	add	a5,sp,172
    2a10:	00700893          	li	a7,7
    2a14:	fa8746e3          	blt	a4,s0,29c0 <_vfprintf_r+0xfc8>
    2a18:	04412e83          	lw	t4,68(sp)
    2a1c:	00048e13          	mv	t3,s1
    2a20:	000b0293          	mv	t0,s6
    2a24:	00068493          	mv	s1,a3
    2a28:	00040b13          	mv	s6,s0
    2a2c:	00078413          	mv	s0,a5
    2a30:	016484b3          	add	s1,s1,s6
    2a34:	00160613          	add	a2,a2,1
    2a38:	00542023          	sw	t0,0(s0)
    2a3c:	01642223          	sw	s6,4(s0)
    2a40:	0a912423          	sw	s1,168(sp)
    2a44:	0ac12223          	sw	a2,164(sp)
    2a48:	00700713          	li	a4,7
    2a4c:	00840413          	add	s0,s0,8
    2a50:	a8c75063          	bge	a4,a2,1cd0 <_vfprintf_r+0x2d8>
    2a54:	00812583          	lw	a1,8(sp)
    2a58:	0a010613          	add	a2,sp,160
    2a5c:	00098513          	mv	a0,s3
    2a60:	05c12823          	sw	t3,80(sp)
    2a64:	05d12223          	sw	t4,68(sp)
    2a68:	64d010ef          	jal	48b4 <__sprint_r>
    2a6c:	c4051e63          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2a70:	0a812483          	lw	s1,168(sp)
    2a74:	05012e03          	lw	t3,80(sp)
    2a78:	04412e83          	lw	t4,68(sp)
    2a7c:	0ac10413          	add	s0,sp,172
    2a80:	a50ff06f          	j	1cd0 <_vfprintf_r+0x2d8>
    2a84:	00812583          	lw	a1,8(sp)
    2a88:	0a010613          	add	a2,sp,160
    2a8c:	00098513          	mv	a0,s3
    2a90:	04612c23          	sw	t1,88(sp)
    2a94:	05c12a23          	sw	t3,84(sp)
    2a98:	05d12823          	sw	t4,80(sp)
    2a9c:	05f12223          	sw	t6,68(sp)
    2aa0:	615010ef          	jal	48b4 <__sprint_r>
    2aa4:	c2051263          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2aa8:	0a812483          	lw	s1,168(sp)
    2aac:	05812303          	lw	t1,88(sp)
    2ab0:	05412e03          	lw	t3,84(sp)
    2ab4:	05012e83          	lw	t4,80(sp)
    2ab8:	04412f83          	lw	t6,68(sp)
    2abc:	0ac10413          	add	s0,sp,172
    2ac0:	a00ff06f          	j	1cc0 <_vfprintf_r+0x2c8>
    2ac4:	01000713          	li	a4,16
    2ac8:	0a412783          	lw	a5,164(sp)
    2acc:	0000cb17          	auipc	s6,0xc
    2ad0:	4acb0b13          	add	s6,s6,1196 # ef78 <blanks.1>
    2ad4:	07a75c63          	bge	a4,s10,2b4c <_vfprintf_r+0x1154>
    2ad8:	000b0713          	mv	a4,s6
    2adc:	01000c13          	li	s8,16
    2ae0:	00090b13          	mv	s6,s2
    2ae4:	00700a13          	li	s4,7
    2ae8:	00070913          	mv	s2,a4
    2aec:	00c0006f          	j	2af8 <_vfprintf_r+0x1100>
    2af0:	ff0d0d13          	add	s10,s10,-16
    2af4:	05ac5663          	bge	s8,s10,2b40 <_vfprintf_r+0x1148>
    2af8:	01048493          	add	s1,s1,16
    2afc:	00178793          	add	a5,a5,1
    2b00:	01242023          	sw	s2,0(s0)
    2b04:	01842223          	sw	s8,4(s0)
    2b08:	0a912423          	sw	s1,168(sp)
    2b0c:	0af12223          	sw	a5,164(sp)
    2b10:	00840413          	add	s0,s0,8
    2b14:	fcfa5ee3          	bge	s4,a5,2af0 <_vfprintf_r+0x10f8>
    2b18:	00812583          	lw	a1,8(sp)
    2b1c:	0a010613          	add	a2,sp,160
    2b20:	00098513          	mv	a0,s3
    2b24:	591010ef          	jal	48b4 <__sprint_r>
    2b28:	ba051063          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2b2c:	ff0d0d13          	add	s10,s10,-16
    2b30:	0a812483          	lw	s1,168(sp)
    2b34:	0a412783          	lw	a5,164(sp)
    2b38:	0ac10413          	add	s0,sp,172
    2b3c:	fbac4ee3          	blt	s8,s10,2af8 <_vfprintf_r+0x1100>
    2b40:	00090713          	mv	a4,s2
    2b44:	000b0913          	mv	s2,s6
    2b48:	00070b13          	mv	s6,a4
    2b4c:	01a484b3          	add	s1,s1,s10
    2b50:	00178793          	add	a5,a5,1
    2b54:	01642023          	sw	s6,0(s0)
    2b58:	01a42223          	sw	s10,4(s0)
    2b5c:	0a912423          	sw	s1,168(sp)
    2b60:	0af12223          	sw	a5,164(sp)
    2b64:	00700713          	li	a4,7
    2b68:	9af75463          	bge	a4,a5,1d10 <_vfprintf_r+0x318>
    2b6c:	00812583          	lw	a1,8(sp)
    2b70:	0a010613          	add	a2,sp,160
    2b74:	00098513          	mv	a0,s3
    2b78:	53d010ef          	jal	48b4 <__sprint_r>
    2b7c:	b4051663          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2b80:	0a812483          	lw	s1,168(sp)
    2b84:	98cff06f          	j	1d10 <_vfprintf_r+0x318>
    2b88:	07c12683          	lw	a3,124(sp)
    2b8c:	30d05c63          	blez	a3,2ea4 <_vfprintf_r+0x14ac>
    2b90:	01812783          	lw	a5,24(sp)
    2b94:	000a0b13          	mv	s6,s4
    2b98:	0147d463          	bge	a5,s4,2ba0 <_vfprintf_r+0x11a8>
    2b9c:	00078b13          	mv	s6,a5
    2ba0:	03605863          	blez	s6,2bd0 <_vfprintf_r+0x11d8>
    2ba4:	0a412683          	lw	a3,164(sp)
    2ba8:	016484b3          	add	s1,s1,s6
    2bac:	01842023          	sw	s8,0(s0)
    2bb0:	00168693          	add	a3,a3,1
    2bb4:	01642223          	sw	s6,4(s0)
    2bb8:	0a912423          	sw	s1,168(sp)
    2bbc:	0ad12223          	sw	a3,164(sp)
    2bc0:	00700613          	li	a2,7
    2bc4:	00840413          	add	s0,s0,8
    2bc8:	00d65463          	bge	a2,a3,2bd0 <_vfprintf_r+0x11d8>
    2bcc:	5c40106f          	j	4190 <_vfprintf_r+0x2798>
    2bd0:	fffb4693          	not	a3,s6
    2bd4:	41f6d693          	sra	a3,a3,0x1f
    2bd8:	00db7733          	and	a4,s6,a3
    2bdc:	40ea0b33          	sub	s6,s4,a4
    2be0:	35604ae3          	bgtz	s6,3734 <_vfprintf_r+0x1d3c>
    2be4:	400ef713          	and	a4,t4,1024
    2be8:	014c0333          	add	t1,s8,s4
    2bec:	00070463          	beqz	a4,2bf4 <_vfprintf_r+0x11fc>
    2bf0:	2980106f          	j	3e88 <_vfprintf_r+0x2490>
    2bf4:	07c12d03          	lw	s10,124(sp)
    2bf8:	01812783          	lw	a5,24(sp)
    2bfc:	5afd4063          	blt	s10,a5,319c <_vfprintf_r+0x17a4>
    2c00:	001ef713          	and	a4,t4,1
    2c04:	58071c63          	bnez	a4,319c <_vfprintf_r+0x17a4>
    2c08:	01812703          	lw	a4,24(sp)
    2c0c:	00ec07b3          	add	a5,s8,a4
    2c10:	41a70d33          	sub	s10,a4,s10
    2c14:	40678b33          	sub	s6,a5,t1
    2c18:	016d5463          	bge	s10,s6,2c20 <_vfprintf_r+0x1228>
    2c1c:	000d0b13          	mv	s6,s10
    2c20:	03605863          	blez	s6,2c50 <_vfprintf_r+0x1258>
    2c24:	0a412703          	lw	a4,164(sp)
    2c28:	016484b3          	add	s1,s1,s6
    2c2c:	00642023          	sw	t1,0(s0)
    2c30:	00170713          	add	a4,a4,1
    2c34:	01642223          	sw	s6,4(s0)
    2c38:	0a912423          	sw	s1,168(sp)
    2c3c:	0ae12223          	sw	a4,164(sp)
    2c40:	00700693          	li	a3,7
    2c44:	00840413          	add	s0,s0,8
    2c48:	00e6d463          	bge	a3,a4,2c50 <_vfprintf_r+0x1258>
    2c4c:	5880106f          	j	41d4 <_vfprintf_r+0x27dc>
    2c50:	fffb4713          	not	a4,s6
    2c54:	41f75713          	sra	a4,a4,0x1f
    2c58:	00eb77b3          	and	a5,s6,a4
    2c5c:	40fd0d33          	sub	s10,s10,a5
    2c60:	8ba05063          	blez	s10,1d00 <_vfprintf_r+0x308>
    2c64:	01000713          	li	a4,16
    2c68:	0a412783          	lw	a5,164(sp)
    2c6c:	0000c297          	auipc	t0,0xc
    2c70:	2fc28293          	add	t0,t0,764 # ef68 <zeroes.0>
    2c74:	23a750e3          	bge	a4,s10,3694 <_vfprintf_r+0x1c9c>
    2c78:	00048713          	mv	a4,s1
    2c7c:	01000c13          	li	s8,16
    2c80:	00700b13          	li	s6,7
    2c84:	000e8493          	mv	s1,t4
    2c88:	00028a13          	mv	s4,t0
    2c8c:	00c0006f          	j	2c98 <_vfprintf_r+0x12a0>
    2c90:	ff0d0d13          	add	s10,s10,-16
    2c94:	1fac5ae3          	bge	s8,s10,3688 <_vfprintf_r+0x1c90>
    2c98:	01070713          	add	a4,a4,16
    2c9c:	00178793          	add	a5,a5,1
    2ca0:	01442023          	sw	s4,0(s0)
    2ca4:	01842223          	sw	s8,4(s0)
    2ca8:	0ae12423          	sw	a4,168(sp)
    2cac:	0af12223          	sw	a5,164(sp)
    2cb0:	00840413          	add	s0,s0,8
    2cb4:	fcfb5ee3          	bge	s6,a5,2c90 <_vfprintf_r+0x1298>
    2cb8:	00812583          	lw	a1,8(sp)
    2cbc:	0a010613          	add	a2,sp,160
    2cc0:	00098513          	mv	a0,s3
    2cc4:	3f1010ef          	jal	48b4 <__sprint_r>
    2cc8:	a0051063          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2ccc:	0a812703          	lw	a4,168(sp)
    2cd0:	0a412783          	lw	a5,164(sp)
    2cd4:	0ac10413          	add	s0,sp,172
    2cd8:	fb9ff06f          	j	2c90 <_vfprintf_r+0x1298>
    2cdc:	001ef613          	and	a2,t4,1
    2ce0:	ce061063          	bnez	a2,21c0 <_vfprintf_r+0x7c8>
    2ce4:	00d42223          	sw	a3,4(s0)
    2ce8:	0a912423          	sw	s1,168(sp)
    2cec:	0ba12223          	sw	s10,164(sp)
    2cf0:	00700793          	li	a5,7
    2cf4:	d7a7d863          	bge	a5,s10,2264 <_vfprintf_r+0x86c>
    2cf8:	00812583          	lw	a1,8(sp)
    2cfc:	0a010613          	add	a2,sp,160
    2d00:	00098513          	mv	a0,s3
    2d04:	03d12023          	sw	t4,32(sp)
    2d08:	3ad010ef          	jal	48b4 <__sprint_r>
    2d0c:	9a051e63          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2d10:	0a812483          	lw	s1,168(sp)
    2d14:	0a412d03          	lw	s10,164(sp)
    2d18:	02012e83          	lw	t4,32(sp)
    2d1c:	0ac10b13          	add	s6,sp,172
    2d20:	d44ff06f          	j	2264 <_vfprintf_r+0x86c>
    2d24:	01812703          	lw	a4,24(sp)
    2d28:	00100793          	li	a5,1
    2d2c:	d2e7dc63          	bge	a5,a4,2264 <_vfprintf_r+0x86c>
    2d30:	01100793          	li	a5,17
    2d34:	0000c297          	auipc	t0,0xc
    2d38:	23428293          	add	t0,t0,564 # ef68 <zeroes.0>
    2d3c:	18e7d4e3          	bge	a5,a4,36c4 <_vfprintf_r+0x1ccc>
    2d40:	00040a13          	mv	s4,s0
    2d44:	01000793          	li	a5,16
    2d48:	00700c13          	li	s8,7
    2d4c:	03d12023          	sw	t4,32(sp)
    2d50:	00028413          	mv	s0,t0
    2d54:	00c0006f          	j	2d60 <_vfprintf_r+0x1368>
    2d58:	ff0a0a13          	add	s4,s4,-16
    2d5c:	1547dee3          	bge	a5,s4,36b8 <_vfprintf_r+0x1cc0>
    2d60:	01048493          	add	s1,s1,16
    2d64:	001d0d13          	add	s10,s10,1
    2d68:	008b2023          	sw	s0,0(s6)
    2d6c:	00fb2223          	sw	a5,4(s6)
    2d70:	0a912423          	sw	s1,168(sp)
    2d74:	0ba12223          	sw	s10,164(sp)
    2d78:	008b0b13          	add	s6,s6,8
    2d7c:	fdac5ee3          	bge	s8,s10,2d58 <_vfprintf_r+0x1360>
    2d80:	00812583          	lw	a1,8(sp)
    2d84:	0a010613          	add	a2,sp,160
    2d88:	00098513          	mv	a0,s3
    2d8c:	329010ef          	jal	48b4 <__sprint_r>
    2d90:	92051c63          	bnez	a0,1ec8 <_vfprintf_r+0x4d0>
    2d94:	0a812483          	lw	s1,168(sp)
    2d98:	0a412d03          	lw	s10,164(sp)
    2d9c:	0ac10b13          	add	s6,sp,172
    2da0:	01000793          	li	a5,16
    2da4:	fb5ff06f          	j	2d58 <_vfprintf_r+0x1360>
    2da8:	01412703          	lw	a4,20(sp)
    2dac:	010ef793          	and	a5,t4,16
    2db0:	00072d03          	lw	s10,0(a4)
    2db4:	00470713          	add	a4,a4,4
    2db8:	00e12a23          	sw	a4,20(sp)
    2dbc:	1a079663          	bnez	a5,2f68 <_vfprintf_r+0x1570>
    2dc0:	040ef793          	and	a5,t4,64
    2dc4:	18078e63          	beqz	a5,2f60 <_vfprintf_r+0x1568>
    2dc8:	010d1d13          	sll	s10,s10,0x10
    2dcc:	010d5d13          	srl	s10,s10,0x10
    2dd0:	00000c93          	li	s9,0
    2dd4:	80dff06f          	j	25e0 <_vfprintf_r+0xbe8>
    2dd8:	01412703          	lw	a4,20(sp)
    2ddc:	01067793          	and	a5,a2,16
    2de0:	00072d03          	lw	s10,0(a4)
    2de4:	00470713          	add	a4,a4,4
    2de8:	00e12a23          	sw	a4,20(sp)
    2dec:	14079a63          	bnez	a5,2f40 <_vfprintf_r+0x1548>
    2df0:	04067793          	and	a5,a2,64
    2df4:	14078063          	beqz	a5,2f34 <_vfprintf_r+0x153c>
    2df8:	010d1d13          	sll	s10,s10,0x10
    2dfc:	010d5d13          	srl	s10,s10,0x10
    2e00:	00000c93          	li	s9,0
    2e04:	00100793          	li	a5,1
    2e08:	e34ff06f          	j	243c <_vfprintf_r+0xa44>
    2e0c:	01412703          	lw	a4,20(sp)
    2e10:	010ef793          	and	a5,t4,16
    2e14:	00072d03          	lw	s10,0(a4)
    2e18:	00470713          	add	a4,a4,4
    2e1c:	00e12a23          	sw	a4,20(sp)
    2e20:	12079a63          	bnez	a5,2f54 <_vfprintf_r+0x155c>
    2e24:	040ef793          	and	a5,t4,64
    2e28:	12078263          	beqz	a5,2f4c <_vfprintf_r+0x1554>
    2e2c:	010d1d13          	sll	s10,s10,0x10
    2e30:	410d5d13          	sra	s10,s10,0x10
    2e34:	41fd5c93          	sra	s9,s10,0x1f
    2e38:	000c8793          	mv	a5,s9
    2e3c:	f207d663          	bgez	a5,2568 <_vfprintf_r+0xb70>
    2e40:	01a037b3          	snez	a5,s10
    2e44:	419000b3          	neg	ra,s9
    2e48:	40f08cb3          	sub	s9,ra,a5
    2e4c:	41a00d33          	neg	s10,s10
    2e50:	000e8613          	mv	a2,t4
    2e54:	02d00713          	li	a4,45
    2e58:	00100793          	li	a5,1
    2e5c:	de4ff06f          	j	2440 <_vfprintf_r+0xa48>
    2e60:	00812403          	lw	s0,8(sp)
    2e64:	00f12623          	sw	a5,12(sp)
    2e68:	05842503          	lw	a0,88(s0)
    2e6c:	6e8040ef          	jal	7554 <__retarget_lock_acquire_recursive>
    2e70:	00c41703          	lh	a4,12(s0)
    2e74:	00c12783          	lw	a5,12(sp)
    2e78:	c01fe06f          	j	1a78 <_vfprintf_r+0x80>
    2e7c:	001ef793          	and	a5,t4,1
    2e80:	00079463          	bnez	a5,2e88 <_vfprintf_r+0x1490>
    2e84:	e7dfe06f          	j	1d00 <_vfprintf_r+0x308>
    2e88:	85dff06f          	j	26e4 <_vfprintf_r+0xcec>
    2e8c:	000a0e93          	mv	t4,s4
    2e90:	000b0313          	mv	t1,s6
    2e94:	ea8ff06f          	j	253c <_vfprintf_r+0xb44>
    2e98:	00094e03          	lbu	t3,0(s2)
    2e9c:	00f12a23          	sw	a5,20(sp)
    2ea0:	d09fe06f          	j	1ba8 <_vfprintf_r+0x1b0>
    2ea4:	0a412703          	lw	a4,164(sp)
    2ea8:	0000c617          	auipc	a2,0xc
    2eac:	c0860613          	add	a2,a2,-1016 # eab0 <__fini_array_end+0x154>
    2eb0:	00c42023          	sw	a2,0(s0)
    2eb4:	00148493          	add	s1,s1,1
    2eb8:	00100613          	li	a2,1
    2ebc:	00170713          	add	a4,a4,1
    2ec0:	00c42223          	sw	a2,4(s0)
    2ec4:	0a912423          	sw	s1,168(sp)
    2ec8:	0ae12223          	sw	a4,164(sp)
    2ecc:	00700613          	li	a2,7
    2ed0:	00840413          	add	s0,s0,8
    2ed4:	2ee64ce3          	blt	a2,a4,39cc <_vfprintf_r+0x1fd4>
    2ed8:	7e069e63          	bnez	a3,36d4 <_vfprintf_r+0x1cdc>
    2edc:	01812783          	lw	a5,24(sp)
    2ee0:	001ef713          	and	a4,t4,1
    2ee4:	00f76733          	or	a4,a4,a5
    2ee8:	00071463          	bnez	a4,2ef0 <_vfprintf_r+0x14f8>
    2eec:	e15fe06f          	j	1d00 <_vfprintf_r+0x308>
    2ef0:	03412703          	lw	a4,52(sp)
    2ef4:	03012783          	lw	a5,48(sp)
    2ef8:	00700693          	li	a3,7
    2efc:	00e42023          	sw	a4,0(s0)
    2f00:	0a412703          	lw	a4,164(sp)
    2f04:	009784b3          	add	s1,a5,s1
    2f08:	00f42223          	sw	a5,4(s0)
    2f0c:	00170713          	add	a4,a4,1
    2f10:	0a912423          	sw	s1,168(sp)
    2f14:	0ae12223          	sw	a4,164(sp)
    2f18:	38e6c8e3          	blt	a3,a4,3aa8 <_vfprintf_r+0x20b0>
    2f1c:	00840413          	add	s0,s0,8
    2f20:	7e80006f          	j	3708 <_vfprintf_r+0x1d10>
    2f24:	03000793          	li	a5,48
    2f28:	14f107a3          	sb	a5,335(sp)
    2f2c:	14f10c13          	add	s8,sp,335
    2f30:	d38ff06f          	j	2468 <_vfprintf_r+0xa70>
    2f34:	20067793          	and	a5,a2,512
    2f38:	00078463          	beqz	a5,2f40 <_vfprintf_r+0x1548>
    2f3c:	0ffd7d13          	zext.b	s10,s10
    2f40:	00000c93          	li	s9,0
    2f44:	00100793          	li	a5,1
    2f48:	cf4ff06f          	j	243c <_vfprintf_r+0xa44>
    2f4c:	200ef793          	and	a5,t4,512
    2f50:	2c0796e3          	bnez	a5,3a1c <_vfprintf_r+0x2024>
    2f54:	41fd5c93          	sra	s9,s10,0x1f
    2f58:	000c8793          	mv	a5,s9
    2f5c:	e08ff06f          	j	2564 <_vfprintf_r+0xb6c>
    2f60:	200ef793          	and	a5,t4,512
    2f64:	2a0790e3          	bnez	a5,3a04 <_vfprintf_r+0x200c>
    2f68:	00000c93          	li	s9,0
    2f6c:	e74ff06f          	j	25e0 <_vfprintf_r+0xbe8>
    2f70:	01412783          	lw	a5,20(sp)
    2f74:	06010513          	add	a0,sp,96
    2f78:	03612223          	sw	s6,36(sp)
    2f7c:	0007a703          	lw	a4,0(a5)
    2f80:	03c12023          	sw	t3,32(sp)
    2f84:	00478b13          	add	s6,a5,4
    2f88:	00072683          	lw	a3,0(a4)
    2f8c:	01412823          	sw	s4,16(sp)
    2f90:	06d12023          	sw	a3,96(sp)
    2f94:	00472683          	lw	a3,4(a4)
    2f98:	06d12223          	sw	a3,100(sp)
    2f9c:	00872683          	lw	a3,8(a4)
    2fa0:	06d12423          	sw	a3,104(sp)
    2fa4:	00c72703          	lw	a4,12(a4)
    2fa8:	06e12623          	sw	a4,108(sp)
    2fac:	3dc0b0ef          	jal	e388 <__trunctfdf2>
    2fb0:	02012e03          	lw	t3,32(sp)
    2fb4:	02412303          	lw	t1,36(sp)
    2fb8:	02a12423          	sw	a0,40(sp)
    2fbc:	02b12623          	sw	a1,44(sp)
    2fc0:	01612a23          	sw	s6,20(sp)
    2fc4:	000a0e93          	mv	t4,s4
    2fc8:	fb1fe06f          	j	1f78 <_vfprintf_r+0x580>
    2fcc:	010a7793          	and	a5,s4,16
    2fd0:	6c079a63          	bnez	a5,36a4 <_vfprintf_r+0x1cac>
    2fd4:	040a7793          	and	a5,s4,64
    2fd8:	24079ce3          	bnez	a5,3a30 <_vfprintf_r+0x2038>
    2fdc:	200a7f13          	and	t5,s4,512
    2fe0:	6c0f0263          	beqz	t5,36a4 <_vfprintf_r+0x1cac>
    2fe4:	01412783          	lw	a5,20(sp)
    2fe8:	00c12703          	lw	a4,12(sp)
    2fec:	0007a783          	lw	a5,0(a5)
    2ff0:	00e78023          	sb	a4,0(a5)
    2ff4:	e6cff06f          	j	2660 <_vfprintf_r+0xc68>
    2ff8:	03c12783          	lw	a5,60(sp)
    2ffc:	00094e03          	lbu	t3,0(s2)
    3000:	00079463          	bnez	a5,3008 <_vfprintf_r+0x1610>
    3004:	ba5fe06f          	j	1ba8 <_vfprintf_r+0x1b0>
    3008:	0007c783          	lbu	a5,0(a5)
    300c:	00079463          	bnez	a5,3014 <_vfprintf_r+0x161c>
    3010:	b99fe06f          	j	1ba8 <_vfprintf_r+0x1b0>
    3014:	400a6a13          	or	s4,s4,1024
    3018:	b91fe06f          	j	1ba8 <_vfprintf_r+0x1b0>
    301c:	fff00b13          	li	s6,-1
    3020:	00068913          	mv	s2,a3
    3024:	b89fe06f          	j	1bac <_vfprintf_r+0x1b4>
    3028:	0000c797          	auipc	a5,0xc
    302c:	a6c78793          	add	a5,a5,-1428 # ea94 <__fini_array_end+0x138>
    3030:	000a0e93          	mv	t4,s4
    3034:	000b0313          	mv	t1,s6
    3038:	02f12c23          	sw	a5,56(sp)
    303c:	020ef793          	and	a5,t4,32
    3040:	1c078263          	beqz	a5,3204 <_vfprintf_r+0x180c>
    3044:	01412783          	lw	a5,20(sp)
    3048:	00778b13          	add	s6,a5,7
    304c:	ff8b7b13          	and	s6,s6,-8
    3050:	000b2d03          	lw	s10,0(s6)
    3054:	004b2c83          	lw	s9,4(s6)
    3058:	008b0793          	add	a5,s6,8
    305c:	00f12a23          	sw	a5,20(sp)
    3060:	001ef793          	and	a5,t4,1
    3064:	00078e63          	beqz	a5,3080 <_vfprintf_r+0x1688>
    3068:	019d67b3          	or	a5,s10,s9
    306c:	00078a63          	beqz	a5,3080 <_vfprintf_r+0x1688>
    3070:	03000793          	li	a5,48
    3074:	06f10c23          	sb	a5,120(sp)
    3078:	07c10ca3          	sb	t3,121(sp)
    307c:	002eee93          	or	t4,t4,2
    3080:	bffef613          	and	a2,t4,-1025
    3084:	00200793          	li	a5,2
    3088:	bb4ff06f          	j	243c <_vfprintf_r+0xa44>
    308c:	000b0313          	mv	t1,s6
    3090:	000a0613          	mv	a2,s4
    3094:	b80ff06f          	j	2414 <_vfprintf_r+0xa1c>
    3098:	000a0e93          	mv	t4,s4
    309c:	000b0313          	mv	t1,s6
    30a0:	d1cff06f          	j	25bc <_vfprintf_r+0xbc4>
    30a4:	0000c797          	auipc	a5,0xc
    30a8:	9dc78793          	add	a5,a5,-1572 # ea80 <__fini_array_end+0x124>
    30ac:	000a0e93          	mv	t4,s4
    30b0:	000b0313          	mv	t1,s6
    30b4:	02f12c23          	sw	a5,56(sp)
    30b8:	f85ff06f          	j	303c <_vfprintf_r+0x1644>
    30bc:	00194e03          	lbu	t3,1(s2)
    30c0:	020a6a13          	or	s4,s4,32
    30c4:	00190913          	add	s2,s2,1
    30c8:	ae1fe06f          	j	1ba8 <_vfprintf_r+0x1b0>
    30cc:	00194e03          	lbu	t3,1(s2)
    30d0:	200a6a13          	or	s4,s4,512
    30d4:	00190913          	add	s2,s2,1
    30d8:	ad1fe06f          	j	1ba8 <_vfprintf_r+0x1b0>
    30dc:	00812583          	lw	a1,8(sp)
    30e0:	0a010613          	add	a2,sp,160
    30e4:	00098513          	mv	a0,s3
    30e8:	03d12023          	sw	t4,32(sp)
    30ec:	7c8010ef          	jal	48b4 <__sprint_r>
    30f0:	00050463          	beqz	a0,30f8 <_vfprintf_r+0x1700>
    30f4:	dd5fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    30f8:	0a812483          	lw	s1,168(sp)
    30fc:	02012e83          	lw	t4,32(sp)
    3100:	0ac10413          	add	s0,sp,172
    3104:	e10ff06f          	j	2714 <_vfprintf_r+0xd1c>
    3108:	00600793          	li	a5,6
    310c:	00030c93          	mv	s9,t1
    3110:	0e67e6e3          	bltu	a5,t1,39fc <_vfprintf_r+0x2004>
    3114:	01612a23          	sw	s6,20(sp)
    3118:	00012823          	sw	zero,16(sp)
    311c:	000c8d13          	mv	s10,s9
    3120:	00000613          	li	a2,0
    3124:	00000313          	li	t1,0
    3128:	02012223          	sw	zero,36(sp)
    312c:	02012023          	sw	zero,32(sp)
    3130:	00000a13          	li	s4,0
    3134:	0000cc17          	auipc	s8,0xc
    3138:	974c0c13          	add	s8,s8,-1676 # eaa8 <__fini_array_end+0x14c>
    313c:	afdfe06f          	j	1c38 <_vfprintf_r+0x240>
    3140:	00800613          	li	a2,8
    3144:	00000593          	li	a1,0
    3148:	09810513          	add	a0,sp,152
    314c:	03c12023          	sw	t3,32(sp)
    3150:	01d12823          	sw	t4,16(sp)
    3154:	951fd0ef          	jal	aa4 <memset>
    3158:	01412783          	lw	a5,20(sp)
    315c:	0ec10c13          	add	s8,sp,236
    3160:	09810693          	add	a3,sp,152
    3164:	0007a603          	lw	a2,0(a5)
    3168:	000c0593          	mv	a1,s8
    316c:	00098513          	mv	a0,s3
    3170:	2b4070ef          	jal	a424 <_wcrtomb_r>
    3174:	fff00793          	li	a5,-1
    3178:	01012e83          	lw	t4,16(sp)
    317c:	02012e03          	lw	t3,32(sp)
    3180:	00050d13          	mv	s10,a0
    3184:	00f51463          	bne	a0,a5,318c <_vfprintf_r+0x1794>
    3188:	4980106f          	j	4620 <_vfprintf_r+0x2c28>
    318c:	fff54813          	not	a6,a0
    3190:	41f85813          	sra	a6,a6,0x1f
    3194:	01057cb3          	and	s9,a0,a6
    3198:	97cff06f          	j	2314 <_vfprintf_r+0x91c>
    319c:	03412703          	lw	a4,52(sp)
    31a0:	03012783          	lw	a5,48(sp)
    31a4:	00700693          	li	a3,7
    31a8:	00e42023          	sw	a4,0(s0)
    31ac:	0a412703          	lw	a4,164(sp)
    31b0:	00f484b3          	add	s1,s1,a5
    31b4:	00f42223          	sw	a5,4(s0)
    31b8:	00170713          	add	a4,a4,1
    31bc:	0a912423          	sw	s1,168(sp)
    31c0:	0ae12223          	sw	a4,164(sp)
    31c4:	00840413          	add	s0,s0,8
    31c8:	a4e6d0e3          	bge	a3,a4,2c08 <_vfprintf_r+0x1210>
    31cc:	00812583          	lw	a1,8(sp)
    31d0:	0a010613          	add	a2,sp,160
    31d4:	00098513          	mv	a0,s3
    31d8:	02612223          	sw	t1,36(sp)
    31dc:	03d12023          	sw	t4,32(sp)
    31e0:	6d4010ef          	jal	48b4 <__sprint_r>
    31e4:	00050463          	beqz	a0,31ec <_vfprintf_r+0x17f4>
    31e8:	ce1fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    31ec:	07c12d03          	lw	s10,124(sp)
    31f0:	0a812483          	lw	s1,168(sp)
    31f4:	02412303          	lw	t1,36(sp)
    31f8:	02012e83          	lw	t4,32(sp)
    31fc:	0ac10413          	add	s0,sp,172
    3200:	a09ff06f          	j	2c08 <_vfprintf_r+0x1210>
    3204:	01412703          	lw	a4,20(sp)
    3208:	010ef793          	and	a5,t4,16
    320c:	00072d03          	lw	s10,0(a4)
    3210:	00470713          	add	a4,a4,4
    3214:	00e12a23          	sw	a4,20(sp)
    3218:	08079863          	bnez	a5,32a8 <_vfprintf_r+0x18b0>
    321c:	040ef793          	and	a5,t4,64
    3220:	08078063          	beqz	a5,32a0 <_vfprintf_r+0x18a8>
    3224:	010d1d13          	sll	s10,s10,0x10
    3228:	010d5d13          	srl	s10,s10,0x10
    322c:	00000c93          	li	s9,0
    3230:	e31ff06f          	j	3060 <_vfprintf_r+0x1668>
    3234:	00000d13          	li	s10,0
    3238:	15010c13          	add	s8,sp,336
    323c:	a2cff06f          	j	2468 <_vfprintf_r+0xa70>
    3240:	00812583          	lw	a1,8(sp)
    3244:	0a010613          	add	a2,sp,160
    3248:	00098513          	mv	a0,s3
    324c:	03d12023          	sw	t4,32(sp)
    3250:	664010ef          	jal	48b4 <__sprint_r>
    3254:	00050463          	beqz	a0,325c <_vfprintf_r+0x1864>
    3258:	c71fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    325c:	0a812483          	lw	s1,168(sp)
    3260:	0a412d03          	lw	s10,164(sp)
    3264:	02012e83          	lw	t4,32(sp)
    3268:	0ac10b13          	add	s6,sp,172
    326c:	f71fe06f          	j	21dc <_vfprintf_r+0x7e4>
    3270:	00812583          	lw	a1,8(sp)
    3274:	0a010613          	add	a2,sp,160
    3278:	00098513          	mv	a0,s3
    327c:	03d12023          	sw	t4,32(sp)
    3280:	634010ef          	jal	48b4 <__sprint_r>
    3284:	00050463          	beqz	a0,328c <_vfprintf_r+0x1894>
    3288:	c41fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    328c:	0a812483          	lw	s1,168(sp)
    3290:	0a412d03          	lw	s10,164(sp)
    3294:	02012e83          	lw	t4,32(sp)
    3298:	0ac10b13          	add	s6,sp,172
    329c:	f71fe06f          	j	220c <_vfprintf_r+0x814>
    32a0:	200ef793          	and	a5,t4,512
    32a4:	76079663          	bnez	a5,3a10 <_vfprintf_r+0x2018>
    32a8:	00000c93          	li	s9,0
    32ac:	db5ff06f          	j	3060 <_vfprintf_r+0x1668>
    32b0:	00000793          	li	a5,0
    32b4:	15010b13          	add	s6,sp,336
    32b8:	01212823          	sw	s2,16(sp)
    32bc:	00078913          	mv	s2,a5
    32c0:	00098793          	mv	a5,s3
    32c4:	04812823          	sw	s0,80(sp)
    32c8:	000b0993          	mv	s3,s6
    32cc:	03c12403          	lw	s0,60(sp)
    32d0:	40067493          	and	s1,a2,1024
    32d4:	0ff00a13          	li	s4,255
    32d8:	03c12023          	sw	t3,32(sp)
    32dc:	02c12223          	sw	a2,36(sp)
    32e0:	04612223          	sw	t1,68(sp)
    32e4:	00078b13          	mv	s6,a5
    32e8:	0280006f          	j	3310 <_vfprintf_r+0x1918>
    32ec:	00a00613          	li	a2,10
    32f0:	00000693          	li	a3,0
    32f4:	000d0513          	mv	a0,s10
    32f8:	000c8593          	mv	a1,s9
    32fc:	495070ef          	jal	af90 <__udivdi3>
    3300:	6a0c8ee3          	beqz	s9,41bc <_vfprintf_r+0x27c4>
    3304:	00050d13          	mv	s10,a0
    3308:	00058c93          	mv	s9,a1
    330c:	000c0993          	mv	s3,s8
    3310:	00a00613          	li	a2,10
    3314:	00000693          	li	a3,0
    3318:	000d0513          	mv	a0,s10
    331c:	000c8593          	mv	a1,s9
    3320:	31c080ef          	jal	b63c <__umoddi3>
    3324:	03050513          	add	a0,a0,48
    3328:	fea98fa3          	sb	a0,-1(s3)
    332c:	fff98c13          	add	s8,s3,-1
    3330:	00190913          	add	s2,s2,1
    3334:	fa048ce3          	beqz	s1,32ec <_vfprintf_r+0x18f4>
    3338:	00044783          	lbu	a5,0(s0)
    333c:	faf918e3          	bne	s2,a5,32ec <_vfprintf_r+0x18f4>
    3340:	fb4906e3          	beq	s2,s4,32ec <_vfprintf_r+0x18f4>
    3344:	560c9ae3          	bnez	s9,40b8 <_vfprintf_r+0x26c0>
    3348:	00900793          	li	a5,9
    334c:	57a7e6e3          	bltu	a5,s10,40b8 <_vfprintf_r+0x26c0>
    3350:	02412603          	lw	a2,36(sp)
    3354:	15010793          	add	a5,sp,336
    3358:	02812e23          	sw	s0,60(sp)
    335c:	01212c23          	sw	s2,24(sp)
    3360:	02012e03          	lw	t3,32(sp)
    3364:	01012903          	lw	s2,16(sp)
    3368:	04412303          	lw	t1,68(sp)
    336c:	05012403          	lw	s0,80(sp)
    3370:	000b0993          	mv	s3,s6
    3374:	41878d33          	sub	s10,a5,s8
    3378:	00060e93          	mv	t4,a2
    337c:	8ecff06f          	j	2468 <_vfprintf_r+0xa70>
    3380:	00812583          	lw	a1,8(sp)
    3384:	0a010613          	add	a2,sp,160
    3388:	00098513          	mv	a0,s3
    338c:	04612e23          	sw	t1,92(sp)
    3390:	05c12c23          	sw	t3,88(sp)
    3394:	05d12a23          	sw	t4,84(sp)
    3398:	05f12823          	sw	t6,80(sp)
    339c:	04512223          	sw	t0,68(sp)
    33a0:	514010ef          	jal	48b4 <__sprint_r>
    33a4:	00050463          	beqz	a0,33ac <_vfprintf_r+0x19b4>
    33a8:	b21fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    33ac:	07714603          	lbu	a2,119(sp)
    33b0:	0a812483          	lw	s1,168(sp)
    33b4:	05c12303          	lw	t1,92(sp)
    33b8:	05812e03          	lw	t3,88(sp)
    33bc:	05412e83          	lw	t4,84(sp)
    33c0:	05012f83          	lw	t6,80(sp)
    33c4:	04412283          	lw	t0,68(sp)
    33c8:	0ac10413          	add	s0,sp,172
    33cc:	88dfe06f          	j	1c58 <_vfprintf_r+0x260>
    33d0:	02812883          	lw	a7,40(sp)
    33d4:	02c12703          	lw	a4,44(sp)
    33d8:	02612223          	sw	t1,36(sp)
    33dc:	00088613          	mv	a2,a7
    33e0:	00088513          	mv	a0,a7
    33e4:	00070693          	mv	a3,a4
    33e8:	00070593          	mv	a1,a4
    33ec:	03c12023          	sw	t3,32(sp)
    33f0:	01d12823          	sw	t4,16(sp)
    33f4:	5410a0ef          	jal	e134 <__unorddf2>
    33f8:	01012e83          	lw	t4,16(sp)
    33fc:	02012e03          	lw	t3,32(sp)
    3400:	02412303          	lw	t1,36(sp)
    3404:	00050463          	beqz	a0,340c <_vfprintf_r+0x1a14>
    3408:	0e00106f          	j	44e8 <_vfprintf_r+0x2af0>
    340c:	06100713          	li	a4,97
    3410:	08ee0263          	beq	t3,a4,3494 <_vfprintf_r+0x1a9c>
    3414:	04100713          	li	a4,65
    3418:	05800793          	li	a5,88
    341c:	06ee0e63          	beq	t3,a4,3498 <_vfprintf_r+0x1aa0>
    3420:	fff00713          	li	a4,-1
    3424:	00e31463          	bne	t1,a4,342c <_vfprintf_r+0x1a34>
    3428:	01c0106f          	j	4444 <_vfprintf_r+0x2a4c>
    342c:	fdfe7713          	and	a4,t3,-33
    3430:	04700693          	li	a3,71
    3434:	00012823          	sw	zero,16(sp)
    3438:	00d71663          	bne	a4,a3,3444 <_vfprintf_r+0x1a4c>
    343c:	00031463          	bnez	t1,3444 <_vfprintf_r+0x1a4c>
    3440:	00100313          	li	t1,1
    3444:	100ee793          	or	a5,t4,256
    3448:	00078b13          	mv	s6,a5
    344c:	02c12783          	lw	a5,44(sp)
    3450:	04012223          	sw	zero,68(sp)
    3454:	00078493          	mv	s1,a5
    3458:	0007da63          	bgez	a5,346c <_vfprintf_r+0x1a74>
    345c:	800004b7          	lui	s1,0x80000
    3460:	00f4c4b3          	xor	s1,s1,a5
    3464:	02d00793          	li	a5,45
    3468:	04f12223          	sw	a5,68(sp)
    346c:	fbfe0713          	add	a4,t3,-65
    3470:	02500693          	li	a3,37
    3474:	3ae6e463          	bltu	a3,a4,381c <_vfprintf_r+0x1e24>
    3478:	0000c697          	auipc	a3,0xc
    347c:	a5868693          	add	a3,a3,-1448 # eed0 <_ctype_+0x270>
    3480:	00271713          	sll	a4,a4,0x2
    3484:	00d70733          	add	a4,a4,a3
    3488:	00072703          	lw	a4,0(a4)
    348c:	00d70733          	add	a4,a4,a3
    3490:	00070067          	jr	a4
    3494:	07800793          	li	a5,120
    3498:	03000713          	li	a4,48
    349c:	06e10c23          	sb	a4,120(sp)
    34a0:	06f10ca3          	sb	a5,121(sp)
    34a4:	06300713          	li	a4,99
    34a8:	00012823          	sw	zero,16(sp)
    34ac:	002eee93          	or	t4,t4,2
    34b0:	0ec10c13          	add	s8,sp,236
    34b4:	f86758e3          	bge	a4,t1,3444 <_vfprintf_r+0x1a4c>
    34b8:	00130593          	add	a1,t1,1
    34bc:	00098513          	mv	a0,s3
    34c0:	03c12023          	sw	t3,32(sp)
    34c4:	01d12c23          	sw	t4,24(sp)
    34c8:	00612823          	sw	t1,16(sp)
    34cc:	d35fd0ef          	jal	1200 <_malloc_r>
    34d0:	01012303          	lw	t1,16(sp)
    34d4:	01812e83          	lw	t4,24(sp)
    34d8:	02012e03          	lw	t3,32(sp)
    34dc:	00050c13          	mv	s8,a0
    34e0:	00051463          	bnez	a0,34e8 <_vfprintf_r+0x1af0>
    34e4:	13c0106f          	j	4620 <_vfprintf_r+0x2c28>
    34e8:	00a12823          	sw	a0,16(sp)
    34ec:	f59ff06f          	j	3444 <_vfprintf_r+0x1a4c>
    34f0:	00098513          	mv	a0,s3
    34f4:	1d0030ef          	jal	66c4 <__sinit>
    34f8:	00c12783          	lw	a5,12(sp)
    34fc:	d5cfe06f          	j	1a58 <_vfprintf_r+0x60>
    3500:	00812583          	lw	a1,8(sp)
    3504:	0a010613          	add	a2,sp,160
    3508:	00098513          	mv	a0,s3
    350c:	03d12023          	sw	t4,32(sp)
    3510:	3a4010ef          	jal	48b4 <__sprint_r>
    3514:	00050463          	beqz	a0,351c <_vfprintf_r+0x1b24>
    3518:	9b1fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    351c:	0a812483          	lw	s1,168(sp)
    3520:	02012e83          	lw	t4,32(sp)
    3524:	0ac10413          	add	s0,sp,172
    3528:	9b0ff06f          	j	26d8 <_vfprintf_r+0xce0>
    352c:	00800613          	li	a2,8
    3530:	00000593          	li	a1,0
    3534:	09810513          	add	a0,sp,152
    3538:	02612023          	sw	t1,32(sp)
    353c:	01c12a23          	sw	t3,20(sp)
    3540:	01d12823          	sw	t4,16(sp)
    3544:	09812223          	sw	s8,132(sp)
    3548:	d5cfd0ef          	jal	aa4 <memset>
    354c:	02012303          	lw	t1,32(sp)
    3550:	01012e83          	lw	t4,16(sp)
    3554:	01412e03          	lw	t3,20(sp)
    3558:	3a0340e3          	bltz	t1,40f8 <_vfprintf_r+0x2700>
    355c:	00000d13          	li	s10,0
    3560:	01212823          	sw	s2,16(sp)
    3564:	000c0c93          	mv	s9,s8
    3568:	fff00493          	li	s1,-1
    356c:	000b0c13          	mv	s8,s6
    3570:	000e8a13          	mv	s4,t4
    3574:	00040b13          	mv	s6,s0
    3578:	000d0913          	mv	s2,s10
    357c:	00030413          	mv	s0,t1
    3580:	0300006f          	j	35b0 <_vfprintf_r+0x1bb8>
    3584:	09810693          	add	a3,sp,152
    3588:	0ec10593          	add	a1,sp,236
    358c:	00098513          	mv	a0,s3
    3590:	695060ef          	jal	a424 <_wcrtomb_r>
    3594:	68950ae3          	beq	a0,s1,4428 <_vfprintf_r+0x2a30>
    3598:	00a907b3          	add	a5,s2,a0
    359c:	02f44263          	blt	s0,a5,35c0 <_vfprintf_r+0x1bc8>
    35a0:	004d0d13          	add	s10,s10,4
    35a4:	00879463          	bne	a5,s0,35ac <_vfprintf_r+0x1bb4>
    35a8:	7990006f          	j	4540 <_vfprintf_r+0x2b48>
    35ac:	00078913          	mv	s2,a5
    35b0:	08412783          	lw	a5,132(sp)
    35b4:	01a787b3          	add	a5,a5,s10
    35b8:	0007a603          	lw	a2,0(a5)
    35bc:	fc0614e3          	bnez	a2,3584 <_vfprintf_r+0x1b8c>
    35c0:	00090d13          	mv	s10,s2
    35c4:	01412e03          	lw	t3,20(sp)
    35c8:	01012903          	lw	s2,16(sp)
    35cc:	000b0413          	mv	s0,s6
    35d0:	000a0e93          	mv	t4,s4
    35d4:	000c0b13          	mv	s6,s8
    35d8:	000c8c13          	mv	s8,s9
    35dc:	340d0ce3          	beqz	s10,4134 <_vfprintf_r+0x273c>
    35e0:	06300793          	li	a5,99
    35e4:	59a7dee3          	bge	a5,s10,4380 <_vfprintf_r+0x2988>
    35e8:	001d0593          	add	a1,s10,1
    35ec:	00098513          	mv	a0,s3
    35f0:	01c12a23          	sw	t3,20(sp)
    35f4:	01d12823          	sw	t4,16(sp)
    35f8:	c09fd0ef          	jal	1200 <_malloc_r>
    35fc:	01012e83          	lw	t4,16(sp)
    3600:	01412e03          	lw	t3,20(sp)
    3604:	00050c13          	mv	s8,a0
    3608:	620500e3          	beqz	a0,4428 <_vfprintf_r+0x2a30>
    360c:	00a12823          	sw	a0,16(sp)
    3610:	00800613          	li	a2,8
    3614:	00000593          	li	a1,0
    3618:	09810513          	add	a0,sp,152
    361c:	03c12023          	sw	t3,32(sp)
    3620:	01d12a23          	sw	t4,20(sp)
    3624:	c80fd0ef          	jal	aa4 <memset>
    3628:	09810713          	add	a4,sp,152
    362c:	000d0693          	mv	a3,s10
    3630:	08410613          	add	a2,sp,132
    3634:	000c0593          	mv	a1,s8
    3638:	00098513          	mv	a0,s3
    363c:	675060ef          	jal	a4b0 <_wcsrtombs_r>
    3640:	01412e83          	lw	t4,20(sp)
    3644:	02012e03          	lw	t3,32(sp)
    3648:	00ad0463          	beq	s10,a0,3650 <_vfprintf_r+0x1c58>
    364c:	0240106f          	j	4670 <_vfprintf_r+0x2c78>
    3650:	01ac0733          	add	a4,s8,s10
    3654:	00070023          	sb	zero,0(a4)
    3658:	07714603          	lbu	a2,119(sp)
    365c:	fffd4813          	not	a6,s10
    3660:	41f85813          	sra	a6,a6,0x1f
    3664:	01612a23          	sw	s6,20(sp)
    3668:	02012223          	sw	zero,36(sp)
    366c:	02012023          	sw	zero,32(sp)
    3670:	010d7cb3          	and	s9,s10,a6
    3674:	00000313          	li	t1,0
    3678:	00000a13          	li	s4,0
    367c:	00061463          	bnez	a2,3684 <_vfprintf_r+0x1c8c>
    3680:	db8fe06f          	j	1c38 <_vfprintf_r+0x240>
    3684:	9d5fe06f          	j	2058 <_vfprintf_r+0x660>
    3688:	00048e93          	mv	t4,s1
    368c:	000a0293          	mv	t0,s4
    3690:	00070493          	mv	s1,a4
    3694:	01a484b3          	add	s1,s1,s10
    3698:	00178793          	add	a5,a5,1
    369c:	00542023          	sw	t0,0(s0)
    36a0:	e48fe06f          	j	1ce8 <_vfprintf_r+0x2f0>
    36a4:	01412783          	lw	a5,20(sp)
    36a8:	00c12703          	lw	a4,12(sp)
    36ac:	0007a783          	lw	a5,0(a5)
    36b0:	00e7a023          	sw	a4,0(a5)
    36b4:	fadfe06f          	j	2660 <_vfprintf_r+0xc68>
    36b8:	02012e83          	lw	t4,32(sp)
    36bc:	00040293          	mv	t0,s0
    36c0:	000a0413          	mv	s0,s4
    36c4:	008484b3          	add	s1,s1,s0
    36c8:	001d0d13          	add	s10,s10,1
    36cc:	005b2023          	sw	t0,0(s6)
    36d0:	b7dfe06f          	j	224c <_vfprintf_r+0x854>
    36d4:	03412703          	lw	a4,52(sp)
    36d8:	03012783          	lw	a5,48(sp)
    36dc:	00700613          	li	a2,7
    36e0:	00e42023          	sw	a4,0(s0)
    36e4:	0a412703          	lw	a4,164(sp)
    36e8:	009784b3          	add	s1,a5,s1
    36ec:	00f42223          	sw	a5,4(s0)
    36f0:	00170713          	add	a4,a4,1
    36f4:	0a912423          	sw	s1,168(sp)
    36f8:	0ae12223          	sw	a4,164(sp)
    36fc:	00840413          	add	s0,s0,8
    3700:	3ae64463          	blt	a2,a4,3aa8 <_vfprintf_r+0x20b0>
    3704:	3e06cee3          	bltz	a3,4300 <_vfprintf_r+0x2908>
    3708:	01812783          	lw	a5,24(sp)
    370c:	00170713          	add	a4,a4,1
    3710:	01842023          	sw	s8,0(s0)
    3714:	009784b3          	add	s1,a5,s1
    3718:	00f42223          	sw	a5,4(s0)
    371c:	0a912423          	sw	s1,168(sp)
    3720:	0ae12223          	sw	a4,164(sp)
    3724:	00700793          	li	a5,7
    3728:	00e7c463          	blt	a5,a4,3730 <_vfprintf_r+0x1d38>
    372c:	dd0fe06f          	j	1cfc <_vfprintf_r+0x304>
    3730:	b61fe06f          	j	2290 <_vfprintf_r+0x898>
    3734:	01000613          	li	a2,16
    3738:	0a412683          	lw	a3,164(sp)
    373c:	0000c297          	auipc	t0,0xc
    3740:	82c28293          	add	t0,t0,-2004 # ef68 <zeroes.0>
    3744:	09665463          	bge	a2,s6,37cc <_vfprintf_r+0x1dd4>
    3748:	00040793          	mv	a5,s0
    374c:	00048713          	mv	a4,s1
    3750:	00812403          	lw	s0,8(sp)
    3754:	01000893          	li	a7,16
    3758:	00700d13          	li	s10,7
    375c:	05d12223          	sw	t4,68(sp)
    3760:	00028493          	mv	s1,t0
    3764:	00c0006f          	j	3770 <_vfprintf_r+0x1d78>
    3768:	ff0b0b13          	add	s6,s6,-16
    376c:	0568d863          	bge	a7,s6,37bc <_vfprintf_r+0x1dc4>
    3770:	01070713          	add	a4,a4,16
    3774:	00168693          	add	a3,a3,1
    3778:	0097a023          	sw	s1,0(a5)
    377c:	0117a223          	sw	a7,4(a5)
    3780:	0ae12423          	sw	a4,168(sp)
    3784:	0ad12223          	sw	a3,164(sp)
    3788:	00878793          	add	a5,a5,8
    378c:	fcdd5ee3          	bge	s10,a3,3768 <_vfprintf_r+0x1d70>
    3790:	0a010613          	add	a2,sp,160
    3794:	00040593          	mv	a1,s0
    3798:	00098513          	mv	a0,s3
    379c:	118010ef          	jal	48b4 <__sprint_r>
    37a0:	00050463          	beqz	a0,37a8 <_vfprintf_r+0x1db0>
    37a4:	f24fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    37a8:	0a812703          	lw	a4,168(sp)
    37ac:	0a412683          	lw	a3,164(sp)
    37b0:	0ac10793          	add	a5,sp,172
    37b4:	01000893          	li	a7,16
    37b8:	fb1ff06f          	j	3768 <_vfprintf_r+0x1d70>
    37bc:	04412e83          	lw	t4,68(sp)
    37c0:	00048293          	mv	t0,s1
    37c4:	00078413          	mv	s0,a5
    37c8:	00070493          	mv	s1,a4
    37cc:	016484b3          	add	s1,s1,s6
    37d0:	00168693          	add	a3,a3,1
    37d4:	00542023          	sw	t0,0(s0)
    37d8:	01642223          	sw	s6,4(s0)
    37dc:	0a912423          	sw	s1,168(sp)
    37e0:	0ad12223          	sw	a3,164(sp)
    37e4:	00700713          	li	a4,7
    37e8:	00840413          	add	s0,s0,8
    37ec:	bed75c63          	bge	a4,a3,2be4 <_vfprintf_r+0x11ec>
    37f0:	00812583          	lw	a1,8(sp)
    37f4:	0a010613          	add	a2,sp,160
    37f8:	00098513          	mv	a0,s3
    37fc:	05d12223          	sw	t4,68(sp)
    3800:	0b4010ef          	jal	48b4 <__sprint_r>
    3804:	00050463          	beqz	a0,380c <_vfprintf_r+0x1e14>
    3808:	ec0fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    380c:	0a812483          	lw	s1,168(sp)
    3810:	04412e83          	lw	t4,68(sp)
    3814:	0ac10413          	add	s0,sp,172
    3818:	bccff06f          	j	2be4 <_vfprintf_r+0x11ec>
    381c:	02812703          	lw	a4,40(sp)
    3820:	09810893          	add	a7,sp,152
    3824:	08410813          	add	a6,sp,132
    3828:	00070513          	mv	a0,a4
    382c:	00050593          	mv	a1,a0
    3830:	00030713          	mv	a4,t1
    3834:	07c10793          	add	a5,sp,124
    3838:	00200693          	li	a3,2
    383c:	00048613          	mv	a2,s1
    3840:	00098513          	mv	a0,s3
    3844:	03c12223          	sw	t3,36(sp)
    3848:	03d12023          	sw	t4,32(sp)
    384c:	00612c23          	sw	t1,24(sp)
    3850:	12c040ef          	jal	797c <_dtoa_r>
    3854:	02012e83          	lw	t4,32(sp)
    3858:	01812303          	lw	t1,24(sp)
    385c:	02412e03          	lw	t3,36(sp)
    3860:	001ef713          	and	a4,t4,1
    3864:	00050c13          	mv	s8,a0
    3868:	1a0712e3          	bnez	a4,420c <_vfprintf_r+0x2814>
    386c:	09812783          	lw	a5,152(sp)
    3870:	07c12a03          	lw	s4,124(sp)
    3874:	40a787b3          	sub	a5,a5,a0
    3878:	00f12c23          	sw	a5,24(sp)
    387c:	ffd00713          	li	a4,-3
    3880:	00ea4463          	blt	s4,a4,3888 <_vfprintf_r+0x1e90>
    3884:	5b435663          	bge	t1,s4,3e30 <_vfprintf_r+0x2438>
    3888:	ffee0e13          	add	t3,t3,-2
    388c:	fffa0d13          	add	s10,s4,-1
    3890:	07a12e23          	sw	s10,124(sp)
    3894:	0ffe7693          	zext.b	a3,t3
    3898:	00000613          	li	a2,0
    389c:	08d10423          	sb	a3,136(sp)
    38a0:	02b00693          	li	a3,43
    38a4:	000d5863          	bgez	s10,38b4 <_vfprintf_r+0x1ebc>
    38a8:	00100713          	li	a4,1
    38ac:	41470d33          	sub	s10,a4,s4
    38b0:	02d00693          	li	a3,45
    38b4:	08d104a3          	sb	a3,137(sp)
    38b8:	00900693          	li	a3,9
    38bc:	33a6d8e3          	bge	a3,s10,43ec <_vfprintf_r+0x29f4>
    38c0:	000c0793          	mv	a5,s8
    38c4:	09f10493          	add	s1,sp,159
    38c8:	03212023          	sw	s2,32(sp)
    38cc:	00040c13          	mv	s8,s0
    38d0:	06300a13          	li	s4,99
    38d4:	000d0413          	mv	s0,s10
    38d8:	03d12223          	sw	t4,36(sp)
    38dc:	05c12023          	sw	t3,64(sp)
    38e0:	00048913          	mv	s2,s1
    38e4:	00098c93          	mv	s9,s3
    38e8:	00078d13          	mv	s10,a5
    38ec:	00a00593          	li	a1,10
    38f0:	00040513          	mv	a0,s0
    38f4:	7b10a0ef          	jal	e8a4 <__modsi3>
    38f8:	03050713          	add	a4,a0,48
    38fc:	00090b13          	mv	s6,s2
    3900:	00040513          	mv	a0,s0
    3904:	feeb0fa3          	sb	a4,-1(s6)
    3908:	00a00593          	li	a1,10
    390c:	00040993          	mv	s3,s0
    3910:	7110a0ef          	jal	e820 <__divsi3>
    3914:	fff90913          	add	s2,s2,-1
    3918:	00050413          	mv	s0,a0
    391c:	fd3a48e3          	blt	s4,s3,38ec <_vfprintf_r+0x1ef4>
    3920:	000c8993          	mv	s3,s9
    3924:	03050713          	add	a4,a0,48
    3928:	00090c93          	mv	s9,s2
    392c:	ffeb0693          	add	a3,s6,-2
    3930:	feec8fa3          	sb	a4,-1(s9)
    3934:	000c0413          	mv	s0,s8
    3938:	02412e83          	lw	t4,36(sp)
    393c:	04012e03          	lw	t3,64(sp)
    3940:	02012903          	lw	s2,32(sp)
    3944:	000d0c13          	mv	s8,s10
    3948:	4c96f6e3          	bgeu	a3,s1,4614 <_vfprintf_r+0x2c1c>
    394c:	08a10713          	add	a4,sp,138
    3950:	0006c783          	lbu	a5,0(a3)
    3954:	00168693          	add	a3,a3,1
    3958:	00170713          	add	a4,a4,1
    395c:	fef70fa3          	sb	a5,-1(a4)
    3960:	fe9698e3          	bne	a3,s1,3950 <_vfprintf_r+0x1f58>
    3964:	15010793          	add	a5,sp,336
    3968:	41678633          	sub	a2,a5,s6
    396c:	f5360793          	add	a5,a2,-173
    3970:	04f12023          	sw	a5,64(sp)
    3974:	01812783          	lw	a5,24(sp)
    3978:	04012683          	lw	a3,64(sp)
    397c:	00100713          	li	a4,1
    3980:	00d78d33          	add	s10,a5,a3
    3984:	28f75ce3          	bge	a4,a5,441c <_vfprintf_r+0x2a24>
    3988:	03012783          	lw	a5,48(sp)
    398c:	00fd0d33          	add	s10,s10,a5
    3990:	fffd4813          	not	a6,s10
    3994:	bffeff13          	and	t5,t4,-1025
    3998:	41f85813          	sra	a6,a6,0x1f
    399c:	100f6e93          	or	t4,t5,256
    39a0:	010d7cb3          	and	s9,s10,a6
    39a4:	02012223          	sw	zero,36(sp)
    39a8:	02012023          	sw	zero,32(sp)
    39ac:	00000a13          	li	s4,0
    39b0:	04412783          	lw	a5,68(sp)
    39b4:	46079263          	bnez	a5,3e18 <_vfprintf_r+0x2420>
    39b8:	07714603          	lbu	a2,119(sp)
    39bc:	00000313          	li	t1,0
    39c0:	00061463          	bnez	a2,39c8 <_vfprintf_r+0x1fd0>
    39c4:	a74fe06f          	j	1c38 <_vfprintf_r+0x240>
    39c8:	e90fe06f          	j	2058 <_vfprintf_r+0x660>
    39cc:	00812583          	lw	a1,8(sp)
    39d0:	0a010613          	add	a2,sp,160
    39d4:	00098513          	mv	a0,s3
    39d8:	03d12023          	sw	t4,32(sp)
    39dc:	6d9000ef          	jal	48b4 <__sprint_r>
    39e0:	00050463          	beqz	a0,39e8 <_vfprintf_r+0x1ff0>
    39e4:	ce4fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    39e8:	07c12683          	lw	a3,124(sp)
    39ec:	0a812483          	lw	s1,168(sp)
    39f0:	02012e83          	lw	t4,32(sp)
    39f4:	0ac10413          	add	s0,sp,172
    39f8:	ce0ff06f          	j	2ed8 <_vfprintf_r+0x14e0>
    39fc:	00600c93          	li	s9,6
    3a00:	f14ff06f          	j	3114 <_vfprintf_r+0x171c>
    3a04:	0ffd7d13          	zext.b	s10,s10
    3a08:	00000c93          	li	s9,0
    3a0c:	bd5fe06f          	j	25e0 <_vfprintf_r+0xbe8>
    3a10:	0ffd7d13          	zext.b	s10,s10
    3a14:	00000c93          	li	s9,0
    3a18:	e48ff06f          	j	3060 <_vfprintf_r+0x1668>
    3a1c:	018d1d13          	sll	s10,s10,0x18
    3a20:	418d5d13          	sra	s10,s10,0x18
    3a24:	41fd5c93          	sra	s9,s10,0x1f
    3a28:	000c8793          	mv	a5,s9
    3a2c:	b39fe06f          	j	2564 <_vfprintf_r+0xb6c>
    3a30:	01412783          	lw	a5,20(sp)
    3a34:	00c12703          	lw	a4,12(sp)
    3a38:	0007a783          	lw	a5,0(a5)
    3a3c:	00e79023          	sh	a4,0(a5)
    3a40:	c21fe06f          	j	2660 <_vfprintf_r+0xc68>
    3a44:	000c0513          	mv	a0,s8
    3a48:	05d12223          	sw	t4,68(sp)
    3a4c:	ad8fd0ef          	jal	d24 <strlen>
    3a50:	07714603          	lbu	a2,119(sp)
    3a54:	fff54813          	not	a6,a0
    3a58:	41f85813          	sra	a6,a6,0x1f
    3a5c:	01612a23          	sw	s6,20(sp)
    3a60:	02012223          	sw	zero,36(sp)
    3a64:	02012023          	sw	zero,32(sp)
    3a68:	00012823          	sw	zero,16(sp)
    3a6c:	04412e83          	lw	t4,68(sp)
    3a70:	00050d13          	mv	s10,a0
    3a74:	01057cb3          	and	s9,a0,a6
    3a78:	00000313          	li	t1,0
    3a7c:	07300e13          	li	t3,115
    3a80:	00061463          	bnez	a2,3a88 <_vfprintf_r+0x2090>
    3a84:	9b4fe06f          	j	1c38 <_vfprintf_r+0x240>
    3a88:	dd0fe06f          	j	2058 <_vfprintf_r+0x660>
    3a8c:	00812583          	lw	a1,8(sp)
    3a90:	0a010613          	add	a2,sp,160
    3a94:	00098513          	mv	a0,s3
    3a98:	61d000ef          	jal	48b4 <__sprint_r>
    3a9c:	00051463          	bnez	a0,3aa4 <_vfprintf_r+0x20ac>
    3aa0:	be8fe06f          	j	1e88 <_vfprintf_r+0x490>
    3aa4:	c38fe06f          	j	1edc <_vfprintf_r+0x4e4>
    3aa8:	00812583          	lw	a1,8(sp)
    3aac:	0a010613          	add	a2,sp,160
    3ab0:	00098513          	mv	a0,s3
    3ab4:	03d12023          	sw	t4,32(sp)
    3ab8:	5fd000ef          	jal	48b4 <__sprint_r>
    3abc:	00050463          	beqz	a0,3ac4 <_vfprintf_r+0x20cc>
    3ac0:	c08fe06f          	j	1ec8 <_vfprintf_r+0x4d0>
    3ac4:	07c12683          	lw	a3,124(sp)
    3ac8:	0a812483          	lw	s1,168(sp)
    3acc:	0a412703          	lw	a4,164(sp)
    3ad0:	02012e83          	lw	t4,32(sp)
    3ad4:	0ac10413          	add	s0,sp,172
    3ad8:	c2dff06f          	j	3704 <_vfprintf_r+0x1d0c>
    3adc:	05862503          	lw	a0,88(a2)
    3ae0:	00f12623          	sw	a5,12(sp)
    3ae4:	275030ef          	jal	7558 <__retarget_lock_release_recursive>
    3ae8:	00c12783          	lw	a5,12(sp)
    3aec:	ab8fe06f          	j	1da4 <_vfprintf_r+0x3ac>
    3af0:	00130a13          	add	s4,t1,1
    3af4:	00200693          	li	a3,2
    3af8:	02812703          	lw	a4,40(sp)
    3afc:	09810893          	add	a7,sp,152
    3b00:	08410813          	add	a6,sp,132
    3b04:	00070513          	mv	a0,a4
    3b08:	00050593          	mv	a1,a0
    3b0c:	000a0713          	mv	a4,s4
    3b10:	07c10793          	add	a5,sp,124
    3b14:	00048613          	mv	a2,s1
    3b18:	00098513          	mv	a0,s3
    3b1c:	02612223          	sw	t1,36(sp)
    3b20:	03c12023          	sw	t3,32(sp)
    3b24:	01d12c23          	sw	t4,24(sp)
    3b28:	655030ef          	jal	797c <_dtoa_r>
    3b2c:	02012e03          	lw	t3,32(sp)
    3b30:	04600693          	li	a3,70
    3b34:	01812e83          	lw	t4,24(sp)
    3b38:	fdfe7d13          	and	s10,t3,-33
    3b3c:	02412303          	lw	t1,36(sp)
    3b40:	00050c13          	mv	s8,a0
    3b44:	01450733          	add	a4,a0,s4
    3b48:	34dd14e3          	bne	s10,a3,4690 <_vfprintf_r+0x2c98>
    3b4c:	000c4603          	lbu	a2,0(s8)
    3b50:	03000693          	li	a3,48
    3b54:	6cd60263          	beq	a2,a3,4218 <_vfprintf_r+0x2820>
    3b58:	07c12683          	lw	a3,124(sp)
    3b5c:	00d70733          	add	a4,a4,a3
    3b60:	02812683          	lw	a3,40(sp)
    3b64:	00048593          	mv	a1,s1
    3b68:	00000613          	li	a2,0
    3b6c:	00068513          	mv	a0,a3
    3b70:	00000693          	li	a3,0
    3b74:	04e12823          	sw	a4,80(sp)
    3b78:	02612223          	sw	t1,36(sp)
    3b7c:	03c12023          	sw	t3,32(sp)
    3b80:	01d12c23          	sw	t4,24(sp)
    3b84:	284090ef          	jal	ce08 <__eqdf2>
    3b88:	01812e83          	lw	t4,24(sp)
    3b8c:	02012e03          	lw	t3,32(sp)
    3b90:	02412303          	lw	t1,36(sp)
    3b94:	05012703          	lw	a4,80(sp)
    3b98:	62050863          	beqz	a0,41c8 <_vfprintf_r+0x27d0>
    3b9c:	09812783          	lw	a5,152(sp)
    3ba0:	00e7fe63          	bgeu	a5,a4,3bbc <_vfprintf_r+0x21c4>
    3ba4:	03000613          	li	a2,48
    3ba8:	00178693          	add	a3,a5,1
    3bac:	08d12c23          	sw	a3,152(sp)
    3bb0:	00c78023          	sb	a2,0(a5)
    3bb4:	09812783          	lw	a5,152(sp)
    3bb8:	fee7e8e3          	bltu	a5,a4,3ba8 <_vfprintf_r+0x21b0>
    3bbc:	07c12a03          	lw	s4,124(sp)
    3bc0:	418787b3          	sub	a5,a5,s8
    3bc4:	04700713          	li	a4,71
    3bc8:	00f12c23          	sw	a5,24(sp)
    3bcc:	caed08e3          	beq	s10,a4,387c <_vfprintf_r+0x1e84>
    3bd0:	04600713          	li	a4,70
    3bd4:	68ed0863          	beq	s10,a4,4264 <_vfprintf_r+0x286c>
    3bd8:	fffa0d13          	add	s10,s4,-1
    3bdc:	cb5ff06f          	j	3890 <_vfprintf_r+0x1e98>
    3be0:	02812703          	lw	a4,40(sp)
    3be4:	07c10613          	add	a2,sp,124
    3be8:	00048593          	mv	a1,s1
    3bec:	00070513          	mv	a0,a4
    3bf0:	02612223          	sw	t1,36(sp)
    3bf4:	03c12023          	sw	t3,32(sp)
    3bf8:	01d12c23          	sw	t4,24(sp)
    3bfc:	26d030ef          	jal	7668 <frexp>
    3c00:	7fffd717          	auipc	a4,0x7fffd
    3c04:	aa870713          	add	a4,a4,-1368 # 800006a8 <__global_locale+0x174>
    3c08:	00072603          	lw	a2,0(a4)
    3c0c:	00472683          	lw	a3,4(a4)
    3c10:	48c090ef          	jal	d09c <__muldf3>
    3c14:	00000613          	li	a2,0
    3c18:	00000693          	li	a3,0
    3c1c:	00050a13          	mv	s4,a0
    3c20:	00058d13          	mv	s10,a1
    3c24:	1e4090ef          	jal	ce08 <__eqdf2>
    3c28:	01812e83          	lw	t4,24(sp)
    3c2c:	02012e03          	lw	t3,32(sp)
    3c30:	02412303          	lw	t1,36(sp)
    3c34:	00051663          	bnez	a0,3c40 <_vfprintf_r+0x2248>
    3c38:	00100713          	li	a4,1
    3c3c:	06e12e23          	sw	a4,124(sp)
    3c40:	0000b797          	auipc	a5,0xb
    3c44:	e5478793          	add	a5,a5,-428 # ea94 <__fini_array_end+0x138>
    3c48:	06100713          	li	a4,97
    3c4c:	02f12023          	sw	a5,32(sp)
    3c50:	00ee1863          	bne	t3,a4,3c60 <_vfprintf_r+0x2268>
    3c54:	0000b797          	auipc	a5,0xb
    3c58:	e2c78793          	add	a5,a5,-468 # ea80 <__fini_array_end+0x124>
    3c5c:	02f12023          	sw	a5,32(sp)
    3c60:	7fffd717          	auipc	a4,0x7fffd
    3c64:	a5070713          	add	a4,a4,-1456 # 800006b0 <__global_locale+0x17c>
    3c68:	00072783          	lw	a5,0(a4)
    3c6c:	00472803          	lw	a6,4(a4)
    3c70:	000c0493          	mv	s1,s8
    3c74:	00f12c23          	sw	a5,24(sp)
    3c78:	000d0793          	mv	a5,s10
    3c7c:	03212223          	sw	s2,36(sp)
    3c80:	000c0d13          	mv	s10,s8
    3c84:	02012903          	lw	s2,32(sp)
    3c88:	00098c13          	mv	s8,s3
    3c8c:	01012e23          	sw	a6,28(sp)
    3c90:	fff30b13          	add	s6,t1,-1
    3c94:	fff00c93          	li	s9,-1
    3c98:	05d12023          	sw	t4,64(sp)
    3c9c:	05c12823          	sw	t3,80(sp)
    3ca0:	04812a23          	sw	s0,84(sp)
    3ca4:	00078993          	mv	s3,a5
    3ca8:	01c0006f          	j	3cc4 <_vfprintf_r+0x22cc>
    3cac:	00000613          	li	a2,0
    3cb0:	00000693          	li	a3,0
    3cb4:	fffb0413          	add	s0,s6,-1
    3cb8:	150090ef          	jal	ce08 <__eqdf2>
    3cbc:	0a0504e3          	beqz	a0,4564 <_vfprintf_r+0x2b6c>
    3cc0:	00040b13          	mv	s6,s0
    3cc4:	01812603          	lw	a2,24(sp)
    3cc8:	01c12683          	lw	a3,28(sp)
    3ccc:	000a0513          	mv	a0,s4
    3cd0:	00098593          	mv	a1,s3
    3cd4:	3c8090ef          	jal	d09c <__muldf3>
    3cd8:	00058a13          	mv	s4,a1
    3cdc:	00050993          	mv	s3,a0
    3ce0:	4a80a0ef          	jal	e188 <__fixdfsi>
    3ce4:	00050413          	mv	s0,a0
    3ce8:	5240a0ef          	jal	e20c <__floatsidf>
    3cec:	00050613          	mv	a2,a0
    3cf0:	00058693          	mv	a3,a1
    3cf4:	00098513          	mv	a0,s3
    3cf8:	000a0593          	mv	a1,s4
    3cfc:	331090ef          	jal	d82c <__subdf3>
    3d00:	00890733          	add	a4,s2,s0
    3d04:	00074703          	lbu	a4,0(a4)
    3d08:	00048813          	mv	a6,s1
    3d0c:	00050a13          	mv	s4,a0
    3d10:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    3d14:	00058993          	mv	s3,a1
    3d18:	00148493          	add	s1,s1,1
    3d1c:	f99b18e3          	bne	s6,s9,3cac <_vfprintf_r+0x22b4>
    3d20:	7fffd697          	auipc	a3,0x7fffd
    3d24:	99868693          	add	a3,a3,-1640 # 800006b8 <__global_locale+0x184>
    3d28:	0006a303          	lw	t1,0(a3)
    3d2c:	0046a383          	lw	t2,4(a3)
    3d30:	05012e03          	lw	t3,80(sp)
    3d34:	00030613          	mv	a2,t1
    3d38:	00038693          	mv	a3,t2
    3d3c:	01012c23          	sw	a6,24(sp)
    3d40:	02412903          	lw	s2,36(sp)
    3d44:	000c0993          	mv	s3,s8
    3d48:	03c12223          	sw	t3,36(sp)
    3d4c:	000d0c13          	mv	s8,s10
    3d50:	00058d13          	mv	s10,a1
    3d54:	140090ef          	jal	ce94 <__gedf2>
    3d58:	7fffd797          	auipc	a5,0x7fffd
    3d5c:	96078793          	add	a5,a5,-1696 # 800006b8 <__global_locale+0x184>
    3d60:	00040b13          	mv	s6,s0
    3d64:	0007a303          	lw	t1,0(a5)
    3d68:	05412403          	lw	s0,84(sp)
    3d6c:	0047a383          	lw	t2,4(a5)
    3d70:	01812803          	lw	a6,24(sp)
    3d74:	02412e03          	lw	t3,36(sp)
    3d78:	04012e83          	lw	t4,64(sp)
    3d7c:	0aa05ce3          	blez	a0,4634 <_vfprintf_r+0x2c3c>
    3d80:	02012783          	lw	a5,32(sp)
    3d84:	09012c23          	sw	a6,152(sp)
    3d88:	fff4c603          	lbu	a2,-1(s1)
    3d8c:	00f7c583          	lbu	a1,15(a5)
    3d90:	00048693          	mv	a3,s1
    3d94:	02b61063          	bne	a2,a1,3db4 <_vfprintf_r+0x23bc>
    3d98:	03000513          	li	a0,48
    3d9c:	fea68fa3          	sb	a0,-1(a3)
    3da0:	09812683          	lw	a3,152(sp)
    3da4:	fff68793          	add	a5,a3,-1
    3da8:	08f12c23          	sw	a5,152(sp)
    3dac:	fff6c603          	lbu	a2,-1(a3)
    3db0:	feb606e3          	beq	a2,a1,3d9c <_vfprintf_r+0x23a4>
    3db4:	00160593          	add	a1,a2,1
    3db8:	03900513          	li	a0,57
    3dbc:	0ff5f593          	zext.b	a1,a1
    3dc0:	04a60463          	beq	a2,a0,3e08 <_vfprintf_r+0x2410>
    3dc4:	feb68fa3          	sb	a1,-1(a3)
    3dc8:	00048793          	mv	a5,s1
    3dcc:	07c12a03          	lw	s4,124(sp)
    3dd0:	418787b3          	sub	a5,a5,s8
    3dd4:	06100613          	li	a2,97
    3dd8:	fffa0d13          	add	s10,s4,-1
    3ddc:	00f12c23          	sw	a5,24(sp)
    3de0:	07a12e23          	sw	s10,124(sp)
    3de4:	07000693          	li	a3,112
    3de8:	00ce0663          	beq	t3,a2,3df4 <_vfprintf_r+0x23fc>
    3dec:	05000693          	li	a3,80
    3df0:	04100e13          	li	t3,65
    3df4:	00100613          	li	a2,1
    3df8:	aa5ff06f          	j	389c <_vfprintf_r+0x1ea4>
    3dfc:	00030a13          	mv	s4,t1
    3e00:	00300693          	li	a3,3
    3e04:	cf5ff06f          	j	3af8 <_vfprintf_r+0x2100>
    3e08:	02012783          	lw	a5,32(sp)
    3e0c:	00a7c583          	lbu	a1,10(a5)
    3e10:	feb68fa3          	sb	a1,-1(a3)
    3e14:	fb5ff06f          	j	3dc8 <_vfprintf_r+0x23d0>
    3e18:	02d00713          	li	a4,45
    3e1c:	06e10ba3          	sb	a4,119(sp)
    3e20:	02d00613          	li	a2,45
    3e24:	00000313          	li	t1,0
    3e28:	001c8c93          	add	s9,s9,1
    3e2c:	e0dfd06f          	j	1c38 <_vfprintf_r+0x240>
    3e30:	01812783          	lw	a5,24(sp)
    3e34:	46fa4063          	blt	s4,a5,4294 <_vfprintf_r+0x289c>
    3e38:	001ef713          	and	a4,t4,1
    3e3c:	000a0d13          	mv	s10,s4
    3e40:	00070663          	beqz	a4,3e4c <_vfprintf_r+0x2454>
    3e44:	03012783          	lw	a5,48(sp)
    3e48:	00fa0d33          	add	s10,s4,a5
    3e4c:	400eff13          	and	t5,t4,1024
    3e50:	000f0463          	beqz	t5,3e58 <_vfprintf_r+0x2460>
    3e54:	5f404e63          	bgtz	s4,4450 <_vfprintf_r+0x2a58>
    3e58:	fffd4813          	not	a6,s10
    3e5c:	41f85813          	sra	a6,a6,0x1f
    3e60:	010d7cb3          	and	s9,s10,a6
    3e64:	06700e13          	li	t3,103
    3e68:	000b0e93          	mv	t4,s6
    3e6c:	02012223          	sw	zero,36(sp)
    3e70:	02012023          	sw	zero,32(sp)
    3e74:	b3dff06f          	j	39b0 <_vfprintf_r+0x1fb8>
    3e78:	02d00793          	li	a5,45
    3e7c:	06f10ba3          	sb	a5,119(sp)
    3e80:	02d00613          	li	a2,45
    3e84:	998fe06f          	j	201c <_vfprintf_r+0x624>
    3e88:	01812783          	lw	a5,24(sp)
    3e8c:	02012a03          	lw	s4,32(sp)
    3e90:	05212823          	sw	s2,80(sp)
    3e94:	00fc07b3          	add	a5,s8,a5
    3e98:	05712c23          	sw	s7,88(sp)
    3e9c:	05912e23          	sw	s9,92(sp)
    3ea0:	00040713          	mv	a4,s0
    3ea4:	04f12223          	sw	a5,68(sp)
    3ea8:	02412403          	lw	s0,36(sp)
    3eac:	05d12a23          	sw	t4,84(sp)
    3eb0:	03812223          	sw	s8,36(sp)
    3eb4:	03c12b83          	lw	s7,60(sp)
    3eb8:	04c12c83          	lw	s9,76(sp)
    3ebc:	00812903          	lw	s2,8(sp)
    3ec0:	00700693          	li	a3,7
    3ec4:	01000d13          	li	s10,16
    3ec8:	0000bb17          	auipc	s6,0xb
    3ecc:	0a0b0b13          	add	s6,s6,160 # ef68 <zeroes.0>
    3ed0:	00048613          	mv	a2,s1
    3ed4:	00030c13          	mv	s8,t1
    3ed8:	09405863          	blez	s4,3f68 <_vfprintf_r+0x2570>
    3edc:	16805e63          	blez	s0,4058 <_vfprintf_r+0x2660>
    3ee0:	fff40413          	add	s0,s0,-1
    3ee4:	04812783          	lw	a5,72(sp)
    3ee8:	01960633          	add	a2,a2,s9
    3eec:	01972223          	sw	s9,4(a4)
    3ef0:	00f72023          	sw	a5,0(a4)
    3ef4:	0a412783          	lw	a5,164(sp)
    3ef8:	0ac12423          	sw	a2,168(sp)
    3efc:	00870713          	add	a4,a4,8
    3f00:	00178793          	add	a5,a5,1
    3f04:	0af12223          	sw	a5,164(sp)
    3f08:	14f6ce63          	blt	a3,a5,4064 <_vfprintf_r+0x266c>
    3f0c:	04412783          	lw	a5,68(sp)
    3f10:	000bc583          	lbu	a1,0(s7)
    3f14:	418784b3          	sub	s1,a5,s8
    3f18:	0095d463          	bge	a1,s1,3f20 <_vfprintf_r+0x2528>
    3f1c:	00058493          	mv	s1,a1
    3f20:	02905663          	blez	s1,3f4c <_vfprintf_r+0x2554>
    3f24:	0a412583          	lw	a1,164(sp)
    3f28:	00960633          	add	a2,a2,s1
    3f2c:	01872023          	sw	s8,0(a4)
    3f30:	00158593          	add	a1,a1,1
    3f34:	00972223          	sw	s1,4(a4)
    3f38:	0ac12423          	sw	a2,168(sp)
    3f3c:	0ab12223          	sw	a1,164(sp)
    3f40:	14b6c663          	blt	a3,a1,408c <_vfprintf_r+0x2694>
    3f44:	000bc583          	lbu	a1,0(s7)
    3f48:	00870713          	add	a4,a4,8
    3f4c:	fff4c513          	not	a0,s1
    3f50:	41f55513          	sra	a0,a0,0x1f
    3f54:	00a4f7b3          	and	a5,s1,a0
    3f58:	40f584b3          	sub	s1,a1,a5
    3f5c:	04904663          	bgtz	s1,3fa8 <_vfprintf_r+0x25b0>
    3f60:	00bc0c33          	add	s8,s8,a1
    3f64:	f7404ce3          	bgtz	s4,3edc <_vfprintf_r+0x24e4>
    3f68:	f6804ce3          	bgtz	s0,3ee0 <_vfprintf_r+0x24e8>
    3f6c:	01812783          	lw	a5,24(sp)
    3f70:	000c0313          	mv	t1,s8
    3f74:	02412c03          	lw	s8,36(sp)
    3f78:	03712e23          	sw	s7,60(sp)
    3f7c:	00070413          	mv	s0,a4
    3f80:	00fc0733          	add	a4,s8,a5
    3f84:	05012903          	lw	s2,80(sp)
    3f88:	05412e83          	lw	t4,84(sp)
    3f8c:	05812b83          	lw	s7,88(sp)
    3f90:	05c12c83          	lw	s9,92(sp)
    3f94:	00060493          	mv	s1,a2
    3f98:	00676463          	bltu	a4,t1,3fa0 <_vfprintf_r+0x25a8>
    3f9c:	c59fe06f          	j	2bf4 <_vfprintf_r+0x11fc>
    3fa0:	00070313          	mv	t1,a4
    3fa4:	c51fe06f          	j	2bf4 <_vfprintf_r+0x11fc>
    3fa8:	0a412583          	lw	a1,164(sp)
    3fac:	0000be97          	auipc	t4,0xb
    3fb0:	fbce8e93          	add	t4,t4,-68 # ef68 <zeroes.0>
    3fb4:	069d5c63          	bge	s10,s1,402c <_vfprintf_r+0x2634>
    3fb8:	02812023          	sw	s0,32(sp)
    3fbc:	00048413          	mv	s0,s1
    3fc0:	000b0493          	mv	s1,s6
    3fc4:	00c0006f          	j	3fd0 <_vfprintf_r+0x25d8>
    3fc8:	ff040413          	add	s0,s0,-16
    3fcc:	048d5a63          	bge	s10,s0,4020 <_vfprintf_r+0x2628>
    3fd0:	01060613          	add	a2,a2,16
    3fd4:	00158593          	add	a1,a1,1
    3fd8:	01672023          	sw	s6,0(a4)
    3fdc:	01a72223          	sw	s10,4(a4)
    3fe0:	0ac12423          	sw	a2,168(sp)
    3fe4:	0ab12223          	sw	a1,164(sp)
    3fe8:	00870713          	add	a4,a4,8
    3fec:	fcb6dee3          	bge	a3,a1,3fc8 <_vfprintf_r+0x25d0>
    3ff0:	0a010613          	add	a2,sp,160
    3ff4:	00090593          	mv	a1,s2
    3ff8:	00098513          	mv	a0,s3
    3ffc:	0b9000ef          	jal	48b4 <__sprint_r>
    4000:	00050463          	beqz	a0,4008 <_vfprintf_r+0x2610>
    4004:	ec5fd06f          	j	1ec8 <_vfprintf_r+0x4d0>
    4008:	ff040413          	add	s0,s0,-16
    400c:	0a812603          	lw	a2,168(sp)
    4010:	0a412583          	lw	a1,164(sp)
    4014:	0ac10713          	add	a4,sp,172
    4018:	00700693          	li	a3,7
    401c:	fa8d4ae3          	blt	s10,s0,3fd0 <_vfprintf_r+0x25d8>
    4020:	00048e93          	mv	t4,s1
    4024:	00040493          	mv	s1,s0
    4028:	02012403          	lw	s0,32(sp)
    402c:	00960633          	add	a2,a2,s1
    4030:	00158593          	add	a1,a1,1
    4034:	01d72023          	sw	t4,0(a4)
    4038:	00972223          	sw	s1,4(a4)
    403c:	0ac12423          	sw	a2,168(sp)
    4040:	0ab12223          	sw	a1,164(sp)
    4044:	10b6ce63          	blt	a3,a1,4160 <_vfprintf_r+0x2768>
    4048:	000bc583          	lbu	a1,0(s7)
    404c:	00870713          	add	a4,a4,8
    4050:	00bc0c33          	add	s8,s8,a1
    4054:	f11ff06f          	j	3f64 <_vfprintf_r+0x256c>
    4058:	fffb8b93          	add	s7,s7,-1
    405c:	fffa0a13          	add	s4,s4,-1
    4060:	e85ff06f          	j	3ee4 <_vfprintf_r+0x24ec>
    4064:	0a010613          	add	a2,sp,160
    4068:	00090593          	mv	a1,s2
    406c:	00098513          	mv	a0,s3
    4070:	045000ef          	jal	48b4 <__sprint_r>
    4074:	00050463          	beqz	a0,407c <_vfprintf_r+0x2684>
    4078:	e51fd06f          	j	1ec8 <_vfprintf_r+0x4d0>
    407c:	0a812603          	lw	a2,168(sp)
    4080:	0ac10713          	add	a4,sp,172
    4084:	00700693          	li	a3,7
    4088:	e85ff06f          	j	3f0c <_vfprintf_r+0x2514>
    408c:	0a010613          	add	a2,sp,160
    4090:	00090593          	mv	a1,s2
    4094:	00098513          	mv	a0,s3
    4098:	01d000ef          	jal	48b4 <__sprint_r>
    409c:	00050463          	beqz	a0,40a4 <_vfprintf_r+0x26ac>
    40a0:	e29fd06f          	j	1ec8 <_vfprintf_r+0x4d0>
    40a4:	000bc583          	lbu	a1,0(s7)
    40a8:	0a812603          	lw	a2,168(sp)
    40ac:	0ac10713          	add	a4,sp,172
    40b0:	00700693          	li	a3,7
    40b4:	e99ff06f          	j	3f4c <_vfprintf_r+0x2554>
    40b8:	04c12783          	lw	a5,76(sp)
    40bc:	04812583          	lw	a1,72(sp)
    40c0:	00000913          	li	s2,0
    40c4:	40fc0c33          	sub	s8,s8,a5
    40c8:	00078613          	mv	a2,a5
    40cc:	000c0513          	mv	a0,s8
    40d0:	1dc030ef          	jal	72ac <strncpy>
    40d4:	00144783          	lbu	a5,1(s0)
    40d8:	00a00613          	li	a2,10
    40dc:	00000693          	li	a3,0
    40e0:	00f037b3          	snez	a5,a5
    40e4:	000d0513          	mv	a0,s10
    40e8:	000c8593          	mv	a1,s9
    40ec:	00f40433          	add	s0,s0,a5
    40f0:	6a1060ef          	jal	af90 <__udivdi3>
    40f4:	a10ff06f          	j	3304 <_vfprintf_r+0x190c>
    40f8:	09810713          	add	a4,sp,152
    40fc:	00000693          	li	a3,0
    4100:	08410613          	add	a2,sp,132
    4104:	00000593          	li	a1,0
    4108:	00098513          	mv	a0,s3
    410c:	01c12a23          	sw	t3,20(sp)
    4110:	01d12823          	sw	t4,16(sp)
    4114:	39c060ef          	jal	a4b0 <_wcsrtombs_r>
    4118:	fff00713          	li	a4,-1
    411c:	01012e83          	lw	t4,16(sp)
    4120:	01412e03          	lw	t3,20(sp)
    4124:	00050d13          	mv	s10,a0
    4128:	30e50063          	beq	a0,a4,4428 <_vfprintf_r+0x2a30>
    412c:	09812223          	sw	s8,132(sp)
    4130:	cacff06f          	j	35dc <_vfprintf_r+0x1be4>
    4134:	07714603          	lbu	a2,119(sp)
    4138:	01612a23          	sw	s6,20(sp)
    413c:	02012223          	sw	zero,36(sp)
    4140:	02012023          	sw	zero,32(sp)
    4144:	00012823          	sw	zero,16(sp)
    4148:	00000c93          	li	s9,0
    414c:	00000313          	li	t1,0
    4150:	00000a13          	li	s4,0
    4154:	00061463          	bnez	a2,415c <_vfprintf_r+0x2764>
    4158:	ae1fd06f          	j	1c38 <_vfprintf_r+0x240>
    415c:	efdfd06f          	j	2058 <_vfprintf_r+0x660>
    4160:	0a010613          	add	a2,sp,160
    4164:	00090593          	mv	a1,s2
    4168:	00098513          	mv	a0,s3
    416c:	748000ef          	jal	48b4 <__sprint_r>
    4170:	00050463          	beqz	a0,4178 <_vfprintf_r+0x2780>
    4174:	d55fd06f          	j	1ec8 <_vfprintf_r+0x4d0>
    4178:	000bc583          	lbu	a1,0(s7)
    417c:	0a812603          	lw	a2,168(sp)
    4180:	0ac10713          	add	a4,sp,172
    4184:	00700693          	li	a3,7
    4188:	00bc0c33          	add	s8,s8,a1
    418c:	dd9ff06f          	j	3f64 <_vfprintf_r+0x256c>
    4190:	00812583          	lw	a1,8(sp)
    4194:	0a010613          	add	a2,sp,160
    4198:	00098513          	mv	a0,s3
    419c:	05d12223          	sw	t4,68(sp)
    41a0:	714000ef          	jal	48b4 <__sprint_r>
    41a4:	00050463          	beqz	a0,41ac <_vfprintf_r+0x27b4>
    41a8:	d21fd06f          	j	1ec8 <_vfprintf_r+0x4d0>
    41ac:	0a812483          	lw	s1,168(sp)
    41b0:	04412e83          	lw	t4,68(sp)
    41b4:	0ac10413          	add	s0,sp,172
    41b8:	a19fe06f          	j	2bd0 <_vfprintf_r+0x11d8>
    41bc:	00900793          	li	a5,9
    41c0:	95a7e263          	bltu	a5,s10,3304 <_vfprintf_r+0x190c>
    41c4:	98cff06f          	j	3350 <_vfprintf_r+0x1958>
    41c8:	07c12a03          	lw	s4,124(sp)
    41cc:	00070793          	mv	a5,a4
    41d0:	9f1ff06f          	j	3bc0 <_vfprintf_r+0x21c8>
    41d4:	00812583          	lw	a1,8(sp)
    41d8:	0a010613          	add	a2,sp,160
    41dc:	00098513          	mv	a0,s3
    41e0:	03d12023          	sw	t4,32(sp)
    41e4:	6d0000ef          	jal	48b4 <__sprint_r>
    41e8:	00050463          	beqz	a0,41f0 <_vfprintf_r+0x27f8>
    41ec:	cddfd06f          	j	1ec8 <_vfprintf_r+0x4d0>
    41f0:	07c12d03          	lw	s10,124(sp)
    41f4:	01812783          	lw	a5,24(sp)
    41f8:	0a812483          	lw	s1,168(sp)
    41fc:	02012e83          	lw	t4,32(sp)
    4200:	0ac10413          	add	s0,sp,172
    4204:	41a78d33          	sub	s10,a5,s10
    4208:	a49fe06f          	j	2c50 <_vfprintf_r+0x1258>
    420c:	00650733          	add	a4,a0,t1
    4210:	04700d13          	li	s10,71
    4214:	94dff06f          	j	3b60 <_vfprintf_r+0x2168>
    4218:	02812603          	lw	a2,40(sp)
    421c:	00048593          	mv	a1,s1
    4220:	00000693          	li	a3,0
    4224:	00060513          	mv	a0,a2
    4228:	00000613          	li	a2,0
    422c:	04e12823          	sw	a4,80(sp)
    4230:	02612223          	sw	t1,36(sp)
    4234:	03c12023          	sw	t3,32(sp)
    4238:	01d12c23          	sw	t4,24(sp)
    423c:	3cd080ef          	jal	ce08 <__eqdf2>
    4240:	01812e83          	lw	t4,24(sp)
    4244:	02012e03          	lw	t3,32(sp)
    4248:	02412303          	lw	t1,36(sp)
    424c:	05012703          	lw	a4,80(sp)
    4250:	34051e63          	bnez	a0,45ac <_vfprintf_r+0x2bb4>
    4254:	07c12a03          	lw	s4,124(sp)
    4258:	01470733          	add	a4,a4,s4
    425c:	418707b3          	sub	a5,a4,s8
    4260:	00f12c23          	sw	a5,24(sp)
    4264:	001ef713          	and	a4,t4,1
    4268:	00676733          	or	a4,a4,t1
    426c:	37405a63          	blez	s4,45e0 <_vfprintf_r+0x2be8>
    4270:	26071263          	bnez	a4,44d4 <_vfprintf_r+0x2adc>
    4274:	000a0d13          	mv	s10,s4
    4278:	06600e13          	li	t3,102
    427c:	400eff13          	and	t5,t4,1024
    4280:	1c0f1a63          	bnez	t5,4454 <_vfprintf_r+0x2a5c>
    4284:	fffd4813          	not	a6,s10
    4288:	41f85813          	sra	a6,a6,0x1f
    428c:	010d7cb3          	and	s9,s10,a6
    4290:	bd9ff06f          	j	3e68 <_vfprintf_r+0x2470>
    4294:	01812783          	lw	a5,24(sp)
    4298:	03012703          	lw	a4,48(sp)
    429c:	06700e13          	li	t3,103
    42a0:	00e78d33          	add	s10,a5,a4
    42a4:	fd404ce3          	bgtz	s4,427c <_vfprintf_r+0x2884>
    42a8:	414d06b3          	sub	a3,s10,s4
    42ac:	00168d13          	add	s10,a3,1
    42b0:	fffd4813          	not	a6,s10
    42b4:	41f85813          	sra	a6,a6,0x1f
    42b8:	010d7cb3          	and	s9,s10,a6
    42bc:	badff06f          	j	3e68 <_vfprintf_r+0x2470>
    42c0:	000e8613          	mv	a2,t4
    42c4:	ad8fe06f          	j	259c <_vfprintf_r+0xba4>
    42c8:	00812783          	lw	a5,8(sp)
    42cc:	0647a783          	lw	a5,100(a5)
    42d0:	0017f793          	and	a5,a5,1
    42d4:	02079063          	bnez	a5,42f4 <_vfprintf_r+0x28fc>
    42d8:	00812783          	lw	a5,8(sp)
    42dc:	00c7d783          	lhu	a5,12(a5)
    42e0:	2007f793          	and	a5,a5,512
    42e4:	00079863          	bnez	a5,42f4 <_vfprintf_r+0x28fc>
    42e8:	00812783          	lw	a5,8(sp)
    42ec:	0587a503          	lw	a0,88(a5)
    42f0:	268030ef          	jal	7558 <__retarget_lock_release_recursive>
    42f4:	fff00793          	li	a5,-1
    42f8:	00f12623          	sw	a5,12(sp)
    42fc:	c2dfd06f          	j	1f28 <_vfprintf_r+0x530>
    4300:	ff000613          	li	a2,-16
    4304:	40d00d33          	neg	s10,a3
    4308:	0000b297          	auipc	t0,0xb
    430c:	c6028293          	add	t0,t0,-928 # ef68 <zeroes.0>
    4310:	08c6d463          	bge	a3,a2,4398 <_vfprintf_r+0x29a0>
    4314:	03212023          	sw	s2,32(sp)
    4318:	01000693          	li	a3,16
    431c:	00700b13          	li	s6,7
    4320:	000e8a13          	mv	s4,t4
    4324:	00028913          	mv	s2,t0
    4328:	00c0006f          	j	4334 <_vfprintf_r+0x293c>
    432c:	ff0d0d13          	add	s10,s10,-16
    4330:	05a6de63          	bge	a3,s10,438c <_vfprintf_r+0x2994>
    4334:	01048493          	add	s1,s1,16
    4338:	00170713          	add	a4,a4,1
    433c:	01242023          	sw	s2,0(s0)
    4340:	00d42223          	sw	a3,4(s0)
    4344:	0a912423          	sw	s1,168(sp)
    4348:	0ae12223          	sw	a4,164(sp)
    434c:	00840413          	add	s0,s0,8
    4350:	fceb5ee3          	bge	s6,a4,432c <_vfprintf_r+0x2934>
    4354:	00812583          	lw	a1,8(sp)
    4358:	0a010613          	add	a2,sp,160
    435c:	00098513          	mv	a0,s3
    4360:	554000ef          	jal	48b4 <__sprint_r>
    4364:	00050463          	beqz	a0,436c <_vfprintf_r+0x2974>
    4368:	b61fd06f          	j	1ec8 <_vfprintf_r+0x4d0>
    436c:	0a812483          	lw	s1,168(sp)
    4370:	0a412703          	lw	a4,164(sp)
    4374:	0ac10413          	add	s0,sp,172
    4378:	01000693          	li	a3,16
    437c:	fb1ff06f          	j	432c <_vfprintf_r+0x2934>
    4380:	00012823          	sw	zero,16(sp)
    4384:	0ec10c13          	add	s8,sp,236
    4388:	a88ff06f          	j	3610 <_vfprintf_r+0x1c18>
    438c:	00090293          	mv	t0,s2
    4390:	02012903          	lw	s2,32(sp)
    4394:	000a0e93          	mv	t4,s4
    4398:	01a484b3          	add	s1,s1,s10
    439c:	00170713          	add	a4,a4,1
    43a0:	00542023          	sw	t0,0(s0)
    43a4:	01a42223          	sw	s10,4(s0)
    43a8:	0a912423          	sw	s1,168(sp)
    43ac:	0ae12223          	sw	a4,164(sp)
    43b0:	00700693          	li	a3,7
    43b4:	00e6c463          	blt	a3,a4,43bc <_vfprintf_r+0x29c4>
    43b8:	b65fe06f          	j	2f1c <_vfprintf_r+0x1524>
    43bc:	00812583          	lw	a1,8(sp)
    43c0:	0a010613          	add	a2,sp,160
    43c4:	00098513          	mv	a0,s3
    43c8:	03d12023          	sw	t4,32(sp)
    43cc:	4e8000ef          	jal	48b4 <__sprint_r>
    43d0:	00050463          	beqz	a0,43d8 <_vfprintf_r+0x29e0>
    43d4:	af5fd06f          	j	1ec8 <_vfprintf_r+0x4d0>
    43d8:	0a812483          	lw	s1,168(sp)
    43dc:	0a412703          	lw	a4,164(sp)
    43e0:	02012e83          	lw	t4,32(sp)
    43e4:	0ac10413          	add	s0,sp,172
    43e8:	b20ff06f          	j	3708 <_vfprintf_r+0x1d10>
    43ec:	08a10693          	add	a3,sp,138
    43f0:	00061863          	bnez	a2,4400 <_vfprintf_r+0x2a08>
    43f4:	03000693          	li	a3,48
    43f8:	08d10523          	sb	a3,138(sp)
    43fc:	08b10693          	add	a3,sp,139
    4400:	15010793          	add	a5,sp,336
    4404:	40f68633          	sub	a2,a3,a5
    4408:	030d0713          	add	a4,s10,48
    440c:	0c960793          	add	a5,a2,201
    4410:	00e68023          	sb	a4,0(a3)
    4414:	04f12023          	sw	a5,64(sp)
    4418:	d5cff06f          	j	3974 <_vfprintf_r+0x1f7c>
    441c:	001ef713          	and	a4,t4,1
    4420:	d6070863          	beqz	a4,3990 <_vfprintf_r+0x1f98>
    4424:	d64ff06f          	j	3988 <_vfprintf_r+0x1f90>
    4428:	00812783          	lw	a5,8(sp)
    442c:	00000293          	li	t0,0
    4430:	00c79783          	lh	a5,12(a5)
    4434:	0407e793          	or	a5,a5,64
    4438:	00812703          	lw	a4,8(sp)
    443c:	00f71623          	sh	a5,12(a4)
    4440:	a8dfd06f          	j	1ecc <_vfprintf_r+0x4d4>
    4444:	00012823          	sw	zero,16(sp)
    4448:	00600313          	li	t1,6
    444c:	ff9fe06f          	j	3444 <_vfprintf_r+0x1a4c>
    4450:	06700e13          	li	t3,103
    4454:	03c12783          	lw	a5,60(sp)
    4458:	0ff00613          	li	a2,255
    445c:	0007c703          	lbu	a4,0(a5)
    4460:	22c70263          	beq	a4,a2,4684 <_vfprintf_r+0x2c8c>
    4464:	00000593          	li	a1,0
    4468:	00000693          	li	a3,0
    446c:	01475e63          	bge	a4,s4,4488 <_vfprintf_r+0x2a90>
    4470:	40ea0a33          	sub	s4,s4,a4
    4474:	0017c703          	lbu	a4,1(a5)
    4478:	04070863          	beqz	a4,44c8 <_vfprintf_r+0x2ad0>
    447c:	00168693          	add	a3,a3,1
    4480:	00178793          	add	a5,a5,1
    4484:	fec714e3          	bne	a4,a2,446c <_vfprintf_r+0x2a74>
    4488:	02f12e23          	sw	a5,60(sp)
    448c:	02d12023          	sw	a3,32(sp)
    4490:	02b12223          	sw	a1,36(sp)
    4494:	02012783          	lw	a5,32(sp)
    4498:	02412703          	lw	a4,36(sp)
    449c:	04c12583          	lw	a1,76(sp)
    44a0:	05c12823          	sw	t3,80(sp)
    44a4:	00e78533          	add	a0,a5,a4
    44a8:	2bc0a0ef          	jal	e764 <__mulsi3>
    44ac:	01a50d33          	add	s10,a0,s10
    44b0:	fffd4813          	not	a6,s10
    44b4:	41f85813          	sra	a6,a6,0x1f
    44b8:	05012e03          	lw	t3,80(sp)
    44bc:	010d7cb3          	and	s9,s10,a6
    44c0:	000b0e93          	mv	t4,s6
    44c4:	cecff06f          	j	39b0 <_vfprintf_r+0x1fb8>
    44c8:	0007c703          	lbu	a4,0(a5)
    44cc:	00158593          	add	a1,a1,1
    44d0:	fb5ff06f          	j	4484 <_vfprintf_r+0x2a8c>
    44d4:	03012783          	lw	a5,48(sp)
    44d8:	06600e13          	li	t3,102
    44dc:	00f306b3          	add	a3,t1,a5
    44e0:	01468d33          	add	s10,a3,s4
    44e4:	d99ff06f          	j	427c <_vfprintf_r+0x2884>
    44e8:	02c12783          	lw	a5,44(sp)
    44ec:	0a07c863          	bltz	a5,459c <_vfprintf_r+0x2ba4>
    44f0:	07714603          	lbu	a2,119(sp)
    44f4:	04700713          	li	a4,71
    44f8:	0000ac17          	auipc	s8,0xa
    44fc:	584c0c13          	add	s8,s8,1412 # ea7c <__fini_array_end+0x120>
    4500:	01c75463          	bge	a4,t3,4508 <_vfprintf_r+0x2b10>
    4504:	b31fd06f          	j	2034 <_vfprintf_r+0x63c>
    4508:	0000ac17          	auipc	s8,0xa
    450c:	570c0c13          	add	s8,s8,1392 # ea78 <__fini_array_end+0x11c>
    4510:	b25fd06f          	j	2034 <_vfprintf_r+0x63c>
    4514:	07714603          	lbu	a2,119(sp)
    4518:	01612a23          	sw	s6,20(sp)
    451c:	02012223          	sw	zero,36(sp)
    4520:	02012023          	sw	zero,32(sp)
    4524:	00030c93          	mv	s9,t1
    4528:	00030d13          	mv	s10,t1
    452c:	07300e13          	li	t3,115
    4530:	00000313          	li	t1,0
    4534:	00061463          	bnez	a2,453c <_vfprintf_r+0x2b44>
    4538:	f00fd06f          	j	1c38 <_vfprintf_r+0x240>
    453c:	b1dfd06f          	j	2058 <_vfprintf_r+0x660>
    4540:	00040313          	mv	t1,s0
    4544:	01012903          	lw	s2,16(sp)
    4548:	000b0413          	mv	s0,s6
    454c:	01412e03          	lw	t3,20(sp)
    4550:	000c0b13          	mv	s6,s8
    4554:	000a0e93          	mv	t4,s4
    4558:	000c8c13          	mv	s8,s9
    455c:	00030d13          	mv	s10,t1
    4560:	87cff06f          	j	35dc <_vfprintf_r+0x1be4>
    4564:	001b0793          	add	a5,s6,1
    4568:	000c0993          	mv	s3,s8
    456c:	02412903          	lw	s2,36(sp)
    4570:	04012e83          	lw	t4,64(sp)
    4574:	05012e03          	lw	t3,80(sp)
    4578:	05412403          	lw	s0,84(sp)
    457c:	000d0c13          	mv	s8,s10
    4580:	00f487b3          	add	a5,s1,a5
    4584:	03000693          	li	a3,48
    4588:	840b40e3          	bltz	s6,3dc8 <_vfprintf_r+0x23d0>
    458c:	00148493          	add	s1,s1,1
    4590:	fed48fa3          	sb	a3,-1(s1)
    4594:	fe979ce3          	bne	a5,s1,458c <_vfprintf_r+0x2b94>
    4598:	835ff06f          	j	3dcc <_vfprintf_r+0x23d4>
    459c:	02d00793          	li	a5,45
    45a0:	06f10ba3          	sb	a5,119(sp)
    45a4:	02d00613          	li	a2,45
    45a8:	f4dff06f          	j	44f4 <_vfprintf_r+0x2afc>
    45ac:	00100693          	li	a3,1
    45b0:	414686b3          	sub	a3,a3,s4
    45b4:	06d12e23          	sw	a3,124(sp)
    45b8:	da4ff06f          	j	3b5c <_vfprintf_r+0x2164>
    45bc:	01412783          	lw	a5,20(sp)
    45c0:	0007ab03          	lw	s6,0(a5)
    45c4:	00478793          	add	a5,a5,4
    45c8:	000b5463          	bgez	s6,45d0 <_vfprintf_r+0x2bd8>
    45cc:	fff00b13          	li	s6,-1
    45d0:	00194e03          	lbu	t3,1(s2)
    45d4:	00f12a23          	sw	a5,20(sp)
    45d8:	00068913          	mv	s2,a3
    45dc:	dccfd06f          	j	1ba8 <_vfprintf_r+0x1b0>
    45e0:	00071a63          	bnez	a4,45f4 <_vfprintf_r+0x2bfc>
    45e4:	00100c93          	li	s9,1
    45e8:	06600e13          	li	t3,102
    45ec:	00100d13          	li	s10,1
    45f0:	879ff06f          	j	3e68 <_vfprintf_r+0x2470>
    45f4:	03012783          	lw	a5,48(sp)
    45f8:	06600e13          	li	t3,102
    45fc:	00178693          	add	a3,a5,1
    4600:	00668d33          	add	s10,a3,t1
    4604:	fffd4813          	not	a6,s10
    4608:	41f85813          	sra	a6,a6,0x1f
    460c:	010d7cb3          	and	s9,s10,a6
    4610:	859ff06f          	j	3e68 <_vfprintf_r+0x2470>
    4614:	00200793          	li	a5,2
    4618:	04f12023          	sw	a5,64(sp)
    461c:	b58ff06f          	j	3974 <_vfprintf_r+0x1f7c>
    4620:	00812703          	lw	a4,8(sp)
    4624:	00c71783          	lh	a5,12(a4)
    4628:	0407e793          	or	a5,a5,64
    462c:	00f71623          	sh	a5,12(a4)
    4630:	8b5fd06f          	j	1ee4 <_vfprintf_r+0x4ec>
    4634:	000a0513          	mv	a0,s4
    4638:	000d0593          	mv	a1,s10
    463c:	00030613          	mv	a2,t1
    4640:	00038693          	mv	a3,t2
    4644:	05012023          	sw	a6,64(sp)
    4648:	03c12223          	sw	t3,36(sp)
    464c:	01d12c23          	sw	t4,24(sp)
    4650:	7b8080ef          	jal	ce08 <__eqdf2>
    4654:	01812e83          	lw	t4,24(sp)
    4658:	02412e03          	lw	t3,36(sp)
    465c:	04012803          	lw	a6,64(sp)
    4660:	f6051463          	bnez	a0,3dc8 <_vfprintf_r+0x23d0>
    4664:	001b7693          	and	a3,s6,1
    4668:	f6068063          	beqz	a3,3dc8 <_vfprintf_r+0x23d0>
    466c:	f14ff06f          	j	3d80 <_vfprintf_r+0x2388>
    4670:	00812783          	lw	a5,8(sp)
    4674:	01012283          	lw	t0,16(sp)
    4678:	00c79783          	lh	a5,12(a5)
    467c:	0407e793          	or	a5,a5,64
    4680:	db9ff06f          	j	4438 <_vfprintf_r+0x2a40>
    4684:	02012223          	sw	zero,36(sp)
    4688:	02012023          	sw	zero,32(sp)
    468c:	e09ff06f          	j	4494 <_vfprintf_r+0x2a9c>
    4690:	04500d13          	li	s10,69
    4694:	cccff06f          	j	3b60 <_vfprintf_r+0x2168>

00004698 <__sbprintf>:
    4698:	b7010113          	add	sp,sp,-1168
    469c:	00c59783          	lh	a5,12(a1)
    46a0:	00e5d703          	lhu	a4,14(a1)
    46a4:	48812423          	sw	s0,1160(sp)
    46a8:	00058413          	mv	s0,a1
    46ac:	000105b7          	lui	a1,0x10
    46b0:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0xcad>
    46b4:	06442303          	lw	t1,100(s0)
    46b8:	01c42883          	lw	a7,28(s0)
    46bc:	02442803          	lw	a6,36(s0)
    46c0:	01071713          	sll	a4,a4,0x10
    46c4:	00b7f7b3          	and	a5,a5,a1
    46c8:	00e7e7b3          	or	a5,a5,a4
    46cc:	40000593          	li	a1,1024
    46d0:	49212023          	sw	s2,1152(sp)
    46d4:	00f12a23          	sw	a5,20(sp)
    46d8:	00050913          	mv	s2,a0
    46dc:	07010793          	add	a5,sp,112
    46e0:	06010513          	add	a0,sp,96
    46e4:	48112623          	sw	ra,1164(sp)
    46e8:	48912223          	sw	s1,1156(sp)
    46ec:	47312e23          	sw	s3,1148(sp)
    46f0:	00060493          	mv	s1,a2
    46f4:	00068993          	mv	s3,a3
    46f8:	06612623          	sw	t1,108(sp)
    46fc:	03112223          	sw	a7,36(sp)
    4700:	03012623          	sw	a6,44(sp)
    4704:	00f12423          	sw	a5,8(sp)
    4708:	00f12c23          	sw	a5,24(sp)
    470c:	00b12823          	sw	a1,16(sp)
    4710:	00b12e23          	sw	a1,28(sp)
    4714:	02012023          	sw	zero,32(sp)
    4718:	635020ef          	jal	754c <__retarget_lock_init_recursive>
    471c:	00048613          	mv	a2,s1
    4720:	00098693          	mv	a3,s3
    4724:	00810593          	add	a1,sp,8
    4728:	00090513          	mv	a0,s2
    472c:	accfd0ef          	jal	19f8 <_vfprintf_r>
    4730:	00050493          	mv	s1,a0
    4734:	04055263          	bgez	a0,4778 <__sbprintf+0xe0>
    4738:	01415783          	lhu	a5,20(sp)
    473c:	0407f793          	and	a5,a5,64
    4740:	00078863          	beqz	a5,4750 <__sbprintf+0xb8>
    4744:	00c45783          	lhu	a5,12(s0)
    4748:	0407e793          	or	a5,a5,64
    474c:	00f41623          	sh	a5,12(s0)
    4750:	06012503          	lw	a0,96(sp)
    4754:	5fd020ef          	jal	7550 <__retarget_lock_close_recursive>
    4758:	48c12083          	lw	ra,1164(sp)
    475c:	48812403          	lw	s0,1160(sp)
    4760:	48012903          	lw	s2,1152(sp)
    4764:	47c12983          	lw	s3,1148(sp)
    4768:	00048513          	mv	a0,s1
    476c:	48412483          	lw	s1,1156(sp)
    4770:	49010113          	add	sp,sp,1168
    4774:	00008067          	ret
    4778:	00810593          	add	a1,sp,8
    477c:	00090513          	mv	a0,s2
    4780:	449010ef          	jal	63c8 <_fflush_r>
    4784:	fa050ae3          	beqz	a0,4738 <__sbprintf+0xa0>
    4788:	fff00493          	li	s1,-1
    478c:	fadff06f          	j	4738 <__sbprintf+0xa0>

00004790 <__sprint_r.part.0>:
    4790:	0645a783          	lw	a5,100(a1)
    4794:	fd010113          	add	sp,sp,-48
    4798:	01612823          	sw	s6,16(sp)
    479c:	02112623          	sw	ra,44(sp)
    47a0:	01279713          	sll	a4,a5,0x12
    47a4:	00060b13          	mv	s6,a2
    47a8:	0e075863          	bgez	a4,4898 <__sprint_r.part.0+0x108>
    47ac:	00862783          	lw	a5,8(a2)
    47b0:	03212023          	sw	s2,32(sp)
    47b4:	01312e23          	sw	s3,28(sp)
    47b8:	01512a23          	sw	s5,20(sp)
    47bc:	01712623          	sw	s7,12(sp)
    47c0:	00058913          	mv	s2,a1
    47c4:	00062b83          	lw	s7,0(a2)
    47c8:	00050993          	mv	s3,a0
    47cc:	fff00a93          	li	s5,-1
    47d0:	0a078863          	beqz	a5,4880 <__sprint_r.part.0+0xf0>
    47d4:	02812423          	sw	s0,40(sp)
    47d8:	02912223          	sw	s1,36(sp)
    47dc:	01412c23          	sw	s4,24(sp)
    47e0:	01812423          	sw	s8,8(sp)
    47e4:	004bac03          	lw	s8,4(s7)
    47e8:	000ba403          	lw	s0,0(s7)
    47ec:	002c5a13          	srl	s4,s8,0x2
    47f0:	060a0663          	beqz	s4,485c <__sprint_r.part.0+0xcc>
    47f4:	00000493          	li	s1,0
    47f8:	00c0006f          	j	4804 <__sprint_r.part.0+0x74>
    47fc:	00440413          	add	s0,s0,4
    4800:	049a0c63          	beq	s4,s1,4858 <__sprint_r.part.0+0xc8>
    4804:	00042583          	lw	a1,0(s0)
    4808:	00090613          	mv	a2,s2
    480c:	00098513          	mv	a0,s3
    4810:	10d020ef          	jal	711c <_fputwc_r>
    4814:	00148493          	add	s1,s1,1
    4818:	ff5512e3          	bne	a0,s5,47fc <__sprint_r.part.0+0x6c>
    481c:	02812403          	lw	s0,40(sp)
    4820:	02412483          	lw	s1,36(sp)
    4824:	02012903          	lw	s2,32(sp)
    4828:	01c12983          	lw	s3,28(sp)
    482c:	01812a03          	lw	s4,24(sp)
    4830:	01412a83          	lw	s5,20(sp)
    4834:	00c12b83          	lw	s7,12(sp)
    4838:	00812c03          	lw	s8,8(sp)
    483c:	fff00513          	li	a0,-1
    4840:	02c12083          	lw	ra,44(sp)
    4844:	000b2423          	sw	zero,8(s6)
    4848:	000b2223          	sw	zero,4(s6)
    484c:	01012b03          	lw	s6,16(sp)
    4850:	03010113          	add	sp,sp,48
    4854:	00008067          	ret
    4858:	008b2783          	lw	a5,8(s6)
    485c:	ffcc7c13          	and	s8,s8,-4
    4860:	418787b3          	sub	a5,a5,s8
    4864:	00fb2423          	sw	a5,8(s6)
    4868:	008b8b93          	add	s7,s7,8
    486c:	f6079ce3          	bnez	a5,47e4 <__sprint_r.part.0+0x54>
    4870:	02812403          	lw	s0,40(sp)
    4874:	02412483          	lw	s1,36(sp)
    4878:	01812a03          	lw	s4,24(sp)
    487c:	00812c03          	lw	s8,8(sp)
    4880:	02012903          	lw	s2,32(sp)
    4884:	01c12983          	lw	s3,28(sp)
    4888:	01412a83          	lw	s5,20(sp)
    488c:	00c12b83          	lw	s7,12(sp)
    4890:	00000513          	li	a0,0
    4894:	fadff06f          	j	4840 <__sprint_r.part.0+0xb0>
    4898:	6b5010ef          	jal	674c <__sfvwrite_r>
    489c:	02c12083          	lw	ra,44(sp)
    48a0:	000b2423          	sw	zero,8(s6)
    48a4:	000b2223          	sw	zero,4(s6)
    48a8:	01012b03          	lw	s6,16(sp)
    48ac:	03010113          	add	sp,sp,48
    48b0:	00008067          	ret

000048b4 <__sprint_r>:
    48b4:	00862703          	lw	a4,8(a2)
    48b8:	00070463          	beqz	a4,48c0 <__sprint_r+0xc>
    48bc:	ed5ff06f          	j	4790 <__sprint_r.part.0>
    48c0:	00062223          	sw	zero,4(a2)
    48c4:	00000513          	li	a0,0
    48c8:	00008067          	ret

000048cc <_vfiprintf_r>:
    48cc:	eb010113          	add	sp,sp,-336
    48d0:	14812423          	sw	s0,328(sp)
    48d4:	13312e23          	sw	s3,316(sp)
    48d8:	13812423          	sw	s8,296(sp)
    48dc:	00050413          	mv	s0,a0
    48e0:	00058993          	mv	s3,a1
    48e4:	00060c13          	mv	s8,a2
    48e8:	00000593          	li	a1,0
    48ec:	00800613          	li	a2,8
    48f0:	05010513          	add	a0,sp,80
    48f4:	13512a23          	sw	s5,308(sp)
    48f8:	14112623          	sw	ra,332(sp)
    48fc:	00068a93          	mv	s5,a3
    4900:	9a4fc0ef          	jal	aa4 <memset>
    4904:	00040863          	beqz	s0,4914 <_vfiprintf_r+0x48>
    4908:	03442783          	lw	a5,52(s0)
    490c:	00079463          	bnez	a5,4914 <_vfiprintf_r+0x48>
    4910:	49c0106f          	j	5dac <_vfiprintf_r+0x14e0>
    4914:	0649a703          	lw	a4,100(s3)
    4918:	00c99783          	lh	a5,12(s3)
    491c:	00177713          	and	a4,a4,1
    4920:	00071863          	bnez	a4,4930 <_vfiprintf_r+0x64>
    4924:	2007f713          	and	a4,a5,512
    4928:	00071463          	bnez	a4,4930 <_vfiprintf_r+0x64>
    492c:	0b80106f          	j	59e4 <_vfiprintf_r+0x1118>
    4930:	01279713          	sll	a4,a5,0x12
    4934:	02074663          	bltz	a4,4960 <_vfiprintf_r+0x94>
    4938:	0649a703          	lw	a4,100(s3)
    493c:	00002637          	lui	a2,0x2
    4940:	ffffe6b7          	lui	a3,0xffffe
    4944:	00c7e7b3          	or	a5,a5,a2
    4948:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    494c:	01079793          	sll	a5,a5,0x10
    4950:	4107d793          	sra	a5,a5,0x10
    4954:	00d77733          	and	a4,a4,a3
    4958:	00f99623          	sh	a5,12(s3)
    495c:	06e9a223          	sw	a4,100(s3)
    4960:	0087f713          	and	a4,a5,8
    4964:	2e070463          	beqz	a4,4c4c <_vfiprintf_r+0x380>
    4968:	0109a703          	lw	a4,16(s3)
    496c:	2e070063          	beqz	a4,4c4c <_vfiprintf_r+0x380>
    4970:	01a7f713          	and	a4,a5,26
    4974:	00a00693          	li	a3,10
    4978:	2ed70c63          	beq	a4,a3,4c70 <_vfiprintf_r+0x3a4>
    497c:	13412c23          	sw	s4,312(sp)
    4980:	06c10a13          	add	s4,sp,108
    4984:	14912223          	sw	s1,324(sp)
    4988:	15212023          	sw	s2,320(sp)
    498c:	13612823          	sw	s6,304(sp)
    4990:	13712623          	sw	s7,300(sp)
    4994:	13912223          	sw	s9,292(sp)
    4998:	13a12023          	sw	s10,288(sp)
    499c:	000c0c93          	mv	s9,s8
    49a0:	11b12e23          	sw	s11,284(sp)
    49a4:	07412023          	sw	s4,96(sp)
    49a8:	06012423          	sw	zero,104(sp)
    49ac:	06012223          	sw	zero,100(sp)
    49b0:	00012a23          	sw	zero,20(sp)
    49b4:	02012623          	sw	zero,44(sp)
    49b8:	02012823          	sw	zero,48(sp)
    49bc:	02012a23          	sw	zero,52(sp)
    49c0:	00012623          	sw	zero,12(sp)
    49c4:	7fffc497          	auipc	s1,0x7fffc
    49c8:	b7048493          	add	s1,s1,-1168 # 80000534 <__global_locale>
    49cc:	02500913          	li	s2,37
    49d0:	0000ab97          	auipc	s7,0xa
    49d4:	5b8b8b93          	add	s7,s7,1464 # ef88 <blanks.1+0x10>
    49d8:	0000ab17          	auipc	s6,0xa
    49dc:	71cb0b13          	add	s6,s6,1820 # f0f4 <zeroes.0>
    49e0:	000a0c13          	mv	s8,s4
    49e4:	000c8d93          	mv	s11,s9
    49e8:	0e44ad03          	lw	s10,228(s1)
    49ec:	16d020ef          	jal	7358 <__locale_mb_cur_max>
    49f0:	00050693          	mv	a3,a0
    49f4:	05010713          	add	a4,sp,80
    49f8:	000d8613          	mv	a2,s11
    49fc:	04810593          	add	a1,sp,72
    4a00:	00040513          	mv	a0,s0
    4a04:	000d00e7          	jalr	s10
    4a08:	2e050e63          	beqz	a0,4d04 <_vfiprintf_r+0x438>
    4a0c:	2c054e63          	bltz	a0,4ce8 <_vfiprintf_r+0x41c>
    4a10:	04812783          	lw	a5,72(sp)
    4a14:	01278663          	beq	a5,s2,4a20 <_vfiprintf_r+0x154>
    4a18:	00ad8db3          	add	s11,s11,a0
    4a1c:	fcdff06f          	j	49e8 <_vfiprintf_r+0x11c>
    4a20:	00050d13          	mv	s10,a0
    4a24:	419d87b3          	sub	a5,s11,s9
    4a28:	2f9d9463          	bne	s11,s9,4d10 <_vfiprintf_r+0x444>
    4a2c:	00000e13          	li	t3,0
    4a30:	001dc683          	lbu	a3,1(s11)
    4a34:	001d8c93          	add	s9,s11,1
    4a38:	040101a3          	sb	zero,67(sp)
    4a3c:	fff00713          	li	a4,-1
    4a40:	00000893          	li	a7,0
    4a44:	05a00d13          	li	s10,90
    4a48:	000e0d93          	mv	s11,t3
    4a4c:	001c8c93          	add	s9,s9,1
    4a50:	fe068793          	add	a5,a3,-32
    4a54:	04fd6663          	bltu	s10,a5,4aa0 <_vfiprintf_r+0x1d4>
    4a58:	00279793          	sll	a5,a5,0x2
    4a5c:	017787b3          	add	a5,a5,s7
    4a60:	0007a783          	lw	a5,0(a5)
    4a64:	017787b3          	add	a5,a5,s7
    4a68:	00078067          	jr	a5
    4a6c:	00000893          	li	a7,0
    4a70:	fd068793          	add	a5,a3,-48
    4a74:	00900593          	li	a1,9
    4a78:	000cc683          	lbu	a3,0(s9)
    4a7c:	00289613          	sll	a2,a7,0x2
    4a80:	011608b3          	add	a7,a2,a7
    4a84:	00189893          	sll	a7,a7,0x1
    4a88:	011788b3          	add	a7,a5,a7
    4a8c:	fd068793          	add	a5,a3,-48
    4a90:	001c8c93          	add	s9,s9,1
    4a94:	fef5f2e3          	bgeu	a1,a5,4a78 <_vfiprintf_r+0x1ac>
    4a98:	fe068793          	add	a5,a3,-32
    4a9c:	fafd7ee3          	bgeu	s10,a5,4a58 <_vfiprintf_r+0x18c>
    4aa0:	000d8e13          	mv	t3,s11
    4aa4:	2c068663          	beqz	a3,4d70 <_vfiprintf_r+0x4a4>
    4aa8:	0ad10623          	sb	a3,172(sp)
    4aac:	040101a3          	sb	zero,67(sp)
    4ab0:	00100e93          	li	t4,1
    4ab4:	00100d13          	li	s10,1
    4ab8:	0ac10813          	add	a6,sp,172
    4abc:	00012823          	sw	zero,16(sp)
    4ac0:	00000713          	li	a4,0
    4ac4:	00000f93          	li	t6,0
    4ac8:	06412603          	lw	a2,100(sp)
    4acc:	084e7293          	and	t0,t3,132
    4ad0:	06812783          	lw	a5,104(sp)
    4ad4:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x609>
    4ad8:	00058f13          	mv	t5,a1
    4adc:	00029663          	bnez	t0,4ae8 <_vfiprintf_r+0x21c>
    4ae0:	41d88db3          	sub	s11,a7,t4
    4ae4:	47b046e3          	bgtz	s11,5750 <_vfiprintf_r+0xe84>
    4ae8:	04314583          	lbu	a1,67(sp)
    4aec:	02058a63          	beqz	a1,4b20 <_vfiprintf_r+0x254>
    4af0:	04310613          	add	a2,sp,67
    4af4:	00178793          	add	a5,a5,1
    4af8:	00100693          	li	a3,1
    4afc:	00cc2023          	sw	a2,0(s8)
    4b00:	00dc2223          	sw	a3,4(s8)
    4b04:	06f12423          	sw	a5,104(sp)
    4b08:	07e12223          	sw	t5,100(sp)
    4b0c:	00700613          	li	a2,7
    4b10:	35e64ce3          	blt	a2,t5,5668 <_vfiprintf_r+0xd9c>
    4b14:	000f0613          	mv	a2,t5
    4b18:	008c0c13          	add	s8,s8,8
    4b1c:	001f0f13          	add	t5,t5,1
    4b20:	080f8063          	beqz	t6,4ba0 <_vfiprintf_r+0x2d4>
    4b24:	00200613          	li	a2,2
    4b28:	00278793          	add	a5,a5,2
    4b2c:	04410693          	add	a3,sp,68
    4b30:	00cc2223          	sw	a2,4(s8)
    4b34:	00dc2023          	sw	a3,0(s8)
    4b38:	06f12423          	sw	a5,104(sp)
    4b3c:	07e12223          	sw	t5,100(sp)
    4b40:	00700613          	li	a2,7
    4b44:	3be652e3          	bge	a2,t5,56e8 <_vfiprintf_r+0xe1c>
    4b48:	60078ae3          	beqz	a5,595c <_vfiprintf_r+0x1090>
    4b4c:	06010613          	add	a2,sp,96
    4b50:	00098593          	mv	a1,s3
    4b54:	00040513          	mv	a0,s0
    4b58:	03d12c23          	sw	t4,56(sp)
    4b5c:	02e12423          	sw	a4,40(sp)
    4b60:	03112223          	sw	a7,36(sp)
    4b64:	03012023          	sw	a6,32(sp)
    4b68:	00512e23          	sw	t0,28(sp)
    4b6c:	01c12c23          	sw	t3,24(sp)
    4b70:	c21ff0ef          	jal	4790 <__sprint_r.part.0>
    4b74:	22051463          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    4b78:	06412603          	lw	a2,100(sp)
    4b7c:	06812783          	lw	a5,104(sp)
    4b80:	03812e83          	lw	t4,56(sp)
    4b84:	02812703          	lw	a4,40(sp)
    4b88:	02412883          	lw	a7,36(sp)
    4b8c:	02012803          	lw	a6,32(sp)
    4b90:	01c12283          	lw	t0,28(sp)
    4b94:	01812e03          	lw	t3,24(sp)
    4b98:	000a0c13          	mv	s8,s4
    4b9c:	00160f13          	add	t5,a2,1
    4ba0:	08000593          	li	a1,128
    4ba4:	06b286e3          	beq	t0,a1,5410 <_vfiprintf_r+0xb44>
    4ba8:	41a70733          	sub	a4,a4,s10
    4bac:	1ae04ae3          	bgtz	a4,5560 <_vfiprintf_r+0xc94>
    4bb0:	00fd07b3          	add	a5,s10,a5
    4bb4:	010c2023          	sw	a6,0(s8)
    4bb8:	01ac2223          	sw	s10,4(s8)
    4bbc:	06f12423          	sw	a5,104(sp)
    4bc0:	07e12223          	sw	t5,100(sp)
    4bc4:	00700713          	li	a4,7
    4bc8:	03e758e3          	bge	a4,t5,53f8 <_vfiprintf_r+0xb2c>
    4bcc:	24078063          	beqz	a5,4e0c <_vfiprintf_r+0x540>
    4bd0:	06010613          	add	a2,sp,96
    4bd4:	00098593          	mv	a1,s3
    4bd8:	00040513          	mv	a0,s0
    4bdc:	03d12023          	sw	t4,32(sp)
    4be0:	01112e23          	sw	a7,28(sp)
    4be4:	01c12c23          	sw	t3,24(sp)
    4be8:	ba9ff0ef          	jal	4790 <__sprint_r.part.0>
    4bec:	1a051863          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    4bf0:	06812783          	lw	a5,104(sp)
    4bf4:	02012e83          	lw	t4,32(sp)
    4bf8:	01c12883          	lw	a7,28(sp)
    4bfc:	01812e03          	lw	t3,24(sp)
    4c00:	000a0c13          	mv	s8,s4
    4c04:	004e7e13          	and	t3,t3,4
    4c08:	000e0663          	beqz	t3,4c14 <_vfiprintf_r+0x348>
    4c0c:	41d88db3          	sub	s11,a7,t4
    4c10:	21b04a63          	bgtz	s11,4e24 <_vfiprintf_r+0x558>
    4c14:	01d8d463          	bge	a7,t4,4c1c <_vfiprintf_r+0x350>
    4c18:	000e8893          	mv	a7,t4
    4c1c:	00c12703          	lw	a4,12(sp)
    4c20:	01170733          	add	a4,a4,a7
    4c24:	00e12623          	sw	a4,12(sp)
    4c28:	16079063          	bnez	a5,4d88 <_vfiprintf_r+0x4bc>
    4c2c:	01012783          	lw	a5,16(sp)
    4c30:	06012223          	sw	zero,100(sp)
    4c34:	00078863          	beqz	a5,4c44 <_vfiprintf_r+0x378>
    4c38:	00078593          	mv	a1,a5
    4c3c:	00040513          	mv	a0,s0
    4c40:	ab4fc0ef          	jal	ef4 <_free_r>
    4c44:	000a0c13          	mv	s8,s4
    4c48:	d9dff06f          	j	49e4 <_vfiprintf_r+0x118>
    4c4c:	00098593          	mv	a1,s3
    4c50:	00040513          	mv	a0,s0
    4c54:	224020ef          	jal	6e78 <__swsetup_r>
    4c58:	00050463          	beqz	a0,4c60 <_vfiprintf_r+0x394>
    4c5c:	3840106f          	j	5fe0 <_vfiprintf_r+0x1714>
    4c60:	00c99783          	lh	a5,12(s3)
    4c64:	00a00693          	li	a3,10
    4c68:	01a7f713          	and	a4,a5,26
    4c6c:	d0d718e3          	bne	a4,a3,497c <_vfiprintf_r+0xb0>
    4c70:	00e99703          	lh	a4,14(s3)
    4c74:	d00744e3          	bltz	a4,497c <_vfiprintf_r+0xb0>
    4c78:	0649a703          	lw	a4,100(s3)
    4c7c:	00177713          	and	a4,a4,1
    4c80:	00071863          	bnez	a4,4c90 <_vfiprintf_r+0x3c4>
    4c84:	2007f793          	and	a5,a5,512
    4c88:	00079463          	bnez	a5,4c90 <_vfiprintf_r+0x3c4>
    4c8c:	2ac0106f          	j	5f38 <_vfiprintf_r+0x166c>
    4c90:	000a8693          	mv	a3,s5
    4c94:	000c0613          	mv	a2,s8
    4c98:	00098593          	mv	a1,s3
    4c9c:	00040513          	mv	a0,s0
    4ca0:	3e4010ef          	jal	6084 <__sbprintf>
    4ca4:	14c12083          	lw	ra,332(sp)
    4ca8:	14812403          	lw	s0,328(sp)
    4cac:	00a12623          	sw	a0,12(sp)
    4cb0:	00c12503          	lw	a0,12(sp)
    4cb4:	13c12983          	lw	s3,316(sp)
    4cb8:	13412a83          	lw	s5,308(sp)
    4cbc:	12812c03          	lw	s8,296(sp)
    4cc0:	15010113          	add	sp,sp,336
    4cc4:	00008067          	ret
    4cc8:	000aa883          	lw	a7,0(s5)
    4ccc:	004a8a93          	add	s5,s5,4
    4cd0:	3608cc63          	bltz	a7,5048 <_vfiprintf_r+0x77c>
    4cd4:	000cc683          	lbu	a3,0(s9)
    4cd8:	d75ff06f          	j	4a4c <_vfiprintf_r+0x180>
    4cdc:	000cc683          	lbu	a3,0(s9)
    4ce0:	020ded93          	or	s11,s11,32
    4ce4:	d69ff06f          	j	4a4c <_vfiprintf_r+0x180>
    4ce8:	00800613          	li	a2,8
    4cec:	00000593          	li	a1,0
    4cf0:	05010513          	add	a0,sp,80
    4cf4:	db1fb0ef          	jal	aa4 <memset>
    4cf8:	00100513          	li	a0,1
    4cfc:	00ad8db3          	add	s11,s11,a0
    4d00:	ce9ff06f          	j	49e8 <_vfiprintf_r+0x11c>
    4d04:	00050d13          	mv	s10,a0
    4d08:	419d87b3          	sub	a5,s11,s9
    4d0c:	079d8263          	beq	s11,s9,4d70 <_vfiprintf_r+0x4a4>
    4d10:	06812683          	lw	a3,104(sp)
    4d14:	06412703          	lw	a4,100(sp)
    4d18:	019c2023          	sw	s9,0(s8)
    4d1c:	00d786b3          	add	a3,a5,a3
    4d20:	00170713          	add	a4,a4,1
    4d24:	00fc2223          	sw	a5,4(s8)
    4d28:	06d12423          	sw	a3,104(sp)
    4d2c:	06e12223          	sw	a4,100(sp)
    4d30:	00700613          	li	a2,7
    4d34:	008c0c13          	add	s8,s8,8
    4d38:	02e65463          	bge	a2,a4,4d60 <_vfiprintf_r+0x494>
    4d3c:	38068ce3          	beqz	a3,58d4 <_vfiprintf_r+0x1008>
    4d40:	06010613          	add	a2,sp,96
    4d44:	00098593          	mv	a1,s3
    4d48:	00040513          	mv	a0,s0
    4d4c:	00f12823          	sw	a5,16(sp)
    4d50:	a41ff0ef          	jal	4790 <__sprint_r.part.0>
    4d54:	01012783          	lw	a5,16(sp)
    4d58:	04051c63          	bnez	a0,4db0 <_vfiprintf_r+0x4e4>
    4d5c:	000a0c13          	mv	s8,s4
    4d60:	00c12703          	lw	a4,12(sp)
    4d64:	00f707b3          	add	a5,a4,a5
    4d68:	00f12623          	sw	a5,12(sp)
    4d6c:	cc0d10e3          	bnez	s10,4a2c <_vfiprintf_r+0x160>
    4d70:	06812783          	lw	a5,104(sp)
    4d74:	00078463          	beqz	a5,4d7c <_vfiprintf_r+0x4b0>
    4d78:	22c0106f          	j	5fa4 <_vfiprintf_r+0x16d8>
    4d7c:	00c99783          	lh	a5,12(s3)
    4d80:	06012223          	sw	zero,100(sp)
    4d84:	0300006f          	j	4db4 <_vfiprintf_r+0x4e8>
    4d88:	06010613          	add	a2,sp,96
    4d8c:	00098593          	mv	a1,s3
    4d90:	00040513          	mv	a0,s0
    4d94:	9fdff0ef          	jal	4790 <__sprint_r.part.0>
    4d98:	e8050ae3          	beqz	a0,4c2c <_vfiprintf_r+0x360>
    4d9c:	01012783          	lw	a5,16(sp)
    4da0:	00078863          	beqz	a5,4db0 <_vfiprintf_r+0x4e4>
    4da4:	01012583          	lw	a1,16(sp)
    4da8:	00040513          	mv	a0,s0
    4dac:	948fc0ef          	jal	ef4 <_free_r>
    4db0:	00c99783          	lh	a5,12(s3)
    4db4:	0649a703          	lw	a4,100(s3)
    4db8:	00177713          	and	a4,a4,1
    4dbc:	16070a63          	beqz	a4,4f30 <_vfiprintf_r+0x664>
    4dc0:	0407f793          	and	a5,a5,64
    4dc4:	14412483          	lw	s1,324(sp)
    4dc8:	14012903          	lw	s2,320(sp)
    4dcc:	13812a03          	lw	s4,312(sp)
    4dd0:	13012b03          	lw	s6,304(sp)
    4dd4:	12c12b83          	lw	s7,300(sp)
    4dd8:	12412c83          	lw	s9,292(sp)
    4ddc:	12012d03          	lw	s10,288(sp)
    4de0:	11c12d83          	lw	s11,284(sp)
    4de4:	00078463          	beqz	a5,4dec <_vfiprintf_r+0x520>
    4de8:	2180106f          	j	6000 <_vfiprintf_r+0x1734>
    4dec:	14c12083          	lw	ra,332(sp)
    4df0:	14812403          	lw	s0,328(sp)
    4df4:	00c12503          	lw	a0,12(sp)
    4df8:	13c12983          	lw	s3,316(sp)
    4dfc:	13412a83          	lw	s5,308(sp)
    4e00:	12812c03          	lw	s8,296(sp)
    4e04:	15010113          	add	sp,sp,336
    4e08:	00008067          	ret
    4e0c:	06012223          	sw	zero,100(sp)
    4e10:	004e7e13          	and	t3,t3,4
    4e14:	240e0ee3          	beqz	t3,5870 <_vfiprintf_r+0xfa4>
    4e18:	41d88db3          	sub	s11,a7,t4
    4e1c:	25b05ae3          	blez	s11,5870 <_vfiprintf_r+0xfa4>
    4e20:	000a0c13          	mv	s8,s4
    4e24:	01000713          	li	a4,16
    4e28:	06412683          	lw	a3,100(sp)
    4e2c:	01b74463          	blt	a4,s11,4e34 <_vfiprintf_r+0x568>
    4e30:	1900106f          	j	5fc0 <_vfiprintf_r+0x16f4>
    4e34:	000a8713          	mv	a4,s5
    4e38:	0000a317          	auipc	t1,0xa
    4e3c:	2cc30313          	add	t1,t1,716 # f104 <blanks.1>
    4e40:	000c0593          	mv	a1,s8
    4e44:	000d8a93          	mv	s5,s11
    4e48:	01000813          	li	a6,16
    4e4c:	00700d13          	li	s10,7
    4e50:	01112c23          	sw	a7,24(sp)
    4e54:	01d12e23          	sw	t4,28(sp)
    4e58:	00030c13          	mv	s8,t1
    4e5c:	00070d93          	mv	s11,a4
    4e60:	0180006f          	j	4e78 <_vfiprintf_r+0x5ac>
    4e64:	00268613          	add	a2,a3,2
    4e68:	00858593          	add	a1,a1,8
    4e6c:	00070693          	mv	a3,a4
    4e70:	ff0a8a93          	add	s5,s5,-16
    4e74:	05585a63          	bge	a6,s5,4ec8 <_vfiprintf_r+0x5fc>
    4e78:	01078793          	add	a5,a5,16
    4e7c:	00168713          	add	a4,a3,1
    4e80:	0185a023          	sw	s8,0(a1)
    4e84:	0105a223          	sw	a6,4(a1)
    4e88:	06f12423          	sw	a5,104(sp)
    4e8c:	06e12223          	sw	a4,100(sp)
    4e90:	fced5ae3          	bge	s10,a4,4e64 <_vfiprintf_r+0x598>
    4e94:	56078663          	beqz	a5,5400 <_vfiprintf_r+0xb34>
    4e98:	06010613          	add	a2,sp,96
    4e9c:	00098593          	mv	a1,s3
    4ea0:	00040513          	mv	a0,s0
    4ea4:	8edff0ef          	jal	4790 <__sprint_r.part.0>
    4ea8:	ee051ae3          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    4eac:	06412683          	lw	a3,100(sp)
    4eb0:	01000813          	li	a6,16
    4eb4:	ff0a8a93          	add	s5,s5,-16
    4eb8:	06812783          	lw	a5,104(sp)
    4ebc:	000a0593          	mv	a1,s4
    4ec0:	00168613          	add	a2,a3,1
    4ec4:	fb584ae3          	blt	a6,s5,4e78 <_vfiprintf_r+0x5ac>
    4ec8:	01812883          	lw	a7,24(sp)
    4ecc:	01c12e83          	lw	t4,28(sp)
    4ed0:	000d8713          	mv	a4,s11
    4ed4:	000c0313          	mv	t1,s8
    4ed8:	000a8d93          	mv	s11,s5
    4edc:	00058c13          	mv	s8,a1
    4ee0:	00070a93          	mv	s5,a4
    4ee4:	01b787b3          	add	a5,a5,s11
    4ee8:	006c2023          	sw	t1,0(s8)
    4eec:	01bc2223          	sw	s11,4(s8)
    4ef0:	06f12423          	sw	a5,104(sp)
    4ef4:	06c12223          	sw	a2,100(sp)
    4ef8:	00700713          	li	a4,7
    4efc:	d0c75ce3          	bge	a4,a2,4c14 <_vfiprintf_r+0x348>
    4f00:	160788e3          	beqz	a5,5870 <_vfiprintf_r+0xfa4>
    4f04:	06010613          	add	a2,sp,96
    4f08:	00098593          	mv	a1,s3
    4f0c:	00040513          	mv	a0,s0
    4f10:	01d12e23          	sw	t4,28(sp)
    4f14:	01112c23          	sw	a7,24(sp)
    4f18:	879ff0ef          	jal	4790 <__sprint_r.part.0>
    4f1c:	e80510e3          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    4f20:	06812783          	lw	a5,104(sp)
    4f24:	01c12e83          	lw	t4,28(sp)
    4f28:	01812883          	lw	a7,24(sp)
    4f2c:	ce9ff06f          	j	4c14 <_vfiprintf_r+0x348>
    4f30:	2007f713          	and	a4,a5,512
    4f34:	e80716e3          	bnez	a4,4dc0 <_vfiprintf_r+0x4f4>
    4f38:	0589a503          	lw	a0,88(s3)
    4f3c:	61c020ef          	jal	7558 <__retarget_lock_release_recursive>
    4f40:	00c99783          	lh	a5,12(s3)
    4f44:	e7dff06f          	j	4dc0 <_vfiprintf_r+0x4f4>
    4f48:	000aa803          	lw	a6,0(s5)
    4f4c:	040101a3          	sb	zero,67(sp)
    4f50:	000d8e13          	mv	t3,s11
    4f54:	004a8a93          	add	s5,s5,4
    4f58:	68080ae3          	beqz	a6,5dec <_vfiprintf_r+0x1520>
    4f5c:	05300793          	li	a5,83
    4f60:	3cf68ce3          	beq	a3,a5,5b38 <_vfiprintf_r+0x126c>
    4f64:	010df793          	and	a5,s11,16
    4f68:	3c0798e3          	bnez	a5,5b38 <_vfiprintf_r+0x126c>
    4f6c:	00075463          	bgez	a4,4f74 <_vfiprintf_r+0x6a8>
    4f70:	7fd0006f          	j	5f6c <_vfiprintf_r+0x16a0>
    4f74:	00070613          	mv	a2,a4
    4f78:	00080513          	mv	a0,a6
    4f7c:	00000593          	li	a1,0
    4f80:	03112223          	sw	a7,36(sp)
    4f84:	00e12e23          	sw	a4,28(sp)
    4f88:	01012c23          	sw	a6,24(sp)
    4f8c:	03b12023          	sw	s11,32(sp)
    4f90:	258020ef          	jal	71e8 <memchr>
    4f94:	00a12823          	sw	a0,16(sp)
    4f98:	01812803          	lw	a6,24(sp)
    4f9c:	01c12703          	lw	a4,28(sp)
    4fa0:	02012e03          	lw	t3,32(sp)
    4fa4:	02412883          	lw	a7,36(sp)
    4fa8:	00051463          	bnez	a0,4fb0 <_vfiprintf_r+0x6e4>
    4fac:	7990006f          	j	5f44 <_vfiprintf_r+0x1678>
    4fb0:	41050d33          	sub	s10,a0,a6
    4fb4:	fffd4e93          	not	t4,s10
    4fb8:	41fede93          	sra	t4,t4,0x1f
    4fbc:	01dd7eb3          	and	t4,s10,t4
    4fc0:	00012823          	sw	zero,16(sp)
    4fc4:	6dd0006f          	j	5ea0 <_vfiprintf_r+0x15d4>
    4fc8:	04300793          	li	a5,67
    4fcc:	000d8e13          	mv	t3,s11
    4fd0:	004a8d93          	add	s11,s5,4
    4fd4:	00f68663          	beq	a3,a5,4fe0 <_vfiprintf_r+0x714>
    4fd8:	010e7793          	and	a5,t3,16
    4fdc:	280788e3          	beqz	a5,5a6c <_vfiprintf_r+0x11a0>
    4fe0:	00800613          	li	a2,8
    4fe4:	00000593          	li	a1,0
    4fe8:	05810513          	add	a0,sp,88
    4fec:	01112e23          	sw	a7,28(sp)
    4ff0:	01c12c23          	sw	t3,24(sp)
    4ff4:	ab1fb0ef          	jal	aa4 <memset>
    4ff8:	000aa603          	lw	a2,0(s5)
    4ffc:	0ac10593          	add	a1,sp,172
    5000:	05810693          	add	a3,sp,88
    5004:	00040513          	mv	a0,s0
    5008:	00b12823          	sw	a1,16(sp)
    500c:	418050ef          	jal	a424 <_wcrtomb_r>
    5010:	fff00793          	li	a5,-1
    5014:	01012583          	lw	a1,16(sp)
    5018:	01812e03          	lw	t3,24(sp)
    501c:	01c12883          	lw	a7,28(sp)
    5020:	00050d13          	mv	s10,a0
    5024:	00f51463          	bne	a0,a5,502c <_vfiprintf_r+0x760>
    5028:	0200106f          	j	6048 <_vfiprintf_r+0x177c>
    502c:	fff54e93          	not	t4,a0
    5030:	41fede93          	sra	t4,t4,0x1f
    5034:	01d57eb3          	and	t4,a0,t4
    5038:	040101a3          	sb	zero,67(sp)
    503c:	000d8a93          	mv	s5,s11
    5040:	00058813          	mv	a6,a1
    5044:	a79ff06f          	j	4abc <_vfiprintf_r+0x1f0>
    5048:	411008b3          	neg	a7,a7
    504c:	000cc683          	lbu	a3,0(s9)
    5050:	004ded93          	or	s11,s11,4
    5054:	9f9ff06f          	j	4a4c <_vfiprintf_r+0x180>
    5058:	010dee13          	or	t3,s11,16
    505c:	020e7793          	and	a5,t3,32
    5060:	0c0788e3          	beqz	a5,5930 <_vfiprintf_r+0x1064>
    5064:	007a8a93          	add	s5,s5,7
    5068:	ff8afa93          	and	s5,s5,-8
    506c:	004aa683          	lw	a3,4(s5)
    5070:	000aad83          	lw	s11,0(s5)
    5074:	008a8a93          	add	s5,s5,8
    5078:	00068d13          	mv	s10,a3
    507c:	3006c263          	bltz	a3,5380 <_vfiprintf_r+0xab4>
    5080:	32074063          	bltz	a4,53a0 <_vfiprintf_r+0xad4>
    5084:	01ade6b3          	or	a3,s11,s10
    5088:	f7fe7e13          	and	t3,t3,-129
    508c:	30069a63          	bnez	a3,53a0 <_vfiprintf_r+0xad4>
    5090:	68071ae3          	bnez	a4,5f24 <_vfiprintf_r+0x1658>
    5094:	04314783          	lbu	a5,67(sp)
    5098:	00012823          	sw	zero,16(sp)
    509c:	00000e93          	li	t4,0
    50a0:	00000d13          	li	s10,0
    50a4:	11010813          	add	a6,sp,272
    50a8:	00078463          	beqz	a5,50b0 <_vfiprintf_r+0x7e4>
    50ac:	001e8e93          	add	t4,t4,1
    50b0:	002e7f93          	and	t6,t3,2
    50b4:	a00f8ae3          	beqz	t6,4ac8 <_vfiprintf_r+0x1fc>
    50b8:	002e8e93          	add	t4,t4,2
    50bc:	00200f93          	li	t6,2
    50c0:	a09ff06f          	j	4ac8 <_vfiprintf_r+0x1fc>
    50c4:	000cc683          	lbu	a3,0(s9)
    50c8:	06800793          	li	a5,104
    50cc:	4ef686e3          	beq	a3,a5,5db8 <_vfiprintf_r+0x14ec>
    50d0:	040ded93          	or	s11,s11,64
    50d4:	979ff06f          	j	4a4c <_vfiprintf_r+0x180>
    50d8:	010de613          	or	a2,s11,16
    50dc:	02067793          	and	a5,a2,32
    50e0:	000780e3          	beqz	a5,58e0 <_vfiprintf_r+0x1014>
    50e4:	007a8a93          	add	s5,s5,7
    50e8:	ff8afa93          	and	s5,s5,-8
    50ec:	000aad83          	lw	s11,0(s5)
    50f0:	004aad03          	lw	s10,4(s5)
    50f4:	008a8a93          	add	s5,s5,8
    50f8:	040101a3          	sb	zero,67(sp)
    50fc:	00060e13          	mv	t3,a2
    5100:	2a074063          	bltz	a4,53a0 <_vfiprintf_r+0xad4>
    5104:	01ade6b3          	or	a3,s11,s10
    5108:	f7f67e13          	and	t3,a2,-129
    510c:	28069a63          	bnez	a3,53a0 <_vfiprintf_r+0xad4>
    5110:	00100793          	li	a5,1
    5114:	06071e63          	bnez	a4,5190 <_vfiprintf_r+0x8c4>
    5118:	f6079ee3          	bnez	a5,5094 <_vfiprintf_r+0x7c8>
    511c:	00167d13          	and	s10,a2,1
    5120:	0a0d0ce3          	beqz	s10,59d8 <_vfiprintf_r+0x110c>
    5124:	03000793          	li	a5,48
    5128:	10f107a3          	sb	a5,271(sp)
    512c:	000d0e93          	mv	t4,s10
    5130:	10f10813          	add	a6,sp,271
    5134:	2980006f          	j	53cc <_vfiprintf_r+0xb00>
    5138:	02b00793          	li	a5,43
    513c:	000cc683          	lbu	a3,0(s9)
    5140:	04f101a3          	sb	a5,67(sp)
    5144:	909ff06f          	j	4a4c <_vfiprintf_r+0x180>
    5148:	010de693          	or	a3,s11,16
    514c:	0206f793          	and	a5,a3,32
    5150:	7a078c63          	beqz	a5,5908 <_vfiprintf_r+0x103c>
    5154:	007a8a93          	add	s5,s5,7
    5158:	ff8afa93          	and	s5,s5,-8
    515c:	000aa783          	lw	a5,0(s5)
    5160:	004aa583          	lw	a1,4(s5)
    5164:	008a8a93          	add	s5,s5,8
    5168:	040101a3          	sb	zero,67(sp)
    516c:	bff6fe13          	and	t3,a3,-1025
    5170:	02074c63          	bltz	a4,51a8 <_vfiprintf_r+0x8dc>
    5174:	00b7e633          	or	a2,a5,a1
    5178:	b7f6f693          	and	a3,a3,-1153
    517c:	420610e3          	bnez	a2,5d9c <_vfiprintf_r+0x14d0>
    5180:	000e0613          	mv	a2,t3
    5184:	00000793          	li	a5,0
    5188:	00068e13          	mv	t3,a3
    518c:	f80706e3          	beqz	a4,5118 <_vfiprintf_r+0x84c>
    5190:	00100693          	li	a3,1
    5194:	58d788e3          	beq	a5,a3,5f24 <_vfiprintf_r+0x1658>
    5198:	00200693          	li	a3,2
    519c:	46d786e3          	beq	a5,a3,5e08 <_vfiprintf_r+0x153c>
    51a0:	00000793          	li	a5,0
    51a4:	00000593          	li	a1,0
    51a8:	11010813          	add	a6,sp,272
    51ac:	01d59613          	sll	a2,a1,0x1d
    51b0:	0077f693          	and	a3,a5,7
    51b4:	0037d793          	srl	a5,a5,0x3
    51b8:	03068693          	add	a3,a3,48
    51bc:	00f667b3          	or	a5,a2,a5
    51c0:	0035d593          	srl	a1,a1,0x3
    51c4:	fed80fa3          	sb	a3,-1(a6)
    51c8:	00b7e633          	or	a2,a5,a1
    51cc:	00080513          	mv	a0,a6
    51d0:	fff80813          	add	a6,a6,-1
    51d4:	fc061ce3          	bnez	a2,51ac <_vfiprintf_r+0x8e0>
    51d8:	001e7793          	and	a5,t3,1
    51dc:	54078e63          	beqz	a5,5738 <_vfiprintf_r+0xe6c>
    51e0:	03000793          	li	a5,48
    51e4:	54f68a63          	beq	a3,a5,5738 <_vfiprintf_r+0xe6c>
    51e8:	ffe50513          	add	a0,a0,-2
    51ec:	fef80fa3          	sb	a5,-1(a6)
    51f0:	11010793          	add	a5,sp,272
    51f4:	40a78d33          	sub	s10,a5,a0
    51f8:	00070e93          	mv	t4,a4
    51fc:	09a744e3          	blt	a4,s10,5a84 <_vfiprintf_r+0x11b8>
    5200:	00050813          	mv	a6,a0
    5204:	1c80006f          	j	53cc <_vfiprintf_r+0xb00>
    5208:	000086b7          	lui	a3,0x8
    520c:	83068693          	add	a3,a3,-2000 # 7830 <quorem+0x114>
    5210:	04d11223          	sh	a3,68(sp)
    5214:	0000a697          	auipc	a3,0xa
    5218:	86c68693          	add	a3,a3,-1940 # ea80 <__fini_array_end+0x124>
    521c:	000aa783          	lw	a5,0(s5)
    5220:	00000593          	li	a1,0
    5224:	002dee13          	or	t3,s11,2
    5228:	004a8a93          	add	s5,s5,4
    522c:	00d12a23          	sw	a3,20(sp)
    5230:	040101a3          	sb	zero,67(sp)
    5234:	4c074863          	bltz	a4,5704 <_vfiprintf_r+0xe38>
    5238:	00b7e6b3          	or	a3,a5,a1
    523c:	f7fe7513          	and	a0,t3,-129
    5240:	4a069c63          	bnez	a3,56f8 <_vfiprintf_r+0xe2c>
    5244:	000e0613          	mv	a2,t3
    5248:	00200793          	li	a5,2
    524c:	00050e13          	mv	t3,a0
    5250:	ec5ff06f          	j	5114 <_vfiprintf_r+0x848>
    5254:	00040513          	mv	a0,s0
    5258:	00e12c23          	sw	a4,24(sp)
    525c:	01112823          	sw	a7,16(sp)
    5260:	104020ef          	jal	7364 <_localeconv_r>
    5264:	00452783          	lw	a5,4(a0)
    5268:	00078513          	mv	a0,a5
    526c:	02f12a23          	sw	a5,52(sp)
    5270:	ab5fb0ef          	jal	d24 <strlen>
    5274:	00050793          	mv	a5,a0
    5278:	00040513          	mv	a0,s0
    527c:	02f12823          	sw	a5,48(sp)
    5280:	0e4020ef          	jal	7364 <_localeconv_r>
    5284:	00852703          	lw	a4,8(a0)
    5288:	03012783          	lw	a5,48(sp)
    528c:	01012883          	lw	a7,16(sp)
    5290:	02e12623          	sw	a4,44(sp)
    5294:	01812703          	lw	a4,24(sp)
    5298:	a2078ee3          	beqz	a5,4cd4 <_vfiprintf_r+0x408>
    529c:	02c12783          	lw	a5,44(sp)
    52a0:	000cc683          	lbu	a3,0(s9)
    52a4:	fa078463          	beqz	a5,4a4c <_vfiprintf_r+0x180>
    52a8:	0007c783          	lbu	a5,0(a5)
    52ac:	fa078063          	beqz	a5,4a4c <_vfiprintf_r+0x180>
    52b0:	400ded93          	or	s11,s11,1024
    52b4:	f98ff06f          	j	4a4c <_vfiprintf_r+0x180>
    52b8:	020df793          	and	a5,s11,32
    52bc:	78079263          	bnez	a5,5a40 <_vfiprintf_r+0x1174>
    52c0:	010df793          	and	a5,s11,16
    52c4:	30079ae3          	bnez	a5,5dd8 <_vfiprintf_r+0x150c>
    52c8:	040df793          	and	a5,s11,64
    52cc:	400796e3          	bnez	a5,5ed8 <_vfiprintf_r+0x160c>
    52d0:	200dfe13          	and	t3,s11,512
    52d4:	300e02e3          	beqz	t3,5dd8 <_vfiprintf_r+0x150c>
    52d8:	000aa783          	lw	a5,0(s5)
    52dc:	00c12703          	lw	a4,12(sp)
    52e0:	004a8a93          	add	s5,s5,4
    52e4:	00e78023          	sb	a4,0(a5)
    52e8:	efcff06f          	j	49e4 <_vfiprintf_r+0x118>
    52ec:	000cc683          	lbu	a3,0(s9)
    52f0:	06c00793          	li	a5,108
    52f4:	2cf68ae3          	beq	a3,a5,5dc8 <_vfiprintf_r+0x14fc>
    52f8:	010ded93          	or	s11,s11,16
    52fc:	f50ff06f          	j	4a4c <_vfiprintf_r+0x180>
    5300:	000cc683          	lbu	a3,0(s9)
    5304:	080ded93          	or	s11,s11,128
    5308:	f44ff06f          	j	4a4c <_vfiprintf_r+0x180>
    530c:	000cc683          	lbu	a3,0(s9)
    5310:	02a00793          	li	a5,42
    5314:	001c8593          	add	a1,s9,1
    5318:	54f680e3          	beq	a3,a5,6058 <_vfiprintf_r+0x178c>
    531c:	fd068793          	add	a5,a3,-48
    5320:	00900613          	li	a2,9
    5324:	00000713          	li	a4,0
    5328:	00900513          	li	a0,9
    532c:	02f66463          	bltu	a2,a5,5354 <_vfiprintf_r+0xa88>
    5330:	0005c683          	lbu	a3,0(a1)
    5334:	00271613          	sll	a2,a4,0x2
    5338:	00e60733          	add	a4,a2,a4
    533c:	00171713          	sll	a4,a4,0x1
    5340:	00f70733          	add	a4,a4,a5
    5344:	fd068793          	add	a5,a3,-48
    5348:	00158593          	add	a1,a1,1
    534c:	fef572e3          	bgeu	a0,a5,5330 <_vfiprintf_r+0xa64>
    5350:	74074063          	bltz	a4,5a90 <_vfiprintf_r+0x11c4>
    5354:	00058c93          	mv	s9,a1
    5358:	ef8ff06f          	j	4a50 <_vfiprintf_r+0x184>
    535c:	000cc683          	lbu	a3,0(s9)
    5360:	001ded93          	or	s11,s11,1
    5364:	ee8ff06f          	j	4a4c <_vfiprintf_r+0x180>
    5368:	04314783          	lbu	a5,67(sp)
    536c:	000cc683          	lbu	a3,0(s9)
    5370:	ec079e63          	bnez	a5,4a4c <_vfiprintf_r+0x180>
    5374:	02000793          	li	a5,32
    5378:	04f101a3          	sb	a5,67(sp)
    537c:	ed0ff06f          	j	4a4c <_vfiprintf_r+0x180>
    5380:	02d00613          	li	a2,45
    5384:	01b036b3          	snez	a3,s11
    5388:	41a000b3          	neg	ra,s10
    538c:	04c101a3          	sb	a2,67(sp)
    5390:	40d08d33          	sub	s10,ra,a3
    5394:	41b00db3          	neg	s11,s11
    5398:	00074463          	bltz	a4,53a0 <_vfiprintf_r+0xad4>
    539c:	f7fe7e13          	and	t3,t3,-129
    53a0:	120d14e3          	bnez	s10,5cc8 <_vfiprintf_r+0x13fc>
    53a4:	00900693          	li	a3,9
    53a8:	13b6e0e3          	bltu	a3,s11,5cc8 <_vfiprintf_r+0x13fc>
    53ac:	030d8793          	add	a5,s11,48
    53b0:	0ff7f793          	zext.b	a5,a5
    53b4:	10f107a3          	sb	a5,271(sp)
    53b8:	00070e93          	mv	t4,a4
    53bc:	00e04463          	bgtz	a4,53c4 <_vfiprintf_r+0xaf8>
    53c0:	00100e93          	li	t4,1
    53c4:	00100d13          	li	s10,1
    53c8:	10f10813          	add	a6,sp,271
    53cc:	04314783          	lbu	a5,67(sp)
    53d0:	00012823          	sw	zero,16(sp)
    53d4:	cc079ce3          	bnez	a5,50ac <_vfiprintf_r+0x7e0>
    53d8:	cd9ff06f          	j	50b0 <_vfiprintf_r+0x7e4>
    53dc:	00100713          	li	a4,1
    53e0:	000d0793          	mv	a5,s10
    53e4:	07012623          	sw	a6,108(sp)
    53e8:	07a12823          	sw	s10,112(sp)
    53ec:	07a12423          	sw	s10,104(sp)
    53f0:	06e12223          	sw	a4,100(sp)
    53f4:	000a0c13          	mv	s8,s4
    53f8:	008c0c13          	add	s8,s8,8
    53fc:	809ff06f          	j	4c04 <_vfiprintf_r+0x338>
    5400:	00100613          	li	a2,1
    5404:	00000693          	li	a3,0
    5408:	000a0593          	mv	a1,s4
    540c:	a65ff06f          	j	4e70 <_vfiprintf_r+0x5a4>
    5410:	41d88db3          	sub	s11,a7,t4
    5414:	f9b05a63          	blez	s11,4ba8 <_vfiprintf_r+0x2dc>
    5418:	01000593          	li	a1,16
    541c:	3bb5dae3          	bge	a1,s11,5fd0 <_vfiprintf_r+0x1704>
    5420:	0000af97          	auipc	t6,0xa
    5424:	cd4f8f93          	add	t6,t6,-812 # f0f4 <zeroes.0>
    5428:	02e12223          	sw	a4,36(sp)
    542c:	000a8713          	mv	a4,s5
    5430:	000c0693          	mv	a3,s8
    5434:	000d8a93          	mv	s5,s11
    5438:	01000f13          	li	t5,16
    543c:	00700293          	li	t0,7
    5440:	01c12c23          	sw	t3,24(sp)
    5444:	01012e23          	sw	a6,28(sp)
    5448:	03112023          	sw	a7,32(sp)
    544c:	03d12423          	sw	t4,40(sp)
    5450:	000f8c13          	mv	s8,t6
    5454:	00070d93          	mv	s11,a4
    5458:	0180006f          	j	5470 <_vfiprintf_r+0xba4>
    545c:	00260513          	add	a0,a2,2
    5460:	00868693          	add	a3,a3,8
    5464:	00070613          	mv	a2,a4
    5468:	ff0a8a93          	add	s5,s5,-16
    546c:	055f5c63          	bge	t5,s5,54c4 <_vfiprintf_r+0xbf8>
    5470:	01078793          	add	a5,a5,16
    5474:	00160713          	add	a4,a2,1
    5478:	0186a023          	sw	s8,0(a3)
    547c:	01e6a223          	sw	t5,4(a3)
    5480:	06f12423          	sw	a5,104(sp)
    5484:	06e12223          	sw	a4,100(sp)
    5488:	fce2dae3          	bge	t0,a4,545c <_vfiprintf_r+0xb90>
    548c:	1c078663          	beqz	a5,5658 <_vfiprintf_r+0xd8c>
    5490:	06010613          	add	a2,sp,96
    5494:	00098593          	mv	a1,s3
    5498:	00040513          	mv	a0,s0
    549c:	af4ff0ef          	jal	4790 <__sprint_r.part.0>
    54a0:	8e051ee3          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    54a4:	06412603          	lw	a2,100(sp)
    54a8:	01000f13          	li	t5,16
    54ac:	ff0a8a93          	add	s5,s5,-16
    54b0:	06812783          	lw	a5,104(sp)
    54b4:	000a0693          	mv	a3,s4
    54b8:	00160513          	add	a0,a2,1
    54bc:	00700293          	li	t0,7
    54c0:	fb5f48e3          	blt	t5,s5,5470 <_vfiprintf_r+0xba4>
    54c4:	01812e03          	lw	t3,24(sp)
    54c8:	01c12803          	lw	a6,28(sp)
    54cc:	02012883          	lw	a7,32(sp)
    54d0:	02412703          	lw	a4,36(sp)
    54d4:	02812e83          	lw	t4,40(sp)
    54d8:	000d8613          	mv	a2,s11
    54dc:	000c0f93          	mv	t6,s8
    54e0:	000a8d93          	mv	s11,s5
    54e4:	00068c13          	mv	s8,a3
    54e8:	00060a93          	mv	s5,a2
    54ec:	01b787b3          	add	a5,a5,s11
    54f0:	01fc2023          	sw	t6,0(s8)
    54f4:	01bc2223          	sw	s11,4(s8)
    54f8:	06f12423          	sw	a5,104(sp)
    54fc:	06a12223          	sw	a0,100(sp)
    5500:	00700613          	li	a2,7
    5504:	4ea65863          	bge	a2,a0,59f4 <_vfiprintf_r+0x1128>
    5508:	1a0786e3          	beqz	a5,5eb4 <_vfiprintf_r+0x15e8>
    550c:	06010613          	add	a2,sp,96
    5510:	00098593          	mv	a1,s3
    5514:	00040513          	mv	a0,s0
    5518:	03d12423          	sw	t4,40(sp)
    551c:	02e12223          	sw	a4,36(sp)
    5520:	03112023          	sw	a7,32(sp)
    5524:	01012e23          	sw	a6,28(sp)
    5528:	01c12c23          	sw	t3,24(sp)
    552c:	a64ff0ef          	jal	4790 <__sprint_r.part.0>
    5530:	860516e3          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    5534:	02412703          	lw	a4,36(sp)
    5538:	06412603          	lw	a2,100(sp)
    553c:	06812783          	lw	a5,104(sp)
    5540:	41a70733          	sub	a4,a4,s10
    5544:	02812e83          	lw	t4,40(sp)
    5548:	02012883          	lw	a7,32(sp)
    554c:	01c12803          	lw	a6,28(sp)
    5550:	01812e03          	lw	t3,24(sp)
    5554:	000a0c13          	mv	s8,s4
    5558:	00160f13          	add	t5,a2,1
    555c:	e4e05a63          	blez	a4,4bb0 <_vfiprintf_r+0x2e4>
    5560:	01000593          	li	a1,16
    5564:	0000af97          	auipc	t6,0xa
    5568:	b90f8f93          	add	t6,t6,-1136 # f0f4 <zeroes.0>
    556c:	0ae5da63          	bge	a1,a4,5620 <_vfiprintf_r+0xd54>
    5570:	000c0593          	mv	a1,s8
    5574:	03512423          	sw	s5,40(sp)
    5578:	01000d93          	li	s11,16
    557c:	00700293          	li	t0,7
    5580:	01c12c23          	sw	t3,24(sp)
    5584:	01012e23          	sw	a6,28(sp)
    5588:	03112023          	sw	a7,32(sp)
    558c:	03d12223          	sw	t4,36(sp)
    5590:	00070a93          	mv	s5,a4
    5594:	000b0c13          	mv	s8,s6
    5598:	0180006f          	j	55b0 <_vfiprintf_r+0xce4>
    559c:	00260f13          	add	t5,a2,2
    55a0:	00858593          	add	a1,a1,8
    55a4:	00068613          	mv	a2,a3
    55a8:	ff0a8a93          	add	s5,s5,-16
    55ac:	055dda63          	bge	s11,s5,5600 <_vfiprintf_r+0xd34>
    55b0:	01078793          	add	a5,a5,16
    55b4:	00160693          	add	a3,a2,1
    55b8:	0165a023          	sw	s6,0(a1)
    55bc:	01b5a223          	sw	s11,4(a1)
    55c0:	06f12423          	sw	a5,104(sp)
    55c4:	06d12223          	sw	a3,100(sp)
    55c8:	fcd2dae3          	bge	t0,a3,559c <_vfiprintf_r+0xcd0>
    55cc:	06078e63          	beqz	a5,5648 <_vfiprintf_r+0xd7c>
    55d0:	06010613          	add	a2,sp,96
    55d4:	00098593          	mv	a1,s3
    55d8:	00040513          	mv	a0,s0
    55dc:	9b4ff0ef          	jal	4790 <__sprint_r.part.0>
    55e0:	fa051e63          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    55e4:	06412603          	lw	a2,100(sp)
    55e8:	ff0a8a93          	add	s5,s5,-16
    55ec:	06812783          	lw	a5,104(sp)
    55f0:	000a0593          	mv	a1,s4
    55f4:	00160f13          	add	t5,a2,1
    55f8:	00700293          	li	t0,7
    55fc:	fb5dcae3          	blt	s11,s5,55b0 <_vfiprintf_r+0xce4>
    5600:	000a8713          	mv	a4,s5
    5604:	01812e03          	lw	t3,24(sp)
    5608:	01c12803          	lw	a6,28(sp)
    560c:	02012883          	lw	a7,32(sp)
    5610:	02412e83          	lw	t4,36(sp)
    5614:	02812a83          	lw	s5,40(sp)
    5618:	000c0f93          	mv	t6,s8
    561c:	00058c13          	mv	s8,a1
    5620:	00e787b3          	add	a5,a5,a4
    5624:	00ec2223          	sw	a4,4(s8)
    5628:	01fc2023          	sw	t6,0(s8)
    562c:	06f12423          	sw	a5,104(sp)
    5630:	07e12223          	sw	t5,100(sp)
    5634:	00700713          	li	a4,7
    5638:	25e74863          	blt	a4,t5,5888 <_vfiprintf_r+0xfbc>
    563c:	008c0c13          	add	s8,s8,8
    5640:	001f0f13          	add	t5,t5,1
    5644:	d6cff06f          	j	4bb0 <_vfiprintf_r+0x2e4>
    5648:	00100f13          	li	t5,1
    564c:	00000613          	li	a2,0
    5650:	000a0593          	mv	a1,s4
    5654:	f55ff06f          	j	55a8 <_vfiprintf_r+0xcdc>
    5658:	00100513          	li	a0,1
    565c:	00000613          	li	a2,0
    5660:	000a0693          	mv	a3,s4
    5664:	e05ff06f          	j	5468 <_vfiprintf_r+0xb9c>
    5668:	06078263          	beqz	a5,56cc <_vfiprintf_r+0xe00>
    566c:	06010613          	add	a2,sp,96
    5670:	00098593          	mv	a1,s3
    5674:	00040513          	mv	a0,s0
    5678:	03d12e23          	sw	t4,60(sp)
    567c:	02e12c23          	sw	a4,56(sp)
    5680:	03112423          	sw	a7,40(sp)
    5684:	03012223          	sw	a6,36(sp)
    5688:	02512023          	sw	t0,32(sp)
    568c:	01f12e23          	sw	t6,28(sp)
    5690:	01c12c23          	sw	t3,24(sp)
    5694:	8fcff0ef          	jal	4790 <__sprint_r.part.0>
    5698:	f0051263          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    569c:	06412603          	lw	a2,100(sp)
    56a0:	06812783          	lw	a5,104(sp)
    56a4:	03c12e83          	lw	t4,60(sp)
    56a8:	03812703          	lw	a4,56(sp)
    56ac:	02812883          	lw	a7,40(sp)
    56b0:	02412803          	lw	a6,36(sp)
    56b4:	02012283          	lw	t0,32(sp)
    56b8:	01c12f83          	lw	t6,28(sp)
    56bc:	01812e03          	lw	t3,24(sp)
    56c0:	000a0c13          	mv	s8,s4
    56c4:	00160f13          	add	t5,a2,1
    56c8:	c58ff06f          	j	4b20 <_vfiprintf_r+0x254>
    56cc:	380f8863          	beqz	t6,5a5c <_vfiprintf_r+0x1190>
    56d0:	04410793          	add	a5,sp,68
    56d4:	06f12623          	sw	a5,108(sp)
    56d8:	00200793          	li	a5,2
    56dc:	06f12823          	sw	a5,112(sp)
    56e0:	00100f13          	li	t5,1
    56e4:	000a0c13          	mv	s8,s4
    56e8:	000f0613          	mv	a2,t5
    56ec:	008c0c13          	add	s8,s8,8
    56f0:	001f0f13          	add	t5,t5,1
    56f4:	cacff06f          	j	4ba0 <_vfiprintf_r+0x2d4>
    56f8:	00200693          	li	a3,2
    56fc:	00050e13          	mv	t3,a0
    5700:	aa0684e3          	beqz	a3,51a8 <_vfiprintf_r+0x8dc>
    5704:	01412503          	lw	a0,20(sp)
    5708:	11010813          	add	a6,sp,272
    570c:	00f7f693          	and	a3,a5,15
    5710:	00d506b3          	add	a3,a0,a3
    5714:	0006c603          	lbu	a2,0(a3)
    5718:	0047d793          	srl	a5,a5,0x4
    571c:	01c59693          	sll	a3,a1,0x1c
    5720:	00f6e7b3          	or	a5,a3,a5
    5724:	0045d593          	srl	a1,a1,0x4
    5728:	fec80fa3          	sb	a2,-1(a6)
    572c:	00b7e6b3          	or	a3,a5,a1
    5730:	fff80813          	add	a6,a6,-1
    5734:	fc069ce3          	bnez	a3,570c <_vfiprintf_r+0xe40>
    5738:	11010793          	add	a5,sp,272
    573c:	41078d33          	sub	s10,a5,a6
    5740:	00070e93          	mv	t4,a4
    5744:	c9a754e3          	bge	a4,s10,53cc <_vfiprintf_r+0xb00>
    5748:	000d0e93          	mv	t4,s10
    574c:	c81ff06f          	j	53cc <_vfiprintf_r+0xb00>
    5750:	01000513          	li	a0,16
    5754:	01b554e3          	bge	a0,s11,5f5c <_vfiprintf_r+0x1690>
    5758:	000a8693          	mv	a3,s5
    575c:	0000a317          	auipc	t1,0xa
    5760:	9a830313          	add	t1,t1,-1624 # f104 <blanks.1>
    5764:	02e12c23          	sw	a4,56(sp)
    5768:	000d8a93          	mv	s5,s11
    576c:	000c0713          	mv	a4,s8
    5770:	01000f13          	li	t5,16
    5774:	00700393          	li	t2,7
    5778:	01c12c23          	sw	t3,24(sp)
    577c:	01f12e23          	sw	t6,28(sp)
    5780:	02512023          	sw	t0,32(sp)
    5784:	03012223          	sw	a6,36(sp)
    5788:	03112423          	sw	a7,40(sp)
    578c:	03d12e23          	sw	t4,60(sp)
    5790:	00030c13          	mv	s8,t1
    5794:	00068d93          	mv	s11,a3
    5798:	01c0006f          	j	57b4 <_vfiprintf_r+0xee8>
    579c:	00260513          	add	a0,a2,2
    57a0:	00870713          	add	a4,a4,8
    57a4:	00058613          	mv	a2,a1
    57a8:	ff0a8a93          	add	s5,s5,-16
    57ac:	055f5c63          	bge	t5,s5,5804 <_vfiprintf_r+0xf38>
    57b0:	00160593          	add	a1,a2,1
    57b4:	01078793          	add	a5,a5,16
    57b8:	01872023          	sw	s8,0(a4)
    57bc:	01e72223          	sw	t5,4(a4)
    57c0:	06f12423          	sw	a5,104(sp)
    57c4:	06b12223          	sw	a1,100(sp)
    57c8:	fcb3dae3          	bge	t2,a1,579c <_vfiprintf_r+0xed0>
    57cc:	08078a63          	beqz	a5,5860 <_vfiprintf_r+0xf94>
    57d0:	06010613          	add	a2,sp,96
    57d4:	00098593          	mv	a1,s3
    57d8:	00040513          	mv	a0,s0
    57dc:	fb5fe0ef          	jal	4790 <__sprint_r.part.0>
    57e0:	da051e63          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    57e4:	06412603          	lw	a2,100(sp)
    57e8:	01000f13          	li	t5,16
    57ec:	ff0a8a93          	add	s5,s5,-16
    57f0:	06812783          	lw	a5,104(sp)
    57f4:	000a0713          	mv	a4,s4
    57f8:	00160513          	add	a0,a2,1
    57fc:	00700393          	li	t2,7
    5800:	fb5f48e3          	blt	t5,s5,57b0 <_vfiprintf_r+0xee4>
    5804:	000c0313          	mv	t1,s8
    5808:	01812e03          	lw	t3,24(sp)
    580c:	00070c13          	mv	s8,a4
    5810:	01c12f83          	lw	t6,28(sp)
    5814:	02012283          	lw	t0,32(sp)
    5818:	02412803          	lw	a6,36(sp)
    581c:	02812883          	lw	a7,40(sp)
    5820:	03c12e83          	lw	t4,60(sp)
    5824:	03812703          	lw	a4,56(sp)
    5828:	000d8693          	mv	a3,s11
    582c:	000a8d93          	mv	s11,s5
    5830:	00068a93          	mv	s5,a3
    5834:	01b787b3          	add	a5,a5,s11
    5838:	006c2023          	sw	t1,0(s8)
    583c:	01bc2223          	sw	s11,4(s8)
    5840:	06f12423          	sw	a5,104(sp)
    5844:	06a12223          	sw	a0,100(sp)
    5848:	00700613          	li	a2,7
    584c:	12a64063          	blt	a2,a0,596c <_vfiprintf_r+0x10a0>
    5850:	008c0c13          	add	s8,s8,8
    5854:	00150f13          	add	t5,a0,1
    5858:	00050613          	mv	a2,a0
    585c:	a8cff06f          	j	4ae8 <_vfiprintf_r+0x21c>
    5860:	00000613          	li	a2,0
    5864:	00100513          	li	a0,1
    5868:	000a0713          	mv	a4,s4
    586c:	f3dff06f          	j	57a8 <_vfiprintf_r+0xedc>
    5870:	01d8d463          	bge	a7,t4,5878 <_vfiprintf_r+0xfac>
    5874:	000e8893          	mv	a7,t4
    5878:	00c12783          	lw	a5,12(sp)
    587c:	011787b3          	add	a5,a5,a7
    5880:	00f12623          	sw	a5,12(sp)
    5884:	ba8ff06f          	j	4c2c <_vfiprintf_r+0x360>
    5888:	b4078ae3          	beqz	a5,53dc <_vfiprintf_r+0xb10>
    588c:	06010613          	add	a2,sp,96
    5890:	00098593          	mv	a1,s3
    5894:	00040513          	mv	a0,s0
    5898:	03d12223          	sw	t4,36(sp)
    589c:	03112023          	sw	a7,32(sp)
    58a0:	01012e23          	sw	a6,28(sp)
    58a4:	01c12c23          	sw	t3,24(sp)
    58a8:	ee9fe0ef          	jal	4790 <__sprint_r.part.0>
    58ac:	ce051863          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    58b0:	06412f03          	lw	t5,100(sp)
    58b4:	06812783          	lw	a5,104(sp)
    58b8:	02412e83          	lw	t4,36(sp)
    58bc:	02012883          	lw	a7,32(sp)
    58c0:	01c12803          	lw	a6,28(sp)
    58c4:	01812e03          	lw	t3,24(sp)
    58c8:	000a0c13          	mv	s8,s4
    58cc:	001f0f13          	add	t5,t5,1
    58d0:	ae0ff06f          	j	4bb0 <_vfiprintf_r+0x2e4>
    58d4:	06012223          	sw	zero,100(sp)
    58d8:	000a0c13          	mv	s8,s4
    58dc:	c84ff06f          	j	4d60 <_vfiprintf_r+0x494>
    58e0:	01067693          	and	a3,a2,16
    58e4:	000aa783          	lw	a5,0(s5)
    58e8:	004a8a93          	add	s5,s5,4
    58ec:	12069c63          	bnez	a3,5a24 <_vfiprintf_r+0x1158>
    58f0:	04067693          	and	a3,a2,64
    58f4:	12068463          	beqz	a3,5a1c <_vfiprintf_r+0x1150>
    58f8:	01079d93          	sll	s11,a5,0x10
    58fc:	010ddd93          	srl	s11,s11,0x10
    5900:	00000d13          	li	s10,0
    5904:	ff4ff06f          	j	50f8 <_vfiprintf_r+0x82c>
    5908:	0106f613          	and	a2,a3,16
    590c:	000aa783          	lw	a5,0(s5)
    5910:	004a8a93          	add	s5,s5,4
    5914:	12061263          	bnez	a2,5a38 <_vfiprintf_r+0x116c>
    5918:	0406f613          	and	a2,a3,64
    591c:	10060a63          	beqz	a2,5a30 <_vfiprintf_r+0x1164>
    5920:	01079793          	sll	a5,a5,0x10
    5924:	0107d793          	srl	a5,a5,0x10
    5928:	00000593          	li	a1,0
    592c:	83dff06f          	j	5168 <_vfiprintf_r+0x89c>
    5930:	010e7693          	and	a3,t3,16
    5934:	000aa783          	lw	a5,0(s5)
    5938:	004a8a93          	add	s5,s5,4
    593c:	0c069863          	bnez	a3,5a0c <_vfiprintf_r+0x1140>
    5940:	040e7693          	and	a3,t3,64
    5944:	0c068063          	beqz	a3,5a04 <_vfiprintf_r+0x1138>
    5948:	01079d93          	sll	s11,a5,0x10
    594c:	410ddd93          	sra	s11,s11,0x10
    5950:	41fddd13          	sra	s10,s11,0x1f
    5954:	000d0693          	mv	a3,s10
    5958:	f24ff06f          	j	507c <_vfiprintf_r+0x7b0>
    595c:	00100f13          	li	t5,1
    5960:	00000613          	li	a2,0
    5964:	000a0c13          	mv	s8,s4
    5968:	a38ff06f          	j	4ba0 <_vfiprintf_r+0x2d4>
    596c:	1a078463          	beqz	a5,5b14 <_vfiprintf_r+0x1248>
    5970:	06010613          	add	a2,sp,96
    5974:	00098593          	mv	a1,s3
    5978:	00040513          	mv	a0,s0
    597c:	03d12e23          	sw	t4,60(sp)
    5980:	02e12c23          	sw	a4,56(sp)
    5984:	03112423          	sw	a7,40(sp)
    5988:	03012223          	sw	a6,36(sp)
    598c:	02512023          	sw	t0,32(sp)
    5990:	01f12e23          	sw	t6,28(sp)
    5994:	01c12c23          	sw	t3,24(sp)
    5998:	df9fe0ef          	jal	4790 <__sprint_r.part.0>
    599c:	c0051063          	bnez	a0,4d9c <_vfiprintf_r+0x4d0>
    59a0:	06412603          	lw	a2,100(sp)
    59a4:	06812783          	lw	a5,104(sp)
    59a8:	03c12e83          	lw	t4,60(sp)
    59ac:	03812703          	lw	a4,56(sp)
    59b0:	02812883          	lw	a7,40(sp)
    59b4:	02412803          	lw	a6,36(sp)
    59b8:	02012283          	lw	t0,32(sp)
    59bc:	01c12f83          	lw	t6,28(sp)
    59c0:	01812e03          	lw	t3,24(sp)
    59c4:	000a0c13          	mv	s8,s4
    59c8:	00160f13          	add	t5,a2,1
    59cc:	91cff06f          	j	4ae8 <_vfiprintf_r+0x21c>
    59d0:	000d8e13          	mv	t3,s11
    59d4:	e88ff06f          	j	505c <_vfiprintf_r+0x790>
    59d8:	00000e93          	li	t4,0
    59dc:	11010813          	add	a6,sp,272
    59e0:	9edff06f          	j	53cc <_vfiprintf_r+0xb00>
    59e4:	0589a503          	lw	a0,88(s3)
    59e8:	36d010ef          	jal	7554 <__retarget_lock_acquire_recursive>
    59ec:	00c99783          	lh	a5,12(s3)
    59f0:	f41fe06f          	j	4930 <_vfiprintf_r+0x64>
    59f4:	008c0c13          	add	s8,s8,8
    59f8:	00150f13          	add	t5,a0,1
    59fc:	00050613          	mv	a2,a0
    5a00:	9a8ff06f          	j	4ba8 <_vfiprintf_r+0x2dc>
    5a04:	200e7693          	and	a3,t3,512
    5a08:	50069463          	bnez	a3,5f10 <_vfiprintf_r+0x1644>
    5a0c:	41f7dd13          	sra	s10,a5,0x1f
    5a10:	00078d93          	mv	s11,a5
    5a14:	000d0693          	mv	a3,s10
    5a18:	e64ff06f          	j	507c <_vfiprintf_r+0x7b0>
    5a1c:	20067693          	and	a3,a2,512
    5a20:	4c069663          	bnez	a3,5eec <_vfiprintf_r+0x1620>
    5a24:	00078d93          	mv	s11,a5
    5a28:	00000d13          	li	s10,0
    5a2c:	eccff06f          	j	50f8 <_vfiprintf_r+0x82c>
    5a30:	2006f613          	and	a2,a3,512
    5a34:	4c061863          	bnez	a2,5f04 <_vfiprintf_r+0x1638>
    5a38:	00000593          	li	a1,0
    5a3c:	f2cff06f          	j	5168 <_vfiprintf_r+0x89c>
    5a40:	00c12683          	lw	a3,12(sp)
    5a44:	000aa783          	lw	a5,0(s5)
    5a48:	004a8a93          	add	s5,s5,4
    5a4c:	41f6d713          	sra	a4,a3,0x1f
    5a50:	00d7a023          	sw	a3,0(a5)
    5a54:	00e7a223          	sw	a4,4(a5)
    5a58:	f8dfe06f          	j	49e4 <_vfiprintf_r+0x118>
    5a5c:	00000613          	li	a2,0
    5a60:	00100f13          	li	t5,1
    5a64:	000a0c13          	mv	s8,s4
    5a68:	938ff06f          	j	4ba0 <_vfiprintf_r+0x2d4>
    5a6c:	000aa783          	lw	a5,0(s5)
    5a70:	00100e93          	li	t4,1
    5a74:	00100d13          	li	s10,1
    5a78:	0af10623          	sb	a5,172(sp)
    5a7c:	0ac10593          	add	a1,sp,172
    5a80:	db8ff06f          	j	5038 <_vfiprintf_r+0x76c>
    5a84:	000d0e93          	mv	t4,s10
    5a88:	00050813          	mv	a6,a0
    5a8c:	941ff06f          	j	53cc <_vfiprintf_r+0xb00>
    5a90:	fff00713          	li	a4,-1
    5a94:	00058c93          	mv	s9,a1
    5a98:	fb9fe06f          	j	4a50 <_vfiprintf_r+0x184>
    5a9c:	000d8613          	mv	a2,s11
    5aa0:	e3cff06f          	j	50dc <_vfiprintf_r+0x810>
    5aa4:	00009797          	auipc	a5,0x9
    5aa8:	ff078793          	add	a5,a5,-16 # ea94 <__fini_array_end+0x138>
    5aac:	000d8e13          	mv	t3,s11
    5ab0:	00f12a23          	sw	a5,20(sp)
    5ab4:	020e7793          	and	a5,t3,32
    5ab8:	1c078c63          	beqz	a5,5c90 <_vfiprintf_r+0x13c4>
    5abc:	007a8a93          	add	s5,s5,7
    5ac0:	ff8afa93          	and	s5,s5,-8
    5ac4:	000aa783          	lw	a5,0(s5)
    5ac8:	004aa583          	lw	a1,4(s5)
    5acc:	008a8a93          	add	s5,s5,8
    5ad0:	001e7613          	and	a2,t3,1
    5ad4:	00060e63          	beqz	a2,5af0 <_vfiprintf_r+0x1224>
    5ad8:	00b7e633          	or	a2,a5,a1
    5adc:	00060a63          	beqz	a2,5af0 <_vfiprintf_r+0x1224>
    5ae0:	03000613          	li	a2,48
    5ae4:	04c10223          	sb	a2,68(sp)
    5ae8:	04d102a3          	sb	a3,69(sp)
    5aec:	002e6e13          	or	t3,t3,2
    5af0:	bffe7e13          	and	t3,t3,-1025
    5af4:	f3cff06f          	j	5230 <_vfiprintf_r+0x964>
    5af8:	000d8693          	mv	a3,s11
    5afc:	e50ff06f          	j	514c <_vfiprintf_r+0x880>
    5b00:	00009797          	auipc	a5,0x9
    5b04:	f8078793          	add	a5,a5,-128 # ea80 <__fini_array_end+0x124>
    5b08:	000d8e13          	mv	t3,s11
    5b0c:	00f12a23          	sw	a5,20(sp)
    5b10:	fa5ff06f          	j	5ab4 <_vfiprintf_r+0x11e8>
    5b14:	04314603          	lbu	a2,67(sp)
    5b18:	3a060a63          	beqz	a2,5ecc <_vfiprintf_r+0x1600>
    5b1c:	04310793          	add	a5,sp,67
    5b20:	06f12623          	sw	a5,108(sp)
    5b24:	00100793          	li	a5,1
    5b28:	06f12823          	sw	a5,112(sp)
    5b2c:	00100f13          	li	t5,1
    5b30:	000a0c13          	mv	s8,s4
    5b34:	fe1fe06f          	j	4b14 <_vfiprintf_r+0x248>
    5b38:	00800613          	li	a2,8
    5b3c:	00000593          	li	a1,0
    5b40:	05810513          	add	a0,sp,88
    5b44:	02e12023          	sw	a4,32(sp)
    5b48:	01112e23          	sw	a7,28(sp)
    5b4c:	01c12c23          	sw	t3,24(sp)
    5b50:	05012623          	sw	a6,76(sp)
    5b54:	01012823          	sw	a6,16(sp)
    5b58:	f4dfa0ef          	jal	aa4 <memset>
    5b5c:	02012703          	lw	a4,32(sp)
    5b60:	01012803          	lw	a6,16(sp)
    5b64:	01812e03          	lw	t3,24(sp)
    5b68:	01c12883          	lw	a7,28(sp)
    5b6c:	2a074463          	bltz	a4,5e14 <_vfiprintf_r+0x1548>
    5b70:	00000d93          	li	s11,0
    5b74:	00000d13          	li	s10,0
    5b78:	01812823          	sw	s8,16(sp)
    5b7c:	01012e23          	sw	a6,28(sp)
    5b80:	000d8c13          	mv	s8,s11
    5b84:	03112023          	sw	a7,32(sp)
    5b88:	000c8d93          	mv	s11,s9
    5b8c:	000a8c93          	mv	s9,s5
    5b90:	000d0a93          	mv	s5,s10
    5b94:	00098d13          	mv	s10,s3
    5b98:	00070993          	mv	s3,a4
    5b9c:	0300006f          	j	5bcc <_vfiprintf_r+0x1300>
    5ba0:	05810693          	add	a3,sp,88
    5ba4:	0ac10593          	add	a1,sp,172
    5ba8:	00040513          	mv	a0,s0
    5bac:	079040ef          	jal	a424 <_wcrtomb_r>
    5bb0:	fff00793          	li	a5,-1
    5bb4:	48f50063          	beq	a0,a5,6034 <_vfiprintf_r+0x1768>
    5bb8:	00aa87b3          	add	a5,s5,a0
    5bbc:	02f9c063          	blt	s3,a5,5bdc <_vfiprintf_r+0x1310>
    5bc0:	004c0c13          	add	s8,s8,4
    5bc4:	45378463          	beq	a5,s3,600c <_vfiprintf_r+0x1740>
    5bc8:	00078a93          	mv	s5,a5
    5bcc:	04c12783          	lw	a5,76(sp)
    5bd0:	018787b3          	add	a5,a5,s8
    5bd4:	0007a603          	lw	a2,0(a5)
    5bd8:	fc0614e3          	bnez	a2,5ba0 <_vfiprintf_r+0x12d4>
    5bdc:	01012c03          	lw	s8,16(sp)
    5be0:	01812e03          	lw	t3,24(sp)
    5be4:	01c12803          	lw	a6,28(sp)
    5be8:	02012883          	lw	a7,32(sp)
    5bec:	000d0993          	mv	s3,s10
    5bf0:	000a8d13          	mv	s10,s5
    5bf4:	000c8a93          	mv	s5,s9
    5bf8:	000d8c93          	mv	s9,s11
    5bfc:	280d0e63          	beqz	s10,5e98 <_vfiprintf_r+0x15cc>
    5c00:	06300793          	li	a5,99
    5c04:	33a7d463          	bge	a5,s10,5f2c <_vfiprintf_r+0x1660>
    5c08:	001d0593          	add	a1,s10,1
    5c0c:	00040513          	mv	a0,s0
    5c10:	01112c23          	sw	a7,24(sp)
    5c14:	01c12823          	sw	t3,16(sp)
    5c18:	de8fb0ef          	jal	1200 <_malloc_r>
    5c1c:	01012e03          	lw	t3,16(sp)
    5c20:	01812883          	lw	a7,24(sp)
    5c24:	00050813          	mv	a6,a0
    5c28:	42050063          	beqz	a0,6048 <_vfiprintf_r+0x177c>
    5c2c:	00a12823          	sw	a0,16(sp)
    5c30:	00800613          	li	a2,8
    5c34:	00000593          	li	a1,0
    5c38:	05810513          	add	a0,sp,88
    5c3c:	03112023          	sw	a7,32(sp)
    5c40:	01c12e23          	sw	t3,28(sp)
    5c44:	01012c23          	sw	a6,24(sp)
    5c48:	e5dfa0ef          	jal	aa4 <memset>
    5c4c:	01812803          	lw	a6,24(sp)
    5c50:	05810713          	add	a4,sp,88
    5c54:	000d0693          	mv	a3,s10
    5c58:	00080593          	mv	a1,a6
    5c5c:	04c10613          	add	a2,sp,76
    5c60:	00040513          	mv	a0,s0
    5c64:	04d040ef          	jal	a4b0 <_wcsrtombs_r>
    5c68:	01812803          	lw	a6,24(sp)
    5c6c:	01c12e03          	lw	t3,28(sp)
    5c70:	02012883          	lw	a7,32(sp)
    5c74:	40ad1063          	bne	s10,a0,6074 <_vfiprintf_r+0x17a8>
    5c78:	fffd4e93          	not	t4,s10
    5c7c:	01a807b3          	add	a5,a6,s10
    5c80:	41fede93          	sra	t4,t4,0x1f
    5c84:	00078023          	sb	zero,0(a5)
    5c88:	01dd7eb3          	and	t4,s10,t4
    5c8c:	2140006f          	j	5ea0 <_vfiprintf_r+0x15d4>
    5c90:	010e7613          	and	a2,t3,16
    5c94:	000aa783          	lw	a5,0(s5)
    5c98:	004a8a93          	add	s5,s5,4
    5c9c:	02061263          	bnez	a2,5cc0 <_vfiprintf_r+0x13f4>
    5ca0:	040e7613          	and	a2,t3,64
    5ca4:	00060a63          	beqz	a2,5cb8 <_vfiprintf_r+0x13ec>
    5ca8:	01079793          	sll	a5,a5,0x10
    5cac:	0107d793          	srl	a5,a5,0x10
    5cb0:	00000593          	li	a1,0
    5cb4:	e1dff06f          	j	5ad0 <_vfiprintf_r+0x1204>
    5cb8:	200e7613          	and	a2,t3,512
    5cbc:	22061e63          	bnez	a2,5ef8 <_vfiprintf_r+0x162c>
    5cc0:	00000593          	li	a1,0
    5cc4:	e0dff06f          	j	5ad0 <_vfiprintf_r+0x1204>
    5cc8:	400e7793          	and	a5,t3,1024
    5ccc:	00000693          	li	a3,0
    5cd0:	11010e93          	add	t4,sp,272
    5cd4:	01812823          	sw	s8,16(sp)
    5cd8:	02812223          	sw	s0,36(sp)
    5cdc:	03912c23          	sw	s9,56(sp)
    5ce0:	03512e23          	sw	s5,60(sp)
    5ce4:	02c12c83          	lw	s9,44(sp)
    5ce8:	01c12c23          	sw	t3,24(sp)
    5cec:	01112e23          	sw	a7,28(sp)
    5cf0:	02e12023          	sw	a4,32(sp)
    5cf4:	00078c13          	mv	s8,a5
    5cf8:	00068413          	mv	s0,a3
    5cfc:	03312423          	sw	s3,40(sp)
    5d00:	000e8a93          	mv	s5,t4
    5d04:	0280006f          	j	5d2c <_vfiprintf_r+0x1460>
    5d08:	00a00613          	li	a2,10
    5d0c:	00000693          	li	a3,0
    5d10:	000d8513          	mv	a0,s11
    5d14:	000d0593          	mv	a1,s10
    5d18:	278050ef          	jal	af90 <__udivdi3>
    5d1c:	220d0a63          	beqz	s10,5f50 <_vfiprintf_r+0x1684>
    5d20:	00050d93          	mv	s11,a0
    5d24:	00058d13          	mv	s10,a1
    5d28:	00098a93          	mv	s5,s3
    5d2c:	00a00613          	li	a2,10
    5d30:	00000693          	li	a3,0
    5d34:	000d8513          	mv	a0,s11
    5d38:	000d0593          	mv	a1,s10
    5d3c:	101050ef          	jal	b63c <__umoddi3>
    5d40:	03050513          	add	a0,a0,48
    5d44:	feaa8fa3          	sb	a0,-1(s5)
    5d48:	fffa8993          	add	s3,s5,-1
    5d4c:	00140413          	add	s0,s0,1
    5d50:	fa0c0ce3          	beqz	s8,5d08 <_vfiprintf_r+0x143c>
    5d54:	000cc783          	lbu	a5,0(s9)
    5d58:	fa8798e3          	bne	a5,s0,5d08 <_vfiprintf_r+0x143c>
    5d5c:	0ff00793          	li	a5,255
    5d60:	faf404e3          	beq	s0,a5,5d08 <_vfiprintf_r+0x143c>
    5d64:	0e0d1a63          	bnez	s10,5e58 <_vfiprintf_r+0x158c>
    5d68:	00900793          	li	a5,9
    5d6c:	0fb7e663          	bltu	a5,s11,5e58 <_vfiprintf_r+0x158c>
    5d70:	00098813          	mv	a6,s3
    5d74:	03912623          	sw	s9,44(sp)
    5d78:	01012c03          	lw	s8,16(sp)
    5d7c:	01812e03          	lw	t3,24(sp)
    5d80:	01c12883          	lw	a7,28(sp)
    5d84:	02012703          	lw	a4,32(sp)
    5d88:	02412403          	lw	s0,36(sp)
    5d8c:	02812983          	lw	s3,40(sp)
    5d90:	03812c83          	lw	s9,56(sp)
    5d94:	03c12a83          	lw	s5,60(sp)
    5d98:	9a1ff06f          	j	5738 <_vfiprintf_r+0xe6c>
    5d9c:	00068e13          	mv	t3,a3
    5da0:	00000693          	li	a3,0
    5da4:	c0068263          	beqz	a3,51a8 <_vfiprintf_r+0x8dc>
    5da8:	95dff06f          	j	5704 <_vfiprintf_r+0xe38>
    5dac:	00040513          	mv	a0,s0
    5db0:	115000ef          	jal	66c4 <__sinit>
    5db4:	b61fe06f          	j	4914 <_vfiprintf_r+0x48>
    5db8:	001cc683          	lbu	a3,1(s9)
    5dbc:	200ded93          	or	s11,s11,512
    5dc0:	001c8c93          	add	s9,s9,1
    5dc4:	c89fe06f          	j	4a4c <_vfiprintf_r+0x180>
    5dc8:	001cc683          	lbu	a3,1(s9)
    5dcc:	020ded93          	or	s11,s11,32
    5dd0:	001c8c93          	add	s9,s9,1
    5dd4:	c79fe06f          	j	4a4c <_vfiprintf_r+0x180>
    5dd8:	000aa783          	lw	a5,0(s5)
    5ddc:	00c12703          	lw	a4,12(sp)
    5de0:	004a8a93          	add	s5,s5,4
    5de4:	00e7a023          	sw	a4,0(a5)
    5de8:	bfdfe06f          	j	49e4 <_vfiprintf_r+0x118>
    5dec:	00600793          	li	a5,6
    5df0:	00070d13          	mv	s10,a4
    5df4:	0ce7e863          	bltu	a5,a4,5ec4 <_vfiprintf_r+0x15f8>
    5df8:	000d0e93          	mv	t4,s10
    5dfc:	00009817          	auipc	a6,0x9
    5e00:	cac80813          	add	a6,a6,-852 # eaa8 <__fini_array_end+0x14c>
    5e04:	cb9fe06f          	j	4abc <_vfiprintf_r+0x1f0>
    5e08:	00000793          	li	a5,0
    5e0c:	00000593          	li	a1,0
    5e10:	8f5ff06f          	j	5704 <_vfiprintf_r+0xe38>
    5e14:	05810713          	add	a4,sp,88
    5e18:	00000693          	li	a3,0
    5e1c:	04c10613          	add	a2,sp,76
    5e20:	00000593          	li	a1,0
    5e24:	00040513          	mv	a0,s0
    5e28:	01112e23          	sw	a7,28(sp)
    5e2c:	01012c23          	sw	a6,24(sp)
    5e30:	01c12823          	sw	t3,16(sp)
    5e34:	67c040ef          	jal	a4b0 <_wcsrtombs_r>
    5e38:	fff00793          	li	a5,-1
    5e3c:	01012e03          	lw	t3,16(sp)
    5e40:	01812803          	lw	a6,24(sp)
    5e44:	01c12883          	lw	a7,28(sp)
    5e48:	00050d13          	mv	s10,a0
    5e4c:	1ef50e63          	beq	a0,a5,6048 <_vfiprintf_r+0x177c>
    5e50:	05012623          	sw	a6,76(sp)
    5e54:	da9ff06f          	j	5bfc <_vfiprintf_r+0x1330>
    5e58:	03012783          	lw	a5,48(sp)
    5e5c:	03412583          	lw	a1,52(sp)
    5e60:	00000413          	li	s0,0
    5e64:	40f989b3          	sub	s3,s3,a5
    5e68:	00078613          	mv	a2,a5
    5e6c:	00098513          	mv	a0,s3
    5e70:	43c010ef          	jal	72ac <strncpy>
    5e74:	001cc783          	lbu	a5,1(s9)
    5e78:	00a00613          	li	a2,10
    5e7c:	00000693          	li	a3,0
    5e80:	00f037b3          	snez	a5,a5
    5e84:	000d8513          	mv	a0,s11
    5e88:	000d0593          	mv	a1,s10
    5e8c:	00fc8cb3          	add	s9,s9,a5
    5e90:	100050ef          	jal	af90 <__udivdi3>
    5e94:	e8dff06f          	j	5d20 <_vfiprintf_r+0x1454>
    5e98:	00000e93          	li	t4,0
    5e9c:	00012823          	sw	zero,16(sp)
    5ea0:	04314783          	lbu	a5,67(sp)
    5ea4:	00000713          	li	a4,0
    5ea8:	00000f93          	li	t6,0
    5eac:	a0079063          	bnez	a5,50ac <_vfiprintf_r+0x7e0>
    5eb0:	c19fe06f          	j	4ac8 <_vfiprintf_r+0x1fc>
    5eb4:	00100f13          	li	t5,1
    5eb8:	00000613          	li	a2,0
    5ebc:	000a0c13          	mv	s8,s4
    5ec0:	ce9fe06f          	j	4ba8 <_vfiprintf_r+0x2dc>
    5ec4:	00600d13          	li	s10,6
    5ec8:	f31ff06f          	j	5df8 <_vfiprintf_r+0x152c>
    5ecc:	00100f13          	li	t5,1
    5ed0:	000a0c13          	mv	s8,s4
    5ed4:	c4dfe06f          	j	4b20 <_vfiprintf_r+0x254>
    5ed8:	000aa783          	lw	a5,0(s5)
    5edc:	00c12703          	lw	a4,12(sp)
    5ee0:	004a8a93          	add	s5,s5,4
    5ee4:	00e79023          	sh	a4,0(a5)
    5ee8:	afdfe06f          	j	49e4 <_vfiprintf_r+0x118>
    5eec:	0ff7fd93          	zext.b	s11,a5
    5ef0:	00000d13          	li	s10,0
    5ef4:	a04ff06f          	j	50f8 <_vfiprintf_r+0x82c>
    5ef8:	0ff7f793          	zext.b	a5,a5
    5efc:	00000593          	li	a1,0
    5f00:	bd1ff06f          	j	5ad0 <_vfiprintf_r+0x1204>
    5f04:	0ff7f793          	zext.b	a5,a5
    5f08:	00000593          	li	a1,0
    5f0c:	a5cff06f          	j	5168 <_vfiprintf_r+0x89c>
    5f10:	01879d93          	sll	s11,a5,0x18
    5f14:	418ddd93          	sra	s11,s11,0x18
    5f18:	41fddd13          	sra	s10,s11,0x1f
    5f1c:	000d0693          	mv	a3,s10
    5f20:	95cff06f          	j	507c <_vfiprintf_r+0x7b0>
    5f24:	03000793          	li	a5,48
    5f28:	c8cff06f          	j	53b4 <_vfiprintf_r+0xae8>
    5f2c:	00012823          	sw	zero,16(sp)
    5f30:	0ac10813          	add	a6,sp,172
    5f34:	cfdff06f          	j	5c30 <_vfiprintf_r+0x1364>
    5f38:	0589a503          	lw	a0,88(s3)
    5f3c:	61c010ef          	jal	7558 <__retarget_lock_release_recursive>
    5f40:	d51fe06f          	j	4c90 <_vfiprintf_r+0x3c4>
    5f44:	00070e93          	mv	t4,a4
    5f48:	00070d13          	mv	s10,a4
    5f4c:	f55ff06f          	j	5ea0 <_vfiprintf_r+0x15d4>
    5f50:	00900793          	li	a5,9
    5f54:	ddb7e6e3          	bltu	a5,s11,5d20 <_vfiprintf_r+0x1454>
    5f58:	e19ff06f          	j	5d70 <_vfiprintf_r+0x14a4>
    5f5c:	00058513          	mv	a0,a1
    5f60:	00009317          	auipc	t1,0x9
    5f64:	1a430313          	add	t1,t1,420 # f104 <blanks.1>
    5f68:	8cdff06f          	j	5834 <_vfiprintf_r+0xf68>
    5f6c:	00080513          	mv	a0,a6
    5f70:	03112023          	sw	a7,32(sp)
    5f74:	01012c23          	sw	a6,24(sp)
    5f78:	01b12e23          	sw	s11,28(sp)
    5f7c:	da9fa0ef          	jal	d24 <strlen>
    5f80:	fff54e93          	not	t4,a0
    5f84:	41fede93          	sra	t4,t4,0x1f
    5f88:	01812803          	lw	a6,24(sp)
    5f8c:	01c12e03          	lw	t3,28(sp)
    5f90:	02012883          	lw	a7,32(sp)
    5f94:	00050d13          	mv	s10,a0
    5f98:	01d57eb3          	and	t4,a0,t4
    5f9c:	00012823          	sw	zero,16(sp)
    5fa0:	f01ff06f          	j	5ea0 <_vfiprintf_r+0x15d4>
    5fa4:	06010613          	add	a2,sp,96
    5fa8:	00098593          	mv	a1,s3
    5fac:	00040513          	mv	a0,s0
    5fb0:	fe0fe0ef          	jal	4790 <__sprint_r.part.0>
    5fb4:	00051463          	bnez	a0,5fbc <_vfiprintf_r+0x16f0>
    5fb8:	dc5fe06f          	j	4d7c <_vfiprintf_r+0x4b0>
    5fbc:	df5fe06f          	j	4db0 <_vfiprintf_r+0x4e4>
    5fc0:	00168613          	add	a2,a3,1
    5fc4:	00009317          	auipc	t1,0x9
    5fc8:	14030313          	add	t1,t1,320 # f104 <blanks.1>
    5fcc:	f19fe06f          	j	4ee4 <_vfiprintf_r+0x618>
    5fd0:	000f0513          	mv	a0,t5
    5fd4:	00009f97          	auipc	t6,0x9
    5fd8:	120f8f93          	add	t6,t6,288 # f0f4 <zeroes.0>
    5fdc:	d10ff06f          	j	54ec <_vfiprintf_r+0xc20>
    5fe0:	0649a783          	lw	a5,100(s3)
    5fe4:	0017f793          	and	a5,a5,1
    5fe8:	00079c63          	bnez	a5,6000 <_vfiprintf_r+0x1734>
    5fec:	00c9d783          	lhu	a5,12(s3)
    5ff0:	2007f793          	and	a5,a5,512
    5ff4:	00079663          	bnez	a5,6000 <_vfiprintf_r+0x1734>
    5ff8:	0589a503          	lw	a0,88(s3)
    5ffc:	55c010ef          	jal	7558 <__retarget_lock_release_recursive>
    6000:	fff00793          	li	a5,-1
    6004:	00f12623          	sw	a5,12(sp)
    6008:	de5fe06f          	j	4dec <_vfiprintf_r+0x520>
    600c:	00098713          	mv	a4,s3
    6010:	000c8a93          	mv	s5,s9
    6014:	000d0993          	mv	s3,s10
    6018:	01012c03          	lw	s8,16(sp)
    601c:	01812e03          	lw	t3,24(sp)
    6020:	01c12803          	lw	a6,28(sp)
    6024:	02012883          	lw	a7,32(sp)
    6028:	000d8c93          	mv	s9,s11
    602c:	00070d13          	mv	s10,a4
    6030:	bcdff06f          	j	5bfc <_vfiprintf_r+0x1330>
    6034:	00cd1783          	lh	a5,12(s10)
    6038:	000d0993          	mv	s3,s10
    603c:	0407e793          	or	a5,a5,64
    6040:	00fd1623          	sh	a5,12(s10)
    6044:	d71fe06f          	j	4db4 <_vfiprintf_r+0x4e8>
    6048:	00c99783          	lh	a5,12(s3)
    604c:	0407e793          	or	a5,a5,64
    6050:	00f99623          	sh	a5,12(s3)
    6054:	d61fe06f          	j	4db4 <_vfiprintf_r+0x4e8>
    6058:	000aa703          	lw	a4,0(s5)
    605c:	004a8a93          	add	s5,s5,4
    6060:	00075463          	bgez	a4,6068 <_vfiprintf_r+0x179c>
    6064:	fff00713          	li	a4,-1
    6068:	001cc683          	lbu	a3,1(s9)
    606c:	00058c93          	mv	s9,a1
    6070:	9ddfe06f          	j	4a4c <_vfiprintf_r+0x180>
    6074:	00c9d783          	lhu	a5,12(s3)
    6078:	0407e793          	or	a5,a5,64
    607c:	00f99623          	sh	a5,12(s3)
    6080:	d1dfe06f          	j	4d9c <_vfiprintf_r+0x4d0>

00006084 <__sbprintf>:
    6084:	b7010113          	add	sp,sp,-1168
    6088:	00c59783          	lh	a5,12(a1)
    608c:	00e5d703          	lhu	a4,14(a1)
    6090:	48812423          	sw	s0,1160(sp)
    6094:	00058413          	mv	s0,a1
    6098:	000105b7          	lui	a1,0x10
    609c:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0xcad>
    60a0:	06442303          	lw	t1,100(s0)
    60a4:	01c42883          	lw	a7,28(s0)
    60a8:	02442803          	lw	a6,36(s0)
    60ac:	01071713          	sll	a4,a4,0x10
    60b0:	00b7f7b3          	and	a5,a5,a1
    60b4:	00e7e7b3          	or	a5,a5,a4
    60b8:	40000593          	li	a1,1024
    60bc:	49212023          	sw	s2,1152(sp)
    60c0:	00f12a23          	sw	a5,20(sp)
    60c4:	00050913          	mv	s2,a0
    60c8:	07010793          	add	a5,sp,112
    60cc:	06010513          	add	a0,sp,96
    60d0:	48112623          	sw	ra,1164(sp)
    60d4:	48912223          	sw	s1,1156(sp)
    60d8:	47312e23          	sw	s3,1148(sp)
    60dc:	00060493          	mv	s1,a2
    60e0:	00068993          	mv	s3,a3
    60e4:	06612623          	sw	t1,108(sp)
    60e8:	03112223          	sw	a7,36(sp)
    60ec:	03012623          	sw	a6,44(sp)
    60f0:	00f12423          	sw	a5,8(sp)
    60f4:	00f12c23          	sw	a5,24(sp)
    60f8:	00b12823          	sw	a1,16(sp)
    60fc:	00b12e23          	sw	a1,28(sp)
    6100:	02012023          	sw	zero,32(sp)
    6104:	448010ef          	jal	754c <__retarget_lock_init_recursive>
    6108:	00048613          	mv	a2,s1
    610c:	00098693          	mv	a3,s3
    6110:	00810593          	add	a1,sp,8
    6114:	00090513          	mv	a0,s2
    6118:	fb4fe0ef          	jal	48cc <_vfiprintf_r>
    611c:	00050493          	mv	s1,a0
    6120:	04055263          	bgez	a0,6164 <__sbprintf+0xe0>
    6124:	01415783          	lhu	a5,20(sp)
    6128:	0407f793          	and	a5,a5,64
    612c:	00078863          	beqz	a5,613c <__sbprintf+0xb8>
    6130:	00c45783          	lhu	a5,12(s0)
    6134:	0407e793          	or	a5,a5,64
    6138:	00f41623          	sh	a5,12(s0)
    613c:	06012503          	lw	a0,96(sp)
    6140:	410010ef          	jal	7550 <__retarget_lock_close_recursive>
    6144:	48c12083          	lw	ra,1164(sp)
    6148:	48812403          	lw	s0,1160(sp)
    614c:	48012903          	lw	s2,1152(sp)
    6150:	47c12983          	lw	s3,1148(sp)
    6154:	00048513          	mv	a0,s1
    6158:	48412483          	lw	s1,1156(sp)
    615c:	49010113          	add	sp,sp,1168
    6160:	00008067          	ret
    6164:	00810593          	add	a1,sp,8
    6168:	00090513          	mv	a0,s2
    616c:	25c000ef          	jal	63c8 <_fflush_r>
    6170:	fa050ae3          	beqz	a0,6124 <__sbprintf+0xa0>
    6174:	fff00493          	li	s1,-1
    6178:	fadff06f          	j	6124 <__sbprintf+0xa0>

0000617c <__sflush_r>:
    617c:	00c59703          	lh	a4,12(a1)
    6180:	fe010113          	add	sp,sp,-32
    6184:	00812c23          	sw	s0,24(sp)
    6188:	01312623          	sw	s3,12(sp)
    618c:	00112e23          	sw	ra,28(sp)
    6190:	00877793          	and	a5,a4,8
    6194:	00058413          	mv	s0,a1
    6198:	00050993          	mv	s3,a0
    619c:	12079063          	bnez	a5,62bc <__sflush_r+0x140>
    61a0:	000017b7          	lui	a5,0x1
    61a4:	80078793          	add	a5,a5,-2048 # 800 <_kill>
    61a8:	0045a683          	lw	a3,4(a1)
    61ac:	00f767b3          	or	a5,a4,a5
    61b0:	00f59623          	sh	a5,12(a1)
    61b4:	18d05263          	blez	a3,6338 <__sflush_r+0x1bc>
    61b8:	02842803          	lw	a6,40(s0)
    61bc:	0e080463          	beqz	a6,62a4 <__sflush_r+0x128>
    61c0:	00912a23          	sw	s1,20(sp)
    61c4:	01371693          	sll	a3,a4,0x13
    61c8:	0009a483          	lw	s1,0(s3)
    61cc:	0009a023          	sw	zero,0(s3)
    61d0:	01c42583          	lw	a1,28(s0)
    61d4:	1606ce63          	bltz	a3,6350 <__sflush_r+0x1d4>
    61d8:	00000613          	li	a2,0
    61dc:	00100693          	li	a3,1
    61e0:	00098513          	mv	a0,s3
    61e4:	000800e7          	jalr	a6
    61e8:	fff00793          	li	a5,-1
    61ec:	00050613          	mv	a2,a0
    61f0:	1af50463          	beq	a0,a5,6398 <__sflush_r+0x21c>
    61f4:	00c41783          	lh	a5,12(s0)
    61f8:	02842803          	lw	a6,40(s0)
    61fc:	01c42583          	lw	a1,28(s0)
    6200:	0047f793          	and	a5,a5,4
    6204:	00078e63          	beqz	a5,6220 <__sflush_r+0xa4>
    6208:	00442703          	lw	a4,4(s0)
    620c:	03042783          	lw	a5,48(s0)
    6210:	40e60633          	sub	a2,a2,a4
    6214:	00078663          	beqz	a5,6220 <__sflush_r+0xa4>
    6218:	03c42783          	lw	a5,60(s0)
    621c:	40f60633          	sub	a2,a2,a5
    6220:	00000693          	li	a3,0
    6224:	00098513          	mv	a0,s3
    6228:	000800e7          	jalr	a6
    622c:	fff00793          	li	a5,-1
    6230:	12f51463          	bne	a0,a5,6358 <__sflush_r+0x1dc>
    6234:	0009a683          	lw	a3,0(s3)
    6238:	01d00793          	li	a5,29
    623c:	00c41703          	lh	a4,12(s0)
    6240:	16d7ea63          	bltu	a5,a3,63b4 <__sflush_r+0x238>
    6244:	204007b7          	lui	a5,0x20400
    6248:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    624c:	00d7d7b3          	srl	a5,a5,a3
    6250:	0017f793          	and	a5,a5,1
    6254:	16078063          	beqz	a5,63b4 <__sflush_r+0x238>
    6258:	01042603          	lw	a2,16(s0)
    625c:	fffff7b7          	lui	a5,0xfffff
    6260:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6264:	00f777b3          	and	a5,a4,a5
    6268:	00f41623          	sh	a5,12(s0)
    626c:	00042223          	sw	zero,4(s0)
    6270:	00c42023          	sw	a2,0(s0)
    6274:	01371793          	sll	a5,a4,0x13
    6278:	0007d463          	bgez	a5,6280 <__sflush_r+0x104>
    627c:	10068263          	beqz	a3,6380 <__sflush_r+0x204>
    6280:	03042583          	lw	a1,48(s0)
    6284:	0099a023          	sw	s1,0(s3)
    6288:	10058463          	beqz	a1,6390 <__sflush_r+0x214>
    628c:	04040793          	add	a5,s0,64
    6290:	00f58663          	beq	a1,a5,629c <__sflush_r+0x120>
    6294:	00098513          	mv	a0,s3
    6298:	c5dfa0ef          	jal	ef4 <_free_r>
    629c:	01412483          	lw	s1,20(sp)
    62a0:	02042823          	sw	zero,48(s0)
    62a4:	00000513          	li	a0,0
    62a8:	01c12083          	lw	ra,28(sp)
    62ac:	01812403          	lw	s0,24(sp)
    62b0:	00c12983          	lw	s3,12(sp)
    62b4:	02010113          	add	sp,sp,32
    62b8:	00008067          	ret
    62bc:	01212823          	sw	s2,16(sp)
    62c0:	0105a903          	lw	s2,16(a1)
    62c4:	08090263          	beqz	s2,6348 <__sflush_r+0x1cc>
    62c8:	00912a23          	sw	s1,20(sp)
    62cc:	0005a483          	lw	s1,0(a1)
    62d0:	00377713          	and	a4,a4,3
    62d4:	0125a023          	sw	s2,0(a1)
    62d8:	412484b3          	sub	s1,s1,s2
    62dc:	00000793          	li	a5,0
    62e0:	00071463          	bnez	a4,62e8 <__sflush_r+0x16c>
    62e4:	0145a783          	lw	a5,20(a1)
    62e8:	00f42423          	sw	a5,8(s0)
    62ec:	00904863          	bgtz	s1,62fc <__sflush_r+0x180>
    62f0:	0540006f          	j	6344 <__sflush_r+0x1c8>
    62f4:	00a90933          	add	s2,s2,a0
    62f8:	04905663          	blez	s1,6344 <__sflush_r+0x1c8>
    62fc:	02442783          	lw	a5,36(s0)
    6300:	01c42583          	lw	a1,28(s0)
    6304:	00048693          	mv	a3,s1
    6308:	00090613          	mv	a2,s2
    630c:	00098513          	mv	a0,s3
    6310:	000780e7          	jalr	a5
    6314:	40a484b3          	sub	s1,s1,a0
    6318:	fca04ee3          	bgtz	a0,62f4 <__sflush_r+0x178>
    631c:	00c41703          	lh	a4,12(s0)
    6320:	01012903          	lw	s2,16(sp)
    6324:	04076713          	or	a4,a4,64
    6328:	01412483          	lw	s1,20(sp)
    632c:	00e41623          	sh	a4,12(s0)
    6330:	fff00513          	li	a0,-1
    6334:	f75ff06f          	j	62a8 <__sflush_r+0x12c>
    6338:	03c5a683          	lw	a3,60(a1)
    633c:	e6d04ee3          	bgtz	a3,61b8 <__sflush_r+0x3c>
    6340:	f65ff06f          	j	62a4 <__sflush_r+0x128>
    6344:	01412483          	lw	s1,20(sp)
    6348:	01012903          	lw	s2,16(sp)
    634c:	f59ff06f          	j	62a4 <__sflush_r+0x128>
    6350:	05042603          	lw	a2,80(s0)
    6354:	eadff06f          	j	6200 <__sflush_r+0x84>
    6358:	00c41703          	lh	a4,12(s0)
    635c:	01042683          	lw	a3,16(s0)
    6360:	fffff7b7          	lui	a5,0xfffff
    6364:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6368:	00f777b3          	and	a5,a4,a5
    636c:	00f41623          	sh	a5,12(s0)
    6370:	00042223          	sw	zero,4(s0)
    6374:	00d42023          	sw	a3,0(s0)
    6378:	01371793          	sll	a5,a4,0x13
    637c:	f007d2e3          	bgez	a5,6280 <__sflush_r+0x104>
    6380:	03042583          	lw	a1,48(s0)
    6384:	04a42823          	sw	a0,80(s0)
    6388:	0099a023          	sw	s1,0(s3)
    638c:	f00590e3          	bnez	a1,628c <__sflush_r+0x110>
    6390:	01412483          	lw	s1,20(sp)
    6394:	f11ff06f          	j	62a4 <__sflush_r+0x128>
    6398:	0009a783          	lw	a5,0(s3)
    639c:	e4078ce3          	beqz	a5,61f4 <__sflush_r+0x78>
    63a0:	01d00713          	li	a4,29
    63a4:	00e78c63          	beq	a5,a4,63bc <__sflush_r+0x240>
    63a8:	01600713          	li	a4,22
    63ac:	00e78863          	beq	a5,a4,63bc <__sflush_r+0x240>
    63b0:	00c41703          	lh	a4,12(s0)
    63b4:	04076713          	or	a4,a4,64
    63b8:	f71ff06f          	j	6328 <__sflush_r+0x1ac>
    63bc:	0099a023          	sw	s1,0(s3)
    63c0:	01412483          	lw	s1,20(sp)
    63c4:	ee1ff06f          	j	62a4 <__sflush_r+0x128>

000063c8 <_fflush_r>:
    63c8:	ff010113          	add	sp,sp,-16
    63cc:	00812423          	sw	s0,8(sp)
    63d0:	00912223          	sw	s1,4(sp)
    63d4:	00112623          	sw	ra,12(sp)
    63d8:	01212023          	sw	s2,0(sp)
    63dc:	00050493          	mv	s1,a0
    63e0:	00058413          	mv	s0,a1
    63e4:	00050663          	beqz	a0,63f0 <_fflush_r+0x28>
    63e8:	03452783          	lw	a5,52(a0)
    63ec:	0a078a63          	beqz	a5,64a0 <_fflush_r+0xd8>
    63f0:	00c41783          	lh	a5,12(s0)
    63f4:	00000913          	li	s2,0
    63f8:	04078063          	beqz	a5,6438 <_fflush_r+0x70>
    63fc:	06442703          	lw	a4,100(s0)
    6400:	00177713          	and	a4,a4,1
    6404:	00071663          	bnez	a4,6410 <_fflush_r+0x48>
    6408:	2007f793          	and	a5,a5,512
    640c:	04078463          	beqz	a5,6454 <_fflush_r+0x8c>
    6410:	00040593          	mv	a1,s0
    6414:	00048513          	mv	a0,s1
    6418:	d65ff0ef          	jal	617c <__sflush_r>
    641c:	06442783          	lw	a5,100(s0)
    6420:	00050913          	mv	s2,a0
    6424:	0017f793          	and	a5,a5,1
    6428:	00079863          	bnez	a5,6438 <_fflush_r+0x70>
    642c:	00c45783          	lhu	a5,12(s0)
    6430:	2007f793          	and	a5,a5,512
    6434:	04078463          	beqz	a5,647c <_fflush_r+0xb4>
    6438:	00c12083          	lw	ra,12(sp)
    643c:	00812403          	lw	s0,8(sp)
    6440:	00412483          	lw	s1,4(sp)
    6444:	00090513          	mv	a0,s2
    6448:	00012903          	lw	s2,0(sp)
    644c:	01010113          	add	sp,sp,16
    6450:	00008067          	ret
    6454:	05842503          	lw	a0,88(s0)
    6458:	0fc010ef          	jal	7554 <__retarget_lock_acquire_recursive>
    645c:	00040593          	mv	a1,s0
    6460:	00048513          	mv	a0,s1
    6464:	d19ff0ef          	jal	617c <__sflush_r>
    6468:	06442783          	lw	a5,100(s0)
    646c:	00050913          	mv	s2,a0
    6470:	0017f793          	and	a5,a5,1
    6474:	fc0792e3          	bnez	a5,6438 <_fflush_r+0x70>
    6478:	fb5ff06f          	j	642c <_fflush_r+0x64>
    647c:	05842503          	lw	a0,88(s0)
    6480:	0d8010ef          	jal	7558 <__retarget_lock_release_recursive>
    6484:	00c12083          	lw	ra,12(sp)
    6488:	00812403          	lw	s0,8(sp)
    648c:	00412483          	lw	s1,4(sp)
    6490:	00090513          	mv	a0,s2
    6494:	00012903          	lw	s2,0(sp)
    6498:	01010113          	add	sp,sp,16
    649c:	00008067          	ret
    64a0:	224000ef          	jal	66c4 <__sinit>
    64a4:	f4dff06f          	j	63f0 <_fflush_r+0x28>

000064a8 <stdio_exit_handler>:
    64a8:	7fffa617          	auipc	a2,0x7fffa
    64ac:	08060613          	add	a2,a2,128 # 80000528 <__sglue>
    64b0:	00004597          	auipc	a1,0x4
    64b4:	01058593          	add	a1,a1,16 # a4c0 <_fclose_r>
    64b8:	7fffa517          	auipc	a0,0x7fffa
    64bc:	b4850513          	add	a0,a0,-1208 # 80000000 <_impure_data>
    64c0:	7a00006f          	j	6c60 <_fwalk_sglue>

000064c4 <cleanup_stdio>:
    64c4:	00452583          	lw	a1,4(a0)
    64c8:	ff010113          	add	sp,sp,-16
    64cc:	00812423          	sw	s0,8(sp)
    64d0:	00112623          	sw	ra,12(sp)
    64d4:	7fffa797          	auipc	a5,0x7fffa
    64d8:	30878793          	add	a5,a5,776 # 800007dc <__sf>
    64dc:	00050413          	mv	s0,a0
    64e0:	00f58463          	beq	a1,a5,64e8 <cleanup_stdio+0x24>
    64e4:	7dd030ef          	jal	a4c0 <_fclose_r>
    64e8:	00842583          	lw	a1,8(s0)
    64ec:	7fffa797          	auipc	a5,0x7fffa
    64f0:	35878793          	add	a5,a5,856 # 80000844 <__global_pointer+0x44>
    64f4:	00f58663          	beq	a1,a5,6500 <cleanup_stdio+0x3c>
    64f8:	00040513          	mv	a0,s0
    64fc:	7c5030ef          	jal	a4c0 <_fclose_r>
    6500:	00c42583          	lw	a1,12(s0)
    6504:	7fffa797          	auipc	a5,0x7fffa
    6508:	3a878793          	add	a5,a5,936 # 800008ac <__global_pointer+0xac>
    650c:	00f58c63          	beq	a1,a5,6524 <cleanup_stdio+0x60>
    6510:	00040513          	mv	a0,s0
    6514:	00812403          	lw	s0,8(sp)
    6518:	00c12083          	lw	ra,12(sp)
    651c:	01010113          	add	sp,sp,16
    6520:	7a10306f          	j	a4c0 <_fclose_r>
    6524:	00c12083          	lw	ra,12(sp)
    6528:	00812403          	lw	s0,8(sp)
    652c:	01010113          	add	sp,sp,16
    6530:	00008067          	ret

00006534 <global_stdio_init.part.0>:
    6534:	fe010113          	add	sp,sp,-32
    6538:	00000797          	auipc	a5,0x0
    653c:	f7078793          	add	a5,a5,-144 # 64a8 <stdio_exit_handler>
    6540:	00112e23          	sw	ra,28(sp)
    6544:	00812c23          	sw	s0,24(sp)
    6548:	00912a23          	sw	s1,20(sp)
    654c:	7fffa417          	auipc	s0,0x7fffa
    6550:	29040413          	add	s0,s0,656 # 800007dc <__sf>
    6554:	01212823          	sw	s2,16(sp)
    6558:	01312623          	sw	s3,12(sp)
    655c:	01412423          	sw	s4,8(sp)
    6560:	00800613          	li	a2,8
    6564:	00000593          	li	a1,0
    6568:	7fffa717          	auipc	a4,0x7fffa
    656c:	1cf72023          	sw	a5,448(a4) # 80000728 <__stdio_exit_handler>
    6570:	7fffa517          	auipc	a0,0x7fffa
    6574:	2c850513          	add	a0,a0,712 # 80000838 <__global_pointer+0x38>
    6578:	00400793          	li	a5,4
    657c:	00f42623          	sw	a5,12(s0)
    6580:	00042023          	sw	zero,0(s0)
    6584:	00042223          	sw	zero,4(s0)
    6588:	00042423          	sw	zero,8(s0)
    658c:	06042223          	sw	zero,100(s0)
    6590:	00042823          	sw	zero,16(s0)
    6594:	00042a23          	sw	zero,20(s0)
    6598:	00042c23          	sw	zero,24(s0)
    659c:	d08fa0ef          	jal	aa4 <memset>
    65a0:	00000a17          	auipc	s4,0x0
    65a4:	774a0a13          	add	s4,s4,1908 # 6d14 <__sread>
    65a8:	00000997          	auipc	s3,0x0
    65ac:	7c898993          	add	s3,s3,1992 # 6d70 <__swrite>
    65b0:	00001917          	auipc	s2,0x1
    65b4:	84890913          	add	s2,s2,-1976 # 6df8 <__sseek>
    65b8:	00001497          	auipc	s1,0x1
    65bc:	8b848493          	add	s1,s1,-1864 # 6e70 <__sclose>
    65c0:	7fffa517          	auipc	a0,0x7fffa
    65c4:	27450513          	add	a0,a0,628 # 80000834 <__global_pointer+0x34>
    65c8:	03442023          	sw	s4,32(s0)
    65cc:	03342223          	sw	s3,36(s0)
    65d0:	03242423          	sw	s2,40(s0)
    65d4:	02942623          	sw	s1,44(s0)
    65d8:	00842e23          	sw	s0,28(s0)
    65dc:	771000ef          	jal	754c <__retarget_lock_init_recursive>
    65e0:	000107b7          	lui	a5,0x10
    65e4:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0xcb9>
    65e8:	00800613          	li	a2,8
    65ec:	00000593          	li	a1,0
    65f0:	7fffa517          	auipc	a0,0x7fffa
    65f4:	2b050513          	add	a0,a0,688 # 800008a0 <__global_pointer+0xa0>
    65f8:	06f42a23          	sw	a5,116(s0)
    65fc:	06042423          	sw	zero,104(s0)
    6600:	06042623          	sw	zero,108(s0)
    6604:	06042823          	sw	zero,112(s0)
    6608:	0c042623          	sw	zero,204(s0)
    660c:	06042c23          	sw	zero,120(s0)
    6610:	06042e23          	sw	zero,124(s0)
    6614:	08042023          	sw	zero,128(s0)
    6618:	c8cfa0ef          	jal	aa4 <memset>
    661c:	7fffa797          	auipc	a5,0x7fffa
    6620:	22878793          	add	a5,a5,552 # 80000844 <__global_pointer+0x44>
    6624:	7fffa517          	auipc	a0,0x7fffa
    6628:	27850513          	add	a0,a0,632 # 8000089c <__global_pointer+0x9c>
    662c:	08f42223          	sw	a5,132(s0)
    6630:	09442423          	sw	s4,136(s0)
    6634:	09342623          	sw	s3,140(s0)
    6638:	09242823          	sw	s2,144(s0)
    663c:	08942a23          	sw	s1,148(s0)
    6640:	70d000ef          	jal	754c <__retarget_lock_init_recursive>
    6644:	000207b7          	lui	a5,0x20
    6648:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    664c:	00800613          	li	a2,8
    6650:	00000593          	li	a1,0
    6654:	7fffa517          	auipc	a0,0x7fffa
    6658:	2b450513          	add	a0,a0,692 # 80000908 <__global_pointer+0x108>
    665c:	0cf42e23          	sw	a5,220(s0)
    6660:	0c042823          	sw	zero,208(s0)
    6664:	0c042a23          	sw	zero,212(s0)
    6668:	0c042c23          	sw	zero,216(s0)
    666c:	12042a23          	sw	zero,308(s0)
    6670:	0e042023          	sw	zero,224(s0)
    6674:	0e042223          	sw	zero,228(s0)
    6678:	0e042423          	sw	zero,232(s0)
    667c:	c28fa0ef          	jal	aa4 <memset>
    6680:	7fffa797          	auipc	a5,0x7fffa
    6684:	22c78793          	add	a5,a5,556 # 800008ac <__global_pointer+0xac>
    6688:	0f442823          	sw	s4,240(s0)
    668c:	0f342a23          	sw	s3,244(s0)
    6690:	0f242c23          	sw	s2,248(s0)
    6694:	0e942e23          	sw	s1,252(s0)
    6698:	0ef42623          	sw	a5,236(s0)
    669c:	01812403          	lw	s0,24(sp)
    66a0:	01c12083          	lw	ra,28(sp)
    66a4:	01412483          	lw	s1,20(sp)
    66a8:	01012903          	lw	s2,16(sp)
    66ac:	00c12983          	lw	s3,12(sp)
    66b0:	00812a03          	lw	s4,8(sp)
    66b4:	7fffa517          	auipc	a0,0x7fffa
    66b8:	25050513          	add	a0,a0,592 # 80000904 <__global_pointer+0x104>
    66bc:	02010113          	add	sp,sp,32
    66c0:	68d0006f          	j	754c <__retarget_lock_init_recursive>

000066c4 <__sinit>:
    66c4:	ff010113          	add	sp,sp,-16
    66c8:	00812423          	sw	s0,8(sp)
    66cc:	00050413          	mv	s0,a0
    66d0:	7fffa517          	auipc	a0,0x7fffa
    66d4:	06050513          	add	a0,a0,96 # 80000730 <__lock___sfp_recursive_mutex>
    66d8:	00112623          	sw	ra,12(sp)
    66dc:	679000ef          	jal	7554 <__retarget_lock_acquire_recursive>
    66e0:	03442783          	lw	a5,52(s0)
    66e4:	00079e63          	bnez	a5,6700 <__sinit+0x3c>
    66e8:	00000797          	auipc	a5,0x0
    66ec:	ddc78793          	add	a5,a5,-548 # 64c4 <cleanup_stdio>
    66f0:	02f42a23          	sw	a5,52(s0)
    66f4:	7fffa797          	auipc	a5,0x7fffa
    66f8:	0347a783          	lw	a5,52(a5) # 80000728 <__stdio_exit_handler>
    66fc:	00078e63          	beqz	a5,6718 <__sinit+0x54>
    6700:	00812403          	lw	s0,8(sp)
    6704:	00c12083          	lw	ra,12(sp)
    6708:	7fffa517          	auipc	a0,0x7fffa
    670c:	02850513          	add	a0,a0,40 # 80000730 <__lock___sfp_recursive_mutex>
    6710:	01010113          	add	sp,sp,16
    6714:	6450006f          	j	7558 <__retarget_lock_release_recursive>
    6718:	e1dff0ef          	jal	6534 <global_stdio_init.part.0>
    671c:	00812403          	lw	s0,8(sp)
    6720:	00c12083          	lw	ra,12(sp)
    6724:	7fffa517          	auipc	a0,0x7fffa
    6728:	00c50513          	add	a0,a0,12 # 80000730 <__lock___sfp_recursive_mutex>
    672c:	01010113          	add	sp,sp,16
    6730:	6290006f          	j	7558 <__retarget_lock_release_recursive>

00006734 <__sfp_lock_acquire>:
    6734:	7fffa517          	auipc	a0,0x7fffa
    6738:	ffc50513          	add	a0,a0,-4 # 80000730 <__lock___sfp_recursive_mutex>
    673c:	6190006f          	j	7554 <__retarget_lock_acquire_recursive>

00006740 <__sfp_lock_release>:
    6740:	7fffa517          	auipc	a0,0x7fffa
    6744:	ff050513          	add	a0,a0,-16 # 80000730 <__lock___sfp_recursive_mutex>
    6748:	6110006f          	j	7558 <__retarget_lock_release_recursive>

0000674c <__sfvwrite_r>:
    674c:	00862783          	lw	a5,8(a2)
    6750:	2c078463          	beqz	a5,6a18 <__sfvwrite_r+0x2cc>
    6754:	00c59683          	lh	a3,12(a1)
    6758:	fd010113          	add	sp,sp,-48
    675c:	02812423          	sw	s0,40(sp)
    6760:	01412c23          	sw	s4,24(sp)
    6764:	01612823          	sw	s6,16(sp)
    6768:	02112623          	sw	ra,44(sp)
    676c:	0086f793          	and	a5,a3,8
    6770:	00060b13          	mv	s6,a2
    6774:	00050a13          	mv	s4,a0
    6778:	00058413          	mv	s0,a1
    677c:	08078e63          	beqz	a5,6818 <__sfvwrite_r+0xcc>
    6780:	0105a783          	lw	a5,16(a1)
    6784:	08078a63          	beqz	a5,6818 <__sfvwrite_r+0xcc>
    6788:	02912223          	sw	s1,36(sp)
    678c:	03212023          	sw	s2,32(sp)
    6790:	01312e23          	sw	s3,28(sp)
    6794:	01512a23          	sw	s5,20(sp)
    6798:	0026f793          	and	a5,a3,2
    679c:	000b2483          	lw	s1,0(s6)
    67a0:	0a078463          	beqz	a5,6848 <__sfvwrite_r+0xfc>
    67a4:	02442783          	lw	a5,36(s0)
    67a8:	01c42583          	lw	a1,28(s0)
    67ac:	80000ab7          	lui	s5,0x80000
    67b0:	00000993          	li	s3,0
    67b4:	00000913          	li	s2,0
    67b8:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    67bc:	00098613          	mv	a2,s3
    67c0:	000a0513          	mv	a0,s4
    67c4:	04090263          	beqz	s2,6808 <__sfvwrite_r+0xbc>
    67c8:	00090693          	mv	a3,s2
    67cc:	012af463          	bgeu	s5,s2,67d4 <__sfvwrite_r+0x88>
    67d0:	000a8693          	mv	a3,s5
    67d4:	000780e7          	jalr	a5
    67d8:	46a05263          	blez	a0,6c3c <__sfvwrite_r+0x4f0>
    67dc:	008b2783          	lw	a5,8(s6)
    67e0:	00a989b3          	add	s3,s3,a0
    67e4:	40a90933          	sub	s2,s2,a0
    67e8:	40a787b3          	sub	a5,a5,a0
    67ec:	00fb2423          	sw	a5,8(s6)
    67f0:	1a078663          	beqz	a5,699c <__sfvwrite_r+0x250>
    67f4:	02442783          	lw	a5,36(s0)
    67f8:	01c42583          	lw	a1,28(s0)
    67fc:	00098613          	mv	a2,s3
    6800:	000a0513          	mv	a0,s4
    6804:	fc0912e3          	bnez	s2,67c8 <__sfvwrite_r+0x7c>
    6808:	0004a983          	lw	s3,0(s1)
    680c:	0044a903          	lw	s2,4(s1)
    6810:	00848493          	add	s1,s1,8
    6814:	fa9ff06f          	j	67bc <__sfvwrite_r+0x70>
    6818:	00040593          	mv	a1,s0
    681c:	000a0513          	mv	a0,s4
    6820:	658000ef          	jal	6e78 <__swsetup_r>
    6824:	1c051c63          	bnez	a0,69fc <__sfvwrite_r+0x2b0>
    6828:	00c41683          	lh	a3,12(s0)
    682c:	02912223          	sw	s1,36(sp)
    6830:	03212023          	sw	s2,32(sp)
    6834:	01312e23          	sw	s3,28(sp)
    6838:	01512a23          	sw	s5,20(sp)
    683c:	0026f793          	and	a5,a3,2
    6840:	000b2483          	lw	s1,0(s6)
    6844:	f60790e3          	bnez	a5,67a4 <__sfvwrite_r+0x58>
    6848:	01712623          	sw	s7,12(sp)
    684c:	01812423          	sw	s8,8(sp)
    6850:	0016f793          	and	a5,a3,1
    6854:	1c079663          	bnez	a5,6a20 <__sfvwrite_r+0x2d4>
    6858:	00042783          	lw	a5,0(s0)
    685c:	00842703          	lw	a4,8(s0)
    6860:	80000ab7          	lui	s5,0x80000
    6864:	01912223          	sw	s9,4(sp)
    6868:	00000b93          	li	s7,0
    686c:	00000993          	li	s3,0
    6870:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6874:	00078513          	mv	a0,a5
    6878:	00070c13          	mv	s8,a4
    687c:	10098263          	beqz	s3,6980 <__sfvwrite_r+0x234>
    6880:	2006f613          	and	a2,a3,512
    6884:	28060863          	beqz	a2,6b14 <__sfvwrite_r+0x3c8>
    6888:	00070c93          	mv	s9,a4
    688c:	32e9e863          	bltu	s3,a4,6bbc <__sfvwrite_r+0x470>
    6890:	4806f713          	and	a4,a3,1152
    6894:	08070a63          	beqz	a4,6928 <__sfvwrite_r+0x1dc>
    6898:	01442603          	lw	a2,20(s0)
    689c:	01042583          	lw	a1,16(s0)
    68a0:	00161713          	sll	a4,a2,0x1
    68a4:	00c70733          	add	a4,a4,a2
    68a8:	40b78933          	sub	s2,a5,a1
    68ac:	01f75c13          	srl	s8,a4,0x1f
    68b0:	00ec0c33          	add	s8,s8,a4
    68b4:	00190793          	add	a5,s2,1
    68b8:	401c5c13          	sra	s8,s8,0x1
    68bc:	013787b3          	add	a5,a5,s3
    68c0:	000c0613          	mv	a2,s8
    68c4:	00fc7663          	bgeu	s8,a5,68d0 <__sfvwrite_r+0x184>
    68c8:	00078c13          	mv	s8,a5
    68cc:	00078613          	mv	a2,a5
    68d0:	4006f693          	and	a3,a3,1024
    68d4:	32068063          	beqz	a3,6bf4 <__sfvwrite_r+0x4a8>
    68d8:	00060593          	mv	a1,a2
    68dc:	000a0513          	mv	a0,s4
    68e0:	921fa0ef          	jal	1200 <_malloc_r>
    68e4:	00050c93          	mv	s9,a0
    68e8:	34050e63          	beqz	a0,6c44 <__sfvwrite_r+0x4f8>
    68ec:	01042583          	lw	a1,16(s0)
    68f0:	00090613          	mv	a2,s2
    68f4:	a8cfa0ef          	jal	b80 <memcpy>
    68f8:	00c45783          	lhu	a5,12(s0)
    68fc:	b7f7f793          	and	a5,a5,-1153
    6900:	0807e793          	or	a5,a5,128
    6904:	00f41623          	sh	a5,12(s0)
    6908:	012c8533          	add	a0,s9,s2
    690c:	412c07b3          	sub	a5,s8,s2
    6910:	01942823          	sw	s9,16(s0)
    6914:	01842a23          	sw	s8,20(s0)
    6918:	00a42023          	sw	a0,0(s0)
    691c:	00098c13          	mv	s8,s3
    6920:	00f42423          	sw	a5,8(s0)
    6924:	00098c93          	mv	s9,s3
    6928:	000c8613          	mv	a2,s9
    692c:	000b8593          	mv	a1,s7
    6930:	42d000ef          	jal	755c <memmove>
    6934:	00842703          	lw	a4,8(s0)
    6938:	00042783          	lw	a5,0(s0)
    693c:	00098913          	mv	s2,s3
    6940:	41870733          	sub	a4,a4,s8
    6944:	019787b3          	add	a5,a5,s9
    6948:	00e42423          	sw	a4,8(s0)
    694c:	00f42023          	sw	a5,0(s0)
    6950:	00000993          	li	s3,0
    6954:	008b2783          	lw	a5,8(s6)
    6958:	012b8bb3          	add	s7,s7,s2
    695c:	412787b3          	sub	a5,a5,s2
    6960:	00fb2423          	sw	a5,8(s6)
    6964:	02078663          	beqz	a5,6990 <__sfvwrite_r+0x244>
    6968:	00042783          	lw	a5,0(s0)
    696c:	00842703          	lw	a4,8(s0)
    6970:	00c41683          	lh	a3,12(s0)
    6974:	00078513          	mv	a0,a5
    6978:	00070c13          	mv	s8,a4
    697c:	f00992e3          	bnez	s3,6880 <__sfvwrite_r+0x134>
    6980:	0004ab83          	lw	s7,0(s1)
    6984:	0044a983          	lw	s3,4(s1)
    6988:	00848493          	add	s1,s1,8
    698c:	ee9ff06f          	j	6874 <__sfvwrite_r+0x128>
    6990:	00c12b83          	lw	s7,12(sp)
    6994:	00812c03          	lw	s8,8(sp)
    6998:	00412c83          	lw	s9,4(sp)
    699c:	02c12083          	lw	ra,44(sp)
    69a0:	02812403          	lw	s0,40(sp)
    69a4:	02412483          	lw	s1,36(sp)
    69a8:	02012903          	lw	s2,32(sp)
    69ac:	01c12983          	lw	s3,28(sp)
    69b0:	01412a83          	lw	s5,20(sp)
    69b4:	01812a03          	lw	s4,24(sp)
    69b8:	01012b03          	lw	s6,16(sp)
    69bc:	00000513          	li	a0,0
    69c0:	03010113          	add	sp,sp,48
    69c4:	00008067          	ret
    69c8:	00040593          	mv	a1,s0
    69cc:	000a0513          	mv	a0,s4
    69d0:	9f9ff0ef          	jal	63c8 <_fflush_r>
    69d4:	0a050e63          	beqz	a0,6a90 <__sfvwrite_r+0x344>
    69d8:	00c41783          	lh	a5,12(s0)
    69dc:	00c12b83          	lw	s7,12(sp)
    69e0:	00812c03          	lw	s8,8(sp)
    69e4:	02412483          	lw	s1,36(sp)
    69e8:	02012903          	lw	s2,32(sp)
    69ec:	01c12983          	lw	s3,28(sp)
    69f0:	01412a83          	lw	s5,20(sp)
    69f4:	0407e793          	or	a5,a5,64
    69f8:	00f41623          	sh	a5,12(s0)
    69fc:	02c12083          	lw	ra,44(sp)
    6a00:	02812403          	lw	s0,40(sp)
    6a04:	01812a03          	lw	s4,24(sp)
    6a08:	01012b03          	lw	s6,16(sp)
    6a0c:	fff00513          	li	a0,-1
    6a10:	03010113          	add	sp,sp,48
    6a14:	00008067          	ret
    6a18:	00000513          	li	a0,0
    6a1c:	00008067          	ret
    6a20:	00000a93          	li	s5,0
    6a24:	00000513          	li	a0,0
    6a28:	00000c13          	li	s8,0
    6a2c:	00000993          	li	s3,0
    6a30:	08098263          	beqz	s3,6ab4 <__sfvwrite_r+0x368>
    6a34:	08050a63          	beqz	a0,6ac8 <__sfvwrite_r+0x37c>
    6a38:	000a8793          	mv	a5,s5
    6a3c:	00098b93          	mv	s7,s3
    6a40:	0137f463          	bgeu	a5,s3,6a48 <__sfvwrite_r+0x2fc>
    6a44:	00078b93          	mv	s7,a5
    6a48:	00042503          	lw	a0,0(s0)
    6a4c:	01042783          	lw	a5,16(s0)
    6a50:	00842903          	lw	s2,8(s0)
    6a54:	01442683          	lw	a3,20(s0)
    6a58:	00a7f663          	bgeu	a5,a0,6a64 <__sfvwrite_r+0x318>
    6a5c:	00d90933          	add	s2,s2,a3
    6a60:	09794463          	blt	s2,s7,6ae8 <__sfvwrite_r+0x39c>
    6a64:	16dbc263          	blt	s7,a3,6bc8 <__sfvwrite_r+0x47c>
    6a68:	02442783          	lw	a5,36(s0)
    6a6c:	01c42583          	lw	a1,28(s0)
    6a70:	000c0613          	mv	a2,s8
    6a74:	000a0513          	mv	a0,s4
    6a78:	000780e7          	jalr	a5
    6a7c:	00050913          	mv	s2,a0
    6a80:	f4a05ce3          	blez	a0,69d8 <__sfvwrite_r+0x28c>
    6a84:	412a8ab3          	sub	s5,s5,s2
    6a88:	00100513          	li	a0,1
    6a8c:	f20a8ee3          	beqz	s5,69c8 <__sfvwrite_r+0x27c>
    6a90:	008b2783          	lw	a5,8(s6)
    6a94:	012c0c33          	add	s8,s8,s2
    6a98:	412989b3          	sub	s3,s3,s2
    6a9c:	412787b3          	sub	a5,a5,s2
    6aa0:	00fb2423          	sw	a5,8(s6)
    6aa4:	f80796e3          	bnez	a5,6a30 <__sfvwrite_r+0x2e4>
    6aa8:	00c12b83          	lw	s7,12(sp)
    6aac:	00812c03          	lw	s8,8(sp)
    6ab0:	eedff06f          	j	699c <__sfvwrite_r+0x250>
    6ab4:	0044a983          	lw	s3,4(s1)
    6ab8:	00048793          	mv	a5,s1
    6abc:	00848493          	add	s1,s1,8
    6ac0:	fe098ae3          	beqz	s3,6ab4 <__sfvwrite_r+0x368>
    6ac4:	0007ac03          	lw	s8,0(a5)
    6ac8:	00098613          	mv	a2,s3
    6acc:	00a00593          	li	a1,10
    6ad0:	000c0513          	mv	a0,s8
    6ad4:	714000ef          	jal	71e8 <memchr>
    6ad8:	14050c63          	beqz	a0,6c30 <__sfvwrite_r+0x4e4>
    6adc:	00150513          	add	a0,a0,1
    6ae0:	41850ab3          	sub	s5,a0,s8
    6ae4:	f55ff06f          	j	6a38 <__sfvwrite_r+0x2ec>
    6ae8:	000c0593          	mv	a1,s8
    6aec:	00090613          	mv	a2,s2
    6af0:	26d000ef          	jal	755c <memmove>
    6af4:	00042783          	lw	a5,0(s0)
    6af8:	00040593          	mv	a1,s0
    6afc:	000a0513          	mv	a0,s4
    6b00:	012787b3          	add	a5,a5,s2
    6b04:	00f42023          	sw	a5,0(s0)
    6b08:	8c1ff0ef          	jal	63c8 <_fflush_r>
    6b0c:	f6050ce3          	beqz	a0,6a84 <__sfvwrite_r+0x338>
    6b10:	ec9ff06f          	j	69d8 <__sfvwrite_r+0x28c>
    6b14:	01042683          	lw	a3,16(s0)
    6b18:	04f6e463          	bltu	a3,a5,6b60 <__sfvwrite_r+0x414>
    6b1c:	01442583          	lw	a1,20(s0)
    6b20:	04b9e063          	bltu	s3,a1,6b60 <__sfvwrite_r+0x414>
    6b24:	00098913          	mv	s2,s3
    6b28:	013af463          	bgeu	s5,s3,6b30 <__sfvwrite_r+0x3e4>
    6b2c:	000a8913          	mv	s2,s5
    6b30:	00090513          	mv	a0,s2
    6b34:	571070ef          	jal	e8a4 <__modsi3>
    6b38:	02442783          	lw	a5,36(s0)
    6b3c:	01c42583          	lw	a1,28(s0)
    6b40:	40a906b3          	sub	a3,s2,a0
    6b44:	000b8613          	mv	a2,s7
    6b48:	000a0513          	mv	a0,s4
    6b4c:	000780e7          	jalr	a5
    6b50:	00050913          	mv	s2,a0
    6b54:	04a05a63          	blez	a0,6ba8 <__sfvwrite_r+0x45c>
    6b58:	412989b3          	sub	s3,s3,s2
    6b5c:	df9ff06f          	j	6954 <__sfvwrite_r+0x208>
    6b60:	00070913          	mv	s2,a4
    6b64:	00e9f463          	bgeu	s3,a4,6b6c <__sfvwrite_r+0x420>
    6b68:	00098913          	mv	s2,s3
    6b6c:	00078513          	mv	a0,a5
    6b70:	00090613          	mv	a2,s2
    6b74:	000b8593          	mv	a1,s7
    6b78:	1e5000ef          	jal	755c <memmove>
    6b7c:	00842703          	lw	a4,8(s0)
    6b80:	00042783          	lw	a5,0(s0)
    6b84:	41270733          	sub	a4,a4,s2
    6b88:	012787b3          	add	a5,a5,s2
    6b8c:	00e42423          	sw	a4,8(s0)
    6b90:	00f42023          	sw	a5,0(s0)
    6b94:	fc0712e3          	bnez	a4,6b58 <__sfvwrite_r+0x40c>
    6b98:	00040593          	mv	a1,s0
    6b9c:	000a0513          	mv	a0,s4
    6ba0:	829ff0ef          	jal	63c8 <_fflush_r>
    6ba4:	fa050ae3          	beqz	a0,6b58 <__sfvwrite_r+0x40c>
    6ba8:	00c41783          	lh	a5,12(s0)
    6bac:	00c12b83          	lw	s7,12(sp)
    6bb0:	00812c03          	lw	s8,8(sp)
    6bb4:	00412c83          	lw	s9,4(sp)
    6bb8:	e2dff06f          	j	69e4 <__sfvwrite_r+0x298>
    6bbc:	00098c13          	mv	s8,s3
    6bc0:	00098c93          	mv	s9,s3
    6bc4:	d65ff06f          	j	6928 <__sfvwrite_r+0x1dc>
    6bc8:	000b8613          	mv	a2,s7
    6bcc:	000c0593          	mv	a1,s8
    6bd0:	18d000ef          	jal	755c <memmove>
    6bd4:	00842703          	lw	a4,8(s0)
    6bd8:	00042783          	lw	a5,0(s0)
    6bdc:	000b8913          	mv	s2,s7
    6be0:	41770733          	sub	a4,a4,s7
    6be4:	017787b3          	add	a5,a5,s7
    6be8:	00e42423          	sw	a4,8(s0)
    6bec:	00f42023          	sw	a5,0(s0)
    6bf0:	e95ff06f          	j	6a84 <__sfvwrite_r+0x338>
    6bf4:	000a0513          	mv	a0,s4
    6bf8:	28c030ef          	jal	9e84 <_realloc_r>
    6bfc:	00050c93          	mv	s9,a0
    6c00:	d00514e3          	bnez	a0,6908 <__sfvwrite_r+0x1bc>
    6c04:	01042583          	lw	a1,16(s0)
    6c08:	000a0513          	mv	a0,s4
    6c0c:	ae8fa0ef          	jal	ef4 <_free_r>
    6c10:	00c41783          	lh	a5,12(s0)
    6c14:	00c00713          	li	a4,12
    6c18:	00c12b83          	lw	s7,12(sp)
    6c1c:	00812c03          	lw	s8,8(sp)
    6c20:	00412c83          	lw	s9,4(sp)
    6c24:	00ea2023          	sw	a4,0(s4)
    6c28:	f7f7f793          	and	a5,a5,-129
    6c2c:	db9ff06f          	j	69e4 <__sfvwrite_r+0x298>
    6c30:	00198793          	add	a5,s3,1
    6c34:	00078a93          	mv	s5,a5
    6c38:	e05ff06f          	j	6a3c <__sfvwrite_r+0x2f0>
    6c3c:	00c41783          	lh	a5,12(s0)
    6c40:	da5ff06f          	j	69e4 <__sfvwrite_r+0x298>
    6c44:	00c00713          	li	a4,12
    6c48:	00c41783          	lh	a5,12(s0)
    6c4c:	00c12b83          	lw	s7,12(sp)
    6c50:	00812c03          	lw	s8,8(sp)
    6c54:	00412c83          	lw	s9,4(sp)
    6c58:	00ea2023          	sw	a4,0(s4)
    6c5c:	d89ff06f          	j	69e4 <__sfvwrite_r+0x298>

00006c60 <_fwalk_sglue>:
    6c60:	fd010113          	add	sp,sp,-48
    6c64:	03212023          	sw	s2,32(sp)
    6c68:	01312e23          	sw	s3,28(sp)
    6c6c:	01412c23          	sw	s4,24(sp)
    6c70:	01512a23          	sw	s5,20(sp)
    6c74:	01612823          	sw	s6,16(sp)
    6c78:	01712623          	sw	s7,12(sp)
    6c7c:	02112623          	sw	ra,44(sp)
    6c80:	02812423          	sw	s0,40(sp)
    6c84:	02912223          	sw	s1,36(sp)
    6c88:	00050b13          	mv	s6,a0
    6c8c:	00058b93          	mv	s7,a1
    6c90:	00060a93          	mv	s5,a2
    6c94:	00000a13          	li	s4,0
    6c98:	00100993          	li	s3,1
    6c9c:	fff00913          	li	s2,-1
    6ca0:	004aa483          	lw	s1,4(s5)
    6ca4:	008aa403          	lw	s0,8(s5)
    6ca8:	fff48493          	add	s1,s1,-1
    6cac:	0204c863          	bltz	s1,6cdc <_fwalk_sglue+0x7c>
    6cb0:	00c45783          	lhu	a5,12(s0)
    6cb4:	00f9fe63          	bgeu	s3,a5,6cd0 <_fwalk_sglue+0x70>
    6cb8:	00e41783          	lh	a5,14(s0)
    6cbc:	00040593          	mv	a1,s0
    6cc0:	000b0513          	mv	a0,s6
    6cc4:	01278663          	beq	a5,s2,6cd0 <_fwalk_sglue+0x70>
    6cc8:	000b80e7          	jalr	s7
    6ccc:	00aa6a33          	or	s4,s4,a0
    6cd0:	fff48493          	add	s1,s1,-1
    6cd4:	06840413          	add	s0,s0,104
    6cd8:	fd249ce3          	bne	s1,s2,6cb0 <_fwalk_sglue+0x50>
    6cdc:	000aaa83          	lw	s5,0(s5)
    6ce0:	fc0a90e3          	bnez	s5,6ca0 <_fwalk_sglue+0x40>
    6ce4:	02c12083          	lw	ra,44(sp)
    6ce8:	02812403          	lw	s0,40(sp)
    6cec:	02412483          	lw	s1,36(sp)
    6cf0:	02012903          	lw	s2,32(sp)
    6cf4:	01c12983          	lw	s3,28(sp)
    6cf8:	01412a83          	lw	s5,20(sp)
    6cfc:	01012b03          	lw	s6,16(sp)
    6d00:	00c12b83          	lw	s7,12(sp)
    6d04:	000a0513          	mv	a0,s4
    6d08:	01812a03          	lw	s4,24(sp)
    6d0c:	03010113          	add	sp,sp,48
    6d10:	00008067          	ret

00006d14 <__sread>:
    6d14:	ff010113          	add	sp,sp,-16
    6d18:	00812423          	sw	s0,8(sp)
    6d1c:	00058413          	mv	s0,a1
    6d20:	00e59583          	lh	a1,14(a1)
    6d24:	00112623          	sw	ra,12(sp)
    6d28:	704000ef          	jal	742c <_read_r>
    6d2c:	02054063          	bltz	a0,6d4c <__sread+0x38>
    6d30:	05042783          	lw	a5,80(s0)
    6d34:	00c12083          	lw	ra,12(sp)
    6d38:	00a787b3          	add	a5,a5,a0
    6d3c:	04f42823          	sw	a5,80(s0)
    6d40:	00812403          	lw	s0,8(sp)
    6d44:	01010113          	add	sp,sp,16
    6d48:	00008067          	ret
    6d4c:	00c45783          	lhu	a5,12(s0)
    6d50:	fffff737          	lui	a4,0xfffff
    6d54:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    6d58:	00e7f7b3          	and	a5,a5,a4
    6d5c:	00c12083          	lw	ra,12(sp)
    6d60:	00f41623          	sh	a5,12(s0)
    6d64:	00812403          	lw	s0,8(sp)
    6d68:	01010113          	add	sp,sp,16
    6d6c:	00008067          	ret

00006d70 <__swrite>:
    6d70:	00c59783          	lh	a5,12(a1)
    6d74:	fe010113          	add	sp,sp,-32
    6d78:	00812c23          	sw	s0,24(sp)
    6d7c:	00912a23          	sw	s1,20(sp)
    6d80:	01212823          	sw	s2,16(sp)
    6d84:	01312623          	sw	s3,12(sp)
    6d88:	00112e23          	sw	ra,28(sp)
    6d8c:	1007f713          	and	a4,a5,256
    6d90:	00058413          	mv	s0,a1
    6d94:	00050493          	mv	s1,a0
    6d98:	00060913          	mv	s2,a2
    6d9c:	00068993          	mv	s3,a3
    6da0:	04071063          	bnez	a4,6de0 <__swrite+0x70>
    6da4:	fffff737          	lui	a4,0xfffff
    6da8:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    6dac:	00e7f7b3          	and	a5,a5,a4
    6db0:	00e41583          	lh	a1,14(s0)
    6db4:	00f41623          	sh	a5,12(s0)
    6db8:	01812403          	lw	s0,24(sp)
    6dbc:	01c12083          	lw	ra,28(sp)
    6dc0:	00098693          	mv	a3,s3
    6dc4:	00090613          	mv	a2,s2
    6dc8:	00c12983          	lw	s3,12(sp)
    6dcc:	01012903          	lw	s2,16(sp)
    6dd0:	00048513          	mv	a0,s1
    6dd4:	01412483          	lw	s1,20(sp)
    6dd8:	02010113          	add	sp,sp,32
    6ddc:	70c0006f          	j	74e8 <_write_r>
    6de0:	00e59583          	lh	a1,14(a1)
    6de4:	00200693          	li	a3,2
    6de8:	00000613          	li	a2,0
    6dec:	5dc000ef          	jal	73c8 <_lseek_r>
    6df0:	00c41783          	lh	a5,12(s0)
    6df4:	fb1ff06f          	j	6da4 <__swrite+0x34>

00006df8 <__sseek>:
    6df8:	ff010113          	add	sp,sp,-16
    6dfc:	00812423          	sw	s0,8(sp)
    6e00:	00058413          	mv	s0,a1
    6e04:	00e59583          	lh	a1,14(a1)
    6e08:	00112623          	sw	ra,12(sp)
    6e0c:	5bc000ef          	jal	73c8 <_lseek_r>
    6e10:	fff00793          	li	a5,-1
    6e14:	02f50863          	beq	a0,a5,6e44 <__sseek+0x4c>
    6e18:	00c45783          	lhu	a5,12(s0)
    6e1c:	00001737          	lui	a4,0x1
    6e20:	00c12083          	lw	ra,12(sp)
    6e24:	00e7e7b3          	or	a5,a5,a4
    6e28:	01079793          	sll	a5,a5,0x10
    6e2c:	4107d793          	sra	a5,a5,0x10
    6e30:	04a42823          	sw	a0,80(s0)
    6e34:	00f41623          	sh	a5,12(s0)
    6e38:	00812403          	lw	s0,8(sp)
    6e3c:	01010113          	add	sp,sp,16
    6e40:	00008067          	ret
    6e44:	00c45783          	lhu	a5,12(s0)
    6e48:	fffff737          	lui	a4,0xfffff
    6e4c:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    6e50:	00e7f7b3          	and	a5,a5,a4
    6e54:	01079793          	sll	a5,a5,0x10
    6e58:	4107d793          	sra	a5,a5,0x10
    6e5c:	00c12083          	lw	ra,12(sp)
    6e60:	00f41623          	sh	a5,12(s0)
    6e64:	00812403          	lw	s0,8(sp)
    6e68:	01010113          	add	sp,sp,16
    6e6c:	00008067          	ret

00006e70 <__sclose>:
    6e70:	00e59583          	lh	a1,14(a1)
    6e74:	4fc0006f          	j	7370 <_close_r>

00006e78 <__swsetup_r>:
    6e78:	ff010113          	add	sp,sp,-16
    6e7c:	00812423          	sw	s0,8(sp)
    6e80:	00912223          	sw	s1,4(sp)
    6e84:	00112623          	sw	ra,12(sp)
    6e88:	7fffa797          	auipc	a5,0x7fffa
    6e8c:	8807a783          	lw	a5,-1920(a5) # 80000708 <_impure_ptr>
    6e90:	00050493          	mv	s1,a0
    6e94:	00058413          	mv	s0,a1
    6e98:	00078663          	beqz	a5,6ea4 <__swsetup_r+0x2c>
    6e9c:	0347a703          	lw	a4,52(a5)
    6ea0:	0e070c63          	beqz	a4,6f98 <__swsetup_r+0x120>
    6ea4:	00c41783          	lh	a5,12(s0)
    6ea8:	0087f713          	and	a4,a5,8
    6eac:	06070a63          	beqz	a4,6f20 <__swsetup_r+0xa8>
    6eb0:	01042703          	lw	a4,16(s0)
    6eb4:	08070663          	beqz	a4,6f40 <__swsetup_r+0xc8>
    6eb8:	0017f693          	and	a3,a5,1
    6ebc:	02068863          	beqz	a3,6eec <__swsetup_r+0x74>
    6ec0:	01442683          	lw	a3,20(s0)
    6ec4:	00042423          	sw	zero,8(s0)
    6ec8:	00000513          	li	a0,0
    6ecc:	40d006b3          	neg	a3,a3
    6ed0:	00d42c23          	sw	a3,24(s0)
    6ed4:	02070a63          	beqz	a4,6f08 <__swsetup_r+0x90>
    6ed8:	00c12083          	lw	ra,12(sp)
    6edc:	00812403          	lw	s0,8(sp)
    6ee0:	00412483          	lw	s1,4(sp)
    6ee4:	01010113          	add	sp,sp,16
    6ee8:	00008067          	ret
    6eec:	0027f693          	and	a3,a5,2
    6ef0:	00000613          	li	a2,0
    6ef4:	00069463          	bnez	a3,6efc <__swsetup_r+0x84>
    6ef8:	01442603          	lw	a2,20(s0)
    6efc:	00c42423          	sw	a2,8(s0)
    6f00:	00000513          	li	a0,0
    6f04:	fc071ae3          	bnez	a4,6ed8 <__swsetup_r+0x60>
    6f08:	0807f713          	and	a4,a5,128
    6f0c:	fc0706e3          	beqz	a4,6ed8 <__swsetup_r+0x60>
    6f10:	0407e793          	or	a5,a5,64
    6f14:	00f41623          	sh	a5,12(s0)
    6f18:	fff00513          	li	a0,-1
    6f1c:	fbdff06f          	j	6ed8 <__swsetup_r+0x60>
    6f20:	0107f713          	and	a4,a5,16
    6f24:	08070063          	beqz	a4,6fa4 <__swsetup_r+0x12c>
    6f28:	0047f713          	and	a4,a5,4
    6f2c:	02071c63          	bnez	a4,6f64 <__swsetup_r+0xec>
    6f30:	01042703          	lw	a4,16(s0)
    6f34:	0087e793          	or	a5,a5,8
    6f38:	00f41623          	sh	a5,12(s0)
    6f3c:	f6071ee3          	bnez	a4,6eb8 <__swsetup_r+0x40>
    6f40:	2807f693          	and	a3,a5,640
    6f44:	20000613          	li	a2,512
    6f48:	f6c688e3          	beq	a3,a2,6eb8 <__swsetup_r+0x40>
    6f4c:	00040593          	mv	a1,s0
    6f50:	00048513          	mv	a0,s1
    6f54:	6dc030ef          	jal	a630 <__smakebuf_r>
    6f58:	00c41783          	lh	a5,12(s0)
    6f5c:	01042703          	lw	a4,16(s0)
    6f60:	f59ff06f          	j	6eb8 <__swsetup_r+0x40>
    6f64:	03042583          	lw	a1,48(s0)
    6f68:	00058e63          	beqz	a1,6f84 <__swsetup_r+0x10c>
    6f6c:	04040713          	add	a4,s0,64
    6f70:	00e58863          	beq	a1,a4,6f80 <__swsetup_r+0x108>
    6f74:	00048513          	mv	a0,s1
    6f78:	f7df90ef          	jal	ef4 <_free_r>
    6f7c:	00c41783          	lh	a5,12(s0)
    6f80:	02042823          	sw	zero,48(s0)
    6f84:	01042703          	lw	a4,16(s0)
    6f88:	fdb7f793          	and	a5,a5,-37
    6f8c:	00042223          	sw	zero,4(s0)
    6f90:	00e42023          	sw	a4,0(s0)
    6f94:	fa1ff06f          	j	6f34 <__swsetup_r+0xbc>
    6f98:	00078513          	mv	a0,a5
    6f9c:	f28ff0ef          	jal	66c4 <__sinit>
    6fa0:	f05ff06f          	j	6ea4 <__swsetup_r+0x2c>
    6fa4:	00900713          	li	a4,9
    6fa8:	00e4a023          	sw	a4,0(s1)
    6fac:	0407e793          	or	a5,a5,64
    6fb0:	00f41623          	sh	a5,12(s0)
    6fb4:	fff00513          	li	a0,-1
    6fb8:	f21ff06f          	j	6ed8 <__swsetup_r+0x60>

00006fbc <__fputwc>:
    6fbc:	fc010113          	add	sp,sp,-64
    6fc0:	02812c23          	sw	s0,56(sp)
    6fc4:	03412423          	sw	s4,40(sp)
    6fc8:	03512223          	sw	s5,36(sp)
    6fcc:	02112e23          	sw	ra,60(sp)
    6fd0:	02912a23          	sw	s1,52(sp)
    6fd4:	03312623          	sw	s3,44(sp)
    6fd8:	00050a13          	mv	s4,a0
    6fdc:	00058a93          	mv	s5,a1
    6fe0:	00060413          	mv	s0,a2
    6fe4:	374000ef          	jal	7358 <__locale_mb_cur_max>
    6fe8:	00100793          	li	a5,1
    6fec:	02f51663          	bne	a0,a5,7018 <__fputwc+0x5c>
    6ff0:	fffa8793          	add	a5,s5,-1
    6ff4:	0fe00713          	li	a4,254
    6ff8:	02f76063          	bltu	a4,a5,7018 <__fputwc+0x5c>
    6ffc:	03212823          	sw	s2,48(sp)
    7000:	03612023          	sw	s6,32(sp)
    7004:	01712e23          	sw	s7,28(sp)
    7008:	01510423          	sb	s5,8(sp)
    700c:	00100993          	li	s3,1
    7010:	00810493          	add	s1,sp,8
    7014:	0380006f          	j	704c <__fputwc+0x90>
    7018:	00810493          	add	s1,sp,8
    701c:	05c40693          	add	a3,s0,92
    7020:	000a8613          	mv	a2,s5
    7024:	00048593          	mv	a1,s1
    7028:	000a0513          	mv	a0,s4
    702c:	3f8030ef          	jal	a424 <_wcrtomb_r>
    7030:	fff00793          	li	a5,-1
    7034:	00050993          	mv	s3,a0
    7038:	0cf50a63          	beq	a0,a5,710c <__fputwc+0x150>
    703c:	0a050663          	beqz	a0,70e8 <__fputwc+0x12c>
    7040:	03212823          	sw	s2,48(sp)
    7044:	03612023          	sw	s6,32(sp)
    7048:	01712e23          	sw	s7,28(sp)
    704c:	00000913          	li	s2,0
    7050:	fff00b13          	li	s6,-1
    7054:	00a00b93          	li	s7,10
    7058:	0200006f          	j	7078 <__fputwc+0xbc>
    705c:	00042783          	lw	a5,0(s0)
    7060:	00178693          	add	a3,a5,1
    7064:	00d42023          	sw	a3,0(s0)
    7068:	00e78023          	sb	a4,0(a5)
    706c:	00190913          	add	s2,s2,1
    7070:	00148493          	add	s1,s1,1
    7074:	07397463          	bgeu	s2,s3,70dc <__fputwc+0x120>
    7078:	00842783          	lw	a5,8(s0)
    707c:	0004c703          	lbu	a4,0(s1)
    7080:	fff78793          	add	a5,a5,-1
    7084:	00f42423          	sw	a5,8(s0)
    7088:	fc07dae3          	bgez	a5,705c <__fputwc+0xa0>
    708c:	01842683          	lw	a3,24(s0)
    7090:	00040613          	mv	a2,s0
    7094:	00070593          	mv	a1,a4
    7098:	000a0513          	mv	a0,s4
    709c:	00d7c463          	blt	a5,a3,70a4 <__fputwc+0xe8>
    70a0:	fb771ee3          	bne	a4,s7,705c <__fputwc+0xa0>
    70a4:	724030ef          	jal	a7c8 <__swbuf_r>
    70a8:	fd6512e3          	bne	a0,s6,706c <__fputwc+0xb0>
    70ac:	03012903          	lw	s2,48(sp)
    70b0:	02012b03          	lw	s6,32(sp)
    70b4:	01c12b83          	lw	s7,28(sp)
    70b8:	03c12083          	lw	ra,60(sp)
    70bc:	03812403          	lw	s0,56(sp)
    70c0:	03412483          	lw	s1,52(sp)
    70c4:	02c12983          	lw	s3,44(sp)
    70c8:	02812a03          	lw	s4,40(sp)
    70cc:	02412a83          	lw	s5,36(sp)
    70d0:	fff00513          	li	a0,-1
    70d4:	04010113          	add	sp,sp,64
    70d8:	00008067          	ret
    70dc:	03012903          	lw	s2,48(sp)
    70e0:	02012b03          	lw	s6,32(sp)
    70e4:	01c12b83          	lw	s7,28(sp)
    70e8:	03c12083          	lw	ra,60(sp)
    70ec:	03812403          	lw	s0,56(sp)
    70f0:	03412483          	lw	s1,52(sp)
    70f4:	02c12983          	lw	s3,44(sp)
    70f8:	02812a03          	lw	s4,40(sp)
    70fc:	000a8513          	mv	a0,s5
    7100:	02412a83          	lw	s5,36(sp)
    7104:	04010113          	add	sp,sp,64
    7108:	00008067          	ret
    710c:	00c45783          	lhu	a5,12(s0)
    7110:	0407e793          	or	a5,a5,64
    7114:	00f41623          	sh	a5,12(s0)
    7118:	fa1ff06f          	j	70b8 <__fputwc+0xfc>

0000711c <_fputwc_r>:
    711c:	06462783          	lw	a5,100(a2)
    7120:	fe010113          	add	sp,sp,-32
    7124:	00812c23          	sw	s0,24(sp)
    7128:	00912a23          	sw	s1,20(sp)
    712c:	0017f713          	and	a4,a5,1
    7130:	00112e23          	sw	ra,28(sp)
    7134:	00c61783          	lh	a5,12(a2)
    7138:	00060413          	mv	s0,a2
    713c:	00050493          	mv	s1,a0
    7140:	00071663          	bnez	a4,714c <_fputwc_r+0x30>
    7144:	2007f713          	and	a4,a5,512
    7148:	08070463          	beqz	a4,71d0 <_fputwc_r+0xb4>
    714c:	01279713          	sll	a4,a5,0x12
    7150:	02074063          	bltz	a4,7170 <_fputwc_r+0x54>
    7154:	06442703          	lw	a4,100(s0)
    7158:	000026b7          	lui	a3,0x2
    715c:	00d7e7b3          	or	a5,a5,a3
    7160:	000026b7          	lui	a3,0x2
    7164:	00d76733          	or	a4,a4,a3
    7168:	00f41623          	sh	a5,12(s0)
    716c:	06e42223          	sw	a4,100(s0)
    7170:	00048513          	mv	a0,s1
    7174:	00040613          	mv	a2,s0
    7178:	e45ff0ef          	jal	6fbc <__fputwc>
    717c:	06442783          	lw	a5,100(s0)
    7180:	00050493          	mv	s1,a0
    7184:	0017f793          	and	a5,a5,1
    7188:	00079863          	bnez	a5,7198 <_fputwc_r+0x7c>
    718c:	00c45783          	lhu	a5,12(s0)
    7190:	2007f793          	and	a5,a5,512
    7194:	00078e63          	beqz	a5,71b0 <_fputwc_r+0x94>
    7198:	01c12083          	lw	ra,28(sp)
    719c:	01812403          	lw	s0,24(sp)
    71a0:	00048513          	mv	a0,s1
    71a4:	01412483          	lw	s1,20(sp)
    71a8:	02010113          	add	sp,sp,32
    71ac:	00008067          	ret
    71b0:	05842503          	lw	a0,88(s0)
    71b4:	3a4000ef          	jal	7558 <__retarget_lock_release_recursive>
    71b8:	01c12083          	lw	ra,28(sp)
    71bc:	01812403          	lw	s0,24(sp)
    71c0:	00048513          	mv	a0,s1
    71c4:	01412483          	lw	s1,20(sp)
    71c8:	02010113          	add	sp,sp,32
    71cc:	00008067          	ret
    71d0:	05862503          	lw	a0,88(a2)
    71d4:	00b12623          	sw	a1,12(sp)
    71d8:	37c000ef          	jal	7554 <__retarget_lock_acquire_recursive>
    71dc:	00c41783          	lh	a5,12(s0)
    71e0:	00c12583          	lw	a1,12(sp)
    71e4:	f69ff06f          	j	714c <_fputwc_r+0x30>

000071e8 <memchr>:
    71e8:	00357793          	and	a5,a0,3
    71ec:	0ff5f693          	zext.b	a3,a1
    71f0:	02078a63          	beqz	a5,7224 <memchr+0x3c>
    71f4:	fff60793          	add	a5,a2,-1
    71f8:	02060e63          	beqz	a2,7234 <memchr+0x4c>
    71fc:	fff00613          	li	a2,-1
    7200:	0180006f          	j	7218 <memchr+0x30>
    7204:	00150513          	add	a0,a0,1
    7208:	00357713          	and	a4,a0,3
    720c:	00070e63          	beqz	a4,7228 <memchr+0x40>
    7210:	fff78793          	add	a5,a5,-1
    7214:	02c78063          	beq	a5,a2,7234 <memchr+0x4c>
    7218:	00054703          	lbu	a4,0(a0)
    721c:	fed714e3          	bne	a4,a3,7204 <memchr+0x1c>
    7220:	00008067          	ret
    7224:	00060793          	mv	a5,a2
    7228:	00300713          	li	a4,3
    722c:	00f76863          	bltu	a4,a5,723c <memchr+0x54>
    7230:	06079063          	bnez	a5,7290 <memchr+0xa8>
    7234:	00000513          	li	a0,0
    7238:	00008067          	ret
    723c:	0ff5f593          	zext.b	a1,a1
    7240:	00859713          	sll	a4,a1,0x8
    7244:	00b705b3          	add	a1,a4,a1
    7248:	01059713          	sll	a4,a1,0x10
    724c:	feff08b7          	lui	a7,0xfeff0
    7250:	80808837          	lui	a6,0x80808
    7254:	00e585b3          	add	a1,a1,a4
    7258:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    725c:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7260:	00300313          	li	t1,3
    7264:	0100006f          	j	7274 <memchr+0x8c>
    7268:	ffc78793          	add	a5,a5,-4
    726c:	00450513          	add	a0,a0,4
    7270:	fcf370e3          	bgeu	t1,a5,7230 <memchr+0x48>
    7274:	00052703          	lw	a4,0(a0)
    7278:	00e5c733          	xor	a4,a1,a4
    727c:	01170633          	add	a2,a4,a7
    7280:	fff74713          	not	a4,a4
    7284:	00e67733          	and	a4,a2,a4
    7288:	01077733          	and	a4,a4,a6
    728c:	fc070ee3          	beqz	a4,7268 <memchr+0x80>
    7290:	00f507b3          	add	a5,a0,a5
    7294:	00c0006f          	j	72a0 <memchr+0xb8>
    7298:	00150513          	add	a0,a0,1
    729c:	f8f50ce3          	beq	a0,a5,7234 <memchr+0x4c>
    72a0:	00054703          	lbu	a4,0(a0)
    72a4:	fed71ae3          	bne	a4,a3,7298 <memchr+0xb0>
    72a8:	00008067          	ret

000072ac <strncpy>:
    72ac:	00a5e7b3          	or	a5,a1,a0
    72b0:	0037f793          	and	a5,a5,3
    72b4:	00079663          	bnez	a5,72c0 <strncpy+0x14>
    72b8:	00300793          	li	a5,3
    72bc:	04c7e663          	bltu	a5,a2,7308 <strncpy+0x5c>
    72c0:	00050713          	mv	a4,a0
    72c4:	01c0006f          	j	72e0 <strncpy+0x34>
    72c8:	fff5c683          	lbu	a3,-1(a1)
    72cc:	fff60813          	add	a6,a2,-1
    72d0:	fed78fa3          	sb	a3,-1(a5)
    72d4:	00068e63          	beqz	a3,72f0 <strncpy+0x44>
    72d8:	00078713          	mv	a4,a5
    72dc:	00080613          	mv	a2,a6
    72e0:	00158593          	add	a1,a1,1
    72e4:	00170793          	add	a5,a4,1
    72e8:	fe0610e3          	bnez	a2,72c8 <strncpy+0x1c>
    72ec:	00008067          	ret
    72f0:	00c70733          	add	a4,a4,a2
    72f4:	06080063          	beqz	a6,7354 <strncpy+0xa8>
    72f8:	00178793          	add	a5,a5,1
    72fc:	fe078fa3          	sb	zero,-1(a5)
    7300:	fee79ce3          	bne	a5,a4,72f8 <strncpy+0x4c>
    7304:	00008067          	ret
    7308:	feff0337          	lui	t1,0xfeff0
    730c:	808088b7          	lui	a7,0x80808
    7310:	00050713          	mv	a4,a0
    7314:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7318:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    731c:	00300e13          	li	t3,3
    7320:	0180006f          	j	7338 <strncpy+0x8c>
    7324:	00d72023          	sw	a3,0(a4)
    7328:	ffc60613          	add	a2,a2,-4
    732c:	00470713          	add	a4,a4,4
    7330:	00458593          	add	a1,a1,4
    7334:	face76e3          	bgeu	t3,a2,72e0 <strncpy+0x34>
    7338:	0005a683          	lw	a3,0(a1)
    733c:	006687b3          	add	a5,a3,t1
    7340:	fff6c813          	not	a6,a3
    7344:	0107f7b3          	and	a5,a5,a6
    7348:	0117f7b3          	and	a5,a5,a7
    734c:	fc078ce3          	beqz	a5,7324 <strncpy+0x78>
    7350:	f91ff06f          	j	72e0 <strncpy+0x34>
    7354:	00008067          	ret

00007358 <__locale_mb_cur_max>:
    7358:	7fff9517          	auipc	a0,0x7fff9
    735c:	30454503          	lbu	a0,772(a0) # 8000065c <__global_locale+0x128>
    7360:	00008067          	ret

00007364 <_localeconv_r>:
    7364:	7fff9517          	auipc	a0,0x7fff9
    7368:	2c050513          	add	a0,a0,704 # 80000624 <__global_locale+0xf0>
    736c:	00008067          	ret

00007370 <_close_r>:
    7370:	ff010113          	add	sp,sp,-16
    7374:	00812423          	sw	s0,8(sp)
    7378:	00050413          	mv	s0,a0
    737c:	00058513          	mv	a0,a1
    7380:	7fff9797          	auipc	a5,0x7fff9
    7384:	3807ac23          	sw	zero,920(a5) # 80000718 <errno>
    7388:	00112623          	sw	ra,12(sp)
    738c:	c4cf90ef          	jal	7d8 <_close>
    7390:	fff00793          	li	a5,-1
    7394:	00f50a63          	beq	a0,a5,73a8 <_close_r+0x38>
    7398:	00c12083          	lw	ra,12(sp)
    739c:	00812403          	lw	s0,8(sp)
    73a0:	01010113          	add	sp,sp,16
    73a4:	00008067          	ret
    73a8:	7fff9797          	auipc	a5,0x7fff9
    73ac:	3707a783          	lw	a5,880(a5) # 80000718 <errno>
    73b0:	fe0784e3          	beqz	a5,7398 <_close_r+0x28>
    73b4:	00c12083          	lw	ra,12(sp)
    73b8:	00f42023          	sw	a5,0(s0)
    73bc:	00812403          	lw	s0,8(sp)
    73c0:	01010113          	add	sp,sp,16
    73c4:	00008067          	ret

000073c8 <_lseek_r>:
    73c8:	ff010113          	add	sp,sp,-16
    73cc:	00058713          	mv	a4,a1
    73d0:	00812423          	sw	s0,8(sp)
    73d4:	00060593          	mv	a1,a2
    73d8:	00050413          	mv	s0,a0
    73dc:	00068613          	mv	a2,a3
    73e0:	00070513          	mv	a0,a4
    73e4:	7fff9797          	auipc	a5,0x7fff9
    73e8:	3207aa23          	sw	zero,820(a5) # 80000718 <errno>
    73ec:	00112623          	sw	ra,12(sp)
    73f0:	c24f90ef          	jal	814 <_lseek>
    73f4:	fff00793          	li	a5,-1
    73f8:	00f50a63          	beq	a0,a5,740c <_lseek_r+0x44>
    73fc:	00c12083          	lw	ra,12(sp)
    7400:	00812403          	lw	s0,8(sp)
    7404:	01010113          	add	sp,sp,16
    7408:	00008067          	ret
    740c:	7fff9797          	auipc	a5,0x7fff9
    7410:	30c7a783          	lw	a5,780(a5) # 80000718 <errno>
    7414:	fe0784e3          	beqz	a5,73fc <_lseek_r+0x34>
    7418:	00c12083          	lw	ra,12(sp)
    741c:	00f42023          	sw	a5,0(s0)
    7420:	00812403          	lw	s0,8(sp)
    7424:	01010113          	add	sp,sp,16
    7428:	00008067          	ret

0000742c <_read_r>:
    742c:	ff010113          	add	sp,sp,-16
    7430:	00058713          	mv	a4,a1
    7434:	00812423          	sw	s0,8(sp)
    7438:	00060593          	mv	a1,a2
    743c:	00050413          	mv	s0,a0
    7440:	00068613          	mv	a2,a3
    7444:	00070513          	mv	a0,a4
    7448:	7fff9797          	auipc	a5,0x7fff9
    744c:	2c07a823          	sw	zero,720(a5) # 80000718 <errno>
    7450:	00112623          	sw	ra,12(sp)
    7454:	bc8f90ef          	jal	81c <_read>
    7458:	fff00793          	li	a5,-1
    745c:	00f50a63          	beq	a0,a5,7470 <_read_r+0x44>
    7460:	00c12083          	lw	ra,12(sp)
    7464:	00812403          	lw	s0,8(sp)
    7468:	01010113          	add	sp,sp,16
    746c:	00008067          	ret
    7470:	7fff9797          	auipc	a5,0x7fff9
    7474:	2a87a783          	lw	a5,680(a5) # 80000718 <errno>
    7478:	fe0784e3          	beqz	a5,7460 <_read_r+0x34>
    747c:	00c12083          	lw	ra,12(sp)
    7480:	00f42023          	sw	a5,0(s0)
    7484:	00812403          	lw	s0,8(sp)
    7488:	01010113          	add	sp,sp,16
    748c:	00008067          	ret

00007490 <_sbrk_r>:
    7490:	ff010113          	add	sp,sp,-16
    7494:	00812423          	sw	s0,8(sp)
    7498:	00050413          	mv	s0,a0
    749c:	00058513          	mv	a0,a1
    74a0:	7fff9797          	auipc	a5,0x7fff9
    74a4:	2607ac23          	sw	zero,632(a5) # 80000718 <errno>
    74a8:	00112623          	sw	ra,12(sp)
    74ac:	cf0f90ef          	jal	99c <_sbrk>
    74b0:	fff00793          	li	a5,-1
    74b4:	00f50a63          	beq	a0,a5,74c8 <_sbrk_r+0x38>
    74b8:	00c12083          	lw	ra,12(sp)
    74bc:	00812403          	lw	s0,8(sp)
    74c0:	01010113          	add	sp,sp,16
    74c4:	00008067          	ret
    74c8:	7fff9797          	auipc	a5,0x7fff9
    74cc:	2507a783          	lw	a5,592(a5) # 80000718 <errno>
    74d0:	fe0784e3          	beqz	a5,74b8 <_sbrk_r+0x28>
    74d4:	00c12083          	lw	ra,12(sp)
    74d8:	00f42023          	sw	a5,0(s0)
    74dc:	00812403          	lw	s0,8(sp)
    74e0:	01010113          	add	sp,sp,16
    74e4:	00008067          	ret

000074e8 <_write_r>:
    74e8:	ff010113          	add	sp,sp,-16
    74ec:	00058713          	mv	a4,a1
    74f0:	00812423          	sw	s0,8(sp)
    74f4:	00060593          	mv	a1,a2
    74f8:	00050413          	mv	s0,a0
    74fc:	00068613          	mv	a2,a3
    7500:	00070513          	mv	a0,a4
    7504:	7fff9797          	auipc	a5,0x7fff9
    7508:	2007aa23          	sw	zero,532(a5) # 80000718 <errno>
    750c:	00112623          	sw	ra,12(sp)
    7510:	be8f90ef          	jal	8f8 <_write>
    7514:	fff00793          	li	a5,-1
    7518:	00f50a63          	beq	a0,a5,752c <_write_r+0x44>
    751c:	00c12083          	lw	ra,12(sp)
    7520:	00812403          	lw	s0,8(sp)
    7524:	01010113          	add	sp,sp,16
    7528:	00008067          	ret
    752c:	7fff9797          	auipc	a5,0x7fff9
    7530:	1ec7a783          	lw	a5,492(a5) # 80000718 <errno>
    7534:	fe0784e3          	beqz	a5,751c <_write_r+0x34>
    7538:	00c12083          	lw	ra,12(sp)
    753c:	00f42023          	sw	a5,0(s0)
    7540:	00812403          	lw	s0,8(sp)
    7544:	01010113          	add	sp,sp,16
    7548:	00008067          	ret

0000754c <__retarget_lock_init_recursive>:
    754c:	00008067          	ret

00007550 <__retarget_lock_close_recursive>:
    7550:	00008067          	ret

00007554 <__retarget_lock_acquire_recursive>:
    7554:	00008067          	ret

00007558 <__retarget_lock_release_recursive>:
    7558:	00008067          	ret

0000755c <memmove>:
    755c:	02a5f663          	bgeu	a1,a0,7588 <memmove+0x2c>
    7560:	00c58733          	add	a4,a1,a2
    7564:	02e57263          	bgeu	a0,a4,7588 <memmove+0x2c>
    7568:	00c507b3          	add	a5,a0,a2
    756c:	04060663          	beqz	a2,75b8 <memmove+0x5c>
    7570:	fff74683          	lbu	a3,-1(a4)
    7574:	fff78793          	add	a5,a5,-1
    7578:	fff70713          	add	a4,a4,-1
    757c:	00d78023          	sb	a3,0(a5)
    7580:	fef518e3          	bne	a0,a5,7570 <memmove+0x14>
    7584:	00008067          	ret
    7588:	00f00793          	li	a5,15
    758c:	02c7e863          	bltu	a5,a2,75bc <memmove+0x60>
    7590:	00050793          	mv	a5,a0
    7594:	fff60693          	add	a3,a2,-1
    7598:	0c060263          	beqz	a2,765c <memmove+0x100>
    759c:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x609>
    75a0:	00d786b3          	add	a3,a5,a3
    75a4:	0005c703          	lbu	a4,0(a1)
    75a8:	00178793          	add	a5,a5,1
    75ac:	00158593          	add	a1,a1,1
    75b0:	fee78fa3          	sb	a4,-1(a5)
    75b4:	fed798e3          	bne	a5,a3,75a4 <memmove+0x48>
    75b8:	00008067          	ret
    75bc:	00b567b3          	or	a5,a0,a1
    75c0:	0037f793          	and	a5,a5,3
    75c4:	08079663          	bnez	a5,7650 <memmove+0xf4>
    75c8:	ff060893          	add	a7,a2,-16
    75cc:	ff08f893          	and	a7,a7,-16
    75d0:	01088893          	add	a7,a7,16
    75d4:	011506b3          	add	a3,a0,a7
    75d8:	00058713          	mv	a4,a1
    75dc:	00050793          	mv	a5,a0
    75e0:	00072803          	lw	a6,0(a4)
    75e4:	01070713          	add	a4,a4,16
    75e8:	01078793          	add	a5,a5,16
    75ec:	ff07a823          	sw	a6,-16(a5)
    75f0:	ff472803          	lw	a6,-12(a4)
    75f4:	ff07aa23          	sw	a6,-12(a5)
    75f8:	ff872803          	lw	a6,-8(a4)
    75fc:	ff07ac23          	sw	a6,-8(a5)
    7600:	ffc72803          	lw	a6,-4(a4)
    7604:	ff07ae23          	sw	a6,-4(a5)
    7608:	fcd79ce3          	bne	a5,a3,75e0 <memmove+0x84>
    760c:	00c67813          	and	a6,a2,12
    7610:	011585b3          	add	a1,a1,a7
    7614:	00f67713          	and	a4,a2,15
    7618:	04080463          	beqz	a6,7660 <memmove+0x104>
    761c:	ffc70813          	add	a6,a4,-4
    7620:	ffc87813          	and	a6,a6,-4
    7624:	00480813          	add	a6,a6,4
    7628:	010687b3          	add	a5,a3,a6
    762c:	00058713          	mv	a4,a1
    7630:	00072883          	lw	a7,0(a4)
    7634:	00468693          	add	a3,a3,4
    7638:	00470713          	add	a4,a4,4
    763c:	ff16ae23          	sw	a7,-4(a3)
    7640:	fef698e3          	bne	a3,a5,7630 <memmove+0xd4>
    7644:	00367613          	and	a2,a2,3
    7648:	010585b3          	add	a1,a1,a6
    764c:	f49ff06f          	j	7594 <memmove+0x38>
    7650:	fff60693          	add	a3,a2,-1
    7654:	00050793          	mv	a5,a0
    7658:	f45ff06f          	j	759c <memmove+0x40>
    765c:	00008067          	ret
    7660:	00070613          	mv	a2,a4
    7664:	f31ff06f          	j	7594 <memmove+0x38>

00007668 <frexp>:
    7668:	ff010113          	add	sp,sp,-16
    766c:	00912223          	sw	s1,4(sp)
    7670:	800004b7          	lui	s1,0x80000
    7674:	00812423          	sw	s0,8(sp)
    7678:	00112623          	sw	ra,12(sp)
    767c:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7680:	00060413          	mv	s0,a2
    7684:	00062023          	sw	zero,0(a2)
    7688:	00b4f6b3          	and	a3,s1,a1
    768c:	7ff00637          	lui	a2,0x7ff00
    7690:	00058793          	mv	a5,a1
    7694:	00050713          	mv	a4,a0
    7698:	04c6f063          	bgeu	a3,a2,76d8 <frexp+0x70>
    769c:	00a6e633          	or	a2,a3,a0
    76a0:	02060c63          	beqz	a2,76d8 <frexp+0x70>
    76a4:	0145d613          	srl	a2,a1,0x14
    76a8:	7ff67613          	and	a2,a2,2047
    76ac:	04060463          	beqz	a2,76f4 <frexp+0x8c>
    76b0:	00000593          	li	a1,0
    76b4:	80100637          	lui	a2,0x80100
    76b8:	4146d693          	sra	a3,a3,0x14
    76bc:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    76c0:	c0268693          	add	a3,a3,-1022
    76c4:	00c7f7b3          	and	a5,a5,a2
    76c8:	00b686b3          	add	a3,a3,a1
    76cc:	3fe00637          	lui	a2,0x3fe00
    76d0:	00c7e7b3          	or	a5,a5,a2
    76d4:	00d42023          	sw	a3,0(s0)
    76d8:	00c12083          	lw	ra,12(sp)
    76dc:	00812403          	lw	s0,8(sp)
    76e0:	00412483          	lw	s1,4(sp)
    76e4:	00070513          	mv	a0,a4
    76e8:	00078593          	mv	a1,a5
    76ec:	01010113          	add	sp,sp,16
    76f0:	00008067          	ret
    76f4:	7fff9797          	auipc	a5,0x7fff9
    76f8:	fcc78793          	add	a5,a5,-52 # 800006c0 <__global_locale+0x18c>
    76fc:	0047a683          	lw	a3,4(a5)
    7700:	0007a603          	lw	a2,0(a5)
    7704:	199050ef          	jal	d09c <__muldf3>
    7708:	00058793          	mv	a5,a1
    770c:	00b4f6b3          	and	a3,s1,a1
    7710:	00050713          	mv	a4,a0
    7714:	fca00593          	li	a1,-54
    7718:	f9dff06f          	j	76b4 <frexp+0x4c>

0000771c <quorem>:
    771c:	fb010113          	add	sp,sp,-80
    7720:	04912223          	sw	s1,68(sp)
    7724:	01052783          	lw	a5,16(a0)
    7728:	0105a483          	lw	s1,16(a1)
    772c:	04112623          	sw	ra,76(sp)
    7730:	00b12423          	sw	a1,8(sp)
    7734:	2097ca63          	blt	a5,s1,7948 <quorem+0x22c>
    7738:	fff48493          	add	s1,s1,-1
    773c:	03512a23          	sw	s5,52(sp)
    7740:	03812423          	sw	s8,40(sp)
    7744:	00249a93          	sll	s5,s1,0x2
    7748:	01458c13          	add	s8,a1,20
    774c:	05212023          	sw	s2,64(sp)
    7750:	03312e23          	sw	s3,60(sp)
    7754:	015c0933          	add	s2,s8,s5
    7758:	01450993          	add	s3,a0,20
    775c:	015987b3          	add	a5,s3,s5
    7760:	03712623          	sw	s7,44(sp)
    7764:	00092b83          	lw	s7,0(s2)
    7768:	03912223          	sw	s9,36(sp)
    776c:	0007ac83          	lw	s9,0(a5)
    7770:	001b8b93          	add	s7,s7,1
    7774:	03412c23          	sw	s4,56(sp)
    7778:	000b8593          	mv	a1,s7
    777c:	00050a13          	mv	s4,a0
    7780:	000c8513          	mv	a0,s9
    7784:	04812423          	sw	s0,72(sp)
    7788:	00f12623          	sw	a5,12(sp)
    778c:	09c070ef          	jal	e828 <__hidden___udivsi3>
    7790:	00050413          	mv	s0,a0
    7794:	0d7cee63          	bltu	s9,s7,7870 <quorem+0x154>
    7798:	03a12023          	sw	s10,32(sp)
    779c:	00010d37          	lui	s10,0x10
    77a0:	01b12e23          	sw	s11,28(sp)
    77a4:	03612823          	sw	s6,48(sp)
    77a8:	000c0a93          	mv	s5,s8
    77ac:	00098d93          	mv	s11,s3
    77b0:	00000c93          	li	s9,0
    77b4:	00000b93          	li	s7,0
    77b8:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    77bc:	000aab03          	lw	s6,0(s5)
    77c0:	00040593          	mv	a1,s0
    77c4:	004d8d93          	add	s11,s11,4
    77c8:	01ab7533          	and	a0,s6,s10
    77cc:	799060ef          	jal	e764 <__mulsi3>
    77d0:	00050793          	mv	a5,a0
    77d4:	00040593          	mv	a1,s0
    77d8:	010b5513          	srl	a0,s6,0x10
    77dc:	01978cb3          	add	s9,a5,s9
    77e0:	785060ef          	jal	e764 <__mulsi3>
    77e4:	ffcda603          	lw	a2,-4(s11)
    77e8:	01acf733          	and	a4,s9,s10
    77ec:	010cdc93          	srl	s9,s9,0x10
    77f0:	01a677b3          	and	a5,a2,s10
    77f4:	40e787b3          	sub	a5,a5,a4
    77f8:	017787b3          	add	a5,a5,s7
    77fc:	01950533          	add	a0,a0,s9
    7800:	4107d713          	sra	a4,a5,0x10
    7804:	01a575b3          	and	a1,a0,s10
    7808:	01065613          	srl	a2,a2,0x10
    780c:	40b70733          	sub	a4,a4,a1
    7810:	00c70733          	add	a4,a4,a2
    7814:	01a7f7b3          	and	a5,a5,s10
    7818:	01071613          	sll	a2,a4,0x10
    781c:	00c7e7b3          	or	a5,a5,a2
    7820:	004a8a93          	add	s5,s5,4
    7824:	fefdae23          	sw	a5,-4(s11)
    7828:	01055c93          	srl	s9,a0,0x10
    782c:	41075b93          	sra	s7,a4,0x10
    7830:	f95976e3          	bgeu	s2,s5,77bc <quorem+0xa0>
    7834:	00c12703          	lw	a4,12(sp)
    7838:	00072783          	lw	a5,0(a4)
    783c:	12079063          	bnez	a5,795c <quorem+0x240>
    7840:	ffc70a93          	add	s5,a4,-4
    7844:	0159e863          	bltu	s3,s5,7854 <quorem+0x138>
    7848:	0180006f          	j	7860 <quorem+0x144>
    784c:	fff48493          	add	s1,s1,-1
    7850:	0159f863          	bgeu	s3,s5,7860 <quorem+0x144>
    7854:	000aa783          	lw	a5,0(s5)
    7858:	ffca8a93          	add	s5,s5,-4
    785c:	fe0788e3          	beqz	a5,784c <quorem+0x130>
    7860:	03012b03          	lw	s6,48(sp)
    7864:	02012d03          	lw	s10,32(sp)
    7868:	01c12d83          	lw	s11,28(sp)
    786c:	009a2823          	sw	s1,16(s4)
    7870:	00812583          	lw	a1,8(sp)
    7874:	000a0513          	mv	a0,s4
    7878:	1fc020ef          	jal	9a74 <__mcmp>
    787c:	08054c63          	bltz	a0,7914 <quorem+0x1f8>
    7880:	00010537          	lui	a0,0x10
    7884:	00098593          	mv	a1,s3
    7888:	00000713          	li	a4,0
    788c:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    7890:	0005a683          	lw	a3,0(a1)
    7894:	000c2603          	lw	a2,0(s8)
    7898:	00458593          	add	a1,a1,4
    789c:	00a6f7b3          	and	a5,a3,a0
    78a0:	00a67833          	and	a6,a2,a0
    78a4:	410787b3          	sub	a5,a5,a6
    78a8:	00e787b3          	add	a5,a5,a4
    78ac:	4107d713          	sra	a4,a5,0x10
    78b0:	01065613          	srl	a2,a2,0x10
    78b4:	0106d693          	srl	a3,a3,0x10
    78b8:	40c70733          	sub	a4,a4,a2
    78bc:	00d70733          	add	a4,a4,a3
    78c0:	01071693          	sll	a3,a4,0x10
    78c4:	00a7f7b3          	and	a5,a5,a0
    78c8:	00d7e7b3          	or	a5,a5,a3
    78cc:	004c0c13          	add	s8,s8,4
    78d0:	fef5ae23          	sw	a5,-4(a1)
    78d4:	41075713          	sra	a4,a4,0x10
    78d8:	fb897ce3          	bgeu	s2,s8,7890 <quorem+0x174>
    78dc:	00249793          	sll	a5,s1,0x2
    78e0:	00f987b3          	add	a5,s3,a5
    78e4:	0007a703          	lw	a4,0(a5)
    78e8:	02071463          	bnez	a4,7910 <quorem+0x1f4>
    78ec:	ffc78793          	add	a5,a5,-4
    78f0:	00f9e863          	bltu	s3,a5,7900 <quorem+0x1e4>
    78f4:	0180006f          	j	790c <quorem+0x1f0>
    78f8:	fff48493          	add	s1,s1,-1
    78fc:	00f9f863          	bgeu	s3,a5,790c <quorem+0x1f0>
    7900:	0007a703          	lw	a4,0(a5)
    7904:	ffc78793          	add	a5,a5,-4
    7908:	fe0708e3          	beqz	a4,78f8 <quorem+0x1dc>
    790c:	009a2823          	sw	s1,16(s4)
    7910:	00140413          	add	s0,s0,1
    7914:	04c12083          	lw	ra,76(sp)
    7918:	00040513          	mv	a0,s0
    791c:	04812403          	lw	s0,72(sp)
    7920:	04012903          	lw	s2,64(sp)
    7924:	03c12983          	lw	s3,60(sp)
    7928:	03812a03          	lw	s4,56(sp)
    792c:	03412a83          	lw	s5,52(sp)
    7930:	02c12b83          	lw	s7,44(sp)
    7934:	02812c03          	lw	s8,40(sp)
    7938:	02412c83          	lw	s9,36(sp)
    793c:	04412483          	lw	s1,68(sp)
    7940:	05010113          	add	sp,sp,80
    7944:	00008067          	ret
    7948:	04c12083          	lw	ra,76(sp)
    794c:	04412483          	lw	s1,68(sp)
    7950:	00000513          	li	a0,0
    7954:	05010113          	add	sp,sp,80
    7958:	00008067          	ret
    795c:	00812583          	lw	a1,8(sp)
    7960:	000a0513          	mv	a0,s4
    7964:	03012b03          	lw	s6,48(sp)
    7968:	02012d03          	lw	s10,32(sp)
    796c:	01c12d83          	lw	s11,28(sp)
    7970:	104020ef          	jal	9a74 <__mcmp>
    7974:	f00556e3          	bgez	a0,7880 <quorem+0x164>
    7978:	f9dff06f          	j	7914 <quorem+0x1f8>

0000797c <_dtoa_r>:
    797c:	03852303          	lw	t1,56(a0)
    7980:	f5010113          	add	sp,sp,-176
    7984:	0a812423          	sw	s0,168(sp)
    7988:	0a912223          	sw	s1,164(sp)
    798c:	0b212023          	sw	s2,160(sp)
    7990:	09412c23          	sw	s4,152(sp)
    7994:	07b12e23          	sw	s11,124(sp)
    7998:	0a112623          	sw	ra,172(sp)
    799c:	09312e23          	sw	s3,156(sp)
    79a0:	09512a23          	sw	s5,148(sp)
    79a4:	00e12a23          	sw	a4,20(sp)
    79a8:	00f12623          	sw	a5,12(sp)
    79ac:	01112423          	sw	a7,8(sp)
    79b0:	02b12223          	sw	a1,36(sp)
    79b4:	00c12023          	sw	a2,0(sp)
    79b8:	00050413          	mv	s0,a0
    79bc:	00058d93          	mv	s11,a1
    79c0:	00060493          	mv	s1,a2
    79c4:	00068a13          	mv	s4,a3
    79c8:	00080913          	mv	s2,a6
    79cc:	02030263          	beqz	t1,79f0 <_dtoa_r+0x74>
    79d0:	03c52703          	lw	a4,60(a0)
    79d4:	00100793          	li	a5,1
    79d8:	00030593          	mv	a1,t1
    79dc:	00e797b3          	sll	a5,a5,a4
    79e0:	00e32223          	sw	a4,4(t1)
    79e4:	00f32423          	sw	a5,8(t1)
    79e8:	734010ef          	jal	911c <_Bfree>
    79ec:	02042c23          	sw	zero,56(s0)
    79f0:	00048993          	mv	s3,s1
    79f4:	00000693          	li	a3,0
    79f8:	0004dc63          	bgez	s1,7a10 <_dtoa_r+0x94>
    79fc:	00149493          	sll	s1,s1,0x1
    7a00:	0014d793          	srl	a5,s1,0x1
    7a04:	00f12023          	sw	a5,0(sp)
    7a08:	00078993          	mv	s3,a5
    7a0c:	00100693          	li	a3,1
    7a10:	7ff00737          	lui	a4,0x7ff00
    7a14:	00d92023          	sw	a3,0(s2)
    7a18:	00e9f6b3          	and	a3,s3,a4
    7a1c:	64e68463          	beq	a3,a4,8064 <_dtoa_r+0x6e8>
    7a20:	00012483          	lw	s1,0(sp)
    7a24:	000d8513          	mv	a0,s11
    7a28:	00000613          	li	a2,0
    7a2c:	00048593          	mv	a1,s1
    7a30:	00000693          	li	a3,0
    7a34:	01b12c23          	sw	s11,24(sp)
    7a38:	00912e23          	sw	s1,28(sp)
    7a3c:	3cc050ef          	jal	ce08 <__eqdf2>
    7a40:	04051c63          	bnez	a0,7a98 <_dtoa_r+0x11c>
    7a44:	00c12703          	lw	a4,12(sp)
    7a48:	00100793          	li	a5,1
    7a4c:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    7a50:	00812703          	lw	a4,8(sp)
    7a54:	00070863          	beqz	a4,7a64 <_dtoa_r+0xe8>
    7a58:	00007797          	auipc	a5,0x7
    7a5c:	05978793          	add	a5,a5,89 # eab1 <__fini_array_end+0x155>
    7a60:	00f72023          	sw	a5,0(a4)
    7a64:	00007a97          	auipc	s5,0x7
    7a68:	04ca8a93          	add	s5,s5,76 # eab0 <__fini_array_end+0x154>
    7a6c:	0ac12083          	lw	ra,172(sp)
    7a70:	0a812403          	lw	s0,168(sp)
    7a74:	0a412483          	lw	s1,164(sp)
    7a78:	0a012903          	lw	s2,160(sp)
    7a7c:	09c12983          	lw	s3,156(sp)
    7a80:	09812a03          	lw	s4,152(sp)
    7a84:	07c12d83          	lw	s11,124(sp)
    7a88:	000a8513          	mv	a0,s5
    7a8c:	09412a83          	lw	s5,148(sp)
    7a90:	0b010113          	add	sp,sp,176
    7a94:	00008067          	ret
    7a98:	00048613          	mv	a2,s1
    7a9c:	06810713          	add	a4,sp,104
    7aa0:	06c10693          	add	a3,sp,108
    7aa4:	000d8593          	mv	a1,s11
    7aa8:	00040513          	mv	a0,s0
    7aac:	09612823          	sw	s6,144(sp)
    7ab0:	09712623          	sw	s7,140(sp)
    7ab4:	09812423          	sw	s8,136(sp)
    7ab8:	09912223          	sw	s9,132(sp)
    7abc:	09a12023          	sw	s10,128(sp)
    7ac0:	0149d913          	srl	s2,s3,0x14
    7ac4:	268020ef          	jal	9d2c <__d2b>
    7ac8:	00050493          	mv	s1,a0
    7acc:	5c091e63          	bnez	s2,80a8 <_dtoa_r+0x72c>
    7ad0:	06812a83          	lw	s5,104(sp)
    7ad4:	06c12903          	lw	s2,108(sp)
    7ad8:	02000793          	li	a5,32
    7adc:	012a8933          	add	s2,s5,s2
    7ae0:	43290713          	add	a4,s2,1074
    7ae4:	36e7dae3          	bge	a5,a4,8658 <_dtoa_r+0xcdc>
    7ae8:	04000793          	li	a5,64
    7aec:	40e787b3          	sub	a5,a5,a4
    7af0:	41290513          	add	a0,s2,1042
    7af4:	00f997b3          	sll	a5,s3,a5
    7af8:	00add533          	srl	a0,s11,a0
    7afc:	00a7e533          	or	a0,a5,a0
    7b00:	7c4060ef          	jal	e2c4 <__floatunsidf>
    7b04:	fe1007b7          	lui	a5,0xfe100
    7b08:	00100693          	li	a3,1
    7b0c:	00050713          	mv	a4,a0
    7b10:	00b787b3          	add	a5,a5,a1
    7b14:	fff90913          	add	s2,s2,-1
    7b18:	02d12c23          	sw	a3,56(sp)
    7b1c:	7fff9697          	auipc	a3,0x7fff9
    7b20:	bac68693          	add	a3,a3,-1108 # 800006c8 <__global_locale+0x194>
    7b24:	0006a603          	lw	a2,0(a3)
    7b28:	0046a683          	lw	a3,4(a3)
    7b2c:	00070513          	mv	a0,a4
    7b30:	00078593          	mv	a1,a5
    7b34:	4f9050ef          	jal	d82c <__subdf3>
    7b38:	7fff9797          	auipc	a5,0x7fff9
    7b3c:	b9878793          	add	a5,a5,-1128 # 800006d0 <__global_locale+0x19c>
    7b40:	0007a603          	lw	a2,0(a5)
    7b44:	0047a683          	lw	a3,4(a5)
    7b48:	554050ef          	jal	d09c <__muldf3>
    7b4c:	7fff9797          	auipc	a5,0x7fff9
    7b50:	b8c78793          	add	a5,a5,-1140 # 800006d8 <__global_locale+0x1a4>
    7b54:	0007a603          	lw	a2,0(a5)
    7b58:	0047a683          	lw	a3,4(a5)
    7b5c:	138040ef          	jal	bc94 <__adddf3>
    7b60:	00050b13          	mv	s6,a0
    7b64:	00090513          	mv	a0,s2
    7b68:	00058993          	mv	s3,a1
    7b6c:	6a0060ef          	jal	e20c <__floatsidf>
    7b70:	7fff9797          	auipc	a5,0x7fff9
    7b74:	b7078793          	add	a5,a5,-1168 # 800006e0 <__global_locale+0x1ac>
    7b78:	0007a603          	lw	a2,0(a5)
    7b7c:	0047a683          	lw	a3,4(a5)
    7b80:	51c050ef          	jal	d09c <__muldf3>
    7b84:	00050613          	mv	a2,a0
    7b88:	00058693          	mv	a3,a1
    7b8c:	000b0513          	mv	a0,s6
    7b90:	00098593          	mv	a1,s3
    7b94:	100040ef          	jal	bc94 <__adddf3>
    7b98:	00050b93          	mv	s7,a0
    7b9c:	00058b13          	mv	s6,a1
    7ba0:	5e8060ef          	jal	e188 <__fixdfsi>
    7ba4:	00050993          	mv	s3,a0
    7ba8:	000b0593          	mv	a1,s6
    7bac:	000b8513          	mv	a0,s7
    7bb0:	00000613          	li	a2,0
    7bb4:	00000693          	li	a3,0
    7bb8:	3dc050ef          	jal	cf94 <__ledf2>
    7bbc:	02055063          	bgez	a0,7bdc <_dtoa_r+0x260>
    7bc0:	00098513          	mv	a0,s3
    7bc4:	648060ef          	jal	e20c <__floatsidf>
    7bc8:	000b8613          	mv	a2,s7
    7bcc:	000b0693          	mv	a3,s6
    7bd0:	238050ef          	jal	ce08 <__eqdf2>
    7bd4:	00a03533          	snez	a0,a0
    7bd8:	40a989b3          	sub	s3,s3,a0
    7bdc:	412a8ab3          	sub	s5,s5,s2
    7be0:	01600793          	li	a5,22
    7be4:	fffa8b13          	add	s6,s5,-1
    7be8:	2137e2e3          	bltu	a5,s3,85ec <_dtoa_r+0xc70>
    7bec:	00399713          	sll	a4,s3,0x3
    7bf0:	00007797          	auipc	a5,0x7
    7bf4:	55878793          	add	a5,a5,1368 # f148 <__mprec_tens>
    7bf8:	00e787b3          	add	a5,a5,a4
    7bfc:	0007a603          	lw	a2,0(a5)
    7c00:	0047a683          	lw	a3,4(a5)
    7c04:	01812503          	lw	a0,24(sp)
    7c08:	01c12583          	lw	a1,28(sp)
    7c0c:	388050ef          	jal	cf94 <__ledf2>
    7c10:	220554e3          	bgez	a0,8638 <_dtoa_r+0xcbc>
    7c14:	fff98993          	add	s3,s3,-1
    7c18:	02012a23          	sw	zero,52(sp)
    7c1c:	00012823          	sw	zero,16(sp)
    7c20:	4a0b4863          	bltz	s6,80d0 <_dtoa_r+0x754>
    7c24:	4c09d063          	bgez	s3,80e4 <_dtoa_r+0x768>
    7c28:	01012783          	lw	a5,16(sp)
    7c2c:	03312023          	sw	s3,32(sp)
    7c30:	413787b3          	sub	a5,a5,s3
    7c34:	00f12823          	sw	a5,16(sp)
    7c38:	413007b3          	neg	a5,s3
    7c3c:	02f12823          	sw	a5,48(sp)
    7c40:	00900793          	li	a5,9
    7c44:	00000993          	li	s3,0
    7c48:	4b47e863          	bltu	a5,s4,80f8 <_dtoa_r+0x77c>
    7c4c:	00500793          	li	a5,5
    7c50:	2147dae3          	bge	a5,s4,8664 <_dtoa_r+0xce8>
    7c54:	ffca0a13          	add	s4,s4,-4
    7c58:	00300793          	li	a5,3
    7c5c:	00000913          	li	s2,0
    7c60:	66fa02e3          	beq	s4,a5,8ac4 <_dtoa_r+0x1148>
    7c64:	6147dae3          	bge	a5,s4,8a78 <_dtoa_r+0x10fc>
    7c68:	00400793          	li	a5,4
    7c6c:	54fa1ae3          	bne	s4,a5,89c0 <_dtoa_r+0x1044>
    7c70:	00100793          	li	a5,1
    7c74:	02f12423          	sw	a5,40(sp)
    7c78:	01412603          	lw	a2,20(sp)
    7c7c:	62c05ce3          	blez	a2,8ab4 <_dtoa_r+0x1138>
    7c80:	02c12e23          	sw	a2,60(sp)
    7c84:	00060c13          	mv	s8,a2
    7c88:	01700693          	li	a3,23
    7c8c:	00100713          	li	a4,1
    7c90:	00400793          	li	a5,4
    7c94:	00c6c463          	blt	a3,a2,7c9c <_dtoa_r+0x320>
    7c98:	3540106f          	j	8fec <_dtoa_r+0x1670>
    7c9c:	00179793          	sll	a5,a5,0x1
    7ca0:	01478693          	add	a3,a5,20
    7ca4:	00070593          	mv	a1,a4
    7ca8:	00170713          	add	a4,a4,1
    7cac:	fed678e3          	bgeu	a2,a3,7c9c <_dtoa_r+0x320>
    7cb0:	02b42e23          	sw	a1,60(s0)
    7cb4:	00040513          	mv	a0,s0
    7cb8:	3b0010ef          	jal	9068 <_Balloc>
    7cbc:	00050a93          	mv	s5,a0
    7cc0:	00051463          	bnez	a0,7cc8 <_dtoa_r+0x34c>
    7cc4:	30c0106f          	j	8fd0 <_dtoa_r+0x1654>
    7cc8:	02a42c23          	sw	a0,56(s0)
    7ccc:	00e00793          	li	a5,14
    7cd0:	5187ea63          	bltu	a5,s8,81e4 <_dtoa_r+0x868>
    7cd4:	50090863          	beqz	s2,81e4 <_dtoa_r+0x868>
    7cd8:	02012783          	lw	a5,32(sp)
    7cdc:	62f054e3          	blez	a5,8b04 <_dtoa_r+0x1188>
    7ce0:	00f7f713          	and	a4,a5,15
    7ce4:	00371713          	sll	a4,a4,0x3
    7ce8:	4047dc93          	sra	s9,a5,0x4
    7cec:	00007797          	auipc	a5,0x7
    7cf0:	45c78793          	add	a5,a5,1116 # f148 <__mprec_tens>
    7cf4:	00e787b3          	add	a5,a5,a4
    7cf8:	010cf693          	and	a3,s9,16
    7cfc:	0007a803          	lw	a6,0(a5)
    7d00:	0047a703          	lw	a4,4(a5)
    7d04:	560682e3          	beqz	a3,8a68 <_dtoa_r+0x10ec>
    7d08:	00007797          	auipc	a5,0x7
    7d0c:	41878793          	add	a5,a5,1048 # f120 <__mprec_bigtens>
    7d10:	0207a603          	lw	a2,32(a5)
    7d14:	0247a683          	lw	a3,36(a5)
    7d18:	01812503          	lw	a0,24(sp)
    7d1c:	01c12583          	lw	a1,28(sp)
    7d20:	04e12423          	sw	a4,72(sp)
    7d24:	05012023          	sw	a6,64(sp)
    7d28:	035040ef          	jal	c55c <__divdf3>
    7d2c:	04012803          	lw	a6,64(sp)
    7d30:	04812703          	lw	a4,72(sp)
    7d34:	00fcfc93          	and	s9,s9,15
    7d38:	00050313          	mv	t1,a0
    7d3c:	00058d13          	mv	s10,a1
    7d40:	00300913          	li	s2,3
    7d44:	040c8c63          	beqz	s9,7d9c <_dtoa_r+0x420>
    7d48:	04812023          	sw	s0,64(sp)
    7d4c:	00007b97          	auipc	s7,0x7
    7d50:	3d4b8b93          	add	s7,s7,980 # f120 <__mprec_bigtens>
    7d54:	00090413          	mv	s0,s2
    7d58:	00070593          	mv	a1,a4
    7d5c:	00030913          	mv	s2,t1
    7d60:	001cf793          	and	a5,s9,1
    7d64:	00078e63          	beqz	a5,7d80 <_dtoa_r+0x404>
    7d68:	000ba603          	lw	a2,0(s7)
    7d6c:	004ba683          	lw	a3,4(s7)
    7d70:	00080513          	mv	a0,a6
    7d74:	00140413          	add	s0,s0,1
    7d78:	324050ef          	jal	d09c <__muldf3>
    7d7c:	00050813          	mv	a6,a0
    7d80:	401cdc93          	sra	s9,s9,0x1
    7d84:	008b8b93          	add	s7,s7,8
    7d88:	fc0c9ce3          	bnez	s9,7d60 <_dtoa_r+0x3e4>
    7d8c:	00090313          	mv	t1,s2
    7d90:	00040913          	mv	s2,s0
    7d94:	04012403          	lw	s0,64(sp)
    7d98:	00058713          	mv	a4,a1
    7d9c:	00070693          	mv	a3,a4
    7da0:	00080613          	mv	a2,a6
    7da4:	00030513          	mv	a0,t1
    7da8:	000d0593          	mv	a1,s10
    7dac:	7b0040ef          	jal	c55c <__divdf3>
    7db0:	00050713          	mv	a4,a0
    7db4:	00058793          	mv	a5,a1
    7db8:	03412683          	lw	a3,52(sp)
    7dbc:	02068c63          	beqz	a3,7df4 <_dtoa_r+0x478>
    7dc0:	7fff9697          	auipc	a3,0x7fff9
    7dc4:	92868693          	add	a3,a3,-1752 # 800006e8 <__global_locale+0x1b4>
    7dc8:	0006a603          	lw	a2,0(a3)
    7dcc:	0046a683          	lw	a3,4(a3)
    7dd0:	00070513          	mv	a0,a4
    7dd4:	00078593          	mv	a1,a5
    7dd8:	04e12423          	sw	a4,72(sp)
    7ddc:	04f12023          	sw	a5,64(sp)
    7de0:	1b4050ef          	jal	cf94 <__ledf2>
    7de4:	04012783          	lw	a5,64(sp)
    7de8:	04812703          	lw	a4,72(sp)
    7dec:	00055463          	bgez	a0,7df4 <_dtoa_r+0x478>
    7df0:	04c0106f          	j	8e3c <_dtoa_r+0x14c0>
    7df4:	00090513          	mv	a0,s2
    7df8:	04f12623          	sw	a5,76(sp)
    7dfc:	04e12023          	sw	a4,64(sp)
    7e00:	40c060ef          	jal	e20c <__floatsidf>
    7e04:	04012703          	lw	a4,64(sp)
    7e08:	04c12783          	lw	a5,76(sp)
    7e0c:	00070613          	mv	a2,a4
    7e10:	00078693          	mv	a3,a5
    7e14:	04e12423          	sw	a4,72(sp)
    7e18:	04f12023          	sw	a5,64(sp)
    7e1c:	280050ef          	jal	d09c <__muldf3>
    7e20:	7fff9697          	auipc	a3,0x7fff9
    7e24:	8d868693          	add	a3,a3,-1832 # 800006f8 <__global_locale+0x1c4>
    7e28:	0006a603          	lw	a2,0(a3)
    7e2c:	0046a683          	lw	a3,4(a3)
    7e30:	665030ef          	jal	bc94 <__adddf3>
    7e34:	fcc006b7          	lui	a3,0xfcc00
    7e38:	04012783          	lw	a5,64(sp)
    7e3c:	04812703          	lw	a4,72(sp)
    7e40:	00050c93          	mv	s9,a0
    7e44:	00b68bb3          	add	s7,a3,a1
    7e48:	340c0463          	beqz	s8,8190 <_dtoa_r+0x814>
    7e4c:	02012683          	lw	a3,32(sp)
    7e50:	05812423          	sw	s8,72(sp)
    7e54:	04d12e23          	sw	a3,92(sp)
    7e58:	00070513          	mv	a0,a4
    7e5c:	00078593          	mv	a1,a5
    7e60:	04e12623          	sw	a4,76(sp)
    7e64:	04f12023          	sw	a5,64(sp)
    7e68:	320060ef          	jal	e188 <__fixdfsi>
    7e6c:	04812783          	lw	a5,72(sp)
    7e70:	00050913          	mv	s2,a0
    7e74:	05912c23          	sw	s9,88(sp)
    7e78:	fff78693          	add	a3,a5,-1
    7e7c:	00369693          	sll	a3,a3,0x3
    7e80:	00007797          	auipc	a5,0x7
    7e84:	2c878793          	add	a5,a5,712 # f148 <__mprec_tens>
    7e88:	00d786b3          	add	a3,a5,a3
    7e8c:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    7e90:	0046a803          	lw	a6,4(a3)
    7e94:	001a8d13          	add	s10,s5,1
    7e98:	04f12823          	sw	a5,80(sp)
    7e9c:	05012a23          	sw	a6,84(sp)
    7ea0:	36c060ef          	jal	e20c <__floatsidf>
    7ea4:	04c12703          	lw	a4,76(sp)
    7ea8:	04012783          	lw	a5,64(sp)
    7eac:	00050613          	mv	a2,a0
    7eb0:	00058693          	mv	a3,a1
    7eb4:	00070513          	mv	a0,a4
    7eb8:	00078593          	mv	a1,a5
    7ebc:	171050ef          	jal	d82c <__subdf3>
    7ec0:	02812703          	lw	a4,40(sp)
    7ec4:	03090313          	add	t1,s2,48
    7ec8:	05a12023          	sw	s10,64(sp)
    7ecc:	00050c93          	mv	s9,a0
    7ed0:	0ff37313          	zext.b	t1,t1
    7ed4:	5c0706e3          	beqz	a4,8ca0 <_dtoa_r+0x1324>
    7ed8:	7fff8797          	auipc	a5,0x7fff8
    7edc:	7e078793          	add	a5,a5,2016 # 800006b8 <__global_locale+0x184>
    7ee0:	0007a503          	lw	a0,0(a5)
    7ee4:	05012603          	lw	a2,80(sp)
    7ee8:	05412683          	lw	a3,84(sp)
    7eec:	04b12023          	sw	a1,64(sp)
    7ef0:	0047a583          	lw	a1,4(a5)
    7ef4:	04612623          	sw	t1,76(sp)
    7ef8:	664040ef          	jal	c55c <__divdf3>
    7efc:	05812603          	lw	a2,88(sp)
    7f00:	000b8693          	mv	a3,s7
    7f04:	129050ef          	jal	d82c <__subdf3>
    7f08:	04012883          	lw	a7,64(sp)
    7f0c:	04c12303          	lw	t1,76(sp)
    7f10:	000c8613          	mv	a2,s9
    7f14:	00088693          	mv	a3,a7
    7f18:	006a8023          	sb	t1,0(s5)
    7f1c:	00050913          	mv	s2,a0
    7f20:	00058b93          	mv	s7,a1
    7f24:	771040ef          	jal	ce94 <__gedf2>
    7f28:	04012883          	lw	a7,64(sp)
    7f2c:	00a05463          	blez	a0,7f34 <_dtoa_r+0x5b8>
    7f30:	7c90006f          	j	8ef8 <_dtoa_r+0x157c>
    7f34:	7fff8697          	auipc	a3,0x7fff8
    7f38:	7b468693          	add	a3,a3,1972 # 800006e8 <__global_locale+0x1b4>
    7f3c:	0006a783          	lw	a5,0(a3)
    7f40:	0046a803          	lw	a6,4(a3)
    7f44:	05312623          	sw	s3,76(sp)
    7f48:	04f12023          	sw	a5,64(sp)
    7f4c:	00000793          	li	a5,0
    7f50:	05612823          	sw	s6,80(sp)
    7f54:	05812c23          	sw	s8,88(sp)
    7f58:	05012223          	sw	a6,68(sp)
    7f5c:	04812c03          	lw	s8,72(sp)
    7f60:	00078b13          	mv	s6,a5
    7f64:	05412423          	sw	s4,72(sp)
    7f68:	00088993          	mv	s3,a7
    7f6c:	0980006f          	j	8004 <_dtoa_r+0x688>
    7f70:	001b0b13          	add	s6,s6,1
    7f74:	018b4463          	blt	s6,s8,7f7c <_dtoa_r+0x600>
    7f78:	7d10006f          	j	8f48 <_dtoa_r+0x15cc>
    7f7c:	7fff8a17          	auipc	s4,0x7fff8
    7f80:	774a0a13          	add	s4,s4,1908 # 800006f0 <__global_locale+0x1bc>
    7f84:	000a2603          	lw	a2,0(s4)
    7f88:	004a2683          	lw	a3,4(s4)
    7f8c:	00090513          	mv	a0,s2
    7f90:	000b8593          	mv	a1,s7
    7f94:	108050ef          	jal	d09c <__muldf3>
    7f98:	000a2603          	lw	a2,0(s4)
    7f9c:	004a2683          	lw	a3,4(s4)
    7fa0:	00050913          	mv	s2,a0
    7fa4:	00058b93          	mv	s7,a1
    7fa8:	000c8513          	mv	a0,s9
    7fac:	00098593          	mv	a1,s3
    7fb0:	0ec050ef          	jal	d09c <__muldf3>
    7fb4:	00058c93          	mv	s9,a1
    7fb8:	00050a13          	mv	s4,a0
    7fbc:	1cc060ef          	jal	e188 <__fixdfsi>
    7fc0:	00050993          	mv	s3,a0
    7fc4:	248060ef          	jal	e20c <__floatsidf>
    7fc8:	00050613          	mv	a2,a0
    7fcc:	00058693          	mv	a3,a1
    7fd0:	000a0513          	mv	a0,s4
    7fd4:	000c8593          	mv	a1,s9
    7fd8:	055050ef          	jal	d82c <__subdf3>
    7fdc:	03098793          	add	a5,s3,48
    7fe0:	00090613          	mv	a2,s2
    7fe4:	000b8693          	mv	a3,s7
    7fe8:	00fd0023          	sb	a5,0(s10)
    7fec:	001d0d13          	add	s10,s10,1
    7ff0:	00050c93          	mv	s9,a0
    7ff4:	00058993          	mv	s3,a1
    7ff8:	79d040ef          	jal	cf94 <__ledf2>
    7ffc:	00055463          	bgez	a0,8004 <_dtoa_r+0x688>
    8000:	6f90006f          	j	8ef8 <_dtoa_r+0x157c>
    8004:	04012503          	lw	a0,64(sp)
    8008:	04412583          	lw	a1,68(sp)
    800c:	000c8613          	mv	a2,s9
    8010:	00098693          	mv	a3,s3
    8014:	019050ef          	jal	d82c <__subdf3>
    8018:	00090613          	mv	a2,s2
    801c:	000b8693          	mv	a3,s7
    8020:	775040ef          	jal	cf94 <__ledf2>
    8024:	f40556e3          	bgez	a0,7f70 <_dtoa_r+0x5f4>
    8028:	05c12783          	lw	a5,92(sp)
    802c:	000d0b93          	mv	s7,s10
    8030:	00178c13          	add	s8,a5,1
    8034:	03900613          	li	a2,57
    8038:	0080006f          	j	8040 <_dtoa_r+0x6c4>
    803c:	697a88e3          	beq	s5,s7,8ecc <_dtoa_r+0x1550>
    8040:	fffbc683          	lbu	a3,-1(s7)
    8044:	000b8d13          	mv	s10,s7
    8048:	fffb8b93          	add	s7,s7,-1
    804c:	fec688e3          	beq	a3,a2,803c <_dtoa_r+0x6c0>
    8050:	00168693          	add	a3,a3,1
    8054:	0ff6f693          	zext.b	a3,a3
    8058:	00db8023          	sb	a3,0(s7)
    805c:	000c0a13          	mv	s4,s8
    8060:	4f00006f          	j	8550 <_dtoa_r+0xbd4>
    8064:	00c12683          	lw	a3,12(sp)
    8068:	00002737          	lui	a4,0x2
    806c:	00c99793          	sll	a5,s3,0xc
    8070:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0xd17>
    8074:	00c7d793          	srl	a5,a5,0xc
    8078:	00e6a023          	sw	a4,0(a3)
    807c:	01b7e7b3          	or	a5,a5,s11
    8080:	0a078063          	beqz	a5,8120 <_dtoa_r+0x7a4>
    8084:	00812783          	lw	a5,8(sp)
    8088:	00007a97          	auipc	s5,0x7
    808c:	a80a8a93          	add	s5,s5,-1408 # eb08 <__fini_array_end+0x1ac>
    8090:	9c078ee3          	beqz	a5,7a6c <_dtoa_r+0xf0>
    8094:	00007797          	auipc	a5,0x7
    8098:	a7778793          	add	a5,a5,-1417 # eb0b <__fini_array_end+0x1af>
    809c:	00812703          	lw	a4,8(sp)
    80a0:	00f72023          	sw	a5,0(a4)
    80a4:	9c9ff06f          	j	7a6c <_dtoa_r+0xf0>
    80a8:	01c12783          	lw	a5,28(sp)
    80ac:	3ff006b7          	lui	a3,0x3ff00
    80b0:	06812a83          	lw	s5,104(sp)
    80b4:	00c79793          	sll	a5,a5,0xc
    80b8:	00c7d793          	srl	a5,a5,0xc
    80bc:	01812703          	lw	a4,24(sp)
    80c0:	00d7e7b3          	or	a5,a5,a3
    80c4:	c0190913          	add	s2,s2,-1023
    80c8:	02012c23          	sw	zero,56(sp)
    80cc:	a51ff06f          	j	7b1c <_dtoa_r+0x1a0>
    80d0:	00100793          	li	a5,1
    80d4:	415787b3          	sub	a5,a5,s5
    80d8:	00f12823          	sw	a5,16(sp)
    80dc:	00000b13          	li	s6,0
    80e0:	b409c4e3          	bltz	s3,7c28 <_dtoa_r+0x2ac>
    80e4:	03312023          	sw	s3,32(sp)
    80e8:	02012823          	sw	zero,48(sp)
    80ec:	00900793          	li	a5,9
    80f0:	013b0b33          	add	s6,s6,s3
    80f4:	b547fce3          	bgeu	a5,s4,7c4c <_dtoa_r+0x2d0>
    80f8:	00100793          	li	a5,1
    80fc:	00100913          	li	s2,1
    8100:	00000a13          	li	s4,0
    8104:	02f12423          	sw	a5,40(sp)
    8108:	fff00c13          	li	s8,-1
    810c:	00012a23          	sw	zero,20(sp)
    8110:	02042e23          	sw	zero,60(s0)
    8114:	03812e23          	sw	s8,60(sp)
    8118:	00000593          	li	a1,0
    811c:	b99ff06f          	j	7cb4 <_dtoa_r+0x338>
    8120:	00812703          	lw	a4,8(sp)
    8124:	00007a97          	auipc	s5,0x7
    8128:	9d8a8a93          	add	s5,s5,-1576 # eafc <__fini_array_end+0x1a0>
    812c:	00007797          	auipc	a5,0x7
    8130:	9d878793          	add	a5,a5,-1576 # eb04 <__fini_array_end+0x1a8>
    8134:	f60714e3          	bnez	a4,809c <_dtoa_r+0x720>
    8138:	935ff06f          	j	7a6c <_dtoa_r+0xf0>
    813c:	00090513          	mv	a0,s2
    8140:	04f12623          	sw	a5,76(sp)
    8144:	04e12023          	sw	a4,64(sp)
    8148:	0c4060ef          	jal	e20c <__floatsidf>
    814c:	04012703          	lw	a4,64(sp)
    8150:	04c12783          	lw	a5,76(sp)
    8154:	00070613          	mv	a2,a4
    8158:	00078693          	mv	a3,a5
    815c:	04e12423          	sw	a4,72(sp)
    8160:	04f12023          	sw	a5,64(sp)
    8164:	739040ef          	jal	d09c <__muldf3>
    8168:	7fff8697          	auipc	a3,0x7fff8
    816c:	59068693          	add	a3,a3,1424 # 800006f8 <__global_locale+0x1c4>
    8170:	0006a603          	lw	a2,0(a3)
    8174:	0046a683          	lw	a3,4(a3)
    8178:	31d030ef          	jal	bc94 <__adddf3>
    817c:	04012783          	lw	a5,64(sp)
    8180:	04812703          	lw	a4,72(sp)
    8184:	fcc006b7          	lui	a3,0xfcc00
    8188:	00050c93          	mv	s9,a0
    818c:	00b68bb3          	add	s7,a3,a1
    8190:	7fff8697          	auipc	a3,0x7fff8
    8194:	57068693          	add	a3,a3,1392 # 80000700 <__global_locale+0x1cc>
    8198:	0006a603          	lw	a2,0(a3)
    819c:	0046a683          	lw	a3,4(a3)
    81a0:	00070513          	mv	a0,a4
    81a4:	00078593          	mv	a1,a5
    81a8:	684050ef          	jal	d82c <__subdf3>
    81ac:	000c8613          	mv	a2,s9
    81b0:	000b8693          	mv	a3,s7
    81b4:	00050d13          	mv	s10,a0
    81b8:	00058913          	mv	s2,a1
    81bc:	4d9040ef          	jal	ce94 <__gedf2>
    81c0:	50a04ce3          	bgtz	a0,8ed8 <_dtoa_r+0x155c>
    81c4:	800007b7          	lui	a5,0x80000
    81c8:	0177c7b3          	xor	a5,a5,s7
    81cc:	000c8613          	mv	a2,s9
    81d0:	000d0513          	mv	a0,s10
    81d4:	00078693          	mv	a3,a5
    81d8:	00090593          	mv	a1,s2
    81dc:	5b9040ef          	jal	cf94 <__ledf2>
    81e0:	06054c63          	bltz	a0,8258 <_dtoa_r+0x8dc>
    81e4:	06c12783          	lw	a5,108(sp)
    81e8:	1a07c663          	bltz	a5,8394 <_dtoa_r+0xa18>
    81ec:	02012683          	lw	a3,32(sp)
    81f0:	00e00713          	li	a4,14
    81f4:	1ad74063          	blt	a4,a3,8394 <_dtoa_r+0xa18>
    81f8:	02012783          	lw	a5,32(sp)
    81fc:	00379713          	sll	a4,a5,0x3
    8200:	00007797          	auipc	a5,0x7
    8204:	f4878793          	add	a5,a5,-184 # f148 <__mprec_tens>
    8208:	00e787b3          	add	a5,a5,a4
    820c:	0007a903          	lw	s2,0(a5)
    8210:	0047a983          	lw	s3,4(a5)
    8214:	01412783          	lw	a5,20(sp)
    8218:	0407dc63          	bgez	a5,8270 <_dtoa_r+0x8f4>
    821c:	05804a63          	bgtz	s8,8270 <_dtoa_r+0x8f4>
    8220:	020c1c63          	bnez	s8,8258 <_dtoa_r+0x8dc>
    8224:	7fff8797          	auipc	a5,0x7fff8
    8228:	4dc78793          	add	a5,a5,1244 # 80000700 <__global_locale+0x1cc>
    822c:	0007a603          	lw	a2,0(a5)
    8230:	0047a683          	lw	a3,4(a5)
    8234:	00090513          	mv	a0,s2
    8238:	00098593          	mv	a1,s3
    823c:	661040ef          	jal	d09c <__muldf3>
    8240:	00050613          	mv	a2,a0
    8244:	00058693          	mv	a3,a1
    8248:	01812503          	lw	a0,24(sp)
    824c:	01c12583          	lw	a1,28(sp)
    8250:	545040ef          	jal	cf94 <__ledf2>
    8254:	48a042e3          	bgtz	a0,8ed8 <_dtoa_r+0x155c>
    8258:	000a8d13          	mv	s10,s5
    825c:	00012c23          	sw	zero,24(sp)
    8260:	00000913          	li	s2,0
    8264:	01412783          	lw	a5,20(sp)
    8268:	fff7ca13          	not	s4,a5
    826c:	6980006f          	j	8904 <_dtoa_r+0xf88>
    8270:	001a8793          	add	a5,s5,1
    8274:	04f12023          	sw	a5,64(sp)
    8278:	01812b03          	lw	s6,24(sp)
    827c:	01c12a03          	lw	s4,28(sp)
    8280:	00090613          	mv	a2,s2
    8284:	00098693          	mv	a3,s3
    8288:	000b0513          	mv	a0,s6
    828c:	000a0593          	mv	a1,s4
    8290:	2cc040ef          	jal	c55c <__divdf3>
    8294:	6f5050ef          	jal	e188 <__fixdfsi>
    8298:	00050d13          	mv	s10,a0
    829c:	771050ef          	jal	e20c <__floatsidf>
    82a0:	00090613          	mv	a2,s2
    82a4:	00098693          	mv	a3,s3
    82a8:	5f5040ef          	jal	d09c <__muldf3>
    82ac:	00050613          	mv	a2,a0
    82b0:	00058693          	mv	a3,a1
    82b4:	000b0513          	mv	a0,s6
    82b8:	000a0593          	mv	a1,s4
    82bc:	570050ef          	jal	d82c <__subdf3>
    82c0:	030d0793          	add	a5,s10,48
    82c4:	00fa8023          	sb	a5,0(s5)
    82c8:	00100613          	li	a2,1
    82cc:	04012b83          	lw	s7,64(sp)
    82d0:	00050713          	mv	a4,a0
    82d4:	00058693          	mv	a3,a1
    82d8:	0ccc0ee3          	beq	s8,a2,8bb4 <_dtoa_r+0x1238>
    82dc:	7fff8617          	auipc	a2,0x7fff8
    82e0:	41460613          	add	a2,a2,1044 # 800006f0 <__global_locale+0x1bc>
    82e4:	00062783          	lw	a5,0(a2)
    82e8:	00462803          	lw	a6,4(a2)
    82ec:	00100d93          	li	s11,1
    82f0:	00f12023          	sw	a5,0(sp)
    82f4:	01012223          	sw	a6,4(sp)
    82f8:	0600006f          	j	8358 <_dtoa_r+0x9dc>
    82fc:	00090613          	mv	a2,s2
    8300:	00098693          	mv	a3,s3
    8304:	000b0513          	mv	a0,s6
    8308:	000a0593          	mv	a1,s4
    830c:	250040ef          	jal	c55c <__divdf3>
    8310:	679050ef          	jal	e188 <__fixdfsi>
    8314:	00050d13          	mv	s10,a0
    8318:	6f5050ef          	jal	e20c <__floatsidf>
    831c:	00090613          	mv	a2,s2
    8320:	00098693          	mv	a3,s3
    8324:	579040ef          	jal	d09c <__muldf3>
    8328:	00058693          	mv	a3,a1
    832c:	00050613          	mv	a2,a0
    8330:	000a0593          	mv	a1,s4
    8334:	000b0513          	mv	a0,s6
    8338:	4f4050ef          	jal	d82c <__subdf3>
    833c:	001b8b93          	add	s7,s7,1
    8340:	030d0793          	add	a5,s10,48
    8344:	001d8d93          	add	s11,s11,1
    8348:	fefb8fa3          	sb	a5,-1(s7)
    834c:	00050713          	mv	a4,a0
    8350:	00058693          	mv	a3,a1
    8354:	07bc00e3          	beq	s8,s11,8bb4 <_dtoa_r+0x1238>
    8358:	00012603          	lw	a2,0(sp)
    835c:	00068593          	mv	a1,a3
    8360:	00412683          	lw	a3,4(sp)
    8364:	00070513          	mv	a0,a4
    8368:	535040ef          	jal	d09c <__muldf3>
    836c:	00000613          	li	a2,0
    8370:	00000693          	li	a3,0
    8374:	00050b13          	mv	s6,a0
    8378:	00058a13          	mv	s4,a1
    837c:	28d040ef          	jal	ce08 <__eqdf2>
    8380:	f6051ee3          	bnez	a0,82fc <_dtoa_r+0x980>
    8384:	02012783          	lw	a5,32(sp)
    8388:	000b8d13          	mv	s10,s7
    838c:	00178a13          	add	s4,a5,1
    8390:	1c00006f          	j	8550 <_dtoa_r+0xbd4>
    8394:	02812703          	lw	a4,40(sp)
    8398:	26071463          	bnez	a4,8600 <_dtoa_r+0xc84>
    839c:	03012b83          	lw	s7,48(sp)
    83a0:	01012c83          	lw	s9,16(sp)
    83a4:	02012423          	sw	zero,40(sp)
    83a8:	00000913          	li	s2,0
    83ac:	020c8263          	beqz	s9,83d0 <_dtoa_r+0xa54>
    83b0:	03605063          	blez	s6,83d0 <_dtoa_r+0xa54>
    83b4:	000c8793          	mv	a5,s9
    83b8:	679b4263          	blt	s6,s9,8a1c <_dtoa_r+0x10a0>
    83bc:	01012703          	lw	a4,16(sp)
    83c0:	40fc8cb3          	sub	s9,s9,a5
    83c4:	40fb0b33          	sub	s6,s6,a5
    83c8:	40f70733          	sub	a4,a4,a5
    83cc:	00e12823          	sw	a4,16(sp)
    83d0:	03012783          	lw	a5,48(sp)
    83d4:	02078263          	beqz	a5,83f8 <_dtoa_r+0xa7c>
    83d8:	02812783          	lw	a5,40(sp)
    83dc:	00078463          	beqz	a5,83e4 <_dtoa_r+0xa68>
    83e0:	060b9ae3          	bnez	s7,8c54 <_dtoa_r+0x12d8>
    83e4:	03012603          	lw	a2,48(sp)
    83e8:	00048593          	mv	a1,s1
    83ec:	00040513          	mv	a0,s0
    83f0:	3a4010ef          	jal	9794 <__pow5mult>
    83f4:	00050493          	mv	s1,a0
    83f8:	00100593          	li	a1,1
    83fc:	00040513          	mv	a0,s0
    8400:	01c010ef          	jal	941c <__i2b>
    8404:	00a12c23          	sw	a0,24(sp)
    8408:	50099a63          	bnez	s3,891c <_dtoa_r+0xfa0>
    840c:	00100793          	li	a5,1
    8410:	5547da63          	bge	a5,s4,8964 <_dtoa_r+0xfe8>
    8414:	016787b3          	add	a5,a5,s6
    8418:	01f7f793          	and	a5,a5,31
    841c:	1c078e63          	beqz	a5,85f8 <_dtoa_r+0xc7c>
    8420:	02000713          	li	a4,32
    8424:	40f70733          	sub	a4,a4,a5
    8428:	00400693          	li	a3,4
    842c:	58e6d263          	bge	a3,a4,89b0 <_dtoa_r+0x1034>
    8430:	01c00713          	li	a4,28
    8434:	40f707b3          	sub	a5,a4,a5
    8438:	01012703          	lw	a4,16(sp)
    843c:	00fc8cb3          	add	s9,s9,a5
    8440:	00fb0b33          	add	s6,s6,a5
    8444:	00f70733          	add	a4,a4,a5
    8448:	00e12823          	sw	a4,16(sp)
    844c:	01012783          	lw	a5,16(sp)
    8450:	12f04e63          	bgtz	a5,858c <_dtoa_r+0xc10>
    8454:	01605c63          	blez	s6,846c <_dtoa_r+0xaf0>
    8458:	01812583          	lw	a1,24(sp)
    845c:	000b0613          	mv	a2,s6
    8460:	00040513          	mv	a0,s0
    8464:	480010ef          	jal	98e4 <__lshift>
    8468:	00a12c23          	sw	a0,24(sp)
    846c:	03412783          	lw	a5,52(sp)
    8470:	12079a63          	bnez	a5,85a4 <_dtoa_r+0xc28>
    8474:	45805263          	blez	s8,88b8 <_dtoa_r+0xf3c>
    8478:	02812783          	lw	a5,40(sp)
    847c:	24079e63          	bnez	a5,86d8 <_dtoa_r+0xd5c>
    8480:	02012783          	lw	a5,32(sp)
    8484:	00178a13          	add	s4,a5,1
    8488:	01812b03          	lw	s6,24(sp)
    848c:	00100993          	li	s3,1
    8490:	0200006f          	j	84b0 <_dtoa_r+0xb34>
    8494:	00048593          	mv	a1,s1
    8498:	00000693          	li	a3,0
    849c:	00a00613          	li	a2,10
    84a0:	00040513          	mv	a0,s0
    84a4:	49d000ef          	jal	9140 <__multadd>
    84a8:	00050493          	mv	s1,a0
    84ac:	00198993          	add	s3,s3,1
    84b0:	000b0593          	mv	a1,s6
    84b4:	00048513          	mv	a0,s1
    84b8:	a64ff0ef          	jal	771c <quorem>
    84bc:	03050b93          	add	s7,a0,48
    84c0:	013a87b3          	add	a5,s5,s3
    84c4:	ff778fa3          	sb	s7,-1(a5)
    84c8:	fd89c6e3          	blt	s3,s8,8494 <_dtoa_r+0xb18>
    84cc:	00100993          	li	s3,1
    84d0:	55804263          	bgtz	s8,8a14 <_dtoa_r+0x1098>
    84d4:	013a89b3          	add	s3,s5,s3
    84d8:	00000c13          	li	s8,0
    84dc:	00048593          	mv	a1,s1
    84e0:	00100613          	li	a2,1
    84e4:	00040513          	mv	a0,s0
    84e8:	3fc010ef          	jal	98e4 <__lshift>
    84ec:	01812583          	lw	a1,24(sp)
    84f0:	00050493          	mv	s1,a0
    84f4:	580010ef          	jal	9a74 <__mcmp>
    84f8:	4ea05c63          	blez	a0,89f0 <_dtoa_r+0x1074>
    84fc:	03900693          	li	a3,57
    8500:	0080006f          	j	8508 <_dtoa_r+0xb8c>
    8504:	5f3a8863          	beq	s5,s3,8af4 <_dtoa_r+0x1178>
    8508:	fff9c783          	lbu	a5,-1(s3)
    850c:	00098d13          	mv	s10,s3
    8510:	fff98993          	add	s3,s3,-1
    8514:	fed788e3          	beq	a5,a3,8504 <_dtoa_r+0xb88>
    8518:	00178793          	add	a5,a5,1
    851c:	00f98023          	sb	a5,0(s3)
    8520:	01812583          	lw	a1,24(sp)
    8524:	00040513          	mv	a0,s0
    8528:	3f5000ef          	jal	911c <_Bfree>
    852c:	02090263          	beqz	s2,8550 <_dtoa_r+0xbd4>
    8530:	000c0a63          	beqz	s8,8544 <_dtoa_r+0xbc8>
    8534:	012c0863          	beq	s8,s2,8544 <_dtoa_r+0xbc8>
    8538:	000c0593          	mv	a1,s8
    853c:	00040513          	mv	a0,s0
    8540:	3dd000ef          	jal	911c <_Bfree>
    8544:	00090593          	mv	a1,s2
    8548:	00040513          	mv	a0,s0
    854c:	3d1000ef          	jal	911c <_Bfree>
    8550:	00048593          	mv	a1,s1
    8554:	00040513          	mv	a0,s0
    8558:	3c5000ef          	jal	911c <_Bfree>
    855c:	00c12783          	lw	a5,12(sp)
    8560:	000d0023          	sb	zero,0(s10)
    8564:	0147a023          	sw	s4,0(a5)
    8568:	00812783          	lw	a5,8(sp)
    856c:	00078463          	beqz	a5,8574 <_dtoa_r+0xbf8>
    8570:	01a7a023          	sw	s10,0(a5)
    8574:	09012b03          	lw	s6,144(sp)
    8578:	08c12b83          	lw	s7,140(sp)
    857c:	08812c03          	lw	s8,136(sp)
    8580:	08412c83          	lw	s9,132(sp)
    8584:	08012d03          	lw	s10,128(sp)
    8588:	ce4ff06f          	j	7a6c <_dtoa_r+0xf0>
    858c:	00048593          	mv	a1,s1
    8590:	00078613          	mv	a2,a5
    8594:	00040513          	mv	a0,s0
    8598:	34c010ef          	jal	98e4 <__lshift>
    859c:	00050493          	mv	s1,a0
    85a0:	eb5ff06f          	j	8454 <_dtoa_r+0xad8>
    85a4:	01812583          	lw	a1,24(sp)
    85a8:	00048513          	mv	a0,s1
    85ac:	4c8010ef          	jal	9a74 <__mcmp>
    85b0:	ec0552e3          	bgez	a0,8474 <_dtoa_r+0xaf8>
    85b4:	02012783          	lw	a5,32(sp)
    85b8:	00048593          	mv	a1,s1
    85bc:	00000693          	li	a3,0
    85c0:	00a00613          	li	a2,10
    85c4:	00040513          	mv	a0,s0
    85c8:	fff78b13          	add	s6,a5,-1
    85cc:	375000ef          	jal	9140 <__multadd>
    85d0:	02812783          	lw	a5,40(sp)
    85d4:	00050493          	mv	s1,a0
    85d8:	0c079e63          	bnez	a5,86b4 <_dtoa_r+0xd38>
    85dc:	03c12c03          	lw	s8,60(sp)
    85e0:	17805ee3          	blez	s8,8f5c <_dtoa_r+0x15e0>
    85e4:	02012a03          	lw	s4,32(sp)
    85e8:	ea1ff06f          	j	8488 <_dtoa_r+0xb0c>
    85ec:	00100793          	li	a5,1
    85f0:	02f12a23          	sw	a5,52(sp)
    85f4:	e28ff06f          	j	7c1c <_dtoa_r+0x2a0>
    85f8:	01c00793          	li	a5,28
    85fc:	e3dff06f          	j	8438 <_dtoa_r+0xabc>
    8600:	00100713          	li	a4,1
    8604:	4d475463          	bge	a4,s4,8acc <_dtoa_r+0x1150>
    8608:	03012783          	lw	a5,48(sp)
    860c:	fffc0b93          	add	s7,s8,-1
    8610:	4177ca63          	blt	a5,s7,8a24 <_dtoa_r+0x10a8>
    8614:	41778bb3          	sub	s7,a5,s7
    8618:	01012783          	lw	a5,16(sp)
    861c:	41878cb3          	sub	s9,a5,s8
    8620:	100c54e3          	bgez	s8,8f28 <_dtoa_r+0x15ac>
    8624:	00100593          	li	a1,1
    8628:	00040513          	mv	a0,s0
    862c:	5f1000ef          	jal	941c <__i2b>
    8630:	00050913          	mv	s2,a0
    8634:	d79ff06f          	j	83ac <_dtoa_r+0xa30>
    8638:	02012a23          	sw	zero,52(sp)
    863c:	00012823          	sw	zero,16(sp)
    8640:	ab5042e3          	bgtz	s5,80e4 <_dtoa_r+0x768>
    8644:	00100793          	li	a5,1
    8648:	415787b3          	sub	a5,a5,s5
    864c:	00f12823          	sw	a5,16(sp)
    8650:	00000b13          	li	s6,0
    8654:	a91ff06f          	j	80e4 <_dtoa_r+0x768>
    8658:	40e787b3          	sub	a5,a5,a4
    865c:	00fd9533          	sll	a0,s11,a5
    8660:	ca0ff06f          	j	7b00 <_dtoa_r+0x184>
    8664:	00300793          	li	a5,3
    8668:	00100913          	li	s2,1
    866c:	44fa0c63          	beq	s4,a5,8ac4 <_dtoa_r+0x1148>
    8670:	df47cc63          	blt	a5,s4,7c68 <_dtoa_r+0x2ec>
    8674:	00200793          	li	a5,2
    8678:	18fa00e3          	beq	s4,a5,8ff8 <_dtoa_r+0x167c>
    867c:	02042e23          	sw	zero,60(s0)
    8680:	00000593          	li	a1,0
    8684:	00040513          	mv	a0,s0
    8688:	1e1000ef          	jal	9068 <_Balloc>
    868c:	00050a93          	mv	s5,a0
    8690:	140500e3          	beqz	a0,8fd0 <_dtoa_r+0x1654>
    8694:	00100793          	li	a5,1
    8698:	02f12423          	sw	a5,40(sp)
    869c:	fff00793          	li	a5,-1
    86a0:	02a42c23          	sw	a0,56(s0)
    86a4:	02f12e23          	sw	a5,60(sp)
    86a8:	fff00c13          	li	s8,-1
    86ac:	00012a23          	sw	zero,20(sp)
    86b0:	b35ff06f          	j	81e4 <_dtoa_r+0x868>
    86b4:	00090593          	mv	a1,s2
    86b8:	00000693          	li	a3,0
    86bc:	00a00613          	li	a2,10
    86c0:	00040513          	mv	a0,s0
    86c4:	27d000ef          	jal	9140 <__multadd>
    86c8:	03c12c03          	lw	s8,60(sp)
    86cc:	00050913          	mv	s2,a0
    86d0:	0b805ae3          	blez	s8,8f84 <_dtoa_r+0x1608>
    86d4:	03612023          	sw	s6,32(sp)
    86d8:	01905c63          	blez	s9,86f0 <_dtoa_r+0xd74>
    86dc:	00090593          	mv	a1,s2
    86e0:	000c8613          	mv	a2,s9
    86e4:	00040513          	mv	a0,s0
    86e8:	1fc010ef          	jal	98e4 <__lshift>
    86ec:	00050913          	mv	s2,a0
    86f0:	00090b13          	mv	s6,s2
    86f4:	50099e63          	bnez	s3,8c10 <_dtoa_r+0x1294>
    86f8:	02412783          	lw	a5,36(sp)
    86fc:	fffa8d13          	add	s10,s5,-1
    8700:	000a8c93          	mv	s9,s5
    8704:	01512823          	sw	s5,16(sp)
    8708:	01812a83          	lw	s5,24(sp)
    870c:	0017f793          	and	a5,a5,1
    8710:	018d0d33          	add	s10,s10,s8
    8714:	00f12023          	sw	a5,0(sp)
    8718:	01b12a23          	sw	s11,20(sp)
    871c:	000a8593          	mv	a1,s5
    8720:	00048513          	mv	a0,s1
    8724:	ff9fe0ef          	jal	771c <quorem>
    8728:	00050c13          	mv	s8,a0
    872c:	00090593          	mv	a1,s2
    8730:	00048513          	mv	a0,s1
    8734:	340010ef          	jal	9a74 <__mcmp>
    8738:	00050993          	mv	s3,a0
    873c:	000b0613          	mv	a2,s6
    8740:	000a8593          	mv	a1,s5
    8744:	00040513          	mv	a0,s0
    8748:	384010ef          	jal	9acc <__mdiff>
    874c:	00c52703          	lw	a4,12(a0)
    8750:	030c0b93          	add	s7,s8,48
    8754:	00050d93          	mv	s11,a0
    8758:	08071c63          	bnez	a4,87f0 <_dtoa_r+0xe74>
    875c:	00050593          	mv	a1,a0
    8760:	00048513          	mv	a0,s1
    8764:	310010ef          	jal	9a74 <__mcmp>
    8768:	00050713          	mv	a4,a0
    876c:	000d8593          	mv	a1,s11
    8770:	00040513          	mv	a0,s0
    8774:	00070d93          	mv	s11,a4
    8778:	1a5000ef          	jal	911c <_Bfree>
    877c:	014de6b3          	or	a3,s11,s4
    8780:	0e069a63          	bnez	a3,8874 <_dtoa_r+0xef8>
    8784:	00012783          	lw	a5,0(sp)
    8788:	76078e63          	beqz	a5,8f04 <_dtoa_r+0x1588>
    878c:	7809c663          	bltz	s3,8f18 <_dtoa_r+0x159c>
    8790:	017c8023          	sb	s7,0(s9)
    8794:	001c8993          	add	s3,s9,1
    8798:	679d0e63          	beq	s10,s9,8e14 <_dtoa_r+0x1498>
    879c:	00048593          	mv	a1,s1
    87a0:	00000693          	li	a3,0
    87a4:	00a00613          	li	a2,10
    87a8:	00040513          	mv	a0,s0
    87ac:	195000ef          	jal	9140 <__multadd>
    87b0:	00050493          	mv	s1,a0
    87b4:	00000693          	li	a3,0
    87b8:	00a00613          	li	a2,10
    87bc:	00090593          	mv	a1,s2
    87c0:	00040513          	mv	a0,s0
    87c4:	09690e63          	beq	s2,s6,8860 <_dtoa_r+0xee4>
    87c8:	179000ef          	jal	9140 <__multadd>
    87cc:	000b0593          	mv	a1,s6
    87d0:	00050913          	mv	s2,a0
    87d4:	00000693          	li	a3,0
    87d8:	00a00613          	li	a2,10
    87dc:	00040513          	mv	a0,s0
    87e0:	161000ef          	jal	9140 <__multadd>
    87e4:	00050b13          	mv	s6,a0
    87e8:	00098c93          	mv	s9,s3
    87ec:	f31ff06f          	j	871c <_dtoa_r+0xda0>
    87f0:	00050593          	mv	a1,a0
    87f4:	00040513          	mv	a0,s0
    87f8:	01012a83          	lw	s5,16(sp)
    87fc:	01412d83          	lw	s11,20(sp)
    8800:	11d000ef          	jal	911c <_Bfree>
    8804:	0009ca63          	bltz	s3,8818 <_dtoa_r+0xe9c>
    8808:	001df713          	and	a4,s11,1
    880c:	0149e9b3          	or	s3,s3,s4
    8810:	01376733          	or	a4,a4,s3
    8814:	06071e63          	bnez	a4,8890 <_dtoa_r+0xf14>
    8818:	00048593          	mv	a1,s1
    881c:	00100613          	li	a2,1
    8820:	00040513          	mv	a0,s0
    8824:	0c0010ef          	jal	98e4 <__lshift>
    8828:	01812583          	lw	a1,24(sp)
    882c:	00050493          	mv	s1,a0
    8830:	244010ef          	jal	9a74 <__mcmp>
    8834:	24a05863          	blez	a0,8a84 <_dtoa_r+0x1108>
    8838:	03900713          	li	a4,57
    883c:	24eb8c63          	beq	s7,a4,8a94 <_dtoa_r+0x1118>
    8840:	031c0b93          	add	s7,s8,49
    8844:	02012783          	lw	a5,32(sp)
    8848:	00090c13          	mv	s8,s2
    884c:	001c8d13          	add	s10,s9,1
    8850:	017c8023          	sb	s7,0(s9)
    8854:	00178a13          	add	s4,a5,1
    8858:	000b0913          	mv	s2,s6
    885c:	cc5ff06f          	j	8520 <_dtoa_r+0xba4>
    8860:	0e1000ef          	jal	9140 <__multadd>
    8864:	00050913          	mv	s2,a0
    8868:	00050b13          	mv	s6,a0
    886c:	00098c93          	mv	s9,s3
    8870:	eadff06f          	j	871c <_dtoa_r+0xda0>
    8874:	7409c863          	bltz	s3,8fc4 <_dtoa_r+0x1648>
    8878:	00012783          	lw	a5,0(sp)
    887c:	0149e9b3          	or	s3,s3,s4
    8880:	0137e9b3          	or	s3,a5,s3
    8884:	74098063          	beqz	s3,8fc4 <_dtoa_r+0x1648>
    8888:	f1b054e3          	blez	s11,8790 <_dtoa_r+0xe14>
    888c:	01012a83          	lw	s5,16(sp)
    8890:	03900713          	li	a4,57
    8894:	20eb8063          	beq	s7,a4,8a94 <_dtoa_r+0x1118>
    8898:	02012703          	lw	a4,32(sp)
    889c:	001b8793          	add	a5,s7,1
    88a0:	00090c13          	mv	s8,s2
    88a4:	001c8d13          	add	s10,s9,1
    88a8:	00170a13          	add	s4,a4,1
    88ac:	00fc8023          	sb	a5,0(s9)
    88b0:	000b0913          	mv	s2,s6
    88b4:	c6dff06f          	j	8520 <_dtoa_r+0xba4>
    88b8:	00200793          	li	a5,2
    88bc:	bb47dee3          	bge	a5,s4,8478 <_dtoa_r+0xafc>
    88c0:	000a8d13          	mv	s10,s5
    88c4:	9a0c10e3          	bnez	s8,8264 <_dtoa_r+0x8e8>
    88c8:	01812583          	lw	a1,24(sp)
    88cc:	00000693          	li	a3,0
    88d0:	00500613          	li	a2,5
    88d4:	00040513          	mv	a0,s0
    88d8:	069000ef          	jal	9140 <__multadd>
    88dc:	00050593          	mv	a1,a0
    88e0:	00a12c23          	sw	a0,24(sp)
    88e4:	00048513          	mv	a0,s1
    88e8:	18c010ef          	jal	9a74 <__mcmp>
    88ec:	96a05ce3          	blez	a0,8264 <_dtoa_r+0x8e8>
    88f0:	03100793          	li	a5,49
    88f4:	00fa8023          	sb	a5,0(s5)
    88f8:	02012783          	lw	a5,32(sp)
    88fc:	001a8d13          	add	s10,s5,1
    8900:	00178a13          	add	s4,a5,1
    8904:	01812583          	lw	a1,24(sp)
    8908:	00040513          	mv	a0,s0
    890c:	001a0a13          	add	s4,s4,1
    8910:	00d000ef          	jal	911c <_Bfree>
    8914:	c20918e3          	bnez	s2,8544 <_dtoa_r+0xbc8>
    8918:	c39ff06f          	j	8550 <_dtoa_r+0xbd4>
    891c:	00050593          	mv	a1,a0
    8920:	00098613          	mv	a2,s3
    8924:	00040513          	mv	a0,s0
    8928:	66d000ef          	jal	9794 <__pow5mult>
    892c:	00100793          	li	a5,1
    8930:	00a12c23          	sw	a0,24(sp)
    8934:	1147de63          	bge	a5,s4,8a50 <_dtoa_r+0x10d4>
    8938:	00000993          	li	s3,0
    893c:	01812703          	lw	a4,24(sp)
    8940:	01072783          	lw	a5,16(a4)
    8944:	00378793          	add	a5,a5,3
    8948:	00279793          	sll	a5,a5,0x2
    894c:	00f707b3          	add	a5,a4,a5
    8950:	0047a503          	lw	a0,4(a5)
    8954:	171000ef          	jal	92c4 <__hi0bits>
    8958:	02000793          	li	a5,32
    895c:	40a787b3          	sub	a5,a5,a0
    8960:	ab5ff06f          	j	8414 <_dtoa_r+0xa98>
    8964:	02412783          	lw	a5,36(sp)
    8968:	04079063          	bnez	a5,89a8 <_dtoa_r+0x102c>
    896c:	00012783          	lw	a5,0(sp)
    8970:	00c79793          	sll	a5,a5,0xc
    8974:	02079a63          	bnez	a5,89a8 <_dtoa_r+0x102c>
    8978:	00012683          	lw	a3,0(sp)
    897c:	00000793          	li	a5,0
    8980:	0146d713          	srl	a4,a3,0x14
    8984:	7ff77713          	and	a4,a4,2047
    8988:	00070c63          	beqz	a4,89a0 <_dtoa_r+0x1024>
    898c:	01012783          	lw	a5,16(sp)
    8990:	001b0b13          	add	s6,s6,1
    8994:	00178793          	add	a5,a5,1
    8998:	00f12823          	sw	a5,16(sp)
    899c:	00100793          	li	a5,1
    89a0:	58099063          	bnez	s3,8f20 <_dtoa_r+0x15a4>
    89a4:	00078993          	mv	s3,a5
    89a8:	00100793          	li	a5,1
    89ac:	a69ff06f          	j	8414 <_dtoa_r+0xa98>
    89b0:	a8d70ee3          	beq	a4,a3,844c <_dtoa_r+0xad0>
    89b4:	03c00713          	li	a4,60
    89b8:	40f707b3          	sub	a5,a4,a5
    89bc:	a7dff06f          	j	8438 <_dtoa_r+0xabc>
    89c0:	00100793          	li	a5,1
    89c4:	00500a13          	li	s4,5
    89c8:	02f12423          	sw	a5,40(sp)
    89cc:	01412783          	lw	a5,20(sp)
    89d0:	02012703          	lw	a4,32(sp)
    89d4:	00e787b3          	add	a5,a5,a4
    89d8:	00178c13          	add	s8,a5,1
    89dc:	02f12e23          	sw	a5,60(sp)
    89e0:	000c0613          	mv	a2,s8
    89e4:	ab804263          	bgtz	s8,7c88 <_dtoa_r+0x30c>
    89e8:	00100613          	li	a2,1
    89ec:	a9cff06f          	j	7c88 <_dtoa_r+0x30c>
    89f0:	00051663          	bnez	a0,89fc <_dtoa_r+0x1080>
    89f4:	001bf793          	and	a5,s7,1
    89f8:	b00792e3          	bnez	a5,84fc <_dtoa_r+0xb80>
    89fc:	03000693          	li	a3,48
    8a00:	fff9c783          	lbu	a5,-1(s3)
    8a04:	00098d13          	mv	s10,s3
    8a08:	fff98993          	add	s3,s3,-1
    8a0c:	fed78ae3          	beq	a5,a3,8a00 <_dtoa_r+0x1084>
    8a10:	b11ff06f          	j	8520 <_dtoa_r+0xba4>
    8a14:	000c0993          	mv	s3,s8
    8a18:	abdff06f          	j	84d4 <_dtoa_r+0xb58>
    8a1c:	000b0793          	mv	a5,s6
    8a20:	99dff06f          	j	83bc <_dtoa_r+0xa40>
    8a24:	03012783          	lw	a5,48(sp)
    8a28:	01012703          	lw	a4,16(sp)
    8a2c:	03712823          	sw	s7,48(sp)
    8a30:	40fb87b3          	sub	a5,s7,a5
    8a34:	00f989b3          	add	s3,s3,a5
    8a38:	018707b3          	add	a5,a4,s8
    8a3c:	00070c93          	mv	s9,a4
    8a40:	018b0b33          	add	s6,s6,s8
    8a44:	00f12823          	sw	a5,16(sp)
    8a48:	00000b93          	li	s7,0
    8a4c:	bd9ff06f          	j	8624 <_dtoa_r+0xca8>
    8a50:	02412783          	lw	a5,36(sp)
    8a54:	ee0792e3          	bnez	a5,8938 <_dtoa_r+0xfbc>
    8a58:	00012783          	lw	a5,0(sp)
    8a5c:	00c79793          	sll	a5,a5,0xc
    8a60:	ec079ce3          	bnez	a5,8938 <_dtoa_r+0xfbc>
    8a64:	f15ff06f          	j	8978 <_dtoa_r+0xffc>
    8a68:	01812303          	lw	t1,24(sp)
    8a6c:	01c12d03          	lw	s10,28(sp)
    8a70:	00200913          	li	s2,2
    8a74:	ad0ff06f          	j	7d44 <_dtoa_r+0x3c8>
    8a78:	00200a13          	li	s4,2
    8a7c:	02012423          	sw	zero,40(sp)
    8a80:	9f8ff06f          	j	7c78 <_dtoa_r+0x2fc>
    8a84:	dc0510e3          	bnez	a0,8844 <_dtoa_r+0xec8>
    8a88:	001bf713          	and	a4,s7,1
    8a8c:	da0716e3          	bnez	a4,8838 <_dtoa_r+0xebc>
    8a90:	db5ff06f          	j	8844 <_dtoa_r+0xec8>
    8a94:	03900793          	li	a5,57
    8a98:	00fc8023          	sb	a5,0(s9)
    8a9c:	02012783          	lw	a5,32(sp)
    8aa0:	00090c13          	mv	s8,s2
    8aa4:	001c8993          	add	s3,s9,1
    8aa8:	00178a13          	add	s4,a5,1
    8aac:	000b0913          	mv	s2,s6
    8ab0:	a4dff06f          	j	84fc <_dtoa_r+0xb80>
    8ab4:	00100793          	li	a5,1
    8ab8:	00100c13          	li	s8,1
    8abc:	00f12a23          	sw	a5,20(sp)
    8ac0:	e50ff06f          	j	8110 <_dtoa_r+0x794>
    8ac4:	02012423          	sw	zero,40(sp)
    8ac8:	f05ff06f          	j	89cc <_dtoa_r+0x1050>
    8acc:	03812703          	lw	a4,56(sp)
    8ad0:	30070e63          	beqz	a4,8dec <_dtoa_r+0x1470>
    8ad4:	01012703          	lw	a4,16(sp)
    8ad8:	43378793          	add	a5,a5,1075
    8adc:	00fb0b33          	add	s6,s6,a5
    8ae0:	00f707b3          	add	a5,a4,a5
    8ae4:	03012b83          	lw	s7,48(sp)
    8ae8:	00070c93          	mv	s9,a4
    8aec:	00f12823          	sw	a5,16(sp)
    8af0:	b35ff06f          	j	8624 <_dtoa_r+0xca8>
    8af4:	03100793          	li	a5,49
    8af8:	00fa8023          	sb	a5,0(s5)
    8afc:	001a0a13          	add	s4,s4,1
    8b00:	a21ff06f          	j	8520 <_dtoa_r+0xba4>
    8b04:	02012783          	lw	a5,32(sp)
    8b08:	32078263          	beqz	a5,8e2c <_dtoa_r+0x14b0>
    8b0c:	40f00bb3          	neg	s7,a5
    8b10:	00fbf713          	and	a4,s7,15
    8b14:	00371713          	sll	a4,a4,0x3
    8b18:	00006797          	auipc	a5,0x6
    8b1c:	63078793          	add	a5,a5,1584 # f148 <__mprec_tens>
    8b20:	00e787b3          	add	a5,a5,a4
    8b24:	0007a603          	lw	a2,0(a5)
    8b28:	0047a683          	lw	a3,4(a5)
    8b2c:	01812503          	lw	a0,24(sp)
    8b30:	01c12583          	lw	a1,28(sp)
    8b34:	404bdb93          	sra	s7,s7,0x4
    8b38:	564040ef          	jal	d09c <__muldf3>
    8b3c:	00058d13          	mv	s10,a1
    8b40:	440b8c63          	beqz	s7,8f98 <_dtoa_r+0x161c>
    8b44:	00200913          	li	s2,2
    8b48:	04812023          	sw	s0,64(sp)
    8b4c:	00006c97          	auipc	s9,0x6
    8b50:	5d4c8c93          	add	s9,s9,1492 # f120 <__mprec_bigtens>
    8b54:	00090413          	mv	s0,s2
    8b58:	00050713          	mv	a4,a0
    8b5c:	00000613          	li	a2,0
    8b60:	00050913          	mv	s2,a0
    8b64:	001bf693          	and	a3,s7,1
    8b68:	02068063          	beqz	a3,8b88 <_dtoa_r+0x120c>
    8b6c:	000ca603          	lw	a2,0(s9)
    8b70:	004ca683          	lw	a3,4(s9)
    8b74:	00070513          	mv	a0,a4
    8b78:	00140413          	add	s0,s0,1
    8b7c:	520040ef          	jal	d09c <__muldf3>
    8b80:	00050713          	mv	a4,a0
    8b84:	00100613          	li	a2,1
    8b88:	401bdb93          	sra	s7,s7,0x1
    8b8c:	008c8c93          	add	s9,s9,8
    8b90:	fc0b9ae3          	bnez	s7,8b64 <_dtoa_r+0x11e8>
    8b94:	00090513          	mv	a0,s2
    8b98:	00058793          	mv	a5,a1
    8b9c:	00040913          	mv	s2,s0
    8ba0:	04012403          	lw	s0,64(sp)
    8ba4:	a0061a63          	bnez	a2,7db8 <_dtoa_r+0x43c>
    8ba8:	00050713          	mv	a4,a0
    8bac:	000d0793          	mv	a5,s10
    8bb0:	a08ff06f          	j	7db8 <_dtoa_r+0x43c>
    8bb4:	00068593          	mv	a1,a3
    8bb8:	00070613          	mv	a2,a4
    8bbc:	00070513          	mv	a0,a4
    8bc0:	0d4030ef          	jal	bc94 <__adddf3>
    8bc4:	02012783          	lw	a5,32(sp)
    8bc8:	00090613          	mv	a2,s2
    8bcc:	00098693          	mv	a3,s3
    8bd0:	00178a13          	add	s4,a5,1
    8bd4:	00050c93          	mv	s9,a0
    8bd8:	00058b13          	mv	s6,a1
    8bdc:	000a0c13          	mv	s8,s4
    8be0:	2b4040ef          	jal	ce94 <__gedf2>
    8be4:	c4a04863          	bgtz	a0,8034 <_dtoa_r+0x6b8>
    8be8:	000c8513          	mv	a0,s9
    8bec:	000b0593          	mv	a1,s6
    8bf0:	00090613          	mv	a2,s2
    8bf4:	00098693          	mv	a3,s3
    8bf8:	210040ef          	jal	ce08 <__eqdf2>
    8bfc:	00051663          	bnez	a0,8c08 <_dtoa_r+0x128c>
    8c00:	001d7d13          	and	s10,s10,1
    8c04:	c20d1863          	bnez	s10,8034 <_dtoa_r+0x6b8>
    8c08:	000b8d13          	mv	s10,s7
    8c0c:	945ff06f          	j	8550 <_dtoa_r+0xbd4>
    8c10:	00492583          	lw	a1,4(s2)
    8c14:	00040513          	mv	a0,s0
    8c18:	450000ef          	jal	9068 <_Balloc>
    8c1c:	00050993          	mv	s3,a0
    8c20:	38050463          	beqz	a0,8fa8 <_dtoa_r+0x162c>
    8c24:	01092603          	lw	a2,16(s2)
    8c28:	00c90593          	add	a1,s2,12
    8c2c:	00c50513          	add	a0,a0,12
    8c30:	00260613          	add	a2,a2,2
    8c34:	00261613          	sll	a2,a2,0x2
    8c38:	f49f70ef          	jal	b80 <memcpy>
    8c3c:	00100613          	li	a2,1
    8c40:	00098593          	mv	a1,s3
    8c44:	00040513          	mv	a0,s0
    8c48:	49d000ef          	jal	98e4 <__lshift>
    8c4c:	00050b13          	mv	s6,a0
    8c50:	aa9ff06f          	j	86f8 <_dtoa_r+0xd7c>
    8c54:	00090593          	mv	a1,s2
    8c58:	000b8613          	mv	a2,s7
    8c5c:	00040513          	mv	a0,s0
    8c60:	335000ef          	jal	9794 <__pow5mult>
    8c64:	00048613          	mv	a2,s1
    8c68:	00050593          	mv	a1,a0
    8c6c:	00050913          	mv	s2,a0
    8c70:	00040513          	mv	a0,s0
    8c74:	059000ef          	jal	94cc <__multiply>
    8c78:	00050793          	mv	a5,a0
    8c7c:	00048593          	mv	a1,s1
    8c80:	00040513          	mv	a0,s0
    8c84:	00078493          	mv	s1,a5
    8c88:	494000ef          	jal	911c <_Bfree>
    8c8c:	03012783          	lw	a5,48(sp)
    8c90:	417787b3          	sub	a5,a5,s7
    8c94:	02f12823          	sw	a5,48(sp)
    8c98:	f6078063          	beqz	a5,83f8 <_dtoa_r+0xa7c>
    8c9c:	f48ff06f          	j	83e4 <_dtoa_r+0xa68>
    8ca0:	05012603          	lw	a2,80(sp)
    8ca4:	05412683          	lw	a3,84(sp)
    8ca8:	05812503          	lw	a0,88(sp)
    8cac:	04b12623          	sw	a1,76(sp)
    8cb0:	000b8593          	mv	a1,s7
    8cb4:	02612423          	sw	t1,40(sp)
    8cb8:	3e4040ef          	jal	d09c <__muldf3>
    8cbc:	02812303          	lw	t1,40(sp)
    8cc0:	04812783          	lw	a5,72(sp)
    8cc4:	00100693          	li	a3,1
    8cc8:	006a8023          	sb	t1,0(s5)
    8ccc:	02a12c23          	sw	a0,56(sp)
    8cd0:	04c12883          	lw	a7,76(sp)
    8cd4:	00058913          	mv	s2,a1
    8cd8:	00fa8bb3          	add	s7,s5,a5
    8cdc:	7fff8617          	auipc	a2,0x7fff8
    8ce0:	a1460613          	add	a2,a2,-1516 # 800006f0 <__global_locale+0x1bc>
    8ce4:	28d78c63          	beq	a5,a3,8f7c <_dtoa_r+0x1600>
    8ce8:	00062783          	lw	a5,0(a2)
    8cec:	00462803          	lw	a6,4(a2)
    8cf0:	04912423          	sw	s1,72(sp)
    8cf4:	02f12423          	sw	a5,40(sp)
    8cf8:	03012623          	sw	a6,44(sp)
    8cfc:	04812623          	sw	s0,76(sp)
    8d00:	000c8513          	mv	a0,s9
    8d04:	00088593          	mv	a1,a7
    8d08:	02812603          	lw	a2,40(sp)
    8d0c:	02c12683          	lw	a3,44(sp)
    8d10:	001d0d13          	add	s10,s10,1
    8d14:	388040ef          	jal	d09c <__muldf3>
    8d18:	00058413          	mv	s0,a1
    8d1c:	00050493          	mv	s1,a0
    8d20:	468050ef          	jal	e188 <__fixdfsi>
    8d24:	00050c93          	mv	s9,a0
    8d28:	4e4050ef          	jal	e20c <__floatsidf>
    8d2c:	00050613          	mv	a2,a0
    8d30:	00058693          	mv	a3,a1
    8d34:	00048513          	mv	a0,s1
    8d38:	00040593          	mv	a1,s0
    8d3c:	030c8c93          	add	s9,s9,48
    8d40:	2ed040ef          	jal	d82c <__subdf3>
    8d44:	ff9d0fa3          	sb	s9,-1(s10)
    8d48:	fdab90e3          	bne	s7,s10,8d08 <_dtoa_r+0x138c>
    8d4c:	04812483          	lw	s1,72(sp)
    8d50:	04c12403          	lw	s0,76(sp)
    8d54:	00050c93          	mv	s9,a0
    8d58:	00058893          	mv	a7,a1
    8d5c:	7fff8d17          	auipc	s10,0x7fff8
    8d60:	95cd0d13          	add	s10,s10,-1700 # 800006b8 <__global_locale+0x184>
    8d64:	000d2603          	lw	a2,0(s10)
    8d68:	004d2683          	lw	a3,4(s10)
    8d6c:	03812503          	lw	a0,56(sp)
    8d70:	00090593          	mv	a1,s2
    8d74:	03112423          	sw	a7,40(sp)
    8d78:	71d020ef          	jal	bc94 <__adddf3>
    8d7c:	02812883          	lw	a7,40(sp)
    8d80:	000c8613          	mv	a2,s9
    8d84:	00088693          	mv	a3,a7
    8d88:	20c040ef          	jal	cf94 <__ledf2>
    8d8c:	1a054863          	bltz	a0,8f3c <_dtoa_r+0x15c0>
    8d90:	03812603          	lw	a2,56(sp)
    8d94:	000d2503          	lw	a0,0(s10)
    8d98:	004d2583          	lw	a1,4(s10)
    8d9c:	00090693          	mv	a3,s2
    8da0:	28d040ef          	jal	d82c <__subdf3>
    8da4:	02812883          	lw	a7,40(sp)
    8da8:	000c8613          	mv	a2,s9
    8dac:	00088693          	mv	a3,a7
    8db0:	0e4040ef          	jal	ce94 <__gedf2>
    8db4:	12a04863          	bgtz	a0,8ee4 <_dtoa_r+0x1568>
    8db8:	06c12783          	lw	a5,108(sp)
    8dbc:	de07c063          	bltz	a5,839c <_dtoa_r+0xa20>
    8dc0:	02012703          	lw	a4,32(sp)
    8dc4:	00e00793          	li	a5,14
    8dc8:	dce7ca63          	blt	a5,a4,839c <_dtoa_r+0xa20>
    8dcc:	02012783          	lw	a5,32(sp)
    8dd0:	00006717          	auipc	a4,0x6
    8dd4:	37870713          	add	a4,a4,888 # f148 <__mprec_tens>
    8dd8:	00379793          	sll	a5,a5,0x3
    8ddc:	00f707b3          	add	a5,a4,a5
    8de0:	0007a903          	lw	s2,0(a5)
    8de4:	0047a983          	lw	s3,4(a5)
    8de8:	c90ff06f          	j	8278 <_dtoa_r+0x8fc>
    8dec:	06812703          	lw	a4,104(sp)
    8df0:	01012683          	lw	a3,16(sp)
    8df4:	03600793          	li	a5,54
    8df8:	40e787b3          	sub	a5,a5,a4
    8dfc:	00fb0b33          	add	s6,s6,a5
    8e00:	00f687b3          	add	a5,a3,a5
    8e04:	03012b83          	lw	s7,48(sp)
    8e08:	00068c93          	mv	s9,a3
    8e0c:	00f12823          	sw	a5,16(sp)
    8e10:	815ff06f          	j	8624 <_dtoa_r+0xca8>
    8e14:	02012783          	lw	a5,32(sp)
    8e18:	00090c13          	mv	s8,s2
    8e1c:	01012a83          	lw	s5,16(sp)
    8e20:	00178a13          	add	s4,a5,1
    8e24:	000b0913          	mv	s2,s6
    8e28:	eb4ff06f          	j	84dc <_dtoa_r+0xb60>
    8e2c:	01812703          	lw	a4,24(sp)
    8e30:	01c12783          	lw	a5,28(sp)
    8e34:	00200913          	li	s2,2
    8e38:	f81fe06f          	j	7db8 <_dtoa_r+0x43c>
    8e3c:	b00c0063          	beqz	s8,813c <_dtoa_r+0x7c0>
    8e40:	03c12d03          	lw	s10,60(sp)
    8e44:	bba05063          	blez	s10,81e4 <_dtoa_r+0x868>
    8e48:	7fff8617          	auipc	a2,0x7fff8
    8e4c:	8a860613          	add	a2,a2,-1880 # 800006f0 <__global_locale+0x1bc>
    8e50:	00078593          	mv	a1,a5
    8e54:	02012783          	lw	a5,32(sp)
    8e58:	00462683          	lw	a3,4(a2)
    8e5c:	00062603          	lw	a2,0(a2)
    8e60:	fff78793          	add	a5,a5,-1
    8e64:	00070513          	mv	a0,a4
    8e68:	04f12e23          	sw	a5,92(sp)
    8e6c:	230040ef          	jal	d09c <__muldf3>
    8e70:	00050713          	mv	a4,a0
    8e74:	00190513          	add	a0,s2,1
    8e78:	04e12423          	sw	a4,72(sp)
    8e7c:	04b12023          	sw	a1,64(sp)
    8e80:	38c050ef          	jal	e20c <__floatsidf>
    8e84:	04812703          	lw	a4,72(sp)
    8e88:	04012783          	lw	a5,64(sp)
    8e8c:	00070613          	mv	a2,a4
    8e90:	00078693          	mv	a3,a5
    8e94:	04e12623          	sw	a4,76(sp)
    8e98:	204040ef          	jal	d09c <__muldf3>
    8e9c:	7fff8697          	auipc	a3,0x7fff8
    8ea0:	85c68693          	add	a3,a3,-1956 # 800006f8 <__global_locale+0x1c4>
    8ea4:	0006a603          	lw	a2,0(a3)
    8ea8:	0046a683          	lw	a3,4(a3)
    8eac:	5e9020ef          	jal	bc94 <__adddf3>
    8eb0:	fcc006b7          	lui	a3,0xfcc00
    8eb4:	04012783          	lw	a5,64(sp)
    8eb8:	04c12703          	lw	a4,76(sp)
    8ebc:	00050c93          	mv	s9,a0
    8ec0:	00b68bb3          	add	s7,a3,a1
    8ec4:	05a12423          	sw	s10,72(sp)
    8ec8:	f91fe06f          	j	7e58 <_dtoa_r+0x4dc>
    8ecc:	03100693          	li	a3,49
    8ed0:	001c0c13          	add	s8,s8,1
    8ed4:	984ff06f          	j	8058 <_dtoa_r+0x6dc>
    8ed8:	00012c23          	sw	zero,24(sp)
    8edc:	00000913          	li	s2,0
    8ee0:	a11ff06f          	j	88f0 <_dtoa_r+0xf74>
    8ee4:	03000613          	li	a2,48
    8ee8:	fffbc783          	lbu	a5,-1(s7)
    8eec:	000b8d13          	mv	s10,s7
    8ef0:	fffb8b93          	add	s7,s7,-1
    8ef4:	fec78ae3          	beq	a5,a2,8ee8 <_dtoa_r+0x156c>
    8ef8:	05c12783          	lw	a5,92(sp)
    8efc:	00178a13          	add	s4,a5,1
    8f00:	e50ff06f          	j	8550 <_dtoa_r+0xbd4>
    8f04:	03900713          	li	a4,57
    8f08:	01012a83          	lw	s5,16(sp)
    8f0c:	b8eb84e3          	beq	s7,a4,8a94 <_dtoa_r+0x1118>
    8f10:	933048e3          	bgtz	s3,8840 <_dtoa_r+0xec4>
    8f14:	931ff06f          	j	8844 <_dtoa_r+0xec8>
    8f18:	01012a83          	lw	s5,16(sp)
    8f1c:	929ff06f          	j	8844 <_dtoa_r+0xec8>
    8f20:	00078993          	mv	s3,a5
    8f24:	a19ff06f          	j	893c <_dtoa_r+0xfc0>
    8f28:	00078c93          	mv	s9,a5
    8f2c:	018787b3          	add	a5,a5,s8
    8f30:	018b0b33          	add	s6,s6,s8
    8f34:	00f12823          	sw	a5,16(sp)
    8f38:	eecff06f          	j	8624 <_dtoa_r+0xca8>
    8f3c:	05c12783          	lw	a5,92(sp)
    8f40:	00178c13          	add	s8,a5,1
    8f44:	8f0ff06f          	j	8034 <_dtoa_r+0x6b8>
    8f48:	04c12983          	lw	s3,76(sp)
    8f4c:	05012b03          	lw	s6,80(sp)
    8f50:	05812c03          	lw	s8,88(sp)
    8f54:	04812a03          	lw	s4,72(sp)
    8f58:	a8cff06f          	j	81e4 <_dtoa_r+0x868>
    8f5c:	00200793          	li	a5,2
    8f60:	0147c863          	blt	a5,s4,8f70 <_dtoa_r+0x15f4>
    8f64:	02012a03          	lw	s4,32(sp)
    8f68:	03c12c03          	lw	s8,60(sp)
    8f6c:	d1cff06f          	j	8488 <_dtoa_r+0xb0c>
    8f70:	03c12c03          	lw	s8,60(sp)
    8f74:	03612023          	sw	s6,32(sp)
    8f78:	949ff06f          	j	88c0 <_dtoa_r+0xf44>
    8f7c:	04012b83          	lw	s7,64(sp)
    8f80:	dddff06f          	j	8d5c <_dtoa_r+0x13e0>
    8f84:	00200793          	li	a5,2
    8f88:	ff47c4e3          	blt	a5,s4,8f70 <_dtoa_r+0x15f4>
    8f8c:	03c12c03          	lw	s8,60(sp)
    8f90:	03612023          	sw	s6,32(sp)
    8f94:	f44ff06f          	j	86d8 <_dtoa_r+0xd5c>
    8f98:	00050713          	mv	a4,a0
    8f9c:	00058793          	mv	a5,a1
    8fa0:	00200913          	li	s2,2
    8fa4:	e15fe06f          	j	7db8 <_dtoa_r+0x43c>
    8fa8:	00006697          	auipc	a3,0x6
    8fac:	b6468693          	add	a3,a3,-1180 # eb0c <__fini_array_end+0x1b0>
    8fb0:	00000613          	li	a2,0
    8fb4:	2ef00593          	li	a1,751
    8fb8:	00006517          	auipc	a0,0x6
    8fbc:	b6850513          	add	a0,a0,-1176 # eb20 <__fini_array_end+0x1c4>
    8fc0:	25d010ef          	jal	aa1c <__assert_func>
    8fc4:	01012a83          	lw	s5,16(sp)
    8fc8:	85b048e3          	bgtz	s11,8818 <_dtoa_r+0xe9c>
    8fcc:	879ff06f          	j	8844 <_dtoa_r+0xec8>
    8fd0:	00006697          	auipc	a3,0x6
    8fd4:	b3c68693          	add	a3,a3,-1220 # eb0c <__fini_array_end+0x1b0>
    8fd8:	00000613          	li	a2,0
    8fdc:	1af00593          	li	a1,431
    8fe0:	00006517          	auipc	a0,0x6
    8fe4:	b4050513          	add	a0,a0,-1216 # eb20 <__fini_array_end+0x1c4>
    8fe8:	235010ef          	jal	aa1c <__assert_func>
    8fec:	02042e23          	sw	zero,60(s0)
    8ff0:	00000593          	li	a1,0
    8ff4:	cc1fe06f          	j	7cb4 <_dtoa_r+0x338>
    8ff8:	02012423          	sw	zero,40(sp)
    8ffc:	c7dfe06f          	j	7c78 <_dtoa_r+0x2fc>

00009000 <__ascii_mbtowc>:
    9000:	02058063          	beqz	a1,9020 <__ascii_mbtowc+0x20>
    9004:	04060263          	beqz	a2,9048 <__ascii_mbtowc+0x48>
    9008:	04068863          	beqz	a3,9058 <__ascii_mbtowc+0x58>
    900c:	00064783          	lbu	a5,0(a2)
    9010:	00f5a023          	sw	a5,0(a1)
    9014:	00064503          	lbu	a0,0(a2)
    9018:	00a03533          	snez	a0,a0
    901c:	00008067          	ret
    9020:	ff010113          	add	sp,sp,-16
    9024:	00c10593          	add	a1,sp,12
    9028:	02060463          	beqz	a2,9050 <__ascii_mbtowc+0x50>
    902c:	02068a63          	beqz	a3,9060 <__ascii_mbtowc+0x60>
    9030:	00064783          	lbu	a5,0(a2)
    9034:	00f5a023          	sw	a5,0(a1)
    9038:	00064503          	lbu	a0,0(a2)
    903c:	00a03533          	snez	a0,a0
    9040:	01010113          	add	sp,sp,16
    9044:	00008067          	ret
    9048:	00000513          	li	a0,0
    904c:	00008067          	ret
    9050:	00000513          	li	a0,0
    9054:	fedff06f          	j	9040 <__ascii_mbtowc+0x40>
    9058:	ffe00513          	li	a0,-2
    905c:	00008067          	ret
    9060:	ffe00513          	li	a0,-2
    9064:	fddff06f          	j	9040 <__ascii_mbtowc+0x40>

00009068 <_Balloc>:
    9068:	04452783          	lw	a5,68(a0)
    906c:	ff010113          	add	sp,sp,-16
    9070:	00812423          	sw	s0,8(sp)
    9074:	00912223          	sw	s1,4(sp)
    9078:	00112623          	sw	ra,12(sp)
    907c:	00050413          	mv	s0,a0
    9080:	00058493          	mv	s1,a1
    9084:	02078c63          	beqz	a5,90bc <_Balloc+0x54>
    9088:	00249713          	sll	a4,s1,0x2
    908c:	00e787b3          	add	a5,a5,a4
    9090:	0007a503          	lw	a0,0(a5)
    9094:	04050463          	beqz	a0,90dc <_Balloc+0x74>
    9098:	00052703          	lw	a4,0(a0)
    909c:	00e7a023          	sw	a4,0(a5)
    90a0:	00052823          	sw	zero,16(a0)
    90a4:	00052623          	sw	zero,12(a0)
    90a8:	00c12083          	lw	ra,12(sp)
    90ac:	00812403          	lw	s0,8(sp)
    90b0:	00412483          	lw	s1,4(sp)
    90b4:	01010113          	add	sp,sp,16
    90b8:	00008067          	ret
    90bc:	02100613          	li	a2,33
    90c0:	00400593          	li	a1,4
    90c4:	1b1010ef          	jal	aa74 <_calloc_r>
    90c8:	04a42223          	sw	a0,68(s0)
    90cc:	00050793          	mv	a5,a0
    90d0:	fa051ce3          	bnez	a0,9088 <_Balloc+0x20>
    90d4:	00000513          	li	a0,0
    90d8:	fd1ff06f          	j	90a8 <_Balloc+0x40>
    90dc:	01212023          	sw	s2,0(sp)
    90e0:	00100913          	li	s2,1
    90e4:	00991933          	sll	s2,s2,s1
    90e8:	00590613          	add	a2,s2,5
    90ec:	00261613          	sll	a2,a2,0x2
    90f0:	00100593          	li	a1,1
    90f4:	00040513          	mv	a0,s0
    90f8:	17d010ef          	jal	aa74 <_calloc_r>
    90fc:	00050a63          	beqz	a0,9110 <_Balloc+0xa8>
    9100:	01252423          	sw	s2,8(a0)
    9104:	00952223          	sw	s1,4(a0)
    9108:	00012903          	lw	s2,0(sp)
    910c:	f95ff06f          	j	90a0 <_Balloc+0x38>
    9110:	00012903          	lw	s2,0(sp)
    9114:	00000513          	li	a0,0
    9118:	f91ff06f          	j	90a8 <_Balloc+0x40>

0000911c <_Bfree>:
    911c:	02058063          	beqz	a1,913c <_Bfree+0x20>
    9120:	0045a703          	lw	a4,4(a1)
    9124:	04452783          	lw	a5,68(a0)
    9128:	00271713          	sll	a4,a4,0x2
    912c:	00e787b3          	add	a5,a5,a4
    9130:	0007a703          	lw	a4,0(a5)
    9134:	00e5a023          	sw	a4,0(a1)
    9138:	00b7a023          	sw	a1,0(a5)
    913c:	00008067          	ret

00009140 <__multadd>:
    9140:	fd010113          	add	sp,sp,-48
    9144:	01412c23          	sw	s4,24(sp)
    9148:	0105aa03          	lw	s4,16(a1)
    914c:	01912223          	sw	s9,4(sp)
    9150:	00010cb7          	lui	s9,0x10
    9154:	02912223          	sw	s1,36(sp)
    9158:	03212023          	sw	s2,32(sp)
    915c:	01312e23          	sw	s3,28(sp)
    9160:	01512a23          	sw	s5,20(sp)
    9164:	01612823          	sw	s6,16(sp)
    9168:	01712623          	sw	s7,12(sp)
    916c:	02112623          	sw	ra,44(sp)
    9170:	02812423          	sw	s0,40(sp)
    9174:	01812423          	sw	s8,8(sp)
    9178:	00058a93          	mv	s5,a1
    917c:	00050b13          	mv	s6,a0
    9180:	00060993          	mv	s3,a2
    9184:	00068493          	mv	s1,a3
    9188:	01458913          	add	s2,a1,20
    918c:	00000b93          	li	s7,0
    9190:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    9194:	00092c03          	lw	s8,0(s2)
    9198:	00098593          	mv	a1,s3
    919c:	00490913          	add	s2,s2,4
    91a0:	019c7533          	and	a0,s8,s9
    91a4:	5c0050ef          	jal	e764 <__mulsi3>
    91a8:	00050413          	mv	s0,a0
    91ac:	00098593          	mv	a1,s3
    91b0:	010c5513          	srl	a0,s8,0x10
    91b4:	00940433          	add	s0,s0,s1
    91b8:	5ac050ef          	jal	e764 <__mulsi3>
    91bc:	01045793          	srl	a5,s0,0x10
    91c0:	00f50533          	add	a0,a0,a5
    91c4:	01051793          	sll	a5,a0,0x10
    91c8:	01947433          	and	s0,s0,s9
    91cc:	008787b3          	add	a5,a5,s0
    91d0:	fef92e23          	sw	a5,-4(s2)
    91d4:	001b8b93          	add	s7,s7,1
    91d8:	01055493          	srl	s1,a0,0x10
    91dc:	fb4bcce3          	blt	s7,s4,9194 <__multadd+0x54>
    91e0:	02048263          	beqz	s1,9204 <__multadd+0xc4>
    91e4:	008aa783          	lw	a5,8(s5)
    91e8:	04fa5a63          	bge	s4,a5,923c <__multadd+0xfc>
    91ec:	004a0793          	add	a5,s4,4
    91f0:	00279793          	sll	a5,a5,0x2
    91f4:	00fa87b3          	add	a5,s5,a5
    91f8:	0097a223          	sw	s1,4(a5)
    91fc:	001a0a13          	add	s4,s4,1
    9200:	014aa823          	sw	s4,16(s5)
    9204:	02c12083          	lw	ra,44(sp)
    9208:	02812403          	lw	s0,40(sp)
    920c:	02412483          	lw	s1,36(sp)
    9210:	02012903          	lw	s2,32(sp)
    9214:	01c12983          	lw	s3,28(sp)
    9218:	01812a03          	lw	s4,24(sp)
    921c:	01012b03          	lw	s6,16(sp)
    9220:	00c12b83          	lw	s7,12(sp)
    9224:	00812c03          	lw	s8,8(sp)
    9228:	00412c83          	lw	s9,4(sp)
    922c:	000a8513          	mv	a0,s5
    9230:	01412a83          	lw	s5,20(sp)
    9234:	03010113          	add	sp,sp,48
    9238:	00008067          	ret
    923c:	004aa583          	lw	a1,4(s5)
    9240:	000b0513          	mv	a0,s6
    9244:	00158593          	add	a1,a1,1
    9248:	e21ff0ef          	jal	9068 <_Balloc>
    924c:	00050413          	mv	s0,a0
    9250:	04050c63          	beqz	a0,92a8 <__multadd+0x168>
    9254:	010aa603          	lw	a2,16(s5)
    9258:	00ca8593          	add	a1,s5,12
    925c:	00c50513          	add	a0,a0,12
    9260:	00260613          	add	a2,a2,2
    9264:	00261613          	sll	a2,a2,0x2
    9268:	919f70ef          	jal	b80 <memcpy>
    926c:	004aa703          	lw	a4,4(s5)
    9270:	044b2783          	lw	a5,68(s6)
    9274:	00271713          	sll	a4,a4,0x2
    9278:	00e787b3          	add	a5,a5,a4
    927c:	0007a703          	lw	a4,0(a5)
    9280:	00eaa023          	sw	a4,0(s5)
    9284:	0157a023          	sw	s5,0(a5)
    9288:	004a0793          	add	a5,s4,4
    928c:	00040a93          	mv	s5,s0
    9290:	00279793          	sll	a5,a5,0x2
    9294:	00fa87b3          	add	a5,s5,a5
    9298:	0097a223          	sw	s1,4(a5)
    929c:	001a0a13          	add	s4,s4,1
    92a0:	014aa823          	sw	s4,16(s5)
    92a4:	f61ff06f          	j	9204 <__multadd+0xc4>
    92a8:	00006697          	auipc	a3,0x6
    92ac:	86468693          	add	a3,a3,-1948 # eb0c <__fini_array_end+0x1b0>
    92b0:	00000613          	li	a2,0
    92b4:	0ba00593          	li	a1,186
    92b8:	00006517          	auipc	a0,0x6
    92bc:	8e850513          	add	a0,a0,-1816 # eba0 <__fini_array_end+0x244>
    92c0:	75c010ef          	jal	aa1c <__assert_func>

000092c4 <__hi0bits>:
    92c4:	00050793          	mv	a5,a0
    92c8:	00010737          	lui	a4,0x10
    92cc:	00000513          	li	a0,0
    92d0:	00e7f663          	bgeu	a5,a4,92dc <__hi0bits+0x18>
    92d4:	01079793          	sll	a5,a5,0x10
    92d8:	01000513          	li	a0,16
    92dc:	01000737          	lui	a4,0x1000
    92e0:	00e7f663          	bgeu	a5,a4,92ec <__hi0bits+0x28>
    92e4:	00850513          	add	a0,a0,8
    92e8:	00879793          	sll	a5,a5,0x8
    92ec:	10000737          	lui	a4,0x10000
    92f0:	00e7f663          	bgeu	a5,a4,92fc <__hi0bits+0x38>
    92f4:	00450513          	add	a0,a0,4
    92f8:	00479793          	sll	a5,a5,0x4
    92fc:	40000737          	lui	a4,0x40000
    9300:	00e7ea63          	bltu	a5,a4,9314 <__hi0bits+0x50>
    9304:	fff7c793          	not	a5,a5
    9308:	01f7d793          	srl	a5,a5,0x1f
    930c:	00f50533          	add	a0,a0,a5
    9310:	00008067          	ret
    9314:	00279793          	sll	a5,a5,0x2
    9318:	0007ca63          	bltz	a5,932c <__hi0bits+0x68>
    931c:	00179713          	sll	a4,a5,0x1
    9320:	00074a63          	bltz	a4,9334 <__hi0bits+0x70>
    9324:	02000513          	li	a0,32
    9328:	00008067          	ret
    932c:	00250513          	add	a0,a0,2
    9330:	00008067          	ret
    9334:	00350513          	add	a0,a0,3
    9338:	00008067          	ret

0000933c <__lo0bits>:
    933c:	00052783          	lw	a5,0(a0)
    9340:	00050713          	mv	a4,a0
    9344:	0077f693          	and	a3,a5,7
    9348:	02068463          	beqz	a3,9370 <__lo0bits+0x34>
    934c:	0017f693          	and	a3,a5,1
    9350:	00000513          	li	a0,0
    9354:	04069e63          	bnez	a3,93b0 <__lo0bits+0x74>
    9358:	0027f693          	and	a3,a5,2
    935c:	0a068863          	beqz	a3,940c <__lo0bits+0xd0>
    9360:	0017d793          	srl	a5,a5,0x1
    9364:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9368:	00100513          	li	a0,1
    936c:	00008067          	ret
    9370:	01079693          	sll	a3,a5,0x10
    9374:	0106d693          	srl	a3,a3,0x10
    9378:	00000513          	li	a0,0
    937c:	06068e63          	beqz	a3,93f8 <__lo0bits+0xbc>
    9380:	0ff7f693          	zext.b	a3,a5
    9384:	06068063          	beqz	a3,93e4 <__lo0bits+0xa8>
    9388:	00f7f693          	and	a3,a5,15
    938c:	04068263          	beqz	a3,93d0 <__lo0bits+0x94>
    9390:	0037f693          	and	a3,a5,3
    9394:	02068463          	beqz	a3,93bc <__lo0bits+0x80>
    9398:	0017f693          	and	a3,a5,1
    939c:	00069c63          	bnez	a3,93b4 <__lo0bits+0x78>
    93a0:	0017d793          	srl	a5,a5,0x1
    93a4:	00150513          	add	a0,a0,1
    93a8:	00079663          	bnez	a5,93b4 <__lo0bits+0x78>
    93ac:	02000513          	li	a0,32
    93b0:	00008067          	ret
    93b4:	00f72023          	sw	a5,0(a4)
    93b8:	00008067          	ret
    93bc:	0027d793          	srl	a5,a5,0x2
    93c0:	0017f693          	and	a3,a5,1
    93c4:	00250513          	add	a0,a0,2
    93c8:	fe0696e3          	bnez	a3,93b4 <__lo0bits+0x78>
    93cc:	fd5ff06f          	j	93a0 <__lo0bits+0x64>
    93d0:	0047d793          	srl	a5,a5,0x4
    93d4:	0037f693          	and	a3,a5,3
    93d8:	00450513          	add	a0,a0,4
    93dc:	fa069ee3          	bnez	a3,9398 <__lo0bits+0x5c>
    93e0:	fddff06f          	j	93bc <__lo0bits+0x80>
    93e4:	0087d793          	srl	a5,a5,0x8
    93e8:	00f7f693          	and	a3,a5,15
    93ec:	00850513          	add	a0,a0,8
    93f0:	fa0690e3          	bnez	a3,9390 <__lo0bits+0x54>
    93f4:	fddff06f          	j	93d0 <__lo0bits+0x94>
    93f8:	0107d793          	srl	a5,a5,0x10
    93fc:	0ff7f693          	zext.b	a3,a5
    9400:	01000513          	li	a0,16
    9404:	f80692e3          	bnez	a3,9388 <__lo0bits+0x4c>
    9408:	fddff06f          	j	93e4 <__lo0bits+0xa8>
    940c:	0027d793          	srl	a5,a5,0x2
    9410:	00f72023          	sw	a5,0(a4)
    9414:	00200513          	li	a0,2
    9418:	00008067          	ret

0000941c <__i2b>:
    941c:	04452783          	lw	a5,68(a0)
    9420:	ff010113          	add	sp,sp,-16
    9424:	00812423          	sw	s0,8(sp)
    9428:	00912223          	sw	s1,4(sp)
    942c:	00112623          	sw	ra,12(sp)
    9430:	00050413          	mv	s0,a0
    9434:	00058493          	mv	s1,a1
    9438:	02078c63          	beqz	a5,9470 <__i2b+0x54>
    943c:	0047a503          	lw	a0,4(a5)
    9440:	06050263          	beqz	a0,94a4 <__i2b+0x88>
    9444:	00052703          	lw	a4,0(a0)
    9448:	00e7a223          	sw	a4,4(a5)
    944c:	00c12083          	lw	ra,12(sp)
    9450:	00812403          	lw	s0,8(sp)
    9454:	00100793          	li	a5,1
    9458:	00952a23          	sw	s1,20(a0)
    945c:	00052623          	sw	zero,12(a0)
    9460:	00f52823          	sw	a5,16(a0)
    9464:	00412483          	lw	s1,4(sp)
    9468:	01010113          	add	sp,sp,16
    946c:	00008067          	ret
    9470:	02100613          	li	a2,33
    9474:	00400593          	li	a1,4
    9478:	5fc010ef          	jal	aa74 <_calloc_r>
    947c:	04a42223          	sw	a0,68(s0)
    9480:	00050793          	mv	a5,a0
    9484:	fa051ce3          	bnez	a0,943c <__i2b+0x20>
    9488:	00005697          	auipc	a3,0x5
    948c:	68468693          	add	a3,a3,1668 # eb0c <__fini_array_end+0x1b0>
    9490:	00000613          	li	a2,0
    9494:	14500593          	li	a1,325
    9498:	00005517          	auipc	a0,0x5
    949c:	70850513          	add	a0,a0,1800 # eba0 <__fini_array_end+0x244>
    94a0:	57c010ef          	jal	aa1c <__assert_func>
    94a4:	01c00613          	li	a2,28
    94a8:	00100593          	li	a1,1
    94ac:	00040513          	mv	a0,s0
    94b0:	5c4010ef          	jal	aa74 <_calloc_r>
    94b4:	fc050ae3          	beqz	a0,9488 <__i2b+0x6c>
    94b8:	00100793          	li	a5,1
    94bc:	00f52223          	sw	a5,4(a0)
    94c0:	00200793          	li	a5,2
    94c4:	00f52423          	sw	a5,8(a0)
    94c8:	f85ff06f          	j	944c <__i2b+0x30>

000094cc <__multiply>:
    94cc:	fb010113          	add	sp,sp,-80
    94d0:	03312e23          	sw	s3,60(sp)
    94d4:	03812423          	sw	s8,40(sp)
    94d8:	01062983          	lw	s3,16(a2)
    94dc:	0105ac03          	lw	s8,16(a1)
    94e0:	04812423          	sw	s0,72(sp)
    94e4:	03412c23          	sw	s4,56(sp)
    94e8:	04112623          	sw	ra,76(sp)
    94ec:	03712623          	sw	s7,44(sp)
    94f0:	00058a13          	mv	s4,a1
    94f4:	00060413          	mv	s0,a2
    94f8:	013c4c63          	blt	s8,s3,9510 <__multiply+0x44>
    94fc:	00098713          	mv	a4,s3
    9500:	00058413          	mv	s0,a1
    9504:	000c0993          	mv	s3,s8
    9508:	00060a13          	mv	s4,a2
    950c:	00070c13          	mv	s8,a4
    9510:	00842783          	lw	a5,8(s0)
    9514:	00442583          	lw	a1,4(s0)
    9518:	01898bb3          	add	s7,s3,s8
    951c:	0177a7b3          	slt	a5,a5,s7
    9520:	00f585b3          	add	a1,a1,a5
    9524:	b45ff0ef          	jal	9068 <_Balloc>
    9528:	00a12623          	sw	a0,12(sp)
    952c:	22050863          	beqz	a0,975c <__multiply+0x290>
    9530:	00c12783          	lw	a5,12(sp)
    9534:	03512a23          	sw	s5,52(sp)
    9538:	03612823          	sw	s6,48(sp)
    953c:	002b9a93          	sll	s5,s7,0x2
    9540:	01478b13          	add	s6,a5,20
    9544:	015b0ab3          	add	s5,s6,s5
    9548:	000b0793          	mv	a5,s6
    954c:	015b7863          	bgeu	s6,s5,955c <__multiply+0x90>
    9550:	0007a023          	sw	zero,0(a5)
    9554:	00478793          	add	a5,a5,4
    9558:	ff57ece3          	bltu	a5,s5,9550 <__multiply+0x84>
    955c:	014a0a13          	add	s4,s4,20
    9560:	002c1c13          	sll	s8,s8,0x2
    9564:	01440793          	add	a5,s0,20
    9568:	018a0733          	add	a4,s4,s8
    956c:	00299993          	sll	s3,s3,0x2
    9570:	00f12423          	sw	a5,8(sp)
    9574:	00e12023          	sw	a4,0(sp)
    9578:	013789b3          	add	s3,a5,s3
    957c:	16ea7c63          	bgeu	s4,a4,96f4 <__multiply+0x228>
    9580:	00400713          	li	a4,4
    9584:	04912223          	sw	s1,68(sp)
    9588:	05212023          	sw	s2,64(sp)
    958c:	03912223          	sw	s9,36(sp)
    9590:	03a12023          	sw	s10,32(sp)
    9594:	01b12e23          	sw	s11,28(sp)
    9598:	01540793          	add	a5,s0,21
    959c:	00e12223          	sw	a4,4(sp)
    95a0:	1af9f263          	bgeu	s3,a5,9744 <__multiply+0x278>
    95a4:	00010437          	lui	s0,0x10
    95a8:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    95ac:	01c0006f          	j	95c8 <__multiply+0xfc>
    95b0:	01095913          	srl	s2,s2,0x10
    95b4:	0a091063          	bnez	s2,9654 <__multiply+0x188>
    95b8:	00012783          	lw	a5,0(sp)
    95bc:	004a0a13          	add	s4,s4,4
    95c0:	004b0b13          	add	s6,s6,4
    95c4:	10fa7e63          	bgeu	s4,a5,96e0 <__multiply+0x214>
    95c8:	000a2903          	lw	s2,0(s4)
    95cc:	008974b3          	and	s1,s2,s0
    95d0:	fe0480e3          	beqz	s1,95b0 <__multiply+0xe4>
    95d4:	00812c83          	lw	s9,8(sp)
    95d8:	000b0d13          	mv	s10,s6
    95dc:	00000c13          	li	s8,0
    95e0:	000cad83          	lw	s11,0(s9)
    95e4:	000d2903          	lw	s2,0(s10)
    95e8:	00048593          	mv	a1,s1
    95ec:	008df533          	and	a0,s11,s0
    95f0:	174050ef          	jal	e764 <__mulsi3>
    95f4:	00897733          	and	a4,s2,s0
    95f8:	00e50733          	add	a4,a0,a4
    95fc:	00048593          	mv	a1,s1
    9600:	010dd513          	srl	a0,s11,0x10
    9604:	01870c33          	add	s8,a4,s8
    9608:	01095913          	srl	s2,s2,0x10
    960c:	158050ef          	jal	e764 <__mulsi3>
    9610:	010c5713          	srl	a4,s8,0x10
    9614:	01250533          	add	a0,a0,s2
    9618:	00e50533          	add	a0,a0,a4
    961c:	008c77b3          	and	a5,s8,s0
    9620:	01051713          	sll	a4,a0,0x10
    9624:	004d0d13          	add	s10,s10,4
    9628:	00f767b3          	or	a5,a4,a5
    962c:	004c8c93          	add	s9,s9,4
    9630:	fefd2e23          	sw	a5,-4(s10)
    9634:	01055c13          	srl	s8,a0,0x10
    9638:	fb3ce4e3          	bltu	s9,s3,95e0 <__multiply+0x114>
    963c:	00412783          	lw	a5,4(sp)
    9640:	00fb0733          	add	a4,s6,a5
    9644:	01872023          	sw	s8,0(a4)
    9648:	000a2903          	lw	s2,0(s4)
    964c:	01095913          	srl	s2,s2,0x10
    9650:	f60904e3          	beqz	s2,95b8 <__multiply+0xec>
    9654:	000b2c83          	lw	s9,0(s6)
    9658:	00812d03          	lw	s10,8(sp)
    965c:	000b0c13          	mv	s8,s6
    9660:	000c8493          	mv	s1,s9
    9664:	00000d93          	li	s11,0
    9668:	000d2503          	lw	a0,0(s10)
    966c:	00090593          	mv	a1,s2
    9670:	0104d493          	srl	s1,s1,0x10
    9674:	00857533          	and	a0,a0,s0
    9678:	0ec050ef          	jal	e764 <__mulsi3>
    967c:	01b50733          	add	a4,a0,s11
    9680:	00970db3          	add	s11,a4,s1
    9684:	010d9593          	sll	a1,s11,0x10
    9688:	008cf7b3          	and	a5,s9,s0
    968c:	00f5e7b3          	or	a5,a1,a5
    9690:	00fc2023          	sw	a5,0(s8)
    9694:	002d5503          	lhu	a0,2(s10)
    9698:	004c2483          	lw	s1,4(s8)
    969c:	00090593          	mv	a1,s2
    96a0:	0c4050ef          	jal	e764 <__mulsi3>
    96a4:	0084f7b3          	and	a5,s1,s0
    96a8:	010dd713          	srl	a4,s11,0x10
    96ac:	00f507b3          	add	a5,a0,a5
    96b0:	004d0d13          	add	s10,s10,4
    96b4:	00e78cb3          	add	s9,a5,a4
    96b8:	004c0c13          	add	s8,s8,4
    96bc:	010cdd93          	srl	s11,s9,0x10
    96c0:	fb3d64e3          	bltu	s10,s3,9668 <__multiply+0x19c>
    96c4:	00412783          	lw	a5,4(sp)
    96c8:	004a0a13          	add	s4,s4,4
    96cc:	00fb0733          	add	a4,s6,a5
    96d0:	00012783          	lw	a5,0(sp)
    96d4:	01972023          	sw	s9,0(a4)
    96d8:	004b0b13          	add	s6,s6,4
    96dc:	eefa66e3          	bltu	s4,a5,95c8 <__multiply+0xfc>
    96e0:	04412483          	lw	s1,68(sp)
    96e4:	04012903          	lw	s2,64(sp)
    96e8:	02412c83          	lw	s9,36(sp)
    96ec:	02012d03          	lw	s10,32(sp)
    96f0:	01c12d83          	lw	s11,28(sp)
    96f4:	01704863          	bgtz	s7,9704 <__multiply+0x238>
    96f8:	0180006f          	j	9710 <__multiply+0x244>
    96fc:	fffb8b93          	add	s7,s7,-1
    9700:	000b8863          	beqz	s7,9710 <__multiply+0x244>
    9704:	ffcaa783          	lw	a5,-4(s5)
    9708:	ffca8a93          	add	s5,s5,-4
    970c:	fe0788e3          	beqz	a5,96fc <__multiply+0x230>
    9710:	00c12783          	lw	a5,12(sp)
    9714:	04c12083          	lw	ra,76(sp)
    9718:	04812403          	lw	s0,72(sp)
    971c:	0177a823          	sw	s7,16(a5)
    9720:	03412a83          	lw	s5,52(sp)
    9724:	03012b03          	lw	s6,48(sp)
    9728:	03c12983          	lw	s3,60(sp)
    972c:	03812a03          	lw	s4,56(sp)
    9730:	02c12b83          	lw	s7,44(sp)
    9734:	02812c03          	lw	s8,40(sp)
    9738:	00078513          	mv	a0,a5
    973c:	05010113          	add	sp,sp,80
    9740:	00008067          	ret
    9744:	408987b3          	sub	a5,s3,s0
    9748:	feb78793          	add	a5,a5,-21
    974c:	ffc7f793          	and	a5,a5,-4
    9750:	00478793          	add	a5,a5,4
    9754:	00f12223          	sw	a5,4(sp)
    9758:	e4dff06f          	j	95a4 <__multiply+0xd8>
    975c:	00005697          	auipc	a3,0x5
    9760:	3b068693          	add	a3,a3,944 # eb0c <__fini_array_end+0x1b0>
    9764:	00000613          	li	a2,0
    9768:	16200593          	li	a1,354
    976c:	00005517          	auipc	a0,0x5
    9770:	43450513          	add	a0,a0,1076 # eba0 <__fini_array_end+0x244>
    9774:	04912223          	sw	s1,68(sp)
    9778:	05212023          	sw	s2,64(sp)
    977c:	03512a23          	sw	s5,52(sp)
    9780:	03612823          	sw	s6,48(sp)
    9784:	03912223          	sw	s9,36(sp)
    9788:	03a12023          	sw	s10,32(sp)
    978c:	01b12e23          	sw	s11,28(sp)
    9790:	28c010ef          	jal	aa1c <__assert_func>

00009794 <__pow5mult>:
    9794:	fe010113          	add	sp,sp,-32
    9798:	00812c23          	sw	s0,24(sp)
    979c:	01212823          	sw	s2,16(sp)
    97a0:	01312623          	sw	s3,12(sp)
    97a4:	00112e23          	sw	ra,28(sp)
    97a8:	00367793          	and	a5,a2,3
    97ac:	00060413          	mv	s0,a2
    97b0:	00050993          	mv	s3,a0
    97b4:	00058913          	mv	s2,a1
    97b8:	0a079c63          	bnez	a5,9870 <__pow5mult+0xdc>
    97bc:	40245413          	sra	s0,s0,0x2
    97c0:	06040a63          	beqz	s0,9834 <__pow5mult+0xa0>
    97c4:	00912a23          	sw	s1,20(sp)
    97c8:	0409a483          	lw	s1,64(s3)
    97cc:	0c048663          	beqz	s1,9898 <__pow5mult+0x104>
    97d0:	00147793          	and	a5,s0,1
    97d4:	02079063          	bnez	a5,97f4 <__pow5mult+0x60>
    97d8:	40145413          	sra	s0,s0,0x1
    97dc:	04040a63          	beqz	s0,9830 <__pow5mult+0x9c>
    97e0:	0004a503          	lw	a0,0(s1)
    97e4:	06050663          	beqz	a0,9850 <__pow5mult+0xbc>
    97e8:	00050493          	mv	s1,a0
    97ec:	00147793          	and	a5,s0,1
    97f0:	fe0784e3          	beqz	a5,97d8 <__pow5mult+0x44>
    97f4:	00048613          	mv	a2,s1
    97f8:	00090593          	mv	a1,s2
    97fc:	00098513          	mv	a0,s3
    9800:	ccdff0ef          	jal	94cc <__multiply>
    9804:	02090063          	beqz	s2,9824 <__pow5mult+0x90>
    9808:	00492703          	lw	a4,4(s2)
    980c:	0449a783          	lw	a5,68(s3)
    9810:	00271713          	sll	a4,a4,0x2
    9814:	00e787b3          	add	a5,a5,a4
    9818:	0007a703          	lw	a4,0(a5)
    981c:	00e92023          	sw	a4,0(s2)
    9820:	0127a023          	sw	s2,0(a5)
    9824:	40145413          	sra	s0,s0,0x1
    9828:	00050913          	mv	s2,a0
    982c:	fa041ae3          	bnez	s0,97e0 <__pow5mult+0x4c>
    9830:	01412483          	lw	s1,20(sp)
    9834:	01c12083          	lw	ra,28(sp)
    9838:	01812403          	lw	s0,24(sp)
    983c:	00c12983          	lw	s3,12(sp)
    9840:	00090513          	mv	a0,s2
    9844:	01012903          	lw	s2,16(sp)
    9848:	02010113          	add	sp,sp,32
    984c:	00008067          	ret
    9850:	00048613          	mv	a2,s1
    9854:	00048593          	mv	a1,s1
    9858:	00098513          	mv	a0,s3
    985c:	c71ff0ef          	jal	94cc <__multiply>
    9860:	00a4a023          	sw	a0,0(s1)
    9864:	00052023          	sw	zero,0(a0)
    9868:	00050493          	mv	s1,a0
    986c:	f81ff06f          	j	97ec <__pow5mult+0x58>
    9870:	fff78793          	add	a5,a5,-1
    9874:	00006717          	auipc	a4,0x6
    9878:	8a070713          	add	a4,a4,-1888 # f114 <p05.0>
    987c:	00279793          	sll	a5,a5,0x2
    9880:	00f707b3          	add	a5,a4,a5
    9884:	0007a603          	lw	a2,0(a5)
    9888:	00000693          	li	a3,0
    988c:	8b5ff0ef          	jal	9140 <__multadd>
    9890:	00050913          	mv	s2,a0
    9894:	f29ff06f          	j	97bc <__pow5mult+0x28>
    9898:	00100593          	li	a1,1
    989c:	00098513          	mv	a0,s3
    98a0:	fc8ff0ef          	jal	9068 <_Balloc>
    98a4:	00050493          	mv	s1,a0
    98a8:	02050063          	beqz	a0,98c8 <__pow5mult+0x134>
    98ac:	27100793          	li	a5,625
    98b0:	00f52a23          	sw	a5,20(a0)
    98b4:	00100793          	li	a5,1
    98b8:	00f52823          	sw	a5,16(a0)
    98bc:	04a9a023          	sw	a0,64(s3)
    98c0:	00052023          	sw	zero,0(a0)
    98c4:	f0dff06f          	j	97d0 <__pow5mult+0x3c>
    98c8:	00005697          	auipc	a3,0x5
    98cc:	24468693          	add	a3,a3,580 # eb0c <__fini_array_end+0x1b0>
    98d0:	00000613          	li	a2,0
    98d4:	14500593          	li	a1,325
    98d8:	00005517          	auipc	a0,0x5
    98dc:	2c850513          	add	a0,a0,712 # eba0 <__fini_array_end+0x244>
    98e0:	13c010ef          	jal	aa1c <__assert_func>

000098e4 <__lshift>:
    98e4:	fe010113          	add	sp,sp,-32
    98e8:	01512223          	sw	s5,4(sp)
    98ec:	0105aa83          	lw	s5,16(a1)
    98f0:	0085a783          	lw	a5,8(a1)
    98f4:	01312623          	sw	s3,12(sp)
    98f8:	40565993          	sra	s3,a2,0x5
    98fc:	01598ab3          	add	s5,s3,s5
    9900:	00812c23          	sw	s0,24(sp)
    9904:	00912a23          	sw	s1,20(sp)
    9908:	01212823          	sw	s2,16(sp)
    990c:	01412423          	sw	s4,8(sp)
    9910:	00112e23          	sw	ra,28(sp)
    9914:	001a8913          	add	s2,s5,1
    9918:	00058493          	mv	s1,a1
    991c:	00060413          	mv	s0,a2
    9920:	0045a583          	lw	a1,4(a1)
    9924:	00050a13          	mv	s4,a0
    9928:	0127d863          	bge	a5,s2,9938 <__lshift+0x54>
    992c:	00179793          	sll	a5,a5,0x1
    9930:	00158593          	add	a1,a1,1
    9934:	ff27cce3          	blt	a5,s2,992c <__lshift+0x48>
    9938:	000a0513          	mv	a0,s4
    993c:	f2cff0ef          	jal	9068 <_Balloc>
    9940:	10050c63          	beqz	a0,9a58 <__lshift+0x174>
    9944:	01450813          	add	a6,a0,20
    9948:	03305463          	blez	s3,9970 <__lshift+0x8c>
    994c:	00598993          	add	s3,s3,5
    9950:	00299993          	sll	s3,s3,0x2
    9954:	01350733          	add	a4,a0,s3
    9958:	00080793          	mv	a5,a6
    995c:	00478793          	add	a5,a5,4
    9960:	fe07ae23          	sw	zero,-4(a5)
    9964:	fee79ce3          	bne	a5,a4,995c <__lshift+0x78>
    9968:	fec98993          	add	s3,s3,-20
    996c:	01380833          	add	a6,a6,s3
    9970:	0104a883          	lw	a7,16(s1)
    9974:	01448793          	add	a5,s1,20
    9978:	01f47613          	and	a2,s0,31
    997c:	00289893          	sll	a7,a7,0x2
    9980:	011788b3          	add	a7,a5,a7
    9984:	0a060463          	beqz	a2,9a2c <__lshift+0x148>
    9988:	02000593          	li	a1,32
    998c:	40c585b3          	sub	a1,a1,a2
    9990:	00080313          	mv	t1,a6
    9994:	00000693          	li	a3,0
    9998:	0007a703          	lw	a4,0(a5)
    999c:	00430313          	add	t1,t1,4
    99a0:	00478793          	add	a5,a5,4
    99a4:	00c71733          	sll	a4,a4,a2
    99a8:	00d76733          	or	a4,a4,a3
    99ac:	fee32e23          	sw	a4,-4(t1)
    99b0:	ffc7a683          	lw	a3,-4(a5)
    99b4:	00b6d6b3          	srl	a3,a3,a1
    99b8:	ff17e0e3          	bltu	a5,a7,9998 <__lshift+0xb4>
    99bc:	01548793          	add	a5,s1,21
    99c0:	00400713          	li	a4,4
    99c4:	00f8ea63          	bltu	a7,a5,99d8 <__lshift+0xf4>
    99c8:	409887b3          	sub	a5,a7,s1
    99cc:	feb78793          	add	a5,a5,-21
    99d0:	ffc7f793          	and	a5,a5,-4
    99d4:	00478713          	add	a4,a5,4
    99d8:	00e80833          	add	a6,a6,a4
    99dc:	00d82023          	sw	a3,0(a6)
    99e0:	00069463          	bnez	a3,99e8 <__lshift+0x104>
    99e4:	000a8913          	mv	s2,s5
    99e8:	0044a703          	lw	a4,4(s1)
    99ec:	044a2783          	lw	a5,68(s4)
    99f0:	01c12083          	lw	ra,28(sp)
    99f4:	00271713          	sll	a4,a4,0x2
    99f8:	00e787b3          	add	a5,a5,a4
    99fc:	0007a703          	lw	a4,0(a5)
    9a00:	01252823          	sw	s2,16(a0)
    9a04:	01812403          	lw	s0,24(sp)
    9a08:	00e4a023          	sw	a4,0(s1)
    9a0c:	0097a023          	sw	s1,0(a5)
    9a10:	01012903          	lw	s2,16(sp)
    9a14:	01412483          	lw	s1,20(sp)
    9a18:	00c12983          	lw	s3,12(sp)
    9a1c:	00812a03          	lw	s4,8(sp)
    9a20:	00412a83          	lw	s5,4(sp)
    9a24:	02010113          	add	sp,sp,32
    9a28:	00008067          	ret
    9a2c:	0007a703          	lw	a4,0(a5)
    9a30:	00478793          	add	a5,a5,4
    9a34:	00480813          	add	a6,a6,4
    9a38:	fee82e23          	sw	a4,-4(a6)
    9a3c:	fb17f4e3          	bgeu	a5,a7,99e4 <__lshift+0x100>
    9a40:	0007a703          	lw	a4,0(a5)
    9a44:	00478793          	add	a5,a5,4
    9a48:	00480813          	add	a6,a6,4
    9a4c:	fee82e23          	sw	a4,-4(a6)
    9a50:	fd17eee3          	bltu	a5,a7,9a2c <__lshift+0x148>
    9a54:	f91ff06f          	j	99e4 <__lshift+0x100>
    9a58:	00005697          	auipc	a3,0x5
    9a5c:	0b468693          	add	a3,a3,180 # eb0c <__fini_array_end+0x1b0>
    9a60:	00000613          	li	a2,0
    9a64:	1de00593          	li	a1,478
    9a68:	00005517          	auipc	a0,0x5
    9a6c:	13850513          	add	a0,a0,312 # eba0 <__fini_array_end+0x244>
    9a70:	7ad000ef          	jal	aa1c <__assert_func>

00009a74 <__mcmp>:
    9a74:	01052703          	lw	a4,16(a0)
    9a78:	0105a783          	lw	a5,16(a1)
    9a7c:	00050813          	mv	a6,a0
    9a80:	40f70533          	sub	a0,a4,a5
    9a84:	04f71263          	bne	a4,a5,9ac8 <__mcmp+0x54>
    9a88:	00279793          	sll	a5,a5,0x2
    9a8c:	01480813          	add	a6,a6,20
    9a90:	01458593          	add	a1,a1,20
    9a94:	00f80733          	add	a4,a6,a5
    9a98:	00f587b3          	add	a5,a1,a5
    9a9c:	0080006f          	j	9aa4 <__mcmp+0x30>
    9aa0:	02e87463          	bgeu	a6,a4,9ac8 <__mcmp+0x54>
    9aa4:	ffc72603          	lw	a2,-4(a4)
    9aa8:	ffc7a683          	lw	a3,-4(a5)
    9aac:	ffc70713          	add	a4,a4,-4
    9ab0:	ffc78793          	add	a5,a5,-4
    9ab4:	fed606e3          	beq	a2,a3,9aa0 <__mcmp+0x2c>
    9ab8:	00100513          	li	a0,1
    9abc:	00d67663          	bgeu	a2,a3,9ac8 <__mcmp+0x54>
    9ac0:	fff00513          	li	a0,-1
    9ac4:	00008067          	ret
    9ac8:	00008067          	ret

00009acc <__mdiff>:
    9acc:	0105a703          	lw	a4,16(a1)
    9ad0:	01062783          	lw	a5,16(a2)
    9ad4:	ff010113          	add	sp,sp,-16
    9ad8:	00812423          	sw	s0,8(sp)
    9adc:	00912223          	sw	s1,4(sp)
    9ae0:	00112623          	sw	ra,12(sp)
    9ae4:	01212023          	sw	s2,0(sp)
    9ae8:	00058413          	mv	s0,a1
    9aec:	00060493          	mv	s1,a2
    9af0:	40f706b3          	sub	a3,a4,a5
    9af4:	18f71e63          	bne	a4,a5,9c90 <__mdiff+0x1c4>
    9af8:	00279693          	sll	a3,a5,0x2
    9afc:	01458613          	add	a2,a1,20
    9b00:	01448713          	add	a4,s1,20
    9b04:	00d607b3          	add	a5,a2,a3
    9b08:	00d70733          	add	a4,a4,a3
    9b0c:	0080006f          	j	9b14 <__mdiff+0x48>
    9b10:	18f67c63          	bgeu	a2,a5,9ca8 <__mdiff+0x1dc>
    9b14:	ffc7a583          	lw	a1,-4(a5)
    9b18:	ffc72683          	lw	a3,-4(a4)
    9b1c:	ffc78793          	add	a5,a5,-4
    9b20:	ffc70713          	add	a4,a4,-4
    9b24:	fed586e3          	beq	a1,a3,9b10 <__mdiff+0x44>
    9b28:	00100913          	li	s2,1
    9b2c:	00d5ea63          	bltu	a1,a3,9b40 <__mdiff+0x74>
    9b30:	00048793          	mv	a5,s1
    9b34:	00000913          	li	s2,0
    9b38:	00040493          	mv	s1,s0
    9b3c:	00078413          	mv	s0,a5
    9b40:	0044a583          	lw	a1,4(s1)
    9b44:	d24ff0ef          	jal	9068 <_Balloc>
    9b48:	1a050663          	beqz	a0,9cf4 <__mdiff+0x228>
    9b4c:	0104a883          	lw	a7,16(s1)
    9b50:	01042283          	lw	t0,16(s0)
    9b54:	01448f93          	add	t6,s1,20
    9b58:	00289313          	sll	t1,a7,0x2
    9b5c:	01440813          	add	a6,s0,20
    9b60:	00229293          	sll	t0,t0,0x2
    9b64:	01450593          	add	a1,a0,20
    9b68:	00010e37          	lui	t3,0x10
    9b6c:	01252623          	sw	s2,12(a0)
    9b70:	006f8333          	add	t1,t6,t1
    9b74:	005802b3          	add	t0,a6,t0
    9b78:	00058f13          	mv	t5,a1
    9b7c:	000f8e93          	mv	t4,t6
    9b80:	00000693          	li	a3,0
    9b84:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    9b88:	000ea703          	lw	a4,0(t4)
    9b8c:	00082603          	lw	a2,0(a6)
    9b90:	004f0f13          	add	t5,t5,4
    9b94:	01c777b3          	and	a5,a4,t3
    9b98:	01c673b3          	and	t2,a2,t3
    9b9c:	407787b3          	sub	a5,a5,t2
    9ba0:	00d787b3          	add	a5,a5,a3
    9ba4:	01075713          	srl	a4,a4,0x10
    9ba8:	01065613          	srl	a2,a2,0x10
    9bac:	4107d693          	sra	a3,a5,0x10
    9bb0:	40c70733          	sub	a4,a4,a2
    9bb4:	00d70733          	add	a4,a4,a3
    9bb8:	01071693          	sll	a3,a4,0x10
    9bbc:	01c7f7b3          	and	a5,a5,t3
    9bc0:	00d7e7b3          	or	a5,a5,a3
    9bc4:	00480813          	add	a6,a6,4
    9bc8:	feff2e23          	sw	a5,-4(t5)
    9bcc:	004e8e93          	add	t4,t4,4
    9bd0:	41075693          	sra	a3,a4,0x10
    9bd4:	fa586ae3          	bltu	a6,t0,9b88 <__mdiff+0xbc>
    9bd8:	01540713          	add	a4,s0,21
    9bdc:	40828433          	sub	s0,t0,s0
    9be0:	feb40413          	add	s0,s0,-21
    9be4:	00e2b2b3          	sltu	t0,t0,a4
    9be8:	0012cf13          	xor	t5,t0,1
    9bec:	00245413          	srl	s0,s0,0x2
    9bf0:	00400713          	li	a4,4
    9bf4:	0a028463          	beqz	t0,9c9c <__mdiff+0x1d0>
    9bf8:	00ef8fb3          	add	t6,t6,a4
    9bfc:	00e58833          	add	a6,a1,a4
    9c00:	00010eb7          	lui	t4,0x10
    9c04:	00080e13          	mv	t3,a6
    9c08:	000f8613          	mv	a2,t6
    9c0c:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    9c10:	0c6ff463          	bgeu	t6,t1,9cd8 <__mdiff+0x20c>
    9c14:	00062783          	lw	a5,0(a2)
    9c18:	004e0e13          	add	t3,t3,4
    9c1c:	00460613          	add	a2,a2,4
    9c20:	01d7f733          	and	a4,a5,t4
    9c24:	00d70733          	add	a4,a4,a3
    9c28:	0107d593          	srl	a1,a5,0x10
    9c2c:	41075713          	sra	a4,a4,0x10
    9c30:	00b70733          	add	a4,a4,a1
    9c34:	00d787b3          	add	a5,a5,a3
    9c38:	01d7f7b3          	and	a5,a5,t4
    9c3c:	01071693          	sll	a3,a4,0x10
    9c40:	00d7e7b3          	or	a5,a5,a3
    9c44:	fefe2e23          	sw	a5,-4(t3)
    9c48:	41075693          	sra	a3,a4,0x10
    9c4c:	fc6664e3          	bltu	a2,t1,9c14 <__mdiff+0x148>
    9c50:	fff30313          	add	t1,t1,-1
    9c54:	41f30333          	sub	t1,t1,t6
    9c58:	ffc37313          	and	t1,t1,-4
    9c5c:	00680733          	add	a4,a6,t1
    9c60:	00079a63          	bnez	a5,9c74 <__mdiff+0x1a8>
    9c64:	ffc72783          	lw	a5,-4(a4)
    9c68:	fff88893          	add	a7,a7,-1
    9c6c:	ffc70713          	add	a4,a4,-4
    9c70:	fe078ae3          	beqz	a5,9c64 <__mdiff+0x198>
    9c74:	00c12083          	lw	ra,12(sp)
    9c78:	00812403          	lw	s0,8(sp)
    9c7c:	01152823          	sw	a7,16(a0)
    9c80:	00412483          	lw	s1,4(sp)
    9c84:	00012903          	lw	s2,0(sp)
    9c88:	01010113          	add	sp,sp,16
    9c8c:	00008067          	ret
    9c90:	00100913          	li	s2,1
    9c94:	e806dee3          	bgez	a3,9b30 <__mdiff+0x64>
    9c98:	ea9ff06f          	j	9b40 <__mdiff+0x74>
    9c9c:	00140713          	add	a4,s0,1
    9ca0:	00271713          	sll	a4,a4,0x2
    9ca4:	f55ff06f          	j	9bf8 <__mdiff+0x12c>
    9ca8:	00000593          	li	a1,0
    9cac:	bbcff0ef          	jal	9068 <_Balloc>
    9cb0:	06050063          	beqz	a0,9d10 <__mdiff+0x244>
    9cb4:	00c12083          	lw	ra,12(sp)
    9cb8:	00812403          	lw	s0,8(sp)
    9cbc:	00100793          	li	a5,1
    9cc0:	00f52823          	sw	a5,16(a0)
    9cc4:	00052a23          	sw	zero,20(a0)
    9cc8:	00412483          	lw	s1,4(sp)
    9ccc:	00012903          	lw	s2,0(sp)
    9cd0:	01010113          	add	sp,sp,16
    9cd4:	00008067          	ret
    9cd8:	00000713          	li	a4,0
    9cdc:	000f1663          	bnez	t5,9ce8 <__mdiff+0x21c>
    9ce0:	00e58733          	add	a4,a1,a4
    9ce4:	f7dff06f          	j	9c60 <__mdiff+0x194>
    9ce8:	00241713          	sll	a4,s0,0x2
    9cec:	00e58733          	add	a4,a1,a4
    9cf0:	f71ff06f          	j	9c60 <__mdiff+0x194>
    9cf4:	00005697          	auipc	a3,0x5
    9cf8:	e1868693          	add	a3,a3,-488 # eb0c <__fini_array_end+0x1b0>
    9cfc:	00000613          	li	a2,0
    9d00:	24500593          	li	a1,581
    9d04:	00005517          	auipc	a0,0x5
    9d08:	e9c50513          	add	a0,a0,-356 # eba0 <__fini_array_end+0x244>
    9d0c:	511000ef          	jal	aa1c <__assert_func>
    9d10:	00005697          	auipc	a3,0x5
    9d14:	dfc68693          	add	a3,a3,-516 # eb0c <__fini_array_end+0x1b0>
    9d18:	00000613          	li	a2,0
    9d1c:	23700593          	li	a1,567
    9d20:	00005517          	auipc	a0,0x5
    9d24:	e8050513          	add	a0,a0,-384 # eba0 <__fini_array_end+0x244>
    9d28:	4f5000ef          	jal	aa1c <__assert_func>

00009d2c <__d2b>:
    9d2c:	fd010113          	add	sp,sp,-48
    9d30:	01512a23          	sw	s5,20(sp)
    9d34:	00058a93          	mv	s5,a1
    9d38:	00100593          	li	a1,1
    9d3c:	02912223          	sw	s1,36(sp)
    9d40:	01312e23          	sw	s3,28(sp)
    9d44:	01412c23          	sw	s4,24(sp)
    9d48:	02112623          	sw	ra,44(sp)
    9d4c:	02812423          	sw	s0,40(sp)
    9d50:	03212023          	sw	s2,32(sp)
    9d54:	00060493          	mv	s1,a2
    9d58:	00068a13          	mv	s4,a3
    9d5c:	00070993          	mv	s3,a4
    9d60:	b08ff0ef          	jal	9068 <_Balloc>
    9d64:	10050263          	beqz	a0,9e68 <__d2b+0x13c>
    9d68:	00100737          	lui	a4,0x100
    9d6c:	0144d913          	srl	s2,s1,0x14
    9d70:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    9d74:	7ff97913          	and	s2,s2,2047
    9d78:	00050413          	mv	s0,a0
    9d7c:	0097f7b3          	and	a5,a5,s1
    9d80:	00090463          	beqz	s2,9d88 <__d2b+0x5c>
    9d84:	00e7e7b3          	or	a5,a5,a4
    9d88:	00f12623          	sw	a5,12(sp)
    9d8c:	060a9263          	bnez	s5,9df0 <__d2b+0xc4>
    9d90:	00c10513          	add	a0,sp,12
    9d94:	da8ff0ef          	jal	933c <__lo0bits>
    9d98:	00c12703          	lw	a4,12(sp)
    9d9c:	00100493          	li	s1,1
    9da0:	00942823          	sw	s1,16(s0)
    9da4:	00e42a23          	sw	a4,20(s0)
    9da8:	02050793          	add	a5,a0,32
    9dac:	08090863          	beqz	s2,9e3c <__d2b+0x110>
    9db0:	bcd90913          	add	s2,s2,-1075
    9db4:	00f90933          	add	s2,s2,a5
    9db8:	03500493          	li	s1,53
    9dbc:	012a2023          	sw	s2,0(s4)
    9dc0:	40f48533          	sub	a0,s1,a5
    9dc4:	00a9a023          	sw	a0,0(s3)
    9dc8:	02c12083          	lw	ra,44(sp)
    9dcc:	00040513          	mv	a0,s0
    9dd0:	02812403          	lw	s0,40(sp)
    9dd4:	02412483          	lw	s1,36(sp)
    9dd8:	02012903          	lw	s2,32(sp)
    9ddc:	01c12983          	lw	s3,28(sp)
    9de0:	01812a03          	lw	s4,24(sp)
    9de4:	01412a83          	lw	s5,20(sp)
    9de8:	03010113          	add	sp,sp,48
    9dec:	00008067          	ret
    9df0:	00810513          	add	a0,sp,8
    9df4:	01512423          	sw	s5,8(sp)
    9df8:	d44ff0ef          	jal	933c <__lo0bits>
    9dfc:	00c12703          	lw	a4,12(sp)
    9e00:	00050793          	mv	a5,a0
    9e04:	04050e63          	beqz	a0,9e60 <__d2b+0x134>
    9e08:	00812603          	lw	a2,8(sp)
    9e0c:	02000693          	li	a3,32
    9e10:	40a686b3          	sub	a3,a3,a0
    9e14:	00d716b3          	sll	a3,a4,a3
    9e18:	00a75733          	srl	a4,a4,a0
    9e1c:	00c6e6b3          	or	a3,a3,a2
    9e20:	00e12623          	sw	a4,12(sp)
    9e24:	00e034b3          	snez	s1,a4
    9e28:	00148493          	add	s1,s1,1
    9e2c:	00d42a23          	sw	a3,20(s0)
    9e30:	00e42c23          	sw	a4,24(s0)
    9e34:	00942823          	sw	s1,16(s0)
    9e38:	f6091ce3          	bnez	s2,9db0 <__d2b+0x84>
    9e3c:	00249713          	sll	a4,s1,0x2
    9e40:	00e40733          	add	a4,s0,a4
    9e44:	01072503          	lw	a0,16(a4)
    9e48:	bce78793          	add	a5,a5,-1074
    9e4c:	00fa2023          	sw	a5,0(s4)
    9e50:	c74ff0ef          	jal	92c4 <__hi0bits>
    9e54:	00549493          	sll	s1,s1,0x5
    9e58:	40a48533          	sub	a0,s1,a0
    9e5c:	f69ff06f          	j	9dc4 <__d2b+0x98>
    9e60:	00812683          	lw	a3,8(sp)
    9e64:	fc1ff06f          	j	9e24 <__d2b+0xf8>
    9e68:	00005697          	auipc	a3,0x5
    9e6c:	ca468693          	add	a3,a3,-860 # eb0c <__fini_array_end+0x1b0>
    9e70:	00000613          	li	a2,0
    9e74:	30f00593          	li	a1,783
    9e78:	00005517          	auipc	a0,0x5
    9e7c:	d2850513          	add	a0,a0,-728 # eba0 <__fini_array_end+0x244>
    9e80:	39d000ef          	jal	aa1c <__assert_func>

00009e84 <_realloc_r>:
    9e84:	fd010113          	add	sp,sp,-48
    9e88:	02912223          	sw	s1,36(sp)
    9e8c:	02112623          	sw	ra,44(sp)
    9e90:	00060493          	mv	s1,a2
    9e94:	1e058863          	beqz	a1,a084 <_realloc_r+0x200>
    9e98:	02812423          	sw	s0,40(sp)
    9e9c:	03212023          	sw	s2,32(sp)
    9ea0:	00058413          	mv	s0,a1
    9ea4:	01312e23          	sw	s3,28(sp)
    9ea8:	01512a23          	sw	s5,20(sp)
    9eac:	01412c23          	sw	s4,24(sp)
    9eb0:	00050913          	mv	s2,a0
    9eb4:	b2df70ef          	jal	19e0 <__malloc_lock>
    9eb8:	ffc42703          	lw	a4,-4(s0)
    9ebc:	00b48793          	add	a5,s1,11
    9ec0:	01600693          	li	a3,22
    9ec4:	ff840a93          	add	s5,s0,-8
    9ec8:	ffc77993          	and	s3,a4,-4
    9ecc:	10f6f263          	bgeu	a3,a5,9fd0 <_realloc_r+0x14c>
    9ed0:	ff87fa13          	and	s4,a5,-8
    9ed4:	1007c263          	bltz	a5,9fd8 <_realloc_r+0x154>
    9ed8:	109a6063          	bltu	s4,s1,9fd8 <_realloc_r+0x154>
    9edc:	1349d263          	bge	s3,s4,a000 <_realloc_r+0x17c>
    9ee0:	01812423          	sw	s8,8(sp)
    9ee4:	7fff6c17          	auipc	s8,0x7fff6
    9ee8:	23cc0c13          	add	s8,s8,572 # 80000120 <__malloc_av_>
    9eec:	008c2603          	lw	a2,8(s8)
    9ef0:	013a86b3          	add	a3,s5,s3
    9ef4:	0046a783          	lw	a5,4(a3)
    9ef8:	1cd60863          	beq	a2,a3,a0c8 <_realloc_r+0x244>
    9efc:	ffe7f613          	and	a2,a5,-2
    9f00:	00c68633          	add	a2,a3,a2
    9f04:	00462603          	lw	a2,4(a2)
    9f08:	00167613          	and	a2,a2,1
    9f0c:	14061a63          	bnez	a2,a060 <_realloc_r+0x1dc>
    9f10:	ffc7f793          	and	a5,a5,-4
    9f14:	00f98633          	add	a2,s3,a5
    9f18:	0d465863          	bge	a2,s4,9fe8 <_realloc_r+0x164>
    9f1c:	00177713          	and	a4,a4,1
    9f20:	02071c63          	bnez	a4,9f58 <_realloc_r+0xd4>
    9f24:	01712623          	sw	s7,12(sp)
    9f28:	ff842b83          	lw	s7,-8(s0)
    9f2c:	01612823          	sw	s6,16(sp)
    9f30:	417a8bb3          	sub	s7,s5,s7
    9f34:	004ba703          	lw	a4,4(s7)
    9f38:	ffc77713          	and	a4,a4,-4
    9f3c:	00e787b3          	add	a5,a5,a4
    9f40:	01378b33          	add	s6,a5,s3
    9f44:	334b5c63          	bge	s6,s4,a27c <_realloc_r+0x3f8>
    9f48:	00e98b33          	add	s6,s3,a4
    9f4c:	294b5863          	bge	s6,s4,a1dc <_realloc_r+0x358>
    9f50:	01012b03          	lw	s6,16(sp)
    9f54:	00c12b83          	lw	s7,12(sp)
    9f58:	00048593          	mv	a1,s1
    9f5c:	00090513          	mv	a0,s2
    9f60:	aa0f70ef          	jal	1200 <_malloc_r>
    9f64:	00050493          	mv	s1,a0
    9f68:	40050863          	beqz	a0,a378 <_realloc_r+0x4f4>
    9f6c:	ffc42783          	lw	a5,-4(s0)
    9f70:	ff850713          	add	a4,a0,-8
    9f74:	ffe7f793          	and	a5,a5,-2
    9f78:	00fa87b3          	add	a5,s5,a5
    9f7c:	24e78663          	beq	a5,a4,a1c8 <_realloc_r+0x344>
    9f80:	ffc98613          	add	a2,s3,-4
    9f84:	02400793          	li	a5,36
    9f88:	2ec7e463          	bltu	a5,a2,a270 <_realloc_r+0x3ec>
    9f8c:	01300713          	li	a4,19
    9f90:	20c76a63          	bltu	a4,a2,a1a4 <_realloc_r+0x320>
    9f94:	00050793          	mv	a5,a0
    9f98:	00040713          	mv	a4,s0
    9f9c:	00072683          	lw	a3,0(a4)
    9fa0:	00d7a023          	sw	a3,0(a5)
    9fa4:	00472683          	lw	a3,4(a4)
    9fa8:	00d7a223          	sw	a3,4(a5)
    9fac:	00872703          	lw	a4,8(a4)
    9fb0:	00e7a423          	sw	a4,8(a5)
    9fb4:	00040593          	mv	a1,s0
    9fb8:	00090513          	mv	a0,s2
    9fbc:	f39f60ef          	jal	ef4 <_free_r>
    9fc0:	00090513          	mv	a0,s2
    9fc4:	a29f70ef          	jal	19ec <__malloc_unlock>
    9fc8:	00812c03          	lw	s8,8(sp)
    9fcc:	06c0006f          	j	a038 <_realloc_r+0x1b4>
    9fd0:	01000a13          	li	s4,16
    9fd4:	f09a74e3          	bgeu	s4,s1,9edc <_realloc_r+0x58>
    9fd8:	00c00793          	li	a5,12
    9fdc:	00f92023          	sw	a5,0(s2)
    9fe0:	00000493          	li	s1,0
    9fe4:	0540006f          	j	a038 <_realloc_r+0x1b4>
    9fe8:	00c6a783          	lw	a5,12(a3)
    9fec:	0086a703          	lw	a4,8(a3)
    9ff0:	00812c03          	lw	s8,8(sp)
    9ff4:	00060993          	mv	s3,a2
    9ff8:	00f72623          	sw	a5,12(a4)
    9ffc:	00e7a423          	sw	a4,8(a5)
    a000:	004aa783          	lw	a5,4(s5)
    a004:	414986b3          	sub	a3,s3,s4
    a008:	00f00613          	li	a2,15
    a00c:	0017f793          	and	a5,a5,1
    a010:	013a8733          	add	a4,s5,s3
    a014:	08d66263          	bltu	a2,a3,a098 <_realloc_r+0x214>
    a018:	0137e7b3          	or	a5,a5,s3
    a01c:	00faa223          	sw	a5,4(s5)
    a020:	00472783          	lw	a5,4(a4)
    a024:	0017e793          	or	a5,a5,1
    a028:	00f72223          	sw	a5,4(a4)
    a02c:	00090513          	mv	a0,s2
    a030:	9bdf70ef          	jal	19ec <__malloc_unlock>
    a034:	00040493          	mv	s1,s0
    a038:	02812403          	lw	s0,40(sp)
    a03c:	02c12083          	lw	ra,44(sp)
    a040:	02012903          	lw	s2,32(sp)
    a044:	01c12983          	lw	s3,28(sp)
    a048:	01812a03          	lw	s4,24(sp)
    a04c:	01412a83          	lw	s5,20(sp)
    a050:	00048513          	mv	a0,s1
    a054:	02412483          	lw	s1,36(sp)
    a058:	03010113          	add	sp,sp,48
    a05c:	00008067          	ret
    a060:	00177713          	and	a4,a4,1
    a064:	ee071ae3          	bnez	a4,9f58 <_realloc_r+0xd4>
    a068:	01712623          	sw	s7,12(sp)
    a06c:	ff842b83          	lw	s7,-8(s0)
    a070:	01612823          	sw	s6,16(sp)
    a074:	417a8bb3          	sub	s7,s5,s7
    a078:	004ba703          	lw	a4,4(s7)
    a07c:	ffc77713          	and	a4,a4,-4
    a080:	ec9ff06f          	j	9f48 <_realloc_r+0xc4>
    a084:	02c12083          	lw	ra,44(sp)
    a088:	02412483          	lw	s1,36(sp)
    a08c:	00060593          	mv	a1,a2
    a090:	03010113          	add	sp,sp,48
    a094:	96cf706f          	j	1200 <_malloc_r>
    a098:	0147e7b3          	or	a5,a5,s4
    a09c:	00faa223          	sw	a5,4(s5)
    a0a0:	014a85b3          	add	a1,s5,s4
    a0a4:	0016e693          	or	a3,a3,1
    a0a8:	00d5a223          	sw	a3,4(a1)
    a0ac:	00472783          	lw	a5,4(a4)
    a0b0:	00858593          	add	a1,a1,8
    a0b4:	00090513          	mv	a0,s2
    a0b8:	0017e793          	or	a5,a5,1
    a0bc:	00f72223          	sw	a5,4(a4)
    a0c0:	e35f60ef          	jal	ef4 <_free_r>
    a0c4:	f69ff06f          	j	a02c <_realloc_r+0x1a8>
    a0c8:	ffc7f793          	and	a5,a5,-4
    a0cc:	013786b3          	add	a3,a5,s3
    a0d0:	010a0613          	add	a2,s4,16
    a0d4:	26c6d063          	bge	a3,a2,a334 <_realloc_r+0x4b0>
    a0d8:	00177713          	and	a4,a4,1
    a0dc:	e6071ee3          	bnez	a4,9f58 <_realloc_r+0xd4>
    a0e0:	01712623          	sw	s7,12(sp)
    a0e4:	ff842b83          	lw	s7,-8(s0)
    a0e8:	01612823          	sw	s6,16(sp)
    a0ec:	417a8bb3          	sub	s7,s5,s7
    a0f0:	004ba703          	lw	a4,4(s7)
    a0f4:	ffc77713          	and	a4,a4,-4
    a0f8:	00e787b3          	add	a5,a5,a4
    a0fc:	01378b33          	add	s6,a5,s3
    a100:	e4cb44e3          	blt	s6,a2,9f48 <_realloc_r+0xc4>
    a104:	00cba783          	lw	a5,12(s7)
    a108:	008ba703          	lw	a4,8(s7)
    a10c:	ffc98613          	add	a2,s3,-4
    a110:	02400693          	li	a3,36
    a114:	00f72623          	sw	a5,12(a4)
    a118:	00e7a423          	sw	a4,8(a5)
    a11c:	008b8493          	add	s1,s7,8
    a120:	28c6e463          	bltu	a3,a2,a3a8 <_realloc_r+0x524>
    a124:	01300713          	li	a4,19
    a128:	00048793          	mv	a5,s1
    a12c:	02c77263          	bgeu	a4,a2,a150 <_realloc_r+0x2cc>
    a130:	00042703          	lw	a4,0(s0)
    a134:	01b00793          	li	a5,27
    a138:	00eba423          	sw	a4,8(s7)
    a13c:	00442703          	lw	a4,4(s0)
    a140:	00eba623          	sw	a4,12(s7)
    a144:	26c7ea63          	bltu	a5,a2,a3b8 <_realloc_r+0x534>
    a148:	00840413          	add	s0,s0,8
    a14c:	010b8793          	add	a5,s7,16
    a150:	00042703          	lw	a4,0(s0)
    a154:	00e7a023          	sw	a4,0(a5)
    a158:	00442703          	lw	a4,4(s0)
    a15c:	00e7a223          	sw	a4,4(a5)
    a160:	00842703          	lw	a4,8(s0)
    a164:	00e7a423          	sw	a4,8(a5)
    a168:	014b8733          	add	a4,s7,s4
    a16c:	414b07b3          	sub	a5,s6,s4
    a170:	00ec2423          	sw	a4,8(s8)
    a174:	0017e793          	or	a5,a5,1
    a178:	00f72223          	sw	a5,4(a4)
    a17c:	004ba783          	lw	a5,4(s7)
    a180:	00090513          	mv	a0,s2
    a184:	0017f793          	and	a5,a5,1
    a188:	0147e7b3          	or	a5,a5,s4
    a18c:	00fba223          	sw	a5,4(s7)
    a190:	85df70ef          	jal	19ec <__malloc_unlock>
    a194:	01012b03          	lw	s6,16(sp)
    a198:	00c12b83          	lw	s7,12(sp)
    a19c:	00812c03          	lw	s8,8(sp)
    a1a0:	e99ff06f          	j	a038 <_realloc_r+0x1b4>
    a1a4:	00042683          	lw	a3,0(s0)
    a1a8:	01b00713          	li	a4,27
    a1ac:	00d52023          	sw	a3,0(a0)
    a1b0:	00442683          	lw	a3,4(s0)
    a1b4:	00d52223          	sw	a3,4(a0)
    a1b8:	14c76e63          	bltu	a4,a2,a314 <_realloc_r+0x490>
    a1bc:	00840713          	add	a4,s0,8
    a1c0:	00850793          	add	a5,a0,8
    a1c4:	dd9ff06f          	j	9f9c <_realloc_r+0x118>
    a1c8:	ffc52783          	lw	a5,-4(a0)
    a1cc:	00812c03          	lw	s8,8(sp)
    a1d0:	ffc7f793          	and	a5,a5,-4
    a1d4:	00f989b3          	add	s3,s3,a5
    a1d8:	e29ff06f          	j	a000 <_realloc_r+0x17c>
    a1dc:	00cba783          	lw	a5,12(s7)
    a1e0:	008ba703          	lw	a4,8(s7)
    a1e4:	ffc98613          	add	a2,s3,-4
    a1e8:	02400693          	li	a3,36
    a1ec:	00f72623          	sw	a5,12(a4)
    a1f0:	00e7a423          	sw	a4,8(a5)
    a1f4:	008b8493          	add	s1,s7,8
    a1f8:	10c6e663          	bltu	a3,a2,a304 <_realloc_r+0x480>
    a1fc:	01300713          	li	a4,19
    a200:	00048793          	mv	a5,s1
    a204:	02c77c63          	bgeu	a4,a2,a23c <_realloc_r+0x3b8>
    a208:	00042703          	lw	a4,0(s0)
    a20c:	01b00793          	li	a5,27
    a210:	00eba423          	sw	a4,8(s7)
    a214:	00442703          	lw	a4,4(s0)
    a218:	00eba623          	sw	a4,12(s7)
    a21c:	14c7f863          	bgeu	a5,a2,a36c <_realloc_r+0x4e8>
    a220:	00842783          	lw	a5,8(s0)
    a224:	00fba823          	sw	a5,16(s7)
    a228:	00c42783          	lw	a5,12(s0)
    a22c:	00fbaa23          	sw	a5,20(s7)
    a230:	0ad60c63          	beq	a2,a3,a2e8 <_realloc_r+0x464>
    a234:	01040413          	add	s0,s0,16
    a238:	018b8793          	add	a5,s7,24
    a23c:	00042703          	lw	a4,0(s0)
    a240:	00e7a023          	sw	a4,0(a5)
    a244:	00442703          	lw	a4,4(s0)
    a248:	00e7a223          	sw	a4,4(a5)
    a24c:	00842703          	lw	a4,8(s0)
    a250:	00e7a423          	sw	a4,8(a5)
    a254:	000b0993          	mv	s3,s6
    a258:	000b8a93          	mv	s5,s7
    a25c:	01012b03          	lw	s6,16(sp)
    a260:	00c12b83          	lw	s7,12(sp)
    a264:	00812c03          	lw	s8,8(sp)
    a268:	00048413          	mv	s0,s1
    a26c:	d95ff06f          	j	a000 <_realloc_r+0x17c>
    a270:	00040593          	mv	a1,s0
    a274:	ae8fd0ef          	jal	755c <memmove>
    a278:	d3dff06f          	j	9fb4 <_realloc_r+0x130>
    a27c:	00c6a783          	lw	a5,12(a3)
    a280:	0086a703          	lw	a4,8(a3)
    a284:	ffc98613          	add	a2,s3,-4
    a288:	02400693          	li	a3,36
    a28c:	00f72623          	sw	a5,12(a4)
    a290:	00e7a423          	sw	a4,8(a5)
    a294:	008ba703          	lw	a4,8(s7)
    a298:	00cba783          	lw	a5,12(s7)
    a29c:	008b8493          	add	s1,s7,8
    a2a0:	00f72623          	sw	a5,12(a4)
    a2a4:	00e7a423          	sw	a4,8(a5)
    a2a8:	04c6ee63          	bltu	a3,a2,a304 <_realloc_r+0x480>
    a2ac:	01300713          	li	a4,19
    a2b0:	00048793          	mv	a5,s1
    a2b4:	f8c774e3          	bgeu	a4,a2,a23c <_realloc_r+0x3b8>
    a2b8:	00042703          	lw	a4,0(s0)
    a2bc:	01b00793          	li	a5,27
    a2c0:	00eba423          	sw	a4,8(s7)
    a2c4:	00442703          	lw	a4,4(s0)
    a2c8:	00eba623          	sw	a4,12(s7)
    a2cc:	0ac7f063          	bgeu	a5,a2,a36c <_realloc_r+0x4e8>
    a2d0:	00842703          	lw	a4,8(s0)
    a2d4:	02400793          	li	a5,36
    a2d8:	00eba823          	sw	a4,16(s7)
    a2dc:	00c42703          	lw	a4,12(s0)
    a2e0:	00ebaa23          	sw	a4,20(s7)
    a2e4:	f4f618e3          	bne	a2,a5,a234 <_realloc_r+0x3b0>
    a2e8:	01042703          	lw	a4,16(s0)
    a2ec:	020b8793          	add	a5,s7,32
    a2f0:	01840413          	add	s0,s0,24
    a2f4:	00ebac23          	sw	a4,24(s7)
    a2f8:	ffc42703          	lw	a4,-4(s0)
    a2fc:	00ebae23          	sw	a4,28(s7)
    a300:	f3dff06f          	j	a23c <_realloc_r+0x3b8>
    a304:	00040593          	mv	a1,s0
    a308:	00048513          	mv	a0,s1
    a30c:	a50fd0ef          	jal	755c <memmove>
    a310:	f45ff06f          	j	a254 <_realloc_r+0x3d0>
    a314:	00842703          	lw	a4,8(s0)
    a318:	00e52423          	sw	a4,8(a0)
    a31c:	00c42703          	lw	a4,12(s0)
    a320:	00e52623          	sw	a4,12(a0)
    a324:	06f60463          	beq	a2,a5,a38c <_realloc_r+0x508>
    a328:	01040713          	add	a4,s0,16
    a32c:	01050793          	add	a5,a0,16
    a330:	c6dff06f          	j	9f9c <_realloc_r+0x118>
    a334:	014a8ab3          	add	s5,s5,s4
    a338:	414687b3          	sub	a5,a3,s4
    a33c:	015c2423          	sw	s5,8(s8)
    a340:	0017e793          	or	a5,a5,1
    a344:	00faa223          	sw	a5,4(s5)
    a348:	ffc42783          	lw	a5,-4(s0)
    a34c:	00090513          	mv	a0,s2
    a350:	00040493          	mv	s1,s0
    a354:	0017f793          	and	a5,a5,1
    a358:	0147e7b3          	or	a5,a5,s4
    a35c:	fef42e23          	sw	a5,-4(s0)
    a360:	e8cf70ef          	jal	19ec <__malloc_unlock>
    a364:	00812c03          	lw	s8,8(sp)
    a368:	cd1ff06f          	j	a038 <_realloc_r+0x1b4>
    a36c:	00840413          	add	s0,s0,8
    a370:	010b8793          	add	a5,s7,16
    a374:	ec9ff06f          	j	a23c <_realloc_r+0x3b8>
    a378:	00090513          	mv	a0,s2
    a37c:	e70f70ef          	jal	19ec <__malloc_unlock>
    a380:	00000493          	li	s1,0
    a384:	00812c03          	lw	s8,8(sp)
    a388:	cb1ff06f          	j	a038 <_realloc_r+0x1b4>
    a38c:	01042683          	lw	a3,16(s0)
    a390:	01840713          	add	a4,s0,24
    a394:	01850793          	add	a5,a0,24
    a398:	00d52823          	sw	a3,16(a0)
    a39c:	01442683          	lw	a3,20(s0)
    a3a0:	00d52a23          	sw	a3,20(a0)
    a3a4:	bf9ff06f          	j	9f9c <_realloc_r+0x118>
    a3a8:	00040593          	mv	a1,s0
    a3ac:	00048513          	mv	a0,s1
    a3b0:	9acfd0ef          	jal	755c <memmove>
    a3b4:	db5ff06f          	j	a168 <_realloc_r+0x2e4>
    a3b8:	00842783          	lw	a5,8(s0)
    a3bc:	00fba823          	sw	a5,16(s7)
    a3c0:	00c42783          	lw	a5,12(s0)
    a3c4:	00fbaa23          	sw	a5,20(s7)
    a3c8:	00d60863          	beq	a2,a3,a3d8 <_realloc_r+0x554>
    a3cc:	01040413          	add	s0,s0,16
    a3d0:	018b8793          	add	a5,s7,24
    a3d4:	d7dff06f          	j	a150 <_realloc_r+0x2cc>
    a3d8:	01042703          	lw	a4,16(s0)
    a3dc:	020b8793          	add	a5,s7,32
    a3e0:	01840413          	add	s0,s0,24
    a3e4:	00ebac23          	sw	a4,24(s7)
    a3e8:	ffc42703          	lw	a4,-4(s0)
    a3ec:	00ebae23          	sw	a4,28(s7)
    a3f0:	d61ff06f          	j	a150 <_realloc_r+0x2cc>

0000a3f4 <__ascii_wctomb>:
    a3f4:	02058463          	beqz	a1,a41c <__ascii_wctomb+0x28>
    a3f8:	0ff00793          	li	a5,255
    a3fc:	00c7e863          	bltu	a5,a2,a40c <__ascii_wctomb+0x18>
    a400:	00c58023          	sb	a2,0(a1)
    a404:	00100513          	li	a0,1
    a408:	00008067          	ret
    a40c:	08a00793          	li	a5,138
    a410:	00f52023          	sw	a5,0(a0)
    a414:	fff00513          	li	a0,-1
    a418:	00008067          	ret
    a41c:	00000513          	li	a0,0
    a420:	00008067          	ret

0000a424 <_wcrtomb_r>:
    a424:	fe010113          	add	sp,sp,-32
    a428:	00812c23          	sw	s0,24(sp)
    a42c:	00912a23          	sw	s1,20(sp)
    a430:	00112e23          	sw	ra,28(sp)
    a434:	00050493          	mv	s1,a0
    a438:	10450413          	add	s0,a0,260
    a43c:	00068463          	beqz	a3,a444 <_wcrtomb_r+0x20>
    a440:	00068413          	mv	s0,a3
    a444:	7fff6797          	auipc	a5,0x7fff6
    a448:	1d07a783          	lw	a5,464(a5) # 80000614 <__global_locale+0xe0>
    a44c:	00040693          	mv	a3,s0
    a450:	02058463          	beqz	a1,a478 <_wcrtomb_r+0x54>
    a454:	00048513          	mv	a0,s1
    a458:	000780e7          	jalr	a5
    a45c:	fff00793          	li	a5,-1
    a460:	02f50863          	beq	a0,a5,a490 <_wcrtomb_r+0x6c>
    a464:	01c12083          	lw	ra,28(sp)
    a468:	01812403          	lw	s0,24(sp)
    a46c:	01412483          	lw	s1,20(sp)
    a470:	02010113          	add	sp,sp,32
    a474:	00008067          	ret
    a478:	00000613          	li	a2,0
    a47c:	00410593          	add	a1,sp,4
    a480:	00048513          	mv	a0,s1
    a484:	000780e7          	jalr	a5
    a488:	fff00793          	li	a5,-1
    a48c:	fcf51ce3          	bne	a0,a5,a464 <_wcrtomb_r+0x40>
    a490:	00042023          	sw	zero,0(s0)
    a494:	01c12083          	lw	ra,28(sp)
    a498:	01812403          	lw	s0,24(sp)
    a49c:	08a00793          	li	a5,138
    a4a0:	00f4a023          	sw	a5,0(s1)
    a4a4:	01412483          	lw	s1,20(sp)
    a4a8:	02010113          	add	sp,sp,32
    a4ac:	00008067          	ret

0000a4b0 <_wcsrtombs_r>:
    a4b0:	00070793          	mv	a5,a4
    a4b4:	00068713          	mv	a4,a3
    a4b8:	fff00693          	li	a3,-1
    a4bc:	1350006f          	j	adf0 <_wcsnrtombs_r>

0000a4c0 <_fclose_r>:
    a4c0:	ff010113          	add	sp,sp,-16
    a4c4:	00112623          	sw	ra,12(sp)
    a4c8:	01212023          	sw	s2,0(sp)
    a4cc:	0e058263          	beqz	a1,a5b0 <_fclose_r+0xf0>
    a4d0:	00812423          	sw	s0,8(sp)
    a4d4:	00912223          	sw	s1,4(sp)
    a4d8:	00058413          	mv	s0,a1
    a4dc:	00050493          	mv	s1,a0
    a4e0:	00050663          	beqz	a0,a4ec <_fclose_r+0x2c>
    a4e4:	03452783          	lw	a5,52(a0)
    a4e8:	10078063          	beqz	a5,a5e8 <_fclose_r+0x128>
    a4ec:	06442783          	lw	a5,100(s0)
    a4f0:	00c41703          	lh	a4,12(s0)
    a4f4:	0017f793          	and	a5,a5,1
    a4f8:	0a079663          	bnez	a5,a5a4 <_fclose_r+0xe4>
    a4fc:	20077713          	and	a4,a4,512
    a500:	0e070863          	beqz	a4,a5f0 <_fclose_r+0x130>
    a504:	00040593          	mv	a1,s0
    a508:	00048513          	mv	a0,s1
    a50c:	c71fb0ef          	jal	617c <__sflush_r>
    a510:	02c42783          	lw	a5,44(s0)
    a514:	00050913          	mv	s2,a0
    a518:	00078a63          	beqz	a5,a52c <_fclose_r+0x6c>
    a51c:	01c42583          	lw	a1,28(s0)
    a520:	00048513          	mv	a0,s1
    a524:	000780e7          	jalr	a5
    a528:	0a054063          	bltz	a0,a5c8 <_fclose_r+0x108>
    a52c:	00c45783          	lhu	a5,12(s0)
    a530:	0807f793          	and	a5,a5,128
    a534:	0a079263          	bnez	a5,a5d8 <_fclose_r+0x118>
    a538:	03042583          	lw	a1,48(s0)
    a53c:	00058c63          	beqz	a1,a554 <_fclose_r+0x94>
    a540:	04040793          	add	a5,s0,64
    a544:	00f58663          	beq	a1,a5,a550 <_fclose_r+0x90>
    a548:	00048513          	mv	a0,s1
    a54c:	9a9f60ef          	jal	ef4 <_free_r>
    a550:	02042823          	sw	zero,48(s0)
    a554:	04442583          	lw	a1,68(s0)
    a558:	00058863          	beqz	a1,a568 <_fclose_r+0xa8>
    a55c:	00048513          	mv	a0,s1
    a560:	995f60ef          	jal	ef4 <_free_r>
    a564:	04042223          	sw	zero,68(s0)
    a568:	9ccfc0ef          	jal	6734 <__sfp_lock_acquire>
    a56c:	06442783          	lw	a5,100(s0)
    a570:	00041623          	sh	zero,12(s0)
    a574:	0017f793          	and	a5,a5,1
    a578:	0a078663          	beqz	a5,a624 <_fclose_r+0x164>
    a57c:	05842503          	lw	a0,88(s0)
    a580:	fd1fc0ef          	jal	7550 <__retarget_lock_close_recursive>
    a584:	9bcfc0ef          	jal	6740 <__sfp_lock_release>
    a588:	00c12083          	lw	ra,12(sp)
    a58c:	00812403          	lw	s0,8(sp)
    a590:	00412483          	lw	s1,4(sp)
    a594:	00090513          	mv	a0,s2
    a598:	00012903          	lw	s2,0(sp)
    a59c:	01010113          	add	sp,sp,16
    a5a0:	00008067          	ret
    a5a4:	f60710e3          	bnez	a4,a504 <_fclose_r+0x44>
    a5a8:	00812403          	lw	s0,8(sp)
    a5ac:	00412483          	lw	s1,4(sp)
    a5b0:	00000913          	li	s2,0
    a5b4:	00c12083          	lw	ra,12(sp)
    a5b8:	00090513          	mv	a0,s2
    a5bc:	00012903          	lw	s2,0(sp)
    a5c0:	01010113          	add	sp,sp,16
    a5c4:	00008067          	ret
    a5c8:	00c45783          	lhu	a5,12(s0)
    a5cc:	fff00913          	li	s2,-1
    a5d0:	0807f793          	and	a5,a5,128
    a5d4:	f60782e3          	beqz	a5,a538 <_fclose_r+0x78>
    a5d8:	01042583          	lw	a1,16(s0)
    a5dc:	00048513          	mv	a0,s1
    a5e0:	915f60ef          	jal	ef4 <_free_r>
    a5e4:	f55ff06f          	j	a538 <_fclose_r+0x78>
    a5e8:	8dcfc0ef          	jal	66c4 <__sinit>
    a5ec:	f01ff06f          	j	a4ec <_fclose_r+0x2c>
    a5f0:	05842503          	lw	a0,88(s0)
    a5f4:	f61fc0ef          	jal	7554 <__retarget_lock_acquire_recursive>
    a5f8:	00c41783          	lh	a5,12(s0)
    a5fc:	f00794e3          	bnez	a5,a504 <_fclose_r+0x44>
    a600:	06442783          	lw	a5,100(s0)
    a604:	0017f793          	and	a5,a5,1
    a608:	fa0790e3          	bnez	a5,a5a8 <_fclose_r+0xe8>
    a60c:	05842503          	lw	a0,88(s0)
    a610:	00000913          	li	s2,0
    a614:	f45fc0ef          	jal	7558 <__retarget_lock_release_recursive>
    a618:	00812403          	lw	s0,8(sp)
    a61c:	00412483          	lw	s1,4(sp)
    a620:	f95ff06f          	j	a5b4 <_fclose_r+0xf4>
    a624:	05842503          	lw	a0,88(s0)
    a628:	f31fc0ef          	jal	7558 <__retarget_lock_release_recursive>
    a62c:	f51ff06f          	j	a57c <_fclose_r+0xbc>

0000a630 <__smakebuf_r>:
    a630:	00c59783          	lh	a5,12(a1)
    a634:	f8010113          	add	sp,sp,-128
    a638:	06812c23          	sw	s0,120(sp)
    a63c:	06112e23          	sw	ra,124(sp)
    a640:	0027f713          	and	a4,a5,2
    a644:	00058413          	mv	s0,a1
    a648:	02070463          	beqz	a4,a670 <__smakebuf_r+0x40>
    a64c:	04358793          	add	a5,a1,67
    a650:	00f5a023          	sw	a5,0(a1)
    a654:	00f5a823          	sw	a5,16(a1)
    a658:	00100793          	li	a5,1
    a65c:	00f5aa23          	sw	a5,20(a1)
    a660:	07c12083          	lw	ra,124(sp)
    a664:	07812403          	lw	s0,120(sp)
    a668:	08010113          	add	sp,sp,128
    a66c:	00008067          	ret
    a670:	00e59583          	lh	a1,14(a1)
    a674:	06912a23          	sw	s1,116(sp)
    a678:	07212823          	sw	s2,112(sp)
    a67c:	07312623          	sw	s3,108(sp)
    a680:	07412423          	sw	s4,104(sp)
    a684:	00050493          	mv	s1,a0
    a688:	0805c663          	bltz	a1,a714 <__smakebuf_r+0xe4>
    a68c:	00810613          	add	a2,sp,8
    a690:	2c8000ef          	jal	a958 <_fstat_r>
    a694:	06054e63          	bltz	a0,a710 <__smakebuf_r+0xe0>
    a698:	00c12783          	lw	a5,12(sp)
    a69c:	0000f937          	lui	s2,0xf
    a6a0:	000019b7          	lui	s3,0x1
    a6a4:	00f97933          	and	s2,s2,a5
    a6a8:	ffffe7b7          	lui	a5,0xffffe
    a6ac:	00f90933          	add	s2,s2,a5
    a6b0:	00193913          	seqz	s2,s2
    a6b4:	40000a13          	li	s4,1024
    a6b8:	80098993          	add	s3,s3,-2048 # 800 <_kill>
    a6bc:	000a0593          	mv	a1,s4
    a6c0:	00048513          	mv	a0,s1
    a6c4:	b3df60ef          	jal	1200 <_malloc_r>
    a6c8:	00c41783          	lh	a5,12(s0)
    a6cc:	06050863          	beqz	a0,a73c <__smakebuf_r+0x10c>
    a6d0:	0807e793          	or	a5,a5,128
    a6d4:	00a42023          	sw	a0,0(s0)
    a6d8:	00a42823          	sw	a0,16(s0)
    a6dc:	00f41623          	sh	a5,12(s0)
    a6e0:	01442a23          	sw	s4,20(s0)
    a6e4:	0a091063          	bnez	s2,a784 <__smakebuf_r+0x154>
    a6e8:	0137e7b3          	or	a5,a5,s3
    a6ec:	07c12083          	lw	ra,124(sp)
    a6f0:	00f41623          	sh	a5,12(s0)
    a6f4:	07812403          	lw	s0,120(sp)
    a6f8:	07412483          	lw	s1,116(sp)
    a6fc:	07012903          	lw	s2,112(sp)
    a700:	06c12983          	lw	s3,108(sp)
    a704:	06812a03          	lw	s4,104(sp)
    a708:	08010113          	add	sp,sp,128
    a70c:	00008067          	ret
    a710:	00c41783          	lh	a5,12(s0)
    a714:	0807f793          	and	a5,a5,128
    a718:	00000913          	li	s2,0
    a71c:	04078e63          	beqz	a5,a778 <__smakebuf_r+0x148>
    a720:	04000a13          	li	s4,64
    a724:	000a0593          	mv	a1,s4
    a728:	00048513          	mv	a0,s1
    a72c:	ad5f60ef          	jal	1200 <_malloc_r>
    a730:	00c41783          	lh	a5,12(s0)
    a734:	00000993          	li	s3,0
    a738:	f8051ce3          	bnez	a0,a6d0 <__smakebuf_r+0xa0>
    a73c:	2007f713          	and	a4,a5,512
    a740:	04071e63          	bnez	a4,a79c <__smakebuf_r+0x16c>
    a744:	ffc7f793          	and	a5,a5,-4
    a748:	0027e793          	or	a5,a5,2
    a74c:	04340713          	add	a4,s0,67
    a750:	00f41623          	sh	a5,12(s0)
    a754:	00100793          	li	a5,1
    a758:	07412483          	lw	s1,116(sp)
    a75c:	07012903          	lw	s2,112(sp)
    a760:	06c12983          	lw	s3,108(sp)
    a764:	06812a03          	lw	s4,104(sp)
    a768:	00e42023          	sw	a4,0(s0)
    a76c:	00e42823          	sw	a4,16(s0)
    a770:	00f42a23          	sw	a5,20(s0)
    a774:	eedff06f          	j	a660 <__smakebuf_r+0x30>
    a778:	40000a13          	li	s4,1024
    a77c:	00000993          	li	s3,0
    a780:	f3dff06f          	j	a6bc <__smakebuf_r+0x8c>
    a784:	00e41583          	lh	a1,14(s0)
    a788:	00048513          	mv	a0,s1
    a78c:	22c000ef          	jal	a9b8 <_isatty_r>
    a790:	02051063          	bnez	a0,a7b0 <__smakebuf_r+0x180>
    a794:	00c41783          	lh	a5,12(s0)
    a798:	f51ff06f          	j	a6e8 <__smakebuf_r+0xb8>
    a79c:	07412483          	lw	s1,116(sp)
    a7a0:	07012903          	lw	s2,112(sp)
    a7a4:	06c12983          	lw	s3,108(sp)
    a7a8:	06812a03          	lw	s4,104(sp)
    a7ac:	eb5ff06f          	j	a660 <__smakebuf_r+0x30>
    a7b0:	00c45783          	lhu	a5,12(s0)
    a7b4:	ffc7f793          	and	a5,a5,-4
    a7b8:	0017e793          	or	a5,a5,1
    a7bc:	01079793          	sll	a5,a5,0x10
    a7c0:	4107d793          	sra	a5,a5,0x10
    a7c4:	f25ff06f          	j	a6e8 <__smakebuf_r+0xb8>

0000a7c8 <__swbuf_r>:
    a7c8:	fe010113          	add	sp,sp,-32
    a7cc:	00812c23          	sw	s0,24(sp)
    a7d0:	00912a23          	sw	s1,20(sp)
    a7d4:	01212823          	sw	s2,16(sp)
    a7d8:	00112e23          	sw	ra,28(sp)
    a7dc:	00050913          	mv	s2,a0
    a7e0:	00058493          	mv	s1,a1
    a7e4:	00060413          	mv	s0,a2
    a7e8:	00050663          	beqz	a0,a7f4 <__swbuf_r+0x2c>
    a7ec:	03452783          	lw	a5,52(a0)
    a7f0:	16078063          	beqz	a5,a950 <__swbuf_r+0x188>
    a7f4:	01842783          	lw	a5,24(s0)
    a7f8:	00c41703          	lh	a4,12(s0)
    a7fc:	00f42423          	sw	a5,8(s0)
    a800:	00877793          	and	a5,a4,8
    a804:	08078063          	beqz	a5,a884 <__swbuf_r+0xbc>
    a808:	01042783          	lw	a5,16(s0)
    a80c:	06078c63          	beqz	a5,a884 <__swbuf_r+0xbc>
    a810:	01312623          	sw	s3,12(sp)
    a814:	01271693          	sll	a3,a4,0x12
    a818:	0ff4f993          	zext.b	s3,s1
    a81c:	0ff4f493          	zext.b	s1,s1
    a820:	0806d863          	bgez	a3,a8b0 <__swbuf_r+0xe8>
    a824:	00042703          	lw	a4,0(s0)
    a828:	01442683          	lw	a3,20(s0)
    a82c:	40f707b3          	sub	a5,a4,a5
    a830:	0ad7d863          	bge	a5,a3,a8e0 <__swbuf_r+0x118>
    a834:	00842683          	lw	a3,8(s0)
    a838:	00170613          	add	a2,a4,1
    a83c:	00c42023          	sw	a2,0(s0)
    a840:	fff68693          	add	a3,a3,-1
    a844:	00d42423          	sw	a3,8(s0)
    a848:	01370023          	sb	s3,0(a4)
    a84c:	01442703          	lw	a4,20(s0)
    a850:	00178793          	add	a5,a5,1 # ffffe001 <__crt0_ram_last+0x7ff7e002>
    a854:	0cf70263          	beq	a4,a5,a918 <__swbuf_r+0x150>
    a858:	00c45783          	lhu	a5,12(s0)
    a85c:	0017f793          	and	a5,a5,1
    a860:	0c079a63          	bnez	a5,a934 <__swbuf_r+0x16c>
    a864:	00c12983          	lw	s3,12(sp)
    a868:	01c12083          	lw	ra,28(sp)
    a86c:	01812403          	lw	s0,24(sp)
    a870:	01012903          	lw	s2,16(sp)
    a874:	00048513          	mv	a0,s1
    a878:	01412483          	lw	s1,20(sp)
    a87c:	02010113          	add	sp,sp,32
    a880:	00008067          	ret
    a884:	00040593          	mv	a1,s0
    a888:	00090513          	mv	a0,s2
    a88c:	decfc0ef          	jal	6e78 <__swsetup_r>
    a890:	08051e63          	bnez	a0,a92c <__swbuf_r+0x164>
    a894:	00c41703          	lh	a4,12(s0)
    a898:	01312623          	sw	s3,12(sp)
    a89c:	01042783          	lw	a5,16(s0)
    a8a0:	01271693          	sll	a3,a4,0x12
    a8a4:	0ff4f993          	zext.b	s3,s1
    a8a8:	0ff4f493          	zext.b	s1,s1
    a8ac:	f606cce3          	bltz	a3,a824 <__swbuf_r+0x5c>
    a8b0:	06442683          	lw	a3,100(s0)
    a8b4:	ffffe637          	lui	a2,0xffffe
    a8b8:	000025b7          	lui	a1,0x2
    a8bc:	00b76733          	or	a4,a4,a1
    a8c0:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    a8c4:	00c6f6b3          	and	a3,a3,a2
    a8c8:	00e41623          	sh	a4,12(s0)
    a8cc:	00042703          	lw	a4,0(s0)
    a8d0:	06d42223          	sw	a3,100(s0)
    a8d4:	01442683          	lw	a3,20(s0)
    a8d8:	40f707b3          	sub	a5,a4,a5
    a8dc:	f4d7cce3          	blt	a5,a3,a834 <__swbuf_r+0x6c>
    a8e0:	00040593          	mv	a1,s0
    a8e4:	00090513          	mv	a0,s2
    a8e8:	ae1fb0ef          	jal	63c8 <_fflush_r>
    a8ec:	02051e63          	bnez	a0,a928 <__swbuf_r+0x160>
    a8f0:	00042703          	lw	a4,0(s0)
    a8f4:	00842683          	lw	a3,8(s0)
    a8f8:	00100793          	li	a5,1
    a8fc:	00170613          	add	a2,a4,1
    a900:	fff68693          	add	a3,a3,-1
    a904:	00c42023          	sw	a2,0(s0)
    a908:	00d42423          	sw	a3,8(s0)
    a90c:	01370023          	sb	s3,0(a4)
    a910:	01442703          	lw	a4,20(s0)
    a914:	f4f712e3          	bne	a4,a5,a858 <__swbuf_r+0x90>
    a918:	00040593          	mv	a1,s0
    a91c:	00090513          	mv	a0,s2
    a920:	aa9fb0ef          	jal	63c8 <_fflush_r>
    a924:	f40500e3          	beqz	a0,a864 <__swbuf_r+0x9c>
    a928:	00c12983          	lw	s3,12(sp)
    a92c:	fff00493          	li	s1,-1
    a930:	f39ff06f          	j	a868 <__swbuf_r+0xa0>
    a934:	00a00793          	li	a5,10
    a938:	f2f496e3          	bne	s1,a5,a864 <__swbuf_r+0x9c>
    a93c:	00040593          	mv	a1,s0
    a940:	00090513          	mv	a0,s2
    a944:	a85fb0ef          	jal	63c8 <_fflush_r>
    a948:	f0050ee3          	beqz	a0,a864 <__swbuf_r+0x9c>
    a94c:	fddff06f          	j	a928 <__swbuf_r+0x160>
    a950:	d75fb0ef          	jal	66c4 <__sinit>
    a954:	ea1ff06f          	j	a7f4 <__swbuf_r+0x2c>

0000a958 <_fstat_r>:
    a958:	ff010113          	add	sp,sp,-16
    a95c:	00058713          	mv	a4,a1
    a960:	00812423          	sw	s0,8(sp)
    a964:	00060593          	mv	a1,a2
    a968:	00050413          	mv	s0,a0
    a96c:	00070513          	mv	a0,a4
    a970:	7fff6797          	auipc	a5,0x7fff6
    a974:	da07a423          	sw	zero,-600(a5) # 80000718 <errno>
    a978:	00112623          	sw	ra,12(sp)
    a97c:	e65f50ef          	jal	7e0 <_fstat>
    a980:	fff00793          	li	a5,-1
    a984:	00f50a63          	beq	a0,a5,a998 <_fstat_r+0x40>
    a988:	00c12083          	lw	ra,12(sp)
    a98c:	00812403          	lw	s0,8(sp)
    a990:	01010113          	add	sp,sp,16
    a994:	00008067          	ret
    a998:	7fff6797          	auipc	a5,0x7fff6
    a99c:	d807a783          	lw	a5,-640(a5) # 80000718 <errno>
    a9a0:	fe0784e3          	beqz	a5,a988 <_fstat_r+0x30>
    a9a4:	00c12083          	lw	ra,12(sp)
    a9a8:	00f42023          	sw	a5,0(s0)
    a9ac:	00812403          	lw	s0,8(sp)
    a9b0:	01010113          	add	sp,sp,16
    a9b4:	00008067          	ret

0000a9b8 <_isatty_r>:
    a9b8:	ff010113          	add	sp,sp,-16
    a9bc:	00812423          	sw	s0,8(sp)
    a9c0:	00050413          	mv	s0,a0
    a9c4:	00058513          	mv	a0,a1
    a9c8:	7fff6797          	auipc	a5,0x7fff6
    a9cc:	d407a823          	sw	zero,-688(a5) # 80000718 <errno>
    a9d0:	00112623          	sw	ra,12(sp)
    a9d4:	e25f50ef          	jal	7f8 <_isatty>
    a9d8:	fff00793          	li	a5,-1
    a9dc:	00f50a63          	beq	a0,a5,a9f0 <_isatty_r+0x38>
    a9e0:	00c12083          	lw	ra,12(sp)
    a9e4:	00812403          	lw	s0,8(sp)
    a9e8:	01010113          	add	sp,sp,16
    a9ec:	00008067          	ret
    a9f0:	7fff6797          	auipc	a5,0x7fff6
    a9f4:	d287a783          	lw	a5,-728(a5) # 80000718 <errno>
    a9f8:	fe0784e3          	beqz	a5,a9e0 <_isatty_r+0x28>
    a9fc:	00c12083          	lw	ra,12(sp)
    aa00:	00f42023          	sw	a5,0(s0)
    aa04:	00812403          	lw	s0,8(sp)
    aa08:	01010113          	add	sp,sp,16
    aa0c:	00008067          	ret

0000aa10 <__errno>:
    aa10:	7fff6517          	auipc	a0,0x7fff6
    aa14:	cf852503          	lw	a0,-776(a0) # 80000708 <_impure_ptr>
    aa18:	00008067          	ret

0000aa1c <__assert_func>:
    aa1c:	ff010113          	add	sp,sp,-16
    aa20:	00068793          	mv	a5,a3
    aa24:	7fff6717          	auipc	a4,0x7fff6
    aa28:	ce472703          	lw	a4,-796(a4) # 80000708 <_impure_ptr>
    aa2c:	00060813          	mv	a6,a2
    aa30:	00112623          	sw	ra,12(sp)
    aa34:	00c72883          	lw	a7,12(a4)
    aa38:	00078613          	mv	a2,a5
    aa3c:	00050693          	mv	a3,a0
    aa40:	00058713          	mv	a4,a1
    aa44:	00004797          	auipc	a5,0x4
    aa48:	1dc78793          	add	a5,a5,476 # ec20 <__fini_array_end+0x2c4>
    aa4c:	00080c63          	beqz	a6,aa64 <__assert_func+0x48>
    aa50:	00004597          	auipc	a1,0x4
    aa54:	1e058593          	add	a1,a1,480 # ec30 <__fini_array_end+0x2d4>
    aa58:	00088513          	mv	a0,a7
    aa5c:	3a8000ef          	jal	ae04 <fiprintf>
    aa60:	3f0000ef          	jal	ae50 <abort>
    aa64:	00004797          	auipc	a5,0x4
    aa68:	f0078793          	add	a5,a5,-256 # e964 <__fini_array_end+0x8>
    aa6c:	00078813          	mv	a6,a5
    aa70:	fe1ff06f          	j	aa50 <__assert_func+0x34>

0000aa74 <_calloc_r>:
    aa74:	fe010113          	add	sp,sp,-32
    aa78:	00812c23          	sw	s0,24(sp)
    aa7c:	00112e23          	sw	ra,28(sp)
    aa80:	0105d693          	srl	a3,a1,0x10
    aa84:	00058793          	mv	a5,a1
    aa88:	00050413          	mv	s0,a0
    aa8c:	01065713          	srl	a4,a2,0x10
    aa90:	0c069063          	bnez	a3,ab50 <_calloc_r+0xdc>
    aa94:	14071a63          	bnez	a4,abe8 <_calloc_r+0x174>
    aa98:	01061593          	sll	a1,a2,0x10
    aa9c:	01079513          	sll	a0,a5,0x10
    aaa0:	0105d593          	srl	a1,a1,0x10
    aaa4:	01055513          	srl	a0,a0,0x10
    aaa8:	4bd030ef          	jal	e764 <__mulsi3>
    aaac:	00050593          	mv	a1,a0
    aab0:	00040513          	mv	a0,s0
    aab4:	f4cf60ef          	jal	1200 <_malloc_r>
    aab8:	00050413          	mv	s0,a0
    aabc:	10050a63          	beqz	a0,abd0 <_calloc_r+0x15c>
    aac0:	ffc52603          	lw	a2,-4(a0)
    aac4:	02400713          	li	a4,36
    aac8:	ffc67613          	and	a2,a2,-4
    aacc:	ffc60613          	add	a2,a2,-4
    aad0:	04c76863          	bltu	a4,a2,ab20 <_calloc_r+0xac>
    aad4:	01300693          	li	a3,19
    aad8:	00050793          	mv	a5,a0
    aadc:	02c6f263          	bgeu	a3,a2,ab00 <_calloc_r+0x8c>
    aae0:	00052023          	sw	zero,0(a0)
    aae4:	00052223          	sw	zero,4(a0)
    aae8:	01b00793          	li	a5,27
    aaec:	04c7f863          	bgeu	a5,a2,ab3c <_calloc_r+0xc8>
    aaf0:	00052423          	sw	zero,8(a0)
    aaf4:	00052623          	sw	zero,12(a0)
    aaf8:	01050793          	add	a5,a0,16
    aafc:	10e60263          	beq	a2,a4,ac00 <_calloc_r+0x18c>
    ab00:	0007a023          	sw	zero,0(a5)
    ab04:	0007a223          	sw	zero,4(a5)
    ab08:	0007a423          	sw	zero,8(a5)
    ab0c:	01c12083          	lw	ra,28(sp)
    ab10:	00040513          	mv	a0,s0
    ab14:	01812403          	lw	s0,24(sp)
    ab18:	02010113          	add	sp,sp,32
    ab1c:	00008067          	ret
    ab20:	00000593          	li	a1,0
    ab24:	f81f50ef          	jal	aa4 <memset>
    ab28:	01c12083          	lw	ra,28(sp)
    ab2c:	00040513          	mv	a0,s0
    ab30:	01812403          	lw	s0,24(sp)
    ab34:	02010113          	add	sp,sp,32
    ab38:	00008067          	ret
    ab3c:	00850793          	add	a5,a0,8
    ab40:	0007a023          	sw	zero,0(a5)
    ab44:	0007a223          	sw	zero,4(a5)
    ab48:	0007a423          	sw	zero,8(a5)
    ab4c:	fc1ff06f          	j	ab0c <_calloc_r+0x98>
    ab50:	0c071663          	bnez	a4,ac1c <_calloc_r+0x1a8>
    ab54:	01212823          	sw	s2,16(sp)
    ab58:	01312623          	sw	s3,12(sp)
    ab5c:	00912a23          	sw	s1,20(sp)
    ab60:	00068913          	mv	s2,a3
    ab64:	00060993          	mv	s3,a2
    ab68:	01079513          	sll	a0,a5,0x10
    ab6c:	01061593          	sll	a1,a2,0x10
    ab70:	0105d593          	srl	a1,a1,0x10
    ab74:	01055513          	srl	a0,a0,0x10
    ab78:	3ed030ef          	jal	e764 <__mulsi3>
    ab7c:	00050493          	mv	s1,a0
    ab80:	01091593          	sll	a1,s2,0x10
    ab84:	01099513          	sll	a0,s3,0x10
    ab88:	0105d593          	srl	a1,a1,0x10
    ab8c:	01055513          	srl	a0,a0,0x10
    ab90:	3d5030ef          	jal	e764 <__mulsi3>
    ab94:	0104d793          	srl	a5,s1,0x10
    ab98:	00f505b3          	add	a1,a0,a5
    ab9c:	0105d793          	srl	a5,a1,0x10
    aba0:	06079863          	bnez	a5,ac10 <_calloc_r+0x19c>
    aba4:	01049493          	sll	s1,s1,0x10
    aba8:	0104d493          	srl	s1,s1,0x10
    abac:	01059593          	sll	a1,a1,0x10
    abb0:	0095e5b3          	or	a1,a1,s1
    abb4:	00040513          	mv	a0,s0
    abb8:	01412483          	lw	s1,20(sp)
    abbc:	01012903          	lw	s2,16(sp)
    abc0:	00c12983          	lw	s3,12(sp)
    abc4:	e3cf60ef          	jal	1200 <_malloc_r>
    abc8:	00050413          	mv	s0,a0
    abcc:	ee051ae3          	bnez	a0,aac0 <_calloc_r+0x4c>
    abd0:	00000413          	li	s0,0
    abd4:	01c12083          	lw	ra,28(sp)
    abd8:	00040513          	mv	a0,s0
    abdc:	01812403          	lw	s0,24(sp)
    abe0:	02010113          	add	sp,sp,32
    abe4:	00008067          	ret
    abe8:	01212823          	sw	s2,16(sp)
    abec:	01312623          	sw	s3,12(sp)
    abf0:	00912a23          	sw	s1,20(sp)
    abf4:	00070913          	mv	s2,a4
    abf8:	00058993          	mv	s3,a1
    abfc:	f6dff06f          	j	ab68 <_calloc_r+0xf4>
    ac00:	00052823          	sw	zero,16(a0)
    ac04:	01850793          	add	a5,a0,24
    ac08:	00052a23          	sw	zero,20(a0)
    ac0c:	ef5ff06f          	j	ab00 <_calloc_r+0x8c>
    ac10:	01412483          	lw	s1,20(sp)
    ac14:	01012903          	lw	s2,16(sp)
    ac18:	00c12983          	lw	s3,12(sp)
    ac1c:	df5ff0ef          	jal	aa10 <__errno>
    ac20:	00c00793          	li	a5,12
    ac24:	00f52023          	sw	a5,0(a0)
    ac28:	00000413          	li	s0,0
    ac2c:	fa9ff06f          	j	abd4 <_calloc_r+0x160>

0000ac30 <_wcsnrtombs_l>:
    ac30:	fa010113          	add	sp,sp,-96
    ac34:	04912a23          	sw	s1,84(sp)
    ac38:	05212823          	sw	s2,80(sp)
    ac3c:	05312623          	sw	s3,76(sp)
    ac40:	05412423          	sw	s4,72(sp)
    ac44:	05512223          	sw	s5,68(sp)
    ac48:	04112e23          	sw	ra,92(sp)
    ac4c:	03912a23          	sw	s9,52(sp)
    ac50:	03a12823          	sw	s10,48(sp)
    ac54:	00a12623          	sw	a0,12(sp)
    ac58:	00058a13          	mv	s4,a1
    ac5c:	00060a93          	mv	s5,a2
    ac60:	00070913          	mv	s2,a4
    ac64:	00080993          	mv	s3,a6
    ac68:	00078493          	mv	s1,a5
    ac6c:	12078063          	beqz	a5,ad8c <_wcsnrtombs_l+0x15c>
    ac70:	000aac83          	lw	s9,0(s5)
    ac74:	120a0263          	beqz	s4,ad98 <_wcsnrtombs_l+0x168>
    ac78:	14090e63          	beqz	s2,add4 <_wcsnrtombs_l+0x1a4>
    ac7c:	05612023          	sw	s6,64(sp)
    ac80:	fff68b13          	add	s6,a3,-1
    ac84:	16068063          	beqz	a3,ade4 <_wcsnrtombs_l+0x1b4>
    ac88:	04812c23          	sw	s0,88(sp)
    ac8c:	03b12623          	sw	s11,44(sp)
    ac90:	03712e23          	sw	s7,60(sp)
    ac94:	03812c23          	sw	s8,56(sp)
    ac98:	000a0413          	mv	s0,s4
    ac9c:	00000d13          	li	s10,0
    aca0:	fff00d93          	li	s11,-1
    aca4:	0240006f          	j	acc8 <_wcsnrtombs_l+0x98>
    aca8:	080a1a63          	bnez	s4,ad3c <_wcsnrtombs_l+0x10c>
    acac:	000ca783          	lw	a5,0(s9)
    acb0:	004c8c93          	add	s9,s9,4
    acb4:	0c078263          	beqz	a5,ad78 <_wcsnrtombs_l+0x148>
    acb8:	1326f263          	bgeu	a3,s2,addc <_wcsnrtombs_l+0x1ac>
    acbc:	fffb0b13          	add	s6,s6,-1
    acc0:	00068d13          	mv	s10,a3
    acc4:	03bb0c63          	beq	s6,s11,acfc <_wcsnrtombs_l+0xcc>
    acc8:	0e09a783          	lw	a5,224(s3)
    accc:	000ca603          	lw	a2,0(s9)
    acd0:	00c12503          	lw	a0,12(sp)
    acd4:	00048693          	mv	a3,s1
    acd8:	01410593          	add	a1,sp,20
    acdc:	0004ac03          	lw	s8,0(s1)
    ace0:	0044ab83          	lw	s7,4(s1)
    ace4:	000780e7          	jalr	a5
    ace8:	0bb50e63          	beq	a0,s11,ada4 <_wcsnrtombs_l+0x174>
    acec:	01a506b3          	add	a3,a0,s10
    acf0:	fad97ce3          	bgeu	s2,a3,aca8 <_wcsnrtombs_l+0x78>
    acf4:	0184a023          	sw	s8,0(s1)
    acf8:	0174a223          	sw	s7,4(s1)
    acfc:	05812403          	lw	s0,88(sp)
    ad00:	04012b03          	lw	s6,64(sp)
    ad04:	03c12b83          	lw	s7,60(sp)
    ad08:	03812c03          	lw	s8,56(sp)
    ad0c:	02c12d83          	lw	s11,44(sp)
    ad10:	05c12083          	lw	ra,92(sp)
    ad14:	05412483          	lw	s1,84(sp)
    ad18:	05012903          	lw	s2,80(sp)
    ad1c:	04c12983          	lw	s3,76(sp)
    ad20:	04812a03          	lw	s4,72(sp)
    ad24:	04412a83          	lw	s5,68(sp)
    ad28:	03412c83          	lw	s9,52(sp)
    ad2c:	000d0513          	mv	a0,s10
    ad30:	03012d03          	lw	s10,48(sp)
    ad34:	06010113          	add	sp,sp,96
    ad38:	00008067          	ret
    ad3c:	08a05063          	blez	a0,adbc <_wcsnrtombs_l+0x18c>
    ad40:	01410893          	add	a7,sp,20
    ad44:	00a40533          	add	a0,s0,a0
    ad48:	0008c783          	lbu	a5,0(a7)
    ad4c:	00140413          	add	s0,s0,1
    ad50:	00188893          	add	a7,a7,1
    ad54:	fef40fa3          	sb	a5,-1(s0)
    ad58:	fe8518e3          	bne	a0,s0,ad48 <_wcsnrtombs_l+0x118>
    ad5c:	000aa783          	lw	a5,0(s5)
    ad60:	00050413          	mv	s0,a0
    ad64:	00478793          	add	a5,a5,4
    ad68:	00faa023          	sw	a5,0(s5)
    ad6c:	000ca783          	lw	a5,0(s9)
    ad70:	004c8c93          	add	s9,s9,4
    ad74:	f40792e3          	bnez	a5,acb8 <_wcsnrtombs_l+0x88>
    ad78:	000a0463          	beqz	s4,ad80 <_wcsnrtombs_l+0x150>
    ad7c:	000aa023          	sw	zero,0(s5)
    ad80:	0004a023          	sw	zero,0(s1)
    ad84:	fff68d13          	add	s10,a3,-1
    ad88:	f75ff06f          	j	acfc <_wcsnrtombs_l+0xcc>
    ad8c:	000aac83          	lw	s9,0(s5)
    ad90:	10c50493          	add	s1,a0,268
    ad94:	ee0a12e3          	bnez	s4,ac78 <_wcsnrtombs_l+0x48>
    ad98:	05612023          	sw	s6,64(sp)
    ad9c:	fff00913          	li	s2,-1
    ada0:	ee1ff06f          	j	ac80 <_wcsnrtombs_l+0x50>
    ada4:	00c12703          	lw	a4,12(sp)
    ada8:	08a00793          	li	a5,138
    adac:	fff00d13          	li	s10,-1
    adb0:	00f72023          	sw	a5,0(a4)
    adb4:	0004a023          	sw	zero,0(s1)
    adb8:	f45ff06f          	j	acfc <_wcsnrtombs_l+0xcc>
    adbc:	000aa783          	lw	a5,0(s5)
    adc0:	00040513          	mv	a0,s0
    adc4:	00050413          	mv	s0,a0
    adc8:	00478793          	add	a5,a5,4
    adcc:	00faa023          	sw	a5,0(s5)
    add0:	f9dff06f          	j	ad6c <_wcsnrtombs_l+0x13c>
    add4:	00000d13          	li	s10,0
    add8:	f39ff06f          	j	ad10 <_wcsnrtombs_l+0xe0>
    addc:	00068d13          	mv	s10,a3
    ade0:	f1dff06f          	j	acfc <_wcsnrtombs_l+0xcc>
    ade4:	04012b03          	lw	s6,64(sp)
    ade8:	00000d13          	li	s10,0
    adec:	f25ff06f          	j	ad10 <_wcsnrtombs_l+0xe0>

0000adf0 <_wcsnrtombs_r>:
    adf0:	7fff5817          	auipc	a6,0x7fff5
    adf4:	74480813          	add	a6,a6,1860 # 80000534 <__global_locale>
    adf8:	7fff6517          	auipc	a0,0x7fff6
    adfc:	91052503          	lw	a0,-1776(a0) # 80000708 <_impure_ptr>
    ae00:	e31ff06f          	j	ac30 <_wcsnrtombs_l>

0000ae04 <fiprintf>:
    ae04:	fc010113          	add	sp,sp,-64
    ae08:	02810313          	add	t1,sp,40
    ae0c:	02c12423          	sw	a2,40(sp)
    ae10:	02d12623          	sw	a3,44(sp)
    ae14:	00058613          	mv	a2,a1
    ae18:	00030693          	mv	a3,t1
    ae1c:	00050593          	mv	a1,a0
    ae20:	7fff6517          	auipc	a0,0x7fff6
    ae24:	8e852503          	lw	a0,-1816(a0) # 80000708 <_impure_ptr>
    ae28:	00112e23          	sw	ra,28(sp)
    ae2c:	02e12823          	sw	a4,48(sp)
    ae30:	02f12a23          	sw	a5,52(sp)
    ae34:	03012c23          	sw	a6,56(sp)
    ae38:	03112e23          	sw	a7,60(sp)
    ae3c:	00612623          	sw	t1,12(sp)
    ae40:	a8df90ef          	jal	48cc <_vfiprintf_r>
    ae44:	01c12083          	lw	ra,28(sp)
    ae48:	04010113          	add	sp,sp,64
    ae4c:	00008067          	ret

0000ae50 <abort>:
    ae50:	ff010113          	add	sp,sp,-16
    ae54:	00600513          	li	a0,6
    ae58:	00112623          	sw	ra,12(sp)
    ae5c:	00c000ef          	jal	ae68 <raise>
    ae60:	00100513          	li	a0,1
    ae64:	965f50ef          	jal	7c8 <_exit>

0000ae68 <raise>:
    ae68:	ff010113          	add	sp,sp,-16
    ae6c:	00912223          	sw	s1,4(sp)
    ae70:	00112623          	sw	ra,12(sp)
    ae74:	01f00793          	li	a5,31
    ae78:	7fff6497          	auipc	s1,0x7fff6
    ae7c:	8904a483          	lw	s1,-1904(s1) # 80000708 <_impure_ptr>
    ae80:	08a7ee63          	bltu	a5,a0,af1c <raise+0xb4>
    ae84:	1184a783          	lw	a5,280(s1)
    ae88:	00812423          	sw	s0,8(sp)
    ae8c:	00050413          	mv	s0,a0
    ae90:	04078263          	beqz	a5,aed4 <raise+0x6c>
    ae94:	00251713          	sll	a4,a0,0x2
    ae98:	00e787b3          	add	a5,a5,a4
    ae9c:	0007a703          	lw	a4,0(a5)
    aea0:	02070a63          	beqz	a4,aed4 <raise+0x6c>
    aea4:	00100693          	li	a3,1
    aea8:	00d70a63          	beq	a4,a3,aebc <raise+0x54>
    aeac:	fff00693          	li	a3,-1
    aeb0:	04d70663          	beq	a4,a3,aefc <raise+0x94>
    aeb4:	0007a023          	sw	zero,0(a5)
    aeb8:	000700e7          	jalr	a4
    aebc:	00812403          	lw	s0,8(sp)
    aec0:	00000513          	li	a0,0
    aec4:	00c12083          	lw	ra,12(sp)
    aec8:	00412483          	lw	s1,4(sp)
    aecc:	01010113          	add	sp,sp,16
    aed0:	00008067          	ret
    aed4:	00048513          	mv	a0,s1
    aed8:	0b4000ef          	jal	af8c <_getpid_r>
    aedc:	00040613          	mv	a2,s0
    aee0:	00812403          	lw	s0,8(sp)
    aee4:	00c12083          	lw	ra,12(sp)
    aee8:	00050593          	mv	a1,a0
    aeec:	00048513          	mv	a0,s1
    aef0:	00412483          	lw	s1,4(sp)
    aef4:	01010113          	add	sp,sp,16
    aef8:	0340006f          	j	af2c <_kill_r>
    aefc:	00812403          	lw	s0,8(sp)
    af00:	00c12083          	lw	ra,12(sp)
    af04:	01600793          	li	a5,22
    af08:	00f4a023          	sw	a5,0(s1)
    af0c:	00100513          	li	a0,1
    af10:	00412483          	lw	s1,4(sp)
    af14:	01010113          	add	sp,sp,16
    af18:	00008067          	ret
    af1c:	01600793          	li	a5,22
    af20:	00f4a023          	sw	a5,0(s1)
    af24:	fff00513          	li	a0,-1
    af28:	f9dff06f          	j	aec4 <raise+0x5c>

0000af2c <_kill_r>:
    af2c:	ff010113          	add	sp,sp,-16
    af30:	00058713          	mv	a4,a1
    af34:	00812423          	sw	s0,8(sp)
    af38:	00060593          	mv	a1,a2
    af3c:	00050413          	mv	s0,a0
    af40:	00070513          	mv	a0,a4
    af44:	7fff5797          	auipc	a5,0x7fff5
    af48:	7c07aa23          	sw	zero,2004(a5) # 80000718 <errno>
    af4c:	00112623          	sw	ra,12(sp)
    af50:	8b1f50ef          	jal	800 <_kill>
    af54:	fff00793          	li	a5,-1
    af58:	00f50a63          	beq	a0,a5,af6c <_kill_r+0x40>
    af5c:	00c12083          	lw	ra,12(sp)
    af60:	00812403          	lw	s0,8(sp)
    af64:	01010113          	add	sp,sp,16
    af68:	00008067          	ret
    af6c:	7fff5797          	auipc	a5,0x7fff5
    af70:	7ac7a783          	lw	a5,1964(a5) # 80000718 <errno>
    af74:	fe0784e3          	beqz	a5,af5c <_kill_r+0x30>
    af78:	00c12083          	lw	ra,12(sp)
    af7c:	00f42023          	sw	a5,0(s0)
    af80:	00812403          	lw	s0,8(sp)
    af84:	01010113          	add	sp,sp,16
    af88:	00008067          	ret

0000af8c <_getpid_r>:
    af8c:	865f506f          	j	7f0 <_getpid>

0000af90 <__udivdi3>:
    af90:	fd010113          	add	sp,sp,-48
    af94:	01312e23          	sw	s3,28(sp)
    af98:	02112623          	sw	ra,44(sp)
    af9c:	01612823          	sw	s6,16(sp)
    afa0:	00050993          	mv	s3,a0
    afa4:	16069663          	bnez	a3,b110 <__udivdi3+0x180>
    afa8:	02812423          	sw	s0,40(sp)
    afac:	01512a23          	sw	s5,20(sp)
    afb0:	02912223          	sw	s1,36(sp)
    afb4:	03212023          	sw	s2,32(sp)
    afb8:	01412c23          	sw	s4,24(sp)
    afbc:	00060a93          	mv	s5,a2
    afc0:	00050413          	mv	s0,a0
    afc4:	1cc5f063          	bgeu	a1,a2,b184 <__udivdi3+0x1f4>
    afc8:	000107b7          	lui	a5,0x10
    afcc:	00058493          	mv	s1,a1
    afd0:	2af66e63          	bltu	a2,a5,b28c <__udivdi3+0x2fc>
    afd4:	010007b7          	lui	a5,0x1000
    afd8:	01800713          	li	a4,24
    afdc:	00f67463          	bgeu	a2,a5,afe4 <__udivdi3+0x54>
    afe0:	01000713          	li	a4,16
    afe4:	00e656b3          	srl	a3,a2,a4
    afe8:	00004797          	auipc	a5,0x4
    afec:	26878793          	add	a5,a5,616 # f250 <__clz_tab>
    aff0:	00d787b3          	add	a5,a5,a3
    aff4:	0007c783          	lbu	a5,0(a5)
    aff8:	02000693          	li	a3,32
    affc:	00e787b3          	add	a5,a5,a4
    b000:	40f68733          	sub	a4,a3,a5
    b004:	00f68c63          	beq	a3,a5,b01c <__udivdi3+0x8c>
    b008:	00e594b3          	sll	s1,a1,a4
    b00c:	00f9d7b3          	srl	a5,s3,a5
    b010:	00e61ab3          	sll	s5,a2,a4
    b014:	0097e4b3          	or	s1,a5,s1
    b018:	00e99433          	sll	s0,s3,a4
    b01c:	010ada13          	srl	s4,s5,0x10
    b020:	000a0593          	mv	a1,s4
    b024:	00048513          	mv	a0,s1
    b028:	010a9b13          	sll	s6,s5,0x10
    b02c:	7fc030ef          	jal	e828 <__hidden___udivsi3>
    b030:	010b5b13          	srl	s6,s6,0x10
    b034:	00050593          	mv	a1,a0
    b038:	00050913          	mv	s2,a0
    b03c:	000b0513          	mv	a0,s6
    b040:	724030ef          	jal	e764 <__mulsi3>
    b044:	00050793          	mv	a5,a0
    b048:	000a0593          	mv	a1,s4
    b04c:	00048513          	mv	a0,s1
    b050:	00078493          	mv	s1,a5
    b054:	01d030ef          	jal	e870 <__umodsi3>
    b058:	01051513          	sll	a0,a0,0x10
    b05c:	01045793          	srl	a5,s0,0x10
    b060:	00a7e7b3          	or	a5,a5,a0
    b064:	0097fc63          	bgeu	a5,s1,b07c <__udivdi3+0xec>
    b068:	00fa87b3          	add	a5,s5,a5
    b06c:	fff90713          	add	a4,s2,-1 # efff <blanks.1+0x87>
    b070:	0157e463          	bltu	a5,s5,b078 <__udivdi3+0xe8>
    b074:	5a97e863          	bltu	a5,s1,b624 <__udivdi3+0x694>
    b078:	00070913          	mv	s2,a4
    b07c:	409784b3          	sub	s1,a5,s1
    b080:	000a0593          	mv	a1,s4
    b084:	00048513          	mv	a0,s1
    b088:	7a0030ef          	jal	e828 <__hidden___udivsi3>
    b08c:	00050593          	mv	a1,a0
    b090:	00050993          	mv	s3,a0
    b094:	000b0513          	mv	a0,s6
    b098:	6cc030ef          	jal	e764 <__mulsi3>
    b09c:	00050793          	mv	a5,a0
    b0a0:	000a0593          	mv	a1,s4
    b0a4:	00048513          	mv	a0,s1
    b0a8:	01041413          	sll	s0,s0,0x10
    b0ac:	00078493          	mv	s1,a5
    b0b0:	7c0030ef          	jal	e870 <__umodsi3>
    b0b4:	01051513          	sll	a0,a0,0x10
    b0b8:	01045413          	srl	s0,s0,0x10
    b0bc:	00a46433          	or	s0,s0,a0
    b0c0:	00947c63          	bgeu	s0,s1,b0d8 <__udivdi3+0x148>
    b0c4:	008a8433          	add	s0,s5,s0
    b0c8:	fff98793          	add	a5,s3,-1
    b0cc:	4d546e63          	bltu	s0,s5,b5a8 <__udivdi3+0x618>
    b0d0:	ffe98993          	add	s3,s3,-2
    b0d4:	4c947a63          	bgeu	s0,s1,b5a8 <__udivdi3+0x618>
    b0d8:	01091613          	sll	a2,s2,0x10
    b0dc:	01366533          	or	a0,a2,s3
    b0e0:	00000b13          	li	s6,0
    b0e4:	02812403          	lw	s0,40(sp)
    b0e8:	02c12083          	lw	ra,44(sp)
    b0ec:	02412483          	lw	s1,36(sp)
    b0f0:	02012903          	lw	s2,32(sp)
    b0f4:	01812a03          	lw	s4,24(sp)
    b0f8:	01412a83          	lw	s5,20(sp)
    b0fc:	01c12983          	lw	s3,28(sp)
    b100:	000b0593          	mv	a1,s6
    b104:	01012b03          	lw	s6,16(sp)
    b108:	03010113          	add	sp,sp,48
    b10c:	00008067          	ret
    b110:	02d5f263          	bgeu	a1,a3,b134 <__udivdi3+0x1a4>
    b114:	00000b13          	li	s6,0
    b118:	00000513          	li	a0,0
    b11c:	02c12083          	lw	ra,44(sp)
    b120:	01c12983          	lw	s3,28(sp)
    b124:	000b0593          	mv	a1,s6
    b128:	01012b03          	lw	s6,16(sp)
    b12c:	03010113          	add	sp,sp,48
    b130:	00008067          	ret
    b134:	000107b7          	lui	a5,0x10
    b138:	26f6ee63          	bltu	a3,a5,b3b4 <__udivdi3+0x424>
    b13c:	01000737          	lui	a4,0x1000
    b140:	01800793          	li	a5,24
    b144:	00e6f463          	bgeu	a3,a4,b14c <__udivdi3+0x1bc>
    b148:	01000793          	li	a5,16
    b14c:	00f6d533          	srl	a0,a3,a5
    b150:	00004717          	auipc	a4,0x4
    b154:	10070713          	add	a4,a4,256 # f250 <__clz_tab>
    b158:	00a70733          	add	a4,a4,a0
    b15c:	00074703          	lbu	a4,0(a4)
    b160:	02000513          	li	a0,32
    b164:	00f70733          	add	a4,a4,a5
    b168:	40e50b33          	sub	s6,a0,a4
    b16c:	26e51c63          	bne	a0,a4,b3e4 <__udivdi3+0x454>
    b170:	46b6ee63          	bltu	a3,a1,b5ec <__udivdi3+0x65c>
    b174:	00c9b533          	sltu	a0,s3,a2
    b178:	00153513          	seqz	a0,a0
    b17c:	00000b13          	li	s6,0
    b180:	f9dff06f          	j	b11c <__udivdi3+0x18c>
    b184:	10060c63          	beqz	a2,b29c <__udivdi3+0x30c>
    b188:	000107b7          	lui	a5,0x10
    b18c:	44f67663          	bgeu	a2,a5,b5d8 <__udivdi3+0x648>
    b190:	10063713          	sltiu	a4,a2,256
    b194:	00173713          	seqz	a4,a4
    b198:	00371713          	sll	a4,a4,0x3
    b19c:	00e656b3          	srl	a3,a2,a4
    b1a0:	00004797          	auipc	a5,0x4
    b1a4:	0b078793          	add	a5,a5,176 # f250 <__clz_tab>
    b1a8:	00d787b3          	add	a5,a5,a3
    b1ac:	0007c483          	lbu	s1,0(a5)
    b1b0:	02000793          	li	a5,32
    b1b4:	00e484b3          	add	s1,s1,a4
    b1b8:	40978733          	sub	a4,a5,s1
    b1bc:	10979463          	bne	a5,s1,b2c4 <__udivdi3+0x334>
    b1c0:	01061a13          	sll	s4,a2,0x10
    b1c4:	40c584b3          	sub	s1,a1,a2
    b1c8:	01065913          	srl	s2,a2,0x10
    b1cc:	010a5a13          	srl	s4,s4,0x10
    b1d0:	00100b13          	li	s6,1
    b1d4:	00090593          	mv	a1,s2
    b1d8:	00048513          	mv	a0,s1
    b1dc:	64c030ef          	jal	e828 <__hidden___udivsi3>
    b1e0:	000a0593          	mv	a1,s4
    b1e4:	00050993          	mv	s3,a0
    b1e8:	57c030ef          	jal	e764 <__mulsi3>
    b1ec:	00050793          	mv	a5,a0
    b1f0:	00090593          	mv	a1,s2
    b1f4:	00048513          	mv	a0,s1
    b1f8:	00078493          	mv	s1,a5
    b1fc:	674030ef          	jal	e870 <__umodsi3>
    b200:	01051513          	sll	a0,a0,0x10
    b204:	01045793          	srl	a5,s0,0x10
    b208:	00a7e7b3          	or	a5,a5,a0
    b20c:	0097fc63          	bgeu	a5,s1,b224 <__udivdi3+0x294>
    b210:	00fa87b3          	add	a5,s5,a5
    b214:	fff98713          	add	a4,s3,-1
    b218:	0157e463          	bltu	a5,s5,b220 <__udivdi3+0x290>
    b21c:	3e97ee63          	bltu	a5,s1,b618 <__udivdi3+0x688>
    b220:	00070993          	mv	s3,a4
    b224:	409784b3          	sub	s1,a5,s1
    b228:	00090593          	mv	a1,s2
    b22c:	00048513          	mv	a0,s1
    b230:	5f8030ef          	jal	e828 <__hidden___udivsi3>
    b234:	000a0593          	mv	a1,s4
    b238:	00050a13          	mv	s4,a0
    b23c:	528030ef          	jal	e764 <__mulsi3>
    b240:	00050793          	mv	a5,a0
    b244:	00090593          	mv	a1,s2
    b248:	00048513          	mv	a0,s1
    b24c:	01041413          	sll	s0,s0,0x10
    b250:	00078493          	mv	s1,a5
    b254:	61c030ef          	jal	e870 <__umodsi3>
    b258:	01051513          	sll	a0,a0,0x10
    b25c:	01045413          	srl	s0,s0,0x10
    b260:	00a46433          	or	s0,s0,a0
    b264:	00947e63          	bgeu	s0,s1,b280 <__udivdi3+0x2f0>
    b268:	008a8433          	add	s0,s5,s0
    b26c:	fffa0793          	add	a5,s4,-1
    b270:	01546663          	bltu	s0,s5,b27c <__udivdi3+0x2ec>
    b274:	ffea0a13          	add	s4,s4,-2
    b278:	00946463          	bltu	s0,s1,b280 <__udivdi3+0x2f0>
    b27c:	00078a13          	mv	s4,a5
    b280:	01099613          	sll	a2,s3,0x10
    b284:	01466533          	or	a0,a2,s4
    b288:	e5dff06f          	j	b0e4 <__udivdi3+0x154>
    b28c:	10063713          	sltiu	a4,a2,256
    b290:	00173713          	seqz	a4,a4
    b294:	00371713          	sll	a4,a4,0x3
    b298:	d4dff06f          	j	afe4 <__udivdi3+0x54>
    b29c:	00000693          	li	a3,0
    b2a0:	00004797          	auipc	a5,0x4
    b2a4:	fb078793          	add	a5,a5,-80 # f250 <__clz_tab>
    b2a8:	00d787b3          	add	a5,a5,a3
    b2ac:	0007c483          	lbu	s1,0(a5)
    b2b0:	00000713          	li	a4,0
    b2b4:	02000793          	li	a5,32
    b2b8:	00e484b3          	add	s1,s1,a4
    b2bc:	40978733          	sub	a4,a5,s1
    b2c0:	f09780e3          	beq	a5,s1,b1c0 <__udivdi3+0x230>
    b2c4:	00e61ab3          	sll	s5,a2,a4
    b2c8:	01712623          	sw	s7,12(sp)
    b2cc:	010ad913          	srl	s2,s5,0x10
    b2d0:	0095dbb3          	srl	s7,a1,s1
    b2d4:	00e597b3          	sll	a5,a1,a4
    b2d8:	0099d4b3          	srl	s1,s3,s1
    b2dc:	00090593          	mv	a1,s2
    b2e0:	000b8513          	mv	a0,s7
    b2e4:	010a9a13          	sll	s4,s5,0x10
    b2e8:	00f4e4b3          	or	s1,s1,a5
    b2ec:	00e99433          	sll	s0,s3,a4
    b2f0:	010a5a13          	srl	s4,s4,0x10
    b2f4:	534030ef          	jal	e828 <__hidden___udivsi3>
    b2f8:	00050593          	mv	a1,a0
    b2fc:	00050b13          	mv	s6,a0
    b300:	000a0513          	mv	a0,s4
    b304:	460030ef          	jal	e764 <__mulsi3>
    b308:	00050993          	mv	s3,a0
    b30c:	00090593          	mv	a1,s2
    b310:	000b8513          	mv	a0,s7
    b314:	55c030ef          	jal	e870 <__umodsi3>
    b318:	01051513          	sll	a0,a0,0x10
    b31c:	0104d793          	srl	a5,s1,0x10
    b320:	00a7e7b3          	or	a5,a5,a0
    b324:	0137fe63          	bgeu	a5,s3,b340 <__udivdi3+0x3b0>
    b328:	00fa87b3          	add	a5,s5,a5
    b32c:	fffb0713          	add	a4,s6,-1
    b330:	2d57ec63          	bltu	a5,s5,b608 <__udivdi3+0x678>
    b334:	2d37fa63          	bgeu	a5,s3,b608 <__udivdi3+0x678>
    b338:	ffeb0b13          	add	s6,s6,-2
    b33c:	015787b3          	add	a5,a5,s5
    b340:	413789b3          	sub	s3,a5,s3
    b344:	00090593          	mv	a1,s2
    b348:	00098513          	mv	a0,s3
    b34c:	4dc030ef          	jal	e828 <__hidden___udivsi3>
    b350:	00050593          	mv	a1,a0
    b354:	00050b93          	mv	s7,a0
    b358:	000a0513          	mv	a0,s4
    b35c:	408030ef          	jal	e764 <__mulsi3>
    b360:	00050793          	mv	a5,a0
    b364:	00090593          	mv	a1,s2
    b368:	00098513          	mv	a0,s3
    b36c:	01049493          	sll	s1,s1,0x10
    b370:	00078993          	mv	s3,a5
    b374:	4fc030ef          	jal	e870 <__umodsi3>
    b378:	01051513          	sll	a0,a0,0x10
    b37c:	0104d493          	srl	s1,s1,0x10
    b380:	00a4e4b3          	or	s1,s1,a0
    b384:	0134fe63          	bgeu	s1,s3,b3a0 <__udivdi3+0x410>
    b388:	009a84b3          	add	s1,s5,s1
    b38c:	fffb8793          	add	a5,s7,-1
    b390:	2754e463          	bltu	s1,s5,b5f8 <__udivdi3+0x668>
    b394:	2734f263          	bgeu	s1,s3,b5f8 <__udivdi3+0x668>
    b398:	ffeb8b93          	add	s7,s7,-2
    b39c:	015484b3          	add	s1,s1,s5
    b3a0:	010b1b13          	sll	s6,s6,0x10
    b3a4:	017b6b33          	or	s6,s6,s7
    b3a8:	413484b3          	sub	s1,s1,s3
    b3ac:	00c12b83          	lw	s7,12(sp)
    b3b0:	e25ff06f          	j	b1d4 <__udivdi3+0x244>
    b3b4:	1006b793          	sltiu	a5,a3,256
    b3b8:	0017b793          	seqz	a5,a5
    b3bc:	00379793          	sll	a5,a5,0x3
    b3c0:	00f6d533          	srl	a0,a3,a5
    b3c4:	00004717          	auipc	a4,0x4
    b3c8:	e8c70713          	add	a4,a4,-372 # f250 <__clz_tab>
    b3cc:	00a70733          	add	a4,a4,a0
    b3d0:	00074703          	lbu	a4,0(a4)
    b3d4:	02000513          	li	a0,32
    b3d8:	00f70733          	add	a4,a4,a5
    b3dc:	40e50b33          	sub	s6,a0,a4
    b3e0:	d8e508e3          	beq	a0,a4,b170 <__udivdi3+0x1e0>
    b3e4:	016696b3          	sll	a3,a3,s6
    b3e8:	01912223          	sw	s9,4(sp)
    b3ec:	00e65cb3          	srl	s9,a2,a4
    b3f0:	00dcecb3          	or	s9,s9,a3
    b3f4:	01512a23          	sw	s5,20(sp)
    b3f8:	01712623          	sw	s7,12(sp)
    b3fc:	010cda93          	srl	s5,s9,0x10
    b400:	00e5dbb3          	srl	s7,a1,a4
    b404:	016597b3          	sll	a5,a1,s6
    b408:	00e9d733          	srl	a4,s3,a4
    b40c:	01812423          	sw	s8,8(sp)
    b410:	000a8593          	mv	a1,s5
    b414:	000b8513          	mv	a0,s7
    b418:	010c9c13          	sll	s8,s9,0x10
    b41c:	02812423          	sw	s0,40(sp)
    b420:	02912223          	sw	s1,36(sp)
    b424:	03212023          	sw	s2,32(sp)
    b428:	00f764b3          	or	s1,a4,a5
    b42c:	01661933          	sll	s2,a2,s6
    b430:	01412c23          	sw	s4,24(sp)
    b434:	010c5c13          	srl	s8,s8,0x10
    b438:	3f0030ef          	jal	e828 <__hidden___udivsi3>
    b43c:	00050593          	mv	a1,a0
    b440:	00050413          	mv	s0,a0
    b444:	000c0513          	mv	a0,s8
    b448:	31c030ef          	jal	e764 <__mulsi3>
    b44c:	00050a13          	mv	s4,a0
    b450:	000a8593          	mv	a1,s5
    b454:	000b8513          	mv	a0,s7
    b458:	418030ef          	jal	e870 <__umodsi3>
    b45c:	01051513          	sll	a0,a0,0x10
    b460:	0104d793          	srl	a5,s1,0x10
    b464:	00a7e7b3          	or	a5,a5,a0
    b468:	0147fe63          	bgeu	a5,s4,b484 <__udivdi3+0x4f4>
    b46c:	00fc87b3          	add	a5,s9,a5
    b470:	fff40713          	add	a4,s0,-1
    b474:	1997ee63          	bltu	a5,s9,b610 <__udivdi3+0x680>
    b478:	1947fc63          	bgeu	a5,s4,b610 <__udivdi3+0x680>
    b47c:	ffe40413          	add	s0,s0,-2
    b480:	019787b3          	add	a5,a5,s9
    b484:	41478a33          	sub	s4,a5,s4
    b488:	000a8593          	mv	a1,s5
    b48c:	000a0513          	mv	a0,s4
    b490:	398030ef          	jal	e828 <__hidden___udivsi3>
    b494:	00050593          	mv	a1,a0
    b498:	00050b93          	mv	s7,a0
    b49c:	000c0513          	mv	a0,s8
    b4a0:	2c4030ef          	jal	e764 <__mulsi3>
    b4a4:	00050793          	mv	a5,a0
    b4a8:	000a8593          	mv	a1,s5
    b4ac:	000a0513          	mv	a0,s4
    b4b0:	00078a13          	mv	s4,a5
    b4b4:	3bc030ef          	jal	e870 <__umodsi3>
    b4b8:	01049713          	sll	a4,s1,0x10
    b4bc:	01051513          	sll	a0,a0,0x10
    b4c0:	01075713          	srl	a4,a4,0x10
    b4c4:	00a76733          	or	a4,a4,a0
    b4c8:	01477e63          	bgeu	a4,s4,b4e4 <__udivdi3+0x554>
    b4cc:	00ec8733          	add	a4,s9,a4
    b4d0:	fffb8793          	add	a5,s7,-1
    b4d4:	13976663          	bltu	a4,s9,b600 <__udivdi3+0x670>
    b4d8:	13477463          	bgeu	a4,s4,b600 <__udivdi3+0x670>
    b4dc:	ffeb8b93          	add	s7,s7,-2
    b4e0:	01970733          	add	a4,a4,s9
    b4e4:	00010e37          	lui	t3,0x10
    b4e8:	01041413          	sll	s0,s0,0x10
    b4ec:	01746433          	or	s0,s0,s7
    b4f0:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    b4f4:	00f47833          	and	a6,s0,a5
    b4f8:	00f977b3          	and	a5,s2,a5
    b4fc:	41470733          	sub	a4,a4,s4
    b500:	01045e93          	srl	t4,s0,0x10
    b504:	01095913          	srl	s2,s2,0x10
    b508:	00080513          	mv	a0,a6
    b50c:	00078593          	mv	a1,a5
    b510:	254030ef          	jal	e764 <__mulsi3>
    b514:	00050313          	mv	t1,a0
    b518:	00090593          	mv	a1,s2
    b51c:	00080513          	mv	a0,a6
    b520:	244030ef          	jal	e764 <__mulsi3>
    b524:	00050813          	mv	a6,a0
    b528:	00078593          	mv	a1,a5
    b52c:	000e8513          	mv	a0,t4
    b530:	234030ef          	jal	e764 <__mulsi3>
    b534:	00050893          	mv	a7,a0
    b538:	00090593          	mv	a1,s2
    b53c:	000e8513          	mv	a0,t4
    b540:	224030ef          	jal	e764 <__mulsi3>
    b544:	01035793          	srl	a5,t1,0x10
    b548:	01180833          	add	a6,a6,a7
    b54c:	010787b3          	add	a5,a5,a6
    b550:	0117f463          	bgeu	a5,a7,b558 <__udivdi3+0x5c8>
    b554:	01c50533          	add	a0,a0,t3
    b558:	0107d693          	srl	a3,a5,0x10
    b55c:	00a686b3          	add	a3,a3,a0
    b560:	06d76863          	bltu	a4,a3,b5d0 <__udivdi3+0x640>
    b564:	04d70663          	beq	a4,a3,b5b0 <__udivdi3+0x620>
    b568:	00040513          	mv	a0,s0
    b56c:	02812403          	lw	s0,40(sp)
    b570:	02c12083          	lw	ra,44(sp)
    b574:	00000b13          	li	s6,0
    b578:	02412483          	lw	s1,36(sp)
    b57c:	02012903          	lw	s2,32(sp)
    b580:	01812a03          	lw	s4,24(sp)
    b584:	01412a83          	lw	s5,20(sp)
    b588:	00c12b83          	lw	s7,12(sp)
    b58c:	00812c03          	lw	s8,8(sp)
    b590:	00412c83          	lw	s9,4(sp)
    b594:	01c12983          	lw	s3,28(sp)
    b598:	000b0593          	mv	a1,s6
    b59c:	01012b03          	lw	s6,16(sp)
    b5a0:	03010113          	add	sp,sp,48
    b5a4:	00008067          	ret
    b5a8:	00078993          	mv	s3,a5
    b5ac:	b2dff06f          	j	b0d8 <__udivdi3+0x148>
    b5b0:	00010737          	lui	a4,0x10
    b5b4:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    b5b8:	00e7f7b3          	and	a5,a5,a4
    b5bc:	01079793          	sll	a5,a5,0x10
    b5c0:	00e37333          	and	t1,t1,a4
    b5c4:	01699533          	sll	a0,s3,s6
    b5c8:	006787b3          	add	a5,a5,t1
    b5cc:	f8f57ee3          	bgeu	a0,a5,b568 <__udivdi3+0x5d8>
    b5d0:	fff40513          	add	a0,s0,-1
    b5d4:	f99ff06f          	j	b56c <__udivdi3+0x5dc>
    b5d8:	010007b7          	lui	a5,0x1000
    b5dc:	04f67a63          	bgeu	a2,a5,b630 <__udivdi3+0x6a0>
    b5e0:	01065693          	srl	a3,a2,0x10
    b5e4:	01000713          	li	a4,16
    b5e8:	bb9ff06f          	j	b1a0 <__udivdi3+0x210>
    b5ec:	00000b13          	li	s6,0
    b5f0:	00100513          	li	a0,1
    b5f4:	b29ff06f          	j	b11c <__udivdi3+0x18c>
    b5f8:	00078b93          	mv	s7,a5
    b5fc:	da5ff06f          	j	b3a0 <__udivdi3+0x410>
    b600:	00078b93          	mv	s7,a5
    b604:	ee1ff06f          	j	b4e4 <__udivdi3+0x554>
    b608:	00070b13          	mv	s6,a4
    b60c:	d35ff06f          	j	b340 <__udivdi3+0x3b0>
    b610:	00070413          	mv	s0,a4
    b614:	e71ff06f          	j	b484 <__udivdi3+0x4f4>
    b618:	ffe98993          	add	s3,s3,-2
    b61c:	015787b3          	add	a5,a5,s5
    b620:	c05ff06f          	j	b224 <__udivdi3+0x294>
    b624:	ffe90913          	add	s2,s2,-2
    b628:	015787b3          	add	a5,a5,s5
    b62c:	a51ff06f          	j	b07c <__udivdi3+0xec>
    b630:	01865693          	srl	a3,a2,0x18
    b634:	01800713          	li	a4,24
    b638:	b69ff06f          	j	b1a0 <__udivdi3+0x210>

0000b63c <__umoddi3>:
    b63c:	fd010113          	add	sp,sp,-48
    b640:	02112623          	sw	ra,44(sp)
    b644:	00050793          	mv	a5,a0
    b648:	14069663          	bnez	a3,b794 <__umoddi3+0x158>
    b64c:	03212023          	sw	s2,32(sp)
    b650:	01412c23          	sw	s4,24(sp)
    b654:	02812423          	sw	s0,40(sp)
    b658:	02912223          	sw	s1,36(sp)
    b65c:	01312e23          	sw	s3,28(sp)
    b660:	01512a23          	sw	s5,20(sp)
    b664:	00060a13          	mv	s4,a2
    b668:	00050913          	mv	s2,a0
    b66c:	1ac5f663          	bgeu	a1,a2,b818 <__umoddi3+0x1dc>
    b670:	01612823          	sw	s6,16(sp)
    b674:	00010737          	lui	a4,0x10
    b678:	00058993          	mv	s3,a1
    b67c:	28e66063          	bltu	a2,a4,b8fc <__umoddi3+0x2c0>
    b680:	01000737          	lui	a4,0x1000
    b684:	01800693          	li	a3,24
    b688:	00e67463          	bgeu	a2,a4,b690 <__umoddi3+0x54>
    b68c:	01000693          	li	a3,16
    b690:	00d65533          	srl	a0,a2,a3
    b694:	00004717          	auipc	a4,0x4
    b698:	bbc70713          	add	a4,a4,-1092 # f250 <__clz_tab>
    b69c:	00a70733          	add	a4,a4,a0
    b6a0:	00074703          	lbu	a4,0(a4)
    b6a4:	02000513          	li	a0,32
    b6a8:	00d70733          	add	a4,a4,a3
    b6ac:	40e504b3          	sub	s1,a0,a4
    b6b0:	00e50c63          	beq	a0,a4,b6c8 <__umoddi3+0x8c>
    b6b4:	009599b3          	sll	s3,a1,s1
    b6b8:	00e7d733          	srl	a4,a5,a4
    b6bc:	00961a33          	sll	s4,a2,s1
    b6c0:	013769b3          	or	s3,a4,s3
    b6c4:	00979933          	sll	s2,a5,s1
    b6c8:	010a5a93          	srl	s5,s4,0x10
    b6cc:	000a8593          	mv	a1,s5
    b6d0:	00098513          	mv	a0,s3
    b6d4:	010a1b13          	sll	s6,s4,0x10
    b6d8:	150030ef          	jal	e828 <__hidden___udivsi3>
    b6dc:	010b5b13          	srl	s6,s6,0x10
    b6e0:	000b0593          	mv	a1,s6
    b6e4:	080030ef          	jal	e764 <__mulsi3>
    b6e8:	00050413          	mv	s0,a0
    b6ec:	000a8593          	mv	a1,s5
    b6f0:	00098513          	mv	a0,s3
    b6f4:	17c030ef          	jal	e870 <__umodsi3>
    b6f8:	01051513          	sll	a0,a0,0x10
    b6fc:	01095793          	srl	a5,s2,0x10
    b700:	00a7e7b3          	or	a5,a5,a0
    b704:	0087f863          	bgeu	a5,s0,b714 <__umoddi3+0xd8>
    b708:	00fa07b3          	add	a5,s4,a5
    b70c:	0147e463          	bltu	a5,s4,b714 <__umoddi3+0xd8>
    b710:	5687e863          	bltu	a5,s0,bc80 <__umoddi3+0x644>
    b714:	40878433          	sub	s0,a5,s0
    b718:	000a8593          	mv	a1,s5
    b71c:	00040513          	mv	a0,s0
    b720:	108030ef          	jal	e828 <__hidden___udivsi3>
    b724:	000b0593          	mv	a1,s6
    b728:	03c030ef          	jal	e764 <__mulsi3>
    b72c:	00050793          	mv	a5,a0
    b730:	000a8593          	mv	a1,s5
    b734:	00040513          	mv	a0,s0
    b738:	00078413          	mv	s0,a5
    b73c:	134030ef          	jal	e870 <__umodsi3>
    b740:	01091793          	sll	a5,s2,0x10
    b744:	01051513          	sll	a0,a0,0x10
    b748:	0107d793          	srl	a5,a5,0x10
    b74c:	00a7e7b3          	or	a5,a5,a0
    b750:	0087f863          	bgeu	a5,s0,b760 <__umoddi3+0x124>
    b754:	00fa07b3          	add	a5,s4,a5
    b758:	0147e463          	bltu	a5,s4,b760 <__umoddi3+0x124>
    b75c:	5087ea63          	bltu	a5,s0,bc70 <__umoddi3+0x634>
    b760:	01012b03          	lw	s6,16(sp)
    b764:	408787b3          	sub	a5,a5,s0
    b768:	0097d533          	srl	a0,a5,s1
    b76c:	02812403          	lw	s0,40(sp)
    b770:	02412483          	lw	s1,36(sp)
    b774:	02012903          	lw	s2,32(sp)
    b778:	01c12983          	lw	s3,28(sp)
    b77c:	01812a03          	lw	s4,24(sp)
    b780:	01412a83          	lw	s5,20(sp)
    b784:	00000593          	li	a1,0
    b788:	02c12083          	lw	ra,44(sp)
    b78c:	03010113          	add	sp,sp,48
    b790:	00008067          	ret
    b794:	00050893          	mv	a7,a0
    b798:	fed5e8e3          	bltu	a1,a3,b788 <__umoddi3+0x14c>
    b79c:	03212023          	sw	s2,32(sp)
    b7a0:	01312e23          	sw	s3,28(sp)
    b7a4:	00010737          	lui	a4,0x10
    b7a8:	00058813          	mv	a6,a1
    b7ac:	24e6ec63          	bltu	a3,a4,ba04 <__umoddi3+0x3c8>
    b7b0:	01000737          	lui	a4,0x1000
    b7b4:	01800513          	li	a0,24
    b7b8:	00e6f463          	bgeu	a3,a4,b7c0 <__umoddi3+0x184>
    b7bc:	01000513          	li	a0,16
    b7c0:	00a6d333          	srl	t1,a3,a0
    b7c4:	00004717          	auipc	a4,0x4
    b7c8:	a8c70713          	add	a4,a4,-1396 # f250 <__clz_tab>
    b7cc:	00670733          	add	a4,a4,t1
    b7d0:	00074703          	lbu	a4,0(a4)
    b7d4:	02000313          	li	t1,32
    b7d8:	00a709b3          	add	s3,a4,a0
    b7dc:	41330933          	sub	s2,t1,s3
    b7e0:	25331a63          	bne	t1,s3,ba34 <__umoddi3+0x3f8>
    b7e4:	00b6e463          	bltu	a3,a1,b7ec <__umoddi3+0x1b0>
    b7e8:	00c7ea63          	bltu	a5,a2,b7fc <__umoddi3+0x1c0>
    b7ec:	40c788b3          	sub	a7,a5,a2
    b7f0:	40d586b3          	sub	a3,a1,a3
    b7f4:	0117b833          	sltu	a6,a5,a7
    b7f8:	41068833          	sub	a6,a3,a6
    b7fc:	02c12083          	lw	ra,44(sp)
    b800:	02012903          	lw	s2,32(sp)
    b804:	01c12983          	lw	s3,28(sp)
    b808:	00088513          	mv	a0,a7
    b80c:	00080593          	mv	a1,a6
    b810:	03010113          	add	sp,sp,48
    b814:	00008067          	ret
    b818:	0e060a63          	beqz	a2,b90c <__umoddi3+0x2d0>
    b81c:	00010737          	lui	a4,0x10
    b820:	42e67663          	bgeu	a2,a4,bc4c <__umoddi3+0x610>
    b824:	10063693          	sltiu	a3,a2,256
    b828:	0016b693          	seqz	a3,a3
    b82c:	00369693          	sll	a3,a3,0x3
    b830:	00d65533          	srl	a0,a2,a3
    b834:	00004717          	auipc	a4,0x4
    b838:	a1c70713          	add	a4,a4,-1508 # f250 <__clz_tab>
    b83c:	00a70733          	add	a4,a4,a0
    b840:	00074983          	lbu	s3,0(a4)
    b844:	02000713          	li	a4,32
    b848:	00d989b3          	add	s3,s3,a3
    b84c:	413704b3          	sub	s1,a4,s3
    b850:	0f371263          	bne	a4,s3,b934 <__umoddi3+0x2f8>
    b854:	01061413          	sll	s0,a2,0x10
    b858:	40c589b3          	sub	s3,a1,a2
    b85c:	01065a93          	srl	s5,a2,0x10
    b860:	01045413          	srl	s0,s0,0x10
    b864:	000a8593          	mv	a1,s5
    b868:	00098513          	mv	a0,s3
    b86c:	7bd020ef          	jal	e828 <__hidden___udivsi3>
    b870:	00040593          	mv	a1,s0
    b874:	6f1020ef          	jal	e764 <__mulsi3>
    b878:	00050793          	mv	a5,a0
    b87c:	000a8593          	mv	a1,s5
    b880:	00098513          	mv	a0,s3
    b884:	00078993          	mv	s3,a5
    b888:	7e9020ef          	jal	e870 <__umodsi3>
    b88c:	01051513          	sll	a0,a0,0x10
    b890:	01095793          	srl	a5,s2,0x10
    b894:	00a7e7b3          	or	a5,a5,a0
    b898:	0137f863          	bgeu	a5,s3,b8a8 <__umoddi3+0x26c>
    b89c:	00fa07b3          	add	a5,s4,a5
    b8a0:	0147e463          	bltu	a5,s4,b8a8 <__umoddi3+0x26c>
    b8a4:	3d37ea63          	bltu	a5,s3,bc78 <__umoddi3+0x63c>
    b8a8:	413789b3          	sub	s3,a5,s3
    b8ac:	000a8593          	mv	a1,s5
    b8b0:	00098513          	mv	a0,s3
    b8b4:	775020ef          	jal	e828 <__hidden___udivsi3>
    b8b8:	00040593          	mv	a1,s0
    b8bc:	6a9020ef          	jal	e764 <__mulsi3>
    b8c0:	00050413          	mv	s0,a0
    b8c4:	000a8593          	mv	a1,s5
    b8c8:	00098513          	mv	a0,s3
    b8cc:	7a5020ef          	jal	e870 <__umodsi3>
    b8d0:	01091913          	sll	s2,s2,0x10
    b8d4:	01051793          	sll	a5,a0,0x10
    b8d8:	01095913          	srl	s2,s2,0x10
    b8dc:	00f967b3          	or	a5,s2,a5
    b8e0:	0087fa63          	bgeu	a5,s0,b8f4 <__umoddi3+0x2b8>
    b8e4:	00fa07b3          	add	a5,s4,a5
    b8e8:	0147e663          	bltu	a5,s4,b8f4 <__umoddi3+0x2b8>
    b8ec:	0087f463          	bgeu	a5,s0,b8f4 <__umoddi3+0x2b8>
    b8f0:	014787b3          	add	a5,a5,s4
    b8f4:	408787b3          	sub	a5,a5,s0
    b8f8:	e71ff06f          	j	b768 <__umoddi3+0x12c>
    b8fc:	10063693          	sltiu	a3,a2,256
    b900:	0016b693          	seqz	a3,a3
    b904:	00369693          	sll	a3,a3,0x3
    b908:	d89ff06f          	j	b690 <__umoddi3+0x54>
    b90c:	00000513          	li	a0,0
    b910:	00004717          	auipc	a4,0x4
    b914:	94070713          	add	a4,a4,-1728 # f250 <__clz_tab>
    b918:	00a70733          	add	a4,a4,a0
    b91c:	00074983          	lbu	s3,0(a4)
    b920:	00000693          	li	a3,0
    b924:	02000713          	li	a4,32
    b928:	00d989b3          	add	s3,s3,a3
    b92c:	413704b3          	sub	s1,a4,s3
    b930:	f33702e3          	beq	a4,s3,b854 <__umoddi3+0x218>
    b934:	00961a33          	sll	s4,a2,s1
    b938:	01712623          	sw	s7,12(sp)
    b93c:	010a5a93          	srl	s5,s4,0x10
    b940:	0135dbb3          	srl	s7,a1,s3
    b944:	00959733          	sll	a4,a1,s1
    b948:	0137d9b3          	srl	s3,a5,s3
    b94c:	000a8593          	mv	a1,s5
    b950:	000b8513          	mv	a0,s7
    b954:	010a1413          	sll	s0,s4,0x10
    b958:	00e9e9b3          	or	s3,s3,a4
    b95c:	00979933          	sll	s2,a5,s1
    b960:	01612823          	sw	s6,16(sp)
    b964:	01045413          	srl	s0,s0,0x10
    b968:	6c1020ef          	jal	e828 <__hidden___udivsi3>
    b96c:	00040593          	mv	a1,s0
    b970:	5f5020ef          	jal	e764 <__mulsi3>
    b974:	00050b13          	mv	s6,a0
    b978:	000a8593          	mv	a1,s5
    b97c:	000b8513          	mv	a0,s7
    b980:	6f1020ef          	jal	e870 <__umodsi3>
    b984:	01051513          	sll	a0,a0,0x10
    b988:	0109d793          	srl	a5,s3,0x10
    b98c:	00a7e7b3          	or	a5,a5,a0
    b990:	0167fa63          	bgeu	a5,s6,b9a4 <__umoddi3+0x368>
    b994:	00fa07b3          	add	a5,s4,a5
    b998:	0147e663          	bltu	a5,s4,b9a4 <__umoddi3+0x368>
    b99c:	0167f463          	bgeu	a5,s6,b9a4 <__umoddi3+0x368>
    b9a0:	014787b3          	add	a5,a5,s4
    b9a4:	41678b33          	sub	s6,a5,s6
    b9a8:	000a8593          	mv	a1,s5
    b9ac:	000b0513          	mv	a0,s6
    b9b0:	679020ef          	jal	e828 <__hidden___udivsi3>
    b9b4:	00040593          	mv	a1,s0
    b9b8:	5ad020ef          	jal	e764 <__mulsi3>
    b9bc:	00050793          	mv	a5,a0
    b9c0:	000a8593          	mv	a1,s5
    b9c4:	000b0513          	mv	a0,s6
    b9c8:	01099993          	sll	s3,s3,0x10
    b9cc:	00078b13          	mv	s6,a5
    b9d0:	6a1020ef          	jal	e870 <__umodsi3>
    b9d4:	01051513          	sll	a0,a0,0x10
    b9d8:	0109d993          	srl	s3,s3,0x10
    b9dc:	00a9e9b3          	or	s3,s3,a0
    b9e0:	0169fa63          	bgeu	s3,s6,b9f4 <__umoddi3+0x3b8>
    b9e4:	013a09b3          	add	s3,s4,s3
    b9e8:	0149e663          	bltu	s3,s4,b9f4 <__umoddi3+0x3b8>
    b9ec:	0169f463          	bgeu	s3,s6,b9f4 <__umoddi3+0x3b8>
    b9f0:	014989b3          	add	s3,s3,s4
    b9f4:	416989b3          	sub	s3,s3,s6
    b9f8:	00c12b83          	lw	s7,12(sp)
    b9fc:	01012b03          	lw	s6,16(sp)
    ba00:	e65ff06f          	j	b864 <__umoddi3+0x228>
    ba04:	1006b513          	sltiu	a0,a3,256
    ba08:	00153513          	seqz	a0,a0
    ba0c:	00351513          	sll	a0,a0,0x3
    ba10:	00a6d333          	srl	t1,a3,a0
    ba14:	00004717          	auipc	a4,0x4
    ba18:	83c70713          	add	a4,a4,-1988 # f250 <__clz_tab>
    ba1c:	00670733          	add	a4,a4,t1
    ba20:	00074703          	lbu	a4,0(a4)
    ba24:	02000313          	li	t1,32
    ba28:	00a709b3          	add	s3,a4,a0
    ba2c:	41330933          	sub	s2,t1,s3
    ba30:	db330ae3          	beq	t1,s3,b7e4 <__umoddi3+0x1a8>
    ba34:	01512a23          	sw	s5,20(sp)
    ba38:	012696b3          	sll	a3,a3,s2
    ba3c:	01365ab3          	srl	s5,a2,s3
    ba40:	00daeab3          	or	s5,s5,a3
    ba44:	01712623          	sw	s7,12(sp)
    ba48:	01a12023          	sw	s10,0(sp)
    ba4c:	010adb93          	srl	s7,s5,0x10
    ba50:	0135dd33          	srl	s10,a1,s3
    ba54:	01259733          	sll	a4,a1,s2
    ba58:	0137d6b3          	srl	a3,a5,s3
    ba5c:	01912223          	sw	s9,4(sp)
    ba60:	000b8593          	mv	a1,s7
    ba64:	000d0513          	mv	a0,s10
    ba68:	010a9c93          	sll	s9,s5,0x10
    ba6c:	02812423          	sw	s0,40(sp)
    ba70:	02912223          	sw	s1,36(sp)
    ba74:	01261433          	sll	s0,a2,s2
    ba78:	012794b3          	sll	s1,a5,s2
    ba7c:	01412c23          	sw	s4,24(sp)
    ba80:	01612823          	sw	s6,16(sp)
    ba84:	00e6ea33          	or	s4,a3,a4
    ba88:	01812423          	sw	s8,8(sp)
    ba8c:	010cdc93          	srl	s9,s9,0x10
    ba90:	599020ef          	jal	e828 <__hidden___udivsi3>
    ba94:	00050593          	mv	a1,a0
    ba98:	00050b13          	mv	s6,a0
    ba9c:	000c8513          	mv	a0,s9
    baa0:	4c5020ef          	jal	e764 <__mulsi3>
    baa4:	00050c13          	mv	s8,a0
    baa8:	000b8593          	mv	a1,s7
    baac:	000d0513          	mv	a0,s10
    bab0:	5c1020ef          	jal	e870 <__umodsi3>
    bab4:	01051513          	sll	a0,a0,0x10
    bab8:	010a5793          	srl	a5,s4,0x10
    babc:	00a7e7b3          	or	a5,a5,a0
    bac0:	0187fe63          	bgeu	a5,s8,badc <__umoddi3+0x4a0>
    bac4:	00fa87b3          	add	a5,s5,a5
    bac8:	fffb0713          	add	a4,s6,-1
    bacc:	1957ee63          	bltu	a5,s5,bc68 <__umoddi3+0x62c>
    bad0:	1987fc63          	bgeu	a5,s8,bc68 <__umoddi3+0x62c>
    bad4:	ffeb0b13          	add	s6,s6,-2
    bad8:	015787b3          	add	a5,a5,s5
    badc:	41878c33          	sub	s8,a5,s8
    bae0:	000b8593          	mv	a1,s7
    bae4:	000c0513          	mv	a0,s8
    bae8:	541020ef          	jal	e828 <__hidden___udivsi3>
    baec:	00050593          	mv	a1,a0
    baf0:	00050d13          	mv	s10,a0
    baf4:	000c8513          	mv	a0,s9
    baf8:	46d020ef          	jal	e764 <__mulsi3>
    bafc:	00050793          	mv	a5,a0
    bb00:	000b8593          	mv	a1,s7
    bb04:	000c0513          	mv	a0,s8
    bb08:	00078b93          	mv	s7,a5
    bb0c:	565020ef          	jal	e870 <__umodsi3>
    bb10:	010a1593          	sll	a1,s4,0x10
    bb14:	01051513          	sll	a0,a0,0x10
    bb18:	0105d593          	srl	a1,a1,0x10
    bb1c:	00a5e5b3          	or	a1,a1,a0
    bb20:	0175fe63          	bgeu	a1,s7,bb3c <__umoddi3+0x500>
    bb24:	00ba85b3          	add	a1,s5,a1
    bb28:	fffd0793          	add	a5,s10,-1
    bb2c:	1355ea63          	bltu	a1,s5,bc60 <__umoddi3+0x624>
    bb30:	1375f863          	bgeu	a1,s7,bc60 <__umoddi3+0x624>
    bb34:	ffed0d13          	add	s10,s10,-2
    bb38:	015585b3          	add	a1,a1,s5
    bb3c:	010b1793          	sll	a5,s6,0x10
    bb40:	00010e37          	lui	t3,0x10
    bb44:	01a7e7b3          	or	a5,a5,s10
    bb48:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    bb4c:	0067f8b3          	and	a7,a5,t1
    bb50:	00647333          	and	t1,s0,t1
    bb54:	41758733          	sub	a4,a1,s7
    bb58:	0107d793          	srl	a5,a5,0x10
    bb5c:	01045e93          	srl	t4,s0,0x10
    bb60:	00088513          	mv	a0,a7
    bb64:	00030593          	mv	a1,t1
    bb68:	3fd020ef          	jal	e764 <__mulsi3>
    bb6c:	00050813          	mv	a6,a0
    bb70:	000e8593          	mv	a1,t4
    bb74:	00088513          	mv	a0,a7
    bb78:	3ed020ef          	jal	e764 <__mulsi3>
    bb7c:	00050893          	mv	a7,a0
    bb80:	00030593          	mv	a1,t1
    bb84:	00078513          	mv	a0,a5
    bb88:	3dd020ef          	jal	e764 <__mulsi3>
    bb8c:	00050313          	mv	t1,a0
    bb90:	000e8593          	mv	a1,t4
    bb94:	00078513          	mv	a0,a5
    bb98:	3cd020ef          	jal	e764 <__mulsi3>
    bb9c:	01085793          	srl	a5,a6,0x10
    bba0:	006888b3          	add	a7,a7,t1
    bba4:	011787b3          	add	a5,a5,a7
    bba8:	0067f463          	bgeu	a5,t1,bbb0 <__umoddi3+0x574>
    bbac:	01c50533          	add	a0,a0,t3
    bbb0:	00010637          	lui	a2,0x10
    bbb4:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    bbb8:	0107d693          	srl	a3,a5,0x10
    bbbc:	00c7f7b3          	and	a5,a5,a2
    bbc0:	01079793          	sll	a5,a5,0x10
    bbc4:	00c87833          	and	a6,a6,a2
    bbc8:	00a686b3          	add	a3,a3,a0
    bbcc:	010787b3          	add	a5,a5,a6
    bbd0:	06d76263          	bltu	a4,a3,bc34 <__umoddi3+0x5f8>
    bbd4:	04d70e63          	beq	a4,a3,bc30 <__umoddi3+0x5f4>
    bbd8:	40f487b3          	sub	a5,s1,a5
    bbdc:	00f4b4b3          	sltu	s1,s1,a5
    bbe0:	02812403          	lw	s0,40(sp)
    bbe4:	02c12083          	lw	ra,44(sp)
    bbe8:	40d705b3          	sub	a1,a4,a3
    bbec:	409585b3          	sub	a1,a1,s1
    bbf0:	01359733          	sll	a4,a1,s3
    bbf4:	0127d7b3          	srl	a5,a5,s2
    bbf8:	02412483          	lw	s1,36(sp)
    bbfc:	01c12983          	lw	s3,28(sp)
    bc00:	01812a03          	lw	s4,24(sp)
    bc04:	01412a83          	lw	s5,20(sp)
    bc08:	01012b03          	lw	s6,16(sp)
    bc0c:	00c12b83          	lw	s7,12(sp)
    bc10:	00812c03          	lw	s8,8(sp)
    bc14:	00412c83          	lw	s9,4(sp)
    bc18:	00012d03          	lw	s10,0(sp)
    bc1c:	0125d5b3          	srl	a1,a1,s2
    bc20:	00f76533          	or	a0,a4,a5
    bc24:	02012903          	lw	s2,32(sp)
    bc28:	03010113          	add	sp,sp,48
    bc2c:	00008067          	ret
    bc30:	faf4f4e3          	bgeu	s1,a5,bbd8 <__umoddi3+0x59c>
    bc34:	40878433          	sub	s0,a5,s0
    bc38:	0087b7b3          	sltu	a5,a5,s0
    bc3c:	01578ab3          	add	s5,a5,s5
    bc40:	415686b3          	sub	a3,a3,s5
    bc44:	00040793          	mv	a5,s0
    bc48:	f91ff06f          	j	bbd8 <__umoddi3+0x59c>
    bc4c:	01000737          	lui	a4,0x1000
    bc50:	02e67c63          	bgeu	a2,a4,bc88 <__umoddi3+0x64c>
    bc54:	01065513          	srl	a0,a2,0x10
    bc58:	01000693          	li	a3,16
    bc5c:	bd9ff06f          	j	b834 <__umoddi3+0x1f8>
    bc60:	00078d13          	mv	s10,a5
    bc64:	ed9ff06f          	j	bb3c <__umoddi3+0x500>
    bc68:	00070b13          	mv	s6,a4
    bc6c:	e71ff06f          	j	badc <__umoddi3+0x4a0>
    bc70:	014787b3          	add	a5,a5,s4
    bc74:	aedff06f          	j	b760 <__umoddi3+0x124>
    bc78:	014787b3          	add	a5,a5,s4
    bc7c:	c2dff06f          	j	b8a8 <__umoddi3+0x26c>
    bc80:	014787b3          	add	a5,a5,s4
    bc84:	a91ff06f          	j	b714 <__umoddi3+0xd8>
    bc88:	01865513          	srl	a0,a2,0x18
    bc8c:	01800693          	li	a3,24
    bc90:	ba5ff06f          	j	b834 <__umoddi3+0x1f8>

0000bc94 <__adddf3>:
    bc94:	001007b7          	lui	a5,0x100
    bc98:	fe010113          	add	sp,sp,-32
    bc9c:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    bca0:	00bef833          	and	a6,t4,a1
    bca4:	00def7b3          	and	a5,t4,a3
    bca8:	0146d313          	srl	t1,a3,0x14
    bcac:	01212823          	sw	s2,16(sp)
    bcb0:	0145d913          	srl	s2,a1,0x14
    bcb4:	00379793          	sll	a5,a5,0x3
    bcb8:	00812c23          	sw	s0,24(sp)
    bcbc:	00381813          	sll	a6,a6,0x3
    bcc0:	01f5d413          	srl	s0,a1,0x1f
    bcc4:	01d55713          	srl	a4,a0,0x1d
    bcc8:	01d65893          	srl	a7,a2,0x1d
    bccc:	7ff97913          	and	s2,s2,2047
    bcd0:	7ff37313          	and	t1,t1,2047
    bcd4:	00112e23          	sw	ra,28(sp)
    bcd8:	00912a23          	sw	s1,20(sp)
    bcdc:	01312623          	sw	s3,12(sp)
    bce0:	01f6d693          	srl	a3,a3,0x1f
    bce4:	00f8e8b3          	or	a7,a7,a5
    bce8:	01076733          	or	a4,a4,a6
    bcec:	00351593          	sll	a1,a0,0x3
    bcf0:	00361f13          	sll	t5,a2,0x3
    bcf4:	406907b3          	sub	a5,s2,t1
    bcf8:	1ed40463          	beq	s0,a3,bee0 <__adddf3+0x24c>
    bcfc:	16f05263          	blez	a5,be60 <__adddf3+0x1cc>
    bd00:	28030663          	beqz	t1,bf8c <__adddf3+0x2f8>
    bd04:	7ff00693          	li	a3,2047
    bd08:	42d90663          	beq	s2,a3,c134 <__adddf3+0x4a0>
    bd0c:	03800693          	li	a3,56
    bd10:	00100613          	li	a2,1
    bd14:	02f6ce63          	blt	a3,a5,bd50 <__adddf3+0xbc>
    bd18:	008006b7          	lui	a3,0x800
    bd1c:	00d8e8b3          	or	a7,a7,a3
    bd20:	01f00693          	li	a3,31
    bd24:	52f6ce63          	blt	a3,a5,c260 <__adddf3+0x5cc>
    bd28:	02000693          	li	a3,32
    bd2c:	40f686b3          	sub	a3,a3,a5
    bd30:	00d89633          	sll	a2,a7,a3
    bd34:	00ff5533          	srl	a0,t5,a5
    bd38:	00df16b3          	sll	a3,t5,a3
    bd3c:	00a66633          	or	a2,a2,a0
    bd40:	00d036b3          	snez	a3,a3
    bd44:	00f8d8b3          	srl	a7,a7,a5
    bd48:	00d66633          	or	a2,a2,a3
    bd4c:	41170733          	sub	a4,a4,a7
    bd50:	40c58633          	sub	a2,a1,a2
    bd54:	00c5b5b3          	sltu	a1,a1,a2
    bd58:	00060493          	mv	s1,a2
    bd5c:	40b709b3          	sub	s3,a4,a1
    bd60:	00899793          	sll	a5,s3,0x8
    bd64:	3207da63          	bgez	a5,c098 <__adddf3+0x404>
    bd68:	008007b7          	lui	a5,0x800
    bd6c:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    bd70:	00f9f9b3          	and	s3,s3,a5
    bd74:	2c098863          	beqz	s3,c044 <__adddf3+0x3b0>
    bd78:	00098513          	mv	a0,s3
    bd7c:	359020ef          	jal	e8d4 <__clzsi2>
    bd80:	ff850793          	add	a5,a0,-8
    bd84:	02000693          	li	a3,32
    bd88:	40f68733          	sub	a4,a3,a5
    bd8c:	00e4d733          	srl	a4,s1,a4
    bd90:	00f999b3          	sll	s3,s3,a5
    bd94:	01376733          	or	a4,a4,s3
    bd98:	00f494b3          	sll	s1,s1,a5
    bd9c:	4b27c863          	blt	a5,s2,c24c <__adddf3+0x5b8>
    bda0:	412787b3          	sub	a5,a5,s2
    bda4:	00178793          	add	a5,a5,1
    bda8:	40f686b3          	sub	a3,a3,a5
    bdac:	00d49633          	sll	a2,s1,a3
    bdb0:	00f4d9b3          	srl	s3,s1,a5
    bdb4:	00c03633          	snez	a2,a2
    bdb8:	01366633          	or	a2,a2,s3
    bdbc:	00d716b3          	sll	a3,a4,a3
    bdc0:	00c6e4b3          	or	s1,a3,a2
    bdc4:	00f759b3          	srl	s3,a4,a5
    bdc8:	00000913          	li	s2,0
    bdcc:	0074f793          	and	a5,s1,7
    bdd0:	02078063          	beqz	a5,bdf0 <__adddf3+0x15c>
    bdd4:	00f4f793          	and	a5,s1,15
    bdd8:	00400713          	li	a4,4
    bddc:	00e78a63          	beq	a5,a4,bdf0 <__adddf3+0x15c>
    bde0:	00448793          	add	a5,s1,4
    bde4:	0097b633          	sltu	a2,a5,s1
    bde8:	00c989b3          	add	s3,s3,a2
    bdec:	00078493          	mv	s1,a5
    bdf0:	00899793          	sll	a5,s3,0x8
    bdf4:	6e07da63          	bgez	a5,c4e8 <__adddf3+0x854>
    bdf8:	00190793          	add	a5,s2,1
    bdfc:	7ff00713          	li	a4,2047
    be00:	00040e13          	mv	t3,s0
    be04:	2ae78663          	beq	a5,a4,c0b0 <__adddf3+0x41c>
    be08:	ff800737          	lui	a4,0xff800
    be0c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    be10:	00e9f733          	and	a4,s3,a4
    be14:	7ff7f793          	and	a5,a5,2047
    be18:	01d71813          	sll	a6,a4,0x1d
    be1c:	0034d613          	srl	a2,s1,0x3
    be20:	00971713          	sll	a4,a4,0x9
    be24:	00c86833          	or	a6,a6,a2
    be28:	00c75713          	srl	a4,a4,0xc
    be2c:	01c12083          	lw	ra,28(sp)
    be30:	01812403          	lw	s0,24(sp)
    be34:	01479793          	sll	a5,a5,0x14
    be38:	00e7e7b3          	or	a5,a5,a4
    be3c:	01fe1713          	sll	a4,t3,0x1f
    be40:	00e7e7b3          	or	a5,a5,a4
    be44:	01412483          	lw	s1,20(sp)
    be48:	01012903          	lw	s2,16(sp)
    be4c:	00c12983          	lw	s3,12(sp)
    be50:	00080513          	mv	a0,a6
    be54:	00078593          	mv	a1,a5
    be58:	02010113          	add	sp,sp,32
    be5c:	00008067          	ret
    be60:	14078c63          	beqz	a5,bfb8 <__adddf3+0x324>
    be64:	412307b3          	sub	a5,t1,s2
    be68:	3c091263          	bnez	s2,c22c <__adddf3+0x598>
    be6c:	00b76533          	or	a0,a4,a1
    be70:	4c050463          	beqz	a0,c338 <__adddf3+0x6a4>
    be74:	fff78513          	add	a0,a5,-1
    be78:	60050263          	beqz	a0,c47c <__adddf3+0x7e8>
    be7c:	7ff00813          	li	a6,2047
    be80:	57078663          	beq	a5,a6,c3ec <__adddf3+0x758>
    be84:	03800793          	li	a5,56
    be88:	00100613          	li	a2,1
    be8c:	02a7cc63          	blt	a5,a0,bec4 <__adddf3+0x230>
    be90:	00050793          	mv	a5,a0
    be94:	01f00613          	li	a2,31
    be98:	56f64c63          	blt	a2,a5,c410 <__adddf3+0x77c>
    be9c:	02000513          	li	a0,32
    bea0:	40f50533          	sub	a0,a0,a5
    bea4:	00a71633          	sll	a2,a4,a0
    bea8:	00f5d833          	srl	a6,a1,a5
    beac:	00a59533          	sll	a0,a1,a0
    beb0:	01066633          	or	a2,a2,a6
    beb4:	00a03533          	snez	a0,a0
    beb8:	00f75733          	srl	a4,a4,a5
    bebc:	00a66633          	or	a2,a2,a0
    bec0:	40e888b3          	sub	a7,a7,a4
    bec4:	40cf0633          	sub	a2,t5,a2
    bec8:	00cf3733          	sltu	a4,t5,a2
    becc:	00060493          	mv	s1,a2
    bed0:	40e889b3          	sub	s3,a7,a4
    bed4:	00030913          	mv	s2,t1
    bed8:	00068413          	mv	s0,a3
    bedc:	e85ff06f          	j	bd60 <__adddf3+0xcc>
    bee0:	1ef05063          	blez	a5,c0c0 <__adddf3+0x42c>
    bee4:	14031063          	bnez	t1,c024 <__adddf3+0x390>
    bee8:	01e8e6b3          	or	a3,a7,t5
    beec:	26068c63          	beqz	a3,c164 <__adddf3+0x4d0>
    bef0:	fff78693          	add	a3,a5,-1
    bef4:	48068063          	beqz	a3,c374 <__adddf3+0x6e0>
    bef8:	7ff00613          	li	a2,2047
    befc:	22c78c63          	beq	a5,a2,c134 <__adddf3+0x4a0>
    bf00:	03800793          	li	a5,56
    bf04:	00100993          	li	s3,1
    bf08:	02d7cc63          	blt	a5,a3,bf40 <__adddf3+0x2ac>
    bf0c:	00068793          	mv	a5,a3
    bf10:	01f00693          	li	a3,31
    bf14:	4af6c063          	blt	a3,a5,c3b4 <__adddf3+0x720>
    bf18:	02000693          	li	a3,32
    bf1c:	40f686b3          	sub	a3,a3,a5
    bf20:	00d899b3          	sll	s3,a7,a3
    bf24:	00ff5633          	srl	a2,t5,a5
    bf28:	00df16b3          	sll	a3,t5,a3
    bf2c:	00c9e9b3          	or	s3,s3,a2
    bf30:	00d036b3          	snez	a3,a3
    bf34:	00f8d8b3          	srl	a7,a7,a5
    bf38:	00d9e9b3          	or	s3,s3,a3
    bf3c:	01170733          	add	a4,a4,a7
    bf40:	00b985b3          	add	a1,s3,a1
    bf44:	0135b9b3          	sltu	s3,a1,s3
    bf48:	00058493          	mv	s1,a1
    bf4c:	00e989b3          	add	s3,s3,a4
    bf50:	00899793          	sll	a5,s3,0x8
    bf54:	1407d263          	bgez	a5,c098 <__adddf3+0x404>
    bf58:	00190913          	add	s2,s2,1
    bf5c:	7ff00793          	li	a5,2047
    bf60:	36f90c63          	beq	s2,a5,c2d8 <__adddf3+0x644>
    bf64:	ff8007b7          	lui	a5,0xff800
    bf68:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    bf6c:	0014f613          	and	a2,s1,1
    bf70:	00f9f7b3          	and	a5,s3,a5
    bf74:	0014d713          	srl	a4,s1,0x1
    bf78:	00c76733          	or	a4,a4,a2
    bf7c:	01f79613          	sll	a2,a5,0x1f
    bf80:	00e664b3          	or	s1,a2,a4
    bf84:	0017d993          	srl	s3,a5,0x1
    bf88:	e45ff06f          	j	bdcc <__adddf3+0x138>
    bf8c:	01e8e6b3          	or	a3,a7,t5
    bf90:	1c068a63          	beqz	a3,c164 <__adddf3+0x4d0>
    bf94:	fff78693          	add	a3,a5,-1
    bf98:	40068063          	beqz	a3,c398 <__adddf3+0x704>
    bf9c:	7ff00613          	li	a2,2047
    bfa0:	18c78a63          	beq	a5,a2,c134 <__adddf3+0x4a0>
    bfa4:	03800793          	li	a5,56
    bfa8:	00100613          	li	a2,1
    bfac:	dad7c2e3          	blt	a5,a3,bd50 <__adddf3+0xbc>
    bfb0:	00068793          	mv	a5,a3
    bfb4:	d6dff06f          	j	bd20 <__adddf3+0x8c>
    bfb8:	00190813          	add	a6,s2,1
    bfbc:	7fe87813          	and	a6,a6,2046
    bfc0:	22081c63          	bnez	a6,c1f8 <__adddf3+0x564>
    bfc4:	00b76333          	or	t1,a4,a1
    bfc8:	01e8e833          	or	a6,a7,t5
    bfcc:	38091063          	bnez	s2,c34c <__adddf3+0x6b8>
    bfd0:	46030e63          	beqz	t1,c44c <__adddf3+0x7b8>
    bfd4:	40080663          	beqz	a6,c3e0 <__adddf3+0x74c>
    bfd8:	41e589b3          	sub	s3,a1,t5
    bfdc:	0135b533          	sltu	a0,a1,s3
    bfe0:	41170633          	sub	a2,a4,a7
    bfe4:	40a60633          	sub	a2,a2,a0
    bfe8:	00861513          	sll	a0,a2,0x8
    bfec:	50055e63          	bgez	a0,c508 <__adddf3+0x874>
    bff0:	40bf05b3          	sub	a1,t5,a1
    bff4:	40e88733          	sub	a4,a7,a4
    bff8:	00bf3f33          	sltu	t5,t5,a1
    bffc:	41e70733          	sub	a4,a4,t5
    c000:	00871613          	sll	a2,a4,0x8
    c004:	00058493          	mv	s1,a1
    c008:	52065e63          	bgez	a2,c544 <__adddf3+0x8b0>
    c00c:	ff8007b7          	lui	a5,0xff800
    c010:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c014:	00f77733          	and	a4,a4,a5
    c018:	00068e13          	mv	t3,a3
    c01c:	00100793          	li	a5,1
    c020:	df9ff06f          	j	be18 <__adddf3+0x184>
    c024:	7ff00693          	li	a3,2047
    c028:	10d90663          	beq	s2,a3,c134 <__adddf3+0x4a0>
    c02c:	03800693          	li	a3,56
    c030:	00100993          	li	s3,1
    c034:	f0f6c6e3          	blt	a3,a5,bf40 <__adddf3+0x2ac>
    c038:	008006b7          	lui	a3,0x800
    c03c:	00d8e8b3          	or	a7,a7,a3
    c040:	ed1ff06f          	j	bf10 <__adddf3+0x27c>
    c044:	00048513          	mv	a0,s1
    c048:	08d020ef          	jal	e8d4 <__clzsi2>
    c04c:	01850793          	add	a5,a0,24
    c050:	01f00693          	li	a3,31
    c054:	d2f6d8e3          	bge	a3,a5,bd84 <__adddf3+0xf0>
    c058:	ff850713          	add	a4,a0,-8
    c05c:	00e49733          	sll	a4,s1,a4
    c060:	2327c663          	blt	a5,s2,c28c <__adddf3+0x5f8>
    c064:	41278933          	sub	s2,a5,s2
    c068:	00190793          	add	a5,s2,1
    c06c:	48f6d663          	bge	a3,a5,c4f8 <__adddf3+0x864>
    c070:	fe190913          	add	s2,s2,-31
    c074:	02000693          	li	a3,32
    c078:	012754b3          	srl	s1,a4,s2
    c07c:	00d78c63          	beq	a5,a3,c094 <__adddf3+0x400>
    c080:	04000693          	li	a3,64
    c084:	40f687b3          	sub	a5,a3,a5
    c088:	00f71733          	sll	a4,a4,a5
    c08c:	00e03733          	snez	a4,a4
    c090:	00e4e4b3          	or	s1,s1,a4
    c094:	00000913          	li	s2,0
    c098:	0074f793          	and	a5,s1,7
    c09c:	d2079ce3          	bnez	a5,bdd4 <__adddf3+0x140>
    c0a0:	00090793          	mv	a5,s2
    c0a4:	0034d613          	srl	a2,s1,0x3
    c0a8:	00098713          	mv	a4,s3
    c0ac:	0c00006f          	j	c16c <__adddf3+0x4d8>
    c0b0:	7ff00793          	li	a5,2047
    c0b4:	00000713          	li	a4,0
    c0b8:	00000813          	li	a6,0
    c0bc:	d71ff06f          	j	be2c <__adddf3+0x198>
    c0c0:	0c078a63          	beqz	a5,c194 <__adddf3+0x500>
    c0c4:	412307b3          	sub	a5,t1,s2
    c0c8:	1e090263          	beqz	s2,c2ac <__adddf3+0x618>
    c0cc:	7ff00693          	li	a3,2047
    c0d0:	32d30863          	beq	t1,a3,c400 <__adddf3+0x76c>
    c0d4:	03800693          	li	a3,56
    c0d8:	00100993          	li	s3,1
    c0dc:	02f6ce63          	blt	a3,a5,c118 <__adddf3+0x484>
    c0e0:	008006b7          	lui	a3,0x800
    c0e4:	00d76733          	or	a4,a4,a3
    c0e8:	01f00693          	li	a3,31
    c0ec:	3cf6c863          	blt	a3,a5,c4bc <__adddf3+0x828>
    c0f0:	02000693          	li	a3,32
    c0f4:	40f686b3          	sub	a3,a3,a5
    c0f8:	00d719b3          	sll	s3,a4,a3
    c0fc:	00f5d633          	srl	a2,a1,a5
    c100:	00d596b3          	sll	a3,a1,a3
    c104:	00c9e9b3          	or	s3,s3,a2
    c108:	00d036b3          	snez	a3,a3
    c10c:	00f75733          	srl	a4,a4,a5
    c110:	00d9e9b3          	or	s3,s3,a3
    c114:	00e888b3          	add	a7,a7,a4
    c118:	01e98733          	add	a4,s3,t5
    c11c:	013739b3          	sltu	s3,a4,s3
    c120:	00070493          	mv	s1,a4
    c124:	011989b3          	add	s3,s3,a7
    c128:	00030913          	mv	s2,t1
    c12c:	e25ff06f          	j	bf50 <__adddf3+0x2bc>
    c130:	02081063          	bnez	a6,c150 <__adddf3+0x4bc>
    c134:	00351613          	sll	a2,a0,0x3
    c138:	00365613          	srl	a2,a2,0x3
    c13c:	01d71813          	sll	a6,a4,0x1d
    c140:	00c86833          	or	a6,a6,a2
    c144:	00375713          	srl	a4,a4,0x3
    c148:	01076733          	or	a4,a4,a6
    c14c:	18070663          	beqz	a4,c2d8 <__adddf3+0x644>
    c150:	00000e13          	li	t3,0
    c154:	7ff00793          	li	a5,2047
    c158:	00080737          	lui	a4,0x80
    c15c:	00000813          	li	a6,0
    c160:	ccdff06f          	j	be2c <__adddf3+0x198>
    c164:	00351613          	sll	a2,a0,0x3
    c168:	00365613          	srl	a2,a2,0x3
    c16c:	01d71813          	sll	a6,a4,0x1d
    c170:	7ff00693          	li	a3,2047
    c174:	00c86833          	or	a6,a6,a2
    c178:	00375713          	srl	a4,a4,0x3
    c17c:	fcd786e3          	beq	a5,a3,c148 <__adddf3+0x4b4>
    c180:	00c71713          	sll	a4,a4,0xc
    c184:	00c75713          	srl	a4,a4,0xc
    c188:	7ff7f793          	and	a5,a5,2047
    c18c:	00040e13          	mv	t3,s0
    c190:	c9dff06f          	j	be2c <__adddf3+0x198>
    c194:	00190693          	add	a3,s2,1
    c198:	7fe6f813          	and	a6,a3,2046
    c19c:	14081863          	bnez	a6,c2ec <__adddf3+0x658>
    c1a0:	00b766b3          	or	a3,a4,a1
    c1a4:	28091c63          	bnez	s2,c43c <__adddf3+0x7a8>
    c1a8:	30068263          	beqz	a3,c4ac <__adddf3+0x818>
    c1ac:	01e8e6b3          	or	a3,a7,t5
    c1b0:	22068863          	beqz	a3,c3e0 <__adddf3+0x74c>
    c1b4:	01e587b3          	add	a5,a1,t5
    c1b8:	00b7b5b3          	sltu	a1,a5,a1
    c1bc:	01170733          	add	a4,a4,a7
    c1c0:	00b70733          	add	a4,a4,a1
    c1c4:	0037d813          	srl	a6,a5,0x3
    c1c8:	00871793          	sll	a5,a4,0x8
    c1cc:	00040e13          	mv	t3,s0
    c1d0:	3407de63          	bgez	a5,c52c <__adddf3+0x898>
    c1d4:	ff8007b7          	lui	a5,0xff800
    c1d8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c1dc:	00f77733          	and	a4,a4,a5
    c1e0:	01d71793          	sll	a5,a4,0x1d
    c1e4:	00375713          	srl	a4,a4,0x3
    c1e8:	0107e833          	or	a6,a5,a6
    c1ec:	01d77733          	and	a4,a4,t4
    c1f0:	00100793          	li	a5,1
    c1f4:	c39ff06f          	j	be2c <__adddf3+0x198>
    c1f8:	41e58833          	sub	a6,a1,t5
    c1fc:	0105b7b3          	sltu	a5,a1,a6
    c200:	411709b3          	sub	s3,a4,a7
    c204:	40f989b3          	sub	s3,s3,a5
    c208:	00899793          	sll	a5,s3,0x8
    c20c:	00080493          	mv	s1,a6
    c210:	1007c663          	bltz	a5,c31c <__adddf3+0x688>
    c214:	01386833          	or	a6,a6,s3
    c218:	b4081ee3          	bnez	a6,bd74 <__adddf3+0xe0>
    c21c:	00000e13          	li	t3,0
    c220:	00000793          	li	a5,0
    c224:	00000713          	li	a4,0
    c228:	c05ff06f          	j	be2c <__adddf3+0x198>
    c22c:	7ff00513          	li	a0,2047
    c230:	1aa30e63          	beq	t1,a0,c3ec <__adddf3+0x758>
    c234:	03800513          	li	a0,56
    c238:	00100613          	li	a2,1
    c23c:	c8f544e3          	blt	a0,a5,bec4 <__adddf3+0x230>
    c240:	00800637          	lui	a2,0x800
    c244:	00c76733          	or	a4,a4,a2
    c248:	c4dff06f          	j	be94 <__adddf3+0x200>
    c24c:	ff8009b7          	lui	s3,0xff800
    c250:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c254:	40f90933          	sub	s2,s2,a5
    c258:	013779b3          	and	s3,a4,s3
    c25c:	b71ff06f          	j	bdcc <__adddf3+0x138>
    c260:	fe078693          	add	a3,a5,-32
    c264:	02000613          	li	a2,32
    c268:	00d8d6b3          	srl	a3,a7,a3
    c26c:	00c78a63          	beq	a5,a2,c280 <__adddf3+0x5ec>
    c270:	04000613          	li	a2,64
    c274:	40f607b3          	sub	a5,a2,a5
    c278:	00f897b3          	sll	a5,a7,a5
    c27c:	00ff6f33          	or	t5,t5,a5
    c280:	01e03633          	snez	a2,t5
    c284:	00d66633          	or	a2,a2,a3
    c288:	ac9ff06f          	j	bd50 <__adddf3+0xbc>
    c28c:	ff8006b7          	lui	a3,0xff800
    c290:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c294:	40f907b3          	sub	a5,s2,a5
    c298:	00d77733          	and	a4,a4,a3
    c29c:	01d71813          	sll	a6,a4,0x1d
    c2a0:	01386833          	or	a6,a6,s3
    c2a4:	00375713          	srl	a4,a4,0x3
    c2a8:	ed9ff06f          	j	c180 <__adddf3+0x4ec>
    c2ac:	00b766b3          	or	a3,a4,a1
    c2b0:	1e068663          	beqz	a3,c49c <__adddf3+0x808>
    c2b4:	fff78693          	add	a3,a5,-1
    c2b8:	0a068e63          	beqz	a3,c374 <__adddf3+0x6e0>
    c2bc:	7ff00513          	li	a0,2047
    c2c0:	14a78063          	beq	a5,a0,c400 <__adddf3+0x76c>
    c2c4:	03800793          	li	a5,56
    c2c8:	00100993          	li	s3,1
    c2cc:	e4d7c6e3          	blt	a5,a3,c118 <__adddf3+0x484>
    c2d0:	00068793          	mv	a5,a3
    c2d4:	e15ff06f          	j	c0e8 <__adddf3+0x454>
    c2d8:	00040e13          	mv	t3,s0
    c2dc:	7ff00793          	li	a5,2047
    c2e0:	00000713          	li	a4,0
    c2e4:	00000813          	li	a6,0
    c2e8:	b45ff06f          	j	be2c <__adddf3+0x198>
    c2ec:	7ff00793          	li	a5,2047
    c2f0:	fef684e3          	beq	a3,a5,c2d8 <__adddf3+0x644>
    c2f4:	01e58f33          	add	t5,a1,t5
    c2f8:	00bf35b3          	sltu	a1,t5,a1
    c2fc:	011707b3          	add	a5,a4,a7
    c300:	00b787b3          	add	a5,a5,a1
    c304:	01f79613          	sll	a2,a5,0x1f
    c308:	001f5f13          	srl	t5,t5,0x1
    c30c:	01e664b3          	or	s1,a2,t5
    c310:	0017d993          	srl	s3,a5,0x1
    c314:	00068913          	mv	s2,a3
    c318:	ab5ff06f          	j	bdcc <__adddf3+0x138>
    c31c:	40bf0633          	sub	a2,t5,a1
    c320:	40e887b3          	sub	a5,a7,a4
    c324:	00cf3733          	sltu	a4,t5,a2
    c328:	00060493          	mv	s1,a2
    c32c:	40e789b3          	sub	s3,a5,a4
    c330:	00068413          	mv	s0,a3
    c334:	a41ff06f          	j	bd74 <__adddf3+0xe0>
    c338:	00361613          	sll	a2,a2,0x3
    c33c:	00365613          	srl	a2,a2,0x3
    c340:	00068413          	mv	s0,a3
    c344:	00088713          	mv	a4,a7
    c348:	e25ff06f          	j	c16c <__adddf3+0x4d8>
    c34c:	de0312e3          	bnez	t1,c130 <__adddf3+0x49c>
    c350:	1c080663          	beqz	a6,c51c <__adddf3+0x888>
    c354:	0038d713          	srl	a4,a7,0x3
    c358:	00361613          	sll	a2,a2,0x3
    c35c:	01d89893          	sll	a7,a7,0x1d
    c360:	01176733          	or	a4,a4,a7
    c364:	00365613          	srl	a2,a2,0x3
    c368:	00c76733          	or	a4,a4,a2
    c36c:	00068413          	mv	s0,a3
    c370:	dddff06f          	j	c14c <__adddf3+0x4b8>
    c374:	01e58f33          	add	t5,a1,t5
    c378:	011708b3          	add	a7,a4,a7
    c37c:	00bf35b3          	sltu	a1,t5,a1
    c380:	00b889b3          	add	s3,a7,a1
    c384:	00899793          	sll	a5,s3,0x8
    c388:	000f0493          	mv	s1,t5
    c38c:	0e07d463          	bgez	a5,c474 <__adddf3+0x7e0>
    c390:	00200913          	li	s2,2
    c394:	bd1ff06f          	j	bf64 <__adddf3+0x2d0>
    c398:	41e58f33          	sub	t5,a1,t5
    c39c:	411708b3          	sub	a7,a4,a7
    c3a0:	01e5b5b3          	sltu	a1,a1,t5
    c3a4:	000f0493          	mv	s1,t5
    c3a8:	40b889b3          	sub	s3,a7,a1
    c3ac:	00100913          	li	s2,1
    c3b0:	9b1ff06f          	j	bd60 <__adddf3+0xcc>
    c3b4:	fe078693          	add	a3,a5,-32
    c3b8:	02000613          	li	a2,32
    c3bc:	00d8d6b3          	srl	a3,a7,a3
    c3c0:	00c78a63          	beq	a5,a2,c3d4 <__adddf3+0x740>
    c3c4:	04000613          	li	a2,64
    c3c8:	40f607b3          	sub	a5,a2,a5
    c3cc:	00f897b3          	sll	a5,a7,a5
    c3d0:	00ff6f33          	or	t5,t5,a5
    c3d4:	01e039b3          	snez	s3,t5
    c3d8:	00d9e9b3          	or	s3,s3,a3
    c3dc:	b65ff06f          	j	bf40 <__adddf3+0x2ac>
    c3e0:	00351613          	sll	a2,a0,0x3
    c3e4:	00365993          	srl	s3,a2,0x3
    c3e8:	eb5ff06f          	j	c29c <__adddf3+0x608>
    c3ec:	00361613          	sll	a2,a2,0x3
    c3f0:	00365613          	srl	a2,a2,0x3
    c3f4:	00068413          	mv	s0,a3
    c3f8:	00088713          	mv	a4,a7
    c3fc:	d41ff06f          	j	c13c <__adddf3+0x4a8>
    c400:	00361613          	sll	a2,a2,0x3
    c404:	00365613          	srl	a2,a2,0x3
    c408:	00088713          	mv	a4,a7
    c40c:	d31ff06f          	j	c13c <__adddf3+0x4a8>
    c410:	fe078513          	add	a0,a5,-32
    c414:	02000613          	li	a2,32
    c418:	00a75533          	srl	a0,a4,a0
    c41c:	00c78a63          	beq	a5,a2,c430 <__adddf3+0x79c>
    c420:	04000613          	li	a2,64
    c424:	40f607b3          	sub	a5,a2,a5
    c428:	00f717b3          	sll	a5,a4,a5
    c42c:	00f5e5b3          	or	a1,a1,a5
    c430:	00b03633          	snez	a2,a1
    c434:	00a66633          	or	a2,a2,a0
    c438:	a8dff06f          	j	bec4 <__adddf3+0x230>
    c43c:	fc0682e3          	beqz	a3,c400 <__adddf3+0x76c>
    c440:	01e8ef33          	or	t5,a7,t5
    c444:	d00f16e3          	bnez	t5,c150 <__adddf3+0x4bc>
    c448:	cedff06f          	j	c134 <__adddf3+0x4a0>
    c44c:	dc0808e3          	beqz	a6,c21c <__adddf3+0x588>
    c450:	00361813          	sll	a6,a2,0x3
    c454:	01d89793          	sll	a5,a7,0x1d
    c458:	00385813          	srl	a6,a6,0x3
    c45c:	0038d713          	srl	a4,a7,0x3
    c460:	00f86833          	or	a6,a6,a5
    c464:	01d77733          	and	a4,a4,t4
    c468:	00068e13          	mv	t3,a3
    c46c:	00000793          	li	a5,0
    c470:	9bdff06f          	j	be2c <__adddf3+0x198>
    c474:	00100793          	li	a5,1
    c478:	c2dff06f          	j	c0a4 <__adddf3+0x410>
    c47c:	40bf05b3          	sub	a1,t5,a1
    c480:	40e888b3          	sub	a7,a7,a4
    c484:	00bf3733          	sltu	a4,t5,a1
    c488:	00058493          	mv	s1,a1
    c48c:	40e889b3          	sub	s3,a7,a4
    c490:	00068413          	mv	s0,a3
    c494:	00100913          	li	s2,1
    c498:	8c9ff06f          	j	bd60 <__adddf3+0xcc>
    c49c:	00361613          	sll	a2,a2,0x3
    c4a0:	00365613          	srl	a2,a2,0x3
    c4a4:	00088713          	mv	a4,a7
    c4a8:	cc5ff06f          	j	c16c <__adddf3+0x4d8>
    c4ac:	00361613          	sll	a2,a2,0x3
    c4b0:	00365993          	srl	s3,a2,0x3
    c4b4:	00088713          	mv	a4,a7
    c4b8:	de5ff06f          	j	c29c <__adddf3+0x608>
    c4bc:	fe078693          	add	a3,a5,-32
    c4c0:	02000613          	li	a2,32
    c4c4:	00d756b3          	srl	a3,a4,a3
    c4c8:	00c78a63          	beq	a5,a2,c4dc <__adddf3+0x848>
    c4cc:	04000613          	li	a2,64
    c4d0:	40f607b3          	sub	a5,a2,a5
    c4d4:	00f717b3          	sll	a5,a4,a5
    c4d8:	00f5e5b3          	or	a1,a1,a5
    c4dc:	00b039b3          	snez	s3,a1
    c4e0:	00d9e9b3          	or	s3,s3,a3
    c4e4:	c35ff06f          	j	c118 <__adddf3+0x484>
    c4e8:	0034d613          	srl	a2,s1,0x3
    c4ec:	00090793          	mv	a5,s2
    c4f0:	00098713          	mv	a4,s3
    c4f4:	c79ff06f          	j	c16c <__adddf3+0x4d8>
    c4f8:	02000693          	li	a3,32
    c4fc:	40f686b3          	sub	a3,a3,a5
    c500:	00000613          	li	a2,0
    c504:	8b5ff06f          	j	bdb8 <__adddf3+0x124>
    c508:	00c9e833          	or	a6,s3,a2
    c50c:	d00808e3          	beqz	a6,c21c <__adddf3+0x588>
    c510:	0039d993          	srl	s3,s3,0x3
    c514:	00060713          	mv	a4,a2
    c518:	d85ff06f          	j	c29c <__adddf3+0x608>
    c51c:	00000e13          	li	t3,0
    c520:	7ff00793          	li	a5,2047
    c524:	00080737          	lui	a4,0x80
    c528:	905ff06f          	j	be2c <__adddf3+0x198>
    c52c:	01d71793          	sll	a5,a4,0x1d
    c530:	00375713          	srl	a4,a4,0x3
    c534:	0107e833          	or	a6,a5,a6
    c538:	01d77733          	and	a4,a4,t4
    c53c:	00000793          	li	a5,0
    c540:	8edff06f          	j	be2c <__adddf3+0x198>
    c544:	01d71813          	sll	a6,a4,0x1d
    c548:	0035d593          	srl	a1,a1,0x3
    c54c:	00b86833          	or	a6,a6,a1
    c550:	00375713          	srl	a4,a4,0x3
    c554:	00068413          	mv	s0,a3
    c558:	c29ff06f          	j	c180 <__adddf3+0x4ec>

0000c55c <__divdf3>:
    c55c:	fb010113          	add	sp,sp,-80
    c560:	0145d793          	srl	a5,a1,0x14
    c564:	04812423          	sw	s0,72(sp)
    c568:	04912223          	sw	s1,68(sp)
    c56c:	05212023          	sw	s2,64(sp)
    c570:	03412c23          	sw	s4,56(sp)
    c574:	03512a23          	sw	s5,52(sp)
    c578:	00c59493          	sll	s1,a1,0xc
    c57c:	04112623          	sw	ra,76(sp)
    c580:	03312e23          	sw	s3,60(sp)
    c584:	03612823          	sw	s6,48(sp)
    c588:	03712623          	sw	s7,44(sp)
    c58c:	03812423          	sw	s8,40(sp)
    c590:	7ff7f793          	and	a5,a5,2047
    c594:	00050413          	mv	s0,a0
    c598:	00060a13          	mv	s4,a2
    c59c:	00068913          	mv	s2,a3
    c5a0:	00c4d493          	srl	s1,s1,0xc
    c5a4:	01f5da93          	srl	s5,a1,0x1f
    c5a8:	18078c63          	beqz	a5,c740 <__divdf3+0x1e4>
    c5ac:	7ff00713          	li	a4,2047
    c5b0:	08e78a63          	beq	a5,a4,c644 <__divdf3+0xe8>
    c5b4:	01d55b13          	srl	s6,a0,0x1d
    c5b8:	00349493          	sll	s1,s1,0x3
    c5bc:	009b64b3          	or	s1,s6,s1
    c5c0:	00800737          	lui	a4,0x800
    c5c4:	00e4eb33          	or	s6,s1,a4
    c5c8:	00351b93          	sll	s7,a0,0x3
    c5cc:	c0178993          	add	s3,a5,-1023
    c5d0:	00000493          	li	s1,0
    c5d4:	00000c13          	li	s8,0
    c5d8:	01495793          	srl	a5,s2,0x14
    c5dc:	00c91413          	sll	s0,s2,0xc
    c5e0:	7ff7f793          	and	a5,a5,2047
    c5e4:	00c45413          	srl	s0,s0,0xc
    c5e8:	01f95913          	srl	s2,s2,0x1f
    c5ec:	08078463          	beqz	a5,c674 <__divdf3+0x118>
    c5f0:	7ff00713          	li	a4,2047
    c5f4:	18e78c63          	beq	a5,a4,c78c <__divdf3+0x230>
    c5f8:	00341413          	sll	s0,s0,0x3
    c5fc:	01da5713          	srl	a4,s4,0x1d
    c600:	00876733          	or	a4,a4,s0
    c604:	c0178793          	add	a5,a5,-1023
    c608:	00800437          	lui	s0,0x800
    c60c:	40f989b3          	sub	s3,s3,a5
    c610:	00876433          	or	s0,a4,s0
    c614:	003a1813          	sll	a6,s4,0x3
    c618:	00000793          	li	a5,0
    c61c:	00f00713          	li	a4,15
    c620:	012aca33          	xor	s4,s5,s2
    c624:	24976663          	bltu	a4,s1,c870 <__divdf3+0x314>
    c628:	00003697          	auipc	a3,0x3
    c62c:	be868693          	add	a3,a3,-1048 # f210 <__mprec_tens+0xc8>
    c630:	00249493          	sll	s1,s1,0x2
    c634:	00d484b3          	add	s1,s1,a3
    c638:	0004a703          	lw	a4,0(s1)
    c63c:	00d70733          	add	a4,a4,a3
    c640:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    c644:	00a4eb33          	or	s6,s1,a0
    c648:	1c0b1e63          	bnez	s6,c824 <__divdf3+0x2c8>
    c64c:	01495793          	srl	a5,s2,0x14
    c650:	00c91413          	sll	s0,s2,0xc
    c654:	7ff7f793          	and	a5,a5,2047
    c658:	00000b93          	li	s7,0
    c65c:	00800493          	li	s1,8
    c660:	7ff00993          	li	s3,2047
    c664:	00200c13          	li	s8,2
    c668:	00c45413          	srl	s0,s0,0xc
    c66c:	01f95913          	srl	s2,s2,0x1f
    c670:	f80790e3          	bnez	a5,c5f0 <__divdf3+0x94>
    c674:	01446833          	or	a6,s0,s4
    c678:	1c080263          	beqz	a6,c83c <__divdf3+0x2e0>
    c67c:	5c040663          	beqz	s0,cc48 <__divdf3+0x6ec>
    c680:	00040513          	mv	a0,s0
    c684:	250020ef          	jal	e8d4 <__clzsi2>
    c688:	00050793          	mv	a5,a0
    c68c:	ff550693          	add	a3,a0,-11
    c690:	01d00713          	li	a4,29
    c694:	ff878813          	add	a6,a5,-8
    c698:	40d70733          	sub	a4,a4,a3
    c69c:	01041433          	sll	s0,s0,a6
    c6a0:	00ea5733          	srl	a4,s4,a4
    c6a4:	00876433          	or	s0,a4,s0
    c6a8:	010a1833          	sll	a6,s4,a6
    c6ac:	013787b3          	add	a5,a5,s3
    c6b0:	3f378993          	add	s3,a5,1011
    c6b4:	00000793          	li	a5,0
    c6b8:	f65ff06f          	j	c61c <__divdf3+0xc0>
    c6bc:	40f70733          	sub	a4,a4,a5
    c6c0:	03800693          	li	a3,56
    c6c4:	60e6d063          	bge	a3,a4,ccc4 <__divdf3+0x768>
    c6c8:	00000793          	li	a5,0
    c6cc:	00000693          	li	a3,0
    c6d0:	00000713          	li	a4,0
    c6d4:	04c12083          	lw	ra,76(sp)
    c6d8:	04812403          	lw	s0,72(sp)
    c6dc:	01479793          	sll	a5,a5,0x14
    c6e0:	00d7e7b3          	or	a5,a5,a3
    c6e4:	01fa1693          	sll	a3,s4,0x1f
    c6e8:	00d7e7b3          	or	a5,a5,a3
    c6ec:	04412483          	lw	s1,68(sp)
    c6f0:	04012903          	lw	s2,64(sp)
    c6f4:	03c12983          	lw	s3,60(sp)
    c6f8:	03812a03          	lw	s4,56(sp)
    c6fc:	03412a83          	lw	s5,52(sp)
    c700:	03012b03          	lw	s6,48(sp)
    c704:	02c12b83          	lw	s7,44(sp)
    c708:	02812c03          	lw	s8,40(sp)
    c70c:	00070513          	mv	a0,a4
    c710:	00078593          	mv	a1,a5
    c714:	05010113          	add	sp,sp,80
    c718:	00008067          	ret
    c71c:	7ff00793          	li	a5,2047
    c720:	00000693          	li	a3,0
    c724:	00000713          	li	a4,0
    c728:	fadff06f          	j	c6d4 <__divdf3+0x178>
    c72c:	00000a13          	li	s4,0
    c730:	7ff00793          	li	a5,2047
    c734:	000806b7          	lui	a3,0x80
    c738:	00000713          	li	a4,0
    c73c:	f99ff06f          	j	c6d4 <__divdf3+0x178>
    c740:	00a4eb33          	or	s6,s1,a0
    c744:	100b0c63          	beqz	s6,c85c <__divdf3+0x300>
    c748:	52048463          	beqz	s1,cc70 <__divdf3+0x714>
    c74c:	00048513          	mv	a0,s1
    c750:	184020ef          	jal	e8d4 <__clzsi2>
    c754:	00050713          	mv	a4,a0
    c758:	ff550793          	add	a5,a0,-11
    c75c:	01d00b13          	li	s6,29
    c760:	ff870b93          	add	s7,a4,-8
    c764:	40fb0b33          	sub	s6,s6,a5
    c768:	017494b3          	sll	s1,s1,s7
    c76c:	01645b33          	srl	s6,s0,s6
    c770:	009b6b33          	or	s6,s6,s1
    c774:	01741bb3          	sll	s7,s0,s7
    c778:	c0d00793          	li	a5,-1011
    c77c:	40e789b3          	sub	s3,a5,a4
    c780:	00000493          	li	s1,0
    c784:	00000c13          	li	s8,0
    c788:	e51ff06f          	j	c5d8 <__divdf3+0x7c>
    c78c:	01446833          	or	a6,s0,s4
    c790:	80198993          	add	s3,s3,-2047
    c794:	0a081c63          	bnez	a6,c84c <__divdf3+0x2f0>
    c798:	0024e493          	or	s1,s1,2
    c79c:	00000413          	li	s0,0
    c7a0:	00200793          	li	a5,2
    c7a4:	e79ff06f          	j	c61c <__divdf3+0xc0>
    c7a8:	000a8913          	mv	s2,s5
    c7ac:	000b0413          	mv	s0,s6
    c7b0:	000b8813          	mv	a6,s7
    c7b4:	00200793          	li	a5,2
    c7b8:	60fc0863          	beq	s8,a5,cdc8 <__divdf3+0x86c>
    c7bc:	00300793          	li	a5,3
    c7c0:	f6fc06e3          	beq	s8,a5,c72c <__divdf3+0x1d0>
    c7c4:	00100793          	li	a5,1
    c7c8:	00090a13          	mv	s4,s2
    c7cc:	eefc0ee3          	beq	s8,a5,c6c8 <__divdf3+0x16c>
    c7d0:	3ff98793          	add	a5,s3,1023
    c7d4:	3cf05263          	blez	a5,cb98 <__divdf3+0x63c>
    c7d8:	00787713          	and	a4,a6,7
    c7dc:	5c071663          	bnez	a4,cda8 <__divdf3+0x84c>
    c7e0:	00741713          	sll	a4,s0,0x7
    c7e4:	00075a63          	bgez	a4,c7f8 <__divdf3+0x29c>
    c7e8:	ff0007b7          	lui	a5,0xff000
    c7ec:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    c7f0:	00f47433          	and	s0,s0,a5
    c7f4:	40098793          	add	a5,s3,1024
    c7f8:	7fe00713          	li	a4,2046
    c7fc:	f2f740e3          	blt	a4,a5,c71c <__divdf3+0x1c0>
    c800:	00385813          	srl	a6,a6,0x3
    c804:	01d41713          	sll	a4,s0,0x1d
    c808:	00941693          	sll	a3,s0,0x9
    c80c:	01076733          	or	a4,a4,a6
    c810:	00c6d693          	srl	a3,a3,0xc
    c814:	7ff7f793          	and	a5,a5,2047
    c818:	ebdff06f          	j	c6d4 <__divdf3+0x178>
    c81c:	00078c13          	mv	s8,a5
    c820:	f95ff06f          	j	c7b4 <__divdf3+0x258>
    c824:	00048b13          	mv	s6,s1
    c828:	00050b93          	mv	s7,a0
    c82c:	00c00493          	li	s1,12
    c830:	7ff00993          	li	s3,2047
    c834:	00300c13          	li	s8,3
    c838:	da1ff06f          	j	c5d8 <__divdf3+0x7c>
    c83c:	0014e493          	or	s1,s1,1
    c840:	00000413          	li	s0,0
    c844:	00100793          	li	a5,1
    c848:	dd5ff06f          	j	c61c <__divdf3+0xc0>
    c84c:	0034e493          	or	s1,s1,3
    c850:	000a0813          	mv	a6,s4
    c854:	00300793          	li	a5,3
    c858:	dc5ff06f          	j	c61c <__divdf3+0xc0>
    c85c:	00000b93          	li	s7,0
    c860:	00400493          	li	s1,4
    c864:	00000993          	li	s3,0
    c868:	00100c13          	li	s8,1
    c86c:	d6dff06f          	j	c5d8 <__divdf3+0x7c>
    c870:	03912223          	sw	s9,36(sp)
    c874:	03a12023          	sw	s10,32(sp)
    c878:	01b12e23          	sw	s11,28(sp)
    c87c:	3b646a63          	bltu	s0,s6,cc30 <__divdf3+0x6d4>
    c880:	3a8b0663          	beq	s6,s0,cc2c <__divdf3+0x6d0>
    c884:	fff98993          	add	s3,s3,-1
    c888:	000b8c13          	mv	s8,s7
    c88c:	000b0493          	mv	s1,s6
    c890:	00000d13          	li	s10,0
    c894:	01885c93          	srl	s9,a6,0x18
    c898:	00841413          	sll	s0,s0,0x8
    c89c:	01045913          	srl	s2,s0,0x10
    c8a0:	008cecb3          	or	s9,s9,s0
    c8a4:	00090593          	mv	a1,s2
    c8a8:	00048513          	mv	a0,s1
    c8ac:	010c9b13          	sll	s6,s9,0x10
    c8b0:	00881a93          	sll	s5,a6,0x8
    c8b4:	010b5b13          	srl	s6,s6,0x10
    c8b8:	771010ef          	jal	e828 <__hidden___udivsi3>
    c8bc:	00050593          	mv	a1,a0
    c8c0:	00050413          	mv	s0,a0
    c8c4:	000b0513          	mv	a0,s6
    c8c8:	69d010ef          	jal	e764 <__mulsi3>
    c8cc:	00050793          	mv	a5,a0
    c8d0:	00090593          	mv	a1,s2
    c8d4:	00048513          	mv	a0,s1
    c8d8:	00078493          	mv	s1,a5
    c8dc:	795010ef          	jal	e870 <__umodsi3>
    c8e0:	01051513          	sll	a0,a0,0x10
    c8e4:	010c5793          	srl	a5,s8,0x10
    c8e8:	00a7e7b3          	or	a5,a5,a0
    c8ec:	0097fa63          	bgeu	a5,s1,c900 <__divdf3+0x3a4>
    c8f0:	00fc87b3          	add	a5,s9,a5
    c8f4:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c8f8:	3b97fe63          	bgeu	a5,s9,ccb4 <__divdf3+0x758>
    c8fc:	00070413          	mv	s0,a4
    c900:	409784b3          	sub	s1,a5,s1
    c904:	00090593          	mv	a1,s2
    c908:	00048513          	mv	a0,s1
    c90c:	71d010ef          	jal	e828 <__hidden___udivsi3>
    c910:	00050593          	mv	a1,a0
    c914:	00050b93          	mv	s7,a0
    c918:	000b0513          	mv	a0,s6
    c91c:	649010ef          	jal	e764 <__mulsi3>
    c920:	00050793          	mv	a5,a0
    c924:	00090593          	mv	a1,s2
    c928:	00048513          	mv	a0,s1
    c92c:	00078493          	mv	s1,a5
    c930:	741010ef          	jal	e870 <__umodsi3>
    c934:	010c1793          	sll	a5,s8,0x10
    c938:	01051513          	sll	a0,a0,0x10
    c93c:	0107d793          	srl	a5,a5,0x10
    c940:	00a7e7b3          	or	a5,a5,a0
    c944:	0097fa63          	bgeu	a5,s1,c958 <__divdf3+0x3fc>
    c948:	00fc87b3          	add	a5,s9,a5
    c94c:	fffb8713          	add	a4,s7,-1
    c950:	3597fa63          	bgeu	a5,s9,cca4 <__divdf3+0x748>
    c954:	00070b93          	mv	s7,a4
    c958:	00010337          	lui	t1,0x10
    c95c:	01041413          	sll	s0,s0,0x10
    c960:	01746433          	or	s0,s0,s7
    c964:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    c968:	01b478b3          	and	a7,s0,s11
    c96c:	01bafdb3          	and	s11,s5,s11
    c970:	40978bb3          	sub	s7,a5,s1
    c974:	010adc13          	srl	s8,s5,0x10
    c978:	01045793          	srl	a5,s0,0x10
    c97c:	00088513          	mv	a0,a7
    c980:	000d8593          	mv	a1,s11
    c984:	5e1010ef          	jal	e764 <__mulsi3>
    c988:	00050813          	mv	a6,a0
    c98c:	000c0593          	mv	a1,s8
    c990:	00088513          	mv	a0,a7
    c994:	5d1010ef          	jal	e764 <__mulsi3>
    c998:	00050893          	mv	a7,a0
    c99c:	000d8593          	mv	a1,s11
    c9a0:	00078513          	mv	a0,a5
    c9a4:	5c1010ef          	jal	e764 <__mulsi3>
    c9a8:	00050e13          	mv	t3,a0
    c9ac:	000c0593          	mv	a1,s8
    c9b0:	00078513          	mv	a0,a5
    c9b4:	5b1010ef          	jal	e764 <__mulsi3>
    c9b8:	01085793          	srl	a5,a6,0x10
    c9bc:	01c888b3          	add	a7,a7,t3
    c9c0:	011787b3          	add	a5,a5,a7
    c9c4:	01c7f463          	bgeu	a5,t3,c9cc <__divdf3+0x470>
    c9c8:	00650533          	add	a0,a0,t1
    c9cc:	00010637          	lui	a2,0x10
    c9d0:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    c9d4:	00c7f4b3          	and	s1,a5,a2
    c9d8:	0107d693          	srl	a3,a5,0x10
    c9dc:	01049493          	sll	s1,s1,0x10
    c9e0:	00c87833          	and	a6,a6,a2
    c9e4:	00a687b3          	add	a5,a3,a0
    c9e8:	010484b3          	add	s1,s1,a6
    c9ec:	20fbea63          	bltu	s7,a5,cc00 <__divdf3+0x6a4>
    c9f0:	20fb8663          	beq	s7,a5,cbfc <__divdf3+0x6a0>
    c9f4:	409d04b3          	sub	s1,s10,s1
    c9f8:	40fb8bb3          	sub	s7,s7,a5
    c9fc:	009d3d33          	sltu	s10,s10,s1
    ca00:	41ab8bb3          	sub	s7,s7,s10
    ca04:	377c8a63          	beq	s9,s7,cd78 <__divdf3+0x81c>
    ca08:	00090593          	mv	a1,s2
    ca0c:	000b8513          	mv	a0,s7
    ca10:	619010ef          	jal	e828 <__hidden___udivsi3>
    ca14:	00050593          	mv	a1,a0
    ca18:	00a12623          	sw	a0,12(sp)
    ca1c:	00050d13          	mv	s10,a0
    ca20:	000b0513          	mv	a0,s6
    ca24:	541010ef          	jal	e764 <__mulsi3>
    ca28:	00050793          	mv	a5,a0
    ca2c:	00090593          	mv	a1,s2
    ca30:	000b8513          	mv	a0,s7
    ca34:	00078b93          	mv	s7,a5
    ca38:	639010ef          	jal	e870 <__umodsi3>
    ca3c:	01051513          	sll	a0,a0,0x10
    ca40:	0104d793          	srl	a5,s1,0x10
    ca44:	00a7e7b3          	or	a5,a5,a0
    ca48:	0377f063          	bgeu	a5,s7,ca68 <__divdf3+0x50c>
    ca4c:	00fc87b3          	add	a5,s9,a5
    ca50:	fffd0693          	add	a3,s10,-1
    ca54:	3797e263          	bltu	a5,s9,cdb8 <__divdf3+0x85c>
    ca58:	3777f063          	bgeu	a5,s7,cdb8 <__divdf3+0x85c>
    ca5c:	ffed0713          	add	a4,s10,-2
    ca60:	00e12623          	sw	a4,12(sp)
    ca64:	019787b3          	add	a5,a5,s9
    ca68:	41778bb3          	sub	s7,a5,s7
    ca6c:	00090593          	mv	a1,s2
    ca70:	000b8513          	mv	a0,s7
    ca74:	5b5010ef          	jal	e828 <__hidden___udivsi3>
    ca78:	00050593          	mv	a1,a0
    ca7c:	00050d13          	mv	s10,a0
    ca80:	000b0513          	mv	a0,s6
    ca84:	4e1010ef          	jal	e764 <__mulsi3>
    ca88:	00050793          	mv	a5,a0
    ca8c:	00090593          	mv	a1,s2
    ca90:	000b8513          	mv	a0,s7
    ca94:	00078913          	mv	s2,a5
    ca98:	01049493          	sll	s1,s1,0x10
    ca9c:	5d5010ef          	jal	e870 <__umodsi3>
    caa0:	01051513          	sll	a0,a0,0x10
    caa4:	0104d493          	srl	s1,s1,0x10
    caa8:	00a4e4b3          	or	s1,s1,a0
    caac:	0124fe63          	bgeu	s1,s2,cac8 <__divdf3+0x56c>
    cab0:	009c84b3          	add	s1,s9,s1
    cab4:	fffd0793          	add	a5,s10,-1
    cab8:	3194e463          	bltu	s1,s9,cdc0 <__divdf3+0x864>
    cabc:	3124f263          	bgeu	s1,s2,cdc0 <__divdf3+0x864>
    cac0:	ffed0d13          	add	s10,s10,-2
    cac4:	019484b3          	add	s1,s1,s9
    cac8:	00c12783          	lw	a5,12(sp)
    cacc:	412484b3          	sub	s1,s1,s2
    cad0:	000d8593          	mv	a1,s11
    cad4:	01079813          	sll	a6,a5,0x10
    cad8:	01a86833          	or	a6,a6,s10
    cadc:	01081313          	sll	t1,a6,0x10
    cae0:	01035313          	srl	t1,t1,0x10
    cae4:	01085793          	srl	a5,a6,0x10
    cae8:	00030513          	mv	a0,t1
    caec:	479010ef          	jal	e764 <__mulsi3>
    caf0:	00050893          	mv	a7,a0
    caf4:	000c0593          	mv	a1,s8
    caf8:	00030513          	mv	a0,t1
    cafc:	469010ef          	jal	e764 <__mulsi3>
    cb00:	00050313          	mv	t1,a0
    cb04:	000d8593          	mv	a1,s11
    cb08:	00078513          	mv	a0,a5
    cb0c:	459010ef          	jal	e764 <__mulsi3>
    cb10:	00050e13          	mv	t3,a0
    cb14:	000c0593          	mv	a1,s8
    cb18:	00078513          	mv	a0,a5
    cb1c:	449010ef          	jal	e764 <__mulsi3>
    cb20:	0108d793          	srl	a5,a7,0x10
    cb24:	01c30333          	add	t1,t1,t3
    cb28:	006787b3          	add	a5,a5,t1
    cb2c:	01c7f663          	bgeu	a5,t3,cb38 <__divdf3+0x5dc>
    cb30:	00010737          	lui	a4,0x10
    cb34:	00e50533          	add	a0,a0,a4
    cb38:	000106b7          	lui	a3,0x10
    cb3c:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    cb40:	0107d713          	srl	a4,a5,0x10
    cb44:	00d7f7b3          	and	a5,a5,a3
    cb48:	01079793          	sll	a5,a5,0x10
    cb4c:	00d8f8b3          	and	a7,a7,a3
    cb50:	00a70733          	add	a4,a4,a0
    cb54:	011787b3          	add	a5,a5,a7
    cb58:	02e4e063          	bltu	s1,a4,cb78 <__divdf3+0x61c>
    cb5c:	00e48c63          	beq	s1,a4,cb74 <__divdf3+0x618>
    cb60:	02412c83          	lw	s9,36(sp)
    cb64:	02012d03          	lw	s10,32(sp)
    cb68:	01c12d83          	lw	s11,28(sp)
    cb6c:	00186813          	or	a6,a6,1
    cb70:	c61ff06f          	j	c7d0 <__divdf3+0x274>
    cb74:	1c078a63          	beqz	a5,cd48 <__divdf3+0x7ec>
    cb78:	009c84b3          	add	s1,s9,s1
    cb7c:	fff80613          	add	a2,a6,-1
    cb80:	00048693          	mv	a3,s1
    cb84:	1b94ec63          	bltu	s1,s9,cd3c <__divdf3+0x7e0>
    cb88:	24e4ea63          	bltu	s1,a4,cddc <__divdf3+0x880>
    cb8c:	26e48863          	beq	s1,a4,cdfc <__divdf3+0x8a0>
    cb90:	00060813          	mv	a6,a2
    cb94:	fcdff06f          	j	cb60 <__divdf3+0x604>
    cb98:	00100713          	li	a4,1
    cb9c:	b20790e3          	bnez	a5,c6bc <__divdf3+0x160>
    cba0:	41e98793          	add	a5,s3,1054
    cba4:	00f816b3          	sll	a3,a6,a5
    cba8:	00d036b3          	snez	a3,a3
    cbac:	00f417b3          	sll	a5,s0,a5
    cbb0:	00f6e7b3          	or	a5,a3,a5
    cbb4:	00e85833          	srl	a6,a6,a4
    cbb8:	00f86833          	or	a6,a6,a5
    cbbc:	00787793          	and	a5,a6,7
    cbc0:	00e45433          	srl	s0,s0,a4
    cbc4:	02078063          	beqz	a5,cbe4 <__divdf3+0x688>
    cbc8:	00f87793          	and	a5,a6,15
    cbcc:	00400713          	li	a4,4
    cbd0:	00e78a63          	beq	a5,a4,cbe4 <__divdf3+0x688>
    cbd4:	00480793          	add	a5,a6,4
    cbd8:	0107b833          	sltu	a6,a5,a6
    cbdc:	01040433          	add	s0,s0,a6
    cbe0:	00078813          	mv	a6,a5
    cbe4:	00841613          	sll	a2,s0,0x8
    cbe8:	00100793          	li	a5,1
    cbec:	00000693          	li	a3,0
    cbf0:	00000713          	li	a4,0
    cbf4:	ae0640e3          	bltz	a2,c6d4 <__divdf3+0x178>
    cbf8:	1280006f          	j	cd20 <__divdf3+0x7c4>
    cbfc:	de9d7ce3          	bgeu	s10,s1,c9f4 <__divdf3+0x498>
    cc00:	015d06b3          	add	a3,s10,s5
    cc04:	01a6b633          	sltu	a2,a3,s10
    cc08:	019605b3          	add	a1,a2,s9
    cc0c:	00bb8bb3          	add	s7,s7,a1
    cc10:	00068d13          	mv	s10,a3
    cc14:	fff40593          	add	a1,s0,-1
    cc18:	077cfe63          	bgeu	s9,s7,cc94 <__divdf3+0x738>
    cc1c:	14fbe063          	bltu	s7,a5,cd5c <__divdf3+0x800>
    cc20:	13778c63          	beq	a5,s7,cd58 <__divdf3+0x7fc>
    cc24:	00058413          	mv	s0,a1
    cc28:	dcdff06f          	j	c9f4 <__divdf3+0x498>
    cc2c:	c50bece3          	bltu	s7,a6,c884 <__divdf3+0x328>
    cc30:	01fb1c13          	sll	s8,s6,0x1f
    cc34:	001bd713          	srl	a4,s7,0x1
    cc38:	001b5493          	srl	s1,s6,0x1
    cc3c:	00ec6c33          	or	s8,s8,a4
    cc40:	01fb9d13          	sll	s10,s7,0x1f
    cc44:	c51ff06f          	j	c894 <__divdf3+0x338>
    cc48:	000a0513          	mv	a0,s4
    cc4c:	489010ef          	jal	e8d4 <__clzsi2>
    cc50:	01550693          	add	a3,a0,21
    cc54:	01c00713          	li	a4,28
    cc58:	02050793          	add	a5,a0,32
    cc5c:	a2d75ae3          	bge	a4,a3,c690 <__divdf3+0x134>
    cc60:	ff850513          	add	a0,a0,-8
    cc64:	00000813          	li	a6,0
    cc68:	00aa1433          	sll	s0,s4,a0
    cc6c:	a41ff06f          	j	c6ac <__divdf3+0x150>
    cc70:	465010ef          	jal	e8d4 <__clzsi2>
    cc74:	01550793          	add	a5,a0,21
    cc78:	01c00693          	li	a3,28
    cc7c:	02050713          	add	a4,a0,32
    cc80:	acf6dee3          	bge	a3,a5,c75c <__divdf3+0x200>
    cc84:	ff850493          	add	s1,a0,-8
    cc88:	00941b33          	sll	s6,s0,s1
    cc8c:	00000b93          	li	s7,0
    cc90:	ae9ff06f          	j	c778 <__divdf3+0x21c>
    cc94:	f97c98e3          	bne	s9,s7,cc24 <__divdf3+0x6c8>
    cc98:	f80602e3          	beqz	a2,cc1c <__divdf3+0x6c0>
    cc9c:	00058413          	mv	s0,a1
    cca0:	d55ff06f          	j	c9f4 <__divdf3+0x498>
    cca4:	ca97f8e3          	bgeu	a5,s1,c954 <__divdf3+0x3f8>
    cca8:	ffeb8b93          	add	s7,s7,-2
    ccac:	019787b3          	add	a5,a5,s9
    ccb0:	ca9ff06f          	j	c958 <__divdf3+0x3fc>
    ccb4:	c497f4e3          	bgeu	a5,s1,c8fc <__divdf3+0x3a0>
    ccb8:	ffe40413          	add	s0,s0,-2
    ccbc:	019787b3          	add	a5,a5,s9
    ccc0:	c41ff06f          	j	c900 <__divdf3+0x3a4>
    ccc4:	01f00693          	li	a3,31
    ccc8:	ece6dce3          	bge	a3,a4,cba0 <__divdf3+0x644>
    cccc:	fe100693          	li	a3,-31
    ccd0:	40f686b3          	sub	a3,a3,a5
    ccd4:	02000793          	li	a5,32
    ccd8:	00d456b3          	srl	a3,s0,a3
    ccdc:	00f70863          	beq	a4,a5,ccec <__divdf3+0x790>
    cce0:	43e98793          	add	a5,s3,1086
    cce4:	00f417b3          	sll	a5,s0,a5
    cce8:	00f86833          	or	a6,a6,a5
    ccec:	01003833          	snez	a6,a6
    ccf0:	00d86833          	or	a6,a6,a3
    ccf4:	00787713          	and	a4,a6,7
    ccf8:	00000693          	li	a3,0
    ccfc:	02070863          	beqz	a4,cd2c <__divdf3+0x7d0>
    cd00:	00f87793          	and	a5,a6,15
    cd04:	00400713          	li	a4,4
    cd08:	00000413          	li	s0,0
    cd0c:	00e78a63          	beq	a5,a4,cd20 <__divdf3+0x7c4>
    cd10:	00480793          	add	a5,a6,4
    cd14:	0107b833          	sltu	a6,a5,a6
    cd18:	01003433          	snez	s0,a6
    cd1c:	00078813          	mv	a6,a5
    cd20:	00941693          	sll	a3,s0,0x9
    cd24:	01d41713          	sll	a4,s0,0x1d
    cd28:	00c6d693          	srl	a3,a3,0xc
    cd2c:	00385813          	srl	a6,a6,0x3
    cd30:	00e86733          	or	a4,a6,a4
    cd34:	00000793          	li	a5,0
    cd38:	99dff06f          	j	c6d4 <__divdf3+0x178>
    cd3c:	00060813          	mv	a6,a2
    cd40:	e2e690e3          	bne	a3,a4,cb60 <__divdf3+0x604>
    cd44:	e1579ee3          	bne	a5,s5,cb60 <__divdf3+0x604>
    cd48:	02412c83          	lw	s9,36(sp)
    cd4c:	02012d03          	lw	s10,32(sp)
    cd50:	01c12d83          	lw	s11,28(sp)
    cd54:	a7dff06f          	j	c7d0 <__divdf3+0x274>
    cd58:	ec96f6e3          	bgeu	a3,s1,cc24 <__divdf3+0x6c8>
    cd5c:	00da86b3          	add	a3,s5,a3
    cd60:	0156b633          	sltu	a2,a3,s5
    cd64:	01960633          	add	a2,a2,s9
    cd68:	ffe40413          	add	s0,s0,-2
    cd6c:	00068d13          	mv	s10,a3
    cd70:	00cb8bb3          	add	s7,s7,a2
    cd74:	c81ff06f          	j	c9f4 <__divdf3+0x498>
    cd78:	c0200713          	li	a4,-1022
    cd7c:	02412c83          	lw	s9,36(sp)
    cd80:	02012d03          	lw	s10,32(sp)
    cd84:	01c12d83          	lw	s11,28(sp)
    cd88:	3ff98793          	add	a5,s3,1023
    cd8c:	fff00813          	li	a6,-1
    cd90:	e0e9c4e3          	blt	s3,a4,cb98 <__divdf3+0x63c>
    cd94:	00480713          	add	a4,a6,4
    cd98:	01073833          	sltu	a6,a4,a6
    cd9c:	01040433          	add	s0,s0,a6
    cda0:	00070813          	mv	a6,a4
    cda4:	a3dff06f          	j	c7e0 <__divdf3+0x284>
    cda8:	00f87713          	and	a4,a6,15
    cdac:	00400693          	li	a3,4
    cdb0:	a2d708e3          	beq	a4,a3,c7e0 <__divdf3+0x284>
    cdb4:	fe1ff06f          	j	cd94 <__divdf3+0x838>
    cdb8:	00d12623          	sw	a3,12(sp)
    cdbc:	cadff06f          	j	ca68 <__divdf3+0x50c>
    cdc0:	00078d13          	mv	s10,a5
    cdc4:	d05ff06f          	j	cac8 <__divdf3+0x56c>
    cdc8:	00090a13          	mv	s4,s2
    cdcc:	7ff00793          	li	a5,2047
    cdd0:	00000693          	li	a3,0
    cdd4:	00000713          	li	a4,0
    cdd8:	8fdff06f          	j	c6d4 <__divdf3+0x178>
    cddc:	001a9613          	sll	a2,s5,0x1
    cde0:	015636b3          	sltu	a3,a2,s5
    cde4:	019686b3          	add	a3,a3,s9
    cde8:	00d486b3          	add	a3,s1,a3
    cdec:	ffe80813          	add	a6,a6,-2
    cdf0:	00060a93          	mv	s5,a2
    cdf4:	f4e688e3          	beq	a3,a4,cd44 <__divdf3+0x7e8>
    cdf8:	d69ff06f          	j	cb60 <__divdf3+0x604>
    cdfc:	fefae0e3          	bltu	s5,a5,cddc <__divdf3+0x880>
    ce00:	00060813          	mv	a6,a2
    ce04:	f41ff06f          	j	cd44 <__divdf3+0x7e8>

0000ce08 <__eqdf2>:
    ce08:	0145d713          	srl	a4,a1,0x14
    ce0c:	001007b7          	lui	a5,0x100
    ce10:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    ce14:	0146d813          	srl	a6,a3,0x14
    ce18:	7ff77713          	and	a4,a4,2047
    ce1c:	7ff00313          	li	t1,2047
    ce20:	00b7fe33          	and	t3,a5,a1
    ce24:	00050893          	mv	a7,a0
    ce28:	00d7f7b3          	and	a5,a5,a3
    ce2c:	01f5d593          	srl	a1,a1,0x1f
    ce30:	7ff87813          	and	a6,a6,2047
    ce34:	01f6d693          	srl	a3,a3,0x1f
    ce38:	00100513          	li	a0,1
    ce3c:	00670c63          	beq	a4,t1,ce54 <__eqdf2+0x4c>
    ce40:	00680863          	beq	a6,t1,ce50 <__eqdf2+0x48>
    ce44:	01071463          	bne	a4,a6,ce4c <__eqdf2+0x44>
    ce48:	02fe0663          	beq	t3,a5,ce74 <__eqdf2+0x6c>
    ce4c:	00008067          	ret
    ce50:	00008067          	ret
    ce54:	fee81ce3          	bne	a6,a4,ce4c <__eqdf2+0x44>
    ce58:	00fe67b3          	or	a5,t3,a5
    ce5c:	00c7e7b3          	or	a5,a5,a2
    ce60:	0117e7b3          	or	a5,a5,a7
    ce64:	fe0794e3          	bnez	a5,ce4c <__eqdf2+0x44>
    ce68:	40d585b3          	sub	a1,a1,a3
    ce6c:	00b03533          	snez	a0,a1
    ce70:	00008067          	ret
    ce74:	fcc89ce3          	bne	a7,a2,ce4c <__eqdf2+0x44>
    ce78:	00d58a63          	beq	a1,a3,ce8c <__eqdf2+0x84>
    ce7c:	fc0718e3          	bnez	a4,ce4c <__eqdf2+0x44>
    ce80:	011e6e33          	or	t3,t3,a7
    ce84:	01c03533          	snez	a0,t3
    ce88:	00008067          	ret
    ce8c:	00000513          	li	a0,0
    ce90:	00008067          	ret

0000ce94 <__gedf2>:
    ce94:	0145d893          	srl	a7,a1,0x14
    ce98:	001007b7          	lui	a5,0x100
    ce9c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    cea0:	0146d713          	srl	a4,a3,0x14
    cea4:	7ff8f893          	and	a7,a7,2047
    cea8:	7ff00e13          	li	t3,2047
    ceac:	00b7f333          	and	t1,a5,a1
    ceb0:	00050813          	mv	a6,a0
    ceb4:	00050e93          	mv	t4,a0
    ceb8:	00d7f7b3          	and	a5,a5,a3
    cebc:	01f5d593          	srl	a1,a1,0x1f
    cec0:	00060f13          	mv	t5,a2
    cec4:	7ff77513          	and	a0,a4,2047
    cec8:	01f6d693          	srl	a3,a3,0x1f
    cecc:	05c88863          	beq	a7,t3,cf1c <__gedf2+0x88>
    ced0:	03c50463          	beq	a0,t3,cef8 <__gedf2+0x64>
    ced4:	06089a63          	bnez	a7,cf48 <__gedf2+0xb4>
    ced8:	01036833          	or	a6,t1,a6
    cedc:	06051063          	bnez	a0,cf3c <__gedf2+0xa8>
    cee0:	00c7e633          	or	a2,a5,a2
    cee4:	08060c63          	beqz	a2,cf7c <__gedf2+0xe8>
    cee8:	0a081263          	bnez	a6,cf8c <__gedf2+0xf8>
    ceec:	00100513          	li	a0,1
    cef0:	08068263          	beqz	a3,cf74 <__gedf2+0xe0>
    cef4:	00008067          	ret
    cef8:	00c7e633          	or	a2,a5,a2
    cefc:	08061463          	bnez	a2,cf84 <__gedf2+0xf0>
    cf00:	00089663          	bnez	a7,cf0c <__gedf2+0x78>
    cf04:	01036333          	or	t1,t1,a6
    cf08:	fe0302e3          	beqz	t1,ceec <__gedf2+0x58>
    cf0c:	06d58063          	beq	a1,a3,cf6c <__gedf2+0xd8>
    cf10:	06059263          	bnez	a1,cf74 <__gedf2+0xe0>
    cf14:	00100513          	li	a0,1
    cf18:	00008067          	ret
    cf1c:	01036333          	or	t1,t1,a6
    cf20:	06031263          	bnez	t1,cf84 <__gedf2+0xf0>
    cf24:	ff1516e3          	bne	a0,a7,cf10 <__gedf2+0x7c>
    cf28:	00c7e7b3          	or	a5,a5,a2
    cf2c:	04079c63          	bnez	a5,cf84 <__gedf2+0xf0>
    cf30:	fed590e3          	bne	a1,a3,cf10 <__gedf2+0x7c>
    cf34:	00000513          	li	a0,0
    cf38:	00008067          	ret
    cf3c:	fa0808e3          	beqz	a6,ceec <__gedf2+0x58>
    cf40:	fcd598e3          	bne	a1,a3,cf10 <__gedf2+0x7c>
    cf44:	0280006f          	j	cf6c <__gedf2+0xd8>
    cf48:	fc0504e3          	beqz	a0,cf10 <__gedf2+0x7c>
    cf4c:	fcd592e3          	bne	a1,a3,cf10 <__gedf2+0x7c>
    cf50:	fd1540e3          	blt	a0,a7,cf10 <__gedf2+0x7c>
    cf54:	00a8cc63          	blt	a7,a0,cf6c <__gedf2+0xd8>
    cf58:	fa67ece3          	bltu	a5,t1,cf10 <__gedf2+0x7c>
    cf5c:	00f31863          	bne	t1,a5,cf6c <__gedf2+0xd8>
    cf60:	fbdf68e3          	bltu	t5,t4,cf10 <__gedf2+0x7c>
    cf64:	00000513          	li	a0,0
    cf68:	f9eef6e3          	bgeu	t4,t5,cef4 <__gedf2+0x60>
    cf6c:	00100513          	li	a0,1
    cf70:	f80592e3          	bnez	a1,cef4 <__gedf2+0x60>
    cf74:	fff00513          	li	a0,-1
    cf78:	00008067          	ret
    cf7c:	f8081ae3          	bnez	a6,cf10 <__gedf2+0x7c>
    cf80:	00008067          	ret
    cf84:	ffe00513          	li	a0,-2
    cf88:	00008067          	ret
    cf8c:	fcd586e3          	beq	a1,a3,cf58 <__gedf2+0xc4>
    cf90:	f81ff06f          	j	cf10 <__gedf2+0x7c>

0000cf94 <__ledf2>:
    cf94:	0145d893          	srl	a7,a1,0x14
    cf98:	001007b7          	lui	a5,0x100
    cf9c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    cfa0:	0146d713          	srl	a4,a3,0x14
    cfa4:	7ff8f893          	and	a7,a7,2047
    cfa8:	7ff00313          	li	t1,2047
    cfac:	00b7fe33          	and	t3,a5,a1
    cfb0:	00050813          	mv	a6,a0
    cfb4:	00050e93          	mv	t4,a0
    cfb8:	00d7f7b3          	and	a5,a5,a3
    cfbc:	01f5d593          	srl	a1,a1,0x1f
    cfc0:	00060f13          	mv	t5,a2
    cfc4:	7ff77513          	and	a0,a4,2047
    cfc8:	01f6d693          	srl	a3,a3,0x1f
    cfcc:	04688a63          	beq	a7,t1,d020 <__ledf2+0x8c>
    cfd0:	02650463          	beq	a0,t1,cff8 <__ledf2+0x64>
    cfd4:	06089863          	bnez	a7,d044 <__ledf2+0xb0>
    cfd8:	010e6833          	or	a6,t3,a6
    cfdc:	08051e63          	bnez	a0,d078 <__ledf2+0xe4>
    cfe0:	00c7e633          	or	a2,a5,a2
    cfe4:	0a060463          	beqz	a2,d08c <__ledf2+0xf8>
    cfe8:	0a081663          	bnez	a6,d094 <__ledf2+0x100>
    cfec:	00100513          	li	a0,1
    cff0:	08068063          	beqz	a3,d070 <__ledf2+0xdc>
    cff4:	00008067          	ret
    cff8:	00c7e633          	or	a2,a5,a2
    cffc:	00200513          	li	a0,2
    d000:	fe061ae3          	bnez	a2,cff4 <__ledf2+0x60>
    d004:	00089663          	bnez	a7,d010 <__ledf2+0x7c>
    d008:	010e6e33          	or	t3,t3,a6
    d00c:	fe0e00e3          	beqz	t3,cfec <__ledf2+0x58>
    d010:	04d58c63          	beq	a1,a3,d068 <__ledf2+0xd4>
    d014:	04059e63          	bnez	a1,d070 <__ledf2+0xdc>
    d018:	00100513          	li	a0,1
    d01c:	00008067          	ret
    d020:	010e6e33          	or	t3,t3,a6
    d024:	060e1063          	bnez	t3,d084 <__ledf2+0xf0>
    d028:	ff1516e3          	bne	a0,a7,d014 <__ledf2+0x80>
    d02c:	00c7e7b3          	or	a5,a5,a2
    d030:	00200513          	li	a0,2
    d034:	fc0790e3          	bnez	a5,cff4 <__ledf2+0x60>
    d038:	fcd59ee3          	bne	a1,a3,d014 <__ledf2+0x80>
    d03c:	00000513          	li	a0,0
    d040:	00008067          	ret
    d044:	fc0508e3          	beqz	a0,d014 <__ledf2+0x80>
    d048:	fcd596e3          	bne	a1,a3,d014 <__ledf2+0x80>
    d04c:	fd1544e3          	blt	a0,a7,d014 <__ledf2+0x80>
    d050:	00a8cc63          	blt	a7,a0,d068 <__ledf2+0xd4>
    d054:	fdc7e0e3          	bltu	a5,t3,d014 <__ledf2+0x80>
    d058:	00fe1863          	bne	t3,a5,d068 <__ledf2+0xd4>
    d05c:	fbdf6ce3          	bltu	t5,t4,d014 <__ledf2+0x80>
    d060:	00000513          	li	a0,0
    d064:	f9eef8e3          	bgeu	t4,t5,cff4 <__ledf2+0x60>
    d068:	00100513          	li	a0,1
    d06c:	f80594e3          	bnez	a1,cff4 <__ledf2+0x60>
    d070:	fff00513          	li	a0,-1
    d074:	00008067          	ret
    d078:	f6080ae3          	beqz	a6,cfec <__ledf2+0x58>
    d07c:	f8d59ce3          	bne	a1,a3,d014 <__ledf2+0x80>
    d080:	fe9ff06f          	j	d068 <__ledf2+0xd4>
    d084:	00200513          	li	a0,2
    d088:	00008067          	ret
    d08c:	f80814e3          	bnez	a6,d014 <__ledf2+0x80>
    d090:	00008067          	ret
    d094:	fcd580e3          	beq	a1,a3,d054 <__ledf2+0xc0>
    d098:	f7dff06f          	j	d014 <__ledf2+0x80>

0000d09c <__muldf3>:
    d09c:	fd010113          	add	sp,sp,-48
    d0a0:	0145d793          	srl	a5,a1,0x14
    d0a4:	02812423          	sw	s0,40(sp)
    d0a8:	02912223          	sw	s1,36(sp)
    d0ac:	03212023          	sw	s2,32(sp)
    d0b0:	01312e23          	sw	s3,28(sp)
    d0b4:	01512a23          	sw	s5,20(sp)
    d0b8:	00c59493          	sll	s1,a1,0xc
    d0bc:	02112623          	sw	ra,44(sp)
    d0c0:	01412c23          	sw	s4,24(sp)
    d0c4:	01612823          	sw	s6,16(sp)
    d0c8:	01712623          	sw	s7,12(sp)
    d0cc:	01812423          	sw	s8,8(sp)
    d0d0:	7ff7f793          	and	a5,a5,2047
    d0d4:	00050413          	mv	s0,a0
    d0d8:	00060a93          	mv	s5,a2
    d0dc:	00068993          	mv	s3,a3
    d0e0:	00c4d493          	srl	s1,s1,0xc
    d0e4:	01f5d913          	srl	s2,a1,0x1f
    d0e8:	4e078063          	beqz	a5,d5c8 <__muldf3+0x52c>
    d0ec:	7ff00713          	li	a4,2047
    d0f0:	0ae78663          	beq	a5,a4,d19c <__muldf3+0x100>
    d0f4:	00349693          	sll	a3,s1,0x3
    d0f8:	01d55713          	srl	a4,a0,0x1d
    d0fc:	00d76733          	or	a4,a4,a3
    d100:	008006b7          	lui	a3,0x800
    d104:	00d764b3          	or	s1,a4,a3
    d108:	00351a13          	sll	s4,a0,0x3
    d10c:	c0178c13          	add	s8,a5,-1023
    d110:	00000b13          	li	s6,0
    d114:	00000b93          	li	s7,0
    d118:	0149d793          	srl	a5,s3,0x14
    d11c:	00c99713          	sll	a4,s3,0xc
    d120:	7ff7f793          	and	a5,a5,2047
    d124:	000a8e13          	mv	t3,s5
    d128:	00c75413          	srl	s0,a4,0xc
    d12c:	01f9d993          	srl	s3,s3,0x1f
    d130:	0a078063          	beqz	a5,d1d0 <__muldf3+0x134>
    d134:	7ff00713          	li	a4,2047
    d138:	14e78e63          	beq	a5,a4,d294 <__muldf3+0x1f8>
    d13c:	00341713          	sll	a4,s0,0x3
    d140:	01dad693          	srl	a3,s5,0x1d
    d144:	00e6e6b3          	or	a3,a3,a4
    d148:	c0178793          	add	a5,a5,-1023
    d14c:	00800737          	lui	a4,0x800
    d150:	00e6e433          	or	s0,a3,a4
    d154:	003a9e13          	sll	t3,s5,0x3
    d158:	01878333          	add	t1,a5,s8
    d15c:	00000693          	li	a3,0
    d160:	00a00793          	li	a5,10
    d164:	00130893          	add	a7,t1,1
    d168:	0b67cc63          	blt	a5,s6,d220 <__muldf3+0x184>
    d16c:	013945b3          	xor	a1,s2,s3
    d170:	00200793          	li	a5,2
    d174:	00058813          	mv	a6,a1
    d178:	1567c663          	blt	a5,s6,d2c4 <__muldf3+0x228>
    d17c:	fffb0b13          	add	s6,s6,-1
    d180:	00100713          	li	a4,1
    d184:	17676063          	bltu	a4,s6,d2e4 <__muldf3+0x248>
    d188:	48f68663          	beq	a3,a5,d614 <__muldf3+0x578>
    d18c:	00040493          	mv	s1,s0
    d190:	000e0a13          	mv	s4,t3
    d194:	00068b93          	mv	s7,a3
    d198:	09c0006f          	j	d234 <__muldf3+0x198>
    d19c:	00a4ea33          	or	s4,s1,a0
    d1a0:	480a1463          	bnez	s4,d628 <__muldf3+0x58c>
    d1a4:	0149d793          	srl	a5,s3,0x14
    d1a8:	00c99713          	sll	a4,s3,0xc
    d1ac:	7ff7f793          	and	a5,a5,2047
    d1b0:	00000493          	li	s1,0
    d1b4:	00800b13          	li	s6,8
    d1b8:	7ff00c13          	li	s8,2047
    d1bc:	00200b93          	li	s7,2
    d1c0:	000a8e13          	mv	t3,s5
    d1c4:	00c75413          	srl	s0,a4,0xc
    d1c8:	01f9d993          	srl	s3,s3,0x1f
    d1cc:	f60794e3          	bnez	a5,d134 <__muldf3+0x98>
    d1d0:	015467b3          	or	a5,s0,s5
    d1d4:	46078e63          	beqz	a5,d650 <__muldf3+0x5b4>
    d1d8:	54040c63          	beqz	s0,d730 <__muldf3+0x694>
    d1dc:	00040513          	mv	a0,s0
    d1e0:	6f4010ef          	jal	e8d4 <__clzsi2>
    d1e4:	00050313          	mv	t1,a0
    d1e8:	ff550713          	add	a4,a0,-11
    d1ec:	01d00793          	li	a5,29
    d1f0:	ff830e13          	add	t3,t1,-8
    d1f4:	40e787b3          	sub	a5,a5,a4
    d1f8:	00fad7b3          	srl	a5,s5,a5
    d1fc:	01c41733          	sll	a4,s0,t3
    d200:	00e7e433          	or	s0,a5,a4
    d204:	01ca9e33          	sll	t3,s5,t3
    d208:	406c0333          	sub	t1,s8,t1
    d20c:	c0d30313          	add	t1,t1,-1011
    d210:	00a00793          	li	a5,10
    d214:	00000693          	li	a3,0
    d218:	00130893          	add	a7,t1,1
    d21c:	f567d8e3          	bge	a5,s6,d16c <__muldf3+0xd0>
    d220:	00090593          	mv	a1,s2
    d224:	00200793          	li	a5,2
    d228:	3efb8663          	beq	s7,a5,d614 <__muldf3+0x578>
    d22c:	00300793          	li	a5,3
    d230:	54fb8863          	beq	s7,a5,d780 <__muldf3+0x6e4>
    d234:	00100793          	li	a5,1
    d238:	00058813          	mv	a6,a1
    d23c:	52fb9663          	bne	s7,a5,d768 <__muldf3+0x6cc>
    d240:	00000793          	li	a5,0
    d244:	00000693          	li	a3,0
    d248:	00000713          	li	a4,0
    d24c:	02c12083          	lw	ra,44(sp)
    d250:	02812403          	lw	s0,40(sp)
    d254:	01479793          	sll	a5,a5,0x14
    d258:	00d7e7b3          	or	a5,a5,a3
    d25c:	01f81813          	sll	a6,a6,0x1f
    d260:	0107e7b3          	or	a5,a5,a6
    d264:	02412483          	lw	s1,36(sp)
    d268:	02012903          	lw	s2,32(sp)
    d26c:	01c12983          	lw	s3,28(sp)
    d270:	01812a03          	lw	s4,24(sp)
    d274:	01412a83          	lw	s5,20(sp)
    d278:	01012b03          	lw	s6,16(sp)
    d27c:	00c12b83          	lw	s7,12(sp)
    d280:	00812c03          	lw	s8,8(sp)
    d284:	00070513          	mv	a0,a4
    d288:	00078593          	mv	a1,a5
    d28c:	03010113          	add	sp,sp,48
    d290:	00008067          	ret
    d294:	01546733          	or	a4,s0,s5
    d298:	7ffc0313          	add	t1,s8,2047
    d29c:	3c070663          	beqz	a4,d668 <__muldf3+0x5cc>
    d2a0:	00001737          	lui	a4,0x1
    d2a4:	01394833          	xor	a6,s2,s3
    d2a8:	80070713          	add	a4,a4,-2048 # 800 <_kill>
    d2ac:	003b6b13          	or	s6,s6,3
    d2b0:	00a00693          	li	a3,10
    d2b4:	00080593          	mv	a1,a6
    d2b8:	00ec08b3          	add	a7,s8,a4
    d2bc:	4366cc63          	blt	a3,s6,d6f4 <__muldf3+0x658>
    d2c0:	00300693          	li	a3,3
    d2c4:	00100613          	li	a2,1
    d2c8:	01661633          	sll	a2,a2,s6
    d2cc:	53067713          	and	a4,a2,1328
    d2d0:	f4071ae3          	bnez	a4,d224 <__muldf3+0x188>
    d2d4:	24067793          	and	a5,a2,576
    d2d8:	48079063          	bnez	a5,d758 <__muldf3+0x6bc>
    d2dc:	08867613          	and	a2,a2,136
    d2e0:	38061e63          	bnez	a2,d67c <__muldf3+0x5e0>
    d2e4:	00010fb7          	lui	t6,0x10
    d2e8:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    d2ec:	005a7f33          	and	t5,s4,t0
    d2f0:	005e72b3          	and	t0,t3,t0
    d2f4:	010a5a13          	srl	s4,s4,0x10
    d2f8:	010e5e13          	srl	t3,t3,0x10
    d2fc:	000f0513          	mv	a0,t5
    d300:	00028593          	mv	a1,t0
    d304:	460010ef          	jal	e764 <__mulsi3>
    d308:	00050713          	mv	a4,a0
    d30c:	000e0593          	mv	a1,t3
    d310:	000f0513          	mv	a0,t5
    d314:	450010ef          	jal	e764 <__mulsi3>
    d318:	00050793          	mv	a5,a0
    d31c:	00028593          	mv	a1,t0
    d320:	000a0513          	mv	a0,s4
    d324:	440010ef          	jal	e764 <__mulsi3>
    d328:	00050e93          	mv	t4,a0
    d32c:	000e0593          	mv	a1,t3
    d330:	000a0513          	mv	a0,s4
    d334:	430010ef          	jal	e764 <__mulsi3>
    d338:	01d786b3          	add	a3,a5,t4
    d33c:	01075393          	srl	t2,a4,0x10
    d340:	00d383b3          	add	t2,t2,a3
    d344:	00050793          	mv	a5,a0
    d348:	01d3f463          	bgeu	t2,t4,d350 <__muldf3+0x2b4>
    d34c:	01f507b3          	add	a5,a0,t6
    d350:	000109b7          	lui	s3,0x10
    d354:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    d358:	0123feb3          	and	t4,t2,s2
    d35c:	01277733          	and	a4,a4,s2
    d360:	010e9e93          	sll	t4,t4,0x10
    d364:	01247933          	and	s2,s0,s2
    d368:	0103d393          	srl	t2,t2,0x10
    d36c:	00ee8eb3          	add	t4,t4,a4
    d370:	01045413          	srl	s0,s0,0x10
    d374:	000f0513          	mv	a0,t5
    d378:	00090593          	mv	a1,s2
    d37c:	3e8010ef          	jal	e764 <__mulsi3>
    d380:	00050f93          	mv	t6,a0
    d384:	00040593          	mv	a1,s0
    d388:	000f0513          	mv	a0,t5
    d38c:	3d8010ef          	jal	e764 <__mulsi3>
    d390:	00050713          	mv	a4,a0
    d394:	00090593          	mv	a1,s2
    d398:	000a0513          	mv	a0,s4
    d39c:	3c8010ef          	jal	e764 <__mulsi3>
    d3a0:	00050f13          	mv	t5,a0
    d3a4:	00040593          	mv	a1,s0
    d3a8:	000a0513          	mv	a0,s4
    d3ac:	3b8010ef          	jal	e764 <__mulsi3>
    d3b0:	010fd693          	srl	a3,t6,0x10
    d3b4:	01e70733          	add	a4,a4,t5
    d3b8:	00e686b3          	add	a3,a3,a4
    d3bc:	01e6f463          	bgeu	a3,t5,d3c4 <__muldf3+0x328>
    d3c0:	01350533          	add	a0,a0,s3
    d3c4:	00010a37          	lui	s4,0x10
    d3c8:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    d3cc:	01e6f733          	and	a4,a3,t5
    d3d0:	01efffb3          	and	t6,t6,t5
    d3d4:	01071713          	sll	a4,a4,0x10
    d3d8:	01f70733          	add	a4,a4,t6
    d3dc:	01e4ff33          	and	t5,s1,t5
    d3e0:	0106d693          	srl	a3,a3,0x10
    d3e4:	00a68fb3          	add	t6,a3,a0
    d3e8:	00e383b3          	add	t2,t2,a4
    d3ec:	0104d493          	srl	s1,s1,0x10
    d3f0:	000f0513          	mv	a0,t5
    d3f4:	00028593          	mv	a1,t0
    d3f8:	36c010ef          	jal	e764 <__mulsi3>
    d3fc:	00050a93          	mv	s5,a0
    d400:	000e0593          	mv	a1,t3
    d404:	000f0513          	mv	a0,t5
    d408:	35c010ef          	jal	e764 <__mulsi3>
    d40c:	00050993          	mv	s3,a0
    d410:	00028593          	mv	a1,t0
    d414:	00048513          	mv	a0,s1
    d418:	34c010ef          	jal	e764 <__mulsi3>
    d41c:	00050293          	mv	t0,a0
    d420:	000e0593          	mv	a1,t3
    d424:	00048513          	mv	a0,s1
    d428:	33c010ef          	jal	e764 <__mulsi3>
    d42c:	010ad613          	srl	a2,s5,0x10
    d430:	005989b3          	add	s3,s3,t0
    d434:	01360633          	add	a2,a2,s3
    d438:	00567463          	bgeu	a2,t0,d440 <__muldf3+0x3a4>
    d43c:	01450533          	add	a0,a0,s4
    d440:	00010a37          	lui	s4,0x10
    d444:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    d448:	00d672b3          	and	t0,a2,a3
    d44c:	00dafab3          	and	s5,s5,a3
    d450:	01065613          	srl	a2,a2,0x10
    d454:	01029293          	sll	t0,t0,0x10
    d458:	00a60e33          	add	t3,a2,a0
    d45c:	015282b3          	add	t0,t0,s5
    d460:	000f0513          	mv	a0,t5
    d464:	00090593          	mv	a1,s2
    d468:	2fc010ef          	jal	e764 <__mulsi3>
    d46c:	00050993          	mv	s3,a0
    d470:	00040593          	mv	a1,s0
    d474:	000f0513          	mv	a0,t5
    d478:	2ec010ef          	jal	e764 <__mulsi3>
    d47c:	00050f13          	mv	t5,a0
    d480:	00090593          	mv	a1,s2
    d484:	00048513          	mv	a0,s1
    d488:	2dc010ef          	jal	e764 <__mulsi3>
    d48c:	00050913          	mv	s2,a0
    d490:	00040593          	mv	a1,s0
    d494:	00048513          	mv	a0,s1
    d498:	2cc010ef          	jal	e764 <__mulsi3>
    d49c:	012f06b3          	add	a3,t5,s2
    d4a0:	0109d593          	srl	a1,s3,0x10
    d4a4:	00d58433          	add	s0,a1,a3
    d4a8:	00050f13          	mv	t5,a0
    d4ac:	01247463          	bgeu	s0,s2,d4b4 <__muldf3+0x418>
    d4b0:	01450f33          	add	t5,a0,s4
    d4b4:	00010637          	lui	a2,0x10
    d4b8:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0xcaf>
    d4bc:	00c476b3          	and	a3,s0,a2
    d4c0:	00c9f9b3          	and	s3,s3,a2
    d4c4:	01069693          	sll	a3,a3,0x10
    d4c8:	007787b3          	add	a5,a5,t2
    d4cc:	013686b3          	add	a3,a3,s3
    d4d0:	01f685b3          	add	a1,a3,t6
    d4d4:	00e7b733          	sltu	a4,a5,a4
    d4d8:	00e58733          	add	a4,a1,a4
    d4dc:	005782b3          	add	t0,a5,t0
    d4e0:	01c70633          	add	a2,a4,t3
    d4e4:	00f2b7b3          	sltu	a5,t0,a5
    d4e8:	00f607b3          	add	a5,a2,a5
    d4ec:	00d5b6b3          	sltu	a3,a1,a3
    d4f0:	00b735b3          	sltu	a1,a4,a1
    d4f4:	00b6e6b3          	or	a3,a3,a1
    d4f8:	00e63733          	sltu	a4,a2,a4
    d4fc:	01045593          	srl	a1,s0,0x10
    d500:	00c7b633          	sltu	a2,a5,a2
    d504:	00b686b3          	add	a3,a3,a1
    d508:	00929a13          	sll	s4,t0,0x9
    d50c:	00c76733          	or	a4,a4,a2
    d510:	00d70733          	add	a4,a4,a3
    d514:	01da6a33          	or	s4,s4,t4
    d518:	01e70733          	add	a4,a4,t5
    d51c:	01403a33          	snez	s4,s4
    d520:	0172d293          	srl	t0,t0,0x17
    d524:	00971713          	sll	a4,a4,0x9
    d528:	0177d693          	srl	a3,a5,0x17
    d52c:	005a6a33          	or	s4,s4,t0
    d530:	00979793          	sll	a5,a5,0x9
    d534:	00fa6a33          	or	s4,s4,a5
    d538:	00771793          	sll	a5,a4,0x7
    d53c:	00d764b3          	or	s1,a4,a3
    d540:	0207d063          	bgez	a5,d560 <__muldf3+0x4c4>
    d544:	001a5793          	srl	a5,s4,0x1
    d548:	001a7a13          	and	s4,s4,1
    d54c:	01f49713          	sll	a4,s1,0x1f
    d550:	0147e7b3          	or	a5,a5,s4
    d554:	00e7ea33          	or	s4,a5,a4
    d558:	0014d493          	srl	s1,s1,0x1
    d55c:	00088313          	mv	t1,a7
    d560:	3ff30793          	add	a5,t1,1023
    d564:	12f05663          	blez	a5,d690 <__muldf3+0x5f4>
    d568:	007a7713          	and	a4,s4,7
    d56c:	02070063          	beqz	a4,d58c <__muldf3+0x4f0>
    d570:	00fa7713          	and	a4,s4,15
    d574:	00400693          	li	a3,4
    d578:	00d70a63          	beq	a4,a3,d58c <__muldf3+0x4f0>
    d57c:	004a0713          	add	a4,s4,4
    d580:	01473a33          	sltu	s4,a4,s4
    d584:	014484b3          	add	s1,s1,s4
    d588:	00070a13          	mv	s4,a4
    d58c:	00749713          	sll	a4,s1,0x7
    d590:	00075a63          	bgez	a4,d5a4 <__muldf3+0x508>
    d594:	ff0007b7          	lui	a5,0xff000
    d598:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    d59c:	00f4f4b3          	and	s1,s1,a5
    d5a0:	40030793          	add	a5,t1,1024
    d5a4:	7fe00713          	li	a4,2046
    d5a8:	1cf74463          	blt	a4,a5,d770 <__muldf3+0x6d4>
    d5ac:	003a5a13          	srl	s4,s4,0x3
    d5b0:	01d49713          	sll	a4,s1,0x1d
    d5b4:	00949693          	sll	a3,s1,0x9
    d5b8:	01476733          	or	a4,a4,s4
    d5bc:	00c6d693          	srl	a3,a3,0xc
    d5c0:	7ff7f793          	and	a5,a5,2047
    d5c4:	c89ff06f          	j	d24c <__muldf3+0x1b0>
    d5c8:	00a4ea33          	or	s4,s1,a0
    d5cc:	060a0863          	beqz	s4,d63c <__muldf3+0x5a0>
    d5d0:	12048e63          	beqz	s1,d70c <__muldf3+0x670>
    d5d4:	00048513          	mv	a0,s1
    d5d8:	2fc010ef          	jal	e8d4 <__clzsi2>
    d5dc:	00050713          	mv	a4,a0
    d5e0:	ff550693          	add	a3,a0,-11
    d5e4:	01d00793          	li	a5,29
    d5e8:	ff870a13          	add	s4,a4,-8
    d5ec:	40d787b3          	sub	a5,a5,a3
    d5f0:	00f457b3          	srl	a5,s0,a5
    d5f4:	014496b3          	sll	a3,s1,s4
    d5f8:	00d7e4b3          	or	s1,a5,a3
    d5fc:	01441a33          	sll	s4,s0,s4
    d600:	c0d00793          	li	a5,-1011
    d604:	40e78c33          	sub	s8,a5,a4
    d608:	00000b13          	li	s6,0
    d60c:	00000b93          	li	s7,0
    d610:	b09ff06f          	j	d118 <__muldf3+0x7c>
    d614:	00058813          	mv	a6,a1
    d618:	7ff00793          	li	a5,2047
    d61c:	00000693          	li	a3,0
    d620:	00000713          	li	a4,0
    d624:	c29ff06f          	j	d24c <__muldf3+0x1b0>
    d628:	00050a13          	mv	s4,a0
    d62c:	00c00b13          	li	s6,12
    d630:	7ff00c13          	li	s8,2047
    d634:	00300b93          	li	s7,3
    d638:	ae1ff06f          	j	d118 <__muldf3+0x7c>
    d63c:	00000493          	li	s1,0
    d640:	00400b13          	li	s6,4
    d644:	00000c13          	li	s8,0
    d648:	00100b93          	li	s7,1
    d64c:	acdff06f          	j	d118 <__muldf3+0x7c>
    d650:	001b6b13          	or	s6,s6,1
    d654:	000c0313          	mv	t1,s8
    d658:	00000413          	li	s0,0
    d65c:	00000e13          	li	t3,0
    d660:	00100693          	li	a3,1
    d664:	afdff06f          	j	d160 <__muldf3+0xc4>
    d668:	002b6b13          	or	s6,s6,2
    d66c:	00000413          	li	s0,0
    d670:	00000e13          	li	t3,0
    d674:	00200693          	li	a3,2
    d678:	ae9ff06f          	j	d160 <__muldf3+0xc4>
    d67c:	00040493          	mv	s1,s0
    d680:	000e0a13          	mv	s4,t3
    d684:	00068b93          	mv	s7,a3
    d688:	00098593          	mv	a1,s3
    d68c:	b99ff06f          	j	d224 <__muldf3+0x188>
    d690:	00100713          	li	a4,1
    d694:	10079063          	bnez	a5,d794 <__muldf3+0x6f8>
    d698:	41e30313          	add	t1,t1,1054
    d69c:	006a1633          	sll	a2,s4,t1
    d6a0:	00c03633          	snez	a2,a2
    d6a4:	00649333          	sll	t1,s1,t1
    d6a8:	00ea5a33          	srl	s4,s4,a4
    d6ac:	00666633          	or	a2,a2,t1
    d6b0:	01466633          	or	a2,a2,s4
    d6b4:	00767793          	and	a5,a2,7
    d6b8:	00e4d5b3          	srl	a1,s1,a4
    d6bc:	02078063          	beqz	a5,d6dc <__muldf3+0x640>
    d6c0:	00f67793          	and	a5,a2,15
    d6c4:	00400713          	li	a4,4
    d6c8:	00e78a63          	beq	a5,a4,d6dc <__muldf3+0x640>
    d6cc:	00460793          	add	a5,a2,4
    d6d0:	00c7b633          	sltu	a2,a5,a2
    d6d4:	00c585b3          	add	a1,a1,a2
    d6d8:	00078613          	mv	a2,a5
    d6dc:	00859513          	sll	a0,a1,0x8
    d6e0:	00100793          	li	a5,1
    d6e4:	00000693          	li	a3,0
    d6e8:	00000713          	li	a4,0
    d6ec:	b60540e3          	bltz	a0,d24c <__muldf3+0x1b0>
    d6f0:	10c0006f          	j	d7fc <__muldf3+0x760>
    d6f4:	00f00713          	li	a4,15
    d6f8:	12eb1063          	bne	s6,a4,d818 <__muldf3+0x77c>
    d6fc:	00000813          	li	a6,0
    d700:	000806b7          	lui	a3,0x80
    d704:	00000713          	li	a4,0
    d708:	b45ff06f          	j	d24c <__muldf3+0x1b0>
    d70c:	1c8010ef          	jal	e8d4 <__clzsi2>
    d710:	01550693          	add	a3,a0,21
    d714:	01c00793          	li	a5,28
    d718:	02050713          	add	a4,a0,32
    d71c:	ecd7d4e3          	bge	a5,a3,d5e4 <__muldf3+0x548>
    d720:	ff850513          	add	a0,a0,-8
    d724:	00000a13          	li	s4,0
    d728:	00a414b3          	sll	s1,s0,a0
    d72c:	ed5ff06f          	j	d600 <__muldf3+0x564>
    d730:	000a8513          	mv	a0,s5
    d734:	1a0010ef          	jal	e8d4 <__clzsi2>
    d738:	01550713          	add	a4,a0,21
    d73c:	01c00793          	li	a5,28
    d740:	02050313          	add	t1,a0,32
    d744:	aae7d4e3          	bge	a5,a4,d1ec <__muldf3+0x150>
    d748:	ff850513          	add	a0,a0,-8
    d74c:	00000e13          	li	t3,0
    d750:	00aa9433          	sll	s0,s5,a0
    d754:	ab5ff06f          	j	d208 <__muldf3+0x16c>
    d758:	00000813          	li	a6,0
    d75c:	7ff00793          	li	a5,2047
    d760:	000806b7          	lui	a3,0x80
    d764:	ae9ff06f          	j	d24c <__muldf3+0x1b0>
    d768:	00088313          	mv	t1,a7
    d76c:	df5ff06f          	j	d560 <__muldf3+0x4c4>
    d770:	7ff00793          	li	a5,2047
    d774:	00000693          	li	a3,0
    d778:	00000713          	li	a4,0
    d77c:	ad1ff06f          	j	d24c <__muldf3+0x1b0>
    d780:	00000813          	li	a6,0
    d784:	7ff00793          	li	a5,2047
    d788:	000806b7          	lui	a3,0x80
    d78c:	00000713          	li	a4,0
    d790:	abdff06f          	j	d24c <__muldf3+0x1b0>
    d794:	40f70733          	sub	a4,a4,a5
    d798:	03800693          	li	a3,56
    d79c:	aae6c2e3          	blt	a3,a4,d240 <__muldf3+0x1a4>
    d7a0:	01f00693          	li	a3,31
    d7a4:	eee6dae3          	bge	a3,a4,d698 <__muldf3+0x5fc>
    d7a8:	fe100693          	li	a3,-31
    d7ac:	40f687b3          	sub	a5,a3,a5
    d7b0:	02000693          	li	a3,32
    d7b4:	00f4d7b3          	srl	a5,s1,a5
    d7b8:	00d70863          	beq	a4,a3,d7c8 <__muldf3+0x72c>
    d7bc:	43e30313          	add	t1,t1,1086
    d7c0:	00649333          	sll	t1,s1,t1
    d7c4:	006a6a33          	or	s4,s4,t1
    d7c8:	01403633          	snez	a2,s4
    d7cc:	00f66633          	or	a2,a2,a5
    d7d0:	00767713          	and	a4,a2,7
    d7d4:	00000693          	li	a3,0
    d7d8:	02070863          	beqz	a4,d808 <__muldf3+0x76c>
    d7dc:	00f67793          	and	a5,a2,15
    d7e0:	00400713          	li	a4,4
    d7e4:	00000593          	li	a1,0
    d7e8:	00e78a63          	beq	a5,a4,d7fc <__muldf3+0x760>
    d7ec:	00460793          	add	a5,a2,4
    d7f0:	00c7b633          	sltu	a2,a5,a2
    d7f4:	00c035b3          	snez	a1,a2
    d7f8:	00078613          	mv	a2,a5
    d7fc:	00959693          	sll	a3,a1,0x9
    d800:	01d59713          	sll	a4,a1,0x1d
    d804:	00c6d693          	srl	a3,a3,0xc
    d808:	00365613          	srl	a2,a2,0x3
    d80c:	00e66733          	or	a4,a2,a4
    d810:	00000793          	li	a5,0
    d814:	a39ff06f          	j	d24c <__muldf3+0x1b0>
    d818:	00040493          	mv	s1,s0
    d81c:	000a8a13          	mv	s4,s5
    d820:	00300b93          	li	s7,3
    d824:	00098593          	mv	a1,s3
    d828:	9fdff06f          	j	d224 <__muldf3+0x188>

0000d82c <__subdf3>:
    d82c:	001007b7          	lui	a5,0x100
    d830:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d834:	fe010113          	add	sp,sp,-32
    d838:	00b7f8b3          	and	a7,a5,a1
    d83c:	00d7f833          	and	a6,a5,a3
    d840:	0146d793          	srl	a5,a3,0x14
    d844:	00389893          	sll	a7,a7,0x3
    d848:	00812c23          	sw	s0,24(sp)
    d84c:	01312623          	sw	s3,12(sp)
    d850:	01f5d413          	srl	s0,a1,0x1f
    d854:	0145d993          	srl	s3,a1,0x14
    d858:	01d55713          	srl	a4,a0,0x1d
    d85c:	00381813          	sll	a6,a6,0x3
    d860:	01d65593          	srl	a1,a2,0x1d
    d864:	00112e23          	sw	ra,28(sp)
    d868:	00912a23          	sw	s1,20(sp)
    d86c:	01212823          	sw	s2,16(sp)
    d870:	7ff7ff13          	and	t5,a5,2047
    d874:	7ff00313          	li	t1,2047
    d878:	01176733          	or	a4,a4,a7
    d87c:	7ff9f993          	and	s3,s3,2047
    d880:	00040e13          	mv	t3,s0
    d884:	00351893          	sll	a7,a0,0x3
    d888:	01f6d693          	srl	a3,a3,0x1f
    d88c:	0105e5b3          	or	a1,a1,a6
    d890:	00361e93          	sll	t4,a2,0x3
    d894:	206f0c63          	beq	t5,t1,daac <__subdf3+0x280>
    d898:	0016c693          	xor	a3,a3,1
    d89c:	41e987b3          	sub	a5,s3,t5
    d8a0:	16d40263          	beq	s0,a3,da04 <__subdf3+0x1d8>
    d8a4:	00f05ae3          	blez	a5,e0b8 <__subdf3+0x88c>
    d8a8:	240f0a63          	beqz	t5,dafc <__subdf3+0x2d0>
    d8ac:	3c698463          	beq	s3,t1,dc74 <__subdf3+0x448>
    d8b0:	03800693          	li	a3,56
    d8b4:	00100513          	li	a0,1
    d8b8:	02f6ce63          	blt	a3,a5,d8f4 <__subdf3+0xc8>
    d8bc:	008006b7          	lui	a3,0x800
    d8c0:	00d5e5b3          	or	a1,a1,a3
    d8c4:	01f00693          	li	a3,31
    d8c8:	4ef6c463          	blt	a3,a5,ddb0 <__subdf3+0x584>
    d8cc:	02000693          	li	a3,32
    d8d0:	40f686b3          	sub	a3,a3,a5
    d8d4:	00d59533          	sll	a0,a1,a3
    d8d8:	00fed633          	srl	a2,t4,a5
    d8dc:	00de96b3          	sll	a3,t4,a3
    d8e0:	00c56533          	or	a0,a0,a2
    d8e4:	00d036b3          	snez	a3,a3
    d8e8:	00f5d7b3          	srl	a5,a1,a5
    d8ec:	00d56533          	or	a0,a0,a3
    d8f0:	40f70733          	sub	a4,a4,a5
    d8f4:	40a88533          	sub	a0,a7,a0
    d8f8:	00a8b633          	sltu	a2,a7,a0
    d8fc:	00050493          	mv	s1,a0
    d900:	40c70933          	sub	s2,a4,a2
    d904:	00891793          	sll	a5,s2,0x8
    d908:	3407d863          	bgez	a5,dc58 <__subdf3+0x42c>
    d90c:	008007b7          	lui	a5,0x800
    d910:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    d914:	00f97933          	and	s2,s2,a5
    d918:	2e090663          	beqz	s2,dc04 <__subdf3+0x3d8>
    d91c:	00090513          	mv	a0,s2
    d920:	7b5000ef          	jal	e8d4 <__clzsi2>
    d924:	ff850793          	add	a5,a0,-8
    d928:	02000693          	li	a3,32
    d92c:	40f68733          	sub	a4,a3,a5
    d930:	00e4d733          	srl	a4,s1,a4
    d934:	00f91933          	sll	s2,s2,a5
    d938:	01276733          	or	a4,a4,s2
    d93c:	00f494b3          	sll	s1,s1,a5
    d940:	3f37c463          	blt	a5,s3,dd28 <__subdf3+0x4fc>
    d944:	413787b3          	sub	a5,a5,s3
    d948:	00178793          	add	a5,a5,1
    d94c:	40f686b3          	sub	a3,a3,a5
    d950:	00d49633          	sll	a2,s1,a3
    d954:	00f4d933          	srl	s2,s1,a5
    d958:	00c03633          	snez	a2,a2
    d95c:	00c96633          	or	a2,s2,a2
    d960:	00d716b3          	sll	a3,a4,a3
    d964:	00c6e4b3          	or	s1,a3,a2
    d968:	00f75933          	srl	s2,a4,a5
    d96c:	00000993          	li	s3,0
    d970:	0074f793          	and	a5,s1,7
    d974:	02078063          	beqz	a5,d994 <__subdf3+0x168>
    d978:	00f4f793          	and	a5,s1,15
    d97c:	00400713          	li	a4,4
    d980:	00e78a63          	beq	a5,a4,d994 <__subdf3+0x168>
    d984:	00448793          	add	a5,s1,4
    d988:	0097b533          	sltu	a0,a5,s1
    d98c:	00a90933          	add	s2,s2,a0
    d990:	00078493          	mv	s1,a5
    d994:	00891793          	sll	a5,s2,0x8
    d998:	6c07d063          	bgez	a5,e058 <__subdf3+0x82c>
    d99c:	00198793          	add	a5,s3,1
    d9a0:	7ff00713          	li	a4,2047
    d9a4:	24e78663          	beq	a5,a4,dbf0 <__subdf3+0x3c4>
    d9a8:	ff800737          	lui	a4,0xff800
    d9ac:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    d9b0:	00e97733          	and	a4,s2,a4
    d9b4:	7ff7f793          	and	a5,a5,2047
    d9b8:	01d71813          	sll	a6,a4,0x1d
    d9bc:	0034d513          	srl	a0,s1,0x3
    d9c0:	00971713          	sll	a4,a4,0x9
    d9c4:	00a86833          	or	a6,a6,a0
    d9c8:	00c75713          	srl	a4,a4,0xc
    d9cc:	00147e13          	and	t3,s0,1
    d9d0:	01c12083          	lw	ra,28(sp)
    d9d4:	01812403          	lw	s0,24(sp)
    d9d8:	01479793          	sll	a5,a5,0x14
    d9dc:	00e7e7b3          	or	a5,a5,a4
    d9e0:	01fe1713          	sll	a4,t3,0x1f
    d9e4:	00e7e7b3          	or	a5,a5,a4
    d9e8:	01412483          	lw	s1,20(sp)
    d9ec:	01012903          	lw	s2,16(sp)
    d9f0:	00c12983          	lw	s3,12(sp)
    d9f4:	00080513          	mv	a0,a6
    d9f8:	00078593          	mv	a1,a5
    d9fc:	02010113          	add	sp,sp,32
    da00:	00008067          	ret
    da04:	70f05263          	blez	a5,e108 <__subdf3+0x8dc>
    da08:	1c0f1663          	bnez	t5,dbd4 <__subdf3+0x3a8>
    da0c:	01d5e6b3          	or	a3,a1,t4
    da10:	26068e63          	beqz	a3,dc8c <__subdf3+0x460>
    da14:	fff78693          	add	a3,a5,-1
    da18:	46068863          	beqz	a3,de88 <__subdf3+0x65c>
    da1c:	24678c63          	beq	a5,t1,dc74 <__subdf3+0x448>
    da20:	03800793          	li	a5,56
    da24:	00100913          	li	s2,1
    da28:	02d7cc63          	blt	a5,a3,da60 <__subdf3+0x234>
    da2c:	00068793          	mv	a5,a3
    da30:	01f00693          	li	a3,31
    da34:	48f6ca63          	blt	a3,a5,dec8 <__subdf3+0x69c>
    da38:	02000693          	li	a3,32
    da3c:	40f686b3          	sub	a3,a3,a5
    da40:	00d59933          	sll	s2,a1,a3
    da44:	00fed633          	srl	a2,t4,a5
    da48:	00de96b3          	sll	a3,t4,a3
    da4c:	00c96933          	or	s2,s2,a2
    da50:	00d036b3          	snez	a3,a3
    da54:	00f5d7b3          	srl	a5,a1,a5
    da58:	00d96933          	or	s2,s2,a3
    da5c:	00f70733          	add	a4,a4,a5
    da60:	01190633          	add	a2,s2,a7
    da64:	01263933          	sltu	s2,a2,s2
    da68:	00060493          	mv	s1,a2
    da6c:	00e90933          	add	s2,s2,a4
    da70:	00891793          	sll	a5,s2,0x8
    da74:	1e07d263          	bgez	a5,dc58 <__subdf3+0x42c>
    da78:	00198993          	add	s3,s3,1
    da7c:	7ff00793          	li	a5,2047
    da80:	16f98863          	beq	s3,a5,dbf0 <__subdf3+0x3c4>
    da84:	ff8007b7          	lui	a5,0xff800
    da88:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    da8c:	0014f513          	and	a0,s1,1
    da90:	00f977b3          	and	a5,s2,a5
    da94:	0014d713          	srl	a4,s1,0x1
    da98:	00a76733          	or	a4,a4,a0
    da9c:	01f79513          	sll	a0,a5,0x1f
    daa0:	00e564b3          	or	s1,a0,a4
    daa4:	0017d913          	srl	s2,a5,0x1
    daa8:	ec9ff06f          	j	d970 <__subdf3+0x144>
    daac:	01d5e833          	or	a6,a1,t4
    dab0:	80198313          	add	t1,s3,-2047
    dab4:	06080863          	beqz	a6,db24 <__subdf3+0x2f8>
    dab8:	06d40a63          	beq	s0,a3,db2c <__subdf3+0x300>
    dabc:	0e030463          	beqz	t1,dba4 <__subdf3+0x378>
    dac0:	26098e63          	beqz	s3,dd3c <__subdf3+0x510>
    dac4:	00361513          	sll	a0,a2,0x3
    dac8:	00355513          	srl	a0,a0,0x3
    dacc:	00068413          	mv	s0,a3
    dad0:	00058713          	mv	a4,a1
    dad4:	01d71813          	sll	a6,a4,0x1d
    dad8:	00a86833          	or	a6,a6,a0
    dadc:	00375713          	srl	a4,a4,0x3
    dae0:	01076733          	or	a4,a4,a6
    dae4:	10070663          	beqz	a4,dbf0 <__subdf3+0x3c4>
    dae8:	00000e13          	li	t3,0
    daec:	7ff00793          	li	a5,2047
    daf0:	00080737          	lui	a4,0x80
    daf4:	00000813          	li	a6,0
    daf8:	ed9ff06f          	j	d9d0 <__subdf3+0x1a4>
    dafc:	01d5e6b3          	or	a3,a1,t4
    db00:	18068663          	beqz	a3,dc8c <__subdf3+0x460>
    db04:	fff78693          	add	a3,a5,-1
    db08:	3a068263          	beqz	a3,deac <__subdf3+0x680>
    db0c:	16678463          	beq	a5,t1,dc74 <__subdf3+0x448>
    db10:	03800793          	li	a5,56
    db14:	00100513          	li	a0,1
    db18:	dcd7cee3          	blt	a5,a3,d8f4 <__subdf3+0xc8>
    db1c:	00068793          	mv	a5,a3
    db20:	da5ff06f          	j	d8c4 <__subdf3+0x98>
    db24:	0016c693          	xor	a3,a3,1
    db28:	f8d41ae3          	bne	s0,a3,dabc <__subdf3+0x290>
    db2c:	18030863          	beqz	t1,dcbc <__subdf3+0x490>
    db30:	2c099063          	bnez	s3,ddf0 <__subdf3+0x5c4>
    db34:	7ff00793          	li	a5,2047
    db38:	011766b3          	or	a3,a4,a7
    db3c:	48068863          	beqz	a3,dfcc <__subdf3+0x7a0>
    db40:	fff78693          	add	a3,a5,-1
    db44:	34068263          	beqz	a3,de88 <__subdf3+0x65c>
    db48:	7ff00513          	li	a0,2047
    db4c:	2aa78263          	beq	a5,a0,ddf0 <__subdf3+0x5c4>
    db50:	03800793          	li	a5,56
    db54:	00100913          	li	s2,1
    db58:	02d7ca63          	blt	a5,a3,db8c <__subdf3+0x360>
    db5c:	01f00793          	li	a5,31
    db60:	4cd7c663          	blt	a5,a3,e02c <__subdf3+0x800>
    db64:	02000793          	li	a5,32
    db68:	40d787b3          	sub	a5,a5,a3
    db6c:	00f71933          	sll	s2,a4,a5
    db70:	00d8d633          	srl	a2,a7,a3
    db74:	00f897b3          	sll	a5,a7,a5
    db78:	00c96933          	or	s2,s2,a2
    db7c:	00f037b3          	snez	a5,a5
    db80:	00d756b3          	srl	a3,a4,a3
    db84:	00f96933          	or	s2,s2,a5
    db88:	00d585b3          	add	a1,a1,a3
    db8c:	01d90733          	add	a4,s2,t4
    db90:	01273933          	sltu	s2,a4,s2
    db94:	00070493          	mv	s1,a4
    db98:	00b90933          	add	s2,s2,a1
    db9c:	000f0993          	mv	s3,t5
    dba0:	ed1ff06f          	j	da70 <__subdf3+0x244>
    dba4:	00198793          	add	a5,s3,1
    dba8:	7fe7f793          	and	a5,a5,2046
    dbac:	14079463          	bnez	a5,dcf4 <__subdf3+0x4c8>
    dbb0:	01d5e833          	or	a6,a1,t4
    dbb4:	011767b3          	or	a5,a4,a7
    dbb8:	2a099463          	bnez	s3,de60 <__subdf3+0x634>
    dbbc:	38078e63          	beqz	a5,df58 <__subdf3+0x72c>
    dbc0:	3c081063          	bnez	a6,df80 <__subdf3+0x754>
    dbc4:	00351513          	sll	a0,a0,0x3
    dbc8:	00355913          	srl	s2,a0,0x3
    dbcc:	00000793          	li	a5,0
    dbd0:	1140006f          	j	dce4 <__subdf3+0x4b8>
    dbd4:	0a698063          	beq	s3,t1,dc74 <__subdf3+0x448>
    dbd8:	03800693          	li	a3,56
    dbdc:	00100913          	li	s2,1
    dbe0:	e8f6c0e3          	blt	a3,a5,da60 <__subdf3+0x234>
    dbe4:	008006b7          	lui	a3,0x800
    dbe8:	00d5e5b3          	or	a1,a1,a3
    dbec:	e45ff06f          	j	da30 <__subdf3+0x204>
    dbf0:	00147e13          	and	t3,s0,1
    dbf4:	7ff00793          	li	a5,2047
    dbf8:	00000713          	li	a4,0
    dbfc:	00000813          	li	a6,0
    dc00:	dd1ff06f          	j	d9d0 <__subdf3+0x1a4>
    dc04:	00048513          	mv	a0,s1
    dc08:	4cd000ef          	jal	e8d4 <__clzsi2>
    dc0c:	01850793          	add	a5,a0,24
    dc10:	01f00693          	li	a3,31
    dc14:	d0f6dae3          	bge	a3,a5,d928 <__subdf3+0xfc>
    dc18:	ff850713          	add	a4,a0,-8
    dc1c:	00e49733          	sll	a4,s1,a4
    dc20:	1b37ce63          	blt	a5,s3,dddc <__subdf3+0x5b0>
    dc24:	413789b3          	sub	s3,a5,s3
    dc28:	00198793          	add	a5,s3,1
    dc2c:	42f6de63          	bge	a3,a5,e068 <__subdf3+0x83c>
    dc30:	fe198993          	add	s3,s3,-31
    dc34:	02000693          	li	a3,32
    dc38:	013754b3          	srl	s1,a4,s3
    dc3c:	00d78c63          	beq	a5,a3,dc54 <__subdf3+0x428>
    dc40:	04000693          	li	a3,64
    dc44:	40f687b3          	sub	a5,a3,a5
    dc48:	00f71733          	sll	a4,a4,a5
    dc4c:	00e03733          	snez	a4,a4
    dc50:	00e4e4b3          	or	s1,s1,a4
    dc54:	00000993          	li	s3,0
    dc58:	0074f793          	and	a5,s1,7
    dc5c:	d0079ee3          	bnez	a5,d978 <__subdf3+0x14c>
    dc60:	00098793          	mv	a5,s3
    dc64:	0034d513          	srl	a0,s1,0x3
    dc68:	00090713          	mv	a4,s2
    dc6c:	0280006f          	j	dc94 <__subdf3+0x468>
    dc70:	e6081ce3          	bnez	a6,dae8 <__subdf3+0x2bc>
    dc74:	00351513          	sll	a0,a0,0x3
    dc78:	01d71813          	sll	a6,a4,0x1d
    dc7c:	00355513          	srl	a0,a0,0x3
    dc80:	00a86833          	or	a6,a6,a0
    dc84:	00375713          	srl	a4,a4,0x3
    dc88:	e59ff06f          	j	dae0 <__subdf3+0x2b4>
    dc8c:	00351513          	sll	a0,a0,0x3
    dc90:	00355513          	srl	a0,a0,0x3
    dc94:	01d71813          	sll	a6,a4,0x1d
    dc98:	7ff00693          	li	a3,2047
    dc9c:	00a86833          	or	a6,a6,a0
    dca0:	00375713          	srl	a4,a4,0x3
    dca4:	e2d78ee3          	beq	a5,a3,dae0 <__subdf3+0x2b4>
    dca8:	00c71713          	sll	a4,a4,0xc
    dcac:	00c75713          	srl	a4,a4,0xc
    dcb0:	7ff7f793          	and	a5,a5,2047
    dcb4:	00147e13          	and	t3,s0,1
    dcb8:	d19ff06f          	j	d9d0 <__subdf3+0x1a4>
    dcbc:	00198693          	add	a3,s3,1
    dcc0:	7fe6f793          	and	a5,a3,2046
    dcc4:	12079e63          	bnez	a5,de00 <__subdf3+0x5d4>
    dcc8:	011767b3          	or	a5,a4,a7
    dccc:	24099a63          	bnez	s3,df20 <__subdf3+0x6f4>
    dcd0:	30078663          	beqz	a5,dfdc <__subdf3+0x7b0>
    dcd4:	01d5e7b3          	or	a5,a1,t4
    dcd8:	30079a63          	bnez	a5,dfec <__subdf3+0x7c0>
    dcdc:	00351513          	sll	a0,a0,0x3
    dce0:	00355913          	srl	s2,a0,0x3
    dce4:	01d71813          	sll	a6,a4,0x1d
    dce8:	01286833          	or	a6,a6,s2
    dcec:	00375713          	srl	a4,a4,0x3
    dcf0:	fb9ff06f          	j	dca8 <__subdf3+0x47c>
    dcf4:	41d88833          	sub	a6,a7,t4
    dcf8:	0108b7b3          	sltu	a5,a7,a6
    dcfc:	40b70933          	sub	s2,a4,a1
    dd00:	40f90933          	sub	s2,s2,a5
    dd04:	00891793          	sll	a5,s2,0x8
    dd08:	00080493          	mv	s1,a6
    dd0c:	1207c263          	bltz	a5,de30 <__subdf3+0x604>
    dd10:	01286833          	or	a6,a6,s2
    dd14:	c00812e3          	bnez	a6,d918 <__subdf3+0xec>
    dd18:	00000e13          	li	t3,0
    dd1c:	00000793          	li	a5,0
    dd20:	00000713          	li	a4,0
    dd24:	cadff06f          	j	d9d0 <__subdf3+0x1a4>
    dd28:	ff800937          	lui	s2,0xff800
    dd2c:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dd30:	40f989b3          	sub	s3,s3,a5
    dd34:	01277933          	and	s2,a4,s2
    dd38:	c39ff06f          	j	d970 <__subdf3+0x144>
    dd3c:	7ff00793          	li	a5,2047
    dd40:	01176533          	or	a0,a4,a7
    dd44:	10050463          	beqz	a0,de4c <__subdf3+0x620>
    dd48:	fff78813          	add	a6,a5,-1
    dd4c:	1e080263          	beqz	a6,df30 <__subdf3+0x704>
    dd50:	7ff00513          	li	a0,2047
    dd54:	d6a788e3          	beq	a5,a0,dac4 <__subdf3+0x298>
    dd58:	03800793          	li	a5,56
    dd5c:	00068413          	mv	s0,a3
    dd60:	00100513          	li	a0,1
    dd64:	0307ca63          	blt	a5,a6,dd98 <__subdf3+0x56c>
    dd68:	01f00793          	li	a5,31
    dd6c:	1907c463          	blt	a5,a6,def4 <__subdf3+0x6c8>
    dd70:	02000793          	li	a5,32
    dd74:	410787b3          	sub	a5,a5,a6
    dd78:	00f71533          	sll	a0,a4,a5
    dd7c:	0108d6b3          	srl	a3,a7,a6
    dd80:	00f897b3          	sll	a5,a7,a5
    dd84:	00d56533          	or	a0,a0,a3
    dd88:	00f037b3          	snez	a5,a5
    dd8c:	01075833          	srl	a6,a4,a6
    dd90:	00f56533          	or	a0,a0,a5
    dd94:	410585b3          	sub	a1,a1,a6
    dd98:	40ae8533          	sub	a0,t4,a0
    dd9c:	00aeb733          	sltu	a4,t4,a0
    dda0:	00050493          	mv	s1,a0
    dda4:	40e58933          	sub	s2,a1,a4
    dda8:	000f0993          	mv	s3,t5
    ddac:	b59ff06f          	j	d904 <__subdf3+0xd8>
    ddb0:	fe078693          	add	a3,a5,-32
    ddb4:	02000613          	li	a2,32
    ddb8:	00d5d6b3          	srl	a3,a1,a3
    ddbc:	00c78a63          	beq	a5,a2,ddd0 <__subdf3+0x5a4>
    ddc0:	04000613          	li	a2,64
    ddc4:	40f607b3          	sub	a5,a2,a5
    ddc8:	00f597b3          	sll	a5,a1,a5
    ddcc:	00feeeb3          	or	t4,t4,a5
    ddd0:	01d03533          	snez	a0,t4
    ddd4:	00d56533          	or	a0,a0,a3
    ddd8:	b1dff06f          	j	d8f4 <__subdf3+0xc8>
    dddc:	ff8006b7          	lui	a3,0xff800
    dde0:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dde4:	40f987b3          	sub	a5,s3,a5
    dde8:	00d77733          	and	a4,a4,a3
    ddec:	ef9ff06f          	j	dce4 <__subdf3+0x4b8>
    ddf0:	00361513          	sll	a0,a2,0x3
    ddf4:	00355513          	srl	a0,a0,0x3
    ddf8:	00058713          	mv	a4,a1
    ddfc:	cd9ff06f          	j	dad4 <__subdf3+0x2a8>
    de00:	7ff00793          	li	a5,2047
    de04:	def686e3          	beq	a3,a5,dbf0 <__subdf3+0x3c4>
    de08:	01d88eb3          	add	t4,a7,t4
    de0c:	011eb633          	sltu	a2,t4,a7
    de10:	00b707b3          	add	a5,a4,a1
    de14:	00c787b3          	add	a5,a5,a2
    de18:	01f79513          	sll	a0,a5,0x1f
    de1c:	001ede93          	srl	t4,t4,0x1
    de20:	01d564b3          	or	s1,a0,t4
    de24:	0017d913          	srl	s2,a5,0x1
    de28:	00068993          	mv	s3,a3
    de2c:	b45ff06f          	j	d970 <__subdf3+0x144>
    de30:	411e8633          	sub	a2,t4,a7
    de34:	40e587b3          	sub	a5,a1,a4
    de38:	00ceb733          	sltu	a4,t4,a2
    de3c:	00060493          	mv	s1,a2
    de40:	40e78933          	sub	s2,a5,a4
    de44:	00068413          	mv	s0,a3
    de48:	ad1ff06f          	j	d918 <__subdf3+0xec>
    de4c:	00361613          	sll	a2,a2,0x3
    de50:	00365513          	srl	a0,a2,0x3
    de54:	00068413          	mv	s0,a3
    de58:	00058713          	mv	a4,a1
    de5c:	e39ff06f          	j	dc94 <__subdf3+0x468>
    de60:	e00798e3          	bnez	a5,dc70 <__subdf3+0x444>
    de64:	22080663          	beqz	a6,e090 <__subdf3+0x864>
    de68:	0035d713          	srl	a4,a1,0x3
    de6c:	00361613          	sll	a2,a2,0x3
    de70:	01d59593          	sll	a1,a1,0x1d
    de74:	00b76733          	or	a4,a4,a1
    de78:	00365613          	srl	a2,a2,0x3
    de7c:	00c76733          	or	a4,a4,a2
    de80:	00068413          	mv	s0,a3
    de84:	c61ff06f          	j	dae4 <__subdf3+0x2b8>
    de88:	01d88eb3          	add	t4,a7,t4
    de8c:	00b705b3          	add	a1,a4,a1
    de90:	011eb633          	sltu	a2,t4,a7
    de94:	00c58933          	add	s2,a1,a2
    de98:	00891793          	sll	a5,s2,0x8
    de9c:	000e8493          	mv	s1,t4
    dea0:	0a07d863          	bgez	a5,df50 <__subdf3+0x724>
    dea4:	00200993          	li	s3,2
    dea8:	bddff06f          	j	da84 <__subdf3+0x258>
    deac:	41d88eb3          	sub	t4,a7,t4
    deb0:	40b705b3          	sub	a1,a4,a1
    deb4:	01d8b633          	sltu	a2,a7,t4
    deb8:	000e8493          	mv	s1,t4
    debc:	40c58933          	sub	s2,a1,a2
    dec0:	00100993          	li	s3,1
    dec4:	a41ff06f          	j	d904 <__subdf3+0xd8>
    dec8:	fe078693          	add	a3,a5,-32
    decc:	02000613          	li	a2,32
    ded0:	00d5d6b3          	srl	a3,a1,a3
    ded4:	00c78a63          	beq	a5,a2,dee8 <__subdf3+0x6bc>
    ded8:	04000613          	li	a2,64
    dedc:	40f607b3          	sub	a5,a2,a5
    dee0:	00f597b3          	sll	a5,a1,a5
    dee4:	00feeeb3          	or	t4,t4,a5
    dee8:	01d03933          	snez	s2,t4
    deec:	00d96933          	or	s2,s2,a3
    def0:	b71ff06f          	j	da60 <__subdf3+0x234>
    def4:	fe080793          	add	a5,a6,-32
    def8:	02000693          	li	a3,32
    defc:	00f757b3          	srl	a5,a4,a5
    df00:	00d80a63          	beq	a6,a3,df14 <__subdf3+0x6e8>
    df04:	04000693          	li	a3,64
    df08:	410686b3          	sub	a3,a3,a6
    df0c:	00d71733          	sll	a4,a4,a3
    df10:	00e8e8b3          	or	a7,a7,a4
    df14:	01103533          	snez	a0,a7
    df18:	00f56533          	or	a0,a0,a5
    df1c:	e7dff06f          	j	dd98 <__subdf3+0x56c>
    df20:	ec0788e3          	beqz	a5,ddf0 <__subdf3+0x5c4>
    df24:	01d5eeb3          	or	t4,a1,t4
    df28:	bc0e90e3          	bnez	t4,dae8 <__subdf3+0x2bc>
    df2c:	d49ff06f          	j	dc74 <__subdf3+0x448>
    df30:	411e8633          	sub	a2,t4,a7
    df34:	40e585b3          	sub	a1,a1,a4
    df38:	00ceb733          	sltu	a4,t4,a2
    df3c:	00060493          	mv	s1,a2
    df40:	40e58933          	sub	s2,a1,a4
    df44:	00068413          	mv	s0,a3
    df48:	00100993          	li	s3,1
    df4c:	9b9ff06f          	j	d904 <__subdf3+0xd8>
    df50:	00100793          	li	a5,1
    df54:	d11ff06f          	j	dc64 <__subdf3+0x438>
    df58:	dc0800e3          	beqz	a6,dd18 <__subdf3+0x4ec>
    df5c:	00361613          	sll	a2,a2,0x3
    df60:	00365793          	srl	a5,a2,0x3
    df64:	01d59813          	sll	a6,a1,0x1d
    df68:	00959713          	sll	a4,a1,0x9
    df6c:	00f86833          	or	a6,a6,a5
    df70:	00c75713          	srl	a4,a4,0xc
    df74:	00068e13          	mv	t3,a3
    df78:	00000793          	li	a5,0
    df7c:	a55ff06f          	j	d9d0 <__subdf3+0x1a4>
    df80:	41d88933          	sub	s2,a7,t4
    df84:	0128b7b3          	sltu	a5,a7,s2
    df88:	40b70633          	sub	a2,a4,a1
    df8c:	40f60633          	sub	a2,a2,a5
    df90:	00861793          	sll	a5,a2,0x8
    df94:	0e07d263          	bgez	a5,e078 <__subdf3+0x84c>
    df98:	411e8633          	sub	a2,t4,a7
    df9c:	40e58733          	sub	a4,a1,a4
    dfa0:	00cebeb3          	sltu	t4,t4,a2
    dfa4:	41d70733          	sub	a4,a4,t4
    dfa8:	00871793          	sll	a5,a4,0x8
    dfac:	00060493          	mv	s1,a2
    dfb0:	1207de63          	bgez	a5,e0ec <__subdf3+0x8c0>
    dfb4:	ff8007b7          	lui	a5,0xff800
    dfb8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dfbc:	00f77733          	and	a4,a4,a5
    dfc0:	00068413          	mv	s0,a3
    dfc4:	00100793          	li	a5,1
    dfc8:	9f1ff06f          	j	d9b8 <__subdf3+0x18c>
    dfcc:	00361613          	sll	a2,a2,0x3
    dfd0:	00365513          	srl	a0,a2,0x3
    dfd4:	00058713          	mv	a4,a1
    dfd8:	cbdff06f          	j	dc94 <__subdf3+0x468>
    dfdc:	00361613          	sll	a2,a2,0x3
    dfe0:	00365913          	srl	s2,a2,0x3
    dfe4:	00058713          	mv	a4,a1
    dfe8:	cfdff06f          	j	dce4 <__subdf3+0x4b8>
    dfec:	01d886b3          	add	a3,a7,t4
    dff0:	00b707b3          	add	a5,a4,a1
    dff4:	0116b633          	sltu	a2,a3,a7
    dff8:	00c787b3          	add	a5,a5,a2
    dffc:	00879713          	sll	a4,a5,0x8
    e000:	0036d813          	srl	a6,a3,0x3
    e004:	08075e63          	bgez	a4,e0a0 <__subdf3+0x874>
    e008:	ff800737          	lui	a4,0xff800
    e00c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e010:	00e7f7b3          	and	a5,a5,a4
    e014:	01d79713          	sll	a4,a5,0x1d
    e018:	00979793          	sll	a5,a5,0x9
    e01c:	01076833          	or	a6,a4,a6
    e020:	00c7d713          	srl	a4,a5,0xc
    e024:	00100793          	li	a5,1
    e028:	9a9ff06f          	j	d9d0 <__subdf3+0x1a4>
    e02c:	fe068793          	add	a5,a3,-32
    e030:	02000613          	li	a2,32
    e034:	00f757b3          	srl	a5,a4,a5
    e038:	00c68a63          	beq	a3,a2,e04c <__subdf3+0x820>
    e03c:	04000613          	li	a2,64
    e040:	40d606b3          	sub	a3,a2,a3
    e044:	00d71733          	sll	a4,a4,a3
    e048:	00e8e8b3          	or	a7,a7,a4
    e04c:	01103933          	snez	s2,a7
    e050:	00f96933          	or	s2,s2,a5
    e054:	b39ff06f          	j	db8c <__subdf3+0x360>
    e058:	0034d513          	srl	a0,s1,0x3
    e05c:	00098793          	mv	a5,s3
    e060:	00090713          	mv	a4,s2
    e064:	c31ff06f          	j	dc94 <__subdf3+0x468>
    e068:	02000693          	li	a3,32
    e06c:	40f686b3          	sub	a3,a3,a5
    e070:	00000613          	li	a2,0
    e074:	8e9ff06f          	j	d95c <__subdf3+0x130>
    e078:	00c96833          	or	a6,s2,a2
    e07c:	c8080ee3          	beqz	a6,dd18 <__subdf3+0x4ec>
    e080:	00395913          	srl	s2,s2,0x3
    e084:	00000793          	li	a5,0
    e088:	00060713          	mv	a4,a2
    e08c:	c59ff06f          	j	dce4 <__subdf3+0x4b8>
    e090:	00000e13          	li	t3,0
    e094:	7ff00793          	li	a5,2047
    e098:	00080737          	lui	a4,0x80
    e09c:	935ff06f          	j	d9d0 <__subdf3+0x1a4>
    e0a0:	01d79713          	sll	a4,a5,0x1d
    e0a4:	00979793          	sll	a5,a5,0x9
    e0a8:	01076833          	or	a6,a4,a6
    e0ac:	00c7d713          	srl	a4,a5,0xc
    e0b0:	00000793          	li	a5,0
    e0b4:	91dff06f          	j	d9d0 <__subdf3+0x1a4>
    e0b8:	ae0786e3          	beqz	a5,dba4 <__subdf3+0x378>
    e0bc:	413f0833          	sub	a6,t5,s3
    e0c0:	00080793          	mv	a5,a6
    e0c4:	c6098ee3          	beqz	s3,dd40 <__subdf3+0x514>
    e0c8:	03800793          	li	a5,56
    e0cc:	0107ca63          	blt	a5,a6,e0e0 <__subdf3+0x8b4>
    e0d0:	008007b7          	lui	a5,0x800
    e0d4:	00f76733          	or	a4,a4,a5
    e0d8:	00068413          	mv	s0,a3
    e0dc:	c8dff06f          	j	dd68 <__subdf3+0x53c>
    e0e0:	00068413          	mv	s0,a3
    e0e4:	00100513          	li	a0,1
    e0e8:	cb1ff06f          	j	dd98 <__subdf3+0x56c>
    e0ec:	01d71813          	sll	a6,a4,0x1d
    e0f0:	00365613          	srl	a2,a2,0x3
    e0f4:	00c86833          	or	a6,a6,a2
    e0f8:	00375713          	srl	a4,a4,0x3
    e0fc:	00000793          	li	a5,0
    e100:	00068413          	mv	s0,a3
    e104:	ba5ff06f          	j	dca8 <__subdf3+0x47c>
    e108:	ba078ae3          	beqz	a5,dcbc <__subdf3+0x490>
    e10c:	413f06b3          	sub	a3,t5,s3
    e110:	00099663          	bnez	s3,e11c <__subdf3+0x8f0>
    e114:	00068793          	mv	a5,a3
    e118:	a21ff06f          	j	db38 <__subdf3+0x30c>
    e11c:	03800793          	li	a5,56
    e120:	00100913          	li	s2,1
    e124:	a6d7c4e3          	blt	a5,a3,db8c <__subdf3+0x360>
    e128:	008007b7          	lui	a5,0x800
    e12c:	00f76733          	or	a4,a4,a5
    e130:	a2dff06f          	j	db5c <__subdf3+0x330>

0000e134 <__unorddf2>:
    e134:	0145d713          	srl	a4,a1,0x14
    e138:	001007b7          	lui	a5,0x100
    e13c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e140:	fff74713          	not	a4,a4
    e144:	0146d813          	srl	a6,a3,0x14
    e148:	00b7f5b3          	and	a1,a5,a1
    e14c:	00d7f7b3          	and	a5,a5,a3
    e150:	01571693          	sll	a3,a4,0x15
    e154:	7ff87813          	and	a6,a6,2047
    e158:	02068063          	beqz	a3,e178 <__unorddf2+0x44>
    e15c:	7ff00713          	li	a4,2047
    e160:	00000513          	li	a0,0
    e164:	00e80463          	beq	a6,a4,e16c <__unorddf2+0x38>
    e168:	00008067          	ret
    e16c:	00c7e7b3          	or	a5,a5,a2
    e170:	00f03533          	snez	a0,a5
    e174:	00008067          	ret
    e178:	00a5e5b3          	or	a1,a1,a0
    e17c:	00100513          	li	a0,1
    e180:	fc058ee3          	beqz	a1,e15c <__unorddf2+0x28>
    e184:	00008067          	ret

0000e188 <__fixdfsi>:
    e188:	0145d793          	srl	a5,a1,0x14
    e18c:	001006b7          	lui	a3,0x100
    e190:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e194:	7ff7f793          	and	a5,a5,2047
    e198:	3fe00613          	li	a2,1022
    e19c:	00b77733          	and	a4,a4,a1
    e1a0:	01f5d593          	srl	a1,a1,0x1f
    e1a4:	00f65e63          	bge	a2,a5,e1c0 <__fixdfsi+0x38>
    e1a8:	41d00613          	li	a2,1053
    e1ac:	00f65e63          	bge	a2,a5,e1c8 <__fixdfsi+0x40>
    e1b0:	80000537          	lui	a0,0x80000
    e1b4:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e1b8:	00a58533          	add	a0,a1,a0
    e1bc:	00008067          	ret
    e1c0:	00000513          	li	a0,0
    e1c4:	00008067          	ret
    e1c8:	43300613          	li	a2,1075
    e1cc:	40f60633          	sub	a2,a2,a5
    e1d0:	01f00813          	li	a6,31
    e1d4:	00d76733          	or	a4,a4,a3
    e1d8:	02c85063          	bge	a6,a2,e1f8 <__fixdfsi+0x70>
    e1dc:	41300693          	li	a3,1043
    e1e0:	40f687b3          	sub	a5,a3,a5
    e1e4:	00f75733          	srl	a4,a4,a5
    e1e8:	40e00533          	neg	a0,a4
    e1ec:	fc059ce3          	bnez	a1,e1c4 <__fixdfsi+0x3c>
    e1f0:	00070513          	mv	a0,a4
    e1f4:	00008067          	ret
    e1f8:	bed78793          	add	a5,a5,-1043
    e1fc:	00f71733          	sll	a4,a4,a5
    e200:	00c55533          	srl	a0,a0,a2
    e204:	00a76733          	or	a4,a4,a0
    e208:	fe1ff06f          	j	e1e8 <__fixdfsi+0x60>

0000e20c <__floatsidf>:
    e20c:	ff010113          	add	sp,sp,-16
    e210:	00112623          	sw	ra,12(sp)
    e214:	00812423          	sw	s0,8(sp)
    e218:	00912223          	sw	s1,4(sp)
    e21c:	04050a63          	beqz	a0,e270 <__floatsidf+0x64>
    e220:	41f55713          	sra	a4,a0,0x1f
    e224:	00a744b3          	xor	s1,a4,a0
    e228:	40e484b3          	sub	s1,s1,a4
    e22c:	00050793          	mv	a5,a0
    e230:	00048513          	mv	a0,s1
    e234:	01f7d413          	srl	s0,a5,0x1f
    e238:	69c000ef          	jal	e8d4 <__clzsi2>
    e23c:	41e00793          	li	a5,1054
    e240:	40a787b3          	sub	a5,a5,a0
    e244:	00a00713          	li	a4,10
    e248:	7ff7f793          	and	a5,a5,2047
    e24c:	06a74063          	blt	a4,a0,e2ac <__floatsidf+0xa0>
    e250:	00b00713          	li	a4,11
    e254:	40a70733          	sub	a4,a4,a0
    e258:	00e4d733          	srl	a4,s1,a4
    e25c:	01550513          	add	a0,a0,21
    e260:	00c71713          	sll	a4,a4,0xc
    e264:	00a494b3          	sll	s1,s1,a0
    e268:	00c75713          	srl	a4,a4,0xc
    e26c:	0140006f          	j	e280 <__floatsidf+0x74>
    e270:	00000413          	li	s0,0
    e274:	00000793          	li	a5,0
    e278:	00000713          	li	a4,0
    e27c:	00000493          	li	s1,0
    e280:	01479793          	sll	a5,a5,0x14
    e284:	01f41413          	sll	s0,s0,0x1f
    e288:	00e7e7b3          	or	a5,a5,a4
    e28c:	00c12083          	lw	ra,12(sp)
    e290:	0087e7b3          	or	a5,a5,s0
    e294:	00812403          	lw	s0,8(sp)
    e298:	00048513          	mv	a0,s1
    e29c:	00078593          	mv	a1,a5
    e2a0:	00412483          	lw	s1,4(sp)
    e2a4:	01010113          	add	sp,sp,16
    e2a8:	00008067          	ret
    e2ac:	ff550513          	add	a0,a0,-11
    e2b0:	00a49733          	sll	a4,s1,a0
    e2b4:	00c71713          	sll	a4,a4,0xc
    e2b8:	00c75713          	srl	a4,a4,0xc
    e2bc:	00000493          	li	s1,0
    e2c0:	fc1ff06f          	j	e280 <__floatsidf+0x74>

0000e2c4 <__floatunsidf>:
    e2c4:	ff010113          	add	sp,sp,-16
    e2c8:	00812423          	sw	s0,8(sp)
    e2cc:	00112623          	sw	ra,12(sp)
    e2d0:	00050413          	mv	s0,a0
    e2d4:	04050c63          	beqz	a0,e32c <__floatunsidf+0x68>
    e2d8:	5fc000ef          	jal	e8d4 <__clzsi2>
    e2dc:	41e00793          	li	a5,1054
    e2e0:	40a787b3          	sub	a5,a5,a0
    e2e4:	00a00713          	li	a4,10
    e2e8:	7ff7f793          	and	a5,a5,2047
    e2ec:	06a74463          	blt	a4,a0,e354 <__floatunsidf+0x90>
    e2f0:	00b00713          	li	a4,11
    e2f4:	40a70733          	sub	a4,a4,a0
    e2f8:	01550513          	add	a0,a0,21
    e2fc:	00e45733          	srl	a4,s0,a4
    e300:	00a41433          	sll	s0,s0,a0
    e304:	00c12083          	lw	ra,12(sp)
    e308:	00040513          	mv	a0,s0
    e30c:	00c71713          	sll	a4,a4,0xc
    e310:	00812403          	lw	s0,8(sp)
    e314:	00c75713          	srl	a4,a4,0xc
    e318:	01479793          	sll	a5,a5,0x14
    e31c:	00e7e7b3          	or	a5,a5,a4
    e320:	00078593          	mv	a1,a5
    e324:	01010113          	add	sp,sp,16
    e328:	00008067          	ret
    e32c:	00c12083          	lw	ra,12(sp)
    e330:	00040513          	mv	a0,s0
    e334:	00000793          	li	a5,0
    e338:	00812403          	lw	s0,8(sp)
    e33c:	00000713          	li	a4,0
    e340:	01479793          	sll	a5,a5,0x14
    e344:	00e7e7b3          	or	a5,a5,a4
    e348:	00078593          	mv	a1,a5
    e34c:	01010113          	add	sp,sp,16
    e350:	00008067          	ret
    e354:	ff550513          	add	a0,a0,-11
    e358:	00a41733          	sll	a4,s0,a0
    e35c:	00000413          	li	s0,0
    e360:	00c12083          	lw	ra,12(sp)
    e364:	00040513          	mv	a0,s0
    e368:	00c71713          	sll	a4,a4,0xc
    e36c:	00812403          	lw	s0,8(sp)
    e370:	00c75713          	srl	a4,a4,0xc
    e374:	01479793          	sll	a5,a5,0x14
    e378:	00e7e7b3          	or	a5,a5,a4
    e37c:	00078593          	mv	a1,a5
    e380:	01010113          	add	sp,sp,16
    e384:	00008067          	ret

0000e388 <__trunctfdf2>:
    e388:	00c52583          	lw	a1,12(a0)
    e38c:	00852783          	lw	a5,8(a0)
    e390:	00052803          	lw	a6,0(a0)
    e394:	00452683          	lw	a3,4(a0)
    e398:	01059613          	sll	a2,a1,0x10
    e39c:	fe010113          	add	sp,sp,-32
    e3a0:	00159713          	sll	a4,a1,0x1
    e3a4:	01065613          	srl	a2,a2,0x10
    e3a8:	00f12423          	sw	a5,8(sp)
    e3ac:	00b12623          	sw	a1,12(sp)
    e3b0:	00f12c23          	sw	a5,24(sp)
    e3b4:	01012023          	sw	a6,0(sp)
    e3b8:	00d12223          	sw	a3,4(sp)
    e3bc:	01012823          	sw	a6,16(sp)
    e3c0:	00d12a23          	sw	a3,20(sp)
    e3c4:	00c12e23          	sw	a2,28(sp)
    e3c8:	01175713          	srl	a4,a4,0x11
    e3cc:	01f5d593          	srl	a1,a1,0x1f
    e3d0:	01010893          	add	a7,sp,16
    e3d4:	01c10793          	add	a5,sp,28
    e3d8:	00361513          	sll	a0,a2,0x3
    e3dc:	ffc7a603          	lw	a2,-4(a5)
    e3e0:	ffc78793          	add	a5,a5,-4
    e3e4:	01d65693          	srl	a3,a2,0x1d
    e3e8:	00a6e6b3          	or	a3,a3,a0
    e3ec:	00d7a223          	sw	a3,4(a5)
    e3f0:	fef894e3          	bne	a7,a5,e3d8 <__trunctfdf2+0x50>
    e3f4:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e3f8:	00381813          	sll	a6,a6,0x3
    e3fc:	01169613          	sll	a2,a3,0x11
    e400:	01012823          	sw	a6,16(sp)
    e404:	01265613          	srl	a2,a2,0x12
    e408:	04060263          	beqz	a2,e44c <__trunctfdf2+0xc4>
    e40c:	ffffc6b7          	lui	a3,0xffffc
    e410:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e414:	00d70733          	add	a4,a4,a3
    e418:	7fe00693          	li	a3,2046
    e41c:	10e6d463          	bge	a3,a4,e524 <__trunctfdf2+0x19c>
    e420:	7ff00793          	li	a5,2047
    e424:	00000613          	li	a2,0
    e428:	00000693          	li	a3,0
    e42c:	01479793          	sll	a5,a5,0x14
    e430:	01f59593          	sll	a1,a1,0x1f
    e434:	00c7e7b3          	or	a5,a5,a2
    e438:	00b7e7b3          	or	a5,a5,a1
    e43c:	00068513          	mv	a0,a3
    e440:	00078593          	mv	a1,a5
    e444:	02010113          	add	sp,sp,32
    e448:	00008067          	ret
    e44c:	01412603          	lw	a2,20(sp)
    e450:	01812883          	lw	a7,24(sp)
    e454:	01c12503          	lw	a0,28(sp)
    e458:	011666b3          	or	a3,a2,a7
    e45c:	00a6e6b3          	or	a3,a3,a0
    e460:	0106e6b3          	or	a3,a3,a6
    e464:	04071463          	bnez	a4,e4ac <__trunctfdf2+0x124>
    e468:	14068263          	beqz	a3,e5ac <__trunctfdf2+0x224>
    e46c:	00500693          	li	a3,5
    e470:	00000613          	li	a2,0
    e474:	0036d793          	srl	a5,a3,0x3
    e478:	01d61693          	sll	a3,a2,0x1d
    e47c:	00f6e6b3          	or	a3,a3,a5
    e480:	00961613          	sll	a2,a2,0x9
    e484:	7ff77793          	and	a5,a4,2047
    e488:	00c65613          	srl	a2,a2,0xc
    e48c:	01479793          	sll	a5,a5,0x14
    e490:	01f59593          	sll	a1,a1,0x1f
    e494:	00c7e7b3          	or	a5,a5,a2
    e498:	00b7e7b3          	or	a5,a5,a1
    e49c:	00068513          	mv	a0,a3
    e4a0:	00078593          	mv	a1,a5
    e4a4:	02010113          	add	sp,sp,32
    e4a8:	00008067          	ret
    e4ac:	12068463          	beqz	a3,e5d4 <__trunctfdf2+0x24c>
    e4b0:	01c8d793          	srl	a5,a7,0x1c
    e4b4:	00451513          	sll	a0,a0,0x4
    e4b8:	00a7e7b3          	or	a5,a5,a0
    e4bc:	008006b7          	lui	a3,0x800
    e4c0:	00d7f6b3          	and	a3,a5,a3
    e4c4:	1c068263          	beqz	a3,e688 <__trunctfdf2+0x300>
    e4c8:	ff800737          	lui	a4,0xff800
    e4cc:	01c65693          	srl	a3,a2,0x1c
    e4d0:	00489893          	sll	a7,a7,0x4
    e4d4:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e4d8:	00e7f633          	and	a2,a5,a4
    e4dc:	0116e6b3          	or	a3,a3,a7
    e4e0:	004007b7          	lui	a5,0x400
    e4e4:	00f66633          	or	a2,a2,a5
    e4e8:	ff86f693          	and	a3,a3,-8
    e4ec:	00000793          	li	a5,0
    e4f0:	0036d713          	srl	a4,a3,0x3
    e4f4:	01d61693          	sll	a3,a2,0x1d
    e4f8:	00961613          	sll	a2,a2,0x9
    e4fc:	00c65613          	srl	a2,a2,0xc
    e500:	01479793          	sll	a5,a5,0x14
    e504:	01f59593          	sll	a1,a1,0x1f
    e508:	00c7e7b3          	or	a5,a5,a2
    e50c:	00e6e6b3          	or	a3,a3,a4
    e510:	00b7e7b3          	or	a5,a5,a1
    e514:	00068513          	mv	a0,a3
    e518:	00078593          	mv	a1,a5
    e51c:	02010113          	add	sp,sp,32
    e520:	00008067          	ret
    e524:	0ce05c63          	blez	a4,e5fc <__trunctfdf2+0x274>
    e528:	01412783          	lw	a5,20(sp)
    e52c:	01812503          	lw	a0,24(sp)
    e530:	01c12603          	lw	a2,28(sp)
    e534:	00479693          	sll	a3,a5,0x4
    e538:	0106e6b3          	or	a3,a3,a6
    e53c:	01c7d793          	srl	a5,a5,0x1c
    e540:	00451813          	sll	a6,a0,0x4
    e544:	00461613          	sll	a2,a2,0x4
    e548:	01c55513          	srl	a0,a0,0x1c
    e54c:	00d036b3          	snez	a3,a3
    e550:	0107e7b3          	or	a5,a5,a6
    e554:	00a66633          	or	a2,a2,a0
    e558:	00f6e6b3          	or	a3,a3,a5
    e55c:	0076f793          	and	a5,a3,7
    e560:	02078063          	beqz	a5,e580 <__trunctfdf2+0x1f8>
    e564:	00f6f793          	and	a5,a3,15
    e568:	00400513          	li	a0,4
    e56c:	00a78a63          	beq	a5,a0,e580 <__trunctfdf2+0x1f8>
    e570:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    e574:	00d7b6b3          	sltu	a3,a5,a3
    e578:	00d60633          	add	a2,a2,a3
    e57c:	00078693          	mv	a3,a5
    e580:	008007b7          	lui	a5,0x800
    e584:	00f677b3          	and	a5,a2,a5
    e588:	ee0786e3          	beqz	a5,e474 <__trunctfdf2+0xec>
    e58c:	00170713          	add	a4,a4,1
    e590:	7ff00793          	li	a5,2047
    e594:	e8f706e3          	beq	a4,a5,e420 <__trunctfdf2+0x98>
    e598:	ff8007b7          	lui	a5,0xff800
    e59c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e5a0:	00f67633          	and	a2,a2,a5
    e5a4:	7ff77793          	and	a5,a4,2047
    e5a8:	f49ff06f          	j	e4f0 <__trunctfdf2+0x168>
    e5ac:	00000793          	li	a5,0
    e5b0:	00000613          	li	a2,0
    e5b4:	01479793          	sll	a5,a5,0x14
    e5b8:	01f59593          	sll	a1,a1,0x1f
    e5bc:	00c7e7b3          	or	a5,a5,a2
    e5c0:	00b7e7b3          	or	a5,a5,a1
    e5c4:	00068513          	mv	a0,a3
    e5c8:	00078593          	mv	a1,a5
    e5cc:	02010113          	add	sp,sp,32
    e5d0:	00008067          	ret
    e5d4:	7ff00793          	li	a5,2047
    e5d8:	00000613          	li	a2,0
    e5dc:	01479793          	sll	a5,a5,0x14
    e5e0:	01f59593          	sll	a1,a1,0x1f
    e5e4:	00c7e7b3          	or	a5,a5,a2
    e5e8:	00b7e7b3          	or	a5,a5,a1
    e5ec:	00068513          	mv	a0,a3
    e5f0:	00078593          	mv	a1,a5
    e5f4:	02010113          	add	sp,sp,32
    e5f8:	00008067          	ret
    e5fc:	fcc00693          	li	a3,-52
    e600:	08d74c63          	blt	a4,a3,e698 <__trunctfdf2+0x310>
    e604:	03d00693          	li	a3,61
    e608:	40e686b3          	sub	a3,a3,a4
    e60c:	01c12703          	lw	a4,28(sp)
    e610:	4056de13          	sra	t3,a3,0x5
    e614:	00080eb7          	lui	t4,0x80
    e618:	00eeeeb3          	or	t4,t4,a4
    e61c:	002e1513          	sll	a0,t3,0x2
    e620:	01d12e23          	sw	t4,28(sp)
    e624:	01f6f693          	and	a3,a3,31
    e628:	00a88833          	add	a6,a7,a0
    e62c:	00088613          	mv	a2,a7
    e630:	00000713          	li	a4,0
    e634:	00062303          	lw	t1,0(a2)
    e638:	00460613          	add	a2,a2,4
    e63c:	00676733          	or	a4,a4,t1
    e640:	fec81ae3          	bne	a6,a2,e634 <__trunctfdf2+0x2ac>
    e644:	00300613          	li	a2,3
    e648:	41c60633          	sub	a2,a2,t3
    e64c:	04069a63          	bnez	a3,e6a0 <__trunctfdf2+0x318>
    e650:	00082803          	lw	a6,0(a6)
    e654:	00168693          	add	a3,a3,1
    e658:	00478793          	add	a5,a5,4
    e65c:	ff07ae23          	sw	a6,-4(a5)
    e660:	00d64e63          	blt	a2,a3,e67c <__trunctfdf2+0x2f4>
    e664:	00a78833          	add	a6,a5,a0
    e668:	00082803          	lw	a6,0(a6)
    e66c:	00168693          	add	a3,a3,1
    e670:	00478793          	add	a5,a5,4
    e674:	ff07ae23          	sw	a6,-4(a5)
    e678:	fed656e3          	bge	a2,a3,e664 <__trunctfdf2+0x2dc>
    e67c:	00400793          	li	a5,4
    e680:	41c787b3          	sub	a5,a5,t3
    e684:	0840006f          	j	e708 <__trunctfdf2+0x380>
    e688:	00000593          	li	a1,0
    e68c:	7ff00793          	li	a5,2047
    e690:	00080637          	lui	a2,0x80
    e694:	d99ff06f          	j	e42c <__trunctfdf2+0xa4>
    e698:	00000713          	li	a4,0
    e69c:	dd1ff06f          	j	e46c <__trunctfdf2+0xe4>
    e6a0:	02050813          	add	a6,a0,32
    e6a4:	00280833          	add	a6,a6,sp
    e6a8:	ff082803          	lw	a6,-16(a6)
    e6ac:	02000f13          	li	t5,32
    e6b0:	40df0f33          	sub	t5,t5,a3
    e6b4:	01e81833          	sll	a6,a6,t5
    e6b8:	01076733          	or	a4,a4,a6
    e6bc:	08060e63          	beqz	a2,e758 <__trunctfdf2+0x3d0>
    e6c0:	00261813          	sll	a6,a2,0x2
    e6c4:	00f80fb3          	add	t6,a6,a5
    e6c8:	00a88633          	add	a2,a7,a0
    e6cc:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    e6d0:	00462303          	lw	t1,4(a2)
    e6d4:	00478793          	add	a5,a5,4
    e6d8:	00d55533          	srl	a0,a0,a3
    e6dc:	01e31333          	sll	t1,t1,t5
    e6e0:	00656533          	or	a0,a0,t1
    e6e4:	fea7ae23          	sw	a0,-4(a5)
    e6e8:	00460613          	add	a2,a2,4
    e6ec:	feff90e3          	bne	t6,a5,e6cc <__trunctfdf2+0x344>
    e6f0:	00400793          	li	a5,4
    e6f4:	41c787b3          	sub	a5,a5,t3
    e6f8:	02080613          	add	a2,a6,32
    e6fc:	00260633          	add	a2,a2,sp
    e700:	00dedeb3          	srl	t4,t4,a3
    e704:	ffd62823          	sw	t4,-16(a2)
    e708:	00400693          	li	a3,4
    e70c:	40f686b3          	sub	a3,a3,a5
    e710:	00269693          	sll	a3,a3,0x2
    e714:	00279793          	sll	a5,a5,0x2
    e718:	00800613          	li	a2,8
    e71c:	00f888b3          	add	a7,a7,a5
    e720:	00c6ea63          	bltu	a3,a2,e734 <__trunctfdf2+0x3ac>
    e724:	0008a023          	sw	zero,0(a7)
    e728:	0008a223          	sw	zero,4(a7)
    e72c:	ff868693          	add	a3,a3,-8
    e730:	00888893          	add	a7,a7,8
    e734:	00400793          	li	a5,4
    e738:	00f6e463          	bltu	a3,a5,e740 <__trunctfdf2+0x3b8>
    e73c:	0008a023          	sw	zero,0(a7)
    e740:	01012783          	lw	a5,16(sp)
    e744:	00e03733          	snez	a4,a4
    e748:	01412603          	lw	a2,20(sp)
    e74c:	00f766b3          	or	a3,a4,a5
    e750:	00000713          	li	a4,0
    e754:	e09ff06f          	j	e55c <__trunctfdf2+0x1d4>
    e758:	00100793          	li	a5,1
    e75c:	00000813          	li	a6,0
    e760:	f99ff06f          	j	e6f8 <__trunctfdf2+0x370>

0000e764 <__mulsi3>:
    e764:	00050613          	mv	a2,a0
    e768:	00000513          	li	a0,0
    e76c:	0015f693          	and	a3,a1,1
    e770:	00068463          	beqz	a3,e778 <__mulsi3+0x14>
    e774:	00c50533          	add	a0,a0,a2
    e778:	0015d593          	srl	a1,a1,0x1
    e77c:	00161613          	sll	a2,a2,0x1
    e780:	fe0596e3          	bnez	a1,e76c <__mulsi3+0x8>
    e784:	00008067          	ret

0000e788 <__muldi3>:
    e788:	ff010113          	add	sp,sp,-16
    e78c:	00812423          	sw	s0,8(sp)
    e790:	00050413          	mv	s0,a0
    e794:	00112623          	sw	ra,12(sp)
    e798:	00060513          	mv	a0,a2
    e79c:	00068393          	mv	t2,a3
    e7a0:	00040713          	mv	a4,s0
    e7a4:	00060813          	mv	a6,a2
    e7a8:	00000793          	li	a5,0
    e7ac:	00000313          	li	t1,0
    e7b0:	00000f13          	li	t5,0
    e7b4:	01e708b3          	add	a7,a4,t5
    e7b8:	00187e93          	and	t4,a6,1
    e7bc:	00f30fb3          	add	t6,t1,a5
    e7c0:	01f75e13          	srl	t3,a4,0x1f
    e7c4:	00185813          	srl	a6,a6,0x1
    e7c8:	00e8b2b3          	sltu	t0,a7,a4
    e7cc:	00179793          	sll	a5,a5,0x1
    e7d0:	000e8663          	beqz	t4,e7dc <__muldi3+0x54>
    e7d4:	00088f13          	mv	t5,a7
    e7d8:	01f28333          	add	t1,t0,t6
    e7dc:	00171713          	sll	a4,a4,0x1
    e7e0:	01c7e7b3          	or	a5,a5,t3
    e7e4:	fc0818e3          	bnez	a6,e7b4 <__muldi3+0x2c>
    e7e8:	00058663          	beqz	a1,e7f4 <__muldi3+0x6c>
    e7ec:	f79ff0ef          	jal	e764 <__mulsi3>
    e7f0:	00650333          	add	t1,a0,t1
    e7f4:	00038a63          	beqz	t2,e808 <__muldi3+0x80>
    e7f8:	00040513          	mv	a0,s0
    e7fc:	00038593          	mv	a1,t2
    e800:	f65ff0ef          	jal	e764 <__mulsi3>
    e804:	00650333          	add	t1,a0,t1
    e808:	00c12083          	lw	ra,12(sp)
    e80c:	00812403          	lw	s0,8(sp)
    e810:	000f0513          	mv	a0,t5
    e814:	00030593          	mv	a1,t1
    e818:	01010113          	add	sp,sp,16
    e81c:	00008067          	ret

0000e820 <__divsi3>:
    e820:	06054063          	bltz	a0,e880 <__umodsi3+0x10>
    e824:	0605c663          	bltz	a1,e890 <__umodsi3+0x20>

0000e828 <__hidden___udivsi3>:
    e828:	00058613          	mv	a2,a1
    e82c:	00050593          	mv	a1,a0
    e830:	fff00513          	li	a0,-1
    e834:	02060c63          	beqz	a2,e86c <__hidden___udivsi3+0x44>
    e838:	00100693          	li	a3,1
    e83c:	00b67a63          	bgeu	a2,a1,e850 <__hidden___udivsi3+0x28>
    e840:	00c05863          	blez	a2,e850 <__hidden___udivsi3+0x28>
    e844:	00161613          	sll	a2,a2,0x1
    e848:	00169693          	sll	a3,a3,0x1
    e84c:	feb66ae3          	bltu	a2,a1,e840 <__hidden___udivsi3+0x18>
    e850:	00000513          	li	a0,0
    e854:	00c5e663          	bltu	a1,a2,e860 <__hidden___udivsi3+0x38>
    e858:	40c585b3          	sub	a1,a1,a2
    e85c:	00d56533          	or	a0,a0,a3
    e860:	0016d693          	srl	a3,a3,0x1
    e864:	00165613          	srl	a2,a2,0x1
    e868:	fe0696e3          	bnez	a3,e854 <__hidden___udivsi3+0x2c>
    e86c:	00008067          	ret

0000e870 <__umodsi3>:
    e870:	00008293          	mv	t0,ra
    e874:	fb5ff0ef          	jal	e828 <__hidden___udivsi3>
    e878:	00058513          	mv	a0,a1
    e87c:	00028067          	jr	t0
    e880:	40a00533          	neg	a0,a0
    e884:	00b04863          	bgtz	a1,e894 <__umodsi3+0x24>
    e888:	40b005b3          	neg	a1,a1
    e88c:	f9dff06f          	j	e828 <__hidden___udivsi3>
    e890:	40b005b3          	neg	a1,a1
    e894:	00008293          	mv	t0,ra
    e898:	f91ff0ef          	jal	e828 <__hidden___udivsi3>
    e89c:	40a00533          	neg	a0,a0
    e8a0:	00028067          	jr	t0

0000e8a4 <__modsi3>:
    e8a4:	00008293          	mv	t0,ra
    e8a8:	0005ca63          	bltz	a1,e8bc <__modsi3+0x18>
    e8ac:	00054c63          	bltz	a0,e8c4 <__modsi3+0x20>
    e8b0:	f79ff0ef          	jal	e828 <__hidden___udivsi3>
    e8b4:	00058513          	mv	a0,a1
    e8b8:	00028067          	jr	t0
    e8bc:	40b005b3          	neg	a1,a1
    e8c0:	fe0558e3          	bgez	a0,e8b0 <__modsi3+0xc>
    e8c4:	40a00533          	neg	a0,a0
    e8c8:	f61ff0ef          	jal	e828 <__hidden___udivsi3>
    e8cc:	40b00533          	neg	a0,a1
    e8d0:	00028067          	jr	t0

0000e8d4 <__clzsi2>:
    e8d4:	000107b7          	lui	a5,0x10
    e8d8:	02f57a63          	bgeu	a0,a5,e90c <__clzsi2+0x38>
    e8dc:	10053793          	sltiu	a5,a0,256
    e8e0:	0017b793          	seqz	a5,a5
    e8e4:	00379793          	sll	a5,a5,0x3
    e8e8:	02000713          	li	a4,32
    e8ec:	40f70733          	sub	a4,a4,a5
    e8f0:	00f55533          	srl	a0,a0,a5
    e8f4:	00001797          	auipc	a5,0x1
    e8f8:	95c78793          	add	a5,a5,-1700 # f250 <__clz_tab>
    e8fc:	00a787b3          	add	a5,a5,a0
    e900:	0007c503          	lbu	a0,0(a5)
    e904:	40a70533          	sub	a0,a4,a0
    e908:	00008067          	ret
    e90c:	010007b7          	lui	a5,0x1000
    e910:	02f57463          	bgeu	a0,a5,e938 <__clzsi2+0x64>
    e914:	01000793          	li	a5,16
    e918:	00f55533          	srl	a0,a0,a5
    e91c:	00001797          	auipc	a5,0x1
    e920:	93478793          	add	a5,a5,-1740 # f250 <__clz_tab>
    e924:	00a787b3          	add	a5,a5,a0
    e928:	0007c503          	lbu	a0,0(a5)
    e92c:	01000713          	li	a4,16
    e930:	40a70533          	sub	a0,a4,a0
    e934:	00008067          	ret
    e938:	01800793          	li	a5,24
    e93c:	00f55533          	srl	a0,a0,a5
    e940:	00001797          	auipc	a5,0x1
    e944:	91078793          	add	a5,a5,-1776 # f250 <__clz_tab>
    e948:	00a787b3          	add	a5,a5,a0
    e94c:	0007c503          	lbu	a0,0(a5)
    e950:	00800713          	li	a4,8
    e954:	40a70533          	sub	a0,a4,a0
    e958:	00008067          	ret
