
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x2b4>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	0000f397          	auipc	t2,0xf
      38:	7d438393          	add	t2,t2,2004 # f808 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80001597          	auipc	a1,0x80001
      58:	c4058593          	add	a1,a1,-960 # 80000c94 <__crt0_bss_end>
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
     110:	c8840413          	add	s0,s0,-888 # ed94 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	c8048493          	add	s1,s1,-896 # ed94 <__fini_array_end>

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
     178:	c2040413          	add	s0,s0,-992 # ed94 <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	c1848493          	add	s1,s1,-1000 # ed94 <__fini_array_end>

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
#define CFS_C0        16

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

0000020c <print_speedup_fixed>:
  return (int32_t)r;
}

static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
static void print_speedup_fixed(uint64_t num, uint64_t den){ if(!den){printf("  n/a   ");return;} uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x", s/1000, s%1000); }
     20c:	00d667b3          	or	a5,a2,a3
     210:	00079863          	bnez	a5,220 <print_speedup_fixed+0x14>
     214:	0000f537          	lui	a0,0xf
     218:	d9850513          	add	a0,a0,-616 # ed98 <__fini_array_end+0x4>
     21c:	2210006f          	j	c3c <printf>
     220:	fe010113          	add	sp,sp,-32
     224:	00812c23          	sw	s0,24(sp)
     228:	00912a23          	sw	s1,20(sp)
     22c:	00068413          	mv	s0,a3
     230:	00060493          	mv	s1,a2
     234:	00000693          	li	a3,0
     238:	3e800613          	li	a2,1000
     23c:	00112e23          	sw	ra,28(sp)
     240:	1810e0ef          	jal	ebc0 <__muldi3>
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
     270:	1580b0ef          	jal	b3c8 <__udivdi3>
     274:	3e800613          	li	a2,1000
     278:	00000693          	li	a3,0
     27c:	00050493          	mv	s1,a0
     280:	00058413          	mv	s0,a1
     284:	7f00b0ef          	jal	ba74 <__umoddi3>
     288:	00a12623          	sw	a0,12(sp)
     28c:	00b12423          	sw	a1,8(sp)
     290:	3e800613          	li	a2,1000
     294:	00000693          	li	a3,0
     298:	00048513          	mv	a0,s1
     29c:	00040593          	mv	a1,s0
     2a0:	1280b0ef          	jal	b3c8 <__udivdi3>
     2a4:	01812403          	lw	s0,24(sp)
     2a8:	00c12703          	lw	a4,12(sp)
     2ac:	00812783          	lw	a5,8(sp)
     2b0:	01c12083          	lw	ra,28(sp)
     2b4:	01412483          	lw	s1,20(sp)
     2b8:	00050613          	mv	a2,a0
     2bc:	0000f537          	lui	a0,0xf
     2c0:	00058693          	mv	a3,a1
     2c4:	da450513          	add	a0,a0,-604 # eda4 <__fini_array_end+0x10>
     2c8:	02010113          	add	sp,sp,32
     2cc:	1710006f          	j	c3c <printf>

000002d0 <main>:
  cfs_gemm_systolic_4xK_Kx4_strict_per_step(A_flat,B_flat,N); cfs_read_C(C4);
  for(int i=0;i<N;++i) for(int j=0;j<N;++j) C[i][j]=C4[i][j];
}

int main(void){
  printf("== 4x4 GEMM: SW vs CFU vs CFS ==\n");
     2d0:	0000f537          	lui	a0,0xf
int main(void){
     2d4:	e8010113          	add	sp,sp,-384
  printf("== 4x4 GEMM: SW vs CFU vs CFS ==\n");
     2d8:	dc450513          	add	a0,a0,-572 # edc4 <__fini_array_end+0x30>
int main(void){
     2dc:	16112e23          	sw	ra,380(sp)
     2e0:	17212823          	sw	s2,368(sp)
     2e4:	16812c23          	sw	s0,376(sp)
     2e8:	16912a23          	sw	s1,372(sp)
     2ec:	17312623          	sw	s3,364(sp)
     2f0:	17412423          	sw	s4,360(sp)
     2f4:	17512223          	sw	s5,356(sp)
     2f8:	17612023          	sw	s6,352(sp)
     2fc:	15712e23          	sw	s7,348(sp)
     300:	15812c23          	sw	s8,344(sp)
     304:	15912a23          	sw	s9,340(sp)
     308:	15a12823          	sw	s10,336(sp)
     30c:	15b12623          	sw	s11,332(sp)
  printf("== 4x4 GEMM: SW vs CFU vs CFS ==\n");
     310:	2c1000ef          	jal	dd0 <puts>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     314:	ffeb07b7          	lui	a5,0xffeb0
     318:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     31c:	0000f537          	lui	a0,0xf
     320:	de850513          	add	a0,a0,-536 # ede8 <__fini_array_end+0x54>
     324:	119000ef          	jal	c3c <printf>
  int8_t A[N][N], B[N][N]; int32_t Csw[N][N], Ccfu[N][N], Ccfs[N][N];
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     328:	02010913          	add	s2,sp,32
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     32c:	00090593          	mv	a1,s2
     330:	00100693          	li	a3,1
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     334:	00400813          	li	a6,4
     338:	00500893          	li	a7,5
     33c:	0ff6f613          	zext.b	a2,a3
     340:	00261793          	sll	a5,a2,0x2
     344:	40f607b3          	sub	a5,a2,a5
     348:	0ff7f793          	zext.b	a5,a5
     34c:	00000713          	li	a4,0
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     350:	00f7f513          	and	a0,a5,15
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     354:	00e58333          	add	t1,a1,a4
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     358:	ff850513          	add	a0,a0,-8
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     35c:	00c787b3          	add	a5,a5,a2
     360:	00a30023          	sb	a0,0(t1)
     364:	00170713          	add	a4,a4,1
     368:	0ff7f793          	zext.b	a5,a5
     36c:	ff0712e3          	bne	a4,a6,350 <main+0x80>
     370:	00168693          	add	a3,a3,1
     374:	00458593          	add	a1,a1,4
     378:	fd1692e3          	bne	a3,a7,33c <main+0x6c>
     37c:	03010d93          	add	s11,sp,48
     380:	000d8613          	mv	a2,s11
     384:	00500713          	li	a4,5
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     388:	00400513          	li	a0,4
     38c:	00100813          	li	a6,1
     390:	40e007b3          	neg	a5,a4
     394:	00179793          	sll	a5,a5,0x1
     398:	0ff7f793          	zext.b	a5,a5
     39c:	00000693          	li	a3,0
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     3a0:	00f7f593          	and	a1,a5,15
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3a4:	00d608b3          	add	a7,a2,a3
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     3a8:	ff858593          	add	a1,a1,-8
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3ac:	00e787b3          	add	a5,a5,a4
     3b0:	00b88023          	sb	a1,0(a7)
     3b4:	00168693          	add	a3,a3,1
     3b8:	0ff7f793          	zext.b	a5,a5
     3bc:	fea692e3          	bne	a3,a0,3a0 <main+0xd0>
     3c0:	fff70713          	add	a4,a4,-1
     3c4:	0ff77713          	zext.b	a4,a4
     3c8:	00460613          	add	a2,a2,4
     3cc:	fd0712e3          	bne	a4,a6,390 <main+0xc0>

  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_ref(A,B,Csw); uint64_t i1=rdinstret(), c1=rdcycle();
     3d0:	e15ff0ef          	jal	1e4 <rdcycle>
     3d4:	00050993          	mv	s3,a0
     3d8:	00058b93          	mv	s7,a1
     3dc:	e1dff0ef          	jal	1f8 <rdinstret>
     3e0:	00050493          	mv	s1,a0
     3e4:	00058b13          	mv	s6,a1
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){ int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s; }
     3e8:	04010a93          	add	s5,sp,64
     3ec:	08010c13          	add	s8,sp,128
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_ref(A,B,Csw); uint64_t i1=rdinstret(), c1=rdcycle();
     3f0:	00090c93          	mv	s9,s2
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){ int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s; }
     3f4:	00000413          	li	s0,0
     3f8:	0440006f          	j	43c <main+0x16c>
     3fc:	014c86b3          	add	a3,s9,s4
     400:	00078583          	lb	a1,0(a5)
     404:	00068503          	lb	a0,0(a3)
     408:	00f12423          	sw	a5,8(sp)
     40c:	001a0a13          	add	s4,s4,1
     410:	78c0e0ef          	jal	eb9c <__mulsi3>
     414:	00812783          	lw	a5,8(sp)
     418:	00400713          	li	a4,4
     41c:	00ad0d33          	add	s10,s10,a0
     420:	00478793          	add	a5,a5,4
     424:	fcea1ce3          	bne	s4,a4,3fc <main+0x12c>
     428:	00241793          	sll	a5,s0,0x2
     42c:	00fa87b3          	add	a5,s5,a5
     430:	01a7a023          	sw	s10,0(a5)
     434:	00140413          	add	s0,s0,1
     438:	01440a63          	beq	s0,s4,44c <main+0x17c>
     43c:	01b407b3          	add	a5,s0,s11
     440:	00000d13          	li	s10,0
     444:	00000a13          	li	s4,0
     448:	fb5ff06f          	j	3fc <main+0x12c>
     44c:	010a8a93          	add	s5,s5,16
     450:	004c8c93          	add	s9,s9,4
     454:	fb5c10e3          	bne	s8,s5,3f4 <main+0x124>
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_ref(A,B,Csw); uint64_t i1=rdinstret(), c1=rdcycle();
     458:	da1ff0ef          	jal	1f8 <rdinstret>
     45c:	00050a13          	mv	s4,a0
     460:	00058413          	mv	s0,a1
     464:	d81ff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     468:	413509b3          	sub	s3,a0,s3
     46c:	41758ab3          	sub	s5,a1,s7
     470:	013537b3          	sltu	a5,a0,s3
     474:	409a04b3          	sub	s1,s4,s1
     478:	40fa87b3          	sub	a5,s5,a5
     47c:	009a3a33          	sltu	s4,s4,s1
     480:	41640433          	sub	s0,s0,s6
     484:	00f12423          	sw	a5,8(sp)
     488:	414407b3          	sub	a5,s0,s4
     48c:	00f12623          	sw	a5,12(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     490:	d55ff0ef          	jal	1e4 <rdcycle>
     494:	00050b93          	mv	s7,a0
     498:	00058c93          	mv	s9,a1
     49c:	d5dff0ef          	jal	1f8 <rdinstret>
     4a0:	00050b13          	mv	s6,a0
     4a4:	00058a13          	mv	s4,a1
  for(int i=0;i<N;++i){
     4a8:	000c0793          	mv	a5,s8
     4ac:	0c010a93          	add	s5,sp,192
  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     4b0:	00090513          	mv	a0,s2
         (((uint32_t)(uint8_t)x2) << 16) |
     4b4:	00052883          	lw	a7,0(a0)
     4b8:	000d8613          	mv	a2,s11
     4bc:	01078593          	add	a1,a5,16
         (((uint32_t)(uint8_t)x1) << 8)  |
     4c0:	00464683          	lbu	a3,4(a2)
         (((uint32_t)(uint8_t)x2) << 16) |
     4c4:	00864803          	lbu	a6,8(a2)
         (((uint32_t)(uint8_t)x1) << 8)  |
     4c8:	00869693          	sll	a3,a3,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     4cc:	01081813          	sll	a6,a6,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     4d0:	0106e6b3          	or	a3,a3,a6
  return  ((uint32_t)(uint8_t)x0)        |
     4d4:	00064803          	lbu	a6,0(a2)
         (((uint32_t)(uint8_t)x1) << 8)  |
     4d8:	0106e6b3          	or	a3,a3,a6
         (((uint32_t)(uint8_t)x3) << 24);
     4dc:	00c64803          	lbu	a6,12(a2)
     4e0:	01881813          	sll	a6,a6,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     4e4:	0106e6b3          	or	a3,a3,a6
  __asm__ volatile (".insn r 0x0B, %1, %2, %0, %3, %4"
     4e8:	02d8868b          	.insn	4, 0x02d8868b
      C[i][j]=cfu_dp4a((int32_t)ap,(int32_t)bp);
     4ec:	00d7a023          	sw	a3,0(a5)
    for(int j=0;j<N;++j){
     4f0:	00478793          	add	a5,a5,4
     4f4:	00160613          	add	a2,a2,1
     4f8:	fcf594e3          	bne	a1,a5,4c0 <main+0x1f0>
  for(int i=0;i<N;++i){
     4fc:	00450513          	add	a0,a0,4
     500:	49559063          	bne	a1,s5,980 <main+0x6b0>
  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     504:	cf5ff0ef          	jal	1f8 <rdinstret>
     508:	00050c13          	mv	s8,a0
     50c:	00058413          	mv	s0,a1
     510:	cd5ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     514:	41750bb3          	sub	s7,a0,s7
     518:	41958cb3          	sub	s9,a1,s9
     51c:	01753533          	sltu	a0,a0,s7
     520:	416c0b33          	sub	s6,s8,s6
     524:	40ac87b3          	sub	a5,s9,a0
     528:	41440a33          	sub	s4,s0,s4
     52c:	016c3c33          	sltu	s8,s8,s6
     530:	00f12823          	sw	a5,16(sp)
     534:	418a07b3          	sub	a5,s4,s8
     538:	00f12a23          	sw	a5,20(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     53c:	ca9ff0ef          	jal	1e4 <rdcycle>
     540:	00050413          	mv	s0,a0
     544:	00058a13          	mv	s4,a1
     548:	cb1ff0ef          	jal	1f8 <rdinstret>
     54c:	800016b7          	lui	a3,0x80001
     550:	00050c93          	mv	s9,a0
     554:	00b12c23          	sw	a1,24(sp)
     558:	00000613          	li	a2,0
  for(int r=0;r<4;++r) for(int k=0;k<LDA;++k) A_flat[r*LDA+k]=(k<N)?A[r][k]:0;
     55c:	00300813          	li	a6,3
     560:	93468693          	add	a3,a3,-1740 # 80000934 <A_flat.1>
     564:	08000893          	li	a7,128
     568:	20000313          	li	t1,512
     56c:	00000793          	li	a5,0
     570:	00c68533          	add	a0,a3,a2
     574:	00000593          	li	a1,0
     578:	00f84663          	blt	a6,a5,584 <main+0x2b4>
     57c:	00f905b3          	add	a1,s2,a5
     580:	00058583          	lb	a1,0(a1)
     584:	00f50e33          	add	t3,a0,a5
     588:	00be0023          	sb	a1,0(t3)
     58c:	00178793          	add	a5,a5,1
     590:	ff1792e3          	bne	a5,a7,574 <main+0x2a4>
     594:	08060613          	add	a2,a2,128
     598:	00490913          	add	s2,s2,4
     59c:	fc6618e3          	bne	a2,t1,56c <main+0x29c>
     5a0:	800007b7          	lui	a5,0x80000
     5a4:	73478893          	add	a7,a5,1844 # 80000734 <B_flat.0>
  for(int k=0;k<LDA;++k){ B_flat[k*LDB+0]=(k<N)?B[k][0]:0; B_flat[k*LDB+1]=(k<N)?B[k][1]:0; B_flat[k*LDB+2]=(k<N)?B[k][2]:0; B_flat[k*LDB+3]=(k<N)?B[k][3]:0; }
     5a8:	00000613          	li	a2,0
  for(int r=0;r<4;++r) for(int k=0;k<LDA;++k) A_flat[r*LDA+k]=(k<N)?A[r][k]:0;
     5ac:	73478793          	add	a5,a5,1844
  for(int k=0;k<LDA;++k){ B_flat[k*LDB+0]=(k<N)?B[k][0]:0; B_flat[k*LDB+1]=(k<N)?B[k][1]:0; B_flat[k*LDB+2]=(k<N)?B[k][2]:0; B_flat[k*LDB+3]=(k<N)?B[k][3]:0; }
     5b0:	00300593          	li	a1,3
     5b4:	08000813          	li	a6,128
     5b8:	00000513          	li	a0,0
     5bc:	00c5c463          	blt	a1,a2,5c4 <main+0x2f4>
     5c0:	000d8503          	lb	a0,0(s11)
     5c4:	00a78023          	sb	a0,0(a5)
     5c8:	00000513          	li	a0,0
     5cc:	00c5c463          	blt	a1,a2,5d4 <main+0x304>
     5d0:	001d8503          	lb	a0,1(s11)
     5d4:	00a780a3          	sb	a0,1(a5)
     5d8:	00000513          	li	a0,0
     5dc:	00c5c463          	blt	a1,a2,5e4 <main+0x314>
     5e0:	002d8503          	lb	a0,2(s11)
     5e4:	00a78123          	sb	a0,2(a5)
     5e8:	00000513          	li	a0,0
     5ec:	00c5c463          	blt	a1,a2,5f4 <main+0x324>
     5f0:	003d8503          	lb	a0,3(s11)
     5f4:	00a781a3          	sb	a0,3(a5)
     5f8:	00160613          	add	a2,a2,1
     5fc:	00478793          	add	a5,a5,4
     600:	004d8d93          	add	s11,s11,4
     604:	fb061ae3          	bne	a2,a6,5b8 <main+0x2e8>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     608:	ffeb07b7          	lui	a5,0xffeb0
     60c:	00200613          	li	a2,2
     610:	ffeb0937          	lui	s2,0xffeb0
     614:	ffeb03b7          	lui	t2,0xffeb0
     618:	ffeb02b7          	lui	t0,0xffeb0
     61c:	ffeb0fb7          	lui	t6,0xffeb0
     620:	ffeb0f37          	lui	t5,0xffeb0
     624:	ffeb0eb7          	lui	t4,0xffeb0
     628:	ffeb0e37          	lui	t3,0xffeb0
     62c:	ffeb0337          	lui	t1,0xffeb0
     630:	00c7a023          	sw	a2,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)?A_flat[i*LDA+k]:0; Aword[i]=(uint32_t)(uint8_t)a; }
     634:	00300d93          	li	s11,3
  for(int s=0;s<T;++s){
     638:	00000793          	li	a5,0
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)?A_flat[i*LDA+k]:0; Aword[i]=(uint32_t)(uint8_t)a; }
     63c:	00400093          	li	ra,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     640:	00490913          	add	s2,s2,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     644:	00838393          	add	t2,t2,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     648:	00c28293          	add	t0,t0,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     64c:	010f8f93          	add	t6,t6,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     650:	014f0f13          	add	t5,t5,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     654:	018e8e93          	add	t4,t4,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     658:	01ce0e13          	add	t3,t3,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     65c:	02030313          	add	t1,t1,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
  for(int s=0;s<T;++s){
     660:	00a00713          	li	a4,10
    uint32_t Aword[4]={0},Bword[4]={0};
     664:	0c012023          	sw	zero,192(sp)
     668:	0c012223          	sw	zero,196(sp)
     66c:	0c012423          	sw	zero,200(sp)
     670:	0c012623          	sw	zero,204(sp)
     674:	10012023          	sw	zero,256(sp)
     678:	10012223          	sw	zero,260(sp)
     67c:	10012423          	sw	zero,264(sp)
     680:	10012623          	sw	zero,268(sp)
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)?A_flat[i*LDA+k]:0; Aword[i]=(uint32_t)(uint8_t)a; }
     684:	000a8813          	mv	a6,s5
     688:	00f68533          	add	a0,a3,a5
     68c:	00000613          	li	a2,0
     690:	40c78c33          	sub	s8,a5,a2
     694:	00000593          	li	a1,0
     698:	018de463          	bltu	s11,s8,6a0 <main+0x3d0>
     69c:	00050583          	lb	a1,0(a0)
     6a0:	0ff5f593          	zext.b	a1,a1
     6a4:	00b82023          	sw	a1,0(a6)
     6a8:	00160613          	add	a2,a2,1
     6ac:	00480813          	add	a6,a6,4
     6b0:	07f50513          	add	a0,a0,127
     6b4:	fc161ee3          	bne	a2,ra,690 <main+0x3c0>
     6b8:	10010513          	add	a0,sp,256
     6bc:	00088c13          	mv	s8,a7
    for(int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<K)?B_flat[k*LDB+j]:0; Bword[j]=(uint32_t)(uint8_t)b; }
     6c0:	00000613          	li	a2,0
     6c4:	00050593          	mv	a1,a0
     6c8:	40c78d33          	sub	s10,a5,a2
     6cc:	00000813          	li	a6,0
     6d0:	01ade463          	bltu	s11,s10,6d8 <main+0x408>
     6d4:	000c0803          	lb	a6,0(s8)
     6d8:	0ff87813          	zext.b	a6,a6
     6dc:	01052023          	sw	a6,0(a0)
     6e0:	00160613          	add	a2,a2,1
     6e4:	00450513          	add	a0,a0,4
     6e8:	ffdc0c13          	add	s8,s8,-3
     6ec:	fc161ee3          	bne	a2,ra,6c8 <main+0x3f8>
    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]); cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
     6f0:	0c012603          	lw	a2,192(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6f4:	00100513          	li	a0,1
  for(int s=0;s<T;++s){
     6f8:	00178793          	add	a5,a5,1
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6fc:	00c92023          	sw	a2,0(s2)
    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]); cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
     700:	0c412603          	lw	a2,196(sp)
  for(int s=0;s<T;++s){
     704:	00488893          	add	a7,a7,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     708:	00c3a023          	sw	a2,0(t2)
    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]); cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
     70c:	0c812603          	lw	a2,200(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     710:	00c2a023          	sw	a2,0(t0)
    cfs_write(CFS_A0,Aword[0]); cfs_write(CFS_A1,Aword[1]); cfs_write(CFS_A2,Aword[2]); cfs_write(CFS_A3,Aword[3]);
     714:	0cc12603          	lw	a2,204(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     718:	00cfa023          	sw	a2,0(t6)
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]); cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);
     71c:	10012603          	lw	a2,256(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     720:	00cf2023          	sw	a2,0(t5)
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]); cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);
     724:	10412603          	lw	a2,260(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     728:	00cea023          	sw	a2,0(t4)
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]); cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);
     72c:	10812603          	lw	a2,264(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     730:	00ce2023          	sw	a2,0(t3)
    cfs_write(CFS_B0,Bword[0]); cfs_write(CFS_B1,Bword[1]); cfs_write(CFS_B2,Bword[2]); cfs_write(CFS_B3,Bword[3]);
     734:	10c12603          	lw	a2,268(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     738:	00c32023          	sw	a2,0(t1)
     73c:	ffeb0637          	lui	a2,0xffeb0
     740:	00a62023          	sw	a0,0(a2) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  for(int s=0;s<T;++s){
     744:	f2e790e3          	bne	a5,a4,664 <main+0x394>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     748:	ffeb0537          	lui	a0,0xffeb0
     74c:	00058813          	mv	a6,a1
  for(int s=0;s<T;++s){
     750:	00000693          	li	a3,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     754:	04050513          	add	a0,a0,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
static void cfs_read_C(int32_t dst[4][4]){ for(int i=0;i<4;++i) for(int j=0;j<4;++j) dst[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j); }
     758:	01000893          	li	a7,16
     75c:	00269613          	sll	a2,a3,0x2
     760:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     764:	00a60633          	add	a2,a2,a0
     768:	00f60333          	add	t1,a2,a5
     76c:	00032e03          	lw	t3,0(t1)
static void cfs_read_C(int32_t dst[4][4]){ for(int i=0;i<4;++i) for(int j=0;j<4;++j) dst[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j); }
     770:	00f80333          	add	t1,a6,a5
     774:	00478793          	add	a5,a5,4
     778:	01c32023          	sw	t3,0(t1)
     77c:	ff1796e3          	bne	a5,a7,768 <main+0x498>
     780:	00468693          	add	a3,a3,4
     784:	01080813          	add	a6,a6,16
     788:	fcf69ae3          	bne	a3,a5,75c <main+0x48c>
  for(int i=0;i<N;++i) for(int j=0;j<N;++j) C[i][j]=C4[i][j];
     78c:	04000613          	li	a2,64
     790:	000a8513          	mv	a0,s5
     794:	738000ef          	jal	ecc <memcpy>
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     798:	a61ff0ef          	jal	1f8 <rdinstret>
     79c:	00050913          	mv	s2,a0
     7a0:	00b12e23          	sw	a1,28(sp)
     7a4:	a41ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     7a8:	01c12783          	lw	a5,28(sp)
     7ac:	01812703          	lw	a4,24(sp)
     7b0:	40850db3          	sub	s11,a0,s0
     7b4:	01b53533          	sltu	a0,a0,s11
     7b8:	41458c33          	sub	s8,a1,s4
     7bc:	41990d33          	sub	s10,s2,s9
     7c0:	40ac0c33          	sub	s8,s8,a0
     7c4:	01a93533          	sltu	a0,s2,s10
     7c8:	40e78933          	sub	s2,a5,a4
     7cc:	40a90a33          	sub	s4,s2,a0
     7d0:	00000793          	li	a5,0
static int cmp_NxN(const int32_t *A, const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     7d4:	04000613          	li	a2,64
     7d8:	04010713          	add	a4,sp,64
     7dc:	00f706b3          	add	a3,a4,a5
     7e0:	08010713          	add	a4,sp,128
     7e4:	0006a583          	lw	a1,0(a3)
     7e8:	00f706b3          	add	a3,a4,a5
     7ec:	0006a683          	lw	a3,0(a3)
     7f0:	18d59c63          	bne	a1,a3,988 <main+0x6b8>
     7f4:	00478793          	add	a5,a5,4
     7f8:	fec790e3          	bne	a5,a2,7d8 <main+0x508>
     7fc:	00100413          	li	s0,1
     800:	00000793          	li	a5,0
     804:	04000593          	li	a1,64
     808:	04010713          	add	a4,sp,64
     80c:	00fa86b3          	add	a3,s5,a5
     810:	00f70633          	add	a2,a4,a5
     814:	00062603          	lw	a2,0(a2)
     818:	0006a683          	lw	a3,0(a3)
     81c:	16d61a63          	bne	a2,a3,990 <main+0x6c0>
     820:	00478793          	add	a5,a5,4
     824:	feb792e3          	bne	a5,a1,808 <main+0x538>
     828:	00100913          	li	s2,1

  int ok1=cmp_NxN(&Csw[0][0], &Ccfu[0][0]);
  int ok2=cmp_NxN(&Csw[0][0], &Ccfs[0][0]);

  printf("\n4x4 timing summary\n");
     82c:	0000f537          	lui	a0,0xf
     830:	dfc50513          	add	a0,a0,-516 # edfc <__fini_array_end+0x68>
     834:	59c000ef          	jal	dd0 <puts>
  printf("Path |   cycles   |  instret   | Speedup(cyc) | Speedup(inst)\n");
     838:	0000f537          	lui	a0,0xf
     83c:	e1050513          	add	a0,a0,-496 # ee10 <__fini_array_end+0x7c>
     840:	590000ef          	jal	dd0 <puts>
  printf("-----+------------+------------+--------------+--------------\n");
     844:	0000f537          	lui	a0,0xf
     848:	e5050513          	add	a0,a0,-432 # ee50 <__fini_array_end+0xbc>
     84c:	584000ef          	jal	dd0 <puts>
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
     850:	00c12783          	lw	a5,12(sp)
     854:	00812683          	lw	a3,8(sp)
     858:	0000f537          	lui	a0,0xf
     85c:	00048713          	mv	a4,s1
     860:	00098613          	mv	a2,s3
     864:	e9050513          	add	a0,a0,-368 # ee90 <__fini_array_end+0xfc>
     868:	3d4000ef          	jal	c3c <printf>
  printf(" CFU | %10" PRIu64 " | %10" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
     86c:	01412783          	lw	a5,20(sp)
     870:	01012683          	lw	a3,16(sp)
     874:	0000f537          	lui	a0,0xf
     878:	000b0713          	mv	a4,s6
     87c:	000b8613          	mv	a2,s7
     880:	ec850513          	add	a0,a0,-312 # eec8 <__fini_array_end+0x134>
     884:	3b8000ef          	jal	c3c <printf>
     888:	01012683          	lw	a3,16(sp)
     88c:	00812583          	lw	a1,8(sp)
     890:	000b8613          	mv	a2,s7
     894:	00098513          	mv	a0,s3
     898:	975ff0ef          	jal	20c <print_speedup_fixed>
     89c:	0000fbb7          	lui	s7,0xf
     8a0:	ee4b8513          	add	a0,s7,-284 # eee4 <__fini_array_end+0x150>
     8a4:	398000ef          	jal	c3c <printf>
     8a8:	00c12583          	lw	a1,12(sp)
     8ac:	01412683          	lw	a3,20(sp)
     8b0:	000b0613          	mv	a2,s6
     8b4:	00048513          	mv	a0,s1
     8b8:	955ff0ef          	jal	20c <print_speedup_fixed>
     8bc:	00a00513          	li	a0,10
     8c0:	3cc000ef          	jal	c8c <putchar>
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");
     8c4:	0000f537          	lui	a0,0xf
     8c8:	000d0713          	mv	a4,s10
     8cc:	000a0793          	mv	a5,s4
     8d0:	000d8613          	mv	a2,s11
     8d4:	000c0693          	mv	a3,s8
     8d8:	ef050513          	add	a0,a0,-272 # eef0 <__fini_array_end+0x15c>
     8dc:	360000ef          	jal	c3c <printf>
     8e0:	00812583          	lw	a1,8(sp)
     8e4:	000d8613          	mv	a2,s11
     8e8:	000c0693          	mv	a3,s8
     8ec:	00098513          	mv	a0,s3
     8f0:	91dff0ef          	jal	20c <print_speedup_fixed>
     8f4:	ee4b8513          	add	a0,s7,-284
     8f8:	344000ef          	jal	c3c <printf>
     8fc:	00c12583          	lw	a1,12(sp)
     900:	00048513          	mv	a0,s1
     904:	000d0613          	mv	a2,s10
     908:	000a0693          	mv	a3,s4
     90c:	901ff0ef          	jal	20c <print_speedup_fixed>
     910:	00a00513          	li	a0,10
     914:	378000ef          	jal	c8c <putchar>

  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     918:	08040063          	beqz	s0,998 <main+0x6c8>
     91c:	0000f5b7          	lui	a1,0xf
     920:	db458593          	add	a1,a1,-588 # edb4 <__fini_array_end+0x20>
     924:	08090063          	beqz	s2,9a4 <main+0x6d4>
     928:	0000f637          	lui	a2,0xf
     92c:	db460613          	add	a2,a2,-588 # edb4 <__fini_array_end+0x20>
     930:	0000f537          	lui	a0,0xf
     934:	f0c50513          	add	a0,a0,-244 # ef0c <__fini_array_end+0x178>
     938:	304000ef          	jal	c3c <printf>
  return (ok1 && ok2)?0:1;
     93c:	00897533          	and	a0,s2,s0
}
     940:	17c12083          	lw	ra,380(sp)
     944:	17812403          	lw	s0,376(sp)
     948:	17412483          	lw	s1,372(sp)
     94c:	17012903          	lw	s2,368(sp)
     950:	16c12983          	lw	s3,364(sp)
     954:	16812a03          	lw	s4,360(sp)
     958:	16412a83          	lw	s5,356(sp)
     95c:	16012b03          	lw	s6,352(sp)
     960:	15c12b83          	lw	s7,348(sp)
     964:	15812c03          	lw	s8,344(sp)
     968:	15412c83          	lw	s9,340(sp)
     96c:	15012d03          	lw	s10,336(sp)
     970:	14c12d83          	lw	s11,332(sp)
     974:	00154513          	xor	a0,a0,1
     978:	18010113          	add	sp,sp,384
     97c:	00008067          	ret
     980:	00058793          	mv	a5,a1
     984:	b31ff06f          	j	4b4 <main+0x1e4>
static int cmp_NxN(const int32_t *A, const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     988:	00000413          	li	s0,0
     98c:	e75ff06f          	j	800 <main+0x530>
     990:	00000913          	li	s2,0
     994:	e99ff06f          	j	82c <main+0x55c>
  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     998:	0000f5b7          	lui	a1,0xf
     99c:	dbc58593          	add	a1,a1,-580 # edbc <__fini_array_end+0x28>
     9a0:	f85ff06f          	j	924 <main+0x654>
     9a4:	0000f637          	lui	a2,0xf
     9a8:	dbc60613          	add	a2,a2,-580 # edbc <__fini_array_end+0x28>
     9ac:	f85ff06f          	j	930 <main+0x660>

000009b0 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     9b0:	fffff097          	auipc	ra,0xfffff
     9b4:	7a808093          	add	ra,ra,1960 # 158 <__crt0_main_exit>
     9b8:	00050513          	mv	a0,a0
     9bc:	00008067          	ret

000009c0 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     9c0:	fff00513          	li	a0,-1
     9c4:	00008067          	ret

000009c8 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     9c8:	000027b7          	lui	a5,0x2
     9cc:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     9d0:	00000513          	li	a0,0
     9d4:	00008067          	ret

000009d8 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     9d8:	00100513          	li	a0,1
     9dc:	00008067          	ret

000009e0 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     9e0:	00100513          	li	a0,1
     9e4:	00008067          	ret

000009e8 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     9e8:	800007b7          	lui	a5,0x80000
     9ec:	01600713          	li	a4,22
     9f0:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     9f4:	fff00513          	li	a0,-1
     9f8:	00008067          	ret

000009fc <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     9fc:	00000513          	li	a0,0
     a00:	00008067          	ret

00000a04 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     a04:	fe010113          	add	sp,sp,-32
     a08:	00912a23          	sw	s1,20(sp)
     a0c:	01212823          	sw	s2,16(sp)
     a10:	00112e23          	sw	ra,28(sp)
     a14:	00812c23          	sw	s0,24(sp)
     a18:	01312623          	sw	s3,12(sp)
     a1c:	01412423          	sw	s4,8(sp)
     a20:	00058913          	mv	s2,a1
     a24:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     a28:	06051463          	bnez	a0,a90 <_read+0x8c>
     a2c:	00050413          	mv	s0,a0
     a30:	fff50537          	lui	a0,0xfff50
     a34:	1a0000ef          	jal	bd4 <neorv32_uart_available>
     a38:	04050c63          	beqz	a0,a90 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a3c:	00a00993          	li	s3,10
     a40:	00d00a13          	li	s4,13
    while (len--) {
     a44:	00941663          	bne	s0,s1,a50 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     a48:	00048413          	mv	s0,s1
     a4c:	0200006f          	j	a6c <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     a50:	fff50537          	lui	a0,0xfff50
     a54:	1d0000ef          	jal	c24 <neorv32_uart_getc>
      *ptr++ = c;
     a58:	008907b3          	add	a5,s2,s0
     a5c:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     a60:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     a64:	01350463          	beq	a0,s3,a6c <_read+0x68>
     a68:	fd451ee3          	bne	a0,s4,a44 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     a6c:	01c12083          	lw	ra,28(sp)
     a70:	00040513          	mv	a0,s0
     a74:	01812403          	lw	s0,24(sp)
     a78:	01412483          	lw	s1,20(sp)
     a7c:	01012903          	lw	s2,16(sp)
     a80:	00c12983          	lw	s3,12(sp)
     a84:	00812a03          	lw	s4,8(sp)
     a88:	02010113          	add	sp,sp,32
     a8c:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     a90:	fff60537          	lui	a0,0xfff60
     a94:	140000ef          	jal	bd4 <neorv32_uart_available>
  int read_cnt = 0;
     a98:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     a9c:	02050863          	beqz	a0,acc <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     aa0:	00a00993          	li	s3,10
     aa4:	00d00a13          	li	s4,13
    while (len--) {
     aa8:	fa9400e3          	beq	s0,s1,a48 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     aac:	fff60537          	lui	a0,0xfff60
     ab0:	174000ef          	jal	c24 <neorv32_uart_getc>
      *ptr++ = c;
     ab4:	008907b3          	add	a5,s2,s0
     ab8:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     abc:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     ac0:	fb3506e3          	beq	a0,s3,a6c <_read+0x68>
     ac4:	ff4512e3          	bne	a0,s4,aa8 <_read+0xa4>
     ac8:	fa5ff06f          	j	a6c <_read+0x68>
    errno = ENOSYS;
     acc:	800007b7          	lui	a5,0x80000
     ad0:	05800713          	li	a4,88
     ad4:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     ad8:	fff00413          	li	s0,-1
     adc:	f91ff06f          	j	a6c <_read+0x68>

00000ae0 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     ae0:	ff010113          	add	sp,sp,-16
     ae4:	00812423          	sw	s0,8(sp)
     ae8:	00912223          	sw	s1,4(sp)
     aec:	00112623          	sw	ra,12(sp)
     af0:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     af4:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     af8:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     afc:	00058413          	mv	s0,a1
     b00:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     b04:	04a7ec63          	bltu	a5,a0,b5c <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     b08:	fff50537          	lui	a0,0xfff50
     b0c:	0c8000ef          	jal	bd4 <neorv32_uart_available>
     b10:	00940933          	add	s2,s0,s1
     b14:	02051463          	bnez	a0,b3c <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     b18:	800007b7          	lui	a5,0x80000
     b1c:	05800713          	li	a4,88
     b20:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     b24:	fff00493          	li	s1,-1
     b28:	0180006f          	j	b40 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     b2c:	00044583          	lbu	a1,0(s0)
     b30:	fff50537          	lui	a0,0xfff50
     b34:	00140413          	add	s0,s0,1
     b38:	0d8000ef          	jal	c10 <neorv32_uart_putc>
      while (len--) {
     b3c:	fe8918e3          	bne	s2,s0,b2c <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     b40:	00c12083          	lw	ra,12(sp)
     b44:	00812403          	lw	s0,8(sp)
     b48:	00012903          	lw	s2,0(sp)
     b4c:	00048513          	mv	a0,s1
     b50:	00412483          	lw	s1,4(sp)
     b54:	01010113          	add	sp,sp,16
     b58:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     b5c:	fff60537          	lui	a0,0xfff60
     b60:	074000ef          	jal	bd4 <neorv32_uart_available>
     b64:	00940933          	add	s2,s0,s1
     b68:	fa0508e3          	beqz	a0,b18 <_write+0x38>
    while (len--) {
     b6c:	fd240ae3          	beq	s0,s2,b40 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     b70:	00044583          	lbu	a1,0(s0)
     b74:	fff60537          	lui	a0,0xfff60
     b78:	00140413          	add	s0,s0,1
     b7c:	094000ef          	jal	c10 <neorv32_uart_putc>
      write_cnt++;
     b80:	fedff06f          	j	b6c <_write+0x8c>

00000b84 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     b84:	80000737          	lui	a4,0x80000
     b88:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     b8c:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     b90:	00050793          	mv	a5,a0
     b94:	c9460613          	add	a2,a2,-876 # 80000c94 <__crt0_bss_end>
  if (curr_heap == NULL) {
     b98:	00069463          	bnez	a3,ba0 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     b9c:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     ba0:	800016b7          	lui	a3,0x80001
     ba4:	c9468693          	add	a3,a3,-876 # 80000c94 <__crt0_bss_end>
     ba8:	00c69c63          	bne	a3,a2,bc0 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     bac:	800007b7          	lui	a5,0x80000
     bb0:	00c00713          	li	a4,12
     bb4:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     bb8:	fff00513          	li	a0,-1
     bbc:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     bc0:	71472503          	lw	a0,1812(a4)
     bc4:	00f507b3          	add	a5,a0,a5
     bc8:	fed7f2e3          	bgeu	a5,a3,bac <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     bcc:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     bd0:	00008067          	ret

00000bd4 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     bd4:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     bd8:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     bdc:	00e51c63          	bne	a0,a4,bf4 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     be0:	fffe07b7          	lui	a5,0xfffe0
     be4:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     be8:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     bec:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     bf0:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     bf4:	fff60737          	lui	a4,0xfff60
    return 0;
     bf8:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     bfc:	fee79ae3          	bne	a5,a4,bf0 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     c00:	fffe07b7          	lui	a5,0xfffe0
     c04:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     c08:	020007b7          	lui	a5,0x2000
     c0c:	fe1ff06f          	j	bec <neorv32_uart_available+0x18>

00000c10 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     c10:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     c14:	00a79713          	sll	a4,a5,0xa
     c18:	fe075ce3          	bgez	a4,c10 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     c1c:	00b52223          	sw	a1,4(a0)
}
     c20:	00008067          	ret

00000c24 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     c24:	00052783          	lw	a5,0(a0)
     c28:	00f79713          	sll	a4,a5,0xf
     c2c:	fe075ce3          	bgez	a4,c24 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     c30:	00452503          	lw	a0,4(a0)
}
     c34:	0ff57513          	zext.b	a0,a0
     c38:	00008067          	ret

00000c3c <printf>:
     c3c:	fc010113          	add	sp,sp,-64
     c40:	02c12423          	sw	a2,40(sp)
     c44:	02d12623          	sw	a3,44(sp)
     c48:	80000317          	auipc	t1,0x80000
     c4c:	ac032303          	lw	t1,-1344(t1) # 80000708 <_impure_ptr>
     c50:	02b12223          	sw	a1,36(sp)
     c54:	02e12823          	sw	a4,48(sp)
     c58:	02f12a23          	sw	a5,52(sp)
     c5c:	03012c23          	sw	a6,56(sp)
     c60:	03112e23          	sw	a7,60(sp)
     c64:	00832583          	lw	a1,8(t1)
     c68:	02410693          	add	a3,sp,36
     c6c:	00050613          	mv	a2,a0
     c70:	00030513          	mv	a0,t1
     c74:	00112e23          	sw	ra,28(sp)
     c78:	00d12623          	sw	a3,12(sp)
     c7c:	0c8010ef          	jal	1d44 <_vfprintf_r>
     c80:	01c12083          	lw	ra,28(sp)
     c84:	04010113          	add	sp,sp,64
     c88:	00008067          	ret

00000c8c <putchar>:
     c8c:	80000797          	auipc	a5,0x80000
     c90:	a7c7a783          	lw	a5,-1412(a5) # 80000708 <_impure_ptr>
     c94:	0087a603          	lw	a2,8(a5)
     c98:	00050593          	mv	a1,a0
     c9c:	00078513          	mv	a0,a5
     ca0:	3c00606f          	j	7060 <_putc_r>

00000ca4 <_puts_r>:
     ca4:	fd010113          	add	sp,sp,-48
     ca8:	02812423          	sw	s0,40(sp)
     cac:	00050413          	mv	s0,a0
     cb0:	00058513          	mv	a0,a1
     cb4:	02912223          	sw	s1,36(sp)
     cb8:	02112623          	sw	ra,44(sp)
     cbc:	00058493          	mv	s1,a1
     cc0:	3b0000ef          	jal	1070 <strlen>
     cc4:	00150713          	add	a4,a0,1
     cc8:	0000e697          	auipc	a3,0xe
     ccc:	1fc68693          	add	a3,a3,508 # eec4 <__fini_array_end+0x130>
     cd0:	00e12623          	sw	a4,12(sp)
     cd4:	03442783          	lw	a5,52(s0)
     cd8:	01010713          	add	a4,sp,16
     cdc:	00d12c23          	sw	a3,24(sp)
     ce0:	00e12223          	sw	a4,4(sp)
     ce4:	00100693          	li	a3,1
     ce8:	00200713          	li	a4,2
     cec:	00912823          	sw	s1,16(sp)
     cf0:	00a12a23          	sw	a0,20(sp)
     cf4:	00d12e23          	sw	a3,28(sp)
     cf8:	00e12423          	sw	a4,8(sp)
     cfc:	00842483          	lw	s1,8(s0)
     d00:	0c078263          	beqz	a5,dc4 <_puts_r+0x120>
     d04:	0644a703          	lw	a4,100(s1)
     d08:	00c49783          	lh	a5,12(s1)
     d0c:	00177713          	and	a4,a4,1
     d10:	00071663          	bnez	a4,d1c <_puts_r+0x78>
     d14:	2007f713          	and	a4,a5,512
     d18:	08070e63          	beqz	a4,db4 <_puts_r+0x110>
     d1c:	01279713          	sll	a4,a5,0x12
     d20:	02074263          	bltz	a4,d44 <_puts_r+0xa0>
     d24:	0644a703          	lw	a4,100(s1)
     d28:	ffffe6b7          	lui	a3,0xffffe
     d2c:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     d30:	00002637          	lui	a2,0x2
     d34:	00c7e7b3          	or	a5,a5,a2
     d38:	00d77733          	and	a4,a4,a3
     d3c:	00f49623          	sh	a5,12(s1)
     d40:	06e4a223          	sw	a4,100(s1)
     d44:	00040513          	mv	a0,s0
     d48:	00410613          	add	a2,sp,4
     d4c:	00048593          	mv	a1,s1
     d50:	549050ef          	jal	6a98 <__sfvwrite_r>
     d54:	0644a783          	lw	a5,100(s1)
     d58:	00153413          	seqz	s0,a0
     d5c:	40800433          	neg	s0,s0
     d60:	00b47413          	and	s0,s0,11
     d64:	0017f793          	and	a5,a5,1
     d68:	fff40413          	add	s0,s0,-1
     d6c:	00079863          	bnez	a5,d7c <_puts_r+0xd8>
     d70:	00c4d783          	lhu	a5,12(s1)
     d74:	2007f793          	and	a5,a5,512
     d78:	00078e63          	beqz	a5,d94 <_puts_r+0xf0>
     d7c:	02c12083          	lw	ra,44(sp)
     d80:	00040513          	mv	a0,s0
     d84:	02812403          	lw	s0,40(sp)
     d88:	02412483          	lw	s1,36(sp)
     d8c:	03010113          	add	sp,sp,48
     d90:	00008067          	ret
     d94:	0584a503          	lw	a0,88(s1)
     d98:	054000ef          	jal	dec <__retarget_lock_release_recursive>
     d9c:	02c12083          	lw	ra,44(sp)
     da0:	00040513          	mv	a0,s0
     da4:	02812403          	lw	s0,40(sp)
     da8:	02412483          	lw	s1,36(sp)
     dac:	03010113          	add	sp,sp,48
     db0:	00008067          	ret
     db4:	0584a503          	lw	a0,88(s1)
     db8:	030000ef          	jal	de8 <__retarget_lock_acquire_recursive>
     dbc:	00c49783          	lh	a5,12(s1)
     dc0:	f5dff06f          	j	d1c <_puts_r+0x78>
     dc4:	00040513          	mv	a0,s0
     dc8:	449050ef          	jal	6a10 <__sinit>
     dcc:	f39ff06f          	j	d04 <_puts_r+0x60>

00000dd0 <puts>:
     dd0:	00050593          	mv	a1,a0
     dd4:	80000517          	auipc	a0,0x80000
     dd8:	93452503          	lw	a0,-1740(a0) # 80000708 <_impure_ptr>
     ddc:	ec9ff06f          	j	ca4 <_puts_r>

00000de0 <__retarget_lock_init_recursive>:
     de0:	00008067          	ret

00000de4 <__retarget_lock_close_recursive>:
     de4:	00008067          	ret

00000de8 <__retarget_lock_acquire_recursive>:
     de8:	00008067          	ret

00000dec <__retarget_lock_release_recursive>:
     dec:	00008067          	ret

00000df0 <memset>:
     df0:	00f00313          	li	t1,15
     df4:	00050713          	mv	a4,a0
     df8:	02c37e63          	bgeu	t1,a2,e34 <memset+0x44>
     dfc:	00f77793          	and	a5,a4,15
     e00:	0a079063          	bnez	a5,ea0 <memset+0xb0>
     e04:	08059263          	bnez	a1,e88 <memset+0x98>
     e08:	ff067693          	and	a3,a2,-16
     e0c:	00f67613          	and	a2,a2,15
     e10:	00e686b3          	add	a3,a3,a4
     e14:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     e18:	00b72223          	sw	a1,4(a4)
     e1c:	00b72423          	sw	a1,8(a4)
     e20:	00b72623          	sw	a1,12(a4)
     e24:	01070713          	add	a4,a4,16
     e28:	fed766e3          	bltu	a4,a3,e14 <memset+0x24>
     e2c:	00061463          	bnez	a2,e34 <memset+0x44>
     e30:	00008067          	ret
     e34:	40c306b3          	sub	a3,t1,a2
     e38:	00269693          	sll	a3,a3,0x2
     e3c:	00000297          	auipc	t0,0x0
     e40:	005686b3          	add	a3,a3,t0
     e44:	00c68067          	jr	12(a3)
     e48:	00b70723          	sb	a1,14(a4)
     e4c:	00b706a3          	sb	a1,13(a4)
     e50:	00b70623          	sb	a1,12(a4)
     e54:	00b705a3          	sb	a1,11(a4)
     e58:	00b70523          	sb	a1,10(a4)
     e5c:	00b704a3          	sb	a1,9(a4)
     e60:	00b70423          	sb	a1,8(a4)
     e64:	00b703a3          	sb	a1,7(a4)
     e68:	00b70323          	sb	a1,6(a4)
     e6c:	00b702a3          	sb	a1,5(a4)
     e70:	00b70223          	sb	a1,4(a4)
     e74:	00b701a3          	sb	a1,3(a4)
     e78:	00b70123          	sb	a1,2(a4)
     e7c:	00b700a3          	sb	a1,1(a4)
     e80:	00b70023          	sb	a1,0(a4)
     e84:	00008067          	ret
     e88:	0ff5f593          	zext.b	a1,a1
     e8c:	00859693          	sll	a3,a1,0x8
     e90:	00d5e5b3          	or	a1,a1,a3
     e94:	01059693          	sll	a3,a1,0x10
     e98:	00d5e5b3          	or	a1,a1,a3
     e9c:	f6dff06f          	j	e08 <memset+0x18>
     ea0:	00279693          	sll	a3,a5,0x2
     ea4:	00000297          	auipc	t0,0x0
     ea8:	005686b3          	add	a3,a3,t0
     eac:	00008293          	mv	t0,ra
     eb0:	fa0680e7          	jalr	-96(a3)
     eb4:	00028093          	mv	ra,t0
     eb8:	ff078793          	add	a5,a5,-16
     ebc:	40f70733          	sub	a4,a4,a5
     ec0:	00f60633          	add	a2,a2,a5
     ec4:	f6c378e3          	bgeu	t1,a2,e34 <memset+0x44>
     ec8:	f3dff06f          	j	e04 <memset+0x14>

00000ecc <memcpy>:
     ecc:	00a5c7b3          	xor	a5,a1,a0
     ed0:	0037f793          	and	a5,a5,3
     ed4:	00c508b3          	add	a7,a0,a2
     ed8:	06079463          	bnez	a5,f40 <memcpy+0x74>
     edc:	00300793          	li	a5,3
     ee0:	06c7f063          	bgeu	a5,a2,f40 <memcpy+0x74>
     ee4:	00357793          	and	a5,a0,3
     ee8:	00050713          	mv	a4,a0
     eec:	06079a63          	bnez	a5,f60 <memcpy+0x94>
     ef0:	ffc8f613          	and	a2,a7,-4
     ef4:	40e606b3          	sub	a3,a2,a4
     ef8:	02000793          	li	a5,32
     efc:	08d7ce63          	blt	a5,a3,f98 <memcpy+0xcc>
     f00:	00058693          	mv	a3,a1
     f04:	00070793          	mv	a5,a4
     f08:	02c77863          	bgeu	a4,a2,f38 <memcpy+0x6c>
     f0c:	0006a803          	lw	a6,0(a3)
     f10:	00478793          	add	a5,a5,4
     f14:	00468693          	add	a3,a3,4
     f18:	ff07ae23          	sw	a6,-4(a5)
     f1c:	fec7e8e3          	bltu	a5,a2,f0c <memcpy+0x40>
     f20:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x2bb>
     f24:	40e787b3          	sub	a5,a5,a4
     f28:	ffc7f793          	and	a5,a5,-4
     f2c:	00478793          	add	a5,a5,4
     f30:	00f70733          	add	a4,a4,a5
     f34:	00f585b3          	add	a1,a1,a5
     f38:	01176863          	bltu	a4,a7,f48 <memcpy+0x7c>
     f3c:	00008067          	ret
     f40:	00050713          	mv	a4,a0
     f44:	05157863          	bgeu	a0,a7,f94 <memcpy+0xc8>
     f48:	0005c783          	lbu	a5,0(a1)
     f4c:	00170713          	add	a4,a4,1
     f50:	00158593          	add	a1,a1,1
     f54:	fef70fa3          	sb	a5,-1(a4)
     f58:	fee898e3          	bne	a7,a4,f48 <memcpy+0x7c>
     f5c:	00008067          	ret
     f60:	0005c683          	lbu	a3,0(a1)
     f64:	00170713          	add	a4,a4,1
     f68:	00377793          	and	a5,a4,3
     f6c:	fed70fa3          	sb	a3,-1(a4)
     f70:	00158593          	add	a1,a1,1
     f74:	f6078ee3          	beqz	a5,ef0 <memcpy+0x24>
     f78:	0005c683          	lbu	a3,0(a1)
     f7c:	00170713          	add	a4,a4,1
     f80:	00377793          	and	a5,a4,3
     f84:	fed70fa3          	sb	a3,-1(a4)
     f88:	00158593          	add	a1,a1,1
     f8c:	fc079ae3          	bnez	a5,f60 <memcpy+0x94>
     f90:	f61ff06f          	j	ef0 <memcpy+0x24>
     f94:	00008067          	ret
     f98:	ff010113          	add	sp,sp,-16
     f9c:	00812623          	sw	s0,12(sp)
     fa0:	02000413          	li	s0,32
     fa4:	0005a383          	lw	t2,0(a1)
     fa8:	0045a283          	lw	t0,4(a1)
     fac:	0085af83          	lw	t6,8(a1)
     fb0:	00c5af03          	lw	t5,12(a1)
     fb4:	0105ae83          	lw	t4,16(a1)
     fb8:	0145ae03          	lw	t3,20(a1)
     fbc:	0185a303          	lw	t1,24(a1)
     fc0:	01c5a803          	lw	a6,28(a1)
     fc4:	0205a683          	lw	a3,32(a1)
     fc8:	02470713          	add	a4,a4,36
     fcc:	40e607b3          	sub	a5,a2,a4
     fd0:	fc772e23          	sw	t2,-36(a4)
     fd4:	fe572023          	sw	t0,-32(a4)
     fd8:	fff72223          	sw	t6,-28(a4)
     fdc:	ffe72423          	sw	t5,-24(a4)
     fe0:	ffd72623          	sw	t4,-20(a4)
     fe4:	ffc72823          	sw	t3,-16(a4)
     fe8:	fe672a23          	sw	t1,-12(a4)
     fec:	ff072c23          	sw	a6,-8(a4)
     ff0:	fed72e23          	sw	a3,-4(a4)
     ff4:	02458593          	add	a1,a1,36
     ff8:	faf446e3          	blt	s0,a5,fa4 <memcpy+0xd8>
     ffc:	00058693          	mv	a3,a1
    1000:	00070793          	mv	a5,a4
    1004:	02c77863          	bgeu	a4,a2,1034 <memcpy+0x168>
    1008:	0006a803          	lw	a6,0(a3)
    100c:	00478793          	add	a5,a5,4
    1010:	00468693          	add	a3,a3,4
    1014:	ff07ae23          	sw	a6,-4(a5)
    1018:	fec7e8e3          	bltu	a5,a2,1008 <memcpy+0x13c>
    101c:	fff60793          	add	a5,a2,-1
    1020:	40e787b3          	sub	a5,a5,a4
    1024:	ffc7f793          	and	a5,a5,-4
    1028:	00478793          	add	a5,a5,4
    102c:	00f70733          	add	a4,a4,a5
    1030:	00f585b3          	add	a1,a1,a5
    1034:	01176863          	bltu	a4,a7,1044 <memcpy+0x178>
    1038:	00c12403          	lw	s0,12(sp)
    103c:	01010113          	add	sp,sp,16
    1040:	00008067          	ret
    1044:	0005c783          	lbu	a5,0(a1)
    1048:	00170713          	add	a4,a4,1
    104c:	00158593          	add	a1,a1,1
    1050:	fef70fa3          	sb	a5,-1(a4)
    1054:	fee882e3          	beq	a7,a4,1038 <memcpy+0x16c>
    1058:	0005c783          	lbu	a5,0(a1)
    105c:	00170713          	add	a4,a4,1
    1060:	00158593          	add	a1,a1,1
    1064:	fef70fa3          	sb	a5,-1(a4)
    1068:	fce89ee3          	bne	a7,a4,1044 <memcpy+0x178>
    106c:	fcdff06f          	j	1038 <memcpy+0x16c>

00001070 <strlen>:
    1070:	00357793          	and	a5,a0,3
    1074:	00050713          	mv	a4,a0
    1078:	04079c63          	bnez	a5,10d0 <strlen+0x60>
    107c:	7f7f86b7          	lui	a3,0x7f7f8
    1080:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    1084:	fff00593          	li	a1,-1
    1088:	00072603          	lw	a2,0(a4)
    108c:	00470713          	add	a4,a4,4
    1090:	00d677b3          	and	a5,a2,a3
    1094:	00d787b3          	add	a5,a5,a3
    1098:	00c7e7b3          	or	a5,a5,a2
    109c:	00d7e7b3          	or	a5,a5,a3
    10a0:	feb784e3          	beq	a5,a1,1088 <strlen+0x18>
    10a4:	ffc74683          	lbu	a3,-4(a4)
    10a8:	40a707b3          	sub	a5,a4,a0
    10ac:	04068463          	beqz	a3,10f4 <strlen+0x84>
    10b0:	ffd74683          	lbu	a3,-3(a4)
    10b4:	02068c63          	beqz	a3,10ec <strlen+0x7c>
    10b8:	ffe74503          	lbu	a0,-2(a4)
    10bc:	00a03533          	snez	a0,a0
    10c0:	00f50533          	add	a0,a0,a5
    10c4:	ffe50513          	add	a0,a0,-2
    10c8:	00008067          	ret
    10cc:	fa0688e3          	beqz	a3,107c <strlen+0xc>
    10d0:	00074783          	lbu	a5,0(a4)
    10d4:	00170713          	add	a4,a4,1
    10d8:	00377693          	and	a3,a4,3
    10dc:	fe0798e3          	bnez	a5,10cc <strlen+0x5c>
    10e0:	40a70733          	sub	a4,a4,a0
    10e4:	fff70513          	add	a0,a4,-1
    10e8:	00008067          	ret
    10ec:	ffd78513          	add	a0,a5,-3
    10f0:	00008067          	ret
    10f4:	ffc78513          	add	a0,a5,-4
    10f8:	00008067          	ret

000010fc <_malloc_trim_r>:
    10fc:	fe010113          	add	sp,sp,-32
    1100:	00812c23          	sw	s0,24(sp)
    1104:	00912a23          	sw	s1,20(sp)
    1108:	01212823          	sw	s2,16(sp)
    110c:	01312623          	sw	s3,12(sp)
    1110:	01412423          	sw	s4,8(sp)
    1114:	00058993          	mv	s3,a1
    1118:	00112e23          	sw	ra,28(sp)
    111c:	00050913          	mv	s2,a0
    1120:	7ffffa17          	auipc	s4,0x7ffff
    1124:	000a0a13          	mv	s4,s4
    1128:	405000ef          	jal	1d2c <__malloc_lock>
    112c:	008a2703          	lw	a4,8(s4) # 80000128 <__malloc_av_+0x8>
    1130:	000017b7          	lui	a5,0x1
    1134:	fef78793          	add	a5,a5,-17 # fef <memcpy+0x123>
    1138:	00472483          	lw	s1,4(a4)
    113c:	00001737          	lui	a4,0x1
    1140:	ffc4f493          	and	s1,s1,-4
    1144:	00f48433          	add	s0,s1,a5
    1148:	41340433          	sub	s0,s0,s3
    114c:	00c45413          	srl	s0,s0,0xc
    1150:	fff40413          	add	s0,s0,-1
    1154:	00c41413          	sll	s0,s0,0xc
    1158:	00e44e63          	blt	s0,a4,1174 <_malloc_trim_r+0x78>
    115c:	00000593          	li	a1,0
    1160:	00090513          	mv	a0,s2
    1164:	105060ef          	jal	7a68 <_sbrk_r>
    1168:	008a2783          	lw	a5,8(s4)
    116c:	009787b3          	add	a5,a5,s1
    1170:	02f50863          	beq	a0,a5,11a0 <_malloc_trim_r+0xa4>
    1174:	00090513          	mv	a0,s2
    1178:	3c1000ef          	jal	1d38 <__malloc_unlock>
    117c:	01c12083          	lw	ra,28(sp)
    1180:	01812403          	lw	s0,24(sp)
    1184:	01412483          	lw	s1,20(sp)
    1188:	01012903          	lw	s2,16(sp)
    118c:	00c12983          	lw	s3,12(sp)
    1190:	00812a03          	lw	s4,8(sp)
    1194:	00000513          	li	a0,0
    1198:	02010113          	add	sp,sp,32
    119c:	00008067          	ret
    11a0:	408005b3          	neg	a1,s0
    11a4:	00090513          	mv	a0,s2
    11a8:	0c1060ef          	jal	7a68 <_sbrk_r>
    11ac:	fff00793          	li	a5,-1
    11b0:	04f50a63          	beq	a0,a5,1204 <_malloc_trim_r+0x108>
    11b4:	80000717          	auipc	a4,0x80000
    11b8:	98070713          	add	a4,a4,-1664 # 80000b34 <__malloc_current_mallinfo>
    11bc:	00072783          	lw	a5,0(a4)
    11c0:	008a2683          	lw	a3,8(s4)
    11c4:	408484b3          	sub	s1,s1,s0
    11c8:	0014e493          	or	s1,s1,1
    11cc:	408787b3          	sub	a5,a5,s0
    11d0:	00090513          	mv	a0,s2
    11d4:	0096a223          	sw	s1,4(a3)
    11d8:	00f72023          	sw	a5,0(a4)
    11dc:	35d000ef          	jal	1d38 <__malloc_unlock>
    11e0:	01c12083          	lw	ra,28(sp)
    11e4:	01812403          	lw	s0,24(sp)
    11e8:	01412483          	lw	s1,20(sp)
    11ec:	01012903          	lw	s2,16(sp)
    11f0:	00c12983          	lw	s3,12(sp)
    11f4:	00812a03          	lw	s4,8(sp)
    11f8:	00100513          	li	a0,1
    11fc:	02010113          	add	sp,sp,32
    1200:	00008067          	ret
    1204:	00000593          	li	a1,0
    1208:	00090513          	mv	a0,s2
    120c:	05d060ef          	jal	7a68 <_sbrk_r>
    1210:	008a2703          	lw	a4,8(s4)
    1214:	00f00693          	li	a3,15
    1218:	40e507b3          	sub	a5,a0,a4
    121c:	f4f6dce3          	bge	a3,a5,1174 <_malloc_trim_r+0x78>
    1220:	7ffff697          	auipc	a3,0x7ffff
    1224:	4ec6a683          	lw	a3,1260(a3) # 8000070c <__malloc_sbrk_base>
    1228:	40d50533          	sub	a0,a0,a3
    122c:	0017e793          	or	a5,a5,1
    1230:	80000697          	auipc	a3,0x80000
    1234:	90a6a223          	sw	a0,-1788(a3) # 80000b34 <__malloc_current_mallinfo>
    1238:	00f72223          	sw	a5,4(a4)
    123c:	f39ff06f          	j	1174 <_malloc_trim_r+0x78>

00001240 <_free_r>:
    1240:	18058263          	beqz	a1,13c4 <_free_r+0x184>
    1244:	ff010113          	add	sp,sp,-16
    1248:	00812423          	sw	s0,8(sp)
    124c:	00912223          	sw	s1,4(sp)
    1250:	00058413          	mv	s0,a1
    1254:	00050493          	mv	s1,a0
    1258:	00112623          	sw	ra,12(sp)
    125c:	2d1000ef          	jal	1d2c <__malloc_lock>
    1260:	ffc42583          	lw	a1,-4(s0)
    1264:	ff840713          	add	a4,s0,-8
    1268:	7ffff517          	auipc	a0,0x7ffff
    126c:	eb850513          	add	a0,a0,-328 # 80000120 <__malloc_av_>
    1270:	ffe5f793          	and	a5,a1,-2
    1274:	00f70633          	add	a2,a4,a5
    1278:	00462683          	lw	a3,4(a2)
    127c:	00852803          	lw	a6,8(a0)
    1280:	ffc6f693          	and	a3,a3,-4
    1284:	1ac80263          	beq	a6,a2,1428 <_free_r+0x1e8>
    1288:	00d62223          	sw	a3,4(a2)
    128c:	0015f593          	and	a1,a1,1
    1290:	00d60833          	add	a6,a2,a3
    1294:	0a059063          	bnez	a1,1334 <_free_r+0xf4>
    1298:	ff842303          	lw	t1,-8(s0)
    129c:	00482583          	lw	a1,4(a6)
    12a0:	7ffff897          	auipc	a7,0x7ffff
    12a4:	e8888893          	add	a7,a7,-376 # 80000128 <__malloc_av_+0x8>
    12a8:	40670733          	sub	a4,a4,t1
    12ac:	00872803          	lw	a6,8(a4)
    12b0:	006787b3          	add	a5,a5,t1
    12b4:	0015f593          	and	a1,a1,1
    12b8:	15180263          	beq	a6,a7,13fc <_free_r+0x1bc>
    12bc:	00c72303          	lw	t1,12(a4)
    12c0:	00682623          	sw	t1,12(a6)
    12c4:	01032423          	sw	a6,8(t1)
    12c8:	1a058a63          	beqz	a1,147c <_free_r+0x23c>
    12cc:	0017e693          	or	a3,a5,1
    12d0:	00d72223          	sw	a3,4(a4)
    12d4:	00f62023          	sw	a5,0(a2)
    12d8:	1ff00693          	li	a3,511
    12dc:	06f6ec63          	bltu	a3,a5,1354 <_free_r+0x114>
    12e0:	ff87f693          	and	a3,a5,-8
    12e4:	00868693          	add	a3,a3,8
    12e8:	00452583          	lw	a1,4(a0)
    12ec:	00d506b3          	add	a3,a0,a3
    12f0:	0006a603          	lw	a2,0(a3)
    12f4:	0057d813          	srl	a6,a5,0x5
    12f8:	00100793          	li	a5,1
    12fc:	010797b3          	sll	a5,a5,a6
    1300:	00b7e7b3          	or	a5,a5,a1
    1304:	ff868593          	add	a1,a3,-8
    1308:	00b72623          	sw	a1,12(a4)
    130c:	00c72423          	sw	a2,8(a4)
    1310:	00f52223          	sw	a5,4(a0)
    1314:	00e6a023          	sw	a4,0(a3)
    1318:	00e62623          	sw	a4,12(a2)
    131c:	00812403          	lw	s0,8(sp)
    1320:	00c12083          	lw	ra,12(sp)
    1324:	00048513          	mv	a0,s1
    1328:	00412483          	lw	s1,4(sp)
    132c:	01010113          	add	sp,sp,16
    1330:	2090006f          	j	1d38 <__malloc_unlock>
    1334:	00482583          	lw	a1,4(a6)
    1338:	0015f593          	and	a1,a1,1
    133c:	08058663          	beqz	a1,13c8 <_free_r+0x188>
    1340:	0017e693          	or	a3,a5,1
    1344:	fed42e23          	sw	a3,-4(s0)
    1348:	00f62023          	sw	a5,0(a2)
    134c:	1ff00693          	li	a3,511
    1350:	f8f6f8e3          	bgeu	a3,a5,12e0 <_free_r+0xa0>
    1354:	0097d693          	srl	a3,a5,0x9
    1358:	00400613          	li	a2,4
    135c:	12d66463          	bltu	a2,a3,1484 <_free_r+0x244>
    1360:	0067d693          	srl	a3,a5,0x6
    1364:	03968593          	add	a1,a3,57
    1368:	03868613          	add	a2,a3,56
    136c:	00359593          	sll	a1,a1,0x3
    1370:	00b505b3          	add	a1,a0,a1
    1374:	0005a683          	lw	a3,0(a1)
    1378:	ff858593          	add	a1,a1,-8
    137c:	00d59863          	bne	a1,a3,138c <_free_r+0x14c>
    1380:	15c0006f          	j	14dc <_free_r+0x29c>
    1384:	0086a683          	lw	a3,8(a3)
    1388:	00d58863          	beq	a1,a3,1398 <_free_r+0x158>
    138c:	0046a603          	lw	a2,4(a3)
    1390:	ffc67613          	and	a2,a2,-4
    1394:	fec7e8e3          	bltu	a5,a2,1384 <_free_r+0x144>
    1398:	00c6a583          	lw	a1,12(a3)
    139c:	00b72623          	sw	a1,12(a4)
    13a0:	00d72423          	sw	a3,8(a4)
    13a4:	00812403          	lw	s0,8(sp)
    13a8:	00c12083          	lw	ra,12(sp)
    13ac:	00e5a423          	sw	a4,8(a1)
    13b0:	00048513          	mv	a0,s1
    13b4:	00412483          	lw	s1,4(sp)
    13b8:	00e6a623          	sw	a4,12(a3)
    13bc:	01010113          	add	sp,sp,16
    13c0:	1790006f          	j	1d38 <__malloc_unlock>
    13c4:	00008067          	ret
    13c8:	00d787b3          	add	a5,a5,a3
    13cc:	7ffff897          	auipc	a7,0x7ffff
    13d0:	d5c88893          	add	a7,a7,-676 # 80000128 <__malloc_av_+0x8>
    13d4:	00862683          	lw	a3,8(a2)
    13d8:	0f168063          	beq	a3,a7,14b8 <_free_r+0x278>
    13dc:	00c62803          	lw	a6,12(a2)
    13e0:	0017e593          	or	a1,a5,1
    13e4:	00f70633          	add	a2,a4,a5
    13e8:	0106a623          	sw	a6,12(a3)
    13ec:	00d82423          	sw	a3,8(a6)
    13f0:	00b72223          	sw	a1,4(a4)
    13f4:	00f62023          	sw	a5,0(a2)
    13f8:	ee1ff06f          	j	12d8 <_free_r+0x98>
    13fc:	14059063          	bnez	a1,153c <_free_r+0x2fc>
    1400:	00862583          	lw	a1,8(a2)
    1404:	00c62603          	lw	a2,12(a2)
    1408:	00f686b3          	add	a3,a3,a5
    140c:	0016e793          	or	a5,a3,1
    1410:	00c5a623          	sw	a2,12(a1)
    1414:	00b62423          	sw	a1,8(a2)
    1418:	00f72223          	sw	a5,4(a4)
    141c:	00d70733          	add	a4,a4,a3
    1420:	00d72023          	sw	a3,0(a4)
    1424:	ef9ff06f          	j	131c <_free_r+0xdc>
    1428:	0015f593          	and	a1,a1,1
    142c:	00d786b3          	add	a3,a5,a3
    1430:	02059063          	bnez	a1,1450 <_free_r+0x210>
    1434:	ff842583          	lw	a1,-8(s0)
    1438:	40b70733          	sub	a4,a4,a1
    143c:	00c72783          	lw	a5,12(a4)
    1440:	00872603          	lw	a2,8(a4)
    1444:	00b686b3          	add	a3,a3,a1
    1448:	00f62623          	sw	a5,12(a2)
    144c:	00c7a423          	sw	a2,8(a5)
    1450:	0016e793          	or	a5,a3,1
    1454:	00f72223          	sw	a5,4(a4)
    1458:	00e52423          	sw	a4,8(a0)
    145c:	7ffff797          	auipc	a5,0x7ffff
    1460:	2b47a783          	lw	a5,692(a5) # 80000710 <__malloc_trim_threshold>
    1464:	eaf6ece3          	bltu	a3,a5,131c <_free_r+0xdc>
    1468:	7ffff597          	auipc	a1,0x7ffff
    146c:	2c45a583          	lw	a1,708(a1) # 8000072c <__malloc_top_pad>
    1470:	00048513          	mv	a0,s1
    1474:	c89ff0ef          	jal	10fc <_malloc_trim_r>
    1478:	ea5ff06f          	j	131c <_free_r+0xdc>
    147c:	00d787b3          	add	a5,a5,a3
    1480:	f55ff06f          	j	13d4 <_free_r+0x194>
    1484:	01400613          	li	a2,20
    1488:	02d67063          	bgeu	a2,a3,14a8 <_free_r+0x268>
    148c:	05400613          	li	a2,84
    1490:	06d66463          	bltu	a2,a3,14f8 <_free_r+0x2b8>
    1494:	00c7d693          	srl	a3,a5,0xc
    1498:	06f68593          	add	a1,a3,111
    149c:	06e68613          	add	a2,a3,110
    14a0:	00359593          	sll	a1,a1,0x3
    14a4:	ecdff06f          	j	1370 <_free_r+0x130>
    14a8:	05c68593          	add	a1,a3,92
    14ac:	05b68613          	add	a2,a3,91
    14b0:	00359593          	sll	a1,a1,0x3
    14b4:	ebdff06f          	j	1370 <_free_r+0x130>
    14b8:	00e52a23          	sw	a4,20(a0)
    14bc:	00e52823          	sw	a4,16(a0)
    14c0:	0017e693          	or	a3,a5,1
    14c4:	01172623          	sw	a7,12(a4)
    14c8:	01172423          	sw	a7,8(a4)
    14cc:	00d72223          	sw	a3,4(a4)
    14d0:	00f70733          	add	a4,a4,a5
    14d4:	00f72023          	sw	a5,0(a4)
    14d8:	e45ff06f          	j	131c <_free_r+0xdc>
    14dc:	00452803          	lw	a6,4(a0)
    14e0:	40265613          	sra	a2,a2,0x2
    14e4:	00100793          	li	a5,1
    14e8:	00c797b3          	sll	a5,a5,a2
    14ec:	0107e7b3          	or	a5,a5,a6
    14f0:	00f52223          	sw	a5,4(a0)
    14f4:	ea9ff06f          	j	139c <_free_r+0x15c>
    14f8:	15400613          	li	a2,340
    14fc:	00d66c63          	bltu	a2,a3,1514 <_free_r+0x2d4>
    1500:	00f7d693          	srl	a3,a5,0xf
    1504:	07868593          	add	a1,a3,120
    1508:	07768613          	add	a2,a3,119
    150c:	00359593          	sll	a1,a1,0x3
    1510:	e61ff06f          	j	1370 <_free_r+0x130>
    1514:	55400613          	li	a2,1364
    1518:	00d66c63          	bltu	a2,a3,1530 <_free_r+0x2f0>
    151c:	0127d693          	srl	a3,a5,0x12
    1520:	07d68593          	add	a1,a3,125
    1524:	07c68613          	add	a2,a3,124
    1528:	00359593          	sll	a1,a1,0x3
    152c:	e45ff06f          	j	1370 <_free_r+0x130>
    1530:	3f800593          	li	a1,1016
    1534:	07e00613          	li	a2,126
    1538:	e39ff06f          	j	1370 <_free_r+0x130>
    153c:	0017e693          	or	a3,a5,1
    1540:	00d72223          	sw	a3,4(a4)
    1544:	00f62023          	sw	a5,0(a2)
    1548:	dd5ff06f          	j	131c <_free_r+0xdc>

0000154c <_malloc_r>:
    154c:	fd010113          	add	sp,sp,-48
    1550:	03212023          	sw	s2,32(sp)
    1554:	02112623          	sw	ra,44(sp)
    1558:	02812423          	sw	s0,40(sp)
    155c:	02912223          	sw	s1,36(sp)
    1560:	01312e23          	sw	s3,28(sp)
    1564:	00b58793          	add	a5,a1,11
    1568:	01600713          	li	a4,22
    156c:	00050913          	mv	s2,a0
    1570:	08f76263          	bltu	a4,a5,15f4 <_malloc_r+0xa8>
    1574:	01000793          	li	a5,16
    1578:	20b7e663          	bltu	a5,a1,1784 <_malloc_r+0x238>
    157c:	7b0000ef          	jal	1d2c <__malloc_lock>
    1580:	01800793          	li	a5,24
    1584:	00200593          	li	a1,2
    1588:	01000493          	li	s1,16
    158c:	7ffff997          	auipc	s3,0x7ffff
    1590:	b9498993          	add	s3,s3,-1132 # 80000120 <__malloc_av_>
    1594:	00f987b3          	add	a5,s3,a5
    1598:	0047a403          	lw	s0,4(a5)
    159c:	ff878713          	add	a4,a5,-8
    15a0:	36e40463          	beq	s0,a4,1908 <_malloc_r+0x3bc>
    15a4:	00442783          	lw	a5,4(s0)
    15a8:	00c42683          	lw	a3,12(s0)
    15ac:	00842603          	lw	a2,8(s0)
    15b0:	ffc7f793          	and	a5,a5,-4
    15b4:	00f407b3          	add	a5,s0,a5
    15b8:	0047a703          	lw	a4,4(a5)
    15bc:	00d62623          	sw	a3,12(a2)
    15c0:	00c6a423          	sw	a2,8(a3)
    15c4:	00176713          	or	a4,a4,1
    15c8:	00090513          	mv	a0,s2
    15cc:	00e7a223          	sw	a4,4(a5)
    15d0:	768000ef          	jal	1d38 <__malloc_unlock>
    15d4:	00840513          	add	a0,s0,8
    15d8:	02c12083          	lw	ra,44(sp)
    15dc:	02812403          	lw	s0,40(sp)
    15e0:	02412483          	lw	s1,36(sp)
    15e4:	02012903          	lw	s2,32(sp)
    15e8:	01c12983          	lw	s3,28(sp)
    15ec:	03010113          	add	sp,sp,48
    15f0:	00008067          	ret
    15f4:	ff87f493          	and	s1,a5,-8
    15f8:	1807c663          	bltz	a5,1784 <_malloc_r+0x238>
    15fc:	18b4e463          	bltu	s1,a1,1784 <_malloc_r+0x238>
    1600:	72c000ef          	jal	1d2c <__malloc_lock>
    1604:	1f700793          	li	a5,503
    1608:	4097fa63          	bgeu	a5,s1,1a1c <_malloc_r+0x4d0>
    160c:	0094d793          	srl	a5,s1,0x9
    1610:	18078263          	beqz	a5,1794 <_malloc_r+0x248>
    1614:	00400713          	li	a4,4
    1618:	36f76063          	bltu	a4,a5,1978 <_malloc_r+0x42c>
    161c:	0064d793          	srl	a5,s1,0x6
    1620:	03978593          	add	a1,a5,57
    1624:	03878813          	add	a6,a5,56
    1628:	00359613          	sll	a2,a1,0x3
    162c:	7ffff997          	auipc	s3,0x7ffff
    1630:	af498993          	add	s3,s3,-1292 # 80000120 <__malloc_av_>
    1634:	00c98633          	add	a2,s3,a2
    1638:	00462403          	lw	s0,4(a2)
    163c:	ff860613          	add	a2,a2,-8
    1640:	02860863          	beq	a2,s0,1670 <_malloc_r+0x124>
    1644:	00f00513          	li	a0,15
    1648:	0140006f          	j	165c <_malloc_r+0x110>
    164c:	00c42683          	lw	a3,12(s0)
    1650:	2a075863          	bgez	a4,1900 <_malloc_r+0x3b4>
    1654:	00d60e63          	beq	a2,a3,1670 <_malloc_r+0x124>
    1658:	00068413          	mv	s0,a3
    165c:	00442783          	lw	a5,4(s0)
    1660:	ffc7f793          	and	a5,a5,-4
    1664:	40978733          	sub	a4,a5,s1
    1668:	fee552e3          	bge	a0,a4,164c <_malloc_r+0x100>
    166c:	00080593          	mv	a1,a6
    1670:	0109a403          	lw	s0,16(s3)
    1674:	7ffff897          	auipc	a7,0x7ffff
    1678:	ab488893          	add	a7,a7,-1356 # 80000128 <__malloc_av_+0x8>
    167c:	27140e63          	beq	s0,a7,18f8 <_malloc_r+0x3ac>
    1680:	00442783          	lw	a5,4(s0)
    1684:	00f00693          	li	a3,15
    1688:	ffc7f793          	and	a5,a5,-4
    168c:	40978733          	sub	a4,a5,s1
    1690:	38e6cc63          	blt	a3,a4,1a28 <_malloc_r+0x4dc>
    1694:	0119aa23          	sw	a7,20(s3)
    1698:	0119a823          	sw	a7,16(s3)
    169c:	36075063          	bgez	a4,19fc <_malloc_r+0x4b0>
    16a0:	1ff00713          	li	a4,511
    16a4:	0049a503          	lw	a0,4(s3)
    16a8:	26f76863          	bltu	a4,a5,1918 <_malloc_r+0x3cc>
    16ac:	ff87f713          	and	a4,a5,-8
    16b0:	00870713          	add	a4,a4,8
    16b4:	00e98733          	add	a4,s3,a4
    16b8:	00072683          	lw	a3,0(a4)
    16bc:	0057d613          	srl	a2,a5,0x5
    16c0:	00100793          	li	a5,1
    16c4:	00c797b3          	sll	a5,a5,a2
    16c8:	00f56533          	or	a0,a0,a5
    16cc:	ff870793          	add	a5,a4,-8
    16d0:	00f42623          	sw	a5,12(s0)
    16d4:	00d42423          	sw	a3,8(s0)
    16d8:	00a9a223          	sw	a0,4(s3)
    16dc:	00872023          	sw	s0,0(a4)
    16e0:	0086a623          	sw	s0,12(a3)
    16e4:	4025d793          	sra	a5,a1,0x2
    16e8:	00100613          	li	a2,1
    16ec:	00f61633          	sll	a2,a2,a5
    16f0:	0ac56a63          	bltu	a0,a2,17a4 <_malloc_r+0x258>
    16f4:	00a677b3          	and	a5,a2,a0
    16f8:	02079463          	bnez	a5,1720 <_malloc_r+0x1d4>
    16fc:	00161613          	sll	a2,a2,0x1
    1700:	ffc5f593          	and	a1,a1,-4
    1704:	00a677b3          	and	a5,a2,a0
    1708:	00458593          	add	a1,a1,4
    170c:	00079a63          	bnez	a5,1720 <_malloc_r+0x1d4>
    1710:	00161613          	sll	a2,a2,0x1
    1714:	00a677b3          	and	a5,a2,a0
    1718:	00458593          	add	a1,a1,4
    171c:	fe078ae3          	beqz	a5,1710 <_malloc_r+0x1c4>
    1720:	00f00813          	li	a6,15
    1724:	00359313          	sll	t1,a1,0x3
    1728:	00698333          	add	t1,s3,t1
    172c:	00030513          	mv	a0,t1
    1730:	00c52783          	lw	a5,12(a0)
    1734:	00058e13          	mv	t3,a1
    1738:	26f50263          	beq	a0,a5,199c <_malloc_r+0x450>
    173c:	0047a703          	lw	a4,4(a5)
    1740:	00078413          	mv	s0,a5
    1744:	00c7a783          	lw	a5,12(a5)
    1748:	ffc77713          	and	a4,a4,-4
    174c:	409706b3          	sub	a3,a4,s1
    1750:	26d84263          	blt	a6,a3,19b4 <_malloc_r+0x468>
    1754:	fe06c2e3          	bltz	a3,1738 <_malloc_r+0x1ec>
    1758:	00e40733          	add	a4,s0,a4
    175c:	00472683          	lw	a3,4(a4)
    1760:	00842603          	lw	a2,8(s0)
    1764:	00090513          	mv	a0,s2
    1768:	0016e693          	or	a3,a3,1
    176c:	00d72223          	sw	a3,4(a4)
    1770:	00f62623          	sw	a5,12(a2)
    1774:	00c7a423          	sw	a2,8(a5)
    1778:	5c0000ef          	jal	1d38 <__malloc_unlock>
    177c:	00840513          	add	a0,s0,8
    1780:	e59ff06f          	j	15d8 <_malloc_r+0x8c>
    1784:	00c00793          	li	a5,12
    1788:	00f92023          	sw	a5,0(s2)
    178c:	00000513          	li	a0,0
    1790:	e49ff06f          	j	15d8 <_malloc_r+0x8c>
    1794:	20000613          	li	a2,512
    1798:	04000593          	li	a1,64
    179c:	03f00813          	li	a6,63
    17a0:	e8dff06f          	j	162c <_malloc_r+0xe0>
    17a4:	0089a403          	lw	s0,8(s3)
    17a8:	01612823          	sw	s6,16(sp)
    17ac:	00442783          	lw	a5,4(s0)
    17b0:	ffc7fb13          	and	s6,a5,-4
    17b4:	009b6863          	bltu	s6,s1,17c4 <_malloc_r+0x278>
    17b8:	409b0733          	sub	a4,s6,s1
    17bc:	00f00793          	li	a5,15
    17c0:	0ee7ca63          	blt	a5,a4,18b4 <_malloc_r+0x368>
    17c4:	01912223          	sw	s9,4(sp)
    17c8:	7ffffc97          	auipc	s9,0x7ffff
    17cc:	f44c8c93          	add	s9,s9,-188 # 8000070c <__malloc_sbrk_base>
    17d0:	000ca703          	lw	a4,0(s9)
    17d4:	01412c23          	sw	s4,24(sp)
    17d8:	01512a23          	sw	s5,20(sp)
    17dc:	01712623          	sw	s7,12(sp)
    17e0:	7ffffa97          	auipc	s5,0x7ffff
    17e4:	f4caaa83          	lw	s5,-180(s5) # 8000072c <__malloc_top_pad>
    17e8:	fff00793          	li	a5,-1
    17ec:	01640a33          	add	s4,s0,s6
    17f0:	01548ab3          	add	s5,s1,s5
    17f4:	3ef70263          	beq	a4,a5,1bd8 <_malloc_r+0x68c>
    17f8:	000017b7          	lui	a5,0x1
    17fc:	00f78793          	add	a5,a5,15 # 100f <memcpy+0x143>
    1800:	00fa8ab3          	add	s5,s5,a5
    1804:	fffff7b7          	lui	a5,0xfffff
    1808:	00fafab3          	and	s5,s5,a5
    180c:	000a8593          	mv	a1,s5
    1810:	00090513          	mv	a0,s2
    1814:	254060ef          	jal	7a68 <_sbrk_r>
    1818:	fff00793          	li	a5,-1
    181c:	00050b93          	mv	s7,a0
    1820:	46f50663          	beq	a0,a5,1c8c <_malloc_r+0x740>
    1824:	01812423          	sw	s8,8(sp)
    1828:	25456863          	bltu	a0,s4,1a78 <_malloc_r+0x52c>
    182c:	7ffffc17          	auipc	s8,0x7ffff
    1830:	308c0c13          	add	s8,s8,776 # 80000b34 <__malloc_current_mallinfo>
    1834:	000c2583          	lw	a1,0(s8)
    1838:	00ba85b3          	add	a1,s5,a1
    183c:	00bc2023          	sw	a1,0(s8)
    1840:	00058713          	mv	a4,a1
    1844:	2caa1063          	bne	s4,a0,1b04 <_malloc_r+0x5b8>
    1848:	01451793          	sll	a5,a0,0x14
    184c:	2a079c63          	bnez	a5,1b04 <_malloc_r+0x5b8>
    1850:	0089ab83          	lw	s7,8(s3)
    1854:	015b07b3          	add	a5,s6,s5
    1858:	0017e793          	or	a5,a5,1
    185c:	00fba223          	sw	a5,4(s7)
    1860:	7ffff717          	auipc	a4,0x7ffff
    1864:	ec870713          	add	a4,a4,-312 # 80000728 <__malloc_max_sbrked_mem>
    1868:	00072683          	lw	a3,0(a4)
    186c:	00b6f463          	bgeu	a3,a1,1874 <_malloc_r+0x328>
    1870:	00b72023          	sw	a1,0(a4)
    1874:	7ffff717          	auipc	a4,0x7ffff
    1878:	eb070713          	add	a4,a4,-336 # 80000724 <__malloc_max_total_mem>
    187c:	00072683          	lw	a3,0(a4)
    1880:	00b6f463          	bgeu	a3,a1,1888 <_malloc_r+0x33c>
    1884:	00b72023          	sw	a1,0(a4)
    1888:	00812c03          	lw	s8,8(sp)
    188c:	000b8413          	mv	s0,s7
    1890:	ffc7f793          	and	a5,a5,-4
    1894:	40978733          	sub	a4,a5,s1
    1898:	3897ec63          	bltu	a5,s1,1c30 <_malloc_r+0x6e4>
    189c:	00f00793          	li	a5,15
    18a0:	38e7d863          	bge	a5,a4,1c30 <_malloc_r+0x6e4>
    18a4:	01812a03          	lw	s4,24(sp)
    18a8:	01412a83          	lw	s5,20(sp)
    18ac:	00c12b83          	lw	s7,12(sp)
    18b0:	00412c83          	lw	s9,4(sp)
    18b4:	0014e793          	or	a5,s1,1
    18b8:	00f42223          	sw	a5,4(s0)
    18bc:	009404b3          	add	s1,s0,s1
    18c0:	0099a423          	sw	s1,8(s3)
    18c4:	00176713          	or	a4,a4,1
    18c8:	00090513          	mv	a0,s2
    18cc:	00e4a223          	sw	a4,4(s1)
    18d0:	468000ef          	jal	1d38 <__malloc_unlock>
    18d4:	02c12083          	lw	ra,44(sp)
    18d8:	00840513          	add	a0,s0,8
    18dc:	02812403          	lw	s0,40(sp)
    18e0:	01012b03          	lw	s6,16(sp)
    18e4:	02412483          	lw	s1,36(sp)
    18e8:	02012903          	lw	s2,32(sp)
    18ec:	01c12983          	lw	s3,28(sp)
    18f0:	03010113          	add	sp,sp,48
    18f4:	00008067          	ret
    18f8:	0049a503          	lw	a0,4(s3)
    18fc:	de9ff06f          	j	16e4 <_malloc_r+0x198>
    1900:	00842603          	lw	a2,8(s0)
    1904:	cb1ff06f          	j	15b4 <_malloc_r+0x68>
    1908:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    190c:	00258593          	add	a1,a1,2
    1910:	d68780e3          	beq	a5,s0,1670 <_malloc_r+0x124>
    1914:	c91ff06f          	j	15a4 <_malloc_r+0x58>
    1918:	0097d713          	srl	a4,a5,0x9
    191c:	00400693          	li	a3,4
    1920:	14e6f263          	bgeu	a3,a4,1a64 <_malloc_r+0x518>
    1924:	01400693          	li	a3,20
    1928:	32e6e663          	bltu	a3,a4,1c54 <_malloc_r+0x708>
    192c:	05c70613          	add	a2,a4,92
    1930:	05b70693          	add	a3,a4,91
    1934:	00361613          	sll	a2,a2,0x3
    1938:	00c98633          	add	a2,s3,a2
    193c:	00062703          	lw	a4,0(a2)
    1940:	ff860613          	add	a2,a2,-8
    1944:	00e61863          	bne	a2,a4,1954 <_malloc_r+0x408>
    1948:	2980006f          	j	1be0 <_malloc_r+0x694>
    194c:	00872703          	lw	a4,8(a4)
    1950:	00e60863          	beq	a2,a4,1960 <_malloc_r+0x414>
    1954:	00472683          	lw	a3,4(a4)
    1958:	ffc6f693          	and	a3,a3,-4
    195c:	fed7e8e3          	bltu	a5,a3,194c <_malloc_r+0x400>
    1960:	00c72603          	lw	a2,12(a4)
    1964:	00c42623          	sw	a2,12(s0)
    1968:	00e42423          	sw	a4,8(s0)
    196c:	00862423          	sw	s0,8(a2)
    1970:	00872623          	sw	s0,12(a4)
    1974:	d71ff06f          	j	16e4 <_malloc_r+0x198>
    1978:	01400713          	li	a4,20
    197c:	10f77863          	bgeu	a4,a5,1a8c <_malloc_r+0x540>
    1980:	05400713          	li	a4,84
    1984:	2ef76663          	bltu	a4,a5,1c70 <_malloc_r+0x724>
    1988:	00c4d793          	srl	a5,s1,0xc
    198c:	06f78593          	add	a1,a5,111
    1990:	06e78813          	add	a6,a5,110
    1994:	00359613          	sll	a2,a1,0x3
    1998:	c95ff06f          	j	162c <_malloc_r+0xe0>
    199c:	001e0e13          	add	t3,t3,1
    19a0:	003e7793          	and	a5,t3,3
    19a4:	00850513          	add	a0,a0,8
    19a8:	10078063          	beqz	a5,1aa8 <_malloc_r+0x55c>
    19ac:	00c52783          	lw	a5,12(a0)
    19b0:	d89ff06f          	j	1738 <_malloc_r+0x1ec>
    19b4:	00842603          	lw	a2,8(s0)
    19b8:	0014e593          	or	a1,s1,1
    19bc:	00b42223          	sw	a1,4(s0)
    19c0:	00f62623          	sw	a5,12(a2)
    19c4:	00c7a423          	sw	a2,8(a5)
    19c8:	009404b3          	add	s1,s0,s1
    19cc:	0099aa23          	sw	s1,20(s3)
    19d0:	0099a823          	sw	s1,16(s3)
    19d4:	0016e793          	or	a5,a3,1
    19d8:	0114a623          	sw	a7,12(s1)
    19dc:	0114a423          	sw	a7,8(s1)
    19e0:	00f4a223          	sw	a5,4(s1)
    19e4:	00e40733          	add	a4,s0,a4
    19e8:	00090513          	mv	a0,s2
    19ec:	00d72023          	sw	a3,0(a4)
    19f0:	348000ef          	jal	1d38 <__malloc_unlock>
    19f4:	00840513          	add	a0,s0,8
    19f8:	be1ff06f          	j	15d8 <_malloc_r+0x8c>
    19fc:	00f407b3          	add	a5,s0,a5
    1a00:	0047a703          	lw	a4,4(a5)
    1a04:	00090513          	mv	a0,s2
    1a08:	00176713          	or	a4,a4,1
    1a0c:	00e7a223          	sw	a4,4(a5)
    1a10:	328000ef          	jal	1d38 <__malloc_unlock>
    1a14:	00840513          	add	a0,s0,8
    1a18:	bc1ff06f          	j	15d8 <_malloc_r+0x8c>
    1a1c:	0034d593          	srl	a1,s1,0x3
    1a20:	00848793          	add	a5,s1,8
    1a24:	b69ff06f          	j	158c <_malloc_r+0x40>
    1a28:	0014e693          	or	a3,s1,1
    1a2c:	00d42223          	sw	a3,4(s0)
    1a30:	009404b3          	add	s1,s0,s1
    1a34:	0099aa23          	sw	s1,20(s3)
    1a38:	0099a823          	sw	s1,16(s3)
    1a3c:	00176693          	or	a3,a4,1
    1a40:	0114a623          	sw	a7,12(s1)
    1a44:	0114a423          	sw	a7,8(s1)
    1a48:	00d4a223          	sw	a3,4(s1)
    1a4c:	00f407b3          	add	a5,s0,a5
    1a50:	00090513          	mv	a0,s2
    1a54:	00e7a023          	sw	a4,0(a5)
    1a58:	2e0000ef          	jal	1d38 <__malloc_unlock>
    1a5c:	00840513          	add	a0,s0,8
    1a60:	b79ff06f          	j	15d8 <_malloc_r+0x8c>
    1a64:	0067d713          	srl	a4,a5,0x6
    1a68:	03970613          	add	a2,a4,57
    1a6c:	03870693          	add	a3,a4,56
    1a70:	00361613          	sll	a2,a2,0x3
    1a74:	ec5ff06f          	j	1938 <_malloc_r+0x3ec>
    1a78:	07340c63          	beq	s0,s3,1af0 <_malloc_r+0x5a4>
    1a7c:	0089a403          	lw	s0,8(s3)
    1a80:	00812c03          	lw	s8,8(sp)
    1a84:	00442783          	lw	a5,4(s0)
    1a88:	e09ff06f          	j	1890 <_malloc_r+0x344>
    1a8c:	05c78593          	add	a1,a5,92
    1a90:	05b78813          	add	a6,a5,91
    1a94:	00359613          	sll	a2,a1,0x3
    1a98:	b95ff06f          	j	162c <_malloc_r+0xe0>
    1a9c:	00832783          	lw	a5,8(t1)
    1aa0:	fff58593          	add	a1,a1,-1
    1aa4:	28679063          	bne	a5,t1,1d24 <_malloc_r+0x7d8>
    1aa8:	0035f793          	and	a5,a1,3
    1aac:	ff830313          	add	t1,t1,-8
    1ab0:	fe0796e3          	bnez	a5,1a9c <_malloc_r+0x550>
    1ab4:	0049a703          	lw	a4,4(s3)
    1ab8:	fff64793          	not	a5,a2
    1abc:	00e7f7b3          	and	a5,a5,a4
    1ac0:	00f9a223          	sw	a5,4(s3)
    1ac4:	00161613          	sll	a2,a2,0x1
    1ac8:	ccc7eee3          	bltu	a5,a2,17a4 <_malloc_r+0x258>
    1acc:	cc060ce3          	beqz	a2,17a4 <_malloc_r+0x258>
    1ad0:	00f67733          	and	a4,a2,a5
    1ad4:	00071a63          	bnez	a4,1ae8 <_malloc_r+0x59c>
    1ad8:	00161613          	sll	a2,a2,0x1
    1adc:	00f67733          	and	a4,a2,a5
    1ae0:	004e0e13          	add	t3,t3,4
    1ae4:	fe070ae3          	beqz	a4,1ad8 <_malloc_r+0x58c>
    1ae8:	000e0593          	mv	a1,t3
    1aec:	c39ff06f          	j	1724 <_malloc_r+0x1d8>
    1af0:	7ffffc17          	auipc	s8,0x7ffff
    1af4:	044c0c13          	add	s8,s8,68 # 80000b34 <__malloc_current_mallinfo>
    1af8:	000c2703          	lw	a4,0(s8)
    1afc:	00ea8733          	add	a4,s5,a4
    1b00:	00ec2023          	sw	a4,0(s8)
    1b04:	000ca683          	lw	a3,0(s9)
    1b08:	fff00793          	li	a5,-1
    1b0c:	18f68663          	beq	a3,a5,1c98 <_malloc_r+0x74c>
    1b10:	414b87b3          	sub	a5,s7,s4
    1b14:	00e787b3          	add	a5,a5,a4
    1b18:	00fc2023          	sw	a5,0(s8)
    1b1c:	007bfc93          	and	s9,s7,7
    1b20:	0c0c8c63          	beqz	s9,1bf8 <_malloc_r+0x6ac>
    1b24:	419b8bb3          	sub	s7,s7,s9
    1b28:	000017b7          	lui	a5,0x1
    1b2c:	00878793          	add	a5,a5,8 # 1008 <memcpy+0x13c>
    1b30:	008b8b93          	add	s7,s7,8
    1b34:	419785b3          	sub	a1,a5,s9
    1b38:	015b8ab3          	add	s5,s7,s5
    1b3c:	415585b3          	sub	a1,a1,s5
    1b40:	01459593          	sll	a1,a1,0x14
    1b44:	0145da13          	srl	s4,a1,0x14
    1b48:	000a0593          	mv	a1,s4
    1b4c:	00090513          	mv	a0,s2
    1b50:	719050ef          	jal	7a68 <_sbrk_r>
    1b54:	fff00793          	li	a5,-1
    1b58:	18f50063          	beq	a0,a5,1cd8 <_malloc_r+0x78c>
    1b5c:	41750533          	sub	a0,a0,s7
    1b60:	01450ab3          	add	s5,a0,s4
    1b64:	000c2703          	lw	a4,0(s8)
    1b68:	0179a423          	sw	s7,8(s3)
    1b6c:	001ae793          	or	a5,s5,1
    1b70:	00ea05b3          	add	a1,s4,a4
    1b74:	00bc2023          	sw	a1,0(s8)
    1b78:	00fba223          	sw	a5,4(s7)
    1b7c:	cf3402e3          	beq	s0,s3,1860 <_malloc_r+0x314>
    1b80:	00f00693          	li	a3,15
    1b84:	0b66f063          	bgeu	a3,s6,1c24 <_malloc_r+0x6d8>
    1b88:	00442703          	lw	a4,4(s0)
    1b8c:	ff4b0793          	add	a5,s6,-12
    1b90:	ff87f793          	and	a5,a5,-8
    1b94:	00177713          	and	a4,a4,1
    1b98:	00f76733          	or	a4,a4,a5
    1b9c:	00e42223          	sw	a4,4(s0)
    1ba0:	00500613          	li	a2,5
    1ba4:	00f40733          	add	a4,s0,a5
    1ba8:	00c72223          	sw	a2,4(a4)
    1bac:	00c72423          	sw	a2,8(a4)
    1bb0:	00f6e663          	bltu	a3,a5,1bbc <_malloc_r+0x670>
    1bb4:	004ba783          	lw	a5,4(s7)
    1bb8:	ca9ff06f          	j	1860 <_malloc_r+0x314>
    1bbc:	00840593          	add	a1,s0,8
    1bc0:	00090513          	mv	a0,s2
    1bc4:	e7cff0ef          	jal	1240 <_free_r>
    1bc8:	0089ab83          	lw	s7,8(s3)
    1bcc:	000c2583          	lw	a1,0(s8)
    1bd0:	004ba783          	lw	a5,4(s7)
    1bd4:	c8dff06f          	j	1860 <_malloc_r+0x314>
    1bd8:	010a8a93          	add	s5,s5,16
    1bdc:	c31ff06f          	j	180c <_malloc_r+0x2c0>
    1be0:	4026d693          	sra	a3,a3,0x2
    1be4:	00100793          	li	a5,1
    1be8:	00d797b3          	sll	a5,a5,a3
    1bec:	00f56533          	or	a0,a0,a5
    1bf0:	00a9a223          	sw	a0,4(s3)
    1bf4:	d71ff06f          	j	1964 <_malloc_r+0x418>
    1bf8:	015b85b3          	add	a1,s7,s5
    1bfc:	40b005b3          	neg	a1,a1
    1c00:	01459593          	sll	a1,a1,0x14
    1c04:	0145da13          	srl	s4,a1,0x14
    1c08:	000a0593          	mv	a1,s4
    1c0c:	00090513          	mv	a0,s2
    1c10:	659050ef          	jal	7a68 <_sbrk_r>
    1c14:	fff00793          	li	a5,-1
    1c18:	f4f512e3          	bne	a0,a5,1b5c <_malloc_r+0x610>
    1c1c:	00000a13          	li	s4,0
    1c20:	f45ff06f          	j	1b64 <_malloc_r+0x618>
    1c24:	00812c03          	lw	s8,8(sp)
    1c28:	00100793          	li	a5,1
    1c2c:	00fba223          	sw	a5,4(s7)
    1c30:	00090513          	mv	a0,s2
    1c34:	104000ef          	jal	1d38 <__malloc_unlock>
    1c38:	00000513          	li	a0,0
    1c3c:	01812a03          	lw	s4,24(sp)
    1c40:	01412a83          	lw	s5,20(sp)
    1c44:	01012b03          	lw	s6,16(sp)
    1c48:	00c12b83          	lw	s7,12(sp)
    1c4c:	00412c83          	lw	s9,4(sp)
    1c50:	989ff06f          	j	15d8 <_malloc_r+0x8c>
    1c54:	05400693          	li	a3,84
    1c58:	04e6e463          	bltu	a3,a4,1ca0 <_malloc_r+0x754>
    1c5c:	00c7d713          	srl	a4,a5,0xc
    1c60:	06f70613          	add	a2,a4,111
    1c64:	06e70693          	add	a3,a4,110
    1c68:	00361613          	sll	a2,a2,0x3
    1c6c:	ccdff06f          	j	1938 <_malloc_r+0x3ec>
    1c70:	15400713          	li	a4,340
    1c74:	04f76463          	bltu	a4,a5,1cbc <_malloc_r+0x770>
    1c78:	00f4d793          	srl	a5,s1,0xf
    1c7c:	07878593          	add	a1,a5,120
    1c80:	07778813          	add	a6,a5,119
    1c84:	00359613          	sll	a2,a1,0x3
    1c88:	9a5ff06f          	j	162c <_malloc_r+0xe0>
    1c8c:	0089a403          	lw	s0,8(s3)
    1c90:	00442783          	lw	a5,4(s0)
    1c94:	bfdff06f          	j	1890 <_malloc_r+0x344>
    1c98:	017ca023          	sw	s7,0(s9)
    1c9c:	e81ff06f          	j	1b1c <_malloc_r+0x5d0>
    1ca0:	15400693          	li	a3,340
    1ca4:	04e6e463          	bltu	a3,a4,1cec <_malloc_r+0x7a0>
    1ca8:	00f7d713          	srl	a4,a5,0xf
    1cac:	07870613          	add	a2,a4,120
    1cb0:	07770693          	add	a3,a4,119
    1cb4:	00361613          	sll	a2,a2,0x3
    1cb8:	c81ff06f          	j	1938 <_malloc_r+0x3ec>
    1cbc:	55400713          	li	a4,1364
    1cc0:	04f76463          	bltu	a4,a5,1d08 <_malloc_r+0x7bc>
    1cc4:	0124d793          	srl	a5,s1,0x12
    1cc8:	07d78593          	add	a1,a5,125
    1ccc:	07c78813          	add	a6,a5,124
    1cd0:	00359613          	sll	a2,a1,0x3
    1cd4:	959ff06f          	j	162c <_malloc_r+0xe0>
    1cd8:	ff8c8c93          	add	s9,s9,-8
    1cdc:	019a8ab3          	add	s5,s5,s9
    1ce0:	417a8ab3          	sub	s5,s5,s7
    1ce4:	00000a13          	li	s4,0
    1ce8:	e7dff06f          	j	1b64 <_malloc_r+0x618>
    1cec:	55400693          	li	a3,1364
    1cf0:	02e6e463          	bltu	a3,a4,1d18 <_malloc_r+0x7cc>
    1cf4:	0127d713          	srl	a4,a5,0x12
    1cf8:	07d70613          	add	a2,a4,125
    1cfc:	07c70693          	add	a3,a4,124
    1d00:	00361613          	sll	a2,a2,0x3
    1d04:	c35ff06f          	j	1938 <_malloc_r+0x3ec>
    1d08:	3f800613          	li	a2,1016
    1d0c:	07f00593          	li	a1,127
    1d10:	07e00813          	li	a6,126
    1d14:	919ff06f          	j	162c <_malloc_r+0xe0>
    1d18:	3f800613          	li	a2,1016
    1d1c:	07e00693          	li	a3,126
    1d20:	c19ff06f          	j	1938 <_malloc_r+0x3ec>
    1d24:	0049a783          	lw	a5,4(s3)
    1d28:	d9dff06f          	j	1ac4 <_malloc_r+0x578>

00001d2c <__malloc_lock>:
    1d2c:	7ffff517          	auipc	a0,0x7ffff
    1d30:	9f050513          	add	a0,a0,-1552 # 8000071c <__lock___malloc_recursive_mutex>
    1d34:	8b4ff06f          	j	de8 <__retarget_lock_acquire_recursive>

00001d38 <__malloc_unlock>:
    1d38:	7ffff517          	auipc	a0,0x7ffff
    1d3c:	9e450513          	add	a0,a0,-1564 # 8000071c <__lock___malloc_recursive_mutex>
    1d40:	8acff06f          	j	dec <__retarget_lock_release_recursive>

00001d44 <_vfprintf_r>:
    1d44:	e7010113          	add	sp,sp,-400
    1d48:	18112623          	sw	ra,396(sp)
    1d4c:	00b12423          	sw	a1,8(sp)
    1d50:	00c12623          	sw	a2,12(sp)
    1d54:	00d12a23          	sw	a3,20(sp)
    1d58:	17312e23          	sw	s3,380(sp)
    1d5c:	18812423          	sw	s0,392(sp)
    1d60:	00050993          	mv	s3,a0
    1d64:	3d9050ef          	jal	793c <_localeconv_r>
    1d68:	00052783          	lw	a5,0(a0)
    1d6c:	00078513          	mv	a0,a5
    1d70:	02f12a23          	sw	a5,52(sp)
    1d74:	afcff0ef          	jal	1070 <strlen>
    1d78:	00050713          	mv	a4,a0
    1d7c:	00800613          	li	a2,8
    1d80:	00000593          	li	a1,0
    1d84:	09010513          	add	a0,sp,144
    1d88:	02e12823          	sw	a4,48(sp)
    1d8c:	864ff0ef          	jal	df0 <memset>
    1d90:	00c12783          	lw	a5,12(sp)
    1d94:	00098863          	beqz	s3,1da4 <_vfprintf_r+0x60>
    1d98:	0349a703          	lw	a4,52(s3)
    1d9c:	00071463          	bnez	a4,1da4 <_vfprintf_r+0x60>
    1da0:	29d0106f          	j	383c <_vfprintf_r+0x1af8>
    1da4:	00812703          	lw	a4,8(sp)
    1da8:	06472683          	lw	a3,100(a4)
    1dac:	00c71703          	lh	a4,12(a4)
    1db0:	0016f693          	and	a3,a3,1
    1db4:	00069863          	bnez	a3,1dc4 <_vfprintf_r+0x80>
    1db8:	20077693          	and	a3,a4,512
    1dbc:	00069463          	bnez	a3,1dc4 <_vfprintf_r+0x80>
    1dc0:	3ec0106f          	j	31ac <_vfprintf_r+0x1468>
    1dc4:	01271693          	sll	a3,a4,0x12
    1dc8:	0206c863          	bltz	a3,1df8 <_vfprintf_r+0xb4>
    1dcc:	00812503          	lw	a0,8(sp)
    1dd0:	000025b7          	lui	a1,0x2
    1dd4:	ffffe637          	lui	a2,0xffffe
    1dd8:	06452683          	lw	a3,100(a0)
    1ddc:	00b76733          	or	a4,a4,a1
    1de0:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1de4:	01071713          	sll	a4,a4,0x10
    1de8:	41075713          	sra	a4,a4,0x10
    1dec:	00c6f6b3          	and	a3,a3,a2
    1df0:	00e51623          	sh	a4,12(a0)
    1df4:	06d52223          	sw	a3,100(a0)
    1df8:	00877693          	and	a3,a4,8
    1dfc:	2a068063          	beqz	a3,209c <_vfprintf_r+0x358>
    1e00:	00812683          	lw	a3,8(sp)
    1e04:	0106a683          	lw	a3,16(a3)
    1e08:	28068a63          	beqz	a3,209c <_vfprintf_r+0x358>
    1e0c:	01a77693          	and	a3,a4,26
    1e10:	00a00613          	li	a2,10
    1e14:	2ac68c63          	beq	a3,a2,20cc <_vfprintf_r+0x388>
    1e18:	0ac10713          	add	a4,sp,172
    1e1c:	17512a23          	sw	s5,372(sp)
    1e20:	17812423          	sw	s8,360(sp)
    1e24:	15b12e23          	sw	s11,348(sp)
    1e28:	18912223          	sw	s1,388(sp)
    1e2c:	19212023          	sw	s2,384(sp)
    1e30:	17412c23          	sw	s4,376(sp)
    1e34:	17612823          	sw	s6,368(sp)
    1e38:	17712623          	sw	s7,364(sp)
    1e3c:	17912223          	sw	s9,356(sp)
    1e40:	17a12023          	sw	s10,352(sp)
    1e44:	0ae12023          	sw	a4,160(sp)
    1e48:	0a012423          	sw	zero,168(sp)
    1e4c:	0a012223          	sw	zero,164(sp)
    1e50:	00012c23          	sw	zero,24(sp)
    1e54:	02012423          	sw	zero,40(sp)
    1e58:	02012623          	sw	zero,44(sp)
    1e5c:	00070413          	mv	s0,a4
    1e60:	02012c23          	sw	zero,56(sp)
    1e64:	04012023          	sw	zero,64(sp)
    1e68:	02012e23          	sw	zero,60(sp)
    1e6c:	04012623          	sw	zero,76(sp)
    1e70:	04012423          	sw	zero,72(sp)
    1e74:	00012623          	sw	zero,12(sp)
    1e78:	7fffea97          	auipc	s5,0x7fffe
    1e7c:	6bca8a93          	add	s5,s5,1724 # 80000534 <__global_locale>
    1e80:	02500d93          	li	s11,37
    1e84:	00078c13          	mv	s8,a5
    1e88:	000c0913          	mv	s2,s8
    1e8c:	0e4aa483          	lw	s1,228(s5)
    1e90:	2a1050ef          	jal	7930 <__locale_mb_cur_max>
    1e94:	00050693          	mv	a3,a0
    1e98:	09010713          	add	a4,sp,144
    1e9c:	00090613          	mv	a2,s2
    1ea0:	08010593          	add	a1,sp,128
    1ea4:	00098513          	mv	a0,s3
    1ea8:	000480e7          	jalr	s1
    1eac:	2c050a63          	beqz	a0,2180 <_vfprintf_r+0x43c>
    1eb0:	2a054a63          	bltz	a0,2164 <_vfprintf_r+0x420>
    1eb4:	08012783          	lw	a5,128(sp)
    1eb8:	01b78663          	beq	a5,s11,1ec4 <_vfprintf_r+0x180>
    1ebc:	00a90933          	add	s2,s2,a0
    1ec0:	fcdff06f          	j	1e8c <_vfprintf_r+0x148>
    1ec4:	00050493          	mv	s1,a0
    1ec8:	41890cb3          	sub	s9,s2,s8
    1ecc:	2d891063          	bne	s2,s8,218c <_vfprintf_r+0x448>
    1ed0:	fff00313          	li	t1,-1
    1ed4:	00000e93          	li	t4,0
    1ed8:	00194e03          	lbu	t3,1(s2)
    1edc:	06010ba3          	sb	zero,119(sp)
    1ee0:	00190913          	add	s2,s2,1
    1ee4:	00000b93          	li	s7,0
    1ee8:	05a00493          	li	s1,90
    1eec:	000e8a13          	mv	s4,t4
    1ef0:	00030b13          	mv	s6,t1
    1ef4:	00190913          	add	s2,s2,1
    1ef8:	fe0e0793          	add	a5,t3,-32
    1efc:	04f4ea63          	bltu	s1,a5,1f50 <_vfprintf_r+0x20c>
    1f00:	0000d717          	auipc	a4,0xd
    1f04:	31c70713          	add	a4,a4,796 # f21c <_ctype_+0x104>
    1f08:	00279793          	sll	a5,a5,0x2
    1f0c:	00e787b3          	add	a5,a5,a4
    1f10:	0007a783          	lw	a5,0(a5)
    1f14:	00e787b3          	add	a5,a5,a4
    1f18:	00078067          	jr	a5
    1f1c:	00000b93          	li	s7,0
    1f20:	fd0e0713          	add	a4,t3,-48
    1f24:	00900693          	li	a3,9
    1f28:	00094e03          	lbu	t3,0(s2)
    1f2c:	002b9793          	sll	a5,s7,0x2
    1f30:	017787b3          	add	a5,a5,s7
    1f34:	00179793          	sll	a5,a5,0x1
    1f38:	00f70bb3          	add	s7,a4,a5
    1f3c:	fd0e0713          	add	a4,t3,-48
    1f40:	00190913          	add	s2,s2,1
    1f44:	fee6f2e3          	bgeu	a3,a4,1f28 <_vfprintf_r+0x1e4>
    1f48:	fe0e0793          	add	a5,t3,-32
    1f4c:	faf4fae3          	bgeu	s1,a5,1f00 <_vfprintf_r+0x1bc>
    1f50:	000a0e93          	mv	t4,s4
    1f54:	260e0a63          	beqz	t3,21c8 <_vfprintf_r+0x484>
    1f58:	0fc10623          	sb	t3,236(sp)
    1f5c:	06010ba3          	sb	zero,119(sp)
    1f60:	00100c93          	li	s9,1
    1f64:	00000613          	li	a2,0
    1f68:	00012823          	sw	zero,16(sp)
    1f6c:	00100d13          	li	s10,1
    1f70:	00000313          	li	t1,0
    1f74:	02012223          	sw	zero,36(sp)
    1f78:	02012023          	sw	zero,32(sp)
    1f7c:	00000a13          	li	s4,0
    1f80:	0ec10c13          	add	s8,sp,236
    1f84:	002ef293          	and	t0,t4,2
    1f88:	00028463          	beqz	t0,1f90 <_vfprintf_r+0x24c>
    1f8c:	002c8c93          	add	s9,s9,2
    1f90:	084eff93          	and	t6,t4,132
    1f94:	0a812483          	lw	s1,168(sp)
    1f98:	000f9663          	bnez	t6,1fa4 <_vfprintf_r+0x260>
    1f9c:	419b8733          	sub	a4,s7,s9
    1fa0:	40e04663          	bgtz	a4,23ac <_vfprintf_r+0x668>
    1fa4:	02060a63          	beqz	a2,1fd8 <_vfprintf_r+0x294>
    1fa8:	0a412703          	lw	a4,164(sp)
    1fac:	07710613          	add	a2,sp,119
    1fb0:	00148493          	add	s1,s1,1
    1fb4:	00170713          	add	a4,a4,1
    1fb8:	00100793          	li	a5,1
    1fbc:	00c42023          	sw	a2,0(s0)
    1fc0:	00f42223          	sw	a5,4(s0)
    1fc4:	0a912423          	sw	s1,168(sp)
    1fc8:	0ae12223          	sw	a4,164(sp)
    1fcc:	00700613          	li	a2,7
    1fd0:	00840413          	add	s0,s0,8
    1fd4:	4ce64863          	blt	a2,a4,24a4 <_vfprintf_r+0x760>
    1fd8:	02028a63          	beqz	t0,200c <_vfprintf_r+0x2c8>
    1fdc:	0a412703          	lw	a4,164(sp)
    1fe0:	07810613          	add	a2,sp,120
    1fe4:	00c42023          	sw	a2,0(s0)
    1fe8:	00248493          	add	s1,s1,2
    1fec:	00200613          	li	a2,2
    1ff0:	00170713          	add	a4,a4,1
    1ff4:	00c42223          	sw	a2,4(s0)
    1ff8:	0a912423          	sw	s1,168(sp)
    1ffc:	0ae12223          	sw	a4,164(sp)
    2000:	00700613          	li	a2,7
    2004:	00840413          	add	s0,s0,8
    2008:	5ce644e3          	blt	a2,a4,2dd0 <_vfprintf_r+0x108c>
    200c:	08000713          	li	a4,128
    2010:	3aef80e3          	beq	t6,a4,2bb0 <_vfprintf_r+0xe6c>
    2014:	41a30b33          	sub	s6,t1,s10
    2018:	4b604ae3          	bgtz	s6,2ccc <_vfprintf_r+0xf88>
    201c:	100ef713          	and	a4,t4,256
    2020:	1a0710e3          	bnez	a4,29c0 <_vfprintf_r+0xc7c>
    2024:	0a412783          	lw	a5,164(sp)
    2028:	01a484b3          	add	s1,s1,s10
    202c:	01842023          	sw	s8,0(s0)
    2030:	00178793          	add	a5,a5,1
    2034:	01a42223          	sw	s10,4(s0)
    2038:	0a912423          	sw	s1,168(sp)
    203c:	0af12223          	sw	a5,164(sp)
    2040:	00700713          	li	a4,7
    2044:	58f74c63          	blt	a4,a5,25dc <_vfprintf_r+0x898>
    2048:	00840413          	add	s0,s0,8
    204c:	004eff13          	and	t5,t4,4
    2050:	000f0663          	beqz	t5,205c <_vfprintf_r+0x318>
    2054:	419b8d33          	sub	s10,s7,s9
    2058:	5ba04ce3          	bgtz	s10,2e10 <_vfprintf_r+0x10cc>
    205c:	000b8e93          	mv	t4,s7
    2060:	019bd463          	bge	s7,s9,2068 <_vfprintf_r+0x324>
    2064:	000c8e93          	mv	t4,s9
    2068:	00c12783          	lw	a5,12(sp)
    206c:	01d787b3          	add	a5,a5,t4
    2070:	00f12623          	sw	a5,12(sp)
    2074:	18049663          	bnez	s1,2200 <_vfprintf_r+0x4bc>
    2078:	01012783          	lw	a5,16(sp)
    207c:	0a012223          	sw	zero,164(sp)
    2080:	00078863          	beqz	a5,2090 <_vfprintf_r+0x34c>
    2084:	01012583          	lw	a1,16(sp)
    2088:	00098513          	mv	a0,s3
    208c:	9b4ff0ef          	jal	1240 <_free_r>
    2090:	0ac10413          	add	s0,sp,172
    2094:	00090c13          	mv	s8,s2
    2098:	df1ff06f          	j	1e88 <_vfprintf_r+0x144>
    209c:	00812403          	lw	s0,8(sp)
    20a0:	00098513          	mv	a0,s3
    20a4:	00f12623          	sw	a5,12(sp)
    20a8:	00040593          	mv	a1,s0
    20ac:	3a4050ef          	jal	7450 <__swsetup_r>
    20b0:	00050463          	beqz	a0,20b8 <_vfprintf_r+0x374>
    20b4:	5600206f          	j	4614 <_vfprintf_r+0x28d0>
    20b8:	00c41703          	lh	a4,12(s0)
    20bc:	00a00613          	li	a2,10
    20c0:	00c12783          	lw	a5,12(sp)
    20c4:	01a77693          	and	a3,a4,26
    20c8:	d4c698e3          	bne	a3,a2,1e18 <_vfprintf_r+0xd4>
    20cc:	00812603          	lw	a2,8(sp)
    20d0:	00e61683          	lh	a3,14(a2)
    20d4:	d406c2e3          	bltz	a3,1e18 <_vfprintf_r+0xd4>
    20d8:	06462683          	lw	a3,100(a2)
    20dc:	0016f693          	and	a3,a3,1
    20e0:	00069863          	bnez	a3,20f0 <_vfprintf_r+0x3ac>
    20e4:	20077713          	and	a4,a4,512
    20e8:	00071463          	bnez	a4,20f0 <_vfprintf_r+0x3ac>
    20ec:	53d0106f          	j	3e28 <_vfprintf_r+0x20e4>
    20f0:	01412683          	lw	a3,20(sp)
    20f4:	00812583          	lw	a1,8(sp)
    20f8:	00098513          	mv	a0,s3
    20fc:	00078613          	mv	a2,a5
    2100:	0e5020ef          	jal	49e4 <__sbprintf>
    2104:	18c12083          	lw	ra,396(sp)
    2108:	18812403          	lw	s0,392(sp)
    210c:	00a12623          	sw	a0,12(sp)
    2110:	00c12503          	lw	a0,12(sp)
    2114:	17c12983          	lw	s3,380(sp)
    2118:	19010113          	add	sp,sp,400
    211c:	00008067          	ret
    2120:	00098513          	mv	a0,s3
    2124:	019050ef          	jal	793c <_localeconv_r>
    2128:	00452783          	lw	a5,4(a0)
    212c:	00078513          	mv	a0,a5
    2130:	04f12423          	sw	a5,72(sp)
    2134:	f3dfe0ef          	jal	1070 <strlen>
    2138:	00050793          	mv	a5,a0
    213c:	00098513          	mv	a0,s3
    2140:	00078c93          	mv	s9,a5
    2144:	04f12623          	sw	a5,76(sp)
    2148:	7f4050ef          	jal	793c <_localeconv_r>
    214c:	00852703          	lw	a4,8(a0)
    2150:	02e12e23          	sw	a4,60(sp)
    2154:	000c8463          	beqz	s9,215c <_vfprintf_r+0x418>
    2158:	1ec0106f          	j	3344 <_vfprintf_r+0x1600>
    215c:	00094e03          	lbu	t3,0(s2)
    2160:	d95ff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    2164:	00800613          	li	a2,8
    2168:	00000593          	li	a1,0
    216c:	09010513          	add	a0,sp,144
    2170:	c81fe0ef          	jal	df0 <memset>
    2174:	00100513          	li	a0,1
    2178:	00a90933          	add	s2,s2,a0
    217c:	d11ff06f          	j	1e8c <_vfprintf_r+0x148>
    2180:	00050493          	mv	s1,a0
    2184:	41890cb3          	sub	s9,s2,s8
    2188:	05890063          	beq	s2,s8,21c8 <_vfprintf_r+0x484>
    218c:	0a812683          	lw	a3,168(sp)
    2190:	0a412703          	lw	a4,164(sp)
    2194:	01842023          	sw	s8,0(s0)
    2198:	019686b3          	add	a3,a3,s9
    219c:	00170713          	add	a4,a4,1
    21a0:	01942223          	sw	s9,4(s0)
    21a4:	0ad12423          	sw	a3,168(sp)
    21a8:	0ae12223          	sw	a4,164(sp)
    21ac:	00700693          	li	a3,7
    21b0:	00840413          	add	s0,s0,8
    21b4:	02e6c863          	blt	a3,a4,21e4 <_vfprintf_r+0x4a0>
    21b8:	00c12783          	lw	a5,12(sp)
    21bc:	019787b3          	add	a5,a5,s9
    21c0:	00f12623          	sw	a5,12(sp)
    21c4:	d00496e3          	bnez	s1,1ed0 <_vfprintf_r+0x18c>
    21c8:	0a812783          	lw	a5,168(sp)
    21cc:	00078463          	beqz	a5,21d4 <_vfprintf_r+0x490>
    21d0:	4090106f          	j	3dd8 <_vfprintf_r+0x2094>
    21d4:	00812783          	lw	a5,8(sp)
    21d8:	0a012223          	sw	zero,164(sp)
    21dc:	00c79783          	lh	a5,12(a5)
    21e0:	0500006f          	j	2230 <_vfprintf_r+0x4ec>
    21e4:	00812583          	lw	a1,8(sp)
    21e8:	0a010613          	add	a2,sp,160
    21ec:	00098513          	mv	a0,s3
    21f0:	211020ef          	jal	4c00 <__sprint_r>
    21f4:	02051a63          	bnez	a0,2228 <_vfprintf_r+0x4e4>
    21f8:	0ac10413          	add	s0,sp,172
    21fc:	fbdff06f          	j	21b8 <_vfprintf_r+0x474>
    2200:	00812583          	lw	a1,8(sp)
    2204:	0a010613          	add	a2,sp,160
    2208:	00098513          	mv	a0,s3
    220c:	1f5020ef          	jal	4c00 <__sprint_r>
    2210:	e60504e3          	beqz	a0,2078 <_vfprintf_r+0x334>
    2214:	01012283          	lw	t0,16(sp)
    2218:	00028863          	beqz	t0,2228 <_vfprintf_r+0x4e4>
    221c:	00028593          	mv	a1,t0
    2220:	00098513          	mv	a0,s3
    2224:	81cff0ef          	jal	1240 <_free_r>
    2228:	00812783          	lw	a5,8(sp)
    222c:	00c79783          	lh	a5,12(a5)
    2230:	00812703          	lw	a4,8(sp)
    2234:	06472703          	lw	a4,100(a4)
    2238:	00177713          	and	a4,a4,1
    223c:	3c070463          	beqz	a4,2604 <_vfprintf_r+0x8c0>
    2240:	0407f793          	and	a5,a5,64
    2244:	18412483          	lw	s1,388(sp)
    2248:	18012903          	lw	s2,384(sp)
    224c:	17812a03          	lw	s4,376(sp)
    2250:	17412a83          	lw	s5,372(sp)
    2254:	17012b03          	lw	s6,368(sp)
    2258:	16c12b83          	lw	s7,364(sp)
    225c:	16812c03          	lw	s8,360(sp)
    2260:	16412c83          	lw	s9,356(sp)
    2264:	16012d03          	lw	s10,352(sp)
    2268:	15c12d83          	lw	s11,348(sp)
    226c:	00078463          	beqz	a5,2274 <_vfprintf_r+0x530>
    2270:	3d00206f          	j	4640 <_vfprintf_r+0x28fc>
    2274:	18c12083          	lw	ra,396(sp)
    2278:	18812403          	lw	s0,392(sp)
    227c:	00c12503          	lw	a0,12(sp)
    2280:	17c12983          	lw	s3,380(sp)
    2284:	19010113          	add	sp,sp,400
    2288:	00008067          	ret
    228c:	008a7713          	and	a4,s4,8
    2290:	000a0e93          	mv	t4,s4
    2294:	000b0313          	mv	t1,s6
    2298:	00070463          	beqz	a4,22a0 <_vfprintf_r+0x55c>
    229c:	0200106f          	j	32bc <_vfprintf_r+0x1578>
    22a0:	01412783          	lw	a5,20(sp)
    22a4:	00778b13          	add	s6,a5,7
    22a8:	ff8b7b13          	and	s6,s6,-8
    22ac:	000b2783          	lw	a5,0(s6)
    22b0:	02f12423          	sw	a5,40(sp)
    22b4:	004b2783          	lw	a5,4(s6)
    22b8:	02f12623          	sw	a5,44(sp)
    22bc:	008b0793          	add	a5,s6,8
    22c0:	00f12a23          	sw	a5,20(sp)
    22c4:	02c12a03          	lw	s4,44(sp)
    22c8:	7fffe717          	auipc	a4,0x7fffe
    22cc:	3d870713          	add	a4,a4,984 # 800006a0 <__global_locale+0x16c>
    22d0:	00072c83          	lw	s9,0(a4)
    22d4:	00472d03          	lw	s10,4(a4)
    22d8:	02812b03          	lw	s6,40(sp)
    22dc:	001a1493          	sll	s1,s4,0x1
    22e0:	0014d493          	srl	s1,s1,0x1
    22e4:	000b0513          	mv	a0,s6
    22e8:	00048593          	mv	a1,s1
    22ec:	000c8613          	mv	a2,s9
    22f0:	000d0693          	mv	a3,s10
    22f4:	02612223          	sw	t1,36(sp)
    22f8:	03c12023          	sw	t3,32(sp)
    22fc:	01d12823          	sw	t4,16(sp)
    2300:	26c0c0ef          	jal	e56c <__unorddf2>
    2304:	01012e83          	lw	t4,16(sp)
    2308:	02012e03          	lw	t3,32(sp)
    230c:	02412303          	lw	t1,36(sp)
    2310:	00050463          	beqz	a0,2318 <_vfprintf_r+0x5d4>
    2314:	4080106f          	j	371c <_vfprintf_r+0x19d8>
    2318:	000b0513          	mv	a0,s6
    231c:	00048593          	mv	a1,s1
    2320:	000c8613          	mv	a2,s9
    2324:	000d0693          	mv	a3,s10
    2328:	0a40b0ef          	jal	d3cc <__ledf2>
    232c:	01012e83          	lw	t4,16(sp)
    2330:	02012e03          	lw	t3,32(sp)
    2334:	02412303          	lw	t1,36(sp)
    2338:	00a04463          	bgtz	a0,2340 <_vfprintf_r+0x5fc>
    233c:	3e00106f          	j	371c <_vfprintf_r+0x19d8>
    2340:	000b0513          	mv	a0,s6
    2344:	000a0593          	mv	a1,s4
    2348:	00000613          	li	a2,0
    234c:	00000693          	li	a3,0
    2350:	07c0b0ef          	jal	d3cc <__ledf2>
    2354:	01012e83          	lw	t4,16(sp)
    2358:	02012e03          	lw	t3,32(sp)
    235c:	00055463          	bgez	a0,2364 <_vfprintf_r+0x620>
    2360:	6650106f          	j	41c4 <_vfprintf_r+0x2480>
    2364:	07714603          	lbu	a2,119(sp)
    2368:	04700713          	li	a4,71
    236c:	0000dc17          	auipc	s8,0xd
    2370:	bc0c0c13          	add	s8,s8,-1088 # ef2c <__fini_array_end+0x198>
    2374:	01c74663          	blt	a4,t3,2380 <_vfprintf_r+0x63c>
    2378:	0000dc17          	auipc	s8,0xd
    237c:	bb0c0c13          	add	s8,s8,-1104 # ef28 <__fini_array_end+0x194>
    2380:	00012823          	sw	zero,16(sp)
    2384:	02012223          	sw	zero,36(sp)
    2388:	02012023          	sw	zero,32(sp)
    238c:	f7fefe93          	and	t4,t4,-129
    2390:	00300c93          	li	s9,3
    2394:	00300d13          	li	s10,3
    2398:	00000313          	li	t1,0
    239c:	00000a13          	li	s4,0
    23a0:	be0602e3          	beqz	a2,1f84 <_vfprintf_r+0x240>
    23a4:	001c8c93          	add	s9,s9,1
    23a8:	bddff06f          	j	1f84 <_vfprintf_r+0x240>
    23ac:	01000593          	li	a1,16
    23b0:	0a412603          	lw	a2,164(sp)
    23b4:	0000db17          	auipc	s6,0xd
    23b8:	07cb0b13          	add	s6,s6,124 # f430 <blanks.1>
    23bc:	0ae5dc63          	bge	a1,a4,2474 <_vfprintf_r+0x730>
    23c0:	00040793          	mv	a5,s0
    23c4:	00048693          	mv	a3,s1
    23c8:	01000893          	li	a7,16
    23cc:	000b0493          	mv	s1,s6
    23d0:	00700393          	li	t2,7
    23d4:	000a0b13          	mv	s6,s4
    23d8:	04512223          	sw	t0,68(sp)
    23dc:	05f12823          	sw	t6,80(sp)
    23e0:	05d12a23          	sw	t4,84(sp)
    23e4:	05c12c23          	sw	t3,88(sp)
    23e8:	00070413          	mv	s0,a4
    23ec:	00030a13          	mv	s4,t1
    23f0:	00c0006f          	j	23fc <_vfprintf_r+0x6b8>
    23f4:	ff040413          	add	s0,s0,-16
    23f8:	0488da63          	bge	a7,s0,244c <_vfprintf_r+0x708>
    23fc:	01068693          	add	a3,a3,16
    2400:	00160613          	add	a2,a2,1
    2404:	0097a023          	sw	s1,0(a5)
    2408:	0117a223          	sw	a7,4(a5)
    240c:	0ad12423          	sw	a3,168(sp)
    2410:	0ac12223          	sw	a2,164(sp)
    2414:	00878793          	add	a5,a5,8
    2418:	fcc3dee3          	bge	t2,a2,23f4 <_vfprintf_r+0x6b0>
    241c:	00812583          	lw	a1,8(sp)
    2420:	0a010613          	add	a2,sp,160
    2424:	00098513          	mv	a0,s3
    2428:	7d8020ef          	jal	4c00 <__sprint_r>
    242c:	de0514e3          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    2430:	01000893          	li	a7,16
    2434:	ff040413          	add	s0,s0,-16
    2438:	0a812683          	lw	a3,168(sp)
    243c:	0a412603          	lw	a2,164(sp)
    2440:	0ac10793          	add	a5,sp,172
    2444:	00700393          	li	t2,7
    2448:	fa88cae3          	blt	a7,s0,23fc <_vfprintf_r+0x6b8>
    244c:	04412283          	lw	t0,68(sp)
    2450:	05012f83          	lw	t6,80(sp)
    2454:	05412e83          	lw	t4,84(sp)
    2458:	05812e03          	lw	t3,88(sp)
    245c:	000a0313          	mv	t1,s4
    2460:	00040713          	mv	a4,s0
    2464:	000b0a13          	mv	s4,s6
    2468:	00078413          	mv	s0,a5
    246c:	00048b13          	mv	s6,s1
    2470:	00068493          	mv	s1,a3
    2474:	00e484b3          	add	s1,s1,a4
    2478:	00160613          	add	a2,a2,1
    247c:	00e42223          	sw	a4,4(s0)
    2480:	01642023          	sw	s6,0(s0)
    2484:	0a912423          	sw	s1,168(sp)
    2488:	0ac12223          	sw	a2,164(sp)
    248c:	00700713          	li	a4,7
    2490:	00c75463          	bge	a4,a2,2498 <_vfprintf_r+0x754>
    2494:	2380106f          	j	36cc <_vfprintf_r+0x1988>
    2498:	07714603          	lbu	a2,119(sp)
    249c:	00840413          	add	s0,s0,8
    24a0:	b05ff06f          	j	1fa4 <_vfprintf_r+0x260>
    24a4:	00812583          	lw	a1,8(sp)
    24a8:	0a010613          	add	a2,sp,160
    24ac:	00098513          	mv	a0,s3
    24b0:	04612e23          	sw	t1,92(sp)
    24b4:	05c12c23          	sw	t3,88(sp)
    24b8:	05d12a23          	sw	t4,84(sp)
    24bc:	05f12823          	sw	t6,80(sp)
    24c0:	04512223          	sw	t0,68(sp)
    24c4:	73c020ef          	jal	4c00 <__sprint_r>
    24c8:	d40516e3          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    24cc:	0a812483          	lw	s1,168(sp)
    24d0:	05c12303          	lw	t1,92(sp)
    24d4:	05812e03          	lw	t3,88(sp)
    24d8:	05412e83          	lw	t4,84(sp)
    24dc:	05012f83          	lw	t6,80(sp)
    24e0:	04412283          	lw	t0,68(sp)
    24e4:	0ac10413          	add	s0,sp,172
    24e8:	af1ff06f          	j	1fd8 <_vfprintf_r+0x294>
    24ec:	0a412d03          	lw	s10,164(sp)
    24f0:	01812783          	lw	a5,24(sp)
    24f4:	00100693          	li	a3,1
    24f8:	01842023          	sw	s8,0(s0)
    24fc:	00148493          	add	s1,s1,1
    2500:	001d0d13          	add	s10,s10,1
    2504:	00840b13          	add	s6,s0,8
    2508:	32f6d0e3          	bge	a3,a5,3028 <_vfprintf_r+0x12e4>
    250c:	00100693          	li	a3,1
    2510:	00d42223          	sw	a3,4(s0)
    2514:	0a912423          	sw	s1,168(sp)
    2518:	0ba12223          	sw	s10,164(sp)
    251c:	00700693          	li	a3,7
    2520:	01a6d463          	bge	a3,s10,2528 <_vfprintf_r+0x7e4>
    2524:	0680106f          	j	358c <_vfprintf_r+0x1848>
    2528:	03012783          	lw	a5,48(sp)
    252c:	03412703          	lw	a4,52(sp)
    2530:	001d0d13          	add	s10,s10,1
    2534:	00f484b3          	add	s1,s1,a5
    2538:	00eb2023          	sw	a4,0(s6)
    253c:	00fb2223          	sw	a5,4(s6)
    2540:	0a912423          	sw	s1,168(sp)
    2544:	0ba12223          	sw	s10,164(sp)
    2548:	00700693          	li	a3,7
    254c:	008b0b13          	add	s6,s6,8
    2550:	01a6d463          	bge	a3,s10,2558 <_vfprintf_r+0x814>
    2554:	0680106f          	j	35bc <_vfprintf_r+0x1878>
    2558:	02812603          	lw	a2,40(sp)
    255c:	02c12683          	lw	a3,44(sp)
    2560:	01812783          	lw	a5,24(sp)
    2564:	00060513          	mv	a0,a2
    2568:	00068593          	mv	a1,a3
    256c:	00000613          	li	a2,0
    2570:	00000693          	li	a3,0
    2574:	03d12023          	sw	t4,32(sp)
    2578:	fff78413          	add	s0,a5,-1
    257c:	4c50a0ef          	jal	d240 <__eqdf2>
    2580:	02012e83          	lw	t4,32(sp)
    2584:	2e0506e3          	beqz	a0,3070 <_vfprintf_r+0x132c>
    2588:	001c0793          	add	a5,s8,1
    258c:	001d0d13          	add	s10,s10,1
    2590:	008484b3          	add	s1,s1,s0
    2594:	00fb2023          	sw	a5,0(s6)
    2598:	008b2223          	sw	s0,4(s6)
    259c:	0a912423          	sw	s1,168(sp)
    25a0:	0ba12223          	sw	s10,164(sp)
    25a4:	00700793          	li	a5,7
    25a8:	008b0b13          	add	s6,s6,8
    25ac:	29a7cce3          	blt	a5,s10,3044 <_vfprintf_r+0x1300>
    25b0:	04012703          	lw	a4,64(sp)
    25b4:	08810793          	add	a5,sp,136
    25b8:	001d0d13          	add	s10,s10,1
    25bc:	009704b3          	add	s1,a4,s1
    25c0:	00fb2023          	sw	a5,0(s6)
    25c4:	00eb2223          	sw	a4,4(s6)
    25c8:	0a912423          	sw	s1,168(sp)
    25cc:	0ba12223          	sw	s10,164(sp)
    25d0:	00700793          	li	a5,7
    25d4:	008b0413          	add	s0,s6,8
    25d8:	a7a7dae3          	bge	a5,s10,204c <_vfprintf_r+0x308>
    25dc:	00812583          	lw	a1,8(sp)
    25e0:	0a010613          	add	a2,sp,160
    25e4:	00098513          	mv	a0,s3
    25e8:	03d12023          	sw	t4,32(sp)
    25ec:	614020ef          	jal	4c00 <__sprint_r>
    25f0:	c20512e3          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    25f4:	0a812483          	lw	s1,168(sp)
    25f8:	02012e83          	lw	t4,32(sp)
    25fc:	0ac10413          	add	s0,sp,172
    2600:	a4dff06f          	j	204c <_vfprintf_r+0x308>
    2604:	2007f713          	and	a4,a5,512
    2608:	c2071ce3          	bnez	a4,2240 <_vfprintf_r+0x4fc>
    260c:	00812403          	lw	s0,8(sp)
    2610:	05842503          	lw	a0,88(s0)
    2614:	fd8fe0ef          	jal	dec <__retarget_lock_release_recursive>
    2618:	00c41783          	lh	a5,12(s0)
    261c:	c25ff06f          	j	2240 <_vfprintf_r+0x4fc>
    2620:	00094e03          	lbu	t3,0(s2)
    2624:	020a6a13          	or	s4,s4,32
    2628:	8cdff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    262c:	01412703          	lw	a4,20(sp)
    2630:	04300793          	li	a5,67
    2634:	000a0e93          	mv	t4,s4
    2638:	00470493          	add	s1,a4,4
    263c:	64fe08e3          	beq	t3,a5,348c <_vfprintf_r+0x1748>
    2640:	010a7793          	and	a5,s4,16
    2644:	640794e3          	bnez	a5,348c <_vfprintf_r+0x1748>
    2648:	01412783          	lw	a5,20(sp)
    264c:	00100c93          	li	s9,1
    2650:	00100d13          	li	s10,1
    2654:	0007a783          	lw	a5,0(a5)
    2658:	0ec10c13          	add	s8,sp,236
    265c:	0ef10623          	sb	a5,236(sp)
    2660:	06010ba3          	sb	zero,119(sp)
    2664:	00912a23          	sw	s1,20(sp)
    2668:	00000613          	li	a2,0
    266c:	00012823          	sw	zero,16(sp)
    2670:	00000313          	li	t1,0
    2674:	02012223          	sw	zero,36(sp)
    2678:	02012023          	sw	zero,32(sp)
    267c:	00000a13          	li	s4,0
    2680:	905ff06f          	j	1f84 <_vfprintf_r+0x240>
    2684:	01412783          	lw	a5,20(sp)
    2688:	06010ba3          	sb	zero,119(sp)
    268c:	000b0313          	mv	t1,s6
    2690:	0007ac03          	lw	s8,0(a5)
    2694:	000a0e93          	mv	t4,s4
    2698:	00478b13          	add	s6,a5,4
    269c:	5a0c0ce3          	beqz	s8,3454 <_vfprintf_r+0x1710>
    26a0:	05300713          	li	a4,83
    26a4:	00ee1463          	bne	t3,a4,26ac <_vfprintf_r+0x968>
    26a8:	1d00106f          	j	3878 <_vfprintf_r+0x1b34>
    26ac:	010a7a13          	and	s4,s4,16
    26b0:	000a0463          	beqz	s4,26b8 <_vfprintf_r+0x974>
    26b4:	1c40106f          	j	3878 <_vfprintf_r+0x1b34>
    26b8:	00035463          	bgez	t1,26c0 <_vfprintf_r+0x97c>
    26bc:	6d40106f          	j	3d90 <_vfprintf_r+0x204c>
    26c0:	00030613          	mv	a2,t1
    26c4:	00000593          	li	a1,0
    26c8:	000c0513          	mv	a0,s8
    26cc:	03d12023          	sw	t4,32(sp)
    26d0:	00612a23          	sw	t1,20(sp)
    26d4:	0ec050ef          	jal	77c0 <memchr>
    26d8:	00a12823          	sw	a0,16(sp)
    26dc:	01412303          	lw	t1,20(sp)
    26e0:	02012e83          	lw	t4,32(sp)
    26e4:	00051463          	bnez	a0,26ec <_vfprintf_r+0x9a8>
    26e8:	1780206f          	j	4860 <_vfprintf_r+0x2b1c>
    26ec:	01012783          	lw	a5,16(sp)
    26f0:	07714603          	lbu	a2,119(sp)
    26f4:	01612a23          	sw	s6,20(sp)
    26f8:	41878d33          	sub	s10,a5,s8
    26fc:	fffd4813          	not	a6,s10
    2700:	41f85813          	sra	a6,a6,0x1f
    2704:	02012223          	sw	zero,36(sp)
    2708:	02012023          	sw	zero,32(sp)
    270c:	00012823          	sw	zero,16(sp)
    2710:	010d7cb3          	and	s9,s10,a6
    2714:	00000313          	li	t1,0
    2718:	07300e13          	li	t3,115
    271c:	860604e3          	beqz	a2,1f84 <_vfprintf_r+0x240>
    2720:	c85ff06f          	j	23a4 <_vfprintf_r+0x660>
    2724:	01412783          	lw	a5,20(sp)
    2728:	0007ab83          	lw	s7,0(a5)
    272c:	00478793          	add	a5,a5,4
    2730:	2a0bdae3          	bgez	s7,31e4 <_vfprintf_r+0x14a0>
    2734:	41700bb3          	neg	s7,s7
    2738:	00f12a23          	sw	a5,20(sp)
    273c:	00094e03          	lbu	t3,0(s2)
    2740:	004a6a13          	or	s4,s4,4
    2744:	fb0ff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    2748:	02b00793          	li	a5,43
    274c:	00094e03          	lbu	t3,0(s2)
    2750:	06f10ba3          	sb	a5,119(sp)
    2754:	fa0ff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    2758:	000b0313          	mv	t1,s6
    275c:	010a6613          	or	a2,s4,16
    2760:	02067793          	and	a5,a2,32
    2764:	1c0780e3          	beqz	a5,3124 <_vfprintf_r+0x13e0>
    2768:	01412783          	lw	a5,20(sp)
    276c:	00778b13          	add	s6,a5,7
    2770:	ff8b7b13          	and	s6,s6,-8
    2774:	000b2d03          	lw	s10,0(s6)
    2778:	004b2c83          	lw	s9,4(s6)
    277c:	008b0793          	add	a5,s6,8
    2780:	00f12a23          	sw	a5,20(sp)
    2784:	00100793          	li	a5,1
    2788:	00000713          	li	a4,0
    278c:	06e10ba3          	sb	a4,119(sp)
    2790:	34034c63          	bltz	t1,2ae8 <_vfprintf_r+0xda4>
    2794:	019d6733          	or	a4,s10,s9
    2798:	f7f67e93          	and	t4,a2,-129
    279c:	34071463          	bnez	a4,2ae4 <_vfprintf_r+0xda0>
    27a0:	3a031a63          	bnez	t1,2b54 <_vfprintf_r+0xe10>
    27a4:	5c079ee3          	bnez	a5,3580 <_vfprintf_r+0x183c>
    27a8:	00167d13          	and	s10,a2,1
    27ac:	15010c13          	add	s8,sp,336
    27b0:	2c0d10e3          	bnez	s10,3270 <_vfprintf_r+0x152c>
    27b4:	07714603          	lbu	a2,119(sp)
    27b8:	00030c93          	mv	s9,t1
    27bc:	01a35463          	bge	t1,s10,27c4 <_vfprintf_r+0xa80>
    27c0:	000d0c93          	mv	s9,s10
    27c4:	00012823          	sw	zero,16(sp)
    27c8:	02012223          	sw	zero,36(sp)
    27cc:	02012023          	sw	zero,32(sp)
    27d0:	00000a13          	li	s4,0
    27d4:	fa060863          	beqz	a2,1f84 <_vfprintf_r+0x240>
    27d8:	bcdff06f          	j	23a4 <_vfprintf_r+0x660>
    27dc:	00094e03          	lbu	t3,0(s2)
    27e0:	080a6a13          	or	s4,s4,128
    27e4:	f10ff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    27e8:	00094e03          	lbu	t3,0(s2)
    27ec:	02a00793          	li	a5,42
    27f0:	00190693          	add	a3,s2,1
    27f4:	00fe1463          	bne	t3,a5,27fc <_vfprintf_r+0xab8>
    27f8:	1100206f          	j	4908 <_vfprintf_r+0x2bc4>
    27fc:	fd0e0713          	add	a4,t3,-48
    2800:	00900793          	li	a5,9
    2804:	00000b13          	li	s6,0
    2808:	00900613          	li	a2,9
    280c:	02e7e463          	bltu	a5,a4,2834 <_vfprintf_r+0xaf0>
    2810:	0006ce03          	lbu	t3,0(a3)
    2814:	002b1793          	sll	a5,s6,0x2
    2818:	016787b3          	add	a5,a5,s6
    281c:	00179793          	sll	a5,a5,0x1
    2820:	00e78b33          	add	s6,a5,a4
    2824:	fd0e0713          	add	a4,t3,-48
    2828:	00168693          	add	a3,a3,1
    282c:	fee672e3          	bgeu	a2,a4,2810 <_vfprintf_r+0xacc>
    2830:	320b4ce3          	bltz	s6,3368 <_vfprintf_r+0x1624>
    2834:	00068913          	mv	s2,a3
    2838:	ec0ff06f          	j	1ef8 <_vfprintf_r+0x1b4>
    283c:	00094e03          	lbu	t3,0(s2)
    2840:	001a6a13          	or	s4,s4,1
    2844:	eb0ff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    2848:	07714783          	lbu	a5,119(sp)
    284c:	00094e03          	lbu	t3,0(s2)
    2850:	ea079263          	bnez	a5,1ef4 <_vfprintf_r+0x1b0>
    2854:	02000793          	li	a5,32
    2858:	06f10ba3          	sb	a5,119(sp)
    285c:	e98ff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    2860:	00094e03          	lbu	t3,0(s2)
    2864:	06c00793          	li	a5,108
    2868:	3afe00e3          	beq	t3,a5,3408 <_vfprintf_r+0x16c4>
    286c:	010a6a13          	or	s4,s4,16
    2870:	e84ff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    2874:	00094e03          	lbu	t3,0(s2)
    2878:	008a6a13          	or	s4,s4,8
    287c:	e78ff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    2880:	000b0313          	mv	t1,s6
    2884:	010a6e93          	or	t4,s4,16
    2888:	020ef793          	and	a5,t4,32
    288c:	0c0786e3          	beqz	a5,3158 <_vfprintf_r+0x1414>
    2890:	01412783          	lw	a5,20(sp)
    2894:	00778b13          	add	s6,a5,7
    2898:	ff8b7b13          	and	s6,s6,-8
    289c:	004b2783          	lw	a5,4(s6)
    28a0:	000b2d03          	lw	s10,0(s6)
    28a4:	008b0713          	add	a4,s6,8
    28a8:	00e12a23          	sw	a4,20(sp)
    28ac:	00078c93          	mv	s9,a5
    28b0:	0c07cee3          	bltz	a5,318c <_vfprintf_r+0x1448>
    28b4:	000e8613          	mv	a2,t4
    28b8:	02034263          	bltz	t1,28dc <_vfprintf_r+0xb98>
    28bc:	019d67b3          	or	a5,s10,s9
    28c0:	f7fef613          	and	a2,t4,-129
    28c4:	00079c63          	bnez	a5,28dc <_vfprintf_r+0xb98>
    28c8:	02031063          	bnez	t1,28e8 <_vfprintf_r+0xba4>
    28cc:	00000d13          	li	s10,0
    28d0:	00060e93          	mv	t4,a2
    28d4:	15010c13          	add	s8,sp,336
    28d8:	eddff06f          	j	27b4 <_vfprintf_r+0xa70>
    28dc:	520c90e3          	bnez	s9,35fc <_vfprintf_r+0x18b8>
    28e0:	00900793          	li	a5,9
    28e4:	51a7ece3          	bltu	a5,s10,35fc <_vfprintf_r+0x18b8>
    28e8:	030d0d13          	add	s10,s10,48
    28ec:	15a107a3          	sb	s10,335(sp)
    28f0:	00060e93          	mv	t4,a2
    28f4:	00100d13          	li	s10,1
    28f8:	14f10c13          	add	s8,sp,335
    28fc:	eb9ff06f          	j	27b4 <_vfprintf_r+0xa70>
    2900:	000b0313          	mv	t1,s6
    2904:	010a6e93          	or	t4,s4,16
    2908:	020ef793          	and	a5,t4,32
    290c:	7e078463          	beqz	a5,30f4 <_vfprintf_r+0x13b0>
    2910:	01412783          	lw	a5,20(sp)
    2914:	00778b13          	add	s6,a5,7
    2918:	ff8b7b13          	and	s6,s6,-8
    291c:	000b2d03          	lw	s10,0(s6)
    2920:	004b2c83          	lw	s9,4(s6)
    2924:	008b0793          	add	a5,s6,8
    2928:	00f12a23          	sw	a5,20(sp)
    292c:	bffef613          	and	a2,t4,-1025
    2930:	00000793          	li	a5,0
    2934:	e55ff06f          	j	2788 <_vfprintf_r+0xa44>
    2938:	00094e03          	lbu	t3,0(s2)
    293c:	06800793          	li	a5,104
    2940:	2cfe0ce3          	beq	t3,a5,3418 <_vfprintf_r+0x16d4>
    2944:	040a6a13          	or	s4,s4,64
    2948:	dacff06f          	j	1ef4 <_vfprintf_r+0x1b0>
    294c:	01412703          	lw	a4,20(sp)
    2950:	000087b7          	lui	a5,0x8
    2954:	83078793          	add	a5,a5,-2000 # 7830 <memchr+0x70>
    2958:	06f11c23          	sh	a5,120(sp)
    295c:	00470793          	add	a5,a4,4
    2960:	00f12a23          	sw	a5,20(sp)
    2964:	0000c797          	auipc	a5,0xc
    2968:	5d478793          	add	a5,a5,1492 # ef38 <__fini_array_end+0x1a4>
    296c:	02f12c23          	sw	a5,56(sp)
    2970:	00072d03          	lw	s10,0(a4)
    2974:	000b0313          	mv	t1,s6
    2978:	00000c93          	li	s9,0
    297c:	002a6613          	or	a2,s4,2
    2980:	00200793          	li	a5,2
    2984:	07800e13          	li	t3,120
    2988:	e01ff06f          	j	2788 <_vfprintf_r+0xa44>
    298c:	020a7793          	and	a5,s4,32
    2990:	180784e3          	beqz	a5,3318 <_vfprintf_r+0x15d4>
    2994:	01412783          	lw	a5,20(sp)
    2998:	00c12683          	lw	a3,12(sp)
    299c:	0007a783          	lw	a5,0(a5)
    29a0:	41f6d713          	sra	a4,a3,0x1f
    29a4:	00d7a023          	sw	a3,0(a5)
    29a8:	00e7a223          	sw	a4,4(a5)
    29ac:	01412783          	lw	a5,20(sp)
    29b0:	00090c13          	mv	s8,s2
    29b4:	00478793          	add	a5,a5,4
    29b8:	00f12a23          	sw	a5,20(sp)
    29bc:	cccff06f          	j	1e88 <_vfprintf_r+0x144>
    29c0:	06500713          	li	a4,101
    29c4:	b3c754e3          	bge	a4,t3,24ec <_vfprintf_r+0x7a8>
    29c8:	02812683          	lw	a3,40(sp)
    29cc:	02c12703          	lw	a4,44(sp)
    29d0:	00000613          	li	a2,0
    29d4:	00068513          	mv	a0,a3
    29d8:	00070593          	mv	a1,a4
    29dc:	00000693          	li	a3,0
    29e0:	05d12223          	sw	t4,68(sp)
    29e4:	05d0a0ef          	jal	d240 <__eqdf2>
    29e8:	04412e83          	lw	t4,68(sp)
    29ec:	4e051463          	bnez	a0,2ed4 <_vfprintf_r+0x1190>
    29f0:	0a412783          	lw	a5,164(sp)
    29f4:	0000c717          	auipc	a4,0xc
    29f8:	57470713          	add	a4,a4,1396 # ef68 <__fini_array_end+0x1d4>
    29fc:	00e42023          	sw	a4,0(s0)
    2a00:	00148493          	add	s1,s1,1
    2a04:	00100713          	li	a4,1
    2a08:	00178793          	add	a5,a5,1
    2a0c:	00e42223          	sw	a4,4(s0)
    2a10:	0a912423          	sw	s1,168(sp)
    2a14:	0af12223          	sw	a5,164(sp)
    2a18:	00700713          	li	a4,7
    2a1c:	00840413          	add	s0,s0,8
    2a20:	62f746e3          	blt	a4,a5,384c <_vfprintf_r+0x1b08>
    2a24:	07c12783          	lw	a5,124(sp)
    2a28:	01812703          	lw	a4,24(sp)
    2a2c:	78e7de63          	bge	a5,a4,31c8 <_vfprintf_r+0x1484>
    2a30:	03412783          	lw	a5,52(sp)
    2a34:	03012703          	lw	a4,48(sp)
    2a38:	00840413          	add	s0,s0,8
    2a3c:	fef42c23          	sw	a5,-8(s0)
    2a40:	0a412783          	lw	a5,164(sp)
    2a44:	00e484b3          	add	s1,s1,a4
    2a48:	fee42e23          	sw	a4,-4(s0)
    2a4c:	00178793          	add	a5,a5,1
    2a50:	0a912423          	sw	s1,168(sp)
    2a54:	0af12223          	sw	a5,164(sp)
    2a58:	00700713          	li	a4,7
    2a5c:	1cf746e3          	blt	a4,a5,3428 <_vfprintf_r+0x16e4>
    2a60:	01812783          	lw	a5,24(sp)
    2a64:	fff78d13          	add	s10,a5,-1
    2a68:	dfa05263          	blez	s10,204c <_vfprintf_r+0x308>
    2a6c:	01000713          	li	a4,16
    2a70:	0a412783          	lw	a5,164(sp)
    2a74:	0000d297          	auipc	t0,0xd
    2a78:	9ac28293          	add	t0,t0,-1620 # f420 <zeroes.0>
    2a7c:	77a752e3          	bge	a4,s10,39e0 <_vfprintf_r+0x1c9c>
    2a80:	00048713          	mv	a4,s1
    2a84:	01000c13          	li	s8,16
    2a88:	00700b13          	li	s6,7
    2a8c:	000e8493          	mv	s1,t4
    2a90:	00028a13          	mv	s4,t0
    2a94:	00c0006f          	j	2aa0 <_vfprintf_r+0xd5c>
    2a98:	ff0d0d13          	add	s10,s10,-16
    2a9c:	73ac5ce3          	bge	s8,s10,39d4 <_vfprintf_r+0x1c90>
    2aa0:	01070713          	add	a4,a4,16
    2aa4:	00178793          	add	a5,a5,1
    2aa8:	01442023          	sw	s4,0(s0)
    2aac:	01842223          	sw	s8,4(s0)
    2ab0:	0ae12423          	sw	a4,168(sp)
    2ab4:	0af12223          	sw	a5,164(sp)
    2ab8:	00840413          	add	s0,s0,8
    2abc:	fcfb5ee3          	bge	s6,a5,2a98 <_vfprintf_r+0xd54>
    2ac0:	00812583          	lw	a1,8(sp)
    2ac4:	0a010613          	add	a2,sp,160
    2ac8:	00098513          	mv	a0,s3
    2acc:	134020ef          	jal	4c00 <__sprint_r>
    2ad0:	f4051263          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    2ad4:	0a812703          	lw	a4,168(sp)
    2ad8:	0a412783          	lw	a5,164(sp)
    2adc:	0ac10413          	add	s0,sp,172
    2ae0:	fb9ff06f          	j	2a98 <_vfprintf_r+0xd54>
    2ae4:	000e8613          	mv	a2,t4
    2ae8:	00100713          	li	a4,1
    2aec:	dee788e3          	beq	a5,a4,28dc <_vfprintf_r+0xb98>
    2af0:	00200713          	li	a4,2
    2af4:	06e78c63          	beq	a5,a4,2b6c <_vfprintf_r+0xe28>
    2af8:	15010c13          	add	s8,sp,336
    2afc:	01dc9793          	sll	a5,s9,0x1d
    2b00:	007d7713          	and	a4,s10,7
    2b04:	003d5d13          	srl	s10,s10,0x3
    2b08:	03070713          	add	a4,a4,48
    2b0c:	01a7ed33          	or	s10,a5,s10
    2b10:	003cdc93          	srl	s9,s9,0x3
    2b14:	feec0fa3          	sb	a4,-1(s8)
    2b18:	019d67b3          	or	a5,s10,s9
    2b1c:	000c0593          	mv	a1,s8
    2b20:	fffc0c13          	add	s8,s8,-1
    2b24:	fc079ce3          	bnez	a5,2afc <_vfprintf_r+0xdb8>
    2b28:	00167693          	and	a3,a2,1
    2b2c:	06068a63          	beqz	a3,2ba0 <_vfprintf_r+0xe5c>
    2b30:	03000693          	li	a3,48
    2b34:	06d70663          	beq	a4,a3,2ba0 <_vfprintf_r+0xe5c>
    2b38:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x2ba>
    2b3c:	15010793          	add	a5,sp,336
    2b40:	fedc0fa3          	sb	a3,-1(s8)
    2b44:	40b78d33          	sub	s10,a5,a1
    2b48:	00060e93          	mv	t4,a2
    2b4c:	00058c13          	mv	s8,a1
    2b50:	c65ff06f          	j	27b4 <_vfprintf_r+0xa70>
    2b54:	00100713          	li	a4,1
    2b58:	00e79463          	bne	a5,a4,2b60 <_vfprintf_r+0xe1c>
    2b5c:	2b10106f          	j	460c <_vfprintf_r+0x28c8>
    2b60:	00200713          	li	a4,2
    2b64:	000e8613          	mv	a2,t4
    2b68:	f8e798e3          	bne	a5,a4,2af8 <_vfprintf_r+0xdb4>
    2b6c:	03812683          	lw	a3,56(sp)
    2b70:	15010c13          	add	s8,sp,336
    2b74:	00fd7793          	and	a5,s10,15
    2b78:	00f687b3          	add	a5,a3,a5
    2b7c:	0007c703          	lbu	a4,0(a5)
    2b80:	004d5d13          	srl	s10,s10,0x4
    2b84:	01cc9793          	sll	a5,s9,0x1c
    2b88:	01a7ed33          	or	s10,a5,s10
    2b8c:	004cdc93          	srl	s9,s9,0x4
    2b90:	feec0fa3          	sb	a4,-1(s8)
    2b94:	019d67b3          	or	a5,s10,s9
    2b98:	fffc0c13          	add	s8,s8,-1
    2b9c:	fc079ce3          	bnez	a5,2b74 <_vfprintf_r+0xe30>
    2ba0:	15010793          	add	a5,sp,336
    2ba4:	41878d33          	sub	s10,a5,s8
    2ba8:	00060e93          	mv	t4,a2
    2bac:	c09ff06f          	j	27b4 <_vfprintf_r+0xa70>
    2bb0:	419b8b33          	sub	s6,s7,s9
    2bb4:	c7605063          	blez	s6,2014 <_vfprintf_r+0x2d0>
    2bb8:	01000593          	li	a1,16
    2bbc:	0a412603          	lw	a2,164(sp)
    2bc0:	0000d297          	auipc	t0,0xd
    2bc4:	86028293          	add	t0,t0,-1952 # f420 <zeroes.0>
    2bc8:	0b65d463          	bge	a1,s6,2c70 <_vfprintf_r+0xf2c>
    2bcc:	00040793          	mv	a5,s0
    2bd0:	00048713          	mv	a4,s1
    2bd4:	000b0413          	mv	s0,s6
    2bd8:	01000893          	li	a7,16
    2bdc:	000a0b13          	mv	s6,s4
    2be0:	00700f93          	li	t6,7
    2be4:	05d12223          	sw	t4,68(sp)
    2be8:	05c12823          	sw	t3,80(sp)
    2bec:	00030a13          	mv	s4,t1
    2bf0:	00028493          	mv	s1,t0
    2bf4:	00c0006f          	j	2c00 <_vfprintf_r+0xebc>
    2bf8:	ff040413          	add	s0,s0,-16
    2bfc:	0488da63          	bge	a7,s0,2c50 <_vfprintf_r+0xf0c>
    2c00:	01070713          	add	a4,a4,16
    2c04:	00160613          	add	a2,a2,1
    2c08:	0097a023          	sw	s1,0(a5)
    2c0c:	0117a223          	sw	a7,4(a5)
    2c10:	0ae12423          	sw	a4,168(sp)
    2c14:	0ac12223          	sw	a2,164(sp)
    2c18:	00878793          	add	a5,a5,8
    2c1c:	fccfdee3          	bge	t6,a2,2bf8 <_vfprintf_r+0xeb4>
    2c20:	00812583          	lw	a1,8(sp)
    2c24:	0a010613          	add	a2,sp,160
    2c28:	00098513          	mv	a0,s3
    2c2c:	7d5010ef          	jal	4c00 <__sprint_r>
    2c30:	de051263          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    2c34:	01000893          	li	a7,16
    2c38:	ff040413          	add	s0,s0,-16
    2c3c:	0a812703          	lw	a4,168(sp)
    2c40:	0a412603          	lw	a2,164(sp)
    2c44:	0ac10793          	add	a5,sp,172
    2c48:	00700f93          	li	t6,7
    2c4c:	fa88cae3          	blt	a7,s0,2c00 <_vfprintf_r+0xebc>
    2c50:	04412e83          	lw	t4,68(sp)
    2c54:	05012e03          	lw	t3,80(sp)
    2c58:	000a0313          	mv	t1,s4
    2c5c:	00048293          	mv	t0,s1
    2c60:	000b0a13          	mv	s4,s6
    2c64:	00070493          	mv	s1,a4
    2c68:	00040b13          	mv	s6,s0
    2c6c:	00078413          	mv	s0,a5
    2c70:	016484b3          	add	s1,s1,s6
    2c74:	00160613          	add	a2,a2,1
    2c78:	00542023          	sw	t0,0(s0)
    2c7c:	01642223          	sw	s6,4(s0)
    2c80:	0a912423          	sw	s1,168(sp)
    2c84:	0ac12223          	sw	a2,164(sp)
    2c88:	00700713          	li	a4,7
    2c8c:	00840413          	add	s0,s0,8
    2c90:	b8c75263          	bge	a4,a2,2014 <_vfprintf_r+0x2d0>
    2c94:	00812583          	lw	a1,8(sp)
    2c98:	0a010613          	add	a2,sp,160
    2c9c:	00098513          	mv	a0,s3
    2ca0:	04612a23          	sw	t1,84(sp)
    2ca4:	05c12823          	sw	t3,80(sp)
    2ca8:	05d12223          	sw	t4,68(sp)
    2cac:	755010ef          	jal	4c00 <__sprint_r>
    2cb0:	d6051263          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    2cb4:	0a812483          	lw	s1,168(sp)
    2cb8:	05412303          	lw	t1,84(sp)
    2cbc:	05012e03          	lw	t3,80(sp)
    2cc0:	04412e83          	lw	t4,68(sp)
    2cc4:	0ac10413          	add	s0,sp,172
    2cc8:	b4cff06f          	j	2014 <_vfprintf_r+0x2d0>
    2ccc:	01000713          	li	a4,16
    2cd0:	0a412603          	lw	a2,164(sp)
    2cd4:	0000c297          	auipc	t0,0xc
    2cd8:	74c28293          	add	t0,t0,1868 # f420 <zeroes.0>
    2cdc:	0b675063          	bge	a4,s6,2d7c <_vfprintf_r+0x1038>
    2ce0:	00040793          	mv	a5,s0
    2ce4:	00048693          	mv	a3,s1
    2ce8:	000b0413          	mv	s0,s6
    2cec:	01000713          	li	a4,16
    2cf0:	00700893          	li	a7,7
    2cf4:	05d12223          	sw	t4,68(sp)
    2cf8:	000e0493          	mv	s1,t3
    2cfc:	00028b13          	mv	s6,t0
    2d00:	00c0006f          	j	2d0c <_vfprintf_r+0xfc8>
    2d04:	ff040413          	add	s0,s0,-16
    2d08:	04875e63          	bge	a4,s0,2d64 <_vfprintf_r+0x1020>
    2d0c:	01068693          	add	a3,a3,16
    2d10:	00160613          	add	a2,a2,1
    2d14:	0000c597          	auipc	a1,0xc
    2d18:	70c58593          	add	a1,a1,1804 # f420 <zeroes.0>
    2d1c:	00b7a023          	sw	a1,0(a5)
    2d20:	00e7a223          	sw	a4,4(a5)
    2d24:	0ad12423          	sw	a3,168(sp)
    2d28:	0ac12223          	sw	a2,164(sp)
    2d2c:	00878793          	add	a5,a5,8
    2d30:	fcc8dae3          	bge	a7,a2,2d04 <_vfprintf_r+0xfc0>
    2d34:	00812583          	lw	a1,8(sp)
    2d38:	0a010613          	add	a2,sp,160
    2d3c:	00098513          	mv	a0,s3
    2d40:	6c1010ef          	jal	4c00 <__sprint_r>
    2d44:	cc051863          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    2d48:	01000713          	li	a4,16
    2d4c:	ff040413          	add	s0,s0,-16
    2d50:	0a812683          	lw	a3,168(sp)
    2d54:	0a412603          	lw	a2,164(sp)
    2d58:	0ac10793          	add	a5,sp,172
    2d5c:	00700893          	li	a7,7
    2d60:	fa8746e3          	blt	a4,s0,2d0c <_vfprintf_r+0xfc8>
    2d64:	04412e83          	lw	t4,68(sp)
    2d68:	00048e13          	mv	t3,s1
    2d6c:	000b0293          	mv	t0,s6
    2d70:	00068493          	mv	s1,a3
    2d74:	00040b13          	mv	s6,s0
    2d78:	00078413          	mv	s0,a5
    2d7c:	016484b3          	add	s1,s1,s6
    2d80:	00160613          	add	a2,a2,1
    2d84:	00542023          	sw	t0,0(s0)
    2d88:	01642223          	sw	s6,4(s0)
    2d8c:	0a912423          	sw	s1,168(sp)
    2d90:	0ac12223          	sw	a2,164(sp)
    2d94:	00700713          	li	a4,7
    2d98:	00840413          	add	s0,s0,8
    2d9c:	a8c75063          	bge	a4,a2,201c <_vfprintf_r+0x2d8>
    2da0:	00812583          	lw	a1,8(sp)
    2da4:	0a010613          	add	a2,sp,160
    2da8:	00098513          	mv	a0,s3
    2dac:	05c12823          	sw	t3,80(sp)
    2db0:	05d12223          	sw	t4,68(sp)
    2db4:	64d010ef          	jal	4c00 <__sprint_r>
    2db8:	c4051e63          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    2dbc:	0a812483          	lw	s1,168(sp)
    2dc0:	05012e03          	lw	t3,80(sp)
    2dc4:	04412e83          	lw	t4,68(sp)
    2dc8:	0ac10413          	add	s0,sp,172
    2dcc:	a50ff06f          	j	201c <_vfprintf_r+0x2d8>
    2dd0:	00812583          	lw	a1,8(sp)
    2dd4:	0a010613          	add	a2,sp,160
    2dd8:	00098513          	mv	a0,s3
    2ddc:	04612c23          	sw	t1,88(sp)
    2de0:	05c12a23          	sw	t3,84(sp)
    2de4:	05d12823          	sw	t4,80(sp)
    2de8:	05f12223          	sw	t6,68(sp)
    2dec:	615010ef          	jal	4c00 <__sprint_r>
    2df0:	c2051263          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    2df4:	0a812483          	lw	s1,168(sp)
    2df8:	05812303          	lw	t1,88(sp)
    2dfc:	05412e03          	lw	t3,84(sp)
    2e00:	05012e83          	lw	t4,80(sp)
    2e04:	04412f83          	lw	t6,68(sp)
    2e08:	0ac10413          	add	s0,sp,172
    2e0c:	a00ff06f          	j	200c <_vfprintf_r+0x2c8>
    2e10:	01000713          	li	a4,16
    2e14:	0a412783          	lw	a5,164(sp)
    2e18:	0000cb17          	auipc	s6,0xc
    2e1c:	618b0b13          	add	s6,s6,1560 # f430 <blanks.1>
    2e20:	07a75c63          	bge	a4,s10,2e98 <_vfprintf_r+0x1154>
    2e24:	000b0713          	mv	a4,s6
    2e28:	01000c13          	li	s8,16
    2e2c:	00090b13          	mv	s6,s2
    2e30:	00700a13          	li	s4,7
    2e34:	00070913          	mv	s2,a4
    2e38:	00c0006f          	j	2e44 <_vfprintf_r+0x1100>
    2e3c:	ff0d0d13          	add	s10,s10,-16
    2e40:	05ac5663          	bge	s8,s10,2e8c <_vfprintf_r+0x1148>
    2e44:	01048493          	add	s1,s1,16
    2e48:	00178793          	add	a5,a5,1
    2e4c:	01242023          	sw	s2,0(s0)
    2e50:	01842223          	sw	s8,4(s0)
    2e54:	0a912423          	sw	s1,168(sp)
    2e58:	0af12223          	sw	a5,164(sp)
    2e5c:	00840413          	add	s0,s0,8
    2e60:	fcfa5ee3          	bge	s4,a5,2e3c <_vfprintf_r+0x10f8>
    2e64:	00812583          	lw	a1,8(sp)
    2e68:	0a010613          	add	a2,sp,160
    2e6c:	00098513          	mv	a0,s3
    2e70:	591010ef          	jal	4c00 <__sprint_r>
    2e74:	ba051063          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    2e78:	ff0d0d13          	add	s10,s10,-16
    2e7c:	0a812483          	lw	s1,168(sp)
    2e80:	0a412783          	lw	a5,164(sp)
    2e84:	0ac10413          	add	s0,sp,172
    2e88:	fbac4ee3          	blt	s8,s10,2e44 <_vfprintf_r+0x1100>
    2e8c:	00090713          	mv	a4,s2
    2e90:	000b0913          	mv	s2,s6
    2e94:	00070b13          	mv	s6,a4
    2e98:	01a484b3          	add	s1,s1,s10
    2e9c:	00178793          	add	a5,a5,1
    2ea0:	01642023          	sw	s6,0(s0)
    2ea4:	01a42223          	sw	s10,4(s0)
    2ea8:	0a912423          	sw	s1,168(sp)
    2eac:	0af12223          	sw	a5,164(sp)
    2eb0:	00700713          	li	a4,7
    2eb4:	9af75463          	bge	a4,a5,205c <_vfprintf_r+0x318>
    2eb8:	00812583          	lw	a1,8(sp)
    2ebc:	0a010613          	add	a2,sp,160
    2ec0:	00098513          	mv	a0,s3
    2ec4:	53d010ef          	jal	4c00 <__sprint_r>
    2ec8:	b4051663          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    2ecc:	0a812483          	lw	s1,168(sp)
    2ed0:	98cff06f          	j	205c <_vfprintf_r+0x318>
    2ed4:	07c12683          	lw	a3,124(sp)
    2ed8:	30d05c63          	blez	a3,31f0 <_vfprintf_r+0x14ac>
    2edc:	01812783          	lw	a5,24(sp)
    2ee0:	000a0b13          	mv	s6,s4
    2ee4:	0147d463          	bge	a5,s4,2eec <_vfprintf_r+0x11a8>
    2ee8:	00078b13          	mv	s6,a5
    2eec:	03605863          	blez	s6,2f1c <_vfprintf_r+0x11d8>
    2ef0:	0a412683          	lw	a3,164(sp)
    2ef4:	016484b3          	add	s1,s1,s6
    2ef8:	01842023          	sw	s8,0(s0)
    2efc:	00168693          	add	a3,a3,1
    2f00:	01642223          	sw	s6,4(s0)
    2f04:	0a912423          	sw	s1,168(sp)
    2f08:	0ad12223          	sw	a3,164(sp)
    2f0c:	00700613          	li	a2,7
    2f10:	00840413          	add	s0,s0,8
    2f14:	00d65463          	bge	a2,a3,2f1c <_vfprintf_r+0x11d8>
    2f18:	5c40106f          	j	44dc <_vfprintf_r+0x2798>
    2f1c:	fffb4693          	not	a3,s6
    2f20:	41f6d693          	sra	a3,a3,0x1f
    2f24:	00db7733          	and	a4,s6,a3
    2f28:	40ea0b33          	sub	s6,s4,a4
    2f2c:	35604ae3          	bgtz	s6,3a80 <_vfprintf_r+0x1d3c>
    2f30:	400ef713          	and	a4,t4,1024
    2f34:	014c0333          	add	t1,s8,s4
    2f38:	00070463          	beqz	a4,2f40 <_vfprintf_r+0x11fc>
    2f3c:	2980106f          	j	41d4 <_vfprintf_r+0x2490>
    2f40:	07c12d03          	lw	s10,124(sp)
    2f44:	01812783          	lw	a5,24(sp)
    2f48:	5afd4063          	blt	s10,a5,34e8 <_vfprintf_r+0x17a4>
    2f4c:	001ef713          	and	a4,t4,1
    2f50:	58071c63          	bnez	a4,34e8 <_vfprintf_r+0x17a4>
    2f54:	01812703          	lw	a4,24(sp)
    2f58:	00ec07b3          	add	a5,s8,a4
    2f5c:	41a70d33          	sub	s10,a4,s10
    2f60:	40678b33          	sub	s6,a5,t1
    2f64:	016d5463          	bge	s10,s6,2f6c <_vfprintf_r+0x1228>
    2f68:	000d0b13          	mv	s6,s10
    2f6c:	03605863          	blez	s6,2f9c <_vfprintf_r+0x1258>
    2f70:	0a412703          	lw	a4,164(sp)
    2f74:	016484b3          	add	s1,s1,s6
    2f78:	00642023          	sw	t1,0(s0)
    2f7c:	00170713          	add	a4,a4,1
    2f80:	01642223          	sw	s6,4(s0)
    2f84:	0a912423          	sw	s1,168(sp)
    2f88:	0ae12223          	sw	a4,164(sp)
    2f8c:	00700693          	li	a3,7
    2f90:	00840413          	add	s0,s0,8
    2f94:	00e6d463          	bge	a3,a4,2f9c <_vfprintf_r+0x1258>
    2f98:	5880106f          	j	4520 <_vfprintf_r+0x27dc>
    2f9c:	fffb4713          	not	a4,s6
    2fa0:	41f75713          	sra	a4,a4,0x1f
    2fa4:	00eb77b3          	and	a5,s6,a4
    2fa8:	40fd0d33          	sub	s10,s10,a5
    2fac:	8ba05063          	blez	s10,204c <_vfprintf_r+0x308>
    2fb0:	01000713          	li	a4,16
    2fb4:	0a412783          	lw	a5,164(sp)
    2fb8:	0000c297          	auipc	t0,0xc
    2fbc:	46828293          	add	t0,t0,1128 # f420 <zeroes.0>
    2fc0:	23a750e3          	bge	a4,s10,39e0 <_vfprintf_r+0x1c9c>
    2fc4:	00048713          	mv	a4,s1
    2fc8:	01000c13          	li	s8,16
    2fcc:	00700b13          	li	s6,7
    2fd0:	000e8493          	mv	s1,t4
    2fd4:	00028a13          	mv	s4,t0
    2fd8:	00c0006f          	j	2fe4 <_vfprintf_r+0x12a0>
    2fdc:	ff0d0d13          	add	s10,s10,-16
    2fe0:	1fac5ae3          	bge	s8,s10,39d4 <_vfprintf_r+0x1c90>
    2fe4:	01070713          	add	a4,a4,16
    2fe8:	00178793          	add	a5,a5,1
    2fec:	01442023          	sw	s4,0(s0)
    2ff0:	01842223          	sw	s8,4(s0)
    2ff4:	0ae12423          	sw	a4,168(sp)
    2ff8:	0af12223          	sw	a5,164(sp)
    2ffc:	00840413          	add	s0,s0,8
    3000:	fcfb5ee3          	bge	s6,a5,2fdc <_vfprintf_r+0x1298>
    3004:	00812583          	lw	a1,8(sp)
    3008:	0a010613          	add	a2,sp,160
    300c:	00098513          	mv	a0,s3
    3010:	3f1010ef          	jal	4c00 <__sprint_r>
    3014:	a0051063          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    3018:	0a812703          	lw	a4,168(sp)
    301c:	0a412783          	lw	a5,164(sp)
    3020:	0ac10413          	add	s0,sp,172
    3024:	fb9ff06f          	j	2fdc <_vfprintf_r+0x1298>
    3028:	001ef613          	and	a2,t4,1
    302c:	ce061063          	bnez	a2,250c <_vfprintf_r+0x7c8>
    3030:	00d42223          	sw	a3,4(s0)
    3034:	0a912423          	sw	s1,168(sp)
    3038:	0ba12223          	sw	s10,164(sp)
    303c:	00700793          	li	a5,7
    3040:	d7a7d863          	bge	a5,s10,25b0 <_vfprintf_r+0x86c>
    3044:	00812583          	lw	a1,8(sp)
    3048:	0a010613          	add	a2,sp,160
    304c:	00098513          	mv	a0,s3
    3050:	03d12023          	sw	t4,32(sp)
    3054:	3ad010ef          	jal	4c00 <__sprint_r>
    3058:	9a051e63          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    305c:	0a812483          	lw	s1,168(sp)
    3060:	0a412d03          	lw	s10,164(sp)
    3064:	02012e83          	lw	t4,32(sp)
    3068:	0ac10b13          	add	s6,sp,172
    306c:	d44ff06f          	j	25b0 <_vfprintf_r+0x86c>
    3070:	01812703          	lw	a4,24(sp)
    3074:	00100793          	li	a5,1
    3078:	d2e7dc63          	bge	a5,a4,25b0 <_vfprintf_r+0x86c>
    307c:	01100793          	li	a5,17
    3080:	0000c297          	auipc	t0,0xc
    3084:	3a028293          	add	t0,t0,928 # f420 <zeroes.0>
    3088:	18e7d4e3          	bge	a5,a4,3a10 <_vfprintf_r+0x1ccc>
    308c:	00040a13          	mv	s4,s0
    3090:	01000793          	li	a5,16
    3094:	00700c13          	li	s8,7
    3098:	03d12023          	sw	t4,32(sp)
    309c:	00028413          	mv	s0,t0
    30a0:	00c0006f          	j	30ac <_vfprintf_r+0x1368>
    30a4:	ff0a0a13          	add	s4,s4,-16
    30a8:	1547dee3          	bge	a5,s4,3a04 <_vfprintf_r+0x1cc0>
    30ac:	01048493          	add	s1,s1,16
    30b0:	001d0d13          	add	s10,s10,1
    30b4:	008b2023          	sw	s0,0(s6)
    30b8:	00fb2223          	sw	a5,4(s6)
    30bc:	0a912423          	sw	s1,168(sp)
    30c0:	0ba12223          	sw	s10,164(sp)
    30c4:	008b0b13          	add	s6,s6,8
    30c8:	fdac5ee3          	bge	s8,s10,30a4 <_vfprintf_r+0x1360>
    30cc:	00812583          	lw	a1,8(sp)
    30d0:	0a010613          	add	a2,sp,160
    30d4:	00098513          	mv	a0,s3
    30d8:	329010ef          	jal	4c00 <__sprint_r>
    30dc:	92051c63          	bnez	a0,2214 <_vfprintf_r+0x4d0>
    30e0:	0a812483          	lw	s1,168(sp)
    30e4:	0a412d03          	lw	s10,164(sp)
    30e8:	0ac10b13          	add	s6,sp,172
    30ec:	01000793          	li	a5,16
    30f0:	fb5ff06f          	j	30a4 <_vfprintf_r+0x1360>
    30f4:	01412703          	lw	a4,20(sp)
    30f8:	010ef793          	and	a5,t4,16
    30fc:	00072d03          	lw	s10,0(a4)
    3100:	00470713          	add	a4,a4,4
    3104:	00e12a23          	sw	a4,20(sp)
    3108:	1a079663          	bnez	a5,32b4 <_vfprintf_r+0x1570>
    310c:	040ef793          	and	a5,t4,64
    3110:	18078e63          	beqz	a5,32ac <_vfprintf_r+0x1568>
    3114:	010d1d13          	sll	s10,s10,0x10
    3118:	010d5d13          	srl	s10,s10,0x10
    311c:	00000c93          	li	s9,0
    3120:	80dff06f          	j	292c <_vfprintf_r+0xbe8>
    3124:	01412703          	lw	a4,20(sp)
    3128:	01067793          	and	a5,a2,16
    312c:	00072d03          	lw	s10,0(a4)
    3130:	00470713          	add	a4,a4,4
    3134:	00e12a23          	sw	a4,20(sp)
    3138:	14079a63          	bnez	a5,328c <_vfprintf_r+0x1548>
    313c:	04067793          	and	a5,a2,64
    3140:	14078063          	beqz	a5,3280 <_vfprintf_r+0x153c>
    3144:	010d1d13          	sll	s10,s10,0x10
    3148:	010d5d13          	srl	s10,s10,0x10
    314c:	00000c93          	li	s9,0
    3150:	00100793          	li	a5,1
    3154:	e34ff06f          	j	2788 <_vfprintf_r+0xa44>
    3158:	01412703          	lw	a4,20(sp)
    315c:	010ef793          	and	a5,t4,16
    3160:	00072d03          	lw	s10,0(a4)
    3164:	00470713          	add	a4,a4,4
    3168:	00e12a23          	sw	a4,20(sp)
    316c:	12079a63          	bnez	a5,32a0 <_vfprintf_r+0x155c>
    3170:	040ef793          	and	a5,t4,64
    3174:	12078263          	beqz	a5,3298 <_vfprintf_r+0x1554>
    3178:	010d1d13          	sll	s10,s10,0x10
    317c:	410d5d13          	sra	s10,s10,0x10
    3180:	41fd5c93          	sra	s9,s10,0x1f
    3184:	000c8793          	mv	a5,s9
    3188:	f207d663          	bgez	a5,28b4 <_vfprintf_r+0xb70>
    318c:	01a037b3          	snez	a5,s10
    3190:	419000b3          	neg	ra,s9
    3194:	40f08cb3          	sub	s9,ra,a5
    3198:	41a00d33          	neg	s10,s10
    319c:	000e8613          	mv	a2,t4
    31a0:	02d00713          	li	a4,45
    31a4:	00100793          	li	a5,1
    31a8:	de4ff06f          	j	278c <_vfprintf_r+0xa48>
    31ac:	00812403          	lw	s0,8(sp)
    31b0:	00f12623          	sw	a5,12(sp)
    31b4:	05842503          	lw	a0,88(s0)
    31b8:	c31fd0ef          	jal	de8 <__retarget_lock_acquire_recursive>
    31bc:	00c41703          	lh	a4,12(s0)
    31c0:	00c12783          	lw	a5,12(sp)
    31c4:	c01fe06f          	j	1dc4 <_vfprintf_r+0x80>
    31c8:	001ef793          	and	a5,t4,1
    31cc:	00079463          	bnez	a5,31d4 <_vfprintf_r+0x1490>
    31d0:	e7dfe06f          	j	204c <_vfprintf_r+0x308>
    31d4:	85dff06f          	j	2a30 <_vfprintf_r+0xcec>
    31d8:	000a0e93          	mv	t4,s4
    31dc:	000b0313          	mv	t1,s6
    31e0:	ea8ff06f          	j	2888 <_vfprintf_r+0xb44>
    31e4:	00094e03          	lbu	t3,0(s2)
    31e8:	00f12a23          	sw	a5,20(sp)
    31ec:	d09fe06f          	j	1ef4 <_vfprintf_r+0x1b0>
    31f0:	0a412703          	lw	a4,164(sp)
    31f4:	0000c617          	auipc	a2,0xc
    31f8:	d7460613          	add	a2,a2,-652 # ef68 <__fini_array_end+0x1d4>
    31fc:	00c42023          	sw	a2,0(s0)
    3200:	00148493          	add	s1,s1,1
    3204:	00100613          	li	a2,1
    3208:	00170713          	add	a4,a4,1
    320c:	00c42223          	sw	a2,4(s0)
    3210:	0a912423          	sw	s1,168(sp)
    3214:	0ae12223          	sw	a4,164(sp)
    3218:	00700613          	li	a2,7
    321c:	00840413          	add	s0,s0,8
    3220:	2ee64ce3          	blt	a2,a4,3d18 <_vfprintf_r+0x1fd4>
    3224:	7e069e63          	bnez	a3,3a20 <_vfprintf_r+0x1cdc>
    3228:	01812783          	lw	a5,24(sp)
    322c:	001ef713          	and	a4,t4,1
    3230:	00f76733          	or	a4,a4,a5
    3234:	00071463          	bnez	a4,323c <_vfprintf_r+0x14f8>
    3238:	e15fe06f          	j	204c <_vfprintf_r+0x308>
    323c:	03412703          	lw	a4,52(sp)
    3240:	03012783          	lw	a5,48(sp)
    3244:	00700693          	li	a3,7
    3248:	00e42023          	sw	a4,0(s0)
    324c:	0a412703          	lw	a4,164(sp)
    3250:	009784b3          	add	s1,a5,s1
    3254:	00f42223          	sw	a5,4(s0)
    3258:	00170713          	add	a4,a4,1
    325c:	0a912423          	sw	s1,168(sp)
    3260:	0ae12223          	sw	a4,164(sp)
    3264:	38e6c8e3          	blt	a3,a4,3df4 <_vfprintf_r+0x20b0>
    3268:	00840413          	add	s0,s0,8
    326c:	7e80006f          	j	3a54 <_vfprintf_r+0x1d10>
    3270:	03000793          	li	a5,48
    3274:	14f107a3          	sb	a5,335(sp)
    3278:	14f10c13          	add	s8,sp,335
    327c:	d38ff06f          	j	27b4 <_vfprintf_r+0xa70>
    3280:	20067793          	and	a5,a2,512
    3284:	00078463          	beqz	a5,328c <_vfprintf_r+0x1548>
    3288:	0ffd7d13          	zext.b	s10,s10
    328c:	00000c93          	li	s9,0
    3290:	00100793          	li	a5,1
    3294:	cf4ff06f          	j	2788 <_vfprintf_r+0xa44>
    3298:	200ef793          	and	a5,t4,512
    329c:	2c0796e3          	bnez	a5,3d68 <_vfprintf_r+0x2024>
    32a0:	41fd5c93          	sra	s9,s10,0x1f
    32a4:	000c8793          	mv	a5,s9
    32a8:	e08ff06f          	j	28b0 <_vfprintf_r+0xb6c>
    32ac:	200ef793          	and	a5,t4,512
    32b0:	2a0790e3          	bnez	a5,3d50 <_vfprintf_r+0x200c>
    32b4:	00000c93          	li	s9,0
    32b8:	e74ff06f          	j	292c <_vfprintf_r+0xbe8>
    32bc:	01412783          	lw	a5,20(sp)
    32c0:	06010513          	add	a0,sp,96
    32c4:	03612223          	sw	s6,36(sp)
    32c8:	0007a703          	lw	a4,0(a5)
    32cc:	03c12023          	sw	t3,32(sp)
    32d0:	00478b13          	add	s6,a5,4
    32d4:	00072683          	lw	a3,0(a4)
    32d8:	01412823          	sw	s4,16(sp)
    32dc:	06d12023          	sw	a3,96(sp)
    32e0:	00472683          	lw	a3,4(a4)
    32e4:	06d12223          	sw	a3,100(sp)
    32e8:	00872683          	lw	a3,8(a4)
    32ec:	06d12423          	sw	a3,104(sp)
    32f0:	00c72703          	lw	a4,12(a4)
    32f4:	06e12623          	sw	a4,108(sp)
    32f8:	4c80b0ef          	jal	e7c0 <__trunctfdf2>
    32fc:	02012e03          	lw	t3,32(sp)
    3300:	02412303          	lw	t1,36(sp)
    3304:	02a12423          	sw	a0,40(sp)
    3308:	02b12623          	sw	a1,44(sp)
    330c:	01612a23          	sw	s6,20(sp)
    3310:	000a0e93          	mv	t4,s4
    3314:	fb1fe06f          	j	22c4 <_vfprintf_r+0x580>
    3318:	010a7793          	and	a5,s4,16
    331c:	6c079a63          	bnez	a5,39f0 <_vfprintf_r+0x1cac>
    3320:	040a7793          	and	a5,s4,64
    3324:	24079ce3          	bnez	a5,3d7c <_vfprintf_r+0x2038>
    3328:	200a7f13          	and	t5,s4,512
    332c:	6c0f0263          	beqz	t5,39f0 <_vfprintf_r+0x1cac>
    3330:	01412783          	lw	a5,20(sp)
    3334:	00c12703          	lw	a4,12(sp)
    3338:	0007a783          	lw	a5,0(a5)
    333c:	00e78023          	sb	a4,0(a5)
    3340:	e6cff06f          	j	29ac <_vfprintf_r+0xc68>
    3344:	03c12783          	lw	a5,60(sp)
    3348:	00094e03          	lbu	t3,0(s2)
    334c:	00079463          	bnez	a5,3354 <_vfprintf_r+0x1610>
    3350:	ba5fe06f          	j	1ef4 <_vfprintf_r+0x1b0>
    3354:	0007c783          	lbu	a5,0(a5)
    3358:	00079463          	bnez	a5,3360 <_vfprintf_r+0x161c>
    335c:	b99fe06f          	j	1ef4 <_vfprintf_r+0x1b0>
    3360:	400a6a13          	or	s4,s4,1024
    3364:	b91fe06f          	j	1ef4 <_vfprintf_r+0x1b0>
    3368:	fff00b13          	li	s6,-1
    336c:	00068913          	mv	s2,a3
    3370:	b89fe06f          	j	1ef8 <_vfprintf_r+0x1b4>
    3374:	0000c797          	auipc	a5,0xc
    3378:	bd878793          	add	a5,a5,-1064 # ef4c <__fini_array_end+0x1b8>
    337c:	000a0e93          	mv	t4,s4
    3380:	000b0313          	mv	t1,s6
    3384:	02f12c23          	sw	a5,56(sp)
    3388:	020ef793          	and	a5,t4,32
    338c:	1c078263          	beqz	a5,3550 <_vfprintf_r+0x180c>
    3390:	01412783          	lw	a5,20(sp)
    3394:	00778b13          	add	s6,a5,7
    3398:	ff8b7b13          	and	s6,s6,-8
    339c:	000b2d03          	lw	s10,0(s6)
    33a0:	004b2c83          	lw	s9,4(s6)
    33a4:	008b0793          	add	a5,s6,8
    33a8:	00f12a23          	sw	a5,20(sp)
    33ac:	001ef793          	and	a5,t4,1
    33b0:	00078e63          	beqz	a5,33cc <_vfprintf_r+0x1688>
    33b4:	019d67b3          	or	a5,s10,s9
    33b8:	00078a63          	beqz	a5,33cc <_vfprintf_r+0x1688>
    33bc:	03000793          	li	a5,48
    33c0:	06f10c23          	sb	a5,120(sp)
    33c4:	07c10ca3          	sb	t3,121(sp)
    33c8:	002eee93          	or	t4,t4,2
    33cc:	bffef613          	and	a2,t4,-1025
    33d0:	00200793          	li	a5,2
    33d4:	bb4ff06f          	j	2788 <_vfprintf_r+0xa44>
    33d8:	000b0313          	mv	t1,s6
    33dc:	000a0613          	mv	a2,s4
    33e0:	b80ff06f          	j	2760 <_vfprintf_r+0xa1c>
    33e4:	000a0e93          	mv	t4,s4
    33e8:	000b0313          	mv	t1,s6
    33ec:	d1cff06f          	j	2908 <_vfprintf_r+0xbc4>
    33f0:	0000c797          	auipc	a5,0xc
    33f4:	b4878793          	add	a5,a5,-1208 # ef38 <__fini_array_end+0x1a4>
    33f8:	000a0e93          	mv	t4,s4
    33fc:	000b0313          	mv	t1,s6
    3400:	02f12c23          	sw	a5,56(sp)
    3404:	f85ff06f          	j	3388 <_vfprintf_r+0x1644>
    3408:	00194e03          	lbu	t3,1(s2)
    340c:	020a6a13          	or	s4,s4,32
    3410:	00190913          	add	s2,s2,1
    3414:	ae1fe06f          	j	1ef4 <_vfprintf_r+0x1b0>
    3418:	00194e03          	lbu	t3,1(s2)
    341c:	200a6a13          	or	s4,s4,512
    3420:	00190913          	add	s2,s2,1
    3424:	ad1fe06f          	j	1ef4 <_vfprintf_r+0x1b0>
    3428:	00812583          	lw	a1,8(sp)
    342c:	0a010613          	add	a2,sp,160
    3430:	00098513          	mv	a0,s3
    3434:	03d12023          	sw	t4,32(sp)
    3438:	7c8010ef          	jal	4c00 <__sprint_r>
    343c:	00050463          	beqz	a0,3444 <_vfprintf_r+0x1700>
    3440:	dd5fe06f          	j	2214 <_vfprintf_r+0x4d0>
    3444:	0a812483          	lw	s1,168(sp)
    3448:	02012e83          	lw	t4,32(sp)
    344c:	0ac10413          	add	s0,sp,172
    3450:	e10ff06f          	j	2a60 <_vfprintf_r+0xd1c>
    3454:	00600793          	li	a5,6
    3458:	00030c93          	mv	s9,t1
    345c:	0e67e6e3          	bltu	a5,t1,3d48 <_vfprintf_r+0x2004>
    3460:	01612a23          	sw	s6,20(sp)
    3464:	00012823          	sw	zero,16(sp)
    3468:	000c8d13          	mv	s10,s9
    346c:	00000613          	li	a2,0
    3470:	00000313          	li	t1,0
    3474:	02012223          	sw	zero,36(sp)
    3478:	02012023          	sw	zero,32(sp)
    347c:	00000a13          	li	s4,0
    3480:	0000cc17          	auipc	s8,0xc
    3484:	ae0c0c13          	add	s8,s8,-1312 # ef60 <__fini_array_end+0x1cc>
    3488:	afdfe06f          	j	1f84 <_vfprintf_r+0x240>
    348c:	00800613          	li	a2,8
    3490:	00000593          	li	a1,0
    3494:	09810513          	add	a0,sp,152
    3498:	03c12023          	sw	t3,32(sp)
    349c:	01d12823          	sw	t4,16(sp)
    34a0:	951fd0ef          	jal	df0 <memset>
    34a4:	01412783          	lw	a5,20(sp)
    34a8:	0ec10c13          	add	s8,sp,236
    34ac:	09810693          	add	a3,sp,152
    34b0:	0007a603          	lw	a2,0(a5)
    34b4:	000c0593          	mv	a1,s8
    34b8:	00098513          	mv	a0,s3
    34bc:	530070ef          	jal	a9ec <_wcrtomb_r>
    34c0:	fff00793          	li	a5,-1
    34c4:	01012e83          	lw	t4,16(sp)
    34c8:	02012e03          	lw	t3,32(sp)
    34cc:	00050d13          	mv	s10,a0
    34d0:	00f51463          	bne	a0,a5,34d8 <_vfprintf_r+0x1794>
    34d4:	4980106f          	j	496c <_vfprintf_r+0x2c28>
    34d8:	fff54813          	not	a6,a0
    34dc:	41f85813          	sra	a6,a6,0x1f
    34e0:	01057cb3          	and	s9,a0,a6
    34e4:	97cff06f          	j	2660 <_vfprintf_r+0x91c>
    34e8:	03412703          	lw	a4,52(sp)
    34ec:	03012783          	lw	a5,48(sp)
    34f0:	00700693          	li	a3,7
    34f4:	00e42023          	sw	a4,0(s0)
    34f8:	0a412703          	lw	a4,164(sp)
    34fc:	00f484b3          	add	s1,s1,a5
    3500:	00f42223          	sw	a5,4(s0)
    3504:	00170713          	add	a4,a4,1
    3508:	0a912423          	sw	s1,168(sp)
    350c:	0ae12223          	sw	a4,164(sp)
    3510:	00840413          	add	s0,s0,8
    3514:	a4e6d0e3          	bge	a3,a4,2f54 <_vfprintf_r+0x1210>
    3518:	00812583          	lw	a1,8(sp)
    351c:	0a010613          	add	a2,sp,160
    3520:	00098513          	mv	a0,s3
    3524:	02612223          	sw	t1,36(sp)
    3528:	03d12023          	sw	t4,32(sp)
    352c:	6d4010ef          	jal	4c00 <__sprint_r>
    3530:	00050463          	beqz	a0,3538 <_vfprintf_r+0x17f4>
    3534:	ce1fe06f          	j	2214 <_vfprintf_r+0x4d0>
    3538:	07c12d03          	lw	s10,124(sp)
    353c:	0a812483          	lw	s1,168(sp)
    3540:	02412303          	lw	t1,36(sp)
    3544:	02012e83          	lw	t4,32(sp)
    3548:	0ac10413          	add	s0,sp,172
    354c:	a09ff06f          	j	2f54 <_vfprintf_r+0x1210>
    3550:	01412703          	lw	a4,20(sp)
    3554:	010ef793          	and	a5,t4,16
    3558:	00072d03          	lw	s10,0(a4)
    355c:	00470713          	add	a4,a4,4
    3560:	00e12a23          	sw	a4,20(sp)
    3564:	08079863          	bnez	a5,35f4 <_vfprintf_r+0x18b0>
    3568:	040ef793          	and	a5,t4,64
    356c:	08078063          	beqz	a5,35ec <_vfprintf_r+0x18a8>
    3570:	010d1d13          	sll	s10,s10,0x10
    3574:	010d5d13          	srl	s10,s10,0x10
    3578:	00000c93          	li	s9,0
    357c:	e31ff06f          	j	33ac <_vfprintf_r+0x1668>
    3580:	00000d13          	li	s10,0
    3584:	15010c13          	add	s8,sp,336
    3588:	a2cff06f          	j	27b4 <_vfprintf_r+0xa70>
    358c:	00812583          	lw	a1,8(sp)
    3590:	0a010613          	add	a2,sp,160
    3594:	00098513          	mv	a0,s3
    3598:	03d12023          	sw	t4,32(sp)
    359c:	664010ef          	jal	4c00 <__sprint_r>
    35a0:	00050463          	beqz	a0,35a8 <_vfprintf_r+0x1864>
    35a4:	c71fe06f          	j	2214 <_vfprintf_r+0x4d0>
    35a8:	0a812483          	lw	s1,168(sp)
    35ac:	0a412d03          	lw	s10,164(sp)
    35b0:	02012e83          	lw	t4,32(sp)
    35b4:	0ac10b13          	add	s6,sp,172
    35b8:	f71fe06f          	j	2528 <_vfprintf_r+0x7e4>
    35bc:	00812583          	lw	a1,8(sp)
    35c0:	0a010613          	add	a2,sp,160
    35c4:	00098513          	mv	a0,s3
    35c8:	03d12023          	sw	t4,32(sp)
    35cc:	634010ef          	jal	4c00 <__sprint_r>
    35d0:	00050463          	beqz	a0,35d8 <_vfprintf_r+0x1894>
    35d4:	c41fe06f          	j	2214 <_vfprintf_r+0x4d0>
    35d8:	0a812483          	lw	s1,168(sp)
    35dc:	0a412d03          	lw	s10,164(sp)
    35e0:	02012e83          	lw	t4,32(sp)
    35e4:	0ac10b13          	add	s6,sp,172
    35e8:	f71fe06f          	j	2558 <_vfprintf_r+0x814>
    35ec:	200ef793          	and	a5,t4,512
    35f0:	76079663          	bnez	a5,3d5c <_vfprintf_r+0x2018>
    35f4:	00000c93          	li	s9,0
    35f8:	db5ff06f          	j	33ac <_vfprintf_r+0x1668>
    35fc:	00000793          	li	a5,0
    3600:	15010b13          	add	s6,sp,336
    3604:	01212823          	sw	s2,16(sp)
    3608:	00078913          	mv	s2,a5
    360c:	00098793          	mv	a5,s3
    3610:	04812823          	sw	s0,80(sp)
    3614:	000b0993          	mv	s3,s6
    3618:	03c12403          	lw	s0,60(sp)
    361c:	40067493          	and	s1,a2,1024
    3620:	0ff00a13          	li	s4,255
    3624:	03c12023          	sw	t3,32(sp)
    3628:	02c12223          	sw	a2,36(sp)
    362c:	04612223          	sw	t1,68(sp)
    3630:	00078b13          	mv	s6,a5
    3634:	0280006f          	j	365c <_vfprintf_r+0x1918>
    3638:	00a00613          	li	a2,10
    363c:	00000693          	li	a3,0
    3640:	000d0513          	mv	a0,s10
    3644:	000c8593          	mv	a1,s9
    3648:	581070ef          	jal	b3c8 <__udivdi3>
    364c:	6a0c8ee3          	beqz	s9,4508 <_vfprintf_r+0x27c4>
    3650:	00050d13          	mv	s10,a0
    3654:	00058c93          	mv	s9,a1
    3658:	000c0993          	mv	s3,s8
    365c:	00a00613          	li	a2,10
    3660:	00000693          	li	a3,0
    3664:	000d0513          	mv	a0,s10
    3668:	000c8593          	mv	a1,s9
    366c:	408080ef          	jal	ba74 <__umoddi3>
    3670:	03050513          	add	a0,a0,48
    3674:	fea98fa3          	sb	a0,-1(s3)
    3678:	fff98c13          	add	s8,s3,-1
    367c:	00190913          	add	s2,s2,1
    3680:	fa048ce3          	beqz	s1,3638 <_vfprintf_r+0x18f4>
    3684:	00044783          	lbu	a5,0(s0)
    3688:	faf918e3          	bne	s2,a5,3638 <_vfprintf_r+0x18f4>
    368c:	fb4906e3          	beq	s2,s4,3638 <_vfprintf_r+0x18f4>
    3690:	560c9ae3          	bnez	s9,4404 <_vfprintf_r+0x26c0>
    3694:	00900793          	li	a5,9
    3698:	57a7e6e3          	bltu	a5,s10,4404 <_vfprintf_r+0x26c0>
    369c:	02412603          	lw	a2,36(sp)
    36a0:	15010793          	add	a5,sp,336
    36a4:	02812e23          	sw	s0,60(sp)
    36a8:	01212c23          	sw	s2,24(sp)
    36ac:	02012e03          	lw	t3,32(sp)
    36b0:	01012903          	lw	s2,16(sp)
    36b4:	04412303          	lw	t1,68(sp)
    36b8:	05012403          	lw	s0,80(sp)
    36bc:	000b0993          	mv	s3,s6
    36c0:	41878d33          	sub	s10,a5,s8
    36c4:	00060e93          	mv	t4,a2
    36c8:	8ecff06f          	j	27b4 <_vfprintf_r+0xa70>
    36cc:	00812583          	lw	a1,8(sp)
    36d0:	0a010613          	add	a2,sp,160
    36d4:	00098513          	mv	a0,s3
    36d8:	04612e23          	sw	t1,92(sp)
    36dc:	05c12c23          	sw	t3,88(sp)
    36e0:	05d12a23          	sw	t4,84(sp)
    36e4:	05f12823          	sw	t6,80(sp)
    36e8:	04512223          	sw	t0,68(sp)
    36ec:	514010ef          	jal	4c00 <__sprint_r>
    36f0:	00050463          	beqz	a0,36f8 <_vfprintf_r+0x19b4>
    36f4:	b21fe06f          	j	2214 <_vfprintf_r+0x4d0>
    36f8:	07714603          	lbu	a2,119(sp)
    36fc:	0a812483          	lw	s1,168(sp)
    3700:	05c12303          	lw	t1,92(sp)
    3704:	05812e03          	lw	t3,88(sp)
    3708:	05412e83          	lw	t4,84(sp)
    370c:	05012f83          	lw	t6,80(sp)
    3710:	04412283          	lw	t0,68(sp)
    3714:	0ac10413          	add	s0,sp,172
    3718:	88dfe06f          	j	1fa4 <_vfprintf_r+0x260>
    371c:	02812883          	lw	a7,40(sp)
    3720:	02c12703          	lw	a4,44(sp)
    3724:	02612223          	sw	t1,36(sp)
    3728:	00088613          	mv	a2,a7
    372c:	00088513          	mv	a0,a7
    3730:	00070693          	mv	a3,a4
    3734:	00070593          	mv	a1,a4
    3738:	03c12023          	sw	t3,32(sp)
    373c:	01d12823          	sw	t4,16(sp)
    3740:	62d0a0ef          	jal	e56c <__unorddf2>
    3744:	01012e83          	lw	t4,16(sp)
    3748:	02012e03          	lw	t3,32(sp)
    374c:	02412303          	lw	t1,36(sp)
    3750:	00050463          	beqz	a0,3758 <_vfprintf_r+0x1a14>
    3754:	0e00106f          	j	4834 <_vfprintf_r+0x2af0>
    3758:	06100713          	li	a4,97
    375c:	08ee0263          	beq	t3,a4,37e0 <_vfprintf_r+0x1a9c>
    3760:	04100713          	li	a4,65
    3764:	05800793          	li	a5,88
    3768:	06ee0e63          	beq	t3,a4,37e4 <_vfprintf_r+0x1aa0>
    376c:	fff00713          	li	a4,-1
    3770:	00e31463          	bne	t1,a4,3778 <_vfprintf_r+0x1a34>
    3774:	01c0106f          	j	4790 <_vfprintf_r+0x2a4c>
    3778:	fdfe7713          	and	a4,t3,-33
    377c:	04700693          	li	a3,71
    3780:	00012823          	sw	zero,16(sp)
    3784:	00d71663          	bne	a4,a3,3790 <_vfprintf_r+0x1a4c>
    3788:	00031463          	bnez	t1,3790 <_vfprintf_r+0x1a4c>
    378c:	00100313          	li	t1,1
    3790:	100ee793          	or	a5,t4,256
    3794:	00078b13          	mv	s6,a5
    3798:	02c12783          	lw	a5,44(sp)
    379c:	04012223          	sw	zero,68(sp)
    37a0:	00078493          	mv	s1,a5
    37a4:	0007da63          	bgez	a5,37b8 <_vfprintf_r+0x1a74>
    37a8:	800004b7          	lui	s1,0x80000
    37ac:	00f4c4b3          	xor	s1,s1,a5
    37b0:	02d00793          	li	a5,45
    37b4:	04f12223          	sw	a5,68(sp)
    37b8:	fbfe0713          	add	a4,t3,-65
    37bc:	02500693          	li	a3,37
    37c0:	3ae6e463          	bltu	a3,a4,3b68 <_vfprintf_r+0x1e24>
    37c4:	0000c697          	auipc	a3,0xc
    37c8:	bc468693          	add	a3,a3,-1084 # f388 <_ctype_+0x270>
    37cc:	00271713          	sll	a4,a4,0x2
    37d0:	00d70733          	add	a4,a4,a3
    37d4:	00072703          	lw	a4,0(a4)
    37d8:	00d70733          	add	a4,a4,a3
    37dc:	00070067          	jr	a4
    37e0:	07800793          	li	a5,120
    37e4:	03000713          	li	a4,48
    37e8:	06e10c23          	sb	a4,120(sp)
    37ec:	06f10ca3          	sb	a5,121(sp)
    37f0:	06300713          	li	a4,99
    37f4:	00012823          	sw	zero,16(sp)
    37f8:	002eee93          	or	t4,t4,2
    37fc:	0ec10c13          	add	s8,sp,236
    3800:	f86758e3          	bge	a4,t1,3790 <_vfprintf_r+0x1a4c>
    3804:	00130593          	add	a1,t1,1
    3808:	00098513          	mv	a0,s3
    380c:	03c12023          	sw	t3,32(sp)
    3810:	01d12c23          	sw	t4,24(sp)
    3814:	00612823          	sw	t1,16(sp)
    3818:	d35fd0ef          	jal	154c <_malloc_r>
    381c:	01012303          	lw	t1,16(sp)
    3820:	01812e83          	lw	t4,24(sp)
    3824:	02012e03          	lw	t3,32(sp)
    3828:	00050c13          	mv	s8,a0
    382c:	00051463          	bnez	a0,3834 <_vfprintf_r+0x1af0>
    3830:	13c0106f          	j	496c <_vfprintf_r+0x2c28>
    3834:	00a12823          	sw	a0,16(sp)
    3838:	f59ff06f          	j	3790 <_vfprintf_r+0x1a4c>
    383c:	00098513          	mv	a0,s3
    3840:	1d0030ef          	jal	6a10 <__sinit>
    3844:	00c12783          	lw	a5,12(sp)
    3848:	d5cfe06f          	j	1da4 <_vfprintf_r+0x60>
    384c:	00812583          	lw	a1,8(sp)
    3850:	0a010613          	add	a2,sp,160
    3854:	00098513          	mv	a0,s3
    3858:	03d12023          	sw	t4,32(sp)
    385c:	3a4010ef          	jal	4c00 <__sprint_r>
    3860:	00050463          	beqz	a0,3868 <_vfprintf_r+0x1b24>
    3864:	9b1fe06f          	j	2214 <_vfprintf_r+0x4d0>
    3868:	0a812483          	lw	s1,168(sp)
    386c:	02012e83          	lw	t4,32(sp)
    3870:	0ac10413          	add	s0,sp,172
    3874:	9b0ff06f          	j	2a24 <_vfprintf_r+0xce0>
    3878:	00800613          	li	a2,8
    387c:	00000593          	li	a1,0
    3880:	09810513          	add	a0,sp,152
    3884:	02612023          	sw	t1,32(sp)
    3888:	01c12a23          	sw	t3,20(sp)
    388c:	01d12823          	sw	t4,16(sp)
    3890:	09812223          	sw	s8,132(sp)
    3894:	d5cfd0ef          	jal	df0 <memset>
    3898:	02012303          	lw	t1,32(sp)
    389c:	01012e83          	lw	t4,16(sp)
    38a0:	01412e03          	lw	t3,20(sp)
    38a4:	3a0340e3          	bltz	t1,4444 <_vfprintf_r+0x2700>
    38a8:	00000d13          	li	s10,0
    38ac:	01212823          	sw	s2,16(sp)
    38b0:	000c0c93          	mv	s9,s8
    38b4:	fff00493          	li	s1,-1
    38b8:	000b0c13          	mv	s8,s6
    38bc:	000e8a13          	mv	s4,t4
    38c0:	00040b13          	mv	s6,s0
    38c4:	000d0913          	mv	s2,s10
    38c8:	00030413          	mv	s0,t1
    38cc:	0300006f          	j	38fc <_vfprintf_r+0x1bb8>
    38d0:	09810693          	add	a3,sp,152
    38d4:	0ec10593          	add	a1,sp,236
    38d8:	00098513          	mv	a0,s3
    38dc:	110070ef          	jal	a9ec <_wcrtomb_r>
    38e0:	68950ae3          	beq	a0,s1,4774 <_vfprintf_r+0x2a30>
    38e4:	00a907b3          	add	a5,s2,a0
    38e8:	02f44263          	blt	s0,a5,390c <_vfprintf_r+0x1bc8>
    38ec:	004d0d13          	add	s10,s10,4
    38f0:	00879463          	bne	a5,s0,38f8 <_vfprintf_r+0x1bb4>
    38f4:	7990006f          	j	488c <_vfprintf_r+0x2b48>
    38f8:	00078913          	mv	s2,a5
    38fc:	08412783          	lw	a5,132(sp)
    3900:	01a787b3          	add	a5,a5,s10
    3904:	0007a603          	lw	a2,0(a5)
    3908:	fc0614e3          	bnez	a2,38d0 <_vfprintf_r+0x1b8c>
    390c:	00090d13          	mv	s10,s2
    3910:	01412e03          	lw	t3,20(sp)
    3914:	01012903          	lw	s2,16(sp)
    3918:	000b0413          	mv	s0,s6
    391c:	000a0e93          	mv	t4,s4
    3920:	000c0b13          	mv	s6,s8
    3924:	000c8c13          	mv	s8,s9
    3928:	340d0ce3          	beqz	s10,4480 <_vfprintf_r+0x273c>
    392c:	06300793          	li	a5,99
    3930:	59a7dee3          	bge	a5,s10,46cc <_vfprintf_r+0x2988>
    3934:	001d0593          	add	a1,s10,1
    3938:	00098513          	mv	a0,s3
    393c:	01c12a23          	sw	t3,20(sp)
    3940:	01d12823          	sw	t4,16(sp)
    3944:	c09fd0ef          	jal	154c <_malloc_r>
    3948:	01012e83          	lw	t4,16(sp)
    394c:	01412e03          	lw	t3,20(sp)
    3950:	00050c13          	mv	s8,a0
    3954:	620500e3          	beqz	a0,4774 <_vfprintf_r+0x2a30>
    3958:	00a12823          	sw	a0,16(sp)
    395c:	00800613          	li	a2,8
    3960:	00000593          	li	a1,0
    3964:	09810513          	add	a0,sp,152
    3968:	03c12023          	sw	t3,32(sp)
    396c:	01d12a23          	sw	t4,20(sp)
    3970:	c80fd0ef          	jal	df0 <memset>
    3974:	09810713          	add	a4,sp,152
    3978:	000d0693          	mv	a3,s10
    397c:	08410613          	add	a2,sp,132
    3980:	000c0593          	mv	a1,s8
    3984:	00098513          	mv	a0,s3
    3988:	0f0070ef          	jal	aa78 <_wcsrtombs_r>
    398c:	01412e83          	lw	t4,20(sp)
    3990:	02012e03          	lw	t3,32(sp)
    3994:	00ad0463          	beq	s10,a0,399c <_vfprintf_r+0x1c58>
    3998:	0240106f          	j	49bc <_vfprintf_r+0x2c78>
    399c:	01ac0733          	add	a4,s8,s10
    39a0:	00070023          	sb	zero,0(a4)
    39a4:	07714603          	lbu	a2,119(sp)
    39a8:	fffd4813          	not	a6,s10
    39ac:	41f85813          	sra	a6,a6,0x1f
    39b0:	01612a23          	sw	s6,20(sp)
    39b4:	02012223          	sw	zero,36(sp)
    39b8:	02012023          	sw	zero,32(sp)
    39bc:	010d7cb3          	and	s9,s10,a6
    39c0:	00000313          	li	t1,0
    39c4:	00000a13          	li	s4,0
    39c8:	00061463          	bnez	a2,39d0 <_vfprintf_r+0x1c8c>
    39cc:	db8fe06f          	j	1f84 <_vfprintf_r+0x240>
    39d0:	9d5fe06f          	j	23a4 <_vfprintf_r+0x660>
    39d4:	00048e93          	mv	t4,s1
    39d8:	000a0293          	mv	t0,s4
    39dc:	00070493          	mv	s1,a4
    39e0:	01a484b3          	add	s1,s1,s10
    39e4:	00178793          	add	a5,a5,1
    39e8:	00542023          	sw	t0,0(s0)
    39ec:	e48fe06f          	j	2034 <_vfprintf_r+0x2f0>
    39f0:	01412783          	lw	a5,20(sp)
    39f4:	00c12703          	lw	a4,12(sp)
    39f8:	0007a783          	lw	a5,0(a5)
    39fc:	00e7a023          	sw	a4,0(a5)
    3a00:	fadfe06f          	j	29ac <_vfprintf_r+0xc68>
    3a04:	02012e83          	lw	t4,32(sp)
    3a08:	00040293          	mv	t0,s0
    3a0c:	000a0413          	mv	s0,s4
    3a10:	008484b3          	add	s1,s1,s0
    3a14:	001d0d13          	add	s10,s10,1
    3a18:	005b2023          	sw	t0,0(s6)
    3a1c:	b7dfe06f          	j	2598 <_vfprintf_r+0x854>
    3a20:	03412703          	lw	a4,52(sp)
    3a24:	03012783          	lw	a5,48(sp)
    3a28:	00700613          	li	a2,7
    3a2c:	00e42023          	sw	a4,0(s0)
    3a30:	0a412703          	lw	a4,164(sp)
    3a34:	009784b3          	add	s1,a5,s1
    3a38:	00f42223          	sw	a5,4(s0)
    3a3c:	00170713          	add	a4,a4,1
    3a40:	0a912423          	sw	s1,168(sp)
    3a44:	0ae12223          	sw	a4,164(sp)
    3a48:	00840413          	add	s0,s0,8
    3a4c:	3ae64463          	blt	a2,a4,3df4 <_vfprintf_r+0x20b0>
    3a50:	3e06cee3          	bltz	a3,464c <_vfprintf_r+0x2908>
    3a54:	01812783          	lw	a5,24(sp)
    3a58:	00170713          	add	a4,a4,1
    3a5c:	01842023          	sw	s8,0(s0)
    3a60:	009784b3          	add	s1,a5,s1
    3a64:	00f42223          	sw	a5,4(s0)
    3a68:	0a912423          	sw	s1,168(sp)
    3a6c:	0ae12223          	sw	a4,164(sp)
    3a70:	00700793          	li	a5,7
    3a74:	00e7c463          	blt	a5,a4,3a7c <_vfprintf_r+0x1d38>
    3a78:	dd0fe06f          	j	2048 <_vfprintf_r+0x304>
    3a7c:	b61fe06f          	j	25dc <_vfprintf_r+0x898>
    3a80:	01000613          	li	a2,16
    3a84:	0a412683          	lw	a3,164(sp)
    3a88:	0000c297          	auipc	t0,0xc
    3a8c:	99828293          	add	t0,t0,-1640 # f420 <zeroes.0>
    3a90:	09665463          	bge	a2,s6,3b18 <_vfprintf_r+0x1dd4>
    3a94:	00040793          	mv	a5,s0
    3a98:	00048713          	mv	a4,s1
    3a9c:	00812403          	lw	s0,8(sp)
    3aa0:	01000893          	li	a7,16
    3aa4:	00700d13          	li	s10,7
    3aa8:	05d12223          	sw	t4,68(sp)
    3aac:	00028493          	mv	s1,t0
    3ab0:	00c0006f          	j	3abc <_vfprintf_r+0x1d78>
    3ab4:	ff0b0b13          	add	s6,s6,-16
    3ab8:	0568d863          	bge	a7,s6,3b08 <_vfprintf_r+0x1dc4>
    3abc:	01070713          	add	a4,a4,16
    3ac0:	00168693          	add	a3,a3,1
    3ac4:	0097a023          	sw	s1,0(a5)
    3ac8:	0117a223          	sw	a7,4(a5)
    3acc:	0ae12423          	sw	a4,168(sp)
    3ad0:	0ad12223          	sw	a3,164(sp)
    3ad4:	00878793          	add	a5,a5,8
    3ad8:	fcdd5ee3          	bge	s10,a3,3ab4 <_vfprintf_r+0x1d70>
    3adc:	0a010613          	add	a2,sp,160
    3ae0:	00040593          	mv	a1,s0
    3ae4:	00098513          	mv	a0,s3
    3ae8:	118010ef          	jal	4c00 <__sprint_r>
    3aec:	00050463          	beqz	a0,3af4 <_vfprintf_r+0x1db0>
    3af0:	f24fe06f          	j	2214 <_vfprintf_r+0x4d0>
    3af4:	0a812703          	lw	a4,168(sp)
    3af8:	0a412683          	lw	a3,164(sp)
    3afc:	0ac10793          	add	a5,sp,172
    3b00:	01000893          	li	a7,16
    3b04:	fb1ff06f          	j	3ab4 <_vfprintf_r+0x1d70>
    3b08:	04412e83          	lw	t4,68(sp)
    3b0c:	00048293          	mv	t0,s1
    3b10:	00078413          	mv	s0,a5
    3b14:	00070493          	mv	s1,a4
    3b18:	016484b3          	add	s1,s1,s6
    3b1c:	00168693          	add	a3,a3,1
    3b20:	00542023          	sw	t0,0(s0)
    3b24:	01642223          	sw	s6,4(s0)
    3b28:	0a912423          	sw	s1,168(sp)
    3b2c:	0ad12223          	sw	a3,164(sp)
    3b30:	00700713          	li	a4,7
    3b34:	00840413          	add	s0,s0,8
    3b38:	bed75c63          	bge	a4,a3,2f30 <_vfprintf_r+0x11ec>
    3b3c:	00812583          	lw	a1,8(sp)
    3b40:	0a010613          	add	a2,sp,160
    3b44:	00098513          	mv	a0,s3
    3b48:	05d12223          	sw	t4,68(sp)
    3b4c:	0b4010ef          	jal	4c00 <__sprint_r>
    3b50:	00050463          	beqz	a0,3b58 <_vfprintf_r+0x1e14>
    3b54:	ec0fe06f          	j	2214 <_vfprintf_r+0x4d0>
    3b58:	0a812483          	lw	s1,168(sp)
    3b5c:	04412e83          	lw	t4,68(sp)
    3b60:	0ac10413          	add	s0,sp,172
    3b64:	bccff06f          	j	2f30 <_vfprintf_r+0x11ec>
    3b68:	02812703          	lw	a4,40(sp)
    3b6c:	09810893          	add	a7,sp,152
    3b70:	08410813          	add	a6,sp,132
    3b74:	00070513          	mv	a0,a4
    3b78:	00050593          	mv	a1,a0
    3b7c:	00030713          	mv	a4,t1
    3b80:	07c10793          	add	a5,sp,124
    3b84:	00200693          	li	a3,2
    3b88:	00048613          	mv	a2,s1
    3b8c:	00098513          	mv	a0,s3
    3b90:	03c12223          	sw	t3,36(sp)
    3b94:	03d12023          	sw	t4,32(sp)
    3b98:	00612c23          	sw	t1,24(sp)
    3b9c:	3a8040ef          	jal	7f44 <_dtoa_r>
    3ba0:	02012e83          	lw	t4,32(sp)
    3ba4:	01812303          	lw	t1,24(sp)
    3ba8:	02412e03          	lw	t3,36(sp)
    3bac:	001ef713          	and	a4,t4,1
    3bb0:	00050c13          	mv	s8,a0
    3bb4:	1a0712e3          	bnez	a4,4558 <_vfprintf_r+0x2814>
    3bb8:	09812783          	lw	a5,152(sp)
    3bbc:	07c12a03          	lw	s4,124(sp)
    3bc0:	40a787b3          	sub	a5,a5,a0
    3bc4:	00f12c23          	sw	a5,24(sp)
    3bc8:	ffd00713          	li	a4,-3
    3bcc:	00ea4463          	blt	s4,a4,3bd4 <_vfprintf_r+0x1e90>
    3bd0:	5b435663          	bge	t1,s4,417c <_vfprintf_r+0x2438>
    3bd4:	ffee0e13          	add	t3,t3,-2
    3bd8:	fffa0d13          	add	s10,s4,-1
    3bdc:	07a12e23          	sw	s10,124(sp)
    3be0:	0ffe7693          	zext.b	a3,t3
    3be4:	00000613          	li	a2,0
    3be8:	08d10423          	sb	a3,136(sp)
    3bec:	02b00693          	li	a3,43
    3bf0:	000d5863          	bgez	s10,3c00 <_vfprintf_r+0x1ebc>
    3bf4:	00100713          	li	a4,1
    3bf8:	41470d33          	sub	s10,a4,s4
    3bfc:	02d00693          	li	a3,45
    3c00:	08d104a3          	sb	a3,137(sp)
    3c04:	00900693          	li	a3,9
    3c08:	33a6d8e3          	bge	a3,s10,4738 <_vfprintf_r+0x29f4>
    3c0c:	000c0793          	mv	a5,s8
    3c10:	09f10493          	add	s1,sp,159
    3c14:	03212023          	sw	s2,32(sp)
    3c18:	00040c13          	mv	s8,s0
    3c1c:	06300a13          	li	s4,99
    3c20:	000d0413          	mv	s0,s10
    3c24:	03d12223          	sw	t4,36(sp)
    3c28:	05c12023          	sw	t3,64(sp)
    3c2c:	00048913          	mv	s2,s1
    3c30:	00098c93          	mv	s9,s3
    3c34:	00078d13          	mv	s10,a5
    3c38:	00a00593          	li	a1,10
    3c3c:	00040513          	mv	a0,s0
    3c40:	09c0b0ef          	jal	ecdc <__modsi3>
    3c44:	03050713          	add	a4,a0,48
    3c48:	00090b13          	mv	s6,s2
    3c4c:	00040513          	mv	a0,s0
    3c50:	feeb0fa3          	sb	a4,-1(s6)
    3c54:	00a00593          	li	a1,10
    3c58:	00040993          	mv	s3,s0
    3c5c:	7fd0a0ef          	jal	ec58 <__divsi3>
    3c60:	fff90913          	add	s2,s2,-1
    3c64:	00050413          	mv	s0,a0
    3c68:	fd3a48e3          	blt	s4,s3,3c38 <_vfprintf_r+0x1ef4>
    3c6c:	000c8993          	mv	s3,s9
    3c70:	03050713          	add	a4,a0,48
    3c74:	00090c93          	mv	s9,s2
    3c78:	ffeb0693          	add	a3,s6,-2
    3c7c:	feec8fa3          	sb	a4,-1(s9)
    3c80:	000c0413          	mv	s0,s8
    3c84:	02412e83          	lw	t4,36(sp)
    3c88:	04012e03          	lw	t3,64(sp)
    3c8c:	02012903          	lw	s2,32(sp)
    3c90:	000d0c13          	mv	s8,s10
    3c94:	4c96f6e3          	bgeu	a3,s1,4960 <_vfprintf_r+0x2c1c>
    3c98:	08a10713          	add	a4,sp,138
    3c9c:	0006c783          	lbu	a5,0(a3)
    3ca0:	00168693          	add	a3,a3,1
    3ca4:	00170713          	add	a4,a4,1
    3ca8:	fef70fa3          	sb	a5,-1(a4)
    3cac:	fe9698e3          	bne	a3,s1,3c9c <_vfprintf_r+0x1f58>
    3cb0:	15010793          	add	a5,sp,336
    3cb4:	41678633          	sub	a2,a5,s6
    3cb8:	f5360793          	add	a5,a2,-173
    3cbc:	04f12023          	sw	a5,64(sp)
    3cc0:	01812783          	lw	a5,24(sp)
    3cc4:	04012683          	lw	a3,64(sp)
    3cc8:	00100713          	li	a4,1
    3ccc:	00d78d33          	add	s10,a5,a3
    3cd0:	28f75ce3          	bge	a4,a5,4768 <_vfprintf_r+0x2a24>
    3cd4:	03012783          	lw	a5,48(sp)
    3cd8:	00fd0d33          	add	s10,s10,a5
    3cdc:	fffd4813          	not	a6,s10
    3ce0:	bffeff13          	and	t5,t4,-1025
    3ce4:	41f85813          	sra	a6,a6,0x1f
    3ce8:	100f6e93          	or	t4,t5,256
    3cec:	010d7cb3          	and	s9,s10,a6
    3cf0:	02012223          	sw	zero,36(sp)
    3cf4:	02012023          	sw	zero,32(sp)
    3cf8:	00000a13          	li	s4,0
    3cfc:	04412783          	lw	a5,68(sp)
    3d00:	46079263          	bnez	a5,4164 <_vfprintf_r+0x2420>
    3d04:	07714603          	lbu	a2,119(sp)
    3d08:	00000313          	li	t1,0
    3d0c:	00061463          	bnez	a2,3d14 <_vfprintf_r+0x1fd0>
    3d10:	a74fe06f          	j	1f84 <_vfprintf_r+0x240>
    3d14:	e90fe06f          	j	23a4 <_vfprintf_r+0x660>
    3d18:	00812583          	lw	a1,8(sp)
    3d1c:	0a010613          	add	a2,sp,160
    3d20:	00098513          	mv	a0,s3
    3d24:	03d12023          	sw	t4,32(sp)
    3d28:	6d9000ef          	jal	4c00 <__sprint_r>
    3d2c:	00050463          	beqz	a0,3d34 <_vfprintf_r+0x1ff0>
    3d30:	ce4fe06f          	j	2214 <_vfprintf_r+0x4d0>
    3d34:	07c12683          	lw	a3,124(sp)
    3d38:	0a812483          	lw	s1,168(sp)
    3d3c:	02012e83          	lw	t4,32(sp)
    3d40:	0ac10413          	add	s0,sp,172
    3d44:	ce0ff06f          	j	3224 <_vfprintf_r+0x14e0>
    3d48:	00600c93          	li	s9,6
    3d4c:	f14ff06f          	j	3460 <_vfprintf_r+0x171c>
    3d50:	0ffd7d13          	zext.b	s10,s10
    3d54:	00000c93          	li	s9,0
    3d58:	bd5fe06f          	j	292c <_vfprintf_r+0xbe8>
    3d5c:	0ffd7d13          	zext.b	s10,s10
    3d60:	00000c93          	li	s9,0
    3d64:	e48ff06f          	j	33ac <_vfprintf_r+0x1668>
    3d68:	018d1d13          	sll	s10,s10,0x18
    3d6c:	418d5d13          	sra	s10,s10,0x18
    3d70:	41fd5c93          	sra	s9,s10,0x1f
    3d74:	000c8793          	mv	a5,s9
    3d78:	b39fe06f          	j	28b0 <_vfprintf_r+0xb6c>
    3d7c:	01412783          	lw	a5,20(sp)
    3d80:	00c12703          	lw	a4,12(sp)
    3d84:	0007a783          	lw	a5,0(a5)
    3d88:	00e79023          	sh	a4,0(a5)
    3d8c:	c21fe06f          	j	29ac <_vfprintf_r+0xc68>
    3d90:	000c0513          	mv	a0,s8
    3d94:	05d12223          	sw	t4,68(sp)
    3d98:	ad8fd0ef          	jal	1070 <strlen>
    3d9c:	07714603          	lbu	a2,119(sp)
    3da0:	fff54813          	not	a6,a0
    3da4:	41f85813          	sra	a6,a6,0x1f
    3da8:	01612a23          	sw	s6,20(sp)
    3dac:	02012223          	sw	zero,36(sp)
    3db0:	02012023          	sw	zero,32(sp)
    3db4:	00012823          	sw	zero,16(sp)
    3db8:	04412e83          	lw	t4,68(sp)
    3dbc:	00050d13          	mv	s10,a0
    3dc0:	01057cb3          	and	s9,a0,a6
    3dc4:	00000313          	li	t1,0
    3dc8:	07300e13          	li	t3,115
    3dcc:	00061463          	bnez	a2,3dd4 <_vfprintf_r+0x2090>
    3dd0:	9b4fe06f          	j	1f84 <_vfprintf_r+0x240>
    3dd4:	dd0fe06f          	j	23a4 <_vfprintf_r+0x660>
    3dd8:	00812583          	lw	a1,8(sp)
    3ddc:	0a010613          	add	a2,sp,160
    3de0:	00098513          	mv	a0,s3
    3de4:	61d000ef          	jal	4c00 <__sprint_r>
    3de8:	00051463          	bnez	a0,3df0 <_vfprintf_r+0x20ac>
    3dec:	be8fe06f          	j	21d4 <_vfprintf_r+0x490>
    3df0:	c38fe06f          	j	2228 <_vfprintf_r+0x4e4>
    3df4:	00812583          	lw	a1,8(sp)
    3df8:	0a010613          	add	a2,sp,160
    3dfc:	00098513          	mv	a0,s3
    3e00:	03d12023          	sw	t4,32(sp)
    3e04:	5fd000ef          	jal	4c00 <__sprint_r>
    3e08:	00050463          	beqz	a0,3e10 <_vfprintf_r+0x20cc>
    3e0c:	c08fe06f          	j	2214 <_vfprintf_r+0x4d0>
    3e10:	07c12683          	lw	a3,124(sp)
    3e14:	0a812483          	lw	s1,168(sp)
    3e18:	0a412703          	lw	a4,164(sp)
    3e1c:	02012e83          	lw	t4,32(sp)
    3e20:	0ac10413          	add	s0,sp,172
    3e24:	c2dff06f          	j	3a50 <_vfprintf_r+0x1d0c>
    3e28:	05862503          	lw	a0,88(a2)
    3e2c:	00f12623          	sw	a5,12(sp)
    3e30:	fbdfc0ef          	jal	dec <__retarget_lock_release_recursive>
    3e34:	00c12783          	lw	a5,12(sp)
    3e38:	ab8fe06f          	j	20f0 <_vfprintf_r+0x3ac>
    3e3c:	00130a13          	add	s4,t1,1
    3e40:	00200693          	li	a3,2
    3e44:	02812703          	lw	a4,40(sp)
    3e48:	09810893          	add	a7,sp,152
    3e4c:	08410813          	add	a6,sp,132
    3e50:	00070513          	mv	a0,a4
    3e54:	00050593          	mv	a1,a0
    3e58:	000a0713          	mv	a4,s4
    3e5c:	07c10793          	add	a5,sp,124
    3e60:	00048613          	mv	a2,s1
    3e64:	00098513          	mv	a0,s3
    3e68:	02612223          	sw	t1,36(sp)
    3e6c:	03c12023          	sw	t3,32(sp)
    3e70:	01d12c23          	sw	t4,24(sp)
    3e74:	0d0040ef          	jal	7f44 <_dtoa_r>
    3e78:	02012e03          	lw	t3,32(sp)
    3e7c:	04600693          	li	a3,70
    3e80:	01812e83          	lw	t4,24(sp)
    3e84:	fdfe7d13          	and	s10,t3,-33
    3e88:	02412303          	lw	t1,36(sp)
    3e8c:	00050c13          	mv	s8,a0
    3e90:	01450733          	add	a4,a0,s4
    3e94:	34dd14e3          	bne	s10,a3,49dc <_vfprintf_r+0x2c98>
    3e98:	000c4603          	lbu	a2,0(s8)
    3e9c:	03000693          	li	a3,48
    3ea0:	6cd60263          	beq	a2,a3,4564 <_vfprintf_r+0x2820>
    3ea4:	07c12683          	lw	a3,124(sp)
    3ea8:	00d70733          	add	a4,a4,a3
    3eac:	02812683          	lw	a3,40(sp)
    3eb0:	00048593          	mv	a1,s1
    3eb4:	00000613          	li	a2,0
    3eb8:	00068513          	mv	a0,a3
    3ebc:	00000693          	li	a3,0
    3ec0:	04e12823          	sw	a4,80(sp)
    3ec4:	02612223          	sw	t1,36(sp)
    3ec8:	03c12023          	sw	t3,32(sp)
    3ecc:	01d12c23          	sw	t4,24(sp)
    3ed0:	370090ef          	jal	d240 <__eqdf2>
    3ed4:	01812e83          	lw	t4,24(sp)
    3ed8:	02012e03          	lw	t3,32(sp)
    3edc:	02412303          	lw	t1,36(sp)
    3ee0:	05012703          	lw	a4,80(sp)
    3ee4:	62050863          	beqz	a0,4514 <_vfprintf_r+0x27d0>
    3ee8:	09812783          	lw	a5,152(sp)
    3eec:	00e7fe63          	bgeu	a5,a4,3f08 <_vfprintf_r+0x21c4>
    3ef0:	03000613          	li	a2,48
    3ef4:	00178693          	add	a3,a5,1
    3ef8:	08d12c23          	sw	a3,152(sp)
    3efc:	00c78023          	sb	a2,0(a5)
    3f00:	09812783          	lw	a5,152(sp)
    3f04:	fee7e8e3          	bltu	a5,a4,3ef4 <_vfprintf_r+0x21b0>
    3f08:	07c12a03          	lw	s4,124(sp)
    3f0c:	418787b3          	sub	a5,a5,s8
    3f10:	04700713          	li	a4,71
    3f14:	00f12c23          	sw	a5,24(sp)
    3f18:	caed08e3          	beq	s10,a4,3bc8 <_vfprintf_r+0x1e84>
    3f1c:	04600713          	li	a4,70
    3f20:	68ed0863          	beq	s10,a4,45b0 <_vfprintf_r+0x286c>
    3f24:	fffa0d13          	add	s10,s4,-1
    3f28:	cb5ff06f          	j	3bdc <_vfprintf_r+0x1e98>
    3f2c:	02812703          	lw	a4,40(sp)
    3f30:	07c10613          	add	a2,sp,124
    3f34:	00048593          	mv	a1,s1
    3f38:	00070513          	mv	a0,a4
    3f3c:	02612223          	sw	t1,36(sp)
    3f40:	03c12023          	sw	t3,32(sp)
    3f44:	01d12c23          	sw	t4,24(sp)
    3f48:	4e9030ef          	jal	7c30 <frexp>
    3f4c:	7fffc717          	auipc	a4,0x7fffc
    3f50:	75c70713          	add	a4,a4,1884 # 800006a8 <__global_locale+0x174>
    3f54:	00072603          	lw	a2,0(a4)
    3f58:	00472683          	lw	a3,4(a4)
    3f5c:	578090ef          	jal	d4d4 <__muldf3>
    3f60:	00000613          	li	a2,0
    3f64:	00000693          	li	a3,0
    3f68:	00050a13          	mv	s4,a0
    3f6c:	00058d13          	mv	s10,a1
    3f70:	2d0090ef          	jal	d240 <__eqdf2>
    3f74:	01812e83          	lw	t4,24(sp)
    3f78:	02012e03          	lw	t3,32(sp)
    3f7c:	02412303          	lw	t1,36(sp)
    3f80:	00051663          	bnez	a0,3f8c <_vfprintf_r+0x2248>
    3f84:	00100713          	li	a4,1
    3f88:	06e12e23          	sw	a4,124(sp)
    3f8c:	0000b797          	auipc	a5,0xb
    3f90:	fc078793          	add	a5,a5,-64 # ef4c <__fini_array_end+0x1b8>
    3f94:	06100713          	li	a4,97
    3f98:	02f12023          	sw	a5,32(sp)
    3f9c:	00ee1863          	bne	t3,a4,3fac <_vfprintf_r+0x2268>
    3fa0:	0000b797          	auipc	a5,0xb
    3fa4:	f9878793          	add	a5,a5,-104 # ef38 <__fini_array_end+0x1a4>
    3fa8:	02f12023          	sw	a5,32(sp)
    3fac:	7fffc717          	auipc	a4,0x7fffc
    3fb0:	70470713          	add	a4,a4,1796 # 800006b0 <__global_locale+0x17c>
    3fb4:	00072783          	lw	a5,0(a4)
    3fb8:	00472803          	lw	a6,4(a4)
    3fbc:	000c0493          	mv	s1,s8
    3fc0:	00f12c23          	sw	a5,24(sp)
    3fc4:	000d0793          	mv	a5,s10
    3fc8:	03212223          	sw	s2,36(sp)
    3fcc:	000c0d13          	mv	s10,s8
    3fd0:	02012903          	lw	s2,32(sp)
    3fd4:	00098c13          	mv	s8,s3
    3fd8:	01012e23          	sw	a6,28(sp)
    3fdc:	fff30b13          	add	s6,t1,-1
    3fe0:	fff00c93          	li	s9,-1
    3fe4:	05d12023          	sw	t4,64(sp)
    3fe8:	05c12823          	sw	t3,80(sp)
    3fec:	04812a23          	sw	s0,84(sp)
    3ff0:	00078993          	mv	s3,a5
    3ff4:	01c0006f          	j	4010 <_vfprintf_r+0x22cc>
    3ff8:	00000613          	li	a2,0
    3ffc:	00000693          	li	a3,0
    4000:	fffb0413          	add	s0,s6,-1
    4004:	23c090ef          	jal	d240 <__eqdf2>
    4008:	0a0504e3          	beqz	a0,48b0 <_vfprintf_r+0x2b6c>
    400c:	00040b13          	mv	s6,s0
    4010:	01812603          	lw	a2,24(sp)
    4014:	01c12683          	lw	a3,28(sp)
    4018:	000a0513          	mv	a0,s4
    401c:	00098593          	mv	a1,s3
    4020:	4b4090ef          	jal	d4d4 <__muldf3>
    4024:	00058a13          	mv	s4,a1
    4028:	00050993          	mv	s3,a0
    402c:	5940a0ef          	jal	e5c0 <__fixdfsi>
    4030:	00050413          	mv	s0,a0
    4034:	6100a0ef          	jal	e644 <__floatsidf>
    4038:	00050613          	mv	a2,a0
    403c:	00058693          	mv	a3,a1
    4040:	00098513          	mv	a0,s3
    4044:	000a0593          	mv	a1,s4
    4048:	41d090ef          	jal	dc64 <__subdf3>
    404c:	00890733          	add	a4,s2,s0
    4050:	00074703          	lbu	a4,0(a4)
    4054:	00048813          	mv	a6,s1
    4058:	00050a13          	mv	s4,a0
    405c:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    4060:	00058993          	mv	s3,a1
    4064:	00148493          	add	s1,s1,1
    4068:	f99b18e3          	bne	s6,s9,3ff8 <_vfprintf_r+0x22b4>
    406c:	7fffc697          	auipc	a3,0x7fffc
    4070:	64c68693          	add	a3,a3,1612 # 800006b8 <__global_locale+0x184>
    4074:	0006a303          	lw	t1,0(a3)
    4078:	0046a383          	lw	t2,4(a3)
    407c:	05012e03          	lw	t3,80(sp)
    4080:	00030613          	mv	a2,t1
    4084:	00038693          	mv	a3,t2
    4088:	01012c23          	sw	a6,24(sp)
    408c:	02412903          	lw	s2,36(sp)
    4090:	000c0993          	mv	s3,s8
    4094:	03c12223          	sw	t3,36(sp)
    4098:	000d0c13          	mv	s8,s10
    409c:	00058d13          	mv	s10,a1
    40a0:	22c090ef          	jal	d2cc <__gedf2>
    40a4:	7fffc797          	auipc	a5,0x7fffc
    40a8:	61478793          	add	a5,a5,1556 # 800006b8 <__global_locale+0x184>
    40ac:	00040b13          	mv	s6,s0
    40b0:	0007a303          	lw	t1,0(a5)
    40b4:	05412403          	lw	s0,84(sp)
    40b8:	0047a383          	lw	t2,4(a5)
    40bc:	01812803          	lw	a6,24(sp)
    40c0:	02412e03          	lw	t3,36(sp)
    40c4:	04012e83          	lw	t4,64(sp)
    40c8:	0aa05ce3          	blez	a0,4980 <_vfprintf_r+0x2c3c>
    40cc:	02012783          	lw	a5,32(sp)
    40d0:	09012c23          	sw	a6,152(sp)
    40d4:	fff4c603          	lbu	a2,-1(s1)
    40d8:	00f7c583          	lbu	a1,15(a5)
    40dc:	00048693          	mv	a3,s1
    40e0:	02b61063          	bne	a2,a1,4100 <_vfprintf_r+0x23bc>
    40e4:	03000513          	li	a0,48
    40e8:	fea68fa3          	sb	a0,-1(a3)
    40ec:	09812683          	lw	a3,152(sp)
    40f0:	fff68793          	add	a5,a3,-1
    40f4:	08f12c23          	sw	a5,152(sp)
    40f8:	fff6c603          	lbu	a2,-1(a3)
    40fc:	feb606e3          	beq	a2,a1,40e8 <_vfprintf_r+0x23a4>
    4100:	00160593          	add	a1,a2,1
    4104:	03900513          	li	a0,57
    4108:	0ff5f593          	zext.b	a1,a1
    410c:	04a60463          	beq	a2,a0,4154 <_vfprintf_r+0x2410>
    4110:	feb68fa3          	sb	a1,-1(a3)
    4114:	00048793          	mv	a5,s1
    4118:	07c12a03          	lw	s4,124(sp)
    411c:	418787b3          	sub	a5,a5,s8
    4120:	06100613          	li	a2,97
    4124:	fffa0d13          	add	s10,s4,-1
    4128:	00f12c23          	sw	a5,24(sp)
    412c:	07a12e23          	sw	s10,124(sp)
    4130:	07000693          	li	a3,112
    4134:	00ce0663          	beq	t3,a2,4140 <_vfprintf_r+0x23fc>
    4138:	05000693          	li	a3,80
    413c:	04100e13          	li	t3,65
    4140:	00100613          	li	a2,1
    4144:	aa5ff06f          	j	3be8 <_vfprintf_r+0x1ea4>
    4148:	00030a13          	mv	s4,t1
    414c:	00300693          	li	a3,3
    4150:	cf5ff06f          	j	3e44 <_vfprintf_r+0x2100>
    4154:	02012783          	lw	a5,32(sp)
    4158:	00a7c583          	lbu	a1,10(a5)
    415c:	feb68fa3          	sb	a1,-1(a3)
    4160:	fb5ff06f          	j	4114 <_vfprintf_r+0x23d0>
    4164:	02d00713          	li	a4,45
    4168:	06e10ba3          	sb	a4,119(sp)
    416c:	02d00613          	li	a2,45
    4170:	00000313          	li	t1,0
    4174:	001c8c93          	add	s9,s9,1
    4178:	e0dfd06f          	j	1f84 <_vfprintf_r+0x240>
    417c:	01812783          	lw	a5,24(sp)
    4180:	46fa4063          	blt	s4,a5,45e0 <_vfprintf_r+0x289c>
    4184:	001ef713          	and	a4,t4,1
    4188:	000a0d13          	mv	s10,s4
    418c:	00070663          	beqz	a4,4198 <_vfprintf_r+0x2454>
    4190:	03012783          	lw	a5,48(sp)
    4194:	00fa0d33          	add	s10,s4,a5
    4198:	400eff13          	and	t5,t4,1024
    419c:	000f0463          	beqz	t5,41a4 <_vfprintf_r+0x2460>
    41a0:	5f404e63          	bgtz	s4,479c <_vfprintf_r+0x2a58>
    41a4:	fffd4813          	not	a6,s10
    41a8:	41f85813          	sra	a6,a6,0x1f
    41ac:	010d7cb3          	and	s9,s10,a6
    41b0:	06700e13          	li	t3,103
    41b4:	000b0e93          	mv	t4,s6
    41b8:	02012223          	sw	zero,36(sp)
    41bc:	02012023          	sw	zero,32(sp)
    41c0:	b3dff06f          	j	3cfc <_vfprintf_r+0x1fb8>
    41c4:	02d00793          	li	a5,45
    41c8:	06f10ba3          	sb	a5,119(sp)
    41cc:	02d00613          	li	a2,45
    41d0:	998fe06f          	j	2368 <_vfprintf_r+0x624>
    41d4:	01812783          	lw	a5,24(sp)
    41d8:	02012a03          	lw	s4,32(sp)
    41dc:	05212823          	sw	s2,80(sp)
    41e0:	00fc07b3          	add	a5,s8,a5
    41e4:	05712c23          	sw	s7,88(sp)
    41e8:	05912e23          	sw	s9,92(sp)
    41ec:	00040713          	mv	a4,s0
    41f0:	04f12223          	sw	a5,68(sp)
    41f4:	02412403          	lw	s0,36(sp)
    41f8:	05d12a23          	sw	t4,84(sp)
    41fc:	03812223          	sw	s8,36(sp)
    4200:	03c12b83          	lw	s7,60(sp)
    4204:	04c12c83          	lw	s9,76(sp)
    4208:	00812903          	lw	s2,8(sp)
    420c:	00700693          	li	a3,7
    4210:	01000d13          	li	s10,16
    4214:	0000bb17          	auipc	s6,0xb
    4218:	20cb0b13          	add	s6,s6,524 # f420 <zeroes.0>
    421c:	00048613          	mv	a2,s1
    4220:	00030c13          	mv	s8,t1
    4224:	09405863          	blez	s4,42b4 <_vfprintf_r+0x2570>
    4228:	16805e63          	blez	s0,43a4 <_vfprintf_r+0x2660>
    422c:	fff40413          	add	s0,s0,-1
    4230:	04812783          	lw	a5,72(sp)
    4234:	01960633          	add	a2,a2,s9
    4238:	01972223          	sw	s9,4(a4)
    423c:	00f72023          	sw	a5,0(a4)
    4240:	0a412783          	lw	a5,164(sp)
    4244:	0ac12423          	sw	a2,168(sp)
    4248:	00870713          	add	a4,a4,8
    424c:	00178793          	add	a5,a5,1
    4250:	0af12223          	sw	a5,164(sp)
    4254:	14f6ce63          	blt	a3,a5,43b0 <_vfprintf_r+0x266c>
    4258:	04412783          	lw	a5,68(sp)
    425c:	000bc583          	lbu	a1,0(s7)
    4260:	418784b3          	sub	s1,a5,s8
    4264:	0095d463          	bge	a1,s1,426c <_vfprintf_r+0x2528>
    4268:	00058493          	mv	s1,a1
    426c:	02905663          	blez	s1,4298 <_vfprintf_r+0x2554>
    4270:	0a412583          	lw	a1,164(sp)
    4274:	00960633          	add	a2,a2,s1
    4278:	01872023          	sw	s8,0(a4)
    427c:	00158593          	add	a1,a1,1
    4280:	00972223          	sw	s1,4(a4)
    4284:	0ac12423          	sw	a2,168(sp)
    4288:	0ab12223          	sw	a1,164(sp)
    428c:	14b6c663          	blt	a3,a1,43d8 <_vfprintf_r+0x2694>
    4290:	000bc583          	lbu	a1,0(s7)
    4294:	00870713          	add	a4,a4,8
    4298:	fff4c513          	not	a0,s1
    429c:	41f55513          	sra	a0,a0,0x1f
    42a0:	00a4f7b3          	and	a5,s1,a0
    42a4:	40f584b3          	sub	s1,a1,a5
    42a8:	04904663          	bgtz	s1,42f4 <_vfprintf_r+0x25b0>
    42ac:	00bc0c33          	add	s8,s8,a1
    42b0:	f7404ce3          	bgtz	s4,4228 <_vfprintf_r+0x24e4>
    42b4:	f6804ce3          	bgtz	s0,422c <_vfprintf_r+0x24e8>
    42b8:	01812783          	lw	a5,24(sp)
    42bc:	000c0313          	mv	t1,s8
    42c0:	02412c03          	lw	s8,36(sp)
    42c4:	03712e23          	sw	s7,60(sp)
    42c8:	00070413          	mv	s0,a4
    42cc:	00fc0733          	add	a4,s8,a5
    42d0:	05012903          	lw	s2,80(sp)
    42d4:	05412e83          	lw	t4,84(sp)
    42d8:	05812b83          	lw	s7,88(sp)
    42dc:	05c12c83          	lw	s9,92(sp)
    42e0:	00060493          	mv	s1,a2
    42e4:	00676463          	bltu	a4,t1,42ec <_vfprintf_r+0x25a8>
    42e8:	c59fe06f          	j	2f40 <_vfprintf_r+0x11fc>
    42ec:	00070313          	mv	t1,a4
    42f0:	c51fe06f          	j	2f40 <_vfprintf_r+0x11fc>
    42f4:	0a412583          	lw	a1,164(sp)
    42f8:	0000be97          	auipc	t4,0xb
    42fc:	128e8e93          	add	t4,t4,296 # f420 <zeroes.0>
    4300:	069d5c63          	bge	s10,s1,4378 <_vfprintf_r+0x2634>
    4304:	02812023          	sw	s0,32(sp)
    4308:	00048413          	mv	s0,s1
    430c:	000b0493          	mv	s1,s6
    4310:	00c0006f          	j	431c <_vfprintf_r+0x25d8>
    4314:	ff040413          	add	s0,s0,-16
    4318:	048d5a63          	bge	s10,s0,436c <_vfprintf_r+0x2628>
    431c:	01060613          	add	a2,a2,16
    4320:	00158593          	add	a1,a1,1
    4324:	01672023          	sw	s6,0(a4)
    4328:	01a72223          	sw	s10,4(a4)
    432c:	0ac12423          	sw	a2,168(sp)
    4330:	0ab12223          	sw	a1,164(sp)
    4334:	00870713          	add	a4,a4,8
    4338:	fcb6dee3          	bge	a3,a1,4314 <_vfprintf_r+0x25d0>
    433c:	0a010613          	add	a2,sp,160
    4340:	00090593          	mv	a1,s2
    4344:	00098513          	mv	a0,s3
    4348:	0b9000ef          	jal	4c00 <__sprint_r>
    434c:	00050463          	beqz	a0,4354 <_vfprintf_r+0x2610>
    4350:	ec5fd06f          	j	2214 <_vfprintf_r+0x4d0>
    4354:	ff040413          	add	s0,s0,-16
    4358:	0a812603          	lw	a2,168(sp)
    435c:	0a412583          	lw	a1,164(sp)
    4360:	0ac10713          	add	a4,sp,172
    4364:	00700693          	li	a3,7
    4368:	fa8d4ae3          	blt	s10,s0,431c <_vfprintf_r+0x25d8>
    436c:	00048e93          	mv	t4,s1
    4370:	00040493          	mv	s1,s0
    4374:	02012403          	lw	s0,32(sp)
    4378:	00960633          	add	a2,a2,s1
    437c:	00158593          	add	a1,a1,1
    4380:	01d72023          	sw	t4,0(a4)
    4384:	00972223          	sw	s1,4(a4)
    4388:	0ac12423          	sw	a2,168(sp)
    438c:	0ab12223          	sw	a1,164(sp)
    4390:	10b6ce63          	blt	a3,a1,44ac <_vfprintf_r+0x2768>
    4394:	000bc583          	lbu	a1,0(s7)
    4398:	00870713          	add	a4,a4,8
    439c:	00bc0c33          	add	s8,s8,a1
    43a0:	f11ff06f          	j	42b0 <_vfprintf_r+0x256c>
    43a4:	fffb8b93          	add	s7,s7,-1
    43a8:	fffa0a13          	add	s4,s4,-1
    43ac:	e85ff06f          	j	4230 <_vfprintf_r+0x24ec>
    43b0:	0a010613          	add	a2,sp,160
    43b4:	00090593          	mv	a1,s2
    43b8:	00098513          	mv	a0,s3
    43bc:	045000ef          	jal	4c00 <__sprint_r>
    43c0:	00050463          	beqz	a0,43c8 <_vfprintf_r+0x2684>
    43c4:	e51fd06f          	j	2214 <_vfprintf_r+0x4d0>
    43c8:	0a812603          	lw	a2,168(sp)
    43cc:	0ac10713          	add	a4,sp,172
    43d0:	00700693          	li	a3,7
    43d4:	e85ff06f          	j	4258 <_vfprintf_r+0x2514>
    43d8:	0a010613          	add	a2,sp,160
    43dc:	00090593          	mv	a1,s2
    43e0:	00098513          	mv	a0,s3
    43e4:	01d000ef          	jal	4c00 <__sprint_r>
    43e8:	00050463          	beqz	a0,43f0 <_vfprintf_r+0x26ac>
    43ec:	e29fd06f          	j	2214 <_vfprintf_r+0x4d0>
    43f0:	000bc583          	lbu	a1,0(s7)
    43f4:	0a812603          	lw	a2,168(sp)
    43f8:	0ac10713          	add	a4,sp,172
    43fc:	00700693          	li	a3,7
    4400:	e99ff06f          	j	4298 <_vfprintf_r+0x2554>
    4404:	04c12783          	lw	a5,76(sp)
    4408:	04812583          	lw	a1,72(sp)
    440c:	00000913          	li	s2,0
    4410:	40fc0c33          	sub	s8,s8,a5
    4414:	00078613          	mv	a2,a5
    4418:	000c0513          	mv	a0,s8
    441c:	468030ef          	jal	7884 <strncpy>
    4420:	00144783          	lbu	a5,1(s0)
    4424:	00a00613          	li	a2,10
    4428:	00000693          	li	a3,0
    442c:	00f037b3          	snez	a5,a5
    4430:	000d0513          	mv	a0,s10
    4434:	000c8593          	mv	a1,s9
    4438:	00f40433          	add	s0,s0,a5
    443c:	78d060ef          	jal	b3c8 <__udivdi3>
    4440:	a10ff06f          	j	3650 <_vfprintf_r+0x190c>
    4444:	09810713          	add	a4,sp,152
    4448:	00000693          	li	a3,0
    444c:	08410613          	add	a2,sp,132
    4450:	00000593          	li	a1,0
    4454:	00098513          	mv	a0,s3
    4458:	01c12a23          	sw	t3,20(sp)
    445c:	01d12823          	sw	t4,16(sp)
    4460:	618060ef          	jal	aa78 <_wcsrtombs_r>
    4464:	fff00713          	li	a4,-1
    4468:	01012e83          	lw	t4,16(sp)
    446c:	01412e03          	lw	t3,20(sp)
    4470:	00050d13          	mv	s10,a0
    4474:	30e50063          	beq	a0,a4,4774 <_vfprintf_r+0x2a30>
    4478:	09812223          	sw	s8,132(sp)
    447c:	cacff06f          	j	3928 <_vfprintf_r+0x1be4>
    4480:	07714603          	lbu	a2,119(sp)
    4484:	01612a23          	sw	s6,20(sp)
    4488:	02012223          	sw	zero,36(sp)
    448c:	02012023          	sw	zero,32(sp)
    4490:	00012823          	sw	zero,16(sp)
    4494:	00000c93          	li	s9,0
    4498:	00000313          	li	t1,0
    449c:	00000a13          	li	s4,0
    44a0:	00061463          	bnez	a2,44a8 <_vfprintf_r+0x2764>
    44a4:	ae1fd06f          	j	1f84 <_vfprintf_r+0x240>
    44a8:	efdfd06f          	j	23a4 <_vfprintf_r+0x660>
    44ac:	0a010613          	add	a2,sp,160
    44b0:	00090593          	mv	a1,s2
    44b4:	00098513          	mv	a0,s3
    44b8:	748000ef          	jal	4c00 <__sprint_r>
    44bc:	00050463          	beqz	a0,44c4 <_vfprintf_r+0x2780>
    44c0:	d55fd06f          	j	2214 <_vfprintf_r+0x4d0>
    44c4:	000bc583          	lbu	a1,0(s7)
    44c8:	0a812603          	lw	a2,168(sp)
    44cc:	0ac10713          	add	a4,sp,172
    44d0:	00700693          	li	a3,7
    44d4:	00bc0c33          	add	s8,s8,a1
    44d8:	dd9ff06f          	j	42b0 <_vfprintf_r+0x256c>
    44dc:	00812583          	lw	a1,8(sp)
    44e0:	0a010613          	add	a2,sp,160
    44e4:	00098513          	mv	a0,s3
    44e8:	05d12223          	sw	t4,68(sp)
    44ec:	714000ef          	jal	4c00 <__sprint_r>
    44f0:	00050463          	beqz	a0,44f8 <_vfprintf_r+0x27b4>
    44f4:	d21fd06f          	j	2214 <_vfprintf_r+0x4d0>
    44f8:	0a812483          	lw	s1,168(sp)
    44fc:	04412e83          	lw	t4,68(sp)
    4500:	0ac10413          	add	s0,sp,172
    4504:	a19fe06f          	j	2f1c <_vfprintf_r+0x11d8>
    4508:	00900793          	li	a5,9
    450c:	95a7e263          	bltu	a5,s10,3650 <_vfprintf_r+0x190c>
    4510:	98cff06f          	j	369c <_vfprintf_r+0x1958>
    4514:	07c12a03          	lw	s4,124(sp)
    4518:	00070793          	mv	a5,a4
    451c:	9f1ff06f          	j	3f0c <_vfprintf_r+0x21c8>
    4520:	00812583          	lw	a1,8(sp)
    4524:	0a010613          	add	a2,sp,160
    4528:	00098513          	mv	a0,s3
    452c:	03d12023          	sw	t4,32(sp)
    4530:	6d0000ef          	jal	4c00 <__sprint_r>
    4534:	00050463          	beqz	a0,453c <_vfprintf_r+0x27f8>
    4538:	cddfd06f          	j	2214 <_vfprintf_r+0x4d0>
    453c:	07c12d03          	lw	s10,124(sp)
    4540:	01812783          	lw	a5,24(sp)
    4544:	0a812483          	lw	s1,168(sp)
    4548:	02012e83          	lw	t4,32(sp)
    454c:	0ac10413          	add	s0,sp,172
    4550:	41a78d33          	sub	s10,a5,s10
    4554:	a49fe06f          	j	2f9c <_vfprintf_r+0x1258>
    4558:	00650733          	add	a4,a0,t1
    455c:	04700d13          	li	s10,71
    4560:	94dff06f          	j	3eac <_vfprintf_r+0x2168>
    4564:	02812603          	lw	a2,40(sp)
    4568:	00048593          	mv	a1,s1
    456c:	00000693          	li	a3,0
    4570:	00060513          	mv	a0,a2
    4574:	00000613          	li	a2,0
    4578:	04e12823          	sw	a4,80(sp)
    457c:	02612223          	sw	t1,36(sp)
    4580:	03c12023          	sw	t3,32(sp)
    4584:	01d12c23          	sw	t4,24(sp)
    4588:	4b9080ef          	jal	d240 <__eqdf2>
    458c:	01812e83          	lw	t4,24(sp)
    4590:	02012e03          	lw	t3,32(sp)
    4594:	02412303          	lw	t1,36(sp)
    4598:	05012703          	lw	a4,80(sp)
    459c:	34051e63          	bnez	a0,48f8 <_vfprintf_r+0x2bb4>
    45a0:	07c12a03          	lw	s4,124(sp)
    45a4:	01470733          	add	a4,a4,s4
    45a8:	418707b3          	sub	a5,a4,s8
    45ac:	00f12c23          	sw	a5,24(sp)
    45b0:	001ef713          	and	a4,t4,1
    45b4:	00676733          	or	a4,a4,t1
    45b8:	37405a63          	blez	s4,492c <_vfprintf_r+0x2be8>
    45bc:	26071263          	bnez	a4,4820 <_vfprintf_r+0x2adc>
    45c0:	000a0d13          	mv	s10,s4
    45c4:	06600e13          	li	t3,102
    45c8:	400eff13          	and	t5,t4,1024
    45cc:	1c0f1a63          	bnez	t5,47a0 <_vfprintf_r+0x2a5c>
    45d0:	fffd4813          	not	a6,s10
    45d4:	41f85813          	sra	a6,a6,0x1f
    45d8:	010d7cb3          	and	s9,s10,a6
    45dc:	bd9ff06f          	j	41b4 <_vfprintf_r+0x2470>
    45e0:	01812783          	lw	a5,24(sp)
    45e4:	03012703          	lw	a4,48(sp)
    45e8:	06700e13          	li	t3,103
    45ec:	00e78d33          	add	s10,a5,a4
    45f0:	fd404ce3          	bgtz	s4,45c8 <_vfprintf_r+0x2884>
    45f4:	414d06b3          	sub	a3,s10,s4
    45f8:	00168d13          	add	s10,a3,1
    45fc:	fffd4813          	not	a6,s10
    4600:	41f85813          	sra	a6,a6,0x1f
    4604:	010d7cb3          	and	s9,s10,a6
    4608:	badff06f          	j	41b4 <_vfprintf_r+0x2470>
    460c:	000e8613          	mv	a2,t4
    4610:	ad8fe06f          	j	28e8 <_vfprintf_r+0xba4>
    4614:	00812783          	lw	a5,8(sp)
    4618:	0647a783          	lw	a5,100(a5)
    461c:	0017f793          	and	a5,a5,1
    4620:	02079063          	bnez	a5,4640 <_vfprintf_r+0x28fc>
    4624:	00812783          	lw	a5,8(sp)
    4628:	00c7d783          	lhu	a5,12(a5)
    462c:	2007f793          	and	a5,a5,512
    4630:	00079863          	bnez	a5,4640 <_vfprintf_r+0x28fc>
    4634:	00812783          	lw	a5,8(sp)
    4638:	0587a503          	lw	a0,88(a5)
    463c:	fb0fc0ef          	jal	dec <__retarget_lock_release_recursive>
    4640:	fff00793          	li	a5,-1
    4644:	00f12623          	sw	a5,12(sp)
    4648:	c2dfd06f          	j	2274 <_vfprintf_r+0x530>
    464c:	ff000613          	li	a2,-16
    4650:	40d00d33          	neg	s10,a3
    4654:	0000b297          	auipc	t0,0xb
    4658:	dcc28293          	add	t0,t0,-564 # f420 <zeroes.0>
    465c:	08c6d463          	bge	a3,a2,46e4 <_vfprintf_r+0x29a0>
    4660:	03212023          	sw	s2,32(sp)
    4664:	01000693          	li	a3,16
    4668:	00700b13          	li	s6,7
    466c:	000e8a13          	mv	s4,t4
    4670:	00028913          	mv	s2,t0
    4674:	00c0006f          	j	4680 <_vfprintf_r+0x293c>
    4678:	ff0d0d13          	add	s10,s10,-16
    467c:	05a6de63          	bge	a3,s10,46d8 <_vfprintf_r+0x2994>
    4680:	01048493          	add	s1,s1,16
    4684:	00170713          	add	a4,a4,1
    4688:	01242023          	sw	s2,0(s0)
    468c:	00d42223          	sw	a3,4(s0)
    4690:	0a912423          	sw	s1,168(sp)
    4694:	0ae12223          	sw	a4,164(sp)
    4698:	00840413          	add	s0,s0,8
    469c:	fceb5ee3          	bge	s6,a4,4678 <_vfprintf_r+0x2934>
    46a0:	00812583          	lw	a1,8(sp)
    46a4:	0a010613          	add	a2,sp,160
    46a8:	00098513          	mv	a0,s3
    46ac:	554000ef          	jal	4c00 <__sprint_r>
    46b0:	00050463          	beqz	a0,46b8 <_vfprintf_r+0x2974>
    46b4:	b61fd06f          	j	2214 <_vfprintf_r+0x4d0>
    46b8:	0a812483          	lw	s1,168(sp)
    46bc:	0a412703          	lw	a4,164(sp)
    46c0:	0ac10413          	add	s0,sp,172
    46c4:	01000693          	li	a3,16
    46c8:	fb1ff06f          	j	4678 <_vfprintf_r+0x2934>
    46cc:	00012823          	sw	zero,16(sp)
    46d0:	0ec10c13          	add	s8,sp,236
    46d4:	a88ff06f          	j	395c <_vfprintf_r+0x1c18>
    46d8:	00090293          	mv	t0,s2
    46dc:	02012903          	lw	s2,32(sp)
    46e0:	000a0e93          	mv	t4,s4
    46e4:	01a484b3          	add	s1,s1,s10
    46e8:	00170713          	add	a4,a4,1
    46ec:	00542023          	sw	t0,0(s0)
    46f0:	01a42223          	sw	s10,4(s0)
    46f4:	0a912423          	sw	s1,168(sp)
    46f8:	0ae12223          	sw	a4,164(sp)
    46fc:	00700693          	li	a3,7
    4700:	00e6c463          	blt	a3,a4,4708 <_vfprintf_r+0x29c4>
    4704:	b65fe06f          	j	3268 <_vfprintf_r+0x1524>
    4708:	00812583          	lw	a1,8(sp)
    470c:	0a010613          	add	a2,sp,160
    4710:	00098513          	mv	a0,s3
    4714:	03d12023          	sw	t4,32(sp)
    4718:	4e8000ef          	jal	4c00 <__sprint_r>
    471c:	00050463          	beqz	a0,4724 <_vfprintf_r+0x29e0>
    4720:	af5fd06f          	j	2214 <_vfprintf_r+0x4d0>
    4724:	0a812483          	lw	s1,168(sp)
    4728:	0a412703          	lw	a4,164(sp)
    472c:	02012e83          	lw	t4,32(sp)
    4730:	0ac10413          	add	s0,sp,172
    4734:	b20ff06f          	j	3a54 <_vfprintf_r+0x1d10>
    4738:	08a10693          	add	a3,sp,138
    473c:	00061863          	bnez	a2,474c <_vfprintf_r+0x2a08>
    4740:	03000693          	li	a3,48
    4744:	08d10523          	sb	a3,138(sp)
    4748:	08b10693          	add	a3,sp,139
    474c:	15010793          	add	a5,sp,336
    4750:	40f68633          	sub	a2,a3,a5
    4754:	030d0713          	add	a4,s10,48
    4758:	0c960793          	add	a5,a2,201
    475c:	00e68023          	sb	a4,0(a3)
    4760:	04f12023          	sw	a5,64(sp)
    4764:	d5cff06f          	j	3cc0 <_vfprintf_r+0x1f7c>
    4768:	001ef713          	and	a4,t4,1
    476c:	d6070863          	beqz	a4,3cdc <_vfprintf_r+0x1f98>
    4770:	d64ff06f          	j	3cd4 <_vfprintf_r+0x1f90>
    4774:	00812783          	lw	a5,8(sp)
    4778:	00000293          	li	t0,0
    477c:	00c79783          	lh	a5,12(a5)
    4780:	0407e793          	or	a5,a5,64
    4784:	00812703          	lw	a4,8(sp)
    4788:	00f71623          	sh	a5,12(a4)
    478c:	a8dfd06f          	j	2218 <_vfprintf_r+0x4d4>
    4790:	00012823          	sw	zero,16(sp)
    4794:	00600313          	li	t1,6
    4798:	ff9fe06f          	j	3790 <_vfprintf_r+0x1a4c>
    479c:	06700e13          	li	t3,103
    47a0:	03c12783          	lw	a5,60(sp)
    47a4:	0ff00613          	li	a2,255
    47a8:	0007c703          	lbu	a4,0(a5)
    47ac:	22c70263          	beq	a4,a2,49d0 <_vfprintf_r+0x2c8c>
    47b0:	00000593          	li	a1,0
    47b4:	00000693          	li	a3,0
    47b8:	01475e63          	bge	a4,s4,47d4 <_vfprintf_r+0x2a90>
    47bc:	40ea0a33          	sub	s4,s4,a4
    47c0:	0017c703          	lbu	a4,1(a5)
    47c4:	04070863          	beqz	a4,4814 <_vfprintf_r+0x2ad0>
    47c8:	00168693          	add	a3,a3,1
    47cc:	00178793          	add	a5,a5,1
    47d0:	fec714e3          	bne	a4,a2,47b8 <_vfprintf_r+0x2a74>
    47d4:	02f12e23          	sw	a5,60(sp)
    47d8:	02d12023          	sw	a3,32(sp)
    47dc:	02b12223          	sw	a1,36(sp)
    47e0:	02012783          	lw	a5,32(sp)
    47e4:	02412703          	lw	a4,36(sp)
    47e8:	04c12583          	lw	a1,76(sp)
    47ec:	05c12823          	sw	t3,80(sp)
    47f0:	00e78533          	add	a0,a5,a4
    47f4:	3a80a0ef          	jal	eb9c <__mulsi3>
    47f8:	01a50d33          	add	s10,a0,s10
    47fc:	fffd4813          	not	a6,s10
    4800:	41f85813          	sra	a6,a6,0x1f
    4804:	05012e03          	lw	t3,80(sp)
    4808:	010d7cb3          	and	s9,s10,a6
    480c:	000b0e93          	mv	t4,s6
    4810:	cecff06f          	j	3cfc <_vfprintf_r+0x1fb8>
    4814:	0007c703          	lbu	a4,0(a5)
    4818:	00158593          	add	a1,a1,1
    481c:	fb5ff06f          	j	47d0 <_vfprintf_r+0x2a8c>
    4820:	03012783          	lw	a5,48(sp)
    4824:	06600e13          	li	t3,102
    4828:	00f306b3          	add	a3,t1,a5
    482c:	01468d33          	add	s10,a3,s4
    4830:	d99ff06f          	j	45c8 <_vfprintf_r+0x2884>
    4834:	02c12783          	lw	a5,44(sp)
    4838:	0a07c863          	bltz	a5,48e8 <_vfprintf_r+0x2ba4>
    483c:	07714603          	lbu	a2,119(sp)
    4840:	04700713          	li	a4,71
    4844:	0000ac17          	auipc	s8,0xa
    4848:	6f0c0c13          	add	s8,s8,1776 # ef34 <__fini_array_end+0x1a0>
    484c:	01c75463          	bge	a4,t3,4854 <_vfprintf_r+0x2b10>
    4850:	b31fd06f          	j	2380 <_vfprintf_r+0x63c>
    4854:	0000ac17          	auipc	s8,0xa
    4858:	6dcc0c13          	add	s8,s8,1756 # ef30 <__fini_array_end+0x19c>
    485c:	b25fd06f          	j	2380 <_vfprintf_r+0x63c>
    4860:	07714603          	lbu	a2,119(sp)
    4864:	01612a23          	sw	s6,20(sp)
    4868:	02012223          	sw	zero,36(sp)
    486c:	02012023          	sw	zero,32(sp)
    4870:	00030c93          	mv	s9,t1
    4874:	00030d13          	mv	s10,t1
    4878:	07300e13          	li	t3,115
    487c:	00000313          	li	t1,0
    4880:	00061463          	bnez	a2,4888 <_vfprintf_r+0x2b44>
    4884:	f00fd06f          	j	1f84 <_vfprintf_r+0x240>
    4888:	b1dfd06f          	j	23a4 <_vfprintf_r+0x660>
    488c:	00040313          	mv	t1,s0
    4890:	01012903          	lw	s2,16(sp)
    4894:	000b0413          	mv	s0,s6
    4898:	01412e03          	lw	t3,20(sp)
    489c:	000c0b13          	mv	s6,s8
    48a0:	000a0e93          	mv	t4,s4
    48a4:	000c8c13          	mv	s8,s9
    48a8:	00030d13          	mv	s10,t1
    48ac:	87cff06f          	j	3928 <_vfprintf_r+0x1be4>
    48b0:	001b0793          	add	a5,s6,1
    48b4:	000c0993          	mv	s3,s8
    48b8:	02412903          	lw	s2,36(sp)
    48bc:	04012e83          	lw	t4,64(sp)
    48c0:	05012e03          	lw	t3,80(sp)
    48c4:	05412403          	lw	s0,84(sp)
    48c8:	000d0c13          	mv	s8,s10
    48cc:	00f487b3          	add	a5,s1,a5
    48d0:	03000693          	li	a3,48
    48d4:	840b40e3          	bltz	s6,4114 <_vfprintf_r+0x23d0>
    48d8:	00148493          	add	s1,s1,1
    48dc:	fed48fa3          	sb	a3,-1(s1)
    48e0:	fe979ce3          	bne	a5,s1,48d8 <_vfprintf_r+0x2b94>
    48e4:	835ff06f          	j	4118 <_vfprintf_r+0x23d4>
    48e8:	02d00793          	li	a5,45
    48ec:	06f10ba3          	sb	a5,119(sp)
    48f0:	02d00613          	li	a2,45
    48f4:	f4dff06f          	j	4840 <_vfprintf_r+0x2afc>
    48f8:	00100693          	li	a3,1
    48fc:	414686b3          	sub	a3,a3,s4
    4900:	06d12e23          	sw	a3,124(sp)
    4904:	da4ff06f          	j	3ea8 <_vfprintf_r+0x2164>
    4908:	01412783          	lw	a5,20(sp)
    490c:	0007ab03          	lw	s6,0(a5)
    4910:	00478793          	add	a5,a5,4
    4914:	000b5463          	bgez	s6,491c <_vfprintf_r+0x2bd8>
    4918:	fff00b13          	li	s6,-1
    491c:	00194e03          	lbu	t3,1(s2)
    4920:	00f12a23          	sw	a5,20(sp)
    4924:	00068913          	mv	s2,a3
    4928:	dccfd06f          	j	1ef4 <_vfprintf_r+0x1b0>
    492c:	00071a63          	bnez	a4,4940 <_vfprintf_r+0x2bfc>
    4930:	00100c93          	li	s9,1
    4934:	06600e13          	li	t3,102
    4938:	00100d13          	li	s10,1
    493c:	879ff06f          	j	41b4 <_vfprintf_r+0x2470>
    4940:	03012783          	lw	a5,48(sp)
    4944:	06600e13          	li	t3,102
    4948:	00178693          	add	a3,a5,1
    494c:	00668d33          	add	s10,a3,t1
    4950:	fffd4813          	not	a6,s10
    4954:	41f85813          	sra	a6,a6,0x1f
    4958:	010d7cb3          	and	s9,s10,a6
    495c:	859ff06f          	j	41b4 <_vfprintf_r+0x2470>
    4960:	00200793          	li	a5,2
    4964:	04f12023          	sw	a5,64(sp)
    4968:	b58ff06f          	j	3cc0 <_vfprintf_r+0x1f7c>
    496c:	00812703          	lw	a4,8(sp)
    4970:	00c71783          	lh	a5,12(a4)
    4974:	0407e793          	or	a5,a5,64
    4978:	00f71623          	sh	a5,12(a4)
    497c:	8b5fd06f          	j	2230 <_vfprintf_r+0x4ec>
    4980:	000a0513          	mv	a0,s4
    4984:	000d0593          	mv	a1,s10
    4988:	00030613          	mv	a2,t1
    498c:	00038693          	mv	a3,t2
    4990:	05012023          	sw	a6,64(sp)
    4994:	03c12223          	sw	t3,36(sp)
    4998:	01d12c23          	sw	t4,24(sp)
    499c:	0a5080ef          	jal	d240 <__eqdf2>
    49a0:	01812e83          	lw	t4,24(sp)
    49a4:	02412e03          	lw	t3,36(sp)
    49a8:	04012803          	lw	a6,64(sp)
    49ac:	f6051463          	bnez	a0,4114 <_vfprintf_r+0x23d0>
    49b0:	001b7693          	and	a3,s6,1
    49b4:	f6068063          	beqz	a3,4114 <_vfprintf_r+0x23d0>
    49b8:	f14ff06f          	j	40cc <_vfprintf_r+0x2388>
    49bc:	00812783          	lw	a5,8(sp)
    49c0:	01012283          	lw	t0,16(sp)
    49c4:	00c79783          	lh	a5,12(a5)
    49c8:	0407e793          	or	a5,a5,64
    49cc:	db9ff06f          	j	4784 <_vfprintf_r+0x2a40>
    49d0:	02012223          	sw	zero,36(sp)
    49d4:	02012023          	sw	zero,32(sp)
    49d8:	e09ff06f          	j	47e0 <_vfprintf_r+0x2a9c>
    49dc:	04500d13          	li	s10,69
    49e0:	cccff06f          	j	3eac <_vfprintf_r+0x2168>

000049e4 <__sbprintf>:
    49e4:	b7010113          	add	sp,sp,-1168
    49e8:	00c59783          	lh	a5,12(a1)
    49ec:	00e5d703          	lhu	a4,14(a1)
    49f0:	48812423          	sw	s0,1160(sp)
    49f4:	00058413          	mv	s0,a1
    49f8:	000105b7          	lui	a1,0x10
    49fc:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x7f5>
    4a00:	06442303          	lw	t1,100(s0)
    4a04:	01c42883          	lw	a7,28(s0)
    4a08:	02442803          	lw	a6,36(s0)
    4a0c:	01071713          	sll	a4,a4,0x10
    4a10:	00b7f7b3          	and	a5,a5,a1
    4a14:	00e7e7b3          	or	a5,a5,a4
    4a18:	40000593          	li	a1,1024
    4a1c:	49212023          	sw	s2,1152(sp)
    4a20:	00f12a23          	sw	a5,20(sp)
    4a24:	00050913          	mv	s2,a0
    4a28:	07010793          	add	a5,sp,112
    4a2c:	06010513          	add	a0,sp,96
    4a30:	48112623          	sw	ra,1164(sp)
    4a34:	48912223          	sw	s1,1156(sp)
    4a38:	47312e23          	sw	s3,1148(sp)
    4a3c:	00060493          	mv	s1,a2
    4a40:	00068993          	mv	s3,a3
    4a44:	06612623          	sw	t1,108(sp)
    4a48:	03112223          	sw	a7,36(sp)
    4a4c:	03012623          	sw	a6,44(sp)
    4a50:	00f12423          	sw	a5,8(sp)
    4a54:	00f12c23          	sw	a5,24(sp)
    4a58:	00b12823          	sw	a1,16(sp)
    4a5c:	00b12e23          	sw	a1,28(sp)
    4a60:	02012023          	sw	zero,32(sp)
    4a64:	b7cfc0ef          	jal	de0 <__retarget_lock_init_recursive>
    4a68:	00048613          	mv	a2,s1
    4a6c:	00098693          	mv	a3,s3
    4a70:	00810593          	add	a1,sp,8
    4a74:	00090513          	mv	a0,s2
    4a78:	accfd0ef          	jal	1d44 <_vfprintf_r>
    4a7c:	00050493          	mv	s1,a0
    4a80:	04055263          	bgez	a0,4ac4 <__sbprintf+0xe0>
    4a84:	01415783          	lhu	a5,20(sp)
    4a88:	0407f793          	and	a5,a5,64
    4a8c:	00078863          	beqz	a5,4a9c <__sbprintf+0xb8>
    4a90:	00c45783          	lhu	a5,12(s0)
    4a94:	0407e793          	or	a5,a5,64
    4a98:	00f41623          	sh	a5,12(s0)
    4a9c:	06012503          	lw	a0,96(sp)
    4aa0:	b44fc0ef          	jal	de4 <__retarget_lock_close_recursive>
    4aa4:	48c12083          	lw	ra,1164(sp)
    4aa8:	48812403          	lw	s0,1160(sp)
    4aac:	48012903          	lw	s2,1152(sp)
    4ab0:	47c12983          	lw	s3,1148(sp)
    4ab4:	00048513          	mv	a0,s1
    4ab8:	48412483          	lw	s1,1156(sp)
    4abc:	49010113          	add	sp,sp,1168
    4ac0:	00008067          	ret
    4ac4:	00810593          	add	a1,sp,8
    4ac8:	00090513          	mv	a0,s2
    4acc:	449010ef          	jal	6714 <_fflush_r>
    4ad0:	fa050ae3          	beqz	a0,4a84 <__sbprintf+0xa0>
    4ad4:	fff00493          	li	s1,-1
    4ad8:	fadff06f          	j	4a84 <__sbprintf+0xa0>

00004adc <__sprint_r.part.0>:
    4adc:	0645a783          	lw	a5,100(a1)
    4ae0:	fd010113          	add	sp,sp,-48
    4ae4:	01612823          	sw	s6,16(sp)
    4ae8:	02112623          	sw	ra,44(sp)
    4aec:	01279713          	sll	a4,a5,0x12
    4af0:	00060b13          	mv	s6,a2
    4af4:	0e075863          	bgez	a4,4be4 <__sprint_r.part.0+0x108>
    4af8:	00862783          	lw	a5,8(a2)
    4afc:	03212023          	sw	s2,32(sp)
    4b00:	01312e23          	sw	s3,28(sp)
    4b04:	01512a23          	sw	s5,20(sp)
    4b08:	01712623          	sw	s7,12(sp)
    4b0c:	00058913          	mv	s2,a1
    4b10:	00062b83          	lw	s7,0(a2)
    4b14:	00050993          	mv	s3,a0
    4b18:	fff00a93          	li	s5,-1
    4b1c:	0a078863          	beqz	a5,4bcc <__sprint_r.part.0+0xf0>
    4b20:	02812423          	sw	s0,40(sp)
    4b24:	02912223          	sw	s1,36(sp)
    4b28:	01412c23          	sw	s4,24(sp)
    4b2c:	01812423          	sw	s8,8(sp)
    4b30:	004bac03          	lw	s8,4(s7)
    4b34:	000ba403          	lw	s0,0(s7)
    4b38:	002c5a13          	srl	s4,s8,0x2
    4b3c:	060a0663          	beqz	s4,4ba8 <__sprint_r.part.0+0xcc>
    4b40:	00000493          	li	s1,0
    4b44:	00c0006f          	j	4b50 <__sprint_r.part.0+0x74>
    4b48:	00440413          	add	s0,s0,4
    4b4c:	049a0c63          	beq	s4,s1,4ba4 <__sprint_r.part.0+0xc8>
    4b50:	00042583          	lw	a1,0(s0)
    4b54:	00090613          	mv	a2,s2
    4b58:	00098513          	mv	a0,s3
    4b5c:	399020ef          	jal	76f4 <_fputwc_r>
    4b60:	00148493          	add	s1,s1,1
    4b64:	ff5512e3          	bne	a0,s5,4b48 <__sprint_r.part.0+0x6c>
    4b68:	02812403          	lw	s0,40(sp)
    4b6c:	02412483          	lw	s1,36(sp)
    4b70:	02012903          	lw	s2,32(sp)
    4b74:	01c12983          	lw	s3,28(sp)
    4b78:	01812a03          	lw	s4,24(sp)
    4b7c:	01412a83          	lw	s5,20(sp)
    4b80:	00c12b83          	lw	s7,12(sp)
    4b84:	00812c03          	lw	s8,8(sp)
    4b88:	fff00513          	li	a0,-1
    4b8c:	02c12083          	lw	ra,44(sp)
    4b90:	000b2423          	sw	zero,8(s6)
    4b94:	000b2223          	sw	zero,4(s6)
    4b98:	01012b03          	lw	s6,16(sp)
    4b9c:	03010113          	add	sp,sp,48
    4ba0:	00008067          	ret
    4ba4:	008b2783          	lw	a5,8(s6)
    4ba8:	ffcc7c13          	and	s8,s8,-4
    4bac:	418787b3          	sub	a5,a5,s8
    4bb0:	00fb2423          	sw	a5,8(s6)
    4bb4:	008b8b93          	add	s7,s7,8
    4bb8:	f6079ce3          	bnez	a5,4b30 <__sprint_r.part.0+0x54>
    4bbc:	02812403          	lw	s0,40(sp)
    4bc0:	02412483          	lw	s1,36(sp)
    4bc4:	01812a03          	lw	s4,24(sp)
    4bc8:	00812c03          	lw	s8,8(sp)
    4bcc:	02012903          	lw	s2,32(sp)
    4bd0:	01c12983          	lw	s3,28(sp)
    4bd4:	01412a83          	lw	s5,20(sp)
    4bd8:	00c12b83          	lw	s7,12(sp)
    4bdc:	00000513          	li	a0,0
    4be0:	fadff06f          	j	4b8c <__sprint_r.part.0+0xb0>
    4be4:	6b5010ef          	jal	6a98 <__sfvwrite_r>
    4be8:	02c12083          	lw	ra,44(sp)
    4bec:	000b2423          	sw	zero,8(s6)
    4bf0:	000b2223          	sw	zero,4(s6)
    4bf4:	01012b03          	lw	s6,16(sp)
    4bf8:	03010113          	add	sp,sp,48
    4bfc:	00008067          	ret

00004c00 <__sprint_r>:
    4c00:	00862703          	lw	a4,8(a2)
    4c04:	00070463          	beqz	a4,4c0c <__sprint_r+0xc>
    4c08:	ed5ff06f          	j	4adc <__sprint_r.part.0>
    4c0c:	00062223          	sw	zero,4(a2)
    4c10:	00000513          	li	a0,0
    4c14:	00008067          	ret

00004c18 <_vfiprintf_r>:
    4c18:	eb010113          	add	sp,sp,-336
    4c1c:	14812423          	sw	s0,328(sp)
    4c20:	13312e23          	sw	s3,316(sp)
    4c24:	13812423          	sw	s8,296(sp)
    4c28:	00050413          	mv	s0,a0
    4c2c:	00058993          	mv	s3,a1
    4c30:	00060c13          	mv	s8,a2
    4c34:	00000593          	li	a1,0
    4c38:	00800613          	li	a2,8
    4c3c:	05010513          	add	a0,sp,80
    4c40:	13512a23          	sw	s5,308(sp)
    4c44:	14112623          	sw	ra,332(sp)
    4c48:	00068a93          	mv	s5,a3
    4c4c:	9a4fc0ef          	jal	df0 <memset>
    4c50:	00040863          	beqz	s0,4c60 <_vfiprintf_r+0x48>
    4c54:	03442783          	lw	a5,52(s0)
    4c58:	00079463          	bnez	a5,4c60 <_vfiprintf_r+0x48>
    4c5c:	49c0106f          	j	60f8 <_vfiprintf_r+0x14e0>
    4c60:	0649a703          	lw	a4,100(s3)
    4c64:	00c99783          	lh	a5,12(s3)
    4c68:	00177713          	and	a4,a4,1
    4c6c:	00071863          	bnez	a4,4c7c <_vfiprintf_r+0x64>
    4c70:	2007f713          	and	a4,a5,512
    4c74:	00071463          	bnez	a4,4c7c <_vfiprintf_r+0x64>
    4c78:	0b80106f          	j	5d30 <_vfiprintf_r+0x1118>
    4c7c:	01279713          	sll	a4,a5,0x12
    4c80:	02074663          	bltz	a4,4cac <_vfiprintf_r+0x94>
    4c84:	0649a703          	lw	a4,100(s3)
    4c88:	00002637          	lui	a2,0x2
    4c8c:	ffffe6b7          	lui	a3,0xffffe
    4c90:	00c7e7b3          	or	a5,a5,a2
    4c94:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4c98:	01079793          	sll	a5,a5,0x10
    4c9c:	4107d793          	sra	a5,a5,0x10
    4ca0:	00d77733          	and	a4,a4,a3
    4ca4:	00f99623          	sh	a5,12(s3)
    4ca8:	06e9a223          	sw	a4,100(s3)
    4cac:	0087f713          	and	a4,a5,8
    4cb0:	2e070463          	beqz	a4,4f98 <_vfiprintf_r+0x380>
    4cb4:	0109a703          	lw	a4,16(s3)
    4cb8:	2e070063          	beqz	a4,4f98 <_vfiprintf_r+0x380>
    4cbc:	01a7f713          	and	a4,a5,26
    4cc0:	00a00693          	li	a3,10
    4cc4:	2ed70c63          	beq	a4,a3,4fbc <_vfiprintf_r+0x3a4>
    4cc8:	13412c23          	sw	s4,312(sp)
    4ccc:	06c10a13          	add	s4,sp,108
    4cd0:	14912223          	sw	s1,324(sp)
    4cd4:	15212023          	sw	s2,320(sp)
    4cd8:	13612823          	sw	s6,304(sp)
    4cdc:	13712623          	sw	s7,300(sp)
    4ce0:	13912223          	sw	s9,292(sp)
    4ce4:	13a12023          	sw	s10,288(sp)
    4ce8:	000c0c93          	mv	s9,s8
    4cec:	11b12e23          	sw	s11,284(sp)
    4cf0:	07412023          	sw	s4,96(sp)
    4cf4:	06012423          	sw	zero,104(sp)
    4cf8:	06012223          	sw	zero,100(sp)
    4cfc:	00012a23          	sw	zero,20(sp)
    4d00:	02012623          	sw	zero,44(sp)
    4d04:	02012823          	sw	zero,48(sp)
    4d08:	02012a23          	sw	zero,52(sp)
    4d0c:	00012623          	sw	zero,12(sp)
    4d10:	7fffc497          	auipc	s1,0x7fffc
    4d14:	82448493          	add	s1,s1,-2012 # 80000534 <__global_locale>
    4d18:	02500913          	li	s2,37
    4d1c:	0000ab97          	auipc	s7,0xa
    4d20:	724b8b93          	add	s7,s7,1828 # f440 <blanks.1+0x10>
    4d24:	0000bb17          	auipc	s6,0xb
    4d28:	888b0b13          	add	s6,s6,-1912 # f5ac <zeroes.0>
    4d2c:	000a0c13          	mv	s8,s4
    4d30:	000c8d93          	mv	s11,s9
    4d34:	0e44ad03          	lw	s10,228(s1)
    4d38:	3f9020ef          	jal	7930 <__locale_mb_cur_max>
    4d3c:	00050693          	mv	a3,a0
    4d40:	05010713          	add	a4,sp,80
    4d44:	000d8613          	mv	a2,s11
    4d48:	04810593          	add	a1,sp,72
    4d4c:	00040513          	mv	a0,s0
    4d50:	000d00e7          	jalr	s10
    4d54:	2e050e63          	beqz	a0,5050 <_vfiprintf_r+0x438>
    4d58:	2c054e63          	bltz	a0,5034 <_vfiprintf_r+0x41c>
    4d5c:	04812783          	lw	a5,72(sp)
    4d60:	01278663          	beq	a5,s2,4d6c <_vfiprintf_r+0x154>
    4d64:	00ad8db3          	add	s11,s11,a0
    4d68:	fcdff06f          	j	4d34 <_vfiprintf_r+0x11c>
    4d6c:	00050d13          	mv	s10,a0
    4d70:	419d87b3          	sub	a5,s11,s9
    4d74:	2f9d9463          	bne	s11,s9,505c <_vfiprintf_r+0x444>
    4d78:	00000e13          	li	t3,0
    4d7c:	001dc683          	lbu	a3,1(s11)
    4d80:	001d8c93          	add	s9,s11,1
    4d84:	040101a3          	sb	zero,67(sp)
    4d88:	fff00713          	li	a4,-1
    4d8c:	00000893          	li	a7,0
    4d90:	05a00d13          	li	s10,90
    4d94:	000e0d93          	mv	s11,t3
    4d98:	001c8c93          	add	s9,s9,1
    4d9c:	fe068793          	add	a5,a3,-32
    4da0:	04fd6663          	bltu	s10,a5,4dec <_vfiprintf_r+0x1d4>
    4da4:	00279793          	sll	a5,a5,0x2
    4da8:	017787b3          	add	a5,a5,s7
    4dac:	0007a783          	lw	a5,0(a5)
    4db0:	017787b3          	add	a5,a5,s7
    4db4:	00078067          	jr	a5
    4db8:	00000893          	li	a7,0
    4dbc:	fd068793          	add	a5,a3,-48
    4dc0:	00900593          	li	a1,9
    4dc4:	000cc683          	lbu	a3,0(s9)
    4dc8:	00289613          	sll	a2,a7,0x2
    4dcc:	011608b3          	add	a7,a2,a7
    4dd0:	00189893          	sll	a7,a7,0x1
    4dd4:	011788b3          	add	a7,a5,a7
    4dd8:	fd068793          	add	a5,a3,-48
    4ddc:	001c8c93          	add	s9,s9,1
    4de0:	fef5f2e3          	bgeu	a1,a5,4dc4 <_vfiprintf_r+0x1ac>
    4de4:	fe068793          	add	a5,a3,-32
    4de8:	fafd7ee3          	bgeu	s10,a5,4da4 <_vfiprintf_r+0x18c>
    4dec:	000d8e13          	mv	t3,s11
    4df0:	2c068663          	beqz	a3,50bc <_vfiprintf_r+0x4a4>
    4df4:	0ad10623          	sb	a3,172(sp)
    4df8:	040101a3          	sb	zero,67(sp)
    4dfc:	00100e93          	li	t4,1
    4e00:	00100d13          	li	s10,1
    4e04:	0ac10813          	add	a6,sp,172
    4e08:	00012823          	sw	zero,16(sp)
    4e0c:	00000713          	li	a4,0
    4e10:	00000f93          	li	t6,0
    4e14:	06412603          	lw	a2,100(sp)
    4e18:	084e7293          	and	t0,t3,132
    4e1c:	06812783          	lw	a5,104(sp)
    4e20:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x2bd>
    4e24:	00058f13          	mv	t5,a1
    4e28:	00029663          	bnez	t0,4e34 <_vfiprintf_r+0x21c>
    4e2c:	41d88db3          	sub	s11,a7,t4
    4e30:	47b046e3          	bgtz	s11,5a9c <_vfiprintf_r+0xe84>
    4e34:	04314583          	lbu	a1,67(sp)
    4e38:	02058a63          	beqz	a1,4e6c <_vfiprintf_r+0x254>
    4e3c:	04310613          	add	a2,sp,67
    4e40:	00178793          	add	a5,a5,1
    4e44:	00100693          	li	a3,1
    4e48:	00cc2023          	sw	a2,0(s8)
    4e4c:	00dc2223          	sw	a3,4(s8)
    4e50:	06f12423          	sw	a5,104(sp)
    4e54:	07e12223          	sw	t5,100(sp)
    4e58:	00700613          	li	a2,7
    4e5c:	35e64ce3          	blt	a2,t5,59b4 <_vfiprintf_r+0xd9c>
    4e60:	000f0613          	mv	a2,t5
    4e64:	008c0c13          	add	s8,s8,8
    4e68:	001f0f13          	add	t5,t5,1
    4e6c:	080f8063          	beqz	t6,4eec <_vfiprintf_r+0x2d4>
    4e70:	00200613          	li	a2,2
    4e74:	00278793          	add	a5,a5,2
    4e78:	04410693          	add	a3,sp,68
    4e7c:	00cc2223          	sw	a2,4(s8)
    4e80:	00dc2023          	sw	a3,0(s8)
    4e84:	06f12423          	sw	a5,104(sp)
    4e88:	07e12223          	sw	t5,100(sp)
    4e8c:	00700613          	li	a2,7
    4e90:	3be652e3          	bge	a2,t5,5a34 <_vfiprintf_r+0xe1c>
    4e94:	60078ae3          	beqz	a5,5ca8 <_vfiprintf_r+0x1090>
    4e98:	06010613          	add	a2,sp,96
    4e9c:	00098593          	mv	a1,s3
    4ea0:	00040513          	mv	a0,s0
    4ea4:	03d12c23          	sw	t4,56(sp)
    4ea8:	02e12423          	sw	a4,40(sp)
    4eac:	03112223          	sw	a7,36(sp)
    4eb0:	03012023          	sw	a6,32(sp)
    4eb4:	00512e23          	sw	t0,28(sp)
    4eb8:	01c12c23          	sw	t3,24(sp)
    4ebc:	c21ff0ef          	jal	4adc <__sprint_r.part.0>
    4ec0:	22051463          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    4ec4:	06412603          	lw	a2,100(sp)
    4ec8:	06812783          	lw	a5,104(sp)
    4ecc:	03812e83          	lw	t4,56(sp)
    4ed0:	02812703          	lw	a4,40(sp)
    4ed4:	02412883          	lw	a7,36(sp)
    4ed8:	02012803          	lw	a6,32(sp)
    4edc:	01c12283          	lw	t0,28(sp)
    4ee0:	01812e03          	lw	t3,24(sp)
    4ee4:	000a0c13          	mv	s8,s4
    4ee8:	00160f13          	add	t5,a2,1
    4eec:	08000593          	li	a1,128
    4ef0:	06b286e3          	beq	t0,a1,575c <_vfiprintf_r+0xb44>
    4ef4:	41a70733          	sub	a4,a4,s10
    4ef8:	1ae04ae3          	bgtz	a4,58ac <_vfiprintf_r+0xc94>
    4efc:	00fd07b3          	add	a5,s10,a5
    4f00:	010c2023          	sw	a6,0(s8)
    4f04:	01ac2223          	sw	s10,4(s8)
    4f08:	06f12423          	sw	a5,104(sp)
    4f0c:	07e12223          	sw	t5,100(sp)
    4f10:	00700713          	li	a4,7
    4f14:	03e758e3          	bge	a4,t5,5744 <_vfiprintf_r+0xb2c>
    4f18:	24078063          	beqz	a5,5158 <_vfiprintf_r+0x540>
    4f1c:	06010613          	add	a2,sp,96
    4f20:	00098593          	mv	a1,s3
    4f24:	00040513          	mv	a0,s0
    4f28:	03d12023          	sw	t4,32(sp)
    4f2c:	01112e23          	sw	a7,28(sp)
    4f30:	01c12c23          	sw	t3,24(sp)
    4f34:	ba9ff0ef          	jal	4adc <__sprint_r.part.0>
    4f38:	1a051863          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    4f3c:	06812783          	lw	a5,104(sp)
    4f40:	02012e83          	lw	t4,32(sp)
    4f44:	01c12883          	lw	a7,28(sp)
    4f48:	01812e03          	lw	t3,24(sp)
    4f4c:	000a0c13          	mv	s8,s4
    4f50:	004e7e13          	and	t3,t3,4
    4f54:	000e0663          	beqz	t3,4f60 <_vfiprintf_r+0x348>
    4f58:	41d88db3          	sub	s11,a7,t4
    4f5c:	21b04a63          	bgtz	s11,5170 <_vfiprintf_r+0x558>
    4f60:	01d8d463          	bge	a7,t4,4f68 <_vfiprintf_r+0x350>
    4f64:	000e8893          	mv	a7,t4
    4f68:	00c12703          	lw	a4,12(sp)
    4f6c:	01170733          	add	a4,a4,a7
    4f70:	00e12623          	sw	a4,12(sp)
    4f74:	16079063          	bnez	a5,50d4 <_vfiprintf_r+0x4bc>
    4f78:	01012783          	lw	a5,16(sp)
    4f7c:	06012223          	sw	zero,100(sp)
    4f80:	00078863          	beqz	a5,4f90 <_vfiprintf_r+0x378>
    4f84:	00078593          	mv	a1,a5
    4f88:	00040513          	mv	a0,s0
    4f8c:	ab4fc0ef          	jal	1240 <_free_r>
    4f90:	000a0c13          	mv	s8,s4
    4f94:	d9dff06f          	j	4d30 <_vfiprintf_r+0x118>
    4f98:	00098593          	mv	a1,s3
    4f9c:	00040513          	mv	a0,s0
    4fa0:	4b0020ef          	jal	7450 <__swsetup_r>
    4fa4:	00050463          	beqz	a0,4fac <_vfiprintf_r+0x394>
    4fa8:	3840106f          	j	632c <_vfiprintf_r+0x1714>
    4fac:	00c99783          	lh	a5,12(s3)
    4fb0:	00a00693          	li	a3,10
    4fb4:	01a7f713          	and	a4,a5,26
    4fb8:	d0d718e3          	bne	a4,a3,4cc8 <_vfiprintf_r+0xb0>
    4fbc:	00e99703          	lh	a4,14(s3)
    4fc0:	d00744e3          	bltz	a4,4cc8 <_vfiprintf_r+0xb0>
    4fc4:	0649a703          	lw	a4,100(s3)
    4fc8:	00177713          	and	a4,a4,1
    4fcc:	00071863          	bnez	a4,4fdc <_vfiprintf_r+0x3c4>
    4fd0:	2007f793          	and	a5,a5,512
    4fd4:	00079463          	bnez	a5,4fdc <_vfiprintf_r+0x3c4>
    4fd8:	2ac0106f          	j	6284 <_vfiprintf_r+0x166c>
    4fdc:	000a8693          	mv	a3,s5
    4fe0:	000c0613          	mv	a2,s8
    4fe4:	00098593          	mv	a1,s3
    4fe8:	00040513          	mv	a0,s0
    4fec:	3e4010ef          	jal	63d0 <__sbprintf>
    4ff0:	14c12083          	lw	ra,332(sp)
    4ff4:	14812403          	lw	s0,328(sp)
    4ff8:	00a12623          	sw	a0,12(sp)
    4ffc:	00c12503          	lw	a0,12(sp)
    5000:	13c12983          	lw	s3,316(sp)
    5004:	13412a83          	lw	s5,308(sp)
    5008:	12812c03          	lw	s8,296(sp)
    500c:	15010113          	add	sp,sp,336
    5010:	00008067          	ret
    5014:	000aa883          	lw	a7,0(s5)
    5018:	004a8a93          	add	s5,s5,4
    501c:	3608cc63          	bltz	a7,5394 <_vfiprintf_r+0x77c>
    5020:	000cc683          	lbu	a3,0(s9)
    5024:	d75ff06f          	j	4d98 <_vfiprintf_r+0x180>
    5028:	000cc683          	lbu	a3,0(s9)
    502c:	020ded93          	or	s11,s11,32
    5030:	d69ff06f          	j	4d98 <_vfiprintf_r+0x180>
    5034:	00800613          	li	a2,8
    5038:	00000593          	li	a1,0
    503c:	05010513          	add	a0,sp,80
    5040:	db1fb0ef          	jal	df0 <memset>
    5044:	00100513          	li	a0,1
    5048:	00ad8db3          	add	s11,s11,a0
    504c:	ce9ff06f          	j	4d34 <_vfiprintf_r+0x11c>
    5050:	00050d13          	mv	s10,a0
    5054:	419d87b3          	sub	a5,s11,s9
    5058:	079d8263          	beq	s11,s9,50bc <_vfiprintf_r+0x4a4>
    505c:	06812683          	lw	a3,104(sp)
    5060:	06412703          	lw	a4,100(sp)
    5064:	019c2023          	sw	s9,0(s8)
    5068:	00d786b3          	add	a3,a5,a3
    506c:	00170713          	add	a4,a4,1
    5070:	00fc2223          	sw	a5,4(s8)
    5074:	06d12423          	sw	a3,104(sp)
    5078:	06e12223          	sw	a4,100(sp)
    507c:	00700613          	li	a2,7
    5080:	008c0c13          	add	s8,s8,8
    5084:	02e65463          	bge	a2,a4,50ac <_vfiprintf_r+0x494>
    5088:	38068ce3          	beqz	a3,5c20 <_vfiprintf_r+0x1008>
    508c:	06010613          	add	a2,sp,96
    5090:	00098593          	mv	a1,s3
    5094:	00040513          	mv	a0,s0
    5098:	00f12823          	sw	a5,16(sp)
    509c:	a41ff0ef          	jal	4adc <__sprint_r.part.0>
    50a0:	01012783          	lw	a5,16(sp)
    50a4:	04051c63          	bnez	a0,50fc <_vfiprintf_r+0x4e4>
    50a8:	000a0c13          	mv	s8,s4
    50ac:	00c12703          	lw	a4,12(sp)
    50b0:	00f707b3          	add	a5,a4,a5
    50b4:	00f12623          	sw	a5,12(sp)
    50b8:	cc0d10e3          	bnez	s10,4d78 <_vfiprintf_r+0x160>
    50bc:	06812783          	lw	a5,104(sp)
    50c0:	00078463          	beqz	a5,50c8 <_vfiprintf_r+0x4b0>
    50c4:	22c0106f          	j	62f0 <_vfiprintf_r+0x16d8>
    50c8:	00c99783          	lh	a5,12(s3)
    50cc:	06012223          	sw	zero,100(sp)
    50d0:	0300006f          	j	5100 <_vfiprintf_r+0x4e8>
    50d4:	06010613          	add	a2,sp,96
    50d8:	00098593          	mv	a1,s3
    50dc:	00040513          	mv	a0,s0
    50e0:	9fdff0ef          	jal	4adc <__sprint_r.part.0>
    50e4:	e8050ae3          	beqz	a0,4f78 <_vfiprintf_r+0x360>
    50e8:	01012783          	lw	a5,16(sp)
    50ec:	00078863          	beqz	a5,50fc <_vfiprintf_r+0x4e4>
    50f0:	01012583          	lw	a1,16(sp)
    50f4:	00040513          	mv	a0,s0
    50f8:	948fc0ef          	jal	1240 <_free_r>
    50fc:	00c99783          	lh	a5,12(s3)
    5100:	0649a703          	lw	a4,100(s3)
    5104:	00177713          	and	a4,a4,1
    5108:	16070a63          	beqz	a4,527c <_vfiprintf_r+0x664>
    510c:	0407f793          	and	a5,a5,64
    5110:	14412483          	lw	s1,324(sp)
    5114:	14012903          	lw	s2,320(sp)
    5118:	13812a03          	lw	s4,312(sp)
    511c:	13012b03          	lw	s6,304(sp)
    5120:	12c12b83          	lw	s7,300(sp)
    5124:	12412c83          	lw	s9,292(sp)
    5128:	12012d03          	lw	s10,288(sp)
    512c:	11c12d83          	lw	s11,284(sp)
    5130:	00078463          	beqz	a5,5138 <_vfiprintf_r+0x520>
    5134:	2180106f          	j	634c <_vfiprintf_r+0x1734>
    5138:	14c12083          	lw	ra,332(sp)
    513c:	14812403          	lw	s0,328(sp)
    5140:	00c12503          	lw	a0,12(sp)
    5144:	13c12983          	lw	s3,316(sp)
    5148:	13412a83          	lw	s5,308(sp)
    514c:	12812c03          	lw	s8,296(sp)
    5150:	15010113          	add	sp,sp,336
    5154:	00008067          	ret
    5158:	06012223          	sw	zero,100(sp)
    515c:	004e7e13          	and	t3,t3,4
    5160:	240e0ee3          	beqz	t3,5bbc <_vfiprintf_r+0xfa4>
    5164:	41d88db3          	sub	s11,a7,t4
    5168:	25b05ae3          	blez	s11,5bbc <_vfiprintf_r+0xfa4>
    516c:	000a0c13          	mv	s8,s4
    5170:	01000713          	li	a4,16
    5174:	06412683          	lw	a3,100(sp)
    5178:	01b74463          	blt	a4,s11,5180 <_vfiprintf_r+0x568>
    517c:	1900106f          	j	630c <_vfiprintf_r+0x16f4>
    5180:	000a8713          	mv	a4,s5
    5184:	0000a317          	auipc	t1,0xa
    5188:	43830313          	add	t1,t1,1080 # f5bc <blanks.1>
    518c:	000c0593          	mv	a1,s8
    5190:	000d8a93          	mv	s5,s11
    5194:	01000813          	li	a6,16
    5198:	00700d13          	li	s10,7
    519c:	01112c23          	sw	a7,24(sp)
    51a0:	01d12e23          	sw	t4,28(sp)
    51a4:	00030c13          	mv	s8,t1
    51a8:	00070d93          	mv	s11,a4
    51ac:	0180006f          	j	51c4 <_vfiprintf_r+0x5ac>
    51b0:	00268613          	add	a2,a3,2
    51b4:	00858593          	add	a1,a1,8
    51b8:	00070693          	mv	a3,a4
    51bc:	ff0a8a93          	add	s5,s5,-16
    51c0:	05585a63          	bge	a6,s5,5214 <_vfiprintf_r+0x5fc>
    51c4:	01078793          	add	a5,a5,16
    51c8:	00168713          	add	a4,a3,1
    51cc:	0185a023          	sw	s8,0(a1)
    51d0:	0105a223          	sw	a6,4(a1)
    51d4:	06f12423          	sw	a5,104(sp)
    51d8:	06e12223          	sw	a4,100(sp)
    51dc:	fced5ae3          	bge	s10,a4,51b0 <_vfiprintf_r+0x598>
    51e0:	56078663          	beqz	a5,574c <_vfiprintf_r+0xb34>
    51e4:	06010613          	add	a2,sp,96
    51e8:	00098593          	mv	a1,s3
    51ec:	00040513          	mv	a0,s0
    51f0:	8edff0ef          	jal	4adc <__sprint_r.part.0>
    51f4:	ee051ae3          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    51f8:	06412683          	lw	a3,100(sp)
    51fc:	01000813          	li	a6,16
    5200:	ff0a8a93          	add	s5,s5,-16
    5204:	06812783          	lw	a5,104(sp)
    5208:	000a0593          	mv	a1,s4
    520c:	00168613          	add	a2,a3,1
    5210:	fb584ae3          	blt	a6,s5,51c4 <_vfiprintf_r+0x5ac>
    5214:	01812883          	lw	a7,24(sp)
    5218:	01c12e83          	lw	t4,28(sp)
    521c:	000d8713          	mv	a4,s11
    5220:	000c0313          	mv	t1,s8
    5224:	000a8d93          	mv	s11,s5
    5228:	00058c13          	mv	s8,a1
    522c:	00070a93          	mv	s5,a4
    5230:	01b787b3          	add	a5,a5,s11
    5234:	006c2023          	sw	t1,0(s8)
    5238:	01bc2223          	sw	s11,4(s8)
    523c:	06f12423          	sw	a5,104(sp)
    5240:	06c12223          	sw	a2,100(sp)
    5244:	00700713          	li	a4,7
    5248:	d0c75ce3          	bge	a4,a2,4f60 <_vfiprintf_r+0x348>
    524c:	160788e3          	beqz	a5,5bbc <_vfiprintf_r+0xfa4>
    5250:	06010613          	add	a2,sp,96
    5254:	00098593          	mv	a1,s3
    5258:	00040513          	mv	a0,s0
    525c:	01d12e23          	sw	t4,28(sp)
    5260:	01112c23          	sw	a7,24(sp)
    5264:	879ff0ef          	jal	4adc <__sprint_r.part.0>
    5268:	e80510e3          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    526c:	06812783          	lw	a5,104(sp)
    5270:	01c12e83          	lw	t4,28(sp)
    5274:	01812883          	lw	a7,24(sp)
    5278:	ce9ff06f          	j	4f60 <_vfiprintf_r+0x348>
    527c:	2007f713          	and	a4,a5,512
    5280:	e80716e3          	bnez	a4,510c <_vfiprintf_r+0x4f4>
    5284:	0589a503          	lw	a0,88(s3)
    5288:	b65fb0ef          	jal	dec <__retarget_lock_release_recursive>
    528c:	00c99783          	lh	a5,12(s3)
    5290:	e7dff06f          	j	510c <_vfiprintf_r+0x4f4>
    5294:	000aa803          	lw	a6,0(s5)
    5298:	040101a3          	sb	zero,67(sp)
    529c:	000d8e13          	mv	t3,s11
    52a0:	004a8a93          	add	s5,s5,4
    52a4:	68080ae3          	beqz	a6,6138 <_vfiprintf_r+0x1520>
    52a8:	05300793          	li	a5,83
    52ac:	3cf68ce3          	beq	a3,a5,5e84 <_vfiprintf_r+0x126c>
    52b0:	010df793          	and	a5,s11,16
    52b4:	3c0798e3          	bnez	a5,5e84 <_vfiprintf_r+0x126c>
    52b8:	00075463          	bgez	a4,52c0 <_vfiprintf_r+0x6a8>
    52bc:	7fd0006f          	j	62b8 <_vfiprintf_r+0x16a0>
    52c0:	00070613          	mv	a2,a4
    52c4:	00080513          	mv	a0,a6
    52c8:	00000593          	li	a1,0
    52cc:	03112223          	sw	a7,36(sp)
    52d0:	00e12e23          	sw	a4,28(sp)
    52d4:	01012c23          	sw	a6,24(sp)
    52d8:	03b12023          	sw	s11,32(sp)
    52dc:	4e4020ef          	jal	77c0 <memchr>
    52e0:	00a12823          	sw	a0,16(sp)
    52e4:	01812803          	lw	a6,24(sp)
    52e8:	01c12703          	lw	a4,28(sp)
    52ec:	02012e03          	lw	t3,32(sp)
    52f0:	02412883          	lw	a7,36(sp)
    52f4:	00051463          	bnez	a0,52fc <_vfiprintf_r+0x6e4>
    52f8:	7990006f          	j	6290 <_vfiprintf_r+0x1678>
    52fc:	41050d33          	sub	s10,a0,a6
    5300:	fffd4e93          	not	t4,s10
    5304:	41fede93          	sra	t4,t4,0x1f
    5308:	01dd7eb3          	and	t4,s10,t4
    530c:	00012823          	sw	zero,16(sp)
    5310:	6dd0006f          	j	61ec <_vfiprintf_r+0x15d4>
    5314:	04300793          	li	a5,67
    5318:	000d8e13          	mv	t3,s11
    531c:	004a8d93          	add	s11,s5,4
    5320:	00f68663          	beq	a3,a5,532c <_vfiprintf_r+0x714>
    5324:	010e7793          	and	a5,t3,16
    5328:	280788e3          	beqz	a5,5db8 <_vfiprintf_r+0x11a0>
    532c:	00800613          	li	a2,8
    5330:	00000593          	li	a1,0
    5334:	05810513          	add	a0,sp,88
    5338:	01112e23          	sw	a7,28(sp)
    533c:	01c12c23          	sw	t3,24(sp)
    5340:	ab1fb0ef          	jal	df0 <memset>
    5344:	000aa603          	lw	a2,0(s5)
    5348:	0ac10593          	add	a1,sp,172
    534c:	05810693          	add	a3,sp,88
    5350:	00040513          	mv	a0,s0
    5354:	00b12823          	sw	a1,16(sp)
    5358:	694050ef          	jal	a9ec <_wcrtomb_r>
    535c:	fff00793          	li	a5,-1
    5360:	01012583          	lw	a1,16(sp)
    5364:	01812e03          	lw	t3,24(sp)
    5368:	01c12883          	lw	a7,28(sp)
    536c:	00050d13          	mv	s10,a0
    5370:	00f51463          	bne	a0,a5,5378 <_vfiprintf_r+0x760>
    5374:	0200106f          	j	6394 <_vfiprintf_r+0x177c>
    5378:	fff54e93          	not	t4,a0
    537c:	41fede93          	sra	t4,t4,0x1f
    5380:	01d57eb3          	and	t4,a0,t4
    5384:	040101a3          	sb	zero,67(sp)
    5388:	000d8a93          	mv	s5,s11
    538c:	00058813          	mv	a6,a1
    5390:	a79ff06f          	j	4e08 <_vfiprintf_r+0x1f0>
    5394:	411008b3          	neg	a7,a7
    5398:	000cc683          	lbu	a3,0(s9)
    539c:	004ded93          	or	s11,s11,4
    53a0:	9f9ff06f          	j	4d98 <_vfiprintf_r+0x180>
    53a4:	010dee13          	or	t3,s11,16
    53a8:	020e7793          	and	a5,t3,32
    53ac:	0c0788e3          	beqz	a5,5c7c <_vfiprintf_r+0x1064>
    53b0:	007a8a93          	add	s5,s5,7
    53b4:	ff8afa93          	and	s5,s5,-8
    53b8:	004aa683          	lw	a3,4(s5)
    53bc:	000aad83          	lw	s11,0(s5)
    53c0:	008a8a93          	add	s5,s5,8
    53c4:	00068d13          	mv	s10,a3
    53c8:	3006c263          	bltz	a3,56cc <_vfiprintf_r+0xab4>
    53cc:	32074063          	bltz	a4,56ec <_vfiprintf_r+0xad4>
    53d0:	01ade6b3          	or	a3,s11,s10
    53d4:	f7fe7e13          	and	t3,t3,-129
    53d8:	30069a63          	bnez	a3,56ec <_vfiprintf_r+0xad4>
    53dc:	68071ae3          	bnez	a4,6270 <_vfiprintf_r+0x1658>
    53e0:	04314783          	lbu	a5,67(sp)
    53e4:	00012823          	sw	zero,16(sp)
    53e8:	00000e93          	li	t4,0
    53ec:	00000d13          	li	s10,0
    53f0:	11010813          	add	a6,sp,272
    53f4:	00078463          	beqz	a5,53fc <_vfiprintf_r+0x7e4>
    53f8:	001e8e93          	add	t4,t4,1
    53fc:	002e7f93          	and	t6,t3,2
    5400:	a00f8ae3          	beqz	t6,4e14 <_vfiprintf_r+0x1fc>
    5404:	002e8e93          	add	t4,t4,2
    5408:	00200f93          	li	t6,2
    540c:	a09ff06f          	j	4e14 <_vfiprintf_r+0x1fc>
    5410:	000cc683          	lbu	a3,0(s9)
    5414:	06800793          	li	a5,104
    5418:	4ef686e3          	beq	a3,a5,6104 <_vfiprintf_r+0x14ec>
    541c:	040ded93          	or	s11,s11,64
    5420:	979ff06f          	j	4d98 <_vfiprintf_r+0x180>
    5424:	010de613          	or	a2,s11,16
    5428:	02067793          	and	a5,a2,32
    542c:	000780e3          	beqz	a5,5c2c <_vfiprintf_r+0x1014>
    5430:	007a8a93          	add	s5,s5,7
    5434:	ff8afa93          	and	s5,s5,-8
    5438:	000aad83          	lw	s11,0(s5)
    543c:	004aad03          	lw	s10,4(s5)
    5440:	008a8a93          	add	s5,s5,8
    5444:	040101a3          	sb	zero,67(sp)
    5448:	00060e13          	mv	t3,a2
    544c:	2a074063          	bltz	a4,56ec <_vfiprintf_r+0xad4>
    5450:	01ade6b3          	or	a3,s11,s10
    5454:	f7f67e13          	and	t3,a2,-129
    5458:	28069a63          	bnez	a3,56ec <_vfiprintf_r+0xad4>
    545c:	00100793          	li	a5,1
    5460:	06071e63          	bnez	a4,54dc <_vfiprintf_r+0x8c4>
    5464:	f6079ee3          	bnez	a5,53e0 <_vfiprintf_r+0x7c8>
    5468:	00167d13          	and	s10,a2,1
    546c:	0a0d0ce3          	beqz	s10,5d24 <_vfiprintf_r+0x110c>
    5470:	03000793          	li	a5,48
    5474:	10f107a3          	sb	a5,271(sp)
    5478:	000d0e93          	mv	t4,s10
    547c:	10f10813          	add	a6,sp,271
    5480:	2980006f          	j	5718 <_vfiprintf_r+0xb00>
    5484:	02b00793          	li	a5,43
    5488:	000cc683          	lbu	a3,0(s9)
    548c:	04f101a3          	sb	a5,67(sp)
    5490:	909ff06f          	j	4d98 <_vfiprintf_r+0x180>
    5494:	010de693          	or	a3,s11,16
    5498:	0206f793          	and	a5,a3,32
    549c:	7a078c63          	beqz	a5,5c54 <_vfiprintf_r+0x103c>
    54a0:	007a8a93          	add	s5,s5,7
    54a4:	ff8afa93          	and	s5,s5,-8
    54a8:	000aa783          	lw	a5,0(s5)
    54ac:	004aa583          	lw	a1,4(s5)
    54b0:	008a8a93          	add	s5,s5,8
    54b4:	040101a3          	sb	zero,67(sp)
    54b8:	bff6fe13          	and	t3,a3,-1025
    54bc:	02074c63          	bltz	a4,54f4 <_vfiprintf_r+0x8dc>
    54c0:	00b7e633          	or	a2,a5,a1
    54c4:	b7f6f693          	and	a3,a3,-1153
    54c8:	420610e3          	bnez	a2,60e8 <_vfiprintf_r+0x14d0>
    54cc:	000e0613          	mv	a2,t3
    54d0:	00000793          	li	a5,0
    54d4:	00068e13          	mv	t3,a3
    54d8:	f80706e3          	beqz	a4,5464 <_vfiprintf_r+0x84c>
    54dc:	00100693          	li	a3,1
    54e0:	58d788e3          	beq	a5,a3,6270 <_vfiprintf_r+0x1658>
    54e4:	00200693          	li	a3,2
    54e8:	46d786e3          	beq	a5,a3,6154 <_vfiprintf_r+0x153c>
    54ec:	00000793          	li	a5,0
    54f0:	00000593          	li	a1,0
    54f4:	11010813          	add	a6,sp,272
    54f8:	01d59613          	sll	a2,a1,0x1d
    54fc:	0077f693          	and	a3,a5,7
    5500:	0037d793          	srl	a5,a5,0x3
    5504:	03068693          	add	a3,a3,48
    5508:	00f667b3          	or	a5,a2,a5
    550c:	0035d593          	srl	a1,a1,0x3
    5510:	fed80fa3          	sb	a3,-1(a6)
    5514:	00b7e633          	or	a2,a5,a1
    5518:	00080513          	mv	a0,a6
    551c:	fff80813          	add	a6,a6,-1
    5520:	fc061ce3          	bnez	a2,54f8 <_vfiprintf_r+0x8e0>
    5524:	001e7793          	and	a5,t3,1
    5528:	54078e63          	beqz	a5,5a84 <_vfiprintf_r+0xe6c>
    552c:	03000793          	li	a5,48
    5530:	54f68a63          	beq	a3,a5,5a84 <_vfiprintf_r+0xe6c>
    5534:	ffe50513          	add	a0,a0,-2
    5538:	fef80fa3          	sb	a5,-1(a6)
    553c:	11010793          	add	a5,sp,272
    5540:	40a78d33          	sub	s10,a5,a0
    5544:	00070e93          	mv	t4,a4
    5548:	09a744e3          	blt	a4,s10,5dd0 <_vfiprintf_r+0x11b8>
    554c:	00050813          	mv	a6,a0
    5550:	1c80006f          	j	5718 <_vfiprintf_r+0xb00>
    5554:	000086b7          	lui	a3,0x8
    5558:	83068693          	add	a3,a3,-2000 # 7830 <memchr+0x70>
    555c:	04d11223          	sh	a3,68(sp)
    5560:	0000a697          	auipc	a3,0xa
    5564:	9d868693          	add	a3,a3,-1576 # ef38 <__fini_array_end+0x1a4>
    5568:	000aa783          	lw	a5,0(s5)
    556c:	00000593          	li	a1,0
    5570:	002dee13          	or	t3,s11,2
    5574:	004a8a93          	add	s5,s5,4
    5578:	00d12a23          	sw	a3,20(sp)
    557c:	040101a3          	sb	zero,67(sp)
    5580:	4c074863          	bltz	a4,5a50 <_vfiprintf_r+0xe38>
    5584:	00b7e6b3          	or	a3,a5,a1
    5588:	f7fe7513          	and	a0,t3,-129
    558c:	4a069c63          	bnez	a3,5a44 <_vfiprintf_r+0xe2c>
    5590:	000e0613          	mv	a2,t3
    5594:	00200793          	li	a5,2
    5598:	00050e13          	mv	t3,a0
    559c:	ec5ff06f          	j	5460 <_vfiprintf_r+0x848>
    55a0:	00040513          	mv	a0,s0
    55a4:	00e12c23          	sw	a4,24(sp)
    55a8:	01112823          	sw	a7,16(sp)
    55ac:	390020ef          	jal	793c <_localeconv_r>
    55b0:	00452783          	lw	a5,4(a0)
    55b4:	00078513          	mv	a0,a5
    55b8:	02f12a23          	sw	a5,52(sp)
    55bc:	ab5fb0ef          	jal	1070 <strlen>
    55c0:	00050793          	mv	a5,a0
    55c4:	00040513          	mv	a0,s0
    55c8:	02f12823          	sw	a5,48(sp)
    55cc:	370020ef          	jal	793c <_localeconv_r>
    55d0:	00852703          	lw	a4,8(a0)
    55d4:	03012783          	lw	a5,48(sp)
    55d8:	01012883          	lw	a7,16(sp)
    55dc:	02e12623          	sw	a4,44(sp)
    55e0:	01812703          	lw	a4,24(sp)
    55e4:	a2078ee3          	beqz	a5,5020 <_vfiprintf_r+0x408>
    55e8:	02c12783          	lw	a5,44(sp)
    55ec:	000cc683          	lbu	a3,0(s9)
    55f0:	fa078463          	beqz	a5,4d98 <_vfiprintf_r+0x180>
    55f4:	0007c783          	lbu	a5,0(a5)
    55f8:	fa078063          	beqz	a5,4d98 <_vfiprintf_r+0x180>
    55fc:	400ded93          	or	s11,s11,1024
    5600:	f98ff06f          	j	4d98 <_vfiprintf_r+0x180>
    5604:	020df793          	and	a5,s11,32
    5608:	78079263          	bnez	a5,5d8c <_vfiprintf_r+0x1174>
    560c:	010df793          	and	a5,s11,16
    5610:	30079ae3          	bnez	a5,6124 <_vfiprintf_r+0x150c>
    5614:	040df793          	and	a5,s11,64
    5618:	400796e3          	bnez	a5,6224 <_vfiprintf_r+0x160c>
    561c:	200dfe13          	and	t3,s11,512
    5620:	300e02e3          	beqz	t3,6124 <_vfiprintf_r+0x150c>
    5624:	000aa783          	lw	a5,0(s5)
    5628:	00c12703          	lw	a4,12(sp)
    562c:	004a8a93          	add	s5,s5,4
    5630:	00e78023          	sb	a4,0(a5)
    5634:	efcff06f          	j	4d30 <_vfiprintf_r+0x118>
    5638:	000cc683          	lbu	a3,0(s9)
    563c:	06c00793          	li	a5,108
    5640:	2cf68ae3          	beq	a3,a5,6114 <_vfiprintf_r+0x14fc>
    5644:	010ded93          	or	s11,s11,16
    5648:	f50ff06f          	j	4d98 <_vfiprintf_r+0x180>
    564c:	000cc683          	lbu	a3,0(s9)
    5650:	080ded93          	or	s11,s11,128
    5654:	f44ff06f          	j	4d98 <_vfiprintf_r+0x180>
    5658:	000cc683          	lbu	a3,0(s9)
    565c:	02a00793          	li	a5,42
    5660:	001c8593          	add	a1,s9,1
    5664:	54f680e3          	beq	a3,a5,63a4 <_vfiprintf_r+0x178c>
    5668:	fd068793          	add	a5,a3,-48
    566c:	00900613          	li	a2,9
    5670:	00000713          	li	a4,0
    5674:	00900513          	li	a0,9
    5678:	02f66463          	bltu	a2,a5,56a0 <_vfiprintf_r+0xa88>
    567c:	0005c683          	lbu	a3,0(a1)
    5680:	00271613          	sll	a2,a4,0x2
    5684:	00e60733          	add	a4,a2,a4
    5688:	00171713          	sll	a4,a4,0x1
    568c:	00f70733          	add	a4,a4,a5
    5690:	fd068793          	add	a5,a3,-48
    5694:	00158593          	add	a1,a1,1
    5698:	fef572e3          	bgeu	a0,a5,567c <_vfiprintf_r+0xa64>
    569c:	74074063          	bltz	a4,5ddc <_vfiprintf_r+0x11c4>
    56a0:	00058c93          	mv	s9,a1
    56a4:	ef8ff06f          	j	4d9c <_vfiprintf_r+0x184>
    56a8:	000cc683          	lbu	a3,0(s9)
    56ac:	001ded93          	or	s11,s11,1
    56b0:	ee8ff06f          	j	4d98 <_vfiprintf_r+0x180>
    56b4:	04314783          	lbu	a5,67(sp)
    56b8:	000cc683          	lbu	a3,0(s9)
    56bc:	ec079e63          	bnez	a5,4d98 <_vfiprintf_r+0x180>
    56c0:	02000793          	li	a5,32
    56c4:	04f101a3          	sb	a5,67(sp)
    56c8:	ed0ff06f          	j	4d98 <_vfiprintf_r+0x180>
    56cc:	02d00613          	li	a2,45
    56d0:	01b036b3          	snez	a3,s11
    56d4:	41a000b3          	neg	ra,s10
    56d8:	04c101a3          	sb	a2,67(sp)
    56dc:	40d08d33          	sub	s10,ra,a3
    56e0:	41b00db3          	neg	s11,s11
    56e4:	00074463          	bltz	a4,56ec <_vfiprintf_r+0xad4>
    56e8:	f7fe7e13          	and	t3,t3,-129
    56ec:	120d14e3          	bnez	s10,6014 <_vfiprintf_r+0x13fc>
    56f0:	00900693          	li	a3,9
    56f4:	13b6e0e3          	bltu	a3,s11,6014 <_vfiprintf_r+0x13fc>
    56f8:	030d8793          	add	a5,s11,48
    56fc:	0ff7f793          	zext.b	a5,a5
    5700:	10f107a3          	sb	a5,271(sp)
    5704:	00070e93          	mv	t4,a4
    5708:	00e04463          	bgtz	a4,5710 <_vfiprintf_r+0xaf8>
    570c:	00100e93          	li	t4,1
    5710:	00100d13          	li	s10,1
    5714:	10f10813          	add	a6,sp,271
    5718:	04314783          	lbu	a5,67(sp)
    571c:	00012823          	sw	zero,16(sp)
    5720:	cc079ce3          	bnez	a5,53f8 <_vfiprintf_r+0x7e0>
    5724:	cd9ff06f          	j	53fc <_vfiprintf_r+0x7e4>
    5728:	00100713          	li	a4,1
    572c:	000d0793          	mv	a5,s10
    5730:	07012623          	sw	a6,108(sp)
    5734:	07a12823          	sw	s10,112(sp)
    5738:	07a12423          	sw	s10,104(sp)
    573c:	06e12223          	sw	a4,100(sp)
    5740:	000a0c13          	mv	s8,s4
    5744:	008c0c13          	add	s8,s8,8
    5748:	809ff06f          	j	4f50 <_vfiprintf_r+0x338>
    574c:	00100613          	li	a2,1
    5750:	00000693          	li	a3,0
    5754:	000a0593          	mv	a1,s4
    5758:	a65ff06f          	j	51bc <_vfiprintf_r+0x5a4>
    575c:	41d88db3          	sub	s11,a7,t4
    5760:	f9b05a63          	blez	s11,4ef4 <_vfiprintf_r+0x2dc>
    5764:	01000593          	li	a1,16
    5768:	3bb5dae3          	bge	a1,s11,631c <_vfiprintf_r+0x1704>
    576c:	0000af97          	auipc	t6,0xa
    5770:	e40f8f93          	add	t6,t6,-448 # f5ac <zeroes.0>
    5774:	02e12223          	sw	a4,36(sp)
    5778:	000a8713          	mv	a4,s5
    577c:	000c0693          	mv	a3,s8
    5780:	000d8a93          	mv	s5,s11
    5784:	01000f13          	li	t5,16
    5788:	00700293          	li	t0,7
    578c:	01c12c23          	sw	t3,24(sp)
    5790:	01012e23          	sw	a6,28(sp)
    5794:	03112023          	sw	a7,32(sp)
    5798:	03d12423          	sw	t4,40(sp)
    579c:	000f8c13          	mv	s8,t6
    57a0:	00070d93          	mv	s11,a4
    57a4:	0180006f          	j	57bc <_vfiprintf_r+0xba4>
    57a8:	00260513          	add	a0,a2,2
    57ac:	00868693          	add	a3,a3,8
    57b0:	00070613          	mv	a2,a4
    57b4:	ff0a8a93          	add	s5,s5,-16
    57b8:	055f5c63          	bge	t5,s5,5810 <_vfiprintf_r+0xbf8>
    57bc:	01078793          	add	a5,a5,16
    57c0:	00160713          	add	a4,a2,1
    57c4:	0186a023          	sw	s8,0(a3)
    57c8:	01e6a223          	sw	t5,4(a3)
    57cc:	06f12423          	sw	a5,104(sp)
    57d0:	06e12223          	sw	a4,100(sp)
    57d4:	fce2dae3          	bge	t0,a4,57a8 <_vfiprintf_r+0xb90>
    57d8:	1c078663          	beqz	a5,59a4 <_vfiprintf_r+0xd8c>
    57dc:	06010613          	add	a2,sp,96
    57e0:	00098593          	mv	a1,s3
    57e4:	00040513          	mv	a0,s0
    57e8:	af4ff0ef          	jal	4adc <__sprint_r.part.0>
    57ec:	8e051ee3          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    57f0:	06412603          	lw	a2,100(sp)
    57f4:	01000f13          	li	t5,16
    57f8:	ff0a8a93          	add	s5,s5,-16
    57fc:	06812783          	lw	a5,104(sp)
    5800:	000a0693          	mv	a3,s4
    5804:	00160513          	add	a0,a2,1
    5808:	00700293          	li	t0,7
    580c:	fb5f48e3          	blt	t5,s5,57bc <_vfiprintf_r+0xba4>
    5810:	01812e03          	lw	t3,24(sp)
    5814:	01c12803          	lw	a6,28(sp)
    5818:	02012883          	lw	a7,32(sp)
    581c:	02412703          	lw	a4,36(sp)
    5820:	02812e83          	lw	t4,40(sp)
    5824:	000d8613          	mv	a2,s11
    5828:	000c0f93          	mv	t6,s8
    582c:	000a8d93          	mv	s11,s5
    5830:	00068c13          	mv	s8,a3
    5834:	00060a93          	mv	s5,a2
    5838:	01b787b3          	add	a5,a5,s11
    583c:	01fc2023          	sw	t6,0(s8)
    5840:	01bc2223          	sw	s11,4(s8)
    5844:	06f12423          	sw	a5,104(sp)
    5848:	06a12223          	sw	a0,100(sp)
    584c:	00700613          	li	a2,7
    5850:	4ea65863          	bge	a2,a0,5d40 <_vfiprintf_r+0x1128>
    5854:	1a0786e3          	beqz	a5,6200 <_vfiprintf_r+0x15e8>
    5858:	06010613          	add	a2,sp,96
    585c:	00098593          	mv	a1,s3
    5860:	00040513          	mv	a0,s0
    5864:	03d12423          	sw	t4,40(sp)
    5868:	02e12223          	sw	a4,36(sp)
    586c:	03112023          	sw	a7,32(sp)
    5870:	01012e23          	sw	a6,28(sp)
    5874:	01c12c23          	sw	t3,24(sp)
    5878:	a64ff0ef          	jal	4adc <__sprint_r.part.0>
    587c:	860516e3          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    5880:	02412703          	lw	a4,36(sp)
    5884:	06412603          	lw	a2,100(sp)
    5888:	06812783          	lw	a5,104(sp)
    588c:	41a70733          	sub	a4,a4,s10
    5890:	02812e83          	lw	t4,40(sp)
    5894:	02012883          	lw	a7,32(sp)
    5898:	01c12803          	lw	a6,28(sp)
    589c:	01812e03          	lw	t3,24(sp)
    58a0:	000a0c13          	mv	s8,s4
    58a4:	00160f13          	add	t5,a2,1
    58a8:	e4e05a63          	blez	a4,4efc <_vfiprintf_r+0x2e4>
    58ac:	01000593          	li	a1,16
    58b0:	0000af97          	auipc	t6,0xa
    58b4:	cfcf8f93          	add	t6,t6,-772 # f5ac <zeroes.0>
    58b8:	0ae5da63          	bge	a1,a4,596c <_vfiprintf_r+0xd54>
    58bc:	000c0593          	mv	a1,s8
    58c0:	03512423          	sw	s5,40(sp)
    58c4:	01000d93          	li	s11,16
    58c8:	00700293          	li	t0,7
    58cc:	01c12c23          	sw	t3,24(sp)
    58d0:	01012e23          	sw	a6,28(sp)
    58d4:	03112023          	sw	a7,32(sp)
    58d8:	03d12223          	sw	t4,36(sp)
    58dc:	00070a93          	mv	s5,a4
    58e0:	000b0c13          	mv	s8,s6
    58e4:	0180006f          	j	58fc <_vfiprintf_r+0xce4>
    58e8:	00260f13          	add	t5,a2,2
    58ec:	00858593          	add	a1,a1,8
    58f0:	00068613          	mv	a2,a3
    58f4:	ff0a8a93          	add	s5,s5,-16
    58f8:	055dda63          	bge	s11,s5,594c <_vfiprintf_r+0xd34>
    58fc:	01078793          	add	a5,a5,16
    5900:	00160693          	add	a3,a2,1
    5904:	0165a023          	sw	s6,0(a1)
    5908:	01b5a223          	sw	s11,4(a1)
    590c:	06f12423          	sw	a5,104(sp)
    5910:	06d12223          	sw	a3,100(sp)
    5914:	fcd2dae3          	bge	t0,a3,58e8 <_vfiprintf_r+0xcd0>
    5918:	06078e63          	beqz	a5,5994 <_vfiprintf_r+0xd7c>
    591c:	06010613          	add	a2,sp,96
    5920:	00098593          	mv	a1,s3
    5924:	00040513          	mv	a0,s0
    5928:	9b4ff0ef          	jal	4adc <__sprint_r.part.0>
    592c:	fa051e63          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    5930:	06412603          	lw	a2,100(sp)
    5934:	ff0a8a93          	add	s5,s5,-16
    5938:	06812783          	lw	a5,104(sp)
    593c:	000a0593          	mv	a1,s4
    5940:	00160f13          	add	t5,a2,1
    5944:	00700293          	li	t0,7
    5948:	fb5dcae3          	blt	s11,s5,58fc <_vfiprintf_r+0xce4>
    594c:	000a8713          	mv	a4,s5
    5950:	01812e03          	lw	t3,24(sp)
    5954:	01c12803          	lw	a6,28(sp)
    5958:	02012883          	lw	a7,32(sp)
    595c:	02412e83          	lw	t4,36(sp)
    5960:	02812a83          	lw	s5,40(sp)
    5964:	000c0f93          	mv	t6,s8
    5968:	00058c13          	mv	s8,a1
    596c:	00e787b3          	add	a5,a5,a4
    5970:	00ec2223          	sw	a4,4(s8)
    5974:	01fc2023          	sw	t6,0(s8)
    5978:	06f12423          	sw	a5,104(sp)
    597c:	07e12223          	sw	t5,100(sp)
    5980:	00700713          	li	a4,7
    5984:	25e74863          	blt	a4,t5,5bd4 <_vfiprintf_r+0xfbc>
    5988:	008c0c13          	add	s8,s8,8
    598c:	001f0f13          	add	t5,t5,1
    5990:	d6cff06f          	j	4efc <_vfiprintf_r+0x2e4>
    5994:	00100f13          	li	t5,1
    5998:	00000613          	li	a2,0
    599c:	000a0593          	mv	a1,s4
    59a0:	f55ff06f          	j	58f4 <_vfiprintf_r+0xcdc>
    59a4:	00100513          	li	a0,1
    59a8:	00000613          	li	a2,0
    59ac:	000a0693          	mv	a3,s4
    59b0:	e05ff06f          	j	57b4 <_vfiprintf_r+0xb9c>
    59b4:	06078263          	beqz	a5,5a18 <_vfiprintf_r+0xe00>
    59b8:	06010613          	add	a2,sp,96
    59bc:	00098593          	mv	a1,s3
    59c0:	00040513          	mv	a0,s0
    59c4:	03d12e23          	sw	t4,60(sp)
    59c8:	02e12c23          	sw	a4,56(sp)
    59cc:	03112423          	sw	a7,40(sp)
    59d0:	03012223          	sw	a6,36(sp)
    59d4:	02512023          	sw	t0,32(sp)
    59d8:	01f12e23          	sw	t6,28(sp)
    59dc:	01c12c23          	sw	t3,24(sp)
    59e0:	8fcff0ef          	jal	4adc <__sprint_r.part.0>
    59e4:	f0051263          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    59e8:	06412603          	lw	a2,100(sp)
    59ec:	06812783          	lw	a5,104(sp)
    59f0:	03c12e83          	lw	t4,60(sp)
    59f4:	03812703          	lw	a4,56(sp)
    59f8:	02812883          	lw	a7,40(sp)
    59fc:	02412803          	lw	a6,36(sp)
    5a00:	02012283          	lw	t0,32(sp)
    5a04:	01c12f83          	lw	t6,28(sp)
    5a08:	01812e03          	lw	t3,24(sp)
    5a0c:	000a0c13          	mv	s8,s4
    5a10:	00160f13          	add	t5,a2,1
    5a14:	c58ff06f          	j	4e6c <_vfiprintf_r+0x254>
    5a18:	380f8863          	beqz	t6,5da8 <_vfiprintf_r+0x1190>
    5a1c:	04410793          	add	a5,sp,68
    5a20:	06f12623          	sw	a5,108(sp)
    5a24:	00200793          	li	a5,2
    5a28:	06f12823          	sw	a5,112(sp)
    5a2c:	00100f13          	li	t5,1
    5a30:	000a0c13          	mv	s8,s4
    5a34:	000f0613          	mv	a2,t5
    5a38:	008c0c13          	add	s8,s8,8
    5a3c:	001f0f13          	add	t5,t5,1
    5a40:	cacff06f          	j	4eec <_vfiprintf_r+0x2d4>
    5a44:	00200693          	li	a3,2
    5a48:	00050e13          	mv	t3,a0
    5a4c:	aa0684e3          	beqz	a3,54f4 <_vfiprintf_r+0x8dc>
    5a50:	01412503          	lw	a0,20(sp)
    5a54:	11010813          	add	a6,sp,272
    5a58:	00f7f693          	and	a3,a5,15
    5a5c:	00d506b3          	add	a3,a0,a3
    5a60:	0006c603          	lbu	a2,0(a3)
    5a64:	0047d793          	srl	a5,a5,0x4
    5a68:	01c59693          	sll	a3,a1,0x1c
    5a6c:	00f6e7b3          	or	a5,a3,a5
    5a70:	0045d593          	srl	a1,a1,0x4
    5a74:	fec80fa3          	sb	a2,-1(a6)
    5a78:	00b7e6b3          	or	a3,a5,a1
    5a7c:	fff80813          	add	a6,a6,-1
    5a80:	fc069ce3          	bnez	a3,5a58 <_vfiprintf_r+0xe40>
    5a84:	11010793          	add	a5,sp,272
    5a88:	41078d33          	sub	s10,a5,a6
    5a8c:	00070e93          	mv	t4,a4
    5a90:	c9a754e3          	bge	a4,s10,5718 <_vfiprintf_r+0xb00>
    5a94:	000d0e93          	mv	t4,s10
    5a98:	c81ff06f          	j	5718 <_vfiprintf_r+0xb00>
    5a9c:	01000513          	li	a0,16
    5aa0:	01b554e3          	bge	a0,s11,62a8 <_vfiprintf_r+0x1690>
    5aa4:	000a8693          	mv	a3,s5
    5aa8:	0000a317          	auipc	t1,0xa
    5aac:	b1430313          	add	t1,t1,-1260 # f5bc <blanks.1>
    5ab0:	02e12c23          	sw	a4,56(sp)
    5ab4:	000d8a93          	mv	s5,s11
    5ab8:	000c0713          	mv	a4,s8
    5abc:	01000f13          	li	t5,16
    5ac0:	00700393          	li	t2,7
    5ac4:	01c12c23          	sw	t3,24(sp)
    5ac8:	01f12e23          	sw	t6,28(sp)
    5acc:	02512023          	sw	t0,32(sp)
    5ad0:	03012223          	sw	a6,36(sp)
    5ad4:	03112423          	sw	a7,40(sp)
    5ad8:	03d12e23          	sw	t4,60(sp)
    5adc:	00030c13          	mv	s8,t1
    5ae0:	00068d93          	mv	s11,a3
    5ae4:	01c0006f          	j	5b00 <_vfiprintf_r+0xee8>
    5ae8:	00260513          	add	a0,a2,2
    5aec:	00870713          	add	a4,a4,8
    5af0:	00058613          	mv	a2,a1
    5af4:	ff0a8a93          	add	s5,s5,-16
    5af8:	055f5c63          	bge	t5,s5,5b50 <_vfiprintf_r+0xf38>
    5afc:	00160593          	add	a1,a2,1
    5b00:	01078793          	add	a5,a5,16
    5b04:	01872023          	sw	s8,0(a4)
    5b08:	01e72223          	sw	t5,4(a4)
    5b0c:	06f12423          	sw	a5,104(sp)
    5b10:	06b12223          	sw	a1,100(sp)
    5b14:	fcb3dae3          	bge	t2,a1,5ae8 <_vfiprintf_r+0xed0>
    5b18:	08078a63          	beqz	a5,5bac <_vfiprintf_r+0xf94>
    5b1c:	06010613          	add	a2,sp,96
    5b20:	00098593          	mv	a1,s3
    5b24:	00040513          	mv	a0,s0
    5b28:	fb5fe0ef          	jal	4adc <__sprint_r.part.0>
    5b2c:	da051e63          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    5b30:	06412603          	lw	a2,100(sp)
    5b34:	01000f13          	li	t5,16
    5b38:	ff0a8a93          	add	s5,s5,-16
    5b3c:	06812783          	lw	a5,104(sp)
    5b40:	000a0713          	mv	a4,s4
    5b44:	00160513          	add	a0,a2,1
    5b48:	00700393          	li	t2,7
    5b4c:	fb5f48e3          	blt	t5,s5,5afc <_vfiprintf_r+0xee4>
    5b50:	000c0313          	mv	t1,s8
    5b54:	01812e03          	lw	t3,24(sp)
    5b58:	00070c13          	mv	s8,a4
    5b5c:	01c12f83          	lw	t6,28(sp)
    5b60:	02012283          	lw	t0,32(sp)
    5b64:	02412803          	lw	a6,36(sp)
    5b68:	02812883          	lw	a7,40(sp)
    5b6c:	03c12e83          	lw	t4,60(sp)
    5b70:	03812703          	lw	a4,56(sp)
    5b74:	000d8693          	mv	a3,s11
    5b78:	000a8d93          	mv	s11,s5
    5b7c:	00068a93          	mv	s5,a3
    5b80:	01b787b3          	add	a5,a5,s11
    5b84:	006c2023          	sw	t1,0(s8)
    5b88:	01bc2223          	sw	s11,4(s8)
    5b8c:	06f12423          	sw	a5,104(sp)
    5b90:	06a12223          	sw	a0,100(sp)
    5b94:	00700613          	li	a2,7
    5b98:	12a64063          	blt	a2,a0,5cb8 <_vfiprintf_r+0x10a0>
    5b9c:	008c0c13          	add	s8,s8,8
    5ba0:	00150f13          	add	t5,a0,1
    5ba4:	00050613          	mv	a2,a0
    5ba8:	a8cff06f          	j	4e34 <_vfiprintf_r+0x21c>
    5bac:	00000613          	li	a2,0
    5bb0:	00100513          	li	a0,1
    5bb4:	000a0713          	mv	a4,s4
    5bb8:	f3dff06f          	j	5af4 <_vfiprintf_r+0xedc>
    5bbc:	01d8d463          	bge	a7,t4,5bc4 <_vfiprintf_r+0xfac>
    5bc0:	000e8893          	mv	a7,t4
    5bc4:	00c12783          	lw	a5,12(sp)
    5bc8:	011787b3          	add	a5,a5,a7
    5bcc:	00f12623          	sw	a5,12(sp)
    5bd0:	ba8ff06f          	j	4f78 <_vfiprintf_r+0x360>
    5bd4:	b4078ae3          	beqz	a5,5728 <_vfiprintf_r+0xb10>
    5bd8:	06010613          	add	a2,sp,96
    5bdc:	00098593          	mv	a1,s3
    5be0:	00040513          	mv	a0,s0
    5be4:	03d12223          	sw	t4,36(sp)
    5be8:	03112023          	sw	a7,32(sp)
    5bec:	01012e23          	sw	a6,28(sp)
    5bf0:	01c12c23          	sw	t3,24(sp)
    5bf4:	ee9fe0ef          	jal	4adc <__sprint_r.part.0>
    5bf8:	ce051863          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    5bfc:	06412f03          	lw	t5,100(sp)
    5c00:	06812783          	lw	a5,104(sp)
    5c04:	02412e83          	lw	t4,36(sp)
    5c08:	02012883          	lw	a7,32(sp)
    5c0c:	01c12803          	lw	a6,28(sp)
    5c10:	01812e03          	lw	t3,24(sp)
    5c14:	000a0c13          	mv	s8,s4
    5c18:	001f0f13          	add	t5,t5,1
    5c1c:	ae0ff06f          	j	4efc <_vfiprintf_r+0x2e4>
    5c20:	06012223          	sw	zero,100(sp)
    5c24:	000a0c13          	mv	s8,s4
    5c28:	c84ff06f          	j	50ac <_vfiprintf_r+0x494>
    5c2c:	01067693          	and	a3,a2,16
    5c30:	000aa783          	lw	a5,0(s5)
    5c34:	004a8a93          	add	s5,s5,4
    5c38:	12069c63          	bnez	a3,5d70 <_vfiprintf_r+0x1158>
    5c3c:	04067693          	and	a3,a2,64
    5c40:	12068463          	beqz	a3,5d68 <_vfiprintf_r+0x1150>
    5c44:	01079d93          	sll	s11,a5,0x10
    5c48:	010ddd93          	srl	s11,s11,0x10
    5c4c:	00000d13          	li	s10,0
    5c50:	ff4ff06f          	j	5444 <_vfiprintf_r+0x82c>
    5c54:	0106f613          	and	a2,a3,16
    5c58:	000aa783          	lw	a5,0(s5)
    5c5c:	004a8a93          	add	s5,s5,4
    5c60:	12061263          	bnez	a2,5d84 <_vfiprintf_r+0x116c>
    5c64:	0406f613          	and	a2,a3,64
    5c68:	10060a63          	beqz	a2,5d7c <_vfiprintf_r+0x1164>
    5c6c:	01079793          	sll	a5,a5,0x10
    5c70:	0107d793          	srl	a5,a5,0x10
    5c74:	00000593          	li	a1,0
    5c78:	83dff06f          	j	54b4 <_vfiprintf_r+0x89c>
    5c7c:	010e7693          	and	a3,t3,16
    5c80:	000aa783          	lw	a5,0(s5)
    5c84:	004a8a93          	add	s5,s5,4
    5c88:	0c069863          	bnez	a3,5d58 <_vfiprintf_r+0x1140>
    5c8c:	040e7693          	and	a3,t3,64
    5c90:	0c068063          	beqz	a3,5d50 <_vfiprintf_r+0x1138>
    5c94:	01079d93          	sll	s11,a5,0x10
    5c98:	410ddd93          	sra	s11,s11,0x10
    5c9c:	41fddd13          	sra	s10,s11,0x1f
    5ca0:	000d0693          	mv	a3,s10
    5ca4:	f24ff06f          	j	53c8 <_vfiprintf_r+0x7b0>
    5ca8:	00100f13          	li	t5,1
    5cac:	00000613          	li	a2,0
    5cb0:	000a0c13          	mv	s8,s4
    5cb4:	a38ff06f          	j	4eec <_vfiprintf_r+0x2d4>
    5cb8:	1a078463          	beqz	a5,5e60 <_vfiprintf_r+0x1248>
    5cbc:	06010613          	add	a2,sp,96
    5cc0:	00098593          	mv	a1,s3
    5cc4:	00040513          	mv	a0,s0
    5cc8:	03d12e23          	sw	t4,60(sp)
    5ccc:	02e12c23          	sw	a4,56(sp)
    5cd0:	03112423          	sw	a7,40(sp)
    5cd4:	03012223          	sw	a6,36(sp)
    5cd8:	02512023          	sw	t0,32(sp)
    5cdc:	01f12e23          	sw	t6,28(sp)
    5ce0:	01c12c23          	sw	t3,24(sp)
    5ce4:	df9fe0ef          	jal	4adc <__sprint_r.part.0>
    5ce8:	c0051063          	bnez	a0,50e8 <_vfiprintf_r+0x4d0>
    5cec:	06412603          	lw	a2,100(sp)
    5cf0:	06812783          	lw	a5,104(sp)
    5cf4:	03c12e83          	lw	t4,60(sp)
    5cf8:	03812703          	lw	a4,56(sp)
    5cfc:	02812883          	lw	a7,40(sp)
    5d00:	02412803          	lw	a6,36(sp)
    5d04:	02012283          	lw	t0,32(sp)
    5d08:	01c12f83          	lw	t6,28(sp)
    5d0c:	01812e03          	lw	t3,24(sp)
    5d10:	000a0c13          	mv	s8,s4
    5d14:	00160f13          	add	t5,a2,1
    5d18:	91cff06f          	j	4e34 <_vfiprintf_r+0x21c>
    5d1c:	000d8e13          	mv	t3,s11
    5d20:	e88ff06f          	j	53a8 <_vfiprintf_r+0x790>
    5d24:	00000e93          	li	t4,0
    5d28:	11010813          	add	a6,sp,272
    5d2c:	9edff06f          	j	5718 <_vfiprintf_r+0xb00>
    5d30:	0589a503          	lw	a0,88(s3)
    5d34:	8b4fb0ef          	jal	de8 <__retarget_lock_acquire_recursive>
    5d38:	00c99783          	lh	a5,12(s3)
    5d3c:	f41fe06f          	j	4c7c <_vfiprintf_r+0x64>
    5d40:	008c0c13          	add	s8,s8,8
    5d44:	00150f13          	add	t5,a0,1
    5d48:	00050613          	mv	a2,a0
    5d4c:	9a8ff06f          	j	4ef4 <_vfiprintf_r+0x2dc>
    5d50:	200e7693          	and	a3,t3,512
    5d54:	50069463          	bnez	a3,625c <_vfiprintf_r+0x1644>
    5d58:	41f7dd13          	sra	s10,a5,0x1f
    5d5c:	00078d93          	mv	s11,a5
    5d60:	000d0693          	mv	a3,s10
    5d64:	e64ff06f          	j	53c8 <_vfiprintf_r+0x7b0>
    5d68:	20067693          	and	a3,a2,512
    5d6c:	4c069663          	bnez	a3,6238 <_vfiprintf_r+0x1620>
    5d70:	00078d93          	mv	s11,a5
    5d74:	00000d13          	li	s10,0
    5d78:	eccff06f          	j	5444 <_vfiprintf_r+0x82c>
    5d7c:	2006f613          	and	a2,a3,512
    5d80:	4c061863          	bnez	a2,6250 <_vfiprintf_r+0x1638>
    5d84:	00000593          	li	a1,0
    5d88:	f2cff06f          	j	54b4 <_vfiprintf_r+0x89c>
    5d8c:	00c12683          	lw	a3,12(sp)
    5d90:	000aa783          	lw	a5,0(s5)
    5d94:	004a8a93          	add	s5,s5,4
    5d98:	41f6d713          	sra	a4,a3,0x1f
    5d9c:	00d7a023          	sw	a3,0(a5)
    5da0:	00e7a223          	sw	a4,4(a5)
    5da4:	f8dfe06f          	j	4d30 <_vfiprintf_r+0x118>
    5da8:	00000613          	li	a2,0
    5dac:	00100f13          	li	t5,1
    5db0:	000a0c13          	mv	s8,s4
    5db4:	938ff06f          	j	4eec <_vfiprintf_r+0x2d4>
    5db8:	000aa783          	lw	a5,0(s5)
    5dbc:	00100e93          	li	t4,1
    5dc0:	00100d13          	li	s10,1
    5dc4:	0af10623          	sb	a5,172(sp)
    5dc8:	0ac10593          	add	a1,sp,172
    5dcc:	db8ff06f          	j	5384 <_vfiprintf_r+0x76c>
    5dd0:	000d0e93          	mv	t4,s10
    5dd4:	00050813          	mv	a6,a0
    5dd8:	941ff06f          	j	5718 <_vfiprintf_r+0xb00>
    5ddc:	fff00713          	li	a4,-1
    5de0:	00058c93          	mv	s9,a1
    5de4:	fb9fe06f          	j	4d9c <_vfiprintf_r+0x184>
    5de8:	000d8613          	mv	a2,s11
    5dec:	e3cff06f          	j	5428 <_vfiprintf_r+0x810>
    5df0:	00009797          	auipc	a5,0x9
    5df4:	15c78793          	add	a5,a5,348 # ef4c <__fini_array_end+0x1b8>
    5df8:	000d8e13          	mv	t3,s11
    5dfc:	00f12a23          	sw	a5,20(sp)
    5e00:	020e7793          	and	a5,t3,32
    5e04:	1c078c63          	beqz	a5,5fdc <_vfiprintf_r+0x13c4>
    5e08:	007a8a93          	add	s5,s5,7
    5e0c:	ff8afa93          	and	s5,s5,-8
    5e10:	000aa783          	lw	a5,0(s5)
    5e14:	004aa583          	lw	a1,4(s5)
    5e18:	008a8a93          	add	s5,s5,8
    5e1c:	001e7613          	and	a2,t3,1
    5e20:	00060e63          	beqz	a2,5e3c <_vfiprintf_r+0x1224>
    5e24:	00b7e633          	or	a2,a5,a1
    5e28:	00060a63          	beqz	a2,5e3c <_vfiprintf_r+0x1224>
    5e2c:	03000613          	li	a2,48
    5e30:	04c10223          	sb	a2,68(sp)
    5e34:	04d102a3          	sb	a3,69(sp)
    5e38:	002e6e13          	or	t3,t3,2
    5e3c:	bffe7e13          	and	t3,t3,-1025
    5e40:	f3cff06f          	j	557c <_vfiprintf_r+0x964>
    5e44:	000d8693          	mv	a3,s11
    5e48:	e50ff06f          	j	5498 <_vfiprintf_r+0x880>
    5e4c:	00009797          	auipc	a5,0x9
    5e50:	0ec78793          	add	a5,a5,236 # ef38 <__fini_array_end+0x1a4>
    5e54:	000d8e13          	mv	t3,s11
    5e58:	00f12a23          	sw	a5,20(sp)
    5e5c:	fa5ff06f          	j	5e00 <_vfiprintf_r+0x11e8>
    5e60:	04314603          	lbu	a2,67(sp)
    5e64:	3a060a63          	beqz	a2,6218 <_vfiprintf_r+0x1600>
    5e68:	04310793          	add	a5,sp,67
    5e6c:	06f12623          	sw	a5,108(sp)
    5e70:	00100793          	li	a5,1
    5e74:	06f12823          	sw	a5,112(sp)
    5e78:	00100f13          	li	t5,1
    5e7c:	000a0c13          	mv	s8,s4
    5e80:	fe1fe06f          	j	4e60 <_vfiprintf_r+0x248>
    5e84:	00800613          	li	a2,8
    5e88:	00000593          	li	a1,0
    5e8c:	05810513          	add	a0,sp,88
    5e90:	02e12023          	sw	a4,32(sp)
    5e94:	01112e23          	sw	a7,28(sp)
    5e98:	01c12c23          	sw	t3,24(sp)
    5e9c:	05012623          	sw	a6,76(sp)
    5ea0:	01012823          	sw	a6,16(sp)
    5ea4:	f4dfa0ef          	jal	df0 <memset>
    5ea8:	02012703          	lw	a4,32(sp)
    5eac:	01012803          	lw	a6,16(sp)
    5eb0:	01812e03          	lw	t3,24(sp)
    5eb4:	01c12883          	lw	a7,28(sp)
    5eb8:	2a074463          	bltz	a4,6160 <_vfiprintf_r+0x1548>
    5ebc:	00000d93          	li	s11,0
    5ec0:	00000d13          	li	s10,0
    5ec4:	01812823          	sw	s8,16(sp)
    5ec8:	01012e23          	sw	a6,28(sp)
    5ecc:	000d8c13          	mv	s8,s11
    5ed0:	03112023          	sw	a7,32(sp)
    5ed4:	000c8d93          	mv	s11,s9
    5ed8:	000a8c93          	mv	s9,s5
    5edc:	000d0a93          	mv	s5,s10
    5ee0:	00098d13          	mv	s10,s3
    5ee4:	00070993          	mv	s3,a4
    5ee8:	0300006f          	j	5f18 <_vfiprintf_r+0x1300>
    5eec:	05810693          	add	a3,sp,88
    5ef0:	0ac10593          	add	a1,sp,172
    5ef4:	00040513          	mv	a0,s0
    5ef8:	2f5040ef          	jal	a9ec <_wcrtomb_r>
    5efc:	fff00793          	li	a5,-1
    5f00:	48f50063          	beq	a0,a5,6380 <_vfiprintf_r+0x1768>
    5f04:	00aa87b3          	add	a5,s5,a0
    5f08:	02f9c063          	blt	s3,a5,5f28 <_vfiprintf_r+0x1310>
    5f0c:	004c0c13          	add	s8,s8,4
    5f10:	45378463          	beq	a5,s3,6358 <_vfiprintf_r+0x1740>
    5f14:	00078a93          	mv	s5,a5
    5f18:	04c12783          	lw	a5,76(sp)
    5f1c:	018787b3          	add	a5,a5,s8
    5f20:	0007a603          	lw	a2,0(a5)
    5f24:	fc0614e3          	bnez	a2,5eec <_vfiprintf_r+0x12d4>
    5f28:	01012c03          	lw	s8,16(sp)
    5f2c:	01812e03          	lw	t3,24(sp)
    5f30:	01c12803          	lw	a6,28(sp)
    5f34:	02012883          	lw	a7,32(sp)
    5f38:	000d0993          	mv	s3,s10
    5f3c:	000a8d13          	mv	s10,s5
    5f40:	000c8a93          	mv	s5,s9
    5f44:	000d8c93          	mv	s9,s11
    5f48:	280d0e63          	beqz	s10,61e4 <_vfiprintf_r+0x15cc>
    5f4c:	06300793          	li	a5,99
    5f50:	33a7d463          	bge	a5,s10,6278 <_vfiprintf_r+0x1660>
    5f54:	001d0593          	add	a1,s10,1
    5f58:	00040513          	mv	a0,s0
    5f5c:	01112c23          	sw	a7,24(sp)
    5f60:	01c12823          	sw	t3,16(sp)
    5f64:	de8fb0ef          	jal	154c <_malloc_r>
    5f68:	01012e03          	lw	t3,16(sp)
    5f6c:	01812883          	lw	a7,24(sp)
    5f70:	00050813          	mv	a6,a0
    5f74:	42050063          	beqz	a0,6394 <_vfiprintf_r+0x177c>
    5f78:	00a12823          	sw	a0,16(sp)
    5f7c:	00800613          	li	a2,8
    5f80:	00000593          	li	a1,0
    5f84:	05810513          	add	a0,sp,88
    5f88:	03112023          	sw	a7,32(sp)
    5f8c:	01c12e23          	sw	t3,28(sp)
    5f90:	01012c23          	sw	a6,24(sp)
    5f94:	e5dfa0ef          	jal	df0 <memset>
    5f98:	01812803          	lw	a6,24(sp)
    5f9c:	05810713          	add	a4,sp,88
    5fa0:	000d0693          	mv	a3,s10
    5fa4:	00080593          	mv	a1,a6
    5fa8:	04c10613          	add	a2,sp,76
    5fac:	00040513          	mv	a0,s0
    5fb0:	2c9040ef          	jal	aa78 <_wcsrtombs_r>
    5fb4:	01812803          	lw	a6,24(sp)
    5fb8:	01c12e03          	lw	t3,28(sp)
    5fbc:	02012883          	lw	a7,32(sp)
    5fc0:	40ad1063          	bne	s10,a0,63c0 <_vfiprintf_r+0x17a8>
    5fc4:	fffd4e93          	not	t4,s10
    5fc8:	01a807b3          	add	a5,a6,s10
    5fcc:	41fede93          	sra	t4,t4,0x1f
    5fd0:	00078023          	sb	zero,0(a5)
    5fd4:	01dd7eb3          	and	t4,s10,t4
    5fd8:	2140006f          	j	61ec <_vfiprintf_r+0x15d4>
    5fdc:	010e7613          	and	a2,t3,16
    5fe0:	000aa783          	lw	a5,0(s5)
    5fe4:	004a8a93          	add	s5,s5,4
    5fe8:	02061263          	bnez	a2,600c <_vfiprintf_r+0x13f4>
    5fec:	040e7613          	and	a2,t3,64
    5ff0:	00060a63          	beqz	a2,6004 <_vfiprintf_r+0x13ec>
    5ff4:	01079793          	sll	a5,a5,0x10
    5ff8:	0107d793          	srl	a5,a5,0x10
    5ffc:	00000593          	li	a1,0
    6000:	e1dff06f          	j	5e1c <_vfiprintf_r+0x1204>
    6004:	200e7613          	and	a2,t3,512
    6008:	22061e63          	bnez	a2,6244 <_vfiprintf_r+0x162c>
    600c:	00000593          	li	a1,0
    6010:	e0dff06f          	j	5e1c <_vfiprintf_r+0x1204>
    6014:	400e7793          	and	a5,t3,1024
    6018:	00000693          	li	a3,0
    601c:	11010e93          	add	t4,sp,272
    6020:	01812823          	sw	s8,16(sp)
    6024:	02812223          	sw	s0,36(sp)
    6028:	03912c23          	sw	s9,56(sp)
    602c:	03512e23          	sw	s5,60(sp)
    6030:	02c12c83          	lw	s9,44(sp)
    6034:	01c12c23          	sw	t3,24(sp)
    6038:	01112e23          	sw	a7,28(sp)
    603c:	02e12023          	sw	a4,32(sp)
    6040:	00078c13          	mv	s8,a5
    6044:	00068413          	mv	s0,a3
    6048:	03312423          	sw	s3,40(sp)
    604c:	000e8a93          	mv	s5,t4
    6050:	0280006f          	j	6078 <_vfiprintf_r+0x1460>
    6054:	00a00613          	li	a2,10
    6058:	00000693          	li	a3,0
    605c:	000d8513          	mv	a0,s11
    6060:	000d0593          	mv	a1,s10
    6064:	364050ef          	jal	b3c8 <__udivdi3>
    6068:	220d0a63          	beqz	s10,629c <_vfiprintf_r+0x1684>
    606c:	00050d93          	mv	s11,a0
    6070:	00058d13          	mv	s10,a1
    6074:	00098a93          	mv	s5,s3
    6078:	00a00613          	li	a2,10
    607c:	00000693          	li	a3,0
    6080:	000d8513          	mv	a0,s11
    6084:	000d0593          	mv	a1,s10
    6088:	1ed050ef          	jal	ba74 <__umoddi3>
    608c:	03050513          	add	a0,a0,48
    6090:	feaa8fa3          	sb	a0,-1(s5)
    6094:	fffa8993          	add	s3,s5,-1
    6098:	00140413          	add	s0,s0,1
    609c:	fa0c0ce3          	beqz	s8,6054 <_vfiprintf_r+0x143c>
    60a0:	000cc783          	lbu	a5,0(s9)
    60a4:	fa8798e3          	bne	a5,s0,6054 <_vfiprintf_r+0x143c>
    60a8:	0ff00793          	li	a5,255
    60ac:	faf404e3          	beq	s0,a5,6054 <_vfiprintf_r+0x143c>
    60b0:	0e0d1a63          	bnez	s10,61a4 <_vfiprintf_r+0x158c>
    60b4:	00900793          	li	a5,9
    60b8:	0fb7e663          	bltu	a5,s11,61a4 <_vfiprintf_r+0x158c>
    60bc:	00098813          	mv	a6,s3
    60c0:	03912623          	sw	s9,44(sp)
    60c4:	01012c03          	lw	s8,16(sp)
    60c8:	01812e03          	lw	t3,24(sp)
    60cc:	01c12883          	lw	a7,28(sp)
    60d0:	02012703          	lw	a4,32(sp)
    60d4:	02412403          	lw	s0,36(sp)
    60d8:	02812983          	lw	s3,40(sp)
    60dc:	03812c83          	lw	s9,56(sp)
    60e0:	03c12a83          	lw	s5,60(sp)
    60e4:	9a1ff06f          	j	5a84 <_vfiprintf_r+0xe6c>
    60e8:	00068e13          	mv	t3,a3
    60ec:	00000693          	li	a3,0
    60f0:	c0068263          	beqz	a3,54f4 <_vfiprintf_r+0x8dc>
    60f4:	95dff06f          	j	5a50 <_vfiprintf_r+0xe38>
    60f8:	00040513          	mv	a0,s0
    60fc:	115000ef          	jal	6a10 <__sinit>
    6100:	b61fe06f          	j	4c60 <_vfiprintf_r+0x48>
    6104:	001cc683          	lbu	a3,1(s9)
    6108:	200ded93          	or	s11,s11,512
    610c:	001c8c93          	add	s9,s9,1
    6110:	c89fe06f          	j	4d98 <_vfiprintf_r+0x180>
    6114:	001cc683          	lbu	a3,1(s9)
    6118:	020ded93          	or	s11,s11,32
    611c:	001c8c93          	add	s9,s9,1
    6120:	c79fe06f          	j	4d98 <_vfiprintf_r+0x180>
    6124:	000aa783          	lw	a5,0(s5)
    6128:	00c12703          	lw	a4,12(sp)
    612c:	004a8a93          	add	s5,s5,4
    6130:	00e7a023          	sw	a4,0(a5)
    6134:	bfdfe06f          	j	4d30 <_vfiprintf_r+0x118>
    6138:	00600793          	li	a5,6
    613c:	00070d13          	mv	s10,a4
    6140:	0ce7e863          	bltu	a5,a4,6210 <_vfiprintf_r+0x15f8>
    6144:	000d0e93          	mv	t4,s10
    6148:	00009817          	auipc	a6,0x9
    614c:	e1880813          	add	a6,a6,-488 # ef60 <__fini_array_end+0x1cc>
    6150:	cb9fe06f          	j	4e08 <_vfiprintf_r+0x1f0>
    6154:	00000793          	li	a5,0
    6158:	00000593          	li	a1,0
    615c:	8f5ff06f          	j	5a50 <_vfiprintf_r+0xe38>
    6160:	05810713          	add	a4,sp,88
    6164:	00000693          	li	a3,0
    6168:	04c10613          	add	a2,sp,76
    616c:	00000593          	li	a1,0
    6170:	00040513          	mv	a0,s0
    6174:	01112e23          	sw	a7,28(sp)
    6178:	01012c23          	sw	a6,24(sp)
    617c:	01c12823          	sw	t3,16(sp)
    6180:	0f9040ef          	jal	aa78 <_wcsrtombs_r>
    6184:	fff00793          	li	a5,-1
    6188:	01012e03          	lw	t3,16(sp)
    618c:	01812803          	lw	a6,24(sp)
    6190:	01c12883          	lw	a7,28(sp)
    6194:	00050d13          	mv	s10,a0
    6198:	1ef50e63          	beq	a0,a5,6394 <_vfiprintf_r+0x177c>
    619c:	05012623          	sw	a6,76(sp)
    61a0:	da9ff06f          	j	5f48 <_vfiprintf_r+0x1330>
    61a4:	03012783          	lw	a5,48(sp)
    61a8:	03412583          	lw	a1,52(sp)
    61ac:	00000413          	li	s0,0
    61b0:	40f989b3          	sub	s3,s3,a5
    61b4:	00078613          	mv	a2,a5
    61b8:	00098513          	mv	a0,s3
    61bc:	6c8010ef          	jal	7884 <strncpy>
    61c0:	001cc783          	lbu	a5,1(s9)
    61c4:	00a00613          	li	a2,10
    61c8:	00000693          	li	a3,0
    61cc:	00f037b3          	snez	a5,a5
    61d0:	000d8513          	mv	a0,s11
    61d4:	000d0593          	mv	a1,s10
    61d8:	00fc8cb3          	add	s9,s9,a5
    61dc:	1ec050ef          	jal	b3c8 <__udivdi3>
    61e0:	e8dff06f          	j	606c <_vfiprintf_r+0x1454>
    61e4:	00000e93          	li	t4,0
    61e8:	00012823          	sw	zero,16(sp)
    61ec:	04314783          	lbu	a5,67(sp)
    61f0:	00000713          	li	a4,0
    61f4:	00000f93          	li	t6,0
    61f8:	a0079063          	bnez	a5,53f8 <_vfiprintf_r+0x7e0>
    61fc:	c19fe06f          	j	4e14 <_vfiprintf_r+0x1fc>
    6200:	00100f13          	li	t5,1
    6204:	00000613          	li	a2,0
    6208:	000a0c13          	mv	s8,s4
    620c:	ce9fe06f          	j	4ef4 <_vfiprintf_r+0x2dc>
    6210:	00600d13          	li	s10,6
    6214:	f31ff06f          	j	6144 <_vfiprintf_r+0x152c>
    6218:	00100f13          	li	t5,1
    621c:	000a0c13          	mv	s8,s4
    6220:	c4dfe06f          	j	4e6c <_vfiprintf_r+0x254>
    6224:	000aa783          	lw	a5,0(s5)
    6228:	00c12703          	lw	a4,12(sp)
    622c:	004a8a93          	add	s5,s5,4
    6230:	00e79023          	sh	a4,0(a5)
    6234:	afdfe06f          	j	4d30 <_vfiprintf_r+0x118>
    6238:	0ff7fd93          	zext.b	s11,a5
    623c:	00000d13          	li	s10,0
    6240:	a04ff06f          	j	5444 <_vfiprintf_r+0x82c>
    6244:	0ff7f793          	zext.b	a5,a5
    6248:	00000593          	li	a1,0
    624c:	bd1ff06f          	j	5e1c <_vfiprintf_r+0x1204>
    6250:	0ff7f793          	zext.b	a5,a5
    6254:	00000593          	li	a1,0
    6258:	a5cff06f          	j	54b4 <_vfiprintf_r+0x89c>
    625c:	01879d93          	sll	s11,a5,0x18
    6260:	418ddd93          	sra	s11,s11,0x18
    6264:	41fddd13          	sra	s10,s11,0x1f
    6268:	000d0693          	mv	a3,s10
    626c:	95cff06f          	j	53c8 <_vfiprintf_r+0x7b0>
    6270:	03000793          	li	a5,48
    6274:	c8cff06f          	j	5700 <_vfiprintf_r+0xae8>
    6278:	00012823          	sw	zero,16(sp)
    627c:	0ac10813          	add	a6,sp,172
    6280:	cfdff06f          	j	5f7c <_vfiprintf_r+0x1364>
    6284:	0589a503          	lw	a0,88(s3)
    6288:	b65fa0ef          	jal	dec <__retarget_lock_release_recursive>
    628c:	d51fe06f          	j	4fdc <_vfiprintf_r+0x3c4>
    6290:	00070e93          	mv	t4,a4
    6294:	00070d13          	mv	s10,a4
    6298:	f55ff06f          	j	61ec <_vfiprintf_r+0x15d4>
    629c:	00900793          	li	a5,9
    62a0:	ddb7e6e3          	bltu	a5,s11,606c <_vfiprintf_r+0x1454>
    62a4:	e19ff06f          	j	60bc <_vfiprintf_r+0x14a4>
    62a8:	00058513          	mv	a0,a1
    62ac:	00009317          	auipc	t1,0x9
    62b0:	31030313          	add	t1,t1,784 # f5bc <blanks.1>
    62b4:	8cdff06f          	j	5b80 <_vfiprintf_r+0xf68>
    62b8:	00080513          	mv	a0,a6
    62bc:	03112023          	sw	a7,32(sp)
    62c0:	01012c23          	sw	a6,24(sp)
    62c4:	01b12e23          	sw	s11,28(sp)
    62c8:	da9fa0ef          	jal	1070 <strlen>
    62cc:	fff54e93          	not	t4,a0
    62d0:	41fede93          	sra	t4,t4,0x1f
    62d4:	01812803          	lw	a6,24(sp)
    62d8:	01c12e03          	lw	t3,28(sp)
    62dc:	02012883          	lw	a7,32(sp)
    62e0:	00050d13          	mv	s10,a0
    62e4:	01d57eb3          	and	t4,a0,t4
    62e8:	00012823          	sw	zero,16(sp)
    62ec:	f01ff06f          	j	61ec <_vfiprintf_r+0x15d4>
    62f0:	06010613          	add	a2,sp,96
    62f4:	00098593          	mv	a1,s3
    62f8:	00040513          	mv	a0,s0
    62fc:	fe0fe0ef          	jal	4adc <__sprint_r.part.0>
    6300:	00051463          	bnez	a0,6308 <_vfiprintf_r+0x16f0>
    6304:	dc5fe06f          	j	50c8 <_vfiprintf_r+0x4b0>
    6308:	df5fe06f          	j	50fc <_vfiprintf_r+0x4e4>
    630c:	00168613          	add	a2,a3,1
    6310:	00009317          	auipc	t1,0x9
    6314:	2ac30313          	add	t1,t1,684 # f5bc <blanks.1>
    6318:	f19fe06f          	j	5230 <_vfiprintf_r+0x618>
    631c:	000f0513          	mv	a0,t5
    6320:	00009f97          	auipc	t6,0x9
    6324:	28cf8f93          	add	t6,t6,652 # f5ac <zeroes.0>
    6328:	d10ff06f          	j	5838 <_vfiprintf_r+0xc20>
    632c:	0649a783          	lw	a5,100(s3)
    6330:	0017f793          	and	a5,a5,1
    6334:	00079c63          	bnez	a5,634c <_vfiprintf_r+0x1734>
    6338:	00c9d783          	lhu	a5,12(s3)
    633c:	2007f793          	and	a5,a5,512
    6340:	00079663          	bnez	a5,634c <_vfiprintf_r+0x1734>
    6344:	0589a503          	lw	a0,88(s3)
    6348:	aa5fa0ef          	jal	dec <__retarget_lock_release_recursive>
    634c:	fff00793          	li	a5,-1
    6350:	00f12623          	sw	a5,12(sp)
    6354:	de5fe06f          	j	5138 <_vfiprintf_r+0x520>
    6358:	00098713          	mv	a4,s3
    635c:	000c8a93          	mv	s5,s9
    6360:	000d0993          	mv	s3,s10
    6364:	01012c03          	lw	s8,16(sp)
    6368:	01812e03          	lw	t3,24(sp)
    636c:	01c12803          	lw	a6,28(sp)
    6370:	02012883          	lw	a7,32(sp)
    6374:	000d8c93          	mv	s9,s11
    6378:	00070d13          	mv	s10,a4
    637c:	bcdff06f          	j	5f48 <_vfiprintf_r+0x1330>
    6380:	00cd1783          	lh	a5,12(s10)
    6384:	000d0993          	mv	s3,s10
    6388:	0407e793          	or	a5,a5,64
    638c:	00fd1623          	sh	a5,12(s10)
    6390:	d71fe06f          	j	5100 <_vfiprintf_r+0x4e8>
    6394:	00c99783          	lh	a5,12(s3)
    6398:	0407e793          	or	a5,a5,64
    639c:	00f99623          	sh	a5,12(s3)
    63a0:	d61fe06f          	j	5100 <_vfiprintf_r+0x4e8>
    63a4:	000aa703          	lw	a4,0(s5)
    63a8:	004a8a93          	add	s5,s5,4
    63ac:	00075463          	bgez	a4,63b4 <_vfiprintf_r+0x179c>
    63b0:	fff00713          	li	a4,-1
    63b4:	001cc683          	lbu	a3,1(s9)
    63b8:	00058c93          	mv	s9,a1
    63bc:	9ddfe06f          	j	4d98 <_vfiprintf_r+0x180>
    63c0:	00c9d783          	lhu	a5,12(s3)
    63c4:	0407e793          	or	a5,a5,64
    63c8:	00f99623          	sh	a5,12(s3)
    63cc:	d1dfe06f          	j	50e8 <_vfiprintf_r+0x4d0>

000063d0 <__sbprintf>:
    63d0:	b7010113          	add	sp,sp,-1168
    63d4:	00c59783          	lh	a5,12(a1)
    63d8:	00e5d703          	lhu	a4,14(a1)
    63dc:	48812423          	sw	s0,1160(sp)
    63e0:	00058413          	mv	s0,a1
    63e4:	000105b7          	lui	a1,0x10
    63e8:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x7f5>
    63ec:	06442303          	lw	t1,100(s0)
    63f0:	01c42883          	lw	a7,28(s0)
    63f4:	02442803          	lw	a6,36(s0)
    63f8:	01071713          	sll	a4,a4,0x10
    63fc:	00b7f7b3          	and	a5,a5,a1
    6400:	00e7e7b3          	or	a5,a5,a4
    6404:	40000593          	li	a1,1024
    6408:	49212023          	sw	s2,1152(sp)
    640c:	00f12a23          	sw	a5,20(sp)
    6410:	00050913          	mv	s2,a0
    6414:	07010793          	add	a5,sp,112
    6418:	06010513          	add	a0,sp,96
    641c:	48112623          	sw	ra,1164(sp)
    6420:	48912223          	sw	s1,1156(sp)
    6424:	47312e23          	sw	s3,1148(sp)
    6428:	00060493          	mv	s1,a2
    642c:	00068993          	mv	s3,a3
    6430:	06612623          	sw	t1,108(sp)
    6434:	03112223          	sw	a7,36(sp)
    6438:	03012623          	sw	a6,44(sp)
    643c:	00f12423          	sw	a5,8(sp)
    6440:	00f12c23          	sw	a5,24(sp)
    6444:	00b12823          	sw	a1,16(sp)
    6448:	00b12e23          	sw	a1,28(sp)
    644c:	02012023          	sw	zero,32(sp)
    6450:	991fa0ef          	jal	de0 <__retarget_lock_init_recursive>
    6454:	00048613          	mv	a2,s1
    6458:	00098693          	mv	a3,s3
    645c:	00810593          	add	a1,sp,8
    6460:	00090513          	mv	a0,s2
    6464:	fb4fe0ef          	jal	4c18 <_vfiprintf_r>
    6468:	00050493          	mv	s1,a0
    646c:	04055263          	bgez	a0,64b0 <__sbprintf+0xe0>
    6470:	01415783          	lhu	a5,20(sp)
    6474:	0407f793          	and	a5,a5,64
    6478:	00078863          	beqz	a5,6488 <__sbprintf+0xb8>
    647c:	00c45783          	lhu	a5,12(s0)
    6480:	0407e793          	or	a5,a5,64
    6484:	00f41623          	sh	a5,12(s0)
    6488:	06012503          	lw	a0,96(sp)
    648c:	959fa0ef          	jal	de4 <__retarget_lock_close_recursive>
    6490:	48c12083          	lw	ra,1164(sp)
    6494:	48812403          	lw	s0,1160(sp)
    6498:	48012903          	lw	s2,1152(sp)
    649c:	47c12983          	lw	s3,1148(sp)
    64a0:	00048513          	mv	a0,s1
    64a4:	48412483          	lw	s1,1156(sp)
    64a8:	49010113          	add	sp,sp,1168
    64ac:	00008067          	ret
    64b0:	00810593          	add	a1,sp,8
    64b4:	00090513          	mv	a0,s2
    64b8:	25c000ef          	jal	6714 <_fflush_r>
    64bc:	fa050ae3          	beqz	a0,6470 <__sbprintf+0xa0>
    64c0:	fff00493          	li	s1,-1
    64c4:	fadff06f          	j	6470 <__sbprintf+0xa0>

000064c8 <__sflush_r>:
    64c8:	00c59703          	lh	a4,12(a1)
    64cc:	fe010113          	add	sp,sp,-32
    64d0:	00812c23          	sw	s0,24(sp)
    64d4:	01312623          	sw	s3,12(sp)
    64d8:	00112e23          	sw	ra,28(sp)
    64dc:	00877793          	and	a5,a4,8
    64e0:	00058413          	mv	s0,a1
    64e4:	00050993          	mv	s3,a0
    64e8:	12079063          	bnez	a5,6608 <__sflush_r+0x140>
    64ec:	000017b7          	lui	a5,0x1
    64f0:	80078793          	add	a5,a5,-2048 # 800 <main+0x530>
    64f4:	0045a683          	lw	a3,4(a1)
    64f8:	00f767b3          	or	a5,a4,a5
    64fc:	00f59623          	sh	a5,12(a1)
    6500:	18d05263          	blez	a3,6684 <__sflush_r+0x1bc>
    6504:	02842803          	lw	a6,40(s0)
    6508:	0e080463          	beqz	a6,65f0 <__sflush_r+0x128>
    650c:	00912a23          	sw	s1,20(sp)
    6510:	01371693          	sll	a3,a4,0x13
    6514:	0009a483          	lw	s1,0(s3)
    6518:	0009a023          	sw	zero,0(s3)
    651c:	01c42583          	lw	a1,28(s0)
    6520:	1606ce63          	bltz	a3,669c <__sflush_r+0x1d4>
    6524:	00000613          	li	a2,0
    6528:	00100693          	li	a3,1
    652c:	00098513          	mv	a0,s3
    6530:	000800e7          	jalr	a6
    6534:	fff00793          	li	a5,-1
    6538:	00050613          	mv	a2,a0
    653c:	1af50463          	beq	a0,a5,66e4 <__sflush_r+0x21c>
    6540:	00c41783          	lh	a5,12(s0)
    6544:	02842803          	lw	a6,40(s0)
    6548:	01c42583          	lw	a1,28(s0)
    654c:	0047f793          	and	a5,a5,4
    6550:	00078e63          	beqz	a5,656c <__sflush_r+0xa4>
    6554:	00442703          	lw	a4,4(s0)
    6558:	03042783          	lw	a5,48(s0)
    655c:	40e60633          	sub	a2,a2,a4
    6560:	00078663          	beqz	a5,656c <__sflush_r+0xa4>
    6564:	03c42783          	lw	a5,60(s0)
    6568:	40f60633          	sub	a2,a2,a5
    656c:	00000693          	li	a3,0
    6570:	00098513          	mv	a0,s3
    6574:	000800e7          	jalr	a6
    6578:	fff00793          	li	a5,-1
    657c:	12f51463          	bne	a0,a5,66a4 <__sflush_r+0x1dc>
    6580:	0009a683          	lw	a3,0(s3)
    6584:	01d00793          	li	a5,29
    6588:	00c41703          	lh	a4,12(s0)
    658c:	16d7ea63          	bltu	a5,a3,6700 <__sflush_r+0x238>
    6590:	204007b7          	lui	a5,0x20400
    6594:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    6598:	00d7d7b3          	srl	a5,a5,a3
    659c:	0017f793          	and	a5,a5,1
    65a0:	16078063          	beqz	a5,6700 <__sflush_r+0x238>
    65a4:	01042603          	lw	a2,16(s0)
    65a8:	fffff7b7          	lui	a5,0xfffff
    65ac:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    65b0:	00f777b3          	and	a5,a4,a5
    65b4:	00f41623          	sh	a5,12(s0)
    65b8:	00042223          	sw	zero,4(s0)
    65bc:	00c42023          	sw	a2,0(s0)
    65c0:	01371793          	sll	a5,a4,0x13
    65c4:	0007d463          	bgez	a5,65cc <__sflush_r+0x104>
    65c8:	10068263          	beqz	a3,66cc <__sflush_r+0x204>
    65cc:	03042583          	lw	a1,48(s0)
    65d0:	0099a023          	sw	s1,0(s3)
    65d4:	10058463          	beqz	a1,66dc <__sflush_r+0x214>
    65d8:	04040793          	add	a5,s0,64
    65dc:	00f58663          	beq	a1,a5,65e8 <__sflush_r+0x120>
    65e0:	00098513          	mv	a0,s3
    65e4:	c5dfa0ef          	jal	1240 <_free_r>
    65e8:	01412483          	lw	s1,20(sp)
    65ec:	02042823          	sw	zero,48(s0)
    65f0:	00000513          	li	a0,0
    65f4:	01c12083          	lw	ra,28(sp)
    65f8:	01812403          	lw	s0,24(sp)
    65fc:	00c12983          	lw	s3,12(sp)
    6600:	02010113          	add	sp,sp,32
    6604:	00008067          	ret
    6608:	01212823          	sw	s2,16(sp)
    660c:	0105a903          	lw	s2,16(a1)
    6610:	08090263          	beqz	s2,6694 <__sflush_r+0x1cc>
    6614:	00912a23          	sw	s1,20(sp)
    6618:	0005a483          	lw	s1,0(a1)
    661c:	00377713          	and	a4,a4,3
    6620:	0125a023          	sw	s2,0(a1)
    6624:	412484b3          	sub	s1,s1,s2
    6628:	00000793          	li	a5,0
    662c:	00071463          	bnez	a4,6634 <__sflush_r+0x16c>
    6630:	0145a783          	lw	a5,20(a1)
    6634:	00f42423          	sw	a5,8(s0)
    6638:	00904863          	bgtz	s1,6648 <__sflush_r+0x180>
    663c:	0540006f          	j	6690 <__sflush_r+0x1c8>
    6640:	00a90933          	add	s2,s2,a0
    6644:	04905663          	blez	s1,6690 <__sflush_r+0x1c8>
    6648:	02442783          	lw	a5,36(s0)
    664c:	01c42583          	lw	a1,28(s0)
    6650:	00048693          	mv	a3,s1
    6654:	00090613          	mv	a2,s2
    6658:	00098513          	mv	a0,s3
    665c:	000780e7          	jalr	a5
    6660:	40a484b3          	sub	s1,s1,a0
    6664:	fca04ee3          	bgtz	a0,6640 <__sflush_r+0x178>
    6668:	00c41703          	lh	a4,12(s0)
    666c:	01012903          	lw	s2,16(sp)
    6670:	04076713          	or	a4,a4,64
    6674:	01412483          	lw	s1,20(sp)
    6678:	00e41623          	sh	a4,12(s0)
    667c:	fff00513          	li	a0,-1
    6680:	f75ff06f          	j	65f4 <__sflush_r+0x12c>
    6684:	03c5a683          	lw	a3,60(a1)
    6688:	e6d04ee3          	bgtz	a3,6504 <__sflush_r+0x3c>
    668c:	f65ff06f          	j	65f0 <__sflush_r+0x128>
    6690:	01412483          	lw	s1,20(sp)
    6694:	01012903          	lw	s2,16(sp)
    6698:	f59ff06f          	j	65f0 <__sflush_r+0x128>
    669c:	05042603          	lw	a2,80(s0)
    66a0:	eadff06f          	j	654c <__sflush_r+0x84>
    66a4:	00c41703          	lh	a4,12(s0)
    66a8:	01042683          	lw	a3,16(s0)
    66ac:	fffff7b7          	lui	a5,0xfffff
    66b0:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    66b4:	00f777b3          	and	a5,a4,a5
    66b8:	00f41623          	sh	a5,12(s0)
    66bc:	00042223          	sw	zero,4(s0)
    66c0:	00d42023          	sw	a3,0(s0)
    66c4:	01371793          	sll	a5,a4,0x13
    66c8:	f007d2e3          	bgez	a5,65cc <__sflush_r+0x104>
    66cc:	03042583          	lw	a1,48(s0)
    66d0:	04a42823          	sw	a0,80(s0)
    66d4:	0099a023          	sw	s1,0(s3)
    66d8:	f00590e3          	bnez	a1,65d8 <__sflush_r+0x110>
    66dc:	01412483          	lw	s1,20(sp)
    66e0:	f11ff06f          	j	65f0 <__sflush_r+0x128>
    66e4:	0009a783          	lw	a5,0(s3)
    66e8:	e4078ce3          	beqz	a5,6540 <__sflush_r+0x78>
    66ec:	01d00713          	li	a4,29
    66f0:	00e78c63          	beq	a5,a4,6708 <__sflush_r+0x240>
    66f4:	01600713          	li	a4,22
    66f8:	00e78863          	beq	a5,a4,6708 <__sflush_r+0x240>
    66fc:	00c41703          	lh	a4,12(s0)
    6700:	04076713          	or	a4,a4,64
    6704:	f71ff06f          	j	6674 <__sflush_r+0x1ac>
    6708:	0099a023          	sw	s1,0(s3)
    670c:	01412483          	lw	s1,20(sp)
    6710:	ee1ff06f          	j	65f0 <__sflush_r+0x128>

00006714 <_fflush_r>:
    6714:	ff010113          	add	sp,sp,-16
    6718:	00812423          	sw	s0,8(sp)
    671c:	00912223          	sw	s1,4(sp)
    6720:	00112623          	sw	ra,12(sp)
    6724:	01212023          	sw	s2,0(sp)
    6728:	00050493          	mv	s1,a0
    672c:	00058413          	mv	s0,a1
    6730:	00050663          	beqz	a0,673c <_fflush_r+0x28>
    6734:	03452783          	lw	a5,52(a0)
    6738:	0a078a63          	beqz	a5,67ec <_fflush_r+0xd8>
    673c:	00c41783          	lh	a5,12(s0)
    6740:	00000913          	li	s2,0
    6744:	04078063          	beqz	a5,6784 <_fflush_r+0x70>
    6748:	06442703          	lw	a4,100(s0)
    674c:	00177713          	and	a4,a4,1
    6750:	00071663          	bnez	a4,675c <_fflush_r+0x48>
    6754:	2007f793          	and	a5,a5,512
    6758:	04078463          	beqz	a5,67a0 <_fflush_r+0x8c>
    675c:	00040593          	mv	a1,s0
    6760:	00048513          	mv	a0,s1
    6764:	d65ff0ef          	jal	64c8 <__sflush_r>
    6768:	06442783          	lw	a5,100(s0)
    676c:	00050913          	mv	s2,a0
    6770:	0017f793          	and	a5,a5,1
    6774:	00079863          	bnez	a5,6784 <_fflush_r+0x70>
    6778:	00c45783          	lhu	a5,12(s0)
    677c:	2007f793          	and	a5,a5,512
    6780:	04078463          	beqz	a5,67c8 <_fflush_r+0xb4>
    6784:	00c12083          	lw	ra,12(sp)
    6788:	00812403          	lw	s0,8(sp)
    678c:	00412483          	lw	s1,4(sp)
    6790:	00090513          	mv	a0,s2
    6794:	00012903          	lw	s2,0(sp)
    6798:	01010113          	add	sp,sp,16
    679c:	00008067          	ret
    67a0:	05842503          	lw	a0,88(s0)
    67a4:	e44fa0ef          	jal	de8 <__retarget_lock_acquire_recursive>
    67a8:	00040593          	mv	a1,s0
    67ac:	00048513          	mv	a0,s1
    67b0:	d19ff0ef          	jal	64c8 <__sflush_r>
    67b4:	06442783          	lw	a5,100(s0)
    67b8:	00050913          	mv	s2,a0
    67bc:	0017f793          	and	a5,a5,1
    67c0:	fc0792e3          	bnez	a5,6784 <_fflush_r+0x70>
    67c4:	fb5ff06f          	j	6778 <_fflush_r+0x64>
    67c8:	05842503          	lw	a0,88(s0)
    67cc:	e20fa0ef          	jal	dec <__retarget_lock_release_recursive>
    67d0:	00c12083          	lw	ra,12(sp)
    67d4:	00812403          	lw	s0,8(sp)
    67d8:	00412483          	lw	s1,4(sp)
    67dc:	00090513          	mv	a0,s2
    67e0:	00012903          	lw	s2,0(sp)
    67e4:	01010113          	add	sp,sp,16
    67e8:	00008067          	ret
    67ec:	224000ef          	jal	6a10 <__sinit>
    67f0:	f4dff06f          	j	673c <_fflush_r+0x28>

000067f4 <stdio_exit_handler>:
    67f4:	7fffa617          	auipc	a2,0x7fffa
    67f8:	d3460613          	add	a2,a2,-716 # 80000528 <__sglue>
    67fc:	00004597          	auipc	a1,0x4
    6800:	28c58593          	add	a1,a1,652 # aa88 <_fclose_r>
    6804:	7fff9517          	auipc	a0,0x7fff9
    6808:	7fc50513          	add	a0,a0,2044 # 80000000 <_impure_data>
    680c:	7a00006f          	j	6fac <_fwalk_sglue>

00006810 <cleanup_stdio>:
    6810:	00452583          	lw	a1,4(a0)
    6814:	ff010113          	add	sp,sp,-16
    6818:	00812423          	sw	s0,8(sp)
    681c:	00112623          	sw	ra,12(sp)
    6820:	7fffa797          	auipc	a5,0x7fffa
    6824:	33c78793          	add	a5,a5,828 # 80000b5c <__sf>
    6828:	00050413          	mv	s0,a0
    682c:	00f58463          	beq	a1,a5,6834 <cleanup_stdio+0x24>
    6830:	258040ef          	jal	aa88 <_fclose_r>
    6834:	00842583          	lw	a1,8(s0)
    6838:	7fffa797          	auipc	a5,0x7fffa
    683c:	38c78793          	add	a5,a5,908 # 80000bc4 <__sf+0x68>
    6840:	00f58663          	beq	a1,a5,684c <cleanup_stdio+0x3c>
    6844:	00040513          	mv	a0,s0
    6848:	240040ef          	jal	aa88 <_fclose_r>
    684c:	00c42583          	lw	a1,12(s0)
    6850:	7fffa797          	auipc	a5,0x7fffa
    6854:	3dc78793          	add	a5,a5,988 # 80000c2c <__sf+0xd0>
    6858:	00f58c63          	beq	a1,a5,6870 <cleanup_stdio+0x60>
    685c:	00040513          	mv	a0,s0
    6860:	00812403          	lw	s0,8(sp)
    6864:	00c12083          	lw	ra,12(sp)
    6868:	01010113          	add	sp,sp,16
    686c:	21c0406f          	j	aa88 <_fclose_r>
    6870:	00c12083          	lw	ra,12(sp)
    6874:	00812403          	lw	s0,8(sp)
    6878:	01010113          	add	sp,sp,16
    687c:	00008067          	ret

00006880 <global_stdio_init.part.0>:
    6880:	fe010113          	add	sp,sp,-32
    6884:	00000797          	auipc	a5,0x0
    6888:	f7078793          	add	a5,a5,-144 # 67f4 <stdio_exit_handler>
    688c:	00112e23          	sw	ra,28(sp)
    6890:	00812c23          	sw	s0,24(sp)
    6894:	00912a23          	sw	s1,20(sp)
    6898:	7fffa417          	auipc	s0,0x7fffa
    689c:	2c440413          	add	s0,s0,708 # 80000b5c <__sf>
    68a0:	01212823          	sw	s2,16(sp)
    68a4:	01312623          	sw	s3,12(sp)
    68a8:	01412423          	sw	s4,8(sp)
    68ac:	00800613          	li	a2,8
    68b0:	00000593          	li	a1,0
    68b4:	7fffa717          	auipc	a4,0x7fffa
    68b8:	e6f72e23          	sw	a5,-388(a4) # 80000730 <__stdio_exit_handler>
    68bc:	7fffa517          	auipc	a0,0x7fffa
    68c0:	2fc50513          	add	a0,a0,764 # 80000bb8 <__sf+0x5c>
    68c4:	00400793          	li	a5,4
    68c8:	00f42623          	sw	a5,12(s0)
    68cc:	00042023          	sw	zero,0(s0)
    68d0:	00042223          	sw	zero,4(s0)
    68d4:	00042423          	sw	zero,8(s0)
    68d8:	06042223          	sw	zero,100(s0)
    68dc:	00042823          	sw	zero,16(s0)
    68e0:	00042a23          	sw	zero,20(s0)
    68e4:	00042c23          	sw	zero,24(s0)
    68e8:	d08fa0ef          	jal	df0 <memset>
    68ec:	00001a17          	auipc	s4,0x1
    68f0:	870a0a13          	add	s4,s4,-1936 # 715c <__sread>
    68f4:	00001997          	auipc	s3,0x1
    68f8:	8c498993          	add	s3,s3,-1852 # 71b8 <__swrite>
    68fc:	00001917          	auipc	s2,0x1
    6900:	94490913          	add	s2,s2,-1724 # 7240 <__sseek>
    6904:	00001497          	auipc	s1,0x1
    6908:	9b448493          	add	s1,s1,-1612 # 72b8 <__sclose>
    690c:	7fffa517          	auipc	a0,0x7fffa
    6910:	2a850513          	add	a0,a0,680 # 80000bb4 <__sf+0x58>
    6914:	03442023          	sw	s4,32(s0)
    6918:	03342223          	sw	s3,36(s0)
    691c:	03242423          	sw	s2,40(s0)
    6920:	02942623          	sw	s1,44(s0)
    6924:	00842e23          	sw	s0,28(s0)
    6928:	cb8fa0ef          	jal	de0 <__retarget_lock_init_recursive>
    692c:	000107b7          	lui	a5,0x10
    6930:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x801>
    6934:	00800613          	li	a2,8
    6938:	00000593          	li	a1,0
    693c:	7fffa517          	auipc	a0,0x7fffa
    6940:	2e450513          	add	a0,a0,740 # 80000c20 <__sf+0xc4>
    6944:	06f42a23          	sw	a5,116(s0)
    6948:	06042423          	sw	zero,104(s0)
    694c:	06042623          	sw	zero,108(s0)
    6950:	06042823          	sw	zero,112(s0)
    6954:	0c042623          	sw	zero,204(s0)
    6958:	06042c23          	sw	zero,120(s0)
    695c:	06042e23          	sw	zero,124(s0)
    6960:	08042023          	sw	zero,128(s0)
    6964:	c8cfa0ef          	jal	df0 <memset>
    6968:	7fffa797          	auipc	a5,0x7fffa
    696c:	25c78793          	add	a5,a5,604 # 80000bc4 <__sf+0x68>
    6970:	7fffa517          	auipc	a0,0x7fffa
    6974:	2ac50513          	add	a0,a0,684 # 80000c1c <__sf+0xc0>
    6978:	08f42223          	sw	a5,132(s0)
    697c:	09442423          	sw	s4,136(s0)
    6980:	09342623          	sw	s3,140(s0)
    6984:	09242823          	sw	s2,144(s0)
    6988:	08942a23          	sw	s1,148(s0)
    698c:	c54fa0ef          	jal	de0 <__retarget_lock_init_recursive>
    6990:	000207b7          	lui	a5,0x20
    6994:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6998:	00800613          	li	a2,8
    699c:	00000593          	li	a1,0
    69a0:	7fffa517          	auipc	a0,0x7fffa
    69a4:	2e850513          	add	a0,a0,744 # 80000c88 <__sf+0x12c>
    69a8:	0cf42e23          	sw	a5,220(s0)
    69ac:	0c042823          	sw	zero,208(s0)
    69b0:	0c042a23          	sw	zero,212(s0)
    69b4:	0c042c23          	sw	zero,216(s0)
    69b8:	12042a23          	sw	zero,308(s0)
    69bc:	0e042023          	sw	zero,224(s0)
    69c0:	0e042223          	sw	zero,228(s0)
    69c4:	0e042423          	sw	zero,232(s0)
    69c8:	c28fa0ef          	jal	df0 <memset>
    69cc:	7fffa797          	auipc	a5,0x7fffa
    69d0:	26078793          	add	a5,a5,608 # 80000c2c <__sf+0xd0>
    69d4:	0f442823          	sw	s4,240(s0)
    69d8:	0f342a23          	sw	s3,244(s0)
    69dc:	0f242c23          	sw	s2,248(s0)
    69e0:	0e942e23          	sw	s1,252(s0)
    69e4:	0ef42623          	sw	a5,236(s0)
    69e8:	01812403          	lw	s0,24(sp)
    69ec:	01c12083          	lw	ra,28(sp)
    69f0:	01412483          	lw	s1,20(sp)
    69f4:	01012903          	lw	s2,16(sp)
    69f8:	00c12983          	lw	s3,12(sp)
    69fc:	00812a03          	lw	s4,8(sp)
    6a00:	7fffa517          	auipc	a0,0x7fffa
    6a04:	28450513          	add	a0,a0,644 # 80000c84 <__sf+0x128>
    6a08:	02010113          	add	sp,sp,32
    6a0c:	bd4fa06f          	j	de0 <__retarget_lock_init_recursive>

00006a10 <__sinit>:
    6a10:	ff010113          	add	sp,sp,-16
    6a14:	00812423          	sw	s0,8(sp)
    6a18:	00050413          	mv	s0,a0
    6a1c:	7fffa517          	auipc	a0,0x7fffa
    6a20:	d0450513          	add	a0,a0,-764 # 80000720 <__lock___sfp_recursive_mutex>
    6a24:	00112623          	sw	ra,12(sp)
    6a28:	bc0fa0ef          	jal	de8 <__retarget_lock_acquire_recursive>
    6a2c:	03442783          	lw	a5,52(s0)
    6a30:	00079e63          	bnez	a5,6a4c <__sinit+0x3c>
    6a34:	00000797          	auipc	a5,0x0
    6a38:	ddc78793          	add	a5,a5,-548 # 6810 <cleanup_stdio>
    6a3c:	02f42a23          	sw	a5,52(s0)
    6a40:	7fffa797          	auipc	a5,0x7fffa
    6a44:	cf07a783          	lw	a5,-784(a5) # 80000730 <__stdio_exit_handler>
    6a48:	00078e63          	beqz	a5,6a64 <__sinit+0x54>
    6a4c:	00812403          	lw	s0,8(sp)
    6a50:	00c12083          	lw	ra,12(sp)
    6a54:	7fffa517          	auipc	a0,0x7fffa
    6a58:	ccc50513          	add	a0,a0,-820 # 80000720 <__lock___sfp_recursive_mutex>
    6a5c:	01010113          	add	sp,sp,16
    6a60:	b8cfa06f          	j	dec <__retarget_lock_release_recursive>
    6a64:	e1dff0ef          	jal	6880 <global_stdio_init.part.0>
    6a68:	00812403          	lw	s0,8(sp)
    6a6c:	00c12083          	lw	ra,12(sp)
    6a70:	7fffa517          	auipc	a0,0x7fffa
    6a74:	cb050513          	add	a0,a0,-848 # 80000720 <__lock___sfp_recursive_mutex>
    6a78:	01010113          	add	sp,sp,16
    6a7c:	b70fa06f          	j	dec <__retarget_lock_release_recursive>

00006a80 <__sfp_lock_acquire>:
    6a80:	7fffa517          	auipc	a0,0x7fffa
    6a84:	ca050513          	add	a0,a0,-864 # 80000720 <__lock___sfp_recursive_mutex>
    6a88:	b60fa06f          	j	de8 <__retarget_lock_acquire_recursive>

00006a8c <__sfp_lock_release>:
    6a8c:	7fffa517          	auipc	a0,0x7fffa
    6a90:	c9450513          	add	a0,a0,-876 # 80000720 <__lock___sfp_recursive_mutex>
    6a94:	b58fa06f          	j	dec <__retarget_lock_release_recursive>

00006a98 <__sfvwrite_r>:
    6a98:	00862783          	lw	a5,8(a2)
    6a9c:	2c078463          	beqz	a5,6d64 <__sfvwrite_r+0x2cc>
    6aa0:	00c59683          	lh	a3,12(a1)
    6aa4:	fd010113          	add	sp,sp,-48
    6aa8:	02812423          	sw	s0,40(sp)
    6aac:	01412c23          	sw	s4,24(sp)
    6ab0:	01612823          	sw	s6,16(sp)
    6ab4:	02112623          	sw	ra,44(sp)
    6ab8:	0086f793          	and	a5,a3,8
    6abc:	00060b13          	mv	s6,a2
    6ac0:	00050a13          	mv	s4,a0
    6ac4:	00058413          	mv	s0,a1
    6ac8:	08078e63          	beqz	a5,6b64 <__sfvwrite_r+0xcc>
    6acc:	0105a783          	lw	a5,16(a1)
    6ad0:	08078a63          	beqz	a5,6b64 <__sfvwrite_r+0xcc>
    6ad4:	02912223          	sw	s1,36(sp)
    6ad8:	03212023          	sw	s2,32(sp)
    6adc:	01312e23          	sw	s3,28(sp)
    6ae0:	01512a23          	sw	s5,20(sp)
    6ae4:	0026f793          	and	a5,a3,2
    6ae8:	000b2483          	lw	s1,0(s6)
    6aec:	0a078463          	beqz	a5,6b94 <__sfvwrite_r+0xfc>
    6af0:	02442783          	lw	a5,36(s0)
    6af4:	01c42583          	lw	a1,28(s0)
    6af8:	80000ab7          	lui	s5,0x80000
    6afc:	00000993          	li	s3,0
    6b00:	00000913          	li	s2,0
    6b04:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6b08:	00098613          	mv	a2,s3
    6b0c:	000a0513          	mv	a0,s4
    6b10:	04090263          	beqz	s2,6b54 <__sfvwrite_r+0xbc>
    6b14:	00090693          	mv	a3,s2
    6b18:	012af463          	bgeu	s5,s2,6b20 <__sfvwrite_r+0x88>
    6b1c:	000a8693          	mv	a3,s5
    6b20:	000780e7          	jalr	a5
    6b24:	46a05263          	blez	a0,6f88 <__sfvwrite_r+0x4f0>
    6b28:	008b2783          	lw	a5,8(s6)
    6b2c:	00a989b3          	add	s3,s3,a0
    6b30:	40a90933          	sub	s2,s2,a0
    6b34:	40a787b3          	sub	a5,a5,a0
    6b38:	00fb2423          	sw	a5,8(s6)
    6b3c:	1a078663          	beqz	a5,6ce8 <__sfvwrite_r+0x250>
    6b40:	02442783          	lw	a5,36(s0)
    6b44:	01c42583          	lw	a1,28(s0)
    6b48:	00098613          	mv	a2,s3
    6b4c:	000a0513          	mv	a0,s4
    6b50:	fc0912e3          	bnez	s2,6b14 <__sfvwrite_r+0x7c>
    6b54:	0004a983          	lw	s3,0(s1)
    6b58:	0044a903          	lw	s2,4(s1)
    6b5c:	00848493          	add	s1,s1,8
    6b60:	fa9ff06f          	j	6b08 <__sfvwrite_r+0x70>
    6b64:	00040593          	mv	a1,s0
    6b68:	000a0513          	mv	a0,s4
    6b6c:	0e5000ef          	jal	7450 <__swsetup_r>
    6b70:	1c051c63          	bnez	a0,6d48 <__sfvwrite_r+0x2b0>
    6b74:	00c41683          	lh	a3,12(s0)
    6b78:	02912223          	sw	s1,36(sp)
    6b7c:	03212023          	sw	s2,32(sp)
    6b80:	01312e23          	sw	s3,28(sp)
    6b84:	01512a23          	sw	s5,20(sp)
    6b88:	0026f793          	and	a5,a3,2
    6b8c:	000b2483          	lw	s1,0(s6)
    6b90:	f60790e3          	bnez	a5,6af0 <__sfvwrite_r+0x58>
    6b94:	01712623          	sw	s7,12(sp)
    6b98:	01812423          	sw	s8,8(sp)
    6b9c:	0016f793          	and	a5,a3,1
    6ba0:	1c079663          	bnez	a5,6d6c <__sfvwrite_r+0x2d4>
    6ba4:	00042783          	lw	a5,0(s0)
    6ba8:	00842703          	lw	a4,8(s0)
    6bac:	80000ab7          	lui	s5,0x80000
    6bb0:	01912223          	sw	s9,4(sp)
    6bb4:	00000b93          	li	s7,0
    6bb8:	00000993          	li	s3,0
    6bbc:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6bc0:	00078513          	mv	a0,a5
    6bc4:	00070c13          	mv	s8,a4
    6bc8:	10098263          	beqz	s3,6ccc <__sfvwrite_r+0x234>
    6bcc:	2006f613          	and	a2,a3,512
    6bd0:	28060863          	beqz	a2,6e60 <__sfvwrite_r+0x3c8>
    6bd4:	00070c93          	mv	s9,a4
    6bd8:	32e9e863          	bltu	s3,a4,6f08 <__sfvwrite_r+0x470>
    6bdc:	4806f713          	and	a4,a3,1152
    6be0:	08070a63          	beqz	a4,6c74 <__sfvwrite_r+0x1dc>
    6be4:	01442603          	lw	a2,20(s0)
    6be8:	01042583          	lw	a1,16(s0)
    6bec:	00161713          	sll	a4,a2,0x1
    6bf0:	00c70733          	add	a4,a4,a2
    6bf4:	40b78933          	sub	s2,a5,a1
    6bf8:	01f75c13          	srl	s8,a4,0x1f
    6bfc:	00ec0c33          	add	s8,s8,a4
    6c00:	00190793          	add	a5,s2,1
    6c04:	401c5c13          	sra	s8,s8,0x1
    6c08:	013787b3          	add	a5,a5,s3
    6c0c:	000c0613          	mv	a2,s8
    6c10:	00fc7663          	bgeu	s8,a5,6c1c <__sfvwrite_r+0x184>
    6c14:	00078c13          	mv	s8,a5
    6c18:	00078613          	mv	a2,a5
    6c1c:	4006f693          	and	a3,a3,1024
    6c20:	32068063          	beqz	a3,6f40 <__sfvwrite_r+0x4a8>
    6c24:	00060593          	mv	a1,a2
    6c28:	000a0513          	mv	a0,s4
    6c2c:	921fa0ef          	jal	154c <_malloc_r>
    6c30:	00050c93          	mv	s9,a0
    6c34:	34050e63          	beqz	a0,6f90 <__sfvwrite_r+0x4f8>
    6c38:	01042583          	lw	a1,16(s0)
    6c3c:	00090613          	mv	a2,s2
    6c40:	a8cfa0ef          	jal	ecc <memcpy>
    6c44:	00c45783          	lhu	a5,12(s0)
    6c48:	b7f7f793          	and	a5,a5,-1153
    6c4c:	0807e793          	or	a5,a5,128
    6c50:	00f41623          	sh	a5,12(s0)
    6c54:	012c8533          	add	a0,s9,s2
    6c58:	412c07b3          	sub	a5,s8,s2
    6c5c:	01942823          	sw	s9,16(s0)
    6c60:	01842a23          	sw	s8,20(s0)
    6c64:	00a42023          	sw	a0,0(s0)
    6c68:	00098c13          	mv	s8,s3
    6c6c:	00f42423          	sw	a5,8(s0)
    6c70:	00098c93          	mv	s9,s3
    6c74:	000c8613          	mv	a2,s9
    6c78:	000b8593          	mv	a1,s7
    6c7c:	6a9000ef          	jal	7b24 <memmove>
    6c80:	00842703          	lw	a4,8(s0)
    6c84:	00042783          	lw	a5,0(s0)
    6c88:	00098913          	mv	s2,s3
    6c8c:	41870733          	sub	a4,a4,s8
    6c90:	019787b3          	add	a5,a5,s9
    6c94:	00e42423          	sw	a4,8(s0)
    6c98:	00f42023          	sw	a5,0(s0)
    6c9c:	00000993          	li	s3,0
    6ca0:	008b2783          	lw	a5,8(s6)
    6ca4:	012b8bb3          	add	s7,s7,s2
    6ca8:	412787b3          	sub	a5,a5,s2
    6cac:	00fb2423          	sw	a5,8(s6)
    6cb0:	02078663          	beqz	a5,6cdc <__sfvwrite_r+0x244>
    6cb4:	00042783          	lw	a5,0(s0)
    6cb8:	00842703          	lw	a4,8(s0)
    6cbc:	00c41683          	lh	a3,12(s0)
    6cc0:	00078513          	mv	a0,a5
    6cc4:	00070c13          	mv	s8,a4
    6cc8:	f00992e3          	bnez	s3,6bcc <__sfvwrite_r+0x134>
    6ccc:	0004ab83          	lw	s7,0(s1)
    6cd0:	0044a983          	lw	s3,4(s1)
    6cd4:	00848493          	add	s1,s1,8
    6cd8:	ee9ff06f          	j	6bc0 <__sfvwrite_r+0x128>
    6cdc:	00c12b83          	lw	s7,12(sp)
    6ce0:	00812c03          	lw	s8,8(sp)
    6ce4:	00412c83          	lw	s9,4(sp)
    6ce8:	02c12083          	lw	ra,44(sp)
    6cec:	02812403          	lw	s0,40(sp)
    6cf0:	02412483          	lw	s1,36(sp)
    6cf4:	02012903          	lw	s2,32(sp)
    6cf8:	01c12983          	lw	s3,28(sp)
    6cfc:	01412a83          	lw	s5,20(sp)
    6d00:	01812a03          	lw	s4,24(sp)
    6d04:	01012b03          	lw	s6,16(sp)
    6d08:	00000513          	li	a0,0
    6d0c:	03010113          	add	sp,sp,48
    6d10:	00008067          	ret
    6d14:	00040593          	mv	a1,s0
    6d18:	000a0513          	mv	a0,s4
    6d1c:	9f9ff0ef          	jal	6714 <_fflush_r>
    6d20:	0a050e63          	beqz	a0,6ddc <__sfvwrite_r+0x344>
    6d24:	00c41783          	lh	a5,12(s0)
    6d28:	00c12b83          	lw	s7,12(sp)
    6d2c:	00812c03          	lw	s8,8(sp)
    6d30:	02412483          	lw	s1,36(sp)
    6d34:	02012903          	lw	s2,32(sp)
    6d38:	01c12983          	lw	s3,28(sp)
    6d3c:	01412a83          	lw	s5,20(sp)
    6d40:	0407e793          	or	a5,a5,64
    6d44:	00f41623          	sh	a5,12(s0)
    6d48:	02c12083          	lw	ra,44(sp)
    6d4c:	02812403          	lw	s0,40(sp)
    6d50:	01812a03          	lw	s4,24(sp)
    6d54:	01012b03          	lw	s6,16(sp)
    6d58:	fff00513          	li	a0,-1
    6d5c:	03010113          	add	sp,sp,48
    6d60:	00008067          	ret
    6d64:	00000513          	li	a0,0
    6d68:	00008067          	ret
    6d6c:	00000a93          	li	s5,0
    6d70:	00000513          	li	a0,0
    6d74:	00000c13          	li	s8,0
    6d78:	00000993          	li	s3,0
    6d7c:	08098263          	beqz	s3,6e00 <__sfvwrite_r+0x368>
    6d80:	08050a63          	beqz	a0,6e14 <__sfvwrite_r+0x37c>
    6d84:	000a8793          	mv	a5,s5
    6d88:	00098b93          	mv	s7,s3
    6d8c:	0137f463          	bgeu	a5,s3,6d94 <__sfvwrite_r+0x2fc>
    6d90:	00078b93          	mv	s7,a5
    6d94:	00042503          	lw	a0,0(s0)
    6d98:	01042783          	lw	a5,16(s0)
    6d9c:	00842903          	lw	s2,8(s0)
    6da0:	01442683          	lw	a3,20(s0)
    6da4:	00a7f663          	bgeu	a5,a0,6db0 <__sfvwrite_r+0x318>
    6da8:	00d90933          	add	s2,s2,a3
    6dac:	09794463          	blt	s2,s7,6e34 <__sfvwrite_r+0x39c>
    6db0:	16dbc263          	blt	s7,a3,6f14 <__sfvwrite_r+0x47c>
    6db4:	02442783          	lw	a5,36(s0)
    6db8:	01c42583          	lw	a1,28(s0)
    6dbc:	000c0613          	mv	a2,s8
    6dc0:	000a0513          	mv	a0,s4
    6dc4:	000780e7          	jalr	a5
    6dc8:	00050913          	mv	s2,a0
    6dcc:	f4a05ce3          	blez	a0,6d24 <__sfvwrite_r+0x28c>
    6dd0:	412a8ab3          	sub	s5,s5,s2
    6dd4:	00100513          	li	a0,1
    6dd8:	f20a8ee3          	beqz	s5,6d14 <__sfvwrite_r+0x27c>
    6ddc:	008b2783          	lw	a5,8(s6)
    6de0:	012c0c33          	add	s8,s8,s2
    6de4:	412989b3          	sub	s3,s3,s2
    6de8:	412787b3          	sub	a5,a5,s2
    6dec:	00fb2423          	sw	a5,8(s6)
    6df0:	f80796e3          	bnez	a5,6d7c <__sfvwrite_r+0x2e4>
    6df4:	00c12b83          	lw	s7,12(sp)
    6df8:	00812c03          	lw	s8,8(sp)
    6dfc:	eedff06f          	j	6ce8 <__sfvwrite_r+0x250>
    6e00:	0044a983          	lw	s3,4(s1)
    6e04:	00048793          	mv	a5,s1
    6e08:	00848493          	add	s1,s1,8
    6e0c:	fe098ae3          	beqz	s3,6e00 <__sfvwrite_r+0x368>
    6e10:	0007ac03          	lw	s8,0(a5)
    6e14:	00098613          	mv	a2,s3
    6e18:	00a00593          	li	a1,10
    6e1c:	000c0513          	mv	a0,s8
    6e20:	1a1000ef          	jal	77c0 <memchr>
    6e24:	14050c63          	beqz	a0,6f7c <__sfvwrite_r+0x4e4>
    6e28:	00150513          	add	a0,a0,1
    6e2c:	41850ab3          	sub	s5,a0,s8
    6e30:	f55ff06f          	j	6d84 <__sfvwrite_r+0x2ec>
    6e34:	000c0593          	mv	a1,s8
    6e38:	00090613          	mv	a2,s2
    6e3c:	4e9000ef          	jal	7b24 <memmove>
    6e40:	00042783          	lw	a5,0(s0)
    6e44:	00040593          	mv	a1,s0
    6e48:	000a0513          	mv	a0,s4
    6e4c:	012787b3          	add	a5,a5,s2
    6e50:	00f42023          	sw	a5,0(s0)
    6e54:	8c1ff0ef          	jal	6714 <_fflush_r>
    6e58:	f6050ce3          	beqz	a0,6dd0 <__sfvwrite_r+0x338>
    6e5c:	ec9ff06f          	j	6d24 <__sfvwrite_r+0x28c>
    6e60:	01042683          	lw	a3,16(s0)
    6e64:	04f6e463          	bltu	a3,a5,6eac <__sfvwrite_r+0x414>
    6e68:	01442583          	lw	a1,20(s0)
    6e6c:	04b9e063          	bltu	s3,a1,6eac <__sfvwrite_r+0x414>
    6e70:	00098913          	mv	s2,s3
    6e74:	013af463          	bgeu	s5,s3,6e7c <__sfvwrite_r+0x3e4>
    6e78:	000a8913          	mv	s2,s5
    6e7c:	00090513          	mv	a0,s2
    6e80:	65d070ef          	jal	ecdc <__modsi3>
    6e84:	02442783          	lw	a5,36(s0)
    6e88:	01c42583          	lw	a1,28(s0)
    6e8c:	40a906b3          	sub	a3,s2,a0
    6e90:	000b8613          	mv	a2,s7
    6e94:	000a0513          	mv	a0,s4
    6e98:	000780e7          	jalr	a5
    6e9c:	00050913          	mv	s2,a0
    6ea0:	04a05a63          	blez	a0,6ef4 <__sfvwrite_r+0x45c>
    6ea4:	412989b3          	sub	s3,s3,s2
    6ea8:	df9ff06f          	j	6ca0 <__sfvwrite_r+0x208>
    6eac:	00070913          	mv	s2,a4
    6eb0:	00e9f463          	bgeu	s3,a4,6eb8 <__sfvwrite_r+0x420>
    6eb4:	00098913          	mv	s2,s3
    6eb8:	00078513          	mv	a0,a5
    6ebc:	00090613          	mv	a2,s2
    6ec0:	000b8593          	mv	a1,s7
    6ec4:	461000ef          	jal	7b24 <memmove>
    6ec8:	00842703          	lw	a4,8(s0)
    6ecc:	00042783          	lw	a5,0(s0)
    6ed0:	41270733          	sub	a4,a4,s2
    6ed4:	012787b3          	add	a5,a5,s2
    6ed8:	00e42423          	sw	a4,8(s0)
    6edc:	00f42023          	sw	a5,0(s0)
    6ee0:	fc0712e3          	bnez	a4,6ea4 <__sfvwrite_r+0x40c>
    6ee4:	00040593          	mv	a1,s0
    6ee8:	000a0513          	mv	a0,s4
    6eec:	829ff0ef          	jal	6714 <_fflush_r>
    6ef0:	fa050ae3          	beqz	a0,6ea4 <__sfvwrite_r+0x40c>
    6ef4:	00c41783          	lh	a5,12(s0)
    6ef8:	00c12b83          	lw	s7,12(sp)
    6efc:	00812c03          	lw	s8,8(sp)
    6f00:	00412c83          	lw	s9,4(sp)
    6f04:	e2dff06f          	j	6d30 <__sfvwrite_r+0x298>
    6f08:	00098c13          	mv	s8,s3
    6f0c:	00098c93          	mv	s9,s3
    6f10:	d65ff06f          	j	6c74 <__sfvwrite_r+0x1dc>
    6f14:	000b8613          	mv	a2,s7
    6f18:	000c0593          	mv	a1,s8
    6f1c:	409000ef          	jal	7b24 <memmove>
    6f20:	00842703          	lw	a4,8(s0)
    6f24:	00042783          	lw	a5,0(s0)
    6f28:	000b8913          	mv	s2,s7
    6f2c:	41770733          	sub	a4,a4,s7
    6f30:	017787b3          	add	a5,a5,s7
    6f34:	00e42423          	sw	a4,8(s0)
    6f38:	00f42023          	sw	a5,0(s0)
    6f3c:	e95ff06f          	j	6dd0 <__sfvwrite_r+0x338>
    6f40:	000a0513          	mv	a0,s4
    6f44:	508030ef          	jal	a44c <_realloc_r>
    6f48:	00050c93          	mv	s9,a0
    6f4c:	d00514e3          	bnez	a0,6c54 <__sfvwrite_r+0x1bc>
    6f50:	01042583          	lw	a1,16(s0)
    6f54:	000a0513          	mv	a0,s4
    6f58:	ae8fa0ef          	jal	1240 <_free_r>
    6f5c:	00c41783          	lh	a5,12(s0)
    6f60:	00c00713          	li	a4,12
    6f64:	00c12b83          	lw	s7,12(sp)
    6f68:	00812c03          	lw	s8,8(sp)
    6f6c:	00412c83          	lw	s9,4(sp)
    6f70:	00ea2023          	sw	a4,0(s4)
    6f74:	f7f7f793          	and	a5,a5,-129
    6f78:	db9ff06f          	j	6d30 <__sfvwrite_r+0x298>
    6f7c:	00198793          	add	a5,s3,1
    6f80:	00078a93          	mv	s5,a5
    6f84:	e05ff06f          	j	6d88 <__sfvwrite_r+0x2f0>
    6f88:	00c41783          	lh	a5,12(s0)
    6f8c:	da5ff06f          	j	6d30 <__sfvwrite_r+0x298>
    6f90:	00c00713          	li	a4,12
    6f94:	00c41783          	lh	a5,12(s0)
    6f98:	00c12b83          	lw	s7,12(sp)
    6f9c:	00812c03          	lw	s8,8(sp)
    6fa0:	00412c83          	lw	s9,4(sp)
    6fa4:	00ea2023          	sw	a4,0(s4)
    6fa8:	d89ff06f          	j	6d30 <__sfvwrite_r+0x298>

00006fac <_fwalk_sglue>:
    6fac:	fd010113          	add	sp,sp,-48
    6fb0:	03212023          	sw	s2,32(sp)
    6fb4:	01312e23          	sw	s3,28(sp)
    6fb8:	01412c23          	sw	s4,24(sp)
    6fbc:	01512a23          	sw	s5,20(sp)
    6fc0:	01612823          	sw	s6,16(sp)
    6fc4:	01712623          	sw	s7,12(sp)
    6fc8:	02112623          	sw	ra,44(sp)
    6fcc:	02812423          	sw	s0,40(sp)
    6fd0:	02912223          	sw	s1,36(sp)
    6fd4:	00050b13          	mv	s6,a0
    6fd8:	00058b93          	mv	s7,a1
    6fdc:	00060a93          	mv	s5,a2
    6fe0:	00000a13          	li	s4,0
    6fe4:	00100993          	li	s3,1
    6fe8:	fff00913          	li	s2,-1
    6fec:	004aa483          	lw	s1,4(s5)
    6ff0:	008aa403          	lw	s0,8(s5)
    6ff4:	fff48493          	add	s1,s1,-1
    6ff8:	0204c863          	bltz	s1,7028 <_fwalk_sglue+0x7c>
    6ffc:	00c45783          	lhu	a5,12(s0)
    7000:	00f9fe63          	bgeu	s3,a5,701c <_fwalk_sglue+0x70>
    7004:	00e41783          	lh	a5,14(s0)
    7008:	00040593          	mv	a1,s0
    700c:	000b0513          	mv	a0,s6
    7010:	01278663          	beq	a5,s2,701c <_fwalk_sglue+0x70>
    7014:	000b80e7          	jalr	s7
    7018:	00aa6a33          	or	s4,s4,a0
    701c:	fff48493          	add	s1,s1,-1
    7020:	06840413          	add	s0,s0,104
    7024:	fd249ce3          	bne	s1,s2,6ffc <_fwalk_sglue+0x50>
    7028:	000aaa83          	lw	s5,0(s5)
    702c:	fc0a90e3          	bnez	s5,6fec <_fwalk_sglue+0x40>
    7030:	02c12083          	lw	ra,44(sp)
    7034:	02812403          	lw	s0,40(sp)
    7038:	02412483          	lw	s1,36(sp)
    703c:	02012903          	lw	s2,32(sp)
    7040:	01c12983          	lw	s3,28(sp)
    7044:	01412a83          	lw	s5,20(sp)
    7048:	01012b03          	lw	s6,16(sp)
    704c:	00c12b83          	lw	s7,12(sp)
    7050:	000a0513          	mv	a0,s4
    7054:	01812a03          	lw	s4,24(sp)
    7058:	03010113          	add	sp,sp,48
    705c:	00008067          	ret

00007060 <_putc_r>:
    7060:	fe010113          	add	sp,sp,-32
    7064:	00812c23          	sw	s0,24(sp)
    7068:	01212a23          	sw	s2,20(sp)
    706c:	00112e23          	sw	ra,28(sp)
    7070:	00050913          	mv	s2,a0
    7074:	00060413          	mv	s0,a2
    7078:	00050663          	beqz	a0,7084 <_putc_r+0x24>
    707c:	03452783          	lw	a5,52(a0)
    7080:	0c078663          	beqz	a5,714c <_putc_r+0xec>
    7084:	06442783          	lw	a5,100(s0)
    7088:	0017f793          	and	a5,a5,1
    708c:	00079863          	bnez	a5,709c <_putc_r+0x3c>
    7090:	00c45783          	lhu	a5,12(s0)
    7094:	2007f793          	and	a5,a5,512
    7098:	08078063          	beqz	a5,7118 <_putc_r+0xb8>
    709c:	00842783          	lw	a5,8(s0)
    70a0:	fff78793          	add	a5,a5,-1
    70a4:	00f42423          	sw	a5,8(s0)
    70a8:	0007dc63          	bgez	a5,70c0 <_putc_r+0x60>
    70ac:	01842703          	lw	a4,24(s0)
    70b0:	04e7ca63          	blt	a5,a4,7104 <_putc_r+0xa4>
    70b4:	0ff5f793          	zext.b	a5,a1
    70b8:	00a00713          	li	a4,10
    70bc:	04e78463          	beq	a5,a4,7104 <_putc_r+0xa4>
    70c0:	00042783          	lw	a5,0(s0)
    70c4:	0ff5f913          	zext.b	s2,a1
    70c8:	00178713          	add	a4,a5,1
    70cc:	00e42023          	sw	a4,0(s0)
    70d0:	00b78023          	sb	a1,0(a5)
    70d4:	06442783          	lw	a5,100(s0)
    70d8:	0017f793          	and	a5,a5,1
    70dc:	00079863          	bnez	a5,70ec <_putc_r+0x8c>
    70e0:	00c45783          	lhu	a5,12(s0)
    70e4:	2007f793          	and	a5,a5,512
    70e8:	04078263          	beqz	a5,712c <_putc_r+0xcc>
    70ec:	01c12083          	lw	ra,28(sp)
    70f0:	01812403          	lw	s0,24(sp)
    70f4:	00090513          	mv	a0,s2
    70f8:	01412903          	lw	s2,20(sp)
    70fc:	02010113          	add	sp,sp,32
    7100:	00008067          	ret
    7104:	00090513          	mv	a0,s2
    7108:	00040613          	mv	a2,s0
    710c:	1b4000ef          	jal	72c0 <__swbuf_r>
    7110:	00050913          	mv	s2,a0
    7114:	fc1ff06f          	j	70d4 <_putc_r+0x74>
    7118:	05842503          	lw	a0,88(s0)
    711c:	00b12623          	sw	a1,12(sp)
    7120:	cc9f90ef          	jal	de8 <__retarget_lock_acquire_recursive>
    7124:	00c12583          	lw	a1,12(sp)
    7128:	f75ff06f          	j	709c <_putc_r+0x3c>
    712c:	05842503          	lw	a0,88(s0)
    7130:	cbdf90ef          	jal	dec <__retarget_lock_release_recursive>
    7134:	01c12083          	lw	ra,28(sp)
    7138:	01812403          	lw	s0,24(sp)
    713c:	00090513          	mv	a0,s2
    7140:	01412903          	lw	s2,20(sp)
    7144:	02010113          	add	sp,sp,32
    7148:	00008067          	ret
    714c:	00b12623          	sw	a1,12(sp)
    7150:	8c1ff0ef          	jal	6a10 <__sinit>
    7154:	00c12583          	lw	a1,12(sp)
    7158:	f2dff06f          	j	7084 <_putc_r+0x24>

0000715c <__sread>:
    715c:	ff010113          	add	sp,sp,-16
    7160:	00812423          	sw	s0,8(sp)
    7164:	00058413          	mv	s0,a1
    7168:	00e59583          	lh	a1,14(a1)
    716c:	00112623          	sw	ra,12(sp)
    7170:	095000ef          	jal	7a04 <_read_r>
    7174:	02054063          	bltz	a0,7194 <__sread+0x38>
    7178:	05042783          	lw	a5,80(s0)
    717c:	00c12083          	lw	ra,12(sp)
    7180:	00a787b3          	add	a5,a5,a0
    7184:	04f42823          	sw	a5,80(s0)
    7188:	00812403          	lw	s0,8(sp)
    718c:	01010113          	add	sp,sp,16
    7190:	00008067          	ret
    7194:	00c45783          	lhu	a5,12(s0)
    7198:	fffff737          	lui	a4,0xfffff
    719c:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    71a0:	00e7f7b3          	and	a5,a5,a4
    71a4:	00c12083          	lw	ra,12(sp)
    71a8:	00f41623          	sh	a5,12(s0)
    71ac:	00812403          	lw	s0,8(sp)
    71b0:	01010113          	add	sp,sp,16
    71b4:	00008067          	ret

000071b8 <__swrite>:
    71b8:	00c59783          	lh	a5,12(a1)
    71bc:	fe010113          	add	sp,sp,-32
    71c0:	00812c23          	sw	s0,24(sp)
    71c4:	00912a23          	sw	s1,20(sp)
    71c8:	01212823          	sw	s2,16(sp)
    71cc:	01312623          	sw	s3,12(sp)
    71d0:	00112e23          	sw	ra,28(sp)
    71d4:	1007f713          	and	a4,a5,256
    71d8:	00058413          	mv	s0,a1
    71dc:	00050493          	mv	s1,a0
    71e0:	00060913          	mv	s2,a2
    71e4:	00068993          	mv	s3,a3
    71e8:	04071063          	bnez	a4,7228 <__swrite+0x70>
    71ec:	fffff737          	lui	a4,0xfffff
    71f0:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    71f4:	00e7f7b3          	and	a5,a5,a4
    71f8:	00e41583          	lh	a1,14(s0)
    71fc:	00f41623          	sh	a5,12(s0)
    7200:	01812403          	lw	s0,24(sp)
    7204:	01c12083          	lw	ra,28(sp)
    7208:	00098693          	mv	a3,s3
    720c:	00090613          	mv	a2,s2
    7210:	00c12983          	lw	s3,12(sp)
    7214:	01012903          	lw	s2,16(sp)
    7218:	00048513          	mv	a0,s1
    721c:	01412483          	lw	s1,20(sp)
    7220:	02010113          	add	sp,sp,32
    7224:	09d0006f          	j	7ac0 <_write_r>
    7228:	00e59583          	lh	a1,14(a1)
    722c:	00200693          	li	a3,2
    7230:	00000613          	li	a2,0
    7234:	76c000ef          	jal	79a0 <_lseek_r>
    7238:	00c41783          	lh	a5,12(s0)
    723c:	fb1ff06f          	j	71ec <__swrite+0x34>

00007240 <__sseek>:
    7240:	ff010113          	add	sp,sp,-16
    7244:	00812423          	sw	s0,8(sp)
    7248:	00058413          	mv	s0,a1
    724c:	00e59583          	lh	a1,14(a1)
    7250:	00112623          	sw	ra,12(sp)
    7254:	74c000ef          	jal	79a0 <_lseek_r>
    7258:	fff00793          	li	a5,-1
    725c:	02f50863          	beq	a0,a5,728c <__sseek+0x4c>
    7260:	00c45783          	lhu	a5,12(s0)
    7264:	00001737          	lui	a4,0x1
    7268:	00c12083          	lw	ra,12(sp)
    726c:	00e7e7b3          	or	a5,a5,a4
    7270:	01079793          	sll	a5,a5,0x10
    7274:	4107d793          	sra	a5,a5,0x10
    7278:	04a42823          	sw	a0,80(s0)
    727c:	00f41623          	sh	a5,12(s0)
    7280:	00812403          	lw	s0,8(sp)
    7284:	01010113          	add	sp,sp,16
    7288:	00008067          	ret
    728c:	00c45783          	lhu	a5,12(s0)
    7290:	fffff737          	lui	a4,0xfffff
    7294:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7298:	00e7f7b3          	and	a5,a5,a4
    729c:	01079793          	sll	a5,a5,0x10
    72a0:	4107d793          	sra	a5,a5,0x10
    72a4:	00c12083          	lw	ra,12(sp)
    72a8:	00f41623          	sh	a5,12(s0)
    72ac:	00812403          	lw	s0,8(sp)
    72b0:	01010113          	add	sp,sp,16
    72b4:	00008067          	ret

000072b8 <__sclose>:
    72b8:	00e59583          	lh	a1,14(a1)
    72bc:	68c0006f          	j	7948 <_close_r>

000072c0 <__swbuf_r>:
    72c0:	fe010113          	add	sp,sp,-32
    72c4:	00812c23          	sw	s0,24(sp)
    72c8:	00912a23          	sw	s1,20(sp)
    72cc:	01212823          	sw	s2,16(sp)
    72d0:	00112e23          	sw	ra,28(sp)
    72d4:	00050913          	mv	s2,a0
    72d8:	00058493          	mv	s1,a1
    72dc:	00060413          	mv	s0,a2
    72e0:	00050663          	beqz	a0,72ec <__swbuf_r+0x2c>
    72e4:	03452783          	lw	a5,52(a0)
    72e8:	16078063          	beqz	a5,7448 <__swbuf_r+0x188>
    72ec:	01842783          	lw	a5,24(s0)
    72f0:	00c41703          	lh	a4,12(s0)
    72f4:	00f42423          	sw	a5,8(s0)
    72f8:	00877793          	and	a5,a4,8
    72fc:	08078063          	beqz	a5,737c <__swbuf_r+0xbc>
    7300:	01042783          	lw	a5,16(s0)
    7304:	06078c63          	beqz	a5,737c <__swbuf_r+0xbc>
    7308:	01312623          	sw	s3,12(sp)
    730c:	01271693          	sll	a3,a4,0x12
    7310:	0ff4f993          	zext.b	s3,s1
    7314:	0ff4f493          	zext.b	s1,s1
    7318:	0806d863          	bgez	a3,73a8 <__swbuf_r+0xe8>
    731c:	00042703          	lw	a4,0(s0)
    7320:	01442683          	lw	a3,20(s0)
    7324:	40f707b3          	sub	a5,a4,a5
    7328:	0ad7d863          	bge	a5,a3,73d8 <__swbuf_r+0x118>
    732c:	00842683          	lw	a3,8(s0)
    7330:	00170613          	add	a2,a4,1
    7334:	00c42023          	sw	a2,0(s0)
    7338:	fff68693          	add	a3,a3,-1
    733c:	00d42423          	sw	a3,8(s0)
    7340:	01370023          	sb	s3,0(a4)
    7344:	01442703          	lw	a4,20(s0)
    7348:	00178793          	add	a5,a5,1
    734c:	0cf70263          	beq	a4,a5,7410 <__swbuf_r+0x150>
    7350:	00c45783          	lhu	a5,12(s0)
    7354:	0017f793          	and	a5,a5,1
    7358:	0c079a63          	bnez	a5,742c <__swbuf_r+0x16c>
    735c:	00c12983          	lw	s3,12(sp)
    7360:	01c12083          	lw	ra,28(sp)
    7364:	01812403          	lw	s0,24(sp)
    7368:	01012903          	lw	s2,16(sp)
    736c:	00048513          	mv	a0,s1
    7370:	01412483          	lw	s1,20(sp)
    7374:	02010113          	add	sp,sp,32
    7378:	00008067          	ret
    737c:	00040593          	mv	a1,s0
    7380:	00090513          	mv	a0,s2
    7384:	0cc000ef          	jal	7450 <__swsetup_r>
    7388:	08051e63          	bnez	a0,7424 <__swbuf_r+0x164>
    738c:	00c41703          	lh	a4,12(s0)
    7390:	01312623          	sw	s3,12(sp)
    7394:	01042783          	lw	a5,16(s0)
    7398:	01271693          	sll	a3,a4,0x12
    739c:	0ff4f993          	zext.b	s3,s1
    73a0:	0ff4f493          	zext.b	s1,s1
    73a4:	f606cce3          	bltz	a3,731c <__swbuf_r+0x5c>
    73a8:	06442683          	lw	a3,100(s0)
    73ac:	ffffe637          	lui	a2,0xffffe
    73b0:	000025b7          	lui	a1,0x2
    73b4:	00b76733          	or	a4,a4,a1
    73b8:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    73bc:	00c6f6b3          	and	a3,a3,a2
    73c0:	00e41623          	sh	a4,12(s0)
    73c4:	00042703          	lw	a4,0(s0)
    73c8:	06d42223          	sw	a3,100(s0)
    73cc:	01442683          	lw	a3,20(s0)
    73d0:	40f707b3          	sub	a5,a4,a5
    73d4:	f4d7cce3          	blt	a5,a3,732c <__swbuf_r+0x6c>
    73d8:	00040593          	mv	a1,s0
    73dc:	00090513          	mv	a0,s2
    73e0:	b34ff0ef          	jal	6714 <_fflush_r>
    73e4:	02051e63          	bnez	a0,7420 <__swbuf_r+0x160>
    73e8:	00042703          	lw	a4,0(s0)
    73ec:	00842683          	lw	a3,8(s0)
    73f0:	00100793          	li	a5,1
    73f4:	00170613          	add	a2,a4,1
    73f8:	fff68693          	add	a3,a3,-1
    73fc:	00c42023          	sw	a2,0(s0)
    7400:	00d42423          	sw	a3,8(s0)
    7404:	01370023          	sb	s3,0(a4)
    7408:	01442703          	lw	a4,20(s0)
    740c:	f4f712e3          	bne	a4,a5,7350 <__swbuf_r+0x90>
    7410:	00040593          	mv	a1,s0
    7414:	00090513          	mv	a0,s2
    7418:	afcff0ef          	jal	6714 <_fflush_r>
    741c:	f40500e3          	beqz	a0,735c <__swbuf_r+0x9c>
    7420:	00c12983          	lw	s3,12(sp)
    7424:	fff00493          	li	s1,-1
    7428:	f39ff06f          	j	7360 <__swbuf_r+0xa0>
    742c:	00a00793          	li	a5,10
    7430:	f2f496e3          	bne	s1,a5,735c <__swbuf_r+0x9c>
    7434:	00040593          	mv	a1,s0
    7438:	00090513          	mv	a0,s2
    743c:	ad8ff0ef          	jal	6714 <_fflush_r>
    7440:	f0050ee3          	beqz	a0,735c <__swbuf_r+0x9c>
    7444:	fddff06f          	j	7420 <__swbuf_r+0x160>
    7448:	dc8ff0ef          	jal	6a10 <__sinit>
    744c:	ea1ff06f          	j	72ec <__swbuf_r+0x2c>

00007450 <__swsetup_r>:
    7450:	ff010113          	add	sp,sp,-16
    7454:	00812423          	sw	s0,8(sp)
    7458:	00912223          	sw	s1,4(sp)
    745c:	00112623          	sw	ra,12(sp)
    7460:	7fff9797          	auipc	a5,0x7fff9
    7464:	2a87a783          	lw	a5,680(a5) # 80000708 <_impure_ptr>
    7468:	00050493          	mv	s1,a0
    746c:	00058413          	mv	s0,a1
    7470:	00078663          	beqz	a5,747c <__swsetup_r+0x2c>
    7474:	0347a703          	lw	a4,52(a5)
    7478:	0e070c63          	beqz	a4,7570 <__swsetup_r+0x120>
    747c:	00c41783          	lh	a5,12(s0)
    7480:	0087f713          	and	a4,a5,8
    7484:	06070a63          	beqz	a4,74f8 <__swsetup_r+0xa8>
    7488:	01042703          	lw	a4,16(s0)
    748c:	08070663          	beqz	a4,7518 <__swsetup_r+0xc8>
    7490:	0017f693          	and	a3,a5,1
    7494:	02068863          	beqz	a3,74c4 <__swsetup_r+0x74>
    7498:	01442683          	lw	a3,20(s0)
    749c:	00042423          	sw	zero,8(s0)
    74a0:	00000513          	li	a0,0
    74a4:	40d006b3          	neg	a3,a3
    74a8:	00d42c23          	sw	a3,24(s0)
    74ac:	02070a63          	beqz	a4,74e0 <__swsetup_r+0x90>
    74b0:	00c12083          	lw	ra,12(sp)
    74b4:	00812403          	lw	s0,8(sp)
    74b8:	00412483          	lw	s1,4(sp)
    74bc:	01010113          	add	sp,sp,16
    74c0:	00008067          	ret
    74c4:	0027f693          	and	a3,a5,2
    74c8:	00000613          	li	a2,0
    74cc:	00069463          	bnez	a3,74d4 <__swsetup_r+0x84>
    74d0:	01442603          	lw	a2,20(s0)
    74d4:	00c42423          	sw	a2,8(s0)
    74d8:	00000513          	li	a0,0
    74dc:	fc071ae3          	bnez	a4,74b0 <__swsetup_r+0x60>
    74e0:	0807f713          	and	a4,a5,128
    74e4:	fc0706e3          	beqz	a4,74b0 <__swsetup_r+0x60>
    74e8:	0407e793          	or	a5,a5,64
    74ec:	00f41623          	sh	a5,12(s0)
    74f0:	fff00513          	li	a0,-1
    74f4:	fbdff06f          	j	74b0 <__swsetup_r+0x60>
    74f8:	0107f713          	and	a4,a5,16
    74fc:	08070063          	beqz	a4,757c <__swsetup_r+0x12c>
    7500:	0047f713          	and	a4,a5,4
    7504:	02071c63          	bnez	a4,753c <__swsetup_r+0xec>
    7508:	01042703          	lw	a4,16(s0)
    750c:	0087e793          	or	a5,a5,8
    7510:	00f41623          	sh	a5,12(s0)
    7514:	f6071ee3          	bnez	a4,7490 <__swsetup_r+0x40>
    7518:	2807f693          	and	a3,a5,640
    751c:	20000613          	li	a2,512
    7520:	f6c688e3          	beq	a3,a2,7490 <__swsetup_r+0x40>
    7524:	00040593          	mv	a1,s0
    7528:	00048513          	mv	a0,s1
    752c:	6cc030ef          	jal	abf8 <__smakebuf_r>
    7530:	00c41783          	lh	a5,12(s0)
    7534:	01042703          	lw	a4,16(s0)
    7538:	f59ff06f          	j	7490 <__swsetup_r+0x40>
    753c:	03042583          	lw	a1,48(s0)
    7540:	00058e63          	beqz	a1,755c <__swsetup_r+0x10c>
    7544:	04040713          	add	a4,s0,64
    7548:	00e58863          	beq	a1,a4,7558 <__swsetup_r+0x108>
    754c:	00048513          	mv	a0,s1
    7550:	cf1f90ef          	jal	1240 <_free_r>
    7554:	00c41783          	lh	a5,12(s0)
    7558:	02042823          	sw	zero,48(s0)
    755c:	01042703          	lw	a4,16(s0)
    7560:	fdb7f793          	and	a5,a5,-37
    7564:	00042223          	sw	zero,4(s0)
    7568:	00e42023          	sw	a4,0(s0)
    756c:	fa1ff06f          	j	750c <__swsetup_r+0xbc>
    7570:	00078513          	mv	a0,a5
    7574:	c9cff0ef          	jal	6a10 <__sinit>
    7578:	f05ff06f          	j	747c <__swsetup_r+0x2c>
    757c:	00900713          	li	a4,9
    7580:	00e4a023          	sw	a4,0(s1)
    7584:	0407e793          	or	a5,a5,64
    7588:	00f41623          	sh	a5,12(s0)
    758c:	fff00513          	li	a0,-1
    7590:	f21ff06f          	j	74b0 <__swsetup_r+0x60>

00007594 <__fputwc>:
    7594:	fc010113          	add	sp,sp,-64
    7598:	02812c23          	sw	s0,56(sp)
    759c:	03412423          	sw	s4,40(sp)
    75a0:	03512223          	sw	s5,36(sp)
    75a4:	02112e23          	sw	ra,60(sp)
    75a8:	02912a23          	sw	s1,52(sp)
    75ac:	03312623          	sw	s3,44(sp)
    75b0:	00050a13          	mv	s4,a0
    75b4:	00058a93          	mv	s5,a1
    75b8:	00060413          	mv	s0,a2
    75bc:	374000ef          	jal	7930 <__locale_mb_cur_max>
    75c0:	00100793          	li	a5,1
    75c4:	02f51663          	bne	a0,a5,75f0 <__fputwc+0x5c>
    75c8:	fffa8793          	add	a5,s5,-1
    75cc:	0fe00713          	li	a4,254
    75d0:	02f76063          	bltu	a4,a5,75f0 <__fputwc+0x5c>
    75d4:	03212823          	sw	s2,48(sp)
    75d8:	03612023          	sw	s6,32(sp)
    75dc:	01712e23          	sw	s7,28(sp)
    75e0:	01510423          	sb	s5,8(sp)
    75e4:	00100993          	li	s3,1
    75e8:	00810493          	add	s1,sp,8
    75ec:	0380006f          	j	7624 <__fputwc+0x90>
    75f0:	00810493          	add	s1,sp,8
    75f4:	05c40693          	add	a3,s0,92
    75f8:	000a8613          	mv	a2,s5
    75fc:	00048593          	mv	a1,s1
    7600:	000a0513          	mv	a0,s4
    7604:	3e8030ef          	jal	a9ec <_wcrtomb_r>
    7608:	fff00793          	li	a5,-1
    760c:	00050993          	mv	s3,a0
    7610:	0cf50a63          	beq	a0,a5,76e4 <__fputwc+0x150>
    7614:	0a050663          	beqz	a0,76c0 <__fputwc+0x12c>
    7618:	03212823          	sw	s2,48(sp)
    761c:	03612023          	sw	s6,32(sp)
    7620:	01712e23          	sw	s7,28(sp)
    7624:	00000913          	li	s2,0
    7628:	fff00b13          	li	s6,-1
    762c:	00a00b93          	li	s7,10
    7630:	0200006f          	j	7650 <__fputwc+0xbc>
    7634:	00042783          	lw	a5,0(s0)
    7638:	00178693          	add	a3,a5,1
    763c:	00d42023          	sw	a3,0(s0)
    7640:	00e78023          	sb	a4,0(a5)
    7644:	00190913          	add	s2,s2,1
    7648:	00148493          	add	s1,s1,1
    764c:	07397463          	bgeu	s2,s3,76b4 <__fputwc+0x120>
    7650:	00842783          	lw	a5,8(s0)
    7654:	0004c703          	lbu	a4,0(s1)
    7658:	fff78793          	add	a5,a5,-1
    765c:	00f42423          	sw	a5,8(s0)
    7660:	fc07dae3          	bgez	a5,7634 <__fputwc+0xa0>
    7664:	01842683          	lw	a3,24(s0)
    7668:	00040613          	mv	a2,s0
    766c:	00070593          	mv	a1,a4
    7670:	000a0513          	mv	a0,s4
    7674:	00d7c463          	blt	a5,a3,767c <__fputwc+0xe8>
    7678:	fb771ee3          	bne	a4,s7,7634 <__fputwc+0xa0>
    767c:	c45ff0ef          	jal	72c0 <__swbuf_r>
    7680:	fd6512e3          	bne	a0,s6,7644 <__fputwc+0xb0>
    7684:	03012903          	lw	s2,48(sp)
    7688:	02012b03          	lw	s6,32(sp)
    768c:	01c12b83          	lw	s7,28(sp)
    7690:	03c12083          	lw	ra,60(sp)
    7694:	03812403          	lw	s0,56(sp)
    7698:	03412483          	lw	s1,52(sp)
    769c:	02c12983          	lw	s3,44(sp)
    76a0:	02812a03          	lw	s4,40(sp)
    76a4:	02412a83          	lw	s5,36(sp)
    76a8:	fff00513          	li	a0,-1
    76ac:	04010113          	add	sp,sp,64
    76b0:	00008067          	ret
    76b4:	03012903          	lw	s2,48(sp)
    76b8:	02012b03          	lw	s6,32(sp)
    76bc:	01c12b83          	lw	s7,28(sp)
    76c0:	03c12083          	lw	ra,60(sp)
    76c4:	03812403          	lw	s0,56(sp)
    76c8:	03412483          	lw	s1,52(sp)
    76cc:	02c12983          	lw	s3,44(sp)
    76d0:	02812a03          	lw	s4,40(sp)
    76d4:	000a8513          	mv	a0,s5
    76d8:	02412a83          	lw	s5,36(sp)
    76dc:	04010113          	add	sp,sp,64
    76e0:	00008067          	ret
    76e4:	00c45783          	lhu	a5,12(s0)
    76e8:	0407e793          	or	a5,a5,64
    76ec:	00f41623          	sh	a5,12(s0)
    76f0:	fa1ff06f          	j	7690 <__fputwc+0xfc>

000076f4 <_fputwc_r>:
    76f4:	06462783          	lw	a5,100(a2)
    76f8:	fe010113          	add	sp,sp,-32
    76fc:	00812c23          	sw	s0,24(sp)
    7700:	00912a23          	sw	s1,20(sp)
    7704:	0017f713          	and	a4,a5,1
    7708:	00112e23          	sw	ra,28(sp)
    770c:	00c61783          	lh	a5,12(a2)
    7710:	00060413          	mv	s0,a2
    7714:	00050493          	mv	s1,a0
    7718:	00071663          	bnez	a4,7724 <_fputwc_r+0x30>
    771c:	2007f713          	and	a4,a5,512
    7720:	08070463          	beqz	a4,77a8 <_fputwc_r+0xb4>
    7724:	01279713          	sll	a4,a5,0x12
    7728:	02074063          	bltz	a4,7748 <_fputwc_r+0x54>
    772c:	06442703          	lw	a4,100(s0)
    7730:	000026b7          	lui	a3,0x2
    7734:	00d7e7b3          	or	a5,a5,a3
    7738:	000026b7          	lui	a3,0x2
    773c:	00d76733          	or	a4,a4,a3
    7740:	00f41623          	sh	a5,12(s0)
    7744:	06e42223          	sw	a4,100(s0)
    7748:	00048513          	mv	a0,s1
    774c:	00040613          	mv	a2,s0
    7750:	e45ff0ef          	jal	7594 <__fputwc>
    7754:	06442783          	lw	a5,100(s0)
    7758:	00050493          	mv	s1,a0
    775c:	0017f793          	and	a5,a5,1
    7760:	00079863          	bnez	a5,7770 <_fputwc_r+0x7c>
    7764:	00c45783          	lhu	a5,12(s0)
    7768:	2007f793          	and	a5,a5,512
    776c:	00078e63          	beqz	a5,7788 <_fputwc_r+0x94>
    7770:	01c12083          	lw	ra,28(sp)
    7774:	01812403          	lw	s0,24(sp)
    7778:	00048513          	mv	a0,s1
    777c:	01412483          	lw	s1,20(sp)
    7780:	02010113          	add	sp,sp,32
    7784:	00008067          	ret
    7788:	05842503          	lw	a0,88(s0)
    778c:	e60f90ef          	jal	dec <__retarget_lock_release_recursive>
    7790:	01c12083          	lw	ra,28(sp)
    7794:	01812403          	lw	s0,24(sp)
    7798:	00048513          	mv	a0,s1
    779c:	01412483          	lw	s1,20(sp)
    77a0:	02010113          	add	sp,sp,32
    77a4:	00008067          	ret
    77a8:	05862503          	lw	a0,88(a2)
    77ac:	00b12623          	sw	a1,12(sp)
    77b0:	e38f90ef          	jal	de8 <__retarget_lock_acquire_recursive>
    77b4:	00c41783          	lh	a5,12(s0)
    77b8:	00c12583          	lw	a1,12(sp)
    77bc:	f69ff06f          	j	7724 <_fputwc_r+0x30>

000077c0 <memchr>:
    77c0:	00357793          	and	a5,a0,3
    77c4:	0ff5f693          	zext.b	a3,a1
    77c8:	02078a63          	beqz	a5,77fc <memchr+0x3c>
    77cc:	fff60793          	add	a5,a2,-1
    77d0:	02060e63          	beqz	a2,780c <memchr+0x4c>
    77d4:	fff00613          	li	a2,-1
    77d8:	0180006f          	j	77f0 <memchr+0x30>
    77dc:	00150513          	add	a0,a0,1
    77e0:	00357713          	and	a4,a0,3
    77e4:	00070e63          	beqz	a4,7800 <memchr+0x40>
    77e8:	fff78793          	add	a5,a5,-1
    77ec:	02c78063          	beq	a5,a2,780c <memchr+0x4c>
    77f0:	00054703          	lbu	a4,0(a0)
    77f4:	fed714e3          	bne	a4,a3,77dc <memchr+0x1c>
    77f8:	00008067          	ret
    77fc:	00060793          	mv	a5,a2
    7800:	00300713          	li	a4,3
    7804:	00f76863          	bltu	a4,a5,7814 <memchr+0x54>
    7808:	06079063          	bnez	a5,7868 <memchr+0xa8>
    780c:	00000513          	li	a0,0
    7810:	00008067          	ret
    7814:	0ff5f593          	zext.b	a1,a1
    7818:	00859713          	sll	a4,a1,0x8
    781c:	00b705b3          	add	a1,a4,a1
    7820:	01059713          	sll	a4,a1,0x10
    7824:	feff08b7          	lui	a7,0xfeff0
    7828:	80808837          	lui	a6,0x80808
    782c:	00e585b3          	add	a1,a1,a4
    7830:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7834:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    7838:	00300313          	li	t1,3
    783c:	0100006f          	j	784c <memchr+0x8c>
    7840:	ffc78793          	add	a5,a5,-4
    7844:	00450513          	add	a0,a0,4
    7848:	fcf370e3          	bgeu	t1,a5,7808 <memchr+0x48>
    784c:	00052703          	lw	a4,0(a0)
    7850:	00e5c733          	xor	a4,a1,a4
    7854:	01170633          	add	a2,a4,a7
    7858:	fff74713          	not	a4,a4
    785c:	00e67733          	and	a4,a2,a4
    7860:	01077733          	and	a4,a4,a6
    7864:	fc070ee3          	beqz	a4,7840 <memchr+0x80>
    7868:	00f507b3          	add	a5,a0,a5
    786c:	00c0006f          	j	7878 <memchr+0xb8>
    7870:	00150513          	add	a0,a0,1
    7874:	f8f50ce3          	beq	a0,a5,780c <memchr+0x4c>
    7878:	00054703          	lbu	a4,0(a0)
    787c:	fed71ae3          	bne	a4,a3,7870 <memchr+0xb0>
    7880:	00008067          	ret

00007884 <strncpy>:
    7884:	00a5e7b3          	or	a5,a1,a0
    7888:	0037f793          	and	a5,a5,3
    788c:	00079663          	bnez	a5,7898 <strncpy+0x14>
    7890:	00300793          	li	a5,3
    7894:	04c7e663          	bltu	a5,a2,78e0 <strncpy+0x5c>
    7898:	00050713          	mv	a4,a0
    789c:	01c0006f          	j	78b8 <strncpy+0x34>
    78a0:	fff5c683          	lbu	a3,-1(a1) # 1fff <_vfprintf_r+0x2bb>
    78a4:	fff60813          	add	a6,a2,-1
    78a8:	fed78fa3          	sb	a3,-1(a5)
    78ac:	00068e63          	beqz	a3,78c8 <strncpy+0x44>
    78b0:	00078713          	mv	a4,a5
    78b4:	00080613          	mv	a2,a6
    78b8:	00158593          	add	a1,a1,1
    78bc:	00170793          	add	a5,a4,1
    78c0:	fe0610e3          	bnez	a2,78a0 <strncpy+0x1c>
    78c4:	00008067          	ret
    78c8:	00c70733          	add	a4,a4,a2
    78cc:	06080063          	beqz	a6,792c <strncpy+0xa8>
    78d0:	00178793          	add	a5,a5,1
    78d4:	fe078fa3          	sb	zero,-1(a5)
    78d8:	fee79ce3          	bne	a5,a4,78d0 <strncpy+0x4c>
    78dc:	00008067          	ret
    78e0:	feff0337          	lui	t1,0xfeff0
    78e4:	808088b7          	lui	a7,0x80808
    78e8:	00050713          	mv	a4,a0
    78ec:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    78f0:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    78f4:	00300e13          	li	t3,3
    78f8:	0180006f          	j	7910 <strncpy+0x8c>
    78fc:	00d72023          	sw	a3,0(a4)
    7900:	ffc60613          	add	a2,a2,-4
    7904:	00470713          	add	a4,a4,4
    7908:	00458593          	add	a1,a1,4
    790c:	face76e3          	bgeu	t3,a2,78b8 <strncpy+0x34>
    7910:	0005a683          	lw	a3,0(a1)
    7914:	006687b3          	add	a5,a3,t1
    7918:	fff6c813          	not	a6,a3
    791c:	0107f7b3          	and	a5,a5,a6
    7920:	0117f7b3          	and	a5,a5,a7
    7924:	fc078ce3          	beqz	a5,78fc <strncpy+0x78>
    7928:	f91ff06f          	j	78b8 <strncpy+0x34>
    792c:	00008067          	ret

00007930 <__locale_mb_cur_max>:
    7930:	7fff9517          	auipc	a0,0x7fff9
    7934:	d2c54503          	lbu	a0,-724(a0) # 8000065c <__global_locale+0x128>
    7938:	00008067          	ret

0000793c <_localeconv_r>:
    793c:	7fff9517          	auipc	a0,0x7fff9
    7940:	ce850513          	add	a0,a0,-792 # 80000624 <__global_locale+0xf0>
    7944:	00008067          	ret

00007948 <_close_r>:
    7948:	ff010113          	add	sp,sp,-16
    794c:	00812423          	sw	s0,8(sp)
    7950:	00050413          	mv	s0,a0
    7954:	00058513          	mv	a0,a1
    7958:	7fff9797          	auipc	a5,0x7fff9
    795c:	dc07a023          	sw	zero,-576(a5) # 80000718 <errno>
    7960:	00112623          	sw	ra,12(sp)
    7964:	85cf90ef          	jal	9c0 <_close>
    7968:	fff00793          	li	a5,-1
    796c:	00f50a63          	beq	a0,a5,7980 <_close_r+0x38>
    7970:	00c12083          	lw	ra,12(sp)
    7974:	00812403          	lw	s0,8(sp)
    7978:	01010113          	add	sp,sp,16
    797c:	00008067          	ret
    7980:	7fff9797          	auipc	a5,0x7fff9
    7984:	d987a783          	lw	a5,-616(a5) # 80000718 <errno>
    7988:	fe0784e3          	beqz	a5,7970 <_close_r+0x28>
    798c:	00c12083          	lw	ra,12(sp)
    7990:	00f42023          	sw	a5,0(s0)
    7994:	00812403          	lw	s0,8(sp)
    7998:	01010113          	add	sp,sp,16
    799c:	00008067          	ret

000079a0 <_lseek_r>:
    79a0:	ff010113          	add	sp,sp,-16
    79a4:	00058713          	mv	a4,a1
    79a8:	00812423          	sw	s0,8(sp)
    79ac:	00060593          	mv	a1,a2
    79b0:	00050413          	mv	s0,a0
    79b4:	00068613          	mv	a2,a3
    79b8:	00070513          	mv	a0,a4
    79bc:	7fff9797          	auipc	a5,0x7fff9
    79c0:	d407ae23          	sw	zero,-676(a5) # 80000718 <errno>
    79c4:	00112623          	sw	ra,12(sp)
    79c8:	834f90ef          	jal	9fc <_lseek>
    79cc:	fff00793          	li	a5,-1
    79d0:	00f50a63          	beq	a0,a5,79e4 <_lseek_r+0x44>
    79d4:	00c12083          	lw	ra,12(sp)
    79d8:	00812403          	lw	s0,8(sp)
    79dc:	01010113          	add	sp,sp,16
    79e0:	00008067          	ret
    79e4:	7fff9797          	auipc	a5,0x7fff9
    79e8:	d347a783          	lw	a5,-716(a5) # 80000718 <errno>
    79ec:	fe0784e3          	beqz	a5,79d4 <_lseek_r+0x34>
    79f0:	00c12083          	lw	ra,12(sp)
    79f4:	00f42023          	sw	a5,0(s0)
    79f8:	00812403          	lw	s0,8(sp)
    79fc:	01010113          	add	sp,sp,16
    7a00:	00008067          	ret

00007a04 <_read_r>:
    7a04:	ff010113          	add	sp,sp,-16
    7a08:	00058713          	mv	a4,a1
    7a0c:	00812423          	sw	s0,8(sp)
    7a10:	00060593          	mv	a1,a2
    7a14:	00050413          	mv	s0,a0
    7a18:	00068613          	mv	a2,a3
    7a1c:	00070513          	mv	a0,a4
    7a20:	7fff9797          	auipc	a5,0x7fff9
    7a24:	ce07ac23          	sw	zero,-776(a5) # 80000718 <errno>
    7a28:	00112623          	sw	ra,12(sp)
    7a2c:	fd9f80ef          	jal	a04 <_read>
    7a30:	fff00793          	li	a5,-1
    7a34:	00f50a63          	beq	a0,a5,7a48 <_read_r+0x44>
    7a38:	00c12083          	lw	ra,12(sp)
    7a3c:	00812403          	lw	s0,8(sp)
    7a40:	01010113          	add	sp,sp,16
    7a44:	00008067          	ret
    7a48:	7fff9797          	auipc	a5,0x7fff9
    7a4c:	cd07a783          	lw	a5,-816(a5) # 80000718 <errno>
    7a50:	fe0784e3          	beqz	a5,7a38 <_read_r+0x34>
    7a54:	00c12083          	lw	ra,12(sp)
    7a58:	00f42023          	sw	a5,0(s0)
    7a5c:	00812403          	lw	s0,8(sp)
    7a60:	01010113          	add	sp,sp,16
    7a64:	00008067          	ret

00007a68 <_sbrk_r>:
    7a68:	ff010113          	add	sp,sp,-16
    7a6c:	00812423          	sw	s0,8(sp)
    7a70:	00050413          	mv	s0,a0
    7a74:	00058513          	mv	a0,a1
    7a78:	7fff9797          	auipc	a5,0x7fff9
    7a7c:	ca07a023          	sw	zero,-864(a5) # 80000718 <errno>
    7a80:	00112623          	sw	ra,12(sp)
    7a84:	900f90ef          	jal	b84 <_sbrk>
    7a88:	fff00793          	li	a5,-1
    7a8c:	00f50a63          	beq	a0,a5,7aa0 <_sbrk_r+0x38>
    7a90:	00c12083          	lw	ra,12(sp)
    7a94:	00812403          	lw	s0,8(sp)
    7a98:	01010113          	add	sp,sp,16
    7a9c:	00008067          	ret
    7aa0:	7fff9797          	auipc	a5,0x7fff9
    7aa4:	c787a783          	lw	a5,-904(a5) # 80000718 <errno>
    7aa8:	fe0784e3          	beqz	a5,7a90 <_sbrk_r+0x28>
    7aac:	00c12083          	lw	ra,12(sp)
    7ab0:	00f42023          	sw	a5,0(s0)
    7ab4:	00812403          	lw	s0,8(sp)
    7ab8:	01010113          	add	sp,sp,16
    7abc:	00008067          	ret

00007ac0 <_write_r>:
    7ac0:	ff010113          	add	sp,sp,-16
    7ac4:	00058713          	mv	a4,a1
    7ac8:	00812423          	sw	s0,8(sp)
    7acc:	00060593          	mv	a1,a2
    7ad0:	00050413          	mv	s0,a0
    7ad4:	00068613          	mv	a2,a3
    7ad8:	00070513          	mv	a0,a4
    7adc:	7fff9797          	auipc	a5,0x7fff9
    7ae0:	c207ae23          	sw	zero,-964(a5) # 80000718 <errno>
    7ae4:	00112623          	sw	ra,12(sp)
    7ae8:	ff9f80ef          	jal	ae0 <_write>
    7aec:	fff00793          	li	a5,-1
    7af0:	00f50a63          	beq	a0,a5,7b04 <_write_r+0x44>
    7af4:	00c12083          	lw	ra,12(sp)
    7af8:	00812403          	lw	s0,8(sp)
    7afc:	01010113          	add	sp,sp,16
    7b00:	00008067          	ret
    7b04:	7fff9797          	auipc	a5,0x7fff9
    7b08:	c147a783          	lw	a5,-1004(a5) # 80000718 <errno>
    7b0c:	fe0784e3          	beqz	a5,7af4 <_write_r+0x34>
    7b10:	00c12083          	lw	ra,12(sp)
    7b14:	00f42023          	sw	a5,0(s0)
    7b18:	00812403          	lw	s0,8(sp)
    7b1c:	01010113          	add	sp,sp,16
    7b20:	00008067          	ret

00007b24 <memmove>:
    7b24:	02a5f663          	bgeu	a1,a0,7b50 <memmove+0x2c>
    7b28:	00c58733          	add	a4,a1,a2
    7b2c:	02e57263          	bgeu	a0,a4,7b50 <memmove+0x2c>
    7b30:	00c507b3          	add	a5,a0,a2
    7b34:	04060663          	beqz	a2,7b80 <memmove+0x5c>
    7b38:	fff74683          	lbu	a3,-1(a4)
    7b3c:	fff78793          	add	a5,a5,-1
    7b40:	fff70713          	add	a4,a4,-1
    7b44:	00d78023          	sb	a3,0(a5)
    7b48:	fef518e3          	bne	a0,a5,7b38 <memmove+0x14>
    7b4c:	00008067          	ret
    7b50:	00f00793          	li	a5,15
    7b54:	02c7e863          	bltu	a5,a2,7b84 <memmove+0x60>
    7b58:	00050793          	mv	a5,a0
    7b5c:	fff60693          	add	a3,a2,-1
    7b60:	0c060263          	beqz	a2,7c24 <memmove+0x100>
    7b64:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x2bd>
    7b68:	00d786b3          	add	a3,a5,a3
    7b6c:	0005c703          	lbu	a4,0(a1)
    7b70:	00178793          	add	a5,a5,1
    7b74:	00158593          	add	a1,a1,1
    7b78:	fee78fa3          	sb	a4,-1(a5)
    7b7c:	fed798e3          	bne	a5,a3,7b6c <memmove+0x48>
    7b80:	00008067          	ret
    7b84:	00b567b3          	or	a5,a0,a1
    7b88:	0037f793          	and	a5,a5,3
    7b8c:	08079663          	bnez	a5,7c18 <memmove+0xf4>
    7b90:	ff060893          	add	a7,a2,-16
    7b94:	ff08f893          	and	a7,a7,-16
    7b98:	01088893          	add	a7,a7,16
    7b9c:	011506b3          	add	a3,a0,a7
    7ba0:	00058713          	mv	a4,a1
    7ba4:	00050793          	mv	a5,a0
    7ba8:	00072803          	lw	a6,0(a4)
    7bac:	01070713          	add	a4,a4,16
    7bb0:	01078793          	add	a5,a5,16
    7bb4:	ff07a823          	sw	a6,-16(a5)
    7bb8:	ff472803          	lw	a6,-12(a4)
    7bbc:	ff07aa23          	sw	a6,-12(a5)
    7bc0:	ff872803          	lw	a6,-8(a4)
    7bc4:	ff07ac23          	sw	a6,-8(a5)
    7bc8:	ffc72803          	lw	a6,-4(a4)
    7bcc:	ff07ae23          	sw	a6,-4(a5)
    7bd0:	fcd79ce3          	bne	a5,a3,7ba8 <memmove+0x84>
    7bd4:	00c67813          	and	a6,a2,12
    7bd8:	011585b3          	add	a1,a1,a7
    7bdc:	00f67713          	and	a4,a2,15
    7be0:	04080463          	beqz	a6,7c28 <memmove+0x104>
    7be4:	ffc70813          	add	a6,a4,-4
    7be8:	ffc87813          	and	a6,a6,-4
    7bec:	00480813          	add	a6,a6,4
    7bf0:	010687b3          	add	a5,a3,a6
    7bf4:	00058713          	mv	a4,a1
    7bf8:	00072883          	lw	a7,0(a4)
    7bfc:	00468693          	add	a3,a3,4
    7c00:	00470713          	add	a4,a4,4
    7c04:	ff16ae23          	sw	a7,-4(a3)
    7c08:	fef698e3          	bne	a3,a5,7bf8 <memmove+0xd4>
    7c0c:	00367613          	and	a2,a2,3
    7c10:	010585b3          	add	a1,a1,a6
    7c14:	f49ff06f          	j	7b5c <memmove+0x38>
    7c18:	fff60693          	add	a3,a2,-1
    7c1c:	00050793          	mv	a5,a0
    7c20:	f45ff06f          	j	7b64 <memmove+0x40>
    7c24:	00008067          	ret
    7c28:	00070613          	mv	a2,a4
    7c2c:	f31ff06f          	j	7b5c <memmove+0x38>

00007c30 <frexp>:
    7c30:	ff010113          	add	sp,sp,-16
    7c34:	00912223          	sw	s1,4(sp)
    7c38:	800004b7          	lui	s1,0x80000
    7c3c:	00812423          	sw	s0,8(sp)
    7c40:	00112623          	sw	ra,12(sp)
    7c44:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7c48:	00060413          	mv	s0,a2
    7c4c:	00062023          	sw	zero,0(a2)
    7c50:	00b4f6b3          	and	a3,s1,a1
    7c54:	7ff00637          	lui	a2,0x7ff00
    7c58:	00058793          	mv	a5,a1
    7c5c:	00050713          	mv	a4,a0
    7c60:	04c6f063          	bgeu	a3,a2,7ca0 <frexp+0x70>
    7c64:	00a6e633          	or	a2,a3,a0
    7c68:	02060c63          	beqz	a2,7ca0 <frexp+0x70>
    7c6c:	0145d613          	srl	a2,a1,0x14
    7c70:	7ff67613          	and	a2,a2,2047
    7c74:	04060463          	beqz	a2,7cbc <frexp+0x8c>
    7c78:	00000593          	li	a1,0
    7c7c:	80100637          	lui	a2,0x80100
    7c80:	4146d693          	sra	a3,a3,0x14
    7c84:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7c88:	c0268693          	add	a3,a3,-1022
    7c8c:	00c7f7b3          	and	a5,a5,a2
    7c90:	00b686b3          	add	a3,a3,a1
    7c94:	3fe00637          	lui	a2,0x3fe00
    7c98:	00c7e7b3          	or	a5,a5,a2
    7c9c:	00d42023          	sw	a3,0(s0)
    7ca0:	00c12083          	lw	ra,12(sp)
    7ca4:	00812403          	lw	s0,8(sp)
    7ca8:	00412483          	lw	s1,4(sp)
    7cac:	00070513          	mv	a0,a4
    7cb0:	00078593          	mv	a1,a5
    7cb4:	01010113          	add	sp,sp,16
    7cb8:	00008067          	ret
    7cbc:	7fff9797          	auipc	a5,0x7fff9
    7cc0:	a0478793          	add	a5,a5,-1532 # 800006c0 <__global_locale+0x18c>
    7cc4:	0047a683          	lw	a3,4(a5)
    7cc8:	0007a603          	lw	a2,0(a5)
    7ccc:	009050ef          	jal	d4d4 <__muldf3>
    7cd0:	00058793          	mv	a5,a1
    7cd4:	00b4f6b3          	and	a3,s1,a1
    7cd8:	00050713          	mv	a4,a0
    7cdc:	fca00593          	li	a1,-54
    7ce0:	f9dff06f          	j	7c7c <frexp+0x4c>

00007ce4 <quorem>:
    7ce4:	fb010113          	add	sp,sp,-80
    7ce8:	04912223          	sw	s1,68(sp)
    7cec:	01052783          	lw	a5,16(a0)
    7cf0:	0105a483          	lw	s1,16(a1)
    7cf4:	04112623          	sw	ra,76(sp)
    7cf8:	00b12423          	sw	a1,8(sp)
    7cfc:	2097ca63          	blt	a5,s1,7f10 <quorem+0x22c>
    7d00:	fff48493          	add	s1,s1,-1
    7d04:	03512a23          	sw	s5,52(sp)
    7d08:	03812423          	sw	s8,40(sp)
    7d0c:	00249a93          	sll	s5,s1,0x2
    7d10:	01458c13          	add	s8,a1,20
    7d14:	05212023          	sw	s2,64(sp)
    7d18:	03312e23          	sw	s3,60(sp)
    7d1c:	015c0933          	add	s2,s8,s5
    7d20:	01450993          	add	s3,a0,20
    7d24:	015987b3          	add	a5,s3,s5
    7d28:	03712623          	sw	s7,44(sp)
    7d2c:	00092b83          	lw	s7,0(s2)
    7d30:	03912223          	sw	s9,36(sp)
    7d34:	0007ac83          	lw	s9,0(a5)
    7d38:	001b8b93          	add	s7,s7,1
    7d3c:	03412c23          	sw	s4,56(sp)
    7d40:	000b8593          	mv	a1,s7
    7d44:	00050a13          	mv	s4,a0
    7d48:	000c8513          	mv	a0,s9
    7d4c:	04812423          	sw	s0,72(sp)
    7d50:	00f12623          	sw	a5,12(sp)
    7d54:	70d060ef          	jal	ec60 <__hidden___udivsi3>
    7d58:	00050413          	mv	s0,a0
    7d5c:	0d7cee63          	bltu	s9,s7,7e38 <quorem+0x154>
    7d60:	03a12023          	sw	s10,32(sp)
    7d64:	00010d37          	lui	s10,0x10
    7d68:	01b12e23          	sw	s11,28(sp)
    7d6c:	03612823          	sw	s6,48(sp)
    7d70:	000c0a93          	mv	s5,s8
    7d74:	00098d93          	mv	s11,s3
    7d78:	00000c93          	li	s9,0
    7d7c:	00000b93          	li	s7,0
    7d80:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    7d84:	000aab03          	lw	s6,0(s5)
    7d88:	00040593          	mv	a1,s0
    7d8c:	004d8d93          	add	s11,s11,4
    7d90:	01ab7533          	and	a0,s6,s10
    7d94:	609060ef          	jal	eb9c <__mulsi3>
    7d98:	00050793          	mv	a5,a0
    7d9c:	00040593          	mv	a1,s0
    7da0:	010b5513          	srl	a0,s6,0x10
    7da4:	01978cb3          	add	s9,a5,s9
    7da8:	5f5060ef          	jal	eb9c <__mulsi3>
    7dac:	ffcda603          	lw	a2,-4(s11)
    7db0:	01acf733          	and	a4,s9,s10
    7db4:	010cdc93          	srl	s9,s9,0x10
    7db8:	01a677b3          	and	a5,a2,s10
    7dbc:	40e787b3          	sub	a5,a5,a4
    7dc0:	017787b3          	add	a5,a5,s7
    7dc4:	01950533          	add	a0,a0,s9
    7dc8:	4107d713          	sra	a4,a5,0x10
    7dcc:	01a575b3          	and	a1,a0,s10
    7dd0:	01065613          	srl	a2,a2,0x10
    7dd4:	40b70733          	sub	a4,a4,a1
    7dd8:	00c70733          	add	a4,a4,a2
    7ddc:	01a7f7b3          	and	a5,a5,s10
    7de0:	01071613          	sll	a2,a4,0x10
    7de4:	00c7e7b3          	or	a5,a5,a2
    7de8:	004a8a93          	add	s5,s5,4
    7dec:	fefdae23          	sw	a5,-4(s11)
    7df0:	01055c93          	srl	s9,a0,0x10
    7df4:	41075b93          	sra	s7,a4,0x10
    7df8:	f95976e3          	bgeu	s2,s5,7d84 <quorem+0xa0>
    7dfc:	00c12703          	lw	a4,12(sp)
    7e00:	00072783          	lw	a5,0(a4)
    7e04:	12079063          	bnez	a5,7f24 <quorem+0x240>
    7e08:	ffc70a93          	add	s5,a4,-4
    7e0c:	0159e863          	bltu	s3,s5,7e1c <quorem+0x138>
    7e10:	0180006f          	j	7e28 <quorem+0x144>
    7e14:	fff48493          	add	s1,s1,-1
    7e18:	0159f863          	bgeu	s3,s5,7e28 <quorem+0x144>
    7e1c:	000aa783          	lw	a5,0(s5)
    7e20:	ffca8a93          	add	s5,s5,-4
    7e24:	fe0788e3          	beqz	a5,7e14 <quorem+0x130>
    7e28:	03012b03          	lw	s6,48(sp)
    7e2c:	02012d03          	lw	s10,32(sp)
    7e30:	01c12d83          	lw	s11,28(sp)
    7e34:	009a2823          	sw	s1,16(s4)
    7e38:	00812583          	lw	a1,8(sp)
    7e3c:	000a0513          	mv	a0,s4
    7e40:	1fc020ef          	jal	a03c <__mcmp>
    7e44:	08054c63          	bltz	a0,7edc <quorem+0x1f8>
    7e48:	00010537          	lui	a0,0x10
    7e4c:	00098593          	mv	a1,s3
    7e50:	00000713          	li	a4,0
    7e54:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    7e58:	0005a683          	lw	a3,0(a1)
    7e5c:	000c2603          	lw	a2,0(s8)
    7e60:	00458593          	add	a1,a1,4
    7e64:	00a6f7b3          	and	a5,a3,a0
    7e68:	00a67833          	and	a6,a2,a0
    7e6c:	410787b3          	sub	a5,a5,a6
    7e70:	00e787b3          	add	a5,a5,a4
    7e74:	4107d713          	sra	a4,a5,0x10
    7e78:	01065613          	srl	a2,a2,0x10
    7e7c:	0106d693          	srl	a3,a3,0x10
    7e80:	40c70733          	sub	a4,a4,a2
    7e84:	00d70733          	add	a4,a4,a3
    7e88:	01071693          	sll	a3,a4,0x10
    7e8c:	00a7f7b3          	and	a5,a5,a0
    7e90:	00d7e7b3          	or	a5,a5,a3
    7e94:	004c0c13          	add	s8,s8,4
    7e98:	fef5ae23          	sw	a5,-4(a1)
    7e9c:	41075713          	sra	a4,a4,0x10
    7ea0:	fb897ce3          	bgeu	s2,s8,7e58 <quorem+0x174>
    7ea4:	00249793          	sll	a5,s1,0x2
    7ea8:	00f987b3          	add	a5,s3,a5
    7eac:	0007a703          	lw	a4,0(a5)
    7eb0:	02071463          	bnez	a4,7ed8 <quorem+0x1f4>
    7eb4:	ffc78793          	add	a5,a5,-4
    7eb8:	00f9e863          	bltu	s3,a5,7ec8 <quorem+0x1e4>
    7ebc:	0180006f          	j	7ed4 <quorem+0x1f0>
    7ec0:	fff48493          	add	s1,s1,-1
    7ec4:	00f9f863          	bgeu	s3,a5,7ed4 <quorem+0x1f0>
    7ec8:	0007a703          	lw	a4,0(a5)
    7ecc:	ffc78793          	add	a5,a5,-4
    7ed0:	fe0708e3          	beqz	a4,7ec0 <quorem+0x1dc>
    7ed4:	009a2823          	sw	s1,16(s4)
    7ed8:	00140413          	add	s0,s0,1
    7edc:	04c12083          	lw	ra,76(sp)
    7ee0:	00040513          	mv	a0,s0
    7ee4:	04812403          	lw	s0,72(sp)
    7ee8:	04012903          	lw	s2,64(sp)
    7eec:	03c12983          	lw	s3,60(sp)
    7ef0:	03812a03          	lw	s4,56(sp)
    7ef4:	03412a83          	lw	s5,52(sp)
    7ef8:	02c12b83          	lw	s7,44(sp)
    7efc:	02812c03          	lw	s8,40(sp)
    7f00:	02412c83          	lw	s9,36(sp)
    7f04:	04412483          	lw	s1,68(sp)
    7f08:	05010113          	add	sp,sp,80
    7f0c:	00008067          	ret
    7f10:	04c12083          	lw	ra,76(sp)
    7f14:	04412483          	lw	s1,68(sp)
    7f18:	00000513          	li	a0,0
    7f1c:	05010113          	add	sp,sp,80
    7f20:	00008067          	ret
    7f24:	00812583          	lw	a1,8(sp)
    7f28:	000a0513          	mv	a0,s4
    7f2c:	03012b03          	lw	s6,48(sp)
    7f30:	02012d03          	lw	s10,32(sp)
    7f34:	01c12d83          	lw	s11,28(sp)
    7f38:	104020ef          	jal	a03c <__mcmp>
    7f3c:	f00556e3          	bgez	a0,7e48 <quorem+0x164>
    7f40:	f9dff06f          	j	7edc <quorem+0x1f8>

00007f44 <_dtoa_r>:
    7f44:	03852303          	lw	t1,56(a0)
    7f48:	f5010113          	add	sp,sp,-176
    7f4c:	0a812423          	sw	s0,168(sp)
    7f50:	0a912223          	sw	s1,164(sp)
    7f54:	0b212023          	sw	s2,160(sp)
    7f58:	09412c23          	sw	s4,152(sp)
    7f5c:	07b12e23          	sw	s11,124(sp)
    7f60:	0a112623          	sw	ra,172(sp)
    7f64:	09312e23          	sw	s3,156(sp)
    7f68:	09512a23          	sw	s5,148(sp)
    7f6c:	00e12a23          	sw	a4,20(sp)
    7f70:	00f12623          	sw	a5,12(sp)
    7f74:	01112423          	sw	a7,8(sp)
    7f78:	02b12223          	sw	a1,36(sp)
    7f7c:	00c12023          	sw	a2,0(sp)
    7f80:	00050413          	mv	s0,a0
    7f84:	00058d93          	mv	s11,a1
    7f88:	00060493          	mv	s1,a2
    7f8c:	00068a13          	mv	s4,a3
    7f90:	00080913          	mv	s2,a6
    7f94:	02030263          	beqz	t1,7fb8 <_dtoa_r+0x74>
    7f98:	03c52703          	lw	a4,60(a0)
    7f9c:	00100793          	li	a5,1
    7fa0:	00030593          	mv	a1,t1
    7fa4:	00e797b3          	sll	a5,a5,a4
    7fa8:	00e32223          	sw	a4,4(t1)
    7fac:	00f32423          	sw	a5,8(t1)
    7fb0:	734010ef          	jal	96e4 <_Bfree>
    7fb4:	02042c23          	sw	zero,56(s0)
    7fb8:	00048993          	mv	s3,s1
    7fbc:	00000693          	li	a3,0
    7fc0:	0004dc63          	bgez	s1,7fd8 <_dtoa_r+0x94>
    7fc4:	00149493          	sll	s1,s1,0x1
    7fc8:	0014d793          	srl	a5,s1,0x1
    7fcc:	00f12023          	sw	a5,0(sp)
    7fd0:	00078993          	mv	s3,a5
    7fd4:	00100693          	li	a3,1
    7fd8:	7ff00737          	lui	a4,0x7ff00
    7fdc:	00d92023          	sw	a3,0(s2)
    7fe0:	00e9f6b3          	and	a3,s3,a4
    7fe4:	64e68463          	beq	a3,a4,862c <_dtoa_r+0x6e8>
    7fe8:	00012483          	lw	s1,0(sp)
    7fec:	000d8513          	mv	a0,s11
    7ff0:	00000613          	li	a2,0
    7ff4:	00048593          	mv	a1,s1
    7ff8:	00000693          	li	a3,0
    7ffc:	01b12c23          	sw	s11,24(sp)
    8000:	00912e23          	sw	s1,28(sp)
    8004:	23c050ef          	jal	d240 <__eqdf2>
    8008:	04051c63          	bnez	a0,8060 <_dtoa_r+0x11c>
    800c:	00c12703          	lw	a4,12(sp)
    8010:	00100793          	li	a5,1
    8014:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    8018:	00812703          	lw	a4,8(sp)
    801c:	00070863          	beqz	a4,802c <_dtoa_r+0xe8>
    8020:	00007797          	auipc	a5,0x7
    8024:	f4978793          	add	a5,a5,-183 # ef69 <__fini_array_end+0x1d5>
    8028:	00f72023          	sw	a5,0(a4)
    802c:	00007a97          	auipc	s5,0x7
    8030:	f3ca8a93          	add	s5,s5,-196 # ef68 <__fini_array_end+0x1d4>
    8034:	0ac12083          	lw	ra,172(sp)
    8038:	0a812403          	lw	s0,168(sp)
    803c:	0a412483          	lw	s1,164(sp)
    8040:	0a012903          	lw	s2,160(sp)
    8044:	09c12983          	lw	s3,156(sp)
    8048:	09812a03          	lw	s4,152(sp)
    804c:	07c12d83          	lw	s11,124(sp)
    8050:	000a8513          	mv	a0,s5
    8054:	09412a83          	lw	s5,148(sp)
    8058:	0b010113          	add	sp,sp,176
    805c:	00008067          	ret
    8060:	00048613          	mv	a2,s1
    8064:	06810713          	add	a4,sp,104
    8068:	06c10693          	add	a3,sp,108
    806c:	000d8593          	mv	a1,s11
    8070:	00040513          	mv	a0,s0
    8074:	09612823          	sw	s6,144(sp)
    8078:	09712623          	sw	s7,140(sp)
    807c:	09812423          	sw	s8,136(sp)
    8080:	09912223          	sw	s9,132(sp)
    8084:	09a12023          	sw	s10,128(sp)
    8088:	0149d913          	srl	s2,s3,0x14
    808c:	268020ef          	jal	a2f4 <__d2b>
    8090:	00050493          	mv	s1,a0
    8094:	5c091e63          	bnez	s2,8670 <_dtoa_r+0x72c>
    8098:	06812a83          	lw	s5,104(sp)
    809c:	06c12903          	lw	s2,108(sp)
    80a0:	02000793          	li	a5,32
    80a4:	012a8933          	add	s2,s5,s2
    80a8:	43290713          	add	a4,s2,1074
    80ac:	36e7dae3          	bge	a5,a4,8c20 <_dtoa_r+0xcdc>
    80b0:	04000793          	li	a5,64
    80b4:	40e787b3          	sub	a5,a5,a4
    80b8:	41290513          	add	a0,s2,1042
    80bc:	00f997b3          	sll	a5,s3,a5
    80c0:	00add533          	srl	a0,s11,a0
    80c4:	00a7e533          	or	a0,a5,a0
    80c8:	634060ef          	jal	e6fc <__floatunsidf>
    80cc:	fe1007b7          	lui	a5,0xfe100
    80d0:	00100693          	li	a3,1
    80d4:	00050713          	mv	a4,a0
    80d8:	00b787b3          	add	a5,a5,a1
    80dc:	fff90913          	add	s2,s2,-1
    80e0:	02d12c23          	sw	a3,56(sp)
    80e4:	7fff8697          	auipc	a3,0x7fff8
    80e8:	5e468693          	add	a3,a3,1508 # 800006c8 <__global_locale+0x194>
    80ec:	0006a603          	lw	a2,0(a3)
    80f0:	0046a683          	lw	a3,4(a3)
    80f4:	00070513          	mv	a0,a4
    80f8:	00078593          	mv	a1,a5
    80fc:	369050ef          	jal	dc64 <__subdf3>
    8100:	7fff8797          	auipc	a5,0x7fff8
    8104:	5d078793          	add	a5,a5,1488 # 800006d0 <__global_locale+0x19c>
    8108:	0007a603          	lw	a2,0(a5)
    810c:	0047a683          	lw	a3,4(a5)
    8110:	3c4050ef          	jal	d4d4 <__muldf3>
    8114:	7fff8797          	auipc	a5,0x7fff8
    8118:	5c478793          	add	a5,a5,1476 # 800006d8 <__global_locale+0x1a4>
    811c:	0007a603          	lw	a2,0(a5)
    8120:	0047a683          	lw	a3,4(a5)
    8124:	7a9030ef          	jal	c0cc <__adddf3>
    8128:	00050b13          	mv	s6,a0
    812c:	00090513          	mv	a0,s2
    8130:	00058993          	mv	s3,a1
    8134:	510060ef          	jal	e644 <__floatsidf>
    8138:	7fff8797          	auipc	a5,0x7fff8
    813c:	5a878793          	add	a5,a5,1448 # 800006e0 <__global_locale+0x1ac>
    8140:	0007a603          	lw	a2,0(a5)
    8144:	0047a683          	lw	a3,4(a5)
    8148:	38c050ef          	jal	d4d4 <__muldf3>
    814c:	00050613          	mv	a2,a0
    8150:	00058693          	mv	a3,a1
    8154:	000b0513          	mv	a0,s6
    8158:	00098593          	mv	a1,s3
    815c:	771030ef          	jal	c0cc <__adddf3>
    8160:	00050b93          	mv	s7,a0
    8164:	00058b13          	mv	s6,a1
    8168:	458060ef          	jal	e5c0 <__fixdfsi>
    816c:	00050993          	mv	s3,a0
    8170:	000b0593          	mv	a1,s6
    8174:	000b8513          	mv	a0,s7
    8178:	00000613          	li	a2,0
    817c:	00000693          	li	a3,0
    8180:	24c050ef          	jal	d3cc <__ledf2>
    8184:	02055063          	bgez	a0,81a4 <_dtoa_r+0x260>
    8188:	00098513          	mv	a0,s3
    818c:	4b8060ef          	jal	e644 <__floatsidf>
    8190:	000b8613          	mv	a2,s7
    8194:	000b0693          	mv	a3,s6
    8198:	0a8050ef          	jal	d240 <__eqdf2>
    819c:	00a03533          	snez	a0,a0
    81a0:	40a989b3          	sub	s3,s3,a0
    81a4:	412a8ab3          	sub	s5,s5,s2
    81a8:	01600793          	li	a5,22
    81ac:	fffa8b13          	add	s6,s5,-1
    81b0:	2137e2e3          	bltu	a5,s3,8bb4 <_dtoa_r+0xc70>
    81b4:	00399713          	sll	a4,s3,0x3
    81b8:	00007797          	auipc	a5,0x7
    81bc:	44878793          	add	a5,a5,1096 # f600 <__mprec_tens>
    81c0:	00e787b3          	add	a5,a5,a4
    81c4:	0007a603          	lw	a2,0(a5)
    81c8:	0047a683          	lw	a3,4(a5)
    81cc:	01812503          	lw	a0,24(sp)
    81d0:	01c12583          	lw	a1,28(sp)
    81d4:	1f8050ef          	jal	d3cc <__ledf2>
    81d8:	220554e3          	bgez	a0,8c00 <_dtoa_r+0xcbc>
    81dc:	fff98993          	add	s3,s3,-1
    81e0:	02012a23          	sw	zero,52(sp)
    81e4:	00012823          	sw	zero,16(sp)
    81e8:	4a0b4863          	bltz	s6,8698 <_dtoa_r+0x754>
    81ec:	4c09d063          	bgez	s3,86ac <_dtoa_r+0x768>
    81f0:	01012783          	lw	a5,16(sp)
    81f4:	03312023          	sw	s3,32(sp)
    81f8:	413787b3          	sub	a5,a5,s3
    81fc:	00f12823          	sw	a5,16(sp)
    8200:	413007b3          	neg	a5,s3
    8204:	02f12823          	sw	a5,48(sp)
    8208:	00900793          	li	a5,9
    820c:	00000993          	li	s3,0
    8210:	4b47e863          	bltu	a5,s4,86c0 <_dtoa_r+0x77c>
    8214:	00500793          	li	a5,5
    8218:	2147dae3          	bge	a5,s4,8c2c <_dtoa_r+0xce8>
    821c:	ffca0a13          	add	s4,s4,-4
    8220:	00300793          	li	a5,3
    8224:	00000913          	li	s2,0
    8228:	66fa02e3          	beq	s4,a5,908c <_dtoa_r+0x1148>
    822c:	6147dae3          	bge	a5,s4,9040 <_dtoa_r+0x10fc>
    8230:	00400793          	li	a5,4
    8234:	54fa1ae3          	bne	s4,a5,8f88 <_dtoa_r+0x1044>
    8238:	00100793          	li	a5,1
    823c:	02f12423          	sw	a5,40(sp)
    8240:	01412603          	lw	a2,20(sp)
    8244:	62c05ce3          	blez	a2,907c <_dtoa_r+0x1138>
    8248:	02c12e23          	sw	a2,60(sp)
    824c:	00060c13          	mv	s8,a2
    8250:	01700693          	li	a3,23
    8254:	00100713          	li	a4,1
    8258:	00400793          	li	a5,4
    825c:	00c6c463          	blt	a3,a2,8264 <_dtoa_r+0x320>
    8260:	3540106f          	j	95b4 <_dtoa_r+0x1670>
    8264:	00179793          	sll	a5,a5,0x1
    8268:	01478693          	add	a3,a5,20
    826c:	00070593          	mv	a1,a4
    8270:	00170713          	add	a4,a4,1
    8274:	fed678e3          	bgeu	a2,a3,8264 <_dtoa_r+0x320>
    8278:	02b42e23          	sw	a1,60(s0)
    827c:	00040513          	mv	a0,s0
    8280:	3b0010ef          	jal	9630 <_Balloc>
    8284:	00050a93          	mv	s5,a0
    8288:	00051463          	bnez	a0,8290 <_dtoa_r+0x34c>
    828c:	30c0106f          	j	9598 <_dtoa_r+0x1654>
    8290:	02a42c23          	sw	a0,56(s0)
    8294:	00e00793          	li	a5,14
    8298:	5187ea63          	bltu	a5,s8,87ac <_dtoa_r+0x868>
    829c:	50090863          	beqz	s2,87ac <_dtoa_r+0x868>
    82a0:	02012783          	lw	a5,32(sp)
    82a4:	62f054e3          	blez	a5,90cc <_dtoa_r+0x1188>
    82a8:	00f7f713          	and	a4,a5,15
    82ac:	00371713          	sll	a4,a4,0x3
    82b0:	4047dc93          	sra	s9,a5,0x4
    82b4:	00007797          	auipc	a5,0x7
    82b8:	34c78793          	add	a5,a5,844 # f600 <__mprec_tens>
    82bc:	00e787b3          	add	a5,a5,a4
    82c0:	010cf693          	and	a3,s9,16
    82c4:	0007a803          	lw	a6,0(a5)
    82c8:	0047a703          	lw	a4,4(a5)
    82cc:	560682e3          	beqz	a3,9030 <_dtoa_r+0x10ec>
    82d0:	00007797          	auipc	a5,0x7
    82d4:	30878793          	add	a5,a5,776 # f5d8 <__mprec_bigtens>
    82d8:	0207a603          	lw	a2,32(a5)
    82dc:	0247a683          	lw	a3,36(a5)
    82e0:	01812503          	lw	a0,24(sp)
    82e4:	01c12583          	lw	a1,28(sp)
    82e8:	04e12423          	sw	a4,72(sp)
    82ec:	05012023          	sw	a6,64(sp)
    82f0:	6a4040ef          	jal	c994 <__divdf3>
    82f4:	04012803          	lw	a6,64(sp)
    82f8:	04812703          	lw	a4,72(sp)
    82fc:	00fcfc93          	and	s9,s9,15
    8300:	00050313          	mv	t1,a0
    8304:	00058d13          	mv	s10,a1
    8308:	00300913          	li	s2,3
    830c:	040c8c63          	beqz	s9,8364 <_dtoa_r+0x420>
    8310:	04812023          	sw	s0,64(sp)
    8314:	00007b97          	auipc	s7,0x7
    8318:	2c4b8b93          	add	s7,s7,708 # f5d8 <__mprec_bigtens>
    831c:	00090413          	mv	s0,s2
    8320:	00070593          	mv	a1,a4
    8324:	00030913          	mv	s2,t1
    8328:	001cf793          	and	a5,s9,1
    832c:	00078e63          	beqz	a5,8348 <_dtoa_r+0x404>
    8330:	000ba603          	lw	a2,0(s7)
    8334:	004ba683          	lw	a3,4(s7)
    8338:	00080513          	mv	a0,a6
    833c:	00140413          	add	s0,s0,1
    8340:	194050ef          	jal	d4d4 <__muldf3>
    8344:	00050813          	mv	a6,a0
    8348:	401cdc93          	sra	s9,s9,0x1
    834c:	008b8b93          	add	s7,s7,8
    8350:	fc0c9ce3          	bnez	s9,8328 <_dtoa_r+0x3e4>
    8354:	00090313          	mv	t1,s2
    8358:	00040913          	mv	s2,s0
    835c:	04012403          	lw	s0,64(sp)
    8360:	00058713          	mv	a4,a1
    8364:	00070693          	mv	a3,a4
    8368:	00080613          	mv	a2,a6
    836c:	00030513          	mv	a0,t1
    8370:	000d0593          	mv	a1,s10
    8374:	620040ef          	jal	c994 <__divdf3>
    8378:	00050713          	mv	a4,a0
    837c:	00058793          	mv	a5,a1
    8380:	03412683          	lw	a3,52(sp)
    8384:	02068c63          	beqz	a3,83bc <_dtoa_r+0x478>
    8388:	7fff8697          	auipc	a3,0x7fff8
    838c:	36068693          	add	a3,a3,864 # 800006e8 <__global_locale+0x1b4>
    8390:	0006a603          	lw	a2,0(a3)
    8394:	0046a683          	lw	a3,4(a3)
    8398:	00070513          	mv	a0,a4
    839c:	00078593          	mv	a1,a5
    83a0:	04e12423          	sw	a4,72(sp)
    83a4:	04f12023          	sw	a5,64(sp)
    83a8:	024050ef          	jal	d3cc <__ledf2>
    83ac:	04012783          	lw	a5,64(sp)
    83b0:	04812703          	lw	a4,72(sp)
    83b4:	00055463          	bgez	a0,83bc <_dtoa_r+0x478>
    83b8:	04c0106f          	j	9404 <_dtoa_r+0x14c0>
    83bc:	00090513          	mv	a0,s2
    83c0:	04f12623          	sw	a5,76(sp)
    83c4:	04e12023          	sw	a4,64(sp)
    83c8:	27c060ef          	jal	e644 <__floatsidf>
    83cc:	04012703          	lw	a4,64(sp)
    83d0:	04c12783          	lw	a5,76(sp)
    83d4:	00070613          	mv	a2,a4
    83d8:	00078693          	mv	a3,a5
    83dc:	04e12423          	sw	a4,72(sp)
    83e0:	04f12023          	sw	a5,64(sp)
    83e4:	0f0050ef          	jal	d4d4 <__muldf3>
    83e8:	7fff8697          	auipc	a3,0x7fff8
    83ec:	31068693          	add	a3,a3,784 # 800006f8 <__global_locale+0x1c4>
    83f0:	0006a603          	lw	a2,0(a3)
    83f4:	0046a683          	lw	a3,4(a3)
    83f8:	4d5030ef          	jal	c0cc <__adddf3>
    83fc:	fcc006b7          	lui	a3,0xfcc00
    8400:	04012783          	lw	a5,64(sp)
    8404:	04812703          	lw	a4,72(sp)
    8408:	00050c93          	mv	s9,a0
    840c:	00b68bb3          	add	s7,a3,a1
    8410:	340c0463          	beqz	s8,8758 <_dtoa_r+0x814>
    8414:	02012683          	lw	a3,32(sp)
    8418:	05812423          	sw	s8,72(sp)
    841c:	04d12e23          	sw	a3,92(sp)
    8420:	00070513          	mv	a0,a4
    8424:	00078593          	mv	a1,a5
    8428:	04e12623          	sw	a4,76(sp)
    842c:	04f12023          	sw	a5,64(sp)
    8430:	190060ef          	jal	e5c0 <__fixdfsi>
    8434:	04812783          	lw	a5,72(sp)
    8438:	00050913          	mv	s2,a0
    843c:	05912c23          	sw	s9,88(sp)
    8440:	fff78693          	add	a3,a5,-1
    8444:	00369693          	sll	a3,a3,0x3
    8448:	00007797          	auipc	a5,0x7
    844c:	1b878793          	add	a5,a5,440 # f600 <__mprec_tens>
    8450:	00d786b3          	add	a3,a5,a3
    8454:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    8458:	0046a803          	lw	a6,4(a3)
    845c:	001a8d13          	add	s10,s5,1
    8460:	04f12823          	sw	a5,80(sp)
    8464:	05012a23          	sw	a6,84(sp)
    8468:	1dc060ef          	jal	e644 <__floatsidf>
    846c:	04c12703          	lw	a4,76(sp)
    8470:	04012783          	lw	a5,64(sp)
    8474:	00050613          	mv	a2,a0
    8478:	00058693          	mv	a3,a1
    847c:	00070513          	mv	a0,a4
    8480:	00078593          	mv	a1,a5
    8484:	7e0050ef          	jal	dc64 <__subdf3>
    8488:	02812703          	lw	a4,40(sp)
    848c:	03090313          	add	t1,s2,48
    8490:	05a12023          	sw	s10,64(sp)
    8494:	00050c93          	mv	s9,a0
    8498:	0ff37313          	zext.b	t1,t1
    849c:	5c0706e3          	beqz	a4,9268 <_dtoa_r+0x1324>
    84a0:	7fff8797          	auipc	a5,0x7fff8
    84a4:	21878793          	add	a5,a5,536 # 800006b8 <__global_locale+0x184>
    84a8:	0007a503          	lw	a0,0(a5)
    84ac:	05012603          	lw	a2,80(sp)
    84b0:	05412683          	lw	a3,84(sp)
    84b4:	04b12023          	sw	a1,64(sp)
    84b8:	0047a583          	lw	a1,4(a5)
    84bc:	04612623          	sw	t1,76(sp)
    84c0:	4d4040ef          	jal	c994 <__divdf3>
    84c4:	05812603          	lw	a2,88(sp)
    84c8:	000b8693          	mv	a3,s7
    84cc:	798050ef          	jal	dc64 <__subdf3>
    84d0:	04012883          	lw	a7,64(sp)
    84d4:	04c12303          	lw	t1,76(sp)
    84d8:	000c8613          	mv	a2,s9
    84dc:	00088693          	mv	a3,a7
    84e0:	006a8023          	sb	t1,0(s5)
    84e4:	00050913          	mv	s2,a0
    84e8:	00058b93          	mv	s7,a1
    84ec:	5e1040ef          	jal	d2cc <__gedf2>
    84f0:	04012883          	lw	a7,64(sp)
    84f4:	00a05463          	blez	a0,84fc <_dtoa_r+0x5b8>
    84f8:	7c90006f          	j	94c0 <_dtoa_r+0x157c>
    84fc:	7fff8697          	auipc	a3,0x7fff8
    8500:	1ec68693          	add	a3,a3,492 # 800006e8 <__global_locale+0x1b4>
    8504:	0006a783          	lw	a5,0(a3)
    8508:	0046a803          	lw	a6,4(a3)
    850c:	05312623          	sw	s3,76(sp)
    8510:	04f12023          	sw	a5,64(sp)
    8514:	00000793          	li	a5,0
    8518:	05612823          	sw	s6,80(sp)
    851c:	05812c23          	sw	s8,88(sp)
    8520:	05012223          	sw	a6,68(sp)
    8524:	04812c03          	lw	s8,72(sp)
    8528:	00078b13          	mv	s6,a5
    852c:	05412423          	sw	s4,72(sp)
    8530:	00088993          	mv	s3,a7
    8534:	0980006f          	j	85cc <_dtoa_r+0x688>
    8538:	001b0b13          	add	s6,s6,1
    853c:	018b4463          	blt	s6,s8,8544 <_dtoa_r+0x600>
    8540:	7d10006f          	j	9510 <_dtoa_r+0x15cc>
    8544:	7fff8a17          	auipc	s4,0x7fff8
    8548:	1aca0a13          	add	s4,s4,428 # 800006f0 <__global_locale+0x1bc>
    854c:	000a2603          	lw	a2,0(s4)
    8550:	004a2683          	lw	a3,4(s4)
    8554:	00090513          	mv	a0,s2
    8558:	000b8593          	mv	a1,s7
    855c:	779040ef          	jal	d4d4 <__muldf3>
    8560:	000a2603          	lw	a2,0(s4)
    8564:	004a2683          	lw	a3,4(s4)
    8568:	00050913          	mv	s2,a0
    856c:	00058b93          	mv	s7,a1
    8570:	000c8513          	mv	a0,s9
    8574:	00098593          	mv	a1,s3
    8578:	75d040ef          	jal	d4d4 <__muldf3>
    857c:	00058c93          	mv	s9,a1
    8580:	00050a13          	mv	s4,a0
    8584:	03c060ef          	jal	e5c0 <__fixdfsi>
    8588:	00050993          	mv	s3,a0
    858c:	0b8060ef          	jal	e644 <__floatsidf>
    8590:	00050613          	mv	a2,a0
    8594:	00058693          	mv	a3,a1
    8598:	000a0513          	mv	a0,s4
    859c:	000c8593          	mv	a1,s9
    85a0:	6c4050ef          	jal	dc64 <__subdf3>
    85a4:	03098793          	add	a5,s3,48
    85a8:	00090613          	mv	a2,s2
    85ac:	000b8693          	mv	a3,s7
    85b0:	00fd0023          	sb	a5,0(s10)
    85b4:	001d0d13          	add	s10,s10,1
    85b8:	00050c93          	mv	s9,a0
    85bc:	00058993          	mv	s3,a1
    85c0:	60d040ef          	jal	d3cc <__ledf2>
    85c4:	00055463          	bgez	a0,85cc <_dtoa_r+0x688>
    85c8:	6f90006f          	j	94c0 <_dtoa_r+0x157c>
    85cc:	04012503          	lw	a0,64(sp)
    85d0:	04412583          	lw	a1,68(sp)
    85d4:	000c8613          	mv	a2,s9
    85d8:	00098693          	mv	a3,s3
    85dc:	688050ef          	jal	dc64 <__subdf3>
    85e0:	00090613          	mv	a2,s2
    85e4:	000b8693          	mv	a3,s7
    85e8:	5e5040ef          	jal	d3cc <__ledf2>
    85ec:	f40556e3          	bgez	a0,8538 <_dtoa_r+0x5f4>
    85f0:	05c12783          	lw	a5,92(sp)
    85f4:	000d0b93          	mv	s7,s10
    85f8:	00178c13          	add	s8,a5,1
    85fc:	03900613          	li	a2,57
    8600:	0080006f          	j	8608 <_dtoa_r+0x6c4>
    8604:	697a88e3          	beq	s5,s7,9494 <_dtoa_r+0x1550>
    8608:	fffbc683          	lbu	a3,-1(s7)
    860c:	000b8d13          	mv	s10,s7
    8610:	fffb8b93          	add	s7,s7,-1
    8614:	fec688e3          	beq	a3,a2,8604 <_dtoa_r+0x6c0>
    8618:	00168693          	add	a3,a3,1
    861c:	0ff6f693          	zext.b	a3,a3
    8620:	00db8023          	sb	a3,0(s7)
    8624:	000c0a13          	mv	s4,s8
    8628:	4f00006f          	j	8b18 <_dtoa_r+0xbd4>
    862c:	00c12683          	lw	a3,12(sp)
    8630:	00002737          	lui	a4,0x2
    8634:	00c99793          	sll	a5,s3,0xc
    8638:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x9cb>
    863c:	00c7d793          	srl	a5,a5,0xc
    8640:	00e6a023          	sw	a4,0(a3)
    8644:	01b7e7b3          	or	a5,a5,s11
    8648:	0a078063          	beqz	a5,86e8 <_dtoa_r+0x7a4>
    864c:	00812783          	lw	a5,8(sp)
    8650:	00007a97          	auipc	s5,0x7
    8654:	970a8a93          	add	s5,s5,-1680 # efc0 <__fini_array_end+0x22c>
    8658:	9c078ee3          	beqz	a5,8034 <_dtoa_r+0xf0>
    865c:	00007797          	auipc	a5,0x7
    8660:	96778793          	add	a5,a5,-1689 # efc3 <__fini_array_end+0x22f>
    8664:	00812703          	lw	a4,8(sp)
    8668:	00f72023          	sw	a5,0(a4)
    866c:	9c9ff06f          	j	8034 <_dtoa_r+0xf0>
    8670:	01c12783          	lw	a5,28(sp)
    8674:	3ff006b7          	lui	a3,0x3ff00
    8678:	06812a83          	lw	s5,104(sp)
    867c:	00c79793          	sll	a5,a5,0xc
    8680:	00c7d793          	srl	a5,a5,0xc
    8684:	01812703          	lw	a4,24(sp)
    8688:	00d7e7b3          	or	a5,a5,a3
    868c:	c0190913          	add	s2,s2,-1023
    8690:	02012c23          	sw	zero,56(sp)
    8694:	a51ff06f          	j	80e4 <_dtoa_r+0x1a0>
    8698:	00100793          	li	a5,1
    869c:	415787b3          	sub	a5,a5,s5
    86a0:	00f12823          	sw	a5,16(sp)
    86a4:	00000b13          	li	s6,0
    86a8:	b409c4e3          	bltz	s3,81f0 <_dtoa_r+0x2ac>
    86ac:	03312023          	sw	s3,32(sp)
    86b0:	02012823          	sw	zero,48(sp)
    86b4:	00900793          	li	a5,9
    86b8:	013b0b33          	add	s6,s6,s3
    86bc:	b547fce3          	bgeu	a5,s4,8214 <_dtoa_r+0x2d0>
    86c0:	00100793          	li	a5,1
    86c4:	00100913          	li	s2,1
    86c8:	00000a13          	li	s4,0
    86cc:	02f12423          	sw	a5,40(sp)
    86d0:	fff00c13          	li	s8,-1
    86d4:	00012a23          	sw	zero,20(sp)
    86d8:	02042e23          	sw	zero,60(s0)
    86dc:	03812e23          	sw	s8,60(sp)
    86e0:	00000593          	li	a1,0
    86e4:	b99ff06f          	j	827c <_dtoa_r+0x338>
    86e8:	00812703          	lw	a4,8(sp)
    86ec:	00007a97          	auipc	s5,0x7
    86f0:	8c8a8a93          	add	s5,s5,-1848 # efb4 <__fini_array_end+0x220>
    86f4:	00007797          	auipc	a5,0x7
    86f8:	8c878793          	add	a5,a5,-1848 # efbc <__fini_array_end+0x228>
    86fc:	f60714e3          	bnez	a4,8664 <_dtoa_r+0x720>
    8700:	935ff06f          	j	8034 <_dtoa_r+0xf0>
    8704:	00090513          	mv	a0,s2
    8708:	04f12623          	sw	a5,76(sp)
    870c:	04e12023          	sw	a4,64(sp)
    8710:	735050ef          	jal	e644 <__floatsidf>
    8714:	04012703          	lw	a4,64(sp)
    8718:	04c12783          	lw	a5,76(sp)
    871c:	00070613          	mv	a2,a4
    8720:	00078693          	mv	a3,a5
    8724:	04e12423          	sw	a4,72(sp)
    8728:	04f12023          	sw	a5,64(sp)
    872c:	5a9040ef          	jal	d4d4 <__muldf3>
    8730:	7fff8697          	auipc	a3,0x7fff8
    8734:	fc868693          	add	a3,a3,-56 # 800006f8 <__global_locale+0x1c4>
    8738:	0006a603          	lw	a2,0(a3)
    873c:	0046a683          	lw	a3,4(a3)
    8740:	18d030ef          	jal	c0cc <__adddf3>
    8744:	04012783          	lw	a5,64(sp)
    8748:	04812703          	lw	a4,72(sp)
    874c:	fcc006b7          	lui	a3,0xfcc00
    8750:	00050c93          	mv	s9,a0
    8754:	00b68bb3          	add	s7,a3,a1
    8758:	7fff8697          	auipc	a3,0x7fff8
    875c:	fa868693          	add	a3,a3,-88 # 80000700 <__global_locale+0x1cc>
    8760:	0006a603          	lw	a2,0(a3)
    8764:	0046a683          	lw	a3,4(a3)
    8768:	00070513          	mv	a0,a4
    876c:	00078593          	mv	a1,a5
    8770:	4f4050ef          	jal	dc64 <__subdf3>
    8774:	000c8613          	mv	a2,s9
    8778:	000b8693          	mv	a3,s7
    877c:	00050d13          	mv	s10,a0
    8780:	00058913          	mv	s2,a1
    8784:	349040ef          	jal	d2cc <__gedf2>
    8788:	50a04ce3          	bgtz	a0,94a0 <_dtoa_r+0x155c>
    878c:	800007b7          	lui	a5,0x80000
    8790:	0177c7b3          	xor	a5,a5,s7
    8794:	000c8613          	mv	a2,s9
    8798:	000d0513          	mv	a0,s10
    879c:	00078693          	mv	a3,a5
    87a0:	00090593          	mv	a1,s2
    87a4:	429040ef          	jal	d3cc <__ledf2>
    87a8:	06054c63          	bltz	a0,8820 <_dtoa_r+0x8dc>
    87ac:	06c12783          	lw	a5,108(sp)
    87b0:	1a07c663          	bltz	a5,895c <_dtoa_r+0xa18>
    87b4:	02012683          	lw	a3,32(sp)
    87b8:	00e00713          	li	a4,14
    87bc:	1ad74063          	blt	a4,a3,895c <_dtoa_r+0xa18>
    87c0:	02012783          	lw	a5,32(sp)
    87c4:	00379713          	sll	a4,a5,0x3
    87c8:	00007797          	auipc	a5,0x7
    87cc:	e3878793          	add	a5,a5,-456 # f600 <__mprec_tens>
    87d0:	00e787b3          	add	a5,a5,a4
    87d4:	0007a903          	lw	s2,0(a5)
    87d8:	0047a983          	lw	s3,4(a5)
    87dc:	01412783          	lw	a5,20(sp)
    87e0:	0407dc63          	bgez	a5,8838 <_dtoa_r+0x8f4>
    87e4:	05804a63          	bgtz	s8,8838 <_dtoa_r+0x8f4>
    87e8:	020c1c63          	bnez	s8,8820 <_dtoa_r+0x8dc>
    87ec:	7fff8797          	auipc	a5,0x7fff8
    87f0:	f1478793          	add	a5,a5,-236 # 80000700 <__global_locale+0x1cc>
    87f4:	0007a603          	lw	a2,0(a5)
    87f8:	0047a683          	lw	a3,4(a5)
    87fc:	00090513          	mv	a0,s2
    8800:	00098593          	mv	a1,s3
    8804:	4d1040ef          	jal	d4d4 <__muldf3>
    8808:	00050613          	mv	a2,a0
    880c:	00058693          	mv	a3,a1
    8810:	01812503          	lw	a0,24(sp)
    8814:	01c12583          	lw	a1,28(sp)
    8818:	3b5040ef          	jal	d3cc <__ledf2>
    881c:	48a042e3          	bgtz	a0,94a0 <_dtoa_r+0x155c>
    8820:	000a8d13          	mv	s10,s5
    8824:	00012c23          	sw	zero,24(sp)
    8828:	00000913          	li	s2,0
    882c:	01412783          	lw	a5,20(sp)
    8830:	fff7ca13          	not	s4,a5
    8834:	6980006f          	j	8ecc <_dtoa_r+0xf88>
    8838:	001a8793          	add	a5,s5,1
    883c:	04f12023          	sw	a5,64(sp)
    8840:	01812b03          	lw	s6,24(sp)
    8844:	01c12a03          	lw	s4,28(sp)
    8848:	00090613          	mv	a2,s2
    884c:	00098693          	mv	a3,s3
    8850:	000b0513          	mv	a0,s6
    8854:	000a0593          	mv	a1,s4
    8858:	13c040ef          	jal	c994 <__divdf3>
    885c:	565050ef          	jal	e5c0 <__fixdfsi>
    8860:	00050d13          	mv	s10,a0
    8864:	5e1050ef          	jal	e644 <__floatsidf>
    8868:	00090613          	mv	a2,s2
    886c:	00098693          	mv	a3,s3
    8870:	465040ef          	jal	d4d4 <__muldf3>
    8874:	00050613          	mv	a2,a0
    8878:	00058693          	mv	a3,a1
    887c:	000b0513          	mv	a0,s6
    8880:	000a0593          	mv	a1,s4
    8884:	3e0050ef          	jal	dc64 <__subdf3>
    8888:	030d0793          	add	a5,s10,48
    888c:	00fa8023          	sb	a5,0(s5)
    8890:	00100613          	li	a2,1
    8894:	04012b83          	lw	s7,64(sp)
    8898:	00050713          	mv	a4,a0
    889c:	00058693          	mv	a3,a1
    88a0:	0ccc0ee3          	beq	s8,a2,917c <_dtoa_r+0x1238>
    88a4:	7fff8617          	auipc	a2,0x7fff8
    88a8:	e4c60613          	add	a2,a2,-436 # 800006f0 <__global_locale+0x1bc>
    88ac:	00062783          	lw	a5,0(a2)
    88b0:	00462803          	lw	a6,4(a2)
    88b4:	00100d93          	li	s11,1
    88b8:	00f12023          	sw	a5,0(sp)
    88bc:	01012223          	sw	a6,4(sp)
    88c0:	0600006f          	j	8920 <_dtoa_r+0x9dc>
    88c4:	00090613          	mv	a2,s2
    88c8:	00098693          	mv	a3,s3
    88cc:	000b0513          	mv	a0,s6
    88d0:	000a0593          	mv	a1,s4
    88d4:	0c0040ef          	jal	c994 <__divdf3>
    88d8:	4e9050ef          	jal	e5c0 <__fixdfsi>
    88dc:	00050d13          	mv	s10,a0
    88e0:	565050ef          	jal	e644 <__floatsidf>
    88e4:	00090613          	mv	a2,s2
    88e8:	00098693          	mv	a3,s3
    88ec:	3e9040ef          	jal	d4d4 <__muldf3>
    88f0:	00058693          	mv	a3,a1
    88f4:	00050613          	mv	a2,a0
    88f8:	000a0593          	mv	a1,s4
    88fc:	000b0513          	mv	a0,s6
    8900:	364050ef          	jal	dc64 <__subdf3>
    8904:	001b8b93          	add	s7,s7,1
    8908:	030d0793          	add	a5,s10,48
    890c:	001d8d93          	add	s11,s11,1
    8910:	fefb8fa3          	sb	a5,-1(s7)
    8914:	00050713          	mv	a4,a0
    8918:	00058693          	mv	a3,a1
    891c:	07bc00e3          	beq	s8,s11,917c <_dtoa_r+0x1238>
    8920:	00012603          	lw	a2,0(sp)
    8924:	00068593          	mv	a1,a3
    8928:	00412683          	lw	a3,4(sp)
    892c:	00070513          	mv	a0,a4
    8930:	3a5040ef          	jal	d4d4 <__muldf3>
    8934:	00000613          	li	a2,0
    8938:	00000693          	li	a3,0
    893c:	00050b13          	mv	s6,a0
    8940:	00058a13          	mv	s4,a1
    8944:	0fd040ef          	jal	d240 <__eqdf2>
    8948:	f6051ee3          	bnez	a0,88c4 <_dtoa_r+0x980>
    894c:	02012783          	lw	a5,32(sp)
    8950:	000b8d13          	mv	s10,s7
    8954:	00178a13          	add	s4,a5,1
    8958:	1c00006f          	j	8b18 <_dtoa_r+0xbd4>
    895c:	02812703          	lw	a4,40(sp)
    8960:	26071463          	bnez	a4,8bc8 <_dtoa_r+0xc84>
    8964:	03012b83          	lw	s7,48(sp)
    8968:	01012c83          	lw	s9,16(sp)
    896c:	02012423          	sw	zero,40(sp)
    8970:	00000913          	li	s2,0
    8974:	020c8263          	beqz	s9,8998 <_dtoa_r+0xa54>
    8978:	03605063          	blez	s6,8998 <_dtoa_r+0xa54>
    897c:	000c8793          	mv	a5,s9
    8980:	679b4263          	blt	s6,s9,8fe4 <_dtoa_r+0x10a0>
    8984:	01012703          	lw	a4,16(sp)
    8988:	40fc8cb3          	sub	s9,s9,a5
    898c:	40fb0b33          	sub	s6,s6,a5
    8990:	40f70733          	sub	a4,a4,a5
    8994:	00e12823          	sw	a4,16(sp)
    8998:	03012783          	lw	a5,48(sp)
    899c:	02078263          	beqz	a5,89c0 <_dtoa_r+0xa7c>
    89a0:	02812783          	lw	a5,40(sp)
    89a4:	00078463          	beqz	a5,89ac <_dtoa_r+0xa68>
    89a8:	060b9ae3          	bnez	s7,921c <_dtoa_r+0x12d8>
    89ac:	03012603          	lw	a2,48(sp)
    89b0:	00048593          	mv	a1,s1
    89b4:	00040513          	mv	a0,s0
    89b8:	3a4010ef          	jal	9d5c <__pow5mult>
    89bc:	00050493          	mv	s1,a0
    89c0:	00100593          	li	a1,1
    89c4:	00040513          	mv	a0,s0
    89c8:	01c010ef          	jal	99e4 <__i2b>
    89cc:	00a12c23          	sw	a0,24(sp)
    89d0:	50099a63          	bnez	s3,8ee4 <_dtoa_r+0xfa0>
    89d4:	00100793          	li	a5,1
    89d8:	5547da63          	bge	a5,s4,8f2c <_dtoa_r+0xfe8>
    89dc:	016787b3          	add	a5,a5,s6
    89e0:	01f7f793          	and	a5,a5,31
    89e4:	1c078e63          	beqz	a5,8bc0 <_dtoa_r+0xc7c>
    89e8:	02000713          	li	a4,32
    89ec:	40f70733          	sub	a4,a4,a5
    89f0:	00400693          	li	a3,4
    89f4:	58e6d263          	bge	a3,a4,8f78 <_dtoa_r+0x1034>
    89f8:	01c00713          	li	a4,28
    89fc:	40f707b3          	sub	a5,a4,a5
    8a00:	01012703          	lw	a4,16(sp)
    8a04:	00fc8cb3          	add	s9,s9,a5
    8a08:	00fb0b33          	add	s6,s6,a5
    8a0c:	00f70733          	add	a4,a4,a5
    8a10:	00e12823          	sw	a4,16(sp)
    8a14:	01012783          	lw	a5,16(sp)
    8a18:	12f04e63          	bgtz	a5,8b54 <_dtoa_r+0xc10>
    8a1c:	01605c63          	blez	s6,8a34 <_dtoa_r+0xaf0>
    8a20:	01812583          	lw	a1,24(sp)
    8a24:	000b0613          	mv	a2,s6
    8a28:	00040513          	mv	a0,s0
    8a2c:	480010ef          	jal	9eac <__lshift>
    8a30:	00a12c23          	sw	a0,24(sp)
    8a34:	03412783          	lw	a5,52(sp)
    8a38:	12079a63          	bnez	a5,8b6c <_dtoa_r+0xc28>
    8a3c:	45805263          	blez	s8,8e80 <_dtoa_r+0xf3c>
    8a40:	02812783          	lw	a5,40(sp)
    8a44:	24079e63          	bnez	a5,8ca0 <_dtoa_r+0xd5c>
    8a48:	02012783          	lw	a5,32(sp)
    8a4c:	00178a13          	add	s4,a5,1
    8a50:	01812b03          	lw	s6,24(sp)
    8a54:	00100993          	li	s3,1
    8a58:	0200006f          	j	8a78 <_dtoa_r+0xb34>
    8a5c:	00048593          	mv	a1,s1
    8a60:	00000693          	li	a3,0
    8a64:	00a00613          	li	a2,10
    8a68:	00040513          	mv	a0,s0
    8a6c:	49d000ef          	jal	9708 <__multadd>
    8a70:	00050493          	mv	s1,a0
    8a74:	00198993          	add	s3,s3,1
    8a78:	000b0593          	mv	a1,s6
    8a7c:	00048513          	mv	a0,s1
    8a80:	a64ff0ef          	jal	7ce4 <quorem>
    8a84:	03050b93          	add	s7,a0,48
    8a88:	013a87b3          	add	a5,s5,s3
    8a8c:	ff778fa3          	sb	s7,-1(a5)
    8a90:	fd89c6e3          	blt	s3,s8,8a5c <_dtoa_r+0xb18>
    8a94:	00100993          	li	s3,1
    8a98:	55804263          	bgtz	s8,8fdc <_dtoa_r+0x1098>
    8a9c:	013a89b3          	add	s3,s5,s3
    8aa0:	00000c13          	li	s8,0
    8aa4:	00048593          	mv	a1,s1
    8aa8:	00100613          	li	a2,1
    8aac:	00040513          	mv	a0,s0
    8ab0:	3fc010ef          	jal	9eac <__lshift>
    8ab4:	01812583          	lw	a1,24(sp)
    8ab8:	00050493          	mv	s1,a0
    8abc:	580010ef          	jal	a03c <__mcmp>
    8ac0:	4ea05c63          	blez	a0,8fb8 <_dtoa_r+0x1074>
    8ac4:	03900693          	li	a3,57
    8ac8:	0080006f          	j	8ad0 <_dtoa_r+0xb8c>
    8acc:	5f3a8863          	beq	s5,s3,90bc <_dtoa_r+0x1178>
    8ad0:	fff9c783          	lbu	a5,-1(s3)
    8ad4:	00098d13          	mv	s10,s3
    8ad8:	fff98993          	add	s3,s3,-1
    8adc:	fed788e3          	beq	a5,a3,8acc <_dtoa_r+0xb88>
    8ae0:	00178793          	add	a5,a5,1
    8ae4:	00f98023          	sb	a5,0(s3)
    8ae8:	01812583          	lw	a1,24(sp)
    8aec:	00040513          	mv	a0,s0
    8af0:	3f5000ef          	jal	96e4 <_Bfree>
    8af4:	02090263          	beqz	s2,8b18 <_dtoa_r+0xbd4>
    8af8:	000c0a63          	beqz	s8,8b0c <_dtoa_r+0xbc8>
    8afc:	012c0863          	beq	s8,s2,8b0c <_dtoa_r+0xbc8>
    8b00:	000c0593          	mv	a1,s8
    8b04:	00040513          	mv	a0,s0
    8b08:	3dd000ef          	jal	96e4 <_Bfree>
    8b0c:	00090593          	mv	a1,s2
    8b10:	00040513          	mv	a0,s0
    8b14:	3d1000ef          	jal	96e4 <_Bfree>
    8b18:	00048593          	mv	a1,s1
    8b1c:	00040513          	mv	a0,s0
    8b20:	3c5000ef          	jal	96e4 <_Bfree>
    8b24:	00c12783          	lw	a5,12(sp)
    8b28:	000d0023          	sb	zero,0(s10)
    8b2c:	0147a023          	sw	s4,0(a5)
    8b30:	00812783          	lw	a5,8(sp)
    8b34:	00078463          	beqz	a5,8b3c <_dtoa_r+0xbf8>
    8b38:	01a7a023          	sw	s10,0(a5)
    8b3c:	09012b03          	lw	s6,144(sp)
    8b40:	08c12b83          	lw	s7,140(sp)
    8b44:	08812c03          	lw	s8,136(sp)
    8b48:	08412c83          	lw	s9,132(sp)
    8b4c:	08012d03          	lw	s10,128(sp)
    8b50:	ce4ff06f          	j	8034 <_dtoa_r+0xf0>
    8b54:	00048593          	mv	a1,s1
    8b58:	00078613          	mv	a2,a5
    8b5c:	00040513          	mv	a0,s0
    8b60:	34c010ef          	jal	9eac <__lshift>
    8b64:	00050493          	mv	s1,a0
    8b68:	eb5ff06f          	j	8a1c <_dtoa_r+0xad8>
    8b6c:	01812583          	lw	a1,24(sp)
    8b70:	00048513          	mv	a0,s1
    8b74:	4c8010ef          	jal	a03c <__mcmp>
    8b78:	ec0552e3          	bgez	a0,8a3c <_dtoa_r+0xaf8>
    8b7c:	02012783          	lw	a5,32(sp)
    8b80:	00048593          	mv	a1,s1
    8b84:	00000693          	li	a3,0
    8b88:	00a00613          	li	a2,10
    8b8c:	00040513          	mv	a0,s0
    8b90:	fff78b13          	add	s6,a5,-1
    8b94:	375000ef          	jal	9708 <__multadd>
    8b98:	02812783          	lw	a5,40(sp)
    8b9c:	00050493          	mv	s1,a0
    8ba0:	0c079e63          	bnez	a5,8c7c <_dtoa_r+0xd38>
    8ba4:	03c12c03          	lw	s8,60(sp)
    8ba8:	17805ee3          	blez	s8,9524 <_dtoa_r+0x15e0>
    8bac:	02012a03          	lw	s4,32(sp)
    8bb0:	ea1ff06f          	j	8a50 <_dtoa_r+0xb0c>
    8bb4:	00100793          	li	a5,1
    8bb8:	02f12a23          	sw	a5,52(sp)
    8bbc:	e28ff06f          	j	81e4 <_dtoa_r+0x2a0>
    8bc0:	01c00793          	li	a5,28
    8bc4:	e3dff06f          	j	8a00 <_dtoa_r+0xabc>
    8bc8:	00100713          	li	a4,1
    8bcc:	4d475463          	bge	a4,s4,9094 <_dtoa_r+0x1150>
    8bd0:	03012783          	lw	a5,48(sp)
    8bd4:	fffc0b93          	add	s7,s8,-1
    8bd8:	4177ca63          	blt	a5,s7,8fec <_dtoa_r+0x10a8>
    8bdc:	41778bb3          	sub	s7,a5,s7
    8be0:	01012783          	lw	a5,16(sp)
    8be4:	41878cb3          	sub	s9,a5,s8
    8be8:	100c54e3          	bgez	s8,94f0 <_dtoa_r+0x15ac>
    8bec:	00100593          	li	a1,1
    8bf0:	00040513          	mv	a0,s0
    8bf4:	5f1000ef          	jal	99e4 <__i2b>
    8bf8:	00050913          	mv	s2,a0
    8bfc:	d79ff06f          	j	8974 <_dtoa_r+0xa30>
    8c00:	02012a23          	sw	zero,52(sp)
    8c04:	00012823          	sw	zero,16(sp)
    8c08:	ab5042e3          	bgtz	s5,86ac <_dtoa_r+0x768>
    8c0c:	00100793          	li	a5,1
    8c10:	415787b3          	sub	a5,a5,s5
    8c14:	00f12823          	sw	a5,16(sp)
    8c18:	00000b13          	li	s6,0
    8c1c:	a91ff06f          	j	86ac <_dtoa_r+0x768>
    8c20:	40e787b3          	sub	a5,a5,a4
    8c24:	00fd9533          	sll	a0,s11,a5
    8c28:	ca0ff06f          	j	80c8 <_dtoa_r+0x184>
    8c2c:	00300793          	li	a5,3
    8c30:	00100913          	li	s2,1
    8c34:	44fa0c63          	beq	s4,a5,908c <_dtoa_r+0x1148>
    8c38:	df47cc63          	blt	a5,s4,8230 <_dtoa_r+0x2ec>
    8c3c:	00200793          	li	a5,2
    8c40:	18fa00e3          	beq	s4,a5,95c0 <_dtoa_r+0x167c>
    8c44:	02042e23          	sw	zero,60(s0)
    8c48:	00000593          	li	a1,0
    8c4c:	00040513          	mv	a0,s0
    8c50:	1e1000ef          	jal	9630 <_Balloc>
    8c54:	00050a93          	mv	s5,a0
    8c58:	140500e3          	beqz	a0,9598 <_dtoa_r+0x1654>
    8c5c:	00100793          	li	a5,1
    8c60:	02f12423          	sw	a5,40(sp)
    8c64:	fff00793          	li	a5,-1
    8c68:	02a42c23          	sw	a0,56(s0)
    8c6c:	02f12e23          	sw	a5,60(sp)
    8c70:	fff00c13          	li	s8,-1
    8c74:	00012a23          	sw	zero,20(sp)
    8c78:	b35ff06f          	j	87ac <_dtoa_r+0x868>
    8c7c:	00090593          	mv	a1,s2
    8c80:	00000693          	li	a3,0
    8c84:	00a00613          	li	a2,10
    8c88:	00040513          	mv	a0,s0
    8c8c:	27d000ef          	jal	9708 <__multadd>
    8c90:	03c12c03          	lw	s8,60(sp)
    8c94:	00050913          	mv	s2,a0
    8c98:	0b805ae3          	blez	s8,954c <_dtoa_r+0x1608>
    8c9c:	03612023          	sw	s6,32(sp)
    8ca0:	01905c63          	blez	s9,8cb8 <_dtoa_r+0xd74>
    8ca4:	00090593          	mv	a1,s2
    8ca8:	000c8613          	mv	a2,s9
    8cac:	00040513          	mv	a0,s0
    8cb0:	1fc010ef          	jal	9eac <__lshift>
    8cb4:	00050913          	mv	s2,a0
    8cb8:	00090b13          	mv	s6,s2
    8cbc:	50099e63          	bnez	s3,91d8 <_dtoa_r+0x1294>
    8cc0:	02412783          	lw	a5,36(sp)
    8cc4:	fffa8d13          	add	s10,s5,-1
    8cc8:	000a8c93          	mv	s9,s5
    8ccc:	01512823          	sw	s5,16(sp)
    8cd0:	01812a83          	lw	s5,24(sp)
    8cd4:	0017f793          	and	a5,a5,1
    8cd8:	018d0d33          	add	s10,s10,s8
    8cdc:	00f12023          	sw	a5,0(sp)
    8ce0:	01b12a23          	sw	s11,20(sp)
    8ce4:	000a8593          	mv	a1,s5
    8ce8:	00048513          	mv	a0,s1
    8cec:	ff9fe0ef          	jal	7ce4 <quorem>
    8cf0:	00050c13          	mv	s8,a0
    8cf4:	00090593          	mv	a1,s2
    8cf8:	00048513          	mv	a0,s1
    8cfc:	340010ef          	jal	a03c <__mcmp>
    8d00:	00050993          	mv	s3,a0
    8d04:	000b0613          	mv	a2,s6
    8d08:	000a8593          	mv	a1,s5
    8d0c:	00040513          	mv	a0,s0
    8d10:	384010ef          	jal	a094 <__mdiff>
    8d14:	00c52703          	lw	a4,12(a0)
    8d18:	030c0b93          	add	s7,s8,48
    8d1c:	00050d93          	mv	s11,a0
    8d20:	08071c63          	bnez	a4,8db8 <_dtoa_r+0xe74>
    8d24:	00050593          	mv	a1,a0
    8d28:	00048513          	mv	a0,s1
    8d2c:	310010ef          	jal	a03c <__mcmp>
    8d30:	00050713          	mv	a4,a0
    8d34:	000d8593          	mv	a1,s11
    8d38:	00040513          	mv	a0,s0
    8d3c:	00070d93          	mv	s11,a4
    8d40:	1a5000ef          	jal	96e4 <_Bfree>
    8d44:	014de6b3          	or	a3,s11,s4
    8d48:	0e069a63          	bnez	a3,8e3c <_dtoa_r+0xef8>
    8d4c:	00012783          	lw	a5,0(sp)
    8d50:	76078e63          	beqz	a5,94cc <_dtoa_r+0x1588>
    8d54:	7809c663          	bltz	s3,94e0 <_dtoa_r+0x159c>
    8d58:	017c8023          	sb	s7,0(s9)
    8d5c:	001c8993          	add	s3,s9,1
    8d60:	679d0e63          	beq	s10,s9,93dc <_dtoa_r+0x1498>
    8d64:	00048593          	mv	a1,s1
    8d68:	00000693          	li	a3,0
    8d6c:	00a00613          	li	a2,10
    8d70:	00040513          	mv	a0,s0
    8d74:	195000ef          	jal	9708 <__multadd>
    8d78:	00050493          	mv	s1,a0
    8d7c:	00000693          	li	a3,0
    8d80:	00a00613          	li	a2,10
    8d84:	00090593          	mv	a1,s2
    8d88:	00040513          	mv	a0,s0
    8d8c:	09690e63          	beq	s2,s6,8e28 <_dtoa_r+0xee4>
    8d90:	179000ef          	jal	9708 <__multadd>
    8d94:	000b0593          	mv	a1,s6
    8d98:	00050913          	mv	s2,a0
    8d9c:	00000693          	li	a3,0
    8da0:	00a00613          	li	a2,10
    8da4:	00040513          	mv	a0,s0
    8da8:	161000ef          	jal	9708 <__multadd>
    8dac:	00050b13          	mv	s6,a0
    8db0:	00098c93          	mv	s9,s3
    8db4:	f31ff06f          	j	8ce4 <_dtoa_r+0xda0>
    8db8:	00050593          	mv	a1,a0
    8dbc:	00040513          	mv	a0,s0
    8dc0:	01012a83          	lw	s5,16(sp)
    8dc4:	01412d83          	lw	s11,20(sp)
    8dc8:	11d000ef          	jal	96e4 <_Bfree>
    8dcc:	0009ca63          	bltz	s3,8de0 <_dtoa_r+0xe9c>
    8dd0:	001df713          	and	a4,s11,1
    8dd4:	0149e9b3          	or	s3,s3,s4
    8dd8:	01376733          	or	a4,a4,s3
    8ddc:	06071e63          	bnez	a4,8e58 <_dtoa_r+0xf14>
    8de0:	00048593          	mv	a1,s1
    8de4:	00100613          	li	a2,1
    8de8:	00040513          	mv	a0,s0
    8dec:	0c0010ef          	jal	9eac <__lshift>
    8df0:	01812583          	lw	a1,24(sp)
    8df4:	00050493          	mv	s1,a0
    8df8:	244010ef          	jal	a03c <__mcmp>
    8dfc:	24a05863          	blez	a0,904c <_dtoa_r+0x1108>
    8e00:	03900713          	li	a4,57
    8e04:	24eb8c63          	beq	s7,a4,905c <_dtoa_r+0x1118>
    8e08:	031c0b93          	add	s7,s8,49
    8e0c:	02012783          	lw	a5,32(sp)
    8e10:	00090c13          	mv	s8,s2
    8e14:	001c8d13          	add	s10,s9,1
    8e18:	017c8023          	sb	s7,0(s9)
    8e1c:	00178a13          	add	s4,a5,1
    8e20:	000b0913          	mv	s2,s6
    8e24:	cc5ff06f          	j	8ae8 <_dtoa_r+0xba4>
    8e28:	0e1000ef          	jal	9708 <__multadd>
    8e2c:	00050913          	mv	s2,a0
    8e30:	00050b13          	mv	s6,a0
    8e34:	00098c93          	mv	s9,s3
    8e38:	eadff06f          	j	8ce4 <_dtoa_r+0xda0>
    8e3c:	7409c863          	bltz	s3,958c <_dtoa_r+0x1648>
    8e40:	00012783          	lw	a5,0(sp)
    8e44:	0149e9b3          	or	s3,s3,s4
    8e48:	0137e9b3          	or	s3,a5,s3
    8e4c:	74098063          	beqz	s3,958c <_dtoa_r+0x1648>
    8e50:	f1b054e3          	blez	s11,8d58 <_dtoa_r+0xe14>
    8e54:	01012a83          	lw	s5,16(sp)
    8e58:	03900713          	li	a4,57
    8e5c:	20eb8063          	beq	s7,a4,905c <_dtoa_r+0x1118>
    8e60:	02012703          	lw	a4,32(sp)
    8e64:	001b8793          	add	a5,s7,1
    8e68:	00090c13          	mv	s8,s2
    8e6c:	001c8d13          	add	s10,s9,1
    8e70:	00170a13          	add	s4,a4,1
    8e74:	00fc8023          	sb	a5,0(s9)
    8e78:	000b0913          	mv	s2,s6
    8e7c:	c6dff06f          	j	8ae8 <_dtoa_r+0xba4>
    8e80:	00200793          	li	a5,2
    8e84:	bb47dee3          	bge	a5,s4,8a40 <_dtoa_r+0xafc>
    8e88:	000a8d13          	mv	s10,s5
    8e8c:	9a0c10e3          	bnez	s8,882c <_dtoa_r+0x8e8>
    8e90:	01812583          	lw	a1,24(sp)
    8e94:	00000693          	li	a3,0
    8e98:	00500613          	li	a2,5
    8e9c:	00040513          	mv	a0,s0
    8ea0:	069000ef          	jal	9708 <__multadd>
    8ea4:	00050593          	mv	a1,a0
    8ea8:	00a12c23          	sw	a0,24(sp)
    8eac:	00048513          	mv	a0,s1
    8eb0:	18c010ef          	jal	a03c <__mcmp>
    8eb4:	96a05ce3          	blez	a0,882c <_dtoa_r+0x8e8>
    8eb8:	03100793          	li	a5,49
    8ebc:	00fa8023          	sb	a5,0(s5)
    8ec0:	02012783          	lw	a5,32(sp)
    8ec4:	001a8d13          	add	s10,s5,1
    8ec8:	00178a13          	add	s4,a5,1
    8ecc:	01812583          	lw	a1,24(sp)
    8ed0:	00040513          	mv	a0,s0
    8ed4:	001a0a13          	add	s4,s4,1
    8ed8:	00d000ef          	jal	96e4 <_Bfree>
    8edc:	c20918e3          	bnez	s2,8b0c <_dtoa_r+0xbc8>
    8ee0:	c39ff06f          	j	8b18 <_dtoa_r+0xbd4>
    8ee4:	00050593          	mv	a1,a0
    8ee8:	00098613          	mv	a2,s3
    8eec:	00040513          	mv	a0,s0
    8ef0:	66d000ef          	jal	9d5c <__pow5mult>
    8ef4:	00100793          	li	a5,1
    8ef8:	00a12c23          	sw	a0,24(sp)
    8efc:	1147de63          	bge	a5,s4,9018 <_dtoa_r+0x10d4>
    8f00:	00000993          	li	s3,0
    8f04:	01812703          	lw	a4,24(sp)
    8f08:	01072783          	lw	a5,16(a4)
    8f0c:	00378793          	add	a5,a5,3
    8f10:	00279793          	sll	a5,a5,0x2
    8f14:	00f707b3          	add	a5,a4,a5
    8f18:	0047a503          	lw	a0,4(a5)
    8f1c:	171000ef          	jal	988c <__hi0bits>
    8f20:	02000793          	li	a5,32
    8f24:	40a787b3          	sub	a5,a5,a0
    8f28:	ab5ff06f          	j	89dc <_dtoa_r+0xa98>
    8f2c:	02412783          	lw	a5,36(sp)
    8f30:	04079063          	bnez	a5,8f70 <_dtoa_r+0x102c>
    8f34:	00012783          	lw	a5,0(sp)
    8f38:	00c79793          	sll	a5,a5,0xc
    8f3c:	02079a63          	bnez	a5,8f70 <_dtoa_r+0x102c>
    8f40:	00012683          	lw	a3,0(sp)
    8f44:	00000793          	li	a5,0
    8f48:	0146d713          	srl	a4,a3,0x14
    8f4c:	7ff77713          	and	a4,a4,2047
    8f50:	00070c63          	beqz	a4,8f68 <_dtoa_r+0x1024>
    8f54:	01012783          	lw	a5,16(sp)
    8f58:	001b0b13          	add	s6,s6,1
    8f5c:	00178793          	add	a5,a5,1
    8f60:	00f12823          	sw	a5,16(sp)
    8f64:	00100793          	li	a5,1
    8f68:	58099063          	bnez	s3,94e8 <_dtoa_r+0x15a4>
    8f6c:	00078993          	mv	s3,a5
    8f70:	00100793          	li	a5,1
    8f74:	a69ff06f          	j	89dc <_dtoa_r+0xa98>
    8f78:	a8d70ee3          	beq	a4,a3,8a14 <_dtoa_r+0xad0>
    8f7c:	03c00713          	li	a4,60
    8f80:	40f707b3          	sub	a5,a4,a5
    8f84:	a7dff06f          	j	8a00 <_dtoa_r+0xabc>
    8f88:	00100793          	li	a5,1
    8f8c:	00500a13          	li	s4,5
    8f90:	02f12423          	sw	a5,40(sp)
    8f94:	01412783          	lw	a5,20(sp)
    8f98:	02012703          	lw	a4,32(sp)
    8f9c:	00e787b3          	add	a5,a5,a4
    8fa0:	00178c13          	add	s8,a5,1
    8fa4:	02f12e23          	sw	a5,60(sp)
    8fa8:	000c0613          	mv	a2,s8
    8fac:	ab804263          	bgtz	s8,8250 <_dtoa_r+0x30c>
    8fb0:	00100613          	li	a2,1
    8fb4:	a9cff06f          	j	8250 <_dtoa_r+0x30c>
    8fb8:	00051663          	bnez	a0,8fc4 <_dtoa_r+0x1080>
    8fbc:	001bf793          	and	a5,s7,1
    8fc0:	b00792e3          	bnez	a5,8ac4 <_dtoa_r+0xb80>
    8fc4:	03000693          	li	a3,48
    8fc8:	fff9c783          	lbu	a5,-1(s3)
    8fcc:	00098d13          	mv	s10,s3
    8fd0:	fff98993          	add	s3,s3,-1
    8fd4:	fed78ae3          	beq	a5,a3,8fc8 <_dtoa_r+0x1084>
    8fd8:	b11ff06f          	j	8ae8 <_dtoa_r+0xba4>
    8fdc:	000c0993          	mv	s3,s8
    8fe0:	abdff06f          	j	8a9c <_dtoa_r+0xb58>
    8fe4:	000b0793          	mv	a5,s6
    8fe8:	99dff06f          	j	8984 <_dtoa_r+0xa40>
    8fec:	03012783          	lw	a5,48(sp)
    8ff0:	01012703          	lw	a4,16(sp)
    8ff4:	03712823          	sw	s7,48(sp)
    8ff8:	40fb87b3          	sub	a5,s7,a5
    8ffc:	00f989b3          	add	s3,s3,a5
    9000:	018707b3          	add	a5,a4,s8
    9004:	00070c93          	mv	s9,a4
    9008:	018b0b33          	add	s6,s6,s8
    900c:	00f12823          	sw	a5,16(sp)
    9010:	00000b93          	li	s7,0
    9014:	bd9ff06f          	j	8bec <_dtoa_r+0xca8>
    9018:	02412783          	lw	a5,36(sp)
    901c:	ee0792e3          	bnez	a5,8f00 <_dtoa_r+0xfbc>
    9020:	00012783          	lw	a5,0(sp)
    9024:	00c79793          	sll	a5,a5,0xc
    9028:	ec079ce3          	bnez	a5,8f00 <_dtoa_r+0xfbc>
    902c:	f15ff06f          	j	8f40 <_dtoa_r+0xffc>
    9030:	01812303          	lw	t1,24(sp)
    9034:	01c12d03          	lw	s10,28(sp)
    9038:	00200913          	li	s2,2
    903c:	ad0ff06f          	j	830c <_dtoa_r+0x3c8>
    9040:	00200a13          	li	s4,2
    9044:	02012423          	sw	zero,40(sp)
    9048:	9f8ff06f          	j	8240 <_dtoa_r+0x2fc>
    904c:	dc0510e3          	bnez	a0,8e0c <_dtoa_r+0xec8>
    9050:	001bf713          	and	a4,s7,1
    9054:	da0716e3          	bnez	a4,8e00 <_dtoa_r+0xebc>
    9058:	db5ff06f          	j	8e0c <_dtoa_r+0xec8>
    905c:	03900793          	li	a5,57
    9060:	00fc8023          	sb	a5,0(s9)
    9064:	02012783          	lw	a5,32(sp)
    9068:	00090c13          	mv	s8,s2
    906c:	001c8993          	add	s3,s9,1
    9070:	00178a13          	add	s4,a5,1
    9074:	000b0913          	mv	s2,s6
    9078:	a4dff06f          	j	8ac4 <_dtoa_r+0xb80>
    907c:	00100793          	li	a5,1
    9080:	00100c13          	li	s8,1
    9084:	00f12a23          	sw	a5,20(sp)
    9088:	e50ff06f          	j	86d8 <_dtoa_r+0x794>
    908c:	02012423          	sw	zero,40(sp)
    9090:	f05ff06f          	j	8f94 <_dtoa_r+0x1050>
    9094:	03812703          	lw	a4,56(sp)
    9098:	30070e63          	beqz	a4,93b4 <_dtoa_r+0x1470>
    909c:	01012703          	lw	a4,16(sp)
    90a0:	43378793          	add	a5,a5,1075
    90a4:	00fb0b33          	add	s6,s6,a5
    90a8:	00f707b3          	add	a5,a4,a5
    90ac:	03012b83          	lw	s7,48(sp)
    90b0:	00070c93          	mv	s9,a4
    90b4:	00f12823          	sw	a5,16(sp)
    90b8:	b35ff06f          	j	8bec <_dtoa_r+0xca8>
    90bc:	03100793          	li	a5,49
    90c0:	00fa8023          	sb	a5,0(s5)
    90c4:	001a0a13          	add	s4,s4,1
    90c8:	a21ff06f          	j	8ae8 <_dtoa_r+0xba4>
    90cc:	02012783          	lw	a5,32(sp)
    90d0:	32078263          	beqz	a5,93f4 <_dtoa_r+0x14b0>
    90d4:	40f00bb3          	neg	s7,a5
    90d8:	00fbf713          	and	a4,s7,15
    90dc:	00371713          	sll	a4,a4,0x3
    90e0:	00006797          	auipc	a5,0x6
    90e4:	52078793          	add	a5,a5,1312 # f600 <__mprec_tens>
    90e8:	00e787b3          	add	a5,a5,a4
    90ec:	0007a603          	lw	a2,0(a5)
    90f0:	0047a683          	lw	a3,4(a5)
    90f4:	01812503          	lw	a0,24(sp)
    90f8:	01c12583          	lw	a1,28(sp)
    90fc:	404bdb93          	sra	s7,s7,0x4
    9100:	3d4040ef          	jal	d4d4 <__muldf3>
    9104:	00058d13          	mv	s10,a1
    9108:	440b8c63          	beqz	s7,9560 <_dtoa_r+0x161c>
    910c:	00200913          	li	s2,2
    9110:	04812023          	sw	s0,64(sp)
    9114:	00006c97          	auipc	s9,0x6
    9118:	4c4c8c93          	add	s9,s9,1220 # f5d8 <__mprec_bigtens>
    911c:	00090413          	mv	s0,s2
    9120:	00050713          	mv	a4,a0
    9124:	00000613          	li	a2,0
    9128:	00050913          	mv	s2,a0
    912c:	001bf693          	and	a3,s7,1
    9130:	02068063          	beqz	a3,9150 <_dtoa_r+0x120c>
    9134:	000ca603          	lw	a2,0(s9)
    9138:	004ca683          	lw	a3,4(s9)
    913c:	00070513          	mv	a0,a4
    9140:	00140413          	add	s0,s0,1
    9144:	390040ef          	jal	d4d4 <__muldf3>
    9148:	00050713          	mv	a4,a0
    914c:	00100613          	li	a2,1
    9150:	401bdb93          	sra	s7,s7,0x1
    9154:	008c8c93          	add	s9,s9,8
    9158:	fc0b9ae3          	bnez	s7,912c <_dtoa_r+0x11e8>
    915c:	00090513          	mv	a0,s2
    9160:	00058793          	mv	a5,a1
    9164:	00040913          	mv	s2,s0
    9168:	04012403          	lw	s0,64(sp)
    916c:	a0061a63          	bnez	a2,8380 <_dtoa_r+0x43c>
    9170:	00050713          	mv	a4,a0
    9174:	000d0793          	mv	a5,s10
    9178:	a08ff06f          	j	8380 <_dtoa_r+0x43c>
    917c:	00068593          	mv	a1,a3
    9180:	00070613          	mv	a2,a4
    9184:	00070513          	mv	a0,a4
    9188:	745020ef          	jal	c0cc <__adddf3>
    918c:	02012783          	lw	a5,32(sp)
    9190:	00090613          	mv	a2,s2
    9194:	00098693          	mv	a3,s3
    9198:	00178a13          	add	s4,a5,1
    919c:	00050c93          	mv	s9,a0
    91a0:	00058b13          	mv	s6,a1
    91a4:	000a0c13          	mv	s8,s4
    91a8:	124040ef          	jal	d2cc <__gedf2>
    91ac:	c4a04863          	bgtz	a0,85fc <_dtoa_r+0x6b8>
    91b0:	000c8513          	mv	a0,s9
    91b4:	000b0593          	mv	a1,s6
    91b8:	00090613          	mv	a2,s2
    91bc:	00098693          	mv	a3,s3
    91c0:	080040ef          	jal	d240 <__eqdf2>
    91c4:	00051663          	bnez	a0,91d0 <_dtoa_r+0x128c>
    91c8:	001d7d13          	and	s10,s10,1
    91cc:	c20d1863          	bnez	s10,85fc <_dtoa_r+0x6b8>
    91d0:	000b8d13          	mv	s10,s7
    91d4:	945ff06f          	j	8b18 <_dtoa_r+0xbd4>
    91d8:	00492583          	lw	a1,4(s2)
    91dc:	00040513          	mv	a0,s0
    91e0:	450000ef          	jal	9630 <_Balloc>
    91e4:	00050993          	mv	s3,a0
    91e8:	38050463          	beqz	a0,9570 <_dtoa_r+0x162c>
    91ec:	01092603          	lw	a2,16(s2)
    91f0:	00c90593          	add	a1,s2,12
    91f4:	00c50513          	add	a0,a0,12
    91f8:	00260613          	add	a2,a2,2
    91fc:	00261613          	sll	a2,a2,0x2
    9200:	ccdf70ef          	jal	ecc <memcpy>
    9204:	00100613          	li	a2,1
    9208:	00098593          	mv	a1,s3
    920c:	00040513          	mv	a0,s0
    9210:	49d000ef          	jal	9eac <__lshift>
    9214:	00050b13          	mv	s6,a0
    9218:	aa9ff06f          	j	8cc0 <_dtoa_r+0xd7c>
    921c:	00090593          	mv	a1,s2
    9220:	000b8613          	mv	a2,s7
    9224:	00040513          	mv	a0,s0
    9228:	335000ef          	jal	9d5c <__pow5mult>
    922c:	00048613          	mv	a2,s1
    9230:	00050593          	mv	a1,a0
    9234:	00050913          	mv	s2,a0
    9238:	00040513          	mv	a0,s0
    923c:	059000ef          	jal	9a94 <__multiply>
    9240:	00050793          	mv	a5,a0
    9244:	00048593          	mv	a1,s1
    9248:	00040513          	mv	a0,s0
    924c:	00078493          	mv	s1,a5
    9250:	494000ef          	jal	96e4 <_Bfree>
    9254:	03012783          	lw	a5,48(sp)
    9258:	417787b3          	sub	a5,a5,s7
    925c:	02f12823          	sw	a5,48(sp)
    9260:	f6078063          	beqz	a5,89c0 <_dtoa_r+0xa7c>
    9264:	f48ff06f          	j	89ac <_dtoa_r+0xa68>
    9268:	05012603          	lw	a2,80(sp)
    926c:	05412683          	lw	a3,84(sp)
    9270:	05812503          	lw	a0,88(sp)
    9274:	04b12623          	sw	a1,76(sp)
    9278:	000b8593          	mv	a1,s7
    927c:	02612423          	sw	t1,40(sp)
    9280:	254040ef          	jal	d4d4 <__muldf3>
    9284:	02812303          	lw	t1,40(sp)
    9288:	04812783          	lw	a5,72(sp)
    928c:	00100693          	li	a3,1
    9290:	006a8023          	sb	t1,0(s5)
    9294:	02a12c23          	sw	a0,56(sp)
    9298:	04c12883          	lw	a7,76(sp)
    929c:	00058913          	mv	s2,a1
    92a0:	00fa8bb3          	add	s7,s5,a5
    92a4:	7fff7617          	auipc	a2,0x7fff7
    92a8:	44c60613          	add	a2,a2,1100 # 800006f0 <__global_locale+0x1bc>
    92ac:	28d78c63          	beq	a5,a3,9544 <_dtoa_r+0x1600>
    92b0:	00062783          	lw	a5,0(a2)
    92b4:	00462803          	lw	a6,4(a2)
    92b8:	04912423          	sw	s1,72(sp)
    92bc:	02f12423          	sw	a5,40(sp)
    92c0:	03012623          	sw	a6,44(sp)
    92c4:	04812623          	sw	s0,76(sp)
    92c8:	000c8513          	mv	a0,s9
    92cc:	00088593          	mv	a1,a7
    92d0:	02812603          	lw	a2,40(sp)
    92d4:	02c12683          	lw	a3,44(sp)
    92d8:	001d0d13          	add	s10,s10,1
    92dc:	1f8040ef          	jal	d4d4 <__muldf3>
    92e0:	00058413          	mv	s0,a1
    92e4:	00050493          	mv	s1,a0
    92e8:	2d8050ef          	jal	e5c0 <__fixdfsi>
    92ec:	00050c93          	mv	s9,a0
    92f0:	354050ef          	jal	e644 <__floatsidf>
    92f4:	00050613          	mv	a2,a0
    92f8:	00058693          	mv	a3,a1
    92fc:	00048513          	mv	a0,s1
    9300:	00040593          	mv	a1,s0
    9304:	030c8c93          	add	s9,s9,48
    9308:	15d040ef          	jal	dc64 <__subdf3>
    930c:	ff9d0fa3          	sb	s9,-1(s10)
    9310:	fdab90e3          	bne	s7,s10,92d0 <_dtoa_r+0x138c>
    9314:	04812483          	lw	s1,72(sp)
    9318:	04c12403          	lw	s0,76(sp)
    931c:	00050c93          	mv	s9,a0
    9320:	00058893          	mv	a7,a1
    9324:	7fff7d17          	auipc	s10,0x7fff7
    9328:	394d0d13          	add	s10,s10,916 # 800006b8 <__global_locale+0x184>
    932c:	000d2603          	lw	a2,0(s10)
    9330:	004d2683          	lw	a3,4(s10)
    9334:	03812503          	lw	a0,56(sp)
    9338:	00090593          	mv	a1,s2
    933c:	03112423          	sw	a7,40(sp)
    9340:	58d020ef          	jal	c0cc <__adddf3>
    9344:	02812883          	lw	a7,40(sp)
    9348:	000c8613          	mv	a2,s9
    934c:	00088693          	mv	a3,a7
    9350:	07c040ef          	jal	d3cc <__ledf2>
    9354:	1a054863          	bltz	a0,9504 <_dtoa_r+0x15c0>
    9358:	03812603          	lw	a2,56(sp)
    935c:	000d2503          	lw	a0,0(s10)
    9360:	004d2583          	lw	a1,4(s10)
    9364:	00090693          	mv	a3,s2
    9368:	0fd040ef          	jal	dc64 <__subdf3>
    936c:	02812883          	lw	a7,40(sp)
    9370:	000c8613          	mv	a2,s9
    9374:	00088693          	mv	a3,a7
    9378:	755030ef          	jal	d2cc <__gedf2>
    937c:	12a04863          	bgtz	a0,94ac <_dtoa_r+0x1568>
    9380:	06c12783          	lw	a5,108(sp)
    9384:	de07c063          	bltz	a5,8964 <_dtoa_r+0xa20>
    9388:	02012703          	lw	a4,32(sp)
    938c:	00e00793          	li	a5,14
    9390:	dce7ca63          	blt	a5,a4,8964 <_dtoa_r+0xa20>
    9394:	02012783          	lw	a5,32(sp)
    9398:	00006717          	auipc	a4,0x6
    939c:	26870713          	add	a4,a4,616 # f600 <__mprec_tens>
    93a0:	00379793          	sll	a5,a5,0x3
    93a4:	00f707b3          	add	a5,a4,a5
    93a8:	0007a903          	lw	s2,0(a5)
    93ac:	0047a983          	lw	s3,4(a5)
    93b0:	c90ff06f          	j	8840 <_dtoa_r+0x8fc>
    93b4:	06812703          	lw	a4,104(sp)
    93b8:	01012683          	lw	a3,16(sp)
    93bc:	03600793          	li	a5,54
    93c0:	40e787b3          	sub	a5,a5,a4
    93c4:	00fb0b33          	add	s6,s6,a5
    93c8:	00f687b3          	add	a5,a3,a5
    93cc:	03012b83          	lw	s7,48(sp)
    93d0:	00068c93          	mv	s9,a3
    93d4:	00f12823          	sw	a5,16(sp)
    93d8:	815ff06f          	j	8bec <_dtoa_r+0xca8>
    93dc:	02012783          	lw	a5,32(sp)
    93e0:	00090c13          	mv	s8,s2
    93e4:	01012a83          	lw	s5,16(sp)
    93e8:	00178a13          	add	s4,a5,1
    93ec:	000b0913          	mv	s2,s6
    93f0:	eb4ff06f          	j	8aa4 <_dtoa_r+0xb60>
    93f4:	01812703          	lw	a4,24(sp)
    93f8:	01c12783          	lw	a5,28(sp)
    93fc:	00200913          	li	s2,2
    9400:	f81fe06f          	j	8380 <_dtoa_r+0x43c>
    9404:	b00c0063          	beqz	s8,8704 <_dtoa_r+0x7c0>
    9408:	03c12d03          	lw	s10,60(sp)
    940c:	bba05063          	blez	s10,87ac <_dtoa_r+0x868>
    9410:	7fff7617          	auipc	a2,0x7fff7
    9414:	2e060613          	add	a2,a2,736 # 800006f0 <__global_locale+0x1bc>
    9418:	00078593          	mv	a1,a5
    941c:	02012783          	lw	a5,32(sp)
    9420:	00462683          	lw	a3,4(a2)
    9424:	00062603          	lw	a2,0(a2)
    9428:	fff78793          	add	a5,a5,-1
    942c:	00070513          	mv	a0,a4
    9430:	04f12e23          	sw	a5,92(sp)
    9434:	0a0040ef          	jal	d4d4 <__muldf3>
    9438:	00050713          	mv	a4,a0
    943c:	00190513          	add	a0,s2,1
    9440:	04e12423          	sw	a4,72(sp)
    9444:	04b12023          	sw	a1,64(sp)
    9448:	1fc050ef          	jal	e644 <__floatsidf>
    944c:	04812703          	lw	a4,72(sp)
    9450:	04012783          	lw	a5,64(sp)
    9454:	00070613          	mv	a2,a4
    9458:	00078693          	mv	a3,a5
    945c:	04e12623          	sw	a4,76(sp)
    9460:	074040ef          	jal	d4d4 <__muldf3>
    9464:	7fff7697          	auipc	a3,0x7fff7
    9468:	29468693          	add	a3,a3,660 # 800006f8 <__global_locale+0x1c4>
    946c:	0006a603          	lw	a2,0(a3)
    9470:	0046a683          	lw	a3,4(a3)
    9474:	459020ef          	jal	c0cc <__adddf3>
    9478:	fcc006b7          	lui	a3,0xfcc00
    947c:	04012783          	lw	a5,64(sp)
    9480:	04c12703          	lw	a4,76(sp)
    9484:	00050c93          	mv	s9,a0
    9488:	00b68bb3          	add	s7,a3,a1
    948c:	05a12423          	sw	s10,72(sp)
    9490:	f91fe06f          	j	8420 <_dtoa_r+0x4dc>
    9494:	03100693          	li	a3,49
    9498:	001c0c13          	add	s8,s8,1
    949c:	984ff06f          	j	8620 <_dtoa_r+0x6dc>
    94a0:	00012c23          	sw	zero,24(sp)
    94a4:	00000913          	li	s2,0
    94a8:	a11ff06f          	j	8eb8 <_dtoa_r+0xf74>
    94ac:	03000613          	li	a2,48
    94b0:	fffbc783          	lbu	a5,-1(s7)
    94b4:	000b8d13          	mv	s10,s7
    94b8:	fffb8b93          	add	s7,s7,-1
    94bc:	fec78ae3          	beq	a5,a2,94b0 <_dtoa_r+0x156c>
    94c0:	05c12783          	lw	a5,92(sp)
    94c4:	00178a13          	add	s4,a5,1
    94c8:	e50ff06f          	j	8b18 <_dtoa_r+0xbd4>
    94cc:	03900713          	li	a4,57
    94d0:	01012a83          	lw	s5,16(sp)
    94d4:	b8eb84e3          	beq	s7,a4,905c <_dtoa_r+0x1118>
    94d8:	933048e3          	bgtz	s3,8e08 <_dtoa_r+0xec4>
    94dc:	931ff06f          	j	8e0c <_dtoa_r+0xec8>
    94e0:	01012a83          	lw	s5,16(sp)
    94e4:	929ff06f          	j	8e0c <_dtoa_r+0xec8>
    94e8:	00078993          	mv	s3,a5
    94ec:	a19ff06f          	j	8f04 <_dtoa_r+0xfc0>
    94f0:	00078c93          	mv	s9,a5
    94f4:	018787b3          	add	a5,a5,s8
    94f8:	018b0b33          	add	s6,s6,s8
    94fc:	00f12823          	sw	a5,16(sp)
    9500:	eecff06f          	j	8bec <_dtoa_r+0xca8>
    9504:	05c12783          	lw	a5,92(sp)
    9508:	00178c13          	add	s8,a5,1
    950c:	8f0ff06f          	j	85fc <_dtoa_r+0x6b8>
    9510:	04c12983          	lw	s3,76(sp)
    9514:	05012b03          	lw	s6,80(sp)
    9518:	05812c03          	lw	s8,88(sp)
    951c:	04812a03          	lw	s4,72(sp)
    9520:	a8cff06f          	j	87ac <_dtoa_r+0x868>
    9524:	00200793          	li	a5,2
    9528:	0147c863          	blt	a5,s4,9538 <_dtoa_r+0x15f4>
    952c:	02012a03          	lw	s4,32(sp)
    9530:	03c12c03          	lw	s8,60(sp)
    9534:	d1cff06f          	j	8a50 <_dtoa_r+0xb0c>
    9538:	03c12c03          	lw	s8,60(sp)
    953c:	03612023          	sw	s6,32(sp)
    9540:	949ff06f          	j	8e88 <_dtoa_r+0xf44>
    9544:	04012b83          	lw	s7,64(sp)
    9548:	dddff06f          	j	9324 <_dtoa_r+0x13e0>
    954c:	00200793          	li	a5,2
    9550:	ff47c4e3          	blt	a5,s4,9538 <_dtoa_r+0x15f4>
    9554:	03c12c03          	lw	s8,60(sp)
    9558:	03612023          	sw	s6,32(sp)
    955c:	f44ff06f          	j	8ca0 <_dtoa_r+0xd5c>
    9560:	00050713          	mv	a4,a0
    9564:	00058793          	mv	a5,a1
    9568:	00200913          	li	s2,2
    956c:	e15fe06f          	j	8380 <_dtoa_r+0x43c>
    9570:	00006697          	auipc	a3,0x6
    9574:	a5468693          	add	a3,a3,-1452 # efc4 <__fini_array_end+0x230>
    9578:	00000613          	li	a2,0
    957c:	2ef00593          	li	a1,751
    9580:	00006517          	auipc	a0,0x6
    9584:	a5850513          	add	a0,a0,-1448 # efd8 <__fini_array_end+0x244>
    9588:	0cd010ef          	jal	ae54 <__assert_func>
    958c:	01012a83          	lw	s5,16(sp)
    9590:	85b048e3          	bgtz	s11,8de0 <_dtoa_r+0xe9c>
    9594:	879ff06f          	j	8e0c <_dtoa_r+0xec8>
    9598:	00006697          	auipc	a3,0x6
    959c:	a2c68693          	add	a3,a3,-1492 # efc4 <__fini_array_end+0x230>
    95a0:	00000613          	li	a2,0
    95a4:	1af00593          	li	a1,431
    95a8:	00006517          	auipc	a0,0x6
    95ac:	a3050513          	add	a0,a0,-1488 # efd8 <__fini_array_end+0x244>
    95b0:	0a5010ef          	jal	ae54 <__assert_func>
    95b4:	02042e23          	sw	zero,60(s0)
    95b8:	00000593          	li	a1,0
    95bc:	cc1fe06f          	j	827c <_dtoa_r+0x338>
    95c0:	02012423          	sw	zero,40(sp)
    95c4:	c7dfe06f          	j	8240 <_dtoa_r+0x2fc>

000095c8 <__ascii_mbtowc>:
    95c8:	02058063          	beqz	a1,95e8 <__ascii_mbtowc+0x20>
    95cc:	04060263          	beqz	a2,9610 <__ascii_mbtowc+0x48>
    95d0:	04068863          	beqz	a3,9620 <__ascii_mbtowc+0x58>
    95d4:	00064783          	lbu	a5,0(a2)
    95d8:	00f5a023          	sw	a5,0(a1)
    95dc:	00064503          	lbu	a0,0(a2)
    95e0:	00a03533          	snez	a0,a0
    95e4:	00008067          	ret
    95e8:	ff010113          	add	sp,sp,-16
    95ec:	00c10593          	add	a1,sp,12
    95f0:	02060463          	beqz	a2,9618 <__ascii_mbtowc+0x50>
    95f4:	02068a63          	beqz	a3,9628 <__ascii_mbtowc+0x60>
    95f8:	00064783          	lbu	a5,0(a2)
    95fc:	00f5a023          	sw	a5,0(a1)
    9600:	00064503          	lbu	a0,0(a2)
    9604:	00a03533          	snez	a0,a0
    9608:	01010113          	add	sp,sp,16
    960c:	00008067          	ret
    9610:	00000513          	li	a0,0
    9614:	00008067          	ret
    9618:	00000513          	li	a0,0
    961c:	fedff06f          	j	9608 <__ascii_mbtowc+0x40>
    9620:	ffe00513          	li	a0,-2
    9624:	00008067          	ret
    9628:	ffe00513          	li	a0,-2
    962c:	fddff06f          	j	9608 <__ascii_mbtowc+0x40>

00009630 <_Balloc>:
    9630:	04452783          	lw	a5,68(a0)
    9634:	ff010113          	add	sp,sp,-16
    9638:	00812423          	sw	s0,8(sp)
    963c:	00912223          	sw	s1,4(sp)
    9640:	00112623          	sw	ra,12(sp)
    9644:	00050413          	mv	s0,a0
    9648:	00058493          	mv	s1,a1
    964c:	02078c63          	beqz	a5,9684 <_Balloc+0x54>
    9650:	00249713          	sll	a4,s1,0x2
    9654:	00e787b3          	add	a5,a5,a4
    9658:	0007a503          	lw	a0,0(a5)
    965c:	04050463          	beqz	a0,96a4 <_Balloc+0x74>
    9660:	00052703          	lw	a4,0(a0)
    9664:	00e7a023          	sw	a4,0(a5)
    9668:	00052823          	sw	zero,16(a0)
    966c:	00052623          	sw	zero,12(a0)
    9670:	00c12083          	lw	ra,12(sp)
    9674:	00812403          	lw	s0,8(sp)
    9678:	00412483          	lw	s1,4(sp)
    967c:	01010113          	add	sp,sp,16
    9680:	00008067          	ret
    9684:	02100613          	li	a2,33
    9688:	00400593          	li	a1,4
    968c:	021010ef          	jal	aeac <_calloc_r>
    9690:	04a42223          	sw	a0,68(s0)
    9694:	00050793          	mv	a5,a0
    9698:	fa051ce3          	bnez	a0,9650 <_Balloc+0x20>
    969c:	00000513          	li	a0,0
    96a0:	fd1ff06f          	j	9670 <_Balloc+0x40>
    96a4:	01212023          	sw	s2,0(sp)
    96a8:	00100913          	li	s2,1
    96ac:	00991933          	sll	s2,s2,s1
    96b0:	00590613          	add	a2,s2,5
    96b4:	00261613          	sll	a2,a2,0x2
    96b8:	00100593          	li	a1,1
    96bc:	00040513          	mv	a0,s0
    96c0:	7ec010ef          	jal	aeac <_calloc_r>
    96c4:	00050a63          	beqz	a0,96d8 <_Balloc+0xa8>
    96c8:	01252423          	sw	s2,8(a0)
    96cc:	00952223          	sw	s1,4(a0)
    96d0:	00012903          	lw	s2,0(sp)
    96d4:	f95ff06f          	j	9668 <_Balloc+0x38>
    96d8:	00012903          	lw	s2,0(sp)
    96dc:	00000513          	li	a0,0
    96e0:	f91ff06f          	j	9670 <_Balloc+0x40>

000096e4 <_Bfree>:
    96e4:	02058063          	beqz	a1,9704 <_Bfree+0x20>
    96e8:	0045a703          	lw	a4,4(a1)
    96ec:	04452783          	lw	a5,68(a0)
    96f0:	00271713          	sll	a4,a4,0x2
    96f4:	00e787b3          	add	a5,a5,a4
    96f8:	0007a703          	lw	a4,0(a5)
    96fc:	00e5a023          	sw	a4,0(a1)
    9700:	00b7a023          	sw	a1,0(a5)
    9704:	00008067          	ret

00009708 <__multadd>:
    9708:	fd010113          	add	sp,sp,-48
    970c:	01412c23          	sw	s4,24(sp)
    9710:	0105aa03          	lw	s4,16(a1)
    9714:	01912223          	sw	s9,4(sp)
    9718:	00010cb7          	lui	s9,0x10
    971c:	02912223          	sw	s1,36(sp)
    9720:	03212023          	sw	s2,32(sp)
    9724:	01312e23          	sw	s3,28(sp)
    9728:	01512a23          	sw	s5,20(sp)
    972c:	01612823          	sw	s6,16(sp)
    9730:	01712623          	sw	s7,12(sp)
    9734:	02112623          	sw	ra,44(sp)
    9738:	02812423          	sw	s0,40(sp)
    973c:	01812423          	sw	s8,8(sp)
    9740:	00058a93          	mv	s5,a1
    9744:	00050b13          	mv	s6,a0
    9748:	00060993          	mv	s3,a2
    974c:	00068493          	mv	s1,a3
    9750:	01458913          	add	s2,a1,20
    9754:	00000b93          	li	s7,0
    9758:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    975c:	00092c03          	lw	s8,0(s2)
    9760:	00098593          	mv	a1,s3
    9764:	00490913          	add	s2,s2,4
    9768:	019c7533          	and	a0,s8,s9
    976c:	430050ef          	jal	eb9c <__mulsi3>
    9770:	00050413          	mv	s0,a0
    9774:	00098593          	mv	a1,s3
    9778:	010c5513          	srl	a0,s8,0x10
    977c:	00940433          	add	s0,s0,s1
    9780:	41c050ef          	jal	eb9c <__mulsi3>
    9784:	01045793          	srl	a5,s0,0x10
    9788:	00f50533          	add	a0,a0,a5
    978c:	01051793          	sll	a5,a0,0x10
    9790:	01947433          	and	s0,s0,s9
    9794:	008787b3          	add	a5,a5,s0
    9798:	fef92e23          	sw	a5,-4(s2)
    979c:	001b8b93          	add	s7,s7,1
    97a0:	01055493          	srl	s1,a0,0x10
    97a4:	fb4bcce3          	blt	s7,s4,975c <__multadd+0x54>
    97a8:	02048263          	beqz	s1,97cc <__multadd+0xc4>
    97ac:	008aa783          	lw	a5,8(s5)
    97b0:	04fa5a63          	bge	s4,a5,9804 <__multadd+0xfc>
    97b4:	004a0793          	add	a5,s4,4
    97b8:	00279793          	sll	a5,a5,0x2
    97bc:	00fa87b3          	add	a5,s5,a5
    97c0:	0097a223          	sw	s1,4(a5)
    97c4:	001a0a13          	add	s4,s4,1
    97c8:	014aa823          	sw	s4,16(s5)
    97cc:	02c12083          	lw	ra,44(sp)
    97d0:	02812403          	lw	s0,40(sp)
    97d4:	02412483          	lw	s1,36(sp)
    97d8:	02012903          	lw	s2,32(sp)
    97dc:	01c12983          	lw	s3,28(sp)
    97e0:	01812a03          	lw	s4,24(sp)
    97e4:	01012b03          	lw	s6,16(sp)
    97e8:	00c12b83          	lw	s7,12(sp)
    97ec:	00812c03          	lw	s8,8(sp)
    97f0:	00412c83          	lw	s9,4(sp)
    97f4:	000a8513          	mv	a0,s5
    97f8:	01412a83          	lw	s5,20(sp)
    97fc:	03010113          	add	sp,sp,48
    9800:	00008067          	ret
    9804:	004aa583          	lw	a1,4(s5)
    9808:	000b0513          	mv	a0,s6
    980c:	00158593          	add	a1,a1,1
    9810:	e21ff0ef          	jal	9630 <_Balloc>
    9814:	00050413          	mv	s0,a0
    9818:	04050c63          	beqz	a0,9870 <__multadd+0x168>
    981c:	010aa603          	lw	a2,16(s5)
    9820:	00ca8593          	add	a1,s5,12
    9824:	00c50513          	add	a0,a0,12
    9828:	00260613          	add	a2,a2,2
    982c:	00261613          	sll	a2,a2,0x2
    9830:	e9cf70ef          	jal	ecc <memcpy>
    9834:	004aa703          	lw	a4,4(s5)
    9838:	044b2783          	lw	a5,68(s6)
    983c:	00271713          	sll	a4,a4,0x2
    9840:	00e787b3          	add	a5,a5,a4
    9844:	0007a703          	lw	a4,0(a5)
    9848:	00eaa023          	sw	a4,0(s5)
    984c:	0157a023          	sw	s5,0(a5)
    9850:	004a0793          	add	a5,s4,4
    9854:	00040a93          	mv	s5,s0
    9858:	00279793          	sll	a5,a5,0x2
    985c:	00fa87b3          	add	a5,s5,a5
    9860:	0097a223          	sw	s1,4(a5)
    9864:	001a0a13          	add	s4,s4,1
    9868:	014aa823          	sw	s4,16(s5)
    986c:	f61ff06f          	j	97cc <__multadd+0xc4>
    9870:	00005697          	auipc	a3,0x5
    9874:	75468693          	add	a3,a3,1876 # efc4 <__fini_array_end+0x230>
    9878:	00000613          	li	a2,0
    987c:	0ba00593          	li	a1,186
    9880:	00005517          	auipc	a0,0x5
    9884:	7d850513          	add	a0,a0,2008 # f058 <__fini_array_end+0x2c4>
    9888:	5cc010ef          	jal	ae54 <__assert_func>

0000988c <__hi0bits>:
    988c:	00050793          	mv	a5,a0
    9890:	00010737          	lui	a4,0x10
    9894:	00000513          	li	a0,0
    9898:	00e7f663          	bgeu	a5,a4,98a4 <__hi0bits+0x18>
    989c:	01079793          	sll	a5,a5,0x10
    98a0:	01000513          	li	a0,16
    98a4:	01000737          	lui	a4,0x1000
    98a8:	00e7f663          	bgeu	a5,a4,98b4 <__hi0bits+0x28>
    98ac:	00850513          	add	a0,a0,8
    98b0:	00879793          	sll	a5,a5,0x8
    98b4:	10000737          	lui	a4,0x10000
    98b8:	00e7f663          	bgeu	a5,a4,98c4 <__hi0bits+0x38>
    98bc:	00450513          	add	a0,a0,4
    98c0:	00479793          	sll	a5,a5,0x4
    98c4:	40000737          	lui	a4,0x40000
    98c8:	00e7ea63          	bltu	a5,a4,98dc <__hi0bits+0x50>
    98cc:	fff7c793          	not	a5,a5
    98d0:	01f7d793          	srl	a5,a5,0x1f
    98d4:	00f50533          	add	a0,a0,a5
    98d8:	00008067          	ret
    98dc:	00279793          	sll	a5,a5,0x2
    98e0:	0007ca63          	bltz	a5,98f4 <__hi0bits+0x68>
    98e4:	00179713          	sll	a4,a5,0x1
    98e8:	00074a63          	bltz	a4,98fc <__hi0bits+0x70>
    98ec:	02000513          	li	a0,32
    98f0:	00008067          	ret
    98f4:	00250513          	add	a0,a0,2
    98f8:	00008067          	ret
    98fc:	00350513          	add	a0,a0,3
    9900:	00008067          	ret

00009904 <__lo0bits>:
    9904:	00052783          	lw	a5,0(a0)
    9908:	00050713          	mv	a4,a0
    990c:	0077f693          	and	a3,a5,7
    9910:	02068463          	beqz	a3,9938 <__lo0bits+0x34>
    9914:	0017f693          	and	a3,a5,1
    9918:	00000513          	li	a0,0
    991c:	04069e63          	bnez	a3,9978 <__lo0bits+0x74>
    9920:	0027f693          	and	a3,a5,2
    9924:	0a068863          	beqz	a3,99d4 <__lo0bits+0xd0>
    9928:	0017d793          	srl	a5,a5,0x1
    992c:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9930:	00100513          	li	a0,1
    9934:	00008067          	ret
    9938:	01079693          	sll	a3,a5,0x10
    993c:	0106d693          	srl	a3,a3,0x10
    9940:	00000513          	li	a0,0
    9944:	06068e63          	beqz	a3,99c0 <__lo0bits+0xbc>
    9948:	0ff7f693          	zext.b	a3,a5
    994c:	06068063          	beqz	a3,99ac <__lo0bits+0xa8>
    9950:	00f7f693          	and	a3,a5,15
    9954:	04068263          	beqz	a3,9998 <__lo0bits+0x94>
    9958:	0037f693          	and	a3,a5,3
    995c:	02068463          	beqz	a3,9984 <__lo0bits+0x80>
    9960:	0017f693          	and	a3,a5,1
    9964:	00069c63          	bnez	a3,997c <__lo0bits+0x78>
    9968:	0017d793          	srl	a5,a5,0x1
    996c:	00150513          	add	a0,a0,1
    9970:	00079663          	bnez	a5,997c <__lo0bits+0x78>
    9974:	02000513          	li	a0,32
    9978:	00008067          	ret
    997c:	00f72023          	sw	a5,0(a4)
    9980:	00008067          	ret
    9984:	0027d793          	srl	a5,a5,0x2
    9988:	0017f693          	and	a3,a5,1
    998c:	00250513          	add	a0,a0,2
    9990:	fe0696e3          	bnez	a3,997c <__lo0bits+0x78>
    9994:	fd5ff06f          	j	9968 <__lo0bits+0x64>
    9998:	0047d793          	srl	a5,a5,0x4
    999c:	0037f693          	and	a3,a5,3
    99a0:	00450513          	add	a0,a0,4
    99a4:	fa069ee3          	bnez	a3,9960 <__lo0bits+0x5c>
    99a8:	fddff06f          	j	9984 <__lo0bits+0x80>
    99ac:	0087d793          	srl	a5,a5,0x8
    99b0:	00f7f693          	and	a3,a5,15
    99b4:	00850513          	add	a0,a0,8
    99b8:	fa0690e3          	bnez	a3,9958 <__lo0bits+0x54>
    99bc:	fddff06f          	j	9998 <__lo0bits+0x94>
    99c0:	0107d793          	srl	a5,a5,0x10
    99c4:	0ff7f693          	zext.b	a3,a5
    99c8:	01000513          	li	a0,16
    99cc:	f80692e3          	bnez	a3,9950 <__lo0bits+0x4c>
    99d0:	fddff06f          	j	99ac <__lo0bits+0xa8>
    99d4:	0027d793          	srl	a5,a5,0x2
    99d8:	00f72023          	sw	a5,0(a4)
    99dc:	00200513          	li	a0,2
    99e0:	00008067          	ret

000099e4 <__i2b>:
    99e4:	04452783          	lw	a5,68(a0)
    99e8:	ff010113          	add	sp,sp,-16
    99ec:	00812423          	sw	s0,8(sp)
    99f0:	00912223          	sw	s1,4(sp)
    99f4:	00112623          	sw	ra,12(sp)
    99f8:	00050413          	mv	s0,a0
    99fc:	00058493          	mv	s1,a1
    9a00:	02078c63          	beqz	a5,9a38 <__i2b+0x54>
    9a04:	0047a503          	lw	a0,4(a5)
    9a08:	06050263          	beqz	a0,9a6c <__i2b+0x88>
    9a0c:	00052703          	lw	a4,0(a0)
    9a10:	00e7a223          	sw	a4,4(a5)
    9a14:	00c12083          	lw	ra,12(sp)
    9a18:	00812403          	lw	s0,8(sp)
    9a1c:	00100793          	li	a5,1
    9a20:	00952a23          	sw	s1,20(a0)
    9a24:	00052623          	sw	zero,12(a0)
    9a28:	00f52823          	sw	a5,16(a0)
    9a2c:	00412483          	lw	s1,4(sp)
    9a30:	01010113          	add	sp,sp,16
    9a34:	00008067          	ret
    9a38:	02100613          	li	a2,33
    9a3c:	00400593          	li	a1,4
    9a40:	46c010ef          	jal	aeac <_calloc_r>
    9a44:	04a42223          	sw	a0,68(s0)
    9a48:	00050793          	mv	a5,a0
    9a4c:	fa051ce3          	bnez	a0,9a04 <__i2b+0x20>
    9a50:	00005697          	auipc	a3,0x5
    9a54:	57468693          	add	a3,a3,1396 # efc4 <__fini_array_end+0x230>
    9a58:	00000613          	li	a2,0
    9a5c:	14500593          	li	a1,325
    9a60:	00005517          	auipc	a0,0x5
    9a64:	5f850513          	add	a0,a0,1528 # f058 <__fini_array_end+0x2c4>
    9a68:	3ec010ef          	jal	ae54 <__assert_func>
    9a6c:	01c00613          	li	a2,28
    9a70:	00100593          	li	a1,1
    9a74:	00040513          	mv	a0,s0
    9a78:	434010ef          	jal	aeac <_calloc_r>
    9a7c:	fc050ae3          	beqz	a0,9a50 <__i2b+0x6c>
    9a80:	00100793          	li	a5,1
    9a84:	00f52223          	sw	a5,4(a0)
    9a88:	00200793          	li	a5,2
    9a8c:	00f52423          	sw	a5,8(a0)
    9a90:	f85ff06f          	j	9a14 <__i2b+0x30>

00009a94 <__multiply>:
    9a94:	fb010113          	add	sp,sp,-80
    9a98:	03312e23          	sw	s3,60(sp)
    9a9c:	03812423          	sw	s8,40(sp)
    9aa0:	01062983          	lw	s3,16(a2)
    9aa4:	0105ac03          	lw	s8,16(a1)
    9aa8:	04812423          	sw	s0,72(sp)
    9aac:	03412c23          	sw	s4,56(sp)
    9ab0:	04112623          	sw	ra,76(sp)
    9ab4:	03712623          	sw	s7,44(sp)
    9ab8:	00058a13          	mv	s4,a1
    9abc:	00060413          	mv	s0,a2
    9ac0:	013c4c63          	blt	s8,s3,9ad8 <__multiply+0x44>
    9ac4:	00098713          	mv	a4,s3
    9ac8:	00058413          	mv	s0,a1
    9acc:	000c0993          	mv	s3,s8
    9ad0:	00060a13          	mv	s4,a2
    9ad4:	00070c13          	mv	s8,a4
    9ad8:	00842783          	lw	a5,8(s0)
    9adc:	00442583          	lw	a1,4(s0)
    9ae0:	01898bb3          	add	s7,s3,s8
    9ae4:	0177a7b3          	slt	a5,a5,s7
    9ae8:	00f585b3          	add	a1,a1,a5
    9aec:	b45ff0ef          	jal	9630 <_Balloc>
    9af0:	00a12623          	sw	a0,12(sp)
    9af4:	22050863          	beqz	a0,9d24 <__multiply+0x290>
    9af8:	00c12783          	lw	a5,12(sp)
    9afc:	03512a23          	sw	s5,52(sp)
    9b00:	03612823          	sw	s6,48(sp)
    9b04:	002b9a93          	sll	s5,s7,0x2
    9b08:	01478b13          	add	s6,a5,20
    9b0c:	015b0ab3          	add	s5,s6,s5
    9b10:	000b0793          	mv	a5,s6
    9b14:	015b7863          	bgeu	s6,s5,9b24 <__multiply+0x90>
    9b18:	0007a023          	sw	zero,0(a5)
    9b1c:	00478793          	add	a5,a5,4
    9b20:	ff57ece3          	bltu	a5,s5,9b18 <__multiply+0x84>
    9b24:	014a0a13          	add	s4,s4,20
    9b28:	002c1c13          	sll	s8,s8,0x2
    9b2c:	01440793          	add	a5,s0,20
    9b30:	018a0733          	add	a4,s4,s8
    9b34:	00299993          	sll	s3,s3,0x2
    9b38:	00f12423          	sw	a5,8(sp)
    9b3c:	00e12023          	sw	a4,0(sp)
    9b40:	013789b3          	add	s3,a5,s3
    9b44:	16ea7c63          	bgeu	s4,a4,9cbc <__multiply+0x228>
    9b48:	00400713          	li	a4,4
    9b4c:	04912223          	sw	s1,68(sp)
    9b50:	05212023          	sw	s2,64(sp)
    9b54:	03912223          	sw	s9,36(sp)
    9b58:	03a12023          	sw	s10,32(sp)
    9b5c:	01b12e23          	sw	s11,28(sp)
    9b60:	01540793          	add	a5,s0,21
    9b64:	00e12223          	sw	a4,4(sp)
    9b68:	1af9f263          	bgeu	s3,a5,9d0c <__multiply+0x278>
    9b6c:	00010437          	lui	s0,0x10
    9b70:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    9b74:	01c0006f          	j	9b90 <__multiply+0xfc>
    9b78:	01095913          	srl	s2,s2,0x10
    9b7c:	0a091063          	bnez	s2,9c1c <__multiply+0x188>
    9b80:	00012783          	lw	a5,0(sp)
    9b84:	004a0a13          	add	s4,s4,4
    9b88:	004b0b13          	add	s6,s6,4
    9b8c:	10fa7e63          	bgeu	s4,a5,9ca8 <__multiply+0x214>
    9b90:	000a2903          	lw	s2,0(s4)
    9b94:	008974b3          	and	s1,s2,s0
    9b98:	fe0480e3          	beqz	s1,9b78 <__multiply+0xe4>
    9b9c:	00812c83          	lw	s9,8(sp)
    9ba0:	000b0d13          	mv	s10,s6
    9ba4:	00000c13          	li	s8,0
    9ba8:	000cad83          	lw	s11,0(s9)
    9bac:	000d2903          	lw	s2,0(s10)
    9bb0:	00048593          	mv	a1,s1
    9bb4:	008df533          	and	a0,s11,s0
    9bb8:	7e5040ef          	jal	eb9c <__mulsi3>
    9bbc:	00897733          	and	a4,s2,s0
    9bc0:	00e50733          	add	a4,a0,a4
    9bc4:	00048593          	mv	a1,s1
    9bc8:	010dd513          	srl	a0,s11,0x10
    9bcc:	01870c33          	add	s8,a4,s8
    9bd0:	01095913          	srl	s2,s2,0x10
    9bd4:	7c9040ef          	jal	eb9c <__mulsi3>
    9bd8:	010c5713          	srl	a4,s8,0x10
    9bdc:	01250533          	add	a0,a0,s2
    9be0:	00e50533          	add	a0,a0,a4
    9be4:	008c77b3          	and	a5,s8,s0
    9be8:	01051713          	sll	a4,a0,0x10
    9bec:	004d0d13          	add	s10,s10,4
    9bf0:	00f767b3          	or	a5,a4,a5
    9bf4:	004c8c93          	add	s9,s9,4
    9bf8:	fefd2e23          	sw	a5,-4(s10)
    9bfc:	01055c13          	srl	s8,a0,0x10
    9c00:	fb3ce4e3          	bltu	s9,s3,9ba8 <__multiply+0x114>
    9c04:	00412783          	lw	a5,4(sp)
    9c08:	00fb0733          	add	a4,s6,a5
    9c0c:	01872023          	sw	s8,0(a4)
    9c10:	000a2903          	lw	s2,0(s4)
    9c14:	01095913          	srl	s2,s2,0x10
    9c18:	f60904e3          	beqz	s2,9b80 <__multiply+0xec>
    9c1c:	000b2c83          	lw	s9,0(s6)
    9c20:	00812d03          	lw	s10,8(sp)
    9c24:	000b0c13          	mv	s8,s6
    9c28:	000c8493          	mv	s1,s9
    9c2c:	00000d93          	li	s11,0
    9c30:	000d2503          	lw	a0,0(s10)
    9c34:	00090593          	mv	a1,s2
    9c38:	0104d493          	srl	s1,s1,0x10
    9c3c:	00857533          	and	a0,a0,s0
    9c40:	75d040ef          	jal	eb9c <__mulsi3>
    9c44:	01b50733          	add	a4,a0,s11
    9c48:	00970db3          	add	s11,a4,s1
    9c4c:	010d9593          	sll	a1,s11,0x10
    9c50:	008cf7b3          	and	a5,s9,s0
    9c54:	00f5e7b3          	or	a5,a1,a5
    9c58:	00fc2023          	sw	a5,0(s8)
    9c5c:	002d5503          	lhu	a0,2(s10)
    9c60:	004c2483          	lw	s1,4(s8)
    9c64:	00090593          	mv	a1,s2
    9c68:	735040ef          	jal	eb9c <__mulsi3>
    9c6c:	0084f7b3          	and	a5,s1,s0
    9c70:	010dd713          	srl	a4,s11,0x10
    9c74:	00f507b3          	add	a5,a0,a5
    9c78:	004d0d13          	add	s10,s10,4
    9c7c:	00e78cb3          	add	s9,a5,a4
    9c80:	004c0c13          	add	s8,s8,4
    9c84:	010cdd93          	srl	s11,s9,0x10
    9c88:	fb3d64e3          	bltu	s10,s3,9c30 <__multiply+0x19c>
    9c8c:	00412783          	lw	a5,4(sp)
    9c90:	004a0a13          	add	s4,s4,4
    9c94:	00fb0733          	add	a4,s6,a5
    9c98:	00012783          	lw	a5,0(sp)
    9c9c:	01972023          	sw	s9,0(a4)
    9ca0:	004b0b13          	add	s6,s6,4
    9ca4:	eefa66e3          	bltu	s4,a5,9b90 <__multiply+0xfc>
    9ca8:	04412483          	lw	s1,68(sp)
    9cac:	04012903          	lw	s2,64(sp)
    9cb0:	02412c83          	lw	s9,36(sp)
    9cb4:	02012d03          	lw	s10,32(sp)
    9cb8:	01c12d83          	lw	s11,28(sp)
    9cbc:	01704863          	bgtz	s7,9ccc <__multiply+0x238>
    9cc0:	0180006f          	j	9cd8 <__multiply+0x244>
    9cc4:	fffb8b93          	add	s7,s7,-1
    9cc8:	000b8863          	beqz	s7,9cd8 <__multiply+0x244>
    9ccc:	ffcaa783          	lw	a5,-4(s5)
    9cd0:	ffca8a93          	add	s5,s5,-4
    9cd4:	fe0788e3          	beqz	a5,9cc4 <__multiply+0x230>
    9cd8:	00c12783          	lw	a5,12(sp)
    9cdc:	04c12083          	lw	ra,76(sp)
    9ce0:	04812403          	lw	s0,72(sp)
    9ce4:	0177a823          	sw	s7,16(a5)
    9ce8:	03412a83          	lw	s5,52(sp)
    9cec:	03012b03          	lw	s6,48(sp)
    9cf0:	03c12983          	lw	s3,60(sp)
    9cf4:	03812a03          	lw	s4,56(sp)
    9cf8:	02c12b83          	lw	s7,44(sp)
    9cfc:	02812c03          	lw	s8,40(sp)
    9d00:	00078513          	mv	a0,a5
    9d04:	05010113          	add	sp,sp,80
    9d08:	00008067          	ret
    9d0c:	408987b3          	sub	a5,s3,s0
    9d10:	feb78793          	add	a5,a5,-21
    9d14:	ffc7f793          	and	a5,a5,-4
    9d18:	00478793          	add	a5,a5,4
    9d1c:	00f12223          	sw	a5,4(sp)
    9d20:	e4dff06f          	j	9b6c <__multiply+0xd8>
    9d24:	00005697          	auipc	a3,0x5
    9d28:	2a068693          	add	a3,a3,672 # efc4 <__fini_array_end+0x230>
    9d2c:	00000613          	li	a2,0
    9d30:	16200593          	li	a1,354
    9d34:	00005517          	auipc	a0,0x5
    9d38:	32450513          	add	a0,a0,804 # f058 <__fini_array_end+0x2c4>
    9d3c:	04912223          	sw	s1,68(sp)
    9d40:	05212023          	sw	s2,64(sp)
    9d44:	03512a23          	sw	s5,52(sp)
    9d48:	03612823          	sw	s6,48(sp)
    9d4c:	03912223          	sw	s9,36(sp)
    9d50:	03a12023          	sw	s10,32(sp)
    9d54:	01b12e23          	sw	s11,28(sp)
    9d58:	0fc010ef          	jal	ae54 <__assert_func>

00009d5c <__pow5mult>:
    9d5c:	fe010113          	add	sp,sp,-32
    9d60:	00812c23          	sw	s0,24(sp)
    9d64:	01212823          	sw	s2,16(sp)
    9d68:	01312623          	sw	s3,12(sp)
    9d6c:	00112e23          	sw	ra,28(sp)
    9d70:	00367793          	and	a5,a2,3
    9d74:	00060413          	mv	s0,a2
    9d78:	00050993          	mv	s3,a0
    9d7c:	00058913          	mv	s2,a1
    9d80:	0a079c63          	bnez	a5,9e38 <__pow5mult+0xdc>
    9d84:	40245413          	sra	s0,s0,0x2
    9d88:	06040a63          	beqz	s0,9dfc <__pow5mult+0xa0>
    9d8c:	00912a23          	sw	s1,20(sp)
    9d90:	0409a483          	lw	s1,64(s3)
    9d94:	0c048663          	beqz	s1,9e60 <__pow5mult+0x104>
    9d98:	00147793          	and	a5,s0,1
    9d9c:	02079063          	bnez	a5,9dbc <__pow5mult+0x60>
    9da0:	40145413          	sra	s0,s0,0x1
    9da4:	04040a63          	beqz	s0,9df8 <__pow5mult+0x9c>
    9da8:	0004a503          	lw	a0,0(s1)
    9dac:	06050663          	beqz	a0,9e18 <__pow5mult+0xbc>
    9db0:	00050493          	mv	s1,a0
    9db4:	00147793          	and	a5,s0,1
    9db8:	fe0784e3          	beqz	a5,9da0 <__pow5mult+0x44>
    9dbc:	00048613          	mv	a2,s1
    9dc0:	00090593          	mv	a1,s2
    9dc4:	00098513          	mv	a0,s3
    9dc8:	ccdff0ef          	jal	9a94 <__multiply>
    9dcc:	02090063          	beqz	s2,9dec <__pow5mult+0x90>
    9dd0:	00492703          	lw	a4,4(s2)
    9dd4:	0449a783          	lw	a5,68(s3)
    9dd8:	00271713          	sll	a4,a4,0x2
    9ddc:	00e787b3          	add	a5,a5,a4
    9de0:	0007a703          	lw	a4,0(a5)
    9de4:	00e92023          	sw	a4,0(s2)
    9de8:	0127a023          	sw	s2,0(a5)
    9dec:	40145413          	sra	s0,s0,0x1
    9df0:	00050913          	mv	s2,a0
    9df4:	fa041ae3          	bnez	s0,9da8 <__pow5mult+0x4c>
    9df8:	01412483          	lw	s1,20(sp)
    9dfc:	01c12083          	lw	ra,28(sp)
    9e00:	01812403          	lw	s0,24(sp)
    9e04:	00c12983          	lw	s3,12(sp)
    9e08:	00090513          	mv	a0,s2
    9e0c:	01012903          	lw	s2,16(sp)
    9e10:	02010113          	add	sp,sp,32
    9e14:	00008067          	ret
    9e18:	00048613          	mv	a2,s1
    9e1c:	00048593          	mv	a1,s1
    9e20:	00098513          	mv	a0,s3
    9e24:	c71ff0ef          	jal	9a94 <__multiply>
    9e28:	00a4a023          	sw	a0,0(s1)
    9e2c:	00052023          	sw	zero,0(a0)
    9e30:	00050493          	mv	s1,a0
    9e34:	f81ff06f          	j	9db4 <__pow5mult+0x58>
    9e38:	fff78793          	add	a5,a5,-1
    9e3c:	00005717          	auipc	a4,0x5
    9e40:	79070713          	add	a4,a4,1936 # f5cc <p05.0>
    9e44:	00279793          	sll	a5,a5,0x2
    9e48:	00f707b3          	add	a5,a4,a5
    9e4c:	0007a603          	lw	a2,0(a5)
    9e50:	00000693          	li	a3,0
    9e54:	8b5ff0ef          	jal	9708 <__multadd>
    9e58:	00050913          	mv	s2,a0
    9e5c:	f29ff06f          	j	9d84 <__pow5mult+0x28>
    9e60:	00100593          	li	a1,1
    9e64:	00098513          	mv	a0,s3
    9e68:	fc8ff0ef          	jal	9630 <_Balloc>
    9e6c:	00050493          	mv	s1,a0
    9e70:	02050063          	beqz	a0,9e90 <__pow5mult+0x134>
    9e74:	27100793          	li	a5,625
    9e78:	00f52a23          	sw	a5,20(a0)
    9e7c:	00100793          	li	a5,1
    9e80:	00f52823          	sw	a5,16(a0)
    9e84:	04a9a023          	sw	a0,64(s3)
    9e88:	00052023          	sw	zero,0(a0)
    9e8c:	f0dff06f          	j	9d98 <__pow5mult+0x3c>
    9e90:	00005697          	auipc	a3,0x5
    9e94:	13468693          	add	a3,a3,308 # efc4 <__fini_array_end+0x230>
    9e98:	00000613          	li	a2,0
    9e9c:	14500593          	li	a1,325
    9ea0:	00005517          	auipc	a0,0x5
    9ea4:	1b850513          	add	a0,a0,440 # f058 <__fini_array_end+0x2c4>
    9ea8:	7ad000ef          	jal	ae54 <__assert_func>

00009eac <__lshift>:
    9eac:	fe010113          	add	sp,sp,-32
    9eb0:	01512223          	sw	s5,4(sp)
    9eb4:	0105aa83          	lw	s5,16(a1)
    9eb8:	0085a783          	lw	a5,8(a1)
    9ebc:	01312623          	sw	s3,12(sp)
    9ec0:	40565993          	sra	s3,a2,0x5
    9ec4:	01598ab3          	add	s5,s3,s5
    9ec8:	00812c23          	sw	s0,24(sp)
    9ecc:	00912a23          	sw	s1,20(sp)
    9ed0:	01212823          	sw	s2,16(sp)
    9ed4:	01412423          	sw	s4,8(sp)
    9ed8:	00112e23          	sw	ra,28(sp)
    9edc:	001a8913          	add	s2,s5,1
    9ee0:	00058493          	mv	s1,a1
    9ee4:	00060413          	mv	s0,a2
    9ee8:	0045a583          	lw	a1,4(a1)
    9eec:	00050a13          	mv	s4,a0
    9ef0:	0127d863          	bge	a5,s2,9f00 <__lshift+0x54>
    9ef4:	00179793          	sll	a5,a5,0x1
    9ef8:	00158593          	add	a1,a1,1
    9efc:	ff27cce3          	blt	a5,s2,9ef4 <__lshift+0x48>
    9f00:	000a0513          	mv	a0,s4
    9f04:	f2cff0ef          	jal	9630 <_Balloc>
    9f08:	10050c63          	beqz	a0,a020 <__lshift+0x174>
    9f0c:	01450813          	add	a6,a0,20
    9f10:	03305463          	blez	s3,9f38 <__lshift+0x8c>
    9f14:	00598993          	add	s3,s3,5
    9f18:	00299993          	sll	s3,s3,0x2
    9f1c:	01350733          	add	a4,a0,s3
    9f20:	00080793          	mv	a5,a6
    9f24:	00478793          	add	a5,a5,4
    9f28:	fe07ae23          	sw	zero,-4(a5)
    9f2c:	fee79ce3          	bne	a5,a4,9f24 <__lshift+0x78>
    9f30:	fec98993          	add	s3,s3,-20
    9f34:	01380833          	add	a6,a6,s3
    9f38:	0104a883          	lw	a7,16(s1)
    9f3c:	01448793          	add	a5,s1,20
    9f40:	01f47613          	and	a2,s0,31
    9f44:	00289893          	sll	a7,a7,0x2
    9f48:	011788b3          	add	a7,a5,a7
    9f4c:	0a060463          	beqz	a2,9ff4 <__lshift+0x148>
    9f50:	02000593          	li	a1,32
    9f54:	40c585b3          	sub	a1,a1,a2
    9f58:	00080313          	mv	t1,a6
    9f5c:	00000693          	li	a3,0
    9f60:	0007a703          	lw	a4,0(a5)
    9f64:	00430313          	add	t1,t1,4
    9f68:	00478793          	add	a5,a5,4
    9f6c:	00c71733          	sll	a4,a4,a2
    9f70:	00d76733          	or	a4,a4,a3
    9f74:	fee32e23          	sw	a4,-4(t1)
    9f78:	ffc7a683          	lw	a3,-4(a5)
    9f7c:	00b6d6b3          	srl	a3,a3,a1
    9f80:	ff17e0e3          	bltu	a5,a7,9f60 <__lshift+0xb4>
    9f84:	01548793          	add	a5,s1,21
    9f88:	00400713          	li	a4,4
    9f8c:	00f8ea63          	bltu	a7,a5,9fa0 <__lshift+0xf4>
    9f90:	409887b3          	sub	a5,a7,s1
    9f94:	feb78793          	add	a5,a5,-21
    9f98:	ffc7f793          	and	a5,a5,-4
    9f9c:	00478713          	add	a4,a5,4
    9fa0:	00e80833          	add	a6,a6,a4
    9fa4:	00d82023          	sw	a3,0(a6)
    9fa8:	00069463          	bnez	a3,9fb0 <__lshift+0x104>
    9fac:	000a8913          	mv	s2,s5
    9fb0:	0044a703          	lw	a4,4(s1)
    9fb4:	044a2783          	lw	a5,68(s4)
    9fb8:	01c12083          	lw	ra,28(sp)
    9fbc:	00271713          	sll	a4,a4,0x2
    9fc0:	00e787b3          	add	a5,a5,a4
    9fc4:	0007a703          	lw	a4,0(a5)
    9fc8:	01252823          	sw	s2,16(a0)
    9fcc:	01812403          	lw	s0,24(sp)
    9fd0:	00e4a023          	sw	a4,0(s1)
    9fd4:	0097a023          	sw	s1,0(a5)
    9fd8:	01012903          	lw	s2,16(sp)
    9fdc:	01412483          	lw	s1,20(sp)
    9fe0:	00c12983          	lw	s3,12(sp)
    9fe4:	00812a03          	lw	s4,8(sp)
    9fe8:	00412a83          	lw	s5,4(sp)
    9fec:	02010113          	add	sp,sp,32
    9ff0:	00008067          	ret
    9ff4:	0007a703          	lw	a4,0(a5)
    9ff8:	00478793          	add	a5,a5,4
    9ffc:	00480813          	add	a6,a6,4
    a000:	fee82e23          	sw	a4,-4(a6)
    a004:	fb17f4e3          	bgeu	a5,a7,9fac <__lshift+0x100>
    a008:	0007a703          	lw	a4,0(a5)
    a00c:	00478793          	add	a5,a5,4
    a010:	00480813          	add	a6,a6,4
    a014:	fee82e23          	sw	a4,-4(a6)
    a018:	fd17eee3          	bltu	a5,a7,9ff4 <__lshift+0x148>
    a01c:	f91ff06f          	j	9fac <__lshift+0x100>
    a020:	00005697          	auipc	a3,0x5
    a024:	fa468693          	add	a3,a3,-92 # efc4 <__fini_array_end+0x230>
    a028:	00000613          	li	a2,0
    a02c:	1de00593          	li	a1,478
    a030:	00005517          	auipc	a0,0x5
    a034:	02850513          	add	a0,a0,40 # f058 <__fini_array_end+0x2c4>
    a038:	61d000ef          	jal	ae54 <__assert_func>

0000a03c <__mcmp>:
    a03c:	01052703          	lw	a4,16(a0)
    a040:	0105a783          	lw	a5,16(a1)
    a044:	00050813          	mv	a6,a0
    a048:	40f70533          	sub	a0,a4,a5
    a04c:	04f71263          	bne	a4,a5,a090 <__mcmp+0x54>
    a050:	00279793          	sll	a5,a5,0x2
    a054:	01480813          	add	a6,a6,20
    a058:	01458593          	add	a1,a1,20
    a05c:	00f80733          	add	a4,a6,a5
    a060:	00f587b3          	add	a5,a1,a5
    a064:	0080006f          	j	a06c <__mcmp+0x30>
    a068:	02e87463          	bgeu	a6,a4,a090 <__mcmp+0x54>
    a06c:	ffc72603          	lw	a2,-4(a4)
    a070:	ffc7a683          	lw	a3,-4(a5)
    a074:	ffc70713          	add	a4,a4,-4
    a078:	ffc78793          	add	a5,a5,-4
    a07c:	fed606e3          	beq	a2,a3,a068 <__mcmp+0x2c>
    a080:	00100513          	li	a0,1
    a084:	00d67663          	bgeu	a2,a3,a090 <__mcmp+0x54>
    a088:	fff00513          	li	a0,-1
    a08c:	00008067          	ret
    a090:	00008067          	ret

0000a094 <__mdiff>:
    a094:	0105a703          	lw	a4,16(a1)
    a098:	01062783          	lw	a5,16(a2)
    a09c:	ff010113          	add	sp,sp,-16
    a0a0:	00812423          	sw	s0,8(sp)
    a0a4:	00912223          	sw	s1,4(sp)
    a0a8:	00112623          	sw	ra,12(sp)
    a0ac:	01212023          	sw	s2,0(sp)
    a0b0:	00058413          	mv	s0,a1
    a0b4:	00060493          	mv	s1,a2
    a0b8:	40f706b3          	sub	a3,a4,a5
    a0bc:	18f71e63          	bne	a4,a5,a258 <__mdiff+0x1c4>
    a0c0:	00279693          	sll	a3,a5,0x2
    a0c4:	01458613          	add	a2,a1,20
    a0c8:	01448713          	add	a4,s1,20
    a0cc:	00d607b3          	add	a5,a2,a3
    a0d0:	00d70733          	add	a4,a4,a3
    a0d4:	0080006f          	j	a0dc <__mdiff+0x48>
    a0d8:	18f67c63          	bgeu	a2,a5,a270 <__mdiff+0x1dc>
    a0dc:	ffc7a583          	lw	a1,-4(a5)
    a0e0:	ffc72683          	lw	a3,-4(a4)
    a0e4:	ffc78793          	add	a5,a5,-4
    a0e8:	ffc70713          	add	a4,a4,-4
    a0ec:	fed586e3          	beq	a1,a3,a0d8 <__mdiff+0x44>
    a0f0:	00100913          	li	s2,1
    a0f4:	00d5ea63          	bltu	a1,a3,a108 <__mdiff+0x74>
    a0f8:	00048793          	mv	a5,s1
    a0fc:	00000913          	li	s2,0
    a100:	00040493          	mv	s1,s0
    a104:	00078413          	mv	s0,a5
    a108:	0044a583          	lw	a1,4(s1)
    a10c:	d24ff0ef          	jal	9630 <_Balloc>
    a110:	1a050663          	beqz	a0,a2bc <__mdiff+0x228>
    a114:	0104a883          	lw	a7,16(s1)
    a118:	01042283          	lw	t0,16(s0)
    a11c:	01448f93          	add	t6,s1,20
    a120:	00289313          	sll	t1,a7,0x2
    a124:	01440813          	add	a6,s0,20
    a128:	00229293          	sll	t0,t0,0x2
    a12c:	01450593          	add	a1,a0,20
    a130:	00010e37          	lui	t3,0x10
    a134:	01252623          	sw	s2,12(a0)
    a138:	006f8333          	add	t1,t6,t1
    a13c:	005802b3          	add	t0,a6,t0
    a140:	00058f13          	mv	t5,a1
    a144:	000f8e93          	mv	t4,t6
    a148:	00000693          	li	a3,0
    a14c:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    a150:	000ea703          	lw	a4,0(t4)
    a154:	00082603          	lw	a2,0(a6)
    a158:	004f0f13          	add	t5,t5,4
    a15c:	01c777b3          	and	a5,a4,t3
    a160:	01c673b3          	and	t2,a2,t3
    a164:	407787b3          	sub	a5,a5,t2
    a168:	00d787b3          	add	a5,a5,a3
    a16c:	01075713          	srl	a4,a4,0x10
    a170:	01065613          	srl	a2,a2,0x10
    a174:	4107d693          	sra	a3,a5,0x10
    a178:	40c70733          	sub	a4,a4,a2
    a17c:	00d70733          	add	a4,a4,a3
    a180:	01071693          	sll	a3,a4,0x10
    a184:	01c7f7b3          	and	a5,a5,t3
    a188:	00d7e7b3          	or	a5,a5,a3
    a18c:	00480813          	add	a6,a6,4
    a190:	feff2e23          	sw	a5,-4(t5)
    a194:	004e8e93          	add	t4,t4,4
    a198:	41075693          	sra	a3,a4,0x10
    a19c:	fa586ae3          	bltu	a6,t0,a150 <__mdiff+0xbc>
    a1a0:	01540713          	add	a4,s0,21
    a1a4:	40828433          	sub	s0,t0,s0
    a1a8:	feb40413          	add	s0,s0,-21
    a1ac:	00e2b2b3          	sltu	t0,t0,a4
    a1b0:	0012cf13          	xor	t5,t0,1
    a1b4:	00245413          	srl	s0,s0,0x2
    a1b8:	00400713          	li	a4,4
    a1bc:	0a028463          	beqz	t0,a264 <__mdiff+0x1d0>
    a1c0:	00ef8fb3          	add	t6,t6,a4
    a1c4:	00e58833          	add	a6,a1,a4
    a1c8:	00010eb7          	lui	t4,0x10
    a1cc:	00080e13          	mv	t3,a6
    a1d0:	000f8613          	mv	a2,t6
    a1d4:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    a1d8:	0c6ff463          	bgeu	t6,t1,a2a0 <__mdiff+0x20c>
    a1dc:	00062783          	lw	a5,0(a2)
    a1e0:	004e0e13          	add	t3,t3,4
    a1e4:	00460613          	add	a2,a2,4
    a1e8:	01d7f733          	and	a4,a5,t4
    a1ec:	00d70733          	add	a4,a4,a3
    a1f0:	0107d593          	srl	a1,a5,0x10
    a1f4:	41075713          	sra	a4,a4,0x10
    a1f8:	00b70733          	add	a4,a4,a1
    a1fc:	00d787b3          	add	a5,a5,a3
    a200:	01d7f7b3          	and	a5,a5,t4
    a204:	01071693          	sll	a3,a4,0x10
    a208:	00d7e7b3          	or	a5,a5,a3
    a20c:	fefe2e23          	sw	a5,-4(t3)
    a210:	41075693          	sra	a3,a4,0x10
    a214:	fc6664e3          	bltu	a2,t1,a1dc <__mdiff+0x148>
    a218:	fff30313          	add	t1,t1,-1
    a21c:	41f30333          	sub	t1,t1,t6
    a220:	ffc37313          	and	t1,t1,-4
    a224:	00680733          	add	a4,a6,t1
    a228:	00079a63          	bnez	a5,a23c <__mdiff+0x1a8>
    a22c:	ffc72783          	lw	a5,-4(a4)
    a230:	fff88893          	add	a7,a7,-1
    a234:	ffc70713          	add	a4,a4,-4
    a238:	fe078ae3          	beqz	a5,a22c <__mdiff+0x198>
    a23c:	00c12083          	lw	ra,12(sp)
    a240:	00812403          	lw	s0,8(sp)
    a244:	01152823          	sw	a7,16(a0)
    a248:	00412483          	lw	s1,4(sp)
    a24c:	00012903          	lw	s2,0(sp)
    a250:	01010113          	add	sp,sp,16
    a254:	00008067          	ret
    a258:	00100913          	li	s2,1
    a25c:	e806dee3          	bgez	a3,a0f8 <__mdiff+0x64>
    a260:	ea9ff06f          	j	a108 <__mdiff+0x74>
    a264:	00140713          	add	a4,s0,1
    a268:	00271713          	sll	a4,a4,0x2
    a26c:	f55ff06f          	j	a1c0 <__mdiff+0x12c>
    a270:	00000593          	li	a1,0
    a274:	bbcff0ef          	jal	9630 <_Balloc>
    a278:	06050063          	beqz	a0,a2d8 <__mdiff+0x244>
    a27c:	00c12083          	lw	ra,12(sp)
    a280:	00812403          	lw	s0,8(sp)
    a284:	00100793          	li	a5,1
    a288:	00f52823          	sw	a5,16(a0)
    a28c:	00052a23          	sw	zero,20(a0)
    a290:	00412483          	lw	s1,4(sp)
    a294:	00012903          	lw	s2,0(sp)
    a298:	01010113          	add	sp,sp,16
    a29c:	00008067          	ret
    a2a0:	00000713          	li	a4,0
    a2a4:	000f1663          	bnez	t5,a2b0 <__mdiff+0x21c>
    a2a8:	00e58733          	add	a4,a1,a4
    a2ac:	f7dff06f          	j	a228 <__mdiff+0x194>
    a2b0:	00241713          	sll	a4,s0,0x2
    a2b4:	00e58733          	add	a4,a1,a4
    a2b8:	f71ff06f          	j	a228 <__mdiff+0x194>
    a2bc:	00005697          	auipc	a3,0x5
    a2c0:	d0868693          	add	a3,a3,-760 # efc4 <__fini_array_end+0x230>
    a2c4:	00000613          	li	a2,0
    a2c8:	24500593          	li	a1,581
    a2cc:	00005517          	auipc	a0,0x5
    a2d0:	d8c50513          	add	a0,a0,-628 # f058 <__fini_array_end+0x2c4>
    a2d4:	381000ef          	jal	ae54 <__assert_func>
    a2d8:	00005697          	auipc	a3,0x5
    a2dc:	cec68693          	add	a3,a3,-788 # efc4 <__fini_array_end+0x230>
    a2e0:	00000613          	li	a2,0
    a2e4:	23700593          	li	a1,567
    a2e8:	00005517          	auipc	a0,0x5
    a2ec:	d7050513          	add	a0,a0,-656 # f058 <__fini_array_end+0x2c4>
    a2f0:	365000ef          	jal	ae54 <__assert_func>

0000a2f4 <__d2b>:
    a2f4:	fd010113          	add	sp,sp,-48
    a2f8:	01512a23          	sw	s5,20(sp)
    a2fc:	00058a93          	mv	s5,a1
    a300:	00100593          	li	a1,1
    a304:	02912223          	sw	s1,36(sp)
    a308:	01312e23          	sw	s3,28(sp)
    a30c:	01412c23          	sw	s4,24(sp)
    a310:	02112623          	sw	ra,44(sp)
    a314:	02812423          	sw	s0,40(sp)
    a318:	03212023          	sw	s2,32(sp)
    a31c:	00060493          	mv	s1,a2
    a320:	00068a13          	mv	s4,a3
    a324:	00070993          	mv	s3,a4
    a328:	b08ff0ef          	jal	9630 <_Balloc>
    a32c:	10050263          	beqz	a0,a430 <__d2b+0x13c>
    a330:	00100737          	lui	a4,0x100
    a334:	0144d913          	srl	s2,s1,0x14
    a338:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a33c:	7ff97913          	and	s2,s2,2047
    a340:	00050413          	mv	s0,a0
    a344:	0097f7b3          	and	a5,a5,s1
    a348:	00090463          	beqz	s2,a350 <__d2b+0x5c>
    a34c:	00e7e7b3          	or	a5,a5,a4
    a350:	00f12623          	sw	a5,12(sp)
    a354:	060a9263          	bnez	s5,a3b8 <__d2b+0xc4>
    a358:	00c10513          	add	a0,sp,12
    a35c:	da8ff0ef          	jal	9904 <__lo0bits>
    a360:	00c12703          	lw	a4,12(sp)
    a364:	00100493          	li	s1,1
    a368:	00942823          	sw	s1,16(s0)
    a36c:	00e42a23          	sw	a4,20(s0)
    a370:	02050793          	add	a5,a0,32
    a374:	08090863          	beqz	s2,a404 <__d2b+0x110>
    a378:	bcd90913          	add	s2,s2,-1075
    a37c:	00f90933          	add	s2,s2,a5
    a380:	03500493          	li	s1,53
    a384:	012a2023          	sw	s2,0(s4)
    a388:	40f48533          	sub	a0,s1,a5
    a38c:	00a9a023          	sw	a0,0(s3)
    a390:	02c12083          	lw	ra,44(sp)
    a394:	00040513          	mv	a0,s0
    a398:	02812403          	lw	s0,40(sp)
    a39c:	02412483          	lw	s1,36(sp)
    a3a0:	02012903          	lw	s2,32(sp)
    a3a4:	01c12983          	lw	s3,28(sp)
    a3a8:	01812a03          	lw	s4,24(sp)
    a3ac:	01412a83          	lw	s5,20(sp)
    a3b0:	03010113          	add	sp,sp,48
    a3b4:	00008067          	ret
    a3b8:	00810513          	add	a0,sp,8
    a3bc:	01512423          	sw	s5,8(sp)
    a3c0:	d44ff0ef          	jal	9904 <__lo0bits>
    a3c4:	00c12703          	lw	a4,12(sp)
    a3c8:	00050793          	mv	a5,a0
    a3cc:	04050e63          	beqz	a0,a428 <__d2b+0x134>
    a3d0:	00812603          	lw	a2,8(sp)
    a3d4:	02000693          	li	a3,32
    a3d8:	40a686b3          	sub	a3,a3,a0
    a3dc:	00d716b3          	sll	a3,a4,a3
    a3e0:	00a75733          	srl	a4,a4,a0
    a3e4:	00c6e6b3          	or	a3,a3,a2
    a3e8:	00e12623          	sw	a4,12(sp)
    a3ec:	00e034b3          	snez	s1,a4
    a3f0:	00148493          	add	s1,s1,1
    a3f4:	00d42a23          	sw	a3,20(s0)
    a3f8:	00e42c23          	sw	a4,24(s0)
    a3fc:	00942823          	sw	s1,16(s0)
    a400:	f6091ce3          	bnez	s2,a378 <__d2b+0x84>
    a404:	00249713          	sll	a4,s1,0x2
    a408:	00e40733          	add	a4,s0,a4
    a40c:	01072503          	lw	a0,16(a4)
    a410:	bce78793          	add	a5,a5,-1074
    a414:	00fa2023          	sw	a5,0(s4)
    a418:	c74ff0ef          	jal	988c <__hi0bits>
    a41c:	00549493          	sll	s1,s1,0x5
    a420:	40a48533          	sub	a0,s1,a0
    a424:	f69ff06f          	j	a38c <__d2b+0x98>
    a428:	00812683          	lw	a3,8(sp)
    a42c:	fc1ff06f          	j	a3ec <__d2b+0xf8>
    a430:	00005697          	auipc	a3,0x5
    a434:	b9468693          	add	a3,a3,-1132 # efc4 <__fini_array_end+0x230>
    a438:	00000613          	li	a2,0
    a43c:	30f00593          	li	a1,783
    a440:	00005517          	auipc	a0,0x5
    a444:	c1850513          	add	a0,a0,-1000 # f058 <__fini_array_end+0x2c4>
    a448:	20d000ef          	jal	ae54 <__assert_func>

0000a44c <_realloc_r>:
    a44c:	fd010113          	add	sp,sp,-48
    a450:	02912223          	sw	s1,36(sp)
    a454:	02112623          	sw	ra,44(sp)
    a458:	00060493          	mv	s1,a2
    a45c:	1e058863          	beqz	a1,a64c <_realloc_r+0x200>
    a460:	02812423          	sw	s0,40(sp)
    a464:	03212023          	sw	s2,32(sp)
    a468:	00058413          	mv	s0,a1
    a46c:	01312e23          	sw	s3,28(sp)
    a470:	01512a23          	sw	s5,20(sp)
    a474:	01412c23          	sw	s4,24(sp)
    a478:	00050913          	mv	s2,a0
    a47c:	8b1f70ef          	jal	1d2c <__malloc_lock>
    a480:	ffc42703          	lw	a4,-4(s0)
    a484:	00b48793          	add	a5,s1,11
    a488:	01600693          	li	a3,22
    a48c:	ff840a93          	add	s5,s0,-8
    a490:	ffc77993          	and	s3,a4,-4
    a494:	10f6f263          	bgeu	a3,a5,a598 <_realloc_r+0x14c>
    a498:	ff87fa13          	and	s4,a5,-8
    a49c:	1007c263          	bltz	a5,a5a0 <_realloc_r+0x154>
    a4a0:	109a6063          	bltu	s4,s1,a5a0 <_realloc_r+0x154>
    a4a4:	1349d263          	bge	s3,s4,a5c8 <_realloc_r+0x17c>
    a4a8:	01812423          	sw	s8,8(sp)
    a4ac:	7fff6c17          	auipc	s8,0x7fff6
    a4b0:	c74c0c13          	add	s8,s8,-908 # 80000120 <__malloc_av_>
    a4b4:	008c2603          	lw	a2,8(s8)
    a4b8:	013a86b3          	add	a3,s5,s3
    a4bc:	0046a783          	lw	a5,4(a3)
    a4c0:	1cd60863          	beq	a2,a3,a690 <_realloc_r+0x244>
    a4c4:	ffe7f613          	and	a2,a5,-2
    a4c8:	00c68633          	add	a2,a3,a2
    a4cc:	00462603          	lw	a2,4(a2)
    a4d0:	00167613          	and	a2,a2,1
    a4d4:	14061a63          	bnez	a2,a628 <_realloc_r+0x1dc>
    a4d8:	ffc7f793          	and	a5,a5,-4
    a4dc:	00f98633          	add	a2,s3,a5
    a4e0:	0d465863          	bge	a2,s4,a5b0 <_realloc_r+0x164>
    a4e4:	00177713          	and	a4,a4,1
    a4e8:	02071c63          	bnez	a4,a520 <_realloc_r+0xd4>
    a4ec:	01712623          	sw	s7,12(sp)
    a4f0:	ff842b83          	lw	s7,-8(s0)
    a4f4:	01612823          	sw	s6,16(sp)
    a4f8:	417a8bb3          	sub	s7,s5,s7
    a4fc:	004ba703          	lw	a4,4(s7)
    a500:	ffc77713          	and	a4,a4,-4
    a504:	00e787b3          	add	a5,a5,a4
    a508:	01378b33          	add	s6,a5,s3
    a50c:	334b5c63          	bge	s6,s4,a844 <_realloc_r+0x3f8>
    a510:	00e98b33          	add	s6,s3,a4
    a514:	294b5863          	bge	s6,s4,a7a4 <_realloc_r+0x358>
    a518:	01012b03          	lw	s6,16(sp)
    a51c:	00c12b83          	lw	s7,12(sp)
    a520:	00048593          	mv	a1,s1
    a524:	00090513          	mv	a0,s2
    a528:	824f70ef          	jal	154c <_malloc_r>
    a52c:	00050493          	mv	s1,a0
    a530:	40050863          	beqz	a0,a940 <_realloc_r+0x4f4>
    a534:	ffc42783          	lw	a5,-4(s0)
    a538:	ff850713          	add	a4,a0,-8
    a53c:	ffe7f793          	and	a5,a5,-2
    a540:	00fa87b3          	add	a5,s5,a5
    a544:	24e78663          	beq	a5,a4,a790 <_realloc_r+0x344>
    a548:	ffc98613          	add	a2,s3,-4
    a54c:	02400793          	li	a5,36
    a550:	2ec7e463          	bltu	a5,a2,a838 <_realloc_r+0x3ec>
    a554:	01300713          	li	a4,19
    a558:	20c76a63          	bltu	a4,a2,a76c <_realloc_r+0x320>
    a55c:	00050793          	mv	a5,a0
    a560:	00040713          	mv	a4,s0
    a564:	00072683          	lw	a3,0(a4)
    a568:	00d7a023          	sw	a3,0(a5)
    a56c:	00472683          	lw	a3,4(a4)
    a570:	00d7a223          	sw	a3,4(a5)
    a574:	00872703          	lw	a4,8(a4)
    a578:	00e7a423          	sw	a4,8(a5)
    a57c:	00040593          	mv	a1,s0
    a580:	00090513          	mv	a0,s2
    a584:	cbdf60ef          	jal	1240 <_free_r>
    a588:	00090513          	mv	a0,s2
    a58c:	facf70ef          	jal	1d38 <__malloc_unlock>
    a590:	00812c03          	lw	s8,8(sp)
    a594:	06c0006f          	j	a600 <_realloc_r+0x1b4>
    a598:	01000a13          	li	s4,16
    a59c:	f09a74e3          	bgeu	s4,s1,a4a4 <_realloc_r+0x58>
    a5a0:	00c00793          	li	a5,12
    a5a4:	00f92023          	sw	a5,0(s2)
    a5a8:	00000493          	li	s1,0
    a5ac:	0540006f          	j	a600 <_realloc_r+0x1b4>
    a5b0:	00c6a783          	lw	a5,12(a3)
    a5b4:	0086a703          	lw	a4,8(a3)
    a5b8:	00812c03          	lw	s8,8(sp)
    a5bc:	00060993          	mv	s3,a2
    a5c0:	00f72623          	sw	a5,12(a4)
    a5c4:	00e7a423          	sw	a4,8(a5)
    a5c8:	004aa783          	lw	a5,4(s5)
    a5cc:	414986b3          	sub	a3,s3,s4
    a5d0:	00f00613          	li	a2,15
    a5d4:	0017f793          	and	a5,a5,1
    a5d8:	013a8733          	add	a4,s5,s3
    a5dc:	08d66263          	bltu	a2,a3,a660 <_realloc_r+0x214>
    a5e0:	0137e7b3          	or	a5,a5,s3
    a5e4:	00faa223          	sw	a5,4(s5)
    a5e8:	00472783          	lw	a5,4(a4)
    a5ec:	0017e793          	or	a5,a5,1
    a5f0:	00f72223          	sw	a5,4(a4)
    a5f4:	00090513          	mv	a0,s2
    a5f8:	f40f70ef          	jal	1d38 <__malloc_unlock>
    a5fc:	00040493          	mv	s1,s0
    a600:	02812403          	lw	s0,40(sp)
    a604:	02c12083          	lw	ra,44(sp)
    a608:	02012903          	lw	s2,32(sp)
    a60c:	01c12983          	lw	s3,28(sp)
    a610:	01812a03          	lw	s4,24(sp)
    a614:	01412a83          	lw	s5,20(sp)
    a618:	00048513          	mv	a0,s1
    a61c:	02412483          	lw	s1,36(sp)
    a620:	03010113          	add	sp,sp,48
    a624:	00008067          	ret
    a628:	00177713          	and	a4,a4,1
    a62c:	ee071ae3          	bnez	a4,a520 <_realloc_r+0xd4>
    a630:	01712623          	sw	s7,12(sp)
    a634:	ff842b83          	lw	s7,-8(s0)
    a638:	01612823          	sw	s6,16(sp)
    a63c:	417a8bb3          	sub	s7,s5,s7
    a640:	004ba703          	lw	a4,4(s7)
    a644:	ffc77713          	and	a4,a4,-4
    a648:	ec9ff06f          	j	a510 <_realloc_r+0xc4>
    a64c:	02c12083          	lw	ra,44(sp)
    a650:	02412483          	lw	s1,36(sp)
    a654:	00060593          	mv	a1,a2
    a658:	03010113          	add	sp,sp,48
    a65c:	ef1f606f          	j	154c <_malloc_r>
    a660:	0147e7b3          	or	a5,a5,s4
    a664:	00faa223          	sw	a5,4(s5)
    a668:	014a85b3          	add	a1,s5,s4
    a66c:	0016e693          	or	a3,a3,1
    a670:	00d5a223          	sw	a3,4(a1)
    a674:	00472783          	lw	a5,4(a4)
    a678:	00858593          	add	a1,a1,8
    a67c:	00090513          	mv	a0,s2
    a680:	0017e793          	or	a5,a5,1
    a684:	00f72223          	sw	a5,4(a4)
    a688:	bb9f60ef          	jal	1240 <_free_r>
    a68c:	f69ff06f          	j	a5f4 <_realloc_r+0x1a8>
    a690:	ffc7f793          	and	a5,a5,-4
    a694:	013786b3          	add	a3,a5,s3
    a698:	010a0613          	add	a2,s4,16
    a69c:	26c6d063          	bge	a3,a2,a8fc <_realloc_r+0x4b0>
    a6a0:	00177713          	and	a4,a4,1
    a6a4:	e6071ee3          	bnez	a4,a520 <_realloc_r+0xd4>
    a6a8:	01712623          	sw	s7,12(sp)
    a6ac:	ff842b83          	lw	s7,-8(s0)
    a6b0:	01612823          	sw	s6,16(sp)
    a6b4:	417a8bb3          	sub	s7,s5,s7
    a6b8:	004ba703          	lw	a4,4(s7)
    a6bc:	ffc77713          	and	a4,a4,-4
    a6c0:	00e787b3          	add	a5,a5,a4
    a6c4:	01378b33          	add	s6,a5,s3
    a6c8:	e4cb44e3          	blt	s6,a2,a510 <_realloc_r+0xc4>
    a6cc:	00cba783          	lw	a5,12(s7)
    a6d0:	008ba703          	lw	a4,8(s7)
    a6d4:	ffc98613          	add	a2,s3,-4
    a6d8:	02400693          	li	a3,36
    a6dc:	00f72623          	sw	a5,12(a4)
    a6e0:	00e7a423          	sw	a4,8(a5)
    a6e4:	008b8493          	add	s1,s7,8
    a6e8:	28c6e463          	bltu	a3,a2,a970 <_realloc_r+0x524>
    a6ec:	01300713          	li	a4,19
    a6f0:	00048793          	mv	a5,s1
    a6f4:	02c77263          	bgeu	a4,a2,a718 <_realloc_r+0x2cc>
    a6f8:	00042703          	lw	a4,0(s0)
    a6fc:	01b00793          	li	a5,27
    a700:	00eba423          	sw	a4,8(s7)
    a704:	00442703          	lw	a4,4(s0)
    a708:	00eba623          	sw	a4,12(s7)
    a70c:	26c7ea63          	bltu	a5,a2,a980 <_realloc_r+0x534>
    a710:	00840413          	add	s0,s0,8
    a714:	010b8793          	add	a5,s7,16
    a718:	00042703          	lw	a4,0(s0)
    a71c:	00e7a023          	sw	a4,0(a5)
    a720:	00442703          	lw	a4,4(s0)
    a724:	00e7a223          	sw	a4,4(a5)
    a728:	00842703          	lw	a4,8(s0)
    a72c:	00e7a423          	sw	a4,8(a5)
    a730:	014b8733          	add	a4,s7,s4
    a734:	414b07b3          	sub	a5,s6,s4
    a738:	00ec2423          	sw	a4,8(s8)
    a73c:	0017e793          	or	a5,a5,1
    a740:	00f72223          	sw	a5,4(a4)
    a744:	004ba783          	lw	a5,4(s7)
    a748:	00090513          	mv	a0,s2
    a74c:	0017f793          	and	a5,a5,1
    a750:	0147e7b3          	or	a5,a5,s4
    a754:	00fba223          	sw	a5,4(s7)
    a758:	de0f70ef          	jal	1d38 <__malloc_unlock>
    a75c:	01012b03          	lw	s6,16(sp)
    a760:	00c12b83          	lw	s7,12(sp)
    a764:	00812c03          	lw	s8,8(sp)
    a768:	e99ff06f          	j	a600 <_realloc_r+0x1b4>
    a76c:	00042683          	lw	a3,0(s0)
    a770:	01b00713          	li	a4,27
    a774:	00d52023          	sw	a3,0(a0)
    a778:	00442683          	lw	a3,4(s0)
    a77c:	00d52223          	sw	a3,4(a0)
    a780:	14c76e63          	bltu	a4,a2,a8dc <_realloc_r+0x490>
    a784:	00840713          	add	a4,s0,8
    a788:	00850793          	add	a5,a0,8
    a78c:	dd9ff06f          	j	a564 <_realloc_r+0x118>
    a790:	ffc52783          	lw	a5,-4(a0)
    a794:	00812c03          	lw	s8,8(sp)
    a798:	ffc7f793          	and	a5,a5,-4
    a79c:	00f989b3          	add	s3,s3,a5
    a7a0:	e29ff06f          	j	a5c8 <_realloc_r+0x17c>
    a7a4:	00cba783          	lw	a5,12(s7)
    a7a8:	008ba703          	lw	a4,8(s7)
    a7ac:	ffc98613          	add	a2,s3,-4
    a7b0:	02400693          	li	a3,36
    a7b4:	00f72623          	sw	a5,12(a4)
    a7b8:	00e7a423          	sw	a4,8(a5)
    a7bc:	008b8493          	add	s1,s7,8
    a7c0:	10c6e663          	bltu	a3,a2,a8cc <_realloc_r+0x480>
    a7c4:	01300713          	li	a4,19
    a7c8:	00048793          	mv	a5,s1
    a7cc:	02c77c63          	bgeu	a4,a2,a804 <_realloc_r+0x3b8>
    a7d0:	00042703          	lw	a4,0(s0)
    a7d4:	01b00793          	li	a5,27
    a7d8:	00eba423          	sw	a4,8(s7)
    a7dc:	00442703          	lw	a4,4(s0)
    a7e0:	00eba623          	sw	a4,12(s7)
    a7e4:	14c7f863          	bgeu	a5,a2,a934 <_realloc_r+0x4e8>
    a7e8:	00842783          	lw	a5,8(s0)
    a7ec:	00fba823          	sw	a5,16(s7)
    a7f0:	00c42783          	lw	a5,12(s0)
    a7f4:	00fbaa23          	sw	a5,20(s7)
    a7f8:	0ad60c63          	beq	a2,a3,a8b0 <_realloc_r+0x464>
    a7fc:	01040413          	add	s0,s0,16
    a800:	018b8793          	add	a5,s7,24
    a804:	00042703          	lw	a4,0(s0)
    a808:	00e7a023          	sw	a4,0(a5)
    a80c:	00442703          	lw	a4,4(s0)
    a810:	00e7a223          	sw	a4,4(a5)
    a814:	00842703          	lw	a4,8(s0)
    a818:	00e7a423          	sw	a4,8(a5)
    a81c:	000b0993          	mv	s3,s6
    a820:	000b8a93          	mv	s5,s7
    a824:	01012b03          	lw	s6,16(sp)
    a828:	00c12b83          	lw	s7,12(sp)
    a82c:	00812c03          	lw	s8,8(sp)
    a830:	00048413          	mv	s0,s1
    a834:	d95ff06f          	j	a5c8 <_realloc_r+0x17c>
    a838:	00040593          	mv	a1,s0
    a83c:	ae8fd0ef          	jal	7b24 <memmove>
    a840:	d3dff06f          	j	a57c <_realloc_r+0x130>
    a844:	00c6a783          	lw	a5,12(a3)
    a848:	0086a703          	lw	a4,8(a3)
    a84c:	ffc98613          	add	a2,s3,-4
    a850:	02400693          	li	a3,36
    a854:	00f72623          	sw	a5,12(a4)
    a858:	00e7a423          	sw	a4,8(a5)
    a85c:	008ba703          	lw	a4,8(s7)
    a860:	00cba783          	lw	a5,12(s7)
    a864:	008b8493          	add	s1,s7,8
    a868:	00f72623          	sw	a5,12(a4)
    a86c:	00e7a423          	sw	a4,8(a5)
    a870:	04c6ee63          	bltu	a3,a2,a8cc <_realloc_r+0x480>
    a874:	01300713          	li	a4,19
    a878:	00048793          	mv	a5,s1
    a87c:	f8c774e3          	bgeu	a4,a2,a804 <_realloc_r+0x3b8>
    a880:	00042703          	lw	a4,0(s0)
    a884:	01b00793          	li	a5,27
    a888:	00eba423          	sw	a4,8(s7)
    a88c:	00442703          	lw	a4,4(s0)
    a890:	00eba623          	sw	a4,12(s7)
    a894:	0ac7f063          	bgeu	a5,a2,a934 <_realloc_r+0x4e8>
    a898:	00842703          	lw	a4,8(s0)
    a89c:	02400793          	li	a5,36
    a8a0:	00eba823          	sw	a4,16(s7)
    a8a4:	00c42703          	lw	a4,12(s0)
    a8a8:	00ebaa23          	sw	a4,20(s7)
    a8ac:	f4f618e3          	bne	a2,a5,a7fc <_realloc_r+0x3b0>
    a8b0:	01042703          	lw	a4,16(s0)
    a8b4:	020b8793          	add	a5,s7,32
    a8b8:	01840413          	add	s0,s0,24
    a8bc:	00ebac23          	sw	a4,24(s7)
    a8c0:	ffc42703          	lw	a4,-4(s0)
    a8c4:	00ebae23          	sw	a4,28(s7)
    a8c8:	f3dff06f          	j	a804 <_realloc_r+0x3b8>
    a8cc:	00040593          	mv	a1,s0
    a8d0:	00048513          	mv	a0,s1
    a8d4:	a50fd0ef          	jal	7b24 <memmove>
    a8d8:	f45ff06f          	j	a81c <_realloc_r+0x3d0>
    a8dc:	00842703          	lw	a4,8(s0)
    a8e0:	00e52423          	sw	a4,8(a0)
    a8e4:	00c42703          	lw	a4,12(s0)
    a8e8:	00e52623          	sw	a4,12(a0)
    a8ec:	06f60463          	beq	a2,a5,a954 <_realloc_r+0x508>
    a8f0:	01040713          	add	a4,s0,16
    a8f4:	01050793          	add	a5,a0,16
    a8f8:	c6dff06f          	j	a564 <_realloc_r+0x118>
    a8fc:	014a8ab3          	add	s5,s5,s4
    a900:	414687b3          	sub	a5,a3,s4
    a904:	015c2423          	sw	s5,8(s8)
    a908:	0017e793          	or	a5,a5,1
    a90c:	00faa223          	sw	a5,4(s5)
    a910:	ffc42783          	lw	a5,-4(s0)
    a914:	00090513          	mv	a0,s2
    a918:	00040493          	mv	s1,s0
    a91c:	0017f793          	and	a5,a5,1
    a920:	0147e7b3          	or	a5,a5,s4
    a924:	fef42e23          	sw	a5,-4(s0)
    a928:	c10f70ef          	jal	1d38 <__malloc_unlock>
    a92c:	00812c03          	lw	s8,8(sp)
    a930:	cd1ff06f          	j	a600 <_realloc_r+0x1b4>
    a934:	00840413          	add	s0,s0,8
    a938:	010b8793          	add	a5,s7,16
    a93c:	ec9ff06f          	j	a804 <_realloc_r+0x3b8>
    a940:	00090513          	mv	a0,s2
    a944:	bf4f70ef          	jal	1d38 <__malloc_unlock>
    a948:	00000493          	li	s1,0
    a94c:	00812c03          	lw	s8,8(sp)
    a950:	cb1ff06f          	j	a600 <_realloc_r+0x1b4>
    a954:	01042683          	lw	a3,16(s0)
    a958:	01840713          	add	a4,s0,24
    a95c:	01850793          	add	a5,a0,24
    a960:	00d52823          	sw	a3,16(a0)
    a964:	01442683          	lw	a3,20(s0)
    a968:	00d52a23          	sw	a3,20(a0)
    a96c:	bf9ff06f          	j	a564 <_realloc_r+0x118>
    a970:	00040593          	mv	a1,s0
    a974:	00048513          	mv	a0,s1
    a978:	9acfd0ef          	jal	7b24 <memmove>
    a97c:	db5ff06f          	j	a730 <_realloc_r+0x2e4>
    a980:	00842783          	lw	a5,8(s0)
    a984:	00fba823          	sw	a5,16(s7)
    a988:	00c42783          	lw	a5,12(s0)
    a98c:	00fbaa23          	sw	a5,20(s7)
    a990:	00d60863          	beq	a2,a3,a9a0 <_realloc_r+0x554>
    a994:	01040413          	add	s0,s0,16
    a998:	018b8793          	add	a5,s7,24
    a99c:	d7dff06f          	j	a718 <_realloc_r+0x2cc>
    a9a0:	01042703          	lw	a4,16(s0)
    a9a4:	020b8793          	add	a5,s7,32
    a9a8:	01840413          	add	s0,s0,24
    a9ac:	00ebac23          	sw	a4,24(s7)
    a9b0:	ffc42703          	lw	a4,-4(s0)
    a9b4:	00ebae23          	sw	a4,28(s7)
    a9b8:	d61ff06f          	j	a718 <_realloc_r+0x2cc>

0000a9bc <__ascii_wctomb>:
    a9bc:	02058463          	beqz	a1,a9e4 <__ascii_wctomb+0x28>
    a9c0:	0ff00793          	li	a5,255
    a9c4:	00c7e863          	bltu	a5,a2,a9d4 <__ascii_wctomb+0x18>
    a9c8:	00c58023          	sb	a2,0(a1)
    a9cc:	00100513          	li	a0,1
    a9d0:	00008067          	ret
    a9d4:	08a00793          	li	a5,138
    a9d8:	00f52023          	sw	a5,0(a0)
    a9dc:	fff00513          	li	a0,-1
    a9e0:	00008067          	ret
    a9e4:	00000513          	li	a0,0
    a9e8:	00008067          	ret

0000a9ec <_wcrtomb_r>:
    a9ec:	fe010113          	add	sp,sp,-32
    a9f0:	00812c23          	sw	s0,24(sp)
    a9f4:	00912a23          	sw	s1,20(sp)
    a9f8:	00112e23          	sw	ra,28(sp)
    a9fc:	00050493          	mv	s1,a0
    aa00:	10450413          	add	s0,a0,260
    aa04:	00068463          	beqz	a3,aa0c <_wcrtomb_r+0x20>
    aa08:	00068413          	mv	s0,a3
    aa0c:	7fff6797          	auipc	a5,0x7fff6
    aa10:	c087a783          	lw	a5,-1016(a5) # 80000614 <__global_locale+0xe0>
    aa14:	00040693          	mv	a3,s0
    aa18:	02058463          	beqz	a1,aa40 <_wcrtomb_r+0x54>
    aa1c:	00048513          	mv	a0,s1
    aa20:	000780e7          	jalr	a5
    aa24:	fff00793          	li	a5,-1
    aa28:	02f50863          	beq	a0,a5,aa58 <_wcrtomb_r+0x6c>
    aa2c:	01c12083          	lw	ra,28(sp)
    aa30:	01812403          	lw	s0,24(sp)
    aa34:	01412483          	lw	s1,20(sp)
    aa38:	02010113          	add	sp,sp,32
    aa3c:	00008067          	ret
    aa40:	00000613          	li	a2,0
    aa44:	00410593          	add	a1,sp,4
    aa48:	00048513          	mv	a0,s1
    aa4c:	000780e7          	jalr	a5
    aa50:	fff00793          	li	a5,-1
    aa54:	fcf51ce3          	bne	a0,a5,aa2c <_wcrtomb_r+0x40>
    aa58:	00042023          	sw	zero,0(s0)
    aa5c:	01c12083          	lw	ra,28(sp)
    aa60:	01812403          	lw	s0,24(sp)
    aa64:	08a00793          	li	a5,138
    aa68:	00f4a023          	sw	a5,0(s1)
    aa6c:	01412483          	lw	s1,20(sp)
    aa70:	02010113          	add	sp,sp,32
    aa74:	00008067          	ret

0000aa78 <_wcsrtombs_r>:
    aa78:	00070793          	mv	a5,a4
    aa7c:	00068713          	mv	a4,a3
    aa80:	fff00693          	li	a3,-1
    aa84:	7a40006f          	j	b228 <_wcsnrtombs_r>

0000aa88 <_fclose_r>:
    aa88:	ff010113          	add	sp,sp,-16
    aa8c:	00112623          	sw	ra,12(sp)
    aa90:	01212023          	sw	s2,0(sp)
    aa94:	0e058263          	beqz	a1,ab78 <_fclose_r+0xf0>
    aa98:	00812423          	sw	s0,8(sp)
    aa9c:	00912223          	sw	s1,4(sp)
    aaa0:	00058413          	mv	s0,a1
    aaa4:	00050493          	mv	s1,a0
    aaa8:	00050663          	beqz	a0,aab4 <_fclose_r+0x2c>
    aaac:	03452783          	lw	a5,52(a0)
    aab0:	10078063          	beqz	a5,abb0 <_fclose_r+0x128>
    aab4:	06442783          	lw	a5,100(s0)
    aab8:	00c41703          	lh	a4,12(s0)
    aabc:	0017f793          	and	a5,a5,1
    aac0:	0a079663          	bnez	a5,ab6c <_fclose_r+0xe4>
    aac4:	20077713          	and	a4,a4,512
    aac8:	0e070863          	beqz	a4,abb8 <_fclose_r+0x130>
    aacc:	00040593          	mv	a1,s0
    aad0:	00048513          	mv	a0,s1
    aad4:	9f5fb0ef          	jal	64c8 <__sflush_r>
    aad8:	02c42783          	lw	a5,44(s0)
    aadc:	00050913          	mv	s2,a0
    aae0:	00078a63          	beqz	a5,aaf4 <_fclose_r+0x6c>
    aae4:	01c42583          	lw	a1,28(s0)
    aae8:	00048513          	mv	a0,s1
    aaec:	000780e7          	jalr	a5
    aaf0:	0a054063          	bltz	a0,ab90 <_fclose_r+0x108>
    aaf4:	00c45783          	lhu	a5,12(s0)
    aaf8:	0807f793          	and	a5,a5,128
    aafc:	0a079263          	bnez	a5,aba0 <_fclose_r+0x118>
    ab00:	03042583          	lw	a1,48(s0)
    ab04:	00058c63          	beqz	a1,ab1c <_fclose_r+0x94>
    ab08:	04040793          	add	a5,s0,64
    ab0c:	00f58663          	beq	a1,a5,ab18 <_fclose_r+0x90>
    ab10:	00048513          	mv	a0,s1
    ab14:	f2cf60ef          	jal	1240 <_free_r>
    ab18:	02042823          	sw	zero,48(s0)
    ab1c:	04442583          	lw	a1,68(s0)
    ab20:	00058863          	beqz	a1,ab30 <_fclose_r+0xa8>
    ab24:	00048513          	mv	a0,s1
    ab28:	f18f60ef          	jal	1240 <_free_r>
    ab2c:	04042223          	sw	zero,68(s0)
    ab30:	f51fb0ef          	jal	6a80 <__sfp_lock_acquire>
    ab34:	06442783          	lw	a5,100(s0)
    ab38:	00041623          	sh	zero,12(s0)
    ab3c:	0017f793          	and	a5,a5,1
    ab40:	0a078663          	beqz	a5,abec <_fclose_r+0x164>
    ab44:	05842503          	lw	a0,88(s0)
    ab48:	a9cf60ef          	jal	de4 <__retarget_lock_close_recursive>
    ab4c:	f41fb0ef          	jal	6a8c <__sfp_lock_release>
    ab50:	00c12083          	lw	ra,12(sp)
    ab54:	00812403          	lw	s0,8(sp)
    ab58:	00412483          	lw	s1,4(sp)
    ab5c:	00090513          	mv	a0,s2
    ab60:	00012903          	lw	s2,0(sp)
    ab64:	01010113          	add	sp,sp,16
    ab68:	00008067          	ret
    ab6c:	f60710e3          	bnez	a4,aacc <_fclose_r+0x44>
    ab70:	00812403          	lw	s0,8(sp)
    ab74:	00412483          	lw	s1,4(sp)
    ab78:	00000913          	li	s2,0
    ab7c:	00c12083          	lw	ra,12(sp)
    ab80:	00090513          	mv	a0,s2
    ab84:	00012903          	lw	s2,0(sp)
    ab88:	01010113          	add	sp,sp,16
    ab8c:	00008067          	ret
    ab90:	00c45783          	lhu	a5,12(s0)
    ab94:	fff00913          	li	s2,-1
    ab98:	0807f793          	and	a5,a5,128
    ab9c:	f60782e3          	beqz	a5,ab00 <_fclose_r+0x78>
    aba0:	01042583          	lw	a1,16(s0)
    aba4:	00048513          	mv	a0,s1
    aba8:	e98f60ef          	jal	1240 <_free_r>
    abac:	f55ff06f          	j	ab00 <_fclose_r+0x78>
    abb0:	e61fb0ef          	jal	6a10 <__sinit>
    abb4:	f01ff06f          	j	aab4 <_fclose_r+0x2c>
    abb8:	05842503          	lw	a0,88(s0)
    abbc:	a2cf60ef          	jal	de8 <__retarget_lock_acquire_recursive>
    abc0:	00c41783          	lh	a5,12(s0)
    abc4:	f00794e3          	bnez	a5,aacc <_fclose_r+0x44>
    abc8:	06442783          	lw	a5,100(s0)
    abcc:	0017f793          	and	a5,a5,1
    abd0:	fa0790e3          	bnez	a5,ab70 <_fclose_r+0xe8>
    abd4:	05842503          	lw	a0,88(s0)
    abd8:	00000913          	li	s2,0
    abdc:	a10f60ef          	jal	dec <__retarget_lock_release_recursive>
    abe0:	00812403          	lw	s0,8(sp)
    abe4:	00412483          	lw	s1,4(sp)
    abe8:	f95ff06f          	j	ab7c <_fclose_r+0xf4>
    abec:	05842503          	lw	a0,88(s0)
    abf0:	9fcf60ef          	jal	dec <__retarget_lock_release_recursive>
    abf4:	f51ff06f          	j	ab44 <_fclose_r+0xbc>

0000abf8 <__smakebuf_r>:
    abf8:	00c59783          	lh	a5,12(a1)
    abfc:	f8010113          	add	sp,sp,-128
    ac00:	06812c23          	sw	s0,120(sp)
    ac04:	06112e23          	sw	ra,124(sp)
    ac08:	0027f713          	and	a4,a5,2
    ac0c:	00058413          	mv	s0,a1
    ac10:	02070463          	beqz	a4,ac38 <__smakebuf_r+0x40>
    ac14:	04358793          	add	a5,a1,67
    ac18:	00f5a023          	sw	a5,0(a1)
    ac1c:	00f5a823          	sw	a5,16(a1)
    ac20:	00100793          	li	a5,1
    ac24:	00f5aa23          	sw	a5,20(a1)
    ac28:	07c12083          	lw	ra,124(sp)
    ac2c:	07812403          	lw	s0,120(sp)
    ac30:	08010113          	add	sp,sp,128
    ac34:	00008067          	ret
    ac38:	00e59583          	lh	a1,14(a1)
    ac3c:	06912a23          	sw	s1,116(sp)
    ac40:	07212823          	sw	s2,112(sp)
    ac44:	07312623          	sw	s3,108(sp)
    ac48:	07412423          	sw	s4,104(sp)
    ac4c:	00050493          	mv	s1,a0
    ac50:	0805c663          	bltz	a1,acdc <__smakebuf_r+0xe4>
    ac54:	00810613          	add	a2,sp,8
    ac58:	138000ef          	jal	ad90 <_fstat_r>
    ac5c:	06054e63          	bltz	a0,acd8 <__smakebuf_r+0xe0>
    ac60:	00c12783          	lw	a5,12(sp)
    ac64:	0000f937          	lui	s2,0xf
    ac68:	000019b7          	lui	s3,0x1
    ac6c:	00f97933          	and	s2,s2,a5
    ac70:	ffffe7b7          	lui	a5,0xffffe
    ac74:	00f90933          	add	s2,s2,a5
    ac78:	00193913          	seqz	s2,s2
    ac7c:	40000a13          	li	s4,1024
    ac80:	80098993          	add	s3,s3,-2048 # 800 <main+0x530>
    ac84:	000a0593          	mv	a1,s4
    ac88:	00048513          	mv	a0,s1
    ac8c:	8c1f60ef          	jal	154c <_malloc_r>
    ac90:	00c41783          	lh	a5,12(s0)
    ac94:	06050863          	beqz	a0,ad04 <__smakebuf_r+0x10c>
    ac98:	0807e793          	or	a5,a5,128
    ac9c:	00a42023          	sw	a0,0(s0)
    aca0:	00a42823          	sw	a0,16(s0)
    aca4:	00f41623          	sh	a5,12(s0)
    aca8:	01442a23          	sw	s4,20(s0)
    acac:	0a091063          	bnez	s2,ad4c <__smakebuf_r+0x154>
    acb0:	0137e7b3          	or	a5,a5,s3
    acb4:	07c12083          	lw	ra,124(sp)
    acb8:	00f41623          	sh	a5,12(s0)
    acbc:	07812403          	lw	s0,120(sp)
    acc0:	07412483          	lw	s1,116(sp)
    acc4:	07012903          	lw	s2,112(sp)
    acc8:	06c12983          	lw	s3,108(sp)
    accc:	06812a03          	lw	s4,104(sp)
    acd0:	08010113          	add	sp,sp,128
    acd4:	00008067          	ret
    acd8:	00c41783          	lh	a5,12(s0)
    acdc:	0807f793          	and	a5,a5,128
    ace0:	00000913          	li	s2,0
    ace4:	04078e63          	beqz	a5,ad40 <__smakebuf_r+0x148>
    ace8:	04000a13          	li	s4,64
    acec:	000a0593          	mv	a1,s4
    acf0:	00048513          	mv	a0,s1
    acf4:	859f60ef          	jal	154c <_malloc_r>
    acf8:	00c41783          	lh	a5,12(s0)
    acfc:	00000993          	li	s3,0
    ad00:	f8051ce3          	bnez	a0,ac98 <__smakebuf_r+0xa0>
    ad04:	2007f713          	and	a4,a5,512
    ad08:	04071e63          	bnez	a4,ad64 <__smakebuf_r+0x16c>
    ad0c:	ffc7f793          	and	a5,a5,-4
    ad10:	0027e793          	or	a5,a5,2
    ad14:	04340713          	add	a4,s0,67
    ad18:	00f41623          	sh	a5,12(s0)
    ad1c:	00100793          	li	a5,1
    ad20:	07412483          	lw	s1,116(sp)
    ad24:	07012903          	lw	s2,112(sp)
    ad28:	06c12983          	lw	s3,108(sp)
    ad2c:	06812a03          	lw	s4,104(sp)
    ad30:	00e42023          	sw	a4,0(s0)
    ad34:	00e42823          	sw	a4,16(s0)
    ad38:	00f42a23          	sw	a5,20(s0)
    ad3c:	eedff06f          	j	ac28 <__smakebuf_r+0x30>
    ad40:	40000a13          	li	s4,1024
    ad44:	00000993          	li	s3,0
    ad48:	f3dff06f          	j	ac84 <__smakebuf_r+0x8c>
    ad4c:	00e41583          	lh	a1,14(s0)
    ad50:	00048513          	mv	a0,s1
    ad54:	09c000ef          	jal	adf0 <_isatty_r>
    ad58:	02051063          	bnez	a0,ad78 <__smakebuf_r+0x180>
    ad5c:	00c41783          	lh	a5,12(s0)
    ad60:	f51ff06f          	j	acb0 <__smakebuf_r+0xb8>
    ad64:	07412483          	lw	s1,116(sp)
    ad68:	07012903          	lw	s2,112(sp)
    ad6c:	06c12983          	lw	s3,108(sp)
    ad70:	06812a03          	lw	s4,104(sp)
    ad74:	eb5ff06f          	j	ac28 <__smakebuf_r+0x30>
    ad78:	00c45783          	lhu	a5,12(s0)
    ad7c:	ffc7f793          	and	a5,a5,-4
    ad80:	0017e793          	or	a5,a5,1
    ad84:	01079793          	sll	a5,a5,0x10
    ad88:	4107d793          	sra	a5,a5,0x10
    ad8c:	f25ff06f          	j	acb0 <__smakebuf_r+0xb8>

0000ad90 <_fstat_r>:
    ad90:	ff010113          	add	sp,sp,-16
    ad94:	00058713          	mv	a4,a1
    ad98:	00812423          	sw	s0,8(sp)
    ad9c:	00060593          	mv	a1,a2
    ada0:	00050413          	mv	s0,a0
    ada4:	00070513          	mv	a0,a4
    ada8:	7fff6797          	auipc	a5,0x7fff6
    adac:	9607a823          	sw	zero,-1680(a5) # 80000718 <errno>
    adb0:	00112623          	sw	ra,12(sp)
    adb4:	c15f50ef          	jal	9c8 <_fstat>
    adb8:	fff00793          	li	a5,-1
    adbc:	00f50a63          	beq	a0,a5,add0 <_fstat_r+0x40>
    adc0:	00c12083          	lw	ra,12(sp)
    adc4:	00812403          	lw	s0,8(sp)
    adc8:	01010113          	add	sp,sp,16
    adcc:	00008067          	ret
    add0:	7fff6797          	auipc	a5,0x7fff6
    add4:	9487a783          	lw	a5,-1720(a5) # 80000718 <errno>
    add8:	fe0784e3          	beqz	a5,adc0 <_fstat_r+0x30>
    addc:	00c12083          	lw	ra,12(sp)
    ade0:	00f42023          	sw	a5,0(s0)
    ade4:	00812403          	lw	s0,8(sp)
    ade8:	01010113          	add	sp,sp,16
    adec:	00008067          	ret

0000adf0 <_isatty_r>:
    adf0:	ff010113          	add	sp,sp,-16
    adf4:	00812423          	sw	s0,8(sp)
    adf8:	00050413          	mv	s0,a0
    adfc:	00058513          	mv	a0,a1
    ae00:	7fff6797          	auipc	a5,0x7fff6
    ae04:	9007ac23          	sw	zero,-1768(a5) # 80000718 <errno>
    ae08:	00112623          	sw	ra,12(sp)
    ae0c:	bd5f50ef          	jal	9e0 <_isatty>
    ae10:	fff00793          	li	a5,-1
    ae14:	00f50a63          	beq	a0,a5,ae28 <_isatty_r+0x38>
    ae18:	00c12083          	lw	ra,12(sp)
    ae1c:	00812403          	lw	s0,8(sp)
    ae20:	01010113          	add	sp,sp,16
    ae24:	00008067          	ret
    ae28:	7fff6797          	auipc	a5,0x7fff6
    ae2c:	8f07a783          	lw	a5,-1808(a5) # 80000718 <errno>
    ae30:	fe0784e3          	beqz	a5,ae18 <_isatty_r+0x28>
    ae34:	00c12083          	lw	ra,12(sp)
    ae38:	00f42023          	sw	a5,0(s0)
    ae3c:	00812403          	lw	s0,8(sp)
    ae40:	01010113          	add	sp,sp,16
    ae44:	00008067          	ret

0000ae48 <__errno>:
    ae48:	7fff6517          	auipc	a0,0x7fff6
    ae4c:	8c052503          	lw	a0,-1856(a0) # 80000708 <_impure_ptr>
    ae50:	00008067          	ret

0000ae54 <__assert_func>:
    ae54:	ff010113          	add	sp,sp,-16
    ae58:	00068793          	mv	a5,a3
    ae5c:	7fff6717          	auipc	a4,0x7fff6
    ae60:	8ac72703          	lw	a4,-1876(a4) # 80000708 <_impure_ptr>
    ae64:	00060813          	mv	a6,a2
    ae68:	00112623          	sw	ra,12(sp)
    ae6c:	00c72883          	lw	a7,12(a4)
    ae70:	00078613          	mv	a2,a5
    ae74:	00050693          	mv	a3,a0
    ae78:	00058713          	mv	a4,a1
    ae7c:	00004797          	auipc	a5,0x4
    ae80:	25c78793          	add	a5,a5,604 # f0d8 <__fini_array_end+0x344>
    ae84:	00080c63          	beqz	a6,ae9c <__assert_func+0x48>
    ae88:	00004597          	auipc	a1,0x4
    ae8c:	26058593          	add	a1,a1,608 # f0e8 <__fini_array_end+0x354>
    ae90:	00088513          	mv	a0,a7
    ae94:	3a8000ef          	jal	b23c <fiprintf>
    ae98:	3f0000ef          	jal	b288 <abort>
    ae9c:	00004797          	auipc	a5,0x4
    aea0:	f5c78793          	add	a5,a5,-164 # edf8 <__fini_array_end+0x64>
    aea4:	00078813          	mv	a6,a5
    aea8:	fe1ff06f          	j	ae88 <__assert_func+0x34>

0000aeac <_calloc_r>:
    aeac:	fe010113          	add	sp,sp,-32
    aeb0:	00812c23          	sw	s0,24(sp)
    aeb4:	00112e23          	sw	ra,28(sp)
    aeb8:	0105d693          	srl	a3,a1,0x10
    aebc:	00058793          	mv	a5,a1
    aec0:	00050413          	mv	s0,a0
    aec4:	01065713          	srl	a4,a2,0x10
    aec8:	0c069063          	bnez	a3,af88 <_calloc_r+0xdc>
    aecc:	14071a63          	bnez	a4,b020 <_calloc_r+0x174>
    aed0:	01061593          	sll	a1,a2,0x10
    aed4:	01079513          	sll	a0,a5,0x10
    aed8:	0105d593          	srl	a1,a1,0x10
    aedc:	01055513          	srl	a0,a0,0x10
    aee0:	4bd030ef          	jal	eb9c <__mulsi3>
    aee4:	00050593          	mv	a1,a0
    aee8:	00040513          	mv	a0,s0
    aeec:	e60f60ef          	jal	154c <_malloc_r>
    aef0:	00050413          	mv	s0,a0
    aef4:	10050a63          	beqz	a0,b008 <_calloc_r+0x15c>
    aef8:	ffc52603          	lw	a2,-4(a0)
    aefc:	02400713          	li	a4,36
    af00:	ffc67613          	and	a2,a2,-4
    af04:	ffc60613          	add	a2,a2,-4
    af08:	04c76863          	bltu	a4,a2,af58 <_calloc_r+0xac>
    af0c:	01300693          	li	a3,19
    af10:	00050793          	mv	a5,a0
    af14:	02c6f263          	bgeu	a3,a2,af38 <_calloc_r+0x8c>
    af18:	00052023          	sw	zero,0(a0)
    af1c:	00052223          	sw	zero,4(a0)
    af20:	01b00793          	li	a5,27
    af24:	04c7f863          	bgeu	a5,a2,af74 <_calloc_r+0xc8>
    af28:	00052423          	sw	zero,8(a0)
    af2c:	00052623          	sw	zero,12(a0)
    af30:	01050793          	add	a5,a0,16
    af34:	10e60263          	beq	a2,a4,b038 <_calloc_r+0x18c>
    af38:	0007a023          	sw	zero,0(a5)
    af3c:	0007a223          	sw	zero,4(a5)
    af40:	0007a423          	sw	zero,8(a5)
    af44:	01c12083          	lw	ra,28(sp)
    af48:	00040513          	mv	a0,s0
    af4c:	01812403          	lw	s0,24(sp)
    af50:	02010113          	add	sp,sp,32
    af54:	00008067          	ret
    af58:	00000593          	li	a1,0
    af5c:	e95f50ef          	jal	df0 <memset>
    af60:	01c12083          	lw	ra,28(sp)
    af64:	00040513          	mv	a0,s0
    af68:	01812403          	lw	s0,24(sp)
    af6c:	02010113          	add	sp,sp,32
    af70:	00008067          	ret
    af74:	00850793          	add	a5,a0,8
    af78:	0007a023          	sw	zero,0(a5)
    af7c:	0007a223          	sw	zero,4(a5)
    af80:	0007a423          	sw	zero,8(a5)
    af84:	fc1ff06f          	j	af44 <_calloc_r+0x98>
    af88:	0c071663          	bnez	a4,b054 <_calloc_r+0x1a8>
    af8c:	01212823          	sw	s2,16(sp)
    af90:	01312623          	sw	s3,12(sp)
    af94:	00912a23          	sw	s1,20(sp)
    af98:	00068913          	mv	s2,a3
    af9c:	00060993          	mv	s3,a2
    afa0:	01079513          	sll	a0,a5,0x10
    afa4:	01061593          	sll	a1,a2,0x10
    afa8:	0105d593          	srl	a1,a1,0x10
    afac:	01055513          	srl	a0,a0,0x10
    afb0:	3ed030ef          	jal	eb9c <__mulsi3>
    afb4:	00050493          	mv	s1,a0
    afb8:	01091593          	sll	a1,s2,0x10
    afbc:	01099513          	sll	a0,s3,0x10
    afc0:	0105d593          	srl	a1,a1,0x10
    afc4:	01055513          	srl	a0,a0,0x10
    afc8:	3d5030ef          	jal	eb9c <__mulsi3>
    afcc:	0104d793          	srl	a5,s1,0x10
    afd0:	00f505b3          	add	a1,a0,a5
    afd4:	0105d793          	srl	a5,a1,0x10
    afd8:	06079863          	bnez	a5,b048 <_calloc_r+0x19c>
    afdc:	01049493          	sll	s1,s1,0x10
    afe0:	0104d493          	srl	s1,s1,0x10
    afe4:	01059593          	sll	a1,a1,0x10
    afe8:	0095e5b3          	or	a1,a1,s1
    afec:	00040513          	mv	a0,s0
    aff0:	01412483          	lw	s1,20(sp)
    aff4:	01012903          	lw	s2,16(sp)
    aff8:	00c12983          	lw	s3,12(sp)
    affc:	d50f60ef          	jal	154c <_malloc_r>
    b000:	00050413          	mv	s0,a0
    b004:	ee051ae3          	bnez	a0,aef8 <_calloc_r+0x4c>
    b008:	00000413          	li	s0,0
    b00c:	01c12083          	lw	ra,28(sp)
    b010:	00040513          	mv	a0,s0
    b014:	01812403          	lw	s0,24(sp)
    b018:	02010113          	add	sp,sp,32
    b01c:	00008067          	ret
    b020:	01212823          	sw	s2,16(sp)
    b024:	01312623          	sw	s3,12(sp)
    b028:	00912a23          	sw	s1,20(sp)
    b02c:	00070913          	mv	s2,a4
    b030:	00058993          	mv	s3,a1
    b034:	f6dff06f          	j	afa0 <_calloc_r+0xf4>
    b038:	00052823          	sw	zero,16(a0)
    b03c:	01850793          	add	a5,a0,24
    b040:	00052a23          	sw	zero,20(a0)
    b044:	ef5ff06f          	j	af38 <_calloc_r+0x8c>
    b048:	01412483          	lw	s1,20(sp)
    b04c:	01012903          	lw	s2,16(sp)
    b050:	00c12983          	lw	s3,12(sp)
    b054:	df5ff0ef          	jal	ae48 <__errno>
    b058:	00c00793          	li	a5,12
    b05c:	00f52023          	sw	a5,0(a0)
    b060:	00000413          	li	s0,0
    b064:	fa9ff06f          	j	b00c <_calloc_r+0x160>

0000b068 <_wcsnrtombs_l>:
    b068:	fa010113          	add	sp,sp,-96
    b06c:	04912a23          	sw	s1,84(sp)
    b070:	05212823          	sw	s2,80(sp)
    b074:	05312623          	sw	s3,76(sp)
    b078:	05412423          	sw	s4,72(sp)
    b07c:	05512223          	sw	s5,68(sp)
    b080:	04112e23          	sw	ra,92(sp)
    b084:	03912a23          	sw	s9,52(sp)
    b088:	03a12823          	sw	s10,48(sp)
    b08c:	00a12623          	sw	a0,12(sp)
    b090:	00058a13          	mv	s4,a1
    b094:	00060a93          	mv	s5,a2
    b098:	00070913          	mv	s2,a4
    b09c:	00080993          	mv	s3,a6
    b0a0:	00078493          	mv	s1,a5
    b0a4:	12078063          	beqz	a5,b1c4 <_wcsnrtombs_l+0x15c>
    b0a8:	000aac83          	lw	s9,0(s5)
    b0ac:	120a0263          	beqz	s4,b1d0 <_wcsnrtombs_l+0x168>
    b0b0:	14090e63          	beqz	s2,b20c <_wcsnrtombs_l+0x1a4>
    b0b4:	05612023          	sw	s6,64(sp)
    b0b8:	fff68b13          	add	s6,a3,-1
    b0bc:	16068063          	beqz	a3,b21c <_wcsnrtombs_l+0x1b4>
    b0c0:	04812c23          	sw	s0,88(sp)
    b0c4:	03b12623          	sw	s11,44(sp)
    b0c8:	03712e23          	sw	s7,60(sp)
    b0cc:	03812c23          	sw	s8,56(sp)
    b0d0:	000a0413          	mv	s0,s4
    b0d4:	00000d13          	li	s10,0
    b0d8:	fff00d93          	li	s11,-1
    b0dc:	0240006f          	j	b100 <_wcsnrtombs_l+0x98>
    b0e0:	080a1a63          	bnez	s4,b174 <_wcsnrtombs_l+0x10c>
    b0e4:	000ca783          	lw	a5,0(s9)
    b0e8:	004c8c93          	add	s9,s9,4
    b0ec:	0c078263          	beqz	a5,b1b0 <_wcsnrtombs_l+0x148>
    b0f0:	1326f263          	bgeu	a3,s2,b214 <_wcsnrtombs_l+0x1ac>
    b0f4:	fffb0b13          	add	s6,s6,-1
    b0f8:	00068d13          	mv	s10,a3
    b0fc:	03bb0c63          	beq	s6,s11,b134 <_wcsnrtombs_l+0xcc>
    b100:	0e09a783          	lw	a5,224(s3)
    b104:	000ca603          	lw	a2,0(s9)
    b108:	00c12503          	lw	a0,12(sp)
    b10c:	00048693          	mv	a3,s1
    b110:	01410593          	add	a1,sp,20
    b114:	0004ac03          	lw	s8,0(s1)
    b118:	0044ab83          	lw	s7,4(s1)
    b11c:	000780e7          	jalr	a5
    b120:	0bb50e63          	beq	a0,s11,b1dc <_wcsnrtombs_l+0x174>
    b124:	01a506b3          	add	a3,a0,s10
    b128:	fad97ce3          	bgeu	s2,a3,b0e0 <_wcsnrtombs_l+0x78>
    b12c:	0184a023          	sw	s8,0(s1)
    b130:	0174a223          	sw	s7,4(s1)
    b134:	05812403          	lw	s0,88(sp)
    b138:	04012b03          	lw	s6,64(sp)
    b13c:	03c12b83          	lw	s7,60(sp)
    b140:	03812c03          	lw	s8,56(sp)
    b144:	02c12d83          	lw	s11,44(sp)
    b148:	05c12083          	lw	ra,92(sp)
    b14c:	05412483          	lw	s1,84(sp)
    b150:	05012903          	lw	s2,80(sp)
    b154:	04c12983          	lw	s3,76(sp)
    b158:	04812a03          	lw	s4,72(sp)
    b15c:	04412a83          	lw	s5,68(sp)
    b160:	03412c83          	lw	s9,52(sp)
    b164:	000d0513          	mv	a0,s10
    b168:	03012d03          	lw	s10,48(sp)
    b16c:	06010113          	add	sp,sp,96
    b170:	00008067          	ret
    b174:	08a05063          	blez	a0,b1f4 <_wcsnrtombs_l+0x18c>
    b178:	01410893          	add	a7,sp,20
    b17c:	00a40533          	add	a0,s0,a0
    b180:	0008c783          	lbu	a5,0(a7)
    b184:	00140413          	add	s0,s0,1
    b188:	00188893          	add	a7,a7,1
    b18c:	fef40fa3          	sb	a5,-1(s0)
    b190:	fe8518e3          	bne	a0,s0,b180 <_wcsnrtombs_l+0x118>
    b194:	000aa783          	lw	a5,0(s5)
    b198:	00050413          	mv	s0,a0
    b19c:	00478793          	add	a5,a5,4
    b1a0:	00faa023          	sw	a5,0(s5)
    b1a4:	000ca783          	lw	a5,0(s9)
    b1a8:	004c8c93          	add	s9,s9,4
    b1ac:	f40792e3          	bnez	a5,b0f0 <_wcsnrtombs_l+0x88>
    b1b0:	000a0463          	beqz	s4,b1b8 <_wcsnrtombs_l+0x150>
    b1b4:	000aa023          	sw	zero,0(s5)
    b1b8:	0004a023          	sw	zero,0(s1)
    b1bc:	fff68d13          	add	s10,a3,-1
    b1c0:	f75ff06f          	j	b134 <_wcsnrtombs_l+0xcc>
    b1c4:	000aac83          	lw	s9,0(s5)
    b1c8:	10c50493          	add	s1,a0,268
    b1cc:	ee0a12e3          	bnez	s4,b0b0 <_wcsnrtombs_l+0x48>
    b1d0:	05612023          	sw	s6,64(sp)
    b1d4:	fff00913          	li	s2,-1
    b1d8:	ee1ff06f          	j	b0b8 <_wcsnrtombs_l+0x50>
    b1dc:	00c12703          	lw	a4,12(sp)
    b1e0:	08a00793          	li	a5,138
    b1e4:	fff00d13          	li	s10,-1
    b1e8:	00f72023          	sw	a5,0(a4)
    b1ec:	0004a023          	sw	zero,0(s1)
    b1f0:	f45ff06f          	j	b134 <_wcsnrtombs_l+0xcc>
    b1f4:	000aa783          	lw	a5,0(s5)
    b1f8:	00040513          	mv	a0,s0
    b1fc:	00050413          	mv	s0,a0
    b200:	00478793          	add	a5,a5,4
    b204:	00faa023          	sw	a5,0(s5)
    b208:	f9dff06f          	j	b1a4 <_wcsnrtombs_l+0x13c>
    b20c:	00000d13          	li	s10,0
    b210:	f39ff06f          	j	b148 <_wcsnrtombs_l+0xe0>
    b214:	00068d13          	mv	s10,a3
    b218:	f1dff06f          	j	b134 <_wcsnrtombs_l+0xcc>
    b21c:	04012b03          	lw	s6,64(sp)
    b220:	00000d13          	li	s10,0
    b224:	f25ff06f          	j	b148 <_wcsnrtombs_l+0xe0>

0000b228 <_wcsnrtombs_r>:
    b228:	7fff5817          	auipc	a6,0x7fff5
    b22c:	30c80813          	add	a6,a6,780 # 80000534 <__global_locale>
    b230:	7fff5517          	auipc	a0,0x7fff5
    b234:	4d852503          	lw	a0,1240(a0) # 80000708 <_impure_ptr>
    b238:	e31ff06f          	j	b068 <_wcsnrtombs_l>

0000b23c <fiprintf>:
    b23c:	fc010113          	add	sp,sp,-64
    b240:	02810313          	add	t1,sp,40
    b244:	02c12423          	sw	a2,40(sp)
    b248:	02d12623          	sw	a3,44(sp)
    b24c:	00058613          	mv	a2,a1
    b250:	00030693          	mv	a3,t1
    b254:	00050593          	mv	a1,a0
    b258:	7fff5517          	auipc	a0,0x7fff5
    b25c:	4b052503          	lw	a0,1200(a0) # 80000708 <_impure_ptr>
    b260:	00112e23          	sw	ra,28(sp)
    b264:	02e12823          	sw	a4,48(sp)
    b268:	02f12a23          	sw	a5,52(sp)
    b26c:	03012c23          	sw	a6,56(sp)
    b270:	03112e23          	sw	a7,60(sp)
    b274:	00612623          	sw	t1,12(sp)
    b278:	9a1f90ef          	jal	4c18 <_vfiprintf_r>
    b27c:	01c12083          	lw	ra,28(sp)
    b280:	04010113          	add	sp,sp,64
    b284:	00008067          	ret

0000b288 <abort>:
    b288:	ff010113          	add	sp,sp,-16
    b28c:	00600513          	li	a0,6
    b290:	00112623          	sw	ra,12(sp)
    b294:	00c000ef          	jal	b2a0 <raise>
    b298:	00100513          	li	a0,1
    b29c:	f14f50ef          	jal	9b0 <_exit>

0000b2a0 <raise>:
    b2a0:	ff010113          	add	sp,sp,-16
    b2a4:	00912223          	sw	s1,4(sp)
    b2a8:	00112623          	sw	ra,12(sp)
    b2ac:	01f00793          	li	a5,31
    b2b0:	7fff5497          	auipc	s1,0x7fff5
    b2b4:	4584a483          	lw	s1,1112(s1) # 80000708 <_impure_ptr>
    b2b8:	08a7ee63          	bltu	a5,a0,b354 <raise+0xb4>
    b2bc:	1184a783          	lw	a5,280(s1)
    b2c0:	00812423          	sw	s0,8(sp)
    b2c4:	00050413          	mv	s0,a0
    b2c8:	04078263          	beqz	a5,b30c <raise+0x6c>
    b2cc:	00251713          	sll	a4,a0,0x2
    b2d0:	00e787b3          	add	a5,a5,a4
    b2d4:	0007a703          	lw	a4,0(a5)
    b2d8:	02070a63          	beqz	a4,b30c <raise+0x6c>
    b2dc:	00100693          	li	a3,1
    b2e0:	00d70a63          	beq	a4,a3,b2f4 <raise+0x54>
    b2e4:	fff00693          	li	a3,-1
    b2e8:	04d70663          	beq	a4,a3,b334 <raise+0x94>
    b2ec:	0007a023          	sw	zero,0(a5)
    b2f0:	000700e7          	jalr	a4
    b2f4:	00812403          	lw	s0,8(sp)
    b2f8:	00000513          	li	a0,0
    b2fc:	00c12083          	lw	ra,12(sp)
    b300:	00412483          	lw	s1,4(sp)
    b304:	01010113          	add	sp,sp,16
    b308:	00008067          	ret
    b30c:	00048513          	mv	a0,s1
    b310:	0b4000ef          	jal	b3c4 <_getpid_r>
    b314:	00040613          	mv	a2,s0
    b318:	00812403          	lw	s0,8(sp)
    b31c:	00c12083          	lw	ra,12(sp)
    b320:	00050593          	mv	a1,a0
    b324:	00048513          	mv	a0,s1
    b328:	00412483          	lw	s1,4(sp)
    b32c:	01010113          	add	sp,sp,16
    b330:	0340006f          	j	b364 <_kill_r>
    b334:	00812403          	lw	s0,8(sp)
    b338:	00c12083          	lw	ra,12(sp)
    b33c:	01600793          	li	a5,22
    b340:	00f4a023          	sw	a5,0(s1)
    b344:	00100513          	li	a0,1
    b348:	00412483          	lw	s1,4(sp)
    b34c:	01010113          	add	sp,sp,16
    b350:	00008067          	ret
    b354:	01600793          	li	a5,22
    b358:	00f4a023          	sw	a5,0(s1)
    b35c:	fff00513          	li	a0,-1
    b360:	f9dff06f          	j	b2fc <raise+0x5c>

0000b364 <_kill_r>:
    b364:	ff010113          	add	sp,sp,-16
    b368:	00058713          	mv	a4,a1
    b36c:	00812423          	sw	s0,8(sp)
    b370:	00060593          	mv	a1,a2
    b374:	00050413          	mv	s0,a0
    b378:	00070513          	mv	a0,a4
    b37c:	7fff5797          	auipc	a5,0x7fff5
    b380:	3807ae23          	sw	zero,924(a5) # 80000718 <errno>
    b384:	00112623          	sw	ra,12(sp)
    b388:	e60f50ef          	jal	9e8 <_kill>
    b38c:	fff00793          	li	a5,-1
    b390:	00f50a63          	beq	a0,a5,b3a4 <_kill_r+0x40>
    b394:	00c12083          	lw	ra,12(sp)
    b398:	00812403          	lw	s0,8(sp)
    b39c:	01010113          	add	sp,sp,16
    b3a0:	00008067          	ret
    b3a4:	7fff5797          	auipc	a5,0x7fff5
    b3a8:	3747a783          	lw	a5,884(a5) # 80000718 <errno>
    b3ac:	fe0784e3          	beqz	a5,b394 <_kill_r+0x30>
    b3b0:	00c12083          	lw	ra,12(sp)
    b3b4:	00f42023          	sw	a5,0(s0)
    b3b8:	00812403          	lw	s0,8(sp)
    b3bc:	01010113          	add	sp,sp,16
    b3c0:	00008067          	ret

0000b3c4 <_getpid_r>:
    b3c4:	e14f506f          	j	9d8 <_getpid>

0000b3c8 <__udivdi3>:
    b3c8:	fd010113          	add	sp,sp,-48
    b3cc:	01312e23          	sw	s3,28(sp)
    b3d0:	02112623          	sw	ra,44(sp)
    b3d4:	01612823          	sw	s6,16(sp)
    b3d8:	00050993          	mv	s3,a0
    b3dc:	16069663          	bnez	a3,b548 <__udivdi3+0x180>
    b3e0:	02812423          	sw	s0,40(sp)
    b3e4:	01512a23          	sw	s5,20(sp)
    b3e8:	02912223          	sw	s1,36(sp)
    b3ec:	03212023          	sw	s2,32(sp)
    b3f0:	01412c23          	sw	s4,24(sp)
    b3f4:	00060a93          	mv	s5,a2
    b3f8:	00050413          	mv	s0,a0
    b3fc:	1cc5f063          	bgeu	a1,a2,b5bc <__udivdi3+0x1f4>
    b400:	000107b7          	lui	a5,0x10
    b404:	00058493          	mv	s1,a1
    b408:	2af66e63          	bltu	a2,a5,b6c4 <__udivdi3+0x2fc>
    b40c:	010007b7          	lui	a5,0x1000
    b410:	01800713          	li	a4,24
    b414:	00f67463          	bgeu	a2,a5,b41c <__udivdi3+0x54>
    b418:	01000713          	li	a4,16
    b41c:	00e656b3          	srl	a3,a2,a4
    b420:	00004797          	auipc	a5,0x4
    b424:	2e878793          	add	a5,a5,744 # f708 <__clz_tab>
    b428:	00d787b3          	add	a5,a5,a3
    b42c:	0007c783          	lbu	a5,0(a5)
    b430:	02000693          	li	a3,32
    b434:	00e787b3          	add	a5,a5,a4
    b438:	40f68733          	sub	a4,a3,a5
    b43c:	00f68c63          	beq	a3,a5,b454 <__udivdi3+0x8c>
    b440:	00e594b3          	sll	s1,a1,a4
    b444:	00f9d7b3          	srl	a5,s3,a5
    b448:	00e61ab3          	sll	s5,a2,a4
    b44c:	0097e4b3          	or	s1,a5,s1
    b450:	00e99433          	sll	s0,s3,a4
    b454:	010ada13          	srl	s4,s5,0x10
    b458:	000a0593          	mv	a1,s4
    b45c:	00048513          	mv	a0,s1
    b460:	010a9b13          	sll	s6,s5,0x10
    b464:	7fc030ef          	jal	ec60 <__hidden___udivsi3>
    b468:	010b5b13          	srl	s6,s6,0x10
    b46c:	00050593          	mv	a1,a0
    b470:	00050913          	mv	s2,a0
    b474:	000b0513          	mv	a0,s6
    b478:	724030ef          	jal	eb9c <__mulsi3>
    b47c:	00050793          	mv	a5,a0
    b480:	000a0593          	mv	a1,s4
    b484:	00048513          	mv	a0,s1
    b488:	00078493          	mv	s1,a5
    b48c:	01d030ef          	jal	eca8 <__umodsi3>
    b490:	01051513          	sll	a0,a0,0x10
    b494:	01045793          	srl	a5,s0,0x10
    b498:	00a7e7b3          	or	a5,a5,a0
    b49c:	0097fc63          	bgeu	a5,s1,b4b4 <__udivdi3+0xec>
    b4a0:	00fa87b3          	add	a5,s5,a5
    b4a4:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0x26b>
    b4a8:	0157e463          	bltu	a5,s5,b4b0 <__udivdi3+0xe8>
    b4ac:	5a97e863          	bltu	a5,s1,ba5c <__udivdi3+0x694>
    b4b0:	00070913          	mv	s2,a4
    b4b4:	409784b3          	sub	s1,a5,s1
    b4b8:	000a0593          	mv	a1,s4
    b4bc:	00048513          	mv	a0,s1
    b4c0:	7a0030ef          	jal	ec60 <__hidden___udivsi3>
    b4c4:	00050593          	mv	a1,a0
    b4c8:	00050993          	mv	s3,a0
    b4cc:	000b0513          	mv	a0,s6
    b4d0:	6cc030ef          	jal	eb9c <__mulsi3>
    b4d4:	00050793          	mv	a5,a0
    b4d8:	000a0593          	mv	a1,s4
    b4dc:	00048513          	mv	a0,s1
    b4e0:	01041413          	sll	s0,s0,0x10
    b4e4:	00078493          	mv	s1,a5
    b4e8:	7c0030ef          	jal	eca8 <__umodsi3>
    b4ec:	01051513          	sll	a0,a0,0x10
    b4f0:	01045413          	srl	s0,s0,0x10
    b4f4:	00a46433          	or	s0,s0,a0
    b4f8:	00947c63          	bgeu	s0,s1,b510 <__udivdi3+0x148>
    b4fc:	008a8433          	add	s0,s5,s0
    b500:	fff98793          	add	a5,s3,-1
    b504:	4d546e63          	bltu	s0,s5,b9e0 <__udivdi3+0x618>
    b508:	ffe98993          	add	s3,s3,-2
    b50c:	4c947a63          	bgeu	s0,s1,b9e0 <__udivdi3+0x618>
    b510:	01091613          	sll	a2,s2,0x10
    b514:	01366533          	or	a0,a2,s3
    b518:	00000b13          	li	s6,0
    b51c:	02812403          	lw	s0,40(sp)
    b520:	02c12083          	lw	ra,44(sp)
    b524:	02412483          	lw	s1,36(sp)
    b528:	02012903          	lw	s2,32(sp)
    b52c:	01812a03          	lw	s4,24(sp)
    b530:	01412a83          	lw	s5,20(sp)
    b534:	01c12983          	lw	s3,28(sp)
    b538:	000b0593          	mv	a1,s6
    b53c:	01012b03          	lw	s6,16(sp)
    b540:	03010113          	add	sp,sp,48
    b544:	00008067          	ret
    b548:	02d5f263          	bgeu	a1,a3,b56c <__udivdi3+0x1a4>
    b54c:	00000b13          	li	s6,0
    b550:	00000513          	li	a0,0
    b554:	02c12083          	lw	ra,44(sp)
    b558:	01c12983          	lw	s3,28(sp)
    b55c:	000b0593          	mv	a1,s6
    b560:	01012b03          	lw	s6,16(sp)
    b564:	03010113          	add	sp,sp,48
    b568:	00008067          	ret
    b56c:	000107b7          	lui	a5,0x10
    b570:	26f6ee63          	bltu	a3,a5,b7ec <__udivdi3+0x424>
    b574:	01000737          	lui	a4,0x1000
    b578:	01800793          	li	a5,24
    b57c:	00e6f463          	bgeu	a3,a4,b584 <__udivdi3+0x1bc>
    b580:	01000793          	li	a5,16
    b584:	00f6d533          	srl	a0,a3,a5
    b588:	00004717          	auipc	a4,0x4
    b58c:	18070713          	add	a4,a4,384 # f708 <__clz_tab>
    b590:	00a70733          	add	a4,a4,a0
    b594:	00074703          	lbu	a4,0(a4)
    b598:	02000513          	li	a0,32
    b59c:	00f70733          	add	a4,a4,a5
    b5a0:	40e50b33          	sub	s6,a0,a4
    b5a4:	26e51c63          	bne	a0,a4,b81c <__udivdi3+0x454>
    b5a8:	46b6ee63          	bltu	a3,a1,ba24 <__udivdi3+0x65c>
    b5ac:	00c9b533          	sltu	a0,s3,a2
    b5b0:	00153513          	seqz	a0,a0
    b5b4:	00000b13          	li	s6,0
    b5b8:	f9dff06f          	j	b554 <__udivdi3+0x18c>
    b5bc:	10060c63          	beqz	a2,b6d4 <__udivdi3+0x30c>
    b5c0:	000107b7          	lui	a5,0x10
    b5c4:	44f67663          	bgeu	a2,a5,ba10 <__udivdi3+0x648>
    b5c8:	10063713          	sltiu	a4,a2,256
    b5cc:	00173713          	seqz	a4,a4
    b5d0:	00371713          	sll	a4,a4,0x3
    b5d4:	00e656b3          	srl	a3,a2,a4
    b5d8:	00004797          	auipc	a5,0x4
    b5dc:	13078793          	add	a5,a5,304 # f708 <__clz_tab>
    b5e0:	00d787b3          	add	a5,a5,a3
    b5e4:	0007c483          	lbu	s1,0(a5)
    b5e8:	02000793          	li	a5,32
    b5ec:	00e484b3          	add	s1,s1,a4
    b5f0:	40978733          	sub	a4,a5,s1
    b5f4:	10979463          	bne	a5,s1,b6fc <__udivdi3+0x334>
    b5f8:	01061a13          	sll	s4,a2,0x10
    b5fc:	40c584b3          	sub	s1,a1,a2
    b600:	01065913          	srl	s2,a2,0x10
    b604:	010a5a13          	srl	s4,s4,0x10
    b608:	00100b13          	li	s6,1
    b60c:	00090593          	mv	a1,s2
    b610:	00048513          	mv	a0,s1
    b614:	64c030ef          	jal	ec60 <__hidden___udivsi3>
    b618:	000a0593          	mv	a1,s4
    b61c:	00050993          	mv	s3,a0
    b620:	57c030ef          	jal	eb9c <__mulsi3>
    b624:	00050793          	mv	a5,a0
    b628:	00090593          	mv	a1,s2
    b62c:	00048513          	mv	a0,s1
    b630:	00078493          	mv	s1,a5
    b634:	674030ef          	jal	eca8 <__umodsi3>
    b638:	01051513          	sll	a0,a0,0x10
    b63c:	01045793          	srl	a5,s0,0x10
    b640:	00a7e7b3          	or	a5,a5,a0
    b644:	0097fc63          	bgeu	a5,s1,b65c <__udivdi3+0x294>
    b648:	00fa87b3          	add	a5,s5,a5
    b64c:	fff98713          	add	a4,s3,-1
    b650:	0157e463          	bltu	a5,s5,b658 <__udivdi3+0x290>
    b654:	3e97ee63          	bltu	a5,s1,ba50 <__udivdi3+0x688>
    b658:	00070993          	mv	s3,a4
    b65c:	409784b3          	sub	s1,a5,s1
    b660:	00090593          	mv	a1,s2
    b664:	00048513          	mv	a0,s1
    b668:	5f8030ef          	jal	ec60 <__hidden___udivsi3>
    b66c:	000a0593          	mv	a1,s4
    b670:	00050a13          	mv	s4,a0
    b674:	528030ef          	jal	eb9c <__mulsi3>
    b678:	00050793          	mv	a5,a0
    b67c:	00090593          	mv	a1,s2
    b680:	00048513          	mv	a0,s1
    b684:	01041413          	sll	s0,s0,0x10
    b688:	00078493          	mv	s1,a5
    b68c:	61c030ef          	jal	eca8 <__umodsi3>
    b690:	01051513          	sll	a0,a0,0x10
    b694:	01045413          	srl	s0,s0,0x10
    b698:	00a46433          	or	s0,s0,a0
    b69c:	00947e63          	bgeu	s0,s1,b6b8 <__udivdi3+0x2f0>
    b6a0:	008a8433          	add	s0,s5,s0
    b6a4:	fffa0793          	add	a5,s4,-1
    b6a8:	01546663          	bltu	s0,s5,b6b4 <__udivdi3+0x2ec>
    b6ac:	ffea0a13          	add	s4,s4,-2
    b6b0:	00946463          	bltu	s0,s1,b6b8 <__udivdi3+0x2f0>
    b6b4:	00078a13          	mv	s4,a5
    b6b8:	01099613          	sll	a2,s3,0x10
    b6bc:	01466533          	or	a0,a2,s4
    b6c0:	e5dff06f          	j	b51c <__udivdi3+0x154>
    b6c4:	10063713          	sltiu	a4,a2,256
    b6c8:	00173713          	seqz	a4,a4
    b6cc:	00371713          	sll	a4,a4,0x3
    b6d0:	d4dff06f          	j	b41c <__udivdi3+0x54>
    b6d4:	00000693          	li	a3,0
    b6d8:	00004797          	auipc	a5,0x4
    b6dc:	03078793          	add	a5,a5,48 # f708 <__clz_tab>
    b6e0:	00d787b3          	add	a5,a5,a3
    b6e4:	0007c483          	lbu	s1,0(a5)
    b6e8:	00000713          	li	a4,0
    b6ec:	02000793          	li	a5,32
    b6f0:	00e484b3          	add	s1,s1,a4
    b6f4:	40978733          	sub	a4,a5,s1
    b6f8:	f09780e3          	beq	a5,s1,b5f8 <__udivdi3+0x230>
    b6fc:	00e61ab3          	sll	s5,a2,a4
    b700:	01712623          	sw	s7,12(sp)
    b704:	010ad913          	srl	s2,s5,0x10
    b708:	0095dbb3          	srl	s7,a1,s1
    b70c:	00e597b3          	sll	a5,a1,a4
    b710:	0099d4b3          	srl	s1,s3,s1
    b714:	00090593          	mv	a1,s2
    b718:	000b8513          	mv	a0,s7
    b71c:	010a9a13          	sll	s4,s5,0x10
    b720:	00f4e4b3          	or	s1,s1,a5
    b724:	00e99433          	sll	s0,s3,a4
    b728:	010a5a13          	srl	s4,s4,0x10
    b72c:	534030ef          	jal	ec60 <__hidden___udivsi3>
    b730:	00050593          	mv	a1,a0
    b734:	00050b13          	mv	s6,a0
    b738:	000a0513          	mv	a0,s4
    b73c:	460030ef          	jal	eb9c <__mulsi3>
    b740:	00050993          	mv	s3,a0
    b744:	00090593          	mv	a1,s2
    b748:	000b8513          	mv	a0,s7
    b74c:	55c030ef          	jal	eca8 <__umodsi3>
    b750:	01051513          	sll	a0,a0,0x10
    b754:	0104d793          	srl	a5,s1,0x10
    b758:	00a7e7b3          	or	a5,a5,a0
    b75c:	0137fe63          	bgeu	a5,s3,b778 <__udivdi3+0x3b0>
    b760:	00fa87b3          	add	a5,s5,a5
    b764:	fffb0713          	add	a4,s6,-1
    b768:	2d57ec63          	bltu	a5,s5,ba40 <__udivdi3+0x678>
    b76c:	2d37fa63          	bgeu	a5,s3,ba40 <__udivdi3+0x678>
    b770:	ffeb0b13          	add	s6,s6,-2
    b774:	015787b3          	add	a5,a5,s5
    b778:	413789b3          	sub	s3,a5,s3
    b77c:	00090593          	mv	a1,s2
    b780:	00098513          	mv	a0,s3
    b784:	4dc030ef          	jal	ec60 <__hidden___udivsi3>
    b788:	00050593          	mv	a1,a0
    b78c:	00050b93          	mv	s7,a0
    b790:	000a0513          	mv	a0,s4
    b794:	408030ef          	jal	eb9c <__mulsi3>
    b798:	00050793          	mv	a5,a0
    b79c:	00090593          	mv	a1,s2
    b7a0:	00098513          	mv	a0,s3
    b7a4:	01049493          	sll	s1,s1,0x10
    b7a8:	00078993          	mv	s3,a5
    b7ac:	4fc030ef          	jal	eca8 <__umodsi3>
    b7b0:	01051513          	sll	a0,a0,0x10
    b7b4:	0104d493          	srl	s1,s1,0x10
    b7b8:	00a4e4b3          	or	s1,s1,a0
    b7bc:	0134fe63          	bgeu	s1,s3,b7d8 <__udivdi3+0x410>
    b7c0:	009a84b3          	add	s1,s5,s1
    b7c4:	fffb8793          	add	a5,s7,-1
    b7c8:	2754e463          	bltu	s1,s5,ba30 <__udivdi3+0x668>
    b7cc:	2734f263          	bgeu	s1,s3,ba30 <__udivdi3+0x668>
    b7d0:	ffeb8b93          	add	s7,s7,-2
    b7d4:	015484b3          	add	s1,s1,s5
    b7d8:	010b1b13          	sll	s6,s6,0x10
    b7dc:	017b6b33          	or	s6,s6,s7
    b7e0:	413484b3          	sub	s1,s1,s3
    b7e4:	00c12b83          	lw	s7,12(sp)
    b7e8:	e25ff06f          	j	b60c <__udivdi3+0x244>
    b7ec:	1006b793          	sltiu	a5,a3,256
    b7f0:	0017b793          	seqz	a5,a5
    b7f4:	00379793          	sll	a5,a5,0x3
    b7f8:	00f6d533          	srl	a0,a3,a5
    b7fc:	00004717          	auipc	a4,0x4
    b800:	f0c70713          	add	a4,a4,-244 # f708 <__clz_tab>
    b804:	00a70733          	add	a4,a4,a0
    b808:	00074703          	lbu	a4,0(a4)
    b80c:	02000513          	li	a0,32
    b810:	00f70733          	add	a4,a4,a5
    b814:	40e50b33          	sub	s6,a0,a4
    b818:	d8e508e3          	beq	a0,a4,b5a8 <__udivdi3+0x1e0>
    b81c:	016696b3          	sll	a3,a3,s6
    b820:	01912223          	sw	s9,4(sp)
    b824:	00e65cb3          	srl	s9,a2,a4
    b828:	00dcecb3          	or	s9,s9,a3
    b82c:	01512a23          	sw	s5,20(sp)
    b830:	01712623          	sw	s7,12(sp)
    b834:	010cda93          	srl	s5,s9,0x10
    b838:	00e5dbb3          	srl	s7,a1,a4
    b83c:	016597b3          	sll	a5,a1,s6
    b840:	00e9d733          	srl	a4,s3,a4
    b844:	01812423          	sw	s8,8(sp)
    b848:	000a8593          	mv	a1,s5
    b84c:	000b8513          	mv	a0,s7
    b850:	010c9c13          	sll	s8,s9,0x10
    b854:	02812423          	sw	s0,40(sp)
    b858:	02912223          	sw	s1,36(sp)
    b85c:	03212023          	sw	s2,32(sp)
    b860:	00f764b3          	or	s1,a4,a5
    b864:	01661933          	sll	s2,a2,s6
    b868:	01412c23          	sw	s4,24(sp)
    b86c:	010c5c13          	srl	s8,s8,0x10
    b870:	3f0030ef          	jal	ec60 <__hidden___udivsi3>
    b874:	00050593          	mv	a1,a0
    b878:	00050413          	mv	s0,a0
    b87c:	000c0513          	mv	a0,s8
    b880:	31c030ef          	jal	eb9c <__mulsi3>
    b884:	00050a13          	mv	s4,a0
    b888:	000a8593          	mv	a1,s5
    b88c:	000b8513          	mv	a0,s7
    b890:	418030ef          	jal	eca8 <__umodsi3>
    b894:	01051513          	sll	a0,a0,0x10
    b898:	0104d793          	srl	a5,s1,0x10
    b89c:	00a7e7b3          	or	a5,a5,a0
    b8a0:	0147fe63          	bgeu	a5,s4,b8bc <__udivdi3+0x4f4>
    b8a4:	00fc87b3          	add	a5,s9,a5
    b8a8:	fff40713          	add	a4,s0,-1
    b8ac:	1997ee63          	bltu	a5,s9,ba48 <__udivdi3+0x680>
    b8b0:	1947fc63          	bgeu	a5,s4,ba48 <__udivdi3+0x680>
    b8b4:	ffe40413          	add	s0,s0,-2
    b8b8:	019787b3          	add	a5,a5,s9
    b8bc:	41478a33          	sub	s4,a5,s4
    b8c0:	000a8593          	mv	a1,s5
    b8c4:	000a0513          	mv	a0,s4
    b8c8:	398030ef          	jal	ec60 <__hidden___udivsi3>
    b8cc:	00050593          	mv	a1,a0
    b8d0:	00050b93          	mv	s7,a0
    b8d4:	000c0513          	mv	a0,s8
    b8d8:	2c4030ef          	jal	eb9c <__mulsi3>
    b8dc:	00050793          	mv	a5,a0
    b8e0:	000a8593          	mv	a1,s5
    b8e4:	000a0513          	mv	a0,s4
    b8e8:	00078a13          	mv	s4,a5
    b8ec:	3bc030ef          	jal	eca8 <__umodsi3>
    b8f0:	01049713          	sll	a4,s1,0x10
    b8f4:	01051513          	sll	a0,a0,0x10
    b8f8:	01075713          	srl	a4,a4,0x10
    b8fc:	00a76733          	or	a4,a4,a0
    b900:	01477e63          	bgeu	a4,s4,b91c <__udivdi3+0x554>
    b904:	00ec8733          	add	a4,s9,a4
    b908:	fffb8793          	add	a5,s7,-1
    b90c:	13976663          	bltu	a4,s9,ba38 <__udivdi3+0x670>
    b910:	13477463          	bgeu	a4,s4,ba38 <__udivdi3+0x670>
    b914:	ffeb8b93          	add	s7,s7,-2
    b918:	01970733          	add	a4,a4,s9
    b91c:	00010e37          	lui	t3,0x10
    b920:	01041413          	sll	s0,s0,0x10
    b924:	01746433          	or	s0,s0,s7
    b928:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    b92c:	00f47833          	and	a6,s0,a5
    b930:	00f977b3          	and	a5,s2,a5
    b934:	41470733          	sub	a4,a4,s4
    b938:	01045e93          	srl	t4,s0,0x10
    b93c:	01095913          	srl	s2,s2,0x10
    b940:	00080513          	mv	a0,a6
    b944:	00078593          	mv	a1,a5
    b948:	254030ef          	jal	eb9c <__mulsi3>
    b94c:	00050313          	mv	t1,a0
    b950:	00090593          	mv	a1,s2
    b954:	00080513          	mv	a0,a6
    b958:	244030ef          	jal	eb9c <__mulsi3>
    b95c:	00050813          	mv	a6,a0
    b960:	00078593          	mv	a1,a5
    b964:	000e8513          	mv	a0,t4
    b968:	234030ef          	jal	eb9c <__mulsi3>
    b96c:	00050893          	mv	a7,a0
    b970:	00090593          	mv	a1,s2
    b974:	000e8513          	mv	a0,t4
    b978:	224030ef          	jal	eb9c <__mulsi3>
    b97c:	01035793          	srl	a5,t1,0x10
    b980:	01180833          	add	a6,a6,a7
    b984:	010787b3          	add	a5,a5,a6
    b988:	0117f463          	bgeu	a5,a7,b990 <__udivdi3+0x5c8>
    b98c:	01c50533          	add	a0,a0,t3
    b990:	0107d693          	srl	a3,a5,0x10
    b994:	00a686b3          	add	a3,a3,a0
    b998:	06d76863          	bltu	a4,a3,ba08 <__udivdi3+0x640>
    b99c:	04d70663          	beq	a4,a3,b9e8 <__udivdi3+0x620>
    b9a0:	00040513          	mv	a0,s0
    b9a4:	02812403          	lw	s0,40(sp)
    b9a8:	02c12083          	lw	ra,44(sp)
    b9ac:	00000b13          	li	s6,0
    b9b0:	02412483          	lw	s1,36(sp)
    b9b4:	02012903          	lw	s2,32(sp)
    b9b8:	01812a03          	lw	s4,24(sp)
    b9bc:	01412a83          	lw	s5,20(sp)
    b9c0:	00c12b83          	lw	s7,12(sp)
    b9c4:	00812c03          	lw	s8,8(sp)
    b9c8:	00412c83          	lw	s9,4(sp)
    b9cc:	01c12983          	lw	s3,28(sp)
    b9d0:	000b0593          	mv	a1,s6
    b9d4:	01012b03          	lw	s6,16(sp)
    b9d8:	03010113          	add	sp,sp,48
    b9dc:	00008067          	ret
    b9e0:	00078993          	mv	s3,a5
    b9e4:	b2dff06f          	j	b510 <__udivdi3+0x148>
    b9e8:	00010737          	lui	a4,0x10
    b9ec:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    b9f0:	00e7f7b3          	and	a5,a5,a4
    b9f4:	01079793          	sll	a5,a5,0x10
    b9f8:	00e37333          	and	t1,t1,a4
    b9fc:	01699533          	sll	a0,s3,s6
    ba00:	006787b3          	add	a5,a5,t1
    ba04:	f8f57ee3          	bgeu	a0,a5,b9a0 <__udivdi3+0x5d8>
    ba08:	fff40513          	add	a0,s0,-1
    ba0c:	f99ff06f          	j	b9a4 <__udivdi3+0x5dc>
    ba10:	010007b7          	lui	a5,0x1000
    ba14:	04f67a63          	bgeu	a2,a5,ba68 <__udivdi3+0x6a0>
    ba18:	01065693          	srl	a3,a2,0x10
    ba1c:	01000713          	li	a4,16
    ba20:	bb9ff06f          	j	b5d8 <__udivdi3+0x210>
    ba24:	00000b13          	li	s6,0
    ba28:	00100513          	li	a0,1
    ba2c:	b29ff06f          	j	b554 <__udivdi3+0x18c>
    ba30:	00078b93          	mv	s7,a5
    ba34:	da5ff06f          	j	b7d8 <__udivdi3+0x410>
    ba38:	00078b93          	mv	s7,a5
    ba3c:	ee1ff06f          	j	b91c <__udivdi3+0x554>
    ba40:	00070b13          	mv	s6,a4
    ba44:	d35ff06f          	j	b778 <__udivdi3+0x3b0>
    ba48:	00070413          	mv	s0,a4
    ba4c:	e71ff06f          	j	b8bc <__udivdi3+0x4f4>
    ba50:	ffe98993          	add	s3,s3,-2
    ba54:	015787b3          	add	a5,a5,s5
    ba58:	c05ff06f          	j	b65c <__udivdi3+0x294>
    ba5c:	ffe90913          	add	s2,s2,-2
    ba60:	015787b3          	add	a5,a5,s5
    ba64:	a51ff06f          	j	b4b4 <__udivdi3+0xec>
    ba68:	01865693          	srl	a3,a2,0x18
    ba6c:	01800713          	li	a4,24
    ba70:	b69ff06f          	j	b5d8 <__udivdi3+0x210>

0000ba74 <__umoddi3>:
    ba74:	fd010113          	add	sp,sp,-48
    ba78:	02112623          	sw	ra,44(sp)
    ba7c:	00050793          	mv	a5,a0
    ba80:	14069663          	bnez	a3,bbcc <__umoddi3+0x158>
    ba84:	03212023          	sw	s2,32(sp)
    ba88:	01412c23          	sw	s4,24(sp)
    ba8c:	02812423          	sw	s0,40(sp)
    ba90:	02912223          	sw	s1,36(sp)
    ba94:	01312e23          	sw	s3,28(sp)
    ba98:	01512a23          	sw	s5,20(sp)
    ba9c:	00060a13          	mv	s4,a2
    baa0:	00050913          	mv	s2,a0
    baa4:	1ac5f663          	bgeu	a1,a2,bc50 <__umoddi3+0x1dc>
    baa8:	01612823          	sw	s6,16(sp)
    baac:	00010737          	lui	a4,0x10
    bab0:	00058993          	mv	s3,a1
    bab4:	28e66063          	bltu	a2,a4,bd34 <__umoddi3+0x2c0>
    bab8:	01000737          	lui	a4,0x1000
    babc:	01800693          	li	a3,24
    bac0:	00e67463          	bgeu	a2,a4,bac8 <__umoddi3+0x54>
    bac4:	01000693          	li	a3,16
    bac8:	00d65533          	srl	a0,a2,a3
    bacc:	00004717          	auipc	a4,0x4
    bad0:	c3c70713          	add	a4,a4,-964 # f708 <__clz_tab>
    bad4:	00a70733          	add	a4,a4,a0
    bad8:	00074703          	lbu	a4,0(a4)
    badc:	02000513          	li	a0,32
    bae0:	00d70733          	add	a4,a4,a3
    bae4:	40e504b3          	sub	s1,a0,a4
    bae8:	00e50c63          	beq	a0,a4,bb00 <__umoddi3+0x8c>
    baec:	009599b3          	sll	s3,a1,s1
    baf0:	00e7d733          	srl	a4,a5,a4
    baf4:	00961a33          	sll	s4,a2,s1
    baf8:	013769b3          	or	s3,a4,s3
    bafc:	00979933          	sll	s2,a5,s1
    bb00:	010a5a93          	srl	s5,s4,0x10
    bb04:	000a8593          	mv	a1,s5
    bb08:	00098513          	mv	a0,s3
    bb0c:	010a1b13          	sll	s6,s4,0x10
    bb10:	150030ef          	jal	ec60 <__hidden___udivsi3>
    bb14:	010b5b13          	srl	s6,s6,0x10
    bb18:	000b0593          	mv	a1,s6
    bb1c:	080030ef          	jal	eb9c <__mulsi3>
    bb20:	00050413          	mv	s0,a0
    bb24:	000a8593          	mv	a1,s5
    bb28:	00098513          	mv	a0,s3
    bb2c:	17c030ef          	jal	eca8 <__umodsi3>
    bb30:	01051513          	sll	a0,a0,0x10
    bb34:	01095793          	srl	a5,s2,0x10
    bb38:	00a7e7b3          	or	a5,a5,a0
    bb3c:	0087f863          	bgeu	a5,s0,bb4c <__umoddi3+0xd8>
    bb40:	00fa07b3          	add	a5,s4,a5
    bb44:	0147e463          	bltu	a5,s4,bb4c <__umoddi3+0xd8>
    bb48:	5687e863          	bltu	a5,s0,c0b8 <__umoddi3+0x644>
    bb4c:	40878433          	sub	s0,a5,s0
    bb50:	000a8593          	mv	a1,s5
    bb54:	00040513          	mv	a0,s0
    bb58:	108030ef          	jal	ec60 <__hidden___udivsi3>
    bb5c:	000b0593          	mv	a1,s6
    bb60:	03c030ef          	jal	eb9c <__mulsi3>
    bb64:	00050793          	mv	a5,a0
    bb68:	000a8593          	mv	a1,s5
    bb6c:	00040513          	mv	a0,s0
    bb70:	00078413          	mv	s0,a5
    bb74:	134030ef          	jal	eca8 <__umodsi3>
    bb78:	01091793          	sll	a5,s2,0x10
    bb7c:	01051513          	sll	a0,a0,0x10
    bb80:	0107d793          	srl	a5,a5,0x10
    bb84:	00a7e7b3          	or	a5,a5,a0
    bb88:	0087f863          	bgeu	a5,s0,bb98 <__umoddi3+0x124>
    bb8c:	00fa07b3          	add	a5,s4,a5
    bb90:	0147e463          	bltu	a5,s4,bb98 <__umoddi3+0x124>
    bb94:	5087ea63          	bltu	a5,s0,c0a8 <__umoddi3+0x634>
    bb98:	01012b03          	lw	s6,16(sp)
    bb9c:	408787b3          	sub	a5,a5,s0
    bba0:	0097d533          	srl	a0,a5,s1
    bba4:	02812403          	lw	s0,40(sp)
    bba8:	02412483          	lw	s1,36(sp)
    bbac:	02012903          	lw	s2,32(sp)
    bbb0:	01c12983          	lw	s3,28(sp)
    bbb4:	01812a03          	lw	s4,24(sp)
    bbb8:	01412a83          	lw	s5,20(sp)
    bbbc:	00000593          	li	a1,0
    bbc0:	02c12083          	lw	ra,44(sp)
    bbc4:	03010113          	add	sp,sp,48
    bbc8:	00008067          	ret
    bbcc:	00050893          	mv	a7,a0
    bbd0:	fed5e8e3          	bltu	a1,a3,bbc0 <__umoddi3+0x14c>
    bbd4:	03212023          	sw	s2,32(sp)
    bbd8:	01312e23          	sw	s3,28(sp)
    bbdc:	00010737          	lui	a4,0x10
    bbe0:	00058813          	mv	a6,a1
    bbe4:	24e6ec63          	bltu	a3,a4,be3c <__umoddi3+0x3c8>
    bbe8:	01000737          	lui	a4,0x1000
    bbec:	01800513          	li	a0,24
    bbf0:	00e6f463          	bgeu	a3,a4,bbf8 <__umoddi3+0x184>
    bbf4:	01000513          	li	a0,16
    bbf8:	00a6d333          	srl	t1,a3,a0
    bbfc:	00004717          	auipc	a4,0x4
    bc00:	b0c70713          	add	a4,a4,-1268 # f708 <__clz_tab>
    bc04:	00670733          	add	a4,a4,t1
    bc08:	00074703          	lbu	a4,0(a4)
    bc0c:	02000313          	li	t1,32
    bc10:	00a709b3          	add	s3,a4,a0
    bc14:	41330933          	sub	s2,t1,s3
    bc18:	25331a63          	bne	t1,s3,be6c <__umoddi3+0x3f8>
    bc1c:	00b6e463          	bltu	a3,a1,bc24 <__umoddi3+0x1b0>
    bc20:	00c7ea63          	bltu	a5,a2,bc34 <__umoddi3+0x1c0>
    bc24:	40c788b3          	sub	a7,a5,a2
    bc28:	40d586b3          	sub	a3,a1,a3
    bc2c:	0117b833          	sltu	a6,a5,a7
    bc30:	41068833          	sub	a6,a3,a6
    bc34:	02c12083          	lw	ra,44(sp)
    bc38:	02012903          	lw	s2,32(sp)
    bc3c:	01c12983          	lw	s3,28(sp)
    bc40:	00088513          	mv	a0,a7
    bc44:	00080593          	mv	a1,a6
    bc48:	03010113          	add	sp,sp,48
    bc4c:	00008067          	ret
    bc50:	0e060a63          	beqz	a2,bd44 <__umoddi3+0x2d0>
    bc54:	00010737          	lui	a4,0x10
    bc58:	42e67663          	bgeu	a2,a4,c084 <__umoddi3+0x610>
    bc5c:	10063693          	sltiu	a3,a2,256
    bc60:	0016b693          	seqz	a3,a3
    bc64:	00369693          	sll	a3,a3,0x3
    bc68:	00d65533          	srl	a0,a2,a3
    bc6c:	00004717          	auipc	a4,0x4
    bc70:	a9c70713          	add	a4,a4,-1380 # f708 <__clz_tab>
    bc74:	00a70733          	add	a4,a4,a0
    bc78:	00074983          	lbu	s3,0(a4)
    bc7c:	02000713          	li	a4,32
    bc80:	00d989b3          	add	s3,s3,a3
    bc84:	413704b3          	sub	s1,a4,s3
    bc88:	0f371263          	bne	a4,s3,bd6c <__umoddi3+0x2f8>
    bc8c:	01061413          	sll	s0,a2,0x10
    bc90:	40c589b3          	sub	s3,a1,a2
    bc94:	01065a93          	srl	s5,a2,0x10
    bc98:	01045413          	srl	s0,s0,0x10
    bc9c:	000a8593          	mv	a1,s5
    bca0:	00098513          	mv	a0,s3
    bca4:	7bd020ef          	jal	ec60 <__hidden___udivsi3>
    bca8:	00040593          	mv	a1,s0
    bcac:	6f1020ef          	jal	eb9c <__mulsi3>
    bcb0:	00050793          	mv	a5,a0
    bcb4:	000a8593          	mv	a1,s5
    bcb8:	00098513          	mv	a0,s3
    bcbc:	00078993          	mv	s3,a5
    bcc0:	7e9020ef          	jal	eca8 <__umodsi3>
    bcc4:	01051513          	sll	a0,a0,0x10
    bcc8:	01095793          	srl	a5,s2,0x10
    bccc:	00a7e7b3          	or	a5,a5,a0
    bcd0:	0137f863          	bgeu	a5,s3,bce0 <__umoddi3+0x26c>
    bcd4:	00fa07b3          	add	a5,s4,a5
    bcd8:	0147e463          	bltu	a5,s4,bce0 <__umoddi3+0x26c>
    bcdc:	3d37ea63          	bltu	a5,s3,c0b0 <__umoddi3+0x63c>
    bce0:	413789b3          	sub	s3,a5,s3
    bce4:	000a8593          	mv	a1,s5
    bce8:	00098513          	mv	a0,s3
    bcec:	775020ef          	jal	ec60 <__hidden___udivsi3>
    bcf0:	00040593          	mv	a1,s0
    bcf4:	6a9020ef          	jal	eb9c <__mulsi3>
    bcf8:	00050413          	mv	s0,a0
    bcfc:	000a8593          	mv	a1,s5
    bd00:	00098513          	mv	a0,s3
    bd04:	7a5020ef          	jal	eca8 <__umodsi3>
    bd08:	01091913          	sll	s2,s2,0x10
    bd0c:	01051793          	sll	a5,a0,0x10
    bd10:	01095913          	srl	s2,s2,0x10
    bd14:	00f967b3          	or	a5,s2,a5
    bd18:	0087fa63          	bgeu	a5,s0,bd2c <__umoddi3+0x2b8>
    bd1c:	00fa07b3          	add	a5,s4,a5
    bd20:	0147e663          	bltu	a5,s4,bd2c <__umoddi3+0x2b8>
    bd24:	0087f463          	bgeu	a5,s0,bd2c <__umoddi3+0x2b8>
    bd28:	014787b3          	add	a5,a5,s4
    bd2c:	408787b3          	sub	a5,a5,s0
    bd30:	e71ff06f          	j	bba0 <__umoddi3+0x12c>
    bd34:	10063693          	sltiu	a3,a2,256
    bd38:	0016b693          	seqz	a3,a3
    bd3c:	00369693          	sll	a3,a3,0x3
    bd40:	d89ff06f          	j	bac8 <__umoddi3+0x54>
    bd44:	00000513          	li	a0,0
    bd48:	00004717          	auipc	a4,0x4
    bd4c:	9c070713          	add	a4,a4,-1600 # f708 <__clz_tab>
    bd50:	00a70733          	add	a4,a4,a0
    bd54:	00074983          	lbu	s3,0(a4)
    bd58:	00000693          	li	a3,0
    bd5c:	02000713          	li	a4,32
    bd60:	00d989b3          	add	s3,s3,a3
    bd64:	413704b3          	sub	s1,a4,s3
    bd68:	f33702e3          	beq	a4,s3,bc8c <__umoddi3+0x218>
    bd6c:	00961a33          	sll	s4,a2,s1
    bd70:	01712623          	sw	s7,12(sp)
    bd74:	010a5a93          	srl	s5,s4,0x10
    bd78:	0135dbb3          	srl	s7,a1,s3
    bd7c:	00959733          	sll	a4,a1,s1
    bd80:	0137d9b3          	srl	s3,a5,s3
    bd84:	000a8593          	mv	a1,s5
    bd88:	000b8513          	mv	a0,s7
    bd8c:	010a1413          	sll	s0,s4,0x10
    bd90:	00e9e9b3          	or	s3,s3,a4
    bd94:	00979933          	sll	s2,a5,s1
    bd98:	01612823          	sw	s6,16(sp)
    bd9c:	01045413          	srl	s0,s0,0x10
    bda0:	6c1020ef          	jal	ec60 <__hidden___udivsi3>
    bda4:	00040593          	mv	a1,s0
    bda8:	5f5020ef          	jal	eb9c <__mulsi3>
    bdac:	00050b13          	mv	s6,a0
    bdb0:	000a8593          	mv	a1,s5
    bdb4:	000b8513          	mv	a0,s7
    bdb8:	6f1020ef          	jal	eca8 <__umodsi3>
    bdbc:	01051513          	sll	a0,a0,0x10
    bdc0:	0109d793          	srl	a5,s3,0x10
    bdc4:	00a7e7b3          	or	a5,a5,a0
    bdc8:	0167fa63          	bgeu	a5,s6,bddc <__umoddi3+0x368>
    bdcc:	00fa07b3          	add	a5,s4,a5
    bdd0:	0147e663          	bltu	a5,s4,bddc <__umoddi3+0x368>
    bdd4:	0167f463          	bgeu	a5,s6,bddc <__umoddi3+0x368>
    bdd8:	014787b3          	add	a5,a5,s4
    bddc:	41678b33          	sub	s6,a5,s6
    bde0:	000a8593          	mv	a1,s5
    bde4:	000b0513          	mv	a0,s6
    bde8:	679020ef          	jal	ec60 <__hidden___udivsi3>
    bdec:	00040593          	mv	a1,s0
    bdf0:	5ad020ef          	jal	eb9c <__mulsi3>
    bdf4:	00050793          	mv	a5,a0
    bdf8:	000a8593          	mv	a1,s5
    bdfc:	000b0513          	mv	a0,s6
    be00:	01099993          	sll	s3,s3,0x10
    be04:	00078b13          	mv	s6,a5
    be08:	6a1020ef          	jal	eca8 <__umodsi3>
    be0c:	01051513          	sll	a0,a0,0x10
    be10:	0109d993          	srl	s3,s3,0x10
    be14:	00a9e9b3          	or	s3,s3,a0
    be18:	0169fa63          	bgeu	s3,s6,be2c <__umoddi3+0x3b8>
    be1c:	013a09b3          	add	s3,s4,s3
    be20:	0149e663          	bltu	s3,s4,be2c <__umoddi3+0x3b8>
    be24:	0169f463          	bgeu	s3,s6,be2c <__umoddi3+0x3b8>
    be28:	014989b3          	add	s3,s3,s4
    be2c:	416989b3          	sub	s3,s3,s6
    be30:	00c12b83          	lw	s7,12(sp)
    be34:	01012b03          	lw	s6,16(sp)
    be38:	e65ff06f          	j	bc9c <__umoddi3+0x228>
    be3c:	1006b513          	sltiu	a0,a3,256
    be40:	00153513          	seqz	a0,a0
    be44:	00351513          	sll	a0,a0,0x3
    be48:	00a6d333          	srl	t1,a3,a0
    be4c:	00004717          	auipc	a4,0x4
    be50:	8bc70713          	add	a4,a4,-1860 # f708 <__clz_tab>
    be54:	00670733          	add	a4,a4,t1
    be58:	00074703          	lbu	a4,0(a4)
    be5c:	02000313          	li	t1,32
    be60:	00a709b3          	add	s3,a4,a0
    be64:	41330933          	sub	s2,t1,s3
    be68:	db330ae3          	beq	t1,s3,bc1c <__umoddi3+0x1a8>
    be6c:	01512a23          	sw	s5,20(sp)
    be70:	012696b3          	sll	a3,a3,s2
    be74:	01365ab3          	srl	s5,a2,s3
    be78:	00daeab3          	or	s5,s5,a3
    be7c:	01712623          	sw	s7,12(sp)
    be80:	01a12023          	sw	s10,0(sp)
    be84:	010adb93          	srl	s7,s5,0x10
    be88:	0135dd33          	srl	s10,a1,s3
    be8c:	01259733          	sll	a4,a1,s2
    be90:	0137d6b3          	srl	a3,a5,s3
    be94:	01912223          	sw	s9,4(sp)
    be98:	000b8593          	mv	a1,s7
    be9c:	000d0513          	mv	a0,s10
    bea0:	010a9c93          	sll	s9,s5,0x10
    bea4:	02812423          	sw	s0,40(sp)
    bea8:	02912223          	sw	s1,36(sp)
    beac:	01261433          	sll	s0,a2,s2
    beb0:	012794b3          	sll	s1,a5,s2
    beb4:	01412c23          	sw	s4,24(sp)
    beb8:	01612823          	sw	s6,16(sp)
    bebc:	00e6ea33          	or	s4,a3,a4
    bec0:	01812423          	sw	s8,8(sp)
    bec4:	010cdc93          	srl	s9,s9,0x10
    bec8:	599020ef          	jal	ec60 <__hidden___udivsi3>
    becc:	00050593          	mv	a1,a0
    bed0:	00050b13          	mv	s6,a0
    bed4:	000c8513          	mv	a0,s9
    bed8:	4c5020ef          	jal	eb9c <__mulsi3>
    bedc:	00050c13          	mv	s8,a0
    bee0:	000b8593          	mv	a1,s7
    bee4:	000d0513          	mv	a0,s10
    bee8:	5c1020ef          	jal	eca8 <__umodsi3>
    beec:	01051513          	sll	a0,a0,0x10
    bef0:	010a5793          	srl	a5,s4,0x10
    bef4:	00a7e7b3          	or	a5,a5,a0
    bef8:	0187fe63          	bgeu	a5,s8,bf14 <__umoddi3+0x4a0>
    befc:	00fa87b3          	add	a5,s5,a5
    bf00:	fffb0713          	add	a4,s6,-1
    bf04:	1957ee63          	bltu	a5,s5,c0a0 <__umoddi3+0x62c>
    bf08:	1987fc63          	bgeu	a5,s8,c0a0 <__umoddi3+0x62c>
    bf0c:	ffeb0b13          	add	s6,s6,-2
    bf10:	015787b3          	add	a5,a5,s5
    bf14:	41878c33          	sub	s8,a5,s8
    bf18:	000b8593          	mv	a1,s7
    bf1c:	000c0513          	mv	a0,s8
    bf20:	541020ef          	jal	ec60 <__hidden___udivsi3>
    bf24:	00050593          	mv	a1,a0
    bf28:	00050d13          	mv	s10,a0
    bf2c:	000c8513          	mv	a0,s9
    bf30:	46d020ef          	jal	eb9c <__mulsi3>
    bf34:	00050793          	mv	a5,a0
    bf38:	000b8593          	mv	a1,s7
    bf3c:	000c0513          	mv	a0,s8
    bf40:	00078b93          	mv	s7,a5
    bf44:	565020ef          	jal	eca8 <__umodsi3>
    bf48:	010a1593          	sll	a1,s4,0x10
    bf4c:	01051513          	sll	a0,a0,0x10
    bf50:	0105d593          	srl	a1,a1,0x10
    bf54:	00a5e5b3          	or	a1,a1,a0
    bf58:	0175fe63          	bgeu	a1,s7,bf74 <__umoddi3+0x500>
    bf5c:	00ba85b3          	add	a1,s5,a1
    bf60:	fffd0793          	add	a5,s10,-1
    bf64:	1355ea63          	bltu	a1,s5,c098 <__umoddi3+0x624>
    bf68:	1375f863          	bgeu	a1,s7,c098 <__umoddi3+0x624>
    bf6c:	ffed0d13          	add	s10,s10,-2
    bf70:	015585b3          	add	a1,a1,s5
    bf74:	010b1793          	sll	a5,s6,0x10
    bf78:	00010e37          	lui	t3,0x10
    bf7c:	01a7e7b3          	or	a5,a5,s10
    bf80:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    bf84:	0067f8b3          	and	a7,a5,t1
    bf88:	00647333          	and	t1,s0,t1
    bf8c:	41758733          	sub	a4,a1,s7
    bf90:	0107d793          	srl	a5,a5,0x10
    bf94:	01045e93          	srl	t4,s0,0x10
    bf98:	00088513          	mv	a0,a7
    bf9c:	00030593          	mv	a1,t1
    bfa0:	3fd020ef          	jal	eb9c <__mulsi3>
    bfa4:	00050813          	mv	a6,a0
    bfa8:	000e8593          	mv	a1,t4
    bfac:	00088513          	mv	a0,a7
    bfb0:	3ed020ef          	jal	eb9c <__mulsi3>
    bfb4:	00050893          	mv	a7,a0
    bfb8:	00030593          	mv	a1,t1
    bfbc:	00078513          	mv	a0,a5
    bfc0:	3dd020ef          	jal	eb9c <__mulsi3>
    bfc4:	00050313          	mv	t1,a0
    bfc8:	000e8593          	mv	a1,t4
    bfcc:	00078513          	mv	a0,a5
    bfd0:	3cd020ef          	jal	eb9c <__mulsi3>
    bfd4:	01085793          	srl	a5,a6,0x10
    bfd8:	006888b3          	add	a7,a7,t1
    bfdc:	011787b3          	add	a5,a5,a7
    bfe0:	0067f463          	bgeu	a5,t1,bfe8 <__umoddi3+0x574>
    bfe4:	01c50533          	add	a0,a0,t3
    bfe8:	00010637          	lui	a2,0x10
    bfec:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    bff0:	0107d693          	srl	a3,a5,0x10
    bff4:	00c7f7b3          	and	a5,a5,a2
    bff8:	01079793          	sll	a5,a5,0x10
    bffc:	00c87833          	and	a6,a6,a2
    c000:	00a686b3          	add	a3,a3,a0
    c004:	010787b3          	add	a5,a5,a6
    c008:	06d76263          	bltu	a4,a3,c06c <__umoddi3+0x5f8>
    c00c:	04d70e63          	beq	a4,a3,c068 <__umoddi3+0x5f4>
    c010:	40f487b3          	sub	a5,s1,a5
    c014:	00f4b4b3          	sltu	s1,s1,a5
    c018:	02812403          	lw	s0,40(sp)
    c01c:	02c12083          	lw	ra,44(sp)
    c020:	40d705b3          	sub	a1,a4,a3
    c024:	409585b3          	sub	a1,a1,s1
    c028:	01359733          	sll	a4,a1,s3
    c02c:	0127d7b3          	srl	a5,a5,s2
    c030:	02412483          	lw	s1,36(sp)
    c034:	01c12983          	lw	s3,28(sp)
    c038:	01812a03          	lw	s4,24(sp)
    c03c:	01412a83          	lw	s5,20(sp)
    c040:	01012b03          	lw	s6,16(sp)
    c044:	00c12b83          	lw	s7,12(sp)
    c048:	00812c03          	lw	s8,8(sp)
    c04c:	00412c83          	lw	s9,4(sp)
    c050:	00012d03          	lw	s10,0(sp)
    c054:	0125d5b3          	srl	a1,a1,s2
    c058:	00f76533          	or	a0,a4,a5
    c05c:	02012903          	lw	s2,32(sp)
    c060:	03010113          	add	sp,sp,48
    c064:	00008067          	ret
    c068:	faf4f4e3          	bgeu	s1,a5,c010 <__umoddi3+0x59c>
    c06c:	40878433          	sub	s0,a5,s0
    c070:	0087b7b3          	sltu	a5,a5,s0
    c074:	01578ab3          	add	s5,a5,s5
    c078:	415686b3          	sub	a3,a3,s5
    c07c:	00040793          	mv	a5,s0
    c080:	f91ff06f          	j	c010 <__umoddi3+0x59c>
    c084:	01000737          	lui	a4,0x1000
    c088:	02e67c63          	bgeu	a2,a4,c0c0 <__umoddi3+0x64c>
    c08c:	01065513          	srl	a0,a2,0x10
    c090:	01000693          	li	a3,16
    c094:	bd9ff06f          	j	bc6c <__umoddi3+0x1f8>
    c098:	00078d13          	mv	s10,a5
    c09c:	ed9ff06f          	j	bf74 <__umoddi3+0x500>
    c0a0:	00070b13          	mv	s6,a4
    c0a4:	e71ff06f          	j	bf14 <__umoddi3+0x4a0>
    c0a8:	014787b3          	add	a5,a5,s4
    c0ac:	aedff06f          	j	bb98 <__umoddi3+0x124>
    c0b0:	014787b3          	add	a5,a5,s4
    c0b4:	c2dff06f          	j	bce0 <__umoddi3+0x26c>
    c0b8:	014787b3          	add	a5,a5,s4
    c0bc:	a91ff06f          	j	bb4c <__umoddi3+0xd8>
    c0c0:	01865513          	srl	a0,a2,0x18
    c0c4:	01800693          	li	a3,24
    c0c8:	ba5ff06f          	j	bc6c <__umoddi3+0x1f8>

0000c0cc <__adddf3>:
    c0cc:	001007b7          	lui	a5,0x100
    c0d0:	fe010113          	add	sp,sp,-32
    c0d4:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c0d8:	00bef833          	and	a6,t4,a1
    c0dc:	00def7b3          	and	a5,t4,a3
    c0e0:	0146d313          	srl	t1,a3,0x14
    c0e4:	01212823          	sw	s2,16(sp)
    c0e8:	0145d913          	srl	s2,a1,0x14
    c0ec:	00379793          	sll	a5,a5,0x3
    c0f0:	00812c23          	sw	s0,24(sp)
    c0f4:	00381813          	sll	a6,a6,0x3
    c0f8:	01f5d413          	srl	s0,a1,0x1f
    c0fc:	01d55713          	srl	a4,a0,0x1d
    c100:	01d65893          	srl	a7,a2,0x1d
    c104:	7ff97913          	and	s2,s2,2047
    c108:	7ff37313          	and	t1,t1,2047
    c10c:	00112e23          	sw	ra,28(sp)
    c110:	00912a23          	sw	s1,20(sp)
    c114:	01312623          	sw	s3,12(sp)
    c118:	01f6d693          	srl	a3,a3,0x1f
    c11c:	00f8e8b3          	or	a7,a7,a5
    c120:	01076733          	or	a4,a4,a6
    c124:	00351593          	sll	a1,a0,0x3
    c128:	00361f13          	sll	t5,a2,0x3
    c12c:	406907b3          	sub	a5,s2,t1
    c130:	1ed40463          	beq	s0,a3,c318 <__adddf3+0x24c>
    c134:	16f05263          	blez	a5,c298 <__adddf3+0x1cc>
    c138:	28030663          	beqz	t1,c3c4 <__adddf3+0x2f8>
    c13c:	7ff00693          	li	a3,2047
    c140:	42d90663          	beq	s2,a3,c56c <__adddf3+0x4a0>
    c144:	03800693          	li	a3,56
    c148:	00100613          	li	a2,1
    c14c:	02f6ce63          	blt	a3,a5,c188 <__adddf3+0xbc>
    c150:	008006b7          	lui	a3,0x800
    c154:	00d8e8b3          	or	a7,a7,a3
    c158:	01f00693          	li	a3,31
    c15c:	52f6ce63          	blt	a3,a5,c698 <__adddf3+0x5cc>
    c160:	02000693          	li	a3,32
    c164:	40f686b3          	sub	a3,a3,a5
    c168:	00d89633          	sll	a2,a7,a3
    c16c:	00ff5533          	srl	a0,t5,a5
    c170:	00df16b3          	sll	a3,t5,a3
    c174:	00a66633          	or	a2,a2,a0
    c178:	00d036b3          	snez	a3,a3
    c17c:	00f8d8b3          	srl	a7,a7,a5
    c180:	00d66633          	or	a2,a2,a3
    c184:	41170733          	sub	a4,a4,a7
    c188:	40c58633          	sub	a2,a1,a2
    c18c:	00c5b5b3          	sltu	a1,a1,a2
    c190:	00060493          	mv	s1,a2
    c194:	40b709b3          	sub	s3,a4,a1
    c198:	00899793          	sll	a5,s3,0x8
    c19c:	3207da63          	bgez	a5,c4d0 <__adddf3+0x404>
    c1a0:	008007b7          	lui	a5,0x800
    c1a4:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c1a8:	00f9f9b3          	and	s3,s3,a5
    c1ac:	2c098863          	beqz	s3,c47c <__adddf3+0x3b0>
    c1b0:	00098513          	mv	a0,s3
    c1b4:	359020ef          	jal	ed0c <__clzsi2>
    c1b8:	ff850793          	add	a5,a0,-8
    c1bc:	02000693          	li	a3,32
    c1c0:	40f68733          	sub	a4,a3,a5
    c1c4:	00e4d733          	srl	a4,s1,a4
    c1c8:	00f999b3          	sll	s3,s3,a5
    c1cc:	01376733          	or	a4,a4,s3
    c1d0:	00f494b3          	sll	s1,s1,a5
    c1d4:	4b27c863          	blt	a5,s2,c684 <__adddf3+0x5b8>
    c1d8:	412787b3          	sub	a5,a5,s2
    c1dc:	00178793          	add	a5,a5,1
    c1e0:	40f686b3          	sub	a3,a3,a5
    c1e4:	00d49633          	sll	a2,s1,a3
    c1e8:	00f4d9b3          	srl	s3,s1,a5
    c1ec:	00c03633          	snez	a2,a2
    c1f0:	01366633          	or	a2,a2,s3
    c1f4:	00d716b3          	sll	a3,a4,a3
    c1f8:	00c6e4b3          	or	s1,a3,a2
    c1fc:	00f759b3          	srl	s3,a4,a5
    c200:	00000913          	li	s2,0
    c204:	0074f793          	and	a5,s1,7
    c208:	02078063          	beqz	a5,c228 <__adddf3+0x15c>
    c20c:	00f4f793          	and	a5,s1,15
    c210:	00400713          	li	a4,4
    c214:	00e78a63          	beq	a5,a4,c228 <__adddf3+0x15c>
    c218:	00448793          	add	a5,s1,4
    c21c:	0097b633          	sltu	a2,a5,s1
    c220:	00c989b3          	add	s3,s3,a2
    c224:	00078493          	mv	s1,a5
    c228:	00899793          	sll	a5,s3,0x8
    c22c:	6e07da63          	bgez	a5,c920 <__adddf3+0x854>
    c230:	00190793          	add	a5,s2,1
    c234:	7ff00713          	li	a4,2047
    c238:	00040e13          	mv	t3,s0
    c23c:	2ae78663          	beq	a5,a4,c4e8 <__adddf3+0x41c>
    c240:	ff800737          	lui	a4,0xff800
    c244:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c248:	00e9f733          	and	a4,s3,a4
    c24c:	7ff7f793          	and	a5,a5,2047
    c250:	01d71813          	sll	a6,a4,0x1d
    c254:	0034d613          	srl	a2,s1,0x3
    c258:	00971713          	sll	a4,a4,0x9
    c25c:	00c86833          	or	a6,a6,a2
    c260:	00c75713          	srl	a4,a4,0xc
    c264:	01c12083          	lw	ra,28(sp)
    c268:	01812403          	lw	s0,24(sp)
    c26c:	01479793          	sll	a5,a5,0x14
    c270:	00e7e7b3          	or	a5,a5,a4
    c274:	01fe1713          	sll	a4,t3,0x1f
    c278:	00e7e7b3          	or	a5,a5,a4
    c27c:	01412483          	lw	s1,20(sp)
    c280:	01012903          	lw	s2,16(sp)
    c284:	00c12983          	lw	s3,12(sp)
    c288:	00080513          	mv	a0,a6
    c28c:	00078593          	mv	a1,a5
    c290:	02010113          	add	sp,sp,32
    c294:	00008067          	ret
    c298:	14078c63          	beqz	a5,c3f0 <__adddf3+0x324>
    c29c:	412307b3          	sub	a5,t1,s2
    c2a0:	3c091263          	bnez	s2,c664 <__adddf3+0x598>
    c2a4:	00b76533          	or	a0,a4,a1
    c2a8:	4c050463          	beqz	a0,c770 <__adddf3+0x6a4>
    c2ac:	fff78513          	add	a0,a5,-1
    c2b0:	60050263          	beqz	a0,c8b4 <__adddf3+0x7e8>
    c2b4:	7ff00813          	li	a6,2047
    c2b8:	57078663          	beq	a5,a6,c824 <__adddf3+0x758>
    c2bc:	03800793          	li	a5,56
    c2c0:	00100613          	li	a2,1
    c2c4:	02a7cc63          	blt	a5,a0,c2fc <__adddf3+0x230>
    c2c8:	00050793          	mv	a5,a0
    c2cc:	01f00613          	li	a2,31
    c2d0:	56f64c63          	blt	a2,a5,c848 <__adddf3+0x77c>
    c2d4:	02000513          	li	a0,32
    c2d8:	40f50533          	sub	a0,a0,a5
    c2dc:	00a71633          	sll	a2,a4,a0
    c2e0:	00f5d833          	srl	a6,a1,a5
    c2e4:	00a59533          	sll	a0,a1,a0
    c2e8:	01066633          	or	a2,a2,a6
    c2ec:	00a03533          	snez	a0,a0
    c2f0:	00f75733          	srl	a4,a4,a5
    c2f4:	00a66633          	or	a2,a2,a0
    c2f8:	40e888b3          	sub	a7,a7,a4
    c2fc:	40cf0633          	sub	a2,t5,a2
    c300:	00cf3733          	sltu	a4,t5,a2
    c304:	00060493          	mv	s1,a2
    c308:	40e889b3          	sub	s3,a7,a4
    c30c:	00030913          	mv	s2,t1
    c310:	00068413          	mv	s0,a3
    c314:	e85ff06f          	j	c198 <__adddf3+0xcc>
    c318:	1ef05063          	blez	a5,c4f8 <__adddf3+0x42c>
    c31c:	14031063          	bnez	t1,c45c <__adddf3+0x390>
    c320:	01e8e6b3          	or	a3,a7,t5
    c324:	26068c63          	beqz	a3,c59c <__adddf3+0x4d0>
    c328:	fff78693          	add	a3,a5,-1
    c32c:	48068063          	beqz	a3,c7ac <__adddf3+0x6e0>
    c330:	7ff00613          	li	a2,2047
    c334:	22c78c63          	beq	a5,a2,c56c <__adddf3+0x4a0>
    c338:	03800793          	li	a5,56
    c33c:	00100993          	li	s3,1
    c340:	02d7cc63          	blt	a5,a3,c378 <__adddf3+0x2ac>
    c344:	00068793          	mv	a5,a3
    c348:	01f00693          	li	a3,31
    c34c:	4af6c063          	blt	a3,a5,c7ec <__adddf3+0x720>
    c350:	02000693          	li	a3,32
    c354:	40f686b3          	sub	a3,a3,a5
    c358:	00d899b3          	sll	s3,a7,a3
    c35c:	00ff5633          	srl	a2,t5,a5
    c360:	00df16b3          	sll	a3,t5,a3
    c364:	00c9e9b3          	or	s3,s3,a2
    c368:	00d036b3          	snez	a3,a3
    c36c:	00f8d8b3          	srl	a7,a7,a5
    c370:	00d9e9b3          	or	s3,s3,a3
    c374:	01170733          	add	a4,a4,a7
    c378:	00b985b3          	add	a1,s3,a1
    c37c:	0135b9b3          	sltu	s3,a1,s3
    c380:	00058493          	mv	s1,a1
    c384:	00e989b3          	add	s3,s3,a4
    c388:	00899793          	sll	a5,s3,0x8
    c38c:	1407d263          	bgez	a5,c4d0 <__adddf3+0x404>
    c390:	00190913          	add	s2,s2,1
    c394:	7ff00793          	li	a5,2047
    c398:	36f90c63          	beq	s2,a5,c710 <__adddf3+0x644>
    c39c:	ff8007b7          	lui	a5,0xff800
    c3a0:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c3a4:	0014f613          	and	a2,s1,1
    c3a8:	00f9f7b3          	and	a5,s3,a5
    c3ac:	0014d713          	srl	a4,s1,0x1
    c3b0:	00c76733          	or	a4,a4,a2
    c3b4:	01f79613          	sll	a2,a5,0x1f
    c3b8:	00e664b3          	or	s1,a2,a4
    c3bc:	0017d993          	srl	s3,a5,0x1
    c3c0:	e45ff06f          	j	c204 <__adddf3+0x138>
    c3c4:	01e8e6b3          	or	a3,a7,t5
    c3c8:	1c068a63          	beqz	a3,c59c <__adddf3+0x4d0>
    c3cc:	fff78693          	add	a3,a5,-1
    c3d0:	40068063          	beqz	a3,c7d0 <__adddf3+0x704>
    c3d4:	7ff00613          	li	a2,2047
    c3d8:	18c78a63          	beq	a5,a2,c56c <__adddf3+0x4a0>
    c3dc:	03800793          	li	a5,56
    c3e0:	00100613          	li	a2,1
    c3e4:	dad7c2e3          	blt	a5,a3,c188 <__adddf3+0xbc>
    c3e8:	00068793          	mv	a5,a3
    c3ec:	d6dff06f          	j	c158 <__adddf3+0x8c>
    c3f0:	00190813          	add	a6,s2,1
    c3f4:	7fe87813          	and	a6,a6,2046
    c3f8:	22081c63          	bnez	a6,c630 <__adddf3+0x564>
    c3fc:	00b76333          	or	t1,a4,a1
    c400:	01e8e833          	or	a6,a7,t5
    c404:	38091063          	bnez	s2,c784 <__adddf3+0x6b8>
    c408:	46030e63          	beqz	t1,c884 <__adddf3+0x7b8>
    c40c:	40080663          	beqz	a6,c818 <__adddf3+0x74c>
    c410:	41e589b3          	sub	s3,a1,t5
    c414:	0135b533          	sltu	a0,a1,s3
    c418:	41170633          	sub	a2,a4,a7
    c41c:	40a60633          	sub	a2,a2,a0
    c420:	00861513          	sll	a0,a2,0x8
    c424:	50055e63          	bgez	a0,c940 <__adddf3+0x874>
    c428:	40bf05b3          	sub	a1,t5,a1
    c42c:	40e88733          	sub	a4,a7,a4
    c430:	00bf3f33          	sltu	t5,t5,a1
    c434:	41e70733          	sub	a4,a4,t5
    c438:	00871613          	sll	a2,a4,0x8
    c43c:	00058493          	mv	s1,a1
    c440:	52065e63          	bgez	a2,c97c <__adddf3+0x8b0>
    c444:	ff8007b7          	lui	a5,0xff800
    c448:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c44c:	00f77733          	and	a4,a4,a5
    c450:	00068e13          	mv	t3,a3
    c454:	00100793          	li	a5,1
    c458:	df9ff06f          	j	c250 <__adddf3+0x184>
    c45c:	7ff00693          	li	a3,2047
    c460:	10d90663          	beq	s2,a3,c56c <__adddf3+0x4a0>
    c464:	03800693          	li	a3,56
    c468:	00100993          	li	s3,1
    c46c:	f0f6c6e3          	blt	a3,a5,c378 <__adddf3+0x2ac>
    c470:	008006b7          	lui	a3,0x800
    c474:	00d8e8b3          	or	a7,a7,a3
    c478:	ed1ff06f          	j	c348 <__adddf3+0x27c>
    c47c:	00048513          	mv	a0,s1
    c480:	08d020ef          	jal	ed0c <__clzsi2>
    c484:	01850793          	add	a5,a0,24
    c488:	01f00693          	li	a3,31
    c48c:	d2f6d8e3          	bge	a3,a5,c1bc <__adddf3+0xf0>
    c490:	ff850713          	add	a4,a0,-8
    c494:	00e49733          	sll	a4,s1,a4
    c498:	2327c663          	blt	a5,s2,c6c4 <__adddf3+0x5f8>
    c49c:	41278933          	sub	s2,a5,s2
    c4a0:	00190793          	add	a5,s2,1
    c4a4:	48f6d663          	bge	a3,a5,c930 <__adddf3+0x864>
    c4a8:	fe190913          	add	s2,s2,-31
    c4ac:	02000693          	li	a3,32
    c4b0:	012754b3          	srl	s1,a4,s2
    c4b4:	00d78c63          	beq	a5,a3,c4cc <__adddf3+0x400>
    c4b8:	04000693          	li	a3,64
    c4bc:	40f687b3          	sub	a5,a3,a5
    c4c0:	00f71733          	sll	a4,a4,a5
    c4c4:	00e03733          	snez	a4,a4
    c4c8:	00e4e4b3          	or	s1,s1,a4
    c4cc:	00000913          	li	s2,0
    c4d0:	0074f793          	and	a5,s1,7
    c4d4:	d2079ce3          	bnez	a5,c20c <__adddf3+0x140>
    c4d8:	00090793          	mv	a5,s2
    c4dc:	0034d613          	srl	a2,s1,0x3
    c4e0:	00098713          	mv	a4,s3
    c4e4:	0c00006f          	j	c5a4 <__adddf3+0x4d8>
    c4e8:	7ff00793          	li	a5,2047
    c4ec:	00000713          	li	a4,0
    c4f0:	00000813          	li	a6,0
    c4f4:	d71ff06f          	j	c264 <__adddf3+0x198>
    c4f8:	0c078a63          	beqz	a5,c5cc <__adddf3+0x500>
    c4fc:	412307b3          	sub	a5,t1,s2
    c500:	1e090263          	beqz	s2,c6e4 <__adddf3+0x618>
    c504:	7ff00693          	li	a3,2047
    c508:	32d30863          	beq	t1,a3,c838 <__adddf3+0x76c>
    c50c:	03800693          	li	a3,56
    c510:	00100993          	li	s3,1
    c514:	02f6ce63          	blt	a3,a5,c550 <__adddf3+0x484>
    c518:	008006b7          	lui	a3,0x800
    c51c:	00d76733          	or	a4,a4,a3
    c520:	01f00693          	li	a3,31
    c524:	3cf6c863          	blt	a3,a5,c8f4 <__adddf3+0x828>
    c528:	02000693          	li	a3,32
    c52c:	40f686b3          	sub	a3,a3,a5
    c530:	00d719b3          	sll	s3,a4,a3
    c534:	00f5d633          	srl	a2,a1,a5
    c538:	00d596b3          	sll	a3,a1,a3
    c53c:	00c9e9b3          	or	s3,s3,a2
    c540:	00d036b3          	snez	a3,a3
    c544:	00f75733          	srl	a4,a4,a5
    c548:	00d9e9b3          	or	s3,s3,a3
    c54c:	00e888b3          	add	a7,a7,a4
    c550:	01e98733          	add	a4,s3,t5
    c554:	013739b3          	sltu	s3,a4,s3
    c558:	00070493          	mv	s1,a4
    c55c:	011989b3          	add	s3,s3,a7
    c560:	00030913          	mv	s2,t1
    c564:	e25ff06f          	j	c388 <__adddf3+0x2bc>
    c568:	02081063          	bnez	a6,c588 <__adddf3+0x4bc>
    c56c:	00351613          	sll	a2,a0,0x3
    c570:	00365613          	srl	a2,a2,0x3
    c574:	01d71813          	sll	a6,a4,0x1d
    c578:	00c86833          	or	a6,a6,a2
    c57c:	00375713          	srl	a4,a4,0x3
    c580:	01076733          	or	a4,a4,a6
    c584:	18070663          	beqz	a4,c710 <__adddf3+0x644>
    c588:	00000e13          	li	t3,0
    c58c:	7ff00793          	li	a5,2047
    c590:	00080737          	lui	a4,0x80
    c594:	00000813          	li	a6,0
    c598:	ccdff06f          	j	c264 <__adddf3+0x198>
    c59c:	00351613          	sll	a2,a0,0x3
    c5a0:	00365613          	srl	a2,a2,0x3
    c5a4:	01d71813          	sll	a6,a4,0x1d
    c5a8:	7ff00693          	li	a3,2047
    c5ac:	00c86833          	or	a6,a6,a2
    c5b0:	00375713          	srl	a4,a4,0x3
    c5b4:	fcd786e3          	beq	a5,a3,c580 <__adddf3+0x4b4>
    c5b8:	00c71713          	sll	a4,a4,0xc
    c5bc:	00c75713          	srl	a4,a4,0xc
    c5c0:	7ff7f793          	and	a5,a5,2047
    c5c4:	00040e13          	mv	t3,s0
    c5c8:	c9dff06f          	j	c264 <__adddf3+0x198>
    c5cc:	00190693          	add	a3,s2,1
    c5d0:	7fe6f813          	and	a6,a3,2046
    c5d4:	14081863          	bnez	a6,c724 <__adddf3+0x658>
    c5d8:	00b766b3          	or	a3,a4,a1
    c5dc:	28091c63          	bnez	s2,c874 <__adddf3+0x7a8>
    c5e0:	30068263          	beqz	a3,c8e4 <__adddf3+0x818>
    c5e4:	01e8e6b3          	or	a3,a7,t5
    c5e8:	22068863          	beqz	a3,c818 <__adddf3+0x74c>
    c5ec:	01e587b3          	add	a5,a1,t5
    c5f0:	00b7b5b3          	sltu	a1,a5,a1
    c5f4:	01170733          	add	a4,a4,a7
    c5f8:	00b70733          	add	a4,a4,a1
    c5fc:	0037d813          	srl	a6,a5,0x3
    c600:	00871793          	sll	a5,a4,0x8
    c604:	00040e13          	mv	t3,s0
    c608:	3407de63          	bgez	a5,c964 <__adddf3+0x898>
    c60c:	ff8007b7          	lui	a5,0xff800
    c610:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c614:	00f77733          	and	a4,a4,a5
    c618:	01d71793          	sll	a5,a4,0x1d
    c61c:	00375713          	srl	a4,a4,0x3
    c620:	0107e833          	or	a6,a5,a6
    c624:	01d77733          	and	a4,a4,t4
    c628:	00100793          	li	a5,1
    c62c:	c39ff06f          	j	c264 <__adddf3+0x198>
    c630:	41e58833          	sub	a6,a1,t5
    c634:	0105b7b3          	sltu	a5,a1,a6
    c638:	411709b3          	sub	s3,a4,a7
    c63c:	40f989b3          	sub	s3,s3,a5
    c640:	00899793          	sll	a5,s3,0x8
    c644:	00080493          	mv	s1,a6
    c648:	1007c663          	bltz	a5,c754 <__adddf3+0x688>
    c64c:	01386833          	or	a6,a6,s3
    c650:	b4081ee3          	bnez	a6,c1ac <__adddf3+0xe0>
    c654:	00000e13          	li	t3,0
    c658:	00000793          	li	a5,0
    c65c:	00000713          	li	a4,0
    c660:	c05ff06f          	j	c264 <__adddf3+0x198>
    c664:	7ff00513          	li	a0,2047
    c668:	1aa30e63          	beq	t1,a0,c824 <__adddf3+0x758>
    c66c:	03800513          	li	a0,56
    c670:	00100613          	li	a2,1
    c674:	c8f544e3          	blt	a0,a5,c2fc <__adddf3+0x230>
    c678:	00800637          	lui	a2,0x800
    c67c:	00c76733          	or	a4,a4,a2
    c680:	c4dff06f          	j	c2cc <__adddf3+0x200>
    c684:	ff8009b7          	lui	s3,0xff800
    c688:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c68c:	40f90933          	sub	s2,s2,a5
    c690:	013779b3          	and	s3,a4,s3
    c694:	b71ff06f          	j	c204 <__adddf3+0x138>
    c698:	fe078693          	add	a3,a5,-32
    c69c:	02000613          	li	a2,32
    c6a0:	00d8d6b3          	srl	a3,a7,a3
    c6a4:	00c78a63          	beq	a5,a2,c6b8 <__adddf3+0x5ec>
    c6a8:	04000613          	li	a2,64
    c6ac:	40f607b3          	sub	a5,a2,a5
    c6b0:	00f897b3          	sll	a5,a7,a5
    c6b4:	00ff6f33          	or	t5,t5,a5
    c6b8:	01e03633          	snez	a2,t5
    c6bc:	00d66633          	or	a2,a2,a3
    c6c0:	ac9ff06f          	j	c188 <__adddf3+0xbc>
    c6c4:	ff8006b7          	lui	a3,0xff800
    c6c8:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c6cc:	40f907b3          	sub	a5,s2,a5
    c6d0:	00d77733          	and	a4,a4,a3
    c6d4:	01d71813          	sll	a6,a4,0x1d
    c6d8:	01386833          	or	a6,a6,s3
    c6dc:	00375713          	srl	a4,a4,0x3
    c6e0:	ed9ff06f          	j	c5b8 <__adddf3+0x4ec>
    c6e4:	00b766b3          	or	a3,a4,a1
    c6e8:	1e068663          	beqz	a3,c8d4 <__adddf3+0x808>
    c6ec:	fff78693          	add	a3,a5,-1
    c6f0:	0a068e63          	beqz	a3,c7ac <__adddf3+0x6e0>
    c6f4:	7ff00513          	li	a0,2047
    c6f8:	14a78063          	beq	a5,a0,c838 <__adddf3+0x76c>
    c6fc:	03800793          	li	a5,56
    c700:	00100993          	li	s3,1
    c704:	e4d7c6e3          	blt	a5,a3,c550 <__adddf3+0x484>
    c708:	00068793          	mv	a5,a3
    c70c:	e15ff06f          	j	c520 <__adddf3+0x454>
    c710:	00040e13          	mv	t3,s0
    c714:	7ff00793          	li	a5,2047
    c718:	00000713          	li	a4,0
    c71c:	00000813          	li	a6,0
    c720:	b45ff06f          	j	c264 <__adddf3+0x198>
    c724:	7ff00793          	li	a5,2047
    c728:	fef684e3          	beq	a3,a5,c710 <__adddf3+0x644>
    c72c:	01e58f33          	add	t5,a1,t5
    c730:	00bf35b3          	sltu	a1,t5,a1
    c734:	011707b3          	add	a5,a4,a7
    c738:	00b787b3          	add	a5,a5,a1
    c73c:	01f79613          	sll	a2,a5,0x1f
    c740:	001f5f13          	srl	t5,t5,0x1
    c744:	01e664b3          	or	s1,a2,t5
    c748:	0017d993          	srl	s3,a5,0x1
    c74c:	00068913          	mv	s2,a3
    c750:	ab5ff06f          	j	c204 <__adddf3+0x138>
    c754:	40bf0633          	sub	a2,t5,a1
    c758:	40e887b3          	sub	a5,a7,a4
    c75c:	00cf3733          	sltu	a4,t5,a2
    c760:	00060493          	mv	s1,a2
    c764:	40e789b3          	sub	s3,a5,a4
    c768:	00068413          	mv	s0,a3
    c76c:	a41ff06f          	j	c1ac <__adddf3+0xe0>
    c770:	00361613          	sll	a2,a2,0x3
    c774:	00365613          	srl	a2,a2,0x3
    c778:	00068413          	mv	s0,a3
    c77c:	00088713          	mv	a4,a7
    c780:	e25ff06f          	j	c5a4 <__adddf3+0x4d8>
    c784:	de0312e3          	bnez	t1,c568 <__adddf3+0x49c>
    c788:	1c080663          	beqz	a6,c954 <__adddf3+0x888>
    c78c:	0038d713          	srl	a4,a7,0x3
    c790:	00361613          	sll	a2,a2,0x3
    c794:	01d89893          	sll	a7,a7,0x1d
    c798:	01176733          	or	a4,a4,a7
    c79c:	00365613          	srl	a2,a2,0x3
    c7a0:	00c76733          	or	a4,a4,a2
    c7a4:	00068413          	mv	s0,a3
    c7a8:	dddff06f          	j	c584 <__adddf3+0x4b8>
    c7ac:	01e58f33          	add	t5,a1,t5
    c7b0:	011708b3          	add	a7,a4,a7
    c7b4:	00bf35b3          	sltu	a1,t5,a1
    c7b8:	00b889b3          	add	s3,a7,a1
    c7bc:	00899793          	sll	a5,s3,0x8
    c7c0:	000f0493          	mv	s1,t5
    c7c4:	0e07d463          	bgez	a5,c8ac <__adddf3+0x7e0>
    c7c8:	00200913          	li	s2,2
    c7cc:	bd1ff06f          	j	c39c <__adddf3+0x2d0>
    c7d0:	41e58f33          	sub	t5,a1,t5
    c7d4:	411708b3          	sub	a7,a4,a7
    c7d8:	01e5b5b3          	sltu	a1,a1,t5
    c7dc:	000f0493          	mv	s1,t5
    c7e0:	40b889b3          	sub	s3,a7,a1
    c7e4:	00100913          	li	s2,1
    c7e8:	9b1ff06f          	j	c198 <__adddf3+0xcc>
    c7ec:	fe078693          	add	a3,a5,-32
    c7f0:	02000613          	li	a2,32
    c7f4:	00d8d6b3          	srl	a3,a7,a3
    c7f8:	00c78a63          	beq	a5,a2,c80c <__adddf3+0x740>
    c7fc:	04000613          	li	a2,64
    c800:	40f607b3          	sub	a5,a2,a5
    c804:	00f897b3          	sll	a5,a7,a5
    c808:	00ff6f33          	or	t5,t5,a5
    c80c:	01e039b3          	snez	s3,t5
    c810:	00d9e9b3          	or	s3,s3,a3
    c814:	b65ff06f          	j	c378 <__adddf3+0x2ac>
    c818:	00351613          	sll	a2,a0,0x3
    c81c:	00365993          	srl	s3,a2,0x3
    c820:	eb5ff06f          	j	c6d4 <__adddf3+0x608>
    c824:	00361613          	sll	a2,a2,0x3
    c828:	00365613          	srl	a2,a2,0x3
    c82c:	00068413          	mv	s0,a3
    c830:	00088713          	mv	a4,a7
    c834:	d41ff06f          	j	c574 <__adddf3+0x4a8>
    c838:	00361613          	sll	a2,a2,0x3
    c83c:	00365613          	srl	a2,a2,0x3
    c840:	00088713          	mv	a4,a7
    c844:	d31ff06f          	j	c574 <__adddf3+0x4a8>
    c848:	fe078513          	add	a0,a5,-32
    c84c:	02000613          	li	a2,32
    c850:	00a75533          	srl	a0,a4,a0
    c854:	00c78a63          	beq	a5,a2,c868 <__adddf3+0x79c>
    c858:	04000613          	li	a2,64
    c85c:	40f607b3          	sub	a5,a2,a5
    c860:	00f717b3          	sll	a5,a4,a5
    c864:	00f5e5b3          	or	a1,a1,a5
    c868:	00b03633          	snez	a2,a1
    c86c:	00a66633          	or	a2,a2,a0
    c870:	a8dff06f          	j	c2fc <__adddf3+0x230>
    c874:	fc0682e3          	beqz	a3,c838 <__adddf3+0x76c>
    c878:	01e8ef33          	or	t5,a7,t5
    c87c:	d00f16e3          	bnez	t5,c588 <__adddf3+0x4bc>
    c880:	cedff06f          	j	c56c <__adddf3+0x4a0>
    c884:	dc0808e3          	beqz	a6,c654 <__adddf3+0x588>
    c888:	00361813          	sll	a6,a2,0x3
    c88c:	01d89793          	sll	a5,a7,0x1d
    c890:	00385813          	srl	a6,a6,0x3
    c894:	0038d713          	srl	a4,a7,0x3
    c898:	00f86833          	or	a6,a6,a5
    c89c:	01d77733          	and	a4,a4,t4
    c8a0:	00068e13          	mv	t3,a3
    c8a4:	00000793          	li	a5,0
    c8a8:	9bdff06f          	j	c264 <__adddf3+0x198>
    c8ac:	00100793          	li	a5,1
    c8b0:	c2dff06f          	j	c4dc <__adddf3+0x410>
    c8b4:	40bf05b3          	sub	a1,t5,a1
    c8b8:	40e888b3          	sub	a7,a7,a4
    c8bc:	00bf3733          	sltu	a4,t5,a1
    c8c0:	00058493          	mv	s1,a1
    c8c4:	40e889b3          	sub	s3,a7,a4
    c8c8:	00068413          	mv	s0,a3
    c8cc:	00100913          	li	s2,1
    c8d0:	8c9ff06f          	j	c198 <__adddf3+0xcc>
    c8d4:	00361613          	sll	a2,a2,0x3
    c8d8:	00365613          	srl	a2,a2,0x3
    c8dc:	00088713          	mv	a4,a7
    c8e0:	cc5ff06f          	j	c5a4 <__adddf3+0x4d8>
    c8e4:	00361613          	sll	a2,a2,0x3
    c8e8:	00365993          	srl	s3,a2,0x3
    c8ec:	00088713          	mv	a4,a7
    c8f0:	de5ff06f          	j	c6d4 <__adddf3+0x608>
    c8f4:	fe078693          	add	a3,a5,-32
    c8f8:	02000613          	li	a2,32
    c8fc:	00d756b3          	srl	a3,a4,a3
    c900:	00c78a63          	beq	a5,a2,c914 <__adddf3+0x848>
    c904:	04000613          	li	a2,64
    c908:	40f607b3          	sub	a5,a2,a5
    c90c:	00f717b3          	sll	a5,a4,a5
    c910:	00f5e5b3          	or	a1,a1,a5
    c914:	00b039b3          	snez	s3,a1
    c918:	00d9e9b3          	or	s3,s3,a3
    c91c:	c35ff06f          	j	c550 <__adddf3+0x484>
    c920:	0034d613          	srl	a2,s1,0x3
    c924:	00090793          	mv	a5,s2
    c928:	00098713          	mv	a4,s3
    c92c:	c79ff06f          	j	c5a4 <__adddf3+0x4d8>
    c930:	02000693          	li	a3,32
    c934:	40f686b3          	sub	a3,a3,a5
    c938:	00000613          	li	a2,0
    c93c:	8b5ff06f          	j	c1f0 <__adddf3+0x124>
    c940:	00c9e833          	or	a6,s3,a2
    c944:	d00808e3          	beqz	a6,c654 <__adddf3+0x588>
    c948:	0039d993          	srl	s3,s3,0x3
    c94c:	00060713          	mv	a4,a2
    c950:	d85ff06f          	j	c6d4 <__adddf3+0x608>
    c954:	00000e13          	li	t3,0
    c958:	7ff00793          	li	a5,2047
    c95c:	00080737          	lui	a4,0x80
    c960:	905ff06f          	j	c264 <__adddf3+0x198>
    c964:	01d71793          	sll	a5,a4,0x1d
    c968:	00375713          	srl	a4,a4,0x3
    c96c:	0107e833          	or	a6,a5,a6
    c970:	01d77733          	and	a4,a4,t4
    c974:	00000793          	li	a5,0
    c978:	8edff06f          	j	c264 <__adddf3+0x198>
    c97c:	01d71813          	sll	a6,a4,0x1d
    c980:	0035d593          	srl	a1,a1,0x3
    c984:	00b86833          	or	a6,a6,a1
    c988:	00375713          	srl	a4,a4,0x3
    c98c:	00068413          	mv	s0,a3
    c990:	c29ff06f          	j	c5b8 <__adddf3+0x4ec>

0000c994 <__divdf3>:
    c994:	fb010113          	add	sp,sp,-80
    c998:	0145d793          	srl	a5,a1,0x14
    c99c:	04812423          	sw	s0,72(sp)
    c9a0:	04912223          	sw	s1,68(sp)
    c9a4:	05212023          	sw	s2,64(sp)
    c9a8:	03412c23          	sw	s4,56(sp)
    c9ac:	03512a23          	sw	s5,52(sp)
    c9b0:	00c59493          	sll	s1,a1,0xc
    c9b4:	04112623          	sw	ra,76(sp)
    c9b8:	03312e23          	sw	s3,60(sp)
    c9bc:	03612823          	sw	s6,48(sp)
    c9c0:	03712623          	sw	s7,44(sp)
    c9c4:	03812423          	sw	s8,40(sp)
    c9c8:	7ff7f793          	and	a5,a5,2047
    c9cc:	00050413          	mv	s0,a0
    c9d0:	00060a13          	mv	s4,a2
    c9d4:	00068913          	mv	s2,a3
    c9d8:	00c4d493          	srl	s1,s1,0xc
    c9dc:	01f5da93          	srl	s5,a1,0x1f
    c9e0:	18078c63          	beqz	a5,cb78 <__divdf3+0x1e4>
    c9e4:	7ff00713          	li	a4,2047
    c9e8:	08e78a63          	beq	a5,a4,ca7c <__divdf3+0xe8>
    c9ec:	01d55b13          	srl	s6,a0,0x1d
    c9f0:	00349493          	sll	s1,s1,0x3
    c9f4:	009b64b3          	or	s1,s6,s1
    c9f8:	00800737          	lui	a4,0x800
    c9fc:	00e4eb33          	or	s6,s1,a4
    ca00:	00351b93          	sll	s7,a0,0x3
    ca04:	c0178993          	add	s3,a5,-1023
    ca08:	00000493          	li	s1,0
    ca0c:	00000c13          	li	s8,0
    ca10:	01495793          	srl	a5,s2,0x14
    ca14:	00c91413          	sll	s0,s2,0xc
    ca18:	7ff7f793          	and	a5,a5,2047
    ca1c:	00c45413          	srl	s0,s0,0xc
    ca20:	01f95913          	srl	s2,s2,0x1f
    ca24:	08078463          	beqz	a5,caac <__divdf3+0x118>
    ca28:	7ff00713          	li	a4,2047
    ca2c:	18e78c63          	beq	a5,a4,cbc4 <__divdf3+0x230>
    ca30:	00341413          	sll	s0,s0,0x3
    ca34:	01da5713          	srl	a4,s4,0x1d
    ca38:	00876733          	or	a4,a4,s0
    ca3c:	c0178793          	add	a5,a5,-1023
    ca40:	00800437          	lui	s0,0x800
    ca44:	40f989b3          	sub	s3,s3,a5
    ca48:	00876433          	or	s0,a4,s0
    ca4c:	003a1813          	sll	a6,s4,0x3
    ca50:	00000793          	li	a5,0
    ca54:	00f00713          	li	a4,15
    ca58:	012aca33          	xor	s4,s5,s2
    ca5c:	24976663          	bltu	a4,s1,cca8 <__divdf3+0x314>
    ca60:	00003697          	auipc	a3,0x3
    ca64:	c6868693          	add	a3,a3,-920 # f6c8 <__mprec_tens+0xc8>
    ca68:	00249493          	sll	s1,s1,0x2
    ca6c:	00d484b3          	add	s1,s1,a3
    ca70:	0004a703          	lw	a4,0(s1)
    ca74:	00d70733          	add	a4,a4,a3
    ca78:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    ca7c:	00a4eb33          	or	s6,s1,a0
    ca80:	1c0b1e63          	bnez	s6,cc5c <__divdf3+0x2c8>
    ca84:	01495793          	srl	a5,s2,0x14
    ca88:	00c91413          	sll	s0,s2,0xc
    ca8c:	7ff7f793          	and	a5,a5,2047
    ca90:	00000b93          	li	s7,0
    ca94:	00800493          	li	s1,8
    ca98:	7ff00993          	li	s3,2047
    ca9c:	00200c13          	li	s8,2
    caa0:	00c45413          	srl	s0,s0,0xc
    caa4:	01f95913          	srl	s2,s2,0x1f
    caa8:	f80790e3          	bnez	a5,ca28 <__divdf3+0x94>
    caac:	01446833          	or	a6,s0,s4
    cab0:	1c080263          	beqz	a6,cc74 <__divdf3+0x2e0>
    cab4:	5c040663          	beqz	s0,d080 <__divdf3+0x6ec>
    cab8:	00040513          	mv	a0,s0
    cabc:	250020ef          	jal	ed0c <__clzsi2>
    cac0:	00050793          	mv	a5,a0
    cac4:	ff550693          	add	a3,a0,-11
    cac8:	01d00713          	li	a4,29
    cacc:	ff878813          	add	a6,a5,-8
    cad0:	40d70733          	sub	a4,a4,a3
    cad4:	01041433          	sll	s0,s0,a6
    cad8:	00ea5733          	srl	a4,s4,a4
    cadc:	00876433          	or	s0,a4,s0
    cae0:	010a1833          	sll	a6,s4,a6
    cae4:	013787b3          	add	a5,a5,s3
    cae8:	3f378993          	add	s3,a5,1011
    caec:	00000793          	li	a5,0
    caf0:	f65ff06f          	j	ca54 <__divdf3+0xc0>
    caf4:	40f70733          	sub	a4,a4,a5
    caf8:	03800693          	li	a3,56
    cafc:	60e6d063          	bge	a3,a4,d0fc <__divdf3+0x768>
    cb00:	00000793          	li	a5,0
    cb04:	00000693          	li	a3,0
    cb08:	00000713          	li	a4,0
    cb0c:	04c12083          	lw	ra,76(sp)
    cb10:	04812403          	lw	s0,72(sp)
    cb14:	01479793          	sll	a5,a5,0x14
    cb18:	00d7e7b3          	or	a5,a5,a3
    cb1c:	01fa1693          	sll	a3,s4,0x1f
    cb20:	00d7e7b3          	or	a5,a5,a3
    cb24:	04412483          	lw	s1,68(sp)
    cb28:	04012903          	lw	s2,64(sp)
    cb2c:	03c12983          	lw	s3,60(sp)
    cb30:	03812a03          	lw	s4,56(sp)
    cb34:	03412a83          	lw	s5,52(sp)
    cb38:	03012b03          	lw	s6,48(sp)
    cb3c:	02c12b83          	lw	s7,44(sp)
    cb40:	02812c03          	lw	s8,40(sp)
    cb44:	00070513          	mv	a0,a4
    cb48:	00078593          	mv	a1,a5
    cb4c:	05010113          	add	sp,sp,80
    cb50:	00008067          	ret
    cb54:	7ff00793          	li	a5,2047
    cb58:	00000693          	li	a3,0
    cb5c:	00000713          	li	a4,0
    cb60:	fadff06f          	j	cb0c <__divdf3+0x178>
    cb64:	00000a13          	li	s4,0
    cb68:	7ff00793          	li	a5,2047
    cb6c:	000806b7          	lui	a3,0x80
    cb70:	00000713          	li	a4,0
    cb74:	f99ff06f          	j	cb0c <__divdf3+0x178>
    cb78:	00a4eb33          	or	s6,s1,a0
    cb7c:	100b0c63          	beqz	s6,cc94 <__divdf3+0x300>
    cb80:	52048463          	beqz	s1,d0a8 <__divdf3+0x714>
    cb84:	00048513          	mv	a0,s1
    cb88:	184020ef          	jal	ed0c <__clzsi2>
    cb8c:	00050713          	mv	a4,a0
    cb90:	ff550793          	add	a5,a0,-11
    cb94:	01d00b13          	li	s6,29
    cb98:	ff870b93          	add	s7,a4,-8
    cb9c:	40fb0b33          	sub	s6,s6,a5
    cba0:	017494b3          	sll	s1,s1,s7
    cba4:	01645b33          	srl	s6,s0,s6
    cba8:	009b6b33          	or	s6,s6,s1
    cbac:	01741bb3          	sll	s7,s0,s7
    cbb0:	c0d00793          	li	a5,-1011
    cbb4:	40e789b3          	sub	s3,a5,a4
    cbb8:	00000493          	li	s1,0
    cbbc:	00000c13          	li	s8,0
    cbc0:	e51ff06f          	j	ca10 <__divdf3+0x7c>
    cbc4:	01446833          	or	a6,s0,s4
    cbc8:	80198993          	add	s3,s3,-2047
    cbcc:	0a081c63          	bnez	a6,cc84 <__divdf3+0x2f0>
    cbd0:	0024e493          	or	s1,s1,2
    cbd4:	00000413          	li	s0,0
    cbd8:	00200793          	li	a5,2
    cbdc:	e79ff06f          	j	ca54 <__divdf3+0xc0>
    cbe0:	000a8913          	mv	s2,s5
    cbe4:	000b0413          	mv	s0,s6
    cbe8:	000b8813          	mv	a6,s7
    cbec:	00200793          	li	a5,2
    cbf0:	60fc0863          	beq	s8,a5,d200 <__divdf3+0x86c>
    cbf4:	00300793          	li	a5,3
    cbf8:	f6fc06e3          	beq	s8,a5,cb64 <__divdf3+0x1d0>
    cbfc:	00100793          	li	a5,1
    cc00:	00090a13          	mv	s4,s2
    cc04:	eefc0ee3          	beq	s8,a5,cb00 <__divdf3+0x16c>
    cc08:	3ff98793          	add	a5,s3,1023
    cc0c:	3cf05263          	blez	a5,cfd0 <__divdf3+0x63c>
    cc10:	00787713          	and	a4,a6,7
    cc14:	5c071663          	bnez	a4,d1e0 <__divdf3+0x84c>
    cc18:	00741713          	sll	a4,s0,0x7
    cc1c:	00075a63          	bgez	a4,cc30 <__divdf3+0x29c>
    cc20:	ff0007b7          	lui	a5,0xff000
    cc24:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cc28:	00f47433          	and	s0,s0,a5
    cc2c:	40098793          	add	a5,s3,1024
    cc30:	7fe00713          	li	a4,2046
    cc34:	f2f740e3          	blt	a4,a5,cb54 <__divdf3+0x1c0>
    cc38:	00385813          	srl	a6,a6,0x3
    cc3c:	01d41713          	sll	a4,s0,0x1d
    cc40:	00941693          	sll	a3,s0,0x9
    cc44:	01076733          	or	a4,a4,a6
    cc48:	00c6d693          	srl	a3,a3,0xc
    cc4c:	7ff7f793          	and	a5,a5,2047
    cc50:	ebdff06f          	j	cb0c <__divdf3+0x178>
    cc54:	00078c13          	mv	s8,a5
    cc58:	f95ff06f          	j	cbec <__divdf3+0x258>
    cc5c:	00048b13          	mv	s6,s1
    cc60:	00050b93          	mv	s7,a0
    cc64:	00c00493          	li	s1,12
    cc68:	7ff00993          	li	s3,2047
    cc6c:	00300c13          	li	s8,3
    cc70:	da1ff06f          	j	ca10 <__divdf3+0x7c>
    cc74:	0014e493          	or	s1,s1,1
    cc78:	00000413          	li	s0,0
    cc7c:	00100793          	li	a5,1
    cc80:	dd5ff06f          	j	ca54 <__divdf3+0xc0>
    cc84:	0034e493          	or	s1,s1,3
    cc88:	000a0813          	mv	a6,s4
    cc8c:	00300793          	li	a5,3
    cc90:	dc5ff06f          	j	ca54 <__divdf3+0xc0>
    cc94:	00000b93          	li	s7,0
    cc98:	00400493          	li	s1,4
    cc9c:	00000993          	li	s3,0
    cca0:	00100c13          	li	s8,1
    cca4:	d6dff06f          	j	ca10 <__divdf3+0x7c>
    cca8:	03912223          	sw	s9,36(sp)
    ccac:	03a12023          	sw	s10,32(sp)
    ccb0:	01b12e23          	sw	s11,28(sp)
    ccb4:	3b646a63          	bltu	s0,s6,d068 <__divdf3+0x6d4>
    ccb8:	3a8b0663          	beq	s6,s0,d064 <__divdf3+0x6d0>
    ccbc:	fff98993          	add	s3,s3,-1
    ccc0:	000b8c13          	mv	s8,s7
    ccc4:	000b0493          	mv	s1,s6
    ccc8:	00000d13          	li	s10,0
    cccc:	01885c93          	srl	s9,a6,0x18
    ccd0:	00841413          	sll	s0,s0,0x8
    ccd4:	01045913          	srl	s2,s0,0x10
    ccd8:	008cecb3          	or	s9,s9,s0
    ccdc:	00090593          	mv	a1,s2
    cce0:	00048513          	mv	a0,s1
    cce4:	010c9b13          	sll	s6,s9,0x10
    cce8:	00881a93          	sll	s5,a6,0x8
    ccec:	010b5b13          	srl	s6,s6,0x10
    ccf0:	771010ef          	jal	ec60 <__hidden___udivsi3>
    ccf4:	00050593          	mv	a1,a0
    ccf8:	00050413          	mv	s0,a0
    ccfc:	000b0513          	mv	a0,s6
    cd00:	69d010ef          	jal	eb9c <__mulsi3>
    cd04:	00050793          	mv	a5,a0
    cd08:	00090593          	mv	a1,s2
    cd0c:	00048513          	mv	a0,s1
    cd10:	00078493          	mv	s1,a5
    cd14:	795010ef          	jal	eca8 <__umodsi3>
    cd18:	01051513          	sll	a0,a0,0x10
    cd1c:	010c5793          	srl	a5,s8,0x10
    cd20:	00a7e7b3          	or	a5,a5,a0
    cd24:	0097fa63          	bgeu	a5,s1,cd38 <__divdf3+0x3a4>
    cd28:	00fc87b3          	add	a5,s9,a5
    cd2c:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    cd30:	3b97fe63          	bgeu	a5,s9,d0ec <__divdf3+0x758>
    cd34:	00070413          	mv	s0,a4
    cd38:	409784b3          	sub	s1,a5,s1
    cd3c:	00090593          	mv	a1,s2
    cd40:	00048513          	mv	a0,s1
    cd44:	71d010ef          	jal	ec60 <__hidden___udivsi3>
    cd48:	00050593          	mv	a1,a0
    cd4c:	00050b93          	mv	s7,a0
    cd50:	000b0513          	mv	a0,s6
    cd54:	649010ef          	jal	eb9c <__mulsi3>
    cd58:	00050793          	mv	a5,a0
    cd5c:	00090593          	mv	a1,s2
    cd60:	00048513          	mv	a0,s1
    cd64:	00078493          	mv	s1,a5
    cd68:	741010ef          	jal	eca8 <__umodsi3>
    cd6c:	010c1793          	sll	a5,s8,0x10
    cd70:	01051513          	sll	a0,a0,0x10
    cd74:	0107d793          	srl	a5,a5,0x10
    cd78:	00a7e7b3          	or	a5,a5,a0
    cd7c:	0097fa63          	bgeu	a5,s1,cd90 <__divdf3+0x3fc>
    cd80:	00fc87b3          	add	a5,s9,a5
    cd84:	fffb8713          	add	a4,s7,-1
    cd88:	3597fa63          	bgeu	a5,s9,d0dc <__divdf3+0x748>
    cd8c:	00070b93          	mv	s7,a4
    cd90:	00010337          	lui	t1,0x10
    cd94:	01041413          	sll	s0,s0,0x10
    cd98:	01746433          	or	s0,s0,s7
    cd9c:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    cda0:	01b478b3          	and	a7,s0,s11
    cda4:	01bafdb3          	and	s11,s5,s11
    cda8:	40978bb3          	sub	s7,a5,s1
    cdac:	010adc13          	srl	s8,s5,0x10
    cdb0:	01045793          	srl	a5,s0,0x10
    cdb4:	00088513          	mv	a0,a7
    cdb8:	000d8593          	mv	a1,s11
    cdbc:	5e1010ef          	jal	eb9c <__mulsi3>
    cdc0:	00050813          	mv	a6,a0
    cdc4:	000c0593          	mv	a1,s8
    cdc8:	00088513          	mv	a0,a7
    cdcc:	5d1010ef          	jal	eb9c <__mulsi3>
    cdd0:	00050893          	mv	a7,a0
    cdd4:	000d8593          	mv	a1,s11
    cdd8:	00078513          	mv	a0,a5
    cddc:	5c1010ef          	jal	eb9c <__mulsi3>
    cde0:	00050e13          	mv	t3,a0
    cde4:	000c0593          	mv	a1,s8
    cde8:	00078513          	mv	a0,a5
    cdec:	5b1010ef          	jal	eb9c <__mulsi3>
    cdf0:	01085793          	srl	a5,a6,0x10
    cdf4:	01c888b3          	add	a7,a7,t3
    cdf8:	011787b3          	add	a5,a5,a7
    cdfc:	01c7f463          	bgeu	a5,t3,ce04 <__divdf3+0x470>
    ce00:	00650533          	add	a0,a0,t1
    ce04:	00010637          	lui	a2,0x10
    ce08:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    ce0c:	00c7f4b3          	and	s1,a5,a2
    ce10:	0107d693          	srl	a3,a5,0x10
    ce14:	01049493          	sll	s1,s1,0x10
    ce18:	00c87833          	and	a6,a6,a2
    ce1c:	00a687b3          	add	a5,a3,a0
    ce20:	010484b3          	add	s1,s1,a6
    ce24:	20fbea63          	bltu	s7,a5,d038 <__divdf3+0x6a4>
    ce28:	20fb8663          	beq	s7,a5,d034 <__divdf3+0x6a0>
    ce2c:	409d04b3          	sub	s1,s10,s1
    ce30:	40fb8bb3          	sub	s7,s7,a5
    ce34:	009d3d33          	sltu	s10,s10,s1
    ce38:	41ab8bb3          	sub	s7,s7,s10
    ce3c:	377c8a63          	beq	s9,s7,d1b0 <__divdf3+0x81c>
    ce40:	00090593          	mv	a1,s2
    ce44:	000b8513          	mv	a0,s7
    ce48:	619010ef          	jal	ec60 <__hidden___udivsi3>
    ce4c:	00050593          	mv	a1,a0
    ce50:	00a12623          	sw	a0,12(sp)
    ce54:	00050d13          	mv	s10,a0
    ce58:	000b0513          	mv	a0,s6
    ce5c:	541010ef          	jal	eb9c <__mulsi3>
    ce60:	00050793          	mv	a5,a0
    ce64:	00090593          	mv	a1,s2
    ce68:	000b8513          	mv	a0,s7
    ce6c:	00078b93          	mv	s7,a5
    ce70:	639010ef          	jal	eca8 <__umodsi3>
    ce74:	01051513          	sll	a0,a0,0x10
    ce78:	0104d793          	srl	a5,s1,0x10
    ce7c:	00a7e7b3          	or	a5,a5,a0
    ce80:	0377f063          	bgeu	a5,s7,cea0 <__divdf3+0x50c>
    ce84:	00fc87b3          	add	a5,s9,a5
    ce88:	fffd0693          	add	a3,s10,-1
    ce8c:	3797e263          	bltu	a5,s9,d1f0 <__divdf3+0x85c>
    ce90:	3777f063          	bgeu	a5,s7,d1f0 <__divdf3+0x85c>
    ce94:	ffed0713          	add	a4,s10,-2
    ce98:	00e12623          	sw	a4,12(sp)
    ce9c:	019787b3          	add	a5,a5,s9
    cea0:	41778bb3          	sub	s7,a5,s7
    cea4:	00090593          	mv	a1,s2
    cea8:	000b8513          	mv	a0,s7
    ceac:	5b5010ef          	jal	ec60 <__hidden___udivsi3>
    ceb0:	00050593          	mv	a1,a0
    ceb4:	00050d13          	mv	s10,a0
    ceb8:	000b0513          	mv	a0,s6
    cebc:	4e1010ef          	jal	eb9c <__mulsi3>
    cec0:	00050793          	mv	a5,a0
    cec4:	00090593          	mv	a1,s2
    cec8:	000b8513          	mv	a0,s7
    cecc:	00078913          	mv	s2,a5
    ced0:	01049493          	sll	s1,s1,0x10
    ced4:	5d5010ef          	jal	eca8 <__umodsi3>
    ced8:	01051513          	sll	a0,a0,0x10
    cedc:	0104d493          	srl	s1,s1,0x10
    cee0:	00a4e4b3          	or	s1,s1,a0
    cee4:	0124fe63          	bgeu	s1,s2,cf00 <__divdf3+0x56c>
    cee8:	009c84b3          	add	s1,s9,s1
    ceec:	fffd0793          	add	a5,s10,-1
    cef0:	3194e463          	bltu	s1,s9,d1f8 <__divdf3+0x864>
    cef4:	3124f263          	bgeu	s1,s2,d1f8 <__divdf3+0x864>
    cef8:	ffed0d13          	add	s10,s10,-2
    cefc:	019484b3          	add	s1,s1,s9
    cf00:	00c12783          	lw	a5,12(sp)
    cf04:	412484b3          	sub	s1,s1,s2
    cf08:	000d8593          	mv	a1,s11
    cf0c:	01079813          	sll	a6,a5,0x10
    cf10:	01a86833          	or	a6,a6,s10
    cf14:	01081313          	sll	t1,a6,0x10
    cf18:	01035313          	srl	t1,t1,0x10
    cf1c:	01085793          	srl	a5,a6,0x10
    cf20:	00030513          	mv	a0,t1
    cf24:	479010ef          	jal	eb9c <__mulsi3>
    cf28:	00050893          	mv	a7,a0
    cf2c:	000c0593          	mv	a1,s8
    cf30:	00030513          	mv	a0,t1
    cf34:	469010ef          	jal	eb9c <__mulsi3>
    cf38:	00050313          	mv	t1,a0
    cf3c:	000d8593          	mv	a1,s11
    cf40:	00078513          	mv	a0,a5
    cf44:	459010ef          	jal	eb9c <__mulsi3>
    cf48:	00050e13          	mv	t3,a0
    cf4c:	000c0593          	mv	a1,s8
    cf50:	00078513          	mv	a0,a5
    cf54:	449010ef          	jal	eb9c <__mulsi3>
    cf58:	0108d793          	srl	a5,a7,0x10
    cf5c:	01c30333          	add	t1,t1,t3
    cf60:	006787b3          	add	a5,a5,t1
    cf64:	01c7f663          	bgeu	a5,t3,cf70 <__divdf3+0x5dc>
    cf68:	00010737          	lui	a4,0x10
    cf6c:	00e50533          	add	a0,a0,a4
    cf70:	000106b7          	lui	a3,0x10
    cf74:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    cf78:	0107d713          	srl	a4,a5,0x10
    cf7c:	00d7f7b3          	and	a5,a5,a3
    cf80:	01079793          	sll	a5,a5,0x10
    cf84:	00d8f8b3          	and	a7,a7,a3
    cf88:	00a70733          	add	a4,a4,a0
    cf8c:	011787b3          	add	a5,a5,a7
    cf90:	02e4e063          	bltu	s1,a4,cfb0 <__divdf3+0x61c>
    cf94:	00e48c63          	beq	s1,a4,cfac <__divdf3+0x618>
    cf98:	02412c83          	lw	s9,36(sp)
    cf9c:	02012d03          	lw	s10,32(sp)
    cfa0:	01c12d83          	lw	s11,28(sp)
    cfa4:	00186813          	or	a6,a6,1
    cfa8:	c61ff06f          	j	cc08 <__divdf3+0x274>
    cfac:	1c078a63          	beqz	a5,d180 <__divdf3+0x7ec>
    cfb0:	009c84b3          	add	s1,s9,s1
    cfb4:	fff80613          	add	a2,a6,-1
    cfb8:	00048693          	mv	a3,s1
    cfbc:	1b94ec63          	bltu	s1,s9,d174 <__divdf3+0x7e0>
    cfc0:	24e4ea63          	bltu	s1,a4,d214 <__divdf3+0x880>
    cfc4:	26e48863          	beq	s1,a4,d234 <__divdf3+0x8a0>
    cfc8:	00060813          	mv	a6,a2
    cfcc:	fcdff06f          	j	cf98 <__divdf3+0x604>
    cfd0:	00100713          	li	a4,1
    cfd4:	b20790e3          	bnez	a5,caf4 <__divdf3+0x160>
    cfd8:	41e98793          	add	a5,s3,1054
    cfdc:	00f816b3          	sll	a3,a6,a5
    cfe0:	00d036b3          	snez	a3,a3
    cfe4:	00f417b3          	sll	a5,s0,a5
    cfe8:	00f6e7b3          	or	a5,a3,a5
    cfec:	00e85833          	srl	a6,a6,a4
    cff0:	00f86833          	or	a6,a6,a5
    cff4:	00787793          	and	a5,a6,7
    cff8:	00e45433          	srl	s0,s0,a4
    cffc:	02078063          	beqz	a5,d01c <__divdf3+0x688>
    d000:	00f87793          	and	a5,a6,15
    d004:	00400713          	li	a4,4
    d008:	00e78a63          	beq	a5,a4,d01c <__divdf3+0x688>
    d00c:	00480793          	add	a5,a6,4
    d010:	0107b833          	sltu	a6,a5,a6
    d014:	01040433          	add	s0,s0,a6
    d018:	00078813          	mv	a6,a5
    d01c:	00841613          	sll	a2,s0,0x8
    d020:	00100793          	li	a5,1
    d024:	00000693          	li	a3,0
    d028:	00000713          	li	a4,0
    d02c:	ae0640e3          	bltz	a2,cb0c <__divdf3+0x178>
    d030:	1280006f          	j	d158 <__divdf3+0x7c4>
    d034:	de9d7ce3          	bgeu	s10,s1,ce2c <__divdf3+0x498>
    d038:	015d06b3          	add	a3,s10,s5
    d03c:	01a6b633          	sltu	a2,a3,s10
    d040:	019605b3          	add	a1,a2,s9
    d044:	00bb8bb3          	add	s7,s7,a1
    d048:	00068d13          	mv	s10,a3
    d04c:	fff40593          	add	a1,s0,-1
    d050:	077cfe63          	bgeu	s9,s7,d0cc <__divdf3+0x738>
    d054:	14fbe063          	bltu	s7,a5,d194 <__divdf3+0x800>
    d058:	13778c63          	beq	a5,s7,d190 <__divdf3+0x7fc>
    d05c:	00058413          	mv	s0,a1
    d060:	dcdff06f          	j	ce2c <__divdf3+0x498>
    d064:	c50bece3          	bltu	s7,a6,ccbc <__divdf3+0x328>
    d068:	01fb1c13          	sll	s8,s6,0x1f
    d06c:	001bd713          	srl	a4,s7,0x1
    d070:	001b5493          	srl	s1,s6,0x1
    d074:	00ec6c33          	or	s8,s8,a4
    d078:	01fb9d13          	sll	s10,s7,0x1f
    d07c:	c51ff06f          	j	cccc <__divdf3+0x338>
    d080:	000a0513          	mv	a0,s4
    d084:	489010ef          	jal	ed0c <__clzsi2>
    d088:	01550693          	add	a3,a0,21
    d08c:	01c00713          	li	a4,28
    d090:	02050793          	add	a5,a0,32
    d094:	a2d75ae3          	bge	a4,a3,cac8 <__divdf3+0x134>
    d098:	ff850513          	add	a0,a0,-8
    d09c:	00000813          	li	a6,0
    d0a0:	00aa1433          	sll	s0,s4,a0
    d0a4:	a41ff06f          	j	cae4 <__divdf3+0x150>
    d0a8:	465010ef          	jal	ed0c <__clzsi2>
    d0ac:	01550793          	add	a5,a0,21
    d0b0:	01c00693          	li	a3,28
    d0b4:	02050713          	add	a4,a0,32
    d0b8:	acf6dee3          	bge	a3,a5,cb94 <__divdf3+0x200>
    d0bc:	ff850493          	add	s1,a0,-8
    d0c0:	00941b33          	sll	s6,s0,s1
    d0c4:	00000b93          	li	s7,0
    d0c8:	ae9ff06f          	j	cbb0 <__divdf3+0x21c>
    d0cc:	f97c98e3          	bne	s9,s7,d05c <__divdf3+0x6c8>
    d0d0:	f80602e3          	beqz	a2,d054 <__divdf3+0x6c0>
    d0d4:	00058413          	mv	s0,a1
    d0d8:	d55ff06f          	j	ce2c <__divdf3+0x498>
    d0dc:	ca97f8e3          	bgeu	a5,s1,cd8c <__divdf3+0x3f8>
    d0e0:	ffeb8b93          	add	s7,s7,-2
    d0e4:	019787b3          	add	a5,a5,s9
    d0e8:	ca9ff06f          	j	cd90 <__divdf3+0x3fc>
    d0ec:	c497f4e3          	bgeu	a5,s1,cd34 <__divdf3+0x3a0>
    d0f0:	ffe40413          	add	s0,s0,-2
    d0f4:	019787b3          	add	a5,a5,s9
    d0f8:	c41ff06f          	j	cd38 <__divdf3+0x3a4>
    d0fc:	01f00693          	li	a3,31
    d100:	ece6dce3          	bge	a3,a4,cfd8 <__divdf3+0x644>
    d104:	fe100693          	li	a3,-31
    d108:	40f686b3          	sub	a3,a3,a5
    d10c:	02000793          	li	a5,32
    d110:	00d456b3          	srl	a3,s0,a3
    d114:	00f70863          	beq	a4,a5,d124 <__divdf3+0x790>
    d118:	43e98793          	add	a5,s3,1086
    d11c:	00f417b3          	sll	a5,s0,a5
    d120:	00f86833          	or	a6,a6,a5
    d124:	01003833          	snez	a6,a6
    d128:	00d86833          	or	a6,a6,a3
    d12c:	00787713          	and	a4,a6,7
    d130:	00000693          	li	a3,0
    d134:	02070863          	beqz	a4,d164 <__divdf3+0x7d0>
    d138:	00f87793          	and	a5,a6,15
    d13c:	00400713          	li	a4,4
    d140:	00000413          	li	s0,0
    d144:	00e78a63          	beq	a5,a4,d158 <__divdf3+0x7c4>
    d148:	00480793          	add	a5,a6,4
    d14c:	0107b833          	sltu	a6,a5,a6
    d150:	01003433          	snez	s0,a6
    d154:	00078813          	mv	a6,a5
    d158:	00941693          	sll	a3,s0,0x9
    d15c:	01d41713          	sll	a4,s0,0x1d
    d160:	00c6d693          	srl	a3,a3,0xc
    d164:	00385813          	srl	a6,a6,0x3
    d168:	00e86733          	or	a4,a6,a4
    d16c:	00000793          	li	a5,0
    d170:	99dff06f          	j	cb0c <__divdf3+0x178>
    d174:	00060813          	mv	a6,a2
    d178:	e2e690e3          	bne	a3,a4,cf98 <__divdf3+0x604>
    d17c:	e1579ee3          	bne	a5,s5,cf98 <__divdf3+0x604>
    d180:	02412c83          	lw	s9,36(sp)
    d184:	02012d03          	lw	s10,32(sp)
    d188:	01c12d83          	lw	s11,28(sp)
    d18c:	a7dff06f          	j	cc08 <__divdf3+0x274>
    d190:	ec96f6e3          	bgeu	a3,s1,d05c <__divdf3+0x6c8>
    d194:	00da86b3          	add	a3,s5,a3
    d198:	0156b633          	sltu	a2,a3,s5
    d19c:	01960633          	add	a2,a2,s9
    d1a0:	ffe40413          	add	s0,s0,-2
    d1a4:	00068d13          	mv	s10,a3
    d1a8:	00cb8bb3          	add	s7,s7,a2
    d1ac:	c81ff06f          	j	ce2c <__divdf3+0x498>
    d1b0:	c0200713          	li	a4,-1022
    d1b4:	02412c83          	lw	s9,36(sp)
    d1b8:	02012d03          	lw	s10,32(sp)
    d1bc:	01c12d83          	lw	s11,28(sp)
    d1c0:	3ff98793          	add	a5,s3,1023
    d1c4:	fff00813          	li	a6,-1
    d1c8:	e0e9c4e3          	blt	s3,a4,cfd0 <__divdf3+0x63c>
    d1cc:	00480713          	add	a4,a6,4
    d1d0:	01073833          	sltu	a6,a4,a6
    d1d4:	01040433          	add	s0,s0,a6
    d1d8:	00070813          	mv	a6,a4
    d1dc:	a3dff06f          	j	cc18 <__divdf3+0x284>
    d1e0:	00f87713          	and	a4,a6,15
    d1e4:	00400693          	li	a3,4
    d1e8:	a2d708e3          	beq	a4,a3,cc18 <__divdf3+0x284>
    d1ec:	fe1ff06f          	j	d1cc <__divdf3+0x838>
    d1f0:	00d12623          	sw	a3,12(sp)
    d1f4:	cadff06f          	j	cea0 <__divdf3+0x50c>
    d1f8:	00078d13          	mv	s10,a5
    d1fc:	d05ff06f          	j	cf00 <__divdf3+0x56c>
    d200:	00090a13          	mv	s4,s2
    d204:	7ff00793          	li	a5,2047
    d208:	00000693          	li	a3,0
    d20c:	00000713          	li	a4,0
    d210:	8fdff06f          	j	cb0c <__divdf3+0x178>
    d214:	001a9613          	sll	a2,s5,0x1
    d218:	015636b3          	sltu	a3,a2,s5
    d21c:	019686b3          	add	a3,a3,s9
    d220:	00d486b3          	add	a3,s1,a3
    d224:	ffe80813          	add	a6,a6,-2
    d228:	00060a93          	mv	s5,a2
    d22c:	f4e688e3          	beq	a3,a4,d17c <__divdf3+0x7e8>
    d230:	d69ff06f          	j	cf98 <__divdf3+0x604>
    d234:	fefae0e3          	bltu	s5,a5,d214 <__divdf3+0x880>
    d238:	00060813          	mv	a6,a2
    d23c:	f41ff06f          	j	d17c <__divdf3+0x7e8>

0000d240 <__eqdf2>:
    d240:	0145d713          	srl	a4,a1,0x14
    d244:	001007b7          	lui	a5,0x100
    d248:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d24c:	0146d813          	srl	a6,a3,0x14
    d250:	7ff77713          	and	a4,a4,2047
    d254:	7ff00313          	li	t1,2047
    d258:	00b7fe33          	and	t3,a5,a1
    d25c:	00050893          	mv	a7,a0
    d260:	00d7f7b3          	and	a5,a5,a3
    d264:	01f5d593          	srl	a1,a1,0x1f
    d268:	7ff87813          	and	a6,a6,2047
    d26c:	01f6d693          	srl	a3,a3,0x1f
    d270:	00100513          	li	a0,1
    d274:	00670c63          	beq	a4,t1,d28c <__eqdf2+0x4c>
    d278:	00680863          	beq	a6,t1,d288 <__eqdf2+0x48>
    d27c:	01071463          	bne	a4,a6,d284 <__eqdf2+0x44>
    d280:	02fe0663          	beq	t3,a5,d2ac <__eqdf2+0x6c>
    d284:	00008067          	ret
    d288:	00008067          	ret
    d28c:	fee81ce3          	bne	a6,a4,d284 <__eqdf2+0x44>
    d290:	00fe67b3          	or	a5,t3,a5
    d294:	00c7e7b3          	or	a5,a5,a2
    d298:	0117e7b3          	or	a5,a5,a7
    d29c:	fe0794e3          	bnez	a5,d284 <__eqdf2+0x44>
    d2a0:	40d585b3          	sub	a1,a1,a3
    d2a4:	00b03533          	snez	a0,a1
    d2a8:	00008067          	ret
    d2ac:	fcc89ce3          	bne	a7,a2,d284 <__eqdf2+0x44>
    d2b0:	00d58a63          	beq	a1,a3,d2c4 <__eqdf2+0x84>
    d2b4:	fc0718e3          	bnez	a4,d284 <__eqdf2+0x44>
    d2b8:	011e6e33          	or	t3,t3,a7
    d2bc:	01c03533          	snez	a0,t3
    d2c0:	00008067          	ret
    d2c4:	00000513          	li	a0,0
    d2c8:	00008067          	ret

0000d2cc <__gedf2>:
    d2cc:	0145d893          	srl	a7,a1,0x14
    d2d0:	001007b7          	lui	a5,0x100
    d2d4:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d2d8:	0146d713          	srl	a4,a3,0x14
    d2dc:	7ff8f893          	and	a7,a7,2047
    d2e0:	7ff00e13          	li	t3,2047
    d2e4:	00b7f333          	and	t1,a5,a1
    d2e8:	00050813          	mv	a6,a0
    d2ec:	00050e93          	mv	t4,a0
    d2f0:	00d7f7b3          	and	a5,a5,a3
    d2f4:	01f5d593          	srl	a1,a1,0x1f
    d2f8:	00060f13          	mv	t5,a2
    d2fc:	7ff77513          	and	a0,a4,2047
    d300:	01f6d693          	srl	a3,a3,0x1f
    d304:	05c88863          	beq	a7,t3,d354 <__gedf2+0x88>
    d308:	03c50463          	beq	a0,t3,d330 <__gedf2+0x64>
    d30c:	06089a63          	bnez	a7,d380 <__gedf2+0xb4>
    d310:	01036833          	or	a6,t1,a6
    d314:	06051063          	bnez	a0,d374 <__gedf2+0xa8>
    d318:	00c7e633          	or	a2,a5,a2
    d31c:	08060c63          	beqz	a2,d3b4 <__gedf2+0xe8>
    d320:	0a081263          	bnez	a6,d3c4 <__gedf2+0xf8>
    d324:	00100513          	li	a0,1
    d328:	08068263          	beqz	a3,d3ac <__gedf2+0xe0>
    d32c:	00008067          	ret
    d330:	00c7e633          	or	a2,a5,a2
    d334:	08061463          	bnez	a2,d3bc <__gedf2+0xf0>
    d338:	00089663          	bnez	a7,d344 <__gedf2+0x78>
    d33c:	01036333          	or	t1,t1,a6
    d340:	fe0302e3          	beqz	t1,d324 <__gedf2+0x58>
    d344:	06d58063          	beq	a1,a3,d3a4 <__gedf2+0xd8>
    d348:	06059263          	bnez	a1,d3ac <__gedf2+0xe0>
    d34c:	00100513          	li	a0,1
    d350:	00008067          	ret
    d354:	01036333          	or	t1,t1,a6
    d358:	06031263          	bnez	t1,d3bc <__gedf2+0xf0>
    d35c:	ff1516e3          	bne	a0,a7,d348 <__gedf2+0x7c>
    d360:	00c7e7b3          	or	a5,a5,a2
    d364:	04079c63          	bnez	a5,d3bc <__gedf2+0xf0>
    d368:	fed590e3          	bne	a1,a3,d348 <__gedf2+0x7c>
    d36c:	00000513          	li	a0,0
    d370:	00008067          	ret
    d374:	fa0808e3          	beqz	a6,d324 <__gedf2+0x58>
    d378:	fcd598e3          	bne	a1,a3,d348 <__gedf2+0x7c>
    d37c:	0280006f          	j	d3a4 <__gedf2+0xd8>
    d380:	fc0504e3          	beqz	a0,d348 <__gedf2+0x7c>
    d384:	fcd592e3          	bne	a1,a3,d348 <__gedf2+0x7c>
    d388:	fd1540e3          	blt	a0,a7,d348 <__gedf2+0x7c>
    d38c:	00a8cc63          	blt	a7,a0,d3a4 <__gedf2+0xd8>
    d390:	fa67ece3          	bltu	a5,t1,d348 <__gedf2+0x7c>
    d394:	00f31863          	bne	t1,a5,d3a4 <__gedf2+0xd8>
    d398:	fbdf68e3          	bltu	t5,t4,d348 <__gedf2+0x7c>
    d39c:	00000513          	li	a0,0
    d3a0:	f9eef6e3          	bgeu	t4,t5,d32c <__gedf2+0x60>
    d3a4:	00100513          	li	a0,1
    d3a8:	f80592e3          	bnez	a1,d32c <__gedf2+0x60>
    d3ac:	fff00513          	li	a0,-1
    d3b0:	00008067          	ret
    d3b4:	f8081ae3          	bnez	a6,d348 <__gedf2+0x7c>
    d3b8:	00008067          	ret
    d3bc:	ffe00513          	li	a0,-2
    d3c0:	00008067          	ret
    d3c4:	fcd586e3          	beq	a1,a3,d390 <__gedf2+0xc4>
    d3c8:	f81ff06f          	j	d348 <__gedf2+0x7c>

0000d3cc <__ledf2>:
    d3cc:	0145d893          	srl	a7,a1,0x14
    d3d0:	001007b7          	lui	a5,0x100
    d3d4:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d3d8:	0146d713          	srl	a4,a3,0x14
    d3dc:	7ff8f893          	and	a7,a7,2047
    d3e0:	7ff00313          	li	t1,2047
    d3e4:	00b7fe33          	and	t3,a5,a1
    d3e8:	00050813          	mv	a6,a0
    d3ec:	00050e93          	mv	t4,a0
    d3f0:	00d7f7b3          	and	a5,a5,a3
    d3f4:	01f5d593          	srl	a1,a1,0x1f
    d3f8:	00060f13          	mv	t5,a2
    d3fc:	7ff77513          	and	a0,a4,2047
    d400:	01f6d693          	srl	a3,a3,0x1f
    d404:	04688a63          	beq	a7,t1,d458 <__ledf2+0x8c>
    d408:	02650463          	beq	a0,t1,d430 <__ledf2+0x64>
    d40c:	06089863          	bnez	a7,d47c <__ledf2+0xb0>
    d410:	010e6833          	or	a6,t3,a6
    d414:	08051e63          	bnez	a0,d4b0 <__ledf2+0xe4>
    d418:	00c7e633          	or	a2,a5,a2
    d41c:	0a060463          	beqz	a2,d4c4 <__ledf2+0xf8>
    d420:	0a081663          	bnez	a6,d4cc <__ledf2+0x100>
    d424:	00100513          	li	a0,1
    d428:	08068063          	beqz	a3,d4a8 <__ledf2+0xdc>
    d42c:	00008067          	ret
    d430:	00c7e633          	or	a2,a5,a2
    d434:	00200513          	li	a0,2
    d438:	fe061ae3          	bnez	a2,d42c <__ledf2+0x60>
    d43c:	00089663          	bnez	a7,d448 <__ledf2+0x7c>
    d440:	010e6e33          	or	t3,t3,a6
    d444:	fe0e00e3          	beqz	t3,d424 <__ledf2+0x58>
    d448:	04d58c63          	beq	a1,a3,d4a0 <__ledf2+0xd4>
    d44c:	04059e63          	bnez	a1,d4a8 <__ledf2+0xdc>
    d450:	00100513          	li	a0,1
    d454:	00008067          	ret
    d458:	010e6e33          	or	t3,t3,a6
    d45c:	060e1063          	bnez	t3,d4bc <__ledf2+0xf0>
    d460:	ff1516e3          	bne	a0,a7,d44c <__ledf2+0x80>
    d464:	00c7e7b3          	or	a5,a5,a2
    d468:	00200513          	li	a0,2
    d46c:	fc0790e3          	bnez	a5,d42c <__ledf2+0x60>
    d470:	fcd59ee3          	bne	a1,a3,d44c <__ledf2+0x80>
    d474:	00000513          	li	a0,0
    d478:	00008067          	ret
    d47c:	fc0508e3          	beqz	a0,d44c <__ledf2+0x80>
    d480:	fcd596e3          	bne	a1,a3,d44c <__ledf2+0x80>
    d484:	fd1544e3          	blt	a0,a7,d44c <__ledf2+0x80>
    d488:	00a8cc63          	blt	a7,a0,d4a0 <__ledf2+0xd4>
    d48c:	fdc7e0e3          	bltu	a5,t3,d44c <__ledf2+0x80>
    d490:	00fe1863          	bne	t3,a5,d4a0 <__ledf2+0xd4>
    d494:	fbdf6ce3          	bltu	t5,t4,d44c <__ledf2+0x80>
    d498:	00000513          	li	a0,0
    d49c:	f9eef8e3          	bgeu	t4,t5,d42c <__ledf2+0x60>
    d4a0:	00100513          	li	a0,1
    d4a4:	f80594e3          	bnez	a1,d42c <__ledf2+0x60>
    d4a8:	fff00513          	li	a0,-1
    d4ac:	00008067          	ret
    d4b0:	f6080ae3          	beqz	a6,d424 <__ledf2+0x58>
    d4b4:	f8d59ce3          	bne	a1,a3,d44c <__ledf2+0x80>
    d4b8:	fe9ff06f          	j	d4a0 <__ledf2+0xd4>
    d4bc:	00200513          	li	a0,2
    d4c0:	00008067          	ret
    d4c4:	f80814e3          	bnez	a6,d44c <__ledf2+0x80>
    d4c8:	00008067          	ret
    d4cc:	fcd580e3          	beq	a1,a3,d48c <__ledf2+0xc0>
    d4d0:	f7dff06f          	j	d44c <__ledf2+0x80>

0000d4d4 <__muldf3>:
    d4d4:	fd010113          	add	sp,sp,-48
    d4d8:	0145d793          	srl	a5,a1,0x14
    d4dc:	02812423          	sw	s0,40(sp)
    d4e0:	02912223          	sw	s1,36(sp)
    d4e4:	03212023          	sw	s2,32(sp)
    d4e8:	01312e23          	sw	s3,28(sp)
    d4ec:	01512a23          	sw	s5,20(sp)
    d4f0:	00c59493          	sll	s1,a1,0xc
    d4f4:	02112623          	sw	ra,44(sp)
    d4f8:	01412c23          	sw	s4,24(sp)
    d4fc:	01612823          	sw	s6,16(sp)
    d500:	01712623          	sw	s7,12(sp)
    d504:	01812423          	sw	s8,8(sp)
    d508:	7ff7f793          	and	a5,a5,2047
    d50c:	00050413          	mv	s0,a0
    d510:	00060a93          	mv	s5,a2
    d514:	00068993          	mv	s3,a3
    d518:	00c4d493          	srl	s1,s1,0xc
    d51c:	01f5d913          	srl	s2,a1,0x1f
    d520:	4e078063          	beqz	a5,da00 <__muldf3+0x52c>
    d524:	7ff00713          	li	a4,2047
    d528:	0ae78663          	beq	a5,a4,d5d4 <__muldf3+0x100>
    d52c:	00349693          	sll	a3,s1,0x3
    d530:	01d55713          	srl	a4,a0,0x1d
    d534:	00d76733          	or	a4,a4,a3
    d538:	008006b7          	lui	a3,0x800
    d53c:	00d764b3          	or	s1,a4,a3
    d540:	00351a13          	sll	s4,a0,0x3
    d544:	c0178c13          	add	s8,a5,-1023
    d548:	00000b13          	li	s6,0
    d54c:	00000b93          	li	s7,0
    d550:	0149d793          	srl	a5,s3,0x14
    d554:	00c99713          	sll	a4,s3,0xc
    d558:	7ff7f793          	and	a5,a5,2047
    d55c:	000a8e13          	mv	t3,s5
    d560:	00c75413          	srl	s0,a4,0xc
    d564:	01f9d993          	srl	s3,s3,0x1f
    d568:	0a078063          	beqz	a5,d608 <__muldf3+0x134>
    d56c:	7ff00713          	li	a4,2047
    d570:	14e78e63          	beq	a5,a4,d6cc <__muldf3+0x1f8>
    d574:	00341713          	sll	a4,s0,0x3
    d578:	01dad693          	srl	a3,s5,0x1d
    d57c:	00e6e6b3          	or	a3,a3,a4
    d580:	c0178793          	add	a5,a5,-1023
    d584:	00800737          	lui	a4,0x800
    d588:	00e6e433          	or	s0,a3,a4
    d58c:	003a9e13          	sll	t3,s5,0x3
    d590:	01878333          	add	t1,a5,s8
    d594:	00000693          	li	a3,0
    d598:	00a00793          	li	a5,10
    d59c:	00130893          	add	a7,t1,1
    d5a0:	0b67cc63          	blt	a5,s6,d658 <__muldf3+0x184>
    d5a4:	013945b3          	xor	a1,s2,s3
    d5a8:	00200793          	li	a5,2
    d5ac:	00058813          	mv	a6,a1
    d5b0:	1567c663          	blt	a5,s6,d6fc <__muldf3+0x228>
    d5b4:	fffb0b13          	add	s6,s6,-1
    d5b8:	00100713          	li	a4,1
    d5bc:	17676063          	bltu	a4,s6,d71c <__muldf3+0x248>
    d5c0:	48f68663          	beq	a3,a5,da4c <__muldf3+0x578>
    d5c4:	00040493          	mv	s1,s0
    d5c8:	000e0a13          	mv	s4,t3
    d5cc:	00068b93          	mv	s7,a3
    d5d0:	09c0006f          	j	d66c <__muldf3+0x198>
    d5d4:	00a4ea33          	or	s4,s1,a0
    d5d8:	480a1463          	bnez	s4,da60 <__muldf3+0x58c>
    d5dc:	0149d793          	srl	a5,s3,0x14
    d5e0:	00c99713          	sll	a4,s3,0xc
    d5e4:	7ff7f793          	and	a5,a5,2047
    d5e8:	00000493          	li	s1,0
    d5ec:	00800b13          	li	s6,8
    d5f0:	7ff00c13          	li	s8,2047
    d5f4:	00200b93          	li	s7,2
    d5f8:	000a8e13          	mv	t3,s5
    d5fc:	00c75413          	srl	s0,a4,0xc
    d600:	01f9d993          	srl	s3,s3,0x1f
    d604:	f60794e3          	bnez	a5,d56c <__muldf3+0x98>
    d608:	015467b3          	or	a5,s0,s5
    d60c:	46078e63          	beqz	a5,da88 <__muldf3+0x5b4>
    d610:	54040c63          	beqz	s0,db68 <__muldf3+0x694>
    d614:	00040513          	mv	a0,s0
    d618:	6f4010ef          	jal	ed0c <__clzsi2>
    d61c:	00050313          	mv	t1,a0
    d620:	ff550713          	add	a4,a0,-11
    d624:	01d00793          	li	a5,29
    d628:	ff830e13          	add	t3,t1,-8
    d62c:	40e787b3          	sub	a5,a5,a4
    d630:	00fad7b3          	srl	a5,s5,a5
    d634:	01c41733          	sll	a4,s0,t3
    d638:	00e7e433          	or	s0,a5,a4
    d63c:	01ca9e33          	sll	t3,s5,t3
    d640:	406c0333          	sub	t1,s8,t1
    d644:	c0d30313          	add	t1,t1,-1011
    d648:	00a00793          	li	a5,10
    d64c:	00000693          	li	a3,0
    d650:	00130893          	add	a7,t1,1
    d654:	f567d8e3          	bge	a5,s6,d5a4 <__muldf3+0xd0>
    d658:	00090593          	mv	a1,s2
    d65c:	00200793          	li	a5,2
    d660:	3efb8663          	beq	s7,a5,da4c <__muldf3+0x578>
    d664:	00300793          	li	a5,3
    d668:	54fb8863          	beq	s7,a5,dbb8 <__muldf3+0x6e4>
    d66c:	00100793          	li	a5,1
    d670:	00058813          	mv	a6,a1
    d674:	52fb9663          	bne	s7,a5,dba0 <__muldf3+0x6cc>
    d678:	00000793          	li	a5,0
    d67c:	00000693          	li	a3,0
    d680:	00000713          	li	a4,0
    d684:	02c12083          	lw	ra,44(sp)
    d688:	02812403          	lw	s0,40(sp)
    d68c:	01479793          	sll	a5,a5,0x14
    d690:	00d7e7b3          	or	a5,a5,a3
    d694:	01f81813          	sll	a6,a6,0x1f
    d698:	0107e7b3          	or	a5,a5,a6
    d69c:	02412483          	lw	s1,36(sp)
    d6a0:	02012903          	lw	s2,32(sp)
    d6a4:	01c12983          	lw	s3,28(sp)
    d6a8:	01812a03          	lw	s4,24(sp)
    d6ac:	01412a83          	lw	s5,20(sp)
    d6b0:	01012b03          	lw	s6,16(sp)
    d6b4:	00c12b83          	lw	s7,12(sp)
    d6b8:	00812c03          	lw	s8,8(sp)
    d6bc:	00070513          	mv	a0,a4
    d6c0:	00078593          	mv	a1,a5
    d6c4:	03010113          	add	sp,sp,48
    d6c8:	00008067          	ret
    d6cc:	01546733          	or	a4,s0,s5
    d6d0:	7ffc0313          	add	t1,s8,2047
    d6d4:	3c070663          	beqz	a4,daa0 <__muldf3+0x5cc>
    d6d8:	00001737          	lui	a4,0x1
    d6dc:	01394833          	xor	a6,s2,s3
    d6e0:	80070713          	add	a4,a4,-2048 # 800 <main+0x530>
    d6e4:	003b6b13          	or	s6,s6,3
    d6e8:	00a00693          	li	a3,10
    d6ec:	00080593          	mv	a1,a6
    d6f0:	00ec08b3          	add	a7,s8,a4
    d6f4:	4366cc63          	blt	a3,s6,db2c <__muldf3+0x658>
    d6f8:	00300693          	li	a3,3
    d6fc:	00100613          	li	a2,1
    d700:	01661633          	sll	a2,a2,s6
    d704:	53067713          	and	a4,a2,1328
    d708:	f4071ae3          	bnez	a4,d65c <__muldf3+0x188>
    d70c:	24067793          	and	a5,a2,576
    d710:	48079063          	bnez	a5,db90 <__muldf3+0x6bc>
    d714:	08867613          	and	a2,a2,136
    d718:	38061e63          	bnez	a2,dab4 <__muldf3+0x5e0>
    d71c:	00010fb7          	lui	t6,0x10
    d720:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    d724:	005a7f33          	and	t5,s4,t0
    d728:	005e72b3          	and	t0,t3,t0
    d72c:	010a5a13          	srl	s4,s4,0x10
    d730:	010e5e13          	srl	t3,t3,0x10
    d734:	000f0513          	mv	a0,t5
    d738:	00028593          	mv	a1,t0
    d73c:	460010ef          	jal	eb9c <__mulsi3>
    d740:	00050713          	mv	a4,a0
    d744:	000e0593          	mv	a1,t3
    d748:	000f0513          	mv	a0,t5
    d74c:	450010ef          	jal	eb9c <__mulsi3>
    d750:	00050793          	mv	a5,a0
    d754:	00028593          	mv	a1,t0
    d758:	000a0513          	mv	a0,s4
    d75c:	440010ef          	jal	eb9c <__mulsi3>
    d760:	00050e93          	mv	t4,a0
    d764:	000e0593          	mv	a1,t3
    d768:	000a0513          	mv	a0,s4
    d76c:	430010ef          	jal	eb9c <__mulsi3>
    d770:	01d786b3          	add	a3,a5,t4
    d774:	01075393          	srl	t2,a4,0x10
    d778:	00d383b3          	add	t2,t2,a3
    d77c:	00050793          	mv	a5,a0
    d780:	01d3f463          	bgeu	t2,t4,d788 <__muldf3+0x2b4>
    d784:	01f507b3          	add	a5,a0,t6
    d788:	000109b7          	lui	s3,0x10
    d78c:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    d790:	0123feb3          	and	t4,t2,s2
    d794:	01277733          	and	a4,a4,s2
    d798:	010e9e93          	sll	t4,t4,0x10
    d79c:	01247933          	and	s2,s0,s2
    d7a0:	0103d393          	srl	t2,t2,0x10
    d7a4:	00ee8eb3          	add	t4,t4,a4
    d7a8:	01045413          	srl	s0,s0,0x10
    d7ac:	000f0513          	mv	a0,t5
    d7b0:	00090593          	mv	a1,s2
    d7b4:	3e8010ef          	jal	eb9c <__mulsi3>
    d7b8:	00050f93          	mv	t6,a0
    d7bc:	00040593          	mv	a1,s0
    d7c0:	000f0513          	mv	a0,t5
    d7c4:	3d8010ef          	jal	eb9c <__mulsi3>
    d7c8:	00050713          	mv	a4,a0
    d7cc:	00090593          	mv	a1,s2
    d7d0:	000a0513          	mv	a0,s4
    d7d4:	3c8010ef          	jal	eb9c <__mulsi3>
    d7d8:	00050f13          	mv	t5,a0
    d7dc:	00040593          	mv	a1,s0
    d7e0:	000a0513          	mv	a0,s4
    d7e4:	3b8010ef          	jal	eb9c <__mulsi3>
    d7e8:	010fd693          	srl	a3,t6,0x10
    d7ec:	01e70733          	add	a4,a4,t5
    d7f0:	00e686b3          	add	a3,a3,a4
    d7f4:	01e6f463          	bgeu	a3,t5,d7fc <__muldf3+0x328>
    d7f8:	01350533          	add	a0,a0,s3
    d7fc:	00010a37          	lui	s4,0x10
    d800:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    d804:	01e6f733          	and	a4,a3,t5
    d808:	01efffb3          	and	t6,t6,t5
    d80c:	01071713          	sll	a4,a4,0x10
    d810:	01f70733          	add	a4,a4,t6
    d814:	01e4ff33          	and	t5,s1,t5
    d818:	0106d693          	srl	a3,a3,0x10
    d81c:	00a68fb3          	add	t6,a3,a0
    d820:	00e383b3          	add	t2,t2,a4
    d824:	0104d493          	srl	s1,s1,0x10
    d828:	000f0513          	mv	a0,t5
    d82c:	00028593          	mv	a1,t0
    d830:	36c010ef          	jal	eb9c <__mulsi3>
    d834:	00050a93          	mv	s5,a0
    d838:	000e0593          	mv	a1,t3
    d83c:	000f0513          	mv	a0,t5
    d840:	35c010ef          	jal	eb9c <__mulsi3>
    d844:	00050993          	mv	s3,a0
    d848:	00028593          	mv	a1,t0
    d84c:	00048513          	mv	a0,s1
    d850:	34c010ef          	jal	eb9c <__mulsi3>
    d854:	00050293          	mv	t0,a0
    d858:	000e0593          	mv	a1,t3
    d85c:	00048513          	mv	a0,s1
    d860:	33c010ef          	jal	eb9c <__mulsi3>
    d864:	010ad613          	srl	a2,s5,0x10
    d868:	005989b3          	add	s3,s3,t0
    d86c:	01360633          	add	a2,a2,s3
    d870:	00567463          	bgeu	a2,t0,d878 <__muldf3+0x3a4>
    d874:	01450533          	add	a0,a0,s4
    d878:	00010a37          	lui	s4,0x10
    d87c:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    d880:	00d672b3          	and	t0,a2,a3
    d884:	00dafab3          	and	s5,s5,a3
    d888:	01065613          	srl	a2,a2,0x10
    d88c:	01029293          	sll	t0,t0,0x10
    d890:	00a60e33          	add	t3,a2,a0
    d894:	015282b3          	add	t0,t0,s5
    d898:	000f0513          	mv	a0,t5
    d89c:	00090593          	mv	a1,s2
    d8a0:	2fc010ef          	jal	eb9c <__mulsi3>
    d8a4:	00050993          	mv	s3,a0
    d8a8:	00040593          	mv	a1,s0
    d8ac:	000f0513          	mv	a0,t5
    d8b0:	2ec010ef          	jal	eb9c <__mulsi3>
    d8b4:	00050f13          	mv	t5,a0
    d8b8:	00090593          	mv	a1,s2
    d8bc:	00048513          	mv	a0,s1
    d8c0:	2dc010ef          	jal	eb9c <__mulsi3>
    d8c4:	00050913          	mv	s2,a0
    d8c8:	00040593          	mv	a1,s0
    d8cc:	00048513          	mv	a0,s1
    d8d0:	2cc010ef          	jal	eb9c <__mulsi3>
    d8d4:	012f06b3          	add	a3,t5,s2
    d8d8:	0109d593          	srl	a1,s3,0x10
    d8dc:	00d58433          	add	s0,a1,a3
    d8e0:	00050f13          	mv	t5,a0
    d8e4:	01247463          	bgeu	s0,s2,d8ec <__muldf3+0x418>
    d8e8:	01450f33          	add	t5,a0,s4
    d8ec:	00010637          	lui	a2,0x10
    d8f0:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x7f7>
    d8f4:	00c476b3          	and	a3,s0,a2
    d8f8:	00c9f9b3          	and	s3,s3,a2
    d8fc:	01069693          	sll	a3,a3,0x10
    d900:	007787b3          	add	a5,a5,t2
    d904:	013686b3          	add	a3,a3,s3
    d908:	01f685b3          	add	a1,a3,t6
    d90c:	00e7b733          	sltu	a4,a5,a4
    d910:	00e58733          	add	a4,a1,a4
    d914:	005782b3          	add	t0,a5,t0
    d918:	01c70633          	add	a2,a4,t3
    d91c:	00f2b7b3          	sltu	a5,t0,a5
    d920:	00f607b3          	add	a5,a2,a5
    d924:	00d5b6b3          	sltu	a3,a1,a3
    d928:	00b735b3          	sltu	a1,a4,a1
    d92c:	00b6e6b3          	or	a3,a3,a1
    d930:	00e63733          	sltu	a4,a2,a4
    d934:	01045593          	srl	a1,s0,0x10
    d938:	00c7b633          	sltu	a2,a5,a2
    d93c:	00b686b3          	add	a3,a3,a1
    d940:	00929a13          	sll	s4,t0,0x9
    d944:	00c76733          	or	a4,a4,a2
    d948:	00d70733          	add	a4,a4,a3
    d94c:	01da6a33          	or	s4,s4,t4
    d950:	01e70733          	add	a4,a4,t5
    d954:	01403a33          	snez	s4,s4
    d958:	0172d293          	srl	t0,t0,0x17
    d95c:	00971713          	sll	a4,a4,0x9
    d960:	0177d693          	srl	a3,a5,0x17
    d964:	005a6a33          	or	s4,s4,t0
    d968:	00979793          	sll	a5,a5,0x9
    d96c:	00fa6a33          	or	s4,s4,a5
    d970:	00771793          	sll	a5,a4,0x7
    d974:	00d764b3          	or	s1,a4,a3
    d978:	0207d063          	bgez	a5,d998 <__muldf3+0x4c4>
    d97c:	001a5793          	srl	a5,s4,0x1
    d980:	001a7a13          	and	s4,s4,1
    d984:	01f49713          	sll	a4,s1,0x1f
    d988:	0147e7b3          	or	a5,a5,s4
    d98c:	00e7ea33          	or	s4,a5,a4
    d990:	0014d493          	srl	s1,s1,0x1
    d994:	00088313          	mv	t1,a7
    d998:	3ff30793          	add	a5,t1,1023
    d99c:	12f05663          	blez	a5,dac8 <__muldf3+0x5f4>
    d9a0:	007a7713          	and	a4,s4,7
    d9a4:	02070063          	beqz	a4,d9c4 <__muldf3+0x4f0>
    d9a8:	00fa7713          	and	a4,s4,15
    d9ac:	00400693          	li	a3,4
    d9b0:	00d70a63          	beq	a4,a3,d9c4 <__muldf3+0x4f0>
    d9b4:	004a0713          	add	a4,s4,4
    d9b8:	01473a33          	sltu	s4,a4,s4
    d9bc:	014484b3          	add	s1,s1,s4
    d9c0:	00070a13          	mv	s4,a4
    d9c4:	00749713          	sll	a4,s1,0x7
    d9c8:	00075a63          	bgez	a4,d9dc <__muldf3+0x508>
    d9cc:	ff0007b7          	lui	a5,0xff000
    d9d0:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    d9d4:	00f4f4b3          	and	s1,s1,a5
    d9d8:	40030793          	add	a5,t1,1024
    d9dc:	7fe00713          	li	a4,2046
    d9e0:	1cf74463          	blt	a4,a5,dba8 <__muldf3+0x6d4>
    d9e4:	003a5a13          	srl	s4,s4,0x3
    d9e8:	01d49713          	sll	a4,s1,0x1d
    d9ec:	00949693          	sll	a3,s1,0x9
    d9f0:	01476733          	or	a4,a4,s4
    d9f4:	00c6d693          	srl	a3,a3,0xc
    d9f8:	7ff7f793          	and	a5,a5,2047
    d9fc:	c89ff06f          	j	d684 <__muldf3+0x1b0>
    da00:	00a4ea33          	or	s4,s1,a0
    da04:	060a0863          	beqz	s4,da74 <__muldf3+0x5a0>
    da08:	12048e63          	beqz	s1,db44 <__muldf3+0x670>
    da0c:	00048513          	mv	a0,s1
    da10:	2fc010ef          	jal	ed0c <__clzsi2>
    da14:	00050713          	mv	a4,a0
    da18:	ff550693          	add	a3,a0,-11
    da1c:	01d00793          	li	a5,29
    da20:	ff870a13          	add	s4,a4,-8
    da24:	40d787b3          	sub	a5,a5,a3
    da28:	00f457b3          	srl	a5,s0,a5
    da2c:	014496b3          	sll	a3,s1,s4
    da30:	00d7e4b3          	or	s1,a5,a3
    da34:	01441a33          	sll	s4,s0,s4
    da38:	c0d00793          	li	a5,-1011
    da3c:	40e78c33          	sub	s8,a5,a4
    da40:	00000b13          	li	s6,0
    da44:	00000b93          	li	s7,0
    da48:	b09ff06f          	j	d550 <__muldf3+0x7c>
    da4c:	00058813          	mv	a6,a1
    da50:	7ff00793          	li	a5,2047
    da54:	00000693          	li	a3,0
    da58:	00000713          	li	a4,0
    da5c:	c29ff06f          	j	d684 <__muldf3+0x1b0>
    da60:	00050a13          	mv	s4,a0
    da64:	00c00b13          	li	s6,12
    da68:	7ff00c13          	li	s8,2047
    da6c:	00300b93          	li	s7,3
    da70:	ae1ff06f          	j	d550 <__muldf3+0x7c>
    da74:	00000493          	li	s1,0
    da78:	00400b13          	li	s6,4
    da7c:	00000c13          	li	s8,0
    da80:	00100b93          	li	s7,1
    da84:	acdff06f          	j	d550 <__muldf3+0x7c>
    da88:	001b6b13          	or	s6,s6,1
    da8c:	000c0313          	mv	t1,s8
    da90:	00000413          	li	s0,0
    da94:	00000e13          	li	t3,0
    da98:	00100693          	li	a3,1
    da9c:	afdff06f          	j	d598 <__muldf3+0xc4>
    daa0:	002b6b13          	or	s6,s6,2
    daa4:	00000413          	li	s0,0
    daa8:	00000e13          	li	t3,0
    daac:	00200693          	li	a3,2
    dab0:	ae9ff06f          	j	d598 <__muldf3+0xc4>
    dab4:	00040493          	mv	s1,s0
    dab8:	000e0a13          	mv	s4,t3
    dabc:	00068b93          	mv	s7,a3
    dac0:	00098593          	mv	a1,s3
    dac4:	b99ff06f          	j	d65c <__muldf3+0x188>
    dac8:	00100713          	li	a4,1
    dacc:	10079063          	bnez	a5,dbcc <__muldf3+0x6f8>
    dad0:	41e30313          	add	t1,t1,1054
    dad4:	006a1633          	sll	a2,s4,t1
    dad8:	00c03633          	snez	a2,a2
    dadc:	00649333          	sll	t1,s1,t1
    dae0:	00ea5a33          	srl	s4,s4,a4
    dae4:	00666633          	or	a2,a2,t1
    dae8:	01466633          	or	a2,a2,s4
    daec:	00767793          	and	a5,a2,7
    daf0:	00e4d5b3          	srl	a1,s1,a4
    daf4:	02078063          	beqz	a5,db14 <__muldf3+0x640>
    daf8:	00f67793          	and	a5,a2,15
    dafc:	00400713          	li	a4,4
    db00:	00e78a63          	beq	a5,a4,db14 <__muldf3+0x640>
    db04:	00460793          	add	a5,a2,4
    db08:	00c7b633          	sltu	a2,a5,a2
    db0c:	00c585b3          	add	a1,a1,a2
    db10:	00078613          	mv	a2,a5
    db14:	00859513          	sll	a0,a1,0x8
    db18:	00100793          	li	a5,1
    db1c:	00000693          	li	a3,0
    db20:	00000713          	li	a4,0
    db24:	b60540e3          	bltz	a0,d684 <__muldf3+0x1b0>
    db28:	10c0006f          	j	dc34 <__muldf3+0x760>
    db2c:	00f00713          	li	a4,15
    db30:	12eb1063          	bne	s6,a4,dc50 <__muldf3+0x77c>
    db34:	00000813          	li	a6,0
    db38:	000806b7          	lui	a3,0x80
    db3c:	00000713          	li	a4,0
    db40:	b45ff06f          	j	d684 <__muldf3+0x1b0>
    db44:	1c8010ef          	jal	ed0c <__clzsi2>
    db48:	01550693          	add	a3,a0,21
    db4c:	01c00793          	li	a5,28
    db50:	02050713          	add	a4,a0,32
    db54:	ecd7d4e3          	bge	a5,a3,da1c <__muldf3+0x548>
    db58:	ff850513          	add	a0,a0,-8
    db5c:	00000a13          	li	s4,0
    db60:	00a414b3          	sll	s1,s0,a0
    db64:	ed5ff06f          	j	da38 <__muldf3+0x564>
    db68:	000a8513          	mv	a0,s5
    db6c:	1a0010ef          	jal	ed0c <__clzsi2>
    db70:	01550713          	add	a4,a0,21
    db74:	01c00793          	li	a5,28
    db78:	02050313          	add	t1,a0,32
    db7c:	aae7d4e3          	bge	a5,a4,d624 <__muldf3+0x150>
    db80:	ff850513          	add	a0,a0,-8
    db84:	00000e13          	li	t3,0
    db88:	00aa9433          	sll	s0,s5,a0
    db8c:	ab5ff06f          	j	d640 <__muldf3+0x16c>
    db90:	00000813          	li	a6,0
    db94:	7ff00793          	li	a5,2047
    db98:	000806b7          	lui	a3,0x80
    db9c:	ae9ff06f          	j	d684 <__muldf3+0x1b0>
    dba0:	00088313          	mv	t1,a7
    dba4:	df5ff06f          	j	d998 <__muldf3+0x4c4>
    dba8:	7ff00793          	li	a5,2047
    dbac:	00000693          	li	a3,0
    dbb0:	00000713          	li	a4,0
    dbb4:	ad1ff06f          	j	d684 <__muldf3+0x1b0>
    dbb8:	00000813          	li	a6,0
    dbbc:	7ff00793          	li	a5,2047
    dbc0:	000806b7          	lui	a3,0x80
    dbc4:	00000713          	li	a4,0
    dbc8:	abdff06f          	j	d684 <__muldf3+0x1b0>
    dbcc:	40f70733          	sub	a4,a4,a5
    dbd0:	03800693          	li	a3,56
    dbd4:	aae6c2e3          	blt	a3,a4,d678 <__muldf3+0x1a4>
    dbd8:	01f00693          	li	a3,31
    dbdc:	eee6dae3          	bge	a3,a4,dad0 <__muldf3+0x5fc>
    dbe0:	fe100693          	li	a3,-31
    dbe4:	40f687b3          	sub	a5,a3,a5
    dbe8:	02000693          	li	a3,32
    dbec:	00f4d7b3          	srl	a5,s1,a5
    dbf0:	00d70863          	beq	a4,a3,dc00 <__muldf3+0x72c>
    dbf4:	43e30313          	add	t1,t1,1086
    dbf8:	00649333          	sll	t1,s1,t1
    dbfc:	006a6a33          	or	s4,s4,t1
    dc00:	01403633          	snez	a2,s4
    dc04:	00f66633          	or	a2,a2,a5
    dc08:	00767713          	and	a4,a2,7
    dc0c:	00000693          	li	a3,0
    dc10:	02070863          	beqz	a4,dc40 <__muldf3+0x76c>
    dc14:	00f67793          	and	a5,a2,15
    dc18:	00400713          	li	a4,4
    dc1c:	00000593          	li	a1,0
    dc20:	00e78a63          	beq	a5,a4,dc34 <__muldf3+0x760>
    dc24:	00460793          	add	a5,a2,4
    dc28:	00c7b633          	sltu	a2,a5,a2
    dc2c:	00c035b3          	snez	a1,a2
    dc30:	00078613          	mv	a2,a5
    dc34:	00959693          	sll	a3,a1,0x9
    dc38:	01d59713          	sll	a4,a1,0x1d
    dc3c:	00c6d693          	srl	a3,a3,0xc
    dc40:	00365613          	srl	a2,a2,0x3
    dc44:	00e66733          	or	a4,a2,a4
    dc48:	00000793          	li	a5,0
    dc4c:	a39ff06f          	j	d684 <__muldf3+0x1b0>
    dc50:	00040493          	mv	s1,s0
    dc54:	000a8a13          	mv	s4,s5
    dc58:	00300b93          	li	s7,3
    dc5c:	00098593          	mv	a1,s3
    dc60:	9fdff06f          	j	d65c <__muldf3+0x188>

0000dc64 <__subdf3>:
    dc64:	001007b7          	lui	a5,0x100
    dc68:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    dc6c:	fe010113          	add	sp,sp,-32
    dc70:	00b7f8b3          	and	a7,a5,a1
    dc74:	00d7f833          	and	a6,a5,a3
    dc78:	0146d793          	srl	a5,a3,0x14
    dc7c:	00389893          	sll	a7,a7,0x3
    dc80:	00812c23          	sw	s0,24(sp)
    dc84:	01312623          	sw	s3,12(sp)
    dc88:	01f5d413          	srl	s0,a1,0x1f
    dc8c:	0145d993          	srl	s3,a1,0x14
    dc90:	01d55713          	srl	a4,a0,0x1d
    dc94:	00381813          	sll	a6,a6,0x3
    dc98:	01d65593          	srl	a1,a2,0x1d
    dc9c:	00112e23          	sw	ra,28(sp)
    dca0:	00912a23          	sw	s1,20(sp)
    dca4:	01212823          	sw	s2,16(sp)
    dca8:	7ff7ff13          	and	t5,a5,2047
    dcac:	7ff00313          	li	t1,2047
    dcb0:	01176733          	or	a4,a4,a7
    dcb4:	7ff9f993          	and	s3,s3,2047
    dcb8:	00040e13          	mv	t3,s0
    dcbc:	00351893          	sll	a7,a0,0x3
    dcc0:	01f6d693          	srl	a3,a3,0x1f
    dcc4:	0105e5b3          	or	a1,a1,a6
    dcc8:	00361e93          	sll	t4,a2,0x3
    dccc:	206f0c63          	beq	t5,t1,dee4 <__subdf3+0x280>
    dcd0:	0016c693          	xor	a3,a3,1
    dcd4:	41e987b3          	sub	a5,s3,t5
    dcd8:	16d40263          	beq	s0,a3,de3c <__subdf3+0x1d8>
    dcdc:	00f05ae3          	blez	a5,e4f0 <__subdf3+0x88c>
    dce0:	240f0a63          	beqz	t5,df34 <__subdf3+0x2d0>
    dce4:	3c698463          	beq	s3,t1,e0ac <__subdf3+0x448>
    dce8:	03800693          	li	a3,56
    dcec:	00100513          	li	a0,1
    dcf0:	02f6ce63          	blt	a3,a5,dd2c <__subdf3+0xc8>
    dcf4:	008006b7          	lui	a3,0x800
    dcf8:	00d5e5b3          	or	a1,a1,a3
    dcfc:	01f00693          	li	a3,31
    dd00:	4ef6c463          	blt	a3,a5,e1e8 <__subdf3+0x584>
    dd04:	02000693          	li	a3,32
    dd08:	40f686b3          	sub	a3,a3,a5
    dd0c:	00d59533          	sll	a0,a1,a3
    dd10:	00fed633          	srl	a2,t4,a5
    dd14:	00de96b3          	sll	a3,t4,a3
    dd18:	00c56533          	or	a0,a0,a2
    dd1c:	00d036b3          	snez	a3,a3
    dd20:	00f5d7b3          	srl	a5,a1,a5
    dd24:	00d56533          	or	a0,a0,a3
    dd28:	40f70733          	sub	a4,a4,a5
    dd2c:	40a88533          	sub	a0,a7,a0
    dd30:	00a8b633          	sltu	a2,a7,a0
    dd34:	00050493          	mv	s1,a0
    dd38:	40c70933          	sub	s2,a4,a2
    dd3c:	00891793          	sll	a5,s2,0x8
    dd40:	3407d863          	bgez	a5,e090 <__subdf3+0x42c>
    dd44:	008007b7          	lui	a5,0x800
    dd48:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    dd4c:	00f97933          	and	s2,s2,a5
    dd50:	2e090663          	beqz	s2,e03c <__subdf3+0x3d8>
    dd54:	00090513          	mv	a0,s2
    dd58:	7b5000ef          	jal	ed0c <__clzsi2>
    dd5c:	ff850793          	add	a5,a0,-8
    dd60:	02000693          	li	a3,32
    dd64:	40f68733          	sub	a4,a3,a5
    dd68:	00e4d733          	srl	a4,s1,a4
    dd6c:	00f91933          	sll	s2,s2,a5
    dd70:	01276733          	or	a4,a4,s2
    dd74:	00f494b3          	sll	s1,s1,a5
    dd78:	3f37c463          	blt	a5,s3,e160 <__subdf3+0x4fc>
    dd7c:	413787b3          	sub	a5,a5,s3
    dd80:	00178793          	add	a5,a5,1
    dd84:	40f686b3          	sub	a3,a3,a5
    dd88:	00d49633          	sll	a2,s1,a3
    dd8c:	00f4d933          	srl	s2,s1,a5
    dd90:	00c03633          	snez	a2,a2
    dd94:	00c96633          	or	a2,s2,a2
    dd98:	00d716b3          	sll	a3,a4,a3
    dd9c:	00c6e4b3          	or	s1,a3,a2
    dda0:	00f75933          	srl	s2,a4,a5
    dda4:	00000993          	li	s3,0
    dda8:	0074f793          	and	a5,s1,7
    ddac:	02078063          	beqz	a5,ddcc <__subdf3+0x168>
    ddb0:	00f4f793          	and	a5,s1,15
    ddb4:	00400713          	li	a4,4
    ddb8:	00e78a63          	beq	a5,a4,ddcc <__subdf3+0x168>
    ddbc:	00448793          	add	a5,s1,4
    ddc0:	0097b533          	sltu	a0,a5,s1
    ddc4:	00a90933          	add	s2,s2,a0
    ddc8:	00078493          	mv	s1,a5
    ddcc:	00891793          	sll	a5,s2,0x8
    ddd0:	6c07d063          	bgez	a5,e490 <__subdf3+0x82c>
    ddd4:	00198793          	add	a5,s3,1
    ddd8:	7ff00713          	li	a4,2047
    dddc:	24e78663          	beq	a5,a4,e028 <__subdf3+0x3c4>
    dde0:	ff800737          	lui	a4,0xff800
    dde4:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dde8:	00e97733          	and	a4,s2,a4
    ddec:	7ff7f793          	and	a5,a5,2047
    ddf0:	01d71813          	sll	a6,a4,0x1d
    ddf4:	0034d513          	srl	a0,s1,0x3
    ddf8:	00971713          	sll	a4,a4,0x9
    ddfc:	00a86833          	or	a6,a6,a0
    de00:	00c75713          	srl	a4,a4,0xc
    de04:	00147e13          	and	t3,s0,1
    de08:	01c12083          	lw	ra,28(sp)
    de0c:	01812403          	lw	s0,24(sp)
    de10:	01479793          	sll	a5,a5,0x14
    de14:	00e7e7b3          	or	a5,a5,a4
    de18:	01fe1713          	sll	a4,t3,0x1f
    de1c:	00e7e7b3          	or	a5,a5,a4
    de20:	01412483          	lw	s1,20(sp)
    de24:	01012903          	lw	s2,16(sp)
    de28:	00c12983          	lw	s3,12(sp)
    de2c:	00080513          	mv	a0,a6
    de30:	00078593          	mv	a1,a5
    de34:	02010113          	add	sp,sp,32
    de38:	00008067          	ret
    de3c:	70f05263          	blez	a5,e540 <__subdf3+0x8dc>
    de40:	1c0f1663          	bnez	t5,e00c <__subdf3+0x3a8>
    de44:	01d5e6b3          	or	a3,a1,t4
    de48:	26068e63          	beqz	a3,e0c4 <__subdf3+0x460>
    de4c:	fff78693          	add	a3,a5,-1
    de50:	46068863          	beqz	a3,e2c0 <__subdf3+0x65c>
    de54:	24678c63          	beq	a5,t1,e0ac <__subdf3+0x448>
    de58:	03800793          	li	a5,56
    de5c:	00100913          	li	s2,1
    de60:	02d7cc63          	blt	a5,a3,de98 <__subdf3+0x234>
    de64:	00068793          	mv	a5,a3
    de68:	01f00693          	li	a3,31
    de6c:	48f6ca63          	blt	a3,a5,e300 <__subdf3+0x69c>
    de70:	02000693          	li	a3,32
    de74:	40f686b3          	sub	a3,a3,a5
    de78:	00d59933          	sll	s2,a1,a3
    de7c:	00fed633          	srl	a2,t4,a5
    de80:	00de96b3          	sll	a3,t4,a3
    de84:	00c96933          	or	s2,s2,a2
    de88:	00d036b3          	snez	a3,a3
    de8c:	00f5d7b3          	srl	a5,a1,a5
    de90:	00d96933          	or	s2,s2,a3
    de94:	00f70733          	add	a4,a4,a5
    de98:	01190633          	add	a2,s2,a7
    de9c:	01263933          	sltu	s2,a2,s2
    dea0:	00060493          	mv	s1,a2
    dea4:	00e90933          	add	s2,s2,a4
    dea8:	00891793          	sll	a5,s2,0x8
    deac:	1e07d263          	bgez	a5,e090 <__subdf3+0x42c>
    deb0:	00198993          	add	s3,s3,1
    deb4:	7ff00793          	li	a5,2047
    deb8:	16f98863          	beq	s3,a5,e028 <__subdf3+0x3c4>
    debc:	ff8007b7          	lui	a5,0xff800
    dec0:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    dec4:	0014f513          	and	a0,s1,1
    dec8:	00f977b3          	and	a5,s2,a5
    decc:	0014d713          	srl	a4,s1,0x1
    ded0:	00a76733          	or	a4,a4,a0
    ded4:	01f79513          	sll	a0,a5,0x1f
    ded8:	00e564b3          	or	s1,a0,a4
    dedc:	0017d913          	srl	s2,a5,0x1
    dee0:	ec9ff06f          	j	dda8 <__subdf3+0x144>
    dee4:	01d5e833          	or	a6,a1,t4
    dee8:	80198313          	add	t1,s3,-2047
    deec:	06080863          	beqz	a6,df5c <__subdf3+0x2f8>
    def0:	06d40a63          	beq	s0,a3,df64 <__subdf3+0x300>
    def4:	0e030463          	beqz	t1,dfdc <__subdf3+0x378>
    def8:	26098e63          	beqz	s3,e174 <__subdf3+0x510>
    defc:	00361513          	sll	a0,a2,0x3
    df00:	00355513          	srl	a0,a0,0x3
    df04:	00068413          	mv	s0,a3
    df08:	00058713          	mv	a4,a1
    df0c:	01d71813          	sll	a6,a4,0x1d
    df10:	00a86833          	or	a6,a6,a0
    df14:	00375713          	srl	a4,a4,0x3
    df18:	01076733          	or	a4,a4,a6
    df1c:	10070663          	beqz	a4,e028 <__subdf3+0x3c4>
    df20:	00000e13          	li	t3,0
    df24:	7ff00793          	li	a5,2047
    df28:	00080737          	lui	a4,0x80
    df2c:	00000813          	li	a6,0
    df30:	ed9ff06f          	j	de08 <__subdf3+0x1a4>
    df34:	01d5e6b3          	or	a3,a1,t4
    df38:	18068663          	beqz	a3,e0c4 <__subdf3+0x460>
    df3c:	fff78693          	add	a3,a5,-1
    df40:	3a068263          	beqz	a3,e2e4 <__subdf3+0x680>
    df44:	16678463          	beq	a5,t1,e0ac <__subdf3+0x448>
    df48:	03800793          	li	a5,56
    df4c:	00100513          	li	a0,1
    df50:	dcd7cee3          	blt	a5,a3,dd2c <__subdf3+0xc8>
    df54:	00068793          	mv	a5,a3
    df58:	da5ff06f          	j	dcfc <__subdf3+0x98>
    df5c:	0016c693          	xor	a3,a3,1
    df60:	f8d41ae3          	bne	s0,a3,def4 <__subdf3+0x290>
    df64:	18030863          	beqz	t1,e0f4 <__subdf3+0x490>
    df68:	2c099063          	bnez	s3,e228 <__subdf3+0x5c4>
    df6c:	7ff00793          	li	a5,2047
    df70:	011766b3          	or	a3,a4,a7
    df74:	48068863          	beqz	a3,e404 <__subdf3+0x7a0>
    df78:	fff78693          	add	a3,a5,-1
    df7c:	34068263          	beqz	a3,e2c0 <__subdf3+0x65c>
    df80:	7ff00513          	li	a0,2047
    df84:	2aa78263          	beq	a5,a0,e228 <__subdf3+0x5c4>
    df88:	03800793          	li	a5,56
    df8c:	00100913          	li	s2,1
    df90:	02d7ca63          	blt	a5,a3,dfc4 <__subdf3+0x360>
    df94:	01f00793          	li	a5,31
    df98:	4cd7c663          	blt	a5,a3,e464 <__subdf3+0x800>
    df9c:	02000793          	li	a5,32
    dfa0:	40d787b3          	sub	a5,a5,a3
    dfa4:	00f71933          	sll	s2,a4,a5
    dfa8:	00d8d633          	srl	a2,a7,a3
    dfac:	00f897b3          	sll	a5,a7,a5
    dfb0:	00c96933          	or	s2,s2,a2
    dfb4:	00f037b3          	snez	a5,a5
    dfb8:	00d756b3          	srl	a3,a4,a3
    dfbc:	00f96933          	or	s2,s2,a5
    dfc0:	00d585b3          	add	a1,a1,a3
    dfc4:	01d90733          	add	a4,s2,t4
    dfc8:	01273933          	sltu	s2,a4,s2
    dfcc:	00070493          	mv	s1,a4
    dfd0:	00b90933          	add	s2,s2,a1
    dfd4:	000f0993          	mv	s3,t5
    dfd8:	ed1ff06f          	j	dea8 <__subdf3+0x244>
    dfdc:	00198793          	add	a5,s3,1
    dfe0:	7fe7f793          	and	a5,a5,2046
    dfe4:	14079463          	bnez	a5,e12c <__subdf3+0x4c8>
    dfe8:	01d5e833          	or	a6,a1,t4
    dfec:	011767b3          	or	a5,a4,a7
    dff0:	2a099463          	bnez	s3,e298 <__subdf3+0x634>
    dff4:	38078e63          	beqz	a5,e390 <__subdf3+0x72c>
    dff8:	3c081063          	bnez	a6,e3b8 <__subdf3+0x754>
    dffc:	00351513          	sll	a0,a0,0x3
    e000:	00355913          	srl	s2,a0,0x3
    e004:	00000793          	li	a5,0
    e008:	1140006f          	j	e11c <__subdf3+0x4b8>
    e00c:	0a698063          	beq	s3,t1,e0ac <__subdf3+0x448>
    e010:	03800693          	li	a3,56
    e014:	00100913          	li	s2,1
    e018:	e8f6c0e3          	blt	a3,a5,de98 <__subdf3+0x234>
    e01c:	008006b7          	lui	a3,0x800
    e020:	00d5e5b3          	or	a1,a1,a3
    e024:	e45ff06f          	j	de68 <__subdf3+0x204>
    e028:	00147e13          	and	t3,s0,1
    e02c:	7ff00793          	li	a5,2047
    e030:	00000713          	li	a4,0
    e034:	00000813          	li	a6,0
    e038:	dd1ff06f          	j	de08 <__subdf3+0x1a4>
    e03c:	00048513          	mv	a0,s1
    e040:	4cd000ef          	jal	ed0c <__clzsi2>
    e044:	01850793          	add	a5,a0,24
    e048:	01f00693          	li	a3,31
    e04c:	d0f6dae3          	bge	a3,a5,dd60 <__subdf3+0xfc>
    e050:	ff850713          	add	a4,a0,-8
    e054:	00e49733          	sll	a4,s1,a4
    e058:	1b37ce63          	blt	a5,s3,e214 <__subdf3+0x5b0>
    e05c:	413789b3          	sub	s3,a5,s3
    e060:	00198793          	add	a5,s3,1
    e064:	42f6de63          	bge	a3,a5,e4a0 <__subdf3+0x83c>
    e068:	fe198993          	add	s3,s3,-31
    e06c:	02000693          	li	a3,32
    e070:	013754b3          	srl	s1,a4,s3
    e074:	00d78c63          	beq	a5,a3,e08c <__subdf3+0x428>
    e078:	04000693          	li	a3,64
    e07c:	40f687b3          	sub	a5,a3,a5
    e080:	00f71733          	sll	a4,a4,a5
    e084:	00e03733          	snez	a4,a4
    e088:	00e4e4b3          	or	s1,s1,a4
    e08c:	00000993          	li	s3,0
    e090:	0074f793          	and	a5,s1,7
    e094:	d0079ee3          	bnez	a5,ddb0 <__subdf3+0x14c>
    e098:	00098793          	mv	a5,s3
    e09c:	0034d513          	srl	a0,s1,0x3
    e0a0:	00090713          	mv	a4,s2
    e0a4:	0280006f          	j	e0cc <__subdf3+0x468>
    e0a8:	e6081ce3          	bnez	a6,df20 <__subdf3+0x2bc>
    e0ac:	00351513          	sll	a0,a0,0x3
    e0b0:	01d71813          	sll	a6,a4,0x1d
    e0b4:	00355513          	srl	a0,a0,0x3
    e0b8:	00a86833          	or	a6,a6,a0
    e0bc:	00375713          	srl	a4,a4,0x3
    e0c0:	e59ff06f          	j	df18 <__subdf3+0x2b4>
    e0c4:	00351513          	sll	a0,a0,0x3
    e0c8:	00355513          	srl	a0,a0,0x3
    e0cc:	01d71813          	sll	a6,a4,0x1d
    e0d0:	7ff00693          	li	a3,2047
    e0d4:	00a86833          	or	a6,a6,a0
    e0d8:	00375713          	srl	a4,a4,0x3
    e0dc:	e2d78ee3          	beq	a5,a3,df18 <__subdf3+0x2b4>
    e0e0:	00c71713          	sll	a4,a4,0xc
    e0e4:	00c75713          	srl	a4,a4,0xc
    e0e8:	7ff7f793          	and	a5,a5,2047
    e0ec:	00147e13          	and	t3,s0,1
    e0f0:	d19ff06f          	j	de08 <__subdf3+0x1a4>
    e0f4:	00198693          	add	a3,s3,1
    e0f8:	7fe6f793          	and	a5,a3,2046
    e0fc:	12079e63          	bnez	a5,e238 <__subdf3+0x5d4>
    e100:	011767b3          	or	a5,a4,a7
    e104:	24099a63          	bnez	s3,e358 <__subdf3+0x6f4>
    e108:	30078663          	beqz	a5,e414 <__subdf3+0x7b0>
    e10c:	01d5e7b3          	or	a5,a1,t4
    e110:	30079a63          	bnez	a5,e424 <__subdf3+0x7c0>
    e114:	00351513          	sll	a0,a0,0x3
    e118:	00355913          	srl	s2,a0,0x3
    e11c:	01d71813          	sll	a6,a4,0x1d
    e120:	01286833          	or	a6,a6,s2
    e124:	00375713          	srl	a4,a4,0x3
    e128:	fb9ff06f          	j	e0e0 <__subdf3+0x47c>
    e12c:	41d88833          	sub	a6,a7,t4
    e130:	0108b7b3          	sltu	a5,a7,a6
    e134:	40b70933          	sub	s2,a4,a1
    e138:	40f90933          	sub	s2,s2,a5
    e13c:	00891793          	sll	a5,s2,0x8
    e140:	00080493          	mv	s1,a6
    e144:	1207c263          	bltz	a5,e268 <__subdf3+0x604>
    e148:	01286833          	or	a6,a6,s2
    e14c:	c00812e3          	bnez	a6,dd50 <__subdf3+0xec>
    e150:	00000e13          	li	t3,0
    e154:	00000793          	li	a5,0
    e158:	00000713          	li	a4,0
    e15c:	cadff06f          	j	de08 <__subdf3+0x1a4>
    e160:	ff800937          	lui	s2,0xff800
    e164:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e168:	40f989b3          	sub	s3,s3,a5
    e16c:	01277933          	and	s2,a4,s2
    e170:	c39ff06f          	j	dda8 <__subdf3+0x144>
    e174:	7ff00793          	li	a5,2047
    e178:	01176533          	or	a0,a4,a7
    e17c:	10050463          	beqz	a0,e284 <__subdf3+0x620>
    e180:	fff78813          	add	a6,a5,-1
    e184:	1e080263          	beqz	a6,e368 <__subdf3+0x704>
    e188:	7ff00513          	li	a0,2047
    e18c:	d6a788e3          	beq	a5,a0,defc <__subdf3+0x298>
    e190:	03800793          	li	a5,56
    e194:	00068413          	mv	s0,a3
    e198:	00100513          	li	a0,1
    e19c:	0307ca63          	blt	a5,a6,e1d0 <__subdf3+0x56c>
    e1a0:	01f00793          	li	a5,31
    e1a4:	1907c463          	blt	a5,a6,e32c <__subdf3+0x6c8>
    e1a8:	02000793          	li	a5,32
    e1ac:	410787b3          	sub	a5,a5,a6
    e1b0:	00f71533          	sll	a0,a4,a5
    e1b4:	0108d6b3          	srl	a3,a7,a6
    e1b8:	00f897b3          	sll	a5,a7,a5
    e1bc:	00d56533          	or	a0,a0,a3
    e1c0:	00f037b3          	snez	a5,a5
    e1c4:	01075833          	srl	a6,a4,a6
    e1c8:	00f56533          	or	a0,a0,a5
    e1cc:	410585b3          	sub	a1,a1,a6
    e1d0:	40ae8533          	sub	a0,t4,a0
    e1d4:	00aeb733          	sltu	a4,t4,a0
    e1d8:	00050493          	mv	s1,a0
    e1dc:	40e58933          	sub	s2,a1,a4
    e1e0:	000f0993          	mv	s3,t5
    e1e4:	b59ff06f          	j	dd3c <__subdf3+0xd8>
    e1e8:	fe078693          	add	a3,a5,-32
    e1ec:	02000613          	li	a2,32
    e1f0:	00d5d6b3          	srl	a3,a1,a3
    e1f4:	00c78a63          	beq	a5,a2,e208 <__subdf3+0x5a4>
    e1f8:	04000613          	li	a2,64
    e1fc:	40f607b3          	sub	a5,a2,a5
    e200:	00f597b3          	sll	a5,a1,a5
    e204:	00feeeb3          	or	t4,t4,a5
    e208:	01d03533          	snez	a0,t4
    e20c:	00d56533          	or	a0,a0,a3
    e210:	b1dff06f          	j	dd2c <__subdf3+0xc8>
    e214:	ff8006b7          	lui	a3,0xff800
    e218:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e21c:	40f987b3          	sub	a5,s3,a5
    e220:	00d77733          	and	a4,a4,a3
    e224:	ef9ff06f          	j	e11c <__subdf3+0x4b8>
    e228:	00361513          	sll	a0,a2,0x3
    e22c:	00355513          	srl	a0,a0,0x3
    e230:	00058713          	mv	a4,a1
    e234:	cd9ff06f          	j	df0c <__subdf3+0x2a8>
    e238:	7ff00793          	li	a5,2047
    e23c:	def686e3          	beq	a3,a5,e028 <__subdf3+0x3c4>
    e240:	01d88eb3          	add	t4,a7,t4
    e244:	011eb633          	sltu	a2,t4,a7
    e248:	00b707b3          	add	a5,a4,a1
    e24c:	00c787b3          	add	a5,a5,a2
    e250:	01f79513          	sll	a0,a5,0x1f
    e254:	001ede93          	srl	t4,t4,0x1
    e258:	01d564b3          	or	s1,a0,t4
    e25c:	0017d913          	srl	s2,a5,0x1
    e260:	00068993          	mv	s3,a3
    e264:	b45ff06f          	j	dda8 <__subdf3+0x144>
    e268:	411e8633          	sub	a2,t4,a7
    e26c:	40e587b3          	sub	a5,a1,a4
    e270:	00ceb733          	sltu	a4,t4,a2
    e274:	00060493          	mv	s1,a2
    e278:	40e78933          	sub	s2,a5,a4
    e27c:	00068413          	mv	s0,a3
    e280:	ad1ff06f          	j	dd50 <__subdf3+0xec>
    e284:	00361613          	sll	a2,a2,0x3
    e288:	00365513          	srl	a0,a2,0x3
    e28c:	00068413          	mv	s0,a3
    e290:	00058713          	mv	a4,a1
    e294:	e39ff06f          	j	e0cc <__subdf3+0x468>
    e298:	e00798e3          	bnez	a5,e0a8 <__subdf3+0x444>
    e29c:	22080663          	beqz	a6,e4c8 <__subdf3+0x864>
    e2a0:	0035d713          	srl	a4,a1,0x3
    e2a4:	00361613          	sll	a2,a2,0x3
    e2a8:	01d59593          	sll	a1,a1,0x1d
    e2ac:	00b76733          	or	a4,a4,a1
    e2b0:	00365613          	srl	a2,a2,0x3
    e2b4:	00c76733          	or	a4,a4,a2
    e2b8:	00068413          	mv	s0,a3
    e2bc:	c61ff06f          	j	df1c <__subdf3+0x2b8>
    e2c0:	01d88eb3          	add	t4,a7,t4
    e2c4:	00b705b3          	add	a1,a4,a1
    e2c8:	011eb633          	sltu	a2,t4,a7
    e2cc:	00c58933          	add	s2,a1,a2
    e2d0:	00891793          	sll	a5,s2,0x8
    e2d4:	000e8493          	mv	s1,t4
    e2d8:	0a07d863          	bgez	a5,e388 <__subdf3+0x724>
    e2dc:	00200993          	li	s3,2
    e2e0:	bddff06f          	j	debc <__subdf3+0x258>
    e2e4:	41d88eb3          	sub	t4,a7,t4
    e2e8:	40b705b3          	sub	a1,a4,a1
    e2ec:	01d8b633          	sltu	a2,a7,t4
    e2f0:	000e8493          	mv	s1,t4
    e2f4:	40c58933          	sub	s2,a1,a2
    e2f8:	00100993          	li	s3,1
    e2fc:	a41ff06f          	j	dd3c <__subdf3+0xd8>
    e300:	fe078693          	add	a3,a5,-32
    e304:	02000613          	li	a2,32
    e308:	00d5d6b3          	srl	a3,a1,a3
    e30c:	00c78a63          	beq	a5,a2,e320 <__subdf3+0x6bc>
    e310:	04000613          	li	a2,64
    e314:	40f607b3          	sub	a5,a2,a5
    e318:	00f597b3          	sll	a5,a1,a5
    e31c:	00feeeb3          	or	t4,t4,a5
    e320:	01d03933          	snez	s2,t4
    e324:	00d96933          	or	s2,s2,a3
    e328:	b71ff06f          	j	de98 <__subdf3+0x234>
    e32c:	fe080793          	add	a5,a6,-32
    e330:	02000693          	li	a3,32
    e334:	00f757b3          	srl	a5,a4,a5
    e338:	00d80a63          	beq	a6,a3,e34c <__subdf3+0x6e8>
    e33c:	04000693          	li	a3,64
    e340:	410686b3          	sub	a3,a3,a6
    e344:	00d71733          	sll	a4,a4,a3
    e348:	00e8e8b3          	or	a7,a7,a4
    e34c:	01103533          	snez	a0,a7
    e350:	00f56533          	or	a0,a0,a5
    e354:	e7dff06f          	j	e1d0 <__subdf3+0x56c>
    e358:	ec0788e3          	beqz	a5,e228 <__subdf3+0x5c4>
    e35c:	01d5eeb3          	or	t4,a1,t4
    e360:	bc0e90e3          	bnez	t4,df20 <__subdf3+0x2bc>
    e364:	d49ff06f          	j	e0ac <__subdf3+0x448>
    e368:	411e8633          	sub	a2,t4,a7
    e36c:	40e585b3          	sub	a1,a1,a4
    e370:	00ceb733          	sltu	a4,t4,a2
    e374:	00060493          	mv	s1,a2
    e378:	40e58933          	sub	s2,a1,a4
    e37c:	00068413          	mv	s0,a3
    e380:	00100993          	li	s3,1
    e384:	9b9ff06f          	j	dd3c <__subdf3+0xd8>
    e388:	00100793          	li	a5,1
    e38c:	d11ff06f          	j	e09c <__subdf3+0x438>
    e390:	dc0800e3          	beqz	a6,e150 <__subdf3+0x4ec>
    e394:	00361613          	sll	a2,a2,0x3
    e398:	00365793          	srl	a5,a2,0x3
    e39c:	01d59813          	sll	a6,a1,0x1d
    e3a0:	00959713          	sll	a4,a1,0x9
    e3a4:	00f86833          	or	a6,a6,a5
    e3a8:	00c75713          	srl	a4,a4,0xc
    e3ac:	00068e13          	mv	t3,a3
    e3b0:	00000793          	li	a5,0
    e3b4:	a55ff06f          	j	de08 <__subdf3+0x1a4>
    e3b8:	41d88933          	sub	s2,a7,t4
    e3bc:	0128b7b3          	sltu	a5,a7,s2
    e3c0:	40b70633          	sub	a2,a4,a1
    e3c4:	40f60633          	sub	a2,a2,a5
    e3c8:	00861793          	sll	a5,a2,0x8
    e3cc:	0e07d263          	bgez	a5,e4b0 <__subdf3+0x84c>
    e3d0:	411e8633          	sub	a2,t4,a7
    e3d4:	40e58733          	sub	a4,a1,a4
    e3d8:	00cebeb3          	sltu	t4,t4,a2
    e3dc:	41d70733          	sub	a4,a4,t4
    e3e0:	00871793          	sll	a5,a4,0x8
    e3e4:	00060493          	mv	s1,a2
    e3e8:	1207de63          	bgez	a5,e524 <__subdf3+0x8c0>
    e3ec:	ff8007b7          	lui	a5,0xff800
    e3f0:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e3f4:	00f77733          	and	a4,a4,a5
    e3f8:	00068413          	mv	s0,a3
    e3fc:	00100793          	li	a5,1
    e400:	9f1ff06f          	j	ddf0 <__subdf3+0x18c>
    e404:	00361613          	sll	a2,a2,0x3
    e408:	00365513          	srl	a0,a2,0x3
    e40c:	00058713          	mv	a4,a1
    e410:	cbdff06f          	j	e0cc <__subdf3+0x468>
    e414:	00361613          	sll	a2,a2,0x3
    e418:	00365913          	srl	s2,a2,0x3
    e41c:	00058713          	mv	a4,a1
    e420:	cfdff06f          	j	e11c <__subdf3+0x4b8>
    e424:	01d886b3          	add	a3,a7,t4
    e428:	00b707b3          	add	a5,a4,a1
    e42c:	0116b633          	sltu	a2,a3,a7
    e430:	00c787b3          	add	a5,a5,a2
    e434:	00879713          	sll	a4,a5,0x8
    e438:	0036d813          	srl	a6,a3,0x3
    e43c:	08075e63          	bgez	a4,e4d8 <__subdf3+0x874>
    e440:	ff800737          	lui	a4,0xff800
    e444:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e448:	00e7f7b3          	and	a5,a5,a4
    e44c:	01d79713          	sll	a4,a5,0x1d
    e450:	00979793          	sll	a5,a5,0x9
    e454:	01076833          	or	a6,a4,a6
    e458:	00c7d713          	srl	a4,a5,0xc
    e45c:	00100793          	li	a5,1
    e460:	9a9ff06f          	j	de08 <__subdf3+0x1a4>
    e464:	fe068793          	add	a5,a3,-32
    e468:	02000613          	li	a2,32
    e46c:	00f757b3          	srl	a5,a4,a5
    e470:	00c68a63          	beq	a3,a2,e484 <__subdf3+0x820>
    e474:	04000613          	li	a2,64
    e478:	40d606b3          	sub	a3,a2,a3
    e47c:	00d71733          	sll	a4,a4,a3
    e480:	00e8e8b3          	or	a7,a7,a4
    e484:	01103933          	snez	s2,a7
    e488:	00f96933          	or	s2,s2,a5
    e48c:	b39ff06f          	j	dfc4 <__subdf3+0x360>
    e490:	0034d513          	srl	a0,s1,0x3
    e494:	00098793          	mv	a5,s3
    e498:	00090713          	mv	a4,s2
    e49c:	c31ff06f          	j	e0cc <__subdf3+0x468>
    e4a0:	02000693          	li	a3,32
    e4a4:	40f686b3          	sub	a3,a3,a5
    e4a8:	00000613          	li	a2,0
    e4ac:	8e9ff06f          	j	dd94 <__subdf3+0x130>
    e4b0:	00c96833          	or	a6,s2,a2
    e4b4:	c8080ee3          	beqz	a6,e150 <__subdf3+0x4ec>
    e4b8:	00395913          	srl	s2,s2,0x3
    e4bc:	00000793          	li	a5,0
    e4c0:	00060713          	mv	a4,a2
    e4c4:	c59ff06f          	j	e11c <__subdf3+0x4b8>
    e4c8:	00000e13          	li	t3,0
    e4cc:	7ff00793          	li	a5,2047
    e4d0:	00080737          	lui	a4,0x80
    e4d4:	935ff06f          	j	de08 <__subdf3+0x1a4>
    e4d8:	01d79713          	sll	a4,a5,0x1d
    e4dc:	00979793          	sll	a5,a5,0x9
    e4e0:	01076833          	or	a6,a4,a6
    e4e4:	00c7d713          	srl	a4,a5,0xc
    e4e8:	00000793          	li	a5,0
    e4ec:	91dff06f          	j	de08 <__subdf3+0x1a4>
    e4f0:	ae0786e3          	beqz	a5,dfdc <__subdf3+0x378>
    e4f4:	413f0833          	sub	a6,t5,s3
    e4f8:	00080793          	mv	a5,a6
    e4fc:	c6098ee3          	beqz	s3,e178 <__subdf3+0x514>
    e500:	03800793          	li	a5,56
    e504:	0107ca63          	blt	a5,a6,e518 <__subdf3+0x8b4>
    e508:	008007b7          	lui	a5,0x800
    e50c:	00f76733          	or	a4,a4,a5
    e510:	00068413          	mv	s0,a3
    e514:	c8dff06f          	j	e1a0 <__subdf3+0x53c>
    e518:	00068413          	mv	s0,a3
    e51c:	00100513          	li	a0,1
    e520:	cb1ff06f          	j	e1d0 <__subdf3+0x56c>
    e524:	01d71813          	sll	a6,a4,0x1d
    e528:	00365613          	srl	a2,a2,0x3
    e52c:	00c86833          	or	a6,a6,a2
    e530:	00375713          	srl	a4,a4,0x3
    e534:	00000793          	li	a5,0
    e538:	00068413          	mv	s0,a3
    e53c:	ba5ff06f          	j	e0e0 <__subdf3+0x47c>
    e540:	ba078ae3          	beqz	a5,e0f4 <__subdf3+0x490>
    e544:	413f06b3          	sub	a3,t5,s3
    e548:	00099663          	bnez	s3,e554 <__subdf3+0x8f0>
    e54c:	00068793          	mv	a5,a3
    e550:	a21ff06f          	j	df70 <__subdf3+0x30c>
    e554:	03800793          	li	a5,56
    e558:	00100913          	li	s2,1
    e55c:	a6d7c4e3          	blt	a5,a3,dfc4 <__subdf3+0x360>
    e560:	008007b7          	lui	a5,0x800
    e564:	00f76733          	or	a4,a4,a5
    e568:	a2dff06f          	j	df94 <__subdf3+0x330>

0000e56c <__unorddf2>:
    e56c:	0145d713          	srl	a4,a1,0x14
    e570:	001007b7          	lui	a5,0x100
    e574:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e578:	fff74713          	not	a4,a4
    e57c:	0146d813          	srl	a6,a3,0x14
    e580:	00b7f5b3          	and	a1,a5,a1
    e584:	00d7f7b3          	and	a5,a5,a3
    e588:	01571693          	sll	a3,a4,0x15
    e58c:	7ff87813          	and	a6,a6,2047
    e590:	02068063          	beqz	a3,e5b0 <__unorddf2+0x44>
    e594:	7ff00713          	li	a4,2047
    e598:	00000513          	li	a0,0
    e59c:	00e80463          	beq	a6,a4,e5a4 <__unorddf2+0x38>
    e5a0:	00008067          	ret
    e5a4:	00c7e7b3          	or	a5,a5,a2
    e5a8:	00f03533          	snez	a0,a5
    e5ac:	00008067          	ret
    e5b0:	00a5e5b3          	or	a1,a1,a0
    e5b4:	00100513          	li	a0,1
    e5b8:	fc058ee3          	beqz	a1,e594 <__unorddf2+0x28>
    e5bc:	00008067          	ret

0000e5c0 <__fixdfsi>:
    e5c0:	0145d793          	srl	a5,a1,0x14
    e5c4:	001006b7          	lui	a3,0x100
    e5c8:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e5cc:	7ff7f793          	and	a5,a5,2047
    e5d0:	3fe00613          	li	a2,1022
    e5d4:	00b77733          	and	a4,a4,a1
    e5d8:	01f5d593          	srl	a1,a1,0x1f
    e5dc:	00f65e63          	bge	a2,a5,e5f8 <__fixdfsi+0x38>
    e5e0:	41d00613          	li	a2,1053
    e5e4:	00f65e63          	bge	a2,a5,e600 <__fixdfsi+0x40>
    e5e8:	80000537          	lui	a0,0x80000
    e5ec:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e5f0:	00a58533          	add	a0,a1,a0
    e5f4:	00008067          	ret
    e5f8:	00000513          	li	a0,0
    e5fc:	00008067          	ret
    e600:	43300613          	li	a2,1075
    e604:	40f60633          	sub	a2,a2,a5
    e608:	01f00813          	li	a6,31
    e60c:	00d76733          	or	a4,a4,a3
    e610:	02c85063          	bge	a6,a2,e630 <__fixdfsi+0x70>
    e614:	41300693          	li	a3,1043
    e618:	40f687b3          	sub	a5,a3,a5
    e61c:	00f75733          	srl	a4,a4,a5
    e620:	40e00533          	neg	a0,a4
    e624:	fc059ce3          	bnez	a1,e5fc <__fixdfsi+0x3c>
    e628:	00070513          	mv	a0,a4
    e62c:	00008067          	ret
    e630:	bed78793          	add	a5,a5,-1043
    e634:	00f71733          	sll	a4,a4,a5
    e638:	00c55533          	srl	a0,a0,a2
    e63c:	00a76733          	or	a4,a4,a0
    e640:	fe1ff06f          	j	e620 <__fixdfsi+0x60>

0000e644 <__floatsidf>:
    e644:	ff010113          	add	sp,sp,-16
    e648:	00112623          	sw	ra,12(sp)
    e64c:	00812423          	sw	s0,8(sp)
    e650:	00912223          	sw	s1,4(sp)
    e654:	04050a63          	beqz	a0,e6a8 <__floatsidf+0x64>
    e658:	41f55713          	sra	a4,a0,0x1f
    e65c:	00a744b3          	xor	s1,a4,a0
    e660:	40e484b3          	sub	s1,s1,a4
    e664:	00050793          	mv	a5,a0
    e668:	00048513          	mv	a0,s1
    e66c:	01f7d413          	srl	s0,a5,0x1f
    e670:	69c000ef          	jal	ed0c <__clzsi2>
    e674:	41e00793          	li	a5,1054
    e678:	40a787b3          	sub	a5,a5,a0
    e67c:	00a00713          	li	a4,10
    e680:	7ff7f793          	and	a5,a5,2047
    e684:	06a74063          	blt	a4,a0,e6e4 <__floatsidf+0xa0>
    e688:	00b00713          	li	a4,11
    e68c:	40a70733          	sub	a4,a4,a0
    e690:	00e4d733          	srl	a4,s1,a4
    e694:	01550513          	add	a0,a0,21
    e698:	00c71713          	sll	a4,a4,0xc
    e69c:	00a494b3          	sll	s1,s1,a0
    e6a0:	00c75713          	srl	a4,a4,0xc
    e6a4:	0140006f          	j	e6b8 <__floatsidf+0x74>
    e6a8:	00000413          	li	s0,0
    e6ac:	00000793          	li	a5,0
    e6b0:	00000713          	li	a4,0
    e6b4:	00000493          	li	s1,0
    e6b8:	01479793          	sll	a5,a5,0x14
    e6bc:	01f41413          	sll	s0,s0,0x1f
    e6c0:	00e7e7b3          	or	a5,a5,a4
    e6c4:	00c12083          	lw	ra,12(sp)
    e6c8:	0087e7b3          	or	a5,a5,s0
    e6cc:	00812403          	lw	s0,8(sp)
    e6d0:	00048513          	mv	a0,s1
    e6d4:	00078593          	mv	a1,a5
    e6d8:	00412483          	lw	s1,4(sp)
    e6dc:	01010113          	add	sp,sp,16
    e6e0:	00008067          	ret
    e6e4:	ff550513          	add	a0,a0,-11
    e6e8:	00a49733          	sll	a4,s1,a0
    e6ec:	00c71713          	sll	a4,a4,0xc
    e6f0:	00c75713          	srl	a4,a4,0xc
    e6f4:	00000493          	li	s1,0
    e6f8:	fc1ff06f          	j	e6b8 <__floatsidf+0x74>

0000e6fc <__floatunsidf>:
    e6fc:	ff010113          	add	sp,sp,-16
    e700:	00812423          	sw	s0,8(sp)
    e704:	00112623          	sw	ra,12(sp)
    e708:	00050413          	mv	s0,a0
    e70c:	04050c63          	beqz	a0,e764 <__floatunsidf+0x68>
    e710:	5fc000ef          	jal	ed0c <__clzsi2>
    e714:	41e00793          	li	a5,1054
    e718:	40a787b3          	sub	a5,a5,a0
    e71c:	00a00713          	li	a4,10
    e720:	7ff7f793          	and	a5,a5,2047
    e724:	06a74463          	blt	a4,a0,e78c <__floatunsidf+0x90>
    e728:	00b00713          	li	a4,11
    e72c:	40a70733          	sub	a4,a4,a0
    e730:	01550513          	add	a0,a0,21
    e734:	00e45733          	srl	a4,s0,a4
    e738:	00a41433          	sll	s0,s0,a0
    e73c:	00c12083          	lw	ra,12(sp)
    e740:	00040513          	mv	a0,s0
    e744:	00c71713          	sll	a4,a4,0xc
    e748:	00812403          	lw	s0,8(sp)
    e74c:	00c75713          	srl	a4,a4,0xc
    e750:	01479793          	sll	a5,a5,0x14
    e754:	00e7e7b3          	or	a5,a5,a4
    e758:	00078593          	mv	a1,a5
    e75c:	01010113          	add	sp,sp,16
    e760:	00008067          	ret
    e764:	00c12083          	lw	ra,12(sp)
    e768:	00040513          	mv	a0,s0
    e76c:	00000793          	li	a5,0
    e770:	00812403          	lw	s0,8(sp)
    e774:	00000713          	li	a4,0
    e778:	01479793          	sll	a5,a5,0x14
    e77c:	00e7e7b3          	or	a5,a5,a4
    e780:	00078593          	mv	a1,a5
    e784:	01010113          	add	sp,sp,16
    e788:	00008067          	ret
    e78c:	ff550513          	add	a0,a0,-11
    e790:	00a41733          	sll	a4,s0,a0
    e794:	00000413          	li	s0,0
    e798:	00c12083          	lw	ra,12(sp)
    e79c:	00040513          	mv	a0,s0
    e7a0:	00c71713          	sll	a4,a4,0xc
    e7a4:	00812403          	lw	s0,8(sp)
    e7a8:	00c75713          	srl	a4,a4,0xc
    e7ac:	01479793          	sll	a5,a5,0x14
    e7b0:	00e7e7b3          	or	a5,a5,a4
    e7b4:	00078593          	mv	a1,a5
    e7b8:	01010113          	add	sp,sp,16
    e7bc:	00008067          	ret

0000e7c0 <__trunctfdf2>:
    e7c0:	00c52583          	lw	a1,12(a0)
    e7c4:	00852783          	lw	a5,8(a0)
    e7c8:	00052803          	lw	a6,0(a0)
    e7cc:	00452683          	lw	a3,4(a0)
    e7d0:	01059613          	sll	a2,a1,0x10
    e7d4:	fe010113          	add	sp,sp,-32
    e7d8:	00159713          	sll	a4,a1,0x1
    e7dc:	01065613          	srl	a2,a2,0x10
    e7e0:	00f12423          	sw	a5,8(sp)
    e7e4:	00b12623          	sw	a1,12(sp)
    e7e8:	00f12c23          	sw	a5,24(sp)
    e7ec:	01012023          	sw	a6,0(sp)
    e7f0:	00d12223          	sw	a3,4(sp)
    e7f4:	01012823          	sw	a6,16(sp)
    e7f8:	00d12a23          	sw	a3,20(sp)
    e7fc:	00c12e23          	sw	a2,28(sp)
    e800:	01175713          	srl	a4,a4,0x11
    e804:	01f5d593          	srl	a1,a1,0x1f
    e808:	01010893          	add	a7,sp,16
    e80c:	01c10793          	add	a5,sp,28
    e810:	00361513          	sll	a0,a2,0x3
    e814:	ffc7a603          	lw	a2,-4(a5)
    e818:	ffc78793          	add	a5,a5,-4
    e81c:	01d65693          	srl	a3,a2,0x1d
    e820:	00a6e6b3          	or	a3,a3,a0
    e824:	00d7a223          	sw	a3,4(a5)
    e828:	fef894e3          	bne	a7,a5,e810 <__trunctfdf2+0x50>
    e82c:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e830:	00381813          	sll	a6,a6,0x3
    e834:	01169613          	sll	a2,a3,0x11
    e838:	01012823          	sw	a6,16(sp)
    e83c:	01265613          	srl	a2,a2,0x12
    e840:	04060263          	beqz	a2,e884 <__trunctfdf2+0xc4>
    e844:	ffffc6b7          	lui	a3,0xffffc
    e848:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e84c:	00d70733          	add	a4,a4,a3
    e850:	7fe00693          	li	a3,2046
    e854:	10e6d463          	bge	a3,a4,e95c <__trunctfdf2+0x19c>
    e858:	7ff00793          	li	a5,2047
    e85c:	00000613          	li	a2,0
    e860:	00000693          	li	a3,0
    e864:	01479793          	sll	a5,a5,0x14
    e868:	01f59593          	sll	a1,a1,0x1f
    e86c:	00c7e7b3          	or	a5,a5,a2
    e870:	00b7e7b3          	or	a5,a5,a1
    e874:	00068513          	mv	a0,a3
    e878:	00078593          	mv	a1,a5
    e87c:	02010113          	add	sp,sp,32
    e880:	00008067          	ret
    e884:	01412603          	lw	a2,20(sp)
    e888:	01812883          	lw	a7,24(sp)
    e88c:	01c12503          	lw	a0,28(sp)
    e890:	011666b3          	or	a3,a2,a7
    e894:	00a6e6b3          	or	a3,a3,a0
    e898:	0106e6b3          	or	a3,a3,a6
    e89c:	04071463          	bnez	a4,e8e4 <__trunctfdf2+0x124>
    e8a0:	14068263          	beqz	a3,e9e4 <__trunctfdf2+0x224>
    e8a4:	00500693          	li	a3,5
    e8a8:	00000613          	li	a2,0
    e8ac:	0036d793          	srl	a5,a3,0x3
    e8b0:	01d61693          	sll	a3,a2,0x1d
    e8b4:	00f6e6b3          	or	a3,a3,a5
    e8b8:	00961613          	sll	a2,a2,0x9
    e8bc:	7ff77793          	and	a5,a4,2047
    e8c0:	00c65613          	srl	a2,a2,0xc
    e8c4:	01479793          	sll	a5,a5,0x14
    e8c8:	01f59593          	sll	a1,a1,0x1f
    e8cc:	00c7e7b3          	or	a5,a5,a2
    e8d0:	00b7e7b3          	or	a5,a5,a1
    e8d4:	00068513          	mv	a0,a3
    e8d8:	00078593          	mv	a1,a5
    e8dc:	02010113          	add	sp,sp,32
    e8e0:	00008067          	ret
    e8e4:	12068463          	beqz	a3,ea0c <__trunctfdf2+0x24c>
    e8e8:	01c8d793          	srl	a5,a7,0x1c
    e8ec:	00451513          	sll	a0,a0,0x4
    e8f0:	00a7e7b3          	or	a5,a5,a0
    e8f4:	008006b7          	lui	a3,0x800
    e8f8:	00d7f6b3          	and	a3,a5,a3
    e8fc:	1c068263          	beqz	a3,eac0 <__trunctfdf2+0x300>
    e900:	ff800737          	lui	a4,0xff800
    e904:	01c65693          	srl	a3,a2,0x1c
    e908:	00489893          	sll	a7,a7,0x4
    e90c:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e910:	00e7f633          	and	a2,a5,a4
    e914:	0116e6b3          	or	a3,a3,a7
    e918:	004007b7          	lui	a5,0x400
    e91c:	00f66633          	or	a2,a2,a5
    e920:	ff86f693          	and	a3,a3,-8
    e924:	00000793          	li	a5,0
    e928:	0036d713          	srl	a4,a3,0x3
    e92c:	01d61693          	sll	a3,a2,0x1d
    e930:	00961613          	sll	a2,a2,0x9
    e934:	00c65613          	srl	a2,a2,0xc
    e938:	01479793          	sll	a5,a5,0x14
    e93c:	01f59593          	sll	a1,a1,0x1f
    e940:	00c7e7b3          	or	a5,a5,a2
    e944:	00e6e6b3          	or	a3,a3,a4
    e948:	00b7e7b3          	or	a5,a5,a1
    e94c:	00068513          	mv	a0,a3
    e950:	00078593          	mv	a1,a5
    e954:	02010113          	add	sp,sp,32
    e958:	00008067          	ret
    e95c:	0ce05c63          	blez	a4,ea34 <__trunctfdf2+0x274>
    e960:	01412783          	lw	a5,20(sp)
    e964:	01812503          	lw	a0,24(sp)
    e968:	01c12603          	lw	a2,28(sp)
    e96c:	00479693          	sll	a3,a5,0x4
    e970:	0106e6b3          	or	a3,a3,a6
    e974:	01c7d793          	srl	a5,a5,0x1c
    e978:	00451813          	sll	a6,a0,0x4
    e97c:	00461613          	sll	a2,a2,0x4
    e980:	01c55513          	srl	a0,a0,0x1c
    e984:	00d036b3          	snez	a3,a3
    e988:	0107e7b3          	or	a5,a5,a6
    e98c:	00a66633          	or	a2,a2,a0
    e990:	00f6e6b3          	or	a3,a3,a5
    e994:	0076f793          	and	a5,a3,7
    e998:	02078063          	beqz	a5,e9b8 <__trunctfdf2+0x1f8>
    e99c:	00f6f793          	and	a5,a3,15
    e9a0:	00400513          	li	a0,4
    e9a4:	00a78a63          	beq	a5,a0,e9b8 <__trunctfdf2+0x1f8>
    e9a8:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    e9ac:	00d7b6b3          	sltu	a3,a5,a3
    e9b0:	00d60633          	add	a2,a2,a3
    e9b4:	00078693          	mv	a3,a5
    e9b8:	008007b7          	lui	a5,0x800
    e9bc:	00f677b3          	and	a5,a2,a5
    e9c0:	ee0786e3          	beqz	a5,e8ac <__trunctfdf2+0xec>
    e9c4:	00170713          	add	a4,a4,1
    e9c8:	7ff00793          	li	a5,2047
    e9cc:	e8f706e3          	beq	a4,a5,e858 <__trunctfdf2+0x98>
    e9d0:	ff8007b7          	lui	a5,0xff800
    e9d4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e9d8:	00f67633          	and	a2,a2,a5
    e9dc:	7ff77793          	and	a5,a4,2047
    e9e0:	f49ff06f          	j	e928 <__trunctfdf2+0x168>
    e9e4:	00000793          	li	a5,0
    e9e8:	00000613          	li	a2,0
    e9ec:	01479793          	sll	a5,a5,0x14
    e9f0:	01f59593          	sll	a1,a1,0x1f
    e9f4:	00c7e7b3          	or	a5,a5,a2
    e9f8:	00b7e7b3          	or	a5,a5,a1
    e9fc:	00068513          	mv	a0,a3
    ea00:	00078593          	mv	a1,a5
    ea04:	02010113          	add	sp,sp,32
    ea08:	00008067          	ret
    ea0c:	7ff00793          	li	a5,2047
    ea10:	00000613          	li	a2,0
    ea14:	01479793          	sll	a5,a5,0x14
    ea18:	01f59593          	sll	a1,a1,0x1f
    ea1c:	00c7e7b3          	or	a5,a5,a2
    ea20:	00b7e7b3          	or	a5,a5,a1
    ea24:	00068513          	mv	a0,a3
    ea28:	00078593          	mv	a1,a5
    ea2c:	02010113          	add	sp,sp,32
    ea30:	00008067          	ret
    ea34:	fcc00693          	li	a3,-52
    ea38:	08d74c63          	blt	a4,a3,ead0 <__trunctfdf2+0x310>
    ea3c:	03d00693          	li	a3,61
    ea40:	40e686b3          	sub	a3,a3,a4
    ea44:	01c12703          	lw	a4,28(sp)
    ea48:	4056de13          	sra	t3,a3,0x5
    ea4c:	00080eb7          	lui	t4,0x80
    ea50:	00eeeeb3          	or	t4,t4,a4
    ea54:	002e1513          	sll	a0,t3,0x2
    ea58:	01d12e23          	sw	t4,28(sp)
    ea5c:	01f6f693          	and	a3,a3,31
    ea60:	00a88833          	add	a6,a7,a0
    ea64:	00088613          	mv	a2,a7
    ea68:	00000713          	li	a4,0
    ea6c:	00062303          	lw	t1,0(a2)
    ea70:	00460613          	add	a2,a2,4
    ea74:	00676733          	or	a4,a4,t1
    ea78:	fec81ae3          	bne	a6,a2,ea6c <__trunctfdf2+0x2ac>
    ea7c:	00300613          	li	a2,3
    ea80:	41c60633          	sub	a2,a2,t3
    ea84:	04069a63          	bnez	a3,ead8 <__trunctfdf2+0x318>
    ea88:	00082803          	lw	a6,0(a6)
    ea8c:	00168693          	add	a3,a3,1
    ea90:	00478793          	add	a5,a5,4
    ea94:	ff07ae23          	sw	a6,-4(a5)
    ea98:	00d64e63          	blt	a2,a3,eab4 <__trunctfdf2+0x2f4>
    ea9c:	00a78833          	add	a6,a5,a0
    eaa0:	00082803          	lw	a6,0(a6)
    eaa4:	00168693          	add	a3,a3,1
    eaa8:	00478793          	add	a5,a5,4
    eaac:	ff07ae23          	sw	a6,-4(a5)
    eab0:	fed656e3          	bge	a2,a3,ea9c <__trunctfdf2+0x2dc>
    eab4:	00400793          	li	a5,4
    eab8:	41c787b3          	sub	a5,a5,t3
    eabc:	0840006f          	j	eb40 <__trunctfdf2+0x380>
    eac0:	00000593          	li	a1,0
    eac4:	7ff00793          	li	a5,2047
    eac8:	00080637          	lui	a2,0x80
    eacc:	d99ff06f          	j	e864 <__trunctfdf2+0xa4>
    ead0:	00000713          	li	a4,0
    ead4:	dd1ff06f          	j	e8a4 <__trunctfdf2+0xe4>
    ead8:	02050813          	add	a6,a0,32
    eadc:	00280833          	add	a6,a6,sp
    eae0:	ff082803          	lw	a6,-16(a6)
    eae4:	02000f13          	li	t5,32
    eae8:	40df0f33          	sub	t5,t5,a3
    eaec:	01e81833          	sll	a6,a6,t5
    eaf0:	01076733          	or	a4,a4,a6
    eaf4:	08060e63          	beqz	a2,eb90 <__trunctfdf2+0x3d0>
    eaf8:	00261813          	sll	a6,a2,0x2
    eafc:	00f80fb3          	add	t6,a6,a5
    eb00:	00a88633          	add	a2,a7,a0
    eb04:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    eb08:	00462303          	lw	t1,4(a2)
    eb0c:	00478793          	add	a5,a5,4
    eb10:	00d55533          	srl	a0,a0,a3
    eb14:	01e31333          	sll	t1,t1,t5
    eb18:	00656533          	or	a0,a0,t1
    eb1c:	fea7ae23          	sw	a0,-4(a5)
    eb20:	00460613          	add	a2,a2,4
    eb24:	feff90e3          	bne	t6,a5,eb04 <__trunctfdf2+0x344>
    eb28:	00400793          	li	a5,4
    eb2c:	41c787b3          	sub	a5,a5,t3
    eb30:	02080613          	add	a2,a6,32
    eb34:	00260633          	add	a2,a2,sp
    eb38:	00dedeb3          	srl	t4,t4,a3
    eb3c:	ffd62823          	sw	t4,-16(a2)
    eb40:	00400693          	li	a3,4
    eb44:	40f686b3          	sub	a3,a3,a5
    eb48:	00269693          	sll	a3,a3,0x2
    eb4c:	00279793          	sll	a5,a5,0x2
    eb50:	00800613          	li	a2,8
    eb54:	00f888b3          	add	a7,a7,a5
    eb58:	00c6ea63          	bltu	a3,a2,eb6c <__trunctfdf2+0x3ac>
    eb5c:	0008a023          	sw	zero,0(a7)
    eb60:	0008a223          	sw	zero,4(a7)
    eb64:	ff868693          	add	a3,a3,-8
    eb68:	00888893          	add	a7,a7,8
    eb6c:	00400793          	li	a5,4
    eb70:	00f6e463          	bltu	a3,a5,eb78 <__trunctfdf2+0x3b8>
    eb74:	0008a023          	sw	zero,0(a7)
    eb78:	01012783          	lw	a5,16(sp)
    eb7c:	00e03733          	snez	a4,a4
    eb80:	01412603          	lw	a2,20(sp)
    eb84:	00f766b3          	or	a3,a4,a5
    eb88:	00000713          	li	a4,0
    eb8c:	e09ff06f          	j	e994 <__trunctfdf2+0x1d4>
    eb90:	00100793          	li	a5,1
    eb94:	00000813          	li	a6,0
    eb98:	f99ff06f          	j	eb30 <__trunctfdf2+0x370>

0000eb9c <__mulsi3>:
    eb9c:	00050613          	mv	a2,a0
    eba0:	00000513          	li	a0,0
    eba4:	0015f693          	and	a3,a1,1
    eba8:	00068463          	beqz	a3,ebb0 <__mulsi3+0x14>
    ebac:	00c50533          	add	a0,a0,a2
    ebb0:	0015d593          	srl	a1,a1,0x1
    ebb4:	00161613          	sll	a2,a2,0x1
    ebb8:	fe0596e3          	bnez	a1,eba4 <__mulsi3+0x8>
    ebbc:	00008067          	ret

0000ebc0 <__muldi3>:
    ebc0:	ff010113          	add	sp,sp,-16
    ebc4:	00812423          	sw	s0,8(sp)
    ebc8:	00050413          	mv	s0,a0
    ebcc:	00112623          	sw	ra,12(sp)
    ebd0:	00060513          	mv	a0,a2
    ebd4:	00068393          	mv	t2,a3
    ebd8:	00040713          	mv	a4,s0
    ebdc:	00060813          	mv	a6,a2
    ebe0:	00000793          	li	a5,0
    ebe4:	00000313          	li	t1,0
    ebe8:	00000f13          	li	t5,0
    ebec:	01e708b3          	add	a7,a4,t5
    ebf0:	00187e93          	and	t4,a6,1
    ebf4:	00f30fb3          	add	t6,t1,a5
    ebf8:	01f75e13          	srl	t3,a4,0x1f
    ebfc:	00185813          	srl	a6,a6,0x1
    ec00:	00e8b2b3          	sltu	t0,a7,a4
    ec04:	00179793          	sll	a5,a5,0x1
    ec08:	000e8663          	beqz	t4,ec14 <__muldi3+0x54>
    ec0c:	00088f13          	mv	t5,a7
    ec10:	01f28333          	add	t1,t0,t6
    ec14:	00171713          	sll	a4,a4,0x1
    ec18:	01c7e7b3          	or	a5,a5,t3
    ec1c:	fc0818e3          	bnez	a6,ebec <__muldi3+0x2c>
    ec20:	00058663          	beqz	a1,ec2c <__muldi3+0x6c>
    ec24:	f79ff0ef          	jal	eb9c <__mulsi3>
    ec28:	00650333          	add	t1,a0,t1
    ec2c:	00038a63          	beqz	t2,ec40 <__muldi3+0x80>
    ec30:	00040513          	mv	a0,s0
    ec34:	00038593          	mv	a1,t2
    ec38:	f65ff0ef          	jal	eb9c <__mulsi3>
    ec3c:	00650333          	add	t1,a0,t1
    ec40:	00c12083          	lw	ra,12(sp)
    ec44:	00812403          	lw	s0,8(sp)
    ec48:	000f0513          	mv	a0,t5
    ec4c:	00030593          	mv	a1,t1
    ec50:	01010113          	add	sp,sp,16
    ec54:	00008067          	ret

0000ec58 <__divsi3>:
    ec58:	06054063          	bltz	a0,ecb8 <__umodsi3+0x10>
    ec5c:	0605c663          	bltz	a1,ecc8 <__umodsi3+0x20>

0000ec60 <__hidden___udivsi3>:
    ec60:	00058613          	mv	a2,a1
    ec64:	00050593          	mv	a1,a0
    ec68:	fff00513          	li	a0,-1
    ec6c:	02060c63          	beqz	a2,eca4 <__hidden___udivsi3+0x44>
    ec70:	00100693          	li	a3,1
    ec74:	00b67a63          	bgeu	a2,a1,ec88 <__hidden___udivsi3+0x28>
    ec78:	00c05863          	blez	a2,ec88 <__hidden___udivsi3+0x28>
    ec7c:	00161613          	sll	a2,a2,0x1
    ec80:	00169693          	sll	a3,a3,0x1
    ec84:	feb66ae3          	bltu	a2,a1,ec78 <__hidden___udivsi3+0x18>
    ec88:	00000513          	li	a0,0
    ec8c:	00c5e663          	bltu	a1,a2,ec98 <__hidden___udivsi3+0x38>
    ec90:	40c585b3          	sub	a1,a1,a2
    ec94:	00d56533          	or	a0,a0,a3
    ec98:	0016d693          	srl	a3,a3,0x1
    ec9c:	00165613          	srl	a2,a2,0x1
    eca0:	fe0696e3          	bnez	a3,ec8c <__hidden___udivsi3+0x2c>
    eca4:	00008067          	ret

0000eca8 <__umodsi3>:
    eca8:	00008293          	mv	t0,ra
    ecac:	fb5ff0ef          	jal	ec60 <__hidden___udivsi3>
    ecb0:	00058513          	mv	a0,a1
    ecb4:	00028067          	jr	t0
    ecb8:	40a00533          	neg	a0,a0
    ecbc:	00b04863          	bgtz	a1,eccc <__umodsi3+0x24>
    ecc0:	40b005b3          	neg	a1,a1
    ecc4:	f9dff06f          	j	ec60 <__hidden___udivsi3>
    ecc8:	40b005b3          	neg	a1,a1
    eccc:	00008293          	mv	t0,ra
    ecd0:	f91ff0ef          	jal	ec60 <__hidden___udivsi3>
    ecd4:	40a00533          	neg	a0,a0
    ecd8:	00028067          	jr	t0

0000ecdc <__modsi3>:
    ecdc:	00008293          	mv	t0,ra
    ece0:	0005ca63          	bltz	a1,ecf4 <__modsi3+0x18>
    ece4:	00054c63          	bltz	a0,ecfc <__modsi3+0x20>
    ece8:	f79ff0ef          	jal	ec60 <__hidden___udivsi3>
    ecec:	00058513          	mv	a0,a1
    ecf0:	00028067          	jr	t0
    ecf4:	40b005b3          	neg	a1,a1
    ecf8:	fe0558e3          	bgez	a0,ece8 <__modsi3+0xc>
    ecfc:	40a00533          	neg	a0,a0
    ed00:	f61ff0ef          	jal	ec60 <__hidden___udivsi3>
    ed04:	40b00533          	neg	a0,a1
    ed08:	00028067          	jr	t0

0000ed0c <__clzsi2>:
    ed0c:	000107b7          	lui	a5,0x10
    ed10:	02f57a63          	bgeu	a0,a5,ed44 <__clzsi2+0x38>
    ed14:	10053793          	sltiu	a5,a0,256
    ed18:	0017b793          	seqz	a5,a5
    ed1c:	00379793          	sll	a5,a5,0x3
    ed20:	02000713          	li	a4,32
    ed24:	40f70733          	sub	a4,a4,a5
    ed28:	00f55533          	srl	a0,a0,a5
    ed2c:	00001797          	auipc	a5,0x1
    ed30:	9dc78793          	add	a5,a5,-1572 # f708 <__clz_tab>
    ed34:	00a787b3          	add	a5,a5,a0
    ed38:	0007c503          	lbu	a0,0(a5)
    ed3c:	40a70533          	sub	a0,a4,a0
    ed40:	00008067          	ret
    ed44:	010007b7          	lui	a5,0x1000
    ed48:	02f57463          	bgeu	a0,a5,ed70 <__clzsi2+0x64>
    ed4c:	01000793          	li	a5,16
    ed50:	00f55533          	srl	a0,a0,a5
    ed54:	00001797          	auipc	a5,0x1
    ed58:	9b478793          	add	a5,a5,-1612 # f708 <__clz_tab>
    ed5c:	00a787b3          	add	a5,a5,a0
    ed60:	0007c503          	lbu	a0,0(a5)
    ed64:	01000713          	li	a4,16
    ed68:	40a70533          	sub	a0,a4,a0
    ed6c:	00008067          	ret
    ed70:	01800793          	li	a5,24
    ed74:	00f55533          	srl	a0,a0,a5
    ed78:	00001797          	auipc	a5,0x1
    ed7c:	99078793          	add	a5,a5,-1648 # f708 <__clz_tab>
    ed80:	00a787b3          	add	a5,a5,a0
    ed84:	0007c503          	lbu	a0,0(a5)
    ed88:	00800713          	li	a4,8
    ed8c:	40a70533          	sub	a0,a4,a0
    ed90:	00008067          	ret
