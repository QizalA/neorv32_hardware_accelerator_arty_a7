
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0xc0>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00010397          	auipc	t2,0x10
      38:	a3c38393          	add	t2,t2,-1476 # fa70 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80002597          	auipc	a1,0x80002
      58:	94058593          	add	a1,a1,-1728 # 80001994 <__crt0_bss_end>
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
     110:	d8040413          	add	s0,s0,-640 # ee8c <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	d7848493          	add	s1,s1,-648 # ee8c <__fini_array_end>

0000011c <__crt0_constructors>:
     11c:	00945a63          	bge	s0,s1,130 <__crt0_constructors_end>
     120:	00042083          	lw	ra,0(s0)
     124:	000080e7          	jalr	ra
     128:	00440413          	add	s0,s0,4
     12c:	ff1ff06f          	j	11c <__crt0_constructors>

00000130 <__crt0_constructors_end>:
     130:	00000617          	auipc	a2,0x0
     134:	20060613          	add	a2,a2,512 # 330 <main>

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
     178:	d1840413          	add	s0,s0,-744 # ee8c <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	d1048493          	add	s1,s1,-752 # ee8c <__fini_array_end>

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
   CSRs for timing
   ======================= */
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

0000020c <checksum>:
    for (int y=0; y<Hout; ++y)
      for (int x=0; x<Wout; ++x)
        if (A[oc][y][x]!=B[oc][y][x]) ++mism;
  return mism;
}
static long long checksum(const int32_t Y[Cout][Hout][Wout]){
     20c:	00050793          	mv	a5,a0
     210:	48050893          	add	a7,a0,1152
  long long s=0;
     214:	00000593          	li	a1,0
     218:	00000513          	li	a0,0
  for (int oc=0; oc<Cout; ++oc)
    for (int y=0; y<Hout; ++y)
      for (int x=0; x<Wout; ++x)
     21c:	00600313          	li	t1,6
    for (int y=0; y<Hout; ++y)
     220:	09078813          	add	a6,a5,144
     224:	0340006f          	j	258 <checksum+0x4c>
        s += (long long)Y[oc][y][x];
     228:	00062703          	lw	a4,0(a2)
      for (int x=0; x<Wout; ++x)
     22c:	00168693          	add	a3,a3,1
     230:	00460613          	add	a2,a2,4
        s += (long long)Y[oc][y][x];
     234:	41f75e93          	sra	t4,a4,0x1f
     238:	00e50733          	add	a4,a0,a4
     23c:	00a73e33          	sltu	t3,a4,a0
     240:	01d585b3          	add	a1,a1,t4
     244:	00070513          	mv	a0,a4
     248:	00be05b3          	add	a1,t3,a1
      for (int x=0; x<Wout; ++x)
     24c:	fc669ee3          	bne	a3,t1,228 <checksum+0x1c>
    for (int y=0; y<Hout; ++y)
     250:	01878793          	add	a5,a5,24
     254:	01078863          	beq	a5,a6,264 <checksum+0x58>
static long long checksum(const int32_t Y[Cout][Hout][Wout]){
     258:	00078613          	mv	a2,a5
      for (int x=0; x<Wout; ++x)
     25c:	00000693          	li	a3,0
     260:	fc9ff06f          	j	228 <checksum+0x1c>
  for (int oc=0; oc<Cout; ++oc)
     264:	faf89ee3          	bne	a7,a5,220 <checksum+0x14>
  return s;
}
     268:	00008067          	ret

0000026c <print_speedup_fixed>:
  if (!den){ printf("n/a"); return; }
     26c:	00d667b3          	or	a5,a2,a3
     270:	00079863          	bnez	a5,280 <print_speedup_fixed+0x14>
     274:	0000f537          	lui	a0,0xf
     278:	e9050513          	add	a0,a0,-368 # ee90 <__fini_array_end+0x4>
     27c:	3cd0006f          	j	e48 <printf>
static void print_speedup_fixed(uint64_t num, uint64_t den){
     280:	fe010113          	add	sp,sp,-32
     284:	00812c23          	sw	s0,24(sp)
     288:	00912a23          	sw	s1,20(sp)
     28c:	00068413          	mv	s0,a3
  uint64_t s=(num*1000ull + den/2)/den;
     290:	00060493          	mv	s1,a2
     294:	00000693          	li	a3,0
     298:	3e800613          	li	a2,1000
static void print_speedup_fixed(uint64_t num, uint64_t den){
     29c:	00112e23          	sw	ra,28(sp)
  uint64_t s=(num*1000ull + den/2)/den;
     2a0:	2190e0ef          	jal	ecb8 <__muldi3>
     2a4:	00050793          	mv	a5,a0
     2a8:	01f41713          	sll	a4,s0,0x1f
     2ac:	0014d513          	srl	a0,s1,0x1
     2b0:	00a76533          	or	a0,a4,a0
     2b4:	00a78533          	add	a0,a5,a0
     2b8:	00145713          	srl	a4,s0,0x1
     2bc:	00f537b3          	sltu	a5,a0,a5
     2c0:	00e585b3          	add	a1,a1,a4
     2c4:	00b785b3          	add	a1,a5,a1
     2c8:	00048613          	mv	a2,s1
     2cc:	00040693          	mv	a3,s0
     2d0:	1f00b0ef          	jal	b4c0 <__udivdi3>
  printf("%" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2d4:	3e800613          	li	a2,1000
     2d8:	00000693          	li	a3,0
  uint64_t s=(num*1000ull + den/2)/den;
     2dc:	00050493          	mv	s1,a0
     2e0:	00058413          	mv	s0,a1
  printf("%" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     2e4:	0890b0ef          	jal	bb6c <__umoddi3>
     2e8:	00a12623          	sw	a0,12(sp)
     2ec:	00b12423          	sw	a1,8(sp)
     2f0:	3e800613          	li	a2,1000
     2f4:	00000693          	li	a3,0
     2f8:	00048513          	mv	a0,s1
     2fc:	00040593          	mv	a1,s0
     300:	1c00b0ef          	jal	b4c0 <__udivdi3>
}
     304:	01812403          	lw	s0,24(sp)
  printf("%" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     308:	00c12703          	lw	a4,12(sp)
     30c:	00812783          	lw	a5,8(sp)
}
     310:	01c12083          	lw	ra,28(sp)
     314:	01412483          	lw	s1,20(sp)
  printf("%" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     318:	00050613          	mv	a2,a0
     31c:	0000f537          	lui	a0,0xf
     320:	00058693          	mv	a3,a1
     324:	e9450513          	add	a0,a0,-364 # ee94 <__fini_array_end+0x8>
}
     328:	02010113          	add	sp,sp,32
  printf("%" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000);
     32c:	31d0006f          	j	e48 <printf>

00000330 <main>:
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     330:	ffeb07b7          	lui	a5,0xffeb0
     334:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>

/* =======================
   Main
   ======================= */
int main(void){
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     338:	0000f537          	lui	a0,0xf
int main(void){
     33c:	f0010113          	add	sp,sp,-256
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     340:	eb450513          	add	a0,a0,-332 # eeb4 <__fini_array_end+0x28>
int main(void){
     344:	0e112e23          	sw	ra,252(sp)
     348:	0e912a23          	sw	s1,244(sp)
     34c:	0f212823          	sw	s2,240(sp)
     350:	0f412423          	sw	s4,232(sp)
     354:	0f512223          	sw	s5,228(sp)
     358:	0d712e23          	sw	s7,220(sp)
     35c:	0d812c23          	sw	s8,216(sp)
     360:	0e812c23          	sw	s0,248(sp)
     364:	0f312623          	sw	s3,236(sp)
     368:	0f612023          	sw	s6,224(sp)
     36c:	0d912a23          	sw	s9,212(sp)
     370:	0da12823          	sw	s10,208(sp)
     374:	0db12623          	sw	s11,204(sp)
  printf("CFS ID = 0x%08" PRIX32 " (expect 0xCAFEBABE)\n\n", cfs_read(CFS_CTL));
     378:	2d1000ef          	jal	e48 <printf>

  static int32_t Y_sw[Cout][Hout][Wout];
  static int32_t Y_hw[Cout][Hout][Wout];

  /* SW */
  uint64_t c0=rdcycle(), i0=rdinstret();
     37c:	e69ff0ef          	jal	1e4 <rdcycle>
     380:	00050913          	mv	s2,a0
     384:	00058a93          	mv	s5,a1
     388:	80001bb7          	lui	s7,0x80001
     38c:	e6dff0ef          	jal	1f8 <rdinstret>
     390:	00050493          	mv	s1,a0
     394:	00058a13          	mv	s4,a1
     398:	3b4b8b93          	add	s7,s7,948 # 800013b4 <Y_sw.3>
     39c:	00700c13          	li	s8,7
      for (int ox=0; ox<Wout; ++ox){
     3a0:	000b8613          	mv	a2,s7
     3a4:	00200b13          	li	s6,2
    for (int oy=0; oy<Hout; ++oy)
     3a8:	00000693          	li	a3,0
     3ac:	0f40006f          	j	4a0 <main+0x170>
     3b0:	0ff77593          	zext.b	a1,a4
  return (int8_t)(((c+1)*(y+2) + (x)) & 0x0F) - 8; /* small ranged pattern */
     3b4:	00b78533          	add	a0,a5,a1
  return (int8_t)((oc+1 + 3*c + 2*ky + kx) & 0x0F) - 8;
     3b8:	00b405b3          	add	a1,s0,a1
  return (int8_t)(((c+1)*(y+2) + (x)) & 0x0F) - 8; /* small ranged pattern */
     3bc:	00f57513          	and	a0,a0,15
  return (int8_t)((oc+1 + 3*c + 2*ky + kx) & 0x0F) - 8;
     3c0:	00f5f593          	and	a1,a1,15
              s += (int32_t)a * (int32_t)w;
     3c4:	ff858593          	add	a1,a1,-8
     3c8:	ff850513          	add	a0,a0,-8
     3cc:	03012423          	sw	a6,40(sp)
     3d0:	02c12223          	sw	a2,36(sp)
     3d4:	02d12023          	sw	a3,32(sp)
     3d8:	01112e23          	sw	a7,28(sp)
  return (int8_t)(((c+1)*(y+2) + (x)) & 0x0F) - 8; /* small ranged pattern */
     3dc:	00e12c23          	sw	a4,24(sp)
     3e0:	00f12a23          	sw	a5,20(sp)
              s += (int32_t)a * (int32_t)w;
     3e4:	0b10e0ef          	jal	ec94 <__mulsi3>
            for (int kx=0;kx<Kw;++kx){
     3e8:	01812703          	lw	a4,24(sp)
              s += (int32_t)a * (int32_t)w;
     3ec:	01c12883          	lw	a7,28(sp)
            for (int kx=0;kx<Kw;++kx){
     3f0:	00300313          	li	t1,3
     3f4:	00170713          	add	a4,a4,1
     3f8:	01412783          	lw	a5,20(sp)
     3fc:	02012683          	lw	a3,32(sp)
     400:	02412603          	lw	a2,36(sp)
     404:	02812803          	lw	a6,40(sp)
              s += (int32_t)a * (int32_t)w;
     408:	00a888b3          	add	a7,a7,a0
            for (int kx=0;kx<Kw;++kx){
     40c:	00500e13          	li	t3,5
     410:	00600e93          	li	t4,6
     414:	00f00f13          	li	t5,15
     418:	f8671ce3          	bne	a4,t1,3b0 <main+0x80>
          for (int ky=0;ky<Kh;++ky)
     41c:	00240413          	add	s0,s0,2
     420:	00fc87b3          	add	a5,s9,a5
     424:	0ff47413          	zext.b	s0,s0
     428:	0ff7f793          	zext.b	a5,a5
     42c:	008d0663          	beq	s10,s0,438 <main+0x108>
            for (int kx=0;kx<Kw;++kx){
     430:	00000713          	li	a4,0
     434:	f7dff06f          	j	3b0 <main+0x80>
        for (int c=0;c<Cin;++c)
     438:	001c8c93          	add	s9,s9,1
     43c:	003d0d13          	add	s10,s10,3
     440:	013b09b3          	add	s3,s6,s3
     444:	0ffcfc93          	zext.b	s9,s9
     448:	0ffd7d13          	zext.b	s10,s10
     44c:	0ff9f993          	zext.b	s3,s3
     450:	01cc8a63          	beq	s9,t3,464 <main+0x134>
          for (int ky=0;ky<Kh;++ky)
     454:	ffad0413          	add	s0,s10,-6
     458:	0ff47413          	zext.b	s0,s0
            for (int kx=0;kx<Kw;++kx){
     45c:	00098793          	mv	a5,s3
     460:	fd1ff06f          	j	430 <main+0x100>
        Y[oc][oy][ox] = s;
     464:	01182023          	sw	a7,0(a6)
      for (int ox=0; ox<Wout; ++ox){
     468:	001d8d93          	add	s11,s11,1
     46c:	00480813          	add	a6,a6,4
     470:	01dd8e63          	beq	s11,t4,48c <main+0x15c>
        for (int c=0;c<Cin;++c)
     474:	01bb09b3          	add	s3,s6,s11
     478:	0ff9f993          	zext.b	s3,s3
            for (int kx=0;kx<Kw;++kx){
     47c:	000c0d13          	mv	s10,s8
     480:	00100c93          	li	s9,1
        int32_t s = pat_bias(oc);
     484:	00000893          	li	a7,0
     488:	fcdff06f          	j	454 <main+0x124>
    for (int oy=0; oy<Hout; ++oy)
     48c:	001b0b13          	add	s6,s6,1
     490:	00168693          	add	a3,a3,1
     494:	0ffb7b13          	zext.b	s6,s6
     498:	01860613          	add	a2,a2,24
     49c:	01b68863          	beq	a3,s11,4ac <main+0x17c>
        int32_t s = pat_bias(oc);
     4a0:	00060813          	mv	a6,a2
      for (int ox=0; ox<Wout; ++ox){
     4a4:	00000d93          	li	s11,0
     4a8:	fcdff06f          	j	474 <main+0x144>
  for (int oc=0; oc<Cout; ++oc)
     4ac:	001c0c13          	add	s8,s8,1
     4b0:	0ffc7c13          	zext.b	s8,s8
     4b4:	090b8b93          	add	s7,s7,144
     4b8:	efec14e3          	bne	s8,t5,3a0 <main+0x70>
  conv2d_sw(Y_sw);
  uint64_t i1=rdinstret(), c1=rdcycle();
     4bc:	d3dff0ef          	jal	1f8 <rdinstret>
     4c0:	00050413          	mv	s0,a0
     4c4:	00058993          	mv	s3,a1
     4c8:	d1dff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     4cc:	412507b3          	sub	a5,a0,s2
     4d0:	00f12a23          	sw	a5,20(sp)
     4d4:	415585b3          	sub	a1,a1,s5
     4d8:	00f537b3          	sltu	a5,a0,a5
     4dc:	40f587b3          	sub	a5,a1,a5
     4e0:	02f12023          	sw	a5,32(sp)
     4e4:	409407b3          	sub	a5,s0,s1
     4e8:	414989b3          	sub	s3,s3,s4
     4ec:	00f43433          	sltu	s0,s0,a5
     4f0:	00f12c23          	sw	a5,24(sp)
     4f4:	408987b3          	sub	a5,s3,s0
     4f8:	02f12223          	sw	a5,36(sp)

  /* CFS */
  c0=rdcycle(); i0=rdinstret();
     4fc:	ce9ff0ef          	jal	1e4 <rdcycle>
     500:	02a12623          	sw	a0,44(sp)
     504:	02b12823          	sw	a1,48(sp)
     508:	cf1ff0ef          	jal	1f8 <rdinstret>
     50c:	800007b7          	lui	a5,0x80000
     510:	800019b7          	lui	s3,0x80001
     514:	73478793          	add	a5,a5,1844 # 80000734 <B_flat.0>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     518:	ffeb0bb7          	lui	s7,0xffeb0
     51c:	ffeb0c37          	lui	s8,0xffeb0
  c0=rdcycle(); i0=rdinstret();
     520:	02a12a23          	sw	a0,52(sp)
     524:	02b12c23          	sw	a1,56(sp)
     528:	f3498993          	add	s3,s3,-204 # 80000f34 <Y_hw.2>
  for (int oc0=0; oc0<Cout; oc0+=4){
     52c:	00000b13          	li	s6,0
     530:	02f12423          	sw	a5,40(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     534:	004b8b93          	add	s7,s7,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     538:	008c0c13          	add	s8,s8,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
    for (int r=0; r<4; ++r){
     53c:	001b0413          	add	s0,s6,1
  uint64_t c0=rdcycle(), i0=rdinstret();
     540:	800017b7          	lui	a5,0x80001
     544:	0ff47413          	zext.b	s0,s0
     548:	b3478a13          	add	s4,a5,-1228 # 80000b34 <A_flat.1>
     54c:	00000a93          	li	s5,0
          for (int kx=0; kx<Kw; ++kx, ++t){
     550:	00300d93          	li	s11,3
      for (int t=0, c=0; c<Cin; ++c)
     554:	02400d13          	li	s10,36
    for (int r=0; r<4; ++r){
     558:	40000c93          	li	s9,1024
          for (int kx=0; kx<Kw; ++kx, ++t){
     55c:	00040593          	mv	a1,s0
      for (int t=0, c=0; c<Cin; ++c)
     560:	00000793          	li	a5,0
          for (int kx=0; kx<Kw; ++kx, ++t){
     564:	00058613          	mv	a2,a1
        for (int ky=0; ky<Kh; ++ky)
     568:	00978513          	add	a0,a5,9
     56c:	0300006f          	j	59c <main+0x26c>
  return (int8_t)((oc+1 + 3*c + 2*ky + kx) & 0x0F) - 8;
     570:	00e606b3          	add	a3,a2,a4
     574:	00f6f693          	and	a3,a3,15
            A_flat[r*LDA + t] = pat_wt(oc, c, ky, kx);
     578:	00e808b3          	add	a7,a6,a4
  return (int8_t)((oc+1 + 3*c + 2*ky + kx) & 0x0F) - 8;
     57c:	ff868693          	add	a3,a3,-8
            A_flat[r*LDA + t] = pat_wt(oc, c, ky, kx);
     580:	00d88023          	sb	a3,0(a7)
          for (int kx=0; kx<Kw; ++kx, ++t){
     584:	00170713          	add	a4,a4,1
     588:	ffb714e3          	bne	a4,s11,570 <main+0x240>
        for (int ky=0; ky<Kh; ++ky)
     58c:	00260613          	add	a2,a2,2
     590:	00378793          	add	a5,a5,3
     594:	0ff67613          	zext.b	a2,a2
     598:	00a78863          	beq	a5,a0,5a8 <main+0x278>
          for (int kx=0; kx<Kw; ++kx, ++t){
     59c:	00000713          	li	a4,0
            A_flat[r*LDA + t] = pat_wt(oc, c, ky, kx);
     5a0:	01478833          	add	a6,a5,s4
     5a4:	fcdff06f          	j	570 <main+0x240>
      for (int t=0, c=0; c<Cin; ++c)
     5a8:	00358593          	add	a1,a1,3
     5ac:	0ff5f593          	zext.b	a1,a1
     5b0:	fba79ae3          	bne	a5,s10,564 <main+0x234>
      for (int t=KCONV; t<MAXK; ++t) A_flat[r*LDA + t] = 0;
     5b4:	024a0513          	add	a0,s4,36
     5b8:	0dc00613          	li	a2,220
     5bc:	00000593          	li	a1,0
    for (int r=0; r<4; ++r){
     5c0:	00140413          	add	s0,s0,1
     5c4:	100a8a93          	add	s5,s5,256
      for (int t=KCONV; t<MAXK; ++t) A_flat[r*LDA + t] = 0;
     5c8:	21d000ef          	jal	fe4 <memset>
    for (int r=0; r<4; ++r){
     5cc:	100a0a13          	add	s4,s4,256
     5d0:	0ff47413          	zext.b	s0,s0
     5d4:	f99a94e3          	bne	s5,s9,55c <main+0x22c>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5d8:	ffeb04b7          	lui	s1,0xffeb0
     5dc:	ffeb0937          	lui	s2,0xffeb0
     5e0:	ffeb0cb7          	lui	s9,0xffeb0
     5e4:	ffeb0e37          	lui	t3,0xffeb0
     5e8:	ffeb0eb7          	lui	t4,0xffeb0
     5ec:	ffeb0f37          	lui	t5,0xffeb0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     5f0:	ffeb0fb7          	lui	t6,0xffeb0
    for (int p0=0; p0 < Hout*Wout; p0+=4){
     5f4:	00000a13          	li	s4,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5f8:	00c48493          	add	s1,s1,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     5fc:	01090913          	add	s2,s2,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     600:	014c8c93          	add	s9,s9,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     604:	018e0e13          	add	t3,t3,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     608:	01ce8e93          	add	t4,t4,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     60c:	020f0f13          	add	t5,t5,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     610:	040f8f93          	add	t6,t6,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
      for (int t=0, c=0; c<Cin; ++c)
     614:	004a0793          	add	a5,s4,4
        for (int ky=0; ky<Kh; ++ky)
     618:	00100d93          	li	s11,1
      for (int t=0, c=0; c<Cin; ++c)
     61c:	00000713          	li	a4,0
     620:	00f12e23          	sw	a5,28(sp)
     624:	0e80006f          	j	70c <main+0x3dc>
              int oy = p / Wout, ox = p % Wout;
     628:	00600593          	li	a1,6
     62c:	000d0513          	mv	a0,s10
     630:	05f12e23          	sw	t6,92(sp)
     634:	05e12c23          	sw	t5,88(sp)
     638:	05d12a23          	sw	t4,84(sp)
     63c:	05c12823          	sw	t3,80(sp)
     640:	04512623          	sw	t0,76(sp)
     644:	04c12423          	sw	a2,72(sp)
     648:	04e12223          	sw	a4,68(sp)
     64c:	04d12023          	sw	a3,64(sp)
     650:	02f12e23          	sw	a5,60(sp)
     654:	6fc0e0ef          	jal	ed50 <__divsi3>
              int iy = oy*Stride - Pad + ky;
     658:	03c12783          	lw	a5,60(sp)
  return (int8_t)(((c+1)*(y+2) + (x)) & 0x0F) - 8; /* small ranged pattern */
     65c:	000d8593          	mv	a1,s11
              int iy = oy*Stride - Pad + ky;
     660:	00f50533          	add	a0,a0,a5
  return (int8_t)(((c+1)*(y+2) + (x)) & 0x0F) - 8; /* small ranged pattern */
     664:	00250513          	add	a0,a0,2
     668:	62c0e0ef          	jal	ec94 <__mulsi3>
     66c:	00050413          	mv	s0,a0
              int oy = p / Wout, ox = p % Wout;
     670:	00600593          	li	a1,6
     674:	000d0513          	mv	a0,s10
     678:	75c0e0ef          	jal	edd4 <__modsi3>
              int ix = ox*Stride - Pad + kx;
     67c:	01550533          	add	a0,a0,s5
              B_flat[t*LDB + col] = a;
     680:	04c12283          	lw	t0,76(sp)
  return (int8_t)(((c+1)*(y+2) + (x)) & 0x0F) - 8; /* small ranged pattern */
     684:	00a40433          	add	s0,s0,a0
     688:	00f47413          	and	s0,s0,15
            for (int col=0; col<4; ++col){
     68c:	01c12583          	lw	a1,28(sp)
  return (int8_t)(((c+1)*(y+2) + (x)) & 0x0F) - 8; /* small ranged pattern */
     690:	ff840413          	add	s0,s0,-8
              B_flat[t*LDB + col] = a;
     694:	00828023          	sb	s0,0(t0)
            for (int col=0; col<4; ++col){
     698:	001d0d13          	add	s10,s10,1
     69c:	03c12783          	lw	a5,60(sp)
     6a0:	04012683          	lw	a3,64(sp)
     6a4:	04412703          	lw	a4,68(sp)
     6a8:	04812603          	lw	a2,72(sp)
     6ac:	05012e03          	lw	t3,80(sp)
     6b0:	05412e83          	lw	t4,84(sp)
     6b4:	05812f03          	lw	t5,88(sp)
     6b8:	05c12f83          	lw	t6,92(sp)
     6bc:	00128293          	add	t0,t0,1
     6c0:	00300393          	li	t2,3
     6c4:	f7a592e3          	bne	a1,s10,628 <main+0x2f8>
          for (int kx=0; kx<Kw; ++kx, ++t){
     6c8:	001a8a93          	add	s5,s5,1
     6cc:	00460613          	add	a2,a2,4
     6d0:	007a8a63          	beq	s5,t2,6e4 <main+0x3b4>
            for (int col=0; col<4; ++col){
     6d4:	02812583          	lw	a1,40(sp)
      for (int t=0, c=0; c<Cin; ++c)
     6d8:	000a0d13          	mv	s10,s4
     6dc:	00c582b3          	add	t0,a1,a2
     6e0:	f49ff06f          	j	628 <main+0x2f8>
        for (int ky=0; ky<Kh; ++ky)
     6e4:	00178793          	add	a5,a5,1
     6e8:	00368693          	add	a3,a3,3
     6ec:	01578863          	beq	a5,s5,6fc <main+0x3cc>
          for (int kx=0; kx<Kw; ++kx, ++t){
     6f0:	00269613          	sll	a2,a3,0x2
     6f4:	00000a93          	li	s5,0
     6f8:	fddff06f          	j	6d4 <main+0x3a4>
      for (int t=0, c=0; c<Cin; ++c)
     6fc:	001d8d93          	add	s11,s11,1
     700:	00500793          	li	a5,5
     704:	00970713          	add	a4,a4,9
     708:	00fd8863          	beq	s11,a5,718 <main+0x3e8>
          for (int kx=0; kx<Kw; ++kx, ++t){
     70c:	00070693          	mv	a3,a4
        for (int ky=0; ky<Kh; ++ky)
     710:	00000793          	li	a5,0
     714:	fddff06f          	j	6f0 <main+0x3c0>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     718:	ffeb07b7          	lui	a5,0xffeb0
     71c:	00200713          	li	a4,2
     720:	00e7a023          	sw	a4,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
      int k=(t+s)-i; if (k>=0 && k<K) a_bytes[i][s]=A_flat[i*LDA+k];
     724:	02300513          	li	a0,35
  for (int t=0; t<T; t+=4){
     728:	00000793          	li	a5,0
    for (int i=0;i<TILE;i++) for (int s=0;s<4;s++){
     72c:	00400713          	li	a4,4
    int steps=(t+4<=T)?4:(T-t); for (int s=0;s<steps;s++) cfs_step();
     730:	02600393          	li	t2,38
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     734:	ffeb0ab7          	lui	s5,0xffeb0
  for (int t=0; t<T; t+=4){
     738:	02c00293          	li	t0,44
    int8_t a_bytes[TILE][4]={{0}}, b_bytes[TILE][4]={{0}};
     73c:	800016b7          	lui	a3,0x80001
     740:	06012023          	sw	zero,96(sp)
     744:	06012223          	sw	zero,100(sp)
     748:	06012423          	sw	zero,104(sp)
     74c:	06012623          	sw	zero,108(sp)
     750:	06012823          	sw	zero,112(sp)
     754:	06012a23          	sw	zero,116(sp)
     758:	06012c23          	sw	zero,120(sp)
     75c:	06012e23          	sw	zero,124(sp)
    for (int i=0;i<TILE;i++) for (int s=0;s<4;s++){
     760:	06010093          	add	ra,sp,96
    int8_t a_bytes[TILE][4]={{0}}, b_bytes[TILE][4]={{0}};
     764:	b3468413          	add	s0,a3,-1228 # 80000b34 <A_flat.1>
    for (int i=0;i<TILE;i++) for (int s=0;s<4;s++){
     768:	00000593          	li	a1,0
     76c:	40b78633          	sub	a2,a5,a1
     770:	00000693          	li	a3,0
      int k=(t+s)-i; if (k>=0 && k<K) a_bytes[i][s]=A_flat[i*LDA+k];
     774:	00c56a63          	bltu	a0,a2,788 <main+0x458>
     778:	00c40db3          	add	s11,s0,a2
     77c:	000dcd83          	lbu	s11,0(s11)
     780:	00d08d33          	add	s10,ra,a3
     784:	01bd0023          	sb	s11,0(s10)
    for (int i=0;i<TILE;i++) for (int s=0;s<4;s++){
     788:	00168693          	add	a3,a3,1
     78c:	00160613          	add	a2,a2,1
     790:	fee692e3          	bne	a3,a4,774 <main+0x444>
     794:	00158593          	add	a1,a1,1
     798:	10040413          	add	s0,s0,256
     79c:	00408093          	add	ra,ra,4
     7a0:	fce596e3          	bne	a1,a4,76c <main+0x43c>
     7a4:	07010593          	add	a1,sp,112
    for (int j=0;j<TILE;j++) for (int s=0;s<4;s++){
     7a8:	00000413          	li	s0,0
      int k=(t+s)-j; if (k>=0 && k<K) b_bytes[j][s]=B_flat[k*LDB+j];
     7ac:	02812803          	lw	a6,40(sp)
     7b0:	40878633          	sub	a2,a5,s0
    for (int j=0;j<TILE;j++) for (int s=0;s<4;s++){
     7b4:	00000693          	li	a3,0
      int k=(t+s)-j; if (k>=0 && k<K) b_bytes[j][s]=B_flat[k*LDB+j];
     7b8:	00880db3          	add	s11,a6,s0
     7bc:	00c56c63          	bltu	a0,a2,7d4 <main+0x4a4>
     7c0:	00261093          	sll	ra,a2,0x2
     7c4:	001d80b3          	add	ra,s11,ra
     7c8:	0000c083          	lbu	ra,0(ra)
     7cc:	00d58d33          	add	s10,a1,a3
     7d0:	001d0023          	sb	ra,0(s10)
    for (int j=0;j<TILE;j++) for (int s=0;s<4;s++){
     7d4:	00168693          	add	a3,a3,1
     7d8:	00160613          	add	a2,a2,1
     7dc:	fee690e3          	bne	a3,a4,7bc <main+0x48c>
     7e0:	00140413          	add	s0,s0,1
     7e4:	00458593          	add	a1,a1,4
     7e8:	fce412e3          	bne	s0,a4,7ac <main+0x47c>
         (((uint32_t)(uint8_t)x2) << 16) |
     7ec:	06012683          	lw	a3,96(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7f0:	00200613          	li	a2,2
     7f4:	00dba023          	sw	a3,0(s7)
         (((uint32_t)(uint8_t)x2) << 16) |
     7f8:	06412683          	lw	a3,100(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7fc:	00dc2023          	sw	a3,0(s8)
         (((uint32_t)(uint8_t)x2) << 16) |
     800:	06812683          	lw	a3,104(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     804:	00d4a023          	sw	a3,0(s1)
         (((uint32_t)(uint8_t)x2) << 16) |
     808:	06c12683          	lw	a3,108(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     80c:	00d92023          	sw	a3,0(s2)
         (((uint32_t)(uint8_t)x2) << 16) |
     810:	07012683          	lw	a3,112(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     814:	00dca023          	sw	a3,0(s9)
         (((uint32_t)(uint8_t)x2) << 16) |
     818:	07412683          	lw	a3,116(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     81c:	00de2023          	sw	a3,0(t3)
         (((uint32_t)(uint8_t)x2) << 16) |
     820:	07812683          	lw	a3,120(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     824:	00dea023          	sw	a3,0(t4)
         (((uint32_t)(uint8_t)x2) << 16) |
     828:	07c12683          	lw	a3,124(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     82c:	00df2023          	sw	a3,0(t5)
    int steps=(t+4<=T)?4:(T-t); for (int s=0;s<steps;s++) cfs_step();
     830:	00f3c463          	blt	t2,a5,838 <main+0x508>
     834:	00400613          	li	a2,4
     838:	00000693          	li	a3,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     83c:	00100593          	li	a1,1
     840:	00baa023          	sw	a1,0(s5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
    int steps=(t+4<=T)?4:(T-t); for (int s=0;s<steps;s++) cfs_step();
     844:	00168693          	add	a3,a3,1
     848:	fec69ae3          	bne	a3,a2,83c <main+0x50c>
  for (int t=0; t<T; t+=4){
     84c:	00478793          	add	a5,a5,4
     850:	ee5796e3          	bne	a5,t0,73c <main+0x40c>
     854:	08010d13          	add	s10,sp,128
     858:	000d0613          	mv	a2,s10
     85c:	00000713          	li	a4,0
  for (int i=0;i<4;i++) for (int j=0;j<4;j++)
     860:	01000593          	li	a1,16
     864:	00271693          	sll	a3,a4,0x2
    dst[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     868:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     86c:	01f686b3          	add	a3,a3,t6
     870:	00f68533          	add	a0,a3,a5
     874:	00052283          	lw	t0,0(a0)
    dst[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     878:	00f60533          	add	a0,a2,a5
  for (int i=0;i<4;i++) for (int j=0;j<4;j++)
     87c:	00478793          	add	a5,a5,4
    dst[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     880:	00552023          	sw	t0,0(a0)
  for (int i=0;i<4;i++) for (int j=0;j<4;j++)
     884:	feb796e3          	bne	a5,a1,870 <main+0x540>
     888:	00470713          	add	a4,a4,4
     88c:	01060613          	add	a2,a2,16
     890:	fcf71ae3          	bne	a4,a5,864 <main+0x534>
     894:	040d0693          	add	a3,s10,64
     898:	00098793          	mv	a5,s3
          Y[oc][oy][ox] = v; /* keep int32 */
     89c:	000d0713          	mv	a4,s10
     8a0:	000a0a93          	mv	s5,s4
          int oy = p / Wout, ox = p % Wout;
     8a4:	00600593          	li	a1,6
     8a8:	000a8513          	mv	a0,s5
     8ac:	05f12a23          	sw	t6,84(sp)
     8b0:	05e12823          	sw	t5,80(sp)
     8b4:	05d12623          	sw	t4,76(sp)
     8b8:	05c12423          	sw	t3,72(sp)
     8bc:	04d12223          	sw	a3,68(sp)
     8c0:	04f12023          	sw	a5,64(sp)
     8c4:	02e12e23          	sw	a4,60(sp)
     8c8:	4880e0ef          	jal	ed50 <__divsi3>
     8cc:	00050d93          	mv	s11,a0
     8d0:	00600593          	li	a1,6
     8d4:	000a8513          	mv	a0,s5
     8d8:	4fc0e0ef          	jal	edd4 <__modsi3>
          Y[oc][oy][ox] = v; /* keep int32 */
     8dc:	03c12703          	lw	a4,60(sp)
     8e0:	001d9613          	sll	a2,s11,0x1
     8e4:	01b60633          	add	a2,a2,s11
     8e8:	04012783          	lw	a5,64(sp)
     8ec:	00161613          	sll	a2,a2,0x1
     8f0:	00072583          	lw	a1,0(a4)
     8f4:	00a60633          	add	a2,a2,a0
     8f8:	00261613          	sll	a2,a2,0x2
     8fc:	00c78633          	add	a2,a5,a2
     900:	00b62023          	sw	a1,0(a2)
        for (int col=0; col<4; ++col){
     904:	01c12603          	lw	a2,28(sp)
     908:	001a8a93          	add	s5,s5,1
     90c:	04412683          	lw	a3,68(sp)
     910:	04812e03          	lw	t3,72(sp)
     914:	04c12e83          	lw	t4,76(sp)
     918:	05012f03          	lw	t5,80(sp)
     91c:	05412f83          	lw	t6,84(sp)
     920:	00470713          	add	a4,a4,4
     924:	f8ca90e3          	bne	s5,a2,8a4 <main+0x574>
      for (int r=0; r<4; ++r){
     928:	010d0d13          	add	s10,s10,16
     92c:	09078793          	add	a5,a5,144
     930:	f6dd16e3          	bne	s10,a3,89c <main+0x56c>
    for (int p0=0; p0 < Hout*Wout; p0+=4){
     934:	02400793          	li	a5,36
     938:	000a8a13          	mv	s4,s5
     93c:	ccfa9ce3          	bne	s5,a5,614 <main+0x2e4>
  for (int oc0=0; oc0<Cout; oc0+=4){
     940:	00400793          	li	a5,4
     944:	24098993          	add	s3,s3,576
     948:	00fb0663          	beq	s6,a5,954 <main+0x624>
     94c:	00040b13          	mv	s6,s0
     950:	bedff06f          	j	53c <main+0x20c>
  conv2d_cfs(Y_hw);
  i1=rdinstret(); c1=rdcycle();
     954:	8a5ff0ef          	jal	1f8 <rdinstret>
     958:	00050a93          	mv	s5,a0
     95c:	00058413          	mv	s0,a1
     960:	885ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     964:	02c12783          	lw	a5,44(sp)
  int mism=0;
     968:	00000d13          	li	s10,0
      for (int x=0; x<Wout; ++x)
     96c:	00600313          	li	t1,6
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     970:	40f50a33          	sub	s4,a0,a5
     974:	03012783          	lw	a5,48(sp)
     978:	01453533          	sltu	a0,a0,s4
    for (int y=0; y<Hout; ++y)
     97c:	09000e13          	li	t3,144
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     980:	40f589b3          	sub	s3,a1,a5
     984:	03412783          	lw	a5,52(sp)
     988:	40a989b3          	sub	s3,s3,a0
  for (int oc=0; oc<Cout; ++oc)
     98c:	48000e93          	li	t4,1152
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     990:	40fa8b33          	sub	s6,s5,a5
     994:	03812783          	lw	a5,56(sp)
     998:	016abab3          	sltu	s5,s5,s6
     99c:	40f40433          	sub	s0,s0,a5
     9a0:	41540433          	sub	s0,s0,s5
     9a4:	00000793          	li	a5,0
        if (A[oc][y][x]!=B[oc][y][x]) ++mism;
     9a8:	80001737          	lui	a4,0x80001
     9ac:	f3470713          	add	a4,a4,-204 # 80000f34 <Y_hw.2>
     9b0:	00e788b3          	add	a7,a5,a4
     9b4:	80001737          	lui	a4,0x80001
     9b8:	3b470713          	add	a4,a4,948 # 800013b4 <Y_sw.3>
     9bc:	00e78833          	add	a6,a5,a4
     9c0:	00000713          	li	a4,0
     9c4:	0300006f          	j	9f4 <main+0x6c4>
     9c8:	00d88533          	add	a0,a7,a3
     9cc:	00d805b3          	add	a1,a6,a3
     9d0:	00052503          	lw	a0,0(a0)
     9d4:	0005a583          	lw	a1,0(a1)
     9d8:	00b50463          	beq	a0,a1,9e0 <main+0x6b0>
     9dc:	001d0d13          	add	s10,s10,1
      for (int x=0; x<Wout; ++x)
     9e0:	00160613          	add	a2,a2,1
     9e4:	00468693          	add	a3,a3,4
     9e8:	fe6610e3          	bne	a2,t1,9c8 <main+0x698>
    for (int y=0; y<Hout; ++y)
     9ec:	01870713          	add	a4,a4,24
     9f0:	01c70863          	beq	a4,t3,a00 <main+0x6d0>
  for (int oc0=0; oc0<Cout; oc0+=4){
     9f4:	00070693          	mv	a3,a4
      for (int x=0; x<Wout; ++x)
     9f8:	00000613          	li	a2,0
     9fc:	fcdff06f          	j	9c8 <main+0x698>
  for (int oc=0; oc<Cout; ++oc)
     a00:	09078793          	add	a5,a5,144
     a04:	fbd792e3          	bne	a5,t4,9a8 <main+0x678>

  int mism = compare_outputs(Y_hw, Y_sw);
  long long sum_sw  = checksum(Y_sw);
     a08:	80001537          	lui	a0,0x80001
     a0c:	3b450513          	add	a0,a0,948 # 800013b4 <Y_sw.3>
     a10:	ffcff0ef          	jal	20c <checksum>
     a14:	00050c93          	mv	s9,a0
  long long sum_cfs = checksum(Y_hw);
     a18:	80001537          	lui	a0,0x80001
     a1c:	f3450513          	add	a0,a0,-204 # 80000f34 <Y_hw.2>
  long long sum_sw  = checksum(Y_sw);
     a20:	00058c13          	mv	s8,a1
  long long sum_cfs = checksum(Y_hw);
     a24:	fe8ff0ef          	jal	20c <checksum>
     a28:	00050b93          	mv	s7,a0

  printf("Conv2D params: HxW=%dx%d, Cin=%d, Cout=%d, KhxKw=%dx%d, stride=%d, pad=%d\n",
     a2c:	0000f537          	lui	a0,0xf
     a30:	00100893          	li	a7,1
     a34:	00300813          	li	a6,3
     a38:	00300793          	li	a5,3
     a3c:	00800713          	li	a4,8
  long long sum_cfs = checksum(Y_hw);
     a40:	00058a93          	mv	s5,a1
  printf("Conv2D params: HxW=%dx%d, Cin=%d, Cout=%d, KhxKw=%dx%d, stride=%d, pad=%d\n",
     a44:	00400693          	li	a3,4
     a48:	00800613          	li	a2,8
     a4c:	00800593          	li	a1,8
     a50:	00012023          	sw	zero,0(sp)
     a54:	edc50513          	add	a0,a0,-292 # eedc <__fini_array_end+0x50>
     a58:	3f0000ef          	jal	e48 <printf>
         H,W,Cin,Cout,Kh,Kw,Stride,Pad);
  printf("Output: %dx%dx%d (Hout x Wout x Cout)\n\n", Hout, Wout, Cout);
     a5c:	0000f537          	lui	a0,0xf
     a60:	00600593          	li	a1,6
     a64:	00800693          	li	a3,8
     a68:	00600613          	li	a2,6
     a6c:	f2850513          	add	a0,a0,-216 # ef28 <__fini_array_end+0x9c>
     a70:	3d8000ef          	jal	e48 <printf>

  printf("Path |   cycles   |  instret   |  Speedup(cyc) | Speedup(inst) |  checksum\n");
     a74:	0000f537          	lui	a0,0xf
     a78:	f5050513          	add	a0,a0,-176 # ef50 <__fini_array_end+0xc4>
     a7c:	548000ef          	jal	fc4 <puts>
  printf("-----+------------+------------+---------------+---------------+-----------\n");
     a80:	0000f537          	lui	a0,0xf
     a84:	f9c50513          	add	a0,a0,-100 # ef9c <__fini_array_end+0x110>
     a88:	53c000ef          	jal	fc4 <puts>
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |       --      |       --      | %9lld\n",
     a8c:	01812703          	lw	a4,24(sp)
     a90:	02412783          	lw	a5,36(sp)
     a94:	01412603          	lw	a2,20(sp)
     a98:	02012683          	lw	a3,32(sp)
     a9c:	0000f537          	lui	a0,0xf
     aa0:	000c8813          	mv	a6,s9
     aa4:	000c0893          	mv	a7,s8
     aa8:	fe850513          	add	a0,a0,-24 # efe8 <__fini_array_end+0x15c>
     aac:	39c000ef          	jal	e48 <printf>
         sw_cyc, sw_ins, sum_sw);
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |    ", cfs_cyc, cfs_ins);
     ab0:	0000f537          	lui	a0,0xf
     ab4:	000b0713          	mv	a4,s6
     ab8:	00040793          	mv	a5,s0
     abc:	000a0613          	mv	a2,s4
     ac0:	00098693          	mv	a3,s3
     ac4:	02850513          	add	a0,a0,40 # f028 <__fini_array_end+0x19c>
     ac8:	380000ef          	jal	e48 <printf>
  print_speedup_fixed(sw_cyc, cfs_cyc); printf("     |    ");
     acc:	02012583          	lw	a1,32(sp)
     ad0:	01412503          	lw	a0,20(sp)
     ad4:	000a0613          	mv	a2,s4
     ad8:	00098693          	mv	a3,s3
     adc:	f90ff0ef          	jal	26c <print_speedup_fixed>
     ae0:	0000f537          	lui	a0,0xf
     ae4:	04850513          	add	a0,a0,72 # f048 <__fini_array_end+0x1bc>
     ae8:	360000ef          	jal	e48 <printf>
  print_speedup_fixed(sw_ins, cfs_ins); printf("     | %9lld\n\n", sum_cfs);
     aec:	01812503          	lw	a0,24(sp)
     af0:	02412583          	lw	a1,36(sp)
     af4:	000b0613          	mv	a2,s6
     af8:	00040693          	mv	a3,s0
     afc:	f70ff0ef          	jal	26c <print_speedup_fixed>
     b00:	0000f537          	lui	a0,0xf
     b04:	000b8613          	mv	a2,s7
     b08:	000a8693          	mv	a3,s5
     b0c:	05450513          	add	a0,a0,84 # f054 <__fini_array_end+0x1c8>
     b10:	338000ef          	jal	e48 <printf>

  printf("Verdict: %s (%d mismatches)\n", (mism==0) ? "PASS" : "FAIL", mism);
     b14:	080d1e63          	bnez	s10,bb0 <main+0x880>
     b18:	0000f5b7          	lui	a1,0xf
     b1c:	ea458593          	add	a1,a1,-348 # eea4 <__fini_array_end+0x18>
     b20:	0000f537          	lui	a0,0xf
     b24:	000d0613          	mv	a2,s10
     b28:	06450513          	add	a0,a0,100 # f064 <__fini_array_end+0x1d8>
     b2c:	31c000ef          	jal	e48 <printf>
  printf("\nNotes:\n");
     b30:	0000f537          	lui	a0,0xf
     b34:	08450513          	add	a0,a0,132 # f084 <__fini_array_end+0x1f8>
     b38:	48c000ef          	jal	fc4 <puts>
  printf("- K for each CFS call is Cin*Kh*Kw = %d.\n", KCONV);
     b3c:	0000f537          	lui	a0,0xf
     b40:	02400593          	li	a1,36
     b44:	08c50513          	add	a0,a0,140 # f08c <__fini_array_end+0x200>
     b48:	300000ef          	jal	e48 <printf>
  printf("- We compute 4 output channels × 4 output pixels per CFS run.\n");
     b4c:	0000f537          	lui	a0,0xf
     b50:	0b850513          	add	a0,a0,184 # f0b8 <__fini_array_end+0x22c>
     b54:	470000ef          	jal	fc4 <puts>
  printf("- Add bias/relu/requant where noted; keep int32 to avoid overflow.\n");
     b58:	0000f537          	lui	a0,0xf
     b5c:	0f850513          	add	a0,a0,248 # f0f8 <__fini_array_end+0x26c>
     b60:	464000ef          	jal	fc4 <puts>
  printf("- For bigger layers, loop over tiles exactly like this (just bigger H,W,Cin,Cout).\n");
     b64:	0000f537          	lui	a0,0xf
     b68:	13c50513          	add	a0,a0,316 # f13c <__fini_array_end+0x2b0>
     b6c:	458000ef          	jal	fc4 <puts>
  return (mism==0) ? 0 : 1;
}
     b70:	0fc12083          	lw	ra,252(sp)
     b74:	0f812403          	lw	s0,248(sp)
     b78:	0f412483          	lw	s1,244(sp)
     b7c:	0f012903          	lw	s2,240(sp)
     b80:	0ec12983          	lw	s3,236(sp)
     b84:	0e812a03          	lw	s4,232(sp)
     b88:	0e412a83          	lw	s5,228(sp)
     b8c:	0e012b03          	lw	s6,224(sp)
     b90:	0dc12b83          	lw	s7,220(sp)
     b94:	0d812c03          	lw	s8,216(sp)
     b98:	0d412c83          	lw	s9,212(sp)
     b9c:	0cc12d83          	lw	s11,204(sp)
     ba0:	01a03533          	snez	a0,s10
     ba4:	0d012d03          	lw	s10,208(sp)
     ba8:	10010113          	add	sp,sp,256
     bac:	00008067          	ret
  printf("Verdict: %s (%d mismatches)\n", (mism==0) ? "PASS" : "FAIL", mism);
     bb0:	0000f5b7          	lui	a1,0xf
     bb4:	eac58593          	add	a1,a1,-340 # eeac <__fini_array_end+0x20>
     bb8:	f69ff06f          	j	b20 <main+0x7f0>

00000bbc <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     bbc:	fffff097          	auipc	ra,0xfffff
     bc0:	59c08093          	add	ra,ra,1436 # 158 <__crt0_main_exit>
     bc4:	00050513          	mv	a0,a0
     bc8:	00008067          	ret

00000bcc <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     bcc:	fff00513          	li	a0,-1
     bd0:	00008067          	ret

00000bd4 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     bd4:	000027b7          	lui	a5,0x2
     bd8:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     bdc:	00000513          	li	a0,0
     be0:	00008067          	ret

00000be4 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     be4:	00100513          	li	a0,1
     be8:	00008067          	ret

00000bec <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     bec:	00100513          	li	a0,1
     bf0:	00008067          	ret

00000bf4 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     bf4:	800007b7          	lui	a5,0x80000
     bf8:	01600713          	li	a4,22
     bfc:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     c00:	fff00513          	li	a0,-1
     c04:	00008067          	ret

00000c08 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     c08:	00000513          	li	a0,0
     c0c:	00008067          	ret

00000c10 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     c10:	fe010113          	add	sp,sp,-32
     c14:	00912a23          	sw	s1,20(sp)
     c18:	01212823          	sw	s2,16(sp)
     c1c:	00112e23          	sw	ra,28(sp)
     c20:	00812c23          	sw	s0,24(sp)
     c24:	01312623          	sw	s3,12(sp)
     c28:	01412423          	sw	s4,8(sp)
     c2c:	00058913          	mv	s2,a1
     c30:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     c34:	06051463          	bnez	a0,c9c <_read+0x8c>
     c38:	00050413          	mv	s0,a0
     c3c:	fff50537          	lui	a0,0xfff50
     c40:	1a0000ef          	jal	de0 <neorv32_uart_available>
     c44:	04050c63          	beqz	a0,c9c <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c48:	00a00993          	li	s3,10
     c4c:	00d00a13          	li	s4,13
    while (len--) {
     c50:	00941663          	bne	s0,s1,c5c <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     c54:	00048413          	mv	s0,s1
     c58:	0200006f          	j	c78 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     c5c:	fff50537          	lui	a0,0xfff50
     c60:	1d0000ef          	jal	e30 <neorv32_uart_getc>
      *ptr++ = c;
     c64:	008907b3          	add	a5,s2,s0
     c68:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     c6c:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c70:	01350463          	beq	a0,s3,c78 <_read+0x68>
     c74:	fd451ee3          	bne	a0,s4,c50 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     c78:	01c12083          	lw	ra,28(sp)
     c7c:	00040513          	mv	a0,s0
     c80:	01812403          	lw	s0,24(sp)
     c84:	01412483          	lw	s1,20(sp)
     c88:	01012903          	lw	s2,16(sp)
     c8c:	00c12983          	lw	s3,12(sp)
     c90:	00812a03          	lw	s4,8(sp)
     c94:	02010113          	add	sp,sp,32
     c98:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     c9c:	fff60537          	lui	a0,0xfff60
     ca0:	140000ef          	jal	de0 <neorv32_uart_available>
  int read_cnt = 0;
     ca4:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     ca8:	02050863          	beqz	a0,cd8 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     cac:	00a00993          	li	s3,10
     cb0:	00d00a13          	li	s4,13
    while (len--) {
     cb4:	fa9400e3          	beq	s0,s1,c54 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     cb8:	fff60537          	lui	a0,0xfff60
     cbc:	174000ef          	jal	e30 <neorv32_uart_getc>
      *ptr++ = c;
     cc0:	008907b3          	add	a5,s2,s0
     cc4:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     cc8:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     ccc:	fb3506e3          	beq	a0,s3,c78 <_read+0x68>
     cd0:	ff4512e3          	bne	a0,s4,cb4 <_read+0xa4>
     cd4:	fa5ff06f          	j	c78 <_read+0x68>
    errno = ENOSYS;
     cd8:	800007b7          	lui	a5,0x80000
     cdc:	05800713          	li	a4,88
     ce0:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     ce4:	fff00413          	li	s0,-1
     ce8:	f91ff06f          	j	c78 <_read+0x68>

00000cec <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     cec:	ff010113          	add	sp,sp,-16
     cf0:	00812423          	sw	s0,8(sp)
     cf4:	00912223          	sw	s1,4(sp)
     cf8:	00112623          	sw	ra,12(sp)
     cfc:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     d00:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     d04:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     d08:	00058413          	mv	s0,a1
     d0c:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     d10:	04a7ec63          	bltu	a5,a0,d68 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     d14:	fff50537          	lui	a0,0xfff50
     d18:	0c8000ef          	jal	de0 <neorv32_uart_available>
     d1c:	00940933          	add	s2,s0,s1
     d20:	02051463          	bnez	a0,d48 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     d24:	800007b7          	lui	a5,0x80000
     d28:	05800713          	li	a4,88
     d2c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     d30:	fff00493          	li	s1,-1
     d34:	0180006f          	j	d4c <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     d38:	00044583          	lbu	a1,0(s0)
     d3c:	fff50537          	lui	a0,0xfff50
     d40:	00140413          	add	s0,s0,1
     d44:	0d8000ef          	jal	e1c <neorv32_uart_putc>
      while (len--) {
     d48:	fe8918e3          	bne	s2,s0,d38 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     d4c:	00c12083          	lw	ra,12(sp)
     d50:	00812403          	lw	s0,8(sp)
     d54:	00012903          	lw	s2,0(sp)
     d58:	00048513          	mv	a0,s1
     d5c:	00412483          	lw	s1,4(sp)
     d60:	01010113          	add	sp,sp,16
     d64:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     d68:	fff60537          	lui	a0,0xfff60
     d6c:	074000ef          	jal	de0 <neorv32_uart_available>
     d70:	00940933          	add	s2,s0,s1
     d74:	fa0508e3          	beqz	a0,d24 <_write+0x38>
    while (len--) {
     d78:	fd240ae3          	beq	s0,s2,d4c <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     d7c:	00044583          	lbu	a1,0(s0)
     d80:	fff60537          	lui	a0,0xfff60
     d84:	00140413          	add	s0,s0,1
     d88:	094000ef          	jal	e1c <neorv32_uart_putc>
      write_cnt++;
     d8c:	fedff06f          	j	d78 <_write+0x8c>

00000d90 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     d90:	80000737          	lui	a4,0x80000
     d94:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     d98:	80002637          	lui	a2,0x80002
void *_sbrk(int incr) {
     d9c:	00050793          	mv	a5,a0
     da0:	99460613          	add	a2,a2,-1644 # 80001994 <__crt0_bss_end>
  if (curr_heap == NULL) {
     da4:	00069463          	bnez	a3,dac <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     da8:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     dac:	800026b7          	lui	a3,0x80002
     db0:	99468693          	add	a3,a3,-1644 # 80001994 <__crt0_bss_end>
     db4:	00c69c63          	bne	a3,a2,dcc <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     db8:	800007b7          	lui	a5,0x80000
     dbc:	00c00713          	li	a4,12
     dc0:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     dc4:	fff00513          	li	a0,-1
     dc8:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     dcc:	71472503          	lw	a0,1812(a4)
     dd0:	00f507b3          	add	a5,a0,a5
     dd4:	fed7f2e3          	bgeu	a5,a3,db8 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     dd8:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     ddc:	00008067          	ret

00000de0 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     de0:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     de4:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     de8:	00e51c63          	bne	a0,a4,e00 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     dec:	fffe07b7          	lui	a5,0xfffe0
     df0:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     df4:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     df8:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     dfc:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     e00:	fff60737          	lui	a4,0xfff60
    return 0;
     e04:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     e08:	fee79ae3          	bne	a5,a4,dfc <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     e0c:	fffe07b7          	lui	a5,0xfffe0
     e10:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     e14:	020007b7          	lui	a5,0x2000
     e18:	fe1ff06f          	j	df8 <neorv32_uart_available+0x18>

00000e1c <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     e1c:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     e20:	00a79713          	sll	a4,a5,0xa
     e24:	fe075ce3          	bgez	a4,e1c <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     e28:	00b52223          	sw	a1,4(a0)
}
     e2c:	00008067          	ret

00000e30 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     e30:	00052783          	lw	a5,0(a0)
     e34:	00f79713          	sll	a4,a5,0xf
     e38:	fe075ce3          	bgez	a4,e30 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     e3c:	00452503          	lw	a0,4(a0)
}
     e40:	0ff57513          	zext.b	a0,a0
     e44:	00008067          	ret

00000e48 <printf>:
     e48:	fc010113          	add	sp,sp,-64
     e4c:	02c12423          	sw	a2,40(sp)
     e50:	02d12623          	sw	a3,44(sp)
     e54:	80000317          	auipc	t1,0x80000
     e58:	8b432303          	lw	t1,-1868(t1) # 80000708 <_impure_ptr>
     e5c:	02b12223          	sw	a1,36(sp)
     e60:	02e12823          	sw	a4,48(sp)
     e64:	02f12a23          	sw	a5,52(sp)
     e68:	03012c23          	sw	a6,56(sp)
     e6c:	03112e23          	sw	a7,60(sp)
     e70:	00832583          	lw	a1,8(t1)
     e74:	02410693          	add	a3,sp,36
     e78:	00050613          	mv	a2,a0
     e7c:	00030513          	mv	a0,t1
     e80:	00112e23          	sw	ra,28(sp)
     e84:	00d12623          	sw	a3,12(sp)
     e88:	0b0010ef          	jal	1f38 <_vfprintf_r>
     e8c:	01c12083          	lw	ra,28(sp)
     e90:	04010113          	add	sp,sp,64
     e94:	00008067          	ret

00000e98 <_puts_r>:
     e98:	fd010113          	add	sp,sp,-48
     e9c:	02812423          	sw	s0,40(sp)
     ea0:	00050413          	mv	s0,a0
     ea4:	00058513          	mv	a0,a1
     ea8:	02912223          	sw	s1,36(sp)
     eac:	02112623          	sw	ra,44(sp)
     eb0:	00058493          	mv	s1,a1
     eb4:	3b0000ef          	jal	1264 <strlen>
     eb8:	00150713          	add	a4,a0,1
     ebc:	0000e697          	auipc	a3,0xe
     ec0:	1f868693          	add	a3,a3,504 # f0b4 <__fini_array_end+0x228>
     ec4:	00e12623          	sw	a4,12(sp)
     ec8:	03442783          	lw	a5,52(s0)
     ecc:	01010713          	add	a4,sp,16
     ed0:	00d12c23          	sw	a3,24(sp)
     ed4:	00e12223          	sw	a4,4(sp)
     ed8:	00100693          	li	a3,1
     edc:	00200713          	li	a4,2
     ee0:	00912823          	sw	s1,16(sp)
     ee4:	00a12a23          	sw	a0,20(sp)
     ee8:	00d12e23          	sw	a3,28(sp)
     eec:	00e12423          	sw	a4,8(sp)
     ef0:	00842483          	lw	s1,8(s0)
     ef4:	0c078263          	beqz	a5,fb8 <_puts_r+0x120>
     ef8:	0644a703          	lw	a4,100(s1)
     efc:	00c49783          	lh	a5,12(s1)
     f00:	00177713          	and	a4,a4,1
     f04:	00071663          	bnez	a4,f10 <_puts_r+0x78>
     f08:	2007f713          	and	a4,a5,512
     f0c:	08070e63          	beqz	a4,fa8 <_puts_r+0x110>
     f10:	01279713          	sll	a4,a5,0x12
     f14:	02074263          	bltz	a4,f38 <_puts_r+0xa0>
     f18:	0644a703          	lw	a4,100(s1)
     f1c:	ffffe6b7          	lui	a3,0xffffe
     f20:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     f24:	00002637          	lui	a2,0x2
     f28:	00c7e7b3          	or	a5,a5,a2
     f2c:	00d77733          	and	a4,a4,a3
     f30:	00f49623          	sh	a5,12(s1)
     f34:	06e4a223          	sw	a4,100(s1)
     f38:	00040513          	mv	a0,s0
     f3c:	00410613          	add	a2,sp,4
     f40:	00048593          	mv	a1,s1
     f44:	549050ef          	jal	6c8c <__sfvwrite_r>
     f48:	0644a783          	lw	a5,100(s1)
     f4c:	00153413          	seqz	s0,a0
     f50:	40800433          	neg	s0,s0
     f54:	00b47413          	and	s0,s0,11
     f58:	0017f793          	and	a5,a5,1
     f5c:	fff40413          	add	s0,s0,-1
     f60:	00079863          	bnez	a5,f70 <_puts_r+0xd8>
     f64:	00c4d783          	lhu	a5,12(s1)
     f68:	2007f793          	and	a5,a5,512
     f6c:	00078e63          	beqz	a5,f88 <_puts_r+0xf0>
     f70:	02c12083          	lw	ra,44(sp)
     f74:	00040513          	mv	a0,s0
     f78:	02812403          	lw	s0,40(sp)
     f7c:	02412483          	lw	s1,36(sp)
     f80:	03010113          	add	sp,sp,48
     f84:	00008067          	ret
     f88:	0584a503          	lw	a0,88(s1)
     f8c:	054000ef          	jal	fe0 <__retarget_lock_release_recursive>
     f90:	02c12083          	lw	ra,44(sp)
     f94:	00040513          	mv	a0,s0
     f98:	02812403          	lw	s0,40(sp)
     f9c:	02412483          	lw	s1,36(sp)
     fa0:	03010113          	add	sp,sp,48
     fa4:	00008067          	ret
     fa8:	0584a503          	lw	a0,88(s1)
     fac:	030000ef          	jal	fdc <__retarget_lock_acquire_recursive>
     fb0:	00c49783          	lh	a5,12(s1)
     fb4:	f5dff06f          	j	f10 <_puts_r+0x78>
     fb8:	00040513          	mv	a0,s0
     fbc:	449050ef          	jal	6c04 <__sinit>
     fc0:	f39ff06f          	j	ef8 <_puts_r+0x60>

00000fc4 <puts>:
     fc4:	00050593          	mv	a1,a0
     fc8:	7ffff517          	auipc	a0,0x7ffff
     fcc:	74052503          	lw	a0,1856(a0) # 80000708 <_impure_ptr>
     fd0:	ec9ff06f          	j	e98 <_puts_r>

00000fd4 <__retarget_lock_init_recursive>:
     fd4:	00008067          	ret

00000fd8 <__retarget_lock_close_recursive>:
     fd8:	00008067          	ret

00000fdc <__retarget_lock_acquire_recursive>:
     fdc:	00008067          	ret

00000fe0 <__retarget_lock_release_recursive>:
     fe0:	00008067          	ret

00000fe4 <memset>:
     fe4:	00f00313          	li	t1,15
     fe8:	00050713          	mv	a4,a0
     fec:	02c37e63          	bgeu	t1,a2,1028 <memset+0x44>
     ff0:	00f77793          	and	a5,a4,15
     ff4:	0a079063          	bnez	a5,1094 <memset+0xb0>
     ff8:	08059263          	bnez	a1,107c <memset+0x98>
     ffc:	ff067693          	and	a3,a2,-16
    1000:	00f67613          	and	a2,a2,15
    1004:	00e686b3          	add	a3,a3,a4
    1008:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
    100c:	00b72223          	sw	a1,4(a4)
    1010:	00b72423          	sw	a1,8(a4)
    1014:	00b72623          	sw	a1,12(a4)
    1018:	01070713          	add	a4,a4,16
    101c:	fed766e3          	bltu	a4,a3,1008 <memset+0x24>
    1020:	00061463          	bnez	a2,1028 <memset+0x44>
    1024:	00008067          	ret
    1028:	40c306b3          	sub	a3,t1,a2
    102c:	00269693          	sll	a3,a3,0x2
    1030:	00000297          	auipc	t0,0x0
    1034:	005686b3          	add	a3,a3,t0
    1038:	00c68067          	jr	12(a3)
    103c:	00b70723          	sb	a1,14(a4)
    1040:	00b706a3          	sb	a1,13(a4)
    1044:	00b70623          	sb	a1,12(a4)
    1048:	00b705a3          	sb	a1,11(a4)
    104c:	00b70523          	sb	a1,10(a4)
    1050:	00b704a3          	sb	a1,9(a4)
    1054:	00b70423          	sb	a1,8(a4)
    1058:	00b703a3          	sb	a1,7(a4)
    105c:	00b70323          	sb	a1,6(a4)
    1060:	00b702a3          	sb	a1,5(a4)
    1064:	00b70223          	sb	a1,4(a4)
    1068:	00b701a3          	sb	a1,3(a4)
    106c:	00b70123          	sb	a1,2(a4)
    1070:	00b700a3          	sb	a1,1(a4)
    1074:	00b70023          	sb	a1,0(a4)
    1078:	00008067          	ret
    107c:	0ff5f593          	zext.b	a1,a1
    1080:	00859693          	sll	a3,a1,0x8
    1084:	00d5e5b3          	or	a1,a1,a3
    1088:	01059693          	sll	a3,a1,0x10
    108c:	00d5e5b3          	or	a1,a1,a3
    1090:	f6dff06f          	j	ffc <memset+0x18>
    1094:	00279693          	sll	a3,a5,0x2
    1098:	00000297          	auipc	t0,0x0
    109c:	005686b3          	add	a3,a3,t0
    10a0:	00008293          	mv	t0,ra
    10a4:	fa0680e7          	jalr	-96(a3)
    10a8:	00028093          	mv	ra,t0
    10ac:	ff078793          	add	a5,a5,-16 # 1fffff0 <__neorv32_ram_size+0x1f7fff0>
    10b0:	40f70733          	sub	a4,a4,a5
    10b4:	00f60633          	add	a2,a2,a5
    10b8:	f6c378e3          	bgeu	t1,a2,1028 <memset+0x44>
    10bc:	f3dff06f          	j	ff8 <memset+0x14>

000010c0 <memcpy>:
    10c0:	00a5c7b3          	xor	a5,a1,a0
    10c4:	0037f793          	and	a5,a5,3
    10c8:	00c508b3          	add	a7,a0,a2
    10cc:	06079463          	bnez	a5,1134 <memcpy+0x74>
    10d0:	00300793          	li	a5,3
    10d4:	06c7f063          	bgeu	a5,a2,1134 <memcpy+0x74>
    10d8:	00357793          	and	a5,a0,3
    10dc:	00050713          	mv	a4,a0
    10e0:	06079a63          	bnez	a5,1154 <memcpy+0x94>
    10e4:	ffc8f613          	and	a2,a7,-4
    10e8:	40e606b3          	sub	a3,a2,a4
    10ec:	02000793          	li	a5,32
    10f0:	08d7ce63          	blt	a5,a3,118c <memcpy+0xcc>
    10f4:	00058693          	mv	a3,a1
    10f8:	00070793          	mv	a5,a4
    10fc:	02c77863          	bgeu	a4,a2,112c <memcpy+0x6c>
    1100:	0006a803          	lw	a6,0(a3)
    1104:	00478793          	add	a5,a5,4
    1108:	00468693          	add	a3,a3,4
    110c:	ff07ae23          	sw	a6,-4(a5)
    1110:	fec7e8e3          	bltu	a5,a2,1100 <memcpy+0x40>
    1114:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0xc7>
    1118:	40e787b3          	sub	a5,a5,a4
    111c:	ffc7f793          	and	a5,a5,-4
    1120:	00478793          	add	a5,a5,4
    1124:	00f70733          	add	a4,a4,a5
    1128:	00f585b3          	add	a1,a1,a5
    112c:	01176863          	bltu	a4,a7,113c <memcpy+0x7c>
    1130:	00008067          	ret
    1134:	00050713          	mv	a4,a0
    1138:	05157863          	bgeu	a0,a7,1188 <memcpy+0xc8>
    113c:	0005c783          	lbu	a5,0(a1)
    1140:	00170713          	add	a4,a4,1
    1144:	00158593          	add	a1,a1,1
    1148:	fef70fa3          	sb	a5,-1(a4)
    114c:	fee898e3          	bne	a7,a4,113c <memcpy+0x7c>
    1150:	00008067          	ret
    1154:	0005c683          	lbu	a3,0(a1)
    1158:	00170713          	add	a4,a4,1
    115c:	00377793          	and	a5,a4,3
    1160:	fed70fa3          	sb	a3,-1(a4)
    1164:	00158593          	add	a1,a1,1
    1168:	f6078ee3          	beqz	a5,10e4 <memcpy+0x24>
    116c:	0005c683          	lbu	a3,0(a1)
    1170:	00170713          	add	a4,a4,1
    1174:	00377793          	and	a5,a4,3
    1178:	fed70fa3          	sb	a3,-1(a4)
    117c:	00158593          	add	a1,a1,1
    1180:	fc079ae3          	bnez	a5,1154 <memcpy+0x94>
    1184:	f61ff06f          	j	10e4 <memcpy+0x24>
    1188:	00008067          	ret
    118c:	ff010113          	add	sp,sp,-16
    1190:	00812623          	sw	s0,12(sp)
    1194:	02000413          	li	s0,32
    1198:	0005a383          	lw	t2,0(a1)
    119c:	0045a283          	lw	t0,4(a1)
    11a0:	0085af83          	lw	t6,8(a1)
    11a4:	00c5af03          	lw	t5,12(a1)
    11a8:	0105ae83          	lw	t4,16(a1)
    11ac:	0145ae03          	lw	t3,20(a1)
    11b0:	0185a303          	lw	t1,24(a1)
    11b4:	01c5a803          	lw	a6,28(a1)
    11b8:	0205a683          	lw	a3,32(a1)
    11bc:	02470713          	add	a4,a4,36
    11c0:	40e607b3          	sub	a5,a2,a4
    11c4:	fc772e23          	sw	t2,-36(a4)
    11c8:	fe572023          	sw	t0,-32(a4)
    11cc:	fff72223          	sw	t6,-28(a4)
    11d0:	ffe72423          	sw	t5,-24(a4)
    11d4:	ffd72623          	sw	t4,-20(a4)
    11d8:	ffc72823          	sw	t3,-16(a4)
    11dc:	fe672a23          	sw	t1,-12(a4)
    11e0:	ff072c23          	sw	a6,-8(a4)
    11e4:	fed72e23          	sw	a3,-4(a4)
    11e8:	02458593          	add	a1,a1,36
    11ec:	faf446e3          	blt	s0,a5,1198 <memcpy+0xd8>
    11f0:	00058693          	mv	a3,a1
    11f4:	00070793          	mv	a5,a4
    11f8:	02c77863          	bgeu	a4,a2,1228 <memcpy+0x168>
    11fc:	0006a803          	lw	a6,0(a3)
    1200:	00478793          	add	a5,a5,4
    1204:	00468693          	add	a3,a3,4
    1208:	ff07ae23          	sw	a6,-4(a5)
    120c:	fec7e8e3          	bltu	a5,a2,11fc <memcpy+0x13c>
    1210:	fff60793          	add	a5,a2,-1
    1214:	40e787b3          	sub	a5,a5,a4
    1218:	ffc7f793          	and	a5,a5,-4
    121c:	00478793          	add	a5,a5,4
    1220:	00f70733          	add	a4,a4,a5
    1224:	00f585b3          	add	a1,a1,a5
    1228:	01176863          	bltu	a4,a7,1238 <memcpy+0x178>
    122c:	00c12403          	lw	s0,12(sp)
    1230:	01010113          	add	sp,sp,16
    1234:	00008067          	ret
    1238:	0005c783          	lbu	a5,0(a1)
    123c:	00170713          	add	a4,a4,1
    1240:	00158593          	add	a1,a1,1
    1244:	fef70fa3          	sb	a5,-1(a4)
    1248:	fee882e3          	beq	a7,a4,122c <memcpy+0x16c>
    124c:	0005c783          	lbu	a5,0(a1)
    1250:	00170713          	add	a4,a4,1
    1254:	00158593          	add	a1,a1,1
    1258:	fef70fa3          	sb	a5,-1(a4)
    125c:	fce89ee3          	bne	a7,a4,1238 <memcpy+0x178>
    1260:	fcdff06f          	j	122c <memcpy+0x16c>

00001264 <strlen>:
    1264:	00357793          	and	a5,a0,3
    1268:	00050713          	mv	a4,a0
    126c:	04079c63          	bnez	a5,12c4 <strlen+0x60>
    1270:	7f7f86b7          	lui	a3,0x7f7f8
    1274:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    1278:	fff00593          	li	a1,-1
    127c:	00072603          	lw	a2,0(a4)
    1280:	00470713          	add	a4,a4,4
    1284:	00d677b3          	and	a5,a2,a3
    1288:	00d787b3          	add	a5,a5,a3
    128c:	00c7e7b3          	or	a5,a5,a2
    1290:	00d7e7b3          	or	a5,a5,a3
    1294:	feb784e3          	beq	a5,a1,127c <strlen+0x18>
    1298:	ffc74683          	lbu	a3,-4(a4)
    129c:	40a707b3          	sub	a5,a4,a0
    12a0:	04068463          	beqz	a3,12e8 <strlen+0x84>
    12a4:	ffd74683          	lbu	a3,-3(a4)
    12a8:	02068c63          	beqz	a3,12e0 <strlen+0x7c>
    12ac:	ffe74503          	lbu	a0,-2(a4)
    12b0:	00a03533          	snez	a0,a0
    12b4:	00f50533          	add	a0,a0,a5
    12b8:	ffe50513          	add	a0,a0,-2
    12bc:	00008067          	ret
    12c0:	fa0688e3          	beqz	a3,1270 <strlen+0xc>
    12c4:	00074783          	lbu	a5,0(a4)
    12c8:	00170713          	add	a4,a4,1
    12cc:	00377693          	and	a3,a4,3
    12d0:	fe0798e3          	bnez	a5,12c0 <strlen+0x5c>
    12d4:	40a70733          	sub	a4,a4,a0
    12d8:	fff70513          	add	a0,a4,-1
    12dc:	00008067          	ret
    12e0:	ffd78513          	add	a0,a5,-3
    12e4:	00008067          	ret
    12e8:	ffc78513          	add	a0,a5,-4
    12ec:	00008067          	ret

000012f0 <_malloc_trim_r>:
    12f0:	fe010113          	add	sp,sp,-32
    12f4:	00812c23          	sw	s0,24(sp)
    12f8:	00912a23          	sw	s1,20(sp)
    12fc:	01212823          	sw	s2,16(sp)
    1300:	01312623          	sw	s3,12(sp)
    1304:	01412423          	sw	s4,8(sp)
    1308:	00058993          	mv	s3,a1
    130c:	00112e23          	sw	ra,28(sp)
    1310:	00050913          	mv	s2,a0
    1314:	7ffffa17          	auipc	s4,0x7ffff
    1318:	e0ca0a13          	add	s4,s4,-500 # 80000120 <__malloc_av_>
    131c:	405000ef          	jal	1f20 <__malloc_lock>
    1320:	008a2703          	lw	a4,8(s4)
    1324:	000017b7          	lui	a5,0x1
    1328:	fef78793          	add	a5,a5,-17 # fef <memset+0xb>
    132c:	00472483          	lw	s1,4(a4)
    1330:	00001737          	lui	a4,0x1
    1334:	ffc4f493          	and	s1,s1,-4
    1338:	00f48433          	add	s0,s1,a5
    133c:	41340433          	sub	s0,s0,s3
    1340:	00c45413          	srl	s0,s0,0xc
    1344:	fff40413          	add	s0,s0,-1
    1348:	00c41413          	sll	s0,s0,0xc
    134c:	00e44e63          	blt	s0,a4,1368 <_malloc_trim_r+0x78>
    1350:	00000593          	li	a1,0
    1354:	00090513          	mv	a0,s2
    1358:	678060ef          	jal	79d0 <_sbrk_r>
    135c:	008a2783          	lw	a5,8(s4)
    1360:	009787b3          	add	a5,a5,s1
    1364:	02f50863          	beq	a0,a5,1394 <_malloc_trim_r+0xa4>
    1368:	00090513          	mv	a0,s2
    136c:	3c1000ef          	jal	1f2c <__malloc_unlock>
    1370:	01c12083          	lw	ra,28(sp)
    1374:	01812403          	lw	s0,24(sp)
    1378:	01412483          	lw	s1,20(sp)
    137c:	01012903          	lw	s2,16(sp)
    1380:	00c12983          	lw	s3,12(sp)
    1384:	00812a03          	lw	s4,8(sp)
    1388:	00000513          	li	a0,0
    138c:	02010113          	add	sp,sp,32
    1390:	00008067          	ret
    1394:	408005b3          	neg	a1,s0
    1398:	00090513          	mv	a0,s2
    139c:	634060ef          	jal	79d0 <_sbrk_r>
    13a0:	fff00793          	li	a5,-1
    13a4:	04f50a63          	beq	a0,a5,13f8 <_malloc_trim_r+0x108>
    13a8:	80000717          	auipc	a4,0x80000
    13ac:	48c70713          	add	a4,a4,1164 # 80001834 <__malloc_current_mallinfo>
    13b0:	00072783          	lw	a5,0(a4)
    13b4:	008a2683          	lw	a3,8(s4)
    13b8:	408484b3          	sub	s1,s1,s0
    13bc:	0014e493          	or	s1,s1,1
    13c0:	408787b3          	sub	a5,a5,s0
    13c4:	00090513          	mv	a0,s2
    13c8:	0096a223          	sw	s1,4(a3)
    13cc:	00f72023          	sw	a5,0(a4)
    13d0:	35d000ef          	jal	1f2c <__malloc_unlock>
    13d4:	01c12083          	lw	ra,28(sp)
    13d8:	01812403          	lw	s0,24(sp)
    13dc:	01412483          	lw	s1,20(sp)
    13e0:	01012903          	lw	s2,16(sp)
    13e4:	00c12983          	lw	s3,12(sp)
    13e8:	00812a03          	lw	s4,8(sp)
    13ec:	00100513          	li	a0,1
    13f0:	02010113          	add	sp,sp,32
    13f4:	00008067          	ret
    13f8:	00000593          	li	a1,0
    13fc:	00090513          	mv	a0,s2
    1400:	5d0060ef          	jal	79d0 <_sbrk_r>
    1404:	008a2703          	lw	a4,8(s4)
    1408:	00f00693          	li	a3,15
    140c:	40e507b3          	sub	a5,a0,a4
    1410:	f4f6dce3          	bge	a3,a5,1368 <_malloc_trim_r+0x78>
    1414:	7ffff697          	auipc	a3,0x7ffff
    1418:	2f86a683          	lw	a3,760(a3) # 8000070c <__malloc_sbrk_base>
    141c:	40d50533          	sub	a0,a0,a3
    1420:	0017e793          	or	a5,a5,1
    1424:	80000697          	auipc	a3,0x80000
    1428:	40a6a823          	sw	a0,1040(a3) # 80001834 <__malloc_current_mallinfo>
    142c:	00f72223          	sw	a5,4(a4)
    1430:	f39ff06f          	j	1368 <_malloc_trim_r+0x78>

00001434 <_free_r>:
    1434:	18058263          	beqz	a1,15b8 <_free_r+0x184>
    1438:	ff010113          	add	sp,sp,-16
    143c:	00812423          	sw	s0,8(sp)
    1440:	00912223          	sw	s1,4(sp)
    1444:	00058413          	mv	s0,a1
    1448:	00050493          	mv	s1,a0
    144c:	00112623          	sw	ra,12(sp)
    1450:	2d1000ef          	jal	1f20 <__malloc_lock>
    1454:	ffc42583          	lw	a1,-4(s0)
    1458:	ff840713          	add	a4,s0,-8
    145c:	7ffff517          	auipc	a0,0x7ffff
    1460:	cc450513          	add	a0,a0,-828 # 80000120 <__malloc_av_>
    1464:	ffe5f793          	and	a5,a1,-2
    1468:	00f70633          	add	a2,a4,a5
    146c:	00462683          	lw	a3,4(a2)
    1470:	00852803          	lw	a6,8(a0)
    1474:	ffc6f693          	and	a3,a3,-4
    1478:	1ac80263          	beq	a6,a2,161c <_free_r+0x1e8>
    147c:	00d62223          	sw	a3,4(a2)
    1480:	0015f593          	and	a1,a1,1
    1484:	00d60833          	add	a6,a2,a3
    1488:	0a059063          	bnez	a1,1528 <_free_r+0xf4>
    148c:	ff842303          	lw	t1,-8(s0)
    1490:	00482583          	lw	a1,4(a6)
    1494:	7ffff897          	auipc	a7,0x7ffff
    1498:	c9488893          	add	a7,a7,-876 # 80000128 <__malloc_av_+0x8>
    149c:	40670733          	sub	a4,a4,t1
    14a0:	00872803          	lw	a6,8(a4)
    14a4:	006787b3          	add	a5,a5,t1
    14a8:	0015f593          	and	a1,a1,1
    14ac:	15180263          	beq	a6,a7,15f0 <_free_r+0x1bc>
    14b0:	00c72303          	lw	t1,12(a4)
    14b4:	00682623          	sw	t1,12(a6)
    14b8:	01032423          	sw	a6,8(t1)
    14bc:	1a058a63          	beqz	a1,1670 <_free_r+0x23c>
    14c0:	0017e693          	or	a3,a5,1
    14c4:	00d72223          	sw	a3,4(a4)
    14c8:	00f62023          	sw	a5,0(a2)
    14cc:	1ff00693          	li	a3,511
    14d0:	06f6ec63          	bltu	a3,a5,1548 <_free_r+0x114>
    14d4:	ff87f693          	and	a3,a5,-8
    14d8:	00868693          	add	a3,a3,8
    14dc:	00452583          	lw	a1,4(a0)
    14e0:	00d506b3          	add	a3,a0,a3
    14e4:	0006a603          	lw	a2,0(a3)
    14e8:	0057d813          	srl	a6,a5,0x5
    14ec:	00100793          	li	a5,1
    14f0:	010797b3          	sll	a5,a5,a6
    14f4:	00b7e7b3          	or	a5,a5,a1
    14f8:	ff868593          	add	a1,a3,-8
    14fc:	00b72623          	sw	a1,12(a4)
    1500:	00c72423          	sw	a2,8(a4)
    1504:	00f52223          	sw	a5,4(a0)
    1508:	00e6a023          	sw	a4,0(a3)
    150c:	00e62623          	sw	a4,12(a2)
    1510:	00812403          	lw	s0,8(sp)
    1514:	00c12083          	lw	ra,12(sp)
    1518:	00048513          	mv	a0,s1
    151c:	00412483          	lw	s1,4(sp)
    1520:	01010113          	add	sp,sp,16
    1524:	2090006f          	j	1f2c <__malloc_unlock>
    1528:	00482583          	lw	a1,4(a6)
    152c:	0015f593          	and	a1,a1,1
    1530:	08058663          	beqz	a1,15bc <_free_r+0x188>
    1534:	0017e693          	or	a3,a5,1
    1538:	fed42e23          	sw	a3,-4(s0)
    153c:	00f62023          	sw	a5,0(a2)
    1540:	1ff00693          	li	a3,511
    1544:	f8f6f8e3          	bgeu	a3,a5,14d4 <_free_r+0xa0>
    1548:	0097d693          	srl	a3,a5,0x9
    154c:	00400613          	li	a2,4
    1550:	12d66463          	bltu	a2,a3,1678 <_free_r+0x244>
    1554:	0067d693          	srl	a3,a5,0x6
    1558:	03968593          	add	a1,a3,57
    155c:	03868613          	add	a2,a3,56
    1560:	00359593          	sll	a1,a1,0x3
    1564:	00b505b3          	add	a1,a0,a1
    1568:	0005a683          	lw	a3,0(a1)
    156c:	ff858593          	add	a1,a1,-8
    1570:	00d59863          	bne	a1,a3,1580 <_free_r+0x14c>
    1574:	15c0006f          	j	16d0 <_free_r+0x29c>
    1578:	0086a683          	lw	a3,8(a3)
    157c:	00d58863          	beq	a1,a3,158c <_free_r+0x158>
    1580:	0046a603          	lw	a2,4(a3)
    1584:	ffc67613          	and	a2,a2,-4
    1588:	fec7e8e3          	bltu	a5,a2,1578 <_free_r+0x144>
    158c:	00c6a583          	lw	a1,12(a3)
    1590:	00b72623          	sw	a1,12(a4)
    1594:	00d72423          	sw	a3,8(a4)
    1598:	00812403          	lw	s0,8(sp)
    159c:	00c12083          	lw	ra,12(sp)
    15a0:	00e5a423          	sw	a4,8(a1)
    15a4:	00048513          	mv	a0,s1
    15a8:	00412483          	lw	s1,4(sp)
    15ac:	00e6a623          	sw	a4,12(a3)
    15b0:	01010113          	add	sp,sp,16
    15b4:	1790006f          	j	1f2c <__malloc_unlock>
    15b8:	00008067          	ret
    15bc:	00d787b3          	add	a5,a5,a3
    15c0:	7ffff897          	auipc	a7,0x7ffff
    15c4:	b6888893          	add	a7,a7,-1176 # 80000128 <__malloc_av_+0x8>
    15c8:	00862683          	lw	a3,8(a2)
    15cc:	0f168063          	beq	a3,a7,16ac <_free_r+0x278>
    15d0:	00c62803          	lw	a6,12(a2)
    15d4:	0017e593          	or	a1,a5,1
    15d8:	00f70633          	add	a2,a4,a5
    15dc:	0106a623          	sw	a6,12(a3)
    15e0:	00d82423          	sw	a3,8(a6)
    15e4:	00b72223          	sw	a1,4(a4)
    15e8:	00f62023          	sw	a5,0(a2)
    15ec:	ee1ff06f          	j	14cc <_free_r+0x98>
    15f0:	14059063          	bnez	a1,1730 <_free_r+0x2fc>
    15f4:	00862583          	lw	a1,8(a2)
    15f8:	00c62603          	lw	a2,12(a2)
    15fc:	00f686b3          	add	a3,a3,a5
    1600:	0016e793          	or	a5,a3,1
    1604:	00c5a623          	sw	a2,12(a1)
    1608:	00b62423          	sw	a1,8(a2)
    160c:	00f72223          	sw	a5,4(a4)
    1610:	00d70733          	add	a4,a4,a3
    1614:	00d72023          	sw	a3,0(a4)
    1618:	ef9ff06f          	j	1510 <_free_r+0xdc>
    161c:	0015f593          	and	a1,a1,1
    1620:	00d786b3          	add	a3,a5,a3
    1624:	02059063          	bnez	a1,1644 <_free_r+0x210>
    1628:	ff842583          	lw	a1,-8(s0)
    162c:	40b70733          	sub	a4,a4,a1
    1630:	00c72783          	lw	a5,12(a4)
    1634:	00872603          	lw	a2,8(a4)
    1638:	00b686b3          	add	a3,a3,a1
    163c:	00f62623          	sw	a5,12(a2)
    1640:	00c7a423          	sw	a2,8(a5)
    1644:	0016e793          	or	a5,a3,1
    1648:	00f72223          	sw	a5,4(a4)
    164c:	00e52423          	sw	a4,8(a0)
    1650:	7ffff797          	auipc	a5,0x7ffff
    1654:	0c07a783          	lw	a5,192(a5) # 80000710 <__malloc_trim_threshold>
    1658:	eaf6ece3          	bltu	a3,a5,1510 <_free_r+0xdc>
    165c:	7ffff597          	auipc	a1,0x7ffff
    1660:	0d05a583          	lw	a1,208(a1) # 8000072c <__malloc_top_pad>
    1664:	00048513          	mv	a0,s1
    1668:	c89ff0ef          	jal	12f0 <_malloc_trim_r>
    166c:	ea5ff06f          	j	1510 <_free_r+0xdc>
    1670:	00d787b3          	add	a5,a5,a3
    1674:	f55ff06f          	j	15c8 <_free_r+0x194>
    1678:	01400613          	li	a2,20
    167c:	02d67063          	bgeu	a2,a3,169c <_free_r+0x268>
    1680:	05400613          	li	a2,84
    1684:	06d66463          	bltu	a2,a3,16ec <_free_r+0x2b8>
    1688:	00c7d693          	srl	a3,a5,0xc
    168c:	06f68593          	add	a1,a3,111
    1690:	06e68613          	add	a2,a3,110
    1694:	00359593          	sll	a1,a1,0x3
    1698:	ecdff06f          	j	1564 <_free_r+0x130>
    169c:	05c68593          	add	a1,a3,92
    16a0:	05b68613          	add	a2,a3,91
    16a4:	00359593          	sll	a1,a1,0x3
    16a8:	ebdff06f          	j	1564 <_free_r+0x130>
    16ac:	00e52a23          	sw	a4,20(a0)
    16b0:	00e52823          	sw	a4,16(a0)
    16b4:	0017e693          	or	a3,a5,1
    16b8:	01172623          	sw	a7,12(a4)
    16bc:	01172423          	sw	a7,8(a4)
    16c0:	00d72223          	sw	a3,4(a4)
    16c4:	00f70733          	add	a4,a4,a5
    16c8:	00f72023          	sw	a5,0(a4)
    16cc:	e45ff06f          	j	1510 <_free_r+0xdc>
    16d0:	00452803          	lw	a6,4(a0)
    16d4:	40265613          	sra	a2,a2,0x2
    16d8:	00100793          	li	a5,1
    16dc:	00c797b3          	sll	a5,a5,a2
    16e0:	0107e7b3          	or	a5,a5,a6
    16e4:	00f52223          	sw	a5,4(a0)
    16e8:	ea9ff06f          	j	1590 <_free_r+0x15c>
    16ec:	15400613          	li	a2,340
    16f0:	00d66c63          	bltu	a2,a3,1708 <_free_r+0x2d4>
    16f4:	00f7d693          	srl	a3,a5,0xf
    16f8:	07868593          	add	a1,a3,120
    16fc:	07768613          	add	a2,a3,119
    1700:	00359593          	sll	a1,a1,0x3
    1704:	e61ff06f          	j	1564 <_free_r+0x130>
    1708:	55400613          	li	a2,1364
    170c:	00d66c63          	bltu	a2,a3,1724 <_free_r+0x2f0>
    1710:	0127d693          	srl	a3,a5,0x12
    1714:	07d68593          	add	a1,a3,125
    1718:	07c68613          	add	a2,a3,124
    171c:	00359593          	sll	a1,a1,0x3
    1720:	e45ff06f          	j	1564 <_free_r+0x130>
    1724:	3f800593          	li	a1,1016
    1728:	07e00613          	li	a2,126
    172c:	e39ff06f          	j	1564 <_free_r+0x130>
    1730:	0017e693          	or	a3,a5,1
    1734:	00d72223          	sw	a3,4(a4)
    1738:	00f62023          	sw	a5,0(a2)
    173c:	dd5ff06f          	j	1510 <_free_r+0xdc>

00001740 <_malloc_r>:
    1740:	fd010113          	add	sp,sp,-48
    1744:	03212023          	sw	s2,32(sp)
    1748:	02112623          	sw	ra,44(sp)
    174c:	02812423          	sw	s0,40(sp)
    1750:	02912223          	sw	s1,36(sp)
    1754:	01312e23          	sw	s3,28(sp)
    1758:	00b58793          	add	a5,a1,11
    175c:	01600713          	li	a4,22
    1760:	00050913          	mv	s2,a0
    1764:	08f76263          	bltu	a4,a5,17e8 <_malloc_r+0xa8>
    1768:	01000793          	li	a5,16
    176c:	20b7e663          	bltu	a5,a1,1978 <_malloc_r+0x238>
    1770:	7b0000ef          	jal	1f20 <__malloc_lock>
    1774:	01800793          	li	a5,24
    1778:	00200593          	li	a1,2
    177c:	01000493          	li	s1,16
    1780:	7ffff997          	auipc	s3,0x7ffff
    1784:	9a098993          	add	s3,s3,-1632 # 80000120 <__malloc_av_>
    1788:	00f987b3          	add	a5,s3,a5
    178c:	0047a403          	lw	s0,4(a5)
    1790:	ff878713          	add	a4,a5,-8
    1794:	36e40463          	beq	s0,a4,1afc <_malloc_r+0x3bc>
    1798:	00442783          	lw	a5,4(s0)
    179c:	00c42683          	lw	a3,12(s0)
    17a0:	00842603          	lw	a2,8(s0)
    17a4:	ffc7f793          	and	a5,a5,-4
    17a8:	00f407b3          	add	a5,s0,a5
    17ac:	0047a703          	lw	a4,4(a5)
    17b0:	00d62623          	sw	a3,12(a2)
    17b4:	00c6a423          	sw	a2,8(a3)
    17b8:	00176713          	or	a4,a4,1
    17bc:	00090513          	mv	a0,s2
    17c0:	00e7a223          	sw	a4,4(a5)
    17c4:	768000ef          	jal	1f2c <__malloc_unlock>
    17c8:	00840513          	add	a0,s0,8
    17cc:	02c12083          	lw	ra,44(sp)
    17d0:	02812403          	lw	s0,40(sp)
    17d4:	02412483          	lw	s1,36(sp)
    17d8:	02012903          	lw	s2,32(sp)
    17dc:	01c12983          	lw	s3,28(sp)
    17e0:	03010113          	add	sp,sp,48
    17e4:	00008067          	ret
    17e8:	ff87f493          	and	s1,a5,-8
    17ec:	1807c663          	bltz	a5,1978 <_malloc_r+0x238>
    17f0:	18b4e463          	bltu	s1,a1,1978 <_malloc_r+0x238>
    17f4:	72c000ef          	jal	1f20 <__malloc_lock>
    17f8:	1f700793          	li	a5,503
    17fc:	4097fa63          	bgeu	a5,s1,1c10 <_malloc_r+0x4d0>
    1800:	0094d793          	srl	a5,s1,0x9
    1804:	18078263          	beqz	a5,1988 <_malloc_r+0x248>
    1808:	00400713          	li	a4,4
    180c:	36f76063          	bltu	a4,a5,1b6c <_malloc_r+0x42c>
    1810:	0064d793          	srl	a5,s1,0x6
    1814:	03978593          	add	a1,a5,57
    1818:	03878813          	add	a6,a5,56
    181c:	00359613          	sll	a2,a1,0x3
    1820:	7ffff997          	auipc	s3,0x7ffff
    1824:	90098993          	add	s3,s3,-1792 # 80000120 <__malloc_av_>
    1828:	00c98633          	add	a2,s3,a2
    182c:	00462403          	lw	s0,4(a2)
    1830:	ff860613          	add	a2,a2,-8
    1834:	02860863          	beq	a2,s0,1864 <_malloc_r+0x124>
    1838:	00f00513          	li	a0,15
    183c:	0140006f          	j	1850 <_malloc_r+0x110>
    1840:	00c42683          	lw	a3,12(s0)
    1844:	2a075863          	bgez	a4,1af4 <_malloc_r+0x3b4>
    1848:	00d60e63          	beq	a2,a3,1864 <_malloc_r+0x124>
    184c:	00068413          	mv	s0,a3
    1850:	00442783          	lw	a5,4(s0)
    1854:	ffc7f793          	and	a5,a5,-4
    1858:	40978733          	sub	a4,a5,s1
    185c:	fee552e3          	bge	a0,a4,1840 <_malloc_r+0x100>
    1860:	00080593          	mv	a1,a6
    1864:	0109a403          	lw	s0,16(s3)
    1868:	7ffff897          	auipc	a7,0x7ffff
    186c:	8c088893          	add	a7,a7,-1856 # 80000128 <__malloc_av_+0x8>
    1870:	27140e63          	beq	s0,a7,1aec <_malloc_r+0x3ac>
    1874:	00442783          	lw	a5,4(s0)
    1878:	00f00693          	li	a3,15
    187c:	ffc7f793          	and	a5,a5,-4
    1880:	40978733          	sub	a4,a5,s1
    1884:	38e6cc63          	blt	a3,a4,1c1c <_malloc_r+0x4dc>
    1888:	0119aa23          	sw	a7,20(s3)
    188c:	0119a823          	sw	a7,16(s3)
    1890:	36075063          	bgez	a4,1bf0 <_malloc_r+0x4b0>
    1894:	1ff00713          	li	a4,511
    1898:	0049a503          	lw	a0,4(s3)
    189c:	26f76863          	bltu	a4,a5,1b0c <_malloc_r+0x3cc>
    18a0:	ff87f713          	and	a4,a5,-8
    18a4:	00870713          	add	a4,a4,8
    18a8:	00e98733          	add	a4,s3,a4
    18ac:	00072683          	lw	a3,0(a4)
    18b0:	0057d613          	srl	a2,a5,0x5
    18b4:	00100793          	li	a5,1
    18b8:	00c797b3          	sll	a5,a5,a2
    18bc:	00f56533          	or	a0,a0,a5
    18c0:	ff870793          	add	a5,a4,-8
    18c4:	00f42623          	sw	a5,12(s0)
    18c8:	00d42423          	sw	a3,8(s0)
    18cc:	00a9a223          	sw	a0,4(s3)
    18d0:	00872023          	sw	s0,0(a4)
    18d4:	0086a623          	sw	s0,12(a3)
    18d8:	4025d793          	sra	a5,a1,0x2
    18dc:	00100613          	li	a2,1
    18e0:	00f61633          	sll	a2,a2,a5
    18e4:	0ac56a63          	bltu	a0,a2,1998 <_malloc_r+0x258>
    18e8:	00a677b3          	and	a5,a2,a0
    18ec:	02079463          	bnez	a5,1914 <_malloc_r+0x1d4>
    18f0:	00161613          	sll	a2,a2,0x1
    18f4:	ffc5f593          	and	a1,a1,-4
    18f8:	00a677b3          	and	a5,a2,a0
    18fc:	00458593          	add	a1,a1,4
    1900:	00079a63          	bnez	a5,1914 <_malloc_r+0x1d4>
    1904:	00161613          	sll	a2,a2,0x1
    1908:	00a677b3          	and	a5,a2,a0
    190c:	00458593          	add	a1,a1,4
    1910:	fe078ae3          	beqz	a5,1904 <_malloc_r+0x1c4>
    1914:	00f00813          	li	a6,15
    1918:	00359313          	sll	t1,a1,0x3
    191c:	00698333          	add	t1,s3,t1
    1920:	00030513          	mv	a0,t1
    1924:	00c52783          	lw	a5,12(a0)
    1928:	00058e13          	mv	t3,a1
    192c:	26f50263          	beq	a0,a5,1b90 <_malloc_r+0x450>
    1930:	0047a703          	lw	a4,4(a5)
    1934:	00078413          	mv	s0,a5
    1938:	00c7a783          	lw	a5,12(a5)
    193c:	ffc77713          	and	a4,a4,-4
    1940:	409706b3          	sub	a3,a4,s1
    1944:	26d84263          	blt	a6,a3,1ba8 <_malloc_r+0x468>
    1948:	fe06c2e3          	bltz	a3,192c <_malloc_r+0x1ec>
    194c:	00e40733          	add	a4,s0,a4
    1950:	00472683          	lw	a3,4(a4)
    1954:	00842603          	lw	a2,8(s0)
    1958:	00090513          	mv	a0,s2
    195c:	0016e693          	or	a3,a3,1
    1960:	00d72223          	sw	a3,4(a4)
    1964:	00f62623          	sw	a5,12(a2)
    1968:	00c7a423          	sw	a2,8(a5)
    196c:	5c0000ef          	jal	1f2c <__malloc_unlock>
    1970:	00840513          	add	a0,s0,8
    1974:	e59ff06f          	j	17cc <_malloc_r+0x8c>
    1978:	00c00793          	li	a5,12
    197c:	00f92023          	sw	a5,0(s2)
    1980:	00000513          	li	a0,0
    1984:	e49ff06f          	j	17cc <_malloc_r+0x8c>
    1988:	20000613          	li	a2,512
    198c:	04000593          	li	a1,64
    1990:	03f00813          	li	a6,63
    1994:	e8dff06f          	j	1820 <_malloc_r+0xe0>
    1998:	0089a403          	lw	s0,8(s3)
    199c:	01612823          	sw	s6,16(sp)
    19a0:	00442783          	lw	a5,4(s0)
    19a4:	ffc7fb13          	and	s6,a5,-4
    19a8:	009b6863          	bltu	s6,s1,19b8 <_malloc_r+0x278>
    19ac:	409b0733          	sub	a4,s6,s1
    19b0:	00f00793          	li	a5,15
    19b4:	0ee7ca63          	blt	a5,a4,1aa8 <_malloc_r+0x368>
    19b8:	01912223          	sw	s9,4(sp)
    19bc:	7ffffc97          	auipc	s9,0x7ffff
    19c0:	d50c8c93          	add	s9,s9,-688 # 8000070c <__malloc_sbrk_base>
    19c4:	000ca703          	lw	a4,0(s9)
    19c8:	01412c23          	sw	s4,24(sp)
    19cc:	01512a23          	sw	s5,20(sp)
    19d0:	01712623          	sw	s7,12(sp)
    19d4:	7ffffa97          	auipc	s5,0x7ffff
    19d8:	d58aaa83          	lw	s5,-680(s5) # 8000072c <__malloc_top_pad>
    19dc:	fff00793          	li	a5,-1
    19e0:	01640a33          	add	s4,s0,s6
    19e4:	01548ab3          	add	s5,s1,s5
    19e8:	3ef70263          	beq	a4,a5,1dcc <_malloc_r+0x68c>
    19ec:	000017b7          	lui	a5,0x1
    19f0:	00f78793          	add	a5,a5,15 # 100f <memset+0x2b>
    19f4:	00fa8ab3          	add	s5,s5,a5
    19f8:	fffff7b7          	lui	a5,0xfffff
    19fc:	00fafab3          	and	s5,s5,a5
    1a00:	000a8593          	mv	a1,s5
    1a04:	00090513          	mv	a0,s2
    1a08:	7c9050ef          	jal	79d0 <_sbrk_r>
    1a0c:	fff00793          	li	a5,-1
    1a10:	00050b93          	mv	s7,a0
    1a14:	46f50663          	beq	a0,a5,1e80 <_malloc_r+0x740>
    1a18:	01812423          	sw	s8,8(sp)
    1a1c:	25456863          	bltu	a0,s4,1c6c <_malloc_r+0x52c>
    1a20:	80000c17          	auipc	s8,0x80000
    1a24:	e14c0c13          	add	s8,s8,-492 # 80001834 <__malloc_current_mallinfo>
    1a28:	000c2583          	lw	a1,0(s8)
    1a2c:	00ba85b3          	add	a1,s5,a1
    1a30:	00bc2023          	sw	a1,0(s8)
    1a34:	00058713          	mv	a4,a1
    1a38:	2caa1063          	bne	s4,a0,1cf8 <_malloc_r+0x5b8>
    1a3c:	01451793          	sll	a5,a0,0x14
    1a40:	2a079c63          	bnez	a5,1cf8 <_malloc_r+0x5b8>
    1a44:	0089ab83          	lw	s7,8(s3)
    1a48:	015b07b3          	add	a5,s6,s5
    1a4c:	0017e793          	or	a5,a5,1
    1a50:	00fba223          	sw	a5,4(s7)
    1a54:	7ffff717          	auipc	a4,0x7ffff
    1a58:	cd470713          	add	a4,a4,-812 # 80000728 <__malloc_max_sbrked_mem>
    1a5c:	00072683          	lw	a3,0(a4)
    1a60:	00b6f463          	bgeu	a3,a1,1a68 <_malloc_r+0x328>
    1a64:	00b72023          	sw	a1,0(a4)
    1a68:	7ffff717          	auipc	a4,0x7ffff
    1a6c:	cbc70713          	add	a4,a4,-836 # 80000724 <__malloc_max_total_mem>
    1a70:	00072683          	lw	a3,0(a4)
    1a74:	00b6f463          	bgeu	a3,a1,1a7c <_malloc_r+0x33c>
    1a78:	00b72023          	sw	a1,0(a4)
    1a7c:	00812c03          	lw	s8,8(sp)
    1a80:	000b8413          	mv	s0,s7
    1a84:	ffc7f793          	and	a5,a5,-4
    1a88:	40978733          	sub	a4,a5,s1
    1a8c:	3897ec63          	bltu	a5,s1,1e24 <_malloc_r+0x6e4>
    1a90:	00f00793          	li	a5,15
    1a94:	38e7d863          	bge	a5,a4,1e24 <_malloc_r+0x6e4>
    1a98:	01812a03          	lw	s4,24(sp)
    1a9c:	01412a83          	lw	s5,20(sp)
    1aa0:	00c12b83          	lw	s7,12(sp)
    1aa4:	00412c83          	lw	s9,4(sp)
    1aa8:	0014e793          	or	a5,s1,1
    1aac:	00f42223          	sw	a5,4(s0)
    1ab0:	009404b3          	add	s1,s0,s1
    1ab4:	0099a423          	sw	s1,8(s3)
    1ab8:	00176713          	or	a4,a4,1
    1abc:	00090513          	mv	a0,s2
    1ac0:	00e4a223          	sw	a4,4(s1)
    1ac4:	468000ef          	jal	1f2c <__malloc_unlock>
    1ac8:	02c12083          	lw	ra,44(sp)
    1acc:	00840513          	add	a0,s0,8
    1ad0:	02812403          	lw	s0,40(sp)
    1ad4:	01012b03          	lw	s6,16(sp)
    1ad8:	02412483          	lw	s1,36(sp)
    1adc:	02012903          	lw	s2,32(sp)
    1ae0:	01c12983          	lw	s3,28(sp)
    1ae4:	03010113          	add	sp,sp,48
    1ae8:	00008067          	ret
    1aec:	0049a503          	lw	a0,4(s3)
    1af0:	de9ff06f          	j	18d8 <_malloc_r+0x198>
    1af4:	00842603          	lw	a2,8(s0)
    1af8:	cb1ff06f          	j	17a8 <_malloc_r+0x68>
    1afc:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1b00:	00258593          	add	a1,a1,2
    1b04:	d68780e3          	beq	a5,s0,1864 <_malloc_r+0x124>
    1b08:	c91ff06f          	j	1798 <_malloc_r+0x58>
    1b0c:	0097d713          	srl	a4,a5,0x9
    1b10:	00400693          	li	a3,4
    1b14:	14e6f263          	bgeu	a3,a4,1c58 <_malloc_r+0x518>
    1b18:	01400693          	li	a3,20
    1b1c:	32e6e663          	bltu	a3,a4,1e48 <_malloc_r+0x708>
    1b20:	05c70613          	add	a2,a4,92
    1b24:	05b70693          	add	a3,a4,91
    1b28:	00361613          	sll	a2,a2,0x3
    1b2c:	00c98633          	add	a2,s3,a2
    1b30:	00062703          	lw	a4,0(a2)
    1b34:	ff860613          	add	a2,a2,-8
    1b38:	00e61863          	bne	a2,a4,1b48 <_malloc_r+0x408>
    1b3c:	2980006f          	j	1dd4 <_malloc_r+0x694>
    1b40:	00872703          	lw	a4,8(a4)
    1b44:	00e60863          	beq	a2,a4,1b54 <_malloc_r+0x414>
    1b48:	00472683          	lw	a3,4(a4)
    1b4c:	ffc6f693          	and	a3,a3,-4
    1b50:	fed7e8e3          	bltu	a5,a3,1b40 <_malloc_r+0x400>
    1b54:	00c72603          	lw	a2,12(a4)
    1b58:	00c42623          	sw	a2,12(s0)
    1b5c:	00e42423          	sw	a4,8(s0)
    1b60:	00862423          	sw	s0,8(a2)
    1b64:	00872623          	sw	s0,12(a4)
    1b68:	d71ff06f          	j	18d8 <_malloc_r+0x198>
    1b6c:	01400713          	li	a4,20
    1b70:	10f77863          	bgeu	a4,a5,1c80 <_malloc_r+0x540>
    1b74:	05400713          	li	a4,84
    1b78:	2ef76663          	bltu	a4,a5,1e64 <_malloc_r+0x724>
    1b7c:	00c4d793          	srl	a5,s1,0xc
    1b80:	06f78593          	add	a1,a5,111
    1b84:	06e78813          	add	a6,a5,110
    1b88:	00359613          	sll	a2,a1,0x3
    1b8c:	c95ff06f          	j	1820 <_malloc_r+0xe0>
    1b90:	001e0e13          	add	t3,t3,1
    1b94:	003e7793          	and	a5,t3,3
    1b98:	00850513          	add	a0,a0,8
    1b9c:	10078063          	beqz	a5,1c9c <_malloc_r+0x55c>
    1ba0:	00c52783          	lw	a5,12(a0)
    1ba4:	d89ff06f          	j	192c <_malloc_r+0x1ec>
    1ba8:	00842603          	lw	a2,8(s0)
    1bac:	0014e593          	or	a1,s1,1
    1bb0:	00b42223          	sw	a1,4(s0)
    1bb4:	00f62623          	sw	a5,12(a2)
    1bb8:	00c7a423          	sw	a2,8(a5)
    1bbc:	009404b3          	add	s1,s0,s1
    1bc0:	0099aa23          	sw	s1,20(s3)
    1bc4:	0099a823          	sw	s1,16(s3)
    1bc8:	0016e793          	or	a5,a3,1
    1bcc:	0114a623          	sw	a7,12(s1)
    1bd0:	0114a423          	sw	a7,8(s1)
    1bd4:	00f4a223          	sw	a5,4(s1)
    1bd8:	00e40733          	add	a4,s0,a4
    1bdc:	00090513          	mv	a0,s2
    1be0:	00d72023          	sw	a3,0(a4)
    1be4:	348000ef          	jal	1f2c <__malloc_unlock>
    1be8:	00840513          	add	a0,s0,8
    1bec:	be1ff06f          	j	17cc <_malloc_r+0x8c>
    1bf0:	00f407b3          	add	a5,s0,a5
    1bf4:	0047a703          	lw	a4,4(a5)
    1bf8:	00090513          	mv	a0,s2
    1bfc:	00176713          	or	a4,a4,1
    1c00:	00e7a223          	sw	a4,4(a5)
    1c04:	328000ef          	jal	1f2c <__malloc_unlock>
    1c08:	00840513          	add	a0,s0,8
    1c0c:	bc1ff06f          	j	17cc <_malloc_r+0x8c>
    1c10:	0034d593          	srl	a1,s1,0x3
    1c14:	00848793          	add	a5,s1,8
    1c18:	b69ff06f          	j	1780 <_malloc_r+0x40>
    1c1c:	0014e693          	or	a3,s1,1
    1c20:	00d42223          	sw	a3,4(s0)
    1c24:	009404b3          	add	s1,s0,s1
    1c28:	0099aa23          	sw	s1,20(s3)
    1c2c:	0099a823          	sw	s1,16(s3)
    1c30:	00176693          	or	a3,a4,1
    1c34:	0114a623          	sw	a7,12(s1)
    1c38:	0114a423          	sw	a7,8(s1)
    1c3c:	00d4a223          	sw	a3,4(s1)
    1c40:	00f407b3          	add	a5,s0,a5
    1c44:	00090513          	mv	a0,s2
    1c48:	00e7a023          	sw	a4,0(a5)
    1c4c:	2e0000ef          	jal	1f2c <__malloc_unlock>
    1c50:	00840513          	add	a0,s0,8
    1c54:	b79ff06f          	j	17cc <_malloc_r+0x8c>
    1c58:	0067d713          	srl	a4,a5,0x6
    1c5c:	03970613          	add	a2,a4,57
    1c60:	03870693          	add	a3,a4,56
    1c64:	00361613          	sll	a2,a2,0x3
    1c68:	ec5ff06f          	j	1b2c <_malloc_r+0x3ec>
    1c6c:	07340c63          	beq	s0,s3,1ce4 <_malloc_r+0x5a4>
    1c70:	0089a403          	lw	s0,8(s3)
    1c74:	00812c03          	lw	s8,8(sp)
    1c78:	00442783          	lw	a5,4(s0)
    1c7c:	e09ff06f          	j	1a84 <_malloc_r+0x344>
    1c80:	05c78593          	add	a1,a5,92
    1c84:	05b78813          	add	a6,a5,91
    1c88:	00359613          	sll	a2,a1,0x3
    1c8c:	b95ff06f          	j	1820 <_malloc_r+0xe0>
    1c90:	00832783          	lw	a5,8(t1)
    1c94:	fff58593          	add	a1,a1,-1
    1c98:	28679063          	bne	a5,t1,1f18 <_malloc_r+0x7d8>
    1c9c:	0035f793          	and	a5,a1,3
    1ca0:	ff830313          	add	t1,t1,-8
    1ca4:	fe0796e3          	bnez	a5,1c90 <_malloc_r+0x550>
    1ca8:	0049a703          	lw	a4,4(s3)
    1cac:	fff64793          	not	a5,a2
    1cb0:	00e7f7b3          	and	a5,a5,a4
    1cb4:	00f9a223          	sw	a5,4(s3)
    1cb8:	00161613          	sll	a2,a2,0x1
    1cbc:	ccc7eee3          	bltu	a5,a2,1998 <_malloc_r+0x258>
    1cc0:	cc060ce3          	beqz	a2,1998 <_malloc_r+0x258>
    1cc4:	00f67733          	and	a4,a2,a5
    1cc8:	00071a63          	bnez	a4,1cdc <_malloc_r+0x59c>
    1ccc:	00161613          	sll	a2,a2,0x1
    1cd0:	00f67733          	and	a4,a2,a5
    1cd4:	004e0e13          	add	t3,t3,4
    1cd8:	fe070ae3          	beqz	a4,1ccc <_malloc_r+0x58c>
    1cdc:	000e0593          	mv	a1,t3
    1ce0:	c39ff06f          	j	1918 <_malloc_r+0x1d8>
    1ce4:	80000c17          	auipc	s8,0x80000
    1ce8:	b50c0c13          	add	s8,s8,-1200 # 80001834 <__malloc_current_mallinfo>
    1cec:	000c2703          	lw	a4,0(s8)
    1cf0:	00ea8733          	add	a4,s5,a4
    1cf4:	00ec2023          	sw	a4,0(s8)
    1cf8:	000ca683          	lw	a3,0(s9)
    1cfc:	fff00793          	li	a5,-1
    1d00:	18f68663          	beq	a3,a5,1e8c <_malloc_r+0x74c>
    1d04:	414b87b3          	sub	a5,s7,s4
    1d08:	00e787b3          	add	a5,a5,a4
    1d0c:	00fc2023          	sw	a5,0(s8)
    1d10:	007bfc93          	and	s9,s7,7
    1d14:	0c0c8c63          	beqz	s9,1dec <_malloc_r+0x6ac>
    1d18:	419b8bb3          	sub	s7,s7,s9
    1d1c:	000017b7          	lui	a5,0x1
    1d20:	00878793          	add	a5,a5,8 # 1008 <memset+0x24>
    1d24:	008b8b93          	add	s7,s7,8
    1d28:	419785b3          	sub	a1,a5,s9
    1d2c:	015b8ab3          	add	s5,s7,s5
    1d30:	415585b3          	sub	a1,a1,s5
    1d34:	01459593          	sll	a1,a1,0x14
    1d38:	0145da13          	srl	s4,a1,0x14
    1d3c:	000a0593          	mv	a1,s4
    1d40:	00090513          	mv	a0,s2
    1d44:	48d050ef          	jal	79d0 <_sbrk_r>
    1d48:	fff00793          	li	a5,-1
    1d4c:	18f50063          	beq	a0,a5,1ecc <_malloc_r+0x78c>
    1d50:	41750533          	sub	a0,a0,s7
    1d54:	01450ab3          	add	s5,a0,s4
    1d58:	000c2703          	lw	a4,0(s8)
    1d5c:	0179a423          	sw	s7,8(s3)
    1d60:	001ae793          	or	a5,s5,1
    1d64:	00ea05b3          	add	a1,s4,a4
    1d68:	00bc2023          	sw	a1,0(s8)
    1d6c:	00fba223          	sw	a5,4(s7)
    1d70:	cf3402e3          	beq	s0,s3,1a54 <_malloc_r+0x314>
    1d74:	00f00693          	li	a3,15
    1d78:	0b66f063          	bgeu	a3,s6,1e18 <_malloc_r+0x6d8>
    1d7c:	00442703          	lw	a4,4(s0)
    1d80:	ff4b0793          	add	a5,s6,-12
    1d84:	ff87f793          	and	a5,a5,-8
    1d88:	00177713          	and	a4,a4,1
    1d8c:	00f76733          	or	a4,a4,a5
    1d90:	00e42223          	sw	a4,4(s0)
    1d94:	00500613          	li	a2,5
    1d98:	00f40733          	add	a4,s0,a5
    1d9c:	00c72223          	sw	a2,4(a4)
    1da0:	00c72423          	sw	a2,8(a4)
    1da4:	00f6e663          	bltu	a3,a5,1db0 <_malloc_r+0x670>
    1da8:	004ba783          	lw	a5,4(s7)
    1dac:	ca9ff06f          	j	1a54 <_malloc_r+0x314>
    1db0:	00840593          	add	a1,s0,8
    1db4:	00090513          	mv	a0,s2
    1db8:	e7cff0ef          	jal	1434 <_free_r>
    1dbc:	0089ab83          	lw	s7,8(s3)
    1dc0:	000c2583          	lw	a1,0(s8)
    1dc4:	004ba783          	lw	a5,4(s7)
    1dc8:	c8dff06f          	j	1a54 <_malloc_r+0x314>
    1dcc:	010a8a93          	add	s5,s5,16
    1dd0:	c31ff06f          	j	1a00 <_malloc_r+0x2c0>
    1dd4:	4026d693          	sra	a3,a3,0x2
    1dd8:	00100793          	li	a5,1
    1ddc:	00d797b3          	sll	a5,a5,a3
    1de0:	00f56533          	or	a0,a0,a5
    1de4:	00a9a223          	sw	a0,4(s3)
    1de8:	d71ff06f          	j	1b58 <_malloc_r+0x418>
    1dec:	015b85b3          	add	a1,s7,s5
    1df0:	40b005b3          	neg	a1,a1
    1df4:	01459593          	sll	a1,a1,0x14
    1df8:	0145da13          	srl	s4,a1,0x14
    1dfc:	000a0593          	mv	a1,s4
    1e00:	00090513          	mv	a0,s2
    1e04:	3cd050ef          	jal	79d0 <_sbrk_r>
    1e08:	fff00793          	li	a5,-1
    1e0c:	f4f512e3          	bne	a0,a5,1d50 <_malloc_r+0x610>
    1e10:	00000a13          	li	s4,0
    1e14:	f45ff06f          	j	1d58 <_malloc_r+0x618>
    1e18:	00812c03          	lw	s8,8(sp)
    1e1c:	00100793          	li	a5,1
    1e20:	00fba223          	sw	a5,4(s7)
    1e24:	00090513          	mv	a0,s2
    1e28:	104000ef          	jal	1f2c <__malloc_unlock>
    1e2c:	00000513          	li	a0,0
    1e30:	01812a03          	lw	s4,24(sp)
    1e34:	01412a83          	lw	s5,20(sp)
    1e38:	01012b03          	lw	s6,16(sp)
    1e3c:	00c12b83          	lw	s7,12(sp)
    1e40:	00412c83          	lw	s9,4(sp)
    1e44:	989ff06f          	j	17cc <_malloc_r+0x8c>
    1e48:	05400693          	li	a3,84
    1e4c:	04e6e463          	bltu	a3,a4,1e94 <_malloc_r+0x754>
    1e50:	00c7d713          	srl	a4,a5,0xc
    1e54:	06f70613          	add	a2,a4,111
    1e58:	06e70693          	add	a3,a4,110
    1e5c:	00361613          	sll	a2,a2,0x3
    1e60:	ccdff06f          	j	1b2c <_malloc_r+0x3ec>
    1e64:	15400713          	li	a4,340
    1e68:	04f76463          	bltu	a4,a5,1eb0 <_malloc_r+0x770>
    1e6c:	00f4d793          	srl	a5,s1,0xf
    1e70:	07878593          	add	a1,a5,120
    1e74:	07778813          	add	a6,a5,119
    1e78:	00359613          	sll	a2,a1,0x3
    1e7c:	9a5ff06f          	j	1820 <_malloc_r+0xe0>
    1e80:	0089a403          	lw	s0,8(s3)
    1e84:	00442783          	lw	a5,4(s0)
    1e88:	bfdff06f          	j	1a84 <_malloc_r+0x344>
    1e8c:	017ca023          	sw	s7,0(s9)
    1e90:	e81ff06f          	j	1d10 <_malloc_r+0x5d0>
    1e94:	15400693          	li	a3,340
    1e98:	04e6e463          	bltu	a3,a4,1ee0 <_malloc_r+0x7a0>
    1e9c:	00f7d713          	srl	a4,a5,0xf
    1ea0:	07870613          	add	a2,a4,120
    1ea4:	07770693          	add	a3,a4,119
    1ea8:	00361613          	sll	a2,a2,0x3
    1eac:	c81ff06f          	j	1b2c <_malloc_r+0x3ec>
    1eb0:	55400713          	li	a4,1364
    1eb4:	04f76463          	bltu	a4,a5,1efc <_malloc_r+0x7bc>
    1eb8:	0124d793          	srl	a5,s1,0x12
    1ebc:	07d78593          	add	a1,a5,125
    1ec0:	07c78813          	add	a6,a5,124
    1ec4:	00359613          	sll	a2,a1,0x3
    1ec8:	959ff06f          	j	1820 <_malloc_r+0xe0>
    1ecc:	ff8c8c93          	add	s9,s9,-8
    1ed0:	019a8ab3          	add	s5,s5,s9
    1ed4:	417a8ab3          	sub	s5,s5,s7
    1ed8:	00000a13          	li	s4,0
    1edc:	e7dff06f          	j	1d58 <_malloc_r+0x618>
    1ee0:	55400693          	li	a3,1364
    1ee4:	02e6e463          	bltu	a3,a4,1f0c <_malloc_r+0x7cc>
    1ee8:	0127d713          	srl	a4,a5,0x12
    1eec:	07d70613          	add	a2,a4,125
    1ef0:	07c70693          	add	a3,a4,124
    1ef4:	00361613          	sll	a2,a2,0x3
    1ef8:	c35ff06f          	j	1b2c <_malloc_r+0x3ec>
    1efc:	3f800613          	li	a2,1016
    1f00:	07f00593          	li	a1,127
    1f04:	07e00813          	li	a6,126
    1f08:	919ff06f          	j	1820 <_malloc_r+0xe0>
    1f0c:	3f800613          	li	a2,1016
    1f10:	07e00693          	li	a3,126
    1f14:	c19ff06f          	j	1b2c <_malloc_r+0x3ec>
    1f18:	0049a783          	lw	a5,4(s3)
    1f1c:	d9dff06f          	j	1cb8 <_malloc_r+0x578>

00001f20 <__malloc_lock>:
    1f20:	7fffe517          	auipc	a0,0x7fffe
    1f24:	7fc50513          	add	a0,a0,2044 # 8000071c <__lock___malloc_recursive_mutex>
    1f28:	8b4ff06f          	j	fdc <__retarget_lock_acquire_recursive>

00001f2c <__malloc_unlock>:
    1f2c:	7fffe517          	auipc	a0,0x7fffe
    1f30:	7f050513          	add	a0,a0,2032 # 8000071c <__lock___malloc_recursive_mutex>
    1f34:	8acff06f          	j	fe0 <__retarget_lock_release_recursive>

00001f38 <_vfprintf_r>:
    1f38:	e7010113          	add	sp,sp,-400
    1f3c:	18112623          	sw	ra,396(sp)
    1f40:	00b12423          	sw	a1,8(sp)
    1f44:	00c12623          	sw	a2,12(sp)
    1f48:	00d12a23          	sw	a3,20(sp)
    1f4c:	17312e23          	sw	s3,380(sp)
    1f50:	18812423          	sw	s0,392(sp)
    1f54:	00050993          	mv	s3,a0
    1f58:	14d050ef          	jal	78a4 <_localeconv_r>
    1f5c:	00052783          	lw	a5,0(a0)
    1f60:	00078513          	mv	a0,a5
    1f64:	02f12a23          	sw	a5,52(sp)
    1f68:	afcff0ef          	jal	1264 <strlen>
    1f6c:	00050713          	mv	a4,a0
    1f70:	00800613          	li	a2,8
    1f74:	00000593          	li	a1,0
    1f78:	09010513          	add	a0,sp,144
    1f7c:	02e12823          	sw	a4,48(sp)
    1f80:	864ff0ef          	jal	fe4 <memset>
    1f84:	00c12783          	lw	a5,12(sp)
    1f88:	00098863          	beqz	s3,1f98 <_vfprintf_r+0x60>
    1f8c:	0349a703          	lw	a4,52(s3)
    1f90:	00071463          	bnez	a4,1f98 <_vfprintf_r+0x60>
    1f94:	29d0106f          	j	3a30 <_vfprintf_r+0x1af8>
    1f98:	00812703          	lw	a4,8(sp)
    1f9c:	06472683          	lw	a3,100(a4)
    1fa0:	00c71703          	lh	a4,12(a4)
    1fa4:	0016f693          	and	a3,a3,1
    1fa8:	00069863          	bnez	a3,1fb8 <_vfprintf_r+0x80>
    1fac:	20077693          	and	a3,a4,512
    1fb0:	00069463          	bnez	a3,1fb8 <_vfprintf_r+0x80>
    1fb4:	3ec0106f          	j	33a0 <_vfprintf_r+0x1468>
    1fb8:	01271693          	sll	a3,a4,0x12
    1fbc:	0206c863          	bltz	a3,1fec <_vfprintf_r+0xb4>
    1fc0:	00812503          	lw	a0,8(sp)
    1fc4:	000025b7          	lui	a1,0x2
    1fc8:	ffffe637          	lui	a2,0xffffe
    1fcc:	06452683          	lw	a3,100(a0)
    1fd0:	00b76733          	or	a4,a4,a1
    1fd4:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1fd8:	01071713          	sll	a4,a4,0x10
    1fdc:	41075713          	sra	a4,a4,0x10
    1fe0:	00c6f6b3          	and	a3,a3,a2
    1fe4:	00e51623          	sh	a4,12(a0)
    1fe8:	06d52223          	sw	a3,100(a0)
    1fec:	00877693          	and	a3,a4,8
    1ff0:	2a068063          	beqz	a3,2290 <_vfprintf_r+0x358>
    1ff4:	00812683          	lw	a3,8(sp)
    1ff8:	0106a683          	lw	a3,16(a3)
    1ffc:	28068a63          	beqz	a3,2290 <_vfprintf_r+0x358>
    2000:	01a77693          	and	a3,a4,26
    2004:	00a00613          	li	a2,10
    2008:	2ac68c63          	beq	a3,a2,22c0 <_vfprintf_r+0x388>
    200c:	0ac10713          	add	a4,sp,172
    2010:	17512a23          	sw	s5,372(sp)
    2014:	17812423          	sw	s8,360(sp)
    2018:	15b12e23          	sw	s11,348(sp)
    201c:	18912223          	sw	s1,388(sp)
    2020:	19212023          	sw	s2,384(sp)
    2024:	17412c23          	sw	s4,376(sp)
    2028:	17612823          	sw	s6,368(sp)
    202c:	17712623          	sw	s7,364(sp)
    2030:	17912223          	sw	s9,356(sp)
    2034:	17a12023          	sw	s10,352(sp)
    2038:	0ae12023          	sw	a4,160(sp)
    203c:	0a012423          	sw	zero,168(sp)
    2040:	0a012223          	sw	zero,164(sp)
    2044:	00012c23          	sw	zero,24(sp)
    2048:	02012423          	sw	zero,40(sp)
    204c:	02012623          	sw	zero,44(sp)
    2050:	00070413          	mv	s0,a4
    2054:	02012c23          	sw	zero,56(sp)
    2058:	04012023          	sw	zero,64(sp)
    205c:	02012e23          	sw	zero,60(sp)
    2060:	04012623          	sw	zero,76(sp)
    2064:	04012423          	sw	zero,72(sp)
    2068:	00012623          	sw	zero,12(sp)
    206c:	7fffea97          	auipc	s5,0x7fffe
    2070:	4c8a8a93          	add	s5,s5,1224 # 80000534 <__global_locale>
    2074:	02500d93          	li	s11,37
    2078:	00078c13          	mv	s8,a5
    207c:	000c0913          	mv	s2,s8
    2080:	0e4aa483          	lw	s1,228(s5)
    2084:	015050ef          	jal	7898 <__locale_mb_cur_max>
    2088:	00050693          	mv	a3,a0
    208c:	09010713          	add	a4,sp,144
    2090:	00090613          	mv	a2,s2
    2094:	08010593          	add	a1,sp,128
    2098:	00098513          	mv	a0,s3
    209c:	000480e7          	jalr	s1
    20a0:	2c050a63          	beqz	a0,2374 <_vfprintf_r+0x43c>
    20a4:	2a054a63          	bltz	a0,2358 <_vfprintf_r+0x420>
    20a8:	08012783          	lw	a5,128(sp)
    20ac:	01b78663          	beq	a5,s11,20b8 <_vfprintf_r+0x180>
    20b0:	00a90933          	add	s2,s2,a0
    20b4:	fcdff06f          	j	2080 <_vfprintf_r+0x148>
    20b8:	00050493          	mv	s1,a0
    20bc:	41890cb3          	sub	s9,s2,s8
    20c0:	2d891063          	bne	s2,s8,2380 <_vfprintf_r+0x448>
    20c4:	fff00313          	li	t1,-1
    20c8:	00000e93          	li	t4,0
    20cc:	00194e03          	lbu	t3,1(s2)
    20d0:	06010ba3          	sb	zero,119(sp)
    20d4:	00190913          	add	s2,s2,1
    20d8:	00000b93          	li	s7,0
    20dc:	05a00493          	li	s1,90
    20e0:	000e8a13          	mv	s4,t4
    20e4:	00030b13          	mv	s6,t1
    20e8:	00190913          	add	s2,s2,1
    20ec:	fe0e0793          	add	a5,t3,-32
    20f0:	04f4ea63          	bltu	s1,a5,2144 <_vfprintf_r+0x20c>
    20f4:	0000d717          	auipc	a4,0xd
    20f8:	39070713          	add	a4,a4,912 # f484 <_ctype_+0x104>
    20fc:	00279793          	sll	a5,a5,0x2
    2100:	00e787b3          	add	a5,a5,a4
    2104:	0007a783          	lw	a5,0(a5)
    2108:	00e787b3          	add	a5,a5,a4
    210c:	00078067          	jr	a5
    2110:	00000b93          	li	s7,0
    2114:	fd0e0713          	add	a4,t3,-48
    2118:	00900693          	li	a3,9
    211c:	00094e03          	lbu	t3,0(s2)
    2120:	002b9793          	sll	a5,s7,0x2
    2124:	017787b3          	add	a5,a5,s7
    2128:	00179793          	sll	a5,a5,0x1
    212c:	00f70bb3          	add	s7,a4,a5
    2130:	fd0e0713          	add	a4,t3,-48
    2134:	00190913          	add	s2,s2,1
    2138:	fee6f2e3          	bgeu	a3,a4,211c <_vfprintf_r+0x1e4>
    213c:	fe0e0793          	add	a5,t3,-32
    2140:	faf4fae3          	bgeu	s1,a5,20f4 <_vfprintf_r+0x1bc>
    2144:	000a0e93          	mv	t4,s4
    2148:	260e0a63          	beqz	t3,23bc <_vfprintf_r+0x484>
    214c:	0fc10623          	sb	t3,236(sp)
    2150:	06010ba3          	sb	zero,119(sp)
    2154:	00100c93          	li	s9,1
    2158:	00000613          	li	a2,0
    215c:	00012823          	sw	zero,16(sp)
    2160:	00100d13          	li	s10,1
    2164:	00000313          	li	t1,0
    2168:	02012223          	sw	zero,36(sp)
    216c:	02012023          	sw	zero,32(sp)
    2170:	00000a13          	li	s4,0
    2174:	0ec10c13          	add	s8,sp,236
    2178:	002ef293          	and	t0,t4,2
    217c:	00028463          	beqz	t0,2184 <_vfprintf_r+0x24c>
    2180:	002c8c93          	add	s9,s9,2
    2184:	084eff93          	and	t6,t4,132
    2188:	0a812483          	lw	s1,168(sp)
    218c:	000f9663          	bnez	t6,2198 <_vfprintf_r+0x260>
    2190:	419b8733          	sub	a4,s7,s9
    2194:	40e04663          	bgtz	a4,25a0 <_vfprintf_r+0x668>
    2198:	02060a63          	beqz	a2,21cc <_vfprintf_r+0x294>
    219c:	0a412703          	lw	a4,164(sp)
    21a0:	07710613          	add	a2,sp,119
    21a4:	00148493          	add	s1,s1,1
    21a8:	00170713          	add	a4,a4,1
    21ac:	00100793          	li	a5,1
    21b0:	00c42023          	sw	a2,0(s0)
    21b4:	00f42223          	sw	a5,4(s0)
    21b8:	0a912423          	sw	s1,168(sp)
    21bc:	0ae12223          	sw	a4,164(sp)
    21c0:	00700613          	li	a2,7
    21c4:	00840413          	add	s0,s0,8
    21c8:	4ce64863          	blt	a2,a4,2698 <_vfprintf_r+0x760>
    21cc:	02028a63          	beqz	t0,2200 <_vfprintf_r+0x2c8>
    21d0:	0a412703          	lw	a4,164(sp)
    21d4:	07810613          	add	a2,sp,120
    21d8:	00c42023          	sw	a2,0(s0)
    21dc:	00248493          	add	s1,s1,2
    21e0:	00200613          	li	a2,2
    21e4:	00170713          	add	a4,a4,1
    21e8:	00c42223          	sw	a2,4(s0)
    21ec:	0a912423          	sw	s1,168(sp)
    21f0:	0ae12223          	sw	a4,164(sp)
    21f4:	00700613          	li	a2,7
    21f8:	00840413          	add	s0,s0,8
    21fc:	5ce644e3          	blt	a2,a4,2fc4 <_vfprintf_r+0x108c>
    2200:	08000713          	li	a4,128
    2204:	3aef80e3          	beq	t6,a4,2da4 <_vfprintf_r+0xe6c>
    2208:	41a30b33          	sub	s6,t1,s10
    220c:	4b604ae3          	bgtz	s6,2ec0 <_vfprintf_r+0xf88>
    2210:	100ef713          	and	a4,t4,256
    2214:	1a0710e3          	bnez	a4,2bb4 <_vfprintf_r+0xc7c>
    2218:	0a412783          	lw	a5,164(sp)
    221c:	01a484b3          	add	s1,s1,s10
    2220:	01842023          	sw	s8,0(s0)
    2224:	00178793          	add	a5,a5,1
    2228:	01a42223          	sw	s10,4(s0)
    222c:	0a912423          	sw	s1,168(sp)
    2230:	0af12223          	sw	a5,164(sp)
    2234:	00700713          	li	a4,7
    2238:	58f74c63          	blt	a4,a5,27d0 <_vfprintf_r+0x898>
    223c:	00840413          	add	s0,s0,8
    2240:	004eff13          	and	t5,t4,4
    2244:	000f0663          	beqz	t5,2250 <_vfprintf_r+0x318>
    2248:	419b8d33          	sub	s10,s7,s9
    224c:	5ba04ce3          	bgtz	s10,3004 <_vfprintf_r+0x10cc>
    2250:	000b8e93          	mv	t4,s7
    2254:	019bd463          	bge	s7,s9,225c <_vfprintf_r+0x324>
    2258:	000c8e93          	mv	t4,s9
    225c:	00c12783          	lw	a5,12(sp)
    2260:	01d787b3          	add	a5,a5,t4
    2264:	00f12623          	sw	a5,12(sp)
    2268:	18049663          	bnez	s1,23f4 <_vfprintf_r+0x4bc>
    226c:	01012783          	lw	a5,16(sp)
    2270:	0a012223          	sw	zero,164(sp)
    2274:	00078863          	beqz	a5,2284 <_vfprintf_r+0x34c>
    2278:	01012583          	lw	a1,16(sp)
    227c:	00098513          	mv	a0,s3
    2280:	9b4ff0ef          	jal	1434 <_free_r>
    2284:	0ac10413          	add	s0,sp,172
    2288:	00090c13          	mv	s8,s2
    228c:	df1ff06f          	j	207c <_vfprintf_r+0x144>
    2290:	00812403          	lw	s0,8(sp)
    2294:	00098513          	mv	a0,s3
    2298:	00f12623          	sw	a5,12(sp)
    229c:	00040593          	mv	a1,s0
    22a0:	118050ef          	jal	73b8 <__swsetup_r>
    22a4:	00050463          	beqz	a0,22ac <_vfprintf_r+0x374>
    22a8:	5600206f          	j	4808 <_vfprintf_r+0x28d0>
    22ac:	00c41703          	lh	a4,12(s0)
    22b0:	00a00613          	li	a2,10
    22b4:	00c12783          	lw	a5,12(sp)
    22b8:	01a77693          	and	a3,a4,26
    22bc:	d4c698e3          	bne	a3,a2,200c <_vfprintf_r+0xd4>
    22c0:	00812603          	lw	a2,8(sp)
    22c4:	00e61683          	lh	a3,14(a2)
    22c8:	d406c2e3          	bltz	a3,200c <_vfprintf_r+0xd4>
    22cc:	06462683          	lw	a3,100(a2)
    22d0:	0016f693          	and	a3,a3,1
    22d4:	00069863          	bnez	a3,22e4 <_vfprintf_r+0x3ac>
    22d8:	20077713          	and	a4,a4,512
    22dc:	00071463          	bnez	a4,22e4 <_vfprintf_r+0x3ac>
    22e0:	53d0106f          	j	401c <_vfprintf_r+0x20e4>
    22e4:	01412683          	lw	a3,20(sp)
    22e8:	00812583          	lw	a1,8(sp)
    22ec:	00098513          	mv	a0,s3
    22f0:	00078613          	mv	a2,a5
    22f4:	0e5020ef          	jal	4bd8 <__sbprintf>
    22f8:	18c12083          	lw	ra,396(sp)
    22fc:	18812403          	lw	s0,392(sp)
    2300:	00a12623          	sw	a0,12(sp)
    2304:	00c12503          	lw	a0,12(sp)
    2308:	17c12983          	lw	s3,380(sp)
    230c:	19010113          	add	sp,sp,400
    2310:	00008067          	ret
    2314:	00098513          	mv	a0,s3
    2318:	58c050ef          	jal	78a4 <_localeconv_r>
    231c:	00452783          	lw	a5,4(a0)
    2320:	00078513          	mv	a0,a5
    2324:	04f12423          	sw	a5,72(sp)
    2328:	f3dfe0ef          	jal	1264 <strlen>
    232c:	00050793          	mv	a5,a0
    2330:	00098513          	mv	a0,s3
    2334:	00078c93          	mv	s9,a5
    2338:	04f12623          	sw	a5,76(sp)
    233c:	568050ef          	jal	78a4 <_localeconv_r>
    2340:	00852703          	lw	a4,8(a0)
    2344:	02e12e23          	sw	a4,60(sp)
    2348:	000c8463          	beqz	s9,2350 <_vfprintf_r+0x418>
    234c:	1ec0106f          	j	3538 <_vfprintf_r+0x1600>
    2350:	00094e03          	lbu	t3,0(s2)
    2354:	d95ff06f          	j	20e8 <_vfprintf_r+0x1b0>
    2358:	00800613          	li	a2,8
    235c:	00000593          	li	a1,0
    2360:	09010513          	add	a0,sp,144
    2364:	c81fe0ef          	jal	fe4 <memset>
    2368:	00100513          	li	a0,1
    236c:	00a90933          	add	s2,s2,a0
    2370:	d11ff06f          	j	2080 <_vfprintf_r+0x148>
    2374:	00050493          	mv	s1,a0
    2378:	41890cb3          	sub	s9,s2,s8
    237c:	05890063          	beq	s2,s8,23bc <_vfprintf_r+0x484>
    2380:	0a812683          	lw	a3,168(sp)
    2384:	0a412703          	lw	a4,164(sp)
    2388:	01842023          	sw	s8,0(s0)
    238c:	019686b3          	add	a3,a3,s9
    2390:	00170713          	add	a4,a4,1
    2394:	01942223          	sw	s9,4(s0)
    2398:	0ad12423          	sw	a3,168(sp)
    239c:	0ae12223          	sw	a4,164(sp)
    23a0:	00700693          	li	a3,7
    23a4:	00840413          	add	s0,s0,8
    23a8:	02e6c863          	blt	a3,a4,23d8 <_vfprintf_r+0x4a0>
    23ac:	00c12783          	lw	a5,12(sp)
    23b0:	019787b3          	add	a5,a5,s9
    23b4:	00f12623          	sw	a5,12(sp)
    23b8:	d00496e3          	bnez	s1,20c4 <_vfprintf_r+0x18c>
    23bc:	0a812783          	lw	a5,168(sp)
    23c0:	00078463          	beqz	a5,23c8 <_vfprintf_r+0x490>
    23c4:	4090106f          	j	3fcc <_vfprintf_r+0x2094>
    23c8:	00812783          	lw	a5,8(sp)
    23cc:	0a012223          	sw	zero,164(sp)
    23d0:	00c79783          	lh	a5,12(a5)
    23d4:	0500006f          	j	2424 <_vfprintf_r+0x4ec>
    23d8:	00812583          	lw	a1,8(sp)
    23dc:	0a010613          	add	a2,sp,160
    23e0:	00098513          	mv	a0,s3
    23e4:	211020ef          	jal	4df4 <__sprint_r>
    23e8:	02051a63          	bnez	a0,241c <_vfprintf_r+0x4e4>
    23ec:	0ac10413          	add	s0,sp,172
    23f0:	fbdff06f          	j	23ac <_vfprintf_r+0x474>
    23f4:	00812583          	lw	a1,8(sp)
    23f8:	0a010613          	add	a2,sp,160
    23fc:	00098513          	mv	a0,s3
    2400:	1f5020ef          	jal	4df4 <__sprint_r>
    2404:	e60504e3          	beqz	a0,226c <_vfprintf_r+0x334>
    2408:	01012283          	lw	t0,16(sp)
    240c:	00028863          	beqz	t0,241c <_vfprintf_r+0x4e4>
    2410:	00028593          	mv	a1,t0
    2414:	00098513          	mv	a0,s3
    2418:	81cff0ef          	jal	1434 <_free_r>
    241c:	00812783          	lw	a5,8(sp)
    2420:	00c79783          	lh	a5,12(a5)
    2424:	00812703          	lw	a4,8(sp)
    2428:	06472703          	lw	a4,100(a4)
    242c:	00177713          	and	a4,a4,1
    2430:	3c070463          	beqz	a4,27f8 <_vfprintf_r+0x8c0>
    2434:	0407f793          	and	a5,a5,64
    2438:	18412483          	lw	s1,388(sp)
    243c:	18012903          	lw	s2,384(sp)
    2440:	17812a03          	lw	s4,376(sp)
    2444:	17412a83          	lw	s5,372(sp)
    2448:	17012b03          	lw	s6,368(sp)
    244c:	16c12b83          	lw	s7,364(sp)
    2450:	16812c03          	lw	s8,360(sp)
    2454:	16412c83          	lw	s9,356(sp)
    2458:	16012d03          	lw	s10,352(sp)
    245c:	15c12d83          	lw	s11,348(sp)
    2460:	00078463          	beqz	a5,2468 <_vfprintf_r+0x530>
    2464:	3d00206f          	j	4834 <_vfprintf_r+0x28fc>
    2468:	18c12083          	lw	ra,396(sp)
    246c:	18812403          	lw	s0,392(sp)
    2470:	00c12503          	lw	a0,12(sp)
    2474:	17c12983          	lw	s3,380(sp)
    2478:	19010113          	add	sp,sp,400
    247c:	00008067          	ret
    2480:	008a7713          	and	a4,s4,8
    2484:	000a0e93          	mv	t4,s4
    2488:	000b0313          	mv	t1,s6
    248c:	00070463          	beqz	a4,2494 <_vfprintf_r+0x55c>
    2490:	0200106f          	j	34b0 <_vfprintf_r+0x1578>
    2494:	01412783          	lw	a5,20(sp)
    2498:	00778b13          	add	s6,a5,7
    249c:	ff8b7b13          	and	s6,s6,-8
    24a0:	000b2783          	lw	a5,0(s6)
    24a4:	02f12423          	sw	a5,40(sp)
    24a8:	004b2783          	lw	a5,4(s6)
    24ac:	02f12623          	sw	a5,44(sp)
    24b0:	008b0793          	add	a5,s6,8
    24b4:	00f12a23          	sw	a5,20(sp)
    24b8:	02c12a03          	lw	s4,44(sp)
    24bc:	7fffe717          	auipc	a4,0x7fffe
    24c0:	1e470713          	add	a4,a4,484 # 800006a0 <__global_locale+0x16c>
    24c4:	00072c83          	lw	s9,0(a4)
    24c8:	00472d03          	lw	s10,4(a4)
    24cc:	02812b03          	lw	s6,40(sp)
    24d0:	001a1493          	sll	s1,s4,0x1
    24d4:	0014d493          	srl	s1,s1,0x1
    24d8:	000b0513          	mv	a0,s6
    24dc:	00048593          	mv	a1,s1
    24e0:	000c8613          	mv	a2,s9
    24e4:	000d0693          	mv	a3,s10
    24e8:	02612223          	sw	t1,36(sp)
    24ec:	03c12023          	sw	t3,32(sp)
    24f0:	01d12823          	sw	t4,16(sp)
    24f4:	1700c0ef          	jal	e664 <__unorddf2>
    24f8:	01012e83          	lw	t4,16(sp)
    24fc:	02012e03          	lw	t3,32(sp)
    2500:	02412303          	lw	t1,36(sp)
    2504:	00050463          	beqz	a0,250c <_vfprintf_r+0x5d4>
    2508:	4080106f          	j	3910 <_vfprintf_r+0x19d8>
    250c:	000b0513          	mv	a0,s6
    2510:	00048593          	mv	a1,s1
    2514:	000c8613          	mv	a2,s9
    2518:	000d0693          	mv	a3,s10
    251c:	7a90a0ef          	jal	d4c4 <__ledf2>
    2520:	01012e83          	lw	t4,16(sp)
    2524:	02012e03          	lw	t3,32(sp)
    2528:	02412303          	lw	t1,36(sp)
    252c:	00a04463          	bgtz	a0,2534 <_vfprintf_r+0x5fc>
    2530:	3e00106f          	j	3910 <_vfprintf_r+0x19d8>
    2534:	000b0513          	mv	a0,s6
    2538:	000a0593          	mv	a1,s4
    253c:	00000613          	li	a2,0
    2540:	00000693          	li	a3,0
    2544:	7810a0ef          	jal	d4c4 <__ledf2>
    2548:	01012e83          	lw	t4,16(sp)
    254c:	02012e03          	lw	t3,32(sp)
    2550:	00055463          	bgez	a0,2558 <_vfprintf_r+0x620>
    2554:	6650106f          	j	43b8 <_vfprintf_r+0x2480>
    2558:	07714603          	lbu	a2,119(sp)
    255c:	04700713          	li	a4,71
    2560:	0000dc17          	auipc	s8,0xd
    2564:	c34c0c13          	add	s8,s8,-972 # f194 <__fini_array_end+0x308>
    2568:	01c74663          	blt	a4,t3,2574 <_vfprintf_r+0x63c>
    256c:	0000dc17          	auipc	s8,0xd
    2570:	c24c0c13          	add	s8,s8,-988 # f190 <__fini_array_end+0x304>
    2574:	00012823          	sw	zero,16(sp)
    2578:	02012223          	sw	zero,36(sp)
    257c:	02012023          	sw	zero,32(sp)
    2580:	f7fefe93          	and	t4,t4,-129
    2584:	00300c93          	li	s9,3
    2588:	00300d13          	li	s10,3
    258c:	00000313          	li	t1,0
    2590:	00000a13          	li	s4,0
    2594:	be0602e3          	beqz	a2,2178 <_vfprintf_r+0x240>
    2598:	001c8c93          	add	s9,s9,1
    259c:	bddff06f          	j	2178 <_vfprintf_r+0x240>
    25a0:	01000593          	li	a1,16
    25a4:	0a412603          	lw	a2,164(sp)
    25a8:	0000db17          	auipc	s6,0xd
    25ac:	0f0b0b13          	add	s6,s6,240 # f698 <blanks.1>
    25b0:	0ae5dc63          	bge	a1,a4,2668 <_vfprintf_r+0x730>
    25b4:	00040793          	mv	a5,s0
    25b8:	00048693          	mv	a3,s1
    25bc:	01000893          	li	a7,16
    25c0:	000b0493          	mv	s1,s6
    25c4:	00700393          	li	t2,7
    25c8:	000a0b13          	mv	s6,s4
    25cc:	04512223          	sw	t0,68(sp)
    25d0:	05f12823          	sw	t6,80(sp)
    25d4:	05d12a23          	sw	t4,84(sp)
    25d8:	05c12c23          	sw	t3,88(sp)
    25dc:	00070413          	mv	s0,a4
    25e0:	00030a13          	mv	s4,t1
    25e4:	00c0006f          	j	25f0 <_vfprintf_r+0x6b8>
    25e8:	ff040413          	add	s0,s0,-16
    25ec:	0488da63          	bge	a7,s0,2640 <_vfprintf_r+0x708>
    25f0:	01068693          	add	a3,a3,16
    25f4:	00160613          	add	a2,a2,1
    25f8:	0097a023          	sw	s1,0(a5)
    25fc:	0117a223          	sw	a7,4(a5)
    2600:	0ad12423          	sw	a3,168(sp)
    2604:	0ac12223          	sw	a2,164(sp)
    2608:	00878793          	add	a5,a5,8
    260c:	fcc3dee3          	bge	t2,a2,25e8 <_vfprintf_r+0x6b0>
    2610:	00812583          	lw	a1,8(sp)
    2614:	0a010613          	add	a2,sp,160
    2618:	00098513          	mv	a0,s3
    261c:	7d8020ef          	jal	4df4 <__sprint_r>
    2620:	de0514e3          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    2624:	01000893          	li	a7,16
    2628:	ff040413          	add	s0,s0,-16
    262c:	0a812683          	lw	a3,168(sp)
    2630:	0a412603          	lw	a2,164(sp)
    2634:	0ac10793          	add	a5,sp,172
    2638:	00700393          	li	t2,7
    263c:	fa88cae3          	blt	a7,s0,25f0 <_vfprintf_r+0x6b8>
    2640:	04412283          	lw	t0,68(sp)
    2644:	05012f83          	lw	t6,80(sp)
    2648:	05412e83          	lw	t4,84(sp)
    264c:	05812e03          	lw	t3,88(sp)
    2650:	000a0313          	mv	t1,s4
    2654:	00040713          	mv	a4,s0
    2658:	000b0a13          	mv	s4,s6
    265c:	00078413          	mv	s0,a5
    2660:	00048b13          	mv	s6,s1
    2664:	00068493          	mv	s1,a3
    2668:	00e484b3          	add	s1,s1,a4
    266c:	00160613          	add	a2,a2,1
    2670:	00e42223          	sw	a4,4(s0)
    2674:	01642023          	sw	s6,0(s0)
    2678:	0a912423          	sw	s1,168(sp)
    267c:	0ac12223          	sw	a2,164(sp)
    2680:	00700713          	li	a4,7
    2684:	00c75463          	bge	a4,a2,268c <_vfprintf_r+0x754>
    2688:	2380106f          	j	38c0 <_vfprintf_r+0x1988>
    268c:	07714603          	lbu	a2,119(sp)
    2690:	00840413          	add	s0,s0,8
    2694:	b05ff06f          	j	2198 <_vfprintf_r+0x260>
    2698:	00812583          	lw	a1,8(sp)
    269c:	0a010613          	add	a2,sp,160
    26a0:	00098513          	mv	a0,s3
    26a4:	04612e23          	sw	t1,92(sp)
    26a8:	05c12c23          	sw	t3,88(sp)
    26ac:	05d12a23          	sw	t4,84(sp)
    26b0:	05f12823          	sw	t6,80(sp)
    26b4:	04512223          	sw	t0,68(sp)
    26b8:	73c020ef          	jal	4df4 <__sprint_r>
    26bc:	d40516e3          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    26c0:	0a812483          	lw	s1,168(sp)
    26c4:	05c12303          	lw	t1,92(sp)
    26c8:	05812e03          	lw	t3,88(sp)
    26cc:	05412e83          	lw	t4,84(sp)
    26d0:	05012f83          	lw	t6,80(sp)
    26d4:	04412283          	lw	t0,68(sp)
    26d8:	0ac10413          	add	s0,sp,172
    26dc:	af1ff06f          	j	21cc <_vfprintf_r+0x294>
    26e0:	0a412d03          	lw	s10,164(sp)
    26e4:	01812783          	lw	a5,24(sp)
    26e8:	00100693          	li	a3,1
    26ec:	01842023          	sw	s8,0(s0)
    26f0:	00148493          	add	s1,s1,1
    26f4:	001d0d13          	add	s10,s10,1
    26f8:	00840b13          	add	s6,s0,8
    26fc:	32f6d0e3          	bge	a3,a5,321c <_vfprintf_r+0x12e4>
    2700:	00100693          	li	a3,1
    2704:	00d42223          	sw	a3,4(s0)
    2708:	0a912423          	sw	s1,168(sp)
    270c:	0ba12223          	sw	s10,164(sp)
    2710:	00700693          	li	a3,7
    2714:	01a6d463          	bge	a3,s10,271c <_vfprintf_r+0x7e4>
    2718:	0680106f          	j	3780 <_vfprintf_r+0x1848>
    271c:	03012783          	lw	a5,48(sp)
    2720:	03412703          	lw	a4,52(sp)
    2724:	001d0d13          	add	s10,s10,1
    2728:	00f484b3          	add	s1,s1,a5
    272c:	00eb2023          	sw	a4,0(s6)
    2730:	00fb2223          	sw	a5,4(s6)
    2734:	0a912423          	sw	s1,168(sp)
    2738:	0ba12223          	sw	s10,164(sp)
    273c:	00700693          	li	a3,7
    2740:	008b0b13          	add	s6,s6,8
    2744:	01a6d463          	bge	a3,s10,274c <_vfprintf_r+0x814>
    2748:	0680106f          	j	37b0 <_vfprintf_r+0x1878>
    274c:	02812603          	lw	a2,40(sp)
    2750:	02c12683          	lw	a3,44(sp)
    2754:	01812783          	lw	a5,24(sp)
    2758:	00060513          	mv	a0,a2
    275c:	00068593          	mv	a1,a3
    2760:	00000613          	li	a2,0
    2764:	00000693          	li	a3,0
    2768:	03d12023          	sw	t4,32(sp)
    276c:	fff78413          	add	s0,a5,-1
    2770:	3c90a0ef          	jal	d338 <__eqdf2>
    2774:	02012e83          	lw	t4,32(sp)
    2778:	2e0506e3          	beqz	a0,3264 <_vfprintf_r+0x132c>
    277c:	001c0793          	add	a5,s8,1
    2780:	001d0d13          	add	s10,s10,1
    2784:	008484b3          	add	s1,s1,s0
    2788:	00fb2023          	sw	a5,0(s6)
    278c:	008b2223          	sw	s0,4(s6)
    2790:	0a912423          	sw	s1,168(sp)
    2794:	0ba12223          	sw	s10,164(sp)
    2798:	00700793          	li	a5,7
    279c:	008b0b13          	add	s6,s6,8
    27a0:	29a7cce3          	blt	a5,s10,3238 <_vfprintf_r+0x1300>
    27a4:	04012703          	lw	a4,64(sp)
    27a8:	08810793          	add	a5,sp,136
    27ac:	001d0d13          	add	s10,s10,1
    27b0:	009704b3          	add	s1,a4,s1
    27b4:	00fb2023          	sw	a5,0(s6)
    27b8:	00eb2223          	sw	a4,4(s6)
    27bc:	0a912423          	sw	s1,168(sp)
    27c0:	0ba12223          	sw	s10,164(sp)
    27c4:	00700793          	li	a5,7
    27c8:	008b0413          	add	s0,s6,8
    27cc:	a7a7dae3          	bge	a5,s10,2240 <_vfprintf_r+0x308>
    27d0:	00812583          	lw	a1,8(sp)
    27d4:	0a010613          	add	a2,sp,160
    27d8:	00098513          	mv	a0,s3
    27dc:	03d12023          	sw	t4,32(sp)
    27e0:	614020ef          	jal	4df4 <__sprint_r>
    27e4:	c20512e3          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    27e8:	0a812483          	lw	s1,168(sp)
    27ec:	02012e83          	lw	t4,32(sp)
    27f0:	0ac10413          	add	s0,sp,172
    27f4:	a4dff06f          	j	2240 <_vfprintf_r+0x308>
    27f8:	2007f713          	and	a4,a5,512
    27fc:	c2071ce3          	bnez	a4,2434 <_vfprintf_r+0x4fc>
    2800:	00812403          	lw	s0,8(sp)
    2804:	05842503          	lw	a0,88(s0)
    2808:	fd8fe0ef          	jal	fe0 <__retarget_lock_release_recursive>
    280c:	00c41783          	lh	a5,12(s0)
    2810:	c25ff06f          	j	2434 <_vfprintf_r+0x4fc>
    2814:	00094e03          	lbu	t3,0(s2)
    2818:	020a6a13          	or	s4,s4,32
    281c:	8cdff06f          	j	20e8 <_vfprintf_r+0x1b0>
    2820:	01412703          	lw	a4,20(sp)
    2824:	04300793          	li	a5,67
    2828:	000a0e93          	mv	t4,s4
    282c:	00470493          	add	s1,a4,4
    2830:	64fe08e3          	beq	t3,a5,3680 <_vfprintf_r+0x1748>
    2834:	010a7793          	and	a5,s4,16
    2838:	640794e3          	bnez	a5,3680 <_vfprintf_r+0x1748>
    283c:	01412783          	lw	a5,20(sp)
    2840:	00100c93          	li	s9,1
    2844:	00100d13          	li	s10,1
    2848:	0007a783          	lw	a5,0(a5)
    284c:	0ec10c13          	add	s8,sp,236
    2850:	0ef10623          	sb	a5,236(sp)
    2854:	06010ba3          	sb	zero,119(sp)
    2858:	00912a23          	sw	s1,20(sp)
    285c:	00000613          	li	a2,0
    2860:	00012823          	sw	zero,16(sp)
    2864:	00000313          	li	t1,0
    2868:	02012223          	sw	zero,36(sp)
    286c:	02012023          	sw	zero,32(sp)
    2870:	00000a13          	li	s4,0
    2874:	905ff06f          	j	2178 <_vfprintf_r+0x240>
    2878:	01412783          	lw	a5,20(sp)
    287c:	06010ba3          	sb	zero,119(sp)
    2880:	000b0313          	mv	t1,s6
    2884:	0007ac03          	lw	s8,0(a5)
    2888:	000a0e93          	mv	t4,s4
    288c:	00478b13          	add	s6,a5,4
    2890:	5a0c0ce3          	beqz	s8,3648 <_vfprintf_r+0x1710>
    2894:	05300713          	li	a4,83
    2898:	00ee1463          	bne	t3,a4,28a0 <_vfprintf_r+0x968>
    289c:	1d00106f          	j	3a6c <_vfprintf_r+0x1b34>
    28a0:	010a7a13          	and	s4,s4,16
    28a4:	000a0463          	beqz	s4,28ac <_vfprintf_r+0x974>
    28a8:	1c40106f          	j	3a6c <_vfprintf_r+0x1b34>
    28ac:	00035463          	bgez	t1,28b4 <_vfprintf_r+0x97c>
    28b0:	6d40106f          	j	3f84 <_vfprintf_r+0x204c>
    28b4:	00030613          	mv	a2,t1
    28b8:	00000593          	li	a1,0
    28bc:	000c0513          	mv	a0,s8
    28c0:	03d12023          	sw	t4,32(sp)
    28c4:	00612a23          	sw	t1,20(sp)
    28c8:	661040ef          	jal	7728 <memchr>
    28cc:	00a12823          	sw	a0,16(sp)
    28d0:	01412303          	lw	t1,20(sp)
    28d4:	02012e83          	lw	t4,32(sp)
    28d8:	00051463          	bnez	a0,28e0 <_vfprintf_r+0x9a8>
    28dc:	1780206f          	j	4a54 <_vfprintf_r+0x2b1c>
    28e0:	01012783          	lw	a5,16(sp)
    28e4:	07714603          	lbu	a2,119(sp)
    28e8:	01612a23          	sw	s6,20(sp)
    28ec:	41878d33          	sub	s10,a5,s8
    28f0:	fffd4813          	not	a6,s10
    28f4:	41f85813          	sra	a6,a6,0x1f
    28f8:	02012223          	sw	zero,36(sp)
    28fc:	02012023          	sw	zero,32(sp)
    2900:	00012823          	sw	zero,16(sp)
    2904:	010d7cb3          	and	s9,s10,a6
    2908:	00000313          	li	t1,0
    290c:	07300e13          	li	t3,115
    2910:	860604e3          	beqz	a2,2178 <_vfprintf_r+0x240>
    2914:	c85ff06f          	j	2598 <_vfprintf_r+0x660>
    2918:	01412783          	lw	a5,20(sp)
    291c:	0007ab83          	lw	s7,0(a5)
    2920:	00478793          	add	a5,a5,4
    2924:	2a0bdae3          	bgez	s7,33d8 <_vfprintf_r+0x14a0>
    2928:	41700bb3          	neg	s7,s7
    292c:	00f12a23          	sw	a5,20(sp)
    2930:	00094e03          	lbu	t3,0(s2)
    2934:	004a6a13          	or	s4,s4,4
    2938:	fb0ff06f          	j	20e8 <_vfprintf_r+0x1b0>
    293c:	02b00793          	li	a5,43
    2940:	00094e03          	lbu	t3,0(s2)
    2944:	06f10ba3          	sb	a5,119(sp)
    2948:	fa0ff06f          	j	20e8 <_vfprintf_r+0x1b0>
    294c:	000b0313          	mv	t1,s6
    2950:	010a6613          	or	a2,s4,16
    2954:	02067793          	and	a5,a2,32
    2958:	1c0780e3          	beqz	a5,3318 <_vfprintf_r+0x13e0>
    295c:	01412783          	lw	a5,20(sp)
    2960:	00778b13          	add	s6,a5,7
    2964:	ff8b7b13          	and	s6,s6,-8
    2968:	000b2d03          	lw	s10,0(s6)
    296c:	004b2c83          	lw	s9,4(s6)
    2970:	008b0793          	add	a5,s6,8
    2974:	00f12a23          	sw	a5,20(sp)
    2978:	00100793          	li	a5,1
    297c:	00000713          	li	a4,0
    2980:	06e10ba3          	sb	a4,119(sp)
    2984:	34034c63          	bltz	t1,2cdc <_vfprintf_r+0xda4>
    2988:	019d6733          	or	a4,s10,s9
    298c:	f7f67e93          	and	t4,a2,-129
    2990:	34071463          	bnez	a4,2cd8 <_vfprintf_r+0xda0>
    2994:	3a031a63          	bnez	t1,2d48 <_vfprintf_r+0xe10>
    2998:	5c079ee3          	bnez	a5,3774 <_vfprintf_r+0x183c>
    299c:	00167d13          	and	s10,a2,1
    29a0:	15010c13          	add	s8,sp,336
    29a4:	2c0d10e3          	bnez	s10,3464 <_vfprintf_r+0x152c>
    29a8:	07714603          	lbu	a2,119(sp)
    29ac:	00030c93          	mv	s9,t1
    29b0:	01a35463          	bge	t1,s10,29b8 <_vfprintf_r+0xa80>
    29b4:	000d0c93          	mv	s9,s10
    29b8:	00012823          	sw	zero,16(sp)
    29bc:	02012223          	sw	zero,36(sp)
    29c0:	02012023          	sw	zero,32(sp)
    29c4:	00000a13          	li	s4,0
    29c8:	fa060863          	beqz	a2,2178 <_vfprintf_r+0x240>
    29cc:	bcdff06f          	j	2598 <_vfprintf_r+0x660>
    29d0:	00094e03          	lbu	t3,0(s2)
    29d4:	080a6a13          	or	s4,s4,128
    29d8:	f10ff06f          	j	20e8 <_vfprintf_r+0x1b0>
    29dc:	00094e03          	lbu	t3,0(s2)
    29e0:	02a00793          	li	a5,42
    29e4:	00190693          	add	a3,s2,1
    29e8:	00fe1463          	bne	t3,a5,29f0 <_vfprintf_r+0xab8>
    29ec:	1100206f          	j	4afc <_vfprintf_r+0x2bc4>
    29f0:	fd0e0713          	add	a4,t3,-48
    29f4:	00900793          	li	a5,9
    29f8:	00000b13          	li	s6,0
    29fc:	00900613          	li	a2,9
    2a00:	02e7e463          	bltu	a5,a4,2a28 <_vfprintf_r+0xaf0>
    2a04:	0006ce03          	lbu	t3,0(a3)
    2a08:	002b1793          	sll	a5,s6,0x2
    2a0c:	016787b3          	add	a5,a5,s6
    2a10:	00179793          	sll	a5,a5,0x1
    2a14:	00e78b33          	add	s6,a5,a4
    2a18:	fd0e0713          	add	a4,t3,-48
    2a1c:	00168693          	add	a3,a3,1
    2a20:	fee672e3          	bgeu	a2,a4,2a04 <_vfprintf_r+0xacc>
    2a24:	320b4ce3          	bltz	s6,355c <_vfprintf_r+0x1624>
    2a28:	00068913          	mv	s2,a3
    2a2c:	ec0ff06f          	j	20ec <_vfprintf_r+0x1b4>
    2a30:	00094e03          	lbu	t3,0(s2)
    2a34:	001a6a13          	or	s4,s4,1
    2a38:	eb0ff06f          	j	20e8 <_vfprintf_r+0x1b0>
    2a3c:	07714783          	lbu	a5,119(sp)
    2a40:	00094e03          	lbu	t3,0(s2)
    2a44:	ea079263          	bnez	a5,20e8 <_vfprintf_r+0x1b0>
    2a48:	02000793          	li	a5,32
    2a4c:	06f10ba3          	sb	a5,119(sp)
    2a50:	e98ff06f          	j	20e8 <_vfprintf_r+0x1b0>
    2a54:	00094e03          	lbu	t3,0(s2)
    2a58:	06c00793          	li	a5,108
    2a5c:	3afe00e3          	beq	t3,a5,35fc <_vfprintf_r+0x16c4>
    2a60:	010a6a13          	or	s4,s4,16
    2a64:	e84ff06f          	j	20e8 <_vfprintf_r+0x1b0>
    2a68:	00094e03          	lbu	t3,0(s2)
    2a6c:	008a6a13          	or	s4,s4,8
    2a70:	e78ff06f          	j	20e8 <_vfprintf_r+0x1b0>
    2a74:	000b0313          	mv	t1,s6
    2a78:	010a6e93          	or	t4,s4,16
    2a7c:	020ef793          	and	a5,t4,32
    2a80:	0c0786e3          	beqz	a5,334c <_vfprintf_r+0x1414>
    2a84:	01412783          	lw	a5,20(sp)
    2a88:	00778b13          	add	s6,a5,7
    2a8c:	ff8b7b13          	and	s6,s6,-8
    2a90:	004b2783          	lw	a5,4(s6)
    2a94:	000b2d03          	lw	s10,0(s6)
    2a98:	008b0713          	add	a4,s6,8
    2a9c:	00e12a23          	sw	a4,20(sp)
    2aa0:	00078c93          	mv	s9,a5
    2aa4:	0c07cee3          	bltz	a5,3380 <_vfprintf_r+0x1448>
    2aa8:	000e8613          	mv	a2,t4
    2aac:	02034263          	bltz	t1,2ad0 <_vfprintf_r+0xb98>
    2ab0:	019d67b3          	or	a5,s10,s9
    2ab4:	f7fef613          	and	a2,t4,-129
    2ab8:	00079c63          	bnez	a5,2ad0 <_vfprintf_r+0xb98>
    2abc:	02031063          	bnez	t1,2adc <_vfprintf_r+0xba4>
    2ac0:	00000d13          	li	s10,0
    2ac4:	00060e93          	mv	t4,a2
    2ac8:	15010c13          	add	s8,sp,336
    2acc:	eddff06f          	j	29a8 <_vfprintf_r+0xa70>
    2ad0:	520c90e3          	bnez	s9,37f0 <_vfprintf_r+0x18b8>
    2ad4:	00900793          	li	a5,9
    2ad8:	51a7ece3          	bltu	a5,s10,37f0 <_vfprintf_r+0x18b8>
    2adc:	030d0d13          	add	s10,s10,48
    2ae0:	15a107a3          	sb	s10,335(sp)
    2ae4:	00060e93          	mv	t4,a2
    2ae8:	00100d13          	li	s10,1
    2aec:	14f10c13          	add	s8,sp,335
    2af0:	eb9ff06f          	j	29a8 <_vfprintf_r+0xa70>
    2af4:	000b0313          	mv	t1,s6
    2af8:	010a6e93          	or	t4,s4,16
    2afc:	020ef793          	and	a5,t4,32
    2b00:	7e078463          	beqz	a5,32e8 <_vfprintf_r+0x13b0>
    2b04:	01412783          	lw	a5,20(sp)
    2b08:	00778b13          	add	s6,a5,7
    2b0c:	ff8b7b13          	and	s6,s6,-8
    2b10:	000b2d03          	lw	s10,0(s6)
    2b14:	004b2c83          	lw	s9,4(s6)
    2b18:	008b0793          	add	a5,s6,8
    2b1c:	00f12a23          	sw	a5,20(sp)
    2b20:	bffef613          	and	a2,t4,-1025
    2b24:	00000793          	li	a5,0
    2b28:	e55ff06f          	j	297c <_vfprintf_r+0xa44>
    2b2c:	00094e03          	lbu	t3,0(s2)
    2b30:	06800793          	li	a5,104
    2b34:	2cfe0ce3          	beq	t3,a5,360c <_vfprintf_r+0x16d4>
    2b38:	040a6a13          	or	s4,s4,64
    2b3c:	dacff06f          	j	20e8 <_vfprintf_r+0x1b0>
    2b40:	01412703          	lw	a4,20(sp)
    2b44:	000087b7          	lui	a5,0x8
    2b48:	83078793          	add	a5,a5,-2000 # 7830 <strncpy+0x44>
    2b4c:	06f11c23          	sh	a5,120(sp)
    2b50:	00470793          	add	a5,a4,4
    2b54:	00f12a23          	sw	a5,20(sp)
    2b58:	0000c797          	auipc	a5,0xc
    2b5c:	64878793          	add	a5,a5,1608 # f1a0 <__fini_array_end+0x314>
    2b60:	02f12c23          	sw	a5,56(sp)
    2b64:	00072d03          	lw	s10,0(a4)
    2b68:	000b0313          	mv	t1,s6
    2b6c:	00000c93          	li	s9,0
    2b70:	002a6613          	or	a2,s4,2
    2b74:	00200793          	li	a5,2
    2b78:	07800e13          	li	t3,120
    2b7c:	e01ff06f          	j	297c <_vfprintf_r+0xa44>
    2b80:	020a7793          	and	a5,s4,32
    2b84:	180784e3          	beqz	a5,350c <_vfprintf_r+0x15d4>
    2b88:	01412783          	lw	a5,20(sp)
    2b8c:	00c12683          	lw	a3,12(sp)
    2b90:	0007a783          	lw	a5,0(a5)
    2b94:	41f6d713          	sra	a4,a3,0x1f
    2b98:	00d7a023          	sw	a3,0(a5)
    2b9c:	00e7a223          	sw	a4,4(a5)
    2ba0:	01412783          	lw	a5,20(sp)
    2ba4:	00090c13          	mv	s8,s2
    2ba8:	00478793          	add	a5,a5,4
    2bac:	00f12a23          	sw	a5,20(sp)
    2bb0:	cccff06f          	j	207c <_vfprintf_r+0x144>
    2bb4:	06500713          	li	a4,101
    2bb8:	b3c754e3          	bge	a4,t3,26e0 <_vfprintf_r+0x7a8>
    2bbc:	02812683          	lw	a3,40(sp)
    2bc0:	02c12703          	lw	a4,44(sp)
    2bc4:	00000613          	li	a2,0
    2bc8:	00068513          	mv	a0,a3
    2bcc:	00070593          	mv	a1,a4
    2bd0:	00000693          	li	a3,0
    2bd4:	05d12223          	sw	t4,68(sp)
    2bd8:	7600a0ef          	jal	d338 <__eqdf2>
    2bdc:	04412e83          	lw	t4,68(sp)
    2be0:	4e051463          	bnez	a0,30c8 <_vfprintf_r+0x1190>
    2be4:	0a412783          	lw	a5,164(sp)
    2be8:	0000c717          	auipc	a4,0xc
    2bec:	5e870713          	add	a4,a4,1512 # f1d0 <__fini_array_end+0x344>
    2bf0:	00e42023          	sw	a4,0(s0)
    2bf4:	00148493          	add	s1,s1,1
    2bf8:	00100713          	li	a4,1
    2bfc:	00178793          	add	a5,a5,1
    2c00:	00e42223          	sw	a4,4(s0)
    2c04:	0a912423          	sw	s1,168(sp)
    2c08:	0af12223          	sw	a5,164(sp)
    2c0c:	00700713          	li	a4,7
    2c10:	00840413          	add	s0,s0,8
    2c14:	62f746e3          	blt	a4,a5,3a40 <_vfprintf_r+0x1b08>
    2c18:	07c12783          	lw	a5,124(sp)
    2c1c:	01812703          	lw	a4,24(sp)
    2c20:	78e7de63          	bge	a5,a4,33bc <_vfprintf_r+0x1484>
    2c24:	03412783          	lw	a5,52(sp)
    2c28:	03012703          	lw	a4,48(sp)
    2c2c:	00840413          	add	s0,s0,8
    2c30:	fef42c23          	sw	a5,-8(s0)
    2c34:	0a412783          	lw	a5,164(sp)
    2c38:	00e484b3          	add	s1,s1,a4
    2c3c:	fee42e23          	sw	a4,-4(s0)
    2c40:	00178793          	add	a5,a5,1
    2c44:	0a912423          	sw	s1,168(sp)
    2c48:	0af12223          	sw	a5,164(sp)
    2c4c:	00700713          	li	a4,7
    2c50:	1cf746e3          	blt	a4,a5,361c <_vfprintf_r+0x16e4>
    2c54:	01812783          	lw	a5,24(sp)
    2c58:	fff78d13          	add	s10,a5,-1
    2c5c:	dfa05263          	blez	s10,2240 <_vfprintf_r+0x308>
    2c60:	01000713          	li	a4,16
    2c64:	0a412783          	lw	a5,164(sp)
    2c68:	0000d297          	auipc	t0,0xd
    2c6c:	a2028293          	add	t0,t0,-1504 # f688 <zeroes.0>
    2c70:	77a752e3          	bge	a4,s10,3bd4 <_vfprintf_r+0x1c9c>
    2c74:	00048713          	mv	a4,s1
    2c78:	01000c13          	li	s8,16
    2c7c:	00700b13          	li	s6,7
    2c80:	000e8493          	mv	s1,t4
    2c84:	00028a13          	mv	s4,t0
    2c88:	00c0006f          	j	2c94 <_vfprintf_r+0xd5c>
    2c8c:	ff0d0d13          	add	s10,s10,-16
    2c90:	73ac5ce3          	bge	s8,s10,3bc8 <_vfprintf_r+0x1c90>
    2c94:	01070713          	add	a4,a4,16
    2c98:	00178793          	add	a5,a5,1
    2c9c:	01442023          	sw	s4,0(s0)
    2ca0:	01842223          	sw	s8,4(s0)
    2ca4:	0ae12423          	sw	a4,168(sp)
    2ca8:	0af12223          	sw	a5,164(sp)
    2cac:	00840413          	add	s0,s0,8
    2cb0:	fcfb5ee3          	bge	s6,a5,2c8c <_vfprintf_r+0xd54>
    2cb4:	00812583          	lw	a1,8(sp)
    2cb8:	0a010613          	add	a2,sp,160
    2cbc:	00098513          	mv	a0,s3
    2cc0:	134020ef          	jal	4df4 <__sprint_r>
    2cc4:	f4051263          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    2cc8:	0a812703          	lw	a4,168(sp)
    2ccc:	0a412783          	lw	a5,164(sp)
    2cd0:	0ac10413          	add	s0,sp,172
    2cd4:	fb9ff06f          	j	2c8c <_vfprintf_r+0xd54>
    2cd8:	000e8613          	mv	a2,t4
    2cdc:	00100713          	li	a4,1
    2ce0:	dee788e3          	beq	a5,a4,2ad0 <_vfprintf_r+0xb98>
    2ce4:	00200713          	li	a4,2
    2ce8:	06e78c63          	beq	a5,a4,2d60 <_vfprintf_r+0xe28>
    2cec:	15010c13          	add	s8,sp,336
    2cf0:	01dc9793          	sll	a5,s9,0x1d
    2cf4:	007d7713          	and	a4,s10,7
    2cf8:	003d5d13          	srl	s10,s10,0x3
    2cfc:	03070713          	add	a4,a4,48
    2d00:	01a7ed33          	or	s10,a5,s10
    2d04:	003cdc93          	srl	s9,s9,0x3
    2d08:	feec0fa3          	sb	a4,-1(s8)
    2d0c:	019d67b3          	or	a5,s10,s9
    2d10:	000c0593          	mv	a1,s8
    2d14:	fffc0c13          	add	s8,s8,-1
    2d18:	fc079ce3          	bnez	a5,2cf0 <_vfprintf_r+0xdb8>
    2d1c:	00167693          	and	a3,a2,1
    2d20:	06068a63          	beqz	a3,2d94 <_vfprintf_r+0xe5c>
    2d24:	03000693          	li	a3,48
    2d28:	06d70663          	beq	a4,a3,2d94 <_vfprintf_r+0xe5c>
    2d2c:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0xc6>
    2d30:	15010793          	add	a5,sp,336
    2d34:	fedc0fa3          	sb	a3,-1(s8)
    2d38:	40b78d33          	sub	s10,a5,a1
    2d3c:	00060e93          	mv	t4,a2
    2d40:	00058c13          	mv	s8,a1
    2d44:	c65ff06f          	j	29a8 <_vfprintf_r+0xa70>
    2d48:	00100713          	li	a4,1
    2d4c:	00e79463          	bne	a5,a4,2d54 <_vfprintf_r+0xe1c>
    2d50:	2b10106f          	j	4800 <_vfprintf_r+0x28c8>
    2d54:	00200713          	li	a4,2
    2d58:	000e8613          	mv	a2,t4
    2d5c:	f8e798e3          	bne	a5,a4,2cec <_vfprintf_r+0xdb4>
    2d60:	03812683          	lw	a3,56(sp)
    2d64:	15010c13          	add	s8,sp,336
    2d68:	00fd7793          	and	a5,s10,15
    2d6c:	00f687b3          	add	a5,a3,a5
    2d70:	0007c703          	lbu	a4,0(a5)
    2d74:	004d5d13          	srl	s10,s10,0x4
    2d78:	01cc9793          	sll	a5,s9,0x1c
    2d7c:	01a7ed33          	or	s10,a5,s10
    2d80:	004cdc93          	srl	s9,s9,0x4
    2d84:	feec0fa3          	sb	a4,-1(s8)
    2d88:	019d67b3          	or	a5,s10,s9
    2d8c:	fffc0c13          	add	s8,s8,-1
    2d90:	fc079ce3          	bnez	a5,2d68 <_vfprintf_r+0xe30>
    2d94:	15010793          	add	a5,sp,336
    2d98:	41878d33          	sub	s10,a5,s8
    2d9c:	00060e93          	mv	t4,a2
    2da0:	c09ff06f          	j	29a8 <_vfprintf_r+0xa70>
    2da4:	419b8b33          	sub	s6,s7,s9
    2da8:	c7605063          	blez	s6,2208 <_vfprintf_r+0x2d0>
    2dac:	01000593          	li	a1,16
    2db0:	0a412603          	lw	a2,164(sp)
    2db4:	0000d297          	auipc	t0,0xd
    2db8:	8d428293          	add	t0,t0,-1836 # f688 <zeroes.0>
    2dbc:	0b65d463          	bge	a1,s6,2e64 <_vfprintf_r+0xf2c>
    2dc0:	00040793          	mv	a5,s0
    2dc4:	00048713          	mv	a4,s1
    2dc8:	000b0413          	mv	s0,s6
    2dcc:	01000893          	li	a7,16
    2dd0:	000a0b13          	mv	s6,s4
    2dd4:	00700f93          	li	t6,7
    2dd8:	05d12223          	sw	t4,68(sp)
    2ddc:	05c12823          	sw	t3,80(sp)
    2de0:	00030a13          	mv	s4,t1
    2de4:	00028493          	mv	s1,t0
    2de8:	00c0006f          	j	2df4 <_vfprintf_r+0xebc>
    2dec:	ff040413          	add	s0,s0,-16
    2df0:	0488da63          	bge	a7,s0,2e44 <_vfprintf_r+0xf0c>
    2df4:	01070713          	add	a4,a4,16
    2df8:	00160613          	add	a2,a2,1
    2dfc:	0097a023          	sw	s1,0(a5)
    2e00:	0117a223          	sw	a7,4(a5)
    2e04:	0ae12423          	sw	a4,168(sp)
    2e08:	0ac12223          	sw	a2,164(sp)
    2e0c:	00878793          	add	a5,a5,8
    2e10:	fccfdee3          	bge	t6,a2,2dec <_vfprintf_r+0xeb4>
    2e14:	00812583          	lw	a1,8(sp)
    2e18:	0a010613          	add	a2,sp,160
    2e1c:	00098513          	mv	a0,s3
    2e20:	7d5010ef          	jal	4df4 <__sprint_r>
    2e24:	de051263          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    2e28:	01000893          	li	a7,16
    2e2c:	ff040413          	add	s0,s0,-16
    2e30:	0a812703          	lw	a4,168(sp)
    2e34:	0a412603          	lw	a2,164(sp)
    2e38:	0ac10793          	add	a5,sp,172
    2e3c:	00700f93          	li	t6,7
    2e40:	fa88cae3          	blt	a7,s0,2df4 <_vfprintf_r+0xebc>
    2e44:	04412e83          	lw	t4,68(sp)
    2e48:	05012e03          	lw	t3,80(sp)
    2e4c:	000a0313          	mv	t1,s4
    2e50:	00048293          	mv	t0,s1
    2e54:	000b0a13          	mv	s4,s6
    2e58:	00070493          	mv	s1,a4
    2e5c:	00040b13          	mv	s6,s0
    2e60:	00078413          	mv	s0,a5
    2e64:	016484b3          	add	s1,s1,s6
    2e68:	00160613          	add	a2,a2,1
    2e6c:	00542023          	sw	t0,0(s0)
    2e70:	01642223          	sw	s6,4(s0)
    2e74:	0a912423          	sw	s1,168(sp)
    2e78:	0ac12223          	sw	a2,164(sp)
    2e7c:	00700713          	li	a4,7
    2e80:	00840413          	add	s0,s0,8
    2e84:	b8c75263          	bge	a4,a2,2208 <_vfprintf_r+0x2d0>
    2e88:	00812583          	lw	a1,8(sp)
    2e8c:	0a010613          	add	a2,sp,160
    2e90:	00098513          	mv	a0,s3
    2e94:	04612a23          	sw	t1,84(sp)
    2e98:	05c12823          	sw	t3,80(sp)
    2e9c:	05d12223          	sw	t4,68(sp)
    2ea0:	755010ef          	jal	4df4 <__sprint_r>
    2ea4:	d6051263          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    2ea8:	0a812483          	lw	s1,168(sp)
    2eac:	05412303          	lw	t1,84(sp)
    2eb0:	05012e03          	lw	t3,80(sp)
    2eb4:	04412e83          	lw	t4,68(sp)
    2eb8:	0ac10413          	add	s0,sp,172
    2ebc:	b4cff06f          	j	2208 <_vfprintf_r+0x2d0>
    2ec0:	01000713          	li	a4,16
    2ec4:	0a412603          	lw	a2,164(sp)
    2ec8:	0000c297          	auipc	t0,0xc
    2ecc:	7c028293          	add	t0,t0,1984 # f688 <zeroes.0>
    2ed0:	0b675063          	bge	a4,s6,2f70 <_vfprintf_r+0x1038>
    2ed4:	00040793          	mv	a5,s0
    2ed8:	00048693          	mv	a3,s1
    2edc:	000b0413          	mv	s0,s6
    2ee0:	01000713          	li	a4,16
    2ee4:	00700893          	li	a7,7
    2ee8:	05d12223          	sw	t4,68(sp)
    2eec:	000e0493          	mv	s1,t3
    2ef0:	00028b13          	mv	s6,t0
    2ef4:	00c0006f          	j	2f00 <_vfprintf_r+0xfc8>
    2ef8:	ff040413          	add	s0,s0,-16
    2efc:	04875e63          	bge	a4,s0,2f58 <_vfprintf_r+0x1020>
    2f00:	01068693          	add	a3,a3,16
    2f04:	00160613          	add	a2,a2,1
    2f08:	0000c597          	auipc	a1,0xc
    2f0c:	78058593          	add	a1,a1,1920 # f688 <zeroes.0>
    2f10:	00b7a023          	sw	a1,0(a5)
    2f14:	00e7a223          	sw	a4,4(a5)
    2f18:	0ad12423          	sw	a3,168(sp)
    2f1c:	0ac12223          	sw	a2,164(sp)
    2f20:	00878793          	add	a5,a5,8
    2f24:	fcc8dae3          	bge	a7,a2,2ef8 <_vfprintf_r+0xfc0>
    2f28:	00812583          	lw	a1,8(sp)
    2f2c:	0a010613          	add	a2,sp,160
    2f30:	00098513          	mv	a0,s3
    2f34:	6c1010ef          	jal	4df4 <__sprint_r>
    2f38:	cc051863          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    2f3c:	01000713          	li	a4,16
    2f40:	ff040413          	add	s0,s0,-16
    2f44:	0a812683          	lw	a3,168(sp)
    2f48:	0a412603          	lw	a2,164(sp)
    2f4c:	0ac10793          	add	a5,sp,172
    2f50:	00700893          	li	a7,7
    2f54:	fa8746e3          	blt	a4,s0,2f00 <_vfprintf_r+0xfc8>
    2f58:	04412e83          	lw	t4,68(sp)
    2f5c:	00048e13          	mv	t3,s1
    2f60:	000b0293          	mv	t0,s6
    2f64:	00068493          	mv	s1,a3
    2f68:	00040b13          	mv	s6,s0
    2f6c:	00078413          	mv	s0,a5
    2f70:	016484b3          	add	s1,s1,s6
    2f74:	00160613          	add	a2,a2,1
    2f78:	00542023          	sw	t0,0(s0)
    2f7c:	01642223          	sw	s6,4(s0)
    2f80:	0a912423          	sw	s1,168(sp)
    2f84:	0ac12223          	sw	a2,164(sp)
    2f88:	00700713          	li	a4,7
    2f8c:	00840413          	add	s0,s0,8
    2f90:	a8c75063          	bge	a4,a2,2210 <_vfprintf_r+0x2d8>
    2f94:	00812583          	lw	a1,8(sp)
    2f98:	0a010613          	add	a2,sp,160
    2f9c:	00098513          	mv	a0,s3
    2fa0:	05c12823          	sw	t3,80(sp)
    2fa4:	05d12223          	sw	t4,68(sp)
    2fa8:	64d010ef          	jal	4df4 <__sprint_r>
    2fac:	c4051e63          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    2fb0:	0a812483          	lw	s1,168(sp)
    2fb4:	05012e03          	lw	t3,80(sp)
    2fb8:	04412e83          	lw	t4,68(sp)
    2fbc:	0ac10413          	add	s0,sp,172
    2fc0:	a50ff06f          	j	2210 <_vfprintf_r+0x2d8>
    2fc4:	00812583          	lw	a1,8(sp)
    2fc8:	0a010613          	add	a2,sp,160
    2fcc:	00098513          	mv	a0,s3
    2fd0:	04612c23          	sw	t1,88(sp)
    2fd4:	05c12a23          	sw	t3,84(sp)
    2fd8:	05d12823          	sw	t4,80(sp)
    2fdc:	05f12223          	sw	t6,68(sp)
    2fe0:	615010ef          	jal	4df4 <__sprint_r>
    2fe4:	c2051263          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    2fe8:	0a812483          	lw	s1,168(sp)
    2fec:	05812303          	lw	t1,88(sp)
    2ff0:	05412e03          	lw	t3,84(sp)
    2ff4:	05012e83          	lw	t4,80(sp)
    2ff8:	04412f83          	lw	t6,68(sp)
    2ffc:	0ac10413          	add	s0,sp,172
    3000:	a00ff06f          	j	2200 <_vfprintf_r+0x2c8>
    3004:	01000713          	li	a4,16
    3008:	0a412783          	lw	a5,164(sp)
    300c:	0000cb17          	auipc	s6,0xc
    3010:	68cb0b13          	add	s6,s6,1676 # f698 <blanks.1>
    3014:	07a75c63          	bge	a4,s10,308c <_vfprintf_r+0x1154>
    3018:	000b0713          	mv	a4,s6
    301c:	01000c13          	li	s8,16
    3020:	00090b13          	mv	s6,s2
    3024:	00700a13          	li	s4,7
    3028:	00070913          	mv	s2,a4
    302c:	00c0006f          	j	3038 <_vfprintf_r+0x1100>
    3030:	ff0d0d13          	add	s10,s10,-16
    3034:	05ac5663          	bge	s8,s10,3080 <_vfprintf_r+0x1148>
    3038:	01048493          	add	s1,s1,16
    303c:	00178793          	add	a5,a5,1
    3040:	01242023          	sw	s2,0(s0)
    3044:	01842223          	sw	s8,4(s0)
    3048:	0a912423          	sw	s1,168(sp)
    304c:	0af12223          	sw	a5,164(sp)
    3050:	00840413          	add	s0,s0,8
    3054:	fcfa5ee3          	bge	s4,a5,3030 <_vfprintf_r+0x10f8>
    3058:	00812583          	lw	a1,8(sp)
    305c:	0a010613          	add	a2,sp,160
    3060:	00098513          	mv	a0,s3
    3064:	591010ef          	jal	4df4 <__sprint_r>
    3068:	ba051063          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    306c:	ff0d0d13          	add	s10,s10,-16
    3070:	0a812483          	lw	s1,168(sp)
    3074:	0a412783          	lw	a5,164(sp)
    3078:	0ac10413          	add	s0,sp,172
    307c:	fbac4ee3          	blt	s8,s10,3038 <_vfprintf_r+0x1100>
    3080:	00090713          	mv	a4,s2
    3084:	000b0913          	mv	s2,s6
    3088:	00070b13          	mv	s6,a4
    308c:	01a484b3          	add	s1,s1,s10
    3090:	00178793          	add	a5,a5,1
    3094:	01642023          	sw	s6,0(s0)
    3098:	01a42223          	sw	s10,4(s0)
    309c:	0a912423          	sw	s1,168(sp)
    30a0:	0af12223          	sw	a5,164(sp)
    30a4:	00700713          	li	a4,7
    30a8:	9af75463          	bge	a4,a5,2250 <_vfprintf_r+0x318>
    30ac:	00812583          	lw	a1,8(sp)
    30b0:	0a010613          	add	a2,sp,160
    30b4:	00098513          	mv	a0,s3
    30b8:	53d010ef          	jal	4df4 <__sprint_r>
    30bc:	b4051663          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    30c0:	0a812483          	lw	s1,168(sp)
    30c4:	98cff06f          	j	2250 <_vfprintf_r+0x318>
    30c8:	07c12683          	lw	a3,124(sp)
    30cc:	30d05c63          	blez	a3,33e4 <_vfprintf_r+0x14ac>
    30d0:	01812783          	lw	a5,24(sp)
    30d4:	000a0b13          	mv	s6,s4
    30d8:	0147d463          	bge	a5,s4,30e0 <_vfprintf_r+0x11a8>
    30dc:	00078b13          	mv	s6,a5
    30e0:	03605863          	blez	s6,3110 <_vfprintf_r+0x11d8>
    30e4:	0a412683          	lw	a3,164(sp)
    30e8:	016484b3          	add	s1,s1,s6
    30ec:	01842023          	sw	s8,0(s0)
    30f0:	00168693          	add	a3,a3,1
    30f4:	01642223          	sw	s6,4(s0)
    30f8:	0a912423          	sw	s1,168(sp)
    30fc:	0ad12223          	sw	a3,164(sp)
    3100:	00700613          	li	a2,7
    3104:	00840413          	add	s0,s0,8
    3108:	00d65463          	bge	a2,a3,3110 <_vfprintf_r+0x11d8>
    310c:	5c40106f          	j	46d0 <_vfprintf_r+0x2798>
    3110:	fffb4693          	not	a3,s6
    3114:	41f6d693          	sra	a3,a3,0x1f
    3118:	00db7733          	and	a4,s6,a3
    311c:	40ea0b33          	sub	s6,s4,a4
    3120:	35604ae3          	bgtz	s6,3c74 <_vfprintf_r+0x1d3c>
    3124:	400ef713          	and	a4,t4,1024
    3128:	014c0333          	add	t1,s8,s4
    312c:	00070463          	beqz	a4,3134 <_vfprintf_r+0x11fc>
    3130:	2980106f          	j	43c8 <_vfprintf_r+0x2490>
    3134:	07c12d03          	lw	s10,124(sp)
    3138:	01812783          	lw	a5,24(sp)
    313c:	5afd4063          	blt	s10,a5,36dc <_vfprintf_r+0x17a4>
    3140:	001ef713          	and	a4,t4,1
    3144:	58071c63          	bnez	a4,36dc <_vfprintf_r+0x17a4>
    3148:	01812703          	lw	a4,24(sp)
    314c:	00ec07b3          	add	a5,s8,a4
    3150:	41a70d33          	sub	s10,a4,s10
    3154:	40678b33          	sub	s6,a5,t1
    3158:	016d5463          	bge	s10,s6,3160 <_vfprintf_r+0x1228>
    315c:	000d0b13          	mv	s6,s10
    3160:	03605863          	blez	s6,3190 <_vfprintf_r+0x1258>
    3164:	0a412703          	lw	a4,164(sp)
    3168:	016484b3          	add	s1,s1,s6
    316c:	00642023          	sw	t1,0(s0)
    3170:	00170713          	add	a4,a4,1
    3174:	01642223          	sw	s6,4(s0)
    3178:	0a912423          	sw	s1,168(sp)
    317c:	0ae12223          	sw	a4,164(sp)
    3180:	00700693          	li	a3,7
    3184:	00840413          	add	s0,s0,8
    3188:	00e6d463          	bge	a3,a4,3190 <_vfprintf_r+0x1258>
    318c:	5880106f          	j	4714 <_vfprintf_r+0x27dc>
    3190:	fffb4713          	not	a4,s6
    3194:	41f75713          	sra	a4,a4,0x1f
    3198:	00eb77b3          	and	a5,s6,a4
    319c:	40fd0d33          	sub	s10,s10,a5
    31a0:	8ba05063          	blez	s10,2240 <_vfprintf_r+0x308>
    31a4:	01000713          	li	a4,16
    31a8:	0a412783          	lw	a5,164(sp)
    31ac:	0000c297          	auipc	t0,0xc
    31b0:	4dc28293          	add	t0,t0,1244 # f688 <zeroes.0>
    31b4:	23a750e3          	bge	a4,s10,3bd4 <_vfprintf_r+0x1c9c>
    31b8:	00048713          	mv	a4,s1
    31bc:	01000c13          	li	s8,16
    31c0:	00700b13          	li	s6,7
    31c4:	000e8493          	mv	s1,t4
    31c8:	00028a13          	mv	s4,t0
    31cc:	00c0006f          	j	31d8 <_vfprintf_r+0x12a0>
    31d0:	ff0d0d13          	add	s10,s10,-16
    31d4:	1fac5ae3          	bge	s8,s10,3bc8 <_vfprintf_r+0x1c90>
    31d8:	01070713          	add	a4,a4,16
    31dc:	00178793          	add	a5,a5,1
    31e0:	01442023          	sw	s4,0(s0)
    31e4:	01842223          	sw	s8,4(s0)
    31e8:	0ae12423          	sw	a4,168(sp)
    31ec:	0af12223          	sw	a5,164(sp)
    31f0:	00840413          	add	s0,s0,8
    31f4:	fcfb5ee3          	bge	s6,a5,31d0 <_vfprintf_r+0x1298>
    31f8:	00812583          	lw	a1,8(sp)
    31fc:	0a010613          	add	a2,sp,160
    3200:	00098513          	mv	a0,s3
    3204:	3f1010ef          	jal	4df4 <__sprint_r>
    3208:	a0051063          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    320c:	0a812703          	lw	a4,168(sp)
    3210:	0a412783          	lw	a5,164(sp)
    3214:	0ac10413          	add	s0,sp,172
    3218:	fb9ff06f          	j	31d0 <_vfprintf_r+0x1298>
    321c:	001ef613          	and	a2,t4,1
    3220:	ce061063          	bnez	a2,2700 <_vfprintf_r+0x7c8>
    3224:	00d42223          	sw	a3,4(s0)
    3228:	0a912423          	sw	s1,168(sp)
    322c:	0ba12223          	sw	s10,164(sp)
    3230:	00700793          	li	a5,7
    3234:	d7a7d863          	bge	a5,s10,27a4 <_vfprintf_r+0x86c>
    3238:	00812583          	lw	a1,8(sp)
    323c:	0a010613          	add	a2,sp,160
    3240:	00098513          	mv	a0,s3
    3244:	03d12023          	sw	t4,32(sp)
    3248:	3ad010ef          	jal	4df4 <__sprint_r>
    324c:	9a051e63          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    3250:	0a812483          	lw	s1,168(sp)
    3254:	0a412d03          	lw	s10,164(sp)
    3258:	02012e83          	lw	t4,32(sp)
    325c:	0ac10b13          	add	s6,sp,172
    3260:	d44ff06f          	j	27a4 <_vfprintf_r+0x86c>
    3264:	01812703          	lw	a4,24(sp)
    3268:	00100793          	li	a5,1
    326c:	d2e7dc63          	bge	a5,a4,27a4 <_vfprintf_r+0x86c>
    3270:	01100793          	li	a5,17
    3274:	0000c297          	auipc	t0,0xc
    3278:	41428293          	add	t0,t0,1044 # f688 <zeroes.0>
    327c:	18e7d4e3          	bge	a5,a4,3c04 <_vfprintf_r+0x1ccc>
    3280:	00040a13          	mv	s4,s0
    3284:	01000793          	li	a5,16
    3288:	00700c13          	li	s8,7
    328c:	03d12023          	sw	t4,32(sp)
    3290:	00028413          	mv	s0,t0
    3294:	00c0006f          	j	32a0 <_vfprintf_r+0x1368>
    3298:	ff0a0a13          	add	s4,s4,-16
    329c:	1547dee3          	bge	a5,s4,3bf8 <_vfprintf_r+0x1cc0>
    32a0:	01048493          	add	s1,s1,16
    32a4:	001d0d13          	add	s10,s10,1
    32a8:	008b2023          	sw	s0,0(s6)
    32ac:	00fb2223          	sw	a5,4(s6)
    32b0:	0a912423          	sw	s1,168(sp)
    32b4:	0ba12223          	sw	s10,164(sp)
    32b8:	008b0b13          	add	s6,s6,8
    32bc:	fdac5ee3          	bge	s8,s10,3298 <_vfprintf_r+0x1360>
    32c0:	00812583          	lw	a1,8(sp)
    32c4:	0a010613          	add	a2,sp,160
    32c8:	00098513          	mv	a0,s3
    32cc:	329010ef          	jal	4df4 <__sprint_r>
    32d0:	92051c63          	bnez	a0,2408 <_vfprintf_r+0x4d0>
    32d4:	0a812483          	lw	s1,168(sp)
    32d8:	0a412d03          	lw	s10,164(sp)
    32dc:	0ac10b13          	add	s6,sp,172
    32e0:	01000793          	li	a5,16
    32e4:	fb5ff06f          	j	3298 <_vfprintf_r+0x1360>
    32e8:	01412703          	lw	a4,20(sp)
    32ec:	010ef793          	and	a5,t4,16
    32f0:	00072d03          	lw	s10,0(a4)
    32f4:	00470713          	add	a4,a4,4
    32f8:	00e12a23          	sw	a4,20(sp)
    32fc:	1a079663          	bnez	a5,34a8 <_vfprintf_r+0x1570>
    3300:	040ef793          	and	a5,t4,64
    3304:	18078e63          	beqz	a5,34a0 <_vfprintf_r+0x1568>
    3308:	010d1d13          	sll	s10,s10,0x10
    330c:	010d5d13          	srl	s10,s10,0x10
    3310:	00000c93          	li	s9,0
    3314:	80dff06f          	j	2b20 <_vfprintf_r+0xbe8>
    3318:	01412703          	lw	a4,20(sp)
    331c:	01067793          	and	a5,a2,16
    3320:	00072d03          	lw	s10,0(a4)
    3324:	00470713          	add	a4,a4,4
    3328:	00e12a23          	sw	a4,20(sp)
    332c:	14079a63          	bnez	a5,3480 <_vfprintf_r+0x1548>
    3330:	04067793          	and	a5,a2,64
    3334:	14078063          	beqz	a5,3474 <_vfprintf_r+0x153c>
    3338:	010d1d13          	sll	s10,s10,0x10
    333c:	010d5d13          	srl	s10,s10,0x10
    3340:	00000c93          	li	s9,0
    3344:	00100793          	li	a5,1
    3348:	e34ff06f          	j	297c <_vfprintf_r+0xa44>
    334c:	01412703          	lw	a4,20(sp)
    3350:	010ef793          	and	a5,t4,16
    3354:	00072d03          	lw	s10,0(a4)
    3358:	00470713          	add	a4,a4,4
    335c:	00e12a23          	sw	a4,20(sp)
    3360:	12079a63          	bnez	a5,3494 <_vfprintf_r+0x155c>
    3364:	040ef793          	and	a5,t4,64
    3368:	12078263          	beqz	a5,348c <_vfprintf_r+0x1554>
    336c:	010d1d13          	sll	s10,s10,0x10
    3370:	410d5d13          	sra	s10,s10,0x10
    3374:	41fd5c93          	sra	s9,s10,0x1f
    3378:	000c8793          	mv	a5,s9
    337c:	f207d663          	bgez	a5,2aa8 <_vfprintf_r+0xb70>
    3380:	01a037b3          	snez	a5,s10
    3384:	419000b3          	neg	ra,s9
    3388:	40f08cb3          	sub	s9,ra,a5
    338c:	41a00d33          	neg	s10,s10
    3390:	000e8613          	mv	a2,t4
    3394:	02d00713          	li	a4,45
    3398:	00100793          	li	a5,1
    339c:	de4ff06f          	j	2980 <_vfprintf_r+0xa48>
    33a0:	00812403          	lw	s0,8(sp)
    33a4:	00f12623          	sw	a5,12(sp)
    33a8:	05842503          	lw	a0,88(s0)
    33ac:	c31fd0ef          	jal	fdc <__retarget_lock_acquire_recursive>
    33b0:	00c41703          	lh	a4,12(s0)
    33b4:	00c12783          	lw	a5,12(sp)
    33b8:	c01fe06f          	j	1fb8 <_vfprintf_r+0x80>
    33bc:	001ef793          	and	a5,t4,1
    33c0:	00079463          	bnez	a5,33c8 <_vfprintf_r+0x1490>
    33c4:	e7dfe06f          	j	2240 <_vfprintf_r+0x308>
    33c8:	85dff06f          	j	2c24 <_vfprintf_r+0xcec>
    33cc:	000a0e93          	mv	t4,s4
    33d0:	000b0313          	mv	t1,s6
    33d4:	ea8ff06f          	j	2a7c <_vfprintf_r+0xb44>
    33d8:	00094e03          	lbu	t3,0(s2)
    33dc:	00f12a23          	sw	a5,20(sp)
    33e0:	d09fe06f          	j	20e8 <_vfprintf_r+0x1b0>
    33e4:	0a412703          	lw	a4,164(sp)
    33e8:	0000c617          	auipc	a2,0xc
    33ec:	de860613          	add	a2,a2,-536 # f1d0 <__fini_array_end+0x344>
    33f0:	00c42023          	sw	a2,0(s0)
    33f4:	00148493          	add	s1,s1,1
    33f8:	00100613          	li	a2,1
    33fc:	00170713          	add	a4,a4,1
    3400:	00c42223          	sw	a2,4(s0)
    3404:	0a912423          	sw	s1,168(sp)
    3408:	0ae12223          	sw	a4,164(sp)
    340c:	00700613          	li	a2,7
    3410:	00840413          	add	s0,s0,8
    3414:	2ee64ce3          	blt	a2,a4,3f0c <_vfprintf_r+0x1fd4>
    3418:	7e069e63          	bnez	a3,3c14 <_vfprintf_r+0x1cdc>
    341c:	01812783          	lw	a5,24(sp)
    3420:	001ef713          	and	a4,t4,1
    3424:	00f76733          	or	a4,a4,a5
    3428:	00071463          	bnez	a4,3430 <_vfprintf_r+0x14f8>
    342c:	e15fe06f          	j	2240 <_vfprintf_r+0x308>
    3430:	03412703          	lw	a4,52(sp)
    3434:	03012783          	lw	a5,48(sp)
    3438:	00700693          	li	a3,7
    343c:	00e42023          	sw	a4,0(s0)
    3440:	0a412703          	lw	a4,164(sp)
    3444:	009784b3          	add	s1,a5,s1
    3448:	00f42223          	sw	a5,4(s0)
    344c:	00170713          	add	a4,a4,1
    3450:	0a912423          	sw	s1,168(sp)
    3454:	0ae12223          	sw	a4,164(sp)
    3458:	38e6c8e3          	blt	a3,a4,3fe8 <_vfprintf_r+0x20b0>
    345c:	00840413          	add	s0,s0,8
    3460:	7e80006f          	j	3c48 <_vfprintf_r+0x1d10>
    3464:	03000793          	li	a5,48
    3468:	14f107a3          	sb	a5,335(sp)
    346c:	14f10c13          	add	s8,sp,335
    3470:	d38ff06f          	j	29a8 <_vfprintf_r+0xa70>
    3474:	20067793          	and	a5,a2,512
    3478:	00078463          	beqz	a5,3480 <_vfprintf_r+0x1548>
    347c:	0ffd7d13          	zext.b	s10,s10
    3480:	00000c93          	li	s9,0
    3484:	00100793          	li	a5,1
    3488:	cf4ff06f          	j	297c <_vfprintf_r+0xa44>
    348c:	200ef793          	and	a5,t4,512
    3490:	2c0796e3          	bnez	a5,3f5c <_vfprintf_r+0x2024>
    3494:	41fd5c93          	sra	s9,s10,0x1f
    3498:	000c8793          	mv	a5,s9
    349c:	e08ff06f          	j	2aa4 <_vfprintf_r+0xb6c>
    34a0:	200ef793          	and	a5,t4,512
    34a4:	2a0790e3          	bnez	a5,3f44 <_vfprintf_r+0x200c>
    34a8:	00000c93          	li	s9,0
    34ac:	e74ff06f          	j	2b20 <_vfprintf_r+0xbe8>
    34b0:	01412783          	lw	a5,20(sp)
    34b4:	06010513          	add	a0,sp,96
    34b8:	03612223          	sw	s6,36(sp)
    34bc:	0007a703          	lw	a4,0(a5)
    34c0:	03c12023          	sw	t3,32(sp)
    34c4:	00478b13          	add	s6,a5,4
    34c8:	00072683          	lw	a3,0(a4)
    34cc:	01412823          	sw	s4,16(sp)
    34d0:	06d12023          	sw	a3,96(sp)
    34d4:	00472683          	lw	a3,4(a4)
    34d8:	06d12223          	sw	a3,100(sp)
    34dc:	00872683          	lw	a3,8(a4)
    34e0:	06d12423          	sw	a3,104(sp)
    34e4:	00c72703          	lw	a4,12(a4)
    34e8:	06e12623          	sw	a4,108(sp)
    34ec:	3cc0b0ef          	jal	e8b8 <__trunctfdf2>
    34f0:	02012e03          	lw	t3,32(sp)
    34f4:	02412303          	lw	t1,36(sp)
    34f8:	02a12423          	sw	a0,40(sp)
    34fc:	02b12623          	sw	a1,44(sp)
    3500:	01612a23          	sw	s6,20(sp)
    3504:	000a0e93          	mv	t4,s4
    3508:	fb1fe06f          	j	24b8 <_vfprintf_r+0x580>
    350c:	010a7793          	and	a5,s4,16
    3510:	6c079a63          	bnez	a5,3be4 <_vfprintf_r+0x1cac>
    3514:	040a7793          	and	a5,s4,64
    3518:	24079ce3          	bnez	a5,3f70 <_vfprintf_r+0x2038>
    351c:	200a7f13          	and	t5,s4,512
    3520:	6c0f0263          	beqz	t5,3be4 <_vfprintf_r+0x1cac>
    3524:	01412783          	lw	a5,20(sp)
    3528:	00c12703          	lw	a4,12(sp)
    352c:	0007a783          	lw	a5,0(a5)
    3530:	00e78023          	sb	a4,0(a5)
    3534:	e6cff06f          	j	2ba0 <_vfprintf_r+0xc68>
    3538:	03c12783          	lw	a5,60(sp)
    353c:	00094e03          	lbu	t3,0(s2)
    3540:	00079463          	bnez	a5,3548 <_vfprintf_r+0x1610>
    3544:	ba5fe06f          	j	20e8 <_vfprintf_r+0x1b0>
    3548:	0007c783          	lbu	a5,0(a5)
    354c:	00079463          	bnez	a5,3554 <_vfprintf_r+0x161c>
    3550:	b99fe06f          	j	20e8 <_vfprintf_r+0x1b0>
    3554:	400a6a13          	or	s4,s4,1024
    3558:	b91fe06f          	j	20e8 <_vfprintf_r+0x1b0>
    355c:	fff00b13          	li	s6,-1
    3560:	00068913          	mv	s2,a3
    3564:	b89fe06f          	j	20ec <_vfprintf_r+0x1b4>
    3568:	0000c797          	auipc	a5,0xc
    356c:	c4c78793          	add	a5,a5,-948 # f1b4 <__fini_array_end+0x328>
    3570:	000a0e93          	mv	t4,s4
    3574:	000b0313          	mv	t1,s6
    3578:	02f12c23          	sw	a5,56(sp)
    357c:	020ef793          	and	a5,t4,32
    3580:	1c078263          	beqz	a5,3744 <_vfprintf_r+0x180c>
    3584:	01412783          	lw	a5,20(sp)
    3588:	00778b13          	add	s6,a5,7
    358c:	ff8b7b13          	and	s6,s6,-8
    3590:	000b2d03          	lw	s10,0(s6)
    3594:	004b2c83          	lw	s9,4(s6)
    3598:	008b0793          	add	a5,s6,8
    359c:	00f12a23          	sw	a5,20(sp)
    35a0:	001ef793          	and	a5,t4,1
    35a4:	00078e63          	beqz	a5,35c0 <_vfprintf_r+0x1688>
    35a8:	019d67b3          	or	a5,s10,s9
    35ac:	00078a63          	beqz	a5,35c0 <_vfprintf_r+0x1688>
    35b0:	03000793          	li	a5,48
    35b4:	06f10c23          	sb	a5,120(sp)
    35b8:	07c10ca3          	sb	t3,121(sp)
    35bc:	002eee93          	or	t4,t4,2
    35c0:	bffef613          	and	a2,t4,-1025
    35c4:	00200793          	li	a5,2
    35c8:	bb4ff06f          	j	297c <_vfprintf_r+0xa44>
    35cc:	000b0313          	mv	t1,s6
    35d0:	000a0613          	mv	a2,s4
    35d4:	b80ff06f          	j	2954 <_vfprintf_r+0xa1c>
    35d8:	000a0e93          	mv	t4,s4
    35dc:	000b0313          	mv	t1,s6
    35e0:	d1cff06f          	j	2afc <_vfprintf_r+0xbc4>
    35e4:	0000c797          	auipc	a5,0xc
    35e8:	bbc78793          	add	a5,a5,-1092 # f1a0 <__fini_array_end+0x314>
    35ec:	000a0e93          	mv	t4,s4
    35f0:	000b0313          	mv	t1,s6
    35f4:	02f12c23          	sw	a5,56(sp)
    35f8:	f85ff06f          	j	357c <_vfprintf_r+0x1644>
    35fc:	00194e03          	lbu	t3,1(s2)
    3600:	020a6a13          	or	s4,s4,32
    3604:	00190913          	add	s2,s2,1
    3608:	ae1fe06f          	j	20e8 <_vfprintf_r+0x1b0>
    360c:	00194e03          	lbu	t3,1(s2)
    3610:	200a6a13          	or	s4,s4,512
    3614:	00190913          	add	s2,s2,1
    3618:	ad1fe06f          	j	20e8 <_vfprintf_r+0x1b0>
    361c:	00812583          	lw	a1,8(sp)
    3620:	0a010613          	add	a2,sp,160
    3624:	00098513          	mv	a0,s3
    3628:	03d12023          	sw	t4,32(sp)
    362c:	7c8010ef          	jal	4df4 <__sprint_r>
    3630:	00050463          	beqz	a0,3638 <_vfprintf_r+0x1700>
    3634:	dd5fe06f          	j	2408 <_vfprintf_r+0x4d0>
    3638:	0a812483          	lw	s1,168(sp)
    363c:	02012e83          	lw	t4,32(sp)
    3640:	0ac10413          	add	s0,sp,172
    3644:	e10ff06f          	j	2c54 <_vfprintf_r+0xd1c>
    3648:	00600793          	li	a5,6
    364c:	00030c93          	mv	s9,t1
    3650:	0e67e6e3          	bltu	a5,t1,3f3c <_vfprintf_r+0x2004>
    3654:	01612a23          	sw	s6,20(sp)
    3658:	00012823          	sw	zero,16(sp)
    365c:	000c8d13          	mv	s10,s9
    3660:	00000613          	li	a2,0
    3664:	00000313          	li	t1,0
    3668:	02012223          	sw	zero,36(sp)
    366c:	02012023          	sw	zero,32(sp)
    3670:	00000a13          	li	s4,0
    3674:	0000cc17          	auipc	s8,0xc
    3678:	b54c0c13          	add	s8,s8,-1196 # f1c8 <__fini_array_end+0x33c>
    367c:	afdfe06f          	j	2178 <_vfprintf_r+0x240>
    3680:	00800613          	li	a2,8
    3684:	00000593          	li	a1,0
    3688:	09810513          	add	a0,sp,152
    368c:	03c12023          	sw	t3,32(sp)
    3690:	01d12823          	sw	t4,16(sp)
    3694:	951fd0ef          	jal	fe4 <memset>
    3698:	01412783          	lw	a5,20(sp)
    369c:	0ec10c13          	add	s8,sp,236
    36a0:	09810693          	add	a3,sp,152
    36a4:	0007a603          	lw	a2,0(a5)
    36a8:	000c0593          	mv	a1,s8
    36ac:	00098513          	mv	a0,s3
    36b0:	2a4070ef          	jal	a954 <_wcrtomb_r>
    36b4:	fff00793          	li	a5,-1
    36b8:	01012e83          	lw	t4,16(sp)
    36bc:	02012e03          	lw	t3,32(sp)
    36c0:	00050d13          	mv	s10,a0
    36c4:	00f51463          	bne	a0,a5,36cc <_vfprintf_r+0x1794>
    36c8:	4980106f          	j	4b60 <_vfprintf_r+0x2c28>
    36cc:	fff54813          	not	a6,a0
    36d0:	41f85813          	sra	a6,a6,0x1f
    36d4:	01057cb3          	and	s9,a0,a6
    36d8:	97cff06f          	j	2854 <_vfprintf_r+0x91c>
    36dc:	03412703          	lw	a4,52(sp)
    36e0:	03012783          	lw	a5,48(sp)
    36e4:	00700693          	li	a3,7
    36e8:	00e42023          	sw	a4,0(s0)
    36ec:	0a412703          	lw	a4,164(sp)
    36f0:	00f484b3          	add	s1,s1,a5
    36f4:	00f42223          	sw	a5,4(s0)
    36f8:	00170713          	add	a4,a4,1
    36fc:	0a912423          	sw	s1,168(sp)
    3700:	0ae12223          	sw	a4,164(sp)
    3704:	00840413          	add	s0,s0,8
    3708:	a4e6d0e3          	bge	a3,a4,3148 <_vfprintf_r+0x1210>
    370c:	00812583          	lw	a1,8(sp)
    3710:	0a010613          	add	a2,sp,160
    3714:	00098513          	mv	a0,s3
    3718:	02612223          	sw	t1,36(sp)
    371c:	03d12023          	sw	t4,32(sp)
    3720:	6d4010ef          	jal	4df4 <__sprint_r>
    3724:	00050463          	beqz	a0,372c <_vfprintf_r+0x17f4>
    3728:	ce1fe06f          	j	2408 <_vfprintf_r+0x4d0>
    372c:	07c12d03          	lw	s10,124(sp)
    3730:	0a812483          	lw	s1,168(sp)
    3734:	02412303          	lw	t1,36(sp)
    3738:	02012e83          	lw	t4,32(sp)
    373c:	0ac10413          	add	s0,sp,172
    3740:	a09ff06f          	j	3148 <_vfprintf_r+0x1210>
    3744:	01412703          	lw	a4,20(sp)
    3748:	010ef793          	and	a5,t4,16
    374c:	00072d03          	lw	s10,0(a4)
    3750:	00470713          	add	a4,a4,4
    3754:	00e12a23          	sw	a4,20(sp)
    3758:	08079863          	bnez	a5,37e8 <_vfprintf_r+0x18b0>
    375c:	040ef793          	and	a5,t4,64
    3760:	08078063          	beqz	a5,37e0 <_vfprintf_r+0x18a8>
    3764:	010d1d13          	sll	s10,s10,0x10
    3768:	010d5d13          	srl	s10,s10,0x10
    376c:	00000c93          	li	s9,0
    3770:	e31ff06f          	j	35a0 <_vfprintf_r+0x1668>
    3774:	00000d13          	li	s10,0
    3778:	15010c13          	add	s8,sp,336
    377c:	a2cff06f          	j	29a8 <_vfprintf_r+0xa70>
    3780:	00812583          	lw	a1,8(sp)
    3784:	0a010613          	add	a2,sp,160
    3788:	00098513          	mv	a0,s3
    378c:	03d12023          	sw	t4,32(sp)
    3790:	664010ef          	jal	4df4 <__sprint_r>
    3794:	00050463          	beqz	a0,379c <_vfprintf_r+0x1864>
    3798:	c71fe06f          	j	2408 <_vfprintf_r+0x4d0>
    379c:	0a812483          	lw	s1,168(sp)
    37a0:	0a412d03          	lw	s10,164(sp)
    37a4:	02012e83          	lw	t4,32(sp)
    37a8:	0ac10b13          	add	s6,sp,172
    37ac:	f71fe06f          	j	271c <_vfprintf_r+0x7e4>
    37b0:	00812583          	lw	a1,8(sp)
    37b4:	0a010613          	add	a2,sp,160
    37b8:	00098513          	mv	a0,s3
    37bc:	03d12023          	sw	t4,32(sp)
    37c0:	634010ef          	jal	4df4 <__sprint_r>
    37c4:	00050463          	beqz	a0,37cc <_vfprintf_r+0x1894>
    37c8:	c41fe06f          	j	2408 <_vfprintf_r+0x4d0>
    37cc:	0a812483          	lw	s1,168(sp)
    37d0:	0a412d03          	lw	s10,164(sp)
    37d4:	02012e83          	lw	t4,32(sp)
    37d8:	0ac10b13          	add	s6,sp,172
    37dc:	f71fe06f          	j	274c <_vfprintf_r+0x814>
    37e0:	200ef793          	and	a5,t4,512
    37e4:	76079663          	bnez	a5,3f50 <_vfprintf_r+0x2018>
    37e8:	00000c93          	li	s9,0
    37ec:	db5ff06f          	j	35a0 <_vfprintf_r+0x1668>
    37f0:	00000793          	li	a5,0
    37f4:	15010b13          	add	s6,sp,336
    37f8:	01212823          	sw	s2,16(sp)
    37fc:	00078913          	mv	s2,a5
    3800:	00098793          	mv	a5,s3
    3804:	04812823          	sw	s0,80(sp)
    3808:	000b0993          	mv	s3,s6
    380c:	03c12403          	lw	s0,60(sp)
    3810:	40067493          	and	s1,a2,1024
    3814:	0ff00a13          	li	s4,255
    3818:	03c12023          	sw	t3,32(sp)
    381c:	02c12223          	sw	a2,36(sp)
    3820:	04612223          	sw	t1,68(sp)
    3824:	00078b13          	mv	s6,a5
    3828:	0280006f          	j	3850 <_vfprintf_r+0x1918>
    382c:	00a00613          	li	a2,10
    3830:	00000693          	li	a3,0
    3834:	000d0513          	mv	a0,s10
    3838:	000c8593          	mv	a1,s9
    383c:	485070ef          	jal	b4c0 <__udivdi3>
    3840:	6a0c8ee3          	beqz	s9,46fc <_vfprintf_r+0x27c4>
    3844:	00050d13          	mv	s10,a0
    3848:	00058c93          	mv	s9,a1
    384c:	000c0993          	mv	s3,s8
    3850:	00a00613          	li	a2,10
    3854:	00000693          	li	a3,0
    3858:	000d0513          	mv	a0,s10
    385c:	000c8593          	mv	a1,s9
    3860:	30c080ef          	jal	bb6c <__umoddi3>
    3864:	03050513          	add	a0,a0,48
    3868:	fea98fa3          	sb	a0,-1(s3)
    386c:	fff98c13          	add	s8,s3,-1
    3870:	00190913          	add	s2,s2,1
    3874:	fa048ce3          	beqz	s1,382c <_vfprintf_r+0x18f4>
    3878:	00044783          	lbu	a5,0(s0)
    387c:	faf918e3          	bne	s2,a5,382c <_vfprintf_r+0x18f4>
    3880:	fb4906e3          	beq	s2,s4,382c <_vfprintf_r+0x18f4>
    3884:	560c9ae3          	bnez	s9,45f8 <_vfprintf_r+0x26c0>
    3888:	00900793          	li	a5,9
    388c:	57a7e6e3          	bltu	a5,s10,45f8 <_vfprintf_r+0x26c0>
    3890:	02412603          	lw	a2,36(sp)
    3894:	15010793          	add	a5,sp,336
    3898:	02812e23          	sw	s0,60(sp)
    389c:	01212c23          	sw	s2,24(sp)
    38a0:	02012e03          	lw	t3,32(sp)
    38a4:	01012903          	lw	s2,16(sp)
    38a8:	04412303          	lw	t1,68(sp)
    38ac:	05012403          	lw	s0,80(sp)
    38b0:	000b0993          	mv	s3,s6
    38b4:	41878d33          	sub	s10,a5,s8
    38b8:	00060e93          	mv	t4,a2
    38bc:	8ecff06f          	j	29a8 <_vfprintf_r+0xa70>
    38c0:	00812583          	lw	a1,8(sp)
    38c4:	0a010613          	add	a2,sp,160
    38c8:	00098513          	mv	a0,s3
    38cc:	04612e23          	sw	t1,92(sp)
    38d0:	05c12c23          	sw	t3,88(sp)
    38d4:	05d12a23          	sw	t4,84(sp)
    38d8:	05f12823          	sw	t6,80(sp)
    38dc:	04512223          	sw	t0,68(sp)
    38e0:	514010ef          	jal	4df4 <__sprint_r>
    38e4:	00050463          	beqz	a0,38ec <_vfprintf_r+0x19b4>
    38e8:	b21fe06f          	j	2408 <_vfprintf_r+0x4d0>
    38ec:	07714603          	lbu	a2,119(sp)
    38f0:	0a812483          	lw	s1,168(sp)
    38f4:	05c12303          	lw	t1,92(sp)
    38f8:	05812e03          	lw	t3,88(sp)
    38fc:	05412e83          	lw	t4,84(sp)
    3900:	05012f83          	lw	t6,80(sp)
    3904:	04412283          	lw	t0,68(sp)
    3908:	0ac10413          	add	s0,sp,172
    390c:	88dfe06f          	j	2198 <_vfprintf_r+0x260>
    3910:	02812883          	lw	a7,40(sp)
    3914:	02c12703          	lw	a4,44(sp)
    3918:	02612223          	sw	t1,36(sp)
    391c:	00088613          	mv	a2,a7
    3920:	00088513          	mv	a0,a7
    3924:	00070693          	mv	a3,a4
    3928:	00070593          	mv	a1,a4
    392c:	03c12023          	sw	t3,32(sp)
    3930:	01d12823          	sw	t4,16(sp)
    3934:	5310a0ef          	jal	e664 <__unorddf2>
    3938:	01012e83          	lw	t4,16(sp)
    393c:	02012e03          	lw	t3,32(sp)
    3940:	02412303          	lw	t1,36(sp)
    3944:	00050463          	beqz	a0,394c <_vfprintf_r+0x1a14>
    3948:	0e00106f          	j	4a28 <_vfprintf_r+0x2af0>
    394c:	06100713          	li	a4,97
    3950:	08ee0263          	beq	t3,a4,39d4 <_vfprintf_r+0x1a9c>
    3954:	04100713          	li	a4,65
    3958:	05800793          	li	a5,88
    395c:	06ee0e63          	beq	t3,a4,39d8 <_vfprintf_r+0x1aa0>
    3960:	fff00713          	li	a4,-1
    3964:	00e31463          	bne	t1,a4,396c <_vfprintf_r+0x1a34>
    3968:	01c0106f          	j	4984 <_vfprintf_r+0x2a4c>
    396c:	fdfe7713          	and	a4,t3,-33
    3970:	04700693          	li	a3,71
    3974:	00012823          	sw	zero,16(sp)
    3978:	00d71663          	bne	a4,a3,3984 <_vfprintf_r+0x1a4c>
    397c:	00031463          	bnez	t1,3984 <_vfprintf_r+0x1a4c>
    3980:	00100313          	li	t1,1
    3984:	100ee793          	or	a5,t4,256
    3988:	00078b13          	mv	s6,a5
    398c:	02c12783          	lw	a5,44(sp)
    3990:	04012223          	sw	zero,68(sp)
    3994:	00078493          	mv	s1,a5
    3998:	0007da63          	bgez	a5,39ac <_vfprintf_r+0x1a74>
    399c:	800004b7          	lui	s1,0x80000
    39a0:	00f4c4b3          	xor	s1,s1,a5
    39a4:	02d00793          	li	a5,45
    39a8:	04f12223          	sw	a5,68(sp)
    39ac:	fbfe0713          	add	a4,t3,-65
    39b0:	02500693          	li	a3,37
    39b4:	3ae6e463          	bltu	a3,a4,3d5c <_vfprintf_r+0x1e24>
    39b8:	0000c697          	auipc	a3,0xc
    39bc:	c3868693          	add	a3,a3,-968 # f5f0 <_ctype_+0x270>
    39c0:	00271713          	sll	a4,a4,0x2
    39c4:	00d70733          	add	a4,a4,a3
    39c8:	00072703          	lw	a4,0(a4)
    39cc:	00d70733          	add	a4,a4,a3
    39d0:	00070067          	jr	a4
    39d4:	07800793          	li	a5,120
    39d8:	03000713          	li	a4,48
    39dc:	06e10c23          	sb	a4,120(sp)
    39e0:	06f10ca3          	sb	a5,121(sp)
    39e4:	06300713          	li	a4,99
    39e8:	00012823          	sw	zero,16(sp)
    39ec:	002eee93          	or	t4,t4,2
    39f0:	0ec10c13          	add	s8,sp,236
    39f4:	f86758e3          	bge	a4,t1,3984 <_vfprintf_r+0x1a4c>
    39f8:	00130593          	add	a1,t1,1
    39fc:	00098513          	mv	a0,s3
    3a00:	03c12023          	sw	t3,32(sp)
    3a04:	01d12c23          	sw	t4,24(sp)
    3a08:	00612823          	sw	t1,16(sp)
    3a0c:	d35fd0ef          	jal	1740 <_malloc_r>
    3a10:	01012303          	lw	t1,16(sp)
    3a14:	01812e83          	lw	t4,24(sp)
    3a18:	02012e03          	lw	t3,32(sp)
    3a1c:	00050c13          	mv	s8,a0
    3a20:	00051463          	bnez	a0,3a28 <_vfprintf_r+0x1af0>
    3a24:	13c0106f          	j	4b60 <_vfprintf_r+0x2c28>
    3a28:	00a12823          	sw	a0,16(sp)
    3a2c:	f59ff06f          	j	3984 <_vfprintf_r+0x1a4c>
    3a30:	00098513          	mv	a0,s3
    3a34:	1d0030ef          	jal	6c04 <__sinit>
    3a38:	00c12783          	lw	a5,12(sp)
    3a3c:	d5cfe06f          	j	1f98 <_vfprintf_r+0x60>
    3a40:	00812583          	lw	a1,8(sp)
    3a44:	0a010613          	add	a2,sp,160
    3a48:	00098513          	mv	a0,s3
    3a4c:	03d12023          	sw	t4,32(sp)
    3a50:	3a4010ef          	jal	4df4 <__sprint_r>
    3a54:	00050463          	beqz	a0,3a5c <_vfprintf_r+0x1b24>
    3a58:	9b1fe06f          	j	2408 <_vfprintf_r+0x4d0>
    3a5c:	0a812483          	lw	s1,168(sp)
    3a60:	02012e83          	lw	t4,32(sp)
    3a64:	0ac10413          	add	s0,sp,172
    3a68:	9b0ff06f          	j	2c18 <_vfprintf_r+0xce0>
    3a6c:	00800613          	li	a2,8
    3a70:	00000593          	li	a1,0
    3a74:	09810513          	add	a0,sp,152
    3a78:	02612023          	sw	t1,32(sp)
    3a7c:	01c12a23          	sw	t3,20(sp)
    3a80:	01d12823          	sw	t4,16(sp)
    3a84:	09812223          	sw	s8,132(sp)
    3a88:	d5cfd0ef          	jal	fe4 <memset>
    3a8c:	02012303          	lw	t1,32(sp)
    3a90:	01012e83          	lw	t4,16(sp)
    3a94:	01412e03          	lw	t3,20(sp)
    3a98:	3a0340e3          	bltz	t1,4638 <_vfprintf_r+0x2700>
    3a9c:	00000d13          	li	s10,0
    3aa0:	01212823          	sw	s2,16(sp)
    3aa4:	000c0c93          	mv	s9,s8
    3aa8:	fff00493          	li	s1,-1
    3aac:	000b0c13          	mv	s8,s6
    3ab0:	000e8a13          	mv	s4,t4
    3ab4:	00040b13          	mv	s6,s0
    3ab8:	000d0913          	mv	s2,s10
    3abc:	00030413          	mv	s0,t1
    3ac0:	0300006f          	j	3af0 <_vfprintf_r+0x1bb8>
    3ac4:	09810693          	add	a3,sp,152
    3ac8:	0ec10593          	add	a1,sp,236
    3acc:	00098513          	mv	a0,s3
    3ad0:	685060ef          	jal	a954 <_wcrtomb_r>
    3ad4:	68950ae3          	beq	a0,s1,4968 <_vfprintf_r+0x2a30>
    3ad8:	00a907b3          	add	a5,s2,a0
    3adc:	02f44263          	blt	s0,a5,3b00 <_vfprintf_r+0x1bc8>
    3ae0:	004d0d13          	add	s10,s10,4
    3ae4:	00879463          	bne	a5,s0,3aec <_vfprintf_r+0x1bb4>
    3ae8:	7990006f          	j	4a80 <_vfprintf_r+0x2b48>
    3aec:	00078913          	mv	s2,a5
    3af0:	08412783          	lw	a5,132(sp)
    3af4:	01a787b3          	add	a5,a5,s10
    3af8:	0007a603          	lw	a2,0(a5)
    3afc:	fc0614e3          	bnez	a2,3ac4 <_vfprintf_r+0x1b8c>
    3b00:	00090d13          	mv	s10,s2
    3b04:	01412e03          	lw	t3,20(sp)
    3b08:	01012903          	lw	s2,16(sp)
    3b0c:	000b0413          	mv	s0,s6
    3b10:	000a0e93          	mv	t4,s4
    3b14:	000c0b13          	mv	s6,s8
    3b18:	000c8c13          	mv	s8,s9
    3b1c:	340d0ce3          	beqz	s10,4674 <_vfprintf_r+0x273c>
    3b20:	06300793          	li	a5,99
    3b24:	59a7dee3          	bge	a5,s10,48c0 <_vfprintf_r+0x2988>
    3b28:	001d0593          	add	a1,s10,1
    3b2c:	00098513          	mv	a0,s3
    3b30:	01c12a23          	sw	t3,20(sp)
    3b34:	01d12823          	sw	t4,16(sp)
    3b38:	c09fd0ef          	jal	1740 <_malloc_r>
    3b3c:	01012e83          	lw	t4,16(sp)
    3b40:	01412e03          	lw	t3,20(sp)
    3b44:	00050c13          	mv	s8,a0
    3b48:	620500e3          	beqz	a0,4968 <_vfprintf_r+0x2a30>
    3b4c:	00a12823          	sw	a0,16(sp)
    3b50:	00800613          	li	a2,8
    3b54:	00000593          	li	a1,0
    3b58:	09810513          	add	a0,sp,152
    3b5c:	03c12023          	sw	t3,32(sp)
    3b60:	01d12a23          	sw	t4,20(sp)
    3b64:	c80fd0ef          	jal	fe4 <memset>
    3b68:	09810713          	add	a4,sp,152
    3b6c:	000d0693          	mv	a3,s10
    3b70:	08410613          	add	a2,sp,132
    3b74:	000c0593          	mv	a1,s8
    3b78:	00098513          	mv	a0,s3
    3b7c:	665060ef          	jal	a9e0 <_wcsrtombs_r>
    3b80:	01412e83          	lw	t4,20(sp)
    3b84:	02012e03          	lw	t3,32(sp)
    3b88:	00ad0463          	beq	s10,a0,3b90 <_vfprintf_r+0x1c58>
    3b8c:	0240106f          	j	4bb0 <_vfprintf_r+0x2c78>
    3b90:	01ac0733          	add	a4,s8,s10
    3b94:	00070023          	sb	zero,0(a4)
    3b98:	07714603          	lbu	a2,119(sp)
    3b9c:	fffd4813          	not	a6,s10
    3ba0:	41f85813          	sra	a6,a6,0x1f
    3ba4:	01612a23          	sw	s6,20(sp)
    3ba8:	02012223          	sw	zero,36(sp)
    3bac:	02012023          	sw	zero,32(sp)
    3bb0:	010d7cb3          	and	s9,s10,a6
    3bb4:	00000313          	li	t1,0
    3bb8:	00000a13          	li	s4,0
    3bbc:	00061463          	bnez	a2,3bc4 <_vfprintf_r+0x1c8c>
    3bc0:	db8fe06f          	j	2178 <_vfprintf_r+0x240>
    3bc4:	9d5fe06f          	j	2598 <_vfprintf_r+0x660>
    3bc8:	00048e93          	mv	t4,s1
    3bcc:	000a0293          	mv	t0,s4
    3bd0:	00070493          	mv	s1,a4
    3bd4:	01a484b3          	add	s1,s1,s10
    3bd8:	00178793          	add	a5,a5,1
    3bdc:	00542023          	sw	t0,0(s0)
    3be0:	e48fe06f          	j	2228 <_vfprintf_r+0x2f0>
    3be4:	01412783          	lw	a5,20(sp)
    3be8:	00c12703          	lw	a4,12(sp)
    3bec:	0007a783          	lw	a5,0(a5)
    3bf0:	00e7a023          	sw	a4,0(a5)
    3bf4:	fadfe06f          	j	2ba0 <_vfprintf_r+0xc68>
    3bf8:	02012e83          	lw	t4,32(sp)
    3bfc:	00040293          	mv	t0,s0
    3c00:	000a0413          	mv	s0,s4
    3c04:	008484b3          	add	s1,s1,s0
    3c08:	001d0d13          	add	s10,s10,1
    3c0c:	005b2023          	sw	t0,0(s6)
    3c10:	b7dfe06f          	j	278c <_vfprintf_r+0x854>
    3c14:	03412703          	lw	a4,52(sp)
    3c18:	03012783          	lw	a5,48(sp)
    3c1c:	00700613          	li	a2,7
    3c20:	00e42023          	sw	a4,0(s0)
    3c24:	0a412703          	lw	a4,164(sp)
    3c28:	009784b3          	add	s1,a5,s1
    3c2c:	00f42223          	sw	a5,4(s0)
    3c30:	00170713          	add	a4,a4,1
    3c34:	0a912423          	sw	s1,168(sp)
    3c38:	0ae12223          	sw	a4,164(sp)
    3c3c:	00840413          	add	s0,s0,8
    3c40:	3ae64463          	blt	a2,a4,3fe8 <_vfprintf_r+0x20b0>
    3c44:	3e06cee3          	bltz	a3,4840 <_vfprintf_r+0x2908>
    3c48:	01812783          	lw	a5,24(sp)
    3c4c:	00170713          	add	a4,a4,1
    3c50:	01842023          	sw	s8,0(s0)
    3c54:	009784b3          	add	s1,a5,s1
    3c58:	00f42223          	sw	a5,4(s0)
    3c5c:	0a912423          	sw	s1,168(sp)
    3c60:	0ae12223          	sw	a4,164(sp)
    3c64:	00700793          	li	a5,7
    3c68:	00e7c463          	blt	a5,a4,3c70 <_vfprintf_r+0x1d38>
    3c6c:	dd0fe06f          	j	223c <_vfprintf_r+0x304>
    3c70:	b61fe06f          	j	27d0 <_vfprintf_r+0x898>
    3c74:	01000613          	li	a2,16
    3c78:	0a412683          	lw	a3,164(sp)
    3c7c:	0000c297          	auipc	t0,0xc
    3c80:	a0c28293          	add	t0,t0,-1524 # f688 <zeroes.0>
    3c84:	09665463          	bge	a2,s6,3d0c <_vfprintf_r+0x1dd4>
    3c88:	00040793          	mv	a5,s0
    3c8c:	00048713          	mv	a4,s1
    3c90:	00812403          	lw	s0,8(sp)
    3c94:	01000893          	li	a7,16
    3c98:	00700d13          	li	s10,7
    3c9c:	05d12223          	sw	t4,68(sp)
    3ca0:	00028493          	mv	s1,t0
    3ca4:	00c0006f          	j	3cb0 <_vfprintf_r+0x1d78>
    3ca8:	ff0b0b13          	add	s6,s6,-16
    3cac:	0568d863          	bge	a7,s6,3cfc <_vfprintf_r+0x1dc4>
    3cb0:	01070713          	add	a4,a4,16
    3cb4:	00168693          	add	a3,a3,1
    3cb8:	0097a023          	sw	s1,0(a5)
    3cbc:	0117a223          	sw	a7,4(a5)
    3cc0:	0ae12423          	sw	a4,168(sp)
    3cc4:	0ad12223          	sw	a3,164(sp)
    3cc8:	00878793          	add	a5,a5,8
    3ccc:	fcdd5ee3          	bge	s10,a3,3ca8 <_vfprintf_r+0x1d70>
    3cd0:	0a010613          	add	a2,sp,160
    3cd4:	00040593          	mv	a1,s0
    3cd8:	00098513          	mv	a0,s3
    3cdc:	118010ef          	jal	4df4 <__sprint_r>
    3ce0:	00050463          	beqz	a0,3ce8 <_vfprintf_r+0x1db0>
    3ce4:	f24fe06f          	j	2408 <_vfprintf_r+0x4d0>
    3ce8:	0a812703          	lw	a4,168(sp)
    3cec:	0a412683          	lw	a3,164(sp)
    3cf0:	0ac10793          	add	a5,sp,172
    3cf4:	01000893          	li	a7,16
    3cf8:	fb1ff06f          	j	3ca8 <_vfprintf_r+0x1d70>
    3cfc:	04412e83          	lw	t4,68(sp)
    3d00:	00048293          	mv	t0,s1
    3d04:	00078413          	mv	s0,a5
    3d08:	00070493          	mv	s1,a4
    3d0c:	016484b3          	add	s1,s1,s6
    3d10:	00168693          	add	a3,a3,1
    3d14:	00542023          	sw	t0,0(s0)
    3d18:	01642223          	sw	s6,4(s0)
    3d1c:	0a912423          	sw	s1,168(sp)
    3d20:	0ad12223          	sw	a3,164(sp)
    3d24:	00700713          	li	a4,7
    3d28:	00840413          	add	s0,s0,8
    3d2c:	bed75c63          	bge	a4,a3,3124 <_vfprintf_r+0x11ec>
    3d30:	00812583          	lw	a1,8(sp)
    3d34:	0a010613          	add	a2,sp,160
    3d38:	00098513          	mv	a0,s3
    3d3c:	05d12223          	sw	t4,68(sp)
    3d40:	0b4010ef          	jal	4df4 <__sprint_r>
    3d44:	00050463          	beqz	a0,3d4c <_vfprintf_r+0x1e14>
    3d48:	ec0fe06f          	j	2408 <_vfprintf_r+0x4d0>
    3d4c:	0a812483          	lw	s1,168(sp)
    3d50:	04412e83          	lw	t4,68(sp)
    3d54:	0ac10413          	add	s0,sp,172
    3d58:	bccff06f          	j	3124 <_vfprintf_r+0x11ec>
    3d5c:	02812703          	lw	a4,40(sp)
    3d60:	09810893          	add	a7,sp,152
    3d64:	08410813          	add	a6,sp,132
    3d68:	00070513          	mv	a0,a4
    3d6c:	00050593          	mv	a1,a0
    3d70:	00030713          	mv	a4,t1
    3d74:	07c10793          	add	a5,sp,124
    3d78:	00200693          	li	a3,2
    3d7c:	00048613          	mv	a2,s1
    3d80:	00098513          	mv	a0,s3
    3d84:	03c12223          	sw	t3,36(sp)
    3d88:	03d12023          	sw	t4,32(sp)
    3d8c:	00612c23          	sw	t1,24(sp)
    3d90:	11c040ef          	jal	7eac <_dtoa_r>
    3d94:	02012e83          	lw	t4,32(sp)
    3d98:	01812303          	lw	t1,24(sp)
    3d9c:	02412e03          	lw	t3,36(sp)
    3da0:	001ef713          	and	a4,t4,1
    3da4:	00050c13          	mv	s8,a0
    3da8:	1a0712e3          	bnez	a4,474c <_vfprintf_r+0x2814>
    3dac:	09812783          	lw	a5,152(sp)
    3db0:	07c12a03          	lw	s4,124(sp)
    3db4:	40a787b3          	sub	a5,a5,a0
    3db8:	00f12c23          	sw	a5,24(sp)
    3dbc:	ffd00713          	li	a4,-3
    3dc0:	00ea4463          	blt	s4,a4,3dc8 <_vfprintf_r+0x1e90>
    3dc4:	5b435663          	bge	t1,s4,4370 <_vfprintf_r+0x2438>
    3dc8:	ffee0e13          	add	t3,t3,-2
    3dcc:	fffa0d13          	add	s10,s4,-1
    3dd0:	07a12e23          	sw	s10,124(sp)
    3dd4:	0ffe7693          	zext.b	a3,t3
    3dd8:	00000613          	li	a2,0
    3ddc:	08d10423          	sb	a3,136(sp)
    3de0:	02b00693          	li	a3,43
    3de4:	000d5863          	bgez	s10,3df4 <_vfprintf_r+0x1ebc>
    3de8:	00100713          	li	a4,1
    3dec:	41470d33          	sub	s10,a4,s4
    3df0:	02d00693          	li	a3,45
    3df4:	08d104a3          	sb	a3,137(sp)
    3df8:	00900693          	li	a3,9
    3dfc:	33a6d8e3          	bge	a3,s10,492c <_vfprintf_r+0x29f4>
    3e00:	000c0793          	mv	a5,s8
    3e04:	09f10493          	add	s1,sp,159
    3e08:	03212023          	sw	s2,32(sp)
    3e0c:	00040c13          	mv	s8,s0
    3e10:	06300a13          	li	s4,99
    3e14:	000d0413          	mv	s0,s10
    3e18:	03d12223          	sw	t4,36(sp)
    3e1c:	05c12023          	sw	t3,64(sp)
    3e20:	00048913          	mv	s2,s1
    3e24:	00098c93          	mv	s9,s3
    3e28:	00078d13          	mv	s10,a5
    3e2c:	00a00593          	li	a1,10
    3e30:	00040513          	mv	a0,s0
    3e34:	7a10a0ef          	jal	edd4 <__modsi3>
    3e38:	03050713          	add	a4,a0,48
    3e3c:	00090b13          	mv	s6,s2
    3e40:	00040513          	mv	a0,s0
    3e44:	feeb0fa3          	sb	a4,-1(s6)
    3e48:	00a00593          	li	a1,10
    3e4c:	00040993          	mv	s3,s0
    3e50:	7010a0ef          	jal	ed50 <__divsi3>
    3e54:	fff90913          	add	s2,s2,-1
    3e58:	00050413          	mv	s0,a0
    3e5c:	fd3a48e3          	blt	s4,s3,3e2c <_vfprintf_r+0x1ef4>
    3e60:	000c8993          	mv	s3,s9
    3e64:	03050713          	add	a4,a0,48
    3e68:	00090c93          	mv	s9,s2
    3e6c:	ffeb0693          	add	a3,s6,-2
    3e70:	feec8fa3          	sb	a4,-1(s9)
    3e74:	000c0413          	mv	s0,s8
    3e78:	02412e83          	lw	t4,36(sp)
    3e7c:	04012e03          	lw	t3,64(sp)
    3e80:	02012903          	lw	s2,32(sp)
    3e84:	000d0c13          	mv	s8,s10
    3e88:	4c96f6e3          	bgeu	a3,s1,4b54 <_vfprintf_r+0x2c1c>
    3e8c:	08a10713          	add	a4,sp,138
    3e90:	0006c783          	lbu	a5,0(a3)
    3e94:	00168693          	add	a3,a3,1
    3e98:	00170713          	add	a4,a4,1
    3e9c:	fef70fa3          	sb	a5,-1(a4)
    3ea0:	fe9698e3          	bne	a3,s1,3e90 <_vfprintf_r+0x1f58>
    3ea4:	15010793          	add	a5,sp,336
    3ea8:	41678633          	sub	a2,a5,s6
    3eac:	f5360793          	add	a5,a2,-173
    3eb0:	04f12023          	sw	a5,64(sp)
    3eb4:	01812783          	lw	a5,24(sp)
    3eb8:	04012683          	lw	a3,64(sp)
    3ebc:	00100713          	li	a4,1
    3ec0:	00d78d33          	add	s10,a5,a3
    3ec4:	28f75ce3          	bge	a4,a5,495c <_vfprintf_r+0x2a24>
    3ec8:	03012783          	lw	a5,48(sp)
    3ecc:	00fd0d33          	add	s10,s10,a5
    3ed0:	fffd4813          	not	a6,s10
    3ed4:	bffeff13          	and	t5,t4,-1025
    3ed8:	41f85813          	sra	a6,a6,0x1f
    3edc:	100f6e93          	or	t4,t5,256
    3ee0:	010d7cb3          	and	s9,s10,a6
    3ee4:	02012223          	sw	zero,36(sp)
    3ee8:	02012023          	sw	zero,32(sp)
    3eec:	00000a13          	li	s4,0
    3ef0:	04412783          	lw	a5,68(sp)
    3ef4:	46079263          	bnez	a5,4358 <_vfprintf_r+0x2420>
    3ef8:	07714603          	lbu	a2,119(sp)
    3efc:	00000313          	li	t1,0
    3f00:	00061463          	bnez	a2,3f08 <_vfprintf_r+0x1fd0>
    3f04:	a74fe06f          	j	2178 <_vfprintf_r+0x240>
    3f08:	e90fe06f          	j	2598 <_vfprintf_r+0x660>
    3f0c:	00812583          	lw	a1,8(sp)
    3f10:	0a010613          	add	a2,sp,160
    3f14:	00098513          	mv	a0,s3
    3f18:	03d12023          	sw	t4,32(sp)
    3f1c:	6d9000ef          	jal	4df4 <__sprint_r>
    3f20:	00050463          	beqz	a0,3f28 <_vfprintf_r+0x1ff0>
    3f24:	ce4fe06f          	j	2408 <_vfprintf_r+0x4d0>
    3f28:	07c12683          	lw	a3,124(sp)
    3f2c:	0a812483          	lw	s1,168(sp)
    3f30:	02012e83          	lw	t4,32(sp)
    3f34:	0ac10413          	add	s0,sp,172
    3f38:	ce0ff06f          	j	3418 <_vfprintf_r+0x14e0>
    3f3c:	00600c93          	li	s9,6
    3f40:	f14ff06f          	j	3654 <_vfprintf_r+0x171c>
    3f44:	0ffd7d13          	zext.b	s10,s10
    3f48:	00000c93          	li	s9,0
    3f4c:	bd5fe06f          	j	2b20 <_vfprintf_r+0xbe8>
    3f50:	0ffd7d13          	zext.b	s10,s10
    3f54:	00000c93          	li	s9,0
    3f58:	e48ff06f          	j	35a0 <_vfprintf_r+0x1668>
    3f5c:	018d1d13          	sll	s10,s10,0x18
    3f60:	418d5d13          	sra	s10,s10,0x18
    3f64:	41fd5c93          	sra	s9,s10,0x1f
    3f68:	000c8793          	mv	a5,s9
    3f6c:	b39fe06f          	j	2aa4 <_vfprintf_r+0xb6c>
    3f70:	01412783          	lw	a5,20(sp)
    3f74:	00c12703          	lw	a4,12(sp)
    3f78:	0007a783          	lw	a5,0(a5)
    3f7c:	00e79023          	sh	a4,0(a5)
    3f80:	c21fe06f          	j	2ba0 <_vfprintf_r+0xc68>
    3f84:	000c0513          	mv	a0,s8
    3f88:	05d12223          	sw	t4,68(sp)
    3f8c:	ad8fd0ef          	jal	1264 <strlen>
    3f90:	07714603          	lbu	a2,119(sp)
    3f94:	fff54813          	not	a6,a0
    3f98:	41f85813          	sra	a6,a6,0x1f
    3f9c:	01612a23          	sw	s6,20(sp)
    3fa0:	02012223          	sw	zero,36(sp)
    3fa4:	02012023          	sw	zero,32(sp)
    3fa8:	00012823          	sw	zero,16(sp)
    3fac:	04412e83          	lw	t4,68(sp)
    3fb0:	00050d13          	mv	s10,a0
    3fb4:	01057cb3          	and	s9,a0,a6
    3fb8:	00000313          	li	t1,0
    3fbc:	07300e13          	li	t3,115
    3fc0:	00061463          	bnez	a2,3fc8 <_vfprintf_r+0x2090>
    3fc4:	9b4fe06f          	j	2178 <_vfprintf_r+0x240>
    3fc8:	dd0fe06f          	j	2598 <_vfprintf_r+0x660>
    3fcc:	00812583          	lw	a1,8(sp)
    3fd0:	0a010613          	add	a2,sp,160
    3fd4:	00098513          	mv	a0,s3
    3fd8:	61d000ef          	jal	4df4 <__sprint_r>
    3fdc:	00051463          	bnez	a0,3fe4 <_vfprintf_r+0x20ac>
    3fe0:	be8fe06f          	j	23c8 <_vfprintf_r+0x490>
    3fe4:	c38fe06f          	j	241c <_vfprintf_r+0x4e4>
    3fe8:	00812583          	lw	a1,8(sp)
    3fec:	0a010613          	add	a2,sp,160
    3ff0:	00098513          	mv	a0,s3
    3ff4:	03d12023          	sw	t4,32(sp)
    3ff8:	5fd000ef          	jal	4df4 <__sprint_r>
    3ffc:	00050463          	beqz	a0,4004 <_vfprintf_r+0x20cc>
    4000:	c08fe06f          	j	2408 <_vfprintf_r+0x4d0>
    4004:	07c12683          	lw	a3,124(sp)
    4008:	0a812483          	lw	s1,168(sp)
    400c:	0a412703          	lw	a4,164(sp)
    4010:	02012e83          	lw	t4,32(sp)
    4014:	0ac10413          	add	s0,sp,172
    4018:	c2dff06f          	j	3c44 <_vfprintf_r+0x1d0c>
    401c:	05862503          	lw	a0,88(a2)
    4020:	00f12623          	sw	a5,12(sp)
    4024:	fbdfc0ef          	jal	fe0 <__retarget_lock_release_recursive>
    4028:	00c12783          	lw	a5,12(sp)
    402c:	ab8fe06f          	j	22e4 <_vfprintf_r+0x3ac>
    4030:	00130a13          	add	s4,t1,1
    4034:	00200693          	li	a3,2
    4038:	02812703          	lw	a4,40(sp)
    403c:	09810893          	add	a7,sp,152
    4040:	08410813          	add	a6,sp,132
    4044:	00070513          	mv	a0,a4
    4048:	00050593          	mv	a1,a0
    404c:	000a0713          	mv	a4,s4
    4050:	07c10793          	add	a5,sp,124
    4054:	00048613          	mv	a2,s1
    4058:	00098513          	mv	a0,s3
    405c:	02612223          	sw	t1,36(sp)
    4060:	03c12023          	sw	t3,32(sp)
    4064:	01d12c23          	sw	t4,24(sp)
    4068:	645030ef          	jal	7eac <_dtoa_r>
    406c:	02012e03          	lw	t3,32(sp)
    4070:	04600693          	li	a3,70
    4074:	01812e83          	lw	t4,24(sp)
    4078:	fdfe7d13          	and	s10,t3,-33
    407c:	02412303          	lw	t1,36(sp)
    4080:	00050c13          	mv	s8,a0
    4084:	01450733          	add	a4,a0,s4
    4088:	34dd14e3          	bne	s10,a3,4bd0 <_vfprintf_r+0x2c98>
    408c:	000c4603          	lbu	a2,0(s8)
    4090:	03000693          	li	a3,48
    4094:	6cd60263          	beq	a2,a3,4758 <_vfprintf_r+0x2820>
    4098:	07c12683          	lw	a3,124(sp)
    409c:	00d70733          	add	a4,a4,a3
    40a0:	02812683          	lw	a3,40(sp)
    40a4:	00048593          	mv	a1,s1
    40a8:	00000613          	li	a2,0
    40ac:	00068513          	mv	a0,a3
    40b0:	00000693          	li	a3,0
    40b4:	04e12823          	sw	a4,80(sp)
    40b8:	02612223          	sw	t1,36(sp)
    40bc:	03c12023          	sw	t3,32(sp)
    40c0:	01d12c23          	sw	t4,24(sp)
    40c4:	274090ef          	jal	d338 <__eqdf2>
    40c8:	01812e83          	lw	t4,24(sp)
    40cc:	02012e03          	lw	t3,32(sp)
    40d0:	02412303          	lw	t1,36(sp)
    40d4:	05012703          	lw	a4,80(sp)
    40d8:	62050863          	beqz	a0,4708 <_vfprintf_r+0x27d0>
    40dc:	09812783          	lw	a5,152(sp)
    40e0:	00e7fe63          	bgeu	a5,a4,40fc <_vfprintf_r+0x21c4>
    40e4:	03000613          	li	a2,48
    40e8:	00178693          	add	a3,a5,1
    40ec:	08d12c23          	sw	a3,152(sp)
    40f0:	00c78023          	sb	a2,0(a5)
    40f4:	09812783          	lw	a5,152(sp)
    40f8:	fee7e8e3          	bltu	a5,a4,40e8 <_vfprintf_r+0x21b0>
    40fc:	07c12a03          	lw	s4,124(sp)
    4100:	418787b3          	sub	a5,a5,s8
    4104:	04700713          	li	a4,71
    4108:	00f12c23          	sw	a5,24(sp)
    410c:	caed08e3          	beq	s10,a4,3dbc <_vfprintf_r+0x1e84>
    4110:	04600713          	li	a4,70
    4114:	68ed0863          	beq	s10,a4,47a4 <_vfprintf_r+0x286c>
    4118:	fffa0d13          	add	s10,s4,-1
    411c:	cb5ff06f          	j	3dd0 <_vfprintf_r+0x1e98>
    4120:	02812703          	lw	a4,40(sp)
    4124:	07c10613          	add	a2,sp,124
    4128:	00048593          	mv	a1,s1
    412c:	00070513          	mv	a0,a4
    4130:	02612223          	sw	t1,36(sp)
    4134:	03c12023          	sw	t3,32(sp)
    4138:	01d12c23          	sw	t4,24(sp)
    413c:	25d030ef          	jal	7b98 <frexp>
    4140:	7fffc717          	auipc	a4,0x7fffc
    4144:	56870713          	add	a4,a4,1384 # 800006a8 <__global_locale+0x174>
    4148:	00072603          	lw	a2,0(a4)
    414c:	00472683          	lw	a3,4(a4)
    4150:	47c090ef          	jal	d5cc <__muldf3>
    4154:	00000613          	li	a2,0
    4158:	00000693          	li	a3,0
    415c:	00050a13          	mv	s4,a0
    4160:	00058d13          	mv	s10,a1
    4164:	1d4090ef          	jal	d338 <__eqdf2>
    4168:	01812e83          	lw	t4,24(sp)
    416c:	02012e03          	lw	t3,32(sp)
    4170:	02412303          	lw	t1,36(sp)
    4174:	00051663          	bnez	a0,4180 <_vfprintf_r+0x2248>
    4178:	00100713          	li	a4,1
    417c:	06e12e23          	sw	a4,124(sp)
    4180:	0000b797          	auipc	a5,0xb
    4184:	03478793          	add	a5,a5,52 # f1b4 <__fini_array_end+0x328>
    4188:	06100713          	li	a4,97
    418c:	02f12023          	sw	a5,32(sp)
    4190:	00ee1863          	bne	t3,a4,41a0 <_vfprintf_r+0x2268>
    4194:	0000b797          	auipc	a5,0xb
    4198:	00c78793          	add	a5,a5,12 # f1a0 <__fini_array_end+0x314>
    419c:	02f12023          	sw	a5,32(sp)
    41a0:	7fffc717          	auipc	a4,0x7fffc
    41a4:	51070713          	add	a4,a4,1296 # 800006b0 <__global_locale+0x17c>
    41a8:	00072783          	lw	a5,0(a4)
    41ac:	00472803          	lw	a6,4(a4)
    41b0:	000c0493          	mv	s1,s8
    41b4:	00f12c23          	sw	a5,24(sp)
    41b8:	000d0793          	mv	a5,s10
    41bc:	03212223          	sw	s2,36(sp)
    41c0:	000c0d13          	mv	s10,s8
    41c4:	02012903          	lw	s2,32(sp)
    41c8:	00098c13          	mv	s8,s3
    41cc:	01012e23          	sw	a6,28(sp)
    41d0:	fff30b13          	add	s6,t1,-1
    41d4:	fff00c93          	li	s9,-1
    41d8:	05d12023          	sw	t4,64(sp)
    41dc:	05c12823          	sw	t3,80(sp)
    41e0:	04812a23          	sw	s0,84(sp)
    41e4:	00078993          	mv	s3,a5
    41e8:	01c0006f          	j	4204 <_vfprintf_r+0x22cc>
    41ec:	00000613          	li	a2,0
    41f0:	00000693          	li	a3,0
    41f4:	fffb0413          	add	s0,s6,-1
    41f8:	140090ef          	jal	d338 <__eqdf2>
    41fc:	0a0504e3          	beqz	a0,4aa4 <_vfprintf_r+0x2b6c>
    4200:	00040b13          	mv	s6,s0
    4204:	01812603          	lw	a2,24(sp)
    4208:	01c12683          	lw	a3,28(sp)
    420c:	000a0513          	mv	a0,s4
    4210:	00098593          	mv	a1,s3
    4214:	3b8090ef          	jal	d5cc <__muldf3>
    4218:	00058a13          	mv	s4,a1
    421c:	00050993          	mv	s3,a0
    4220:	4980a0ef          	jal	e6b8 <__fixdfsi>
    4224:	00050413          	mv	s0,a0
    4228:	5140a0ef          	jal	e73c <__floatsidf>
    422c:	00050613          	mv	a2,a0
    4230:	00058693          	mv	a3,a1
    4234:	00098513          	mv	a0,s3
    4238:	000a0593          	mv	a1,s4
    423c:	321090ef          	jal	dd5c <__subdf3>
    4240:	00890733          	add	a4,s2,s0
    4244:	00074703          	lbu	a4,0(a4)
    4248:	00048813          	mv	a6,s1
    424c:	00050a13          	mv	s4,a0
    4250:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    4254:	00058993          	mv	s3,a1
    4258:	00148493          	add	s1,s1,1
    425c:	f99b18e3          	bne	s6,s9,41ec <_vfprintf_r+0x22b4>
    4260:	7fffc697          	auipc	a3,0x7fffc
    4264:	45868693          	add	a3,a3,1112 # 800006b8 <__global_locale+0x184>
    4268:	0006a303          	lw	t1,0(a3)
    426c:	0046a383          	lw	t2,4(a3)
    4270:	05012e03          	lw	t3,80(sp)
    4274:	00030613          	mv	a2,t1
    4278:	00038693          	mv	a3,t2
    427c:	01012c23          	sw	a6,24(sp)
    4280:	02412903          	lw	s2,36(sp)
    4284:	000c0993          	mv	s3,s8
    4288:	03c12223          	sw	t3,36(sp)
    428c:	000d0c13          	mv	s8,s10
    4290:	00058d13          	mv	s10,a1
    4294:	130090ef          	jal	d3c4 <__gedf2>
    4298:	7fffc797          	auipc	a5,0x7fffc
    429c:	42078793          	add	a5,a5,1056 # 800006b8 <__global_locale+0x184>
    42a0:	00040b13          	mv	s6,s0
    42a4:	0007a303          	lw	t1,0(a5)
    42a8:	05412403          	lw	s0,84(sp)
    42ac:	0047a383          	lw	t2,4(a5)
    42b0:	01812803          	lw	a6,24(sp)
    42b4:	02412e03          	lw	t3,36(sp)
    42b8:	04012e83          	lw	t4,64(sp)
    42bc:	0aa05ce3          	blez	a0,4b74 <_vfprintf_r+0x2c3c>
    42c0:	02012783          	lw	a5,32(sp)
    42c4:	09012c23          	sw	a6,152(sp)
    42c8:	fff4c603          	lbu	a2,-1(s1)
    42cc:	00f7c583          	lbu	a1,15(a5)
    42d0:	00048693          	mv	a3,s1
    42d4:	02b61063          	bne	a2,a1,42f4 <_vfprintf_r+0x23bc>
    42d8:	03000513          	li	a0,48
    42dc:	fea68fa3          	sb	a0,-1(a3)
    42e0:	09812683          	lw	a3,152(sp)
    42e4:	fff68793          	add	a5,a3,-1
    42e8:	08f12c23          	sw	a5,152(sp)
    42ec:	fff6c603          	lbu	a2,-1(a3)
    42f0:	feb606e3          	beq	a2,a1,42dc <_vfprintf_r+0x23a4>
    42f4:	00160593          	add	a1,a2,1
    42f8:	03900513          	li	a0,57
    42fc:	0ff5f593          	zext.b	a1,a1
    4300:	04a60463          	beq	a2,a0,4348 <_vfprintf_r+0x2410>
    4304:	feb68fa3          	sb	a1,-1(a3)
    4308:	00048793          	mv	a5,s1
    430c:	07c12a03          	lw	s4,124(sp)
    4310:	418787b3          	sub	a5,a5,s8
    4314:	06100613          	li	a2,97
    4318:	fffa0d13          	add	s10,s4,-1
    431c:	00f12c23          	sw	a5,24(sp)
    4320:	07a12e23          	sw	s10,124(sp)
    4324:	07000693          	li	a3,112
    4328:	00ce0663          	beq	t3,a2,4334 <_vfprintf_r+0x23fc>
    432c:	05000693          	li	a3,80
    4330:	04100e13          	li	t3,65
    4334:	00100613          	li	a2,1
    4338:	aa5ff06f          	j	3ddc <_vfprintf_r+0x1ea4>
    433c:	00030a13          	mv	s4,t1
    4340:	00300693          	li	a3,3
    4344:	cf5ff06f          	j	4038 <_vfprintf_r+0x2100>
    4348:	02012783          	lw	a5,32(sp)
    434c:	00a7c583          	lbu	a1,10(a5)
    4350:	feb68fa3          	sb	a1,-1(a3)
    4354:	fb5ff06f          	j	4308 <_vfprintf_r+0x23d0>
    4358:	02d00713          	li	a4,45
    435c:	06e10ba3          	sb	a4,119(sp)
    4360:	02d00613          	li	a2,45
    4364:	00000313          	li	t1,0
    4368:	001c8c93          	add	s9,s9,1
    436c:	e0dfd06f          	j	2178 <_vfprintf_r+0x240>
    4370:	01812783          	lw	a5,24(sp)
    4374:	46fa4063          	blt	s4,a5,47d4 <_vfprintf_r+0x289c>
    4378:	001ef713          	and	a4,t4,1
    437c:	000a0d13          	mv	s10,s4
    4380:	00070663          	beqz	a4,438c <_vfprintf_r+0x2454>
    4384:	03012783          	lw	a5,48(sp)
    4388:	00fa0d33          	add	s10,s4,a5
    438c:	400eff13          	and	t5,t4,1024
    4390:	000f0463          	beqz	t5,4398 <_vfprintf_r+0x2460>
    4394:	5f404e63          	bgtz	s4,4990 <_vfprintf_r+0x2a58>
    4398:	fffd4813          	not	a6,s10
    439c:	41f85813          	sra	a6,a6,0x1f
    43a0:	010d7cb3          	and	s9,s10,a6
    43a4:	06700e13          	li	t3,103
    43a8:	000b0e93          	mv	t4,s6
    43ac:	02012223          	sw	zero,36(sp)
    43b0:	02012023          	sw	zero,32(sp)
    43b4:	b3dff06f          	j	3ef0 <_vfprintf_r+0x1fb8>
    43b8:	02d00793          	li	a5,45
    43bc:	06f10ba3          	sb	a5,119(sp)
    43c0:	02d00613          	li	a2,45
    43c4:	998fe06f          	j	255c <_vfprintf_r+0x624>
    43c8:	01812783          	lw	a5,24(sp)
    43cc:	02012a03          	lw	s4,32(sp)
    43d0:	05212823          	sw	s2,80(sp)
    43d4:	00fc07b3          	add	a5,s8,a5
    43d8:	05712c23          	sw	s7,88(sp)
    43dc:	05912e23          	sw	s9,92(sp)
    43e0:	00040713          	mv	a4,s0
    43e4:	04f12223          	sw	a5,68(sp)
    43e8:	02412403          	lw	s0,36(sp)
    43ec:	05d12a23          	sw	t4,84(sp)
    43f0:	03812223          	sw	s8,36(sp)
    43f4:	03c12b83          	lw	s7,60(sp)
    43f8:	04c12c83          	lw	s9,76(sp)
    43fc:	00812903          	lw	s2,8(sp)
    4400:	00700693          	li	a3,7
    4404:	01000d13          	li	s10,16
    4408:	0000bb17          	auipc	s6,0xb
    440c:	280b0b13          	add	s6,s6,640 # f688 <zeroes.0>
    4410:	00048613          	mv	a2,s1
    4414:	00030c13          	mv	s8,t1
    4418:	09405863          	blez	s4,44a8 <_vfprintf_r+0x2570>
    441c:	16805e63          	blez	s0,4598 <_vfprintf_r+0x2660>
    4420:	fff40413          	add	s0,s0,-1
    4424:	04812783          	lw	a5,72(sp)
    4428:	01960633          	add	a2,a2,s9
    442c:	01972223          	sw	s9,4(a4)
    4430:	00f72023          	sw	a5,0(a4)
    4434:	0a412783          	lw	a5,164(sp)
    4438:	0ac12423          	sw	a2,168(sp)
    443c:	00870713          	add	a4,a4,8
    4440:	00178793          	add	a5,a5,1
    4444:	0af12223          	sw	a5,164(sp)
    4448:	14f6ce63          	blt	a3,a5,45a4 <_vfprintf_r+0x266c>
    444c:	04412783          	lw	a5,68(sp)
    4450:	000bc583          	lbu	a1,0(s7)
    4454:	418784b3          	sub	s1,a5,s8
    4458:	0095d463          	bge	a1,s1,4460 <_vfprintf_r+0x2528>
    445c:	00058493          	mv	s1,a1
    4460:	02905663          	blez	s1,448c <_vfprintf_r+0x2554>
    4464:	0a412583          	lw	a1,164(sp)
    4468:	00960633          	add	a2,a2,s1
    446c:	01872023          	sw	s8,0(a4)
    4470:	00158593          	add	a1,a1,1
    4474:	00972223          	sw	s1,4(a4)
    4478:	0ac12423          	sw	a2,168(sp)
    447c:	0ab12223          	sw	a1,164(sp)
    4480:	14b6c663          	blt	a3,a1,45cc <_vfprintf_r+0x2694>
    4484:	000bc583          	lbu	a1,0(s7)
    4488:	00870713          	add	a4,a4,8
    448c:	fff4c513          	not	a0,s1
    4490:	41f55513          	sra	a0,a0,0x1f
    4494:	00a4f7b3          	and	a5,s1,a0
    4498:	40f584b3          	sub	s1,a1,a5
    449c:	04904663          	bgtz	s1,44e8 <_vfprintf_r+0x25b0>
    44a0:	00bc0c33          	add	s8,s8,a1
    44a4:	f7404ce3          	bgtz	s4,441c <_vfprintf_r+0x24e4>
    44a8:	f6804ce3          	bgtz	s0,4420 <_vfprintf_r+0x24e8>
    44ac:	01812783          	lw	a5,24(sp)
    44b0:	000c0313          	mv	t1,s8
    44b4:	02412c03          	lw	s8,36(sp)
    44b8:	03712e23          	sw	s7,60(sp)
    44bc:	00070413          	mv	s0,a4
    44c0:	00fc0733          	add	a4,s8,a5
    44c4:	05012903          	lw	s2,80(sp)
    44c8:	05412e83          	lw	t4,84(sp)
    44cc:	05812b83          	lw	s7,88(sp)
    44d0:	05c12c83          	lw	s9,92(sp)
    44d4:	00060493          	mv	s1,a2
    44d8:	00676463          	bltu	a4,t1,44e0 <_vfprintf_r+0x25a8>
    44dc:	c59fe06f          	j	3134 <_vfprintf_r+0x11fc>
    44e0:	00070313          	mv	t1,a4
    44e4:	c51fe06f          	j	3134 <_vfprintf_r+0x11fc>
    44e8:	0a412583          	lw	a1,164(sp)
    44ec:	0000be97          	auipc	t4,0xb
    44f0:	19ce8e93          	add	t4,t4,412 # f688 <zeroes.0>
    44f4:	069d5c63          	bge	s10,s1,456c <_vfprintf_r+0x2634>
    44f8:	02812023          	sw	s0,32(sp)
    44fc:	00048413          	mv	s0,s1
    4500:	000b0493          	mv	s1,s6
    4504:	00c0006f          	j	4510 <_vfprintf_r+0x25d8>
    4508:	ff040413          	add	s0,s0,-16
    450c:	048d5a63          	bge	s10,s0,4560 <_vfprintf_r+0x2628>
    4510:	01060613          	add	a2,a2,16
    4514:	00158593          	add	a1,a1,1
    4518:	01672023          	sw	s6,0(a4)
    451c:	01a72223          	sw	s10,4(a4)
    4520:	0ac12423          	sw	a2,168(sp)
    4524:	0ab12223          	sw	a1,164(sp)
    4528:	00870713          	add	a4,a4,8
    452c:	fcb6dee3          	bge	a3,a1,4508 <_vfprintf_r+0x25d0>
    4530:	0a010613          	add	a2,sp,160
    4534:	00090593          	mv	a1,s2
    4538:	00098513          	mv	a0,s3
    453c:	0b9000ef          	jal	4df4 <__sprint_r>
    4540:	00050463          	beqz	a0,4548 <_vfprintf_r+0x2610>
    4544:	ec5fd06f          	j	2408 <_vfprintf_r+0x4d0>
    4548:	ff040413          	add	s0,s0,-16
    454c:	0a812603          	lw	a2,168(sp)
    4550:	0a412583          	lw	a1,164(sp)
    4554:	0ac10713          	add	a4,sp,172
    4558:	00700693          	li	a3,7
    455c:	fa8d4ae3          	blt	s10,s0,4510 <_vfprintf_r+0x25d8>
    4560:	00048e93          	mv	t4,s1
    4564:	00040493          	mv	s1,s0
    4568:	02012403          	lw	s0,32(sp)
    456c:	00960633          	add	a2,a2,s1
    4570:	00158593          	add	a1,a1,1
    4574:	01d72023          	sw	t4,0(a4)
    4578:	00972223          	sw	s1,4(a4)
    457c:	0ac12423          	sw	a2,168(sp)
    4580:	0ab12223          	sw	a1,164(sp)
    4584:	10b6ce63          	blt	a3,a1,46a0 <_vfprintf_r+0x2768>
    4588:	000bc583          	lbu	a1,0(s7)
    458c:	00870713          	add	a4,a4,8
    4590:	00bc0c33          	add	s8,s8,a1
    4594:	f11ff06f          	j	44a4 <_vfprintf_r+0x256c>
    4598:	fffb8b93          	add	s7,s7,-1
    459c:	fffa0a13          	add	s4,s4,-1
    45a0:	e85ff06f          	j	4424 <_vfprintf_r+0x24ec>
    45a4:	0a010613          	add	a2,sp,160
    45a8:	00090593          	mv	a1,s2
    45ac:	00098513          	mv	a0,s3
    45b0:	045000ef          	jal	4df4 <__sprint_r>
    45b4:	00050463          	beqz	a0,45bc <_vfprintf_r+0x2684>
    45b8:	e51fd06f          	j	2408 <_vfprintf_r+0x4d0>
    45bc:	0a812603          	lw	a2,168(sp)
    45c0:	0ac10713          	add	a4,sp,172
    45c4:	00700693          	li	a3,7
    45c8:	e85ff06f          	j	444c <_vfprintf_r+0x2514>
    45cc:	0a010613          	add	a2,sp,160
    45d0:	00090593          	mv	a1,s2
    45d4:	00098513          	mv	a0,s3
    45d8:	01d000ef          	jal	4df4 <__sprint_r>
    45dc:	00050463          	beqz	a0,45e4 <_vfprintf_r+0x26ac>
    45e0:	e29fd06f          	j	2408 <_vfprintf_r+0x4d0>
    45e4:	000bc583          	lbu	a1,0(s7)
    45e8:	0a812603          	lw	a2,168(sp)
    45ec:	0ac10713          	add	a4,sp,172
    45f0:	00700693          	li	a3,7
    45f4:	e99ff06f          	j	448c <_vfprintf_r+0x2554>
    45f8:	04c12783          	lw	a5,76(sp)
    45fc:	04812583          	lw	a1,72(sp)
    4600:	00000913          	li	s2,0
    4604:	40fc0c33          	sub	s8,s8,a5
    4608:	00078613          	mv	a2,a5
    460c:	000c0513          	mv	a0,s8
    4610:	1dc030ef          	jal	77ec <strncpy>
    4614:	00144783          	lbu	a5,1(s0)
    4618:	00a00613          	li	a2,10
    461c:	00000693          	li	a3,0
    4620:	00f037b3          	snez	a5,a5
    4624:	000d0513          	mv	a0,s10
    4628:	000c8593          	mv	a1,s9
    462c:	00f40433          	add	s0,s0,a5
    4630:	691060ef          	jal	b4c0 <__udivdi3>
    4634:	a10ff06f          	j	3844 <_vfprintf_r+0x190c>
    4638:	09810713          	add	a4,sp,152
    463c:	00000693          	li	a3,0
    4640:	08410613          	add	a2,sp,132
    4644:	00000593          	li	a1,0
    4648:	00098513          	mv	a0,s3
    464c:	01c12a23          	sw	t3,20(sp)
    4650:	01d12823          	sw	t4,16(sp)
    4654:	38c060ef          	jal	a9e0 <_wcsrtombs_r>
    4658:	fff00713          	li	a4,-1
    465c:	01012e83          	lw	t4,16(sp)
    4660:	01412e03          	lw	t3,20(sp)
    4664:	00050d13          	mv	s10,a0
    4668:	30e50063          	beq	a0,a4,4968 <_vfprintf_r+0x2a30>
    466c:	09812223          	sw	s8,132(sp)
    4670:	cacff06f          	j	3b1c <_vfprintf_r+0x1be4>
    4674:	07714603          	lbu	a2,119(sp)
    4678:	01612a23          	sw	s6,20(sp)
    467c:	02012223          	sw	zero,36(sp)
    4680:	02012023          	sw	zero,32(sp)
    4684:	00012823          	sw	zero,16(sp)
    4688:	00000c93          	li	s9,0
    468c:	00000313          	li	t1,0
    4690:	00000a13          	li	s4,0
    4694:	00061463          	bnez	a2,469c <_vfprintf_r+0x2764>
    4698:	ae1fd06f          	j	2178 <_vfprintf_r+0x240>
    469c:	efdfd06f          	j	2598 <_vfprintf_r+0x660>
    46a0:	0a010613          	add	a2,sp,160
    46a4:	00090593          	mv	a1,s2
    46a8:	00098513          	mv	a0,s3
    46ac:	748000ef          	jal	4df4 <__sprint_r>
    46b0:	00050463          	beqz	a0,46b8 <_vfprintf_r+0x2780>
    46b4:	d55fd06f          	j	2408 <_vfprintf_r+0x4d0>
    46b8:	000bc583          	lbu	a1,0(s7)
    46bc:	0a812603          	lw	a2,168(sp)
    46c0:	0ac10713          	add	a4,sp,172
    46c4:	00700693          	li	a3,7
    46c8:	00bc0c33          	add	s8,s8,a1
    46cc:	dd9ff06f          	j	44a4 <_vfprintf_r+0x256c>
    46d0:	00812583          	lw	a1,8(sp)
    46d4:	0a010613          	add	a2,sp,160
    46d8:	00098513          	mv	a0,s3
    46dc:	05d12223          	sw	t4,68(sp)
    46e0:	714000ef          	jal	4df4 <__sprint_r>
    46e4:	00050463          	beqz	a0,46ec <_vfprintf_r+0x27b4>
    46e8:	d21fd06f          	j	2408 <_vfprintf_r+0x4d0>
    46ec:	0a812483          	lw	s1,168(sp)
    46f0:	04412e83          	lw	t4,68(sp)
    46f4:	0ac10413          	add	s0,sp,172
    46f8:	a19fe06f          	j	3110 <_vfprintf_r+0x11d8>
    46fc:	00900793          	li	a5,9
    4700:	95a7e263          	bltu	a5,s10,3844 <_vfprintf_r+0x190c>
    4704:	98cff06f          	j	3890 <_vfprintf_r+0x1958>
    4708:	07c12a03          	lw	s4,124(sp)
    470c:	00070793          	mv	a5,a4
    4710:	9f1ff06f          	j	4100 <_vfprintf_r+0x21c8>
    4714:	00812583          	lw	a1,8(sp)
    4718:	0a010613          	add	a2,sp,160
    471c:	00098513          	mv	a0,s3
    4720:	03d12023          	sw	t4,32(sp)
    4724:	6d0000ef          	jal	4df4 <__sprint_r>
    4728:	00050463          	beqz	a0,4730 <_vfprintf_r+0x27f8>
    472c:	cddfd06f          	j	2408 <_vfprintf_r+0x4d0>
    4730:	07c12d03          	lw	s10,124(sp)
    4734:	01812783          	lw	a5,24(sp)
    4738:	0a812483          	lw	s1,168(sp)
    473c:	02012e83          	lw	t4,32(sp)
    4740:	0ac10413          	add	s0,sp,172
    4744:	41a78d33          	sub	s10,a5,s10
    4748:	a49fe06f          	j	3190 <_vfprintf_r+0x1258>
    474c:	00650733          	add	a4,a0,t1
    4750:	04700d13          	li	s10,71
    4754:	94dff06f          	j	40a0 <_vfprintf_r+0x2168>
    4758:	02812603          	lw	a2,40(sp)
    475c:	00048593          	mv	a1,s1
    4760:	00000693          	li	a3,0
    4764:	00060513          	mv	a0,a2
    4768:	00000613          	li	a2,0
    476c:	04e12823          	sw	a4,80(sp)
    4770:	02612223          	sw	t1,36(sp)
    4774:	03c12023          	sw	t3,32(sp)
    4778:	01d12c23          	sw	t4,24(sp)
    477c:	3bd080ef          	jal	d338 <__eqdf2>
    4780:	01812e83          	lw	t4,24(sp)
    4784:	02012e03          	lw	t3,32(sp)
    4788:	02412303          	lw	t1,36(sp)
    478c:	05012703          	lw	a4,80(sp)
    4790:	34051e63          	bnez	a0,4aec <_vfprintf_r+0x2bb4>
    4794:	07c12a03          	lw	s4,124(sp)
    4798:	01470733          	add	a4,a4,s4
    479c:	418707b3          	sub	a5,a4,s8
    47a0:	00f12c23          	sw	a5,24(sp)
    47a4:	001ef713          	and	a4,t4,1
    47a8:	00676733          	or	a4,a4,t1
    47ac:	37405a63          	blez	s4,4b20 <_vfprintf_r+0x2be8>
    47b0:	26071263          	bnez	a4,4a14 <_vfprintf_r+0x2adc>
    47b4:	000a0d13          	mv	s10,s4
    47b8:	06600e13          	li	t3,102
    47bc:	400eff13          	and	t5,t4,1024
    47c0:	1c0f1a63          	bnez	t5,4994 <_vfprintf_r+0x2a5c>
    47c4:	fffd4813          	not	a6,s10
    47c8:	41f85813          	sra	a6,a6,0x1f
    47cc:	010d7cb3          	and	s9,s10,a6
    47d0:	bd9ff06f          	j	43a8 <_vfprintf_r+0x2470>
    47d4:	01812783          	lw	a5,24(sp)
    47d8:	03012703          	lw	a4,48(sp)
    47dc:	06700e13          	li	t3,103
    47e0:	00e78d33          	add	s10,a5,a4
    47e4:	fd404ce3          	bgtz	s4,47bc <_vfprintf_r+0x2884>
    47e8:	414d06b3          	sub	a3,s10,s4
    47ec:	00168d13          	add	s10,a3,1
    47f0:	fffd4813          	not	a6,s10
    47f4:	41f85813          	sra	a6,a6,0x1f
    47f8:	010d7cb3          	and	s9,s10,a6
    47fc:	badff06f          	j	43a8 <_vfprintf_r+0x2470>
    4800:	000e8613          	mv	a2,t4
    4804:	ad8fe06f          	j	2adc <_vfprintf_r+0xba4>
    4808:	00812783          	lw	a5,8(sp)
    480c:	0647a783          	lw	a5,100(a5)
    4810:	0017f793          	and	a5,a5,1
    4814:	02079063          	bnez	a5,4834 <_vfprintf_r+0x28fc>
    4818:	00812783          	lw	a5,8(sp)
    481c:	00c7d783          	lhu	a5,12(a5)
    4820:	2007f793          	and	a5,a5,512
    4824:	00079863          	bnez	a5,4834 <_vfprintf_r+0x28fc>
    4828:	00812783          	lw	a5,8(sp)
    482c:	0587a503          	lw	a0,88(a5)
    4830:	fb0fc0ef          	jal	fe0 <__retarget_lock_release_recursive>
    4834:	fff00793          	li	a5,-1
    4838:	00f12623          	sw	a5,12(sp)
    483c:	c2dfd06f          	j	2468 <_vfprintf_r+0x530>
    4840:	ff000613          	li	a2,-16
    4844:	40d00d33          	neg	s10,a3
    4848:	0000b297          	auipc	t0,0xb
    484c:	e4028293          	add	t0,t0,-448 # f688 <zeroes.0>
    4850:	08c6d463          	bge	a3,a2,48d8 <_vfprintf_r+0x29a0>
    4854:	03212023          	sw	s2,32(sp)
    4858:	01000693          	li	a3,16
    485c:	00700b13          	li	s6,7
    4860:	000e8a13          	mv	s4,t4
    4864:	00028913          	mv	s2,t0
    4868:	00c0006f          	j	4874 <_vfprintf_r+0x293c>
    486c:	ff0d0d13          	add	s10,s10,-16
    4870:	05a6de63          	bge	a3,s10,48cc <_vfprintf_r+0x2994>
    4874:	01048493          	add	s1,s1,16
    4878:	00170713          	add	a4,a4,1
    487c:	01242023          	sw	s2,0(s0)
    4880:	00d42223          	sw	a3,4(s0)
    4884:	0a912423          	sw	s1,168(sp)
    4888:	0ae12223          	sw	a4,164(sp)
    488c:	00840413          	add	s0,s0,8
    4890:	fceb5ee3          	bge	s6,a4,486c <_vfprintf_r+0x2934>
    4894:	00812583          	lw	a1,8(sp)
    4898:	0a010613          	add	a2,sp,160
    489c:	00098513          	mv	a0,s3
    48a0:	554000ef          	jal	4df4 <__sprint_r>
    48a4:	00050463          	beqz	a0,48ac <_vfprintf_r+0x2974>
    48a8:	b61fd06f          	j	2408 <_vfprintf_r+0x4d0>
    48ac:	0a812483          	lw	s1,168(sp)
    48b0:	0a412703          	lw	a4,164(sp)
    48b4:	0ac10413          	add	s0,sp,172
    48b8:	01000693          	li	a3,16
    48bc:	fb1ff06f          	j	486c <_vfprintf_r+0x2934>
    48c0:	00012823          	sw	zero,16(sp)
    48c4:	0ec10c13          	add	s8,sp,236
    48c8:	a88ff06f          	j	3b50 <_vfprintf_r+0x1c18>
    48cc:	00090293          	mv	t0,s2
    48d0:	02012903          	lw	s2,32(sp)
    48d4:	000a0e93          	mv	t4,s4
    48d8:	01a484b3          	add	s1,s1,s10
    48dc:	00170713          	add	a4,a4,1
    48e0:	00542023          	sw	t0,0(s0)
    48e4:	01a42223          	sw	s10,4(s0)
    48e8:	0a912423          	sw	s1,168(sp)
    48ec:	0ae12223          	sw	a4,164(sp)
    48f0:	00700693          	li	a3,7
    48f4:	00e6c463          	blt	a3,a4,48fc <_vfprintf_r+0x29c4>
    48f8:	b65fe06f          	j	345c <_vfprintf_r+0x1524>
    48fc:	00812583          	lw	a1,8(sp)
    4900:	0a010613          	add	a2,sp,160
    4904:	00098513          	mv	a0,s3
    4908:	03d12023          	sw	t4,32(sp)
    490c:	4e8000ef          	jal	4df4 <__sprint_r>
    4910:	00050463          	beqz	a0,4918 <_vfprintf_r+0x29e0>
    4914:	af5fd06f          	j	2408 <_vfprintf_r+0x4d0>
    4918:	0a812483          	lw	s1,168(sp)
    491c:	0a412703          	lw	a4,164(sp)
    4920:	02012e83          	lw	t4,32(sp)
    4924:	0ac10413          	add	s0,sp,172
    4928:	b20ff06f          	j	3c48 <_vfprintf_r+0x1d10>
    492c:	08a10693          	add	a3,sp,138
    4930:	00061863          	bnez	a2,4940 <_vfprintf_r+0x2a08>
    4934:	03000693          	li	a3,48
    4938:	08d10523          	sb	a3,138(sp)
    493c:	08b10693          	add	a3,sp,139
    4940:	15010793          	add	a5,sp,336
    4944:	40f68633          	sub	a2,a3,a5
    4948:	030d0713          	add	a4,s10,48
    494c:	0c960793          	add	a5,a2,201
    4950:	00e68023          	sb	a4,0(a3)
    4954:	04f12023          	sw	a5,64(sp)
    4958:	d5cff06f          	j	3eb4 <_vfprintf_r+0x1f7c>
    495c:	001ef713          	and	a4,t4,1
    4960:	d6070863          	beqz	a4,3ed0 <_vfprintf_r+0x1f98>
    4964:	d64ff06f          	j	3ec8 <_vfprintf_r+0x1f90>
    4968:	00812783          	lw	a5,8(sp)
    496c:	00000293          	li	t0,0
    4970:	00c79783          	lh	a5,12(a5)
    4974:	0407e793          	or	a5,a5,64
    4978:	00812703          	lw	a4,8(sp)
    497c:	00f71623          	sh	a5,12(a4)
    4980:	a8dfd06f          	j	240c <_vfprintf_r+0x4d4>
    4984:	00012823          	sw	zero,16(sp)
    4988:	00600313          	li	t1,6
    498c:	ff9fe06f          	j	3984 <_vfprintf_r+0x1a4c>
    4990:	06700e13          	li	t3,103
    4994:	03c12783          	lw	a5,60(sp)
    4998:	0ff00613          	li	a2,255
    499c:	0007c703          	lbu	a4,0(a5)
    49a0:	22c70263          	beq	a4,a2,4bc4 <_vfprintf_r+0x2c8c>
    49a4:	00000593          	li	a1,0
    49a8:	00000693          	li	a3,0
    49ac:	01475e63          	bge	a4,s4,49c8 <_vfprintf_r+0x2a90>
    49b0:	40ea0a33          	sub	s4,s4,a4
    49b4:	0017c703          	lbu	a4,1(a5)
    49b8:	04070863          	beqz	a4,4a08 <_vfprintf_r+0x2ad0>
    49bc:	00168693          	add	a3,a3,1
    49c0:	00178793          	add	a5,a5,1
    49c4:	fec714e3          	bne	a4,a2,49ac <_vfprintf_r+0x2a74>
    49c8:	02f12e23          	sw	a5,60(sp)
    49cc:	02d12023          	sw	a3,32(sp)
    49d0:	02b12223          	sw	a1,36(sp)
    49d4:	02012783          	lw	a5,32(sp)
    49d8:	02412703          	lw	a4,36(sp)
    49dc:	04c12583          	lw	a1,76(sp)
    49e0:	05c12823          	sw	t3,80(sp)
    49e4:	00e78533          	add	a0,a5,a4
    49e8:	2ac0a0ef          	jal	ec94 <__mulsi3>
    49ec:	01a50d33          	add	s10,a0,s10
    49f0:	fffd4813          	not	a6,s10
    49f4:	41f85813          	sra	a6,a6,0x1f
    49f8:	05012e03          	lw	t3,80(sp)
    49fc:	010d7cb3          	and	s9,s10,a6
    4a00:	000b0e93          	mv	t4,s6
    4a04:	cecff06f          	j	3ef0 <_vfprintf_r+0x1fb8>
    4a08:	0007c703          	lbu	a4,0(a5)
    4a0c:	00158593          	add	a1,a1,1
    4a10:	fb5ff06f          	j	49c4 <_vfprintf_r+0x2a8c>
    4a14:	03012783          	lw	a5,48(sp)
    4a18:	06600e13          	li	t3,102
    4a1c:	00f306b3          	add	a3,t1,a5
    4a20:	01468d33          	add	s10,a3,s4
    4a24:	d99ff06f          	j	47bc <_vfprintf_r+0x2884>
    4a28:	02c12783          	lw	a5,44(sp)
    4a2c:	0a07c863          	bltz	a5,4adc <_vfprintf_r+0x2ba4>
    4a30:	07714603          	lbu	a2,119(sp)
    4a34:	04700713          	li	a4,71
    4a38:	0000ac17          	auipc	s8,0xa
    4a3c:	764c0c13          	add	s8,s8,1892 # f19c <__fini_array_end+0x310>
    4a40:	01c75463          	bge	a4,t3,4a48 <_vfprintf_r+0x2b10>
    4a44:	b31fd06f          	j	2574 <_vfprintf_r+0x63c>
    4a48:	0000ac17          	auipc	s8,0xa
    4a4c:	750c0c13          	add	s8,s8,1872 # f198 <__fini_array_end+0x30c>
    4a50:	b25fd06f          	j	2574 <_vfprintf_r+0x63c>
    4a54:	07714603          	lbu	a2,119(sp)
    4a58:	01612a23          	sw	s6,20(sp)
    4a5c:	02012223          	sw	zero,36(sp)
    4a60:	02012023          	sw	zero,32(sp)
    4a64:	00030c93          	mv	s9,t1
    4a68:	00030d13          	mv	s10,t1
    4a6c:	07300e13          	li	t3,115
    4a70:	00000313          	li	t1,0
    4a74:	00061463          	bnez	a2,4a7c <_vfprintf_r+0x2b44>
    4a78:	f00fd06f          	j	2178 <_vfprintf_r+0x240>
    4a7c:	b1dfd06f          	j	2598 <_vfprintf_r+0x660>
    4a80:	00040313          	mv	t1,s0
    4a84:	01012903          	lw	s2,16(sp)
    4a88:	000b0413          	mv	s0,s6
    4a8c:	01412e03          	lw	t3,20(sp)
    4a90:	000c0b13          	mv	s6,s8
    4a94:	000a0e93          	mv	t4,s4
    4a98:	000c8c13          	mv	s8,s9
    4a9c:	00030d13          	mv	s10,t1
    4aa0:	87cff06f          	j	3b1c <_vfprintf_r+0x1be4>
    4aa4:	001b0793          	add	a5,s6,1
    4aa8:	000c0993          	mv	s3,s8
    4aac:	02412903          	lw	s2,36(sp)
    4ab0:	04012e83          	lw	t4,64(sp)
    4ab4:	05012e03          	lw	t3,80(sp)
    4ab8:	05412403          	lw	s0,84(sp)
    4abc:	000d0c13          	mv	s8,s10
    4ac0:	00f487b3          	add	a5,s1,a5
    4ac4:	03000693          	li	a3,48
    4ac8:	840b40e3          	bltz	s6,4308 <_vfprintf_r+0x23d0>
    4acc:	00148493          	add	s1,s1,1
    4ad0:	fed48fa3          	sb	a3,-1(s1)
    4ad4:	fe979ce3          	bne	a5,s1,4acc <_vfprintf_r+0x2b94>
    4ad8:	835ff06f          	j	430c <_vfprintf_r+0x23d4>
    4adc:	02d00793          	li	a5,45
    4ae0:	06f10ba3          	sb	a5,119(sp)
    4ae4:	02d00613          	li	a2,45
    4ae8:	f4dff06f          	j	4a34 <_vfprintf_r+0x2afc>
    4aec:	00100693          	li	a3,1
    4af0:	414686b3          	sub	a3,a3,s4
    4af4:	06d12e23          	sw	a3,124(sp)
    4af8:	da4ff06f          	j	409c <_vfprintf_r+0x2164>
    4afc:	01412783          	lw	a5,20(sp)
    4b00:	0007ab03          	lw	s6,0(a5)
    4b04:	00478793          	add	a5,a5,4
    4b08:	000b5463          	bgez	s6,4b10 <_vfprintf_r+0x2bd8>
    4b0c:	fff00b13          	li	s6,-1
    4b10:	00194e03          	lbu	t3,1(s2)
    4b14:	00f12a23          	sw	a5,20(sp)
    4b18:	00068913          	mv	s2,a3
    4b1c:	dccfd06f          	j	20e8 <_vfprintf_r+0x1b0>
    4b20:	00071a63          	bnez	a4,4b34 <_vfprintf_r+0x2bfc>
    4b24:	00100c93          	li	s9,1
    4b28:	06600e13          	li	t3,102
    4b2c:	00100d13          	li	s10,1
    4b30:	879ff06f          	j	43a8 <_vfprintf_r+0x2470>
    4b34:	03012783          	lw	a5,48(sp)
    4b38:	06600e13          	li	t3,102
    4b3c:	00178693          	add	a3,a5,1
    4b40:	00668d33          	add	s10,a3,t1
    4b44:	fffd4813          	not	a6,s10
    4b48:	41f85813          	sra	a6,a6,0x1f
    4b4c:	010d7cb3          	and	s9,s10,a6
    4b50:	859ff06f          	j	43a8 <_vfprintf_r+0x2470>
    4b54:	00200793          	li	a5,2
    4b58:	04f12023          	sw	a5,64(sp)
    4b5c:	b58ff06f          	j	3eb4 <_vfprintf_r+0x1f7c>
    4b60:	00812703          	lw	a4,8(sp)
    4b64:	00c71783          	lh	a5,12(a4)
    4b68:	0407e793          	or	a5,a5,64
    4b6c:	00f71623          	sh	a5,12(a4)
    4b70:	8b5fd06f          	j	2424 <_vfprintf_r+0x4ec>
    4b74:	000a0513          	mv	a0,s4
    4b78:	000d0593          	mv	a1,s10
    4b7c:	00030613          	mv	a2,t1
    4b80:	00038693          	mv	a3,t2
    4b84:	05012023          	sw	a6,64(sp)
    4b88:	03c12223          	sw	t3,36(sp)
    4b8c:	01d12c23          	sw	t4,24(sp)
    4b90:	7a8080ef          	jal	d338 <__eqdf2>
    4b94:	01812e83          	lw	t4,24(sp)
    4b98:	02412e03          	lw	t3,36(sp)
    4b9c:	04012803          	lw	a6,64(sp)
    4ba0:	f6051463          	bnez	a0,4308 <_vfprintf_r+0x23d0>
    4ba4:	001b7693          	and	a3,s6,1
    4ba8:	f6068063          	beqz	a3,4308 <_vfprintf_r+0x23d0>
    4bac:	f14ff06f          	j	42c0 <_vfprintf_r+0x2388>
    4bb0:	00812783          	lw	a5,8(sp)
    4bb4:	01012283          	lw	t0,16(sp)
    4bb8:	00c79783          	lh	a5,12(a5)
    4bbc:	0407e793          	or	a5,a5,64
    4bc0:	db9ff06f          	j	4978 <_vfprintf_r+0x2a40>
    4bc4:	02012223          	sw	zero,36(sp)
    4bc8:	02012023          	sw	zero,32(sp)
    4bcc:	e09ff06f          	j	49d4 <_vfprintf_r+0x2a9c>
    4bd0:	04500d13          	li	s10,69
    4bd4:	cccff06f          	j	40a0 <_vfprintf_r+0x2168>

00004bd8 <__sbprintf>:
    4bd8:	b7010113          	add	sp,sp,-1168
    4bdc:	00c59783          	lh	a5,12(a1)
    4be0:	00e5d703          	lhu	a4,14(a1)
    4be4:	48812423          	sw	s0,1160(sp)
    4be8:	00058413          	mv	s0,a1
    4bec:	000105b7          	lui	a1,0x10
    4bf0:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x58d>
    4bf4:	06442303          	lw	t1,100(s0)
    4bf8:	01c42883          	lw	a7,28(s0)
    4bfc:	02442803          	lw	a6,36(s0)
    4c00:	01071713          	sll	a4,a4,0x10
    4c04:	00b7f7b3          	and	a5,a5,a1
    4c08:	00e7e7b3          	or	a5,a5,a4
    4c0c:	40000593          	li	a1,1024
    4c10:	49212023          	sw	s2,1152(sp)
    4c14:	00f12a23          	sw	a5,20(sp)
    4c18:	00050913          	mv	s2,a0
    4c1c:	07010793          	add	a5,sp,112
    4c20:	06010513          	add	a0,sp,96
    4c24:	48112623          	sw	ra,1164(sp)
    4c28:	48912223          	sw	s1,1156(sp)
    4c2c:	47312e23          	sw	s3,1148(sp)
    4c30:	00060493          	mv	s1,a2
    4c34:	00068993          	mv	s3,a3
    4c38:	06612623          	sw	t1,108(sp)
    4c3c:	03112223          	sw	a7,36(sp)
    4c40:	03012623          	sw	a6,44(sp)
    4c44:	00f12423          	sw	a5,8(sp)
    4c48:	00f12c23          	sw	a5,24(sp)
    4c4c:	00b12823          	sw	a1,16(sp)
    4c50:	00b12e23          	sw	a1,28(sp)
    4c54:	02012023          	sw	zero,32(sp)
    4c58:	b7cfc0ef          	jal	fd4 <__retarget_lock_init_recursive>
    4c5c:	00048613          	mv	a2,s1
    4c60:	00098693          	mv	a3,s3
    4c64:	00810593          	add	a1,sp,8
    4c68:	00090513          	mv	a0,s2
    4c6c:	accfd0ef          	jal	1f38 <_vfprintf_r>
    4c70:	00050493          	mv	s1,a0
    4c74:	04055263          	bgez	a0,4cb8 <__sbprintf+0xe0>
    4c78:	01415783          	lhu	a5,20(sp)
    4c7c:	0407f793          	and	a5,a5,64
    4c80:	00078863          	beqz	a5,4c90 <__sbprintf+0xb8>
    4c84:	00c45783          	lhu	a5,12(s0)
    4c88:	0407e793          	or	a5,a5,64
    4c8c:	00f41623          	sh	a5,12(s0)
    4c90:	06012503          	lw	a0,96(sp)
    4c94:	b44fc0ef          	jal	fd8 <__retarget_lock_close_recursive>
    4c98:	48c12083          	lw	ra,1164(sp)
    4c9c:	48812403          	lw	s0,1160(sp)
    4ca0:	48012903          	lw	s2,1152(sp)
    4ca4:	47c12983          	lw	s3,1148(sp)
    4ca8:	00048513          	mv	a0,s1
    4cac:	48412483          	lw	s1,1156(sp)
    4cb0:	49010113          	add	sp,sp,1168
    4cb4:	00008067          	ret
    4cb8:	00810593          	add	a1,sp,8
    4cbc:	00090513          	mv	a0,s2
    4cc0:	449010ef          	jal	6908 <_fflush_r>
    4cc4:	fa050ae3          	beqz	a0,4c78 <__sbprintf+0xa0>
    4cc8:	fff00493          	li	s1,-1
    4ccc:	fadff06f          	j	4c78 <__sbprintf+0xa0>

00004cd0 <__sprint_r.part.0>:
    4cd0:	0645a783          	lw	a5,100(a1)
    4cd4:	fd010113          	add	sp,sp,-48
    4cd8:	01612823          	sw	s6,16(sp)
    4cdc:	02112623          	sw	ra,44(sp)
    4ce0:	01279713          	sll	a4,a5,0x12
    4ce4:	00060b13          	mv	s6,a2
    4ce8:	0e075863          	bgez	a4,4dd8 <__sprint_r.part.0+0x108>
    4cec:	00862783          	lw	a5,8(a2)
    4cf0:	03212023          	sw	s2,32(sp)
    4cf4:	01312e23          	sw	s3,28(sp)
    4cf8:	01512a23          	sw	s5,20(sp)
    4cfc:	01712623          	sw	s7,12(sp)
    4d00:	00058913          	mv	s2,a1
    4d04:	00062b83          	lw	s7,0(a2)
    4d08:	00050993          	mv	s3,a0
    4d0c:	fff00a93          	li	s5,-1
    4d10:	0a078863          	beqz	a5,4dc0 <__sprint_r.part.0+0xf0>
    4d14:	02812423          	sw	s0,40(sp)
    4d18:	02912223          	sw	s1,36(sp)
    4d1c:	01412c23          	sw	s4,24(sp)
    4d20:	01812423          	sw	s8,8(sp)
    4d24:	004bac03          	lw	s8,4(s7)
    4d28:	000ba403          	lw	s0,0(s7)
    4d2c:	002c5a13          	srl	s4,s8,0x2
    4d30:	060a0663          	beqz	s4,4d9c <__sprint_r.part.0+0xcc>
    4d34:	00000493          	li	s1,0
    4d38:	00c0006f          	j	4d44 <__sprint_r.part.0+0x74>
    4d3c:	00440413          	add	s0,s0,4
    4d40:	049a0c63          	beq	s4,s1,4d98 <__sprint_r.part.0+0xc8>
    4d44:	00042583          	lw	a1,0(s0)
    4d48:	00090613          	mv	a2,s2
    4d4c:	00098513          	mv	a0,s3
    4d50:	10d020ef          	jal	765c <_fputwc_r>
    4d54:	00148493          	add	s1,s1,1
    4d58:	ff5512e3          	bne	a0,s5,4d3c <__sprint_r.part.0+0x6c>
    4d5c:	02812403          	lw	s0,40(sp)
    4d60:	02412483          	lw	s1,36(sp)
    4d64:	02012903          	lw	s2,32(sp)
    4d68:	01c12983          	lw	s3,28(sp)
    4d6c:	01812a03          	lw	s4,24(sp)
    4d70:	01412a83          	lw	s5,20(sp)
    4d74:	00c12b83          	lw	s7,12(sp)
    4d78:	00812c03          	lw	s8,8(sp)
    4d7c:	fff00513          	li	a0,-1
    4d80:	02c12083          	lw	ra,44(sp)
    4d84:	000b2423          	sw	zero,8(s6)
    4d88:	000b2223          	sw	zero,4(s6)
    4d8c:	01012b03          	lw	s6,16(sp)
    4d90:	03010113          	add	sp,sp,48
    4d94:	00008067          	ret
    4d98:	008b2783          	lw	a5,8(s6)
    4d9c:	ffcc7c13          	and	s8,s8,-4
    4da0:	418787b3          	sub	a5,a5,s8
    4da4:	00fb2423          	sw	a5,8(s6)
    4da8:	008b8b93          	add	s7,s7,8
    4dac:	f6079ce3          	bnez	a5,4d24 <__sprint_r.part.0+0x54>
    4db0:	02812403          	lw	s0,40(sp)
    4db4:	02412483          	lw	s1,36(sp)
    4db8:	01812a03          	lw	s4,24(sp)
    4dbc:	00812c03          	lw	s8,8(sp)
    4dc0:	02012903          	lw	s2,32(sp)
    4dc4:	01c12983          	lw	s3,28(sp)
    4dc8:	01412a83          	lw	s5,20(sp)
    4dcc:	00c12b83          	lw	s7,12(sp)
    4dd0:	00000513          	li	a0,0
    4dd4:	fadff06f          	j	4d80 <__sprint_r.part.0+0xb0>
    4dd8:	6b5010ef          	jal	6c8c <__sfvwrite_r>
    4ddc:	02c12083          	lw	ra,44(sp)
    4de0:	000b2423          	sw	zero,8(s6)
    4de4:	000b2223          	sw	zero,4(s6)
    4de8:	01012b03          	lw	s6,16(sp)
    4dec:	03010113          	add	sp,sp,48
    4df0:	00008067          	ret

00004df4 <__sprint_r>:
    4df4:	00862703          	lw	a4,8(a2)
    4df8:	00070463          	beqz	a4,4e00 <__sprint_r+0xc>
    4dfc:	ed5ff06f          	j	4cd0 <__sprint_r.part.0>
    4e00:	00062223          	sw	zero,4(a2)
    4e04:	00000513          	li	a0,0
    4e08:	00008067          	ret

00004e0c <_vfiprintf_r>:
    4e0c:	eb010113          	add	sp,sp,-336
    4e10:	14812423          	sw	s0,328(sp)
    4e14:	13312e23          	sw	s3,316(sp)
    4e18:	13812423          	sw	s8,296(sp)
    4e1c:	00050413          	mv	s0,a0
    4e20:	00058993          	mv	s3,a1
    4e24:	00060c13          	mv	s8,a2
    4e28:	00000593          	li	a1,0
    4e2c:	00800613          	li	a2,8
    4e30:	05010513          	add	a0,sp,80
    4e34:	13512a23          	sw	s5,308(sp)
    4e38:	14112623          	sw	ra,332(sp)
    4e3c:	00068a93          	mv	s5,a3
    4e40:	9a4fc0ef          	jal	fe4 <memset>
    4e44:	00040863          	beqz	s0,4e54 <_vfiprintf_r+0x48>
    4e48:	03442783          	lw	a5,52(s0)
    4e4c:	00079463          	bnez	a5,4e54 <_vfiprintf_r+0x48>
    4e50:	49c0106f          	j	62ec <_vfiprintf_r+0x14e0>
    4e54:	0649a703          	lw	a4,100(s3)
    4e58:	00c99783          	lh	a5,12(s3)
    4e5c:	00177713          	and	a4,a4,1
    4e60:	00071863          	bnez	a4,4e70 <_vfiprintf_r+0x64>
    4e64:	2007f713          	and	a4,a5,512
    4e68:	00071463          	bnez	a4,4e70 <_vfiprintf_r+0x64>
    4e6c:	0b80106f          	j	5f24 <_vfiprintf_r+0x1118>
    4e70:	01279713          	sll	a4,a5,0x12
    4e74:	02074663          	bltz	a4,4ea0 <_vfiprintf_r+0x94>
    4e78:	0649a703          	lw	a4,100(s3)
    4e7c:	00002637          	lui	a2,0x2
    4e80:	ffffe6b7          	lui	a3,0xffffe
    4e84:	00c7e7b3          	or	a5,a5,a2
    4e88:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4e8c:	01079793          	sll	a5,a5,0x10
    4e90:	4107d793          	sra	a5,a5,0x10
    4e94:	00d77733          	and	a4,a4,a3
    4e98:	00f99623          	sh	a5,12(s3)
    4e9c:	06e9a223          	sw	a4,100(s3)
    4ea0:	0087f713          	and	a4,a5,8
    4ea4:	2e070463          	beqz	a4,518c <_vfiprintf_r+0x380>
    4ea8:	0109a703          	lw	a4,16(s3)
    4eac:	2e070063          	beqz	a4,518c <_vfiprintf_r+0x380>
    4eb0:	01a7f713          	and	a4,a5,26
    4eb4:	00a00693          	li	a3,10
    4eb8:	2ed70c63          	beq	a4,a3,51b0 <_vfiprintf_r+0x3a4>
    4ebc:	13412c23          	sw	s4,312(sp)
    4ec0:	06c10a13          	add	s4,sp,108
    4ec4:	14912223          	sw	s1,324(sp)
    4ec8:	15212023          	sw	s2,320(sp)
    4ecc:	13612823          	sw	s6,304(sp)
    4ed0:	13712623          	sw	s7,300(sp)
    4ed4:	13912223          	sw	s9,292(sp)
    4ed8:	13a12023          	sw	s10,288(sp)
    4edc:	000c0c93          	mv	s9,s8
    4ee0:	11b12e23          	sw	s11,284(sp)
    4ee4:	07412023          	sw	s4,96(sp)
    4ee8:	06012423          	sw	zero,104(sp)
    4eec:	06012223          	sw	zero,100(sp)
    4ef0:	00012a23          	sw	zero,20(sp)
    4ef4:	02012623          	sw	zero,44(sp)
    4ef8:	02012823          	sw	zero,48(sp)
    4efc:	02012a23          	sw	zero,52(sp)
    4f00:	00012623          	sw	zero,12(sp)
    4f04:	7fffb497          	auipc	s1,0x7fffb
    4f08:	63048493          	add	s1,s1,1584 # 80000534 <__global_locale>
    4f0c:	02500913          	li	s2,37
    4f10:	0000ab97          	auipc	s7,0xa
    4f14:	798b8b93          	add	s7,s7,1944 # f6a8 <blanks.1+0x10>
    4f18:	0000bb17          	auipc	s6,0xb
    4f1c:	8fcb0b13          	add	s6,s6,-1796 # f814 <zeroes.0>
    4f20:	000a0c13          	mv	s8,s4
    4f24:	000c8d93          	mv	s11,s9
    4f28:	0e44ad03          	lw	s10,228(s1)
    4f2c:	16d020ef          	jal	7898 <__locale_mb_cur_max>
    4f30:	00050693          	mv	a3,a0
    4f34:	05010713          	add	a4,sp,80
    4f38:	000d8613          	mv	a2,s11
    4f3c:	04810593          	add	a1,sp,72
    4f40:	00040513          	mv	a0,s0
    4f44:	000d00e7          	jalr	s10
    4f48:	2e050e63          	beqz	a0,5244 <_vfiprintf_r+0x438>
    4f4c:	2c054e63          	bltz	a0,5228 <_vfiprintf_r+0x41c>
    4f50:	04812783          	lw	a5,72(sp)
    4f54:	01278663          	beq	a5,s2,4f60 <_vfiprintf_r+0x154>
    4f58:	00ad8db3          	add	s11,s11,a0
    4f5c:	fcdff06f          	j	4f28 <_vfiprintf_r+0x11c>
    4f60:	00050d13          	mv	s10,a0
    4f64:	419d87b3          	sub	a5,s11,s9
    4f68:	2f9d9463          	bne	s11,s9,5250 <_vfiprintf_r+0x444>
    4f6c:	00000e13          	li	t3,0
    4f70:	001dc683          	lbu	a3,1(s11)
    4f74:	001d8c93          	add	s9,s11,1
    4f78:	040101a3          	sb	zero,67(sp)
    4f7c:	fff00713          	li	a4,-1
    4f80:	00000893          	li	a7,0
    4f84:	05a00d13          	li	s10,90
    4f88:	000e0d93          	mv	s11,t3
    4f8c:	001c8c93          	add	s9,s9,1
    4f90:	fe068793          	add	a5,a3,-32
    4f94:	04fd6663          	bltu	s10,a5,4fe0 <_vfiprintf_r+0x1d4>
    4f98:	00279793          	sll	a5,a5,0x2
    4f9c:	017787b3          	add	a5,a5,s7
    4fa0:	0007a783          	lw	a5,0(a5)
    4fa4:	017787b3          	add	a5,a5,s7
    4fa8:	00078067          	jr	a5
    4fac:	00000893          	li	a7,0
    4fb0:	fd068793          	add	a5,a3,-48
    4fb4:	00900593          	li	a1,9
    4fb8:	000cc683          	lbu	a3,0(s9)
    4fbc:	00289613          	sll	a2,a7,0x2
    4fc0:	011608b3          	add	a7,a2,a7
    4fc4:	00189893          	sll	a7,a7,0x1
    4fc8:	011788b3          	add	a7,a5,a7
    4fcc:	fd068793          	add	a5,a3,-48
    4fd0:	001c8c93          	add	s9,s9,1
    4fd4:	fef5f2e3          	bgeu	a1,a5,4fb8 <_vfiprintf_r+0x1ac>
    4fd8:	fe068793          	add	a5,a3,-32
    4fdc:	fafd7ee3          	bgeu	s10,a5,4f98 <_vfiprintf_r+0x18c>
    4fe0:	000d8e13          	mv	t3,s11
    4fe4:	2c068663          	beqz	a3,52b0 <_vfiprintf_r+0x4a4>
    4fe8:	0ad10623          	sb	a3,172(sp)
    4fec:	040101a3          	sb	zero,67(sp)
    4ff0:	00100e93          	li	t4,1
    4ff4:	00100d13          	li	s10,1
    4ff8:	0ac10813          	add	a6,sp,172
    4ffc:	00012823          	sw	zero,16(sp)
    5000:	00000713          	li	a4,0
    5004:	00000f93          	li	t6,0
    5008:	06412603          	lw	a2,100(sp)
    500c:	084e7293          	and	t0,t3,132
    5010:	06812783          	lw	a5,104(sp)
    5014:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0xc9>
    5018:	00058f13          	mv	t5,a1
    501c:	00029663          	bnez	t0,5028 <_vfiprintf_r+0x21c>
    5020:	41d88db3          	sub	s11,a7,t4
    5024:	47b046e3          	bgtz	s11,5c90 <_vfiprintf_r+0xe84>
    5028:	04314583          	lbu	a1,67(sp)
    502c:	02058a63          	beqz	a1,5060 <_vfiprintf_r+0x254>
    5030:	04310613          	add	a2,sp,67
    5034:	00178793          	add	a5,a5,1
    5038:	00100693          	li	a3,1
    503c:	00cc2023          	sw	a2,0(s8)
    5040:	00dc2223          	sw	a3,4(s8)
    5044:	06f12423          	sw	a5,104(sp)
    5048:	07e12223          	sw	t5,100(sp)
    504c:	00700613          	li	a2,7
    5050:	35e64ce3          	blt	a2,t5,5ba8 <_vfiprintf_r+0xd9c>
    5054:	000f0613          	mv	a2,t5
    5058:	008c0c13          	add	s8,s8,8
    505c:	001f0f13          	add	t5,t5,1
    5060:	080f8063          	beqz	t6,50e0 <_vfiprintf_r+0x2d4>
    5064:	00200613          	li	a2,2
    5068:	00278793          	add	a5,a5,2
    506c:	04410693          	add	a3,sp,68
    5070:	00cc2223          	sw	a2,4(s8)
    5074:	00dc2023          	sw	a3,0(s8)
    5078:	06f12423          	sw	a5,104(sp)
    507c:	07e12223          	sw	t5,100(sp)
    5080:	00700613          	li	a2,7
    5084:	3be652e3          	bge	a2,t5,5c28 <_vfiprintf_r+0xe1c>
    5088:	60078ae3          	beqz	a5,5e9c <_vfiprintf_r+0x1090>
    508c:	06010613          	add	a2,sp,96
    5090:	00098593          	mv	a1,s3
    5094:	00040513          	mv	a0,s0
    5098:	03d12c23          	sw	t4,56(sp)
    509c:	02e12423          	sw	a4,40(sp)
    50a0:	03112223          	sw	a7,36(sp)
    50a4:	03012023          	sw	a6,32(sp)
    50a8:	00512e23          	sw	t0,28(sp)
    50ac:	01c12c23          	sw	t3,24(sp)
    50b0:	c21ff0ef          	jal	4cd0 <__sprint_r.part.0>
    50b4:	22051463          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    50b8:	06412603          	lw	a2,100(sp)
    50bc:	06812783          	lw	a5,104(sp)
    50c0:	03812e83          	lw	t4,56(sp)
    50c4:	02812703          	lw	a4,40(sp)
    50c8:	02412883          	lw	a7,36(sp)
    50cc:	02012803          	lw	a6,32(sp)
    50d0:	01c12283          	lw	t0,28(sp)
    50d4:	01812e03          	lw	t3,24(sp)
    50d8:	000a0c13          	mv	s8,s4
    50dc:	00160f13          	add	t5,a2,1
    50e0:	08000593          	li	a1,128
    50e4:	06b286e3          	beq	t0,a1,5950 <_vfiprintf_r+0xb44>
    50e8:	41a70733          	sub	a4,a4,s10
    50ec:	1ae04ae3          	bgtz	a4,5aa0 <_vfiprintf_r+0xc94>
    50f0:	00fd07b3          	add	a5,s10,a5
    50f4:	010c2023          	sw	a6,0(s8)
    50f8:	01ac2223          	sw	s10,4(s8)
    50fc:	06f12423          	sw	a5,104(sp)
    5100:	07e12223          	sw	t5,100(sp)
    5104:	00700713          	li	a4,7
    5108:	03e758e3          	bge	a4,t5,5938 <_vfiprintf_r+0xb2c>
    510c:	24078063          	beqz	a5,534c <_vfiprintf_r+0x540>
    5110:	06010613          	add	a2,sp,96
    5114:	00098593          	mv	a1,s3
    5118:	00040513          	mv	a0,s0
    511c:	03d12023          	sw	t4,32(sp)
    5120:	01112e23          	sw	a7,28(sp)
    5124:	01c12c23          	sw	t3,24(sp)
    5128:	ba9ff0ef          	jal	4cd0 <__sprint_r.part.0>
    512c:	1a051863          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    5130:	06812783          	lw	a5,104(sp)
    5134:	02012e83          	lw	t4,32(sp)
    5138:	01c12883          	lw	a7,28(sp)
    513c:	01812e03          	lw	t3,24(sp)
    5140:	000a0c13          	mv	s8,s4
    5144:	004e7e13          	and	t3,t3,4
    5148:	000e0663          	beqz	t3,5154 <_vfiprintf_r+0x348>
    514c:	41d88db3          	sub	s11,a7,t4
    5150:	21b04a63          	bgtz	s11,5364 <_vfiprintf_r+0x558>
    5154:	01d8d463          	bge	a7,t4,515c <_vfiprintf_r+0x350>
    5158:	000e8893          	mv	a7,t4
    515c:	00c12703          	lw	a4,12(sp)
    5160:	01170733          	add	a4,a4,a7
    5164:	00e12623          	sw	a4,12(sp)
    5168:	16079063          	bnez	a5,52c8 <_vfiprintf_r+0x4bc>
    516c:	01012783          	lw	a5,16(sp)
    5170:	06012223          	sw	zero,100(sp)
    5174:	00078863          	beqz	a5,5184 <_vfiprintf_r+0x378>
    5178:	00078593          	mv	a1,a5
    517c:	00040513          	mv	a0,s0
    5180:	ab4fc0ef          	jal	1434 <_free_r>
    5184:	000a0c13          	mv	s8,s4
    5188:	d9dff06f          	j	4f24 <_vfiprintf_r+0x118>
    518c:	00098593          	mv	a1,s3
    5190:	00040513          	mv	a0,s0
    5194:	224020ef          	jal	73b8 <__swsetup_r>
    5198:	00050463          	beqz	a0,51a0 <_vfiprintf_r+0x394>
    519c:	3840106f          	j	6520 <_vfiprintf_r+0x1714>
    51a0:	00c99783          	lh	a5,12(s3)
    51a4:	00a00693          	li	a3,10
    51a8:	01a7f713          	and	a4,a5,26
    51ac:	d0d718e3          	bne	a4,a3,4ebc <_vfiprintf_r+0xb0>
    51b0:	00e99703          	lh	a4,14(s3)
    51b4:	d00744e3          	bltz	a4,4ebc <_vfiprintf_r+0xb0>
    51b8:	0649a703          	lw	a4,100(s3)
    51bc:	00177713          	and	a4,a4,1
    51c0:	00071863          	bnez	a4,51d0 <_vfiprintf_r+0x3c4>
    51c4:	2007f793          	and	a5,a5,512
    51c8:	00079463          	bnez	a5,51d0 <_vfiprintf_r+0x3c4>
    51cc:	2ac0106f          	j	6478 <_vfiprintf_r+0x166c>
    51d0:	000a8693          	mv	a3,s5
    51d4:	000c0613          	mv	a2,s8
    51d8:	00098593          	mv	a1,s3
    51dc:	00040513          	mv	a0,s0
    51e0:	3e4010ef          	jal	65c4 <__sbprintf>
    51e4:	14c12083          	lw	ra,332(sp)
    51e8:	14812403          	lw	s0,328(sp)
    51ec:	00a12623          	sw	a0,12(sp)
    51f0:	00c12503          	lw	a0,12(sp)
    51f4:	13c12983          	lw	s3,316(sp)
    51f8:	13412a83          	lw	s5,308(sp)
    51fc:	12812c03          	lw	s8,296(sp)
    5200:	15010113          	add	sp,sp,336
    5204:	00008067          	ret
    5208:	000aa883          	lw	a7,0(s5)
    520c:	004a8a93          	add	s5,s5,4
    5210:	3608cc63          	bltz	a7,5588 <_vfiprintf_r+0x77c>
    5214:	000cc683          	lbu	a3,0(s9)
    5218:	d75ff06f          	j	4f8c <_vfiprintf_r+0x180>
    521c:	000cc683          	lbu	a3,0(s9)
    5220:	020ded93          	or	s11,s11,32
    5224:	d69ff06f          	j	4f8c <_vfiprintf_r+0x180>
    5228:	00800613          	li	a2,8
    522c:	00000593          	li	a1,0
    5230:	05010513          	add	a0,sp,80
    5234:	db1fb0ef          	jal	fe4 <memset>
    5238:	00100513          	li	a0,1
    523c:	00ad8db3          	add	s11,s11,a0
    5240:	ce9ff06f          	j	4f28 <_vfiprintf_r+0x11c>
    5244:	00050d13          	mv	s10,a0
    5248:	419d87b3          	sub	a5,s11,s9
    524c:	079d8263          	beq	s11,s9,52b0 <_vfiprintf_r+0x4a4>
    5250:	06812683          	lw	a3,104(sp)
    5254:	06412703          	lw	a4,100(sp)
    5258:	019c2023          	sw	s9,0(s8)
    525c:	00d786b3          	add	a3,a5,a3
    5260:	00170713          	add	a4,a4,1
    5264:	00fc2223          	sw	a5,4(s8)
    5268:	06d12423          	sw	a3,104(sp)
    526c:	06e12223          	sw	a4,100(sp)
    5270:	00700613          	li	a2,7
    5274:	008c0c13          	add	s8,s8,8
    5278:	02e65463          	bge	a2,a4,52a0 <_vfiprintf_r+0x494>
    527c:	38068ce3          	beqz	a3,5e14 <_vfiprintf_r+0x1008>
    5280:	06010613          	add	a2,sp,96
    5284:	00098593          	mv	a1,s3
    5288:	00040513          	mv	a0,s0
    528c:	00f12823          	sw	a5,16(sp)
    5290:	a41ff0ef          	jal	4cd0 <__sprint_r.part.0>
    5294:	01012783          	lw	a5,16(sp)
    5298:	04051c63          	bnez	a0,52f0 <_vfiprintf_r+0x4e4>
    529c:	000a0c13          	mv	s8,s4
    52a0:	00c12703          	lw	a4,12(sp)
    52a4:	00f707b3          	add	a5,a4,a5
    52a8:	00f12623          	sw	a5,12(sp)
    52ac:	cc0d10e3          	bnez	s10,4f6c <_vfiprintf_r+0x160>
    52b0:	06812783          	lw	a5,104(sp)
    52b4:	00078463          	beqz	a5,52bc <_vfiprintf_r+0x4b0>
    52b8:	22c0106f          	j	64e4 <_vfiprintf_r+0x16d8>
    52bc:	00c99783          	lh	a5,12(s3)
    52c0:	06012223          	sw	zero,100(sp)
    52c4:	0300006f          	j	52f4 <_vfiprintf_r+0x4e8>
    52c8:	06010613          	add	a2,sp,96
    52cc:	00098593          	mv	a1,s3
    52d0:	00040513          	mv	a0,s0
    52d4:	9fdff0ef          	jal	4cd0 <__sprint_r.part.0>
    52d8:	e8050ae3          	beqz	a0,516c <_vfiprintf_r+0x360>
    52dc:	01012783          	lw	a5,16(sp)
    52e0:	00078863          	beqz	a5,52f0 <_vfiprintf_r+0x4e4>
    52e4:	01012583          	lw	a1,16(sp)
    52e8:	00040513          	mv	a0,s0
    52ec:	948fc0ef          	jal	1434 <_free_r>
    52f0:	00c99783          	lh	a5,12(s3)
    52f4:	0649a703          	lw	a4,100(s3)
    52f8:	00177713          	and	a4,a4,1
    52fc:	16070a63          	beqz	a4,5470 <_vfiprintf_r+0x664>
    5300:	0407f793          	and	a5,a5,64
    5304:	14412483          	lw	s1,324(sp)
    5308:	14012903          	lw	s2,320(sp)
    530c:	13812a03          	lw	s4,312(sp)
    5310:	13012b03          	lw	s6,304(sp)
    5314:	12c12b83          	lw	s7,300(sp)
    5318:	12412c83          	lw	s9,292(sp)
    531c:	12012d03          	lw	s10,288(sp)
    5320:	11c12d83          	lw	s11,284(sp)
    5324:	00078463          	beqz	a5,532c <_vfiprintf_r+0x520>
    5328:	2180106f          	j	6540 <_vfiprintf_r+0x1734>
    532c:	14c12083          	lw	ra,332(sp)
    5330:	14812403          	lw	s0,328(sp)
    5334:	00c12503          	lw	a0,12(sp)
    5338:	13c12983          	lw	s3,316(sp)
    533c:	13412a83          	lw	s5,308(sp)
    5340:	12812c03          	lw	s8,296(sp)
    5344:	15010113          	add	sp,sp,336
    5348:	00008067          	ret
    534c:	06012223          	sw	zero,100(sp)
    5350:	004e7e13          	and	t3,t3,4
    5354:	240e0ee3          	beqz	t3,5db0 <_vfiprintf_r+0xfa4>
    5358:	41d88db3          	sub	s11,a7,t4
    535c:	25b05ae3          	blez	s11,5db0 <_vfiprintf_r+0xfa4>
    5360:	000a0c13          	mv	s8,s4
    5364:	01000713          	li	a4,16
    5368:	06412683          	lw	a3,100(sp)
    536c:	01b74463          	blt	a4,s11,5374 <_vfiprintf_r+0x568>
    5370:	1900106f          	j	6500 <_vfiprintf_r+0x16f4>
    5374:	000a8713          	mv	a4,s5
    5378:	0000a317          	auipc	t1,0xa
    537c:	4ac30313          	add	t1,t1,1196 # f824 <blanks.1>
    5380:	000c0593          	mv	a1,s8
    5384:	000d8a93          	mv	s5,s11
    5388:	01000813          	li	a6,16
    538c:	00700d13          	li	s10,7
    5390:	01112c23          	sw	a7,24(sp)
    5394:	01d12e23          	sw	t4,28(sp)
    5398:	00030c13          	mv	s8,t1
    539c:	00070d93          	mv	s11,a4
    53a0:	0180006f          	j	53b8 <_vfiprintf_r+0x5ac>
    53a4:	00268613          	add	a2,a3,2
    53a8:	00858593          	add	a1,a1,8
    53ac:	00070693          	mv	a3,a4
    53b0:	ff0a8a93          	add	s5,s5,-16
    53b4:	05585a63          	bge	a6,s5,5408 <_vfiprintf_r+0x5fc>
    53b8:	01078793          	add	a5,a5,16
    53bc:	00168713          	add	a4,a3,1
    53c0:	0185a023          	sw	s8,0(a1)
    53c4:	0105a223          	sw	a6,4(a1)
    53c8:	06f12423          	sw	a5,104(sp)
    53cc:	06e12223          	sw	a4,100(sp)
    53d0:	fced5ae3          	bge	s10,a4,53a4 <_vfiprintf_r+0x598>
    53d4:	56078663          	beqz	a5,5940 <_vfiprintf_r+0xb34>
    53d8:	06010613          	add	a2,sp,96
    53dc:	00098593          	mv	a1,s3
    53e0:	00040513          	mv	a0,s0
    53e4:	8edff0ef          	jal	4cd0 <__sprint_r.part.0>
    53e8:	ee051ae3          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    53ec:	06412683          	lw	a3,100(sp)
    53f0:	01000813          	li	a6,16
    53f4:	ff0a8a93          	add	s5,s5,-16
    53f8:	06812783          	lw	a5,104(sp)
    53fc:	000a0593          	mv	a1,s4
    5400:	00168613          	add	a2,a3,1
    5404:	fb584ae3          	blt	a6,s5,53b8 <_vfiprintf_r+0x5ac>
    5408:	01812883          	lw	a7,24(sp)
    540c:	01c12e83          	lw	t4,28(sp)
    5410:	000d8713          	mv	a4,s11
    5414:	000c0313          	mv	t1,s8
    5418:	000a8d93          	mv	s11,s5
    541c:	00058c13          	mv	s8,a1
    5420:	00070a93          	mv	s5,a4
    5424:	01b787b3          	add	a5,a5,s11
    5428:	006c2023          	sw	t1,0(s8)
    542c:	01bc2223          	sw	s11,4(s8)
    5430:	06f12423          	sw	a5,104(sp)
    5434:	06c12223          	sw	a2,100(sp)
    5438:	00700713          	li	a4,7
    543c:	d0c75ce3          	bge	a4,a2,5154 <_vfiprintf_r+0x348>
    5440:	160788e3          	beqz	a5,5db0 <_vfiprintf_r+0xfa4>
    5444:	06010613          	add	a2,sp,96
    5448:	00098593          	mv	a1,s3
    544c:	00040513          	mv	a0,s0
    5450:	01d12e23          	sw	t4,28(sp)
    5454:	01112c23          	sw	a7,24(sp)
    5458:	879ff0ef          	jal	4cd0 <__sprint_r.part.0>
    545c:	e80510e3          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    5460:	06812783          	lw	a5,104(sp)
    5464:	01c12e83          	lw	t4,28(sp)
    5468:	01812883          	lw	a7,24(sp)
    546c:	ce9ff06f          	j	5154 <_vfiprintf_r+0x348>
    5470:	2007f713          	and	a4,a5,512
    5474:	e80716e3          	bnez	a4,5300 <_vfiprintf_r+0x4f4>
    5478:	0589a503          	lw	a0,88(s3)
    547c:	b65fb0ef          	jal	fe0 <__retarget_lock_release_recursive>
    5480:	00c99783          	lh	a5,12(s3)
    5484:	e7dff06f          	j	5300 <_vfiprintf_r+0x4f4>
    5488:	000aa803          	lw	a6,0(s5)
    548c:	040101a3          	sb	zero,67(sp)
    5490:	000d8e13          	mv	t3,s11
    5494:	004a8a93          	add	s5,s5,4
    5498:	68080ae3          	beqz	a6,632c <_vfiprintf_r+0x1520>
    549c:	05300793          	li	a5,83
    54a0:	3cf68ce3          	beq	a3,a5,6078 <_vfiprintf_r+0x126c>
    54a4:	010df793          	and	a5,s11,16
    54a8:	3c0798e3          	bnez	a5,6078 <_vfiprintf_r+0x126c>
    54ac:	00075463          	bgez	a4,54b4 <_vfiprintf_r+0x6a8>
    54b0:	7fd0006f          	j	64ac <_vfiprintf_r+0x16a0>
    54b4:	00070613          	mv	a2,a4
    54b8:	00080513          	mv	a0,a6
    54bc:	00000593          	li	a1,0
    54c0:	03112223          	sw	a7,36(sp)
    54c4:	00e12e23          	sw	a4,28(sp)
    54c8:	01012c23          	sw	a6,24(sp)
    54cc:	03b12023          	sw	s11,32(sp)
    54d0:	258020ef          	jal	7728 <memchr>
    54d4:	00a12823          	sw	a0,16(sp)
    54d8:	01812803          	lw	a6,24(sp)
    54dc:	01c12703          	lw	a4,28(sp)
    54e0:	02012e03          	lw	t3,32(sp)
    54e4:	02412883          	lw	a7,36(sp)
    54e8:	00051463          	bnez	a0,54f0 <_vfiprintf_r+0x6e4>
    54ec:	7990006f          	j	6484 <_vfiprintf_r+0x1678>
    54f0:	41050d33          	sub	s10,a0,a6
    54f4:	fffd4e93          	not	t4,s10
    54f8:	41fede93          	sra	t4,t4,0x1f
    54fc:	01dd7eb3          	and	t4,s10,t4
    5500:	00012823          	sw	zero,16(sp)
    5504:	6dd0006f          	j	63e0 <_vfiprintf_r+0x15d4>
    5508:	04300793          	li	a5,67
    550c:	000d8e13          	mv	t3,s11
    5510:	004a8d93          	add	s11,s5,4
    5514:	00f68663          	beq	a3,a5,5520 <_vfiprintf_r+0x714>
    5518:	010e7793          	and	a5,t3,16
    551c:	280788e3          	beqz	a5,5fac <_vfiprintf_r+0x11a0>
    5520:	00800613          	li	a2,8
    5524:	00000593          	li	a1,0
    5528:	05810513          	add	a0,sp,88
    552c:	01112e23          	sw	a7,28(sp)
    5530:	01c12c23          	sw	t3,24(sp)
    5534:	ab1fb0ef          	jal	fe4 <memset>
    5538:	000aa603          	lw	a2,0(s5)
    553c:	0ac10593          	add	a1,sp,172
    5540:	05810693          	add	a3,sp,88
    5544:	00040513          	mv	a0,s0
    5548:	00b12823          	sw	a1,16(sp)
    554c:	408050ef          	jal	a954 <_wcrtomb_r>
    5550:	fff00793          	li	a5,-1
    5554:	01012583          	lw	a1,16(sp)
    5558:	01812e03          	lw	t3,24(sp)
    555c:	01c12883          	lw	a7,28(sp)
    5560:	00050d13          	mv	s10,a0
    5564:	00f51463          	bne	a0,a5,556c <_vfiprintf_r+0x760>
    5568:	0200106f          	j	6588 <_vfiprintf_r+0x177c>
    556c:	fff54e93          	not	t4,a0
    5570:	41fede93          	sra	t4,t4,0x1f
    5574:	01d57eb3          	and	t4,a0,t4
    5578:	040101a3          	sb	zero,67(sp)
    557c:	000d8a93          	mv	s5,s11
    5580:	00058813          	mv	a6,a1
    5584:	a79ff06f          	j	4ffc <_vfiprintf_r+0x1f0>
    5588:	411008b3          	neg	a7,a7
    558c:	000cc683          	lbu	a3,0(s9)
    5590:	004ded93          	or	s11,s11,4
    5594:	9f9ff06f          	j	4f8c <_vfiprintf_r+0x180>
    5598:	010dee13          	or	t3,s11,16
    559c:	020e7793          	and	a5,t3,32
    55a0:	0c0788e3          	beqz	a5,5e70 <_vfiprintf_r+0x1064>
    55a4:	007a8a93          	add	s5,s5,7
    55a8:	ff8afa93          	and	s5,s5,-8
    55ac:	004aa683          	lw	a3,4(s5)
    55b0:	000aad83          	lw	s11,0(s5)
    55b4:	008a8a93          	add	s5,s5,8
    55b8:	00068d13          	mv	s10,a3
    55bc:	3006c263          	bltz	a3,58c0 <_vfiprintf_r+0xab4>
    55c0:	32074063          	bltz	a4,58e0 <_vfiprintf_r+0xad4>
    55c4:	01ade6b3          	or	a3,s11,s10
    55c8:	f7fe7e13          	and	t3,t3,-129
    55cc:	30069a63          	bnez	a3,58e0 <_vfiprintf_r+0xad4>
    55d0:	68071ae3          	bnez	a4,6464 <_vfiprintf_r+0x1658>
    55d4:	04314783          	lbu	a5,67(sp)
    55d8:	00012823          	sw	zero,16(sp)
    55dc:	00000e93          	li	t4,0
    55e0:	00000d13          	li	s10,0
    55e4:	11010813          	add	a6,sp,272
    55e8:	00078463          	beqz	a5,55f0 <_vfiprintf_r+0x7e4>
    55ec:	001e8e93          	add	t4,t4,1
    55f0:	002e7f93          	and	t6,t3,2
    55f4:	a00f8ae3          	beqz	t6,5008 <_vfiprintf_r+0x1fc>
    55f8:	002e8e93          	add	t4,t4,2
    55fc:	00200f93          	li	t6,2
    5600:	a09ff06f          	j	5008 <_vfiprintf_r+0x1fc>
    5604:	000cc683          	lbu	a3,0(s9)
    5608:	06800793          	li	a5,104
    560c:	4ef686e3          	beq	a3,a5,62f8 <_vfiprintf_r+0x14ec>
    5610:	040ded93          	or	s11,s11,64
    5614:	979ff06f          	j	4f8c <_vfiprintf_r+0x180>
    5618:	010de613          	or	a2,s11,16
    561c:	02067793          	and	a5,a2,32
    5620:	000780e3          	beqz	a5,5e20 <_vfiprintf_r+0x1014>
    5624:	007a8a93          	add	s5,s5,7
    5628:	ff8afa93          	and	s5,s5,-8
    562c:	000aad83          	lw	s11,0(s5)
    5630:	004aad03          	lw	s10,4(s5)
    5634:	008a8a93          	add	s5,s5,8
    5638:	040101a3          	sb	zero,67(sp)
    563c:	00060e13          	mv	t3,a2
    5640:	2a074063          	bltz	a4,58e0 <_vfiprintf_r+0xad4>
    5644:	01ade6b3          	or	a3,s11,s10
    5648:	f7f67e13          	and	t3,a2,-129
    564c:	28069a63          	bnez	a3,58e0 <_vfiprintf_r+0xad4>
    5650:	00100793          	li	a5,1
    5654:	06071e63          	bnez	a4,56d0 <_vfiprintf_r+0x8c4>
    5658:	f6079ee3          	bnez	a5,55d4 <_vfiprintf_r+0x7c8>
    565c:	00167d13          	and	s10,a2,1
    5660:	0a0d0ce3          	beqz	s10,5f18 <_vfiprintf_r+0x110c>
    5664:	03000793          	li	a5,48
    5668:	10f107a3          	sb	a5,271(sp)
    566c:	000d0e93          	mv	t4,s10
    5670:	10f10813          	add	a6,sp,271
    5674:	2980006f          	j	590c <_vfiprintf_r+0xb00>
    5678:	02b00793          	li	a5,43
    567c:	000cc683          	lbu	a3,0(s9)
    5680:	04f101a3          	sb	a5,67(sp)
    5684:	909ff06f          	j	4f8c <_vfiprintf_r+0x180>
    5688:	010de693          	or	a3,s11,16
    568c:	0206f793          	and	a5,a3,32
    5690:	7a078c63          	beqz	a5,5e48 <_vfiprintf_r+0x103c>
    5694:	007a8a93          	add	s5,s5,7
    5698:	ff8afa93          	and	s5,s5,-8
    569c:	000aa783          	lw	a5,0(s5)
    56a0:	004aa583          	lw	a1,4(s5)
    56a4:	008a8a93          	add	s5,s5,8
    56a8:	040101a3          	sb	zero,67(sp)
    56ac:	bff6fe13          	and	t3,a3,-1025
    56b0:	02074c63          	bltz	a4,56e8 <_vfiprintf_r+0x8dc>
    56b4:	00b7e633          	or	a2,a5,a1
    56b8:	b7f6f693          	and	a3,a3,-1153
    56bc:	420610e3          	bnez	a2,62dc <_vfiprintf_r+0x14d0>
    56c0:	000e0613          	mv	a2,t3
    56c4:	00000793          	li	a5,0
    56c8:	00068e13          	mv	t3,a3
    56cc:	f80706e3          	beqz	a4,5658 <_vfiprintf_r+0x84c>
    56d0:	00100693          	li	a3,1
    56d4:	58d788e3          	beq	a5,a3,6464 <_vfiprintf_r+0x1658>
    56d8:	00200693          	li	a3,2
    56dc:	46d786e3          	beq	a5,a3,6348 <_vfiprintf_r+0x153c>
    56e0:	00000793          	li	a5,0
    56e4:	00000593          	li	a1,0
    56e8:	11010813          	add	a6,sp,272
    56ec:	01d59613          	sll	a2,a1,0x1d
    56f0:	0077f693          	and	a3,a5,7
    56f4:	0037d793          	srl	a5,a5,0x3
    56f8:	03068693          	add	a3,a3,48
    56fc:	00f667b3          	or	a5,a2,a5
    5700:	0035d593          	srl	a1,a1,0x3
    5704:	fed80fa3          	sb	a3,-1(a6)
    5708:	00b7e633          	or	a2,a5,a1
    570c:	00080513          	mv	a0,a6
    5710:	fff80813          	add	a6,a6,-1
    5714:	fc061ce3          	bnez	a2,56ec <_vfiprintf_r+0x8e0>
    5718:	001e7793          	and	a5,t3,1
    571c:	54078e63          	beqz	a5,5c78 <_vfiprintf_r+0xe6c>
    5720:	03000793          	li	a5,48
    5724:	54f68a63          	beq	a3,a5,5c78 <_vfiprintf_r+0xe6c>
    5728:	ffe50513          	add	a0,a0,-2
    572c:	fef80fa3          	sb	a5,-1(a6)
    5730:	11010793          	add	a5,sp,272
    5734:	40a78d33          	sub	s10,a5,a0
    5738:	00070e93          	mv	t4,a4
    573c:	09a744e3          	blt	a4,s10,5fc4 <_vfiprintf_r+0x11b8>
    5740:	00050813          	mv	a6,a0
    5744:	1c80006f          	j	590c <_vfiprintf_r+0xb00>
    5748:	000086b7          	lui	a3,0x8
    574c:	83068693          	add	a3,a3,-2000 # 7830 <strncpy+0x44>
    5750:	04d11223          	sh	a3,68(sp)
    5754:	0000a697          	auipc	a3,0xa
    5758:	a4c68693          	add	a3,a3,-1460 # f1a0 <__fini_array_end+0x314>
    575c:	000aa783          	lw	a5,0(s5)
    5760:	00000593          	li	a1,0
    5764:	002dee13          	or	t3,s11,2
    5768:	004a8a93          	add	s5,s5,4
    576c:	00d12a23          	sw	a3,20(sp)
    5770:	040101a3          	sb	zero,67(sp)
    5774:	4c074863          	bltz	a4,5c44 <_vfiprintf_r+0xe38>
    5778:	00b7e6b3          	or	a3,a5,a1
    577c:	f7fe7513          	and	a0,t3,-129
    5780:	4a069c63          	bnez	a3,5c38 <_vfiprintf_r+0xe2c>
    5784:	000e0613          	mv	a2,t3
    5788:	00200793          	li	a5,2
    578c:	00050e13          	mv	t3,a0
    5790:	ec5ff06f          	j	5654 <_vfiprintf_r+0x848>
    5794:	00040513          	mv	a0,s0
    5798:	00e12c23          	sw	a4,24(sp)
    579c:	01112823          	sw	a7,16(sp)
    57a0:	104020ef          	jal	78a4 <_localeconv_r>
    57a4:	00452783          	lw	a5,4(a0)
    57a8:	00078513          	mv	a0,a5
    57ac:	02f12a23          	sw	a5,52(sp)
    57b0:	ab5fb0ef          	jal	1264 <strlen>
    57b4:	00050793          	mv	a5,a0
    57b8:	00040513          	mv	a0,s0
    57bc:	02f12823          	sw	a5,48(sp)
    57c0:	0e4020ef          	jal	78a4 <_localeconv_r>
    57c4:	00852703          	lw	a4,8(a0)
    57c8:	03012783          	lw	a5,48(sp)
    57cc:	01012883          	lw	a7,16(sp)
    57d0:	02e12623          	sw	a4,44(sp)
    57d4:	01812703          	lw	a4,24(sp)
    57d8:	a2078ee3          	beqz	a5,5214 <_vfiprintf_r+0x408>
    57dc:	02c12783          	lw	a5,44(sp)
    57e0:	000cc683          	lbu	a3,0(s9)
    57e4:	fa078463          	beqz	a5,4f8c <_vfiprintf_r+0x180>
    57e8:	0007c783          	lbu	a5,0(a5)
    57ec:	fa078063          	beqz	a5,4f8c <_vfiprintf_r+0x180>
    57f0:	400ded93          	or	s11,s11,1024
    57f4:	f98ff06f          	j	4f8c <_vfiprintf_r+0x180>
    57f8:	020df793          	and	a5,s11,32
    57fc:	78079263          	bnez	a5,5f80 <_vfiprintf_r+0x1174>
    5800:	010df793          	and	a5,s11,16
    5804:	30079ae3          	bnez	a5,6318 <_vfiprintf_r+0x150c>
    5808:	040df793          	and	a5,s11,64
    580c:	400796e3          	bnez	a5,6418 <_vfiprintf_r+0x160c>
    5810:	200dfe13          	and	t3,s11,512
    5814:	300e02e3          	beqz	t3,6318 <_vfiprintf_r+0x150c>
    5818:	000aa783          	lw	a5,0(s5)
    581c:	00c12703          	lw	a4,12(sp)
    5820:	004a8a93          	add	s5,s5,4
    5824:	00e78023          	sb	a4,0(a5)
    5828:	efcff06f          	j	4f24 <_vfiprintf_r+0x118>
    582c:	000cc683          	lbu	a3,0(s9)
    5830:	06c00793          	li	a5,108
    5834:	2cf68ae3          	beq	a3,a5,6308 <_vfiprintf_r+0x14fc>
    5838:	010ded93          	or	s11,s11,16
    583c:	f50ff06f          	j	4f8c <_vfiprintf_r+0x180>
    5840:	000cc683          	lbu	a3,0(s9)
    5844:	080ded93          	or	s11,s11,128
    5848:	f44ff06f          	j	4f8c <_vfiprintf_r+0x180>
    584c:	000cc683          	lbu	a3,0(s9)
    5850:	02a00793          	li	a5,42
    5854:	001c8593          	add	a1,s9,1
    5858:	54f680e3          	beq	a3,a5,6598 <_vfiprintf_r+0x178c>
    585c:	fd068793          	add	a5,a3,-48
    5860:	00900613          	li	a2,9
    5864:	00000713          	li	a4,0
    5868:	00900513          	li	a0,9
    586c:	02f66463          	bltu	a2,a5,5894 <_vfiprintf_r+0xa88>
    5870:	0005c683          	lbu	a3,0(a1)
    5874:	00271613          	sll	a2,a4,0x2
    5878:	00e60733          	add	a4,a2,a4
    587c:	00171713          	sll	a4,a4,0x1
    5880:	00f70733          	add	a4,a4,a5
    5884:	fd068793          	add	a5,a3,-48
    5888:	00158593          	add	a1,a1,1
    588c:	fef572e3          	bgeu	a0,a5,5870 <_vfiprintf_r+0xa64>
    5890:	74074063          	bltz	a4,5fd0 <_vfiprintf_r+0x11c4>
    5894:	00058c93          	mv	s9,a1
    5898:	ef8ff06f          	j	4f90 <_vfiprintf_r+0x184>
    589c:	000cc683          	lbu	a3,0(s9)
    58a0:	001ded93          	or	s11,s11,1
    58a4:	ee8ff06f          	j	4f8c <_vfiprintf_r+0x180>
    58a8:	04314783          	lbu	a5,67(sp)
    58ac:	000cc683          	lbu	a3,0(s9)
    58b0:	ec079e63          	bnez	a5,4f8c <_vfiprintf_r+0x180>
    58b4:	02000793          	li	a5,32
    58b8:	04f101a3          	sb	a5,67(sp)
    58bc:	ed0ff06f          	j	4f8c <_vfiprintf_r+0x180>
    58c0:	02d00613          	li	a2,45
    58c4:	01b036b3          	snez	a3,s11
    58c8:	41a000b3          	neg	ra,s10
    58cc:	04c101a3          	sb	a2,67(sp)
    58d0:	40d08d33          	sub	s10,ra,a3
    58d4:	41b00db3          	neg	s11,s11
    58d8:	00074463          	bltz	a4,58e0 <_vfiprintf_r+0xad4>
    58dc:	f7fe7e13          	and	t3,t3,-129
    58e0:	120d14e3          	bnez	s10,6208 <_vfiprintf_r+0x13fc>
    58e4:	00900693          	li	a3,9
    58e8:	13b6e0e3          	bltu	a3,s11,6208 <_vfiprintf_r+0x13fc>
    58ec:	030d8793          	add	a5,s11,48
    58f0:	0ff7f793          	zext.b	a5,a5
    58f4:	10f107a3          	sb	a5,271(sp)
    58f8:	00070e93          	mv	t4,a4
    58fc:	00e04463          	bgtz	a4,5904 <_vfiprintf_r+0xaf8>
    5900:	00100e93          	li	t4,1
    5904:	00100d13          	li	s10,1
    5908:	10f10813          	add	a6,sp,271
    590c:	04314783          	lbu	a5,67(sp)
    5910:	00012823          	sw	zero,16(sp)
    5914:	cc079ce3          	bnez	a5,55ec <_vfiprintf_r+0x7e0>
    5918:	cd9ff06f          	j	55f0 <_vfiprintf_r+0x7e4>
    591c:	00100713          	li	a4,1
    5920:	000d0793          	mv	a5,s10
    5924:	07012623          	sw	a6,108(sp)
    5928:	07a12823          	sw	s10,112(sp)
    592c:	07a12423          	sw	s10,104(sp)
    5930:	06e12223          	sw	a4,100(sp)
    5934:	000a0c13          	mv	s8,s4
    5938:	008c0c13          	add	s8,s8,8
    593c:	809ff06f          	j	5144 <_vfiprintf_r+0x338>
    5940:	00100613          	li	a2,1
    5944:	00000693          	li	a3,0
    5948:	000a0593          	mv	a1,s4
    594c:	a65ff06f          	j	53b0 <_vfiprintf_r+0x5a4>
    5950:	41d88db3          	sub	s11,a7,t4
    5954:	f9b05a63          	blez	s11,50e8 <_vfiprintf_r+0x2dc>
    5958:	01000593          	li	a1,16
    595c:	3bb5dae3          	bge	a1,s11,6510 <_vfiprintf_r+0x1704>
    5960:	0000af97          	auipc	t6,0xa
    5964:	eb4f8f93          	add	t6,t6,-332 # f814 <zeroes.0>
    5968:	02e12223          	sw	a4,36(sp)
    596c:	000a8713          	mv	a4,s5
    5970:	000c0693          	mv	a3,s8
    5974:	000d8a93          	mv	s5,s11
    5978:	01000f13          	li	t5,16
    597c:	00700293          	li	t0,7
    5980:	01c12c23          	sw	t3,24(sp)
    5984:	01012e23          	sw	a6,28(sp)
    5988:	03112023          	sw	a7,32(sp)
    598c:	03d12423          	sw	t4,40(sp)
    5990:	000f8c13          	mv	s8,t6
    5994:	00070d93          	mv	s11,a4
    5998:	0180006f          	j	59b0 <_vfiprintf_r+0xba4>
    599c:	00260513          	add	a0,a2,2
    59a0:	00868693          	add	a3,a3,8
    59a4:	00070613          	mv	a2,a4
    59a8:	ff0a8a93          	add	s5,s5,-16
    59ac:	055f5c63          	bge	t5,s5,5a04 <_vfiprintf_r+0xbf8>
    59b0:	01078793          	add	a5,a5,16
    59b4:	00160713          	add	a4,a2,1
    59b8:	0186a023          	sw	s8,0(a3)
    59bc:	01e6a223          	sw	t5,4(a3)
    59c0:	06f12423          	sw	a5,104(sp)
    59c4:	06e12223          	sw	a4,100(sp)
    59c8:	fce2dae3          	bge	t0,a4,599c <_vfiprintf_r+0xb90>
    59cc:	1c078663          	beqz	a5,5b98 <_vfiprintf_r+0xd8c>
    59d0:	06010613          	add	a2,sp,96
    59d4:	00098593          	mv	a1,s3
    59d8:	00040513          	mv	a0,s0
    59dc:	af4ff0ef          	jal	4cd0 <__sprint_r.part.0>
    59e0:	8e051ee3          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    59e4:	06412603          	lw	a2,100(sp)
    59e8:	01000f13          	li	t5,16
    59ec:	ff0a8a93          	add	s5,s5,-16
    59f0:	06812783          	lw	a5,104(sp)
    59f4:	000a0693          	mv	a3,s4
    59f8:	00160513          	add	a0,a2,1
    59fc:	00700293          	li	t0,7
    5a00:	fb5f48e3          	blt	t5,s5,59b0 <_vfiprintf_r+0xba4>
    5a04:	01812e03          	lw	t3,24(sp)
    5a08:	01c12803          	lw	a6,28(sp)
    5a0c:	02012883          	lw	a7,32(sp)
    5a10:	02412703          	lw	a4,36(sp)
    5a14:	02812e83          	lw	t4,40(sp)
    5a18:	000d8613          	mv	a2,s11
    5a1c:	000c0f93          	mv	t6,s8
    5a20:	000a8d93          	mv	s11,s5
    5a24:	00068c13          	mv	s8,a3
    5a28:	00060a93          	mv	s5,a2
    5a2c:	01b787b3          	add	a5,a5,s11
    5a30:	01fc2023          	sw	t6,0(s8)
    5a34:	01bc2223          	sw	s11,4(s8)
    5a38:	06f12423          	sw	a5,104(sp)
    5a3c:	06a12223          	sw	a0,100(sp)
    5a40:	00700613          	li	a2,7
    5a44:	4ea65863          	bge	a2,a0,5f34 <_vfiprintf_r+0x1128>
    5a48:	1a0786e3          	beqz	a5,63f4 <_vfiprintf_r+0x15e8>
    5a4c:	06010613          	add	a2,sp,96
    5a50:	00098593          	mv	a1,s3
    5a54:	00040513          	mv	a0,s0
    5a58:	03d12423          	sw	t4,40(sp)
    5a5c:	02e12223          	sw	a4,36(sp)
    5a60:	03112023          	sw	a7,32(sp)
    5a64:	01012e23          	sw	a6,28(sp)
    5a68:	01c12c23          	sw	t3,24(sp)
    5a6c:	a64ff0ef          	jal	4cd0 <__sprint_r.part.0>
    5a70:	860516e3          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    5a74:	02412703          	lw	a4,36(sp)
    5a78:	06412603          	lw	a2,100(sp)
    5a7c:	06812783          	lw	a5,104(sp)
    5a80:	41a70733          	sub	a4,a4,s10
    5a84:	02812e83          	lw	t4,40(sp)
    5a88:	02012883          	lw	a7,32(sp)
    5a8c:	01c12803          	lw	a6,28(sp)
    5a90:	01812e03          	lw	t3,24(sp)
    5a94:	000a0c13          	mv	s8,s4
    5a98:	00160f13          	add	t5,a2,1
    5a9c:	e4e05a63          	blez	a4,50f0 <_vfiprintf_r+0x2e4>
    5aa0:	01000593          	li	a1,16
    5aa4:	0000af97          	auipc	t6,0xa
    5aa8:	d70f8f93          	add	t6,t6,-656 # f814 <zeroes.0>
    5aac:	0ae5da63          	bge	a1,a4,5b60 <_vfiprintf_r+0xd54>
    5ab0:	000c0593          	mv	a1,s8
    5ab4:	03512423          	sw	s5,40(sp)
    5ab8:	01000d93          	li	s11,16
    5abc:	00700293          	li	t0,7
    5ac0:	01c12c23          	sw	t3,24(sp)
    5ac4:	01012e23          	sw	a6,28(sp)
    5ac8:	03112023          	sw	a7,32(sp)
    5acc:	03d12223          	sw	t4,36(sp)
    5ad0:	00070a93          	mv	s5,a4
    5ad4:	000b0c13          	mv	s8,s6
    5ad8:	0180006f          	j	5af0 <_vfiprintf_r+0xce4>
    5adc:	00260f13          	add	t5,a2,2
    5ae0:	00858593          	add	a1,a1,8
    5ae4:	00068613          	mv	a2,a3
    5ae8:	ff0a8a93          	add	s5,s5,-16
    5aec:	055dda63          	bge	s11,s5,5b40 <_vfiprintf_r+0xd34>
    5af0:	01078793          	add	a5,a5,16
    5af4:	00160693          	add	a3,a2,1
    5af8:	0165a023          	sw	s6,0(a1)
    5afc:	01b5a223          	sw	s11,4(a1)
    5b00:	06f12423          	sw	a5,104(sp)
    5b04:	06d12223          	sw	a3,100(sp)
    5b08:	fcd2dae3          	bge	t0,a3,5adc <_vfiprintf_r+0xcd0>
    5b0c:	06078e63          	beqz	a5,5b88 <_vfiprintf_r+0xd7c>
    5b10:	06010613          	add	a2,sp,96
    5b14:	00098593          	mv	a1,s3
    5b18:	00040513          	mv	a0,s0
    5b1c:	9b4ff0ef          	jal	4cd0 <__sprint_r.part.0>
    5b20:	fa051e63          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    5b24:	06412603          	lw	a2,100(sp)
    5b28:	ff0a8a93          	add	s5,s5,-16
    5b2c:	06812783          	lw	a5,104(sp)
    5b30:	000a0593          	mv	a1,s4
    5b34:	00160f13          	add	t5,a2,1
    5b38:	00700293          	li	t0,7
    5b3c:	fb5dcae3          	blt	s11,s5,5af0 <_vfiprintf_r+0xce4>
    5b40:	000a8713          	mv	a4,s5
    5b44:	01812e03          	lw	t3,24(sp)
    5b48:	01c12803          	lw	a6,28(sp)
    5b4c:	02012883          	lw	a7,32(sp)
    5b50:	02412e83          	lw	t4,36(sp)
    5b54:	02812a83          	lw	s5,40(sp)
    5b58:	000c0f93          	mv	t6,s8
    5b5c:	00058c13          	mv	s8,a1
    5b60:	00e787b3          	add	a5,a5,a4
    5b64:	00ec2223          	sw	a4,4(s8)
    5b68:	01fc2023          	sw	t6,0(s8)
    5b6c:	06f12423          	sw	a5,104(sp)
    5b70:	07e12223          	sw	t5,100(sp)
    5b74:	00700713          	li	a4,7
    5b78:	25e74863          	blt	a4,t5,5dc8 <_vfiprintf_r+0xfbc>
    5b7c:	008c0c13          	add	s8,s8,8
    5b80:	001f0f13          	add	t5,t5,1
    5b84:	d6cff06f          	j	50f0 <_vfiprintf_r+0x2e4>
    5b88:	00100f13          	li	t5,1
    5b8c:	00000613          	li	a2,0
    5b90:	000a0593          	mv	a1,s4
    5b94:	f55ff06f          	j	5ae8 <_vfiprintf_r+0xcdc>
    5b98:	00100513          	li	a0,1
    5b9c:	00000613          	li	a2,0
    5ba0:	000a0693          	mv	a3,s4
    5ba4:	e05ff06f          	j	59a8 <_vfiprintf_r+0xb9c>
    5ba8:	06078263          	beqz	a5,5c0c <_vfiprintf_r+0xe00>
    5bac:	06010613          	add	a2,sp,96
    5bb0:	00098593          	mv	a1,s3
    5bb4:	00040513          	mv	a0,s0
    5bb8:	03d12e23          	sw	t4,60(sp)
    5bbc:	02e12c23          	sw	a4,56(sp)
    5bc0:	03112423          	sw	a7,40(sp)
    5bc4:	03012223          	sw	a6,36(sp)
    5bc8:	02512023          	sw	t0,32(sp)
    5bcc:	01f12e23          	sw	t6,28(sp)
    5bd0:	01c12c23          	sw	t3,24(sp)
    5bd4:	8fcff0ef          	jal	4cd0 <__sprint_r.part.0>
    5bd8:	f0051263          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    5bdc:	06412603          	lw	a2,100(sp)
    5be0:	06812783          	lw	a5,104(sp)
    5be4:	03c12e83          	lw	t4,60(sp)
    5be8:	03812703          	lw	a4,56(sp)
    5bec:	02812883          	lw	a7,40(sp)
    5bf0:	02412803          	lw	a6,36(sp)
    5bf4:	02012283          	lw	t0,32(sp)
    5bf8:	01c12f83          	lw	t6,28(sp)
    5bfc:	01812e03          	lw	t3,24(sp)
    5c00:	000a0c13          	mv	s8,s4
    5c04:	00160f13          	add	t5,a2,1
    5c08:	c58ff06f          	j	5060 <_vfiprintf_r+0x254>
    5c0c:	380f8863          	beqz	t6,5f9c <_vfiprintf_r+0x1190>
    5c10:	04410793          	add	a5,sp,68
    5c14:	06f12623          	sw	a5,108(sp)
    5c18:	00200793          	li	a5,2
    5c1c:	06f12823          	sw	a5,112(sp)
    5c20:	00100f13          	li	t5,1
    5c24:	000a0c13          	mv	s8,s4
    5c28:	000f0613          	mv	a2,t5
    5c2c:	008c0c13          	add	s8,s8,8
    5c30:	001f0f13          	add	t5,t5,1
    5c34:	cacff06f          	j	50e0 <_vfiprintf_r+0x2d4>
    5c38:	00200693          	li	a3,2
    5c3c:	00050e13          	mv	t3,a0
    5c40:	aa0684e3          	beqz	a3,56e8 <_vfiprintf_r+0x8dc>
    5c44:	01412503          	lw	a0,20(sp)
    5c48:	11010813          	add	a6,sp,272
    5c4c:	00f7f693          	and	a3,a5,15
    5c50:	00d506b3          	add	a3,a0,a3
    5c54:	0006c603          	lbu	a2,0(a3)
    5c58:	0047d793          	srl	a5,a5,0x4
    5c5c:	01c59693          	sll	a3,a1,0x1c
    5c60:	00f6e7b3          	or	a5,a3,a5
    5c64:	0045d593          	srl	a1,a1,0x4
    5c68:	fec80fa3          	sb	a2,-1(a6)
    5c6c:	00b7e6b3          	or	a3,a5,a1
    5c70:	fff80813          	add	a6,a6,-1
    5c74:	fc069ce3          	bnez	a3,5c4c <_vfiprintf_r+0xe40>
    5c78:	11010793          	add	a5,sp,272
    5c7c:	41078d33          	sub	s10,a5,a6
    5c80:	00070e93          	mv	t4,a4
    5c84:	c9a754e3          	bge	a4,s10,590c <_vfiprintf_r+0xb00>
    5c88:	000d0e93          	mv	t4,s10
    5c8c:	c81ff06f          	j	590c <_vfiprintf_r+0xb00>
    5c90:	01000513          	li	a0,16
    5c94:	01b554e3          	bge	a0,s11,649c <_vfiprintf_r+0x1690>
    5c98:	000a8693          	mv	a3,s5
    5c9c:	0000a317          	auipc	t1,0xa
    5ca0:	b8830313          	add	t1,t1,-1144 # f824 <blanks.1>
    5ca4:	02e12c23          	sw	a4,56(sp)
    5ca8:	000d8a93          	mv	s5,s11
    5cac:	000c0713          	mv	a4,s8
    5cb0:	01000f13          	li	t5,16
    5cb4:	00700393          	li	t2,7
    5cb8:	01c12c23          	sw	t3,24(sp)
    5cbc:	01f12e23          	sw	t6,28(sp)
    5cc0:	02512023          	sw	t0,32(sp)
    5cc4:	03012223          	sw	a6,36(sp)
    5cc8:	03112423          	sw	a7,40(sp)
    5ccc:	03d12e23          	sw	t4,60(sp)
    5cd0:	00030c13          	mv	s8,t1
    5cd4:	00068d93          	mv	s11,a3
    5cd8:	01c0006f          	j	5cf4 <_vfiprintf_r+0xee8>
    5cdc:	00260513          	add	a0,a2,2
    5ce0:	00870713          	add	a4,a4,8
    5ce4:	00058613          	mv	a2,a1
    5ce8:	ff0a8a93          	add	s5,s5,-16
    5cec:	055f5c63          	bge	t5,s5,5d44 <_vfiprintf_r+0xf38>
    5cf0:	00160593          	add	a1,a2,1
    5cf4:	01078793          	add	a5,a5,16
    5cf8:	01872023          	sw	s8,0(a4)
    5cfc:	01e72223          	sw	t5,4(a4)
    5d00:	06f12423          	sw	a5,104(sp)
    5d04:	06b12223          	sw	a1,100(sp)
    5d08:	fcb3dae3          	bge	t2,a1,5cdc <_vfiprintf_r+0xed0>
    5d0c:	08078a63          	beqz	a5,5da0 <_vfiprintf_r+0xf94>
    5d10:	06010613          	add	a2,sp,96
    5d14:	00098593          	mv	a1,s3
    5d18:	00040513          	mv	a0,s0
    5d1c:	fb5fe0ef          	jal	4cd0 <__sprint_r.part.0>
    5d20:	da051e63          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    5d24:	06412603          	lw	a2,100(sp)
    5d28:	01000f13          	li	t5,16
    5d2c:	ff0a8a93          	add	s5,s5,-16
    5d30:	06812783          	lw	a5,104(sp)
    5d34:	000a0713          	mv	a4,s4
    5d38:	00160513          	add	a0,a2,1
    5d3c:	00700393          	li	t2,7
    5d40:	fb5f48e3          	blt	t5,s5,5cf0 <_vfiprintf_r+0xee4>
    5d44:	000c0313          	mv	t1,s8
    5d48:	01812e03          	lw	t3,24(sp)
    5d4c:	00070c13          	mv	s8,a4
    5d50:	01c12f83          	lw	t6,28(sp)
    5d54:	02012283          	lw	t0,32(sp)
    5d58:	02412803          	lw	a6,36(sp)
    5d5c:	02812883          	lw	a7,40(sp)
    5d60:	03c12e83          	lw	t4,60(sp)
    5d64:	03812703          	lw	a4,56(sp)
    5d68:	000d8693          	mv	a3,s11
    5d6c:	000a8d93          	mv	s11,s5
    5d70:	00068a93          	mv	s5,a3
    5d74:	01b787b3          	add	a5,a5,s11
    5d78:	006c2023          	sw	t1,0(s8)
    5d7c:	01bc2223          	sw	s11,4(s8)
    5d80:	06f12423          	sw	a5,104(sp)
    5d84:	06a12223          	sw	a0,100(sp)
    5d88:	00700613          	li	a2,7
    5d8c:	12a64063          	blt	a2,a0,5eac <_vfiprintf_r+0x10a0>
    5d90:	008c0c13          	add	s8,s8,8
    5d94:	00150f13          	add	t5,a0,1
    5d98:	00050613          	mv	a2,a0
    5d9c:	a8cff06f          	j	5028 <_vfiprintf_r+0x21c>
    5da0:	00000613          	li	a2,0
    5da4:	00100513          	li	a0,1
    5da8:	000a0713          	mv	a4,s4
    5dac:	f3dff06f          	j	5ce8 <_vfiprintf_r+0xedc>
    5db0:	01d8d463          	bge	a7,t4,5db8 <_vfiprintf_r+0xfac>
    5db4:	000e8893          	mv	a7,t4
    5db8:	00c12783          	lw	a5,12(sp)
    5dbc:	011787b3          	add	a5,a5,a7
    5dc0:	00f12623          	sw	a5,12(sp)
    5dc4:	ba8ff06f          	j	516c <_vfiprintf_r+0x360>
    5dc8:	b4078ae3          	beqz	a5,591c <_vfiprintf_r+0xb10>
    5dcc:	06010613          	add	a2,sp,96
    5dd0:	00098593          	mv	a1,s3
    5dd4:	00040513          	mv	a0,s0
    5dd8:	03d12223          	sw	t4,36(sp)
    5ddc:	03112023          	sw	a7,32(sp)
    5de0:	01012e23          	sw	a6,28(sp)
    5de4:	01c12c23          	sw	t3,24(sp)
    5de8:	ee9fe0ef          	jal	4cd0 <__sprint_r.part.0>
    5dec:	ce051863          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    5df0:	06412f03          	lw	t5,100(sp)
    5df4:	06812783          	lw	a5,104(sp)
    5df8:	02412e83          	lw	t4,36(sp)
    5dfc:	02012883          	lw	a7,32(sp)
    5e00:	01c12803          	lw	a6,28(sp)
    5e04:	01812e03          	lw	t3,24(sp)
    5e08:	000a0c13          	mv	s8,s4
    5e0c:	001f0f13          	add	t5,t5,1
    5e10:	ae0ff06f          	j	50f0 <_vfiprintf_r+0x2e4>
    5e14:	06012223          	sw	zero,100(sp)
    5e18:	000a0c13          	mv	s8,s4
    5e1c:	c84ff06f          	j	52a0 <_vfiprintf_r+0x494>
    5e20:	01067693          	and	a3,a2,16
    5e24:	000aa783          	lw	a5,0(s5)
    5e28:	004a8a93          	add	s5,s5,4
    5e2c:	12069c63          	bnez	a3,5f64 <_vfiprintf_r+0x1158>
    5e30:	04067693          	and	a3,a2,64
    5e34:	12068463          	beqz	a3,5f5c <_vfiprintf_r+0x1150>
    5e38:	01079d93          	sll	s11,a5,0x10
    5e3c:	010ddd93          	srl	s11,s11,0x10
    5e40:	00000d13          	li	s10,0
    5e44:	ff4ff06f          	j	5638 <_vfiprintf_r+0x82c>
    5e48:	0106f613          	and	a2,a3,16
    5e4c:	000aa783          	lw	a5,0(s5)
    5e50:	004a8a93          	add	s5,s5,4
    5e54:	12061263          	bnez	a2,5f78 <_vfiprintf_r+0x116c>
    5e58:	0406f613          	and	a2,a3,64
    5e5c:	10060a63          	beqz	a2,5f70 <_vfiprintf_r+0x1164>
    5e60:	01079793          	sll	a5,a5,0x10
    5e64:	0107d793          	srl	a5,a5,0x10
    5e68:	00000593          	li	a1,0
    5e6c:	83dff06f          	j	56a8 <_vfiprintf_r+0x89c>
    5e70:	010e7693          	and	a3,t3,16
    5e74:	000aa783          	lw	a5,0(s5)
    5e78:	004a8a93          	add	s5,s5,4
    5e7c:	0c069863          	bnez	a3,5f4c <_vfiprintf_r+0x1140>
    5e80:	040e7693          	and	a3,t3,64
    5e84:	0c068063          	beqz	a3,5f44 <_vfiprintf_r+0x1138>
    5e88:	01079d93          	sll	s11,a5,0x10
    5e8c:	410ddd93          	sra	s11,s11,0x10
    5e90:	41fddd13          	sra	s10,s11,0x1f
    5e94:	000d0693          	mv	a3,s10
    5e98:	f24ff06f          	j	55bc <_vfiprintf_r+0x7b0>
    5e9c:	00100f13          	li	t5,1
    5ea0:	00000613          	li	a2,0
    5ea4:	000a0c13          	mv	s8,s4
    5ea8:	a38ff06f          	j	50e0 <_vfiprintf_r+0x2d4>
    5eac:	1a078463          	beqz	a5,6054 <_vfiprintf_r+0x1248>
    5eb0:	06010613          	add	a2,sp,96
    5eb4:	00098593          	mv	a1,s3
    5eb8:	00040513          	mv	a0,s0
    5ebc:	03d12e23          	sw	t4,60(sp)
    5ec0:	02e12c23          	sw	a4,56(sp)
    5ec4:	03112423          	sw	a7,40(sp)
    5ec8:	03012223          	sw	a6,36(sp)
    5ecc:	02512023          	sw	t0,32(sp)
    5ed0:	01f12e23          	sw	t6,28(sp)
    5ed4:	01c12c23          	sw	t3,24(sp)
    5ed8:	df9fe0ef          	jal	4cd0 <__sprint_r.part.0>
    5edc:	c0051063          	bnez	a0,52dc <_vfiprintf_r+0x4d0>
    5ee0:	06412603          	lw	a2,100(sp)
    5ee4:	06812783          	lw	a5,104(sp)
    5ee8:	03c12e83          	lw	t4,60(sp)
    5eec:	03812703          	lw	a4,56(sp)
    5ef0:	02812883          	lw	a7,40(sp)
    5ef4:	02412803          	lw	a6,36(sp)
    5ef8:	02012283          	lw	t0,32(sp)
    5efc:	01c12f83          	lw	t6,28(sp)
    5f00:	01812e03          	lw	t3,24(sp)
    5f04:	000a0c13          	mv	s8,s4
    5f08:	00160f13          	add	t5,a2,1
    5f0c:	91cff06f          	j	5028 <_vfiprintf_r+0x21c>
    5f10:	000d8e13          	mv	t3,s11
    5f14:	e88ff06f          	j	559c <_vfiprintf_r+0x790>
    5f18:	00000e93          	li	t4,0
    5f1c:	11010813          	add	a6,sp,272
    5f20:	9edff06f          	j	590c <_vfiprintf_r+0xb00>
    5f24:	0589a503          	lw	a0,88(s3)
    5f28:	8b4fb0ef          	jal	fdc <__retarget_lock_acquire_recursive>
    5f2c:	00c99783          	lh	a5,12(s3)
    5f30:	f41fe06f          	j	4e70 <_vfiprintf_r+0x64>
    5f34:	008c0c13          	add	s8,s8,8
    5f38:	00150f13          	add	t5,a0,1
    5f3c:	00050613          	mv	a2,a0
    5f40:	9a8ff06f          	j	50e8 <_vfiprintf_r+0x2dc>
    5f44:	200e7693          	and	a3,t3,512
    5f48:	50069463          	bnez	a3,6450 <_vfiprintf_r+0x1644>
    5f4c:	41f7dd13          	sra	s10,a5,0x1f
    5f50:	00078d93          	mv	s11,a5
    5f54:	000d0693          	mv	a3,s10
    5f58:	e64ff06f          	j	55bc <_vfiprintf_r+0x7b0>
    5f5c:	20067693          	and	a3,a2,512
    5f60:	4c069663          	bnez	a3,642c <_vfiprintf_r+0x1620>
    5f64:	00078d93          	mv	s11,a5
    5f68:	00000d13          	li	s10,0
    5f6c:	eccff06f          	j	5638 <_vfiprintf_r+0x82c>
    5f70:	2006f613          	and	a2,a3,512
    5f74:	4c061863          	bnez	a2,6444 <_vfiprintf_r+0x1638>
    5f78:	00000593          	li	a1,0
    5f7c:	f2cff06f          	j	56a8 <_vfiprintf_r+0x89c>
    5f80:	00c12683          	lw	a3,12(sp)
    5f84:	000aa783          	lw	a5,0(s5)
    5f88:	004a8a93          	add	s5,s5,4
    5f8c:	41f6d713          	sra	a4,a3,0x1f
    5f90:	00d7a023          	sw	a3,0(a5)
    5f94:	00e7a223          	sw	a4,4(a5)
    5f98:	f8dfe06f          	j	4f24 <_vfiprintf_r+0x118>
    5f9c:	00000613          	li	a2,0
    5fa0:	00100f13          	li	t5,1
    5fa4:	000a0c13          	mv	s8,s4
    5fa8:	938ff06f          	j	50e0 <_vfiprintf_r+0x2d4>
    5fac:	000aa783          	lw	a5,0(s5)
    5fb0:	00100e93          	li	t4,1
    5fb4:	00100d13          	li	s10,1
    5fb8:	0af10623          	sb	a5,172(sp)
    5fbc:	0ac10593          	add	a1,sp,172
    5fc0:	db8ff06f          	j	5578 <_vfiprintf_r+0x76c>
    5fc4:	000d0e93          	mv	t4,s10
    5fc8:	00050813          	mv	a6,a0
    5fcc:	941ff06f          	j	590c <_vfiprintf_r+0xb00>
    5fd0:	fff00713          	li	a4,-1
    5fd4:	00058c93          	mv	s9,a1
    5fd8:	fb9fe06f          	j	4f90 <_vfiprintf_r+0x184>
    5fdc:	000d8613          	mv	a2,s11
    5fe0:	e3cff06f          	j	561c <_vfiprintf_r+0x810>
    5fe4:	00009797          	auipc	a5,0x9
    5fe8:	1d078793          	add	a5,a5,464 # f1b4 <__fini_array_end+0x328>
    5fec:	000d8e13          	mv	t3,s11
    5ff0:	00f12a23          	sw	a5,20(sp)
    5ff4:	020e7793          	and	a5,t3,32
    5ff8:	1c078c63          	beqz	a5,61d0 <_vfiprintf_r+0x13c4>
    5ffc:	007a8a93          	add	s5,s5,7
    6000:	ff8afa93          	and	s5,s5,-8
    6004:	000aa783          	lw	a5,0(s5)
    6008:	004aa583          	lw	a1,4(s5)
    600c:	008a8a93          	add	s5,s5,8
    6010:	001e7613          	and	a2,t3,1
    6014:	00060e63          	beqz	a2,6030 <_vfiprintf_r+0x1224>
    6018:	00b7e633          	or	a2,a5,a1
    601c:	00060a63          	beqz	a2,6030 <_vfiprintf_r+0x1224>
    6020:	03000613          	li	a2,48
    6024:	04c10223          	sb	a2,68(sp)
    6028:	04d102a3          	sb	a3,69(sp)
    602c:	002e6e13          	or	t3,t3,2
    6030:	bffe7e13          	and	t3,t3,-1025
    6034:	f3cff06f          	j	5770 <_vfiprintf_r+0x964>
    6038:	000d8693          	mv	a3,s11
    603c:	e50ff06f          	j	568c <_vfiprintf_r+0x880>
    6040:	00009797          	auipc	a5,0x9
    6044:	16078793          	add	a5,a5,352 # f1a0 <__fini_array_end+0x314>
    6048:	000d8e13          	mv	t3,s11
    604c:	00f12a23          	sw	a5,20(sp)
    6050:	fa5ff06f          	j	5ff4 <_vfiprintf_r+0x11e8>
    6054:	04314603          	lbu	a2,67(sp)
    6058:	3a060a63          	beqz	a2,640c <_vfiprintf_r+0x1600>
    605c:	04310793          	add	a5,sp,67
    6060:	06f12623          	sw	a5,108(sp)
    6064:	00100793          	li	a5,1
    6068:	06f12823          	sw	a5,112(sp)
    606c:	00100f13          	li	t5,1
    6070:	000a0c13          	mv	s8,s4
    6074:	fe1fe06f          	j	5054 <_vfiprintf_r+0x248>
    6078:	00800613          	li	a2,8
    607c:	00000593          	li	a1,0
    6080:	05810513          	add	a0,sp,88
    6084:	02e12023          	sw	a4,32(sp)
    6088:	01112e23          	sw	a7,28(sp)
    608c:	01c12c23          	sw	t3,24(sp)
    6090:	05012623          	sw	a6,76(sp)
    6094:	01012823          	sw	a6,16(sp)
    6098:	f4dfa0ef          	jal	fe4 <memset>
    609c:	02012703          	lw	a4,32(sp)
    60a0:	01012803          	lw	a6,16(sp)
    60a4:	01812e03          	lw	t3,24(sp)
    60a8:	01c12883          	lw	a7,28(sp)
    60ac:	2a074463          	bltz	a4,6354 <_vfiprintf_r+0x1548>
    60b0:	00000d93          	li	s11,0
    60b4:	00000d13          	li	s10,0
    60b8:	01812823          	sw	s8,16(sp)
    60bc:	01012e23          	sw	a6,28(sp)
    60c0:	000d8c13          	mv	s8,s11
    60c4:	03112023          	sw	a7,32(sp)
    60c8:	000c8d93          	mv	s11,s9
    60cc:	000a8c93          	mv	s9,s5
    60d0:	000d0a93          	mv	s5,s10
    60d4:	00098d13          	mv	s10,s3
    60d8:	00070993          	mv	s3,a4
    60dc:	0300006f          	j	610c <_vfiprintf_r+0x1300>
    60e0:	05810693          	add	a3,sp,88
    60e4:	0ac10593          	add	a1,sp,172
    60e8:	00040513          	mv	a0,s0
    60ec:	069040ef          	jal	a954 <_wcrtomb_r>
    60f0:	fff00793          	li	a5,-1
    60f4:	48f50063          	beq	a0,a5,6574 <_vfiprintf_r+0x1768>
    60f8:	00aa87b3          	add	a5,s5,a0
    60fc:	02f9c063          	blt	s3,a5,611c <_vfiprintf_r+0x1310>
    6100:	004c0c13          	add	s8,s8,4
    6104:	45378463          	beq	a5,s3,654c <_vfiprintf_r+0x1740>
    6108:	00078a93          	mv	s5,a5
    610c:	04c12783          	lw	a5,76(sp)
    6110:	018787b3          	add	a5,a5,s8
    6114:	0007a603          	lw	a2,0(a5)
    6118:	fc0614e3          	bnez	a2,60e0 <_vfiprintf_r+0x12d4>
    611c:	01012c03          	lw	s8,16(sp)
    6120:	01812e03          	lw	t3,24(sp)
    6124:	01c12803          	lw	a6,28(sp)
    6128:	02012883          	lw	a7,32(sp)
    612c:	000d0993          	mv	s3,s10
    6130:	000a8d13          	mv	s10,s5
    6134:	000c8a93          	mv	s5,s9
    6138:	000d8c93          	mv	s9,s11
    613c:	280d0e63          	beqz	s10,63d8 <_vfiprintf_r+0x15cc>
    6140:	06300793          	li	a5,99
    6144:	33a7d463          	bge	a5,s10,646c <_vfiprintf_r+0x1660>
    6148:	001d0593          	add	a1,s10,1
    614c:	00040513          	mv	a0,s0
    6150:	01112c23          	sw	a7,24(sp)
    6154:	01c12823          	sw	t3,16(sp)
    6158:	de8fb0ef          	jal	1740 <_malloc_r>
    615c:	01012e03          	lw	t3,16(sp)
    6160:	01812883          	lw	a7,24(sp)
    6164:	00050813          	mv	a6,a0
    6168:	42050063          	beqz	a0,6588 <_vfiprintf_r+0x177c>
    616c:	00a12823          	sw	a0,16(sp)
    6170:	00800613          	li	a2,8
    6174:	00000593          	li	a1,0
    6178:	05810513          	add	a0,sp,88
    617c:	03112023          	sw	a7,32(sp)
    6180:	01c12e23          	sw	t3,28(sp)
    6184:	01012c23          	sw	a6,24(sp)
    6188:	e5dfa0ef          	jal	fe4 <memset>
    618c:	01812803          	lw	a6,24(sp)
    6190:	05810713          	add	a4,sp,88
    6194:	000d0693          	mv	a3,s10
    6198:	00080593          	mv	a1,a6
    619c:	04c10613          	add	a2,sp,76
    61a0:	00040513          	mv	a0,s0
    61a4:	03d040ef          	jal	a9e0 <_wcsrtombs_r>
    61a8:	01812803          	lw	a6,24(sp)
    61ac:	01c12e03          	lw	t3,28(sp)
    61b0:	02012883          	lw	a7,32(sp)
    61b4:	40ad1063          	bne	s10,a0,65b4 <_vfiprintf_r+0x17a8>
    61b8:	fffd4e93          	not	t4,s10
    61bc:	01a807b3          	add	a5,a6,s10
    61c0:	41fede93          	sra	t4,t4,0x1f
    61c4:	00078023          	sb	zero,0(a5)
    61c8:	01dd7eb3          	and	t4,s10,t4
    61cc:	2140006f          	j	63e0 <_vfiprintf_r+0x15d4>
    61d0:	010e7613          	and	a2,t3,16
    61d4:	000aa783          	lw	a5,0(s5)
    61d8:	004a8a93          	add	s5,s5,4
    61dc:	02061263          	bnez	a2,6200 <_vfiprintf_r+0x13f4>
    61e0:	040e7613          	and	a2,t3,64
    61e4:	00060a63          	beqz	a2,61f8 <_vfiprintf_r+0x13ec>
    61e8:	01079793          	sll	a5,a5,0x10
    61ec:	0107d793          	srl	a5,a5,0x10
    61f0:	00000593          	li	a1,0
    61f4:	e1dff06f          	j	6010 <_vfiprintf_r+0x1204>
    61f8:	200e7613          	and	a2,t3,512
    61fc:	22061e63          	bnez	a2,6438 <_vfiprintf_r+0x162c>
    6200:	00000593          	li	a1,0
    6204:	e0dff06f          	j	6010 <_vfiprintf_r+0x1204>
    6208:	400e7793          	and	a5,t3,1024
    620c:	00000693          	li	a3,0
    6210:	11010e93          	add	t4,sp,272
    6214:	01812823          	sw	s8,16(sp)
    6218:	02812223          	sw	s0,36(sp)
    621c:	03912c23          	sw	s9,56(sp)
    6220:	03512e23          	sw	s5,60(sp)
    6224:	02c12c83          	lw	s9,44(sp)
    6228:	01c12c23          	sw	t3,24(sp)
    622c:	01112e23          	sw	a7,28(sp)
    6230:	02e12023          	sw	a4,32(sp)
    6234:	00078c13          	mv	s8,a5
    6238:	00068413          	mv	s0,a3
    623c:	03312423          	sw	s3,40(sp)
    6240:	000e8a93          	mv	s5,t4
    6244:	0280006f          	j	626c <_vfiprintf_r+0x1460>
    6248:	00a00613          	li	a2,10
    624c:	00000693          	li	a3,0
    6250:	000d8513          	mv	a0,s11
    6254:	000d0593          	mv	a1,s10
    6258:	268050ef          	jal	b4c0 <__udivdi3>
    625c:	220d0a63          	beqz	s10,6490 <_vfiprintf_r+0x1684>
    6260:	00050d93          	mv	s11,a0
    6264:	00058d13          	mv	s10,a1
    6268:	00098a93          	mv	s5,s3
    626c:	00a00613          	li	a2,10
    6270:	00000693          	li	a3,0
    6274:	000d8513          	mv	a0,s11
    6278:	000d0593          	mv	a1,s10
    627c:	0f1050ef          	jal	bb6c <__umoddi3>
    6280:	03050513          	add	a0,a0,48
    6284:	feaa8fa3          	sb	a0,-1(s5)
    6288:	fffa8993          	add	s3,s5,-1
    628c:	00140413          	add	s0,s0,1
    6290:	fa0c0ce3          	beqz	s8,6248 <_vfiprintf_r+0x143c>
    6294:	000cc783          	lbu	a5,0(s9)
    6298:	fa8798e3          	bne	a5,s0,6248 <_vfiprintf_r+0x143c>
    629c:	0ff00793          	li	a5,255
    62a0:	faf404e3          	beq	s0,a5,6248 <_vfiprintf_r+0x143c>
    62a4:	0e0d1a63          	bnez	s10,6398 <_vfiprintf_r+0x158c>
    62a8:	00900793          	li	a5,9
    62ac:	0fb7e663          	bltu	a5,s11,6398 <_vfiprintf_r+0x158c>
    62b0:	00098813          	mv	a6,s3
    62b4:	03912623          	sw	s9,44(sp)
    62b8:	01012c03          	lw	s8,16(sp)
    62bc:	01812e03          	lw	t3,24(sp)
    62c0:	01c12883          	lw	a7,28(sp)
    62c4:	02012703          	lw	a4,32(sp)
    62c8:	02412403          	lw	s0,36(sp)
    62cc:	02812983          	lw	s3,40(sp)
    62d0:	03812c83          	lw	s9,56(sp)
    62d4:	03c12a83          	lw	s5,60(sp)
    62d8:	9a1ff06f          	j	5c78 <_vfiprintf_r+0xe6c>
    62dc:	00068e13          	mv	t3,a3
    62e0:	00000693          	li	a3,0
    62e4:	c0068263          	beqz	a3,56e8 <_vfiprintf_r+0x8dc>
    62e8:	95dff06f          	j	5c44 <_vfiprintf_r+0xe38>
    62ec:	00040513          	mv	a0,s0
    62f0:	115000ef          	jal	6c04 <__sinit>
    62f4:	b61fe06f          	j	4e54 <_vfiprintf_r+0x48>
    62f8:	001cc683          	lbu	a3,1(s9)
    62fc:	200ded93          	or	s11,s11,512
    6300:	001c8c93          	add	s9,s9,1
    6304:	c89fe06f          	j	4f8c <_vfiprintf_r+0x180>
    6308:	001cc683          	lbu	a3,1(s9)
    630c:	020ded93          	or	s11,s11,32
    6310:	001c8c93          	add	s9,s9,1
    6314:	c79fe06f          	j	4f8c <_vfiprintf_r+0x180>
    6318:	000aa783          	lw	a5,0(s5)
    631c:	00c12703          	lw	a4,12(sp)
    6320:	004a8a93          	add	s5,s5,4
    6324:	00e7a023          	sw	a4,0(a5)
    6328:	bfdfe06f          	j	4f24 <_vfiprintf_r+0x118>
    632c:	00600793          	li	a5,6
    6330:	00070d13          	mv	s10,a4
    6334:	0ce7e863          	bltu	a5,a4,6404 <_vfiprintf_r+0x15f8>
    6338:	000d0e93          	mv	t4,s10
    633c:	00009817          	auipc	a6,0x9
    6340:	e8c80813          	add	a6,a6,-372 # f1c8 <__fini_array_end+0x33c>
    6344:	cb9fe06f          	j	4ffc <_vfiprintf_r+0x1f0>
    6348:	00000793          	li	a5,0
    634c:	00000593          	li	a1,0
    6350:	8f5ff06f          	j	5c44 <_vfiprintf_r+0xe38>
    6354:	05810713          	add	a4,sp,88
    6358:	00000693          	li	a3,0
    635c:	04c10613          	add	a2,sp,76
    6360:	00000593          	li	a1,0
    6364:	00040513          	mv	a0,s0
    6368:	01112e23          	sw	a7,28(sp)
    636c:	01012c23          	sw	a6,24(sp)
    6370:	01c12823          	sw	t3,16(sp)
    6374:	66c040ef          	jal	a9e0 <_wcsrtombs_r>
    6378:	fff00793          	li	a5,-1
    637c:	01012e03          	lw	t3,16(sp)
    6380:	01812803          	lw	a6,24(sp)
    6384:	01c12883          	lw	a7,28(sp)
    6388:	00050d13          	mv	s10,a0
    638c:	1ef50e63          	beq	a0,a5,6588 <_vfiprintf_r+0x177c>
    6390:	05012623          	sw	a6,76(sp)
    6394:	da9ff06f          	j	613c <_vfiprintf_r+0x1330>
    6398:	03012783          	lw	a5,48(sp)
    639c:	03412583          	lw	a1,52(sp)
    63a0:	00000413          	li	s0,0
    63a4:	40f989b3          	sub	s3,s3,a5
    63a8:	00078613          	mv	a2,a5
    63ac:	00098513          	mv	a0,s3
    63b0:	43c010ef          	jal	77ec <strncpy>
    63b4:	001cc783          	lbu	a5,1(s9)
    63b8:	00a00613          	li	a2,10
    63bc:	00000693          	li	a3,0
    63c0:	00f037b3          	snez	a5,a5
    63c4:	000d8513          	mv	a0,s11
    63c8:	000d0593          	mv	a1,s10
    63cc:	00fc8cb3          	add	s9,s9,a5
    63d0:	0f0050ef          	jal	b4c0 <__udivdi3>
    63d4:	e8dff06f          	j	6260 <_vfiprintf_r+0x1454>
    63d8:	00000e93          	li	t4,0
    63dc:	00012823          	sw	zero,16(sp)
    63e0:	04314783          	lbu	a5,67(sp)
    63e4:	00000713          	li	a4,0
    63e8:	00000f93          	li	t6,0
    63ec:	a0079063          	bnez	a5,55ec <_vfiprintf_r+0x7e0>
    63f0:	c19fe06f          	j	5008 <_vfiprintf_r+0x1fc>
    63f4:	00100f13          	li	t5,1
    63f8:	00000613          	li	a2,0
    63fc:	000a0c13          	mv	s8,s4
    6400:	ce9fe06f          	j	50e8 <_vfiprintf_r+0x2dc>
    6404:	00600d13          	li	s10,6
    6408:	f31ff06f          	j	6338 <_vfiprintf_r+0x152c>
    640c:	00100f13          	li	t5,1
    6410:	000a0c13          	mv	s8,s4
    6414:	c4dfe06f          	j	5060 <_vfiprintf_r+0x254>
    6418:	000aa783          	lw	a5,0(s5)
    641c:	00c12703          	lw	a4,12(sp)
    6420:	004a8a93          	add	s5,s5,4
    6424:	00e79023          	sh	a4,0(a5)
    6428:	afdfe06f          	j	4f24 <_vfiprintf_r+0x118>
    642c:	0ff7fd93          	zext.b	s11,a5
    6430:	00000d13          	li	s10,0
    6434:	a04ff06f          	j	5638 <_vfiprintf_r+0x82c>
    6438:	0ff7f793          	zext.b	a5,a5
    643c:	00000593          	li	a1,0
    6440:	bd1ff06f          	j	6010 <_vfiprintf_r+0x1204>
    6444:	0ff7f793          	zext.b	a5,a5
    6448:	00000593          	li	a1,0
    644c:	a5cff06f          	j	56a8 <_vfiprintf_r+0x89c>
    6450:	01879d93          	sll	s11,a5,0x18
    6454:	418ddd93          	sra	s11,s11,0x18
    6458:	41fddd13          	sra	s10,s11,0x1f
    645c:	000d0693          	mv	a3,s10
    6460:	95cff06f          	j	55bc <_vfiprintf_r+0x7b0>
    6464:	03000793          	li	a5,48
    6468:	c8cff06f          	j	58f4 <_vfiprintf_r+0xae8>
    646c:	00012823          	sw	zero,16(sp)
    6470:	0ac10813          	add	a6,sp,172
    6474:	cfdff06f          	j	6170 <_vfiprintf_r+0x1364>
    6478:	0589a503          	lw	a0,88(s3)
    647c:	b65fa0ef          	jal	fe0 <__retarget_lock_release_recursive>
    6480:	d51fe06f          	j	51d0 <_vfiprintf_r+0x3c4>
    6484:	00070e93          	mv	t4,a4
    6488:	00070d13          	mv	s10,a4
    648c:	f55ff06f          	j	63e0 <_vfiprintf_r+0x15d4>
    6490:	00900793          	li	a5,9
    6494:	ddb7e6e3          	bltu	a5,s11,6260 <_vfiprintf_r+0x1454>
    6498:	e19ff06f          	j	62b0 <_vfiprintf_r+0x14a4>
    649c:	00058513          	mv	a0,a1
    64a0:	00009317          	auipc	t1,0x9
    64a4:	38430313          	add	t1,t1,900 # f824 <blanks.1>
    64a8:	8cdff06f          	j	5d74 <_vfiprintf_r+0xf68>
    64ac:	00080513          	mv	a0,a6
    64b0:	03112023          	sw	a7,32(sp)
    64b4:	01012c23          	sw	a6,24(sp)
    64b8:	01b12e23          	sw	s11,28(sp)
    64bc:	da9fa0ef          	jal	1264 <strlen>
    64c0:	fff54e93          	not	t4,a0
    64c4:	41fede93          	sra	t4,t4,0x1f
    64c8:	01812803          	lw	a6,24(sp)
    64cc:	01c12e03          	lw	t3,28(sp)
    64d0:	02012883          	lw	a7,32(sp)
    64d4:	00050d13          	mv	s10,a0
    64d8:	01d57eb3          	and	t4,a0,t4
    64dc:	00012823          	sw	zero,16(sp)
    64e0:	f01ff06f          	j	63e0 <_vfiprintf_r+0x15d4>
    64e4:	06010613          	add	a2,sp,96
    64e8:	00098593          	mv	a1,s3
    64ec:	00040513          	mv	a0,s0
    64f0:	fe0fe0ef          	jal	4cd0 <__sprint_r.part.0>
    64f4:	00051463          	bnez	a0,64fc <_vfiprintf_r+0x16f0>
    64f8:	dc5fe06f          	j	52bc <_vfiprintf_r+0x4b0>
    64fc:	df5fe06f          	j	52f0 <_vfiprintf_r+0x4e4>
    6500:	00168613          	add	a2,a3,1
    6504:	00009317          	auipc	t1,0x9
    6508:	32030313          	add	t1,t1,800 # f824 <blanks.1>
    650c:	f19fe06f          	j	5424 <_vfiprintf_r+0x618>
    6510:	000f0513          	mv	a0,t5
    6514:	00009f97          	auipc	t6,0x9
    6518:	300f8f93          	add	t6,t6,768 # f814 <zeroes.0>
    651c:	d10ff06f          	j	5a2c <_vfiprintf_r+0xc20>
    6520:	0649a783          	lw	a5,100(s3)
    6524:	0017f793          	and	a5,a5,1
    6528:	00079c63          	bnez	a5,6540 <_vfiprintf_r+0x1734>
    652c:	00c9d783          	lhu	a5,12(s3)
    6530:	2007f793          	and	a5,a5,512
    6534:	00079663          	bnez	a5,6540 <_vfiprintf_r+0x1734>
    6538:	0589a503          	lw	a0,88(s3)
    653c:	aa5fa0ef          	jal	fe0 <__retarget_lock_release_recursive>
    6540:	fff00793          	li	a5,-1
    6544:	00f12623          	sw	a5,12(sp)
    6548:	de5fe06f          	j	532c <_vfiprintf_r+0x520>
    654c:	00098713          	mv	a4,s3
    6550:	000c8a93          	mv	s5,s9
    6554:	000d0993          	mv	s3,s10
    6558:	01012c03          	lw	s8,16(sp)
    655c:	01812e03          	lw	t3,24(sp)
    6560:	01c12803          	lw	a6,28(sp)
    6564:	02012883          	lw	a7,32(sp)
    6568:	000d8c93          	mv	s9,s11
    656c:	00070d13          	mv	s10,a4
    6570:	bcdff06f          	j	613c <_vfiprintf_r+0x1330>
    6574:	00cd1783          	lh	a5,12(s10)
    6578:	000d0993          	mv	s3,s10
    657c:	0407e793          	or	a5,a5,64
    6580:	00fd1623          	sh	a5,12(s10)
    6584:	d71fe06f          	j	52f4 <_vfiprintf_r+0x4e8>
    6588:	00c99783          	lh	a5,12(s3)
    658c:	0407e793          	or	a5,a5,64
    6590:	00f99623          	sh	a5,12(s3)
    6594:	d61fe06f          	j	52f4 <_vfiprintf_r+0x4e8>
    6598:	000aa703          	lw	a4,0(s5)
    659c:	004a8a93          	add	s5,s5,4
    65a0:	00075463          	bgez	a4,65a8 <_vfiprintf_r+0x179c>
    65a4:	fff00713          	li	a4,-1
    65a8:	001cc683          	lbu	a3,1(s9)
    65ac:	00058c93          	mv	s9,a1
    65b0:	9ddfe06f          	j	4f8c <_vfiprintf_r+0x180>
    65b4:	00c9d783          	lhu	a5,12(s3)
    65b8:	0407e793          	or	a5,a5,64
    65bc:	00f99623          	sh	a5,12(s3)
    65c0:	d1dfe06f          	j	52dc <_vfiprintf_r+0x4d0>

000065c4 <__sbprintf>:
    65c4:	b7010113          	add	sp,sp,-1168
    65c8:	00c59783          	lh	a5,12(a1)
    65cc:	00e5d703          	lhu	a4,14(a1)
    65d0:	48812423          	sw	s0,1160(sp)
    65d4:	00058413          	mv	s0,a1
    65d8:	000105b7          	lui	a1,0x10
    65dc:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x58d>
    65e0:	06442303          	lw	t1,100(s0)
    65e4:	01c42883          	lw	a7,28(s0)
    65e8:	02442803          	lw	a6,36(s0)
    65ec:	01071713          	sll	a4,a4,0x10
    65f0:	00b7f7b3          	and	a5,a5,a1
    65f4:	00e7e7b3          	or	a5,a5,a4
    65f8:	40000593          	li	a1,1024
    65fc:	49212023          	sw	s2,1152(sp)
    6600:	00f12a23          	sw	a5,20(sp)
    6604:	00050913          	mv	s2,a0
    6608:	07010793          	add	a5,sp,112
    660c:	06010513          	add	a0,sp,96
    6610:	48112623          	sw	ra,1164(sp)
    6614:	48912223          	sw	s1,1156(sp)
    6618:	47312e23          	sw	s3,1148(sp)
    661c:	00060493          	mv	s1,a2
    6620:	00068993          	mv	s3,a3
    6624:	06612623          	sw	t1,108(sp)
    6628:	03112223          	sw	a7,36(sp)
    662c:	03012623          	sw	a6,44(sp)
    6630:	00f12423          	sw	a5,8(sp)
    6634:	00f12c23          	sw	a5,24(sp)
    6638:	00b12823          	sw	a1,16(sp)
    663c:	00b12e23          	sw	a1,28(sp)
    6640:	02012023          	sw	zero,32(sp)
    6644:	991fa0ef          	jal	fd4 <__retarget_lock_init_recursive>
    6648:	00048613          	mv	a2,s1
    664c:	00098693          	mv	a3,s3
    6650:	00810593          	add	a1,sp,8
    6654:	00090513          	mv	a0,s2
    6658:	fb4fe0ef          	jal	4e0c <_vfiprintf_r>
    665c:	00050493          	mv	s1,a0
    6660:	04055263          	bgez	a0,66a4 <__sbprintf+0xe0>
    6664:	01415783          	lhu	a5,20(sp)
    6668:	0407f793          	and	a5,a5,64
    666c:	00078863          	beqz	a5,667c <__sbprintf+0xb8>
    6670:	00c45783          	lhu	a5,12(s0)
    6674:	0407e793          	or	a5,a5,64
    6678:	00f41623          	sh	a5,12(s0)
    667c:	06012503          	lw	a0,96(sp)
    6680:	959fa0ef          	jal	fd8 <__retarget_lock_close_recursive>
    6684:	48c12083          	lw	ra,1164(sp)
    6688:	48812403          	lw	s0,1160(sp)
    668c:	48012903          	lw	s2,1152(sp)
    6690:	47c12983          	lw	s3,1148(sp)
    6694:	00048513          	mv	a0,s1
    6698:	48412483          	lw	s1,1156(sp)
    669c:	49010113          	add	sp,sp,1168
    66a0:	00008067          	ret
    66a4:	00810593          	add	a1,sp,8
    66a8:	00090513          	mv	a0,s2
    66ac:	25c000ef          	jal	6908 <_fflush_r>
    66b0:	fa050ae3          	beqz	a0,6664 <__sbprintf+0xa0>
    66b4:	fff00493          	li	s1,-1
    66b8:	fadff06f          	j	6664 <__sbprintf+0xa0>

000066bc <__sflush_r>:
    66bc:	00c59703          	lh	a4,12(a1)
    66c0:	fe010113          	add	sp,sp,-32
    66c4:	00812c23          	sw	s0,24(sp)
    66c8:	01312623          	sw	s3,12(sp)
    66cc:	00112e23          	sw	ra,28(sp)
    66d0:	00877793          	and	a5,a4,8
    66d4:	00058413          	mv	s0,a1
    66d8:	00050993          	mv	s3,a0
    66dc:	12079063          	bnez	a5,67fc <__sflush_r+0x140>
    66e0:	000017b7          	lui	a5,0x1
    66e4:	80078793          	add	a5,a5,-2048 # 800 <main+0x4d0>
    66e8:	0045a683          	lw	a3,4(a1)
    66ec:	00f767b3          	or	a5,a4,a5
    66f0:	00f59623          	sh	a5,12(a1)
    66f4:	18d05263          	blez	a3,6878 <__sflush_r+0x1bc>
    66f8:	02842803          	lw	a6,40(s0)
    66fc:	0e080463          	beqz	a6,67e4 <__sflush_r+0x128>
    6700:	00912a23          	sw	s1,20(sp)
    6704:	01371693          	sll	a3,a4,0x13
    6708:	0009a483          	lw	s1,0(s3)
    670c:	0009a023          	sw	zero,0(s3)
    6710:	01c42583          	lw	a1,28(s0)
    6714:	1606ce63          	bltz	a3,6890 <__sflush_r+0x1d4>
    6718:	00000613          	li	a2,0
    671c:	00100693          	li	a3,1
    6720:	00098513          	mv	a0,s3
    6724:	000800e7          	jalr	a6
    6728:	fff00793          	li	a5,-1
    672c:	00050613          	mv	a2,a0
    6730:	1af50463          	beq	a0,a5,68d8 <__sflush_r+0x21c>
    6734:	00c41783          	lh	a5,12(s0)
    6738:	02842803          	lw	a6,40(s0)
    673c:	01c42583          	lw	a1,28(s0)
    6740:	0047f793          	and	a5,a5,4
    6744:	00078e63          	beqz	a5,6760 <__sflush_r+0xa4>
    6748:	00442703          	lw	a4,4(s0)
    674c:	03042783          	lw	a5,48(s0)
    6750:	40e60633          	sub	a2,a2,a4
    6754:	00078663          	beqz	a5,6760 <__sflush_r+0xa4>
    6758:	03c42783          	lw	a5,60(s0)
    675c:	40f60633          	sub	a2,a2,a5
    6760:	00000693          	li	a3,0
    6764:	00098513          	mv	a0,s3
    6768:	000800e7          	jalr	a6
    676c:	fff00793          	li	a5,-1
    6770:	12f51463          	bne	a0,a5,6898 <__sflush_r+0x1dc>
    6774:	0009a683          	lw	a3,0(s3)
    6778:	01d00793          	li	a5,29
    677c:	00c41703          	lh	a4,12(s0)
    6780:	16d7ea63          	bltu	a5,a3,68f4 <__sflush_r+0x238>
    6784:	204007b7          	lui	a5,0x20400
    6788:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    678c:	00d7d7b3          	srl	a5,a5,a3
    6790:	0017f793          	and	a5,a5,1
    6794:	16078063          	beqz	a5,68f4 <__sflush_r+0x238>
    6798:	01042603          	lw	a2,16(s0)
    679c:	fffff7b7          	lui	a5,0xfffff
    67a0:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    67a4:	00f777b3          	and	a5,a4,a5
    67a8:	00f41623          	sh	a5,12(s0)
    67ac:	00042223          	sw	zero,4(s0)
    67b0:	00c42023          	sw	a2,0(s0)
    67b4:	01371793          	sll	a5,a4,0x13
    67b8:	0007d463          	bgez	a5,67c0 <__sflush_r+0x104>
    67bc:	10068263          	beqz	a3,68c0 <__sflush_r+0x204>
    67c0:	03042583          	lw	a1,48(s0)
    67c4:	0099a023          	sw	s1,0(s3)
    67c8:	10058463          	beqz	a1,68d0 <__sflush_r+0x214>
    67cc:	04040793          	add	a5,s0,64
    67d0:	00f58663          	beq	a1,a5,67dc <__sflush_r+0x120>
    67d4:	00098513          	mv	a0,s3
    67d8:	c5dfa0ef          	jal	1434 <_free_r>
    67dc:	01412483          	lw	s1,20(sp)
    67e0:	02042823          	sw	zero,48(s0)
    67e4:	00000513          	li	a0,0
    67e8:	01c12083          	lw	ra,28(sp)
    67ec:	01812403          	lw	s0,24(sp)
    67f0:	00c12983          	lw	s3,12(sp)
    67f4:	02010113          	add	sp,sp,32
    67f8:	00008067          	ret
    67fc:	01212823          	sw	s2,16(sp)
    6800:	0105a903          	lw	s2,16(a1)
    6804:	08090263          	beqz	s2,6888 <__sflush_r+0x1cc>
    6808:	00912a23          	sw	s1,20(sp)
    680c:	0005a483          	lw	s1,0(a1)
    6810:	00377713          	and	a4,a4,3
    6814:	0125a023          	sw	s2,0(a1)
    6818:	412484b3          	sub	s1,s1,s2
    681c:	00000793          	li	a5,0
    6820:	00071463          	bnez	a4,6828 <__sflush_r+0x16c>
    6824:	0145a783          	lw	a5,20(a1)
    6828:	00f42423          	sw	a5,8(s0)
    682c:	00904863          	bgtz	s1,683c <__sflush_r+0x180>
    6830:	0540006f          	j	6884 <__sflush_r+0x1c8>
    6834:	00a90933          	add	s2,s2,a0
    6838:	04905663          	blez	s1,6884 <__sflush_r+0x1c8>
    683c:	02442783          	lw	a5,36(s0)
    6840:	01c42583          	lw	a1,28(s0)
    6844:	00048693          	mv	a3,s1
    6848:	00090613          	mv	a2,s2
    684c:	00098513          	mv	a0,s3
    6850:	000780e7          	jalr	a5
    6854:	40a484b3          	sub	s1,s1,a0
    6858:	fca04ee3          	bgtz	a0,6834 <__sflush_r+0x178>
    685c:	00c41703          	lh	a4,12(s0)
    6860:	01012903          	lw	s2,16(sp)
    6864:	04076713          	or	a4,a4,64
    6868:	01412483          	lw	s1,20(sp)
    686c:	00e41623          	sh	a4,12(s0)
    6870:	fff00513          	li	a0,-1
    6874:	f75ff06f          	j	67e8 <__sflush_r+0x12c>
    6878:	03c5a683          	lw	a3,60(a1)
    687c:	e6d04ee3          	bgtz	a3,66f8 <__sflush_r+0x3c>
    6880:	f65ff06f          	j	67e4 <__sflush_r+0x128>
    6884:	01412483          	lw	s1,20(sp)
    6888:	01012903          	lw	s2,16(sp)
    688c:	f59ff06f          	j	67e4 <__sflush_r+0x128>
    6890:	05042603          	lw	a2,80(s0)
    6894:	eadff06f          	j	6740 <__sflush_r+0x84>
    6898:	00c41703          	lh	a4,12(s0)
    689c:	01042683          	lw	a3,16(s0)
    68a0:	fffff7b7          	lui	a5,0xfffff
    68a4:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    68a8:	00f777b3          	and	a5,a4,a5
    68ac:	00f41623          	sh	a5,12(s0)
    68b0:	00042223          	sw	zero,4(s0)
    68b4:	00d42023          	sw	a3,0(s0)
    68b8:	01371793          	sll	a5,a4,0x13
    68bc:	f007d2e3          	bgez	a5,67c0 <__sflush_r+0x104>
    68c0:	03042583          	lw	a1,48(s0)
    68c4:	04a42823          	sw	a0,80(s0)
    68c8:	0099a023          	sw	s1,0(s3)
    68cc:	f00590e3          	bnez	a1,67cc <__sflush_r+0x110>
    68d0:	01412483          	lw	s1,20(sp)
    68d4:	f11ff06f          	j	67e4 <__sflush_r+0x128>
    68d8:	0009a783          	lw	a5,0(s3)
    68dc:	e4078ce3          	beqz	a5,6734 <__sflush_r+0x78>
    68e0:	01d00713          	li	a4,29
    68e4:	00e78c63          	beq	a5,a4,68fc <__sflush_r+0x240>
    68e8:	01600713          	li	a4,22
    68ec:	00e78863          	beq	a5,a4,68fc <__sflush_r+0x240>
    68f0:	00c41703          	lh	a4,12(s0)
    68f4:	04076713          	or	a4,a4,64
    68f8:	f71ff06f          	j	6868 <__sflush_r+0x1ac>
    68fc:	0099a023          	sw	s1,0(s3)
    6900:	01412483          	lw	s1,20(sp)
    6904:	ee1ff06f          	j	67e4 <__sflush_r+0x128>

00006908 <_fflush_r>:
    6908:	ff010113          	add	sp,sp,-16
    690c:	00812423          	sw	s0,8(sp)
    6910:	00912223          	sw	s1,4(sp)
    6914:	00112623          	sw	ra,12(sp)
    6918:	01212023          	sw	s2,0(sp)
    691c:	00050493          	mv	s1,a0
    6920:	00058413          	mv	s0,a1
    6924:	00050663          	beqz	a0,6930 <_fflush_r+0x28>
    6928:	03452783          	lw	a5,52(a0)
    692c:	0a078a63          	beqz	a5,69e0 <_fflush_r+0xd8>
    6930:	00c41783          	lh	a5,12(s0)
    6934:	00000913          	li	s2,0
    6938:	04078063          	beqz	a5,6978 <_fflush_r+0x70>
    693c:	06442703          	lw	a4,100(s0)
    6940:	00177713          	and	a4,a4,1
    6944:	00071663          	bnez	a4,6950 <_fflush_r+0x48>
    6948:	2007f793          	and	a5,a5,512
    694c:	04078463          	beqz	a5,6994 <_fflush_r+0x8c>
    6950:	00040593          	mv	a1,s0
    6954:	00048513          	mv	a0,s1
    6958:	d65ff0ef          	jal	66bc <__sflush_r>
    695c:	06442783          	lw	a5,100(s0)
    6960:	00050913          	mv	s2,a0
    6964:	0017f793          	and	a5,a5,1
    6968:	00079863          	bnez	a5,6978 <_fflush_r+0x70>
    696c:	00c45783          	lhu	a5,12(s0)
    6970:	2007f793          	and	a5,a5,512
    6974:	04078463          	beqz	a5,69bc <_fflush_r+0xb4>
    6978:	00c12083          	lw	ra,12(sp)
    697c:	00812403          	lw	s0,8(sp)
    6980:	00412483          	lw	s1,4(sp)
    6984:	00090513          	mv	a0,s2
    6988:	00012903          	lw	s2,0(sp)
    698c:	01010113          	add	sp,sp,16
    6990:	00008067          	ret
    6994:	05842503          	lw	a0,88(s0)
    6998:	e44fa0ef          	jal	fdc <__retarget_lock_acquire_recursive>
    699c:	00040593          	mv	a1,s0
    69a0:	00048513          	mv	a0,s1
    69a4:	d19ff0ef          	jal	66bc <__sflush_r>
    69a8:	06442783          	lw	a5,100(s0)
    69ac:	00050913          	mv	s2,a0
    69b0:	0017f793          	and	a5,a5,1
    69b4:	fc0792e3          	bnez	a5,6978 <_fflush_r+0x70>
    69b8:	fb5ff06f          	j	696c <_fflush_r+0x64>
    69bc:	05842503          	lw	a0,88(s0)
    69c0:	e20fa0ef          	jal	fe0 <__retarget_lock_release_recursive>
    69c4:	00c12083          	lw	ra,12(sp)
    69c8:	00812403          	lw	s0,8(sp)
    69cc:	00412483          	lw	s1,4(sp)
    69d0:	00090513          	mv	a0,s2
    69d4:	00012903          	lw	s2,0(sp)
    69d8:	01010113          	add	sp,sp,16
    69dc:	00008067          	ret
    69e0:	224000ef          	jal	6c04 <__sinit>
    69e4:	f4dff06f          	j	6930 <_fflush_r+0x28>

000069e8 <stdio_exit_handler>:
    69e8:	7fffa617          	auipc	a2,0x7fffa
    69ec:	b4060613          	add	a2,a2,-1216 # 80000528 <__sglue>
    69f0:	00004597          	auipc	a1,0x4
    69f4:	00058593          	mv	a1,a1
    69f8:	7fff9517          	auipc	a0,0x7fff9
    69fc:	60850513          	add	a0,a0,1544 # 80000000 <_impure_data>
    6a00:	7a00006f          	j	71a0 <_fwalk_sglue>

00006a04 <cleanup_stdio>:
    6a04:	00452583          	lw	a1,4(a0)
    6a08:	ff010113          	add	sp,sp,-16
    6a0c:	00812423          	sw	s0,8(sp)
    6a10:	00112623          	sw	ra,12(sp)
    6a14:	7fffb797          	auipc	a5,0x7fffb
    6a18:	e4878793          	add	a5,a5,-440 # 8000185c <__sf>
    6a1c:	00050413          	mv	s0,a0
    6a20:	00f58463          	beq	a1,a5,6a28 <cleanup_stdio+0x24>
    6a24:	7cd030ef          	jal	a9f0 <_fclose_r>
    6a28:	00842583          	lw	a1,8(s0)
    6a2c:	7fffb797          	auipc	a5,0x7fffb
    6a30:	e9878793          	add	a5,a5,-360 # 800018c4 <__sf+0x68>
    6a34:	00f58663          	beq	a1,a5,6a40 <cleanup_stdio+0x3c>
    6a38:	00040513          	mv	a0,s0
    6a3c:	7b5030ef          	jal	a9f0 <_fclose_r>
    6a40:	00c42583          	lw	a1,12(s0)
    6a44:	7fffb797          	auipc	a5,0x7fffb
    6a48:	ee878793          	add	a5,a5,-280 # 8000192c <__sf+0xd0>
    6a4c:	00f58c63          	beq	a1,a5,6a64 <cleanup_stdio+0x60>
    6a50:	00040513          	mv	a0,s0
    6a54:	00812403          	lw	s0,8(sp)
    6a58:	00c12083          	lw	ra,12(sp)
    6a5c:	01010113          	add	sp,sp,16
    6a60:	7910306f          	j	a9f0 <_fclose_r>
    6a64:	00c12083          	lw	ra,12(sp)
    6a68:	00812403          	lw	s0,8(sp)
    6a6c:	01010113          	add	sp,sp,16
    6a70:	00008067          	ret

00006a74 <global_stdio_init.part.0>:
    6a74:	fe010113          	add	sp,sp,-32
    6a78:	00000797          	auipc	a5,0x0
    6a7c:	f7078793          	add	a5,a5,-144 # 69e8 <stdio_exit_handler>
    6a80:	00112e23          	sw	ra,28(sp)
    6a84:	00812c23          	sw	s0,24(sp)
    6a88:	00912a23          	sw	s1,20(sp)
    6a8c:	7fffb417          	auipc	s0,0x7fffb
    6a90:	dd040413          	add	s0,s0,-560 # 8000185c <__sf>
    6a94:	01212823          	sw	s2,16(sp)
    6a98:	01312623          	sw	s3,12(sp)
    6a9c:	01412423          	sw	s4,8(sp)
    6aa0:	00800613          	li	a2,8
    6aa4:	00000593          	li	a1,0
    6aa8:	7fffa717          	auipc	a4,0x7fffa
    6aac:	c8f72423          	sw	a5,-888(a4) # 80000730 <__stdio_exit_handler>
    6ab0:	7fffb517          	auipc	a0,0x7fffb
    6ab4:	e0850513          	add	a0,a0,-504 # 800018b8 <__sf+0x5c>
    6ab8:	00400793          	li	a5,4
    6abc:	00f42623          	sw	a5,12(s0)
    6ac0:	00042023          	sw	zero,0(s0)
    6ac4:	00042223          	sw	zero,4(s0)
    6ac8:	00042423          	sw	zero,8(s0)
    6acc:	06042223          	sw	zero,100(s0)
    6ad0:	00042823          	sw	zero,16(s0)
    6ad4:	00042a23          	sw	zero,20(s0)
    6ad8:	00042c23          	sw	zero,24(s0)
    6adc:	d08fa0ef          	jal	fe4 <memset>
    6ae0:	00000a17          	auipc	s4,0x0
    6ae4:	774a0a13          	add	s4,s4,1908 # 7254 <__sread>
    6ae8:	00000997          	auipc	s3,0x0
    6aec:	7c898993          	add	s3,s3,1992 # 72b0 <__swrite>
    6af0:	00001917          	auipc	s2,0x1
    6af4:	84890913          	add	s2,s2,-1976 # 7338 <__sseek>
    6af8:	00001497          	auipc	s1,0x1
    6afc:	8b848493          	add	s1,s1,-1864 # 73b0 <__sclose>
    6b00:	7fffb517          	auipc	a0,0x7fffb
    6b04:	db450513          	add	a0,a0,-588 # 800018b4 <__sf+0x58>
    6b08:	03442023          	sw	s4,32(s0)
    6b0c:	03342223          	sw	s3,36(s0)
    6b10:	03242423          	sw	s2,40(s0)
    6b14:	02942623          	sw	s1,44(s0)
    6b18:	00842e23          	sw	s0,28(s0)
    6b1c:	cb8fa0ef          	jal	fd4 <__retarget_lock_init_recursive>
    6b20:	000107b7          	lui	a5,0x10
    6b24:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x599>
    6b28:	00800613          	li	a2,8
    6b2c:	00000593          	li	a1,0
    6b30:	7fffb517          	auipc	a0,0x7fffb
    6b34:	df050513          	add	a0,a0,-528 # 80001920 <__sf+0xc4>
    6b38:	06f42a23          	sw	a5,116(s0)
    6b3c:	06042423          	sw	zero,104(s0)
    6b40:	06042623          	sw	zero,108(s0)
    6b44:	06042823          	sw	zero,112(s0)
    6b48:	0c042623          	sw	zero,204(s0)
    6b4c:	06042c23          	sw	zero,120(s0)
    6b50:	06042e23          	sw	zero,124(s0)
    6b54:	08042023          	sw	zero,128(s0)
    6b58:	c8cfa0ef          	jal	fe4 <memset>
    6b5c:	7fffb797          	auipc	a5,0x7fffb
    6b60:	d6878793          	add	a5,a5,-664 # 800018c4 <__sf+0x68>
    6b64:	7fffb517          	auipc	a0,0x7fffb
    6b68:	db850513          	add	a0,a0,-584 # 8000191c <__sf+0xc0>
    6b6c:	08f42223          	sw	a5,132(s0)
    6b70:	09442423          	sw	s4,136(s0)
    6b74:	09342623          	sw	s3,140(s0)
    6b78:	09242823          	sw	s2,144(s0)
    6b7c:	08942a23          	sw	s1,148(s0)
    6b80:	c54fa0ef          	jal	fd4 <__retarget_lock_init_recursive>
    6b84:	000207b7          	lui	a5,0x20
    6b88:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6b8c:	00800613          	li	a2,8
    6b90:	00000593          	li	a1,0
    6b94:	7fffb517          	auipc	a0,0x7fffb
    6b98:	df450513          	add	a0,a0,-524 # 80001988 <__sf+0x12c>
    6b9c:	0cf42e23          	sw	a5,220(s0)
    6ba0:	0c042823          	sw	zero,208(s0)
    6ba4:	0c042a23          	sw	zero,212(s0)
    6ba8:	0c042c23          	sw	zero,216(s0)
    6bac:	12042a23          	sw	zero,308(s0)
    6bb0:	0e042023          	sw	zero,224(s0)
    6bb4:	0e042223          	sw	zero,228(s0)
    6bb8:	0e042423          	sw	zero,232(s0)
    6bbc:	c28fa0ef          	jal	fe4 <memset>
    6bc0:	7fffb797          	auipc	a5,0x7fffb
    6bc4:	d6c78793          	add	a5,a5,-660 # 8000192c <__sf+0xd0>
    6bc8:	0f442823          	sw	s4,240(s0)
    6bcc:	0f342a23          	sw	s3,244(s0)
    6bd0:	0f242c23          	sw	s2,248(s0)
    6bd4:	0e942e23          	sw	s1,252(s0)
    6bd8:	0ef42623          	sw	a5,236(s0)
    6bdc:	01812403          	lw	s0,24(sp)
    6be0:	01c12083          	lw	ra,28(sp)
    6be4:	01412483          	lw	s1,20(sp)
    6be8:	01012903          	lw	s2,16(sp)
    6bec:	00c12983          	lw	s3,12(sp)
    6bf0:	00812a03          	lw	s4,8(sp)
    6bf4:	7fffb517          	auipc	a0,0x7fffb
    6bf8:	d9050513          	add	a0,a0,-624 # 80001984 <__sf+0x128>
    6bfc:	02010113          	add	sp,sp,32
    6c00:	bd4fa06f          	j	fd4 <__retarget_lock_init_recursive>

00006c04 <__sinit>:
    6c04:	ff010113          	add	sp,sp,-16
    6c08:	00812423          	sw	s0,8(sp)
    6c0c:	00050413          	mv	s0,a0
    6c10:	7fffa517          	auipc	a0,0x7fffa
    6c14:	b1050513          	add	a0,a0,-1264 # 80000720 <__lock___sfp_recursive_mutex>
    6c18:	00112623          	sw	ra,12(sp)
    6c1c:	bc0fa0ef          	jal	fdc <__retarget_lock_acquire_recursive>
    6c20:	03442783          	lw	a5,52(s0)
    6c24:	00079e63          	bnez	a5,6c40 <__sinit+0x3c>
    6c28:	00000797          	auipc	a5,0x0
    6c2c:	ddc78793          	add	a5,a5,-548 # 6a04 <cleanup_stdio>
    6c30:	02f42a23          	sw	a5,52(s0)
    6c34:	7fffa797          	auipc	a5,0x7fffa
    6c38:	afc7a783          	lw	a5,-1284(a5) # 80000730 <__stdio_exit_handler>
    6c3c:	00078e63          	beqz	a5,6c58 <__sinit+0x54>
    6c40:	00812403          	lw	s0,8(sp)
    6c44:	00c12083          	lw	ra,12(sp)
    6c48:	7fffa517          	auipc	a0,0x7fffa
    6c4c:	ad850513          	add	a0,a0,-1320 # 80000720 <__lock___sfp_recursive_mutex>
    6c50:	01010113          	add	sp,sp,16
    6c54:	b8cfa06f          	j	fe0 <__retarget_lock_release_recursive>
    6c58:	e1dff0ef          	jal	6a74 <global_stdio_init.part.0>
    6c5c:	00812403          	lw	s0,8(sp)
    6c60:	00c12083          	lw	ra,12(sp)
    6c64:	7fffa517          	auipc	a0,0x7fffa
    6c68:	abc50513          	add	a0,a0,-1348 # 80000720 <__lock___sfp_recursive_mutex>
    6c6c:	01010113          	add	sp,sp,16
    6c70:	b70fa06f          	j	fe0 <__retarget_lock_release_recursive>

00006c74 <__sfp_lock_acquire>:
    6c74:	7fffa517          	auipc	a0,0x7fffa
    6c78:	aac50513          	add	a0,a0,-1364 # 80000720 <__lock___sfp_recursive_mutex>
    6c7c:	b60fa06f          	j	fdc <__retarget_lock_acquire_recursive>

00006c80 <__sfp_lock_release>:
    6c80:	7fffa517          	auipc	a0,0x7fffa
    6c84:	aa050513          	add	a0,a0,-1376 # 80000720 <__lock___sfp_recursive_mutex>
    6c88:	b58fa06f          	j	fe0 <__retarget_lock_release_recursive>

00006c8c <__sfvwrite_r>:
    6c8c:	00862783          	lw	a5,8(a2)
    6c90:	2c078463          	beqz	a5,6f58 <__sfvwrite_r+0x2cc>
    6c94:	00c59683          	lh	a3,12(a1) # a9fc <_fclose_r+0xc>
    6c98:	fd010113          	add	sp,sp,-48
    6c9c:	02812423          	sw	s0,40(sp)
    6ca0:	01412c23          	sw	s4,24(sp)
    6ca4:	01612823          	sw	s6,16(sp)
    6ca8:	02112623          	sw	ra,44(sp)
    6cac:	0086f793          	and	a5,a3,8
    6cb0:	00060b13          	mv	s6,a2
    6cb4:	00050a13          	mv	s4,a0
    6cb8:	00058413          	mv	s0,a1
    6cbc:	08078e63          	beqz	a5,6d58 <__sfvwrite_r+0xcc>
    6cc0:	0105a783          	lw	a5,16(a1)
    6cc4:	08078a63          	beqz	a5,6d58 <__sfvwrite_r+0xcc>
    6cc8:	02912223          	sw	s1,36(sp)
    6ccc:	03212023          	sw	s2,32(sp)
    6cd0:	01312e23          	sw	s3,28(sp)
    6cd4:	01512a23          	sw	s5,20(sp)
    6cd8:	0026f793          	and	a5,a3,2
    6cdc:	000b2483          	lw	s1,0(s6)
    6ce0:	0a078463          	beqz	a5,6d88 <__sfvwrite_r+0xfc>
    6ce4:	02442783          	lw	a5,36(s0)
    6ce8:	01c42583          	lw	a1,28(s0)
    6cec:	80000ab7          	lui	s5,0x80000
    6cf0:	00000993          	li	s3,0
    6cf4:	00000913          	li	s2,0
    6cf8:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6cfc:	00098613          	mv	a2,s3
    6d00:	000a0513          	mv	a0,s4
    6d04:	04090263          	beqz	s2,6d48 <__sfvwrite_r+0xbc>
    6d08:	00090693          	mv	a3,s2
    6d0c:	012af463          	bgeu	s5,s2,6d14 <__sfvwrite_r+0x88>
    6d10:	000a8693          	mv	a3,s5
    6d14:	000780e7          	jalr	a5
    6d18:	46a05263          	blez	a0,717c <__sfvwrite_r+0x4f0>
    6d1c:	008b2783          	lw	a5,8(s6)
    6d20:	00a989b3          	add	s3,s3,a0
    6d24:	40a90933          	sub	s2,s2,a0
    6d28:	40a787b3          	sub	a5,a5,a0
    6d2c:	00fb2423          	sw	a5,8(s6)
    6d30:	1a078663          	beqz	a5,6edc <__sfvwrite_r+0x250>
    6d34:	02442783          	lw	a5,36(s0)
    6d38:	01c42583          	lw	a1,28(s0)
    6d3c:	00098613          	mv	a2,s3
    6d40:	000a0513          	mv	a0,s4
    6d44:	fc0912e3          	bnez	s2,6d08 <__sfvwrite_r+0x7c>
    6d48:	0004a983          	lw	s3,0(s1)
    6d4c:	0044a903          	lw	s2,4(s1)
    6d50:	00848493          	add	s1,s1,8
    6d54:	fa9ff06f          	j	6cfc <__sfvwrite_r+0x70>
    6d58:	00040593          	mv	a1,s0
    6d5c:	000a0513          	mv	a0,s4
    6d60:	658000ef          	jal	73b8 <__swsetup_r>
    6d64:	1c051c63          	bnez	a0,6f3c <__sfvwrite_r+0x2b0>
    6d68:	00c41683          	lh	a3,12(s0)
    6d6c:	02912223          	sw	s1,36(sp)
    6d70:	03212023          	sw	s2,32(sp)
    6d74:	01312e23          	sw	s3,28(sp)
    6d78:	01512a23          	sw	s5,20(sp)
    6d7c:	0026f793          	and	a5,a3,2
    6d80:	000b2483          	lw	s1,0(s6)
    6d84:	f60790e3          	bnez	a5,6ce4 <__sfvwrite_r+0x58>
    6d88:	01712623          	sw	s7,12(sp)
    6d8c:	01812423          	sw	s8,8(sp)
    6d90:	0016f793          	and	a5,a3,1
    6d94:	1c079663          	bnez	a5,6f60 <__sfvwrite_r+0x2d4>
    6d98:	00042783          	lw	a5,0(s0)
    6d9c:	00842703          	lw	a4,8(s0)
    6da0:	80000ab7          	lui	s5,0x80000
    6da4:	01912223          	sw	s9,4(sp)
    6da8:	00000b93          	li	s7,0
    6dac:	00000993          	li	s3,0
    6db0:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6db4:	00078513          	mv	a0,a5
    6db8:	00070c13          	mv	s8,a4
    6dbc:	10098263          	beqz	s3,6ec0 <__sfvwrite_r+0x234>
    6dc0:	2006f613          	and	a2,a3,512
    6dc4:	28060863          	beqz	a2,7054 <__sfvwrite_r+0x3c8>
    6dc8:	00070c93          	mv	s9,a4
    6dcc:	32e9e863          	bltu	s3,a4,70fc <__sfvwrite_r+0x470>
    6dd0:	4806f713          	and	a4,a3,1152
    6dd4:	08070a63          	beqz	a4,6e68 <__sfvwrite_r+0x1dc>
    6dd8:	01442603          	lw	a2,20(s0)
    6ddc:	01042583          	lw	a1,16(s0)
    6de0:	00161713          	sll	a4,a2,0x1
    6de4:	00c70733          	add	a4,a4,a2
    6de8:	40b78933          	sub	s2,a5,a1
    6dec:	01f75c13          	srl	s8,a4,0x1f
    6df0:	00ec0c33          	add	s8,s8,a4
    6df4:	00190793          	add	a5,s2,1
    6df8:	401c5c13          	sra	s8,s8,0x1
    6dfc:	013787b3          	add	a5,a5,s3
    6e00:	000c0613          	mv	a2,s8
    6e04:	00fc7663          	bgeu	s8,a5,6e10 <__sfvwrite_r+0x184>
    6e08:	00078c13          	mv	s8,a5
    6e0c:	00078613          	mv	a2,a5
    6e10:	4006f693          	and	a3,a3,1024
    6e14:	32068063          	beqz	a3,7134 <__sfvwrite_r+0x4a8>
    6e18:	00060593          	mv	a1,a2
    6e1c:	000a0513          	mv	a0,s4
    6e20:	921fa0ef          	jal	1740 <_malloc_r>
    6e24:	00050c93          	mv	s9,a0
    6e28:	34050e63          	beqz	a0,7184 <__sfvwrite_r+0x4f8>
    6e2c:	01042583          	lw	a1,16(s0)
    6e30:	00090613          	mv	a2,s2
    6e34:	a8cfa0ef          	jal	10c0 <memcpy>
    6e38:	00c45783          	lhu	a5,12(s0)
    6e3c:	b7f7f793          	and	a5,a5,-1153
    6e40:	0807e793          	or	a5,a5,128
    6e44:	00f41623          	sh	a5,12(s0)
    6e48:	012c8533          	add	a0,s9,s2
    6e4c:	412c07b3          	sub	a5,s8,s2
    6e50:	01942823          	sw	s9,16(s0)
    6e54:	01842a23          	sw	s8,20(s0)
    6e58:	00a42023          	sw	a0,0(s0)
    6e5c:	00098c13          	mv	s8,s3
    6e60:	00f42423          	sw	a5,8(s0)
    6e64:	00098c93          	mv	s9,s3
    6e68:	000c8613          	mv	a2,s9
    6e6c:	000b8593          	mv	a1,s7
    6e70:	41d000ef          	jal	7a8c <memmove>
    6e74:	00842703          	lw	a4,8(s0)
    6e78:	00042783          	lw	a5,0(s0)
    6e7c:	00098913          	mv	s2,s3
    6e80:	41870733          	sub	a4,a4,s8
    6e84:	019787b3          	add	a5,a5,s9
    6e88:	00e42423          	sw	a4,8(s0)
    6e8c:	00f42023          	sw	a5,0(s0)
    6e90:	00000993          	li	s3,0
    6e94:	008b2783          	lw	a5,8(s6)
    6e98:	012b8bb3          	add	s7,s7,s2
    6e9c:	412787b3          	sub	a5,a5,s2
    6ea0:	00fb2423          	sw	a5,8(s6)
    6ea4:	02078663          	beqz	a5,6ed0 <__sfvwrite_r+0x244>
    6ea8:	00042783          	lw	a5,0(s0)
    6eac:	00842703          	lw	a4,8(s0)
    6eb0:	00c41683          	lh	a3,12(s0)
    6eb4:	00078513          	mv	a0,a5
    6eb8:	00070c13          	mv	s8,a4
    6ebc:	f00992e3          	bnez	s3,6dc0 <__sfvwrite_r+0x134>
    6ec0:	0004ab83          	lw	s7,0(s1)
    6ec4:	0044a983          	lw	s3,4(s1)
    6ec8:	00848493          	add	s1,s1,8
    6ecc:	ee9ff06f          	j	6db4 <__sfvwrite_r+0x128>
    6ed0:	00c12b83          	lw	s7,12(sp)
    6ed4:	00812c03          	lw	s8,8(sp)
    6ed8:	00412c83          	lw	s9,4(sp)
    6edc:	02c12083          	lw	ra,44(sp)
    6ee0:	02812403          	lw	s0,40(sp)
    6ee4:	02412483          	lw	s1,36(sp)
    6ee8:	02012903          	lw	s2,32(sp)
    6eec:	01c12983          	lw	s3,28(sp)
    6ef0:	01412a83          	lw	s5,20(sp)
    6ef4:	01812a03          	lw	s4,24(sp)
    6ef8:	01012b03          	lw	s6,16(sp)
    6efc:	00000513          	li	a0,0
    6f00:	03010113          	add	sp,sp,48
    6f04:	00008067          	ret
    6f08:	00040593          	mv	a1,s0
    6f0c:	000a0513          	mv	a0,s4
    6f10:	9f9ff0ef          	jal	6908 <_fflush_r>
    6f14:	0a050e63          	beqz	a0,6fd0 <__sfvwrite_r+0x344>
    6f18:	00c41783          	lh	a5,12(s0)
    6f1c:	00c12b83          	lw	s7,12(sp)
    6f20:	00812c03          	lw	s8,8(sp)
    6f24:	02412483          	lw	s1,36(sp)
    6f28:	02012903          	lw	s2,32(sp)
    6f2c:	01c12983          	lw	s3,28(sp)
    6f30:	01412a83          	lw	s5,20(sp)
    6f34:	0407e793          	or	a5,a5,64
    6f38:	00f41623          	sh	a5,12(s0)
    6f3c:	02c12083          	lw	ra,44(sp)
    6f40:	02812403          	lw	s0,40(sp)
    6f44:	01812a03          	lw	s4,24(sp)
    6f48:	01012b03          	lw	s6,16(sp)
    6f4c:	fff00513          	li	a0,-1
    6f50:	03010113          	add	sp,sp,48
    6f54:	00008067          	ret
    6f58:	00000513          	li	a0,0
    6f5c:	00008067          	ret
    6f60:	00000a93          	li	s5,0
    6f64:	00000513          	li	a0,0
    6f68:	00000c13          	li	s8,0
    6f6c:	00000993          	li	s3,0
    6f70:	08098263          	beqz	s3,6ff4 <__sfvwrite_r+0x368>
    6f74:	08050a63          	beqz	a0,7008 <__sfvwrite_r+0x37c>
    6f78:	000a8793          	mv	a5,s5
    6f7c:	00098b93          	mv	s7,s3
    6f80:	0137f463          	bgeu	a5,s3,6f88 <__sfvwrite_r+0x2fc>
    6f84:	00078b93          	mv	s7,a5
    6f88:	00042503          	lw	a0,0(s0)
    6f8c:	01042783          	lw	a5,16(s0)
    6f90:	00842903          	lw	s2,8(s0)
    6f94:	01442683          	lw	a3,20(s0)
    6f98:	00a7f663          	bgeu	a5,a0,6fa4 <__sfvwrite_r+0x318>
    6f9c:	00d90933          	add	s2,s2,a3
    6fa0:	09794463          	blt	s2,s7,7028 <__sfvwrite_r+0x39c>
    6fa4:	16dbc263          	blt	s7,a3,7108 <__sfvwrite_r+0x47c>
    6fa8:	02442783          	lw	a5,36(s0)
    6fac:	01c42583          	lw	a1,28(s0)
    6fb0:	000c0613          	mv	a2,s8
    6fb4:	000a0513          	mv	a0,s4
    6fb8:	000780e7          	jalr	a5
    6fbc:	00050913          	mv	s2,a0
    6fc0:	f4a05ce3          	blez	a0,6f18 <__sfvwrite_r+0x28c>
    6fc4:	412a8ab3          	sub	s5,s5,s2
    6fc8:	00100513          	li	a0,1
    6fcc:	f20a8ee3          	beqz	s5,6f08 <__sfvwrite_r+0x27c>
    6fd0:	008b2783          	lw	a5,8(s6)
    6fd4:	012c0c33          	add	s8,s8,s2
    6fd8:	412989b3          	sub	s3,s3,s2
    6fdc:	412787b3          	sub	a5,a5,s2
    6fe0:	00fb2423          	sw	a5,8(s6)
    6fe4:	f80796e3          	bnez	a5,6f70 <__sfvwrite_r+0x2e4>
    6fe8:	00c12b83          	lw	s7,12(sp)
    6fec:	00812c03          	lw	s8,8(sp)
    6ff0:	eedff06f          	j	6edc <__sfvwrite_r+0x250>
    6ff4:	0044a983          	lw	s3,4(s1)
    6ff8:	00048793          	mv	a5,s1
    6ffc:	00848493          	add	s1,s1,8
    7000:	fe098ae3          	beqz	s3,6ff4 <__sfvwrite_r+0x368>
    7004:	0007ac03          	lw	s8,0(a5)
    7008:	00098613          	mv	a2,s3
    700c:	00a00593          	li	a1,10
    7010:	000c0513          	mv	a0,s8
    7014:	714000ef          	jal	7728 <memchr>
    7018:	14050c63          	beqz	a0,7170 <__sfvwrite_r+0x4e4>
    701c:	00150513          	add	a0,a0,1
    7020:	41850ab3          	sub	s5,a0,s8
    7024:	f55ff06f          	j	6f78 <__sfvwrite_r+0x2ec>
    7028:	000c0593          	mv	a1,s8
    702c:	00090613          	mv	a2,s2
    7030:	25d000ef          	jal	7a8c <memmove>
    7034:	00042783          	lw	a5,0(s0)
    7038:	00040593          	mv	a1,s0
    703c:	000a0513          	mv	a0,s4
    7040:	012787b3          	add	a5,a5,s2
    7044:	00f42023          	sw	a5,0(s0)
    7048:	8c1ff0ef          	jal	6908 <_fflush_r>
    704c:	f6050ce3          	beqz	a0,6fc4 <__sfvwrite_r+0x338>
    7050:	ec9ff06f          	j	6f18 <__sfvwrite_r+0x28c>
    7054:	01042683          	lw	a3,16(s0)
    7058:	04f6e463          	bltu	a3,a5,70a0 <__sfvwrite_r+0x414>
    705c:	01442583          	lw	a1,20(s0)
    7060:	04b9e063          	bltu	s3,a1,70a0 <__sfvwrite_r+0x414>
    7064:	00098913          	mv	s2,s3
    7068:	013af463          	bgeu	s5,s3,7070 <__sfvwrite_r+0x3e4>
    706c:	000a8913          	mv	s2,s5
    7070:	00090513          	mv	a0,s2
    7074:	561070ef          	jal	edd4 <__modsi3>
    7078:	02442783          	lw	a5,36(s0)
    707c:	01c42583          	lw	a1,28(s0)
    7080:	40a906b3          	sub	a3,s2,a0
    7084:	000b8613          	mv	a2,s7
    7088:	000a0513          	mv	a0,s4
    708c:	000780e7          	jalr	a5
    7090:	00050913          	mv	s2,a0
    7094:	04a05a63          	blez	a0,70e8 <__sfvwrite_r+0x45c>
    7098:	412989b3          	sub	s3,s3,s2
    709c:	df9ff06f          	j	6e94 <__sfvwrite_r+0x208>
    70a0:	00070913          	mv	s2,a4
    70a4:	00e9f463          	bgeu	s3,a4,70ac <__sfvwrite_r+0x420>
    70a8:	00098913          	mv	s2,s3
    70ac:	00078513          	mv	a0,a5
    70b0:	00090613          	mv	a2,s2
    70b4:	000b8593          	mv	a1,s7
    70b8:	1d5000ef          	jal	7a8c <memmove>
    70bc:	00842703          	lw	a4,8(s0)
    70c0:	00042783          	lw	a5,0(s0)
    70c4:	41270733          	sub	a4,a4,s2
    70c8:	012787b3          	add	a5,a5,s2
    70cc:	00e42423          	sw	a4,8(s0)
    70d0:	00f42023          	sw	a5,0(s0)
    70d4:	fc0712e3          	bnez	a4,7098 <__sfvwrite_r+0x40c>
    70d8:	00040593          	mv	a1,s0
    70dc:	000a0513          	mv	a0,s4
    70e0:	829ff0ef          	jal	6908 <_fflush_r>
    70e4:	fa050ae3          	beqz	a0,7098 <__sfvwrite_r+0x40c>
    70e8:	00c41783          	lh	a5,12(s0)
    70ec:	00c12b83          	lw	s7,12(sp)
    70f0:	00812c03          	lw	s8,8(sp)
    70f4:	00412c83          	lw	s9,4(sp)
    70f8:	e2dff06f          	j	6f24 <__sfvwrite_r+0x298>
    70fc:	00098c13          	mv	s8,s3
    7100:	00098c93          	mv	s9,s3
    7104:	d65ff06f          	j	6e68 <__sfvwrite_r+0x1dc>
    7108:	000b8613          	mv	a2,s7
    710c:	000c0593          	mv	a1,s8
    7110:	17d000ef          	jal	7a8c <memmove>
    7114:	00842703          	lw	a4,8(s0)
    7118:	00042783          	lw	a5,0(s0)
    711c:	000b8913          	mv	s2,s7
    7120:	41770733          	sub	a4,a4,s7
    7124:	017787b3          	add	a5,a5,s7
    7128:	00e42423          	sw	a4,8(s0)
    712c:	00f42023          	sw	a5,0(s0)
    7130:	e95ff06f          	j	6fc4 <__sfvwrite_r+0x338>
    7134:	000a0513          	mv	a0,s4
    7138:	27c030ef          	jal	a3b4 <_realloc_r>
    713c:	00050c93          	mv	s9,a0
    7140:	d00514e3          	bnez	a0,6e48 <__sfvwrite_r+0x1bc>
    7144:	01042583          	lw	a1,16(s0)
    7148:	000a0513          	mv	a0,s4
    714c:	ae8fa0ef          	jal	1434 <_free_r>
    7150:	00c41783          	lh	a5,12(s0)
    7154:	00c00713          	li	a4,12
    7158:	00c12b83          	lw	s7,12(sp)
    715c:	00812c03          	lw	s8,8(sp)
    7160:	00412c83          	lw	s9,4(sp)
    7164:	00ea2023          	sw	a4,0(s4)
    7168:	f7f7f793          	and	a5,a5,-129
    716c:	db9ff06f          	j	6f24 <__sfvwrite_r+0x298>
    7170:	00198793          	add	a5,s3,1
    7174:	00078a93          	mv	s5,a5
    7178:	e05ff06f          	j	6f7c <__sfvwrite_r+0x2f0>
    717c:	00c41783          	lh	a5,12(s0)
    7180:	da5ff06f          	j	6f24 <__sfvwrite_r+0x298>
    7184:	00c00713          	li	a4,12
    7188:	00c41783          	lh	a5,12(s0)
    718c:	00c12b83          	lw	s7,12(sp)
    7190:	00812c03          	lw	s8,8(sp)
    7194:	00412c83          	lw	s9,4(sp)
    7198:	00ea2023          	sw	a4,0(s4)
    719c:	d89ff06f          	j	6f24 <__sfvwrite_r+0x298>

000071a0 <_fwalk_sglue>:
    71a0:	fd010113          	add	sp,sp,-48
    71a4:	03212023          	sw	s2,32(sp)
    71a8:	01312e23          	sw	s3,28(sp)
    71ac:	01412c23          	sw	s4,24(sp)
    71b0:	01512a23          	sw	s5,20(sp)
    71b4:	01612823          	sw	s6,16(sp)
    71b8:	01712623          	sw	s7,12(sp)
    71bc:	02112623          	sw	ra,44(sp)
    71c0:	02812423          	sw	s0,40(sp)
    71c4:	02912223          	sw	s1,36(sp)
    71c8:	00050b13          	mv	s6,a0
    71cc:	00058b93          	mv	s7,a1
    71d0:	00060a93          	mv	s5,a2
    71d4:	00000a13          	li	s4,0
    71d8:	00100993          	li	s3,1
    71dc:	fff00913          	li	s2,-1
    71e0:	004aa483          	lw	s1,4(s5)
    71e4:	008aa403          	lw	s0,8(s5)
    71e8:	fff48493          	add	s1,s1,-1
    71ec:	0204c863          	bltz	s1,721c <_fwalk_sglue+0x7c>
    71f0:	00c45783          	lhu	a5,12(s0)
    71f4:	00f9fe63          	bgeu	s3,a5,7210 <_fwalk_sglue+0x70>
    71f8:	00e41783          	lh	a5,14(s0)
    71fc:	00040593          	mv	a1,s0
    7200:	000b0513          	mv	a0,s6
    7204:	01278663          	beq	a5,s2,7210 <_fwalk_sglue+0x70>
    7208:	000b80e7          	jalr	s7
    720c:	00aa6a33          	or	s4,s4,a0
    7210:	fff48493          	add	s1,s1,-1
    7214:	06840413          	add	s0,s0,104
    7218:	fd249ce3          	bne	s1,s2,71f0 <_fwalk_sglue+0x50>
    721c:	000aaa83          	lw	s5,0(s5)
    7220:	fc0a90e3          	bnez	s5,71e0 <_fwalk_sglue+0x40>
    7224:	02c12083          	lw	ra,44(sp)
    7228:	02812403          	lw	s0,40(sp)
    722c:	02412483          	lw	s1,36(sp)
    7230:	02012903          	lw	s2,32(sp)
    7234:	01c12983          	lw	s3,28(sp)
    7238:	01412a83          	lw	s5,20(sp)
    723c:	01012b03          	lw	s6,16(sp)
    7240:	00c12b83          	lw	s7,12(sp)
    7244:	000a0513          	mv	a0,s4
    7248:	01812a03          	lw	s4,24(sp)
    724c:	03010113          	add	sp,sp,48
    7250:	00008067          	ret

00007254 <__sread>:
    7254:	ff010113          	add	sp,sp,-16
    7258:	00812423          	sw	s0,8(sp)
    725c:	00058413          	mv	s0,a1
    7260:	00e59583          	lh	a1,14(a1)
    7264:	00112623          	sw	ra,12(sp)
    7268:	704000ef          	jal	796c <_read_r>
    726c:	02054063          	bltz	a0,728c <__sread+0x38>
    7270:	05042783          	lw	a5,80(s0)
    7274:	00c12083          	lw	ra,12(sp)
    7278:	00a787b3          	add	a5,a5,a0
    727c:	04f42823          	sw	a5,80(s0)
    7280:	00812403          	lw	s0,8(sp)
    7284:	01010113          	add	sp,sp,16
    7288:	00008067          	ret
    728c:	00c45783          	lhu	a5,12(s0)
    7290:	fffff737          	lui	a4,0xfffff
    7294:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7298:	00e7f7b3          	and	a5,a5,a4
    729c:	00c12083          	lw	ra,12(sp)
    72a0:	00f41623          	sh	a5,12(s0)
    72a4:	00812403          	lw	s0,8(sp)
    72a8:	01010113          	add	sp,sp,16
    72ac:	00008067          	ret

000072b0 <__swrite>:
    72b0:	00c59783          	lh	a5,12(a1)
    72b4:	fe010113          	add	sp,sp,-32
    72b8:	00812c23          	sw	s0,24(sp)
    72bc:	00912a23          	sw	s1,20(sp)
    72c0:	01212823          	sw	s2,16(sp)
    72c4:	01312623          	sw	s3,12(sp)
    72c8:	00112e23          	sw	ra,28(sp)
    72cc:	1007f713          	and	a4,a5,256
    72d0:	00058413          	mv	s0,a1
    72d4:	00050493          	mv	s1,a0
    72d8:	00060913          	mv	s2,a2
    72dc:	00068993          	mv	s3,a3
    72e0:	04071063          	bnez	a4,7320 <__swrite+0x70>
    72e4:	fffff737          	lui	a4,0xfffff
    72e8:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    72ec:	00e7f7b3          	and	a5,a5,a4
    72f0:	00e41583          	lh	a1,14(s0)
    72f4:	00f41623          	sh	a5,12(s0)
    72f8:	01812403          	lw	s0,24(sp)
    72fc:	01c12083          	lw	ra,28(sp)
    7300:	00098693          	mv	a3,s3
    7304:	00090613          	mv	a2,s2
    7308:	00c12983          	lw	s3,12(sp)
    730c:	01012903          	lw	s2,16(sp)
    7310:	00048513          	mv	a0,s1
    7314:	01412483          	lw	s1,20(sp)
    7318:	02010113          	add	sp,sp,32
    731c:	70c0006f          	j	7a28 <_write_r>
    7320:	00e59583          	lh	a1,14(a1)
    7324:	00200693          	li	a3,2
    7328:	00000613          	li	a2,0
    732c:	5dc000ef          	jal	7908 <_lseek_r>
    7330:	00c41783          	lh	a5,12(s0)
    7334:	fb1ff06f          	j	72e4 <__swrite+0x34>

00007338 <__sseek>:
    7338:	ff010113          	add	sp,sp,-16
    733c:	00812423          	sw	s0,8(sp)
    7340:	00058413          	mv	s0,a1
    7344:	00e59583          	lh	a1,14(a1)
    7348:	00112623          	sw	ra,12(sp)
    734c:	5bc000ef          	jal	7908 <_lseek_r>
    7350:	fff00793          	li	a5,-1
    7354:	02f50863          	beq	a0,a5,7384 <__sseek+0x4c>
    7358:	00c45783          	lhu	a5,12(s0)
    735c:	00001737          	lui	a4,0x1
    7360:	00c12083          	lw	ra,12(sp)
    7364:	00e7e7b3          	or	a5,a5,a4
    7368:	01079793          	sll	a5,a5,0x10
    736c:	4107d793          	sra	a5,a5,0x10
    7370:	04a42823          	sw	a0,80(s0)
    7374:	00f41623          	sh	a5,12(s0)
    7378:	00812403          	lw	s0,8(sp)
    737c:	01010113          	add	sp,sp,16
    7380:	00008067          	ret
    7384:	00c45783          	lhu	a5,12(s0)
    7388:	fffff737          	lui	a4,0xfffff
    738c:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7390:	00e7f7b3          	and	a5,a5,a4
    7394:	01079793          	sll	a5,a5,0x10
    7398:	4107d793          	sra	a5,a5,0x10
    739c:	00c12083          	lw	ra,12(sp)
    73a0:	00f41623          	sh	a5,12(s0)
    73a4:	00812403          	lw	s0,8(sp)
    73a8:	01010113          	add	sp,sp,16
    73ac:	00008067          	ret

000073b0 <__sclose>:
    73b0:	00e59583          	lh	a1,14(a1)
    73b4:	4fc0006f          	j	78b0 <_close_r>

000073b8 <__swsetup_r>:
    73b8:	ff010113          	add	sp,sp,-16
    73bc:	00812423          	sw	s0,8(sp)
    73c0:	00912223          	sw	s1,4(sp)
    73c4:	00112623          	sw	ra,12(sp)
    73c8:	7fff9797          	auipc	a5,0x7fff9
    73cc:	3407a783          	lw	a5,832(a5) # 80000708 <_impure_ptr>
    73d0:	00050493          	mv	s1,a0
    73d4:	00058413          	mv	s0,a1
    73d8:	00078663          	beqz	a5,73e4 <__swsetup_r+0x2c>
    73dc:	0347a703          	lw	a4,52(a5)
    73e0:	0e070c63          	beqz	a4,74d8 <__swsetup_r+0x120>
    73e4:	00c41783          	lh	a5,12(s0)
    73e8:	0087f713          	and	a4,a5,8
    73ec:	06070a63          	beqz	a4,7460 <__swsetup_r+0xa8>
    73f0:	01042703          	lw	a4,16(s0)
    73f4:	08070663          	beqz	a4,7480 <__swsetup_r+0xc8>
    73f8:	0017f693          	and	a3,a5,1
    73fc:	02068863          	beqz	a3,742c <__swsetup_r+0x74>
    7400:	01442683          	lw	a3,20(s0)
    7404:	00042423          	sw	zero,8(s0)
    7408:	00000513          	li	a0,0
    740c:	40d006b3          	neg	a3,a3
    7410:	00d42c23          	sw	a3,24(s0)
    7414:	02070a63          	beqz	a4,7448 <__swsetup_r+0x90>
    7418:	00c12083          	lw	ra,12(sp)
    741c:	00812403          	lw	s0,8(sp)
    7420:	00412483          	lw	s1,4(sp)
    7424:	01010113          	add	sp,sp,16
    7428:	00008067          	ret
    742c:	0027f693          	and	a3,a5,2
    7430:	00000613          	li	a2,0
    7434:	00069463          	bnez	a3,743c <__swsetup_r+0x84>
    7438:	01442603          	lw	a2,20(s0)
    743c:	00c42423          	sw	a2,8(s0)
    7440:	00000513          	li	a0,0
    7444:	fc071ae3          	bnez	a4,7418 <__swsetup_r+0x60>
    7448:	0807f713          	and	a4,a5,128
    744c:	fc0706e3          	beqz	a4,7418 <__swsetup_r+0x60>
    7450:	0407e793          	or	a5,a5,64
    7454:	00f41623          	sh	a5,12(s0)
    7458:	fff00513          	li	a0,-1
    745c:	fbdff06f          	j	7418 <__swsetup_r+0x60>
    7460:	0107f713          	and	a4,a5,16
    7464:	08070063          	beqz	a4,74e4 <__swsetup_r+0x12c>
    7468:	0047f713          	and	a4,a5,4
    746c:	02071c63          	bnez	a4,74a4 <__swsetup_r+0xec>
    7470:	01042703          	lw	a4,16(s0)
    7474:	0087e793          	or	a5,a5,8
    7478:	00f41623          	sh	a5,12(s0)
    747c:	f6071ee3          	bnez	a4,73f8 <__swsetup_r+0x40>
    7480:	2807f693          	and	a3,a5,640
    7484:	20000613          	li	a2,512
    7488:	f6c688e3          	beq	a3,a2,73f8 <__swsetup_r+0x40>
    748c:	00040593          	mv	a1,s0
    7490:	00048513          	mv	a0,s1
    7494:	6cc030ef          	jal	ab60 <__smakebuf_r>
    7498:	00c41783          	lh	a5,12(s0)
    749c:	01042703          	lw	a4,16(s0)
    74a0:	f59ff06f          	j	73f8 <__swsetup_r+0x40>
    74a4:	03042583          	lw	a1,48(s0)
    74a8:	00058e63          	beqz	a1,74c4 <__swsetup_r+0x10c>
    74ac:	04040713          	add	a4,s0,64
    74b0:	00e58863          	beq	a1,a4,74c0 <__swsetup_r+0x108>
    74b4:	00048513          	mv	a0,s1
    74b8:	f7df90ef          	jal	1434 <_free_r>
    74bc:	00c41783          	lh	a5,12(s0)
    74c0:	02042823          	sw	zero,48(s0)
    74c4:	01042703          	lw	a4,16(s0)
    74c8:	fdb7f793          	and	a5,a5,-37
    74cc:	00042223          	sw	zero,4(s0)
    74d0:	00e42023          	sw	a4,0(s0)
    74d4:	fa1ff06f          	j	7474 <__swsetup_r+0xbc>
    74d8:	00078513          	mv	a0,a5
    74dc:	f28ff0ef          	jal	6c04 <__sinit>
    74e0:	f05ff06f          	j	73e4 <__swsetup_r+0x2c>
    74e4:	00900713          	li	a4,9
    74e8:	00e4a023          	sw	a4,0(s1)
    74ec:	0407e793          	or	a5,a5,64
    74f0:	00f41623          	sh	a5,12(s0)
    74f4:	fff00513          	li	a0,-1
    74f8:	f21ff06f          	j	7418 <__swsetup_r+0x60>

000074fc <__fputwc>:
    74fc:	fc010113          	add	sp,sp,-64
    7500:	02812c23          	sw	s0,56(sp)
    7504:	03412423          	sw	s4,40(sp)
    7508:	03512223          	sw	s5,36(sp)
    750c:	02112e23          	sw	ra,60(sp)
    7510:	02912a23          	sw	s1,52(sp)
    7514:	03312623          	sw	s3,44(sp)
    7518:	00050a13          	mv	s4,a0
    751c:	00058a93          	mv	s5,a1
    7520:	00060413          	mv	s0,a2
    7524:	374000ef          	jal	7898 <__locale_mb_cur_max>
    7528:	00100793          	li	a5,1
    752c:	02f51663          	bne	a0,a5,7558 <__fputwc+0x5c>
    7530:	fffa8793          	add	a5,s5,-1
    7534:	0fe00713          	li	a4,254
    7538:	02f76063          	bltu	a4,a5,7558 <__fputwc+0x5c>
    753c:	03212823          	sw	s2,48(sp)
    7540:	03612023          	sw	s6,32(sp)
    7544:	01712e23          	sw	s7,28(sp)
    7548:	01510423          	sb	s5,8(sp)
    754c:	00100993          	li	s3,1
    7550:	00810493          	add	s1,sp,8
    7554:	0380006f          	j	758c <__fputwc+0x90>
    7558:	00810493          	add	s1,sp,8
    755c:	05c40693          	add	a3,s0,92
    7560:	000a8613          	mv	a2,s5
    7564:	00048593          	mv	a1,s1
    7568:	000a0513          	mv	a0,s4
    756c:	3e8030ef          	jal	a954 <_wcrtomb_r>
    7570:	fff00793          	li	a5,-1
    7574:	00050993          	mv	s3,a0
    7578:	0cf50a63          	beq	a0,a5,764c <__fputwc+0x150>
    757c:	0a050663          	beqz	a0,7628 <__fputwc+0x12c>
    7580:	03212823          	sw	s2,48(sp)
    7584:	03612023          	sw	s6,32(sp)
    7588:	01712e23          	sw	s7,28(sp)
    758c:	00000913          	li	s2,0
    7590:	fff00b13          	li	s6,-1
    7594:	00a00b93          	li	s7,10
    7598:	0200006f          	j	75b8 <__fputwc+0xbc>
    759c:	00042783          	lw	a5,0(s0)
    75a0:	00178693          	add	a3,a5,1
    75a4:	00d42023          	sw	a3,0(s0)
    75a8:	00e78023          	sb	a4,0(a5)
    75ac:	00190913          	add	s2,s2,1
    75b0:	00148493          	add	s1,s1,1
    75b4:	07397463          	bgeu	s2,s3,761c <__fputwc+0x120>
    75b8:	00842783          	lw	a5,8(s0)
    75bc:	0004c703          	lbu	a4,0(s1)
    75c0:	fff78793          	add	a5,a5,-1
    75c4:	00f42423          	sw	a5,8(s0)
    75c8:	fc07dae3          	bgez	a5,759c <__fputwc+0xa0>
    75cc:	01842683          	lw	a3,24(s0)
    75d0:	00040613          	mv	a2,s0
    75d4:	00070593          	mv	a1,a4
    75d8:	000a0513          	mv	a0,s4
    75dc:	00d7c463          	blt	a5,a3,75e4 <__fputwc+0xe8>
    75e0:	fb771ee3          	bne	a4,s7,759c <__fputwc+0xa0>
    75e4:	714030ef          	jal	acf8 <__swbuf_r>
    75e8:	fd6512e3          	bne	a0,s6,75ac <__fputwc+0xb0>
    75ec:	03012903          	lw	s2,48(sp)
    75f0:	02012b03          	lw	s6,32(sp)
    75f4:	01c12b83          	lw	s7,28(sp)
    75f8:	03c12083          	lw	ra,60(sp)
    75fc:	03812403          	lw	s0,56(sp)
    7600:	03412483          	lw	s1,52(sp)
    7604:	02c12983          	lw	s3,44(sp)
    7608:	02812a03          	lw	s4,40(sp)
    760c:	02412a83          	lw	s5,36(sp)
    7610:	fff00513          	li	a0,-1
    7614:	04010113          	add	sp,sp,64
    7618:	00008067          	ret
    761c:	03012903          	lw	s2,48(sp)
    7620:	02012b03          	lw	s6,32(sp)
    7624:	01c12b83          	lw	s7,28(sp)
    7628:	03c12083          	lw	ra,60(sp)
    762c:	03812403          	lw	s0,56(sp)
    7630:	03412483          	lw	s1,52(sp)
    7634:	02c12983          	lw	s3,44(sp)
    7638:	02812a03          	lw	s4,40(sp)
    763c:	000a8513          	mv	a0,s5
    7640:	02412a83          	lw	s5,36(sp)
    7644:	04010113          	add	sp,sp,64
    7648:	00008067          	ret
    764c:	00c45783          	lhu	a5,12(s0)
    7650:	0407e793          	or	a5,a5,64
    7654:	00f41623          	sh	a5,12(s0)
    7658:	fa1ff06f          	j	75f8 <__fputwc+0xfc>

0000765c <_fputwc_r>:
    765c:	06462783          	lw	a5,100(a2)
    7660:	fe010113          	add	sp,sp,-32
    7664:	00812c23          	sw	s0,24(sp)
    7668:	00912a23          	sw	s1,20(sp)
    766c:	0017f713          	and	a4,a5,1
    7670:	00112e23          	sw	ra,28(sp)
    7674:	00c61783          	lh	a5,12(a2)
    7678:	00060413          	mv	s0,a2
    767c:	00050493          	mv	s1,a0
    7680:	00071663          	bnez	a4,768c <_fputwc_r+0x30>
    7684:	2007f713          	and	a4,a5,512
    7688:	08070463          	beqz	a4,7710 <_fputwc_r+0xb4>
    768c:	01279713          	sll	a4,a5,0x12
    7690:	02074063          	bltz	a4,76b0 <_fputwc_r+0x54>
    7694:	06442703          	lw	a4,100(s0)
    7698:	000026b7          	lui	a3,0x2
    769c:	00d7e7b3          	or	a5,a5,a3
    76a0:	000026b7          	lui	a3,0x2
    76a4:	00d76733          	or	a4,a4,a3
    76a8:	00f41623          	sh	a5,12(s0)
    76ac:	06e42223          	sw	a4,100(s0)
    76b0:	00048513          	mv	a0,s1
    76b4:	00040613          	mv	a2,s0
    76b8:	e45ff0ef          	jal	74fc <__fputwc>
    76bc:	06442783          	lw	a5,100(s0)
    76c0:	00050493          	mv	s1,a0
    76c4:	0017f793          	and	a5,a5,1
    76c8:	00079863          	bnez	a5,76d8 <_fputwc_r+0x7c>
    76cc:	00c45783          	lhu	a5,12(s0)
    76d0:	2007f793          	and	a5,a5,512
    76d4:	00078e63          	beqz	a5,76f0 <_fputwc_r+0x94>
    76d8:	01c12083          	lw	ra,28(sp)
    76dc:	01812403          	lw	s0,24(sp)
    76e0:	00048513          	mv	a0,s1
    76e4:	01412483          	lw	s1,20(sp)
    76e8:	02010113          	add	sp,sp,32
    76ec:	00008067          	ret
    76f0:	05842503          	lw	a0,88(s0)
    76f4:	8edf90ef          	jal	fe0 <__retarget_lock_release_recursive>
    76f8:	01c12083          	lw	ra,28(sp)
    76fc:	01812403          	lw	s0,24(sp)
    7700:	00048513          	mv	a0,s1
    7704:	01412483          	lw	s1,20(sp)
    7708:	02010113          	add	sp,sp,32
    770c:	00008067          	ret
    7710:	05862503          	lw	a0,88(a2)
    7714:	00b12623          	sw	a1,12(sp)
    7718:	8c5f90ef          	jal	fdc <__retarget_lock_acquire_recursive>
    771c:	00c41783          	lh	a5,12(s0)
    7720:	00c12583          	lw	a1,12(sp)
    7724:	f69ff06f          	j	768c <_fputwc_r+0x30>

00007728 <memchr>:
    7728:	00357793          	and	a5,a0,3
    772c:	0ff5f693          	zext.b	a3,a1
    7730:	02078a63          	beqz	a5,7764 <memchr+0x3c>
    7734:	fff60793          	add	a5,a2,-1
    7738:	02060e63          	beqz	a2,7774 <memchr+0x4c>
    773c:	fff00613          	li	a2,-1
    7740:	0180006f          	j	7758 <memchr+0x30>
    7744:	00150513          	add	a0,a0,1
    7748:	00357713          	and	a4,a0,3
    774c:	00070e63          	beqz	a4,7768 <memchr+0x40>
    7750:	fff78793          	add	a5,a5,-1
    7754:	02c78063          	beq	a5,a2,7774 <memchr+0x4c>
    7758:	00054703          	lbu	a4,0(a0)
    775c:	fed714e3          	bne	a4,a3,7744 <memchr+0x1c>
    7760:	00008067          	ret
    7764:	00060793          	mv	a5,a2
    7768:	00300713          	li	a4,3
    776c:	00f76863          	bltu	a4,a5,777c <memchr+0x54>
    7770:	06079063          	bnez	a5,77d0 <memchr+0xa8>
    7774:	00000513          	li	a0,0
    7778:	00008067          	ret
    777c:	0ff5f593          	zext.b	a1,a1
    7780:	00859713          	sll	a4,a1,0x8
    7784:	00b705b3          	add	a1,a4,a1
    7788:	01059713          	sll	a4,a1,0x10
    778c:	feff08b7          	lui	a7,0xfeff0
    7790:	80808837          	lui	a6,0x80808
    7794:	00e585b3          	add	a1,a1,a4
    7798:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    779c:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    77a0:	00300313          	li	t1,3
    77a4:	0100006f          	j	77b4 <memchr+0x8c>
    77a8:	ffc78793          	add	a5,a5,-4
    77ac:	00450513          	add	a0,a0,4
    77b0:	fcf370e3          	bgeu	t1,a5,7770 <memchr+0x48>
    77b4:	00052703          	lw	a4,0(a0)
    77b8:	00e5c733          	xor	a4,a1,a4
    77bc:	01170633          	add	a2,a4,a7
    77c0:	fff74713          	not	a4,a4
    77c4:	00e67733          	and	a4,a2,a4
    77c8:	01077733          	and	a4,a4,a6
    77cc:	fc070ee3          	beqz	a4,77a8 <memchr+0x80>
    77d0:	00f507b3          	add	a5,a0,a5
    77d4:	00c0006f          	j	77e0 <memchr+0xb8>
    77d8:	00150513          	add	a0,a0,1
    77dc:	f8f50ce3          	beq	a0,a5,7774 <memchr+0x4c>
    77e0:	00054703          	lbu	a4,0(a0)
    77e4:	fed71ae3          	bne	a4,a3,77d8 <memchr+0xb0>
    77e8:	00008067          	ret

000077ec <strncpy>:
    77ec:	00a5e7b3          	or	a5,a1,a0
    77f0:	0037f793          	and	a5,a5,3
    77f4:	00079663          	bnez	a5,7800 <strncpy+0x14>
    77f8:	00300793          	li	a5,3
    77fc:	04c7e663          	bltu	a5,a2,7848 <strncpy+0x5c>
    7800:	00050713          	mv	a4,a0
    7804:	01c0006f          	j	7820 <strncpy+0x34>
    7808:	fff5c683          	lbu	a3,-1(a1)
    780c:	fff60813          	add	a6,a2,-1
    7810:	fed78fa3          	sb	a3,-1(a5)
    7814:	00068e63          	beqz	a3,7830 <strncpy+0x44>
    7818:	00078713          	mv	a4,a5
    781c:	00080613          	mv	a2,a6
    7820:	00158593          	add	a1,a1,1
    7824:	00170793          	add	a5,a4,1
    7828:	fe0610e3          	bnez	a2,7808 <strncpy+0x1c>
    782c:	00008067          	ret
    7830:	00c70733          	add	a4,a4,a2
    7834:	06080063          	beqz	a6,7894 <strncpy+0xa8>
    7838:	00178793          	add	a5,a5,1
    783c:	fe078fa3          	sb	zero,-1(a5)
    7840:	fee79ce3          	bne	a5,a4,7838 <strncpy+0x4c>
    7844:	00008067          	ret
    7848:	feff0337          	lui	t1,0xfeff0
    784c:	808088b7          	lui	a7,0x80808
    7850:	00050713          	mv	a4,a0
    7854:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7858:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    785c:	00300e13          	li	t3,3
    7860:	0180006f          	j	7878 <strncpy+0x8c>
    7864:	00d72023          	sw	a3,0(a4)
    7868:	ffc60613          	add	a2,a2,-4
    786c:	00470713          	add	a4,a4,4
    7870:	00458593          	add	a1,a1,4
    7874:	face76e3          	bgeu	t3,a2,7820 <strncpy+0x34>
    7878:	0005a683          	lw	a3,0(a1)
    787c:	006687b3          	add	a5,a3,t1
    7880:	fff6c813          	not	a6,a3
    7884:	0107f7b3          	and	a5,a5,a6
    7888:	0117f7b3          	and	a5,a5,a7
    788c:	fc078ce3          	beqz	a5,7864 <strncpy+0x78>
    7890:	f91ff06f          	j	7820 <strncpy+0x34>
    7894:	00008067          	ret

00007898 <__locale_mb_cur_max>:
    7898:	7fff9517          	auipc	a0,0x7fff9
    789c:	dc454503          	lbu	a0,-572(a0) # 8000065c <__global_locale+0x128>
    78a0:	00008067          	ret

000078a4 <_localeconv_r>:
    78a4:	7fff9517          	auipc	a0,0x7fff9
    78a8:	d8050513          	add	a0,a0,-640 # 80000624 <__global_locale+0xf0>
    78ac:	00008067          	ret

000078b0 <_close_r>:
    78b0:	ff010113          	add	sp,sp,-16
    78b4:	00812423          	sw	s0,8(sp)
    78b8:	00050413          	mv	s0,a0
    78bc:	00058513          	mv	a0,a1
    78c0:	7fff9797          	auipc	a5,0x7fff9
    78c4:	e407ac23          	sw	zero,-424(a5) # 80000718 <errno>
    78c8:	00112623          	sw	ra,12(sp)
    78cc:	b00f90ef          	jal	bcc <_close>
    78d0:	fff00793          	li	a5,-1
    78d4:	00f50a63          	beq	a0,a5,78e8 <_close_r+0x38>
    78d8:	00c12083          	lw	ra,12(sp)
    78dc:	00812403          	lw	s0,8(sp)
    78e0:	01010113          	add	sp,sp,16
    78e4:	00008067          	ret
    78e8:	7fff9797          	auipc	a5,0x7fff9
    78ec:	e307a783          	lw	a5,-464(a5) # 80000718 <errno>
    78f0:	fe0784e3          	beqz	a5,78d8 <_close_r+0x28>
    78f4:	00c12083          	lw	ra,12(sp)
    78f8:	00f42023          	sw	a5,0(s0)
    78fc:	00812403          	lw	s0,8(sp)
    7900:	01010113          	add	sp,sp,16
    7904:	00008067          	ret

00007908 <_lseek_r>:
    7908:	ff010113          	add	sp,sp,-16
    790c:	00058713          	mv	a4,a1
    7910:	00812423          	sw	s0,8(sp)
    7914:	00060593          	mv	a1,a2
    7918:	00050413          	mv	s0,a0
    791c:	00068613          	mv	a2,a3
    7920:	00070513          	mv	a0,a4
    7924:	7fff9797          	auipc	a5,0x7fff9
    7928:	de07aa23          	sw	zero,-524(a5) # 80000718 <errno>
    792c:	00112623          	sw	ra,12(sp)
    7930:	ad8f90ef          	jal	c08 <_lseek>
    7934:	fff00793          	li	a5,-1
    7938:	00f50a63          	beq	a0,a5,794c <_lseek_r+0x44>
    793c:	00c12083          	lw	ra,12(sp)
    7940:	00812403          	lw	s0,8(sp)
    7944:	01010113          	add	sp,sp,16
    7948:	00008067          	ret
    794c:	7fff9797          	auipc	a5,0x7fff9
    7950:	dcc7a783          	lw	a5,-564(a5) # 80000718 <errno>
    7954:	fe0784e3          	beqz	a5,793c <_lseek_r+0x34>
    7958:	00c12083          	lw	ra,12(sp)
    795c:	00f42023          	sw	a5,0(s0)
    7960:	00812403          	lw	s0,8(sp)
    7964:	01010113          	add	sp,sp,16
    7968:	00008067          	ret

0000796c <_read_r>:
    796c:	ff010113          	add	sp,sp,-16
    7970:	00058713          	mv	a4,a1
    7974:	00812423          	sw	s0,8(sp)
    7978:	00060593          	mv	a1,a2
    797c:	00050413          	mv	s0,a0
    7980:	00068613          	mv	a2,a3
    7984:	00070513          	mv	a0,a4
    7988:	7fff9797          	auipc	a5,0x7fff9
    798c:	d807a823          	sw	zero,-624(a5) # 80000718 <errno>
    7990:	00112623          	sw	ra,12(sp)
    7994:	a7cf90ef          	jal	c10 <_read>
    7998:	fff00793          	li	a5,-1
    799c:	00f50a63          	beq	a0,a5,79b0 <_read_r+0x44>
    79a0:	00c12083          	lw	ra,12(sp)
    79a4:	00812403          	lw	s0,8(sp)
    79a8:	01010113          	add	sp,sp,16
    79ac:	00008067          	ret
    79b0:	7fff9797          	auipc	a5,0x7fff9
    79b4:	d687a783          	lw	a5,-664(a5) # 80000718 <errno>
    79b8:	fe0784e3          	beqz	a5,79a0 <_read_r+0x34>
    79bc:	00c12083          	lw	ra,12(sp)
    79c0:	00f42023          	sw	a5,0(s0)
    79c4:	00812403          	lw	s0,8(sp)
    79c8:	01010113          	add	sp,sp,16
    79cc:	00008067          	ret

000079d0 <_sbrk_r>:
    79d0:	ff010113          	add	sp,sp,-16
    79d4:	00812423          	sw	s0,8(sp)
    79d8:	00050413          	mv	s0,a0
    79dc:	00058513          	mv	a0,a1
    79e0:	7fff9797          	auipc	a5,0x7fff9
    79e4:	d207ac23          	sw	zero,-712(a5) # 80000718 <errno>
    79e8:	00112623          	sw	ra,12(sp)
    79ec:	ba4f90ef          	jal	d90 <_sbrk>
    79f0:	fff00793          	li	a5,-1
    79f4:	00f50a63          	beq	a0,a5,7a08 <_sbrk_r+0x38>
    79f8:	00c12083          	lw	ra,12(sp)
    79fc:	00812403          	lw	s0,8(sp)
    7a00:	01010113          	add	sp,sp,16
    7a04:	00008067          	ret
    7a08:	7fff9797          	auipc	a5,0x7fff9
    7a0c:	d107a783          	lw	a5,-752(a5) # 80000718 <errno>
    7a10:	fe0784e3          	beqz	a5,79f8 <_sbrk_r+0x28>
    7a14:	00c12083          	lw	ra,12(sp)
    7a18:	00f42023          	sw	a5,0(s0)
    7a1c:	00812403          	lw	s0,8(sp)
    7a20:	01010113          	add	sp,sp,16
    7a24:	00008067          	ret

00007a28 <_write_r>:
    7a28:	ff010113          	add	sp,sp,-16
    7a2c:	00058713          	mv	a4,a1
    7a30:	00812423          	sw	s0,8(sp)
    7a34:	00060593          	mv	a1,a2
    7a38:	00050413          	mv	s0,a0
    7a3c:	00068613          	mv	a2,a3
    7a40:	00070513          	mv	a0,a4
    7a44:	7fff9797          	auipc	a5,0x7fff9
    7a48:	cc07aa23          	sw	zero,-812(a5) # 80000718 <errno>
    7a4c:	00112623          	sw	ra,12(sp)
    7a50:	a9cf90ef          	jal	cec <_write>
    7a54:	fff00793          	li	a5,-1
    7a58:	00f50a63          	beq	a0,a5,7a6c <_write_r+0x44>
    7a5c:	00c12083          	lw	ra,12(sp)
    7a60:	00812403          	lw	s0,8(sp)
    7a64:	01010113          	add	sp,sp,16
    7a68:	00008067          	ret
    7a6c:	7fff9797          	auipc	a5,0x7fff9
    7a70:	cac7a783          	lw	a5,-852(a5) # 80000718 <errno>
    7a74:	fe0784e3          	beqz	a5,7a5c <_write_r+0x34>
    7a78:	00c12083          	lw	ra,12(sp)
    7a7c:	00f42023          	sw	a5,0(s0)
    7a80:	00812403          	lw	s0,8(sp)
    7a84:	01010113          	add	sp,sp,16
    7a88:	00008067          	ret

00007a8c <memmove>:
    7a8c:	02a5f663          	bgeu	a1,a0,7ab8 <memmove+0x2c>
    7a90:	00c58733          	add	a4,a1,a2
    7a94:	02e57263          	bgeu	a0,a4,7ab8 <memmove+0x2c>
    7a98:	00c507b3          	add	a5,a0,a2
    7a9c:	04060663          	beqz	a2,7ae8 <memmove+0x5c>
    7aa0:	fff74683          	lbu	a3,-1(a4)
    7aa4:	fff78793          	add	a5,a5,-1
    7aa8:	fff70713          	add	a4,a4,-1
    7aac:	00d78023          	sb	a3,0(a5)
    7ab0:	fef518e3          	bne	a0,a5,7aa0 <memmove+0x14>
    7ab4:	00008067          	ret
    7ab8:	00f00793          	li	a5,15
    7abc:	02c7e863          	bltu	a5,a2,7aec <memmove+0x60>
    7ac0:	00050793          	mv	a5,a0
    7ac4:	fff60693          	add	a3,a2,-1
    7ac8:	0c060263          	beqz	a2,7b8c <memmove+0x100>
    7acc:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0xc9>
    7ad0:	00d786b3          	add	a3,a5,a3
    7ad4:	0005c703          	lbu	a4,0(a1)
    7ad8:	00178793          	add	a5,a5,1
    7adc:	00158593          	add	a1,a1,1
    7ae0:	fee78fa3          	sb	a4,-1(a5)
    7ae4:	fed798e3          	bne	a5,a3,7ad4 <memmove+0x48>
    7ae8:	00008067          	ret
    7aec:	00b567b3          	or	a5,a0,a1
    7af0:	0037f793          	and	a5,a5,3
    7af4:	08079663          	bnez	a5,7b80 <memmove+0xf4>
    7af8:	ff060893          	add	a7,a2,-16
    7afc:	ff08f893          	and	a7,a7,-16
    7b00:	01088893          	add	a7,a7,16
    7b04:	011506b3          	add	a3,a0,a7
    7b08:	00058713          	mv	a4,a1
    7b0c:	00050793          	mv	a5,a0
    7b10:	00072803          	lw	a6,0(a4)
    7b14:	01070713          	add	a4,a4,16
    7b18:	01078793          	add	a5,a5,16
    7b1c:	ff07a823          	sw	a6,-16(a5)
    7b20:	ff472803          	lw	a6,-12(a4)
    7b24:	ff07aa23          	sw	a6,-12(a5)
    7b28:	ff872803          	lw	a6,-8(a4)
    7b2c:	ff07ac23          	sw	a6,-8(a5)
    7b30:	ffc72803          	lw	a6,-4(a4)
    7b34:	ff07ae23          	sw	a6,-4(a5)
    7b38:	fcd79ce3          	bne	a5,a3,7b10 <memmove+0x84>
    7b3c:	00c67813          	and	a6,a2,12
    7b40:	011585b3          	add	a1,a1,a7
    7b44:	00f67713          	and	a4,a2,15
    7b48:	04080463          	beqz	a6,7b90 <memmove+0x104>
    7b4c:	ffc70813          	add	a6,a4,-4
    7b50:	ffc87813          	and	a6,a6,-4
    7b54:	00480813          	add	a6,a6,4
    7b58:	010687b3          	add	a5,a3,a6
    7b5c:	00058713          	mv	a4,a1
    7b60:	00072883          	lw	a7,0(a4)
    7b64:	00468693          	add	a3,a3,4
    7b68:	00470713          	add	a4,a4,4
    7b6c:	ff16ae23          	sw	a7,-4(a3)
    7b70:	fef698e3          	bne	a3,a5,7b60 <memmove+0xd4>
    7b74:	00367613          	and	a2,a2,3
    7b78:	010585b3          	add	a1,a1,a6
    7b7c:	f49ff06f          	j	7ac4 <memmove+0x38>
    7b80:	fff60693          	add	a3,a2,-1
    7b84:	00050793          	mv	a5,a0
    7b88:	f45ff06f          	j	7acc <memmove+0x40>
    7b8c:	00008067          	ret
    7b90:	00070613          	mv	a2,a4
    7b94:	f31ff06f          	j	7ac4 <memmove+0x38>

00007b98 <frexp>:
    7b98:	ff010113          	add	sp,sp,-16
    7b9c:	00912223          	sw	s1,4(sp)
    7ba0:	800004b7          	lui	s1,0x80000
    7ba4:	00812423          	sw	s0,8(sp)
    7ba8:	00112623          	sw	ra,12(sp)
    7bac:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7bb0:	00060413          	mv	s0,a2
    7bb4:	00062023          	sw	zero,0(a2)
    7bb8:	00b4f6b3          	and	a3,s1,a1
    7bbc:	7ff00637          	lui	a2,0x7ff00
    7bc0:	00058793          	mv	a5,a1
    7bc4:	00050713          	mv	a4,a0
    7bc8:	04c6f063          	bgeu	a3,a2,7c08 <frexp+0x70>
    7bcc:	00a6e633          	or	a2,a3,a0
    7bd0:	02060c63          	beqz	a2,7c08 <frexp+0x70>
    7bd4:	0145d613          	srl	a2,a1,0x14
    7bd8:	7ff67613          	and	a2,a2,2047
    7bdc:	04060463          	beqz	a2,7c24 <frexp+0x8c>
    7be0:	00000593          	li	a1,0
    7be4:	80100637          	lui	a2,0x80100
    7be8:	4146d693          	sra	a3,a3,0x14
    7bec:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7bf0:	c0268693          	add	a3,a3,-1022
    7bf4:	00c7f7b3          	and	a5,a5,a2
    7bf8:	00b686b3          	add	a3,a3,a1
    7bfc:	3fe00637          	lui	a2,0x3fe00
    7c00:	00c7e7b3          	or	a5,a5,a2
    7c04:	00d42023          	sw	a3,0(s0)
    7c08:	00c12083          	lw	ra,12(sp)
    7c0c:	00812403          	lw	s0,8(sp)
    7c10:	00412483          	lw	s1,4(sp)
    7c14:	00070513          	mv	a0,a4
    7c18:	00078593          	mv	a1,a5
    7c1c:	01010113          	add	sp,sp,16
    7c20:	00008067          	ret
    7c24:	7fff9797          	auipc	a5,0x7fff9
    7c28:	a9c78793          	add	a5,a5,-1380 # 800006c0 <__global_locale+0x18c>
    7c2c:	0047a683          	lw	a3,4(a5)
    7c30:	0007a603          	lw	a2,0(a5)
    7c34:	199050ef          	jal	d5cc <__muldf3>
    7c38:	00058793          	mv	a5,a1
    7c3c:	00b4f6b3          	and	a3,s1,a1
    7c40:	00050713          	mv	a4,a0
    7c44:	fca00593          	li	a1,-54
    7c48:	f9dff06f          	j	7be4 <frexp+0x4c>

00007c4c <quorem>:
    7c4c:	fb010113          	add	sp,sp,-80
    7c50:	04912223          	sw	s1,68(sp)
    7c54:	01052783          	lw	a5,16(a0)
    7c58:	0105a483          	lw	s1,16(a1)
    7c5c:	04112623          	sw	ra,76(sp)
    7c60:	00b12423          	sw	a1,8(sp)
    7c64:	2097ca63          	blt	a5,s1,7e78 <quorem+0x22c>
    7c68:	fff48493          	add	s1,s1,-1
    7c6c:	03512a23          	sw	s5,52(sp)
    7c70:	03812423          	sw	s8,40(sp)
    7c74:	00249a93          	sll	s5,s1,0x2
    7c78:	01458c13          	add	s8,a1,20
    7c7c:	05212023          	sw	s2,64(sp)
    7c80:	03312e23          	sw	s3,60(sp)
    7c84:	015c0933          	add	s2,s8,s5
    7c88:	01450993          	add	s3,a0,20
    7c8c:	015987b3          	add	a5,s3,s5
    7c90:	03712623          	sw	s7,44(sp)
    7c94:	00092b83          	lw	s7,0(s2)
    7c98:	03912223          	sw	s9,36(sp)
    7c9c:	0007ac83          	lw	s9,0(a5)
    7ca0:	001b8b93          	add	s7,s7,1
    7ca4:	03412c23          	sw	s4,56(sp)
    7ca8:	000b8593          	mv	a1,s7
    7cac:	00050a13          	mv	s4,a0
    7cb0:	000c8513          	mv	a0,s9
    7cb4:	04812423          	sw	s0,72(sp)
    7cb8:	00f12623          	sw	a5,12(sp)
    7cbc:	09c070ef          	jal	ed58 <__hidden___udivsi3>
    7cc0:	00050413          	mv	s0,a0
    7cc4:	0d7cee63          	bltu	s9,s7,7da0 <quorem+0x154>
    7cc8:	03a12023          	sw	s10,32(sp)
    7ccc:	00010d37          	lui	s10,0x10
    7cd0:	01b12e23          	sw	s11,28(sp)
    7cd4:	03612823          	sw	s6,48(sp)
    7cd8:	000c0a93          	mv	s5,s8
    7cdc:	00098d93          	mv	s11,s3
    7ce0:	00000c93          	li	s9,0
    7ce4:	00000b93          	li	s7,0
    7ce8:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    7cec:	000aab03          	lw	s6,0(s5)
    7cf0:	00040593          	mv	a1,s0
    7cf4:	004d8d93          	add	s11,s11,4
    7cf8:	01ab7533          	and	a0,s6,s10
    7cfc:	799060ef          	jal	ec94 <__mulsi3>
    7d00:	00050793          	mv	a5,a0
    7d04:	00040593          	mv	a1,s0
    7d08:	010b5513          	srl	a0,s6,0x10
    7d0c:	01978cb3          	add	s9,a5,s9
    7d10:	785060ef          	jal	ec94 <__mulsi3>
    7d14:	ffcda603          	lw	a2,-4(s11)
    7d18:	01acf733          	and	a4,s9,s10
    7d1c:	010cdc93          	srl	s9,s9,0x10
    7d20:	01a677b3          	and	a5,a2,s10
    7d24:	40e787b3          	sub	a5,a5,a4
    7d28:	017787b3          	add	a5,a5,s7
    7d2c:	01950533          	add	a0,a0,s9
    7d30:	4107d713          	sra	a4,a5,0x10
    7d34:	01a575b3          	and	a1,a0,s10
    7d38:	01065613          	srl	a2,a2,0x10
    7d3c:	40b70733          	sub	a4,a4,a1
    7d40:	00c70733          	add	a4,a4,a2
    7d44:	01a7f7b3          	and	a5,a5,s10
    7d48:	01071613          	sll	a2,a4,0x10
    7d4c:	00c7e7b3          	or	a5,a5,a2
    7d50:	004a8a93          	add	s5,s5,4
    7d54:	fefdae23          	sw	a5,-4(s11)
    7d58:	01055c93          	srl	s9,a0,0x10
    7d5c:	41075b93          	sra	s7,a4,0x10
    7d60:	f95976e3          	bgeu	s2,s5,7cec <quorem+0xa0>
    7d64:	00c12703          	lw	a4,12(sp)
    7d68:	00072783          	lw	a5,0(a4)
    7d6c:	12079063          	bnez	a5,7e8c <quorem+0x240>
    7d70:	ffc70a93          	add	s5,a4,-4
    7d74:	0159e863          	bltu	s3,s5,7d84 <quorem+0x138>
    7d78:	0180006f          	j	7d90 <quorem+0x144>
    7d7c:	fff48493          	add	s1,s1,-1
    7d80:	0159f863          	bgeu	s3,s5,7d90 <quorem+0x144>
    7d84:	000aa783          	lw	a5,0(s5)
    7d88:	ffca8a93          	add	s5,s5,-4
    7d8c:	fe0788e3          	beqz	a5,7d7c <quorem+0x130>
    7d90:	03012b03          	lw	s6,48(sp)
    7d94:	02012d03          	lw	s10,32(sp)
    7d98:	01c12d83          	lw	s11,28(sp)
    7d9c:	009a2823          	sw	s1,16(s4)
    7da0:	00812583          	lw	a1,8(sp)
    7da4:	000a0513          	mv	a0,s4
    7da8:	1fc020ef          	jal	9fa4 <__mcmp>
    7dac:	08054c63          	bltz	a0,7e44 <quorem+0x1f8>
    7db0:	00010537          	lui	a0,0x10
    7db4:	00098593          	mv	a1,s3
    7db8:	00000713          	li	a4,0
    7dbc:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    7dc0:	0005a683          	lw	a3,0(a1)
    7dc4:	000c2603          	lw	a2,0(s8)
    7dc8:	00458593          	add	a1,a1,4
    7dcc:	00a6f7b3          	and	a5,a3,a0
    7dd0:	00a67833          	and	a6,a2,a0
    7dd4:	410787b3          	sub	a5,a5,a6
    7dd8:	00e787b3          	add	a5,a5,a4
    7ddc:	4107d713          	sra	a4,a5,0x10
    7de0:	01065613          	srl	a2,a2,0x10
    7de4:	0106d693          	srl	a3,a3,0x10
    7de8:	40c70733          	sub	a4,a4,a2
    7dec:	00d70733          	add	a4,a4,a3
    7df0:	01071693          	sll	a3,a4,0x10
    7df4:	00a7f7b3          	and	a5,a5,a0
    7df8:	00d7e7b3          	or	a5,a5,a3
    7dfc:	004c0c13          	add	s8,s8,4
    7e00:	fef5ae23          	sw	a5,-4(a1)
    7e04:	41075713          	sra	a4,a4,0x10
    7e08:	fb897ce3          	bgeu	s2,s8,7dc0 <quorem+0x174>
    7e0c:	00249793          	sll	a5,s1,0x2
    7e10:	00f987b3          	add	a5,s3,a5
    7e14:	0007a703          	lw	a4,0(a5)
    7e18:	02071463          	bnez	a4,7e40 <quorem+0x1f4>
    7e1c:	ffc78793          	add	a5,a5,-4
    7e20:	00f9e863          	bltu	s3,a5,7e30 <quorem+0x1e4>
    7e24:	0180006f          	j	7e3c <quorem+0x1f0>
    7e28:	fff48493          	add	s1,s1,-1
    7e2c:	00f9f863          	bgeu	s3,a5,7e3c <quorem+0x1f0>
    7e30:	0007a703          	lw	a4,0(a5)
    7e34:	ffc78793          	add	a5,a5,-4
    7e38:	fe0708e3          	beqz	a4,7e28 <quorem+0x1dc>
    7e3c:	009a2823          	sw	s1,16(s4)
    7e40:	00140413          	add	s0,s0,1
    7e44:	04c12083          	lw	ra,76(sp)
    7e48:	00040513          	mv	a0,s0
    7e4c:	04812403          	lw	s0,72(sp)
    7e50:	04012903          	lw	s2,64(sp)
    7e54:	03c12983          	lw	s3,60(sp)
    7e58:	03812a03          	lw	s4,56(sp)
    7e5c:	03412a83          	lw	s5,52(sp)
    7e60:	02c12b83          	lw	s7,44(sp)
    7e64:	02812c03          	lw	s8,40(sp)
    7e68:	02412c83          	lw	s9,36(sp)
    7e6c:	04412483          	lw	s1,68(sp)
    7e70:	05010113          	add	sp,sp,80
    7e74:	00008067          	ret
    7e78:	04c12083          	lw	ra,76(sp)
    7e7c:	04412483          	lw	s1,68(sp)
    7e80:	00000513          	li	a0,0
    7e84:	05010113          	add	sp,sp,80
    7e88:	00008067          	ret
    7e8c:	00812583          	lw	a1,8(sp)
    7e90:	000a0513          	mv	a0,s4
    7e94:	03012b03          	lw	s6,48(sp)
    7e98:	02012d03          	lw	s10,32(sp)
    7e9c:	01c12d83          	lw	s11,28(sp)
    7ea0:	104020ef          	jal	9fa4 <__mcmp>
    7ea4:	f00556e3          	bgez	a0,7db0 <quorem+0x164>
    7ea8:	f9dff06f          	j	7e44 <quorem+0x1f8>

00007eac <_dtoa_r>:
    7eac:	03852303          	lw	t1,56(a0)
    7eb0:	f5010113          	add	sp,sp,-176
    7eb4:	0a812423          	sw	s0,168(sp)
    7eb8:	0a912223          	sw	s1,164(sp)
    7ebc:	0b212023          	sw	s2,160(sp)
    7ec0:	09412c23          	sw	s4,152(sp)
    7ec4:	07b12e23          	sw	s11,124(sp)
    7ec8:	0a112623          	sw	ra,172(sp)
    7ecc:	09312e23          	sw	s3,156(sp)
    7ed0:	09512a23          	sw	s5,148(sp)
    7ed4:	00e12a23          	sw	a4,20(sp)
    7ed8:	00f12623          	sw	a5,12(sp)
    7edc:	01112423          	sw	a7,8(sp)
    7ee0:	02b12223          	sw	a1,36(sp)
    7ee4:	00c12023          	sw	a2,0(sp)
    7ee8:	00050413          	mv	s0,a0
    7eec:	00058d93          	mv	s11,a1
    7ef0:	00060493          	mv	s1,a2
    7ef4:	00068a13          	mv	s4,a3
    7ef8:	00080913          	mv	s2,a6
    7efc:	02030263          	beqz	t1,7f20 <_dtoa_r+0x74>
    7f00:	03c52703          	lw	a4,60(a0)
    7f04:	00100793          	li	a5,1
    7f08:	00030593          	mv	a1,t1
    7f0c:	00e797b3          	sll	a5,a5,a4
    7f10:	00e32223          	sw	a4,4(t1)
    7f14:	00f32423          	sw	a5,8(t1)
    7f18:	734010ef          	jal	964c <_Bfree>
    7f1c:	02042c23          	sw	zero,56(s0)
    7f20:	00048993          	mv	s3,s1
    7f24:	00000693          	li	a3,0
    7f28:	0004dc63          	bgez	s1,7f40 <_dtoa_r+0x94>
    7f2c:	00149493          	sll	s1,s1,0x1
    7f30:	0014d793          	srl	a5,s1,0x1
    7f34:	00f12023          	sw	a5,0(sp)
    7f38:	00078993          	mv	s3,a5
    7f3c:	00100693          	li	a3,1
    7f40:	7ff00737          	lui	a4,0x7ff00
    7f44:	00d92023          	sw	a3,0(s2)
    7f48:	00e9f6b3          	and	a3,s3,a4
    7f4c:	64e68463          	beq	a3,a4,8594 <_dtoa_r+0x6e8>
    7f50:	00012483          	lw	s1,0(sp)
    7f54:	000d8513          	mv	a0,s11
    7f58:	00000613          	li	a2,0
    7f5c:	00048593          	mv	a1,s1
    7f60:	00000693          	li	a3,0
    7f64:	01b12c23          	sw	s11,24(sp)
    7f68:	00912e23          	sw	s1,28(sp)
    7f6c:	3cc050ef          	jal	d338 <__eqdf2>
    7f70:	04051c63          	bnez	a0,7fc8 <_dtoa_r+0x11c>
    7f74:	00c12703          	lw	a4,12(sp)
    7f78:	00100793          	li	a5,1
    7f7c:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    7f80:	00812703          	lw	a4,8(sp)
    7f84:	00070863          	beqz	a4,7f94 <_dtoa_r+0xe8>
    7f88:	00007797          	auipc	a5,0x7
    7f8c:	24978793          	add	a5,a5,585 # f1d1 <__fini_array_end+0x345>
    7f90:	00f72023          	sw	a5,0(a4)
    7f94:	00007a97          	auipc	s5,0x7
    7f98:	23ca8a93          	add	s5,s5,572 # f1d0 <__fini_array_end+0x344>
    7f9c:	0ac12083          	lw	ra,172(sp)
    7fa0:	0a812403          	lw	s0,168(sp)
    7fa4:	0a412483          	lw	s1,164(sp)
    7fa8:	0a012903          	lw	s2,160(sp)
    7fac:	09c12983          	lw	s3,156(sp)
    7fb0:	09812a03          	lw	s4,152(sp)
    7fb4:	07c12d83          	lw	s11,124(sp)
    7fb8:	000a8513          	mv	a0,s5
    7fbc:	09412a83          	lw	s5,148(sp)
    7fc0:	0b010113          	add	sp,sp,176
    7fc4:	00008067          	ret
    7fc8:	00048613          	mv	a2,s1
    7fcc:	06810713          	add	a4,sp,104
    7fd0:	06c10693          	add	a3,sp,108
    7fd4:	000d8593          	mv	a1,s11
    7fd8:	00040513          	mv	a0,s0
    7fdc:	09612823          	sw	s6,144(sp)
    7fe0:	09712623          	sw	s7,140(sp)
    7fe4:	09812423          	sw	s8,136(sp)
    7fe8:	09912223          	sw	s9,132(sp)
    7fec:	09a12023          	sw	s10,128(sp)
    7ff0:	0149d913          	srl	s2,s3,0x14
    7ff4:	268020ef          	jal	a25c <__d2b>
    7ff8:	00050493          	mv	s1,a0
    7ffc:	5c091e63          	bnez	s2,85d8 <_dtoa_r+0x72c>
    8000:	06812a83          	lw	s5,104(sp)
    8004:	06c12903          	lw	s2,108(sp)
    8008:	02000793          	li	a5,32
    800c:	012a8933          	add	s2,s5,s2
    8010:	43290713          	add	a4,s2,1074
    8014:	36e7dae3          	bge	a5,a4,8b88 <_dtoa_r+0xcdc>
    8018:	04000793          	li	a5,64
    801c:	40e787b3          	sub	a5,a5,a4
    8020:	41290513          	add	a0,s2,1042
    8024:	00f997b3          	sll	a5,s3,a5
    8028:	00add533          	srl	a0,s11,a0
    802c:	00a7e533          	or	a0,a5,a0
    8030:	7c4060ef          	jal	e7f4 <__floatunsidf>
    8034:	fe1007b7          	lui	a5,0xfe100
    8038:	00100693          	li	a3,1
    803c:	00050713          	mv	a4,a0
    8040:	00b787b3          	add	a5,a5,a1
    8044:	fff90913          	add	s2,s2,-1
    8048:	02d12c23          	sw	a3,56(sp)
    804c:	7fff8697          	auipc	a3,0x7fff8
    8050:	67c68693          	add	a3,a3,1660 # 800006c8 <__global_locale+0x194>
    8054:	0006a603          	lw	a2,0(a3)
    8058:	0046a683          	lw	a3,4(a3)
    805c:	00070513          	mv	a0,a4
    8060:	00078593          	mv	a1,a5
    8064:	4f9050ef          	jal	dd5c <__subdf3>
    8068:	7fff8797          	auipc	a5,0x7fff8
    806c:	66878793          	add	a5,a5,1640 # 800006d0 <__global_locale+0x19c>
    8070:	0007a603          	lw	a2,0(a5)
    8074:	0047a683          	lw	a3,4(a5)
    8078:	554050ef          	jal	d5cc <__muldf3>
    807c:	7fff8797          	auipc	a5,0x7fff8
    8080:	65c78793          	add	a5,a5,1628 # 800006d8 <__global_locale+0x1a4>
    8084:	0007a603          	lw	a2,0(a5)
    8088:	0047a683          	lw	a3,4(a5)
    808c:	138040ef          	jal	c1c4 <__adddf3>
    8090:	00050b13          	mv	s6,a0
    8094:	00090513          	mv	a0,s2
    8098:	00058993          	mv	s3,a1
    809c:	6a0060ef          	jal	e73c <__floatsidf>
    80a0:	7fff8797          	auipc	a5,0x7fff8
    80a4:	64078793          	add	a5,a5,1600 # 800006e0 <__global_locale+0x1ac>
    80a8:	0007a603          	lw	a2,0(a5)
    80ac:	0047a683          	lw	a3,4(a5)
    80b0:	51c050ef          	jal	d5cc <__muldf3>
    80b4:	00050613          	mv	a2,a0
    80b8:	00058693          	mv	a3,a1
    80bc:	000b0513          	mv	a0,s6
    80c0:	00098593          	mv	a1,s3
    80c4:	100040ef          	jal	c1c4 <__adddf3>
    80c8:	00050b93          	mv	s7,a0
    80cc:	00058b13          	mv	s6,a1
    80d0:	5e8060ef          	jal	e6b8 <__fixdfsi>
    80d4:	00050993          	mv	s3,a0
    80d8:	000b0593          	mv	a1,s6
    80dc:	000b8513          	mv	a0,s7
    80e0:	00000613          	li	a2,0
    80e4:	00000693          	li	a3,0
    80e8:	3dc050ef          	jal	d4c4 <__ledf2>
    80ec:	02055063          	bgez	a0,810c <_dtoa_r+0x260>
    80f0:	00098513          	mv	a0,s3
    80f4:	648060ef          	jal	e73c <__floatsidf>
    80f8:	000b8613          	mv	a2,s7
    80fc:	000b0693          	mv	a3,s6
    8100:	238050ef          	jal	d338 <__eqdf2>
    8104:	00a03533          	snez	a0,a0
    8108:	40a989b3          	sub	s3,s3,a0
    810c:	412a8ab3          	sub	s5,s5,s2
    8110:	01600793          	li	a5,22
    8114:	fffa8b13          	add	s6,s5,-1
    8118:	2137e2e3          	bltu	a5,s3,8b1c <_dtoa_r+0xc70>
    811c:	00399713          	sll	a4,s3,0x3
    8120:	00007797          	auipc	a5,0x7
    8124:	74878793          	add	a5,a5,1864 # f868 <__mprec_tens>
    8128:	00e787b3          	add	a5,a5,a4
    812c:	0007a603          	lw	a2,0(a5)
    8130:	0047a683          	lw	a3,4(a5)
    8134:	01812503          	lw	a0,24(sp)
    8138:	01c12583          	lw	a1,28(sp)
    813c:	388050ef          	jal	d4c4 <__ledf2>
    8140:	220554e3          	bgez	a0,8b68 <_dtoa_r+0xcbc>
    8144:	fff98993          	add	s3,s3,-1
    8148:	02012a23          	sw	zero,52(sp)
    814c:	00012823          	sw	zero,16(sp)
    8150:	4a0b4863          	bltz	s6,8600 <_dtoa_r+0x754>
    8154:	4c09d063          	bgez	s3,8614 <_dtoa_r+0x768>
    8158:	01012783          	lw	a5,16(sp)
    815c:	03312023          	sw	s3,32(sp)
    8160:	413787b3          	sub	a5,a5,s3
    8164:	00f12823          	sw	a5,16(sp)
    8168:	413007b3          	neg	a5,s3
    816c:	02f12823          	sw	a5,48(sp)
    8170:	00900793          	li	a5,9
    8174:	00000993          	li	s3,0
    8178:	4b47e863          	bltu	a5,s4,8628 <_dtoa_r+0x77c>
    817c:	00500793          	li	a5,5
    8180:	2147dae3          	bge	a5,s4,8b94 <_dtoa_r+0xce8>
    8184:	ffca0a13          	add	s4,s4,-4
    8188:	00300793          	li	a5,3
    818c:	00000913          	li	s2,0
    8190:	66fa02e3          	beq	s4,a5,8ff4 <_dtoa_r+0x1148>
    8194:	6147dae3          	bge	a5,s4,8fa8 <_dtoa_r+0x10fc>
    8198:	00400793          	li	a5,4
    819c:	54fa1ae3          	bne	s4,a5,8ef0 <_dtoa_r+0x1044>
    81a0:	00100793          	li	a5,1
    81a4:	02f12423          	sw	a5,40(sp)
    81a8:	01412603          	lw	a2,20(sp)
    81ac:	62c05ce3          	blez	a2,8fe4 <_dtoa_r+0x1138>
    81b0:	02c12e23          	sw	a2,60(sp)
    81b4:	00060c13          	mv	s8,a2
    81b8:	01700693          	li	a3,23
    81bc:	00100713          	li	a4,1
    81c0:	00400793          	li	a5,4
    81c4:	00c6c463          	blt	a3,a2,81cc <_dtoa_r+0x320>
    81c8:	3540106f          	j	951c <_dtoa_r+0x1670>
    81cc:	00179793          	sll	a5,a5,0x1
    81d0:	01478693          	add	a3,a5,20
    81d4:	00070593          	mv	a1,a4
    81d8:	00170713          	add	a4,a4,1
    81dc:	fed678e3          	bgeu	a2,a3,81cc <_dtoa_r+0x320>
    81e0:	02b42e23          	sw	a1,60(s0)
    81e4:	00040513          	mv	a0,s0
    81e8:	3b0010ef          	jal	9598 <_Balloc>
    81ec:	00050a93          	mv	s5,a0
    81f0:	00051463          	bnez	a0,81f8 <_dtoa_r+0x34c>
    81f4:	30c0106f          	j	9500 <_dtoa_r+0x1654>
    81f8:	02a42c23          	sw	a0,56(s0)
    81fc:	00e00793          	li	a5,14
    8200:	5187ea63          	bltu	a5,s8,8714 <_dtoa_r+0x868>
    8204:	50090863          	beqz	s2,8714 <_dtoa_r+0x868>
    8208:	02012783          	lw	a5,32(sp)
    820c:	62f054e3          	blez	a5,9034 <_dtoa_r+0x1188>
    8210:	00f7f713          	and	a4,a5,15
    8214:	00371713          	sll	a4,a4,0x3
    8218:	4047dc93          	sra	s9,a5,0x4
    821c:	00007797          	auipc	a5,0x7
    8220:	64c78793          	add	a5,a5,1612 # f868 <__mprec_tens>
    8224:	00e787b3          	add	a5,a5,a4
    8228:	010cf693          	and	a3,s9,16
    822c:	0007a803          	lw	a6,0(a5)
    8230:	0047a703          	lw	a4,4(a5)
    8234:	560682e3          	beqz	a3,8f98 <_dtoa_r+0x10ec>
    8238:	00007797          	auipc	a5,0x7
    823c:	60878793          	add	a5,a5,1544 # f840 <__mprec_bigtens>
    8240:	0207a603          	lw	a2,32(a5)
    8244:	0247a683          	lw	a3,36(a5)
    8248:	01812503          	lw	a0,24(sp)
    824c:	01c12583          	lw	a1,28(sp)
    8250:	04e12423          	sw	a4,72(sp)
    8254:	05012023          	sw	a6,64(sp)
    8258:	035040ef          	jal	ca8c <__divdf3>
    825c:	04012803          	lw	a6,64(sp)
    8260:	04812703          	lw	a4,72(sp)
    8264:	00fcfc93          	and	s9,s9,15
    8268:	00050313          	mv	t1,a0
    826c:	00058d13          	mv	s10,a1
    8270:	00300913          	li	s2,3
    8274:	040c8c63          	beqz	s9,82cc <_dtoa_r+0x420>
    8278:	04812023          	sw	s0,64(sp)
    827c:	00007b97          	auipc	s7,0x7
    8280:	5c4b8b93          	add	s7,s7,1476 # f840 <__mprec_bigtens>
    8284:	00090413          	mv	s0,s2
    8288:	00070593          	mv	a1,a4
    828c:	00030913          	mv	s2,t1
    8290:	001cf793          	and	a5,s9,1
    8294:	00078e63          	beqz	a5,82b0 <_dtoa_r+0x404>
    8298:	000ba603          	lw	a2,0(s7)
    829c:	004ba683          	lw	a3,4(s7)
    82a0:	00080513          	mv	a0,a6
    82a4:	00140413          	add	s0,s0,1
    82a8:	324050ef          	jal	d5cc <__muldf3>
    82ac:	00050813          	mv	a6,a0
    82b0:	401cdc93          	sra	s9,s9,0x1
    82b4:	008b8b93          	add	s7,s7,8
    82b8:	fc0c9ce3          	bnez	s9,8290 <_dtoa_r+0x3e4>
    82bc:	00090313          	mv	t1,s2
    82c0:	00040913          	mv	s2,s0
    82c4:	04012403          	lw	s0,64(sp)
    82c8:	00058713          	mv	a4,a1
    82cc:	00070693          	mv	a3,a4
    82d0:	00080613          	mv	a2,a6
    82d4:	00030513          	mv	a0,t1
    82d8:	000d0593          	mv	a1,s10
    82dc:	7b0040ef          	jal	ca8c <__divdf3>
    82e0:	00050713          	mv	a4,a0
    82e4:	00058793          	mv	a5,a1
    82e8:	03412683          	lw	a3,52(sp)
    82ec:	02068c63          	beqz	a3,8324 <_dtoa_r+0x478>
    82f0:	7fff8697          	auipc	a3,0x7fff8
    82f4:	3f868693          	add	a3,a3,1016 # 800006e8 <__global_locale+0x1b4>
    82f8:	0006a603          	lw	a2,0(a3)
    82fc:	0046a683          	lw	a3,4(a3)
    8300:	00070513          	mv	a0,a4
    8304:	00078593          	mv	a1,a5
    8308:	04e12423          	sw	a4,72(sp)
    830c:	04f12023          	sw	a5,64(sp)
    8310:	1b4050ef          	jal	d4c4 <__ledf2>
    8314:	04012783          	lw	a5,64(sp)
    8318:	04812703          	lw	a4,72(sp)
    831c:	00055463          	bgez	a0,8324 <_dtoa_r+0x478>
    8320:	04c0106f          	j	936c <_dtoa_r+0x14c0>
    8324:	00090513          	mv	a0,s2
    8328:	04f12623          	sw	a5,76(sp)
    832c:	04e12023          	sw	a4,64(sp)
    8330:	40c060ef          	jal	e73c <__floatsidf>
    8334:	04012703          	lw	a4,64(sp)
    8338:	04c12783          	lw	a5,76(sp)
    833c:	00070613          	mv	a2,a4
    8340:	00078693          	mv	a3,a5
    8344:	04e12423          	sw	a4,72(sp)
    8348:	04f12023          	sw	a5,64(sp)
    834c:	280050ef          	jal	d5cc <__muldf3>
    8350:	7fff8697          	auipc	a3,0x7fff8
    8354:	3a868693          	add	a3,a3,936 # 800006f8 <__global_locale+0x1c4>
    8358:	0006a603          	lw	a2,0(a3)
    835c:	0046a683          	lw	a3,4(a3)
    8360:	665030ef          	jal	c1c4 <__adddf3>
    8364:	fcc006b7          	lui	a3,0xfcc00
    8368:	04012783          	lw	a5,64(sp)
    836c:	04812703          	lw	a4,72(sp)
    8370:	00050c93          	mv	s9,a0
    8374:	00b68bb3          	add	s7,a3,a1
    8378:	340c0463          	beqz	s8,86c0 <_dtoa_r+0x814>
    837c:	02012683          	lw	a3,32(sp)
    8380:	05812423          	sw	s8,72(sp)
    8384:	04d12e23          	sw	a3,92(sp)
    8388:	00070513          	mv	a0,a4
    838c:	00078593          	mv	a1,a5
    8390:	04e12623          	sw	a4,76(sp)
    8394:	04f12023          	sw	a5,64(sp)
    8398:	320060ef          	jal	e6b8 <__fixdfsi>
    839c:	04812783          	lw	a5,72(sp)
    83a0:	00050913          	mv	s2,a0
    83a4:	05912c23          	sw	s9,88(sp)
    83a8:	fff78693          	add	a3,a5,-1
    83ac:	00369693          	sll	a3,a3,0x3
    83b0:	00007797          	auipc	a5,0x7
    83b4:	4b878793          	add	a5,a5,1208 # f868 <__mprec_tens>
    83b8:	00d786b3          	add	a3,a5,a3
    83bc:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    83c0:	0046a803          	lw	a6,4(a3)
    83c4:	001a8d13          	add	s10,s5,1
    83c8:	04f12823          	sw	a5,80(sp)
    83cc:	05012a23          	sw	a6,84(sp)
    83d0:	36c060ef          	jal	e73c <__floatsidf>
    83d4:	04c12703          	lw	a4,76(sp)
    83d8:	04012783          	lw	a5,64(sp)
    83dc:	00050613          	mv	a2,a0
    83e0:	00058693          	mv	a3,a1
    83e4:	00070513          	mv	a0,a4
    83e8:	00078593          	mv	a1,a5
    83ec:	171050ef          	jal	dd5c <__subdf3>
    83f0:	02812703          	lw	a4,40(sp)
    83f4:	03090313          	add	t1,s2,48
    83f8:	05a12023          	sw	s10,64(sp)
    83fc:	00050c93          	mv	s9,a0
    8400:	0ff37313          	zext.b	t1,t1
    8404:	5c0706e3          	beqz	a4,91d0 <_dtoa_r+0x1324>
    8408:	7fff8797          	auipc	a5,0x7fff8
    840c:	2b078793          	add	a5,a5,688 # 800006b8 <__global_locale+0x184>
    8410:	0007a503          	lw	a0,0(a5)
    8414:	05012603          	lw	a2,80(sp)
    8418:	05412683          	lw	a3,84(sp)
    841c:	04b12023          	sw	a1,64(sp)
    8420:	0047a583          	lw	a1,4(a5)
    8424:	04612623          	sw	t1,76(sp)
    8428:	664040ef          	jal	ca8c <__divdf3>
    842c:	05812603          	lw	a2,88(sp)
    8430:	000b8693          	mv	a3,s7
    8434:	129050ef          	jal	dd5c <__subdf3>
    8438:	04012883          	lw	a7,64(sp)
    843c:	04c12303          	lw	t1,76(sp)
    8440:	000c8613          	mv	a2,s9
    8444:	00088693          	mv	a3,a7
    8448:	006a8023          	sb	t1,0(s5)
    844c:	00050913          	mv	s2,a0
    8450:	00058b93          	mv	s7,a1
    8454:	771040ef          	jal	d3c4 <__gedf2>
    8458:	04012883          	lw	a7,64(sp)
    845c:	00a05463          	blez	a0,8464 <_dtoa_r+0x5b8>
    8460:	7c90006f          	j	9428 <_dtoa_r+0x157c>
    8464:	7fff8697          	auipc	a3,0x7fff8
    8468:	28468693          	add	a3,a3,644 # 800006e8 <__global_locale+0x1b4>
    846c:	0006a783          	lw	a5,0(a3)
    8470:	0046a803          	lw	a6,4(a3)
    8474:	05312623          	sw	s3,76(sp)
    8478:	04f12023          	sw	a5,64(sp)
    847c:	00000793          	li	a5,0
    8480:	05612823          	sw	s6,80(sp)
    8484:	05812c23          	sw	s8,88(sp)
    8488:	05012223          	sw	a6,68(sp)
    848c:	04812c03          	lw	s8,72(sp)
    8490:	00078b13          	mv	s6,a5
    8494:	05412423          	sw	s4,72(sp)
    8498:	00088993          	mv	s3,a7
    849c:	0980006f          	j	8534 <_dtoa_r+0x688>
    84a0:	001b0b13          	add	s6,s6,1
    84a4:	018b4463          	blt	s6,s8,84ac <_dtoa_r+0x600>
    84a8:	7d10006f          	j	9478 <_dtoa_r+0x15cc>
    84ac:	7fff8a17          	auipc	s4,0x7fff8
    84b0:	244a0a13          	add	s4,s4,580 # 800006f0 <__global_locale+0x1bc>
    84b4:	000a2603          	lw	a2,0(s4)
    84b8:	004a2683          	lw	a3,4(s4)
    84bc:	00090513          	mv	a0,s2
    84c0:	000b8593          	mv	a1,s7
    84c4:	108050ef          	jal	d5cc <__muldf3>
    84c8:	000a2603          	lw	a2,0(s4)
    84cc:	004a2683          	lw	a3,4(s4)
    84d0:	00050913          	mv	s2,a0
    84d4:	00058b93          	mv	s7,a1
    84d8:	000c8513          	mv	a0,s9
    84dc:	00098593          	mv	a1,s3
    84e0:	0ec050ef          	jal	d5cc <__muldf3>
    84e4:	00058c93          	mv	s9,a1
    84e8:	00050a13          	mv	s4,a0
    84ec:	1cc060ef          	jal	e6b8 <__fixdfsi>
    84f0:	00050993          	mv	s3,a0
    84f4:	248060ef          	jal	e73c <__floatsidf>
    84f8:	00050613          	mv	a2,a0
    84fc:	00058693          	mv	a3,a1
    8500:	000a0513          	mv	a0,s4
    8504:	000c8593          	mv	a1,s9
    8508:	055050ef          	jal	dd5c <__subdf3>
    850c:	03098793          	add	a5,s3,48
    8510:	00090613          	mv	a2,s2
    8514:	000b8693          	mv	a3,s7
    8518:	00fd0023          	sb	a5,0(s10)
    851c:	001d0d13          	add	s10,s10,1
    8520:	00050c93          	mv	s9,a0
    8524:	00058993          	mv	s3,a1
    8528:	79d040ef          	jal	d4c4 <__ledf2>
    852c:	00055463          	bgez	a0,8534 <_dtoa_r+0x688>
    8530:	6f90006f          	j	9428 <_dtoa_r+0x157c>
    8534:	04012503          	lw	a0,64(sp)
    8538:	04412583          	lw	a1,68(sp)
    853c:	000c8613          	mv	a2,s9
    8540:	00098693          	mv	a3,s3
    8544:	019050ef          	jal	dd5c <__subdf3>
    8548:	00090613          	mv	a2,s2
    854c:	000b8693          	mv	a3,s7
    8550:	775040ef          	jal	d4c4 <__ledf2>
    8554:	f40556e3          	bgez	a0,84a0 <_dtoa_r+0x5f4>
    8558:	05c12783          	lw	a5,92(sp)
    855c:	000d0b93          	mv	s7,s10
    8560:	00178c13          	add	s8,a5,1
    8564:	03900613          	li	a2,57
    8568:	0080006f          	j	8570 <_dtoa_r+0x6c4>
    856c:	697a88e3          	beq	s5,s7,93fc <_dtoa_r+0x1550>
    8570:	fffbc683          	lbu	a3,-1(s7)
    8574:	000b8d13          	mv	s10,s7
    8578:	fffb8b93          	add	s7,s7,-1
    857c:	fec688e3          	beq	a3,a2,856c <_dtoa_r+0x6c0>
    8580:	00168693          	add	a3,a3,1
    8584:	0ff6f693          	zext.b	a3,a3
    8588:	00db8023          	sb	a3,0(s7)
    858c:	000c0a13          	mv	s4,s8
    8590:	4f00006f          	j	8a80 <_dtoa_r+0xbd4>
    8594:	00c12683          	lw	a3,12(sp)
    8598:	00002737          	lui	a4,0x2
    859c:	00c99793          	sll	a5,s3,0xc
    85a0:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x7d7>
    85a4:	00c7d793          	srl	a5,a5,0xc
    85a8:	00e6a023          	sw	a4,0(a3)
    85ac:	01b7e7b3          	or	a5,a5,s11
    85b0:	0a078063          	beqz	a5,8650 <_dtoa_r+0x7a4>
    85b4:	00812783          	lw	a5,8(sp)
    85b8:	00007a97          	auipc	s5,0x7
    85bc:	c70a8a93          	add	s5,s5,-912 # f228 <__fini_array_end+0x39c>
    85c0:	9c078ee3          	beqz	a5,7f9c <_dtoa_r+0xf0>
    85c4:	00007797          	auipc	a5,0x7
    85c8:	c6778793          	add	a5,a5,-921 # f22b <__fini_array_end+0x39f>
    85cc:	00812703          	lw	a4,8(sp)
    85d0:	00f72023          	sw	a5,0(a4)
    85d4:	9c9ff06f          	j	7f9c <_dtoa_r+0xf0>
    85d8:	01c12783          	lw	a5,28(sp)
    85dc:	3ff006b7          	lui	a3,0x3ff00
    85e0:	06812a83          	lw	s5,104(sp)
    85e4:	00c79793          	sll	a5,a5,0xc
    85e8:	00c7d793          	srl	a5,a5,0xc
    85ec:	01812703          	lw	a4,24(sp)
    85f0:	00d7e7b3          	or	a5,a5,a3
    85f4:	c0190913          	add	s2,s2,-1023
    85f8:	02012c23          	sw	zero,56(sp)
    85fc:	a51ff06f          	j	804c <_dtoa_r+0x1a0>
    8600:	00100793          	li	a5,1
    8604:	415787b3          	sub	a5,a5,s5
    8608:	00f12823          	sw	a5,16(sp)
    860c:	00000b13          	li	s6,0
    8610:	b409c4e3          	bltz	s3,8158 <_dtoa_r+0x2ac>
    8614:	03312023          	sw	s3,32(sp)
    8618:	02012823          	sw	zero,48(sp)
    861c:	00900793          	li	a5,9
    8620:	013b0b33          	add	s6,s6,s3
    8624:	b547fce3          	bgeu	a5,s4,817c <_dtoa_r+0x2d0>
    8628:	00100793          	li	a5,1
    862c:	00100913          	li	s2,1
    8630:	00000a13          	li	s4,0
    8634:	02f12423          	sw	a5,40(sp)
    8638:	fff00c13          	li	s8,-1
    863c:	00012a23          	sw	zero,20(sp)
    8640:	02042e23          	sw	zero,60(s0)
    8644:	03812e23          	sw	s8,60(sp)
    8648:	00000593          	li	a1,0
    864c:	b99ff06f          	j	81e4 <_dtoa_r+0x338>
    8650:	00812703          	lw	a4,8(sp)
    8654:	00007a97          	auipc	s5,0x7
    8658:	bc8a8a93          	add	s5,s5,-1080 # f21c <__fini_array_end+0x390>
    865c:	00007797          	auipc	a5,0x7
    8660:	bc878793          	add	a5,a5,-1080 # f224 <__fini_array_end+0x398>
    8664:	f60714e3          	bnez	a4,85cc <_dtoa_r+0x720>
    8668:	935ff06f          	j	7f9c <_dtoa_r+0xf0>
    866c:	00090513          	mv	a0,s2
    8670:	04f12623          	sw	a5,76(sp)
    8674:	04e12023          	sw	a4,64(sp)
    8678:	0c4060ef          	jal	e73c <__floatsidf>
    867c:	04012703          	lw	a4,64(sp)
    8680:	04c12783          	lw	a5,76(sp)
    8684:	00070613          	mv	a2,a4
    8688:	00078693          	mv	a3,a5
    868c:	04e12423          	sw	a4,72(sp)
    8690:	04f12023          	sw	a5,64(sp)
    8694:	739040ef          	jal	d5cc <__muldf3>
    8698:	7fff8697          	auipc	a3,0x7fff8
    869c:	06068693          	add	a3,a3,96 # 800006f8 <__global_locale+0x1c4>
    86a0:	0006a603          	lw	a2,0(a3)
    86a4:	0046a683          	lw	a3,4(a3)
    86a8:	31d030ef          	jal	c1c4 <__adddf3>
    86ac:	04012783          	lw	a5,64(sp)
    86b0:	04812703          	lw	a4,72(sp)
    86b4:	fcc006b7          	lui	a3,0xfcc00
    86b8:	00050c93          	mv	s9,a0
    86bc:	00b68bb3          	add	s7,a3,a1
    86c0:	7fff8697          	auipc	a3,0x7fff8
    86c4:	04068693          	add	a3,a3,64 # 80000700 <__global_locale+0x1cc>
    86c8:	0006a603          	lw	a2,0(a3)
    86cc:	0046a683          	lw	a3,4(a3)
    86d0:	00070513          	mv	a0,a4
    86d4:	00078593          	mv	a1,a5
    86d8:	684050ef          	jal	dd5c <__subdf3>
    86dc:	000c8613          	mv	a2,s9
    86e0:	000b8693          	mv	a3,s7
    86e4:	00050d13          	mv	s10,a0
    86e8:	00058913          	mv	s2,a1
    86ec:	4d9040ef          	jal	d3c4 <__gedf2>
    86f0:	50a04ce3          	bgtz	a0,9408 <_dtoa_r+0x155c>
    86f4:	800007b7          	lui	a5,0x80000
    86f8:	0177c7b3          	xor	a5,a5,s7
    86fc:	000c8613          	mv	a2,s9
    8700:	000d0513          	mv	a0,s10
    8704:	00078693          	mv	a3,a5
    8708:	00090593          	mv	a1,s2
    870c:	5b9040ef          	jal	d4c4 <__ledf2>
    8710:	06054c63          	bltz	a0,8788 <_dtoa_r+0x8dc>
    8714:	06c12783          	lw	a5,108(sp)
    8718:	1a07c663          	bltz	a5,88c4 <_dtoa_r+0xa18>
    871c:	02012683          	lw	a3,32(sp)
    8720:	00e00713          	li	a4,14
    8724:	1ad74063          	blt	a4,a3,88c4 <_dtoa_r+0xa18>
    8728:	02012783          	lw	a5,32(sp)
    872c:	00379713          	sll	a4,a5,0x3
    8730:	00007797          	auipc	a5,0x7
    8734:	13878793          	add	a5,a5,312 # f868 <__mprec_tens>
    8738:	00e787b3          	add	a5,a5,a4
    873c:	0007a903          	lw	s2,0(a5)
    8740:	0047a983          	lw	s3,4(a5)
    8744:	01412783          	lw	a5,20(sp)
    8748:	0407dc63          	bgez	a5,87a0 <_dtoa_r+0x8f4>
    874c:	05804a63          	bgtz	s8,87a0 <_dtoa_r+0x8f4>
    8750:	020c1c63          	bnez	s8,8788 <_dtoa_r+0x8dc>
    8754:	7fff8797          	auipc	a5,0x7fff8
    8758:	fac78793          	add	a5,a5,-84 # 80000700 <__global_locale+0x1cc>
    875c:	0007a603          	lw	a2,0(a5)
    8760:	0047a683          	lw	a3,4(a5)
    8764:	00090513          	mv	a0,s2
    8768:	00098593          	mv	a1,s3
    876c:	661040ef          	jal	d5cc <__muldf3>
    8770:	00050613          	mv	a2,a0
    8774:	00058693          	mv	a3,a1
    8778:	01812503          	lw	a0,24(sp)
    877c:	01c12583          	lw	a1,28(sp)
    8780:	545040ef          	jal	d4c4 <__ledf2>
    8784:	48a042e3          	bgtz	a0,9408 <_dtoa_r+0x155c>
    8788:	000a8d13          	mv	s10,s5
    878c:	00012c23          	sw	zero,24(sp)
    8790:	00000913          	li	s2,0
    8794:	01412783          	lw	a5,20(sp)
    8798:	fff7ca13          	not	s4,a5
    879c:	6980006f          	j	8e34 <_dtoa_r+0xf88>
    87a0:	001a8793          	add	a5,s5,1
    87a4:	04f12023          	sw	a5,64(sp)
    87a8:	01812b03          	lw	s6,24(sp)
    87ac:	01c12a03          	lw	s4,28(sp)
    87b0:	00090613          	mv	a2,s2
    87b4:	00098693          	mv	a3,s3
    87b8:	000b0513          	mv	a0,s6
    87bc:	000a0593          	mv	a1,s4
    87c0:	2cc040ef          	jal	ca8c <__divdf3>
    87c4:	6f5050ef          	jal	e6b8 <__fixdfsi>
    87c8:	00050d13          	mv	s10,a0
    87cc:	771050ef          	jal	e73c <__floatsidf>
    87d0:	00090613          	mv	a2,s2
    87d4:	00098693          	mv	a3,s3
    87d8:	5f5040ef          	jal	d5cc <__muldf3>
    87dc:	00050613          	mv	a2,a0
    87e0:	00058693          	mv	a3,a1
    87e4:	000b0513          	mv	a0,s6
    87e8:	000a0593          	mv	a1,s4
    87ec:	570050ef          	jal	dd5c <__subdf3>
    87f0:	030d0793          	add	a5,s10,48
    87f4:	00fa8023          	sb	a5,0(s5)
    87f8:	00100613          	li	a2,1
    87fc:	04012b83          	lw	s7,64(sp)
    8800:	00050713          	mv	a4,a0
    8804:	00058693          	mv	a3,a1
    8808:	0ccc0ee3          	beq	s8,a2,90e4 <_dtoa_r+0x1238>
    880c:	7fff8617          	auipc	a2,0x7fff8
    8810:	ee460613          	add	a2,a2,-284 # 800006f0 <__global_locale+0x1bc>
    8814:	00062783          	lw	a5,0(a2)
    8818:	00462803          	lw	a6,4(a2)
    881c:	00100d93          	li	s11,1
    8820:	00f12023          	sw	a5,0(sp)
    8824:	01012223          	sw	a6,4(sp)
    8828:	0600006f          	j	8888 <_dtoa_r+0x9dc>
    882c:	00090613          	mv	a2,s2
    8830:	00098693          	mv	a3,s3
    8834:	000b0513          	mv	a0,s6
    8838:	000a0593          	mv	a1,s4
    883c:	250040ef          	jal	ca8c <__divdf3>
    8840:	679050ef          	jal	e6b8 <__fixdfsi>
    8844:	00050d13          	mv	s10,a0
    8848:	6f5050ef          	jal	e73c <__floatsidf>
    884c:	00090613          	mv	a2,s2
    8850:	00098693          	mv	a3,s3
    8854:	579040ef          	jal	d5cc <__muldf3>
    8858:	00058693          	mv	a3,a1
    885c:	00050613          	mv	a2,a0
    8860:	000a0593          	mv	a1,s4
    8864:	000b0513          	mv	a0,s6
    8868:	4f4050ef          	jal	dd5c <__subdf3>
    886c:	001b8b93          	add	s7,s7,1
    8870:	030d0793          	add	a5,s10,48
    8874:	001d8d93          	add	s11,s11,1
    8878:	fefb8fa3          	sb	a5,-1(s7)
    887c:	00050713          	mv	a4,a0
    8880:	00058693          	mv	a3,a1
    8884:	07bc00e3          	beq	s8,s11,90e4 <_dtoa_r+0x1238>
    8888:	00012603          	lw	a2,0(sp)
    888c:	00068593          	mv	a1,a3
    8890:	00412683          	lw	a3,4(sp)
    8894:	00070513          	mv	a0,a4
    8898:	535040ef          	jal	d5cc <__muldf3>
    889c:	00000613          	li	a2,0
    88a0:	00000693          	li	a3,0
    88a4:	00050b13          	mv	s6,a0
    88a8:	00058a13          	mv	s4,a1
    88ac:	28d040ef          	jal	d338 <__eqdf2>
    88b0:	f6051ee3          	bnez	a0,882c <_dtoa_r+0x980>
    88b4:	02012783          	lw	a5,32(sp)
    88b8:	000b8d13          	mv	s10,s7
    88bc:	00178a13          	add	s4,a5,1
    88c0:	1c00006f          	j	8a80 <_dtoa_r+0xbd4>
    88c4:	02812703          	lw	a4,40(sp)
    88c8:	26071463          	bnez	a4,8b30 <_dtoa_r+0xc84>
    88cc:	03012b83          	lw	s7,48(sp)
    88d0:	01012c83          	lw	s9,16(sp)
    88d4:	02012423          	sw	zero,40(sp)
    88d8:	00000913          	li	s2,0
    88dc:	020c8263          	beqz	s9,8900 <_dtoa_r+0xa54>
    88e0:	03605063          	blez	s6,8900 <_dtoa_r+0xa54>
    88e4:	000c8793          	mv	a5,s9
    88e8:	679b4263          	blt	s6,s9,8f4c <_dtoa_r+0x10a0>
    88ec:	01012703          	lw	a4,16(sp)
    88f0:	40fc8cb3          	sub	s9,s9,a5
    88f4:	40fb0b33          	sub	s6,s6,a5
    88f8:	40f70733          	sub	a4,a4,a5
    88fc:	00e12823          	sw	a4,16(sp)
    8900:	03012783          	lw	a5,48(sp)
    8904:	02078263          	beqz	a5,8928 <_dtoa_r+0xa7c>
    8908:	02812783          	lw	a5,40(sp)
    890c:	00078463          	beqz	a5,8914 <_dtoa_r+0xa68>
    8910:	060b9ae3          	bnez	s7,9184 <_dtoa_r+0x12d8>
    8914:	03012603          	lw	a2,48(sp)
    8918:	00048593          	mv	a1,s1
    891c:	00040513          	mv	a0,s0
    8920:	3a4010ef          	jal	9cc4 <__pow5mult>
    8924:	00050493          	mv	s1,a0
    8928:	00100593          	li	a1,1
    892c:	00040513          	mv	a0,s0
    8930:	01c010ef          	jal	994c <__i2b>
    8934:	00a12c23          	sw	a0,24(sp)
    8938:	50099a63          	bnez	s3,8e4c <_dtoa_r+0xfa0>
    893c:	00100793          	li	a5,1
    8940:	5547da63          	bge	a5,s4,8e94 <_dtoa_r+0xfe8>
    8944:	016787b3          	add	a5,a5,s6
    8948:	01f7f793          	and	a5,a5,31
    894c:	1c078e63          	beqz	a5,8b28 <_dtoa_r+0xc7c>
    8950:	02000713          	li	a4,32
    8954:	40f70733          	sub	a4,a4,a5
    8958:	00400693          	li	a3,4
    895c:	58e6d263          	bge	a3,a4,8ee0 <_dtoa_r+0x1034>
    8960:	01c00713          	li	a4,28
    8964:	40f707b3          	sub	a5,a4,a5
    8968:	01012703          	lw	a4,16(sp)
    896c:	00fc8cb3          	add	s9,s9,a5
    8970:	00fb0b33          	add	s6,s6,a5
    8974:	00f70733          	add	a4,a4,a5
    8978:	00e12823          	sw	a4,16(sp)
    897c:	01012783          	lw	a5,16(sp)
    8980:	12f04e63          	bgtz	a5,8abc <_dtoa_r+0xc10>
    8984:	01605c63          	blez	s6,899c <_dtoa_r+0xaf0>
    8988:	01812583          	lw	a1,24(sp)
    898c:	000b0613          	mv	a2,s6
    8990:	00040513          	mv	a0,s0
    8994:	480010ef          	jal	9e14 <__lshift>
    8998:	00a12c23          	sw	a0,24(sp)
    899c:	03412783          	lw	a5,52(sp)
    89a0:	12079a63          	bnez	a5,8ad4 <_dtoa_r+0xc28>
    89a4:	45805263          	blez	s8,8de8 <_dtoa_r+0xf3c>
    89a8:	02812783          	lw	a5,40(sp)
    89ac:	24079e63          	bnez	a5,8c08 <_dtoa_r+0xd5c>
    89b0:	02012783          	lw	a5,32(sp)
    89b4:	00178a13          	add	s4,a5,1
    89b8:	01812b03          	lw	s6,24(sp)
    89bc:	00100993          	li	s3,1
    89c0:	0200006f          	j	89e0 <_dtoa_r+0xb34>
    89c4:	00048593          	mv	a1,s1
    89c8:	00000693          	li	a3,0
    89cc:	00a00613          	li	a2,10
    89d0:	00040513          	mv	a0,s0
    89d4:	49d000ef          	jal	9670 <__multadd>
    89d8:	00050493          	mv	s1,a0
    89dc:	00198993          	add	s3,s3,1
    89e0:	000b0593          	mv	a1,s6
    89e4:	00048513          	mv	a0,s1
    89e8:	a64ff0ef          	jal	7c4c <quorem>
    89ec:	03050b93          	add	s7,a0,48
    89f0:	013a87b3          	add	a5,s5,s3
    89f4:	ff778fa3          	sb	s7,-1(a5)
    89f8:	fd89c6e3          	blt	s3,s8,89c4 <_dtoa_r+0xb18>
    89fc:	00100993          	li	s3,1
    8a00:	55804263          	bgtz	s8,8f44 <_dtoa_r+0x1098>
    8a04:	013a89b3          	add	s3,s5,s3
    8a08:	00000c13          	li	s8,0
    8a0c:	00048593          	mv	a1,s1
    8a10:	00100613          	li	a2,1
    8a14:	00040513          	mv	a0,s0
    8a18:	3fc010ef          	jal	9e14 <__lshift>
    8a1c:	01812583          	lw	a1,24(sp)
    8a20:	00050493          	mv	s1,a0
    8a24:	580010ef          	jal	9fa4 <__mcmp>
    8a28:	4ea05c63          	blez	a0,8f20 <_dtoa_r+0x1074>
    8a2c:	03900693          	li	a3,57
    8a30:	0080006f          	j	8a38 <_dtoa_r+0xb8c>
    8a34:	5f3a8863          	beq	s5,s3,9024 <_dtoa_r+0x1178>
    8a38:	fff9c783          	lbu	a5,-1(s3)
    8a3c:	00098d13          	mv	s10,s3
    8a40:	fff98993          	add	s3,s3,-1
    8a44:	fed788e3          	beq	a5,a3,8a34 <_dtoa_r+0xb88>
    8a48:	00178793          	add	a5,a5,1
    8a4c:	00f98023          	sb	a5,0(s3)
    8a50:	01812583          	lw	a1,24(sp)
    8a54:	00040513          	mv	a0,s0
    8a58:	3f5000ef          	jal	964c <_Bfree>
    8a5c:	02090263          	beqz	s2,8a80 <_dtoa_r+0xbd4>
    8a60:	000c0a63          	beqz	s8,8a74 <_dtoa_r+0xbc8>
    8a64:	012c0863          	beq	s8,s2,8a74 <_dtoa_r+0xbc8>
    8a68:	000c0593          	mv	a1,s8
    8a6c:	00040513          	mv	a0,s0
    8a70:	3dd000ef          	jal	964c <_Bfree>
    8a74:	00090593          	mv	a1,s2
    8a78:	00040513          	mv	a0,s0
    8a7c:	3d1000ef          	jal	964c <_Bfree>
    8a80:	00048593          	mv	a1,s1
    8a84:	00040513          	mv	a0,s0
    8a88:	3c5000ef          	jal	964c <_Bfree>
    8a8c:	00c12783          	lw	a5,12(sp)
    8a90:	000d0023          	sb	zero,0(s10)
    8a94:	0147a023          	sw	s4,0(a5)
    8a98:	00812783          	lw	a5,8(sp)
    8a9c:	00078463          	beqz	a5,8aa4 <_dtoa_r+0xbf8>
    8aa0:	01a7a023          	sw	s10,0(a5)
    8aa4:	09012b03          	lw	s6,144(sp)
    8aa8:	08c12b83          	lw	s7,140(sp)
    8aac:	08812c03          	lw	s8,136(sp)
    8ab0:	08412c83          	lw	s9,132(sp)
    8ab4:	08012d03          	lw	s10,128(sp)
    8ab8:	ce4ff06f          	j	7f9c <_dtoa_r+0xf0>
    8abc:	00048593          	mv	a1,s1
    8ac0:	00078613          	mv	a2,a5
    8ac4:	00040513          	mv	a0,s0
    8ac8:	34c010ef          	jal	9e14 <__lshift>
    8acc:	00050493          	mv	s1,a0
    8ad0:	eb5ff06f          	j	8984 <_dtoa_r+0xad8>
    8ad4:	01812583          	lw	a1,24(sp)
    8ad8:	00048513          	mv	a0,s1
    8adc:	4c8010ef          	jal	9fa4 <__mcmp>
    8ae0:	ec0552e3          	bgez	a0,89a4 <_dtoa_r+0xaf8>
    8ae4:	02012783          	lw	a5,32(sp)
    8ae8:	00048593          	mv	a1,s1
    8aec:	00000693          	li	a3,0
    8af0:	00a00613          	li	a2,10
    8af4:	00040513          	mv	a0,s0
    8af8:	fff78b13          	add	s6,a5,-1
    8afc:	375000ef          	jal	9670 <__multadd>
    8b00:	02812783          	lw	a5,40(sp)
    8b04:	00050493          	mv	s1,a0
    8b08:	0c079e63          	bnez	a5,8be4 <_dtoa_r+0xd38>
    8b0c:	03c12c03          	lw	s8,60(sp)
    8b10:	17805ee3          	blez	s8,948c <_dtoa_r+0x15e0>
    8b14:	02012a03          	lw	s4,32(sp)
    8b18:	ea1ff06f          	j	89b8 <_dtoa_r+0xb0c>
    8b1c:	00100793          	li	a5,1
    8b20:	02f12a23          	sw	a5,52(sp)
    8b24:	e28ff06f          	j	814c <_dtoa_r+0x2a0>
    8b28:	01c00793          	li	a5,28
    8b2c:	e3dff06f          	j	8968 <_dtoa_r+0xabc>
    8b30:	00100713          	li	a4,1
    8b34:	4d475463          	bge	a4,s4,8ffc <_dtoa_r+0x1150>
    8b38:	03012783          	lw	a5,48(sp)
    8b3c:	fffc0b93          	add	s7,s8,-1
    8b40:	4177ca63          	blt	a5,s7,8f54 <_dtoa_r+0x10a8>
    8b44:	41778bb3          	sub	s7,a5,s7
    8b48:	01012783          	lw	a5,16(sp)
    8b4c:	41878cb3          	sub	s9,a5,s8
    8b50:	100c54e3          	bgez	s8,9458 <_dtoa_r+0x15ac>
    8b54:	00100593          	li	a1,1
    8b58:	00040513          	mv	a0,s0
    8b5c:	5f1000ef          	jal	994c <__i2b>
    8b60:	00050913          	mv	s2,a0
    8b64:	d79ff06f          	j	88dc <_dtoa_r+0xa30>
    8b68:	02012a23          	sw	zero,52(sp)
    8b6c:	00012823          	sw	zero,16(sp)
    8b70:	ab5042e3          	bgtz	s5,8614 <_dtoa_r+0x768>
    8b74:	00100793          	li	a5,1
    8b78:	415787b3          	sub	a5,a5,s5
    8b7c:	00f12823          	sw	a5,16(sp)
    8b80:	00000b13          	li	s6,0
    8b84:	a91ff06f          	j	8614 <_dtoa_r+0x768>
    8b88:	40e787b3          	sub	a5,a5,a4
    8b8c:	00fd9533          	sll	a0,s11,a5
    8b90:	ca0ff06f          	j	8030 <_dtoa_r+0x184>
    8b94:	00300793          	li	a5,3
    8b98:	00100913          	li	s2,1
    8b9c:	44fa0c63          	beq	s4,a5,8ff4 <_dtoa_r+0x1148>
    8ba0:	df47cc63          	blt	a5,s4,8198 <_dtoa_r+0x2ec>
    8ba4:	00200793          	li	a5,2
    8ba8:	18fa00e3          	beq	s4,a5,9528 <_dtoa_r+0x167c>
    8bac:	02042e23          	sw	zero,60(s0)
    8bb0:	00000593          	li	a1,0
    8bb4:	00040513          	mv	a0,s0
    8bb8:	1e1000ef          	jal	9598 <_Balloc>
    8bbc:	00050a93          	mv	s5,a0
    8bc0:	140500e3          	beqz	a0,9500 <_dtoa_r+0x1654>
    8bc4:	00100793          	li	a5,1
    8bc8:	02f12423          	sw	a5,40(sp)
    8bcc:	fff00793          	li	a5,-1
    8bd0:	02a42c23          	sw	a0,56(s0)
    8bd4:	02f12e23          	sw	a5,60(sp)
    8bd8:	fff00c13          	li	s8,-1
    8bdc:	00012a23          	sw	zero,20(sp)
    8be0:	b35ff06f          	j	8714 <_dtoa_r+0x868>
    8be4:	00090593          	mv	a1,s2
    8be8:	00000693          	li	a3,0
    8bec:	00a00613          	li	a2,10
    8bf0:	00040513          	mv	a0,s0
    8bf4:	27d000ef          	jal	9670 <__multadd>
    8bf8:	03c12c03          	lw	s8,60(sp)
    8bfc:	00050913          	mv	s2,a0
    8c00:	0b805ae3          	blez	s8,94b4 <_dtoa_r+0x1608>
    8c04:	03612023          	sw	s6,32(sp)
    8c08:	01905c63          	blez	s9,8c20 <_dtoa_r+0xd74>
    8c0c:	00090593          	mv	a1,s2
    8c10:	000c8613          	mv	a2,s9
    8c14:	00040513          	mv	a0,s0
    8c18:	1fc010ef          	jal	9e14 <__lshift>
    8c1c:	00050913          	mv	s2,a0
    8c20:	00090b13          	mv	s6,s2
    8c24:	50099e63          	bnez	s3,9140 <_dtoa_r+0x1294>
    8c28:	02412783          	lw	a5,36(sp)
    8c2c:	fffa8d13          	add	s10,s5,-1
    8c30:	000a8c93          	mv	s9,s5
    8c34:	01512823          	sw	s5,16(sp)
    8c38:	01812a83          	lw	s5,24(sp)
    8c3c:	0017f793          	and	a5,a5,1
    8c40:	018d0d33          	add	s10,s10,s8
    8c44:	00f12023          	sw	a5,0(sp)
    8c48:	01b12a23          	sw	s11,20(sp)
    8c4c:	000a8593          	mv	a1,s5
    8c50:	00048513          	mv	a0,s1
    8c54:	ff9fe0ef          	jal	7c4c <quorem>
    8c58:	00050c13          	mv	s8,a0
    8c5c:	00090593          	mv	a1,s2
    8c60:	00048513          	mv	a0,s1
    8c64:	340010ef          	jal	9fa4 <__mcmp>
    8c68:	00050993          	mv	s3,a0
    8c6c:	000b0613          	mv	a2,s6
    8c70:	000a8593          	mv	a1,s5
    8c74:	00040513          	mv	a0,s0
    8c78:	384010ef          	jal	9ffc <__mdiff>
    8c7c:	00c52703          	lw	a4,12(a0)
    8c80:	030c0b93          	add	s7,s8,48
    8c84:	00050d93          	mv	s11,a0
    8c88:	08071c63          	bnez	a4,8d20 <_dtoa_r+0xe74>
    8c8c:	00050593          	mv	a1,a0
    8c90:	00048513          	mv	a0,s1
    8c94:	310010ef          	jal	9fa4 <__mcmp>
    8c98:	00050713          	mv	a4,a0
    8c9c:	000d8593          	mv	a1,s11
    8ca0:	00040513          	mv	a0,s0
    8ca4:	00070d93          	mv	s11,a4
    8ca8:	1a5000ef          	jal	964c <_Bfree>
    8cac:	014de6b3          	or	a3,s11,s4
    8cb0:	0e069a63          	bnez	a3,8da4 <_dtoa_r+0xef8>
    8cb4:	00012783          	lw	a5,0(sp)
    8cb8:	76078e63          	beqz	a5,9434 <_dtoa_r+0x1588>
    8cbc:	7809c663          	bltz	s3,9448 <_dtoa_r+0x159c>
    8cc0:	017c8023          	sb	s7,0(s9)
    8cc4:	001c8993          	add	s3,s9,1
    8cc8:	679d0e63          	beq	s10,s9,9344 <_dtoa_r+0x1498>
    8ccc:	00048593          	mv	a1,s1
    8cd0:	00000693          	li	a3,0
    8cd4:	00a00613          	li	a2,10
    8cd8:	00040513          	mv	a0,s0
    8cdc:	195000ef          	jal	9670 <__multadd>
    8ce0:	00050493          	mv	s1,a0
    8ce4:	00000693          	li	a3,0
    8ce8:	00a00613          	li	a2,10
    8cec:	00090593          	mv	a1,s2
    8cf0:	00040513          	mv	a0,s0
    8cf4:	09690e63          	beq	s2,s6,8d90 <_dtoa_r+0xee4>
    8cf8:	179000ef          	jal	9670 <__multadd>
    8cfc:	000b0593          	mv	a1,s6
    8d00:	00050913          	mv	s2,a0
    8d04:	00000693          	li	a3,0
    8d08:	00a00613          	li	a2,10
    8d0c:	00040513          	mv	a0,s0
    8d10:	161000ef          	jal	9670 <__multadd>
    8d14:	00050b13          	mv	s6,a0
    8d18:	00098c93          	mv	s9,s3
    8d1c:	f31ff06f          	j	8c4c <_dtoa_r+0xda0>
    8d20:	00050593          	mv	a1,a0
    8d24:	00040513          	mv	a0,s0
    8d28:	01012a83          	lw	s5,16(sp)
    8d2c:	01412d83          	lw	s11,20(sp)
    8d30:	11d000ef          	jal	964c <_Bfree>
    8d34:	0009ca63          	bltz	s3,8d48 <_dtoa_r+0xe9c>
    8d38:	001df713          	and	a4,s11,1
    8d3c:	0149e9b3          	or	s3,s3,s4
    8d40:	01376733          	or	a4,a4,s3
    8d44:	06071e63          	bnez	a4,8dc0 <_dtoa_r+0xf14>
    8d48:	00048593          	mv	a1,s1
    8d4c:	00100613          	li	a2,1
    8d50:	00040513          	mv	a0,s0
    8d54:	0c0010ef          	jal	9e14 <__lshift>
    8d58:	01812583          	lw	a1,24(sp)
    8d5c:	00050493          	mv	s1,a0
    8d60:	244010ef          	jal	9fa4 <__mcmp>
    8d64:	24a05863          	blez	a0,8fb4 <_dtoa_r+0x1108>
    8d68:	03900713          	li	a4,57
    8d6c:	24eb8c63          	beq	s7,a4,8fc4 <_dtoa_r+0x1118>
    8d70:	031c0b93          	add	s7,s8,49
    8d74:	02012783          	lw	a5,32(sp)
    8d78:	00090c13          	mv	s8,s2
    8d7c:	001c8d13          	add	s10,s9,1
    8d80:	017c8023          	sb	s7,0(s9)
    8d84:	00178a13          	add	s4,a5,1
    8d88:	000b0913          	mv	s2,s6
    8d8c:	cc5ff06f          	j	8a50 <_dtoa_r+0xba4>
    8d90:	0e1000ef          	jal	9670 <__multadd>
    8d94:	00050913          	mv	s2,a0
    8d98:	00050b13          	mv	s6,a0
    8d9c:	00098c93          	mv	s9,s3
    8da0:	eadff06f          	j	8c4c <_dtoa_r+0xda0>
    8da4:	7409c863          	bltz	s3,94f4 <_dtoa_r+0x1648>
    8da8:	00012783          	lw	a5,0(sp)
    8dac:	0149e9b3          	or	s3,s3,s4
    8db0:	0137e9b3          	or	s3,a5,s3
    8db4:	74098063          	beqz	s3,94f4 <_dtoa_r+0x1648>
    8db8:	f1b054e3          	blez	s11,8cc0 <_dtoa_r+0xe14>
    8dbc:	01012a83          	lw	s5,16(sp)
    8dc0:	03900713          	li	a4,57
    8dc4:	20eb8063          	beq	s7,a4,8fc4 <_dtoa_r+0x1118>
    8dc8:	02012703          	lw	a4,32(sp)
    8dcc:	001b8793          	add	a5,s7,1
    8dd0:	00090c13          	mv	s8,s2
    8dd4:	001c8d13          	add	s10,s9,1
    8dd8:	00170a13          	add	s4,a4,1
    8ddc:	00fc8023          	sb	a5,0(s9)
    8de0:	000b0913          	mv	s2,s6
    8de4:	c6dff06f          	j	8a50 <_dtoa_r+0xba4>
    8de8:	00200793          	li	a5,2
    8dec:	bb47dee3          	bge	a5,s4,89a8 <_dtoa_r+0xafc>
    8df0:	000a8d13          	mv	s10,s5
    8df4:	9a0c10e3          	bnez	s8,8794 <_dtoa_r+0x8e8>
    8df8:	01812583          	lw	a1,24(sp)
    8dfc:	00000693          	li	a3,0
    8e00:	00500613          	li	a2,5
    8e04:	00040513          	mv	a0,s0
    8e08:	069000ef          	jal	9670 <__multadd>
    8e0c:	00050593          	mv	a1,a0
    8e10:	00a12c23          	sw	a0,24(sp)
    8e14:	00048513          	mv	a0,s1
    8e18:	18c010ef          	jal	9fa4 <__mcmp>
    8e1c:	96a05ce3          	blez	a0,8794 <_dtoa_r+0x8e8>
    8e20:	03100793          	li	a5,49
    8e24:	00fa8023          	sb	a5,0(s5)
    8e28:	02012783          	lw	a5,32(sp)
    8e2c:	001a8d13          	add	s10,s5,1
    8e30:	00178a13          	add	s4,a5,1
    8e34:	01812583          	lw	a1,24(sp)
    8e38:	00040513          	mv	a0,s0
    8e3c:	001a0a13          	add	s4,s4,1
    8e40:	00d000ef          	jal	964c <_Bfree>
    8e44:	c20918e3          	bnez	s2,8a74 <_dtoa_r+0xbc8>
    8e48:	c39ff06f          	j	8a80 <_dtoa_r+0xbd4>
    8e4c:	00050593          	mv	a1,a0
    8e50:	00098613          	mv	a2,s3
    8e54:	00040513          	mv	a0,s0
    8e58:	66d000ef          	jal	9cc4 <__pow5mult>
    8e5c:	00100793          	li	a5,1
    8e60:	00a12c23          	sw	a0,24(sp)
    8e64:	1147de63          	bge	a5,s4,8f80 <_dtoa_r+0x10d4>
    8e68:	00000993          	li	s3,0
    8e6c:	01812703          	lw	a4,24(sp)
    8e70:	01072783          	lw	a5,16(a4)
    8e74:	00378793          	add	a5,a5,3
    8e78:	00279793          	sll	a5,a5,0x2
    8e7c:	00f707b3          	add	a5,a4,a5
    8e80:	0047a503          	lw	a0,4(a5)
    8e84:	171000ef          	jal	97f4 <__hi0bits>
    8e88:	02000793          	li	a5,32
    8e8c:	40a787b3          	sub	a5,a5,a0
    8e90:	ab5ff06f          	j	8944 <_dtoa_r+0xa98>
    8e94:	02412783          	lw	a5,36(sp)
    8e98:	04079063          	bnez	a5,8ed8 <_dtoa_r+0x102c>
    8e9c:	00012783          	lw	a5,0(sp)
    8ea0:	00c79793          	sll	a5,a5,0xc
    8ea4:	02079a63          	bnez	a5,8ed8 <_dtoa_r+0x102c>
    8ea8:	00012683          	lw	a3,0(sp)
    8eac:	00000793          	li	a5,0
    8eb0:	0146d713          	srl	a4,a3,0x14
    8eb4:	7ff77713          	and	a4,a4,2047
    8eb8:	00070c63          	beqz	a4,8ed0 <_dtoa_r+0x1024>
    8ebc:	01012783          	lw	a5,16(sp)
    8ec0:	001b0b13          	add	s6,s6,1
    8ec4:	00178793          	add	a5,a5,1
    8ec8:	00f12823          	sw	a5,16(sp)
    8ecc:	00100793          	li	a5,1
    8ed0:	58099063          	bnez	s3,9450 <_dtoa_r+0x15a4>
    8ed4:	00078993          	mv	s3,a5
    8ed8:	00100793          	li	a5,1
    8edc:	a69ff06f          	j	8944 <_dtoa_r+0xa98>
    8ee0:	a8d70ee3          	beq	a4,a3,897c <_dtoa_r+0xad0>
    8ee4:	03c00713          	li	a4,60
    8ee8:	40f707b3          	sub	a5,a4,a5
    8eec:	a7dff06f          	j	8968 <_dtoa_r+0xabc>
    8ef0:	00100793          	li	a5,1
    8ef4:	00500a13          	li	s4,5
    8ef8:	02f12423          	sw	a5,40(sp)
    8efc:	01412783          	lw	a5,20(sp)
    8f00:	02012703          	lw	a4,32(sp)
    8f04:	00e787b3          	add	a5,a5,a4
    8f08:	00178c13          	add	s8,a5,1
    8f0c:	02f12e23          	sw	a5,60(sp)
    8f10:	000c0613          	mv	a2,s8
    8f14:	ab804263          	bgtz	s8,81b8 <_dtoa_r+0x30c>
    8f18:	00100613          	li	a2,1
    8f1c:	a9cff06f          	j	81b8 <_dtoa_r+0x30c>
    8f20:	00051663          	bnez	a0,8f2c <_dtoa_r+0x1080>
    8f24:	001bf793          	and	a5,s7,1
    8f28:	b00792e3          	bnez	a5,8a2c <_dtoa_r+0xb80>
    8f2c:	03000693          	li	a3,48
    8f30:	fff9c783          	lbu	a5,-1(s3)
    8f34:	00098d13          	mv	s10,s3
    8f38:	fff98993          	add	s3,s3,-1
    8f3c:	fed78ae3          	beq	a5,a3,8f30 <_dtoa_r+0x1084>
    8f40:	b11ff06f          	j	8a50 <_dtoa_r+0xba4>
    8f44:	000c0993          	mv	s3,s8
    8f48:	abdff06f          	j	8a04 <_dtoa_r+0xb58>
    8f4c:	000b0793          	mv	a5,s6
    8f50:	99dff06f          	j	88ec <_dtoa_r+0xa40>
    8f54:	03012783          	lw	a5,48(sp)
    8f58:	01012703          	lw	a4,16(sp)
    8f5c:	03712823          	sw	s7,48(sp)
    8f60:	40fb87b3          	sub	a5,s7,a5
    8f64:	00f989b3          	add	s3,s3,a5
    8f68:	018707b3          	add	a5,a4,s8
    8f6c:	00070c93          	mv	s9,a4
    8f70:	018b0b33          	add	s6,s6,s8
    8f74:	00f12823          	sw	a5,16(sp)
    8f78:	00000b93          	li	s7,0
    8f7c:	bd9ff06f          	j	8b54 <_dtoa_r+0xca8>
    8f80:	02412783          	lw	a5,36(sp)
    8f84:	ee0792e3          	bnez	a5,8e68 <_dtoa_r+0xfbc>
    8f88:	00012783          	lw	a5,0(sp)
    8f8c:	00c79793          	sll	a5,a5,0xc
    8f90:	ec079ce3          	bnez	a5,8e68 <_dtoa_r+0xfbc>
    8f94:	f15ff06f          	j	8ea8 <_dtoa_r+0xffc>
    8f98:	01812303          	lw	t1,24(sp)
    8f9c:	01c12d03          	lw	s10,28(sp)
    8fa0:	00200913          	li	s2,2
    8fa4:	ad0ff06f          	j	8274 <_dtoa_r+0x3c8>
    8fa8:	00200a13          	li	s4,2
    8fac:	02012423          	sw	zero,40(sp)
    8fb0:	9f8ff06f          	j	81a8 <_dtoa_r+0x2fc>
    8fb4:	dc0510e3          	bnez	a0,8d74 <_dtoa_r+0xec8>
    8fb8:	001bf713          	and	a4,s7,1
    8fbc:	da0716e3          	bnez	a4,8d68 <_dtoa_r+0xebc>
    8fc0:	db5ff06f          	j	8d74 <_dtoa_r+0xec8>
    8fc4:	03900793          	li	a5,57
    8fc8:	00fc8023          	sb	a5,0(s9)
    8fcc:	02012783          	lw	a5,32(sp)
    8fd0:	00090c13          	mv	s8,s2
    8fd4:	001c8993          	add	s3,s9,1
    8fd8:	00178a13          	add	s4,a5,1
    8fdc:	000b0913          	mv	s2,s6
    8fe0:	a4dff06f          	j	8a2c <_dtoa_r+0xb80>
    8fe4:	00100793          	li	a5,1
    8fe8:	00100c13          	li	s8,1
    8fec:	00f12a23          	sw	a5,20(sp)
    8ff0:	e50ff06f          	j	8640 <_dtoa_r+0x794>
    8ff4:	02012423          	sw	zero,40(sp)
    8ff8:	f05ff06f          	j	8efc <_dtoa_r+0x1050>
    8ffc:	03812703          	lw	a4,56(sp)
    9000:	30070e63          	beqz	a4,931c <_dtoa_r+0x1470>
    9004:	01012703          	lw	a4,16(sp)
    9008:	43378793          	add	a5,a5,1075
    900c:	00fb0b33          	add	s6,s6,a5
    9010:	00f707b3          	add	a5,a4,a5
    9014:	03012b83          	lw	s7,48(sp)
    9018:	00070c93          	mv	s9,a4
    901c:	00f12823          	sw	a5,16(sp)
    9020:	b35ff06f          	j	8b54 <_dtoa_r+0xca8>
    9024:	03100793          	li	a5,49
    9028:	00fa8023          	sb	a5,0(s5)
    902c:	001a0a13          	add	s4,s4,1
    9030:	a21ff06f          	j	8a50 <_dtoa_r+0xba4>
    9034:	02012783          	lw	a5,32(sp)
    9038:	32078263          	beqz	a5,935c <_dtoa_r+0x14b0>
    903c:	40f00bb3          	neg	s7,a5
    9040:	00fbf713          	and	a4,s7,15
    9044:	00371713          	sll	a4,a4,0x3
    9048:	00007797          	auipc	a5,0x7
    904c:	82078793          	add	a5,a5,-2016 # f868 <__mprec_tens>
    9050:	00e787b3          	add	a5,a5,a4
    9054:	0007a603          	lw	a2,0(a5)
    9058:	0047a683          	lw	a3,4(a5)
    905c:	01812503          	lw	a0,24(sp)
    9060:	01c12583          	lw	a1,28(sp)
    9064:	404bdb93          	sra	s7,s7,0x4
    9068:	564040ef          	jal	d5cc <__muldf3>
    906c:	00058d13          	mv	s10,a1
    9070:	440b8c63          	beqz	s7,94c8 <_dtoa_r+0x161c>
    9074:	00200913          	li	s2,2
    9078:	04812023          	sw	s0,64(sp)
    907c:	00006c97          	auipc	s9,0x6
    9080:	7c4c8c93          	add	s9,s9,1988 # f840 <__mprec_bigtens>
    9084:	00090413          	mv	s0,s2
    9088:	00050713          	mv	a4,a0
    908c:	00000613          	li	a2,0
    9090:	00050913          	mv	s2,a0
    9094:	001bf693          	and	a3,s7,1
    9098:	02068063          	beqz	a3,90b8 <_dtoa_r+0x120c>
    909c:	000ca603          	lw	a2,0(s9)
    90a0:	004ca683          	lw	a3,4(s9)
    90a4:	00070513          	mv	a0,a4
    90a8:	00140413          	add	s0,s0,1
    90ac:	520040ef          	jal	d5cc <__muldf3>
    90b0:	00050713          	mv	a4,a0
    90b4:	00100613          	li	a2,1
    90b8:	401bdb93          	sra	s7,s7,0x1
    90bc:	008c8c93          	add	s9,s9,8
    90c0:	fc0b9ae3          	bnez	s7,9094 <_dtoa_r+0x11e8>
    90c4:	00090513          	mv	a0,s2
    90c8:	00058793          	mv	a5,a1
    90cc:	00040913          	mv	s2,s0
    90d0:	04012403          	lw	s0,64(sp)
    90d4:	a0061a63          	bnez	a2,82e8 <_dtoa_r+0x43c>
    90d8:	00050713          	mv	a4,a0
    90dc:	000d0793          	mv	a5,s10
    90e0:	a08ff06f          	j	82e8 <_dtoa_r+0x43c>
    90e4:	00068593          	mv	a1,a3
    90e8:	00070613          	mv	a2,a4
    90ec:	00070513          	mv	a0,a4
    90f0:	0d4030ef          	jal	c1c4 <__adddf3>
    90f4:	02012783          	lw	a5,32(sp)
    90f8:	00090613          	mv	a2,s2
    90fc:	00098693          	mv	a3,s3
    9100:	00178a13          	add	s4,a5,1
    9104:	00050c93          	mv	s9,a0
    9108:	00058b13          	mv	s6,a1
    910c:	000a0c13          	mv	s8,s4
    9110:	2b4040ef          	jal	d3c4 <__gedf2>
    9114:	c4a04863          	bgtz	a0,8564 <_dtoa_r+0x6b8>
    9118:	000c8513          	mv	a0,s9
    911c:	000b0593          	mv	a1,s6
    9120:	00090613          	mv	a2,s2
    9124:	00098693          	mv	a3,s3
    9128:	210040ef          	jal	d338 <__eqdf2>
    912c:	00051663          	bnez	a0,9138 <_dtoa_r+0x128c>
    9130:	001d7d13          	and	s10,s10,1
    9134:	c20d1863          	bnez	s10,8564 <_dtoa_r+0x6b8>
    9138:	000b8d13          	mv	s10,s7
    913c:	945ff06f          	j	8a80 <_dtoa_r+0xbd4>
    9140:	00492583          	lw	a1,4(s2)
    9144:	00040513          	mv	a0,s0
    9148:	450000ef          	jal	9598 <_Balloc>
    914c:	00050993          	mv	s3,a0
    9150:	38050463          	beqz	a0,94d8 <_dtoa_r+0x162c>
    9154:	01092603          	lw	a2,16(s2)
    9158:	00c90593          	add	a1,s2,12
    915c:	00c50513          	add	a0,a0,12
    9160:	00260613          	add	a2,a2,2
    9164:	00261613          	sll	a2,a2,0x2
    9168:	f59f70ef          	jal	10c0 <memcpy>
    916c:	00100613          	li	a2,1
    9170:	00098593          	mv	a1,s3
    9174:	00040513          	mv	a0,s0
    9178:	49d000ef          	jal	9e14 <__lshift>
    917c:	00050b13          	mv	s6,a0
    9180:	aa9ff06f          	j	8c28 <_dtoa_r+0xd7c>
    9184:	00090593          	mv	a1,s2
    9188:	000b8613          	mv	a2,s7
    918c:	00040513          	mv	a0,s0
    9190:	335000ef          	jal	9cc4 <__pow5mult>
    9194:	00048613          	mv	a2,s1
    9198:	00050593          	mv	a1,a0
    919c:	00050913          	mv	s2,a0
    91a0:	00040513          	mv	a0,s0
    91a4:	059000ef          	jal	99fc <__multiply>
    91a8:	00050793          	mv	a5,a0
    91ac:	00048593          	mv	a1,s1
    91b0:	00040513          	mv	a0,s0
    91b4:	00078493          	mv	s1,a5
    91b8:	494000ef          	jal	964c <_Bfree>
    91bc:	03012783          	lw	a5,48(sp)
    91c0:	417787b3          	sub	a5,a5,s7
    91c4:	02f12823          	sw	a5,48(sp)
    91c8:	f6078063          	beqz	a5,8928 <_dtoa_r+0xa7c>
    91cc:	f48ff06f          	j	8914 <_dtoa_r+0xa68>
    91d0:	05012603          	lw	a2,80(sp)
    91d4:	05412683          	lw	a3,84(sp)
    91d8:	05812503          	lw	a0,88(sp)
    91dc:	04b12623          	sw	a1,76(sp)
    91e0:	000b8593          	mv	a1,s7
    91e4:	02612423          	sw	t1,40(sp)
    91e8:	3e4040ef          	jal	d5cc <__muldf3>
    91ec:	02812303          	lw	t1,40(sp)
    91f0:	04812783          	lw	a5,72(sp)
    91f4:	00100693          	li	a3,1
    91f8:	006a8023          	sb	t1,0(s5)
    91fc:	02a12c23          	sw	a0,56(sp)
    9200:	04c12883          	lw	a7,76(sp)
    9204:	00058913          	mv	s2,a1
    9208:	00fa8bb3          	add	s7,s5,a5
    920c:	7fff7617          	auipc	a2,0x7fff7
    9210:	4e460613          	add	a2,a2,1252 # 800006f0 <__global_locale+0x1bc>
    9214:	28d78c63          	beq	a5,a3,94ac <_dtoa_r+0x1600>
    9218:	00062783          	lw	a5,0(a2)
    921c:	00462803          	lw	a6,4(a2)
    9220:	04912423          	sw	s1,72(sp)
    9224:	02f12423          	sw	a5,40(sp)
    9228:	03012623          	sw	a6,44(sp)
    922c:	04812623          	sw	s0,76(sp)
    9230:	000c8513          	mv	a0,s9
    9234:	00088593          	mv	a1,a7
    9238:	02812603          	lw	a2,40(sp)
    923c:	02c12683          	lw	a3,44(sp)
    9240:	001d0d13          	add	s10,s10,1
    9244:	388040ef          	jal	d5cc <__muldf3>
    9248:	00058413          	mv	s0,a1
    924c:	00050493          	mv	s1,a0
    9250:	468050ef          	jal	e6b8 <__fixdfsi>
    9254:	00050c93          	mv	s9,a0
    9258:	4e4050ef          	jal	e73c <__floatsidf>
    925c:	00050613          	mv	a2,a0
    9260:	00058693          	mv	a3,a1
    9264:	00048513          	mv	a0,s1
    9268:	00040593          	mv	a1,s0
    926c:	030c8c93          	add	s9,s9,48
    9270:	2ed040ef          	jal	dd5c <__subdf3>
    9274:	ff9d0fa3          	sb	s9,-1(s10)
    9278:	fdab90e3          	bne	s7,s10,9238 <_dtoa_r+0x138c>
    927c:	04812483          	lw	s1,72(sp)
    9280:	04c12403          	lw	s0,76(sp)
    9284:	00050c93          	mv	s9,a0
    9288:	00058893          	mv	a7,a1
    928c:	7fff7d17          	auipc	s10,0x7fff7
    9290:	42cd0d13          	add	s10,s10,1068 # 800006b8 <__global_locale+0x184>
    9294:	000d2603          	lw	a2,0(s10)
    9298:	004d2683          	lw	a3,4(s10)
    929c:	03812503          	lw	a0,56(sp)
    92a0:	00090593          	mv	a1,s2
    92a4:	03112423          	sw	a7,40(sp)
    92a8:	71d020ef          	jal	c1c4 <__adddf3>
    92ac:	02812883          	lw	a7,40(sp)
    92b0:	000c8613          	mv	a2,s9
    92b4:	00088693          	mv	a3,a7
    92b8:	20c040ef          	jal	d4c4 <__ledf2>
    92bc:	1a054863          	bltz	a0,946c <_dtoa_r+0x15c0>
    92c0:	03812603          	lw	a2,56(sp)
    92c4:	000d2503          	lw	a0,0(s10)
    92c8:	004d2583          	lw	a1,4(s10)
    92cc:	00090693          	mv	a3,s2
    92d0:	28d040ef          	jal	dd5c <__subdf3>
    92d4:	02812883          	lw	a7,40(sp)
    92d8:	000c8613          	mv	a2,s9
    92dc:	00088693          	mv	a3,a7
    92e0:	0e4040ef          	jal	d3c4 <__gedf2>
    92e4:	12a04863          	bgtz	a0,9414 <_dtoa_r+0x1568>
    92e8:	06c12783          	lw	a5,108(sp)
    92ec:	de07c063          	bltz	a5,88cc <_dtoa_r+0xa20>
    92f0:	02012703          	lw	a4,32(sp)
    92f4:	00e00793          	li	a5,14
    92f8:	dce7ca63          	blt	a5,a4,88cc <_dtoa_r+0xa20>
    92fc:	02012783          	lw	a5,32(sp)
    9300:	00006717          	auipc	a4,0x6
    9304:	56870713          	add	a4,a4,1384 # f868 <__mprec_tens>
    9308:	00379793          	sll	a5,a5,0x3
    930c:	00f707b3          	add	a5,a4,a5
    9310:	0007a903          	lw	s2,0(a5)
    9314:	0047a983          	lw	s3,4(a5)
    9318:	c90ff06f          	j	87a8 <_dtoa_r+0x8fc>
    931c:	06812703          	lw	a4,104(sp)
    9320:	01012683          	lw	a3,16(sp)
    9324:	03600793          	li	a5,54
    9328:	40e787b3          	sub	a5,a5,a4
    932c:	00fb0b33          	add	s6,s6,a5
    9330:	00f687b3          	add	a5,a3,a5
    9334:	03012b83          	lw	s7,48(sp)
    9338:	00068c93          	mv	s9,a3
    933c:	00f12823          	sw	a5,16(sp)
    9340:	815ff06f          	j	8b54 <_dtoa_r+0xca8>
    9344:	02012783          	lw	a5,32(sp)
    9348:	00090c13          	mv	s8,s2
    934c:	01012a83          	lw	s5,16(sp)
    9350:	00178a13          	add	s4,a5,1
    9354:	000b0913          	mv	s2,s6
    9358:	eb4ff06f          	j	8a0c <_dtoa_r+0xb60>
    935c:	01812703          	lw	a4,24(sp)
    9360:	01c12783          	lw	a5,28(sp)
    9364:	00200913          	li	s2,2
    9368:	f81fe06f          	j	82e8 <_dtoa_r+0x43c>
    936c:	b00c0063          	beqz	s8,866c <_dtoa_r+0x7c0>
    9370:	03c12d03          	lw	s10,60(sp)
    9374:	bba05063          	blez	s10,8714 <_dtoa_r+0x868>
    9378:	7fff7617          	auipc	a2,0x7fff7
    937c:	37860613          	add	a2,a2,888 # 800006f0 <__global_locale+0x1bc>
    9380:	00078593          	mv	a1,a5
    9384:	02012783          	lw	a5,32(sp)
    9388:	00462683          	lw	a3,4(a2)
    938c:	00062603          	lw	a2,0(a2)
    9390:	fff78793          	add	a5,a5,-1
    9394:	00070513          	mv	a0,a4
    9398:	04f12e23          	sw	a5,92(sp)
    939c:	230040ef          	jal	d5cc <__muldf3>
    93a0:	00050713          	mv	a4,a0
    93a4:	00190513          	add	a0,s2,1
    93a8:	04e12423          	sw	a4,72(sp)
    93ac:	04b12023          	sw	a1,64(sp)
    93b0:	38c050ef          	jal	e73c <__floatsidf>
    93b4:	04812703          	lw	a4,72(sp)
    93b8:	04012783          	lw	a5,64(sp)
    93bc:	00070613          	mv	a2,a4
    93c0:	00078693          	mv	a3,a5
    93c4:	04e12623          	sw	a4,76(sp)
    93c8:	204040ef          	jal	d5cc <__muldf3>
    93cc:	7fff7697          	auipc	a3,0x7fff7
    93d0:	32c68693          	add	a3,a3,812 # 800006f8 <__global_locale+0x1c4>
    93d4:	0006a603          	lw	a2,0(a3)
    93d8:	0046a683          	lw	a3,4(a3)
    93dc:	5e9020ef          	jal	c1c4 <__adddf3>
    93e0:	fcc006b7          	lui	a3,0xfcc00
    93e4:	04012783          	lw	a5,64(sp)
    93e8:	04c12703          	lw	a4,76(sp)
    93ec:	00050c93          	mv	s9,a0
    93f0:	00b68bb3          	add	s7,a3,a1
    93f4:	05a12423          	sw	s10,72(sp)
    93f8:	f91fe06f          	j	8388 <_dtoa_r+0x4dc>
    93fc:	03100693          	li	a3,49
    9400:	001c0c13          	add	s8,s8,1
    9404:	984ff06f          	j	8588 <_dtoa_r+0x6dc>
    9408:	00012c23          	sw	zero,24(sp)
    940c:	00000913          	li	s2,0
    9410:	a11ff06f          	j	8e20 <_dtoa_r+0xf74>
    9414:	03000613          	li	a2,48
    9418:	fffbc783          	lbu	a5,-1(s7)
    941c:	000b8d13          	mv	s10,s7
    9420:	fffb8b93          	add	s7,s7,-1
    9424:	fec78ae3          	beq	a5,a2,9418 <_dtoa_r+0x156c>
    9428:	05c12783          	lw	a5,92(sp)
    942c:	00178a13          	add	s4,a5,1
    9430:	e50ff06f          	j	8a80 <_dtoa_r+0xbd4>
    9434:	03900713          	li	a4,57
    9438:	01012a83          	lw	s5,16(sp)
    943c:	b8eb84e3          	beq	s7,a4,8fc4 <_dtoa_r+0x1118>
    9440:	933048e3          	bgtz	s3,8d70 <_dtoa_r+0xec4>
    9444:	931ff06f          	j	8d74 <_dtoa_r+0xec8>
    9448:	01012a83          	lw	s5,16(sp)
    944c:	929ff06f          	j	8d74 <_dtoa_r+0xec8>
    9450:	00078993          	mv	s3,a5
    9454:	a19ff06f          	j	8e6c <_dtoa_r+0xfc0>
    9458:	00078c93          	mv	s9,a5
    945c:	018787b3          	add	a5,a5,s8
    9460:	018b0b33          	add	s6,s6,s8
    9464:	00f12823          	sw	a5,16(sp)
    9468:	eecff06f          	j	8b54 <_dtoa_r+0xca8>
    946c:	05c12783          	lw	a5,92(sp)
    9470:	00178c13          	add	s8,a5,1
    9474:	8f0ff06f          	j	8564 <_dtoa_r+0x6b8>
    9478:	04c12983          	lw	s3,76(sp)
    947c:	05012b03          	lw	s6,80(sp)
    9480:	05812c03          	lw	s8,88(sp)
    9484:	04812a03          	lw	s4,72(sp)
    9488:	a8cff06f          	j	8714 <_dtoa_r+0x868>
    948c:	00200793          	li	a5,2
    9490:	0147c863          	blt	a5,s4,94a0 <_dtoa_r+0x15f4>
    9494:	02012a03          	lw	s4,32(sp)
    9498:	03c12c03          	lw	s8,60(sp)
    949c:	d1cff06f          	j	89b8 <_dtoa_r+0xb0c>
    94a0:	03c12c03          	lw	s8,60(sp)
    94a4:	03612023          	sw	s6,32(sp)
    94a8:	949ff06f          	j	8df0 <_dtoa_r+0xf44>
    94ac:	04012b83          	lw	s7,64(sp)
    94b0:	dddff06f          	j	928c <_dtoa_r+0x13e0>
    94b4:	00200793          	li	a5,2
    94b8:	ff47c4e3          	blt	a5,s4,94a0 <_dtoa_r+0x15f4>
    94bc:	03c12c03          	lw	s8,60(sp)
    94c0:	03612023          	sw	s6,32(sp)
    94c4:	f44ff06f          	j	8c08 <_dtoa_r+0xd5c>
    94c8:	00050713          	mv	a4,a0
    94cc:	00058793          	mv	a5,a1
    94d0:	00200913          	li	s2,2
    94d4:	e15fe06f          	j	82e8 <_dtoa_r+0x43c>
    94d8:	00006697          	auipc	a3,0x6
    94dc:	d5468693          	add	a3,a3,-684 # f22c <__fini_array_end+0x3a0>
    94e0:	00000613          	li	a2,0
    94e4:	2ef00593          	li	a1,751
    94e8:	00006517          	auipc	a0,0x6
    94ec:	d5850513          	add	a0,a0,-680 # f240 <__fini_array_end+0x3b4>
    94f0:	25d010ef          	jal	af4c <__assert_func>
    94f4:	01012a83          	lw	s5,16(sp)
    94f8:	85b048e3          	bgtz	s11,8d48 <_dtoa_r+0xe9c>
    94fc:	879ff06f          	j	8d74 <_dtoa_r+0xec8>
    9500:	00006697          	auipc	a3,0x6
    9504:	d2c68693          	add	a3,a3,-724 # f22c <__fini_array_end+0x3a0>
    9508:	00000613          	li	a2,0
    950c:	1af00593          	li	a1,431
    9510:	00006517          	auipc	a0,0x6
    9514:	d3050513          	add	a0,a0,-720 # f240 <__fini_array_end+0x3b4>
    9518:	235010ef          	jal	af4c <__assert_func>
    951c:	02042e23          	sw	zero,60(s0)
    9520:	00000593          	li	a1,0
    9524:	cc1fe06f          	j	81e4 <_dtoa_r+0x338>
    9528:	02012423          	sw	zero,40(sp)
    952c:	c7dfe06f          	j	81a8 <_dtoa_r+0x2fc>

00009530 <__ascii_mbtowc>:
    9530:	02058063          	beqz	a1,9550 <__ascii_mbtowc+0x20>
    9534:	04060263          	beqz	a2,9578 <__ascii_mbtowc+0x48>
    9538:	04068863          	beqz	a3,9588 <__ascii_mbtowc+0x58>
    953c:	00064783          	lbu	a5,0(a2)
    9540:	00f5a023          	sw	a5,0(a1)
    9544:	00064503          	lbu	a0,0(a2)
    9548:	00a03533          	snez	a0,a0
    954c:	00008067          	ret
    9550:	ff010113          	add	sp,sp,-16
    9554:	00c10593          	add	a1,sp,12
    9558:	02060463          	beqz	a2,9580 <__ascii_mbtowc+0x50>
    955c:	02068a63          	beqz	a3,9590 <__ascii_mbtowc+0x60>
    9560:	00064783          	lbu	a5,0(a2)
    9564:	00f5a023          	sw	a5,0(a1)
    9568:	00064503          	lbu	a0,0(a2)
    956c:	00a03533          	snez	a0,a0
    9570:	01010113          	add	sp,sp,16
    9574:	00008067          	ret
    9578:	00000513          	li	a0,0
    957c:	00008067          	ret
    9580:	00000513          	li	a0,0
    9584:	fedff06f          	j	9570 <__ascii_mbtowc+0x40>
    9588:	ffe00513          	li	a0,-2
    958c:	00008067          	ret
    9590:	ffe00513          	li	a0,-2
    9594:	fddff06f          	j	9570 <__ascii_mbtowc+0x40>

00009598 <_Balloc>:
    9598:	04452783          	lw	a5,68(a0)
    959c:	ff010113          	add	sp,sp,-16
    95a0:	00812423          	sw	s0,8(sp)
    95a4:	00912223          	sw	s1,4(sp)
    95a8:	00112623          	sw	ra,12(sp)
    95ac:	00050413          	mv	s0,a0
    95b0:	00058493          	mv	s1,a1
    95b4:	02078c63          	beqz	a5,95ec <_Balloc+0x54>
    95b8:	00249713          	sll	a4,s1,0x2
    95bc:	00e787b3          	add	a5,a5,a4
    95c0:	0007a503          	lw	a0,0(a5)
    95c4:	04050463          	beqz	a0,960c <_Balloc+0x74>
    95c8:	00052703          	lw	a4,0(a0)
    95cc:	00e7a023          	sw	a4,0(a5)
    95d0:	00052823          	sw	zero,16(a0)
    95d4:	00052623          	sw	zero,12(a0)
    95d8:	00c12083          	lw	ra,12(sp)
    95dc:	00812403          	lw	s0,8(sp)
    95e0:	00412483          	lw	s1,4(sp)
    95e4:	01010113          	add	sp,sp,16
    95e8:	00008067          	ret
    95ec:	02100613          	li	a2,33
    95f0:	00400593          	li	a1,4
    95f4:	1b1010ef          	jal	afa4 <_calloc_r>
    95f8:	04a42223          	sw	a0,68(s0)
    95fc:	00050793          	mv	a5,a0
    9600:	fa051ce3          	bnez	a0,95b8 <_Balloc+0x20>
    9604:	00000513          	li	a0,0
    9608:	fd1ff06f          	j	95d8 <_Balloc+0x40>
    960c:	01212023          	sw	s2,0(sp)
    9610:	00100913          	li	s2,1
    9614:	00991933          	sll	s2,s2,s1
    9618:	00590613          	add	a2,s2,5
    961c:	00261613          	sll	a2,a2,0x2
    9620:	00100593          	li	a1,1
    9624:	00040513          	mv	a0,s0
    9628:	17d010ef          	jal	afa4 <_calloc_r>
    962c:	00050a63          	beqz	a0,9640 <_Balloc+0xa8>
    9630:	01252423          	sw	s2,8(a0)
    9634:	00952223          	sw	s1,4(a0)
    9638:	00012903          	lw	s2,0(sp)
    963c:	f95ff06f          	j	95d0 <_Balloc+0x38>
    9640:	00012903          	lw	s2,0(sp)
    9644:	00000513          	li	a0,0
    9648:	f91ff06f          	j	95d8 <_Balloc+0x40>

0000964c <_Bfree>:
    964c:	02058063          	beqz	a1,966c <_Bfree+0x20>
    9650:	0045a703          	lw	a4,4(a1)
    9654:	04452783          	lw	a5,68(a0)
    9658:	00271713          	sll	a4,a4,0x2
    965c:	00e787b3          	add	a5,a5,a4
    9660:	0007a703          	lw	a4,0(a5)
    9664:	00e5a023          	sw	a4,0(a1)
    9668:	00b7a023          	sw	a1,0(a5)
    966c:	00008067          	ret

00009670 <__multadd>:
    9670:	fd010113          	add	sp,sp,-48
    9674:	01412c23          	sw	s4,24(sp)
    9678:	0105aa03          	lw	s4,16(a1)
    967c:	01912223          	sw	s9,4(sp)
    9680:	00010cb7          	lui	s9,0x10
    9684:	02912223          	sw	s1,36(sp)
    9688:	03212023          	sw	s2,32(sp)
    968c:	01312e23          	sw	s3,28(sp)
    9690:	01512a23          	sw	s5,20(sp)
    9694:	01612823          	sw	s6,16(sp)
    9698:	01712623          	sw	s7,12(sp)
    969c:	02112623          	sw	ra,44(sp)
    96a0:	02812423          	sw	s0,40(sp)
    96a4:	01812423          	sw	s8,8(sp)
    96a8:	00058a93          	mv	s5,a1
    96ac:	00050b13          	mv	s6,a0
    96b0:	00060993          	mv	s3,a2
    96b4:	00068493          	mv	s1,a3
    96b8:	01458913          	add	s2,a1,20
    96bc:	00000b93          	li	s7,0
    96c0:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    96c4:	00092c03          	lw	s8,0(s2)
    96c8:	00098593          	mv	a1,s3
    96cc:	00490913          	add	s2,s2,4
    96d0:	019c7533          	and	a0,s8,s9
    96d4:	5c0050ef          	jal	ec94 <__mulsi3>
    96d8:	00050413          	mv	s0,a0
    96dc:	00098593          	mv	a1,s3
    96e0:	010c5513          	srl	a0,s8,0x10
    96e4:	00940433          	add	s0,s0,s1
    96e8:	5ac050ef          	jal	ec94 <__mulsi3>
    96ec:	01045793          	srl	a5,s0,0x10
    96f0:	00f50533          	add	a0,a0,a5
    96f4:	01051793          	sll	a5,a0,0x10
    96f8:	01947433          	and	s0,s0,s9
    96fc:	008787b3          	add	a5,a5,s0
    9700:	fef92e23          	sw	a5,-4(s2)
    9704:	001b8b93          	add	s7,s7,1
    9708:	01055493          	srl	s1,a0,0x10
    970c:	fb4bcce3          	blt	s7,s4,96c4 <__multadd+0x54>
    9710:	02048263          	beqz	s1,9734 <__multadd+0xc4>
    9714:	008aa783          	lw	a5,8(s5)
    9718:	04fa5a63          	bge	s4,a5,976c <__multadd+0xfc>
    971c:	004a0793          	add	a5,s4,4
    9720:	00279793          	sll	a5,a5,0x2
    9724:	00fa87b3          	add	a5,s5,a5
    9728:	0097a223          	sw	s1,4(a5)
    972c:	001a0a13          	add	s4,s4,1
    9730:	014aa823          	sw	s4,16(s5)
    9734:	02c12083          	lw	ra,44(sp)
    9738:	02812403          	lw	s0,40(sp)
    973c:	02412483          	lw	s1,36(sp)
    9740:	02012903          	lw	s2,32(sp)
    9744:	01c12983          	lw	s3,28(sp)
    9748:	01812a03          	lw	s4,24(sp)
    974c:	01012b03          	lw	s6,16(sp)
    9750:	00c12b83          	lw	s7,12(sp)
    9754:	00812c03          	lw	s8,8(sp)
    9758:	00412c83          	lw	s9,4(sp)
    975c:	000a8513          	mv	a0,s5
    9760:	01412a83          	lw	s5,20(sp)
    9764:	03010113          	add	sp,sp,48
    9768:	00008067          	ret
    976c:	004aa583          	lw	a1,4(s5)
    9770:	000b0513          	mv	a0,s6
    9774:	00158593          	add	a1,a1,1
    9778:	e21ff0ef          	jal	9598 <_Balloc>
    977c:	00050413          	mv	s0,a0
    9780:	04050c63          	beqz	a0,97d8 <__multadd+0x168>
    9784:	010aa603          	lw	a2,16(s5)
    9788:	00ca8593          	add	a1,s5,12
    978c:	00c50513          	add	a0,a0,12
    9790:	00260613          	add	a2,a2,2
    9794:	00261613          	sll	a2,a2,0x2
    9798:	929f70ef          	jal	10c0 <memcpy>
    979c:	004aa703          	lw	a4,4(s5)
    97a0:	044b2783          	lw	a5,68(s6)
    97a4:	00271713          	sll	a4,a4,0x2
    97a8:	00e787b3          	add	a5,a5,a4
    97ac:	0007a703          	lw	a4,0(a5)
    97b0:	00eaa023          	sw	a4,0(s5)
    97b4:	0157a023          	sw	s5,0(a5)
    97b8:	004a0793          	add	a5,s4,4
    97bc:	00040a93          	mv	s5,s0
    97c0:	00279793          	sll	a5,a5,0x2
    97c4:	00fa87b3          	add	a5,s5,a5
    97c8:	0097a223          	sw	s1,4(a5)
    97cc:	001a0a13          	add	s4,s4,1
    97d0:	014aa823          	sw	s4,16(s5)
    97d4:	f61ff06f          	j	9734 <__multadd+0xc4>
    97d8:	00006697          	auipc	a3,0x6
    97dc:	a5468693          	add	a3,a3,-1452 # f22c <__fini_array_end+0x3a0>
    97e0:	00000613          	li	a2,0
    97e4:	0ba00593          	li	a1,186
    97e8:	00006517          	auipc	a0,0x6
    97ec:	ad850513          	add	a0,a0,-1320 # f2c0 <__fini_array_end+0x434>
    97f0:	75c010ef          	jal	af4c <__assert_func>

000097f4 <__hi0bits>:
    97f4:	00050793          	mv	a5,a0
    97f8:	00010737          	lui	a4,0x10
    97fc:	00000513          	li	a0,0
    9800:	00e7f663          	bgeu	a5,a4,980c <__hi0bits+0x18>
    9804:	01079793          	sll	a5,a5,0x10
    9808:	01000513          	li	a0,16
    980c:	01000737          	lui	a4,0x1000
    9810:	00e7f663          	bgeu	a5,a4,981c <__hi0bits+0x28>
    9814:	00850513          	add	a0,a0,8
    9818:	00879793          	sll	a5,a5,0x8
    981c:	10000737          	lui	a4,0x10000
    9820:	00e7f663          	bgeu	a5,a4,982c <__hi0bits+0x38>
    9824:	00450513          	add	a0,a0,4
    9828:	00479793          	sll	a5,a5,0x4
    982c:	40000737          	lui	a4,0x40000
    9830:	00e7ea63          	bltu	a5,a4,9844 <__hi0bits+0x50>
    9834:	fff7c793          	not	a5,a5
    9838:	01f7d793          	srl	a5,a5,0x1f
    983c:	00f50533          	add	a0,a0,a5
    9840:	00008067          	ret
    9844:	00279793          	sll	a5,a5,0x2
    9848:	0007ca63          	bltz	a5,985c <__hi0bits+0x68>
    984c:	00179713          	sll	a4,a5,0x1
    9850:	00074a63          	bltz	a4,9864 <__hi0bits+0x70>
    9854:	02000513          	li	a0,32
    9858:	00008067          	ret
    985c:	00250513          	add	a0,a0,2
    9860:	00008067          	ret
    9864:	00350513          	add	a0,a0,3
    9868:	00008067          	ret

0000986c <__lo0bits>:
    986c:	00052783          	lw	a5,0(a0)
    9870:	00050713          	mv	a4,a0
    9874:	0077f693          	and	a3,a5,7
    9878:	02068463          	beqz	a3,98a0 <__lo0bits+0x34>
    987c:	0017f693          	and	a3,a5,1
    9880:	00000513          	li	a0,0
    9884:	04069e63          	bnez	a3,98e0 <__lo0bits+0x74>
    9888:	0027f693          	and	a3,a5,2
    988c:	0a068863          	beqz	a3,993c <__lo0bits+0xd0>
    9890:	0017d793          	srl	a5,a5,0x1
    9894:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9898:	00100513          	li	a0,1
    989c:	00008067          	ret
    98a0:	01079693          	sll	a3,a5,0x10
    98a4:	0106d693          	srl	a3,a3,0x10
    98a8:	00000513          	li	a0,0
    98ac:	06068e63          	beqz	a3,9928 <__lo0bits+0xbc>
    98b0:	0ff7f693          	zext.b	a3,a5
    98b4:	06068063          	beqz	a3,9914 <__lo0bits+0xa8>
    98b8:	00f7f693          	and	a3,a5,15
    98bc:	04068263          	beqz	a3,9900 <__lo0bits+0x94>
    98c0:	0037f693          	and	a3,a5,3
    98c4:	02068463          	beqz	a3,98ec <__lo0bits+0x80>
    98c8:	0017f693          	and	a3,a5,1
    98cc:	00069c63          	bnez	a3,98e4 <__lo0bits+0x78>
    98d0:	0017d793          	srl	a5,a5,0x1
    98d4:	00150513          	add	a0,a0,1
    98d8:	00079663          	bnez	a5,98e4 <__lo0bits+0x78>
    98dc:	02000513          	li	a0,32
    98e0:	00008067          	ret
    98e4:	00f72023          	sw	a5,0(a4)
    98e8:	00008067          	ret
    98ec:	0027d793          	srl	a5,a5,0x2
    98f0:	0017f693          	and	a3,a5,1
    98f4:	00250513          	add	a0,a0,2
    98f8:	fe0696e3          	bnez	a3,98e4 <__lo0bits+0x78>
    98fc:	fd5ff06f          	j	98d0 <__lo0bits+0x64>
    9900:	0047d793          	srl	a5,a5,0x4
    9904:	0037f693          	and	a3,a5,3
    9908:	00450513          	add	a0,a0,4
    990c:	fa069ee3          	bnez	a3,98c8 <__lo0bits+0x5c>
    9910:	fddff06f          	j	98ec <__lo0bits+0x80>
    9914:	0087d793          	srl	a5,a5,0x8
    9918:	00f7f693          	and	a3,a5,15
    991c:	00850513          	add	a0,a0,8
    9920:	fa0690e3          	bnez	a3,98c0 <__lo0bits+0x54>
    9924:	fddff06f          	j	9900 <__lo0bits+0x94>
    9928:	0107d793          	srl	a5,a5,0x10
    992c:	0ff7f693          	zext.b	a3,a5
    9930:	01000513          	li	a0,16
    9934:	f80692e3          	bnez	a3,98b8 <__lo0bits+0x4c>
    9938:	fddff06f          	j	9914 <__lo0bits+0xa8>
    993c:	0027d793          	srl	a5,a5,0x2
    9940:	00f72023          	sw	a5,0(a4)
    9944:	00200513          	li	a0,2
    9948:	00008067          	ret

0000994c <__i2b>:
    994c:	04452783          	lw	a5,68(a0)
    9950:	ff010113          	add	sp,sp,-16
    9954:	00812423          	sw	s0,8(sp)
    9958:	00912223          	sw	s1,4(sp)
    995c:	00112623          	sw	ra,12(sp)
    9960:	00050413          	mv	s0,a0
    9964:	00058493          	mv	s1,a1
    9968:	02078c63          	beqz	a5,99a0 <__i2b+0x54>
    996c:	0047a503          	lw	a0,4(a5)
    9970:	06050263          	beqz	a0,99d4 <__i2b+0x88>
    9974:	00052703          	lw	a4,0(a0)
    9978:	00e7a223          	sw	a4,4(a5)
    997c:	00c12083          	lw	ra,12(sp)
    9980:	00812403          	lw	s0,8(sp)
    9984:	00100793          	li	a5,1
    9988:	00952a23          	sw	s1,20(a0)
    998c:	00052623          	sw	zero,12(a0)
    9990:	00f52823          	sw	a5,16(a0)
    9994:	00412483          	lw	s1,4(sp)
    9998:	01010113          	add	sp,sp,16
    999c:	00008067          	ret
    99a0:	02100613          	li	a2,33
    99a4:	00400593          	li	a1,4
    99a8:	5fc010ef          	jal	afa4 <_calloc_r>
    99ac:	04a42223          	sw	a0,68(s0)
    99b0:	00050793          	mv	a5,a0
    99b4:	fa051ce3          	bnez	a0,996c <__i2b+0x20>
    99b8:	00006697          	auipc	a3,0x6
    99bc:	87468693          	add	a3,a3,-1932 # f22c <__fini_array_end+0x3a0>
    99c0:	00000613          	li	a2,0
    99c4:	14500593          	li	a1,325
    99c8:	00006517          	auipc	a0,0x6
    99cc:	8f850513          	add	a0,a0,-1800 # f2c0 <__fini_array_end+0x434>
    99d0:	57c010ef          	jal	af4c <__assert_func>
    99d4:	01c00613          	li	a2,28
    99d8:	00100593          	li	a1,1
    99dc:	00040513          	mv	a0,s0
    99e0:	5c4010ef          	jal	afa4 <_calloc_r>
    99e4:	fc050ae3          	beqz	a0,99b8 <__i2b+0x6c>
    99e8:	00100793          	li	a5,1
    99ec:	00f52223          	sw	a5,4(a0)
    99f0:	00200793          	li	a5,2
    99f4:	00f52423          	sw	a5,8(a0)
    99f8:	f85ff06f          	j	997c <__i2b+0x30>

000099fc <__multiply>:
    99fc:	fb010113          	add	sp,sp,-80
    9a00:	03312e23          	sw	s3,60(sp)
    9a04:	03812423          	sw	s8,40(sp)
    9a08:	01062983          	lw	s3,16(a2)
    9a0c:	0105ac03          	lw	s8,16(a1)
    9a10:	04812423          	sw	s0,72(sp)
    9a14:	03412c23          	sw	s4,56(sp)
    9a18:	04112623          	sw	ra,76(sp)
    9a1c:	03712623          	sw	s7,44(sp)
    9a20:	00058a13          	mv	s4,a1
    9a24:	00060413          	mv	s0,a2
    9a28:	013c4c63          	blt	s8,s3,9a40 <__multiply+0x44>
    9a2c:	00098713          	mv	a4,s3
    9a30:	00058413          	mv	s0,a1
    9a34:	000c0993          	mv	s3,s8
    9a38:	00060a13          	mv	s4,a2
    9a3c:	00070c13          	mv	s8,a4
    9a40:	00842783          	lw	a5,8(s0)
    9a44:	00442583          	lw	a1,4(s0)
    9a48:	01898bb3          	add	s7,s3,s8
    9a4c:	0177a7b3          	slt	a5,a5,s7
    9a50:	00f585b3          	add	a1,a1,a5
    9a54:	b45ff0ef          	jal	9598 <_Balloc>
    9a58:	00a12623          	sw	a0,12(sp)
    9a5c:	22050863          	beqz	a0,9c8c <__multiply+0x290>
    9a60:	00c12783          	lw	a5,12(sp)
    9a64:	03512a23          	sw	s5,52(sp)
    9a68:	03612823          	sw	s6,48(sp)
    9a6c:	002b9a93          	sll	s5,s7,0x2
    9a70:	01478b13          	add	s6,a5,20
    9a74:	015b0ab3          	add	s5,s6,s5
    9a78:	000b0793          	mv	a5,s6
    9a7c:	015b7863          	bgeu	s6,s5,9a8c <__multiply+0x90>
    9a80:	0007a023          	sw	zero,0(a5)
    9a84:	00478793          	add	a5,a5,4
    9a88:	ff57ece3          	bltu	a5,s5,9a80 <__multiply+0x84>
    9a8c:	014a0a13          	add	s4,s4,20
    9a90:	002c1c13          	sll	s8,s8,0x2
    9a94:	01440793          	add	a5,s0,20
    9a98:	018a0733          	add	a4,s4,s8
    9a9c:	00299993          	sll	s3,s3,0x2
    9aa0:	00f12423          	sw	a5,8(sp)
    9aa4:	00e12023          	sw	a4,0(sp)
    9aa8:	013789b3          	add	s3,a5,s3
    9aac:	16ea7c63          	bgeu	s4,a4,9c24 <__multiply+0x228>
    9ab0:	00400713          	li	a4,4
    9ab4:	04912223          	sw	s1,68(sp)
    9ab8:	05212023          	sw	s2,64(sp)
    9abc:	03912223          	sw	s9,36(sp)
    9ac0:	03a12023          	sw	s10,32(sp)
    9ac4:	01b12e23          	sw	s11,28(sp)
    9ac8:	01540793          	add	a5,s0,21
    9acc:	00e12223          	sw	a4,4(sp)
    9ad0:	1af9f263          	bgeu	s3,a5,9c74 <__multiply+0x278>
    9ad4:	00010437          	lui	s0,0x10
    9ad8:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    9adc:	01c0006f          	j	9af8 <__multiply+0xfc>
    9ae0:	01095913          	srl	s2,s2,0x10
    9ae4:	0a091063          	bnez	s2,9b84 <__multiply+0x188>
    9ae8:	00012783          	lw	a5,0(sp)
    9aec:	004a0a13          	add	s4,s4,4
    9af0:	004b0b13          	add	s6,s6,4
    9af4:	10fa7e63          	bgeu	s4,a5,9c10 <__multiply+0x214>
    9af8:	000a2903          	lw	s2,0(s4)
    9afc:	008974b3          	and	s1,s2,s0
    9b00:	fe0480e3          	beqz	s1,9ae0 <__multiply+0xe4>
    9b04:	00812c83          	lw	s9,8(sp)
    9b08:	000b0d13          	mv	s10,s6
    9b0c:	00000c13          	li	s8,0
    9b10:	000cad83          	lw	s11,0(s9)
    9b14:	000d2903          	lw	s2,0(s10)
    9b18:	00048593          	mv	a1,s1
    9b1c:	008df533          	and	a0,s11,s0
    9b20:	174050ef          	jal	ec94 <__mulsi3>
    9b24:	00897733          	and	a4,s2,s0
    9b28:	00e50733          	add	a4,a0,a4
    9b2c:	00048593          	mv	a1,s1
    9b30:	010dd513          	srl	a0,s11,0x10
    9b34:	01870c33          	add	s8,a4,s8
    9b38:	01095913          	srl	s2,s2,0x10
    9b3c:	158050ef          	jal	ec94 <__mulsi3>
    9b40:	010c5713          	srl	a4,s8,0x10
    9b44:	01250533          	add	a0,a0,s2
    9b48:	00e50533          	add	a0,a0,a4
    9b4c:	008c77b3          	and	a5,s8,s0
    9b50:	01051713          	sll	a4,a0,0x10
    9b54:	004d0d13          	add	s10,s10,4
    9b58:	00f767b3          	or	a5,a4,a5
    9b5c:	004c8c93          	add	s9,s9,4
    9b60:	fefd2e23          	sw	a5,-4(s10)
    9b64:	01055c13          	srl	s8,a0,0x10
    9b68:	fb3ce4e3          	bltu	s9,s3,9b10 <__multiply+0x114>
    9b6c:	00412783          	lw	a5,4(sp)
    9b70:	00fb0733          	add	a4,s6,a5
    9b74:	01872023          	sw	s8,0(a4)
    9b78:	000a2903          	lw	s2,0(s4)
    9b7c:	01095913          	srl	s2,s2,0x10
    9b80:	f60904e3          	beqz	s2,9ae8 <__multiply+0xec>
    9b84:	000b2c83          	lw	s9,0(s6)
    9b88:	00812d03          	lw	s10,8(sp)
    9b8c:	000b0c13          	mv	s8,s6
    9b90:	000c8493          	mv	s1,s9
    9b94:	00000d93          	li	s11,0
    9b98:	000d2503          	lw	a0,0(s10)
    9b9c:	00090593          	mv	a1,s2
    9ba0:	0104d493          	srl	s1,s1,0x10
    9ba4:	00857533          	and	a0,a0,s0
    9ba8:	0ec050ef          	jal	ec94 <__mulsi3>
    9bac:	01b50733          	add	a4,a0,s11
    9bb0:	00970db3          	add	s11,a4,s1
    9bb4:	010d9593          	sll	a1,s11,0x10
    9bb8:	008cf7b3          	and	a5,s9,s0
    9bbc:	00f5e7b3          	or	a5,a1,a5
    9bc0:	00fc2023          	sw	a5,0(s8)
    9bc4:	002d5503          	lhu	a0,2(s10)
    9bc8:	004c2483          	lw	s1,4(s8)
    9bcc:	00090593          	mv	a1,s2
    9bd0:	0c4050ef          	jal	ec94 <__mulsi3>
    9bd4:	0084f7b3          	and	a5,s1,s0
    9bd8:	010dd713          	srl	a4,s11,0x10
    9bdc:	00f507b3          	add	a5,a0,a5
    9be0:	004d0d13          	add	s10,s10,4
    9be4:	00e78cb3          	add	s9,a5,a4
    9be8:	004c0c13          	add	s8,s8,4
    9bec:	010cdd93          	srl	s11,s9,0x10
    9bf0:	fb3d64e3          	bltu	s10,s3,9b98 <__multiply+0x19c>
    9bf4:	00412783          	lw	a5,4(sp)
    9bf8:	004a0a13          	add	s4,s4,4
    9bfc:	00fb0733          	add	a4,s6,a5
    9c00:	00012783          	lw	a5,0(sp)
    9c04:	01972023          	sw	s9,0(a4)
    9c08:	004b0b13          	add	s6,s6,4
    9c0c:	eefa66e3          	bltu	s4,a5,9af8 <__multiply+0xfc>
    9c10:	04412483          	lw	s1,68(sp)
    9c14:	04012903          	lw	s2,64(sp)
    9c18:	02412c83          	lw	s9,36(sp)
    9c1c:	02012d03          	lw	s10,32(sp)
    9c20:	01c12d83          	lw	s11,28(sp)
    9c24:	01704863          	bgtz	s7,9c34 <__multiply+0x238>
    9c28:	0180006f          	j	9c40 <__multiply+0x244>
    9c2c:	fffb8b93          	add	s7,s7,-1
    9c30:	000b8863          	beqz	s7,9c40 <__multiply+0x244>
    9c34:	ffcaa783          	lw	a5,-4(s5)
    9c38:	ffca8a93          	add	s5,s5,-4
    9c3c:	fe0788e3          	beqz	a5,9c2c <__multiply+0x230>
    9c40:	00c12783          	lw	a5,12(sp)
    9c44:	04c12083          	lw	ra,76(sp)
    9c48:	04812403          	lw	s0,72(sp)
    9c4c:	0177a823          	sw	s7,16(a5)
    9c50:	03412a83          	lw	s5,52(sp)
    9c54:	03012b03          	lw	s6,48(sp)
    9c58:	03c12983          	lw	s3,60(sp)
    9c5c:	03812a03          	lw	s4,56(sp)
    9c60:	02c12b83          	lw	s7,44(sp)
    9c64:	02812c03          	lw	s8,40(sp)
    9c68:	00078513          	mv	a0,a5
    9c6c:	05010113          	add	sp,sp,80
    9c70:	00008067          	ret
    9c74:	408987b3          	sub	a5,s3,s0
    9c78:	feb78793          	add	a5,a5,-21
    9c7c:	ffc7f793          	and	a5,a5,-4
    9c80:	00478793          	add	a5,a5,4
    9c84:	00f12223          	sw	a5,4(sp)
    9c88:	e4dff06f          	j	9ad4 <__multiply+0xd8>
    9c8c:	00005697          	auipc	a3,0x5
    9c90:	5a068693          	add	a3,a3,1440 # f22c <__fini_array_end+0x3a0>
    9c94:	00000613          	li	a2,0
    9c98:	16200593          	li	a1,354
    9c9c:	00005517          	auipc	a0,0x5
    9ca0:	62450513          	add	a0,a0,1572 # f2c0 <__fini_array_end+0x434>
    9ca4:	04912223          	sw	s1,68(sp)
    9ca8:	05212023          	sw	s2,64(sp)
    9cac:	03512a23          	sw	s5,52(sp)
    9cb0:	03612823          	sw	s6,48(sp)
    9cb4:	03912223          	sw	s9,36(sp)
    9cb8:	03a12023          	sw	s10,32(sp)
    9cbc:	01b12e23          	sw	s11,28(sp)
    9cc0:	28c010ef          	jal	af4c <__assert_func>

00009cc4 <__pow5mult>:
    9cc4:	fe010113          	add	sp,sp,-32
    9cc8:	00812c23          	sw	s0,24(sp)
    9ccc:	01212823          	sw	s2,16(sp)
    9cd0:	01312623          	sw	s3,12(sp)
    9cd4:	00112e23          	sw	ra,28(sp)
    9cd8:	00367793          	and	a5,a2,3
    9cdc:	00060413          	mv	s0,a2
    9ce0:	00050993          	mv	s3,a0
    9ce4:	00058913          	mv	s2,a1
    9ce8:	0a079c63          	bnez	a5,9da0 <__pow5mult+0xdc>
    9cec:	40245413          	sra	s0,s0,0x2
    9cf0:	06040a63          	beqz	s0,9d64 <__pow5mult+0xa0>
    9cf4:	00912a23          	sw	s1,20(sp)
    9cf8:	0409a483          	lw	s1,64(s3)
    9cfc:	0c048663          	beqz	s1,9dc8 <__pow5mult+0x104>
    9d00:	00147793          	and	a5,s0,1
    9d04:	02079063          	bnez	a5,9d24 <__pow5mult+0x60>
    9d08:	40145413          	sra	s0,s0,0x1
    9d0c:	04040a63          	beqz	s0,9d60 <__pow5mult+0x9c>
    9d10:	0004a503          	lw	a0,0(s1)
    9d14:	06050663          	beqz	a0,9d80 <__pow5mult+0xbc>
    9d18:	00050493          	mv	s1,a0
    9d1c:	00147793          	and	a5,s0,1
    9d20:	fe0784e3          	beqz	a5,9d08 <__pow5mult+0x44>
    9d24:	00048613          	mv	a2,s1
    9d28:	00090593          	mv	a1,s2
    9d2c:	00098513          	mv	a0,s3
    9d30:	ccdff0ef          	jal	99fc <__multiply>
    9d34:	02090063          	beqz	s2,9d54 <__pow5mult+0x90>
    9d38:	00492703          	lw	a4,4(s2)
    9d3c:	0449a783          	lw	a5,68(s3)
    9d40:	00271713          	sll	a4,a4,0x2
    9d44:	00e787b3          	add	a5,a5,a4
    9d48:	0007a703          	lw	a4,0(a5)
    9d4c:	00e92023          	sw	a4,0(s2)
    9d50:	0127a023          	sw	s2,0(a5)
    9d54:	40145413          	sra	s0,s0,0x1
    9d58:	00050913          	mv	s2,a0
    9d5c:	fa041ae3          	bnez	s0,9d10 <__pow5mult+0x4c>
    9d60:	01412483          	lw	s1,20(sp)
    9d64:	01c12083          	lw	ra,28(sp)
    9d68:	01812403          	lw	s0,24(sp)
    9d6c:	00c12983          	lw	s3,12(sp)
    9d70:	00090513          	mv	a0,s2
    9d74:	01012903          	lw	s2,16(sp)
    9d78:	02010113          	add	sp,sp,32
    9d7c:	00008067          	ret
    9d80:	00048613          	mv	a2,s1
    9d84:	00048593          	mv	a1,s1
    9d88:	00098513          	mv	a0,s3
    9d8c:	c71ff0ef          	jal	99fc <__multiply>
    9d90:	00a4a023          	sw	a0,0(s1)
    9d94:	00052023          	sw	zero,0(a0)
    9d98:	00050493          	mv	s1,a0
    9d9c:	f81ff06f          	j	9d1c <__pow5mult+0x58>
    9da0:	fff78793          	add	a5,a5,-1
    9da4:	00006717          	auipc	a4,0x6
    9da8:	a9070713          	add	a4,a4,-1392 # f834 <p05.0>
    9dac:	00279793          	sll	a5,a5,0x2
    9db0:	00f707b3          	add	a5,a4,a5
    9db4:	0007a603          	lw	a2,0(a5)
    9db8:	00000693          	li	a3,0
    9dbc:	8b5ff0ef          	jal	9670 <__multadd>
    9dc0:	00050913          	mv	s2,a0
    9dc4:	f29ff06f          	j	9cec <__pow5mult+0x28>
    9dc8:	00100593          	li	a1,1
    9dcc:	00098513          	mv	a0,s3
    9dd0:	fc8ff0ef          	jal	9598 <_Balloc>
    9dd4:	00050493          	mv	s1,a0
    9dd8:	02050063          	beqz	a0,9df8 <__pow5mult+0x134>
    9ddc:	27100793          	li	a5,625
    9de0:	00f52a23          	sw	a5,20(a0)
    9de4:	00100793          	li	a5,1
    9de8:	00f52823          	sw	a5,16(a0)
    9dec:	04a9a023          	sw	a0,64(s3)
    9df0:	00052023          	sw	zero,0(a0)
    9df4:	f0dff06f          	j	9d00 <__pow5mult+0x3c>
    9df8:	00005697          	auipc	a3,0x5
    9dfc:	43468693          	add	a3,a3,1076 # f22c <__fini_array_end+0x3a0>
    9e00:	00000613          	li	a2,0
    9e04:	14500593          	li	a1,325
    9e08:	00005517          	auipc	a0,0x5
    9e0c:	4b850513          	add	a0,a0,1208 # f2c0 <__fini_array_end+0x434>
    9e10:	13c010ef          	jal	af4c <__assert_func>

00009e14 <__lshift>:
    9e14:	fe010113          	add	sp,sp,-32
    9e18:	01512223          	sw	s5,4(sp)
    9e1c:	0105aa83          	lw	s5,16(a1)
    9e20:	0085a783          	lw	a5,8(a1)
    9e24:	01312623          	sw	s3,12(sp)
    9e28:	40565993          	sra	s3,a2,0x5
    9e2c:	01598ab3          	add	s5,s3,s5
    9e30:	00812c23          	sw	s0,24(sp)
    9e34:	00912a23          	sw	s1,20(sp)
    9e38:	01212823          	sw	s2,16(sp)
    9e3c:	01412423          	sw	s4,8(sp)
    9e40:	00112e23          	sw	ra,28(sp)
    9e44:	001a8913          	add	s2,s5,1
    9e48:	00058493          	mv	s1,a1
    9e4c:	00060413          	mv	s0,a2
    9e50:	0045a583          	lw	a1,4(a1)
    9e54:	00050a13          	mv	s4,a0
    9e58:	0127d863          	bge	a5,s2,9e68 <__lshift+0x54>
    9e5c:	00179793          	sll	a5,a5,0x1
    9e60:	00158593          	add	a1,a1,1
    9e64:	ff27cce3          	blt	a5,s2,9e5c <__lshift+0x48>
    9e68:	000a0513          	mv	a0,s4
    9e6c:	f2cff0ef          	jal	9598 <_Balloc>
    9e70:	10050c63          	beqz	a0,9f88 <__lshift+0x174>
    9e74:	01450813          	add	a6,a0,20
    9e78:	03305463          	blez	s3,9ea0 <__lshift+0x8c>
    9e7c:	00598993          	add	s3,s3,5
    9e80:	00299993          	sll	s3,s3,0x2
    9e84:	01350733          	add	a4,a0,s3
    9e88:	00080793          	mv	a5,a6
    9e8c:	00478793          	add	a5,a5,4
    9e90:	fe07ae23          	sw	zero,-4(a5)
    9e94:	fee79ce3          	bne	a5,a4,9e8c <__lshift+0x78>
    9e98:	fec98993          	add	s3,s3,-20
    9e9c:	01380833          	add	a6,a6,s3
    9ea0:	0104a883          	lw	a7,16(s1)
    9ea4:	01448793          	add	a5,s1,20
    9ea8:	01f47613          	and	a2,s0,31
    9eac:	00289893          	sll	a7,a7,0x2
    9eb0:	011788b3          	add	a7,a5,a7
    9eb4:	0a060463          	beqz	a2,9f5c <__lshift+0x148>
    9eb8:	02000593          	li	a1,32
    9ebc:	40c585b3          	sub	a1,a1,a2
    9ec0:	00080313          	mv	t1,a6
    9ec4:	00000693          	li	a3,0
    9ec8:	0007a703          	lw	a4,0(a5)
    9ecc:	00430313          	add	t1,t1,4
    9ed0:	00478793          	add	a5,a5,4
    9ed4:	00c71733          	sll	a4,a4,a2
    9ed8:	00d76733          	or	a4,a4,a3
    9edc:	fee32e23          	sw	a4,-4(t1)
    9ee0:	ffc7a683          	lw	a3,-4(a5)
    9ee4:	00b6d6b3          	srl	a3,a3,a1
    9ee8:	ff17e0e3          	bltu	a5,a7,9ec8 <__lshift+0xb4>
    9eec:	01548793          	add	a5,s1,21
    9ef0:	00400713          	li	a4,4
    9ef4:	00f8ea63          	bltu	a7,a5,9f08 <__lshift+0xf4>
    9ef8:	409887b3          	sub	a5,a7,s1
    9efc:	feb78793          	add	a5,a5,-21
    9f00:	ffc7f793          	and	a5,a5,-4
    9f04:	00478713          	add	a4,a5,4
    9f08:	00e80833          	add	a6,a6,a4
    9f0c:	00d82023          	sw	a3,0(a6)
    9f10:	00069463          	bnez	a3,9f18 <__lshift+0x104>
    9f14:	000a8913          	mv	s2,s5
    9f18:	0044a703          	lw	a4,4(s1)
    9f1c:	044a2783          	lw	a5,68(s4)
    9f20:	01c12083          	lw	ra,28(sp)
    9f24:	00271713          	sll	a4,a4,0x2
    9f28:	00e787b3          	add	a5,a5,a4
    9f2c:	0007a703          	lw	a4,0(a5)
    9f30:	01252823          	sw	s2,16(a0)
    9f34:	01812403          	lw	s0,24(sp)
    9f38:	00e4a023          	sw	a4,0(s1)
    9f3c:	0097a023          	sw	s1,0(a5)
    9f40:	01012903          	lw	s2,16(sp)
    9f44:	01412483          	lw	s1,20(sp)
    9f48:	00c12983          	lw	s3,12(sp)
    9f4c:	00812a03          	lw	s4,8(sp)
    9f50:	00412a83          	lw	s5,4(sp)
    9f54:	02010113          	add	sp,sp,32
    9f58:	00008067          	ret
    9f5c:	0007a703          	lw	a4,0(a5)
    9f60:	00478793          	add	a5,a5,4
    9f64:	00480813          	add	a6,a6,4
    9f68:	fee82e23          	sw	a4,-4(a6)
    9f6c:	fb17f4e3          	bgeu	a5,a7,9f14 <__lshift+0x100>
    9f70:	0007a703          	lw	a4,0(a5)
    9f74:	00478793          	add	a5,a5,4
    9f78:	00480813          	add	a6,a6,4
    9f7c:	fee82e23          	sw	a4,-4(a6)
    9f80:	fd17eee3          	bltu	a5,a7,9f5c <__lshift+0x148>
    9f84:	f91ff06f          	j	9f14 <__lshift+0x100>
    9f88:	00005697          	auipc	a3,0x5
    9f8c:	2a468693          	add	a3,a3,676 # f22c <__fini_array_end+0x3a0>
    9f90:	00000613          	li	a2,0
    9f94:	1de00593          	li	a1,478
    9f98:	00005517          	auipc	a0,0x5
    9f9c:	32850513          	add	a0,a0,808 # f2c0 <__fini_array_end+0x434>
    9fa0:	7ad000ef          	jal	af4c <__assert_func>

00009fa4 <__mcmp>:
    9fa4:	01052703          	lw	a4,16(a0)
    9fa8:	0105a783          	lw	a5,16(a1)
    9fac:	00050813          	mv	a6,a0
    9fb0:	40f70533          	sub	a0,a4,a5
    9fb4:	04f71263          	bne	a4,a5,9ff8 <__mcmp+0x54>
    9fb8:	00279793          	sll	a5,a5,0x2
    9fbc:	01480813          	add	a6,a6,20
    9fc0:	01458593          	add	a1,a1,20
    9fc4:	00f80733          	add	a4,a6,a5
    9fc8:	00f587b3          	add	a5,a1,a5
    9fcc:	0080006f          	j	9fd4 <__mcmp+0x30>
    9fd0:	02e87463          	bgeu	a6,a4,9ff8 <__mcmp+0x54>
    9fd4:	ffc72603          	lw	a2,-4(a4)
    9fd8:	ffc7a683          	lw	a3,-4(a5)
    9fdc:	ffc70713          	add	a4,a4,-4
    9fe0:	ffc78793          	add	a5,a5,-4
    9fe4:	fed606e3          	beq	a2,a3,9fd0 <__mcmp+0x2c>
    9fe8:	00100513          	li	a0,1
    9fec:	00d67663          	bgeu	a2,a3,9ff8 <__mcmp+0x54>
    9ff0:	fff00513          	li	a0,-1
    9ff4:	00008067          	ret
    9ff8:	00008067          	ret

00009ffc <__mdiff>:
    9ffc:	0105a703          	lw	a4,16(a1)
    a000:	01062783          	lw	a5,16(a2)
    a004:	ff010113          	add	sp,sp,-16
    a008:	00812423          	sw	s0,8(sp)
    a00c:	00912223          	sw	s1,4(sp)
    a010:	00112623          	sw	ra,12(sp)
    a014:	01212023          	sw	s2,0(sp)
    a018:	00058413          	mv	s0,a1
    a01c:	00060493          	mv	s1,a2
    a020:	40f706b3          	sub	a3,a4,a5
    a024:	18f71e63          	bne	a4,a5,a1c0 <__mdiff+0x1c4>
    a028:	00279693          	sll	a3,a5,0x2
    a02c:	01458613          	add	a2,a1,20
    a030:	01448713          	add	a4,s1,20
    a034:	00d607b3          	add	a5,a2,a3
    a038:	00d70733          	add	a4,a4,a3
    a03c:	0080006f          	j	a044 <__mdiff+0x48>
    a040:	18f67c63          	bgeu	a2,a5,a1d8 <__mdiff+0x1dc>
    a044:	ffc7a583          	lw	a1,-4(a5)
    a048:	ffc72683          	lw	a3,-4(a4)
    a04c:	ffc78793          	add	a5,a5,-4
    a050:	ffc70713          	add	a4,a4,-4
    a054:	fed586e3          	beq	a1,a3,a040 <__mdiff+0x44>
    a058:	00100913          	li	s2,1
    a05c:	00d5ea63          	bltu	a1,a3,a070 <__mdiff+0x74>
    a060:	00048793          	mv	a5,s1
    a064:	00000913          	li	s2,0
    a068:	00040493          	mv	s1,s0
    a06c:	00078413          	mv	s0,a5
    a070:	0044a583          	lw	a1,4(s1)
    a074:	d24ff0ef          	jal	9598 <_Balloc>
    a078:	1a050663          	beqz	a0,a224 <__mdiff+0x228>
    a07c:	0104a883          	lw	a7,16(s1)
    a080:	01042283          	lw	t0,16(s0)
    a084:	01448f93          	add	t6,s1,20
    a088:	00289313          	sll	t1,a7,0x2
    a08c:	01440813          	add	a6,s0,20
    a090:	00229293          	sll	t0,t0,0x2
    a094:	01450593          	add	a1,a0,20
    a098:	00010e37          	lui	t3,0x10
    a09c:	01252623          	sw	s2,12(a0)
    a0a0:	006f8333          	add	t1,t6,t1
    a0a4:	005802b3          	add	t0,a6,t0
    a0a8:	00058f13          	mv	t5,a1
    a0ac:	000f8e93          	mv	t4,t6
    a0b0:	00000693          	li	a3,0
    a0b4:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    a0b8:	000ea703          	lw	a4,0(t4)
    a0bc:	00082603          	lw	a2,0(a6)
    a0c0:	004f0f13          	add	t5,t5,4
    a0c4:	01c777b3          	and	a5,a4,t3
    a0c8:	01c673b3          	and	t2,a2,t3
    a0cc:	407787b3          	sub	a5,a5,t2
    a0d0:	00d787b3          	add	a5,a5,a3
    a0d4:	01075713          	srl	a4,a4,0x10
    a0d8:	01065613          	srl	a2,a2,0x10
    a0dc:	4107d693          	sra	a3,a5,0x10
    a0e0:	40c70733          	sub	a4,a4,a2
    a0e4:	00d70733          	add	a4,a4,a3
    a0e8:	01071693          	sll	a3,a4,0x10
    a0ec:	01c7f7b3          	and	a5,a5,t3
    a0f0:	00d7e7b3          	or	a5,a5,a3
    a0f4:	00480813          	add	a6,a6,4
    a0f8:	feff2e23          	sw	a5,-4(t5)
    a0fc:	004e8e93          	add	t4,t4,4
    a100:	41075693          	sra	a3,a4,0x10
    a104:	fa586ae3          	bltu	a6,t0,a0b8 <__mdiff+0xbc>
    a108:	01540713          	add	a4,s0,21
    a10c:	40828433          	sub	s0,t0,s0
    a110:	feb40413          	add	s0,s0,-21
    a114:	00e2b2b3          	sltu	t0,t0,a4
    a118:	0012cf13          	xor	t5,t0,1
    a11c:	00245413          	srl	s0,s0,0x2
    a120:	00400713          	li	a4,4
    a124:	0a028463          	beqz	t0,a1cc <__mdiff+0x1d0>
    a128:	00ef8fb3          	add	t6,t6,a4
    a12c:	00e58833          	add	a6,a1,a4
    a130:	00010eb7          	lui	t4,0x10
    a134:	00080e13          	mv	t3,a6
    a138:	000f8613          	mv	a2,t6
    a13c:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    a140:	0c6ff463          	bgeu	t6,t1,a208 <__mdiff+0x20c>
    a144:	00062783          	lw	a5,0(a2)
    a148:	004e0e13          	add	t3,t3,4
    a14c:	00460613          	add	a2,a2,4
    a150:	01d7f733          	and	a4,a5,t4
    a154:	00d70733          	add	a4,a4,a3
    a158:	0107d593          	srl	a1,a5,0x10
    a15c:	41075713          	sra	a4,a4,0x10
    a160:	00b70733          	add	a4,a4,a1
    a164:	00d787b3          	add	a5,a5,a3
    a168:	01d7f7b3          	and	a5,a5,t4
    a16c:	01071693          	sll	a3,a4,0x10
    a170:	00d7e7b3          	or	a5,a5,a3
    a174:	fefe2e23          	sw	a5,-4(t3)
    a178:	41075693          	sra	a3,a4,0x10
    a17c:	fc6664e3          	bltu	a2,t1,a144 <__mdiff+0x148>
    a180:	fff30313          	add	t1,t1,-1
    a184:	41f30333          	sub	t1,t1,t6
    a188:	ffc37313          	and	t1,t1,-4
    a18c:	00680733          	add	a4,a6,t1
    a190:	00079a63          	bnez	a5,a1a4 <__mdiff+0x1a8>
    a194:	ffc72783          	lw	a5,-4(a4)
    a198:	fff88893          	add	a7,a7,-1
    a19c:	ffc70713          	add	a4,a4,-4
    a1a0:	fe078ae3          	beqz	a5,a194 <__mdiff+0x198>
    a1a4:	00c12083          	lw	ra,12(sp)
    a1a8:	00812403          	lw	s0,8(sp)
    a1ac:	01152823          	sw	a7,16(a0)
    a1b0:	00412483          	lw	s1,4(sp)
    a1b4:	00012903          	lw	s2,0(sp)
    a1b8:	01010113          	add	sp,sp,16
    a1bc:	00008067          	ret
    a1c0:	00100913          	li	s2,1
    a1c4:	e806dee3          	bgez	a3,a060 <__mdiff+0x64>
    a1c8:	ea9ff06f          	j	a070 <__mdiff+0x74>
    a1cc:	00140713          	add	a4,s0,1
    a1d0:	00271713          	sll	a4,a4,0x2
    a1d4:	f55ff06f          	j	a128 <__mdiff+0x12c>
    a1d8:	00000593          	li	a1,0
    a1dc:	bbcff0ef          	jal	9598 <_Balloc>
    a1e0:	06050063          	beqz	a0,a240 <__mdiff+0x244>
    a1e4:	00c12083          	lw	ra,12(sp)
    a1e8:	00812403          	lw	s0,8(sp)
    a1ec:	00100793          	li	a5,1
    a1f0:	00f52823          	sw	a5,16(a0)
    a1f4:	00052a23          	sw	zero,20(a0)
    a1f8:	00412483          	lw	s1,4(sp)
    a1fc:	00012903          	lw	s2,0(sp)
    a200:	01010113          	add	sp,sp,16
    a204:	00008067          	ret
    a208:	00000713          	li	a4,0
    a20c:	000f1663          	bnez	t5,a218 <__mdiff+0x21c>
    a210:	00e58733          	add	a4,a1,a4
    a214:	f7dff06f          	j	a190 <__mdiff+0x194>
    a218:	00241713          	sll	a4,s0,0x2
    a21c:	00e58733          	add	a4,a1,a4
    a220:	f71ff06f          	j	a190 <__mdiff+0x194>
    a224:	00005697          	auipc	a3,0x5
    a228:	00868693          	add	a3,a3,8 # f22c <__fini_array_end+0x3a0>
    a22c:	00000613          	li	a2,0
    a230:	24500593          	li	a1,581
    a234:	00005517          	auipc	a0,0x5
    a238:	08c50513          	add	a0,a0,140 # f2c0 <__fini_array_end+0x434>
    a23c:	511000ef          	jal	af4c <__assert_func>
    a240:	00005697          	auipc	a3,0x5
    a244:	fec68693          	add	a3,a3,-20 # f22c <__fini_array_end+0x3a0>
    a248:	00000613          	li	a2,0
    a24c:	23700593          	li	a1,567
    a250:	00005517          	auipc	a0,0x5
    a254:	07050513          	add	a0,a0,112 # f2c0 <__fini_array_end+0x434>
    a258:	4f5000ef          	jal	af4c <__assert_func>

0000a25c <__d2b>:
    a25c:	fd010113          	add	sp,sp,-48
    a260:	01512a23          	sw	s5,20(sp)
    a264:	00058a93          	mv	s5,a1
    a268:	00100593          	li	a1,1
    a26c:	02912223          	sw	s1,36(sp)
    a270:	01312e23          	sw	s3,28(sp)
    a274:	01412c23          	sw	s4,24(sp)
    a278:	02112623          	sw	ra,44(sp)
    a27c:	02812423          	sw	s0,40(sp)
    a280:	03212023          	sw	s2,32(sp)
    a284:	00060493          	mv	s1,a2
    a288:	00068a13          	mv	s4,a3
    a28c:	00070993          	mv	s3,a4
    a290:	b08ff0ef          	jal	9598 <_Balloc>
    a294:	10050263          	beqz	a0,a398 <__d2b+0x13c>
    a298:	00100737          	lui	a4,0x100
    a29c:	0144d913          	srl	s2,s1,0x14
    a2a0:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a2a4:	7ff97913          	and	s2,s2,2047
    a2a8:	00050413          	mv	s0,a0
    a2ac:	0097f7b3          	and	a5,a5,s1
    a2b0:	00090463          	beqz	s2,a2b8 <__d2b+0x5c>
    a2b4:	00e7e7b3          	or	a5,a5,a4
    a2b8:	00f12623          	sw	a5,12(sp)
    a2bc:	060a9263          	bnez	s5,a320 <__d2b+0xc4>
    a2c0:	00c10513          	add	a0,sp,12
    a2c4:	da8ff0ef          	jal	986c <__lo0bits>
    a2c8:	00c12703          	lw	a4,12(sp)
    a2cc:	00100493          	li	s1,1
    a2d0:	00942823          	sw	s1,16(s0)
    a2d4:	00e42a23          	sw	a4,20(s0)
    a2d8:	02050793          	add	a5,a0,32
    a2dc:	08090863          	beqz	s2,a36c <__d2b+0x110>
    a2e0:	bcd90913          	add	s2,s2,-1075
    a2e4:	00f90933          	add	s2,s2,a5
    a2e8:	03500493          	li	s1,53
    a2ec:	012a2023          	sw	s2,0(s4)
    a2f0:	40f48533          	sub	a0,s1,a5
    a2f4:	00a9a023          	sw	a0,0(s3)
    a2f8:	02c12083          	lw	ra,44(sp)
    a2fc:	00040513          	mv	a0,s0
    a300:	02812403          	lw	s0,40(sp)
    a304:	02412483          	lw	s1,36(sp)
    a308:	02012903          	lw	s2,32(sp)
    a30c:	01c12983          	lw	s3,28(sp)
    a310:	01812a03          	lw	s4,24(sp)
    a314:	01412a83          	lw	s5,20(sp)
    a318:	03010113          	add	sp,sp,48
    a31c:	00008067          	ret
    a320:	00810513          	add	a0,sp,8
    a324:	01512423          	sw	s5,8(sp)
    a328:	d44ff0ef          	jal	986c <__lo0bits>
    a32c:	00c12703          	lw	a4,12(sp)
    a330:	00050793          	mv	a5,a0
    a334:	04050e63          	beqz	a0,a390 <__d2b+0x134>
    a338:	00812603          	lw	a2,8(sp)
    a33c:	02000693          	li	a3,32
    a340:	40a686b3          	sub	a3,a3,a0
    a344:	00d716b3          	sll	a3,a4,a3
    a348:	00a75733          	srl	a4,a4,a0
    a34c:	00c6e6b3          	or	a3,a3,a2
    a350:	00e12623          	sw	a4,12(sp)
    a354:	00e034b3          	snez	s1,a4
    a358:	00148493          	add	s1,s1,1
    a35c:	00d42a23          	sw	a3,20(s0)
    a360:	00e42c23          	sw	a4,24(s0)
    a364:	00942823          	sw	s1,16(s0)
    a368:	f6091ce3          	bnez	s2,a2e0 <__d2b+0x84>
    a36c:	00249713          	sll	a4,s1,0x2
    a370:	00e40733          	add	a4,s0,a4
    a374:	01072503          	lw	a0,16(a4)
    a378:	bce78793          	add	a5,a5,-1074
    a37c:	00fa2023          	sw	a5,0(s4)
    a380:	c74ff0ef          	jal	97f4 <__hi0bits>
    a384:	00549493          	sll	s1,s1,0x5
    a388:	40a48533          	sub	a0,s1,a0
    a38c:	f69ff06f          	j	a2f4 <__d2b+0x98>
    a390:	00812683          	lw	a3,8(sp)
    a394:	fc1ff06f          	j	a354 <__d2b+0xf8>
    a398:	00005697          	auipc	a3,0x5
    a39c:	e9468693          	add	a3,a3,-364 # f22c <__fini_array_end+0x3a0>
    a3a0:	00000613          	li	a2,0
    a3a4:	30f00593          	li	a1,783
    a3a8:	00005517          	auipc	a0,0x5
    a3ac:	f1850513          	add	a0,a0,-232 # f2c0 <__fini_array_end+0x434>
    a3b0:	39d000ef          	jal	af4c <__assert_func>

0000a3b4 <_realloc_r>:
    a3b4:	fd010113          	add	sp,sp,-48
    a3b8:	02912223          	sw	s1,36(sp)
    a3bc:	02112623          	sw	ra,44(sp)
    a3c0:	00060493          	mv	s1,a2
    a3c4:	1e058863          	beqz	a1,a5b4 <_realloc_r+0x200>
    a3c8:	02812423          	sw	s0,40(sp)
    a3cc:	03212023          	sw	s2,32(sp)
    a3d0:	00058413          	mv	s0,a1
    a3d4:	01312e23          	sw	s3,28(sp)
    a3d8:	01512a23          	sw	s5,20(sp)
    a3dc:	01412c23          	sw	s4,24(sp)
    a3e0:	00050913          	mv	s2,a0
    a3e4:	b3df70ef          	jal	1f20 <__malloc_lock>
    a3e8:	ffc42703          	lw	a4,-4(s0)
    a3ec:	00b48793          	add	a5,s1,11
    a3f0:	01600693          	li	a3,22
    a3f4:	ff840a93          	add	s5,s0,-8
    a3f8:	ffc77993          	and	s3,a4,-4
    a3fc:	10f6f263          	bgeu	a3,a5,a500 <_realloc_r+0x14c>
    a400:	ff87fa13          	and	s4,a5,-8
    a404:	1007c263          	bltz	a5,a508 <_realloc_r+0x154>
    a408:	109a6063          	bltu	s4,s1,a508 <_realloc_r+0x154>
    a40c:	1349d263          	bge	s3,s4,a530 <_realloc_r+0x17c>
    a410:	01812423          	sw	s8,8(sp)
    a414:	7fff6c17          	auipc	s8,0x7fff6
    a418:	d0cc0c13          	add	s8,s8,-756 # 80000120 <__malloc_av_>
    a41c:	008c2603          	lw	a2,8(s8)
    a420:	013a86b3          	add	a3,s5,s3
    a424:	0046a783          	lw	a5,4(a3)
    a428:	1cd60863          	beq	a2,a3,a5f8 <_realloc_r+0x244>
    a42c:	ffe7f613          	and	a2,a5,-2
    a430:	00c68633          	add	a2,a3,a2
    a434:	00462603          	lw	a2,4(a2)
    a438:	00167613          	and	a2,a2,1
    a43c:	14061a63          	bnez	a2,a590 <_realloc_r+0x1dc>
    a440:	ffc7f793          	and	a5,a5,-4
    a444:	00f98633          	add	a2,s3,a5
    a448:	0d465863          	bge	a2,s4,a518 <_realloc_r+0x164>
    a44c:	00177713          	and	a4,a4,1
    a450:	02071c63          	bnez	a4,a488 <_realloc_r+0xd4>
    a454:	01712623          	sw	s7,12(sp)
    a458:	ff842b83          	lw	s7,-8(s0)
    a45c:	01612823          	sw	s6,16(sp)
    a460:	417a8bb3          	sub	s7,s5,s7
    a464:	004ba703          	lw	a4,4(s7)
    a468:	ffc77713          	and	a4,a4,-4
    a46c:	00e787b3          	add	a5,a5,a4
    a470:	01378b33          	add	s6,a5,s3
    a474:	334b5c63          	bge	s6,s4,a7ac <_realloc_r+0x3f8>
    a478:	00e98b33          	add	s6,s3,a4
    a47c:	294b5863          	bge	s6,s4,a70c <_realloc_r+0x358>
    a480:	01012b03          	lw	s6,16(sp)
    a484:	00c12b83          	lw	s7,12(sp)
    a488:	00048593          	mv	a1,s1
    a48c:	00090513          	mv	a0,s2
    a490:	ab0f70ef          	jal	1740 <_malloc_r>
    a494:	00050493          	mv	s1,a0
    a498:	40050863          	beqz	a0,a8a8 <_realloc_r+0x4f4>
    a49c:	ffc42783          	lw	a5,-4(s0)
    a4a0:	ff850713          	add	a4,a0,-8
    a4a4:	ffe7f793          	and	a5,a5,-2
    a4a8:	00fa87b3          	add	a5,s5,a5
    a4ac:	24e78663          	beq	a5,a4,a6f8 <_realloc_r+0x344>
    a4b0:	ffc98613          	add	a2,s3,-4
    a4b4:	02400793          	li	a5,36
    a4b8:	2ec7e463          	bltu	a5,a2,a7a0 <_realloc_r+0x3ec>
    a4bc:	01300713          	li	a4,19
    a4c0:	20c76a63          	bltu	a4,a2,a6d4 <_realloc_r+0x320>
    a4c4:	00050793          	mv	a5,a0
    a4c8:	00040713          	mv	a4,s0
    a4cc:	00072683          	lw	a3,0(a4)
    a4d0:	00d7a023          	sw	a3,0(a5)
    a4d4:	00472683          	lw	a3,4(a4)
    a4d8:	00d7a223          	sw	a3,4(a5)
    a4dc:	00872703          	lw	a4,8(a4)
    a4e0:	00e7a423          	sw	a4,8(a5)
    a4e4:	00040593          	mv	a1,s0
    a4e8:	00090513          	mv	a0,s2
    a4ec:	f49f60ef          	jal	1434 <_free_r>
    a4f0:	00090513          	mv	a0,s2
    a4f4:	a39f70ef          	jal	1f2c <__malloc_unlock>
    a4f8:	00812c03          	lw	s8,8(sp)
    a4fc:	06c0006f          	j	a568 <_realloc_r+0x1b4>
    a500:	01000a13          	li	s4,16
    a504:	f09a74e3          	bgeu	s4,s1,a40c <_realloc_r+0x58>
    a508:	00c00793          	li	a5,12
    a50c:	00f92023          	sw	a5,0(s2)
    a510:	00000493          	li	s1,0
    a514:	0540006f          	j	a568 <_realloc_r+0x1b4>
    a518:	00c6a783          	lw	a5,12(a3)
    a51c:	0086a703          	lw	a4,8(a3)
    a520:	00812c03          	lw	s8,8(sp)
    a524:	00060993          	mv	s3,a2
    a528:	00f72623          	sw	a5,12(a4)
    a52c:	00e7a423          	sw	a4,8(a5)
    a530:	004aa783          	lw	a5,4(s5)
    a534:	414986b3          	sub	a3,s3,s4
    a538:	00f00613          	li	a2,15
    a53c:	0017f793          	and	a5,a5,1
    a540:	013a8733          	add	a4,s5,s3
    a544:	08d66263          	bltu	a2,a3,a5c8 <_realloc_r+0x214>
    a548:	0137e7b3          	or	a5,a5,s3
    a54c:	00faa223          	sw	a5,4(s5)
    a550:	00472783          	lw	a5,4(a4)
    a554:	0017e793          	or	a5,a5,1
    a558:	00f72223          	sw	a5,4(a4)
    a55c:	00090513          	mv	a0,s2
    a560:	9cdf70ef          	jal	1f2c <__malloc_unlock>
    a564:	00040493          	mv	s1,s0
    a568:	02812403          	lw	s0,40(sp)
    a56c:	02c12083          	lw	ra,44(sp)
    a570:	02012903          	lw	s2,32(sp)
    a574:	01c12983          	lw	s3,28(sp)
    a578:	01812a03          	lw	s4,24(sp)
    a57c:	01412a83          	lw	s5,20(sp)
    a580:	00048513          	mv	a0,s1
    a584:	02412483          	lw	s1,36(sp)
    a588:	03010113          	add	sp,sp,48
    a58c:	00008067          	ret
    a590:	00177713          	and	a4,a4,1
    a594:	ee071ae3          	bnez	a4,a488 <_realloc_r+0xd4>
    a598:	01712623          	sw	s7,12(sp)
    a59c:	ff842b83          	lw	s7,-8(s0)
    a5a0:	01612823          	sw	s6,16(sp)
    a5a4:	417a8bb3          	sub	s7,s5,s7
    a5a8:	004ba703          	lw	a4,4(s7)
    a5ac:	ffc77713          	and	a4,a4,-4
    a5b0:	ec9ff06f          	j	a478 <_realloc_r+0xc4>
    a5b4:	02c12083          	lw	ra,44(sp)
    a5b8:	02412483          	lw	s1,36(sp)
    a5bc:	00060593          	mv	a1,a2
    a5c0:	03010113          	add	sp,sp,48
    a5c4:	97cf706f          	j	1740 <_malloc_r>
    a5c8:	0147e7b3          	or	a5,a5,s4
    a5cc:	00faa223          	sw	a5,4(s5)
    a5d0:	014a85b3          	add	a1,s5,s4
    a5d4:	0016e693          	or	a3,a3,1
    a5d8:	00d5a223          	sw	a3,4(a1)
    a5dc:	00472783          	lw	a5,4(a4)
    a5e0:	00858593          	add	a1,a1,8
    a5e4:	00090513          	mv	a0,s2
    a5e8:	0017e793          	or	a5,a5,1
    a5ec:	00f72223          	sw	a5,4(a4)
    a5f0:	e45f60ef          	jal	1434 <_free_r>
    a5f4:	f69ff06f          	j	a55c <_realloc_r+0x1a8>
    a5f8:	ffc7f793          	and	a5,a5,-4
    a5fc:	013786b3          	add	a3,a5,s3
    a600:	010a0613          	add	a2,s4,16
    a604:	26c6d063          	bge	a3,a2,a864 <_realloc_r+0x4b0>
    a608:	00177713          	and	a4,a4,1
    a60c:	e6071ee3          	bnez	a4,a488 <_realloc_r+0xd4>
    a610:	01712623          	sw	s7,12(sp)
    a614:	ff842b83          	lw	s7,-8(s0)
    a618:	01612823          	sw	s6,16(sp)
    a61c:	417a8bb3          	sub	s7,s5,s7
    a620:	004ba703          	lw	a4,4(s7)
    a624:	ffc77713          	and	a4,a4,-4
    a628:	00e787b3          	add	a5,a5,a4
    a62c:	01378b33          	add	s6,a5,s3
    a630:	e4cb44e3          	blt	s6,a2,a478 <_realloc_r+0xc4>
    a634:	00cba783          	lw	a5,12(s7)
    a638:	008ba703          	lw	a4,8(s7)
    a63c:	ffc98613          	add	a2,s3,-4
    a640:	02400693          	li	a3,36
    a644:	00f72623          	sw	a5,12(a4)
    a648:	00e7a423          	sw	a4,8(a5)
    a64c:	008b8493          	add	s1,s7,8
    a650:	28c6e463          	bltu	a3,a2,a8d8 <_realloc_r+0x524>
    a654:	01300713          	li	a4,19
    a658:	00048793          	mv	a5,s1
    a65c:	02c77263          	bgeu	a4,a2,a680 <_realloc_r+0x2cc>
    a660:	00042703          	lw	a4,0(s0)
    a664:	01b00793          	li	a5,27
    a668:	00eba423          	sw	a4,8(s7)
    a66c:	00442703          	lw	a4,4(s0)
    a670:	00eba623          	sw	a4,12(s7)
    a674:	26c7ea63          	bltu	a5,a2,a8e8 <_realloc_r+0x534>
    a678:	00840413          	add	s0,s0,8
    a67c:	010b8793          	add	a5,s7,16
    a680:	00042703          	lw	a4,0(s0)
    a684:	00e7a023          	sw	a4,0(a5)
    a688:	00442703          	lw	a4,4(s0)
    a68c:	00e7a223          	sw	a4,4(a5)
    a690:	00842703          	lw	a4,8(s0)
    a694:	00e7a423          	sw	a4,8(a5)
    a698:	014b8733          	add	a4,s7,s4
    a69c:	414b07b3          	sub	a5,s6,s4
    a6a0:	00ec2423          	sw	a4,8(s8)
    a6a4:	0017e793          	or	a5,a5,1
    a6a8:	00f72223          	sw	a5,4(a4)
    a6ac:	004ba783          	lw	a5,4(s7)
    a6b0:	00090513          	mv	a0,s2
    a6b4:	0017f793          	and	a5,a5,1
    a6b8:	0147e7b3          	or	a5,a5,s4
    a6bc:	00fba223          	sw	a5,4(s7)
    a6c0:	86df70ef          	jal	1f2c <__malloc_unlock>
    a6c4:	01012b03          	lw	s6,16(sp)
    a6c8:	00c12b83          	lw	s7,12(sp)
    a6cc:	00812c03          	lw	s8,8(sp)
    a6d0:	e99ff06f          	j	a568 <_realloc_r+0x1b4>
    a6d4:	00042683          	lw	a3,0(s0)
    a6d8:	01b00713          	li	a4,27
    a6dc:	00d52023          	sw	a3,0(a0)
    a6e0:	00442683          	lw	a3,4(s0)
    a6e4:	00d52223          	sw	a3,4(a0)
    a6e8:	14c76e63          	bltu	a4,a2,a844 <_realloc_r+0x490>
    a6ec:	00840713          	add	a4,s0,8
    a6f0:	00850793          	add	a5,a0,8
    a6f4:	dd9ff06f          	j	a4cc <_realloc_r+0x118>
    a6f8:	ffc52783          	lw	a5,-4(a0)
    a6fc:	00812c03          	lw	s8,8(sp)
    a700:	ffc7f793          	and	a5,a5,-4
    a704:	00f989b3          	add	s3,s3,a5
    a708:	e29ff06f          	j	a530 <_realloc_r+0x17c>
    a70c:	00cba783          	lw	a5,12(s7)
    a710:	008ba703          	lw	a4,8(s7)
    a714:	ffc98613          	add	a2,s3,-4
    a718:	02400693          	li	a3,36
    a71c:	00f72623          	sw	a5,12(a4)
    a720:	00e7a423          	sw	a4,8(a5)
    a724:	008b8493          	add	s1,s7,8
    a728:	10c6e663          	bltu	a3,a2,a834 <_realloc_r+0x480>
    a72c:	01300713          	li	a4,19
    a730:	00048793          	mv	a5,s1
    a734:	02c77c63          	bgeu	a4,a2,a76c <_realloc_r+0x3b8>
    a738:	00042703          	lw	a4,0(s0)
    a73c:	01b00793          	li	a5,27
    a740:	00eba423          	sw	a4,8(s7)
    a744:	00442703          	lw	a4,4(s0)
    a748:	00eba623          	sw	a4,12(s7)
    a74c:	14c7f863          	bgeu	a5,a2,a89c <_realloc_r+0x4e8>
    a750:	00842783          	lw	a5,8(s0)
    a754:	00fba823          	sw	a5,16(s7)
    a758:	00c42783          	lw	a5,12(s0)
    a75c:	00fbaa23          	sw	a5,20(s7)
    a760:	0ad60c63          	beq	a2,a3,a818 <_realloc_r+0x464>
    a764:	01040413          	add	s0,s0,16
    a768:	018b8793          	add	a5,s7,24
    a76c:	00042703          	lw	a4,0(s0)
    a770:	00e7a023          	sw	a4,0(a5)
    a774:	00442703          	lw	a4,4(s0)
    a778:	00e7a223          	sw	a4,4(a5)
    a77c:	00842703          	lw	a4,8(s0)
    a780:	00e7a423          	sw	a4,8(a5)
    a784:	000b0993          	mv	s3,s6
    a788:	000b8a93          	mv	s5,s7
    a78c:	01012b03          	lw	s6,16(sp)
    a790:	00c12b83          	lw	s7,12(sp)
    a794:	00812c03          	lw	s8,8(sp)
    a798:	00048413          	mv	s0,s1
    a79c:	d95ff06f          	j	a530 <_realloc_r+0x17c>
    a7a0:	00040593          	mv	a1,s0
    a7a4:	ae8fd0ef          	jal	7a8c <memmove>
    a7a8:	d3dff06f          	j	a4e4 <_realloc_r+0x130>
    a7ac:	00c6a783          	lw	a5,12(a3)
    a7b0:	0086a703          	lw	a4,8(a3)
    a7b4:	ffc98613          	add	a2,s3,-4
    a7b8:	02400693          	li	a3,36
    a7bc:	00f72623          	sw	a5,12(a4)
    a7c0:	00e7a423          	sw	a4,8(a5)
    a7c4:	008ba703          	lw	a4,8(s7)
    a7c8:	00cba783          	lw	a5,12(s7)
    a7cc:	008b8493          	add	s1,s7,8
    a7d0:	00f72623          	sw	a5,12(a4)
    a7d4:	00e7a423          	sw	a4,8(a5)
    a7d8:	04c6ee63          	bltu	a3,a2,a834 <_realloc_r+0x480>
    a7dc:	01300713          	li	a4,19
    a7e0:	00048793          	mv	a5,s1
    a7e4:	f8c774e3          	bgeu	a4,a2,a76c <_realloc_r+0x3b8>
    a7e8:	00042703          	lw	a4,0(s0)
    a7ec:	01b00793          	li	a5,27
    a7f0:	00eba423          	sw	a4,8(s7)
    a7f4:	00442703          	lw	a4,4(s0)
    a7f8:	00eba623          	sw	a4,12(s7)
    a7fc:	0ac7f063          	bgeu	a5,a2,a89c <_realloc_r+0x4e8>
    a800:	00842703          	lw	a4,8(s0)
    a804:	02400793          	li	a5,36
    a808:	00eba823          	sw	a4,16(s7)
    a80c:	00c42703          	lw	a4,12(s0)
    a810:	00ebaa23          	sw	a4,20(s7)
    a814:	f4f618e3          	bne	a2,a5,a764 <_realloc_r+0x3b0>
    a818:	01042703          	lw	a4,16(s0)
    a81c:	020b8793          	add	a5,s7,32
    a820:	01840413          	add	s0,s0,24
    a824:	00ebac23          	sw	a4,24(s7)
    a828:	ffc42703          	lw	a4,-4(s0)
    a82c:	00ebae23          	sw	a4,28(s7)
    a830:	f3dff06f          	j	a76c <_realloc_r+0x3b8>
    a834:	00040593          	mv	a1,s0
    a838:	00048513          	mv	a0,s1
    a83c:	a50fd0ef          	jal	7a8c <memmove>
    a840:	f45ff06f          	j	a784 <_realloc_r+0x3d0>
    a844:	00842703          	lw	a4,8(s0)
    a848:	00e52423          	sw	a4,8(a0)
    a84c:	00c42703          	lw	a4,12(s0)
    a850:	00e52623          	sw	a4,12(a0)
    a854:	06f60463          	beq	a2,a5,a8bc <_realloc_r+0x508>
    a858:	01040713          	add	a4,s0,16
    a85c:	01050793          	add	a5,a0,16
    a860:	c6dff06f          	j	a4cc <_realloc_r+0x118>
    a864:	014a8ab3          	add	s5,s5,s4
    a868:	414687b3          	sub	a5,a3,s4
    a86c:	015c2423          	sw	s5,8(s8)
    a870:	0017e793          	or	a5,a5,1
    a874:	00faa223          	sw	a5,4(s5)
    a878:	ffc42783          	lw	a5,-4(s0)
    a87c:	00090513          	mv	a0,s2
    a880:	00040493          	mv	s1,s0
    a884:	0017f793          	and	a5,a5,1
    a888:	0147e7b3          	or	a5,a5,s4
    a88c:	fef42e23          	sw	a5,-4(s0)
    a890:	e9cf70ef          	jal	1f2c <__malloc_unlock>
    a894:	00812c03          	lw	s8,8(sp)
    a898:	cd1ff06f          	j	a568 <_realloc_r+0x1b4>
    a89c:	00840413          	add	s0,s0,8
    a8a0:	010b8793          	add	a5,s7,16
    a8a4:	ec9ff06f          	j	a76c <_realloc_r+0x3b8>
    a8a8:	00090513          	mv	a0,s2
    a8ac:	e80f70ef          	jal	1f2c <__malloc_unlock>
    a8b0:	00000493          	li	s1,0
    a8b4:	00812c03          	lw	s8,8(sp)
    a8b8:	cb1ff06f          	j	a568 <_realloc_r+0x1b4>
    a8bc:	01042683          	lw	a3,16(s0)
    a8c0:	01840713          	add	a4,s0,24
    a8c4:	01850793          	add	a5,a0,24
    a8c8:	00d52823          	sw	a3,16(a0)
    a8cc:	01442683          	lw	a3,20(s0)
    a8d0:	00d52a23          	sw	a3,20(a0)
    a8d4:	bf9ff06f          	j	a4cc <_realloc_r+0x118>
    a8d8:	00040593          	mv	a1,s0
    a8dc:	00048513          	mv	a0,s1
    a8e0:	9acfd0ef          	jal	7a8c <memmove>
    a8e4:	db5ff06f          	j	a698 <_realloc_r+0x2e4>
    a8e8:	00842783          	lw	a5,8(s0)
    a8ec:	00fba823          	sw	a5,16(s7)
    a8f0:	00c42783          	lw	a5,12(s0)
    a8f4:	00fbaa23          	sw	a5,20(s7)
    a8f8:	00d60863          	beq	a2,a3,a908 <_realloc_r+0x554>
    a8fc:	01040413          	add	s0,s0,16
    a900:	018b8793          	add	a5,s7,24
    a904:	d7dff06f          	j	a680 <_realloc_r+0x2cc>
    a908:	01042703          	lw	a4,16(s0)
    a90c:	020b8793          	add	a5,s7,32
    a910:	01840413          	add	s0,s0,24
    a914:	00ebac23          	sw	a4,24(s7)
    a918:	ffc42703          	lw	a4,-4(s0)
    a91c:	00ebae23          	sw	a4,28(s7)
    a920:	d61ff06f          	j	a680 <_realloc_r+0x2cc>

0000a924 <__ascii_wctomb>:
    a924:	02058463          	beqz	a1,a94c <__ascii_wctomb+0x28>
    a928:	0ff00793          	li	a5,255
    a92c:	00c7e863          	bltu	a5,a2,a93c <__ascii_wctomb+0x18>
    a930:	00c58023          	sb	a2,0(a1)
    a934:	00100513          	li	a0,1
    a938:	00008067          	ret
    a93c:	08a00793          	li	a5,138
    a940:	00f52023          	sw	a5,0(a0)
    a944:	fff00513          	li	a0,-1
    a948:	00008067          	ret
    a94c:	00000513          	li	a0,0
    a950:	00008067          	ret

0000a954 <_wcrtomb_r>:
    a954:	fe010113          	add	sp,sp,-32
    a958:	00812c23          	sw	s0,24(sp)
    a95c:	00912a23          	sw	s1,20(sp)
    a960:	00112e23          	sw	ra,28(sp)
    a964:	00050493          	mv	s1,a0
    a968:	10450413          	add	s0,a0,260
    a96c:	00068463          	beqz	a3,a974 <_wcrtomb_r+0x20>
    a970:	00068413          	mv	s0,a3
    a974:	7fff6797          	auipc	a5,0x7fff6
    a978:	ca07a783          	lw	a5,-864(a5) # 80000614 <__global_locale+0xe0>
    a97c:	00040693          	mv	a3,s0
    a980:	02058463          	beqz	a1,a9a8 <_wcrtomb_r+0x54>
    a984:	00048513          	mv	a0,s1
    a988:	000780e7          	jalr	a5
    a98c:	fff00793          	li	a5,-1
    a990:	02f50863          	beq	a0,a5,a9c0 <_wcrtomb_r+0x6c>
    a994:	01c12083          	lw	ra,28(sp)
    a998:	01812403          	lw	s0,24(sp)
    a99c:	01412483          	lw	s1,20(sp)
    a9a0:	02010113          	add	sp,sp,32
    a9a4:	00008067          	ret
    a9a8:	00000613          	li	a2,0
    a9ac:	00410593          	add	a1,sp,4
    a9b0:	00048513          	mv	a0,s1
    a9b4:	000780e7          	jalr	a5
    a9b8:	fff00793          	li	a5,-1
    a9bc:	fcf51ce3          	bne	a0,a5,a994 <_wcrtomb_r+0x40>
    a9c0:	00042023          	sw	zero,0(s0)
    a9c4:	01c12083          	lw	ra,28(sp)
    a9c8:	01812403          	lw	s0,24(sp)
    a9cc:	08a00793          	li	a5,138
    a9d0:	00f4a023          	sw	a5,0(s1)
    a9d4:	01412483          	lw	s1,20(sp)
    a9d8:	02010113          	add	sp,sp,32
    a9dc:	00008067          	ret

0000a9e0 <_wcsrtombs_r>:
    a9e0:	00070793          	mv	a5,a4
    a9e4:	00068713          	mv	a4,a3
    a9e8:	fff00693          	li	a3,-1
    a9ec:	1350006f          	j	b320 <_wcsnrtombs_r>

0000a9f0 <_fclose_r>:
    a9f0:	ff010113          	add	sp,sp,-16
    a9f4:	00112623          	sw	ra,12(sp)
    a9f8:	01212023          	sw	s2,0(sp)
    a9fc:	0e058263          	beqz	a1,aae0 <_fclose_r+0xf0>
    aa00:	00812423          	sw	s0,8(sp)
    aa04:	00912223          	sw	s1,4(sp)
    aa08:	00058413          	mv	s0,a1
    aa0c:	00050493          	mv	s1,a0
    aa10:	00050663          	beqz	a0,aa1c <_fclose_r+0x2c>
    aa14:	03452783          	lw	a5,52(a0)
    aa18:	10078063          	beqz	a5,ab18 <_fclose_r+0x128>
    aa1c:	06442783          	lw	a5,100(s0)
    aa20:	00c41703          	lh	a4,12(s0)
    aa24:	0017f793          	and	a5,a5,1
    aa28:	0a079663          	bnez	a5,aad4 <_fclose_r+0xe4>
    aa2c:	20077713          	and	a4,a4,512
    aa30:	0e070863          	beqz	a4,ab20 <_fclose_r+0x130>
    aa34:	00040593          	mv	a1,s0
    aa38:	00048513          	mv	a0,s1
    aa3c:	c81fb0ef          	jal	66bc <__sflush_r>
    aa40:	02c42783          	lw	a5,44(s0)
    aa44:	00050913          	mv	s2,a0
    aa48:	00078a63          	beqz	a5,aa5c <_fclose_r+0x6c>
    aa4c:	01c42583          	lw	a1,28(s0)
    aa50:	00048513          	mv	a0,s1
    aa54:	000780e7          	jalr	a5
    aa58:	0a054063          	bltz	a0,aaf8 <_fclose_r+0x108>
    aa5c:	00c45783          	lhu	a5,12(s0)
    aa60:	0807f793          	and	a5,a5,128
    aa64:	0a079263          	bnez	a5,ab08 <_fclose_r+0x118>
    aa68:	03042583          	lw	a1,48(s0)
    aa6c:	00058c63          	beqz	a1,aa84 <_fclose_r+0x94>
    aa70:	04040793          	add	a5,s0,64
    aa74:	00f58663          	beq	a1,a5,aa80 <_fclose_r+0x90>
    aa78:	00048513          	mv	a0,s1
    aa7c:	9b9f60ef          	jal	1434 <_free_r>
    aa80:	02042823          	sw	zero,48(s0)
    aa84:	04442583          	lw	a1,68(s0)
    aa88:	00058863          	beqz	a1,aa98 <_fclose_r+0xa8>
    aa8c:	00048513          	mv	a0,s1
    aa90:	9a5f60ef          	jal	1434 <_free_r>
    aa94:	04042223          	sw	zero,68(s0)
    aa98:	9dcfc0ef          	jal	6c74 <__sfp_lock_acquire>
    aa9c:	06442783          	lw	a5,100(s0)
    aaa0:	00041623          	sh	zero,12(s0)
    aaa4:	0017f793          	and	a5,a5,1
    aaa8:	0a078663          	beqz	a5,ab54 <_fclose_r+0x164>
    aaac:	05842503          	lw	a0,88(s0)
    aab0:	d28f60ef          	jal	fd8 <__retarget_lock_close_recursive>
    aab4:	9ccfc0ef          	jal	6c80 <__sfp_lock_release>
    aab8:	00c12083          	lw	ra,12(sp)
    aabc:	00812403          	lw	s0,8(sp)
    aac0:	00412483          	lw	s1,4(sp)
    aac4:	00090513          	mv	a0,s2
    aac8:	00012903          	lw	s2,0(sp)
    aacc:	01010113          	add	sp,sp,16
    aad0:	00008067          	ret
    aad4:	f60710e3          	bnez	a4,aa34 <_fclose_r+0x44>
    aad8:	00812403          	lw	s0,8(sp)
    aadc:	00412483          	lw	s1,4(sp)
    aae0:	00000913          	li	s2,0
    aae4:	00c12083          	lw	ra,12(sp)
    aae8:	00090513          	mv	a0,s2
    aaec:	00012903          	lw	s2,0(sp)
    aaf0:	01010113          	add	sp,sp,16
    aaf4:	00008067          	ret
    aaf8:	00c45783          	lhu	a5,12(s0)
    aafc:	fff00913          	li	s2,-1
    ab00:	0807f793          	and	a5,a5,128
    ab04:	f60782e3          	beqz	a5,aa68 <_fclose_r+0x78>
    ab08:	01042583          	lw	a1,16(s0)
    ab0c:	00048513          	mv	a0,s1
    ab10:	925f60ef          	jal	1434 <_free_r>
    ab14:	f55ff06f          	j	aa68 <_fclose_r+0x78>
    ab18:	8ecfc0ef          	jal	6c04 <__sinit>
    ab1c:	f01ff06f          	j	aa1c <_fclose_r+0x2c>
    ab20:	05842503          	lw	a0,88(s0)
    ab24:	cb8f60ef          	jal	fdc <__retarget_lock_acquire_recursive>
    ab28:	00c41783          	lh	a5,12(s0)
    ab2c:	f00794e3          	bnez	a5,aa34 <_fclose_r+0x44>
    ab30:	06442783          	lw	a5,100(s0)
    ab34:	0017f793          	and	a5,a5,1
    ab38:	fa0790e3          	bnez	a5,aad8 <_fclose_r+0xe8>
    ab3c:	05842503          	lw	a0,88(s0)
    ab40:	00000913          	li	s2,0
    ab44:	c9cf60ef          	jal	fe0 <__retarget_lock_release_recursive>
    ab48:	00812403          	lw	s0,8(sp)
    ab4c:	00412483          	lw	s1,4(sp)
    ab50:	f95ff06f          	j	aae4 <_fclose_r+0xf4>
    ab54:	05842503          	lw	a0,88(s0)
    ab58:	c88f60ef          	jal	fe0 <__retarget_lock_release_recursive>
    ab5c:	f51ff06f          	j	aaac <_fclose_r+0xbc>

0000ab60 <__smakebuf_r>:
    ab60:	00c59783          	lh	a5,12(a1)
    ab64:	f8010113          	add	sp,sp,-128
    ab68:	06812c23          	sw	s0,120(sp)
    ab6c:	06112e23          	sw	ra,124(sp)
    ab70:	0027f713          	and	a4,a5,2
    ab74:	00058413          	mv	s0,a1
    ab78:	02070463          	beqz	a4,aba0 <__smakebuf_r+0x40>
    ab7c:	04358793          	add	a5,a1,67
    ab80:	00f5a023          	sw	a5,0(a1)
    ab84:	00f5a823          	sw	a5,16(a1)
    ab88:	00100793          	li	a5,1
    ab8c:	00f5aa23          	sw	a5,20(a1)
    ab90:	07c12083          	lw	ra,124(sp)
    ab94:	07812403          	lw	s0,120(sp)
    ab98:	08010113          	add	sp,sp,128
    ab9c:	00008067          	ret
    aba0:	00e59583          	lh	a1,14(a1)
    aba4:	06912a23          	sw	s1,116(sp)
    aba8:	07212823          	sw	s2,112(sp)
    abac:	07312623          	sw	s3,108(sp)
    abb0:	07412423          	sw	s4,104(sp)
    abb4:	00050493          	mv	s1,a0
    abb8:	0805c663          	bltz	a1,ac44 <__smakebuf_r+0xe4>
    abbc:	00810613          	add	a2,sp,8
    abc0:	2c8000ef          	jal	ae88 <_fstat_r>
    abc4:	06054e63          	bltz	a0,ac40 <__smakebuf_r+0xe0>
    abc8:	00c12783          	lw	a5,12(sp)
    abcc:	0000f937          	lui	s2,0xf
    abd0:	000019b7          	lui	s3,0x1
    abd4:	00f97933          	and	s2,s2,a5
    abd8:	ffffe7b7          	lui	a5,0xffffe
    abdc:	00f90933          	add	s2,s2,a5
    abe0:	00193913          	seqz	s2,s2
    abe4:	40000a13          	li	s4,1024
    abe8:	80098993          	add	s3,s3,-2048 # 800 <main+0x4d0>
    abec:	000a0593          	mv	a1,s4
    abf0:	00048513          	mv	a0,s1
    abf4:	b4df60ef          	jal	1740 <_malloc_r>
    abf8:	00c41783          	lh	a5,12(s0)
    abfc:	06050863          	beqz	a0,ac6c <__smakebuf_r+0x10c>
    ac00:	0807e793          	or	a5,a5,128
    ac04:	00a42023          	sw	a0,0(s0)
    ac08:	00a42823          	sw	a0,16(s0)
    ac0c:	00f41623          	sh	a5,12(s0)
    ac10:	01442a23          	sw	s4,20(s0)
    ac14:	0a091063          	bnez	s2,acb4 <__smakebuf_r+0x154>
    ac18:	0137e7b3          	or	a5,a5,s3
    ac1c:	07c12083          	lw	ra,124(sp)
    ac20:	00f41623          	sh	a5,12(s0)
    ac24:	07812403          	lw	s0,120(sp)
    ac28:	07412483          	lw	s1,116(sp)
    ac2c:	07012903          	lw	s2,112(sp)
    ac30:	06c12983          	lw	s3,108(sp)
    ac34:	06812a03          	lw	s4,104(sp)
    ac38:	08010113          	add	sp,sp,128
    ac3c:	00008067          	ret
    ac40:	00c41783          	lh	a5,12(s0)
    ac44:	0807f793          	and	a5,a5,128
    ac48:	00000913          	li	s2,0
    ac4c:	04078e63          	beqz	a5,aca8 <__smakebuf_r+0x148>
    ac50:	04000a13          	li	s4,64
    ac54:	000a0593          	mv	a1,s4
    ac58:	00048513          	mv	a0,s1
    ac5c:	ae5f60ef          	jal	1740 <_malloc_r>
    ac60:	00c41783          	lh	a5,12(s0)
    ac64:	00000993          	li	s3,0
    ac68:	f8051ce3          	bnez	a0,ac00 <__smakebuf_r+0xa0>
    ac6c:	2007f713          	and	a4,a5,512
    ac70:	04071e63          	bnez	a4,accc <__smakebuf_r+0x16c>
    ac74:	ffc7f793          	and	a5,a5,-4
    ac78:	0027e793          	or	a5,a5,2
    ac7c:	04340713          	add	a4,s0,67
    ac80:	00f41623          	sh	a5,12(s0)
    ac84:	00100793          	li	a5,1
    ac88:	07412483          	lw	s1,116(sp)
    ac8c:	07012903          	lw	s2,112(sp)
    ac90:	06c12983          	lw	s3,108(sp)
    ac94:	06812a03          	lw	s4,104(sp)
    ac98:	00e42023          	sw	a4,0(s0)
    ac9c:	00e42823          	sw	a4,16(s0)
    aca0:	00f42a23          	sw	a5,20(s0)
    aca4:	eedff06f          	j	ab90 <__smakebuf_r+0x30>
    aca8:	40000a13          	li	s4,1024
    acac:	00000993          	li	s3,0
    acb0:	f3dff06f          	j	abec <__smakebuf_r+0x8c>
    acb4:	00e41583          	lh	a1,14(s0)
    acb8:	00048513          	mv	a0,s1
    acbc:	22c000ef          	jal	aee8 <_isatty_r>
    acc0:	02051063          	bnez	a0,ace0 <__smakebuf_r+0x180>
    acc4:	00c41783          	lh	a5,12(s0)
    acc8:	f51ff06f          	j	ac18 <__smakebuf_r+0xb8>
    accc:	07412483          	lw	s1,116(sp)
    acd0:	07012903          	lw	s2,112(sp)
    acd4:	06c12983          	lw	s3,108(sp)
    acd8:	06812a03          	lw	s4,104(sp)
    acdc:	eb5ff06f          	j	ab90 <__smakebuf_r+0x30>
    ace0:	00c45783          	lhu	a5,12(s0)
    ace4:	ffc7f793          	and	a5,a5,-4
    ace8:	0017e793          	or	a5,a5,1
    acec:	01079793          	sll	a5,a5,0x10
    acf0:	4107d793          	sra	a5,a5,0x10
    acf4:	f25ff06f          	j	ac18 <__smakebuf_r+0xb8>

0000acf8 <__swbuf_r>:
    acf8:	fe010113          	add	sp,sp,-32
    acfc:	00812c23          	sw	s0,24(sp)
    ad00:	00912a23          	sw	s1,20(sp)
    ad04:	01212823          	sw	s2,16(sp)
    ad08:	00112e23          	sw	ra,28(sp)
    ad0c:	00050913          	mv	s2,a0
    ad10:	00058493          	mv	s1,a1
    ad14:	00060413          	mv	s0,a2
    ad18:	00050663          	beqz	a0,ad24 <__swbuf_r+0x2c>
    ad1c:	03452783          	lw	a5,52(a0)
    ad20:	16078063          	beqz	a5,ae80 <__swbuf_r+0x188>
    ad24:	01842783          	lw	a5,24(s0)
    ad28:	00c41703          	lh	a4,12(s0)
    ad2c:	00f42423          	sw	a5,8(s0)
    ad30:	00877793          	and	a5,a4,8
    ad34:	08078063          	beqz	a5,adb4 <__swbuf_r+0xbc>
    ad38:	01042783          	lw	a5,16(s0)
    ad3c:	06078c63          	beqz	a5,adb4 <__swbuf_r+0xbc>
    ad40:	01312623          	sw	s3,12(sp)
    ad44:	01271693          	sll	a3,a4,0x12
    ad48:	0ff4f993          	zext.b	s3,s1
    ad4c:	0ff4f493          	zext.b	s1,s1
    ad50:	0806d863          	bgez	a3,ade0 <__swbuf_r+0xe8>
    ad54:	00042703          	lw	a4,0(s0)
    ad58:	01442683          	lw	a3,20(s0)
    ad5c:	40f707b3          	sub	a5,a4,a5
    ad60:	0ad7d863          	bge	a5,a3,ae10 <__swbuf_r+0x118>
    ad64:	00842683          	lw	a3,8(s0)
    ad68:	00170613          	add	a2,a4,1
    ad6c:	00c42023          	sw	a2,0(s0)
    ad70:	fff68693          	add	a3,a3,-1
    ad74:	00d42423          	sw	a3,8(s0)
    ad78:	01370023          	sb	s3,0(a4)
    ad7c:	01442703          	lw	a4,20(s0)
    ad80:	00178793          	add	a5,a5,1 # ffffe001 <__crt0_ram_last+0x7ff7e002>
    ad84:	0cf70263          	beq	a4,a5,ae48 <__swbuf_r+0x150>
    ad88:	00c45783          	lhu	a5,12(s0)
    ad8c:	0017f793          	and	a5,a5,1
    ad90:	0c079a63          	bnez	a5,ae64 <__swbuf_r+0x16c>
    ad94:	00c12983          	lw	s3,12(sp)
    ad98:	01c12083          	lw	ra,28(sp)
    ad9c:	01812403          	lw	s0,24(sp)
    ada0:	01012903          	lw	s2,16(sp)
    ada4:	00048513          	mv	a0,s1
    ada8:	01412483          	lw	s1,20(sp)
    adac:	02010113          	add	sp,sp,32
    adb0:	00008067          	ret
    adb4:	00040593          	mv	a1,s0
    adb8:	00090513          	mv	a0,s2
    adbc:	dfcfc0ef          	jal	73b8 <__swsetup_r>
    adc0:	08051e63          	bnez	a0,ae5c <__swbuf_r+0x164>
    adc4:	00c41703          	lh	a4,12(s0)
    adc8:	01312623          	sw	s3,12(sp)
    adcc:	01042783          	lw	a5,16(s0)
    add0:	01271693          	sll	a3,a4,0x12
    add4:	0ff4f993          	zext.b	s3,s1
    add8:	0ff4f493          	zext.b	s1,s1
    addc:	f606cce3          	bltz	a3,ad54 <__swbuf_r+0x5c>
    ade0:	06442683          	lw	a3,100(s0)
    ade4:	ffffe637          	lui	a2,0xffffe
    ade8:	000025b7          	lui	a1,0x2
    adec:	00b76733          	or	a4,a4,a1
    adf0:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    adf4:	00c6f6b3          	and	a3,a3,a2
    adf8:	00e41623          	sh	a4,12(s0)
    adfc:	00042703          	lw	a4,0(s0)
    ae00:	06d42223          	sw	a3,100(s0)
    ae04:	01442683          	lw	a3,20(s0)
    ae08:	40f707b3          	sub	a5,a4,a5
    ae0c:	f4d7cce3          	blt	a5,a3,ad64 <__swbuf_r+0x6c>
    ae10:	00040593          	mv	a1,s0
    ae14:	00090513          	mv	a0,s2
    ae18:	af1fb0ef          	jal	6908 <_fflush_r>
    ae1c:	02051e63          	bnez	a0,ae58 <__swbuf_r+0x160>
    ae20:	00042703          	lw	a4,0(s0)
    ae24:	00842683          	lw	a3,8(s0)
    ae28:	00100793          	li	a5,1
    ae2c:	00170613          	add	a2,a4,1
    ae30:	fff68693          	add	a3,a3,-1
    ae34:	00c42023          	sw	a2,0(s0)
    ae38:	00d42423          	sw	a3,8(s0)
    ae3c:	01370023          	sb	s3,0(a4)
    ae40:	01442703          	lw	a4,20(s0)
    ae44:	f4f712e3          	bne	a4,a5,ad88 <__swbuf_r+0x90>
    ae48:	00040593          	mv	a1,s0
    ae4c:	00090513          	mv	a0,s2
    ae50:	ab9fb0ef          	jal	6908 <_fflush_r>
    ae54:	f40500e3          	beqz	a0,ad94 <__swbuf_r+0x9c>
    ae58:	00c12983          	lw	s3,12(sp)
    ae5c:	fff00493          	li	s1,-1
    ae60:	f39ff06f          	j	ad98 <__swbuf_r+0xa0>
    ae64:	00a00793          	li	a5,10
    ae68:	f2f496e3          	bne	s1,a5,ad94 <__swbuf_r+0x9c>
    ae6c:	00040593          	mv	a1,s0
    ae70:	00090513          	mv	a0,s2
    ae74:	a95fb0ef          	jal	6908 <_fflush_r>
    ae78:	f0050ee3          	beqz	a0,ad94 <__swbuf_r+0x9c>
    ae7c:	fddff06f          	j	ae58 <__swbuf_r+0x160>
    ae80:	d85fb0ef          	jal	6c04 <__sinit>
    ae84:	ea1ff06f          	j	ad24 <__swbuf_r+0x2c>

0000ae88 <_fstat_r>:
    ae88:	ff010113          	add	sp,sp,-16
    ae8c:	00058713          	mv	a4,a1
    ae90:	00812423          	sw	s0,8(sp)
    ae94:	00060593          	mv	a1,a2
    ae98:	00050413          	mv	s0,a0
    ae9c:	00070513          	mv	a0,a4
    aea0:	7fff6797          	auipc	a5,0x7fff6
    aea4:	8607ac23          	sw	zero,-1928(a5) # 80000718 <errno>
    aea8:	00112623          	sw	ra,12(sp)
    aeac:	d29f50ef          	jal	bd4 <_fstat>
    aeb0:	fff00793          	li	a5,-1
    aeb4:	00f50a63          	beq	a0,a5,aec8 <_fstat_r+0x40>
    aeb8:	00c12083          	lw	ra,12(sp)
    aebc:	00812403          	lw	s0,8(sp)
    aec0:	01010113          	add	sp,sp,16
    aec4:	00008067          	ret
    aec8:	7fff6797          	auipc	a5,0x7fff6
    aecc:	8507a783          	lw	a5,-1968(a5) # 80000718 <errno>
    aed0:	fe0784e3          	beqz	a5,aeb8 <_fstat_r+0x30>
    aed4:	00c12083          	lw	ra,12(sp)
    aed8:	00f42023          	sw	a5,0(s0)
    aedc:	00812403          	lw	s0,8(sp)
    aee0:	01010113          	add	sp,sp,16
    aee4:	00008067          	ret

0000aee8 <_isatty_r>:
    aee8:	ff010113          	add	sp,sp,-16
    aeec:	00812423          	sw	s0,8(sp)
    aef0:	00050413          	mv	s0,a0
    aef4:	00058513          	mv	a0,a1
    aef8:	7fff6797          	auipc	a5,0x7fff6
    aefc:	8207a023          	sw	zero,-2016(a5) # 80000718 <errno>
    af00:	00112623          	sw	ra,12(sp)
    af04:	ce9f50ef          	jal	bec <_isatty>
    af08:	fff00793          	li	a5,-1
    af0c:	00f50a63          	beq	a0,a5,af20 <_isatty_r+0x38>
    af10:	00c12083          	lw	ra,12(sp)
    af14:	00812403          	lw	s0,8(sp)
    af18:	01010113          	add	sp,sp,16
    af1c:	00008067          	ret
    af20:	7fff5797          	auipc	a5,0x7fff5
    af24:	7f87a783          	lw	a5,2040(a5) # 80000718 <errno>
    af28:	fe0784e3          	beqz	a5,af10 <_isatty_r+0x28>
    af2c:	00c12083          	lw	ra,12(sp)
    af30:	00f42023          	sw	a5,0(s0)
    af34:	00812403          	lw	s0,8(sp)
    af38:	01010113          	add	sp,sp,16
    af3c:	00008067          	ret

0000af40 <__errno>:
    af40:	7fff5517          	auipc	a0,0x7fff5
    af44:	7c852503          	lw	a0,1992(a0) # 80000708 <_impure_ptr>
    af48:	00008067          	ret

0000af4c <__assert_func>:
    af4c:	ff010113          	add	sp,sp,-16
    af50:	00068793          	mv	a5,a3
    af54:	7fff5717          	auipc	a4,0x7fff5
    af58:	7b472703          	lw	a4,1972(a4) # 80000708 <_impure_ptr>
    af5c:	00060813          	mv	a6,a2
    af60:	00112623          	sw	ra,12(sp)
    af64:	00c72883          	lw	a7,12(a4)
    af68:	00078613          	mv	a2,a5
    af6c:	00050693          	mv	a3,a0
    af70:	00058713          	mv	a4,a1
    af74:	00004797          	auipc	a5,0x4
    af78:	3cc78793          	add	a5,a5,972 # f340 <__fini_array_end+0x4b4>
    af7c:	00080c63          	beqz	a6,af94 <__assert_func+0x48>
    af80:	00004597          	auipc	a1,0x4
    af84:	3d058593          	add	a1,a1,976 # f350 <__fini_array_end+0x4c4>
    af88:	00088513          	mv	a0,a7
    af8c:	3a8000ef          	jal	b334 <fiprintf>
    af90:	3f0000ef          	jal	b380 <abort>
    af94:	00004797          	auipc	a5,0x4
    af98:	0ec78793          	add	a5,a5,236 # f080 <__fini_array_end+0x1f4>
    af9c:	00078813          	mv	a6,a5
    afa0:	fe1ff06f          	j	af80 <__assert_func+0x34>

0000afa4 <_calloc_r>:
    afa4:	fe010113          	add	sp,sp,-32
    afa8:	00812c23          	sw	s0,24(sp)
    afac:	00112e23          	sw	ra,28(sp)
    afb0:	0105d693          	srl	a3,a1,0x10
    afb4:	00058793          	mv	a5,a1
    afb8:	00050413          	mv	s0,a0
    afbc:	01065713          	srl	a4,a2,0x10
    afc0:	0c069063          	bnez	a3,b080 <_calloc_r+0xdc>
    afc4:	14071a63          	bnez	a4,b118 <_calloc_r+0x174>
    afc8:	01061593          	sll	a1,a2,0x10
    afcc:	01079513          	sll	a0,a5,0x10
    afd0:	0105d593          	srl	a1,a1,0x10
    afd4:	01055513          	srl	a0,a0,0x10
    afd8:	4bd030ef          	jal	ec94 <__mulsi3>
    afdc:	00050593          	mv	a1,a0
    afe0:	00040513          	mv	a0,s0
    afe4:	f5cf60ef          	jal	1740 <_malloc_r>
    afe8:	00050413          	mv	s0,a0
    afec:	10050a63          	beqz	a0,b100 <_calloc_r+0x15c>
    aff0:	ffc52603          	lw	a2,-4(a0)
    aff4:	02400713          	li	a4,36
    aff8:	ffc67613          	and	a2,a2,-4
    affc:	ffc60613          	add	a2,a2,-4
    b000:	04c76863          	bltu	a4,a2,b050 <_calloc_r+0xac>
    b004:	01300693          	li	a3,19
    b008:	00050793          	mv	a5,a0
    b00c:	02c6f263          	bgeu	a3,a2,b030 <_calloc_r+0x8c>
    b010:	00052023          	sw	zero,0(a0)
    b014:	00052223          	sw	zero,4(a0)
    b018:	01b00793          	li	a5,27
    b01c:	04c7f863          	bgeu	a5,a2,b06c <_calloc_r+0xc8>
    b020:	00052423          	sw	zero,8(a0)
    b024:	00052623          	sw	zero,12(a0)
    b028:	01050793          	add	a5,a0,16
    b02c:	10e60263          	beq	a2,a4,b130 <_calloc_r+0x18c>
    b030:	0007a023          	sw	zero,0(a5)
    b034:	0007a223          	sw	zero,4(a5)
    b038:	0007a423          	sw	zero,8(a5)
    b03c:	01c12083          	lw	ra,28(sp)
    b040:	00040513          	mv	a0,s0
    b044:	01812403          	lw	s0,24(sp)
    b048:	02010113          	add	sp,sp,32
    b04c:	00008067          	ret
    b050:	00000593          	li	a1,0
    b054:	f91f50ef          	jal	fe4 <memset>
    b058:	01c12083          	lw	ra,28(sp)
    b05c:	00040513          	mv	a0,s0
    b060:	01812403          	lw	s0,24(sp)
    b064:	02010113          	add	sp,sp,32
    b068:	00008067          	ret
    b06c:	00850793          	add	a5,a0,8
    b070:	0007a023          	sw	zero,0(a5)
    b074:	0007a223          	sw	zero,4(a5)
    b078:	0007a423          	sw	zero,8(a5)
    b07c:	fc1ff06f          	j	b03c <_calloc_r+0x98>
    b080:	0c071663          	bnez	a4,b14c <_calloc_r+0x1a8>
    b084:	01212823          	sw	s2,16(sp)
    b088:	01312623          	sw	s3,12(sp)
    b08c:	00912a23          	sw	s1,20(sp)
    b090:	00068913          	mv	s2,a3
    b094:	00060993          	mv	s3,a2
    b098:	01079513          	sll	a0,a5,0x10
    b09c:	01061593          	sll	a1,a2,0x10
    b0a0:	0105d593          	srl	a1,a1,0x10
    b0a4:	01055513          	srl	a0,a0,0x10
    b0a8:	3ed030ef          	jal	ec94 <__mulsi3>
    b0ac:	00050493          	mv	s1,a0
    b0b0:	01091593          	sll	a1,s2,0x10
    b0b4:	01099513          	sll	a0,s3,0x10
    b0b8:	0105d593          	srl	a1,a1,0x10
    b0bc:	01055513          	srl	a0,a0,0x10
    b0c0:	3d5030ef          	jal	ec94 <__mulsi3>
    b0c4:	0104d793          	srl	a5,s1,0x10
    b0c8:	00f505b3          	add	a1,a0,a5
    b0cc:	0105d793          	srl	a5,a1,0x10
    b0d0:	06079863          	bnez	a5,b140 <_calloc_r+0x19c>
    b0d4:	01049493          	sll	s1,s1,0x10
    b0d8:	0104d493          	srl	s1,s1,0x10
    b0dc:	01059593          	sll	a1,a1,0x10
    b0e0:	0095e5b3          	or	a1,a1,s1
    b0e4:	00040513          	mv	a0,s0
    b0e8:	01412483          	lw	s1,20(sp)
    b0ec:	01012903          	lw	s2,16(sp)
    b0f0:	00c12983          	lw	s3,12(sp)
    b0f4:	e4cf60ef          	jal	1740 <_malloc_r>
    b0f8:	00050413          	mv	s0,a0
    b0fc:	ee051ae3          	bnez	a0,aff0 <_calloc_r+0x4c>
    b100:	00000413          	li	s0,0
    b104:	01c12083          	lw	ra,28(sp)
    b108:	00040513          	mv	a0,s0
    b10c:	01812403          	lw	s0,24(sp)
    b110:	02010113          	add	sp,sp,32
    b114:	00008067          	ret
    b118:	01212823          	sw	s2,16(sp)
    b11c:	01312623          	sw	s3,12(sp)
    b120:	00912a23          	sw	s1,20(sp)
    b124:	00070913          	mv	s2,a4
    b128:	00058993          	mv	s3,a1
    b12c:	f6dff06f          	j	b098 <_calloc_r+0xf4>
    b130:	00052823          	sw	zero,16(a0)
    b134:	01850793          	add	a5,a0,24
    b138:	00052a23          	sw	zero,20(a0)
    b13c:	ef5ff06f          	j	b030 <_calloc_r+0x8c>
    b140:	01412483          	lw	s1,20(sp)
    b144:	01012903          	lw	s2,16(sp)
    b148:	00c12983          	lw	s3,12(sp)
    b14c:	df5ff0ef          	jal	af40 <__errno>
    b150:	00c00793          	li	a5,12
    b154:	00f52023          	sw	a5,0(a0)
    b158:	00000413          	li	s0,0
    b15c:	fa9ff06f          	j	b104 <_calloc_r+0x160>

0000b160 <_wcsnrtombs_l>:
    b160:	fa010113          	add	sp,sp,-96
    b164:	04912a23          	sw	s1,84(sp)
    b168:	05212823          	sw	s2,80(sp)
    b16c:	05312623          	sw	s3,76(sp)
    b170:	05412423          	sw	s4,72(sp)
    b174:	05512223          	sw	s5,68(sp)
    b178:	04112e23          	sw	ra,92(sp)
    b17c:	03912a23          	sw	s9,52(sp)
    b180:	03a12823          	sw	s10,48(sp)
    b184:	00a12623          	sw	a0,12(sp)
    b188:	00058a13          	mv	s4,a1
    b18c:	00060a93          	mv	s5,a2
    b190:	00070913          	mv	s2,a4
    b194:	00080993          	mv	s3,a6
    b198:	00078493          	mv	s1,a5
    b19c:	12078063          	beqz	a5,b2bc <_wcsnrtombs_l+0x15c>
    b1a0:	000aac83          	lw	s9,0(s5)
    b1a4:	120a0263          	beqz	s4,b2c8 <_wcsnrtombs_l+0x168>
    b1a8:	14090e63          	beqz	s2,b304 <_wcsnrtombs_l+0x1a4>
    b1ac:	05612023          	sw	s6,64(sp)
    b1b0:	fff68b13          	add	s6,a3,-1
    b1b4:	16068063          	beqz	a3,b314 <_wcsnrtombs_l+0x1b4>
    b1b8:	04812c23          	sw	s0,88(sp)
    b1bc:	03b12623          	sw	s11,44(sp)
    b1c0:	03712e23          	sw	s7,60(sp)
    b1c4:	03812c23          	sw	s8,56(sp)
    b1c8:	000a0413          	mv	s0,s4
    b1cc:	00000d13          	li	s10,0
    b1d0:	fff00d93          	li	s11,-1
    b1d4:	0240006f          	j	b1f8 <_wcsnrtombs_l+0x98>
    b1d8:	080a1a63          	bnez	s4,b26c <_wcsnrtombs_l+0x10c>
    b1dc:	000ca783          	lw	a5,0(s9)
    b1e0:	004c8c93          	add	s9,s9,4
    b1e4:	0c078263          	beqz	a5,b2a8 <_wcsnrtombs_l+0x148>
    b1e8:	1326f263          	bgeu	a3,s2,b30c <_wcsnrtombs_l+0x1ac>
    b1ec:	fffb0b13          	add	s6,s6,-1
    b1f0:	00068d13          	mv	s10,a3
    b1f4:	03bb0c63          	beq	s6,s11,b22c <_wcsnrtombs_l+0xcc>
    b1f8:	0e09a783          	lw	a5,224(s3)
    b1fc:	000ca603          	lw	a2,0(s9)
    b200:	00c12503          	lw	a0,12(sp)
    b204:	00048693          	mv	a3,s1
    b208:	01410593          	add	a1,sp,20
    b20c:	0004ac03          	lw	s8,0(s1)
    b210:	0044ab83          	lw	s7,4(s1)
    b214:	000780e7          	jalr	a5
    b218:	0bb50e63          	beq	a0,s11,b2d4 <_wcsnrtombs_l+0x174>
    b21c:	01a506b3          	add	a3,a0,s10
    b220:	fad97ce3          	bgeu	s2,a3,b1d8 <_wcsnrtombs_l+0x78>
    b224:	0184a023          	sw	s8,0(s1)
    b228:	0174a223          	sw	s7,4(s1)
    b22c:	05812403          	lw	s0,88(sp)
    b230:	04012b03          	lw	s6,64(sp)
    b234:	03c12b83          	lw	s7,60(sp)
    b238:	03812c03          	lw	s8,56(sp)
    b23c:	02c12d83          	lw	s11,44(sp)
    b240:	05c12083          	lw	ra,92(sp)
    b244:	05412483          	lw	s1,84(sp)
    b248:	05012903          	lw	s2,80(sp)
    b24c:	04c12983          	lw	s3,76(sp)
    b250:	04812a03          	lw	s4,72(sp)
    b254:	04412a83          	lw	s5,68(sp)
    b258:	03412c83          	lw	s9,52(sp)
    b25c:	000d0513          	mv	a0,s10
    b260:	03012d03          	lw	s10,48(sp)
    b264:	06010113          	add	sp,sp,96
    b268:	00008067          	ret
    b26c:	08a05063          	blez	a0,b2ec <_wcsnrtombs_l+0x18c>
    b270:	01410893          	add	a7,sp,20
    b274:	00a40533          	add	a0,s0,a0
    b278:	0008c783          	lbu	a5,0(a7)
    b27c:	00140413          	add	s0,s0,1
    b280:	00188893          	add	a7,a7,1
    b284:	fef40fa3          	sb	a5,-1(s0)
    b288:	fe8518e3          	bne	a0,s0,b278 <_wcsnrtombs_l+0x118>
    b28c:	000aa783          	lw	a5,0(s5)
    b290:	00050413          	mv	s0,a0
    b294:	00478793          	add	a5,a5,4
    b298:	00faa023          	sw	a5,0(s5)
    b29c:	000ca783          	lw	a5,0(s9)
    b2a0:	004c8c93          	add	s9,s9,4
    b2a4:	f40792e3          	bnez	a5,b1e8 <_wcsnrtombs_l+0x88>
    b2a8:	000a0463          	beqz	s4,b2b0 <_wcsnrtombs_l+0x150>
    b2ac:	000aa023          	sw	zero,0(s5)
    b2b0:	0004a023          	sw	zero,0(s1)
    b2b4:	fff68d13          	add	s10,a3,-1
    b2b8:	f75ff06f          	j	b22c <_wcsnrtombs_l+0xcc>
    b2bc:	000aac83          	lw	s9,0(s5)
    b2c0:	10c50493          	add	s1,a0,268
    b2c4:	ee0a12e3          	bnez	s4,b1a8 <_wcsnrtombs_l+0x48>
    b2c8:	05612023          	sw	s6,64(sp)
    b2cc:	fff00913          	li	s2,-1
    b2d0:	ee1ff06f          	j	b1b0 <_wcsnrtombs_l+0x50>
    b2d4:	00c12703          	lw	a4,12(sp)
    b2d8:	08a00793          	li	a5,138
    b2dc:	fff00d13          	li	s10,-1
    b2e0:	00f72023          	sw	a5,0(a4)
    b2e4:	0004a023          	sw	zero,0(s1)
    b2e8:	f45ff06f          	j	b22c <_wcsnrtombs_l+0xcc>
    b2ec:	000aa783          	lw	a5,0(s5)
    b2f0:	00040513          	mv	a0,s0
    b2f4:	00050413          	mv	s0,a0
    b2f8:	00478793          	add	a5,a5,4
    b2fc:	00faa023          	sw	a5,0(s5)
    b300:	f9dff06f          	j	b29c <_wcsnrtombs_l+0x13c>
    b304:	00000d13          	li	s10,0
    b308:	f39ff06f          	j	b240 <_wcsnrtombs_l+0xe0>
    b30c:	00068d13          	mv	s10,a3
    b310:	f1dff06f          	j	b22c <_wcsnrtombs_l+0xcc>
    b314:	04012b03          	lw	s6,64(sp)
    b318:	00000d13          	li	s10,0
    b31c:	f25ff06f          	j	b240 <_wcsnrtombs_l+0xe0>

0000b320 <_wcsnrtombs_r>:
    b320:	7fff5817          	auipc	a6,0x7fff5
    b324:	21480813          	add	a6,a6,532 # 80000534 <__global_locale>
    b328:	7fff5517          	auipc	a0,0x7fff5
    b32c:	3e052503          	lw	a0,992(a0) # 80000708 <_impure_ptr>
    b330:	e31ff06f          	j	b160 <_wcsnrtombs_l>

0000b334 <fiprintf>:
    b334:	fc010113          	add	sp,sp,-64
    b338:	02810313          	add	t1,sp,40
    b33c:	02c12423          	sw	a2,40(sp)
    b340:	02d12623          	sw	a3,44(sp)
    b344:	00058613          	mv	a2,a1
    b348:	00030693          	mv	a3,t1
    b34c:	00050593          	mv	a1,a0
    b350:	7fff5517          	auipc	a0,0x7fff5
    b354:	3b852503          	lw	a0,952(a0) # 80000708 <_impure_ptr>
    b358:	00112e23          	sw	ra,28(sp)
    b35c:	02e12823          	sw	a4,48(sp)
    b360:	02f12a23          	sw	a5,52(sp)
    b364:	03012c23          	sw	a6,56(sp)
    b368:	03112e23          	sw	a7,60(sp)
    b36c:	00612623          	sw	t1,12(sp)
    b370:	a9df90ef          	jal	4e0c <_vfiprintf_r>
    b374:	01c12083          	lw	ra,28(sp)
    b378:	04010113          	add	sp,sp,64
    b37c:	00008067          	ret

0000b380 <abort>:
    b380:	ff010113          	add	sp,sp,-16
    b384:	00600513          	li	a0,6
    b388:	00112623          	sw	ra,12(sp)
    b38c:	00c000ef          	jal	b398 <raise>
    b390:	00100513          	li	a0,1
    b394:	829f50ef          	jal	bbc <_exit>

0000b398 <raise>:
    b398:	ff010113          	add	sp,sp,-16
    b39c:	00912223          	sw	s1,4(sp)
    b3a0:	00112623          	sw	ra,12(sp)
    b3a4:	01f00793          	li	a5,31
    b3a8:	7fff5497          	auipc	s1,0x7fff5
    b3ac:	3604a483          	lw	s1,864(s1) # 80000708 <_impure_ptr>
    b3b0:	08a7ee63          	bltu	a5,a0,b44c <raise+0xb4>
    b3b4:	1184a783          	lw	a5,280(s1)
    b3b8:	00812423          	sw	s0,8(sp)
    b3bc:	00050413          	mv	s0,a0
    b3c0:	04078263          	beqz	a5,b404 <raise+0x6c>
    b3c4:	00251713          	sll	a4,a0,0x2
    b3c8:	00e787b3          	add	a5,a5,a4
    b3cc:	0007a703          	lw	a4,0(a5)
    b3d0:	02070a63          	beqz	a4,b404 <raise+0x6c>
    b3d4:	00100693          	li	a3,1
    b3d8:	00d70a63          	beq	a4,a3,b3ec <raise+0x54>
    b3dc:	fff00693          	li	a3,-1
    b3e0:	04d70663          	beq	a4,a3,b42c <raise+0x94>
    b3e4:	0007a023          	sw	zero,0(a5)
    b3e8:	000700e7          	jalr	a4
    b3ec:	00812403          	lw	s0,8(sp)
    b3f0:	00000513          	li	a0,0
    b3f4:	00c12083          	lw	ra,12(sp)
    b3f8:	00412483          	lw	s1,4(sp)
    b3fc:	01010113          	add	sp,sp,16
    b400:	00008067          	ret
    b404:	00048513          	mv	a0,s1
    b408:	0b4000ef          	jal	b4bc <_getpid_r>
    b40c:	00040613          	mv	a2,s0
    b410:	00812403          	lw	s0,8(sp)
    b414:	00c12083          	lw	ra,12(sp)
    b418:	00050593          	mv	a1,a0
    b41c:	00048513          	mv	a0,s1
    b420:	00412483          	lw	s1,4(sp)
    b424:	01010113          	add	sp,sp,16
    b428:	0340006f          	j	b45c <_kill_r>
    b42c:	00812403          	lw	s0,8(sp)
    b430:	00c12083          	lw	ra,12(sp)
    b434:	01600793          	li	a5,22
    b438:	00f4a023          	sw	a5,0(s1)
    b43c:	00100513          	li	a0,1
    b440:	00412483          	lw	s1,4(sp)
    b444:	01010113          	add	sp,sp,16
    b448:	00008067          	ret
    b44c:	01600793          	li	a5,22
    b450:	00f4a023          	sw	a5,0(s1)
    b454:	fff00513          	li	a0,-1
    b458:	f9dff06f          	j	b3f4 <raise+0x5c>

0000b45c <_kill_r>:
    b45c:	ff010113          	add	sp,sp,-16
    b460:	00058713          	mv	a4,a1
    b464:	00812423          	sw	s0,8(sp)
    b468:	00060593          	mv	a1,a2
    b46c:	00050413          	mv	s0,a0
    b470:	00070513          	mv	a0,a4
    b474:	7fff5797          	auipc	a5,0x7fff5
    b478:	2a07a223          	sw	zero,676(a5) # 80000718 <errno>
    b47c:	00112623          	sw	ra,12(sp)
    b480:	f74f50ef          	jal	bf4 <_kill>
    b484:	fff00793          	li	a5,-1
    b488:	00f50a63          	beq	a0,a5,b49c <_kill_r+0x40>
    b48c:	00c12083          	lw	ra,12(sp)
    b490:	00812403          	lw	s0,8(sp)
    b494:	01010113          	add	sp,sp,16
    b498:	00008067          	ret
    b49c:	7fff5797          	auipc	a5,0x7fff5
    b4a0:	27c7a783          	lw	a5,636(a5) # 80000718 <errno>
    b4a4:	fe0784e3          	beqz	a5,b48c <_kill_r+0x30>
    b4a8:	00c12083          	lw	ra,12(sp)
    b4ac:	00f42023          	sw	a5,0(s0)
    b4b0:	00812403          	lw	s0,8(sp)
    b4b4:	01010113          	add	sp,sp,16
    b4b8:	00008067          	ret

0000b4bc <_getpid_r>:
    b4bc:	f28f506f          	j	be4 <_getpid>

0000b4c0 <__udivdi3>:
    b4c0:	fd010113          	add	sp,sp,-48
    b4c4:	01312e23          	sw	s3,28(sp)
    b4c8:	02112623          	sw	ra,44(sp)
    b4cc:	01612823          	sw	s6,16(sp)
    b4d0:	00050993          	mv	s3,a0
    b4d4:	16069663          	bnez	a3,b640 <__udivdi3+0x180>
    b4d8:	02812423          	sw	s0,40(sp)
    b4dc:	01512a23          	sw	s5,20(sp)
    b4e0:	02912223          	sw	s1,36(sp)
    b4e4:	03212023          	sw	s2,32(sp)
    b4e8:	01412c23          	sw	s4,24(sp)
    b4ec:	00060a93          	mv	s5,a2
    b4f0:	00050413          	mv	s0,a0
    b4f4:	1cc5f063          	bgeu	a1,a2,b6b4 <__udivdi3+0x1f4>
    b4f8:	000107b7          	lui	a5,0x10
    b4fc:	00058493          	mv	s1,a1
    b500:	2af66e63          	bltu	a2,a5,b7bc <__udivdi3+0x2fc>
    b504:	010007b7          	lui	a5,0x1000
    b508:	01800713          	li	a4,24
    b50c:	00f67463          	bgeu	a2,a5,b514 <__udivdi3+0x54>
    b510:	01000713          	li	a4,16
    b514:	00e656b3          	srl	a3,a2,a4
    b518:	00004797          	auipc	a5,0x4
    b51c:	45878793          	add	a5,a5,1112 # f970 <__clz_tab>
    b520:	00d787b3          	add	a5,a5,a3
    b524:	0007c783          	lbu	a5,0(a5)
    b528:	02000693          	li	a3,32
    b52c:	00e787b3          	add	a5,a5,a4
    b530:	40f68733          	sub	a4,a3,a5
    b534:	00f68c63          	beq	a3,a5,b54c <__udivdi3+0x8c>
    b538:	00e594b3          	sll	s1,a1,a4
    b53c:	00f9d7b3          	srl	a5,s3,a5
    b540:	00e61ab3          	sll	s5,a2,a4
    b544:	0097e4b3          	or	s1,a5,s1
    b548:	00e99433          	sll	s0,s3,a4
    b54c:	010ada13          	srl	s4,s5,0x10
    b550:	000a0593          	mv	a1,s4
    b554:	00048513          	mv	a0,s1
    b558:	010a9b13          	sll	s6,s5,0x10
    b55c:	7fc030ef          	jal	ed58 <__hidden___udivsi3>
    b560:	010b5b13          	srl	s6,s6,0x10
    b564:	00050593          	mv	a1,a0
    b568:	00050913          	mv	s2,a0
    b56c:	000b0513          	mv	a0,s6
    b570:	724030ef          	jal	ec94 <__mulsi3>
    b574:	00050793          	mv	a5,a0
    b578:	000a0593          	mv	a1,s4
    b57c:	00048513          	mv	a0,s1
    b580:	00078493          	mv	s1,a5
    b584:	01d030ef          	jal	eda0 <__umodsi3>
    b588:	01051513          	sll	a0,a0,0x10
    b58c:	01045793          	srl	a5,s0,0x10
    b590:	00a7e7b3          	or	a5,a5,a0
    b594:	0097fc63          	bgeu	a5,s1,b5ac <__udivdi3+0xec>
    b598:	00fa87b3          	add	a5,s5,a5
    b59c:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0x173>
    b5a0:	0157e463          	bltu	a5,s5,b5a8 <__udivdi3+0xe8>
    b5a4:	5a97e863          	bltu	a5,s1,bb54 <__udivdi3+0x694>
    b5a8:	00070913          	mv	s2,a4
    b5ac:	409784b3          	sub	s1,a5,s1
    b5b0:	000a0593          	mv	a1,s4
    b5b4:	00048513          	mv	a0,s1
    b5b8:	7a0030ef          	jal	ed58 <__hidden___udivsi3>
    b5bc:	00050593          	mv	a1,a0
    b5c0:	00050993          	mv	s3,a0
    b5c4:	000b0513          	mv	a0,s6
    b5c8:	6cc030ef          	jal	ec94 <__mulsi3>
    b5cc:	00050793          	mv	a5,a0
    b5d0:	000a0593          	mv	a1,s4
    b5d4:	00048513          	mv	a0,s1
    b5d8:	01041413          	sll	s0,s0,0x10
    b5dc:	00078493          	mv	s1,a5
    b5e0:	7c0030ef          	jal	eda0 <__umodsi3>
    b5e4:	01051513          	sll	a0,a0,0x10
    b5e8:	01045413          	srl	s0,s0,0x10
    b5ec:	00a46433          	or	s0,s0,a0
    b5f0:	00947c63          	bgeu	s0,s1,b608 <__udivdi3+0x148>
    b5f4:	008a8433          	add	s0,s5,s0
    b5f8:	fff98793          	add	a5,s3,-1
    b5fc:	4d546e63          	bltu	s0,s5,bad8 <__udivdi3+0x618>
    b600:	ffe98993          	add	s3,s3,-2
    b604:	4c947a63          	bgeu	s0,s1,bad8 <__udivdi3+0x618>
    b608:	01091613          	sll	a2,s2,0x10
    b60c:	01366533          	or	a0,a2,s3
    b610:	00000b13          	li	s6,0
    b614:	02812403          	lw	s0,40(sp)
    b618:	02c12083          	lw	ra,44(sp)
    b61c:	02412483          	lw	s1,36(sp)
    b620:	02012903          	lw	s2,32(sp)
    b624:	01812a03          	lw	s4,24(sp)
    b628:	01412a83          	lw	s5,20(sp)
    b62c:	01c12983          	lw	s3,28(sp)
    b630:	000b0593          	mv	a1,s6
    b634:	01012b03          	lw	s6,16(sp)
    b638:	03010113          	add	sp,sp,48
    b63c:	00008067          	ret
    b640:	02d5f263          	bgeu	a1,a3,b664 <__udivdi3+0x1a4>
    b644:	00000b13          	li	s6,0
    b648:	00000513          	li	a0,0
    b64c:	02c12083          	lw	ra,44(sp)
    b650:	01c12983          	lw	s3,28(sp)
    b654:	000b0593          	mv	a1,s6
    b658:	01012b03          	lw	s6,16(sp)
    b65c:	03010113          	add	sp,sp,48
    b660:	00008067          	ret
    b664:	000107b7          	lui	a5,0x10
    b668:	26f6ee63          	bltu	a3,a5,b8e4 <__udivdi3+0x424>
    b66c:	01000737          	lui	a4,0x1000
    b670:	01800793          	li	a5,24
    b674:	00e6f463          	bgeu	a3,a4,b67c <__udivdi3+0x1bc>
    b678:	01000793          	li	a5,16
    b67c:	00f6d533          	srl	a0,a3,a5
    b680:	00004717          	auipc	a4,0x4
    b684:	2f070713          	add	a4,a4,752 # f970 <__clz_tab>
    b688:	00a70733          	add	a4,a4,a0
    b68c:	00074703          	lbu	a4,0(a4)
    b690:	02000513          	li	a0,32
    b694:	00f70733          	add	a4,a4,a5
    b698:	40e50b33          	sub	s6,a0,a4
    b69c:	26e51c63          	bne	a0,a4,b914 <__udivdi3+0x454>
    b6a0:	46b6ee63          	bltu	a3,a1,bb1c <__udivdi3+0x65c>
    b6a4:	00c9b533          	sltu	a0,s3,a2
    b6a8:	00153513          	seqz	a0,a0
    b6ac:	00000b13          	li	s6,0
    b6b0:	f9dff06f          	j	b64c <__udivdi3+0x18c>
    b6b4:	10060c63          	beqz	a2,b7cc <__udivdi3+0x30c>
    b6b8:	000107b7          	lui	a5,0x10
    b6bc:	44f67663          	bgeu	a2,a5,bb08 <__udivdi3+0x648>
    b6c0:	10063713          	sltiu	a4,a2,256
    b6c4:	00173713          	seqz	a4,a4
    b6c8:	00371713          	sll	a4,a4,0x3
    b6cc:	00e656b3          	srl	a3,a2,a4
    b6d0:	00004797          	auipc	a5,0x4
    b6d4:	2a078793          	add	a5,a5,672 # f970 <__clz_tab>
    b6d8:	00d787b3          	add	a5,a5,a3
    b6dc:	0007c483          	lbu	s1,0(a5)
    b6e0:	02000793          	li	a5,32
    b6e4:	00e484b3          	add	s1,s1,a4
    b6e8:	40978733          	sub	a4,a5,s1
    b6ec:	10979463          	bne	a5,s1,b7f4 <__udivdi3+0x334>
    b6f0:	01061a13          	sll	s4,a2,0x10
    b6f4:	40c584b3          	sub	s1,a1,a2
    b6f8:	01065913          	srl	s2,a2,0x10
    b6fc:	010a5a13          	srl	s4,s4,0x10
    b700:	00100b13          	li	s6,1
    b704:	00090593          	mv	a1,s2
    b708:	00048513          	mv	a0,s1
    b70c:	64c030ef          	jal	ed58 <__hidden___udivsi3>
    b710:	000a0593          	mv	a1,s4
    b714:	00050993          	mv	s3,a0
    b718:	57c030ef          	jal	ec94 <__mulsi3>
    b71c:	00050793          	mv	a5,a0
    b720:	00090593          	mv	a1,s2
    b724:	00048513          	mv	a0,s1
    b728:	00078493          	mv	s1,a5
    b72c:	674030ef          	jal	eda0 <__umodsi3>
    b730:	01051513          	sll	a0,a0,0x10
    b734:	01045793          	srl	a5,s0,0x10
    b738:	00a7e7b3          	or	a5,a5,a0
    b73c:	0097fc63          	bgeu	a5,s1,b754 <__udivdi3+0x294>
    b740:	00fa87b3          	add	a5,s5,a5
    b744:	fff98713          	add	a4,s3,-1
    b748:	0157e463          	bltu	a5,s5,b750 <__udivdi3+0x290>
    b74c:	3e97ee63          	bltu	a5,s1,bb48 <__udivdi3+0x688>
    b750:	00070993          	mv	s3,a4
    b754:	409784b3          	sub	s1,a5,s1
    b758:	00090593          	mv	a1,s2
    b75c:	00048513          	mv	a0,s1
    b760:	5f8030ef          	jal	ed58 <__hidden___udivsi3>
    b764:	000a0593          	mv	a1,s4
    b768:	00050a13          	mv	s4,a0
    b76c:	528030ef          	jal	ec94 <__mulsi3>
    b770:	00050793          	mv	a5,a0
    b774:	00090593          	mv	a1,s2
    b778:	00048513          	mv	a0,s1
    b77c:	01041413          	sll	s0,s0,0x10
    b780:	00078493          	mv	s1,a5
    b784:	61c030ef          	jal	eda0 <__umodsi3>
    b788:	01051513          	sll	a0,a0,0x10
    b78c:	01045413          	srl	s0,s0,0x10
    b790:	00a46433          	or	s0,s0,a0
    b794:	00947e63          	bgeu	s0,s1,b7b0 <__udivdi3+0x2f0>
    b798:	008a8433          	add	s0,s5,s0
    b79c:	fffa0793          	add	a5,s4,-1
    b7a0:	01546663          	bltu	s0,s5,b7ac <__udivdi3+0x2ec>
    b7a4:	ffea0a13          	add	s4,s4,-2
    b7a8:	00946463          	bltu	s0,s1,b7b0 <__udivdi3+0x2f0>
    b7ac:	00078a13          	mv	s4,a5
    b7b0:	01099613          	sll	a2,s3,0x10
    b7b4:	01466533          	or	a0,a2,s4
    b7b8:	e5dff06f          	j	b614 <__udivdi3+0x154>
    b7bc:	10063713          	sltiu	a4,a2,256
    b7c0:	00173713          	seqz	a4,a4
    b7c4:	00371713          	sll	a4,a4,0x3
    b7c8:	d4dff06f          	j	b514 <__udivdi3+0x54>
    b7cc:	00000693          	li	a3,0
    b7d0:	00004797          	auipc	a5,0x4
    b7d4:	1a078793          	add	a5,a5,416 # f970 <__clz_tab>
    b7d8:	00d787b3          	add	a5,a5,a3
    b7dc:	0007c483          	lbu	s1,0(a5)
    b7e0:	00000713          	li	a4,0
    b7e4:	02000793          	li	a5,32
    b7e8:	00e484b3          	add	s1,s1,a4
    b7ec:	40978733          	sub	a4,a5,s1
    b7f0:	f09780e3          	beq	a5,s1,b6f0 <__udivdi3+0x230>
    b7f4:	00e61ab3          	sll	s5,a2,a4
    b7f8:	01712623          	sw	s7,12(sp)
    b7fc:	010ad913          	srl	s2,s5,0x10
    b800:	0095dbb3          	srl	s7,a1,s1
    b804:	00e597b3          	sll	a5,a1,a4
    b808:	0099d4b3          	srl	s1,s3,s1
    b80c:	00090593          	mv	a1,s2
    b810:	000b8513          	mv	a0,s7
    b814:	010a9a13          	sll	s4,s5,0x10
    b818:	00f4e4b3          	or	s1,s1,a5
    b81c:	00e99433          	sll	s0,s3,a4
    b820:	010a5a13          	srl	s4,s4,0x10
    b824:	534030ef          	jal	ed58 <__hidden___udivsi3>
    b828:	00050593          	mv	a1,a0
    b82c:	00050b13          	mv	s6,a0
    b830:	000a0513          	mv	a0,s4
    b834:	460030ef          	jal	ec94 <__mulsi3>
    b838:	00050993          	mv	s3,a0
    b83c:	00090593          	mv	a1,s2
    b840:	000b8513          	mv	a0,s7
    b844:	55c030ef          	jal	eda0 <__umodsi3>
    b848:	01051513          	sll	a0,a0,0x10
    b84c:	0104d793          	srl	a5,s1,0x10
    b850:	00a7e7b3          	or	a5,a5,a0
    b854:	0137fe63          	bgeu	a5,s3,b870 <__udivdi3+0x3b0>
    b858:	00fa87b3          	add	a5,s5,a5
    b85c:	fffb0713          	add	a4,s6,-1
    b860:	2d57ec63          	bltu	a5,s5,bb38 <__udivdi3+0x678>
    b864:	2d37fa63          	bgeu	a5,s3,bb38 <__udivdi3+0x678>
    b868:	ffeb0b13          	add	s6,s6,-2
    b86c:	015787b3          	add	a5,a5,s5
    b870:	413789b3          	sub	s3,a5,s3
    b874:	00090593          	mv	a1,s2
    b878:	00098513          	mv	a0,s3
    b87c:	4dc030ef          	jal	ed58 <__hidden___udivsi3>
    b880:	00050593          	mv	a1,a0
    b884:	00050b93          	mv	s7,a0
    b888:	000a0513          	mv	a0,s4
    b88c:	408030ef          	jal	ec94 <__mulsi3>
    b890:	00050793          	mv	a5,a0
    b894:	00090593          	mv	a1,s2
    b898:	00098513          	mv	a0,s3
    b89c:	01049493          	sll	s1,s1,0x10
    b8a0:	00078993          	mv	s3,a5
    b8a4:	4fc030ef          	jal	eda0 <__umodsi3>
    b8a8:	01051513          	sll	a0,a0,0x10
    b8ac:	0104d493          	srl	s1,s1,0x10
    b8b0:	00a4e4b3          	or	s1,s1,a0
    b8b4:	0134fe63          	bgeu	s1,s3,b8d0 <__udivdi3+0x410>
    b8b8:	009a84b3          	add	s1,s5,s1
    b8bc:	fffb8793          	add	a5,s7,-1
    b8c0:	2754e463          	bltu	s1,s5,bb28 <__udivdi3+0x668>
    b8c4:	2734f263          	bgeu	s1,s3,bb28 <__udivdi3+0x668>
    b8c8:	ffeb8b93          	add	s7,s7,-2
    b8cc:	015484b3          	add	s1,s1,s5
    b8d0:	010b1b13          	sll	s6,s6,0x10
    b8d4:	017b6b33          	or	s6,s6,s7
    b8d8:	413484b3          	sub	s1,s1,s3
    b8dc:	00c12b83          	lw	s7,12(sp)
    b8e0:	e25ff06f          	j	b704 <__udivdi3+0x244>
    b8e4:	1006b793          	sltiu	a5,a3,256
    b8e8:	0017b793          	seqz	a5,a5
    b8ec:	00379793          	sll	a5,a5,0x3
    b8f0:	00f6d533          	srl	a0,a3,a5
    b8f4:	00004717          	auipc	a4,0x4
    b8f8:	07c70713          	add	a4,a4,124 # f970 <__clz_tab>
    b8fc:	00a70733          	add	a4,a4,a0
    b900:	00074703          	lbu	a4,0(a4)
    b904:	02000513          	li	a0,32
    b908:	00f70733          	add	a4,a4,a5
    b90c:	40e50b33          	sub	s6,a0,a4
    b910:	d8e508e3          	beq	a0,a4,b6a0 <__udivdi3+0x1e0>
    b914:	016696b3          	sll	a3,a3,s6
    b918:	01912223          	sw	s9,4(sp)
    b91c:	00e65cb3          	srl	s9,a2,a4
    b920:	00dcecb3          	or	s9,s9,a3
    b924:	01512a23          	sw	s5,20(sp)
    b928:	01712623          	sw	s7,12(sp)
    b92c:	010cda93          	srl	s5,s9,0x10
    b930:	00e5dbb3          	srl	s7,a1,a4
    b934:	016597b3          	sll	a5,a1,s6
    b938:	00e9d733          	srl	a4,s3,a4
    b93c:	01812423          	sw	s8,8(sp)
    b940:	000a8593          	mv	a1,s5
    b944:	000b8513          	mv	a0,s7
    b948:	010c9c13          	sll	s8,s9,0x10
    b94c:	02812423          	sw	s0,40(sp)
    b950:	02912223          	sw	s1,36(sp)
    b954:	03212023          	sw	s2,32(sp)
    b958:	00f764b3          	or	s1,a4,a5
    b95c:	01661933          	sll	s2,a2,s6
    b960:	01412c23          	sw	s4,24(sp)
    b964:	010c5c13          	srl	s8,s8,0x10
    b968:	3f0030ef          	jal	ed58 <__hidden___udivsi3>
    b96c:	00050593          	mv	a1,a0
    b970:	00050413          	mv	s0,a0
    b974:	000c0513          	mv	a0,s8
    b978:	31c030ef          	jal	ec94 <__mulsi3>
    b97c:	00050a13          	mv	s4,a0
    b980:	000a8593          	mv	a1,s5
    b984:	000b8513          	mv	a0,s7
    b988:	418030ef          	jal	eda0 <__umodsi3>
    b98c:	01051513          	sll	a0,a0,0x10
    b990:	0104d793          	srl	a5,s1,0x10
    b994:	00a7e7b3          	or	a5,a5,a0
    b998:	0147fe63          	bgeu	a5,s4,b9b4 <__udivdi3+0x4f4>
    b99c:	00fc87b3          	add	a5,s9,a5
    b9a0:	fff40713          	add	a4,s0,-1
    b9a4:	1997ee63          	bltu	a5,s9,bb40 <__udivdi3+0x680>
    b9a8:	1947fc63          	bgeu	a5,s4,bb40 <__udivdi3+0x680>
    b9ac:	ffe40413          	add	s0,s0,-2
    b9b0:	019787b3          	add	a5,a5,s9
    b9b4:	41478a33          	sub	s4,a5,s4
    b9b8:	000a8593          	mv	a1,s5
    b9bc:	000a0513          	mv	a0,s4
    b9c0:	398030ef          	jal	ed58 <__hidden___udivsi3>
    b9c4:	00050593          	mv	a1,a0
    b9c8:	00050b93          	mv	s7,a0
    b9cc:	000c0513          	mv	a0,s8
    b9d0:	2c4030ef          	jal	ec94 <__mulsi3>
    b9d4:	00050793          	mv	a5,a0
    b9d8:	000a8593          	mv	a1,s5
    b9dc:	000a0513          	mv	a0,s4
    b9e0:	00078a13          	mv	s4,a5
    b9e4:	3bc030ef          	jal	eda0 <__umodsi3>
    b9e8:	01049713          	sll	a4,s1,0x10
    b9ec:	01051513          	sll	a0,a0,0x10
    b9f0:	01075713          	srl	a4,a4,0x10
    b9f4:	00a76733          	or	a4,a4,a0
    b9f8:	01477e63          	bgeu	a4,s4,ba14 <__udivdi3+0x554>
    b9fc:	00ec8733          	add	a4,s9,a4
    ba00:	fffb8793          	add	a5,s7,-1
    ba04:	13976663          	bltu	a4,s9,bb30 <__udivdi3+0x670>
    ba08:	13477463          	bgeu	a4,s4,bb30 <__udivdi3+0x670>
    ba0c:	ffeb8b93          	add	s7,s7,-2
    ba10:	01970733          	add	a4,a4,s9
    ba14:	00010e37          	lui	t3,0x10
    ba18:	01041413          	sll	s0,s0,0x10
    ba1c:	01746433          	or	s0,s0,s7
    ba20:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    ba24:	00f47833          	and	a6,s0,a5
    ba28:	00f977b3          	and	a5,s2,a5
    ba2c:	41470733          	sub	a4,a4,s4
    ba30:	01045e93          	srl	t4,s0,0x10
    ba34:	01095913          	srl	s2,s2,0x10
    ba38:	00080513          	mv	a0,a6
    ba3c:	00078593          	mv	a1,a5
    ba40:	254030ef          	jal	ec94 <__mulsi3>
    ba44:	00050313          	mv	t1,a0
    ba48:	00090593          	mv	a1,s2
    ba4c:	00080513          	mv	a0,a6
    ba50:	244030ef          	jal	ec94 <__mulsi3>
    ba54:	00050813          	mv	a6,a0
    ba58:	00078593          	mv	a1,a5
    ba5c:	000e8513          	mv	a0,t4
    ba60:	234030ef          	jal	ec94 <__mulsi3>
    ba64:	00050893          	mv	a7,a0
    ba68:	00090593          	mv	a1,s2
    ba6c:	000e8513          	mv	a0,t4
    ba70:	224030ef          	jal	ec94 <__mulsi3>
    ba74:	01035793          	srl	a5,t1,0x10
    ba78:	01180833          	add	a6,a6,a7
    ba7c:	010787b3          	add	a5,a5,a6
    ba80:	0117f463          	bgeu	a5,a7,ba88 <__udivdi3+0x5c8>
    ba84:	01c50533          	add	a0,a0,t3
    ba88:	0107d693          	srl	a3,a5,0x10
    ba8c:	00a686b3          	add	a3,a3,a0
    ba90:	06d76863          	bltu	a4,a3,bb00 <__udivdi3+0x640>
    ba94:	04d70663          	beq	a4,a3,bae0 <__udivdi3+0x620>
    ba98:	00040513          	mv	a0,s0
    ba9c:	02812403          	lw	s0,40(sp)
    baa0:	02c12083          	lw	ra,44(sp)
    baa4:	00000b13          	li	s6,0
    baa8:	02412483          	lw	s1,36(sp)
    baac:	02012903          	lw	s2,32(sp)
    bab0:	01812a03          	lw	s4,24(sp)
    bab4:	01412a83          	lw	s5,20(sp)
    bab8:	00c12b83          	lw	s7,12(sp)
    babc:	00812c03          	lw	s8,8(sp)
    bac0:	00412c83          	lw	s9,4(sp)
    bac4:	01c12983          	lw	s3,28(sp)
    bac8:	000b0593          	mv	a1,s6
    bacc:	01012b03          	lw	s6,16(sp)
    bad0:	03010113          	add	sp,sp,48
    bad4:	00008067          	ret
    bad8:	00078993          	mv	s3,a5
    badc:	b2dff06f          	j	b608 <__udivdi3+0x148>
    bae0:	00010737          	lui	a4,0x10
    bae4:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    bae8:	00e7f7b3          	and	a5,a5,a4
    baec:	01079793          	sll	a5,a5,0x10
    baf0:	00e37333          	and	t1,t1,a4
    baf4:	01699533          	sll	a0,s3,s6
    baf8:	006787b3          	add	a5,a5,t1
    bafc:	f8f57ee3          	bgeu	a0,a5,ba98 <__udivdi3+0x5d8>
    bb00:	fff40513          	add	a0,s0,-1
    bb04:	f99ff06f          	j	ba9c <__udivdi3+0x5dc>
    bb08:	010007b7          	lui	a5,0x1000
    bb0c:	04f67a63          	bgeu	a2,a5,bb60 <__udivdi3+0x6a0>
    bb10:	01065693          	srl	a3,a2,0x10
    bb14:	01000713          	li	a4,16
    bb18:	bb9ff06f          	j	b6d0 <__udivdi3+0x210>
    bb1c:	00000b13          	li	s6,0
    bb20:	00100513          	li	a0,1
    bb24:	b29ff06f          	j	b64c <__udivdi3+0x18c>
    bb28:	00078b93          	mv	s7,a5
    bb2c:	da5ff06f          	j	b8d0 <__udivdi3+0x410>
    bb30:	00078b93          	mv	s7,a5
    bb34:	ee1ff06f          	j	ba14 <__udivdi3+0x554>
    bb38:	00070b13          	mv	s6,a4
    bb3c:	d35ff06f          	j	b870 <__udivdi3+0x3b0>
    bb40:	00070413          	mv	s0,a4
    bb44:	e71ff06f          	j	b9b4 <__udivdi3+0x4f4>
    bb48:	ffe98993          	add	s3,s3,-2
    bb4c:	015787b3          	add	a5,a5,s5
    bb50:	c05ff06f          	j	b754 <__udivdi3+0x294>
    bb54:	ffe90913          	add	s2,s2,-2
    bb58:	015787b3          	add	a5,a5,s5
    bb5c:	a51ff06f          	j	b5ac <__udivdi3+0xec>
    bb60:	01865693          	srl	a3,a2,0x18
    bb64:	01800713          	li	a4,24
    bb68:	b69ff06f          	j	b6d0 <__udivdi3+0x210>

0000bb6c <__umoddi3>:
    bb6c:	fd010113          	add	sp,sp,-48
    bb70:	02112623          	sw	ra,44(sp)
    bb74:	00050793          	mv	a5,a0
    bb78:	14069663          	bnez	a3,bcc4 <__umoddi3+0x158>
    bb7c:	03212023          	sw	s2,32(sp)
    bb80:	01412c23          	sw	s4,24(sp)
    bb84:	02812423          	sw	s0,40(sp)
    bb88:	02912223          	sw	s1,36(sp)
    bb8c:	01312e23          	sw	s3,28(sp)
    bb90:	01512a23          	sw	s5,20(sp)
    bb94:	00060a13          	mv	s4,a2
    bb98:	00050913          	mv	s2,a0
    bb9c:	1ac5f663          	bgeu	a1,a2,bd48 <__umoddi3+0x1dc>
    bba0:	01612823          	sw	s6,16(sp)
    bba4:	00010737          	lui	a4,0x10
    bba8:	00058993          	mv	s3,a1
    bbac:	28e66063          	bltu	a2,a4,be2c <__umoddi3+0x2c0>
    bbb0:	01000737          	lui	a4,0x1000
    bbb4:	01800693          	li	a3,24
    bbb8:	00e67463          	bgeu	a2,a4,bbc0 <__umoddi3+0x54>
    bbbc:	01000693          	li	a3,16
    bbc0:	00d65533          	srl	a0,a2,a3
    bbc4:	00004717          	auipc	a4,0x4
    bbc8:	dac70713          	add	a4,a4,-596 # f970 <__clz_tab>
    bbcc:	00a70733          	add	a4,a4,a0
    bbd0:	00074703          	lbu	a4,0(a4)
    bbd4:	02000513          	li	a0,32
    bbd8:	00d70733          	add	a4,a4,a3
    bbdc:	40e504b3          	sub	s1,a0,a4
    bbe0:	00e50c63          	beq	a0,a4,bbf8 <__umoddi3+0x8c>
    bbe4:	009599b3          	sll	s3,a1,s1
    bbe8:	00e7d733          	srl	a4,a5,a4
    bbec:	00961a33          	sll	s4,a2,s1
    bbf0:	013769b3          	or	s3,a4,s3
    bbf4:	00979933          	sll	s2,a5,s1
    bbf8:	010a5a93          	srl	s5,s4,0x10
    bbfc:	000a8593          	mv	a1,s5
    bc00:	00098513          	mv	a0,s3
    bc04:	010a1b13          	sll	s6,s4,0x10
    bc08:	150030ef          	jal	ed58 <__hidden___udivsi3>
    bc0c:	010b5b13          	srl	s6,s6,0x10
    bc10:	000b0593          	mv	a1,s6
    bc14:	080030ef          	jal	ec94 <__mulsi3>
    bc18:	00050413          	mv	s0,a0
    bc1c:	000a8593          	mv	a1,s5
    bc20:	00098513          	mv	a0,s3
    bc24:	17c030ef          	jal	eda0 <__umodsi3>
    bc28:	01051513          	sll	a0,a0,0x10
    bc2c:	01095793          	srl	a5,s2,0x10
    bc30:	00a7e7b3          	or	a5,a5,a0
    bc34:	0087f863          	bgeu	a5,s0,bc44 <__umoddi3+0xd8>
    bc38:	00fa07b3          	add	a5,s4,a5
    bc3c:	0147e463          	bltu	a5,s4,bc44 <__umoddi3+0xd8>
    bc40:	5687e863          	bltu	a5,s0,c1b0 <__umoddi3+0x644>
    bc44:	40878433          	sub	s0,a5,s0
    bc48:	000a8593          	mv	a1,s5
    bc4c:	00040513          	mv	a0,s0
    bc50:	108030ef          	jal	ed58 <__hidden___udivsi3>
    bc54:	000b0593          	mv	a1,s6
    bc58:	03c030ef          	jal	ec94 <__mulsi3>
    bc5c:	00050793          	mv	a5,a0
    bc60:	000a8593          	mv	a1,s5
    bc64:	00040513          	mv	a0,s0
    bc68:	00078413          	mv	s0,a5
    bc6c:	134030ef          	jal	eda0 <__umodsi3>
    bc70:	01091793          	sll	a5,s2,0x10
    bc74:	01051513          	sll	a0,a0,0x10
    bc78:	0107d793          	srl	a5,a5,0x10
    bc7c:	00a7e7b3          	or	a5,a5,a0
    bc80:	0087f863          	bgeu	a5,s0,bc90 <__umoddi3+0x124>
    bc84:	00fa07b3          	add	a5,s4,a5
    bc88:	0147e463          	bltu	a5,s4,bc90 <__umoddi3+0x124>
    bc8c:	5087ea63          	bltu	a5,s0,c1a0 <__umoddi3+0x634>
    bc90:	01012b03          	lw	s6,16(sp)
    bc94:	408787b3          	sub	a5,a5,s0
    bc98:	0097d533          	srl	a0,a5,s1
    bc9c:	02812403          	lw	s0,40(sp)
    bca0:	02412483          	lw	s1,36(sp)
    bca4:	02012903          	lw	s2,32(sp)
    bca8:	01c12983          	lw	s3,28(sp)
    bcac:	01812a03          	lw	s4,24(sp)
    bcb0:	01412a83          	lw	s5,20(sp)
    bcb4:	00000593          	li	a1,0
    bcb8:	02c12083          	lw	ra,44(sp)
    bcbc:	03010113          	add	sp,sp,48
    bcc0:	00008067          	ret
    bcc4:	00050893          	mv	a7,a0
    bcc8:	fed5e8e3          	bltu	a1,a3,bcb8 <__umoddi3+0x14c>
    bccc:	03212023          	sw	s2,32(sp)
    bcd0:	01312e23          	sw	s3,28(sp)
    bcd4:	00010737          	lui	a4,0x10
    bcd8:	00058813          	mv	a6,a1
    bcdc:	24e6ec63          	bltu	a3,a4,bf34 <__umoddi3+0x3c8>
    bce0:	01000737          	lui	a4,0x1000
    bce4:	01800513          	li	a0,24
    bce8:	00e6f463          	bgeu	a3,a4,bcf0 <__umoddi3+0x184>
    bcec:	01000513          	li	a0,16
    bcf0:	00a6d333          	srl	t1,a3,a0
    bcf4:	00004717          	auipc	a4,0x4
    bcf8:	c7c70713          	add	a4,a4,-900 # f970 <__clz_tab>
    bcfc:	00670733          	add	a4,a4,t1
    bd00:	00074703          	lbu	a4,0(a4)
    bd04:	02000313          	li	t1,32
    bd08:	00a709b3          	add	s3,a4,a0
    bd0c:	41330933          	sub	s2,t1,s3
    bd10:	25331a63          	bne	t1,s3,bf64 <__umoddi3+0x3f8>
    bd14:	00b6e463          	bltu	a3,a1,bd1c <__umoddi3+0x1b0>
    bd18:	00c7ea63          	bltu	a5,a2,bd2c <__umoddi3+0x1c0>
    bd1c:	40c788b3          	sub	a7,a5,a2
    bd20:	40d586b3          	sub	a3,a1,a3
    bd24:	0117b833          	sltu	a6,a5,a7
    bd28:	41068833          	sub	a6,a3,a6
    bd2c:	02c12083          	lw	ra,44(sp)
    bd30:	02012903          	lw	s2,32(sp)
    bd34:	01c12983          	lw	s3,28(sp)
    bd38:	00088513          	mv	a0,a7
    bd3c:	00080593          	mv	a1,a6
    bd40:	03010113          	add	sp,sp,48
    bd44:	00008067          	ret
    bd48:	0e060a63          	beqz	a2,be3c <__umoddi3+0x2d0>
    bd4c:	00010737          	lui	a4,0x10
    bd50:	42e67663          	bgeu	a2,a4,c17c <__umoddi3+0x610>
    bd54:	10063693          	sltiu	a3,a2,256
    bd58:	0016b693          	seqz	a3,a3
    bd5c:	00369693          	sll	a3,a3,0x3
    bd60:	00d65533          	srl	a0,a2,a3
    bd64:	00004717          	auipc	a4,0x4
    bd68:	c0c70713          	add	a4,a4,-1012 # f970 <__clz_tab>
    bd6c:	00a70733          	add	a4,a4,a0
    bd70:	00074983          	lbu	s3,0(a4)
    bd74:	02000713          	li	a4,32
    bd78:	00d989b3          	add	s3,s3,a3
    bd7c:	413704b3          	sub	s1,a4,s3
    bd80:	0f371263          	bne	a4,s3,be64 <__umoddi3+0x2f8>
    bd84:	01061413          	sll	s0,a2,0x10
    bd88:	40c589b3          	sub	s3,a1,a2
    bd8c:	01065a93          	srl	s5,a2,0x10
    bd90:	01045413          	srl	s0,s0,0x10
    bd94:	000a8593          	mv	a1,s5
    bd98:	00098513          	mv	a0,s3
    bd9c:	7bd020ef          	jal	ed58 <__hidden___udivsi3>
    bda0:	00040593          	mv	a1,s0
    bda4:	6f1020ef          	jal	ec94 <__mulsi3>
    bda8:	00050793          	mv	a5,a0
    bdac:	000a8593          	mv	a1,s5
    bdb0:	00098513          	mv	a0,s3
    bdb4:	00078993          	mv	s3,a5
    bdb8:	7e9020ef          	jal	eda0 <__umodsi3>
    bdbc:	01051513          	sll	a0,a0,0x10
    bdc0:	01095793          	srl	a5,s2,0x10
    bdc4:	00a7e7b3          	or	a5,a5,a0
    bdc8:	0137f863          	bgeu	a5,s3,bdd8 <__umoddi3+0x26c>
    bdcc:	00fa07b3          	add	a5,s4,a5
    bdd0:	0147e463          	bltu	a5,s4,bdd8 <__umoddi3+0x26c>
    bdd4:	3d37ea63          	bltu	a5,s3,c1a8 <__umoddi3+0x63c>
    bdd8:	413789b3          	sub	s3,a5,s3
    bddc:	000a8593          	mv	a1,s5
    bde0:	00098513          	mv	a0,s3
    bde4:	775020ef          	jal	ed58 <__hidden___udivsi3>
    bde8:	00040593          	mv	a1,s0
    bdec:	6a9020ef          	jal	ec94 <__mulsi3>
    bdf0:	00050413          	mv	s0,a0
    bdf4:	000a8593          	mv	a1,s5
    bdf8:	00098513          	mv	a0,s3
    bdfc:	7a5020ef          	jal	eda0 <__umodsi3>
    be00:	01091913          	sll	s2,s2,0x10
    be04:	01051793          	sll	a5,a0,0x10
    be08:	01095913          	srl	s2,s2,0x10
    be0c:	00f967b3          	or	a5,s2,a5
    be10:	0087fa63          	bgeu	a5,s0,be24 <__umoddi3+0x2b8>
    be14:	00fa07b3          	add	a5,s4,a5
    be18:	0147e663          	bltu	a5,s4,be24 <__umoddi3+0x2b8>
    be1c:	0087f463          	bgeu	a5,s0,be24 <__umoddi3+0x2b8>
    be20:	014787b3          	add	a5,a5,s4
    be24:	408787b3          	sub	a5,a5,s0
    be28:	e71ff06f          	j	bc98 <__umoddi3+0x12c>
    be2c:	10063693          	sltiu	a3,a2,256
    be30:	0016b693          	seqz	a3,a3
    be34:	00369693          	sll	a3,a3,0x3
    be38:	d89ff06f          	j	bbc0 <__umoddi3+0x54>
    be3c:	00000513          	li	a0,0
    be40:	00004717          	auipc	a4,0x4
    be44:	b3070713          	add	a4,a4,-1232 # f970 <__clz_tab>
    be48:	00a70733          	add	a4,a4,a0
    be4c:	00074983          	lbu	s3,0(a4)
    be50:	00000693          	li	a3,0
    be54:	02000713          	li	a4,32
    be58:	00d989b3          	add	s3,s3,a3
    be5c:	413704b3          	sub	s1,a4,s3
    be60:	f33702e3          	beq	a4,s3,bd84 <__umoddi3+0x218>
    be64:	00961a33          	sll	s4,a2,s1
    be68:	01712623          	sw	s7,12(sp)
    be6c:	010a5a93          	srl	s5,s4,0x10
    be70:	0135dbb3          	srl	s7,a1,s3
    be74:	00959733          	sll	a4,a1,s1
    be78:	0137d9b3          	srl	s3,a5,s3
    be7c:	000a8593          	mv	a1,s5
    be80:	000b8513          	mv	a0,s7
    be84:	010a1413          	sll	s0,s4,0x10
    be88:	00e9e9b3          	or	s3,s3,a4
    be8c:	00979933          	sll	s2,a5,s1
    be90:	01612823          	sw	s6,16(sp)
    be94:	01045413          	srl	s0,s0,0x10
    be98:	6c1020ef          	jal	ed58 <__hidden___udivsi3>
    be9c:	00040593          	mv	a1,s0
    bea0:	5f5020ef          	jal	ec94 <__mulsi3>
    bea4:	00050b13          	mv	s6,a0
    bea8:	000a8593          	mv	a1,s5
    beac:	000b8513          	mv	a0,s7
    beb0:	6f1020ef          	jal	eda0 <__umodsi3>
    beb4:	01051513          	sll	a0,a0,0x10
    beb8:	0109d793          	srl	a5,s3,0x10
    bebc:	00a7e7b3          	or	a5,a5,a0
    bec0:	0167fa63          	bgeu	a5,s6,bed4 <__umoddi3+0x368>
    bec4:	00fa07b3          	add	a5,s4,a5
    bec8:	0147e663          	bltu	a5,s4,bed4 <__umoddi3+0x368>
    becc:	0167f463          	bgeu	a5,s6,bed4 <__umoddi3+0x368>
    bed0:	014787b3          	add	a5,a5,s4
    bed4:	41678b33          	sub	s6,a5,s6
    bed8:	000a8593          	mv	a1,s5
    bedc:	000b0513          	mv	a0,s6
    bee0:	679020ef          	jal	ed58 <__hidden___udivsi3>
    bee4:	00040593          	mv	a1,s0
    bee8:	5ad020ef          	jal	ec94 <__mulsi3>
    beec:	00050793          	mv	a5,a0
    bef0:	000a8593          	mv	a1,s5
    bef4:	000b0513          	mv	a0,s6
    bef8:	01099993          	sll	s3,s3,0x10
    befc:	00078b13          	mv	s6,a5
    bf00:	6a1020ef          	jal	eda0 <__umodsi3>
    bf04:	01051513          	sll	a0,a0,0x10
    bf08:	0109d993          	srl	s3,s3,0x10
    bf0c:	00a9e9b3          	or	s3,s3,a0
    bf10:	0169fa63          	bgeu	s3,s6,bf24 <__umoddi3+0x3b8>
    bf14:	013a09b3          	add	s3,s4,s3
    bf18:	0149e663          	bltu	s3,s4,bf24 <__umoddi3+0x3b8>
    bf1c:	0169f463          	bgeu	s3,s6,bf24 <__umoddi3+0x3b8>
    bf20:	014989b3          	add	s3,s3,s4
    bf24:	416989b3          	sub	s3,s3,s6
    bf28:	00c12b83          	lw	s7,12(sp)
    bf2c:	01012b03          	lw	s6,16(sp)
    bf30:	e65ff06f          	j	bd94 <__umoddi3+0x228>
    bf34:	1006b513          	sltiu	a0,a3,256
    bf38:	00153513          	seqz	a0,a0
    bf3c:	00351513          	sll	a0,a0,0x3
    bf40:	00a6d333          	srl	t1,a3,a0
    bf44:	00004717          	auipc	a4,0x4
    bf48:	a2c70713          	add	a4,a4,-1492 # f970 <__clz_tab>
    bf4c:	00670733          	add	a4,a4,t1
    bf50:	00074703          	lbu	a4,0(a4)
    bf54:	02000313          	li	t1,32
    bf58:	00a709b3          	add	s3,a4,a0
    bf5c:	41330933          	sub	s2,t1,s3
    bf60:	db330ae3          	beq	t1,s3,bd14 <__umoddi3+0x1a8>
    bf64:	01512a23          	sw	s5,20(sp)
    bf68:	012696b3          	sll	a3,a3,s2
    bf6c:	01365ab3          	srl	s5,a2,s3
    bf70:	00daeab3          	or	s5,s5,a3
    bf74:	01712623          	sw	s7,12(sp)
    bf78:	01a12023          	sw	s10,0(sp)
    bf7c:	010adb93          	srl	s7,s5,0x10
    bf80:	0135dd33          	srl	s10,a1,s3
    bf84:	01259733          	sll	a4,a1,s2
    bf88:	0137d6b3          	srl	a3,a5,s3
    bf8c:	01912223          	sw	s9,4(sp)
    bf90:	000b8593          	mv	a1,s7
    bf94:	000d0513          	mv	a0,s10
    bf98:	010a9c93          	sll	s9,s5,0x10
    bf9c:	02812423          	sw	s0,40(sp)
    bfa0:	02912223          	sw	s1,36(sp)
    bfa4:	01261433          	sll	s0,a2,s2
    bfa8:	012794b3          	sll	s1,a5,s2
    bfac:	01412c23          	sw	s4,24(sp)
    bfb0:	01612823          	sw	s6,16(sp)
    bfb4:	00e6ea33          	or	s4,a3,a4
    bfb8:	01812423          	sw	s8,8(sp)
    bfbc:	010cdc93          	srl	s9,s9,0x10
    bfc0:	599020ef          	jal	ed58 <__hidden___udivsi3>
    bfc4:	00050593          	mv	a1,a0
    bfc8:	00050b13          	mv	s6,a0
    bfcc:	000c8513          	mv	a0,s9
    bfd0:	4c5020ef          	jal	ec94 <__mulsi3>
    bfd4:	00050c13          	mv	s8,a0
    bfd8:	000b8593          	mv	a1,s7
    bfdc:	000d0513          	mv	a0,s10
    bfe0:	5c1020ef          	jal	eda0 <__umodsi3>
    bfe4:	01051513          	sll	a0,a0,0x10
    bfe8:	010a5793          	srl	a5,s4,0x10
    bfec:	00a7e7b3          	or	a5,a5,a0
    bff0:	0187fe63          	bgeu	a5,s8,c00c <__umoddi3+0x4a0>
    bff4:	00fa87b3          	add	a5,s5,a5
    bff8:	fffb0713          	add	a4,s6,-1
    bffc:	1957ee63          	bltu	a5,s5,c198 <__umoddi3+0x62c>
    c000:	1987fc63          	bgeu	a5,s8,c198 <__umoddi3+0x62c>
    c004:	ffeb0b13          	add	s6,s6,-2
    c008:	015787b3          	add	a5,a5,s5
    c00c:	41878c33          	sub	s8,a5,s8
    c010:	000b8593          	mv	a1,s7
    c014:	000c0513          	mv	a0,s8
    c018:	541020ef          	jal	ed58 <__hidden___udivsi3>
    c01c:	00050593          	mv	a1,a0
    c020:	00050d13          	mv	s10,a0
    c024:	000c8513          	mv	a0,s9
    c028:	46d020ef          	jal	ec94 <__mulsi3>
    c02c:	00050793          	mv	a5,a0
    c030:	000b8593          	mv	a1,s7
    c034:	000c0513          	mv	a0,s8
    c038:	00078b93          	mv	s7,a5
    c03c:	565020ef          	jal	eda0 <__umodsi3>
    c040:	010a1593          	sll	a1,s4,0x10
    c044:	01051513          	sll	a0,a0,0x10
    c048:	0105d593          	srl	a1,a1,0x10
    c04c:	00a5e5b3          	or	a1,a1,a0
    c050:	0175fe63          	bgeu	a1,s7,c06c <__umoddi3+0x500>
    c054:	00ba85b3          	add	a1,s5,a1
    c058:	fffd0793          	add	a5,s10,-1
    c05c:	1355ea63          	bltu	a1,s5,c190 <__umoddi3+0x624>
    c060:	1375f863          	bgeu	a1,s7,c190 <__umoddi3+0x624>
    c064:	ffed0d13          	add	s10,s10,-2
    c068:	015585b3          	add	a1,a1,s5
    c06c:	010b1793          	sll	a5,s6,0x10
    c070:	00010e37          	lui	t3,0x10
    c074:	01a7e7b3          	or	a5,a5,s10
    c078:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    c07c:	0067f8b3          	and	a7,a5,t1
    c080:	00647333          	and	t1,s0,t1
    c084:	41758733          	sub	a4,a1,s7
    c088:	0107d793          	srl	a5,a5,0x10
    c08c:	01045e93          	srl	t4,s0,0x10
    c090:	00088513          	mv	a0,a7
    c094:	00030593          	mv	a1,t1
    c098:	3fd020ef          	jal	ec94 <__mulsi3>
    c09c:	00050813          	mv	a6,a0
    c0a0:	000e8593          	mv	a1,t4
    c0a4:	00088513          	mv	a0,a7
    c0a8:	3ed020ef          	jal	ec94 <__mulsi3>
    c0ac:	00050893          	mv	a7,a0
    c0b0:	00030593          	mv	a1,t1
    c0b4:	00078513          	mv	a0,a5
    c0b8:	3dd020ef          	jal	ec94 <__mulsi3>
    c0bc:	00050313          	mv	t1,a0
    c0c0:	000e8593          	mv	a1,t4
    c0c4:	00078513          	mv	a0,a5
    c0c8:	3cd020ef          	jal	ec94 <__mulsi3>
    c0cc:	01085793          	srl	a5,a6,0x10
    c0d0:	006888b3          	add	a7,a7,t1
    c0d4:	011787b3          	add	a5,a5,a7
    c0d8:	0067f463          	bgeu	a5,t1,c0e0 <__umoddi3+0x574>
    c0dc:	01c50533          	add	a0,a0,t3
    c0e0:	00010637          	lui	a2,0x10
    c0e4:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    c0e8:	0107d693          	srl	a3,a5,0x10
    c0ec:	00c7f7b3          	and	a5,a5,a2
    c0f0:	01079793          	sll	a5,a5,0x10
    c0f4:	00c87833          	and	a6,a6,a2
    c0f8:	00a686b3          	add	a3,a3,a0
    c0fc:	010787b3          	add	a5,a5,a6
    c100:	06d76263          	bltu	a4,a3,c164 <__umoddi3+0x5f8>
    c104:	04d70e63          	beq	a4,a3,c160 <__umoddi3+0x5f4>
    c108:	40f487b3          	sub	a5,s1,a5
    c10c:	00f4b4b3          	sltu	s1,s1,a5
    c110:	02812403          	lw	s0,40(sp)
    c114:	02c12083          	lw	ra,44(sp)
    c118:	40d705b3          	sub	a1,a4,a3
    c11c:	409585b3          	sub	a1,a1,s1
    c120:	01359733          	sll	a4,a1,s3
    c124:	0127d7b3          	srl	a5,a5,s2
    c128:	02412483          	lw	s1,36(sp)
    c12c:	01c12983          	lw	s3,28(sp)
    c130:	01812a03          	lw	s4,24(sp)
    c134:	01412a83          	lw	s5,20(sp)
    c138:	01012b03          	lw	s6,16(sp)
    c13c:	00c12b83          	lw	s7,12(sp)
    c140:	00812c03          	lw	s8,8(sp)
    c144:	00412c83          	lw	s9,4(sp)
    c148:	00012d03          	lw	s10,0(sp)
    c14c:	0125d5b3          	srl	a1,a1,s2
    c150:	00f76533          	or	a0,a4,a5
    c154:	02012903          	lw	s2,32(sp)
    c158:	03010113          	add	sp,sp,48
    c15c:	00008067          	ret
    c160:	faf4f4e3          	bgeu	s1,a5,c108 <__umoddi3+0x59c>
    c164:	40878433          	sub	s0,a5,s0
    c168:	0087b7b3          	sltu	a5,a5,s0
    c16c:	01578ab3          	add	s5,a5,s5
    c170:	415686b3          	sub	a3,a3,s5
    c174:	00040793          	mv	a5,s0
    c178:	f91ff06f          	j	c108 <__umoddi3+0x59c>
    c17c:	01000737          	lui	a4,0x1000
    c180:	02e67c63          	bgeu	a2,a4,c1b8 <__umoddi3+0x64c>
    c184:	01065513          	srl	a0,a2,0x10
    c188:	01000693          	li	a3,16
    c18c:	bd9ff06f          	j	bd64 <__umoddi3+0x1f8>
    c190:	00078d13          	mv	s10,a5
    c194:	ed9ff06f          	j	c06c <__umoddi3+0x500>
    c198:	00070b13          	mv	s6,a4
    c19c:	e71ff06f          	j	c00c <__umoddi3+0x4a0>
    c1a0:	014787b3          	add	a5,a5,s4
    c1a4:	aedff06f          	j	bc90 <__umoddi3+0x124>
    c1a8:	014787b3          	add	a5,a5,s4
    c1ac:	c2dff06f          	j	bdd8 <__umoddi3+0x26c>
    c1b0:	014787b3          	add	a5,a5,s4
    c1b4:	a91ff06f          	j	bc44 <__umoddi3+0xd8>
    c1b8:	01865513          	srl	a0,a2,0x18
    c1bc:	01800693          	li	a3,24
    c1c0:	ba5ff06f          	j	bd64 <__umoddi3+0x1f8>

0000c1c4 <__adddf3>:
    c1c4:	001007b7          	lui	a5,0x100
    c1c8:	fe010113          	add	sp,sp,-32
    c1cc:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c1d0:	00bef833          	and	a6,t4,a1
    c1d4:	00def7b3          	and	a5,t4,a3
    c1d8:	0146d313          	srl	t1,a3,0x14
    c1dc:	01212823          	sw	s2,16(sp)
    c1e0:	0145d913          	srl	s2,a1,0x14
    c1e4:	00379793          	sll	a5,a5,0x3
    c1e8:	00812c23          	sw	s0,24(sp)
    c1ec:	00381813          	sll	a6,a6,0x3
    c1f0:	01f5d413          	srl	s0,a1,0x1f
    c1f4:	01d55713          	srl	a4,a0,0x1d
    c1f8:	01d65893          	srl	a7,a2,0x1d
    c1fc:	7ff97913          	and	s2,s2,2047
    c200:	7ff37313          	and	t1,t1,2047
    c204:	00112e23          	sw	ra,28(sp)
    c208:	00912a23          	sw	s1,20(sp)
    c20c:	01312623          	sw	s3,12(sp)
    c210:	01f6d693          	srl	a3,a3,0x1f
    c214:	00f8e8b3          	or	a7,a7,a5
    c218:	01076733          	or	a4,a4,a6
    c21c:	00351593          	sll	a1,a0,0x3
    c220:	00361f13          	sll	t5,a2,0x3
    c224:	406907b3          	sub	a5,s2,t1
    c228:	1ed40463          	beq	s0,a3,c410 <__adddf3+0x24c>
    c22c:	16f05263          	blez	a5,c390 <__adddf3+0x1cc>
    c230:	28030663          	beqz	t1,c4bc <__adddf3+0x2f8>
    c234:	7ff00693          	li	a3,2047
    c238:	42d90663          	beq	s2,a3,c664 <__adddf3+0x4a0>
    c23c:	03800693          	li	a3,56
    c240:	00100613          	li	a2,1
    c244:	02f6ce63          	blt	a3,a5,c280 <__adddf3+0xbc>
    c248:	008006b7          	lui	a3,0x800
    c24c:	00d8e8b3          	or	a7,a7,a3
    c250:	01f00693          	li	a3,31
    c254:	52f6ce63          	blt	a3,a5,c790 <__adddf3+0x5cc>
    c258:	02000693          	li	a3,32
    c25c:	40f686b3          	sub	a3,a3,a5
    c260:	00d89633          	sll	a2,a7,a3
    c264:	00ff5533          	srl	a0,t5,a5
    c268:	00df16b3          	sll	a3,t5,a3
    c26c:	00a66633          	or	a2,a2,a0
    c270:	00d036b3          	snez	a3,a3
    c274:	00f8d8b3          	srl	a7,a7,a5
    c278:	00d66633          	or	a2,a2,a3
    c27c:	41170733          	sub	a4,a4,a7
    c280:	40c58633          	sub	a2,a1,a2
    c284:	00c5b5b3          	sltu	a1,a1,a2
    c288:	00060493          	mv	s1,a2
    c28c:	40b709b3          	sub	s3,a4,a1
    c290:	00899793          	sll	a5,s3,0x8
    c294:	3207da63          	bgez	a5,c5c8 <__adddf3+0x404>
    c298:	008007b7          	lui	a5,0x800
    c29c:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c2a0:	00f9f9b3          	and	s3,s3,a5
    c2a4:	2c098863          	beqz	s3,c574 <__adddf3+0x3b0>
    c2a8:	00098513          	mv	a0,s3
    c2ac:	359020ef          	jal	ee04 <__clzsi2>
    c2b0:	ff850793          	add	a5,a0,-8
    c2b4:	02000693          	li	a3,32
    c2b8:	40f68733          	sub	a4,a3,a5
    c2bc:	00e4d733          	srl	a4,s1,a4
    c2c0:	00f999b3          	sll	s3,s3,a5
    c2c4:	01376733          	or	a4,a4,s3
    c2c8:	00f494b3          	sll	s1,s1,a5
    c2cc:	4b27c863          	blt	a5,s2,c77c <__adddf3+0x5b8>
    c2d0:	412787b3          	sub	a5,a5,s2
    c2d4:	00178793          	add	a5,a5,1
    c2d8:	40f686b3          	sub	a3,a3,a5
    c2dc:	00d49633          	sll	a2,s1,a3
    c2e0:	00f4d9b3          	srl	s3,s1,a5
    c2e4:	00c03633          	snez	a2,a2
    c2e8:	01366633          	or	a2,a2,s3
    c2ec:	00d716b3          	sll	a3,a4,a3
    c2f0:	00c6e4b3          	or	s1,a3,a2
    c2f4:	00f759b3          	srl	s3,a4,a5
    c2f8:	00000913          	li	s2,0
    c2fc:	0074f793          	and	a5,s1,7
    c300:	02078063          	beqz	a5,c320 <__adddf3+0x15c>
    c304:	00f4f793          	and	a5,s1,15
    c308:	00400713          	li	a4,4
    c30c:	00e78a63          	beq	a5,a4,c320 <__adddf3+0x15c>
    c310:	00448793          	add	a5,s1,4
    c314:	0097b633          	sltu	a2,a5,s1
    c318:	00c989b3          	add	s3,s3,a2
    c31c:	00078493          	mv	s1,a5
    c320:	00899793          	sll	a5,s3,0x8
    c324:	6e07da63          	bgez	a5,ca18 <__adddf3+0x854>
    c328:	00190793          	add	a5,s2,1
    c32c:	7ff00713          	li	a4,2047
    c330:	00040e13          	mv	t3,s0
    c334:	2ae78663          	beq	a5,a4,c5e0 <__adddf3+0x41c>
    c338:	ff800737          	lui	a4,0xff800
    c33c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c340:	00e9f733          	and	a4,s3,a4
    c344:	7ff7f793          	and	a5,a5,2047
    c348:	01d71813          	sll	a6,a4,0x1d
    c34c:	0034d613          	srl	a2,s1,0x3
    c350:	00971713          	sll	a4,a4,0x9
    c354:	00c86833          	or	a6,a6,a2
    c358:	00c75713          	srl	a4,a4,0xc
    c35c:	01c12083          	lw	ra,28(sp)
    c360:	01812403          	lw	s0,24(sp)
    c364:	01479793          	sll	a5,a5,0x14
    c368:	00e7e7b3          	or	a5,a5,a4
    c36c:	01fe1713          	sll	a4,t3,0x1f
    c370:	00e7e7b3          	or	a5,a5,a4
    c374:	01412483          	lw	s1,20(sp)
    c378:	01012903          	lw	s2,16(sp)
    c37c:	00c12983          	lw	s3,12(sp)
    c380:	00080513          	mv	a0,a6
    c384:	00078593          	mv	a1,a5
    c388:	02010113          	add	sp,sp,32
    c38c:	00008067          	ret
    c390:	14078c63          	beqz	a5,c4e8 <__adddf3+0x324>
    c394:	412307b3          	sub	a5,t1,s2
    c398:	3c091263          	bnez	s2,c75c <__adddf3+0x598>
    c39c:	00b76533          	or	a0,a4,a1
    c3a0:	4c050463          	beqz	a0,c868 <__adddf3+0x6a4>
    c3a4:	fff78513          	add	a0,a5,-1
    c3a8:	60050263          	beqz	a0,c9ac <__adddf3+0x7e8>
    c3ac:	7ff00813          	li	a6,2047
    c3b0:	57078663          	beq	a5,a6,c91c <__adddf3+0x758>
    c3b4:	03800793          	li	a5,56
    c3b8:	00100613          	li	a2,1
    c3bc:	02a7cc63          	blt	a5,a0,c3f4 <__adddf3+0x230>
    c3c0:	00050793          	mv	a5,a0
    c3c4:	01f00613          	li	a2,31
    c3c8:	56f64c63          	blt	a2,a5,c940 <__adddf3+0x77c>
    c3cc:	02000513          	li	a0,32
    c3d0:	40f50533          	sub	a0,a0,a5
    c3d4:	00a71633          	sll	a2,a4,a0
    c3d8:	00f5d833          	srl	a6,a1,a5
    c3dc:	00a59533          	sll	a0,a1,a0
    c3e0:	01066633          	or	a2,a2,a6
    c3e4:	00a03533          	snez	a0,a0
    c3e8:	00f75733          	srl	a4,a4,a5
    c3ec:	00a66633          	or	a2,a2,a0
    c3f0:	40e888b3          	sub	a7,a7,a4
    c3f4:	40cf0633          	sub	a2,t5,a2
    c3f8:	00cf3733          	sltu	a4,t5,a2
    c3fc:	00060493          	mv	s1,a2
    c400:	40e889b3          	sub	s3,a7,a4
    c404:	00030913          	mv	s2,t1
    c408:	00068413          	mv	s0,a3
    c40c:	e85ff06f          	j	c290 <__adddf3+0xcc>
    c410:	1ef05063          	blez	a5,c5f0 <__adddf3+0x42c>
    c414:	14031063          	bnez	t1,c554 <__adddf3+0x390>
    c418:	01e8e6b3          	or	a3,a7,t5
    c41c:	26068c63          	beqz	a3,c694 <__adddf3+0x4d0>
    c420:	fff78693          	add	a3,a5,-1
    c424:	48068063          	beqz	a3,c8a4 <__adddf3+0x6e0>
    c428:	7ff00613          	li	a2,2047
    c42c:	22c78c63          	beq	a5,a2,c664 <__adddf3+0x4a0>
    c430:	03800793          	li	a5,56
    c434:	00100993          	li	s3,1
    c438:	02d7cc63          	blt	a5,a3,c470 <__adddf3+0x2ac>
    c43c:	00068793          	mv	a5,a3
    c440:	01f00693          	li	a3,31
    c444:	4af6c063          	blt	a3,a5,c8e4 <__adddf3+0x720>
    c448:	02000693          	li	a3,32
    c44c:	40f686b3          	sub	a3,a3,a5
    c450:	00d899b3          	sll	s3,a7,a3
    c454:	00ff5633          	srl	a2,t5,a5
    c458:	00df16b3          	sll	a3,t5,a3
    c45c:	00c9e9b3          	or	s3,s3,a2
    c460:	00d036b3          	snez	a3,a3
    c464:	00f8d8b3          	srl	a7,a7,a5
    c468:	00d9e9b3          	or	s3,s3,a3
    c46c:	01170733          	add	a4,a4,a7
    c470:	00b985b3          	add	a1,s3,a1
    c474:	0135b9b3          	sltu	s3,a1,s3
    c478:	00058493          	mv	s1,a1
    c47c:	00e989b3          	add	s3,s3,a4
    c480:	00899793          	sll	a5,s3,0x8
    c484:	1407d263          	bgez	a5,c5c8 <__adddf3+0x404>
    c488:	00190913          	add	s2,s2,1
    c48c:	7ff00793          	li	a5,2047
    c490:	36f90c63          	beq	s2,a5,c808 <__adddf3+0x644>
    c494:	ff8007b7          	lui	a5,0xff800
    c498:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c49c:	0014f613          	and	a2,s1,1
    c4a0:	00f9f7b3          	and	a5,s3,a5
    c4a4:	0014d713          	srl	a4,s1,0x1
    c4a8:	00c76733          	or	a4,a4,a2
    c4ac:	01f79613          	sll	a2,a5,0x1f
    c4b0:	00e664b3          	or	s1,a2,a4
    c4b4:	0017d993          	srl	s3,a5,0x1
    c4b8:	e45ff06f          	j	c2fc <__adddf3+0x138>
    c4bc:	01e8e6b3          	or	a3,a7,t5
    c4c0:	1c068a63          	beqz	a3,c694 <__adddf3+0x4d0>
    c4c4:	fff78693          	add	a3,a5,-1
    c4c8:	40068063          	beqz	a3,c8c8 <__adddf3+0x704>
    c4cc:	7ff00613          	li	a2,2047
    c4d0:	18c78a63          	beq	a5,a2,c664 <__adddf3+0x4a0>
    c4d4:	03800793          	li	a5,56
    c4d8:	00100613          	li	a2,1
    c4dc:	dad7c2e3          	blt	a5,a3,c280 <__adddf3+0xbc>
    c4e0:	00068793          	mv	a5,a3
    c4e4:	d6dff06f          	j	c250 <__adddf3+0x8c>
    c4e8:	00190813          	add	a6,s2,1
    c4ec:	7fe87813          	and	a6,a6,2046
    c4f0:	22081c63          	bnez	a6,c728 <__adddf3+0x564>
    c4f4:	00b76333          	or	t1,a4,a1
    c4f8:	01e8e833          	or	a6,a7,t5
    c4fc:	38091063          	bnez	s2,c87c <__adddf3+0x6b8>
    c500:	46030e63          	beqz	t1,c97c <__adddf3+0x7b8>
    c504:	40080663          	beqz	a6,c910 <__adddf3+0x74c>
    c508:	41e589b3          	sub	s3,a1,t5
    c50c:	0135b533          	sltu	a0,a1,s3
    c510:	41170633          	sub	a2,a4,a7
    c514:	40a60633          	sub	a2,a2,a0
    c518:	00861513          	sll	a0,a2,0x8
    c51c:	50055e63          	bgez	a0,ca38 <__adddf3+0x874>
    c520:	40bf05b3          	sub	a1,t5,a1
    c524:	40e88733          	sub	a4,a7,a4
    c528:	00bf3f33          	sltu	t5,t5,a1
    c52c:	41e70733          	sub	a4,a4,t5
    c530:	00871613          	sll	a2,a4,0x8
    c534:	00058493          	mv	s1,a1
    c538:	52065e63          	bgez	a2,ca74 <__adddf3+0x8b0>
    c53c:	ff8007b7          	lui	a5,0xff800
    c540:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c544:	00f77733          	and	a4,a4,a5
    c548:	00068e13          	mv	t3,a3
    c54c:	00100793          	li	a5,1
    c550:	df9ff06f          	j	c348 <__adddf3+0x184>
    c554:	7ff00693          	li	a3,2047
    c558:	10d90663          	beq	s2,a3,c664 <__adddf3+0x4a0>
    c55c:	03800693          	li	a3,56
    c560:	00100993          	li	s3,1
    c564:	f0f6c6e3          	blt	a3,a5,c470 <__adddf3+0x2ac>
    c568:	008006b7          	lui	a3,0x800
    c56c:	00d8e8b3          	or	a7,a7,a3
    c570:	ed1ff06f          	j	c440 <__adddf3+0x27c>
    c574:	00048513          	mv	a0,s1
    c578:	08d020ef          	jal	ee04 <__clzsi2>
    c57c:	01850793          	add	a5,a0,24
    c580:	01f00693          	li	a3,31
    c584:	d2f6d8e3          	bge	a3,a5,c2b4 <__adddf3+0xf0>
    c588:	ff850713          	add	a4,a0,-8
    c58c:	00e49733          	sll	a4,s1,a4
    c590:	2327c663          	blt	a5,s2,c7bc <__adddf3+0x5f8>
    c594:	41278933          	sub	s2,a5,s2
    c598:	00190793          	add	a5,s2,1
    c59c:	48f6d663          	bge	a3,a5,ca28 <__adddf3+0x864>
    c5a0:	fe190913          	add	s2,s2,-31
    c5a4:	02000693          	li	a3,32
    c5a8:	012754b3          	srl	s1,a4,s2
    c5ac:	00d78c63          	beq	a5,a3,c5c4 <__adddf3+0x400>
    c5b0:	04000693          	li	a3,64
    c5b4:	40f687b3          	sub	a5,a3,a5
    c5b8:	00f71733          	sll	a4,a4,a5
    c5bc:	00e03733          	snez	a4,a4
    c5c0:	00e4e4b3          	or	s1,s1,a4
    c5c4:	00000913          	li	s2,0
    c5c8:	0074f793          	and	a5,s1,7
    c5cc:	d2079ce3          	bnez	a5,c304 <__adddf3+0x140>
    c5d0:	00090793          	mv	a5,s2
    c5d4:	0034d613          	srl	a2,s1,0x3
    c5d8:	00098713          	mv	a4,s3
    c5dc:	0c00006f          	j	c69c <__adddf3+0x4d8>
    c5e0:	7ff00793          	li	a5,2047
    c5e4:	00000713          	li	a4,0
    c5e8:	00000813          	li	a6,0
    c5ec:	d71ff06f          	j	c35c <__adddf3+0x198>
    c5f0:	0c078a63          	beqz	a5,c6c4 <__adddf3+0x500>
    c5f4:	412307b3          	sub	a5,t1,s2
    c5f8:	1e090263          	beqz	s2,c7dc <__adddf3+0x618>
    c5fc:	7ff00693          	li	a3,2047
    c600:	32d30863          	beq	t1,a3,c930 <__adddf3+0x76c>
    c604:	03800693          	li	a3,56
    c608:	00100993          	li	s3,1
    c60c:	02f6ce63          	blt	a3,a5,c648 <__adddf3+0x484>
    c610:	008006b7          	lui	a3,0x800
    c614:	00d76733          	or	a4,a4,a3
    c618:	01f00693          	li	a3,31
    c61c:	3cf6c863          	blt	a3,a5,c9ec <__adddf3+0x828>
    c620:	02000693          	li	a3,32
    c624:	40f686b3          	sub	a3,a3,a5
    c628:	00d719b3          	sll	s3,a4,a3
    c62c:	00f5d633          	srl	a2,a1,a5
    c630:	00d596b3          	sll	a3,a1,a3
    c634:	00c9e9b3          	or	s3,s3,a2
    c638:	00d036b3          	snez	a3,a3
    c63c:	00f75733          	srl	a4,a4,a5
    c640:	00d9e9b3          	or	s3,s3,a3
    c644:	00e888b3          	add	a7,a7,a4
    c648:	01e98733          	add	a4,s3,t5
    c64c:	013739b3          	sltu	s3,a4,s3
    c650:	00070493          	mv	s1,a4
    c654:	011989b3          	add	s3,s3,a7
    c658:	00030913          	mv	s2,t1
    c65c:	e25ff06f          	j	c480 <__adddf3+0x2bc>
    c660:	02081063          	bnez	a6,c680 <__adddf3+0x4bc>
    c664:	00351613          	sll	a2,a0,0x3
    c668:	00365613          	srl	a2,a2,0x3
    c66c:	01d71813          	sll	a6,a4,0x1d
    c670:	00c86833          	or	a6,a6,a2
    c674:	00375713          	srl	a4,a4,0x3
    c678:	01076733          	or	a4,a4,a6
    c67c:	18070663          	beqz	a4,c808 <__adddf3+0x644>
    c680:	00000e13          	li	t3,0
    c684:	7ff00793          	li	a5,2047
    c688:	00080737          	lui	a4,0x80
    c68c:	00000813          	li	a6,0
    c690:	ccdff06f          	j	c35c <__adddf3+0x198>
    c694:	00351613          	sll	a2,a0,0x3
    c698:	00365613          	srl	a2,a2,0x3
    c69c:	01d71813          	sll	a6,a4,0x1d
    c6a0:	7ff00693          	li	a3,2047
    c6a4:	00c86833          	or	a6,a6,a2
    c6a8:	00375713          	srl	a4,a4,0x3
    c6ac:	fcd786e3          	beq	a5,a3,c678 <__adddf3+0x4b4>
    c6b0:	00c71713          	sll	a4,a4,0xc
    c6b4:	00c75713          	srl	a4,a4,0xc
    c6b8:	7ff7f793          	and	a5,a5,2047
    c6bc:	00040e13          	mv	t3,s0
    c6c0:	c9dff06f          	j	c35c <__adddf3+0x198>
    c6c4:	00190693          	add	a3,s2,1
    c6c8:	7fe6f813          	and	a6,a3,2046
    c6cc:	14081863          	bnez	a6,c81c <__adddf3+0x658>
    c6d0:	00b766b3          	or	a3,a4,a1
    c6d4:	28091c63          	bnez	s2,c96c <__adddf3+0x7a8>
    c6d8:	30068263          	beqz	a3,c9dc <__adddf3+0x818>
    c6dc:	01e8e6b3          	or	a3,a7,t5
    c6e0:	22068863          	beqz	a3,c910 <__adddf3+0x74c>
    c6e4:	01e587b3          	add	a5,a1,t5
    c6e8:	00b7b5b3          	sltu	a1,a5,a1
    c6ec:	01170733          	add	a4,a4,a7
    c6f0:	00b70733          	add	a4,a4,a1
    c6f4:	0037d813          	srl	a6,a5,0x3
    c6f8:	00871793          	sll	a5,a4,0x8
    c6fc:	00040e13          	mv	t3,s0
    c700:	3407de63          	bgez	a5,ca5c <__adddf3+0x898>
    c704:	ff8007b7          	lui	a5,0xff800
    c708:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c70c:	00f77733          	and	a4,a4,a5
    c710:	01d71793          	sll	a5,a4,0x1d
    c714:	00375713          	srl	a4,a4,0x3
    c718:	0107e833          	or	a6,a5,a6
    c71c:	01d77733          	and	a4,a4,t4
    c720:	00100793          	li	a5,1
    c724:	c39ff06f          	j	c35c <__adddf3+0x198>
    c728:	41e58833          	sub	a6,a1,t5
    c72c:	0105b7b3          	sltu	a5,a1,a6
    c730:	411709b3          	sub	s3,a4,a7
    c734:	40f989b3          	sub	s3,s3,a5
    c738:	00899793          	sll	a5,s3,0x8
    c73c:	00080493          	mv	s1,a6
    c740:	1007c663          	bltz	a5,c84c <__adddf3+0x688>
    c744:	01386833          	or	a6,a6,s3
    c748:	b4081ee3          	bnez	a6,c2a4 <__adddf3+0xe0>
    c74c:	00000e13          	li	t3,0
    c750:	00000793          	li	a5,0
    c754:	00000713          	li	a4,0
    c758:	c05ff06f          	j	c35c <__adddf3+0x198>
    c75c:	7ff00513          	li	a0,2047
    c760:	1aa30e63          	beq	t1,a0,c91c <__adddf3+0x758>
    c764:	03800513          	li	a0,56
    c768:	00100613          	li	a2,1
    c76c:	c8f544e3          	blt	a0,a5,c3f4 <__adddf3+0x230>
    c770:	00800637          	lui	a2,0x800
    c774:	00c76733          	or	a4,a4,a2
    c778:	c4dff06f          	j	c3c4 <__adddf3+0x200>
    c77c:	ff8009b7          	lui	s3,0xff800
    c780:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c784:	40f90933          	sub	s2,s2,a5
    c788:	013779b3          	and	s3,a4,s3
    c78c:	b71ff06f          	j	c2fc <__adddf3+0x138>
    c790:	fe078693          	add	a3,a5,-32
    c794:	02000613          	li	a2,32
    c798:	00d8d6b3          	srl	a3,a7,a3
    c79c:	00c78a63          	beq	a5,a2,c7b0 <__adddf3+0x5ec>
    c7a0:	04000613          	li	a2,64
    c7a4:	40f607b3          	sub	a5,a2,a5
    c7a8:	00f897b3          	sll	a5,a7,a5
    c7ac:	00ff6f33          	or	t5,t5,a5
    c7b0:	01e03633          	snez	a2,t5
    c7b4:	00d66633          	or	a2,a2,a3
    c7b8:	ac9ff06f          	j	c280 <__adddf3+0xbc>
    c7bc:	ff8006b7          	lui	a3,0xff800
    c7c0:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c7c4:	40f907b3          	sub	a5,s2,a5
    c7c8:	00d77733          	and	a4,a4,a3
    c7cc:	01d71813          	sll	a6,a4,0x1d
    c7d0:	01386833          	or	a6,a6,s3
    c7d4:	00375713          	srl	a4,a4,0x3
    c7d8:	ed9ff06f          	j	c6b0 <__adddf3+0x4ec>
    c7dc:	00b766b3          	or	a3,a4,a1
    c7e0:	1e068663          	beqz	a3,c9cc <__adddf3+0x808>
    c7e4:	fff78693          	add	a3,a5,-1
    c7e8:	0a068e63          	beqz	a3,c8a4 <__adddf3+0x6e0>
    c7ec:	7ff00513          	li	a0,2047
    c7f0:	14a78063          	beq	a5,a0,c930 <__adddf3+0x76c>
    c7f4:	03800793          	li	a5,56
    c7f8:	00100993          	li	s3,1
    c7fc:	e4d7c6e3          	blt	a5,a3,c648 <__adddf3+0x484>
    c800:	00068793          	mv	a5,a3
    c804:	e15ff06f          	j	c618 <__adddf3+0x454>
    c808:	00040e13          	mv	t3,s0
    c80c:	7ff00793          	li	a5,2047
    c810:	00000713          	li	a4,0
    c814:	00000813          	li	a6,0
    c818:	b45ff06f          	j	c35c <__adddf3+0x198>
    c81c:	7ff00793          	li	a5,2047
    c820:	fef684e3          	beq	a3,a5,c808 <__adddf3+0x644>
    c824:	01e58f33          	add	t5,a1,t5
    c828:	00bf35b3          	sltu	a1,t5,a1
    c82c:	011707b3          	add	a5,a4,a7
    c830:	00b787b3          	add	a5,a5,a1
    c834:	01f79613          	sll	a2,a5,0x1f
    c838:	001f5f13          	srl	t5,t5,0x1
    c83c:	01e664b3          	or	s1,a2,t5
    c840:	0017d993          	srl	s3,a5,0x1
    c844:	00068913          	mv	s2,a3
    c848:	ab5ff06f          	j	c2fc <__adddf3+0x138>
    c84c:	40bf0633          	sub	a2,t5,a1
    c850:	40e887b3          	sub	a5,a7,a4
    c854:	00cf3733          	sltu	a4,t5,a2
    c858:	00060493          	mv	s1,a2
    c85c:	40e789b3          	sub	s3,a5,a4
    c860:	00068413          	mv	s0,a3
    c864:	a41ff06f          	j	c2a4 <__adddf3+0xe0>
    c868:	00361613          	sll	a2,a2,0x3
    c86c:	00365613          	srl	a2,a2,0x3
    c870:	00068413          	mv	s0,a3
    c874:	00088713          	mv	a4,a7
    c878:	e25ff06f          	j	c69c <__adddf3+0x4d8>
    c87c:	de0312e3          	bnez	t1,c660 <__adddf3+0x49c>
    c880:	1c080663          	beqz	a6,ca4c <__adddf3+0x888>
    c884:	0038d713          	srl	a4,a7,0x3
    c888:	00361613          	sll	a2,a2,0x3
    c88c:	01d89893          	sll	a7,a7,0x1d
    c890:	01176733          	or	a4,a4,a7
    c894:	00365613          	srl	a2,a2,0x3
    c898:	00c76733          	or	a4,a4,a2
    c89c:	00068413          	mv	s0,a3
    c8a0:	dddff06f          	j	c67c <__adddf3+0x4b8>
    c8a4:	01e58f33          	add	t5,a1,t5
    c8a8:	011708b3          	add	a7,a4,a7
    c8ac:	00bf35b3          	sltu	a1,t5,a1
    c8b0:	00b889b3          	add	s3,a7,a1
    c8b4:	00899793          	sll	a5,s3,0x8
    c8b8:	000f0493          	mv	s1,t5
    c8bc:	0e07d463          	bgez	a5,c9a4 <__adddf3+0x7e0>
    c8c0:	00200913          	li	s2,2
    c8c4:	bd1ff06f          	j	c494 <__adddf3+0x2d0>
    c8c8:	41e58f33          	sub	t5,a1,t5
    c8cc:	411708b3          	sub	a7,a4,a7
    c8d0:	01e5b5b3          	sltu	a1,a1,t5
    c8d4:	000f0493          	mv	s1,t5
    c8d8:	40b889b3          	sub	s3,a7,a1
    c8dc:	00100913          	li	s2,1
    c8e0:	9b1ff06f          	j	c290 <__adddf3+0xcc>
    c8e4:	fe078693          	add	a3,a5,-32
    c8e8:	02000613          	li	a2,32
    c8ec:	00d8d6b3          	srl	a3,a7,a3
    c8f0:	00c78a63          	beq	a5,a2,c904 <__adddf3+0x740>
    c8f4:	04000613          	li	a2,64
    c8f8:	40f607b3          	sub	a5,a2,a5
    c8fc:	00f897b3          	sll	a5,a7,a5
    c900:	00ff6f33          	or	t5,t5,a5
    c904:	01e039b3          	snez	s3,t5
    c908:	00d9e9b3          	or	s3,s3,a3
    c90c:	b65ff06f          	j	c470 <__adddf3+0x2ac>
    c910:	00351613          	sll	a2,a0,0x3
    c914:	00365993          	srl	s3,a2,0x3
    c918:	eb5ff06f          	j	c7cc <__adddf3+0x608>
    c91c:	00361613          	sll	a2,a2,0x3
    c920:	00365613          	srl	a2,a2,0x3
    c924:	00068413          	mv	s0,a3
    c928:	00088713          	mv	a4,a7
    c92c:	d41ff06f          	j	c66c <__adddf3+0x4a8>
    c930:	00361613          	sll	a2,a2,0x3
    c934:	00365613          	srl	a2,a2,0x3
    c938:	00088713          	mv	a4,a7
    c93c:	d31ff06f          	j	c66c <__adddf3+0x4a8>
    c940:	fe078513          	add	a0,a5,-32
    c944:	02000613          	li	a2,32
    c948:	00a75533          	srl	a0,a4,a0
    c94c:	00c78a63          	beq	a5,a2,c960 <__adddf3+0x79c>
    c950:	04000613          	li	a2,64
    c954:	40f607b3          	sub	a5,a2,a5
    c958:	00f717b3          	sll	a5,a4,a5
    c95c:	00f5e5b3          	or	a1,a1,a5
    c960:	00b03633          	snez	a2,a1
    c964:	00a66633          	or	a2,a2,a0
    c968:	a8dff06f          	j	c3f4 <__adddf3+0x230>
    c96c:	fc0682e3          	beqz	a3,c930 <__adddf3+0x76c>
    c970:	01e8ef33          	or	t5,a7,t5
    c974:	d00f16e3          	bnez	t5,c680 <__adddf3+0x4bc>
    c978:	cedff06f          	j	c664 <__adddf3+0x4a0>
    c97c:	dc0808e3          	beqz	a6,c74c <__adddf3+0x588>
    c980:	00361813          	sll	a6,a2,0x3
    c984:	01d89793          	sll	a5,a7,0x1d
    c988:	00385813          	srl	a6,a6,0x3
    c98c:	0038d713          	srl	a4,a7,0x3
    c990:	00f86833          	or	a6,a6,a5
    c994:	01d77733          	and	a4,a4,t4
    c998:	00068e13          	mv	t3,a3
    c99c:	00000793          	li	a5,0
    c9a0:	9bdff06f          	j	c35c <__adddf3+0x198>
    c9a4:	00100793          	li	a5,1
    c9a8:	c2dff06f          	j	c5d4 <__adddf3+0x410>
    c9ac:	40bf05b3          	sub	a1,t5,a1
    c9b0:	40e888b3          	sub	a7,a7,a4
    c9b4:	00bf3733          	sltu	a4,t5,a1
    c9b8:	00058493          	mv	s1,a1
    c9bc:	40e889b3          	sub	s3,a7,a4
    c9c0:	00068413          	mv	s0,a3
    c9c4:	00100913          	li	s2,1
    c9c8:	8c9ff06f          	j	c290 <__adddf3+0xcc>
    c9cc:	00361613          	sll	a2,a2,0x3
    c9d0:	00365613          	srl	a2,a2,0x3
    c9d4:	00088713          	mv	a4,a7
    c9d8:	cc5ff06f          	j	c69c <__adddf3+0x4d8>
    c9dc:	00361613          	sll	a2,a2,0x3
    c9e0:	00365993          	srl	s3,a2,0x3
    c9e4:	00088713          	mv	a4,a7
    c9e8:	de5ff06f          	j	c7cc <__adddf3+0x608>
    c9ec:	fe078693          	add	a3,a5,-32
    c9f0:	02000613          	li	a2,32
    c9f4:	00d756b3          	srl	a3,a4,a3
    c9f8:	00c78a63          	beq	a5,a2,ca0c <__adddf3+0x848>
    c9fc:	04000613          	li	a2,64
    ca00:	40f607b3          	sub	a5,a2,a5
    ca04:	00f717b3          	sll	a5,a4,a5
    ca08:	00f5e5b3          	or	a1,a1,a5
    ca0c:	00b039b3          	snez	s3,a1
    ca10:	00d9e9b3          	or	s3,s3,a3
    ca14:	c35ff06f          	j	c648 <__adddf3+0x484>
    ca18:	0034d613          	srl	a2,s1,0x3
    ca1c:	00090793          	mv	a5,s2
    ca20:	00098713          	mv	a4,s3
    ca24:	c79ff06f          	j	c69c <__adddf3+0x4d8>
    ca28:	02000693          	li	a3,32
    ca2c:	40f686b3          	sub	a3,a3,a5
    ca30:	00000613          	li	a2,0
    ca34:	8b5ff06f          	j	c2e8 <__adddf3+0x124>
    ca38:	00c9e833          	or	a6,s3,a2
    ca3c:	d00808e3          	beqz	a6,c74c <__adddf3+0x588>
    ca40:	0039d993          	srl	s3,s3,0x3
    ca44:	00060713          	mv	a4,a2
    ca48:	d85ff06f          	j	c7cc <__adddf3+0x608>
    ca4c:	00000e13          	li	t3,0
    ca50:	7ff00793          	li	a5,2047
    ca54:	00080737          	lui	a4,0x80
    ca58:	905ff06f          	j	c35c <__adddf3+0x198>
    ca5c:	01d71793          	sll	a5,a4,0x1d
    ca60:	00375713          	srl	a4,a4,0x3
    ca64:	0107e833          	or	a6,a5,a6
    ca68:	01d77733          	and	a4,a4,t4
    ca6c:	00000793          	li	a5,0
    ca70:	8edff06f          	j	c35c <__adddf3+0x198>
    ca74:	01d71813          	sll	a6,a4,0x1d
    ca78:	0035d593          	srl	a1,a1,0x3
    ca7c:	00b86833          	or	a6,a6,a1
    ca80:	00375713          	srl	a4,a4,0x3
    ca84:	00068413          	mv	s0,a3
    ca88:	c29ff06f          	j	c6b0 <__adddf3+0x4ec>

0000ca8c <__divdf3>:
    ca8c:	fb010113          	add	sp,sp,-80
    ca90:	0145d793          	srl	a5,a1,0x14
    ca94:	04812423          	sw	s0,72(sp)
    ca98:	04912223          	sw	s1,68(sp)
    ca9c:	05212023          	sw	s2,64(sp)
    caa0:	03412c23          	sw	s4,56(sp)
    caa4:	03512a23          	sw	s5,52(sp)
    caa8:	00c59493          	sll	s1,a1,0xc
    caac:	04112623          	sw	ra,76(sp)
    cab0:	03312e23          	sw	s3,60(sp)
    cab4:	03612823          	sw	s6,48(sp)
    cab8:	03712623          	sw	s7,44(sp)
    cabc:	03812423          	sw	s8,40(sp)
    cac0:	7ff7f793          	and	a5,a5,2047
    cac4:	00050413          	mv	s0,a0
    cac8:	00060a13          	mv	s4,a2
    cacc:	00068913          	mv	s2,a3
    cad0:	00c4d493          	srl	s1,s1,0xc
    cad4:	01f5da93          	srl	s5,a1,0x1f
    cad8:	18078c63          	beqz	a5,cc70 <__divdf3+0x1e4>
    cadc:	7ff00713          	li	a4,2047
    cae0:	08e78a63          	beq	a5,a4,cb74 <__divdf3+0xe8>
    cae4:	01d55b13          	srl	s6,a0,0x1d
    cae8:	00349493          	sll	s1,s1,0x3
    caec:	009b64b3          	or	s1,s6,s1
    caf0:	00800737          	lui	a4,0x800
    caf4:	00e4eb33          	or	s6,s1,a4
    caf8:	00351b93          	sll	s7,a0,0x3
    cafc:	c0178993          	add	s3,a5,-1023
    cb00:	00000493          	li	s1,0
    cb04:	00000c13          	li	s8,0
    cb08:	01495793          	srl	a5,s2,0x14
    cb0c:	00c91413          	sll	s0,s2,0xc
    cb10:	7ff7f793          	and	a5,a5,2047
    cb14:	00c45413          	srl	s0,s0,0xc
    cb18:	01f95913          	srl	s2,s2,0x1f
    cb1c:	08078463          	beqz	a5,cba4 <__divdf3+0x118>
    cb20:	7ff00713          	li	a4,2047
    cb24:	18e78c63          	beq	a5,a4,ccbc <__divdf3+0x230>
    cb28:	00341413          	sll	s0,s0,0x3
    cb2c:	01da5713          	srl	a4,s4,0x1d
    cb30:	00876733          	or	a4,a4,s0
    cb34:	c0178793          	add	a5,a5,-1023
    cb38:	00800437          	lui	s0,0x800
    cb3c:	40f989b3          	sub	s3,s3,a5
    cb40:	00876433          	or	s0,a4,s0
    cb44:	003a1813          	sll	a6,s4,0x3
    cb48:	00000793          	li	a5,0
    cb4c:	00f00713          	li	a4,15
    cb50:	012aca33          	xor	s4,s5,s2
    cb54:	24976663          	bltu	a4,s1,cda0 <__divdf3+0x314>
    cb58:	00003697          	auipc	a3,0x3
    cb5c:	dd868693          	add	a3,a3,-552 # f930 <__mprec_tens+0xc8>
    cb60:	00249493          	sll	s1,s1,0x2
    cb64:	00d484b3          	add	s1,s1,a3
    cb68:	0004a703          	lw	a4,0(s1)
    cb6c:	00d70733          	add	a4,a4,a3
    cb70:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    cb74:	00a4eb33          	or	s6,s1,a0
    cb78:	1c0b1e63          	bnez	s6,cd54 <__divdf3+0x2c8>
    cb7c:	01495793          	srl	a5,s2,0x14
    cb80:	00c91413          	sll	s0,s2,0xc
    cb84:	7ff7f793          	and	a5,a5,2047
    cb88:	00000b93          	li	s7,0
    cb8c:	00800493          	li	s1,8
    cb90:	7ff00993          	li	s3,2047
    cb94:	00200c13          	li	s8,2
    cb98:	00c45413          	srl	s0,s0,0xc
    cb9c:	01f95913          	srl	s2,s2,0x1f
    cba0:	f80790e3          	bnez	a5,cb20 <__divdf3+0x94>
    cba4:	01446833          	or	a6,s0,s4
    cba8:	1c080263          	beqz	a6,cd6c <__divdf3+0x2e0>
    cbac:	5c040663          	beqz	s0,d178 <__divdf3+0x6ec>
    cbb0:	00040513          	mv	a0,s0
    cbb4:	250020ef          	jal	ee04 <__clzsi2>
    cbb8:	00050793          	mv	a5,a0
    cbbc:	ff550693          	add	a3,a0,-11
    cbc0:	01d00713          	li	a4,29
    cbc4:	ff878813          	add	a6,a5,-8
    cbc8:	40d70733          	sub	a4,a4,a3
    cbcc:	01041433          	sll	s0,s0,a6
    cbd0:	00ea5733          	srl	a4,s4,a4
    cbd4:	00876433          	or	s0,a4,s0
    cbd8:	010a1833          	sll	a6,s4,a6
    cbdc:	013787b3          	add	a5,a5,s3
    cbe0:	3f378993          	add	s3,a5,1011
    cbe4:	00000793          	li	a5,0
    cbe8:	f65ff06f          	j	cb4c <__divdf3+0xc0>
    cbec:	40f70733          	sub	a4,a4,a5
    cbf0:	03800693          	li	a3,56
    cbf4:	60e6d063          	bge	a3,a4,d1f4 <__divdf3+0x768>
    cbf8:	00000793          	li	a5,0
    cbfc:	00000693          	li	a3,0
    cc00:	00000713          	li	a4,0
    cc04:	04c12083          	lw	ra,76(sp)
    cc08:	04812403          	lw	s0,72(sp)
    cc0c:	01479793          	sll	a5,a5,0x14
    cc10:	00d7e7b3          	or	a5,a5,a3
    cc14:	01fa1693          	sll	a3,s4,0x1f
    cc18:	00d7e7b3          	or	a5,a5,a3
    cc1c:	04412483          	lw	s1,68(sp)
    cc20:	04012903          	lw	s2,64(sp)
    cc24:	03c12983          	lw	s3,60(sp)
    cc28:	03812a03          	lw	s4,56(sp)
    cc2c:	03412a83          	lw	s5,52(sp)
    cc30:	03012b03          	lw	s6,48(sp)
    cc34:	02c12b83          	lw	s7,44(sp)
    cc38:	02812c03          	lw	s8,40(sp)
    cc3c:	00070513          	mv	a0,a4
    cc40:	00078593          	mv	a1,a5
    cc44:	05010113          	add	sp,sp,80
    cc48:	00008067          	ret
    cc4c:	7ff00793          	li	a5,2047
    cc50:	00000693          	li	a3,0
    cc54:	00000713          	li	a4,0
    cc58:	fadff06f          	j	cc04 <__divdf3+0x178>
    cc5c:	00000a13          	li	s4,0
    cc60:	7ff00793          	li	a5,2047
    cc64:	000806b7          	lui	a3,0x80
    cc68:	00000713          	li	a4,0
    cc6c:	f99ff06f          	j	cc04 <__divdf3+0x178>
    cc70:	00a4eb33          	or	s6,s1,a0
    cc74:	100b0c63          	beqz	s6,cd8c <__divdf3+0x300>
    cc78:	52048463          	beqz	s1,d1a0 <__divdf3+0x714>
    cc7c:	00048513          	mv	a0,s1
    cc80:	184020ef          	jal	ee04 <__clzsi2>
    cc84:	00050713          	mv	a4,a0
    cc88:	ff550793          	add	a5,a0,-11
    cc8c:	01d00b13          	li	s6,29
    cc90:	ff870b93          	add	s7,a4,-8
    cc94:	40fb0b33          	sub	s6,s6,a5
    cc98:	017494b3          	sll	s1,s1,s7
    cc9c:	01645b33          	srl	s6,s0,s6
    cca0:	009b6b33          	or	s6,s6,s1
    cca4:	01741bb3          	sll	s7,s0,s7
    cca8:	c0d00793          	li	a5,-1011
    ccac:	40e789b3          	sub	s3,a5,a4
    ccb0:	00000493          	li	s1,0
    ccb4:	00000c13          	li	s8,0
    ccb8:	e51ff06f          	j	cb08 <__divdf3+0x7c>
    ccbc:	01446833          	or	a6,s0,s4
    ccc0:	80198993          	add	s3,s3,-2047
    ccc4:	0a081c63          	bnez	a6,cd7c <__divdf3+0x2f0>
    ccc8:	0024e493          	or	s1,s1,2
    cccc:	00000413          	li	s0,0
    ccd0:	00200793          	li	a5,2
    ccd4:	e79ff06f          	j	cb4c <__divdf3+0xc0>
    ccd8:	000a8913          	mv	s2,s5
    ccdc:	000b0413          	mv	s0,s6
    cce0:	000b8813          	mv	a6,s7
    cce4:	00200793          	li	a5,2
    cce8:	60fc0863          	beq	s8,a5,d2f8 <__divdf3+0x86c>
    ccec:	00300793          	li	a5,3
    ccf0:	f6fc06e3          	beq	s8,a5,cc5c <__divdf3+0x1d0>
    ccf4:	00100793          	li	a5,1
    ccf8:	00090a13          	mv	s4,s2
    ccfc:	eefc0ee3          	beq	s8,a5,cbf8 <__divdf3+0x16c>
    cd00:	3ff98793          	add	a5,s3,1023
    cd04:	3cf05263          	blez	a5,d0c8 <__divdf3+0x63c>
    cd08:	00787713          	and	a4,a6,7
    cd0c:	5c071663          	bnez	a4,d2d8 <__divdf3+0x84c>
    cd10:	00741713          	sll	a4,s0,0x7
    cd14:	00075a63          	bgez	a4,cd28 <__divdf3+0x29c>
    cd18:	ff0007b7          	lui	a5,0xff000
    cd1c:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cd20:	00f47433          	and	s0,s0,a5
    cd24:	40098793          	add	a5,s3,1024
    cd28:	7fe00713          	li	a4,2046
    cd2c:	f2f740e3          	blt	a4,a5,cc4c <__divdf3+0x1c0>
    cd30:	00385813          	srl	a6,a6,0x3
    cd34:	01d41713          	sll	a4,s0,0x1d
    cd38:	00941693          	sll	a3,s0,0x9
    cd3c:	01076733          	or	a4,a4,a6
    cd40:	00c6d693          	srl	a3,a3,0xc
    cd44:	7ff7f793          	and	a5,a5,2047
    cd48:	ebdff06f          	j	cc04 <__divdf3+0x178>
    cd4c:	00078c13          	mv	s8,a5
    cd50:	f95ff06f          	j	cce4 <__divdf3+0x258>
    cd54:	00048b13          	mv	s6,s1
    cd58:	00050b93          	mv	s7,a0
    cd5c:	00c00493          	li	s1,12
    cd60:	7ff00993          	li	s3,2047
    cd64:	00300c13          	li	s8,3
    cd68:	da1ff06f          	j	cb08 <__divdf3+0x7c>
    cd6c:	0014e493          	or	s1,s1,1
    cd70:	00000413          	li	s0,0
    cd74:	00100793          	li	a5,1
    cd78:	dd5ff06f          	j	cb4c <__divdf3+0xc0>
    cd7c:	0034e493          	or	s1,s1,3
    cd80:	000a0813          	mv	a6,s4
    cd84:	00300793          	li	a5,3
    cd88:	dc5ff06f          	j	cb4c <__divdf3+0xc0>
    cd8c:	00000b93          	li	s7,0
    cd90:	00400493          	li	s1,4
    cd94:	00000993          	li	s3,0
    cd98:	00100c13          	li	s8,1
    cd9c:	d6dff06f          	j	cb08 <__divdf3+0x7c>
    cda0:	03912223          	sw	s9,36(sp)
    cda4:	03a12023          	sw	s10,32(sp)
    cda8:	01b12e23          	sw	s11,28(sp)
    cdac:	3b646a63          	bltu	s0,s6,d160 <__divdf3+0x6d4>
    cdb0:	3a8b0663          	beq	s6,s0,d15c <__divdf3+0x6d0>
    cdb4:	fff98993          	add	s3,s3,-1
    cdb8:	000b8c13          	mv	s8,s7
    cdbc:	000b0493          	mv	s1,s6
    cdc0:	00000d13          	li	s10,0
    cdc4:	01885c93          	srl	s9,a6,0x18
    cdc8:	00841413          	sll	s0,s0,0x8
    cdcc:	01045913          	srl	s2,s0,0x10
    cdd0:	008cecb3          	or	s9,s9,s0
    cdd4:	00090593          	mv	a1,s2
    cdd8:	00048513          	mv	a0,s1
    cddc:	010c9b13          	sll	s6,s9,0x10
    cde0:	00881a93          	sll	s5,a6,0x8
    cde4:	010b5b13          	srl	s6,s6,0x10
    cde8:	771010ef          	jal	ed58 <__hidden___udivsi3>
    cdec:	00050593          	mv	a1,a0
    cdf0:	00050413          	mv	s0,a0
    cdf4:	000b0513          	mv	a0,s6
    cdf8:	69d010ef          	jal	ec94 <__mulsi3>
    cdfc:	00050793          	mv	a5,a0
    ce00:	00090593          	mv	a1,s2
    ce04:	00048513          	mv	a0,s1
    ce08:	00078493          	mv	s1,a5
    ce0c:	795010ef          	jal	eda0 <__umodsi3>
    ce10:	01051513          	sll	a0,a0,0x10
    ce14:	010c5793          	srl	a5,s8,0x10
    ce18:	00a7e7b3          	or	a5,a5,a0
    ce1c:	0097fa63          	bgeu	a5,s1,ce30 <__divdf3+0x3a4>
    ce20:	00fc87b3          	add	a5,s9,a5
    ce24:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    ce28:	3b97fe63          	bgeu	a5,s9,d1e4 <__divdf3+0x758>
    ce2c:	00070413          	mv	s0,a4
    ce30:	409784b3          	sub	s1,a5,s1
    ce34:	00090593          	mv	a1,s2
    ce38:	00048513          	mv	a0,s1
    ce3c:	71d010ef          	jal	ed58 <__hidden___udivsi3>
    ce40:	00050593          	mv	a1,a0
    ce44:	00050b93          	mv	s7,a0
    ce48:	000b0513          	mv	a0,s6
    ce4c:	649010ef          	jal	ec94 <__mulsi3>
    ce50:	00050793          	mv	a5,a0
    ce54:	00090593          	mv	a1,s2
    ce58:	00048513          	mv	a0,s1
    ce5c:	00078493          	mv	s1,a5
    ce60:	741010ef          	jal	eda0 <__umodsi3>
    ce64:	010c1793          	sll	a5,s8,0x10
    ce68:	01051513          	sll	a0,a0,0x10
    ce6c:	0107d793          	srl	a5,a5,0x10
    ce70:	00a7e7b3          	or	a5,a5,a0
    ce74:	0097fa63          	bgeu	a5,s1,ce88 <__divdf3+0x3fc>
    ce78:	00fc87b3          	add	a5,s9,a5
    ce7c:	fffb8713          	add	a4,s7,-1
    ce80:	3597fa63          	bgeu	a5,s9,d1d4 <__divdf3+0x748>
    ce84:	00070b93          	mv	s7,a4
    ce88:	00010337          	lui	t1,0x10
    ce8c:	01041413          	sll	s0,s0,0x10
    ce90:	01746433          	or	s0,s0,s7
    ce94:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    ce98:	01b478b3          	and	a7,s0,s11
    ce9c:	01bafdb3          	and	s11,s5,s11
    cea0:	40978bb3          	sub	s7,a5,s1
    cea4:	010adc13          	srl	s8,s5,0x10
    cea8:	01045793          	srl	a5,s0,0x10
    ceac:	00088513          	mv	a0,a7
    ceb0:	000d8593          	mv	a1,s11
    ceb4:	5e1010ef          	jal	ec94 <__mulsi3>
    ceb8:	00050813          	mv	a6,a0
    cebc:	000c0593          	mv	a1,s8
    cec0:	00088513          	mv	a0,a7
    cec4:	5d1010ef          	jal	ec94 <__mulsi3>
    cec8:	00050893          	mv	a7,a0
    cecc:	000d8593          	mv	a1,s11
    ced0:	00078513          	mv	a0,a5
    ced4:	5c1010ef          	jal	ec94 <__mulsi3>
    ced8:	00050e13          	mv	t3,a0
    cedc:	000c0593          	mv	a1,s8
    cee0:	00078513          	mv	a0,a5
    cee4:	5b1010ef          	jal	ec94 <__mulsi3>
    cee8:	01085793          	srl	a5,a6,0x10
    ceec:	01c888b3          	add	a7,a7,t3
    cef0:	011787b3          	add	a5,a5,a7
    cef4:	01c7f463          	bgeu	a5,t3,cefc <__divdf3+0x470>
    cef8:	00650533          	add	a0,a0,t1
    cefc:	00010637          	lui	a2,0x10
    cf00:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    cf04:	00c7f4b3          	and	s1,a5,a2
    cf08:	0107d693          	srl	a3,a5,0x10
    cf0c:	01049493          	sll	s1,s1,0x10
    cf10:	00c87833          	and	a6,a6,a2
    cf14:	00a687b3          	add	a5,a3,a0
    cf18:	010484b3          	add	s1,s1,a6
    cf1c:	20fbea63          	bltu	s7,a5,d130 <__divdf3+0x6a4>
    cf20:	20fb8663          	beq	s7,a5,d12c <__divdf3+0x6a0>
    cf24:	409d04b3          	sub	s1,s10,s1
    cf28:	40fb8bb3          	sub	s7,s7,a5
    cf2c:	009d3d33          	sltu	s10,s10,s1
    cf30:	41ab8bb3          	sub	s7,s7,s10
    cf34:	377c8a63          	beq	s9,s7,d2a8 <__divdf3+0x81c>
    cf38:	00090593          	mv	a1,s2
    cf3c:	000b8513          	mv	a0,s7
    cf40:	619010ef          	jal	ed58 <__hidden___udivsi3>
    cf44:	00050593          	mv	a1,a0
    cf48:	00a12623          	sw	a0,12(sp)
    cf4c:	00050d13          	mv	s10,a0
    cf50:	000b0513          	mv	a0,s6
    cf54:	541010ef          	jal	ec94 <__mulsi3>
    cf58:	00050793          	mv	a5,a0
    cf5c:	00090593          	mv	a1,s2
    cf60:	000b8513          	mv	a0,s7
    cf64:	00078b93          	mv	s7,a5
    cf68:	639010ef          	jal	eda0 <__umodsi3>
    cf6c:	01051513          	sll	a0,a0,0x10
    cf70:	0104d793          	srl	a5,s1,0x10
    cf74:	00a7e7b3          	or	a5,a5,a0
    cf78:	0377f063          	bgeu	a5,s7,cf98 <__divdf3+0x50c>
    cf7c:	00fc87b3          	add	a5,s9,a5
    cf80:	fffd0693          	add	a3,s10,-1
    cf84:	3797e263          	bltu	a5,s9,d2e8 <__divdf3+0x85c>
    cf88:	3777f063          	bgeu	a5,s7,d2e8 <__divdf3+0x85c>
    cf8c:	ffed0713          	add	a4,s10,-2
    cf90:	00e12623          	sw	a4,12(sp)
    cf94:	019787b3          	add	a5,a5,s9
    cf98:	41778bb3          	sub	s7,a5,s7
    cf9c:	00090593          	mv	a1,s2
    cfa0:	000b8513          	mv	a0,s7
    cfa4:	5b5010ef          	jal	ed58 <__hidden___udivsi3>
    cfa8:	00050593          	mv	a1,a0
    cfac:	00050d13          	mv	s10,a0
    cfb0:	000b0513          	mv	a0,s6
    cfb4:	4e1010ef          	jal	ec94 <__mulsi3>
    cfb8:	00050793          	mv	a5,a0
    cfbc:	00090593          	mv	a1,s2
    cfc0:	000b8513          	mv	a0,s7
    cfc4:	00078913          	mv	s2,a5
    cfc8:	01049493          	sll	s1,s1,0x10
    cfcc:	5d5010ef          	jal	eda0 <__umodsi3>
    cfd0:	01051513          	sll	a0,a0,0x10
    cfd4:	0104d493          	srl	s1,s1,0x10
    cfd8:	00a4e4b3          	or	s1,s1,a0
    cfdc:	0124fe63          	bgeu	s1,s2,cff8 <__divdf3+0x56c>
    cfe0:	009c84b3          	add	s1,s9,s1
    cfe4:	fffd0793          	add	a5,s10,-1
    cfe8:	3194e463          	bltu	s1,s9,d2f0 <__divdf3+0x864>
    cfec:	3124f263          	bgeu	s1,s2,d2f0 <__divdf3+0x864>
    cff0:	ffed0d13          	add	s10,s10,-2
    cff4:	019484b3          	add	s1,s1,s9
    cff8:	00c12783          	lw	a5,12(sp)
    cffc:	412484b3          	sub	s1,s1,s2
    d000:	000d8593          	mv	a1,s11
    d004:	01079813          	sll	a6,a5,0x10
    d008:	01a86833          	or	a6,a6,s10
    d00c:	01081313          	sll	t1,a6,0x10
    d010:	01035313          	srl	t1,t1,0x10
    d014:	01085793          	srl	a5,a6,0x10
    d018:	00030513          	mv	a0,t1
    d01c:	479010ef          	jal	ec94 <__mulsi3>
    d020:	00050893          	mv	a7,a0
    d024:	000c0593          	mv	a1,s8
    d028:	00030513          	mv	a0,t1
    d02c:	469010ef          	jal	ec94 <__mulsi3>
    d030:	00050313          	mv	t1,a0
    d034:	000d8593          	mv	a1,s11
    d038:	00078513          	mv	a0,a5
    d03c:	459010ef          	jal	ec94 <__mulsi3>
    d040:	00050e13          	mv	t3,a0
    d044:	000c0593          	mv	a1,s8
    d048:	00078513          	mv	a0,a5
    d04c:	449010ef          	jal	ec94 <__mulsi3>
    d050:	0108d793          	srl	a5,a7,0x10
    d054:	01c30333          	add	t1,t1,t3
    d058:	006787b3          	add	a5,a5,t1
    d05c:	01c7f663          	bgeu	a5,t3,d068 <__divdf3+0x5dc>
    d060:	00010737          	lui	a4,0x10
    d064:	00e50533          	add	a0,a0,a4
    d068:	000106b7          	lui	a3,0x10
    d06c:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    d070:	0107d713          	srl	a4,a5,0x10
    d074:	00d7f7b3          	and	a5,a5,a3
    d078:	01079793          	sll	a5,a5,0x10
    d07c:	00d8f8b3          	and	a7,a7,a3
    d080:	00a70733          	add	a4,a4,a0
    d084:	011787b3          	add	a5,a5,a7
    d088:	02e4e063          	bltu	s1,a4,d0a8 <__divdf3+0x61c>
    d08c:	00e48c63          	beq	s1,a4,d0a4 <__divdf3+0x618>
    d090:	02412c83          	lw	s9,36(sp)
    d094:	02012d03          	lw	s10,32(sp)
    d098:	01c12d83          	lw	s11,28(sp)
    d09c:	00186813          	or	a6,a6,1
    d0a0:	c61ff06f          	j	cd00 <__divdf3+0x274>
    d0a4:	1c078a63          	beqz	a5,d278 <__divdf3+0x7ec>
    d0a8:	009c84b3          	add	s1,s9,s1
    d0ac:	fff80613          	add	a2,a6,-1
    d0b0:	00048693          	mv	a3,s1
    d0b4:	1b94ec63          	bltu	s1,s9,d26c <__divdf3+0x7e0>
    d0b8:	24e4ea63          	bltu	s1,a4,d30c <__divdf3+0x880>
    d0bc:	26e48863          	beq	s1,a4,d32c <__divdf3+0x8a0>
    d0c0:	00060813          	mv	a6,a2
    d0c4:	fcdff06f          	j	d090 <__divdf3+0x604>
    d0c8:	00100713          	li	a4,1
    d0cc:	b20790e3          	bnez	a5,cbec <__divdf3+0x160>
    d0d0:	41e98793          	add	a5,s3,1054
    d0d4:	00f816b3          	sll	a3,a6,a5
    d0d8:	00d036b3          	snez	a3,a3
    d0dc:	00f417b3          	sll	a5,s0,a5
    d0e0:	00f6e7b3          	or	a5,a3,a5
    d0e4:	00e85833          	srl	a6,a6,a4
    d0e8:	00f86833          	or	a6,a6,a5
    d0ec:	00787793          	and	a5,a6,7
    d0f0:	00e45433          	srl	s0,s0,a4
    d0f4:	02078063          	beqz	a5,d114 <__divdf3+0x688>
    d0f8:	00f87793          	and	a5,a6,15
    d0fc:	00400713          	li	a4,4
    d100:	00e78a63          	beq	a5,a4,d114 <__divdf3+0x688>
    d104:	00480793          	add	a5,a6,4
    d108:	0107b833          	sltu	a6,a5,a6
    d10c:	01040433          	add	s0,s0,a6
    d110:	00078813          	mv	a6,a5
    d114:	00841613          	sll	a2,s0,0x8
    d118:	00100793          	li	a5,1
    d11c:	00000693          	li	a3,0
    d120:	00000713          	li	a4,0
    d124:	ae0640e3          	bltz	a2,cc04 <__divdf3+0x178>
    d128:	1280006f          	j	d250 <__divdf3+0x7c4>
    d12c:	de9d7ce3          	bgeu	s10,s1,cf24 <__divdf3+0x498>
    d130:	015d06b3          	add	a3,s10,s5
    d134:	01a6b633          	sltu	a2,a3,s10
    d138:	019605b3          	add	a1,a2,s9
    d13c:	00bb8bb3          	add	s7,s7,a1
    d140:	00068d13          	mv	s10,a3
    d144:	fff40593          	add	a1,s0,-1
    d148:	077cfe63          	bgeu	s9,s7,d1c4 <__divdf3+0x738>
    d14c:	14fbe063          	bltu	s7,a5,d28c <__divdf3+0x800>
    d150:	13778c63          	beq	a5,s7,d288 <__divdf3+0x7fc>
    d154:	00058413          	mv	s0,a1
    d158:	dcdff06f          	j	cf24 <__divdf3+0x498>
    d15c:	c50bece3          	bltu	s7,a6,cdb4 <__divdf3+0x328>
    d160:	01fb1c13          	sll	s8,s6,0x1f
    d164:	001bd713          	srl	a4,s7,0x1
    d168:	001b5493          	srl	s1,s6,0x1
    d16c:	00ec6c33          	or	s8,s8,a4
    d170:	01fb9d13          	sll	s10,s7,0x1f
    d174:	c51ff06f          	j	cdc4 <__divdf3+0x338>
    d178:	000a0513          	mv	a0,s4
    d17c:	489010ef          	jal	ee04 <__clzsi2>
    d180:	01550693          	add	a3,a0,21
    d184:	01c00713          	li	a4,28
    d188:	02050793          	add	a5,a0,32
    d18c:	a2d75ae3          	bge	a4,a3,cbc0 <__divdf3+0x134>
    d190:	ff850513          	add	a0,a0,-8
    d194:	00000813          	li	a6,0
    d198:	00aa1433          	sll	s0,s4,a0
    d19c:	a41ff06f          	j	cbdc <__divdf3+0x150>
    d1a0:	465010ef          	jal	ee04 <__clzsi2>
    d1a4:	01550793          	add	a5,a0,21
    d1a8:	01c00693          	li	a3,28
    d1ac:	02050713          	add	a4,a0,32
    d1b0:	acf6dee3          	bge	a3,a5,cc8c <__divdf3+0x200>
    d1b4:	ff850493          	add	s1,a0,-8
    d1b8:	00941b33          	sll	s6,s0,s1
    d1bc:	00000b93          	li	s7,0
    d1c0:	ae9ff06f          	j	cca8 <__divdf3+0x21c>
    d1c4:	f97c98e3          	bne	s9,s7,d154 <__divdf3+0x6c8>
    d1c8:	f80602e3          	beqz	a2,d14c <__divdf3+0x6c0>
    d1cc:	00058413          	mv	s0,a1
    d1d0:	d55ff06f          	j	cf24 <__divdf3+0x498>
    d1d4:	ca97f8e3          	bgeu	a5,s1,ce84 <__divdf3+0x3f8>
    d1d8:	ffeb8b93          	add	s7,s7,-2
    d1dc:	019787b3          	add	a5,a5,s9
    d1e0:	ca9ff06f          	j	ce88 <__divdf3+0x3fc>
    d1e4:	c497f4e3          	bgeu	a5,s1,ce2c <__divdf3+0x3a0>
    d1e8:	ffe40413          	add	s0,s0,-2
    d1ec:	019787b3          	add	a5,a5,s9
    d1f0:	c41ff06f          	j	ce30 <__divdf3+0x3a4>
    d1f4:	01f00693          	li	a3,31
    d1f8:	ece6dce3          	bge	a3,a4,d0d0 <__divdf3+0x644>
    d1fc:	fe100693          	li	a3,-31
    d200:	40f686b3          	sub	a3,a3,a5
    d204:	02000793          	li	a5,32
    d208:	00d456b3          	srl	a3,s0,a3
    d20c:	00f70863          	beq	a4,a5,d21c <__divdf3+0x790>
    d210:	43e98793          	add	a5,s3,1086
    d214:	00f417b3          	sll	a5,s0,a5
    d218:	00f86833          	or	a6,a6,a5
    d21c:	01003833          	snez	a6,a6
    d220:	00d86833          	or	a6,a6,a3
    d224:	00787713          	and	a4,a6,7
    d228:	00000693          	li	a3,0
    d22c:	02070863          	beqz	a4,d25c <__divdf3+0x7d0>
    d230:	00f87793          	and	a5,a6,15
    d234:	00400713          	li	a4,4
    d238:	00000413          	li	s0,0
    d23c:	00e78a63          	beq	a5,a4,d250 <__divdf3+0x7c4>
    d240:	00480793          	add	a5,a6,4
    d244:	0107b833          	sltu	a6,a5,a6
    d248:	01003433          	snez	s0,a6
    d24c:	00078813          	mv	a6,a5
    d250:	00941693          	sll	a3,s0,0x9
    d254:	01d41713          	sll	a4,s0,0x1d
    d258:	00c6d693          	srl	a3,a3,0xc
    d25c:	00385813          	srl	a6,a6,0x3
    d260:	00e86733          	or	a4,a6,a4
    d264:	00000793          	li	a5,0
    d268:	99dff06f          	j	cc04 <__divdf3+0x178>
    d26c:	00060813          	mv	a6,a2
    d270:	e2e690e3          	bne	a3,a4,d090 <__divdf3+0x604>
    d274:	e1579ee3          	bne	a5,s5,d090 <__divdf3+0x604>
    d278:	02412c83          	lw	s9,36(sp)
    d27c:	02012d03          	lw	s10,32(sp)
    d280:	01c12d83          	lw	s11,28(sp)
    d284:	a7dff06f          	j	cd00 <__divdf3+0x274>
    d288:	ec96f6e3          	bgeu	a3,s1,d154 <__divdf3+0x6c8>
    d28c:	00da86b3          	add	a3,s5,a3
    d290:	0156b633          	sltu	a2,a3,s5
    d294:	01960633          	add	a2,a2,s9
    d298:	ffe40413          	add	s0,s0,-2
    d29c:	00068d13          	mv	s10,a3
    d2a0:	00cb8bb3          	add	s7,s7,a2
    d2a4:	c81ff06f          	j	cf24 <__divdf3+0x498>
    d2a8:	c0200713          	li	a4,-1022
    d2ac:	02412c83          	lw	s9,36(sp)
    d2b0:	02012d03          	lw	s10,32(sp)
    d2b4:	01c12d83          	lw	s11,28(sp)
    d2b8:	3ff98793          	add	a5,s3,1023
    d2bc:	fff00813          	li	a6,-1
    d2c0:	e0e9c4e3          	blt	s3,a4,d0c8 <__divdf3+0x63c>
    d2c4:	00480713          	add	a4,a6,4
    d2c8:	01073833          	sltu	a6,a4,a6
    d2cc:	01040433          	add	s0,s0,a6
    d2d0:	00070813          	mv	a6,a4
    d2d4:	a3dff06f          	j	cd10 <__divdf3+0x284>
    d2d8:	00f87713          	and	a4,a6,15
    d2dc:	00400693          	li	a3,4
    d2e0:	a2d708e3          	beq	a4,a3,cd10 <__divdf3+0x284>
    d2e4:	fe1ff06f          	j	d2c4 <__divdf3+0x838>
    d2e8:	00d12623          	sw	a3,12(sp)
    d2ec:	cadff06f          	j	cf98 <__divdf3+0x50c>
    d2f0:	00078d13          	mv	s10,a5
    d2f4:	d05ff06f          	j	cff8 <__divdf3+0x56c>
    d2f8:	00090a13          	mv	s4,s2
    d2fc:	7ff00793          	li	a5,2047
    d300:	00000693          	li	a3,0
    d304:	00000713          	li	a4,0
    d308:	8fdff06f          	j	cc04 <__divdf3+0x178>
    d30c:	001a9613          	sll	a2,s5,0x1
    d310:	015636b3          	sltu	a3,a2,s5
    d314:	019686b3          	add	a3,a3,s9
    d318:	00d486b3          	add	a3,s1,a3
    d31c:	ffe80813          	add	a6,a6,-2
    d320:	00060a93          	mv	s5,a2
    d324:	f4e688e3          	beq	a3,a4,d274 <__divdf3+0x7e8>
    d328:	d69ff06f          	j	d090 <__divdf3+0x604>
    d32c:	fefae0e3          	bltu	s5,a5,d30c <__divdf3+0x880>
    d330:	00060813          	mv	a6,a2
    d334:	f41ff06f          	j	d274 <__divdf3+0x7e8>

0000d338 <__eqdf2>:
    d338:	0145d713          	srl	a4,a1,0x14
    d33c:	001007b7          	lui	a5,0x100
    d340:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d344:	0146d813          	srl	a6,a3,0x14
    d348:	7ff77713          	and	a4,a4,2047
    d34c:	7ff00313          	li	t1,2047
    d350:	00b7fe33          	and	t3,a5,a1
    d354:	00050893          	mv	a7,a0
    d358:	00d7f7b3          	and	a5,a5,a3
    d35c:	01f5d593          	srl	a1,a1,0x1f
    d360:	7ff87813          	and	a6,a6,2047
    d364:	01f6d693          	srl	a3,a3,0x1f
    d368:	00100513          	li	a0,1
    d36c:	00670c63          	beq	a4,t1,d384 <__eqdf2+0x4c>
    d370:	00680863          	beq	a6,t1,d380 <__eqdf2+0x48>
    d374:	01071463          	bne	a4,a6,d37c <__eqdf2+0x44>
    d378:	02fe0663          	beq	t3,a5,d3a4 <__eqdf2+0x6c>
    d37c:	00008067          	ret
    d380:	00008067          	ret
    d384:	fee81ce3          	bne	a6,a4,d37c <__eqdf2+0x44>
    d388:	00fe67b3          	or	a5,t3,a5
    d38c:	00c7e7b3          	or	a5,a5,a2
    d390:	0117e7b3          	or	a5,a5,a7
    d394:	fe0794e3          	bnez	a5,d37c <__eqdf2+0x44>
    d398:	40d585b3          	sub	a1,a1,a3
    d39c:	00b03533          	snez	a0,a1
    d3a0:	00008067          	ret
    d3a4:	fcc89ce3          	bne	a7,a2,d37c <__eqdf2+0x44>
    d3a8:	00d58a63          	beq	a1,a3,d3bc <__eqdf2+0x84>
    d3ac:	fc0718e3          	bnez	a4,d37c <__eqdf2+0x44>
    d3b0:	011e6e33          	or	t3,t3,a7
    d3b4:	01c03533          	snez	a0,t3
    d3b8:	00008067          	ret
    d3bc:	00000513          	li	a0,0
    d3c0:	00008067          	ret

0000d3c4 <__gedf2>:
    d3c4:	0145d893          	srl	a7,a1,0x14
    d3c8:	001007b7          	lui	a5,0x100
    d3cc:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d3d0:	0146d713          	srl	a4,a3,0x14
    d3d4:	7ff8f893          	and	a7,a7,2047
    d3d8:	7ff00e13          	li	t3,2047
    d3dc:	00b7f333          	and	t1,a5,a1
    d3e0:	00050813          	mv	a6,a0
    d3e4:	00050e93          	mv	t4,a0
    d3e8:	00d7f7b3          	and	a5,a5,a3
    d3ec:	01f5d593          	srl	a1,a1,0x1f
    d3f0:	00060f13          	mv	t5,a2
    d3f4:	7ff77513          	and	a0,a4,2047
    d3f8:	01f6d693          	srl	a3,a3,0x1f
    d3fc:	05c88863          	beq	a7,t3,d44c <__gedf2+0x88>
    d400:	03c50463          	beq	a0,t3,d428 <__gedf2+0x64>
    d404:	06089a63          	bnez	a7,d478 <__gedf2+0xb4>
    d408:	01036833          	or	a6,t1,a6
    d40c:	06051063          	bnez	a0,d46c <__gedf2+0xa8>
    d410:	00c7e633          	or	a2,a5,a2
    d414:	08060c63          	beqz	a2,d4ac <__gedf2+0xe8>
    d418:	0a081263          	bnez	a6,d4bc <__gedf2+0xf8>
    d41c:	00100513          	li	a0,1
    d420:	08068263          	beqz	a3,d4a4 <__gedf2+0xe0>
    d424:	00008067          	ret
    d428:	00c7e633          	or	a2,a5,a2
    d42c:	08061463          	bnez	a2,d4b4 <__gedf2+0xf0>
    d430:	00089663          	bnez	a7,d43c <__gedf2+0x78>
    d434:	01036333          	or	t1,t1,a6
    d438:	fe0302e3          	beqz	t1,d41c <__gedf2+0x58>
    d43c:	06d58063          	beq	a1,a3,d49c <__gedf2+0xd8>
    d440:	06059263          	bnez	a1,d4a4 <__gedf2+0xe0>
    d444:	00100513          	li	a0,1
    d448:	00008067          	ret
    d44c:	01036333          	or	t1,t1,a6
    d450:	06031263          	bnez	t1,d4b4 <__gedf2+0xf0>
    d454:	ff1516e3          	bne	a0,a7,d440 <__gedf2+0x7c>
    d458:	00c7e7b3          	or	a5,a5,a2
    d45c:	04079c63          	bnez	a5,d4b4 <__gedf2+0xf0>
    d460:	fed590e3          	bne	a1,a3,d440 <__gedf2+0x7c>
    d464:	00000513          	li	a0,0
    d468:	00008067          	ret
    d46c:	fa0808e3          	beqz	a6,d41c <__gedf2+0x58>
    d470:	fcd598e3          	bne	a1,a3,d440 <__gedf2+0x7c>
    d474:	0280006f          	j	d49c <__gedf2+0xd8>
    d478:	fc0504e3          	beqz	a0,d440 <__gedf2+0x7c>
    d47c:	fcd592e3          	bne	a1,a3,d440 <__gedf2+0x7c>
    d480:	fd1540e3          	blt	a0,a7,d440 <__gedf2+0x7c>
    d484:	00a8cc63          	blt	a7,a0,d49c <__gedf2+0xd8>
    d488:	fa67ece3          	bltu	a5,t1,d440 <__gedf2+0x7c>
    d48c:	00f31863          	bne	t1,a5,d49c <__gedf2+0xd8>
    d490:	fbdf68e3          	bltu	t5,t4,d440 <__gedf2+0x7c>
    d494:	00000513          	li	a0,0
    d498:	f9eef6e3          	bgeu	t4,t5,d424 <__gedf2+0x60>
    d49c:	00100513          	li	a0,1
    d4a0:	f80592e3          	bnez	a1,d424 <__gedf2+0x60>
    d4a4:	fff00513          	li	a0,-1
    d4a8:	00008067          	ret
    d4ac:	f8081ae3          	bnez	a6,d440 <__gedf2+0x7c>
    d4b0:	00008067          	ret
    d4b4:	ffe00513          	li	a0,-2
    d4b8:	00008067          	ret
    d4bc:	fcd586e3          	beq	a1,a3,d488 <__gedf2+0xc4>
    d4c0:	f81ff06f          	j	d440 <__gedf2+0x7c>

0000d4c4 <__ledf2>:
    d4c4:	0145d893          	srl	a7,a1,0x14
    d4c8:	001007b7          	lui	a5,0x100
    d4cc:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d4d0:	0146d713          	srl	a4,a3,0x14
    d4d4:	7ff8f893          	and	a7,a7,2047
    d4d8:	7ff00313          	li	t1,2047
    d4dc:	00b7fe33          	and	t3,a5,a1
    d4e0:	00050813          	mv	a6,a0
    d4e4:	00050e93          	mv	t4,a0
    d4e8:	00d7f7b3          	and	a5,a5,a3
    d4ec:	01f5d593          	srl	a1,a1,0x1f
    d4f0:	00060f13          	mv	t5,a2
    d4f4:	7ff77513          	and	a0,a4,2047
    d4f8:	01f6d693          	srl	a3,a3,0x1f
    d4fc:	04688a63          	beq	a7,t1,d550 <__ledf2+0x8c>
    d500:	02650463          	beq	a0,t1,d528 <__ledf2+0x64>
    d504:	06089863          	bnez	a7,d574 <__ledf2+0xb0>
    d508:	010e6833          	or	a6,t3,a6
    d50c:	08051e63          	bnez	a0,d5a8 <__ledf2+0xe4>
    d510:	00c7e633          	or	a2,a5,a2
    d514:	0a060463          	beqz	a2,d5bc <__ledf2+0xf8>
    d518:	0a081663          	bnez	a6,d5c4 <__ledf2+0x100>
    d51c:	00100513          	li	a0,1
    d520:	08068063          	beqz	a3,d5a0 <__ledf2+0xdc>
    d524:	00008067          	ret
    d528:	00c7e633          	or	a2,a5,a2
    d52c:	00200513          	li	a0,2
    d530:	fe061ae3          	bnez	a2,d524 <__ledf2+0x60>
    d534:	00089663          	bnez	a7,d540 <__ledf2+0x7c>
    d538:	010e6e33          	or	t3,t3,a6
    d53c:	fe0e00e3          	beqz	t3,d51c <__ledf2+0x58>
    d540:	04d58c63          	beq	a1,a3,d598 <__ledf2+0xd4>
    d544:	04059e63          	bnez	a1,d5a0 <__ledf2+0xdc>
    d548:	00100513          	li	a0,1
    d54c:	00008067          	ret
    d550:	010e6e33          	or	t3,t3,a6
    d554:	060e1063          	bnez	t3,d5b4 <__ledf2+0xf0>
    d558:	ff1516e3          	bne	a0,a7,d544 <__ledf2+0x80>
    d55c:	00c7e7b3          	or	a5,a5,a2
    d560:	00200513          	li	a0,2
    d564:	fc0790e3          	bnez	a5,d524 <__ledf2+0x60>
    d568:	fcd59ee3          	bne	a1,a3,d544 <__ledf2+0x80>
    d56c:	00000513          	li	a0,0
    d570:	00008067          	ret
    d574:	fc0508e3          	beqz	a0,d544 <__ledf2+0x80>
    d578:	fcd596e3          	bne	a1,a3,d544 <__ledf2+0x80>
    d57c:	fd1544e3          	blt	a0,a7,d544 <__ledf2+0x80>
    d580:	00a8cc63          	blt	a7,a0,d598 <__ledf2+0xd4>
    d584:	fdc7e0e3          	bltu	a5,t3,d544 <__ledf2+0x80>
    d588:	00fe1863          	bne	t3,a5,d598 <__ledf2+0xd4>
    d58c:	fbdf6ce3          	bltu	t5,t4,d544 <__ledf2+0x80>
    d590:	00000513          	li	a0,0
    d594:	f9eef8e3          	bgeu	t4,t5,d524 <__ledf2+0x60>
    d598:	00100513          	li	a0,1
    d59c:	f80594e3          	bnez	a1,d524 <__ledf2+0x60>
    d5a0:	fff00513          	li	a0,-1
    d5a4:	00008067          	ret
    d5a8:	f6080ae3          	beqz	a6,d51c <__ledf2+0x58>
    d5ac:	f8d59ce3          	bne	a1,a3,d544 <__ledf2+0x80>
    d5b0:	fe9ff06f          	j	d598 <__ledf2+0xd4>
    d5b4:	00200513          	li	a0,2
    d5b8:	00008067          	ret
    d5bc:	f80814e3          	bnez	a6,d544 <__ledf2+0x80>
    d5c0:	00008067          	ret
    d5c4:	fcd580e3          	beq	a1,a3,d584 <__ledf2+0xc0>
    d5c8:	f7dff06f          	j	d544 <__ledf2+0x80>

0000d5cc <__muldf3>:
    d5cc:	fd010113          	add	sp,sp,-48
    d5d0:	0145d793          	srl	a5,a1,0x14
    d5d4:	02812423          	sw	s0,40(sp)
    d5d8:	02912223          	sw	s1,36(sp)
    d5dc:	03212023          	sw	s2,32(sp)
    d5e0:	01312e23          	sw	s3,28(sp)
    d5e4:	01512a23          	sw	s5,20(sp)
    d5e8:	00c59493          	sll	s1,a1,0xc
    d5ec:	02112623          	sw	ra,44(sp)
    d5f0:	01412c23          	sw	s4,24(sp)
    d5f4:	01612823          	sw	s6,16(sp)
    d5f8:	01712623          	sw	s7,12(sp)
    d5fc:	01812423          	sw	s8,8(sp)
    d600:	7ff7f793          	and	a5,a5,2047
    d604:	00050413          	mv	s0,a0
    d608:	00060a93          	mv	s5,a2
    d60c:	00068993          	mv	s3,a3
    d610:	00c4d493          	srl	s1,s1,0xc
    d614:	01f5d913          	srl	s2,a1,0x1f
    d618:	4e078063          	beqz	a5,daf8 <__muldf3+0x52c>
    d61c:	7ff00713          	li	a4,2047
    d620:	0ae78663          	beq	a5,a4,d6cc <__muldf3+0x100>
    d624:	00349693          	sll	a3,s1,0x3
    d628:	01d55713          	srl	a4,a0,0x1d
    d62c:	00d76733          	or	a4,a4,a3
    d630:	008006b7          	lui	a3,0x800
    d634:	00d764b3          	or	s1,a4,a3
    d638:	00351a13          	sll	s4,a0,0x3
    d63c:	c0178c13          	add	s8,a5,-1023
    d640:	00000b13          	li	s6,0
    d644:	00000b93          	li	s7,0
    d648:	0149d793          	srl	a5,s3,0x14
    d64c:	00c99713          	sll	a4,s3,0xc
    d650:	7ff7f793          	and	a5,a5,2047
    d654:	000a8e13          	mv	t3,s5
    d658:	00c75413          	srl	s0,a4,0xc
    d65c:	01f9d993          	srl	s3,s3,0x1f
    d660:	0a078063          	beqz	a5,d700 <__muldf3+0x134>
    d664:	7ff00713          	li	a4,2047
    d668:	14e78e63          	beq	a5,a4,d7c4 <__muldf3+0x1f8>
    d66c:	00341713          	sll	a4,s0,0x3
    d670:	01dad693          	srl	a3,s5,0x1d
    d674:	00e6e6b3          	or	a3,a3,a4
    d678:	c0178793          	add	a5,a5,-1023
    d67c:	00800737          	lui	a4,0x800
    d680:	00e6e433          	or	s0,a3,a4
    d684:	003a9e13          	sll	t3,s5,0x3
    d688:	01878333          	add	t1,a5,s8
    d68c:	00000693          	li	a3,0
    d690:	00a00793          	li	a5,10
    d694:	00130893          	add	a7,t1,1
    d698:	0b67cc63          	blt	a5,s6,d750 <__muldf3+0x184>
    d69c:	013945b3          	xor	a1,s2,s3
    d6a0:	00200793          	li	a5,2
    d6a4:	00058813          	mv	a6,a1
    d6a8:	1567c663          	blt	a5,s6,d7f4 <__muldf3+0x228>
    d6ac:	fffb0b13          	add	s6,s6,-1
    d6b0:	00100713          	li	a4,1
    d6b4:	17676063          	bltu	a4,s6,d814 <__muldf3+0x248>
    d6b8:	48f68663          	beq	a3,a5,db44 <__muldf3+0x578>
    d6bc:	00040493          	mv	s1,s0
    d6c0:	000e0a13          	mv	s4,t3
    d6c4:	00068b93          	mv	s7,a3
    d6c8:	09c0006f          	j	d764 <__muldf3+0x198>
    d6cc:	00a4ea33          	or	s4,s1,a0
    d6d0:	480a1463          	bnez	s4,db58 <__muldf3+0x58c>
    d6d4:	0149d793          	srl	a5,s3,0x14
    d6d8:	00c99713          	sll	a4,s3,0xc
    d6dc:	7ff7f793          	and	a5,a5,2047
    d6e0:	00000493          	li	s1,0
    d6e4:	00800b13          	li	s6,8
    d6e8:	7ff00c13          	li	s8,2047
    d6ec:	00200b93          	li	s7,2
    d6f0:	000a8e13          	mv	t3,s5
    d6f4:	00c75413          	srl	s0,a4,0xc
    d6f8:	01f9d993          	srl	s3,s3,0x1f
    d6fc:	f60794e3          	bnez	a5,d664 <__muldf3+0x98>
    d700:	015467b3          	or	a5,s0,s5
    d704:	46078e63          	beqz	a5,db80 <__muldf3+0x5b4>
    d708:	54040c63          	beqz	s0,dc60 <__muldf3+0x694>
    d70c:	00040513          	mv	a0,s0
    d710:	6f4010ef          	jal	ee04 <__clzsi2>
    d714:	00050313          	mv	t1,a0
    d718:	ff550713          	add	a4,a0,-11
    d71c:	01d00793          	li	a5,29
    d720:	ff830e13          	add	t3,t1,-8
    d724:	40e787b3          	sub	a5,a5,a4
    d728:	00fad7b3          	srl	a5,s5,a5
    d72c:	01c41733          	sll	a4,s0,t3
    d730:	00e7e433          	or	s0,a5,a4
    d734:	01ca9e33          	sll	t3,s5,t3
    d738:	406c0333          	sub	t1,s8,t1
    d73c:	c0d30313          	add	t1,t1,-1011
    d740:	00a00793          	li	a5,10
    d744:	00000693          	li	a3,0
    d748:	00130893          	add	a7,t1,1
    d74c:	f567d8e3          	bge	a5,s6,d69c <__muldf3+0xd0>
    d750:	00090593          	mv	a1,s2
    d754:	00200793          	li	a5,2
    d758:	3efb8663          	beq	s7,a5,db44 <__muldf3+0x578>
    d75c:	00300793          	li	a5,3
    d760:	54fb8863          	beq	s7,a5,dcb0 <__muldf3+0x6e4>
    d764:	00100793          	li	a5,1
    d768:	00058813          	mv	a6,a1
    d76c:	52fb9663          	bne	s7,a5,dc98 <__muldf3+0x6cc>
    d770:	00000793          	li	a5,0
    d774:	00000693          	li	a3,0
    d778:	00000713          	li	a4,0
    d77c:	02c12083          	lw	ra,44(sp)
    d780:	02812403          	lw	s0,40(sp)
    d784:	01479793          	sll	a5,a5,0x14
    d788:	00d7e7b3          	or	a5,a5,a3
    d78c:	01f81813          	sll	a6,a6,0x1f
    d790:	0107e7b3          	or	a5,a5,a6
    d794:	02412483          	lw	s1,36(sp)
    d798:	02012903          	lw	s2,32(sp)
    d79c:	01c12983          	lw	s3,28(sp)
    d7a0:	01812a03          	lw	s4,24(sp)
    d7a4:	01412a83          	lw	s5,20(sp)
    d7a8:	01012b03          	lw	s6,16(sp)
    d7ac:	00c12b83          	lw	s7,12(sp)
    d7b0:	00812c03          	lw	s8,8(sp)
    d7b4:	00070513          	mv	a0,a4
    d7b8:	00078593          	mv	a1,a5
    d7bc:	03010113          	add	sp,sp,48
    d7c0:	00008067          	ret
    d7c4:	01546733          	or	a4,s0,s5
    d7c8:	7ffc0313          	add	t1,s8,2047
    d7cc:	3c070663          	beqz	a4,db98 <__muldf3+0x5cc>
    d7d0:	00001737          	lui	a4,0x1
    d7d4:	01394833          	xor	a6,s2,s3
    d7d8:	80070713          	add	a4,a4,-2048 # 800 <main+0x4d0>
    d7dc:	003b6b13          	or	s6,s6,3
    d7e0:	00a00693          	li	a3,10
    d7e4:	00080593          	mv	a1,a6
    d7e8:	00ec08b3          	add	a7,s8,a4
    d7ec:	4366cc63          	blt	a3,s6,dc24 <__muldf3+0x658>
    d7f0:	00300693          	li	a3,3
    d7f4:	00100613          	li	a2,1
    d7f8:	01661633          	sll	a2,a2,s6
    d7fc:	53067713          	and	a4,a2,1328
    d800:	f4071ae3          	bnez	a4,d754 <__muldf3+0x188>
    d804:	24067793          	and	a5,a2,576
    d808:	48079063          	bnez	a5,dc88 <__muldf3+0x6bc>
    d80c:	08867613          	and	a2,a2,136
    d810:	38061e63          	bnez	a2,dbac <__muldf3+0x5e0>
    d814:	00010fb7          	lui	t6,0x10
    d818:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    d81c:	005a7f33          	and	t5,s4,t0
    d820:	005e72b3          	and	t0,t3,t0
    d824:	010a5a13          	srl	s4,s4,0x10
    d828:	010e5e13          	srl	t3,t3,0x10
    d82c:	000f0513          	mv	a0,t5
    d830:	00028593          	mv	a1,t0
    d834:	460010ef          	jal	ec94 <__mulsi3>
    d838:	00050713          	mv	a4,a0
    d83c:	000e0593          	mv	a1,t3
    d840:	000f0513          	mv	a0,t5
    d844:	450010ef          	jal	ec94 <__mulsi3>
    d848:	00050793          	mv	a5,a0
    d84c:	00028593          	mv	a1,t0
    d850:	000a0513          	mv	a0,s4
    d854:	440010ef          	jal	ec94 <__mulsi3>
    d858:	00050e93          	mv	t4,a0
    d85c:	000e0593          	mv	a1,t3
    d860:	000a0513          	mv	a0,s4
    d864:	430010ef          	jal	ec94 <__mulsi3>
    d868:	01d786b3          	add	a3,a5,t4
    d86c:	01075393          	srl	t2,a4,0x10
    d870:	00d383b3          	add	t2,t2,a3
    d874:	00050793          	mv	a5,a0
    d878:	01d3f463          	bgeu	t2,t4,d880 <__muldf3+0x2b4>
    d87c:	01f507b3          	add	a5,a0,t6
    d880:	000109b7          	lui	s3,0x10
    d884:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    d888:	0123feb3          	and	t4,t2,s2
    d88c:	01277733          	and	a4,a4,s2
    d890:	010e9e93          	sll	t4,t4,0x10
    d894:	01247933          	and	s2,s0,s2
    d898:	0103d393          	srl	t2,t2,0x10
    d89c:	00ee8eb3          	add	t4,t4,a4
    d8a0:	01045413          	srl	s0,s0,0x10
    d8a4:	000f0513          	mv	a0,t5
    d8a8:	00090593          	mv	a1,s2
    d8ac:	3e8010ef          	jal	ec94 <__mulsi3>
    d8b0:	00050f93          	mv	t6,a0
    d8b4:	00040593          	mv	a1,s0
    d8b8:	000f0513          	mv	a0,t5
    d8bc:	3d8010ef          	jal	ec94 <__mulsi3>
    d8c0:	00050713          	mv	a4,a0
    d8c4:	00090593          	mv	a1,s2
    d8c8:	000a0513          	mv	a0,s4
    d8cc:	3c8010ef          	jal	ec94 <__mulsi3>
    d8d0:	00050f13          	mv	t5,a0
    d8d4:	00040593          	mv	a1,s0
    d8d8:	000a0513          	mv	a0,s4
    d8dc:	3b8010ef          	jal	ec94 <__mulsi3>
    d8e0:	010fd693          	srl	a3,t6,0x10
    d8e4:	01e70733          	add	a4,a4,t5
    d8e8:	00e686b3          	add	a3,a3,a4
    d8ec:	01e6f463          	bgeu	a3,t5,d8f4 <__muldf3+0x328>
    d8f0:	01350533          	add	a0,a0,s3
    d8f4:	00010a37          	lui	s4,0x10
    d8f8:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    d8fc:	01e6f733          	and	a4,a3,t5
    d900:	01efffb3          	and	t6,t6,t5
    d904:	01071713          	sll	a4,a4,0x10
    d908:	01f70733          	add	a4,a4,t6
    d90c:	01e4ff33          	and	t5,s1,t5
    d910:	0106d693          	srl	a3,a3,0x10
    d914:	00a68fb3          	add	t6,a3,a0
    d918:	00e383b3          	add	t2,t2,a4
    d91c:	0104d493          	srl	s1,s1,0x10
    d920:	000f0513          	mv	a0,t5
    d924:	00028593          	mv	a1,t0
    d928:	36c010ef          	jal	ec94 <__mulsi3>
    d92c:	00050a93          	mv	s5,a0
    d930:	000e0593          	mv	a1,t3
    d934:	000f0513          	mv	a0,t5
    d938:	35c010ef          	jal	ec94 <__mulsi3>
    d93c:	00050993          	mv	s3,a0
    d940:	00028593          	mv	a1,t0
    d944:	00048513          	mv	a0,s1
    d948:	34c010ef          	jal	ec94 <__mulsi3>
    d94c:	00050293          	mv	t0,a0
    d950:	000e0593          	mv	a1,t3
    d954:	00048513          	mv	a0,s1
    d958:	33c010ef          	jal	ec94 <__mulsi3>
    d95c:	010ad613          	srl	a2,s5,0x10
    d960:	005989b3          	add	s3,s3,t0
    d964:	01360633          	add	a2,a2,s3
    d968:	00567463          	bgeu	a2,t0,d970 <__muldf3+0x3a4>
    d96c:	01450533          	add	a0,a0,s4
    d970:	00010a37          	lui	s4,0x10
    d974:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    d978:	00d672b3          	and	t0,a2,a3
    d97c:	00dafab3          	and	s5,s5,a3
    d980:	01065613          	srl	a2,a2,0x10
    d984:	01029293          	sll	t0,t0,0x10
    d988:	00a60e33          	add	t3,a2,a0
    d98c:	015282b3          	add	t0,t0,s5
    d990:	000f0513          	mv	a0,t5
    d994:	00090593          	mv	a1,s2
    d998:	2fc010ef          	jal	ec94 <__mulsi3>
    d99c:	00050993          	mv	s3,a0
    d9a0:	00040593          	mv	a1,s0
    d9a4:	000f0513          	mv	a0,t5
    d9a8:	2ec010ef          	jal	ec94 <__mulsi3>
    d9ac:	00050f13          	mv	t5,a0
    d9b0:	00090593          	mv	a1,s2
    d9b4:	00048513          	mv	a0,s1
    d9b8:	2dc010ef          	jal	ec94 <__mulsi3>
    d9bc:	00050913          	mv	s2,a0
    d9c0:	00040593          	mv	a1,s0
    d9c4:	00048513          	mv	a0,s1
    d9c8:	2cc010ef          	jal	ec94 <__mulsi3>
    d9cc:	012f06b3          	add	a3,t5,s2
    d9d0:	0109d593          	srl	a1,s3,0x10
    d9d4:	00d58433          	add	s0,a1,a3
    d9d8:	00050f13          	mv	t5,a0
    d9dc:	01247463          	bgeu	s0,s2,d9e4 <__muldf3+0x418>
    d9e0:	01450f33          	add	t5,a0,s4
    d9e4:	00010637          	lui	a2,0x10
    d9e8:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x58f>
    d9ec:	00c476b3          	and	a3,s0,a2
    d9f0:	00c9f9b3          	and	s3,s3,a2
    d9f4:	01069693          	sll	a3,a3,0x10
    d9f8:	007787b3          	add	a5,a5,t2
    d9fc:	013686b3          	add	a3,a3,s3
    da00:	01f685b3          	add	a1,a3,t6
    da04:	00e7b733          	sltu	a4,a5,a4
    da08:	00e58733          	add	a4,a1,a4
    da0c:	005782b3          	add	t0,a5,t0
    da10:	01c70633          	add	a2,a4,t3
    da14:	00f2b7b3          	sltu	a5,t0,a5
    da18:	00f607b3          	add	a5,a2,a5
    da1c:	00d5b6b3          	sltu	a3,a1,a3
    da20:	00b735b3          	sltu	a1,a4,a1
    da24:	00b6e6b3          	or	a3,a3,a1
    da28:	00e63733          	sltu	a4,a2,a4
    da2c:	01045593          	srl	a1,s0,0x10
    da30:	00c7b633          	sltu	a2,a5,a2
    da34:	00b686b3          	add	a3,a3,a1
    da38:	00929a13          	sll	s4,t0,0x9
    da3c:	00c76733          	or	a4,a4,a2
    da40:	00d70733          	add	a4,a4,a3
    da44:	01da6a33          	or	s4,s4,t4
    da48:	01e70733          	add	a4,a4,t5
    da4c:	01403a33          	snez	s4,s4
    da50:	0172d293          	srl	t0,t0,0x17
    da54:	00971713          	sll	a4,a4,0x9
    da58:	0177d693          	srl	a3,a5,0x17
    da5c:	005a6a33          	or	s4,s4,t0
    da60:	00979793          	sll	a5,a5,0x9
    da64:	00fa6a33          	or	s4,s4,a5
    da68:	00771793          	sll	a5,a4,0x7
    da6c:	00d764b3          	or	s1,a4,a3
    da70:	0207d063          	bgez	a5,da90 <__muldf3+0x4c4>
    da74:	001a5793          	srl	a5,s4,0x1
    da78:	001a7a13          	and	s4,s4,1
    da7c:	01f49713          	sll	a4,s1,0x1f
    da80:	0147e7b3          	or	a5,a5,s4
    da84:	00e7ea33          	or	s4,a5,a4
    da88:	0014d493          	srl	s1,s1,0x1
    da8c:	00088313          	mv	t1,a7
    da90:	3ff30793          	add	a5,t1,1023
    da94:	12f05663          	blez	a5,dbc0 <__muldf3+0x5f4>
    da98:	007a7713          	and	a4,s4,7
    da9c:	02070063          	beqz	a4,dabc <__muldf3+0x4f0>
    daa0:	00fa7713          	and	a4,s4,15
    daa4:	00400693          	li	a3,4
    daa8:	00d70a63          	beq	a4,a3,dabc <__muldf3+0x4f0>
    daac:	004a0713          	add	a4,s4,4
    dab0:	01473a33          	sltu	s4,a4,s4
    dab4:	014484b3          	add	s1,s1,s4
    dab8:	00070a13          	mv	s4,a4
    dabc:	00749713          	sll	a4,s1,0x7
    dac0:	00075a63          	bgez	a4,dad4 <__muldf3+0x508>
    dac4:	ff0007b7          	lui	a5,0xff000
    dac8:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    dacc:	00f4f4b3          	and	s1,s1,a5
    dad0:	40030793          	add	a5,t1,1024
    dad4:	7fe00713          	li	a4,2046
    dad8:	1cf74463          	blt	a4,a5,dca0 <__muldf3+0x6d4>
    dadc:	003a5a13          	srl	s4,s4,0x3
    dae0:	01d49713          	sll	a4,s1,0x1d
    dae4:	00949693          	sll	a3,s1,0x9
    dae8:	01476733          	or	a4,a4,s4
    daec:	00c6d693          	srl	a3,a3,0xc
    daf0:	7ff7f793          	and	a5,a5,2047
    daf4:	c89ff06f          	j	d77c <__muldf3+0x1b0>
    daf8:	00a4ea33          	or	s4,s1,a0
    dafc:	060a0863          	beqz	s4,db6c <__muldf3+0x5a0>
    db00:	12048e63          	beqz	s1,dc3c <__muldf3+0x670>
    db04:	00048513          	mv	a0,s1
    db08:	2fc010ef          	jal	ee04 <__clzsi2>
    db0c:	00050713          	mv	a4,a0
    db10:	ff550693          	add	a3,a0,-11
    db14:	01d00793          	li	a5,29
    db18:	ff870a13          	add	s4,a4,-8
    db1c:	40d787b3          	sub	a5,a5,a3
    db20:	00f457b3          	srl	a5,s0,a5
    db24:	014496b3          	sll	a3,s1,s4
    db28:	00d7e4b3          	or	s1,a5,a3
    db2c:	01441a33          	sll	s4,s0,s4
    db30:	c0d00793          	li	a5,-1011
    db34:	40e78c33          	sub	s8,a5,a4
    db38:	00000b13          	li	s6,0
    db3c:	00000b93          	li	s7,0
    db40:	b09ff06f          	j	d648 <__muldf3+0x7c>
    db44:	00058813          	mv	a6,a1
    db48:	7ff00793          	li	a5,2047
    db4c:	00000693          	li	a3,0
    db50:	00000713          	li	a4,0
    db54:	c29ff06f          	j	d77c <__muldf3+0x1b0>
    db58:	00050a13          	mv	s4,a0
    db5c:	00c00b13          	li	s6,12
    db60:	7ff00c13          	li	s8,2047
    db64:	00300b93          	li	s7,3
    db68:	ae1ff06f          	j	d648 <__muldf3+0x7c>
    db6c:	00000493          	li	s1,0
    db70:	00400b13          	li	s6,4
    db74:	00000c13          	li	s8,0
    db78:	00100b93          	li	s7,1
    db7c:	acdff06f          	j	d648 <__muldf3+0x7c>
    db80:	001b6b13          	or	s6,s6,1
    db84:	000c0313          	mv	t1,s8
    db88:	00000413          	li	s0,0
    db8c:	00000e13          	li	t3,0
    db90:	00100693          	li	a3,1
    db94:	afdff06f          	j	d690 <__muldf3+0xc4>
    db98:	002b6b13          	or	s6,s6,2
    db9c:	00000413          	li	s0,0
    dba0:	00000e13          	li	t3,0
    dba4:	00200693          	li	a3,2
    dba8:	ae9ff06f          	j	d690 <__muldf3+0xc4>
    dbac:	00040493          	mv	s1,s0
    dbb0:	000e0a13          	mv	s4,t3
    dbb4:	00068b93          	mv	s7,a3
    dbb8:	00098593          	mv	a1,s3
    dbbc:	b99ff06f          	j	d754 <__muldf3+0x188>
    dbc0:	00100713          	li	a4,1
    dbc4:	10079063          	bnez	a5,dcc4 <__muldf3+0x6f8>
    dbc8:	41e30313          	add	t1,t1,1054
    dbcc:	006a1633          	sll	a2,s4,t1
    dbd0:	00c03633          	snez	a2,a2
    dbd4:	00649333          	sll	t1,s1,t1
    dbd8:	00ea5a33          	srl	s4,s4,a4
    dbdc:	00666633          	or	a2,a2,t1
    dbe0:	01466633          	or	a2,a2,s4
    dbe4:	00767793          	and	a5,a2,7
    dbe8:	00e4d5b3          	srl	a1,s1,a4
    dbec:	02078063          	beqz	a5,dc0c <__muldf3+0x640>
    dbf0:	00f67793          	and	a5,a2,15
    dbf4:	00400713          	li	a4,4
    dbf8:	00e78a63          	beq	a5,a4,dc0c <__muldf3+0x640>
    dbfc:	00460793          	add	a5,a2,4
    dc00:	00c7b633          	sltu	a2,a5,a2
    dc04:	00c585b3          	add	a1,a1,a2
    dc08:	00078613          	mv	a2,a5
    dc0c:	00859513          	sll	a0,a1,0x8
    dc10:	00100793          	li	a5,1
    dc14:	00000693          	li	a3,0
    dc18:	00000713          	li	a4,0
    dc1c:	b60540e3          	bltz	a0,d77c <__muldf3+0x1b0>
    dc20:	10c0006f          	j	dd2c <__muldf3+0x760>
    dc24:	00f00713          	li	a4,15
    dc28:	12eb1063          	bne	s6,a4,dd48 <__muldf3+0x77c>
    dc2c:	00000813          	li	a6,0
    dc30:	000806b7          	lui	a3,0x80
    dc34:	00000713          	li	a4,0
    dc38:	b45ff06f          	j	d77c <__muldf3+0x1b0>
    dc3c:	1c8010ef          	jal	ee04 <__clzsi2>
    dc40:	01550693          	add	a3,a0,21
    dc44:	01c00793          	li	a5,28
    dc48:	02050713          	add	a4,a0,32
    dc4c:	ecd7d4e3          	bge	a5,a3,db14 <__muldf3+0x548>
    dc50:	ff850513          	add	a0,a0,-8
    dc54:	00000a13          	li	s4,0
    dc58:	00a414b3          	sll	s1,s0,a0
    dc5c:	ed5ff06f          	j	db30 <__muldf3+0x564>
    dc60:	000a8513          	mv	a0,s5
    dc64:	1a0010ef          	jal	ee04 <__clzsi2>
    dc68:	01550713          	add	a4,a0,21
    dc6c:	01c00793          	li	a5,28
    dc70:	02050313          	add	t1,a0,32
    dc74:	aae7d4e3          	bge	a5,a4,d71c <__muldf3+0x150>
    dc78:	ff850513          	add	a0,a0,-8
    dc7c:	00000e13          	li	t3,0
    dc80:	00aa9433          	sll	s0,s5,a0
    dc84:	ab5ff06f          	j	d738 <__muldf3+0x16c>
    dc88:	00000813          	li	a6,0
    dc8c:	7ff00793          	li	a5,2047
    dc90:	000806b7          	lui	a3,0x80
    dc94:	ae9ff06f          	j	d77c <__muldf3+0x1b0>
    dc98:	00088313          	mv	t1,a7
    dc9c:	df5ff06f          	j	da90 <__muldf3+0x4c4>
    dca0:	7ff00793          	li	a5,2047
    dca4:	00000693          	li	a3,0
    dca8:	00000713          	li	a4,0
    dcac:	ad1ff06f          	j	d77c <__muldf3+0x1b0>
    dcb0:	00000813          	li	a6,0
    dcb4:	7ff00793          	li	a5,2047
    dcb8:	000806b7          	lui	a3,0x80
    dcbc:	00000713          	li	a4,0
    dcc0:	abdff06f          	j	d77c <__muldf3+0x1b0>
    dcc4:	40f70733          	sub	a4,a4,a5
    dcc8:	03800693          	li	a3,56
    dccc:	aae6c2e3          	blt	a3,a4,d770 <__muldf3+0x1a4>
    dcd0:	01f00693          	li	a3,31
    dcd4:	eee6dae3          	bge	a3,a4,dbc8 <__muldf3+0x5fc>
    dcd8:	fe100693          	li	a3,-31
    dcdc:	40f687b3          	sub	a5,a3,a5
    dce0:	02000693          	li	a3,32
    dce4:	00f4d7b3          	srl	a5,s1,a5
    dce8:	00d70863          	beq	a4,a3,dcf8 <__muldf3+0x72c>
    dcec:	43e30313          	add	t1,t1,1086
    dcf0:	00649333          	sll	t1,s1,t1
    dcf4:	006a6a33          	or	s4,s4,t1
    dcf8:	01403633          	snez	a2,s4
    dcfc:	00f66633          	or	a2,a2,a5
    dd00:	00767713          	and	a4,a2,7
    dd04:	00000693          	li	a3,0
    dd08:	02070863          	beqz	a4,dd38 <__muldf3+0x76c>
    dd0c:	00f67793          	and	a5,a2,15
    dd10:	00400713          	li	a4,4
    dd14:	00000593          	li	a1,0
    dd18:	00e78a63          	beq	a5,a4,dd2c <__muldf3+0x760>
    dd1c:	00460793          	add	a5,a2,4
    dd20:	00c7b633          	sltu	a2,a5,a2
    dd24:	00c035b3          	snez	a1,a2
    dd28:	00078613          	mv	a2,a5
    dd2c:	00959693          	sll	a3,a1,0x9
    dd30:	01d59713          	sll	a4,a1,0x1d
    dd34:	00c6d693          	srl	a3,a3,0xc
    dd38:	00365613          	srl	a2,a2,0x3
    dd3c:	00e66733          	or	a4,a2,a4
    dd40:	00000793          	li	a5,0
    dd44:	a39ff06f          	j	d77c <__muldf3+0x1b0>
    dd48:	00040493          	mv	s1,s0
    dd4c:	000a8a13          	mv	s4,s5
    dd50:	00300b93          	li	s7,3
    dd54:	00098593          	mv	a1,s3
    dd58:	9fdff06f          	j	d754 <__muldf3+0x188>

0000dd5c <__subdf3>:
    dd5c:	001007b7          	lui	a5,0x100
    dd60:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    dd64:	fe010113          	add	sp,sp,-32
    dd68:	00b7f8b3          	and	a7,a5,a1
    dd6c:	00d7f833          	and	a6,a5,a3
    dd70:	0146d793          	srl	a5,a3,0x14
    dd74:	00389893          	sll	a7,a7,0x3
    dd78:	00812c23          	sw	s0,24(sp)
    dd7c:	01312623          	sw	s3,12(sp)
    dd80:	01f5d413          	srl	s0,a1,0x1f
    dd84:	0145d993          	srl	s3,a1,0x14
    dd88:	01d55713          	srl	a4,a0,0x1d
    dd8c:	00381813          	sll	a6,a6,0x3
    dd90:	01d65593          	srl	a1,a2,0x1d
    dd94:	00112e23          	sw	ra,28(sp)
    dd98:	00912a23          	sw	s1,20(sp)
    dd9c:	01212823          	sw	s2,16(sp)
    dda0:	7ff7ff13          	and	t5,a5,2047
    dda4:	7ff00313          	li	t1,2047
    dda8:	01176733          	or	a4,a4,a7
    ddac:	7ff9f993          	and	s3,s3,2047
    ddb0:	00040e13          	mv	t3,s0
    ddb4:	00351893          	sll	a7,a0,0x3
    ddb8:	01f6d693          	srl	a3,a3,0x1f
    ddbc:	0105e5b3          	or	a1,a1,a6
    ddc0:	00361e93          	sll	t4,a2,0x3
    ddc4:	206f0c63          	beq	t5,t1,dfdc <__subdf3+0x280>
    ddc8:	0016c693          	xor	a3,a3,1
    ddcc:	41e987b3          	sub	a5,s3,t5
    ddd0:	16d40263          	beq	s0,a3,df34 <__subdf3+0x1d8>
    ddd4:	00f05ae3          	blez	a5,e5e8 <__subdf3+0x88c>
    ddd8:	240f0a63          	beqz	t5,e02c <__subdf3+0x2d0>
    dddc:	3c698463          	beq	s3,t1,e1a4 <__subdf3+0x448>
    dde0:	03800693          	li	a3,56
    dde4:	00100513          	li	a0,1
    dde8:	02f6ce63          	blt	a3,a5,de24 <__subdf3+0xc8>
    ddec:	008006b7          	lui	a3,0x800
    ddf0:	00d5e5b3          	or	a1,a1,a3
    ddf4:	01f00693          	li	a3,31
    ddf8:	4ef6c463          	blt	a3,a5,e2e0 <__subdf3+0x584>
    ddfc:	02000693          	li	a3,32
    de00:	40f686b3          	sub	a3,a3,a5
    de04:	00d59533          	sll	a0,a1,a3
    de08:	00fed633          	srl	a2,t4,a5
    de0c:	00de96b3          	sll	a3,t4,a3
    de10:	00c56533          	or	a0,a0,a2
    de14:	00d036b3          	snez	a3,a3
    de18:	00f5d7b3          	srl	a5,a1,a5
    de1c:	00d56533          	or	a0,a0,a3
    de20:	40f70733          	sub	a4,a4,a5
    de24:	40a88533          	sub	a0,a7,a0
    de28:	00a8b633          	sltu	a2,a7,a0
    de2c:	00050493          	mv	s1,a0
    de30:	40c70933          	sub	s2,a4,a2
    de34:	00891793          	sll	a5,s2,0x8
    de38:	3407d863          	bgez	a5,e188 <__subdf3+0x42c>
    de3c:	008007b7          	lui	a5,0x800
    de40:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    de44:	00f97933          	and	s2,s2,a5
    de48:	2e090663          	beqz	s2,e134 <__subdf3+0x3d8>
    de4c:	00090513          	mv	a0,s2
    de50:	7b5000ef          	jal	ee04 <__clzsi2>
    de54:	ff850793          	add	a5,a0,-8
    de58:	02000693          	li	a3,32
    de5c:	40f68733          	sub	a4,a3,a5
    de60:	00e4d733          	srl	a4,s1,a4
    de64:	00f91933          	sll	s2,s2,a5
    de68:	01276733          	or	a4,a4,s2
    de6c:	00f494b3          	sll	s1,s1,a5
    de70:	3f37c463          	blt	a5,s3,e258 <__subdf3+0x4fc>
    de74:	413787b3          	sub	a5,a5,s3
    de78:	00178793          	add	a5,a5,1
    de7c:	40f686b3          	sub	a3,a3,a5
    de80:	00d49633          	sll	a2,s1,a3
    de84:	00f4d933          	srl	s2,s1,a5
    de88:	00c03633          	snez	a2,a2
    de8c:	00c96633          	or	a2,s2,a2
    de90:	00d716b3          	sll	a3,a4,a3
    de94:	00c6e4b3          	or	s1,a3,a2
    de98:	00f75933          	srl	s2,a4,a5
    de9c:	00000993          	li	s3,0
    dea0:	0074f793          	and	a5,s1,7
    dea4:	02078063          	beqz	a5,dec4 <__subdf3+0x168>
    dea8:	00f4f793          	and	a5,s1,15
    deac:	00400713          	li	a4,4
    deb0:	00e78a63          	beq	a5,a4,dec4 <__subdf3+0x168>
    deb4:	00448793          	add	a5,s1,4
    deb8:	0097b533          	sltu	a0,a5,s1
    debc:	00a90933          	add	s2,s2,a0
    dec0:	00078493          	mv	s1,a5
    dec4:	00891793          	sll	a5,s2,0x8
    dec8:	6c07d063          	bgez	a5,e588 <__subdf3+0x82c>
    decc:	00198793          	add	a5,s3,1
    ded0:	7ff00713          	li	a4,2047
    ded4:	24e78663          	beq	a5,a4,e120 <__subdf3+0x3c4>
    ded8:	ff800737          	lui	a4,0xff800
    dedc:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dee0:	00e97733          	and	a4,s2,a4
    dee4:	7ff7f793          	and	a5,a5,2047
    dee8:	01d71813          	sll	a6,a4,0x1d
    deec:	0034d513          	srl	a0,s1,0x3
    def0:	00971713          	sll	a4,a4,0x9
    def4:	00a86833          	or	a6,a6,a0
    def8:	00c75713          	srl	a4,a4,0xc
    defc:	00147e13          	and	t3,s0,1
    df00:	01c12083          	lw	ra,28(sp)
    df04:	01812403          	lw	s0,24(sp)
    df08:	01479793          	sll	a5,a5,0x14
    df0c:	00e7e7b3          	or	a5,a5,a4
    df10:	01fe1713          	sll	a4,t3,0x1f
    df14:	00e7e7b3          	or	a5,a5,a4
    df18:	01412483          	lw	s1,20(sp)
    df1c:	01012903          	lw	s2,16(sp)
    df20:	00c12983          	lw	s3,12(sp)
    df24:	00080513          	mv	a0,a6
    df28:	00078593          	mv	a1,a5
    df2c:	02010113          	add	sp,sp,32
    df30:	00008067          	ret
    df34:	70f05263          	blez	a5,e638 <__subdf3+0x8dc>
    df38:	1c0f1663          	bnez	t5,e104 <__subdf3+0x3a8>
    df3c:	01d5e6b3          	or	a3,a1,t4
    df40:	26068e63          	beqz	a3,e1bc <__subdf3+0x460>
    df44:	fff78693          	add	a3,a5,-1
    df48:	46068863          	beqz	a3,e3b8 <__subdf3+0x65c>
    df4c:	24678c63          	beq	a5,t1,e1a4 <__subdf3+0x448>
    df50:	03800793          	li	a5,56
    df54:	00100913          	li	s2,1
    df58:	02d7cc63          	blt	a5,a3,df90 <__subdf3+0x234>
    df5c:	00068793          	mv	a5,a3
    df60:	01f00693          	li	a3,31
    df64:	48f6ca63          	blt	a3,a5,e3f8 <__subdf3+0x69c>
    df68:	02000693          	li	a3,32
    df6c:	40f686b3          	sub	a3,a3,a5
    df70:	00d59933          	sll	s2,a1,a3
    df74:	00fed633          	srl	a2,t4,a5
    df78:	00de96b3          	sll	a3,t4,a3
    df7c:	00c96933          	or	s2,s2,a2
    df80:	00d036b3          	snez	a3,a3
    df84:	00f5d7b3          	srl	a5,a1,a5
    df88:	00d96933          	or	s2,s2,a3
    df8c:	00f70733          	add	a4,a4,a5
    df90:	01190633          	add	a2,s2,a7
    df94:	01263933          	sltu	s2,a2,s2
    df98:	00060493          	mv	s1,a2
    df9c:	00e90933          	add	s2,s2,a4
    dfa0:	00891793          	sll	a5,s2,0x8
    dfa4:	1e07d263          	bgez	a5,e188 <__subdf3+0x42c>
    dfa8:	00198993          	add	s3,s3,1
    dfac:	7ff00793          	li	a5,2047
    dfb0:	16f98863          	beq	s3,a5,e120 <__subdf3+0x3c4>
    dfb4:	ff8007b7          	lui	a5,0xff800
    dfb8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dfbc:	0014f513          	and	a0,s1,1
    dfc0:	00f977b3          	and	a5,s2,a5
    dfc4:	0014d713          	srl	a4,s1,0x1
    dfc8:	00a76733          	or	a4,a4,a0
    dfcc:	01f79513          	sll	a0,a5,0x1f
    dfd0:	00e564b3          	or	s1,a0,a4
    dfd4:	0017d913          	srl	s2,a5,0x1
    dfd8:	ec9ff06f          	j	dea0 <__subdf3+0x144>
    dfdc:	01d5e833          	or	a6,a1,t4
    dfe0:	80198313          	add	t1,s3,-2047
    dfe4:	06080863          	beqz	a6,e054 <__subdf3+0x2f8>
    dfe8:	06d40a63          	beq	s0,a3,e05c <__subdf3+0x300>
    dfec:	0e030463          	beqz	t1,e0d4 <__subdf3+0x378>
    dff0:	26098e63          	beqz	s3,e26c <__subdf3+0x510>
    dff4:	00361513          	sll	a0,a2,0x3
    dff8:	00355513          	srl	a0,a0,0x3
    dffc:	00068413          	mv	s0,a3
    e000:	00058713          	mv	a4,a1
    e004:	01d71813          	sll	a6,a4,0x1d
    e008:	00a86833          	or	a6,a6,a0
    e00c:	00375713          	srl	a4,a4,0x3
    e010:	01076733          	or	a4,a4,a6
    e014:	10070663          	beqz	a4,e120 <__subdf3+0x3c4>
    e018:	00000e13          	li	t3,0
    e01c:	7ff00793          	li	a5,2047
    e020:	00080737          	lui	a4,0x80
    e024:	00000813          	li	a6,0
    e028:	ed9ff06f          	j	df00 <__subdf3+0x1a4>
    e02c:	01d5e6b3          	or	a3,a1,t4
    e030:	18068663          	beqz	a3,e1bc <__subdf3+0x460>
    e034:	fff78693          	add	a3,a5,-1
    e038:	3a068263          	beqz	a3,e3dc <__subdf3+0x680>
    e03c:	16678463          	beq	a5,t1,e1a4 <__subdf3+0x448>
    e040:	03800793          	li	a5,56
    e044:	00100513          	li	a0,1
    e048:	dcd7cee3          	blt	a5,a3,de24 <__subdf3+0xc8>
    e04c:	00068793          	mv	a5,a3
    e050:	da5ff06f          	j	ddf4 <__subdf3+0x98>
    e054:	0016c693          	xor	a3,a3,1
    e058:	f8d41ae3          	bne	s0,a3,dfec <__subdf3+0x290>
    e05c:	18030863          	beqz	t1,e1ec <__subdf3+0x490>
    e060:	2c099063          	bnez	s3,e320 <__subdf3+0x5c4>
    e064:	7ff00793          	li	a5,2047
    e068:	011766b3          	or	a3,a4,a7
    e06c:	48068863          	beqz	a3,e4fc <__subdf3+0x7a0>
    e070:	fff78693          	add	a3,a5,-1
    e074:	34068263          	beqz	a3,e3b8 <__subdf3+0x65c>
    e078:	7ff00513          	li	a0,2047
    e07c:	2aa78263          	beq	a5,a0,e320 <__subdf3+0x5c4>
    e080:	03800793          	li	a5,56
    e084:	00100913          	li	s2,1
    e088:	02d7ca63          	blt	a5,a3,e0bc <__subdf3+0x360>
    e08c:	01f00793          	li	a5,31
    e090:	4cd7c663          	blt	a5,a3,e55c <__subdf3+0x800>
    e094:	02000793          	li	a5,32
    e098:	40d787b3          	sub	a5,a5,a3
    e09c:	00f71933          	sll	s2,a4,a5
    e0a0:	00d8d633          	srl	a2,a7,a3
    e0a4:	00f897b3          	sll	a5,a7,a5
    e0a8:	00c96933          	or	s2,s2,a2
    e0ac:	00f037b3          	snez	a5,a5
    e0b0:	00d756b3          	srl	a3,a4,a3
    e0b4:	00f96933          	or	s2,s2,a5
    e0b8:	00d585b3          	add	a1,a1,a3
    e0bc:	01d90733          	add	a4,s2,t4
    e0c0:	01273933          	sltu	s2,a4,s2
    e0c4:	00070493          	mv	s1,a4
    e0c8:	00b90933          	add	s2,s2,a1
    e0cc:	000f0993          	mv	s3,t5
    e0d0:	ed1ff06f          	j	dfa0 <__subdf3+0x244>
    e0d4:	00198793          	add	a5,s3,1
    e0d8:	7fe7f793          	and	a5,a5,2046
    e0dc:	14079463          	bnez	a5,e224 <__subdf3+0x4c8>
    e0e0:	01d5e833          	or	a6,a1,t4
    e0e4:	011767b3          	or	a5,a4,a7
    e0e8:	2a099463          	bnez	s3,e390 <__subdf3+0x634>
    e0ec:	38078e63          	beqz	a5,e488 <__subdf3+0x72c>
    e0f0:	3c081063          	bnez	a6,e4b0 <__subdf3+0x754>
    e0f4:	00351513          	sll	a0,a0,0x3
    e0f8:	00355913          	srl	s2,a0,0x3
    e0fc:	00000793          	li	a5,0
    e100:	1140006f          	j	e214 <__subdf3+0x4b8>
    e104:	0a698063          	beq	s3,t1,e1a4 <__subdf3+0x448>
    e108:	03800693          	li	a3,56
    e10c:	00100913          	li	s2,1
    e110:	e8f6c0e3          	blt	a3,a5,df90 <__subdf3+0x234>
    e114:	008006b7          	lui	a3,0x800
    e118:	00d5e5b3          	or	a1,a1,a3
    e11c:	e45ff06f          	j	df60 <__subdf3+0x204>
    e120:	00147e13          	and	t3,s0,1
    e124:	7ff00793          	li	a5,2047
    e128:	00000713          	li	a4,0
    e12c:	00000813          	li	a6,0
    e130:	dd1ff06f          	j	df00 <__subdf3+0x1a4>
    e134:	00048513          	mv	a0,s1
    e138:	4cd000ef          	jal	ee04 <__clzsi2>
    e13c:	01850793          	add	a5,a0,24
    e140:	01f00693          	li	a3,31
    e144:	d0f6dae3          	bge	a3,a5,de58 <__subdf3+0xfc>
    e148:	ff850713          	add	a4,a0,-8
    e14c:	00e49733          	sll	a4,s1,a4
    e150:	1b37ce63          	blt	a5,s3,e30c <__subdf3+0x5b0>
    e154:	413789b3          	sub	s3,a5,s3
    e158:	00198793          	add	a5,s3,1
    e15c:	42f6de63          	bge	a3,a5,e598 <__subdf3+0x83c>
    e160:	fe198993          	add	s3,s3,-31
    e164:	02000693          	li	a3,32
    e168:	013754b3          	srl	s1,a4,s3
    e16c:	00d78c63          	beq	a5,a3,e184 <__subdf3+0x428>
    e170:	04000693          	li	a3,64
    e174:	40f687b3          	sub	a5,a3,a5
    e178:	00f71733          	sll	a4,a4,a5
    e17c:	00e03733          	snez	a4,a4
    e180:	00e4e4b3          	or	s1,s1,a4
    e184:	00000993          	li	s3,0
    e188:	0074f793          	and	a5,s1,7
    e18c:	d0079ee3          	bnez	a5,dea8 <__subdf3+0x14c>
    e190:	00098793          	mv	a5,s3
    e194:	0034d513          	srl	a0,s1,0x3
    e198:	00090713          	mv	a4,s2
    e19c:	0280006f          	j	e1c4 <__subdf3+0x468>
    e1a0:	e6081ce3          	bnez	a6,e018 <__subdf3+0x2bc>
    e1a4:	00351513          	sll	a0,a0,0x3
    e1a8:	01d71813          	sll	a6,a4,0x1d
    e1ac:	00355513          	srl	a0,a0,0x3
    e1b0:	00a86833          	or	a6,a6,a0
    e1b4:	00375713          	srl	a4,a4,0x3
    e1b8:	e59ff06f          	j	e010 <__subdf3+0x2b4>
    e1bc:	00351513          	sll	a0,a0,0x3
    e1c0:	00355513          	srl	a0,a0,0x3
    e1c4:	01d71813          	sll	a6,a4,0x1d
    e1c8:	7ff00693          	li	a3,2047
    e1cc:	00a86833          	or	a6,a6,a0
    e1d0:	00375713          	srl	a4,a4,0x3
    e1d4:	e2d78ee3          	beq	a5,a3,e010 <__subdf3+0x2b4>
    e1d8:	00c71713          	sll	a4,a4,0xc
    e1dc:	00c75713          	srl	a4,a4,0xc
    e1e0:	7ff7f793          	and	a5,a5,2047
    e1e4:	00147e13          	and	t3,s0,1
    e1e8:	d19ff06f          	j	df00 <__subdf3+0x1a4>
    e1ec:	00198693          	add	a3,s3,1
    e1f0:	7fe6f793          	and	a5,a3,2046
    e1f4:	12079e63          	bnez	a5,e330 <__subdf3+0x5d4>
    e1f8:	011767b3          	or	a5,a4,a7
    e1fc:	24099a63          	bnez	s3,e450 <__subdf3+0x6f4>
    e200:	30078663          	beqz	a5,e50c <__subdf3+0x7b0>
    e204:	01d5e7b3          	or	a5,a1,t4
    e208:	30079a63          	bnez	a5,e51c <__subdf3+0x7c0>
    e20c:	00351513          	sll	a0,a0,0x3
    e210:	00355913          	srl	s2,a0,0x3
    e214:	01d71813          	sll	a6,a4,0x1d
    e218:	01286833          	or	a6,a6,s2
    e21c:	00375713          	srl	a4,a4,0x3
    e220:	fb9ff06f          	j	e1d8 <__subdf3+0x47c>
    e224:	41d88833          	sub	a6,a7,t4
    e228:	0108b7b3          	sltu	a5,a7,a6
    e22c:	40b70933          	sub	s2,a4,a1
    e230:	40f90933          	sub	s2,s2,a5
    e234:	00891793          	sll	a5,s2,0x8
    e238:	00080493          	mv	s1,a6
    e23c:	1207c263          	bltz	a5,e360 <__subdf3+0x604>
    e240:	01286833          	or	a6,a6,s2
    e244:	c00812e3          	bnez	a6,de48 <__subdf3+0xec>
    e248:	00000e13          	li	t3,0
    e24c:	00000793          	li	a5,0
    e250:	00000713          	li	a4,0
    e254:	cadff06f          	j	df00 <__subdf3+0x1a4>
    e258:	ff800937          	lui	s2,0xff800
    e25c:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e260:	40f989b3          	sub	s3,s3,a5
    e264:	01277933          	and	s2,a4,s2
    e268:	c39ff06f          	j	dea0 <__subdf3+0x144>
    e26c:	7ff00793          	li	a5,2047
    e270:	01176533          	or	a0,a4,a7
    e274:	10050463          	beqz	a0,e37c <__subdf3+0x620>
    e278:	fff78813          	add	a6,a5,-1
    e27c:	1e080263          	beqz	a6,e460 <__subdf3+0x704>
    e280:	7ff00513          	li	a0,2047
    e284:	d6a788e3          	beq	a5,a0,dff4 <__subdf3+0x298>
    e288:	03800793          	li	a5,56
    e28c:	00068413          	mv	s0,a3
    e290:	00100513          	li	a0,1
    e294:	0307ca63          	blt	a5,a6,e2c8 <__subdf3+0x56c>
    e298:	01f00793          	li	a5,31
    e29c:	1907c463          	blt	a5,a6,e424 <__subdf3+0x6c8>
    e2a0:	02000793          	li	a5,32
    e2a4:	410787b3          	sub	a5,a5,a6
    e2a8:	00f71533          	sll	a0,a4,a5
    e2ac:	0108d6b3          	srl	a3,a7,a6
    e2b0:	00f897b3          	sll	a5,a7,a5
    e2b4:	00d56533          	or	a0,a0,a3
    e2b8:	00f037b3          	snez	a5,a5
    e2bc:	01075833          	srl	a6,a4,a6
    e2c0:	00f56533          	or	a0,a0,a5
    e2c4:	410585b3          	sub	a1,a1,a6
    e2c8:	40ae8533          	sub	a0,t4,a0
    e2cc:	00aeb733          	sltu	a4,t4,a0
    e2d0:	00050493          	mv	s1,a0
    e2d4:	40e58933          	sub	s2,a1,a4
    e2d8:	000f0993          	mv	s3,t5
    e2dc:	b59ff06f          	j	de34 <__subdf3+0xd8>
    e2e0:	fe078693          	add	a3,a5,-32
    e2e4:	02000613          	li	a2,32
    e2e8:	00d5d6b3          	srl	a3,a1,a3
    e2ec:	00c78a63          	beq	a5,a2,e300 <__subdf3+0x5a4>
    e2f0:	04000613          	li	a2,64
    e2f4:	40f607b3          	sub	a5,a2,a5
    e2f8:	00f597b3          	sll	a5,a1,a5
    e2fc:	00feeeb3          	or	t4,t4,a5
    e300:	01d03533          	snez	a0,t4
    e304:	00d56533          	or	a0,a0,a3
    e308:	b1dff06f          	j	de24 <__subdf3+0xc8>
    e30c:	ff8006b7          	lui	a3,0xff800
    e310:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e314:	40f987b3          	sub	a5,s3,a5
    e318:	00d77733          	and	a4,a4,a3
    e31c:	ef9ff06f          	j	e214 <__subdf3+0x4b8>
    e320:	00361513          	sll	a0,a2,0x3
    e324:	00355513          	srl	a0,a0,0x3
    e328:	00058713          	mv	a4,a1
    e32c:	cd9ff06f          	j	e004 <__subdf3+0x2a8>
    e330:	7ff00793          	li	a5,2047
    e334:	def686e3          	beq	a3,a5,e120 <__subdf3+0x3c4>
    e338:	01d88eb3          	add	t4,a7,t4
    e33c:	011eb633          	sltu	a2,t4,a7
    e340:	00b707b3          	add	a5,a4,a1
    e344:	00c787b3          	add	a5,a5,a2
    e348:	01f79513          	sll	a0,a5,0x1f
    e34c:	001ede93          	srl	t4,t4,0x1
    e350:	01d564b3          	or	s1,a0,t4
    e354:	0017d913          	srl	s2,a5,0x1
    e358:	00068993          	mv	s3,a3
    e35c:	b45ff06f          	j	dea0 <__subdf3+0x144>
    e360:	411e8633          	sub	a2,t4,a7
    e364:	40e587b3          	sub	a5,a1,a4
    e368:	00ceb733          	sltu	a4,t4,a2
    e36c:	00060493          	mv	s1,a2
    e370:	40e78933          	sub	s2,a5,a4
    e374:	00068413          	mv	s0,a3
    e378:	ad1ff06f          	j	de48 <__subdf3+0xec>
    e37c:	00361613          	sll	a2,a2,0x3
    e380:	00365513          	srl	a0,a2,0x3
    e384:	00068413          	mv	s0,a3
    e388:	00058713          	mv	a4,a1
    e38c:	e39ff06f          	j	e1c4 <__subdf3+0x468>
    e390:	e00798e3          	bnez	a5,e1a0 <__subdf3+0x444>
    e394:	22080663          	beqz	a6,e5c0 <__subdf3+0x864>
    e398:	0035d713          	srl	a4,a1,0x3
    e39c:	00361613          	sll	a2,a2,0x3
    e3a0:	01d59593          	sll	a1,a1,0x1d
    e3a4:	00b76733          	or	a4,a4,a1
    e3a8:	00365613          	srl	a2,a2,0x3
    e3ac:	00c76733          	or	a4,a4,a2
    e3b0:	00068413          	mv	s0,a3
    e3b4:	c61ff06f          	j	e014 <__subdf3+0x2b8>
    e3b8:	01d88eb3          	add	t4,a7,t4
    e3bc:	00b705b3          	add	a1,a4,a1
    e3c0:	011eb633          	sltu	a2,t4,a7
    e3c4:	00c58933          	add	s2,a1,a2
    e3c8:	00891793          	sll	a5,s2,0x8
    e3cc:	000e8493          	mv	s1,t4
    e3d0:	0a07d863          	bgez	a5,e480 <__subdf3+0x724>
    e3d4:	00200993          	li	s3,2
    e3d8:	bddff06f          	j	dfb4 <__subdf3+0x258>
    e3dc:	41d88eb3          	sub	t4,a7,t4
    e3e0:	40b705b3          	sub	a1,a4,a1
    e3e4:	01d8b633          	sltu	a2,a7,t4
    e3e8:	000e8493          	mv	s1,t4
    e3ec:	40c58933          	sub	s2,a1,a2
    e3f0:	00100993          	li	s3,1
    e3f4:	a41ff06f          	j	de34 <__subdf3+0xd8>
    e3f8:	fe078693          	add	a3,a5,-32
    e3fc:	02000613          	li	a2,32
    e400:	00d5d6b3          	srl	a3,a1,a3
    e404:	00c78a63          	beq	a5,a2,e418 <__subdf3+0x6bc>
    e408:	04000613          	li	a2,64
    e40c:	40f607b3          	sub	a5,a2,a5
    e410:	00f597b3          	sll	a5,a1,a5
    e414:	00feeeb3          	or	t4,t4,a5
    e418:	01d03933          	snez	s2,t4
    e41c:	00d96933          	or	s2,s2,a3
    e420:	b71ff06f          	j	df90 <__subdf3+0x234>
    e424:	fe080793          	add	a5,a6,-32
    e428:	02000693          	li	a3,32
    e42c:	00f757b3          	srl	a5,a4,a5
    e430:	00d80a63          	beq	a6,a3,e444 <__subdf3+0x6e8>
    e434:	04000693          	li	a3,64
    e438:	410686b3          	sub	a3,a3,a6
    e43c:	00d71733          	sll	a4,a4,a3
    e440:	00e8e8b3          	or	a7,a7,a4
    e444:	01103533          	snez	a0,a7
    e448:	00f56533          	or	a0,a0,a5
    e44c:	e7dff06f          	j	e2c8 <__subdf3+0x56c>
    e450:	ec0788e3          	beqz	a5,e320 <__subdf3+0x5c4>
    e454:	01d5eeb3          	or	t4,a1,t4
    e458:	bc0e90e3          	bnez	t4,e018 <__subdf3+0x2bc>
    e45c:	d49ff06f          	j	e1a4 <__subdf3+0x448>
    e460:	411e8633          	sub	a2,t4,a7
    e464:	40e585b3          	sub	a1,a1,a4
    e468:	00ceb733          	sltu	a4,t4,a2
    e46c:	00060493          	mv	s1,a2
    e470:	40e58933          	sub	s2,a1,a4
    e474:	00068413          	mv	s0,a3
    e478:	00100993          	li	s3,1
    e47c:	9b9ff06f          	j	de34 <__subdf3+0xd8>
    e480:	00100793          	li	a5,1
    e484:	d11ff06f          	j	e194 <__subdf3+0x438>
    e488:	dc0800e3          	beqz	a6,e248 <__subdf3+0x4ec>
    e48c:	00361613          	sll	a2,a2,0x3
    e490:	00365793          	srl	a5,a2,0x3
    e494:	01d59813          	sll	a6,a1,0x1d
    e498:	00959713          	sll	a4,a1,0x9
    e49c:	00f86833          	or	a6,a6,a5
    e4a0:	00c75713          	srl	a4,a4,0xc
    e4a4:	00068e13          	mv	t3,a3
    e4a8:	00000793          	li	a5,0
    e4ac:	a55ff06f          	j	df00 <__subdf3+0x1a4>
    e4b0:	41d88933          	sub	s2,a7,t4
    e4b4:	0128b7b3          	sltu	a5,a7,s2
    e4b8:	40b70633          	sub	a2,a4,a1
    e4bc:	40f60633          	sub	a2,a2,a5
    e4c0:	00861793          	sll	a5,a2,0x8
    e4c4:	0e07d263          	bgez	a5,e5a8 <__subdf3+0x84c>
    e4c8:	411e8633          	sub	a2,t4,a7
    e4cc:	40e58733          	sub	a4,a1,a4
    e4d0:	00cebeb3          	sltu	t4,t4,a2
    e4d4:	41d70733          	sub	a4,a4,t4
    e4d8:	00871793          	sll	a5,a4,0x8
    e4dc:	00060493          	mv	s1,a2
    e4e0:	1207de63          	bgez	a5,e61c <__subdf3+0x8c0>
    e4e4:	ff8007b7          	lui	a5,0xff800
    e4e8:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e4ec:	00f77733          	and	a4,a4,a5
    e4f0:	00068413          	mv	s0,a3
    e4f4:	00100793          	li	a5,1
    e4f8:	9f1ff06f          	j	dee8 <__subdf3+0x18c>
    e4fc:	00361613          	sll	a2,a2,0x3
    e500:	00365513          	srl	a0,a2,0x3
    e504:	00058713          	mv	a4,a1
    e508:	cbdff06f          	j	e1c4 <__subdf3+0x468>
    e50c:	00361613          	sll	a2,a2,0x3
    e510:	00365913          	srl	s2,a2,0x3
    e514:	00058713          	mv	a4,a1
    e518:	cfdff06f          	j	e214 <__subdf3+0x4b8>
    e51c:	01d886b3          	add	a3,a7,t4
    e520:	00b707b3          	add	a5,a4,a1
    e524:	0116b633          	sltu	a2,a3,a7
    e528:	00c787b3          	add	a5,a5,a2
    e52c:	00879713          	sll	a4,a5,0x8
    e530:	0036d813          	srl	a6,a3,0x3
    e534:	08075e63          	bgez	a4,e5d0 <__subdf3+0x874>
    e538:	ff800737          	lui	a4,0xff800
    e53c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e540:	00e7f7b3          	and	a5,a5,a4
    e544:	01d79713          	sll	a4,a5,0x1d
    e548:	00979793          	sll	a5,a5,0x9
    e54c:	01076833          	or	a6,a4,a6
    e550:	00c7d713          	srl	a4,a5,0xc
    e554:	00100793          	li	a5,1
    e558:	9a9ff06f          	j	df00 <__subdf3+0x1a4>
    e55c:	fe068793          	add	a5,a3,-32
    e560:	02000613          	li	a2,32
    e564:	00f757b3          	srl	a5,a4,a5
    e568:	00c68a63          	beq	a3,a2,e57c <__subdf3+0x820>
    e56c:	04000613          	li	a2,64
    e570:	40d606b3          	sub	a3,a2,a3
    e574:	00d71733          	sll	a4,a4,a3
    e578:	00e8e8b3          	or	a7,a7,a4
    e57c:	01103933          	snez	s2,a7
    e580:	00f96933          	or	s2,s2,a5
    e584:	b39ff06f          	j	e0bc <__subdf3+0x360>
    e588:	0034d513          	srl	a0,s1,0x3
    e58c:	00098793          	mv	a5,s3
    e590:	00090713          	mv	a4,s2
    e594:	c31ff06f          	j	e1c4 <__subdf3+0x468>
    e598:	02000693          	li	a3,32
    e59c:	40f686b3          	sub	a3,a3,a5
    e5a0:	00000613          	li	a2,0
    e5a4:	8e9ff06f          	j	de8c <__subdf3+0x130>
    e5a8:	00c96833          	or	a6,s2,a2
    e5ac:	c8080ee3          	beqz	a6,e248 <__subdf3+0x4ec>
    e5b0:	00395913          	srl	s2,s2,0x3
    e5b4:	00000793          	li	a5,0
    e5b8:	00060713          	mv	a4,a2
    e5bc:	c59ff06f          	j	e214 <__subdf3+0x4b8>
    e5c0:	00000e13          	li	t3,0
    e5c4:	7ff00793          	li	a5,2047
    e5c8:	00080737          	lui	a4,0x80
    e5cc:	935ff06f          	j	df00 <__subdf3+0x1a4>
    e5d0:	01d79713          	sll	a4,a5,0x1d
    e5d4:	00979793          	sll	a5,a5,0x9
    e5d8:	01076833          	or	a6,a4,a6
    e5dc:	00c7d713          	srl	a4,a5,0xc
    e5e0:	00000793          	li	a5,0
    e5e4:	91dff06f          	j	df00 <__subdf3+0x1a4>
    e5e8:	ae0786e3          	beqz	a5,e0d4 <__subdf3+0x378>
    e5ec:	413f0833          	sub	a6,t5,s3
    e5f0:	00080793          	mv	a5,a6
    e5f4:	c6098ee3          	beqz	s3,e270 <__subdf3+0x514>
    e5f8:	03800793          	li	a5,56
    e5fc:	0107ca63          	blt	a5,a6,e610 <__subdf3+0x8b4>
    e600:	008007b7          	lui	a5,0x800
    e604:	00f76733          	or	a4,a4,a5
    e608:	00068413          	mv	s0,a3
    e60c:	c8dff06f          	j	e298 <__subdf3+0x53c>
    e610:	00068413          	mv	s0,a3
    e614:	00100513          	li	a0,1
    e618:	cb1ff06f          	j	e2c8 <__subdf3+0x56c>
    e61c:	01d71813          	sll	a6,a4,0x1d
    e620:	00365613          	srl	a2,a2,0x3
    e624:	00c86833          	or	a6,a6,a2
    e628:	00375713          	srl	a4,a4,0x3
    e62c:	00000793          	li	a5,0
    e630:	00068413          	mv	s0,a3
    e634:	ba5ff06f          	j	e1d8 <__subdf3+0x47c>
    e638:	ba078ae3          	beqz	a5,e1ec <__subdf3+0x490>
    e63c:	413f06b3          	sub	a3,t5,s3
    e640:	00099663          	bnez	s3,e64c <__subdf3+0x8f0>
    e644:	00068793          	mv	a5,a3
    e648:	a21ff06f          	j	e068 <__subdf3+0x30c>
    e64c:	03800793          	li	a5,56
    e650:	00100913          	li	s2,1
    e654:	a6d7c4e3          	blt	a5,a3,e0bc <__subdf3+0x360>
    e658:	008007b7          	lui	a5,0x800
    e65c:	00f76733          	or	a4,a4,a5
    e660:	a2dff06f          	j	e08c <__subdf3+0x330>

0000e664 <__unorddf2>:
    e664:	0145d713          	srl	a4,a1,0x14
    e668:	001007b7          	lui	a5,0x100
    e66c:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e670:	fff74713          	not	a4,a4
    e674:	0146d813          	srl	a6,a3,0x14
    e678:	00b7f5b3          	and	a1,a5,a1
    e67c:	00d7f7b3          	and	a5,a5,a3
    e680:	01571693          	sll	a3,a4,0x15
    e684:	7ff87813          	and	a6,a6,2047
    e688:	02068063          	beqz	a3,e6a8 <__unorddf2+0x44>
    e68c:	7ff00713          	li	a4,2047
    e690:	00000513          	li	a0,0
    e694:	00e80463          	beq	a6,a4,e69c <__unorddf2+0x38>
    e698:	00008067          	ret
    e69c:	00c7e7b3          	or	a5,a5,a2
    e6a0:	00f03533          	snez	a0,a5
    e6a4:	00008067          	ret
    e6a8:	00a5e5b3          	or	a1,a1,a0
    e6ac:	00100513          	li	a0,1
    e6b0:	fc058ee3          	beqz	a1,e68c <__unorddf2+0x28>
    e6b4:	00008067          	ret

0000e6b8 <__fixdfsi>:
    e6b8:	0145d793          	srl	a5,a1,0x14
    e6bc:	001006b7          	lui	a3,0x100
    e6c0:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e6c4:	7ff7f793          	and	a5,a5,2047
    e6c8:	3fe00613          	li	a2,1022
    e6cc:	00b77733          	and	a4,a4,a1
    e6d0:	01f5d593          	srl	a1,a1,0x1f
    e6d4:	00f65e63          	bge	a2,a5,e6f0 <__fixdfsi+0x38>
    e6d8:	41d00613          	li	a2,1053
    e6dc:	00f65e63          	bge	a2,a5,e6f8 <__fixdfsi+0x40>
    e6e0:	80000537          	lui	a0,0x80000
    e6e4:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e6e8:	00a58533          	add	a0,a1,a0
    e6ec:	00008067          	ret
    e6f0:	00000513          	li	a0,0
    e6f4:	00008067          	ret
    e6f8:	43300613          	li	a2,1075
    e6fc:	40f60633          	sub	a2,a2,a5
    e700:	01f00813          	li	a6,31
    e704:	00d76733          	or	a4,a4,a3
    e708:	02c85063          	bge	a6,a2,e728 <__fixdfsi+0x70>
    e70c:	41300693          	li	a3,1043
    e710:	40f687b3          	sub	a5,a3,a5
    e714:	00f75733          	srl	a4,a4,a5
    e718:	40e00533          	neg	a0,a4
    e71c:	fc059ce3          	bnez	a1,e6f4 <__fixdfsi+0x3c>
    e720:	00070513          	mv	a0,a4
    e724:	00008067          	ret
    e728:	bed78793          	add	a5,a5,-1043
    e72c:	00f71733          	sll	a4,a4,a5
    e730:	00c55533          	srl	a0,a0,a2
    e734:	00a76733          	or	a4,a4,a0
    e738:	fe1ff06f          	j	e718 <__fixdfsi+0x60>

0000e73c <__floatsidf>:
    e73c:	ff010113          	add	sp,sp,-16
    e740:	00112623          	sw	ra,12(sp)
    e744:	00812423          	sw	s0,8(sp)
    e748:	00912223          	sw	s1,4(sp)
    e74c:	04050a63          	beqz	a0,e7a0 <__floatsidf+0x64>
    e750:	41f55713          	sra	a4,a0,0x1f
    e754:	00a744b3          	xor	s1,a4,a0
    e758:	40e484b3          	sub	s1,s1,a4
    e75c:	00050793          	mv	a5,a0
    e760:	00048513          	mv	a0,s1
    e764:	01f7d413          	srl	s0,a5,0x1f
    e768:	69c000ef          	jal	ee04 <__clzsi2>
    e76c:	41e00793          	li	a5,1054
    e770:	40a787b3          	sub	a5,a5,a0
    e774:	00a00713          	li	a4,10
    e778:	7ff7f793          	and	a5,a5,2047
    e77c:	06a74063          	blt	a4,a0,e7dc <__floatsidf+0xa0>
    e780:	00b00713          	li	a4,11
    e784:	40a70733          	sub	a4,a4,a0
    e788:	00e4d733          	srl	a4,s1,a4
    e78c:	01550513          	add	a0,a0,21
    e790:	00c71713          	sll	a4,a4,0xc
    e794:	00a494b3          	sll	s1,s1,a0
    e798:	00c75713          	srl	a4,a4,0xc
    e79c:	0140006f          	j	e7b0 <__floatsidf+0x74>
    e7a0:	00000413          	li	s0,0
    e7a4:	00000793          	li	a5,0
    e7a8:	00000713          	li	a4,0
    e7ac:	00000493          	li	s1,0
    e7b0:	01479793          	sll	a5,a5,0x14
    e7b4:	01f41413          	sll	s0,s0,0x1f
    e7b8:	00e7e7b3          	or	a5,a5,a4
    e7bc:	00c12083          	lw	ra,12(sp)
    e7c0:	0087e7b3          	or	a5,a5,s0
    e7c4:	00812403          	lw	s0,8(sp)
    e7c8:	00048513          	mv	a0,s1
    e7cc:	00078593          	mv	a1,a5
    e7d0:	00412483          	lw	s1,4(sp)
    e7d4:	01010113          	add	sp,sp,16
    e7d8:	00008067          	ret
    e7dc:	ff550513          	add	a0,a0,-11
    e7e0:	00a49733          	sll	a4,s1,a0
    e7e4:	00c71713          	sll	a4,a4,0xc
    e7e8:	00c75713          	srl	a4,a4,0xc
    e7ec:	00000493          	li	s1,0
    e7f0:	fc1ff06f          	j	e7b0 <__floatsidf+0x74>

0000e7f4 <__floatunsidf>:
    e7f4:	ff010113          	add	sp,sp,-16
    e7f8:	00812423          	sw	s0,8(sp)
    e7fc:	00112623          	sw	ra,12(sp)
    e800:	00050413          	mv	s0,a0
    e804:	04050c63          	beqz	a0,e85c <__floatunsidf+0x68>
    e808:	5fc000ef          	jal	ee04 <__clzsi2>
    e80c:	41e00793          	li	a5,1054
    e810:	40a787b3          	sub	a5,a5,a0
    e814:	00a00713          	li	a4,10
    e818:	7ff7f793          	and	a5,a5,2047
    e81c:	06a74463          	blt	a4,a0,e884 <__floatunsidf+0x90>
    e820:	00b00713          	li	a4,11
    e824:	40a70733          	sub	a4,a4,a0
    e828:	01550513          	add	a0,a0,21
    e82c:	00e45733          	srl	a4,s0,a4
    e830:	00a41433          	sll	s0,s0,a0
    e834:	00c12083          	lw	ra,12(sp)
    e838:	00040513          	mv	a0,s0
    e83c:	00c71713          	sll	a4,a4,0xc
    e840:	00812403          	lw	s0,8(sp)
    e844:	00c75713          	srl	a4,a4,0xc
    e848:	01479793          	sll	a5,a5,0x14
    e84c:	00e7e7b3          	or	a5,a5,a4
    e850:	00078593          	mv	a1,a5
    e854:	01010113          	add	sp,sp,16
    e858:	00008067          	ret
    e85c:	00c12083          	lw	ra,12(sp)
    e860:	00040513          	mv	a0,s0
    e864:	00000793          	li	a5,0
    e868:	00812403          	lw	s0,8(sp)
    e86c:	00000713          	li	a4,0
    e870:	01479793          	sll	a5,a5,0x14
    e874:	00e7e7b3          	or	a5,a5,a4
    e878:	00078593          	mv	a1,a5
    e87c:	01010113          	add	sp,sp,16
    e880:	00008067          	ret
    e884:	ff550513          	add	a0,a0,-11
    e888:	00a41733          	sll	a4,s0,a0
    e88c:	00000413          	li	s0,0
    e890:	00c12083          	lw	ra,12(sp)
    e894:	00040513          	mv	a0,s0
    e898:	00c71713          	sll	a4,a4,0xc
    e89c:	00812403          	lw	s0,8(sp)
    e8a0:	00c75713          	srl	a4,a4,0xc
    e8a4:	01479793          	sll	a5,a5,0x14
    e8a8:	00e7e7b3          	or	a5,a5,a4
    e8ac:	00078593          	mv	a1,a5
    e8b0:	01010113          	add	sp,sp,16
    e8b4:	00008067          	ret

0000e8b8 <__trunctfdf2>:
    e8b8:	00c52583          	lw	a1,12(a0)
    e8bc:	00852783          	lw	a5,8(a0)
    e8c0:	00052803          	lw	a6,0(a0)
    e8c4:	00452683          	lw	a3,4(a0)
    e8c8:	01059613          	sll	a2,a1,0x10
    e8cc:	fe010113          	add	sp,sp,-32
    e8d0:	00159713          	sll	a4,a1,0x1
    e8d4:	01065613          	srl	a2,a2,0x10
    e8d8:	00f12423          	sw	a5,8(sp)
    e8dc:	00b12623          	sw	a1,12(sp)
    e8e0:	00f12c23          	sw	a5,24(sp)
    e8e4:	01012023          	sw	a6,0(sp)
    e8e8:	00d12223          	sw	a3,4(sp)
    e8ec:	01012823          	sw	a6,16(sp)
    e8f0:	00d12a23          	sw	a3,20(sp)
    e8f4:	00c12e23          	sw	a2,28(sp)
    e8f8:	01175713          	srl	a4,a4,0x11
    e8fc:	01f5d593          	srl	a1,a1,0x1f
    e900:	01010893          	add	a7,sp,16
    e904:	01c10793          	add	a5,sp,28
    e908:	00361513          	sll	a0,a2,0x3
    e90c:	ffc7a603          	lw	a2,-4(a5)
    e910:	ffc78793          	add	a5,a5,-4
    e914:	01d65693          	srl	a3,a2,0x1d
    e918:	00a6e6b3          	or	a3,a3,a0
    e91c:	00d7a223          	sw	a3,4(a5)
    e920:	fef894e3          	bne	a7,a5,e908 <__trunctfdf2+0x50>
    e924:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e928:	00381813          	sll	a6,a6,0x3
    e92c:	01169613          	sll	a2,a3,0x11
    e930:	01012823          	sw	a6,16(sp)
    e934:	01265613          	srl	a2,a2,0x12
    e938:	04060263          	beqz	a2,e97c <__trunctfdf2+0xc4>
    e93c:	ffffc6b7          	lui	a3,0xffffc
    e940:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e944:	00d70733          	add	a4,a4,a3
    e948:	7fe00693          	li	a3,2046
    e94c:	10e6d463          	bge	a3,a4,ea54 <__trunctfdf2+0x19c>
    e950:	7ff00793          	li	a5,2047
    e954:	00000613          	li	a2,0
    e958:	00000693          	li	a3,0
    e95c:	01479793          	sll	a5,a5,0x14
    e960:	01f59593          	sll	a1,a1,0x1f
    e964:	00c7e7b3          	or	a5,a5,a2
    e968:	00b7e7b3          	or	a5,a5,a1
    e96c:	00068513          	mv	a0,a3
    e970:	00078593          	mv	a1,a5
    e974:	02010113          	add	sp,sp,32
    e978:	00008067          	ret
    e97c:	01412603          	lw	a2,20(sp)
    e980:	01812883          	lw	a7,24(sp)
    e984:	01c12503          	lw	a0,28(sp)
    e988:	011666b3          	or	a3,a2,a7
    e98c:	00a6e6b3          	or	a3,a3,a0
    e990:	0106e6b3          	or	a3,a3,a6
    e994:	04071463          	bnez	a4,e9dc <__trunctfdf2+0x124>
    e998:	14068263          	beqz	a3,eadc <__trunctfdf2+0x224>
    e99c:	00500693          	li	a3,5
    e9a0:	00000613          	li	a2,0
    e9a4:	0036d793          	srl	a5,a3,0x3
    e9a8:	01d61693          	sll	a3,a2,0x1d
    e9ac:	00f6e6b3          	or	a3,a3,a5
    e9b0:	00961613          	sll	a2,a2,0x9
    e9b4:	7ff77793          	and	a5,a4,2047
    e9b8:	00c65613          	srl	a2,a2,0xc
    e9bc:	01479793          	sll	a5,a5,0x14
    e9c0:	01f59593          	sll	a1,a1,0x1f
    e9c4:	00c7e7b3          	or	a5,a5,a2
    e9c8:	00b7e7b3          	or	a5,a5,a1
    e9cc:	00068513          	mv	a0,a3
    e9d0:	00078593          	mv	a1,a5
    e9d4:	02010113          	add	sp,sp,32
    e9d8:	00008067          	ret
    e9dc:	12068463          	beqz	a3,eb04 <__trunctfdf2+0x24c>
    e9e0:	01c8d793          	srl	a5,a7,0x1c
    e9e4:	00451513          	sll	a0,a0,0x4
    e9e8:	00a7e7b3          	or	a5,a5,a0
    e9ec:	008006b7          	lui	a3,0x800
    e9f0:	00d7f6b3          	and	a3,a5,a3
    e9f4:	1c068263          	beqz	a3,ebb8 <__trunctfdf2+0x300>
    e9f8:	ff800737          	lui	a4,0xff800
    e9fc:	01c65693          	srl	a3,a2,0x1c
    ea00:	00489893          	sll	a7,a7,0x4
    ea04:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ea08:	00e7f633          	and	a2,a5,a4
    ea0c:	0116e6b3          	or	a3,a3,a7
    ea10:	004007b7          	lui	a5,0x400
    ea14:	00f66633          	or	a2,a2,a5
    ea18:	ff86f693          	and	a3,a3,-8
    ea1c:	00000793          	li	a5,0
    ea20:	0036d713          	srl	a4,a3,0x3
    ea24:	01d61693          	sll	a3,a2,0x1d
    ea28:	00961613          	sll	a2,a2,0x9
    ea2c:	00c65613          	srl	a2,a2,0xc
    ea30:	01479793          	sll	a5,a5,0x14
    ea34:	01f59593          	sll	a1,a1,0x1f
    ea38:	00c7e7b3          	or	a5,a5,a2
    ea3c:	00e6e6b3          	or	a3,a3,a4
    ea40:	00b7e7b3          	or	a5,a5,a1
    ea44:	00068513          	mv	a0,a3
    ea48:	00078593          	mv	a1,a5
    ea4c:	02010113          	add	sp,sp,32
    ea50:	00008067          	ret
    ea54:	0ce05c63          	blez	a4,eb2c <__trunctfdf2+0x274>
    ea58:	01412783          	lw	a5,20(sp)
    ea5c:	01812503          	lw	a0,24(sp)
    ea60:	01c12603          	lw	a2,28(sp)
    ea64:	00479693          	sll	a3,a5,0x4
    ea68:	0106e6b3          	or	a3,a3,a6
    ea6c:	01c7d793          	srl	a5,a5,0x1c
    ea70:	00451813          	sll	a6,a0,0x4
    ea74:	00461613          	sll	a2,a2,0x4
    ea78:	01c55513          	srl	a0,a0,0x1c
    ea7c:	00d036b3          	snez	a3,a3
    ea80:	0107e7b3          	or	a5,a5,a6
    ea84:	00a66633          	or	a2,a2,a0
    ea88:	00f6e6b3          	or	a3,a3,a5
    ea8c:	0076f793          	and	a5,a3,7
    ea90:	02078063          	beqz	a5,eab0 <__trunctfdf2+0x1f8>
    ea94:	00f6f793          	and	a5,a3,15
    ea98:	00400513          	li	a0,4
    ea9c:	00a78a63          	beq	a5,a0,eab0 <__trunctfdf2+0x1f8>
    eaa0:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    eaa4:	00d7b6b3          	sltu	a3,a5,a3
    eaa8:	00d60633          	add	a2,a2,a3
    eaac:	00078693          	mv	a3,a5
    eab0:	008007b7          	lui	a5,0x800
    eab4:	00f677b3          	and	a5,a2,a5
    eab8:	ee0786e3          	beqz	a5,e9a4 <__trunctfdf2+0xec>
    eabc:	00170713          	add	a4,a4,1
    eac0:	7ff00793          	li	a5,2047
    eac4:	e8f706e3          	beq	a4,a5,e950 <__trunctfdf2+0x98>
    eac8:	ff8007b7          	lui	a5,0xff800
    eacc:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ead0:	00f67633          	and	a2,a2,a5
    ead4:	7ff77793          	and	a5,a4,2047
    ead8:	f49ff06f          	j	ea20 <__trunctfdf2+0x168>
    eadc:	00000793          	li	a5,0
    eae0:	00000613          	li	a2,0
    eae4:	01479793          	sll	a5,a5,0x14
    eae8:	01f59593          	sll	a1,a1,0x1f
    eaec:	00c7e7b3          	or	a5,a5,a2
    eaf0:	00b7e7b3          	or	a5,a5,a1
    eaf4:	00068513          	mv	a0,a3
    eaf8:	00078593          	mv	a1,a5
    eafc:	02010113          	add	sp,sp,32
    eb00:	00008067          	ret
    eb04:	7ff00793          	li	a5,2047
    eb08:	00000613          	li	a2,0
    eb0c:	01479793          	sll	a5,a5,0x14
    eb10:	01f59593          	sll	a1,a1,0x1f
    eb14:	00c7e7b3          	or	a5,a5,a2
    eb18:	00b7e7b3          	or	a5,a5,a1
    eb1c:	00068513          	mv	a0,a3
    eb20:	00078593          	mv	a1,a5
    eb24:	02010113          	add	sp,sp,32
    eb28:	00008067          	ret
    eb2c:	fcc00693          	li	a3,-52
    eb30:	08d74c63          	blt	a4,a3,ebc8 <__trunctfdf2+0x310>
    eb34:	03d00693          	li	a3,61
    eb38:	40e686b3          	sub	a3,a3,a4
    eb3c:	01c12703          	lw	a4,28(sp)
    eb40:	4056de13          	sra	t3,a3,0x5
    eb44:	00080eb7          	lui	t4,0x80
    eb48:	00eeeeb3          	or	t4,t4,a4
    eb4c:	002e1513          	sll	a0,t3,0x2
    eb50:	01d12e23          	sw	t4,28(sp)
    eb54:	01f6f693          	and	a3,a3,31
    eb58:	00a88833          	add	a6,a7,a0
    eb5c:	00088613          	mv	a2,a7
    eb60:	00000713          	li	a4,0
    eb64:	00062303          	lw	t1,0(a2)
    eb68:	00460613          	add	a2,a2,4
    eb6c:	00676733          	or	a4,a4,t1
    eb70:	fec81ae3          	bne	a6,a2,eb64 <__trunctfdf2+0x2ac>
    eb74:	00300613          	li	a2,3
    eb78:	41c60633          	sub	a2,a2,t3
    eb7c:	04069a63          	bnez	a3,ebd0 <__trunctfdf2+0x318>
    eb80:	00082803          	lw	a6,0(a6)
    eb84:	00168693          	add	a3,a3,1
    eb88:	00478793          	add	a5,a5,4
    eb8c:	ff07ae23          	sw	a6,-4(a5)
    eb90:	00d64e63          	blt	a2,a3,ebac <__trunctfdf2+0x2f4>
    eb94:	00a78833          	add	a6,a5,a0
    eb98:	00082803          	lw	a6,0(a6)
    eb9c:	00168693          	add	a3,a3,1
    eba0:	00478793          	add	a5,a5,4
    eba4:	ff07ae23          	sw	a6,-4(a5)
    eba8:	fed656e3          	bge	a2,a3,eb94 <__trunctfdf2+0x2dc>
    ebac:	00400793          	li	a5,4
    ebb0:	41c787b3          	sub	a5,a5,t3
    ebb4:	0840006f          	j	ec38 <__trunctfdf2+0x380>
    ebb8:	00000593          	li	a1,0
    ebbc:	7ff00793          	li	a5,2047
    ebc0:	00080637          	lui	a2,0x80
    ebc4:	d99ff06f          	j	e95c <__trunctfdf2+0xa4>
    ebc8:	00000713          	li	a4,0
    ebcc:	dd1ff06f          	j	e99c <__trunctfdf2+0xe4>
    ebd0:	02050813          	add	a6,a0,32
    ebd4:	00280833          	add	a6,a6,sp
    ebd8:	ff082803          	lw	a6,-16(a6)
    ebdc:	02000f13          	li	t5,32
    ebe0:	40df0f33          	sub	t5,t5,a3
    ebe4:	01e81833          	sll	a6,a6,t5
    ebe8:	01076733          	or	a4,a4,a6
    ebec:	08060e63          	beqz	a2,ec88 <__trunctfdf2+0x3d0>
    ebf0:	00261813          	sll	a6,a2,0x2
    ebf4:	00f80fb3          	add	t6,a6,a5
    ebf8:	00a88633          	add	a2,a7,a0
    ebfc:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    ec00:	00462303          	lw	t1,4(a2)
    ec04:	00478793          	add	a5,a5,4
    ec08:	00d55533          	srl	a0,a0,a3
    ec0c:	01e31333          	sll	t1,t1,t5
    ec10:	00656533          	or	a0,a0,t1
    ec14:	fea7ae23          	sw	a0,-4(a5)
    ec18:	00460613          	add	a2,a2,4
    ec1c:	feff90e3          	bne	t6,a5,ebfc <__trunctfdf2+0x344>
    ec20:	00400793          	li	a5,4
    ec24:	41c787b3          	sub	a5,a5,t3
    ec28:	02080613          	add	a2,a6,32
    ec2c:	00260633          	add	a2,a2,sp
    ec30:	00dedeb3          	srl	t4,t4,a3
    ec34:	ffd62823          	sw	t4,-16(a2)
    ec38:	00400693          	li	a3,4
    ec3c:	40f686b3          	sub	a3,a3,a5
    ec40:	00269693          	sll	a3,a3,0x2
    ec44:	00279793          	sll	a5,a5,0x2
    ec48:	00800613          	li	a2,8
    ec4c:	00f888b3          	add	a7,a7,a5
    ec50:	00c6ea63          	bltu	a3,a2,ec64 <__trunctfdf2+0x3ac>
    ec54:	0008a023          	sw	zero,0(a7)
    ec58:	0008a223          	sw	zero,4(a7)
    ec5c:	ff868693          	add	a3,a3,-8
    ec60:	00888893          	add	a7,a7,8
    ec64:	00400793          	li	a5,4
    ec68:	00f6e463          	bltu	a3,a5,ec70 <__trunctfdf2+0x3b8>
    ec6c:	0008a023          	sw	zero,0(a7)
    ec70:	01012783          	lw	a5,16(sp)
    ec74:	00e03733          	snez	a4,a4
    ec78:	01412603          	lw	a2,20(sp)
    ec7c:	00f766b3          	or	a3,a4,a5
    ec80:	00000713          	li	a4,0
    ec84:	e09ff06f          	j	ea8c <__trunctfdf2+0x1d4>
    ec88:	00100793          	li	a5,1
    ec8c:	00000813          	li	a6,0
    ec90:	f99ff06f          	j	ec28 <__trunctfdf2+0x370>

0000ec94 <__mulsi3>:
    ec94:	00050613          	mv	a2,a0
    ec98:	00000513          	li	a0,0
    ec9c:	0015f693          	and	a3,a1,1
    eca0:	00068463          	beqz	a3,eca8 <__mulsi3+0x14>
    eca4:	00c50533          	add	a0,a0,a2
    eca8:	0015d593          	srl	a1,a1,0x1
    ecac:	00161613          	sll	a2,a2,0x1
    ecb0:	fe0596e3          	bnez	a1,ec9c <__mulsi3+0x8>
    ecb4:	00008067          	ret

0000ecb8 <__muldi3>:
    ecb8:	ff010113          	add	sp,sp,-16
    ecbc:	00812423          	sw	s0,8(sp)
    ecc0:	00050413          	mv	s0,a0
    ecc4:	00112623          	sw	ra,12(sp)
    ecc8:	00060513          	mv	a0,a2
    eccc:	00068393          	mv	t2,a3
    ecd0:	00040713          	mv	a4,s0
    ecd4:	00060813          	mv	a6,a2
    ecd8:	00000793          	li	a5,0
    ecdc:	00000313          	li	t1,0
    ece0:	00000f13          	li	t5,0
    ece4:	01e708b3          	add	a7,a4,t5
    ece8:	00187e93          	and	t4,a6,1
    ecec:	00f30fb3          	add	t6,t1,a5
    ecf0:	01f75e13          	srl	t3,a4,0x1f
    ecf4:	00185813          	srl	a6,a6,0x1
    ecf8:	00e8b2b3          	sltu	t0,a7,a4
    ecfc:	00179793          	sll	a5,a5,0x1
    ed00:	000e8663          	beqz	t4,ed0c <__muldi3+0x54>
    ed04:	00088f13          	mv	t5,a7
    ed08:	01f28333          	add	t1,t0,t6
    ed0c:	00171713          	sll	a4,a4,0x1
    ed10:	01c7e7b3          	or	a5,a5,t3
    ed14:	fc0818e3          	bnez	a6,ece4 <__muldi3+0x2c>
    ed18:	00058663          	beqz	a1,ed24 <__muldi3+0x6c>
    ed1c:	f79ff0ef          	jal	ec94 <__mulsi3>
    ed20:	00650333          	add	t1,a0,t1
    ed24:	00038a63          	beqz	t2,ed38 <__muldi3+0x80>
    ed28:	00040513          	mv	a0,s0
    ed2c:	00038593          	mv	a1,t2
    ed30:	f65ff0ef          	jal	ec94 <__mulsi3>
    ed34:	00650333          	add	t1,a0,t1
    ed38:	00c12083          	lw	ra,12(sp)
    ed3c:	00812403          	lw	s0,8(sp)
    ed40:	000f0513          	mv	a0,t5
    ed44:	00030593          	mv	a1,t1
    ed48:	01010113          	add	sp,sp,16
    ed4c:	00008067          	ret

0000ed50 <__divsi3>:
    ed50:	06054063          	bltz	a0,edb0 <__umodsi3+0x10>
    ed54:	0605c663          	bltz	a1,edc0 <__umodsi3+0x20>

0000ed58 <__hidden___udivsi3>:
    ed58:	00058613          	mv	a2,a1
    ed5c:	00050593          	mv	a1,a0
    ed60:	fff00513          	li	a0,-1
    ed64:	02060c63          	beqz	a2,ed9c <__hidden___udivsi3+0x44>
    ed68:	00100693          	li	a3,1
    ed6c:	00b67a63          	bgeu	a2,a1,ed80 <__hidden___udivsi3+0x28>
    ed70:	00c05863          	blez	a2,ed80 <__hidden___udivsi3+0x28>
    ed74:	00161613          	sll	a2,a2,0x1
    ed78:	00169693          	sll	a3,a3,0x1
    ed7c:	feb66ae3          	bltu	a2,a1,ed70 <__hidden___udivsi3+0x18>
    ed80:	00000513          	li	a0,0
    ed84:	00c5e663          	bltu	a1,a2,ed90 <__hidden___udivsi3+0x38>
    ed88:	40c585b3          	sub	a1,a1,a2
    ed8c:	00d56533          	or	a0,a0,a3
    ed90:	0016d693          	srl	a3,a3,0x1
    ed94:	00165613          	srl	a2,a2,0x1
    ed98:	fe0696e3          	bnez	a3,ed84 <__hidden___udivsi3+0x2c>
    ed9c:	00008067          	ret

0000eda0 <__umodsi3>:
    eda0:	00008293          	mv	t0,ra
    eda4:	fb5ff0ef          	jal	ed58 <__hidden___udivsi3>
    eda8:	00058513          	mv	a0,a1
    edac:	00028067          	jr	t0
    edb0:	40a00533          	neg	a0,a0
    edb4:	00b04863          	bgtz	a1,edc4 <__umodsi3+0x24>
    edb8:	40b005b3          	neg	a1,a1
    edbc:	f9dff06f          	j	ed58 <__hidden___udivsi3>
    edc0:	40b005b3          	neg	a1,a1
    edc4:	00008293          	mv	t0,ra
    edc8:	f91ff0ef          	jal	ed58 <__hidden___udivsi3>
    edcc:	40a00533          	neg	a0,a0
    edd0:	00028067          	jr	t0

0000edd4 <__modsi3>:
    edd4:	00008293          	mv	t0,ra
    edd8:	0005ca63          	bltz	a1,edec <__modsi3+0x18>
    eddc:	00054c63          	bltz	a0,edf4 <__modsi3+0x20>
    ede0:	f79ff0ef          	jal	ed58 <__hidden___udivsi3>
    ede4:	00058513          	mv	a0,a1
    ede8:	00028067          	jr	t0
    edec:	40b005b3          	neg	a1,a1
    edf0:	fe0558e3          	bgez	a0,ede0 <__modsi3+0xc>
    edf4:	40a00533          	neg	a0,a0
    edf8:	f61ff0ef          	jal	ed58 <__hidden___udivsi3>
    edfc:	40b00533          	neg	a0,a1
    ee00:	00028067          	jr	t0

0000ee04 <__clzsi2>:
    ee04:	000107b7          	lui	a5,0x10
    ee08:	02f57a63          	bgeu	a0,a5,ee3c <__clzsi2+0x38>
    ee0c:	10053793          	sltiu	a5,a0,256
    ee10:	0017b793          	seqz	a5,a5
    ee14:	00379793          	sll	a5,a5,0x3
    ee18:	02000713          	li	a4,32
    ee1c:	40f70733          	sub	a4,a4,a5
    ee20:	00f55533          	srl	a0,a0,a5
    ee24:	00001797          	auipc	a5,0x1
    ee28:	b4c78793          	add	a5,a5,-1204 # f970 <__clz_tab>
    ee2c:	00a787b3          	add	a5,a5,a0
    ee30:	0007c503          	lbu	a0,0(a5)
    ee34:	40a70533          	sub	a0,a4,a0
    ee38:	00008067          	ret
    ee3c:	010007b7          	lui	a5,0x1000
    ee40:	02f57463          	bgeu	a0,a5,ee68 <__clzsi2+0x64>
    ee44:	01000793          	li	a5,16
    ee48:	00f55533          	srl	a0,a0,a5
    ee4c:	00001797          	auipc	a5,0x1
    ee50:	b2478793          	add	a5,a5,-1244 # f970 <__clz_tab>
    ee54:	00a787b3          	add	a5,a5,a0
    ee58:	0007c503          	lbu	a0,0(a5)
    ee5c:	01000713          	li	a4,16
    ee60:	40a70533          	sub	a0,a4,a0
    ee64:	00008067          	ret
    ee68:	01800793          	li	a5,24
    ee6c:	00f55533          	srl	a0,a0,a5
    ee70:	00001797          	auipc	a5,0x1
    ee74:	b0078793          	add	a5,a5,-1280 # f970 <__clz_tab>
    ee78:	00a787b3          	add	a5,a5,a0
    ee7c:	0007c503          	lbu	a0,0(a5)
    ee80:	00800713          	li	a4,8
    ee84:	40a70533          	sub	a0,a4,a0
    ee88:	00008067          	ret
