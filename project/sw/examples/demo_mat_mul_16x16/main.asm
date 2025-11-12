
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x108>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00010397          	auipc	t2,0x10
      38:	98438393          	add	t2,t2,-1660 # f9b8 <__crt0_copy_data_src_begin>
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
     110:	e3440413          	add	s0,s0,-460 # ef40 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	e2c48493          	add	s1,s1,-468 # ef40 <__fini_array_end>

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
     178:	dcc40413          	add	s0,s0,-564 # ef40 <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	dc448493          	add	s1,s1,-572 # ef40 <__fini_array_end>

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
#define LDB (4)

static inline uint64_t rdcycle(void){
#if __riscv_xlen == 32 || !defined(__riscv_xlen)
  uint32_t hi1, lo, hi2;
  do { __asm__ volatile("csrr %0,mcycleh":"=r"(hi1));
     1e4:	b80025f3          	csrr	a1,mcycleh
       __asm__ volatile("csrr %0,mcycle" :"=r"(lo));
     1e8:	b0002573          	csrr	a0,mcycle
       __asm__ volatile("csrr %0,mcycleh":"=r"(hi2)); } while (hi1!=hi2);
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
       __asm__ volatile("csrr %0,minstreth":"=r"(hi2)); } while (hi1!=hi2);
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
static void print_speedup_fixed(uint64_t num, uint64_t den){
  if(!den){ printf("  n/a   "); return; }
     20c:	00d667b3          	or	a5,a2,a3
     210:	00079863          	bnez	a5,220 <print_speedup_fixed+0x14>
     214:	0000f537          	lui	a0,0xf
     218:	f4050513          	add	a0,a0,-192 # ef40 <__fini_array_end>
     21c:	3cd0006f          	j	de8 <printf>
static void print_speedup_fixed(uint64_t num, uint64_t den){
     220:	fe010113          	add	sp,sp,-32
     224:	00812c23          	sw	s0,24(sp)
     228:	00912a23          	sw	s1,20(sp)
     22c:	00068413          	mv	s0,a3
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x",s/1000,s%1000);
     230:	00060493          	mv	s1,a2
     234:	00000693          	li	a3,0
     238:	3e800613          	li	a2,1000
static void print_speedup_fixed(uint64_t num, uint64_t den){
     23c:	00112e23          	sw	ra,28(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x",s/1000,s%1000);
     240:	32d0e0ef          	jal	ed6c <__muldi3>
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
     270:	3040b0ef          	jal	b574 <__udivdi3>
     274:	3e800613          	li	a2,1000
     278:	00000693          	li	a3,0
     27c:	00050493          	mv	s1,a0
     280:	00058413          	mv	s0,a1
     284:	19d0b0ef          	jal	bc20 <__umoddi3>
     288:	00a12623          	sw	a0,12(sp)
     28c:	00b12423          	sw	a1,8(sp)
     290:	3e800613          	li	a2,1000
     294:	00000693          	li	a3,0
     298:	00048513          	mv	a0,s1
     29c:	00040593          	mv	a1,s0
     2a0:	2d40b0ef          	jal	b574 <__udivdi3>
}
     2a4:	01812403          	lw	s0,24(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x",s/1000,s%1000);
     2a8:	00c12703          	lw	a4,12(sp)
     2ac:	00812783          	lw	a5,8(sp)
}
     2b0:	01c12083          	lw	ra,28(sp)
     2b4:	01412483          	lw	s1,20(sp)
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x",s/1000,s%1000);
     2b8:	00050613          	mv	a2,a0
     2bc:	0000f537          	lui	a0,0xf
     2c0:	00058693          	mv	a3,a1
     2c4:	f4c50513          	add	a0,a0,-180 # ef4c <__fini_array_end+0xc>
}
     2c8:	02010113          	add	sp,sp,32
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x",s/1000,s%1000);
     2cc:	31d0006f          	j	de8 <printf>

000002d0 <main>:
    }
  }
}
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }

int main(void){
     2d0:	81010113          	add	sp,sp,-2032
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N,N);
     2d4:	0000f537          	lui	a0,0xf
int main(void){
     2d8:	7e112623          	sw	ra,2028(sp)
     2dc:	7e812423          	sw	s0,2024(sp)
     2e0:	7e912223          	sw	s1,2020(sp)
     2e4:	7f212023          	sw	s2,2016(sp)
     2e8:	7d312e23          	sw	s3,2012(sp)
     2ec:	7d412c23          	sw	s4,2008(sp)
     2f0:	7d512a23          	sw	s5,2004(sp)
     2f4:	7d612823          	sw	s6,2000(sp)
     2f8:	7d712623          	sw	s7,1996(sp)
     2fc:	7d812423          	sw	s8,1992(sp)
     300:	7d912223          	sw	s9,1988(sp)
     304:	7da12023          	sw	s10,1984(sp)
     308:	7bb12e23          	sw	s11,1980(sp)
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N,N);
     30c:	01000613          	li	a2,16
int main(void){
     310:	91010113          	add	sp,sp,-1776
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N,N);
     314:	01000593          	li	a1,16
     318:	f6c50513          	add	a0,a0,-148 # ef6c <__fini_array_end+0x2c>
     31c:	2cd000ef          	jal	de8 <printf>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     320:	ffeb07b7          	lui	a5,0xffeb0
     324:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     328:	0000f537          	lui	a0,0xf
     32c:	f9050513          	add	a0,a0,-112 # ef90 <__fini_array_end+0x50>
     330:	2b9000ef          	jal	de8 <printf>

  int8_t  A[N][N], B[N][N];
  int32_t Csw[N][N], Ccfu[N][N], Ccfs[N][N];

  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     334:	fffff437          	lui	s0,0xfffff
     338:	000017b7          	lui	a5,0x1
     33c:	20040413          	add	s0,s0,512 # fffff200 <__crt0_ram_last+0x7ff7f201>
     340:	e6078793          	add	a5,a5,-416 # e60 <_puts_r+0x10>
     344:	008787b3          	add	a5,a5,s0
     348:	04010713          	add	a4,sp,64
     34c:	00e78433          	add	s0,a5,a4
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     350:	00040593          	mv	a1,s0
     354:	00100693          	li	a3,1
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     358:	01000813          	li	a6,16
     35c:	01100893          	li	a7,17
     360:	0ff6f613          	zext.b	a2,a3
     364:	00261793          	sll	a5,a2,0x2
     368:	40f607b3          	sub	a5,a2,a5
     36c:	0ff7f793          	zext.b	a5,a5
     370:	00000713          	li	a4,0
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     374:	00f7f513          	and	a0,a5,15
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     378:	00e58333          	add	t1,a1,a4
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     37c:	ff850513          	add	a0,a0,-8
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     380:	00f607b3          	add	a5,a2,a5
     384:	00a30023          	sb	a0,0(t1)
     388:	00170713          	add	a4,a4,1
     38c:	0ff7f793          	zext.b	a5,a5
     390:	ff0712e3          	bne	a4,a6,374 <main+0xa4>
     394:	00168693          	add	a3,a3,1
     398:	01058593          	add	a1,a1,16
     39c:	fd1692e3          	bne	a3,a7,360 <main+0x90>
     3a0:	fffff7b7          	lui	a5,0xfffff
     3a4:	00001737          	lui	a4,0x1
     3a8:	30078793          	add	a5,a5,768 # fffff300 <__crt0_ram_last+0x7ff7f301>
     3ac:	e6070713          	add	a4,a4,-416 # e60 <_puts_r+0x10>
     3b0:	00f70733          	add	a4,a4,a5
     3b4:	04010793          	add	a5,sp,64
     3b8:	00f707b3          	add	a5,a4,a5
     3bc:	00f12623          	sw	a5,12(sp)
     3c0:	00078613          	mv	a2,a5
     3c4:	00500713          	li	a4,5
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3c8:	01000513          	li	a0,16
     3cc:	0f500813          	li	a6,245
     3d0:	40e007b3          	neg	a5,a4
     3d4:	00179793          	sll	a5,a5,0x1
     3d8:	0ff7f793          	zext.b	a5,a5
     3dc:	00000693          	li	a3,0
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     3e0:	00f7f593          	and	a1,a5,15
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3e4:	00d608b3          	add	a7,a2,a3
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     3e8:	ff858593          	add	a1,a1,-8
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3ec:	00f707b3          	add	a5,a4,a5
     3f0:	00b88023          	sb	a1,0(a7)
     3f4:	00168693          	add	a3,a3,1
     3f8:	0ff7f793          	zext.b	a5,a5
     3fc:	fea692e3          	bne	a3,a0,3e0 <main+0x110>
     400:	fff70713          	add	a4,a4,-1
     404:	0ff77713          	zext.b	a4,a4
     408:	01060613          	add	a2,a2,16
     40c:	fd0712e3          	bne	a4,a6,3d0 <main+0x100>

  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     410:	dd5ff0ef          	jal	1e4 <rdcycle>
     414:	00050993          	mv	s3,a0
     418:	00058c13          	mv	s8,a1
     41c:	dddff0ef          	jal	1f8 <rdinstret>
     420:	fffffab7          	lui	s5,0xfffff
     424:	000017b7          	lui	a5,0x1
     428:	400a8a93          	add	s5,s5,1024 # fffff400 <__crt0_ram_last+0x7ff7f401>
     42c:	e6078793          	add	a5,a5,-416 # e60 <_puts_r+0x10>
     430:	015787b3          	add	a5,a5,s5
     434:	04010713          	add	a4,sp,64
     438:	00050913          	mv	s2,a0
     43c:	00058b13          	mv	s6,a1
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){ int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s; }
     440:	00e78ab3          	add	s5,a5,a4
     444:	6a010b93          	add	s7,sp,1696
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     448:	00040c93          	mv	s9,s0
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){ int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s; }
     44c:	00000493          	li	s1,0
     450:	03c0006f          	j	48c <main+0x1bc>
     454:	014c87b3          	add	a5,s9,s4
     458:	000d8583          	lb	a1,0(s11)
     45c:	00078503          	lb	a0,0(a5)
     460:	001a0a13          	add	s4,s4,1
     464:	010d8d93          	add	s11,s11,16
     468:	0e10e0ef          	jal	ed48 <__mulsi3>
     46c:	01000713          	li	a4,16
     470:	00ad0d33          	add	s10,s10,a0
     474:	feea10e3          	bne	s4,a4,454 <main+0x184>
     478:	00249793          	sll	a5,s1,0x2
     47c:	00fa87b3          	add	a5,s5,a5
     480:	01a7a023          	sw	s10,0(a5)
     484:	00148493          	add	s1,s1,1
     488:	01448c63          	beq	s1,s4,4a0 <main+0x1d0>
     48c:	00c12783          	lw	a5,12(sp)
     490:	00000d13          	li	s10,0
     494:	00000a13          	li	s4,0
     498:	00978db3          	add	s11,a5,s1
     49c:	fb9ff06f          	j	454 <main+0x184>
     4a0:	040a8a93          	add	s5,s5,64
     4a4:	010c8c93          	add	s9,s9,16
     4a8:	fb5b92e3          	bne	s7,s5,44c <main+0x17c>
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     4ac:	d4dff0ef          	jal	1f8 <rdinstret>
     4b0:	00050a93          	mv	s5,a0
     4b4:	00058493          	mv	s1,a1
     4b8:	d2dff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     4bc:	413507b3          	sub	a5,a0,s3
     4c0:	41858a33          	sub	s4,a1,s8
     4c4:	00f53533          	sltu	a0,a0,a5
     4c8:	00f12823          	sw	a5,16(sp)
     4cc:	40aa07b3          	sub	a5,s4,a0
     4d0:	00f12c23          	sw	a5,24(sp)
     4d4:	412a87b3          	sub	a5,s5,s2
     4d8:	00fabab3          	sltu	s5,s5,a5
     4dc:	416484b3          	sub	s1,s1,s6
     4e0:	00f12a23          	sw	a5,20(sp)
     4e4:	415487b3          	sub	a5,s1,s5
     4e8:	00f12e23          	sw	a5,28(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     4ec:	cf9ff0ef          	jal	1e4 <rdcycle>
     4f0:	00050b13          	mv	s6,a0
     4f4:	00058c13          	mv	s8,a1
     4f8:	d01ff0ef          	jal	1f8 <rdinstret>
     4fc:	00050a93          	mv	s5,a0
     500:	00058d13          	mv	s10,a1
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     504:	10040513          	add	a0,s0,256
  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     508:	00040613          	mv	a2,s0
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     50c:	01000813          	li	a6,16
     510:	00000713          	li	a4,0
     514:	01060693          	add	a3,a2,16
     518:	07c0006f          	j	594 <main+0x2c4>
         (((uint32_t)(uint8_t)x1) << 8)  |
     51c:	0018c783          	lbu	a5,1(a7)
         (((uint32_t)(uint8_t)x2) << 16) |
     520:	0028ce03          	lbu	t3,2(a7)
     524:	02034e83          	lbu	t4,32(t1)
         (((uint32_t)(uint8_t)x1) << 8)  |
     528:	00879793          	sll	a5,a5,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     52c:	010e1e13          	sll	t3,t3,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     530:	01c7e7b3          	or	a5,a5,t3
  return  ((uint32_t)(uint8_t)x0)        |
     534:	0008ce03          	lbu	t3,0(a7)
         (((uint32_t)(uint8_t)x2) << 16) |
     538:	010e9e93          	sll	t4,t4,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     53c:	01c7e7b3          	or	a5,a5,t3
         (((uint32_t)(uint8_t)x3) << 24);
     540:	0038ce03          	lbu	t3,3(a7)
     544:	018e1e13          	sll	t3,t3,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     548:	01c7ee33          	or	t3,a5,t3
         (((uint32_t)(uint8_t)x1) << 8)  |
     54c:	01034783          	lbu	a5,16(t1)
     550:	00879793          	sll	a5,a5,0x8
     554:	01d7e7b3          	or	a5,a5,t4
  return  ((uint32_t)(uint8_t)x0)        |
     558:	00034e83          	lbu	t4,0(t1)
         (((uint32_t)(uint8_t)x1) << 8)  |
     55c:	01d7e7b3          	or	a5,a5,t4
         (((uint32_t)(uint8_t)x3) << 24);
     560:	03034e83          	lbu	t4,48(t1)
     564:	018e9e93          	sll	t4,t4,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     568:	01d7e7b3          	or	a5,a5,t4
  __asm__ volatile(".insn r 0x0B, %1, %2, %0, %3, %4"
     56c:	02fe078b          	.insn	4, 0x02fe078b
    int32_t acc=0; for(int k=0;k<N;k+=4){
     570:	00488893          	add	a7,a7,4
      acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
     574:	00f585b3          	add	a1,a1,a5
    int32_t acc=0; for(int k=0;k<N;k+=4){
     578:	04030313          	add	t1,t1,64
     57c:	fb1690e3          	bne	a3,a7,51c <main+0x24c>
    } C[i][j]=acc;
     580:	00271793          	sll	a5,a4,0x2
     584:	00fb87b3          	add	a5,s7,a5
     588:	00b7a023          	sw	a1,0(a5)
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     58c:	00170713          	add	a4,a4,1
     590:	01070c63          	beq	a4,a6,5a8 <main+0x2d8>
    int32_t acc=0; for(int k=0;k<N;k+=4){
     594:	00c12783          	lw	a5,12(sp)
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     598:	00060893          	mv	a7,a2
    int32_t acc=0; for(int k=0;k<N;k+=4){
     59c:	00000593          	li	a1,0
     5a0:	00e78333          	add	t1,a5,a4
     5a4:	f79ff06f          	j	51c <main+0x24c>
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     5a8:	040b8b93          	add	s7,s7,64
     5ac:	00a68663          	beq	a3,a0,5b8 <main+0x2e8>
     5b0:	00068613          	mv	a2,a3
     5b4:	f5dff06f          	j	510 <main+0x240>
  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     5b8:	c41ff0ef          	jal	1f8 <rdinstret>
     5bc:	00050c93          	mv	s9,a0
     5c0:	00058d93          	mv	s11,a1
     5c4:	c21ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     5c8:	41650b33          	sub	s6,a0,s6
     5cc:	016537b3          	sltu	a5,a0,s6
     5d0:	41858bb3          	sub	s7,a1,s8
     5d4:	415c8ab3          	sub	s5,s9,s5
     5d8:	40fb87b3          	sub	a5,s7,a5
     5dc:	015cbcb3          	sltu	s9,s9,s5
     5e0:	41ad8db3          	sub	s11,s11,s10
     5e4:	02f12023          	sw	a5,32(sp)
     5e8:	419d87b3          	sub	a5,s11,s9
     5ec:	02f12223          	sw	a5,36(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     5f0:	bf5ff0ef          	jal	1e4 <rdcycle>
     5f4:	02a12423          	sw	a0,40(sp)
     5f8:	02b12623          	sw	a1,44(sp)
     5fc:	bfdff0ef          	jal	1f8 <rdinstret>
     600:	00001737          	lui	a4,0x1
     604:	aa070793          	add	a5,a4,-1376 # aa0 <main+0x7d0>
     608:	00278cb3          	add	s9,a5,sp
    uint32_t Aw[4]={0},Bw[4]={0};
     60c:	e6070713          	add	a4,a4,-416
     610:	fffff7b7          	lui	a5,0xfffff
     614:	00f70733          	add	a4,a4,a5
     618:	04010793          	add	a5,sp,64
     61c:	00f707b3          	add	a5,a4,a5
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     620:	02a12823          	sw	a0,48(sp)
     624:	02b12a23          	sw	a1,52(sp)
  for(int i0=0;i0<N;i0+=4){
     628:	00000d93          	li	s11,0
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) Aflat[r*LDA+k]=A[sr][k]; }
     62c:	800004b7          	lui	s1,0x80000
    uint32_t Aw[4]={0},Bw[4]={0};
     630:	00f12423          	sw	a5,8(sp)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     634:	000c8d13          	mv	s10,s9
    for(int j0=0;j0<N;j0+=4){
     638:	00000c13          	li	s8,0
     63c:	2700006f          	j	8ac <main+0x5dc>
        Bflat[k*LDB+0]=B[k][j0+0];
     640:	0006c583          	lbu	a1,0(a3)
      for(int k=0;k<N;++k){
     644:	00478793          	add	a5,a5,4 # fffff004 <__crt0_ram_last+0x7ff7f005>
     648:	01068693          	add	a3,a3,16
        Bflat[k*LDB+0]=B[k][j0+0];
     64c:	feb78e23          	sb	a1,-4(a5)
        Bflat[k*LDB+1]=B[k][j0+1];
     650:	ff16c583          	lbu	a1,-15(a3)
     654:	feb78ea3          	sb	a1,-3(a5)
        Bflat[k*LDB+2]=B[k][j0+2];
     658:	ff26c583          	lbu	a1,-14(a3)
     65c:	feb78f23          	sb	a1,-2(a5)
        Bflat[k*LDB+3]=B[k][j0+3];
     660:	ff36c583          	lbu	a1,-13(a3)
     664:	feb78fa3          	sb	a1,-1(a5)
      for(int k=0;k<N;++k){
     668:	fcf61ce3          	bne	a2,a5,640 <main+0x370>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     66c:	ffeb07b7          	lui	a5,0xffeb0
     670:	00200693          	li	a3,2
     674:	00d7a023          	sw	a3,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     678:	0007a783          	lw	a5,0(a5)
  for(int s=0;s<T;++s){
     67c:	ffffff37          	lui	t5,0xfffff
     680:	ffffffb7          	lui	t6,0xfffff
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     684:	ffeb0eb7          	lui	t4,0xffeb0
     688:	ffeb0e37          	lui	t3,0xffeb0
     68c:	ffeb0bb7          	lui	s7,0xffeb0
     690:	ffeb0337          	lui	t1,0xffeb0
     694:	ffeb08b7          	lui	a7,0xffeb0
     698:	ffeb0837          	lui	a6,0xffeb0
     69c:	ffeb0537          	lui	a0,0xffeb0
     6a0:	ffeb05b7          	lui	a1,0xffeb0
  for(int s=0;s<T;++s){
     6a4:	00000793          	li	a5,0
     6a8:	1a0f0f13          	add	t5,t5,416 # fffff1a0 <__crt0_ram_last+0x7ff7f1a1>
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)?Aflat[i*LDA+k]:0; Aw[i]=(uint32_t)(uint8_t)a; }
     6ac:	00f00913          	li	s2,15
     6b0:	00400993          	li	s3,4
     6b4:	1b0f8f93          	add	t6,t6,432 # fffff1b0 <__crt0_ram_last+0x7ff7f1b1>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6b8:	ffeb0a37          	lui	s4,0xffeb0
     6bc:	004e8e93          	add	t4,t4,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     6c0:	008e0e13          	add	t3,t3,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
     6c4:	00cb8b93          	add	s7,s7,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     6c8:	01030313          	add	t1,t1,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     6cc:	01488893          	add	a7,a7,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     6d0:	01880813          	add	a6,a6,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     6d4:	01c50513          	add	a0,a0,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     6d8:	02058593          	add	a1,a1,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
    uint32_t Aw[4]={0},Bw[4]={0};
     6dc:	00812683          	lw	a3,8(sp)
     6e0:	04010613          	add	a2,sp,64
     6e4:	1a06a023          	sw	zero,416(a3)
     6e8:	1a06a223          	sw	zero,420(a3)
     6ec:	1a06a423          	sw	zero,424(a3)
     6f0:	1a06a623          	sw	zero,428(a3)
     6f4:	1a06a823          	sw	zero,432(a3)
     6f8:	1a06aa23          	sw	zero,436(a3)
     6fc:	1a06ac23          	sw	zero,440(a3)
     700:	1a06ae23          	sw	zero,444(a3)
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)?Aflat[i*LDA+k]:0; Aw[i]=(uint32_t)(uint8_t)a; }
     704:	000016b7          	lui	a3,0x1
     708:	e6068693          	add	a3,a3,-416 # e60 <_puts_r+0x10>
     70c:	01e686b3          	add	a3,a3,t5
     710:	00c683b3          	add	t2,a3,a2
     714:	800006b7          	lui	a3,0x80000
     718:	77468693          	add	a3,a3,1908 # 80000774 <Aflat.1>
     71c:	00d782b3          	add	t0,a5,a3
     720:	00000693          	li	a3,0
     724:	40d780b3          	sub	ra,a5,a3
     728:	00000613          	li	a2,0
     72c:	00196463          	bltu	s2,ra,734 <main+0x464>
     730:	00028603          	lb	a2,0(t0)
     734:	0ff67613          	zext.b	a2,a2
     738:	00c3a023          	sw	a2,0(t2)
     73c:	00168693          	add	a3,a3,1
     740:	00438393          	add	t2,t2,4
     744:	00f28293          	add	t0,t0,15
     748:	fd369ee3          	bne	a3,s3,724 <main+0x454>
     74c:	000016b7          	lui	a3,0x1
     750:	e6068693          	add	a3,a3,-416 # e60 <_puts_r+0x10>
     754:	01f686b3          	add	a3,a3,t6
     758:	04010613          	add	a2,sp,64
     75c:	00c683b3          	add	t2,a3,a2
     760:	00070293          	mv	t0,a4
    for(int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<K)?Bflat[k*LDB+j]:0; Bw[j]=(uint32_t)(uint8_t)b; }
     764:	00000693          	li	a3,0
     768:	40d780b3          	sub	ra,a5,a3
     76c:	00000613          	li	a2,0
     770:	00196463          	bltu	s2,ra,778 <main+0x4a8>
     774:	00028603          	lb	a2,0(t0)
     778:	0ff67613          	zext.b	a2,a2
     77c:	00c3a023          	sw	a2,0(t2)
     780:	00168693          	add	a3,a3,1
     784:	00438393          	add	t2,t2,4
     788:	ffd28293          	add	t0,t0,-3
     78c:	fd369ee3          	bne	a3,s3,768 <main+0x498>
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     790:	00812683          	lw	a3,8(sp)
     794:	1a06a683          	lw	a3,416(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     798:	00dea023          	sw	a3,0(t4)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     79c:	00812683          	lw	a3,8(sp)
     7a0:	1a46a683          	lw	a3,420(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7a4:	00de2023          	sw	a3,0(t3)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     7a8:	00812683          	lw	a3,8(sp)
     7ac:	1a86a683          	lw	a3,424(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7b0:	00dba023          	sw	a3,0(s7)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     7b4:	00812683          	lw	a3,8(sp)
     7b8:	1ac6a683          	lw	a3,428(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7bc:	00d32023          	sw	a3,0(t1)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     7c0:	00812683          	lw	a3,8(sp)
     7c4:	1b06a683          	lw	a3,432(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7c8:	00d8a023          	sw	a3,0(a7)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     7cc:	00812683          	lw	a3,8(sp)
     7d0:	1b46a683          	lw	a3,436(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7d4:	00d82023          	sw	a3,0(a6)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     7d8:	00812683          	lw	a3,8(sp)
     7dc:	1b86a683          	lw	a3,440(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7e0:	00d52023          	sw	a3,0(a0)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     7e4:	00812683          	lw	a3,8(sp)
     7e8:	1bc6a683          	lw	a3,444(a3)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7ec:	00d5a023          	sw	a3,0(a1)
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     7f0:	000a2683          	lw	a3,0(s4) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     7f4:	00100693          	li	a3,1
     7f8:	00da2023          	sw	a3,0(s4)
  for(int s=0;s<T;++s){
     7fc:	00178793          	add	a5,a5,1
     800:	01600693          	li	a3,22
     804:	00470713          	add	a4,a4,4
     808:	ecd79ae3          	bne	a5,a3,6dc <main+0x40c>
     80c:	fffff5b7          	lui	a1,0xfffff
     810:	000017b7          	lui	a5,0x1
     814:	1c058593          	add	a1,a1,448 # fffff1c0 <__crt0_ram_last+0x7ff7f1c1>
     818:	e6078793          	add	a5,a5,-416 # e60 <_puts_r+0x10>
     81c:	04010713          	add	a4,sp,64
     820:	00b787b3          	add	a5,a5,a1
     824:	00e785b3          	add	a1,a5,a4
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     828:	ffeb0637          	lui	a2,0xffeb0
  for(int s=0;s<T;++s){
     82c:	00058513          	mv	a0,a1
     830:	00000713          	li	a4,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     834:	04060613          	add	a2,a2,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     838:	01000813          	li	a6,16
     83c:	00271693          	sll	a3,a4,0x2
     840:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     844:	00c686b3          	add	a3,a3,a2
     848:	00f688b3          	add	a7,a3,a5
     84c:	0008a303          	lw	t1,0(a7)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     850:	00f508b3          	add	a7,a0,a5
     854:	00478793          	add	a5,a5,4
     858:	0068a023          	sw	t1,0(a7)
     85c:	ff0796e3          	bne	a5,a6,848 <main+0x578>
     860:	00470713          	add	a4,a4,4
     864:	01050513          	add	a0,a0,16
     868:	fcf71ae3          	bne	a4,a5,83c <main+0x56c>
     86c:	04058693          	add	a3,a1,64
     870:	000d0793          	mv	a5,s10
      for(int r=0;r<4;++r) for(int c=0;c<4;++c) C[i0+r][j0+c]=C4[r][c];
     874:	00078513          	mv	a0,a5
     878:	01000613          	li	a2,16
     87c:	02d12e23          	sw	a3,60(sp)
     880:	02b12c23          	sw	a1,56(sp)
     884:	7f4000ef          	jal	1078 <memcpy>
     888:	03812583          	lw	a1,56(sp)
     88c:	03c12683          	lw	a3,60(sp)
     890:	04050793          	add	a5,a0,64
     894:	01058593          	add	a1,a1,16
     898:	01000713          	li	a4,16
     89c:	fcb69ce3          	bne	a3,a1,874 <main+0x5a4>
    for(int j0=0;j0<N;j0+=4){
     8a0:	004c0c13          	add	s8,s8,4
     8a4:	010d0d13          	add	s10,s10,16
     8a8:	02ec0863          	beq	s8,a4,8d8 <main+0x608>
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) Aflat[r*LDA+k]=A[sr][k]; }
     8ac:	04000613          	li	a2,64
     8b0:	00040593          	mv	a1,s0
     8b4:	77448513          	add	a0,s1,1908 # 80000774 <Aflat.1>
     8b8:	7c0000ef          	jal	1078 <memcpy>
     8bc:	00c12783          	lw	a5,12(sp)
     8c0:	00fc06b3          	add	a3,s8,a5
     8c4:	800007b7          	lui	a5,0x80000
     8c8:	73478713          	add	a4,a5,1844 # 80000734 <Bflat.0>
     8cc:	04070613          	add	a2,a4,64
     8d0:	73478793          	add	a5,a5,1844
     8d4:	d6dff06f          	j	640 <main+0x370>
  for(int i0=0;i0<N;i0+=4){
     8d8:	004d8d93          	add	s11,s11,4
     8dc:	100c8c93          	add	s9,s9,256
     8e0:	04040413          	add	s0,s0,64
     8e4:	d58d98e3          	bne	s11,s8,634 <main+0x364>
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     8e8:	911ff0ef          	jal	1f8 <rdinstret>
     8ec:	00050d93          	mv	s11,a0
     8f0:	00058d13          	mv	s10,a1
     8f4:	8f1ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     8f8:	02812783          	lw	a5,40(sp)
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     8fc:	fffff737          	lui	a4,0xfffff
     900:	000016b7          	lui	a3,0x1
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     904:	40f50433          	sub	s0,a0,a5
     908:	02c12783          	lw	a5,44(sp)
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     90c:	40070713          	add	a4,a4,1024 # fffff400 <__crt0_ram_last+0x7ff7f401>
     910:	e6068693          	add	a3,a3,-416 # e60 <_puts_r+0x10>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     914:	40f58c33          	sub	s8,a1,a5
     918:	03012783          	lw	a5,48(sp)
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     91c:	00e686b3          	add	a3,a3,a4
     920:	04010713          	add	a4,sp,64
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     924:	40fd8cb3          	sub	s9,s11,a5
     928:	03412783          	lw	a5,52(sp)
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     92c:	00e68733          	add	a4,a3,a4
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     930:	00853533          	sltu	a0,a0,s0
     934:	40fd0d33          	sub	s10,s10,a5
     938:	019dbdb3          	sltu	s11,s11,s9
     93c:	40ac0c33          	sub	s8,s8,a0
     940:	41bd0d33          	sub	s10,s10,s11
     944:	00000793          	li	a5,0
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     948:	00e12423          	sw	a4,8(sp)
     94c:	40000693          	li	a3,1024
     950:	00812703          	lw	a4,8(sp)
     954:	00f70733          	add	a4,a4,a5
     958:	00072603          	lw	a2,0(a4)
     95c:	6a010713          	add	a4,sp,1696
     960:	00f70733          	add	a4,a4,a5
     964:	00072703          	lw	a4,0(a4)
     968:	1ce61663          	bne	a2,a4,b34 <main+0x864>
     96c:	00478793          	add	a5,a5,4
     970:	fed790e3          	bne	a5,a3,950 <main+0x680>
     974:	00100d93          	li	s11,1
     978:	fffff737          	lui	a4,0xfffff
     97c:	000016b7          	lui	a3,0x1
     980:	40070713          	add	a4,a4,1024 # fffff400 <__crt0_ram_last+0x7ff7f401>
     984:	e6068693          	add	a3,a3,-416 # e60 <_puts_r+0x10>
     988:	00e686b3          	add	a3,a3,a4
     98c:	04010713          	add	a4,sp,64
     990:	00e68733          	add	a4,a3,a4
     994:	00000793          	li	a5,0
     998:	00e12423          	sw	a4,8(sp)
     99c:	40000613          	li	a2,1024
     9a0:	00001737          	lui	a4,0x1
     9a4:	04010693          	add	a3,sp,64
     9a8:	a6070713          	add	a4,a4,-1440 # a60 <main+0x790>
     9ac:	00d70733          	add	a4,a4,a3
     9b0:	00812683          	lw	a3,8(sp)
     9b4:	00f70733          	add	a4,a4,a5
     9b8:	00072703          	lw	a4,0(a4)
     9bc:	00f686b3          	add	a3,a3,a5
     9c0:	0006a683          	lw	a3,0(a3)
     9c4:	16e69c63          	bne	a3,a4,b3c <main+0x86c>
     9c8:	00478793          	add	a5,a5,4
     9cc:	fcc79ae3          	bne	a5,a2,9a0 <main+0x6d0>
     9d0:	00100493          	li	s1,1

  int ok1=cmp(&Csw[0][0],&Ccfu[0][0]);
  int ok2=cmp(&Csw[0][0],&Ccfs[0][0]);

  printf("\n%dx%d timing summary\n", N,N);
     9d4:	0000f537          	lui	a0,0xf
     9d8:	01000593          	li	a1,16
     9dc:	01000613          	li	a2,16
     9e0:	fa450513          	add	a0,a0,-92 # efa4 <__fini_array_end+0x64>
     9e4:	404000ef          	jal	de8 <printf>
  printf("Path |   cycles   |  instret   | Speedup(cyc) | Speedup(inst)\n");
     9e8:	0000f537          	lui	a0,0xf
     9ec:	fbc50513          	add	a0,a0,-68 # efbc <__fini_array_end+0x7c>
     9f0:	58c000ef          	jal	f7c <puts>
  printf("-----+------------+------------+--------------+--------------\n");
     9f4:	0000f537          	lui	a0,0xf
     9f8:	ffc50513          	add	a0,a0,-4 # effc <__fini_array_end+0xbc>
     9fc:	580000ef          	jal	f7c <puts>
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
     a00:	01412703          	lw	a4,20(sp)
     a04:	01c12783          	lw	a5,28(sp)
     a08:	01012603          	lw	a2,16(sp)
     a0c:	01812683          	lw	a3,24(sp)
     a10:	0000f537          	lui	a0,0xf
     a14:	03c50513          	add	a0,a0,60 # f03c <__fini_array_end+0xfc>
     a18:	3d0000ef          	jal	de8 <printf>
  printf(" CFU | %10" PRIu64 " | %10" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
     a1c:	02412783          	lw	a5,36(sp)
     a20:	02012683          	lw	a3,32(sp)
     a24:	0000f537          	lui	a0,0xf
     a28:	000a8713          	mv	a4,s5
     a2c:	000b0613          	mv	a2,s6
     a30:	07450513          	add	a0,a0,116 # f074 <__fini_array_end+0x134>
     a34:	3b4000ef          	jal	de8 <printf>
     a38:	02012683          	lw	a3,32(sp)
     a3c:	01812583          	lw	a1,24(sp)
     a40:	01012503          	lw	a0,16(sp)
     a44:	000b0613          	mv	a2,s6
     a48:	0000fb37          	lui	s6,0xf
     a4c:	fc0ff0ef          	jal	20c <print_speedup_fixed>
     a50:	090b0513          	add	a0,s6,144 # f090 <__fini_array_end+0x150>
     a54:	394000ef          	jal	de8 <printf>
     a58:	01c12583          	lw	a1,28(sp)
     a5c:	02412683          	lw	a3,36(sp)
     a60:	01412503          	lw	a0,20(sp)
     a64:	000a8613          	mv	a2,s5
     a68:	fa4ff0ef          	jal	20c <print_speedup_fixed>
     a6c:	00a00513          	li	a0,10
     a70:	3c8000ef          	jal	e38 <putchar>
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");
     a74:	0000f537          	lui	a0,0xf
     a78:	000c8713          	mv	a4,s9
     a7c:	000d0793          	mv	a5,s10
     a80:	00040613          	mv	a2,s0
     a84:	000c0693          	mv	a3,s8
     a88:	09c50513          	add	a0,a0,156 # f09c <__fini_array_end+0x15c>
     a8c:	35c000ef          	jal	de8 <printf>
     a90:	01812583          	lw	a1,24(sp)
     a94:	01012503          	lw	a0,16(sp)
     a98:	00040613          	mv	a2,s0
     a9c:	000c0693          	mv	a3,s8
     aa0:	f6cff0ef          	jal	20c <print_speedup_fixed>
     aa4:	090b0513          	add	a0,s6,144
     aa8:	340000ef          	jal	de8 <printf>
     aac:	01412503          	lw	a0,20(sp)
     ab0:	01c12583          	lw	a1,28(sp)
     ab4:	000c8613          	mv	a2,s9
     ab8:	000d0693          	mv	a3,s10
     abc:	f50ff0ef          	jal	20c <print_speedup_fixed>
     ac0:	00a00513          	li	a0,10
     ac4:	374000ef          	jal	e38 <putchar>

  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     ac8:	060d8e63          	beqz	s11,b44 <main+0x874>
     acc:	0000f5b7          	lui	a1,0xf
     ad0:	f5c58593          	add	a1,a1,-164 # ef5c <__fini_array_end+0x1c>
     ad4:	06048e63          	beqz	s1,b50 <main+0x880>
     ad8:	0000f637          	lui	a2,0xf
     adc:	f5c60613          	add	a2,a2,-164 # ef5c <__fini_array_end+0x1c>
     ae0:	0000f537          	lui	a0,0xf
     ae4:	0b850513          	add	a0,a0,184 # f0b8 <__fini_array_end+0x178>
     ae8:	300000ef          	jal	de8 <printf>
  return (ok1&&ok2)?0:1;
}
     aec:	6f010113          	add	sp,sp,1776
     af0:	7ec12083          	lw	ra,2028(sp)
  return (ok1&&ok2)?0:1;
     af4:	01b4f533          	and	a0,s1,s11
}
     af8:	7e812403          	lw	s0,2024(sp)
     afc:	7e412483          	lw	s1,2020(sp)
     b00:	7e012903          	lw	s2,2016(sp)
     b04:	7dc12983          	lw	s3,2012(sp)
     b08:	7d812a03          	lw	s4,2008(sp)
     b0c:	7d412a83          	lw	s5,2004(sp)
     b10:	7d012b03          	lw	s6,2000(sp)
     b14:	7cc12b83          	lw	s7,1996(sp)
     b18:	7c812c03          	lw	s8,1992(sp)
     b1c:	7c412c83          	lw	s9,1988(sp)
     b20:	7c012d03          	lw	s10,1984(sp)
     b24:	7bc12d83          	lw	s11,1980(sp)
     b28:	00154513          	xor	a0,a0,1
     b2c:	7f010113          	add	sp,sp,2032
     b30:	00008067          	ret
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     b34:	00000d93          	li	s11,0
     b38:	e41ff06f          	j	978 <main+0x6a8>
     b3c:	00000493          	li	s1,0
     b40:	e95ff06f          	j	9d4 <main+0x704>
  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     b44:	0000f5b7          	lui	a1,0xf
     b48:	f6458593          	add	a1,a1,-156 # ef64 <__fini_array_end+0x24>
     b4c:	f89ff06f          	j	ad4 <main+0x804>
     b50:	0000f637          	lui	a2,0xf
     b54:	f6460613          	add	a2,a2,-156 # ef64 <__fini_array_end+0x24>
     b58:	f89ff06f          	j	ae0 <main+0x810>

00000b5c <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     b5c:	fffff097          	auipc	ra,0xfffff
     b60:	5fc08093          	add	ra,ra,1532 # 158 <__crt0_main_exit>
     b64:	00050513          	mv	a0,a0
     b68:	00008067          	ret

00000b6c <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     b6c:	fff00513          	li	a0,-1
     b70:	00008067          	ret

00000b74 <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     b74:	000027b7          	lui	a5,0x2
     b78:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     b7c:	00000513          	li	a0,0
     b80:	00008067          	ret

00000b84 <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     b84:	00100513          	li	a0,1
     b88:	00008067          	ret

00000b8c <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     b8c:	00100513          	li	a0,1
     b90:	00008067          	ret

00000b94 <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     b94:	800007b7          	lui	a5,0x80000
     b98:	01600713          	li	a4,22
     b9c:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     ba0:	fff00513          	li	a0,-1
     ba4:	00008067          	ret

00000ba8 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     ba8:	00000513          	li	a0,0
     bac:	00008067          	ret

00000bb0 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     bb0:	fe010113          	add	sp,sp,-32
     bb4:	00912a23          	sw	s1,20(sp)
     bb8:	01212823          	sw	s2,16(sp)
     bbc:	00112e23          	sw	ra,28(sp)
     bc0:	00812c23          	sw	s0,24(sp)
     bc4:	01312623          	sw	s3,12(sp)
     bc8:	01412423          	sw	s4,8(sp)
     bcc:	00058913          	mv	s2,a1
     bd0:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     bd4:	06051463          	bnez	a0,c3c <_read+0x8c>
     bd8:	00050413          	mv	s0,a0
     bdc:	fff50537          	lui	a0,0xfff50
     be0:	1a0000ef          	jal	d80 <neorv32_uart_available>
     be4:	04050c63          	beqz	a0,c3c <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     be8:	00a00993          	li	s3,10
     bec:	00d00a13          	li	s4,13
    while (len--) {
     bf0:	00941663          	bne	s0,s1,bfc <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     bf4:	00048413          	mv	s0,s1
     bf8:	0200006f          	j	c18 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     bfc:	fff50537          	lui	a0,0xfff50
     c00:	1d0000ef          	jal	dd0 <neorv32_uart_getc>
      *ptr++ = c;
     c04:	008907b3          	add	a5,s2,s0
     c08:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     c0c:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c10:	01350463          	beq	a0,s3,c18 <_read+0x68>
     c14:	fd451ee3          	bne	a0,s4,bf0 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     c18:	01c12083          	lw	ra,28(sp)
     c1c:	00040513          	mv	a0,s0
     c20:	01812403          	lw	s0,24(sp)
     c24:	01412483          	lw	s1,20(sp)
     c28:	01012903          	lw	s2,16(sp)
     c2c:	00c12983          	lw	s3,12(sp)
     c30:	00812a03          	lw	s4,8(sp)
     c34:	02010113          	add	sp,sp,32
     c38:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     c3c:	fff60537          	lui	a0,0xfff60
     c40:	140000ef          	jal	d80 <neorv32_uart_available>
  int read_cnt = 0;
     c44:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     c48:	02050863          	beqz	a0,c78 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c4c:	00a00993          	li	s3,10
     c50:	00d00a13          	li	s4,13
    while (len--) {
     c54:	fa9400e3          	beq	s0,s1,bf4 <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     c58:	fff60537          	lui	a0,0xfff60
     c5c:	174000ef          	jal	dd0 <neorv32_uart_getc>
      *ptr++ = c;
     c60:	008907b3          	add	a5,s2,s0
     c64:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     c68:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     c6c:	fb3506e3          	beq	a0,s3,c18 <_read+0x68>
     c70:	ff4512e3          	bne	a0,s4,c54 <_read+0xa4>
     c74:	fa5ff06f          	j	c18 <_read+0x68>
    errno = ENOSYS;
     c78:	800007b7          	lui	a5,0x80000
     c7c:	05800713          	li	a4,88
     c80:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     c84:	fff00413          	li	s0,-1
     c88:	f91ff06f          	j	c18 <_read+0x68>

00000c8c <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     c8c:	ff010113          	add	sp,sp,-16
     c90:	00812423          	sw	s0,8(sp)
     c94:	00912223          	sw	s1,4(sp)
     c98:	00112623          	sw	ra,12(sp)
     c9c:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     ca0:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     ca4:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     ca8:	00058413          	mv	s0,a1
     cac:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     cb0:	04a7ec63          	bltu	a5,a0,d08 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     cb4:	fff50537          	lui	a0,0xfff50
     cb8:	0c8000ef          	jal	d80 <neorv32_uart_available>
     cbc:	00940933          	add	s2,s0,s1
     cc0:	02051463          	bnez	a0,ce8 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     cc4:	800007b7          	lui	a5,0x80000
     cc8:	05800713          	li	a4,88
     ccc:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     cd0:	fff00493          	li	s1,-1
     cd4:	0180006f          	j	cec <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     cd8:	00044583          	lbu	a1,0(s0)
     cdc:	fff50537          	lui	a0,0xfff50
     ce0:	00140413          	add	s0,s0,1
     ce4:	0d8000ef          	jal	dbc <neorv32_uart_putc>
      while (len--) {
     ce8:	fe8918e3          	bne	s2,s0,cd8 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     cec:	00c12083          	lw	ra,12(sp)
     cf0:	00812403          	lw	s0,8(sp)
     cf4:	00012903          	lw	s2,0(sp)
     cf8:	00048513          	mv	a0,s1
     cfc:	00412483          	lw	s1,4(sp)
     d00:	01010113          	add	sp,sp,16
     d04:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     d08:	fff60537          	lui	a0,0xfff60
     d0c:	074000ef          	jal	d80 <neorv32_uart_available>
     d10:	00940933          	add	s2,s0,s1
     d14:	fa0508e3          	beqz	a0,cc4 <_write+0x38>
    while (len--) {
     d18:	fd240ae3          	beq	s0,s2,cec <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     d1c:	00044583          	lbu	a1,0(s0)
     d20:	fff60537          	lui	a0,0xfff60
     d24:	00140413          	add	s0,s0,1
     d28:	094000ef          	jal	dbc <neorv32_uart_putc>
      write_cnt++;
     d2c:	fedff06f          	j	d18 <_write+0x8c>

00000d30 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     d30:	80000737          	lui	a4,0x80000
     d34:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     d38:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     d3c:	00050793          	mv	a5,a0
     d40:	91460613          	add	a2,a2,-1772 # 80000914 <__crt0_bss_end>
  if (curr_heap == NULL) {
     d44:	00069463          	bnez	a3,d4c <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     d48:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     d4c:	800016b7          	lui	a3,0x80001
     d50:	91468693          	add	a3,a3,-1772 # 80000914 <__crt0_bss_end>
     d54:	00c69c63          	bne	a3,a2,d6c <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     d58:	800007b7          	lui	a5,0x80000
     d5c:	00c00713          	li	a4,12
     d60:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     d64:	fff00513          	li	a0,-1
     d68:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     d6c:	71472503          	lw	a0,1812(a4)
     d70:	00f507b3          	add	a5,a0,a5
     d74:	fed7f2e3          	bgeu	a5,a3,d58 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     d78:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     d7c:	00008067          	ret

00000d80 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     d80:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     d84:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     d88:	00e51c63          	bne	a0,a4,da0 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     d8c:	fffe07b7          	lui	a5,0xfffe0
     d90:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     d94:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     d98:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     d9c:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     da0:	fff60737          	lui	a4,0xfff60
    return 0;
     da4:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     da8:	fee79ae3          	bne	a5,a4,d9c <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     dac:	fffe07b7          	lui	a5,0xfffe0
     db0:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     db4:	020007b7          	lui	a5,0x2000
     db8:	fe1ff06f          	j	d98 <neorv32_uart_available+0x18>

00000dbc <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     dbc:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     dc0:	00a79713          	sll	a4,a5,0xa
     dc4:	fe075ce3          	bgez	a4,dbc <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     dc8:	00b52223          	sw	a1,4(a0)
}
     dcc:	00008067          	ret

00000dd0 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     dd0:	00052783          	lw	a5,0(a0)
     dd4:	00f79713          	sll	a4,a5,0xf
     dd8:	fe075ce3          	bgez	a4,dd0 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     ddc:	00452503          	lw	a0,4(a0)
}
     de0:	0ff57513          	zext.b	a0,a0
     de4:	00008067          	ret

00000de8 <printf>:
     de8:	fc010113          	add	sp,sp,-64
     dec:	02c12423          	sw	a2,40(sp)
     df0:	02d12623          	sw	a3,44(sp)
     df4:	80000317          	auipc	t1,0x80000
     df8:	91432303          	lw	t1,-1772(t1) # 80000708 <_impure_ptr>
     dfc:	02b12223          	sw	a1,36(sp)
     e00:	02e12823          	sw	a4,48(sp)
     e04:	02f12a23          	sw	a5,52(sp)
     e08:	03012c23          	sw	a6,56(sp)
     e0c:	03112e23          	sw	a7,60(sp)
     e10:	00832583          	lw	a1,8(t1)
     e14:	02410693          	add	a3,sp,36
     e18:	00050613          	mv	a2,a0
     e1c:	00030513          	mv	a0,t1
     e20:	00112e23          	sw	ra,28(sp)
     e24:	00d12623          	sw	a3,12(sp)
     e28:	0c8010ef          	jal	1ef0 <_vfprintf_r>
     e2c:	01c12083          	lw	ra,28(sp)
     e30:	04010113          	add	sp,sp,64
     e34:	00008067          	ret

00000e38 <putchar>:
     e38:	80000797          	auipc	a5,0x80000
     e3c:	8d07a783          	lw	a5,-1840(a5) # 80000708 <_impure_ptr>
     e40:	0087a603          	lw	a2,8(a5)
     e44:	00050593          	mv	a1,a0
     e48:	00078513          	mv	a0,a5
     e4c:	3c00606f          	j	720c <_putc_r>

00000e50 <_puts_r>:
     e50:	fd010113          	add	sp,sp,-48
     e54:	02812423          	sw	s0,40(sp)
     e58:	00050413          	mv	s0,a0
     e5c:	00058513          	mv	a0,a1
     e60:	02912223          	sw	s1,36(sp)
     e64:	02112623          	sw	ra,44(sp)
     e68:	00058493          	mv	s1,a1
     e6c:	3b0000ef          	jal	121c <strlen>
     e70:	00150713          	add	a4,a0,1
     e74:	0000e697          	auipc	a3,0xe
     e78:	1fc68693          	add	a3,a3,508 # f070 <__fini_array_end+0x130>
     e7c:	00e12623          	sw	a4,12(sp)
     e80:	03442783          	lw	a5,52(s0)
     e84:	01010713          	add	a4,sp,16
     e88:	00d12c23          	sw	a3,24(sp)
     e8c:	00e12223          	sw	a4,4(sp)
     e90:	00100693          	li	a3,1
     e94:	00200713          	li	a4,2
     e98:	00912823          	sw	s1,16(sp)
     e9c:	00a12a23          	sw	a0,20(sp)
     ea0:	00d12e23          	sw	a3,28(sp)
     ea4:	00e12423          	sw	a4,8(sp)
     ea8:	00842483          	lw	s1,8(s0)
     eac:	0c078263          	beqz	a5,f70 <_puts_r+0x120>
     eb0:	0644a703          	lw	a4,100(s1)
     eb4:	00c49783          	lh	a5,12(s1)
     eb8:	00177713          	and	a4,a4,1
     ebc:	00071663          	bnez	a4,ec8 <_puts_r+0x78>
     ec0:	2007f713          	and	a4,a5,512
     ec4:	08070e63          	beqz	a4,f60 <_puts_r+0x110>
     ec8:	01279713          	sll	a4,a5,0x12
     ecc:	02074263          	bltz	a4,ef0 <_puts_r+0xa0>
     ed0:	0644a703          	lw	a4,100(s1)
     ed4:	ffffe6b7          	lui	a3,0xffffe
     ed8:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     edc:	00002637          	lui	a2,0x2
     ee0:	00c7e7b3          	or	a5,a5,a2
     ee4:	00d77733          	and	a4,a4,a3
     ee8:	00f49623          	sh	a5,12(s1)
     eec:	06e4a223          	sw	a4,100(s1)
     ef0:	00040513          	mv	a0,s0
     ef4:	00410613          	add	a2,sp,4
     ef8:	00048593          	mv	a1,s1
     efc:	549050ef          	jal	6c44 <__sfvwrite_r>
     f00:	0644a783          	lw	a5,100(s1)
     f04:	00153413          	seqz	s0,a0
     f08:	40800433          	neg	s0,s0
     f0c:	00b47413          	and	s0,s0,11
     f10:	0017f793          	and	a5,a5,1
     f14:	fff40413          	add	s0,s0,-1
     f18:	00079863          	bnez	a5,f28 <_puts_r+0xd8>
     f1c:	00c4d783          	lhu	a5,12(s1)
     f20:	2007f793          	and	a5,a5,512
     f24:	00078e63          	beqz	a5,f40 <_puts_r+0xf0>
     f28:	02c12083          	lw	ra,44(sp)
     f2c:	00040513          	mv	a0,s0
     f30:	02812403          	lw	s0,40(sp)
     f34:	02412483          	lw	s1,36(sp)
     f38:	03010113          	add	sp,sp,48
     f3c:	00008067          	ret
     f40:	0584a503          	lw	a0,88(s1)
     f44:	054000ef          	jal	f98 <__retarget_lock_release_recursive>
     f48:	02c12083          	lw	ra,44(sp)
     f4c:	00040513          	mv	a0,s0
     f50:	02812403          	lw	s0,40(sp)
     f54:	02412483          	lw	s1,36(sp)
     f58:	03010113          	add	sp,sp,48
     f5c:	00008067          	ret
     f60:	0584a503          	lw	a0,88(s1)
     f64:	030000ef          	jal	f94 <__retarget_lock_acquire_recursive>
     f68:	00c49783          	lh	a5,12(s1)
     f6c:	f5dff06f          	j	ec8 <_puts_r+0x78>
     f70:	00040513          	mv	a0,s0
     f74:	449050ef          	jal	6bbc <__sinit>
     f78:	f39ff06f          	j	eb0 <_puts_r+0x60>

00000f7c <puts>:
     f7c:	00050593          	mv	a1,a0
     f80:	7ffff517          	auipc	a0,0x7ffff
     f84:	78852503          	lw	a0,1928(a0) # 80000708 <_impure_ptr>
     f88:	ec9ff06f          	j	e50 <_puts_r>

00000f8c <__retarget_lock_init_recursive>:
     f8c:	00008067          	ret

00000f90 <__retarget_lock_close_recursive>:
     f90:	00008067          	ret

00000f94 <__retarget_lock_acquire_recursive>:
     f94:	00008067          	ret

00000f98 <__retarget_lock_release_recursive>:
     f98:	00008067          	ret

00000f9c <memset>:
     f9c:	00f00313          	li	t1,15
     fa0:	00050713          	mv	a4,a0
     fa4:	02c37e63          	bgeu	t1,a2,fe0 <memset+0x44>
     fa8:	00f77793          	and	a5,a4,15
     fac:	0a079063          	bnez	a5,104c <memset+0xb0>
     fb0:	08059263          	bnez	a1,1034 <memset+0x98>
     fb4:	ff067693          	and	a3,a2,-16
     fb8:	00f67613          	and	a2,a2,15
     fbc:	00e686b3          	add	a3,a3,a4
     fc0:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     fc4:	00b72223          	sw	a1,4(a4)
     fc8:	00b72423          	sw	a1,8(a4)
     fcc:	00b72623          	sw	a1,12(a4)
     fd0:	01070713          	add	a4,a4,16
     fd4:	fed766e3          	bltu	a4,a3,fc0 <memset+0x24>
     fd8:	00061463          	bnez	a2,fe0 <memset+0x44>
     fdc:	00008067          	ret
     fe0:	40c306b3          	sub	a3,t1,a2
     fe4:	00269693          	sll	a3,a3,0x2
     fe8:	00000297          	auipc	t0,0x0
     fec:	005686b3          	add	a3,a3,t0
     ff0:	00c68067          	jr	12(a3)
     ff4:	00b70723          	sb	a1,14(a4)
     ff8:	00b706a3          	sb	a1,13(a4)
     ffc:	00b70623          	sb	a1,12(a4)
    1000:	00b705a3          	sb	a1,11(a4)
    1004:	00b70523          	sb	a1,10(a4)
    1008:	00b704a3          	sb	a1,9(a4)
    100c:	00b70423          	sb	a1,8(a4)
    1010:	00b703a3          	sb	a1,7(a4)
    1014:	00b70323          	sb	a1,6(a4)
    1018:	00b702a3          	sb	a1,5(a4)
    101c:	00b70223          	sb	a1,4(a4)
    1020:	00b701a3          	sb	a1,3(a4)
    1024:	00b70123          	sb	a1,2(a4)
    1028:	00b700a3          	sb	a1,1(a4)
    102c:	00b70023          	sb	a1,0(a4)
    1030:	00008067          	ret
    1034:	0ff5f593          	zext.b	a1,a1
    1038:	00859693          	sll	a3,a1,0x8
    103c:	00d5e5b3          	or	a1,a1,a3
    1040:	01059693          	sll	a3,a1,0x10
    1044:	00d5e5b3          	or	a1,a1,a3
    1048:	f6dff06f          	j	fb4 <memset+0x18>
    104c:	00279693          	sll	a3,a5,0x2
    1050:	00000297          	auipc	t0,0x0
    1054:	005686b3          	add	a3,a3,t0
    1058:	00008293          	mv	t0,ra
    105c:	fa0680e7          	jalr	-96(a3)
    1060:	00028093          	mv	ra,t0
    1064:	ff078793          	add	a5,a5,-16
    1068:	40f70733          	sub	a4,a4,a5
    106c:	00f60633          	add	a2,a2,a5
    1070:	f6c378e3          	bgeu	t1,a2,fe0 <memset+0x44>
    1074:	f3dff06f          	j	fb0 <memset+0x14>

00001078 <memcpy>:
    1078:	00a5c7b3          	xor	a5,a1,a0
    107c:	0037f793          	and	a5,a5,3
    1080:	00c508b3          	add	a7,a0,a2
    1084:	06079463          	bnez	a5,10ec <memcpy+0x74>
    1088:	00300793          	li	a5,3
    108c:	06c7f063          	bgeu	a5,a2,10ec <memcpy+0x74>
    1090:	00357793          	and	a5,a0,3
    1094:	00050713          	mv	a4,a0
    1098:	06079a63          	bnez	a5,110c <memcpy+0x94>
    109c:	ffc8f613          	and	a2,a7,-4
    10a0:	40e606b3          	sub	a3,a2,a4
    10a4:	02000793          	li	a5,32
    10a8:	08d7ce63          	blt	a5,a3,1144 <memcpy+0xcc>
    10ac:	00058693          	mv	a3,a1
    10b0:	00070793          	mv	a5,a4
    10b4:	02c77863          	bgeu	a4,a2,10e4 <memcpy+0x6c>
    10b8:	0006a803          	lw	a6,0(a3)
    10bc:	00478793          	add	a5,a5,4
    10c0:	00468693          	add	a3,a3,4
    10c4:	ff07ae23          	sw	a6,-4(a5)
    10c8:	fec7e8e3          	bltu	a5,a2,10b8 <memcpy+0x40>
    10cc:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x10f>
    10d0:	40e787b3          	sub	a5,a5,a4
    10d4:	ffc7f793          	and	a5,a5,-4
    10d8:	00478793          	add	a5,a5,4
    10dc:	00f70733          	add	a4,a4,a5
    10e0:	00f585b3          	add	a1,a1,a5
    10e4:	01176863          	bltu	a4,a7,10f4 <memcpy+0x7c>
    10e8:	00008067          	ret
    10ec:	00050713          	mv	a4,a0
    10f0:	05157863          	bgeu	a0,a7,1140 <memcpy+0xc8>
    10f4:	0005c783          	lbu	a5,0(a1)
    10f8:	00170713          	add	a4,a4,1
    10fc:	00158593          	add	a1,a1,1
    1100:	fef70fa3          	sb	a5,-1(a4)
    1104:	fee898e3          	bne	a7,a4,10f4 <memcpy+0x7c>
    1108:	00008067          	ret
    110c:	0005c683          	lbu	a3,0(a1)
    1110:	00170713          	add	a4,a4,1
    1114:	00377793          	and	a5,a4,3
    1118:	fed70fa3          	sb	a3,-1(a4)
    111c:	00158593          	add	a1,a1,1
    1120:	f6078ee3          	beqz	a5,109c <memcpy+0x24>
    1124:	0005c683          	lbu	a3,0(a1)
    1128:	00170713          	add	a4,a4,1
    112c:	00377793          	and	a5,a4,3
    1130:	fed70fa3          	sb	a3,-1(a4)
    1134:	00158593          	add	a1,a1,1
    1138:	fc079ae3          	bnez	a5,110c <memcpy+0x94>
    113c:	f61ff06f          	j	109c <memcpy+0x24>
    1140:	00008067          	ret
    1144:	ff010113          	add	sp,sp,-16
    1148:	00812623          	sw	s0,12(sp)
    114c:	02000413          	li	s0,32
    1150:	0005a383          	lw	t2,0(a1)
    1154:	0045a283          	lw	t0,4(a1)
    1158:	0085af83          	lw	t6,8(a1)
    115c:	00c5af03          	lw	t5,12(a1)
    1160:	0105ae83          	lw	t4,16(a1)
    1164:	0145ae03          	lw	t3,20(a1)
    1168:	0185a303          	lw	t1,24(a1)
    116c:	01c5a803          	lw	a6,28(a1)
    1170:	0205a683          	lw	a3,32(a1)
    1174:	02470713          	add	a4,a4,36
    1178:	40e607b3          	sub	a5,a2,a4
    117c:	fc772e23          	sw	t2,-36(a4)
    1180:	fe572023          	sw	t0,-32(a4)
    1184:	fff72223          	sw	t6,-28(a4)
    1188:	ffe72423          	sw	t5,-24(a4)
    118c:	ffd72623          	sw	t4,-20(a4)
    1190:	ffc72823          	sw	t3,-16(a4)
    1194:	fe672a23          	sw	t1,-12(a4)
    1198:	ff072c23          	sw	a6,-8(a4)
    119c:	fed72e23          	sw	a3,-4(a4)
    11a0:	02458593          	add	a1,a1,36
    11a4:	faf446e3          	blt	s0,a5,1150 <memcpy+0xd8>
    11a8:	00058693          	mv	a3,a1
    11ac:	00070793          	mv	a5,a4
    11b0:	02c77863          	bgeu	a4,a2,11e0 <memcpy+0x168>
    11b4:	0006a803          	lw	a6,0(a3)
    11b8:	00478793          	add	a5,a5,4
    11bc:	00468693          	add	a3,a3,4
    11c0:	ff07ae23          	sw	a6,-4(a5)
    11c4:	fec7e8e3          	bltu	a5,a2,11b4 <memcpy+0x13c>
    11c8:	fff60793          	add	a5,a2,-1
    11cc:	40e787b3          	sub	a5,a5,a4
    11d0:	ffc7f793          	and	a5,a5,-4
    11d4:	00478793          	add	a5,a5,4
    11d8:	00f70733          	add	a4,a4,a5
    11dc:	00f585b3          	add	a1,a1,a5
    11e0:	01176863          	bltu	a4,a7,11f0 <memcpy+0x178>
    11e4:	00c12403          	lw	s0,12(sp)
    11e8:	01010113          	add	sp,sp,16
    11ec:	00008067          	ret
    11f0:	0005c783          	lbu	a5,0(a1)
    11f4:	00170713          	add	a4,a4,1
    11f8:	00158593          	add	a1,a1,1
    11fc:	fef70fa3          	sb	a5,-1(a4)
    1200:	fee882e3          	beq	a7,a4,11e4 <memcpy+0x16c>
    1204:	0005c783          	lbu	a5,0(a1)
    1208:	00170713          	add	a4,a4,1
    120c:	00158593          	add	a1,a1,1
    1210:	fef70fa3          	sb	a5,-1(a4)
    1214:	fce89ee3          	bne	a7,a4,11f0 <memcpy+0x178>
    1218:	fcdff06f          	j	11e4 <memcpy+0x16c>

0000121c <strlen>:
    121c:	00357793          	and	a5,a0,3
    1220:	00050713          	mv	a4,a0
    1224:	04079c63          	bnez	a5,127c <strlen+0x60>
    1228:	7f7f86b7          	lui	a3,0x7f7f8
    122c:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    1230:	fff00593          	li	a1,-1
    1234:	00072603          	lw	a2,0(a4)
    1238:	00470713          	add	a4,a4,4
    123c:	00d677b3          	and	a5,a2,a3
    1240:	00d787b3          	add	a5,a5,a3
    1244:	00c7e7b3          	or	a5,a5,a2
    1248:	00d7e7b3          	or	a5,a5,a3
    124c:	feb784e3          	beq	a5,a1,1234 <strlen+0x18>
    1250:	ffc74683          	lbu	a3,-4(a4)
    1254:	40a707b3          	sub	a5,a4,a0
    1258:	04068463          	beqz	a3,12a0 <strlen+0x84>
    125c:	ffd74683          	lbu	a3,-3(a4)
    1260:	02068c63          	beqz	a3,1298 <strlen+0x7c>
    1264:	ffe74503          	lbu	a0,-2(a4)
    1268:	00a03533          	snez	a0,a0
    126c:	00f50533          	add	a0,a0,a5
    1270:	ffe50513          	add	a0,a0,-2
    1274:	00008067          	ret
    1278:	fa0688e3          	beqz	a3,1228 <strlen+0xc>
    127c:	00074783          	lbu	a5,0(a4)
    1280:	00170713          	add	a4,a4,1
    1284:	00377693          	and	a3,a4,3
    1288:	fe0798e3          	bnez	a5,1278 <strlen+0x5c>
    128c:	40a70733          	sub	a4,a4,a0
    1290:	fff70513          	add	a0,a4,-1
    1294:	00008067          	ret
    1298:	ffd78513          	add	a0,a5,-3
    129c:	00008067          	ret
    12a0:	ffc78513          	add	a0,a5,-4
    12a4:	00008067          	ret

000012a8 <_malloc_trim_r>:
    12a8:	fe010113          	add	sp,sp,-32
    12ac:	00812c23          	sw	s0,24(sp)
    12b0:	00912a23          	sw	s1,20(sp)
    12b4:	01212823          	sw	s2,16(sp)
    12b8:	01312623          	sw	s3,12(sp)
    12bc:	01412423          	sw	s4,8(sp)
    12c0:	00058993          	mv	s3,a1
    12c4:	00112e23          	sw	ra,28(sp)
    12c8:	00050913          	mv	s2,a0
    12cc:	7ffffa17          	auipc	s4,0x7ffff
    12d0:	e54a0a13          	add	s4,s4,-428 # 80000120 <__malloc_av_>
    12d4:	405000ef          	jal	1ed8 <__malloc_lock>
    12d8:	008a2703          	lw	a4,8(s4)
    12dc:	000017b7          	lui	a5,0x1
    12e0:	fef78793          	add	a5,a5,-17 # fef <memset+0x53>
    12e4:	00472483          	lw	s1,4(a4)
    12e8:	00001737          	lui	a4,0x1
    12ec:	ffc4f493          	and	s1,s1,-4
    12f0:	00f48433          	add	s0,s1,a5
    12f4:	41340433          	sub	s0,s0,s3
    12f8:	00c45413          	srl	s0,s0,0xc
    12fc:	fff40413          	add	s0,s0,-1
    1300:	00c41413          	sll	s0,s0,0xc
    1304:	00e44e63          	blt	s0,a4,1320 <_malloc_trim_r+0x78>
    1308:	00000593          	li	a1,0
    130c:	00090513          	mv	a0,s2
    1310:	105060ef          	jal	7c14 <_sbrk_r>
    1314:	008a2783          	lw	a5,8(s4)
    1318:	009787b3          	add	a5,a5,s1
    131c:	02f50863          	beq	a0,a5,134c <_malloc_trim_r+0xa4>
    1320:	00090513          	mv	a0,s2
    1324:	3c1000ef          	jal	1ee4 <__malloc_unlock>
    1328:	01c12083          	lw	ra,28(sp)
    132c:	01812403          	lw	s0,24(sp)
    1330:	01412483          	lw	s1,20(sp)
    1334:	01012903          	lw	s2,16(sp)
    1338:	00c12983          	lw	s3,12(sp)
    133c:	00812a03          	lw	s4,8(sp)
    1340:	00000513          	li	a0,0
    1344:	02010113          	add	sp,sp,32
    1348:	00008067          	ret
    134c:	408005b3          	neg	a1,s0
    1350:	00090513          	mv	a0,s2
    1354:	0c1060ef          	jal	7c14 <_sbrk_r>
    1358:	fff00793          	li	a5,-1
    135c:	04f50a63          	beq	a0,a5,13b0 <_malloc_trim_r+0x108>
    1360:	7ffff717          	auipc	a4,0x7ffff
    1364:	45470713          	add	a4,a4,1108 # 800007b4 <__malloc_current_mallinfo>
    1368:	00072783          	lw	a5,0(a4)
    136c:	008a2683          	lw	a3,8(s4)
    1370:	408484b3          	sub	s1,s1,s0
    1374:	0014e493          	or	s1,s1,1
    1378:	408787b3          	sub	a5,a5,s0
    137c:	00090513          	mv	a0,s2
    1380:	0096a223          	sw	s1,4(a3)
    1384:	00f72023          	sw	a5,0(a4)
    1388:	35d000ef          	jal	1ee4 <__malloc_unlock>
    138c:	01c12083          	lw	ra,28(sp)
    1390:	01812403          	lw	s0,24(sp)
    1394:	01412483          	lw	s1,20(sp)
    1398:	01012903          	lw	s2,16(sp)
    139c:	00c12983          	lw	s3,12(sp)
    13a0:	00812a03          	lw	s4,8(sp)
    13a4:	00100513          	li	a0,1
    13a8:	02010113          	add	sp,sp,32
    13ac:	00008067          	ret
    13b0:	00000593          	li	a1,0
    13b4:	00090513          	mv	a0,s2
    13b8:	05d060ef          	jal	7c14 <_sbrk_r>
    13bc:	008a2703          	lw	a4,8(s4)
    13c0:	00f00693          	li	a3,15
    13c4:	40e507b3          	sub	a5,a0,a4
    13c8:	f4f6dce3          	bge	a3,a5,1320 <_malloc_trim_r+0x78>
    13cc:	7ffff697          	auipc	a3,0x7ffff
    13d0:	3406a683          	lw	a3,832(a3) # 8000070c <__malloc_sbrk_base>
    13d4:	40d50533          	sub	a0,a0,a3
    13d8:	0017e793          	or	a5,a5,1
    13dc:	7ffff697          	auipc	a3,0x7ffff
    13e0:	3ca6ac23          	sw	a0,984(a3) # 800007b4 <__malloc_current_mallinfo>
    13e4:	00f72223          	sw	a5,4(a4)
    13e8:	f39ff06f          	j	1320 <_malloc_trim_r+0x78>

000013ec <_free_r>:
    13ec:	18058263          	beqz	a1,1570 <_free_r+0x184>
    13f0:	ff010113          	add	sp,sp,-16
    13f4:	00812423          	sw	s0,8(sp)
    13f8:	00912223          	sw	s1,4(sp)
    13fc:	00058413          	mv	s0,a1
    1400:	00050493          	mv	s1,a0
    1404:	00112623          	sw	ra,12(sp)
    1408:	2d1000ef          	jal	1ed8 <__malloc_lock>
    140c:	ffc42583          	lw	a1,-4(s0)
    1410:	ff840713          	add	a4,s0,-8
    1414:	7ffff517          	auipc	a0,0x7ffff
    1418:	d0c50513          	add	a0,a0,-756 # 80000120 <__malloc_av_>
    141c:	ffe5f793          	and	a5,a1,-2
    1420:	00f70633          	add	a2,a4,a5
    1424:	00462683          	lw	a3,4(a2)
    1428:	00852803          	lw	a6,8(a0)
    142c:	ffc6f693          	and	a3,a3,-4
    1430:	1ac80263          	beq	a6,a2,15d4 <_free_r+0x1e8>
    1434:	00d62223          	sw	a3,4(a2)
    1438:	0015f593          	and	a1,a1,1
    143c:	00d60833          	add	a6,a2,a3
    1440:	0a059063          	bnez	a1,14e0 <_free_r+0xf4>
    1444:	ff842303          	lw	t1,-8(s0)
    1448:	00482583          	lw	a1,4(a6)
    144c:	7ffff897          	auipc	a7,0x7ffff
    1450:	cdc88893          	add	a7,a7,-804 # 80000128 <__malloc_av_+0x8>
    1454:	40670733          	sub	a4,a4,t1
    1458:	00872803          	lw	a6,8(a4)
    145c:	006787b3          	add	a5,a5,t1
    1460:	0015f593          	and	a1,a1,1
    1464:	15180263          	beq	a6,a7,15a8 <_free_r+0x1bc>
    1468:	00c72303          	lw	t1,12(a4)
    146c:	00682623          	sw	t1,12(a6)
    1470:	01032423          	sw	a6,8(t1)
    1474:	1a058a63          	beqz	a1,1628 <_free_r+0x23c>
    1478:	0017e693          	or	a3,a5,1
    147c:	00d72223          	sw	a3,4(a4)
    1480:	00f62023          	sw	a5,0(a2)
    1484:	1ff00693          	li	a3,511
    1488:	06f6ec63          	bltu	a3,a5,1500 <_free_r+0x114>
    148c:	ff87f693          	and	a3,a5,-8
    1490:	00868693          	add	a3,a3,8
    1494:	00452583          	lw	a1,4(a0)
    1498:	00d506b3          	add	a3,a0,a3
    149c:	0006a603          	lw	a2,0(a3)
    14a0:	0057d813          	srl	a6,a5,0x5
    14a4:	00100793          	li	a5,1
    14a8:	010797b3          	sll	a5,a5,a6
    14ac:	00b7e7b3          	or	a5,a5,a1
    14b0:	ff868593          	add	a1,a3,-8
    14b4:	00b72623          	sw	a1,12(a4)
    14b8:	00c72423          	sw	a2,8(a4)
    14bc:	00f52223          	sw	a5,4(a0)
    14c0:	00e6a023          	sw	a4,0(a3)
    14c4:	00e62623          	sw	a4,12(a2)
    14c8:	00812403          	lw	s0,8(sp)
    14cc:	00c12083          	lw	ra,12(sp)
    14d0:	00048513          	mv	a0,s1
    14d4:	00412483          	lw	s1,4(sp)
    14d8:	01010113          	add	sp,sp,16
    14dc:	2090006f          	j	1ee4 <__malloc_unlock>
    14e0:	00482583          	lw	a1,4(a6)
    14e4:	0015f593          	and	a1,a1,1
    14e8:	08058663          	beqz	a1,1574 <_free_r+0x188>
    14ec:	0017e693          	or	a3,a5,1
    14f0:	fed42e23          	sw	a3,-4(s0)
    14f4:	00f62023          	sw	a5,0(a2)
    14f8:	1ff00693          	li	a3,511
    14fc:	f8f6f8e3          	bgeu	a3,a5,148c <_free_r+0xa0>
    1500:	0097d693          	srl	a3,a5,0x9
    1504:	00400613          	li	a2,4
    1508:	12d66463          	bltu	a2,a3,1630 <_free_r+0x244>
    150c:	0067d693          	srl	a3,a5,0x6
    1510:	03968593          	add	a1,a3,57
    1514:	03868613          	add	a2,a3,56
    1518:	00359593          	sll	a1,a1,0x3
    151c:	00b505b3          	add	a1,a0,a1
    1520:	0005a683          	lw	a3,0(a1)
    1524:	ff858593          	add	a1,a1,-8
    1528:	00d59863          	bne	a1,a3,1538 <_free_r+0x14c>
    152c:	15c0006f          	j	1688 <_free_r+0x29c>
    1530:	0086a683          	lw	a3,8(a3)
    1534:	00d58863          	beq	a1,a3,1544 <_free_r+0x158>
    1538:	0046a603          	lw	a2,4(a3)
    153c:	ffc67613          	and	a2,a2,-4
    1540:	fec7e8e3          	bltu	a5,a2,1530 <_free_r+0x144>
    1544:	00c6a583          	lw	a1,12(a3)
    1548:	00b72623          	sw	a1,12(a4)
    154c:	00d72423          	sw	a3,8(a4)
    1550:	00812403          	lw	s0,8(sp)
    1554:	00c12083          	lw	ra,12(sp)
    1558:	00e5a423          	sw	a4,8(a1)
    155c:	00048513          	mv	a0,s1
    1560:	00412483          	lw	s1,4(sp)
    1564:	00e6a623          	sw	a4,12(a3)
    1568:	01010113          	add	sp,sp,16
    156c:	1790006f          	j	1ee4 <__malloc_unlock>
    1570:	00008067          	ret
    1574:	00d787b3          	add	a5,a5,a3
    1578:	7ffff897          	auipc	a7,0x7ffff
    157c:	bb088893          	add	a7,a7,-1104 # 80000128 <__malloc_av_+0x8>
    1580:	00862683          	lw	a3,8(a2)
    1584:	0f168063          	beq	a3,a7,1664 <_free_r+0x278>
    1588:	00c62803          	lw	a6,12(a2)
    158c:	0017e593          	or	a1,a5,1
    1590:	00f70633          	add	a2,a4,a5
    1594:	0106a623          	sw	a6,12(a3)
    1598:	00d82423          	sw	a3,8(a6)
    159c:	00b72223          	sw	a1,4(a4)
    15a0:	00f62023          	sw	a5,0(a2)
    15a4:	ee1ff06f          	j	1484 <_free_r+0x98>
    15a8:	14059063          	bnez	a1,16e8 <_free_r+0x2fc>
    15ac:	00862583          	lw	a1,8(a2)
    15b0:	00c62603          	lw	a2,12(a2)
    15b4:	00f686b3          	add	a3,a3,a5
    15b8:	0016e793          	or	a5,a3,1
    15bc:	00c5a623          	sw	a2,12(a1)
    15c0:	00b62423          	sw	a1,8(a2)
    15c4:	00f72223          	sw	a5,4(a4)
    15c8:	00d70733          	add	a4,a4,a3
    15cc:	00d72023          	sw	a3,0(a4)
    15d0:	ef9ff06f          	j	14c8 <_free_r+0xdc>
    15d4:	0015f593          	and	a1,a1,1
    15d8:	00d786b3          	add	a3,a5,a3
    15dc:	02059063          	bnez	a1,15fc <_free_r+0x210>
    15e0:	ff842583          	lw	a1,-8(s0)
    15e4:	40b70733          	sub	a4,a4,a1
    15e8:	00c72783          	lw	a5,12(a4)
    15ec:	00872603          	lw	a2,8(a4)
    15f0:	00b686b3          	add	a3,a3,a1
    15f4:	00f62623          	sw	a5,12(a2)
    15f8:	00c7a423          	sw	a2,8(a5)
    15fc:	0016e793          	or	a5,a3,1
    1600:	00f72223          	sw	a5,4(a4)
    1604:	00e52423          	sw	a4,8(a0)
    1608:	7ffff797          	auipc	a5,0x7ffff
    160c:	1087a783          	lw	a5,264(a5) # 80000710 <__malloc_trim_threshold>
    1610:	eaf6ece3          	bltu	a3,a5,14c8 <_free_r+0xdc>
    1614:	7ffff597          	auipc	a1,0x7ffff
    1618:	1185a583          	lw	a1,280(a1) # 8000072c <__malloc_top_pad>
    161c:	00048513          	mv	a0,s1
    1620:	c89ff0ef          	jal	12a8 <_malloc_trim_r>
    1624:	ea5ff06f          	j	14c8 <_free_r+0xdc>
    1628:	00d787b3          	add	a5,a5,a3
    162c:	f55ff06f          	j	1580 <_free_r+0x194>
    1630:	01400613          	li	a2,20
    1634:	02d67063          	bgeu	a2,a3,1654 <_free_r+0x268>
    1638:	05400613          	li	a2,84
    163c:	06d66463          	bltu	a2,a3,16a4 <_free_r+0x2b8>
    1640:	00c7d693          	srl	a3,a5,0xc
    1644:	06f68593          	add	a1,a3,111
    1648:	06e68613          	add	a2,a3,110
    164c:	00359593          	sll	a1,a1,0x3
    1650:	ecdff06f          	j	151c <_free_r+0x130>
    1654:	05c68593          	add	a1,a3,92
    1658:	05b68613          	add	a2,a3,91
    165c:	00359593          	sll	a1,a1,0x3
    1660:	ebdff06f          	j	151c <_free_r+0x130>
    1664:	00e52a23          	sw	a4,20(a0)
    1668:	00e52823          	sw	a4,16(a0)
    166c:	0017e693          	or	a3,a5,1
    1670:	01172623          	sw	a7,12(a4)
    1674:	01172423          	sw	a7,8(a4)
    1678:	00d72223          	sw	a3,4(a4)
    167c:	00f70733          	add	a4,a4,a5
    1680:	00f72023          	sw	a5,0(a4)
    1684:	e45ff06f          	j	14c8 <_free_r+0xdc>
    1688:	00452803          	lw	a6,4(a0)
    168c:	40265613          	sra	a2,a2,0x2
    1690:	00100793          	li	a5,1
    1694:	00c797b3          	sll	a5,a5,a2
    1698:	0107e7b3          	or	a5,a5,a6
    169c:	00f52223          	sw	a5,4(a0)
    16a0:	ea9ff06f          	j	1548 <_free_r+0x15c>
    16a4:	15400613          	li	a2,340
    16a8:	00d66c63          	bltu	a2,a3,16c0 <_free_r+0x2d4>
    16ac:	00f7d693          	srl	a3,a5,0xf
    16b0:	07868593          	add	a1,a3,120
    16b4:	07768613          	add	a2,a3,119
    16b8:	00359593          	sll	a1,a1,0x3
    16bc:	e61ff06f          	j	151c <_free_r+0x130>
    16c0:	55400613          	li	a2,1364
    16c4:	00d66c63          	bltu	a2,a3,16dc <_free_r+0x2f0>
    16c8:	0127d693          	srl	a3,a5,0x12
    16cc:	07d68593          	add	a1,a3,125
    16d0:	07c68613          	add	a2,a3,124
    16d4:	00359593          	sll	a1,a1,0x3
    16d8:	e45ff06f          	j	151c <_free_r+0x130>
    16dc:	3f800593          	li	a1,1016
    16e0:	07e00613          	li	a2,126
    16e4:	e39ff06f          	j	151c <_free_r+0x130>
    16e8:	0017e693          	or	a3,a5,1
    16ec:	00d72223          	sw	a3,4(a4)
    16f0:	00f62023          	sw	a5,0(a2)
    16f4:	dd5ff06f          	j	14c8 <_free_r+0xdc>

000016f8 <_malloc_r>:
    16f8:	fd010113          	add	sp,sp,-48
    16fc:	03212023          	sw	s2,32(sp)
    1700:	02112623          	sw	ra,44(sp)
    1704:	02812423          	sw	s0,40(sp)
    1708:	02912223          	sw	s1,36(sp)
    170c:	01312e23          	sw	s3,28(sp)
    1710:	00b58793          	add	a5,a1,11
    1714:	01600713          	li	a4,22
    1718:	00050913          	mv	s2,a0
    171c:	08f76263          	bltu	a4,a5,17a0 <_malloc_r+0xa8>
    1720:	01000793          	li	a5,16
    1724:	20b7e663          	bltu	a5,a1,1930 <_malloc_r+0x238>
    1728:	7b0000ef          	jal	1ed8 <__malloc_lock>
    172c:	01800793          	li	a5,24
    1730:	00200593          	li	a1,2
    1734:	01000493          	li	s1,16
    1738:	7ffff997          	auipc	s3,0x7ffff
    173c:	9e898993          	add	s3,s3,-1560 # 80000120 <__malloc_av_>
    1740:	00f987b3          	add	a5,s3,a5
    1744:	0047a403          	lw	s0,4(a5)
    1748:	ff878713          	add	a4,a5,-8
    174c:	36e40463          	beq	s0,a4,1ab4 <_malloc_r+0x3bc>
    1750:	00442783          	lw	a5,4(s0)
    1754:	00c42683          	lw	a3,12(s0)
    1758:	00842603          	lw	a2,8(s0)
    175c:	ffc7f793          	and	a5,a5,-4
    1760:	00f407b3          	add	a5,s0,a5
    1764:	0047a703          	lw	a4,4(a5)
    1768:	00d62623          	sw	a3,12(a2)
    176c:	00c6a423          	sw	a2,8(a3)
    1770:	00176713          	or	a4,a4,1
    1774:	00090513          	mv	a0,s2
    1778:	00e7a223          	sw	a4,4(a5)
    177c:	768000ef          	jal	1ee4 <__malloc_unlock>
    1780:	00840513          	add	a0,s0,8
    1784:	02c12083          	lw	ra,44(sp)
    1788:	02812403          	lw	s0,40(sp)
    178c:	02412483          	lw	s1,36(sp)
    1790:	02012903          	lw	s2,32(sp)
    1794:	01c12983          	lw	s3,28(sp)
    1798:	03010113          	add	sp,sp,48
    179c:	00008067          	ret
    17a0:	ff87f493          	and	s1,a5,-8
    17a4:	1807c663          	bltz	a5,1930 <_malloc_r+0x238>
    17a8:	18b4e463          	bltu	s1,a1,1930 <_malloc_r+0x238>
    17ac:	72c000ef          	jal	1ed8 <__malloc_lock>
    17b0:	1f700793          	li	a5,503
    17b4:	4097fa63          	bgeu	a5,s1,1bc8 <_malloc_r+0x4d0>
    17b8:	0094d793          	srl	a5,s1,0x9
    17bc:	18078263          	beqz	a5,1940 <_malloc_r+0x248>
    17c0:	00400713          	li	a4,4
    17c4:	36f76063          	bltu	a4,a5,1b24 <_malloc_r+0x42c>
    17c8:	0064d793          	srl	a5,s1,0x6
    17cc:	03978593          	add	a1,a5,57
    17d0:	03878813          	add	a6,a5,56
    17d4:	00359613          	sll	a2,a1,0x3
    17d8:	7ffff997          	auipc	s3,0x7ffff
    17dc:	94898993          	add	s3,s3,-1720 # 80000120 <__malloc_av_>
    17e0:	00c98633          	add	a2,s3,a2
    17e4:	00462403          	lw	s0,4(a2)
    17e8:	ff860613          	add	a2,a2,-8
    17ec:	02860863          	beq	a2,s0,181c <_malloc_r+0x124>
    17f0:	00f00513          	li	a0,15
    17f4:	0140006f          	j	1808 <_malloc_r+0x110>
    17f8:	00c42683          	lw	a3,12(s0)
    17fc:	2a075863          	bgez	a4,1aac <_malloc_r+0x3b4>
    1800:	00d60e63          	beq	a2,a3,181c <_malloc_r+0x124>
    1804:	00068413          	mv	s0,a3
    1808:	00442783          	lw	a5,4(s0)
    180c:	ffc7f793          	and	a5,a5,-4
    1810:	40978733          	sub	a4,a5,s1
    1814:	fee552e3          	bge	a0,a4,17f8 <_malloc_r+0x100>
    1818:	00080593          	mv	a1,a6
    181c:	0109a403          	lw	s0,16(s3)
    1820:	7ffff897          	auipc	a7,0x7ffff
    1824:	90888893          	add	a7,a7,-1784 # 80000128 <__malloc_av_+0x8>
    1828:	27140e63          	beq	s0,a7,1aa4 <_malloc_r+0x3ac>
    182c:	00442783          	lw	a5,4(s0)
    1830:	00f00693          	li	a3,15
    1834:	ffc7f793          	and	a5,a5,-4
    1838:	40978733          	sub	a4,a5,s1
    183c:	38e6cc63          	blt	a3,a4,1bd4 <_malloc_r+0x4dc>
    1840:	0119aa23          	sw	a7,20(s3)
    1844:	0119a823          	sw	a7,16(s3)
    1848:	36075063          	bgez	a4,1ba8 <_malloc_r+0x4b0>
    184c:	1ff00713          	li	a4,511
    1850:	0049a503          	lw	a0,4(s3)
    1854:	26f76863          	bltu	a4,a5,1ac4 <_malloc_r+0x3cc>
    1858:	ff87f713          	and	a4,a5,-8
    185c:	00870713          	add	a4,a4,8
    1860:	00e98733          	add	a4,s3,a4
    1864:	00072683          	lw	a3,0(a4)
    1868:	0057d613          	srl	a2,a5,0x5
    186c:	00100793          	li	a5,1
    1870:	00c797b3          	sll	a5,a5,a2
    1874:	00f56533          	or	a0,a0,a5
    1878:	ff870793          	add	a5,a4,-8
    187c:	00f42623          	sw	a5,12(s0)
    1880:	00d42423          	sw	a3,8(s0)
    1884:	00a9a223          	sw	a0,4(s3)
    1888:	00872023          	sw	s0,0(a4)
    188c:	0086a623          	sw	s0,12(a3)
    1890:	4025d793          	sra	a5,a1,0x2
    1894:	00100613          	li	a2,1
    1898:	00f61633          	sll	a2,a2,a5
    189c:	0ac56a63          	bltu	a0,a2,1950 <_malloc_r+0x258>
    18a0:	00a677b3          	and	a5,a2,a0
    18a4:	02079463          	bnez	a5,18cc <_malloc_r+0x1d4>
    18a8:	00161613          	sll	a2,a2,0x1
    18ac:	ffc5f593          	and	a1,a1,-4
    18b0:	00a677b3          	and	a5,a2,a0
    18b4:	00458593          	add	a1,a1,4
    18b8:	00079a63          	bnez	a5,18cc <_malloc_r+0x1d4>
    18bc:	00161613          	sll	a2,a2,0x1
    18c0:	00a677b3          	and	a5,a2,a0
    18c4:	00458593          	add	a1,a1,4
    18c8:	fe078ae3          	beqz	a5,18bc <_malloc_r+0x1c4>
    18cc:	00f00813          	li	a6,15
    18d0:	00359313          	sll	t1,a1,0x3
    18d4:	00698333          	add	t1,s3,t1
    18d8:	00030513          	mv	a0,t1
    18dc:	00c52783          	lw	a5,12(a0)
    18e0:	00058e13          	mv	t3,a1
    18e4:	26f50263          	beq	a0,a5,1b48 <_malloc_r+0x450>
    18e8:	0047a703          	lw	a4,4(a5)
    18ec:	00078413          	mv	s0,a5
    18f0:	00c7a783          	lw	a5,12(a5)
    18f4:	ffc77713          	and	a4,a4,-4
    18f8:	409706b3          	sub	a3,a4,s1
    18fc:	26d84263          	blt	a6,a3,1b60 <_malloc_r+0x468>
    1900:	fe06c2e3          	bltz	a3,18e4 <_malloc_r+0x1ec>
    1904:	00e40733          	add	a4,s0,a4
    1908:	00472683          	lw	a3,4(a4)
    190c:	00842603          	lw	a2,8(s0)
    1910:	00090513          	mv	a0,s2
    1914:	0016e693          	or	a3,a3,1
    1918:	00d72223          	sw	a3,4(a4)
    191c:	00f62623          	sw	a5,12(a2)
    1920:	00c7a423          	sw	a2,8(a5)
    1924:	5c0000ef          	jal	1ee4 <__malloc_unlock>
    1928:	00840513          	add	a0,s0,8
    192c:	e59ff06f          	j	1784 <_malloc_r+0x8c>
    1930:	00c00793          	li	a5,12
    1934:	00f92023          	sw	a5,0(s2)
    1938:	00000513          	li	a0,0
    193c:	e49ff06f          	j	1784 <_malloc_r+0x8c>
    1940:	20000613          	li	a2,512
    1944:	04000593          	li	a1,64
    1948:	03f00813          	li	a6,63
    194c:	e8dff06f          	j	17d8 <_malloc_r+0xe0>
    1950:	0089a403          	lw	s0,8(s3)
    1954:	01612823          	sw	s6,16(sp)
    1958:	00442783          	lw	a5,4(s0)
    195c:	ffc7fb13          	and	s6,a5,-4
    1960:	009b6863          	bltu	s6,s1,1970 <_malloc_r+0x278>
    1964:	409b0733          	sub	a4,s6,s1
    1968:	00f00793          	li	a5,15
    196c:	0ee7ca63          	blt	a5,a4,1a60 <_malloc_r+0x368>
    1970:	01912223          	sw	s9,4(sp)
    1974:	7ffffc97          	auipc	s9,0x7ffff
    1978:	d98c8c93          	add	s9,s9,-616 # 8000070c <__malloc_sbrk_base>
    197c:	000ca703          	lw	a4,0(s9)
    1980:	01412c23          	sw	s4,24(sp)
    1984:	01512a23          	sw	s5,20(sp)
    1988:	01712623          	sw	s7,12(sp)
    198c:	7ffffa97          	auipc	s5,0x7ffff
    1990:	da0aaa83          	lw	s5,-608(s5) # 8000072c <__malloc_top_pad>
    1994:	fff00793          	li	a5,-1
    1998:	01640a33          	add	s4,s0,s6
    199c:	01548ab3          	add	s5,s1,s5
    19a0:	3ef70263          	beq	a4,a5,1d84 <_malloc_r+0x68c>
    19a4:	000017b7          	lui	a5,0x1
    19a8:	00f78793          	add	a5,a5,15 # 100f <memset+0x73>
    19ac:	00fa8ab3          	add	s5,s5,a5
    19b0:	fffff7b7          	lui	a5,0xfffff
    19b4:	00fafab3          	and	s5,s5,a5
    19b8:	000a8593          	mv	a1,s5
    19bc:	00090513          	mv	a0,s2
    19c0:	254060ef          	jal	7c14 <_sbrk_r>
    19c4:	fff00793          	li	a5,-1
    19c8:	00050b93          	mv	s7,a0
    19cc:	46f50663          	beq	a0,a5,1e38 <_malloc_r+0x740>
    19d0:	01812423          	sw	s8,8(sp)
    19d4:	25456863          	bltu	a0,s4,1c24 <_malloc_r+0x52c>
    19d8:	7ffffc17          	auipc	s8,0x7ffff
    19dc:	ddcc0c13          	add	s8,s8,-548 # 800007b4 <__malloc_current_mallinfo>
    19e0:	000c2583          	lw	a1,0(s8)
    19e4:	00ba85b3          	add	a1,s5,a1
    19e8:	00bc2023          	sw	a1,0(s8)
    19ec:	00058713          	mv	a4,a1
    19f0:	2caa1063          	bne	s4,a0,1cb0 <_malloc_r+0x5b8>
    19f4:	01451793          	sll	a5,a0,0x14
    19f8:	2a079c63          	bnez	a5,1cb0 <_malloc_r+0x5b8>
    19fc:	0089ab83          	lw	s7,8(s3)
    1a00:	015b07b3          	add	a5,s6,s5
    1a04:	0017e793          	or	a5,a5,1
    1a08:	00fba223          	sw	a5,4(s7)
    1a0c:	7ffff717          	auipc	a4,0x7ffff
    1a10:	d1c70713          	add	a4,a4,-740 # 80000728 <__malloc_max_sbrked_mem>
    1a14:	00072683          	lw	a3,0(a4)
    1a18:	00b6f463          	bgeu	a3,a1,1a20 <_malloc_r+0x328>
    1a1c:	00b72023          	sw	a1,0(a4)
    1a20:	7ffff717          	auipc	a4,0x7ffff
    1a24:	d0470713          	add	a4,a4,-764 # 80000724 <__malloc_max_total_mem>
    1a28:	00072683          	lw	a3,0(a4)
    1a2c:	00b6f463          	bgeu	a3,a1,1a34 <_malloc_r+0x33c>
    1a30:	00b72023          	sw	a1,0(a4)
    1a34:	00812c03          	lw	s8,8(sp)
    1a38:	000b8413          	mv	s0,s7
    1a3c:	ffc7f793          	and	a5,a5,-4
    1a40:	40978733          	sub	a4,a5,s1
    1a44:	3897ec63          	bltu	a5,s1,1ddc <_malloc_r+0x6e4>
    1a48:	00f00793          	li	a5,15
    1a4c:	38e7d863          	bge	a5,a4,1ddc <_malloc_r+0x6e4>
    1a50:	01812a03          	lw	s4,24(sp)
    1a54:	01412a83          	lw	s5,20(sp)
    1a58:	00c12b83          	lw	s7,12(sp)
    1a5c:	00412c83          	lw	s9,4(sp)
    1a60:	0014e793          	or	a5,s1,1
    1a64:	00f42223          	sw	a5,4(s0)
    1a68:	009404b3          	add	s1,s0,s1
    1a6c:	0099a423          	sw	s1,8(s3)
    1a70:	00176713          	or	a4,a4,1
    1a74:	00090513          	mv	a0,s2
    1a78:	00e4a223          	sw	a4,4(s1)
    1a7c:	468000ef          	jal	1ee4 <__malloc_unlock>
    1a80:	02c12083          	lw	ra,44(sp)
    1a84:	00840513          	add	a0,s0,8
    1a88:	02812403          	lw	s0,40(sp)
    1a8c:	01012b03          	lw	s6,16(sp)
    1a90:	02412483          	lw	s1,36(sp)
    1a94:	02012903          	lw	s2,32(sp)
    1a98:	01c12983          	lw	s3,28(sp)
    1a9c:	03010113          	add	sp,sp,48
    1aa0:	00008067          	ret
    1aa4:	0049a503          	lw	a0,4(s3)
    1aa8:	de9ff06f          	j	1890 <_malloc_r+0x198>
    1aac:	00842603          	lw	a2,8(s0)
    1ab0:	cb1ff06f          	j	1760 <_malloc_r+0x68>
    1ab4:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1ab8:	00258593          	add	a1,a1,2
    1abc:	d68780e3          	beq	a5,s0,181c <_malloc_r+0x124>
    1ac0:	c91ff06f          	j	1750 <_malloc_r+0x58>
    1ac4:	0097d713          	srl	a4,a5,0x9
    1ac8:	00400693          	li	a3,4
    1acc:	14e6f263          	bgeu	a3,a4,1c10 <_malloc_r+0x518>
    1ad0:	01400693          	li	a3,20
    1ad4:	32e6e663          	bltu	a3,a4,1e00 <_malloc_r+0x708>
    1ad8:	05c70613          	add	a2,a4,92
    1adc:	05b70693          	add	a3,a4,91
    1ae0:	00361613          	sll	a2,a2,0x3
    1ae4:	00c98633          	add	a2,s3,a2
    1ae8:	00062703          	lw	a4,0(a2)
    1aec:	ff860613          	add	a2,a2,-8
    1af0:	00e61863          	bne	a2,a4,1b00 <_malloc_r+0x408>
    1af4:	2980006f          	j	1d8c <_malloc_r+0x694>
    1af8:	00872703          	lw	a4,8(a4)
    1afc:	00e60863          	beq	a2,a4,1b0c <_malloc_r+0x414>
    1b00:	00472683          	lw	a3,4(a4)
    1b04:	ffc6f693          	and	a3,a3,-4
    1b08:	fed7e8e3          	bltu	a5,a3,1af8 <_malloc_r+0x400>
    1b0c:	00c72603          	lw	a2,12(a4)
    1b10:	00c42623          	sw	a2,12(s0)
    1b14:	00e42423          	sw	a4,8(s0)
    1b18:	00862423          	sw	s0,8(a2)
    1b1c:	00872623          	sw	s0,12(a4)
    1b20:	d71ff06f          	j	1890 <_malloc_r+0x198>
    1b24:	01400713          	li	a4,20
    1b28:	10f77863          	bgeu	a4,a5,1c38 <_malloc_r+0x540>
    1b2c:	05400713          	li	a4,84
    1b30:	2ef76663          	bltu	a4,a5,1e1c <_malloc_r+0x724>
    1b34:	00c4d793          	srl	a5,s1,0xc
    1b38:	06f78593          	add	a1,a5,111
    1b3c:	06e78813          	add	a6,a5,110
    1b40:	00359613          	sll	a2,a1,0x3
    1b44:	c95ff06f          	j	17d8 <_malloc_r+0xe0>
    1b48:	001e0e13          	add	t3,t3,1
    1b4c:	003e7793          	and	a5,t3,3
    1b50:	00850513          	add	a0,a0,8
    1b54:	10078063          	beqz	a5,1c54 <_malloc_r+0x55c>
    1b58:	00c52783          	lw	a5,12(a0)
    1b5c:	d89ff06f          	j	18e4 <_malloc_r+0x1ec>
    1b60:	00842603          	lw	a2,8(s0)
    1b64:	0014e593          	or	a1,s1,1
    1b68:	00b42223          	sw	a1,4(s0)
    1b6c:	00f62623          	sw	a5,12(a2)
    1b70:	00c7a423          	sw	a2,8(a5)
    1b74:	009404b3          	add	s1,s0,s1
    1b78:	0099aa23          	sw	s1,20(s3)
    1b7c:	0099a823          	sw	s1,16(s3)
    1b80:	0016e793          	or	a5,a3,1
    1b84:	0114a623          	sw	a7,12(s1)
    1b88:	0114a423          	sw	a7,8(s1)
    1b8c:	00f4a223          	sw	a5,4(s1)
    1b90:	00e40733          	add	a4,s0,a4
    1b94:	00090513          	mv	a0,s2
    1b98:	00d72023          	sw	a3,0(a4)
    1b9c:	348000ef          	jal	1ee4 <__malloc_unlock>
    1ba0:	00840513          	add	a0,s0,8
    1ba4:	be1ff06f          	j	1784 <_malloc_r+0x8c>
    1ba8:	00f407b3          	add	a5,s0,a5
    1bac:	0047a703          	lw	a4,4(a5)
    1bb0:	00090513          	mv	a0,s2
    1bb4:	00176713          	or	a4,a4,1
    1bb8:	00e7a223          	sw	a4,4(a5)
    1bbc:	328000ef          	jal	1ee4 <__malloc_unlock>
    1bc0:	00840513          	add	a0,s0,8
    1bc4:	bc1ff06f          	j	1784 <_malloc_r+0x8c>
    1bc8:	0034d593          	srl	a1,s1,0x3
    1bcc:	00848793          	add	a5,s1,8
    1bd0:	b69ff06f          	j	1738 <_malloc_r+0x40>
    1bd4:	0014e693          	or	a3,s1,1
    1bd8:	00d42223          	sw	a3,4(s0)
    1bdc:	009404b3          	add	s1,s0,s1
    1be0:	0099aa23          	sw	s1,20(s3)
    1be4:	0099a823          	sw	s1,16(s3)
    1be8:	00176693          	or	a3,a4,1
    1bec:	0114a623          	sw	a7,12(s1)
    1bf0:	0114a423          	sw	a7,8(s1)
    1bf4:	00d4a223          	sw	a3,4(s1)
    1bf8:	00f407b3          	add	a5,s0,a5
    1bfc:	00090513          	mv	a0,s2
    1c00:	00e7a023          	sw	a4,0(a5)
    1c04:	2e0000ef          	jal	1ee4 <__malloc_unlock>
    1c08:	00840513          	add	a0,s0,8
    1c0c:	b79ff06f          	j	1784 <_malloc_r+0x8c>
    1c10:	0067d713          	srl	a4,a5,0x6
    1c14:	03970613          	add	a2,a4,57
    1c18:	03870693          	add	a3,a4,56
    1c1c:	00361613          	sll	a2,a2,0x3
    1c20:	ec5ff06f          	j	1ae4 <_malloc_r+0x3ec>
    1c24:	07340c63          	beq	s0,s3,1c9c <_malloc_r+0x5a4>
    1c28:	0089a403          	lw	s0,8(s3)
    1c2c:	00812c03          	lw	s8,8(sp)
    1c30:	00442783          	lw	a5,4(s0)
    1c34:	e09ff06f          	j	1a3c <_malloc_r+0x344>
    1c38:	05c78593          	add	a1,a5,92
    1c3c:	05b78813          	add	a6,a5,91
    1c40:	00359613          	sll	a2,a1,0x3
    1c44:	b95ff06f          	j	17d8 <_malloc_r+0xe0>
    1c48:	00832783          	lw	a5,8(t1)
    1c4c:	fff58593          	add	a1,a1,-1
    1c50:	28679063          	bne	a5,t1,1ed0 <_malloc_r+0x7d8>
    1c54:	0035f793          	and	a5,a1,3
    1c58:	ff830313          	add	t1,t1,-8
    1c5c:	fe0796e3          	bnez	a5,1c48 <_malloc_r+0x550>
    1c60:	0049a703          	lw	a4,4(s3)
    1c64:	fff64793          	not	a5,a2
    1c68:	00e7f7b3          	and	a5,a5,a4
    1c6c:	00f9a223          	sw	a5,4(s3)
    1c70:	00161613          	sll	a2,a2,0x1
    1c74:	ccc7eee3          	bltu	a5,a2,1950 <_malloc_r+0x258>
    1c78:	cc060ce3          	beqz	a2,1950 <_malloc_r+0x258>
    1c7c:	00f67733          	and	a4,a2,a5
    1c80:	00071a63          	bnez	a4,1c94 <_malloc_r+0x59c>
    1c84:	00161613          	sll	a2,a2,0x1
    1c88:	00f67733          	and	a4,a2,a5
    1c8c:	004e0e13          	add	t3,t3,4
    1c90:	fe070ae3          	beqz	a4,1c84 <_malloc_r+0x58c>
    1c94:	000e0593          	mv	a1,t3
    1c98:	c39ff06f          	j	18d0 <_malloc_r+0x1d8>
    1c9c:	7ffffc17          	auipc	s8,0x7ffff
    1ca0:	b18c0c13          	add	s8,s8,-1256 # 800007b4 <__malloc_current_mallinfo>
    1ca4:	000c2703          	lw	a4,0(s8)
    1ca8:	00ea8733          	add	a4,s5,a4
    1cac:	00ec2023          	sw	a4,0(s8)
    1cb0:	000ca683          	lw	a3,0(s9)
    1cb4:	fff00793          	li	a5,-1
    1cb8:	18f68663          	beq	a3,a5,1e44 <_malloc_r+0x74c>
    1cbc:	414b87b3          	sub	a5,s7,s4
    1cc0:	00e787b3          	add	a5,a5,a4
    1cc4:	00fc2023          	sw	a5,0(s8)
    1cc8:	007bfc93          	and	s9,s7,7
    1ccc:	0c0c8c63          	beqz	s9,1da4 <_malloc_r+0x6ac>
    1cd0:	419b8bb3          	sub	s7,s7,s9
    1cd4:	000017b7          	lui	a5,0x1
    1cd8:	00878793          	add	a5,a5,8 # 1008 <memset+0x6c>
    1cdc:	008b8b93          	add	s7,s7,8
    1ce0:	419785b3          	sub	a1,a5,s9
    1ce4:	015b8ab3          	add	s5,s7,s5
    1ce8:	415585b3          	sub	a1,a1,s5
    1cec:	01459593          	sll	a1,a1,0x14
    1cf0:	0145da13          	srl	s4,a1,0x14
    1cf4:	000a0593          	mv	a1,s4
    1cf8:	00090513          	mv	a0,s2
    1cfc:	719050ef          	jal	7c14 <_sbrk_r>
    1d00:	fff00793          	li	a5,-1
    1d04:	18f50063          	beq	a0,a5,1e84 <_malloc_r+0x78c>
    1d08:	41750533          	sub	a0,a0,s7
    1d0c:	01450ab3          	add	s5,a0,s4
    1d10:	000c2703          	lw	a4,0(s8)
    1d14:	0179a423          	sw	s7,8(s3)
    1d18:	001ae793          	or	a5,s5,1
    1d1c:	00ea05b3          	add	a1,s4,a4
    1d20:	00bc2023          	sw	a1,0(s8)
    1d24:	00fba223          	sw	a5,4(s7)
    1d28:	cf3402e3          	beq	s0,s3,1a0c <_malloc_r+0x314>
    1d2c:	00f00693          	li	a3,15
    1d30:	0b66f063          	bgeu	a3,s6,1dd0 <_malloc_r+0x6d8>
    1d34:	00442703          	lw	a4,4(s0)
    1d38:	ff4b0793          	add	a5,s6,-12
    1d3c:	ff87f793          	and	a5,a5,-8
    1d40:	00177713          	and	a4,a4,1
    1d44:	00f76733          	or	a4,a4,a5
    1d48:	00e42223          	sw	a4,4(s0)
    1d4c:	00500613          	li	a2,5
    1d50:	00f40733          	add	a4,s0,a5
    1d54:	00c72223          	sw	a2,4(a4)
    1d58:	00c72423          	sw	a2,8(a4)
    1d5c:	00f6e663          	bltu	a3,a5,1d68 <_malloc_r+0x670>
    1d60:	004ba783          	lw	a5,4(s7)
    1d64:	ca9ff06f          	j	1a0c <_malloc_r+0x314>
    1d68:	00840593          	add	a1,s0,8
    1d6c:	00090513          	mv	a0,s2
    1d70:	e7cff0ef          	jal	13ec <_free_r>
    1d74:	0089ab83          	lw	s7,8(s3)
    1d78:	000c2583          	lw	a1,0(s8)
    1d7c:	004ba783          	lw	a5,4(s7)
    1d80:	c8dff06f          	j	1a0c <_malloc_r+0x314>
    1d84:	010a8a93          	add	s5,s5,16
    1d88:	c31ff06f          	j	19b8 <_malloc_r+0x2c0>
    1d8c:	4026d693          	sra	a3,a3,0x2
    1d90:	00100793          	li	a5,1
    1d94:	00d797b3          	sll	a5,a5,a3
    1d98:	00f56533          	or	a0,a0,a5
    1d9c:	00a9a223          	sw	a0,4(s3)
    1da0:	d71ff06f          	j	1b10 <_malloc_r+0x418>
    1da4:	015b85b3          	add	a1,s7,s5
    1da8:	40b005b3          	neg	a1,a1
    1dac:	01459593          	sll	a1,a1,0x14
    1db0:	0145da13          	srl	s4,a1,0x14
    1db4:	000a0593          	mv	a1,s4
    1db8:	00090513          	mv	a0,s2
    1dbc:	659050ef          	jal	7c14 <_sbrk_r>
    1dc0:	fff00793          	li	a5,-1
    1dc4:	f4f512e3          	bne	a0,a5,1d08 <_malloc_r+0x610>
    1dc8:	00000a13          	li	s4,0
    1dcc:	f45ff06f          	j	1d10 <_malloc_r+0x618>
    1dd0:	00812c03          	lw	s8,8(sp)
    1dd4:	00100793          	li	a5,1
    1dd8:	00fba223          	sw	a5,4(s7)
    1ddc:	00090513          	mv	a0,s2
    1de0:	104000ef          	jal	1ee4 <__malloc_unlock>
    1de4:	00000513          	li	a0,0
    1de8:	01812a03          	lw	s4,24(sp)
    1dec:	01412a83          	lw	s5,20(sp)
    1df0:	01012b03          	lw	s6,16(sp)
    1df4:	00c12b83          	lw	s7,12(sp)
    1df8:	00412c83          	lw	s9,4(sp)
    1dfc:	989ff06f          	j	1784 <_malloc_r+0x8c>
    1e00:	05400693          	li	a3,84
    1e04:	04e6e463          	bltu	a3,a4,1e4c <_malloc_r+0x754>
    1e08:	00c7d713          	srl	a4,a5,0xc
    1e0c:	06f70613          	add	a2,a4,111
    1e10:	06e70693          	add	a3,a4,110
    1e14:	00361613          	sll	a2,a2,0x3
    1e18:	ccdff06f          	j	1ae4 <_malloc_r+0x3ec>
    1e1c:	15400713          	li	a4,340
    1e20:	04f76463          	bltu	a4,a5,1e68 <_malloc_r+0x770>
    1e24:	00f4d793          	srl	a5,s1,0xf
    1e28:	07878593          	add	a1,a5,120
    1e2c:	07778813          	add	a6,a5,119
    1e30:	00359613          	sll	a2,a1,0x3
    1e34:	9a5ff06f          	j	17d8 <_malloc_r+0xe0>
    1e38:	0089a403          	lw	s0,8(s3)
    1e3c:	00442783          	lw	a5,4(s0)
    1e40:	bfdff06f          	j	1a3c <_malloc_r+0x344>
    1e44:	017ca023          	sw	s7,0(s9)
    1e48:	e81ff06f          	j	1cc8 <_malloc_r+0x5d0>
    1e4c:	15400693          	li	a3,340
    1e50:	04e6e463          	bltu	a3,a4,1e98 <_malloc_r+0x7a0>
    1e54:	00f7d713          	srl	a4,a5,0xf
    1e58:	07870613          	add	a2,a4,120
    1e5c:	07770693          	add	a3,a4,119
    1e60:	00361613          	sll	a2,a2,0x3
    1e64:	c81ff06f          	j	1ae4 <_malloc_r+0x3ec>
    1e68:	55400713          	li	a4,1364
    1e6c:	04f76463          	bltu	a4,a5,1eb4 <_malloc_r+0x7bc>
    1e70:	0124d793          	srl	a5,s1,0x12
    1e74:	07d78593          	add	a1,a5,125
    1e78:	07c78813          	add	a6,a5,124
    1e7c:	00359613          	sll	a2,a1,0x3
    1e80:	959ff06f          	j	17d8 <_malloc_r+0xe0>
    1e84:	ff8c8c93          	add	s9,s9,-8
    1e88:	019a8ab3          	add	s5,s5,s9
    1e8c:	417a8ab3          	sub	s5,s5,s7
    1e90:	00000a13          	li	s4,0
    1e94:	e7dff06f          	j	1d10 <_malloc_r+0x618>
    1e98:	55400693          	li	a3,1364
    1e9c:	02e6e463          	bltu	a3,a4,1ec4 <_malloc_r+0x7cc>
    1ea0:	0127d713          	srl	a4,a5,0x12
    1ea4:	07d70613          	add	a2,a4,125
    1ea8:	07c70693          	add	a3,a4,124
    1eac:	00361613          	sll	a2,a2,0x3
    1eb0:	c35ff06f          	j	1ae4 <_malloc_r+0x3ec>
    1eb4:	3f800613          	li	a2,1016
    1eb8:	07f00593          	li	a1,127
    1ebc:	07e00813          	li	a6,126
    1ec0:	919ff06f          	j	17d8 <_malloc_r+0xe0>
    1ec4:	3f800613          	li	a2,1016
    1ec8:	07e00693          	li	a3,126
    1ecc:	c19ff06f          	j	1ae4 <_malloc_r+0x3ec>
    1ed0:	0049a783          	lw	a5,4(s3)
    1ed4:	d9dff06f          	j	1c70 <_malloc_r+0x578>

00001ed8 <__malloc_lock>:
    1ed8:	7ffff517          	auipc	a0,0x7ffff
    1edc:	84450513          	add	a0,a0,-1980 # 8000071c <__lock___malloc_recursive_mutex>
    1ee0:	8b4ff06f          	j	f94 <__retarget_lock_acquire_recursive>

00001ee4 <__malloc_unlock>:
    1ee4:	7ffff517          	auipc	a0,0x7ffff
    1ee8:	83850513          	add	a0,a0,-1992 # 8000071c <__lock___malloc_recursive_mutex>
    1eec:	8acff06f          	j	f98 <__retarget_lock_release_recursive>

00001ef0 <_vfprintf_r>:
    1ef0:	e7010113          	add	sp,sp,-400
    1ef4:	18112623          	sw	ra,396(sp)
    1ef8:	00b12423          	sw	a1,8(sp)
    1efc:	00c12623          	sw	a2,12(sp)
    1f00:	00d12a23          	sw	a3,20(sp)
    1f04:	17312e23          	sw	s3,380(sp)
    1f08:	18812423          	sw	s0,392(sp)
    1f0c:	00050993          	mv	s3,a0
    1f10:	3d9050ef          	jal	7ae8 <_localeconv_r>
    1f14:	00052783          	lw	a5,0(a0)
    1f18:	00078513          	mv	a0,a5
    1f1c:	02f12a23          	sw	a5,52(sp)
    1f20:	afcff0ef          	jal	121c <strlen>
    1f24:	00050713          	mv	a4,a0
    1f28:	00800613          	li	a2,8
    1f2c:	00000593          	li	a1,0
    1f30:	09010513          	add	a0,sp,144
    1f34:	02e12823          	sw	a4,48(sp)
    1f38:	864ff0ef          	jal	f9c <memset>
    1f3c:	00c12783          	lw	a5,12(sp)
    1f40:	00098863          	beqz	s3,1f50 <_vfprintf_r+0x60>
    1f44:	0349a703          	lw	a4,52(s3)
    1f48:	00071463          	bnez	a4,1f50 <_vfprintf_r+0x60>
    1f4c:	29d0106f          	j	39e8 <_vfprintf_r+0x1af8>
    1f50:	00812703          	lw	a4,8(sp)
    1f54:	06472683          	lw	a3,100(a4)
    1f58:	00c71703          	lh	a4,12(a4)
    1f5c:	0016f693          	and	a3,a3,1
    1f60:	00069863          	bnez	a3,1f70 <_vfprintf_r+0x80>
    1f64:	20077693          	and	a3,a4,512
    1f68:	00069463          	bnez	a3,1f70 <_vfprintf_r+0x80>
    1f6c:	3ec0106f          	j	3358 <_vfprintf_r+0x1468>
    1f70:	01271693          	sll	a3,a4,0x12
    1f74:	0206c863          	bltz	a3,1fa4 <_vfprintf_r+0xb4>
    1f78:	00812503          	lw	a0,8(sp)
    1f7c:	000025b7          	lui	a1,0x2
    1f80:	ffffe637          	lui	a2,0xffffe
    1f84:	06452683          	lw	a3,100(a0)
    1f88:	00b76733          	or	a4,a4,a1
    1f8c:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1f90:	01071713          	sll	a4,a4,0x10
    1f94:	41075713          	sra	a4,a4,0x10
    1f98:	00c6f6b3          	and	a3,a3,a2
    1f9c:	00e51623          	sh	a4,12(a0)
    1fa0:	06d52223          	sw	a3,100(a0)
    1fa4:	00877693          	and	a3,a4,8
    1fa8:	2a068063          	beqz	a3,2248 <_vfprintf_r+0x358>
    1fac:	00812683          	lw	a3,8(sp)
    1fb0:	0106a683          	lw	a3,16(a3)
    1fb4:	28068a63          	beqz	a3,2248 <_vfprintf_r+0x358>
    1fb8:	01a77693          	and	a3,a4,26
    1fbc:	00a00613          	li	a2,10
    1fc0:	2ac68c63          	beq	a3,a2,2278 <_vfprintf_r+0x388>
    1fc4:	0ac10713          	add	a4,sp,172
    1fc8:	17512a23          	sw	s5,372(sp)
    1fcc:	17812423          	sw	s8,360(sp)
    1fd0:	15b12e23          	sw	s11,348(sp)
    1fd4:	18912223          	sw	s1,388(sp)
    1fd8:	19212023          	sw	s2,384(sp)
    1fdc:	17412c23          	sw	s4,376(sp)
    1fe0:	17612823          	sw	s6,368(sp)
    1fe4:	17712623          	sw	s7,364(sp)
    1fe8:	17912223          	sw	s9,356(sp)
    1fec:	17a12023          	sw	s10,352(sp)
    1ff0:	0ae12023          	sw	a4,160(sp)
    1ff4:	0a012423          	sw	zero,168(sp)
    1ff8:	0a012223          	sw	zero,164(sp)
    1ffc:	00012c23          	sw	zero,24(sp)
    2000:	02012423          	sw	zero,40(sp)
    2004:	02012623          	sw	zero,44(sp)
    2008:	00070413          	mv	s0,a4
    200c:	02012c23          	sw	zero,56(sp)
    2010:	04012023          	sw	zero,64(sp)
    2014:	02012e23          	sw	zero,60(sp)
    2018:	04012623          	sw	zero,76(sp)
    201c:	04012423          	sw	zero,72(sp)
    2020:	00012623          	sw	zero,12(sp)
    2024:	7fffea97          	auipc	s5,0x7fffe
    2028:	510a8a93          	add	s5,s5,1296 # 80000534 <__global_locale>
    202c:	02500d93          	li	s11,37
    2030:	00078c13          	mv	s8,a5
    2034:	000c0913          	mv	s2,s8
    2038:	0e4aa483          	lw	s1,228(s5)
    203c:	2a1050ef          	jal	7adc <__locale_mb_cur_max>
    2040:	00050693          	mv	a3,a0
    2044:	09010713          	add	a4,sp,144
    2048:	00090613          	mv	a2,s2
    204c:	08010593          	add	a1,sp,128
    2050:	00098513          	mv	a0,s3
    2054:	000480e7          	jalr	s1
    2058:	2c050a63          	beqz	a0,232c <_vfprintf_r+0x43c>
    205c:	2a054a63          	bltz	a0,2310 <_vfprintf_r+0x420>
    2060:	08012783          	lw	a5,128(sp)
    2064:	01b78663          	beq	a5,s11,2070 <_vfprintf_r+0x180>
    2068:	00a90933          	add	s2,s2,a0
    206c:	fcdff06f          	j	2038 <_vfprintf_r+0x148>
    2070:	00050493          	mv	s1,a0
    2074:	41890cb3          	sub	s9,s2,s8
    2078:	2d891063          	bne	s2,s8,2338 <_vfprintf_r+0x448>
    207c:	fff00313          	li	t1,-1
    2080:	00000e93          	li	t4,0
    2084:	00194e03          	lbu	t3,1(s2)
    2088:	06010ba3          	sb	zero,119(sp)
    208c:	00190913          	add	s2,s2,1
    2090:	00000b93          	li	s7,0
    2094:	05a00493          	li	s1,90
    2098:	000e8a13          	mv	s4,t4
    209c:	00030b13          	mv	s6,t1
    20a0:	00190913          	add	s2,s2,1
    20a4:	fe0e0793          	add	a5,t3,-32
    20a8:	04f4ea63          	bltu	s1,a5,20fc <_vfprintf_r+0x20c>
    20ac:	0000d717          	auipc	a4,0xd
    20b0:	31c70713          	add	a4,a4,796 # f3c8 <_ctype_+0x104>
    20b4:	00279793          	sll	a5,a5,0x2
    20b8:	00e787b3          	add	a5,a5,a4
    20bc:	0007a783          	lw	a5,0(a5)
    20c0:	00e787b3          	add	a5,a5,a4
    20c4:	00078067          	jr	a5
    20c8:	00000b93          	li	s7,0
    20cc:	fd0e0713          	add	a4,t3,-48
    20d0:	00900693          	li	a3,9
    20d4:	00094e03          	lbu	t3,0(s2)
    20d8:	002b9793          	sll	a5,s7,0x2
    20dc:	017787b3          	add	a5,a5,s7
    20e0:	00179793          	sll	a5,a5,0x1
    20e4:	00f70bb3          	add	s7,a4,a5
    20e8:	fd0e0713          	add	a4,t3,-48
    20ec:	00190913          	add	s2,s2,1
    20f0:	fee6f2e3          	bgeu	a3,a4,20d4 <_vfprintf_r+0x1e4>
    20f4:	fe0e0793          	add	a5,t3,-32
    20f8:	faf4fae3          	bgeu	s1,a5,20ac <_vfprintf_r+0x1bc>
    20fc:	000a0e93          	mv	t4,s4
    2100:	260e0a63          	beqz	t3,2374 <_vfprintf_r+0x484>
    2104:	0fc10623          	sb	t3,236(sp)
    2108:	06010ba3          	sb	zero,119(sp)
    210c:	00100c93          	li	s9,1
    2110:	00000613          	li	a2,0
    2114:	00012823          	sw	zero,16(sp)
    2118:	00100d13          	li	s10,1
    211c:	00000313          	li	t1,0
    2120:	02012223          	sw	zero,36(sp)
    2124:	02012023          	sw	zero,32(sp)
    2128:	00000a13          	li	s4,0
    212c:	0ec10c13          	add	s8,sp,236
    2130:	002ef293          	and	t0,t4,2
    2134:	00028463          	beqz	t0,213c <_vfprintf_r+0x24c>
    2138:	002c8c93          	add	s9,s9,2
    213c:	084eff93          	and	t6,t4,132
    2140:	0a812483          	lw	s1,168(sp)
    2144:	000f9663          	bnez	t6,2150 <_vfprintf_r+0x260>
    2148:	419b8733          	sub	a4,s7,s9
    214c:	40e04663          	bgtz	a4,2558 <_vfprintf_r+0x668>
    2150:	02060a63          	beqz	a2,2184 <_vfprintf_r+0x294>
    2154:	0a412703          	lw	a4,164(sp)
    2158:	07710613          	add	a2,sp,119
    215c:	00148493          	add	s1,s1,1
    2160:	00170713          	add	a4,a4,1
    2164:	00100793          	li	a5,1
    2168:	00c42023          	sw	a2,0(s0)
    216c:	00f42223          	sw	a5,4(s0)
    2170:	0a912423          	sw	s1,168(sp)
    2174:	0ae12223          	sw	a4,164(sp)
    2178:	00700613          	li	a2,7
    217c:	00840413          	add	s0,s0,8
    2180:	4ce64863          	blt	a2,a4,2650 <_vfprintf_r+0x760>
    2184:	02028a63          	beqz	t0,21b8 <_vfprintf_r+0x2c8>
    2188:	0a412703          	lw	a4,164(sp)
    218c:	07810613          	add	a2,sp,120
    2190:	00c42023          	sw	a2,0(s0)
    2194:	00248493          	add	s1,s1,2
    2198:	00200613          	li	a2,2
    219c:	00170713          	add	a4,a4,1
    21a0:	00c42223          	sw	a2,4(s0)
    21a4:	0a912423          	sw	s1,168(sp)
    21a8:	0ae12223          	sw	a4,164(sp)
    21ac:	00700613          	li	a2,7
    21b0:	00840413          	add	s0,s0,8
    21b4:	5ce644e3          	blt	a2,a4,2f7c <_vfprintf_r+0x108c>
    21b8:	08000713          	li	a4,128
    21bc:	3aef80e3          	beq	t6,a4,2d5c <_vfprintf_r+0xe6c>
    21c0:	41a30b33          	sub	s6,t1,s10
    21c4:	4b604ae3          	bgtz	s6,2e78 <_vfprintf_r+0xf88>
    21c8:	100ef713          	and	a4,t4,256
    21cc:	1a0710e3          	bnez	a4,2b6c <_vfprintf_r+0xc7c>
    21d0:	0a412783          	lw	a5,164(sp)
    21d4:	01a484b3          	add	s1,s1,s10
    21d8:	01842023          	sw	s8,0(s0)
    21dc:	00178793          	add	a5,a5,1
    21e0:	01a42223          	sw	s10,4(s0)
    21e4:	0a912423          	sw	s1,168(sp)
    21e8:	0af12223          	sw	a5,164(sp)
    21ec:	00700713          	li	a4,7
    21f0:	58f74c63          	blt	a4,a5,2788 <_vfprintf_r+0x898>
    21f4:	00840413          	add	s0,s0,8
    21f8:	004eff13          	and	t5,t4,4
    21fc:	000f0663          	beqz	t5,2208 <_vfprintf_r+0x318>
    2200:	419b8d33          	sub	s10,s7,s9
    2204:	5ba04ce3          	bgtz	s10,2fbc <_vfprintf_r+0x10cc>
    2208:	000b8e93          	mv	t4,s7
    220c:	019bd463          	bge	s7,s9,2214 <_vfprintf_r+0x324>
    2210:	000c8e93          	mv	t4,s9
    2214:	00c12783          	lw	a5,12(sp)
    2218:	01d787b3          	add	a5,a5,t4
    221c:	00f12623          	sw	a5,12(sp)
    2220:	18049663          	bnez	s1,23ac <_vfprintf_r+0x4bc>
    2224:	01012783          	lw	a5,16(sp)
    2228:	0a012223          	sw	zero,164(sp)
    222c:	00078863          	beqz	a5,223c <_vfprintf_r+0x34c>
    2230:	01012583          	lw	a1,16(sp)
    2234:	00098513          	mv	a0,s3
    2238:	9b4ff0ef          	jal	13ec <_free_r>
    223c:	0ac10413          	add	s0,sp,172
    2240:	00090c13          	mv	s8,s2
    2244:	df1ff06f          	j	2034 <_vfprintf_r+0x144>
    2248:	00812403          	lw	s0,8(sp)
    224c:	00098513          	mv	a0,s3
    2250:	00f12623          	sw	a5,12(sp)
    2254:	00040593          	mv	a1,s0
    2258:	3a4050ef          	jal	75fc <__swsetup_r>
    225c:	00050463          	beqz	a0,2264 <_vfprintf_r+0x374>
    2260:	5600206f          	j	47c0 <_vfprintf_r+0x28d0>
    2264:	00c41703          	lh	a4,12(s0)
    2268:	00a00613          	li	a2,10
    226c:	00c12783          	lw	a5,12(sp)
    2270:	01a77693          	and	a3,a4,26
    2274:	d4c698e3          	bne	a3,a2,1fc4 <_vfprintf_r+0xd4>
    2278:	00812603          	lw	a2,8(sp)
    227c:	00e61683          	lh	a3,14(a2)
    2280:	d406c2e3          	bltz	a3,1fc4 <_vfprintf_r+0xd4>
    2284:	06462683          	lw	a3,100(a2)
    2288:	0016f693          	and	a3,a3,1
    228c:	00069863          	bnez	a3,229c <_vfprintf_r+0x3ac>
    2290:	20077713          	and	a4,a4,512
    2294:	00071463          	bnez	a4,229c <_vfprintf_r+0x3ac>
    2298:	53d0106f          	j	3fd4 <_vfprintf_r+0x20e4>
    229c:	01412683          	lw	a3,20(sp)
    22a0:	00812583          	lw	a1,8(sp)
    22a4:	00098513          	mv	a0,s3
    22a8:	00078613          	mv	a2,a5
    22ac:	0e5020ef          	jal	4b90 <__sbprintf>
    22b0:	18c12083          	lw	ra,396(sp)
    22b4:	18812403          	lw	s0,392(sp)
    22b8:	00a12623          	sw	a0,12(sp)
    22bc:	00c12503          	lw	a0,12(sp)
    22c0:	17c12983          	lw	s3,380(sp)
    22c4:	19010113          	add	sp,sp,400
    22c8:	00008067          	ret
    22cc:	00098513          	mv	a0,s3
    22d0:	019050ef          	jal	7ae8 <_localeconv_r>
    22d4:	00452783          	lw	a5,4(a0)
    22d8:	00078513          	mv	a0,a5
    22dc:	04f12423          	sw	a5,72(sp)
    22e0:	f3dfe0ef          	jal	121c <strlen>
    22e4:	00050793          	mv	a5,a0
    22e8:	00098513          	mv	a0,s3
    22ec:	00078c93          	mv	s9,a5
    22f0:	04f12623          	sw	a5,76(sp)
    22f4:	7f4050ef          	jal	7ae8 <_localeconv_r>
    22f8:	00852703          	lw	a4,8(a0)
    22fc:	02e12e23          	sw	a4,60(sp)
    2300:	000c8463          	beqz	s9,2308 <_vfprintf_r+0x418>
    2304:	1ec0106f          	j	34f0 <_vfprintf_r+0x1600>
    2308:	00094e03          	lbu	t3,0(s2)
    230c:	d95ff06f          	j	20a0 <_vfprintf_r+0x1b0>
    2310:	00800613          	li	a2,8
    2314:	00000593          	li	a1,0
    2318:	09010513          	add	a0,sp,144
    231c:	c81fe0ef          	jal	f9c <memset>
    2320:	00100513          	li	a0,1
    2324:	00a90933          	add	s2,s2,a0
    2328:	d11ff06f          	j	2038 <_vfprintf_r+0x148>
    232c:	00050493          	mv	s1,a0
    2330:	41890cb3          	sub	s9,s2,s8
    2334:	05890063          	beq	s2,s8,2374 <_vfprintf_r+0x484>
    2338:	0a812683          	lw	a3,168(sp)
    233c:	0a412703          	lw	a4,164(sp)
    2340:	01842023          	sw	s8,0(s0)
    2344:	019686b3          	add	a3,a3,s9
    2348:	00170713          	add	a4,a4,1
    234c:	01942223          	sw	s9,4(s0)
    2350:	0ad12423          	sw	a3,168(sp)
    2354:	0ae12223          	sw	a4,164(sp)
    2358:	00700693          	li	a3,7
    235c:	00840413          	add	s0,s0,8
    2360:	02e6c863          	blt	a3,a4,2390 <_vfprintf_r+0x4a0>
    2364:	00c12783          	lw	a5,12(sp)
    2368:	019787b3          	add	a5,a5,s9
    236c:	00f12623          	sw	a5,12(sp)
    2370:	d00496e3          	bnez	s1,207c <_vfprintf_r+0x18c>
    2374:	0a812783          	lw	a5,168(sp)
    2378:	00078463          	beqz	a5,2380 <_vfprintf_r+0x490>
    237c:	4090106f          	j	3f84 <_vfprintf_r+0x2094>
    2380:	00812783          	lw	a5,8(sp)
    2384:	0a012223          	sw	zero,164(sp)
    2388:	00c79783          	lh	a5,12(a5)
    238c:	0500006f          	j	23dc <_vfprintf_r+0x4ec>
    2390:	00812583          	lw	a1,8(sp)
    2394:	0a010613          	add	a2,sp,160
    2398:	00098513          	mv	a0,s3
    239c:	211020ef          	jal	4dac <__sprint_r>
    23a0:	02051a63          	bnez	a0,23d4 <_vfprintf_r+0x4e4>
    23a4:	0ac10413          	add	s0,sp,172
    23a8:	fbdff06f          	j	2364 <_vfprintf_r+0x474>
    23ac:	00812583          	lw	a1,8(sp)
    23b0:	0a010613          	add	a2,sp,160
    23b4:	00098513          	mv	a0,s3
    23b8:	1f5020ef          	jal	4dac <__sprint_r>
    23bc:	e60504e3          	beqz	a0,2224 <_vfprintf_r+0x334>
    23c0:	01012283          	lw	t0,16(sp)
    23c4:	00028863          	beqz	t0,23d4 <_vfprintf_r+0x4e4>
    23c8:	00028593          	mv	a1,t0
    23cc:	00098513          	mv	a0,s3
    23d0:	81cff0ef          	jal	13ec <_free_r>
    23d4:	00812783          	lw	a5,8(sp)
    23d8:	00c79783          	lh	a5,12(a5)
    23dc:	00812703          	lw	a4,8(sp)
    23e0:	06472703          	lw	a4,100(a4)
    23e4:	00177713          	and	a4,a4,1
    23e8:	3c070463          	beqz	a4,27b0 <_vfprintf_r+0x8c0>
    23ec:	0407f793          	and	a5,a5,64
    23f0:	18412483          	lw	s1,388(sp)
    23f4:	18012903          	lw	s2,384(sp)
    23f8:	17812a03          	lw	s4,376(sp)
    23fc:	17412a83          	lw	s5,372(sp)
    2400:	17012b03          	lw	s6,368(sp)
    2404:	16c12b83          	lw	s7,364(sp)
    2408:	16812c03          	lw	s8,360(sp)
    240c:	16412c83          	lw	s9,356(sp)
    2410:	16012d03          	lw	s10,352(sp)
    2414:	15c12d83          	lw	s11,348(sp)
    2418:	00078463          	beqz	a5,2420 <_vfprintf_r+0x530>
    241c:	3d00206f          	j	47ec <_vfprintf_r+0x28fc>
    2420:	18c12083          	lw	ra,396(sp)
    2424:	18812403          	lw	s0,392(sp)
    2428:	00c12503          	lw	a0,12(sp)
    242c:	17c12983          	lw	s3,380(sp)
    2430:	19010113          	add	sp,sp,400
    2434:	00008067          	ret
    2438:	008a7713          	and	a4,s4,8
    243c:	000a0e93          	mv	t4,s4
    2440:	000b0313          	mv	t1,s6
    2444:	00070463          	beqz	a4,244c <_vfprintf_r+0x55c>
    2448:	0200106f          	j	3468 <_vfprintf_r+0x1578>
    244c:	01412783          	lw	a5,20(sp)
    2450:	00778b13          	add	s6,a5,7
    2454:	ff8b7b13          	and	s6,s6,-8
    2458:	000b2783          	lw	a5,0(s6)
    245c:	02f12423          	sw	a5,40(sp)
    2460:	004b2783          	lw	a5,4(s6)
    2464:	02f12623          	sw	a5,44(sp)
    2468:	008b0793          	add	a5,s6,8
    246c:	00f12a23          	sw	a5,20(sp)
    2470:	02c12a03          	lw	s4,44(sp)
    2474:	7fffe717          	auipc	a4,0x7fffe
    2478:	22c70713          	add	a4,a4,556 # 800006a0 <__global_locale+0x16c>
    247c:	00072c83          	lw	s9,0(a4)
    2480:	00472d03          	lw	s10,4(a4)
    2484:	02812b03          	lw	s6,40(sp)
    2488:	001a1493          	sll	s1,s4,0x1
    248c:	0014d493          	srl	s1,s1,0x1
    2490:	000b0513          	mv	a0,s6
    2494:	00048593          	mv	a1,s1
    2498:	000c8613          	mv	a2,s9
    249c:	000d0693          	mv	a3,s10
    24a0:	02612223          	sw	t1,36(sp)
    24a4:	03c12023          	sw	t3,32(sp)
    24a8:	01d12823          	sw	t4,16(sp)
    24ac:	26c0c0ef          	jal	e718 <__unorddf2>
    24b0:	01012e83          	lw	t4,16(sp)
    24b4:	02012e03          	lw	t3,32(sp)
    24b8:	02412303          	lw	t1,36(sp)
    24bc:	00050463          	beqz	a0,24c4 <_vfprintf_r+0x5d4>
    24c0:	4080106f          	j	38c8 <_vfprintf_r+0x19d8>
    24c4:	000b0513          	mv	a0,s6
    24c8:	00048593          	mv	a1,s1
    24cc:	000c8613          	mv	a2,s9
    24d0:	000d0693          	mv	a3,s10
    24d4:	0a40b0ef          	jal	d578 <__ledf2>
    24d8:	01012e83          	lw	t4,16(sp)
    24dc:	02012e03          	lw	t3,32(sp)
    24e0:	02412303          	lw	t1,36(sp)
    24e4:	00a04463          	bgtz	a0,24ec <_vfprintf_r+0x5fc>
    24e8:	3e00106f          	j	38c8 <_vfprintf_r+0x19d8>
    24ec:	000b0513          	mv	a0,s6
    24f0:	000a0593          	mv	a1,s4
    24f4:	00000613          	li	a2,0
    24f8:	00000693          	li	a3,0
    24fc:	07c0b0ef          	jal	d578 <__ledf2>
    2500:	01012e83          	lw	t4,16(sp)
    2504:	02012e03          	lw	t3,32(sp)
    2508:	00055463          	bgez	a0,2510 <_vfprintf_r+0x620>
    250c:	6650106f          	j	4370 <_vfprintf_r+0x2480>
    2510:	07714603          	lbu	a2,119(sp)
    2514:	04700713          	li	a4,71
    2518:	0000dc17          	auipc	s8,0xd
    251c:	bc0c0c13          	add	s8,s8,-1088 # f0d8 <__fini_array_end+0x198>
    2520:	01c74663          	blt	a4,t3,252c <_vfprintf_r+0x63c>
    2524:	0000dc17          	auipc	s8,0xd
    2528:	bb0c0c13          	add	s8,s8,-1104 # f0d4 <__fini_array_end+0x194>
    252c:	00012823          	sw	zero,16(sp)
    2530:	02012223          	sw	zero,36(sp)
    2534:	02012023          	sw	zero,32(sp)
    2538:	f7fefe93          	and	t4,t4,-129
    253c:	00300c93          	li	s9,3
    2540:	00300d13          	li	s10,3
    2544:	00000313          	li	t1,0
    2548:	00000a13          	li	s4,0
    254c:	be0602e3          	beqz	a2,2130 <_vfprintf_r+0x240>
    2550:	001c8c93          	add	s9,s9,1
    2554:	bddff06f          	j	2130 <_vfprintf_r+0x240>
    2558:	01000593          	li	a1,16
    255c:	0a412603          	lw	a2,164(sp)
    2560:	0000db17          	auipc	s6,0xd
    2564:	07cb0b13          	add	s6,s6,124 # f5dc <blanks.1>
    2568:	0ae5dc63          	bge	a1,a4,2620 <_vfprintf_r+0x730>
    256c:	00040793          	mv	a5,s0
    2570:	00048693          	mv	a3,s1
    2574:	01000893          	li	a7,16
    2578:	000b0493          	mv	s1,s6
    257c:	00700393          	li	t2,7
    2580:	000a0b13          	mv	s6,s4
    2584:	04512223          	sw	t0,68(sp)
    2588:	05f12823          	sw	t6,80(sp)
    258c:	05d12a23          	sw	t4,84(sp)
    2590:	05c12c23          	sw	t3,88(sp)
    2594:	00070413          	mv	s0,a4
    2598:	00030a13          	mv	s4,t1
    259c:	00c0006f          	j	25a8 <_vfprintf_r+0x6b8>
    25a0:	ff040413          	add	s0,s0,-16
    25a4:	0488da63          	bge	a7,s0,25f8 <_vfprintf_r+0x708>
    25a8:	01068693          	add	a3,a3,16
    25ac:	00160613          	add	a2,a2,1
    25b0:	0097a023          	sw	s1,0(a5)
    25b4:	0117a223          	sw	a7,4(a5)
    25b8:	0ad12423          	sw	a3,168(sp)
    25bc:	0ac12223          	sw	a2,164(sp)
    25c0:	00878793          	add	a5,a5,8
    25c4:	fcc3dee3          	bge	t2,a2,25a0 <_vfprintf_r+0x6b0>
    25c8:	00812583          	lw	a1,8(sp)
    25cc:	0a010613          	add	a2,sp,160
    25d0:	00098513          	mv	a0,s3
    25d4:	7d8020ef          	jal	4dac <__sprint_r>
    25d8:	de0514e3          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    25dc:	01000893          	li	a7,16
    25e0:	ff040413          	add	s0,s0,-16
    25e4:	0a812683          	lw	a3,168(sp)
    25e8:	0a412603          	lw	a2,164(sp)
    25ec:	0ac10793          	add	a5,sp,172
    25f0:	00700393          	li	t2,7
    25f4:	fa88cae3          	blt	a7,s0,25a8 <_vfprintf_r+0x6b8>
    25f8:	04412283          	lw	t0,68(sp)
    25fc:	05012f83          	lw	t6,80(sp)
    2600:	05412e83          	lw	t4,84(sp)
    2604:	05812e03          	lw	t3,88(sp)
    2608:	000a0313          	mv	t1,s4
    260c:	00040713          	mv	a4,s0
    2610:	000b0a13          	mv	s4,s6
    2614:	00078413          	mv	s0,a5
    2618:	00048b13          	mv	s6,s1
    261c:	00068493          	mv	s1,a3
    2620:	00e484b3          	add	s1,s1,a4
    2624:	00160613          	add	a2,a2,1
    2628:	00e42223          	sw	a4,4(s0)
    262c:	01642023          	sw	s6,0(s0)
    2630:	0a912423          	sw	s1,168(sp)
    2634:	0ac12223          	sw	a2,164(sp)
    2638:	00700713          	li	a4,7
    263c:	00c75463          	bge	a4,a2,2644 <_vfprintf_r+0x754>
    2640:	2380106f          	j	3878 <_vfprintf_r+0x1988>
    2644:	07714603          	lbu	a2,119(sp)
    2648:	00840413          	add	s0,s0,8
    264c:	b05ff06f          	j	2150 <_vfprintf_r+0x260>
    2650:	00812583          	lw	a1,8(sp)
    2654:	0a010613          	add	a2,sp,160
    2658:	00098513          	mv	a0,s3
    265c:	04612e23          	sw	t1,92(sp)
    2660:	05c12c23          	sw	t3,88(sp)
    2664:	05d12a23          	sw	t4,84(sp)
    2668:	05f12823          	sw	t6,80(sp)
    266c:	04512223          	sw	t0,68(sp)
    2670:	73c020ef          	jal	4dac <__sprint_r>
    2674:	d40516e3          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    2678:	0a812483          	lw	s1,168(sp)
    267c:	05c12303          	lw	t1,92(sp)
    2680:	05812e03          	lw	t3,88(sp)
    2684:	05412e83          	lw	t4,84(sp)
    2688:	05012f83          	lw	t6,80(sp)
    268c:	04412283          	lw	t0,68(sp)
    2690:	0ac10413          	add	s0,sp,172
    2694:	af1ff06f          	j	2184 <_vfprintf_r+0x294>
    2698:	0a412d03          	lw	s10,164(sp)
    269c:	01812783          	lw	a5,24(sp)
    26a0:	00100693          	li	a3,1
    26a4:	01842023          	sw	s8,0(s0)
    26a8:	00148493          	add	s1,s1,1
    26ac:	001d0d13          	add	s10,s10,1
    26b0:	00840b13          	add	s6,s0,8
    26b4:	32f6d0e3          	bge	a3,a5,31d4 <_vfprintf_r+0x12e4>
    26b8:	00100693          	li	a3,1
    26bc:	00d42223          	sw	a3,4(s0)
    26c0:	0a912423          	sw	s1,168(sp)
    26c4:	0ba12223          	sw	s10,164(sp)
    26c8:	00700693          	li	a3,7
    26cc:	01a6d463          	bge	a3,s10,26d4 <_vfprintf_r+0x7e4>
    26d0:	0680106f          	j	3738 <_vfprintf_r+0x1848>
    26d4:	03012783          	lw	a5,48(sp)
    26d8:	03412703          	lw	a4,52(sp)
    26dc:	001d0d13          	add	s10,s10,1
    26e0:	00f484b3          	add	s1,s1,a5
    26e4:	00eb2023          	sw	a4,0(s6)
    26e8:	00fb2223          	sw	a5,4(s6)
    26ec:	0a912423          	sw	s1,168(sp)
    26f0:	0ba12223          	sw	s10,164(sp)
    26f4:	00700693          	li	a3,7
    26f8:	008b0b13          	add	s6,s6,8
    26fc:	01a6d463          	bge	a3,s10,2704 <_vfprintf_r+0x814>
    2700:	0680106f          	j	3768 <_vfprintf_r+0x1878>
    2704:	02812603          	lw	a2,40(sp)
    2708:	02c12683          	lw	a3,44(sp)
    270c:	01812783          	lw	a5,24(sp)
    2710:	00060513          	mv	a0,a2
    2714:	00068593          	mv	a1,a3
    2718:	00000613          	li	a2,0
    271c:	00000693          	li	a3,0
    2720:	03d12023          	sw	t4,32(sp)
    2724:	fff78413          	add	s0,a5,-1
    2728:	4c50a0ef          	jal	d3ec <__eqdf2>
    272c:	02012e83          	lw	t4,32(sp)
    2730:	2e0506e3          	beqz	a0,321c <_vfprintf_r+0x132c>
    2734:	001c0793          	add	a5,s8,1
    2738:	001d0d13          	add	s10,s10,1
    273c:	008484b3          	add	s1,s1,s0
    2740:	00fb2023          	sw	a5,0(s6)
    2744:	008b2223          	sw	s0,4(s6)
    2748:	0a912423          	sw	s1,168(sp)
    274c:	0ba12223          	sw	s10,164(sp)
    2750:	00700793          	li	a5,7
    2754:	008b0b13          	add	s6,s6,8
    2758:	29a7cce3          	blt	a5,s10,31f0 <_vfprintf_r+0x1300>
    275c:	04012703          	lw	a4,64(sp)
    2760:	08810793          	add	a5,sp,136
    2764:	001d0d13          	add	s10,s10,1
    2768:	009704b3          	add	s1,a4,s1
    276c:	00fb2023          	sw	a5,0(s6)
    2770:	00eb2223          	sw	a4,4(s6)
    2774:	0a912423          	sw	s1,168(sp)
    2778:	0ba12223          	sw	s10,164(sp)
    277c:	00700793          	li	a5,7
    2780:	008b0413          	add	s0,s6,8
    2784:	a7a7dae3          	bge	a5,s10,21f8 <_vfprintf_r+0x308>
    2788:	00812583          	lw	a1,8(sp)
    278c:	0a010613          	add	a2,sp,160
    2790:	00098513          	mv	a0,s3
    2794:	03d12023          	sw	t4,32(sp)
    2798:	614020ef          	jal	4dac <__sprint_r>
    279c:	c20512e3          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    27a0:	0a812483          	lw	s1,168(sp)
    27a4:	02012e83          	lw	t4,32(sp)
    27a8:	0ac10413          	add	s0,sp,172
    27ac:	a4dff06f          	j	21f8 <_vfprintf_r+0x308>
    27b0:	2007f713          	and	a4,a5,512
    27b4:	c2071ce3          	bnez	a4,23ec <_vfprintf_r+0x4fc>
    27b8:	00812403          	lw	s0,8(sp)
    27bc:	05842503          	lw	a0,88(s0)
    27c0:	fd8fe0ef          	jal	f98 <__retarget_lock_release_recursive>
    27c4:	00c41783          	lh	a5,12(s0)
    27c8:	c25ff06f          	j	23ec <_vfprintf_r+0x4fc>
    27cc:	00094e03          	lbu	t3,0(s2)
    27d0:	020a6a13          	or	s4,s4,32
    27d4:	8cdff06f          	j	20a0 <_vfprintf_r+0x1b0>
    27d8:	01412703          	lw	a4,20(sp)
    27dc:	04300793          	li	a5,67
    27e0:	000a0e93          	mv	t4,s4
    27e4:	00470493          	add	s1,a4,4
    27e8:	64fe08e3          	beq	t3,a5,3638 <_vfprintf_r+0x1748>
    27ec:	010a7793          	and	a5,s4,16
    27f0:	640794e3          	bnez	a5,3638 <_vfprintf_r+0x1748>
    27f4:	01412783          	lw	a5,20(sp)
    27f8:	00100c93          	li	s9,1
    27fc:	00100d13          	li	s10,1
    2800:	0007a783          	lw	a5,0(a5)
    2804:	0ec10c13          	add	s8,sp,236
    2808:	0ef10623          	sb	a5,236(sp)
    280c:	06010ba3          	sb	zero,119(sp)
    2810:	00912a23          	sw	s1,20(sp)
    2814:	00000613          	li	a2,0
    2818:	00012823          	sw	zero,16(sp)
    281c:	00000313          	li	t1,0
    2820:	02012223          	sw	zero,36(sp)
    2824:	02012023          	sw	zero,32(sp)
    2828:	00000a13          	li	s4,0
    282c:	905ff06f          	j	2130 <_vfprintf_r+0x240>
    2830:	01412783          	lw	a5,20(sp)
    2834:	06010ba3          	sb	zero,119(sp)
    2838:	000b0313          	mv	t1,s6
    283c:	0007ac03          	lw	s8,0(a5)
    2840:	000a0e93          	mv	t4,s4
    2844:	00478b13          	add	s6,a5,4
    2848:	5a0c0ce3          	beqz	s8,3600 <_vfprintf_r+0x1710>
    284c:	05300713          	li	a4,83
    2850:	00ee1463          	bne	t3,a4,2858 <_vfprintf_r+0x968>
    2854:	1d00106f          	j	3a24 <_vfprintf_r+0x1b34>
    2858:	010a7a13          	and	s4,s4,16
    285c:	000a0463          	beqz	s4,2864 <_vfprintf_r+0x974>
    2860:	1c40106f          	j	3a24 <_vfprintf_r+0x1b34>
    2864:	00035463          	bgez	t1,286c <_vfprintf_r+0x97c>
    2868:	6d40106f          	j	3f3c <_vfprintf_r+0x204c>
    286c:	00030613          	mv	a2,t1
    2870:	00000593          	li	a1,0
    2874:	000c0513          	mv	a0,s8
    2878:	03d12023          	sw	t4,32(sp)
    287c:	00612a23          	sw	t1,20(sp)
    2880:	0ec050ef          	jal	796c <memchr>
    2884:	00a12823          	sw	a0,16(sp)
    2888:	01412303          	lw	t1,20(sp)
    288c:	02012e83          	lw	t4,32(sp)
    2890:	00051463          	bnez	a0,2898 <_vfprintf_r+0x9a8>
    2894:	1780206f          	j	4a0c <_vfprintf_r+0x2b1c>
    2898:	01012783          	lw	a5,16(sp)
    289c:	07714603          	lbu	a2,119(sp)
    28a0:	01612a23          	sw	s6,20(sp)
    28a4:	41878d33          	sub	s10,a5,s8
    28a8:	fffd4813          	not	a6,s10
    28ac:	41f85813          	sra	a6,a6,0x1f
    28b0:	02012223          	sw	zero,36(sp)
    28b4:	02012023          	sw	zero,32(sp)
    28b8:	00012823          	sw	zero,16(sp)
    28bc:	010d7cb3          	and	s9,s10,a6
    28c0:	00000313          	li	t1,0
    28c4:	07300e13          	li	t3,115
    28c8:	860604e3          	beqz	a2,2130 <_vfprintf_r+0x240>
    28cc:	c85ff06f          	j	2550 <_vfprintf_r+0x660>
    28d0:	01412783          	lw	a5,20(sp)
    28d4:	0007ab83          	lw	s7,0(a5)
    28d8:	00478793          	add	a5,a5,4
    28dc:	2a0bdae3          	bgez	s7,3390 <_vfprintf_r+0x14a0>
    28e0:	41700bb3          	neg	s7,s7
    28e4:	00f12a23          	sw	a5,20(sp)
    28e8:	00094e03          	lbu	t3,0(s2)
    28ec:	004a6a13          	or	s4,s4,4
    28f0:	fb0ff06f          	j	20a0 <_vfprintf_r+0x1b0>
    28f4:	02b00793          	li	a5,43
    28f8:	00094e03          	lbu	t3,0(s2)
    28fc:	06f10ba3          	sb	a5,119(sp)
    2900:	fa0ff06f          	j	20a0 <_vfprintf_r+0x1b0>
    2904:	000b0313          	mv	t1,s6
    2908:	010a6613          	or	a2,s4,16
    290c:	02067793          	and	a5,a2,32
    2910:	1c0780e3          	beqz	a5,32d0 <_vfprintf_r+0x13e0>
    2914:	01412783          	lw	a5,20(sp)
    2918:	00778b13          	add	s6,a5,7
    291c:	ff8b7b13          	and	s6,s6,-8
    2920:	000b2d03          	lw	s10,0(s6)
    2924:	004b2c83          	lw	s9,4(s6)
    2928:	008b0793          	add	a5,s6,8
    292c:	00f12a23          	sw	a5,20(sp)
    2930:	00100793          	li	a5,1
    2934:	00000713          	li	a4,0
    2938:	06e10ba3          	sb	a4,119(sp)
    293c:	34034c63          	bltz	t1,2c94 <_vfprintf_r+0xda4>
    2940:	019d6733          	or	a4,s10,s9
    2944:	f7f67e93          	and	t4,a2,-129
    2948:	34071463          	bnez	a4,2c90 <_vfprintf_r+0xda0>
    294c:	3a031a63          	bnez	t1,2d00 <_vfprintf_r+0xe10>
    2950:	5c079ee3          	bnez	a5,372c <_vfprintf_r+0x183c>
    2954:	00167d13          	and	s10,a2,1
    2958:	15010c13          	add	s8,sp,336
    295c:	2c0d10e3          	bnez	s10,341c <_vfprintf_r+0x152c>
    2960:	07714603          	lbu	a2,119(sp)
    2964:	00030c93          	mv	s9,t1
    2968:	01a35463          	bge	t1,s10,2970 <_vfprintf_r+0xa80>
    296c:	000d0c93          	mv	s9,s10
    2970:	00012823          	sw	zero,16(sp)
    2974:	02012223          	sw	zero,36(sp)
    2978:	02012023          	sw	zero,32(sp)
    297c:	00000a13          	li	s4,0
    2980:	fa060863          	beqz	a2,2130 <_vfprintf_r+0x240>
    2984:	bcdff06f          	j	2550 <_vfprintf_r+0x660>
    2988:	00094e03          	lbu	t3,0(s2)
    298c:	080a6a13          	or	s4,s4,128
    2990:	f10ff06f          	j	20a0 <_vfprintf_r+0x1b0>
    2994:	00094e03          	lbu	t3,0(s2)
    2998:	02a00793          	li	a5,42
    299c:	00190693          	add	a3,s2,1
    29a0:	00fe1463          	bne	t3,a5,29a8 <_vfprintf_r+0xab8>
    29a4:	1100206f          	j	4ab4 <_vfprintf_r+0x2bc4>
    29a8:	fd0e0713          	add	a4,t3,-48
    29ac:	00900793          	li	a5,9
    29b0:	00000b13          	li	s6,0
    29b4:	00900613          	li	a2,9
    29b8:	02e7e463          	bltu	a5,a4,29e0 <_vfprintf_r+0xaf0>
    29bc:	0006ce03          	lbu	t3,0(a3)
    29c0:	002b1793          	sll	a5,s6,0x2
    29c4:	016787b3          	add	a5,a5,s6
    29c8:	00179793          	sll	a5,a5,0x1
    29cc:	00e78b33          	add	s6,a5,a4
    29d0:	fd0e0713          	add	a4,t3,-48
    29d4:	00168693          	add	a3,a3,1
    29d8:	fee672e3          	bgeu	a2,a4,29bc <_vfprintf_r+0xacc>
    29dc:	320b4ce3          	bltz	s6,3514 <_vfprintf_r+0x1624>
    29e0:	00068913          	mv	s2,a3
    29e4:	ec0ff06f          	j	20a4 <_vfprintf_r+0x1b4>
    29e8:	00094e03          	lbu	t3,0(s2)
    29ec:	001a6a13          	or	s4,s4,1
    29f0:	eb0ff06f          	j	20a0 <_vfprintf_r+0x1b0>
    29f4:	07714783          	lbu	a5,119(sp)
    29f8:	00094e03          	lbu	t3,0(s2)
    29fc:	ea079263          	bnez	a5,20a0 <_vfprintf_r+0x1b0>
    2a00:	02000793          	li	a5,32
    2a04:	06f10ba3          	sb	a5,119(sp)
    2a08:	e98ff06f          	j	20a0 <_vfprintf_r+0x1b0>
    2a0c:	00094e03          	lbu	t3,0(s2)
    2a10:	06c00793          	li	a5,108
    2a14:	3afe00e3          	beq	t3,a5,35b4 <_vfprintf_r+0x16c4>
    2a18:	010a6a13          	or	s4,s4,16
    2a1c:	e84ff06f          	j	20a0 <_vfprintf_r+0x1b0>
    2a20:	00094e03          	lbu	t3,0(s2)
    2a24:	008a6a13          	or	s4,s4,8
    2a28:	e78ff06f          	j	20a0 <_vfprintf_r+0x1b0>
    2a2c:	000b0313          	mv	t1,s6
    2a30:	010a6e93          	or	t4,s4,16
    2a34:	020ef793          	and	a5,t4,32
    2a38:	0c0786e3          	beqz	a5,3304 <_vfprintf_r+0x1414>
    2a3c:	01412783          	lw	a5,20(sp)
    2a40:	00778b13          	add	s6,a5,7
    2a44:	ff8b7b13          	and	s6,s6,-8
    2a48:	004b2783          	lw	a5,4(s6)
    2a4c:	000b2d03          	lw	s10,0(s6)
    2a50:	008b0713          	add	a4,s6,8
    2a54:	00e12a23          	sw	a4,20(sp)
    2a58:	00078c93          	mv	s9,a5
    2a5c:	0c07cee3          	bltz	a5,3338 <_vfprintf_r+0x1448>
    2a60:	000e8613          	mv	a2,t4
    2a64:	02034263          	bltz	t1,2a88 <_vfprintf_r+0xb98>
    2a68:	019d67b3          	or	a5,s10,s9
    2a6c:	f7fef613          	and	a2,t4,-129
    2a70:	00079c63          	bnez	a5,2a88 <_vfprintf_r+0xb98>
    2a74:	02031063          	bnez	t1,2a94 <_vfprintf_r+0xba4>
    2a78:	00000d13          	li	s10,0
    2a7c:	00060e93          	mv	t4,a2
    2a80:	15010c13          	add	s8,sp,336
    2a84:	eddff06f          	j	2960 <_vfprintf_r+0xa70>
    2a88:	520c90e3          	bnez	s9,37a8 <_vfprintf_r+0x18b8>
    2a8c:	00900793          	li	a5,9
    2a90:	51a7ece3          	bltu	a5,s10,37a8 <_vfprintf_r+0x18b8>
    2a94:	030d0d13          	add	s10,s10,48
    2a98:	15a107a3          	sb	s10,335(sp)
    2a9c:	00060e93          	mv	t4,a2
    2aa0:	00100d13          	li	s10,1
    2aa4:	14f10c13          	add	s8,sp,335
    2aa8:	eb9ff06f          	j	2960 <_vfprintf_r+0xa70>
    2aac:	000b0313          	mv	t1,s6
    2ab0:	010a6e93          	or	t4,s4,16
    2ab4:	020ef793          	and	a5,t4,32
    2ab8:	7e078463          	beqz	a5,32a0 <_vfprintf_r+0x13b0>
    2abc:	01412783          	lw	a5,20(sp)
    2ac0:	00778b13          	add	s6,a5,7
    2ac4:	ff8b7b13          	and	s6,s6,-8
    2ac8:	000b2d03          	lw	s10,0(s6)
    2acc:	004b2c83          	lw	s9,4(s6)
    2ad0:	008b0793          	add	a5,s6,8
    2ad4:	00f12a23          	sw	a5,20(sp)
    2ad8:	bffef613          	and	a2,t4,-1025
    2adc:	00000793          	li	a5,0
    2ae0:	e55ff06f          	j	2934 <_vfprintf_r+0xa44>
    2ae4:	00094e03          	lbu	t3,0(s2)
    2ae8:	06800793          	li	a5,104
    2aec:	2cfe0ce3          	beq	t3,a5,35c4 <_vfprintf_r+0x16d4>
    2af0:	040a6a13          	or	s4,s4,64
    2af4:	dacff06f          	j	20a0 <_vfprintf_r+0x1b0>
    2af8:	01412703          	lw	a4,20(sp)
    2afc:	000087b7          	lui	a5,0x8
    2b00:	83078793          	add	a5,a5,-2000 # 7830 <__fputwc+0xf0>
    2b04:	06f11c23          	sh	a5,120(sp)
    2b08:	00470793          	add	a5,a4,4
    2b0c:	00f12a23          	sw	a5,20(sp)
    2b10:	0000c797          	auipc	a5,0xc
    2b14:	5d478793          	add	a5,a5,1492 # f0e4 <__fini_array_end+0x1a4>
    2b18:	02f12c23          	sw	a5,56(sp)
    2b1c:	00072d03          	lw	s10,0(a4)
    2b20:	000b0313          	mv	t1,s6
    2b24:	00000c93          	li	s9,0
    2b28:	002a6613          	or	a2,s4,2
    2b2c:	00200793          	li	a5,2
    2b30:	07800e13          	li	t3,120
    2b34:	e01ff06f          	j	2934 <_vfprintf_r+0xa44>
    2b38:	020a7793          	and	a5,s4,32
    2b3c:	180784e3          	beqz	a5,34c4 <_vfprintf_r+0x15d4>
    2b40:	01412783          	lw	a5,20(sp)
    2b44:	00c12683          	lw	a3,12(sp)
    2b48:	0007a783          	lw	a5,0(a5)
    2b4c:	41f6d713          	sra	a4,a3,0x1f
    2b50:	00d7a023          	sw	a3,0(a5)
    2b54:	00e7a223          	sw	a4,4(a5)
    2b58:	01412783          	lw	a5,20(sp)
    2b5c:	00090c13          	mv	s8,s2
    2b60:	00478793          	add	a5,a5,4
    2b64:	00f12a23          	sw	a5,20(sp)
    2b68:	cccff06f          	j	2034 <_vfprintf_r+0x144>
    2b6c:	06500713          	li	a4,101
    2b70:	b3c754e3          	bge	a4,t3,2698 <_vfprintf_r+0x7a8>
    2b74:	02812683          	lw	a3,40(sp)
    2b78:	02c12703          	lw	a4,44(sp)
    2b7c:	00000613          	li	a2,0
    2b80:	00068513          	mv	a0,a3
    2b84:	00070593          	mv	a1,a4
    2b88:	00000693          	li	a3,0
    2b8c:	05d12223          	sw	t4,68(sp)
    2b90:	05d0a0ef          	jal	d3ec <__eqdf2>
    2b94:	04412e83          	lw	t4,68(sp)
    2b98:	4e051463          	bnez	a0,3080 <_vfprintf_r+0x1190>
    2b9c:	0a412783          	lw	a5,164(sp)
    2ba0:	0000c717          	auipc	a4,0xc
    2ba4:	57470713          	add	a4,a4,1396 # f114 <__fini_array_end+0x1d4>
    2ba8:	00e42023          	sw	a4,0(s0)
    2bac:	00148493          	add	s1,s1,1
    2bb0:	00100713          	li	a4,1
    2bb4:	00178793          	add	a5,a5,1
    2bb8:	00e42223          	sw	a4,4(s0)
    2bbc:	0a912423          	sw	s1,168(sp)
    2bc0:	0af12223          	sw	a5,164(sp)
    2bc4:	00700713          	li	a4,7
    2bc8:	00840413          	add	s0,s0,8
    2bcc:	62f746e3          	blt	a4,a5,39f8 <_vfprintf_r+0x1b08>
    2bd0:	07c12783          	lw	a5,124(sp)
    2bd4:	01812703          	lw	a4,24(sp)
    2bd8:	78e7de63          	bge	a5,a4,3374 <_vfprintf_r+0x1484>
    2bdc:	03412783          	lw	a5,52(sp)
    2be0:	03012703          	lw	a4,48(sp)
    2be4:	00840413          	add	s0,s0,8
    2be8:	fef42c23          	sw	a5,-8(s0)
    2bec:	0a412783          	lw	a5,164(sp)
    2bf0:	00e484b3          	add	s1,s1,a4
    2bf4:	fee42e23          	sw	a4,-4(s0)
    2bf8:	00178793          	add	a5,a5,1
    2bfc:	0a912423          	sw	s1,168(sp)
    2c00:	0af12223          	sw	a5,164(sp)
    2c04:	00700713          	li	a4,7
    2c08:	1cf746e3          	blt	a4,a5,35d4 <_vfprintf_r+0x16e4>
    2c0c:	01812783          	lw	a5,24(sp)
    2c10:	fff78d13          	add	s10,a5,-1
    2c14:	dfa05263          	blez	s10,21f8 <_vfprintf_r+0x308>
    2c18:	01000713          	li	a4,16
    2c1c:	0a412783          	lw	a5,164(sp)
    2c20:	0000d297          	auipc	t0,0xd
    2c24:	9ac28293          	add	t0,t0,-1620 # f5cc <zeroes.0>
    2c28:	77a752e3          	bge	a4,s10,3b8c <_vfprintf_r+0x1c9c>
    2c2c:	00048713          	mv	a4,s1
    2c30:	01000c13          	li	s8,16
    2c34:	00700b13          	li	s6,7
    2c38:	000e8493          	mv	s1,t4
    2c3c:	00028a13          	mv	s4,t0
    2c40:	00c0006f          	j	2c4c <_vfprintf_r+0xd5c>
    2c44:	ff0d0d13          	add	s10,s10,-16
    2c48:	73ac5ce3          	bge	s8,s10,3b80 <_vfprintf_r+0x1c90>
    2c4c:	01070713          	add	a4,a4,16
    2c50:	00178793          	add	a5,a5,1
    2c54:	01442023          	sw	s4,0(s0)
    2c58:	01842223          	sw	s8,4(s0)
    2c5c:	0ae12423          	sw	a4,168(sp)
    2c60:	0af12223          	sw	a5,164(sp)
    2c64:	00840413          	add	s0,s0,8
    2c68:	fcfb5ee3          	bge	s6,a5,2c44 <_vfprintf_r+0xd54>
    2c6c:	00812583          	lw	a1,8(sp)
    2c70:	0a010613          	add	a2,sp,160
    2c74:	00098513          	mv	a0,s3
    2c78:	134020ef          	jal	4dac <__sprint_r>
    2c7c:	f4051263          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    2c80:	0a812703          	lw	a4,168(sp)
    2c84:	0a412783          	lw	a5,164(sp)
    2c88:	0ac10413          	add	s0,sp,172
    2c8c:	fb9ff06f          	j	2c44 <_vfprintf_r+0xd54>
    2c90:	000e8613          	mv	a2,t4
    2c94:	00100713          	li	a4,1
    2c98:	dee788e3          	beq	a5,a4,2a88 <_vfprintf_r+0xb98>
    2c9c:	00200713          	li	a4,2
    2ca0:	06e78c63          	beq	a5,a4,2d18 <_vfprintf_r+0xe28>
    2ca4:	15010c13          	add	s8,sp,336
    2ca8:	01dc9793          	sll	a5,s9,0x1d
    2cac:	007d7713          	and	a4,s10,7
    2cb0:	003d5d13          	srl	s10,s10,0x3
    2cb4:	03070713          	add	a4,a4,48
    2cb8:	01a7ed33          	or	s10,a5,s10
    2cbc:	003cdc93          	srl	s9,s9,0x3
    2cc0:	feec0fa3          	sb	a4,-1(s8)
    2cc4:	019d67b3          	or	a5,s10,s9
    2cc8:	000c0593          	mv	a1,s8
    2ccc:	fffc0c13          	add	s8,s8,-1
    2cd0:	fc079ce3          	bnez	a5,2ca8 <_vfprintf_r+0xdb8>
    2cd4:	00167693          	and	a3,a2,1
    2cd8:	06068a63          	beqz	a3,2d4c <_vfprintf_r+0xe5c>
    2cdc:	03000693          	li	a3,48
    2ce0:	06d70663          	beq	a4,a3,2d4c <_vfprintf_r+0xe5c>
    2ce4:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x10e>
    2ce8:	15010793          	add	a5,sp,336
    2cec:	fedc0fa3          	sb	a3,-1(s8)
    2cf0:	40b78d33          	sub	s10,a5,a1
    2cf4:	00060e93          	mv	t4,a2
    2cf8:	00058c13          	mv	s8,a1
    2cfc:	c65ff06f          	j	2960 <_vfprintf_r+0xa70>
    2d00:	00100713          	li	a4,1
    2d04:	00e79463          	bne	a5,a4,2d0c <_vfprintf_r+0xe1c>
    2d08:	2b10106f          	j	47b8 <_vfprintf_r+0x28c8>
    2d0c:	00200713          	li	a4,2
    2d10:	000e8613          	mv	a2,t4
    2d14:	f8e798e3          	bne	a5,a4,2ca4 <_vfprintf_r+0xdb4>
    2d18:	03812683          	lw	a3,56(sp)
    2d1c:	15010c13          	add	s8,sp,336
    2d20:	00fd7793          	and	a5,s10,15
    2d24:	00f687b3          	add	a5,a3,a5
    2d28:	0007c703          	lbu	a4,0(a5)
    2d2c:	004d5d13          	srl	s10,s10,0x4
    2d30:	01cc9793          	sll	a5,s9,0x1c
    2d34:	01a7ed33          	or	s10,a5,s10
    2d38:	004cdc93          	srl	s9,s9,0x4
    2d3c:	feec0fa3          	sb	a4,-1(s8)
    2d40:	019d67b3          	or	a5,s10,s9
    2d44:	fffc0c13          	add	s8,s8,-1
    2d48:	fc079ce3          	bnez	a5,2d20 <_vfprintf_r+0xe30>
    2d4c:	15010793          	add	a5,sp,336
    2d50:	41878d33          	sub	s10,a5,s8
    2d54:	00060e93          	mv	t4,a2
    2d58:	c09ff06f          	j	2960 <_vfprintf_r+0xa70>
    2d5c:	419b8b33          	sub	s6,s7,s9
    2d60:	c7605063          	blez	s6,21c0 <_vfprintf_r+0x2d0>
    2d64:	01000593          	li	a1,16
    2d68:	0a412603          	lw	a2,164(sp)
    2d6c:	0000d297          	auipc	t0,0xd
    2d70:	86028293          	add	t0,t0,-1952 # f5cc <zeroes.0>
    2d74:	0b65d463          	bge	a1,s6,2e1c <_vfprintf_r+0xf2c>
    2d78:	00040793          	mv	a5,s0
    2d7c:	00048713          	mv	a4,s1
    2d80:	000b0413          	mv	s0,s6
    2d84:	01000893          	li	a7,16
    2d88:	000a0b13          	mv	s6,s4
    2d8c:	00700f93          	li	t6,7
    2d90:	05d12223          	sw	t4,68(sp)
    2d94:	05c12823          	sw	t3,80(sp)
    2d98:	00030a13          	mv	s4,t1
    2d9c:	00028493          	mv	s1,t0
    2da0:	00c0006f          	j	2dac <_vfprintf_r+0xebc>
    2da4:	ff040413          	add	s0,s0,-16
    2da8:	0488da63          	bge	a7,s0,2dfc <_vfprintf_r+0xf0c>
    2dac:	01070713          	add	a4,a4,16
    2db0:	00160613          	add	a2,a2,1
    2db4:	0097a023          	sw	s1,0(a5)
    2db8:	0117a223          	sw	a7,4(a5)
    2dbc:	0ae12423          	sw	a4,168(sp)
    2dc0:	0ac12223          	sw	a2,164(sp)
    2dc4:	00878793          	add	a5,a5,8
    2dc8:	fccfdee3          	bge	t6,a2,2da4 <_vfprintf_r+0xeb4>
    2dcc:	00812583          	lw	a1,8(sp)
    2dd0:	0a010613          	add	a2,sp,160
    2dd4:	00098513          	mv	a0,s3
    2dd8:	7d5010ef          	jal	4dac <__sprint_r>
    2ddc:	de051263          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    2de0:	01000893          	li	a7,16
    2de4:	ff040413          	add	s0,s0,-16
    2de8:	0a812703          	lw	a4,168(sp)
    2dec:	0a412603          	lw	a2,164(sp)
    2df0:	0ac10793          	add	a5,sp,172
    2df4:	00700f93          	li	t6,7
    2df8:	fa88cae3          	blt	a7,s0,2dac <_vfprintf_r+0xebc>
    2dfc:	04412e83          	lw	t4,68(sp)
    2e00:	05012e03          	lw	t3,80(sp)
    2e04:	000a0313          	mv	t1,s4
    2e08:	00048293          	mv	t0,s1
    2e0c:	000b0a13          	mv	s4,s6
    2e10:	00070493          	mv	s1,a4
    2e14:	00040b13          	mv	s6,s0
    2e18:	00078413          	mv	s0,a5
    2e1c:	016484b3          	add	s1,s1,s6
    2e20:	00160613          	add	a2,a2,1
    2e24:	00542023          	sw	t0,0(s0)
    2e28:	01642223          	sw	s6,4(s0)
    2e2c:	0a912423          	sw	s1,168(sp)
    2e30:	0ac12223          	sw	a2,164(sp)
    2e34:	00700713          	li	a4,7
    2e38:	00840413          	add	s0,s0,8
    2e3c:	b8c75263          	bge	a4,a2,21c0 <_vfprintf_r+0x2d0>
    2e40:	00812583          	lw	a1,8(sp)
    2e44:	0a010613          	add	a2,sp,160
    2e48:	00098513          	mv	a0,s3
    2e4c:	04612a23          	sw	t1,84(sp)
    2e50:	05c12823          	sw	t3,80(sp)
    2e54:	05d12223          	sw	t4,68(sp)
    2e58:	755010ef          	jal	4dac <__sprint_r>
    2e5c:	d6051263          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    2e60:	0a812483          	lw	s1,168(sp)
    2e64:	05412303          	lw	t1,84(sp)
    2e68:	05012e03          	lw	t3,80(sp)
    2e6c:	04412e83          	lw	t4,68(sp)
    2e70:	0ac10413          	add	s0,sp,172
    2e74:	b4cff06f          	j	21c0 <_vfprintf_r+0x2d0>
    2e78:	01000713          	li	a4,16
    2e7c:	0a412603          	lw	a2,164(sp)
    2e80:	0000c297          	auipc	t0,0xc
    2e84:	74c28293          	add	t0,t0,1868 # f5cc <zeroes.0>
    2e88:	0b675063          	bge	a4,s6,2f28 <_vfprintf_r+0x1038>
    2e8c:	00040793          	mv	a5,s0
    2e90:	00048693          	mv	a3,s1
    2e94:	000b0413          	mv	s0,s6
    2e98:	01000713          	li	a4,16
    2e9c:	00700893          	li	a7,7
    2ea0:	05d12223          	sw	t4,68(sp)
    2ea4:	000e0493          	mv	s1,t3
    2ea8:	00028b13          	mv	s6,t0
    2eac:	00c0006f          	j	2eb8 <_vfprintf_r+0xfc8>
    2eb0:	ff040413          	add	s0,s0,-16
    2eb4:	04875e63          	bge	a4,s0,2f10 <_vfprintf_r+0x1020>
    2eb8:	01068693          	add	a3,a3,16
    2ebc:	00160613          	add	a2,a2,1
    2ec0:	0000c597          	auipc	a1,0xc
    2ec4:	70c58593          	add	a1,a1,1804 # f5cc <zeroes.0>
    2ec8:	00b7a023          	sw	a1,0(a5)
    2ecc:	00e7a223          	sw	a4,4(a5)
    2ed0:	0ad12423          	sw	a3,168(sp)
    2ed4:	0ac12223          	sw	a2,164(sp)
    2ed8:	00878793          	add	a5,a5,8
    2edc:	fcc8dae3          	bge	a7,a2,2eb0 <_vfprintf_r+0xfc0>
    2ee0:	00812583          	lw	a1,8(sp)
    2ee4:	0a010613          	add	a2,sp,160
    2ee8:	00098513          	mv	a0,s3
    2eec:	6c1010ef          	jal	4dac <__sprint_r>
    2ef0:	cc051863          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    2ef4:	01000713          	li	a4,16
    2ef8:	ff040413          	add	s0,s0,-16
    2efc:	0a812683          	lw	a3,168(sp)
    2f00:	0a412603          	lw	a2,164(sp)
    2f04:	0ac10793          	add	a5,sp,172
    2f08:	00700893          	li	a7,7
    2f0c:	fa8746e3          	blt	a4,s0,2eb8 <_vfprintf_r+0xfc8>
    2f10:	04412e83          	lw	t4,68(sp)
    2f14:	00048e13          	mv	t3,s1
    2f18:	000b0293          	mv	t0,s6
    2f1c:	00068493          	mv	s1,a3
    2f20:	00040b13          	mv	s6,s0
    2f24:	00078413          	mv	s0,a5
    2f28:	016484b3          	add	s1,s1,s6
    2f2c:	00160613          	add	a2,a2,1
    2f30:	00542023          	sw	t0,0(s0)
    2f34:	01642223          	sw	s6,4(s0)
    2f38:	0a912423          	sw	s1,168(sp)
    2f3c:	0ac12223          	sw	a2,164(sp)
    2f40:	00700713          	li	a4,7
    2f44:	00840413          	add	s0,s0,8
    2f48:	a8c75063          	bge	a4,a2,21c8 <_vfprintf_r+0x2d8>
    2f4c:	00812583          	lw	a1,8(sp)
    2f50:	0a010613          	add	a2,sp,160
    2f54:	00098513          	mv	a0,s3
    2f58:	05c12823          	sw	t3,80(sp)
    2f5c:	05d12223          	sw	t4,68(sp)
    2f60:	64d010ef          	jal	4dac <__sprint_r>
    2f64:	c4051e63          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    2f68:	0a812483          	lw	s1,168(sp)
    2f6c:	05012e03          	lw	t3,80(sp)
    2f70:	04412e83          	lw	t4,68(sp)
    2f74:	0ac10413          	add	s0,sp,172
    2f78:	a50ff06f          	j	21c8 <_vfprintf_r+0x2d8>
    2f7c:	00812583          	lw	a1,8(sp)
    2f80:	0a010613          	add	a2,sp,160
    2f84:	00098513          	mv	a0,s3
    2f88:	04612c23          	sw	t1,88(sp)
    2f8c:	05c12a23          	sw	t3,84(sp)
    2f90:	05d12823          	sw	t4,80(sp)
    2f94:	05f12223          	sw	t6,68(sp)
    2f98:	615010ef          	jal	4dac <__sprint_r>
    2f9c:	c2051263          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    2fa0:	0a812483          	lw	s1,168(sp)
    2fa4:	05812303          	lw	t1,88(sp)
    2fa8:	05412e03          	lw	t3,84(sp)
    2fac:	05012e83          	lw	t4,80(sp)
    2fb0:	04412f83          	lw	t6,68(sp)
    2fb4:	0ac10413          	add	s0,sp,172
    2fb8:	a00ff06f          	j	21b8 <_vfprintf_r+0x2c8>
    2fbc:	01000713          	li	a4,16
    2fc0:	0a412783          	lw	a5,164(sp)
    2fc4:	0000cb17          	auipc	s6,0xc
    2fc8:	618b0b13          	add	s6,s6,1560 # f5dc <blanks.1>
    2fcc:	07a75c63          	bge	a4,s10,3044 <_vfprintf_r+0x1154>
    2fd0:	000b0713          	mv	a4,s6
    2fd4:	01000c13          	li	s8,16
    2fd8:	00090b13          	mv	s6,s2
    2fdc:	00700a13          	li	s4,7
    2fe0:	00070913          	mv	s2,a4
    2fe4:	00c0006f          	j	2ff0 <_vfprintf_r+0x1100>
    2fe8:	ff0d0d13          	add	s10,s10,-16
    2fec:	05ac5663          	bge	s8,s10,3038 <_vfprintf_r+0x1148>
    2ff0:	01048493          	add	s1,s1,16
    2ff4:	00178793          	add	a5,a5,1
    2ff8:	01242023          	sw	s2,0(s0)
    2ffc:	01842223          	sw	s8,4(s0)
    3000:	0a912423          	sw	s1,168(sp)
    3004:	0af12223          	sw	a5,164(sp)
    3008:	00840413          	add	s0,s0,8
    300c:	fcfa5ee3          	bge	s4,a5,2fe8 <_vfprintf_r+0x10f8>
    3010:	00812583          	lw	a1,8(sp)
    3014:	0a010613          	add	a2,sp,160
    3018:	00098513          	mv	a0,s3
    301c:	591010ef          	jal	4dac <__sprint_r>
    3020:	ba051063          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    3024:	ff0d0d13          	add	s10,s10,-16
    3028:	0a812483          	lw	s1,168(sp)
    302c:	0a412783          	lw	a5,164(sp)
    3030:	0ac10413          	add	s0,sp,172
    3034:	fbac4ee3          	blt	s8,s10,2ff0 <_vfprintf_r+0x1100>
    3038:	00090713          	mv	a4,s2
    303c:	000b0913          	mv	s2,s6
    3040:	00070b13          	mv	s6,a4
    3044:	01a484b3          	add	s1,s1,s10
    3048:	00178793          	add	a5,a5,1
    304c:	01642023          	sw	s6,0(s0)
    3050:	01a42223          	sw	s10,4(s0)
    3054:	0a912423          	sw	s1,168(sp)
    3058:	0af12223          	sw	a5,164(sp)
    305c:	00700713          	li	a4,7
    3060:	9af75463          	bge	a4,a5,2208 <_vfprintf_r+0x318>
    3064:	00812583          	lw	a1,8(sp)
    3068:	0a010613          	add	a2,sp,160
    306c:	00098513          	mv	a0,s3
    3070:	53d010ef          	jal	4dac <__sprint_r>
    3074:	b4051663          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    3078:	0a812483          	lw	s1,168(sp)
    307c:	98cff06f          	j	2208 <_vfprintf_r+0x318>
    3080:	07c12683          	lw	a3,124(sp)
    3084:	30d05c63          	blez	a3,339c <_vfprintf_r+0x14ac>
    3088:	01812783          	lw	a5,24(sp)
    308c:	000a0b13          	mv	s6,s4
    3090:	0147d463          	bge	a5,s4,3098 <_vfprintf_r+0x11a8>
    3094:	00078b13          	mv	s6,a5
    3098:	03605863          	blez	s6,30c8 <_vfprintf_r+0x11d8>
    309c:	0a412683          	lw	a3,164(sp)
    30a0:	016484b3          	add	s1,s1,s6
    30a4:	01842023          	sw	s8,0(s0)
    30a8:	00168693          	add	a3,a3,1
    30ac:	01642223          	sw	s6,4(s0)
    30b0:	0a912423          	sw	s1,168(sp)
    30b4:	0ad12223          	sw	a3,164(sp)
    30b8:	00700613          	li	a2,7
    30bc:	00840413          	add	s0,s0,8
    30c0:	00d65463          	bge	a2,a3,30c8 <_vfprintf_r+0x11d8>
    30c4:	5c40106f          	j	4688 <_vfprintf_r+0x2798>
    30c8:	fffb4693          	not	a3,s6
    30cc:	41f6d693          	sra	a3,a3,0x1f
    30d0:	00db7733          	and	a4,s6,a3
    30d4:	40ea0b33          	sub	s6,s4,a4
    30d8:	35604ae3          	bgtz	s6,3c2c <_vfprintf_r+0x1d3c>
    30dc:	400ef713          	and	a4,t4,1024
    30e0:	014c0333          	add	t1,s8,s4
    30e4:	00070463          	beqz	a4,30ec <_vfprintf_r+0x11fc>
    30e8:	2980106f          	j	4380 <_vfprintf_r+0x2490>
    30ec:	07c12d03          	lw	s10,124(sp)
    30f0:	01812783          	lw	a5,24(sp)
    30f4:	5afd4063          	blt	s10,a5,3694 <_vfprintf_r+0x17a4>
    30f8:	001ef713          	and	a4,t4,1
    30fc:	58071c63          	bnez	a4,3694 <_vfprintf_r+0x17a4>
    3100:	01812703          	lw	a4,24(sp)
    3104:	00ec07b3          	add	a5,s8,a4
    3108:	41a70d33          	sub	s10,a4,s10
    310c:	40678b33          	sub	s6,a5,t1
    3110:	016d5463          	bge	s10,s6,3118 <_vfprintf_r+0x1228>
    3114:	000d0b13          	mv	s6,s10
    3118:	03605863          	blez	s6,3148 <_vfprintf_r+0x1258>
    311c:	0a412703          	lw	a4,164(sp)
    3120:	016484b3          	add	s1,s1,s6
    3124:	00642023          	sw	t1,0(s0)
    3128:	00170713          	add	a4,a4,1
    312c:	01642223          	sw	s6,4(s0)
    3130:	0a912423          	sw	s1,168(sp)
    3134:	0ae12223          	sw	a4,164(sp)
    3138:	00700693          	li	a3,7
    313c:	00840413          	add	s0,s0,8
    3140:	00e6d463          	bge	a3,a4,3148 <_vfprintf_r+0x1258>
    3144:	5880106f          	j	46cc <_vfprintf_r+0x27dc>
    3148:	fffb4713          	not	a4,s6
    314c:	41f75713          	sra	a4,a4,0x1f
    3150:	00eb77b3          	and	a5,s6,a4
    3154:	40fd0d33          	sub	s10,s10,a5
    3158:	8ba05063          	blez	s10,21f8 <_vfprintf_r+0x308>
    315c:	01000713          	li	a4,16
    3160:	0a412783          	lw	a5,164(sp)
    3164:	0000c297          	auipc	t0,0xc
    3168:	46828293          	add	t0,t0,1128 # f5cc <zeroes.0>
    316c:	23a750e3          	bge	a4,s10,3b8c <_vfprintf_r+0x1c9c>
    3170:	00048713          	mv	a4,s1
    3174:	01000c13          	li	s8,16
    3178:	00700b13          	li	s6,7
    317c:	000e8493          	mv	s1,t4
    3180:	00028a13          	mv	s4,t0
    3184:	00c0006f          	j	3190 <_vfprintf_r+0x12a0>
    3188:	ff0d0d13          	add	s10,s10,-16
    318c:	1fac5ae3          	bge	s8,s10,3b80 <_vfprintf_r+0x1c90>
    3190:	01070713          	add	a4,a4,16
    3194:	00178793          	add	a5,a5,1
    3198:	01442023          	sw	s4,0(s0)
    319c:	01842223          	sw	s8,4(s0)
    31a0:	0ae12423          	sw	a4,168(sp)
    31a4:	0af12223          	sw	a5,164(sp)
    31a8:	00840413          	add	s0,s0,8
    31ac:	fcfb5ee3          	bge	s6,a5,3188 <_vfprintf_r+0x1298>
    31b0:	00812583          	lw	a1,8(sp)
    31b4:	0a010613          	add	a2,sp,160
    31b8:	00098513          	mv	a0,s3
    31bc:	3f1010ef          	jal	4dac <__sprint_r>
    31c0:	a0051063          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    31c4:	0a812703          	lw	a4,168(sp)
    31c8:	0a412783          	lw	a5,164(sp)
    31cc:	0ac10413          	add	s0,sp,172
    31d0:	fb9ff06f          	j	3188 <_vfprintf_r+0x1298>
    31d4:	001ef613          	and	a2,t4,1
    31d8:	ce061063          	bnez	a2,26b8 <_vfprintf_r+0x7c8>
    31dc:	00d42223          	sw	a3,4(s0)
    31e0:	0a912423          	sw	s1,168(sp)
    31e4:	0ba12223          	sw	s10,164(sp)
    31e8:	00700793          	li	a5,7
    31ec:	d7a7d863          	bge	a5,s10,275c <_vfprintf_r+0x86c>
    31f0:	00812583          	lw	a1,8(sp)
    31f4:	0a010613          	add	a2,sp,160
    31f8:	00098513          	mv	a0,s3
    31fc:	03d12023          	sw	t4,32(sp)
    3200:	3ad010ef          	jal	4dac <__sprint_r>
    3204:	9a051e63          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    3208:	0a812483          	lw	s1,168(sp)
    320c:	0a412d03          	lw	s10,164(sp)
    3210:	02012e83          	lw	t4,32(sp)
    3214:	0ac10b13          	add	s6,sp,172
    3218:	d44ff06f          	j	275c <_vfprintf_r+0x86c>
    321c:	01812703          	lw	a4,24(sp)
    3220:	00100793          	li	a5,1
    3224:	d2e7dc63          	bge	a5,a4,275c <_vfprintf_r+0x86c>
    3228:	01100793          	li	a5,17
    322c:	0000c297          	auipc	t0,0xc
    3230:	3a028293          	add	t0,t0,928 # f5cc <zeroes.0>
    3234:	18e7d4e3          	bge	a5,a4,3bbc <_vfprintf_r+0x1ccc>
    3238:	00040a13          	mv	s4,s0
    323c:	01000793          	li	a5,16
    3240:	00700c13          	li	s8,7
    3244:	03d12023          	sw	t4,32(sp)
    3248:	00028413          	mv	s0,t0
    324c:	00c0006f          	j	3258 <_vfprintf_r+0x1368>
    3250:	ff0a0a13          	add	s4,s4,-16
    3254:	1547dee3          	bge	a5,s4,3bb0 <_vfprintf_r+0x1cc0>
    3258:	01048493          	add	s1,s1,16
    325c:	001d0d13          	add	s10,s10,1
    3260:	008b2023          	sw	s0,0(s6)
    3264:	00fb2223          	sw	a5,4(s6)
    3268:	0a912423          	sw	s1,168(sp)
    326c:	0ba12223          	sw	s10,164(sp)
    3270:	008b0b13          	add	s6,s6,8
    3274:	fdac5ee3          	bge	s8,s10,3250 <_vfprintf_r+0x1360>
    3278:	00812583          	lw	a1,8(sp)
    327c:	0a010613          	add	a2,sp,160
    3280:	00098513          	mv	a0,s3
    3284:	329010ef          	jal	4dac <__sprint_r>
    3288:	92051c63          	bnez	a0,23c0 <_vfprintf_r+0x4d0>
    328c:	0a812483          	lw	s1,168(sp)
    3290:	0a412d03          	lw	s10,164(sp)
    3294:	0ac10b13          	add	s6,sp,172
    3298:	01000793          	li	a5,16
    329c:	fb5ff06f          	j	3250 <_vfprintf_r+0x1360>
    32a0:	01412703          	lw	a4,20(sp)
    32a4:	010ef793          	and	a5,t4,16
    32a8:	00072d03          	lw	s10,0(a4)
    32ac:	00470713          	add	a4,a4,4
    32b0:	00e12a23          	sw	a4,20(sp)
    32b4:	1a079663          	bnez	a5,3460 <_vfprintf_r+0x1570>
    32b8:	040ef793          	and	a5,t4,64
    32bc:	18078e63          	beqz	a5,3458 <_vfprintf_r+0x1568>
    32c0:	010d1d13          	sll	s10,s10,0x10
    32c4:	010d5d13          	srl	s10,s10,0x10
    32c8:	00000c93          	li	s9,0
    32cc:	80dff06f          	j	2ad8 <_vfprintf_r+0xbe8>
    32d0:	01412703          	lw	a4,20(sp)
    32d4:	01067793          	and	a5,a2,16
    32d8:	00072d03          	lw	s10,0(a4)
    32dc:	00470713          	add	a4,a4,4
    32e0:	00e12a23          	sw	a4,20(sp)
    32e4:	14079a63          	bnez	a5,3438 <_vfprintf_r+0x1548>
    32e8:	04067793          	and	a5,a2,64
    32ec:	14078063          	beqz	a5,342c <_vfprintf_r+0x153c>
    32f0:	010d1d13          	sll	s10,s10,0x10
    32f4:	010d5d13          	srl	s10,s10,0x10
    32f8:	00000c93          	li	s9,0
    32fc:	00100793          	li	a5,1
    3300:	e34ff06f          	j	2934 <_vfprintf_r+0xa44>
    3304:	01412703          	lw	a4,20(sp)
    3308:	010ef793          	and	a5,t4,16
    330c:	00072d03          	lw	s10,0(a4)
    3310:	00470713          	add	a4,a4,4
    3314:	00e12a23          	sw	a4,20(sp)
    3318:	12079a63          	bnez	a5,344c <_vfprintf_r+0x155c>
    331c:	040ef793          	and	a5,t4,64
    3320:	12078263          	beqz	a5,3444 <_vfprintf_r+0x1554>
    3324:	010d1d13          	sll	s10,s10,0x10
    3328:	410d5d13          	sra	s10,s10,0x10
    332c:	41fd5c93          	sra	s9,s10,0x1f
    3330:	000c8793          	mv	a5,s9
    3334:	f207d663          	bgez	a5,2a60 <_vfprintf_r+0xb70>
    3338:	01a037b3          	snez	a5,s10
    333c:	419000b3          	neg	ra,s9
    3340:	40f08cb3          	sub	s9,ra,a5
    3344:	41a00d33          	neg	s10,s10
    3348:	000e8613          	mv	a2,t4
    334c:	02d00713          	li	a4,45
    3350:	00100793          	li	a5,1
    3354:	de4ff06f          	j	2938 <_vfprintf_r+0xa48>
    3358:	00812403          	lw	s0,8(sp)
    335c:	00f12623          	sw	a5,12(sp)
    3360:	05842503          	lw	a0,88(s0)
    3364:	c31fd0ef          	jal	f94 <__retarget_lock_acquire_recursive>
    3368:	00c41703          	lh	a4,12(s0)
    336c:	00c12783          	lw	a5,12(sp)
    3370:	c01fe06f          	j	1f70 <_vfprintf_r+0x80>
    3374:	001ef793          	and	a5,t4,1
    3378:	00079463          	bnez	a5,3380 <_vfprintf_r+0x1490>
    337c:	e7dfe06f          	j	21f8 <_vfprintf_r+0x308>
    3380:	85dff06f          	j	2bdc <_vfprintf_r+0xcec>
    3384:	000a0e93          	mv	t4,s4
    3388:	000b0313          	mv	t1,s6
    338c:	ea8ff06f          	j	2a34 <_vfprintf_r+0xb44>
    3390:	00094e03          	lbu	t3,0(s2)
    3394:	00f12a23          	sw	a5,20(sp)
    3398:	d09fe06f          	j	20a0 <_vfprintf_r+0x1b0>
    339c:	0a412703          	lw	a4,164(sp)
    33a0:	0000c617          	auipc	a2,0xc
    33a4:	d7460613          	add	a2,a2,-652 # f114 <__fini_array_end+0x1d4>
    33a8:	00c42023          	sw	a2,0(s0)
    33ac:	00148493          	add	s1,s1,1
    33b0:	00100613          	li	a2,1
    33b4:	00170713          	add	a4,a4,1
    33b8:	00c42223          	sw	a2,4(s0)
    33bc:	0a912423          	sw	s1,168(sp)
    33c0:	0ae12223          	sw	a4,164(sp)
    33c4:	00700613          	li	a2,7
    33c8:	00840413          	add	s0,s0,8
    33cc:	2ee64ce3          	blt	a2,a4,3ec4 <_vfprintf_r+0x1fd4>
    33d0:	7e069e63          	bnez	a3,3bcc <_vfprintf_r+0x1cdc>
    33d4:	01812783          	lw	a5,24(sp)
    33d8:	001ef713          	and	a4,t4,1
    33dc:	00f76733          	or	a4,a4,a5
    33e0:	00071463          	bnez	a4,33e8 <_vfprintf_r+0x14f8>
    33e4:	e15fe06f          	j	21f8 <_vfprintf_r+0x308>
    33e8:	03412703          	lw	a4,52(sp)
    33ec:	03012783          	lw	a5,48(sp)
    33f0:	00700693          	li	a3,7
    33f4:	00e42023          	sw	a4,0(s0)
    33f8:	0a412703          	lw	a4,164(sp)
    33fc:	009784b3          	add	s1,a5,s1
    3400:	00f42223          	sw	a5,4(s0)
    3404:	00170713          	add	a4,a4,1
    3408:	0a912423          	sw	s1,168(sp)
    340c:	0ae12223          	sw	a4,164(sp)
    3410:	38e6c8e3          	blt	a3,a4,3fa0 <_vfprintf_r+0x20b0>
    3414:	00840413          	add	s0,s0,8
    3418:	7e80006f          	j	3c00 <_vfprintf_r+0x1d10>
    341c:	03000793          	li	a5,48
    3420:	14f107a3          	sb	a5,335(sp)
    3424:	14f10c13          	add	s8,sp,335
    3428:	d38ff06f          	j	2960 <_vfprintf_r+0xa70>
    342c:	20067793          	and	a5,a2,512
    3430:	00078463          	beqz	a5,3438 <_vfprintf_r+0x1548>
    3434:	0ffd7d13          	zext.b	s10,s10
    3438:	00000c93          	li	s9,0
    343c:	00100793          	li	a5,1
    3440:	cf4ff06f          	j	2934 <_vfprintf_r+0xa44>
    3444:	200ef793          	and	a5,t4,512
    3448:	2c0796e3          	bnez	a5,3f14 <_vfprintf_r+0x2024>
    344c:	41fd5c93          	sra	s9,s10,0x1f
    3450:	000c8793          	mv	a5,s9
    3454:	e08ff06f          	j	2a5c <_vfprintf_r+0xb6c>
    3458:	200ef793          	and	a5,t4,512
    345c:	2a0790e3          	bnez	a5,3efc <_vfprintf_r+0x200c>
    3460:	00000c93          	li	s9,0
    3464:	e74ff06f          	j	2ad8 <_vfprintf_r+0xbe8>
    3468:	01412783          	lw	a5,20(sp)
    346c:	06010513          	add	a0,sp,96
    3470:	03612223          	sw	s6,36(sp)
    3474:	0007a703          	lw	a4,0(a5)
    3478:	03c12023          	sw	t3,32(sp)
    347c:	00478b13          	add	s6,a5,4
    3480:	00072683          	lw	a3,0(a4)
    3484:	01412823          	sw	s4,16(sp)
    3488:	06d12023          	sw	a3,96(sp)
    348c:	00472683          	lw	a3,4(a4)
    3490:	06d12223          	sw	a3,100(sp)
    3494:	00872683          	lw	a3,8(a4)
    3498:	06d12423          	sw	a3,104(sp)
    349c:	00c72703          	lw	a4,12(a4)
    34a0:	06e12623          	sw	a4,108(sp)
    34a4:	4c80b0ef          	jal	e96c <__trunctfdf2>
    34a8:	02012e03          	lw	t3,32(sp)
    34ac:	02412303          	lw	t1,36(sp)
    34b0:	02a12423          	sw	a0,40(sp)
    34b4:	02b12623          	sw	a1,44(sp)
    34b8:	01612a23          	sw	s6,20(sp)
    34bc:	000a0e93          	mv	t4,s4
    34c0:	fb1fe06f          	j	2470 <_vfprintf_r+0x580>
    34c4:	010a7793          	and	a5,s4,16
    34c8:	6c079a63          	bnez	a5,3b9c <_vfprintf_r+0x1cac>
    34cc:	040a7793          	and	a5,s4,64
    34d0:	24079ce3          	bnez	a5,3f28 <_vfprintf_r+0x2038>
    34d4:	200a7f13          	and	t5,s4,512
    34d8:	6c0f0263          	beqz	t5,3b9c <_vfprintf_r+0x1cac>
    34dc:	01412783          	lw	a5,20(sp)
    34e0:	00c12703          	lw	a4,12(sp)
    34e4:	0007a783          	lw	a5,0(a5)
    34e8:	00e78023          	sb	a4,0(a5)
    34ec:	e6cff06f          	j	2b58 <_vfprintf_r+0xc68>
    34f0:	03c12783          	lw	a5,60(sp)
    34f4:	00094e03          	lbu	t3,0(s2)
    34f8:	00079463          	bnez	a5,3500 <_vfprintf_r+0x1610>
    34fc:	ba5fe06f          	j	20a0 <_vfprintf_r+0x1b0>
    3500:	0007c783          	lbu	a5,0(a5)
    3504:	00079463          	bnez	a5,350c <_vfprintf_r+0x161c>
    3508:	b99fe06f          	j	20a0 <_vfprintf_r+0x1b0>
    350c:	400a6a13          	or	s4,s4,1024
    3510:	b91fe06f          	j	20a0 <_vfprintf_r+0x1b0>
    3514:	fff00b13          	li	s6,-1
    3518:	00068913          	mv	s2,a3
    351c:	b89fe06f          	j	20a4 <_vfprintf_r+0x1b4>
    3520:	0000c797          	auipc	a5,0xc
    3524:	bd878793          	add	a5,a5,-1064 # f0f8 <__fini_array_end+0x1b8>
    3528:	000a0e93          	mv	t4,s4
    352c:	000b0313          	mv	t1,s6
    3530:	02f12c23          	sw	a5,56(sp)
    3534:	020ef793          	and	a5,t4,32
    3538:	1c078263          	beqz	a5,36fc <_vfprintf_r+0x180c>
    353c:	01412783          	lw	a5,20(sp)
    3540:	00778b13          	add	s6,a5,7
    3544:	ff8b7b13          	and	s6,s6,-8
    3548:	000b2d03          	lw	s10,0(s6)
    354c:	004b2c83          	lw	s9,4(s6)
    3550:	008b0793          	add	a5,s6,8
    3554:	00f12a23          	sw	a5,20(sp)
    3558:	001ef793          	and	a5,t4,1
    355c:	00078e63          	beqz	a5,3578 <_vfprintf_r+0x1688>
    3560:	019d67b3          	or	a5,s10,s9
    3564:	00078a63          	beqz	a5,3578 <_vfprintf_r+0x1688>
    3568:	03000793          	li	a5,48
    356c:	06f10c23          	sb	a5,120(sp)
    3570:	07c10ca3          	sb	t3,121(sp)
    3574:	002eee93          	or	t4,t4,2
    3578:	bffef613          	and	a2,t4,-1025
    357c:	00200793          	li	a5,2
    3580:	bb4ff06f          	j	2934 <_vfprintf_r+0xa44>
    3584:	000b0313          	mv	t1,s6
    3588:	000a0613          	mv	a2,s4
    358c:	b80ff06f          	j	290c <_vfprintf_r+0xa1c>
    3590:	000a0e93          	mv	t4,s4
    3594:	000b0313          	mv	t1,s6
    3598:	d1cff06f          	j	2ab4 <_vfprintf_r+0xbc4>
    359c:	0000c797          	auipc	a5,0xc
    35a0:	b4878793          	add	a5,a5,-1208 # f0e4 <__fini_array_end+0x1a4>
    35a4:	000a0e93          	mv	t4,s4
    35a8:	000b0313          	mv	t1,s6
    35ac:	02f12c23          	sw	a5,56(sp)
    35b0:	f85ff06f          	j	3534 <_vfprintf_r+0x1644>
    35b4:	00194e03          	lbu	t3,1(s2)
    35b8:	020a6a13          	or	s4,s4,32
    35bc:	00190913          	add	s2,s2,1
    35c0:	ae1fe06f          	j	20a0 <_vfprintf_r+0x1b0>
    35c4:	00194e03          	lbu	t3,1(s2)
    35c8:	200a6a13          	or	s4,s4,512
    35cc:	00190913          	add	s2,s2,1
    35d0:	ad1fe06f          	j	20a0 <_vfprintf_r+0x1b0>
    35d4:	00812583          	lw	a1,8(sp)
    35d8:	0a010613          	add	a2,sp,160
    35dc:	00098513          	mv	a0,s3
    35e0:	03d12023          	sw	t4,32(sp)
    35e4:	7c8010ef          	jal	4dac <__sprint_r>
    35e8:	00050463          	beqz	a0,35f0 <_vfprintf_r+0x1700>
    35ec:	dd5fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    35f0:	0a812483          	lw	s1,168(sp)
    35f4:	02012e83          	lw	t4,32(sp)
    35f8:	0ac10413          	add	s0,sp,172
    35fc:	e10ff06f          	j	2c0c <_vfprintf_r+0xd1c>
    3600:	00600793          	li	a5,6
    3604:	00030c93          	mv	s9,t1
    3608:	0e67e6e3          	bltu	a5,t1,3ef4 <_vfprintf_r+0x2004>
    360c:	01612a23          	sw	s6,20(sp)
    3610:	00012823          	sw	zero,16(sp)
    3614:	000c8d13          	mv	s10,s9
    3618:	00000613          	li	a2,0
    361c:	00000313          	li	t1,0
    3620:	02012223          	sw	zero,36(sp)
    3624:	02012023          	sw	zero,32(sp)
    3628:	00000a13          	li	s4,0
    362c:	0000cc17          	auipc	s8,0xc
    3630:	ae0c0c13          	add	s8,s8,-1312 # f10c <__fini_array_end+0x1cc>
    3634:	afdfe06f          	j	2130 <_vfprintf_r+0x240>
    3638:	00800613          	li	a2,8
    363c:	00000593          	li	a1,0
    3640:	09810513          	add	a0,sp,152
    3644:	03c12023          	sw	t3,32(sp)
    3648:	01d12823          	sw	t4,16(sp)
    364c:	951fd0ef          	jal	f9c <memset>
    3650:	01412783          	lw	a5,20(sp)
    3654:	0ec10c13          	add	s8,sp,236
    3658:	09810693          	add	a3,sp,152
    365c:	0007a603          	lw	a2,0(a5)
    3660:	000c0593          	mv	a1,s8
    3664:	00098513          	mv	a0,s3
    3668:	530070ef          	jal	ab98 <_wcrtomb_r>
    366c:	fff00793          	li	a5,-1
    3670:	01012e83          	lw	t4,16(sp)
    3674:	02012e03          	lw	t3,32(sp)
    3678:	00050d13          	mv	s10,a0
    367c:	00f51463          	bne	a0,a5,3684 <_vfprintf_r+0x1794>
    3680:	4980106f          	j	4b18 <_vfprintf_r+0x2c28>
    3684:	fff54813          	not	a6,a0
    3688:	41f85813          	sra	a6,a6,0x1f
    368c:	01057cb3          	and	s9,a0,a6
    3690:	97cff06f          	j	280c <_vfprintf_r+0x91c>
    3694:	03412703          	lw	a4,52(sp)
    3698:	03012783          	lw	a5,48(sp)
    369c:	00700693          	li	a3,7
    36a0:	00e42023          	sw	a4,0(s0)
    36a4:	0a412703          	lw	a4,164(sp)
    36a8:	00f484b3          	add	s1,s1,a5
    36ac:	00f42223          	sw	a5,4(s0)
    36b0:	00170713          	add	a4,a4,1
    36b4:	0a912423          	sw	s1,168(sp)
    36b8:	0ae12223          	sw	a4,164(sp)
    36bc:	00840413          	add	s0,s0,8
    36c0:	a4e6d0e3          	bge	a3,a4,3100 <_vfprintf_r+0x1210>
    36c4:	00812583          	lw	a1,8(sp)
    36c8:	0a010613          	add	a2,sp,160
    36cc:	00098513          	mv	a0,s3
    36d0:	02612223          	sw	t1,36(sp)
    36d4:	03d12023          	sw	t4,32(sp)
    36d8:	6d4010ef          	jal	4dac <__sprint_r>
    36dc:	00050463          	beqz	a0,36e4 <_vfprintf_r+0x17f4>
    36e0:	ce1fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    36e4:	07c12d03          	lw	s10,124(sp)
    36e8:	0a812483          	lw	s1,168(sp)
    36ec:	02412303          	lw	t1,36(sp)
    36f0:	02012e83          	lw	t4,32(sp)
    36f4:	0ac10413          	add	s0,sp,172
    36f8:	a09ff06f          	j	3100 <_vfprintf_r+0x1210>
    36fc:	01412703          	lw	a4,20(sp)
    3700:	010ef793          	and	a5,t4,16
    3704:	00072d03          	lw	s10,0(a4)
    3708:	00470713          	add	a4,a4,4
    370c:	00e12a23          	sw	a4,20(sp)
    3710:	08079863          	bnez	a5,37a0 <_vfprintf_r+0x18b0>
    3714:	040ef793          	and	a5,t4,64
    3718:	08078063          	beqz	a5,3798 <_vfprintf_r+0x18a8>
    371c:	010d1d13          	sll	s10,s10,0x10
    3720:	010d5d13          	srl	s10,s10,0x10
    3724:	00000c93          	li	s9,0
    3728:	e31ff06f          	j	3558 <_vfprintf_r+0x1668>
    372c:	00000d13          	li	s10,0
    3730:	15010c13          	add	s8,sp,336
    3734:	a2cff06f          	j	2960 <_vfprintf_r+0xa70>
    3738:	00812583          	lw	a1,8(sp)
    373c:	0a010613          	add	a2,sp,160
    3740:	00098513          	mv	a0,s3
    3744:	03d12023          	sw	t4,32(sp)
    3748:	664010ef          	jal	4dac <__sprint_r>
    374c:	00050463          	beqz	a0,3754 <_vfprintf_r+0x1864>
    3750:	c71fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    3754:	0a812483          	lw	s1,168(sp)
    3758:	0a412d03          	lw	s10,164(sp)
    375c:	02012e83          	lw	t4,32(sp)
    3760:	0ac10b13          	add	s6,sp,172
    3764:	f71fe06f          	j	26d4 <_vfprintf_r+0x7e4>
    3768:	00812583          	lw	a1,8(sp)
    376c:	0a010613          	add	a2,sp,160
    3770:	00098513          	mv	a0,s3
    3774:	03d12023          	sw	t4,32(sp)
    3778:	634010ef          	jal	4dac <__sprint_r>
    377c:	00050463          	beqz	a0,3784 <_vfprintf_r+0x1894>
    3780:	c41fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    3784:	0a812483          	lw	s1,168(sp)
    3788:	0a412d03          	lw	s10,164(sp)
    378c:	02012e83          	lw	t4,32(sp)
    3790:	0ac10b13          	add	s6,sp,172
    3794:	f71fe06f          	j	2704 <_vfprintf_r+0x814>
    3798:	200ef793          	and	a5,t4,512
    379c:	76079663          	bnez	a5,3f08 <_vfprintf_r+0x2018>
    37a0:	00000c93          	li	s9,0
    37a4:	db5ff06f          	j	3558 <_vfprintf_r+0x1668>
    37a8:	00000793          	li	a5,0
    37ac:	15010b13          	add	s6,sp,336
    37b0:	01212823          	sw	s2,16(sp)
    37b4:	00078913          	mv	s2,a5
    37b8:	00098793          	mv	a5,s3
    37bc:	04812823          	sw	s0,80(sp)
    37c0:	000b0993          	mv	s3,s6
    37c4:	03c12403          	lw	s0,60(sp)
    37c8:	40067493          	and	s1,a2,1024
    37cc:	0ff00a13          	li	s4,255
    37d0:	03c12023          	sw	t3,32(sp)
    37d4:	02c12223          	sw	a2,36(sp)
    37d8:	04612223          	sw	t1,68(sp)
    37dc:	00078b13          	mv	s6,a5
    37e0:	0280006f          	j	3808 <_vfprintf_r+0x1918>
    37e4:	00a00613          	li	a2,10
    37e8:	00000693          	li	a3,0
    37ec:	000d0513          	mv	a0,s10
    37f0:	000c8593          	mv	a1,s9
    37f4:	581070ef          	jal	b574 <__udivdi3>
    37f8:	6a0c8ee3          	beqz	s9,46b4 <_vfprintf_r+0x27c4>
    37fc:	00050d13          	mv	s10,a0
    3800:	00058c93          	mv	s9,a1
    3804:	000c0993          	mv	s3,s8
    3808:	00a00613          	li	a2,10
    380c:	00000693          	li	a3,0
    3810:	000d0513          	mv	a0,s10
    3814:	000c8593          	mv	a1,s9
    3818:	408080ef          	jal	bc20 <__umoddi3>
    381c:	03050513          	add	a0,a0,48
    3820:	fea98fa3          	sb	a0,-1(s3)
    3824:	fff98c13          	add	s8,s3,-1
    3828:	00190913          	add	s2,s2,1
    382c:	fa048ce3          	beqz	s1,37e4 <_vfprintf_r+0x18f4>
    3830:	00044783          	lbu	a5,0(s0)
    3834:	faf918e3          	bne	s2,a5,37e4 <_vfprintf_r+0x18f4>
    3838:	fb4906e3          	beq	s2,s4,37e4 <_vfprintf_r+0x18f4>
    383c:	560c9ae3          	bnez	s9,45b0 <_vfprintf_r+0x26c0>
    3840:	00900793          	li	a5,9
    3844:	57a7e6e3          	bltu	a5,s10,45b0 <_vfprintf_r+0x26c0>
    3848:	02412603          	lw	a2,36(sp)
    384c:	15010793          	add	a5,sp,336
    3850:	02812e23          	sw	s0,60(sp)
    3854:	01212c23          	sw	s2,24(sp)
    3858:	02012e03          	lw	t3,32(sp)
    385c:	01012903          	lw	s2,16(sp)
    3860:	04412303          	lw	t1,68(sp)
    3864:	05012403          	lw	s0,80(sp)
    3868:	000b0993          	mv	s3,s6
    386c:	41878d33          	sub	s10,a5,s8
    3870:	00060e93          	mv	t4,a2
    3874:	8ecff06f          	j	2960 <_vfprintf_r+0xa70>
    3878:	00812583          	lw	a1,8(sp)
    387c:	0a010613          	add	a2,sp,160
    3880:	00098513          	mv	a0,s3
    3884:	04612e23          	sw	t1,92(sp)
    3888:	05c12c23          	sw	t3,88(sp)
    388c:	05d12a23          	sw	t4,84(sp)
    3890:	05f12823          	sw	t6,80(sp)
    3894:	04512223          	sw	t0,68(sp)
    3898:	514010ef          	jal	4dac <__sprint_r>
    389c:	00050463          	beqz	a0,38a4 <_vfprintf_r+0x19b4>
    38a0:	b21fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    38a4:	07714603          	lbu	a2,119(sp)
    38a8:	0a812483          	lw	s1,168(sp)
    38ac:	05c12303          	lw	t1,92(sp)
    38b0:	05812e03          	lw	t3,88(sp)
    38b4:	05412e83          	lw	t4,84(sp)
    38b8:	05012f83          	lw	t6,80(sp)
    38bc:	04412283          	lw	t0,68(sp)
    38c0:	0ac10413          	add	s0,sp,172
    38c4:	88dfe06f          	j	2150 <_vfprintf_r+0x260>
    38c8:	02812883          	lw	a7,40(sp)
    38cc:	02c12703          	lw	a4,44(sp)
    38d0:	02612223          	sw	t1,36(sp)
    38d4:	00088613          	mv	a2,a7
    38d8:	00088513          	mv	a0,a7
    38dc:	00070693          	mv	a3,a4
    38e0:	00070593          	mv	a1,a4
    38e4:	03c12023          	sw	t3,32(sp)
    38e8:	01d12823          	sw	t4,16(sp)
    38ec:	62d0a0ef          	jal	e718 <__unorddf2>
    38f0:	01012e83          	lw	t4,16(sp)
    38f4:	02012e03          	lw	t3,32(sp)
    38f8:	02412303          	lw	t1,36(sp)
    38fc:	00050463          	beqz	a0,3904 <_vfprintf_r+0x1a14>
    3900:	0e00106f          	j	49e0 <_vfprintf_r+0x2af0>
    3904:	06100713          	li	a4,97
    3908:	08ee0263          	beq	t3,a4,398c <_vfprintf_r+0x1a9c>
    390c:	04100713          	li	a4,65
    3910:	05800793          	li	a5,88
    3914:	06ee0e63          	beq	t3,a4,3990 <_vfprintf_r+0x1aa0>
    3918:	fff00713          	li	a4,-1
    391c:	00e31463          	bne	t1,a4,3924 <_vfprintf_r+0x1a34>
    3920:	01c0106f          	j	493c <_vfprintf_r+0x2a4c>
    3924:	fdfe7713          	and	a4,t3,-33
    3928:	04700693          	li	a3,71
    392c:	00012823          	sw	zero,16(sp)
    3930:	00d71663          	bne	a4,a3,393c <_vfprintf_r+0x1a4c>
    3934:	00031463          	bnez	t1,393c <_vfprintf_r+0x1a4c>
    3938:	00100313          	li	t1,1
    393c:	100ee793          	or	a5,t4,256
    3940:	00078b13          	mv	s6,a5
    3944:	02c12783          	lw	a5,44(sp)
    3948:	04012223          	sw	zero,68(sp)
    394c:	00078493          	mv	s1,a5
    3950:	0007da63          	bgez	a5,3964 <_vfprintf_r+0x1a74>
    3954:	800004b7          	lui	s1,0x80000
    3958:	00f4c4b3          	xor	s1,s1,a5
    395c:	02d00793          	li	a5,45
    3960:	04f12223          	sw	a5,68(sp)
    3964:	fbfe0713          	add	a4,t3,-65
    3968:	02500693          	li	a3,37
    396c:	3ae6e463          	bltu	a3,a4,3d14 <_vfprintf_r+0x1e24>
    3970:	0000c697          	auipc	a3,0xc
    3974:	bc468693          	add	a3,a3,-1084 # f534 <_ctype_+0x270>
    3978:	00271713          	sll	a4,a4,0x2
    397c:	00d70733          	add	a4,a4,a3
    3980:	00072703          	lw	a4,0(a4)
    3984:	00d70733          	add	a4,a4,a3
    3988:	00070067          	jr	a4
    398c:	07800793          	li	a5,120
    3990:	03000713          	li	a4,48
    3994:	06e10c23          	sb	a4,120(sp)
    3998:	06f10ca3          	sb	a5,121(sp)
    399c:	06300713          	li	a4,99
    39a0:	00012823          	sw	zero,16(sp)
    39a4:	002eee93          	or	t4,t4,2
    39a8:	0ec10c13          	add	s8,sp,236
    39ac:	f86758e3          	bge	a4,t1,393c <_vfprintf_r+0x1a4c>
    39b0:	00130593          	add	a1,t1,1
    39b4:	00098513          	mv	a0,s3
    39b8:	03c12023          	sw	t3,32(sp)
    39bc:	01d12c23          	sw	t4,24(sp)
    39c0:	00612823          	sw	t1,16(sp)
    39c4:	d35fd0ef          	jal	16f8 <_malloc_r>
    39c8:	01012303          	lw	t1,16(sp)
    39cc:	01812e83          	lw	t4,24(sp)
    39d0:	02012e03          	lw	t3,32(sp)
    39d4:	00050c13          	mv	s8,a0
    39d8:	00051463          	bnez	a0,39e0 <_vfprintf_r+0x1af0>
    39dc:	13c0106f          	j	4b18 <_vfprintf_r+0x2c28>
    39e0:	00a12823          	sw	a0,16(sp)
    39e4:	f59ff06f          	j	393c <_vfprintf_r+0x1a4c>
    39e8:	00098513          	mv	a0,s3
    39ec:	1d0030ef          	jal	6bbc <__sinit>
    39f0:	00c12783          	lw	a5,12(sp)
    39f4:	d5cfe06f          	j	1f50 <_vfprintf_r+0x60>
    39f8:	00812583          	lw	a1,8(sp)
    39fc:	0a010613          	add	a2,sp,160
    3a00:	00098513          	mv	a0,s3
    3a04:	03d12023          	sw	t4,32(sp)
    3a08:	3a4010ef          	jal	4dac <__sprint_r>
    3a0c:	00050463          	beqz	a0,3a14 <_vfprintf_r+0x1b24>
    3a10:	9b1fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    3a14:	0a812483          	lw	s1,168(sp)
    3a18:	02012e83          	lw	t4,32(sp)
    3a1c:	0ac10413          	add	s0,sp,172
    3a20:	9b0ff06f          	j	2bd0 <_vfprintf_r+0xce0>
    3a24:	00800613          	li	a2,8
    3a28:	00000593          	li	a1,0
    3a2c:	09810513          	add	a0,sp,152
    3a30:	02612023          	sw	t1,32(sp)
    3a34:	01c12a23          	sw	t3,20(sp)
    3a38:	01d12823          	sw	t4,16(sp)
    3a3c:	09812223          	sw	s8,132(sp)
    3a40:	d5cfd0ef          	jal	f9c <memset>
    3a44:	02012303          	lw	t1,32(sp)
    3a48:	01012e83          	lw	t4,16(sp)
    3a4c:	01412e03          	lw	t3,20(sp)
    3a50:	3a0340e3          	bltz	t1,45f0 <_vfprintf_r+0x2700>
    3a54:	00000d13          	li	s10,0
    3a58:	01212823          	sw	s2,16(sp)
    3a5c:	000c0c93          	mv	s9,s8
    3a60:	fff00493          	li	s1,-1
    3a64:	000b0c13          	mv	s8,s6
    3a68:	000e8a13          	mv	s4,t4
    3a6c:	00040b13          	mv	s6,s0
    3a70:	000d0913          	mv	s2,s10
    3a74:	00030413          	mv	s0,t1
    3a78:	0300006f          	j	3aa8 <_vfprintf_r+0x1bb8>
    3a7c:	09810693          	add	a3,sp,152
    3a80:	0ec10593          	add	a1,sp,236
    3a84:	00098513          	mv	a0,s3
    3a88:	110070ef          	jal	ab98 <_wcrtomb_r>
    3a8c:	68950ae3          	beq	a0,s1,4920 <_vfprintf_r+0x2a30>
    3a90:	00a907b3          	add	a5,s2,a0
    3a94:	02f44263          	blt	s0,a5,3ab8 <_vfprintf_r+0x1bc8>
    3a98:	004d0d13          	add	s10,s10,4
    3a9c:	00879463          	bne	a5,s0,3aa4 <_vfprintf_r+0x1bb4>
    3aa0:	7990006f          	j	4a38 <_vfprintf_r+0x2b48>
    3aa4:	00078913          	mv	s2,a5
    3aa8:	08412783          	lw	a5,132(sp)
    3aac:	01a787b3          	add	a5,a5,s10
    3ab0:	0007a603          	lw	a2,0(a5)
    3ab4:	fc0614e3          	bnez	a2,3a7c <_vfprintf_r+0x1b8c>
    3ab8:	00090d13          	mv	s10,s2
    3abc:	01412e03          	lw	t3,20(sp)
    3ac0:	01012903          	lw	s2,16(sp)
    3ac4:	000b0413          	mv	s0,s6
    3ac8:	000a0e93          	mv	t4,s4
    3acc:	000c0b13          	mv	s6,s8
    3ad0:	000c8c13          	mv	s8,s9
    3ad4:	340d0ce3          	beqz	s10,462c <_vfprintf_r+0x273c>
    3ad8:	06300793          	li	a5,99
    3adc:	59a7dee3          	bge	a5,s10,4878 <_vfprintf_r+0x2988>
    3ae0:	001d0593          	add	a1,s10,1
    3ae4:	00098513          	mv	a0,s3
    3ae8:	01c12a23          	sw	t3,20(sp)
    3aec:	01d12823          	sw	t4,16(sp)
    3af0:	c09fd0ef          	jal	16f8 <_malloc_r>
    3af4:	01012e83          	lw	t4,16(sp)
    3af8:	01412e03          	lw	t3,20(sp)
    3afc:	00050c13          	mv	s8,a0
    3b00:	620500e3          	beqz	a0,4920 <_vfprintf_r+0x2a30>
    3b04:	00a12823          	sw	a0,16(sp)
    3b08:	00800613          	li	a2,8
    3b0c:	00000593          	li	a1,0
    3b10:	09810513          	add	a0,sp,152
    3b14:	03c12023          	sw	t3,32(sp)
    3b18:	01d12a23          	sw	t4,20(sp)
    3b1c:	c80fd0ef          	jal	f9c <memset>
    3b20:	09810713          	add	a4,sp,152
    3b24:	000d0693          	mv	a3,s10
    3b28:	08410613          	add	a2,sp,132
    3b2c:	000c0593          	mv	a1,s8
    3b30:	00098513          	mv	a0,s3
    3b34:	0f0070ef          	jal	ac24 <_wcsrtombs_r>
    3b38:	01412e83          	lw	t4,20(sp)
    3b3c:	02012e03          	lw	t3,32(sp)
    3b40:	00ad0463          	beq	s10,a0,3b48 <_vfprintf_r+0x1c58>
    3b44:	0240106f          	j	4b68 <_vfprintf_r+0x2c78>
    3b48:	01ac0733          	add	a4,s8,s10
    3b4c:	00070023          	sb	zero,0(a4)
    3b50:	07714603          	lbu	a2,119(sp)
    3b54:	fffd4813          	not	a6,s10
    3b58:	41f85813          	sra	a6,a6,0x1f
    3b5c:	01612a23          	sw	s6,20(sp)
    3b60:	02012223          	sw	zero,36(sp)
    3b64:	02012023          	sw	zero,32(sp)
    3b68:	010d7cb3          	and	s9,s10,a6
    3b6c:	00000313          	li	t1,0
    3b70:	00000a13          	li	s4,0
    3b74:	00061463          	bnez	a2,3b7c <_vfprintf_r+0x1c8c>
    3b78:	db8fe06f          	j	2130 <_vfprintf_r+0x240>
    3b7c:	9d5fe06f          	j	2550 <_vfprintf_r+0x660>
    3b80:	00048e93          	mv	t4,s1
    3b84:	000a0293          	mv	t0,s4
    3b88:	00070493          	mv	s1,a4
    3b8c:	01a484b3          	add	s1,s1,s10
    3b90:	00178793          	add	a5,a5,1
    3b94:	00542023          	sw	t0,0(s0)
    3b98:	e48fe06f          	j	21e0 <_vfprintf_r+0x2f0>
    3b9c:	01412783          	lw	a5,20(sp)
    3ba0:	00c12703          	lw	a4,12(sp)
    3ba4:	0007a783          	lw	a5,0(a5)
    3ba8:	00e7a023          	sw	a4,0(a5)
    3bac:	fadfe06f          	j	2b58 <_vfprintf_r+0xc68>
    3bb0:	02012e83          	lw	t4,32(sp)
    3bb4:	00040293          	mv	t0,s0
    3bb8:	000a0413          	mv	s0,s4
    3bbc:	008484b3          	add	s1,s1,s0
    3bc0:	001d0d13          	add	s10,s10,1
    3bc4:	005b2023          	sw	t0,0(s6)
    3bc8:	b7dfe06f          	j	2744 <_vfprintf_r+0x854>
    3bcc:	03412703          	lw	a4,52(sp)
    3bd0:	03012783          	lw	a5,48(sp)
    3bd4:	00700613          	li	a2,7
    3bd8:	00e42023          	sw	a4,0(s0)
    3bdc:	0a412703          	lw	a4,164(sp)
    3be0:	009784b3          	add	s1,a5,s1
    3be4:	00f42223          	sw	a5,4(s0)
    3be8:	00170713          	add	a4,a4,1
    3bec:	0a912423          	sw	s1,168(sp)
    3bf0:	0ae12223          	sw	a4,164(sp)
    3bf4:	00840413          	add	s0,s0,8
    3bf8:	3ae64463          	blt	a2,a4,3fa0 <_vfprintf_r+0x20b0>
    3bfc:	3e06cee3          	bltz	a3,47f8 <_vfprintf_r+0x2908>
    3c00:	01812783          	lw	a5,24(sp)
    3c04:	00170713          	add	a4,a4,1
    3c08:	01842023          	sw	s8,0(s0)
    3c0c:	009784b3          	add	s1,a5,s1
    3c10:	00f42223          	sw	a5,4(s0)
    3c14:	0a912423          	sw	s1,168(sp)
    3c18:	0ae12223          	sw	a4,164(sp)
    3c1c:	00700793          	li	a5,7
    3c20:	00e7c463          	blt	a5,a4,3c28 <_vfprintf_r+0x1d38>
    3c24:	dd0fe06f          	j	21f4 <_vfprintf_r+0x304>
    3c28:	b61fe06f          	j	2788 <_vfprintf_r+0x898>
    3c2c:	01000613          	li	a2,16
    3c30:	0a412683          	lw	a3,164(sp)
    3c34:	0000c297          	auipc	t0,0xc
    3c38:	99828293          	add	t0,t0,-1640 # f5cc <zeroes.0>
    3c3c:	09665463          	bge	a2,s6,3cc4 <_vfprintf_r+0x1dd4>
    3c40:	00040793          	mv	a5,s0
    3c44:	00048713          	mv	a4,s1
    3c48:	00812403          	lw	s0,8(sp)
    3c4c:	01000893          	li	a7,16
    3c50:	00700d13          	li	s10,7
    3c54:	05d12223          	sw	t4,68(sp)
    3c58:	00028493          	mv	s1,t0
    3c5c:	00c0006f          	j	3c68 <_vfprintf_r+0x1d78>
    3c60:	ff0b0b13          	add	s6,s6,-16
    3c64:	0568d863          	bge	a7,s6,3cb4 <_vfprintf_r+0x1dc4>
    3c68:	01070713          	add	a4,a4,16
    3c6c:	00168693          	add	a3,a3,1
    3c70:	0097a023          	sw	s1,0(a5)
    3c74:	0117a223          	sw	a7,4(a5)
    3c78:	0ae12423          	sw	a4,168(sp)
    3c7c:	0ad12223          	sw	a3,164(sp)
    3c80:	00878793          	add	a5,a5,8
    3c84:	fcdd5ee3          	bge	s10,a3,3c60 <_vfprintf_r+0x1d70>
    3c88:	0a010613          	add	a2,sp,160
    3c8c:	00040593          	mv	a1,s0
    3c90:	00098513          	mv	a0,s3
    3c94:	118010ef          	jal	4dac <__sprint_r>
    3c98:	00050463          	beqz	a0,3ca0 <_vfprintf_r+0x1db0>
    3c9c:	f24fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    3ca0:	0a812703          	lw	a4,168(sp)
    3ca4:	0a412683          	lw	a3,164(sp)
    3ca8:	0ac10793          	add	a5,sp,172
    3cac:	01000893          	li	a7,16
    3cb0:	fb1ff06f          	j	3c60 <_vfprintf_r+0x1d70>
    3cb4:	04412e83          	lw	t4,68(sp)
    3cb8:	00048293          	mv	t0,s1
    3cbc:	00078413          	mv	s0,a5
    3cc0:	00070493          	mv	s1,a4
    3cc4:	016484b3          	add	s1,s1,s6
    3cc8:	00168693          	add	a3,a3,1
    3ccc:	00542023          	sw	t0,0(s0)
    3cd0:	01642223          	sw	s6,4(s0)
    3cd4:	0a912423          	sw	s1,168(sp)
    3cd8:	0ad12223          	sw	a3,164(sp)
    3cdc:	00700713          	li	a4,7
    3ce0:	00840413          	add	s0,s0,8
    3ce4:	bed75c63          	bge	a4,a3,30dc <_vfprintf_r+0x11ec>
    3ce8:	00812583          	lw	a1,8(sp)
    3cec:	0a010613          	add	a2,sp,160
    3cf0:	00098513          	mv	a0,s3
    3cf4:	05d12223          	sw	t4,68(sp)
    3cf8:	0b4010ef          	jal	4dac <__sprint_r>
    3cfc:	00050463          	beqz	a0,3d04 <_vfprintf_r+0x1e14>
    3d00:	ec0fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    3d04:	0a812483          	lw	s1,168(sp)
    3d08:	04412e83          	lw	t4,68(sp)
    3d0c:	0ac10413          	add	s0,sp,172
    3d10:	bccff06f          	j	30dc <_vfprintf_r+0x11ec>
    3d14:	02812703          	lw	a4,40(sp)
    3d18:	09810893          	add	a7,sp,152
    3d1c:	08410813          	add	a6,sp,132
    3d20:	00070513          	mv	a0,a4
    3d24:	00050593          	mv	a1,a0
    3d28:	00030713          	mv	a4,t1
    3d2c:	07c10793          	add	a5,sp,124
    3d30:	00200693          	li	a3,2
    3d34:	00048613          	mv	a2,s1
    3d38:	00098513          	mv	a0,s3
    3d3c:	03c12223          	sw	t3,36(sp)
    3d40:	03d12023          	sw	t4,32(sp)
    3d44:	00612c23          	sw	t1,24(sp)
    3d48:	3a8040ef          	jal	80f0 <_dtoa_r>
    3d4c:	02012e83          	lw	t4,32(sp)
    3d50:	01812303          	lw	t1,24(sp)
    3d54:	02412e03          	lw	t3,36(sp)
    3d58:	001ef713          	and	a4,t4,1
    3d5c:	00050c13          	mv	s8,a0
    3d60:	1a0712e3          	bnez	a4,4704 <_vfprintf_r+0x2814>
    3d64:	09812783          	lw	a5,152(sp)
    3d68:	07c12a03          	lw	s4,124(sp)
    3d6c:	40a787b3          	sub	a5,a5,a0
    3d70:	00f12c23          	sw	a5,24(sp)
    3d74:	ffd00713          	li	a4,-3
    3d78:	00ea4463          	blt	s4,a4,3d80 <_vfprintf_r+0x1e90>
    3d7c:	5b435663          	bge	t1,s4,4328 <_vfprintf_r+0x2438>
    3d80:	ffee0e13          	add	t3,t3,-2
    3d84:	fffa0d13          	add	s10,s4,-1
    3d88:	07a12e23          	sw	s10,124(sp)
    3d8c:	0ffe7693          	zext.b	a3,t3
    3d90:	00000613          	li	a2,0
    3d94:	08d10423          	sb	a3,136(sp)
    3d98:	02b00693          	li	a3,43
    3d9c:	000d5863          	bgez	s10,3dac <_vfprintf_r+0x1ebc>
    3da0:	00100713          	li	a4,1
    3da4:	41470d33          	sub	s10,a4,s4
    3da8:	02d00693          	li	a3,45
    3dac:	08d104a3          	sb	a3,137(sp)
    3db0:	00900693          	li	a3,9
    3db4:	33a6d8e3          	bge	a3,s10,48e4 <_vfprintf_r+0x29f4>
    3db8:	000c0793          	mv	a5,s8
    3dbc:	09f10493          	add	s1,sp,159
    3dc0:	03212023          	sw	s2,32(sp)
    3dc4:	00040c13          	mv	s8,s0
    3dc8:	06300a13          	li	s4,99
    3dcc:	000d0413          	mv	s0,s10
    3dd0:	03d12223          	sw	t4,36(sp)
    3dd4:	05c12023          	sw	t3,64(sp)
    3dd8:	00048913          	mv	s2,s1
    3ddc:	00098c93          	mv	s9,s3
    3de0:	00078d13          	mv	s10,a5
    3de4:	00a00593          	li	a1,10
    3de8:	00040513          	mv	a0,s0
    3dec:	09c0b0ef          	jal	ee88 <__modsi3>
    3df0:	03050713          	add	a4,a0,48
    3df4:	00090b13          	mv	s6,s2
    3df8:	00040513          	mv	a0,s0
    3dfc:	feeb0fa3          	sb	a4,-1(s6)
    3e00:	00a00593          	li	a1,10
    3e04:	00040993          	mv	s3,s0
    3e08:	7fd0a0ef          	jal	ee04 <__divsi3>
    3e0c:	fff90913          	add	s2,s2,-1
    3e10:	00050413          	mv	s0,a0
    3e14:	fd3a48e3          	blt	s4,s3,3de4 <_vfprintf_r+0x1ef4>
    3e18:	000c8993          	mv	s3,s9
    3e1c:	03050713          	add	a4,a0,48
    3e20:	00090c93          	mv	s9,s2
    3e24:	ffeb0693          	add	a3,s6,-2
    3e28:	feec8fa3          	sb	a4,-1(s9)
    3e2c:	000c0413          	mv	s0,s8
    3e30:	02412e83          	lw	t4,36(sp)
    3e34:	04012e03          	lw	t3,64(sp)
    3e38:	02012903          	lw	s2,32(sp)
    3e3c:	000d0c13          	mv	s8,s10
    3e40:	4c96f6e3          	bgeu	a3,s1,4b0c <_vfprintf_r+0x2c1c>
    3e44:	08a10713          	add	a4,sp,138
    3e48:	0006c783          	lbu	a5,0(a3)
    3e4c:	00168693          	add	a3,a3,1
    3e50:	00170713          	add	a4,a4,1
    3e54:	fef70fa3          	sb	a5,-1(a4)
    3e58:	fe9698e3          	bne	a3,s1,3e48 <_vfprintf_r+0x1f58>
    3e5c:	15010793          	add	a5,sp,336
    3e60:	41678633          	sub	a2,a5,s6
    3e64:	f5360793          	add	a5,a2,-173
    3e68:	04f12023          	sw	a5,64(sp)
    3e6c:	01812783          	lw	a5,24(sp)
    3e70:	04012683          	lw	a3,64(sp)
    3e74:	00100713          	li	a4,1
    3e78:	00d78d33          	add	s10,a5,a3
    3e7c:	28f75ce3          	bge	a4,a5,4914 <_vfprintf_r+0x2a24>
    3e80:	03012783          	lw	a5,48(sp)
    3e84:	00fd0d33          	add	s10,s10,a5
    3e88:	fffd4813          	not	a6,s10
    3e8c:	bffeff13          	and	t5,t4,-1025
    3e90:	41f85813          	sra	a6,a6,0x1f
    3e94:	100f6e93          	or	t4,t5,256
    3e98:	010d7cb3          	and	s9,s10,a6
    3e9c:	02012223          	sw	zero,36(sp)
    3ea0:	02012023          	sw	zero,32(sp)
    3ea4:	00000a13          	li	s4,0
    3ea8:	04412783          	lw	a5,68(sp)
    3eac:	46079263          	bnez	a5,4310 <_vfprintf_r+0x2420>
    3eb0:	07714603          	lbu	a2,119(sp)
    3eb4:	00000313          	li	t1,0
    3eb8:	00061463          	bnez	a2,3ec0 <_vfprintf_r+0x1fd0>
    3ebc:	a74fe06f          	j	2130 <_vfprintf_r+0x240>
    3ec0:	e90fe06f          	j	2550 <_vfprintf_r+0x660>
    3ec4:	00812583          	lw	a1,8(sp)
    3ec8:	0a010613          	add	a2,sp,160
    3ecc:	00098513          	mv	a0,s3
    3ed0:	03d12023          	sw	t4,32(sp)
    3ed4:	6d9000ef          	jal	4dac <__sprint_r>
    3ed8:	00050463          	beqz	a0,3ee0 <_vfprintf_r+0x1ff0>
    3edc:	ce4fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    3ee0:	07c12683          	lw	a3,124(sp)
    3ee4:	0a812483          	lw	s1,168(sp)
    3ee8:	02012e83          	lw	t4,32(sp)
    3eec:	0ac10413          	add	s0,sp,172
    3ef0:	ce0ff06f          	j	33d0 <_vfprintf_r+0x14e0>
    3ef4:	00600c93          	li	s9,6
    3ef8:	f14ff06f          	j	360c <_vfprintf_r+0x171c>
    3efc:	0ffd7d13          	zext.b	s10,s10
    3f00:	00000c93          	li	s9,0
    3f04:	bd5fe06f          	j	2ad8 <_vfprintf_r+0xbe8>
    3f08:	0ffd7d13          	zext.b	s10,s10
    3f0c:	00000c93          	li	s9,0
    3f10:	e48ff06f          	j	3558 <_vfprintf_r+0x1668>
    3f14:	018d1d13          	sll	s10,s10,0x18
    3f18:	418d5d13          	sra	s10,s10,0x18
    3f1c:	41fd5c93          	sra	s9,s10,0x1f
    3f20:	000c8793          	mv	a5,s9
    3f24:	b39fe06f          	j	2a5c <_vfprintf_r+0xb6c>
    3f28:	01412783          	lw	a5,20(sp)
    3f2c:	00c12703          	lw	a4,12(sp)
    3f30:	0007a783          	lw	a5,0(a5)
    3f34:	00e79023          	sh	a4,0(a5)
    3f38:	c21fe06f          	j	2b58 <_vfprintf_r+0xc68>
    3f3c:	000c0513          	mv	a0,s8
    3f40:	05d12223          	sw	t4,68(sp)
    3f44:	ad8fd0ef          	jal	121c <strlen>
    3f48:	07714603          	lbu	a2,119(sp)
    3f4c:	fff54813          	not	a6,a0
    3f50:	41f85813          	sra	a6,a6,0x1f
    3f54:	01612a23          	sw	s6,20(sp)
    3f58:	02012223          	sw	zero,36(sp)
    3f5c:	02012023          	sw	zero,32(sp)
    3f60:	00012823          	sw	zero,16(sp)
    3f64:	04412e83          	lw	t4,68(sp)
    3f68:	00050d13          	mv	s10,a0
    3f6c:	01057cb3          	and	s9,a0,a6
    3f70:	00000313          	li	t1,0
    3f74:	07300e13          	li	t3,115
    3f78:	00061463          	bnez	a2,3f80 <_vfprintf_r+0x2090>
    3f7c:	9b4fe06f          	j	2130 <_vfprintf_r+0x240>
    3f80:	dd0fe06f          	j	2550 <_vfprintf_r+0x660>
    3f84:	00812583          	lw	a1,8(sp)
    3f88:	0a010613          	add	a2,sp,160
    3f8c:	00098513          	mv	a0,s3
    3f90:	61d000ef          	jal	4dac <__sprint_r>
    3f94:	00051463          	bnez	a0,3f9c <_vfprintf_r+0x20ac>
    3f98:	be8fe06f          	j	2380 <_vfprintf_r+0x490>
    3f9c:	c38fe06f          	j	23d4 <_vfprintf_r+0x4e4>
    3fa0:	00812583          	lw	a1,8(sp)
    3fa4:	0a010613          	add	a2,sp,160
    3fa8:	00098513          	mv	a0,s3
    3fac:	03d12023          	sw	t4,32(sp)
    3fb0:	5fd000ef          	jal	4dac <__sprint_r>
    3fb4:	00050463          	beqz	a0,3fbc <_vfprintf_r+0x20cc>
    3fb8:	c08fe06f          	j	23c0 <_vfprintf_r+0x4d0>
    3fbc:	07c12683          	lw	a3,124(sp)
    3fc0:	0a812483          	lw	s1,168(sp)
    3fc4:	0a412703          	lw	a4,164(sp)
    3fc8:	02012e83          	lw	t4,32(sp)
    3fcc:	0ac10413          	add	s0,sp,172
    3fd0:	c2dff06f          	j	3bfc <_vfprintf_r+0x1d0c>
    3fd4:	05862503          	lw	a0,88(a2)
    3fd8:	00f12623          	sw	a5,12(sp)
    3fdc:	fbdfc0ef          	jal	f98 <__retarget_lock_release_recursive>
    3fe0:	00c12783          	lw	a5,12(sp)
    3fe4:	ab8fe06f          	j	229c <_vfprintf_r+0x3ac>
    3fe8:	00130a13          	add	s4,t1,1
    3fec:	00200693          	li	a3,2
    3ff0:	02812703          	lw	a4,40(sp)
    3ff4:	09810893          	add	a7,sp,152
    3ff8:	08410813          	add	a6,sp,132
    3ffc:	00070513          	mv	a0,a4
    4000:	00050593          	mv	a1,a0
    4004:	000a0713          	mv	a4,s4
    4008:	07c10793          	add	a5,sp,124
    400c:	00048613          	mv	a2,s1
    4010:	00098513          	mv	a0,s3
    4014:	02612223          	sw	t1,36(sp)
    4018:	03c12023          	sw	t3,32(sp)
    401c:	01d12c23          	sw	t4,24(sp)
    4020:	0d0040ef          	jal	80f0 <_dtoa_r>
    4024:	02012e03          	lw	t3,32(sp)
    4028:	04600693          	li	a3,70
    402c:	01812e83          	lw	t4,24(sp)
    4030:	fdfe7d13          	and	s10,t3,-33
    4034:	02412303          	lw	t1,36(sp)
    4038:	00050c13          	mv	s8,a0
    403c:	01450733          	add	a4,a0,s4
    4040:	34dd14e3          	bne	s10,a3,4b88 <_vfprintf_r+0x2c98>
    4044:	000c4603          	lbu	a2,0(s8)
    4048:	03000693          	li	a3,48
    404c:	6cd60263          	beq	a2,a3,4710 <_vfprintf_r+0x2820>
    4050:	07c12683          	lw	a3,124(sp)
    4054:	00d70733          	add	a4,a4,a3
    4058:	02812683          	lw	a3,40(sp)
    405c:	00048593          	mv	a1,s1
    4060:	00000613          	li	a2,0
    4064:	00068513          	mv	a0,a3
    4068:	00000693          	li	a3,0
    406c:	04e12823          	sw	a4,80(sp)
    4070:	02612223          	sw	t1,36(sp)
    4074:	03c12023          	sw	t3,32(sp)
    4078:	01d12c23          	sw	t4,24(sp)
    407c:	370090ef          	jal	d3ec <__eqdf2>
    4080:	01812e83          	lw	t4,24(sp)
    4084:	02012e03          	lw	t3,32(sp)
    4088:	02412303          	lw	t1,36(sp)
    408c:	05012703          	lw	a4,80(sp)
    4090:	62050863          	beqz	a0,46c0 <_vfprintf_r+0x27d0>
    4094:	09812783          	lw	a5,152(sp)
    4098:	00e7fe63          	bgeu	a5,a4,40b4 <_vfprintf_r+0x21c4>
    409c:	03000613          	li	a2,48
    40a0:	00178693          	add	a3,a5,1
    40a4:	08d12c23          	sw	a3,152(sp)
    40a8:	00c78023          	sb	a2,0(a5)
    40ac:	09812783          	lw	a5,152(sp)
    40b0:	fee7e8e3          	bltu	a5,a4,40a0 <_vfprintf_r+0x21b0>
    40b4:	07c12a03          	lw	s4,124(sp)
    40b8:	418787b3          	sub	a5,a5,s8
    40bc:	04700713          	li	a4,71
    40c0:	00f12c23          	sw	a5,24(sp)
    40c4:	caed08e3          	beq	s10,a4,3d74 <_vfprintf_r+0x1e84>
    40c8:	04600713          	li	a4,70
    40cc:	68ed0863          	beq	s10,a4,475c <_vfprintf_r+0x286c>
    40d0:	fffa0d13          	add	s10,s4,-1
    40d4:	cb5ff06f          	j	3d88 <_vfprintf_r+0x1e98>
    40d8:	02812703          	lw	a4,40(sp)
    40dc:	07c10613          	add	a2,sp,124
    40e0:	00048593          	mv	a1,s1
    40e4:	00070513          	mv	a0,a4
    40e8:	02612223          	sw	t1,36(sp)
    40ec:	03c12023          	sw	t3,32(sp)
    40f0:	01d12c23          	sw	t4,24(sp)
    40f4:	4e9030ef          	jal	7ddc <frexp>
    40f8:	7fffc717          	auipc	a4,0x7fffc
    40fc:	5b070713          	add	a4,a4,1456 # 800006a8 <__global_locale+0x174>
    4100:	00072603          	lw	a2,0(a4)
    4104:	00472683          	lw	a3,4(a4)
    4108:	578090ef          	jal	d680 <__muldf3>
    410c:	00000613          	li	a2,0
    4110:	00000693          	li	a3,0
    4114:	00050a13          	mv	s4,a0
    4118:	00058d13          	mv	s10,a1
    411c:	2d0090ef          	jal	d3ec <__eqdf2>
    4120:	01812e83          	lw	t4,24(sp)
    4124:	02012e03          	lw	t3,32(sp)
    4128:	02412303          	lw	t1,36(sp)
    412c:	00051663          	bnez	a0,4138 <_vfprintf_r+0x2248>
    4130:	00100713          	li	a4,1
    4134:	06e12e23          	sw	a4,124(sp)
    4138:	0000b797          	auipc	a5,0xb
    413c:	fc078793          	add	a5,a5,-64 # f0f8 <__fini_array_end+0x1b8>
    4140:	06100713          	li	a4,97
    4144:	02f12023          	sw	a5,32(sp)
    4148:	00ee1863          	bne	t3,a4,4158 <_vfprintf_r+0x2268>
    414c:	0000b797          	auipc	a5,0xb
    4150:	f9878793          	add	a5,a5,-104 # f0e4 <__fini_array_end+0x1a4>
    4154:	02f12023          	sw	a5,32(sp)
    4158:	7fffc717          	auipc	a4,0x7fffc
    415c:	55870713          	add	a4,a4,1368 # 800006b0 <__global_locale+0x17c>
    4160:	00072783          	lw	a5,0(a4)
    4164:	00472803          	lw	a6,4(a4)
    4168:	000c0493          	mv	s1,s8
    416c:	00f12c23          	sw	a5,24(sp)
    4170:	000d0793          	mv	a5,s10
    4174:	03212223          	sw	s2,36(sp)
    4178:	000c0d13          	mv	s10,s8
    417c:	02012903          	lw	s2,32(sp)
    4180:	00098c13          	mv	s8,s3
    4184:	01012e23          	sw	a6,28(sp)
    4188:	fff30b13          	add	s6,t1,-1
    418c:	fff00c93          	li	s9,-1
    4190:	05d12023          	sw	t4,64(sp)
    4194:	05c12823          	sw	t3,80(sp)
    4198:	04812a23          	sw	s0,84(sp)
    419c:	00078993          	mv	s3,a5
    41a0:	01c0006f          	j	41bc <_vfprintf_r+0x22cc>
    41a4:	00000613          	li	a2,0
    41a8:	00000693          	li	a3,0
    41ac:	fffb0413          	add	s0,s6,-1
    41b0:	23c090ef          	jal	d3ec <__eqdf2>
    41b4:	0a0504e3          	beqz	a0,4a5c <_vfprintf_r+0x2b6c>
    41b8:	00040b13          	mv	s6,s0
    41bc:	01812603          	lw	a2,24(sp)
    41c0:	01c12683          	lw	a3,28(sp)
    41c4:	000a0513          	mv	a0,s4
    41c8:	00098593          	mv	a1,s3
    41cc:	4b4090ef          	jal	d680 <__muldf3>
    41d0:	00058a13          	mv	s4,a1
    41d4:	00050993          	mv	s3,a0
    41d8:	5940a0ef          	jal	e76c <__fixdfsi>
    41dc:	00050413          	mv	s0,a0
    41e0:	6100a0ef          	jal	e7f0 <__floatsidf>
    41e4:	00050613          	mv	a2,a0
    41e8:	00058693          	mv	a3,a1
    41ec:	00098513          	mv	a0,s3
    41f0:	000a0593          	mv	a1,s4
    41f4:	41d090ef          	jal	de10 <__subdf3>
    41f8:	00890733          	add	a4,s2,s0
    41fc:	00074703          	lbu	a4,0(a4)
    4200:	00048813          	mv	a6,s1
    4204:	00050a13          	mv	s4,a0
    4208:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    420c:	00058993          	mv	s3,a1
    4210:	00148493          	add	s1,s1,1
    4214:	f99b18e3          	bne	s6,s9,41a4 <_vfprintf_r+0x22b4>
    4218:	7fffc697          	auipc	a3,0x7fffc
    421c:	4a068693          	add	a3,a3,1184 # 800006b8 <__global_locale+0x184>
    4220:	0006a303          	lw	t1,0(a3)
    4224:	0046a383          	lw	t2,4(a3)
    4228:	05012e03          	lw	t3,80(sp)
    422c:	00030613          	mv	a2,t1
    4230:	00038693          	mv	a3,t2
    4234:	01012c23          	sw	a6,24(sp)
    4238:	02412903          	lw	s2,36(sp)
    423c:	000c0993          	mv	s3,s8
    4240:	03c12223          	sw	t3,36(sp)
    4244:	000d0c13          	mv	s8,s10
    4248:	00058d13          	mv	s10,a1
    424c:	22c090ef          	jal	d478 <__gedf2>
    4250:	7fffc797          	auipc	a5,0x7fffc
    4254:	46878793          	add	a5,a5,1128 # 800006b8 <__global_locale+0x184>
    4258:	00040b13          	mv	s6,s0
    425c:	0007a303          	lw	t1,0(a5)
    4260:	05412403          	lw	s0,84(sp)
    4264:	0047a383          	lw	t2,4(a5)
    4268:	01812803          	lw	a6,24(sp)
    426c:	02412e03          	lw	t3,36(sp)
    4270:	04012e83          	lw	t4,64(sp)
    4274:	0aa05ce3          	blez	a0,4b2c <_vfprintf_r+0x2c3c>
    4278:	02012783          	lw	a5,32(sp)
    427c:	09012c23          	sw	a6,152(sp)
    4280:	fff4c603          	lbu	a2,-1(s1)
    4284:	00f7c583          	lbu	a1,15(a5)
    4288:	00048693          	mv	a3,s1
    428c:	02b61063          	bne	a2,a1,42ac <_vfprintf_r+0x23bc>
    4290:	03000513          	li	a0,48
    4294:	fea68fa3          	sb	a0,-1(a3)
    4298:	09812683          	lw	a3,152(sp)
    429c:	fff68793          	add	a5,a3,-1
    42a0:	08f12c23          	sw	a5,152(sp)
    42a4:	fff6c603          	lbu	a2,-1(a3)
    42a8:	feb606e3          	beq	a2,a1,4294 <_vfprintf_r+0x23a4>
    42ac:	00160593          	add	a1,a2,1
    42b0:	03900513          	li	a0,57
    42b4:	0ff5f593          	zext.b	a1,a1
    42b8:	04a60463          	beq	a2,a0,4300 <_vfprintf_r+0x2410>
    42bc:	feb68fa3          	sb	a1,-1(a3)
    42c0:	00048793          	mv	a5,s1
    42c4:	07c12a03          	lw	s4,124(sp)
    42c8:	418787b3          	sub	a5,a5,s8
    42cc:	06100613          	li	a2,97
    42d0:	fffa0d13          	add	s10,s4,-1
    42d4:	00f12c23          	sw	a5,24(sp)
    42d8:	07a12e23          	sw	s10,124(sp)
    42dc:	07000693          	li	a3,112
    42e0:	00ce0663          	beq	t3,a2,42ec <_vfprintf_r+0x23fc>
    42e4:	05000693          	li	a3,80
    42e8:	04100e13          	li	t3,65
    42ec:	00100613          	li	a2,1
    42f0:	aa5ff06f          	j	3d94 <_vfprintf_r+0x1ea4>
    42f4:	00030a13          	mv	s4,t1
    42f8:	00300693          	li	a3,3
    42fc:	cf5ff06f          	j	3ff0 <_vfprintf_r+0x2100>
    4300:	02012783          	lw	a5,32(sp)
    4304:	00a7c583          	lbu	a1,10(a5)
    4308:	feb68fa3          	sb	a1,-1(a3)
    430c:	fb5ff06f          	j	42c0 <_vfprintf_r+0x23d0>
    4310:	02d00713          	li	a4,45
    4314:	06e10ba3          	sb	a4,119(sp)
    4318:	02d00613          	li	a2,45
    431c:	00000313          	li	t1,0
    4320:	001c8c93          	add	s9,s9,1
    4324:	e0dfd06f          	j	2130 <_vfprintf_r+0x240>
    4328:	01812783          	lw	a5,24(sp)
    432c:	46fa4063          	blt	s4,a5,478c <_vfprintf_r+0x289c>
    4330:	001ef713          	and	a4,t4,1
    4334:	000a0d13          	mv	s10,s4
    4338:	00070663          	beqz	a4,4344 <_vfprintf_r+0x2454>
    433c:	03012783          	lw	a5,48(sp)
    4340:	00fa0d33          	add	s10,s4,a5
    4344:	400eff13          	and	t5,t4,1024
    4348:	000f0463          	beqz	t5,4350 <_vfprintf_r+0x2460>
    434c:	5f404e63          	bgtz	s4,4948 <_vfprintf_r+0x2a58>
    4350:	fffd4813          	not	a6,s10
    4354:	41f85813          	sra	a6,a6,0x1f
    4358:	010d7cb3          	and	s9,s10,a6
    435c:	06700e13          	li	t3,103
    4360:	000b0e93          	mv	t4,s6
    4364:	02012223          	sw	zero,36(sp)
    4368:	02012023          	sw	zero,32(sp)
    436c:	b3dff06f          	j	3ea8 <_vfprintf_r+0x1fb8>
    4370:	02d00793          	li	a5,45
    4374:	06f10ba3          	sb	a5,119(sp)
    4378:	02d00613          	li	a2,45
    437c:	998fe06f          	j	2514 <_vfprintf_r+0x624>
    4380:	01812783          	lw	a5,24(sp)
    4384:	02012a03          	lw	s4,32(sp)
    4388:	05212823          	sw	s2,80(sp)
    438c:	00fc07b3          	add	a5,s8,a5
    4390:	05712c23          	sw	s7,88(sp)
    4394:	05912e23          	sw	s9,92(sp)
    4398:	00040713          	mv	a4,s0
    439c:	04f12223          	sw	a5,68(sp)
    43a0:	02412403          	lw	s0,36(sp)
    43a4:	05d12a23          	sw	t4,84(sp)
    43a8:	03812223          	sw	s8,36(sp)
    43ac:	03c12b83          	lw	s7,60(sp)
    43b0:	04c12c83          	lw	s9,76(sp)
    43b4:	00812903          	lw	s2,8(sp)
    43b8:	00700693          	li	a3,7
    43bc:	01000d13          	li	s10,16
    43c0:	0000bb17          	auipc	s6,0xb
    43c4:	20cb0b13          	add	s6,s6,524 # f5cc <zeroes.0>
    43c8:	00048613          	mv	a2,s1
    43cc:	00030c13          	mv	s8,t1
    43d0:	09405863          	blez	s4,4460 <_vfprintf_r+0x2570>
    43d4:	16805e63          	blez	s0,4550 <_vfprintf_r+0x2660>
    43d8:	fff40413          	add	s0,s0,-1
    43dc:	04812783          	lw	a5,72(sp)
    43e0:	01960633          	add	a2,a2,s9
    43e4:	01972223          	sw	s9,4(a4)
    43e8:	00f72023          	sw	a5,0(a4)
    43ec:	0a412783          	lw	a5,164(sp)
    43f0:	0ac12423          	sw	a2,168(sp)
    43f4:	00870713          	add	a4,a4,8
    43f8:	00178793          	add	a5,a5,1
    43fc:	0af12223          	sw	a5,164(sp)
    4400:	14f6ce63          	blt	a3,a5,455c <_vfprintf_r+0x266c>
    4404:	04412783          	lw	a5,68(sp)
    4408:	000bc583          	lbu	a1,0(s7)
    440c:	418784b3          	sub	s1,a5,s8
    4410:	0095d463          	bge	a1,s1,4418 <_vfprintf_r+0x2528>
    4414:	00058493          	mv	s1,a1
    4418:	02905663          	blez	s1,4444 <_vfprintf_r+0x2554>
    441c:	0a412583          	lw	a1,164(sp)
    4420:	00960633          	add	a2,a2,s1
    4424:	01872023          	sw	s8,0(a4)
    4428:	00158593          	add	a1,a1,1
    442c:	00972223          	sw	s1,4(a4)
    4430:	0ac12423          	sw	a2,168(sp)
    4434:	0ab12223          	sw	a1,164(sp)
    4438:	14b6c663          	blt	a3,a1,4584 <_vfprintf_r+0x2694>
    443c:	000bc583          	lbu	a1,0(s7)
    4440:	00870713          	add	a4,a4,8
    4444:	fff4c513          	not	a0,s1
    4448:	41f55513          	sra	a0,a0,0x1f
    444c:	00a4f7b3          	and	a5,s1,a0
    4450:	40f584b3          	sub	s1,a1,a5
    4454:	04904663          	bgtz	s1,44a0 <_vfprintf_r+0x25b0>
    4458:	00bc0c33          	add	s8,s8,a1
    445c:	f7404ce3          	bgtz	s4,43d4 <_vfprintf_r+0x24e4>
    4460:	f6804ce3          	bgtz	s0,43d8 <_vfprintf_r+0x24e8>
    4464:	01812783          	lw	a5,24(sp)
    4468:	000c0313          	mv	t1,s8
    446c:	02412c03          	lw	s8,36(sp)
    4470:	03712e23          	sw	s7,60(sp)
    4474:	00070413          	mv	s0,a4
    4478:	00fc0733          	add	a4,s8,a5
    447c:	05012903          	lw	s2,80(sp)
    4480:	05412e83          	lw	t4,84(sp)
    4484:	05812b83          	lw	s7,88(sp)
    4488:	05c12c83          	lw	s9,92(sp)
    448c:	00060493          	mv	s1,a2
    4490:	00676463          	bltu	a4,t1,4498 <_vfprintf_r+0x25a8>
    4494:	c59fe06f          	j	30ec <_vfprintf_r+0x11fc>
    4498:	00070313          	mv	t1,a4
    449c:	c51fe06f          	j	30ec <_vfprintf_r+0x11fc>
    44a0:	0a412583          	lw	a1,164(sp)
    44a4:	0000be97          	auipc	t4,0xb
    44a8:	128e8e93          	add	t4,t4,296 # f5cc <zeroes.0>
    44ac:	069d5c63          	bge	s10,s1,4524 <_vfprintf_r+0x2634>
    44b0:	02812023          	sw	s0,32(sp)
    44b4:	00048413          	mv	s0,s1
    44b8:	000b0493          	mv	s1,s6
    44bc:	00c0006f          	j	44c8 <_vfprintf_r+0x25d8>
    44c0:	ff040413          	add	s0,s0,-16
    44c4:	048d5a63          	bge	s10,s0,4518 <_vfprintf_r+0x2628>
    44c8:	01060613          	add	a2,a2,16
    44cc:	00158593          	add	a1,a1,1
    44d0:	01672023          	sw	s6,0(a4)
    44d4:	01a72223          	sw	s10,4(a4)
    44d8:	0ac12423          	sw	a2,168(sp)
    44dc:	0ab12223          	sw	a1,164(sp)
    44e0:	00870713          	add	a4,a4,8
    44e4:	fcb6dee3          	bge	a3,a1,44c0 <_vfprintf_r+0x25d0>
    44e8:	0a010613          	add	a2,sp,160
    44ec:	00090593          	mv	a1,s2
    44f0:	00098513          	mv	a0,s3
    44f4:	0b9000ef          	jal	4dac <__sprint_r>
    44f8:	00050463          	beqz	a0,4500 <_vfprintf_r+0x2610>
    44fc:	ec5fd06f          	j	23c0 <_vfprintf_r+0x4d0>
    4500:	ff040413          	add	s0,s0,-16
    4504:	0a812603          	lw	a2,168(sp)
    4508:	0a412583          	lw	a1,164(sp)
    450c:	0ac10713          	add	a4,sp,172
    4510:	00700693          	li	a3,7
    4514:	fa8d4ae3          	blt	s10,s0,44c8 <_vfprintf_r+0x25d8>
    4518:	00048e93          	mv	t4,s1
    451c:	00040493          	mv	s1,s0
    4520:	02012403          	lw	s0,32(sp)
    4524:	00960633          	add	a2,a2,s1
    4528:	00158593          	add	a1,a1,1
    452c:	01d72023          	sw	t4,0(a4)
    4530:	00972223          	sw	s1,4(a4)
    4534:	0ac12423          	sw	a2,168(sp)
    4538:	0ab12223          	sw	a1,164(sp)
    453c:	10b6ce63          	blt	a3,a1,4658 <_vfprintf_r+0x2768>
    4540:	000bc583          	lbu	a1,0(s7)
    4544:	00870713          	add	a4,a4,8
    4548:	00bc0c33          	add	s8,s8,a1
    454c:	f11ff06f          	j	445c <_vfprintf_r+0x256c>
    4550:	fffb8b93          	add	s7,s7,-1
    4554:	fffa0a13          	add	s4,s4,-1
    4558:	e85ff06f          	j	43dc <_vfprintf_r+0x24ec>
    455c:	0a010613          	add	a2,sp,160
    4560:	00090593          	mv	a1,s2
    4564:	00098513          	mv	a0,s3
    4568:	045000ef          	jal	4dac <__sprint_r>
    456c:	00050463          	beqz	a0,4574 <_vfprintf_r+0x2684>
    4570:	e51fd06f          	j	23c0 <_vfprintf_r+0x4d0>
    4574:	0a812603          	lw	a2,168(sp)
    4578:	0ac10713          	add	a4,sp,172
    457c:	00700693          	li	a3,7
    4580:	e85ff06f          	j	4404 <_vfprintf_r+0x2514>
    4584:	0a010613          	add	a2,sp,160
    4588:	00090593          	mv	a1,s2
    458c:	00098513          	mv	a0,s3
    4590:	01d000ef          	jal	4dac <__sprint_r>
    4594:	00050463          	beqz	a0,459c <_vfprintf_r+0x26ac>
    4598:	e29fd06f          	j	23c0 <_vfprintf_r+0x4d0>
    459c:	000bc583          	lbu	a1,0(s7)
    45a0:	0a812603          	lw	a2,168(sp)
    45a4:	0ac10713          	add	a4,sp,172
    45a8:	00700693          	li	a3,7
    45ac:	e99ff06f          	j	4444 <_vfprintf_r+0x2554>
    45b0:	04c12783          	lw	a5,76(sp)
    45b4:	04812583          	lw	a1,72(sp)
    45b8:	00000913          	li	s2,0
    45bc:	40fc0c33          	sub	s8,s8,a5
    45c0:	00078613          	mv	a2,a5
    45c4:	000c0513          	mv	a0,s8
    45c8:	468030ef          	jal	7a30 <strncpy>
    45cc:	00144783          	lbu	a5,1(s0)
    45d0:	00a00613          	li	a2,10
    45d4:	00000693          	li	a3,0
    45d8:	00f037b3          	snez	a5,a5
    45dc:	000d0513          	mv	a0,s10
    45e0:	000c8593          	mv	a1,s9
    45e4:	00f40433          	add	s0,s0,a5
    45e8:	78d060ef          	jal	b574 <__udivdi3>
    45ec:	a10ff06f          	j	37fc <_vfprintf_r+0x190c>
    45f0:	09810713          	add	a4,sp,152
    45f4:	00000693          	li	a3,0
    45f8:	08410613          	add	a2,sp,132
    45fc:	00000593          	li	a1,0
    4600:	00098513          	mv	a0,s3
    4604:	01c12a23          	sw	t3,20(sp)
    4608:	01d12823          	sw	t4,16(sp)
    460c:	618060ef          	jal	ac24 <_wcsrtombs_r>
    4610:	fff00713          	li	a4,-1
    4614:	01012e83          	lw	t4,16(sp)
    4618:	01412e03          	lw	t3,20(sp)
    461c:	00050d13          	mv	s10,a0
    4620:	30e50063          	beq	a0,a4,4920 <_vfprintf_r+0x2a30>
    4624:	09812223          	sw	s8,132(sp)
    4628:	cacff06f          	j	3ad4 <_vfprintf_r+0x1be4>
    462c:	07714603          	lbu	a2,119(sp)
    4630:	01612a23          	sw	s6,20(sp)
    4634:	02012223          	sw	zero,36(sp)
    4638:	02012023          	sw	zero,32(sp)
    463c:	00012823          	sw	zero,16(sp)
    4640:	00000c93          	li	s9,0
    4644:	00000313          	li	t1,0
    4648:	00000a13          	li	s4,0
    464c:	00061463          	bnez	a2,4654 <_vfprintf_r+0x2764>
    4650:	ae1fd06f          	j	2130 <_vfprintf_r+0x240>
    4654:	efdfd06f          	j	2550 <_vfprintf_r+0x660>
    4658:	0a010613          	add	a2,sp,160
    465c:	00090593          	mv	a1,s2
    4660:	00098513          	mv	a0,s3
    4664:	748000ef          	jal	4dac <__sprint_r>
    4668:	00050463          	beqz	a0,4670 <_vfprintf_r+0x2780>
    466c:	d55fd06f          	j	23c0 <_vfprintf_r+0x4d0>
    4670:	000bc583          	lbu	a1,0(s7)
    4674:	0a812603          	lw	a2,168(sp)
    4678:	0ac10713          	add	a4,sp,172
    467c:	00700693          	li	a3,7
    4680:	00bc0c33          	add	s8,s8,a1
    4684:	dd9ff06f          	j	445c <_vfprintf_r+0x256c>
    4688:	00812583          	lw	a1,8(sp)
    468c:	0a010613          	add	a2,sp,160
    4690:	00098513          	mv	a0,s3
    4694:	05d12223          	sw	t4,68(sp)
    4698:	714000ef          	jal	4dac <__sprint_r>
    469c:	00050463          	beqz	a0,46a4 <_vfprintf_r+0x27b4>
    46a0:	d21fd06f          	j	23c0 <_vfprintf_r+0x4d0>
    46a4:	0a812483          	lw	s1,168(sp)
    46a8:	04412e83          	lw	t4,68(sp)
    46ac:	0ac10413          	add	s0,sp,172
    46b0:	a19fe06f          	j	30c8 <_vfprintf_r+0x11d8>
    46b4:	00900793          	li	a5,9
    46b8:	95a7e263          	bltu	a5,s10,37fc <_vfprintf_r+0x190c>
    46bc:	98cff06f          	j	3848 <_vfprintf_r+0x1958>
    46c0:	07c12a03          	lw	s4,124(sp)
    46c4:	00070793          	mv	a5,a4
    46c8:	9f1ff06f          	j	40b8 <_vfprintf_r+0x21c8>
    46cc:	00812583          	lw	a1,8(sp)
    46d0:	0a010613          	add	a2,sp,160
    46d4:	00098513          	mv	a0,s3
    46d8:	03d12023          	sw	t4,32(sp)
    46dc:	6d0000ef          	jal	4dac <__sprint_r>
    46e0:	00050463          	beqz	a0,46e8 <_vfprintf_r+0x27f8>
    46e4:	cddfd06f          	j	23c0 <_vfprintf_r+0x4d0>
    46e8:	07c12d03          	lw	s10,124(sp)
    46ec:	01812783          	lw	a5,24(sp)
    46f0:	0a812483          	lw	s1,168(sp)
    46f4:	02012e83          	lw	t4,32(sp)
    46f8:	0ac10413          	add	s0,sp,172
    46fc:	41a78d33          	sub	s10,a5,s10
    4700:	a49fe06f          	j	3148 <_vfprintf_r+0x1258>
    4704:	00650733          	add	a4,a0,t1
    4708:	04700d13          	li	s10,71
    470c:	94dff06f          	j	4058 <_vfprintf_r+0x2168>
    4710:	02812603          	lw	a2,40(sp)
    4714:	00048593          	mv	a1,s1
    4718:	00000693          	li	a3,0
    471c:	00060513          	mv	a0,a2
    4720:	00000613          	li	a2,0
    4724:	04e12823          	sw	a4,80(sp)
    4728:	02612223          	sw	t1,36(sp)
    472c:	03c12023          	sw	t3,32(sp)
    4730:	01d12c23          	sw	t4,24(sp)
    4734:	4b9080ef          	jal	d3ec <__eqdf2>
    4738:	01812e83          	lw	t4,24(sp)
    473c:	02012e03          	lw	t3,32(sp)
    4740:	02412303          	lw	t1,36(sp)
    4744:	05012703          	lw	a4,80(sp)
    4748:	34051e63          	bnez	a0,4aa4 <_vfprintf_r+0x2bb4>
    474c:	07c12a03          	lw	s4,124(sp)
    4750:	01470733          	add	a4,a4,s4
    4754:	418707b3          	sub	a5,a4,s8
    4758:	00f12c23          	sw	a5,24(sp)
    475c:	001ef713          	and	a4,t4,1
    4760:	00676733          	or	a4,a4,t1
    4764:	37405a63          	blez	s4,4ad8 <_vfprintf_r+0x2be8>
    4768:	26071263          	bnez	a4,49cc <_vfprintf_r+0x2adc>
    476c:	000a0d13          	mv	s10,s4
    4770:	06600e13          	li	t3,102
    4774:	400eff13          	and	t5,t4,1024
    4778:	1c0f1a63          	bnez	t5,494c <_vfprintf_r+0x2a5c>
    477c:	fffd4813          	not	a6,s10
    4780:	41f85813          	sra	a6,a6,0x1f
    4784:	010d7cb3          	and	s9,s10,a6
    4788:	bd9ff06f          	j	4360 <_vfprintf_r+0x2470>
    478c:	01812783          	lw	a5,24(sp)
    4790:	03012703          	lw	a4,48(sp)
    4794:	06700e13          	li	t3,103
    4798:	00e78d33          	add	s10,a5,a4
    479c:	fd404ce3          	bgtz	s4,4774 <_vfprintf_r+0x2884>
    47a0:	414d06b3          	sub	a3,s10,s4
    47a4:	00168d13          	add	s10,a3,1
    47a8:	fffd4813          	not	a6,s10
    47ac:	41f85813          	sra	a6,a6,0x1f
    47b0:	010d7cb3          	and	s9,s10,a6
    47b4:	badff06f          	j	4360 <_vfprintf_r+0x2470>
    47b8:	000e8613          	mv	a2,t4
    47bc:	ad8fe06f          	j	2a94 <_vfprintf_r+0xba4>
    47c0:	00812783          	lw	a5,8(sp)
    47c4:	0647a783          	lw	a5,100(a5)
    47c8:	0017f793          	and	a5,a5,1
    47cc:	02079063          	bnez	a5,47ec <_vfprintf_r+0x28fc>
    47d0:	00812783          	lw	a5,8(sp)
    47d4:	00c7d783          	lhu	a5,12(a5)
    47d8:	2007f793          	and	a5,a5,512
    47dc:	00079863          	bnez	a5,47ec <_vfprintf_r+0x28fc>
    47e0:	00812783          	lw	a5,8(sp)
    47e4:	0587a503          	lw	a0,88(a5)
    47e8:	fb0fc0ef          	jal	f98 <__retarget_lock_release_recursive>
    47ec:	fff00793          	li	a5,-1
    47f0:	00f12623          	sw	a5,12(sp)
    47f4:	c2dfd06f          	j	2420 <_vfprintf_r+0x530>
    47f8:	ff000613          	li	a2,-16
    47fc:	40d00d33          	neg	s10,a3
    4800:	0000b297          	auipc	t0,0xb
    4804:	dcc28293          	add	t0,t0,-564 # f5cc <zeroes.0>
    4808:	08c6d463          	bge	a3,a2,4890 <_vfprintf_r+0x29a0>
    480c:	03212023          	sw	s2,32(sp)
    4810:	01000693          	li	a3,16
    4814:	00700b13          	li	s6,7
    4818:	000e8a13          	mv	s4,t4
    481c:	00028913          	mv	s2,t0
    4820:	00c0006f          	j	482c <_vfprintf_r+0x293c>
    4824:	ff0d0d13          	add	s10,s10,-16
    4828:	05a6de63          	bge	a3,s10,4884 <_vfprintf_r+0x2994>
    482c:	01048493          	add	s1,s1,16
    4830:	00170713          	add	a4,a4,1
    4834:	01242023          	sw	s2,0(s0)
    4838:	00d42223          	sw	a3,4(s0)
    483c:	0a912423          	sw	s1,168(sp)
    4840:	0ae12223          	sw	a4,164(sp)
    4844:	00840413          	add	s0,s0,8
    4848:	fceb5ee3          	bge	s6,a4,4824 <_vfprintf_r+0x2934>
    484c:	00812583          	lw	a1,8(sp)
    4850:	0a010613          	add	a2,sp,160
    4854:	00098513          	mv	a0,s3
    4858:	554000ef          	jal	4dac <__sprint_r>
    485c:	00050463          	beqz	a0,4864 <_vfprintf_r+0x2974>
    4860:	b61fd06f          	j	23c0 <_vfprintf_r+0x4d0>
    4864:	0a812483          	lw	s1,168(sp)
    4868:	0a412703          	lw	a4,164(sp)
    486c:	0ac10413          	add	s0,sp,172
    4870:	01000693          	li	a3,16
    4874:	fb1ff06f          	j	4824 <_vfprintf_r+0x2934>
    4878:	00012823          	sw	zero,16(sp)
    487c:	0ec10c13          	add	s8,sp,236
    4880:	a88ff06f          	j	3b08 <_vfprintf_r+0x1c18>
    4884:	00090293          	mv	t0,s2
    4888:	02012903          	lw	s2,32(sp)
    488c:	000a0e93          	mv	t4,s4
    4890:	01a484b3          	add	s1,s1,s10
    4894:	00170713          	add	a4,a4,1
    4898:	00542023          	sw	t0,0(s0)
    489c:	01a42223          	sw	s10,4(s0)
    48a0:	0a912423          	sw	s1,168(sp)
    48a4:	0ae12223          	sw	a4,164(sp)
    48a8:	00700693          	li	a3,7
    48ac:	00e6c463          	blt	a3,a4,48b4 <_vfprintf_r+0x29c4>
    48b0:	b65fe06f          	j	3414 <_vfprintf_r+0x1524>
    48b4:	00812583          	lw	a1,8(sp)
    48b8:	0a010613          	add	a2,sp,160
    48bc:	00098513          	mv	a0,s3
    48c0:	03d12023          	sw	t4,32(sp)
    48c4:	4e8000ef          	jal	4dac <__sprint_r>
    48c8:	00050463          	beqz	a0,48d0 <_vfprintf_r+0x29e0>
    48cc:	af5fd06f          	j	23c0 <_vfprintf_r+0x4d0>
    48d0:	0a812483          	lw	s1,168(sp)
    48d4:	0a412703          	lw	a4,164(sp)
    48d8:	02012e83          	lw	t4,32(sp)
    48dc:	0ac10413          	add	s0,sp,172
    48e0:	b20ff06f          	j	3c00 <_vfprintf_r+0x1d10>
    48e4:	08a10693          	add	a3,sp,138
    48e8:	00061863          	bnez	a2,48f8 <_vfprintf_r+0x2a08>
    48ec:	03000693          	li	a3,48
    48f0:	08d10523          	sb	a3,138(sp)
    48f4:	08b10693          	add	a3,sp,139
    48f8:	15010793          	add	a5,sp,336
    48fc:	40f68633          	sub	a2,a3,a5
    4900:	030d0713          	add	a4,s10,48
    4904:	0c960793          	add	a5,a2,201
    4908:	00e68023          	sb	a4,0(a3)
    490c:	04f12023          	sw	a5,64(sp)
    4910:	d5cff06f          	j	3e6c <_vfprintf_r+0x1f7c>
    4914:	001ef713          	and	a4,t4,1
    4918:	d6070863          	beqz	a4,3e88 <_vfprintf_r+0x1f98>
    491c:	d64ff06f          	j	3e80 <_vfprintf_r+0x1f90>
    4920:	00812783          	lw	a5,8(sp)
    4924:	00000293          	li	t0,0
    4928:	00c79783          	lh	a5,12(a5)
    492c:	0407e793          	or	a5,a5,64
    4930:	00812703          	lw	a4,8(sp)
    4934:	00f71623          	sh	a5,12(a4)
    4938:	a8dfd06f          	j	23c4 <_vfprintf_r+0x4d4>
    493c:	00012823          	sw	zero,16(sp)
    4940:	00600313          	li	t1,6
    4944:	ff9fe06f          	j	393c <_vfprintf_r+0x1a4c>
    4948:	06700e13          	li	t3,103
    494c:	03c12783          	lw	a5,60(sp)
    4950:	0ff00613          	li	a2,255
    4954:	0007c703          	lbu	a4,0(a5)
    4958:	22c70263          	beq	a4,a2,4b7c <_vfprintf_r+0x2c8c>
    495c:	00000593          	li	a1,0
    4960:	00000693          	li	a3,0
    4964:	01475e63          	bge	a4,s4,4980 <_vfprintf_r+0x2a90>
    4968:	40ea0a33          	sub	s4,s4,a4
    496c:	0017c703          	lbu	a4,1(a5)
    4970:	04070863          	beqz	a4,49c0 <_vfprintf_r+0x2ad0>
    4974:	00168693          	add	a3,a3,1
    4978:	00178793          	add	a5,a5,1
    497c:	fec714e3          	bne	a4,a2,4964 <_vfprintf_r+0x2a74>
    4980:	02f12e23          	sw	a5,60(sp)
    4984:	02d12023          	sw	a3,32(sp)
    4988:	02b12223          	sw	a1,36(sp)
    498c:	02012783          	lw	a5,32(sp)
    4990:	02412703          	lw	a4,36(sp)
    4994:	04c12583          	lw	a1,76(sp)
    4998:	05c12823          	sw	t3,80(sp)
    499c:	00e78533          	add	a0,a5,a4
    49a0:	3a80a0ef          	jal	ed48 <__mulsi3>
    49a4:	01a50d33          	add	s10,a0,s10
    49a8:	fffd4813          	not	a6,s10
    49ac:	41f85813          	sra	a6,a6,0x1f
    49b0:	05012e03          	lw	t3,80(sp)
    49b4:	010d7cb3          	and	s9,s10,a6
    49b8:	000b0e93          	mv	t4,s6
    49bc:	cecff06f          	j	3ea8 <_vfprintf_r+0x1fb8>
    49c0:	0007c703          	lbu	a4,0(a5)
    49c4:	00158593          	add	a1,a1,1
    49c8:	fb5ff06f          	j	497c <_vfprintf_r+0x2a8c>
    49cc:	03012783          	lw	a5,48(sp)
    49d0:	06600e13          	li	t3,102
    49d4:	00f306b3          	add	a3,t1,a5
    49d8:	01468d33          	add	s10,a3,s4
    49dc:	d99ff06f          	j	4774 <_vfprintf_r+0x2884>
    49e0:	02c12783          	lw	a5,44(sp)
    49e4:	0a07c863          	bltz	a5,4a94 <_vfprintf_r+0x2ba4>
    49e8:	07714603          	lbu	a2,119(sp)
    49ec:	04700713          	li	a4,71
    49f0:	0000ac17          	auipc	s8,0xa
    49f4:	6f0c0c13          	add	s8,s8,1776 # f0e0 <__fini_array_end+0x1a0>
    49f8:	01c75463          	bge	a4,t3,4a00 <_vfprintf_r+0x2b10>
    49fc:	b31fd06f          	j	252c <_vfprintf_r+0x63c>
    4a00:	0000ac17          	auipc	s8,0xa
    4a04:	6dcc0c13          	add	s8,s8,1756 # f0dc <__fini_array_end+0x19c>
    4a08:	b25fd06f          	j	252c <_vfprintf_r+0x63c>
    4a0c:	07714603          	lbu	a2,119(sp)
    4a10:	01612a23          	sw	s6,20(sp)
    4a14:	02012223          	sw	zero,36(sp)
    4a18:	02012023          	sw	zero,32(sp)
    4a1c:	00030c93          	mv	s9,t1
    4a20:	00030d13          	mv	s10,t1
    4a24:	07300e13          	li	t3,115
    4a28:	00000313          	li	t1,0
    4a2c:	00061463          	bnez	a2,4a34 <_vfprintf_r+0x2b44>
    4a30:	f00fd06f          	j	2130 <_vfprintf_r+0x240>
    4a34:	b1dfd06f          	j	2550 <_vfprintf_r+0x660>
    4a38:	00040313          	mv	t1,s0
    4a3c:	01012903          	lw	s2,16(sp)
    4a40:	000b0413          	mv	s0,s6
    4a44:	01412e03          	lw	t3,20(sp)
    4a48:	000c0b13          	mv	s6,s8
    4a4c:	000a0e93          	mv	t4,s4
    4a50:	000c8c13          	mv	s8,s9
    4a54:	00030d13          	mv	s10,t1
    4a58:	87cff06f          	j	3ad4 <_vfprintf_r+0x1be4>
    4a5c:	001b0793          	add	a5,s6,1
    4a60:	000c0993          	mv	s3,s8
    4a64:	02412903          	lw	s2,36(sp)
    4a68:	04012e83          	lw	t4,64(sp)
    4a6c:	05012e03          	lw	t3,80(sp)
    4a70:	05412403          	lw	s0,84(sp)
    4a74:	000d0c13          	mv	s8,s10
    4a78:	00f487b3          	add	a5,s1,a5
    4a7c:	03000693          	li	a3,48
    4a80:	840b40e3          	bltz	s6,42c0 <_vfprintf_r+0x23d0>
    4a84:	00148493          	add	s1,s1,1
    4a88:	fed48fa3          	sb	a3,-1(s1)
    4a8c:	fe979ce3          	bne	a5,s1,4a84 <_vfprintf_r+0x2b94>
    4a90:	835ff06f          	j	42c4 <_vfprintf_r+0x23d4>
    4a94:	02d00793          	li	a5,45
    4a98:	06f10ba3          	sb	a5,119(sp)
    4a9c:	02d00613          	li	a2,45
    4aa0:	f4dff06f          	j	49ec <_vfprintf_r+0x2afc>
    4aa4:	00100693          	li	a3,1
    4aa8:	414686b3          	sub	a3,a3,s4
    4aac:	06d12e23          	sw	a3,124(sp)
    4ab0:	da4ff06f          	j	4054 <_vfprintf_r+0x2164>
    4ab4:	01412783          	lw	a5,20(sp)
    4ab8:	0007ab03          	lw	s6,0(a5)
    4abc:	00478793          	add	a5,a5,4
    4ac0:	000b5463          	bgez	s6,4ac8 <_vfprintf_r+0x2bd8>
    4ac4:	fff00b13          	li	s6,-1
    4ac8:	00194e03          	lbu	t3,1(s2)
    4acc:	00f12a23          	sw	a5,20(sp)
    4ad0:	00068913          	mv	s2,a3
    4ad4:	dccfd06f          	j	20a0 <_vfprintf_r+0x1b0>
    4ad8:	00071a63          	bnez	a4,4aec <_vfprintf_r+0x2bfc>
    4adc:	00100c93          	li	s9,1
    4ae0:	06600e13          	li	t3,102
    4ae4:	00100d13          	li	s10,1
    4ae8:	879ff06f          	j	4360 <_vfprintf_r+0x2470>
    4aec:	03012783          	lw	a5,48(sp)
    4af0:	06600e13          	li	t3,102
    4af4:	00178693          	add	a3,a5,1
    4af8:	00668d33          	add	s10,a3,t1
    4afc:	fffd4813          	not	a6,s10
    4b00:	41f85813          	sra	a6,a6,0x1f
    4b04:	010d7cb3          	and	s9,s10,a6
    4b08:	859ff06f          	j	4360 <_vfprintf_r+0x2470>
    4b0c:	00200793          	li	a5,2
    4b10:	04f12023          	sw	a5,64(sp)
    4b14:	b58ff06f          	j	3e6c <_vfprintf_r+0x1f7c>
    4b18:	00812703          	lw	a4,8(sp)
    4b1c:	00c71783          	lh	a5,12(a4)
    4b20:	0407e793          	or	a5,a5,64
    4b24:	00f71623          	sh	a5,12(a4)
    4b28:	8b5fd06f          	j	23dc <_vfprintf_r+0x4ec>
    4b2c:	000a0513          	mv	a0,s4
    4b30:	000d0593          	mv	a1,s10
    4b34:	00030613          	mv	a2,t1
    4b38:	00038693          	mv	a3,t2
    4b3c:	05012023          	sw	a6,64(sp)
    4b40:	03c12223          	sw	t3,36(sp)
    4b44:	01d12c23          	sw	t4,24(sp)
    4b48:	0a5080ef          	jal	d3ec <__eqdf2>
    4b4c:	01812e83          	lw	t4,24(sp)
    4b50:	02412e03          	lw	t3,36(sp)
    4b54:	04012803          	lw	a6,64(sp)
    4b58:	f6051463          	bnez	a0,42c0 <_vfprintf_r+0x23d0>
    4b5c:	001b7693          	and	a3,s6,1
    4b60:	f6068063          	beqz	a3,42c0 <_vfprintf_r+0x23d0>
    4b64:	f14ff06f          	j	4278 <_vfprintf_r+0x2388>
    4b68:	00812783          	lw	a5,8(sp)
    4b6c:	01012283          	lw	t0,16(sp)
    4b70:	00c79783          	lh	a5,12(a5)
    4b74:	0407e793          	or	a5,a5,64
    4b78:	db9ff06f          	j	4930 <_vfprintf_r+0x2a40>
    4b7c:	02012223          	sw	zero,36(sp)
    4b80:	02012023          	sw	zero,32(sp)
    4b84:	e09ff06f          	j	498c <_vfprintf_r+0x2a9c>
    4b88:	04500d13          	li	s10,69
    4b8c:	cccff06f          	j	4058 <_vfprintf_r+0x2168>

00004b90 <__sbprintf>:
    4b90:	b7010113          	add	sp,sp,-1168
    4b94:	00c59783          	lh	a5,12(a1)
    4b98:	00e5d703          	lhu	a4,14(a1)
    4b9c:	48812423          	sw	s0,1160(sp)
    4ba0:	00058413          	mv	s0,a1
    4ba4:	000105b7          	lui	a1,0x10
    4ba8:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x645>
    4bac:	06442303          	lw	t1,100(s0)
    4bb0:	01c42883          	lw	a7,28(s0)
    4bb4:	02442803          	lw	a6,36(s0)
    4bb8:	01071713          	sll	a4,a4,0x10
    4bbc:	00b7f7b3          	and	a5,a5,a1
    4bc0:	00e7e7b3          	or	a5,a5,a4
    4bc4:	40000593          	li	a1,1024
    4bc8:	49212023          	sw	s2,1152(sp)
    4bcc:	00f12a23          	sw	a5,20(sp)
    4bd0:	00050913          	mv	s2,a0
    4bd4:	07010793          	add	a5,sp,112
    4bd8:	06010513          	add	a0,sp,96
    4bdc:	48112623          	sw	ra,1164(sp)
    4be0:	48912223          	sw	s1,1156(sp)
    4be4:	47312e23          	sw	s3,1148(sp)
    4be8:	00060493          	mv	s1,a2
    4bec:	00068993          	mv	s3,a3
    4bf0:	06612623          	sw	t1,108(sp)
    4bf4:	03112223          	sw	a7,36(sp)
    4bf8:	03012623          	sw	a6,44(sp)
    4bfc:	00f12423          	sw	a5,8(sp)
    4c00:	00f12c23          	sw	a5,24(sp)
    4c04:	00b12823          	sw	a1,16(sp)
    4c08:	00b12e23          	sw	a1,28(sp)
    4c0c:	02012023          	sw	zero,32(sp)
    4c10:	b7cfc0ef          	jal	f8c <__retarget_lock_init_recursive>
    4c14:	00048613          	mv	a2,s1
    4c18:	00098693          	mv	a3,s3
    4c1c:	00810593          	add	a1,sp,8
    4c20:	00090513          	mv	a0,s2
    4c24:	accfd0ef          	jal	1ef0 <_vfprintf_r>
    4c28:	00050493          	mv	s1,a0
    4c2c:	04055263          	bgez	a0,4c70 <__sbprintf+0xe0>
    4c30:	01415783          	lhu	a5,20(sp)
    4c34:	0407f793          	and	a5,a5,64
    4c38:	00078863          	beqz	a5,4c48 <__sbprintf+0xb8>
    4c3c:	00c45783          	lhu	a5,12(s0)
    4c40:	0407e793          	or	a5,a5,64
    4c44:	00f41623          	sh	a5,12(s0)
    4c48:	06012503          	lw	a0,96(sp)
    4c4c:	b44fc0ef          	jal	f90 <__retarget_lock_close_recursive>
    4c50:	48c12083          	lw	ra,1164(sp)
    4c54:	48812403          	lw	s0,1160(sp)
    4c58:	48012903          	lw	s2,1152(sp)
    4c5c:	47c12983          	lw	s3,1148(sp)
    4c60:	00048513          	mv	a0,s1
    4c64:	48412483          	lw	s1,1156(sp)
    4c68:	49010113          	add	sp,sp,1168
    4c6c:	00008067          	ret
    4c70:	00810593          	add	a1,sp,8
    4c74:	00090513          	mv	a0,s2
    4c78:	449010ef          	jal	68c0 <_fflush_r>
    4c7c:	fa050ae3          	beqz	a0,4c30 <__sbprintf+0xa0>
    4c80:	fff00493          	li	s1,-1
    4c84:	fadff06f          	j	4c30 <__sbprintf+0xa0>

00004c88 <__sprint_r.part.0>:
    4c88:	0645a783          	lw	a5,100(a1)
    4c8c:	fd010113          	add	sp,sp,-48
    4c90:	01612823          	sw	s6,16(sp)
    4c94:	02112623          	sw	ra,44(sp)
    4c98:	01279713          	sll	a4,a5,0x12
    4c9c:	00060b13          	mv	s6,a2
    4ca0:	0e075863          	bgez	a4,4d90 <__sprint_r.part.0+0x108>
    4ca4:	00862783          	lw	a5,8(a2)
    4ca8:	03212023          	sw	s2,32(sp)
    4cac:	01312e23          	sw	s3,28(sp)
    4cb0:	01512a23          	sw	s5,20(sp)
    4cb4:	01712623          	sw	s7,12(sp)
    4cb8:	00058913          	mv	s2,a1
    4cbc:	00062b83          	lw	s7,0(a2)
    4cc0:	00050993          	mv	s3,a0
    4cc4:	fff00a93          	li	s5,-1
    4cc8:	0a078863          	beqz	a5,4d78 <__sprint_r.part.0+0xf0>
    4ccc:	02812423          	sw	s0,40(sp)
    4cd0:	02912223          	sw	s1,36(sp)
    4cd4:	01412c23          	sw	s4,24(sp)
    4cd8:	01812423          	sw	s8,8(sp)
    4cdc:	004bac03          	lw	s8,4(s7)
    4ce0:	000ba403          	lw	s0,0(s7)
    4ce4:	002c5a13          	srl	s4,s8,0x2
    4ce8:	060a0663          	beqz	s4,4d54 <__sprint_r.part.0+0xcc>
    4cec:	00000493          	li	s1,0
    4cf0:	00c0006f          	j	4cfc <__sprint_r.part.0+0x74>
    4cf4:	00440413          	add	s0,s0,4
    4cf8:	049a0c63          	beq	s4,s1,4d50 <__sprint_r.part.0+0xc8>
    4cfc:	00042583          	lw	a1,0(s0)
    4d00:	00090613          	mv	a2,s2
    4d04:	00098513          	mv	a0,s3
    4d08:	399020ef          	jal	78a0 <_fputwc_r>
    4d0c:	00148493          	add	s1,s1,1
    4d10:	ff5512e3          	bne	a0,s5,4cf4 <__sprint_r.part.0+0x6c>
    4d14:	02812403          	lw	s0,40(sp)
    4d18:	02412483          	lw	s1,36(sp)
    4d1c:	02012903          	lw	s2,32(sp)
    4d20:	01c12983          	lw	s3,28(sp)
    4d24:	01812a03          	lw	s4,24(sp)
    4d28:	01412a83          	lw	s5,20(sp)
    4d2c:	00c12b83          	lw	s7,12(sp)
    4d30:	00812c03          	lw	s8,8(sp)
    4d34:	fff00513          	li	a0,-1
    4d38:	02c12083          	lw	ra,44(sp)
    4d3c:	000b2423          	sw	zero,8(s6)
    4d40:	000b2223          	sw	zero,4(s6)
    4d44:	01012b03          	lw	s6,16(sp)
    4d48:	03010113          	add	sp,sp,48
    4d4c:	00008067          	ret
    4d50:	008b2783          	lw	a5,8(s6)
    4d54:	ffcc7c13          	and	s8,s8,-4
    4d58:	418787b3          	sub	a5,a5,s8
    4d5c:	00fb2423          	sw	a5,8(s6)
    4d60:	008b8b93          	add	s7,s7,8
    4d64:	f6079ce3          	bnez	a5,4cdc <__sprint_r.part.0+0x54>
    4d68:	02812403          	lw	s0,40(sp)
    4d6c:	02412483          	lw	s1,36(sp)
    4d70:	01812a03          	lw	s4,24(sp)
    4d74:	00812c03          	lw	s8,8(sp)
    4d78:	02012903          	lw	s2,32(sp)
    4d7c:	01c12983          	lw	s3,28(sp)
    4d80:	01412a83          	lw	s5,20(sp)
    4d84:	00c12b83          	lw	s7,12(sp)
    4d88:	00000513          	li	a0,0
    4d8c:	fadff06f          	j	4d38 <__sprint_r.part.0+0xb0>
    4d90:	6b5010ef          	jal	6c44 <__sfvwrite_r>
    4d94:	02c12083          	lw	ra,44(sp)
    4d98:	000b2423          	sw	zero,8(s6)
    4d9c:	000b2223          	sw	zero,4(s6)
    4da0:	01012b03          	lw	s6,16(sp)
    4da4:	03010113          	add	sp,sp,48
    4da8:	00008067          	ret

00004dac <__sprint_r>:
    4dac:	00862703          	lw	a4,8(a2)
    4db0:	00070463          	beqz	a4,4db8 <__sprint_r+0xc>
    4db4:	ed5ff06f          	j	4c88 <__sprint_r.part.0>
    4db8:	00062223          	sw	zero,4(a2)
    4dbc:	00000513          	li	a0,0
    4dc0:	00008067          	ret

00004dc4 <_vfiprintf_r>:
    4dc4:	eb010113          	add	sp,sp,-336
    4dc8:	14812423          	sw	s0,328(sp)
    4dcc:	13312e23          	sw	s3,316(sp)
    4dd0:	13812423          	sw	s8,296(sp)
    4dd4:	00050413          	mv	s0,a0
    4dd8:	00058993          	mv	s3,a1
    4ddc:	00060c13          	mv	s8,a2
    4de0:	00000593          	li	a1,0
    4de4:	00800613          	li	a2,8
    4de8:	05010513          	add	a0,sp,80
    4dec:	13512a23          	sw	s5,308(sp)
    4df0:	14112623          	sw	ra,332(sp)
    4df4:	00068a93          	mv	s5,a3
    4df8:	9a4fc0ef          	jal	f9c <memset>
    4dfc:	00040863          	beqz	s0,4e0c <_vfiprintf_r+0x48>
    4e00:	03442783          	lw	a5,52(s0)
    4e04:	00079463          	bnez	a5,4e0c <_vfiprintf_r+0x48>
    4e08:	49c0106f          	j	62a4 <_vfiprintf_r+0x14e0>
    4e0c:	0649a703          	lw	a4,100(s3)
    4e10:	00c99783          	lh	a5,12(s3)
    4e14:	00177713          	and	a4,a4,1
    4e18:	00071863          	bnez	a4,4e28 <_vfiprintf_r+0x64>
    4e1c:	2007f713          	and	a4,a5,512
    4e20:	00071463          	bnez	a4,4e28 <_vfiprintf_r+0x64>
    4e24:	0b80106f          	j	5edc <_vfiprintf_r+0x1118>
    4e28:	01279713          	sll	a4,a5,0x12
    4e2c:	02074663          	bltz	a4,4e58 <_vfiprintf_r+0x94>
    4e30:	0649a703          	lw	a4,100(s3)
    4e34:	00002637          	lui	a2,0x2
    4e38:	ffffe6b7          	lui	a3,0xffffe
    4e3c:	00c7e7b3          	or	a5,a5,a2
    4e40:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4e44:	01079793          	sll	a5,a5,0x10
    4e48:	4107d793          	sra	a5,a5,0x10
    4e4c:	00d77733          	and	a4,a4,a3
    4e50:	00f99623          	sh	a5,12(s3)
    4e54:	06e9a223          	sw	a4,100(s3)
    4e58:	0087f713          	and	a4,a5,8
    4e5c:	2e070463          	beqz	a4,5144 <_vfiprintf_r+0x380>
    4e60:	0109a703          	lw	a4,16(s3)
    4e64:	2e070063          	beqz	a4,5144 <_vfiprintf_r+0x380>
    4e68:	01a7f713          	and	a4,a5,26
    4e6c:	00a00693          	li	a3,10
    4e70:	2ed70c63          	beq	a4,a3,5168 <_vfiprintf_r+0x3a4>
    4e74:	13412c23          	sw	s4,312(sp)
    4e78:	06c10a13          	add	s4,sp,108
    4e7c:	14912223          	sw	s1,324(sp)
    4e80:	15212023          	sw	s2,320(sp)
    4e84:	13612823          	sw	s6,304(sp)
    4e88:	13712623          	sw	s7,300(sp)
    4e8c:	13912223          	sw	s9,292(sp)
    4e90:	13a12023          	sw	s10,288(sp)
    4e94:	000c0c93          	mv	s9,s8
    4e98:	11b12e23          	sw	s11,284(sp)
    4e9c:	07412023          	sw	s4,96(sp)
    4ea0:	06012423          	sw	zero,104(sp)
    4ea4:	06012223          	sw	zero,100(sp)
    4ea8:	00012a23          	sw	zero,20(sp)
    4eac:	02012623          	sw	zero,44(sp)
    4eb0:	02012823          	sw	zero,48(sp)
    4eb4:	02012a23          	sw	zero,52(sp)
    4eb8:	00012623          	sw	zero,12(sp)
    4ebc:	7fffb497          	auipc	s1,0x7fffb
    4ec0:	67848493          	add	s1,s1,1656 # 80000534 <__global_locale>
    4ec4:	02500913          	li	s2,37
    4ec8:	0000ab97          	auipc	s7,0xa
    4ecc:	724b8b93          	add	s7,s7,1828 # f5ec <blanks.1+0x10>
    4ed0:	0000bb17          	auipc	s6,0xb
    4ed4:	888b0b13          	add	s6,s6,-1912 # f758 <zeroes.0>
    4ed8:	000a0c13          	mv	s8,s4
    4edc:	000c8d93          	mv	s11,s9
    4ee0:	0e44ad03          	lw	s10,228(s1)
    4ee4:	3f9020ef          	jal	7adc <__locale_mb_cur_max>
    4ee8:	00050693          	mv	a3,a0
    4eec:	05010713          	add	a4,sp,80
    4ef0:	000d8613          	mv	a2,s11
    4ef4:	04810593          	add	a1,sp,72
    4ef8:	00040513          	mv	a0,s0
    4efc:	000d00e7          	jalr	s10
    4f00:	2e050e63          	beqz	a0,51fc <_vfiprintf_r+0x438>
    4f04:	2c054e63          	bltz	a0,51e0 <_vfiprintf_r+0x41c>
    4f08:	04812783          	lw	a5,72(sp)
    4f0c:	01278663          	beq	a5,s2,4f18 <_vfiprintf_r+0x154>
    4f10:	00ad8db3          	add	s11,s11,a0
    4f14:	fcdff06f          	j	4ee0 <_vfiprintf_r+0x11c>
    4f18:	00050d13          	mv	s10,a0
    4f1c:	419d87b3          	sub	a5,s11,s9
    4f20:	2f9d9463          	bne	s11,s9,5208 <_vfiprintf_r+0x444>
    4f24:	00000e13          	li	t3,0
    4f28:	001dc683          	lbu	a3,1(s11)
    4f2c:	001d8c93          	add	s9,s11,1
    4f30:	040101a3          	sb	zero,67(sp)
    4f34:	fff00713          	li	a4,-1
    4f38:	00000893          	li	a7,0
    4f3c:	05a00d13          	li	s10,90
    4f40:	000e0d93          	mv	s11,t3
    4f44:	001c8c93          	add	s9,s9,1
    4f48:	fe068793          	add	a5,a3,-32
    4f4c:	04fd6663          	bltu	s10,a5,4f98 <_vfiprintf_r+0x1d4>
    4f50:	00279793          	sll	a5,a5,0x2
    4f54:	017787b3          	add	a5,a5,s7
    4f58:	0007a783          	lw	a5,0(a5)
    4f5c:	017787b3          	add	a5,a5,s7
    4f60:	00078067          	jr	a5
    4f64:	00000893          	li	a7,0
    4f68:	fd068793          	add	a5,a3,-48
    4f6c:	00900593          	li	a1,9
    4f70:	000cc683          	lbu	a3,0(s9)
    4f74:	00289613          	sll	a2,a7,0x2
    4f78:	011608b3          	add	a7,a2,a7
    4f7c:	00189893          	sll	a7,a7,0x1
    4f80:	011788b3          	add	a7,a5,a7
    4f84:	fd068793          	add	a5,a3,-48
    4f88:	001c8c93          	add	s9,s9,1
    4f8c:	fef5f2e3          	bgeu	a1,a5,4f70 <_vfiprintf_r+0x1ac>
    4f90:	fe068793          	add	a5,a3,-32
    4f94:	fafd7ee3          	bgeu	s10,a5,4f50 <_vfiprintf_r+0x18c>
    4f98:	000d8e13          	mv	t3,s11
    4f9c:	2c068663          	beqz	a3,5268 <_vfiprintf_r+0x4a4>
    4fa0:	0ad10623          	sb	a3,172(sp)
    4fa4:	040101a3          	sb	zero,67(sp)
    4fa8:	00100e93          	li	t4,1
    4fac:	00100d13          	li	s10,1
    4fb0:	0ac10813          	add	a6,sp,172
    4fb4:	00012823          	sw	zero,16(sp)
    4fb8:	00000713          	li	a4,0
    4fbc:	00000f93          	li	t6,0
    4fc0:	06412603          	lw	a2,100(sp)
    4fc4:	084e7293          	and	t0,t3,132
    4fc8:	06812783          	lw	a5,104(sp)
    4fcc:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x111>
    4fd0:	00058f13          	mv	t5,a1
    4fd4:	00029663          	bnez	t0,4fe0 <_vfiprintf_r+0x21c>
    4fd8:	41d88db3          	sub	s11,a7,t4
    4fdc:	47b046e3          	bgtz	s11,5c48 <_vfiprintf_r+0xe84>
    4fe0:	04314583          	lbu	a1,67(sp)
    4fe4:	02058a63          	beqz	a1,5018 <_vfiprintf_r+0x254>
    4fe8:	04310613          	add	a2,sp,67
    4fec:	00178793          	add	a5,a5,1
    4ff0:	00100693          	li	a3,1
    4ff4:	00cc2023          	sw	a2,0(s8)
    4ff8:	00dc2223          	sw	a3,4(s8)
    4ffc:	06f12423          	sw	a5,104(sp)
    5000:	07e12223          	sw	t5,100(sp)
    5004:	00700613          	li	a2,7
    5008:	35e64ce3          	blt	a2,t5,5b60 <_vfiprintf_r+0xd9c>
    500c:	000f0613          	mv	a2,t5
    5010:	008c0c13          	add	s8,s8,8
    5014:	001f0f13          	add	t5,t5,1
    5018:	080f8063          	beqz	t6,5098 <_vfiprintf_r+0x2d4>
    501c:	00200613          	li	a2,2
    5020:	00278793          	add	a5,a5,2
    5024:	04410693          	add	a3,sp,68
    5028:	00cc2223          	sw	a2,4(s8)
    502c:	00dc2023          	sw	a3,0(s8)
    5030:	06f12423          	sw	a5,104(sp)
    5034:	07e12223          	sw	t5,100(sp)
    5038:	00700613          	li	a2,7
    503c:	3be652e3          	bge	a2,t5,5be0 <_vfiprintf_r+0xe1c>
    5040:	60078ae3          	beqz	a5,5e54 <_vfiprintf_r+0x1090>
    5044:	06010613          	add	a2,sp,96
    5048:	00098593          	mv	a1,s3
    504c:	00040513          	mv	a0,s0
    5050:	03d12c23          	sw	t4,56(sp)
    5054:	02e12423          	sw	a4,40(sp)
    5058:	03112223          	sw	a7,36(sp)
    505c:	03012023          	sw	a6,32(sp)
    5060:	00512e23          	sw	t0,28(sp)
    5064:	01c12c23          	sw	t3,24(sp)
    5068:	c21ff0ef          	jal	4c88 <__sprint_r.part.0>
    506c:	22051463          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    5070:	06412603          	lw	a2,100(sp)
    5074:	06812783          	lw	a5,104(sp)
    5078:	03812e83          	lw	t4,56(sp)
    507c:	02812703          	lw	a4,40(sp)
    5080:	02412883          	lw	a7,36(sp)
    5084:	02012803          	lw	a6,32(sp)
    5088:	01c12283          	lw	t0,28(sp)
    508c:	01812e03          	lw	t3,24(sp)
    5090:	000a0c13          	mv	s8,s4
    5094:	00160f13          	add	t5,a2,1
    5098:	08000593          	li	a1,128
    509c:	06b286e3          	beq	t0,a1,5908 <_vfiprintf_r+0xb44>
    50a0:	41a70733          	sub	a4,a4,s10
    50a4:	1ae04ae3          	bgtz	a4,5a58 <_vfiprintf_r+0xc94>
    50a8:	00fd07b3          	add	a5,s10,a5
    50ac:	010c2023          	sw	a6,0(s8)
    50b0:	01ac2223          	sw	s10,4(s8)
    50b4:	06f12423          	sw	a5,104(sp)
    50b8:	07e12223          	sw	t5,100(sp)
    50bc:	00700713          	li	a4,7
    50c0:	03e758e3          	bge	a4,t5,58f0 <_vfiprintf_r+0xb2c>
    50c4:	24078063          	beqz	a5,5304 <_vfiprintf_r+0x540>
    50c8:	06010613          	add	a2,sp,96
    50cc:	00098593          	mv	a1,s3
    50d0:	00040513          	mv	a0,s0
    50d4:	03d12023          	sw	t4,32(sp)
    50d8:	01112e23          	sw	a7,28(sp)
    50dc:	01c12c23          	sw	t3,24(sp)
    50e0:	ba9ff0ef          	jal	4c88 <__sprint_r.part.0>
    50e4:	1a051863          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    50e8:	06812783          	lw	a5,104(sp)
    50ec:	02012e83          	lw	t4,32(sp)
    50f0:	01c12883          	lw	a7,28(sp)
    50f4:	01812e03          	lw	t3,24(sp)
    50f8:	000a0c13          	mv	s8,s4
    50fc:	004e7e13          	and	t3,t3,4
    5100:	000e0663          	beqz	t3,510c <_vfiprintf_r+0x348>
    5104:	41d88db3          	sub	s11,a7,t4
    5108:	21b04a63          	bgtz	s11,531c <_vfiprintf_r+0x558>
    510c:	01d8d463          	bge	a7,t4,5114 <_vfiprintf_r+0x350>
    5110:	000e8893          	mv	a7,t4
    5114:	00c12703          	lw	a4,12(sp)
    5118:	01170733          	add	a4,a4,a7
    511c:	00e12623          	sw	a4,12(sp)
    5120:	16079063          	bnez	a5,5280 <_vfiprintf_r+0x4bc>
    5124:	01012783          	lw	a5,16(sp)
    5128:	06012223          	sw	zero,100(sp)
    512c:	00078863          	beqz	a5,513c <_vfiprintf_r+0x378>
    5130:	00078593          	mv	a1,a5
    5134:	00040513          	mv	a0,s0
    5138:	ab4fc0ef          	jal	13ec <_free_r>
    513c:	000a0c13          	mv	s8,s4
    5140:	d9dff06f          	j	4edc <_vfiprintf_r+0x118>
    5144:	00098593          	mv	a1,s3
    5148:	00040513          	mv	a0,s0
    514c:	4b0020ef          	jal	75fc <__swsetup_r>
    5150:	00050463          	beqz	a0,5158 <_vfiprintf_r+0x394>
    5154:	3840106f          	j	64d8 <_vfiprintf_r+0x1714>
    5158:	00c99783          	lh	a5,12(s3)
    515c:	00a00693          	li	a3,10
    5160:	01a7f713          	and	a4,a5,26
    5164:	d0d718e3          	bne	a4,a3,4e74 <_vfiprintf_r+0xb0>
    5168:	00e99703          	lh	a4,14(s3)
    516c:	d00744e3          	bltz	a4,4e74 <_vfiprintf_r+0xb0>
    5170:	0649a703          	lw	a4,100(s3)
    5174:	00177713          	and	a4,a4,1
    5178:	00071863          	bnez	a4,5188 <_vfiprintf_r+0x3c4>
    517c:	2007f793          	and	a5,a5,512
    5180:	00079463          	bnez	a5,5188 <_vfiprintf_r+0x3c4>
    5184:	2ac0106f          	j	6430 <_vfiprintf_r+0x166c>
    5188:	000a8693          	mv	a3,s5
    518c:	000c0613          	mv	a2,s8
    5190:	00098593          	mv	a1,s3
    5194:	00040513          	mv	a0,s0
    5198:	3e4010ef          	jal	657c <__sbprintf>
    519c:	14c12083          	lw	ra,332(sp)
    51a0:	14812403          	lw	s0,328(sp)
    51a4:	00a12623          	sw	a0,12(sp)
    51a8:	00c12503          	lw	a0,12(sp)
    51ac:	13c12983          	lw	s3,316(sp)
    51b0:	13412a83          	lw	s5,308(sp)
    51b4:	12812c03          	lw	s8,296(sp)
    51b8:	15010113          	add	sp,sp,336
    51bc:	00008067          	ret
    51c0:	000aa883          	lw	a7,0(s5)
    51c4:	004a8a93          	add	s5,s5,4
    51c8:	3608cc63          	bltz	a7,5540 <_vfiprintf_r+0x77c>
    51cc:	000cc683          	lbu	a3,0(s9)
    51d0:	d75ff06f          	j	4f44 <_vfiprintf_r+0x180>
    51d4:	000cc683          	lbu	a3,0(s9)
    51d8:	020ded93          	or	s11,s11,32
    51dc:	d69ff06f          	j	4f44 <_vfiprintf_r+0x180>
    51e0:	00800613          	li	a2,8
    51e4:	00000593          	li	a1,0
    51e8:	05010513          	add	a0,sp,80
    51ec:	db1fb0ef          	jal	f9c <memset>
    51f0:	00100513          	li	a0,1
    51f4:	00ad8db3          	add	s11,s11,a0
    51f8:	ce9ff06f          	j	4ee0 <_vfiprintf_r+0x11c>
    51fc:	00050d13          	mv	s10,a0
    5200:	419d87b3          	sub	a5,s11,s9
    5204:	079d8263          	beq	s11,s9,5268 <_vfiprintf_r+0x4a4>
    5208:	06812683          	lw	a3,104(sp)
    520c:	06412703          	lw	a4,100(sp)
    5210:	019c2023          	sw	s9,0(s8)
    5214:	00d786b3          	add	a3,a5,a3
    5218:	00170713          	add	a4,a4,1
    521c:	00fc2223          	sw	a5,4(s8)
    5220:	06d12423          	sw	a3,104(sp)
    5224:	06e12223          	sw	a4,100(sp)
    5228:	00700613          	li	a2,7
    522c:	008c0c13          	add	s8,s8,8
    5230:	02e65463          	bge	a2,a4,5258 <_vfiprintf_r+0x494>
    5234:	38068ce3          	beqz	a3,5dcc <_vfiprintf_r+0x1008>
    5238:	06010613          	add	a2,sp,96
    523c:	00098593          	mv	a1,s3
    5240:	00040513          	mv	a0,s0
    5244:	00f12823          	sw	a5,16(sp)
    5248:	a41ff0ef          	jal	4c88 <__sprint_r.part.0>
    524c:	01012783          	lw	a5,16(sp)
    5250:	04051c63          	bnez	a0,52a8 <_vfiprintf_r+0x4e4>
    5254:	000a0c13          	mv	s8,s4
    5258:	00c12703          	lw	a4,12(sp)
    525c:	00f707b3          	add	a5,a4,a5
    5260:	00f12623          	sw	a5,12(sp)
    5264:	cc0d10e3          	bnez	s10,4f24 <_vfiprintf_r+0x160>
    5268:	06812783          	lw	a5,104(sp)
    526c:	00078463          	beqz	a5,5274 <_vfiprintf_r+0x4b0>
    5270:	22c0106f          	j	649c <_vfiprintf_r+0x16d8>
    5274:	00c99783          	lh	a5,12(s3)
    5278:	06012223          	sw	zero,100(sp)
    527c:	0300006f          	j	52ac <_vfiprintf_r+0x4e8>
    5280:	06010613          	add	a2,sp,96
    5284:	00098593          	mv	a1,s3
    5288:	00040513          	mv	a0,s0
    528c:	9fdff0ef          	jal	4c88 <__sprint_r.part.0>
    5290:	e8050ae3          	beqz	a0,5124 <_vfiprintf_r+0x360>
    5294:	01012783          	lw	a5,16(sp)
    5298:	00078863          	beqz	a5,52a8 <_vfiprintf_r+0x4e4>
    529c:	01012583          	lw	a1,16(sp)
    52a0:	00040513          	mv	a0,s0
    52a4:	948fc0ef          	jal	13ec <_free_r>
    52a8:	00c99783          	lh	a5,12(s3)
    52ac:	0649a703          	lw	a4,100(s3)
    52b0:	00177713          	and	a4,a4,1
    52b4:	16070a63          	beqz	a4,5428 <_vfiprintf_r+0x664>
    52b8:	0407f793          	and	a5,a5,64
    52bc:	14412483          	lw	s1,324(sp)
    52c0:	14012903          	lw	s2,320(sp)
    52c4:	13812a03          	lw	s4,312(sp)
    52c8:	13012b03          	lw	s6,304(sp)
    52cc:	12c12b83          	lw	s7,300(sp)
    52d0:	12412c83          	lw	s9,292(sp)
    52d4:	12012d03          	lw	s10,288(sp)
    52d8:	11c12d83          	lw	s11,284(sp)
    52dc:	00078463          	beqz	a5,52e4 <_vfiprintf_r+0x520>
    52e0:	2180106f          	j	64f8 <_vfiprintf_r+0x1734>
    52e4:	14c12083          	lw	ra,332(sp)
    52e8:	14812403          	lw	s0,328(sp)
    52ec:	00c12503          	lw	a0,12(sp)
    52f0:	13c12983          	lw	s3,316(sp)
    52f4:	13412a83          	lw	s5,308(sp)
    52f8:	12812c03          	lw	s8,296(sp)
    52fc:	15010113          	add	sp,sp,336
    5300:	00008067          	ret
    5304:	06012223          	sw	zero,100(sp)
    5308:	004e7e13          	and	t3,t3,4
    530c:	240e0ee3          	beqz	t3,5d68 <_vfiprintf_r+0xfa4>
    5310:	41d88db3          	sub	s11,a7,t4
    5314:	25b05ae3          	blez	s11,5d68 <_vfiprintf_r+0xfa4>
    5318:	000a0c13          	mv	s8,s4
    531c:	01000713          	li	a4,16
    5320:	06412683          	lw	a3,100(sp)
    5324:	01b74463          	blt	a4,s11,532c <_vfiprintf_r+0x568>
    5328:	1900106f          	j	64b8 <_vfiprintf_r+0x16f4>
    532c:	000a8713          	mv	a4,s5
    5330:	0000a317          	auipc	t1,0xa
    5334:	43830313          	add	t1,t1,1080 # f768 <blanks.1>
    5338:	000c0593          	mv	a1,s8
    533c:	000d8a93          	mv	s5,s11
    5340:	01000813          	li	a6,16
    5344:	00700d13          	li	s10,7
    5348:	01112c23          	sw	a7,24(sp)
    534c:	01d12e23          	sw	t4,28(sp)
    5350:	00030c13          	mv	s8,t1
    5354:	00070d93          	mv	s11,a4
    5358:	0180006f          	j	5370 <_vfiprintf_r+0x5ac>
    535c:	00268613          	add	a2,a3,2
    5360:	00858593          	add	a1,a1,8
    5364:	00070693          	mv	a3,a4
    5368:	ff0a8a93          	add	s5,s5,-16
    536c:	05585a63          	bge	a6,s5,53c0 <_vfiprintf_r+0x5fc>
    5370:	01078793          	add	a5,a5,16
    5374:	00168713          	add	a4,a3,1
    5378:	0185a023          	sw	s8,0(a1)
    537c:	0105a223          	sw	a6,4(a1)
    5380:	06f12423          	sw	a5,104(sp)
    5384:	06e12223          	sw	a4,100(sp)
    5388:	fced5ae3          	bge	s10,a4,535c <_vfiprintf_r+0x598>
    538c:	56078663          	beqz	a5,58f8 <_vfiprintf_r+0xb34>
    5390:	06010613          	add	a2,sp,96
    5394:	00098593          	mv	a1,s3
    5398:	00040513          	mv	a0,s0
    539c:	8edff0ef          	jal	4c88 <__sprint_r.part.0>
    53a0:	ee051ae3          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    53a4:	06412683          	lw	a3,100(sp)
    53a8:	01000813          	li	a6,16
    53ac:	ff0a8a93          	add	s5,s5,-16
    53b0:	06812783          	lw	a5,104(sp)
    53b4:	000a0593          	mv	a1,s4
    53b8:	00168613          	add	a2,a3,1
    53bc:	fb584ae3          	blt	a6,s5,5370 <_vfiprintf_r+0x5ac>
    53c0:	01812883          	lw	a7,24(sp)
    53c4:	01c12e83          	lw	t4,28(sp)
    53c8:	000d8713          	mv	a4,s11
    53cc:	000c0313          	mv	t1,s8
    53d0:	000a8d93          	mv	s11,s5
    53d4:	00058c13          	mv	s8,a1
    53d8:	00070a93          	mv	s5,a4
    53dc:	01b787b3          	add	a5,a5,s11
    53e0:	006c2023          	sw	t1,0(s8)
    53e4:	01bc2223          	sw	s11,4(s8)
    53e8:	06f12423          	sw	a5,104(sp)
    53ec:	06c12223          	sw	a2,100(sp)
    53f0:	00700713          	li	a4,7
    53f4:	d0c75ce3          	bge	a4,a2,510c <_vfiprintf_r+0x348>
    53f8:	160788e3          	beqz	a5,5d68 <_vfiprintf_r+0xfa4>
    53fc:	06010613          	add	a2,sp,96
    5400:	00098593          	mv	a1,s3
    5404:	00040513          	mv	a0,s0
    5408:	01d12e23          	sw	t4,28(sp)
    540c:	01112c23          	sw	a7,24(sp)
    5410:	879ff0ef          	jal	4c88 <__sprint_r.part.0>
    5414:	e80510e3          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    5418:	06812783          	lw	a5,104(sp)
    541c:	01c12e83          	lw	t4,28(sp)
    5420:	01812883          	lw	a7,24(sp)
    5424:	ce9ff06f          	j	510c <_vfiprintf_r+0x348>
    5428:	2007f713          	and	a4,a5,512
    542c:	e80716e3          	bnez	a4,52b8 <_vfiprintf_r+0x4f4>
    5430:	0589a503          	lw	a0,88(s3)
    5434:	b65fb0ef          	jal	f98 <__retarget_lock_release_recursive>
    5438:	00c99783          	lh	a5,12(s3)
    543c:	e7dff06f          	j	52b8 <_vfiprintf_r+0x4f4>
    5440:	000aa803          	lw	a6,0(s5)
    5444:	040101a3          	sb	zero,67(sp)
    5448:	000d8e13          	mv	t3,s11
    544c:	004a8a93          	add	s5,s5,4
    5450:	68080ae3          	beqz	a6,62e4 <_vfiprintf_r+0x1520>
    5454:	05300793          	li	a5,83
    5458:	3cf68ce3          	beq	a3,a5,6030 <_vfiprintf_r+0x126c>
    545c:	010df793          	and	a5,s11,16
    5460:	3c0798e3          	bnez	a5,6030 <_vfiprintf_r+0x126c>
    5464:	00075463          	bgez	a4,546c <_vfiprintf_r+0x6a8>
    5468:	7fd0006f          	j	6464 <_vfiprintf_r+0x16a0>
    546c:	00070613          	mv	a2,a4
    5470:	00080513          	mv	a0,a6
    5474:	00000593          	li	a1,0
    5478:	03112223          	sw	a7,36(sp)
    547c:	00e12e23          	sw	a4,28(sp)
    5480:	01012c23          	sw	a6,24(sp)
    5484:	03b12023          	sw	s11,32(sp)
    5488:	4e4020ef          	jal	796c <memchr>
    548c:	00a12823          	sw	a0,16(sp)
    5490:	01812803          	lw	a6,24(sp)
    5494:	01c12703          	lw	a4,28(sp)
    5498:	02012e03          	lw	t3,32(sp)
    549c:	02412883          	lw	a7,36(sp)
    54a0:	00051463          	bnez	a0,54a8 <_vfiprintf_r+0x6e4>
    54a4:	7990006f          	j	643c <_vfiprintf_r+0x1678>
    54a8:	41050d33          	sub	s10,a0,a6
    54ac:	fffd4e93          	not	t4,s10
    54b0:	41fede93          	sra	t4,t4,0x1f
    54b4:	01dd7eb3          	and	t4,s10,t4
    54b8:	00012823          	sw	zero,16(sp)
    54bc:	6dd0006f          	j	6398 <_vfiprintf_r+0x15d4>
    54c0:	04300793          	li	a5,67
    54c4:	000d8e13          	mv	t3,s11
    54c8:	004a8d93          	add	s11,s5,4
    54cc:	00f68663          	beq	a3,a5,54d8 <_vfiprintf_r+0x714>
    54d0:	010e7793          	and	a5,t3,16
    54d4:	280788e3          	beqz	a5,5f64 <_vfiprintf_r+0x11a0>
    54d8:	00800613          	li	a2,8
    54dc:	00000593          	li	a1,0
    54e0:	05810513          	add	a0,sp,88
    54e4:	01112e23          	sw	a7,28(sp)
    54e8:	01c12c23          	sw	t3,24(sp)
    54ec:	ab1fb0ef          	jal	f9c <memset>
    54f0:	000aa603          	lw	a2,0(s5)
    54f4:	0ac10593          	add	a1,sp,172
    54f8:	05810693          	add	a3,sp,88
    54fc:	00040513          	mv	a0,s0
    5500:	00b12823          	sw	a1,16(sp)
    5504:	694050ef          	jal	ab98 <_wcrtomb_r>
    5508:	fff00793          	li	a5,-1
    550c:	01012583          	lw	a1,16(sp)
    5510:	01812e03          	lw	t3,24(sp)
    5514:	01c12883          	lw	a7,28(sp)
    5518:	00050d13          	mv	s10,a0
    551c:	00f51463          	bne	a0,a5,5524 <_vfiprintf_r+0x760>
    5520:	0200106f          	j	6540 <_vfiprintf_r+0x177c>
    5524:	fff54e93          	not	t4,a0
    5528:	41fede93          	sra	t4,t4,0x1f
    552c:	01d57eb3          	and	t4,a0,t4
    5530:	040101a3          	sb	zero,67(sp)
    5534:	000d8a93          	mv	s5,s11
    5538:	00058813          	mv	a6,a1
    553c:	a79ff06f          	j	4fb4 <_vfiprintf_r+0x1f0>
    5540:	411008b3          	neg	a7,a7
    5544:	000cc683          	lbu	a3,0(s9)
    5548:	004ded93          	or	s11,s11,4
    554c:	9f9ff06f          	j	4f44 <_vfiprintf_r+0x180>
    5550:	010dee13          	or	t3,s11,16
    5554:	020e7793          	and	a5,t3,32
    5558:	0c0788e3          	beqz	a5,5e28 <_vfiprintf_r+0x1064>
    555c:	007a8a93          	add	s5,s5,7
    5560:	ff8afa93          	and	s5,s5,-8
    5564:	004aa683          	lw	a3,4(s5)
    5568:	000aad83          	lw	s11,0(s5)
    556c:	008a8a93          	add	s5,s5,8
    5570:	00068d13          	mv	s10,a3
    5574:	3006c263          	bltz	a3,5878 <_vfiprintf_r+0xab4>
    5578:	32074063          	bltz	a4,5898 <_vfiprintf_r+0xad4>
    557c:	01ade6b3          	or	a3,s11,s10
    5580:	f7fe7e13          	and	t3,t3,-129
    5584:	30069a63          	bnez	a3,5898 <_vfiprintf_r+0xad4>
    5588:	68071ae3          	bnez	a4,641c <_vfiprintf_r+0x1658>
    558c:	04314783          	lbu	a5,67(sp)
    5590:	00012823          	sw	zero,16(sp)
    5594:	00000e93          	li	t4,0
    5598:	00000d13          	li	s10,0
    559c:	11010813          	add	a6,sp,272
    55a0:	00078463          	beqz	a5,55a8 <_vfiprintf_r+0x7e4>
    55a4:	001e8e93          	add	t4,t4,1
    55a8:	002e7f93          	and	t6,t3,2
    55ac:	a00f8ae3          	beqz	t6,4fc0 <_vfiprintf_r+0x1fc>
    55b0:	002e8e93          	add	t4,t4,2
    55b4:	00200f93          	li	t6,2
    55b8:	a09ff06f          	j	4fc0 <_vfiprintf_r+0x1fc>
    55bc:	000cc683          	lbu	a3,0(s9)
    55c0:	06800793          	li	a5,104
    55c4:	4ef686e3          	beq	a3,a5,62b0 <_vfiprintf_r+0x14ec>
    55c8:	040ded93          	or	s11,s11,64
    55cc:	979ff06f          	j	4f44 <_vfiprintf_r+0x180>
    55d0:	010de613          	or	a2,s11,16
    55d4:	02067793          	and	a5,a2,32
    55d8:	000780e3          	beqz	a5,5dd8 <_vfiprintf_r+0x1014>
    55dc:	007a8a93          	add	s5,s5,7
    55e0:	ff8afa93          	and	s5,s5,-8
    55e4:	000aad83          	lw	s11,0(s5)
    55e8:	004aad03          	lw	s10,4(s5)
    55ec:	008a8a93          	add	s5,s5,8
    55f0:	040101a3          	sb	zero,67(sp)
    55f4:	00060e13          	mv	t3,a2
    55f8:	2a074063          	bltz	a4,5898 <_vfiprintf_r+0xad4>
    55fc:	01ade6b3          	or	a3,s11,s10
    5600:	f7f67e13          	and	t3,a2,-129
    5604:	28069a63          	bnez	a3,5898 <_vfiprintf_r+0xad4>
    5608:	00100793          	li	a5,1
    560c:	06071e63          	bnez	a4,5688 <_vfiprintf_r+0x8c4>
    5610:	f6079ee3          	bnez	a5,558c <_vfiprintf_r+0x7c8>
    5614:	00167d13          	and	s10,a2,1
    5618:	0a0d0ce3          	beqz	s10,5ed0 <_vfiprintf_r+0x110c>
    561c:	03000793          	li	a5,48
    5620:	10f107a3          	sb	a5,271(sp)
    5624:	000d0e93          	mv	t4,s10
    5628:	10f10813          	add	a6,sp,271
    562c:	2980006f          	j	58c4 <_vfiprintf_r+0xb00>
    5630:	02b00793          	li	a5,43
    5634:	000cc683          	lbu	a3,0(s9)
    5638:	04f101a3          	sb	a5,67(sp)
    563c:	909ff06f          	j	4f44 <_vfiprintf_r+0x180>
    5640:	010de693          	or	a3,s11,16
    5644:	0206f793          	and	a5,a3,32
    5648:	7a078c63          	beqz	a5,5e00 <_vfiprintf_r+0x103c>
    564c:	007a8a93          	add	s5,s5,7
    5650:	ff8afa93          	and	s5,s5,-8
    5654:	000aa783          	lw	a5,0(s5)
    5658:	004aa583          	lw	a1,4(s5)
    565c:	008a8a93          	add	s5,s5,8
    5660:	040101a3          	sb	zero,67(sp)
    5664:	bff6fe13          	and	t3,a3,-1025
    5668:	02074c63          	bltz	a4,56a0 <_vfiprintf_r+0x8dc>
    566c:	00b7e633          	or	a2,a5,a1
    5670:	b7f6f693          	and	a3,a3,-1153
    5674:	420610e3          	bnez	a2,6294 <_vfiprintf_r+0x14d0>
    5678:	000e0613          	mv	a2,t3
    567c:	00000793          	li	a5,0
    5680:	00068e13          	mv	t3,a3
    5684:	f80706e3          	beqz	a4,5610 <_vfiprintf_r+0x84c>
    5688:	00100693          	li	a3,1
    568c:	58d788e3          	beq	a5,a3,641c <_vfiprintf_r+0x1658>
    5690:	00200693          	li	a3,2
    5694:	46d786e3          	beq	a5,a3,6300 <_vfiprintf_r+0x153c>
    5698:	00000793          	li	a5,0
    569c:	00000593          	li	a1,0
    56a0:	11010813          	add	a6,sp,272
    56a4:	01d59613          	sll	a2,a1,0x1d
    56a8:	0077f693          	and	a3,a5,7
    56ac:	0037d793          	srl	a5,a5,0x3
    56b0:	03068693          	add	a3,a3,48
    56b4:	00f667b3          	or	a5,a2,a5
    56b8:	0035d593          	srl	a1,a1,0x3
    56bc:	fed80fa3          	sb	a3,-1(a6)
    56c0:	00b7e633          	or	a2,a5,a1
    56c4:	00080513          	mv	a0,a6
    56c8:	fff80813          	add	a6,a6,-1
    56cc:	fc061ce3          	bnez	a2,56a4 <_vfiprintf_r+0x8e0>
    56d0:	001e7793          	and	a5,t3,1
    56d4:	54078e63          	beqz	a5,5c30 <_vfiprintf_r+0xe6c>
    56d8:	03000793          	li	a5,48
    56dc:	54f68a63          	beq	a3,a5,5c30 <_vfiprintf_r+0xe6c>
    56e0:	ffe50513          	add	a0,a0,-2
    56e4:	fef80fa3          	sb	a5,-1(a6)
    56e8:	11010793          	add	a5,sp,272
    56ec:	40a78d33          	sub	s10,a5,a0
    56f0:	00070e93          	mv	t4,a4
    56f4:	09a744e3          	blt	a4,s10,5f7c <_vfiprintf_r+0x11b8>
    56f8:	00050813          	mv	a6,a0
    56fc:	1c80006f          	j	58c4 <_vfiprintf_r+0xb00>
    5700:	000086b7          	lui	a3,0x8
    5704:	83068693          	add	a3,a3,-2000 # 7830 <__fputwc+0xf0>
    5708:	04d11223          	sh	a3,68(sp)
    570c:	0000a697          	auipc	a3,0xa
    5710:	9d868693          	add	a3,a3,-1576 # f0e4 <__fini_array_end+0x1a4>
    5714:	000aa783          	lw	a5,0(s5)
    5718:	00000593          	li	a1,0
    571c:	002dee13          	or	t3,s11,2
    5720:	004a8a93          	add	s5,s5,4
    5724:	00d12a23          	sw	a3,20(sp)
    5728:	040101a3          	sb	zero,67(sp)
    572c:	4c074863          	bltz	a4,5bfc <_vfiprintf_r+0xe38>
    5730:	00b7e6b3          	or	a3,a5,a1
    5734:	f7fe7513          	and	a0,t3,-129
    5738:	4a069c63          	bnez	a3,5bf0 <_vfiprintf_r+0xe2c>
    573c:	000e0613          	mv	a2,t3
    5740:	00200793          	li	a5,2
    5744:	00050e13          	mv	t3,a0
    5748:	ec5ff06f          	j	560c <_vfiprintf_r+0x848>
    574c:	00040513          	mv	a0,s0
    5750:	00e12c23          	sw	a4,24(sp)
    5754:	01112823          	sw	a7,16(sp)
    5758:	390020ef          	jal	7ae8 <_localeconv_r>
    575c:	00452783          	lw	a5,4(a0)
    5760:	00078513          	mv	a0,a5
    5764:	02f12a23          	sw	a5,52(sp)
    5768:	ab5fb0ef          	jal	121c <strlen>
    576c:	00050793          	mv	a5,a0
    5770:	00040513          	mv	a0,s0
    5774:	02f12823          	sw	a5,48(sp)
    5778:	370020ef          	jal	7ae8 <_localeconv_r>
    577c:	00852703          	lw	a4,8(a0)
    5780:	03012783          	lw	a5,48(sp)
    5784:	01012883          	lw	a7,16(sp)
    5788:	02e12623          	sw	a4,44(sp)
    578c:	01812703          	lw	a4,24(sp)
    5790:	a2078ee3          	beqz	a5,51cc <_vfiprintf_r+0x408>
    5794:	02c12783          	lw	a5,44(sp)
    5798:	000cc683          	lbu	a3,0(s9)
    579c:	fa078463          	beqz	a5,4f44 <_vfiprintf_r+0x180>
    57a0:	0007c783          	lbu	a5,0(a5)
    57a4:	fa078063          	beqz	a5,4f44 <_vfiprintf_r+0x180>
    57a8:	400ded93          	or	s11,s11,1024
    57ac:	f98ff06f          	j	4f44 <_vfiprintf_r+0x180>
    57b0:	020df793          	and	a5,s11,32
    57b4:	78079263          	bnez	a5,5f38 <_vfiprintf_r+0x1174>
    57b8:	010df793          	and	a5,s11,16
    57bc:	30079ae3          	bnez	a5,62d0 <_vfiprintf_r+0x150c>
    57c0:	040df793          	and	a5,s11,64
    57c4:	400796e3          	bnez	a5,63d0 <_vfiprintf_r+0x160c>
    57c8:	200dfe13          	and	t3,s11,512
    57cc:	300e02e3          	beqz	t3,62d0 <_vfiprintf_r+0x150c>
    57d0:	000aa783          	lw	a5,0(s5)
    57d4:	00c12703          	lw	a4,12(sp)
    57d8:	004a8a93          	add	s5,s5,4
    57dc:	00e78023          	sb	a4,0(a5)
    57e0:	efcff06f          	j	4edc <_vfiprintf_r+0x118>
    57e4:	000cc683          	lbu	a3,0(s9)
    57e8:	06c00793          	li	a5,108
    57ec:	2cf68ae3          	beq	a3,a5,62c0 <_vfiprintf_r+0x14fc>
    57f0:	010ded93          	or	s11,s11,16
    57f4:	f50ff06f          	j	4f44 <_vfiprintf_r+0x180>
    57f8:	000cc683          	lbu	a3,0(s9)
    57fc:	080ded93          	or	s11,s11,128
    5800:	f44ff06f          	j	4f44 <_vfiprintf_r+0x180>
    5804:	000cc683          	lbu	a3,0(s9)
    5808:	02a00793          	li	a5,42
    580c:	001c8593          	add	a1,s9,1
    5810:	54f680e3          	beq	a3,a5,6550 <_vfiprintf_r+0x178c>
    5814:	fd068793          	add	a5,a3,-48
    5818:	00900613          	li	a2,9
    581c:	00000713          	li	a4,0
    5820:	00900513          	li	a0,9
    5824:	02f66463          	bltu	a2,a5,584c <_vfiprintf_r+0xa88>
    5828:	0005c683          	lbu	a3,0(a1)
    582c:	00271613          	sll	a2,a4,0x2
    5830:	00e60733          	add	a4,a2,a4
    5834:	00171713          	sll	a4,a4,0x1
    5838:	00f70733          	add	a4,a4,a5
    583c:	fd068793          	add	a5,a3,-48
    5840:	00158593          	add	a1,a1,1
    5844:	fef572e3          	bgeu	a0,a5,5828 <_vfiprintf_r+0xa64>
    5848:	74074063          	bltz	a4,5f88 <_vfiprintf_r+0x11c4>
    584c:	00058c93          	mv	s9,a1
    5850:	ef8ff06f          	j	4f48 <_vfiprintf_r+0x184>
    5854:	000cc683          	lbu	a3,0(s9)
    5858:	001ded93          	or	s11,s11,1
    585c:	ee8ff06f          	j	4f44 <_vfiprintf_r+0x180>
    5860:	04314783          	lbu	a5,67(sp)
    5864:	000cc683          	lbu	a3,0(s9)
    5868:	ec079e63          	bnez	a5,4f44 <_vfiprintf_r+0x180>
    586c:	02000793          	li	a5,32
    5870:	04f101a3          	sb	a5,67(sp)
    5874:	ed0ff06f          	j	4f44 <_vfiprintf_r+0x180>
    5878:	02d00613          	li	a2,45
    587c:	01b036b3          	snez	a3,s11
    5880:	41a000b3          	neg	ra,s10
    5884:	04c101a3          	sb	a2,67(sp)
    5888:	40d08d33          	sub	s10,ra,a3
    588c:	41b00db3          	neg	s11,s11
    5890:	00074463          	bltz	a4,5898 <_vfiprintf_r+0xad4>
    5894:	f7fe7e13          	and	t3,t3,-129
    5898:	120d14e3          	bnez	s10,61c0 <_vfiprintf_r+0x13fc>
    589c:	00900693          	li	a3,9
    58a0:	13b6e0e3          	bltu	a3,s11,61c0 <_vfiprintf_r+0x13fc>
    58a4:	030d8793          	add	a5,s11,48
    58a8:	0ff7f793          	zext.b	a5,a5
    58ac:	10f107a3          	sb	a5,271(sp)
    58b0:	00070e93          	mv	t4,a4
    58b4:	00e04463          	bgtz	a4,58bc <_vfiprintf_r+0xaf8>
    58b8:	00100e93          	li	t4,1
    58bc:	00100d13          	li	s10,1
    58c0:	10f10813          	add	a6,sp,271
    58c4:	04314783          	lbu	a5,67(sp)
    58c8:	00012823          	sw	zero,16(sp)
    58cc:	cc079ce3          	bnez	a5,55a4 <_vfiprintf_r+0x7e0>
    58d0:	cd9ff06f          	j	55a8 <_vfiprintf_r+0x7e4>
    58d4:	00100713          	li	a4,1
    58d8:	000d0793          	mv	a5,s10
    58dc:	07012623          	sw	a6,108(sp)
    58e0:	07a12823          	sw	s10,112(sp)
    58e4:	07a12423          	sw	s10,104(sp)
    58e8:	06e12223          	sw	a4,100(sp)
    58ec:	000a0c13          	mv	s8,s4
    58f0:	008c0c13          	add	s8,s8,8
    58f4:	809ff06f          	j	50fc <_vfiprintf_r+0x338>
    58f8:	00100613          	li	a2,1
    58fc:	00000693          	li	a3,0
    5900:	000a0593          	mv	a1,s4
    5904:	a65ff06f          	j	5368 <_vfiprintf_r+0x5a4>
    5908:	41d88db3          	sub	s11,a7,t4
    590c:	f9b05a63          	blez	s11,50a0 <_vfiprintf_r+0x2dc>
    5910:	01000593          	li	a1,16
    5914:	3bb5dae3          	bge	a1,s11,64c8 <_vfiprintf_r+0x1704>
    5918:	0000af97          	auipc	t6,0xa
    591c:	e40f8f93          	add	t6,t6,-448 # f758 <zeroes.0>
    5920:	02e12223          	sw	a4,36(sp)
    5924:	000a8713          	mv	a4,s5
    5928:	000c0693          	mv	a3,s8
    592c:	000d8a93          	mv	s5,s11
    5930:	01000f13          	li	t5,16
    5934:	00700293          	li	t0,7
    5938:	01c12c23          	sw	t3,24(sp)
    593c:	01012e23          	sw	a6,28(sp)
    5940:	03112023          	sw	a7,32(sp)
    5944:	03d12423          	sw	t4,40(sp)
    5948:	000f8c13          	mv	s8,t6
    594c:	00070d93          	mv	s11,a4
    5950:	0180006f          	j	5968 <_vfiprintf_r+0xba4>
    5954:	00260513          	add	a0,a2,2
    5958:	00868693          	add	a3,a3,8
    595c:	00070613          	mv	a2,a4
    5960:	ff0a8a93          	add	s5,s5,-16
    5964:	055f5c63          	bge	t5,s5,59bc <_vfiprintf_r+0xbf8>
    5968:	01078793          	add	a5,a5,16
    596c:	00160713          	add	a4,a2,1
    5970:	0186a023          	sw	s8,0(a3)
    5974:	01e6a223          	sw	t5,4(a3)
    5978:	06f12423          	sw	a5,104(sp)
    597c:	06e12223          	sw	a4,100(sp)
    5980:	fce2dae3          	bge	t0,a4,5954 <_vfiprintf_r+0xb90>
    5984:	1c078663          	beqz	a5,5b50 <_vfiprintf_r+0xd8c>
    5988:	06010613          	add	a2,sp,96
    598c:	00098593          	mv	a1,s3
    5990:	00040513          	mv	a0,s0
    5994:	af4ff0ef          	jal	4c88 <__sprint_r.part.0>
    5998:	8e051ee3          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    599c:	06412603          	lw	a2,100(sp)
    59a0:	01000f13          	li	t5,16
    59a4:	ff0a8a93          	add	s5,s5,-16
    59a8:	06812783          	lw	a5,104(sp)
    59ac:	000a0693          	mv	a3,s4
    59b0:	00160513          	add	a0,a2,1
    59b4:	00700293          	li	t0,7
    59b8:	fb5f48e3          	blt	t5,s5,5968 <_vfiprintf_r+0xba4>
    59bc:	01812e03          	lw	t3,24(sp)
    59c0:	01c12803          	lw	a6,28(sp)
    59c4:	02012883          	lw	a7,32(sp)
    59c8:	02412703          	lw	a4,36(sp)
    59cc:	02812e83          	lw	t4,40(sp)
    59d0:	000d8613          	mv	a2,s11
    59d4:	000c0f93          	mv	t6,s8
    59d8:	000a8d93          	mv	s11,s5
    59dc:	00068c13          	mv	s8,a3
    59e0:	00060a93          	mv	s5,a2
    59e4:	01b787b3          	add	a5,a5,s11
    59e8:	01fc2023          	sw	t6,0(s8)
    59ec:	01bc2223          	sw	s11,4(s8)
    59f0:	06f12423          	sw	a5,104(sp)
    59f4:	06a12223          	sw	a0,100(sp)
    59f8:	00700613          	li	a2,7
    59fc:	4ea65863          	bge	a2,a0,5eec <_vfiprintf_r+0x1128>
    5a00:	1a0786e3          	beqz	a5,63ac <_vfiprintf_r+0x15e8>
    5a04:	06010613          	add	a2,sp,96
    5a08:	00098593          	mv	a1,s3
    5a0c:	00040513          	mv	a0,s0
    5a10:	03d12423          	sw	t4,40(sp)
    5a14:	02e12223          	sw	a4,36(sp)
    5a18:	03112023          	sw	a7,32(sp)
    5a1c:	01012e23          	sw	a6,28(sp)
    5a20:	01c12c23          	sw	t3,24(sp)
    5a24:	a64ff0ef          	jal	4c88 <__sprint_r.part.0>
    5a28:	860516e3          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    5a2c:	02412703          	lw	a4,36(sp)
    5a30:	06412603          	lw	a2,100(sp)
    5a34:	06812783          	lw	a5,104(sp)
    5a38:	41a70733          	sub	a4,a4,s10
    5a3c:	02812e83          	lw	t4,40(sp)
    5a40:	02012883          	lw	a7,32(sp)
    5a44:	01c12803          	lw	a6,28(sp)
    5a48:	01812e03          	lw	t3,24(sp)
    5a4c:	000a0c13          	mv	s8,s4
    5a50:	00160f13          	add	t5,a2,1
    5a54:	e4e05a63          	blez	a4,50a8 <_vfiprintf_r+0x2e4>
    5a58:	01000593          	li	a1,16
    5a5c:	0000af97          	auipc	t6,0xa
    5a60:	cfcf8f93          	add	t6,t6,-772 # f758 <zeroes.0>
    5a64:	0ae5da63          	bge	a1,a4,5b18 <_vfiprintf_r+0xd54>
    5a68:	000c0593          	mv	a1,s8
    5a6c:	03512423          	sw	s5,40(sp)
    5a70:	01000d93          	li	s11,16
    5a74:	00700293          	li	t0,7
    5a78:	01c12c23          	sw	t3,24(sp)
    5a7c:	01012e23          	sw	a6,28(sp)
    5a80:	03112023          	sw	a7,32(sp)
    5a84:	03d12223          	sw	t4,36(sp)
    5a88:	00070a93          	mv	s5,a4
    5a8c:	000b0c13          	mv	s8,s6
    5a90:	0180006f          	j	5aa8 <_vfiprintf_r+0xce4>
    5a94:	00260f13          	add	t5,a2,2
    5a98:	00858593          	add	a1,a1,8
    5a9c:	00068613          	mv	a2,a3
    5aa0:	ff0a8a93          	add	s5,s5,-16
    5aa4:	055dda63          	bge	s11,s5,5af8 <_vfiprintf_r+0xd34>
    5aa8:	01078793          	add	a5,a5,16
    5aac:	00160693          	add	a3,a2,1
    5ab0:	0165a023          	sw	s6,0(a1)
    5ab4:	01b5a223          	sw	s11,4(a1)
    5ab8:	06f12423          	sw	a5,104(sp)
    5abc:	06d12223          	sw	a3,100(sp)
    5ac0:	fcd2dae3          	bge	t0,a3,5a94 <_vfiprintf_r+0xcd0>
    5ac4:	06078e63          	beqz	a5,5b40 <_vfiprintf_r+0xd7c>
    5ac8:	06010613          	add	a2,sp,96
    5acc:	00098593          	mv	a1,s3
    5ad0:	00040513          	mv	a0,s0
    5ad4:	9b4ff0ef          	jal	4c88 <__sprint_r.part.0>
    5ad8:	fa051e63          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    5adc:	06412603          	lw	a2,100(sp)
    5ae0:	ff0a8a93          	add	s5,s5,-16
    5ae4:	06812783          	lw	a5,104(sp)
    5ae8:	000a0593          	mv	a1,s4
    5aec:	00160f13          	add	t5,a2,1
    5af0:	00700293          	li	t0,7
    5af4:	fb5dcae3          	blt	s11,s5,5aa8 <_vfiprintf_r+0xce4>
    5af8:	000a8713          	mv	a4,s5
    5afc:	01812e03          	lw	t3,24(sp)
    5b00:	01c12803          	lw	a6,28(sp)
    5b04:	02012883          	lw	a7,32(sp)
    5b08:	02412e83          	lw	t4,36(sp)
    5b0c:	02812a83          	lw	s5,40(sp)
    5b10:	000c0f93          	mv	t6,s8
    5b14:	00058c13          	mv	s8,a1
    5b18:	00e787b3          	add	a5,a5,a4
    5b1c:	00ec2223          	sw	a4,4(s8)
    5b20:	01fc2023          	sw	t6,0(s8)
    5b24:	06f12423          	sw	a5,104(sp)
    5b28:	07e12223          	sw	t5,100(sp)
    5b2c:	00700713          	li	a4,7
    5b30:	25e74863          	blt	a4,t5,5d80 <_vfiprintf_r+0xfbc>
    5b34:	008c0c13          	add	s8,s8,8
    5b38:	001f0f13          	add	t5,t5,1
    5b3c:	d6cff06f          	j	50a8 <_vfiprintf_r+0x2e4>
    5b40:	00100f13          	li	t5,1
    5b44:	00000613          	li	a2,0
    5b48:	000a0593          	mv	a1,s4
    5b4c:	f55ff06f          	j	5aa0 <_vfiprintf_r+0xcdc>
    5b50:	00100513          	li	a0,1
    5b54:	00000613          	li	a2,0
    5b58:	000a0693          	mv	a3,s4
    5b5c:	e05ff06f          	j	5960 <_vfiprintf_r+0xb9c>
    5b60:	06078263          	beqz	a5,5bc4 <_vfiprintf_r+0xe00>
    5b64:	06010613          	add	a2,sp,96
    5b68:	00098593          	mv	a1,s3
    5b6c:	00040513          	mv	a0,s0
    5b70:	03d12e23          	sw	t4,60(sp)
    5b74:	02e12c23          	sw	a4,56(sp)
    5b78:	03112423          	sw	a7,40(sp)
    5b7c:	03012223          	sw	a6,36(sp)
    5b80:	02512023          	sw	t0,32(sp)
    5b84:	01f12e23          	sw	t6,28(sp)
    5b88:	01c12c23          	sw	t3,24(sp)
    5b8c:	8fcff0ef          	jal	4c88 <__sprint_r.part.0>
    5b90:	f0051263          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    5b94:	06412603          	lw	a2,100(sp)
    5b98:	06812783          	lw	a5,104(sp)
    5b9c:	03c12e83          	lw	t4,60(sp)
    5ba0:	03812703          	lw	a4,56(sp)
    5ba4:	02812883          	lw	a7,40(sp)
    5ba8:	02412803          	lw	a6,36(sp)
    5bac:	02012283          	lw	t0,32(sp)
    5bb0:	01c12f83          	lw	t6,28(sp)
    5bb4:	01812e03          	lw	t3,24(sp)
    5bb8:	000a0c13          	mv	s8,s4
    5bbc:	00160f13          	add	t5,a2,1
    5bc0:	c58ff06f          	j	5018 <_vfiprintf_r+0x254>
    5bc4:	380f8863          	beqz	t6,5f54 <_vfiprintf_r+0x1190>
    5bc8:	04410793          	add	a5,sp,68
    5bcc:	06f12623          	sw	a5,108(sp)
    5bd0:	00200793          	li	a5,2
    5bd4:	06f12823          	sw	a5,112(sp)
    5bd8:	00100f13          	li	t5,1
    5bdc:	000a0c13          	mv	s8,s4
    5be0:	000f0613          	mv	a2,t5
    5be4:	008c0c13          	add	s8,s8,8
    5be8:	001f0f13          	add	t5,t5,1
    5bec:	cacff06f          	j	5098 <_vfiprintf_r+0x2d4>
    5bf0:	00200693          	li	a3,2
    5bf4:	00050e13          	mv	t3,a0
    5bf8:	aa0684e3          	beqz	a3,56a0 <_vfiprintf_r+0x8dc>
    5bfc:	01412503          	lw	a0,20(sp)
    5c00:	11010813          	add	a6,sp,272
    5c04:	00f7f693          	and	a3,a5,15
    5c08:	00d506b3          	add	a3,a0,a3
    5c0c:	0006c603          	lbu	a2,0(a3)
    5c10:	0047d793          	srl	a5,a5,0x4
    5c14:	01c59693          	sll	a3,a1,0x1c
    5c18:	00f6e7b3          	or	a5,a3,a5
    5c1c:	0045d593          	srl	a1,a1,0x4
    5c20:	fec80fa3          	sb	a2,-1(a6)
    5c24:	00b7e6b3          	or	a3,a5,a1
    5c28:	fff80813          	add	a6,a6,-1
    5c2c:	fc069ce3          	bnez	a3,5c04 <_vfiprintf_r+0xe40>
    5c30:	11010793          	add	a5,sp,272
    5c34:	41078d33          	sub	s10,a5,a6
    5c38:	00070e93          	mv	t4,a4
    5c3c:	c9a754e3          	bge	a4,s10,58c4 <_vfiprintf_r+0xb00>
    5c40:	000d0e93          	mv	t4,s10
    5c44:	c81ff06f          	j	58c4 <_vfiprintf_r+0xb00>
    5c48:	01000513          	li	a0,16
    5c4c:	01b554e3          	bge	a0,s11,6454 <_vfiprintf_r+0x1690>
    5c50:	000a8693          	mv	a3,s5
    5c54:	0000a317          	auipc	t1,0xa
    5c58:	b1430313          	add	t1,t1,-1260 # f768 <blanks.1>
    5c5c:	02e12c23          	sw	a4,56(sp)
    5c60:	000d8a93          	mv	s5,s11
    5c64:	000c0713          	mv	a4,s8
    5c68:	01000f13          	li	t5,16
    5c6c:	00700393          	li	t2,7
    5c70:	01c12c23          	sw	t3,24(sp)
    5c74:	01f12e23          	sw	t6,28(sp)
    5c78:	02512023          	sw	t0,32(sp)
    5c7c:	03012223          	sw	a6,36(sp)
    5c80:	03112423          	sw	a7,40(sp)
    5c84:	03d12e23          	sw	t4,60(sp)
    5c88:	00030c13          	mv	s8,t1
    5c8c:	00068d93          	mv	s11,a3
    5c90:	01c0006f          	j	5cac <_vfiprintf_r+0xee8>
    5c94:	00260513          	add	a0,a2,2
    5c98:	00870713          	add	a4,a4,8
    5c9c:	00058613          	mv	a2,a1
    5ca0:	ff0a8a93          	add	s5,s5,-16
    5ca4:	055f5c63          	bge	t5,s5,5cfc <_vfiprintf_r+0xf38>
    5ca8:	00160593          	add	a1,a2,1
    5cac:	01078793          	add	a5,a5,16
    5cb0:	01872023          	sw	s8,0(a4)
    5cb4:	01e72223          	sw	t5,4(a4)
    5cb8:	06f12423          	sw	a5,104(sp)
    5cbc:	06b12223          	sw	a1,100(sp)
    5cc0:	fcb3dae3          	bge	t2,a1,5c94 <_vfiprintf_r+0xed0>
    5cc4:	08078a63          	beqz	a5,5d58 <_vfiprintf_r+0xf94>
    5cc8:	06010613          	add	a2,sp,96
    5ccc:	00098593          	mv	a1,s3
    5cd0:	00040513          	mv	a0,s0
    5cd4:	fb5fe0ef          	jal	4c88 <__sprint_r.part.0>
    5cd8:	da051e63          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    5cdc:	06412603          	lw	a2,100(sp)
    5ce0:	01000f13          	li	t5,16
    5ce4:	ff0a8a93          	add	s5,s5,-16
    5ce8:	06812783          	lw	a5,104(sp)
    5cec:	000a0713          	mv	a4,s4
    5cf0:	00160513          	add	a0,a2,1
    5cf4:	00700393          	li	t2,7
    5cf8:	fb5f48e3          	blt	t5,s5,5ca8 <_vfiprintf_r+0xee4>
    5cfc:	000c0313          	mv	t1,s8
    5d00:	01812e03          	lw	t3,24(sp)
    5d04:	00070c13          	mv	s8,a4
    5d08:	01c12f83          	lw	t6,28(sp)
    5d0c:	02012283          	lw	t0,32(sp)
    5d10:	02412803          	lw	a6,36(sp)
    5d14:	02812883          	lw	a7,40(sp)
    5d18:	03c12e83          	lw	t4,60(sp)
    5d1c:	03812703          	lw	a4,56(sp)
    5d20:	000d8693          	mv	a3,s11
    5d24:	000a8d93          	mv	s11,s5
    5d28:	00068a93          	mv	s5,a3
    5d2c:	01b787b3          	add	a5,a5,s11
    5d30:	006c2023          	sw	t1,0(s8)
    5d34:	01bc2223          	sw	s11,4(s8)
    5d38:	06f12423          	sw	a5,104(sp)
    5d3c:	06a12223          	sw	a0,100(sp)
    5d40:	00700613          	li	a2,7
    5d44:	12a64063          	blt	a2,a0,5e64 <_vfiprintf_r+0x10a0>
    5d48:	008c0c13          	add	s8,s8,8
    5d4c:	00150f13          	add	t5,a0,1
    5d50:	00050613          	mv	a2,a0
    5d54:	a8cff06f          	j	4fe0 <_vfiprintf_r+0x21c>
    5d58:	00000613          	li	a2,0
    5d5c:	00100513          	li	a0,1
    5d60:	000a0713          	mv	a4,s4
    5d64:	f3dff06f          	j	5ca0 <_vfiprintf_r+0xedc>
    5d68:	01d8d463          	bge	a7,t4,5d70 <_vfiprintf_r+0xfac>
    5d6c:	000e8893          	mv	a7,t4
    5d70:	00c12783          	lw	a5,12(sp)
    5d74:	011787b3          	add	a5,a5,a7
    5d78:	00f12623          	sw	a5,12(sp)
    5d7c:	ba8ff06f          	j	5124 <_vfiprintf_r+0x360>
    5d80:	b4078ae3          	beqz	a5,58d4 <_vfiprintf_r+0xb10>
    5d84:	06010613          	add	a2,sp,96
    5d88:	00098593          	mv	a1,s3
    5d8c:	00040513          	mv	a0,s0
    5d90:	03d12223          	sw	t4,36(sp)
    5d94:	03112023          	sw	a7,32(sp)
    5d98:	01012e23          	sw	a6,28(sp)
    5d9c:	01c12c23          	sw	t3,24(sp)
    5da0:	ee9fe0ef          	jal	4c88 <__sprint_r.part.0>
    5da4:	ce051863          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    5da8:	06412f03          	lw	t5,100(sp)
    5dac:	06812783          	lw	a5,104(sp)
    5db0:	02412e83          	lw	t4,36(sp)
    5db4:	02012883          	lw	a7,32(sp)
    5db8:	01c12803          	lw	a6,28(sp)
    5dbc:	01812e03          	lw	t3,24(sp)
    5dc0:	000a0c13          	mv	s8,s4
    5dc4:	001f0f13          	add	t5,t5,1
    5dc8:	ae0ff06f          	j	50a8 <_vfiprintf_r+0x2e4>
    5dcc:	06012223          	sw	zero,100(sp)
    5dd0:	000a0c13          	mv	s8,s4
    5dd4:	c84ff06f          	j	5258 <_vfiprintf_r+0x494>
    5dd8:	01067693          	and	a3,a2,16
    5ddc:	000aa783          	lw	a5,0(s5)
    5de0:	004a8a93          	add	s5,s5,4
    5de4:	12069c63          	bnez	a3,5f1c <_vfiprintf_r+0x1158>
    5de8:	04067693          	and	a3,a2,64
    5dec:	12068463          	beqz	a3,5f14 <_vfiprintf_r+0x1150>
    5df0:	01079d93          	sll	s11,a5,0x10
    5df4:	010ddd93          	srl	s11,s11,0x10
    5df8:	00000d13          	li	s10,0
    5dfc:	ff4ff06f          	j	55f0 <_vfiprintf_r+0x82c>
    5e00:	0106f613          	and	a2,a3,16
    5e04:	000aa783          	lw	a5,0(s5)
    5e08:	004a8a93          	add	s5,s5,4
    5e0c:	12061263          	bnez	a2,5f30 <_vfiprintf_r+0x116c>
    5e10:	0406f613          	and	a2,a3,64
    5e14:	10060a63          	beqz	a2,5f28 <_vfiprintf_r+0x1164>
    5e18:	01079793          	sll	a5,a5,0x10
    5e1c:	0107d793          	srl	a5,a5,0x10
    5e20:	00000593          	li	a1,0
    5e24:	83dff06f          	j	5660 <_vfiprintf_r+0x89c>
    5e28:	010e7693          	and	a3,t3,16
    5e2c:	000aa783          	lw	a5,0(s5)
    5e30:	004a8a93          	add	s5,s5,4
    5e34:	0c069863          	bnez	a3,5f04 <_vfiprintf_r+0x1140>
    5e38:	040e7693          	and	a3,t3,64
    5e3c:	0c068063          	beqz	a3,5efc <_vfiprintf_r+0x1138>
    5e40:	01079d93          	sll	s11,a5,0x10
    5e44:	410ddd93          	sra	s11,s11,0x10
    5e48:	41fddd13          	sra	s10,s11,0x1f
    5e4c:	000d0693          	mv	a3,s10
    5e50:	f24ff06f          	j	5574 <_vfiprintf_r+0x7b0>
    5e54:	00100f13          	li	t5,1
    5e58:	00000613          	li	a2,0
    5e5c:	000a0c13          	mv	s8,s4
    5e60:	a38ff06f          	j	5098 <_vfiprintf_r+0x2d4>
    5e64:	1a078463          	beqz	a5,600c <_vfiprintf_r+0x1248>
    5e68:	06010613          	add	a2,sp,96
    5e6c:	00098593          	mv	a1,s3
    5e70:	00040513          	mv	a0,s0
    5e74:	03d12e23          	sw	t4,60(sp)
    5e78:	02e12c23          	sw	a4,56(sp)
    5e7c:	03112423          	sw	a7,40(sp)
    5e80:	03012223          	sw	a6,36(sp)
    5e84:	02512023          	sw	t0,32(sp)
    5e88:	01f12e23          	sw	t6,28(sp)
    5e8c:	01c12c23          	sw	t3,24(sp)
    5e90:	df9fe0ef          	jal	4c88 <__sprint_r.part.0>
    5e94:	c0051063          	bnez	a0,5294 <_vfiprintf_r+0x4d0>
    5e98:	06412603          	lw	a2,100(sp)
    5e9c:	06812783          	lw	a5,104(sp)
    5ea0:	03c12e83          	lw	t4,60(sp)
    5ea4:	03812703          	lw	a4,56(sp)
    5ea8:	02812883          	lw	a7,40(sp)
    5eac:	02412803          	lw	a6,36(sp)
    5eb0:	02012283          	lw	t0,32(sp)
    5eb4:	01c12f83          	lw	t6,28(sp)
    5eb8:	01812e03          	lw	t3,24(sp)
    5ebc:	000a0c13          	mv	s8,s4
    5ec0:	00160f13          	add	t5,a2,1
    5ec4:	91cff06f          	j	4fe0 <_vfiprintf_r+0x21c>
    5ec8:	000d8e13          	mv	t3,s11
    5ecc:	e88ff06f          	j	5554 <_vfiprintf_r+0x790>
    5ed0:	00000e93          	li	t4,0
    5ed4:	11010813          	add	a6,sp,272
    5ed8:	9edff06f          	j	58c4 <_vfiprintf_r+0xb00>
    5edc:	0589a503          	lw	a0,88(s3)
    5ee0:	8b4fb0ef          	jal	f94 <__retarget_lock_acquire_recursive>
    5ee4:	00c99783          	lh	a5,12(s3)
    5ee8:	f41fe06f          	j	4e28 <_vfiprintf_r+0x64>
    5eec:	008c0c13          	add	s8,s8,8
    5ef0:	00150f13          	add	t5,a0,1
    5ef4:	00050613          	mv	a2,a0
    5ef8:	9a8ff06f          	j	50a0 <_vfiprintf_r+0x2dc>
    5efc:	200e7693          	and	a3,t3,512
    5f00:	50069463          	bnez	a3,6408 <_vfiprintf_r+0x1644>
    5f04:	41f7dd13          	sra	s10,a5,0x1f
    5f08:	00078d93          	mv	s11,a5
    5f0c:	000d0693          	mv	a3,s10
    5f10:	e64ff06f          	j	5574 <_vfiprintf_r+0x7b0>
    5f14:	20067693          	and	a3,a2,512
    5f18:	4c069663          	bnez	a3,63e4 <_vfiprintf_r+0x1620>
    5f1c:	00078d93          	mv	s11,a5
    5f20:	00000d13          	li	s10,0
    5f24:	eccff06f          	j	55f0 <_vfiprintf_r+0x82c>
    5f28:	2006f613          	and	a2,a3,512
    5f2c:	4c061863          	bnez	a2,63fc <_vfiprintf_r+0x1638>
    5f30:	00000593          	li	a1,0
    5f34:	f2cff06f          	j	5660 <_vfiprintf_r+0x89c>
    5f38:	00c12683          	lw	a3,12(sp)
    5f3c:	000aa783          	lw	a5,0(s5)
    5f40:	004a8a93          	add	s5,s5,4
    5f44:	41f6d713          	sra	a4,a3,0x1f
    5f48:	00d7a023          	sw	a3,0(a5)
    5f4c:	00e7a223          	sw	a4,4(a5)
    5f50:	f8dfe06f          	j	4edc <_vfiprintf_r+0x118>
    5f54:	00000613          	li	a2,0
    5f58:	00100f13          	li	t5,1
    5f5c:	000a0c13          	mv	s8,s4
    5f60:	938ff06f          	j	5098 <_vfiprintf_r+0x2d4>
    5f64:	000aa783          	lw	a5,0(s5)
    5f68:	00100e93          	li	t4,1
    5f6c:	00100d13          	li	s10,1
    5f70:	0af10623          	sb	a5,172(sp)
    5f74:	0ac10593          	add	a1,sp,172
    5f78:	db8ff06f          	j	5530 <_vfiprintf_r+0x76c>
    5f7c:	000d0e93          	mv	t4,s10
    5f80:	00050813          	mv	a6,a0
    5f84:	941ff06f          	j	58c4 <_vfiprintf_r+0xb00>
    5f88:	fff00713          	li	a4,-1
    5f8c:	00058c93          	mv	s9,a1
    5f90:	fb9fe06f          	j	4f48 <_vfiprintf_r+0x184>
    5f94:	000d8613          	mv	a2,s11
    5f98:	e3cff06f          	j	55d4 <_vfiprintf_r+0x810>
    5f9c:	00009797          	auipc	a5,0x9
    5fa0:	15c78793          	add	a5,a5,348 # f0f8 <__fini_array_end+0x1b8>
    5fa4:	000d8e13          	mv	t3,s11
    5fa8:	00f12a23          	sw	a5,20(sp)
    5fac:	020e7793          	and	a5,t3,32
    5fb0:	1c078c63          	beqz	a5,6188 <_vfiprintf_r+0x13c4>
    5fb4:	007a8a93          	add	s5,s5,7
    5fb8:	ff8afa93          	and	s5,s5,-8
    5fbc:	000aa783          	lw	a5,0(s5)
    5fc0:	004aa583          	lw	a1,4(s5)
    5fc4:	008a8a93          	add	s5,s5,8
    5fc8:	001e7613          	and	a2,t3,1
    5fcc:	00060e63          	beqz	a2,5fe8 <_vfiprintf_r+0x1224>
    5fd0:	00b7e633          	or	a2,a5,a1
    5fd4:	00060a63          	beqz	a2,5fe8 <_vfiprintf_r+0x1224>
    5fd8:	03000613          	li	a2,48
    5fdc:	04c10223          	sb	a2,68(sp)
    5fe0:	04d102a3          	sb	a3,69(sp)
    5fe4:	002e6e13          	or	t3,t3,2
    5fe8:	bffe7e13          	and	t3,t3,-1025
    5fec:	f3cff06f          	j	5728 <_vfiprintf_r+0x964>
    5ff0:	000d8693          	mv	a3,s11
    5ff4:	e50ff06f          	j	5644 <_vfiprintf_r+0x880>
    5ff8:	00009797          	auipc	a5,0x9
    5ffc:	0ec78793          	add	a5,a5,236 # f0e4 <__fini_array_end+0x1a4>
    6000:	000d8e13          	mv	t3,s11
    6004:	00f12a23          	sw	a5,20(sp)
    6008:	fa5ff06f          	j	5fac <_vfiprintf_r+0x11e8>
    600c:	04314603          	lbu	a2,67(sp)
    6010:	3a060a63          	beqz	a2,63c4 <_vfiprintf_r+0x1600>
    6014:	04310793          	add	a5,sp,67
    6018:	06f12623          	sw	a5,108(sp)
    601c:	00100793          	li	a5,1
    6020:	06f12823          	sw	a5,112(sp)
    6024:	00100f13          	li	t5,1
    6028:	000a0c13          	mv	s8,s4
    602c:	fe1fe06f          	j	500c <_vfiprintf_r+0x248>
    6030:	00800613          	li	a2,8
    6034:	00000593          	li	a1,0
    6038:	05810513          	add	a0,sp,88
    603c:	02e12023          	sw	a4,32(sp)
    6040:	01112e23          	sw	a7,28(sp)
    6044:	01c12c23          	sw	t3,24(sp)
    6048:	05012623          	sw	a6,76(sp)
    604c:	01012823          	sw	a6,16(sp)
    6050:	f4dfa0ef          	jal	f9c <memset>
    6054:	02012703          	lw	a4,32(sp)
    6058:	01012803          	lw	a6,16(sp)
    605c:	01812e03          	lw	t3,24(sp)
    6060:	01c12883          	lw	a7,28(sp)
    6064:	2a074463          	bltz	a4,630c <_vfiprintf_r+0x1548>
    6068:	00000d93          	li	s11,0
    606c:	00000d13          	li	s10,0
    6070:	01812823          	sw	s8,16(sp)
    6074:	01012e23          	sw	a6,28(sp)
    6078:	000d8c13          	mv	s8,s11
    607c:	03112023          	sw	a7,32(sp)
    6080:	000c8d93          	mv	s11,s9
    6084:	000a8c93          	mv	s9,s5
    6088:	000d0a93          	mv	s5,s10
    608c:	00098d13          	mv	s10,s3
    6090:	00070993          	mv	s3,a4
    6094:	0300006f          	j	60c4 <_vfiprintf_r+0x1300>
    6098:	05810693          	add	a3,sp,88
    609c:	0ac10593          	add	a1,sp,172
    60a0:	00040513          	mv	a0,s0
    60a4:	2f5040ef          	jal	ab98 <_wcrtomb_r>
    60a8:	fff00793          	li	a5,-1
    60ac:	48f50063          	beq	a0,a5,652c <_vfiprintf_r+0x1768>
    60b0:	00aa87b3          	add	a5,s5,a0
    60b4:	02f9c063          	blt	s3,a5,60d4 <_vfiprintf_r+0x1310>
    60b8:	004c0c13          	add	s8,s8,4
    60bc:	45378463          	beq	a5,s3,6504 <_vfiprintf_r+0x1740>
    60c0:	00078a93          	mv	s5,a5
    60c4:	04c12783          	lw	a5,76(sp)
    60c8:	018787b3          	add	a5,a5,s8
    60cc:	0007a603          	lw	a2,0(a5)
    60d0:	fc0614e3          	bnez	a2,6098 <_vfiprintf_r+0x12d4>
    60d4:	01012c03          	lw	s8,16(sp)
    60d8:	01812e03          	lw	t3,24(sp)
    60dc:	01c12803          	lw	a6,28(sp)
    60e0:	02012883          	lw	a7,32(sp)
    60e4:	000d0993          	mv	s3,s10
    60e8:	000a8d13          	mv	s10,s5
    60ec:	000c8a93          	mv	s5,s9
    60f0:	000d8c93          	mv	s9,s11
    60f4:	280d0e63          	beqz	s10,6390 <_vfiprintf_r+0x15cc>
    60f8:	06300793          	li	a5,99
    60fc:	33a7d463          	bge	a5,s10,6424 <_vfiprintf_r+0x1660>
    6100:	001d0593          	add	a1,s10,1
    6104:	00040513          	mv	a0,s0
    6108:	01112c23          	sw	a7,24(sp)
    610c:	01c12823          	sw	t3,16(sp)
    6110:	de8fb0ef          	jal	16f8 <_malloc_r>
    6114:	01012e03          	lw	t3,16(sp)
    6118:	01812883          	lw	a7,24(sp)
    611c:	00050813          	mv	a6,a0
    6120:	42050063          	beqz	a0,6540 <_vfiprintf_r+0x177c>
    6124:	00a12823          	sw	a0,16(sp)
    6128:	00800613          	li	a2,8
    612c:	00000593          	li	a1,0
    6130:	05810513          	add	a0,sp,88
    6134:	03112023          	sw	a7,32(sp)
    6138:	01c12e23          	sw	t3,28(sp)
    613c:	01012c23          	sw	a6,24(sp)
    6140:	e5dfa0ef          	jal	f9c <memset>
    6144:	01812803          	lw	a6,24(sp)
    6148:	05810713          	add	a4,sp,88
    614c:	000d0693          	mv	a3,s10
    6150:	00080593          	mv	a1,a6
    6154:	04c10613          	add	a2,sp,76
    6158:	00040513          	mv	a0,s0
    615c:	2c9040ef          	jal	ac24 <_wcsrtombs_r>
    6160:	01812803          	lw	a6,24(sp)
    6164:	01c12e03          	lw	t3,28(sp)
    6168:	02012883          	lw	a7,32(sp)
    616c:	40ad1063          	bne	s10,a0,656c <_vfiprintf_r+0x17a8>
    6170:	fffd4e93          	not	t4,s10
    6174:	01a807b3          	add	a5,a6,s10
    6178:	41fede93          	sra	t4,t4,0x1f
    617c:	00078023          	sb	zero,0(a5)
    6180:	01dd7eb3          	and	t4,s10,t4
    6184:	2140006f          	j	6398 <_vfiprintf_r+0x15d4>
    6188:	010e7613          	and	a2,t3,16
    618c:	000aa783          	lw	a5,0(s5)
    6190:	004a8a93          	add	s5,s5,4
    6194:	02061263          	bnez	a2,61b8 <_vfiprintf_r+0x13f4>
    6198:	040e7613          	and	a2,t3,64
    619c:	00060a63          	beqz	a2,61b0 <_vfiprintf_r+0x13ec>
    61a0:	01079793          	sll	a5,a5,0x10
    61a4:	0107d793          	srl	a5,a5,0x10
    61a8:	00000593          	li	a1,0
    61ac:	e1dff06f          	j	5fc8 <_vfiprintf_r+0x1204>
    61b0:	200e7613          	and	a2,t3,512
    61b4:	22061e63          	bnez	a2,63f0 <_vfiprintf_r+0x162c>
    61b8:	00000593          	li	a1,0
    61bc:	e0dff06f          	j	5fc8 <_vfiprintf_r+0x1204>
    61c0:	400e7793          	and	a5,t3,1024
    61c4:	00000693          	li	a3,0
    61c8:	11010e93          	add	t4,sp,272
    61cc:	01812823          	sw	s8,16(sp)
    61d0:	02812223          	sw	s0,36(sp)
    61d4:	03912c23          	sw	s9,56(sp)
    61d8:	03512e23          	sw	s5,60(sp)
    61dc:	02c12c83          	lw	s9,44(sp)
    61e0:	01c12c23          	sw	t3,24(sp)
    61e4:	01112e23          	sw	a7,28(sp)
    61e8:	02e12023          	sw	a4,32(sp)
    61ec:	00078c13          	mv	s8,a5
    61f0:	00068413          	mv	s0,a3
    61f4:	03312423          	sw	s3,40(sp)
    61f8:	000e8a93          	mv	s5,t4
    61fc:	0280006f          	j	6224 <_vfiprintf_r+0x1460>
    6200:	00a00613          	li	a2,10
    6204:	00000693          	li	a3,0
    6208:	000d8513          	mv	a0,s11
    620c:	000d0593          	mv	a1,s10
    6210:	364050ef          	jal	b574 <__udivdi3>
    6214:	220d0a63          	beqz	s10,6448 <_vfiprintf_r+0x1684>
    6218:	00050d93          	mv	s11,a0
    621c:	00058d13          	mv	s10,a1
    6220:	00098a93          	mv	s5,s3
    6224:	00a00613          	li	a2,10
    6228:	00000693          	li	a3,0
    622c:	000d8513          	mv	a0,s11
    6230:	000d0593          	mv	a1,s10
    6234:	1ed050ef          	jal	bc20 <__umoddi3>
    6238:	03050513          	add	a0,a0,48
    623c:	feaa8fa3          	sb	a0,-1(s5)
    6240:	fffa8993          	add	s3,s5,-1
    6244:	00140413          	add	s0,s0,1
    6248:	fa0c0ce3          	beqz	s8,6200 <_vfiprintf_r+0x143c>
    624c:	000cc783          	lbu	a5,0(s9)
    6250:	fa8798e3          	bne	a5,s0,6200 <_vfiprintf_r+0x143c>
    6254:	0ff00793          	li	a5,255
    6258:	faf404e3          	beq	s0,a5,6200 <_vfiprintf_r+0x143c>
    625c:	0e0d1a63          	bnez	s10,6350 <_vfiprintf_r+0x158c>
    6260:	00900793          	li	a5,9
    6264:	0fb7e663          	bltu	a5,s11,6350 <_vfiprintf_r+0x158c>
    6268:	00098813          	mv	a6,s3
    626c:	03912623          	sw	s9,44(sp)
    6270:	01012c03          	lw	s8,16(sp)
    6274:	01812e03          	lw	t3,24(sp)
    6278:	01c12883          	lw	a7,28(sp)
    627c:	02012703          	lw	a4,32(sp)
    6280:	02412403          	lw	s0,36(sp)
    6284:	02812983          	lw	s3,40(sp)
    6288:	03812c83          	lw	s9,56(sp)
    628c:	03c12a83          	lw	s5,60(sp)
    6290:	9a1ff06f          	j	5c30 <_vfiprintf_r+0xe6c>
    6294:	00068e13          	mv	t3,a3
    6298:	00000693          	li	a3,0
    629c:	c0068263          	beqz	a3,56a0 <_vfiprintf_r+0x8dc>
    62a0:	95dff06f          	j	5bfc <_vfiprintf_r+0xe38>
    62a4:	00040513          	mv	a0,s0
    62a8:	115000ef          	jal	6bbc <__sinit>
    62ac:	b61fe06f          	j	4e0c <_vfiprintf_r+0x48>
    62b0:	001cc683          	lbu	a3,1(s9)
    62b4:	200ded93          	or	s11,s11,512
    62b8:	001c8c93          	add	s9,s9,1
    62bc:	c89fe06f          	j	4f44 <_vfiprintf_r+0x180>
    62c0:	001cc683          	lbu	a3,1(s9)
    62c4:	020ded93          	or	s11,s11,32
    62c8:	001c8c93          	add	s9,s9,1
    62cc:	c79fe06f          	j	4f44 <_vfiprintf_r+0x180>
    62d0:	000aa783          	lw	a5,0(s5)
    62d4:	00c12703          	lw	a4,12(sp)
    62d8:	004a8a93          	add	s5,s5,4
    62dc:	00e7a023          	sw	a4,0(a5)
    62e0:	bfdfe06f          	j	4edc <_vfiprintf_r+0x118>
    62e4:	00600793          	li	a5,6
    62e8:	00070d13          	mv	s10,a4
    62ec:	0ce7e863          	bltu	a5,a4,63bc <_vfiprintf_r+0x15f8>
    62f0:	000d0e93          	mv	t4,s10
    62f4:	00009817          	auipc	a6,0x9
    62f8:	e1880813          	add	a6,a6,-488 # f10c <__fini_array_end+0x1cc>
    62fc:	cb9fe06f          	j	4fb4 <_vfiprintf_r+0x1f0>
    6300:	00000793          	li	a5,0
    6304:	00000593          	li	a1,0
    6308:	8f5ff06f          	j	5bfc <_vfiprintf_r+0xe38>
    630c:	05810713          	add	a4,sp,88
    6310:	00000693          	li	a3,0
    6314:	04c10613          	add	a2,sp,76
    6318:	00000593          	li	a1,0
    631c:	00040513          	mv	a0,s0
    6320:	01112e23          	sw	a7,28(sp)
    6324:	01012c23          	sw	a6,24(sp)
    6328:	01c12823          	sw	t3,16(sp)
    632c:	0f9040ef          	jal	ac24 <_wcsrtombs_r>
    6330:	fff00793          	li	a5,-1
    6334:	01012e03          	lw	t3,16(sp)
    6338:	01812803          	lw	a6,24(sp)
    633c:	01c12883          	lw	a7,28(sp)
    6340:	00050d13          	mv	s10,a0
    6344:	1ef50e63          	beq	a0,a5,6540 <_vfiprintf_r+0x177c>
    6348:	05012623          	sw	a6,76(sp)
    634c:	da9ff06f          	j	60f4 <_vfiprintf_r+0x1330>
    6350:	03012783          	lw	a5,48(sp)
    6354:	03412583          	lw	a1,52(sp)
    6358:	00000413          	li	s0,0
    635c:	40f989b3          	sub	s3,s3,a5
    6360:	00078613          	mv	a2,a5
    6364:	00098513          	mv	a0,s3
    6368:	6c8010ef          	jal	7a30 <strncpy>
    636c:	001cc783          	lbu	a5,1(s9)
    6370:	00a00613          	li	a2,10
    6374:	00000693          	li	a3,0
    6378:	00f037b3          	snez	a5,a5
    637c:	000d8513          	mv	a0,s11
    6380:	000d0593          	mv	a1,s10
    6384:	00fc8cb3          	add	s9,s9,a5
    6388:	1ec050ef          	jal	b574 <__udivdi3>
    638c:	e8dff06f          	j	6218 <_vfiprintf_r+0x1454>
    6390:	00000e93          	li	t4,0
    6394:	00012823          	sw	zero,16(sp)
    6398:	04314783          	lbu	a5,67(sp)
    639c:	00000713          	li	a4,0
    63a0:	00000f93          	li	t6,0
    63a4:	a0079063          	bnez	a5,55a4 <_vfiprintf_r+0x7e0>
    63a8:	c19fe06f          	j	4fc0 <_vfiprintf_r+0x1fc>
    63ac:	00100f13          	li	t5,1
    63b0:	00000613          	li	a2,0
    63b4:	000a0c13          	mv	s8,s4
    63b8:	ce9fe06f          	j	50a0 <_vfiprintf_r+0x2dc>
    63bc:	00600d13          	li	s10,6
    63c0:	f31ff06f          	j	62f0 <_vfiprintf_r+0x152c>
    63c4:	00100f13          	li	t5,1
    63c8:	000a0c13          	mv	s8,s4
    63cc:	c4dfe06f          	j	5018 <_vfiprintf_r+0x254>
    63d0:	000aa783          	lw	a5,0(s5)
    63d4:	00c12703          	lw	a4,12(sp)
    63d8:	004a8a93          	add	s5,s5,4
    63dc:	00e79023          	sh	a4,0(a5)
    63e0:	afdfe06f          	j	4edc <_vfiprintf_r+0x118>
    63e4:	0ff7fd93          	zext.b	s11,a5
    63e8:	00000d13          	li	s10,0
    63ec:	a04ff06f          	j	55f0 <_vfiprintf_r+0x82c>
    63f0:	0ff7f793          	zext.b	a5,a5
    63f4:	00000593          	li	a1,0
    63f8:	bd1ff06f          	j	5fc8 <_vfiprintf_r+0x1204>
    63fc:	0ff7f793          	zext.b	a5,a5
    6400:	00000593          	li	a1,0
    6404:	a5cff06f          	j	5660 <_vfiprintf_r+0x89c>
    6408:	01879d93          	sll	s11,a5,0x18
    640c:	418ddd93          	sra	s11,s11,0x18
    6410:	41fddd13          	sra	s10,s11,0x1f
    6414:	000d0693          	mv	a3,s10
    6418:	95cff06f          	j	5574 <_vfiprintf_r+0x7b0>
    641c:	03000793          	li	a5,48
    6420:	c8cff06f          	j	58ac <_vfiprintf_r+0xae8>
    6424:	00012823          	sw	zero,16(sp)
    6428:	0ac10813          	add	a6,sp,172
    642c:	cfdff06f          	j	6128 <_vfiprintf_r+0x1364>
    6430:	0589a503          	lw	a0,88(s3)
    6434:	b65fa0ef          	jal	f98 <__retarget_lock_release_recursive>
    6438:	d51fe06f          	j	5188 <_vfiprintf_r+0x3c4>
    643c:	00070e93          	mv	t4,a4
    6440:	00070d13          	mv	s10,a4
    6444:	f55ff06f          	j	6398 <_vfiprintf_r+0x15d4>
    6448:	00900793          	li	a5,9
    644c:	ddb7e6e3          	bltu	a5,s11,6218 <_vfiprintf_r+0x1454>
    6450:	e19ff06f          	j	6268 <_vfiprintf_r+0x14a4>
    6454:	00058513          	mv	a0,a1
    6458:	00009317          	auipc	t1,0x9
    645c:	31030313          	add	t1,t1,784 # f768 <blanks.1>
    6460:	8cdff06f          	j	5d2c <_vfiprintf_r+0xf68>
    6464:	00080513          	mv	a0,a6
    6468:	03112023          	sw	a7,32(sp)
    646c:	01012c23          	sw	a6,24(sp)
    6470:	01b12e23          	sw	s11,28(sp)
    6474:	da9fa0ef          	jal	121c <strlen>
    6478:	fff54e93          	not	t4,a0
    647c:	41fede93          	sra	t4,t4,0x1f
    6480:	01812803          	lw	a6,24(sp)
    6484:	01c12e03          	lw	t3,28(sp)
    6488:	02012883          	lw	a7,32(sp)
    648c:	00050d13          	mv	s10,a0
    6490:	01d57eb3          	and	t4,a0,t4
    6494:	00012823          	sw	zero,16(sp)
    6498:	f01ff06f          	j	6398 <_vfiprintf_r+0x15d4>
    649c:	06010613          	add	a2,sp,96
    64a0:	00098593          	mv	a1,s3
    64a4:	00040513          	mv	a0,s0
    64a8:	fe0fe0ef          	jal	4c88 <__sprint_r.part.0>
    64ac:	00051463          	bnez	a0,64b4 <_vfiprintf_r+0x16f0>
    64b0:	dc5fe06f          	j	5274 <_vfiprintf_r+0x4b0>
    64b4:	df5fe06f          	j	52a8 <_vfiprintf_r+0x4e4>
    64b8:	00168613          	add	a2,a3,1
    64bc:	00009317          	auipc	t1,0x9
    64c0:	2ac30313          	add	t1,t1,684 # f768 <blanks.1>
    64c4:	f19fe06f          	j	53dc <_vfiprintf_r+0x618>
    64c8:	000f0513          	mv	a0,t5
    64cc:	00009f97          	auipc	t6,0x9
    64d0:	28cf8f93          	add	t6,t6,652 # f758 <zeroes.0>
    64d4:	d10ff06f          	j	59e4 <_vfiprintf_r+0xc20>
    64d8:	0649a783          	lw	a5,100(s3)
    64dc:	0017f793          	and	a5,a5,1
    64e0:	00079c63          	bnez	a5,64f8 <_vfiprintf_r+0x1734>
    64e4:	00c9d783          	lhu	a5,12(s3)
    64e8:	2007f793          	and	a5,a5,512
    64ec:	00079663          	bnez	a5,64f8 <_vfiprintf_r+0x1734>
    64f0:	0589a503          	lw	a0,88(s3)
    64f4:	aa5fa0ef          	jal	f98 <__retarget_lock_release_recursive>
    64f8:	fff00793          	li	a5,-1
    64fc:	00f12623          	sw	a5,12(sp)
    6500:	de5fe06f          	j	52e4 <_vfiprintf_r+0x520>
    6504:	00098713          	mv	a4,s3
    6508:	000c8a93          	mv	s5,s9
    650c:	000d0993          	mv	s3,s10
    6510:	01012c03          	lw	s8,16(sp)
    6514:	01812e03          	lw	t3,24(sp)
    6518:	01c12803          	lw	a6,28(sp)
    651c:	02012883          	lw	a7,32(sp)
    6520:	000d8c93          	mv	s9,s11
    6524:	00070d13          	mv	s10,a4
    6528:	bcdff06f          	j	60f4 <_vfiprintf_r+0x1330>
    652c:	00cd1783          	lh	a5,12(s10)
    6530:	000d0993          	mv	s3,s10
    6534:	0407e793          	or	a5,a5,64
    6538:	00fd1623          	sh	a5,12(s10)
    653c:	d71fe06f          	j	52ac <_vfiprintf_r+0x4e8>
    6540:	00c99783          	lh	a5,12(s3)
    6544:	0407e793          	or	a5,a5,64
    6548:	00f99623          	sh	a5,12(s3)
    654c:	d61fe06f          	j	52ac <_vfiprintf_r+0x4e8>
    6550:	000aa703          	lw	a4,0(s5)
    6554:	004a8a93          	add	s5,s5,4
    6558:	00075463          	bgez	a4,6560 <_vfiprintf_r+0x179c>
    655c:	fff00713          	li	a4,-1
    6560:	001cc683          	lbu	a3,1(s9)
    6564:	00058c93          	mv	s9,a1
    6568:	9ddfe06f          	j	4f44 <_vfiprintf_r+0x180>
    656c:	00c9d783          	lhu	a5,12(s3)
    6570:	0407e793          	or	a5,a5,64
    6574:	00f99623          	sh	a5,12(s3)
    6578:	d1dfe06f          	j	5294 <_vfiprintf_r+0x4d0>

0000657c <__sbprintf>:
    657c:	b7010113          	add	sp,sp,-1168
    6580:	00c59783          	lh	a5,12(a1)
    6584:	00e5d703          	lhu	a4,14(a1)
    6588:	48812423          	sw	s0,1160(sp)
    658c:	00058413          	mv	s0,a1
    6590:	000105b7          	lui	a1,0x10
    6594:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x645>
    6598:	06442303          	lw	t1,100(s0)
    659c:	01c42883          	lw	a7,28(s0)
    65a0:	02442803          	lw	a6,36(s0)
    65a4:	01071713          	sll	a4,a4,0x10
    65a8:	00b7f7b3          	and	a5,a5,a1
    65ac:	00e7e7b3          	or	a5,a5,a4
    65b0:	40000593          	li	a1,1024
    65b4:	49212023          	sw	s2,1152(sp)
    65b8:	00f12a23          	sw	a5,20(sp)
    65bc:	00050913          	mv	s2,a0
    65c0:	07010793          	add	a5,sp,112
    65c4:	06010513          	add	a0,sp,96
    65c8:	48112623          	sw	ra,1164(sp)
    65cc:	48912223          	sw	s1,1156(sp)
    65d0:	47312e23          	sw	s3,1148(sp)
    65d4:	00060493          	mv	s1,a2
    65d8:	00068993          	mv	s3,a3
    65dc:	06612623          	sw	t1,108(sp)
    65e0:	03112223          	sw	a7,36(sp)
    65e4:	03012623          	sw	a6,44(sp)
    65e8:	00f12423          	sw	a5,8(sp)
    65ec:	00f12c23          	sw	a5,24(sp)
    65f0:	00b12823          	sw	a1,16(sp)
    65f4:	00b12e23          	sw	a1,28(sp)
    65f8:	02012023          	sw	zero,32(sp)
    65fc:	991fa0ef          	jal	f8c <__retarget_lock_init_recursive>
    6600:	00048613          	mv	a2,s1
    6604:	00098693          	mv	a3,s3
    6608:	00810593          	add	a1,sp,8
    660c:	00090513          	mv	a0,s2
    6610:	fb4fe0ef          	jal	4dc4 <_vfiprintf_r>
    6614:	00050493          	mv	s1,a0
    6618:	04055263          	bgez	a0,665c <__sbprintf+0xe0>
    661c:	01415783          	lhu	a5,20(sp)
    6620:	0407f793          	and	a5,a5,64
    6624:	00078863          	beqz	a5,6634 <__sbprintf+0xb8>
    6628:	00c45783          	lhu	a5,12(s0)
    662c:	0407e793          	or	a5,a5,64
    6630:	00f41623          	sh	a5,12(s0)
    6634:	06012503          	lw	a0,96(sp)
    6638:	959fa0ef          	jal	f90 <__retarget_lock_close_recursive>
    663c:	48c12083          	lw	ra,1164(sp)
    6640:	48812403          	lw	s0,1160(sp)
    6644:	48012903          	lw	s2,1152(sp)
    6648:	47c12983          	lw	s3,1148(sp)
    664c:	00048513          	mv	a0,s1
    6650:	48412483          	lw	s1,1156(sp)
    6654:	49010113          	add	sp,sp,1168
    6658:	00008067          	ret
    665c:	00810593          	add	a1,sp,8
    6660:	00090513          	mv	a0,s2
    6664:	25c000ef          	jal	68c0 <_fflush_r>
    6668:	fa050ae3          	beqz	a0,661c <__sbprintf+0xa0>
    666c:	fff00493          	li	s1,-1
    6670:	fadff06f          	j	661c <__sbprintf+0xa0>

00006674 <__sflush_r>:
    6674:	00c59703          	lh	a4,12(a1)
    6678:	fe010113          	add	sp,sp,-32
    667c:	00812c23          	sw	s0,24(sp)
    6680:	01312623          	sw	s3,12(sp)
    6684:	00112e23          	sw	ra,28(sp)
    6688:	00877793          	and	a5,a4,8
    668c:	00058413          	mv	s0,a1
    6690:	00050993          	mv	s3,a0
    6694:	12079063          	bnez	a5,67b4 <__sflush_r+0x140>
    6698:	000017b7          	lui	a5,0x1
    669c:	80078793          	add	a5,a5,-2048 # 800 <main+0x530>
    66a0:	0045a683          	lw	a3,4(a1)
    66a4:	00f767b3          	or	a5,a4,a5
    66a8:	00f59623          	sh	a5,12(a1)
    66ac:	18d05263          	blez	a3,6830 <__sflush_r+0x1bc>
    66b0:	02842803          	lw	a6,40(s0)
    66b4:	0e080463          	beqz	a6,679c <__sflush_r+0x128>
    66b8:	00912a23          	sw	s1,20(sp)
    66bc:	01371693          	sll	a3,a4,0x13
    66c0:	0009a483          	lw	s1,0(s3)
    66c4:	0009a023          	sw	zero,0(s3)
    66c8:	01c42583          	lw	a1,28(s0)
    66cc:	1606ce63          	bltz	a3,6848 <__sflush_r+0x1d4>
    66d0:	00000613          	li	a2,0
    66d4:	00100693          	li	a3,1
    66d8:	00098513          	mv	a0,s3
    66dc:	000800e7          	jalr	a6
    66e0:	fff00793          	li	a5,-1
    66e4:	00050613          	mv	a2,a0
    66e8:	1af50463          	beq	a0,a5,6890 <__sflush_r+0x21c>
    66ec:	00c41783          	lh	a5,12(s0)
    66f0:	02842803          	lw	a6,40(s0)
    66f4:	01c42583          	lw	a1,28(s0)
    66f8:	0047f793          	and	a5,a5,4
    66fc:	00078e63          	beqz	a5,6718 <__sflush_r+0xa4>
    6700:	00442703          	lw	a4,4(s0)
    6704:	03042783          	lw	a5,48(s0)
    6708:	40e60633          	sub	a2,a2,a4
    670c:	00078663          	beqz	a5,6718 <__sflush_r+0xa4>
    6710:	03c42783          	lw	a5,60(s0)
    6714:	40f60633          	sub	a2,a2,a5
    6718:	00000693          	li	a3,0
    671c:	00098513          	mv	a0,s3
    6720:	000800e7          	jalr	a6
    6724:	fff00793          	li	a5,-1
    6728:	12f51463          	bne	a0,a5,6850 <__sflush_r+0x1dc>
    672c:	0009a683          	lw	a3,0(s3)
    6730:	01d00793          	li	a5,29
    6734:	00c41703          	lh	a4,12(s0)
    6738:	16d7ea63          	bltu	a5,a3,68ac <__sflush_r+0x238>
    673c:	204007b7          	lui	a5,0x20400
    6740:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    6744:	00d7d7b3          	srl	a5,a5,a3
    6748:	0017f793          	and	a5,a5,1
    674c:	16078063          	beqz	a5,68ac <__sflush_r+0x238>
    6750:	01042603          	lw	a2,16(s0)
    6754:	fffff7b7          	lui	a5,0xfffff
    6758:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    675c:	00f777b3          	and	a5,a4,a5
    6760:	00f41623          	sh	a5,12(s0)
    6764:	00042223          	sw	zero,4(s0)
    6768:	00c42023          	sw	a2,0(s0)
    676c:	01371793          	sll	a5,a4,0x13
    6770:	0007d463          	bgez	a5,6778 <__sflush_r+0x104>
    6774:	10068263          	beqz	a3,6878 <__sflush_r+0x204>
    6778:	03042583          	lw	a1,48(s0)
    677c:	0099a023          	sw	s1,0(s3)
    6780:	10058463          	beqz	a1,6888 <__sflush_r+0x214>
    6784:	04040793          	add	a5,s0,64
    6788:	00f58663          	beq	a1,a5,6794 <__sflush_r+0x120>
    678c:	00098513          	mv	a0,s3
    6790:	c5dfa0ef          	jal	13ec <_free_r>
    6794:	01412483          	lw	s1,20(sp)
    6798:	02042823          	sw	zero,48(s0)
    679c:	00000513          	li	a0,0
    67a0:	01c12083          	lw	ra,28(sp)
    67a4:	01812403          	lw	s0,24(sp)
    67a8:	00c12983          	lw	s3,12(sp)
    67ac:	02010113          	add	sp,sp,32
    67b0:	00008067          	ret
    67b4:	01212823          	sw	s2,16(sp)
    67b8:	0105a903          	lw	s2,16(a1)
    67bc:	08090263          	beqz	s2,6840 <__sflush_r+0x1cc>
    67c0:	00912a23          	sw	s1,20(sp)
    67c4:	0005a483          	lw	s1,0(a1)
    67c8:	00377713          	and	a4,a4,3
    67cc:	0125a023          	sw	s2,0(a1)
    67d0:	412484b3          	sub	s1,s1,s2
    67d4:	00000793          	li	a5,0
    67d8:	00071463          	bnez	a4,67e0 <__sflush_r+0x16c>
    67dc:	0145a783          	lw	a5,20(a1)
    67e0:	00f42423          	sw	a5,8(s0)
    67e4:	00904863          	bgtz	s1,67f4 <__sflush_r+0x180>
    67e8:	0540006f          	j	683c <__sflush_r+0x1c8>
    67ec:	00a90933          	add	s2,s2,a0
    67f0:	04905663          	blez	s1,683c <__sflush_r+0x1c8>
    67f4:	02442783          	lw	a5,36(s0)
    67f8:	01c42583          	lw	a1,28(s0)
    67fc:	00048693          	mv	a3,s1
    6800:	00090613          	mv	a2,s2
    6804:	00098513          	mv	a0,s3
    6808:	000780e7          	jalr	a5
    680c:	40a484b3          	sub	s1,s1,a0
    6810:	fca04ee3          	bgtz	a0,67ec <__sflush_r+0x178>
    6814:	00c41703          	lh	a4,12(s0)
    6818:	01012903          	lw	s2,16(sp)
    681c:	04076713          	or	a4,a4,64
    6820:	01412483          	lw	s1,20(sp)
    6824:	00e41623          	sh	a4,12(s0)
    6828:	fff00513          	li	a0,-1
    682c:	f75ff06f          	j	67a0 <__sflush_r+0x12c>
    6830:	03c5a683          	lw	a3,60(a1)
    6834:	e6d04ee3          	bgtz	a3,66b0 <__sflush_r+0x3c>
    6838:	f65ff06f          	j	679c <__sflush_r+0x128>
    683c:	01412483          	lw	s1,20(sp)
    6840:	01012903          	lw	s2,16(sp)
    6844:	f59ff06f          	j	679c <__sflush_r+0x128>
    6848:	05042603          	lw	a2,80(s0)
    684c:	eadff06f          	j	66f8 <__sflush_r+0x84>
    6850:	00c41703          	lh	a4,12(s0)
    6854:	01042683          	lw	a3,16(s0)
    6858:	fffff7b7          	lui	a5,0xfffff
    685c:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6860:	00f777b3          	and	a5,a4,a5
    6864:	00f41623          	sh	a5,12(s0)
    6868:	00042223          	sw	zero,4(s0)
    686c:	00d42023          	sw	a3,0(s0)
    6870:	01371793          	sll	a5,a4,0x13
    6874:	f007d2e3          	bgez	a5,6778 <__sflush_r+0x104>
    6878:	03042583          	lw	a1,48(s0)
    687c:	04a42823          	sw	a0,80(s0)
    6880:	0099a023          	sw	s1,0(s3)
    6884:	f00590e3          	bnez	a1,6784 <__sflush_r+0x110>
    6888:	01412483          	lw	s1,20(sp)
    688c:	f11ff06f          	j	679c <__sflush_r+0x128>
    6890:	0009a783          	lw	a5,0(s3)
    6894:	e4078ce3          	beqz	a5,66ec <__sflush_r+0x78>
    6898:	01d00713          	li	a4,29
    689c:	00e78c63          	beq	a5,a4,68b4 <__sflush_r+0x240>
    68a0:	01600713          	li	a4,22
    68a4:	00e78863          	beq	a5,a4,68b4 <__sflush_r+0x240>
    68a8:	00c41703          	lh	a4,12(s0)
    68ac:	04076713          	or	a4,a4,64
    68b0:	f71ff06f          	j	6820 <__sflush_r+0x1ac>
    68b4:	0099a023          	sw	s1,0(s3)
    68b8:	01412483          	lw	s1,20(sp)
    68bc:	ee1ff06f          	j	679c <__sflush_r+0x128>

000068c0 <_fflush_r>:
    68c0:	ff010113          	add	sp,sp,-16
    68c4:	00812423          	sw	s0,8(sp)
    68c8:	00912223          	sw	s1,4(sp)
    68cc:	00112623          	sw	ra,12(sp)
    68d0:	01212023          	sw	s2,0(sp)
    68d4:	00050493          	mv	s1,a0
    68d8:	00058413          	mv	s0,a1
    68dc:	00050663          	beqz	a0,68e8 <_fflush_r+0x28>
    68e0:	03452783          	lw	a5,52(a0)
    68e4:	0a078a63          	beqz	a5,6998 <_fflush_r+0xd8>
    68e8:	00c41783          	lh	a5,12(s0)
    68ec:	00000913          	li	s2,0
    68f0:	04078063          	beqz	a5,6930 <_fflush_r+0x70>
    68f4:	06442703          	lw	a4,100(s0)
    68f8:	00177713          	and	a4,a4,1
    68fc:	00071663          	bnez	a4,6908 <_fflush_r+0x48>
    6900:	2007f793          	and	a5,a5,512
    6904:	04078463          	beqz	a5,694c <_fflush_r+0x8c>
    6908:	00040593          	mv	a1,s0
    690c:	00048513          	mv	a0,s1
    6910:	d65ff0ef          	jal	6674 <__sflush_r>
    6914:	06442783          	lw	a5,100(s0)
    6918:	00050913          	mv	s2,a0
    691c:	0017f793          	and	a5,a5,1
    6920:	00079863          	bnez	a5,6930 <_fflush_r+0x70>
    6924:	00c45783          	lhu	a5,12(s0)
    6928:	2007f793          	and	a5,a5,512
    692c:	04078463          	beqz	a5,6974 <_fflush_r+0xb4>
    6930:	00c12083          	lw	ra,12(sp)
    6934:	00812403          	lw	s0,8(sp)
    6938:	00412483          	lw	s1,4(sp)
    693c:	00090513          	mv	a0,s2
    6940:	00012903          	lw	s2,0(sp)
    6944:	01010113          	add	sp,sp,16
    6948:	00008067          	ret
    694c:	05842503          	lw	a0,88(s0)
    6950:	e44fa0ef          	jal	f94 <__retarget_lock_acquire_recursive>
    6954:	00040593          	mv	a1,s0
    6958:	00048513          	mv	a0,s1
    695c:	d19ff0ef          	jal	6674 <__sflush_r>
    6960:	06442783          	lw	a5,100(s0)
    6964:	00050913          	mv	s2,a0
    6968:	0017f793          	and	a5,a5,1
    696c:	fc0792e3          	bnez	a5,6930 <_fflush_r+0x70>
    6970:	fb5ff06f          	j	6924 <_fflush_r+0x64>
    6974:	05842503          	lw	a0,88(s0)
    6978:	e20fa0ef          	jal	f98 <__retarget_lock_release_recursive>
    697c:	00c12083          	lw	ra,12(sp)
    6980:	00812403          	lw	s0,8(sp)
    6984:	00412483          	lw	s1,4(sp)
    6988:	00090513          	mv	a0,s2
    698c:	00012903          	lw	s2,0(sp)
    6990:	01010113          	add	sp,sp,16
    6994:	00008067          	ret
    6998:	224000ef          	jal	6bbc <__sinit>
    699c:	f4dff06f          	j	68e8 <_fflush_r+0x28>

000069a0 <stdio_exit_handler>:
    69a0:	7fffa617          	auipc	a2,0x7fffa
    69a4:	b8860613          	add	a2,a2,-1144 # 80000528 <__sglue>
    69a8:	00004597          	auipc	a1,0x4
    69ac:	28c58593          	add	a1,a1,652 # ac34 <_fclose_r>
    69b0:	7fff9517          	auipc	a0,0x7fff9
    69b4:	65050513          	add	a0,a0,1616 # 80000000 <_impure_data>
    69b8:	7a00006f          	j	7158 <_fwalk_sglue>

000069bc <cleanup_stdio>:
    69bc:	00452583          	lw	a1,4(a0)
    69c0:	ff010113          	add	sp,sp,-16
    69c4:	00812423          	sw	s0,8(sp)
    69c8:	00112623          	sw	ra,12(sp)
    69cc:	7fffa797          	auipc	a5,0x7fffa
    69d0:	e1078793          	add	a5,a5,-496 # 800007dc <__sf>
    69d4:	00050413          	mv	s0,a0
    69d8:	00f58463          	beq	a1,a5,69e0 <cleanup_stdio+0x24>
    69dc:	258040ef          	jal	ac34 <_fclose_r>
    69e0:	00842583          	lw	a1,8(s0)
    69e4:	7fffa797          	auipc	a5,0x7fffa
    69e8:	e6078793          	add	a5,a5,-416 # 80000844 <__global_pointer+0x44>
    69ec:	00f58663          	beq	a1,a5,69f8 <cleanup_stdio+0x3c>
    69f0:	00040513          	mv	a0,s0
    69f4:	240040ef          	jal	ac34 <_fclose_r>
    69f8:	00c42583          	lw	a1,12(s0)
    69fc:	7fffa797          	auipc	a5,0x7fffa
    6a00:	eb078793          	add	a5,a5,-336 # 800008ac <__global_pointer+0xac>
    6a04:	00f58c63          	beq	a1,a5,6a1c <cleanup_stdio+0x60>
    6a08:	00040513          	mv	a0,s0
    6a0c:	00812403          	lw	s0,8(sp)
    6a10:	00c12083          	lw	ra,12(sp)
    6a14:	01010113          	add	sp,sp,16
    6a18:	21c0406f          	j	ac34 <_fclose_r>
    6a1c:	00c12083          	lw	ra,12(sp)
    6a20:	00812403          	lw	s0,8(sp)
    6a24:	01010113          	add	sp,sp,16
    6a28:	00008067          	ret

00006a2c <global_stdio_init.part.0>:
    6a2c:	fe010113          	add	sp,sp,-32
    6a30:	00000797          	auipc	a5,0x0
    6a34:	f7078793          	add	a5,a5,-144 # 69a0 <stdio_exit_handler>
    6a38:	00112e23          	sw	ra,28(sp)
    6a3c:	00812c23          	sw	s0,24(sp)
    6a40:	00912a23          	sw	s1,20(sp)
    6a44:	7fffa417          	auipc	s0,0x7fffa
    6a48:	d9840413          	add	s0,s0,-616 # 800007dc <__sf>
    6a4c:	01212823          	sw	s2,16(sp)
    6a50:	01312623          	sw	s3,12(sp)
    6a54:	01412423          	sw	s4,8(sp)
    6a58:	00800613          	li	a2,8
    6a5c:	00000593          	li	a1,0
    6a60:	7fffa717          	auipc	a4,0x7fffa
    6a64:	ccf72823          	sw	a5,-816(a4) # 80000730 <__stdio_exit_handler>
    6a68:	7fffa517          	auipc	a0,0x7fffa
    6a6c:	dd050513          	add	a0,a0,-560 # 80000838 <__global_pointer+0x38>
    6a70:	00400793          	li	a5,4
    6a74:	00f42623          	sw	a5,12(s0)
    6a78:	00042023          	sw	zero,0(s0)
    6a7c:	00042223          	sw	zero,4(s0)
    6a80:	00042423          	sw	zero,8(s0)
    6a84:	06042223          	sw	zero,100(s0)
    6a88:	00042823          	sw	zero,16(s0)
    6a8c:	00042a23          	sw	zero,20(s0)
    6a90:	00042c23          	sw	zero,24(s0)
    6a94:	d08fa0ef          	jal	f9c <memset>
    6a98:	00001a17          	auipc	s4,0x1
    6a9c:	870a0a13          	add	s4,s4,-1936 # 7308 <__sread>
    6aa0:	00001997          	auipc	s3,0x1
    6aa4:	8c498993          	add	s3,s3,-1852 # 7364 <__swrite>
    6aa8:	00001917          	auipc	s2,0x1
    6aac:	94490913          	add	s2,s2,-1724 # 73ec <__sseek>
    6ab0:	00001497          	auipc	s1,0x1
    6ab4:	9b448493          	add	s1,s1,-1612 # 7464 <__sclose>
    6ab8:	7fffa517          	auipc	a0,0x7fffa
    6abc:	d7c50513          	add	a0,a0,-644 # 80000834 <__global_pointer+0x34>
    6ac0:	03442023          	sw	s4,32(s0)
    6ac4:	03342223          	sw	s3,36(s0)
    6ac8:	03242423          	sw	s2,40(s0)
    6acc:	02942623          	sw	s1,44(s0)
    6ad0:	00842e23          	sw	s0,28(s0)
    6ad4:	cb8fa0ef          	jal	f8c <__retarget_lock_init_recursive>
    6ad8:	000107b7          	lui	a5,0x10
    6adc:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x651>
    6ae0:	00800613          	li	a2,8
    6ae4:	00000593          	li	a1,0
    6ae8:	7fffa517          	auipc	a0,0x7fffa
    6aec:	db850513          	add	a0,a0,-584 # 800008a0 <__global_pointer+0xa0>
    6af0:	06f42a23          	sw	a5,116(s0)
    6af4:	06042423          	sw	zero,104(s0)
    6af8:	06042623          	sw	zero,108(s0)
    6afc:	06042823          	sw	zero,112(s0)
    6b00:	0c042623          	sw	zero,204(s0)
    6b04:	06042c23          	sw	zero,120(s0)
    6b08:	06042e23          	sw	zero,124(s0)
    6b0c:	08042023          	sw	zero,128(s0)
    6b10:	c8cfa0ef          	jal	f9c <memset>
    6b14:	7fffa797          	auipc	a5,0x7fffa
    6b18:	d3078793          	add	a5,a5,-720 # 80000844 <__global_pointer+0x44>
    6b1c:	7fffa517          	auipc	a0,0x7fffa
    6b20:	d8050513          	add	a0,a0,-640 # 8000089c <__global_pointer+0x9c>
    6b24:	08f42223          	sw	a5,132(s0)
    6b28:	09442423          	sw	s4,136(s0)
    6b2c:	09342623          	sw	s3,140(s0)
    6b30:	09242823          	sw	s2,144(s0)
    6b34:	08942a23          	sw	s1,148(s0)
    6b38:	c54fa0ef          	jal	f8c <__retarget_lock_init_recursive>
    6b3c:	000207b7          	lui	a5,0x20
    6b40:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    6b44:	00800613          	li	a2,8
    6b48:	00000593          	li	a1,0
    6b4c:	7fffa517          	auipc	a0,0x7fffa
    6b50:	dbc50513          	add	a0,a0,-580 # 80000908 <__global_pointer+0x108>
    6b54:	0cf42e23          	sw	a5,220(s0)
    6b58:	0c042823          	sw	zero,208(s0)
    6b5c:	0c042a23          	sw	zero,212(s0)
    6b60:	0c042c23          	sw	zero,216(s0)
    6b64:	12042a23          	sw	zero,308(s0)
    6b68:	0e042023          	sw	zero,224(s0)
    6b6c:	0e042223          	sw	zero,228(s0)
    6b70:	0e042423          	sw	zero,232(s0)
    6b74:	c28fa0ef          	jal	f9c <memset>
    6b78:	7fffa797          	auipc	a5,0x7fffa
    6b7c:	d3478793          	add	a5,a5,-716 # 800008ac <__global_pointer+0xac>
    6b80:	0f442823          	sw	s4,240(s0)
    6b84:	0f342a23          	sw	s3,244(s0)
    6b88:	0f242c23          	sw	s2,248(s0)
    6b8c:	0e942e23          	sw	s1,252(s0)
    6b90:	0ef42623          	sw	a5,236(s0)
    6b94:	01812403          	lw	s0,24(sp)
    6b98:	01c12083          	lw	ra,28(sp)
    6b9c:	01412483          	lw	s1,20(sp)
    6ba0:	01012903          	lw	s2,16(sp)
    6ba4:	00c12983          	lw	s3,12(sp)
    6ba8:	00812a03          	lw	s4,8(sp)
    6bac:	7fffa517          	auipc	a0,0x7fffa
    6bb0:	d5850513          	add	a0,a0,-680 # 80000904 <__global_pointer+0x104>
    6bb4:	02010113          	add	sp,sp,32
    6bb8:	bd4fa06f          	j	f8c <__retarget_lock_init_recursive>

00006bbc <__sinit>:
    6bbc:	ff010113          	add	sp,sp,-16
    6bc0:	00812423          	sw	s0,8(sp)
    6bc4:	00050413          	mv	s0,a0
    6bc8:	7fffa517          	auipc	a0,0x7fffa
    6bcc:	b5850513          	add	a0,a0,-1192 # 80000720 <__lock___sfp_recursive_mutex>
    6bd0:	00112623          	sw	ra,12(sp)
    6bd4:	bc0fa0ef          	jal	f94 <__retarget_lock_acquire_recursive>
    6bd8:	03442783          	lw	a5,52(s0)
    6bdc:	00079e63          	bnez	a5,6bf8 <__sinit+0x3c>
    6be0:	00000797          	auipc	a5,0x0
    6be4:	ddc78793          	add	a5,a5,-548 # 69bc <cleanup_stdio>
    6be8:	02f42a23          	sw	a5,52(s0)
    6bec:	7fffa797          	auipc	a5,0x7fffa
    6bf0:	b447a783          	lw	a5,-1212(a5) # 80000730 <__stdio_exit_handler>
    6bf4:	00078e63          	beqz	a5,6c10 <__sinit+0x54>
    6bf8:	00812403          	lw	s0,8(sp)
    6bfc:	00c12083          	lw	ra,12(sp)
    6c00:	7fffa517          	auipc	a0,0x7fffa
    6c04:	b2050513          	add	a0,a0,-1248 # 80000720 <__lock___sfp_recursive_mutex>
    6c08:	01010113          	add	sp,sp,16
    6c0c:	b8cfa06f          	j	f98 <__retarget_lock_release_recursive>
    6c10:	e1dff0ef          	jal	6a2c <global_stdio_init.part.0>
    6c14:	00812403          	lw	s0,8(sp)
    6c18:	00c12083          	lw	ra,12(sp)
    6c1c:	7fffa517          	auipc	a0,0x7fffa
    6c20:	b0450513          	add	a0,a0,-1276 # 80000720 <__lock___sfp_recursive_mutex>
    6c24:	01010113          	add	sp,sp,16
    6c28:	b70fa06f          	j	f98 <__retarget_lock_release_recursive>

00006c2c <__sfp_lock_acquire>:
    6c2c:	7fffa517          	auipc	a0,0x7fffa
    6c30:	af450513          	add	a0,a0,-1292 # 80000720 <__lock___sfp_recursive_mutex>
    6c34:	b60fa06f          	j	f94 <__retarget_lock_acquire_recursive>

00006c38 <__sfp_lock_release>:
    6c38:	7fffa517          	auipc	a0,0x7fffa
    6c3c:	ae850513          	add	a0,a0,-1304 # 80000720 <__lock___sfp_recursive_mutex>
    6c40:	b58fa06f          	j	f98 <__retarget_lock_release_recursive>

00006c44 <__sfvwrite_r>:
    6c44:	00862783          	lw	a5,8(a2)
    6c48:	2c078463          	beqz	a5,6f10 <__sfvwrite_r+0x2cc>
    6c4c:	00c59683          	lh	a3,12(a1)
    6c50:	fd010113          	add	sp,sp,-48
    6c54:	02812423          	sw	s0,40(sp)
    6c58:	01412c23          	sw	s4,24(sp)
    6c5c:	01612823          	sw	s6,16(sp)
    6c60:	02112623          	sw	ra,44(sp)
    6c64:	0086f793          	and	a5,a3,8
    6c68:	00060b13          	mv	s6,a2
    6c6c:	00050a13          	mv	s4,a0
    6c70:	00058413          	mv	s0,a1
    6c74:	08078e63          	beqz	a5,6d10 <__sfvwrite_r+0xcc>
    6c78:	0105a783          	lw	a5,16(a1)
    6c7c:	08078a63          	beqz	a5,6d10 <__sfvwrite_r+0xcc>
    6c80:	02912223          	sw	s1,36(sp)
    6c84:	03212023          	sw	s2,32(sp)
    6c88:	01312e23          	sw	s3,28(sp)
    6c8c:	01512a23          	sw	s5,20(sp)
    6c90:	0026f793          	and	a5,a3,2
    6c94:	000b2483          	lw	s1,0(s6)
    6c98:	0a078463          	beqz	a5,6d40 <__sfvwrite_r+0xfc>
    6c9c:	02442783          	lw	a5,36(s0)
    6ca0:	01c42583          	lw	a1,28(s0)
    6ca4:	80000ab7          	lui	s5,0x80000
    6ca8:	00000993          	li	s3,0
    6cac:	00000913          	li	s2,0
    6cb0:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6cb4:	00098613          	mv	a2,s3
    6cb8:	000a0513          	mv	a0,s4
    6cbc:	04090263          	beqz	s2,6d00 <__sfvwrite_r+0xbc>
    6cc0:	00090693          	mv	a3,s2
    6cc4:	012af463          	bgeu	s5,s2,6ccc <__sfvwrite_r+0x88>
    6cc8:	000a8693          	mv	a3,s5
    6ccc:	000780e7          	jalr	a5
    6cd0:	46a05263          	blez	a0,7134 <__sfvwrite_r+0x4f0>
    6cd4:	008b2783          	lw	a5,8(s6)
    6cd8:	00a989b3          	add	s3,s3,a0
    6cdc:	40a90933          	sub	s2,s2,a0
    6ce0:	40a787b3          	sub	a5,a5,a0
    6ce4:	00fb2423          	sw	a5,8(s6)
    6ce8:	1a078663          	beqz	a5,6e94 <__sfvwrite_r+0x250>
    6cec:	02442783          	lw	a5,36(s0)
    6cf0:	01c42583          	lw	a1,28(s0)
    6cf4:	00098613          	mv	a2,s3
    6cf8:	000a0513          	mv	a0,s4
    6cfc:	fc0912e3          	bnez	s2,6cc0 <__sfvwrite_r+0x7c>
    6d00:	0004a983          	lw	s3,0(s1)
    6d04:	0044a903          	lw	s2,4(s1)
    6d08:	00848493          	add	s1,s1,8
    6d0c:	fa9ff06f          	j	6cb4 <__sfvwrite_r+0x70>
    6d10:	00040593          	mv	a1,s0
    6d14:	000a0513          	mv	a0,s4
    6d18:	0e5000ef          	jal	75fc <__swsetup_r>
    6d1c:	1c051c63          	bnez	a0,6ef4 <__sfvwrite_r+0x2b0>
    6d20:	00c41683          	lh	a3,12(s0)
    6d24:	02912223          	sw	s1,36(sp)
    6d28:	03212023          	sw	s2,32(sp)
    6d2c:	01312e23          	sw	s3,28(sp)
    6d30:	01512a23          	sw	s5,20(sp)
    6d34:	0026f793          	and	a5,a3,2
    6d38:	000b2483          	lw	s1,0(s6)
    6d3c:	f60790e3          	bnez	a5,6c9c <__sfvwrite_r+0x58>
    6d40:	01712623          	sw	s7,12(sp)
    6d44:	01812423          	sw	s8,8(sp)
    6d48:	0016f793          	and	a5,a3,1
    6d4c:	1c079663          	bnez	a5,6f18 <__sfvwrite_r+0x2d4>
    6d50:	00042783          	lw	a5,0(s0)
    6d54:	00842703          	lw	a4,8(s0)
    6d58:	80000ab7          	lui	s5,0x80000
    6d5c:	01912223          	sw	s9,4(sp)
    6d60:	00000b93          	li	s7,0
    6d64:	00000993          	li	s3,0
    6d68:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6d6c:	00078513          	mv	a0,a5
    6d70:	00070c13          	mv	s8,a4
    6d74:	10098263          	beqz	s3,6e78 <__sfvwrite_r+0x234>
    6d78:	2006f613          	and	a2,a3,512
    6d7c:	28060863          	beqz	a2,700c <__sfvwrite_r+0x3c8>
    6d80:	00070c93          	mv	s9,a4
    6d84:	32e9e863          	bltu	s3,a4,70b4 <__sfvwrite_r+0x470>
    6d88:	4806f713          	and	a4,a3,1152
    6d8c:	08070a63          	beqz	a4,6e20 <__sfvwrite_r+0x1dc>
    6d90:	01442603          	lw	a2,20(s0)
    6d94:	01042583          	lw	a1,16(s0)
    6d98:	00161713          	sll	a4,a2,0x1
    6d9c:	00c70733          	add	a4,a4,a2
    6da0:	40b78933          	sub	s2,a5,a1
    6da4:	01f75c13          	srl	s8,a4,0x1f
    6da8:	00ec0c33          	add	s8,s8,a4
    6dac:	00190793          	add	a5,s2,1
    6db0:	401c5c13          	sra	s8,s8,0x1
    6db4:	013787b3          	add	a5,a5,s3
    6db8:	000c0613          	mv	a2,s8
    6dbc:	00fc7663          	bgeu	s8,a5,6dc8 <__sfvwrite_r+0x184>
    6dc0:	00078c13          	mv	s8,a5
    6dc4:	00078613          	mv	a2,a5
    6dc8:	4006f693          	and	a3,a3,1024
    6dcc:	32068063          	beqz	a3,70ec <__sfvwrite_r+0x4a8>
    6dd0:	00060593          	mv	a1,a2
    6dd4:	000a0513          	mv	a0,s4
    6dd8:	921fa0ef          	jal	16f8 <_malloc_r>
    6ddc:	00050c93          	mv	s9,a0
    6de0:	34050e63          	beqz	a0,713c <__sfvwrite_r+0x4f8>
    6de4:	01042583          	lw	a1,16(s0)
    6de8:	00090613          	mv	a2,s2
    6dec:	a8cfa0ef          	jal	1078 <memcpy>
    6df0:	00c45783          	lhu	a5,12(s0)
    6df4:	b7f7f793          	and	a5,a5,-1153
    6df8:	0807e793          	or	a5,a5,128
    6dfc:	00f41623          	sh	a5,12(s0)
    6e00:	012c8533          	add	a0,s9,s2
    6e04:	412c07b3          	sub	a5,s8,s2
    6e08:	01942823          	sw	s9,16(s0)
    6e0c:	01842a23          	sw	s8,20(s0)
    6e10:	00a42023          	sw	a0,0(s0)
    6e14:	00098c13          	mv	s8,s3
    6e18:	00f42423          	sw	a5,8(s0)
    6e1c:	00098c93          	mv	s9,s3
    6e20:	000c8613          	mv	a2,s9
    6e24:	000b8593          	mv	a1,s7
    6e28:	6a9000ef          	jal	7cd0 <memmove>
    6e2c:	00842703          	lw	a4,8(s0)
    6e30:	00042783          	lw	a5,0(s0)
    6e34:	00098913          	mv	s2,s3
    6e38:	41870733          	sub	a4,a4,s8
    6e3c:	019787b3          	add	a5,a5,s9
    6e40:	00e42423          	sw	a4,8(s0)
    6e44:	00f42023          	sw	a5,0(s0)
    6e48:	00000993          	li	s3,0
    6e4c:	008b2783          	lw	a5,8(s6)
    6e50:	012b8bb3          	add	s7,s7,s2
    6e54:	412787b3          	sub	a5,a5,s2
    6e58:	00fb2423          	sw	a5,8(s6)
    6e5c:	02078663          	beqz	a5,6e88 <__sfvwrite_r+0x244>
    6e60:	00042783          	lw	a5,0(s0)
    6e64:	00842703          	lw	a4,8(s0)
    6e68:	00c41683          	lh	a3,12(s0)
    6e6c:	00078513          	mv	a0,a5
    6e70:	00070c13          	mv	s8,a4
    6e74:	f00992e3          	bnez	s3,6d78 <__sfvwrite_r+0x134>
    6e78:	0004ab83          	lw	s7,0(s1)
    6e7c:	0044a983          	lw	s3,4(s1)
    6e80:	00848493          	add	s1,s1,8
    6e84:	ee9ff06f          	j	6d6c <__sfvwrite_r+0x128>
    6e88:	00c12b83          	lw	s7,12(sp)
    6e8c:	00812c03          	lw	s8,8(sp)
    6e90:	00412c83          	lw	s9,4(sp)
    6e94:	02c12083          	lw	ra,44(sp)
    6e98:	02812403          	lw	s0,40(sp)
    6e9c:	02412483          	lw	s1,36(sp)
    6ea0:	02012903          	lw	s2,32(sp)
    6ea4:	01c12983          	lw	s3,28(sp)
    6ea8:	01412a83          	lw	s5,20(sp)
    6eac:	01812a03          	lw	s4,24(sp)
    6eb0:	01012b03          	lw	s6,16(sp)
    6eb4:	00000513          	li	a0,0
    6eb8:	03010113          	add	sp,sp,48
    6ebc:	00008067          	ret
    6ec0:	00040593          	mv	a1,s0
    6ec4:	000a0513          	mv	a0,s4
    6ec8:	9f9ff0ef          	jal	68c0 <_fflush_r>
    6ecc:	0a050e63          	beqz	a0,6f88 <__sfvwrite_r+0x344>
    6ed0:	00c41783          	lh	a5,12(s0)
    6ed4:	00c12b83          	lw	s7,12(sp)
    6ed8:	00812c03          	lw	s8,8(sp)
    6edc:	02412483          	lw	s1,36(sp)
    6ee0:	02012903          	lw	s2,32(sp)
    6ee4:	01c12983          	lw	s3,28(sp)
    6ee8:	01412a83          	lw	s5,20(sp)
    6eec:	0407e793          	or	a5,a5,64
    6ef0:	00f41623          	sh	a5,12(s0)
    6ef4:	02c12083          	lw	ra,44(sp)
    6ef8:	02812403          	lw	s0,40(sp)
    6efc:	01812a03          	lw	s4,24(sp)
    6f00:	01012b03          	lw	s6,16(sp)
    6f04:	fff00513          	li	a0,-1
    6f08:	03010113          	add	sp,sp,48
    6f0c:	00008067          	ret
    6f10:	00000513          	li	a0,0
    6f14:	00008067          	ret
    6f18:	00000a93          	li	s5,0
    6f1c:	00000513          	li	a0,0
    6f20:	00000c13          	li	s8,0
    6f24:	00000993          	li	s3,0
    6f28:	08098263          	beqz	s3,6fac <__sfvwrite_r+0x368>
    6f2c:	08050a63          	beqz	a0,6fc0 <__sfvwrite_r+0x37c>
    6f30:	000a8793          	mv	a5,s5
    6f34:	00098b93          	mv	s7,s3
    6f38:	0137f463          	bgeu	a5,s3,6f40 <__sfvwrite_r+0x2fc>
    6f3c:	00078b93          	mv	s7,a5
    6f40:	00042503          	lw	a0,0(s0)
    6f44:	01042783          	lw	a5,16(s0)
    6f48:	00842903          	lw	s2,8(s0)
    6f4c:	01442683          	lw	a3,20(s0)
    6f50:	00a7f663          	bgeu	a5,a0,6f5c <__sfvwrite_r+0x318>
    6f54:	00d90933          	add	s2,s2,a3
    6f58:	09794463          	blt	s2,s7,6fe0 <__sfvwrite_r+0x39c>
    6f5c:	16dbc263          	blt	s7,a3,70c0 <__sfvwrite_r+0x47c>
    6f60:	02442783          	lw	a5,36(s0)
    6f64:	01c42583          	lw	a1,28(s0)
    6f68:	000c0613          	mv	a2,s8
    6f6c:	000a0513          	mv	a0,s4
    6f70:	000780e7          	jalr	a5
    6f74:	00050913          	mv	s2,a0
    6f78:	f4a05ce3          	blez	a0,6ed0 <__sfvwrite_r+0x28c>
    6f7c:	412a8ab3          	sub	s5,s5,s2
    6f80:	00100513          	li	a0,1
    6f84:	f20a8ee3          	beqz	s5,6ec0 <__sfvwrite_r+0x27c>
    6f88:	008b2783          	lw	a5,8(s6)
    6f8c:	012c0c33          	add	s8,s8,s2
    6f90:	412989b3          	sub	s3,s3,s2
    6f94:	412787b3          	sub	a5,a5,s2
    6f98:	00fb2423          	sw	a5,8(s6)
    6f9c:	f80796e3          	bnez	a5,6f28 <__sfvwrite_r+0x2e4>
    6fa0:	00c12b83          	lw	s7,12(sp)
    6fa4:	00812c03          	lw	s8,8(sp)
    6fa8:	eedff06f          	j	6e94 <__sfvwrite_r+0x250>
    6fac:	0044a983          	lw	s3,4(s1)
    6fb0:	00048793          	mv	a5,s1
    6fb4:	00848493          	add	s1,s1,8
    6fb8:	fe098ae3          	beqz	s3,6fac <__sfvwrite_r+0x368>
    6fbc:	0007ac03          	lw	s8,0(a5)
    6fc0:	00098613          	mv	a2,s3
    6fc4:	00a00593          	li	a1,10
    6fc8:	000c0513          	mv	a0,s8
    6fcc:	1a1000ef          	jal	796c <memchr>
    6fd0:	14050c63          	beqz	a0,7128 <__sfvwrite_r+0x4e4>
    6fd4:	00150513          	add	a0,a0,1
    6fd8:	41850ab3          	sub	s5,a0,s8
    6fdc:	f55ff06f          	j	6f30 <__sfvwrite_r+0x2ec>
    6fe0:	000c0593          	mv	a1,s8
    6fe4:	00090613          	mv	a2,s2
    6fe8:	4e9000ef          	jal	7cd0 <memmove>
    6fec:	00042783          	lw	a5,0(s0)
    6ff0:	00040593          	mv	a1,s0
    6ff4:	000a0513          	mv	a0,s4
    6ff8:	012787b3          	add	a5,a5,s2
    6ffc:	00f42023          	sw	a5,0(s0)
    7000:	8c1ff0ef          	jal	68c0 <_fflush_r>
    7004:	f6050ce3          	beqz	a0,6f7c <__sfvwrite_r+0x338>
    7008:	ec9ff06f          	j	6ed0 <__sfvwrite_r+0x28c>
    700c:	01042683          	lw	a3,16(s0)
    7010:	04f6e463          	bltu	a3,a5,7058 <__sfvwrite_r+0x414>
    7014:	01442583          	lw	a1,20(s0)
    7018:	04b9e063          	bltu	s3,a1,7058 <__sfvwrite_r+0x414>
    701c:	00098913          	mv	s2,s3
    7020:	013af463          	bgeu	s5,s3,7028 <__sfvwrite_r+0x3e4>
    7024:	000a8913          	mv	s2,s5
    7028:	00090513          	mv	a0,s2
    702c:	65d070ef          	jal	ee88 <__modsi3>
    7030:	02442783          	lw	a5,36(s0)
    7034:	01c42583          	lw	a1,28(s0)
    7038:	40a906b3          	sub	a3,s2,a0
    703c:	000b8613          	mv	a2,s7
    7040:	000a0513          	mv	a0,s4
    7044:	000780e7          	jalr	a5
    7048:	00050913          	mv	s2,a0
    704c:	04a05a63          	blez	a0,70a0 <__sfvwrite_r+0x45c>
    7050:	412989b3          	sub	s3,s3,s2
    7054:	df9ff06f          	j	6e4c <__sfvwrite_r+0x208>
    7058:	00070913          	mv	s2,a4
    705c:	00e9f463          	bgeu	s3,a4,7064 <__sfvwrite_r+0x420>
    7060:	00098913          	mv	s2,s3
    7064:	00078513          	mv	a0,a5
    7068:	00090613          	mv	a2,s2
    706c:	000b8593          	mv	a1,s7
    7070:	461000ef          	jal	7cd0 <memmove>
    7074:	00842703          	lw	a4,8(s0)
    7078:	00042783          	lw	a5,0(s0)
    707c:	41270733          	sub	a4,a4,s2
    7080:	012787b3          	add	a5,a5,s2
    7084:	00e42423          	sw	a4,8(s0)
    7088:	00f42023          	sw	a5,0(s0)
    708c:	fc0712e3          	bnez	a4,7050 <__sfvwrite_r+0x40c>
    7090:	00040593          	mv	a1,s0
    7094:	000a0513          	mv	a0,s4
    7098:	829ff0ef          	jal	68c0 <_fflush_r>
    709c:	fa050ae3          	beqz	a0,7050 <__sfvwrite_r+0x40c>
    70a0:	00c41783          	lh	a5,12(s0)
    70a4:	00c12b83          	lw	s7,12(sp)
    70a8:	00812c03          	lw	s8,8(sp)
    70ac:	00412c83          	lw	s9,4(sp)
    70b0:	e2dff06f          	j	6edc <__sfvwrite_r+0x298>
    70b4:	00098c13          	mv	s8,s3
    70b8:	00098c93          	mv	s9,s3
    70bc:	d65ff06f          	j	6e20 <__sfvwrite_r+0x1dc>
    70c0:	000b8613          	mv	a2,s7
    70c4:	000c0593          	mv	a1,s8
    70c8:	409000ef          	jal	7cd0 <memmove>
    70cc:	00842703          	lw	a4,8(s0)
    70d0:	00042783          	lw	a5,0(s0)
    70d4:	000b8913          	mv	s2,s7
    70d8:	41770733          	sub	a4,a4,s7
    70dc:	017787b3          	add	a5,a5,s7
    70e0:	00e42423          	sw	a4,8(s0)
    70e4:	00f42023          	sw	a5,0(s0)
    70e8:	e95ff06f          	j	6f7c <__sfvwrite_r+0x338>
    70ec:	000a0513          	mv	a0,s4
    70f0:	508030ef          	jal	a5f8 <_realloc_r>
    70f4:	00050c93          	mv	s9,a0
    70f8:	d00514e3          	bnez	a0,6e00 <__sfvwrite_r+0x1bc>
    70fc:	01042583          	lw	a1,16(s0)
    7100:	000a0513          	mv	a0,s4
    7104:	ae8fa0ef          	jal	13ec <_free_r>
    7108:	00c41783          	lh	a5,12(s0)
    710c:	00c00713          	li	a4,12
    7110:	00c12b83          	lw	s7,12(sp)
    7114:	00812c03          	lw	s8,8(sp)
    7118:	00412c83          	lw	s9,4(sp)
    711c:	00ea2023          	sw	a4,0(s4)
    7120:	f7f7f793          	and	a5,a5,-129
    7124:	db9ff06f          	j	6edc <__sfvwrite_r+0x298>
    7128:	00198793          	add	a5,s3,1
    712c:	00078a93          	mv	s5,a5
    7130:	e05ff06f          	j	6f34 <__sfvwrite_r+0x2f0>
    7134:	00c41783          	lh	a5,12(s0)
    7138:	da5ff06f          	j	6edc <__sfvwrite_r+0x298>
    713c:	00c00713          	li	a4,12
    7140:	00c41783          	lh	a5,12(s0)
    7144:	00c12b83          	lw	s7,12(sp)
    7148:	00812c03          	lw	s8,8(sp)
    714c:	00412c83          	lw	s9,4(sp)
    7150:	00ea2023          	sw	a4,0(s4)
    7154:	d89ff06f          	j	6edc <__sfvwrite_r+0x298>

00007158 <_fwalk_sglue>:
    7158:	fd010113          	add	sp,sp,-48
    715c:	03212023          	sw	s2,32(sp)
    7160:	01312e23          	sw	s3,28(sp)
    7164:	01412c23          	sw	s4,24(sp)
    7168:	01512a23          	sw	s5,20(sp)
    716c:	01612823          	sw	s6,16(sp)
    7170:	01712623          	sw	s7,12(sp)
    7174:	02112623          	sw	ra,44(sp)
    7178:	02812423          	sw	s0,40(sp)
    717c:	02912223          	sw	s1,36(sp)
    7180:	00050b13          	mv	s6,a0
    7184:	00058b93          	mv	s7,a1
    7188:	00060a93          	mv	s5,a2
    718c:	00000a13          	li	s4,0
    7190:	00100993          	li	s3,1
    7194:	fff00913          	li	s2,-1
    7198:	004aa483          	lw	s1,4(s5)
    719c:	008aa403          	lw	s0,8(s5)
    71a0:	fff48493          	add	s1,s1,-1
    71a4:	0204c863          	bltz	s1,71d4 <_fwalk_sglue+0x7c>
    71a8:	00c45783          	lhu	a5,12(s0)
    71ac:	00f9fe63          	bgeu	s3,a5,71c8 <_fwalk_sglue+0x70>
    71b0:	00e41783          	lh	a5,14(s0)
    71b4:	00040593          	mv	a1,s0
    71b8:	000b0513          	mv	a0,s6
    71bc:	01278663          	beq	a5,s2,71c8 <_fwalk_sglue+0x70>
    71c0:	000b80e7          	jalr	s7
    71c4:	00aa6a33          	or	s4,s4,a0
    71c8:	fff48493          	add	s1,s1,-1
    71cc:	06840413          	add	s0,s0,104
    71d0:	fd249ce3          	bne	s1,s2,71a8 <_fwalk_sglue+0x50>
    71d4:	000aaa83          	lw	s5,0(s5)
    71d8:	fc0a90e3          	bnez	s5,7198 <_fwalk_sglue+0x40>
    71dc:	02c12083          	lw	ra,44(sp)
    71e0:	02812403          	lw	s0,40(sp)
    71e4:	02412483          	lw	s1,36(sp)
    71e8:	02012903          	lw	s2,32(sp)
    71ec:	01c12983          	lw	s3,28(sp)
    71f0:	01412a83          	lw	s5,20(sp)
    71f4:	01012b03          	lw	s6,16(sp)
    71f8:	00c12b83          	lw	s7,12(sp)
    71fc:	000a0513          	mv	a0,s4
    7200:	01812a03          	lw	s4,24(sp)
    7204:	03010113          	add	sp,sp,48
    7208:	00008067          	ret

0000720c <_putc_r>:
    720c:	fe010113          	add	sp,sp,-32
    7210:	00812c23          	sw	s0,24(sp)
    7214:	01212a23          	sw	s2,20(sp)
    7218:	00112e23          	sw	ra,28(sp)
    721c:	00050913          	mv	s2,a0
    7220:	00060413          	mv	s0,a2
    7224:	00050663          	beqz	a0,7230 <_putc_r+0x24>
    7228:	03452783          	lw	a5,52(a0)
    722c:	0c078663          	beqz	a5,72f8 <_putc_r+0xec>
    7230:	06442783          	lw	a5,100(s0)
    7234:	0017f793          	and	a5,a5,1
    7238:	00079863          	bnez	a5,7248 <_putc_r+0x3c>
    723c:	00c45783          	lhu	a5,12(s0)
    7240:	2007f793          	and	a5,a5,512
    7244:	08078063          	beqz	a5,72c4 <_putc_r+0xb8>
    7248:	00842783          	lw	a5,8(s0)
    724c:	fff78793          	add	a5,a5,-1
    7250:	00f42423          	sw	a5,8(s0)
    7254:	0007dc63          	bgez	a5,726c <_putc_r+0x60>
    7258:	01842703          	lw	a4,24(s0)
    725c:	04e7ca63          	blt	a5,a4,72b0 <_putc_r+0xa4>
    7260:	0ff5f793          	zext.b	a5,a1
    7264:	00a00713          	li	a4,10
    7268:	04e78463          	beq	a5,a4,72b0 <_putc_r+0xa4>
    726c:	00042783          	lw	a5,0(s0)
    7270:	0ff5f913          	zext.b	s2,a1
    7274:	00178713          	add	a4,a5,1
    7278:	00e42023          	sw	a4,0(s0)
    727c:	00b78023          	sb	a1,0(a5)
    7280:	06442783          	lw	a5,100(s0)
    7284:	0017f793          	and	a5,a5,1
    7288:	00079863          	bnez	a5,7298 <_putc_r+0x8c>
    728c:	00c45783          	lhu	a5,12(s0)
    7290:	2007f793          	and	a5,a5,512
    7294:	04078263          	beqz	a5,72d8 <_putc_r+0xcc>
    7298:	01c12083          	lw	ra,28(sp)
    729c:	01812403          	lw	s0,24(sp)
    72a0:	00090513          	mv	a0,s2
    72a4:	01412903          	lw	s2,20(sp)
    72a8:	02010113          	add	sp,sp,32
    72ac:	00008067          	ret
    72b0:	00090513          	mv	a0,s2
    72b4:	00040613          	mv	a2,s0
    72b8:	1b4000ef          	jal	746c <__swbuf_r>
    72bc:	00050913          	mv	s2,a0
    72c0:	fc1ff06f          	j	7280 <_putc_r+0x74>
    72c4:	05842503          	lw	a0,88(s0)
    72c8:	00b12623          	sw	a1,12(sp)
    72cc:	cc9f90ef          	jal	f94 <__retarget_lock_acquire_recursive>
    72d0:	00c12583          	lw	a1,12(sp)
    72d4:	f75ff06f          	j	7248 <_putc_r+0x3c>
    72d8:	05842503          	lw	a0,88(s0)
    72dc:	cbdf90ef          	jal	f98 <__retarget_lock_release_recursive>
    72e0:	01c12083          	lw	ra,28(sp)
    72e4:	01812403          	lw	s0,24(sp)
    72e8:	00090513          	mv	a0,s2
    72ec:	01412903          	lw	s2,20(sp)
    72f0:	02010113          	add	sp,sp,32
    72f4:	00008067          	ret
    72f8:	00b12623          	sw	a1,12(sp)
    72fc:	8c1ff0ef          	jal	6bbc <__sinit>
    7300:	00c12583          	lw	a1,12(sp)
    7304:	f2dff06f          	j	7230 <_putc_r+0x24>

00007308 <__sread>:
    7308:	ff010113          	add	sp,sp,-16
    730c:	00812423          	sw	s0,8(sp)
    7310:	00058413          	mv	s0,a1
    7314:	00e59583          	lh	a1,14(a1)
    7318:	00112623          	sw	ra,12(sp)
    731c:	095000ef          	jal	7bb0 <_read_r>
    7320:	02054063          	bltz	a0,7340 <__sread+0x38>
    7324:	05042783          	lw	a5,80(s0)
    7328:	00c12083          	lw	ra,12(sp)
    732c:	00a787b3          	add	a5,a5,a0
    7330:	04f42823          	sw	a5,80(s0)
    7334:	00812403          	lw	s0,8(sp)
    7338:	01010113          	add	sp,sp,16
    733c:	00008067          	ret
    7340:	00c45783          	lhu	a5,12(s0)
    7344:	fffff737          	lui	a4,0xfffff
    7348:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    734c:	00e7f7b3          	and	a5,a5,a4
    7350:	00c12083          	lw	ra,12(sp)
    7354:	00f41623          	sh	a5,12(s0)
    7358:	00812403          	lw	s0,8(sp)
    735c:	01010113          	add	sp,sp,16
    7360:	00008067          	ret

00007364 <__swrite>:
    7364:	00c59783          	lh	a5,12(a1)
    7368:	fe010113          	add	sp,sp,-32
    736c:	00812c23          	sw	s0,24(sp)
    7370:	00912a23          	sw	s1,20(sp)
    7374:	01212823          	sw	s2,16(sp)
    7378:	01312623          	sw	s3,12(sp)
    737c:	00112e23          	sw	ra,28(sp)
    7380:	1007f713          	and	a4,a5,256
    7384:	00058413          	mv	s0,a1
    7388:	00050493          	mv	s1,a0
    738c:	00060913          	mv	s2,a2
    7390:	00068993          	mv	s3,a3
    7394:	04071063          	bnez	a4,73d4 <__swrite+0x70>
    7398:	fffff737          	lui	a4,0xfffff
    739c:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    73a0:	00e7f7b3          	and	a5,a5,a4
    73a4:	00e41583          	lh	a1,14(s0)
    73a8:	00f41623          	sh	a5,12(s0)
    73ac:	01812403          	lw	s0,24(sp)
    73b0:	01c12083          	lw	ra,28(sp)
    73b4:	00098693          	mv	a3,s3
    73b8:	00090613          	mv	a2,s2
    73bc:	00c12983          	lw	s3,12(sp)
    73c0:	01012903          	lw	s2,16(sp)
    73c4:	00048513          	mv	a0,s1
    73c8:	01412483          	lw	s1,20(sp)
    73cc:	02010113          	add	sp,sp,32
    73d0:	09d0006f          	j	7c6c <_write_r>
    73d4:	00e59583          	lh	a1,14(a1)
    73d8:	00200693          	li	a3,2
    73dc:	00000613          	li	a2,0
    73e0:	76c000ef          	jal	7b4c <_lseek_r>
    73e4:	00c41783          	lh	a5,12(s0)
    73e8:	fb1ff06f          	j	7398 <__swrite+0x34>

000073ec <__sseek>:
    73ec:	ff010113          	add	sp,sp,-16
    73f0:	00812423          	sw	s0,8(sp)
    73f4:	00058413          	mv	s0,a1
    73f8:	00e59583          	lh	a1,14(a1)
    73fc:	00112623          	sw	ra,12(sp)
    7400:	74c000ef          	jal	7b4c <_lseek_r>
    7404:	fff00793          	li	a5,-1
    7408:	02f50863          	beq	a0,a5,7438 <__sseek+0x4c>
    740c:	00c45783          	lhu	a5,12(s0)
    7410:	00001737          	lui	a4,0x1
    7414:	00c12083          	lw	ra,12(sp)
    7418:	00e7e7b3          	or	a5,a5,a4
    741c:	01079793          	sll	a5,a5,0x10
    7420:	4107d793          	sra	a5,a5,0x10
    7424:	04a42823          	sw	a0,80(s0)
    7428:	00f41623          	sh	a5,12(s0)
    742c:	00812403          	lw	s0,8(sp)
    7430:	01010113          	add	sp,sp,16
    7434:	00008067          	ret
    7438:	00c45783          	lhu	a5,12(s0)
    743c:	fffff737          	lui	a4,0xfffff
    7440:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7444:	00e7f7b3          	and	a5,a5,a4
    7448:	01079793          	sll	a5,a5,0x10
    744c:	4107d793          	sra	a5,a5,0x10
    7450:	00c12083          	lw	ra,12(sp)
    7454:	00f41623          	sh	a5,12(s0)
    7458:	00812403          	lw	s0,8(sp)
    745c:	01010113          	add	sp,sp,16
    7460:	00008067          	ret

00007464 <__sclose>:
    7464:	00e59583          	lh	a1,14(a1)
    7468:	68c0006f          	j	7af4 <_close_r>

0000746c <__swbuf_r>:
    746c:	fe010113          	add	sp,sp,-32
    7470:	00812c23          	sw	s0,24(sp)
    7474:	00912a23          	sw	s1,20(sp)
    7478:	01212823          	sw	s2,16(sp)
    747c:	00112e23          	sw	ra,28(sp)
    7480:	00050913          	mv	s2,a0
    7484:	00058493          	mv	s1,a1
    7488:	00060413          	mv	s0,a2
    748c:	00050663          	beqz	a0,7498 <__swbuf_r+0x2c>
    7490:	03452783          	lw	a5,52(a0)
    7494:	16078063          	beqz	a5,75f4 <__swbuf_r+0x188>
    7498:	01842783          	lw	a5,24(s0)
    749c:	00c41703          	lh	a4,12(s0)
    74a0:	00f42423          	sw	a5,8(s0)
    74a4:	00877793          	and	a5,a4,8
    74a8:	08078063          	beqz	a5,7528 <__swbuf_r+0xbc>
    74ac:	01042783          	lw	a5,16(s0)
    74b0:	06078c63          	beqz	a5,7528 <__swbuf_r+0xbc>
    74b4:	01312623          	sw	s3,12(sp)
    74b8:	01271693          	sll	a3,a4,0x12
    74bc:	0ff4f993          	zext.b	s3,s1
    74c0:	0ff4f493          	zext.b	s1,s1
    74c4:	0806d863          	bgez	a3,7554 <__swbuf_r+0xe8>
    74c8:	00042703          	lw	a4,0(s0)
    74cc:	01442683          	lw	a3,20(s0)
    74d0:	40f707b3          	sub	a5,a4,a5
    74d4:	0ad7d863          	bge	a5,a3,7584 <__swbuf_r+0x118>
    74d8:	00842683          	lw	a3,8(s0)
    74dc:	00170613          	add	a2,a4,1
    74e0:	00c42023          	sw	a2,0(s0)
    74e4:	fff68693          	add	a3,a3,-1
    74e8:	00d42423          	sw	a3,8(s0)
    74ec:	01370023          	sb	s3,0(a4)
    74f0:	01442703          	lw	a4,20(s0)
    74f4:	00178793          	add	a5,a5,1
    74f8:	0cf70263          	beq	a4,a5,75bc <__swbuf_r+0x150>
    74fc:	00c45783          	lhu	a5,12(s0)
    7500:	0017f793          	and	a5,a5,1
    7504:	0c079a63          	bnez	a5,75d8 <__swbuf_r+0x16c>
    7508:	00c12983          	lw	s3,12(sp)
    750c:	01c12083          	lw	ra,28(sp)
    7510:	01812403          	lw	s0,24(sp)
    7514:	01012903          	lw	s2,16(sp)
    7518:	00048513          	mv	a0,s1
    751c:	01412483          	lw	s1,20(sp)
    7520:	02010113          	add	sp,sp,32
    7524:	00008067          	ret
    7528:	00040593          	mv	a1,s0
    752c:	00090513          	mv	a0,s2
    7530:	0cc000ef          	jal	75fc <__swsetup_r>
    7534:	08051e63          	bnez	a0,75d0 <__swbuf_r+0x164>
    7538:	00c41703          	lh	a4,12(s0)
    753c:	01312623          	sw	s3,12(sp)
    7540:	01042783          	lw	a5,16(s0)
    7544:	01271693          	sll	a3,a4,0x12
    7548:	0ff4f993          	zext.b	s3,s1
    754c:	0ff4f493          	zext.b	s1,s1
    7550:	f606cce3          	bltz	a3,74c8 <__swbuf_r+0x5c>
    7554:	06442683          	lw	a3,100(s0)
    7558:	ffffe637          	lui	a2,0xffffe
    755c:	000025b7          	lui	a1,0x2
    7560:	00b76733          	or	a4,a4,a1
    7564:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    7568:	00c6f6b3          	and	a3,a3,a2
    756c:	00e41623          	sh	a4,12(s0)
    7570:	00042703          	lw	a4,0(s0)
    7574:	06d42223          	sw	a3,100(s0)
    7578:	01442683          	lw	a3,20(s0)
    757c:	40f707b3          	sub	a5,a4,a5
    7580:	f4d7cce3          	blt	a5,a3,74d8 <__swbuf_r+0x6c>
    7584:	00040593          	mv	a1,s0
    7588:	00090513          	mv	a0,s2
    758c:	b34ff0ef          	jal	68c0 <_fflush_r>
    7590:	02051e63          	bnez	a0,75cc <__swbuf_r+0x160>
    7594:	00042703          	lw	a4,0(s0)
    7598:	00842683          	lw	a3,8(s0)
    759c:	00100793          	li	a5,1
    75a0:	00170613          	add	a2,a4,1
    75a4:	fff68693          	add	a3,a3,-1
    75a8:	00c42023          	sw	a2,0(s0)
    75ac:	00d42423          	sw	a3,8(s0)
    75b0:	01370023          	sb	s3,0(a4)
    75b4:	01442703          	lw	a4,20(s0)
    75b8:	f4f712e3          	bne	a4,a5,74fc <__swbuf_r+0x90>
    75bc:	00040593          	mv	a1,s0
    75c0:	00090513          	mv	a0,s2
    75c4:	afcff0ef          	jal	68c0 <_fflush_r>
    75c8:	f40500e3          	beqz	a0,7508 <__swbuf_r+0x9c>
    75cc:	00c12983          	lw	s3,12(sp)
    75d0:	fff00493          	li	s1,-1
    75d4:	f39ff06f          	j	750c <__swbuf_r+0xa0>
    75d8:	00a00793          	li	a5,10
    75dc:	f2f496e3          	bne	s1,a5,7508 <__swbuf_r+0x9c>
    75e0:	00040593          	mv	a1,s0
    75e4:	00090513          	mv	a0,s2
    75e8:	ad8ff0ef          	jal	68c0 <_fflush_r>
    75ec:	f0050ee3          	beqz	a0,7508 <__swbuf_r+0x9c>
    75f0:	fddff06f          	j	75cc <__swbuf_r+0x160>
    75f4:	dc8ff0ef          	jal	6bbc <__sinit>
    75f8:	ea1ff06f          	j	7498 <__swbuf_r+0x2c>

000075fc <__swsetup_r>:
    75fc:	ff010113          	add	sp,sp,-16
    7600:	00812423          	sw	s0,8(sp)
    7604:	00912223          	sw	s1,4(sp)
    7608:	00112623          	sw	ra,12(sp)
    760c:	7fff9797          	auipc	a5,0x7fff9
    7610:	0fc7a783          	lw	a5,252(a5) # 80000708 <_impure_ptr>
    7614:	00050493          	mv	s1,a0
    7618:	00058413          	mv	s0,a1
    761c:	00078663          	beqz	a5,7628 <__swsetup_r+0x2c>
    7620:	0347a703          	lw	a4,52(a5)
    7624:	0e070c63          	beqz	a4,771c <__swsetup_r+0x120>
    7628:	00c41783          	lh	a5,12(s0)
    762c:	0087f713          	and	a4,a5,8
    7630:	06070a63          	beqz	a4,76a4 <__swsetup_r+0xa8>
    7634:	01042703          	lw	a4,16(s0)
    7638:	08070663          	beqz	a4,76c4 <__swsetup_r+0xc8>
    763c:	0017f693          	and	a3,a5,1
    7640:	02068863          	beqz	a3,7670 <__swsetup_r+0x74>
    7644:	01442683          	lw	a3,20(s0)
    7648:	00042423          	sw	zero,8(s0)
    764c:	00000513          	li	a0,0
    7650:	40d006b3          	neg	a3,a3
    7654:	00d42c23          	sw	a3,24(s0)
    7658:	02070a63          	beqz	a4,768c <__swsetup_r+0x90>
    765c:	00c12083          	lw	ra,12(sp)
    7660:	00812403          	lw	s0,8(sp)
    7664:	00412483          	lw	s1,4(sp)
    7668:	01010113          	add	sp,sp,16
    766c:	00008067          	ret
    7670:	0027f693          	and	a3,a5,2
    7674:	00000613          	li	a2,0
    7678:	00069463          	bnez	a3,7680 <__swsetup_r+0x84>
    767c:	01442603          	lw	a2,20(s0)
    7680:	00c42423          	sw	a2,8(s0)
    7684:	00000513          	li	a0,0
    7688:	fc071ae3          	bnez	a4,765c <__swsetup_r+0x60>
    768c:	0807f713          	and	a4,a5,128
    7690:	fc0706e3          	beqz	a4,765c <__swsetup_r+0x60>
    7694:	0407e793          	or	a5,a5,64
    7698:	00f41623          	sh	a5,12(s0)
    769c:	fff00513          	li	a0,-1
    76a0:	fbdff06f          	j	765c <__swsetup_r+0x60>
    76a4:	0107f713          	and	a4,a5,16
    76a8:	08070063          	beqz	a4,7728 <__swsetup_r+0x12c>
    76ac:	0047f713          	and	a4,a5,4
    76b0:	02071c63          	bnez	a4,76e8 <__swsetup_r+0xec>
    76b4:	01042703          	lw	a4,16(s0)
    76b8:	0087e793          	or	a5,a5,8
    76bc:	00f41623          	sh	a5,12(s0)
    76c0:	f6071ee3          	bnez	a4,763c <__swsetup_r+0x40>
    76c4:	2807f693          	and	a3,a5,640
    76c8:	20000613          	li	a2,512
    76cc:	f6c688e3          	beq	a3,a2,763c <__swsetup_r+0x40>
    76d0:	00040593          	mv	a1,s0
    76d4:	00048513          	mv	a0,s1
    76d8:	6cc030ef          	jal	ada4 <__smakebuf_r>
    76dc:	00c41783          	lh	a5,12(s0)
    76e0:	01042703          	lw	a4,16(s0)
    76e4:	f59ff06f          	j	763c <__swsetup_r+0x40>
    76e8:	03042583          	lw	a1,48(s0)
    76ec:	00058e63          	beqz	a1,7708 <__swsetup_r+0x10c>
    76f0:	04040713          	add	a4,s0,64
    76f4:	00e58863          	beq	a1,a4,7704 <__swsetup_r+0x108>
    76f8:	00048513          	mv	a0,s1
    76fc:	cf1f90ef          	jal	13ec <_free_r>
    7700:	00c41783          	lh	a5,12(s0)
    7704:	02042823          	sw	zero,48(s0)
    7708:	01042703          	lw	a4,16(s0)
    770c:	fdb7f793          	and	a5,a5,-37
    7710:	00042223          	sw	zero,4(s0)
    7714:	00e42023          	sw	a4,0(s0)
    7718:	fa1ff06f          	j	76b8 <__swsetup_r+0xbc>
    771c:	00078513          	mv	a0,a5
    7720:	c9cff0ef          	jal	6bbc <__sinit>
    7724:	f05ff06f          	j	7628 <__swsetup_r+0x2c>
    7728:	00900713          	li	a4,9
    772c:	00e4a023          	sw	a4,0(s1)
    7730:	0407e793          	or	a5,a5,64
    7734:	00f41623          	sh	a5,12(s0)
    7738:	fff00513          	li	a0,-1
    773c:	f21ff06f          	j	765c <__swsetup_r+0x60>

00007740 <__fputwc>:
    7740:	fc010113          	add	sp,sp,-64
    7744:	02812c23          	sw	s0,56(sp)
    7748:	03412423          	sw	s4,40(sp)
    774c:	03512223          	sw	s5,36(sp)
    7750:	02112e23          	sw	ra,60(sp)
    7754:	02912a23          	sw	s1,52(sp)
    7758:	03312623          	sw	s3,44(sp)
    775c:	00050a13          	mv	s4,a0
    7760:	00058a93          	mv	s5,a1
    7764:	00060413          	mv	s0,a2
    7768:	374000ef          	jal	7adc <__locale_mb_cur_max>
    776c:	00100793          	li	a5,1
    7770:	02f51663          	bne	a0,a5,779c <__fputwc+0x5c>
    7774:	fffa8793          	add	a5,s5,-1
    7778:	0fe00713          	li	a4,254
    777c:	02f76063          	bltu	a4,a5,779c <__fputwc+0x5c>
    7780:	03212823          	sw	s2,48(sp)
    7784:	03612023          	sw	s6,32(sp)
    7788:	01712e23          	sw	s7,28(sp)
    778c:	01510423          	sb	s5,8(sp)
    7790:	00100993          	li	s3,1
    7794:	00810493          	add	s1,sp,8
    7798:	0380006f          	j	77d0 <__fputwc+0x90>
    779c:	00810493          	add	s1,sp,8
    77a0:	05c40693          	add	a3,s0,92
    77a4:	000a8613          	mv	a2,s5
    77a8:	00048593          	mv	a1,s1
    77ac:	000a0513          	mv	a0,s4
    77b0:	3e8030ef          	jal	ab98 <_wcrtomb_r>
    77b4:	fff00793          	li	a5,-1
    77b8:	00050993          	mv	s3,a0
    77bc:	0cf50a63          	beq	a0,a5,7890 <__fputwc+0x150>
    77c0:	0a050663          	beqz	a0,786c <__fputwc+0x12c>
    77c4:	03212823          	sw	s2,48(sp)
    77c8:	03612023          	sw	s6,32(sp)
    77cc:	01712e23          	sw	s7,28(sp)
    77d0:	00000913          	li	s2,0
    77d4:	fff00b13          	li	s6,-1
    77d8:	00a00b93          	li	s7,10
    77dc:	0200006f          	j	77fc <__fputwc+0xbc>
    77e0:	00042783          	lw	a5,0(s0)
    77e4:	00178693          	add	a3,a5,1
    77e8:	00d42023          	sw	a3,0(s0)
    77ec:	00e78023          	sb	a4,0(a5)
    77f0:	00190913          	add	s2,s2,1
    77f4:	00148493          	add	s1,s1,1
    77f8:	07397463          	bgeu	s2,s3,7860 <__fputwc+0x120>
    77fc:	00842783          	lw	a5,8(s0)
    7800:	0004c703          	lbu	a4,0(s1)
    7804:	fff78793          	add	a5,a5,-1
    7808:	00f42423          	sw	a5,8(s0)
    780c:	fc07dae3          	bgez	a5,77e0 <__fputwc+0xa0>
    7810:	01842683          	lw	a3,24(s0)
    7814:	00040613          	mv	a2,s0
    7818:	00070593          	mv	a1,a4
    781c:	000a0513          	mv	a0,s4
    7820:	00d7c463          	blt	a5,a3,7828 <__fputwc+0xe8>
    7824:	fb771ee3          	bne	a4,s7,77e0 <__fputwc+0xa0>
    7828:	c45ff0ef          	jal	746c <__swbuf_r>
    782c:	fd6512e3          	bne	a0,s6,77f0 <__fputwc+0xb0>
    7830:	03012903          	lw	s2,48(sp)
    7834:	02012b03          	lw	s6,32(sp)
    7838:	01c12b83          	lw	s7,28(sp)
    783c:	03c12083          	lw	ra,60(sp)
    7840:	03812403          	lw	s0,56(sp)
    7844:	03412483          	lw	s1,52(sp)
    7848:	02c12983          	lw	s3,44(sp)
    784c:	02812a03          	lw	s4,40(sp)
    7850:	02412a83          	lw	s5,36(sp)
    7854:	fff00513          	li	a0,-1
    7858:	04010113          	add	sp,sp,64
    785c:	00008067          	ret
    7860:	03012903          	lw	s2,48(sp)
    7864:	02012b03          	lw	s6,32(sp)
    7868:	01c12b83          	lw	s7,28(sp)
    786c:	03c12083          	lw	ra,60(sp)
    7870:	03812403          	lw	s0,56(sp)
    7874:	03412483          	lw	s1,52(sp)
    7878:	02c12983          	lw	s3,44(sp)
    787c:	02812a03          	lw	s4,40(sp)
    7880:	000a8513          	mv	a0,s5
    7884:	02412a83          	lw	s5,36(sp)
    7888:	04010113          	add	sp,sp,64
    788c:	00008067          	ret
    7890:	00c45783          	lhu	a5,12(s0)
    7894:	0407e793          	or	a5,a5,64
    7898:	00f41623          	sh	a5,12(s0)
    789c:	fa1ff06f          	j	783c <__fputwc+0xfc>

000078a0 <_fputwc_r>:
    78a0:	06462783          	lw	a5,100(a2)
    78a4:	fe010113          	add	sp,sp,-32
    78a8:	00812c23          	sw	s0,24(sp)
    78ac:	00912a23          	sw	s1,20(sp)
    78b0:	0017f713          	and	a4,a5,1
    78b4:	00112e23          	sw	ra,28(sp)
    78b8:	00c61783          	lh	a5,12(a2)
    78bc:	00060413          	mv	s0,a2
    78c0:	00050493          	mv	s1,a0
    78c4:	00071663          	bnez	a4,78d0 <_fputwc_r+0x30>
    78c8:	2007f713          	and	a4,a5,512
    78cc:	08070463          	beqz	a4,7954 <_fputwc_r+0xb4>
    78d0:	01279713          	sll	a4,a5,0x12
    78d4:	02074063          	bltz	a4,78f4 <_fputwc_r+0x54>
    78d8:	06442703          	lw	a4,100(s0)
    78dc:	000026b7          	lui	a3,0x2
    78e0:	00d7e7b3          	or	a5,a5,a3
    78e4:	000026b7          	lui	a3,0x2
    78e8:	00d76733          	or	a4,a4,a3
    78ec:	00f41623          	sh	a5,12(s0)
    78f0:	06e42223          	sw	a4,100(s0)
    78f4:	00048513          	mv	a0,s1
    78f8:	00040613          	mv	a2,s0
    78fc:	e45ff0ef          	jal	7740 <__fputwc>
    7900:	06442783          	lw	a5,100(s0)
    7904:	00050493          	mv	s1,a0
    7908:	0017f793          	and	a5,a5,1
    790c:	00079863          	bnez	a5,791c <_fputwc_r+0x7c>
    7910:	00c45783          	lhu	a5,12(s0)
    7914:	2007f793          	and	a5,a5,512
    7918:	00078e63          	beqz	a5,7934 <_fputwc_r+0x94>
    791c:	01c12083          	lw	ra,28(sp)
    7920:	01812403          	lw	s0,24(sp)
    7924:	00048513          	mv	a0,s1
    7928:	01412483          	lw	s1,20(sp)
    792c:	02010113          	add	sp,sp,32
    7930:	00008067          	ret
    7934:	05842503          	lw	a0,88(s0)
    7938:	e60f90ef          	jal	f98 <__retarget_lock_release_recursive>
    793c:	01c12083          	lw	ra,28(sp)
    7940:	01812403          	lw	s0,24(sp)
    7944:	00048513          	mv	a0,s1
    7948:	01412483          	lw	s1,20(sp)
    794c:	02010113          	add	sp,sp,32
    7950:	00008067          	ret
    7954:	05862503          	lw	a0,88(a2)
    7958:	00b12623          	sw	a1,12(sp)
    795c:	e38f90ef          	jal	f94 <__retarget_lock_acquire_recursive>
    7960:	00c41783          	lh	a5,12(s0)
    7964:	00c12583          	lw	a1,12(sp)
    7968:	f69ff06f          	j	78d0 <_fputwc_r+0x30>

0000796c <memchr>:
    796c:	00357793          	and	a5,a0,3
    7970:	0ff5f693          	zext.b	a3,a1
    7974:	02078a63          	beqz	a5,79a8 <memchr+0x3c>
    7978:	fff60793          	add	a5,a2,-1
    797c:	02060e63          	beqz	a2,79b8 <memchr+0x4c>
    7980:	fff00613          	li	a2,-1
    7984:	0180006f          	j	799c <memchr+0x30>
    7988:	00150513          	add	a0,a0,1
    798c:	00357713          	and	a4,a0,3
    7990:	00070e63          	beqz	a4,79ac <memchr+0x40>
    7994:	fff78793          	add	a5,a5,-1
    7998:	02c78063          	beq	a5,a2,79b8 <memchr+0x4c>
    799c:	00054703          	lbu	a4,0(a0)
    79a0:	fed714e3          	bne	a4,a3,7988 <memchr+0x1c>
    79a4:	00008067          	ret
    79a8:	00060793          	mv	a5,a2
    79ac:	00300713          	li	a4,3
    79b0:	00f76863          	bltu	a4,a5,79c0 <memchr+0x54>
    79b4:	06079063          	bnez	a5,7a14 <memchr+0xa8>
    79b8:	00000513          	li	a0,0
    79bc:	00008067          	ret
    79c0:	0ff5f593          	zext.b	a1,a1
    79c4:	00859713          	sll	a4,a1,0x8
    79c8:	00b705b3          	add	a1,a4,a1
    79cc:	01059713          	sll	a4,a1,0x10
    79d0:	feff08b7          	lui	a7,0xfeff0
    79d4:	80808837          	lui	a6,0x80808
    79d8:	00e585b3          	add	a1,a1,a4
    79dc:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    79e0:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    79e4:	00300313          	li	t1,3
    79e8:	0100006f          	j	79f8 <memchr+0x8c>
    79ec:	ffc78793          	add	a5,a5,-4
    79f0:	00450513          	add	a0,a0,4
    79f4:	fcf370e3          	bgeu	t1,a5,79b4 <memchr+0x48>
    79f8:	00052703          	lw	a4,0(a0)
    79fc:	00e5c733          	xor	a4,a1,a4
    7a00:	01170633          	add	a2,a4,a7
    7a04:	fff74713          	not	a4,a4
    7a08:	00e67733          	and	a4,a2,a4
    7a0c:	01077733          	and	a4,a4,a6
    7a10:	fc070ee3          	beqz	a4,79ec <memchr+0x80>
    7a14:	00f507b3          	add	a5,a0,a5
    7a18:	00c0006f          	j	7a24 <memchr+0xb8>
    7a1c:	00150513          	add	a0,a0,1
    7a20:	f8f50ce3          	beq	a0,a5,79b8 <memchr+0x4c>
    7a24:	00054703          	lbu	a4,0(a0)
    7a28:	fed71ae3          	bne	a4,a3,7a1c <memchr+0xb0>
    7a2c:	00008067          	ret

00007a30 <strncpy>:
    7a30:	00a5e7b3          	or	a5,a1,a0
    7a34:	0037f793          	and	a5,a5,3
    7a38:	00079663          	bnez	a5,7a44 <strncpy+0x14>
    7a3c:	00300793          	li	a5,3
    7a40:	04c7e663          	bltu	a5,a2,7a8c <strncpy+0x5c>
    7a44:	00050713          	mv	a4,a0
    7a48:	01c0006f          	j	7a64 <strncpy+0x34>
    7a4c:	fff5c683          	lbu	a3,-1(a1) # 1fff <_vfprintf_r+0x10f>
    7a50:	fff60813          	add	a6,a2,-1
    7a54:	fed78fa3          	sb	a3,-1(a5)
    7a58:	00068e63          	beqz	a3,7a74 <strncpy+0x44>
    7a5c:	00078713          	mv	a4,a5
    7a60:	00080613          	mv	a2,a6
    7a64:	00158593          	add	a1,a1,1
    7a68:	00170793          	add	a5,a4,1
    7a6c:	fe0610e3          	bnez	a2,7a4c <strncpy+0x1c>
    7a70:	00008067          	ret
    7a74:	00c70733          	add	a4,a4,a2
    7a78:	06080063          	beqz	a6,7ad8 <strncpy+0xa8>
    7a7c:	00178793          	add	a5,a5,1
    7a80:	fe078fa3          	sb	zero,-1(a5)
    7a84:	fee79ce3          	bne	a5,a4,7a7c <strncpy+0x4c>
    7a88:	00008067          	ret
    7a8c:	feff0337          	lui	t1,0xfeff0
    7a90:	808088b7          	lui	a7,0x80808
    7a94:	00050713          	mv	a4,a0
    7a98:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7a9c:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    7aa0:	00300e13          	li	t3,3
    7aa4:	0180006f          	j	7abc <strncpy+0x8c>
    7aa8:	00d72023          	sw	a3,0(a4)
    7aac:	ffc60613          	add	a2,a2,-4
    7ab0:	00470713          	add	a4,a4,4
    7ab4:	00458593          	add	a1,a1,4
    7ab8:	face76e3          	bgeu	t3,a2,7a64 <strncpy+0x34>
    7abc:	0005a683          	lw	a3,0(a1)
    7ac0:	006687b3          	add	a5,a3,t1
    7ac4:	fff6c813          	not	a6,a3
    7ac8:	0107f7b3          	and	a5,a5,a6
    7acc:	0117f7b3          	and	a5,a5,a7
    7ad0:	fc078ce3          	beqz	a5,7aa8 <strncpy+0x78>
    7ad4:	f91ff06f          	j	7a64 <strncpy+0x34>
    7ad8:	00008067          	ret

00007adc <__locale_mb_cur_max>:
    7adc:	7fff9517          	auipc	a0,0x7fff9
    7ae0:	b8054503          	lbu	a0,-1152(a0) # 8000065c <__global_locale+0x128>
    7ae4:	00008067          	ret

00007ae8 <_localeconv_r>:
    7ae8:	7fff9517          	auipc	a0,0x7fff9
    7aec:	b3c50513          	add	a0,a0,-1220 # 80000624 <__global_locale+0xf0>
    7af0:	00008067          	ret

00007af4 <_close_r>:
    7af4:	ff010113          	add	sp,sp,-16
    7af8:	00812423          	sw	s0,8(sp)
    7afc:	00050413          	mv	s0,a0
    7b00:	00058513          	mv	a0,a1
    7b04:	7fff9797          	auipc	a5,0x7fff9
    7b08:	c007aa23          	sw	zero,-1004(a5) # 80000718 <errno>
    7b0c:	00112623          	sw	ra,12(sp)
    7b10:	85cf90ef          	jal	b6c <_close>
    7b14:	fff00793          	li	a5,-1
    7b18:	00f50a63          	beq	a0,a5,7b2c <_close_r+0x38>
    7b1c:	00c12083          	lw	ra,12(sp)
    7b20:	00812403          	lw	s0,8(sp)
    7b24:	01010113          	add	sp,sp,16
    7b28:	00008067          	ret
    7b2c:	7fff9797          	auipc	a5,0x7fff9
    7b30:	bec7a783          	lw	a5,-1044(a5) # 80000718 <errno>
    7b34:	fe0784e3          	beqz	a5,7b1c <_close_r+0x28>
    7b38:	00c12083          	lw	ra,12(sp)
    7b3c:	00f42023          	sw	a5,0(s0)
    7b40:	00812403          	lw	s0,8(sp)
    7b44:	01010113          	add	sp,sp,16
    7b48:	00008067          	ret

00007b4c <_lseek_r>:
    7b4c:	ff010113          	add	sp,sp,-16
    7b50:	00058713          	mv	a4,a1
    7b54:	00812423          	sw	s0,8(sp)
    7b58:	00060593          	mv	a1,a2
    7b5c:	00050413          	mv	s0,a0
    7b60:	00068613          	mv	a2,a3
    7b64:	00070513          	mv	a0,a4
    7b68:	7fff9797          	auipc	a5,0x7fff9
    7b6c:	ba07a823          	sw	zero,-1104(a5) # 80000718 <errno>
    7b70:	00112623          	sw	ra,12(sp)
    7b74:	834f90ef          	jal	ba8 <_lseek>
    7b78:	fff00793          	li	a5,-1
    7b7c:	00f50a63          	beq	a0,a5,7b90 <_lseek_r+0x44>
    7b80:	00c12083          	lw	ra,12(sp)
    7b84:	00812403          	lw	s0,8(sp)
    7b88:	01010113          	add	sp,sp,16
    7b8c:	00008067          	ret
    7b90:	7fff9797          	auipc	a5,0x7fff9
    7b94:	b887a783          	lw	a5,-1144(a5) # 80000718 <errno>
    7b98:	fe0784e3          	beqz	a5,7b80 <_lseek_r+0x34>
    7b9c:	00c12083          	lw	ra,12(sp)
    7ba0:	00f42023          	sw	a5,0(s0)
    7ba4:	00812403          	lw	s0,8(sp)
    7ba8:	01010113          	add	sp,sp,16
    7bac:	00008067          	ret

00007bb0 <_read_r>:
    7bb0:	ff010113          	add	sp,sp,-16
    7bb4:	00058713          	mv	a4,a1
    7bb8:	00812423          	sw	s0,8(sp)
    7bbc:	00060593          	mv	a1,a2
    7bc0:	00050413          	mv	s0,a0
    7bc4:	00068613          	mv	a2,a3
    7bc8:	00070513          	mv	a0,a4
    7bcc:	7fff9797          	auipc	a5,0x7fff9
    7bd0:	b407a623          	sw	zero,-1204(a5) # 80000718 <errno>
    7bd4:	00112623          	sw	ra,12(sp)
    7bd8:	fd9f80ef          	jal	bb0 <_read>
    7bdc:	fff00793          	li	a5,-1
    7be0:	00f50a63          	beq	a0,a5,7bf4 <_read_r+0x44>
    7be4:	00c12083          	lw	ra,12(sp)
    7be8:	00812403          	lw	s0,8(sp)
    7bec:	01010113          	add	sp,sp,16
    7bf0:	00008067          	ret
    7bf4:	7fff9797          	auipc	a5,0x7fff9
    7bf8:	b247a783          	lw	a5,-1244(a5) # 80000718 <errno>
    7bfc:	fe0784e3          	beqz	a5,7be4 <_read_r+0x34>
    7c00:	00c12083          	lw	ra,12(sp)
    7c04:	00f42023          	sw	a5,0(s0)
    7c08:	00812403          	lw	s0,8(sp)
    7c0c:	01010113          	add	sp,sp,16
    7c10:	00008067          	ret

00007c14 <_sbrk_r>:
    7c14:	ff010113          	add	sp,sp,-16
    7c18:	00812423          	sw	s0,8(sp)
    7c1c:	00050413          	mv	s0,a0
    7c20:	00058513          	mv	a0,a1
    7c24:	7fff9797          	auipc	a5,0x7fff9
    7c28:	ae07aa23          	sw	zero,-1292(a5) # 80000718 <errno>
    7c2c:	00112623          	sw	ra,12(sp)
    7c30:	900f90ef          	jal	d30 <_sbrk>
    7c34:	fff00793          	li	a5,-1
    7c38:	00f50a63          	beq	a0,a5,7c4c <_sbrk_r+0x38>
    7c3c:	00c12083          	lw	ra,12(sp)
    7c40:	00812403          	lw	s0,8(sp)
    7c44:	01010113          	add	sp,sp,16
    7c48:	00008067          	ret
    7c4c:	7fff9797          	auipc	a5,0x7fff9
    7c50:	acc7a783          	lw	a5,-1332(a5) # 80000718 <errno>
    7c54:	fe0784e3          	beqz	a5,7c3c <_sbrk_r+0x28>
    7c58:	00c12083          	lw	ra,12(sp)
    7c5c:	00f42023          	sw	a5,0(s0)
    7c60:	00812403          	lw	s0,8(sp)
    7c64:	01010113          	add	sp,sp,16
    7c68:	00008067          	ret

00007c6c <_write_r>:
    7c6c:	ff010113          	add	sp,sp,-16
    7c70:	00058713          	mv	a4,a1
    7c74:	00812423          	sw	s0,8(sp)
    7c78:	00060593          	mv	a1,a2
    7c7c:	00050413          	mv	s0,a0
    7c80:	00068613          	mv	a2,a3
    7c84:	00070513          	mv	a0,a4
    7c88:	7fff9797          	auipc	a5,0x7fff9
    7c8c:	a807a823          	sw	zero,-1392(a5) # 80000718 <errno>
    7c90:	00112623          	sw	ra,12(sp)
    7c94:	ff9f80ef          	jal	c8c <_write>
    7c98:	fff00793          	li	a5,-1
    7c9c:	00f50a63          	beq	a0,a5,7cb0 <_write_r+0x44>
    7ca0:	00c12083          	lw	ra,12(sp)
    7ca4:	00812403          	lw	s0,8(sp)
    7ca8:	01010113          	add	sp,sp,16
    7cac:	00008067          	ret
    7cb0:	7fff9797          	auipc	a5,0x7fff9
    7cb4:	a687a783          	lw	a5,-1432(a5) # 80000718 <errno>
    7cb8:	fe0784e3          	beqz	a5,7ca0 <_write_r+0x34>
    7cbc:	00c12083          	lw	ra,12(sp)
    7cc0:	00f42023          	sw	a5,0(s0)
    7cc4:	00812403          	lw	s0,8(sp)
    7cc8:	01010113          	add	sp,sp,16
    7ccc:	00008067          	ret

00007cd0 <memmove>:
    7cd0:	02a5f663          	bgeu	a1,a0,7cfc <memmove+0x2c>
    7cd4:	00c58733          	add	a4,a1,a2
    7cd8:	02e57263          	bgeu	a0,a4,7cfc <memmove+0x2c>
    7cdc:	00c507b3          	add	a5,a0,a2
    7ce0:	04060663          	beqz	a2,7d2c <memmove+0x5c>
    7ce4:	fff74683          	lbu	a3,-1(a4)
    7ce8:	fff78793          	add	a5,a5,-1
    7cec:	fff70713          	add	a4,a4,-1
    7cf0:	00d78023          	sb	a3,0(a5)
    7cf4:	fef518e3          	bne	a0,a5,7ce4 <memmove+0x14>
    7cf8:	00008067          	ret
    7cfc:	00f00793          	li	a5,15
    7d00:	02c7e863          	bltu	a5,a2,7d30 <memmove+0x60>
    7d04:	00050793          	mv	a5,a0
    7d08:	fff60693          	add	a3,a2,-1
    7d0c:	0c060263          	beqz	a2,7dd0 <memmove+0x100>
    7d10:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x111>
    7d14:	00d786b3          	add	a3,a5,a3
    7d18:	0005c703          	lbu	a4,0(a1)
    7d1c:	00178793          	add	a5,a5,1
    7d20:	00158593          	add	a1,a1,1
    7d24:	fee78fa3          	sb	a4,-1(a5)
    7d28:	fed798e3          	bne	a5,a3,7d18 <memmove+0x48>
    7d2c:	00008067          	ret
    7d30:	00b567b3          	or	a5,a0,a1
    7d34:	0037f793          	and	a5,a5,3
    7d38:	08079663          	bnez	a5,7dc4 <memmove+0xf4>
    7d3c:	ff060893          	add	a7,a2,-16
    7d40:	ff08f893          	and	a7,a7,-16
    7d44:	01088893          	add	a7,a7,16
    7d48:	011506b3          	add	a3,a0,a7
    7d4c:	00058713          	mv	a4,a1
    7d50:	00050793          	mv	a5,a0
    7d54:	00072803          	lw	a6,0(a4)
    7d58:	01070713          	add	a4,a4,16
    7d5c:	01078793          	add	a5,a5,16
    7d60:	ff07a823          	sw	a6,-16(a5)
    7d64:	ff472803          	lw	a6,-12(a4)
    7d68:	ff07aa23          	sw	a6,-12(a5)
    7d6c:	ff872803          	lw	a6,-8(a4)
    7d70:	ff07ac23          	sw	a6,-8(a5)
    7d74:	ffc72803          	lw	a6,-4(a4)
    7d78:	ff07ae23          	sw	a6,-4(a5)
    7d7c:	fcd79ce3          	bne	a5,a3,7d54 <memmove+0x84>
    7d80:	00c67813          	and	a6,a2,12
    7d84:	011585b3          	add	a1,a1,a7
    7d88:	00f67713          	and	a4,a2,15
    7d8c:	04080463          	beqz	a6,7dd4 <memmove+0x104>
    7d90:	ffc70813          	add	a6,a4,-4
    7d94:	ffc87813          	and	a6,a6,-4
    7d98:	00480813          	add	a6,a6,4
    7d9c:	010687b3          	add	a5,a3,a6
    7da0:	00058713          	mv	a4,a1
    7da4:	00072883          	lw	a7,0(a4)
    7da8:	00468693          	add	a3,a3,4
    7dac:	00470713          	add	a4,a4,4
    7db0:	ff16ae23          	sw	a7,-4(a3)
    7db4:	fef698e3          	bne	a3,a5,7da4 <memmove+0xd4>
    7db8:	00367613          	and	a2,a2,3
    7dbc:	010585b3          	add	a1,a1,a6
    7dc0:	f49ff06f          	j	7d08 <memmove+0x38>
    7dc4:	fff60693          	add	a3,a2,-1
    7dc8:	00050793          	mv	a5,a0
    7dcc:	f45ff06f          	j	7d10 <memmove+0x40>
    7dd0:	00008067          	ret
    7dd4:	00070613          	mv	a2,a4
    7dd8:	f31ff06f          	j	7d08 <memmove+0x38>

00007ddc <frexp>:
    7ddc:	ff010113          	add	sp,sp,-16
    7de0:	00912223          	sw	s1,4(sp)
    7de4:	800004b7          	lui	s1,0x80000
    7de8:	00812423          	sw	s0,8(sp)
    7dec:	00112623          	sw	ra,12(sp)
    7df0:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7df4:	00060413          	mv	s0,a2
    7df8:	00062023          	sw	zero,0(a2)
    7dfc:	00b4f6b3          	and	a3,s1,a1
    7e00:	7ff00637          	lui	a2,0x7ff00
    7e04:	00058793          	mv	a5,a1
    7e08:	00050713          	mv	a4,a0
    7e0c:	04c6f063          	bgeu	a3,a2,7e4c <frexp+0x70>
    7e10:	00a6e633          	or	a2,a3,a0
    7e14:	02060c63          	beqz	a2,7e4c <frexp+0x70>
    7e18:	0145d613          	srl	a2,a1,0x14
    7e1c:	7ff67613          	and	a2,a2,2047
    7e20:	04060463          	beqz	a2,7e68 <frexp+0x8c>
    7e24:	00000593          	li	a1,0
    7e28:	80100637          	lui	a2,0x80100
    7e2c:	4146d693          	sra	a3,a3,0x14
    7e30:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7e34:	c0268693          	add	a3,a3,-1022
    7e38:	00c7f7b3          	and	a5,a5,a2
    7e3c:	00b686b3          	add	a3,a3,a1
    7e40:	3fe00637          	lui	a2,0x3fe00
    7e44:	00c7e7b3          	or	a5,a5,a2
    7e48:	00d42023          	sw	a3,0(s0)
    7e4c:	00c12083          	lw	ra,12(sp)
    7e50:	00812403          	lw	s0,8(sp)
    7e54:	00412483          	lw	s1,4(sp)
    7e58:	00070513          	mv	a0,a4
    7e5c:	00078593          	mv	a1,a5
    7e60:	01010113          	add	sp,sp,16
    7e64:	00008067          	ret
    7e68:	7fff9797          	auipc	a5,0x7fff9
    7e6c:	85878793          	add	a5,a5,-1960 # 800006c0 <__global_locale+0x18c>
    7e70:	0047a683          	lw	a3,4(a5)
    7e74:	0007a603          	lw	a2,0(a5)
    7e78:	009050ef          	jal	d680 <__muldf3>
    7e7c:	00058793          	mv	a5,a1
    7e80:	00b4f6b3          	and	a3,s1,a1
    7e84:	00050713          	mv	a4,a0
    7e88:	fca00593          	li	a1,-54
    7e8c:	f9dff06f          	j	7e28 <frexp+0x4c>

00007e90 <quorem>:
    7e90:	fb010113          	add	sp,sp,-80
    7e94:	04912223          	sw	s1,68(sp)
    7e98:	01052783          	lw	a5,16(a0)
    7e9c:	0105a483          	lw	s1,16(a1)
    7ea0:	04112623          	sw	ra,76(sp)
    7ea4:	00b12423          	sw	a1,8(sp)
    7ea8:	2097ca63          	blt	a5,s1,80bc <quorem+0x22c>
    7eac:	fff48493          	add	s1,s1,-1
    7eb0:	03512a23          	sw	s5,52(sp)
    7eb4:	03812423          	sw	s8,40(sp)
    7eb8:	00249a93          	sll	s5,s1,0x2
    7ebc:	01458c13          	add	s8,a1,20
    7ec0:	05212023          	sw	s2,64(sp)
    7ec4:	03312e23          	sw	s3,60(sp)
    7ec8:	015c0933          	add	s2,s8,s5
    7ecc:	01450993          	add	s3,a0,20
    7ed0:	015987b3          	add	a5,s3,s5
    7ed4:	03712623          	sw	s7,44(sp)
    7ed8:	00092b83          	lw	s7,0(s2)
    7edc:	03912223          	sw	s9,36(sp)
    7ee0:	0007ac83          	lw	s9,0(a5)
    7ee4:	001b8b93          	add	s7,s7,1
    7ee8:	03412c23          	sw	s4,56(sp)
    7eec:	000b8593          	mv	a1,s7
    7ef0:	00050a13          	mv	s4,a0
    7ef4:	000c8513          	mv	a0,s9
    7ef8:	04812423          	sw	s0,72(sp)
    7efc:	00f12623          	sw	a5,12(sp)
    7f00:	70d060ef          	jal	ee0c <__hidden___udivsi3>
    7f04:	00050413          	mv	s0,a0
    7f08:	0d7cee63          	bltu	s9,s7,7fe4 <quorem+0x154>
    7f0c:	03a12023          	sw	s10,32(sp)
    7f10:	00010d37          	lui	s10,0x10
    7f14:	01b12e23          	sw	s11,28(sp)
    7f18:	03612823          	sw	s6,48(sp)
    7f1c:	000c0a93          	mv	s5,s8
    7f20:	00098d93          	mv	s11,s3
    7f24:	00000c93          	li	s9,0
    7f28:	00000b93          	li	s7,0
    7f2c:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    7f30:	000aab03          	lw	s6,0(s5)
    7f34:	00040593          	mv	a1,s0
    7f38:	004d8d93          	add	s11,s11,4
    7f3c:	01ab7533          	and	a0,s6,s10
    7f40:	609060ef          	jal	ed48 <__mulsi3>
    7f44:	00050793          	mv	a5,a0
    7f48:	00040593          	mv	a1,s0
    7f4c:	010b5513          	srl	a0,s6,0x10
    7f50:	01978cb3          	add	s9,a5,s9
    7f54:	5f5060ef          	jal	ed48 <__mulsi3>
    7f58:	ffcda603          	lw	a2,-4(s11)
    7f5c:	01acf733          	and	a4,s9,s10
    7f60:	010cdc93          	srl	s9,s9,0x10
    7f64:	01a677b3          	and	a5,a2,s10
    7f68:	40e787b3          	sub	a5,a5,a4
    7f6c:	017787b3          	add	a5,a5,s7
    7f70:	01950533          	add	a0,a0,s9
    7f74:	4107d713          	sra	a4,a5,0x10
    7f78:	01a575b3          	and	a1,a0,s10
    7f7c:	01065613          	srl	a2,a2,0x10
    7f80:	40b70733          	sub	a4,a4,a1
    7f84:	00c70733          	add	a4,a4,a2
    7f88:	01a7f7b3          	and	a5,a5,s10
    7f8c:	01071613          	sll	a2,a4,0x10
    7f90:	00c7e7b3          	or	a5,a5,a2
    7f94:	004a8a93          	add	s5,s5,4
    7f98:	fefdae23          	sw	a5,-4(s11)
    7f9c:	01055c93          	srl	s9,a0,0x10
    7fa0:	41075b93          	sra	s7,a4,0x10
    7fa4:	f95976e3          	bgeu	s2,s5,7f30 <quorem+0xa0>
    7fa8:	00c12703          	lw	a4,12(sp)
    7fac:	00072783          	lw	a5,0(a4)
    7fb0:	12079063          	bnez	a5,80d0 <quorem+0x240>
    7fb4:	ffc70a93          	add	s5,a4,-4
    7fb8:	0159e863          	bltu	s3,s5,7fc8 <quorem+0x138>
    7fbc:	0180006f          	j	7fd4 <quorem+0x144>
    7fc0:	fff48493          	add	s1,s1,-1
    7fc4:	0159f863          	bgeu	s3,s5,7fd4 <quorem+0x144>
    7fc8:	000aa783          	lw	a5,0(s5)
    7fcc:	ffca8a93          	add	s5,s5,-4
    7fd0:	fe0788e3          	beqz	a5,7fc0 <quorem+0x130>
    7fd4:	03012b03          	lw	s6,48(sp)
    7fd8:	02012d03          	lw	s10,32(sp)
    7fdc:	01c12d83          	lw	s11,28(sp)
    7fe0:	009a2823          	sw	s1,16(s4)
    7fe4:	00812583          	lw	a1,8(sp)
    7fe8:	000a0513          	mv	a0,s4
    7fec:	1fc020ef          	jal	a1e8 <__mcmp>
    7ff0:	08054c63          	bltz	a0,8088 <quorem+0x1f8>
    7ff4:	00010537          	lui	a0,0x10
    7ff8:	00098593          	mv	a1,s3
    7ffc:	00000713          	li	a4,0
    8000:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    8004:	0005a683          	lw	a3,0(a1)
    8008:	000c2603          	lw	a2,0(s8)
    800c:	00458593          	add	a1,a1,4
    8010:	00a6f7b3          	and	a5,a3,a0
    8014:	00a67833          	and	a6,a2,a0
    8018:	410787b3          	sub	a5,a5,a6
    801c:	00e787b3          	add	a5,a5,a4
    8020:	4107d713          	sra	a4,a5,0x10
    8024:	01065613          	srl	a2,a2,0x10
    8028:	0106d693          	srl	a3,a3,0x10
    802c:	40c70733          	sub	a4,a4,a2
    8030:	00d70733          	add	a4,a4,a3
    8034:	01071693          	sll	a3,a4,0x10
    8038:	00a7f7b3          	and	a5,a5,a0
    803c:	00d7e7b3          	or	a5,a5,a3
    8040:	004c0c13          	add	s8,s8,4
    8044:	fef5ae23          	sw	a5,-4(a1)
    8048:	41075713          	sra	a4,a4,0x10
    804c:	fb897ce3          	bgeu	s2,s8,8004 <quorem+0x174>
    8050:	00249793          	sll	a5,s1,0x2
    8054:	00f987b3          	add	a5,s3,a5
    8058:	0007a703          	lw	a4,0(a5)
    805c:	02071463          	bnez	a4,8084 <quorem+0x1f4>
    8060:	ffc78793          	add	a5,a5,-4
    8064:	00f9e863          	bltu	s3,a5,8074 <quorem+0x1e4>
    8068:	0180006f          	j	8080 <quorem+0x1f0>
    806c:	fff48493          	add	s1,s1,-1
    8070:	00f9f863          	bgeu	s3,a5,8080 <quorem+0x1f0>
    8074:	0007a703          	lw	a4,0(a5)
    8078:	ffc78793          	add	a5,a5,-4
    807c:	fe0708e3          	beqz	a4,806c <quorem+0x1dc>
    8080:	009a2823          	sw	s1,16(s4)
    8084:	00140413          	add	s0,s0,1
    8088:	04c12083          	lw	ra,76(sp)
    808c:	00040513          	mv	a0,s0
    8090:	04812403          	lw	s0,72(sp)
    8094:	04012903          	lw	s2,64(sp)
    8098:	03c12983          	lw	s3,60(sp)
    809c:	03812a03          	lw	s4,56(sp)
    80a0:	03412a83          	lw	s5,52(sp)
    80a4:	02c12b83          	lw	s7,44(sp)
    80a8:	02812c03          	lw	s8,40(sp)
    80ac:	02412c83          	lw	s9,36(sp)
    80b0:	04412483          	lw	s1,68(sp)
    80b4:	05010113          	add	sp,sp,80
    80b8:	00008067          	ret
    80bc:	04c12083          	lw	ra,76(sp)
    80c0:	04412483          	lw	s1,68(sp)
    80c4:	00000513          	li	a0,0
    80c8:	05010113          	add	sp,sp,80
    80cc:	00008067          	ret
    80d0:	00812583          	lw	a1,8(sp)
    80d4:	000a0513          	mv	a0,s4
    80d8:	03012b03          	lw	s6,48(sp)
    80dc:	02012d03          	lw	s10,32(sp)
    80e0:	01c12d83          	lw	s11,28(sp)
    80e4:	104020ef          	jal	a1e8 <__mcmp>
    80e8:	f00556e3          	bgez	a0,7ff4 <quorem+0x164>
    80ec:	f9dff06f          	j	8088 <quorem+0x1f8>

000080f0 <_dtoa_r>:
    80f0:	03852303          	lw	t1,56(a0)
    80f4:	f5010113          	add	sp,sp,-176
    80f8:	0a812423          	sw	s0,168(sp)
    80fc:	0a912223          	sw	s1,164(sp)
    8100:	0b212023          	sw	s2,160(sp)
    8104:	09412c23          	sw	s4,152(sp)
    8108:	07b12e23          	sw	s11,124(sp)
    810c:	0a112623          	sw	ra,172(sp)
    8110:	09312e23          	sw	s3,156(sp)
    8114:	09512a23          	sw	s5,148(sp)
    8118:	00e12a23          	sw	a4,20(sp)
    811c:	00f12623          	sw	a5,12(sp)
    8120:	01112423          	sw	a7,8(sp)
    8124:	02b12223          	sw	a1,36(sp)
    8128:	00c12023          	sw	a2,0(sp)
    812c:	00050413          	mv	s0,a0
    8130:	00058d93          	mv	s11,a1
    8134:	00060493          	mv	s1,a2
    8138:	00068a13          	mv	s4,a3
    813c:	00080913          	mv	s2,a6
    8140:	02030263          	beqz	t1,8164 <_dtoa_r+0x74>
    8144:	03c52703          	lw	a4,60(a0)
    8148:	00100793          	li	a5,1
    814c:	00030593          	mv	a1,t1
    8150:	00e797b3          	sll	a5,a5,a4
    8154:	00e32223          	sw	a4,4(t1)
    8158:	00f32423          	sw	a5,8(t1)
    815c:	734010ef          	jal	9890 <_Bfree>
    8160:	02042c23          	sw	zero,56(s0)
    8164:	00048993          	mv	s3,s1
    8168:	00000693          	li	a3,0
    816c:	0004dc63          	bgez	s1,8184 <_dtoa_r+0x94>
    8170:	00149493          	sll	s1,s1,0x1
    8174:	0014d793          	srl	a5,s1,0x1
    8178:	00f12023          	sw	a5,0(sp)
    817c:	00078993          	mv	s3,a5
    8180:	00100693          	li	a3,1
    8184:	7ff00737          	lui	a4,0x7ff00
    8188:	00d92023          	sw	a3,0(s2)
    818c:	00e9f6b3          	and	a3,s3,a4
    8190:	64e68463          	beq	a3,a4,87d8 <_dtoa_r+0x6e8>
    8194:	00012483          	lw	s1,0(sp)
    8198:	000d8513          	mv	a0,s11
    819c:	00000613          	li	a2,0
    81a0:	00048593          	mv	a1,s1
    81a4:	00000693          	li	a3,0
    81a8:	01b12c23          	sw	s11,24(sp)
    81ac:	00912e23          	sw	s1,28(sp)
    81b0:	23c050ef          	jal	d3ec <__eqdf2>
    81b4:	04051c63          	bnez	a0,820c <_dtoa_r+0x11c>
    81b8:	00c12703          	lw	a4,12(sp)
    81bc:	00100793          	li	a5,1
    81c0:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    81c4:	00812703          	lw	a4,8(sp)
    81c8:	00070863          	beqz	a4,81d8 <_dtoa_r+0xe8>
    81cc:	00007797          	auipc	a5,0x7
    81d0:	f4978793          	add	a5,a5,-183 # f115 <__fini_array_end+0x1d5>
    81d4:	00f72023          	sw	a5,0(a4)
    81d8:	00007a97          	auipc	s5,0x7
    81dc:	f3ca8a93          	add	s5,s5,-196 # f114 <__fini_array_end+0x1d4>
    81e0:	0ac12083          	lw	ra,172(sp)
    81e4:	0a812403          	lw	s0,168(sp)
    81e8:	0a412483          	lw	s1,164(sp)
    81ec:	0a012903          	lw	s2,160(sp)
    81f0:	09c12983          	lw	s3,156(sp)
    81f4:	09812a03          	lw	s4,152(sp)
    81f8:	07c12d83          	lw	s11,124(sp)
    81fc:	000a8513          	mv	a0,s5
    8200:	09412a83          	lw	s5,148(sp)
    8204:	0b010113          	add	sp,sp,176
    8208:	00008067          	ret
    820c:	00048613          	mv	a2,s1
    8210:	06810713          	add	a4,sp,104
    8214:	06c10693          	add	a3,sp,108
    8218:	000d8593          	mv	a1,s11
    821c:	00040513          	mv	a0,s0
    8220:	09612823          	sw	s6,144(sp)
    8224:	09712623          	sw	s7,140(sp)
    8228:	09812423          	sw	s8,136(sp)
    822c:	09912223          	sw	s9,132(sp)
    8230:	09a12023          	sw	s10,128(sp)
    8234:	0149d913          	srl	s2,s3,0x14
    8238:	268020ef          	jal	a4a0 <__d2b>
    823c:	00050493          	mv	s1,a0
    8240:	5c091e63          	bnez	s2,881c <_dtoa_r+0x72c>
    8244:	06812a83          	lw	s5,104(sp)
    8248:	06c12903          	lw	s2,108(sp)
    824c:	02000793          	li	a5,32
    8250:	012a8933          	add	s2,s5,s2
    8254:	43290713          	add	a4,s2,1074
    8258:	36e7dae3          	bge	a5,a4,8dcc <_dtoa_r+0xcdc>
    825c:	04000793          	li	a5,64
    8260:	40e787b3          	sub	a5,a5,a4
    8264:	41290513          	add	a0,s2,1042
    8268:	00f997b3          	sll	a5,s3,a5
    826c:	00add533          	srl	a0,s11,a0
    8270:	00a7e533          	or	a0,a5,a0
    8274:	634060ef          	jal	e8a8 <__floatunsidf>
    8278:	fe1007b7          	lui	a5,0xfe100
    827c:	00100693          	li	a3,1
    8280:	00050713          	mv	a4,a0
    8284:	00b787b3          	add	a5,a5,a1
    8288:	fff90913          	add	s2,s2,-1
    828c:	02d12c23          	sw	a3,56(sp)
    8290:	7fff8697          	auipc	a3,0x7fff8
    8294:	43868693          	add	a3,a3,1080 # 800006c8 <__global_locale+0x194>
    8298:	0006a603          	lw	a2,0(a3)
    829c:	0046a683          	lw	a3,4(a3)
    82a0:	00070513          	mv	a0,a4
    82a4:	00078593          	mv	a1,a5
    82a8:	369050ef          	jal	de10 <__subdf3>
    82ac:	7fff8797          	auipc	a5,0x7fff8
    82b0:	42478793          	add	a5,a5,1060 # 800006d0 <__global_locale+0x19c>
    82b4:	0007a603          	lw	a2,0(a5)
    82b8:	0047a683          	lw	a3,4(a5)
    82bc:	3c4050ef          	jal	d680 <__muldf3>
    82c0:	7fff8797          	auipc	a5,0x7fff8
    82c4:	41878793          	add	a5,a5,1048 # 800006d8 <__global_locale+0x1a4>
    82c8:	0007a603          	lw	a2,0(a5)
    82cc:	0047a683          	lw	a3,4(a5)
    82d0:	7a9030ef          	jal	c278 <__adddf3>
    82d4:	00050b13          	mv	s6,a0
    82d8:	00090513          	mv	a0,s2
    82dc:	00058993          	mv	s3,a1
    82e0:	510060ef          	jal	e7f0 <__floatsidf>
    82e4:	7fff8797          	auipc	a5,0x7fff8
    82e8:	3fc78793          	add	a5,a5,1020 # 800006e0 <__global_locale+0x1ac>
    82ec:	0007a603          	lw	a2,0(a5)
    82f0:	0047a683          	lw	a3,4(a5)
    82f4:	38c050ef          	jal	d680 <__muldf3>
    82f8:	00050613          	mv	a2,a0
    82fc:	00058693          	mv	a3,a1
    8300:	000b0513          	mv	a0,s6
    8304:	00098593          	mv	a1,s3
    8308:	771030ef          	jal	c278 <__adddf3>
    830c:	00050b93          	mv	s7,a0
    8310:	00058b13          	mv	s6,a1
    8314:	458060ef          	jal	e76c <__fixdfsi>
    8318:	00050993          	mv	s3,a0
    831c:	000b0593          	mv	a1,s6
    8320:	000b8513          	mv	a0,s7
    8324:	00000613          	li	a2,0
    8328:	00000693          	li	a3,0
    832c:	24c050ef          	jal	d578 <__ledf2>
    8330:	02055063          	bgez	a0,8350 <_dtoa_r+0x260>
    8334:	00098513          	mv	a0,s3
    8338:	4b8060ef          	jal	e7f0 <__floatsidf>
    833c:	000b8613          	mv	a2,s7
    8340:	000b0693          	mv	a3,s6
    8344:	0a8050ef          	jal	d3ec <__eqdf2>
    8348:	00a03533          	snez	a0,a0
    834c:	40a989b3          	sub	s3,s3,a0
    8350:	412a8ab3          	sub	s5,s5,s2
    8354:	01600793          	li	a5,22
    8358:	fffa8b13          	add	s6,s5,-1
    835c:	2137e2e3          	bltu	a5,s3,8d60 <_dtoa_r+0xc70>
    8360:	00399713          	sll	a4,s3,0x3
    8364:	00007797          	auipc	a5,0x7
    8368:	44c78793          	add	a5,a5,1100 # f7b0 <__mprec_tens>
    836c:	00e787b3          	add	a5,a5,a4
    8370:	0007a603          	lw	a2,0(a5)
    8374:	0047a683          	lw	a3,4(a5)
    8378:	01812503          	lw	a0,24(sp)
    837c:	01c12583          	lw	a1,28(sp)
    8380:	1f8050ef          	jal	d578 <__ledf2>
    8384:	220554e3          	bgez	a0,8dac <_dtoa_r+0xcbc>
    8388:	fff98993          	add	s3,s3,-1
    838c:	02012a23          	sw	zero,52(sp)
    8390:	00012823          	sw	zero,16(sp)
    8394:	4a0b4863          	bltz	s6,8844 <_dtoa_r+0x754>
    8398:	4c09d063          	bgez	s3,8858 <_dtoa_r+0x768>
    839c:	01012783          	lw	a5,16(sp)
    83a0:	03312023          	sw	s3,32(sp)
    83a4:	413787b3          	sub	a5,a5,s3
    83a8:	00f12823          	sw	a5,16(sp)
    83ac:	413007b3          	neg	a5,s3
    83b0:	02f12823          	sw	a5,48(sp)
    83b4:	00900793          	li	a5,9
    83b8:	00000993          	li	s3,0
    83bc:	4b47e863          	bltu	a5,s4,886c <_dtoa_r+0x77c>
    83c0:	00500793          	li	a5,5
    83c4:	2147dae3          	bge	a5,s4,8dd8 <_dtoa_r+0xce8>
    83c8:	ffca0a13          	add	s4,s4,-4
    83cc:	00300793          	li	a5,3
    83d0:	00000913          	li	s2,0
    83d4:	66fa02e3          	beq	s4,a5,9238 <_dtoa_r+0x1148>
    83d8:	6147dae3          	bge	a5,s4,91ec <_dtoa_r+0x10fc>
    83dc:	00400793          	li	a5,4
    83e0:	54fa1ae3          	bne	s4,a5,9134 <_dtoa_r+0x1044>
    83e4:	00100793          	li	a5,1
    83e8:	02f12423          	sw	a5,40(sp)
    83ec:	01412603          	lw	a2,20(sp)
    83f0:	62c05ce3          	blez	a2,9228 <_dtoa_r+0x1138>
    83f4:	02c12e23          	sw	a2,60(sp)
    83f8:	00060c13          	mv	s8,a2
    83fc:	01700693          	li	a3,23
    8400:	00100713          	li	a4,1
    8404:	00400793          	li	a5,4
    8408:	00c6c463          	blt	a3,a2,8410 <_dtoa_r+0x320>
    840c:	3540106f          	j	9760 <_dtoa_r+0x1670>
    8410:	00179793          	sll	a5,a5,0x1
    8414:	01478693          	add	a3,a5,20
    8418:	00070593          	mv	a1,a4
    841c:	00170713          	add	a4,a4,1
    8420:	fed678e3          	bgeu	a2,a3,8410 <_dtoa_r+0x320>
    8424:	02b42e23          	sw	a1,60(s0)
    8428:	00040513          	mv	a0,s0
    842c:	3b0010ef          	jal	97dc <_Balloc>
    8430:	00050a93          	mv	s5,a0
    8434:	00051463          	bnez	a0,843c <_dtoa_r+0x34c>
    8438:	30c0106f          	j	9744 <_dtoa_r+0x1654>
    843c:	02a42c23          	sw	a0,56(s0)
    8440:	00e00793          	li	a5,14
    8444:	5187ea63          	bltu	a5,s8,8958 <_dtoa_r+0x868>
    8448:	50090863          	beqz	s2,8958 <_dtoa_r+0x868>
    844c:	02012783          	lw	a5,32(sp)
    8450:	62f054e3          	blez	a5,9278 <_dtoa_r+0x1188>
    8454:	00f7f713          	and	a4,a5,15
    8458:	00371713          	sll	a4,a4,0x3
    845c:	4047dc93          	sra	s9,a5,0x4
    8460:	00007797          	auipc	a5,0x7
    8464:	35078793          	add	a5,a5,848 # f7b0 <__mprec_tens>
    8468:	00e787b3          	add	a5,a5,a4
    846c:	010cf693          	and	a3,s9,16
    8470:	0007a803          	lw	a6,0(a5)
    8474:	0047a703          	lw	a4,4(a5)
    8478:	560682e3          	beqz	a3,91dc <_dtoa_r+0x10ec>
    847c:	00007797          	auipc	a5,0x7
    8480:	30c78793          	add	a5,a5,780 # f788 <__mprec_bigtens>
    8484:	0207a603          	lw	a2,32(a5)
    8488:	0247a683          	lw	a3,36(a5)
    848c:	01812503          	lw	a0,24(sp)
    8490:	01c12583          	lw	a1,28(sp)
    8494:	04e12423          	sw	a4,72(sp)
    8498:	05012023          	sw	a6,64(sp)
    849c:	6a4040ef          	jal	cb40 <__divdf3>
    84a0:	04012803          	lw	a6,64(sp)
    84a4:	04812703          	lw	a4,72(sp)
    84a8:	00fcfc93          	and	s9,s9,15
    84ac:	00050313          	mv	t1,a0
    84b0:	00058d13          	mv	s10,a1
    84b4:	00300913          	li	s2,3
    84b8:	040c8c63          	beqz	s9,8510 <_dtoa_r+0x420>
    84bc:	04812023          	sw	s0,64(sp)
    84c0:	00007b97          	auipc	s7,0x7
    84c4:	2c8b8b93          	add	s7,s7,712 # f788 <__mprec_bigtens>
    84c8:	00090413          	mv	s0,s2
    84cc:	00070593          	mv	a1,a4
    84d0:	00030913          	mv	s2,t1
    84d4:	001cf793          	and	a5,s9,1
    84d8:	00078e63          	beqz	a5,84f4 <_dtoa_r+0x404>
    84dc:	000ba603          	lw	a2,0(s7)
    84e0:	004ba683          	lw	a3,4(s7)
    84e4:	00080513          	mv	a0,a6
    84e8:	00140413          	add	s0,s0,1
    84ec:	194050ef          	jal	d680 <__muldf3>
    84f0:	00050813          	mv	a6,a0
    84f4:	401cdc93          	sra	s9,s9,0x1
    84f8:	008b8b93          	add	s7,s7,8
    84fc:	fc0c9ce3          	bnez	s9,84d4 <_dtoa_r+0x3e4>
    8500:	00090313          	mv	t1,s2
    8504:	00040913          	mv	s2,s0
    8508:	04012403          	lw	s0,64(sp)
    850c:	00058713          	mv	a4,a1
    8510:	00070693          	mv	a3,a4
    8514:	00080613          	mv	a2,a6
    8518:	00030513          	mv	a0,t1
    851c:	000d0593          	mv	a1,s10
    8520:	620040ef          	jal	cb40 <__divdf3>
    8524:	00050713          	mv	a4,a0
    8528:	00058793          	mv	a5,a1
    852c:	03412683          	lw	a3,52(sp)
    8530:	02068c63          	beqz	a3,8568 <_dtoa_r+0x478>
    8534:	7fff8697          	auipc	a3,0x7fff8
    8538:	1b468693          	add	a3,a3,436 # 800006e8 <__global_locale+0x1b4>
    853c:	0006a603          	lw	a2,0(a3)
    8540:	0046a683          	lw	a3,4(a3)
    8544:	00070513          	mv	a0,a4
    8548:	00078593          	mv	a1,a5
    854c:	04e12423          	sw	a4,72(sp)
    8550:	04f12023          	sw	a5,64(sp)
    8554:	024050ef          	jal	d578 <__ledf2>
    8558:	04012783          	lw	a5,64(sp)
    855c:	04812703          	lw	a4,72(sp)
    8560:	00055463          	bgez	a0,8568 <_dtoa_r+0x478>
    8564:	04c0106f          	j	95b0 <_dtoa_r+0x14c0>
    8568:	00090513          	mv	a0,s2
    856c:	04f12623          	sw	a5,76(sp)
    8570:	04e12023          	sw	a4,64(sp)
    8574:	27c060ef          	jal	e7f0 <__floatsidf>
    8578:	04012703          	lw	a4,64(sp)
    857c:	04c12783          	lw	a5,76(sp)
    8580:	00070613          	mv	a2,a4
    8584:	00078693          	mv	a3,a5
    8588:	04e12423          	sw	a4,72(sp)
    858c:	04f12023          	sw	a5,64(sp)
    8590:	0f0050ef          	jal	d680 <__muldf3>
    8594:	7fff8697          	auipc	a3,0x7fff8
    8598:	16468693          	add	a3,a3,356 # 800006f8 <__global_locale+0x1c4>
    859c:	0006a603          	lw	a2,0(a3)
    85a0:	0046a683          	lw	a3,4(a3)
    85a4:	4d5030ef          	jal	c278 <__adddf3>
    85a8:	fcc006b7          	lui	a3,0xfcc00
    85ac:	04012783          	lw	a5,64(sp)
    85b0:	04812703          	lw	a4,72(sp)
    85b4:	00050c93          	mv	s9,a0
    85b8:	00b68bb3          	add	s7,a3,a1
    85bc:	340c0463          	beqz	s8,8904 <_dtoa_r+0x814>
    85c0:	02012683          	lw	a3,32(sp)
    85c4:	05812423          	sw	s8,72(sp)
    85c8:	04d12e23          	sw	a3,92(sp)
    85cc:	00070513          	mv	a0,a4
    85d0:	00078593          	mv	a1,a5
    85d4:	04e12623          	sw	a4,76(sp)
    85d8:	04f12023          	sw	a5,64(sp)
    85dc:	190060ef          	jal	e76c <__fixdfsi>
    85e0:	04812783          	lw	a5,72(sp)
    85e4:	00050913          	mv	s2,a0
    85e8:	05912c23          	sw	s9,88(sp)
    85ec:	fff78693          	add	a3,a5,-1
    85f0:	00369693          	sll	a3,a3,0x3
    85f4:	00007797          	auipc	a5,0x7
    85f8:	1bc78793          	add	a5,a5,444 # f7b0 <__mprec_tens>
    85fc:	00d786b3          	add	a3,a5,a3
    8600:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    8604:	0046a803          	lw	a6,4(a3)
    8608:	001a8d13          	add	s10,s5,1
    860c:	04f12823          	sw	a5,80(sp)
    8610:	05012a23          	sw	a6,84(sp)
    8614:	1dc060ef          	jal	e7f0 <__floatsidf>
    8618:	04c12703          	lw	a4,76(sp)
    861c:	04012783          	lw	a5,64(sp)
    8620:	00050613          	mv	a2,a0
    8624:	00058693          	mv	a3,a1
    8628:	00070513          	mv	a0,a4
    862c:	00078593          	mv	a1,a5
    8630:	7e0050ef          	jal	de10 <__subdf3>
    8634:	02812703          	lw	a4,40(sp)
    8638:	03090313          	add	t1,s2,48
    863c:	05a12023          	sw	s10,64(sp)
    8640:	00050c93          	mv	s9,a0
    8644:	0ff37313          	zext.b	t1,t1
    8648:	5c0706e3          	beqz	a4,9414 <_dtoa_r+0x1324>
    864c:	7fff8797          	auipc	a5,0x7fff8
    8650:	06c78793          	add	a5,a5,108 # 800006b8 <__global_locale+0x184>
    8654:	0007a503          	lw	a0,0(a5)
    8658:	05012603          	lw	a2,80(sp)
    865c:	05412683          	lw	a3,84(sp)
    8660:	04b12023          	sw	a1,64(sp)
    8664:	0047a583          	lw	a1,4(a5)
    8668:	04612623          	sw	t1,76(sp)
    866c:	4d4040ef          	jal	cb40 <__divdf3>
    8670:	05812603          	lw	a2,88(sp)
    8674:	000b8693          	mv	a3,s7
    8678:	798050ef          	jal	de10 <__subdf3>
    867c:	04012883          	lw	a7,64(sp)
    8680:	04c12303          	lw	t1,76(sp)
    8684:	000c8613          	mv	a2,s9
    8688:	00088693          	mv	a3,a7
    868c:	006a8023          	sb	t1,0(s5)
    8690:	00050913          	mv	s2,a0
    8694:	00058b93          	mv	s7,a1
    8698:	5e1040ef          	jal	d478 <__gedf2>
    869c:	04012883          	lw	a7,64(sp)
    86a0:	00a05463          	blez	a0,86a8 <_dtoa_r+0x5b8>
    86a4:	7c90006f          	j	966c <_dtoa_r+0x157c>
    86a8:	7fff8697          	auipc	a3,0x7fff8
    86ac:	04068693          	add	a3,a3,64 # 800006e8 <__global_locale+0x1b4>
    86b0:	0006a783          	lw	a5,0(a3)
    86b4:	0046a803          	lw	a6,4(a3)
    86b8:	05312623          	sw	s3,76(sp)
    86bc:	04f12023          	sw	a5,64(sp)
    86c0:	00000793          	li	a5,0
    86c4:	05612823          	sw	s6,80(sp)
    86c8:	05812c23          	sw	s8,88(sp)
    86cc:	05012223          	sw	a6,68(sp)
    86d0:	04812c03          	lw	s8,72(sp)
    86d4:	00078b13          	mv	s6,a5
    86d8:	05412423          	sw	s4,72(sp)
    86dc:	00088993          	mv	s3,a7
    86e0:	0980006f          	j	8778 <_dtoa_r+0x688>
    86e4:	001b0b13          	add	s6,s6,1
    86e8:	018b4463          	blt	s6,s8,86f0 <_dtoa_r+0x600>
    86ec:	7d10006f          	j	96bc <_dtoa_r+0x15cc>
    86f0:	7fff8a17          	auipc	s4,0x7fff8
    86f4:	000a0a13          	mv	s4,s4
    86f8:	000a2603          	lw	a2,0(s4) # 800006f0 <__global_locale+0x1bc>
    86fc:	004a2683          	lw	a3,4(s4)
    8700:	00090513          	mv	a0,s2
    8704:	000b8593          	mv	a1,s7
    8708:	779040ef          	jal	d680 <__muldf3>
    870c:	000a2603          	lw	a2,0(s4)
    8710:	004a2683          	lw	a3,4(s4)
    8714:	00050913          	mv	s2,a0
    8718:	00058b93          	mv	s7,a1
    871c:	000c8513          	mv	a0,s9
    8720:	00098593          	mv	a1,s3
    8724:	75d040ef          	jal	d680 <__muldf3>
    8728:	00058c93          	mv	s9,a1
    872c:	00050a13          	mv	s4,a0
    8730:	03c060ef          	jal	e76c <__fixdfsi>
    8734:	00050993          	mv	s3,a0
    8738:	0b8060ef          	jal	e7f0 <__floatsidf>
    873c:	00050613          	mv	a2,a0
    8740:	00058693          	mv	a3,a1
    8744:	000a0513          	mv	a0,s4
    8748:	000c8593          	mv	a1,s9
    874c:	6c4050ef          	jal	de10 <__subdf3>
    8750:	03098793          	add	a5,s3,48
    8754:	00090613          	mv	a2,s2
    8758:	000b8693          	mv	a3,s7
    875c:	00fd0023          	sb	a5,0(s10)
    8760:	001d0d13          	add	s10,s10,1
    8764:	00050c93          	mv	s9,a0
    8768:	00058993          	mv	s3,a1
    876c:	60d040ef          	jal	d578 <__ledf2>
    8770:	00055463          	bgez	a0,8778 <_dtoa_r+0x688>
    8774:	6f90006f          	j	966c <_dtoa_r+0x157c>
    8778:	04012503          	lw	a0,64(sp)
    877c:	04412583          	lw	a1,68(sp)
    8780:	000c8613          	mv	a2,s9
    8784:	00098693          	mv	a3,s3
    8788:	688050ef          	jal	de10 <__subdf3>
    878c:	00090613          	mv	a2,s2
    8790:	000b8693          	mv	a3,s7
    8794:	5e5040ef          	jal	d578 <__ledf2>
    8798:	f40556e3          	bgez	a0,86e4 <_dtoa_r+0x5f4>
    879c:	05c12783          	lw	a5,92(sp)
    87a0:	000d0b93          	mv	s7,s10
    87a4:	00178c13          	add	s8,a5,1
    87a8:	03900613          	li	a2,57
    87ac:	0080006f          	j	87b4 <_dtoa_r+0x6c4>
    87b0:	697a88e3          	beq	s5,s7,9640 <_dtoa_r+0x1550>
    87b4:	fffbc683          	lbu	a3,-1(s7)
    87b8:	000b8d13          	mv	s10,s7
    87bc:	fffb8b93          	add	s7,s7,-1
    87c0:	fec688e3          	beq	a3,a2,87b0 <_dtoa_r+0x6c0>
    87c4:	00168693          	add	a3,a3,1
    87c8:	0ff6f693          	zext.b	a3,a3
    87cc:	00db8023          	sb	a3,0(s7)
    87d0:	000c0a13          	mv	s4,s8
    87d4:	4f00006f          	j	8cc4 <_dtoa_r+0xbd4>
    87d8:	00c12683          	lw	a3,12(sp)
    87dc:	00002737          	lui	a4,0x2
    87e0:	00c99793          	sll	a5,s3,0xc
    87e4:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x81f>
    87e8:	00c7d793          	srl	a5,a5,0xc
    87ec:	00e6a023          	sw	a4,0(a3)
    87f0:	01b7e7b3          	or	a5,a5,s11
    87f4:	0a078063          	beqz	a5,8894 <_dtoa_r+0x7a4>
    87f8:	00812783          	lw	a5,8(sp)
    87fc:	00007a97          	auipc	s5,0x7
    8800:	970a8a93          	add	s5,s5,-1680 # f16c <__fini_array_end+0x22c>
    8804:	9c078ee3          	beqz	a5,81e0 <_dtoa_r+0xf0>
    8808:	00007797          	auipc	a5,0x7
    880c:	96778793          	add	a5,a5,-1689 # f16f <__fini_array_end+0x22f>
    8810:	00812703          	lw	a4,8(sp)
    8814:	00f72023          	sw	a5,0(a4)
    8818:	9c9ff06f          	j	81e0 <_dtoa_r+0xf0>
    881c:	01c12783          	lw	a5,28(sp)
    8820:	3ff006b7          	lui	a3,0x3ff00
    8824:	06812a83          	lw	s5,104(sp)
    8828:	00c79793          	sll	a5,a5,0xc
    882c:	00c7d793          	srl	a5,a5,0xc
    8830:	01812703          	lw	a4,24(sp)
    8834:	00d7e7b3          	or	a5,a5,a3
    8838:	c0190913          	add	s2,s2,-1023
    883c:	02012c23          	sw	zero,56(sp)
    8840:	a51ff06f          	j	8290 <_dtoa_r+0x1a0>
    8844:	00100793          	li	a5,1
    8848:	415787b3          	sub	a5,a5,s5
    884c:	00f12823          	sw	a5,16(sp)
    8850:	00000b13          	li	s6,0
    8854:	b409c4e3          	bltz	s3,839c <_dtoa_r+0x2ac>
    8858:	03312023          	sw	s3,32(sp)
    885c:	02012823          	sw	zero,48(sp)
    8860:	00900793          	li	a5,9
    8864:	013b0b33          	add	s6,s6,s3
    8868:	b547fce3          	bgeu	a5,s4,83c0 <_dtoa_r+0x2d0>
    886c:	00100793          	li	a5,1
    8870:	00100913          	li	s2,1
    8874:	00000a13          	li	s4,0
    8878:	02f12423          	sw	a5,40(sp)
    887c:	fff00c13          	li	s8,-1
    8880:	00012a23          	sw	zero,20(sp)
    8884:	02042e23          	sw	zero,60(s0)
    8888:	03812e23          	sw	s8,60(sp)
    888c:	00000593          	li	a1,0
    8890:	b99ff06f          	j	8428 <_dtoa_r+0x338>
    8894:	00812703          	lw	a4,8(sp)
    8898:	00007a97          	auipc	s5,0x7
    889c:	8c8a8a93          	add	s5,s5,-1848 # f160 <__fini_array_end+0x220>
    88a0:	00007797          	auipc	a5,0x7
    88a4:	8c878793          	add	a5,a5,-1848 # f168 <__fini_array_end+0x228>
    88a8:	f60714e3          	bnez	a4,8810 <_dtoa_r+0x720>
    88ac:	935ff06f          	j	81e0 <_dtoa_r+0xf0>
    88b0:	00090513          	mv	a0,s2
    88b4:	04f12623          	sw	a5,76(sp)
    88b8:	04e12023          	sw	a4,64(sp)
    88bc:	735050ef          	jal	e7f0 <__floatsidf>
    88c0:	04012703          	lw	a4,64(sp)
    88c4:	04c12783          	lw	a5,76(sp)
    88c8:	00070613          	mv	a2,a4
    88cc:	00078693          	mv	a3,a5
    88d0:	04e12423          	sw	a4,72(sp)
    88d4:	04f12023          	sw	a5,64(sp)
    88d8:	5a9040ef          	jal	d680 <__muldf3>
    88dc:	7fff8697          	auipc	a3,0x7fff8
    88e0:	e1c68693          	add	a3,a3,-484 # 800006f8 <__global_locale+0x1c4>
    88e4:	0006a603          	lw	a2,0(a3)
    88e8:	0046a683          	lw	a3,4(a3)
    88ec:	18d030ef          	jal	c278 <__adddf3>
    88f0:	04012783          	lw	a5,64(sp)
    88f4:	04812703          	lw	a4,72(sp)
    88f8:	fcc006b7          	lui	a3,0xfcc00
    88fc:	00050c93          	mv	s9,a0
    8900:	00b68bb3          	add	s7,a3,a1
    8904:	7fff8697          	auipc	a3,0x7fff8
    8908:	dfc68693          	add	a3,a3,-516 # 80000700 <__global_locale+0x1cc>
    890c:	0006a603          	lw	a2,0(a3)
    8910:	0046a683          	lw	a3,4(a3)
    8914:	00070513          	mv	a0,a4
    8918:	00078593          	mv	a1,a5
    891c:	4f4050ef          	jal	de10 <__subdf3>
    8920:	000c8613          	mv	a2,s9
    8924:	000b8693          	mv	a3,s7
    8928:	00050d13          	mv	s10,a0
    892c:	00058913          	mv	s2,a1
    8930:	349040ef          	jal	d478 <__gedf2>
    8934:	50a04ce3          	bgtz	a0,964c <_dtoa_r+0x155c>
    8938:	800007b7          	lui	a5,0x80000
    893c:	0177c7b3          	xor	a5,a5,s7
    8940:	000c8613          	mv	a2,s9
    8944:	000d0513          	mv	a0,s10
    8948:	00078693          	mv	a3,a5
    894c:	00090593          	mv	a1,s2
    8950:	429040ef          	jal	d578 <__ledf2>
    8954:	06054c63          	bltz	a0,89cc <_dtoa_r+0x8dc>
    8958:	06c12783          	lw	a5,108(sp)
    895c:	1a07c663          	bltz	a5,8b08 <_dtoa_r+0xa18>
    8960:	02012683          	lw	a3,32(sp)
    8964:	00e00713          	li	a4,14
    8968:	1ad74063          	blt	a4,a3,8b08 <_dtoa_r+0xa18>
    896c:	02012783          	lw	a5,32(sp)
    8970:	00379713          	sll	a4,a5,0x3
    8974:	00007797          	auipc	a5,0x7
    8978:	e3c78793          	add	a5,a5,-452 # f7b0 <__mprec_tens>
    897c:	00e787b3          	add	a5,a5,a4
    8980:	0007a903          	lw	s2,0(a5)
    8984:	0047a983          	lw	s3,4(a5)
    8988:	01412783          	lw	a5,20(sp)
    898c:	0407dc63          	bgez	a5,89e4 <_dtoa_r+0x8f4>
    8990:	05804a63          	bgtz	s8,89e4 <_dtoa_r+0x8f4>
    8994:	020c1c63          	bnez	s8,89cc <_dtoa_r+0x8dc>
    8998:	7fff8797          	auipc	a5,0x7fff8
    899c:	d6878793          	add	a5,a5,-664 # 80000700 <__global_locale+0x1cc>
    89a0:	0007a603          	lw	a2,0(a5)
    89a4:	0047a683          	lw	a3,4(a5)
    89a8:	00090513          	mv	a0,s2
    89ac:	00098593          	mv	a1,s3
    89b0:	4d1040ef          	jal	d680 <__muldf3>
    89b4:	00050613          	mv	a2,a0
    89b8:	00058693          	mv	a3,a1
    89bc:	01812503          	lw	a0,24(sp)
    89c0:	01c12583          	lw	a1,28(sp)
    89c4:	3b5040ef          	jal	d578 <__ledf2>
    89c8:	48a042e3          	bgtz	a0,964c <_dtoa_r+0x155c>
    89cc:	000a8d13          	mv	s10,s5
    89d0:	00012c23          	sw	zero,24(sp)
    89d4:	00000913          	li	s2,0
    89d8:	01412783          	lw	a5,20(sp)
    89dc:	fff7ca13          	not	s4,a5
    89e0:	6980006f          	j	9078 <_dtoa_r+0xf88>
    89e4:	001a8793          	add	a5,s5,1
    89e8:	04f12023          	sw	a5,64(sp)
    89ec:	01812b03          	lw	s6,24(sp)
    89f0:	01c12a03          	lw	s4,28(sp)
    89f4:	00090613          	mv	a2,s2
    89f8:	00098693          	mv	a3,s3
    89fc:	000b0513          	mv	a0,s6
    8a00:	000a0593          	mv	a1,s4
    8a04:	13c040ef          	jal	cb40 <__divdf3>
    8a08:	565050ef          	jal	e76c <__fixdfsi>
    8a0c:	00050d13          	mv	s10,a0
    8a10:	5e1050ef          	jal	e7f0 <__floatsidf>
    8a14:	00090613          	mv	a2,s2
    8a18:	00098693          	mv	a3,s3
    8a1c:	465040ef          	jal	d680 <__muldf3>
    8a20:	00050613          	mv	a2,a0
    8a24:	00058693          	mv	a3,a1
    8a28:	000b0513          	mv	a0,s6
    8a2c:	000a0593          	mv	a1,s4
    8a30:	3e0050ef          	jal	de10 <__subdf3>
    8a34:	030d0793          	add	a5,s10,48
    8a38:	00fa8023          	sb	a5,0(s5)
    8a3c:	00100613          	li	a2,1
    8a40:	04012b83          	lw	s7,64(sp)
    8a44:	00050713          	mv	a4,a0
    8a48:	00058693          	mv	a3,a1
    8a4c:	0ccc0ee3          	beq	s8,a2,9328 <_dtoa_r+0x1238>
    8a50:	7fff8617          	auipc	a2,0x7fff8
    8a54:	ca060613          	add	a2,a2,-864 # 800006f0 <__global_locale+0x1bc>
    8a58:	00062783          	lw	a5,0(a2)
    8a5c:	00462803          	lw	a6,4(a2)
    8a60:	00100d93          	li	s11,1
    8a64:	00f12023          	sw	a5,0(sp)
    8a68:	01012223          	sw	a6,4(sp)
    8a6c:	0600006f          	j	8acc <_dtoa_r+0x9dc>
    8a70:	00090613          	mv	a2,s2
    8a74:	00098693          	mv	a3,s3
    8a78:	000b0513          	mv	a0,s6
    8a7c:	000a0593          	mv	a1,s4
    8a80:	0c0040ef          	jal	cb40 <__divdf3>
    8a84:	4e9050ef          	jal	e76c <__fixdfsi>
    8a88:	00050d13          	mv	s10,a0
    8a8c:	565050ef          	jal	e7f0 <__floatsidf>
    8a90:	00090613          	mv	a2,s2
    8a94:	00098693          	mv	a3,s3
    8a98:	3e9040ef          	jal	d680 <__muldf3>
    8a9c:	00058693          	mv	a3,a1
    8aa0:	00050613          	mv	a2,a0
    8aa4:	000a0593          	mv	a1,s4
    8aa8:	000b0513          	mv	a0,s6
    8aac:	364050ef          	jal	de10 <__subdf3>
    8ab0:	001b8b93          	add	s7,s7,1
    8ab4:	030d0793          	add	a5,s10,48
    8ab8:	001d8d93          	add	s11,s11,1
    8abc:	fefb8fa3          	sb	a5,-1(s7)
    8ac0:	00050713          	mv	a4,a0
    8ac4:	00058693          	mv	a3,a1
    8ac8:	07bc00e3          	beq	s8,s11,9328 <_dtoa_r+0x1238>
    8acc:	00012603          	lw	a2,0(sp)
    8ad0:	00068593          	mv	a1,a3
    8ad4:	00412683          	lw	a3,4(sp)
    8ad8:	00070513          	mv	a0,a4
    8adc:	3a5040ef          	jal	d680 <__muldf3>
    8ae0:	00000613          	li	a2,0
    8ae4:	00000693          	li	a3,0
    8ae8:	00050b13          	mv	s6,a0
    8aec:	00058a13          	mv	s4,a1
    8af0:	0fd040ef          	jal	d3ec <__eqdf2>
    8af4:	f6051ee3          	bnez	a0,8a70 <_dtoa_r+0x980>
    8af8:	02012783          	lw	a5,32(sp)
    8afc:	000b8d13          	mv	s10,s7
    8b00:	00178a13          	add	s4,a5,1
    8b04:	1c00006f          	j	8cc4 <_dtoa_r+0xbd4>
    8b08:	02812703          	lw	a4,40(sp)
    8b0c:	26071463          	bnez	a4,8d74 <_dtoa_r+0xc84>
    8b10:	03012b83          	lw	s7,48(sp)
    8b14:	01012c83          	lw	s9,16(sp)
    8b18:	02012423          	sw	zero,40(sp)
    8b1c:	00000913          	li	s2,0
    8b20:	020c8263          	beqz	s9,8b44 <_dtoa_r+0xa54>
    8b24:	03605063          	blez	s6,8b44 <_dtoa_r+0xa54>
    8b28:	000c8793          	mv	a5,s9
    8b2c:	679b4263          	blt	s6,s9,9190 <_dtoa_r+0x10a0>
    8b30:	01012703          	lw	a4,16(sp)
    8b34:	40fc8cb3          	sub	s9,s9,a5
    8b38:	40fb0b33          	sub	s6,s6,a5
    8b3c:	40f70733          	sub	a4,a4,a5
    8b40:	00e12823          	sw	a4,16(sp)
    8b44:	03012783          	lw	a5,48(sp)
    8b48:	02078263          	beqz	a5,8b6c <_dtoa_r+0xa7c>
    8b4c:	02812783          	lw	a5,40(sp)
    8b50:	00078463          	beqz	a5,8b58 <_dtoa_r+0xa68>
    8b54:	060b9ae3          	bnez	s7,93c8 <_dtoa_r+0x12d8>
    8b58:	03012603          	lw	a2,48(sp)
    8b5c:	00048593          	mv	a1,s1
    8b60:	00040513          	mv	a0,s0
    8b64:	3a4010ef          	jal	9f08 <__pow5mult>
    8b68:	00050493          	mv	s1,a0
    8b6c:	00100593          	li	a1,1
    8b70:	00040513          	mv	a0,s0
    8b74:	01c010ef          	jal	9b90 <__i2b>
    8b78:	00a12c23          	sw	a0,24(sp)
    8b7c:	50099a63          	bnez	s3,9090 <_dtoa_r+0xfa0>
    8b80:	00100793          	li	a5,1
    8b84:	5547da63          	bge	a5,s4,90d8 <_dtoa_r+0xfe8>
    8b88:	016787b3          	add	a5,a5,s6
    8b8c:	01f7f793          	and	a5,a5,31
    8b90:	1c078e63          	beqz	a5,8d6c <_dtoa_r+0xc7c>
    8b94:	02000713          	li	a4,32
    8b98:	40f70733          	sub	a4,a4,a5
    8b9c:	00400693          	li	a3,4
    8ba0:	58e6d263          	bge	a3,a4,9124 <_dtoa_r+0x1034>
    8ba4:	01c00713          	li	a4,28
    8ba8:	40f707b3          	sub	a5,a4,a5
    8bac:	01012703          	lw	a4,16(sp)
    8bb0:	00fc8cb3          	add	s9,s9,a5
    8bb4:	00fb0b33          	add	s6,s6,a5
    8bb8:	00f70733          	add	a4,a4,a5
    8bbc:	00e12823          	sw	a4,16(sp)
    8bc0:	01012783          	lw	a5,16(sp)
    8bc4:	12f04e63          	bgtz	a5,8d00 <_dtoa_r+0xc10>
    8bc8:	01605c63          	blez	s6,8be0 <_dtoa_r+0xaf0>
    8bcc:	01812583          	lw	a1,24(sp)
    8bd0:	000b0613          	mv	a2,s6
    8bd4:	00040513          	mv	a0,s0
    8bd8:	480010ef          	jal	a058 <__lshift>
    8bdc:	00a12c23          	sw	a0,24(sp)
    8be0:	03412783          	lw	a5,52(sp)
    8be4:	12079a63          	bnez	a5,8d18 <_dtoa_r+0xc28>
    8be8:	45805263          	blez	s8,902c <_dtoa_r+0xf3c>
    8bec:	02812783          	lw	a5,40(sp)
    8bf0:	24079e63          	bnez	a5,8e4c <_dtoa_r+0xd5c>
    8bf4:	02012783          	lw	a5,32(sp)
    8bf8:	00178a13          	add	s4,a5,1
    8bfc:	01812b03          	lw	s6,24(sp)
    8c00:	00100993          	li	s3,1
    8c04:	0200006f          	j	8c24 <_dtoa_r+0xb34>
    8c08:	00048593          	mv	a1,s1
    8c0c:	00000693          	li	a3,0
    8c10:	00a00613          	li	a2,10
    8c14:	00040513          	mv	a0,s0
    8c18:	49d000ef          	jal	98b4 <__multadd>
    8c1c:	00050493          	mv	s1,a0
    8c20:	00198993          	add	s3,s3,1
    8c24:	000b0593          	mv	a1,s6
    8c28:	00048513          	mv	a0,s1
    8c2c:	a64ff0ef          	jal	7e90 <quorem>
    8c30:	03050b93          	add	s7,a0,48
    8c34:	013a87b3          	add	a5,s5,s3
    8c38:	ff778fa3          	sb	s7,-1(a5)
    8c3c:	fd89c6e3          	blt	s3,s8,8c08 <_dtoa_r+0xb18>
    8c40:	00100993          	li	s3,1
    8c44:	55804263          	bgtz	s8,9188 <_dtoa_r+0x1098>
    8c48:	013a89b3          	add	s3,s5,s3
    8c4c:	00000c13          	li	s8,0
    8c50:	00048593          	mv	a1,s1
    8c54:	00100613          	li	a2,1
    8c58:	00040513          	mv	a0,s0
    8c5c:	3fc010ef          	jal	a058 <__lshift>
    8c60:	01812583          	lw	a1,24(sp)
    8c64:	00050493          	mv	s1,a0
    8c68:	580010ef          	jal	a1e8 <__mcmp>
    8c6c:	4ea05c63          	blez	a0,9164 <_dtoa_r+0x1074>
    8c70:	03900693          	li	a3,57
    8c74:	0080006f          	j	8c7c <_dtoa_r+0xb8c>
    8c78:	5f3a8863          	beq	s5,s3,9268 <_dtoa_r+0x1178>
    8c7c:	fff9c783          	lbu	a5,-1(s3)
    8c80:	00098d13          	mv	s10,s3
    8c84:	fff98993          	add	s3,s3,-1
    8c88:	fed788e3          	beq	a5,a3,8c78 <_dtoa_r+0xb88>
    8c8c:	00178793          	add	a5,a5,1
    8c90:	00f98023          	sb	a5,0(s3)
    8c94:	01812583          	lw	a1,24(sp)
    8c98:	00040513          	mv	a0,s0
    8c9c:	3f5000ef          	jal	9890 <_Bfree>
    8ca0:	02090263          	beqz	s2,8cc4 <_dtoa_r+0xbd4>
    8ca4:	000c0a63          	beqz	s8,8cb8 <_dtoa_r+0xbc8>
    8ca8:	012c0863          	beq	s8,s2,8cb8 <_dtoa_r+0xbc8>
    8cac:	000c0593          	mv	a1,s8
    8cb0:	00040513          	mv	a0,s0
    8cb4:	3dd000ef          	jal	9890 <_Bfree>
    8cb8:	00090593          	mv	a1,s2
    8cbc:	00040513          	mv	a0,s0
    8cc0:	3d1000ef          	jal	9890 <_Bfree>
    8cc4:	00048593          	mv	a1,s1
    8cc8:	00040513          	mv	a0,s0
    8ccc:	3c5000ef          	jal	9890 <_Bfree>
    8cd0:	00c12783          	lw	a5,12(sp)
    8cd4:	000d0023          	sb	zero,0(s10)
    8cd8:	0147a023          	sw	s4,0(a5)
    8cdc:	00812783          	lw	a5,8(sp)
    8ce0:	00078463          	beqz	a5,8ce8 <_dtoa_r+0xbf8>
    8ce4:	01a7a023          	sw	s10,0(a5)
    8ce8:	09012b03          	lw	s6,144(sp)
    8cec:	08c12b83          	lw	s7,140(sp)
    8cf0:	08812c03          	lw	s8,136(sp)
    8cf4:	08412c83          	lw	s9,132(sp)
    8cf8:	08012d03          	lw	s10,128(sp)
    8cfc:	ce4ff06f          	j	81e0 <_dtoa_r+0xf0>
    8d00:	00048593          	mv	a1,s1
    8d04:	00078613          	mv	a2,a5
    8d08:	00040513          	mv	a0,s0
    8d0c:	34c010ef          	jal	a058 <__lshift>
    8d10:	00050493          	mv	s1,a0
    8d14:	eb5ff06f          	j	8bc8 <_dtoa_r+0xad8>
    8d18:	01812583          	lw	a1,24(sp)
    8d1c:	00048513          	mv	a0,s1
    8d20:	4c8010ef          	jal	a1e8 <__mcmp>
    8d24:	ec0552e3          	bgez	a0,8be8 <_dtoa_r+0xaf8>
    8d28:	02012783          	lw	a5,32(sp)
    8d2c:	00048593          	mv	a1,s1
    8d30:	00000693          	li	a3,0
    8d34:	00a00613          	li	a2,10
    8d38:	00040513          	mv	a0,s0
    8d3c:	fff78b13          	add	s6,a5,-1
    8d40:	375000ef          	jal	98b4 <__multadd>
    8d44:	02812783          	lw	a5,40(sp)
    8d48:	00050493          	mv	s1,a0
    8d4c:	0c079e63          	bnez	a5,8e28 <_dtoa_r+0xd38>
    8d50:	03c12c03          	lw	s8,60(sp)
    8d54:	17805ee3          	blez	s8,96d0 <_dtoa_r+0x15e0>
    8d58:	02012a03          	lw	s4,32(sp)
    8d5c:	ea1ff06f          	j	8bfc <_dtoa_r+0xb0c>
    8d60:	00100793          	li	a5,1
    8d64:	02f12a23          	sw	a5,52(sp)
    8d68:	e28ff06f          	j	8390 <_dtoa_r+0x2a0>
    8d6c:	01c00793          	li	a5,28
    8d70:	e3dff06f          	j	8bac <_dtoa_r+0xabc>
    8d74:	00100713          	li	a4,1
    8d78:	4d475463          	bge	a4,s4,9240 <_dtoa_r+0x1150>
    8d7c:	03012783          	lw	a5,48(sp)
    8d80:	fffc0b93          	add	s7,s8,-1
    8d84:	4177ca63          	blt	a5,s7,9198 <_dtoa_r+0x10a8>
    8d88:	41778bb3          	sub	s7,a5,s7
    8d8c:	01012783          	lw	a5,16(sp)
    8d90:	41878cb3          	sub	s9,a5,s8
    8d94:	100c54e3          	bgez	s8,969c <_dtoa_r+0x15ac>
    8d98:	00100593          	li	a1,1
    8d9c:	00040513          	mv	a0,s0
    8da0:	5f1000ef          	jal	9b90 <__i2b>
    8da4:	00050913          	mv	s2,a0
    8da8:	d79ff06f          	j	8b20 <_dtoa_r+0xa30>
    8dac:	02012a23          	sw	zero,52(sp)
    8db0:	00012823          	sw	zero,16(sp)
    8db4:	ab5042e3          	bgtz	s5,8858 <_dtoa_r+0x768>
    8db8:	00100793          	li	a5,1
    8dbc:	415787b3          	sub	a5,a5,s5
    8dc0:	00f12823          	sw	a5,16(sp)
    8dc4:	00000b13          	li	s6,0
    8dc8:	a91ff06f          	j	8858 <_dtoa_r+0x768>
    8dcc:	40e787b3          	sub	a5,a5,a4
    8dd0:	00fd9533          	sll	a0,s11,a5
    8dd4:	ca0ff06f          	j	8274 <_dtoa_r+0x184>
    8dd8:	00300793          	li	a5,3
    8ddc:	00100913          	li	s2,1
    8de0:	44fa0c63          	beq	s4,a5,9238 <_dtoa_r+0x1148>
    8de4:	df47cc63          	blt	a5,s4,83dc <_dtoa_r+0x2ec>
    8de8:	00200793          	li	a5,2
    8dec:	18fa00e3          	beq	s4,a5,976c <_dtoa_r+0x167c>
    8df0:	02042e23          	sw	zero,60(s0)
    8df4:	00000593          	li	a1,0
    8df8:	00040513          	mv	a0,s0
    8dfc:	1e1000ef          	jal	97dc <_Balloc>
    8e00:	00050a93          	mv	s5,a0
    8e04:	140500e3          	beqz	a0,9744 <_dtoa_r+0x1654>
    8e08:	00100793          	li	a5,1
    8e0c:	02f12423          	sw	a5,40(sp)
    8e10:	fff00793          	li	a5,-1
    8e14:	02a42c23          	sw	a0,56(s0)
    8e18:	02f12e23          	sw	a5,60(sp)
    8e1c:	fff00c13          	li	s8,-1
    8e20:	00012a23          	sw	zero,20(sp)
    8e24:	b35ff06f          	j	8958 <_dtoa_r+0x868>
    8e28:	00090593          	mv	a1,s2
    8e2c:	00000693          	li	a3,0
    8e30:	00a00613          	li	a2,10
    8e34:	00040513          	mv	a0,s0
    8e38:	27d000ef          	jal	98b4 <__multadd>
    8e3c:	03c12c03          	lw	s8,60(sp)
    8e40:	00050913          	mv	s2,a0
    8e44:	0b805ae3          	blez	s8,96f8 <_dtoa_r+0x1608>
    8e48:	03612023          	sw	s6,32(sp)
    8e4c:	01905c63          	blez	s9,8e64 <_dtoa_r+0xd74>
    8e50:	00090593          	mv	a1,s2
    8e54:	000c8613          	mv	a2,s9
    8e58:	00040513          	mv	a0,s0
    8e5c:	1fc010ef          	jal	a058 <__lshift>
    8e60:	00050913          	mv	s2,a0
    8e64:	00090b13          	mv	s6,s2
    8e68:	50099e63          	bnez	s3,9384 <_dtoa_r+0x1294>
    8e6c:	02412783          	lw	a5,36(sp)
    8e70:	fffa8d13          	add	s10,s5,-1
    8e74:	000a8c93          	mv	s9,s5
    8e78:	01512823          	sw	s5,16(sp)
    8e7c:	01812a83          	lw	s5,24(sp)
    8e80:	0017f793          	and	a5,a5,1
    8e84:	018d0d33          	add	s10,s10,s8
    8e88:	00f12023          	sw	a5,0(sp)
    8e8c:	01b12a23          	sw	s11,20(sp)
    8e90:	000a8593          	mv	a1,s5
    8e94:	00048513          	mv	a0,s1
    8e98:	ff9fe0ef          	jal	7e90 <quorem>
    8e9c:	00050c13          	mv	s8,a0
    8ea0:	00090593          	mv	a1,s2
    8ea4:	00048513          	mv	a0,s1
    8ea8:	340010ef          	jal	a1e8 <__mcmp>
    8eac:	00050993          	mv	s3,a0
    8eb0:	000b0613          	mv	a2,s6
    8eb4:	000a8593          	mv	a1,s5
    8eb8:	00040513          	mv	a0,s0
    8ebc:	384010ef          	jal	a240 <__mdiff>
    8ec0:	00c52703          	lw	a4,12(a0)
    8ec4:	030c0b93          	add	s7,s8,48
    8ec8:	00050d93          	mv	s11,a0
    8ecc:	08071c63          	bnez	a4,8f64 <_dtoa_r+0xe74>
    8ed0:	00050593          	mv	a1,a0
    8ed4:	00048513          	mv	a0,s1
    8ed8:	310010ef          	jal	a1e8 <__mcmp>
    8edc:	00050713          	mv	a4,a0
    8ee0:	000d8593          	mv	a1,s11
    8ee4:	00040513          	mv	a0,s0
    8ee8:	00070d93          	mv	s11,a4
    8eec:	1a5000ef          	jal	9890 <_Bfree>
    8ef0:	014de6b3          	or	a3,s11,s4
    8ef4:	0e069a63          	bnez	a3,8fe8 <_dtoa_r+0xef8>
    8ef8:	00012783          	lw	a5,0(sp)
    8efc:	76078e63          	beqz	a5,9678 <_dtoa_r+0x1588>
    8f00:	7809c663          	bltz	s3,968c <_dtoa_r+0x159c>
    8f04:	017c8023          	sb	s7,0(s9)
    8f08:	001c8993          	add	s3,s9,1
    8f0c:	679d0e63          	beq	s10,s9,9588 <_dtoa_r+0x1498>
    8f10:	00048593          	mv	a1,s1
    8f14:	00000693          	li	a3,0
    8f18:	00a00613          	li	a2,10
    8f1c:	00040513          	mv	a0,s0
    8f20:	195000ef          	jal	98b4 <__multadd>
    8f24:	00050493          	mv	s1,a0
    8f28:	00000693          	li	a3,0
    8f2c:	00a00613          	li	a2,10
    8f30:	00090593          	mv	a1,s2
    8f34:	00040513          	mv	a0,s0
    8f38:	09690e63          	beq	s2,s6,8fd4 <_dtoa_r+0xee4>
    8f3c:	179000ef          	jal	98b4 <__multadd>
    8f40:	000b0593          	mv	a1,s6
    8f44:	00050913          	mv	s2,a0
    8f48:	00000693          	li	a3,0
    8f4c:	00a00613          	li	a2,10
    8f50:	00040513          	mv	a0,s0
    8f54:	161000ef          	jal	98b4 <__multadd>
    8f58:	00050b13          	mv	s6,a0
    8f5c:	00098c93          	mv	s9,s3
    8f60:	f31ff06f          	j	8e90 <_dtoa_r+0xda0>
    8f64:	00050593          	mv	a1,a0
    8f68:	00040513          	mv	a0,s0
    8f6c:	01012a83          	lw	s5,16(sp)
    8f70:	01412d83          	lw	s11,20(sp)
    8f74:	11d000ef          	jal	9890 <_Bfree>
    8f78:	0009ca63          	bltz	s3,8f8c <_dtoa_r+0xe9c>
    8f7c:	001df713          	and	a4,s11,1
    8f80:	0149e9b3          	or	s3,s3,s4
    8f84:	01376733          	or	a4,a4,s3
    8f88:	06071e63          	bnez	a4,9004 <_dtoa_r+0xf14>
    8f8c:	00048593          	mv	a1,s1
    8f90:	00100613          	li	a2,1
    8f94:	00040513          	mv	a0,s0
    8f98:	0c0010ef          	jal	a058 <__lshift>
    8f9c:	01812583          	lw	a1,24(sp)
    8fa0:	00050493          	mv	s1,a0
    8fa4:	244010ef          	jal	a1e8 <__mcmp>
    8fa8:	24a05863          	blez	a0,91f8 <_dtoa_r+0x1108>
    8fac:	03900713          	li	a4,57
    8fb0:	24eb8c63          	beq	s7,a4,9208 <_dtoa_r+0x1118>
    8fb4:	031c0b93          	add	s7,s8,49
    8fb8:	02012783          	lw	a5,32(sp)
    8fbc:	00090c13          	mv	s8,s2
    8fc0:	001c8d13          	add	s10,s9,1
    8fc4:	017c8023          	sb	s7,0(s9)
    8fc8:	00178a13          	add	s4,a5,1
    8fcc:	000b0913          	mv	s2,s6
    8fd0:	cc5ff06f          	j	8c94 <_dtoa_r+0xba4>
    8fd4:	0e1000ef          	jal	98b4 <__multadd>
    8fd8:	00050913          	mv	s2,a0
    8fdc:	00050b13          	mv	s6,a0
    8fe0:	00098c93          	mv	s9,s3
    8fe4:	eadff06f          	j	8e90 <_dtoa_r+0xda0>
    8fe8:	7409c863          	bltz	s3,9738 <_dtoa_r+0x1648>
    8fec:	00012783          	lw	a5,0(sp)
    8ff0:	0149e9b3          	or	s3,s3,s4
    8ff4:	0137e9b3          	or	s3,a5,s3
    8ff8:	74098063          	beqz	s3,9738 <_dtoa_r+0x1648>
    8ffc:	f1b054e3          	blez	s11,8f04 <_dtoa_r+0xe14>
    9000:	01012a83          	lw	s5,16(sp)
    9004:	03900713          	li	a4,57
    9008:	20eb8063          	beq	s7,a4,9208 <_dtoa_r+0x1118>
    900c:	02012703          	lw	a4,32(sp)
    9010:	001b8793          	add	a5,s7,1
    9014:	00090c13          	mv	s8,s2
    9018:	001c8d13          	add	s10,s9,1
    901c:	00170a13          	add	s4,a4,1
    9020:	00fc8023          	sb	a5,0(s9)
    9024:	000b0913          	mv	s2,s6
    9028:	c6dff06f          	j	8c94 <_dtoa_r+0xba4>
    902c:	00200793          	li	a5,2
    9030:	bb47dee3          	bge	a5,s4,8bec <_dtoa_r+0xafc>
    9034:	000a8d13          	mv	s10,s5
    9038:	9a0c10e3          	bnez	s8,89d8 <_dtoa_r+0x8e8>
    903c:	01812583          	lw	a1,24(sp)
    9040:	00000693          	li	a3,0
    9044:	00500613          	li	a2,5
    9048:	00040513          	mv	a0,s0
    904c:	069000ef          	jal	98b4 <__multadd>
    9050:	00050593          	mv	a1,a0
    9054:	00a12c23          	sw	a0,24(sp)
    9058:	00048513          	mv	a0,s1
    905c:	18c010ef          	jal	a1e8 <__mcmp>
    9060:	96a05ce3          	blez	a0,89d8 <_dtoa_r+0x8e8>
    9064:	03100793          	li	a5,49
    9068:	00fa8023          	sb	a5,0(s5)
    906c:	02012783          	lw	a5,32(sp)
    9070:	001a8d13          	add	s10,s5,1
    9074:	00178a13          	add	s4,a5,1
    9078:	01812583          	lw	a1,24(sp)
    907c:	00040513          	mv	a0,s0
    9080:	001a0a13          	add	s4,s4,1
    9084:	00d000ef          	jal	9890 <_Bfree>
    9088:	c20918e3          	bnez	s2,8cb8 <_dtoa_r+0xbc8>
    908c:	c39ff06f          	j	8cc4 <_dtoa_r+0xbd4>
    9090:	00050593          	mv	a1,a0
    9094:	00098613          	mv	a2,s3
    9098:	00040513          	mv	a0,s0
    909c:	66d000ef          	jal	9f08 <__pow5mult>
    90a0:	00100793          	li	a5,1
    90a4:	00a12c23          	sw	a0,24(sp)
    90a8:	1147de63          	bge	a5,s4,91c4 <_dtoa_r+0x10d4>
    90ac:	00000993          	li	s3,0
    90b0:	01812703          	lw	a4,24(sp)
    90b4:	01072783          	lw	a5,16(a4)
    90b8:	00378793          	add	a5,a5,3
    90bc:	00279793          	sll	a5,a5,0x2
    90c0:	00f707b3          	add	a5,a4,a5
    90c4:	0047a503          	lw	a0,4(a5)
    90c8:	171000ef          	jal	9a38 <__hi0bits>
    90cc:	02000793          	li	a5,32
    90d0:	40a787b3          	sub	a5,a5,a0
    90d4:	ab5ff06f          	j	8b88 <_dtoa_r+0xa98>
    90d8:	02412783          	lw	a5,36(sp)
    90dc:	04079063          	bnez	a5,911c <_dtoa_r+0x102c>
    90e0:	00012783          	lw	a5,0(sp)
    90e4:	00c79793          	sll	a5,a5,0xc
    90e8:	02079a63          	bnez	a5,911c <_dtoa_r+0x102c>
    90ec:	00012683          	lw	a3,0(sp)
    90f0:	00000793          	li	a5,0
    90f4:	0146d713          	srl	a4,a3,0x14
    90f8:	7ff77713          	and	a4,a4,2047
    90fc:	00070c63          	beqz	a4,9114 <_dtoa_r+0x1024>
    9100:	01012783          	lw	a5,16(sp)
    9104:	001b0b13          	add	s6,s6,1
    9108:	00178793          	add	a5,a5,1
    910c:	00f12823          	sw	a5,16(sp)
    9110:	00100793          	li	a5,1
    9114:	58099063          	bnez	s3,9694 <_dtoa_r+0x15a4>
    9118:	00078993          	mv	s3,a5
    911c:	00100793          	li	a5,1
    9120:	a69ff06f          	j	8b88 <_dtoa_r+0xa98>
    9124:	a8d70ee3          	beq	a4,a3,8bc0 <_dtoa_r+0xad0>
    9128:	03c00713          	li	a4,60
    912c:	40f707b3          	sub	a5,a4,a5
    9130:	a7dff06f          	j	8bac <_dtoa_r+0xabc>
    9134:	00100793          	li	a5,1
    9138:	00500a13          	li	s4,5
    913c:	02f12423          	sw	a5,40(sp)
    9140:	01412783          	lw	a5,20(sp)
    9144:	02012703          	lw	a4,32(sp)
    9148:	00e787b3          	add	a5,a5,a4
    914c:	00178c13          	add	s8,a5,1
    9150:	02f12e23          	sw	a5,60(sp)
    9154:	000c0613          	mv	a2,s8
    9158:	ab804263          	bgtz	s8,83fc <_dtoa_r+0x30c>
    915c:	00100613          	li	a2,1
    9160:	a9cff06f          	j	83fc <_dtoa_r+0x30c>
    9164:	00051663          	bnez	a0,9170 <_dtoa_r+0x1080>
    9168:	001bf793          	and	a5,s7,1
    916c:	b00792e3          	bnez	a5,8c70 <_dtoa_r+0xb80>
    9170:	03000693          	li	a3,48
    9174:	fff9c783          	lbu	a5,-1(s3)
    9178:	00098d13          	mv	s10,s3
    917c:	fff98993          	add	s3,s3,-1
    9180:	fed78ae3          	beq	a5,a3,9174 <_dtoa_r+0x1084>
    9184:	b11ff06f          	j	8c94 <_dtoa_r+0xba4>
    9188:	000c0993          	mv	s3,s8
    918c:	abdff06f          	j	8c48 <_dtoa_r+0xb58>
    9190:	000b0793          	mv	a5,s6
    9194:	99dff06f          	j	8b30 <_dtoa_r+0xa40>
    9198:	03012783          	lw	a5,48(sp)
    919c:	01012703          	lw	a4,16(sp)
    91a0:	03712823          	sw	s7,48(sp)
    91a4:	40fb87b3          	sub	a5,s7,a5
    91a8:	00f989b3          	add	s3,s3,a5
    91ac:	018707b3          	add	a5,a4,s8
    91b0:	00070c93          	mv	s9,a4
    91b4:	018b0b33          	add	s6,s6,s8
    91b8:	00f12823          	sw	a5,16(sp)
    91bc:	00000b93          	li	s7,0
    91c0:	bd9ff06f          	j	8d98 <_dtoa_r+0xca8>
    91c4:	02412783          	lw	a5,36(sp)
    91c8:	ee0792e3          	bnez	a5,90ac <_dtoa_r+0xfbc>
    91cc:	00012783          	lw	a5,0(sp)
    91d0:	00c79793          	sll	a5,a5,0xc
    91d4:	ec079ce3          	bnez	a5,90ac <_dtoa_r+0xfbc>
    91d8:	f15ff06f          	j	90ec <_dtoa_r+0xffc>
    91dc:	01812303          	lw	t1,24(sp)
    91e0:	01c12d03          	lw	s10,28(sp)
    91e4:	00200913          	li	s2,2
    91e8:	ad0ff06f          	j	84b8 <_dtoa_r+0x3c8>
    91ec:	00200a13          	li	s4,2
    91f0:	02012423          	sw	zero,40(sp)
    91f4:	9f8ff06f          	j	83ec <_dtoa_r+0x2fc>
    91f8:	dc0510e3          	bnez	a0,8fb8 <_dtoa_r+0xec8>
    91fc:	001bf713          	and	a4,s7,1
    9200:	da0716e3          	bnez	a4,8fac <_dtoa_r+0xebc>
    9204:	db5ff06f          	j	8fb8 <_dtoa_r+0xec8>
    9208:	03900793          	li	a5,57
    920c:	00fc8023          	sb	a5,0(s9)
    9210:	02012783          	lw	a5,32(sp)
    9214:	00090c13          	mv	s8,s2
    9218:	001c8993          	add	s3,s9,1
    921c:	00178a13          	add	s4,a5,1
    9220:	000b0913          	mv	s2,s6
    9224:	a4dff06f          	j	8c70 <_dtoa_r+0xb80>
    9228:	00100793          	li	a5,1
    922c:	00100c13          	li	s8,1
    9230:	00f12a23          	sw	a5,20(sp)
    9234:	e50ff06f          	j	8884 <_dtoa_r+0x794>
    9238:	02012423          	sw	zero,40(sp)
    923c:	f05ff06f          	j	9140 <_dtoa_r+0x1050>
    9240:	03812703          	lw	a4,56(sp)
    9244:	30070e63          	beqz	a4,9560 <_dtoa_r+0x1470>
    9248:	01012703          	lw	a4,16(sp)
    924c:	43378793          	add	a5,a5,1075
    9250:	00fb0b33          	add	s6,s6,a5
    9254:	00f707b3          	add	a5,a4,a5
    9258:	03012b83          	lw	s7,48(sp)
    925c:	00070c93          	mv	s9,a4
    9260:	00f12823          	sw	a5,16(sp)
    9264:	b35ff06f          	j	8d98 <_dtoa_r+0xca8>
    9268:	03100793          	li	a5,49
    926c:	00fa8023          	sb	a5,0(s5)
    9270:	001a0a13          	add	s4,s4,1
    9274:	a21ff06f          	j	8c94 <_dtoa_r+0xba4>
    9278:	02012783          	lw	a5,32(sp)
    927c:	32078263          	beqz	a5,95a0 <_dtoa_r+0x14b0>
    9280:	40f00bb3          	neg	s7,a5
    9284:	00fbf713          	and	a4,s7,15
    9288:	00371713          	sll	a4,a4,0x3
    928c:	00006797          	auipc	a5,0x6
    9290:	52478793          	add	a5,a5,1316 # f7b0 <__mprec_tens>
    9294:	00e787b3          	add	a5,a5,a4
    9298:	0007a603          	lw	a2,0(a5)
    929c:	0047a683          	lw	a3,4(a5)
    92a0:	01812503          	lw	a0,24(sp)
    92a4:	01c12583          	lw	a1,28(sp)
    92a8:	404bdb93          	sra	s7,s7,0x4
    92ac:	3d4040ef          	jal	d680 <__muldf3>
    92b0:	00058d13          	mv	s10,a1
    92b4:	440b8c63          	beqz	s7,970c <_dtoa_r+0x161c>
    92b8:	00200913          	li	s2,2
    92bc:	04812023          	sw	s0,64(sp)
    92c0:	00006c97          	auipc	s9,0x6
    92c4:	4c8c8c93          	add	s9,s9,1224 # f788 <__mprec_bigtens>
    92c8:	00090413          	mv	s0,s2
    92cc:	00050713          	mv	a4,a0
    92d0:	00000613          	li	a2,0
    92d4:	00050913          	mv	s2,a0
    92d8:	001bf693          	and	a3,s7,1
    92dc:	02068063          	beqz	a3,92fc <_dtoa_r+0x120c>
    92e0:	000ca603          	lw	a2,0(s9)
    92e4:	004ca683          	lw	a3,4(s9)
    92e8:	00070513          	mv	a0,a4
    92ec:	00140413          	add	s0,s0,1
    92f0:	390040ef          	jal	d680 <__muldf3>
    92f4:	00050713          	mv	a4,a0
    92f8:	00100613          	li	a2,1
    92fc:	401bdb93          	sra	s7,s7,0x1
    9300:	008c8c93          	add	s9,s9,8
    9304:	fc0b9ae3          	bnez	s7,92d8 <_dtoa_r+0x11e8>
    9308:	00090513          	mv	a0,s2
    930c:	00058793          	mv	a5,a1
    9310:	00040913          	mv	s2,s0
    9314:	04012403          	lw	s0,64(sp)
    9318:	a0061a63          	bnez	a2,852c <_dtoa_r+0x43c>
    931c:	00050713          	mv	a4,a0
    9320:	000d0793          	mv	a5,s10
    9324:	a08ff06f          	j	852c <_dtoa_r+0x43c>
    9328:	00068593          	mv	a1,a3
    932c:	00070613          	mv	a2,a4
    9330:	00070513          	mv	a0,a4
    9334:	745020ef          	jal	c278 <__adddf3>
    9338:	02012783          	lw	a5,32(sp)
    933c:	00090613          	mv	a2,s2
    9340:	00098693          	mv	a3,s3
    9344:	00178a13          	add	s4,a5,1
    9348:	00050c93          	mv	s9,a0
    934c:	00058b13          	mv	s6,a1
    9350:	000a0c13          	mv	s8,s4
    9354:	124040ef          	jal	d478 <__gedf2>
    9358:	c4a04863          	bgtz	a0,87a8 <_dtoa_r+0x6b8>
    935c:	000c8513          	mv	a0,s9
    9360:	000b0593          	mv	a1,s6
    9364:	00090613          	mv	a2,s2
    9368:	00098693          	mv	a3,s3
    936c:	080040ef          	jal	d3ec <__eqdf2>
    9370:	00051663          	bnez	a0,937c <_dtoa_r+0x128c>
    9374:	001d7d13          	and	s10,s10,1
    9378:	c20d1863          	bnez	s10,87a8 <_dtoa_r+0x6b8>
    937c:	000b8d13          	mv	s10,s7
    9380:	945ff06f          	j	8cc4 <_dtoa_r+0xbd4>
    9384:	00492583          	lw	a1,4(s2)
    9388:	00040513          	mv	a0,s0
    938c:	450000ef          	jal	97dc <_Balloc>
    9390:	00050993          	mv	s3,a0
    9394:	38050463          	beqz	a0,971c <_dtoa_r+0x162c>
    9398:	01092603          	lw	a2,16(s2)
    939c:	00c90593          	add	a1,s2,12
    93a0:	00c50513          	add	a0,a0,12
    93a4:	00260613          	add	a2,a2,2
    93a8:	00261613          	sll	a2,a2,0x2
    93ac:	ccdf70ef          	jal	1078 <memcpy>
    93b0:	00100613          	li	a2,1
    93b4:	00098593          	mv	a1,s3
    93b8:	00040513          	mv	a0,s0
    93bc:	49d000ef          	jal	a058 <__lshift>
    93c0:	00050b13          	mv	s6,a0
    93c4:	aa9ff06f          	j	8e6c <_dtoa_r+0xd7c>
    93c8:	00090593          	mv	a1,s2
    93cc:	000b8613          	mv	a2,s7
    93d0:	00040513          	mv	a0,s0
    93d4:	335000ef          	jal	9f08 <__pow5mult>
    93d8:	00048613          	mv	a2,s1
    93dc:	00050593          	mv	a1,a0
    93e0:	00050913          	mv	s2,a0
    93e4:	00040513          	mv	a0,s0
    93e8:	059000ef          	jal	9c40 <__multiply>
    93ec:	00050793          	mv	a5,a0
    93f0:	00048593          	mv	a1,s1
    93f4:	00040513          	mv	a0,s0
    93f8:	00078493          	mv	s1,a5
    93fc:	494000ef          	jal	9890 <_Bfree>
    9400:	03012783          	lw	a5,48(sp)
    9404:	417787b3          	sub	a5,a5,s7
    9408:	02f12823          	sw	a5,48(sp)
    940c:	f6078063          	beqz	a5,8b6c <_dtoa_r+0xa7c>
    9410:	f48ff06f          	j	8b58 <_dtoa_r+0xa68>
    9414:	05012603          	lw	a2,80(sp)
    9418:	05412683          	lw	a3,84(sp)
    941c:	05812503          	lw	a0,88(sp)
    9420:	04b12623          	sw	a1,76(sp)
    9424:	000b8593          	mv	a1,s7
    9428:	02612423          	sw	t1,40(sp)
    942c:	254040ef          	jal	d680 <__muldf3>
    9430:	02812303          	lw	t1,40(sp)
    9434:	04812783          	lw	a5,72(sp)
    9438:	00100693          	li	a3,1
    943c:	006a8023          	sb	t1,0(s5)
    9440:	02a12c23          	sw	a0,56(sp)
    9444:	04c12883          	lw	a7,76(sp)
    9448:	00058913          	mv	s2,a1
    944c:	00fa8bb3          	add	s7,s5,a5
    9450:	7fff7617          	auipc	a2,0x7fff7
    9454:	2a060613          	add	a2,a2,672 # 800006f0 <__global_locale+0x1bc>
    9458:	28d78c63          	beq	a5,a3,96f0 <_dtoa_r+0x1600>
    945c:	00062783          	lw	a5,0(a2)
    9460:	00462803          	lw	a6,4(a2)
    9464:	04912423          	sw	s1,72(sp)
    9468:	02f12423          	sw	a5,40(sp)
    946c:	03012623          	sw	a6,44(sp)
    9470:	04812623          	sw	s0,76(sp)
    9474:	000c8513          	mv	a0,s9
    9478:	00088593          	mv	a1,a7
    947c:	02812603          	lw	a2,40(sp)
    9480:	02c12683          	lw	a3,44(sp)
    9484:	001d0d13          	add	s10,s10,1
    9488:	1f8040ef          	jal	d680 <__muldf3>
    948c:	00058413          	mv	s0,a1
    9490:	00050493          	mv	s1,a0
    9494:	2d8050ef          	jal	e76c <__fixdfsi>
    9498:	00050c93          	mv	s9,a0
    949c:	354050ef          	jal	e7f0 <__floatsidf>
    94a0:	00050613          	mv	a2,a0
    94a4:	00058693          	mv	a3,a1
    94a8:	00048513          	mv	a0,s1
    94ac:	00040593          	mv	a1,s0
    94b0:	030c8c93          	add	s9,s9,48
    94b4:	15d040ef          	jal	de10 <__subdf3>
    94b8:	ff9d0fa3          	sb	s9,-1(s10)
    94bc:	fdab90e3          	bne	s7,s10,947c <_dtoa_r+0x138c>
    94c0:	04812483          	lw	s1,72(sp)
    94c4:	04c12403          	lw	s0,76(sp)
    94c8:	00050c93          	mv	s9,a0
    94cc:	00058893          	mv	a7,a1
    94d0:	7fff7d17          	auipc	s10,0x7fff7
    94d4:	1e8d0d13          	add	s10,s10,488 # 800006b8 <__global_locale+0x184>
    94d8:	000d2603          	lw	a2,0(s10)
    94dc:	004d2683          	lw	a3,4(s10)
    94e0:	03812503          	lw	a0,56(sp)
    94e4:	00090593          	mv	a1,s2
    94e8:	03112423          	sw	a7,40(sp)
    94ec:	58d020ef          	jal	c278 <__adddf3>
    94f0:	02812883          	lw	a7,40(sp)
    94f4:	000c8613          	mv	a2,s9
    94f8:	00088693          	mv	a3,a7
    94fc:	07c040ef          	jal	d578 <__ledf2>
    9500:	1a054863          	bltz	a0,96b0 <_dtoa_r+0x15c0>
    9504:	03812603          	lw	a2,56(sp)
    9508:	000d2503          	lw	a0,0(s10)
    950c:	004d2583          	lw	a1,4(s10)
    9510:	00090693          	mv	a3,s2
    9514:	0fd040ef          	jal	de10 <__subdf3>
    9518:	02812883          	lw	a7,40(sp)
    951c:	000c8613          	mv	a2,s9
    9520:	00088693          	mv	a3,a7
    9524:	755030ef          	jal	d478 <__gedf2>
    9528:	12a04863          	bgtz	a0,9658 <_dtoa_r+0x1568>
    952c:	06c12783          	lw	a5,108(sp)
    9530:	de07c063          	bltz	a5,8b10 <_dtoa_r+0xa20>
    9534:	02012703          	lw	a4,32(sp)
    9538:	00e00793          	li	a5,14
    953c:	dce7ca63          	blt	a5,a4,8b10 <_dtoa_r+0xa20>
    9540:	02012783          	lw	a5,32(sp)
    9544:	00006717          	auipc	a4,0x6
    9548:	26c70713          	add	a4,a4,620 # f7b0 <__mprec_tens>
    954c:	00379793          	sll	a5,a5,0x3
    9550:	00f707b3          	add	a5,a4,a5
    9554:	0007a903          	lw	s2,0(a5)
    9558:	0047a983          	lw	s3,4(a5)
    955c:	c90ff06f          	j	89ec <_dtoa_r+0x8fc>
    9560:	06812703          	lw	a4,104(sp)
    9564:	01012683          	lw	a3,16(sp)
    9568:	03600793          	li	a5,54
    956c:	40e787b3          	sub	a5,a5,a4
    9570:	00fb0b33          	add	s6,s6,a5
    9574:	00f687b3          	add	a5,a3,a5
    9578:	03012b83          	lw	s7,48(sp)
    957c:	00068c93          	mv	s9,a3
    9580:	00f12823          	sw	a5,16(sp)
    9584:	815ff06f          	j	8d98 <_dtoa_r+0xca8>
    9588:	02012783          	lw	a5,32(sp)
    958c:	00090c13          	mv	s8,s2
    9590:	01012a83          	lw	s5,16(sp)
    9594:	00178a13          	add	s4,a5,1
    9598:	000b0913          	mv	s2,s6
    959c:	eb4ff06f          	j	8c50 <_dtoa_r+0xb60>
    95a0:	01812703          	lw	a4,24(sp)
    95a4:	01c12783          	lw	a5,28(sp)
    95a8:	00200913          	li	s2,2
    95ac:	f81fe06f          	j	852c <_dtoa_r+0x43c>
    95b0:	b00c0063          	beqz	s8,88b0 <_dtoa_r+0x7c0>
    95b4:	03c12d03          	lw	s10,60(sp)
    95b8:	bba05063          	blez	s10,8958 <_dtoa_r+0x868>
    95bc:	7fff7617          	auipc	a2,0x7fff7
    95c0:	13460613          	add	a2,a2,308 # 800006f0 <__global_locale+0x1bc>
    95c4:	00078593          	mv	a1,a5
    95c8:	02012783          	lw	a5,32(sp)
    95cc:	00462683          	lw	a3,4(a2)
    95d0:	00062603          	lw	a2,0(a2)
    95d4:	fff78793          	add	a5,a5,-1
    95d8:	00070513          	mv	a0,a4
    95dc:	04f12e23          	sw	a5,92(sp)
    95e0:	0a0040ef          	jal	d680 <__muldf3>
    95e4:	00050713          	mv	a4,a0
    95e8:	00190513          	add	a0,s2,1
    95ec:	04e12423          	sw	a4,72(sp)
    95f0:	04b12023          	sw	a1,64(sp)
    95f4:	1fc050ef          	jal	e7f0 <__floatsidf>
    95f8:	04812703          	lw	a4,72(sp)
    95fc:	04012783          	lw	a5,64(sp)
    9600:	00070613          	mv	a2,a4
    9604:	00078693          	mv	a3,a5
    9608:	04e12623          	sw	a4,76(sp)
    960c:	074040ef          	jal	d680 <__muldf3>
    9610:	7fff7697          	auipc	a3,0x7fff7
    9614:	0e868693          	add	a3,a3,232 # 800006f8 <__global_locale+0x1c4>
    9618:	0006a603          	lw	a2,0(a3)
    961c:	0046a683          	lw	a3,4(a3)
    9620:	459020ef          	jal	c278 <__adddf3>
    9624:	fcc006b7          	lui	a3,0xfcc00
    9628:	04012783          	lw	a5,64(sp)
    962c:	04c12703          	lw	a4,76(sp)
    9630:	00050c93          	mv	s9,a0
    9634:	00b68bb3          	add	s7,a3,a1
    9638:	05a12423          	sw	s10,72(sp)
    963c:	f91fe06f          	j	85cc <_dtoa_r+0x4dc>
    9640:	03100693          	li	a3,49
    9644:	001c0c13          	add	s8,s8,1
    9648:	984ff06f          	j	87cc <_dtoa_r+0x6dc>
    964c:	00012c23          	sw	zero,24(sp)
    9650:	00000913          	li	s2,0
    9654:	a11ff06f          	j	9064 <_dtoa_r+0xf74>
    9658:	03000613          	li	a2,48
    965c:	fffbc783          	lbu	a5,-1(s7)
    9660:	000b8d13          	mv	s10,s7
    9664:	fffb8b93          	add	s7,s7,-1
    9668:	fec78ae3          	beq	a5,a2,965c <_dtoa_r+0x156c>
    966c:	05c12783          	lw	a5,92(sp)
    9670:	00178a13          	add	s4,a5,1
    9674:	e50ff06f          	j	8cc4 <_dtoa_r+0xbd4>
    9678:	03900713          	li	a4,57
    967c:	01012a83          	lw	s5,16(sp)
    9680:	b8eb84e3          	beq	s7,a4,9208 <_dtoa_r+0x1118>
    9684:	933048e3          	bgtz	s3,8fb4 <_dtoa_r+0xec4>
    9688:	931ff06f          	j	8fb8 <_dtoa_r+0xec8>
    968c:	01012a83          	lw	s5,16(sp)
    9690:	929ff06f          	j	8fb8 <_dtoa_r+0xec8>
    9694:	00078993          	mv	s3,a5
    9698:	a19ff06f          	j	90b0 <_dtoa_r+0xfc0>
    969c:	00078c93          	mv	s9,a5
    96a0:	018787b3          	add	a5,a5,s8
    96a4:	018b0b33          	add	s6,s6,s8
    96a8:	00f12823          	sw	a5,16(sp)
    96ac:	eecff06f          	j	8d98 <_dtoa_r+0xca8>
    96b0:	05c12783          	lw	a5,92(sp)
    96b4:	00178c13          	add	s8,a5,1
    96b8:	8f0ff06f          	j	87a8 <_dtoa_r+0x6b8>
    96bc:	04c12983          	lw	s3,76(sp)
    96c0:	05012b03          	lw	s6,80(sp)
    96c4:	05812c03          	lw	s8,88(sp)
    96c8:	04812a03          	lw	s4,72(sp)
    96cc:	a8cff06f          	j	8958 <_dtoa_r+0x868>
    96d0:	00200793          	li	a5,2
    96d4:	0147c863          	blt	a5,s4,96e4 <_dtoa_r+0x15f4>
    96d8:	02012a03          	lw	s4,32(sp)
    96dc:	03c12c03          	lw	s8,60(sp)
    96e0:	d1cff06f          	j	8bfc <_dtoa_r+0xb0c>
    96e4:	03c12c03          	lw	s8,60(sp)
    96e8:	03612023          	sw	s6,32(sp)
    96ec:	949ff06f          	j	9034 <_dtoa_r+0xf44>
    96f0:	04012b83          	lw	s7,64(sp)
    96f4:	dddff06f          	j	94d0 <_dtoa_r+0x13e0>
    96f8:	00200793          	li	a5,2
    96fc:	ff47c4e3          	blt	a5,s4,96e4 <_dtoa_r+0x15f4>
    9700:	03c12c03          	lw	s8,60(sp)
    9704:	03612023          	sw	s6,32(sp)
    9708:	f44ff06f          	j	8e4c <_dtoa_r+0xd5c>
    970c:	00050713          	mv	a4,a0
    9710:	00058793          	mv	a5,a1
    9714:	00200913          	li	s2,2
    9718:	e15fe06f          	j	852c <_dtoa_r+0x43c>
    971c:	00006697          	auipc	a3,0x6
    9720:	a5468693          	add	a3,a3,-1452 # f170 <__fini_array_end+0x230>
    9724:	00000613          	li	a2,0
    9728:	2ef00593          	li	a1,751
    972c:	00006517          	auipc	a0,0x6
    9730:	a5850513          	add	a0,a0,-1448 # f184 <__fini_array_end+0x244>
    9734:	0cd010ef          	jal	b000 <__assert_func>
    9738:	01012a83          	lw	s5,16(sp)
    973c:	85b048e3          	bgtz	s11,8f8c <_dtoa_r+0xe9c>
    9740:	879ff06f          	j	8fb8 <_dtoa_r+0xec8>
    9744:	00006697          	auipc	a3,0x6
    9748:	a2c68693          	add	a3,a3,-1492 # f170 <__fini_array_end+0x230>
    974c:	00000613          	li	a2,0
    9750:	1af00593          	li	a1,431
    9754:	00006517          	auipc	a0,0x6
    9758:	a3050513          	add	a0,a0,-1488 # f184 <__fini_array_end+0x244>
    975c:	0a5010ef          	jal	b000 <__assert_func>
    9760:	02042e23          	sw	zero,60(s0)
    9764:	00000593          	li	a1,0
    9768:	cc1fe06f          	j	8428 <_dtoa_r+0x338>
    976c:	02012423          	sw	zero,40(sp)
    9770:	c7dfe06f          	j	83ec <_dtoa_r+0x2fc>

00009774 <__ascii_mbtowc>:
    9774:	02058063          	beqz	a1,9794 <__ascii_mbtowc+0x20>
    9778:	04060263          	beqz	a2,97bc <__ascii_mbtowc+0x48>
    977c:	04068863          	beqz	a3,97cc <__ascii_mbtowc+0x58>
    9780:	00064783          	lbu	a5,0(a2)
    9784:	00f5a023          	sw	a5,0(a1)
    9788:	00064503          	lbu	a0,0(a2)
    978c:	00a03533          	snez	a0,a0
    9790:	00008067          	ret
    9794:	ff010113          	add	sp,sp,-16
    9798:	00c10593          	add	a1,sp,12
    979c:	02060463          	beqz	a2,97c4 <__ascii_mbtowc+0x50>
    97a0:	02068a63          	beqz	a3,97d4 <__ascii_mbtowc+0x60>
    97a4:	00064783          	lbu	a5,0(a2)
    97a8:	00f5a023          	sw	a5,0(a1)
    97ac:	00064503          	lbu	a0,0(a2)
    97b0:	00a03533          	snez	a0,a0
    97b4:	01010113          	add	sp,sp,16
    97b8:	00008067          	ret
    97bc:	00000513          	li	a0,0
    97c0:	00008067          	ret
    97c4:	00000513          	li	a0,0
    97c8:	fedff06f          	j	97b4 <__ascii_mbtowc+0x40>
    97cc:	ffe00513          	li	a0,-2
    97d0:	00008067          	ret
    97d4:	ffe00513          	li	a0,-2
    97d8:	fddff06f          	j	97b4 <__ascii_mbtowc+0x40>

000097dc <_Balloc>:
    97dc:	04452783          	lw	a5,68(a0)
    97e0:	ff010113          	add	sp,sp,-16
    97e4:	00812423          	sw	s0,8(sp)
    97e8:	00912223          	sw	s1,4(sp)
    97ec:	00112623          	sw	ra,12(sp)
    97f0:	00050413          	mv	s0,a0
    97f4:	00058493          	mv	s1,a1
    97f8:	02078c63          	beqz	a5,9830 <_Balloc+0x54>
    97fc:	00249713          	sll	a4,s1,0x2
    9800:	00e787b3          	add	a5,a5,a4
    9804:	0007a503          	lw	a0,0(a5)
    9808:	04050463          	beqz	a0,9850 <_Balloc+0x74>
    980c:	00052703          	lw	a4,0(a0)
    9810:	00e7a023          	sw	a4,0(a5)
    9814:	00052823          	sw	zero,16(a0)
    9818:	00052623          	sw	zero,12(a0)
    981c:	00c12083          	lw	ra,12(sp)
    9820:	00812403          	lw	s0,8(sp)
    9824:	00412483          	lw	s1,4(sp)
    9828:	01010113          	add	sp,sp,16
    982c:	00008067          	ret
    9830:	02100613          	li	a2,33
    9834:	00400593          	li	a1,4
    9838:	021010ef          	jal	b058 <_calloc_r>
    983c:	04a42223          	sw	a0,68(s0)
    9840:	00050793          	mv	a5,a0
    9844:	fa051ce3          	bnez	a0,97fc <_Balloc+0x20>
    9848:	00000513          	li	a0,0
    984c:	fd1ff06f          	j	981c <_Balloc+0x40>
    9850:	01212023          	sw	s2,0(sp)
    9854:	00100913          	li	s2,1
    9858:	00991933          	sll	s2,s2,s1
    985c:	00590613          	add	a2,s2,5
    9860:	00261613          	sll	a2,a2,0x2
    9864:	00100593          	li	a1,1
    9868:	00040513          	mv	a0,s0
    986c:	7ec010ef          	jal	b058 <_calloc_r>
    9870:	00050a63          	beqz	a0,9884 <_Balloc+0xa8>
    9874:	01252423          	sw	s2,8(a0)
    9878:	00952223          	sw	s1,4(a0)
    987c:	00012903          	lw	s2,0(sp)
    9880:	f95ff06f          	j	9814 <_Balloc+0x38>
    9884:	00012903          	lw	s2,0(sp)
    9888:	00000513          	li	a0,0
    988c:	f91ff06f          	j	981c <_Balloc+0x40>

00009890 <_Bfree>:
    9890:	02058063          	beqz	a1,98b0 <_Bfree+0x20>
    9894:	0045a703          	lw	a4,4(a1)
    9898:	04452783          	lw	a5,68(a0)
    989c:	00271713          	sll	a4,a4,0x2
    98a0:	00e787b3          	add	a5,a5,a4
    98a4:	0007a703          	lw	a4,0(a5)
    98a8:	00e5a023          	sw	a4,0(a1)
    98ac:	00b7a023          	sw	a1,0(a5)
    98b0:	00008067          	ret

000098b4 <__multadd>:
    98b4:	fd010113          	add	sp,sp,-48
    98b8:	01412c23          	sw	s4,24(sp)
    98bc:	0105aa03          	lw	s4,16(a1)
    98c0:	01912223          	sw	s9,4(sp)
    98c4:	00010cb7          	lui	s9,0x10
    98c8:	02912223          	sw	s1,36(sp)
    98cc:	03212023          	sw	s2,32(sp)
    98d0:	01312e23          	sw	s3,28(sp)
    98d4:	01512a23          	sw	s5,20(sp)
    98d8:	01612823          	sw	s6,16(sp)
    98dc:	01712623          	sw	s7,12(sp)
    98e0:	02112623          	sw	ra,44(sp)
    98e4:	02812423          	sw	s0,40(sp)
    98e8:	01812423          	sw	s8,8(sp)
    98ec:	00058a93          	mv	s5,a1
    98f0:	00050b13          	mv	s6,a0
    98f4:	00060993          	mv	s3,a2
    98f8:	00068493          	mv	s1,a3
    98fc:	01458913          	add	s2,a1,20
    9900:	00000b93          	li	s7,0
    9904:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    9908:	00092c03          	lw	s8,0(s2)
    990c:	00098593          	mv	a1,s3
    9910:	00490913          	add	s2,s2,4
    9914:	019c7533          	and	a0,s8,s9
    9918:	430050ef          	jal	ed48 <__mulsi3>
    991c:	00050413          	mv	s0,a0
    9920:	00098593          	mv	a1,s3
    9924:	010c5513          	srl	a0,s8,0x10
    9928:	00940433          	add	s0,s0,s1
    992c:	41c050ef          	jal	ed48 <__mulsi3>
    9930:	01045793          	srl	a5,s0,0x10
    9934:	00f50533          	add	a0,a0,a5
    9938:	01051793          	sll	a5,a0,0x10
    993c:	01947433          	and	s0,s0,s9
    9940:	008787b3          	add	a5,a5,s0
    9944:	fef92e23          	sw	a5,-4(s2)
    9948:	001b8b93          	add	s7,s7,1
    994c:	01055493          	srl	s1,a0,0x10
    9950:	fb4bcce3          	blt	s7,s4,9908 <__multadd+0x54>
    9954:	02048263          	beqz	s1,9978 <__multadd+0xc4>
    9958:	008aa783          	lw	a5,8(s5)
    995c:	04fa5a63          	bge	s4,a5,99b0 <__multadd+0xfc>
    9960:	004a0793          	add	a5,s4,4
    9964:	00279793          	sll	a5,a5,0x2
    9968:	00fa87b3          	add	a5,s5,a5
    996c:	0097a223          	sw	s1,4(a5)
    9970:	001a0a13          	add	s4,s4,1
    9974:	014aa823          	sw	s4,16(s5)
    9978:	02c12083          	lw	ra,44(sp)
    997c:	02812403          	lw	s0,40(sp)
    9980:	02412483          	lw	s1,36(sp)
    9984:	02012903          	lw	s2,32(sp)
    9988:	01c12983          	lw	s3,28(sp)
    998c:	01812a03          	lw	s4,24(sp)
    9990:	01012b03          	lw	s6,16(sp)
    9994:	00c12b83          	lw	s7,12(sp)
    9998:	00812c03          	lw	s8,8(sp)
    999c:	00412c83          	lw	s9,4(sp)
    99a0:	000a8513          	mv	a0,s5
    99a4:	01412a83          	lw	s5,20(sp)
    99a8:	03010113          	add	sp,sp,48
    99ac:	00008067          	ret
    99b0:	004aa583          	lw	a1,4(s5)
    99b4:	000b0513          	mv	a0,s6
    99b8:	00158593          	add	a1,a1,1
    99bc:	e21ff0ef          	jal	97dc <_Balloc>
    99c0:	00050413          	mv	s0,a0
    99c4:	04050c63          	beqz	a0,9a1c <__multadd+0x168>
    99c8:	010aa603          	lw	a2,16(s5)
    99cc:	00ca8593          	add	a1,s5,12
    99d0:	00c50513          	add	a0,a0,12
    99d4:	00260613          	add	a2,a2,2
    99d8:	00261613          	sll	a2,a2,0x2
    99dc:	e9cf70ef          	jal	1078 <memcpy>
    99e0:	004aa703          	lw	a4,4(s5)
    99e4:	044b2783          	lw	a5,68(s6)
    99e8:	00271713          	sll	a4,a4,0x2
    99ec:	00e787b3          	add	a5,a5,a4
    99f0:	0007a703          	lw	a4,0(a5)
    99f4:	00eaa023          	sw	a4,0(s5)
    99f8:	0157a023          	sw	s5,0(a5)
    99fc:	004a0793          	add	a5,s4,4
    9a00:	00040a93          	mv	s5,s0
    9a04:	00279793          	sll	a5,a5,0x2
    9a08:	00fa87b3          	add	a5,s5,a5
    9a0c:	0097a223          	sw	s1,4(a5)
    9a10:	001a0a13          	add	s4,s4,1
    9a14:	014aa823          	sw	s4,16(s5)
    9a18:	f61ff06f          	j	9978 <__multadd+0xc4>
    9a1c:	00005697          	auipc	a3,0x5
    9a20:	75468693          	add	a3,a3,1876 # f170 <__fini_array_end+0x230>
    9a24:	00000613          	li	a2,0
    9a28:	0ba00593          	li	a1,186
    9a2c:	00005517          	auipc	a0,0x5
    9a30:	7d850513          	add	a0,a0,2008 # f204 <__fini_array_end+0x2c4>
    9a34:	5cc010ef          	jal	b000 <__assert_func>

00009a38 <__hi0bits>:
    9a38:	00050793          	mv	a5,a0
    9a3c:	00010737          	lui	a4,0x10
    9a40:	00000513          	li	a0,0
    9a44:	00e7f663          	bgeu	a5,a4,9a50 <__hi0bits+0x18>
    9a48:	01079793          	sll	a5,a5,0x10
    9a4c:	01000513          	li	a0,16
    9a50:	01000737          	lui	a4,0x1000
    9a54:	00e7f663          	bgeu	a5,a4,9a60 <__hi0bits+0x28>
    9a58:	00850513          	add	a0,a0,8
    9a5c:	00879793          	sll	a5,a5,0x8
    9a60:	10000737          	lui	a4,0x10000
    9a64:	00e7f663          	bgeu	a5,a4,9a70 <__hi0bits+0x38>
    9a68:	00450513          	add	a0,a0,4
    9a6c:	00479793          	sll	a5,a5,0x4
    9a70:	40000737          	lui	a4,0x40000
    9a74:	00e7ea63          	bltu	a5,a4,9a88 <__hi0bits+0x50>
    9a78:	fff7c793          	not	a5,a5
    9a7c:	01f7d793          	srl	a5,a5,0x1f
    9a80:	00f50533          	add	a0,a0,a5
    9a84:	00008067          	ret
    9a88:	00279793          	sll	a5,a5,0x2
    9a8c:	0007ca63          	bltz	a5,9aa0 <__hi0bits+0x68>
    9a90:	00179713          	sll	a4,a5,0x1
    9a94:	00074a63          	bltz	a4,9aa8 <__hi0bits+0x70>
    9a98:	02000513          	li	a0,32
    9a9c:	00008067          	ret
    9aa0:	00250513          	add	a0,a0,2
    9aa4:	00008067          	ret
    9aa8:	00350513          	add	a0,a0,3
    9aac:	00008067          	ret

00009ab0 <__lo0bits>:
    9ab0:	00052783          	lw	a5,0(a0)
    9ab4:	00050713          	mv	a4,a0
    9ab8:	0077f693          	and	a3,a5,7
    9abc:	02068463          	beqz	a3,9ae4 <__lo0bits+0x34>
    9ac0:	0017f693          	and	a3,a5,1
    9ac4:	00000513          	li	a0,0
    9ac8:	04069e63          	bnez	a3,9b24 <__lo0bits+0x74>
    9acc:	0027f693          	and	a3,a5,2
    9ad0:	0a068863          	beqz	a3,9b80 <__lo0bits+0xd0>
    9ad4:	0017d793          	srl	a5,a5,0x1
    9ad8:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9adc:	00100513          	li	a0,1
    9ae0:	00008067          	ret
    9ae4:	01079693          	sll	a3,a5,0x10
    9ae8:	0106d693          	srl	a3,a3,0x10
    9aec:	00000513          	li	a0,0
    9af0:	06068e63          	beqz	a3,9b6c <__lo0bits+0xbc>
    9af4:	0ff7f693          	zext.b	a3,a5
    9af8:	06068063          	beqz	a3,9b58 <__lo0bits+0xa8>
    9afc:	00f7f693          	and	a3,a5,15
    9b00:	04068263          	beqz	a3,9b44 <__lo0bits+0x94>
    9b04:	0037f693          	and	a3,a5,3
    9b08:	02068463          	beqz	a3,9b30 <__lo0bits+0x80>
    9b0c:	0017f693          	and	a3,a5,1
    9b10:	00069c63          	bnez	a3,9b28 <__lo0bits+0x78>
    9b14:	0017d793          	srl	a5,a5,0x1
    9b18:	00150513          	add	a0,a0,1
    9b1c:	00079663          	bnez	a5,9b28 <__lo0bits+0x78>
    9b20:	02000513          	li	a0,32
    9b24:	00008067          	ret
    9b28:	00f72023          	sw	a5,0(a4)
    9b2c:	00008067          	ret
    9b30:	0027d793          	srl	a5,a5,0x2
    9b34:	0017f693          	and	a3,a5,1
    9b38:	00250513          	add	a0,a0,2
    9b3c:	fe0696e3          	bnez	a3,9b28 <__lo0bits+0x78>
    9b40:	fd5ff06f          	j	9b14 <__lo0bits+0x64>
    9b44:	0047d793          	srl	a5,a5,0x4
    9b48:	0037f693          	and	a3,a5,3
    9b4c:	00450513          	add	a0,a0,4
    9b50:	fa069ee3          	bnez	a3,9b0c <__lo0bits+0x5c>
    9b54:	fddff06f          	j	9b30 <__lo0bits+0x80>
    9b58:	0087d793          	srl	a5,a5,0x8
    9b5c:	00f7f693          	and	a3,a5,15
    9b60:	00850513          	add	a0,a0,8
    9b64:	fa0690e3          	bnez	a3,9b04 <__lo0bits+0x54>
    9b68:	fddff06f          	j	9b44 <__lo0bits+0x94>
    9b6c:	0107d793          	srl	a5,a5,0x10
    9b70:	0ff7f693          	zext.b	a3,a5
    9b74:	01000513          	li	a0,16
    9b78:	f80692e3          	bnez	a3,9afc <__lo0bits+0x4c>
    9b7c:	fddff06f          	j	9b58 <__lo0bits+0xa8>
    9b80:	0027d793          	srl	a5,a5,0x2
    9b84:	00f72023          	sw	a5,0(a4)
    9b88:	00200513          	li	a0,2
    9b8c:	00008067          	ret

00009b90 <__i2b>:
    9b90:	04452783          	lw	a5,68(a0)
    9b94:	ff010113          	add	sp,sp,-16
    9b98:	00812423          	sw	s0,8(sp)
    9b9c:	00912223          	sw	s1,4(sp)
    9ba0:	00112623          	sw	ra,12(sp)
    9ba4:	00050413          	mv	s0,a0
    9ba8:	00058493          	mv	s1,a1
    9bac:	02078c63          	beqz	a5,9be4 <__i2b+0x54>
    9bb0:	0047a503          	lw	a0,4(a5)
    9bb4:	06050263          	beqz	a0,9c18 <__i2b+0x88>
    9bb8:	00052703          	lw	a4,0(a0)
    9bbc:	00e7a223          	sw	a4,4(a5)
    9bc0:	00c12083          	lw	ra,12(sp)
    9bc4:	00812403          	lw	s0,8(sp)
    9bc8:	00100793          	li	a5,1
    9bcc:	00952a23          	sw	s1,20(a0)
    9bd0:	00052623          	sw	zero,12(a0)
    9bd4:	00f52823          	sw	a5,16(a0)
    9bd8:	00412483          	lw	s1,4(sp)
    9bdc:	01010113          	add	sp,sp,16
    9be0:	00008067          	ret
    9be4:	02100613          	li	a2,33
    9be8:	00400593          	li	a1,4
    9bec:	46c010ef          	jal	b058 <_calloc_r>
    9bf0:	04a42223          	sw	a0,68(s0)
    9bf4:	00050793          	mv	a5,a0
    9bf8:	fa051ce3          	bnez	a0,9bb0 <__i2b+0x20>
    9bfc:	00005697          	auipc	a3,0x5
    9c00:	57468693          	add	a3,a3,1396 # f170 <__fini_array_end+0x230>
    9c04:	00000613          	li	a2,0
    9c08:	14500593          	li	a1,325
    9c0c:	00005517          	auipc	a0,0x5
    9c10:	5f850513          	add	a0,a0,1528 # f204 <__fini_array_end+0x2c4>
    9c14:	3ec010ef          	jal	b000 <__assert_func>
    9c18:	01c00613          	li	a2,28
    9c1c:	00100593          	li	a1,1
    9c20:	00040513          	mv	a0,s0
    9c24:	434010ef          	jal	b058 <_calloc_r>
    9c28:	fc050ae3          	beqz	a0,9bfc <__i2b+0x6c>
    9c2c:	00100793          	li	a5,1
    9c30:	00f52223          	sw	a5,4(a0)
    9c34:	00200793          	li	a5,2
    9c38:	00f52423          	sw	a5,8(a0)
    9c3c:	f85ff06f          	j	9bc0 <__i2b+0x30>

00009c40 <__multiply>:
    9c40:	fb010113          	add	sp,sp,-80
    9c44:	03312e23          	sw	s3,60(sp)
    9c48:	03812423          	sw	s8,40(sp)
    9c4c:	01062983          	lw	s3,16(a2)
    9c50:	0105ac03          	lw	s8,16(a1)
    9c54:	04812423          	sw	s0,72(sp)
    9c58:	03412c23          	sw	s4,56(sp)
    9c5c:	04112623          	sw	ra,76(sp)
    9c60:	03712623          	sw	s7,44(sp)
    9c64:	00058a13          	mv	s4,a1
    9c68:	00060413          	mv	s0,a2
    9c6c:	013c4c63          	blt	s8,s3,9c84 <__multiply+0x44>
    9c70:	00098713          	mv	a4,s3
    9c74:	00058413          	mv	s0,a1
    9c78:	000c0993          	mv	s3,s8
    9c7c:	00060a13          	mv	s4,a2
    9c80:	00070c13          	mv	s8,a4
    9c84:	00842783          	lw	a5,8(s0)
    9c88:	00442583          	lw	a1,4(s0)
    9c8c:	01898bb3          	add	s7,s3,s8
    9c90:	0177a7b3          	slt	a5,a5,s7
    9c94:	00f585b3          	add	a1,a1,a5
    9c98:	b45ff0ef          	jal	97dc <_Balloc>
    9c9c:	00a12623          	sw	a0,12(sp)
    9ca0:	22050863          	beqz	a0,9ed0 <__multiply+0x290>
    9ca4:	00c12783          	lw	a5,12(sp)
    9ca8:	03512a23          	sw	s5,52(sp)
    9cac:	03612823          	sw	s6,48(sp)
    9cb0:	002b9a93          	sll	s5,s7,0x2
    9cb4:	01478b13          	add	s6,a5,20
    9cb8:	015b0ab3          	add	s5,s6,s5
    9cbc:	000b0793          	mv	a5,s6
    9cc0:	015b7863          	bgeu	s6,s5,9cd0 <__multiply+0x90>
    9cc4:	0007a023          	sw	zero,0(a5)
    9cc8:	00478793          	add	a5,a5,4
    9ccc:	ff57ece3          	bltu	a5,s5,9cc4 <__multiply+0x84>
    9cd0:	014a0a13          	add	s4,s4,20
    9cd4:	002c1c13          	sll	s8,s8,0x2
    9cd8:	01440793          	add	a5,s0,20
    9cdc:	018a0733          	add	a4,s4,s8
    9ce0:	00299993          	sll	s3,s3,0x2
    9ce4:	00f12423          	sw	a5,8(sp)
    9ce8:	00e12023          	sw	a4,0(sp)
    9cec:	013789b3          	add	s3,a5,s3
    9cf0:	16ea7c63          	bgeu	s4,a4,9e68 <__multiply+0x228>
    9cf4:	00400713          	li	a4,4
    9cf8:	04912223          	sw	s1,68(sp)
    9cfc:	05212023          	sw	s2,64(sp)
    9d00:	03912223          	sw	s9,36(sp)
    9d04:	03a12023          	sw	s10,32(sp)
    9d08:	01b12e23          	sw	s11,28(sp)
    9d0c:	01540793          	add	a5,s0,21
    9d10:	00e12223          	sw	a4,4(sp)
    9d14:	1af9f263          	bgeu	s3,a5,9eb8 <__multiply+0x278>
    9d18:	00010437          	lui	s0,0x10
    9d1c:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    9d20:	01c0006f          	j	9d3c <__multiply+0xfc>
    9d24:	01095913          	srl	s2,s2,0x10
    9d28:	0a091063          	bnez	s2,9dc8 <__multiply+0x188>
    9d2c:	00012783          	lw	a5,0(sp)
    9d30:	004a0a13          	add	s4,s4,4
    9d34:	004b0b13          	add	s6,s6,4
    9d38:	10fa7e63          	bgeu	s4,a5,9e54 <__multiply+0x214>
    9d3c:	000a2903          	lw	s2,0(s4)
    9d40:	008974b3          	and	s1,s2,s0
    9d44:	fe0480e3          	beqz	s1,9d24 <__multiply+0xe4>
    9d48:	00812c83          	lw	s9,8(sp)
    9d4c:	000b0d13          	mv	s10,s6
    9d50:	00000c13          	li	s8,0
    9d54:	000cad83          	lw	s11,0(s9)
    9d58:	000d2903          	lw	s2,0(s10)
    9d5c:	00048593          	mv	a1,s1
    9d60:	008df533          	and	a0,s11,s0
    9d64:	7e5040ef          	jal	ed48 <__mulsi3>
    9d68:	00897733          	and	a4,s2,s0
    9d6c:	00e50733          	add	a4,a0,a4
    9d70:	00048593          	mv	a1,s1
    9d74:	010dd513          	srl	a0,s11,0x10
    9d78:	01870c33          	add	s8,a4,s8
    9d7c:	01095913          	srl	s2,s2,0x10
    9d80:	7c9040ef          	jal	ed48 <__mulsi3>
    9d84:	010c5713          	srl	a4,s8,0x10
    9d88:	01250533          	add	a0,a0,s2
    9d8c:	00e50533          	add	a0,a0,a4
    9d90:	008c77b3          	and	a5,s8,s0
    9d94:	01051713          	sll	a4,a0,0x10
    9d98:	004d0d13          	add	s10,s10,4
    9d9c:	00f767b3          	or	a5,a4,a5
    9da0:	004c8c93          	add	s9,s9,4
    9da4:	fefd2e23          	sw	a5,-4(s10)
    9da8:	01055c13          	srl	s8,a0,0x10
    9dac:	fb3ce4e3          	bltu	s9,s3,9d54 <__multiply+0x114>
    9db0:	00412783          	lw	a5,4(sp)
    9db4:	00fb0733          	add	a4,s6,a5
    9db8:	01872023          	sw	s8,0(a4)
    9dbc:	000a2903          	lw	s2,0(s4)
    9dc0:	01095913          	srl	s2,s2,0x10
    9dc4:	f60904e3          	beqz	s2,9d2c <__multiply+0xec>
    9dc8:	000b2c83          	lw	s9,0(s6)
    9dcc:	00812d03          	lw	s10,8(sp)
    9dd0:	000b0c13          	mv	s8,s6
    9dd4:	000c8493          	mv	s1,s9
    9dd8:	00000d93          	li	s11,0
    9ddc:	000d2503          	lw	a0,0(s10)
    9de0:	00090593          	mv	a1,s2
    9de4:	0104d493          	srl	s1,s1,0x10
    9de8:	00857533          	and	a0,a0,s0
    9dec:	75d040ef          	jal	ed48 <__mulsi3>
    9df0:	01b50733          	add	a4,a0,s11
    9df4:	00970db3          	add	s11,a4,s1
    9df8:	010d9593          	sll	a1,s11,0x10
    9dfc:	008cf7b3          	and	a5,s9,s0
    9e00:	00f5e7b3          	or	a5,a1,a5
    9e04:	00fc2023          	sw	a5,0(s8)
    9e08:	002d5503          	lhu	a0,2(s10)
    9e0c:	004c2483          	lw	s1,4(s8)
    9e10:	00090593          	mv	a1,s2
    9e14:	735040ef          	jal	ed48 <__mulsi3>
    9e18:	0084f7b3          	and	a5,s1,s0
    9e1c:	010dd713          	srl	a4,s11,0x10
    9e20:	00f507b3          	add	a5,a0,a5
    9e24:	004d0d13          	add	s10,s10,4
    9e28:	00e78cb3          	add	s9,a5,a4
    9e2c:	004c0c13          	add	s8,s8,4
    9e30:	010cdd93          	srl	s11,s9,0x10
    9e34:	fb3d64e3          	bltu	s10,s3,9ddc <__multiply+0x19c>
    9e38:	00412783          	lw	a5,4(sp)
    9e3c:	004a0a13          	add	s4,s4,4
    9e40:	00fb0733          	add	a4,s6,a5
    9e44:	00012783          	lw	a5,0(sp)
    9e48:	01972023          	sw	s9,0(a4)
    9e4c:	004b0b13          	add	s6,s6,4
    9e50:	eefa66e3          	bltu	s4,a5,9d3c <__multiply+0xfc>
    9e54:	04412483          	lw	s1,68(sp)
    9e58:	04012903          	lw	s2,64(sp)
    9e5c:	02412c83          	lw	s9,36(sp)
    9e60:	02012d03          	lw	s10,32(sp)
    9e64:	01c12d83          	lw	s11,28(sp)
    9e68:	01704863          	bgtz	s7,9e78 <__multiply+0x238>
    9e6c:	0180006f          	j	9e84 <__multiply+0x244>
    9e70:	fffb8b93          	add	s7,s7,-1
    9e74:	000b8863          	beqz	s7,9e84 <__multiply+0x244>
    9e78:	ffcaa783          	lw	a5,-4(s5)
    9e7c:	ffca8a93          	add	s5,s5,-4
    9e80:	fe0788e3          	beqz	a5,9e70 <__multiply+0x230>
    9e84:	00c12783          	lw	a5,12(sp)
    9e88:	04c12083          	lw	ra,76(sp)
    9e8c:	04812403          	lw	s0,72(sp)
    9e90:	0177a823          	sw	s7,16(a5)
    9e94:	03412a83          	lw	s5,52(sp)
    9e98:	03012b03          	lw	s6,48(sp)
    9e9c:	03c12983          	lw	s3,60(sp)
    9ea0:	03812a03          	lw	s4,56(sp)
    9ea4:	02c12b83          	lw	s7,44(sp)
    9ea8:	02812c03          	lw	s8,40(sp)
    9eac:	00078513          	mv	a0,a5
    9eb0:	05010113          	add	sp,sp,80
    9eb4:	00008067          	ret
    9eb8:	408987b3          	sub	a5,s3,s0
    9ebc:	feb78793          	add	a5,a5,-21
    9ec0:	ffc7f793          	and	a5,a5,-4
    9ec4:	00478793          	add	a5,a5,4
    9ec8:	00f12223          	sw	a5,4(sp)
    9ecc:	e4dff06f          	j	9d18 <__multiply+0xd8>
    9ed0:	00005697          	auipc	a3,0x5
    9ed4:	2a068693          	add	a3,a3,672 # f170 <__fini_array_end+0x230>
    9ed8:	00000613          	li	a2,0
    9edc:	16200593          	li	a1,354
    9ee0:	00005517          	auipc	a0,0x5
    9ee4:	32450513          	add	a0,a0,804 # f204 <__fini_array_end+0x2c4>
    9ee8:	04912223          	sw	s1,68(sp)
    9eec:	05212023          	sw	s2,64(sp)
    9ef0:	03512a23          	sw	s5,52(sp)
    9ef4:	03612823          	sw	s6,48(sp)
    9ef8:	03912223          	sw	s9,36(sp)
    9efc:	03a12023          	sw	s10,32(sp)
    9f00:	01b12e23          	sw	s11,28(sp)
    9f04:	0fc010ef          	jal	b000 <__assert_func>

00009f08 <__pow5mult>:
    9f08:	fe010113          	add	sp,sp,-32
    9f0c:	00812c23          	sw	s0,24(sp)
    9f10:	01212823          	sw	s2,16(sp)
    9f14:	01312623          	sw	s3,12(sp)
    9f18:	00112e23          	sw	ra,28(sp)
    9f1c:	00367793          	and	a5,a2,3
    9f20:	00060413          	mv	s0,a2
    9f24:	00050993          	mv	s3,a0
    9f28:	00058913          	mv	s2,a1
    9f2c:	0a079c63          	bnez	a5,9fe4 <__pow5mult+0xdc>
    9f30:	40245413          	sra	s0,s0,0x2
    9f34:	06040a63          	beqz	s0,9fa8 <__pow5mult+0xa0>
    9f38:	00912a23          	sw	s1,20(sp)
    9f3c:	0409a483          	lw	s1,64(s3)
    9f40:	0c048663          	beqz	s1,a00c <__pow5mult+0x104>
    9f44:	00147793          	and	a5,s0,1
    9f48:	02079063          	bnez	a5,9f68 <__pow5mult+0x60>
    9f4c:	40145413          	sra	s0,s0,0x1
    9f50:	04040a63          	beqz	s0,9fa4 <__pow5mult+0x9c>
    9f54:	0004a503          	lw	a0,0(s1)
    9f58:	06050663          	beqz	a0,9fc4 <__pow5mult+0xbc>
    9f5c:	00050493          	mv	s1,a0
    9f60:	00147793          	and	a5,s0,1
    9f64:	fe0784e3          	beqz	a5,9f4c <__pow5mult+0x44>
    9f68:	00048613          	mv	a2,s1
    9f6c:	00090593          	mv	a1,s2
    9f70:	00098513          	mv	a0,s3
    9f74:	ccdff0ef          	jal	9c40 <__multiply>
    9f78:	02090063          	beqz	s2,9f98 <__pow5mult+0x90>
    9f7c:	00492703          	lw	a4,4(s2)
    9f80:	0449a783          	lw	a5,68(s3)
    9f84:	00271713          	sll	a4,a4,0x2
    9f88:	00e787b3          	add	a5,a5,a4
    9f8c:	0007a703          	lw	a4,0(a5)
    9f90:	00e92023          	sw	a4,0(s2)
    9f94:	0127a023          	sw	s2,0(a5)
    9f98:	40145413          	sra	s0,s0,0x1
    9f9c:	00050913          	mv	s2,a0
    9fa0:	fa041ae3          	bnez	s0,9f54 <__pow5mult+0x4c>
    9fa4:	01412483          	lw	s1,20(sp)
    9fa8:	01c12083          	lw	ra,28(sp)
    9fac:	01812403          	lw	s0,24(sp)
    9fb0:	00c12983          	lw	s3,12(sp)
    9fb4:	00090513          	mv	a0,s2
    9fb8:	01012903          	lw	s2,16(sp)
    9fbc:	02010113          	add	sp,sp,32
    9fc0:	00008067          	ret
    9fc4:	00048613          	mv	a2,s1
    9fc8:	00048593          	mv	a1,s1
    9fcc:	00098513          	mv	a0,s3
    9fd0:	c71ff0ef          	jal	9c40 <__multiply>
    9fd4:	00a4a023          	sw	a0,0(s1)
    9fd8:	00052023          	sw	zero,0(a0)
    9fdc:	00050493          	mv	s1,a0
    9fe0:	f81ff06f          	j	9f60 <__pow5mult+0x58>
    9fe4:	fff78793          	add	a5,a5,-1
    9fe8:	00005717          	auipc	a4,0x5
    9fec:	79070713          	add	a4,a4,1936 # f778 <p05.0>
    9ff0:	00279793          	sll	a5,a5,0x2
    9ff4:	00f707b3          	add	a5,a4,a5
    9ff8:	0007a603          	lw	a2,0(a5)
    9ffc:	00000693          	li	a3,0
    a000:	8b5ff0ef          	jal	98b4 <__multadd>
    a004:	00050913          	mv	s2,a0
    a008:	f29ff06f          	j	9f30 <__pow5mult+0x28>
    a00c:	00100593          	li	a1,1
    a010:	00098513          	mv	a0,s3
    a014:	fc8ff0ef          	jal	97dc <_Balloc>
    a018:	00050493          	mv	s1,a0
    a01c:	02050063          	beqz	a0,a03c <__pow5mult+0x134>
    a020:	27100793          	li	a5,625
    a024:	00f52a23          	sw	a5,20(a0)
    a028:	00100793          	li	a5,1
    a02c:	00f52823          	sw	a5,16(a0)
    a030:	04a9a023          	sw	a0,64(s3)
    a034:	00052023          	sw	zero,0(a0)
    a038:	f0dff06f          	j	9f44 <__pow5mult+0x3c>
    a03c:	00005697          	auipc	a3,0x5
    a040:	13468693          	add	a3,a3,308 # f170 <__fini_array_end+0x230>
    a044:	00000613          	li	a2,0
    a048:	14500593          	li	a1,325
    a04c:	00005517          	auipc	a0,0x5
    a050:	1b850513          	add	a0,a0,440 # f204 <__fini_array_end+0x2c4>
    a054:	7ad000ef          	jal	b000 <__assert_func>

0000a058 <__lshift>:
    a058:	fe010113          	add	sp,sp,-32
    a05c:	01512223          	sw	s5,4(sp)
    a060:	0105aa83          	lw	s5,16(a1)
    a064:	0085a783          	lw	a5,8(a1)
    a068:	01312623          	sw	s3,12(sp)
    a06c:	40565993          	sra	s3,a2,0x5
    a070:	01598ab3          	add	s5,s3,s5
    a074:	00812c23          	sw	s0,24(sp)
    a078:	00912a23          	sw	s1,20(sp)
    a07c:	01212823          	sw	s2,16(sp)
    a080:	01412423          	sw	s4,8(sp)
    a084:	00112e23          	sw	ra,28(sp)
    a088:	001a8913          	add	s2,s5,1
    a08c:	00058493          	mv	s1,a1
    a090:	00060413          	mv	s0,a2
    a094:	0045a583          	lw	a1,4(a1)
    a098:	00050a13          	mv	s4,a0
    a09c:	0127d863          	bge	a5,s2,a0ac <__lshift+0x54>
    a0a0:	00179793          	sll	a5,a5,0x1
    a0a4:	00158593          	add	a1,a1,1
    a0a8:	ff27cce3          	blt	a5,s2,a0a0 <__lshift+0x48>
    a0ac:	000a0513          	mv	a0,s4
    a0b0:	f2cff0ef          	jal	97dc <_Balloc>
    a0b4:	10050c63          	beqz	a0,a1cc <__lshift+0x174>
    a0b8:	01450813          	add	a6,a0,20
    a0bc:	03305463          	blez	s3,a0e4 <__lshift+0x8c>
    a0c0:	00598993          	add	s3,s3,5
    a0c4:	00299993          	sll	s3,s3,0x2
    a0c8:	01350733          	add	a4,a0,s3
    a0cc:	00080793          	mv	a5,a6
    a0d0:	00478793          	add	a5,a5,4
    a0d4:	fe07ae23          	sw	zero,-4(a5)
    a0d8:	fee79ce3          	bne	a5,a4,a0d0 <__lshift+0x78>
    a0dc:	fec98993          	add	s3,s3,-20
    a0e0:	01380833          	add	a6,a6,s3
    a0e4:	0104a883          	lw	a7,16(s1)
    a0e8:	01448793          	add	a5,s1,20
    a0ec:	01f47613          	and	a2,s0,31
    a0f0:	00289893          	sll	a7,a7,0x2
    a0f4:	011788b3          	add	a7,a5,a7
    a0f8:	0a060463          	beqz	a2,a1a0 <__lshift+0x148>
    a0fc:	02000593          	li	a1,32
    a100:	40c585b3          	sub	a1,a1,a2
    a104:	00080313          	mv	t1,a6
    a108:	00000693          	li	a3,0
    a10c:	0007a703          	lw	a4,0(a5)
    a110:	00430313          	add	t1,t1,4
    a114:	00478793          	add	a5,a5,4
    a118:	00c71733          	sll	a4,a4,a2
    a11c:	00d76733          	or	a4,a4,a3
    a120:	fee32e23          	sw	a4,-4(t1)
    a124:	ffc7a683          	lw	a3,-4(a5)
    a128:	00b6d6b3          	srl	a3,a3,a1
    a12c:	ff17e0e3          	bltu	a5,a7,a10c <__lshift+0xb4>
    a130:	01548793          	add	a5,s1,21
    a134:	00400713          	li	a4,4
    a138:	00f8ea63          	bltu	a7,a5,a14c <__lshift+0xf4>
    a13c:	409887b3          	sub	a5,a7,s1
    a140:	feb78793          	add	a5,a5,-21
    a144:	ffc7f793          	and	a5,a5,-4
    a148:	00478713          	add	a4,a5,4
    a14c:	00e80833          	add	a6,a6,a4
    a150:	00d82023          	sw	a3,0(a6)
    a154:	00069463          	bnez	a3,a15c <__lshift+0x104>
    a158:	000a8913          	mv	s2,s5
    a15c:	0044a703          	lw	a4,4(s1)
    a160:	044a2783          	lw	a5,68(s4)
    a164:	01c12083          	lw	ra,28(sp)
    a168:	00271713          	sll	a4,a4,0x2
    a16c:	00e787b3          	add	a5,a5,a4
    a170:	0007a703          	lw	a4,0(a5)
    a174:	01252823          	sw	s2,16(a0)
    a178:	01812403          	lw	s0,24(sp)
    a17c:	00e4a023          	sw	a4,0(s1)
    a180:	0097a023          	sw	s1,0(a5)
    a184:	01012903          	lw	s2,16(sp)
    a188:	01412483          	lw	s1,20(sp)
    a18c:	00c12983          	lw	s3,12(sp)
    a190:	00812a03          	lw	s4,8(sp)
    a194:	00412a83          	lw	s5,4(sp)
    a198:	02010113          	add	sp,sp,32
    a19c:	00008067          	ret
    a1a0:	0007a703          	lw	a4,0(a5)
    a1a4:	00478793          	add	a5,a5,4
    a1a8:	00480813          	add	a6,a6,4
    a1ac:	fee82e23          	sw	a4,-4(a6)
    a1b0:	fb17f4e3          	bgeu	a5,a7,a158 <__lshift+0x100>
    a1b4:	0007a703          	lw	a4,0(a5)
    a1b8:	00478793          	add	a5,a5,4
    a1bc:	00480813          	add	a6,a6,4
    a1c0:	fee82e23          	sw	a4,-4(a6)
    a1c4:	fd17eee3          	bltu	a5,a7,a1a0 <__lshift+0x148>
    a1c8:	f91ff06f          	j	a158 <__lshift+0x100>
    a1cc:	00005697          	auipc	a3,0x5
    a1d0:	fa468693          	add	a3,a3,-92 # f170 <__fini_array_end+0x230>
    a1d4:	00000613          	li	a2,0
    a1d8:	1de00593          	li	a1,478
    a1dc:	00005517          	auipc	a0,0x5
    a1e0:	02850513          	add	a0,a0,40 # f204 <__fini_array_end+0x2c4>
    a1e4:	61d000ef          	jal	b000 <__assert_func>

0000a1e8 <__mcmp>:
    a1e8:	01052703          	lw	a4,16(a0)
    a1ec:	0105a783          	lw	a5,16(a1)
    a1f0:	00050813          	mv	a6,a0
    a1f4:	40f70533          	sub	a0,a4,a5
    a1f8:	04f71263          	bne	a4,a5,a23c <__mcmp+0x54>
    a1fc:	00279793          	sll	a5,a5,0x2
    a200:	01480813          	add	a6,a6,20
    a204:	01458593          	add	a1,a1,20
    a208:	00f80733          	add	a4,a6,a5
    a20c:	00f587b3          	add	a5,a1,a5
    a210:	0080006f          	j	a218 <__mcmp+0x30>
    a214:	02e87463          	bgeu	a6,a4,a23c <__mcmp+0x54>
    a218:	ffc72603          	lw	a2,-4(a4)
    a21c:	ffc7a683          	lw	a3,-4(a5)
    a220:	ffc70713          	add	a4,a4,-4
    a224:	ffc78793          	add	a5,a5,-4
    a228:	fed606e3          	beq	a2,a3,a214 <__mcmp+0x2c>
    a22c:	00100513          	li	a0,1
    a230:	00d67663          	bgeu	a2,a3,a23c <__mcmp+0x54>
    a234:	fff00513          	li	a0,-1
    a238:	00008067          	ret
    a23c:	00008067          	ret

0000a240 <__mdiff>:
    a240:	0105a703          	lw	a4,16(a1)
    a244:	01062783          	lw	a5,16(a2)
    a248:	ff010113          	add	sp,sp,-16
    a24c:	00812423          	sw	s0,8(sp)
    a250:	00912223          	sw	s1,4(sp)
    a254:	00112623          	sw	ra,12(sp)
    a258:	01212023          	sw	s2,0(sp)
    a25c:	00058413          	mv	s0,a1
    a260:	00060493          	mv	s1,a2
    a264:	40f706b3          	sub	a3,a4,a5
    a268:	18f71e63          	bne	a4,a5,a404 <__mdiff+0x1c4>
    a26c:	00279693          	sll	a3,a5,0x2
    a270:	01458613          	add	a2,a1,20
    a274:	01448713          	add	a4,s1,20
    a278:	00d607b3          	add	a5,a2,a3
    a27c:	00d70733          	add	a4,a4,a3
    a280:	0080006f          	j	a288 <__mdiff+0x48>
    a284:	18f67c63          	bgeu	a2,a5,a41c <__mdiff+0x1dc>
    a288:	ffc7a583          	lw	a1,-4(a5)
    a28c:	ffc72683          	lw	a3,-4(a4)
    a290:	ffc78793          	add	a5,a5,-4
    a294:	ffc70713          	add	a4,a4,-4
    a298:	fed586e3          	beq	a1,a3,a284 <__mdiff+0x44>
    a29c:	00100913          	li	s2,1
    a2a0:	00d5ea63          	bltu	a1,a3,a2b4 <__mdiff+0x74>
    a2a4:	00048793          	mv	a5,s1
    a2a8:	00000913          	li	s2,0
    a2ac:	00040493          	mv	s1,s0
    a2b0:	00078413          	mv	s0,a5
    a2b4:	0044a583          	lw	a1,4(s1)
    a2b8:	d24ff0ef          	jal	97dc <_Balloc>
    a2bc:	1a050663          	beqz	a0,a468 <__mdiff+0x228>
    a2c0:	0104a883          	lw	a7,16(s1)
    a2c4:	01042283          	lw	t0,16(s0)
    a2c8:	01448f93          	add	t6,s1,20
    a2cc:	00289313          	sll	t1,a7,0x2
    a2d0:	01440813          	add	a6,s0,20
    a2d4:	00229293          	sll	t0,t0,0x2
    a2d8:	01450593          	add	a1,a0,20
    a2dc:	00010e37          	lui	t3,0x10
    a2e0:	01252623          	sw	s2,12(a0)
    a2e4:	006f8333          	add	t1,t6,t1
    a2e8:	005802b3          	add	t0,a6,t0
    a2ec:	00058f13          	mv	t5,a1
    a2f0:	000f8e93          	mv	t4,t6
    a2f4:	00000693          	li	a3,0
    a2f8:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    a2fc:	000ea703          	lw	a4,0(t4)
    a300:	00082603          	lw	a2,0(a6)
    a304:	004f0f13          	add	t5,t5,4
    a308:	01c777b3          	and	a5,a4,t3
    a30c:	01c673b3          	and	t2,a2,t3
    a310:	407787b3          	sub	a5,a5,t2
    a314:	00d787b3          	add	a5,a5,a3
    a318:	01075713          	srl	a4,a4,0x10
    a31c:	01065613          	srl	a2,a2,0x10
    a320:	4107d693          	sra	a3,a5,0x10
    a324:	40c70733          	sub	a4,a4,a2
    a328:	00d70733          	add	a4,a4,a3
    a32c:	01071693          	sll	a3,a4,0x10
    a330:	01c7f7b3          	and	a5,a5,t3
    a334:	00d7e7b3          	or	a5,a5,a3
    a338:	00480813          	add	a6,a6,4
    a33c:	feff2e23          	sw	a5,-4(t5)
    a340:	004e8e93          	add	t4,t4,4
    a344:	41075693          	sra	a3,a4,0x10
    a348:	fa586ae3          	bltu	a6,t0,a2fc <__mdiff+0xbc>
    a34c:	01540713          	add	a4,s0,21
    a350:	40828433          	sub	s0,t0,s0
    a354:	feb40413          	add	s0,s0,-21
    a358:	00e2b2b3          	sltu	t0,t0,a4
    a35c:	0012cf13          	xor	t5,t0,1
    a360:	00245413          	srl	s0,s0,0x2
    a364:	00400713          	li	a4,4
    a368:	0a028463          	beqz	t0,a410 <__mdiff+0x1d0>
    a36c:	00ef8fb3          	add	t6,t6,a4
    a370:	00e58833          	add	a6,a1,a4
    a374:	00010eb7          	lui	t4,0x10
    a378:	00080e13          	mv	t3,a6
    a37c:	000f8613          	mv	a2,t6
    a380:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    a384:	0c6ff463          	bgeu	t6,t1,a44c <__mdiff+0x20c>
    a388:	00062783          	lw	a5,0(a2)
    a38c:	004e0e13          	add	t3,t3,4
    a390:	00460613          	add	a2,a2,4
    a394:	01d7f733          	and	a4,a5,t4
    a398:	00d70733          	add	a4,a4,a3
    a39c:	0107d593          	srl	a1,a5,0x10
    a3a0:	41075713          	sra	a4,a4,0x10
    a3a4:	00b70733          	add	a4,a4,a1
    a3a8:	00d787b3          	add	a5,a5,a3
    a3ac:	01d7f7b3          	and	a5,a5,t4
    a3b0:	01071693          	sll	a3,a4,0x10
    a3b4:	00d7e7b3          	or	a5,a5,a3
    a3b8:	fefe2e23          	sw	a5,-4(t3)
    a3bc:	41075693          	sra	a3,a4,0x10
    a3c0:	fc6664e3          	bltu	a2,t1,a388 <__mdiff+0x148>
    a3c4:	fff30313          	add	t1,t1,-1
    a3c8:	41f30333          	sub	t1,t1,t6
    a3cc:	ffc37313          	and	t1,t1,-4
    a3d0:	00680733          	add	a4,a6,t1
    a3d4:	00079a63          	bnez	a5,a3e8 <__mdiff+0x1a8>
    a3d8:	ffc72783          	lw	a5,-4(a4)
    a3dc:	fff88893          	add	a7,a7,-1
    a3e0:	ffc70713          	add	a4,a4,-4
    a3e4:	fe078ae3          	beqz	a5,a3d8 <__mdiff+0x198>
    a3e8:	00c12083          	lw	ra,12(sp)
    a3ec:	00812403          	lw	s0,8(sp)
    a3f0:	01152823          	sw	a7,16(a0)
    a3f4:	00412483          	lw	s1,4(sp)
    a3f8:	00012903          	lw	s2,0(sp)
    a3fc:	01010113          	add	sp,sp,16
    a400:	00008067          	ret
    a404:	00100913          	li	s2,1
    a408:	e806dee3          	bgez	a3,a2a4 <__mdiff+0x64>
    a40c:	ea9ff06f          	j	a2b4 <__mdiff+0x74>
    a410:	00140713          	add	a4,s0,1
    a414:	00271713          	sll	a4,a4,0x2
    a418:	f55ff06f          	j	a36c <__mdiff+0x12c>
    a41c:	00000593          	li	a1,0
    a420:	bbcff0ef          	jal	97dc <_Balloc>
    a424:	06050063          	beqz	a0,a484 <__mdiff+0x244>
    a428:	00c12083          	lw	ra,12(sp)
    a42c:	00812403          	lw	s0,8(sp)
    a430:	00100793          	li	a5,1
    a434:	00f52823          	sw	a5,16(a0)
    a438:	00052a23          	sw	zero,20(a0)
    a43c:	00412483          	lw	s1,4(sp)
    a440:	00012903          	lw	s2,0(sp)
    a444:	01010113          	add	sp,sp,16
    a448:	00008067          	ret
    a44c:	00000713          	li	a4,0
    a450:	000f1663          	bnez	t5,a45c <__mdiff+0x21c>
    a454:	00e58733          	add	a4,a1,a4
    a458:	f7dff06f          	j	a3d4 <__mdiff+0x194>
    a45c:	00241713          	sll	a4,s0,0x2
    a460:	00e58733          	add	a4,a1,a4
    a464:	f71ff06f          	j	a3d4 <__mdiff+0x194>
    a468:	00005697          	auipc	a3,0x5
    a46c:	d0868693          	add	a3,a3,-760 # f170 <__fini_array_end+0x230>
    a470:	00000613          	li	a2,0
    a474:	24500593          	li	a1,581
    a478:	00005517          	auipc	a0,0x5
    a47c:	d8c50513          	add	a0,a0,-628 # f204 <__fini_array_end+0x2c4>
    a480:	381000ef          	jal	b000 <__assert_func>
    a484:	00005697          	auipc	a3,0x5
    a488:	cec68693          	add	a3,a3,-788 # f170 <__fini_array_end+0x230>
    a48c:	00000613          	li	a2,0
    a490:	23700593          	li	a1,567
    a494:	00005517          	auipc	a0,0x5
    a498:	d7050513          	add	a0,a0,-656 # f204 <__fini_array_end+0x2c4>
    a49c:	365000ef          	jal	b000 <__assert_func>

0000a4a0 <__d2b>:
    a4a0:	fd010113          	add	sp,sp,-48
    a4a4:	01512a23          	sw	s5,20(sp)
    a4a8:	00058a93          	mv	s5,a1
    a4ac:	00100593          	li	a1,1
    a4b0:	02912223          	sw	s1,36(sp)
    a4b4:	01312e23          	sw	s3,28(sp)
    a4b8:	01412c23          	sw	s4,24(sp)
    a4bc:	02112623          	sw	ra,44(sp)
    a4c0:	02812423          	sw	s0,40(sp)
    a4c4:	03212023          	sw	s2,32(sp)
    a4c8:	00060493          	mv	s1,a2
    a4cc:	00068a13          	mv	s4,a3
    a4d0:	00070993          	mv	s3,a4
    a4d4:	b08ff0ef          	jal	97dc <_Balloc>
    a4d8:	10050263          	beqz	a0,a5dc <__d2b+0x13c>
    a4dc:	00100737          	lui	a4,0x100
    a4e0:	0144d913          	srl	s2,s1,0x14
    a4e4:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a4e8:	7ff97913          	and	s2,s2,2047
    a4ec:	00050413          	mv	s0,a0
    a4f0:	0097f7b3          	and	a5,a5,s1
    a4f4:	00090463          	beqz	s2,a4fc <__d2b+0x5c>
    a4f8:	00e7e7b3          	or	a5,a5,a4
    a4fc:	00f12623          	sw	a5,12(sp)
    a500:	060a9263          	bnez	s5,a564 <__d2b+0xc4>
    a504:	00c10513          	add	a0,sp,12
    a508:	da8ff0ef          	jal	9ab0 <__lo0bits>
    a50c:	00c12703          	lw	a4,12(sp)
    a510:	00100493          	li	s1,1
    a514:	00942823          	sw	s1,16(s0)
    a518:	00e42a23          	sw	a4,20(s0)
    a51c:	02050793          	add	a5,a0,32
    a520:	08090863          	beqz	s2,a5b0 <__d2b+0x110>
    a524:	bcd90913          	add	s2,s2,-1075
    a528:	00f90933          	add	s2,s2,a5
    a52c:	03500493          	li	s1,53
    a530:	012a2023          	sw	s2,0(s4)
    a534:	40f48533          	sub	a0,s1,a5
    a538:	00a9a023          	sw	a0,0(s3)
    a53c:	02c12083          	lw	ra,44(sp)
    a540:	00040513          	mv	a0,s0
    a544:	02812403          	lw	s0,40(sp)
    a548:	02412483          	lw	s1,36(sp)
    a54c:	02012903          	lw	s2,32(sp)
    a550:	01c12983          	lw	s3,28(sp)
    a554:	01812a03          	lw	s4,24(sp)
    a558:	01412a83          	lw	s5,20(sp)
    a55c:	03010113          	add	sp,sp,48
    a560:	00008067          	ret
    a564:	00810513          	add	a0,sp,8
    a568:	01512423          	sw	s5,8(sp)
    a56c:	d44ff0ef          	jal	9ab0 <__lo0bits>
    a570:	00c12703          	lw	a4,12(sp)
    a574:	00050793          	mv	a5,a0
    a578:	04050e63          	beqz	a0,a5d4 <__d2b+0x134>
    a57c:	00812603          	lw	a2,8(sp)
    a580:	02000693          	li	a3,32
    a584:	40a686b3          	sub	a3,a3,a0
    a588:	00d716b3          	sll	a3,a4,a3
    a58c:	00a75733          	srl	a4,a4,a0
    a590:	00c6e6b3          	or	a3,a3,a2
    a594:	00e12623          	sw	a4,12(sp)
    a598:	00e034b3          	snez	s1,a4
    a59c:	00148493          	add	s1,s1,1
    a5a0:	00d42a23          	sw	a3,20(s0)
    a5a4:	00e42c23          	sw	a4,24(s0)
    a5a8:	00942823          	sw	s1,16(s0)
    a5ac:	f6091ce3          	bnez	s2,a524 <__d2b+0x84>
    a5b0:	00249713          	sll	a4,s1,0x2
    a5b4:	00e40733          	add	a4,s0,a4
    a5b8:	01072503          	lw	a0,16(a4)
    a5bc:	bce78793          	add	a5,a5,-1074
    a5c0:	00fa2023          	sw	a5,0(s4)
    a5c4:	c74ff0ef          	jal	9a38 <__hi0bits>
    a5c8:	00549493          	sll	s1,s1,0x5
    a5cc:	40a48533          	sub	a0,s1,a0
    a5d0:	f69ff06f          	j	a538 <__d2b+0x98>
    a5d4:	00812683          	lw	a3,8(sp)
    a5d8:	fc1ff06f          	j	a598 <__d2b+0xf8>
    a5dc:	00005697          	auipc	a3,0x5
    a5e0:	b9468693          	add	a3,a3,-1132 # f170 <__fini_array_end+0x230>
    a5e4:	00000613          	li	a2,0
    a5e8:	30f00593          	li	a1,783
    a5ec:	00005517          	auipc	a0,0x5
    a5f0:	c1850513          	add	a0,a0,-1000 # f204 <__fini_array_end+0x2c4>
    a5f4:	20d000ef          	jal	b000 <__assert_func>

0000a5f8 <_realloc_r>:
    a5f8:	fd010113          	add	sp,sp,-48
    a5fc:	02912223          	sw	s1,36(sp)
    a600:	02112623          	sw	ra,44(sp)
    a604:	00060493          	mv	s1,a2
    a608:	1e058863          	beqz	a1,a7f8 <_realloc_r+0x200>
    a60c:	02812423          	sw	s0,40(sp)
    a610:	03212023          	sw	s2,32(sp)
    a614:	00058413          	mv	s0,a1
    a618:	01312e23          	sw	s3,28(sp)
    a61c:	01512a23          	sw	s5,20(sp)
    a620:	01412c23          	sw	s4,24(sp)
    a624:	00050913          	mv	s2,a0
    a628:	8b1f70ef          	jal	1ed8 <__malloc_lock>
    a62c:	ffc42703          	lw	a4,-4(s0)
    a630:	00b48793          	add	a5,s1,11
    a634:	01600693          	li	a3,22
    a638:	ff840a93          	add	s5,s0,-8
    a63c:	ffc77993          	and	s3,a4,-4
    a640:	10f6f263          	bgeu	a3,a5,a744 <_realloc_r+0x14c>
    a644:	ff87fa13          	and	s4,a5,-8
    a648:	1007c263          	bltz	a5,a74c <_realloc_r+0x154>
    a64c:	109a6063          	bltu	s4,s1,a74c <_realloc_r+0x154>
    a650:	1349d263          	bge	s3,s4,a774 <_realloc_r+0x17c>
    a654:	01812423          	sw	s8,8(sp)
    a658:	7fff6c17          	auipc	s8,0x7fff6
    a65c:	ac8c0c13          	add	s8,s8,-1336 # 80000120 <__malloc_av_>
    a660:	008c2603          	lw	a2,8(s8)
    a664:	013a86b3          	add	a3,s5,s3
    a668:	0046a783          	lw	a5,4(a3)
    a66c:	1cd60863          	beq	a2,a3,a83c <_realloc_r+0x244>
    a670:	ffe7f613          	and	a2,a5,-2
    a674:	00c68633          	add	a2,a3,a2
    a678:	00462603          	lw	a2,4(a2)
    a67c:	00167613          	and	a2,a2,1
    a680:	14061a63          	bnez	a2,a7d4 <_realloc_r+0x1dc>
    a684:	ffc7f793          	and	a5,a5,-4
    a688:	00f98633          	add	a2,s3,a5
    a68c:	0d465863          	bge	a2,s4,a75c <_realloc_r+0x164>
    a690:	00177713          	and	a4,a4,1
    a694:	02071c63          	bnez	a4,a6cc <_realloc_r+0xd4>
    a698:	01712623          	sw	s7,12(sp)
    a69c:	ff842b83          	lw	s7,-8(s0)
    a6a0:	01612823          	sw	s6,16(sp)
    a6a4:	417a8bb3          	sub	s7,s5,s7
    a6a8:	004ba703          	lw	a4,4(s7)
    a6ac:	ffc77713          	and	a4,a4,-4
    a6b0:	00e787b3          	add	a5,a5,a4
    a6b4:	01378b33          	add	s6,a5,s3
    a6b8:	334b5c63          	bge	s6,s4,a9f0 <_realloc_r+0x3f8>
    a6bc:	00e98b33          	add	s6,s3,a4
    a6c0:	294b5863          	bge	s6,s4,a950 <_realloc_r+0x358>
    a6c4:	01012b03          	lw	s6,16(sp)
    a6c8:	00c12b83          	lw	s7,12(sp)
    a6cc:	00048593          	mv	a1,s1
    a6d0:	00090513          	mv	a0,s2
    a6d4:	824f70ef          	jal	16f8 <_malloc_r>
    a6d8:	00050493          	mv	s1,a0
    a6dc:	40050863          	beqz	a0,aaec <_realloc_r+0x4f4>
    a6e0:	ffc42783          	lw	a5,-4(s0)
    a6e4:	ff850713          	add	a4,a0,-8
    a6e8:	ffe7f793          	and	a5,a5,-2
    a6ec:	00fa87b3          	add	a5,s5,a5
    a6f0:	24e78663          	beq	a5,a4,a93c <_realloc_r+0x344>
    a6f4:	ffc98613          	add	a2,s3,-4
    a6f8:	02400793          	li	a5,36
    a6fc:	2ec7e463          	bltu	a5,a2,a9e4 <_realloc_r+0x3ec>
    a700:	01300713          	li	a4,19
    a704:	20c76a63          	bltu	a4,a2,a918 <_realloc_r+0x320>
    a708:	00050793          	mv	a5,a0
    a70c:	00040713          	mv	a4,s0
    a710:	00072683          	lw	a3,0(a4)
    a714:	00d7a023          	sw	a3,0(a5)
    a718:	00472683          	lw	a3,4(a4)
    a71c:	00d7a223          	sw	a3,4(a5)
    a720:	00872703          	lw	a4,8(a4)
    a724:	00e7a423          	sw	a4,8(a5)
    a728:	00040593          	mv	a1,s0
    a72c:	00090513          	mv	a0,s2
    a730:	cbdf60ef          	jal	13ec <_free_r>
    a734:	00090513          	mv	a0,s2
    a738:	facf70ef          	jal	1ee4 <__malloc_unlock>
    a73c:	00812c03          	lw	s8,8(sp)
    a740:	06c0006f          	j	a7ac <_realloc_r+0x1b4>
    a744:	01000a13          	li	s4,16
    a748:	f09a74e3          	bgeu	s4,s1,a650 <_realloc_r+0x58>
    a74c:	00c00793          	li	a5,12
    a750:	00f92023          	sw	a5,0(s2)
    a754:	00000493          	li	s1,0
    a758:	0540006f          	j	a7ac <_realloc_r+0x1b4>
    a75c:	00c6a783          	lw	a5,12(a3)
    a760:	0086a703          	lw	a4,8(a3)
    a764:	00812c03          	lw	s8,8(sp)
    a768:	00060993          	mv	s3,a2
    a76c:	00f72623          	sw	a5,12(a4)
    a770:	00e7a423          	sw	a4,8(a5)
    a774:	004aa783          	lw	a5,4(s5)
    a778:	414986b3          	sub	a3,s3,s4
    a77c:	00f00613          	li	a2,15
    a780:	0017f793          	and	a5,a5,1
    a784:	013a8733          	add	a4,s5,s3
    a788:	08d66263          	bltu	a2,a3,a80c <_realloc_r+0x214>
    a78c:	0137e7b3          	or	a5,a5,s3
    a790:	00faa223          	sw	a5,4(s5)
    a794:	00472783          	lw	a5,4(a4)
    a798:	0017e793          	or	a5,a5,1
    a79c:	00f72223          	sw	a5,4(a4)
    a7a0:	00090513          	mv	a0,s2
    a7a4:	f40f70ef          	jal	1ee4 <__malloc_unlock>
    a7a8:	00040493          	mv	s1,s0
    a7ac:	02812403          	lw	s0,40(sp)
    a7b0:	02c12083          	lw	ra,44(sp)
    a7b4:	02012903          	lw	s2,32(sp)
    a7b8:	01c12983          	lw	s3,28(sp)
    a7bc:	01812a03          	lw	s4,24(sp)
    a7c0:	01412a83          	lw	s5,20(sp)
    a7c4:	00048513          	mv	a0,s1
    a7c8:	02412483          	lw	s1,36(sp)
    a7cc:	03010113          	add	sp,sp,48
    a7d0:	00008067          	ret
    a7d4:	00177713          	and	a4,a4,1
    a7d8:	ee071ae3          	bnez	a4,a6cc <_realloc_r+0xd4>
    a7dc:	01712623          	sw	s7,12(sp)
    a7e0:	ff842b83          	lw	s7,-8(s0)
    a7e4:	01612823          	sw	s6,16(sp)
    a7e8:	417a8bb3          	sub	s7,s5,s7
    a7ec:	004ba703          	lw	a4,4(s7)
    a7f0:	ffc77713          	and	a4,a4,-4
    a7f4:	ec9ff06f          	j	a6bc <_realloc_r+0xc4>
    a7f8:	02c12083          	lw	ra,44(sp)
    a7fc:	02412483          	lw	s1,36(sp)
    a800:	00060593          	mv	a1,a2
    a804:	03010113          	add	sp,sp,48
    a808:	ef1f606f          	j	16f8 <_malloc_r>
    a80c:	0147e7b3          	or	a5,a5,s4
    a810:	00faa223          	sw	a5,4(s5)
    a814:	014a85b3          	add	a1,s5,s4
    a818:	0016e693          	or	a3,a3,1
    a81c:	00d5a223          	sw	a3,4(a1)
    a820:	00472783          	lw	a5,4(a4)
    a824:	00858593          	add	a1,a1,8
    a828:	00090513          	mv	a0,s2
    a82c:	0017e793          	or	a5,a5,1
    a830:	00f72223          	sw	a5,4(a4)
    a834:	bb9f60ef          	jal	13ec <_free_r>
    a838:	f69ff06f          	j	a7a0 <_realloc_r+0x1a8>
    a83c:	ffc7f793          	and	a5,a5,-4
    a840:	013786b3          	add	a3,a5,s3
    a844:	010a0613          	add	a2,s4,16
    a848:	26c6d063          	bge	a3,a2,aaa8 <_realloc_r+0x4b0>
    a84c:	00177713          	and	a4,a4,1
    a850:	e6071ee3          	bnez	a4,a6cc <_realloc_r+0xd4>
    a854:	01712623          	sw	s7,12(sp)
    a858:	ff842b83          	lw	s7,-8(s0)
    a85c:	01612823          	sw	s6,16(sp)
    a860:	417a8bb3          	sub	s7,s5,s7
    a864:	004ba703          	lw	a4,4(s7)
    a868:	ffc77713          	and	a4,a4,-4
    a86c:	00e787b3          	add	a5,a5,a4
    a870:	01378b33          	add	s6,a5,s3
    a874:	e4cb44e3          	blt	s6,a2,a6bc <_realloc_r+0xc4>
    a878:	00cba783          	lw	a5,12(s7)
    a87c:	008ba703          	lw	a4,8(s7)
    a880:	ffc98613          	add	a2,s3,-4
    a884:	02400693          	li	a3,36
    a888:	00f72623          	sw	a5,12(a4)
    a88c:	00e7a423          	sw	a4,8(a5)
    a890:	008b8493          	add	s1,s7,8
    a894:	28c6e463          	bltu	a3,a2,ab1c <_realloc_r+0x524>
    a898:	01300713          	li	a4,19
    a89c:	00048793          	mv	a5,s1
    a8a0:	02c77263          	bgeu	a4,a2,a8c4 <_realloc_r+0x2cc>
    a8a4:	00042703          	lw	a4,0(s0)
    a8a8:	01b00793          	li	a5,27
    a8ac:	00eba423          	sw	a4,8(s7)
    a8b0:	00442703          	lw	a4,4(s0)
    a8b4:	00eba623          	sw	a4,12(s7)
    a8b8:	26c7ea63          	bltu	a5,a2,ab2c <_realloc_r+0x534>
    a8bc:	00840413          	add	s0,s0,8
    a8c0:	010b8793          	add	a5,s7,16
    a8c4:	00042703          	lw	a4,0(s0)
    a8c8:	00e7a023          	sw	a4,0(a5)
    a8cc:	00442703          	lw	a4,4(s0)
    a8d0:	00e7a223          	sw	a4,4(a5)
    a8d4:	00842703          	lw	a4,8(s0)
    a8d8:	00e7a423          	sw	a4,8(a5)
    a8dc:	014b8733          	add	a4,s7,s4
    a8e0:	414b07b3          	sub	a5,s6,s4
    a8e4:	00ec2423          	sw	a4,8(s8)
    a8e8:	0017e793          	or	a5,a5,1
    a8ec:	00f72223          	sw	a5,4(a4)
    a8f0:	004ba783          	lw	a5,4(s7)
    a8f4:	00090513          	mv	a0,s2
    a8f8:	0017f793          	and	a5,a5,1
    a8fc:	0147e7b3          	or	a5,a5,s4
    a900:	00fba223          	sw	a5,4(s7)
    a904:	de0f70ef          	jal	1ee4 <__malloc_unlock>
    a908:	01012b03          	lw	s6,16(sp)
    a90c:	00c12b83          	lw	s7,12(sp)
    a910:	00812c03          	lw	s8,8(sp)
    a914:	e99ff06f          	j	a7ac <_realloc_r+0x1b4>
    a918:	00042683          	lw	a3,0(s0)
    a91c:	01b00713          	li	a4,27
    a920:	00d52023          	sw	a3,0(a0)
    a924:	00442683          	lw	a3,4(s0)
    a928:	00d52223          	sw	a3,4(a0)
    a92c:	14c76e63          	bltu	a4,a2,aa88 <_realloc_r+0x490>
    a930:	00840713          	add	a4,s0,8
    a934:	00850793          	add	a5,a0,8
    a938:	dd9ff06f          	j	a710 <_realloc_r+0x118>
    a93c:	ffc52783          	lw	a5,-4(a0)
    a940:	00812c03          	lw	s8,8(sp)
    a944:	ffc7f793          	and	a5,a5,-4
    a948:	00f989b3          	add	s3,s3,a5
    a94c:	e29ff06f          	j	a774 <_realloc_r+0x17c>
    a950:	00cba783          	lw	a5,12(s7)
    a954:	008ba703          	lw	a4,8(s7)
    a958:	ffc98613          	add	a2,s3,-4
    a95c:	02400693          	li	a3,36
    a960:	00f72623          	sw	a5,12(a4)
    a964:	00e7a423          	sw	a4,8(a5)
    a968:	008b8493          	add	s1,s7,8
    a96c:	10c6e663          	bltu	a3,a2,aa78 <_realloc_r+0x480>
    a970:	01300713          	li	a4,19
    a974:	00048793          	mv	a5,s1
    a978:	02c77c63          	bgeu	a4,a2,a9b0 <_realloc_r+0x3b8>
    a97c:	00042703          	lw	a4,0(s0)
    a980:	01b00793          	li	a5,27
    a984:	00eba423          	sw	a4,8(s7)
    a988:	00442703          	lw	a4,4(s0)
    a98c:	00eba623          	sw	a4,12(s7)
    a990:	14c7f863          	bgeu	a5,a2,aae0 <_realloc_r+0x4e8>
    a994:	00842783          	lw	a5,8(s0)
    a998:	00fba823          	sw	a5,16(s7)
    a99c:	00c42783          	lw	a5,12(s0)
    a9a0:	00fbaa23          	sw	a5,20(s7)
    a9a4:	0ad60c63          	beq	a2,a3,aa5c <_realloc_r+0x464>
    a9a8:	01040413          	add	s0,s0,16
    a9ac:	018b8793          	add	a5,s7,24
    a9b0:	00042703          	lw	a4,0(s0)
    a9b4:	00e7a023          	sw	a4,0(a5)
    a9b8:	00442703          	lw	a4,4(s0)
    a9bc:	00e7a223          	sw	a4,4(a5)
    a9c0:	00842703          	lw	a4,8(s0)
    a9c4:	00e7a423          	sw	a4,8(a5)
    a9c8:	000b0993          	mv	s3,s6
    a9cc:	000b8a93          	mv	s5,s7
    a9d0:	01012b03          	lw	s6,16(sp)
    a9d4:	00c12b83          	lw	s7,12(sp)
    a9d8:	00812c03          	lw	s8,8(sp)
    a9dc:	00048413          	mv	s0,s1
    a9e0:	d95ff06f          	j	a774 <_realloc_r+0x17c>
    a9e4:	00040593          	mv	a1,s0
    a9e8:	ae8fd0ef          	jal	7cd0 <memmove>
    a9ec:	d3dff06f          	j	a728 <_realloc_r+0x130>
    a9f0:	00c6a783          	lw	a5,12(a3)
    a9f4:	0086a703          	lw	a4,8(a3)
    a9f8:	ffc98613          	add	a2,s3,-4
    a9fc:	02400693          	li	a3,36
    aa00:	00f72623          	sw	a5,12(a4)
    aa04:	00e7a423          	sw	a4,8(a5)
    aa08:	008ba703          	lw	a4,8(s7)
    aa0c:	00cba783          	lw	a5,12(s7)
    aa10:	008b8493          	add	s1,s7,8
    aa14:	00f72623          	sw	a5,12(a4)
    aa18:	00e7a423          	sw	a4,8(a5)
    aa1c:	04c6ee63          	bltu	a3,a2,aa78 <_realloc_r+0x480>
    aa20:	01300713          	li	a4,19
    aa24:	00048793          	mv	a5,s1
    aa28:	f8c774e3          	bgeu	a4,a2,a9b0 <_realloc_r+0x3b8>
    aa2c:	00042703          	lw	a4,0(s0)
    aa30:	01b00793          	li	a5,27
    aa34:	00eba423          	sw	a4,8(s7)
    aa38:	00442703          	lw	a4,4(s0)
    aa3c:	00eba623          	sw	a4,12(s7)
    aa40:	0ac7f063          	bgeu	a5,a2,aae0 <_realloc_r+0x4e8>
    aa44:	00842703          	lw	a4,8(s0)
    aa48:	02400793          	li	a5,36
    aa4c:	00eba823          	sw	a4,16(s7)
    aa50:	00c42703          	lw	a4,12(s0)
    aa54:	00ebaa23          	sw	a4,20(s7)
    aa58:	f4f618e3          	bne	a2,a5,a9a8 <_realloc_r+0x3b0>
    aa5c:	01042703          	lw	a4,16(s0)
    aa60:	020b8793          	add	a5,s7,32
    aa64:	01840413          	add	s0,s0,24
    aa68:	00ebac23          	sw	a4,24(s7)
    aa6c:	ffc42703          	lw	a4,-4(s0)
    aa70:	00ebae23          	sw	a4,28(s7)
    aa74:	f3dff06f          	j	a9b0 <_realloc_r+0x3b8>
    aa78:	00040593          	mv	a1,s0
    aa7c:	00048513          	mv	a0,s1
    aa80:	a50fd0ef          	jal	7cd0 <memmove>
    aa84:	f45ff06f          	j	a9c8 <_realloc_r+0x3d0>
    aa88:	00842703          	lw	a4,8(s0)
    aa8c:	00e52423          	sw	a4,8(a0)
    aa90:	00c42703          	lw	a4,12(s0)
    aa94:	00e52623          	sw	a4,12(a0)
    aa98:	06f60463          	beq	a2,a5,ab00 <_realloc_r+0x508>
    aa9c:	01040713          	add	a4,s0,16
    aaa0:	01050793          	add	a5,a0,16
    aaa4:	c6dff06f          	j	a710 <_realloc_r+0x118>
    aaa8:	014a8ab3          	add	s5,s5,s4
    aaac:	414687b3          	sub	a5,a3,s4
    aab0:	015c2423          	sw	s5,8(s8)
    aab4:	0017e793          	or	a5,a5,1
    aab8:	00faa223          	sw	a5,4(s5)
    aabc:	ffc42783          	lw	a5,-4(s0)
    aac0:	00090513          	mv	a0,s2
    aac4:	00040493          	mv	s1,s0
    aac8:	0017f793          	and	a5,a5,1
    aacc:	0147e7b3          	or	a5,a5,s4
    aad0:	fef42e23          	sw	a5,-4(s0)
    aad4:	c10f70ef          	jal	1ee4 <__malloc_unlock>
    aad8:	00812c03          	lw	s8,8(sp)
    aadc:	cd1ff06f          	j	a7ac <_realloc_r+0x1b4>
    aae0:	00840413          	add	s0,s0,8
    aae4:	010b8793          	add	a5,s7,16
    aae8:	ec9ff06f          	j	a9b0 <_realloc_r+0x3b8>
    aaec:	00090513          	mv	a0,s2
    aaf0:	bf4f70ef          	jal	1ee4 <__malloc_unlock>
    aaf4:	00000493          	li	s1,0
    aaf8:	00812c03          	lw	s8,8(sp)
    aafc:	cb1ff06f          	j	a7ac <_realloc_r+0x1b4>
    ab00:	01042683          	lw	a3,16(s0)
    ab04:	01840713          	add	a4,s0,24
    ab08:	01850793          	add	a5,a0,24
    ab0c:	00d52823          	sw	a3,16(a0)
    ab10:	01442683          	lw	a3,20(s0)
    ab14:	00d52a23          	sw	a3,20(a0)
    ab18:	bf9ff06f          	j	a710 <_realloc_r+0x118>
    ab1c:	00040593          	mv	a1,s0
    ab20:	00048513          	mv	a0,s1
    ab24:	9acfd0ef          	jal	7cd0 <memmove>
    ab28:	db5ff06f          	j	a8dc <_realloc_r+0x2e4>
    ab2c:	00842783          	lw	a5,8(s0)
    ab30:	00fba823          	sw	a5,16(s7)
    ab34:	00c42783          	lw	a5,12(s0)
    ab38:	00fbaa23          	sw	a5,20(s7)
    ab3c:	00d60863          	beq	a2,a3,ab4c <_realloc_r+0x554>
    ab40:	01040413          	add	s0,s0,16
    ab44:	018b8793          	add	a5,s7,24
    ab48:	d7dff06f          	j	a8c4 <_realloc_r+0x2cc>
    ab4c:	01042703          	lw	a4,16(s0)
    ab50:	020b8793          	add	a5,s7,32
    ab54:	01840413          	add	s0,s0,24
    ab58:	00ebac23          	sw	a4,24(s7)
    ab5c:	ffc42703          	lw	a4,-4(s0)
    ab60:	00ebae23          	sw	a4,28(s7)
    ab64:	d61ff06f          	j	a8c4 <_realloc_r+0x2cc>

0000ab68 <__ascii_wctomb>:
    ab68:	02058463          	beqz	a1,ab90 <__ascii_wctomb+0x28>
    ab6c:	0ff00793          	li	a5,255
    ab70:	00c7e863          	bltu	a5,a2,ab80 <__ascii_wctomb+0x18>
    ab74:	00c58023          	sb	a2,0(a1)
    ab78:	00100513          	li	a0,1
    ab7c:	00008067          	ret
    ab80:	08a00793          	li	a5,138
    ab84:	00f52023          	sw	a5,0(a0)
    ab88:	fff00513          	li	a0,-1
    ab8c:	00008067          	ret
    ab90:	00000513          	li	a0,0
    ab94:	00008067          	ret

0000ab98 <_wcrtomb_r>:
    ab98:	fe010113          	add	sp,sp,-32
    ab9c:	00812c23          	sw	s0,24(sp)
    aba0:	00912a23          	sw	s1,20(sp)
    aba4:	00112e23          	sw	ra,28(sp)
    aba8:	00050493          	mv	s1,a0
    abac:	10450413          	add	s0,a0,260
    abb0:	00068463          	beqz	a3,abb8 <_wcrtomb_r+0x20>
    abb4:	00068413          	mv	s0,a3
    abb8:	7fff6797          	auipc	a5,0x7fff6
    abbc:	a5c7a783          	lw	a5,-1444(a5) # 80000614 <__global_locale+0xe0>
    abc0:	00040693          	mv	a3,s0
    abc4:	02058463          	beqz	a1,abec <_wcrtomb_r+0x54>
    abc8:	00048513          	mv	a0,s1
    abcc:	000780e7          	jalr	a5
    abd0:	fff00793          	li	a5,-1
    abd4:	02f50863          	beq	a0,a5,ac04 <_wcrtomb_r+0x6c>
    abd8:	01c12083          	lw	ra,28(sp)
    abdc:	01812403          	lw	s0,24(sp)
    abe0:	01412483          	lw	s1,20(sp)
    abe4:	02010113          	add	sp,sp,32
    abe8:	00008067          	ret
    abec:	00000613          	li	a2,0
    abf0:	00410593          	add	a1,sp,4
    abf4:	00048513          	mv	a0,s1
    abf8:	000780e7          	jalr	a5
    abfc:	fff00793          	li	a5,-1
    ac00:	fcf51ce3          	bne	a0,a5,abd8 <_wcrtomb_r+0x40>
    ac04:	00042023          	sw	zero,0(s0)
    ac08:	01c12083          	lw	ra,28(sp)
    ac0c:	01812403          	lw	s0,24(sp)
    ac10:	08a00793          	li	a5,138
    ac14:	00f4a023          	sw	a5,0(s1)
    ac18:	01412483          	lw	s1,20(sp)
    ac1c:	02010113          	add	sp,sp,32
    ac20:	00008067          	ret

0000ac24 <_wcsrtombs_r>:
    ac24:	00070793          	mv	a5,a4
    ac28:	00068713          	mv	a4,a3
    ac2c:	fff00693          	li	a3,-1
    ac30:	7a40006f          	j	b3d4 <_wcsnrtombs_r>

0000ac34 <_fclose_r>:
    ac34:	ff010113          	add	sp,sp,-16
    ac38:	00112623          	sw	ra,12(sp)
    ac3c:	01212023          	sw	s2,0(sp)
    ac40:	0e058263          	beqz	a1,ad24 <_fclose_r+0xf0>
    ac44:	00812423          	sw	s0,8(sp)
    ac48:	00912223          	sw	s1,4(sp)
    ac4c:	00058413          	mv	s0,a1
    ac50:	00050493          	mv	s1,a0
    ac54:	00050663          	beqz	a0,ac60 <_fclose_r+0x2c>
    ac58:	03452783          	lw	a5,52(a0)
    ac5c:	10078063          	beqz	a5,ad5c <_fclose_r+0x128>
    ac60:	06442783          	lw	a5,100(s0)
    ac64:	00c41703          	lh	a4,12(s0)
    ac68:	0017f793          	and	a5,a5,1
    ac6c:	0a079663          	bnez	a5,ad18 <_fclose_r+0xe4>
    ac70:	20077713          	and	a4,a4,512
    ac74:	0e070863          	beqz	a4,ad64 <_fclose_r+0x130>
    ac78:	00040593          	mv	a1,s0
    ac7c:	00048513          	mv	a0,s1
    ac80:	9f5fb0ef          	jal	6674 <__sflush_r>
    ac84:	02c42783          	lw	a5,44(s0)
    ac88:	00050913          	mv	s2,a0
    ac8c:	00078a63          	beqz	a5,aca0 <_fclose_r+0x6c>
    ac90:	01c42583          	lw	a1,28(s0)
    ac94:	00048513          	mv	a0,s1
    ac98:	000780e7          	jalr	a5
    ac9c:	0a054063          	bltz	a0,ad3c <_fclose_r+0x108>
    aca0:	00c45783          	lhu	a5,12(s0)
    aca4:	0807f793          	and	a5,a5,128
    aca8:	0a079263          	bnez	a5,ad4c <_fclose_r+0x118>
    acac:	03042583          	lw	a1,48(s0)
    acb0:	00058c63          	beqz	a1,acc8 <_fclose_r+0x94>
    acb4:	04040793          	add	a5,s0,64
    acb8:	00f58663          	beq	a1,a5,acc4 <_fclose_r+0x90>
    acbc:	00048513          	mv	a0,s1
    acc0:	f2cf60ef          	jal	13ec <_free_r>
    acc4:	02042823          	sw	zero,48(s0)
    acc8:	04442583          	lw	a1,68(s0)
    accc:	00058863          	beqz	a1,acdc <_fclose_r+0xa8>
    acd0:	00048513          	mv	a0,s1
    acd4:	f18f60ef          	jal	13ec <_free_r>
    acd8:	04042223          	sw	zero,68(s0)
    acdc:	f51fb0ef          	jal	6c2c <__sfp_lock_acquire>
    ace0:	06442783          	lw	a5,100(s0)
    ace4:	00041623          	sh	zero,12(s0)
    ace8:	0017f793          	and	a5,a5,1
    acec:	0a078663          	beqz	a5,ad98 <_fclose_r+0x164>
    acf0:	05842503          	lw	a0,88(s0)
    acf4:	a9cf60ef          	jal	f90 <__retarget_lock_close_recursive>
    acf8:	f41fb0ef          	jal	6c38 <__sfp_lock_release>
    acfc:	00c12083          	lw	ra,12(sp)
    ad00:	00812403          	lw	s0,8(sp)
    ad04:	00412483          	lw	s1,4(sp)
    ad08:	00090513          	mv	a0,s2
    ad0c:	00012903          	lw	s2,0(sp)
    ad10:	01010113          	add	sp,sp,16
    ad14:	00008067          	ret
    ad18:	f60710e3          	bnez	a4,ac78 <_fclose_r+0x44>
    ad1c:	00812403          	lw	s0,8(sp)
    ad20:	00412483          	lw	s1,4(sp)
    ad24:	00000913          	li	s2,0
    ad28:	00c12083          	lw	ra,12(sp)
    ad2c:	00090513          	mv	a0,s2
    ad30:	00012903          	lw	s2,0(sp)
    ad34:	01010113          	add	sp,sp,16
    ad38:	00008067          	ret
    ad3c:	00c45783          	lhu	a5,12(s0)
    ad40:	fff00913          	li	s2,-1
    ad44:	0807f793          	and	a5,a5,128
    ad48:	f60782e3          	beqz	a5,acac <_fclose_r+0x78>
    ad4c:	01042583          	lw	a1,16(s0)
    ad50:	00048513          	mv	a0,s1
    ad54:	e98f60ef          	jal	13ec <_free_r>
    ad58:	f55ff06f          	j	acac <_fclose_r+0x78>
    ad5c:	e61fb0ef          	jal	6bbc <__sinit>
    ad60:	f01ff06f          	j	ac60 <_fclose_r+0x2c>
    ad64:	05842503          	lw	a0,88(s0)
    ad68:	a2cf60ef          	jal	f94 <__retarget_lock_acquire_recursive>
    ad6c:	00c41783          	lh	a5,12(s0)
    ad70:	f00794e3          	bnez	a5,ac78 <_fclose_r+0x44>
    ad74:	06442783          	lw	a5,100(s0)
    ad78:	0017f793          	and	a5,a5,1
    ad7c:	fa0790e3          	bnez	a5,ad1c <_fclose_r+0xe8>
    ad80:	05842503          	lw	a0,88(s0)
    ad84:	00000913          	li	s2,0
    ad88:	a10f60ef          	jal	f98 <__retarget_lock_release_recursive>
    ad8c:	00812403          	lw	s0,8(sp)
    ad90:	00412483          	lw	s1,4(sp)
    ad94:	f95ff06f          	j	ad28 <_fclose_r+0xf4>
    ad98:	05842503          	lw	a0,88(s0)
    ad9c:	9fcf60ef          	jal	f98 <__retarget_lock_release_recursive>
    ada0:	f51ff06f          	j	acf0 <_fclose_r+0xbc>

0000ada4 <__smakebuf_r>:
    ada4:	00c59783          	lh	a5,12(a1)
    ada8:	f8010113          	add	sp,sp,-128
    adac:	06812c23          	sw	s0,120(sp)
    adb0:	06112e23          	sw	ra,124(sp)
    adb4:	0027f713          	and	a4,a5,2
    adb8:	00058413          	mv	s0,a1
    adbc:	02070463          	beqz	a4,ade4 <__smakebuf_r+0x40>
    adc0:	04358793          	add	a5,a1,67
    adc4:	00f5a023          	sw	a5,0(a1)
    adc8:	00f5a823          	sw	a5,16(a1)
    adcc:	00100793          	li	a5,1
    add0:	00f5aa23          	sw	a5,20(a1)
    add4:	07c12083          	lw	ra,124(sp)
    add8:	07812403          	lw	s0,120(sp)
    addc:	08010113          	add	sp,sp,128
    ade0:	00008067          	ret
    ade4:	00e59583          	lh	a1,14(a1)
    ade8:	06912a23          	sw	s1,116(sp)
    adec:	07212823          	sw	s2,112(sp)
    adf0:	07312623          	sw	s3,108(sp)
    adf4:	07412423          	sw	s4,104(sp)
    adf8:	00050493          	mv	s1,a0
    adfc:	0805c663          	bltz	a1,ae88 <__smakebuf_r+0xe4>
    ae00:	00810613          	add	a2,sp,8
    ae04:	138000ef          	jal	af3c <_fstat_r>
    ae08:	06054e63          	bltz	a0,ae84 <__smakebuf_r+0xe0>
    ae0c:	00c12783          	lw	a5,12(sp)
    ae10:	0000f937          	lui	s2,0xf
    ae14:	000019b7          	lui	s3,0x1
    ae18:	00f97933          	and	s2,s2,a5
    ae1c:	ffffe7b7          	lui	a5,0xffffe
    ae20:	00f90933          	add	s2,s2,a5
    ae24:	00193913          	seqz	s2,s2
    ae28:	40000a13          	li	s4,1024
    ae2c:	80098993          	add	s3,s3,-2048 # 800 <main+0x530>
    ae30:	000a0593          	mv	a1,s4
    ae34:	00048513          	mv	a0,s1
    ae38:	8c1f60ef          	jal	16f8 <_malloc_r>
    ae3c:	00c41783          	lh	a5,12(s0)
    ae40:	06050863          	beqz	a0,aeb0 <__smakebuf_r+0x10c>
    ae44:	0807e793          	or	a5,a5,128
    ae48:	00a42023          	sw	a0,0(s0)
    ae4c:	00a42823          	sw	a0,16(s0)
    ae50:	00f41623          	sh	a5,12(s0)
    ae54:	01442a23          	sw	s4,20(s0)
    ae58:	0a091063          	bnez	s2,aef8 <__smakebuf_r+0x154>
    ae5c:	0137e7b3          	or	a5,a5,s3
    ae60:	07c12083          	lw	ra,124(sp)
    ae64:	00f41623          	sh	a5,12(s0)
    ae68:	07812403          	lw	s0,120(sp)
    ae6c:	07412483          	lw	s1,116(sp)
    ae70:	07012903          	lw	s2,112(sp)
    ae74:	06c12983          	lw	s3,108(sp)
    ae78:	06812a03          	lw	s4,104(sp)
    ae7c:	08010113          	add	sp,sp,128
    ae80:	00008067          	ret
    ae84:	00c41783          	lh	a5,12(s0)
    ae88:	0807f793          	and	a5,a5,128
    ae8c:	00000913          	li	s2,0
    ae90:	04078e63          	beqz	a5,aeec <__smakebuf_r+0x148>
    ae94:	04000a13          	li	s4,64
    ae98:	000a0593          	mv	a1,s4
    ae9c:	00048513          	mv	a0,s1
    aea0:	859f60ef          	jal	16f8 <_malloc_r>
    aea4:	00c41783          	lh	a5,12(s0)
    aea8:	00000993          	li	s3,0
    aeac:	f8051ce3          	bnez	a0,ae44 <__smakebuf_r+0xa0>
    aeb0:	2007f713          	and	a4,a5,512
    aeb4:	04071e63          	bnez	a4,af10 <__smakebuf_r+0x16c>
    aeb8:	ffc7f793          	and	a5,a5,-4
    aebc:	0027e793          	or	a5,a5,2
    aec0:	04340713          	add	a4,s0,67
    aec4:	00f41623          	sh	a5,12(s0)
    aec8:	00100793          	li	a5,1
    aecc:	07412483          	lw	s1,116(sp)
    aed0:	07012903          	lw	s2,112(sp)
    aed4:	06c12983          	lw	s3,108(sp)
    aed8:	06812a03          	lw	s4,104(sp)
    aedc:	00e42023          	sw	a4,0(s0)
    aee0:	00e42823          	sw	a4,16(s0)
    aee4:	00f42a23          	sw	a5,20(s0)
    aee8:	eedff06f          	j	add4 <__smakebuf_r+0x30>
    aeec:	40000a13          	li	s4,1024
    aef0:	00000993          	li	s3,0
    aef4:	f3dff06f          	j	ae30 <__smakebuf_r+0x8c>
    aef8:	00e41583          	lh	a1,14(s0)
    aefc:	00048513          	mv	a0,s1
    af00:	09c000ef          	jal	af9c <_isatty_r>
    af04:	02051063          	bnez	a0,af24 <__smakebuf_r+0x180>
    af08:	00c41783          	lh	a5,12(s0)
    af0c:	f51ff06f          	j	ae5c <__smakebuf_r+0xb8>
    af10:	07412483          	lw	s1,116(sp)
    af14:	07012903          	lw	s2,112(sp)
    af18:	06c12983          	lw	s3,108(sp)
    af1c:	06812a03          	lw	s4,104(sp)
    af20:	eb5ff06f          	j	add4 <__smakebuf_r+0x30>
    af24:	00c45783          	lhu	a5,12(s0)
    af28:	ffc7f793          	and	a5,a5,-4
    af2c:	0017e793          	or	a5,a5,1
    af30:	01079793          	sll	a5,a5,0x10
    af34:	4107d793          	sra	a5,a5,0x10
    af38:	f25ff06f          	j	ae5c <__smakebuf_r+0xb8>

0000af3c <_fstat_r>:
    af3c:	ff010113          	add	sp,sp,-16
    af40:	00058713          	mv	a4,a1
    af44:	00812423          	sw	s0,8(sp)
    af48:	00060593          	mv	a1,a2
    af4c:	00050413          	mv	s0,a0
    af50:	00070513          	mv	a0,a4
    af54:	7fff5797          	auipc	a5,0x7fff5
    af58:	7c07a223          	sw	zero,1988(a5) # 80000718 <errno>
    af5c:	00112623          	sw	ra,12(sp)
    af60:	c15f50ef          	jal	b74 <_fstat>
    af64:	fff00793          	li	a5,-1
    af68:	00f50a63          	beq	a0,a5,af7c <_fstat_r+0x40>
    af6c:	00c12083          	lw	ra,12(sp)
    af70:	00812403          	lw	s0,8(sp)
    af74:	01010113          	add	sp,sp,16
    af78:	00008067          	ret
    af7c:	7fff5797          	auipc	a5,0x7fff5
    af80:	79c7a783          	lw	a5,1948(a5) # 80000718 <errno>
    af84:	fe0784e3          	beqz	a5,af6c <_fstat_r+0x30>
    af88:	00c12083          	lw	ra,12(sp)
    af8c:	00f42023          	sw	a5,0(s0)
    af90:	00812403          	lw	s0,8(sp)
    af94:	01010113          	add	sp,sp,16
    af98:	00008067          	ret

0000af9c <_isatty_r>:
    af9c:	ff010113          	add	sp,sp,-16
    afa0:	00812423          	sw	s0,8(sp)
    afa4:	00050413          	mv	s0,a0
    afa8:	00058513          	mv	a0,a1
    afac:	7fff5797          	auipc	a5,0x7fff5
    afb0:	7607a623          	sw	zero,1900(a5) # 80000718 <errno>
    afb4:	00112623          	sw	ra,12(sp)
    afb8:	bd5f50ef          	jal	b8c <_isatty>
    afbc:	fff00793          	li	a5,-1
    afc0:	00f50a63          	beq	a0,a5,afd4 <_isatty_r+0x38>
    afc4:	00c12083          	lw	ra,12(sp)
    afc8:	00812403          	lw	s0,8(sp)
    afcc:	01010113          	add	sp,sp,16
    afd0:	00008067          	ret
    afd4:	7fff5797          	auipc	a5,0x7fff5
    afd8:	7447a783          	lw	a5,1860(a5) # 80000718 <errno>
    afdc:	fe0784e3          	beqz	a5,afc4 <_isatty_r+0x28>
    afe0:	00c12083          	lw	ra,12(sp)
    afe4:	00f42023          	sw	a5,0(s0)
    afe8:	00812403          	lw	s0,8(sp)
    afec:	01010113          	add	sp,sp,16
    aff0:	00008067          	ret

0000aff4 <__errno>:
    aff4:	7fff5517          	auipc	a0,0x7fff5
    aff8:	71452503          	lw	a0,1812(a0) # 80000708 <_impure_ptr>
    affc:	00008067          	ret

0000b000 <__assert_func>:
    b000:	ff010113          	add	sp,sp,-16
    b004:	00068793          	mv	a5,a3
    b008:	7fff5717          	auipc	a4,0x7fff5
    b00c:	70072703          	lw	a4,1792(a4) # 80000708 <_impure_ptr>
    b010:	00060813          	mv	a6,a2
    b014:	00112623          	sw	ra,12(sp)
    b018:	00c72883          	lw	a7,12(a4)
    b01c:	00078613          	mv	a2,a5
    b020:	00050693          	mv	a3,a0
    b024:	00058713          	mv	a4,a1
    b028:	00004797          	auipc	a5,0x4
    b02c:	25c78793          	add	a5,a5,604 # f284 <__fini_array_end+0x344>
    b030:	00080c63          	beqz	a6,b048 <__assert_func+0x48>
    b034:	00004597          	auipc	a1,0x4
    b038:	26058593          	add	a1,a1,608 # f294 <__fini_array_end+0x354>
    b03c:	00088513          	mv	a0,a7
    b040:	3a8000ef          	jal	b3e8 <fiprintf>
    b044:	3f0000ef          	jal	b434 <abort>
    b048:	00004797          	auipc	a5,0x4
    b04c:	f5878793          	add	a5,a5,-168 # efa0 <__fini_array_end+0x60>
    b050:	00078813          	mv	a6,a5
    b054:	fe1ff06f          	j	b034 <__assert_func+0x34>

0000b058 <_calloc_r>:
    b058:	fe010113          	add	sp,sp,-32
    b05c:	00812c23          	sw	s0,24(sp)
    b060:	00112e23          	sw	ra,28(sp)
    b064:	0105d693          	srl	a3,a1,0x10
    b068:	00058793          	mv	a5,a1
    b06c:	00050413          	mv	s0,a0
    b070:	01065713          	srl	a4,a2,0x10
    b074:	0c069063          	bnez	a3,b134 <_calloc_r+0xdc>
    b078:	14071a63          	bnez	a4,b1cc <_calloc_r+0x174>
    b07c:	01061593          	sll	a1,a2,0x10
    b080:	01079513          	sll	a0,a5,0x10
    b084:	0105d593          	srl	a1,a1,0x10
    b088:	01055513          	srl	a0,a0,0x10
    b08c:	4bd030ef          	jal	ed48 <__mulsi3>
    b090:	00050593          	mv	a1,a0
    b094:	00040513          	mv	a0,s0
    b098:	e60f60ef          	jal	16f8 <_malloc_r>
    b09c:	00050413          	mv	s0,a0
    b0a0:	10050a63          	beqz	a0,b1b4 <_calloc_r+0x15c>
    b0a4:	ffc52603          	lw	a2,-4(a0)
    b0a8:	02400713          	li	a4,36
    b0ac:	ffc67613          	and	a2,a2,-4
    b0b0:	ffc60613          	add	a2,a2,-4
    b0b4:	04c76863          	bltu	a4,a2,b104 <_calloc_r+0xac>
    b0b8:	01300693          	li	a3,19
    b0bc:	00050793          	mv	a5,a0
    b0c0:	02c6f263          	bgeu	a3,a2,b0e4 <_calloc_r+0x8c>
    b0c4:	00052023          	sw	zero,0(a0)
    b0c8:	00052223          	sw	zero,4(a0)
    b0cc:	01b00793          	li	a5,27
    b0d0:	04c7f863          	bgeu	a5,a2,b120 <_calloc_r+0xc8>
    b0d4:	00052423          	sw	zero,8(a0)
    b0d8:	00052623          	sw	zero,12(a0)
    b0dc:	01050793          	add	a5,a0,16
    b0e0:	10e60263          	beq	a2,a4,b1e4 <_calloc_r+0x18c>
    b0e4:	0007a023          	sw	zero,0(a5)
    b0e8:	0007a223          	sw	zero,4(a5)
    b0ec:	0007a423          	sw	zero,8(a5)
    b0f0:	01c12083          	lw	ra,28(sp)
    b0f4:	00040513          	mv	a0,s0
    b0f8:	01812403          	lw	s0,24(sp)
    b0fc:	02010113          	add	sp,sp,32
    b100:	00008067          	ret
    b104:	00000593          	li	a1,0
    b108:	e95f50ef          	jal	f9c <memset>
    b10c:	01c12083          	lw	ra,28(sp)
    b110:	00040513          	mv	a0,s0
    b114:	01812403          	lw	s0,24(sp)
    b118:	02010113          	add	sp,sp,32
    b11c:	00008067          	ret
    b120:	00850793          	add	a5,a0,8
    b124:	0007a023          	sw	zero,0(a5)
    b128:	0007a223          	sw	zero,4(a5)
    b12c:	0007a423          	sw	zero,8(a5)
    b130:	fc1ff06f          	j	b0f0 <_calloc_r+0x98>
    b134:	0c071663          	bnez	a4,b200 <_calloc_r+0x1a8>
    b138:	01212823          	sw	s2,16(sp)
    b13c:	01312623          	sw	s3,12(sp)
    b140:	00912a23          	sw	s1,20(sp)
    b144:	00068913          	mv	s2,a3
    b148:	00060993          	mv	s3,a2
    b14c:	01079513          	sll	a0,a5,0x10
    b150:	01061593          	sll	a1,a2,0x10
    b154:	0105d593          	srl	a1,a1,0x10
    b158:	01055513          	srl	a0,a0,0x10
    b15c:	3ed030ef          	jal	ed48 <__mulsi3>
    b160:	00050493          	mv	s1,a0
    b164:	01091593          	sll	a1,s2,0x10
    b168:	01099513          	sll	a0,s3,0x10
    b16c:	0105d593          	srl	a1,a1,0x10
    b170:	01055513          	srl	a0,a0,0x10
    b174:	3d5030ef          	jal	ed48 <__mulsi3>
    b178:	0104d793          	srl	a5,s1,0x10
    b17c:	00f505b3          	add	a1,a0,a5
    b180:	0105d793          	srl	a5,a1,0x10
    b184:	06079863          	bnez	a5,b1f4 <_calloc_r+0x19c>
    b188:	01049493          	sll	s1,s1,0x10
    b18c:	0104d493          	srl	s1,s1,0x10
    b190:	01059593          	sll	a1,a1,0x10
    b194:	0095e5b3          	or	a1,a1,s1
    b198:	00040513          	mv	a0,s0
    b19c:	01412483          	lw	s1,20(sp)
    b1a0:	01012903          	lw	s2,16(sp)
    b1a4:	00c12983          	lw	s3,12(sp)
    b1a8:	d50f60ef          	jal	16f8 <_malloc_r>
    b1ac:	00050413          	mv	s0,a0
    b1b0:	ee051ae3          	bnez	a0,b0a4 <_calloc_r+0x4c>
    b1b4:	00000413          	li	s0,0
    b1b8:	01c12083          	lw	ra,28(sp)
    b1bc:	00040513          	mv	a0,s0
    b1c0:	01812403          	lw	s0,24(sp)
    b1c4:	02010113          	add	sp,sp,32
    b1c8:	00008067          	ret
    b1cc:	01212823          	sw	s2,16(sp)
    b1d0:	01312623          	sw	s3,12(sp)
    b1d4:	00912a23          	sw	s1,20(sp)
    b1d8:	00070913          	mv	s2,a4
    b1dc:	00058993          	mv	s3,a1
    b1e0:	f6dff06f          	j	b14c <_calloc_r+0xf4>
    b1e4:	00052823          	sw	zero,16(a0)
    b1e8:	01850793          	add	a5,a0,24
    b1ec:	00052a23          	sw	zero,20(a0)
    b1f0:	ef5ff06f          	j	b0e4 <_calloc_r+0x8c>
    b1f4:	01412483          	lw	s1,20(sp)
    b1f8:	01012903          	lw	s2,16(sp)
    b1fc:	00c12983          	lw	s3,12(sp)
    b200:	df5ff0ef          	jal	aff4 <__errno>
    b204:	00c00793          	li	a5,12
    b208:	00f52023          	sw	a5,0(a0)
    b20c:	00000413          	li	s0,0
    b210:	fa9ff06f          	j	b1b8 <_calloc_r+0x160>

0000b214 <_wcsnrtombs_l>:
    b214:	fa010113          	add	sp,sp,-96
    b218:	04912a23          	sw	s1,84(sp)
    b21c:	05212823          	sw	s2,80(sp)
    b220:	05312623          	sw	s3,76(sp)
    b224:	05412423          	sw	s4,72(sp)
    b228:	05512223          	sw	s5,68(sp)
    b22c:	04112e23          	sw	ra,92(sp)
    b230:	03912a23          	sw	s9,52(sp)
    b234:	03a12823          	sw	s10,48(sp)
    b238:	00a12623          	sw	a0,12(sp)
    b23c:	00058a13          	mv	s4,a1
    b240:	00060a93          	mv	s5,a2
    b244:	00070913          	mv	s2,a4
    b248:	00080993          	mv	s3,a6
    b24c:	00078493          	mv	s1,a5
    b250:	12078063          	beqz	a5,b370 <_wcsnrtombs_l+0x15c>
    b254:	000aac83          	lw	s9,0(s5)
    b258:	120a0263          	beqz	s4,b37c <_wcsnrtombs_l+0x168>
    b25c:	14090e63          	beqz	s2,b3b8 <_wcsnrtombs_l+0x1a4>
    b260:	05612023          	sw	s6,64(sp)
    b264:	fff68b13          	add	s6,a3,-1
    b268:	16068063          	beqz	a3,b3c8 <_wcsnrtombs_l+0x1b4>
    b26c:	04812c23          	sw	s0,88(sp)
    b270:	03b12623          	sw	s11,44(sp)
    b274:	03712e23          	sw	s7,60(sp)
    b278:	03812c23          	sw	s8,56(sp)
    b27c:	000a0413          	mv	s0,s4
    b280:	00000d13          	li	s10,0
    b284:	fff00d93          	li	s11,-1
    b288:	0240006f          	j	b2ac <_wcsnrtombs_l+0x98>
    b28c:	080a1a63          	bnez	s4,b320 <_wcsnrtombs_l+0x10c>
    b290:	000ca783          	lw	a5,0(s9)
    b294:	004c8c93          	add	s9,s9,4
    b298:	0c078263          	beqz	a5,b35c <_wcsnrtombs_l+0x148>
    b29c:	1326f263          	bgeu	a3,s2,b3c0 <_wcsnrtombs_l+0x1ac>
    b2a0:	fffb0b13          	add	s6,s6,-1
    b2a4:	00068d13          	mv	s10,a3
    b2a8:	03bb0c63          	beq	s6,s11,b2e0 <_wcsnrtombs_l+0xcc>
    b2ac:	0e09a783          	lw	a5,224(s3)
    b2b0:	000ca603          	lw	a2,0(s9)
    b2b4:	00c12503          	lw	a0,12(sp)
    b2b8:	00048693          	mv	a3,s1
    b2bc:	01410593          	add	a1,sp,20
    b2c0:	0004ac03          	lw	s8,0(s1)
    b2c4:	0044ab83          	lw	s7,4(s1)
    b2c8:	000780e7          	jalr	a5
    b2cc:	0bb50e63          	beq	a0,s11,b388 <_wcsnrtombs_l+0x174>
    b2d0:	01a506b3          	add	a3,a0,s10
    b2d4:	fad97ce3          	bgeu	s2,a3,b28c <_wcsnrtombs_l+0x78>
    b2d8:	0184a023          	sw	s8,0(s1)
    b2dc:	0174a223          	sw	s7,4(s1)
    b2e0:	05812403          	lw	s0,88(sp)
    b2e4:	04012b03          	lw	s6,64(sp)
    b2e8:	03c12b83          	lw	s7,60(sp)
    b2ec:	03812c03          	lw	s8,56(sp)
    b2f0:	02c12d83          	lw	s11,44(sp)
    b2f4:	05c12083          	lw	ra,92(sp)
    b2f8:	05412483          	lw	s1,84(sp)
    b2fc:	05012903          	lw	s2,80(sp)
    b300:	04c12983          	lw	s3,76(sp)
    b304:	04812a03          	lw	s4,72(sp)
    b308:	04412a83          	lw	s5,68(sp)
    b30c:	03412c83          	lw	s9,52(sp)
    b310:	000d0513          	mv	a0,s10
    b314:	03012d03          	lw	s10,48(sp)
    b318:	06010113          	add	sp,sp,96
    b31c:	00008067          	ret
    b320:	08a05063          	blez	a0,b3a0 <_wcsnrtombs_l+0x18c>
    b324:	01410893          	add	a7,sp,20
    b328:	00a40533          	add	a0,s0,a0
    b32c:	0008c783          	lbu	a5,0(a7)
    b330:	00140413          	add	s0,s0,1
    b334:	00188893          	add	a7,a7,1
    b338:	fef40fa3          	sb	a5,-1(s0)
    b33c:	fe8518e3          	bne	a0,s0,b32c <_wcsnrtombs_l+0x118>
    b340:	000aa783          	lw	a5,0(s5)
    b344:	00050413          	mv	s0,a0
    b348:	00478793          	add	a5,a5,4
    b34c:	00faa023          	sw	a5,0(s5)
    b350:	000ca783          	lw	a5,0(s9)
    b354:	004c8c93          	add	s9,s9,4
    b358:	f40792e3          	bnez	a5,b29c <_wcsnrtombs_l+0x88>
    b35c:	000a0463          	beqz	s4,b364 <_wcsnrtombs_l+0x150>
    b360:	000aa023          	sw	zero,0(s5)
    b364:	0004a023          	sw	zero,0(s1)
    b368:	fff68d13          	add	s10,a3,-1
    b36c:	f75ff06f          	j	b2e0 <_wcsnrtombs_l+0xcc>
    b370:	000aac83          	lw	s9,0(s5)
    b374:	10c50493          	add	s1,a0,268
    b378:	ee0a12e3          	bnez	s4,b25c <_wcsnrtombs_l+0x48>
    b37c:	05612023          	sw	s6,64(sp)
    b380:	fff00913          	li	s2,-1
    b384:	ee1ff06f          	j	b264 <_wcsnrtombs_l+0x50>
    b388:	00c12703          	lw	a4,12(sp)
    b38c:	08a00793          	li	a5,138
    b390:	fff00d13          	li	s10,-1
    b394:	00f72023          	sw	a5,0(a4)
    b398:	0004a023          	sw	zero,0(s1)
    b39c:	f45ff06f          	j	b2e0 <_wcsnrtombs_l+0xcc>
    b3a0:	000aa783          	lw	a5,0(s5)
    b3a4:	00040513          	mv	a0,s0
    b3a8:	00050413          	mv	s0,a0
    b3ac:	00478793          	add	a5,a5,4
    b3b0:	00faa023          	sw	a5,0(s5)
    b3b4:	f9dff06f          	j	b350 <_wcsnrtombs_l+0x13c>
    b3b8:	00000d13          	li	s10,0
    b3bc:	f39ff06f          	j	b2f4 <_wcsnrtombs_l+0xe0>
    b3c0:	00068d13          	mv	s10,a3
    b3c4:	f1dff06f          	j	b2e0 <_wcsnrtombs_l+0xcc>
    b3c8:	04012b03          	lw	s6,64(sp)
    b3cc:	00000d13          	li	s10,0
    b3d0:	f25ff06f          	j	b2f4 <_wcsnrtombs_l+0xe0>

0000b3d4 <_wcsnrtombs_r>:
    b3d4:	7fff5817          	auipc	a6,0x7fff5
    b3d8:	16080813          	add	a6,a6,352 # 80000534 <__global_locale>
    b3dc:	7fff5517          	auipc	a0,0x7fff5
    b3e0:	32c52503          	lw	a0,812(a0) # 80000708 <_impure_ptr>
    b3e4:	e31ff06f          	j	b214 <_wcsnrtombs_l>

0000b3e8 <fiprintf>:
    b3e8:	fc010113          	add	sp,sp,-64
    b3ec:	02810313          	add	t1,sp,40
    b3f0:	02c12423          	sw	a2,40(sp)
    b3f4:	02d12623          	sw	a3,44(sp)
    b3f8:	00058613          	mv	a2,a1
    b3fc:	00030693          	mv	a3,t1
    b400:	00050593          	mv	a1,a0
    b404:	7fff5517          	auipc	a0,0x7fff5
    b408:	30452503          	lw	a0,772(a0) # 80000708 <_impure_ptr>
    b40c:	00112e23          	sw	ra,28(sp)
    b410:	02e12823          	sw	a4,48(sp)
    b414:	02f12a23          	sw	a5,52(sp)
    b418:	03012c23          	sw	a6,56(sp)
    b41c:	03112e23          	sw	a7,60(sp)
    b420:	00612623          	sw	t1,12(sp)
    b424:	9a1f90ef          	jal	4dc4 <_vfiprintf_r>
    b428:	01c12083          	lw	ra,28(sp)
    b42c:	04010113          	add	sp,sp,64
    b430:	00008067          	ret

0000b434 <abort>:
    b434:	ff010113          	add	sp,sp,-16
    b438:	00600513          	li	a0,6
    b43c:	00112623          	sw	ra,12(sp)
    b440:	00c000ef          	jal	b44c <raise>
    b444:	00100513          	li	a0,1
    b448:	f14f50ef          	jal	b5c <_exit>

0000b44c <raise>:
    b44c:	ff010113          	add	sp,sp,-16
    b450:	00912223          	sw	s1,4(sp)
    b454:	00112623          	sw	ra,12(sp)
    b458:	01f00793          	li	a5,31
    b45c:	7fff5497          	auipc	s1,0x7fff5
    b460:	2ac4a483          	lw	s1,684(s1) # 80000708 <_impure_ptr>
    b464:	08a7ee63          	bltu	a5,a0,b500 <raise+0xb4>
    b468:	1184a783          	lw	a5,280(s1)
    b46c:	00812423          	sw	s0,8(sp)
    b470:	00050413          	mv	s0,a0
    b474:	04078263          	beqz	a5,b4b8 <raise+0x6c>
    b478:	00251713          	sll	a4,a0,0x2
    b47c:	00e787b3          	add	a5,a5,a4
    b480:	0007a703          	lw	a4,0(a5)
    b484:	02070a63          	beqz	a4,b4b8 <raise+0x6c>
    b488:	00100693          	li	a3,1
    b48c:	00d70a63          	beq	a4,a3,b4a0 <raise+0x54>
    b490:	fff00693          	li	a3,-1
    b494:	04d70663          	beq	a4,a3,b4e0 <raise+0x94>
    b498:	0007a023          	sw	zero,0(a5)
    b49c:	000700e7          	jalr	a4
    b4a0:	00812403          	lw	s0,8(sp)
    b4a4:	00000513          	li	a0,0
    b4a8:	00c12083          	lw	ra,12(sp)
    b4ac:	00412483          	lw	s1,4(sp)
    b4b0:	01010113          	add	sp,sp,16
    b4b4:	00008067          	ret
    b4b8:	00048513          	mv	a0,s1
    b4bc:	0b4000ef          	jal	b570 <_getpid_r>
    b4c0:	00040613          	mv	a2,s0
    b4c4:	00812403          	lw	s0,8(sp)
    b4c8:	00c12083          	lw	ra,12(sp)
    b4cc:	00050593          	mv	a1,a0
    b4d0:	00048513          	mv	a0,s1
    b4d4:	00412483          	lw	s1,4(sp)
    b4d8:	01010113          	add	sp,sp,16
    b4dc:	0340006f          	j	b510 <_kill_r>
    b4e0:	00812403          	lw	s0,8(sp)
    b4e4:	00c12083          	lw	ra,12(sp)
    b4e8:	01600793          	li	a5,22
    b4ec:	00f4a023          	sw	a5,0(s1)
    b4f0:	00100513          	li	a0,1
    b4f4:	00412483          	lw	s1,4(sp)
    b4f8:	01010113          	add	sp,sp,16
    b4fc:	00008067          	ret
    b500:	01600793          	li	a5,22
    b504:	00f4a023          	sw	a5,0(s1)
    b508:	fff00513          	li	a0,-1
    b50c:	f9dff06f          	j	b4a8 <raise+0x5c>

0000b510 <_kill_r>:
    b510:	ff010113          	add	sp,sp,-16
    b514:	00058713          	mv	a4,a1
    b518:	00812423          	sw	s0,8(sp)
    b51c:	00060593          	mv	a1,a2
    b520:	00050413          	mv	s0,a0
    b524:	00070513          	mv	a0,a4
    b528:	7fff5797          	auipc	a5,0x7fff5
    b52c:	1e07a823          	sw	zero,496(a5) # 80000718 <errno>
    b530:	00112623          	sw	ra,12(sp)
    b534:	e60f50ef          	jal	b94 <_kill>
    b538:	fff00793          	li	a5,-1
    b53c:	00f50a63          	beq	a0,a5,b550 <_kill_r+0x40>
    b540:	00c12083          	lw	ra,12(sp)
    b544:	00812403          	lw	s0,8(sp)
    b548:	01010113          	add	sp,sp,16
    b54c:	00008067          	ret
    b550:	7fff5797          	auipc	a5,0x7fff5
    b554:	1c87a783          	lw	a5,456(a5) # 80000718 <errno>
    b558:	fe0784e3          	beqz	a5,b540 <_kill_r+0x30>
    b55c:	00c12083          	lw	ra,12(sp)
    b560:	00f42023          	sw	a5,0(s0)
    b564:	00812403          	lw	s0,8(sp)
    b568:	01010113          	add	sp,sp,16
    b56c:	00008067          	ret

0000b570 <_getpid_r>:
    b570:	e14f506f          	j	b84 <_getpid>

0000b574 <__udivdi3>:
    b574:	fd010113          	add	sp,sp,-48
    b578:	01312e23          	sw	s3,28(sp)
    b57c:	02112623          	sw	ra,44(sp)
    b580:	01612823          	sw	s6,16(sp)
    b584:	00050993          	mv	s3,a0
    b588:	16069663          	bnez	a3,b6f4 <__udivdi3+0x180>
    b58c:	02812423          	sw	s0,40(sp)
    b590:	01512a23          	sw	s5,20(sp)
    b594:	02912223          	sw	s1,36(sp)
    b598:	03212023          	sw	s2,32(sp)
    b59c:	01412c23          	sw	s4,24(sp)
    b5a0:	00060a93          	mv	s5,a2
    b5a4:	00050413          	mv	s0,a0
    b5a8:	1cc5f063          	bgeu	a1,a2,b768 <__udivdi3+0x1f4>
    b5ac:	000107b7          	lui	a5,0x10
    b5b0:	00058493          	mv	s1,a1
    b5b4:	2af66e63          	bltu	a2,a5,b870 <__udivdi3+0x2fc>
    b5b8:	010007b7          	lui	a5,0x1000
    b5bc:	01800713          	li	a4,24
    b5c0:	00f67463          	bgeu	a2,a5,b5c8 <__udivdi3+0x54>
    b5c4:	01000713          	li	a4,16
    b5c8:	00e656b3          	srl	a3,a2,a4
    b5cc:	00004797          	auipc	a5,0x4
    b5d0:	2ec78793          	add	a5,a5,748 # f8b8 <__clz_tab>
    b5d4:	00d787b3          	add	a5,a5,a3
    b5d8:	0007c783          	lbu	a5,0(a5)
    b5dc:	02000693          	li	a3,32
    b5e0:	00e787b3          	add	a5,a5,a4
    b5e4:	40f68733          	sub	a4,a3,a5
    b5e8:	00f68c63          	beq	a3,a5,b600 <__udivdi3+0x8c>
    b5ec:	00e594b3          	sll	s1,a1,a4
    b5f0:	00f9d7b3          	srl	a5,s3,a5
    b5f4:	00e61ab3          	sll	s5,a2,a4
    b5f8:	0097e4b3          	or	s1,a5,s1
    b5fc:	00e99433          	sll	s0,s3,a4
    b600:	010ada13          	srl	s4,s5,0x10
    b604:	000a0593          	mv	a1,s4
    b608:	00048513          	mv	a0,s1
    b60c:	010a9b13          	sll	s6,s5,0x10
    b610:	7fc030ef          	jal	ee0c <__hidden___udivsi3>
    b614:	010b5b13          	srl	s6,s6,0x10
    b618:	00050593          	mv	a1,a0
    b61c:	00050913          	mv	s2,a0
    b620:	000b0513          	mv	a0,s6
    b624:	724030ef          	jal	ed48 <__mulsi3>
    b628:	00050793          	mv	a5,a0
    b62c:	000a0593          	mv	a1,s4
    b630:	00048513          	mv	a0,s1
    b634:	00078493          	mv	s1,a5
    b638:	01d030ef          	jal	ee54 <__umodsi3>
    b63c:	01051513          	sll	a0,a0,0x10
    b640:	01045793          	srl	a5,s0,0x10
    b644:	00a7e7b3          	or	a5,a5,a0
    b648:	0097fc63          	bgeu	a5,s1,b660 <__udivdi3+0xec>
    b64c:	00fa87b3          	add	a5,s5,a5
    b650:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0xbf>
    b654:	0157e463          	bltu	a5,s5,b65c <__udivdi3+0xe8>
    b658:	5a97e863          	bltu	a5,s1,bc08 <__udivdi3+0x694>
    b65c:	00070913          	mv	s2,a4
    b660:	409784b3          	sub	s1,a5,s1
    b664:	000a0593          	mv	a1,s4
    b668:	00048513          	mv	a0,s1
    b66c:	7a0030ef          	jal	ee0c <__hidden___udivsi3>
    b670:	00050593          	mv	a1,a0
    b674:	00050993          	mv	s3,a0
    b678:	000b0513          	mv	a0,s6
    b67c:	6cc030ef          	jal	ed48 <__mulsi3>
    b680:	00050793          	mv	a5,a0
    b684:	000a0593          	mv	a1,s4
    b688:	00048513          	mv	a0,s1
    b68c:	01041413          	sll	s0,s0,0x10
    b690:	00078493          	mv	s1,a5
    b694:	7c0030ef          	jal	ee54 <__umodsi3>
    b698:	01051513          	sll	a0,a0,0x10
    b69c:	01045413          	srl	s0,s0,0x10
    b6a0:	00a46433          	or	s0,s0,a0
    b6a4:	00947c63          	bgeu	s0,s1,b6bc <__udivdi3+0x148>
    b6a8:	008a8433          	add	s0,s5,s0
    b6ac:	fff98793          	add	a5,s3,-1
    b6b0:	4d546e63          	bltu	s0,s5,bb8c <__udivdi3+0x618>
    b6b4:	ffe98993          	add	s3,s3,-2
    b6b8:	4c947a63          	bgeu	s0,s1,bb8c <__udivdi3+0x618>
    b6bc:	01091613          	sll	a2,s2,0x10
    b6c0:	01366533          	or	a0,a2,s3
    b6c4:	00000b13          	li	s6,0
    b6c8:	02812403          	lw	s0,40(sp)
    b6cc:	02c12083          	lw	ra,44(sp)
    b6d0:	02412483          	lw	s1,36(sp)
    b6d4:	02012903          	lw	s2,32(sp)
    b6d8:	01812a03          	lw	s4,24(sp)
    b6dc:	01412a83          	lw	s5,20(sp)
    b6e0:	01c12983          	lw	s3,28(sp)
    b6e4:	000b0593          	mv	a1,s6
    b6e8:	01012b03          	lw	s6,16(sp)
    b6ec:	03010113          	add	sp,sp,48
    b6f0:	00008067          	ret
    b6f4:	02d5f263          	bgeu	a1,a3,b718 <__udivdi3+0x1a4>
    b6f8:	00000b13          	li	s6,0
    b6fc:	00000513          	li	a0,0
    b700:	02c12083          	lw	ra,44(sp)
    b704:	01c12983          	lw	s3,28(sp)
    b708:	000b0593          	mv	a1,s6
    b70c:	01012b03          	lw	s6,16(sp)
    b710:	03010113          	add	sp,sp,48
    b714:	00008067          	ret
    b718:	000107b7          	lui	a5,0x10
    b71c:	26f6ee63          	bltu	a3,a5,b998 <__udivdi3+0x424>
    b720:	01000737          	lui	a4,0x1000
    b724:	01800793          	li	a5,24
    b728:	00e6f463          	bgeu	a3,a4,b730 <__udivdi3+0x1bc>
    b72c:	01000793          	li	a5,16
    b730:	00f6d533          	srl	a0,a3,a5
    b734:	00004717          	auipc	a4,0x4
    b738:	18470713          	add	a4,a4,388 # f8b8 <__clz_tab>
    b73c:	00a70733          	add	a4,a4,a0
    b740:	00074703          	lbu	a4,0(a4)
    b744:	02000513          	li	a0,32
    b748:	00f70733          	add	a4,a4,a5
    b74c:	40e50b33          	sub	s6,a0,a4
    b750:	26e51c63          	bne	a0,a4,b9c8 <__udivdi3+0x454>
    b754:	46b6ee63          	bltu	a3,a1,bbd0 <__udivdi3+0x65c>
    b758:	00c9b533          	sltu	a0,s3,a2
    b75c:	00153513          	seqz	a0,a0
    b760:	00000b13          	li	s6,0
    b764:	f9dff06f          	j	b700 <__udivdi3+0x18c>
    b768:	10060c63          	beqz	a2,b880 <__udivdi3+0x30c>
    b76c:	000107b7          	lui	a5,0x10
    b770:	44f67663          	bgeu	a2,a5,bbbc <__udivdi3+0x648>
    b774:	10063713          	sltiu	a4,a2,256
    b778:	00173713          	seqz	a4,a4
    b77c:	00371713          	sll	a4,a4,0x3
    b780:	00e656b3          	srl	a3,a2,a4
    b784:	00004797          	auipc	a5,0x4
    b788:	13478793          	add	a5,a5,308 # f8b8 <__clz_tab>
    b78c:	00d787b3          	add	a5,a5,a3
    b790:	0007c483          	lbu	s1,0(a5)
    b794:	02000793          	li	a5,32
    b798:	00e484b3          	add	s1,s1,a4
    b79c:	40978733          	sub	a4,a5,s1
    b7a0:	10979463          	bne	a5,s1,b8a8 <__udivdi3+0x334>
    b7a4:	01061a13          	sll	s4,a2,0x10
    b7a8:	40c584b3          	sub	s1,a1,a2
    b7ac:	01065913          	srl	s2,a2,0x10
    b7b0:	010a5a13          	srl	s4,s4,0x10
    b7b4:	00100b13          	li	s6,1
    b7b8:	00090593          	mv	a1,s2
    b7bc:	00048513          	mv	a0,s1
    b7c0:	64c030ef          	jal	ee0c <__hidden___udivsi3>
    b7c4:	000a0593          	mv	a1,s4
    b7c8:	00050993          	mv	s3,a0
    b7cc:	57c030ef          	jal	ed48 <__mulsi3>
    b7d0:	00050793          	mv	a5,a0
    b7d4:	00090593          	mv	a1,s2
    b7d8:	00048513          	mv	a0,s1
    b7dc:	00078493          	mv	s1,a5
    b7e0:	674030ef          	jal	ee54 <__umodsi3>
    b7e4:	01051513          	sll	a0,a0,0x10
    b7e8:	01045793          	srl	a5,s0,0x10
    b7ec:	00a7e7b3          	or	a5,a5,a0
    b7f0:	0097fc63          	bgeu	a5,s1,b808 <__udivdi3+0x294>
    b7f4:	00fa87b3          	add	a5,s5,a5
    b7f8:	fff98713          	add	a4,s3,-1
    b7fc:	0157e463          	bltu	a5,s5,b804 <__udivdi3+0x290>
    b800:	3e97ee63          	bltu	a5,s1,bbfc <__udivdi3+0x688>
    b804:	00070993          	mv	s3,a4
    b808:	409784b3          	sub	s1,a5,s1
    b80c:	00090593          	mv	a1,s2
    b810:	00048513          	mv	a0,s1
    b814:	5f8030ef          	jal	ee0c <__hidden___udivsi3>
    b818:	000a0593          	mv	a1,s4
    b81c:	00050a13          	mv	s4,a0
    b820:	528030ef          	jal	ed48 <__mulsi3>
    b824:	00050793          	mv	a5,a0
    b828:	00090593          	mv	a1,s2
    b82c:	00048513          	mv	a0,s1
    b830:	01041413          	sll	s0,s0,0x10
    b834:	00078493          	mv	s1,a5
    b838:	61c030ef          	jal	ee54 <__umodsi3>
    b83c:	01051513          	sll	a0,a0,0x10
    b840:	01045413          	srl	s0,s0,0x10
    b844:	00a46433          	or	s0,s0,a0
    b848:	00947e63          	bgeu	s0,s1,b864 <__udivdi3+0x2f0>
    b84c:	008a8433          	add	s0,s5,s0
    b850:	fffa0793          	add	a5,s4,-1
    b854:	01546663          	bltu	s0,s5,b860 <__udivdi3+0x2ec>
    b858:	ffea0a13          	add	s4,s4,-2
    b85c:	00946463          	bltu	s0,s1,b864 <__udivdi3+0x2f0>
    b860:	00078a13          	mv	s4,a5
    b864:	01099613          	sll	a2,s3,0x10
    b868:	01466533          	or	a0,a2,s4
    b86c:	e5dff06f          	j	b6c8 <__udivdi3+0x154>
    b870:	10063713          	sltiu	a4,a2,256
    b874:	00173713          	seqz	a4,a4
    b878:	00371713          	sll	a4,a4,0x3
    b87c:	d4dff06f          	j	b5c8 <__udivdi3+0x54>
    b880:	00000693          	li	a3,0
    b884:	00004797          	auipc	a5,0x4
    b888:	03478793          	add	a5,a5,52 # f8b8 <__clz_tab>
    b88c:	00d787b3          	add	a5,a5,a3
    b890:	0007c483          	lbu	s1,0(a5)
    b894:	00000713          	li	a4,0
    b898:	02000793          	li	a5,32
    b89c:	00e484b3          	add	s1,s1,a4
    b8a0:	40978733          	sub	a4,a5,s1
    b8a4:	f09780e3          	beq	a5,s1,b7a4 <__udivdi3+0x230>
    b8a8:	00e61ab3          	sll	s5,a2,a4
    b8ac:	01712623          	sw	s7,12(sp)
    b8b0:	010ad913          	srl	s2,s5,0x10
    b8b4:	0095dbb3          	srl	s7,a1,s1
    b8b8:	00e597b3          	sll	a5,a1,a4
    b8bc:	0099d4b3          	srl	s1,s3,s1
    b8c0:	00090593          	mv	a1,s2
    b8c4:	000b8513          	mv	a0,s7
    b8c8:	010a9a13          	sll	s4,s5,0x10
    b8cc:	00f4e4b3          	or	s1,s1,a5
    b8d0:	00e99433          	sll	s0,s3,a4
    b8d4:	010a5a13          	srl	s4,s4,0x10
    b8d8:	534030ef          	jal	ee0c <__hidden___udivsi3>
    b8dc:	00050593          	mv	a1,a0
    b8e0:	00050b13          	mv	s6,a0
    b8e4:	000a0513          	mv	a0,s4
    b8e8:	460030ef          	jal	ed48 <__mulsi3>
    b8ec:	00050993          	mv	s3,a0
    b8f0:	00090593          	mv	a1,s2
    b8f4:	000b8513          	mv	a0,s7
    b8f8:	55c030ef          	jal	ee54 <__umodsi3>
    b8fc:	01051513          	sll	a0,a0,0x10
    b900:	0104d793          	srl	a5,s1,0x10
    b904:	00a7e7b3          	or	a5,a5,a0
    b908:	0137fe63          	bgeu	a5,s3,b924 <__udivdi3+0x3b0>
    b90c:	00fa87b3          	add	a5,s5,a5
    b910:	fffb0713          	add	a4,s6,-1
    b914:	2d57ec63          	bltu	a5,s5,bbec <__udivdi3+0x678>
    b918:	2d37fa63          	bgeu	a5,s3,bbec <__udivdi3+0x678>
    b91c:	ffeb0b13          	add	s6,s6,-2
    b920:	015787b3          	add	a5,a5,s5
    b924:	413789b3          	sub	s3,a5,s3
    b928:	00090593          	mv	a1,s2
    b92c:	00098513          	mv	a0,s3
    b930:	4dc030ef          	jal	ee0c <__hidden___udivsi3>
    b934:	00050593          	mv	a1,a0
    b938:	00050b93          	mv	s7,a0
    b93c:	000a0513          	mv	a0,s4
    b940:	408030ef          	jal	ed48 <__mulsi3>
    b944:	00050793          	mv	a5,a0
    b948:	00090593          	mv	a1,s2
    b94c:	00098513          	mv	a0,s3
    b950:	01049493          	sll	s1,s1,0x10
    b954:	00078993          	mv	s3,a5
    b958:	4fc030ef          	jal	ee54 <__umodsi3>
    b95c:	01051513          	sll	a0,a0,0x10
    b960:	0104d493          	srl	s1,s1,0x10
    b964:	00a4e4b3          	or	s1,s1,a0
    b968:	0134fe63          	bgeu	s1,s3,b984 <__udivdi3+0x410>
    b96c:	009a84b3          	add	s1,s5,s1
    b970:	fffb8793          	add	a5,s7,-1
    b974:	2754e463          	bltu	s1,s5,bbdc <__udivdi3+0x668>
    b978:	2734f263          	bgeu	s1,s3,bbdc <__udivdi3+0x668>
    b97c:	ffeb8b93          	add	s7,s7,-2
    b980:	015484b3          	add	s1,s1,s5
    b984:	010b1b13          	sll	s6,s6,0x10
    b988:	017b6b33          	or	s6,s6,s7
    b98c:	413484b3          	sub	s1,s1,s3
    b990:	00c12b83          	lw	s7,12(sp)
    b994:	e25ff06f          	j	b7b8 <__udivdi3+0x244>
    b998:	1006b793          	sltiu	a5,a3,256
    b99c:	0017b793          	seqz	a5,a5
    b9a0:	00379793          	sll	a5,a5,0x3
    b9a4:	00f6d533          	srl	a0,a3,a5
    b9a8:	00004717          	auipc	a4,0x4
    b9ac:	f1070713          	add	a4,a4,-240 # f8b8 <__clz_tab>
    b9b0:	00a70733          	add	a4,a4,a0
    b9b4:	00074703          	lbu	a4,0(a4)
    b9b8:	02000513          	li	a0,32
    b9bc:	00f70733          	add	a4,a4,a5
    b9c0:	40e50b33          	sub	s6,a0,a4
    b9c4:	d8e508e3          	beq	a0,a4,b754 <__udivdi3+0x1e0>
    b9c8:	016696b3          	sll	a3,a3,s6
    b9cc:	01912223          	sw	s9,4(sp)
    b9d0:	00e65cb3          	srl	s9,a2,a4
    b9d4:	00dcecb3          	or	s9,s9,a3
    b9d8:	01512a23          	sw	s5,20(sp)
    b9dc:	01712623          	sw	s7,12(sp)
    b9e0:	010cda93          	srl	s5,s9,0x10
    b9e4:	00e5dbb3          	srl	s7,a1,a4
    b9e8:	016597b3          	sll	a5,a1,s6
    b9ec:	00e9d733          	srl	a4,s3,a4
    b9f0:	01812423          	sw	s8,8(sp)
    b9f4:	000a8593          	mv	a1,s5
    b9f8:	000b8513          	mv	a0,s7
    b9fc:	010c9c13          	sll	s8,s9,0x10
    ba00:	02812423          	sw	s0,40(sp)
    ba04:	02912223          	sw	s1,36(sp)
    ba08:	03212023          	sw	s2,32(sp)
    ba0c:	00f764b3          	or	s1,a4,a5
    ba10:	01661933          	sll	s2,a2,s6
    ba14:	01412c23          	sw	s4,24(sp)
    ba18:	010c5c13          	srl	s8,s8,0x10
    ba1c:	3f0030ef          	jal	ee0c <__hidden___udivsi3>
    ba20:	00050593          	mv	a1,a0
    ba24:	00050413          	mv	s0,a0
    ba28:	000c0513          	mv	a0,s8
    ba2c:	31c030ef          	jal	ed48 <__mulsi3>
    ba30:	00050a13          	mv	s4,a0
    ba34:	000a8593          	mv	a1,s5
    ba38:	000b8513          	mv	a0,s7
    ba3c:	418030ef          	jal	ee54 <__umodsi3>
    ba40:	01051513          	sll	a0,a0,0x10
    ba44:	0104d793          	srl	a5,s1,0x10
    ba48:	00a7e7b3          	or	a5,a5,a0
    ba4c:	0147fe63          	bgeu	a5,s4,ba68 <__udivdi3+0x4f4>
    ba50:	00fc87b3          	add	a5,s9,a5
    ba54:	fff40713          	add	a4,s0,-1
    ba58:	1997ee63          	bltu	a5,s9,bbf4 <__udivdi3+0x680>
    ba5c:	1947fc63          	bgeu	a5,s4,bbf4 <__udivdi3+0x680>
    ba60:	ffe40413          	add	s0,s0,-2
    ba64:	019787b3          	add	a5,a5,s9
    ba68:	41478a33          	sub	s4,a5,s4
    ba6c:	000a8593          	mv	a1,s5
    ba70:	000a0513          	mv	a0,s4
    ba74:	398030ef          	jal	ee0c <__hidden___udivsi3>
    ba78:	00050593          	mv	a1,a0
    ba7c:	00050b93          	mv	s7,a0
    ba80:	000c0513          	mv	a0,s8
    ba84:	2c4030ef          	jal	ed48 <__mulsi3>
    ba88:	00050793          	mv	a5,a0
    ba8c:	000a8593          	mv	a1,s5
    ba90:	000a0513          	mv	a0,s4
    ba94:	00078a13          	mv	s4,a5
    ba98:	3bc030ef          	jal	ee54 <__umodsi3>
    ba9c:	01049713          	sll	a4,s1,0x10
    baa0:	01051513          	sll	a0,a0,0x10
    baa4:	01075713          	srl	a4,a4,0x10
    baa8:	00a76733          	or	a4,a4,a0
    baac:	01477e63          	bgeu	a4,s4,bac8 <__udivdi3+0x554>
    bab0:	00ec8733          	add	a4,s9,a4
    bab4:	fffb8793          	add	a5,s7,-1
    bab8:	13976663          	bltu	a4,s9,bbe4 <__udivdi3+0x670>
    babc:	13477463          	bgeu	a4,s4,bbe4 <__udivdi3+0x670>
    bac0:	ffeb8b93          	add	s7,s7,-2
    bac4:	01970733          	add	a4,a4,s9
    bac8:	00010e37          	lui	t3,0x10
    bacc:	01041413          	sll	s0,s0,0x10
    bad0:	01746433          	or	s0,s0,s7
    bad4:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    bad8:	00f47833          	and	a6,s0,a5
    badc:	00f977b3          	and	a5,s2,a5
    bae0:	41470733          	sub	a4,a4,s4
    bae4:	01045e93          	srl	t4,s0,0x10
    bae8:	01095913          	srl	s2,s2,0x10
    baec:	00080513          	mv	a0,a6
    baf0:	00078593          	mv	a1,a5
    baf4:	254030ef          	jal	ed48 <__mulsi3>
    baf8:	00050313          	mv	t1,a0
    bafc:	00090593          	mv	a1,s2
    bb00:	00080513          	mv	a0,a6
    bb04:	244030ef          	jal	ed48 <__mulsi3>
    bb08:	00050813          	mv	a6,a0
    bb0c:	00078593          	mv	a1,a5
    bb10:	000e8513          	mv	a0,t4
    bb14:	234030ef          	jal	ed48 <__mulsi3>
    bb18:	00050893          	mv	a7,a0
    bb1c:	00090593          	mv	a1,s2
    bb20:	000e8513          	mv	a0,t4
    bb24:	224030ef          	jal	ed48 <__mulsi3>
    bb28:	01035793          	srl	a5,t1,0x10
    bb2c:	01180833          	add	a6,a6,a7
    bb30:	010787b3          	add	a5,a5,a6
    bb34:	0117f463          	bgeu	a5,a7,bb3c <__udivdi3+0x5c8>
    bb38:	01c50533          	add	a0,a0,t3
    bb3c:	0107d693          	srl	a3,a5,0x10
    bb40:	00a686b3          	add	a3,a3,a0
    bb44:	06d76863          	bltu	a4,a3,bbb4 <__udivdi3+0x640>
    bb48:	04d70663          	beq	a4,a3,bb94 <__udivdi3+0x620>
    bb4c:	00040513          	mv	a0,s0
    bb50:	02812403          	lw	s0,40(sp)
    bb54:	02c12083          	lw	ra,44(sp)
    bb58:	00000b13          	li	s6,0
    bb5c:	02412483          	lw	s1,36(sp)
    bb60:	02012903          	lw	s2,32(sp)
    bb64:	01812a03          	lw	s4,24(sp)
    bb68:	01412a83          	lw	s5,20(sp)
    bb6c:	00c12b83          	lw	s7,12(sp)
    bb70:	00812c03          	lw	s8,8(sp)
    bb74:	00412c83          	lw	s9,4(sp)
    bb78:	01c12983          	lw	s3,28(sp)
    bb7c:	000b0593          	mv	a1,s6
    bb80:	01012b03          	lw	s6,16(sp)
    bb84:	03010113          	add	sp,sp,48
    bb88:	00008067          	ret
    bb8c:	00078993          	mv	s3,a5
    bb90:	b2dff06f          	j	b6bc <__udivdi3+0x148>
    bb94:	00010737          	lui	a4,0x10
    bb98:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    bb9c:	00e7f7b3          	and	a5,a5,a4
    bba0:	01079793          	sll	a5,a5,0x10
    bba4:	00e37333          	and	t1,t1,a4
    bba8:	01699533          	sll	a0,s3,s6
    bbac:	006787b3          	add	a5,a5,t1
    bbb0:	f8f57ee3          	bgeu	a0,a5,bb4c <__udivdi3+0x5d8>
    bbb4:	fff40513          	add	a0,s0,-1
    bbb8:	f99ff06f          	j	bb50 <__udivdi3+0x5dc>
    bbbc:	010007b7          	lui	a5,0x1000
    bbc0:	04f67a63          	bgeu	a2,a5,bc14 <__udivdi3+0x6a0>
    bbc4:	01065693          	srl	a3,a2,0x10
    bbc8:	01000713          	li	a4,16
    bbcc:	bb9ff06f          	j	b784 <__udivdi3+0x210>
    bbd0:	00000b13          	li	s6,0
    bbd4:	00100513          	li	a0,1
    bbd8:	b29ff06f          	j	b700 <__udivdi3+0x18c>
    bbdc:	00078b93          	mv	s7,a5
    bbe0:	da5ff06f          	j	b984 <__udivdi3+0x410>
    bbe4:	00078b93          	mv	s7,a5
    bbe8:	ee1ff06f          	j	bac8 <__udivdi3+0x554>
    bbec:	00070b13          	mv	s6,a4
    bbf0:	d35ff06f          	j	b924 <__udivdi3+0x3b0>
    bbf4:	00070413          	mv	s0,a4
    bbf8:	e71ff06f          	j	ba68 <__udivdi3+0x4f4>
    bbfc:	ffe98993          	add	s3,s3,-2
    bc00:	015787b3          	add	a5,a5,s5
    bc04:	c05ff06f          	j	b808 <__udivdi3+0x294>
    bc08:	ffe90913          	add	s2,s2,-2
    bc0c:	015787b3          	add	a5,a5,s5
    bc10:	a51ff06f          	j	b660 <__udivdi3+0xec>
    bc14:	01865693          	srl	a3,a2,0x18
    bc18:	01800713          	li	a4,24
    bc1c:	b69ff06f          	j	b784 <__udivdi3+0x210>

0000bc20 <__umoddi3>:
    bc20:	fd010113          	add	sp,sp,-48
    bc24:	02112623          	sw	ra,44(sp)
    bc28:	00050793          	mv	a5,a0
    bc2c:	14069663          	bnez	a3,bd78 <__umoddi3+0x158>
    bc30:	03212023          	sw	s2,32(sp)
    bc34:	01412c23          	sw	s4,24(sp)
    bc38:	02812423          	sw	s0,40(sp)
    bc3c:	02912223          	sw	s1,36(sp)
    bc40:	01312e23          	sw	s3,28(sp)
    bc44:	01512a23          	sw	s5,20(sp)
    bc48:	00060a13          	mv	s4,a2
    bc4c:	00050913          	mv	s2,a0
    bc50:	1ac5f663          	bgeu	a1,a2,bdfc <__umoddi3+0x1dc>
    bc54:	01612823          	sw	s6,16(sp)
    bc58:	00010737          	lui	a4,0x10
    bc5c:	00058993          	mv	s3,a1
    bc60:	28e66063          	bltu	a2,a4,bee0 <__umoddi3+0x2c0>
    bc64:	01000737          	lui	a4,0x1000
    bc68:	01800693          	li	a3,24
    bc6c:	00e67463          	bgeu	a2,a4,bc74 <__umoddi3+0x54>
    bc70:	01000693          	li	a3,16
    bc74:	00d65533          	srl	a0,a2,a3
    bc78:	00004717          	auipc	a4,0x4
    bc7c:	c4070713          	add	a4,a4,-960 # f8b8 <__clz_tab>
    bc80:	00a70733          	add	a4,a4,a0
    bc84:	00074703          	lbu	a4,0(a4)
    bc88:	02000513          	li	a0,32
    bc8c:	00d70733          	add	a4,a4,a3
    bc90:	40e504b3          	sub	s1,a0,a4
    bc94:	00e50c63          	beq	a0,a4,bcac <__umoddi3+0x8c>
    bc98:	009599b3          	sll	s3,a1,s1
    bc9c:	00e7d733          	srl	a4,a5,a4
    bca0:	00961a33          	sll	s4,a2,s1
    bca4:	013769b3          	or	s3,a4,s3
    bca8:	00979933          	sll	s2,a5,s1
    bcac:	010a5a93          	srl	s5,s4,0x10
    bcb0:	000a8593          	mv	a1,s5
    bcb4:	00098513          	mv	a0,s3
    bcb8:	010a1b13          	sll	s6,s4,0x10
    bcbc:	150030ef          	jal	ee0c <__hidden___udivsi3>
    bcc0:	010b5b13          	srl	s6,s6,0x10
    bcc4:	000b0593          	mv	a1,s6
    bcc8:	080030ef          	jal	ed48 <__mulsi3>
    bccc:	00050413          	mv	s0,a0
    bcd0:	000a8593          	mv	a1,s5
    bcd4:	00098513          	mv	a0,s3
    bcd8:	17c030ef          	jal	ee54 <__umodsi3>
    bcdc:	01051513          	sll	a0,a0,0x10
    bce0:	01095793          	srl	a5,s2,0x10
    bce4:	00a7e7b3          	or	a5,a5,a0
    bce8:	0087f863          	bgeu	a5,s0,bcf8 <__umoddi3+0xd8>
    bcec:	00fa07b3          	add	a5,s4,a5
    bcf0:	0147e463          	bltu	a5,s4,bcf8 <__umoddi3+0xd8>
    bcf4:	5687e863          	bltu	a5,s0,c264 <__umoddi3+0x644>
    bcf8:	40878433          	sub	s0,a5,s0
    bcfc:	000a8593          	mv	a1,s5
    bd00:	00040513          	mv	a0,s0
    bd04:	108030ef          	jal	ee0c <__hidden___udivsi3>
    bd08:	000b0593          	mv	a1,s6
    bd0c:	03c030ef          	jal	ed48 <__mulsi3>
    bd10:	00050793          	mv	a5,a0
    bd14:	000a8593          	mv	a1,s5
    bd18:	00040513          	mv	a0,s0
    bd1c:	00078413          	mv	s0,a5
    bd20:	134030ef          	jal	ee54 <__umodsi3>
    bd24:	01091793          	sll	a5,s2,0x10
    bd28:	01051513          	sll	a0,a0,0x10
    bd2c:	0107d793          	srl	a5,a5,0x10
    bd30:	00a7e7b3          	or	a5,a5,a0
    bd34:	0087f863          	bgeu	a5,s0,bd44 <__umoddi3+0x124>
    bd38:	00fa07b3          	add	a5,s4,a5
    bd3c:	0147e463          	bltu	a5,s4,bd44 <__umoddi3+0x124>
    bd40:	5087ea63          	bltu	a5,s0,c254 <__umoddi3+0x634>
    bd44:	01012b03          	lw	s6,16(sp)
    bd48:	408787b3          	sub	a5,a5,s0
    bd4c:	0097d533          	srl	a0,a5,s1
    bd50:	02812403          	lw	s0,40(sp)
    bd54:	02412483          	lw	s1,36(sp)
    bd58:	02012903          	lw	s2,32(sp)
    bd5c:	01c12983          	lw	s3,28(sp)
    bd60:	01812a03          	lw	s4,24(sp)
    bd64:	01412a83          	lw	s5,20(sp)
    bd68:	00000593          	li	a1,0
    bd6c:	02c12083          	lw	ra,44(sp)
    bd70:	03010113          	add	sp,sp,48
    bd74:	00008067          	ret
    bd78:	00050893          	mv	a7,a0
    bd7c:	fed5e8e3          	bltu	a1,a3,bd6c <__umoddi3+0x14c>
    bd80:	03212023          	sw	s2,32(sp)
    bd84:	01312e23          	sw	s3,28(sp)
    bd88:	00010737          	lui	a4,0x10
    bd8c:	00058813          	mv	a6,a1
    bd90:	24e6ec63          	bltu	a3,a4,bfe8 <__umoddi3+0x3c8>
    bd94:	01000737          	lui	a4,0x1000
    bd98:	01800513          	li	a0,24
    bd9c:	00e6f463          	bgeu	a3,a4,bda4 <__umoddi3+0x184>
    bda0:	01000513          	li	a0,16
    bda4:	00a6d333          	srl	t1,a3,a0
    bda8:	00004717          	auipc	a4,0x4
    bdac:	b1070713          	add	a4,a4,-1264 # f8b8 <__clz_tab>
    bdb0:	00670733          	add	a4,a4,t1
    bdb4:	00074703          	lbu	a4,0(a4)
    bdb8:	02000313          	li	t1,32
    bdbc:	00a709b3          	add	s3,a4,a0
    bdc0:	41330933          	sub	s2,t1,s3
    bdc4:	25331a63          	bne	t1,s3,c018 <__umoddi3+0x3f8>
    bdc8:	00b6e463          	bltu	a3,a1,bdd0 <__umoddi3+0x1b0>
    bdcc:	00c7ea63          	bltu	a5,a2,bde0 <__umoddi3+0x1c0>
    bdd0:	40c788b3          	sub	a7,a5,a2
    bdd4:	40d586b3          	sub	a3,a1,a3
    bdd8:	0117b833          	sltu	a6,a5,a7
    bddc:	41068833          	sub	a6,a3,a6
    bde0:	02c12083          	lw	ra,44(sp)
    bde4:	02012903          	lw	s2,32(sp)
    bde8:	01c12983          	lw	s3,28(sp)
    bdec:	00088513          	mv	a0,a7
    bdf0:	00080593          	mv	a1,a6
    bdf4:	03010113          	add	sp,sp,48
    bdf8:	00008067          	ret
    bdfc:	0e060a63          	beqz	a2,bef0 <__umoddi3+0x2d0>
    be00:	00010737          	lui	a4,0x10
    be04:	42e67663          	bgeu	a2,a4,c230 <__umoddi3+0x610>
    be08:	10063693          	sltiu	a3,a2,256
    be0c:	0016b693          	seqz	a3,a3
    be10:	00369693          	sll	a3,a3,0x3
    be14:	00d65533          	srl	a0,a2,a3
    be18:	00004717          	auipc	a4,0x4
    be1c:	aa070713          	add	a4,a4,-1376 # f8b8 <__clz_tab>
    be20:	00a70733          	add	a4,a4,a0
    be24:	00074983          	lbu	s3,0(a4)
    be28:	02000713          	li	a4,32
    be2c:	00d989b3          	add	s3,s3,a3
    be30:	413704b3          	sub	s1,a4,s3
    be34:	0f371263          	bne	a4,s3,bf18 <__umoddi3+0x2f8>
    be38:	01061413          	sll	s0,a2,0x10
    be3c:	40c589b3          	sub	s3,a1,a2
    be40:	01065a93          	srl	s5,a2,0x10
    be44:	01045413          	srl	s0,s0,0x10
    be48:	000a8593          	mv	a1,s5
    be4c:	00098513          	mv	a0,s3
    be50:	7bd020ef          	jal	ee0c <__hidden___udivsi3>
    be54:	00040593          	mv	a1,s0
    be58:	6f1020ef          	jal	ed48 <__mulsi3>
    be5c:	00050793          	mv	a5,a0
    be60:	000a8593          	mv	a1,s5
    be64:	00098513          	mv	a0,s3
    be68:	00078993          	mv	s3,a5
    be6c:	7e9020ef          	jal	ee54 <__umodsi3>
    be70:	01051513          	sll	a0,a0,0x10
    be74:	01095793          	srl	a5,s2,0x10
    be78:	00a7e7b3          	or	a5,a5,a0
    be7c:	0137f863          	bgeu	a5,s3,be8c <__umoddi3+0x26c>
    be80:	00fa07b3          	add	a5,s4,a5
    be84:	0147e463          	bltu	a5,s4,be8c <__umoddi3+0x26c>
    be88:	3d37ea63          	bltu	a5,s3,c25c <__umoddi3+0x63c>
    be8c:	413789b3          	sub	s3,a5,s3
    be90:	000a8593          	mv	a1,s5
    be94:	00098513          	mv	a0,s3
    be98:	775020ef          	jal	ee0c <__hidden___udivsi3>
    be9c:	00040593          	mv	a1,s0
    bea0:	6a9020ef          	jal	ed48 <__mulsi3>
    bea4:	00050413          	mv	s0,a0
    bea8:	000a8593          	mv	a1,s5
    beac:	00098513          	mv	a0,s3
    beb0:	7a5020ef          	jal	ee54 <__umodsi3>
    beb4:	01091913          	sll	s2,s2,0x10
    beb8:	01051793          	sll	a5,a0,0x10
    bebc:	01095913          	srl	s2,s2,0x10
    bec0:	00f967b3          	or	a5,s2,a5
    bec4:	0087fa63          	bgeu	a5,s0,bed8 <__umoddi3+0x2b8>
    bec8:	00fa07b3          	add	a5,s4,a5
    becc:	0147e663          	bltu	a5,s4,bed8 <__umoddi3+0x2b8>
    bed0:	0087f463          	bgeu	a5,s0,bed8 <__umoddi3+0x2b8>
    bed4:	014787b3          	add	a5,a5,s4
    bed8:	408787b3          	sub	a5,a5,s0
    bedc:	e71ff06f          	j	bd4c <__umoddi3+0x12c>
    bee0:	10063693          	sltiu	a3,a2,256
    bee4:	0016b693          	seqz	a3,a3
    bee8:	00369693          	sll	a3,a3,0x3
    beec:	d89ff06f          	j	bc74 <__umoddi3+0x54>
    bef0:	00000513          	li	a0,0
    bef4:	00004717          	auipc	a4,0x4
    bef8:	9c470713          	add	a4,a4,-1596 # f8b8 <__clz_tab>
    befc:	00a70733          	add	a4,a4,a0
    bf00:	00074983          	lbu	s3,0(a4)
    bf04:	00000693          	li	a3,0
    bf08:	02000713          	li	a4,32
    bf0c:	00d989b3          	add	s3,s3,a3
    bf10:	413704b3          	sub	s1,a4,s3
    bf14:	f33702e3          	beq	a4,s3,be38 <__umoddi3+0x218>
    bf18:	00961a33          	sll	s4,a2,s1
    bf1c:	01712623          	sw	s7,12(sp)
    bf20:	010a5a93          	srl	s5,s4,0x10
    bf24:	0135dbb3          	srl	s7,a1,s3
    bf28:	00959733          	sll	a4,a1,s1
    bf2c:	0137d9b3          	srl	s3,a5,s3
    bf30:	000a8593          	mv	a1,s5
    bf34:	000b8513          	mv	a0,s7
    bf38:	010a1413          	sll	s0,s4,0x10
    bf3c:	00e9e9b3          	or	s3,s3,a4
    bf40:	00979933          	sll	s2,a5,s1
    bf44:	01612823          	sw	s6,16(sp)
    bf48:	01045413          	srl	s0,s0,0x10
    bf4c:	6c1020ef          	jal	ee0c <__hidden___udivsi3>
    bf50:	00040593          	mv	a1,s0
    bf54:	5f5020ef          	jal	ed48 <__mulsi3>
    bf58:	00050b13          	mv	s6,a0
    bf5c:	000a8593          	mv	a1,s5
    bf60:	000b8513          	mv	a0,s7
    bf64:	6f1020ef          	jal	ee54 <__umodsi3>
    bf68:	01051513          	sll	a0,a0,0x10
    bf6c:	0109d793          	srl	a5,s3,0x10
    bf70:	00a7e7b3          	or	a5,a5,a0
    bf74:	0167fa63          	bgeu	a5,s6,bf88 <__umoddi3+0x368>
    bf78:	00fa07b3          	add	a5,s4,a5
    bf7c:	0147e663          	bltu	a5,s4,bf88 <__umoddi3+0x368>
    bf80:	0167f463          	bgeu	a5,s6,bf88 <__umoddi3+0x368>
    bf84:	014787b3          	add	a5,a5,s4
    bf88:	41678b33          	sub	s6,a5,s6
    bf8c:	000a8593          	mv	a1,s5
    bf90:	000b0513          	mv	a0,s6
    bf94:	679020ef          	jal	ee0c <__hidden___udivsi3>
    bf98:	00040593          	mv	a1,s0
    bf9c:	5ad020ef          	jal	ed48 <__mulsi3>
    bfa0:	00050793          	mv	a5,a0
    bfa4:	000a8593          	mv	a1,s5
    bfa8:	000b0513          	mv	a0,s6
    bfac:	01099993          	sll	s3,s3,0x10
    bfb0:	00078b13          	mv	s6,a5
    bfb4:	6a1020ef          	jal	ee54 <__umodsi3>
    bfb8:	01051513          	sll	a0,a0,0x10
    bfbc:	0109d993          	srl	s3,s3,0x10
    bfc0:	00a9e9b3          	or	s3,s3,a0
    bfc4:	0169fa63          	bgeu	s3,s6,bfd8 <__umoddi3+0x3b8>
    bfc8:	013a09b3          	add	s3,s4,s3
    bfcc:	0149e663          	bltu	s3,s4,bfd8 <__umoddi3+0x3b8>
    bfd0:	0169f463          	bgeu	s3,s6,bfd8 <__umoddi3+0x3b8>
    bfd4:	014989b3          	add	s3,s3,s4
    bfd8:	416989b3          	sub	s3,s3,s6
    bfdc:	00c12b83          	lw	s7,12(sp)
    bfe0:	01012b03          	lw	s6,16(sp)
    bfe4:	e65ff06f          	j	be48 <__umoddi3+0x228>
    bfe8:	1006b513          	sltiu	a0,a3,256
    bfec:	00153513          	seqz	a0,a0
    bff0:	00351513          	sll	a0,a0,0x3
    bff4:	00a6d333          	srl	t1,a3,a0
    bff8:	00004717          	auipc	a4,0x4
    bffc:	8c070713          	add	a4,a4,-1856 # f8b8 <__clz_tab>
    c000:	00670733          	add	a4,a4,t1
    c004:	00074703          	lbu	a4,0(a4)
    c008:	02000313          	li	t1,32
    c00c:	00a709b3          	add	s3,a4,a0
    c010:	41330933          	sub	s2,t1,s3
    c014:	db330ae3          	beq	t1,s3,bdc8 <__umoddi3+0x1a8>
    c018:	01512a23          	sw	s5,20(sp)
    c01c:	012696b3          	sll	a3,a3,s2
    c020:	01365ab3          	srl	s5,a2,s3
    c024:	00daeab3          	or	s5,s5,a3
    c028:	01712623          	sw	s7,12(sp)
    c02c:	01a12023          	sw	s10,0(sp)
    c030:	010adb93          	srl	s7,s5,0x10
    c034:	0135dd33          	srl	s10,a1,s3
    c038:	01259733          	sll	a4,a1,s2
    c03c:	0137d6b3          	srl	a3,a5,s3
    c040:	01912223          	sw	s9,4(sp)
    c044:	000b8593          	mv	a1,s7
    c048:	000d0513          	mv	a0,s10
    c04c:	010a9c93          	sll	s9,s5,0x10
    c050:	02812423          	sw	s0,40(sp)
    c054:	02912223          	sw	s1,36(sp)
    c058:	01261433          	sll	s0,a2,s2
    c05c:	012794b3          	sll	s1,a5,s2
    c060:	01412c23          	sw	s4,24(sp)
    c064:	01612823          	sw	s6,16(sp)
    c068:	00e6ea33          	or	s4,a3,a4
    c06c:	01812423          	sw	s8,8(sp)
    c070:	010cdc93          	srl	s9,s9,0x10
    c074:	599020ef          	jal	ee0c <__hidden___udivsi3>
    c078:	00050593          	mv	a1,a0
    c07c:	00050b13          	mv	s6,a0
    c080:	000c8513          	mv	a0,s9
    c084:	4c5020ef          	jal	ed48 <__mulsi3>
    c088:	00050c13          	mv	s8,a0
    c08c:	000b8593          	mv	a1,s7
    c090:	000d0513          	mv	a0,s10
    c094:	5c1020ef          	jal	ee54 <__umodsi3>
    c098:	01051513          	sll	a0,a0,0x10
    c09c:	010a5793          	srl	a5,s4,0x10
    c0a0:	00a7e7b3          	or	a5,a5,a0
    c0a4:	0187fe63          	bgeu	a5,s8,c0c0 <__umoddi3+0x4a0>
    c0a8:	00fa87b3          	add	a5,s5,a5
    c0ac:	fffb0713          	add	a4,s6,-1
    c0b0:	1957ee63          	bltu	a5,s5,c24c <__umoddi3+0x62c>
    c0b4:	1987fc63          	bgeu	a5,s8,c24c <__umoddi3+0x62c>
    c0b8:	ffeb0b13          	add	s6,s6,-2
    c0bc:	015787b3          	add	a5,a5,s5
    c0c0:	41878c33          	sub	s8,a5,s8
    c0c4:	000b8593          	mv	a1,s7
    c0c8:	000c0513          	mv	a0,s8
    c0cc:	541020ef          	jal	ee0c <__hidden___udivsi3>
    c0d0:	00050593          	mv	a1,a0
    c0d4:	00050d13          	mv	s10,a0
    c0d8:	000c8513          	mv	a0,s9
    c0dc:	46d020ef          	jal	ed48 <__mulsi3>
    c0e0:	00050793          	mv	a5,a0
    c0e4:	000b8593          	mv	a1,s7
    c0e8:	000c0513          	mv	a0,s8
    c0ec:	00078b93          	mv	s7,a5
    c0f0:	565020ef          	jal	ee54 <__umodsi3>
    c0f4:	010a1593          	sll	a1,s4,0x10
    c0f8:	01051513          	sll	a0,a0,0x10
    c0fc:	0105d593          	srl	a1,a1,0x10
    c100:	00a5e5b3          	or	a1,a1,a0
    c104:	0175fe63          	bgeu	a1,s7,c120 <__umoddi3+0x500>
    c108:	00ba85b3          	add	a1,s5,a1
    c10c:	fffd0793          	add	a5,s10,-1
    c110:	1355ea63          	bltu	a1,s5,c244 <__umoddi3+0x624>
    c114:	1375f863          	bgeu	a1,s7,c244 <__umoddi3+0x624>
    c118:	ffed0d13          	add	s10,s10,-2
    c11c:	015585b3          	add	a1,a1,s5
    c120:	010b1793          	sll	a5,s6,0x10
    c124:	00010e37          	lui	t3,0x10
    c128:	01a7e7b3          	or	a5,a5,s10
    c12c:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    c130:	0067f8b3          	and	a7,a5,t1
    c134:	00647333          	and	t1,s0,t1
    c138:	41758733          	sub	a4,a1,s7
    c13c:	0107d793          	srl	a5,a5,0x10
    c140:	01045e93          	srl	t4,s0,0x10
    c144:	00088513          	mv	a0,a7
    c148:	00030593          	mv	a1,t1
    c14c:	3fd020ef          	jal	ed48 <__mulsi3>
    c150:	00050813          	mv	a6,a0
    c154:	000e8593          	mv	a1,t4
    c158:	00088513          	mv	a0,a7
    c15c:	3ed020ef          	jal	ed48 <__mulsi3>
    c160:	00050893          	mv	a7,a0
    c164:	00030593          	mv	a1,t1
    c168:	00078513          	mv	a0,a5
    c16c:	3dd020ef          	jal	ed48 <__mulsi3>
    c170:	00050313          	mv	t1,a0
    c174:	000e8593          	mv	a1,t4
    c178:	00078513          	mv	a0,a5
    c17c:	3cd020ef          	jal	ed48 <__mulsi3>
    c180:	01085793          	srl	a5,a6,0x10
    c184:	006888b3          	add	a7,a7,t1
    c188:	011787b3          	add	a5,a5,a7
    c18c:	0067f463          	bgeu	a5,t1,c194 <__umoddi3+0x574>
    c190:	01c50533          	add	a0,a0,t3
    c194:	00010637          	lui	a2,0x10
    c198:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    c19c:	0107d693          	srl	a3,a5,0x10
    c1a0:	00c7f7b3          	and	a5,a5,a2
    c1a4:	01079793          	sll	a5,a5,0x10
    c1a8:	00c87833          	and	a6,a6,a2
    c1ac:	00a686b3          	add	a3,a3,a0
    c1b0:	010787b3          	add	a5,a5,a6
    c1b4:	06d76263          	bltu	a4,a3,c218 <__umoddi3+0x5f8>
    c1b8:	04d70e63          	beq	a4,a3,c214 <__umoddi3+0x5f4>
    c1bc:	40f487b3          	sub	a5,s1,a5
    c1c0:	00f4b4b3          	sltu	s1,s1,a5
    c1c4:	02812403          	lw	s0,40(sp)
    c1c8:	02c12083          	lw	ra,44(sp)
    c1cc:	40d705b3          	sub	a1,a4,a3
    c1d0:	409585b3          	sub	a1,a1,s1
    c1d4:	01359733          	sll	a4,a1,s3
    c1d8:	0127d7b3          	srl	a5,a5,s2
    c1dc:	02412483          	lw	s1,36(sp)
    c1e0:	01c12983          	lw	s3,28(sp)
    c1e4:	01812a03          	lw	s4,24(sp)
    c1e8:	01412a83          	lw	s5,20(sp)
    c1ec:	01012b03          	lw	s6,16(sp)
    c1f0:	00c12b83          	lw	s7,12(sp)
    c1f4:	00812c03          	lw	s8,8(sp)
    c1f8:	00412c83          	lw	s9,4(sp)
    c1fc:	00012d03          	lw	s10,0(sp)
    c200:	0125d5b3          	srl	a1,a1,s2
    c204:	00f76533          	or	a0,a4,a5
    c208:	02012903          	lw	s2,32(sp)
    c20c:	03010113          	add	sp,sp,48
    c210:	00008067          	ret
    c214:	faf4f4e3          	bgeu	s1,a5,c1bc <__umoddi3+0x59c>
    c218:	40878433          	sub	s0,a5,s0
    c21c:	0087b7b3          	sltu	a5,a5,s0
    c220:	01578ab3          	add	s5,a5,s5
    c224:	415686b3          	sub	a3,a3,s5
    c228:	00040793          	mv	a5,s0
    c22c:	f91ff06f          	j	c1bc <__umoddi3+0x59c>
    c230:	01000737          	lui	a4,0x1000
    c234:	02e67c63          	bgeu	a2,a4,c26c <__umoddi3+0x64c>
    c238:	01065513          	srl	a0,a2,0x10
    c23c:	01000693          	li	a3,16
    c240:	bd9ff06f          	j	be18 <__umoddi3+0x1f8>
    c244:	00078d13          	mv	s10,a5
    c248:	ed9ff06f          	j	c120 <__umoddi3+0x500>
    c24c:	00070b13          	mv	s6,a4
    c250:	e71ff06f          	j	c0c0 <__umoddi3+0x4a0>
    c254:	014787b3          	add	a5,a5,s4
    c258:	aedff06f          	j	bd44 <__umoddi3+0x124>
    c25c:	014787b3          	add	a5,a5,s4
    c260:	c2dff06f          	j	be8c <__umoddi3+0x26c>
    c264:	014787b3          	add	a5,a5,s4
    c268:	a91ff06f          	j	bcf8 <__umoddi3+0xd8>
    c26c:	01865513          	srl	a0,a2,0x18
    c270:	01800693          	li	a3,24
    c274:	ba5ff06f          	j	be18 <__umoddi3+0x1f8>

0000c278 <__adddf3>:
    c278:	001007b7          	lui	a5,0x100
    c27c:	fe010113          	add	sp,sp,-32
    c280:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c284:	00bef833          	and	a6,t4,a1
    c288:	00def7b3          	and	a5,t4,a3
    c28c:	0146d313          	srl	t1,a3,0x14
    c290:	01212823          	sw	s2,16(sp)
    c294:	0145d913          	srl	s2,a1,0x14
    c298:	00379793          	sll	a5,a5,0x3
    c29c:	00812c23          	sw	s0,24(sp)
    c2a0:	00381813          	sll	a6,a6,0x3
    c2a4:	01f5d413          	srl	s0,a1,0x1f
    c2a8:	01d55713          	srl	a4,a0,0x1d
    c2ac:	01d65893          	srl	a7,a2,0x1d
    c2b0:	7ff97913          	and	s2,s2,2047
    c2b4:	7ff37313          	and	t1,t1,2047
    c2b8:	00112e23          	sw	ra,28(sp)
    c2bc:	00912a23          	sw	s1,20(sp)
    c2c0:	01312623          	sw	s3,12(sp)
    c2c4:	01f6d693          	srl	a3,a3,0x1f
    c2c8:	00f8e8b3          	or	a7,a7,a5
    c2cc:	01076733          	or	a4,a4,a6
    c2d0:	00351593          	sll	a1,a0,0x3
    c2d4:	00361f13          	sll	t5,a2,0x3
    c2d8:	406907b3          	sub	a5,s2,t1
    c2dc:	1ed40463          	beq	s0,a3,c4c4 <__adddf3+0x24c>
    c2e0:	16f05263          	blez	a5,c444 <__adddf3+0x1cc>
    c2e4:	28030663          	beqz	t1,c570 <__adddf3+0x2f8>
    c2e8:	7ff00693          	li	a3,2047
    c2ec:	42d90663          	beq	s2,a3,c718 <__adddf3+0x4a0>
    c2f0:	03800693          	li	a3,56
    c2f4:	00100613          	li	a2,1
    c2f8:	02f6ce63          	blt	a3,a5,c334 <__adddf3+0xbc>
    c2fc:	008006b7          	lui	a3,0x800
    c300:	00d8e8b3          	or	a7,a7,a3
    c304:	01f00693          	li	a3,31
    c308:	52f6ce63          	blt	a3,a5,c844 <__adddf3+0x5cc>
    c30c:	02000693          	li	a3,32
    c310:	40f686b3          	sub	a3,a3,a5
    c314:	00d89633          	sll	a2,a7,a3
    c318:	00ff5533          	srl	a0,t5,a5
    c31c:	00df16b3          	sll	a3,t5,a3
    c320:	00a66633          	or	a2,a2,a0
    c324:	00d036b3          	snez	a3,a3
    c328:	00f8d8b3          	srl	a7,a7,a5
    c32c:	00d66633          	or	a2,a2,a3
    c330:	41170733          	sub	a4,a4,a7
    c334:	40c58633          	sub	a2,a1,a2
    c338:	00c5b5b3          	sltu	a1,a1,a2
    c33c:	00060493          	mv	s1,a2
    c340:	40b709b3          	sub	s3,a4,a1
    c344:	00899793          	sll	a5,s3,0x8
    c348:	3207da63          	bgez	a5,c67c <__adddf3+0x404>
    c34c:	008007b7          	lui	a5,0x800
    c350:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c354:	00f9f9b3          	and	s3,s3,a5
    c358:	2c098863          	beqz	s3,c628 <__adddf3+0x3b0>
    c35c:	00098513          	mv	a0,s3
    c360:	359020ef          	jal	eeb8 <__clzsi2>
    c364:	ff850793          	add	a5,a0,-8
    c368:	02000693          	li	a3,32
    c36c:	40f68733          	sub	a4,a3,a5
    c370:	00e4d733          	srl	a4,s1,a4
    c374:	00f999b3          	sll	s3,s3,a5
    c378:	01376733          	or	a4,a4,s3
    c37c:	00f494b3          	sll	s1,s1,a5
    c380:	4b27c863          	blt	a5,s2,c830 <__adddf3+0x5b8>
    c384:	412787b3          	sub	a5,a5,s2
    c388:	00178793          	add	a5,a5,1
    c38c:	40f686b3          	sub	a3,a3,a5
    c390:	00d49633          	sll	a2,s1,a3
    c394:	00f4d9b3          	srl	s3,s1,a5
    c398:	00c03633          	snez	a2,a2
    c39c:	01366633          	or	a2,a2,s3
    c3a0:	00d716b3          	sll	a3,a4,a3
    c3a4:	00c6e4b3          	or	s1,a3,a2
    c3a8:	00f759b3          	srl	s3,a4,a5
    c3ac:	00000913          	li	s2,0
    c3b0:	0074f793          	and	a5,s1,7
    c3b4:	02078063          	beqz	a5,c3d4 <__adddf3+0x15c>
    c3b8:	00f4f793          	and	a5,s1,15
    c3bc:	00400713          	li	a4,4
    c3c0:	00e78a63          	beq	a5,a4,c3d4 <__adddf3+0x15c>
    c3c4:	00448793          	add	a5,s1,4
    c3c8:	0097b633          	sltu	a2,a5,s1
    c3cc:	00c989b3          	add	s3,s3,a2
    c3d0:	00078493          	mv	s1,a5
    c3d4:	00899793          	sll	a5,s3,0x8
    c3d8:	6e07da63          	bgez	a5,cacc <__adddf3+0x854>
    c3dc:	00190793          	add	a5,s2,1
    c3e0:	7ff00713          	li	a4,2047
    c3e4:	00040e13          	mv	t3,s0
    c3e8:	2ae78663          	beq	a5,a4,c694 <__adddf3+0x41c>
    c3ec:	ff800737          	lui	a4,0xff800
    c3f0:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c3f4:	00e9f733          	and	a4,s3,a4
    c3f8:	7ff7f793          	and	a5,a5,2047
    c3fc:	01d71813          	sll	a6,a4,0x1d
    c400:	0034d613          	srl	a2,s1,0x3
    c404:	00971713          	sll	a4,a4,0x9
    c408:	00c86833          	or	a6,a6,a2
    c40c:	00c75713          	srl	a4,a4,0xc
    c410:	01c12083          	lw	ra,28(sp)
    c414:	01812403          	lw	s0,24(sp)
    c418:	01479793          	sll	a5,a5,0x14
    c41c:	00e7e7b3          	or	a5,a5,a4
    c420:	01fe1713          	sll	a4,t3,0x1f
    c424:	00e7e7b3          	or	a5,a5,a4
    c428:	01412483          	lw	s1,20(sp)
    c42c:	01012903          	lw	s2,16(sp)
    c430:	00c12983          	lw	s3,12(sp)
    c434:	00080513          	mv	a0,a6
    c438:	00078593          	mv	a1,a5
    c43c:	02010113          	add	sp,sp,32
    c440:	00008067          	ret
    c444:	14078c63          	beqz	a5,c59c <__adddf3+0x324>
    c448:	412307b3          	sub	a5,t1,s2
    c44c:	3c091263          	bnez	s2,c810 <__adddf3+0x598>
    c450:	00b76533          	or	a0,a4,a1
    c454:	4c050463          	beqz	a0,c91c <__adddf3+0x6a4>
    c458:	fff78513          	add	a0,a5,-1
    c45c:	60050263          	beqz	a0,ca60 <__adddf3+0x7e8>
    c460:	7ff00813          	li	a6,2047
    c464:	57078663          	beq	a5,a6,c9d0 <__adddf3+0x758>
    c468:	03800793          	li	a5,56
    c46c:	00100613          	li	a2,1
    c470:	02a7cc63          	blt	a5,a0,c4a8 <__adddf3+0x230>
    c474:	00050793          	mv	a5,a0
    c478:	01f00613          	li	a2,31
    c47c:	56f64c63          	blt	a2,a5,c9f4 <__adddf3+0x77c>
    c480:	02000513          	li	a0,32
    c484:	40f50533          	sub	a0,a0,a5
    c488:	00a71633          	sll	a2,a4,a0
    c48c:	00f5d833          	srl	a6,a1,a5
    c490:	00a59533          	sll	a0,a1,a0
    c494:	01066633          	or	a2,a2,a6
    c498:	00a03533          	snez	a0,a0
    c49c:	00f75733          	srl	a4,a4,a5
    c4a0:	00a66633          	or	a2,a2,a0
    c4a4:	40e888b3          	sub	a7,a7,a4
    c4a8:	40cf0633          	sub	a2,t5,a2
    c4ac:	00cf3733          	sltu	a4,t5,a2
    c4b0:	00060493          	mv	s1,a2
    c4b4:	40e889b3          	sub	s3,a7,a4
    c4b8:	00030913          	mv	s2,t1
    c4bc:	00068413          	mv	s0,a3
    c4c0:	e85ff06f          	j	c344 <__adddf3+0xcc>
    c4c4:	1ef05063          	blez	a5,c6a4 <__adddf3+0x42c>
    c4c8:	14031063          	bnez	t1,c608 <__adddf3+0x390>
    c4cc:	01e8e6b3          	or	a3,a7,t5
    c4d0:	26068c63          	beqz	a3,c748 <__adddf3+0x4d0>
    c4d4:	fff78693          	add	a3,a5,-1
    c4d8:	48068063          	beqz	a3,c958 <__adddf3+0x6e0>
    c4dc:	7ff00613          	li	a2,2047
    c4e0:	22c78c63          	beq	a5,a2,c718 <__adddf3+0x4a0>
    c4e4:	03800793          	li	a5,56
    c4e8:	00100993          	li	s3,1
    c4ec:	02d7cc63          	blt	a5,a3,c524 <__adddf3+0x2ac>
    c4f0:	00068793          	mv	a5,a3
    c4f4:	01f00693          	li	a3,31
    c4f8:	4af6c063          	blt	a3,a5,c998 <__adddf3+0x720>
    c4fc:	02000693          	li	a3,32
    c500:	40f686b3          	sub	a3,a3,a5
    c504:	00d899b3          	sll	s3,a7,a3
    c508:	00ff5633          	srl	a2,t5,a5
    c50c:	00df16b3          	sll	a3,t5,a3
    c510:	00c9e9b3          	or	s3,s3,a2
    c514:	00d036b3          	snez	a3,a3
    c518:	00f8d8b3          	srl	a7,a7,a5
    c51c:	00d9e9b3          	or	s3,s3,a3
    c520:	01170733          	add	a4,a4,a7
    c524:	00b985b3          	add	a1,s3,a1
    c528:	0135b9b3          	sltu	s3,a1,s3
    c52c:	00058493          	mv	s1,a1
    c530:	00e989b3          	add	s3,s3,a4
    c534:	00899793          	sll	a5,s3,0x8
    c538:	1407d263          	bgez	a5,c67c <__adddf3+0x404>
    c53c:	00190913          	add	s2,s2,1
    c540:	7ff00793          	li	a5,2047
    c544:	36f90c63          	beq	s2,a5,c8bc <__adddf3+0x644>
    c548:	ff8007b7          	lui	a5,0xff800
    c54c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c550:	0014f613          	and	a2,s1,1
    c554:	00f9f7b3          	and	a5,s3,a5
    c558:	0014d713          	srl	a4,s1,0x1
    c55c:	00c76733          	or	a4,a4,a2
    c560:	01f79613          	sll	a2,a5,0x1f
    c564:	00e664b3          	or	s1,a2,a4
    c568:	0017d993          	srl	s3,a5,0x1
    c56c:	e45ff06f          	j	c3b0 <__adddf3+0x138>
    c570:	01e8e6b3          	or	a3,a7,t5
    c574:	1c068a63          	beqz	a3,c748 <__adddf3+0x4d0>
    c578:	fff78693          	add	a3,a5,-1
    c57c:	40068063          	beqz	a3,c97c <__adddf3+0x704>
    c580:	7ff00613          	li	a2,2047
    c584:	18c78a63          	beq	a5,a2,c718 <__adddf3+0x4a0>
    c588:	03800793          	li	a5,56
    c58c:	00100613          	li	a2,1
    c590:	dad7c2e3          	blt	a5,a3,c334 <__adddf3+0xbc>
    c594:	00068793          	mv	a5,a3
    c598:	d6dff06f          	j	c304 <__adddf3+0x8c>
    c59c:	00190813          	add	a6,s2,1
    c5a0:	7fe87813          	and	a6,a6,2046
    c5a4:	22081c63          	bnez	a6,c7dc <__adddf3+0x564>
    c5a8:	00b76333          	or	t1,a4,a1
    c5ac:	01e8e833          	or	a6,a7,t5
    c5b0:	38091063          	bnez	s2,c930 <__adddf3+0x6b8>
    c5b4:	46030e63          	beqz	t1,ca30 <__adddf3+0x7b8>
    c5b8:	40080663          	beqz	a6,c9c4 <__adddf3+0x74c>
    c5bc:	41e589b3          	sub	s3,a1,t5
    c5c0:	0135b533          	sltu	a0,a1,s3
    c5c4:	41170633          	sub	a2,a4,a7
    c5c8:	40a60633          	sub	a2,a2,a0
    c5cc:	00861513          	sll	a0,a2,0x8
    c5d0:	50055e63          	bgez	a0,caec <__adddf3+0x874>
    c5d4:	40bf05b3          	sub	a1,t5,a1
    c5d8:	40e88733          	sub	a4,a7,a4
    c5dc:	00bf3f33          	sltu	t5,t5,a1
    c5e0:	41e70733          	sub	a4,a4,t5
    c5e4:	00871613          	sll	a2,a4,0x8
    c5e8:	00058493          	mv	s1,a1
    c5ec:	52065e63          	bgez	a2,cb28 <__adddf3+0x8b0>
    c5f0:	ff8007b7          	lui	a5,0xff800
    c5f4:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c5f8:	00f77733          	and	a4,a4,a5
    c5fc:	00068e13          	mv	t3,a3
    c600:	00100793          	li	a5,1
    c604:	df9ff06f          	j	c3fc <__adddf3+0x184>
    c608:	7ff00693          	li	a3,2047
    c60c:	10d90663          	beq	s2,a3,c718 <__adddf3+0x4a0>
    c610:	03800693          	li	a3,56
    c614:	00100993          	li	s3,1
    c618:	f0f6c6e3          	blt	a3,a5,c524 <__adddf3+0x2ac>
    c61c:	008006b7          	lui	a3,0x800
    c620:	00d8e8b3          	or	a7,a7,a3
    c624:	ed1ff06f          	j	c4f4 <__adddf3+0x27c>
    c628:	00048513          	mv	a0,s1
    c62c:	08d020ef          	jal	eeb8 <__clzsi2>
    c630:	01850793          	add	a5,a0,24
    c634:	01f00693          	li	a3,31
    c638:	d2f6d8e3          	bge	a3,a5,c368 <__adddf3+0xf0>
    c63c:	ff850713          	add	a4,a0,-8
    c640:	00e49733          	sll	a4,s1,a4
    c644:	2327c663          	blt	a5,s2,c870 <__adddf3+0x5f8>
    c648:	41278933          	sub	s2,a5,s2
    c64c:	00190793          	add	a5,s2,1
    c650:	48f6d663          	bge	a3,a5,cadc <__adddf3+0x864>
    c654:	fe190913          	add	s2,s2,-31
    c658:	02000693          	li	a3,32
    c65c:	012754b3          	srl	s1,a4,s2
    c660:	00d78c63          	beq	a5,a3,c678 <__adddf3+0x400>
    c664:	04000693          	li	a3,64
    c668:	40f687b3          	sub	a5,a3,a5
    c66c:	00f71733          	sll	a4,a4,a5
    c670:	00e03733          	snez	a4,a4
    c674:	00e4e4b3          	or	s1,s1,a4
    c678:	00000913          	li	s2,0
    c67c:	0074f793          	and	a5,s1,7
    c680:	d2079ce3          	bnez	a5,c3b8 <__adddf3+0x140>
    c684:	00090793          	mv	a5,s2
    c688:	0034d613          	srl	a2,s1,0x3
    c68c:	00098713          	mv	a4,s3
    c690:	0c00006f          	j	c750 <__adddf3+0x4d8>
    c694:	7ff00793          	li	a5,2047
    c698:	00000713          	li	a4,0
    c69c:	00000813          	li	a6,0
    c6a0:	d71ff06f          	j	c410 <__adddf3+0x198>
    c6a4:	0c078a63          	beqz	a5,c778 <__adddf3+0x500>
    c6a8:	412307b3          	sub	a5,t1,s2
    c6ac:	1e090263          	beqz	s2,c890 <__adddf3+0x618>
    c6b0:	7ff00693          	li	a3,2047
    c6b4:	32d30863          	beq	t1,a3,c9e4 <__adddf3+0x76c>
    c6b8:	03800693          	li	a3,56
    c6bc:	00100993          	li	s3,1
    c6c0:	02f6ce63          	blt	a3,a5,c6fc <__adddf3+0x484>
    c6c4:	008006b7          	lui	a3,0x800
    c6c8:	00d76733          	or	a4,a4,a3
    c6cc:	01f00693          	li	a3,31
    c6d0:	3cf6c863          	blt	a3,a5,caa0 <__adddf3+0x828>
    c6d4:	02000693          	li	a3,32
    c6d8:	40f686b3          	sub	a3,a3,a5
    c6dc:	00d719b3          	sll	s3,a4,a3
    c6e0:	00f5d633          	srl	a2,a1,a5
    c6e4:	00d596b3          	sll	a3,a1,a3
    c6e8:	00c9e9b3          	or	s3,s3,a2
    c6ec:	00d036b3          	snez	a3,a3
    c6f0:	00f75733          	srl	a4,a4,a5
    c6f4:	00d9e9b3          	or	s3,s3,a3
    c6f8:	00e888b3          	add	a7,a7,a4
    c6fc:	01e98733          	add	a4,s3,t5
    c700:	013739b3          	sltu	s3,a4,s3
    c704:	00070493          	mv	s1,a4
    c708:	011989b3          	add	s3,s3,a7
    c70c:	00030913          	mv	s2,t1
    c710:	e25ff06f          	j	c534 <__adddf3+0x2bc>
    c714:	02081063          	bnez	a6,c734 <__adddf3+0x4bc>
    c718:	00351613          	sll	a2,a0,0x3
    c71c:	00365613          	srl	a2,a2,0x3
    c720:	01d71813          	sll	a6,a4,0x1d
    c724:	00c86833          	or	a6,a6,a2
    c728:	00375713          	srl	a4,a4,0x3
    c72c:	01076733          	or	a4,a4,a6
    c730:	18070663          	beqz	a4,c8bc <__adddf3+0x644>
    c734:	00000e13          	li	t3,0
    c738:	7ff00793          	li	a5,2047
    c73c:	00080737          	lui	a4,0x80
    c740:	00000813          	li	a6,0
    c744:	ccdff06f          	j	c410 <__adddf3+0x198>
    c748:	00351613          	sll	a2,a0,0x3
    c74c:	00365613          	srl	a2,a2,0x3
    c750:	01d71813          	sll	a6,a4,0x1d
    c754:	7ff00693          	li	a3,2047
    c758:	00c86833          	or	a6,a6,a2
    c75c:	00375713          	srl	a4,a4,0x3
    c760:	fcd786e3          	beq	a5,a3,c72c <__adddf3+0x4b4>
    c764:	00c71713          	sll	a4,a4,0xc
    c768:	00c75713          	srl	a4,a4,0xc
    c76c:	7ff7f793          	and	a5,a5,2047
    c770:	00040e13          	mv	t3,s0
    c774:	c9dff06f          	j	c410 <__adddf3+0x198>
    c778:	00190693          	add	a3,s2,1
    c77c:	7fe6f813          	and	a6,a3,2046
    c780:	14081863          	bnez	a6,c8d0 <__adddf3+0x658>
    c784:	00b766b3          	or	a3,a4,a1
    c788:	28091c63          	bnez	s2,ca20 <__adddf3+0x7a8>
    c78c:	30068263          	beqz	a3,ca90 <__adddf3+0x818>
    c790:	01e8e6b3          	or	a3,a7,t5
    c794:	22068863          	beqz	a3,c9c4 <__adddf3+0x74c>
    c798:	01e587b3          	add	a5,a1,t5
    c79c:	00b7b5b3          	sltu	a1,a5,a1
    c7a0:	01170733          	add	a4,a4,a7
    c7a4:	00b70733          	add	a4,a4,a1
    c7a8:	0037d813          	srl	a6,a5,0x3
    c7ac:	00871793          	sll	a5,a4,0x8
    c7b0:	00040e13          	mv	t3,s0
    c7b4:	3407de63          	bgez	a5,cb10 <__adddf3+0x898>
    c7b8:	ff8007b7          	lui	a5,0xff800
    c7bc:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c7c0:	00f77733          	and	a4,a4,a5
    c7c4:	01d71793          	sll	a5,a4,0x1d
    c7c8:	00375713          	srl	a4,a4,0x3
    c7cc:	0107e833          	or	a6,a5,a6
    c7d0:	01d77733          	and	a4,a4,t4
    c7d4:	00100793          	li	a5,1
    c7d8:	c39ff06f          	j	c410 <__adddf3+0x198>
    c7dc:	41e58833          	sub	a6,a1,t5
    c7e0:	0105b7b3          	sltu	a5,a1,a6
    c7e4:	411709b3          	sub	s3,a4,a7
    c7e8:	40f989b3          	sub	s3,s3,a5
    c7ec:	00899793          	sll	a5,s3,0x8
    c7f0:	00080493          	mv	s1,a6
    c7f4:	1007c663          	bltz	a5,c900 <__adddf3+0x688>
    c7f8:	01386833          	or	a6,a6,s3
    c7fc:	b4081ee3          	bnez	a6,c358 <__adddf3+0xe0>
    c800:	00000e13          	li	t3,0
    c804:	00000793          	li	a5,0
    c808:	00000713          	li	a4,0
    c80c:	c05ff06f          	j	c410 <__adddf3+0x198>
    c810:	7ff00513          	li	a0,2047
    c814:	1aa30e63          	beq	t1,a0,c9d0 <__adddf3+0x758>
    c818:	03800513          	li	a0,56
    c81c:	00100613          	li	a2,1
    c820:	c8f544e3          	blt	a0,a5,c4a8 <__adddf3+0x230>
    c824:	00800637          	lui	a2,0x800
    c828:	00c76733          	or	a4,a4,a2
    c82c:	c4dff06f          	j	c478 <__adddf3+0x200>
    c830:	ff8009b7          	lui	s3,0xff800
    c834:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c838:	40f90933          	sub	s2,s2,a5
    c83c:	013779b3          	and	s3,a4,s3
    c840:	b71ff06f          	j	c3b0 <__adddf3+0x138>
    c844:	fe078693          	add	a3,a5,-32
    c848:	02000613          	li	a2,32
    c84c:	00d8d6b3          	srl	a3,a7,a3
    c850:	00c78a63          	beq	a5,a2,c864 <__adddf3+0x5ec>
    c854:	04000613          	li	a2,64
    c858:	40f607b3          	sub	a5,a2,a5
    c85c:	00f897b3          	sll	a5,a7,a5
    c860:	00ff6f33          	or	t5,t5,a5
    c864:	01e03633          	snez	a2,t5
    c868:	00d66633          	or	a2,a2,a3
    c86c:	ac9ff06f          	j	c334 <__adddf3+0xbc>
    c870:	ff8006b7          	lui	a3,0xff800
    c874:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c878:	40f907b3          	sub	a5,s2,a5
    c87c:	00d77733          	and	a4,a4,a3
    c880:	01d71813          	sll	a6,a4,0x1d
    c884:	01386833          	or	a6,a6,s3
    c888:	00375713          	srl	a4,a4,0x3
    c88c:	ed9ff06f          	j	c764 <__adddf3+0x4ec>
    c890:	00b766b3          	or	a3,a4,a1
    c894:	1e068663          	beqz	a3,ca80 <__adddf3+0x808>
    c898:	fff78693          	add	a3,a5,-1
    c89c:	0a068e63          	beqz	a3,c958 <__adddf3+0x6e0>
    c8a0:	7ff00513          	li	a0,2047
    c8a4:	14a78063          	beq	a5,a0,c9e4 <__adddf3+0x76c>
    c8a8:	03800793          	li	a5,56
    c8ac:	00100993          	li	s3,1
    c8b0:	e4d7c6e3          	blt	a5,a3,c6fc <__adddf3+0x484>
    c8b4:	00068793          	mv	a5,a3
    c8b8:	e15ff06f          	j	c6cc <__adddf3+0x454>
    c8bc:	00040e13          	mv	t3,s0
    c8c0:	7ff00793          	li	a5,2047
    c8c4:	00000713          	li	a4,0
    c8c8:	00000813          	li	a6,0
    c8cc:	b45ff06f          	j	c410 <__adddf3+0x198>
    c8d0:	7ff00793          	li	a5,2047
    c8d4:	fef684e3          	beq	a3,a5,c8bc <__adddf3+0x644>
    c8d8:	01e58f33          	add	t5,a1,t5
    c8dc:	00bf35b3          	sltu	a1,t5,a1
    c8e0:	011707b3          	add	a5,a4,a7
    c8e4:	00b787b3          	add	a5,a5,a1
    c8e8:	01f79613          	sll	a2,a5,0x1f
    c8ec:	001f5f13          	srl	t5,t5,0x1
    c8f0:	01e664b3          	or	s1,a2,t5
    c8f4:	0017d993          	srl	s3,a5,0x1
    c8f8:	00068913          	mv	s2,a3
    c8fc:	ab5ff06f          	j	c3b0 <__adddf3+0x138>
    c900:	40bf0633          	sub	a2,t5,a1
    c904:	40e887b3          	sub	a5,a7,a4
    c908:	00cf3733          	sltu	a4,t5,a2
    c90c:	00060493          	mv	s1,a2
    c910:	40e789b3          	sub	s3,a5,a4
    c914:	00068413          	mv	s0,a3
    c918:	a41ff06f          	j	c358 <__adddf3+0xe0>
    c91c:	00361613          	sll	a2,a2,0x3
    c920:	00365613          	srl	a2,a2,0x3
    c924:	00068413          	mv	s0,a3
    c928:	00088713          	mv	a4,a7
    c92c:	e25ff06f          	j	c750 <__adddf3+0x4d8>
    c930:	de0312e3          	bnez	t1,c714 <__adddf3+0x49c>
    c934:	1c080663          	beqz	a6,cb00 <__adddf3+0x888>
    c938:	0038d713          	srl	a4,a7,0x3
    c93c:	00361613          	sll	a2,a2,0x3
    c940:	01d89893          	sll	a7,a7,0x1d
    c944:	01176733          	or	a4,a4,a7
    c948:	00365613          	srl	a2,a2,0x3
    c94c:	00c76733          	or	a4,a4,a2
    c950:	00068413          	mv	s0,a3
    c954:	dddff06f          	j	c730 <__adddf3+0x4b8>
    c958:	01e58f33          	add	t5,a1,t5
    c95c:	011708b3          	add	a7,a4,a7
    c960:	00bf35b3          	sltu	a1,t5,a1
    c964:	00b889b3          	add	s3,a7,a1
    c968:	00899793          	sll	a5,s3,0x8
    c96c:	000f0493          	mv	s1,t5
    c970:	0e07d463          	bgez	a5,ca58 <__adddf3+0x7e0>
    c974:	00200913          	li	s2,2
    c978:	bd1ff06f          	j	c548 <__adddf3+0x2d0>
    c97c:	41e58f33          	sub	t5,a1,t5
    c980:	411708b3          	sub	a7,a4,a7
    c984:	01e5b5b3          	sltu	a1,a1,t5
    c988:	000f0493          	mv	s1,t5
    c98c:	40b889b3          	sub	s3,a7,a1
    c990:	00100913          	li	s2,1
    c994:	9b1ff06f          	j	c344 <__adddf3+0xcc>
    c998:	fe078693          	add	a3,a5,-32
    c99c:	02000613          	li	a2,32
    c9a0:	00d8d6b3          	srl	a3,a7,a3
    c9a4:	00c78a63          	beq	a5,a2,c9b8 <__adddf3+0x740>
    c9a8:	04000613          	li	a2,64
    c9ac:	40f607b3          	sub	a5,a2,a5
    c9b0:	00f897b3          	sll	a5,a7,a5
    c9b4:	00ff6f33          	or	t5,t5,a5
    c9b8:	01e039b3          	snez	s3,t5
    c9bc:	00d9e9b3          	or	s3,s3,a3
    c9c0:	b65ff06f          	j	c524 <__adddf3+0x2ac>
    c9c4:	00351613          	sll	a2,a0,0x3
    c9c8:	00365993          	srl	s3,a2,0x3
    c9cc:	eb5ff06f          	j	c880 <__adddf3+0x608>
    c9d0:	00361613          	sll	a2,a2,0x3
    c9d4:	00365613          	srl	a2,a2,0x3
    c9d8:	00068413          	mv	s0,a3
    c9dc:	00088713          	mv	a4,a7
    c9e0:	d41ff06f          	j	c720 <__adddf3+0x4a8>
    c9e4:	00361613          	sll	a2,a2,0x3
    c9e8:	00365613          	srl	a2,a2,0x3
    c9ec:	00088713          	mv	a4,a7
    c9f0:	d31ff06f          	j	c720 <__adddf3+0x4a8>
    c9f4:	fe078513          	add	a0,a5,-32
    c9f8:	02000613          	li	a2,32
    c9fc:	00a75533          	srl	a0,a4,a0
    ca00:	00c78a63          	beq	a5,a2,ca14 <__adddf3+0x79c>
    ca04:	04000613          	li	a2,64
    ca08:	40f607b3          	sub	a5,a2,a5
    ca0c:	00f717b3          	sll	a5,a4,a5
    ca10:	00f5e5b3          	or	a1,a1,a5
    ca14:	00b03633          	snez	a2,a1
    ca18:	00a66633          	or	a2,a2,a0
    ca1c:	a8dff06f          	j	c4a8 <__adddf3+0x230>
    ca20:	fc0682e3          	beqz	a3,c9e4 <__adddf3+0x76c>
    ca24:	01e8ef33          	or	t5,a7,t5
    ca28:	d00f16e3          	bnez	t5,c734 <__adddf3+0x4bc>
    ca2c:	cedff06f          	j	c718 <__adddf3+0x4a0>
    ca30:	dc0808e3          	beqz	a6,c800 <__adddf3+0x588>
    ca34:	00361813          	sll	a6,a2,0x3
    ca38:	01d89793          	sll	a5,a7,0x1d
    ca3c:	00385813          	srl	a6,a6,0x3
    ca40:	0038d713          	srl	a4,a7,0x3
    ca44:	00f86833          	or	a6,a6,a5
    ca48:	01d77733          	and	a4,a4,t4
    ca4c:	00068e13          	mv	t3,a3
    ca50:	00000793          	li	a5,0
    ca54:	9bdff06f          	j	c410 <__adddf3+0x198>
    ca58:	00100793          	li	a5,1
    ca5c:	c2dff06f          	j	c688 <__adddf3+0x410>
    ca60:	40bf05b3          	sub	a1,t5,a1
    ca64:	40e888b3          	sub	a7,a7,a4
    ca68:	00bf3733          	sltu	a4,t5,a1
    ca6c:	00058493          	mv	s1,a1
    ca70:	40e889b3          	sub	s3,a7,a4
    ca74:	00068413          	mv	s0,a3
    ca78:	00100913          	li	s2,1
    ca7c:	8c9ff06f          	j	c344 <__adddf3+0xcc>
    ca80:	00361613          	sll	a2,a2,0x3
    ca84:	00365613          	srl	a2,a2,0x3
    ca88:	00088713          	mv	a4,a7
    ca8c:	cc5ff06f          	j	c750 <__adddf3+0x4d8>
    ca90:	00361613          	sll	a2,a2,0x3
    ca94:	00365993          	srl	s3,a2,0x3
    ca98:	00088713          	mv	a4,a7
    ca9c:	de5ff06f          	j	c880 <__adddf3+0x608>
    caa0:	fe078693          	add	a3,a5,-32
    caa4:	02000613          	li	a2,32
    caa8:	00d756b3          	srl	a3,a4,a3
    caac:	00c78a63          	beq	a5,a2,cac0 <__adddf3+0x848>
    cab0:	04000613          	li	a2,64
    cab4:	40f607b3          	sub	a5,a2,a5
    cab8:	00f717b3          	sll	a5,a4,a5
    cabc:	00f5e5b3          	or	a1,a1,a5
    cac0:	00b039b3          	snez	s3,a1
    cac4:	00d9e9b3          	or	s3,s3,a3
    cac8:	c35ff06f          	j	c6fc <__adddf3+0x484>
    cacc:	0034d613          	srl	a2,s1,0x3
    cad0:	00090793          	mv	a5,s2
    cad4:	00098713          	mv	a4,s3
    cad8:	c79ff06f          	j	c750 <__adddf3+0x4d8>
    cadc:	02000693          	li	a3,32
    cae0:	40f686b3          	sub	a3,a3,a5
    cae4:	00000613          	li	a2,0
    cae8:	8b5ff06f          	j	c39c <__adddf3+0x124>
    caec:	00c9e833          	or	a6,s3,a2
    caf0:	d00808e3          	beqz	a6,c800 <__adddf3+0x588>
    caf4:	0039d993          	srl	s3,s3,0x3
    caf8:	00060713          	mv	a4,a2
    cafc:	d85ff06f          	j	c880 <__adddf3+0x608>
    cb00:	00000e13          	li	t3,0
    cb04:	7ff00793          	li	a5,2047
    cb08:	00080737          	lui	a4,0x80
    cb0c:	905ff06f          	j	c410 <__adddf3+0x198>
    cb10:	01d71793          	sll	a5,a4,0x1d
    cb14:	00375713          	srl	a4,a4,0x3
    cb18:	0107e833          	or	a6,a5,a6
    cb1c:	01d77733          	and	a4,a4,t4
    cb20:	00000793          	li	a5,0
    cb24:	8edff06f          	j	c410 <__adddf3+0x198>
    cb28:	01d71813          	sll	a6,a4,0x1d
    cb2c:	0035d593          	srl	a1,a1,0x3
    cb30:	00b86833          	or	a6,a6,a1
    cb34:	00375713          	srl	a4,a4,0x3
    cb38:	00068413          	mv	s0,a3
    cb3c:	c29ff06f          	j	c764 <__adddf3+0x4ec>

0000cb40 <__divdf3>:
    cb40:	fb010113          	add	sp,sp,-80
    cb44:	0145d793          	srl	a5,a1,0x14
    cb48:	04812423          	sw	s0,72(sp)
    cb4c:	04912223          	sw	s1,68(sp)
    cb50:	05212023          	sw	s2,64(sp)
    cb54:	03412c23          	sw	s4,56(sp)
    cb58:	03512a23          	sw	s5,52(sp)
    cb5c:	00c59493          	sll	s1,a1,0xc
    cb60:	04112623          	sw	ra,76(sp)
    cb64:	03312e23          	sw	s3,60(sp)
    cb68:	03612823          	sw	s6,48(sp)
    cb6c:	03712623          	sw	s7,44(sp)
    cb70:	03812423          	sw	s8,40(sp)
    cb74:	7ff7f793          	and	a5,a5,2047
    cb78:	00050413          	mv	s0,a0
    cb7c:	00060a13          	mv	s4,a2
    cb80:	00068913          	mv	s2,a3
    cb84:	00c4d493          	srl	s1,s1,0xc
    cb88:	01f5da93          	srl	s5,a1,0x1f
    cb8c:	18078c63          	beqz	a5,cd24 <__divdf3+0x1e4>
    cb90:	7ff00713          	li	a4,2047
    cb94:	08e78a63          	beq	a5,a4,cc28 <__divdf3+0xe8>
    cb98:	01d55b13          	srl	s6,a0,0x1d
    cb9c:	00349493          	sll	s1,s1,0x3
    cba0:	009b64b3          	or	s1,s6,s1
    cba4:	00800737          	lui	a4,0x800
    cba8:	00e4eb33          	or	s6,s1,a4
    cbac:	00351b93          	sll	s7,a0,0x3
    cbb0:	c0178993          	add	s3,a5,-1023
    cbb4:	00000493          	li	s1,0
    cbb8:	00000c13          	li	s8,0
    cbbc:	01495793          	srl	a5,s2,0x14
    cbc0:	00c91413          	sll	s0,s2,0xc
    cbc4:	7ff7f793          	and	a5,a5,2047
    cbc8:	00c45413          	srl	s0,s0,0xc
    cbcc:	01f95913          	srl	s2,s2,0x1f
    cbd0:	08078463          	beqz	a5,cc58 <__divdf3+0x118>
    cbd4:	7ff00713          	li	a4,2047
    cbd8:	18e78c63          	beq	a5,a4,cd70 <__divdf3+0x230>
    cbdc:	00341413          	sll	s0,s0,0x3
    cbe0:	01da5713          	srl	a4,s4,0x1d
    cbe4:	00876733          	or	a4,a4,s0
    cbe8:	c0178793          	add	a5,a5,-1023
    cbec:	00800437          	lui	s0,0x800
    cbf0:	40f989b3          	sub	s3,s3,a5
    cbf4:	00876433          	or	s0,a4,s0
    cbf8:	003a1813          	sll	a6,s4,0x3
    cbfc:	00000793          	li	a5,0
    cc00:	00f00713          	li	a4,15
    cc04:	012aca33          	xor	s4,s5,s2
    cc08:	24976663          	bltu	a4,s1,ce54 <__divdf3+0x314>
    cc0c:	00003697          	auipc	a3,0x3
    cc10:	c6c68693          	add	a3,a3,-916 # f878 <__mprec_tens+0xc8>
    cc14:	00249493          	sll	s1,s1,0x2
    cc18:	00d484b3          	add	s1,s1,a3
    cc1c:	0004a703          	lw	a4,0(s1)
    cc20:	00d70733          	add	a4,a4,a3
    cc24:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    cc28:	00a4eb33          	or	s6,s1,a0
    cc2c:	1c0b1e63          	bnez	s6,ce08 <__divdf3+0x2c8>
    cc30:	01495793          	srl	a5,s2,0x14
    cc34:	00c91413          	sll	s0,s2,0xc
    cc38:	7ff7f793          	and	a5,a5,2047
    cc3c:	00000b93          	li	s7,0
    cc40:	00800493          	li	s1,8
    cc44:	7ff00993          	li	s3,2047
    cc48:	00200c13          	li	s8,2
    cc4c:	00c45413          	srl	s0,s0,0xc
    cc50:	01f95913          	srl	s2,s2,0x1f
    cc54:	f80790e3          	bnez	a5,cbd4 <__divdf3+0x94>
    cc58:	01446833          	or	a6,s0,s4
    cc5c:	1c080263          	beqz	a6,ce20 <__divdf3+0x2e0>
    cc60:	5c040663          	beqz	s0,d22c <__divdf3+0x6ec>
    cc64:	00040513          	mv	a0,s0
    cc68:	250020ef          	jal	eeb8 <__clzsi2>
    cc6c:	00050793          	mv	a5,a0
    cc70:	ff550693          	add	a3,a0,-11
    cc74:	01d00713          	li	a4,29
    cc78:	ff878813          	add	a6,a5,-8
    cc7c:	40d70733          	sub	a4,a4,a3
    cc80:	01041433          	sll	s0,s0,a6
    cc84:	00ea5733          	srl	a4,s4,a4
    cc88:	00876433          	or	s0,a4,s0
    cc8c:	010a1833          	sll	a6,s4,a6
    cc90:	013787b3          	add	a5,a5,s3
    cc94:	3f378993          	add	s3,a5,1011
    cc98:	00000793          	li	a5,0
    cc9c:	f65ff06f          	j	cc00 <__divdf3+0xc0>
    cca0:	40f70733          	sub	a4,a4,a5
    cca4:	03800693          	li	a3,56
    cca8:	60e6d063          	bge	a3,a4,d2a8 <__divdf3+0x768>
    ccac:	00000793          	li	a5,0
    ccb0:	00000693          	li	a3,0
    ccb4:	00000713          	li	a4,0
    ccb8:	04c12083          	lw	ra,76(sp)
    ccbc:	04812403          	lw	s0,72(sp)
    ccc0:	01479793          	sll	a5,a5,0x14
    ccc4:	00d7e7b3          	or	a5,a5,a3
    ccc8:	01fa1693          	sll	a3,s4,0x1f
    cccc:	00d7e7b3          	or	a5,a5,a3
    ccd0:	04412483          	lw	s1,68(sp)
    ccd4:	04012903          	lw	s2,64(sp)
    ccd8:	03c12983          	lw	s3,60(sp)
    ccdc:	03812a03          	lw	s4,56(sp)
    cce0:	03412a83          	lw	s5,52(sp)
    cce4:	03012b03          	lw	s6,48(sp)
    cce8:	02c12b83          	lw	s7,44(sp)
    ccec:	02812c03          	lw	s8,40(sp)
    ccf0:	00070513          	mv	a0,a4
    ccf4:	00078593          	mv	a1,a5
    ccf8:	05010113          	add	sp,sp,80
    ccfc:	00008067          	ret
    cd00:	7ff00793          	li	a5,2047
    cd04:	00000693          	li	a3,0
    cd08:	00000713          	li	a4,0
    cd0c:	fadff06f          	j	ccb8 <__divdf3+0x178>
    cd10:	00000a13          	li	s4,0
    cd14:	7ff00793          	li	a5,2047
    cd18:	000806b7          	lui	a3,0x80
    cd1c:	00000713          	li	a4,0
    cd20:	f99ff06f          	j	ccb8 <__divdf3+0x178>
    cd24:	00a4eb33          	or	s6,s1,a0
    cd28:	100b0c63          	beqz	s6,ce40 <__divdf3+0x300>
    cd2c:	52048463          	beqz	s1,d254 <__divdf3+0x714>
    cd30:	00048513          	mv	a0,s1
    cd34:	184020ef          	jal	eeb8 <__clzsi2>
    cd38:	00050713          	mv	a4,a0
    cd3c:	ff550793          	add	a5,a0,-11
    cd40:	01d00b13          	li	s6,29
    cd44:	ff870b93          	add	s7,a4,-8
    cd48:	40fb0b33          	sub	s6,s6,a5
    cd4c:	017494b3          	sll	s1,s1,s7
    cd50:	01645b33          	srl	s6,s0,s6
    cd54:	009b6b33          	or	s6,s6,s1
    cd58:	01741bb3          	sll	s7,s0,s7
    cd5c:	c0d00793          	li	a5,-1011
    cd60:	40e789b3          	sub	s3,a5,a4
    cd64:	00000493          	li	s1,0
    cd68:	00000c13          	li	s8,0
    cd6c:	e51ff06f          	j	cbbc <__divdf3+0x7c>
    cd70:	01446833          	or	a6,s0,s4
    cd74:	80198993          	add	s3,s3,-2047
    cd78:	0a081c63          	bnez	a6,ce30 <__divdf3+0x2f0>
    cd7c:	0024e493          	or	s1,s1,2
    cd80:	00000413          	li	s0,0
    cd84:	00200793          	li	a5,2
    cd88:	e79ff06f          	j	cc00 <__divdf3+0xc0>
    cd8c:	000a8913          	mv	s2,s5
    cd90:	000b0413          	mv	s0,s6
    cd94:	000b8813          	mv	a6,s7
    cd98:	00200793          	li	a5,2
    cd9c:	60fc0863          	beq	s8,a5,d3ac <__divdf3+0x86c>
    cda0:	00300793          	li	a5,3
    cda4:	f6fc06e3          	beq	s8,a5,cd10 <__divdf3+0x1d0>
    cda8:	00100793          	li	a5,1
    cdac:	00090a13          	mv	s4,s2
    cdb0:	eefc0ee3          	beq	s8,a5,ccac <__divdf3+0x16c>
    cdb4:	3ff98793          	add	a5,s3,1023
    cdb8:	3cf05263          	blez	a5,d17c <__divdf3+0x63c>
    cdbc:	00787713          	and	a4,a6,7
    cdc0:	5c071663          	bnez	a4,d38c <__divdf3+0x84c>
    cdc4:	00741713          	sll	a4,s0,0x7
    cdc8:	00075a63          	bgez	a4,cddc <__divdf3+0x29c>
    cdcc:	ff0007b7          	lui	a5,0xff000
    cdd0:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cdd4:	00f47433          	and	s0,s0,a5
    cdd8:	40098793          	add	a5,s3,1024
    cddc:	7fe00713          	li	a4,2046
    cde0:	f2f740e3          	blt	a4,a5,cd00 <__divdf3+0x1c0>
    cde4:	00385813          	srl	a6,a6,0x3
    cde8:	01d41713          	sll	a4,s0,0x1d
    cdec:	00941693          	sll	a3,s0,0x9
    cdf0:	01076733          	or	a4,a4,a6
    cdf4:	00c6d693          	srl	a3,a3,0xc
    cdf8:	7ff7f793          	and	a5,a5,2047
    cdfc:	ebdff06f          	j	ccb8 <__divdf3+0x178>
    ce00:	00078c13          	mv	s8,a5
    ce04:	f95ff06f          	j	cd98 <__divdf3+0x258>
    ce08:	00048b13          	mv	s6,s1
    ce0c:	00050b93          	mv	s7,a0
    ce10:	00c00493          	li	s1,12
    ce14:	7ff00993          	li	s3,2047
    ce18:	00300c13          	li	s8,3
    ce1c:	da1ff06f          	j	cbbc <__divdf3+0x7c>
    ce20:	0014e493          	or	s1,s1,1
    ce24:	00000413          	li	s0,0
    ce28:	00100793          	li	a5,1
    ce2c:	dd5ff06f          	j	cc00 <__divdf3+0xc0>
    ce30:	0034e493          	or	s1,s1,3
    ce34:	000a0813          	mv	a6,s4
    ce38:	00300793          	li	a5,3
    ce3c:	dc5ff06f          	j	cc00 <__divdf3+0xc0>
    ce40:	00000b93          	li	s7,0
    ce44:	00400493          	li	s1,4
    ce48:	00000993          	li	s3,0
    ce4c:	00100c13          	li	s8,1
    ce50:	d6dff06f          	j	cbbc <__divdf3+0x7c>
    ce54:	03912223          	sw	s9,36(sp)
    ce58:	03a12023          	sw	s10,32(sp)
    ce5c:	01b12e23          	sw	s11,28(sp)
    ce60:	3b646a63          	bltu	s0,s6,d214 <__divdf3+0x6d4>
    ce64:	3a8b0663          	beq	s6,s0,d210 <__divdf3+0x6d0>
    ce68:	fff98993          	add	s3,s3,-1
    ce6c:	000b8c13          	mv	s8,s7
    ce70:	000b0493          	mv	s1,s6
    ce74:	00000d13          	li	s10,0
    ce78:	01885c93          	srl	s9,a6,0x18
    ce7c:	00841413          	sll	s0,s0,0x8
    ce80:	01045913          	srl	s2,s0,0x10
    ce84:	008cecb3          	or	s9,s9,s0
    ce88:	00090593          	mv	a1,s2
    ce8c:	00048513          	mv	a0,s1
    ce90:	010c9b13          	sll	s6,s9,0x10
    ce94:	00881a93          	sll	s5,a6,0x8
    ce98:	010b5b13          	srl	s6,s6,0x10
    ce9c:	771010ef          	jal	ee0c <__hidden___udivsi3>
    cea0:	00050593          	mv	a1,a0
    cea4:	00050413          	mv	s0,a0
    cea8:	000b0513          	mv	a0,s6
    ceac:	69d010ef          	jal	ed48 <__mulsi3>
    ceb0:	00050793          	mv	a5,a0
    ceb4:	00090593          	mv	a1,s2
    ceb8:	00048513          	mv	a0,s1
    cebc:	00078493          	mv	s1,a5
    cec0:	795010ef          	jal	ee54 <__umodsi3>
    cec4:	01051513          	sll	a0,a0,0x10
    cec8:	010c5793          	srl	a5,s8,0x10
    cecc:	00a7e7b3          	or	a5,a5,a0
    ced0:	0097fa63          	bgeu	a5,s1,cee4 <__divdf3+0x3a4>
    ced4:	00fc87b3          	add	a5,s9,a5
    ced8:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    cedc:	3b97fe63          	bgeu	a5,s9,d298 <__divdf3+0x758>
    cee0:	00070413          	mv	s0,a4
    cee4:	409784b3          	sub	s1,a5,s1
    cee8:	00090593          	mv	a1,s2
    ceec:	00048513          	mv	a0,s1
    cef0:	71d010ef          	jal	ee0c <__hidden___udivsi3>
    cef4:	00050593          	mv	a1,a0
    cef8:	00050b93          	mv	s7,a0
    cefc:	000b0513          	mv	a0,s6
    cf00:	649010ef          	jal	ed48 <__mulsi3>
    cf04:	00050793          	mv	a5,a0
    cf08:	00090593          	mv	a1,s2
    cf0c:	00048513          	mv	a0,s1
    cf10:	00078493          	mv	s1,a5
    cf14:	741010ef          	jal	ee54 <__umodsi3>
    cf18:	010c1793          	sll	a5,s8,0x10
    cf1c:	01051513          	sll	a0,a0,0x10
    cf20:	0107d793          	srl	a5,a5,0x10
    cf24:	00a7e7b3          	or	a5,a5,a0
    cf28:	0097fa63          	bgeu	a5,s1,cf3c <__divdf3+0x3fc>
    cf2c:	00fc87b3          	add	a5,s9,a5
    cf30:	fffb8713          	add	a4,s7,-1
    cf34:	3597fa63          	bgeu	a5,s9,d288 <__divdf3+0x748>
    cf38:	00070b93          	mv	s7,a4
    cf3c:	00010337          	lui	t1,0x10
    cf40:	01041413          	sll	s0,s0,0x10
    cf44:	01746433          	or	s0,s0,s7
    cf48:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    cf4c:	01b478b3          	and	a7,s0,s11
    cf50:	01bafdb3          	and	s11,s5,s11
    cf54:	40978bb3          	sub	s7,a5,s1
    cf58:	010adc13          	srl	s8,s5,0x10
    cf5c:	01045793          	srl	a5,s0,0x10
    cf60:	00088513          	mv	a0,a7
    cf64:	000d8593          	mv	a1,s11
    cf68:	5e1010ef          	jal	ed48 <__mulsi3>
    cf6c:	00050813          	mv	a6,a0
    cf70:	000c0593          	mv	a1,s8
    cf74:	00088513          	mv	a0,a7
    cf78:	5d1010ef          	jal	ed48 <__mulsi3>
    cf7c:	00050893          	mv	a7,a0
    cf80:	000d8593          	mv	a1,s11
    cf84:	00078513          	mv	a0,a5
    cf88:	5c1010ef          	jal	ed48 <__mulsi3>
    cf8c:	00050e13          	mv	t3,a0
    cf90:	000c0593          	mv	a1,s8
    cf94:	00078513          	mv	a0,a5
    cf98:	5b1010ef          	jal	ed48 <__mulsi3>
    cf9c:	01085793          	srl	a5,a6,0x10
    cfa0:	01c888b3          	add	a7,a7,t3
    cfa4:	011787b3          	add	a5,a5,a7
    cfa8:	01c7f463          	bgeu	a5,t3,cfb0 <__divdf3+0x470>
    cfac:	00650533          	add	a0,a0,t1
    cfb0:	00010637          	lui	a2,0x10
    cfb4:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    cfb8:	00c7f4b3          	and	s1,a5,a2
    cfbc:	0107d693          	srl	a3,a5,0x10
    cfc0:	01049493          	sll	s1,s1,0x10
    cfc4:	00c87833          	and	a6,a6,a2
    cfc8:	00a687b3          	add	a5,a3,a0
    cfcc:	010484b3          	add	s1,s1,a6
    cfd0:	20fbea63          	bltu	s7,a5,d1e4 <__divdf3+0x6a4>
    cfd4:	20fb8663          	beq	s7,a5,d1e0 <__divdf3+0x6a0>
    cfd8:	409d04b3          	sub	s1,s10,s1
    cfdc:	40fb8bb3          	sub	s7,s7,a5
    cfe0:	009d3d33          	sltu	s10,s10,s1
    cfe4:	41ab8bb3          	sub	s7,s7,s10
    cfe8:	377c8a63          	beq	s9,s7,d35c <__divdf3+0x81c>
    cfec:	00090593          	mv	a1,s2
    cff0:	000b8513          	mv	a0,s7
    cff4:	619010ef          	jal	ee0c <__hidden___udivsi3>
    cff8:	00050593          	mv	a1,a0
    cffc:	00a12623          	sw	a0,12(sp)
    d000:	00050d13          	mv	s10,a0
    d004:	000b0513          	mv	a0,s6
    d008:	541010ef          	jal	ed48 <__mulsi3>
    d00c:	00050793          	mv	a5,a0
    d010:	00090593          	mv	a1,s2
    d014:	000b8513          	mv	a0,s7
    d018:	00078b93          	mv	s7,a5
    d01c:	639010ef          	jal	ee54 <__umodsi3>
    d020:	01051513          	sll	a0,a0,0x10
    d024:	0104d793          	srl	a5,s1,0x10
    d028:	00a7e7b3          	or	a5,a5,a0
    d02c:	0377f063          	bgeu	a5,s7,d04c <__divdf3+0x50c>
    d030:	00fc87b3          	add	a5,s9,a5
    d034:	fffd0693          	add	a3,s10,-1
    d038:	3797e263          	bltu	a5,s9,d39c <__divdf3+0x85c>
    d03c:	3777f063          	bgeu	a5,s7,d39c <__divdf3+0x85c>
    d040:	ffed0713          	add	a4,s10,-2
    d044:	00e12623          	sw	a4,12(sp)
    d048:	019787b3          	add	a5,a5,s9
    d04c:	41778bb3          	sub	s7,a5,s7
    d050:	00090593          	mv	a1,s2
    d054:	000b8513          	mv	a0,s7
    d058:	5b5010ef          	jal	ee0c <__hidden___udivsi3>
    d05c:	00050593          	mv	a1,a0
    d060:	00050d13          	mv	s10,a0
    d064:	000b0513          	mv	a0,s6
    d068:	4e1010ef          	jal	ed48 <__mulsi3>
    d06c:	00050793          	mv	a5,a0
    d070:	00090593          	mv	a1,s2
    d074:	000b8513          	mv	a0,s7
    d078:	00078913          	mv	s2,a5
    d07c:	01049493          	sll	s1,s1,0x10
    d080:	5d5010ef          	jal	ee54 <__umodsi3>
    d084:	01051513          	sll	a0,a0,0x10
    d088:	0104d493          	srl	s1,s1,0x10
    d08c:	00a4e4b3          	or	s1,s1,a0
    d090:	0124fe63          	bgeu	s1,s2,d0ac <__divdf3+0x56c>
    d094:	009c84b3          	add	s1,s9,s1
    d098:	fffd0793          	add	a5,s10,-1
    d09c:	3194e463          	bltu	s1,s9,d3a4 <__divdf3+0x864>
    d0a0:	3124f263          	bgeu	s1,s2,d3a4 <__divdf3+0x864>
    d0a4:	ffed0d13          	add	s10,s10,-2
    d0a8:	019484b3          	add	s1,s1,s9
    d0ac:	00c12783          	lw	a5,12(sp)
    d0b0:	412484b3          	sub	s1,s1,s2
    d0b4:	000d8593          	mv	a1,s11
    d0b8:	01079813          	sll	a6,a5,0x10
    d0bc:	01a86833          	or	a6,a6,s10
    d0c0:	01081313          	sll	t1,a6,0x10
    d0c4:	01035313          	srl	t1,t1,0x10
    d0c8:	01085793          	srl	a5,a6,0x10
    d0cc:	00030513          	mv	a0,t1
    d0d0:	479010ef          	jal	ed48 <__mulsi3>
    d0d4:	00050893          	mv	a7,a0
    d0d8:	000c0593          	mv	a1,s8
    d0dc:	00030513          	mv	a0,t1
    d0e0:	469010ef          	jal	ed48 <__mulsi3>
    d0e4:	00050313          	mv	t1,a0
    d0e8:	000d8593          	mv	a1,s11
    d0ec:	00078513          	mv	a0,a5
    d0f0:	459010ef          	jal	ed48 <__mulsi3>
    d0f4:	00050e13          	mv	t3,a0
    d0f8:	000c0593          	mv	a1,s8
    d0fc:	00078513          	mv	a0,a5
    d100:	449010ef          	jal	ed48 <__mulsi3>
    d104:	0108d793          	srl	a5,a7,0x10
    d108:	01c30333          	add	t1,t1,t3
    d10c:	006787b3          	add	a5,a5,t1
    d110:	01c7f663          	bgeu	a5,t3,d11c <__divdf3+0x5dc>
    d114:	00010737          	lui	a4,0x10
    d118:	00e50533          	add	a0,a0,a4
    d11c:	000106b7          	lui	a3,0x10
    d120:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    d124:	0107d713          	srl	a4,a5,0x10
    d128:	00d7f7b3          	and	a5,a5,a3
    d12c:	01079793          	sll	a5,a5,0x10
    d130:	00d8f8b3          	and	a7,a7,a3
    d134:	00a70733          	add	a4,a4,a0
    d138:	011787b3          	add	a5,a5,a7
    d13c:	02e4e063          	bltu	s1,a4,d15c <__divdf3+0x61c>
    d140:	00e48c63          	beq	s1,a4,d158 <__divdf3+0x618>
    d144:	02412c83          	lw	s9,36(sp)
    d148:	02012d03          	lw	s10,32(sp)
    d14c:	01c12d83          	lw	s11,28(sp)
    d150:	00186813          	or	a6,a6,1
    d154:	c61ff06f          	j	cdb4 <__divdf3+0x274>
    d158:	1c078a63          	beqz	a5,d32c <__divdf3+0x7ec>
    d15c:	009c84b3          	add	s1,s9,s1
    d160:	fff80613          	add	a2,a6,-1
    d164:	00048693          	mv	a3,s1
    d168:	1b94ec63          	bltu	s1,s9,d320 <__divdf3+0x7e0>
    d16c:	24e4ea63          	bltu	s1,a4,d3c0 <__divdf3+0x880>
    d170:	26e48863          	beq	s1,a4,d3e0 <__divdf3+0x8a0>
    d174:	00060813          	mv	a6,a2
    d178:	fcdff06f          	j	d144 <__divdf3+0x604>
    d17c:	00100713          	li	a4,1
    d180:	b20790e3          	bnez	a5,cca0 <__divdf3+0x160>
    d184:	41e98793          	add	a5,s3,1054
    d188:	00f816b3          	sll	a3,a6,a5
    d18c:	00d036b3          	snez	a3,a3
    d190:	00f417b3          	sll	a5,s0,a5
    d194:	00f6e7b3          	or	a5,a3,a5
    d198:	00e85833          	srl	a6,a6,a4
    d19c:	00f86833          	or	a6,a6,a5
    d1a0:	00787793          	and	a5,a6,7
    d1a4:	00e45433          	srl	s0,s0,a4
    d1a8:	02078063          	beqz	a5,d1c8 <__divdf3+0x688>
    d1ac:	00f87793          	and	a5,a6,15
    d1b0:	00400713          	li	a4,4
    d1b4:	00e78a63          	beq	a5,a4,d1c8 <__divdf3+0x688>
    d1b8:	00480793          	add	a5,a6,4
    d1bc:	0107b833          	sltu	a6,a5,a6
    d1c0:	01040433          	add	s0,s0,a6
    d1c4:	00078813          	mv	a6,a5
    d1c8:	00841613          	sll	a2,s0,0x8
    d1cc:	00100793          	li	a5,1
    d1d0:	00000693          	li	a3,0
    d1d4:	00000713          	li	a4,0
    d1d8:	ae0640e3          	bltz	a2,ccb8 <__divdf3+0x178>
    d1dc:	1280006f          	j	d304 <__divdf3+0x7c4>
    d1e0:	de9d7ce3          	bgeu	s10,s1,cfd8 <__divdf3+0x498>
    d1e4:	015d06b3          	add	a3,s10,s5
    d1e8:	01a6b633          	sltu	a2,a3,s10
    d1ec:	019605b3          	add	a1,a2,s9
    d1f0:	00bb8bb3          	add	s7,s7,a1
    d1f4:	00068d13          	mv	s10,a3
    d1f8:	fff40593          	add	a1,s0,-1
    d1fc:	077cfe63          	bgeu	s9,s7,d278 <__divdf3+0x738>
    d200:	14fbe063          	bltu	s7,a5,d340 <__divdf3+0x800>
    d204:	13778c63          	beq	a5,s7,d33c <__divdf3+0x7fc>
    d208:	00058413          	mv	s0,a1
    d20c:	dcdff06f          	j	cfd8 <__divdf3+0x498>
    d210:	c50bece3          	bltu	s7,a6,ce68 <__divdf3+0x328>
    d214:	01fb1c13          	sll	s8,s6,0x1f
    d218:	001bd713          	srl	a4,s7,0x1
    d21c:	001b5493          	srl	s1,s6,0x1
    d220:	00ec6c33          	or	s8,s8,a4
    d224:	01fb9d13          	sll	s10,s7,0x1f
    d228:	c51ff06f          	j	ce78 <__divdf3+0x338>
    d22c:	000a0513          	mv	a0,s4
    d230:	489010ef          	jal	eeb8 <__clzsi2>
    d234:	01550693          	add	a3,a0,21
    d238:	01c00713          	li	a4,28
    d23c:	02050793          	add	a5,a0,32
    d240:	a2d75ae3          	bge	a4,a3,cc74 <__divdf3+0x134>
    d244:	ff850513          	add	a0,a0,-8
    d248:	00000813          	li	a6,0
    d24c:	00aa1433          	sll	s0,s4,a0
    d250:	a41ff06f          	j	cc90 <__divdf3+0x150>
    d254:	465010ef          	jal	eeb8 <__clzsi2>
    d258:	01550793          	add	a5,a0,21
    d25c:	01c00693          	li	a3,28
    d260:	02050713          	add	a4,a0,32
    d264:	acf6dee3          	bge	a3,a5,cd40 <__divdf3+0x200>
    d268:	ff850493          	add	s1,a0,-8
    d26c:	00941b33          	sll	s6,s0,s1
    d270:	00000b93          	li	s7,0
    d274:	ae9ff06f          	j	cd5c <__divdf3+0x21c>
    d278:	f97c98e3          	bne	s9,s7,d208 <__divdf3+0x6c8>
    d27c:	f80602e3          	beqz	a2,d200 <__divdf3+0x6c0>
    d280:	00058413          	mv	s0,a1
    d284:	d55ff06f          	j	cfd8 <__divdf3+0x498>
    d288:	ca97f8e3          	bgeu	a5,s1,cf38 <__divdf3+0x3f8>
    d28c:	ffeb8b93          	add	s7,s7,-2
    d290:	019787b3          	add	a5,a5,s9
    d294:	ca9ff06f          	j	cf3c <__divdf3+0x3fc>
    d298:	c497f4e3          	bgeu	a5,s1,cee0 <__divdf3+0x3a0>
    d29c:	ffe40413          	add	s0,s0,-2
    d2a0:	019787b3          	add	a5,a5,s9
    d2a4:	c41ff06f          	j	cee4 <__divdf3+0x3a4>
    d2a8:	01f00693          	li	a3,31
    d2ac:	ece6dce3          	bge	a3,a4,d184 <__divdf3+0x644>
    d2b0:	fe100693          	li	a3,-31
    d2b4:	40f686b3          	sub	a3,a3,a5
    d2b8:	02000793          	li	a5,32
    d2bc:	00d456b3          	srl	a3,s0,a3
    d2c0:	00f70863          	beq	a4,a5,d2d0 <__divdf3+0x790>
    d2c4:	43e98793          	add	a5,s3,1086
    d2c8:	00f417b3          	sll	a5,s0,a5
    d2cc:	00f86833          	or	a6,a6,a5
    d2d0:	01003833          	snez	a6,a6
    d2d4:	00d86833          	or	a6,a6,a3
    d2d8:	00787713          	and	a4,a6,7
    d2dc:	00000693          	li	a3,0
    d2e0:	02070863          	beqz	a4,d310 <__divdf3+0x7d0>
    d2e4:	00f87793          	and	a5,a6,15
    d2e8:	00400713          	li	a4,4
    d2ec:	00000413          	li	s0,0
    d2f0:	00e78a63          	beq	a5,a4,d304 <__divdf3+0x7c4>
    d2f4:	00480793          	add	a5,a6,4
    d2f8:	0107b833          	sltu	a6,a5,a6
    d2fc:	01003433          	snez	s0,a6
    d300:	00078813          	mv	a6,a5
    d304:	00941693          	sll	a3,s0,0x9
    d308:	01d41713          	sll	a4,s0,0x1d
    d30c:	00c6d693          	srl	a3,a3,0xc
    d310:	00385813          	srl	a6,a6,0x3
    d314:	00e86733          	or	a4,a6,a4
    d318:	00000793          	li	a5,0
    d31c:	99dff06f          	j	ccb8 <__divdf3+0x178>
    d320:	00060813          	mv	a6,a2
    d324:	e2e690e3          	bne	a3,a4,d144 <__divdf3+0x604>
    d328:	e1579ee3          	bne	a5,s5,d144 <__divdf3+0x604>
    d32c:	02412c83          	lw	s9,36(sp)
    d330:	02012d03          	lw	s10,32(sp)
    d334:	01c12d83          	lw	s11,28(sp)
    d338:	a7dff06f          	j	cdb4 <__divdf3+0x274>
    d33c:	ec96f6e3          	bgeu	a3,s1,d208 <__divdf3+0x6c8>
    d340:	00da86b3          	add	a3,s5,a3
    d344:	0156b633          	sltu	a2,a3,s5
    d348:	01960633          	add	a2,a2,s9
    d34c:	ffe40413          	add	s0,s0,-2
    d350:	00068d13          	mv	s10,a3
    d354:	00cb8bb3          	add	s7,s7,a2
    d358:	c81ff06f          	j	cfd8 <__divdf3+0x498>
    d35c:	c0200713          	li	a4,-1022
    d360:	02412c83          	lw	s9,36(sp)
    d364:	02012d03          	lw	s10,32(sp)
    d368:	01c12d83          	lw	s11,28(sp)
    d36c:	3ff98793          	add	a5,s3,1023
    d370:	fff00813          	li	a6,-1
    d374:	e0e9c4e3          	blt	s3,a4,d17c <__divdf3+0x63c>
    d378:	00480713          	add	a4,a6,4
    d37c:	01073833          	sltu	a6,a4,a6
    d380:	01040433          	add	s0,s0,a6
    d384:	00070813          	mv	a6,a4
    d388:	a3dff06f          	j	cdc4 <__divdf3+0x284>
    d38c:	00f87713          	and	a4,a6,15
    d390:	00400693          	li	a3,4
    d394:	a2d708e3          	beq	a4,a3,cdc4 <__divdf3+0x284>
    d398:	fe1ff06f          	j	d378 <__divdf3+0x838>
    d39c:	00d12623          	sw	a3,12(sp)
    d3a0:	cadff06f          	j	d04c <__divdf3+0x50c>
    d3a4:	00078d13          	mv	s10,a5
    d3a8:	d05ff06f          	j	d0ac <__divdf3+0x56c>
    d3ac:	00090a13          	mv	s4,s2
    d3b0:	7ff00793          	li	a5,2047
    d3b4:	00000693          	li	a3,0
    d3b8:	00000713          	li	a4,0
    d3bc:	8fdff06f          	j	ccb8 <__divdf3+0x178>
    d3c0:	001a9613          	sll	a2,s5,0x1
    d3c4:	015636b3          	sltu	a3,a2,s5
    d3c8:	019686b3          	add	a3,a3,s9
    d3cc:	00d486b3          	add	a3,s1,a3
    d3d0:	ffe80813          	add	a6,a6,-2
    d3d4:	00060a93          	mv	s5,a2
    d3d8:	f4e688e3          	beq	a3,a4,d328 <__divdf3+0x7e8>
    d3dc:	d69ff06f          	j	d144 <__divdf3+0x604>
    d3e0:	fefae0e3          	bltu	s5,a5,d3c0 <__divdf3+0x880>
    d3e4:	00060813          	mv	a6,a2
    d3e8:	f41ff06f          	j	d328 <__divdf3+0x7e8>

0000d3ec <__eqdf2>:
    d3ec:	0145d713          	srl	a4,a1,0x14
    d3f0:	001007b7          	lui	a5,0x100
    d3f4:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d3f8:	0146d813          	srl	a6,a3,0x14
    d3fc:	7ff77713          	and	a4,a4,2047
    d400:	7ff00313          	li	t1,2047
    d404:	00b7fe33          	and	t3,a5,a1
    d408:	00050893          	mv	a7,a0
    d40c:	00d7f7b3          	and	a5,a5,a3
    d410:	01f5d593          	srl	a1,a1,0x1f
    d414:	7ff87813          	and	a6,a6,2047
    d418:	01f6d693          	srl	a3,a3,0x1f
    d41c:	00100513          	li	a0,1
    d420:	00670c63          	beq	a4,t1,d438 <__eqdf2+0x4c>
    d424:	00680863          	beq	a6,t1,d434 <__eqdf2+0x48>
    d428:	01071463          	bne	a4,a6,d430 <__eqdf2+0x44>
    d42c:	02fe0663          	beq	t3,a5,d458 <__eqdf2+0x6c>
    d430:	00008067          	ret
    d434:	00008067          	ret
    d438:	fee81ce3          	bne	a6,a4,d430 <__eqdf2+0x44>
    d43c:	00fe67b3          	or	a5,t3,a5
    d440:	00c7e7b3          	or	a5,a5,a2
    d444:	0117e7b3          	or	a5,a5,a7
    d448:	fe0794e3          	bnez	a5,d430 <__eqdf2+0x44>
    d44c:	40d585b3          	sub	a1,a1,a3
    d450:	00b03533          	snez	a0,a1
    d454:	00008067          	ret
    d458:	fcc89ce3          	bne	a7,a2,d430 <__eqdf2+0x44>
    d45c:	00d58a63          	beq	a1,a3,d470 <__eqdf2+0x84>
    d460:	fc0718e3          	bnez	a4,d430 <__eqdf2+0x44>
    d464:	011e6e33          	or	t3,t3,a7
    d468:	01c03533          	snez	a0,t3
    d46c:	00008067          	ret
    d470:	00000513          	li	a0,0
    d474:	00008067          	ret

0000d478 <__gedf2>:
    d478:	0145d893          	srl	a7,a1,0x14
    d47c:	001007b7          	lui	a5,0x100
    d480:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d484:	0146d713          	srl	a4,a3,0x14
    d488:	7ff8f893          	and	a7,a7,2047
    d48c:	7ff00e13          	li	t3,2047
    d490:	00b7f333          	and	t1,a5,a1
    d494:	00050813          	mv	a6,a0
    d498:	00050e93          	mv	t4,a0
    d49c:	00d7f7b3          	and	a5,a5,a3
    d4a0:	01f5d593          	srl	a1,a1,0x1f
    d4a4:	00060f13          	mv	t5,a2
    d4a8:	7ff77513          	and	a0,a4,2047
    d4ac:	01f6d693          	srl	a3,a3,0x1f
    d4b0:	05c88863          	beq	a7,t3,d500 <__gedf2+0x88>
    d4b4:	03c50463          	beq	a0,t3,d4dc <__gedf2+0x64>
    d4b8:	06089a63          	bnez	a7,d52c <__gedf2+0xb4>
    d4bc:	01036833          	or	a6,t1,a6
    d4c0:	06051063          	bnez	a0,d520 <__gedf2+0xa8>
    d4c4:	00c7e633          	or	a2,a5,a2
    d4c8:	08060c63          	beqz	a2,d560 <__gedf2+0xe8>
    d4cc:	0a081263          	bnez	a6,d570 <__gedf2+0xf8>
    d4d0:	00100513          	li	a0,1
    d4d4:	08068263          	beqz	a3,d558 <__gedf2+0xe0>
    d4d8:	00008067          	ret
    d4dc:	00c7e633          	or	a2,a5,a2
    d4e0:	08061463          	bnez	a2,d568 <__gedf2+0xf0>
    d4e4:	00089663          	bnez	a7,d4f0 <__gedf2+0x78>
    d4e8:	01036333          	or	t1,t1,a6
    d4ec:	fe0302e3          	beqz	t1,d4d0 <__gedf2+0x58>
    d4f0:	06d58063          	beq	a1,a3,d550 <__gedf2+0xd8>
    d4f4:	06059263          	bnez	a1,d558 <__gedf2+0xe0>
    d4f8:	00100513          	li	a0,1
    d4fc:	00008067          	ret
    d500:	01036333          	or	t1,t1,a6
    d504:	06031263          	bnez	t1,d568 <__gedf2+0xf0>
    d508:	ff1516e3          	bne	a0,a7,d4f4 <__gedf2+0x7c>
    d50c:	00c7e7b3          	or	a5,a5,a2
    d510:	04079c63          	bnez	a5,d568 <__gedf2+0xf0>
    d514:	fed590e3          	bne	a1,a3,d4f4 <__gedf2+0x7c>
    d518:	00000513          	li	a0,0
    d51c:	00008067          	ret
    d520:	fa0808e3          	beqz	a6,d4d0 <__gedf2+0x58>
    d524:	fcd598e3          	bne	a1,a3,d4f4 <__gedf2+0x7c>
    d528:	0280006f          	j	d550 <__gedf2+0xd8>
    d52c:	fc0504e3          	beqz	a0,d4f4 <__gedf2+0x7c>
    d530:	fcd592e3          	bne	a1,a3,d4f4 <__gedf2+0x7c>
    d534:	fd1540e3          	blt	a0,a7,d4f4 <__gedf2+0x7c>
    d538:	00a8cc63          	blt	a7,a0,d550 <__gedf2+0xd8>
    d53c:	fa67ece3          	bltu	a5,t1,d4f4 <__gedf2+0x7c>
    d540:	00f31863          	bne	t1,a5,d550 <__gedf2+0xd8>
    d544:	fbdf68e3          	bltu	t5,t4,d4f4 <__gedf2+0x7c>
    d548:	00000513          	li	a0,0
    d54c:	f9eef6e3          	bgeu	t4,t5,d4d8 <__gedf2+0x60>
    d550:	00100513          	li	a0,1
    d554:	f80592e3          	bnez	a1,d4d8 <__gedf2+0x60>
    d558:	fff00513          	li	a0,-1
    d55c:	00008067          	ret
    d560:	f8081ae3          	bnez	a6,d4f4 <__gedf2+0x7c>
    d564:	00008067          	ret
    d568:	ffe00513          	li	a0,-2
    d56c:	00008067          	ret
    d570:	fcd586e3          	beq	a1,a3,d53c <__gedf2+0xc4>
    d574:	f81ff06f          	j	d4f4 <__gedf2+0x7c>

0000d578 <__ledf2>:
    d578:	0145d893          	srl	a7,a1,0x14
    d57c:	001007b7          	lui	a5,0x100
    d580:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d584:	0146d713          	srl	a4,a3,0x14
    d588:	7ff8f893          	and	a7,a7,2047
    d58c:	7ff00313          	li	t1,2047
    d590:	00b7fe33          	and	t3,a5,a1
    d594:	00050813          	mv	a6,a0
    d598:	00050e93          	mv	t4,a0
    d59c:	00d7f7b3          	and	a5,a5,a3
    d5a0:	01f5d593          	srl	a1,a1,0x1f
    d5a4:	00060f13          	mv	t5,a2
    d5a8:	7ff77513          	and	a0,a4,2047
    d5ac:	01f6d693          	srl	a3,a3,0x1f
    d5b0:	04688a63          	beq	a7,t1,d604 <__ledf2+0x8c>
    d5b4:	02650463          	beq	a0,t1,d5dc <__ledf2+0x64>
    d5b8:	06089863          	bnez	a7,d628 <__ledf2+0xb0>
    d5bc:	010e6833          	or	a6,t3,a6
    d5c0:	08051e63          	bnez	a0,d65c <__ledf2+0xe4>
    d5c4:	00c7e633          	or	a2,a5,a2
    d5c8:	0a060463          	beqz	a2,d670 <__ledf2+0xf8>
    d5cc:	0a081663          	bnez	a6,d678 <__ledf2+0x100>
    d5d0:	00100513          	li	a0,1
    d5d4:	08068063          	beqz	a3,d654 <__ledf2+0xdc>
    d5d8:	00008067          	ret
    d5dc:	00c7e633          	or	a2,a5,a2
    d5e0:	00200513          	li	a0,2
    d5e4:	fe061ae3          	bnez	a2,d5d8 <__ledf2+0x60>
    d5e8:	00089663          	bnez	a7,d5f4 <__ledf2+0x7c>
    d5ec:	010e6e33          	or	t3,t3,a6
    d5f0:	fe0e00e3          	beqz	t3,d5d0 <__ledf2+0x58>
    d5f4:	04d58c63          	beq	a1,a3,d64c <__ledf2+0xd4>
    d5f8:	04059e63          	bnez	a1,d654 <__ledf2+0xdc>
    d5fc:	00100513          	li	a0,1
    d600:	00008067          	ret
    d604:	010e6e33          	or	t3,t3,a6
    d608:	060e1063          	bnez	t3,d668 <__ledf2+0xf0>
    d60c:	ff1516e3          	bne	a0,a7,d5f8 <__ledf2+0x80>
    d610:	00c7e7b3          	or	a5,a5,a2
    d614:	00200513          	li	a0,2
    d618:	fc0790e3          	bnez	a5,d5d8 <__ledf2+0x60>
    d61c:	fcd59ee3          	bne	a1,a3,d5f8 <__ledf2+0x80>
    d620:	00000513          	li	a0,0
    d624:	00008067          	ret
    d628:	fc0508e3          	beqz	a0,d5f8 <__ledf2+0x80>
    d62c:	fcd596e3          	bne	a1,a3,d5f8 <__ledf2+0x80>
    d630:	fd1544e3          	blt	a0,a7,d5f8 <__ledf2+0x80>
    d634:	00a8cc63          	blt	a7,a0,d64c <__ledf2+0xd4>
    d638:	fdc7e0e3          	bltu	a5,t3,d5f8 <__ledf2+0x80>
    d63c:	00fe1863          	bne	t3,a5,d64c <__ledf2+0xd4>
    d640:	fbdf6ce3          	bltu	t5,t4,d5f8 <__ledf2+0x80>
    d644:	00000513          	li	a0,0
    d648:	f9eef8e3          	bgeu	t4,t5,d5d8 <__ledf2+0x60>
    d64c:	00100513          	li	a0,1
    d650:	f80594e3          	bnez	a1,d5d8 <__ledf2+0x60>
    d654:	fff00513          	li	a0,-1
    d658:	00008067          	ret
    d65c:	f6080ae3          	beqz	a6,d5d0 <__ledf2+0x58>
    d660:	f8d59ce3          	bne	a1,a3,d5f8 <__ledf2+0x80>
    d664:	fe9ff06f          	j	d64c <__ledf2+0xd4>
    d668:	00200513          	li	a0,2
    d66c:	00008067          	ret
    d670:	f80814e3          	bnez	a6,d5f8 <__ledf2+0x80>
    d674:	00008067          	ret
    d678:	fcd580e3          	beq	a1,a3,d638 <__ledf2+0xc0>
    d67c:	f7dff06f          	j	d5f8 <__ledf2+0x80>

0000d680 <__muldf3>:
    d680:	fd010113          	add	sp,sp,-48
    d684:	0145d793          	srl	a5,a1,0x14
    d688:	02812423          	sw	s0,40(sp)
    d68c:	02912223          	sw	s1,36(sp)
    d690:	03212023          	sw	s2,32(sp)
    d694:	01312e23          	sw	s3,28(sp)
    d698:	01512a23          	sw	s5,20(sp)
    d69c:	00c59493          	sll	s1,a1,0xc
    d6a0:	02112623          	sw	ra,44(sp)
    d6a4:	01412c23          	sw	s4,24(sp)
    d6a8:	01612823          	sw	s6,16(sp)
    d6ac:	01712623          	sw	s7,12(sp)
    d6b0:	01812423          	sw	s8,8(sp)
    d6b4:	7ff7f793          	and	a5,a5,2047
    d6b8:	00050413          	mv	s0,a0
    d6bc:	00060a93          	mv	s5,a2
    d6c0:	00068993          	mv	s3,a3
    d6c4:	00c4d493          	srl	s1,s1,0xc
    d6c8:	01f5d913          	srl	s2,a1,0x1f
    d6cc:	4e078063          	beqz	a5,dbac <__muldf3+0x52c>
    d6d0:	7ff00713          	li	a4,2047
    d6d4:	0ae78663          	beq	a5,a4,d780 <__muldf3+0x100>
    d6d8:	00349693          	sll	a3,s1,0x3
    d6dc:	01d55713          	srl	a4,a0,0x1d
    d6e0:	00d76733          	or	a4,a4,a3
    d6e4:	008006b7          	lui	a3,0x800
    d6e8:	00d764b3          	or	s1,a4,a3
    d6ec:	00351a13          	sll	s4,a0,0x3
    d6f0:	c0178c13          	add	s8,a5,-1023
    d6f4:	00000b13          	li	s6,0
    d6f8:	00000b93          	li	s7,0
    d6fc:	0149d793          	srl	a5,s3,0x14
    d700:	00c99713          	sll	a4,s3,0xc
    d704:	7ff7f793          	and	a5,a5,2047
    d708:	000a8e13          	mv	t3,s5
    d70c:	00c75413          	srl	s0,a4,0xc
    d710:	01f9d993          	srl	s3,s3,0x1f
    d714:	0a078063          	beqz	a5,d7b4 <__muldf3+0x134>
    d718:	7ff00713          	li	a4,2047
    d71c:	14e78e63          	beq	a5,a4,d878 <__muldf3+0x1f8>
    d720:	00341713          	sll	a4,s0,0x3
    d724:	01dad693          	srl	a3,s5,0x1d
    d728:	00e6e6b3          	or	a3,a3,a4
    d72c:	c0178793          	add	a5,a5,-1023
    d730:	00800737          	lui	a4,0x800
    d734:	00e6e433          	or	s0,a3,a4
    d738:	003a9e13          	sll	t3,s5,0x3
    d73c:	01878333          	add	t1,a5,s8
    d740:	00000693          	li	a3,0
    d744:	00a00793          	li	a5,10
    d748:	00130893          	add	a7,t1,1
    d74c:	0b67cc63          	blt	a5,s6,d804 <__muldf3+0x184>
    d750:	013945b3          	xor	a1,s2,s3
    d754:	00200793          	li	a5,2
    d758:	00058813          	mv	a6,a1
    d75c:	1567c663          	blt	a5,s6,d8a8 <__muldf3+0x228>
    d760:	fffb0b13          	add	s6,s6,-1
    d764:	00100713          	li	a4,1
    d768:	17676063          	bltu	a4,s6,d8c8 <__muldf3+0x248>
    d76c:	48f68663          	beq	a3,a5,dbf8 <__muldf3+0x578>
    d770:	00040493          	mv	s1,s0
    d774:	000e0a13          	mv	s4,t3
    d778:	00068b93          	mv	s7,a3
    d77c:	09c0006f          	j	d818 <__muldf3+0x198>
    d780:	00a4ea33          	or	s4,s1,a0
    d784:	480a1463          	bnez	s4,dc0c <__muldf3+0x58c>
    d788:	0149d793          	srl	a5,s3,0x14
    d78c:	00c99713          	sll	a4,s3,0xc
    d790:	7ff7f793          	and	a5,a5,2047
    d794:	00000493          	li	s1,0
    d798:	00800b13          	li	s6,8
    d79c:	7ff00c13          	li	s8,2047
    d7a0:	00200b93          	li	s7,2
    d7a4:	000a8e13          	mv	t3,s5
    d7a8:	00c75413          	srl	s0,a4,0xc
    d7ac:	01f9d993          	srl	s3,s3,0x1f
    d7b0:	f60794e3          	bnez	a5,d718 <__muldf3+0x98>
    d7b4:	015467b3          	or	a5,s0,s5
    d7b8:	46078e63          	beqz	a5,dc34 <__muldf3+0x5b4>
    d7bc:	54040c63          	beqz	s0,dd14 <__muldf3+0x694>
    d7c0:	00040513          	mv	a0,s0
    d7c4:	6f4010ef          	jal	eeb8 <__clzsi2>
    d7c8:	00050313          	mv	t1,a0
    d7cc:	ff550713          	add	a4,a0,-11
    d7d0:	01d00793          	li	a5,29
    d7d4:	ff830e13          	add	t3,t1,-8
    d7d8:	40e787b3          	sub	a5,a5,a4
    d7dc:	00fad7b3          	srl	a5,s5,a5
    d7e0:	01c41733          	sll	a4,s0,t3
    d7e4:	00e7e433          	or	s0,a5,a4
    d7e8:	01ca9e33          	sll	t3,s5,t3
    d7ec:	406c0333          	sub	t1,s8,t1
    d7f0:	c0d30313          	add	t1,t1,-1011
    d7f4:	00a00793          	li	a5,10
    d7f8:	00000693          	li	a3,0
    d7fc:	00130893          	add	a7,t1,1
    d800:	f567d8e3          	bge	a5,s6,d750 <__muldf3+0xd0>
    d804:	00090593          	mv	a1,s2
    d808:	00200793          	li	a5,2
    d80c:	3efb8663          	beq	s7,a5,dbf8 <__muldf3+0x578>
    d810:	00300793          	li	a5,3
    d814:	54fb8863          	beq	s7,a5,dd64 <__muldf3+0x6e4>
    d818:	00100793          	li	a5,1
    d81c:	00058813          	mv	a6,a1
    d820:	52fb9663          	bne	s7,a5,dd4c <__muldf3+0x6cc>
    d824:	00000793          	li	a5,0
    d828:	00000693          	li	a3,0
    d82c:	00000713          	li	a4,0
    d830:	02c12083          	lw	ra,44(sp)
    d834:	02812403          	lw	s0,40(sp)
    d838:	01479793          	sll	a5,a5,0x14
    d83c:	00d7e7b3          	or	a5,a5,a3
    d840:	01f81813          	sll	a6,a6,0x1f
    d844:	0107e7b3          	or	a5,a5,a6
    d848:	02412483          	lw	s1,36(sp)
    d84c:	02012903          	lw	s2,32(sp)
    d850:	01c12983          	lw	s3,28(sp)
    d854:	01812a03          	lw	s4,24(sp)
    d858:	01412a83          	lw	s5,20(sp)
    d85c:	01012b03          	lw	s6,16(sp)
    d860:	00c12b83          	lw	s7,12(sp)
    d864:	00812c03          	lw	s8,8(sp)
    d868:	00070513          	mv	a0,a4
    d86c:	00078593          	mv	a1,a5
    d870:	03010113          	add	sp,sp,48
    d874:	00008067          	ret
    d878:	01546733          	or	a4,s0,s5
    d87c:	7ffc0313          	add	t1,s8,2047
    d880:	3c070663          	beqz	a4,dc4c <__muldf3+0x5cc>
    d884:	00001737          	lui	a4,0x1
    d888:	01394833          	xor	a6,s2,s3
    d88c:	80070713          	add	a4,a4,-2048 # 800 <main+0x530>
    d890:	003b6b13          	or	s6,s6,3
    d894:	00a00693          	li	a3,10
    d898:	00080593          	mv	a1,a6
    d89c:	00ec08b3          	add	a7,s8,a4
    d8a0:	4366cc63          	blt	a3,s6,dcd8 <__muldf3+0x658>
    d8a4:	00300693          	li	a3,3
    d8a8:	00100613          	li	a2,1
    d8ac:	01661633          	sll	a2,a2,s6
    d8b0:	53067713          	and	a4,a2,1328
    d8b4:	f4071ae3          	bnez	a4,d808 <__muldf3+0x188>
    d8b8:	24067793          	and	a5,a2,576
    d8bc:	48079063          	bnez	a5,dd3c <__muldf3+0x6bc>
    d8c0:	08867613          	and	a2,a2,136
    d8c4:	38061e63          	bnez	a2,dc60 <__muldf3+0x5e0>
    d8c8:	00010fb7          	lui	t6,0x10
    d8cc:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    d8d0:	005a7f33          	and	t5,s4,t0
    d8d4:	005e72b3          	and	t0,t3,t0
    d8d8:	010a5a13          	srl	s4,s4,0x10
    d8dc:	010e5e13          	srl	t3,t3,0x10
    d8e0:	000f0513          	mv	a0,t5
    d8e4:	00028593          	mv	a1,t0
    d8e8:	460010ef          	jal	ed48 <__mulsi3>
    d8ec:	00050713          	mv	a4,a0
    d8f0:	000e0593          	mv	a1,t3
    d8f4:	000f0513          	mv	a0,t5
    d8f8:	450010ef          	jal	ed48 <__mulsi3>
    d8fc:	00050793          	mv	a5,a0
    d900:	00028593          	mv	a1,t0
    d904:	000a0513          	mv	a0,s4
    d908:	440010ef          	jal	ed48 <__mulsi3>
    d90c:	00050e93          	mv	t4,a0
    d910:	000e0593          	mv	a1,t3
    d914:	000a0513          	mv	a0,s4
    d918:	430010ef          	jal	ed48 <__mulsi3>
    d91c:	01d786b3          	add	a3,a5,t4
    d920:	01075393          	srl	t2,a4,0x10
    d924:	00d383b3          	add	t2,t2,a3
    d928:	00050793          	mv	a5,a0
    d92c:	01d3f463          	bgeu	t2,t4,d934 <__muldf3+0x2b4>
    d930:	01f507b3          	add	a5,a0,t6
    d934:	000109b7          	lui	s3,0x10
    d938:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    d93c:	0123feb3          	and	t4,t2,s2
    d940:	01277733          	and	a4,a4,s2
    d944:	010e9e93          	sll	t4,t4,0x10
    d948:	01247933          	and	s2,s0,s2
    d94c:	0103d393          	srl	t2,t2,0x10
    d950:	00ee8eb3          	add	t4,t4,a4
    d954:	01045413          	srl	s0,s0,0x10
    d958:	000f0513          	mv	a0,t5
    d95c:	00090593          	mv	a1,s2
    d960:	3e8010ef          	jal	ed48 <__mulsi3>
    d964:	00050f93          	mv	t6,a0
    d968:	00040593          	mv	a1,s0
    d96c:	000f0513          	mv	a0,t5
    d970:	3d8010ef          	jal	ed48 <__mulsi3>
    d974:	00050713          	mv	a4,a0
    d978:	00090593          	mv	a1,s2
    d97c:	000a0513          	mv	a0,s4
    d980:	3c8010ef          	jal	ed48 <__mulsi3>
    d984:	00050f13          	mv	t5,a0
    d988:	00040593          	mv	a1,s0
    d98c:	000a0513          	mv	a0,s4
    d990:	3b8010ef          	jal	ed48 <__mulsi3>
    d994:	010fd693          	srl	a3,t6,0x10
    d998:	01e70733          	add	a4,a4,t5
    d99c:	00e686b3          	add	a3,a3,a4
    d9a0:	01e6f463          	bgeu	a3,t5,d9a8 <__muldf3+0x328>
    d9a4:	01350533          	add	a0,a0,s3
    d9a8:	00010a37          	lui	s4,0x10
    d9ac:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    d9b0:	01e6f733          	and	a4,a3,t5
    d9b4:	01efffb3          	and	t6,t6,t5
    d9b8:	01071713          	sll	a4,a4,0x10
    d9bc:	01f70733          	add	a4,a4,t6
    d9c0:	01e4ff33          	and	t5,s1,t5
    d9c4:	0106d693          	srl	a3,a3,0x10
    d9c8:	00a68fb3          	add	t6,a3,a0
    d9cc:	00e383b3          	add	t2,t2,a4
    d9d0:	0104d493          	srl	s1,s1,0x10
    d9d4:	000f0513          	mv	a0,t5
    d9d8:	00028593          	mv	a1,t0
    d9dc:	36c010ef          	jal	ed48 <__mulsi3>
    d9e0:	00050a93          	mv	s5,a0
    d9e4:	000e0593          	mv	a1,t3
    d9e8:	000f0513          	mv	a0,t5
    d9ec:	35c010ef          	jal	ed48 <__mulsi3>
    d9f0:	00050993          	mv	s3,a0
    d9f4:	00028593          	mv	a1,t0
    d9f8:	00048513          	mv	a0,s1
    d9fc:	34c010ef          	jal	ed48 <__mulsi3>
    da00:	00050293          	mv	t0,a0
    da04:	000e0593          	mv	a1,t3
    da08:	00048513          	mv	a0,s1
    da0c:	33c010ef          	jal	ed48 <__mulsi3>
    da10:	010ad613          	srl	a2,s5,0x10
    da14:	005989b3          	add	s3,s3,t0
    da18:	01360633          	add	a2,a2,s3
    da1c:	00567463          	bgeu	a2,t0,da24 <__muldf3+0x3a4>
    da20:	01450533          	add	a0,a0,s4
    da24:	00010a37          	lui	s4,0x10
    da28:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    da2c:	00d672b3          	and	t0,a2,a3
    da30:	00dafab3          	and	s5,s5,a3
    da34:	01065613          	srl	a2,a2,0x10
    da38:	01029293          	sll	t0,t0,0x10
    da3c:	00a60e33          	add	t3,a2,a0
    da40:	015282b3          	add	t0,t0,s5
    da44:	000f0513          	mv	a0,t5
    da48:	00090593          	mv	a1,s2
    da4c:	2fc010ef          	jal	ed48 <__mulsi3>
    da50:	00050993          	mv	s3,a0
    da54:	00040593          	mv	a1,s0
    da58:	000f0513          	mv	a0,t5
    da5c:	2ec010ef          	jal	ed48 <__mulsi3>
    da60:	00050f13          	mv	t5,a0
    da64:	00090593          	mv	a1,s2
    da68:	00048513          	mv	a0,s1
    da6c:	2dc010ef          	jal	ed48 <__mulsi3>
    da70:	00050913          	mv	s2,a0
    da74:	00040593          	mv	a1,s0
    da78:	00048513          	mv	a0,s1
    da7c:	2cc010ef          	jal	ed48 <__mulsi3>
    da80:	012f06b3          	add	a3,t5,s2
    da84:	0109d593          	srl	a1,s3,0x10
    da88:	00d58433          	add	s0,a1,a3
    da8c:	00050f13          	mv	t5,a0
    da90:	01247463          	bgeu	s0,s2,da98 <__muldf3+0x418>
    da94:	01450f33          	add	t5,a0,s4
    da98:	00010637          	lui	a2,0x10
    da9c:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x647>
    daa0:	00c476b3          	and	a3,s0,a2
    daa4:	00c9f9b3          	and	s3,s3,a2
    daa8:	01069693          	sll	a3,a3,0x10
    daac:	007787b3          	add	a5,a5,t2
    dab0:	013686b3          	add	a3,a3,s3
    dab4:	01f685b3          	add	a1,a3,t6
    dab8:	00e7b733          	sltu	a4,a5,a4
    dabc:	00e58733          	add	a4,a1,a4
    dac0:	005782b3          	add	t0,a5,t0
    dac4:	01c70633          	add	a2,a4,t3
    dac8:	00f2b7b3          	sltu	a5,t0,a5
    dacc:	00f607b3          	add	a5,a2,a5
    dad0:	00d5b6b3          	sltu	a3,a1,a3
    dad4:	00b735b3          	sltu	a1,a4,a1
    dad8:	00b6e6b3          	or	a3,a3,a1
    dadc:	00e63733          	sltu	a4,a2,a4
    dae0:	01045593          	srl	a1,s0,0x10
    dae4:	00c7b633          	sltu	a2,a5,a2
    dae8:	00b686b3          	add	a3,a3,a1
    daec:	00929a13          	sll	s4,t0,0x9
    daf0:	00c76733          	or	a4,a4,a2
    daf4:	00d70733          	add	a4,a4,a3
    daf8:	01da6a33          	or	s4,s4,t4
    dafc:	01e70733          	add	a4,a4,t5
    db00:	01403a33          	snez	s4,s4
    db04:	0172d293          	srl	t0,t0,0x17
    db08:	00971713          	sll	a4,a4,0x9
    db0c:	0177d693          	srl	a3,a5,0x17
    db10:	005a6a33          	or	s4,s4,t0
    db14:	00979793          	sll	a5,a5,0x9
    db18:	00fa6a33          	or	s4,s4,a5
    db1c:	00771793          	sll	a5,a4,0x7
    db20:	00d764b3          	or	s1,a4,a3
    db24:	0207d063          	bgez	a5,db44 <__muldf3+0x4c4>
    db28:	001a5793          	srl	a5,s4,0x1
    db2c:	001a7a13          	and	s4,s4,1
    db30:	01f49713          	sll	a4,s1,0x1f
    db34:	0147e7b3          	or	a5,a5,s4
    db38:	00e7ea33          	or	s4,a5,a4
    db3c:	0014d493          	srl	s1,s1,0x1
    db40:	00088313          	mv	t1,a7
    db44:	3ff30793          	add	a5,t1,1023
    db48:	12f05663          	blez	a5,dc74 <__muldf3+0x5f4>
    db4c:	007a7713          	and	a4,s4,7
    db50:	02070063          	beqz	a4,db70 <__muldf3+0x4f0>
    db54:	00fa7713          	and	a4,s4,15
    db58:	00400693          	li	a3,4
    db5c:	00d70a63          	beq	a4,a3,db70 <__muldf3+0x4f0>
    db60:	004a0713          	add	a4,s4,4
    db64:	01473a33          	sltu	s4,a4,s4
    db68:	014484b3          	add	s1,s1,s4
    db6c:	00070a13          	mv	s4,a4
    db70:	00749713          	sll	a4,s1,0x7
    db74:	00075a63          	bgez	a4,db88 <__muldf3+0x508>
    db78:	ff0007b7          	lui	a5,0xff000
    db7c:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    db80:	00f4f4b3          	and	s1,s1,a5
    db84:	40030793          	add	a5,t1,1024
    db88:	7fe00713          	li	a4,2046
    db8c:	1cf74463          	blt	a4,a5,dd54 <__muldf3+0x6d4>
    db90:	003a5a13          	srl	s4,s4,0x3
    db94:	01d49713          	sll	a4,s1,0x1d
    db98:	00949693          	sll	a3,s1,0x9
    db9c:	01476733          	or	a4,a4,s4
    dba0:	00c6d693          	srl	a3,a3,0xc
    dba4:	7ff7f793          	and	a5,a5,2047
    dba8:	c89ff06f          	j	d830 <__muldf3+0x1b0>
    dbac:	00a4ea33          	or	s4,s1,a0
    dbb0:	060a0863          	beqz	s4,dc20 <__muldf3+0x5a0>
    dbb4:	12048e63          	beqz	s1,dcf0 <__muldf3+0x670>
    dbb8:	00048513          	mv	a0,s1
    dbbc:	2fc010ef          	jal	eeb8 <__clzsi2>
    dbc0:	00050713          	mv	a4,a0
    dbc4:	ff550693          	add	a3,a0,-11
    dbc8:	01d00793          	li	a5,29
    dbcc:	ff870a13          	add	s4,a4,-8
    dbd0:	40d787b3          	sub	a5,a5,a3
    dbd4:	00f457b3          	srl	a5,s0,a5
    dbd8:	014496b3          	sll	a3,s1,s4
    dbdc:	00d7e4b3          	or	s1,a5,a3
    dbe0:	01441a33          	sll	s4,s0,s4
    dbe4:	c0d00793          	li	a5,-1011
    dbe8:	40e78c33          	sub	s8,a5,a4
    dbec:	00000b13          	li	s6,0
    dbf0:	00000b93          	li	s7,0
    dbf4:	b09ff06f          	j	d6fc <__muldf3+0x7c>
    dbf8:	00058813          	mv	a6,a1
    dbfc:	7ff00793          	li	a5,2047
    dc00:	00000693          	li	a3,0
    dc04:	00000713          	li	a4,0
    dc08:	c29ff06f          	j	d830 <__muldf3+0x1b0>
    dc0c:	00050a13          	mv	s4,a0
    dc10:	00c00b13          	li	s6,12
    dc14:	7ff00c13          	li	s8,2047
    dc18:	00300b93          	li	s7,3
    dc1c:	ae1ff06f          	j	d6fc <__muldf3+0x7c>
    dc20:	00000493          	li	s1,0
    dc24:	00400b13          	li	s6,4
    dc28:	00000c13          	li	s8,0
    dc2c:	00100b93          	li	s7,1
    dc30:	acdff06f          	j	d6fc <__muldf3+0x7c>
    dc34:	001b6b13          	or	s6,s6,1
    dc38:	000c0313          	mv	t1,s8
    dc3c:	00000413          	li	s0,0
    dc40:	00000e13          	li	t3,0
    dc44:	00100693          	li	a3,1
    dc48:	afdff06f          	j	d744 <__muldf3+0xc4>
    dc4c:	002b6b13          	or	s6,s6,2
    dc50:	00000413          	li	s0,0
    dc54:	00000e13          	li	t3,0
    dc58:	00200693          	li	a3,2
    dc5c:	ae9ff06f          	j	d744 <__muldf3+0xc4>
    dc60:	00040493          	mv	s1,s0
    dc64:	000e0a13          	mv	s4,t3
    dc68:	00068b93          	mv	s7,a3
    dc6c:	00098593          	mv	a1,s3
    dc70:	b99ff06f          	j	d808 <__muldf3+0x188>
    dc74:	00100713          	li	a4,1
    dc78:	10079063          	bnez	a5,dd78 <__muldf3+0x6f8>
    dc7c:	41e30313          	add	t1,t1,1054
    dc80:	006a1633          	sll	a2,s4,t1
    dc84:	00c03633          	snez	a2,a2
    dc88:	00649333          	sll	t1,s1,t1
    dc8c:	00ea5a33          	srl	s4,s4,a4
    dc90:	00666633          	or	a2,a2,t1
    dc94:	01466633          	or	a2,a2,s4
    dc98:	00767793          	and	a5,a2,7
    dc9c:	00e4d5b3          	srl	a1,s1,a4
    dca0:	02078063          	beqz	a5,dcc0 <__muldf3+0x640>
    dca4:	00f67793          	and	a5,a2,15
    dca8:	00400713          	li	a4,4
    dcac:	00e78a63          	beq	a5,a4,dcc0 <__muldf3+0x640>
    dcb0:	00460793          	add	a5,a2,4
    dcb4:	00c7b633          	sltu	a2,a5,a2
    dcb8:	00c585b3          	add	a1,a1,a2
    dcbc:	00078613          	mv	a2,a5
    dcc0:	00859513          	sll	a0,a1,0x8
    dcc4:	00100793          	li	a5,1
    dcc8:	00000693          	li	a3,0
    dccc:	00000713          	li	a4,0
    dcd0:	b60540e3          	bltz	a0,d830 <__muldf3+0x1b0>
    dcd4:	10c0006f          	j	dde0 <__muldf3+0x760>
    dcd8:	00f00713          	li	a4,15
    dcdc:	12eb1063          	bne	s6,a4,ddfc <__muldf3+0x77c>
    dce0:	00000813          	li	a6,0
    dce4:	000806b7          	lui	a3,0x80
    dce8:	00000713          	li	a4,0
    dcec:	b45ff06f          	j	d830 <__muldf3+0x1b0>
    dcf0:	1c8010ef          	jal	eeb8 <__clzsi2>
    dcf4:	01550693          	add	a3,a0,21
    dcf8:	01c00793          	li	a5,28
    dcfc:	02050713          	add	a4,a0,32
    dd00:	ecd7d4e3          	bge	a5,a3,dbc8 <__muldf3+0x548>
    dd04:	ff850513          	add	a0,a0,-8
    dd08:	00000a13          	li	s4,0
    dd0c:	00a414b3          	sll	s1,s0,a0
    dd10:	ed5ff06f          	j	dbe4 <__muldf3+0x564>
    dd14:	000a8513          	mv	a0,s5
    dd18:	1a0010ef          	jal	eeb8 <__clzsi2>
    dd1c:	01550713          	add	a4,a0,21
    dd20:	01c00793          	li	a5,28
    dd24:	02050313          	add	t1,a0,32
    dd28:	aae7d4e3          	bge	a5,a4,d7d0 <__muldf3+0x150>
    dd2c:	ff850513          	add	a0,a0,-8
    dd30:	00000e13          	li	t3,0
    dd34:	00aa9433          	sll	s0,s5,a0
    dd38:	ab5ff06f          	j	d7ec <__muldf3+0x16c>
    dd3c:	00000813          	li	a6,0
    dd40:	7ff00793          	li	a5,2047
    dd44:	000806b7          	lui	a3,0x80
    dd48:	ae9ff06f          	j	d830 <__muldf3+0x1b0>
    dd4c:	00088313          	mv	t1,a7
    dd50:	df5ff06f          	j	db44 <__muldf3+0x4c4>
    dd54:	7ff00793          	li	a5,2047
    dd58:	00000693          	li	a3,0
    dd5c:	00000713          	li	a4,0
    dd60:	ad1ff06f          	j	d830 <__muldf3+0x1b0>
    dd64:	00000813          	li	a6,0
    dd68:	7ff00793          	li	a5,2047
    dd6c:	000806b7          	lui	a3,0x80
    dd70:	00000713          	li	a4,0
    dd74:	abdff06f          	j	d830 <__muldf3+0x1b0>
    dd78:	40f70733          	sub	a4,a4,a5
    dd7c:	03800693          	li	a3,56
    dd80:	aae6c2e3          	blt	a3,a4,d824 <__muldf3+0x1a4>
    dd84:	01f00693          	li	a3,31
    dd88:	eee6dae3          	bge	a3,a4,dc7c <__muldf3+0x5fc>
    dd8c:	fe100693          	li	a3,-31
    dd90:	40f687b3          	sub	a5,a3,a5
    dd94:	02000693          	li	a3,32
    dd98:	00f4d7b3          	srl	a5,s1,a5
    dd9c:	00d70863          	beq	a4,a3,ddac <__muldf3+0x72c>
    dda0:	43e30313          	add	t1,t1,1086
    dda4:	00649333          	sll	t1,s1,t1
    dda8:	006a6a33          	or	s4,s4,t1
    ddac:	01403633          	snez	a2,s4
    ddb0:	00f66633          	or	a2,a2,a5
    ddb4:	00767713          	and	a4,a2,7
    ddb8:	00000693          	li	a3,0
    ddbc:	02070863          	beqz	a4,ddec <__muldf3+0x76c>
    ddc0:	00f67793          	and	a5,a2,15
    ddc4:	00400713          	li	a4,4
    ddc8:	00000593          	li	a1,0
    ddcc:	00e78a63          	beq	a5,a4,dde0 <__muldf3+0x760>
    ddd0:	00460793          	add	a5,a2,4
    ddd4:	00c7b633          	sltu	a2,a5,a2
    ddd8:	00c035b3          	snez	a1,a2
    dddc:	00078613          	mv	a2,a5
    dde0:	00959693          	sll	a3,a1,0x9
    dde4:	01d59713          	sll	a4,a1,0x1d
    dde8:	00c6d693          	srl	a3,a3,0xc
    ddec:	00365613          	srl	a2,a2,0x3
    ddf0:	00e66733          	or	a4,a2,a4
    ddf4:	00000793          	li	a5,0
    ddf8:	a39ff06f          	j	d830 <__muldf3+0x1b0>
    ddfc:	00040493          	mv	s1,s0
    de00:	000a8a13          	mv	s4,s5
    de04:	00300b93          	li	s7,3
    de08:	00098593          	mv	a1,s3
    de0c:	9fdff06f          	j	d808 <__muldf3+0x188>

0000de10 <__subdf3>:
    de10:	001007b7          	lui	a5,0x100
    de14:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    de18:	fe010113          	add	sp,sp,-32
    de1c:	00b7f8b3          	and	a7,a5,a1
    de20:	00d7f833          	and	a6,a5,a3
    de24:	0146d793          	srl	a5,a3,0x14
    de28:	00389893          	sll	a7,a7,0x3
    de2c:	00812c23          	sw	s0,24(sp)
    de30:	01312623          	sw	s3,12(sp)
    de34:	01f5d413          	srl	s0,a1,0x1f
    de38:	0145d993          	srl	s3,a1,0x14
    de3c:	01d55713          	srl	a4,a0,0x1d
    de40:	00381813          	sll	a6,a6,0x3
    de44:	01d65593          	srl	a1,a2,0x1d
    de48:	00112e23          	sw	ra,28(sp)
    de4c:	00912a23          	sw	s1,20(sp)
    de50:	01212823          	sw	s2,16(sp)
    de54:	7ff7ff13          	and	t5,a5,2047
    de58:	7ff00313          	li	t1,2047
    de5c:	01176733          	or	a4,a4,a7
    de60:	7ff9f993          	and	s3,s3,2047
    de64:	00040e13          	mv	t3,s0
    de68:	00351893          	sll	a7,a0,0x3
    de6c:	01f6d693          	srl	a3,a3,0x1f
    de70:	0105e5b3          	or	a1,a1,a6
    de74:	00361e93          	sll	t4,a2,0x3
    de78:	206f0c63          	beq	t5,t1,e090 <__subdf3+0x280>
    de7c:	0016c693          	xor	a3,a3,1
    de80:	41e987b3          	sub	a5,s3,t5
    de84:	16d40263          	beq	s0,a3,dfe8 <__subdf3+0x1d8>
    de88:	00f05ae3          	blez	a5,e69c <__subdf3+0x88c>
    de8c:	240f0a63          	beqz	t5,e0e0 <__subdf3+0x2d0>
    de90:	3c698463          	beq	s3,t1,e258 <__subdf3+0x448>
    de94:	03800693          	li	a3,56
    de98:	00100513          	li	a0,1
    de9c:	02f6ce63          	blt	a3,a5,ded8 <__subdf3+0xc8>
    dea0:	008006b7          	lui	a3,0x800
    dea4:	00d5e5b3          	or	a1,a1,a3
    dea8:	01f00693          	li	a3,31
    deac:	4ef6c463          	blt	a3,a5,e394 <__subdf3+0x584>
    deb0:	02000693          	li	a3,32
    deb4:	40f686b3          	sub	a3,a3,a5
    deb8:	00d59533          	sll	a0,a1,a3
    debc:	00fed633          	srl	a2,t4,a5
    dec0:	00de96b3          	sll	a3,t4,a3
    dec4:	00c56533          	or	a0,a0,a2
    dec8:	00d036b3          	snez	a3,a3
    decc:	00f5d7b3          	srl	a5,a1,a5
    ded0:	00d56533          	or	a0,a0,a3
    ded4:	40f70733          	sub	a4,a4,a5
    ded8:	40a88533          	sub	a0,a7,a0
    dedc:	00a8b633          	sltu	a2,a7,a0
    dee0:	00050493          	mv	s1,a0
    dee4:	40c70933          	sub	s2,a4,a2
    dee8:	00891793          	sll	a5,s2,0x8
    deec:	3407d863          	bgez	a5,e23c <__subdf3+0x42c>
    def0:	008007b7          	lui	a5,0x800
    def4:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    def8:	00f97933          	and	s2,s2,a5
    defc:	2e090663          	beqz	s2,e1e8 <__subdf3+0x3d8>
    df00:	00090513          	mv	a0,s2
    df04:	7b5000ef          	jal	eeb8 <__clzsi2>
    df08:	ff850793          	add	a5,a0,-8
    df0c:	02000693          	li	a3,32
    df10:	40f68733          	sub	a4,a3,a5
    df14:	00e4d733          	srl	a4,s1,a4
    df18:	00f91933          	sll	s2,s2,a5
    df1c:	01276733          	or	a4,a4,s2
    df20:	00f494b3          	sll	s1,s1,a5
    df24:	3f37c463          	blt	a5,s3,e30c <__subdf3+0x4fc>
    df28:	413787b3          	sub	a5,a5,s3
    df2c:	00178793          	add	a5,a5,1
    df30:	40f686b3          	sub	a3,a3,a5
    df34:	00d49633          	sll	a2,s1,a3
    df38:	00f4d933          	srl	s2,s1,a5
    df3c:	00c03633          	snez	a2,a2
    df40:	00c96633          	or	a2,s2,a2
    df44:	00d716b3          	sll	a3,a4,a3
    df48:	00c6e4b3          	or	s1,a3,a2
    df4c:	00f75933          	srl	s2,a4,a5
    df50:	00000993          	li	s3,0
    df54:	0074f793          	and	a5,s1,7
    df58:	02078063          	beqz	a5,df78 <__subdf3+0x168>
    df5c:	00f4f793          	and	a5,s1,15
    df60:	00400713          	li	a4,4
    df64:	00e78a63          	beq	a5,a4,df78 <__subdf3+0x168>
    df68:	00448793          	add	a5,s1,4
    df6c:	0097b533          	sltu	a0,a5,s1
    df70:	00a90933          	add	s2,s2,a0
    df74:	00078493          	mv	s1,a5
    df78:	00891793          	sll	a5,s2,0x8
    df7c:	6c07d063          	bgez	a5,e63c <__subdf3+0x82c>
    df80:	00198793          	add	a5,s3,1
    df84:	7ff00713          	li	a4,2047
    df88:	24e78663          	beq	a5,a4,e1d4 <__subdf3+0x3c4>
    df8c:	ff800737          	lui	a4,0xff800
    df90:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    df94:	00e97733          	and	a4,s2,a4
    df98:	7ff7f793          	and	a5,a5,2047
    df9c:	01d71813          	sll	a6,a4,0x1d
    dfa0:	0034d513          	srl	a0,s1,0x3
    dfa4:	00971713          	sll	a4,a4,0x9
    dfa8:	00a86833          	or	a6,a6,a0
    dfac:	00c75713          	srl	a4,a4,0xc
    dfb0:	00147e13          	and	t3,s0,1
    dfb4:	01c12083          	lw	ra,28(sp)
    dfb8:	01812403          	lw	s0,24(sp)
    dfbc:	01479793          	sll	a5,a5,0x14
    dfc0:	00e7e7b3          	or	a5,a5,a4
    dfc4:	01fe1713          	sll	a4,t3,0x1f
    dfc8:	00e7e7b3          	or	a5,a5,a4
    dfcc:	01412483          	lw	s1,20(sp)
    dfd0:	01012903          	lw	s2,16(sp)
    dfd4:	00c12983          	lw	s3,12(sp)
    dfd8:	00080513          	mv	a0,a6
    dfdc:	00078593          	mv	a1,a5
    dfe0:	02010113          	add	sp,sp,32
    dfe4:	00008067          	ret
    dfe8:	70f05263          	blez	a5,e6ec <__subdf3+0x8dc>
    dfec:	1c0f1663          	bnez	t5,e1b8 <__subdf3+0x3a8>
    dff0:	01d5e6b3          	or	a3,a1,t4
    dff4:	26068e63          	beqz	a3,e270 <__subdf3+0x460>
    dff8:	fff78693          	add	a3,a5,-1
    dffc:	46068863          	beqz	a3,e46c <__subdf3+0x65c>
    e000:	24678c63          	beq	a5,t1,e258 <__subdf3+0x448>
    e004:	03800793          	li	a5,56
    e008:	00100913          	li	s2,1
    e00c:	02d7cc63          	blt	a5,a3,e044 <__subdf3+0x234>
    e010:	00068793          	mv	a5,a3
    e014:	01f00693          	li	a3,31
    e018:	48f6ca63          	blt	a3,a5,e4ac <__subdf3+0x69c>
    e01c:	02000693          	li	a3,32
    e020:	40f686b3          	sub	a3,a3,a5
    e024:	00d59933          	sll	s2,a1,a3
    e028:	00fed633          	srl	a2,t4,a5
    e02c:	00de96b3          	sll	a3,t4,a3
    e030:	00c96933          	or	s2,s2,a2
    e034:	00d036b3          	snez	a3,a3
    e038:	00f5d7b3          	srl	a5,a1,a5
    e03c:	00d96933          	or	s2,s2,a3
    e040:	00f70733          	add	a4,a4,a5
    e044:	01190633          	add	a2,s2,a7
    e048:	01263933          	sltu	s2,a2,s2
    e04c:	00060493          	mv	s1,a2
    e050:	00e90933          	add	s2,s2,a4
    e054:	00891793          	sll	a5,s2,0x8
    e058:	1e07d263          	bgez	a5,e23c <__subdf3+0x42c>
    e05c:	00198993          	add	s3,s3,1
    e060:	7ff00793          	li	a5,2047
    e064:	16f98863          	beq	s3,a5,e1d4 <__subdf3+0x3c4>
    e068:	ff8007b7          	lui	a5,0xff800
    e06c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e070:	0014f513          	and	a0,s1,1
    e074:	00f977b3          	and	a5,s2,a5
    e078:	0014d713          	srl	a4,s1,0x1
    e07c:	00a76733          	or	a4,a4,a0
    e080:	01f79513          	sll	a0,a5,0x1f
    e084:	00e564b3          	or	s1,a0,a4
    e088:	0017d913          	srl	s2,a5,0x1
    e08c:	ec9ff06f          	j	df54 <__subdf3+0x144>
    e090:	01d5e833          	or	a6,a1,t4
    e094:	80198313          	add	t1,s3,-2047
    e098:	06080863          	beqz	a6,e108 <__subdf3+0x2f8>
    e09c:	06d40a63          	beq	s0,a3,e110 <__subdf3+0x300>
    e0a0:	0e030463          	beqz	t1,e188 <__subdf3+0x378>
    e0a4:	26098e63          	beqz	s3,e320 <__subdf3+0x510>
    e0a8:	00361513          	sll	a0,a2,0x3
    e0ac:	00355513          	srl	a0,a0,0x3
    e0b0:	00068413          	mv	s0,a3
    e0b4:	00058713          	mv	a4,a1
    e0b8:	01d71813          	sll	a6,a4,0x1d
    e0bc:	00a86833          	or	a6,a6,a0
    e0c0:	00375713          	srl	a4,a4,0x3
    e0c4:	01076733          	or	a4,a4,a6
    e0c8:	10070663          	beqz	a4,e1d4 <__subdf3+0x3c4>
    e0cc:	00000e13          	li	t3,0
    e0d0:	7ff00793          	li	a5,2047
    e0d4:	00080737          	lui	a4,0x80
    e0d8:	00000813          	li	a6,0
    e0dc:	ed9ff06f          	j	dfb4 <__subdf3+0x1a4>
    e0e0:	01d5e6b3          	or	a3,a1,t4
    e0e4:	18068663          	beqz	a3,e270 <__subdf3+0x460>
    e0e8:	fff78693          	add	a3,a5,-1
    e0ec:	3a068263          	beqz	a3,e490 <__subdf3+0x680>
    e0f0:	16678463          	beq	a5,t1,e258 <__subdf3+0x448>
    e0f4:	03800793          	li	a5,56
    e0f8:	00100513          	li	a0,1
    e0fc:	dcd7cee3          	blt	a5,a3,ded8 <__subdf3+0xc8>
    e100:	00068793          	mv	a5,a3
    e104:	da5ff06f          	j	dea8 <__subdf3+0x98>
    e108:	0016c693          	xor	a3,a3,1
    e10c:	f8d41ae3          	bne	s0,a3,e0a0 <__subdf3+0x290>
    e110:	18030863          	beqz	t1,e2a0 <__subdf3+0x490>
    e114:	2c099063          	bnez	s3,e3d4 <__subdf3+0x5c4>
    e118:	7ff00793          	li	a5,2047
    e11c:	011766b3          	or	a3,a4,a7
    e120:	48068863          	beqz	a3,e5b0 <__subdf3+0x7a0>
    e124:	fff78693          	add	a3,a5,-1
    e128:	34068263          	beqz	a3,e46c <__subdf3+0x65c>
    e12c:	7ff00513          	li	a0,2047
    e130:	2aa78263          	beq	a5,a0,e3d4 <__subdf3+0x5c4>
    e134:	03800793          	li	a5,56
    e138:	00100913          	li	s2,1
    e13c:	02d7ca63          	blt	a5,a3,e170 <__subdf3+0x360>
    e140:	01f00793          	li	a5,31
    e144:	4cd7c663          	blt	a5,a3,e610 <__subdf3+0x800>
    e148:	02000793          	li	a5,32
    e14c:	40d787b3          	sub	a5,a5,a3
    e150:	00f71933          	sll	s2,a4,a5
    e154:	00d8d633          	srl	a2,a7,a3
    e158:	00f897b3          	sll	a5,a7,a5
    e15c:	00c96933          	or	s2,s2,a2
    e160:	00f037b3          	snez	a5,a5
    e164:	00d756b3          	srl	a3,a4,a3
    e168:	00f96933          	or	s2,s2,a5
    e16c:	00d585b3          	add	a1,a1,a3
    e170:	01d90733          	add	a4,s2,t4
    e174:	01273933          	sltu	s2,a4,s2
    e178:	00070493          	mv	s1,a4
    e17c:	00b90933          	add	s2,s2,a1
    e180:	000f0993          	mv	s3,t5
    e184:	ed1ff06f          	j	e054 <__subdf3+0x244>
    e188:	00198793          	add	a5,s3,1
    e18c:	7fe7f793          	and	a5,a5,2046
    e190:	14079463          	bnez	a5,e2d8 <__subdf3+0x4c8>
    e194:	01d5e833          	or	a6,a1,t4
    e198:	011767b3          	or	a5,a4,a7
    e19c:	2a099463          	bnez	s3,e444 <__subdf3+0x634>
    e1a0:	38078e63          	beqz	a5,e53c <__subdf3+0x72c>
    e1a4:	3c081063          	bnez	a6,e564 <__subdf3+0x754>
    e1a8:	00351513          	sll	a0,a0,0x3
    e1ac:	00355913          	srl	s2,a0,0x3
    e1b0:	00000793          	li	a5,0
    e1b4:	1140006f          	j	e2c8 <__subdf3+0x4b8>
    e1b8:	0a698063          	beq	s3,t1,e258 <__subdf3+0x448>
    e1bc:	03800693          	li	a3,56
    e1c0:	00100913          	li	s2,1
    e1c4:	e8f6c0e3          	blt	a3,a5,e044 <__subdf3+0x234>
    e1c8:	008006b7          	lui	a3,0x800
    e1cc:	00d5e5b3          	or	a1,a1,a3
    e1d0:	e45ff06f          	j	e014 <__subdf3+0x204>
    e1d4:	00147e13          	and	t3,s0,1
    e1d8:	7ff00793          	li	a5,2047
    e1dc:	00000713          	li	a4,0
    e1e0:	00000813          	li	a6,0
    e1e4:	dd1ff06f          	j	dfb4 <__subdf3+0x1a4>
    e1e8:	00048513          	mv	a0,s1
    e1ec:	4cd000ef          	jal	eeb8 <__clzsi2>
    e1f0:	01850793          	add	a5,a0,24
    e1f4:	01f00693          	li	a3,31
    e1f8:	d0f6dae3          	bge	a3,a5,df0c <__subdf3+0xfc>
    e1fc:	ff850713          	add	a4,a0,-8
    e200:	00e49733          	sll	a4,s1,a4
    e204:	1b37ce63          	blt	a5,s3,e3c0 <__subdf3+0x5b0>
    e208:	413789b3          	sub	s3,a5,s3
    e20c:	00198793          	add	a5,s3,1
    e210:	42f6de63          	bge	a3,a5,e64c <__subdf3+0x83c>
    e214:	fe198993          	add	s3,s3,-31
    e218:	02000693          	li	a3,32
    e21c:	013754b3          	srl	s1,a4,s3
    e220:	00d78c63          	beq	a5,a3,e238 <__subdf3+0x428>
    e224:	04000693          	li	a3,64
    e228:	40f687b3          	sub	a5,a3,a5
    e22c:	00f71733          	sll	a4,a4,a5
    e230:	00e03733          	snez	a4,a4
    e234:	00e4e4b3          	or	s1,s1,a4
    e238:	00000993          	li	s3,0
    e23c:	0074f793          	and	a5,s1,7
    e240:	d0079ee3          	bnez	a5,df5c <__subdf3+0x14c>
    e244:	00098793          	mv	a5,s3
    e248:	0034d513          	srl	a0,s1,0x3
    e24c:	00090713          	mv	a4,s2
    e250:	0280006f          	j	e278 <__subdf3+0x468>
    e254:	e6081ce3          	bnez	a6,e0cc <__subdf3+0x2bc>
    e258:	00351513          	sll	a0,a0,0x3
    e25c:	01d71813          	sll	a6,a4,0x1d
    e260:	00355513          	srl	a0,a0,0x3
    e264:	00a86833          	or	a6,a6,a0
    e268:	00375713          	srl	a4,a4,0x3
    e26c:	e59ff06f          	j	e0c4 <__subdf3+0x2b4>
    e270:	00351513          	sll	a0,a0,0x3
    e274:	00355513          	srl	a0,a0,0x3
    e278:	01d71813          	sll	a6,a4,0x1d
    e27c:	7ff00693          	li	a3,2047
    e280:	00a86833          	or	a6,a6,a0
    e284:	00375713          	srl	a4,a4,0x3
    e288:	e2d78ee3          	beq	a5,a3,e0c4 <__subdf3+0x2b4>
    e28c:	00c71713          	sll	a4,a4,0xc
    e290:	00c75713          	srl	a4,a4,0xc
    e294:	7ff7f793          	and	a5,a5,2047
    e298:	00147e13          	and	t3,s0,1
    e29c:	d19ff06f          	j	dfb4 <__subdf3+0x1a4>
    e2a0:	00198693          	add	a3,s3,1
    e2a4:	7fe6f793          	and	a5,a3,2046
    e2a8:	12079e63          	bnez	a5,e3e4 <__subdf3+0x5d4>
    e2ac:	011767b3          	or	a5,a4,a7
    e2b0:	24099a63          	bnez	s3,e504 <__subdf3+0x6f4>
    e2b4:	30078663          	beqz	a5,e5c0 <__subdf3+0x7b0>
    e2b8:	01d5e7b3          	or	a5,a1,t4
    e2bc:	30079a63          	bnez	a5,e5d0 <__subdf3+0x7c0>
    e2c0:	00351513          	sll	a0,a0,0x3
    e2c4:	00355913          	srl	s2,a0,0x3
    e2c8:	01d71813          	sll	a6,a4,0x1d
    e2cc:	01286833          	or	a6,a6,s2
    e2d0:	00375713          	srl	a4,a4,0x3
    e2d4:	fb9ff06f          	j	e28c <__subdf3+0x47c>
    e2d8:	41d88833          	sub	a6,a7,t4
    e2dc:	0108b7b3          	sltu	a5,a7,a6
    e2e0:	40b70933          	sub	s2,a4,a1
    e2e4:	40f90933          	sub	s2,s2,a5
    e2e8:	00891793          	sll	a5,s2,0x8
    e2ec:	00080493          	mv	s1,a6
    e2f0:	1207c263          	bltz	a5,e414 <__subdf3+0x604>
    e2f4:	01286833          	or	a6,a6,s2
    e2f8:	c00812e3          	bnez	a6,defc <__subdf3+0xec>
    e2fc:	00000e13          	li	t3,0
    e300:	00000793          	li	a5,0
    e304:	00000713          	li	a4,0
    e308:	cadff06f          	j	dfb4 <__subdf3+0x1a4>
    e30c:	ff800937          	lui	s2,0xff800
    e310:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e314:	40f989b3          	sub	s3,s3,a5
    e318:	01277933          	and	s2,a4,s2
    e31c:	c39ff06f          	j	df54 <__subdf3+0x144>
    e320:	7ff00793          	li	a5,2047
    e324:	01176533          	or	a0,a4,a7
    e328:	10050463          	beqz	a0,e430 <__subdf3+0x620>
    e32c:	fff78813          	add	a6,a5,-1
    e330:	1e080263          	beqz	a6,e514 <__subdf3+0x704>
    e334:	7ff00513          	li	a0,2047
    e338:	d6a788e3          	beq	a5,a0,e0a8 <__subdf3+0x298>
    e33c:	03800793          	li	a5,56
    e340:	00068413          	mv	s0,a3
    e344:	00100513          	li	a0,1
    e348:	0307ca63          	blt	a5,a6,e37c <__subdf3+0x56c>
    e34c:	01f00793          	li	a5,31
    e350:	1907c463          	blt	a5,a6,e4d8 <__subdf3+0x6c8>
    e354:	02000793          	li	a5,32
    e358:	410787b3          	sub	a5,a5,a6
    e35c:	00f71533          	sll	a0,a4,a5
    e360:	0108d6b3          	srl	a3,a7,a6
    e364:	00f897b3          	sll	a5,a7,a5
    e368:	00d56533          	or	a0,a0,a3
    e36c:	00f037b3          	snez	a5,a5
    e370:	01075833          	srl	a6,a4,a6
    e374:	00f56533          	or	a0,a0,a5
    e378:	410585b3          	sub	a1,a1,a6
    e37c:	40ae8533          	sub	a0,t4,a0
    e380:	00aeb733          	sltu	a4,t4,a0
    e384:	00050493          	mv	s1,a0
    e388:	40e58933          	sub	s2,a1,a4
    e38c:	000f0993          	mv	s3,t5
    e390:	b59ff06f          	j	dee8 <__subdf3+0xd8>
    e394:	fe078693          	add	a3,a5,-32
    e398:	02000613          	li	a2,32
    e39c:	00d5d6b3          	srl	a3,a1,a3
    e3a0:	00c78a63          	beq	a5,a2,e3b4 <__subdf3+0x5a4>
    e3a4:	04000613          	li	a2,64
    e3a8:	40f607b3          	sub	a5,a2,a5
    e3ac:	00f597b3          	sll	a5,a1,a5
    e3b0:	00feeeb3          	or	t4,t4,a5
    e3b4:	01d03533          	snez	a0,t4
    e3b8:	00d56533          	or	a0,a0,a3
    e3bc:	b1dff06f          	j	ded8 <__subdf3+0xc8>
    e3c0:	ff8006b7          	lui	a3,0xff800
    e3c4:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e3c8:	40f987b3          	sub	a5,s3,a5
    e3cc:	00d77733          	and	a4,a4,a3
    e3d0:	ef9ff06f          	j	e2c8 <__subdf3+0x4b8>
    e3d4:	00361513          	sll	a0,a2,0x3
    e3d8:	00355513          	srl	a0,a0,0x3
    e3dc:	00058713          	mv	a4,a1
    e3e0:	cd9ff06f          	j	e0b8 <__subdf3+0x2a8>
    e3e4:	7ff00793          	li	a5,2047
    e3e8:	def686e3          	beq	a3,a5,e1d4 <__subdf3+0x3c4>
    e3ec:	01d88eb3          	add	t4,a7,t4
    e3f0:	011eb633          	sltu	a2,t4,a7
    e3f4:	00b707b3          	add	a5,a4,a1
    e3f8:	00c787b3          	add	a5,a5,a2
    e3fc:	01f79513          	sll	a0,a5,0x1f
    e400:	001ede93          	srl	t4,t4,0x1
    e404:	01d564b3          	or	s1,a0,t4
    e408:	0017d913          	srl	s2,a5,0x1
    e40c:	00068993          	mv	s3,a3
    e410:	b45ff06f          	j	df54 <__subdf3+0x144>
    e414:	411e8633          	sub	a2,t4,a7
    e418:	40e587b3          	sub	a5,a1,a4
    e41c:	00ceb733          	sltu	a4,t4,a2
    e420:	00060493          	mv	s1,a2
    e424:	40e78933          	sub	s2,a5,a4
    e428:	00068413          	mv	s0,a3
    e42c:	ad1ff06f          	j	defc <__subdf3+0xec>
    e430:	00361613          	sll	a2,a2,0x3
    e434:	00365513          	srl	a0,a2,0x3
    e438:	00068413          	mv	s0,a3
    e43c:	00058713          	mv	a4,a1
    e440:	e39ff06f          	j	e278 <__subdf3+0x468>
    e444:	e00798e3          	bnez	a5,e254 <__subdf3+0x444>
    e448:	22080663          	beqz	a6,e674 <__subdf3+0x864>
    e44c:	0035d713          	srl	a4,a1,0x3
    e450:	00361613          	sll	a2,a2,0x3
    e454:	01d59593          	sll	a1,a1,0x1d
    e458:	00b76733          	or	a4,a4,a1
    e45c:	00365613          	srl	a2,a2,0x3
    e460:	00c76733          	or	a4,a4,a2
    e464:	00068413          	mv	s0,a3
    e468:	c61ff06f          	j	e0c8 <__subdf3+0x2b8>
    e46c:	01d88eb3          	add	t4,a7,t4
    e470:	00b705b3          	add	a1,a4,a1
    e474:	011eb633          	sltu	a2,t4,a7
    e478:	00c58933          	add	s2,a1,a2
    e47c:	00891793          	sll	a5,s2,0x8
    e480:	000e8493          	mv	s1,t4
    e484:	0a07d863          	bgez	a5,e534 <__subdf3+0x724>
    e488:	00200993          	li	s3,2
    e48c:	bddff06f          	j	e068 <__subdf3+0x258>
    e490:	41d88eb3          	sub	t4,a7,t4
    e494:	40b705b3          	sub	a1,a4,a1
    e498:	01d8b633          	sltu	a2,a7,t4
    e49c:	000e8493          	mv	s1,t4
    e4a0:	40c58933          	sub	s2,a1,a2
    e4a4:	00100993          	li	s3,1
    e4a8:	a41ff06f          	j	dee8 <__subdf3+0xd8>
    e4ac:	fe078693          	add	a3,a5,-32
    e4b0:	02000613          	li	a2,32
    e4b4:	00d5d6b3          	srl	a3,a1,a3
    e4b8:	00c78a63          	beq	a5,a2,e4cc <__subdf3+0x6bc>
    e4bc:	04000613          	li	a2,64
    e4c0:	40f607b3          	sub	a5,a2,a5
    e4c4:	00f597b3          	sll	a5,a1,a5
    e4c8:	00feeeb3          	or	t4,t4,a5
    e4cc:	01d03933          	snez	s2,t4
    e4d0:	00d96933          	or	s2,s2,a3
    e4d4:	b71ff06f          	j	e044 <__subdf3+0x234>
    e4d8:	fe080793          	add	a5,a6,-32
    e4dc:	02000693          	li	a3,32
    e4e0:	00f757b3          	srl	a5,a4,a5
    e4e4:	00d80a63          	beq	a6,a3,e4f8 <__subdf3+0x6e8>
    e4e8:	04000693          	li	a3,64
    e4ec:	410686b3          	sub	a3,a3,a6
    e4f0:	00d71733          	sll	a4,a4,a3
    e4f4:	00e8e8b3          	or	a7,a7,a4
    e4f8:	01103533          	snez	a0,a7
    e4fc:	00f56533          	or	a0,a0,a5
    e500:	e7dff06f          	j	e37c <__subdf3+0x56c>
    e504:	ec0788e3          	beqz	a5,e3d4 <__subdf3+0x5c4>
    e508:	01d5eeb3          	or	t4,a1,t4
    e50c:	bc0e90e3          	bnez	t4,e0cc <__subdf3+0x2bc>
    e510:	d49ff06f          	j	e258 <__subdf3+0x448>
    e514:	411e8633          	sub	a2,t4,a7
    e518:	40e585b3          	sub	a1,a1,a4
    e51c:	00ceb733          	sltu	a4,t4,a2
    e520:	00060493          	mv	s1,a2
    e524:	40e58933          	sub	s2,a1,a4
    e528:	00068413          	mv	s0,a3
    e52c:	00100993          	li	s3,1
    e530:	9b9ff06f          	j	dee8 <__subdf3+0xd8>
    e534:	00100793          	li	a5,1
    e538:	d11ff06f          	j	e248 <__subdf3+0x438>
    e53c:	dc0800e3          	beqz	a6,e2fc <__subdf3+0x4ec>
    e540:	00361613          	sll	a2,a2,0x3
    e544:	00365793          	srl	a5,a2,0x3
    e548:	01d59813          	sll	a6,a1,0x1d
    e54c:	00959713          	sll	a4,a1,0x9
    e550:	00f86833          	or	a6,a6,a5
    e554:	00c75713          	srl	a4,a4,0xc
    e558:	00068e13          	mv	t3,a3
    e55c:	00000793          	li	a5,0
    e560:	a55ff06f          	j	dfb4 <__subdf3+0x1a4>
    e564:	41d88933          	sub	s2,a7,t4
    e568:	0128b7b3          	sltu	a5,a7,s2
    e56c:	40b70633          	sub	a2,a4,a1
    e570:	40f60633          	sub	a2,a2,a5
    e574:	00861793          	sll	a5,a2,0x8
    e578:	0e07d263          	bgez	a5,e65c <__subdf3+0x84c>
    e57c:	411e8633          	sub	a2,t4,a7
    e580:	40e58733          	sub	a4,a1,a4
    e584:	00cebeb3          	sltu	t4,t4,a2
    e588:	41d70733          	sub	a4,a4,t4
    e58c:	00871793          	sll	a5,a4,0x8
    e590:	00060493          	mv	s1,a2
    e594:	1207de63          	bgez	a5,e6d0 <__subdf3+0x8c0>
    e598:	ff8007b7          	lui	a5,0xff800
    e59c:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e5a0:	00f77733          	and	a4,a4,a5
    e5a4:	00068413          	mv	s0,a3
    e5a8:	00100793          	li	a5,1
    e5ac:	9f1ff06f          	j	df9c <__subdf3+0x18c>
    e5b0:	00361613          	sll	a2,a2,0x3
    e5b4:	00365513          	srl	a0,a2,0x3
    e5b8:	00058713          	mv	a4,a1
    e5bc:	cbdff06f          	j	e278 <__subdf3+0x468>
    e5c0:	00361613          	sll	a2,a2,0x3
    e5c4:	00365913          	srl	s2,a2,0x3
    e5c8:	00058713          	mv	a4,a1
    e5cc:	cfdff06f          	j	e2c8 <__subdf3+0x4b8>
    e5d0:	01d886b3          	add	a3,a7,t4
    e5d4:	00b707b3          	add	a5,a4,a1
    e5d8:	0116b633          	sltu	a2,a3,a7
    e5dc:	00c787b3          	add	a5,a5,a2
    e5e0:	00879713          	sll	a4,a5,0x8
    e5e4:	0036d813          	srl	a6,a3,0x3
    e5e8:	08075e63          	bgez	a4,e684 <__subdf3+0x874>
    e5ec:	ff800737          	lui	a4,0xff800
    e5f0:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e5f4:	00e7f7b3          	and	a5,a5,a4
    e5f8:	01d79713          	sll	a4,a5,0x1d
    e5fc:	00979793          	sll	a5,a5,0x9
    e600:	01076833          	or	a6,a4,a6
    e604:	00c7d713          	srl	a4,a5,0xc
    e608:	00100793          	li	a5,1
    e60c:	9a9ff06f          	j	dfb4 <__subdf3+0x1a4>
    e610:	fe068793          	add	a5,a3,-32
    e614:	02000613          	li	a2,32
    e618:	00f757b3          	srl	a5,a4,a5
    e61c:	00c68a63          	beq	a3,a2,e630 <__subdf3+0x820>
    e620:	04000613          	li	a2,64
    e624:	40d606b3          	sub	a3,a2,a3
    e628:	00d71733          	sll	a4,a4,a3
    e62c:	00e8e8b3          	or	a7,a7,a4
    e630:	01103933          	snez	s2,a7
    e634:	00f96933          	or	s2,s2,a5
    e638:	b39ff06f          	j	e170 <__subdf3+0x360>
    e63c:	0034d513          	srl	a0,s1,0x3
    e640:	00098793          	mv	a5,s3
    e644:	00090713          	mv	a4,s2
    e648:	c31ff06f          	j	e278 <__subdf3+0x468>
    e64c:	02000693          	li	a3,32
    e650:	40f686b3          	sub	a3,a3,a5
    e654:	00000613          	li	a2,0
    e658:	8e9ff06f          	j	df40 <__subdf3+0x130>
    e65c:	00c96833          	or	a6,s2,a2
    e660:	c8080ee3          	beqz	a6,e2fc <__subdf3+0x4ec>
    e664:	00395913          	srl	s2,s2,0x3
    e668:	00000793          	li	a5,0
    e66c:	00060713          	mv	a4,a2
    e670:	c59ff06f          	j	e2c8 <__subdf3+0x4b8>
    e674:	00000e13          	li	t3,0
    e678:	7ff00793          	li	a5,2047
    e67c:	00080737          	lui	a4,0x80
    e680:	935ff06f          	j	dfb4 <__subdf3+0x1a4>
    e684:	01d79713          	sll	a4,a5,0x1d
    e688:	00979793          	sll	a5,a5,0x9
    e68c:	01076833          	or	a6,a4,a6
    e690:	00c7d713          	srl	a4,a5,0xc
    e694:	00000793          	li	a5,0
    e698:	91dff06f          	j	dfb4 <__subdf3+0x1a4>
    e69c:	ae0786e3          	beqz	a5,e188 <__subdf3+0x378>
    e6a0:	413f0833          	sub	a6,t5,s3
    e6a4:	00080793          	mv	a5,a6
    e6a8:	c6098ee3          	beqz	s3,e324 <__subdf3+0x514>
    e6ac:	03800793          	li	a5,56
    e6b0:	0107ca63          	blt	a5,a6,e6c4 <__subdf3+0x8b4>
    e6b4:	008007b7          	lui	a5,0x800
    e6b8:	00f76733          	or	a4,a4,a5
    e6bc:	00068413          	mv	s0,a3
    e6c0:	c8dff06f          	j	e34c <__subdf3+0x53c>
    e6c4:	00068413          	mv	s0,a3
    e6c8:	00100513          	li	a0,1
    e6cc:	cb1ff06f          	j	e37c <__subdf3+0x56c>
    e6d0:	01d71813          	sll	a6,a4,0x1d
    e6d4:	00365613          	srl	a2,a2,0x3
    e6d8:	00c86833          	or	a6,a6,a2
    e6dc:	00375713          	srl	a4,a4,0x3
    e6e0:	00000793          	li	a5,0
    e6e4:	00068413          	mv	s0,a3
    e6e8:	ba5ff06f          	j	e28c <__subdf3+0x47c>
    e6ec:	ba078ae3          	beqz	a5,e2a0 <__subdf3+0x490>
    e6f0:	413f06b3          	sub	a3,t5,s3
    e6f4:	00099663          	bnez	s3,e700 <__subdf3+0x8f0>
    e6f8:	00068793          	mv	a5,a3
    e6fc:	a21ff06f          	j	e11c <__subdf3+0x30c>
    e700:	03800793          	li	a5,56
    e704:	00100913          	li	s2,1
    e708:	a6d7c4e3          	blt	a5,a3,e170 <__subdf3+0x360>
    e70c:	008007b7          	lui	a5,0x800
    e710:	00f76733          	or	a4,a4,a5
    e714:	a2dff06f          	j	e140 <__subdf3+0x330>

0000e718 <__unorddf2>:
    e718:	0145d713          	srl	a4,a1,0x14
    e71c:	001007b7          	lui	a5,0x100
    e720:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e724:	fff74713          	not	a4,a4
    e728:	0146d813          	srl	a6,a3,0x14
    e72c:	00b7f5b3          	and	a1,a5,a1
    e730:	00d7f7b3          	and	a5,a5,a3
    e734:	01571693          	sll	a3,a4,0x15
    e738:	7ff87813          	and	a6,a6,2047
    e73c:	02068063          	beqz	a3,e75c <__unorddf2+0x44>
    e740:	7ff00713          	li	a4,2047
    e744:	00000513          	li	a0,0
    e748:	00e80463          	beq	a6,a4,e750 <__unorddf2+0x38>
    e74c:	00008067          	ret
    e750:	00c7e7b3          	or	a5,a5,a2
    e754:	00f03533          	snez	a0,a5
    e758:	00008067          	ret
    e75c:	00a5e5b3          	or	a1,a1,a0
    e760:	00100513          	li	a0,1
    e764:	fc058ee3          	beqz	a1,e740 <__unorddf2+0x28>
    e768:	00008067          	ret

0000e76c <__fixdfsi>:
    e76c:	0145d793          	srl	a5,a1,0x14
    e770:	001006b7          	lui	a3,0x100
    e774:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e778:	7ff7f793          	and	a5,a5,2047
    e77c:	3fe00613          	li	a2,1022
    e780:	00b77733          	and	a4,a4,a1
    e784:	01f5d593          	srl	a1,a1,0x1f
    e788:	00f65e63          	bge	a2,a5,e7a4 <__fixdfsi+0x38>
    e78c:	41d00613          	li	a2,1053
    e790:	00f65e63          	bge	a2,a5,e7ac <__fixdfsi+0x40>
    e794:	80000537          	lui	a0,0x80000
    e798:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e79c:	00a58533          	add	a0,a1,a0
    e7a0:	00008067          	ret
    e7a4:	00000513          	li	a0,0
    e7a8:	00008067          	ret
    e7ac:	43300613          	li	a2,1075
    e7b0:	40f60633          	sub	a2,a2,a5
    e7b4:	01f00813          	li	a6,31
    e7b8:	00d76733          	or	a4,a4,a3
    e7bc:	02c85063          	bge	a6,a2,e7dc <__fixdfsi+0x70>
    e7c0:	41300693          	li	a3,1043
    e7c4:	40f687b3          	sub	a5,a3,a5
    e7c8:	00f75733          	srl	a4,a4,a5
    e7cc:	40e00533          	neg	a0,a4
    e7d0:	fc059ce3          	bnez	a1,e7a8 <__fixdfsi+0x3c>
    e7d4:	00070513          	mv	a0,a4
    e7d8:	00008067          	ret
    e7dc:	bed78793          	add	a5,a5,-1043
    e7e0:	00f71733          	sll	a4,a4,a5
    e7e4:	00c55533          	srl	a0,a0,a2
    e7e8:	00a76733          	or	a4,a4,a0
    e7ec:	fe1ff06f          	j	e7cc <__fixdfsi+0x60>

0000e7f0 <__floatsidf>:
    e7f0:	ff010113          	add	sp,sp,-16
    e7f4:	00112623          	sw	ra,12(sp)
    e7f8:	00812423          	sw	s0,8(sp)
    e7fc:	00912223          	sw	s1,4(sp)
    e800:	04050a63          	beqz	a0,e854 <__floatsidf+0x64>
    e804:	41f55713          	sra	a4,a0,0x1f
    e808:	00a744b3          	xor	s1,a4,a0
    e80c:	40e484b3          	sub	s1,s1,a4
    e810:	00050793          	mv	a5,a0
    e814:	00048513          	mv	a0,s1
    e818:	01f7d413          	srl	s0,a5,0x1f
    e81c:	69c000ef          	jal	eeb8 <__clzsi2>
    e820:	41e00793          	li	a5,1054
    e824:	40a787b3          	sub	a5,a5,a0
    e828:	00a00713          	li	a4,10
    e82c:	7ff7f793          	and	a5,a5,2047
    e830:	06a74063          	blt	a4,a0,e890 <__floatsidf+0xa0>
    e834:	00b00713          	li	a4,11
    e838:	40a70733          	sub	a4,a4,a0
    e83c:	00e4d733          	srl	a4,s1,a4
    e840:	01550513          	add	a0,a0,21
    e844:	00c71713          	sll	a4,a4,0xc
    e848:	00a494b3          	sll	s1,s1,a0
    e84c:	00c75713          	srl	a4,a4,0xc
    e850:	0140006f          	j	e864 <__floatsidf+0x74>
    e854:	00000413          	li	s0,0
    e858:	00000793          	li	a5,0
    e85c:	00000713          	li	a4,0
    e860:	00000493          	li	s1,0
    e864:	01479793          	sll	a5,a5,0x14
    e868:	01f41413          	sll	s0,s0,0x1f
    e86c:	00e7e7b3          	or	a5,a5,a4
    e870:	00c12083          	lw	ra,12(sp)
    e874:	0087e7b3          	or	a5,a5,s0
    e878:	00812403          	lw	s0,8(sp)
    e87c:	00048513          	mv	a0,s1
    e880:	00078593          	mv	a1,a5
    e884:	00412483          	lw	s1,4(sp)
    e888:	01010113          	add	sp,sp,16
    e88c:	00008067          	ret
    e890:	ff550513          	add	a0,a0,-11
    e894:	00a49733          	sll	a4,s1,a0
    e898:	00c71713          	sll	a4,a4,0xc
    e89c:	00c75713          	srl	a4,a4,0xc
    e8a0:	00000493          	li	s1,0
    e8a4:	fc1ff06f          	j	e864 <__floatsidf+0x74>

0000e8a8 <__floatunsidf>:
    e8a8:	ff010113          	add	sp,sp,-16
    e8ac:	00812423          	sw	s0,8(sp)
    e8b0:	00112623          	sw	ra,12(sp)
    e8b4:	00050413          	mv	s0,a0
    e8b8:	04050c63          	beqz	a0,e910 <__floatunsidf+0x68>
    e8bc:	5fc000ef          	jal	eeb8 <__clzsi2>
    e8c0:	41e00793          	li	a5,1054
    e8c4:	40a787b3          	sub	a5,a5,a0
    e8c8:	00a00713          	li	a4,10
    e8cc:	7ff7f793          	and	a5,a5,2047
    e8d0:	06a74463          	blt	a4,a0,e938 <__floatunsidf+0x90>
    e8d4:	00b00713          	li	a4,11
    e8d8:	40a70733          	sub	a4,a4,a0
    e8dc:	01550513          	add	a0,a0,21
    e8e0:	00e45733          	srl	a4,s0,a4
    e8e4:	00a41433          	sll	s0,s0,a0
    e8e8:	00c12083          	lw	ra,12(sp)
    e8ec:	00040513          	mv	a0,s0
    e8f0:	00c71713          	sll	a4,a4,0xc
    e8f4:	00812403          	lw	s0,8(sp)
    e8f8:	00c75713          	srl	a4,a4,0xc
    e8fc:	01479793          	sll	a5,a5,0x14
    e900:	00e7e7b3          	or	a5,a5,a4
    e904:	00078593          	mv	a1,a5
    e908:	01010113          	add	sp,sp,16
    e90c:	00008067          	ret
    e910:	00c12083          	lw	ra,12(sp)
    e914:	00040513          	mv	a0,s0
    e918:	00000793          	li	a5,0
    e91c:	00812403          	lw	s0,8(sp)
    e920:	00000713          	li	a4,0
    e924:	01479793          	sll	a5,a5,0x14
    e928:	00e7e7b3          	or	a5,a5,a4
    e92c:	00078593          	mv	a1,a5
    e930:	01010113          	add	sp,sp,16
    e934:	00008067          	ret
    e938:	ff550513          	add	a0,a0,-11
    e93c:	00a41733          	sll	a4,s0,a0
    e940:	00000413          	li	s0,0
    e944:	00c12083          	lw	ra,12(sp)
    e948:	00040513          	mv	a0,s0
    e94c:	00c71713          	sll	a4,a4,0xc
    e950:	00812403          	lw	s0,8(sp)
    e954:	00c75713          	srl	a4,a4,0xc
    e958:	01479793          	sll	a5,a5,0x14
    e95c:	00e7e7b3          	or	a5,a5,a4
    e960:	00078593          	mv	a1,a5
    e964:	01010113          	add	sp,sp,16
    e968:	00008067          	ret

0000e96c <__trunctfdf2>:
    e96c:	00c52583          	lw	a1,12(a0)
    e970:	00852783          	lw	a5,8(a0)
    e974:	00052803          	lw	a6,0(a0)
    e978:	00452683          	lw	a3,4(a0)
    e97c:	01059613          	sll	a2,a1,0x10
    e980:	fe010113          	add	sp,sp,-32
    e984:	00159713          	sll	a4,a1,0x1
    e988:	01065613          	srl	a2,a2,0x10
    e98c:	00f12423          	sw	a5,8(sp)
    e990:	00b12623          	sw	a1,12(sp)
    e994:	00f12c23          	sw	a5,24(sp)
    e998:	01012023          	sw	a6,0(sp)
    e99c:	00d12223          	sw	a3,4(sp)
    e9a0:	01012823          	sw	a6,16(sp)
    e9a4:	00d12a23          	sw	a3,20(sp)
    e9a8:	00c12e23          	sw	a2,28(sp)
    e9ac:	01175713          	srl	a4,a4,0x11
    e9b0:	01f5d593          	srl	a1,a1,0x1f
    e9b4:	01010893          	add	a7,sp,16
    e9b8:	01c10793          	add	a5,sp,28
    e9bc:	00361513          	sll	a0,a2,0x3
    e9c0:	ffc7a603          	lw	a2,-4(a5)
    e9c4:	ffc78793          	add	a5,a5,-4
    e9c8:	01d65693          	srl	a3,a2,0x1d
    e9cc:	00a6e6b3          	or	a3,a3,a0
    e9d0:	00d7a223          	sw	a3,4(a5)
    e9d4:	fef894e3          	bne	a7,a5,e9bc <__trunctfdf2+0x50>
    e9d8:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e9dc:	00381813          	sll	a6,a6,0x3
    e9e0:	01169613          	sll	a2,a3,0x11
    e9e4:	01012823          	sw	a6,16(sp)
    e9e8:	01265613          	srl	a2,a2,0x12
    e9ec:	04060263          	beqz	a2,ea30 <__trunctfdf2+0xc4>
    e9f0:	ffffc6b7          	lui	a3,0xffffc
    e9f4:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e9f8:	00d70733          	add	a4,a4,a3
    e9fc:	7fe00693          	li	a3,2046
    ea00:	10e6d463          	bge	a3,a4,eb08 <__trunctfdf2+0x19c>
    ea04:	7ff00793          	li	a5,2047
    ea08:	00000613          	li	a2,0
    ea0c:	00000693          	li	a3,0
    ea10:	01479793          	sll	a5,a5,0x14
    ea14:	01f59593          	sll	a1,a1,0x1f
    ea18:	00c7e7b3          	or	a5,a5,a2
    ea1c:	00b7e7b3          	or	a5,a5,a1
    ea20:	00068513          	mv	a0,a3
    ea24:	00078593          	mv	a1,a5
    ea28:	02010113          	add	sp,sp,32
    ea2c:	00008067          	ret
    ea30:	01412603          	lw	a2,20(sp)
    ea34:	01812883          	lw	a7,24(sp)
    ea38:	01c12503          	lw	a0,28(sp)
    ea3c:	011666b3          	or	a3,a2,a7
    ea40:	00a6e6b3          	or	a3,a3,a0
    ea44:	0106e6b3          	or	a3,a3,a6
    ea48:	04071463          	bnez	a4,ea90 <__trunctfdf2+0x124>
    ea4c:	14068263          	beqz	a3,eb90 <__trunctfdf2+0x224>
    ea50:	00500693          	li	a3,5
    ea54:	00000613          	li	a2,0
    ea58:	0036d793          	srl	a5,a3,0x3
    ea5c:	01d61693          	sll	a3,a2,0x1d
    ea60:	00f6e6b3          	or	a3,a3,a5
    ea64:	00961613          	sll	a2,a2,0x9
    ea68:	7ff77793          	and	a5,a4,2047
    ea6c:	00c65613          	srl	a2,a2,0xc
    ea70:	01479793          	sll	a5,a5,0x14
    ea74:	01f59593          	sll	a1,a1,0x1f
    ea78:	00c7e7b3          	or	a5,a5,a2
    ea7c:	00b7e7b3          	or	a5,a5,a1
    ea80:	00068513          	mv	a0,a3
    ea84:	00078593          	mv	a1,a5
    ea88:	02010113          	add	sp,sp,32
    ea8c:	00008067          	ret
    ea90:	12068463          	beqz	a3,ebb8 <__trunctfdf2+0x24c>
    ea94:	01c8d793          	srl	a5,a7,0x1c
    ea98:	00451513          	sll	a0,a0,0x4
    ea9c:	00a7e7b3          	or	a5,a5,a0
    eaa0:	008006b7          	lui	a3,0x800
    eaa4:	00d7f6b3          	and	a3,a5,a3
    eaa8:	1c068263          	beqz	a3,ec6c <__trunctfdf2+0x300>
    eaac:	ff800737          	lui	a4,0xff800
    eab0:	01c65693          	srl	a3,a2,0x1c
    eab4:	00489893          	sll	a7,a7,0x4
    eab8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    eabc:	00e7f633          	and	a2,a5,a4
    eac0:	0116e6b3          	or	a3,a3,a7
    eac4:	004007b7          	lui	a5,0x400
    eac8:	00f66633          	or	a2,a2,a5
    eacc:	ff86f693          	and	a3,a3,-8
    ead0:	00000793          	li	a5,0
    ead4:	0036d713          	srl	a4,a3,0x3
    ead8:	01d61693          	sll	a3,a2,0x1d
    eadc:	00961613          	sll	a2,a2,0x9
    eae0:	00c65613          	srl	a2,a2,0xc
    eae4:	01479793          	sll	a5,a5,0x14
    eae8:	01f59593          	sll	a1,a1,0x1f
    eaec:	00c7e7b3          	or	a5,a5,a2
    eaf0:	00e6e6b3          	or	a3,a3,a4
    eaf4:	00b7e7b3          	or	a5,a5,a1
    eaf8:	00068513          	mv	a0,a3
    eafc:	00078593          	mv	a1,a5
    eb00:	02010113          	add	sp,sp,32
    eb04:	00008067          	ret
    eb08:	0ce05c63          	blez	a4,ebe0 <__trunctfdf2+0x274>
    eb0c:	01412783          	lw	a5,20(sp)
    eb10:	01812503          	lw	a0,24(sp)
    eb14:	01c12603          	lw	a2,28(sp)
    eb18:	00479693          	sll	a3,a5,0x4
    eb1c:	0106e6b3          	or	a3,a3,a6
    eb20:	01c7d793          	srl	a5,a5,0x1c
    eb24:	00451813          	sll	a6,a0,0x4
    eb28:	00461613          	sll	a2,a2,0x4
    eb2c:	01c55513          	srl	a0,a0,0x1c
    eb30:	00d036b3          	snez	a3,a3
    eb34:	0107e7b3          	or	a5,a5,a6
    eb38:	00a66633          	or	a2,a2,a0
    eb3c:	00f6e6b3          	or	a3,a3,a5
    eb40:	0076f793          	and	a5,a3,7
    eb44:	02078063          	beqz	a5,eb64 <__trunctfdf2+0x1f8>
    eb48:	00f6f793          	and	a5,a3,15
    eb4c:	00400513          	li	a0,4
    eb50:	00a78a63          	beq	a5,a0,eb64 <__trunctfdf2+0x1f8>
    eb54:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    eb58:	00d7b6b3          	sltu	a3,a5,a3
    eb5c:	00d60633          	add	a2,a2,a3
    eb60:	00078693          	mv	a3,a5
    eb64:	008007b7          	lui	a5,0x800
    eb68:	00f677b3          	and	a5,a2,a5
    eb6c:	ee0786e3          	beqz	a5,ea58 <__trunctfdf2+0xec>
    eb70:	00170713          	add	a4,a4,1
    eb74:	7ff00793          	li	a5,2047
    eb78:	e8f706e3          	beq	a4,a5,ea04 <__trunctfdf2+0x98>
    eb7c:	ff8007b7          	lui	a5,0xff800
    eb80:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    eb84:	00f67633          	and	a2,a2,a5
    eb88:	7ff77793          	and	a5,a4,2047
    eb8c:	f49ff06f          	j	ead4 <__trunctfdf2+0x168>
    eb90:	00000793          	li	a5,0
    eb94:	00000613          	li	a2,0
    eb98:	01479793          	sll	a5,a5,0x14
    eb9c:	01f59593          	sll	a1,a1,0x1f
    eba0:	00c7e7b3          	or	a5,a5,a2
    eba4:	00b7e7b3          	or	a5,a5,a1
    eba8:	00068513          	mv	a0,a3
    ebac:	00078593          	mv	a1,a5
    ebb0:	02010113          	add	sp,sp,32
    ebb4:	00008067          	ret
    ebb8:	7ff00793          	li	a5,2047
    ebbc:	00000613          	li	a2,0
    ebc0:	01479793          	sll	a5,a5,0x14
    ebc4:	01f59593          	sll	a1,a1,0x1f
    ebc8:	00c7e7b3          	or	a5,a5,a2
    ebcc:	00b7e7b3          	or	a5,a5,a1
    ebd0:	00068513          	mv	a0,a3
    ebd4:	00078593          	mv	a1,a5
    ebd8:	02010113          	add	sp,sp,32
    ebdc:	00008067          	ret
    ebe0:	fcc00693          	li	a3,-52
    ebe4:	08d74c63          	blt	a4,a3,ec7c <__trunctfdf2+0x310>
    ebe8:	03d00693          	li	a3,61
    ebec:	40e686b3          	sub	a3,a3,a4
    ebf0:	01c12703          	lw	a4,28(sp)
    ebf4:	4056de13          	sra	t3,a3,0x5
    ebf8:	00080eb7          	lui	t4,0x80
    ebfc:	00eeeeb3          	or	t4,t4,a4
    ec00:	002e1513          	sll	a0,t3,0x2
    ec04:	01d12e23          	sw	t4,28(sp)
    ec08:	01f6f693          	and	a3,a3,31
    ec0c:	00a88833          	add	a6,a7,a0
    ec10:	00088613          	mv	a2,a7
    ec14:	00000713          	li	a4,0
    ec18:	00062303          	lw	t1,0(a2)
    ec1c:	00460613          	add	a2,a2,4
    ec20:	00676733          	or	a4,a4,t1
    ec24:	fec81ae3          	bne	a6,a2,ec18 <__trunctfdf2+0x2ac>
    ec28:	00300613          	li	a2,3
    ec2c:	41c60633          	sub	a2,a2,t3
    ec30:	04069a63          	bnez	a3,ec84 <__trunctfdf2+0x318>
    ec34:	00082803          	lw	a6,0(a6)
    ec38:	00168693          	add	a3,a3,1
    ec3c:	00478793          	add	a5,a5,4
    ec40:	ff07ae23          	sw	a6,-4(a5)
    ec44:	00d64e63          	blt	a2,a3,ec60 <__trunctfdf2+0x2f4>
    ec48:	00a78833          	add	a6,a5,a0
    ec4c:	00082803          	lw	a6,0(a6)
    ec50:	00168693          	add	a3,a3,1
    ec54:	00478793          	add	a5,a5,4
    ec58:	ff07ae23          	sw	a6,-4(a5)
    ec5c:	fed656e3          	bge	a2,a3,ec48 <__trunctfdf2+0x2dc>
    ec60:	00400793          	li	a5,4
    ec64:	41c787b3          	sub	a5,a5,t3
    ec68:	0840006f          	j	ecec <__trunctfdf2+0x380>
    ec6c:	00000593          	li	a1,0
    ec70:	7ff00793          	li	a5,2047
    ec74:	00080637          	lui	a2,0x80
    ec78:	d99ff06f          	j	ea10 <__trunctfdf2+0xa4>
    ec7c:	00000713          	li	a4,0
    ec80:	dd1ff06f          	j	ea50 <__trunctfdf2+0xe4>
    ec84:	02050813          	add	a6,a0,32
    ec88:	00280833          	add	a6,a6,sp
    ec8c:	ff082803          	lw	a6,-16(a6)
    ec90:	02000f13          	li	t5,32
    ec94:	40df0f33          	sub	t5,t5,a3
    ec98:	01e81833          	sll	a6,a6,t5
    ec9c:	01076733          	or	a4,a4,a6
    eca0:	08060e63          	beqz	a2,ed3c <__trunctfdf2+0x3d0>
    eca4:	00261813          	sll	a6,a2,0x2
    eca8:	00f80fb3          	add	t6,a6,a5
    ecac:	00a88633          	add	a2,a7,a0
    ecb0:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    ecb4:	00462303          	lw	t1,4(a2)
    ecb8:	00478793          	add	a5,a5,4
    ecbc:	00d55533          	srl	a0,a0,a3
    ecc0:	01e31333          	sll	t1,t1,t5
    ecc4:	00656533          	or	a0,a0,t1
    ecc8:	fea7ae23          	sw	a0,-4(a5)
    eccc:	00460613          	add	a2,a2,4
    ecd0:	feff90e3          	bne	t6,a5,ecb0 <__trunctfdf2+0x344>
    ecd4:	00400793          	li	a5,4
    ecd8:	41c787b3          	sub	a5,a5,t3
    ecdc:	02080613          	add	a2,a6,32
    ece0:	00260633          	add	a2,a2,sp
    ece4:	00dedeb3          	srl	t4,t4,a3
    ece8:	ffd62823          	sw	t4,-16(a2)
    ecec:	00400693          	li	a3,4
    ecf0:	40f686b3          	sub	a3,a3,a5
    ecf4:	00269693          	sll	a3,a3,0x2
    ecf8:	00279793          	sll	a5,a5,0x2
    ecfc:	00800613          	li	a2,8
    ed00:	00f888b3          	add	a7,a7,a5
    ed04:	00c6ea63          	bltu	a3,a2,ed18 <__trunctfdf2+0x3ac>
    ed08:	0008a023          	sw	zero,0(a7)
    ed0c:	0008a223          	sw	zero,4(a7)
    ed10:	ff868693          	add	a3,a3,-8
    ed14:	00888893          	add	a7,a7,8
    ed18:	00400793          	li	a5,4
    ed1c:	00f6e463          	bltu	a3,a5,ed24 <__trunctfdf2+0x3b8>
    ed20:	0008a023          	sw	zero,0(a7)
    ed24:	01012783          	lw	a5,16(sp)
    ed28:	00e03733          	snez	a4,a4
    ed2c:	01412603          	lw	a2,20(sp)
    ed30:	00f766b3          	or	a3,a4,a5
    ed34:	00000713          	li	a4,0
    ed38:	e09ff06f          	j	eb40 <__trunctfdf2+0x1d4>
    ed3c:	00100793          	li	a5,1
    ed40:	00000813          	li	a6,0
    ed44:	f99ff06f          	j	ecdc <__trunctfdf2+0x370>

0000ed48 <__mulsi3>:
    ed48:	00050613          	mv	a2,a0
    ed4c:	00000513          	li	a0,0
    ed50:	0015f693          	and	a3,a1,1
    ed54:	00068463          	beqz	a3,ed5c <__mulsi3+0x14>
    ed58:	00c50533          	add	a0,a0,a2
    ed5c:	0015d593          	srl	a1,a1,0x1
    ed60:	00161613          	sll	a2,a2,0x1
    ed64:	fe0596e3          	bnez	a1,ed50 <__mulsi3+0x8>
    ed68:	00008067          	ret

0000ed6c <__muldi3>:
    ed6c:	ff010113          	add	sp,sp,-16
    ed70:	00812423          	sw	s0,8(sp)
    ed74:	00050413          	mv	s0,a0
    ed78:	00112623          	sw	ra,12(sp)
    ed7c:	00060513          	mv	a0,a2
    ed80:	00068393          	mv	t2,a3
    ed84:	00040713          	mv	a4,s0
    ed88:	00060813          	mv	a6,a2
    ed8c:	00000793          	li	a5,0
    ed90:	00000313          	li	t1,0
    ed94:	00000f13          	li	t5,0
    ed98:	01e708b3          	add	a7,a4,t5
    ed9c:	00187e93          	and	t4,a6,1
    eda0:	00f30fb3          	add	t6,t1,a5
    eda4:	01f75e13          	srl	t3,a4,0x1f
    eda8:	00185813          	srl	a6,a6,0x1
    edac:	00e8b2b3          	sltu	t0,a7,a4
    edb0:	00179793          	sll	a5,a5,0x1
    edb4:	000e8663          	beqz	t4,edc0 <__muldi3+0x54>
    edb8:	00088f13          	mv	t5,a7
    edbc:	01f28333          	add	t1,t0,t6
    edc0:	00171713          	sll	a4,a4,0x1
    edc4:	01c7e7b3          	or	a5,a5,t3
    edc8:	fc0818e3          	bnez	a6,ed98 <__muldi3+0x2c>
    edcc:	00058663          	beqz	a1,edd8 <__muldi3+0x6c>
    edd0:	f79ff0ef          	jal	ed48 <__mulsi3>
    edd4:	00650333          	add	t1,a0,t1
    edd8:	00038a63          	beqz	t2,edec <__muldi3+0x80>
    eddc:	00040513          	mv	a0,s0
    ede0:	00038593          	mv	a1,t2
    ede4:	f65ff0ef          	jal	ed48 <__mulsi3>
    ede8:	00650333          	add	t1,a0,t1
    edec:	00c12083          	lw	ra,12(sp)
    edf0:	00812403          	lw	s0,8(sp)
    edf4:	000f0513          	mv	a0,t5
    edf8:	00030593          	mv	a1,t1
    edfc:	01010113          	add	sp,sp,16
    ee00:	00008067          	ret

0000ee04 <__divsi3>:
    ee04:	06054063          	bltz	a0,ee64 <__umodsi3+0x10>
    ee08:	0605c663          	bltz	a1,ee74 <__umodsi3+0x20>

0000ee0c <__hidden___udivsi3>:
    ee0c:	00058613          	mv	a2,a1
    ee10:	00050593          	mv	a1,a0
    ee14:	fff00513          	li	a0,-1
    ee18:	02060c63          	beqz	a2,ee50 <__hidden___udivsi3+0x44>
    ee1c:	00100693          	li	a3,1
    ee20:	00b67a63          	bgeu	a2,a1,ee34 <__hidden___udivsi3+0x28>
    ee24:	00c05863          	blez	a2,ee34 <__hidden___udivsi3+0x28>
    ee28:	00161613          	sll	a2,a2,0x1
    ee2c:	00169693          	sll	a3,a3,0x1
    ee30:	feb66ae3          	bltu	a2,a1,ee24 <__hidden___udivsi3+0x18>
    ee34:	00000513          	li	a0,0
    ee38:	00c5e663          	bltu	a1,a2,ee44 <__hidden___udivsi3+0x38>
    ee3c:	40c585b3          	sub	a1,a1,a2
    ee40:	00d56533          	or	a0,a0,a3
    ee44:	0016d693          	srl	a3,a3,0x1
    ee48:	00165613          	srl	a2,a2,0x1
    ee4c:	fe0696e3          	bnez	a3,ee38 <__hidden___udivsi3+0x2c>
    ee50:	00008067          	ret

0000ee54 <__umodsi3>:
    ee54:	00008293          	mv	t0,ra
    ee58:	fb5ff0ef          	jal	ee0c <__hidden___udivsi3>
    ee5c:	00058513          	mv	a0,a1
    ee60:	00028067          	jr	t0
    ee64:	40a00533          	neg	a0,a0
    ee68:	00b04863          	bgtz	a1,ee78 <__umodsi3+0x24>
    ee6c:	40b005b3          	neg	a1,a1
    ee70:	f9dff06f          	j	ee0c <__hidden___udivsi3>
    ee74:	40b005b3          	neg	a1,a1
    ee78:	00008293          	mv	t0,ra
    ee7c:	f91ff0ef          	jal	ee0c <__hidden___udivsi3>
    ee80:	40a00533          	neg	a0,a0
    ee84:	00028067          	jr	t0

0000ee88 <__modsi3>:
    ee88:	00008293          	mv	t0,ra
    ee8c:	0005ca63          	bltz	a1,eea0 <__modsi3+0x18>
    ee90:	00054c63          	bltz	a0,eea8 <__modsi3+0x20>
    ee94:	f79ff0ef          	jal	ee0c <__hidden___udivsi3>
    ee98:	00058513          	mv	a0,a1
    ee9c:	00028067          	jr	t0
    eea0:	40b005b3          	neg	a1,a1
    eea4:	fe0558e3          	bgez	a0,ee94 <__modsi3+0xc>
    eea8:	40a00533          	neg	a0,a0
    eeac:	f61ff0ef          	jal	ee0c <__hidden___udivsi3>
    eeb0:	40b00533          	neg	a0,a1
    eeb4:	00028067          	jr	t0

0000eeb8 <__clzsi2>:
    eeb8:	000107b7          	lui	a5,0x10
    eebc:	02f57a63          	bgeu	a0,a5,eef0 <__clzsi2+0x38>
    eec0:	10053793          	sltiu	a5,a0,256
    eec4:	0017b793          	seqz	a5,a5
    eec8:	00379793          	sll	a5,a5,0x3
    eecc:	02000713          	li	a4,32
    eed0:	40f70733          	sub	a4,a4,a5
    eed4:	00f55533          	srl	a0,a0,a5
    eed8:	00001797          	auipc	a5,0x1
    eedc:	9e078793          	add	a5,a5,-1568 # f8b8 <__clz_tab>
    eee0:	00a787b3          	add	a5,a5,a0
    eee4:	0007c503          	lbu	a0,0(a5)
    eee8:	40a70533          	sub	a0,a4,a0
    eeec:	00008067          	ret
    eef0:	010007b7          	lui	a5,0x1000
    eef4:	02f57463          	bgeu	a0,a5,ef1c <__clzsi2+0x64>
    eef8:	01000793          	li	a5,16
    eefc:	00f55533          	srl	a0,a0,a5
    ef00:	00001797          	auipc	a5,0x1
    ef04:	9b878793          	add	a5,a5,-1608 # f8b8 <__clz_tab>
    ef08:	00a787b3          	add	a5,a5,a0
    ef0c:	0007c503          	lbu	a0,0(a5)
    ef10:	01000713          	li	a4,16
    ef14:	40a70533          	sub	a0,a4,a0
    ef18:	00008067          	ret
    ef1c:	01800793          	li	a5,24
    ef20:	00f55533          	srl	a0,a0,a5
    ef24:	00001797          	auipc	a5,0x1
    ef28:	99478793          	add	a5,a5,-1644 # f8b8 <__clz_tab>
    ef2c:	00a787b3          	add	a5,a5,a0
    ef30:	0007c503          	lbu	a0,0(a5)
    ef34:	00800713          	li	a4,8
    ef38:	40a70533          	sub	a0,a4,a0
    ef3c:	00008067          	ret
