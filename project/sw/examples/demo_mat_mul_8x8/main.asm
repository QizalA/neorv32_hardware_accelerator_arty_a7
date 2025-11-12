
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
      1c:	80028293          	add	t0,t0,-2048 # 1800 <_malloc_r+0x250>
      20:	30029073          	csrw	mstatus,t0
      24:	00000317          	auipc	t1,0x0
      28:	18030313          	add	t1,t1,384 # 1a4 <__crt0_trap>
      2c:	30531073          	csrw	mtvec,t1
      30:	30401073          	csrw	mie,zero
      34:	00010397          	auipc	t2,0x10
      38:	83c38393          	add	t2,t2,-1988 # f870 <__crt0_copy_data_src_begin>
      3c:	80000417          	auipc	s0,0x80000
      40:	fc440413          	add	s0,s0,-60 # 80000000 <_impure_data>
      44:	80000497          	auipc	s1,0x80000
      48:	6d048493          	add	s1,s1,1744 # 80000714 <curr_heap.0>
      4c:	80000517          	auipc	a0,0x80000
      50:	6c850513          	add	a0,a0,1736 # 80000714 <curr_heap.0>
      54:	80001597          	auipc	a1,0x80001
      58:	88058593          	add	a1,a1,-1920 # 800008d4 <__crt0_bss_end>
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
     110:	cec40413          	add	s0,s0,-788 # edf8 <__fini_array_end>
     114:	0000f497          	auipc	s1,0xf
     118:	ce448493          	add	s1,s1,-796 # edf8 <__fini_array_end>

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
     178:	c8440413          	add	s0,s0,-892 # edf8 <__fini_array_end>
     17c:	0000f497          	auipc	s1,0xf
     180:	c7c48493          	add	s1,s1,-900 # edf8 <__fini_array_end>

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

/* -------------- CSRs -------------- */
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
     218:	df850513          	add	a0,a0,-520 # edf8 <__fini_array_end>
     21c:	2850006f          	j	ca0 <printf>
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
     240:	1e50e0ef          	jal	ec24 <__muldi3>
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
     270:	1bc0b0ef          	jal	b42c <__udivdi3>
     274:	3e800613          	li	a2,1000
     278:	00000693          	li	a3,0
     27c:	00050493          	mv	s1,a0
     280:	00058413          	mv	s0,a1
     284:	0550b0ef          	jal	bad8 <__umoddi3>
     288:	00a12623          	sw	a0,12(sp)
     28c:	00b12423          	sw	a1,8(sp)
     290:	3e800613          	li	a2,1000
     294:	00000693          	li	a3,0
     298:	00048513          	mv	a0,s1
     29c:	00040593          	mv	a1,s0
     2a0:	18c0b0ef          	jal	b42c <__udivdi3>
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
     2c4:	e0450513          	add	a0,a0,-508 # ee04 <__fini_array_end+0xc>
}
     2c8:	02010113          	add	sp,sp,32
  uint64_t s=(num*1000ull+den/2)/den; printf("%4" PRIu64 ".%03" PRIu64 "x",s/1000,s%1000);
     2cc:	1d50006f          	j	ca0 <printf>

000002d0 <main>:
}
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }

/* -------------- Main -------------- */
int main(void){
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
     2d0:	0000f537          	lui	a0,0xf
int main(void){
     2d4:	ba010113          	add	sp,sp,-1120
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
     2d8:	00800613          	li	a2,8
     2dc:	00800593          	li	a1,8
     2e0:	e2450513          	add	a0,a0,-476 # ee24 <__fini_array_end+0x2c>
int main(void){
     2e4:	44112e23          	sw	ra,1116(sp)
     2e8:	45612023          	sw	s6,1088(sp)
     2ec:	44812c23          	sw	s0,1112(sp)
     2f0:	44912a23          	sw	s1,1108(sp)
     2f4:	45212823          	sw	s2,1104(sp)
     2f8:	45312623          	sw	s3,1100(sp)
     2fc:	45412423          	sw	s4,1096(sp)
     300:	45512223          	sw	s5,1092(sp)
     304:	43712e23          	sw	s7,1084(sp)
     308:	43812c23          	sw	s8,1080(sp)
     30c:	43912a23          	sw	s9,1076(sp)
     310:	43a12823          	sw	s10,1072(sp)
     314:	43b12623          	sw	s11,1068(sp)
  printf("== %dx%d GEMM: SW vs CFU vs CFS ==\n", N, N);
     318:	189000ef          	jal	ca0 <printf>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     31c:	ffeb07b7          	lui	a5,0xffeb0
     320:	0007a583          	lw	a1,0(a5) # ffeb0000 <__crt0_ram_last+0x7fe30001>
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     324:	0000f537          	lui	a0,0xf
     328:	e4850513          	add	a0,a0,-440 # ee48 <__fini_array_end+0x50>
     32c:	175000ef          	jal	ca0 <printf>

  int8_t  A[N][N], B[N][N];
  int32_t Csw[N][N], Ccfu[N][N], Ccfs[N][N];

  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     330:	06010b13          	add	s6,sp,96
  printf("CFS ID: 0x%08" PRIX32 "\n", cfs_read(CFS_CTL));
     334:	000b0593          	mv	a1,s6
     338:	00100693          	li	a3,1
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     33c:	00800813          	li	a6,8
     340:	00900893          	li	a7,9
     344:	0ff6f613          	zext.b	a2,a3
     348:	00261793          	sll	a5,a2,0x2
     34c:	40f607b3          	sub	a5,a2,a5
     350:	0ff7f793          	zext.b	a5,a5
     354:	00000713          	li	a4,0
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     358:	00f7f513          	and	a0,a5,15
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     35c:	00e58333          	add	t1,a1,a4
static inline int8_t pattA(int i, int k){ return (int8_t)(((i+1)*(k-3)) & 0x0F) - 8; }
     360:	ff850513          	add	a0,a0,-8
  for(int i=0;i<N;++i) for(int k=0;k<N;++k) A[i][k]=pattA(i,k);
     364:	00f607b3          	add	a5,a2,a5
     368:	00a30023          	sb	a0,0(t1)
     36c:	00170713          	add	a4,a4,1
     370:	0ff7f793          	zext.b	a5,a5
     374:	ff0712e3          	bne	a4,a6,358 <main+0x88>
     378:	00168693          	add	a3,a3,1
     37c:	00858593          	add	a1,a1,8
     380:	fd1692e3          	bne	a3,a7,344 <main+0x74>
     384:	0a010613          	add	a2,sp,160
     388:	00500713          	li	a4,5
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     38c:	00800513          	li	a0,8
     390:	0fd00813          	li	a6,253
     394:	40e007b3          	neg	a5,a4
     398:	00179793          	sll	a5,a5,0x1
     39c:	0ff7f793          	zext.b	a5,a5
     3a0:	00000693          	li	a3,0
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     3a4:	00f7f593          	and	a1,a5,15
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3a8:	00d608b3          	add	a7,a2,a3
static inline int8_t pattB(int k, int j){ return (int8_t)(((j-2)*(5-k)) & 0x0F) - 8; }
     3ac:	ff858593          	add	a1,a1,-8
  for(int k=0;k<N;++k) for(int j=0;j<N;++j) B[k][j]=pattB(k,j);
     3b0:	00f707b3          	add	a5,a4,a5
     3b4:	00b88023          	sb	a1,0(a7)
     3b8:	00168693          	add	a3,a3,1
     3bc:	0ff7f793          	zext.b	a5,a5
     3c0:	fea692e3          	bne	a3,a0,3a4 <main+0xd4>
     3c4:	fff70713          	add	a4,a4,-1
     3c8:	0ff77713          	zext.b	a4,a4
     3cc:	00860613          	add	a2,a2,8
     3d0:	fd0712e3          	bne	a4,a6,394 <main+0xc4>

  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     3d4:	e11ff0ef          	jal	1e4 <rdcycle>
     3d8:	00050913          	mv	s2,a0
     3dc:	00058c13          	mv	s8,a1
     3e0:	e19ff0ef          	jal	1f8 <rdinstret>
     3e4:	00050493          	mv	s1,a0
     3e8:	00058a93          	mv	s5,a1
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){ int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s; }
     3ec:	12010a13          	add	s4,sp,288
     3f0:	22010b93          	add	s7,sp,544
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     3f4:	000b0c93          	mv	s9,s6
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){ int32_t s=0; for(int k=0;k<N;++k) s+=(int32_t)A[i][k]*B[k][j]; C[i][j]=s; }
     3f8:	00000413          	li	s0,0
     3fc:	03c0006f          	j	438 <main+0x168>
     400:	013c87b3          	add	a5,s9,s3
     404:	000d8583          	lb	a1,0(s11)
     408:	00078503          	lb	a0,0(a5)
     40c:	00198993          	add	s3,s3,1
     410:	008d8d93          	add	s11,s11,8
     414:	7ec0e0ef          	jal	ec00 <__mulsi3>
     418:	00800713          	li	a4,8
     41c:	00ad0d33          	add	s10,s10,a0
     420:	fee990e3          	bne	s3,a4,400 <main+0x130>
     424:	00241793          	sll	a5,s0,0x2
     428:	00fa07b3          	add	a5,s4,a5
     42c:	01a7a023          	sw	s10,0(a5)
     430:	00140413          	add	s0,s0,1
     434:	01340c63          	beq	s0,s3,44c <main+0x17c>
     438:	0a010793          	add	a5,sp,160
     43c:	00878db3          	add	s11,a5,s0
     440:	00000d13          	li	s10,0
     444:	00000993          	li	s3,0
     448:	fb9ff06f          	j	400 <main+0x130>
     44c:	020a0a13          	add	s4,s4,32
     450:	008c8c93          	add	s9,s9,8
     454:	fb4b92e3          	bne	s7,s4,3f8 <main+0x128>
  uint64_t c0=rdcycle(), i0=rdinstret(); gemm_sw(A,B,Csw);  uint64_t i1=rdinstret(), c1=rdcycle();
     458:	da1ff0ef          	jal	1f8 <rdinstret>
     45c:	00050a13          	mv	s4,a0
     460:	00058413          	mv	s0,a1
     464:	d81ff0ef          	jal	1e4 <rdcycle>
  uint64_t sw_cyc=c1-c0, sw_ins=i1-i0;
     468:	412507b3          	sub	a5,a0,s2
     46c:	418589b3          	sub	s3,a1,s8
     470:	00f12623          	sw	a5,12(sp)
     474:	00f537b3          	sltu	a5,a0,a5
     478:	40f987b3          	sub	a5,s3,a5
     47c:	00f12a23          	sw	a5,20(sp)
     480:	409a07b3          	sub	a5,s4,s1
     484:	00fa3a33          	sltu	s4,s4,a5
     488:	41540433          	sub	s0,s0,s5
     48c:	00f12823          	sw	a5,16(sp)
     490:	414407b3          	sub	a5,s0,s4
     494:	00f12c23          	sw	a5,24(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     498:	d4dff0ef          	jal	1e4 <rdcycle>
     49c:	00050a93          	mv	s5,a0
     4a0:	00058c13          	mv	s8,a1
     4a4:	d55ff0ef          	jal	1f8 <rdinstret>
     4a8:	00058c93          	mv	s9,a1
     4ac:	00050a13          	mv	s4,a0
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     4b0:	000b8713          	mv	a4,s7
     4b4:	040b0313          	add	t1,s6,64
  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     4b8:	000b0593          	mv	a1,s6
      acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
     4bc:	0005a883          	lw	a7,0(a1)
     4c0:	0045a803          	lw	a6,4(a1)
     4c4:	0a010613          	add	a2,sp,160
     4c8:	02070513          	add	a0,a4,32
         (((uint32_t)(uint8_t)x1) << 8)  |
     4cc:	00864783          	lbu	a5,8(a2)
         (((uint32_t)(uint8_t)x2) << 16) |
     4d0:	01064683          	lbu	a3,16(a2)
         (((uint32_t)(uint8_t)x1) << 8)  |
     4d4:	00879793          	sll	a5,a5,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     4d8:	01069693          	sll	a3,a3,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     4dc:	00d7e7b3          	or	a5,a5,a3
  return  ((uint32_t)(uint8_t)x0)        |
     4e0:	00064683          	lbu	a3,0(a2)
         (((uint32_t)(uint8_t)x1) << 8)  |
     4e4:	00d7e7b3          	or	a5,a5,a3
         (((uint32_t)(uint8_t)x3) << 24);
     4e8:	01864683          	lbu	a3,24(a2)
     4ec:	01869693          	sll	a3,a3,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     4f0:	00d7e7b3          	or	a5,a5,a3
  __asm__ volatile(".insn r 0x0B, %1, %2, %0, %3, %4"
     4f4:	02f8878b          	.insn	4, 0x02f8878b
         (((uint32_t)(uint8_t)x1) << 8)  |
     4f8:	02864683          	lbu	a3,40(a2)
         (((uint32_t)(uint8_t)x2) << 16) |
     4fc:	03064e03          	lbu	t3,48(a2)
         (((uint32_t)(uint8_t)x1) << 8)  |
     500:	00869693          	sll	a3,a3,0x8
         (((uint32_t)(uint8_t)x2) << 16) |
     504:	010e1e13          	sll	t3,t3,0x10
         (((uint32_t)(uint8_t)x1) << 8)  |
     508:	01c6e6b3          	or	a3,a3,t3
  return  ((uint32_t)(uint8_t)x0)        |
     50c:	02064e03          	lbu	t3,32(a2)
         (((uint32_t)(uint8_t)x1) << 8)  |
     510:	01c6e6b3          	or	a3,a3,t3
         (((uint32_t)(uint8_t)x3) << 24);
     514:	03864e03          	lbu	t3,56(a2)
     518:	018e1e13          	sll	t3,t3,0x18
         (((uint32_t)(uint8_t)x2) << 16) |
     51c:	01c6e6b3          	or	a3,a3,t3
  __asm__ volatile(".insn r 0x0B, %1, %2, %0, %3, %4"
     520:	02d8068b          	.insn	4, 0x02d8068b
      acc += cfu_dp4a((int32_t)ap,(int32_t)bp);
     524:	00d787b3          	add	a5,a5,a3
    } C[i][j]=acc;
     528:	00f72023          	sw	a5,0(a4)
  for(int i=0;i<N;++i) for(int j=0;j<N;++j){
     52c:	00470713          	add	a4,a4,4
     530:	00160613          	add	a2,a2,1
     534:	f8e51ce3          	bne	a0,a4,4cc <main+0x1fc>
     538:	00858593          	add	a1,a1,8
     53c:	00b30663          	beq	t1,a1,548 <main+0x278>
     540:	00050713          	mv	a4,a0
     544:	f79ff06f          	j	4bc <main+0x1ec>
  c0=rdcycle(); i0=rdinstret(); gemm_cfu(A,B,Ccfu); i1=rdinstret(); c1=rdcycle();
     548:	cb1ff0ef          	jal	1f8 <rdinstret>
     54c:	00050d13          	mv	s10,a0
     550:	00058d93          	mv	s11,a1
     554:	c91ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfu_cyc=c1-c0, cfu_ins=i1-i0;
     558:	41550ab3          	sub	s5,a0,s5
     55c:	41858bb3          	sub	s7,a1,s8
     560:	01553533          	sltu	a0,a0,s5
     564:	40ab87b3          	sub	a5,s7,a0
     568:	02f12023          	sw	a5,32(sp)
     56c:	414d07b3          	sub	a5,s10,s4
     570:	419d8db3          	sub	s11,s11,s9
     574:	00fd3d33          	sltu	s10,s10,a5
     578:	00f12e23          	sw	a5,28(sp)
     57c:	41ad87b3          	sub	a5,s11,s10
     580:	02f12223          	sw	a5,36(sp)

  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     584:	c61ff0ef          	jal	1e4 <rdcycle>
     588:	02a12423          	sw	a0,40(sp)
     58c:	02b12623          	sw	a1,44(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     590:	ffeb0bb7          	lui	s7,0xffeb0
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     594:	c65ff0ef          	jal	1f8 <rdinstret>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     598:	ffeb0a37          	lui	s4,0xffeb0
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     59c:	02a12823          	sw	a0,48(sp)
     5a0:	02b12a23          	sw	a1,52(sp)
  for(int i0=0;i0<N;i0+=4){
     5a4:	32010d93          	add	s11,sp,800
     5a8:	00000993          	li	s3,0
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) Aflat[r*LDA+k]=A[sr][k]; }
     5ac:	800004b7          	lui	s1,0x80000
     5b0:	80000937          	lui	s2,0x80000
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5b4:	004b8b93          	add	s7,s7,4 # ffeb0004 <__crt0_ram_last+0x7fe30005>
     5b8:	008a0a13          	add	s4,s4,8 # ffeb0008 <__crt0_ram_last+0x7fe30009>
    for(int j0=0;j0<N;j0+=4){
     5bc:	000d8413          	mv	s0,s11
     5c0:	00000d13          	li	s10,0
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5c4:	ffeb0cb7          	lui	s9,0xffeb0
     5c8:	1ec0006f          	j	7b4 <main+0x4e4>
        Bflat[k*LDB+0]=B[k][j0+0];
     5cc:	0006c583          	lbu	a1,0(a3)
      for(int k=0;k<N;++k){
     5d0:	00478793          	add	a5,a5,4
     5d4:	00868693          	add	a3,a3,8
        Bflat[k*LDB+0]=B[k][j0+0];
     5d8:	feb78e23          	sb	a1,-4(a5)
        Bflat[k*LDB+1]=B[k][j0+1];
     5dc:	ff96c583          	lbu	a1,-7(a3)
     5e0:	feb78ea3          	sb	a1,-3(a5)
        Bflat[k*LDB+2]=B[k][j0+2];
     5e4:	ffa6c583          	lbu	a1,-6(a3)
     5e8:	feb78f23          	sb	a1,-2(a5)
        Bflat[k*LDB+3]=B[k][j0+3];
     5ec:	ffb6c583          	lbu	a1,-5(a3)
     5f0:	feb78fa3          	sb	a1,-1(a5)
      for(int k=0;k<N;++k){
     5f4:	fcf61ce3          	bne	a2,a5,5cc <main+0x2fc>
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     5f8:	00200793          	li	a5,2
     5fc:	00fca023          	sw	a5,0(s9) # ffeb0000 <__crt0_ram_last+0x7fe30001>
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     600:	000ca783          	lw	a5,0(s9)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     604:	ffeb0fb7          	lui	t6,0xffeb0
     608:	ffeb0f37          	lui	t5,0xffeb0
     60c:	ffeb0eb7          	lui	t4,0xffeb0
     610:	ffeb0e37          	lui	t3,0xffeb0
     614:	ffeb0537          	lui	a0,0xffeb0
     618:	ffeb05b7          	lui	a1,0xffeb0
  for(int s=0;s<T;++s){
     61c:	00000793          	li	a5,0
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)? Aflat[i*LDA+k]:0; Aw[i]=(uint32_t)(uint8_t)a; }
     620:	00700313          	li	t1,7
     624:	00400293          	li	t0,4
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     628:	00cf8f93          	add	t6,t6,12 # ffeb000c <__crt0_ram_last+0x7fe3000d>
     62c:	010f0f13          	add	t5,t5,16 # ffeb0010 <__crt0_ram_last+0x7fe30011>
     630:	014e8e93          	add	t4,t4,20 # ffeb0014 <__crt0_ram_last+0x7fe30015>
     634:	018e0e13          	add	t3,t3,24 # ffeb0018 <__crt0_ram_last+0x7fe30019>
     638:	01c50513          	add	a0,a0,28 # ffeb001c <__crt0_ram_last+0x7fe3001d>
     63c:	02058593          	add	a1,a1,32 # ffeb0020 <__crt0_ram_last+0x7fe30021>
     640:	00100893          	li	a7,1
  for(int s=0;s<T;++s){
     644:	00e00813          	li	a6,14
    uint32_t Aw[4]={0}, Bw[4]={0};
     648:	800006b7          	lui	a3,0x80000
     64c:	75468693          	add	a3,a3,1876 # 80000754 <Aflat.1>
     650:	00d783b3          	add	t2,a5,a3
     654:	04012023          	sw	zero,64(sp)
     658:	04012223          	sw	zero,68(sp)
     65c:	04012423          	sw	zero,72(sp)
     660:	04012623          	sw	zero,76(sp)
     664:	04012823          	sw	zero,80(sp)
     668:	04012a23          	sw	zero,84(sp)
     66c:	04012c23          	sw	zero,88(sp)
     670:	04012e23          	sw	zero,92(sp)
    for(int i=0;i<4;++i){ int k=s-i; int8_t a=(k>=0&&k<K)? Aflat[i*LDA+k]:0; Aw[i]=(uint32_t)(uint8_t)a; }
     674:	04010093          	add	ra,sp,64
     678:	00000693          	li	a3,0
     67c:	40d78c33          	sub	s8,a5,a3
     680:	00000613          	li	a2,0
     684:	01836463          	bltu	t1,s8,68c <main+0x3bc>
     688:	00038603          	lb	a2,0(t2)
     68c:	0ff67613          	zext.b	a2,a2
     690:	00c0a023          	sw	a2,0(ra)
     694:	00168693          	add	a3,a3,1
     698:	00408093          	add	ra,ra,4
     69c:	00738393          	add	t2,t2,7
     6a0:	fc569ee3          	bne	a3,t0,67c <main+0x3ac>
     6a4:	05010393          	add	t2,sp,80
     6a8:	00070613          	mv	a2,a4
    for(int j=0;j<4;++j){ int k=s-j; int8_t b=(k>=0&&k<K)? Bflat[k*LDB+j]:0; Bw[j]=(uint32_t)(uint8_t)b; }
     6ac:	00000c13          	li	s8,0
     6b0:	418780b3          	sub	ra,a5,s8
     6b4:	00000693          	li	a3,0
     6b8:	00136463          	bltu	t1,ra,6c0 <main+0x3f0>
     6bc:	00060683          	lb	a3,0(a2)
     6c0:	0ff6f693          	zext.b	a3,a3
     6c4:	00d3a023          	sw	a3,0(t2)
     6c8:	001c0c13          	add	s8,s8,1
     6cc:	00438393          	add	t2,t2,4
     6d0:	ffd60613          	add	a2,a2,-3
     6d4:	fc5c1ee3          	bne	s8,t0,6b0 <main+0x3e0>
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     6d8:	04012683          	lw	a3,64(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6dc:	00dba023          	sw	a3,0(s7)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     6e0:	04412683          	lw	a3,68(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6e4:	00da2023          	sw	a3,0(s4)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     6e8:	04812683          	lw	a3,72(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6ec:	00dfa023          	sw	a3,0(t6)
    cfs_write(CFS_A0,Aw[0]); cfs_write(CFS_A1,Aw[1]); cfs_write(CFS_A2,Aw[2]); cfs_write(CFS_A3,Aw[3]);
     6f0:	04c12683          	lw	a3,76(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6f4:	00df2023          	sw	a3,0(t5)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     6f8:	05012683          	lw	a3,80(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     6fc:	00dea023          	sw	a3,0(t4)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     700:	05412683          	lw	a3,84(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     704:	00de2023          	sw	a3,0(t3)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     708:	05812683          	lw	a3,88(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     70c:	00d52023          	sw	a3,0(a0)
    cfs_write(CFS_B0,Bw[0]); cfs_write(CFS_B1,Bw[1]); cfs_write(CFS_B2,Bw[2]); cfs_write(CFS_B3,Bw[3]);
     710:	05c12683          	lw	a3,92(sp)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     714:	00d5a023          	sw	a3,0(a1)
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     718:	000ca683          	lw	a3,0(s9)
static inline void     cfs_write(uint32_t off, uint32_t val){ CFS_REG(off)=val; }
     71c:	011ca023          	sw	a7,0(s9)
  for(int s=0;s<T;++s){
     720:	00178793          	add	a5,a5,1
     724:	00470713          	add	a4,a4,4
     728:	f30790e3          	bne	a5,a6,648 <main+0x378>
     72c:	0e010593          	add	a1,sp,224
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     730:	ffeb0637          	lui	a2,0xffeb0
  for(int s=0;s<T;++s){
     734:	00058513          	mv	a0,a1
     738:	00000713          	li	a4,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     73c:	04060613          	add	a2,a2,64 # ffeb0040 <__crt0_ram_last+0x7fe30041>
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     740:	01000e13          	li	t3,16
     744:	00271693          	sll	a3,a4,0x2
     748:	00000793          	li	a5,0
static inline uint32_t cfs_read (uint32_t off)             { return CFS_REG(off); }
     74c:	00c686b3          	add	a3,a3,a2
     750:	00f68eb3          	add	t4,a3,a5
     754:	000eaf03          	lw	t5,0(t4)
  for(int i=0;i<4;++i) for(int j=0;j<4;++j) C4[i][j]=(int32_t)cfs_read(CFS_C0+i*4+j);
     758:	00f50eb3          	add	t4,a0,a5
     75c:	00478793          	add	a5,a5,4
     760:	01eea023          	sw	t5,0(t4)
     764:	ffc796e3          	bne	a5,t3,750 <main+0x480>
     768:	00470713          	add	a4,a4,4
     76c:	01050513          	add	a0,a0,16
     770:	fcf71ae3          	bne	a4,a5,744 <main+0x474>
     774:	04058713          	add	a4,a1,64
     778:	00040793          	mv	a5,s0
      for(int r=0;r<4;++r) for(int c=0;c<4;++c) C[i0+r][j0+c]=C4[r][c];
     77c:	00078513          	mv	a0,a5
     780:	01000613          	li	a2,16
     784:	02e12e23          	sw	a4,60(sp)
     788:	02b12c23          	sw	a1,56(sp)
     78c:	7a4000ef          	jal	f30 <memcpy>
     790:	03812583          	lw	a1,56(sp)
     794:	03c12703          	lw	a4,60(sp)
     798:	02050793          	add	a5,a0,32
     79c:	01058593          	add	a1,a1,16
     7a0:	fce59ee3          	bne	a1,a4,77c <main+0x4ac>
    for(int j0=0;j0<N;j0+=4){
     7a4:	00400793          	li	a5,4
     7a8:	01040413          	add	s0,s0,16
     7ac:	02fd0863          	beq	s10,a5,7dc <main+0x50c>
     7b0:	000c0d13          	mv	s10,s8
      for(int r=0;r<4;++r){ int sr=i0+r; for(int k=0;k<N;++k) Aflat[r*LDA+k]=A[sr][k]; }
     7b4:	02000613          	li	a2,32
     7b8:	000b0593          	mv	a1,s6
     7bc:	75448513          	add	a0,s1,1876 # 80000754 <Aflat.1>
     7c0:	770000ef          	jal	f30 <memcpy>
     7c4:	0a010793          	add	a5,sp,160
     7c8:	73490713          	add	a4,s2,1844 # 80000734 <Bflat.0>
     7cc:	00fd06b3          	add	a3,s10,a5
     7d0:	02070613          	add	a2,a4,32
     7d4:	73490793          	add	a5,s2,1844
     7d8:	df5ff06f          	j	5cc <main+0x2fc>
  for(int i0=0;i0<N;i0+=4){
     7dc:	080d8d93          	add	s11,s11,128
     7e0:	020b0b13          	add	s6,s6,32
     7e4:	01a98663          	beq	s3,s10,7f0 <main+0x520>
     7e8:	00400993          	li	s3,4
     7ec:	dd1ff06f          	j	5bc <main+0x2ec>
  c0=rdcycle(); i0=rdinstret(); gemm_cfs(A,B,Ccfs); i1=rdinstret(); c1=rdcycle();
     7f0:	a09ff0ef          	jal	1f8 <rdinstret>
     7f4:	00050d93          	mv	s11,a0
     7f8:	00058d13          	mv	s10,a1
     7fc:	9e9ff0ef          	jal	1e4 <rdcycle>
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     800:	02812783          	lw	a5,40(sp)
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     804:	10000693          	li	a3,256
  uint64_t cfs_cyc=c1-c0, cfs_ins=i1-i0;
     808:	40f50b33          	sub	s6,a0,a5
     80c:	02c12783          	lw	a5,44(sp)
     810:	01653533          	sltu	a0,a0,s6
     814:	40f58c33          	sub	s8,a1,a5
     818:	03012783          	lw	a5,48(sp)
     81c:	40ac0c33          	sub	s8,s8,a0
     820:	40fd8cb3          	sub	s9,s11,a5
     824:	03412783          	lw	a5,52(sp)
     828:	019dbdb3          	sltu	s11,s11,s9
     82c:	40fd0d33          	sub	s10,s10,a5
     830:	41bd0d33          	sub	s10,s10,s11
     834:	00000793          	li	a5,0
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     838:	12010713          	add	a4,sp,288
     83c:	00f70733          	add	a4,a4,a5
     840:	00072603          	lw	a2,0(a4)
     844:	22010713          	add	a4,sp,544
     848:	00f70733          	add	a4,a4,a5
     84c:	00072703          	lw	a4,0(a4)
     850:	18e61e63          	bne	a2,a4,9ec <main+0x71c>
     854:	00478793          	add	a5,a5,4
     858:	fed790e3          	bne	a5,a3,838 <main+0x568>
     85c:	00100413          	li	s0,1
     860:	00000793          	li	a5,0
     864:	10000613          	li	a2,256
     868:	32010713          	add	a4,sp,800
     86c:	12010693          	add	a3,sp,288
     870:	00f70733          	add	a4,a4,a5
     874:	00f686b3          	add	a3,a3,a5
     878:	0006a683          	lw	a3,0(a3)
     87c:	00072703          	lw	a4,0(a4)
     880:	16e69a63          	bne	a3,a4,9f4 <main+0x724>
     884:	00478793          	add	a5,a5,4
     888:	fec790e3          	bne	a5,a2,868 <main+0x598>
     88c:	00100d93          	li	s11,1

  int ok1=cmp(&Csw[0][0],&Ccfu[0][0]);
  int ok2=cmp(&Csw[0][0],&Ccfs[0][0]);

  printf("\n%dx%d timing summary\n", N,N);
     890:	0000f537          	lui	a0,0xf
     894:	00800593          	li	a1,8
     898:	00800613          	li	a2,8
     89c:	e5c50513          	add	a0,a0,-420 # ee5c <__fini_array_end+0x64>
     8a0:	400000ef          	jal	ca0 <printf>
  printf("Path |   cycles   |  instret   | Speedup(cyc) | Speedup(inst)\n");
     8a4:	0000f537          	lui	a0,0xf
     8a8:	e7450513          	add	a0,a0,-396 # ee74 <__fini_array_end+0x7c>
     8ac:	588000ef          	jal	e34 <puts>
  printf("-----+------------+------------+--------------+--------------\n");
     8b0:	0000f537          	lui	a0,0xf
     8b4:	eb450513          	add	a0,a0,-332 # eeb4 <__fini_array_end+0xbc>
     8b8:	57c000ef          	jal	e34 <puts>
  printf(" SW  | %10" PRIu64 " | %10" PRIu64 " |     --       |     --      \n", sw_cyc, sw_ins);
     8bc:	01012703          	lw	a4,16(sp)
     8c0:	01812783          	lw	a5,24(sp)
     8c4:	00c12603          	lw	a2,12(sp)
     8c8:	01412683          	lw	a3,20(sp)
     8cc:	0000f537          	lui	a0,0xf
     8d0:	ef450513          	add	a0,a0,-268 # eef4 <__fini_array_end+0xfc>
     8d4:	3cc000ef          	jal	ca0 <printf>
  printf(" CFU | %10" PRIu64 " | %10" PRIu64 " |  ", cfu_cyc, cfu_ins); print_speedup_fixed(sw_cyc,cfu_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfu_ins); printf("\n");
     8d8:	01c12703          	lw	a4,28(sp)
     8dc:	02412783          	lw	a5,36(sp)
     8e0:	02012683          	lw	a3,32(sp)
     8e4:	0000f537          	lui	a0,0xf
     8e8:	000a8613          	mv	a2,s5
     8ec:	f2c50513          	add	a0,a0,-212 # ef2c <__fini_array_end+0x134>
     8f0:	3b0000ef          	jal	ca0 <printf>
     8f4:	02012683          	lw	a3,32(sp)
     8f8:	01412583          	lw	a1,20(sp)
     8fc:	00c12503          	lw	a0,12(sp)
     900:	000a8613          	mv	a2,s5
     904:	0000fab7          	lui	s5,0xf
     908:	905ff0ef          	jal	20c <print_speedup_fixed>
     90c:	f48a8513          	add	a0,s5,-184 # ef48 <__fini_array_end+0x150>
     910:	390000ef          	jal	ca0 <printf>
     914:	01812583          	lw	a1,24(sp)
     918:	01c12603          	lw	a2,28(sp)
     91c:	02412683          	lw	a3,36(sp)
     920:	01012503          	lw	a0,16(sp)
     924:	8e9ff0ef          	jal	20c <print_speedup_fixed>
     928:	00a00513          	li	a0,10
     92c:	3c4000ef          	jal	cf0 <putchar>
  printf(" CFS | %10" PRIu64 " | %10" PRIu64 " |  ", cfs_cyc, cfs_ins); print_speedup_fixed(sw_cyc,cfs_cyc); printf("     |  "); print_speedup_fixed(sw_ins,cfs_ins); printf("\n");
     930:	0000f537          	lui	a0,0xf
     934:	000c8713          	mv	a4,s9
     938:	000d0793          	mv	a5,s10
     93c:	000b0613          	mv	a2,s6
     940:	000c0693          	mv	a3,s8
     944:	f5450513          	add	a0,a0,-172 # ef54 <__fini_array_end+0x15c>
     948:	358000ef          	jal	ca0 <printf>
     94c:	01412583          	lw	a1,20(sp)
     950:	00c12503          	lw	a0,12(sp)
     954:	000b0613          	mv	a2,s6
     958:	000c0693          	mv	a3,s8
     95c:	8b1ff0ef          	jal	20c <print_speedup_fixed>
     960:	f48a8513          	add	a0,s5,-184
     964:	33c000ef          	jal	ca0 <printf>
     968:	01012503          	lw	a0,16(sp)
     96c:	01812583          	lw	a1,24(sp)
     970:	000c8613          	mv	a2,s9
     974:	000d0693          	mv	a3,s10
     978:	895ff0ef          	jal	20c <print_speedup_fixed>
     97c:	00a00513          	li	a0,10
     980:	370000ef          	jal	cf0 <putchar>

  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     984:	06040c63          	beqz	s0,9fc <main+0x72c>
     988:	0000f5b7          	lui	a1,0xf
     98c:	e1458593          	add	a1,a1,-492 # ee14 <__fini_array_end+0x1c>
     990:	060d8c63          	beqz	s11,a08 <main+0x738>
     994:	0000f637          	lui	a2,0xf
     998:	e1460613          	add	a2,a2,-492 # ee14 <__fini_array_end+0x1c>
     99c:	0000f537          	lui	a0,0xf
     9a0:	f7050513          	add	a0,a0,-144 # ef70 <__fini_array_end+0x178>
     9a4:	2fc000ef          	jal	ca0 <printf>
  return (ok1&&ok2)?0:1;
     9a8:	008df533          	and	a0,s11,s0
}
     9ac:	45c12083          	lw	ra,1116(sp)
     9b0:	45812403          	lw	s0,1112(sp)
     9b4:	45412483          	lw	s1,1108(sp)
     9b8:	45012903          	lw	s2,1104(sp)
     9bc:	44c12983          	lw	s3,1100(sp)
     9c0:	44812a03          	lw	s4,1096(sp)
     9c4:	44412a83          	lw	s5,1092(sp)
     9c8:	44012b03          	lw	s6,1088(sp)
     9cc:	43c12b83          	lw	s7,1084(sp)
     9d0:	43812c03          	lw	s8,1080(sp)
     9d4:	43412c83          	lw	s9,1076(sp)
     9d8:	43012d03          	lw	s10,1072(sp)
     9dc:	42c12d83          	lw	s11,1068(sp)
     9e0:	00154513          	xor	a0,a0,1
     9e4:	46010113          	add	sp,sp,1120
     9e8:	00008067          	ret
static int cmp(const int32_t *A,const int32_t *B){ for(int i=0;i<N*N;++i) if(A[i]!=B[i]) return 0; return 1; }
     9ec:	00000413          	li	s0,0
     9f0:	e71ff06f          	j	860 <main+0x590>
     9f4:	00000d93          	li	s11,0
     9f8:	e99ff06f          	j	890 <main+0x5c0>
  printf("\nVerdict: CFU %s, CFS %s\n", ok1?"PASS":"FAIL", ok2?"PASS":"FAIL");
     9fc:	0000f5b7          	lui	a1,0xf
     a00:	e1c58593          	add	a1,a1,-484 # ee1c <__fini_array_end+0x24>
     a04:	f8dff06f          	j	990 <main+0x6c0>
     a08:	0000f637          	lui	a2,0xf
     a0c:	e1c60613          	add	a2,a2,-484 # ee1c <__fini_array_end+0x24>
     a10:	f8dff06f          	j	99c <main+0x6cc>

00000a14 <_exit>:
 * Exit a program without cleaning up anything.
 **************************************************************************/
void _exit(int status) {

  // put status into register 'a0' and jump to crt0's exit code
  asm volatile (
     a14:	fffff097          	auipc	ra,0xfffff
     a18:	74408093          	add	ra,ra,1860 # 158 <__crt0_main_exit>
     a1c:	00050513          	mv	a0,a0
     a20:	00008067          	ret

00000a24 <_close>:
  return neorv32_semihosting_close(file);
#else
  (void)file;
  return -1; // no files available
#endif
}
     a24:	fff00513          	li	a0,-1
     a28:	00008067          	ret

00000a2c <_fstat>:
 /**********************************************************************//**
 * Status of an open file. All files are regarded as character special devices.
 **************************************************************************/
int _fstat(int file, struct stat *st) {
  (void)file;
  st->st_mode = S_IFCHR;
     a2c:	000027b7          	lui	a5,0x2
     a30:	00f5a223          	sw	a5,4(a1)
  return 0;
}
     a34:	00000513          	li	a0,0
     a38:	00008067          	ret

00000a3c <_getpid>:
 * Process-ID; this is sometimes used to generate strings unlikely to
 * conflict with other processes.
 **************************************************************************/
int _getpid() {
  return 1; // there is only one process by default
}
     a3c:	00100513          	li	a0,1
     a40:	00008067          	ret

00000a44 <_isatty>:
  return neorv32_semihosting_istty(file);
#else
  (void)file;
  return 1; // all streams are terminals
#endif
}
     a44:	00100513          	li	a0,1
     a48:	00008067          	ret

00000a4c <_kill>:
 * Send a signal.
 **************************************************************************/
int _kill(int pid, int sig) {
  (void)pid;
  (void)sig;
  errno = EINVAL;
     a4c:	800007b7          	lui	a5,0x80000
     a50:	01600713          	li	a4,22
     a54:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
  return -1;
}
     a58:	fff00513          	li	a0,-1
     a5c:	00008067          	ret

00000a60 <_lseek>:
  (void)file;
  (void)ptr;
  (void)dir;
  return 0;
#endif
}
     a60:	00000513          	li	a0,0
     a64:	00008067          	ret

00000a68 <_read>:

 /**********************************************************************//**
 * Read from a file. STDIN will read from UART0, all other input streams
 * will read from UART1.
 **************************************************************************/
int _read(int file, char *ptr, int len) {
     a68:	fe010113          	add	sp,sp,-32
     a6c:	00912a23          	sw	s1,20(sp)
     a70:	01212823          	sw	s2,16(sp)
     a74:	00112e23          	sw	ra,28(sp)
     a78:	00812c23          	sw	s0,24(sp)
     a7c:	01312623          	sw	s3,12(sp)
     a80:	01412423          	sw	s4,8(sp)
     a84:	00058913          	mv	s2,a1
     a88:	00060493          	mv	s1,a2
#else
  char c = 0;
  int read_cnt = 0;

  // read STDIN stream from NEORV32.UART0 (if available)
  if ((file == STDIN_FILENO) && (neorv32_uart_available(NEORV32_UART0))) {
     a8c:	06051463          	bnez	a0,af4 <_read+0x8c>
     a90:	00050413          	mv	s0,a0
     a94:	fff50537          	lui	a0,0xfff50
     a98:	1a0000ef          	jal	c38 <neorv32_uart_available>
     a9c:	04050c63          	beqz	a0,af4 <_read+0x8c>
    while (len--) {
      c = (char)neorv32_uart_getc(NEORV32_UART0);
      *ptr++ = c;
      read_cnt++;
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     aa0:	00a00993          	li	s3,10
     aa4:	00d00a13          	li	s4,13
    while (len--) {
     aa8:	00941663          	bne	s0,s1,ab4 <_read+0x4c>
        return read_cnt;
      }
    }
    return read_cnt;
     aac:	00048413          	mv	s0,s1
     ab0:	0200006f          	j	ad0 <_read+0x68>
      c = (char)neorv32_uart_getc(NEORV32_UART0);
     ab4:	fff50537          	lui	a0,0xfff50
     ab8:	1d0000ef          	jal	c88 <neorv32_uart_getc>
      *ptr++ = c;
     abc:	008907b3          	add	a5,s2,s0
     ac0:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     ac4:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     ac8:	01350463          	beq	a0,s3,ad0 <_read+0x68>
     acc:	fd451ee3          	bne	a0,s4,aa8 <_read+0x40>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     ad0:	01c12083          	lw	ra,28(sp)
     ad4:	00040513          	mv	a0,s0
     ad8:	01812403          	lw	s0,24(sp)
     adc:	01412483          	lw	s1,20(sp)
     ae0:	01012903          	lw	s2,16(sp)
     ae4:	00c12983          	lw	s3,12(sp)
     ae8:	00812a03          	lw	s4,8(sp)
     aec:	02010113          	add	sp,sp,32
     af0:	00008067          	ret
  else if (neorv32_uart_available(NEORV32_UART1)) {
     af4:	fff60537          	lui	a0,0xfff60
     af8:	140000ef          	jal	c38 <neorv32_uart_available>
  int read_cnt = 0;
     afc:	00000413          	li	s0,0
  else if (neorv32_uart_available(NEORV32_UART1)) {
     b00:	02050863          	beqz	a0,b30 <_read+0xc8>
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     b04:	00a00993          	li	s3,10
     b08:	00d00a13          	li	s4,13
    while (len--) {
     b0c:	fa9400e3          	beq	s0,s1,aac <_read+0x44>
      c = (char)neorv32_uart_getc(NEORV32_UART1);
     b10:	fff60537          	lui	a0,0xfff60
     b14:	174000ef          	jal	c88 <neorv32_uart_getc>
      *ptr++ = c;
     b18:	008907b3          	add	a5,s2,s0
     b1c:	00a78023          	sb	a0,0(a5)
      read_cnt++;
     b20:	00140413          	add	s0,s0,1
      if ((c == '\n') || (c == '\r')) { // also terminate on [press enter]
     b24:	fb3506e3          	beq	a0,s3,ad0 <_read+0x68>
     b28:	ff4512e3          	bne	a0,s4,b0c <_read+0xa4>
     b2c:	fa5ff06f          	j	ad0 <_read+0x68>
    errno = ENOSYS;
     b30:	800007b7          	lui	a5,0x80000
     b34:	05800713          	li	a4,88
     b38:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return -1;
     b3c:	fff00413          	li	s0,-1
     b40:	f91ff06f          	j	ad0 <_read+0x68>

00000b44 <_write>:

 /**********************************************************************//**
 * Write to a file. STDOUT and STDERR will write to UART0, all other
 * output streams will write to UART1.
 **************************************************************************/
int _write(int file, char *ptr, int len) {
     b44:	ff010113          	add	sp,sp,-16
     b48:	00812423          	sw	s0,8(sp)
     b4c:	00912223          	sw	s1,4(sp)
     b50:	00112623          	sw	ra,12(sp)
     b54:	01212023          	sw	s2,0(sp)
  return neorv32_semihosting_write(file, ptr, len);
#else
  int write_cnt = 0;

  // write STDOUT and STDERR streams to NEORV32.UART0 (if available)
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     b58:	fff50513          	add	a0,a0,-1 # fff5ffff <__crt0_ram_last+0x7fee0000>
     b5c:	00100793          	li	a5,1
int _write(int file, char *ptr, int len) {
     b60:	00058413          	mv	s0,a1
     b64:	00060493          	mv	s1,a2
  if ((file == STDOUT_FILENO) || (file == STDERR_FILENO)) {
     b68:	04a7ec63          	bltu	a5,a0,bc0 <_write+0x7c>
    if (neorv32_uart_available(NEORV32_UART0)) {
     b6c:	fff50537          	lui	a0,0xfff50
     b70:	0c8000ef          	jal	c38 <neorv32_uart_available>
     b74:	00940933          	add	s2,s0,s1
     b78:	02051463          	bnez	a0,ba0 <_write+0x5c>
        write_cnt++;
      }
      return write_cnt;
    }
    else {
      errno = ENOSYS;
     b7c:	800007b7          	lui	a5,0x80000
     b80:	05800713          	li	a4,88
     b84:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
      return -1;
     b88:	fff00493          	li	s1,-1
     b8c:	0180006f          	j	ba4 <_write+0x60>
        neorv32_uart_putc(NEORV32_UART0, *ptr++);
     b90:	00044583          	lbu	a1,0(s0)
     b94:	fff50537          	lui	a0,0xfff50
     b98:	00140413          	add	s0,s0,1
     b9c:	0d8000ef          	jal	c74 <neorv32_uart_putc>
      while (len--) {
     ba0:	fe8918e3          	bne	s2,s0,b90 <_write+0x4c>
  else {
    errno = ENOSYS;
    return -1;
  }
#endif
}
     ba4:	00c12083          	lw	ra,12(sp)
     ba8:	00812403          	lw	s0,8(sp)
     bac:	00012903          	lw	s2,0(sp)
     bb0:	00048513          	mv	a0,s1
     bb4:	00412483          	lw	s1,4(sp)
     bb8:	01010113          	add	sp,sp,16
     bbc:	00008067          	ret
  if (neorv32_uart_available(NEORV32_UART1)) {
     bc0:	fff60537          	lui	a0,0xfff60
     bc4:	074000ef          	jal	c38 <neorv32_uart_available>
     bc8:	00940933          	add	s2,s0,s1
     bcc:	fa0508e3          	beqz	a0,b7c <_write+0x38>
    while (len--) {
     bd0:	fd240ae3          	beq	s0,s2,ba4 <_write+0x60>
      neorv32_uart_putc(NEORV32_UART1, *ptr++);
     bd4:	00044583          	lbu	a1,0(s0)
     bd8:	fff60537          	lui	a0,0xfff60
     bdc:	00140413          	add	s0,s0,1
     be0:	094000ef          	jal	c74 <neorv32_uart_putc>
      write_cnt++;
     be4:	fedff06f          	j	bd0 <_write+0x8c>

00000be8 <_sbrk>:

  static unsigned char *curr_heap = NULL; // current heap pointer
  unsigned char *prev_heap; // previous heap pointer

  // initialize
  if (curr_heap == NULL) {
     be8:	80000737          	lui	a4,0x80000
     bec:	71472683          	lw	a3,1812(a4) # 80000714 <curr_heap.0>
     bf0:	80001637          	lui	a2,0x80001
void *_sbrk(int incr) {
     bf4:	00050793          	mv	a5,a0
     bf8:	8d460613          	add	a2,a2,-1836 # 800008d4 <__crt0_bss_end>
  if (curr_heap == NULL) {
     bfc:	00069463          	bnez	a3,c04 <_sbrk+0x1c>
    curr_heap = (unsigned char *)NEORV32_HEAP_BEGIN;
     c00:	70c72a23          	sw	a2,1812(a4)
  }

  // do we have a heap at all?
  if ((NEORV32_HEAP_BEGIN == NEORV32_HEAP_END) || (NEORV32_HEAP_SIZE == 0)) {
     c04:	800016b7          	lui	a3,0x80001
     c08:	8d468693          	add	a3,a3,-1836 # 800008d4 <__crt0_bss_end>
     c0c:	00c69c63          	bne	a3,a2,c24 <_sbrk+0x3c>
#ifdef NEWLIB_DEBUG
    write(STDERR_FILENO, "[neorv32-newlib] no heap available\r\n", 36);
#endif
    errno = ENOMEM;
     c10:	800007b7          	lui	a5,0x80000
     c14:	00c00713          	li	a4,12
     c18:	70e7ac23          	sw	a4,1816(a5) # 80000718 <errno>
    return (void*)-1; // error - no more memory
     c1c:	fff00513          	li	a0,-1
     c20:	00008067          	ret
  }

  // sufficient space left?
  if ((uint32_t)(curr_heap + incr) >= NEORV32_HEAP_END) {
     c24:	71472503          	lw	a0,1812(a4)
     c28:	00f507b3          	add	a5,a0,a5
     c2c:	fed7f2e3          	bgeu	a5,a3,c10 <_sbrk+0x28>
    errno = ENOMEM;
    return (void*)-1; // error - no more memory
  }

  prev_heap = curr_heap;
  curr_heap += incr;
     c30:	70f72a23          	sw	a5,1812(a4)

  return (void*)prev_heap;
}
     c34:	00008067          	ret

00000c38 <neorv32_uart_available>:
 * @param[in,out] Hardware handle to UART register struct, #neorv32_uart_t.
 * @return 0 if UART0/1 was not synthesized, non-zero if UART0/1 is available.
 **************************************************************************/
int neorv32_uart_available(neorv32_uart_t *UARTx) {

  if (UARTx == NEORV32_UART0) {
     c38:	fff50737          	lui	a4,0xfff50
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     c3c:	00050793          	mv	a5,a0
  if (UARTx == NEORV32_UART0) {
     c40:	00e51c63          	bne	a0,a4,c58 <neorv32_uart_available+0x20>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0));
     c44:	fffe07b7          	lui	a5,0xfffe0
     c48:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     c4c:	000207b7          	lui	a5,0x20
  }
  else if (UARTx == NEORV32_UART1) {
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     c50:	00f57533          	and	a0,a0,a5
  }
  else {
    return 0;
  }
}
     c54:	00008067          	ret
  else if (UARTx == NEORV32_UART1) {
     c58:	fff60737          	lui	a4,0xfff60
    return 0;
     c5c:	00000513          	li	a0,0
  else if (UARTx == NEORV32_UART1) {
     c60:	fee79ae3          	bne	a5,a4,c54 <neorv32_uart_available+0x1c>
    return (int)(NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1));
     c64:	fffe07b7          	lui	a5,0xfffe0
     c68:	0087a503          	lw	a0,8(a5) # fffe0008 <__crt0_ram_last+0x7ff60009>
     c6c:	020007b7          	lui	a5,0x2000
     c70:	fe1ff06f          	j	c50 <neorv32_uart_available+0x18>

00000c74 <neorv32_uart_putc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @param[in] c Char to be send.
 **************************************************************************/
void neorv32_uart_putc(neorv32_uart_t *UARTx, char c) {

  while ((UARTx->CTRL & (1<<UART_CTRL_TX_NFULL)) == 0); // wait for free space in TX FIFO
     c74:	00052783          	lw	a5,0(a0) # fff60000 <__crt0_ram_last+0x7fee0001>
     c78:	00a79713          	sll	a4,a5,0xa
     c7c:	fe075ce3          	bgez	a4,c74 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     c80:	00b52223          	sw	a1,4(a0)
}
     c84:	00008067          	ret

00000c88 <neorv32_uart_getc>:
 * @param[in,out] UARTx Hardware handle to UART register struct, #neorv32_uart_t.
 * @return Received char.
 **************************************************************************/
char neorv32_uart_getc(neorv32_uart_t *UARTx) {

  while ((UARTx->CTRL & (1<<UART_CTRL_RX_NEMPTY)) == 0); // wait until data available
     c88:	00052783          	lw	a5,0(a0)
     c8c:	00f79713          	sll	a4,a5,0xf
     c90:	fe075ce3          	bgez	a4,c88 <neorv32_uart_getc>
  return (char)(UARTx->DATA >> UART_DATA_RTX_LSB);
     c94:	00452503          	lw	a0,4(a0)
}
     c98:	0ff57513          	zext.b	a0,a0
     c9c:	00008067          	ret

00000ca0 <printf>:
     ca0:	fc010113          	add	sp,sp,-64
     ca4:	02c12423          	sw	a2,40(sp)
     ca8:	02d12623          	sw	a3,44(sp)
     cac:	80000317          	auipc	t1,0x80000
     cb0:	a5c32303          	lw	t1,-1444(t1) # 80000708 <_impure_ptr>
     cb4:	02b12223          	sw	a1,36(sp)
     cb8:	02e12823          	sw	a4,48(sp)
     cbc:	02f12a23          	sw	a5,52(sp)
     cc0:	03012c23          	sw	a6,56(sp)
     cc4:	03112e23          	sw	a7,60(sp)
     cc8:	00832583          	lw	a1,8(t1)
     ccc:	02410693          	add	a3,sp,36
     cd0:	00050613          	mv	a2,a0
     cd4:	00030513          	mv	a0,t1
     cd8:	00112e23          	sw	ra,28(sp)
     cdc:	00d12623          	sw	a3,12(sp)
     ce0:	0c8010ef          	jal	1da8 <_vfprintf_r>
     ce4:	01c12083          	lw	ra,28(sp)
     ce8:	04010113          	add	sp,sp,64
     cec:	00008067          	ret

00000cf0 <putchar>:
     cf0:	80000797          	auipc	a5,0x80000
     cf4:	a187a783          	lw	a5,-1512(a5) # 80000708 <_impure_ptr>
     cf8:	0087a603          	lw	a2,8(a5)
     cfc:	00050593          	mv	a1,a0
     d00:	00078513          	mv	a0,a5
     d04:	3c00606f          	j	70c4 <_putc_r>

00000d08 <_puts_r>:
     d08:	fd010113          	add	sp,sp,-48
     d0c:	02812423          	sw	s0,40(sp)
     d10:	00050413          	mv	s0,a0
     d14:	00058513          	mv	a0,a1
     d18:	02912223          	sw	s1,36(sp)
     d1c:	02112623          	sw	ra,44(sp)
     d20:	00058493          	mv	s1,a1
     d24:	3b0000ef          	jal	10d4 <strlen>
     d28:	00150713          	add	a4,a0,1
     d2c:	0000e697          	auipc	a3,0xe
     d30:	1fc68693          	add	a3,a3,508 # ef28 <__fini_array_end+0x130>
     d34:	00e12623          	sw	a4,12(sp)
     d38:	03442783          	lw	a5,52(s0)
     d3c:	01010713          	add	a4,sp,16
     d40:	00d12c23          	sw	a3,24(sp)
     d44:	00e12223          	sw	a4,4(sp)
     d48:	00100693          	li	a3,1
     d4c:	00200713          	li	a4,2
     d50:	00912823          	sw	s1,16(sp)
     d54:	00a12a23          	sw	a0,20(sp)
     d58:	00d12e23          	sw	a3,28(sp)
     d5c:	00e12423          	sw	a4,8(sp)
     d60:	00842483          	lw	s1,8(s0)
     d64:	0c078263          	beqz	a5,e28 <_puts_r+0x120>
     d68:	0644a703          	lw	a4,100(s1)
     d6c:	00c49783          	lh	a5,12(s1)
     d70:	00177713          	and	a4,a4,1
     d74:	00071663          	bnez	a4,d80 <_puts_r+0x78>
     d78:	2007f713          	and	a4,a5,512
     d7c:	08070e63          	beqz	a4,e18 <_puts_r+0x110>
     d80:	01279713          	sll	a4,a5,0x12
     d84:	02074263          	bltz	a4,da8 <_puts_r+0xa0>
     d88:	0644a703          	lw	a4,100(s1)
     d8c:	ffffe6b7          	lui	a3,0xffffe
     d90:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
     d94:	00002637          	lui	a2,0x2
     d98:	00c7e7b3          	or	a5,a5,a2
     d9c:	00d77733          	and	a4,a4,a3
     da0:	00f49623          	sh	a5,12(s1)
     da4:	06e4a223          	sw	a4,100(s1)
     da8:	00040513          	mv	a0,s0
     dac:	00410613          	add	a2,sp,4
     db0:	00048593          	mv	a1,s1
     db4:	549050ef          	jal	6afc <__sfvwrite_r>
     db8:	0644a783          	lw	a5,100(s1)
     dbc:	00153413          	seqz	s0,a0
     dc0:	40800433          	neg	s0,s0
     dc4:	00b47413          	and	s0,s0,11
     dc8:	0017f793          	and	a5,a5,1
     dcc:	fff40413          	add	s0,s0,-1
     dd0:	00079863          	bnez	a5,de0 <_puts_r+0xd8>
     dd4:	00c4d783          	lhu	a5,12(s1)
     dd8:	2007f793          	and	a5,a5,512
     ddc:	00078e63          	beqz	a5,df8 <_puts_r+0xf0>
     de0:	02c12083          	lw	ra,44(sp)
     de4:	00040513          	mv	a0,s0
     de8:	02812403          	lw	s0,40(sp)
     dec:	02412483          	lw	s1,36(sp)
     df0:	03010113          	add	sp,sp,48
     df4:	00008067          	ret
     df8:	0584a503          	lw	a0,88(s1)
     dfc:	054000ef          	jal	e50 <__retarget_lock_release_recursive>
     e00:	02c12083          	lw	ra,44(sp)
     e04:	00040513          	mv	a0,s0
     e08:	02812403          	lw	s0,40(sp)
     e0c:	02412483          	lw	s1,36(sp)
     e10:	03010113          	add	sp,sp,48
     e14:	00008067          	ret
     e18:	0584a503          	lw	a0,88(s1)
     e1c:	030000ef          	jal	e4c <__retarget_lock_acquire_recursive>
     e20:	00c49783          	lh	a5,12(s1)
     e24:	f5dff06f          	j	d80 <_puts_r+0x78>
     e28:	00040513          	mv	a0,s0
     e2c:	449050ef          	jal	6a74 <__sinit>
     e30:	f39ff06f          	j	d68 <_puts_r+0x60>

00000e34 <puts>:
     e34:	00050593          	mv	a1,a0
     e38:	80000517          	auipc	a0,0x80000
     e3c:	8d052503          	lw	a0,-1840(a0) # 80000708 <_impure_ptr>
     e40:	ec9ff06f          	j	d08 <_puts_r>

00000e44 <__retarget_lock_init_recursive>:
     e44:	00008067          	ret

00000e48 <__retarget_lock_close_recursive>:
     e48:	00008067          	ret

00000e4c <__retarget_lock_acquire_recursive>:
     e4c:	00008067          	ret

00000e50 <__retarget_lock_release_recursive>:
     e50:	00008067          	ret

00000e54 <memset>:
     e54:	00f00313          	li	t1,15
     e58:	00050713          	mv	a4,a0
     e5c:	02c37e63          	bgeu	t1,a2,e98 <memset+0x44>
     e60:	00f77793          	and	a5,a4,15
     e64:	0a079063          	bnez	a5,f04 <memset+0xb0>
     e68:	08059263          	bnez	a1,eec <memset+0x98>
     e6c:	ff067693          	and	a3,a2,-16
     e70:	00f67613          	and	a2,a2,15
     e74:	00e686b3          	add	a3,a3,a4
     e78:	00b72023          	sw	a1,0(a4) # fff60000 <__crt0_ram_last+0x7fee0001>
     e7c:	00b72223          	sw	a1,4(a4)
     e80:	00b72423          	sw	a1,8(a4)
     e84:	00b72623          	sw	a1,12(a4)
     e88:	01070713          	add	a4,a4,16
     e8c:	fed766e3          	bltu	a4,a3,e78 <memset+0x24>
     e90:	00061463          	bnez	a2,e98 <memset+0x44>
     e94:	00008067          	ret
     e98:	40c306b3          	sub	a3,t1,a2
     e9c:	00269693          	sll	a3,a3,0x2
     ea0:	00000297          	auipc	t0,0x0
     ea4:	005686b3          	add	a3,a3,t0
     ea8:	00c68067          	jr	12(a3)
     eac:	00b70723          	sb	a1,14(a4)
     eb0:	00b706a3          	sb	a1,13(a4)
     eb4:	00b70623          	sb	a1,12(a4)
     eb8:	00b705a3          	sb	a1,11(a4)
     ebc:	00b70523          	sb	a1,10(a4)
     ec0:	00b704a3          	sb	a1,9(a4)
     ec4:	00b70423          	sb	a1,8(a4)
     ec8:	00b703a3          	sb	a1,7(a4)
     ecc:	00b70323          	sb	a1,6(a4)
     ed0:	00b702a3          	sb	a1,5(a4)
     ed4:	00b70223          	sb	a1,4(a4)
     ed8:	00b701a3          	sb	a1,3(a4)
     edc:	00b70123          	sb	a1,2(a4)
     ee0:	00b700a3          	sb	a1,1(a4)
     ee4:	00b70023          	sb	a1,0(a4)
     ee8:	00008067          	ret
     eec:	0ff5f593          	zext.b	a1,a1
     ef0:	00859693          	sll	a3,a1,0x8
     ef4:	00d5e5b3          	or	a1,a1,a3
     ef8:	01059693          	sll	a3,a1,0x10
     efc:	00d5e5b3          	or	a1,a1,a3
     f00:	f6dff06f          	j	e6c <memset+0x18>
     f04:	00279693          	sll	a3,a5,0x2
     f08:	00000297          	auipc	t0,0x0
     f0c:	005686b3          	add	a3,a3,t0
     f10:	00008293          	mv	t0,ra
     f14:	fa0680e7          	jalr	-96(a3)
     f18:	00028093          	mv	ra,t0
     f1c:	ff078793          	add	a5,a5,-16
     f20:	40f70733          	sub	a4,a4,a5
     f24:	00f60633          	add	a2,a2,a5
     f28:	f6c378e3          	bgeu	t1,a2,e98 <memset+0x44>
     f2c:	f3dff06f          	j	e68 <memset+0x14>

00000f30 <memcpy>:
     f30:	00a5c7b3          	xor	a5,a1,a0
     f34:	0037f793          	and	a5,a5,3
     f38:	00c508b3          	add	a7,a0,a2
     f3c:	06079463          	bnez	a5,fa4 <memcpy+0x74>
     f40:	00300793          	li	a5,3
     f44:	06c7f063          	bgeu	a5,a2,fa4 <memcpy+0x74>
     f48:	00357793          	and	a5,a0,3
     f4c:	00050713          	mv	a4,a0
     f50:	06079a63          	bnez	a5,fc4 <memcpy+0x94>
     f54:	ffc8f613          	and	a2,a7,-4
     f58:	40e606b3          	sub	a3,a2,a4
     f5c:	02000793          	li	a5,32
     f60:	08d7ce63          	blt	a5,a3,ffc <memcpy+0xcc>
     f64:	00058693          	mv	a3,a1
     f68:	00070793          	mv	a5,a4
     f6c:	02c77863          	bgeu	a4,a2,f9c <memcpy+0x6c>
     f70:	0006a803          	lw	a6,0(a3)
     f74:	00478793          	add	a5,a5,4
     f78:	00468693          	add	a3,a3,4
     f7c:	ff07ae23          	sw	a6,-4(a5)
     f80:	fec7e8e3          	bltu	a5,a2,f70 <memcpy+0x40>
     f84:	fff60793          	add	a5,a2,-1 # 1fff <_vfprintf_r+0x257>
     f88:	40e787b3          	sub	a5,a5,a4
     f8c:	ffc7f793          	and	a5,a5,-4
     f90:	00478793          	add	a5,a5,4
     f94:	00f70733          	add	a4,a4,a5
     f98:	00f585b3          	add	a1,a1,a5
     f9c:	01176863          	bltu	a4,a7,fac <memcpy+0x7c>
     fa0:	00008067          	ret
     fa4:	00050713          	mv	a4,a0
     fa8:	05157863          	bgeu	a0,a7,ff8 <memcpy+0xc8>
     fac:	0005c783          	lbu	a5,0(a1)
     fb0:	00170713          	add	a4,a4,1
     fb4:	00158593          	add	a1,a1,1
     fb8:	fef70fa3          	sb	a5,-1(a4)
     fbc:	fee898e3          	bne	a7,a4,fac <memcpy+0x7c>
     fc0:	00008067          	ret
     fc4:	0005c683          	lbu	a3,0(a1)
     fc8:	00170713          	add	a4,a4,1
     fcc:	00377793          	and	a5,a4,3
     fd0:	fed70fa3          	sb	a3,-1(a4)
     fd4:	00158593          	add	a1,a1,1
     fd8:	f6078ee3          	beqz	a5,f54 <memcpy+0x24>
     fdc:	0005c683          	lbu	a3,0(a1)
     fe0:	00170713          	add	a4,a4,1
     fe4:	00377793          	and	a5,a4,3
     fe8:	fed70fa3          	sb	a3,-1(a4)
     fec:	00158593          	add	a1,a1,1
     ff0:	fc079ae3          	bnez	a5,fc4 <memcpy+0x94>
     ff4:	f61ff06f          	j	f54 <memcpy+0x24>
     ff8:	00008067          	ret
     ffc:	ff010113          	add	sp,sp,-16
    1000:	00812623          	sw	s0,12(sp)
    1004:	02000413          	li	s0,32
    1008:	0005a383          	lw	t2,0(a1)
    100c:	0045a283          	lw	t0,4(a1)
    1010:	0085af83          	lw	t6,8(a1)
    1014:	00c5af03          	lw	t5,12(a1)
    1018:	0105ae83          	lw	t4,16(a1)
    101c:	0145ae03          	lw	t3,20(a1)
    1020:	0185a303          	lw	t1,24(a1)
    1024:	01c5a803          	lw	a6,28(a1)
    1028:	0205a683          	lw	a3,32(a1)
    102c:	02470713          	add	a4,a4,36
    1030:	40e607b3          	sub	a5,a2,a4
    1034:	fc772e23          	sw	t2,-36(a4)
    1038:	fe572023          	sw	t0,-32(a4)
    103c:	fff72223          	sw	t6,-28(a4)
    1040:	ffe72423          	sw	t5,-24(a4)
    1044:	ffd72623          	sw	t4,-20(a4)
    1048:	ffc72823          	sw	t3,-16(a4)
    104c:	fe672a23          	sw	t1,-12(a4)
    1050:	ff072c23          	sw	a6,-8(a4)
    1054:	fed72e23          	sw	a3,-4(a4)
    1058:	02458593          	add	a1,a1,36
    105c:	faf446e3          	blt	s0,a5,1008 <memcpy+0xd8>
    1060:	00058693          	mv	a3,a1
    1064:	00070793          	mv	a5,a4
    1068:	02c77863          	bgeu	a4,a2,1098 <memcpy+0x168>
    106c:	0006a803          	lw	a6,0(a3)
    1070:	00478793          	add	a5,a5,4
    1074:	00468693          	add	a3,a3,4
    1078:	ff07ae23          	sw	a6,-4(a5)
    107c:	fec7e8e3          	bltu	a5,a2,106c <memcpy+0x13c>
    1080:	fff60793          	add	a5,a2,-1
    1084:	40e787b3          	sub	a5,a5,a4
    1088:	ffc7f793          	and	a5,a5,-4
    108c:	00478793          	add	a5,a5,4
    1090:	00f70733          	add	a4,a4,a5
    1094:	00f585b3          	add	a1,a1,a5
    1098:	01176863          	bltu	a4,a7,10a8 <memcpy+0x178>
    109c:	00c12403          	lw	s0,12(sp)
    10a0:	01010113          	add	sp,sp,16
    10a4:	00008067          	ret
    10a8:	0005c783          	lbu	a5,0(a1)
    10ac:	00170713          	add	a4,a4,1
    10b0:	00158593          	add	a1,a1,1
    10b4:	fef70fa3          	sb	a5,-1(a4)
    10b8:	fee882e3          	beq	a7,a4,109c <memcpy+0x16c>
    10bc:	0005c783          	lbu	a5,0(a1)
    10c0:	00170713          	add	a4,a4,1
    10c4:	00158593          	add	a1,a1,1
    10c8:	fef70fa3          	sb	a5,-1(a4)
    10cc:	fce89ee3          	bne	a7,a4,10a8 <memcpy+0x178>
    10d0:	fcdff06f          	j	109c <memcpy+0x16c>

000010d4 <strlen>:
    10d4:	00357793          	and	a5,a0,3
    10d8:	00050713          	mv	a4,a0
    10dc:	04079c63          	bnez	a5,1134 <strlen+0x60>
    10e0:	7f7f86b7          	lui	a3,0x7f7f8
    10e4:	f7f68693          	add	a3,a3,-129 # 7f7f7f7f <__neorv32_ram_size+0x7f777f7f>
    10e8:	fff00593          	li	a1,-1
    10ec:	00072603          	lw	a2,0(a4)
    10f0:	00470713          	add	a4,a4,4
    10f4:	00d677b3          	and	a5,a2,a3
    10f8:	00d787b3          	add	a5,a5,a3
    10fc:	00c7e7b3          	or	a5,a5,a2
    1100:	00d7e7b3          	or	a5,a5,a3
    1104:	feb784e3          	beq	a5,a1,10ec <strlen+0x18>
    1108:	ffc74683          	lbu	a3,-4(a4)
    110c:	40a707b3          	sub	a5,a4,a0
    1110:	04068463          	beqz	a3,1158 <strlen+0x84>
    1114:	ffd74683          	lbu	a3,-3(a4)
    1118:	02068c63          	beqz	a3,1150 <strlen+0x7c>
    111c:	ffe74503          	lbu	a0,-2(a4)
    1120:	00a03533          	snez	a0,a0
    1124:	00f50533          	add	a0,a0,a5
    1128:	ffe50513          	add	a0,a0,-2
    112c:	00008067          	ret
    1130:	fa0688e3          	beqz	a3,10e0 <strlen+0xc>
    1134:	00074783          	lbu	a5,0(a4)
    1138:	00170713          	add	a4,a4,1
    113c:	00377693          	and	a3,a4,3
    1140:	fe0798e3          	bnez	a5,1130 <strlen+0x5c>
    1144:	40a70733          	sub	a4,a4,a0
    1148:	fff70513          	add	a0,a4,-1
    114c:	00008067          	ret
    1150:	ffd78513          	add	a0,a5,-3
    1154:	00008067          	ret
    1158:	ffc78513          	add	a0,a5,-4
    115c:	00008067          	ret

00001160 <_malloc_trim_r>:
    1160:	fe010113          	add	sp,sp,-32
    1164:	00812c23          	sw	s0,24(sp)
    1168:	00912a23          	sw	s1,20(sp)
    116c:	01212823          	sw	s2,16(sp)
    1170:	01312623          	sw	s3,12(sp)
    1174:	01412423          	sw	s4,8(sp)
    1178:	00058993          	mv	s3,a1
    117c:	00112e23          	sw	ra,28(sp)
    1180:	00050913          	mv	s2,a0
    1184:	7ffffa17          	auipc	s4,0x7ffff
    1188:	f9ca0a13          	add	s4,s4,-100 # 80000120 <__malloc_av_>
    118c:	405000ef          	jal	1d90 <__malloc_lock>
    1190:	008a2703          	lw	a4,8(s4)
    1194:	000017b7          	lui	a5,0x1
    1198:	fef78793          	add	a5,a5,-17 # fef <memcpy+0xbf>
    119c:	00472483          	lw	s1,4(a4)
    11a0:	00001737          	lui	a4,0x1
    11a4:	ffc4f493          	and	s1,s1,-4
    11a8:	00f48433          	add	s0,s1,a5
    11ac:	41340433          	sub	s0,s0,s3
    11b0:	00c45413          	srl	s0,s0,0xc
    11b4:	fff40413          	add	s0,s0,-1
    11b8:	00c41413          	sll	s0,s0,0xc
    11bc:	00e44e63          	blt	s0,a4,11d8 <_malloc_trim_r+0x78>
    11c0:	00000593          	li	a1,0
    11c4:	00090513          	mv	a0,s2
    11c8:	105060ef          	jal	7acc <_sbrk_r>
    11cc:	008a2783          	lw	a5,8(s4)
    11d0:	009787b3          	add	a5,a5,s1
    11d4:	02f50863          	beq	a0,a5,1204 <_malloc_trim_r+0xa4>
    11d8:	00090513          	mv	a0,s2
    11dc:	3c1000ef          	jal	1d9c <__malloc_unlock>
    11e0:	01c12083          	lw	ra,28(sp)
    11e4:	01812403          	lw	s0,24(sp)
    11e8:	01412483          	lw	s1,20(sp)
    11ec:	01012903          	lw	s2,16(sp)
    11f0:	00c12983          	lw	s3,12(sp)
    11f4:	00812a03          	lw	s4,8(sp)
    11f8:	00000513          	li	a0,0
    11fc:	02010113          	add	sp,sp,32
    1200:	00008067          	ret
    1204:	408005b3          	neg	a1,s0
    1208:	00090513          	mv	a0,s2
    120c:	0c1060ef          	jal	7acc <_sbrk_r>
    1210:	fff00793          	li	a5,-1
    1214:	04f50a63          	beq	a0,a5,1268 <_malloc_trim_r+0x108>
    1218:	7ffff717          	auipc	a4,0x7ffff
    121c:	55c70713          	add	a4,a4,1372 # 80000774 <__malloc_current_mallinfo>
    1220:	00072783          	lw	a5,0(a4)
    1224:	008a2683          	lw	a3,8(s4)
    1228:	408484b3          	sub	s1,s1,s0
    122c:	0014e493          	or	s1,s1,1
    1230:	408787b3          	sub	a5,a5,s0
    1234:	00090513          	mv	a0,s2
    1238:	0096a223          	sw	s1,4(a3)
    123c:	00f72023          	sw	a5,0(a4)
    1240:	35d000ef          	jal	1d9c <__malloc_unlock>
    1244:	01c12083          	lw	ra,28(sp)
    1248:	01812403          	lw	s0,24(sp)
    124c:	01412483          	lw	s1,20(sp)
    1250:	01012903          	lw	s2,16(sp)
    1254:	00c12983          	lw	s3,12(sp)
    1258:	00812a03          	lw	s4,8(sp)
    125c:	00100513          	li	a0,1
    1260:	02010113          	add	sp,sp,32
    1264:	00008067          	ret
    1268:	00000593          	li	a1,0
    126c:	00090513          	mv	a0,s2
    1270:	05d060ef          	jal	7acc <_sbrk_r>
    1274:	008a2703          	lw	a4,8(s4)
    1278:	00f00693          	li	a3,15
    127c:	40e507b3          	sub	a5,a0,a4
    1280:	f4f6dce3          	bge	a3,a5,11d8 <_malloc_trim_r+0x78>
    1284:	7ffff697          	auipc	a3,0x7ffff
    1288:	4886a683          	lw	a3,1160(a3) # 8000070c <__malloc_sbrk_base>
    128c:	40d50533          	sub	a0,a0,a3
    1290:	0017e793          	or	a5,a5,1
    1294:	7ffff697          	auipc	a3,0x7ffff
    1298:	4ea6a023          	sw	a0,1248(a3) # 80000774 <__malloc_current_mallinfo>
    129c:	00f72223          	sw	a5,4(a4)
    12a0:	f39ff06f          	j	11d8 <_malloc_trim_r+0x78>

000012a4 <_free_r>:
    12a4:	18058263          	beqz	a1,1428 <_free_r+0x184>
    12a8:	ff010113          	add	sp,sp,-16
    12ac:	00812423          	sw	s0,8(sp)
    12b0:	00912223          	sw	s1,4(sp)
    12b4:	00058413          	mv	s0,a1
    12b8:	00050493          	mv	s1,a0
    12bc:	00112623          	sw	ra,12(sp)
    12c0:	2d1000ef          	jal	1d90 <__malloc_lock>
    12c4:	ffc42583          	lw	a1,-4(s0)
    12c8:	ff840713          	add	a4,s0,-8
    12cc:	7ffff517          	auipc	a0,0x7ffff
    12d0:	e5450513          	add	a0,a0,-428 # 80000120 <__malloc_av_>
    12d4:	ffe5f793          	and	a5,a1,-2
    12d8:	00f70633          	add	a2,a4,a5
    12dc:	00462683          	lw	a3,4(a2)
    12e0:	00852803          	lw	a6,8(a0)
    12e4:	ffc6f693          	and	a3,a3,-4
    12e8:	1ac80263          	beq	a6,a2,148c <_free_r+0x1e8>
    12ec:	00d62223          	sw	a3,4(a2)
    12f0:	0015f593          	and	a1,a1,1
    12f4:	00d60833          	add	a6,a2,a3
    12f8:	0a059063          	bnez	a1,1398 <_free_r+0xf4>
    12fc:	ff842303          	lw	t1,-8(s0)
    1300:	00482583          	lw	a1,4(a6)
    1304:	7ffff897          	auipc	a7,0x7ffff
    1308:	e2488893          	add	a7,a7,-476 # 80000128 <__malloc_av_+0x8>
    130c:	40670733          	sub	a4,a4,t1
    1310:	00872803          	lw	a6,8(a4)
    1314:	006787b3          	add	a5,a5,t1
    1318:	0015f593          	and	a1,a1,1
    131c:	15180263          	beq	a6,a7,1460 <_free_r+0x1bc>
    1320:	00c72303          	lw	t1,12(a4)
    1324:	00682623          	sw	t1,12(a6)
    1328:	01032423          	sw	a6,8(t1)
    132c:	1a058a63          	beqz	a1,14e0 <_free_r+0x23c>
    1330:	0017e693          	or	a3,a5,1
    1334:	00d72223          	sw	a3,4(a4)
    1338:	00f62023          	sw	a5,0(a2)
    133c:	1ff00693          	li	a3,511
    1340:	06f6ec63          	bltu	a3,a5,13b8 <_free_r+0x114>
    1344:	ff87f693          	and	a3,a5,-8
    1348:	00868693          	add	a3,a3,8
    134c:	00452583          	lw	a1,4(a0)
    1350:	00d506b3          	add	a3,a0,a3
    1354:	0006a603          	lw	a2,0(a3)
    1358:	0057d813          	srl	a6,a5,0x5
    135c:	00100793          	li	a5,1
    1360:	010797b3          	sll	a5,a5,a6
    1364:	00b7e7b3          	or	a5,a5,a1
    1368:	ff868593          	add	a1,a3,-8
    136c:	00b72623          	sw	a1,12(a4)
    1370:	00c72423          	sw	a2,8(a4)
    1374:	00f52223          	sw	a5,4(a0)
    1378:	00e6a023          	sw	a4,0(a3)
    137c:	00e62623          	sw	a4,12(a2)
    1380:	00812403          	lw	s0,8(sp)
    1384:	00c12083          	lw	ra,12(sp)
    1388:	00048513          	mv	a0,s1
    138c:	00412483          	lw	s1,4(sp)
    1390:	01010113          	add	sp,sp,16
    1394:	2090006f          	j	1d9c <__malloc_unlock>
    1398:	00482583          	lw	a1,4(a6)
    139c:	0015f593          	and	a1,a1,1
    13a0:	08058663          	beqz	a1,142c <_free_r+0x188>
    13a4:	0017e693          	or	a3,a5,1
    13a8:	fed42e23          	sw	a3,-4(s0)
    13ac:	00f62023          	sw	a5,0(a2)
    13b0:	1ff00693          	li	a3,511
    13b4:	f8f6f8e3          	bgeu	a3,a5,1344 <_free_r+0xa0>
    13b8:	0097d693          	srl	a3,a5,0x9
    13bc:	00400613          	li	a2,4
    13c0:	12d66463          	bltu	a2,a3,14e8 <_free_r+0x244>
    13c4:	0067d693          	srl	a3,a5,0x6
    13c8:	03968593          	add	a1,a3,57
    13cc:	03868613          	add	a2,a3,56
    13d0:	00359593          	sll	a1,a1,0x3
    13d4:	00b505b3          	add	a1,a0,a1
    13d8:	0005a683          	lw	a3,0(a1)
    13dc:	ff858593          	add	a1,a1,-8
    13e0:	00d59863          	bne	a1,a3,13f0 <_free_r+0x14c>
    13e4:	15c0006f          	j	1540 <_free_r+0x29c>
    13e8:	0086a683          	lw	a3,8(a3)
    13ec:	00d58863          	beq	a1,a3,13fc <_free_r+0x158>
    13f0:	0046a603          	lw	a2,4(a3)
    13f4:	ffc67613          	and	a2,a2,-4
    13f8:	fec7e8e3          	bltu	a5,a2,13e8 <_free_r+0x144>
    13fc:	00c6a583          	lw	a1,12(a3)
    1400:	00b72623          	sw	a1,12(a4)
    1404:	00d72423          	sw	a3,8(a4)
    1408:	00812403          	lw	s0,8(sp)
    140c:	00c12083          	lw	ra,12(sp)
    1410:	00e5a423          	sw	a4,8(a1)
    1414:	00048513          	mv	a0,s1
    1418:	00412483          	lw	s1,4(sp)
    141c:	00e6a623          	sw	a4,12(a3)
    1420:	01010113          	add	sp,sp,16
    1424:	1790006f          	j	1d9c <__malloc_unlock>
    1428:	00008067          	ret
    142c:	00d787b3          	add	a5,a5,a3
    1430:	7ffff897          	auipc	a7,0x7ffff
    1434:	cf888893          	add	a7,a7,-776 # 80000128 <__malloc_av_+0x8>
    1438:	00862683          	lw	a3,8(a2)
    143c:	0f168063          	beq	a3,a7,151c <_free_r+0x278>
    1440:	00c62803          	lw	a6,12(a2)
    1444:	0017e593          	or	a1,a5,1
    1448:	00f70633          	add	a2,a4,a5
    144c:	0106a623          	sw	a6,12(a3)
    1450:	00d82423          	sw	a3,8(a6)
    1454:	00b72223          	sw	a1,4(a4)
    1458:	00f62023          	sw	a5,0(a2)
    145c:	ee1ff06f          	j	133c <_free_r+0x98>
    1460:	14059063          	bnez	a1,15a0 <_free_r+0x2fc>
    1464:	00862583          	lw	a1,8(a2)
    1468:	00c62603          	lw	a2,12(a2)
    146c:	00f686b3          	add	a3,a3,a5
    1470:	0016e793          	or	a5,a3,1
    1474:	00c5a623          	sw	a2,12(a1)
    1478:	00b62423          	sw	a1,8(a2)
    147c:	00f72223          	sw	a5,4(a4)
    1480:	00d70733          	add	a4,a4,a3
    1484:	00d72023          	sw	a3,0(a4)
    1488:	ef9ff06f          	j	1380 <_free_r+0xdc>
    148c:	0015f593          	and	a1,a1,1
    1490:	00d786b3          	add	a3,a5,a3
    1494:	02059063          	bnez	a1,14b4 <_free_r+0x210>
    1498:	ff842583          	lw	a1,-8(s0)
    149c:	40b70733          	sub	a4,a4,a1
    14a0:	00c72783          	lw	a5,12(a4)
    14a4:	00872603          	lw	a2,8(a4)
    14a8:	00b686b3          	add	a3,a3,a1
    14ac:	00f62623          	sw	a5,12(a2)
    14b0:	00c7a423          	sw	a2,8(a5)
    14b4:	0016e793          	or	a5,a3,1
    14b8:	00f72223          	sw	a5,4(a4)
    14bc:	00e52423          	sw	a4,8(a0)
    14c0:	7ffff797          	auipc	a5,0x7ffff
    14c4:	2507a783          	lw	a5,592(a5) # 80000710 <__malloc_trim_threshold>
    14c8:	eaf6ece3          	bltu	a3,a5,1380 <_free_r+0xdc>
    14cc:	7ffff597          	auipc	a1,0x7ffff
    14d0:	2605a583          	lw	a1,608(a1) # 8000072c <__malloc_top_pad>
    14d4:	00048513          	mv	a0,s1
    14d8:	c89ff0ef          	jal	1160 <_malloc_trim_r>
    14dc:	ea5ff06f          	j	1380 <_free_r+0xdc>
    14e0:	00d787b3          	add	a5,a5,a3
    14e4:	f55ff06f          	j	1438 <_free_r+0x194>
    14e8:	01400613          	li	a2,20
    14ec:	02d67063          	bgeu	a2,a3,150c <_free_r+0x268>
    14f0:	05400613          	li	a2,84
    14f4:	06d66463          	bltu	a2,a3,155c <_free_r+0x2b8>
    14f8:	00c7d693          	srl	a3,a5,0xc
    14fc:	06f68593          	add	a1,a3,111
    1500:	06e68613          	add	a2,a3,110
    1504:	00359593          	sll	a1,a1,0x3
    1508:	ecdff06f          	j	13d4 <_free_r+0x130>
    150c:	05c68593          	add	a1,a3,92
    1510:	05b68613          	add	a2,a3,91
    1514:	00359593          	sll	a1,a1,0x3
    1518:	ebdff06f          	j	13d4 <_free_r+0x130>
    151c:	00e52a23          	sw	a4,20(a0)
    1520:	00e52823          	sw	a4,16(a0)
    1524:	0017e693          	or	a3,a5,1
    1528:	01172623          	sw	a7,12(a4)
    152c:	01172423          	sw	a7,8(a4)
    1530:	00d72223          	sw	a3,4(a4)
    1534:	00f70733          	add	a4,a4,a5
    1538:	00f72023          	sw	a5,0(a4)
    153c:	e45ff06f          	j	1380 <_free_r+0xdc>
    1540:	00452803          	lw	a6,4(a0)
    1544:	40265613          	sra	a2,a2,0x2
    1548:	00100793          	li	a5,1
    154c:	00c797b3          	sll	a5,a5,a2
    1550:	0107e7b3          	or	a5,a5,a6
    1554:	00f52223          	sw	a5,4(a0)
    1558:	ea9ff06f          	j	1400 <_free_r+0x15c>
    155c:	15400613          	li	a2,340
    1560:	00d66c63          	bltu	a2,a3,1578 <_free_r+0x2d4>
    1564:	00f7d693          	srl	a3,a5,0xf
    1568:	07868593          	add	a1,a3,120
    156c:	07768613          	add	a2,a3,119
    1570:	00359593          	sll	a1,a1,0x3
    1574:	e61ff06f          	j	13d4 <_free_r+0x130>
    1578:	55400613          	li	a2,1364
    157c:	00d66c63          	bltu	a2,a3,1594 <_free_r+0x2f0>
    1580:	0127d693          	srl	a3,a5,0x12
    1584:	07d68593          	add	a1,a3,125
    1588:	07c68613          	add	a2,a3,124
    158c:	00359593          	sll	a1,a1,0x3
    1590:	e45ff06f          	j	13d4 <_free_r+0x130>
    1594:	3f800593          	li	a1,1016
    1598:	07e00613          	li	a2,126
    159c:	e39ff06f          	j	13d4 <_free_r+0x130>
    15a0:	0017e693          	or	a3,a5,1
    15a4:	00d72223          	sw	a3,4(a4)
    15a8:	00f62023          	sw	a5,0(a2)
    15ac:	dd5ff06f          	j	1380 <_free_r+0xdc>

000015b0 <_malloc_r>:
    15b0:	fd010113          	add	sp,sp,-48
    15b4:	03212023          	sw	s2,32(sp)
    15b8:	02112623          	sw	ra,44(sp)
    15bc:	02812423          	sw	s0,40(sp)
    15c0:	02912223          	sw	s1,36(sp)
    15c4:	01312e23          	sw	s3,28(sp)
    15c8:	00b58793          	add	a5,a1,11
    15cc:	01600713          	li	a4,22
    15d0:	00050913          	mv	s2,a0
    15d4:	08f76263          	bltu	a4,a5,1658 <_malloc_r+0xa8>
    15d8:	01000793          	li	a5,16
    15dc:	20b7e663          	bltu	a5,a1,17e8 <_malloc_r+0x238>
    15e0:	7b0000ef          	jal	1d90 <__malloc_lock>
    15e4:	01800793          	li	a5,24
    15e8:	00200593          	li	a1,2
    15ec:	01000493          	li	s1,16
    15f0:	7ffff997          	auipc	s3,0x7ffff
    15f4:	b3098993          	add	s3,s3,-1232 # 80000120 <__malloc_av_>
    15f8:	00f987b3          	add	a5,s3,a5
    15fc:	0047a403          	lw	s0,4(a5)
    1600:	ff878713          	add	a4,a5,-8
    1604:	36e40463          	beq	s0,a4,196c <_malloc_r+0x3bc>
    1608:	00442783          	lw	a5,4(s0)
    160c:	00c42683          	lw	a3,12(s0)
    1610:	00842603          	lw	a2,8(s0)
    1614:	ffc7f793          	and	a5,a5,-4
    1618:	00f407b3          	add	a5,s0,a5
    161c:	0047a703          	lw	a4,4(a5)
    1620:	00d62623          	sw	a3,12(a2)
    1624:	00c6a423          	sw	a2,8(a3)
    1628:	00176713          	or	a4,a4,1
    162c:	00090513          	mv	a0,s2
    1630:	00e7a223          	sw	a4,4(a5)
    1634:	768000ef          	jal	1d9c <__malloc_unlock>
    1638:	00840513          	add	a0,s0,8
    163c:	02c12083          	lw	ra,44(sp)
    1640:	02812403          	lw	s0,40(sp)
    1644:	02412483          	lw	s1,36(sp)
    1648:	02012903          	lw	s2,32(sp)
    164c:	01c12983          	lw	s3,28(sp)
    1650:	03010113          	add	sp,sp,48
    1654:	00008067          	ret
    1658:	ff87f493          	and	s1,a5,-8
    165c:	1807c663          	bltz	a5,17e8 <_malloc_r+0x238>
    1660:	18b4e463          	bltu	s1,a1,17e8 <_malloc_r+0x238>
    1664:	72c000ef          	jal	1d90 <__malloc_lock>
    1668:	1f700793          	li	a5,503
    166c:	4097fa63          	bgeu	a5,s1,1a80 <_malloc_r+0x4d0>
    1670:	0094d793          	srl	a5,s1,0x9
    1674:	18078263          	beqz	a5,17f8 <_malloc_r+0x248>
    1678:	00400713          	li	a4,4
    167c:	36f76063          	bltu	a4,a5,19dc <_malloc_r+0x42c>
    1680:	0064d793          	srl	a5,s1,0x6
    1684:	03978593          	add	a1,a5,57
    1688:	03878813          	add	a6,a5,56
    168c:	00359613          	sll	a2,a1,0x3
    1690:	7ffff997          	auipc	s3,0x7ffff
    1694:	a9098993          	add	s3,s3,-1392 # 80000120 <__malloc_av_>
    1698:	00c98633          	add	a2,s3,a2
    169c:	00462403          	lw	s0,4(a2)
    16a0:	ff860613          	add	a2,a2,-8
    16a4:	02860863          	beq	a2,s0,16d4 <_malloc_r+0x124>
    16a8:	00f00513          	li	a0,15
    16ac:	0140006f          	j	16c0 <_malloc_r+0x110>
    16b0:	00c42683          	lw	a3,12(s0)
    16b4:	2a075863          	bgez	a4,1964 <_malloc_r+0x3b4>
    16b8:	00d60e63          	beq	a2,a3,16d4 <_malloc_r+0x124>
    16bc:	00068413          	mv	s0,a3
    16c0:	00442783          	lw	a5,4(s0)
    16c4:	ffc7f793          	and	a5,a5,-4
    16c8:	40978733          	sub	a4,a5,s1
    16cc:	fee552e3          	bge	a0,a4,16b0 <_malloc_r+0x100>
    16d0:	00080593          	mv	a1,a6
    16d4:	0109a403          	lw	s0,16(s3)
    16d8:	7ffff897          	auipc	a7,0x7ffff
    16dc:	a5088893          	add	a7,a7,-1456 # 80000128 <__malloc_av_+0x8>
    16e0:	27140e63          	beq	s0,a7,195c <_malloc_r+0x3ac>
    16e4:	00442783          	lw	a5,4(s0)
    16e8:	00f00693          	li	a3,15
    16ec:	ffc7f793          	and	a5,a5,-4
    16f0:	40978733          	sub	a4,a5,s1
    16f4:	38e6cc63          	blt	a3,a4,1a8c <_malloc_r+0x4dc>
    16f8:	0119aa23          	sw	a7,20(s3)
    16fc:	0119a823          	sw	a7,16(s3)
    1700:	36075063          	bgez	a4,1a60 <_malloc_r+0x4b0>
    1704:	1ff00713          	li	a4,511
    1708:	0049a503          	lw	a0,4(s3)
    170c:	26f76863          	bltu	a4,a5,197c <_malloc_r+0x3cc>
    1710:	ff87f713          	and	a4,a5,-8
    1714:	00870713          	add	a4,a4,8
    1718:	00e98733          	add	a4,s3,a4
    171c:	00072683          	lw	a3,0(a4)
    1720:	0057d613          	srl	a2,a5,0x5
    1724:	00100793          	li	a5,1
    1728:	00c797b3          	sll	a5,a5,a2
    172c:	00f56533          	or	a0,a0,a5
    1730:	ff870793          	add	a5,a4,-8
    1734:	00f42623          	sw	a5,12(s0)
    1738:	00d42423          	sw	a3,8(s0)
    173c:	00a9a223          	sw	a0,4(s3)
    1740:	00872023          	sw	s0,0(a4)
    1744:	0086a623          	sw	s0,12(a3)
    1748:	4025d793          	sra	a5,a1,0x2
    174c:	00100613          	li	a2,1
    1750:	00f61633          	sll	a2,a2,a5
    1754:	0ac56a63          	bltu	a0,a2,1808 <_malloc_r+0x258>
    1758:	00a677b3          	and	a5,a2,a0
    175c:	02079463          	bnez	a5,1784 <_malloc_r+0x1d4>
    1760:	00161613          	sll	a2,a2,0x1
    1764:	ffc5f593          	and	a1,a1,-4
    1768:	00a677b3          	and	a5,a2,a0
    176c:	00458593          	add	a1,a1,4
    1770:	00079a63          	bnez	a5,1784 <_malloc_r+0x1d4>
    1774:	00161613          	sll	a2,a2,0x1
    1778:	00a677b3          	and	a5,a2,a0
    177c:	00458593          	add	a1,a1,4
    1780:	fe078ae3          	beqz	a5,1774 <_malloc_r+0x1c4>
    1784:	00f00813          	li	a6,15
    1788:	00359313          	sll	t1,a1,0x3
    178c:	00698333          	add	t1,s3,t1
    1790:	00030513          	mv	a0,t1
    1794:	00c52783          	lw	a5,12(a0)
    1798:	00058e13          	mv	t3,a1
    179c:	26f50263          	beq	a0,a5,1a00 <_malloc_r+0x450>
    17a0:	0047a703          	lw	a4,4(a5)
    17a4:	00078413          	mv	s0,a5
    17a8:	00c7a783          	lw	a5,12(a5)
    17ac:	ffc77713          	and	a4,a4,-4
    17b0:	409706b3          	sub	a3,a4,s1
    17b4:	26d84263          	blt	a6,a3,1a18 <_malloc_r+0x468>
    17b8:	fe06c2e3          	bltz	a3,179c <_malloc_r+0x1ec>
    17bc:	00e40733          	add	a4,s0,a4
    17c0:	00472683          	lw	a3,4(a4)
    17c4:	00842603          	lw	a2,8(s0)
    17c8:	00090513          	mv	a0,s2
    17cc:	0016e693          	or	a3,a3,1
    17d0:	00d72223          	sw	a3,4(a4)
    17d4:	00f62623          	sw	a5,12(a2)
    17d8:	00c7a423          	sw	a2,8(a5)
    17dc:	5c0000ef          	jal	1d9c <__malloc_unlock>
    17e0:	00840513          	add	a0,s0,8
    17e4:	e59ff06f          	j	163c <_malloc_r+0x8c>
    17e8:	00c00793          	li	a5,12
    17ec:	00f92023          	sw	a5,0(s2)
    17f0:	00000513          	li	a0,0
    17f4:	e49ff06f          	j	163c <_malloc_r+0x8c>
    17f8:	20000613          	li	a2,512
    17fc:	04000593          	li	a1,64
    1800:	03f00813          	li	a6,63
    1804:	e8dff06f          	j	1690 <_malloc_r+0xe0>
    1808:	0089a403          	lw	s0,8(s3)
    180c:	01612823          	sw	s6,16(sp)
    1810:	00442783          	lw	a5,4(s0)
    1814:	ffc7fb13          	and	s6,a5,-4
    1818:	009b6863          	bltu	s6,s1,1828 <_malloc_r+0x278>
    181c:	409b0733          	sub	a4,s6,s1
    1820:	00f00793          	li	a5,15
    1824:	0ee7ca63          	blt	a5,a4,1918 <_malloc_r+0x368>
    1828:	01912223          	sw	s9,4(sp)
    182c:	7ffffc97          	auipc	s9,0x7ffff
    1830:	ee0c8c93          	add	s9,s9,-288 # 8000070c <__malloc_sbrk_base>
    1834:	000ca703          	lw	a4,0(s9)
    1838:	01412c23          	sw	s4,24(sp)
    183c:	01512a23          	sw	s5,20(sp)
    1840:	01712623          	sw	s7,12(sp)
    1844:	7ffffa97          	auipc	s5,0x7ffff
    1848:	ee8aaa83          	lw	s5,-280(s5) # 8000072c <__malloc_top_pad>
    184c:	fff00793          	li	a5,-1
    1850:	01640a33          	add	s4,s0,s6
    1854:	01548ab3          	add	s5,s1,s5
    1858:	3ef70263          	beq	a4,a5,1c3c <_malloc_r+0x68c>
    185c:	000017b7          	lui	a5,0x1
    1860:	00f78793          	add	a5,a5,15 # 100f <memcpy+0xdf>
    1864:	00fa8ab3          	add	s5,s5,a5
    1868:	fffff7b7          	lui	a5,0xfffff
    186c:	00fafab3          	and	s5,s5,a5
    1870:	000a8593          	mv	a1,s5
    1874:	00090513          	mv	a0,s2
    1878:	254060ef          	jal	7acc <_sbrk_r>
    187c:	fff00793          	li	a5,-1
    1880:	00050b93          	mv	s7,a0
    1884:	46f50663          	beq	a0,a5,1cf0 <_malloc_r+0x740>
    1888:	01812423          	sw	s8,8(sp)
    188c:	25456863          	bltu	a0,s4,1adc <_malloc_r+0x52c>
    1890:	7ffffc17          	auipc	s8,0x7ffff
    1894:	ee4c0c13          	add	s8,s8,-284 # 80000774 <__malloc_current_mallinfo>
    1898:	000c2583          	lw	a1,0(s8)
    189c:	00ba85b3          	add	a1,s5,a1
    18a0:	00bc2023          	sw	a1,0(s8)
    18a4:	00058713          	mv	a4,a1
    18a8:	2caa1063          	bne	s4,a0,1b68 <_malloc_r+0x5b8>
    18ac:	01451793          	sll	a5,a0,0x14
    18b0:	2a079c63          	bnez	a5,1b68 <_malloc_r+0x5b8>
    18b4:	0089ab83          	lw	s7,8(s3)
    18b8:	015b07b3          	add	a5,s6,s5
    18bc:	0017e793          	or	a5,a5,1
    18c0:	00fba223          	sw	a5,4(s7)
    18c4:	7ffff717          	auipc	a4,0x7ffff
    18c8:	e6470713          	add	a4,a4,-412 # 80000728 <__malloc_max_sbrked_mem>
    18cc:	00072683          	lw	a3,0(a4)
    18d0:	00b6f463          	bgeu	a3,a1,18d8 <_malloc_r+0x328>
    18d4:	00b72023          	sw	a1,0(a4)
    18d8:	7ffff717          	auipc	a4,0x7ffff
    18dc:	e4c70713          	add	a4,a4,-436 # 80000724 <__malloc_max_total_mem>
    18e0:	00072683          	lw	a3,0(a4)
    18e4:	00b6f463          	bgeu	a3,a1,18ec <_malloc_r+0x33c>
    18e8:	00b72023          	sw	a1,0(a4)
    18ec:	00812c03          	lw	s8,8(sp)
    18f0:	000b8413          	mv	s0,s7
    18f4:	ffc7f793          	and	a5,a5,-4
    18f8:	40978733          	sub	a4,a5,s1
    18fc:	3897ec63          	bltu	a5,s1,1c94 <_malloc_r+0x6e4>
    1900:	00f00793          	li	a5,15
    1904:	38e7d863          	bge	a5,a4,1c94 <_malloc_r+0x6e4>
    1908:	01812a03          	lw	s4,24(sp)
    190c:	01412a83          	lw	s5,20(sp)
    1910:	00c12b83          	lw	s7,12(sp)
    1914:	00412c83          	lw	s9,4(sp)
    1918:	0014e793          	or	a5,s1,1
    191c:	00f42223          	sw	a5,4(s0)
    1920:	009404b3          	add	s1,s0,s1
    1924:	0099a423          	sw	s1,8(s3)
    1928:	00176713          	or	a4,a4,1
    192c:	00090513          	mv	a0,s2
    1930:	00e4a223          	sw	a4,4(s1)
    1934:	468000ef          	jal	1d9c <__malloc_unlock>
    1938:	02c12083          	lw	ra,44(sp)
    193c:	00840513          	add	a0,s0,8
    1940:	02812403          	lw	s0,40(sp)
    1944:	01012b03          	lw	s6,16(sp)
    1948:	02412483          	lw	s1,36(sp)
    194c:	02012903          	lw	s2,32(sp)
    1950:	01c12983          	lw	s3,28(sp)
    1954:	03010113          	add	sp,sp,48
    1958:	00008067          	ret
    195c:	0049a503          	lw	a0,4(s3)
    1960:	de9ff06f          	j	1748 <_malloc_r+0x198>
    1964:	00842603          	lw	a2,8(s0)
    1968:	cb1ff06f          	j	1618 <_malloc_r+0x68>
    196c:	00c7a403          	lw	s0,12(a5) # fffff00c <__crt0_ram_last+0x7ff7f00d>
    1970:	00258593          	add	a1,a1,2
    1974:	d68780e3          	beq	a5,s0,16d4 <_malloc_r+0x124>
    1978:	c91ff06f          	j	1608 <_malloc_r+0x58>
    197c:	0097d713          	srl	a4,a5,0x9
    1980:	00400693          	li	a3,4
    1984:	14e6f263          	bgeu	a3,a4,1ac8 <_malloc_r+0x518>
    1988:	01400693          	li	a3,20
    198c:	32e6e663          	bltu	a3,a4,1cb8 <_malloc_r+0x708>
    1990:	05c70613          	add	a2,a4,92
    1994:	05b70693          	add	a3,a4,91
    1998:	00361613          	sll	a2,a2,0x3
    199c:	00c98633          	add	a2,s3,a2
    19a0:	00062703          	lw	a4,0(a2)
    19a4:	ff860613          	add	a2,a2,-8
    19a8:	00e61863          	bne	a2,a4,19b8 <_malloc_r+0x408>
    19ac:	2980006f          	j	1c44 <_malloc_r+0x694>
    19b0:	00872703          	lw	a4,8(a4)
    19b4:	00e60863          	beq	a2,a4,19c4 <_malloc_r+0x414>
    19b8:	00472683          	lw	a3,4(a4)
    19bc:	ffc6f693          	and	a3,a3,-4
    19c0:	fed7e8e3          	bltu	a5,a3,19b0 <_malloc_r+0x400>
    19c4:	00c72603          	lw	a2,12(a4)
    19c8:	00c42623          	sw	a2,12(s0)
    19cc:	00e42423          	sw	a4,8(s0)
    19d0:	00862423          	sw	s0,8(a2)
    19d4:	00872623          	sw	s0,12(a4)
    19d8:	d71ff06f          	j	1748 <_malloc_r+0x198>
    19dc:	01400713          	li	a4,20
    19e0:	10f77863          	bgeu	a4,a5,1af0 <_malloc_r+0x540>
    19e4:	05400713          	li	a4,84
    19e8:	2ef76663          	bltu	a4,a5,1cd4 <_malloc_r+0x724>
    19ec:	00c4d793          	srl	a5,s1,0xc
    19f0:	06f78593          	add	a1,a5,111
    19f4:	06e78813          	add	a6,a5,110
    19f8:	00359613          	sll	a2,a1,0x3
    19fc:	c95ff06f          	j	1690 <_malloc_r+0xe0>
    1a00:	001e0e13          	add	t3,t3,1
    1a04:	003e7793          	and	a5,t3,3
    1a08:	00850513          	add	a0,a0,8
    1a0c:	10078063          	beqz	a5,1b0c <_malloc_r+0x55c>
    1a10:	00c52783          	lw	a5,12(a0)
    1a14:	d89ff06f          	j	179c <_malloc_r+0x1ec>
    1a18:	00842603          	lw	a2,8(s0)
    1a1c:	0014e593          	or	a1,s1,1
    1a20:	00b42223          	sw	a1,4(s0)
    1a24:	00f62623          	sw	a5,12(a2)
    1a28:	00c7a423          	sw	a2,8(a5)
    1a2c:	009404b3          	add	s1,s0,s1
    1a30:	0099aa23          	sw	s1,20(s3)
    1a34:	0099a823          	sw	s1,16(s3)
    1a38:	0016e793          	or	a5,a3,1
    1a3c:	0114a623          	sw	a7,12(s1)
    1a40:	0114a423          	sw	a7,8(s1)
    1a44:	00f4a223          	sw	a5,4(s1)
    1a48:	00e40733          	add	a4,s0,a4
    1a4c:	00090513          	mv	a0,s2
    1a50:	00d72023          	sw	a3,0(a4)
    1a54:	348000ef          	jal	1d9c <__malloc_unlock>
    1a58:	00840513          	add	a0,s0,8
    1a5c:	be1ff06f          	j	163c <_malloc_r+0x8c>
    1a60:	00f407b3          	add	a5,s0,a5
    1a64:	0047a703          	lw	a4,4(a5)
    1a68:	00090513          	mv	a0,s2
    1a6c:	00176713          	or	a4,a4,1
    1a70:	00e7a223          	sw	a4,4(a5)
    1a74:	328000ef          	jal	1d9c <__malloc_unlock>
    1a78:	00840513          	add	a0,s0,8
    1a7c:	bc1ff06f          	j	163c <_malloc_r+0x8c>
    1a80:	0034d593          	srl	a1,s1,0x3
    1a84:	00848793          	add	a5,s1,8
    1a88:	b69ff06f          	j	15f0 <_malloc_r+0x40>
    1a8c:	0014e693          	or	a3,s1,1
    1a90:	00d42223          	sw	a3,4(s0)
    1a94:	009404b3          	add	s1,s0,s1
    1a98:	0099aa23          	sw	s1,20(s3)
    1a9c:	0099a823          	sw	s1,16(s3)
    1aa0:	00176693          	or	a3,a4,1
    1aa4:	0114a623          	sw	a7,12(s1)
    1aa8:	0114a423          	sw	a7,8(s1)
    1aac:	00d4a223          	sw	a3,4(s1)
    1ab0:	00f407b3          	add	a5,s0,a5
    1ab4:	00090513          	mv	a0,s2
    1ab8:	00e7a023          	sw	a4,0(a5)
    1abc:	2e0000ef          	jal	1d9c <__malloc_unlock>
    1ac0:	00840513          	add	a0,s0,8
    1ac4:	b79ff06f          	j	163c <_malloc_r+0x8c>
    1ac8:	0067d713          	srl	a4,a5,0x6
    1acc:	03970613          	add	a2,a4,57
    1ad0:	03870693          	add	a3,a4,56
    1ad4:	00361613          	sll	a2,a2,0x3
    1ad8:	ec5ff06f          	j	199c <_malloc_r+0x3ec>
    1adc:	07340c63          	beq	s0,s3,1b54 <_malloc_r+0x5a4>
    1ae0:	0089a403          	lw	s0,8(s3)
    1ae4:	00812c03          	lw	s8,8(sp)
    1ae8:	00442783          	lw	a5,4(s0)
    1aec:	e09ff06f          	j	18f4 <_malloc_r+0x344>
    1af0:	05c78593          	add	a1,a5,92
    1af4:	05b78813          	add	a6,a5,91
    1af8:	00359613          	sll	a2,a1,0x3
    1afc:	b95ff06f          	j	1690 <_malloc_r+0xe0>
    1b00:	00832783          	lw	a5,8(t1)
    1b04:	fff58593          	add	a1,a1,-1
    1b08:	28679063          	bne	a5,t1,1d88 <_malloc_r+0x7d8>
    1b0c:	0035f793          	and	a5,a1,3
    1b10:	ff830313          	add	t1,t1,-8
    1b14:	fe0796e3          	bnez	a5,1b00 <_malloc_r+0x550>
    1b18:	0049a703          	lw	a4,4(s3)
    1b1c:	fff64793          	not	a5,a2
    1b20:	00e7f7b3          	and	a5,a5,a4
    1b24:	00f9a223          	sw	a5,4(s3)
    1b28:	00161613          	sll	a2,a2,0x1
    1b2c:	ccc7eee3          	bltu	a5,a2,1808 <_malloc_r+0x258>
    1b30:	cc060ce3          	beqz	a2,1808 <_malloc_r+0x258>
    1b34:	00f67733          	and	a4,a2,a5
    1b38:	00071a63          	bnez	a4,1b4c <_malloc_r+0x59c>
    1b3c:	00161613          	sll	a2,a2,0x1
    1b40:	00f67733          	and	a4,a2,a5
    1b44:	004e0e13          	add	t3,t3,4
    1b48:	fe070ae3          	beqz	a4,1b3c <_malloc_r+0x58c>
    1b4c:	000e0593          	mv	a1,t3
    1b50:	c39ff06f          	j	1788 <_malloc_r+0x1d8>
    1b54:	7ffffc17          	auipc	s8,0x7ffff
    1b58:	c20c0c13          	add	s8,s8,-992 # 80000774 <__malloc_current_mallinfo>
    1b5c:	000c2703          	lw	a4,0(s8)
    1b60:	00ea8733          	add	a4,s5,a4
    1b64:	00ec2023          	sw	a4,0(s8)
    1b68:	000ca683          	lw	a3,0(s9)
    1b6c:	fff00793          	li	a5,-1
    1b70:	18f68663          	beq	a3,a5,1cfc <_malloc_r+0x74c>
    1b74:	414b87b3          	sub	a5,s7,s4
    1b78:	00e787b3          	add	a5,a5,a4
    1b7c:	00fc2023          	sw	a5,0(s8)
    1b80:	007bfc93          	and	s9,s7,7
    1b84:	0c0c8c63          	beqz	s9,1c5c <_malloc_r+0x6ac>
    1b88:	419b8bb3          	sub	s7,s7,s9
    1b8c:	000017b7          	lui	a5,0x1
    1b90:	00878793          	add	a5,a5,8 # 1008 <memcpy+0xd8>
    1b94:	008b8b93          	add	s7,s7,8
    1b98:	419785b3          	sub	a1,a5,s9
    1b9c:	015b8ab3          	add	s5,s7,s5
    1ba0:	415585b3          	sub	a1,a1,s5
    1ba4:	01459593          	sll	a1,a1,0x14
    1ba8:	0145da13          	srl	s4,a1,0x14
    1bac:	000a0593          	mv	a1,s4
    1bb0:	00090513          	mv	a0,s2
    1bb4:	719050ef          	jal	7acc <_sbrk_r>
    1bb8:	fff00793          	li	a5,-1
    1bbc:	18f50063          	beq	a0,a5,1d3c <_malloc_r+0x78c>
    1bc0:	41750533          	sub	a0,a0,s7
    1bc4:	01450ab3          	add	s5,a0,s4
    1bc8:	000c2703          	lw	a4,0(s8)
    1bcc:	0179a423          	sw	s7,8(s3)
    1bd0:	001ae793          	or	a5,s5,1
    1bd4:	00ea05b3          	add	a1,s4,a4
    1bd8:	00bc2023          	sw	a1,0(s8)
    1bdc:	00fba223          	sw	a5,4(s7)
    1be0:	cf3402e3          	beq	s0,s3,18c4 <_malloc_r+0x314>
    1be4:	00f00693          	li	a3,15
    1be8:	0b66f063          	bgeu	a3,s6,1c88 <_malloc_r+0x6d8>
    1bec:	00442703          	lw	a4,4(s0)
    1bf0:	ff4b0793          	add	a5,s6,-12
    1bf4:	ff87f793          	and	a5,a5,-8
    1bf8:	00177713          	and	a4,a4,1
    1bfc:	00f76733          	or	a4,a4,a5
    1c00:	00e42223          	sw	a4,4(s0)
    1c04:	00500613          	li	a2,5
    1c08:	00f40733          	add	a4,s0,a5
    1c0c:	00c72223          	sw	a2,4(a4)
    1c10:	00c72423          	sw	a2,8(a4)
    1c14:	00f6e663          	bltu	a3,a5,1c20 <_malloc_r+0x670>
    1c18:	004ba783          	lw	a5,4(s7)
    1c1c:	ca9ff06f          	j	18c4 <_malloc_r+0x314>
    1c20:	00840593          	add	a1,s0,8
    1c24:	00090513          	mv	a0,s2
    1c28:	e7cff0ef          	jal	12a4 <_free_r>
    1c2c:	0089ab83          	lw	s7,8(s3)
    1c30:	000c2583          	lw	a1,0(s8)
    1c34:	004ba783          	lw	a5,4(s7)
    1c38:	c8dff06f          	j	18c4 <_malloc_r+0x314>
    1c3c:	010a8a93          	add	s5,s5,16
    1c40:	c31ff06f          	j	1870 <_malloc_r+0x2c0>
    1c44:	4026d693          	sra	a3,a3,0x2
    1c48:	00100793          	li	a5,1
    1c4c:	00d797b3          	sll	a5,a5,a3
    1c50:	00f56533          	or	a0,a0,a5
    1c54:	00a9a223          	sw	a0,4(s3)
    1c58:	d71ff06f          	j	19c8 <_malloc_r+0x418>
    1c5c:	015b85b3          	add	a1,s7,s5
    1c60:	40b005b3          	neg	a1,a1
    1c64:	01459593          	sll	a1,a1,0x14
    1c68:	0145da13          	srl	s4,a1,0x14
    1c6c:	000a0593          	mv	a1,s4
    1c70:	00090513          	mv	a0,s2
    1c74:	659050ef          	jal	7acc <_sbrk_r>
    1c78:	fff00793          	li	a5,-1
    1c7c:	f4f512e3          	bne	a0,a5,1bc0 <_malloc_r+0x610>
    1c80:	00000a13          	li	s4,0
    1c84:	f45ff06f          	j	1bc8 <_malloc_r+0x618>
    1c88:	00812c03          	lw	s8,8(sp)
    1c8c:	00100793          	li	a5,1
    1c90:	00fba223          	sw	a5,4(s7)
    1c94:	00090513          	mv	a0,s2
    1c98:	104000ef          	jal	1d9c <__malloc_unlock>
    1c9c:	00000513          	li	a0,0
    1ca0:	01812a03          	lw	s4,24(sp)
    1ca4:	01412a83          	lw	s5,20(sp)
    1ca8:	01012b03          	lw	s6,16(sp)
    1cac:	00c12b83          	lw	s7,12(sp)
    1cb0:	00412c83          	lw	s9,4(sp)
    1cb4:	989ff06f          	j	163c <_malloc_r+0x8c>
    1cb8:	05400693          	li	a3,84
    1cbc:	04e6e463          	bltu	a3,a4,1d04 <_malloc_r+0x754>
    1cc0:	00c7d713          	srl	a4,a5,0xc
    1cc4:	06f70613          	add	a2,a4,111
    1cc8:	06e70693          	add	a3,a4,110
    1ccc:	00361613          	sll	a2,a2,0x3
    1cd0:	ccdff06f          	j	199c <_malloc_r+0x3ec>
    1cd4:	15400713          	li	a4,340
    1cd8:	04f76463          	bltu	a4,a5,1d20 <_malloc_r+0x770>
    1cdc:	00f4d793          	srl	a5,s1,0xf
    1ce0:	07878593          	add	a1,a5,120
    1ce4:	07778813          	add	a6,a5,119
    1ce8:	00359613          	sll	a2,a1,0x3
    1cec:	9a5ff06f          	j	1690 <_malloc_r+0xe0>
    1cf0:	0089a403          	lw	s0,8(s3)
    1cf4:	00442783          	lw	a5,4(s0)
    1cf8:	bfdff06f          	j	18f4 <_malloc_r+0x344>
    1cfc:	017ca023          	sw	s7,0(s9)
    1d00:	e81ff06f          	j	1b80 <_malloc_r+0x5d0>
    1d04:	15400693          	li	a3,340
    1d08:	04e6e463          	bltu	a3,a4,1d50 <_malloc_r+0x7a0>
    1d0c:	00f7d713          	srl	a4,a5,0xf
    1d10:	07870613          	add	a2,a4,120
    1d14:	07770693          	add	a3,a4,119
    1d18:	00361613          	sll	a2,a2,0x3
    1d1c:	c81ff06f          	j	199c <_malloc_r+0x3ec>
    1d20:	55400713          	li	a4,1364
    1d24:	04f76463          	bltu	a4,a5,1d6c <_malloc_r+0x7bc>
    1d28:	0124d793          	srl	a5,s1,0x12
    1d2c:	07d78593          	add	a1,a5,125
    1d30:	07c78813          	add	a6,a5,124
    1d34:	00359613          	sll	a2,a1,0x3
    1d38:	959ff06f          	j	1690 <_malloc_r+0xe0>
    1d3c:	ff8c8c93          	add	s9,s9,-8
    1d40:	019a8ab3          	add	s5,s5,s9
    1d44:	417a8ab3          	sub	s5,s5,s7
    1d48:	00000a13          	li	s4,0
    1d4c:	e7dff06f          	j	1bc8 <_malloc_r+0x618>
    1d50:	55400693          	li	a3,1364
    1d54:	02e6e463          	bltu	a3,a4,1d7c <_malloc_r+0x7cc>
    1d58:	0127d713          	srl	a4,a5,0x12
    1d5c:	07d70613          	add	a2,a4,125
    1d60:	07c70693          	add	a3,a4,124
    1d64:	00361613          	sll	a2,a2,0x3
    1d68:	c35ff06f          	j	199c <_malloc_r+0x3ec>
    1d6c:	3f800613          	li	a2,1016
    1d70:	07f00593          	li	a1,127
    1d74:	07e00813          	li	a6,126
    1d78:	919ff06f          	j	1690 <_malloc_r+0xe0>
    1d7c:	3f800613          	li	a2,1016
    1d80:	07e00693          	li	a3,126
    1d84:	c19ff06f          	j	199c <_malloc_r+0x3ec>
    1d88:	0049a783          	lw	a5,4(s3)
    1d8c:	d9dff06f          	j	1b28 <_malloc_r+0x578>

00001d90 <__malloc_lock>:
    1d90:	7ffff517          	auipc	a0,0x7ffff
    1d94:	98c50513          	add	a0,a0,-1652 # 8000071c <__lock___malloc_recursive_mutex>
    1d98:	8b4ff06f          	j	e4c <__retarget_lock_acquire_recursive>

00001d9c <__malloc_unlock>:
    1d9c:	7ffff517          	auipc	a0,0x7ffff
    1da0:	98050513          	add	a0,a0,-1664 # 8000071c <__lock___malloc_recursive_mutex>
    1da4:	8acff06f          	j	e50 <__retarget_lock_release_recursive>

00001da8 <_vfprintf_r>:
    1da8:	e7010113          	add	sp,sp,-400
    1dac:	18112623          	sw	ra,396(sp)
    1db0:	00b12423          	sw	a1,8(sp)
    1db4:	00c12623          	sw	a2,12(sp)
    1db8:	00d12a23          	sw	a3,20(sp)
    1dbc:	17312e23          	sw	s3,380(sp)
    1dc0:	18812423          	sw	s0,392(sp)
    1dc4:	00050993          	mv	s3,a0
    1dc8:	3d9050ef          	jal	79a0 <_localeconv_r>
    1dcc:	00052783          	lw	a5,0(a0)
    1dd0:	00078513          	mv	a0,a5
    1dd4:	02f12a23          	sw	a5,52(sp)
    1dd8:	afcff0ef          	jal	10d4 <strlen>
    1ddc:	00050713          	mv	a4,a0
    1de0:	00800613          	li	a2,8
    1de4:	00000593          	li	a1,0
    1de8:	09010513          	add	a0,sp,144
    1dec:	02e12823          	sw	a4,48(sp)
    1df0:	864ff0ef          	jal	e54 <memset>
    1df4:	00c12783          	lw	a5,12(sp)
    1df8:	00098863          	beqz	s3,1e08 <_vfprintf_r+0x60>
    1dfc:	0349a703          	lw	a4,52(s3)
    1e00:	00071463          	bnez	a4,1e08 <_vfprintf_r+0x60>
    1e04:	29d0106f          	j	38a0 <_vfprintf_r+0x1af8>
    1e08:	00812703          	lw	a4,8(sp)
    1e0c:	06472683          	lw	a3,100(a4)
    1e10:	00c71703          	lh	a4,12(a4)
    1e14:	0016f693          	and	a3,a3,1
    1e18:	00069863          	bnez	a3,1e28 <_vfprintf_r+0x80>
    1e1c:	20077693          	and	a3,a4,512
    1e20:	00069463          	bnez	a3,1e28 <_vfprintf_r+0x80>
    1e24:	3ec0106f          	j	3210 <_vfprintf_r+0x1468>
    1e28:	01271693          	sll	a3,a4,0x12
    1e2c:	0206c863          	bltz	a3,1e5c <_vfprintf_r+0xb4>
    1e30:	00812503          	lw	a0,8(sp)
    1e34:	000025b7          	lui	a1,0x2
    1e38:	ffffe637          	lui	a2,0xffffe
    1e3c:	06452683          	lw	a3,100(a0)
    1e40:	00b76733          	or	a4,a4,a1
    1e44:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    1e48:	01071713          	sll	a4,a4,0x10
    1e4c:	41075713          	sra	a4,a4,0x10
    1e50:	00c6f6b3          	and	a3,a3,a2
    1e54:	00e51623          	sh	a4,12(a0)
    1e58:	06d52223          	sw	a3,100(a0)
    1e5c:	00877693          	and	a3,a4,8
    1e60:	2a068063          	beqz	a3,2100 <_vfprintf_r+0x358>
    1e64:	00812683          	lw	a3,8(sp)
    1e68:	0106a683          	lw	a3,16(a3)
    1e6c:	28068a63          	beqz	a3,2100 <_vfprintf_r+0x358>
    1e70:	01a77693          	and	a3,a4,26
    1e74:	00a00613          	li	a2,10
    1e78:	2ac68c63          	beq	a3,a2,2130 <_vfprintf_r+0x388>
    1e7c:	0ac10713          	add	a4,sp,172
    1e80:	17512a23          	sw	s5,372(sp)
    1e84:	17812423          	sw	s8,360(sp)
    1e88:	15b12e23          	sw	s11,348(sp)
    1e8c:	18912223          	sw	s1,388(sp)
    1e90:	19212023          	sw	s2,384(sp)
    1e94:	17412c23          	sw	s4,376(sp)
    1e98:	17612823          	sw	s6,368(sp)
    1e9c:	17712623          	sw	s7,364(sp)
    1ea0:	17912223          	sw	s9,356(sp)
    1ea4:	17a12023          	sw	s10,352(sp)
    1ea8:	0ae12023          	sw	a4,160(sp)
    1eac:	0a012423          	sw	zero,168(sp)
    1eb0:	0a012223          	sw	zero,164(sp)
    1eb4:	00012c23          	sw	zero,24(sp)
    1eb8:	02012423          	sw	zero,40(sp)
    1ebc:	02012623          	sw	zero,44(sp)
    1ec0:	00070413          	mv	s0,a4
    1ec4:	02012c23          	sw	zero,56(sp)
    1ec8:	04012023          	sw	zero,64(sp)
    1ecc:	02012e23          	sw	zero,60(sp)
    1ed0:	04012623          	sw	zero,76(sp)
    1ed4:	04012423          	sw	zero,72(sp)
    1ed8:	00012623          	sw	zero,12(sp)
    1edc:	7fffea97          	auipc	s5,0x7fffe
    1ee0:	658a8a93          	add	s5,s5,1624 # 80000534 <__global_locale>
    1ee4:	02500d93          	li	s11,37
    1ee8:	00078c13          	mv	s8,a5
    1eec:	000c0913          	mv	s2,s8
    1ef0:	0e4aa483          	lw	s1,228(s5)
    1ef4:	2a1050ef          	jal	7994 <__locale_mb_cur_max>
    1ef8:	00050693          	mv	a3,a0
    1efc:	09010713          	add	a4,sp,144
    1f00:	00090613          	mv	a2,s2
    1f04:	08010593          	add	a1,sp,128
    1f08:	00098513          	mv	a0,s3
    1f0c:	000480e7          	jalr	s1
    1f10:	2c050a63          	beqz	a0,21e4 <_vfprintf_r+0x43c>
    1f14:	2a054a63          	bltz	a0,21c8 <_vfprintf_r+0x420>
    1f18:	08012783          	lw	a5,128(sp)
    1f1c:	01b78663          	beq	a5,s11,1f28 <_vfprintf_r+0x180>
    1f20:	00a90933          	add	s2,s2,a0
    1f24:	fcdff06f          	j	1ef0 <_vfprintf_r+0x148>
    1f28:	00050493          	mv	s1,a0
    1f2c:	41890cb3          	sub	s9,s2,s8
    1f30:	2d891063          	bne	s2,s8,21f0 <_vfprintf_r+0x448>
    1f34:	fff00313          	li	t1,-1
    1f38:	00000e93          	li	t4,0
    1f3c:	00194e03          	lbu	t3,1(s2)
    1f40:	06010ba3          	sb	zero,119(sp)
    1f44:	00190913          	add	s2,s2,1
    1f48:	00000b93          	li	s7,0
    1f4c:	05a00493          	li	s1,90
    1f50:	000e8a13          	mv	s4,t4
    1f54:	00030b13          	mv	s6,t1
    1f58:	00190913          	add	s2,s2,1
    1f5c:	fe0e0793          	add	a5,t3,-32
    1f60:	04f4ea63          	bltu	s1,a5,1fb4 <_vfprintf_r+0x20c>
    1f64:	0000d717          	auipc	a4,0xd
    1f68:	31c70713          	add	a4,a4,796 # f280 <_ctype_+0x104>
    1f6c:	00279793          	sll	a5,a5,0x2
    1f70:	00e787b3          	add	a5,a5,a4
    1f74:	0007a783          	lw	a5,0(a5)
    1f78:	00e787b3          	add	a5,a5,a4
    1f7c:	00078067          	jr	a5
    1f80:	00000b93          	li	s7,0
    1f84:	fd0e0713          	add	a4,t3,-48
    1f88:	00900693          	li	a3,9
    1f8c:	00094e03          	lbu	t3,0(s2)
    1f90:	002b9793          	sll	a5,s7,0x2
    1f94:	017787b3          	add	a5,a5,s7
    1f98:	00179793          	sll	a5,a5,0x1
    1f9c:	00f70bb3          	add	s7,a4,a5
    1fa0:	fd0e0713          	add	a4,t3,-48
    1fa4:	00190913          	add	s2,s2,1
    1fa8:	fee6f2e3          	bgeu	a3,a4,1f8c <_vfprintf_r+0x1e4>
    1fac:	fe0e0793          	add	a5,t3,-32
    1fb0:	faf4fae3          	bgeu	s1,a5,1f64 <_vfprintf_r+0x1bc>
    1fb4:	000a0e93          	mv	t4,s4
    1fb8:	260e0a63          	beqz	t3,222c <_vfprintf_r+0x484>
    1fbc:	0fc10623          	sb	t3,236(sp)
    1fc0:	06010ba3          	sb	zero,119(sp)
    1fc4:	00100c93          	li	s9,1
    1fc8:	00000613          	li	a2,0
    1fcc:	00012823          	sw	zero,16(sp)
    1fd0:	00100d13          	li	s10,1
    1fd4:	00000313          	li	t1,0
    1fd8:	02012223          	sw	zero,36(sp)
    1fdc:	02012023          	sw	zero,32(sp)
    1fe0:	00000a13          	li	s4,0
    1fe4:	0ec10c13          	add	s8,sp,236
    1fe8:	002ef293          	and	t0,t4,2
    1fec:	00028463          	beqz	t0,1ff4 <_vfprintf_r+0x24c>
    1ff0:	002c8c93          	add	s9,s9,2
    1ff4:	084eff93          	and	t6,t4,132
    1ff8:	0a812483          	lw	s1,168(sp)
    1ffc:	000f9663          	bnez	t6,2008 <_vfprintf_r+0x260>
    2000:	419b8733          	sub	a4,s7,s9
    2004:	40e04663          	bgtz	a4,2410 <_vfprintf_r+0x668>
    2008:	02060a63          	beqz	a2,203c <_vfprintf_r+0x294>
    200c:	0a412703          	lw	a4,164(sp)
    2010:	07710613          	add	a2,sp,119
    2014:	00148493          	add	s1,s1,1
    2018:	00170713          	add	a4,a4,1
    201c:	00100793          	li	a5,1
    2020:	00c42023          	sw	a2,0(s0)
    2024:	00f42223          	sw	a5,4(s0)
    2028:	0a912423          	sw	s1,168(sp)
    202c:	0ae12223          	sw	a4,164(sp)
    2030:	00700613          	li	a2,7
    2034:	00840413          	add	s0,s0,8
    2038:	4ce64863          	blt	a2,a4,2508 <_vfprintf_r+0x760>
    203c:	02028a63          	beqz	t0,2070 <_vfprintf_r+0x2c8>
    2040:	0a412703          	lw	a4,164(sp)
    2044:	07810613          	add	a2,sp,120
    2048:	00c42023          	sw	a2,0(s0)
    204c:	00248493          	add	s1,s1,2
    2050:	00200613          	li	a2,2
    2054:	00170713          	add	a4,a4,1
    2058:	00c42223          	sw	a2,4(s0)
    205c:	0a912423          	sw	s1,168(sp)
    2060:	0ae12223          	sw	a4,164(sp)
    2064:	00700613          	li	a2,7
    2068:	00840413          	add	s0,s0,8
    206c:	5ce644e3          	blt	a2,a4,2e34 <_vfprintf_r+0x108c>
    2070:	08000713          	li	a4,128
    2074:	3aef80e3          	beq	t6,a4,2c14 <_vfprintf_r+0xe6c>
    2078:	41a30b33          	sub	s6,t1,s10
    207c:	4b604ae3          	bgtz	s6,2d30 <_vfprintf_r+0xf88>
    2080:	100ef713          	and	a4,t4,256
    2084:	1a0710e3          	bnez	a4,2a24 <_vfprintf_r+0xc7c>
    2088:	0a412783          	lw	a5,164(sp)
    208c:	01a484b3          	add	s1,s1,s10
    2090:	01842023          	sw	s8,0(s0)
    2094:	00178793          	add	a5,a5,1
    2098:	01a42223          	sw	s10,4(s0)
    209c:	0a912423          	sw	s1,168(sp)
    20a0:	0af12223          	sw	a5,164(sp)
    20a4:	00700713          	li	a4,7
    20a8:	58f74c63          	blt	a4,a5,2640 <_vfprintf_r+0x898>
    20ac:	00840413          	add	s0,s0,8
    20b0:	004eff13          	and	t5,t4,4
    20b4:	000f0663          	beqz	t5,20c0 <_vfprintf_r+0x318>
    20b8:	419b8d33          	sub	s10,s7,s9
    20bc:	5ba04ce3          	bgtz	s10,2e74 <_vfprintf_r+0x10cc>
    20c0:	000b8e93          	mv	t4,s7
    20c4:	019bd463          	bge	s7,s9,20cc <_vfprintf_r+0x324>
    20c8:	000c8e93          	mv	t4,s9
    20cc:	00c12783          	lw	a5,12(sp)
    20d0:	01d787b3          	add	a5,a5,t4
    20d4:	00f12623          	sw	a5,12(sp)
    20d8:	18049663          	bnez	s1,2264 <_vfprintf_r+0x4bc>
    20dc:	01012783          	lw	a5,16(sp)
    20e0:	0a012223          	sw	zero,164(sp)
    20e4:	00078863          	beqz	a5,20f4 <_vfprintf_r+0x34c>
    20e8:	01012583          	lw	a1,16(sp)
    20ec:	00098513          	mv	a0,s3
    20f0:	9b4ff0ef          	jal	12a4 <_free_r>
    20f4:	0ac10413          	add	s0,sp,172
    20f8:	00090c13          	mv	s8,s2
    20fc:	df1ff06f          	j	1eec <_vfprintf_r+0x144>
    2100:	00812403          	lw	s0,8(sp)
    2104:	00098513          	mv	a0,s3
    2108:	00f12623          	sw	a5,12(sp)
    210c:	00040593          	mv	a1,s0
    2110:	3a4050ef          	jal	74b4 <__swsetup_r>
    2114:	00050463          	beqz	a0,211c <_vfprintf_r+0x374>
    2118:	5600206f          	j	4678 <_vfprintf_r+0x28d0>
    211c:	00c41703          	lh	a4,12(s0)
    2120:	00a00613          	li	a2,10
    2124:	00c12783          	lw	a5,12(sp)
    2128:	01a77693          	and	a3,a4,26
    212c:	d4c698e3          	bne	a3,a2,1e7c <_vfprintf_r+0xd4>
    2130:	00812603          	lw	a2,8(sp)
    2134:	00e61683          	lh	a3,14(a2)
    2138:	d406c2e3          	bltz	a3,1e7c <_vfprintf_r+0xd4>
    213c:	06462683          	lw	a3,100(a2)
    2140:	0016f693          	and	a3,a3,1
    2144:	00069863          	bnez	a3,2154 <_vfprintf_r+0x3ac>
    2148:	20077713          	and	a4,a4,512
    214c:	00071463          	bnez	a4,2154 <_vfprintf_r+0x3ac>
    2150:	53d0106f          	j	3e8c <_vfprintf_r+0x20e4>
    2154:	01412683          	lw	a3,20(sp)
    2158:	00812583          	lw	a1,8(sp)
    215c:	00098513          	mv	a0,s3
    2160:	00078613          	mv	a2,a5
    2164:	0e5020ef          	jal	4a48 <__sbprintf>
    2168:	18c12083          	lw	ra,396(sp)
    216c:	18812403          	lw	s0,392(sp)
    2170:	00a12623          	sw	a0,12(sp)
    2174:	00c12503          	lw	a0,12(sp)
    2178:	17c12983          	lw	s3,380(sp)
    217c:	19010113          	add	sp,sp,400
    2180:	00008067          	ret
    2184:	00098513          	mv	a0,s3
    2188:	019050ef          	jal	79a0 <_localeconv_r>
    218c:	00452783          	lw	a5,4(a0)
    2190:	00078513          	mv	a0,a5
    2194:	04f12423          	sw	a5,72(sp)
    2198:	f3dfe0ef          	jal	10d4 <strlen>
    219c:	00050793          	mv	a5,a0
    21a0:	00098513          	mv	a0,s3
    21a4:	00078c93          	mv	s9,a5
    21a8:	04f12623          	sw	a5,76(sp)
    21ac:	7f4050ef          	jal	79a0 <_localeconv_r>
    21b0:	00852703          	lw	a4,8(a0)
    21b4:	02e12e23          	sw	a4,60(sp)
    21b8:	000c8463          	beqz	s9,21c0 <_vfprintf_r+0x418>
    21bc:	1ec0106f          	j	33a8 <_vfprintf_r+0x1600>
    21c0:	00094e03          	lbu	t3,0(s2)
    21c4:	d95ff06f          	j	1f58 <_vfprintf_r+0x1b0>
    21c8:	00800613          	li	a2,8
    21cc:	00000593          	li	a1,0
    21d0:	09010513          	add	a0,sp,144
    21d4:	c81fe0ef          	jal	e54 <memset>
    21d8:	00100513          	li	a0,1
    21dc:	00a90933          	add	s2,s2,a0
    21e0:	d11ff06f          	j	1ef0 <_vfprintf_r+0x148>
    21e4:	00050493          	mv	s1,a0
    21e8:	41890cb3          	sub	s9,s2,s8
    21ec:	05890063          	beq	s2,s8,222c <_vfprintf_r+0x484>
    21f0:	0a812683          	lw	a3,168(sp)
    21f4:	0a412703          	lw	a4,164(sp)
    21f8:	01842023          	sw	s8,0(s0)
    21fc:	019686b3          	add	a3,a3,s9
    2200:	00170713          	add	a4,a4,1
    2204:	01942223          	sw	s9,4(s0)
    2208:	0ad12423          	sw	a3,168(sp)
    220c:	0ae12223          	sw	a4,164(sp)
    2210:	00700693          	li	a3,7
    2214:	00840413          	add	s0,s0,8
    2218:	02e6c863          	blt	a3,a4,2248 <_vfprintf_r+0x4a0>
    221c:	00c12783          	lw	a5,12(sp)
    2220:	019787b3          	add	a5,a5,s9
    2224:	00f12623          	sw	a5,12(sp)
    2228:	d00496e3          	bnez	s1,1f34 <_vfprintf_r+0x18c>
    222c:	0a812783          	lw	a5,168(sp)
    2230:	00078463          	beqz	a5,2238 <_vfprintf_r+0x490>
    2234:	4090106f          	j	3e3c <_vfprintf_r+0x2094>
    2238:	00812783          	lw	a5,8(sp)
    223c:	0a012223          	sw	zero,164(sp)
    2240:	00c79783          	lh	a5,12(a5)
    2244:	0500006f          	j	2294 <_vfprintf_r+0x4ec>
    2248:	00812583          	lw	a1,8(sp)
    224c:	0a010613          	add	a2,sp,160
    2250:	00098513          	mv	a0,s3
    2254:	211020ef          	jal	4c64 <__sprint_r>
    2258:	02051a63          	bnez	a0,228c <_vfprintf_r+0x4e4>
    225c:	0ac10413          	add	s0,sp,172
    2260:	fbdff06f          	j	221c <_vfprintf_r+0x474>
    2264:	00812583          	lw	a1,8(sp)
    2268:	0a010613          	add	a2,sp,160
    226c:	00098513          	mv	a0,s3
    2270:	1f5020ef          	jal	4c64 <__sprint_r>
    2274:	e60504e3          	beqz	a0,20dc <_vfprintf_r+0x334>
    2278:	01012283          	lw	t0,16(sp)
    227c:	00028863          	beqz	t0,228c <_vfprintf_r+0x4e4>
    2280:	00028593          	mv	a1,t0
    2284:	00098513          	mv	a0,s3
    2288:	81cff0ef          	jal	12a4 <_free_r>
    228c:	00812783          	lw	a5,8(sp)
    2290:	00c79783          	lh	a5,12(a5)
    2294:	00812703          	lw	a4,8(sp)
    2298:	06472703          	lw	a4,100(a4)
    229c:	00177713          	and	a4,a4,1
    22a0:	3c070463          	beqz	a4,2668 <_vfprintf_r+0x8c0>
    22a4:	0407f793          	and	a5,a5,64
    22a8:	18412483          	lw	s1,388(sp)
    22ac:	18012903          	lw	s2,384(sp)
    22b0:	17812a03          	lw	s4,376(sp)
    22b4:	17412a83          	lw	s5,372(sp)
    22b8:	17012b03          	lw	s6,368(sp)
    22bc:	16c12b83          	lw	s7,364(sp)
    22c0:	16812c03          	lw	s8,360(sp)
    22c4:	16412c83          	lw	s9,356(sp)
    22c8:	16012d03          	lw	s10,352(sp)
    22cc:	15c12d83          	lw	s11,348(sp)
    22d0:	00078463          	beqz	a5,22d8 <_vfprintf_r+0x530>
    22d4:	3d00206f          	j	46a4 <_vfprintf_r+0x28fc>
    22d8:	18c12083          	lw	ra,396(sp)
    22dc:	18812403          	lw	s0,392(sp)
    22e0:	00c12503          	lw	a0,12(sp)
    22e4:	17c12983          	lw	s3,380(sp)
    22e8:	19010113          	add	sp,sp,400
    22ec:	00008067          	ret
    22f0:	008a7713          	and	a4,s4,8
    22f4:	000a0e93          	mv	t4,s4
    22f8:	000b0313          	mv	t1,s6
    22fc:	00070463          	beqz	a4,2304 <_vfprintf_r+0x55c>
    2300:	0200106f          	j	3320 <_vfprintf_r+0x1578>
    2304:	01412783          	lw	a5,20(sp)
    2308:	00778b13          	add	s6,a5,7
    230c:	ff8b7b13          	and	s6,s6,-8
    2310:	000b2783          	lw	a5,0(s6)
    2314:	02f12423          	sw	a5,40(sp)
    2318:	004b2783          	lw	a5,4(s6)
    231c:	02f12623          	sw	a5,44(sp)
    2320:	008b0793          	add	a5,s6,8
    2324:	00f12a23          	sw	a5,20(sp)
    2328:	02c12a03          	lw	s4,44(sp)
    232c:	7fffe717          	auipc	a4,0x7fffe
    2330:	37470713          	add	a4,a4,884 # 800006a0 <__global_locale+0x16c>
    2334:	00072c83          	lw	s9,0(a4)
    2338:	00472d03          	lw	s10,4(a4)
    233c:	02812b03          	lw	s6,40(sp)
    2340:	001a1493          	sll	s1,s4,0x1
    2344:	0014d493          	srl	s1,s1,0x1
    2348:	000b0513          	mv	a0,s6
    234c:	00048593          	mv	a1,s1
    2350:	000c8613          	mv	a2,s9
    2354:	000d0693          	mv	a3,s10
    2358:	02612223          	sw	t1,36(sp)
    235c:	03c12023          	sw	t3,32(sp)
    2360:	01d12823          	sw	t4,16(sp)
    2364:	26c0c0ef          	jal	e5d0 <__unorddf2>
    2368:	01012e83          	lw	t4,16(sp)
    236c:	02012e03          	lw	t3,32(sp)
    2370:	02412303          	lw	t1,36(sp)
    2374:	00050463          	beqz	a0,237c <_vfprintf_r+0x5d4>
    2378:	4080106f          	j	3780 <_vfprintf_r+0x19d8>
    237c:	000b0513          	mv	a0,s6
    2380:	00048593          	mv	a1,s1
    2384:	000c8613          	mv	a2,s9
    2388:	000d0693          	mv	a3,s10
    238c:	0a40b0ef          	jal	d430 <__ledf2>
    2390:	01012e83          	lw	t4,16(sp)
    2394:	02012e03          	lw	t3,32(sp)
    2398:	02412303          	lw	t1,36(sp)
    239c:	00a04463          	bgtz	a0,23a4 <_vfprintf_r+0x5fc>
    23a0:	3e00106f          	j	3780 <_vfprintf_r+0x19d8>
    23a4:	000b0513          	mv	a0,s6
    23a8:	000a0593          	mv	a1,s4
    23ac:	00000613          	li	a2,0
    23b0:	00000693          	li	a3,0
    23b4:	07c0b0ef          	jal	d430 <__ledf2>
    23b8:	01012e83          	lw	t4,16(sp)
    23bc:	02012e03          	lw	t3,32(sp)
    23c0:	00055463          	bgez	a0,23c8 <_vfprintf_r+0x620>
    23c4:	6650106f          	j	4228 <_vfprintf_r+0x2480>
    23c8:	07714603          	lbu	a2,119(sp)
    23cc:	04700713          	li	a4,71
    23d0:	0000dc17          	auipc	s8,0xd
    23d4:	bc0c0c13          	add	s8,s8,-1088 # ef90 <__fini_array_end+0x198>
    23d8:	01c74663          	blt	a4,t3,23e4 <_vfprintf_r+0x63c>
    23dc:	0000dc17          	auipc	s8,0xd
    23e0:	bb0c0c13          	add	s8,s8,-1104 # ef8c <__fini_array_end+0x194>
    23e4:	00012823          	sw	zero,16(sp)
    23e8:	02012223          	sw	zero,36(sp)
    23ec:	02012023          	sw	zero,32(sp)
    23f0:	f7fefe93          	and	t4,t4,-129
    23f4:	00300c93          	li	s9,3
    23f8:	00300d13          	li	s10,3
    23fc:	00000313          	li	t1,0
    2400:	00000a13          	li	s4,0
    2404:	be0602e3          	beqz	a2,1fe8 <_vfprintf_r+0x240>
    2408:	001c8c93          	add	s9,s9,1
    240c:	bddff06f          	j	1fe8 <_vfprintf_r+0x240>
    2410:	01000593          	li	a1,16
    2414:	0a412603          	lw	a2,164(sp)
    2418:	0000db17          	auipc	s6,0xd
    241c:	07cb0b13          	add	s6,s6,124 # f494 <blanks.1>
    2420:	0ae5dc63          	bge	a1,a4,24d8 <_vfprintf_r+0x730>
    2424:	00040793          	mv	a5,s0
    2428:	00048693          	mv	a3,s1
    242c:	01000893          	li	a7,16
    2430:	000b0493          	mv	s1,s6
    2434:	00700393          	li	t2,7
    2438:	000a0b13          	mv	s6,s4
    243c:	04512223          	sw	t0,68(sp)
    2440:	05f12823          	sw	t6,80(sp)
    2444:	05d12a23          	sw	t4,84(sp)
    2448:	05c12c23          	sw	t3,88(sp)
    244c:	00070413          	mv	s0,a4
    2450:	00030a13          	mv	s4,t1
    2454:	00c0006f          	j	2460 <_vfprintf_r+0x6b8>
    2458:	ff040413          	add	s0,s0,-16
    245c:	0488da63          	bge	a7,s0,24b0 <_vfprintf_r+0x708>
    2460:	01068693          	add	a3,a3,16
    2464:	00160613          	add	a2,a2,1
    2468:	0097a023          	sw	s1,0(a5)
    246c:	0117a223          	sw	a7,4(a5)
    2470:	0ad12423          	sw	a3,168(sp)
    2474:	0ac12223          	sw	a2,164(sp)
    2478:	00878793          	add	a5,a5,8
    247c:	fcc3dee3          	bge	t2,a2,2458 <_vfprintf_r+0x6b0>
    2480:	00812583          	lw	a1,8(sp)
    2484:	0a010613          	add	a2,sp,160
    2488:	00098513          	mv	a0,s3
    248c:	7d8020ef          	jal	4c64 <__sprint_r>
    2490:	de0514e3          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2494:	01000893          	li	a7,16
    2498:	ff040413          	add	s0,s0,-16
    249c:	0a812683          	lw	a3,168(sp)
    24a0:	0a412603          	lw	a2,164(sp)
    24a4:	0ac10793          	add	a5,sp,172
    24a8:	00700393          	li	t2,7
    24ac:	fa88cae3          	blt	a7,s0,2460 <_vfprintf_r+0x6b8>
    24b0:	04412283          	lw	t0,68(sp)
    24b4:	05012f83          	lw	t6,80(sp)
    24b8:	05412e83          	lw	t4,84(sp)
    24bc:	05812e03          	lw	t3,88(sp)
    24c0:	000a0313          	mv	t1,s4
    24c4:	00040713          	mv	a4,s0
    24c8:	000b0a13          	mv	s4,s6
    24cc:	00078413          	mv	s0,a5
    24d0:	00048b13          	mv	s6,s1
    24d4:	00068493          	mv	s1,a3
    24d8:	00e484b3          	add	s1,s1,a4
    24dc:	00160613          	add	a2,a2,1
    24e0:	00e42223          	sw	a4,4(s0)
    24e4:	01642023          	sw	s6,0(s0)
    24e8:	0a912423          	sw	s1,168(sp)
    24ec:	0ac12223          	sw	a2,164(sp)
    24f0:	00700713          	li	a4,7
    24f4:	00c75463          	bge	a4,a2,24fc <_vfprintf_r+0x754>
    24f8:	2380106f          	j	3730 <_vfprintf_r+0x1988>
    24fc:	07714603          	lbu	a2,119(sp)
    2500:	00840413          	add	s0,s0,8
    2504:	b05ff06f          	j	2008 <_vfprintf_r+0x260>
    2508:	00812583          	lw	a1,8(sp)
    250c:	0a010613          	add	a2,sp,160
    2510:	00098513          	mv	a0,s3
    2514:	04612e23          	sw	t1,92(sp)
    2518:	05c12c23          	sw	t3,88(sp)
    251c:	05d12a23          	sw	t4,84(sp)
    2520:	05f12823          	sw	t6,80(sp)
    2524:	04512223          	sw	t0,68(sp)
    2528:	73c020ef          	jal	4c64 <__sprint_r>
    252c:	d40516e3          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2530:	0a812483          	lw	s1,168(sp)
    2534:	05c12303          	lw	t1,92(sp)
    2538:	05812e03          	lw	t3,88(sp)
    253c:	05412e83          	lw	t4,84(sp)
    2540:	05012f83          	lw	t6,80(sp)
    2544:	04412283          	lw	t0,68(sp)
    2548:	0ac10413          	add	s0,sp,172
    254c:	af1ff06f          	j	203c <_vfprintf_r+0x294>
    2550:	0a412d03          	lw	s10,164(sp)
    2554:	01812783          	lw	a5,24(sp)
    2558:	00100693          	li	a3,1
    255c:	01842023          	sw	s8,0(s0)
    2560:	00148493          	add	s1,s1,1
    2564:	001d0d13          	add	s10,s10,1
    2568:	00840b13          	add	s6,s0,8
    256c:	32f6d0e3          	bge	a3,a5,308c <_vfprintf_r+0x12e4>
    2570:	00100693          	li	a3,1
    2574:	00d42223          	sw	a3,4(s0)
    2578:	0a912423          	sw	s1,168(sp)
    257c:	0ba12223          	sw	s10,164(sp)
    2580:	00700693          	li	a3,7
    2584:	01a6d463          	bge	a3,s10,258c <_vfprintf_r+0x7e4>
    2588:	0680106f          	j	35f0 <_vfprintf_r+0x1848>
    258c:	03012783          	lw	a5,48(sp)
    2590:	03412703          	lw	a4,52(sp)
    2594:	001d0d13          	add	s10,s10,1
    2598:	00f484b3          	add	s1,s1,a5
    259c:	00eb2023          	sw	a4,0(s6)
    25a0:	00fb2223          	sw	a5,4(s6)
    25a4:	0a912423          	sw	s1,168(sp)
    25a8:	0ba12223          	sw	s10,164(sp)
    25ac:	00700693          	li	a3,7
    25b0:	008b0b13          	add	s6,s6,8
    25b4:	01a6d463          	bge	a3,s10,25bc <_vfprintf_r+0x814>
    25b8:	0680106f          	j	3620 <_vfprintf_r+0x1878>
    25bc:	02812603          	lw	a2,40(sp)
    25c0:	02c12683          	lw	a3,44(sp)
    25c4:	01812783          	lw	a5,24(sp)
    25c8:	00060513          	mv	a0,a2
    25cc:	00068593          	mv	a1,a3
    25d0:	00000613          	li	a2,0
    25d4:	00000693          	li	a3,0
    25d8:	03d12023          	sw	t4,32(sp)
    25dc:	fff78413          	add	s0,a5,-1
    25e0:	4c50a0ef          	jal	d2a4 <__eqdf2>
    25e4:	02012e83          	lw	t4,32(sp)
    25e8:	2e0506e3          	beqz	a0,30d4 <_vfprintf_r+0x132c>
    25ec:	001c0793          	add	a5,s8,1
    25f0:	001d0d13          	add	s10,s10,1
    25f4:	008484b3          	add	s1,s1,s0
    25f8:	00fb2023          	sw	a5,0(s6)
    25fc:	008b2223          	sw	s0,4(s6)
    2600:	0a912423          	sw	s1,168(sp)
    2604:	0ba12223          	sw	s10,164(sp)
    2608:	00700793          	li	a5,7
    260c:	008b0b13          	add	s6,s6,8
    2610:	29a7cce3          	blt	a5,s10,30a8 <_vfprintf_r+0x1300>
    2614:	04012703          	lw	a4,64(sp)
    2618:	08810793          	add	a5,sp,136
    261c:	001d0d13          	add	s10,s10,1
    2620:	009704b3          	add	s1,a4,s1
    2624:	00fb2023          	sw	a5,0(s6)
    2628:	00eb2223          	sw	a4,4(s6)
    262c:	0a912423          	sw	s1,168(sp)
    2630:	0ba12223          	sw	s10,164(sp)
    2634:	00700793          	li	a5,7
    2638:	008b0413          	add	s0,s6,8
    263c:	a7a7dae3          	bge	a5,s10,20b0 <_vfprintf_r+0x308>
    2640:	00812583          	lw	a1,8(sp)
    2644:	0a010613          	add	a2,sp,160
    2648:	00098513          	mv	a0,s3
    264c:	03d12023          	sw	t4,32(sp)
    2650:	614020ef          	jal	4c64 <__sprint_r>
    2654:	c20512e3          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2658:	0a812483          	lw	s1,168(sp)
    265c:	02012e83          	lw	t4,32(sp)
    2660:	0ac10413          	add	s0,sp,172
    2664:	a4dff06f          	j	20b0 <_vfprintf_r+0x308>
    2668:	2007f713          	and	a4,a5,512
    266c:	c2071ce3          	bnez	a4,22a4 <_vfprintf_r+0x4fc>
    2670:	00812403          	lw	s0,8(sp)
    2674:	05842503          	lw	a0,88(s0)
    2678:	fd8fe0ef          	jal	e50 <__retarget_lock_release_recursive>
    267c:	00c41783          	lh	a5,12(s0)
    2680:	c25ff06f          	j	22a4 <_vfprintf_r+0x4fc>
    2684:	00094e03          	lbu	t3,0(s2)
    2688:	020a6a13          	or	s4,s4,32
    268c:	8cdff06f          	j	1f58 <_vfprintf_r+0x1b0>
    2690:	01412703          	lw	a4,20(sp)
    2694:	04300793          	li	a5,67
    2698:	000a0e93          	mv	t4,s4
    269c:	00470493          	add	s1,a4,4
    26a0:	64fe08e3          	beq	t3,a5,34f0 <_vfprintf_r+0x1748>
    26a4:	010a7793          	and	a5,s4,16
    26a8:	640794e3          	bnez	a5,34f0 <_vfprintf_r+0x1748>
    26ac:	01412783          	lw	a5,20(sp)
    26b0:	00100c93          	li	s9,1
    26b4:	00100d13          	li	s10,1
    26b8:	0007a783          	lw	a5,0(a5)
    26bc:	0ec10c13          	add	s8,sp,236
    26c0:	0ef10623          	sb	a5,236(sp)
    26c4:	06010ba3          	sb	zero,119(sp)
    26c8:	00912a23          	sw	s1,20(sp)
    26cc:	00000613          	li	a2,0
    26d0:	00012823          	sw	zero,16(sp)
    26d4:	00000313          	li	t1,0
    26d8:	02012223          	sw	zero,36(sp)
    26dc:	02012023          	sw	zero,32(sp)
    26e0:	00000a13          	li	s4,0
    26e4:	905ff06f          	j	1fe8 <_vfprintf_r+0x240>
    26e8:	01412783          	lw	a5,20(sp)
    26ec:	06010ba3          	sb	zero,119(sp)
    26f0:	000b0313          	mv	t1,s6
    26f4:	0007ac03          	lw	s8,0(a5)
    26f8:	000a0e93          	mv	t4,s4
    26fc:	00478b13          	add	s6,a5,4
    2700:	5a0c0ce3          	beqz	s8,34b8 <_vfprintf_r+0x1710>
    2704:	05300713          	li	a4,83
    2708:	00ee1463          	bne	t3,a4,2710 <_vfprintf_r+0x968>
    270c:	1d00106f          	j	38dc <_vfprintf_r+0x1b34>
    2710:	010a7a13          	and	s4,s4,16
    2714:	000a0463          	beqz	s4,271c <_vfprintf_r+0x974>
    2718:	1c40106f          	j	38dc <_vfprintf_r+0x1b34>
    271c:	00035463          	bgez	t1,2724 <_vfprintf_r+0x97c>
    2720:	6d40106f          	j	3df4 <_vfprintf_r+0x204c>
    2724:	00030613          	mv	a2,t1
    2728:	00000593          	li	a1,0
    272c:	000c0513          	mv	a0,s8
    2730:	03d12023          	sw	t4,32(sp)
    2734:	00612a23          	sw	t1,20(sp)
    2738:	0ec050ef          	jal	7824 <memchr>
    273c:	00a12823          	sw	a0,16(sp)
    2740:	01412303          	lw	t1,20(sp)
    2744:	02012e83          	lw	t4,32(sp)
    2748:	00051463          	bnez	a0,2750 <_vfprintf_r+0x9a8>
    274c:	1780206f          	j	48c4 <_vfprintf_r+0x2b1c>
    2750:	01012783          	lw	a5,16(sp)
    2754:	07714603          	lbu	a2,119(sp)
    2758:	01612a23          	sw	s6,20(sp)
    275c:	41878d33          	sub	s10,a5,s8
    2760:	fffd4813          	not	a6,s10
    2764:	41f85813          	sra	a6,a6,0x1f
    2768:	02012223          	sw	zero,36(sp)
    276c:	02012023          	sw	zero,32(sp)
    2770:	00012823          	sw	zero,16(sp)
    2774:	010d7cb3          	and	s9,s10,a6
    2778:	00000313          	li	t1,0
    277c:	07300e13          	li	t3,115
    2780:	860604e3          	beqz	a2,1fe8 <_vfprintf_r+0x240>
    2784:	c85ff06f          	j	2408 <_vfprintf_r+0x660>
    2788:	01412783          	lw	a5,20(sp)
    278c:	0007ab83          	lw	s7,0(a5)
    2790:	00478793          	add	a5,a5,4
    2794:	2a0bdae3          	bgez	s7,3248 <_vfprintf_r+0x14a0>
    2798:	41700bb3          	neg	s7,s7
    279c:	00f12a23          	sw	a5,20(sp)
    27a0:	00094e03          	lbu	t3,0(s2)
    27a4:	004a6a13          	or	s4,s4,4
    27a8:	fb0ff06f          	j	1f58 <_vfprintf_r+0x1b0>
    27ac:	02b00793          	li	a5,43
    27b0:	00094e03          	lbu	t3,0(s2)
    27b4:	06f10ba3          	sb	a5,119(sp)
    27b8:	fa0ff06f          	j	1f58 <_vfprintf_r+0x1b0>
    27bc:	000b0313          	mv	t1,s6
    27c0:	010a6613          	or	a2,s4,16
    27c4:	02067793          	and	a5,a2,32
    27c8:	1c0780e3          	beqz	a5,3188 <_vfprintf_r+0x13e0>
    27cc:	01412783          	lw	a5,20(sp)
    27d0:	00778b13          	add	s6,a5,7
    27d4:	ff8b7b13          	and	s6,s6,-8
    27d8:	000b2d03          	lw	s10,0(s6)
    27dc:	004b2c83          	lw	s9,4(s6)
    27e0:	008b0793          	add	a5,s6,8
    27e4:	00f12a23          	sw	a5,20(sp)
    27e8:	00100793          	li	a5,1
    27ec:	00000713          	li	a4,0
    27f0:	06e10ba3          	sb	a4,119(sp)
    27f4:	34034c63          	bltz	t1,2b4c <_vfprintf_r+0xda4>
    27f8:	019d6733          	or	a4,s10,s9
    27fc:	f7f67e93          	and	t4,a2,-129
    2800:	34071463          	bnez	a4,2b48 <_vfprintf_r+0xda0>
    2804:	3a031a63          	bnez	t1,2bb8 <_vfprintf_r+0xe10>
    2808:	5c079ee3          	bnez	a5,35e4 <_vfprintf_r+0x183c>
    280c:	00167d13          	and	s10,a2,1
    2810:	15010c13          	add	s8,sp,336
    2814:	2c0d10e3          	bnez	s10,32d4 <_vfprintf_r+0x152c>
    2818:	07714603          	lbu	a2,119(sp)
    281c:	00030c93          	mv	s9,t1
    2820:	01a35463          	bge	t1,s10,2828 <_vfprintf_r+0xa80>
    2824:	000d0c93          	mv	s9,s10
    2828:	00012823          	sw	zero,16(sp)
    282c:	02012223          	sw	zero,36(sp)
    2830:	02012023          	sw	zero,32(sp)
    2834:	00000a13          	li	s4,0
    2838:	fa060863          	beqz	a2,1fe8 <_vfprintf_r+0x240>
    283c:	bcdff06f          	j	2408 <_vfprintf_r+0x660>
    2840:	00094e03          	lbu	t3,0(s2)
    2844:	080a6a13          	or	s4,s4,128
    2848:	f10ff06f          	j	1f58 <_vfprintf_r+0x1b0>
    284c:	00094e03          	lbu	t3,0(s2)
    2850:	02a00793          	li	a5,42
    2854:	00190693          	add	a3,s2,1
    2858:	00fe1463          	bne	t3,a5,2860 <_vfprintf_r+0xab8>
    285c:	1100206f          	j	496c <_vfprintf_r+0x2bc4>
    2860:	fd0e0713          	add	a4,t3,-48
    2864:	00900793          	li	a5,9
    2868:	00000b13          	li	s6,0
    286c:	00900613          	li	a2,9
    2870:	02e7e463          	bltu	a5,a4,2898 <_vfprintf_r+0xaf0>
    2874:	0006ce03          	lbu	t3,0(a3)
    2878:	002b1793          	sll	a5,s6,0x2
    287c:	016787b3          	add	a5,a5,s6
    2880:	00179793          	sll	a5,a5,0x1
    2884:	00e78b33          	add	s6,a5,a4
    2888:	fd0e0713          	add	a4,t3,-48
    288c:	00168693          	add	a3,a3,1
    2890:	fee672e3          	bgeu	a2,a4,2874 <_vfprintf_r+0xacc>
    2894:	320b4ce3          	bltz	s6,33cc <_vfprintf_r+0x1624>
    2898:	00068913          	mv	s2,a3
    289c:	ec0ff06f          	j	1f5c <_vfprintf_r+0x1b4>
    28a0:	00094e03          	lbu	t3,0(s2)
    28a4:	001a6a13          	or	s4,s4,1
    28a8:	eb0ff06f          	j	1f58 <_vfprintf_r+0x1b0>
    28ac:	07714783          	lbu	a5,119(sp)
    28b0:	00094e03          	lbu	t3,0(s2)
    28b4:	ea079263          	bnez	a5,1f58 <_vfprintf_r+0x1b0>
    28b8:	02000793          	li	a5,32
    28bc:	06f10ba3          	sb	a5,119(sp)
    28c0:	e98ff06f          	j	1f58 <_vfprintf_r+0x1b0>
    28c4:	00094e03          	lbu	t3,0(s2)
    28c8:	06c00793          	li	a5,108
    28cc:	3afe00e3          	beq	t3,a5,346c <_vfprintf_r+0x16c4>
    28d0:	010a6a13          	or	s4,s4,16
    28d4:	e84ff06f          	j	1f58 <_vfprintf_r+0x1b0>
    28d8:	00094e03          	lbu	t3,0(s2)
    28dc:	008a6a13          	or	s4,s4,8
    28e0:	e78ff06f          	j	1f58 <_vfprintf_r+0x1b0>
    28e4:	000b0313          	mv	t1,s6
    28e8:	010a6e93          	or	t4,s4,16
    28ec:	020ef793          	and	a5,t4,32
    28f0:	0c0786e3          	beqz	a5,31bc <_vfprintf_r+0x1414>
    28f4:	01412783          	lw	a5,20(sp)
    28f8:	00778b13          	add	s6,a5,7
    28fc:	ff8b7b13          	and	s6,s6,-8
    2900:	004b2783          	lw	a5,4(s6)
    2904:	000b2d03          	lw	s10,0(s6)
    2908:	008b0713          	add	a4,s6,8
    290c:	00e12a23          	sw	a4,20(sp)
    2910:	00078c93          	mv	s9,a5
    2914:	0c07cee3          	bltz	a5,31f0 <_vfprintf_r+0x1448>
    2918:	000e8613          	mv	a2,t4
    291c:	02034263          	bltz	t1,2940 <_vfprintf_r+0xb98>
    2920:	019d67b3          	or	a5,s10,s9
    2924:	f7fef613          	and	a2,t4,-129
    2928:	00079c63          	bnez	a5,2940 <_vfprintf_r+0xb98>
    292c:	02031063          	bnez	t1,294c <_vfprintf_r+0xba4>
    2930:	00000d13          	li	s10,0
    2934:	00060e93          	mv	t4,a2
    2938:	15010c13          	add	s8,sp,336
    293c:	eddff06f          	j	2818 <_vfprintf_r+0xa70>
    2940:	520c90e3          	bnez	s9,3660 <_vfprintf_r+0x18b8>
    2944:	00900793          	li	a5,9
    2948:	51a7ece3          	bltu	a5,s10,3660 <_vfprintf_r+0x18b8>
    294c:	030d0d13          	add	s10,s10,48
    2950:	15a107a3          	sb	s10,335(sp)
    2954:	00060e93          	mv	t4,a2
    2958:	00100d13          	li	s10,1
    295c:	14f10c13          	add	s8,sp,335
    2960:	eb9ff06f          	j	2818 <_vfprintf_r+0xa70>
    2964:	000b0313          	mv	t1,s6
    2968:	010a6e93          	or	t4,s4,16
    296c:	020ef793          	and	a5,t4,32
    2970:	7e078463          	beqz	a5,3158 <_vfprintf_r+0x13b0>
    2974:	01412783          	lw	a5,20(sp)
    2978:	00778b13          	add	s6,a5,7
    297c:	ff8b7b13          	and	s6,s6,-8
    2980:	000b2d03          	lw	s10,0(s6)
    2984:	004b2c83          	lw	s9,4(s6)
    2988:	008b0793          	add	a5,s6,8
    298c:	00f12a23          	sw	a5,20(sp)
    2990:	bffef613          	and	a2,t4,-1025
    2994:	00000793          	li	a5,0
    2998:	e55ff06f          	j	27ec <_vfprintf_r+0xa44>
    299c:	00094e03          	lbu	t3,0(s2)
    29a0:	06800793          	li	a5,104
    29a4:	2cfe0ce3          	beq	t3,a5,347c <_vfprintf_r+0x16d4>
    29a8:	040a6a13          	or	s4,s4,64
    29ac:	dacff06f          	j	1f58 <_vfprintf_r+0x1b0>
    29b0:	01412703          	lw	a4,20(sp)
    29b4:	000087b7          	lui	a5,0x8
    29b8:	83078793          	add	a5,a5,-2000 # 7830 <memchr+0xc>
    29bc:	06f11c23          	sh	a5,120(sp)
    29c0:	00470793          	add	a5,a4,4
    29c4:	00f12a23          	sw	a5,20(sp)
    29c8:	0000c797          	auipc	a5,0xc
    29cc:	5d478793          	add	a5,a5,1492 # ef9c <__fini_array_end+0x1a4>
    29d0:	02f12c23          	sw	a5,56(sp)
    29d4:	00072d03          	lw	s10,0(a4)
    29d8:	000b0313          	mv	t1,s6
    29dc:	00000c93          	li	s9,0
    29e0:	002a6613          	or	a2,s4,2
    29e4:	00200793          	li	a5,2
    29e8:	07800e13          	li	t3,120
    29ec:	e01ff06f          	j	27ec <_vfprintf_r+0xa44>
    29f0:	020a7793          	and	a5,s4,32
    29f4:	180784e3          	beqz	a5,337c <_vfprintf_r+0x15d4>
    29f8:	01412783          	lw	a5,20(sp)
    29fc:	00c12683          	lw	a3,12(sp)
    2a00:	0007a783          	lw	a5,0(a5)
    2a04:	41f6d713          	sra	a4,a3,0x1f
    2a08:	00d7a023          	sw	a3,0(a5)
    2a0c:	00e7a223          	sw	a4,4(a5)
    2a10:	01412783          	lw	a5,20(sp)
    2a14:	00090c13          	mv	s8,s2
    2a18:	00478793          	add	a5,a5,4
    2a1c:	00f12a23          	sw	a5,20(sp)
    2a20:	cccff06f          	j	1eec <_vfprintf_r+0x144>
    2a24:	06500713          	li	a4,101
    2a28:	b3c754e3          	bge	a4,t3,2550 <_vfprintf_r+0x7a8>
    2a2c:	02812683          	lw	a3,40(sp)
    2a30:	02c12703          	lw	a4,44(sp)
    2a34:	00000613          	li	a2,0
    2a38:	00068513          	mv	a0,a3
    2a3c:	00070593          	mv	a1,a4
    2a40:	00000693          	li	a3,0
    2a44:	05d12223          	sw	t4,68(sp)
    2a48:	05d0a0ef          	jal	d2a4 <__eqdf2>
    2a4c:	04412e83          	lw	t4,68(sp)
    2a50:	4e051463          	bnez	a0,2f38 <_vfprintf_r+0x1190>
    2a54:	0a412783          	lw	a5,164(sp)
    2a58:	0000c717          	auipc	a4,0xc
    2a5c:	57470713          	add	a4,a4,1396 # efcc <__fini_array_end+0x1d4>
    2a60:	00e42023          	sw	a4,0(s0)
    2a64:	00148493          	add	s1,s1,1
    2a68:	00100713          	li	a4,1
    2a6c:	00178793          	add	a5,a5,1
    2a70:	00e42223          	sw	a4,4(s0)
    2a74:	0a912423          	sw	s1,168(sp)
    2a78:	0af12223          	sw	a5,164(sp)
    2a7c:	00700713          	li	a4,7
    2a80:	00840413          	add	s0,s0,8
    2a84:	62f746e3          	blt	a4,a5,38b0 <_vfprintf_r+0x1b08>
    2a88:	07c12783          	lw	a5,124(sp)
    2a8c:	01812703          	lw	a4,24(sp)
    2a90:	78e7de63          	bge	a5,a4,322c <_vfprintf_r+0x1484>
    2a94:	03412783          	lw	a5,52(sp)
    2a98:	03012703          	lw	a4,48(sp)
    2a9c:	00840413          	add	s0,s0,8
    2aa0:	fef42c23          	sw	a5,-8(s0)
    2aa4:	0a412783          	lw	a5,164(sp)
    2aa8:	00e484b3          	add	s1,s1,a4
    2aac:	fee42e23          	sw	a4,-4(s0)
    2ab0:	00178793          	add	a5,a5,1
    2ab4:	0a912423          	sw	s1,168(sp)
    2ab8:	0af12223          	sw	a5,164(sp)
    2abc:	00700713          	li	a4,7
    2ac0:	1cf746e3          	blt	a4,a5,348c <_vfprintf_r+0x16e4>
    2ac4:	01812783          	lw	a5,24(sp)
    2ac8:	fff78d13          	add	s10,a5,-1
    2acc:	dfa05263          	blez	s10,20b0 <_vfprintf_r+0x308>
    2ad0:	01000713          	li	a4,16
    2ad4:	0a412783          	lw	a5,164(sp)
    2ad8:	0000d297          	auipc	t0,0xd
    2adc:	9ac28293          	add	t0,t0,-1620 # f484 <zeroes.0>
    2ae0:	77a752e3          	bge	a4,s10,3a44 <_vfprintf_r+0x1c9c>
    2ae4:	00048713          	mv	a4,s1
    2ae8:	01000c13          	li	s8,16
    2aec:	00700b13          	li	s6,7
    2af0:	000e8493          	mv	s1,t4
    2af4:	00028a13          	mv	s4,t0
    2af8:	00c0006f          	j	2b04 <_vfprintf_r+0xd5c>
    2afc:	ff0d0d13          	add	s10,s10,-16
    2b00:	73ac5ce3          	bge	s8,s10,3a38 <_vfprintf_r+0x1c90>
    2b04:	01070713          	add	a4,a4,16
    2b08:	00178793          	add	a5,a5,1
    2b0c:	01442023          	sw	s4,0(s0)
    2b10:	01842223          	sw	s8,4(s0)
    2b14:	0ae12423          	sw	a4,168(sp)
    2b18:	0af12223          	sw	a5,164(sp)
    2b1c:	00840413          	add	s0,s0,8
    2b20:	fcfb5ee3          	bge	s6,a5,2afc <_vfprintf_r+0xd54>
    2b24:	00812583          	lw	a1,8(sp)
    2b28:	0a010613          	add	a2,sp,160
    2b2c:	00098513          	mv	a0,s3
    2b30:	134020ef          	jal	4c64 <__sprint_r>
    2b34:	f4051263          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2b38:	0a812703          	lw	a4,168(sp)
    2b3c:	0a412783          	lw	a5,164(sp)
    2b40:	0ac10413          	add	s0,sp,172
    2b44:	fb9ff06f          	j	2afc <_vfprintf_r+0xd54>
    2b48:	000e8613          	mv	a2,t4
    2b4c:	00100713          	li	a4,1
    2b50:	dee788e3          	beq	a5,a4,2940 <_vfprintf_r+0xb98>
    2b54:	00200713          	li	a4,2
    2b58:	06e78c63          	beq	a5,a4,2bd0 <_vfprintf_r+0xe28>
    2b5c:	15010c13          	add	s8,sp,336
    2b60:	01dc9793          	sll	a5,s9,0x1d
    2b64:	007d7713          	and	a4,s10,7
    2b68:	003d5d13          	srl	s10,s10,0x3
    2b6c:	03070713          	add	a4,a4,48
    2b70:	01a7ed33          	or	s10,a5,s10
    2b74:	003cdc93          	srl	s9,s9,0x3
    2b78:	feec0fa3          	sb	a4,-1(s8)
    2b7c:	019d67b3          	or	a5,s10,s9
    2b80:	000c0593          	mv	a1,s8
    2b84:	fffc0c13          	add	s8,s8,-1
    2b88:	fc079ce3          	bnez	a5,2b60 <_vfprintf_r+0xdb8>
    2b8c:	00167693          	and	a3,a2,1
    2b90:	06068a63          	beqz	a3,2c04 <_vfprintf_r+0xe5c>
    2b94:	03000693          	li	a3,48
    2b98:	06d70663          	beq	a4,a3,2c04 <_vfprintf_r+0xe5c>
    2b9c:	ffe58593          	add	a1,a1,-2 # 1ffe <_vfprintf_r+0x256>
    2ba0:	15010793          	add	a5,sp,336
    2ba4:	fedc0fa3          	sb	a3,-1(s8)
    2ba8:	40b78d33          	sub	s10,a5,a1
    2bac:	00060e93          	mv	t4,a2
    2bb0:	00058c13          	mv	s8,a1
    2bb4:	c65ff06f          	j	2818 <_vfprintf_r+0xa70>
    2bb8:	00100713          	li	a4,1
    2bbc:	00e79463          	bne	a5,a4,2bc4 <_vfprintf_r+0xe1c>
    2bc0:	2b10106f          	j	4670 <_vfprintf_r+0x28c8>
    2bc4:	00200713          	li	a4,2
    2bc8:	000e8613          	mv	a2,t4
    2bcc:	f8e798e3          	bne	a5,a4,2b5c <_vfprintf_r+0xdb4>
    2bd0:	03812683          	lw	a3,56(sp)
    2bd4:	15010c13          	add	s8,sp,336
    2bd8:	00fd7793          	and	a5,s10,15
    2bdc:	00f687b3          	add	a5,a3,a5
    2be0:	0007c703          	lbu	a4,0(a5)
    2be4:	004d5d13          	srl	s10,s10,0x4
    2be8:	01cc9793          	sll	a5,s9,0x1c
    2bec:	01a7ed33          	or	s10,a5,s10
    2bf0:	004cdc93          	srl	s9,s9,0x4
    2bf4:	feec0fa3          	sb	a4,-1(s8)
    2bf8:	019d67b3          	or	a5,s10,s9
    2bfc:	fffc0c13          	add	s8,s8,-1
    2c00:	fc079ce3          	bnez	a5,2bd8 <_vfprintf_r+0xe30>
    2c04:	15010793          	add	a5,sp,336
    2c08:	41878d33          	sub	s10,a5,s8
    2c0c:	00060e93          	mv	t4,a2
    2c10:	c09ff06f          	j	2818 <_vfprintf_r+0xa70>
    2c14:	419b8b33          	sub	s6,s7,s9
    2c18:	c7605063          	blez	s6,2078 <_vfprintf_r+0x2d0>
    2c1c:	01000593          	li	a1,16
    2c20:	0a412603          	lw	a2,164(sp)
    2c24:	0000d297          	auipc	t0,0xd
    2c28:	86028293          	add	t0,t0,-1952 # f484 <zeroes.0>
    2c2c:	0b65d463          	bge	a1,s6,2cd4 <_vfprintf_r+0xf2c>
    2c30:	00040793          	mv	a5,s0
    2c34:	00048713          	mv	a4,s1
    2c38:	000b0413          	mv	s0,s6
    2c3c:	01000893          	li	a7,16
    2c40:	000a0b13          	mv	s6,s4
    2c44:	00700f93          	li	t6,7
    2c48:	05d12223          	sw	t4,68(sp)
    2c4c:	05c12823          	sw	t3,80(sp)
    2c50:	00030a13          	mv	s4,t1
    2c54:	00028493          	mv	s1,t0
    2c58:	00c0006f          	j	2c64 <_vfprintf_r+0xebc>
    2c5c:	ff040413          	add	s0,s0,-16
    2c60:	0488da63          	bge	a7,s0,2cb4 <_vfprintf_r+0xf0c>
    2c64:	01070713          	add	a4,a4,16
    2c68:	00160613          	add	a2,a2,1
    2c6c:	0097a023          	sw	s1,0(a5)
    2c70:	0117a223          	sw	a7,4(a5)
    2c74:	0ae12423          	sw	a4,168(sp)
    2c78:	0ac12223          	sw	a2,164(sp)
    2c7c:	00878793          	add	a5,a5,8
    2c80:	fccfdee3          	bge	t6,a2,2c5c <_vfprintf_r+0xeb4>
    2c84:	00812583          	lw	a1,8(sp)
    2c88:	0a010613          	add	a2,sp,160
    2c8c:	00098513          	mv	a0,s3
    2c90:	7d5010ef          	jal	4c64 <__sprint_r>
    2c94:	de051263          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2c98:	01000893          	li	a7,16
    2c9c:	ff040413          	add	s0,s0,-16
    2ca0:	0a812703          	lw	a4,168(sp)
    2ca4:	0a412603          	lw	a2,164(sp)
    2ca8:	0ac10793          	add	a5,sp,172
    2cac:	00700f93          	li	t6,7
    2cb0:	fa88cae3          	blt	a7,s0,2c64 <_vfprintf_r+0xebc>
    2cb4:	04412e83          	lw	t4,68(sp)
    2cb8:	05012e03          	lw	t3,80(sp)
    2cbc:	000a0313          	mv	t1,s4
    2cc0:	00048293          	mv	t0,s1
    2cc4:	000b0a13          	mv	s4,s6
    2cc8:	00070493          	mv	s1,a4
    2ccc:	00040b13          	mv	s6,s0
    2cd0:	00078413          	mv	s0,a5
    2cd4:	016484b3          	add	s1,s1,s6
    2cd8:	00160613          	add	a2,a2,1
    2cdc:	00542023          	sw	t0,0(s0)
    2ce0:	01642223          	sw	s6,4(s0)
    2ce4:	0a912423          	sw	s1,168(sp)
    2ce8:	0ac12223          	sw	a2,164(sp)
    2cec:	00700713          	li	a4,7
    2cf0:	00840413          	add	s0,s0,8
    2cf4:	b8c75263          	bge	a4,a2,2078 <_vfprintf_r+0x2d0>
    2cf8:	00812583          	lw	a1,8(sp)
    2cfc:	0a010613          	add	a2,sp,160
    2d00:	00098513          	mv	a0,s3
    2d04:	04612a23          	sw	t1,84(sp)
    2d08:	05c12823          	sw	t3,80(sp)
    2d0c:	05d12223          	sw	t4,68(sp)
    2d10:	755010ef          	jal	4c64 <__sprint_r>
    2d14:	d6051263          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2d18:	0a812483          	lw	s1,168(sp)
    2d1c:	05412303          	lw	t1,84(sp)
    2d20:	05012e03          	lw	t3,80(sp)
    2d24:	04412e83          	lw	t4,68(sp)
    2d28:	0ac10413          	add	s0,sp,172
    2d2c:	b4cff06f          	j	2078 <_vfprintf_r+0x2d0>
    2d30:	01000713          	li	a4,16
    2d34:	0a412603          	lw	a2,164(sp)
    2d38:	0000c297          	auipc	t0,0xc
    2d3c:	74c28293          	add	t0,t0,1868 # f484 <zeroes.0>
    2d40:	0b675063          	bge	a4,s6,2de0 <_vfprintf_r+0x1038>
    2d44:	00040793          	mv	a5,s0
    2d48:	00048693          	mv	a3,s1
    2d4c:	000b0413          	mv	s0,s6
    2d50:	01000713          	li	a4,16
    2d54:	00700893          	li	a7,7
    2d58:	05d12223          	sw	t4,68(sp)
    2d5c:	000e0493          	mv	s1,t3
    2d60:	00028b13          	mv	s6,t0
    2d64:	00c0006f          	j	2d70 <_vfprintf_r+0xfc8>
    2d68:	ff040413          	add	s0,s0,-16
    2d6c:	04875e63          	bge	a4,s0,2dc8 <_vfprintf_r+0x1020>
    2d70:	01068693          	add	a3,a3,16
    2d74:	00160613          	add	a2,a2,1
    2d78:	0000c597          	auipc	a1,0xc
    2d7c:	70c58593          	add	a1,a1,1804 # f484 <zeroes.0>
    2d80:	00b7a023          	sw	a1,0(a5)
    2d84:	00e7a223          	sw	a4,4(a5)
    2d88:	0ad12423          	sw	a3,168(sp)
    2d8c:	0ac12223          	sw	a2,164(sp)
    2d90:	00878793          	add	a5,a5,8
    2d94:	fcc8dae3          	bge	a7,a2,2d68 <_vfprintf_r+0xfc0>
    2d98:	00812583          	lw	a1,8(sp)
    2d9c:	0a010613          	add	a2,sp,160
    2da0:	00098513          	mv	a0,s3
    2da4:	6c1010ef          	jal	4c64 <__sprint_r>
    2da8:	cc051863          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2dac:	01000713          	li	a4,16
    2db0:	ff040413          	add	s0,s0,-16
    2db4:	0a812683          	lw	a3,168(sp)
    2db8:	0a412603          	lw	a2,164(sp)
    2dbc:	0ac10793          	add	a5,sp,172
    2dc0:	00700893          	li	a7,7
    2dc4:	fa8746e3          	blt	a4,s0,2d70 <_vfprintf_r+0xfc8>
    2dc8:	04412e83          	lw	t4,68(sp)
    2dcc:	00048e13          	mv	t3,s1
    2dd0:	000b0293          	mv	t0,s6
    2dd4:	00068493          	mv	s1,a3
    2dd8:	00040b13          	mv	s6,s0
    2ddc:	00078413          	mv	s0,a5
    2de0:	016484b3          	add	s1,s1,s6
    2de4:	00160613          	add	a2,a2,1
    2de8:	00542023          	sw	t0,0(s0)
    2dec:	01642223          	sw	s6,4(s0)
    2df0:	0a912423          	sw	s1,168(sp)
    2df4:	0ac12223          	sw	a2,164(sp)
    2df8:	00700713          	li	a4,7
    2dfc:	00840413          	add	s0,s0,8
    2e00:	a8c75063          	bge	a4,a2,2080 <_vfprintf_r+0x2d8>
    2e04:	00812583          	lw	a1,8(sp)
    2e08:	0a010613          	add	a2,sp,160
    2e0c:	00098513          	mv	a0,s3
    2e10:	05c12823          	sw	t3,80(sp)
    2e14:	05d12223          	sw	t4,68(sp)
    2e18:	64d010ef          	jal	4c64 <__sprint_r>
    2e1c:	c4051e63          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2e20:	0a812483          	lw	s1,168(sp)
    2e24:	05012e03          	lw	t3,80(sp)
    2e28:	04412e83          	lw	t4,68(sp)
    2e2c:	0ac10413          	add	s0,sp,172
    2e30:	a50ff06f          	j	2080 <_vfprintf_r+0x2d8>
    2e34:	00812583          	lw	a1,8(sp)
    2e38:	0a010613          	add	a2,sp,160
    2e3c:	00098513          	mv	a0,s3
    2e40:	04612c23          	sw	t1,88(sp)
    2e44:	05c12a23          	sw	t3,84(sp)
    2e48:	05d12823          	sw	t4,80(sp)
    2e4c:	05f12223          	sw	t6,68(sp)
    2e50:	615010ef          	jal	4c64 <__sprint_r>
    2e54:	c2051263          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2e58:	0a812483          	lw	s1,168(sp)
    2e5c:	05812303          	lw	t1,88(sp)
    2e60:	05412e03          	lw	t3,84(sp)
    2e64:	05012e83          	lw	t4,80(sp)
    2e68:	04412f83          	lw	t6,68(sp)
    2e6c:	0ac10413          	add	s0,sp,172
    2e70:	a00ff06f          	j	2070 <_vfprintf_r+0x2c8>
    2e74:	01000713          	li	a4,16
    2e78:	0a412783          	lw	a5,164(sp)
    2e7c:	0000cb17          	auipc	s6,0xc
    2e80:	618b0b13          	add	s6,s6,1560 # f494 <blanks.1>
    2e84:	07a75c63          	bge	a4,s10,2efc <_vfprintf_r+0x1154>
    2e88:	000b0713          	mv	a4,s6
    2e8c:	01000c13          	li	s8,16
    2e90:	00090b13          	mv	s6,s2
    2e94:	00700a13          	li	s4,7
    2e98:	00070913          	mv	s2,a4
    2e9c:	00c0006f          	j	2ea8 <_vfprintf_r+0x1100>
    2ea0:	ff0d0d13          	add	s10,s10,-16
    2ea4:	05ac5663          	bge	s8,s10,2ef0 <_vfprintf_r+0x1148>
    2ea8:	01048493          	add	s1,s1,16
    2eac:	00178793          	add	a5,a5,1
    2eb0:	01242023          	sw	s2,0(s0)
    2eb4:	01842223          	sw	s8,4(s0)
    2eb8:	0a912423          	sw	s1,168(sp)
    2ebc:	0af12223          	sw	a5,164(sp)
    2ec0:	00840413          	add	s0,s0,8
    2ec4:	fcfa5ee3          	bge	s4,a5,2ea0 <_vfprintf_r+0x10f8>
    2ec8:	00812583          	lw	a1,8(sp)
    2ecc:	0a010613          	add	a2,sp,160
    2ed0:	00098513          	mv	a0,s3
    2ed4:	591010ef          	jal	4c64 <__sprint_r>
    2ed8:	ba051063          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2edc:	ff0d0d13          	add	s10,s10,-16
    2ee0:	0a812483          	lw	s1,168(sp)
    2ee4:	0a412783          	lw	a5,164(sp)
    2ee8:	0ac10413          	add	s0,sp,172
    2eec:	fbac4ee3          	blt	s8,s10,2ea8 <_vfprintf_r+0x1100>
    2ef0:	00090713          	mv	a4,s2
    2ef4:	000b0913          	mv	s2,s6
    2ef8:	00070b13          	mv	s6,a4
    2efc:	01a484b3          	add	s1,s1,s10
    2f00:	00178793          	add	a5,a5,1
    2f04:	01642023          	sw	s6,0(s0)
    2f08:	01a42223          	sw	s10,4(s0)
    2f0c:	0a912423          	sw	s1,168(sp)
    2f10:	0af12223          	sw	a5,164(sp)
    2f14:	00700713          	li	a4,7
    2f18:	9af75463          	bge	a4,a5,20c0 <_vfprintf_r+0x318>
    2f1c:	00812583          	lw	a1,8(sp)
    2f20:	0a010613          	add	a2,sp,160
    2f24:	00098513          	mv	a0,s3
    2f28:	53d010ef          	jal	4c64 <__sprint_r>
    2f2c:	b4051663          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    2f30:	0a812483          	lw	s1,168(sp)
    2f34:	98cff06f          	j	20c0 <_vfprintf_r+0x318>
    2f38:	07c12683          	lw	a3,124(sp)
    2f3c:	30d05c63          	blez	a3,3254 <_vfprintf_r+0x14ac>
    2f40:	01812783          	lw	a5,24(sp)
    2f44:	000a0b13          	mv	s6,s4
    2f48:	0147d463          	bge	a5,s4,2f50 <_vfprintf_r+0x11a8>
    2f4c:	00078b13          	mv	s6,a5
    2f50:	03605863          	blez	s6,2f80 <_vfprintf_r+0x11d8>
    2f54:	0a412683          	lw	a3,164(sp)
    2f58:	016484b3          	add	s1,s1,s6
    2f5c:	01842023          	sw	s8,0(s0)
    2f60:	00168693          	add	a3,a3,1
    2f64:	01642223          	sw	s6,4(s0)
    2f68:	0a912423          	sw	s1,168(sp)
    2f6c:	0ad12223          	sw	a3,164(sp)
    2f70:	00700613          	li	a2,7
    2f74:	00840413          	add	s0,s0,8
    2f78:	00d65463          	bge	a2,a3,2f80 <_vfprintf_r+0x11d8>
    2f7c:	5c40106f          	j	4540 <_vfprintf_r+0x2798>
    2f80:	fffb4693          	not	a3,s6
    2f84:	41f6d693          	sra	a3,a3,0x1f
    2f88:	00db7733          	and	a4,s6,a3
    2f8c:	40ea0b33          	sub	s6,s4,a4
    2f90:	35604ae3          	bgtz	s6,3ae4 <_vfprintf_r+0x1d3c>
    2f94:	400ef713          	and	a4,t4,1024
    2f98:	014c0333          	add	t1,s8,s4
    2f9c:	00070463          	beqz	a4,2fa4 <_vfprintf_r+0x11fc>
    2fa0:	2980106f          	j	4238 <_vfprintf_r+0x2490>
    2fa4:	07c12d03          	lw	s10,124(sp)
    2fa8:	01812783          	lw	a5,24(sp)
    2fac:	5afd4063          	blt	s10,a5,354c <_vfprintf_r+0x17a4>
    2fb0:	001ef713          	and	a4,t4,1
    2fb4:	58071c63          	bnez	a4,354c <_vfprintf_r+0x17a4>
    2fb8:	01812703          	lw	a4,24(sp)
    2fbc:	00ec07b3          	add	a5,s8,a4
    2fc0:	41a70d33          	sub	s10,a4,s10
    2fc4:	40678b33          	sub	s6,a5,t1
    2fc8:	016d5463          	bge	s10,s6,2fd0 <_vfprintf_r+0x1228>
    2fcc:	000d0b13          	mv	s6,s10
    2fd0:	03605863          	blez	s6,3000 <_vfprintf_r+0x1258>
    2fd4:	0a412703          	lw	a4,164(sp)
    2fd8:	016484b3          	add	s1,s1,s6
    2fdc:	00642023          	sw	t1,0(s0)
    2fe0:	00170713          	add	a4,a4,1
    2fe4:	01642223          	sw	s6,4(s0)
    2fe8:	0a912423          	sw	s1,168(sp)
    2fec:	0ae12223          	sw	a4,164(sp)
    2ff0:	00700693          	li	a3,7
    2ff4:	00840413          	add	s0,s0,8
    2ff8:	00e6d463          	bge	a3,a4,3000 <_vfprintf_r+0x1258>
    2ffc:	5880106f          	j	4584 <_vfprintf_r+0x27dc>
    3000:	fffb4713          	not	a4,s6
    3004:	41f75713          	sra	a4,a4,0x1f
    3008:	00eb77b3          	and	a5,s6,a4
    300c:	40fd0d33          	sub	s10,s10,a5
    3010:	8ba05063          	blez	s10,20b0 <_vfprintf_r+0x308>
    3014:	01000713          	li	a4,16
    3018:	0a412783          	lw	a5,164(sp)
    301c:	0000c297          	auipc	t0,0xc
    3020:	46828293          	add	t0,t0,1128 # f484 <zeroes.0>
    3024:	23a750e3          	bge	a4,s10,3a44 <_vfprintf_r+0x1c9c>
    3028:	00048713          	mv	a4,s1
    302c:	01000c13          	li	s8,16
    3030:	00700b13          	li	s6,7
    3034:	000e8493          	mv	s1,t4
    3038:	00028a13          	mv	s4,t0
    303c:	00c0006f          	j	3048 <_vfprintf_r+0x12a0>
    3040:	ff0d0d13          	add	s10,s10,-16
    3044:	1fac5ae3          	bge	s8,s10,3a38 <_vfprintf_r+0x1c90>
    3048:	01070713          	add	a4,a4,16
    304c:	00178793          	add	a5,a5,1
    3050:	01442023          	sw	s4,0(s0)
    3054:	01842223          	sw	s8,4(s0)
    3058:	0ae12423          	sw	a4,168(sp)
    305c:	0af12223          	sw	a5,164(sp)
    3060:	00840413          	add	s0,s0,8
    3064:	fcfb5ee3          	bge	s6,a5,3040 <_vfprintf_r+0x1298>
    3068:	00812583          	lw	a1,8(sp)
    306c:	0a010613          	add	a2,sp,160
    3070:	00098513          	mv	a0,s3
    3074:	3f1010ef          	jal	4c64 <__sprint_r>
    3078:	a0051063          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    307c:	0a812703          	lw	a4,168(sp)
    3080:	0a412783          	lw	a5,164(sp)
    3084:	0ac10413          	add	s0,sp,172
    3088:	fb9ff06f          	j	3040 <_vfprintf_r+0x1298>
    308c:	001ef613          	and	a2,t4,1
    3090:	ce061063          	bnez	a2,2570 <_vfprintf_r+0x7c8>
    3094:	00d42223          	sw	a3,4(s0)
    3098:	0a912423          	sw	s1,168(sp)
    309c:	0ba12223          	sw	s10,164(sp)
    30a0:	00700793          	li	a5,7
    30a4:	d7a7d863          	bge	a5,s10,2614 <_vfprintf_r+0x86c>
    30a8:	00812583          	lw	a1,8(sp)
    30ac:	0a010613          	add	a2,sp,160
    30b0:	00098513          	mv	a0,s3
    30b4:	03d12023          	sw	t4,32(sp)
    30b8:	3ad010ef          	jal	4c64 <__sprint_r>
    30bc:	9a051e63          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    30c0:	0a812483          	lw	s1,168(sp)
    30c4:	0a412d03          	lw	s10,164(sp)
    30c8:	02012e83          	lw	t4,32(sp)
    30cc:	0ac10b13          	add	s6,sp,172
    30d0:	d44ff06f          	j	2614 <_vfprintf_r+0x86c>
    30d4:	01812703          	lw	a4,24(sp)
    30d8:	00100793          	li	a5,1
    30dc:	d2e7dc63          	bge	a5,a4,2614 <_vfprintf_r+0x86c>
    30e0:	01100793          	li	a5,17
    30e4:	0000c297          	auipc	t0,0xc
    30e8:	3a028293          	add	t0,t0,928 # f484 <zeroes.0>
    30ec:	18e7d4e3          	bge	a5,a4,3a74 <_vfprintf_r+0x1ccc>
    30f0:	00040a13          	mv	s4,s0
    30f4:	01000793          	li	a5,16
    30f8:	00700c13          	li	s8,7
    30fc:	03d12023          	sw	t4,32(sp)
    3100:	00028413          	mv	s0,t0
    3104:	00c0006f          	j	3110 <_vfprintf_r+0x1368>
    3108:	ff0a0a13          	add	s4,s4,-16
    310c:	1547dee3          	bge	a5,s4,3a68 <_vfprintf_r+0x1cc0>
    3110:	01048493          	add	s1,s1,16
    3114:	001d0d13          	add	s10,s10,1
    3118:	008b2023          	sw	s0,0(s6)
    311c:	00fb2223          	sw	a5,4(s6)
    3120:	0a912423          	sw	s1,168(sp)
    3124:	0ba12223          	sw	s10,164(sp)
    3128:	008b0b13          	add	s6,s6,8
    312c:	fdac5ee3          	bge	s8,s10,3108 <_vfprintf_r+0x1360>
    3130:	00812583          	lw	a1,8(sp)
    3134:	0a010613          	add	a2,sp,160
    3138:	00098513          	mv	a0,s3
    313c:	329010ef          	jal	4c64 <__sprint_r>
    3140:	92051c63          	bnez	a0,2278 <_vfprintf_r+0x4d0>
    3144:	0a812483          	lw	s1,168(sp)
    3148:	0a412d03          	lw	s10,164(sp)
    314c:	0ac10b13          	add	s6,sp,172
    3150:	01000793          	li	a5,16
    3154:	fb5ff06f          	j	3108 <_vfprintf_r+0x1360>
    3158:	01412703          	lw	a4,20(sp)
    315c:	010ef793          	and	a5,t4,16
    3160:	00072d03          	lw	s10,0(a4)
    3164:	00470713          	add	a4,a4,4
    3168:	00e12a23          	sw	a4,20(sp)
    316c:	1a079663          	bnez	a5,3318 <_vfprintf_r+0x1570>
    3170:	040ef793          	and	a5,t4,64
    3174:	18078e63          	beqz	a5,3310 <_vfprintf_r+0x1568>
    3178:	010d1d13          	sll	s10,s10,0x10
    317c:	010d5d13          	srl	s10,s10,0x10
    3180:	00000c93          	li	s9,0
    3184:	80dff06f          	j	2990 <_vfprintf_r+0xbe8>
    3188:	01412703          	lw	a4,20(sp)
    318c:	01067793          	and	a5,a2,16
    3190:	00072d03          	lw	s10,0(a4)
    3194:	00470713          	add	a4,a4,4
    3198:	00e12a23          	sw	a4,20(sp)
    319c:	14079a63          	bnez	a5,32f0 <_vfprintf_r+0x1548>
    31a0:	04067793          	and	a5,a2,64
    31a4:	14078063          	beqz	a5,32e4 <_vfprintf_r+0x153c>
    31a8:	010d1d13          	sll	s10,s10,0x10
    31ac:	010d5d13          	srl	s10,s10,0x10
    31b0:	00000c93          	li	s9,0
    31b4:	00100793          	li	a5,1
    31b8:	e34ff06f          	j	27ec <_vfprintf_r+0xa44>
    31bc:	01412703          	lw	a4,20(sp)
    31c0:	010ef793          	and	a5,t4,16
    31c4:	00072d03          	lw	s10,0(a4)
    31c8:	00470713          	add	a4,a4,4
    31cc:	00e12a23          	sw	a4,20(sp)
    31d0:	12079a63          	bnez	a5,3304 <_vfprintf_r+0x155c>
    31d4:	040ef793          	and	a5,t4,64
    31d8:	12078263          	beqz	a5,32fc <_vfprintf_r+0x1554>
    31dc:	010d1d13          	sll	s10,s10,0x10
    31e0:	410d5d13          	sra	s10,s10,0x10
    31e4:	41fd5c93          	sra	s9,s10,0x1f
    31e8:	000c8793          	mv	a5,s9
    31ec:	f207d663          	bgez	a5,2918 <_vfprintf_r+0xb70>
    31f0:	01a037b3          	snez	a5,s10
    31f4:	419000b3          	neg	ra,s9
    31f8:	40f08cb3          	sub	s9,ra,a5
    31fc:	41a00d33          	neg	s10,s10
    3200:	000e8613          	mv	a2,t4
    3204:	02d00713          	li	a4,45
    3208:	00100793          	li	a5,1
    320c:	de4ff06f          	j	27f0 <_vfprintf_r+0xa48>
    3210:	00812403          	lw	s0,8(sp)
    3214:	00f12623          	sw	a5,12(sp)
    3218:	05842503          	lw	a0,88(s0)
    321c:	c31fd0ef          	jal	e4c <__retarget_lock_acquire_recursive>
    3220:	00c41703          	lh	a4,12(s0)
    3224:	00c12783          	lw	a5,12(sp)
    3228:	c01fe06f          	j	1e28 <_vfprintf_r+0x80>
    322c:	001ef793          	and	a5,t4,1
    3230:	00079463          	bnez	a5,3238 <_vfprintf_r+0x1490>
    3234:	e7dfe06f          	j	20b0 <_vfprintf_r+0x308>
    3238:	85dff06f          	j	2a94 <_vfprintf_r+0xcec>
    323c:	000a0e93          	mv	t4,s4
    3240:	000b0313          	mv	t1,s6
    3244:	ea8ff06f          	j	28ec <_vfprintf_r+0xb44>
    3248:	00094e03          	lbu	t3,0(s2)
    324c:	00f12a23          	sw	a5,20(sp)
    3250:	d09fe06f          	j	1f58 <_vfprintf_r+0x1b0>
    3254:	0a412703          	lw	a4,164(sp)
    3258:	0000c617          	auipc	a2,0xc
    325c:	d7460613          	add	a2,a2,-652 # efcc <__fini_array_end+0x1d4>
    3260:	00c42023          	sw	a2,0(s0)
    3264:	00148493          	add	s1,s1,1
    3268:	00100613          	li	a2,1
    326c:	00170713          	add	a4,a4,1
    3270:	00c42223          	sw	a2,4(s0)
    3274:	0a912423          	sw	s1,168(sp)
    3278:	0ae12223          	sw	a4,164(sp)
    327c:	00700613          	li	a2,7
    3280:	00840413          	add	s0,s0,8
    3284:	2ee64ce3          	blt	a2,a4,3d7c <_vfprintf_r+0x1fd4>
    3288:	7e069e63          	bnez	a3,3a84 <_vfprintf_r+0x1cdc>
    328c:	01812783          	lw	a5,24(sp)
    3290:	001ef713          	and	a4,t4,1
    3294:	00f76733          	or	a4,a4,a5
    3298:	00071463          	bnez	a4,32a0 <_vfprintf_r+0x14f8>
    329c:	e15fe06f          	j	20b0 <_vfprintf_r+0x308>
    32a0:	03412703          	lw	a4,52(sp)
    32a4:	03012783          	lw	a5,48(sp)
    32a8:	00700693          	li	a3,7
    32ac:	00e42023          	sw	a4,0(s0)
    32b0:	0a412703          	lw	a4,164(sp)
    32b4:	009784b3          	add	s1,a5,s1
    32b8:	00f42223          	sw	a5,4(s0)
    32bc:	00170713          	add	a4,a4,1
    32c0:	0a912423          	sw	s1,168(sp)
    32c4:	0ae12223          	sw	a4,164(sp)
    32c8:	38e6c8e3          	blt	a3,a4,3e58 <_vfprintf_r+0x20b0>
    32cc:	00840413          	add	s0,s0,8
    32d0:	7e80006f          	j	3ab8 <_vfprintf_r+0x1d10>
    32d4:	03000793          	li	a5,48
    32d8:	14f107a3          	sb	a5,335(sp)
    32dc:	14f10c13          	add	s8,sp,335
    32e0:	d38ff06f          	j	2818 <_vfprintf_r+0xa70>
    32e4:	20067793          	and	a5,a2,512
    32e8:	00078463          	beqz	a5,32f0 <_vfprintf_r+0x1548>
    32ec:	0ffd7d13          	zext.b	s10,s10
    32f0:	00000c93          	li	s9,0
    32f4:	00100793          	li	a5,1
    32f8:	cf4ff06f          	j	27ec <_vfprintf_r+0xa44>
    32fc:	200ef793          	and	a5,t4,512
    3300:	2c0796e3          	bnez	a5,3dcc <_vfprintf_r+0x2024>
    3304:	41fd5c93          	sra	s9,s10,0x1f
    3308:	000c8793          	mv	a5,s9
    330c:	e08ff06f          	j	2914 <_vfprintf_r+0xb6c>
    3310:	200ef793          	and	a5,t4,512
    3314:	2a0790e3          	bnez	a5,3db4 <_vfprintf_r+0x200c>
    3318:	00000c93          	li	s9,0
    331c:	e74ff06f          	j	2990 <_vfprintf_r+0xbe8>
    3320:	01412783          	lw	a5,20(sp)
    3324:	06010513          	add	a0,sp,96
    3328:	03612223          	sw	s6,36(sp)
    332c:	0007a703          	lw	a4,0(a5)
    3330:	03c12023          	sw	t3,32(sp)
    3334:	00478b13          	add	s6,a5,4
    3338:	00072683          	lw	a3,0(a4)
    333c:	01412823          	sw	s4,16(sp)
    3340:	06d12023          	sw	a3,96(sp)
    3344:	00472683          	lw	a3,4(a4)
    3348:	06d12223          	sw	a3,100(sp)
    334c:	00872683          	lw	a3,8(a4)
    3350:	06d12423          	sw	a3,104(sp)
    3354:	00c72703          	lw	a4,12(a4)
    3358:	06e12623          	sw	a4,108(sp)
    335c:	4c80b0ef          	jal	e824 <__trunctfdf2>
    3360:	02012e03          	lw	t3,32(sp)
    3364:	02412303          	lw	t1,36(sp)
    3368:	02a12423          	sw	a0,40(sp)
    336c:	02b12623          	sw	a1,44(sp)
    3370:	01612a23          	sw	s6,20(sp)
    3374:	000a0e93          	mv	t4,s4
    3378:	fb1fe06f          	j	2328 <_vfprintf_r+0x580>
    337c:	010a7793          	and	a5,s4,16
    3380:	6c079a63          	bnez	a5,3a54 <_vfprintf_r+0x1cac>
    3384:	040a7793          	and	a5,s4,64
    3388:	24079ce3          	bnez	a5,3de0 <_vfprintf_r+0x2038>
    338c:	200a7f13          	and	t5,s4,512
    3390:	6c0f0263          	beqz	t5,3a54 <_vfprintf_r+0x1cac>
    3394:	01412783          	lw	a5,20(sp)
    3398:	00c12703          	lw	a4,12(sp)
    339c:	0007a783          	lw	a5,0(a5)
    33a0:	00e78023          	sb	a4,0(a5)
    33a4:	e6cff06f          	j	2a10 <_vfprintf_r+0xc68>
    33a8:	03c12783          	lw	a5,60(sp)
    33ac:	00094e03          	lbu	t3,0(s2)
    33b0:	00079463          	bnez	a5,33b8 <_vfprintf_r+0x1610>
    33b4:	ba5fe06f          	j	1f58 <_vfprintf_r+0x1b0>
    33b8:	0007c783          	lbu	a5,0(a5)
    33bc:	00079463          	bnez	a5,33c4 <_vfprintf_r+0x161c>
    33c0:	b99fe06f          	j	1f58 <_vfprintf_r+0x1b0>
    33c4:	400a6a13          	or	s4,s4,1024
    33c8:	b91fe06f          	j	1f58 <_vfprintf_r+0x1b0>
    33cc:	fff00b13          	li	s6,-1
    33d0:	00068913          	mv	s2,a3
    33d4:	b89fe06f          	j	1f5c <_vfprintf_r+0x1b4>
    33d8:	0000c797          	auipc	a5,0xc
    33dc:	bd878793          	add	a5,a5,-1064 # efb0 <__fini_array_end+0x1b8>
    33e0:	000a0e93          	mv	t4,s4
    33e4:	000b0313          	mv	t1,s6
    33e8:	02f12c23          	sw	a5,56(sp)
    33ec:	020ef793          	and	a5,t4,32
    33f0:	1c078263          	beqz	a5,35b4 <_vfprintf_r+0x180c>
    33f4:	01412783          	lw	a5,20(sp)
    33f8:	00778b13          	add	s6,a5,7
    33fc:	ff8b7b13          	and	s6,s6,-8
    3400:	000b2d03          	lw	s10,0(s6)
    3404:	004b2c83          	lw	s9,4(s6)
    3408:	008b0793          	add	a5,s6,8
    340c:	00f12a23          	sw	a5,20(sp)
    3410:	001ef793          	and	a5,t4,1
    3414:	00078e63          	beqz	a5,3430 <_vfprintf_r+0x1688>
    3418:	019d67b3          	or	a5,s10,s9
    341c:	00078a63          	beqz	a5,3430 <_vfprintf_r+0x1688>
    3420:	03000793          	li	a5,48
    3424:	06f10c23          	sb	a5,120(sp)
    3428:	07c10ca3          	sb	t3,121(sp)
    342c:	002eee93          	or	t4,t4,2
    3430:	bffef613          	and	a2,t4,-1025
    3434:	00200793          	li	a5,2
    3438:	bb4ff06f          	j	27ec <_vfprintf_r+0xa44>
    343c:	000b0313          	mv	t1,s6
    3440:	000a0613          	mv	a2,s4
    3444:	b80ff06f          	j	27c4 <_vfprintf_r+0xa1c>
    3448:	000a0e93          	mv	t4,s4
    344c:	000b0313          	mv	t1,s6
    3450:	d1cff06f          	j	296c <_vfprintf_r+0xbc4>
    3454:	0000c797          	auipc	a5,0xc
    3458:	b4878793          	add	a5,a5,-1208 # ef9c <__fini_array_end+0x1a4>
    345c:	000a0e93          	mv	t4,s4
    3460:	000b0313          	mv	t1,s6
    3464:	02f12c23          	sw	a5,56(sp)
    3468:	f85ff06f          	j	33ec <_vfprintf_r+0x1644>
    346c:	00194e03          	lbu	t3,1(s2)
    3470:	020a6a13          	or	s4,s4,32
    3474:	00190913          	add	s2,s2,1
    3478:	ae1fe06f          	j	1f58 <_vfprintf_r+0x1b0>
    347c:	00194e03          	lbu	t3,1(s2)
    3480:	200a6a13          	or	s4,s4,512
    3484:	00190913          	add	s2,s2,1
    3488:	ad1fe06f          	j	1f58 <_vfprintf_r+0x1b0>
    348c:	00812583          	lw	a1,8(sp)
    3490:	0a010613          	add	a2,sp,160
    3494:	00098513          	mv	a0,s3
    3498:	03d12023          	sw	t4,32(sp)
    349c:	7c8010ef          	jal	4c64 <__sprint_r>
    34a0:	00050463          	beqz	a0,34a8 <_vfprintf_r+0x1700>
    34a4:	dd5fe06f          	j	2278 <_vfprintf_r+0x4d0>
    34a8:	0a812483          	lw	s1,168(sp)
    34ac:	02012e83          	lw	t4,32(sp)
    34b0:	0ac10413          	add	s0,sp,172
    34b4:	e10ff06f          	j	2ac4 <_vfprintf_r+0xd1c>
    34b8:	00600793          	li	a5,6
    34bc:	00030c93          	mv	s9,t1
    34c0:	0e67e6e3          	bltu	a5,t1,3dac <_vfprintf_r+0x2004>
    34c4:	01612a23          	sw	s6,20(sp)
    34c8:	00012823          	sw	zero,16(sp)
    34cc:	000c8d13          	mv	s10,s9
    34d0:	00000613          	li	a2,0
    34d4:	00000313          	li	t1,0
    34d8:	02012223          	sw	zero,36(sp)
    34dc:	02012023          	sw	zero,32(sp)
    34e0:	00000a13          	li	s4,0
    34e4:	0000cc17          	auipc	s8,0xc
    34e8:	ae0c0c13          	add	s8,s8,-1312 # efc4 <__fini_array_end+0x1cc>
    34ec:	afdfe06f          	j	1fe8 <_vfprintf_r+0x240>
    34f0:	00800613          	li	a2,8
    34f4:	00000593          	li	a1,0
    34f8:	09810513          	add	a0,sp,152
    34fc:	03c12023          	sw	t3,32(sp)
    3500:	01d12823          	sw	t4,16(sp)
    3504:	951fd0ef          	jal	e54 <memset>
    3508:	01412783          	lw	a5,20(sp)
    350c:	0ec10c13          	add	s8,sp,236
    3510:	09810693          	add	a3,sp,152
    3514:	0007a603          	lw	a2,0(a5)
    3518:	000c0593          	mv	a1,s8
    351c:	00098513          	mv	a0,s3
    3520:	530070ef          	jal	aa50 <_wcrtomb_r>
    3524:	fff00793          	li	a5,-1
    3528:	01012e83          	lw	t4,16(sp)
    352c:	02012e03          	lw	t3,32(sp)
    3530:	00050d13          	mv	s10,a0
    3534:	00f51463          	bne	a0,a5,353c <_vfprintf_r+0x1794>
    3538:	4980106f          	j	49d0 <_vfprintf_r+0x2c28>
    353c:	fff54813          	not	a6,a0
    3540:	41f85813          	sra	a6,a6,0x1f
    3544:	01057cb3          	and	s9,a0,a6
    3548:	97cff06f          	j	26c4 <_vfprintf_r+0x91c>
    354c:	03412703          	lw	a4,52(sp)
    3550:	03012783          	lw	a5,48(sp)
    3554:	00700693          	li	a3,7
    3558:	00e42023          	sw	a4,0(s0)
    355c:	0a412703          	lw	a4,164(sp)
    3560:	00f484b3          	add	s1,s1,a5
    3564:	00f42223          	sw	a5,4(s0)
    3568:	00170713          	add	a4,a4,1
    356c:	0a912423          	sw	s1,168(sp)
    3570:	0ae12223          	sw	a4,164(sp)
    3574:	00840413          	add	s0,s0,8
    3578:	a4e6d0e3          	bge	a3,a4,2fb8 <_vfprintf_r+0x1210>
    357c:	00812583          	lw	a1,8(sp)
    3580:	0a010613          	add	a2,sp,160
    3584:	00098513          	mv	a0,s3
    3588:	02612223          	sw	t1,36(sp)
    358c:	03d12023          	sw	t4,32(sp)
    3590:	6d4010ef          	jal	4c64 <__sprint_r>
    3594:	00050463          	beqz	a0,359c <_vfprintf_r+0x17f4>
    3598:	ce1fe06f          	j	2278 <_vfprintf_r+0x4d0>
    359c:	07c12d03          	lw	s10,124(sp)
    35a0:	0a812483          	lw	s1,168(sp)
    35a4:	02412303          	lw	t1,36(sp)
    35a8:	02012e83          	lw	t4,32(sp)
    35ac:	0ac10413          	add	s0,sp,172
    35b0:	a09ff06f          	j	2fb8 <_vfprintf_r+0x1210>
    35b4:	01412703          	lw	a4,20(sp)
    35b8:	010ef793          	and	a5,t4,16
    35bc:	00072d03          	lw	s10,0(a4)
    35c0:	00470713          	add	a4,a4,4
    35c4:	00e12a23          	sw	a4,20(sp)
    35c8:	08079863          	bnez	a5,3658 <_vfprintf_r+0x18b0>
    35cc:	040ef793          	and	a5,t4,64
    35d0:	08078063          	beqz	a5,3650 <_vfprintf_r+0x18a8>
    35d4:	010d1d13          	sll	s10,s10,0x10
    35d8:	010d5d13          	srl	s10,s10,0x10
    35dc:	00000c93          	li	s9,0
    35e0:	e31ff06f          	j	3410 <_vfprintf_r+0x1668>
    35e4:	00000d13          	li	s10,0
    35e8:	15010c13          	add	s8,sp,336
    35ec:	a2cff06f          	j	2818 <_vfprintf_r+0xa70>
    35f0:	00812583          	lw	a1,8(sp)
    35f4:	0a010613          	add	a2,sp,160
    35f8:	00098513          	mv	a0,s3
    35fc:	03d12023          	sw	t4,32(sp)
    3600:	664010ef          	jal	4c64 <__sprint_r>
    3604:	00050463          	beqz	a0,360c <_vfprintf_r+0x1864>
    3608:	c71fe06f          	j	2278 <_vfprintf_r+0x4d0>
    360c:	0a812483          	lw	s1,168(sp)
    3610:	0a412d03          	lw	s10,164(sp)
    3614:	02012e83          	lw	t4,32(sp)
    3618:	0ac10b13          	add	s6,sp,172
    361c:	f71fe06f          	j	258c <_vfprintf_r+0x7e4>
    3620:	00812583          	lw	a1,8(sp)
    3624:	0a010613          	add	a2,sp,160
    3628:	00098513          	mv	a0,s3
    362c:	03d12023          	sw	t4,32(sp)
    3630:	634010ef          	jal	4c64 <__sprint_r>
    3634:	00050463          	beqz	a0,363c <_vfprintf_r+0x1894>
    3638:	c41fe06f          	j	2278 <_vfprintf_r+0x4d0>
    363c:	0a812483          	lw	s1,168(sp)
    3640:	0a412d03          	lw	s10,164(sp)
    3644:	02012e83          	lw	t4,32(sp)
    3648:	0ac10b13          	add	s6,sp,172
    364c:	f71fe06f          	j	25bc <_vfprintf_r+0x814>
    3650:	200ef793          	and	a5,t4,512
    3654:	76079663          	bnez	a5,3dc0 <_vfprintf_r+0x2018>
    3658:	00000c93          	li	s9,0
    365c:	db5ff06f          	j	3410 <_vfprintf_r+0x1668>
    3660:	00000793          	li	a5,0
    3664:	15010b13          	add	s6,sp,336
    3668:	01212823          	sw	s2,16(sp)
    366c:	00078913          	mv	s2,a5
    3670:	00098793          	mv	a5,s3
    3674:	04812823          	sw	s0,80(sp)
    3678:	000b0993          	mv	s3,s6
    367c:	03c12403          	lw	s0,60(sp)
    3680:	40067493          	and	s1,a2,1024
    3684:	0ff00a13          	li	s4,255
    3688:	03c12023          	sw	t3,32(sp)
    368c:	02c12223          	sw	a2,36(sp)
    3690:	04612223          	sw	t1,68(sp)
    3694:	00078b13          	mv	s6,a5
    3698:	0280006f          	j	36c0 <_vfprintf_r+0x1918>
    369c:	00a00613          	li	a2,10
    36a0:	00000693          	li	a3,0
    36a4:	000d0513          	mv	a0,s10
    36a8:	000c8593          	mv	a1,s9
    36ac:	581070ef          	jal	b42c <__udivdi3>
    36b0:	6a0c8ee3          	beqz	s9,456c <_vfprintf_r+0x27c4>
    36b4:	00050d13          	mv	s10,a0
    36b8:	00058c93          	mv	s9,a1
    36bc:	000c0993          	mv	s3,s8
    36c0:	00a00613          	li	a2,10
    36c4:	00000693          	li	a3,0
    36c8:	000d0513          	mv	a0,s10
    36cc:	000c8593          	mv	a1,s9
    36d0:	408080ef          	jal	bad8 <__umoddi3>
    36d4:	03050513          	add	a0,a0,48
    36d8:	fea98fa3          	sb	a0,-1(s3)
    36dc:	fff98c13          	add	s8,s3,-1
    36e0:	00190913          	add	s2,s2,1
    36e4:	fa048ce3          	beqz	s1,369c <_vfprintf_r+0x18f4>
    36e8:	00044783          	lbu	a5,0(s0)
    36ec:	faf918e3          	bne	s2,a5,369c <_vfprintf_r+0x18f4>
    36f0:	fb4906e3          	beq	s2,s4,369c <_vfprintf_r+0x18f4>
    36f4:	560c9ae3          	bnez	s9,4468 <_vfprintf_r+0x26c0>
    36f8:	00900793          	li	a5,9
    36fc:	57a7e6e3          	bltu	a5,s10,4468 <_vfprintf_r+0x26c0>
    3700:	02412603          	lw	a2,36(sp)
    3704:	15010793          	add	a5,sp,336
    3708:	02812e23          	sw	s0,60(sp)
    370c:	01212c23          	sw	s2,24(sp)
    3710:	02012e03          	lw	t3,32(sp)
    3714:	01012903          	lw	s2,16(sp)
    3718:	04412303          	lw	t1,68(sp)
    371c:	05012403          	lw	s0,80(sp)
    3720:	000b0993          	mv	s3,s6
    3724:	41878d33          	sub	s10,a5,s8
    3728:	00060e93          	mv	t4,a2
    372c:	8ecff06f          	j	2818 <_vfprintf_r+0xa70>
    3730:	00812583          	lw	a1,8(sp)
    3734:	0a010613          	add	a2,sp,160
    3738:	00098513          	mv	a0,s3
    373c:	04612e23          	sw	t1,92(sp)
    3740:	05c12c23          	sw	t3,88(sp)
    3744:	05d12a23          	sw	t4,84(sp)
    3748:	05f12823          	sw	t6,80(sp)
    374c:	04512223          	sw	t0,68(sp)
    3750:	514010ef          	jal	4c64 <__sprint_r>
    3754:	00050463          	beqz	a0,375c <_vfprintf_r+0x19b4>
    3758:	b21fe06f          	j	2278 <_vfprintf_r+0x4d0>
    375c:	07714603          	lbu	a2,119(sp)
    3760:	0a812483          	lw	s1,168(sp)
    3764:	05c12303          	lw	t1,92(sp)
    3768:	05812e03          	lw	t3,88(sp)
    376c:	05412e83          	lw	t4,84(sp)
    3770:	05012f83          	lw	t6,80(sp)
    3774:	04412283          	lw	t0,68(sp)
    3778:	0ac10413          	add	s0,sp,172
    377c:	88dfe06f          	j	2008 <_vfprintf_r+0x260>
    3780:	02812883          	lw	a7,40(sp)
    3784:	02c12703          	lw	a4,44(sp)
    3788:	02612223          	sw	t1,36(sp)
    378c:	00088613          	mv	a2,a7
    3790:	00088513          	mv	a0,a7
    3794:	00070693          	mv	a3,a4
    3798:	00070593          	mv	a1,a4
    379c:	03c12023          	sw	t3,32(sp)
    37a0:	01d12823          	sw	t4,16(sp)
    37a4:	62d0a0ef          	jal	e5d0 <__unorddf2>
    37a8:	01012e83          	lw	t4,16(sp)
    37ac:	02012e03          	lw	t3,32(sp)
    37b0:	02412303          	lw	t1,36(sp)
    37b4:	00050463          	beqz	a0,37bc <_vfprintf_r+0x1a14>
    37b8:	0e00106f          	j	4898 <_vfprintf_r+0x2af0>
    37bc:	06100713          	li	a4,97
    37c0:	08ee0263          	beq	t3,a4,3844 <_vfprintf_r+0x1a9c>
    37c4:	04100713          	li	a4,65
    37c8:	05800793          	li	a5,88
    37cc:	06ee0e63          	beq	t3,a4,3848 <_vfprintf_r+0x1aa0>
    37d0:	fff00713          	li	a4,-1
    37d4:	00e31463          	bne	t1,a4,37dc <_vfprintf_r+0x1a34>
    37d8:	01c0106f          	j	47f4 <_vfprintf_r+0x2a4c>
    37dc:	fdfe7713          	and	a4,t3,-33
    37e0:	04700693          	li	a3,71
    37e4:	00012823          	sw	zero,16(sp)
    37e8:	00d71663          	bne	a4,a3,37f4 <_vfprintf_r+0x1a4c>
    37ec:	00031463          	bnez	t1,37f4 <_vfprintf_r+0x1a4c>
    37f0:	00100313          	li	t1,1
    37f4:	100ee793          	or	a5,t4,256
    37f8:	00078b13          	mv	s6,a5
    37fc:	02c12783          	lw	a5,44(sp)
    3800:	04012223          	sw	zero,68(sp)
    3804:	00078493          	mv	s1,a5
    3808:	0007da63          	bgez	a5,381c <_vfprintf_r+0x1a74>
    380c:	800004b7          	lui	s1,0x80000
    3810:	00f4c4b3          	xor	s1,s1,a5
    3814:	02d00793          	li	a5,45
    3818:	04f12223          	sw	a5,68(sp)
    381c:	fbfe0713          	add	a4,t3,-65
    3820:	02500693          	li	a3,37
    3824:	3ae6e463          	bltu	a3,a4,3bcc <_vfprintf_r+0x1e24>
    3828:	0000c697          	auipc	a3,0xc
    382c:	bc468693          	add	a3,a3,-1084 # f3ec <_ctype_+0x270>
    3830:	00271713          	sll	a4,a4,0x2
    3834:	00d70733          	add	a4,a4,a3
    3838:	00072703          	lw	a4,0(a4)
    383c:	00d70733          	add	a4,a4,a3
    3840:	00070067          	jr	a4
    3844:	07800793          	li	a5,120
    3848:	03000713          	li	a4,48
    384c:	06e10c23          	sb	a4,120(sp)
    3850:	06f10ca3          	sb	a5,121(sp)
    3854:	06300713          	li	a4,99
    3858:	00012823          	sw	zero,16(sp)
    385c:	002eee93          	or	t4,t4,2
    3860:	0ec10c13          	add	s8,sp,236
    3864:	f86758e3          	bge	a4,t1,37f4 <_vfprintf_r+0x1a4c>
    3868:	00130593          	add	a1,t1,1
    386c:	00098513          	mv	a0,s3
    3870:	03c12023          	sw	t3,32(sp)
    3874:	01d12c23          	sw	t4,24(sp)
    3878:	00612823          	sw	t1,16(sp)
    387c:	d35fd0ef          	jal	15b0 <_malloc_r>
    3880:	01012303          	lw	t1,16(sp)
    3884:	01812e83          	lw	t4,24(sp)
    3888:	02012e03          	lw	t3,32(sp)
    388c:	00050c13          	mv	s8,a0
    3890:	00051463          	bnez	a0,3898 <_vfprintf_r+0x1af0>
    3894:	13c0106f          	j	49d0 <_vfprintf_r+0x2c28>
    3898:	00a12823          	sw	a0,16(sp)
    389c:	f59ff06f          	j	37f4 <_vfprintf_r+0x1a4c>
    38a0:	00098513          	mv	a0,s3
    38a4:	1d0030ef          	jal	6a74 <__sinit>
    38a8:	00c12783          	lw	a5,12(sp)
    38ac:	d5cfe06f          	j	1e08 <_vfprintf_r+0x60>
    38b0:	00812583          	lw	a1,8(sp)
    38b4:	0a010613          	add	a2,sp,160
    38b8:	00098513          	mv	a0,s3
    38bc:	03d12023          	sw	t4,32(sp)
    38c0:	3a4010ef          	jal	4c64 <__sprint_r>
    38c4:	00050463          	beqz	a0,38cc <_vfprintf_r+0x1b24>
    38c8:	9b1fe06f          	j	2278 <_vfprintf_r+0x4d0>
    38cc:	0a812483          	lw	s1,168(sp)
    38d0:	02012e83          	lw	t4,32(sp)
    38d4:	0ac10413          	add	s0,sp,172
    38d8:	9b0ff06f          	j	2a88 <_vfprintf_r+0xce0>
    38dc:	00800613          	li	a2,8
    38e0:	00000593          	li	a1,0
    38e4:	09810513          	add	a0,sp,152
    38e8:	02612023          	sw	t1,32(sp)
    38ec:	01c12a23          	sw	t3,20(sp)
    38f0:	01d12823          	sw	t4,16(sp)
    38f4:	09812223          	sw	s8,132(sp)
    38f8:	d5cfd0ef          	jal	e54 <memset>
    38fc:	02012303          	lw	t1,32(sp)
    3900:	01012e83          	lw	t4,16(sp)
    3904:	01412e03          	lw	t3,20(sp)
    3908:	3a0340e3          	bltz	t1,44a8 <_vfprintf_r+0x2700>
    390c:	00000d13          	li	s10,0
    3910:	01212823          	sw	s2,16(sp)
    3914:	000c0c93          	mv	s9,s8
    3918:	fff00493          	li	s1,-1
    391c:	000b0c13          	mv	s8,s6
    3920:	000e8a13          	mv	s4,t4
    3924:	00040b13          	mv	s6,s0
    3928:	000d0913          	mv	s2,s10
    392c:	00030413          	mv	s0,t1
    3930:	0300006f          	j	3960 <_vfprintf_r+0x1bb8>
    3934:	09810693          	add	a3,sp,152
    3938:	0ec10593          	add	a1,sp,236
    393c:	00098513          	mv	a0,s3
    3940:	110070ef          	jal	aa50 <_wcrtomb_r>
    3944:	68950ae3          	beq	a0,s1,47d8 <_vfprintf_r+0x2a30>
    3948:	00a907b3          	add	a5,s2,a0
    394c:	02f44263          	blt	s0,a5,3970 <_vfprintf_r+0x1bc8>
    3950:	004d0d13          	add	s10,s10,4
    3954:	00879463          	bne	a5,s0,395c <_vfprintf_r+0x1bb4>
    3958:	7990006f          	j	48f0 <_vfprintf_r+0x2b48>
    395c:	00078913          	mv	s2,a5
    3960:	08412783          	lw	a5,132(sp)
    3964:	01a787b3          	add	a5,a5,s10
    3968:	0007a603          	lw	a2,0(a5)
    396c:	fc0614e3          	bnez	a2,3934 <_vfprintf_r+0x1b8c>
    3970:	00090d13          	mv	s10,s2
    3974:	01412e03          	lw	t3,20(sp)
    3978:	01012903          	lw	s2,16(sp)
    397c:	000b0413          	mv	s0,s6
    3980:	000a0e93          	mv	t4,s4
    3984:	000c0b13          	mv	s6,s8
    3988:	000c8c13          	mv	s8,s9
    398c:	340d0ce3          	beqz	s10,44e4 <_vfprintf_r+0x273c>
    3990:	06300793          	li	a5,99
    3994:	59a7dee3          	bge	a5,s10,4730 <_vfprintf_r+0x2988>
    3998:	001d0593          	add	a1,s10,1
    399c:	00098513          	mv	a0,s3
    39a0:	01c12a23          	sw	t3,20(sp)
    39a4:	01d12823          	sw	t4,16(sp)
    39a8:	c09fd0ef          	jal	15b0 <_malloc_r>
    39ac:	01012e83          	lw	t4,16(sp)
    39b0:	01412e03          	lw	t3,20(sp)
    39b4:	00050c13          	mv	s8,a0
    39b8:	620500e3          	beqz	a0,47d8 <_vfprintf_r+0x2a30>
    39bc:	00a12823          	sw	a0,16(sp)
    39c0:	00800613          	li	a2,8
    39c4:	00000593          	li	a1,0
    39c8:	09810513          	add	a0,sp,152
    39cc:	03c12023          	sw	t3,32(sp)
    39d0:	01d12a23          	sw	t4,20(sp)
    39d4:	c80fd0ef          	jal	e54 <memset>
    39d8:	09810713          	add	a4,sp,152
    39dc:	000d0693          	mv	a3,s10
    39e0:	08410613          	add	a2,sp,132
    39e4:	000c0593          	mv	a1,s8
    39e8:	00098513          	mv	a0,s3
    39ec:	0f0070ef          	jal	aadc <_wcsrtombs_r>
    39f0:	01412e83          	lw	t4,20(sp)
    39f4:	02012e03          	lw	t3,32(sp)
    39f8:	00ad0463          	beq	s10,a0,3a00 <_vfprintf_r+0x1c58>
    39fc:	0240106f          	j	4a20 <_vfprintf_r+0x2c78>
    3a00:	01ac0733          	add	a4,s8,s10
    3a04:	00070023          	sb	zero,0(a4)
    3a08:	07714603          	lbu	a2,119(sp)
    3a0c:	fffd4813          	not	a6,s10
    3a10:	41f85813          	sra	a6,a6,0x1f
    3a14:	01612a23          	sw	s6,20(sp)
    3a18:	02012223          	sw	zero,36(sp)
    3a1c:	02012023          	sw	zero,32(sp)
    3a20:	010d7cb3          	and	s9,s10,a6
    3a24:	00000313          	li	t1,0
    3a28:	00000a13          	li	s4,0
    3a2c:	00061463          	bnez	a2,3a34 <_vfprintf_r+0x1c8c>
    3a30:	db8fe06f          	j	1fe8 <_vfprintf_r+0x240>
    3a34:	9d5fe06f          	j	2408 <_vfprintf_r+0x660>
    3a38:	00048e93          	mv	t4,s1
    3a3c:	000a0293          	mv	t0,s4
    3a40:	00070493          	mv	s1,a4
    3a44:	01a484b3          	add	s1,s1,s10
    3a48:	00178793          	add	a5,a5,1
    3a4c:	00542023          	sw	t0,0(s0)
    3a50:	e48fe06f          	j	2098 <_vfprintf_r+0x2f0>
    3a54:	01412783          	lw	a5,20(sp)
    3a58:	00c12703          	lw	a4,12(sp)
    3a5c:	0007a783          	lw	a5,0(a5)
    3a60:	00e7a023          	sw	a4,0(a5)
    3a64:	fadfe06f          	j	2a10 <_vfprintf_r+0xc68>
    3a68:	02012e83          	lw	t4,32(sp)
    3a6c:	00040293          	mv	t0,s0
    3a70:	000a0413          	mv	s0,s4
    3a74:	008484b3          	add	s1,s1,s0
    3a78:	001d0d13          	add	s10,s10,1
    3a7c:	005b2023          	sw	t0,0(s6)
    3a80:	b7dfe06f          	j	25fc <_vfprintf_r+0x854>
    3a84:	03412703          	lw	a4,52(sp)
    3a88:	03012783          	lw	a5,48(sp)
    3a8c:	00700613          	li	a2,7
    3a90:	00e42023          	sw	a4,0(s0)
    3a94:	0a412703          	lw	a4,164(sp)
    3a98:	009784b3          	add	s1,a5,s1
    3a9c:	00f42223          	sw	a5,4(s0)
    3aa0:	00170713          	add	a4,a4,1
    3aa4:	0a912423          	sw	s1,168(sp)
    3aa8:	0ae12223          	sw	a4,164(sp)
    3aac:	00840413          	add	s0,s0,8
    3ab0:	3ae64463          	blt	a2,a4,3e58 <_vfprintf_r+0x20b0>
    3ab4:	3e06cee3          	bltz	a3,46b0 <_vfprintf_r+0x2908>
    3ab8:	01812783          	lw	a5,24(sp)
    3abc:	00170713          	add	a4,a4,1
    3ac0:	01842023          	sw	s8,0(s0)
    3ac4:	009784b3          	add	s1,a5,s1
    3ac8:	00f42223          	sw	a5,4(s0)
    3acc:	0a912423          	sw	s1,168(sp)
    3ad0:	0ae12223          	sw	a4,164(sp)
    3ad4:	00700793          	li	a5,7
    3ad8:	00e7c463          	blt	a5,a4,3ae0 <_vfprintf_r+0x1d38>
    3adc:	dd0fe06f          	j	20ac <_vfprintf_r+0x304>
    3ae0:	b61fe06f          	j	2640 <_vfprintf_r+0x898>
    3ae4:	01000613          	li	a2,16
    3ae8:	0a412683          	lw	a3,164(sp)
    3aec:	0000c297          	auipc	t0,0xc
    3af0:	99828293          	add	t0,t0,-1640 # f484 <zeroes.0>
    3af4:	09665463          	bge	a2,s6,3b7c <_vfprintf_r+0x1dd4>
    3af8:	00040793          	mv	a5,s0
    3afc:	00048713          	mv	a4,s1
    3b00:	00812403          	lw	s0,8(sp)
    3b04:	01000893          	li	a7,16
    3b08:	00700d13          	li	s10,7
    3b0c:	05d12223          	sw	t4,68(sp)
    3b10:	00028493          	mv	s1,t0
    3b14:	00c0006f          	j	3b20 <_vfprintf_r+0x1d78>
    3b18:	ff0b0b13          	add	s6,s6,-16
    3b1c:	0568d863          	bge	a7,s6,3b6c <_vfprintf_r+0x1dc4>
    3b20:	01070713          	add	a4,a4,16
    3b24:	00168693          	add	a3,a3,1
    3b28:	0097a023          	sw	s1,0(a5)
    3b2c:	0117a223          	sw	a7,4(a5)
    3b30:	0ae12423          	sw	a4,168(sp)
    3b34:	0ad12223          	sw	a3,164(sp)
    3b38:	00878793          	add	a5,a5,8
    3b3c:	fcdd5ee3          	bge	s10,a3,3b18 <_vfprintf_r+0x1d70>
    3b40:	0a010613          	add	a2,sp,160
    3b44:	00040593          	mv	a1,s0
    3b48:	00098513          	mv	a0,s3
    3b4c:	118010ef          	jal	4c64 <__sprint_r>
    3b50:	00050463          	beqz	a0,3b58 <_vfprintf_r+0x1db0>
    3b54:	f24fe06f          	j	2278 <_vfprintf_r+0x4d0>
    3b58:	0a812703          	lw	a4,168(sp)
    3b5c:	0a412683          	lw	a3,164(sp)
    3b60:	0ac10793          	add	a5,sp,172
    3b64:	01000893          	li	a7,16
    3b68:	fb1ff06f          	j	3b18 <_vfprintf_r+0x1d70>
    3b6c:	04412e83          	lw	t4,68(sp)
    3b70:	00048293          	mv	t0,s1
    3b74:	00078413          	mv	s0,a5
    3b78:	00070493          	mv	s1,a4
    3b7c:	016484b3          	add	s1,s1,s6
    3b80:	00168693          	add	a3,a3,1
    3b84:	00542023          	sw	t0,0(s0)
    3b88:	01642223          	sw	s6,4(s0)
    3b8c:	0a912423          	sw	s1,168(sp)
    3b90:	0ad12223          	sw	a3,164(sp)
    3b94:	00700713          	li	a4,7
    3b98:	00840413          	add	s0,s0,8
    3b9c:	bed75c63          	bge	a4,a3,2f94 <_vfprintf_r+0x11ec>
    3ba0:	00812583          	lw	a1,8(sp)
    3ba4:	0a010613          	add	a2,sp,160
    3ba8:	00098513          	mv	a0,s3
    3bac:	05d12223          	sw	t4,68(sp)
    3bb0:	0b4010ef          	jal	4c64 <__sprint_r>
    3bb4:	00050463          	beqz	a0,3bbc <_vfprintf_r+0x1e14>
    3bb8:	ec0fe06f          	j	2278 <_vfprintf_r+0x4d0>
    3bbc:	0a812483          	lw	s1,168(sp)
    3bc0:	04412e83          	lw	t4,68(sp)
    3bc4:	0ac10413          	add	s0,sp,172
    3bc8:	bccff06f          	j	2f94 <_vfprintf_r+0x11ec>
    3bcc:	02812703          	lw	a4,40(sp)
    3bd0:	09810893          	add	a7,sp,152
    3bd4:	08410813          	add	a6,sp,132
    3bd8:	00070513          	mv	a0,a4
    3bdc:	00050593          	mv	a1,a0
    3be0:	00030713          	mv	a4,t1
    3be4:	07c10793          	add	a5,sp,124
    3be8:	00200693          	li	a3,2
    3bec:	00048613          	mv	a2,s1
    3bf0:	00098513          	mv	a0,s3
    3bf4:	03c12223          	sw	t3,36(sp)
    3bf8:	03d12023          	sw	t4,32(sp)
    3bfc:	00612c23          	sw	t1,24(sp)
    3c00:	3a8040ef          	jal	7fa8 <_dtoa_r>
    3c04:	02012e83          	lw	t4,32(sp)
    3c08:	01812303          	lw	t1,24(sp)
    3c0c:	02412e03          	lw	t3,36(sp)
    3c10:	001ef713          	and	a4,t4,1
    3c14:	00050c13          	mv	s8,a0
    3c18:	1a0712e3          	bnez	a4,45bc <_vfprintf_r+0x2814>
    3c1c:	09812783          	lw	a5,152(sp)
    3c20:	07c12a03          	lw	s4,124(sp)
    3c24:	40a787b3          	sub	a5,a5,a0
    3c28:	00f12c23          	sw	a5,24(sp)
    3c2c:	ffd00713          	li	a4,-3
    3c30:	00ea4463          	blt	s4,a4,3c38 <_vfprintf_r+0x1e90>
    3c34:	5b435663          	bge	t1,s4,41e0 <_vfprintf_r+0x2438>
    3c38:	ffee0e13          	add	t3,t3,-2
    3c3c:	fffa0d13          	add	s10,s4,-1
    3c40:	07a12e23          	sw	s10,124(sp)
    3c44:	0ffe7693          	zext.b	a3,t3
    3c48:	00000613          	li	a2,0
    3c4c:	08d10423          	sb	a3,136(sp)
    3c50:	02b00693          	li	a3,43
    3c54:	000d5863          	bgez	s10,3c64 <_vfprintf_r+0x1ebc>
    3c58:	00100713          	li	a4,1
    3c5c:	41470d33          	sub	s10,a4,s4
    3c60:	02d00693          	li	a3,45
    3c64:	08d104a3          	sb	a3,137(sp)
    3c68:	00900693          	li	a3,9
    3c6c:	33a6d8e3          	bge	a3,s10,479c <_vfprintf_r+0x29f4>
    3c70:	000c0793          	mv	a5,s8
    3c74:	09f10493          	add	s1,sp,159
    3c78:	03212023          	sw	s2,32(sp)
    3c7c:	00040c13          	mv	s8,s0
    3c80:	06300a13          	li	s4,99
    3c84:	000d0413          	mv	s0,s10
    3c88:	03d12223          	sw	t4,36(sp)
    3c8c:	05c12023          	sw	t3,64(sp)
    3c90:	00048913          	mv	s2,s1
    3c94:	00098c93          	mv	s9,s3
    3c98:	00078d13          	mv	s10,a5
    3c9c:	00a00593          	li	a1,10
    3ca0:	00040513          	mv	a0,s0
    3ca4:	09c0b0ef          	jal	ed40 <__modsi3>
    3ca8:	03050713          	add	a4,a0,48
    3cac:	00090b13          	mv	s6,s2
    3cb0:	00040513          	mv	a0,s0
    3cb4:	feeb0fa3          	sb	a4,-1(s6)
    3cb8:	00a00593          	li	a1,10
    3cbc:	00040993          	mv	s3,s0
    3cc0:	7fd0a0ef          	jal	ecbc <__divsi3>
    3cc4:	fff90913          	add	s2,s2,-1
    3cc8:	00050413          	mv	s0,a0
    3ccc:	fd3a48e3          	blt	s4,s3,3c9c <_vfprintf_r+0x1ef4>
    3cd0:	000c8993          	mv	s3,s9
    3cd4:	03050713          	add	a4,a0,48
    3cd8:	00090c93          	mv	s9,s2
    3cdc:	ffeb0693          	add	a3,s6,-2
    3ce0:	feec8fa3          	sb	a4,-1(s9)
    3ce4:	000c0413          	mv	s0,s8
    3ce8:	02412e83          	lw	t4,36(sp)
    3cec:	04012e03          	lw	t3,64(sp)
    3cf0:	02012903          	lw	s2,32(sp)
    3cf4:	000d0c13          	mv	s8,s10
    3cf8:	4c96f6e3          	bgeu	a3,s1,49c4 <_vfprintf_r+0x2c1c>
    3cfc:	08a10713          	add	a4,sp,138
    3d00:	0006c783          	lbu	a5,0(a3)
    3d04:	00168693          	add	a3,a3,1
    3d08:	00170713          	add	a4,a4,1
    3d0c:	fef70fa3          	sb	a5,-1(a4)
    3d10:	fe9698e3          	bne	a3,s1,3d00 <_vfprintf_r+0x1f58>
    3d14:	15010793          	add	a5,sp,336
    3d18:	41678633          	sub	a2,a5,s6
    3d1c:	f5360793          	add	a5,a2,-173
    3d20:	04f12023          	sw	a5,64(sp)
    3d24:	01812783          	lw	a5,24(sp)
    3d28:	04012683          	lw	a3,64(sp)
    3d2c:	00100713          	li	a4,1
    3d30:	00d78d33          	add	s10,a5,a3
    3d34:	28f75ce3          	bge	a4,a5,47cc <_vfprintf_r+0x2a24>
    3d38:	03012783          	lw	a5,48(sp)
    3d3c:	00fd0d33          	add	s10,s10,a5
    3d40:	fffd4813          	not	a6,s10
    3d44:	bffeff13          	and	t5,t4,-1025
    3d48:	41f85813          	sra	a6,a6,0x1f
    3d4c:	100f6e93          	or	t4,t5,256
    3d50:	010d7cb3          	and	s9,s10,a6
    3d54:	02012223          	sw	zero,36(sp)
    3d58:	02012023          	sw	zero,32(sp)
    3d5c:	00000a13          	li	s4,0
    3d60:	04412783          	lw	a5,68(sp)
    3d64:	46079263          	bnez	a5,41c8 <_vfprintf_r+0x2420>
    3d68:	07714603          	lbu	a2,119(sp)
    3d6c:	00000313          	li	t1,0
    3d70:	00061463          	bnez	a2,3d78 <_vfprintf_r+0x1fd0>
    3d74:	a74fe06f          	j	1fe8 <_vfprintf_r+0x240>
    3d78:	e90fe06f          	j	2408 <_vfprintf_r+0x660>
    3d7c:	00812583          	lw	a1,8(sp)
    3d80:	0a010613          	add	a2,sp,160
    3d84:	00098513          	mv	a0,s3
    3d88:	03d12023          	sw	t4,32(sp)
    3d8c:	6d9000ef          	jal	4c64 <__sprint_r>
    3d90:	00050463          	beqz	a0,3d98 <_vfprintf_r+0x1ff0>
    3d94:	ce4fe06f          	j	2278 <_vfprintf_r+0x4d0>
    3d98:	07c12683          	lw	a3,124(sp)
    3d9c:	0a812483          	lw	s1,168(sp)
    3da0:	02012e83          	lw	t4,32(sp)
    3da4:	0ac10413          	add	s0,sp,172
    3da8:	ce0ff06f          	j	3288 <_vfprintf_r+0x14e0>
    3dac:	00600c93          	li	s9,6
    3db0:	f14ff06f          	j	34c4 <_vfprintf_r+0x171c>
    3db4:	0ffd7d13          	zext.b	s10,s10
    3db8:	00000c93          	li	s9,0
    3dbc:	bd5fe06f          	j	2990 <_vfprintf_r+0xbe8>
    3dc0:	0ffd7d13          	zext.b	s10,s10
    3dc4:	00000c93          	li	s9,0
    3dc8:	e48ff06f          	j	3410 <_vfprintf_r+0x1668>
    3dcc:	018d1d13          	sll	s10,s10,0x18
    3dd0:	418d5d13          	sra	s10,s10,0x18
    3dd4:	41fd5c93          	sra	s9,s10,0x1f
    3dd8:	000c8793          	mv	a5,s9
    3ddc:	b39fe06f          	j	2914 <_vfprintf_r+0xb6c>
    3de0:	01412783          	lw	a5,20(sp)
    3de4:	00c12703          	lw	a4,12(sp)
    3de8:	0007a783          	lw	a5,0(a5)
    3dec:	00e79023          	sh	a4,0(a5)
    3df0:	c21fe06f          	j	2a10 <_vfprintf_r+0xc68>
    3df4:	000c0513          	mv	a0,s8
    3df8:	05d12223          	sw	t4,68(sp)
    3dfc:	ad8fd0ef          	jal	10d4 <strlen>
    3e00:	07714603          	lbu	a2,119(sp)
    3e04:	fff54813          	not	a6,a0
    3e08:	41f85813          	sra	a6,a6,0x1f
    3e0c:	01612a23          	sw	s6,20(sp)
    3e10:	02012223          	sw	zero,36(sp)
    3e14:	02012023          	sw	zero,32(sp)
    3e18:	00012823          	sw	zero,16(sp)
    3e1c:	04412e83          	lw	t4,68(sp)
    3e20:	00050d13          	mv	s10,a0
    3e24:	01057cb3          	and	s9,a0,a6
    3e28:	00000313          	li	t1,0
    3e2c:	07300e13          	li	t3,115
    3e30:	00061463          	bnez	a2,3e38 <_vfprintf_r+0x2090>
    3e34:	9b4fe06f          	j	1fe8 <_vfprintf_r+0x240>
    3e38:	dd0fe06f          	j	2408 <_vfprintf_r+0x660>
    3e3c:	00812583          	lw	a1,8(sp)
    3e40:	0a010613          	add	a2,sp,160
    3e44:	00098513          	mv	a0,s3
    3e48:	61d000ef          	jal	4c64 <__sprint_r>
    3e4c:	00051463          	bnez	a0,3e54 <_vfprintf_r+0x20ac>
    3e50:	be8fe06f          	j	2238 <_vfprintf_r+0x490>
    3e54:	c38fe06f          	j	228c <_vfprintf_r+0x4e4>
    3e58:	00812583          	lw	a1,8(sp)
    3e5c:	0a010613          	add	a2,sp,160
    3e60:	00098513          	mv	a0,s3
    3e64:	03d12023          	sw	t4,32(sp)
    3e68:	5fd000ef          	jal	4c64 <__sprint_r>
    3e6c:	00050463          	beqz	a0,3e74 <_vfprintf_r+0x20cc>
    3e70:	c08fe06f          	j	2278 <_vfprintf_r+0x4d0>
    3e74:	07c12683          	lw	a3,124(sp)
    3e78:	0a812483          	lw	s1,168(sp)
    3e7c:	0a412703          	lw	a4,164(sp)
    3e80:	02012e83          	lw	t4,32(sp)
    3e84:	0ac10413          	add	s0,sp,172
    3e88:	c2dff06f          	j	3ab4 <_vfprintf_r+0x1d0c>
    3e8c:	05862503          	lw	a0,88(a2)
    3e90:	00f12623          	sw	a5,12(sp)
    3e94:	fbdfc0ef          	jal	e50 <__retarget_lock_release_recursive>
    3e98:	00c12783          	lw	a5,12(sp)
    3e9c:	ab8fe06f          	j	2154 <_vfprintf_r+0x3ac>
    3ea0:	00130a13          	add	s4,t1,1
    3ea4:	00200693          	li	a3,2
    3ea8:	02812703          	lw	a4,40(sp)
    3eac:	09810893          	add	a7,sp,152
    3eb0:	08410813          	add	a6,sp,132
    3eb4:	00070513          	mv	a0,a4
    3eb8:	00050593          	mv	a1,a0
    3ebc:	000a0713          	mv	a4,s4
    3ec0:	07c10793          	add	a5,sp,124
    3ec4:	00048613          	mv	a2,s1
    3ec8:	00098513          	mv	a0,s3
    3ecc:	02612223          	sw	t1,36(sp)
    3ed0:	03c12023          	sw	t3,32(sp)
    3ed4:	01d12c23          	sw	t4,24(sp)
    3ed8:	0d0040ef          	jal	7fa8 <_dtoa_r>
    3edc:	02012e03          	lw	t3,32(sp)
    3ee0:	04600693          	li	a3,70
    3ee4:	01812e83          	lw	t4,24(sp)
    3ee8:	fdfe7d13          	and	s10,t3,-33
    3eec:	02412303          	lw	t1,36(sp)
    3ef0:	00050c13          	mv	s8,a0
    3ef4:	01450733          	add	a4,a0,s4
    3ef8:	34dd14e3          	bne	s10,a3,4a40 <_vfprintf_r+0x2c98>
    3efc:	000c4603          	lbu	a2,0(s8)
    3f00:	03000693          	li	a3,48
    3f04:	6cd60263          	beq	a2,a3,45c8 <_vfprintf_r+0x2820>
    3f08:	07c12683          	lw	a3,124(sp)
    3f0c:	00d70733          	add	a4,a4,a3
    3f10:	02812683          	lw	a3,40(sp)
    3f14:	00048593          	mv	a1,s1
    3f18:	00000613          	li	a2,0
    3f1c:	00068513          	mv	a0,a3
    3f20:	00000693          	li	a3,0
    3f24:	04e12823          	sw	a4,80(sp)
    3f28:	02612223          	sw	t1,36(sp)
    3f2c:	03c12023          	sw	t3,32(sp)
    3f30:	01d12c23          	sw	t4,24(sp)
    3f34:	370090ef          	jal	d2a4 <__eqdf2>
    3f38:	01812e83          	lw	t4,24(sp)
    3f3c:	02012e03          	lw	t3,32(sp)
    3f40:	02412303          	lw	t1,36(sp)
    3f44:	05012703          	lw	a4,80(sp)
    3f48:	62050863          	beqz	a0,4578 <_vfprintf_r+0x27d0>
    3f4c:	09812783          	lw	a5,152(sp)
    3f50:	00e7fe63          	bgeu	a5,a4,3f6c <_vfprintf_r+0x21c4>
    3f54:	03000613          	li	a2,48
    3f58:	00178693          	add	a3,a5,1
    3f5c:	08d12c23          	sw	a3,152(sp)
    3f60:	00c78023          	sb	a2,0(a5)
    3f64:	09812783          	lw	a5,152(sp)
    3f68:	fee7e8e3          	bltu	a5,a4,3f58 <_vfprintf_r+0x21b0>
    3f6c:	07c12a03          	lw	s4,124(sp)
    3f70:	418787b3          	sub	a5,a5,s8
    3f74:	04700713          	li	a4,71
    3f78:	00f12c23          	sw	a5,24(sp)
    3f7c:	caed08e3          	beq	s10,a4,3c2c <_vfprintf_r+0x1e84>
    3f80:	04600713          	li	a4,70
    3f84:	68ed0863          	beq	s10,a4,4614 <_vfprintf_r+0x286c>
    3f88:	fffa0d13          	add	s10,s4,-1
    3f8c:	cb5ff06f          	j	3c40 <_vfprintf_r+0x1e98>
    3f90:	02812703          	lw	a4,40(sp)
    3f94:	07c10613          	add	a2,sp,124
    3f98:	00048593          	mv	a1,s1
    3f9c:	00070513          	mv	a0,a4
    3fa0:	02612223          	sw	t1,36(sp)
    3fa4:	03c12023          	sw	t3,32(sp)
    3fa8:	01d12c23          	sw	t4,24(sp)
    3fac:	4e9030ef          	jal	7c94 <frexp>
    3fb0:	7fffc717          	auipc	a4,0x7fffc
    3fb4:	6f870713          	add	a4,a4,1784 # 800006a8 <__global_locale+0x174>
    3fb8:	00072603          	lw	a2,0(a4)
    3fbc:	00472683          	lw	a3,4(a4)
    3fc0:	578090ef          	jal	d538 <__muldf3>
    3fc4:	00000613          	li	a2,0
    3fc8:	00000693          	li	a3,0
    3fcc:	00050a13          	mv	s4,a0
    3fd0:	00058d13          	mv	s10,a1
    3fd4:	2d0090ef          	jal	d2a4 <__eqdf2>
    3fd8:	01812e83          	lw	t4,24(sp)
    3fdc:	02012e03          	lw	t3,32(sp)
    3fe0:	02412303          	lw	t1,36(sp)
    3fe4:	00051663          	bnez	a0,3ff0 <_vfprintf_r+0x2248>
    3fe8:	00100713          	li	a4,1
    3fec:	06e12e23          	sw	a4,124(sp)
    3ff0:	0000b797          	auipc	a5,0xb
    3ff4:	fc078793          	add	a5,a5,-64 # efb0 <__fini_array_end+0x1b8>
    3ff8:	06100713          	li	a4,97
    3ffc:	02f12023          	sw	a5,32(sp)
    4000:	00ee1863          	bne	t3,a4,4010 <_vfprintf_r+0x2268>
    4004:	0000b797          	auipc	a5,0xb
    4008:	f9878793          	add	a5,a5,-104 # ef9c <__fini_array_end+0x1a4>
    400c:	02f12023          	sw	a5,32(sp)
    4010:	7fffc717          	auipc	a4,0x7fffc
    4014:	6a070713          	add	a4,a4,1696 # 800006b0 <__global_locale+0x17c>
    4018:	00072783          	lw	a5,0(a4)
    401c:	00472803          	lw	a6,4(a4)
    4020:	000c0493          	mv	s1,s8
    4024:	00f12c23          	sw	a5,24(sp)
    4028:	000d0793          	mv	a5,s10
    402c:	03212223          	sw	s2,36(sp)
    4030:	000c0d13          	mv	s10,s8
    4034:	02012903          	lw	s2,32(sp)
    4038:	00098c13          	mv	s8,s3
    403c:	01012e23          	sw	a6,28(sp)
    4040:	fff30b13          	add	s6,t1,-1
    4044:	fff00c93          	li	s9,-1
    4048:	05d12023          	sw	t4,64(sp)
    404c:	05c12823          	sw	t3,80(sp)
    4050:	04812a23          	sw	s0,84(sp)
    4054:	00078993          	mv	s3,a5
    4058:	01c0006f          	j	4074 <_vfprintf_r+0x22cc>
    405c:	00000613          	li	a2,0
    4060:	00000693          	li	a3,0
    4064:	fffb0413          	add	s0,s6,-1
    4068:	23c090ef          	jal	d2a4 <__eqdf2>
    406c:	0a0504e3          	beqz	a0,4914 <_vfprintf_r+0x2b6c>
    4070:	00040b13          	mv	s6,s0
    4074:	01812603          	lw	a2,24(sp)
    4078:	01c12683          	lw	a3,28(sp)
    407c:	000a0513          	mv	a0,s4
    4080:	00098593          	mv	a1,s3
    4084:	4b4090ef          	jal	d538 <__muldf3>
    4088:	00058a13          	mv	s4,a1
    408c:	00050993          	mv	s3,a0
    4090:	5940a0ef          	jal	e624 <__fixdfsi>
    4094:	00050413          	mv	s0,a0
    4098:	6100a0ef          	jal	e6a8 <__floatsidf>
    409c:	00050613          	mv	a2,a0
    40a0:	00058693          	mv	a3,a1
    40a4:	00098513          	mv	a0,s3
    40a8:	000a0593          	mv	a1,s4
    40ac:	41d090ef          	jal	dcc8 <__subdf3>
    40b0:	00890733          	add	a4,s2,s0
    40b4:	00074703          	lbu	a4,0(a4)
    40b8:	00048813          	mv	a6,s1
    40bc:	00050a13          	mv	s4,a0
    40c0:	00e48023          	sb	a4,0(s1) # 80000000 <_impure_data>
    40c4:	00058993          	mv	s3,a1
    40c8:	00148493          	add	s1,s1,1
    40cc:	f99b18e3          	bne	s6,s9,405c <_vfprintf_r+0x22b4>
    40d0:	7fffc697          	auipc	a3,0x7fffc
    40d4:	5e868693          	add	a3,a3,1512 # 800006b8 <__global_locale+0x184>
    40d8:	0006a303          	lw	t1,0(a3)
    40dc:	0046a383          	lw	t2,4(a3)
    40e0:	05012e03          	lw	t3,80(sp)
    40e4:	00030613          	mv	a2,t1
    40e8:	00038693          	mv	a3,t2
    40ec:	01012c23          	sw	a6,24(sp)
    40f0:	02412903          	lw	s2,36(sp)
    40f4:	000c0993          	mv	s3,s8
    40f8:	03c12223          	sw	t3,36(sp)
    40fc:	000d0c13          	mv	s8,s10
    4100:	00058d13          	mv	s10,a1
    4104:	22c090ef          	jal	d330 <__gedf2>
    4108:	7fffc797          	auipc	a5,0x7fffc
    410c:	5b078793          	add	a5,a5,1456 # 800006b8 <__global_locale+0x184>
    4110:	00040b13          	mv	s6,s0
    4114:	0007a303          	lw	t1,0(a5)
    4118:	05412403          	lw	s0,84(sp)
    411c:	0047a383          	lw	t2,4(a5)
    4120:	01812803          	lw	a6,24(sp)
    4124:	02412e03          	lw	t3,36(sp)
    4128:	04012e83          	lw	t4,64(sp)
    412c:	0aa05ce3          	blez	a0,49e4 <_vfprintf_r+0x2c3c>
    4130:	02012783          	lw	a5,32(sp)
    4134:	09012c23          	sw	a6,152(sp)
    4138:	fff4c603          	lbu	a2,-1(s1)
    413c:	00f7c583          	lbu	a1,15(a5)
    4140:	00048693          	mv	a3,s1
    4144:	02b61063          	bne	a2,a1,4164 <_vfprintf_r+0x23bc>
    4148:	03000513          	li	a0,48
    414c:	fea68fa3          	sb	a0,-1(a3)
    4150:	09812683          	lw	a3,152(sp)
    4154:	fff68793          	add	a5,a3,-1
    4158:	08f12c23          	sw	a5,152(sp)
    415c:	fff6c603          	lbu	a2,-1(a3)
    4160:	feb606e3          	beq	a2,a1,414c <_vfprintf_r+0x23a4>
    4164:	00160593          	add	a1,a2,1
    4168:	03900513          	li	a0,57
    416c:	0ff5f593          	zext.b	a1,a1
    4170:	04a60463          	beq	a2,a0,41b8 <_vfprintf_r+0x2410>
    4174:	feb68fa3          	sb	a1,-1(a3)
    4178:	00048793          	mv	a5,s1
    417c:	07c12a03          	lw	s4,124(sp)
    4180:	418787b3          	sub	a5,a5,s8
    4184:	06100613          	li	a2,97
    4188:	fffa0d13          	add	s10,s4,-1
    418c:	00f12c23          	sw	a5,24(sp)
    4190:	07a12e23          	sw	s10,124(sp)
    4194:	07000693          	li	a3,112
    4198:	00ce0663          	beq	t3,a2,41a4 <_vfprintf_r+0x23fc>
    419c:	05000693          	li	a3,80
    41a0:	04100e13          	li	t3,65
    41a4:	00100613          	li	a2,1
    41a8:	aa5ff06f          	j	3c4c <_vfprintf_r+0x1ea4>
    41ac:	00030a13          	mv	s4,t1
    41b0:	00300693          	li	a3,3
    41b4:	cf5ff06f          	j	3ea8 <_vfprintf_r+0x2100>
    41b8:	02012783          	lw	a5,32(sp)
    41bc:	00a7c583          	lbu	a1,10(a5)
    41c0:	feb68fa3          	sb	a1,-1(a3)
    41c4:	fb5ff06f          	j	4178 <_vfprintf_r+0x23d0>
    41c8:	02d00713          	li	a4,45
    41cc:	06e10ba3          	sb	a4,119(sp)
    41d0:	02d00613          	li	a2,45
    41d4:	00000313          	li	t1,0
    41d8:	001c8c93          	add	s9,s9,1
    41dc:	e0dfd06f          	j	1fe8 <_vfprintf_r+0x240>
    41e0:	01812783          	lw	a5,24(sp)
    41e4:	46fa4063          	blt	s4,a5,4644 <_vfprintf_r+0x289c>
    41e8:	001ef713          	and	a4,t4,1
    41ec:	000a0d13          	mv	s10,s4
    41f0:	00070663          	beqz	a4,41fc <_vfprintf_r+0x2454>
    41f4:	03012783          	lw	a5,48(sp)
    41f8:	00fa0d33          	add	s10,s4,a5
    41fc:	400eff13          	and	t5,t4,1024
    4200:	000f0463          	beqz	t5,4208 <_vfprintf_r+0x2460>
    4204:	5f404e63          	bgtz	s4,4800 <_vfprintf_r+0x2a58>
    4208:	fffd4813          	not	a6,s10
    420c:	41f85813          	sra	a6,a6,0x1f
    4210:	010d7cb3          	and	s9,s10,a6
    4214:	06700e13          	li	t3,103
    4218:	000b0e93          	mv	t4,s6
    421c:	02012223          	sw	zero,36(sp)
    4220:	02012023          	sw	zero,32(sp)
    4224:	b3dff06f          	j	3d60 <_vfprintf_r+0x1fb8>
    4228:	02d00793          	li	a5,45
    422c:	06f10ba3          	sb	a5,119(sp)
    4230:	02d00613          	li	a2,45
    4234:	998fe06f          	j	23cc <_vfprintf_r+0x624>
    4238:	01812783          	lw	a5,24(sp)
    423c:	02012a03          	lw	s4,32(sp)
    4240:	05212823          	sw	s2,80(sp)
    4244:	00fc07b3          	add	a5,s8,a5
    4248:	05712c23          	sw	s7,88(sp)
    424c:	05912e23          	sw	s9,92(sp)
    4250:	00040713          	mv	a4,s0
    4254:	04f12223          	sw	a5,68(sp)
    4258:	02412403          	lw	s0,36(sp)
    425c:	05d12a23          	sw	t4,84(sp)
    4260:	03812223          	sw	s8,36(sp)
    4264:	03c12b83          	lw	s7,60(sp)
    4268:	04c12c83          	lw	s9,76(sp)
    426c:	00812903          	lw	s2,8(sp)
    4270:	00700693          	li	a3,7
    4274:	01000d13          	li	s10,16
    4278:	0000bb17          	auipc	s6,0xb
    427c:	20cb0b13          	add	s6,s6,524 # f484 <zeroes.0>
    4280:	00048613          	mv	a2,s1
    4284:	00030c13          	mv	s8,t1
    4288:	09405863          	blez	s4,4318 <_vfprintf_r+0x2570>
    428c:	16805e63          	blez	s0,4408 <_vfprintf_r+0x2660>
    4290:	fff40413          	add	s0,s0,-1
    4294:	04812783          	lw	a5,72(sp)
    4298:	01960633          	add	a2,a2,s9
    429c:	01972223          	sw	s9,4(a4)
    42a0:	00f72023          	sw	a5,0(a4)
    42a4:	0a412783          	lw	a5,164(sp)
    42a8:	0ac12423          	sw	a2,168(sp)
    42ac:	00870713          	add	a4,a4,8
    42b0:	00178793          	add	a5,a5,1
    42b4:	0af12223          	sw	a5,164(sp)
    42b8:	14f6ce63          	blt	a3,a5,4414 <_vfprintf_r+0x266c>
    42bc:	04412783          	lw	a5,68(sp)
    42c0:	000bc583          	lbu	a1,0(s7)
    42c4:	418784b3          	sub	s1,a5,s8
    42c8:	0095d463          	bge	a1,s1,42d0 <_vfprintf_r+0x2528>
    42cc:	00058493          	mv	s1,a1
    42d0:	02905663          	blez	s1,42fc <_vfprintf_r+0x2554>
    42d4:	0a412583          	lw	a1,164(sp)
    42d8:	00960633          	add	a2,a2,s1
    42dc:	01872023          	sw	s8,0(a4)
    42e0:	00158593          	add	a1,a1,1
    42e4:	00972223          	sw	s1,4(a4)
    42e8:	0ac12423          	sw	a2,168(sp)
    42ec:	0ab12223          	sw	a1,164(sp)
    42f0:	14b6c663          	blt	a3,a1,443c <_vfprintf_r+0x2694>
    42f4:	000bc583          	lbu	a1,0(s7)
    42f8:	00870713          	add	a4,a4,8
    42fc:	fff4c513          	not	a0,s1
    4300:	41f55513          	sra	a0,a0,0x1f
    4304:	00a4f7b3          	and	a5,s1,a0
    4308:	40f584b3          	sub	s1,a1,a5
    430c:	04904663          	bgtz	s1,4358 <_vfprintf_r+0x25b0>
    4310:	00bc0c33          	add	s8,s8,a1
    4314:	f7404ce3          	bgtz	s4,428c <_vfprintf_r+0x24e4>
    4318:	f6804ce3          	bgtz	s0,4290 <_vfprintf_r+0x24e8>
    431c:	01812783          	lw	a5,24(sp)
    4320:	000c0313          	mv	t1,s8
    4324:	02412c03          	lw	s8,36(sp)
    4328:	03712e23          	sw	s7,60(sp)
    432c:	00070413          	mv	s0,a4
    4330:	00fc0733          	add	a4,s8,a5
    4334:	05012903          	lw	s2,80(sp)
    4338:	05412e83          	lw	t4,84(sp)
    433c:	05812b83          	lw	s7,88(sp)
    4340:	05c12c83          	lw	s9,92(sp)
    4344:	00060493          	mv	s1,a2
    4348:	00676463          	bltu	a4,t1,4350 <_vfprintf_r+0x25a8>
    434c:	c59fe06f          	j	2fa4 <_vfprintf_r+0x11fc>
    4350:	00070313          	mv	t1,a4
    4354:	c51fe06f          	j	2fa4 <_vfprintf_r+0x11fc>
    4358:	0a412583          	lw	a1,164(sp)
    435c:	0000be97          	auipc	t4,0xb
    4360:	128e8e93          	add	t4,t4,296 # f484 <zeroes.0>
    4364:	069d5c63          	bge	s10,s1,43dc <_vfprintf_r+0x2634>
    4368:	02812023          	sw	s0,32(sp)
    436c:	00048413          	mv	s0,s1
    4370:	000b0493          	mv	s1,s6
    4374:	00c0006f          	j	4380 <_vfprintf_r+0x25d8>
    4378:	ff040413          	add	s0,s0,-16
    437c:	048d5a63          	bge	s10,s0,43d0 <_vfprintf_r+0x2628>
    4380:	01060613          	add	a2,a2,16
    4384:	00158593          	add	a1,a1,1
    4388:	01672023          	sw	s6,0(a4)
    438c:	01a72223          	sw	s10,4(a4)
    4390:	0ac12423          	sw	a2,168(sp)
    4394:	0ab12223          	sw	a1,164(sp)
    4398:	00870713          	add	a4,a4,8
    439c:	fcb6dee3          	bge	a3,a1,4378 <_vfprintf_r+0x25d0>
    43a0:	0a010613          	add	a2,sp,160
    43a4:	00090593          	mv	a1,s2
    43a8:	00098513          	mv	a0,s3
    43ac:	0b9000ef          	jal	4c64 <__sprint_r>
    43b0:	00050463          	beqz	a0,43b8 <_vfprintf_r+0x2610>
    43b4:	ec5fd06f          	j	2278 <_vfprintf_r+0x4d0>
    43b8:	ff040413          	add	s0,s0,-16
    43bc:	0a812603          	lw	a2,168(sp)
    43c0:	0a412583          	lw	a1,164(sp)
    43c4:	0ac10713          	add	a4,sp,172
    43c8:	00700693          	li	a3,7
    43cc:	fa8d4ae3          	blt	s10,s0,4380 <_vfprintf_r+0x25d8>
    43d0:	00048e93          	mv	t4,s1
    43d4:	00040493          	mv	s1,s0
    43d8:	02012403          	lw	s0,32(sp)
    43dc:	00960633          	add	a2,a2,s1
    43e0:	00158593          	add	a1,a1,1
    43e4:	01d72023          	sw	t4,0(a4)
    43e8:	00972223          	sw	s1,4(a4)
    43ec:	0ac12423          	sw	a2,168(sp)
    43f0:	0ab12223          	sw	a1,164(sp)
    43f4:	10b6ce63          	blt	a3,a1,4510 <_vfprintf_r+0x2768>
    43f8:	000bc583          	lbu	a1,0(s7)
    43fc:	00870713          	add	a4,a4,8
    4400:	00bc0c33          	add	s8,s8,a1
    4404:	f11ff06f          	j	4314 <_vfprintf_r+0x256c>
    4408:	fffb8b93          	add	s7,s7,-1
    440c:	fffa0a13          	add	s4,s4,-1
    4410:	e85ff06f          	j	4294 <_vfprintf_r+0x24ec>
    4414:	0a010613          	add	a2,sp,160
    4418:	00090593          	mv	a1,s2
    441c:	00098513          	mv	a0,s3
    4420:	045000ef          	jal	4c64 <__sprint_r>
    4424:	00050463          	beqz	a0,442c <_vfprintf_r+0x2684>
    4428:	e51fd06f          	j	2278 <_vfprintf_r+0x4d0>
    442c:	0a812603          	lw	a2,168(sp)
    4430:	0ac10713          	add	a4,sp,172
    4434:	00700693          	li	a3,7
    4438:	e85ff06f          	j	42bc <_vfprintf_r+0x2514>
    443c:	0a010613          	add	a2,sp,160
    4440:	00090593          	mv	a1,s2
    4444:	00098513          	mv	a0,s3
    4448:	01d000ef          	jal	4c64 <__sprint_r>
    444c:	00050463          	beqz	a0,4454 <_vfprintf_r+0x26ac>
    4450:	e29fd06f          	j	2278 <_vfprintf_r+0x4d0>
    4454:	000bc583          	lbu	a1,0(s7)
    4458:	0a812603          	lw	a2,168(sp)
    445c:	0ac10713          	add	a4,sp,172
    4460:	00700693          	li	a3,7
    4464:	e99ff06f          	j	42fc <_vfprintf_r+0x2554>
    4468:	04c12783          	lw	a5,76(sp)
    446c:	04812583          	lw	a1,72(sp)
    4470:	00000913          	li	s2,0
    4474:	40fc0c33          	sub	s8,s8,a5
    4478:	00078613          	mv	a2,a5
    447c:	000c0513          	mv	a0,s8
    4480:	468030ef          	jal	78e8 <strncpy>
    4484:	00144783          	lbu	a5,1(s0)
    4488:	00a00613          	li	a2,10
    448c:	00000693          	li	a3,0
    4490:	00f037b3          	snez	a5,a5
    4494:	000d0513          	mv	a0,s10
    4498:	000c8593          	mv	a1,s9
    449c:	00f40433          	add	s0,s0,a5
    44a0:	78d060ef          	jal	b42c <__udivdi3>
    44a4:	a10ff06f          	j	36b4 <_vfprintf_r+0x190c>
    44a8:	09810713          	add	a4,sp,152
    44ac:	00000693          	li	a3,0
    44b0:	08410613          	add	a2,sp,132
    44b4:	00000593          	li	a1,0
    44b8:	00098513          	mv	a0,s3
    44bc:	01c12a23          	sw	t3,20(sp)
    44c0:	01d12823          	sw	t4,16(sp)
    44c4:	618060ef          	jal	aadc <_wcsrtombs_r>
    44c8:	fff00713          	li	a4,-1
    44cc:	01012e83          	lw	t4,16(sp)
    44d0:	01412e03          	lw	t3,20(sp)
    44d4:	00050d13          	mv	s10,a0
    44d8:	30e50063          	beq	a0,a4,47d8 <_vfprintf_r+0x2a30>
    44dc:	09812223          	sw	s8,132(sp)
    44e0:	cacff06f          	j	398c <_vfprintf_r+0x1be4>
    44e4:	07714603          	lbu	a2,119(sp)
    44e8:	01612a23          	sw	s6,20(sp)
    44ec:	02012223          	sw	zero,36(sp)
    44f0:	02012023          	sw	zero,32(sp)
    44f4:	00012823          	sw	zero,16(sp)
    44f8:	00000c93          	li	s9,0
    44fc:	00000313          	li	t1,0
    4500:	00000a13          	li	s4,0
    4504:	00061463          	bnez	a2,450c <_vfprintf_r+0x2764>
    4508:	ae1fd06f          	j	1fe8 <_vfprintf_r+0x240>
    450c:	efdfd06f          	j	2408 <_vfprintf_r+0x660>
    4510:	0a010613          	add	a2,sp,160
    4514:	00090593          	mv	a1,s2
    4518:	00098513          	mv	a0,s3
    451c:	748000ef          	jal	4c64 <__sprint_r>
    4520:	00050463          	beqz	a0,4528 <_vfprintf_r+0x2780>
    4524:	d55fd06f          	j	2278 <_vfprintf_r+0x4d0>
    4528:	000bc583          	lbu	a1,0(s7)
    452c:	0a812603          	lw	a2,168(sp)
    4530:	0ac10713          	add	a4,sp,172
    4534:	00700693          	li	a3,7
    4538:	00bc0c33          	add	s8,s8,a1
    453c:	dd9ff06f          	j	4314 <_vfprintf_r+0x256c>
    4540:	00812583          	lw	a1,8(sp)
    4544:	0a010613          	add	a2,sp,160
    4548:	00098513          	mv	a0,s3
    454c:	05d12223          	sw	t4,68(sp)
    4550:	714000ef          	jal	4c64 <__sprint_r>
    4554:	00050463          	beqz	a0,455c <_vfprintf_r+0x27b4>
    4558:	d21fd06f          	j	2278 <_vfprintf_r+0x4d0>
    455c:	0a812483          	lw	s1,168(sp)
    4560:	04412e83          	lw	t4,68(sp)
    4564:	0ac10413          	add	s0,sp,172
    4568:	a19fe06f          	j	2f80 <_vfprintf_r+0x11d8>
    456c:	00900793          	li	a5,9
    4570:	95a7e263          	bltu	a5,s10,36b4 <_vfprintf_r+0x190c>
    4574:	98cff06f          	j	3700 <_vfprintf_r+0x1958>
    4578:	07c12a03          	lw	s4,124(sp)
    457c:	00070793          	mv	a5,a4
    4580:	9f1ff06f          	j	3f70 <_vfprintf_r+0x21c8>
    4584:	00812583          	lw	a1,8(sp)
    4588:	0a010613          	add	a2,sp,160
    458c:	00098513          	mv	a0,s3
    4590:	03d12023          	sw	t4,32(sp)
    4594:	6d0000ef          	jal	4c64 <__sprint_r>
    4598:	00050463          	beqz	a0,45a0 <_vfprintf_r+0x27f8>
    459c:	cddfd06f          	j	2278 <_vfprintf_r+0x4d0>
    45a0:	07c12d03          	lw	s10,124(sp)
    45a4:	01812783          	lw	a5,24(sp)
    45a8:	0a812483          	lw	s1,168(sp)
    45ac:	02012e83          	lw	t4,32(sp)
    45b0:	0ac10413          	add	s0,sp,172
    45b4:	41a78d33          	sub	s10,a5,s10
    45b8:	a49fe06f          	j	3000 <_vfprintf_r+0x1258>
    45bc:	00650733          	add	a4,a0,t1
    45c0:	04700d13          	li	s10,71
    45c4:	94dff06f          	j	3f10 <_vfprintf_r+0x2168>
    45c8:	02812603          	lw	a2,40(sp)
    45cc:	00048593          	mv	a1,s1
    45d0:	00000693          	li	a3,0
    45d4:	00060513          	mv	a0,a2
    45d8:	00000613          	li	a2,0
    45dc:	04e12823          	sw	a4,80(sp)
    45e0:	02612223          	sw	t1,36(sp)
    45e4:	03c12023          	sw	t3,32(sp)
    45e8:	01d12c23          	sw	t4,24(sp)
    45ec:	4b9080ef          	jal	d2a4 <__eqdf2>
    45f0:	01812e83          	lw	t4,24(sp)
    45f4:	02012e03          	lw	t3,32(sp)
    45f8:	02412303          	lw	t1,36(sp)
    45fc:	05012703          	lw	a4,80(sp)
    4600:	34051e63          	bnez	a0,495c <_vfprintf_r+0x2bb4>
    4604:	07c12a03          	lw	s4,124(sp)
    4608:	01470733          	add	a4,a4,s4
    460c:	418707b3          	sub	a5,a4,s8
    4610:	00f12c23          	sw	a5,24(sp)
    4614:	001ef713          	and	a4,t4,1
    4618:	00676733          	or	a4,a4,t1
    461c:	37405a63          	blez	s4,4990 <_vfprintf_r+0x2be8>
    4620:	26071263          	bnez	a4,4884 <_vfprintf_r+0x2adc>
    4624:	000a0d13          	mv	s10,s4
    4628:	06600e13          	li	t3,102
    462c:	400eff13          	and	t5,t4,1024
    4630:	1c0f1a63          	bnez	t5,4804 <_vfprintf_r+0x2a5c>
    4634:	fffd4813          	not	a6,s10
    4638:	41f85813          	sra	a6,a6,0x1f
    463c:	010d7cb3          	and	s9,s10,a6
    4640:	bd9ff06f          	j	4218 <_vfprintf_r+0x2470>
    4644:	01812783          	lw	a5,24(sp)
    4648:	03012703          	lw	a4,48(sp)
    464c:	06700e13          	li	t3,103
    4650:	00e78d33          	add	s10,a5,a4
    4654:	fd404ce3          	bgtz	s4,462c <_vfprintf_r+0x2884>
    4658:	414d06b3          	sub	a3,s10,s4
    465c:	00168d13          	add	s10,a3,1
    4660:	fffd4813          	not	a6,s10
    4664:	41f85813          	sra	a6,a6,0x1f
    4668:	010d7cb3          	and	s9,s10,a6
    466c:	badff06f          	j	4218 <_vfprintf_r+0x2470>
    4670:	000e8613          	mv	a2,t4
    4674:	ad8fe06f          	j	294c <_vfprintf_r+0xba4>
    4678:	00812783          	lw	a5,8(sp)
    467c:	0647a783          	lw	a5,100(a5)
    4680:	0017f793          	and	a5,a5,1
    4684:	02079063          	bnez	a5,46a4 <_vfprintf_r+0x28fc>
    4688:	00812783          	lw	a5,8(sp)
    468c:	00c7d783          	lhu	a5,12(a5)
    4690:	2007f793          	and	a5,a5,512
    4694:	00079863          	bnez	a5,46a4 <_vfprintf_r+0x28fc>
    4698:	00812783          	lw	a5,8(sp)
    469c:	0587a503          	lw	a0,88(a5)
    46a0:	fb0fc0ef          	jal	e50 <__retarget_lock_release_recursive>
    46a4:	fff00793          	li	a5,-1
    46a8:	00f12623          	sw	a5,12(sp)
    46ac:	c2dfd06f          	j	22d8 <_vfprintf_r+0x530>
    46b0:	ff000613          	li	a2,-16
    46b4:	40d00d33          	neg	s10,a3
    46b8:	0000b297          	auipc	t0,0xb
    46bc:	dcc28293          	add	t0,t0,-564 # f484 <zeroes.0>
    46c0:	08c6d463          	bge	a3,a2,4748 <_vfprintf_r+0x29a0>
    46c4:	03212023          	sw	s2,32(sp)
    46c8:	01000693          	li	a3,16
    46cc:	00700b13          	li	s6,7
    46d0:	000e8a13          	mv	s4,t4
    46d4:	00028913          	mv	s2,t0
    46d8:	00c0006f          	j	46e4 <_vfprintf_r+0x293c>
    46dc:	ff0d0d13          	add	s10,s10,-16
    46e0:	05a6de63          	bge	a3,s10,473c <_vfprintf_r+0x2994>
    46e4:	01048493          	add	s1,s1,16
    46e8:	00170713          	add	a4,a4,1
    46ec:	01242023          	sw	s2,0(s0)
    46f0:	00d42223          	sw	a3,4(s0)
    46f4:	0a912423          	sw	s1,168(sp)
    46f8:	0ae12223          	sw	a4,164(sp)
    46fc:	00840413          	add	s0,s0,8
    4700:	fceb5ee3          	bge	s6,a4,46dc <_vfprintf_r+0x2934>
    4704:	00812583          	lw	a1,8(sp)
    4708:	0a010613          	add	a2,sp,160
    470c:	00098513          	mv	a0,s3
    4710:	554000ef          	jal	4c64 <__sprint_r>
    4714:	00050463          	beqz	a0,471c <_vfprintf_r+0x2974>
    4718:	b61fd06f          	j	2278 <_vfprintf_r+0x4d0>
    471c:	0a812483          	lw	s1,168(sp)
    4720:	0a412703          	lw	a4,164(sp)
    4724:	0ac10413          	add	s0,sp,172
    4728:	01000693          	li	a3,16
    472c:	fb1ff06f          	j	46dc <_vfprintf_r+0x2934>
    4730:	00012823          	sw	zero,16(sp)
    4734:	0ec10c13          	add	s8,sp,236
    4738:	a88ff06f          	j	39c0 <_vfprintf_r+0x1c18>
    473c:	00090293          	mv	t0,s2
    4740:	02012903          	lw	s2,32(sp)
    4744:	000a0e93          	mv	t4,s4
    4748:	01a484b3          	add	s1,s1,s10
    474c:	00170713          	add	a4,a4,1
    4750:	00542023          	sw	t0,0(s0)
    4754:	01a42223          	sw	s10,4(s0)
    4758:	0a912423          	sw	s1,168(sp)
    475c:	0ae12223          	sw	a4,164(sp)
    4760:	00700693          	li	a3,7
    4764:	00e6c463          	blt	a3,a4,476c <_vfprintf_r+0x29c4>
    4768:	b65fe06f          	j	32cc <_vfprintf_r+0x1524>
    476c:	00812583          	lw	a1,8(sp)
    4770:	0a010613          	add	a2,sp,160
    4774:	00098513          	mv	a0,s3
    4778:	03d12023          	sw	t4,32(sp)
    477c:	4e8000ef          	jal	4c64 <__sprint_r>
    4780:	00050463          	beqz	a0,4788 <_vfprintf_r+0x29e0>
    4784:	af5fd06f          	j	2278 <_vfprintf_r+0x4d0>
    4788:	0a812483          	lw	s1,168(sp)
    478c:	0a412703          	lw	a4,164(sp)
    4790:	02012e83          	lw	t4,32(sp)
    4794:	0ac10413          	add	s0,sp,172
    4798:	b20ff06f          	j	3ab8 <_vfprintf_r+0x1d10>
    479c:	08a10693          	add	a3,sp,138
    47a0:	00061863          	bnez	a2,47b0 <_vfprintf_r+0x2a08>
    47a4:	03000693          	li	a3,48
    47a8:	08d10523          	sb	a3,138(sp)
    47ac:	08b10693          	add	a3,sp,139
    47b0:	15010793          	add	a5,sp,336
    47b4:	40f68633          	sub	a2,a3,a5
    47b8:	030d0713          	add	a4,s10,48
    47bc:	0c960793          	add	a5,a2,201
    47c0:	00e68023          	sb	a4,0(a3)
    47c4:	04f12023          	sw	a5,64(sp)
    47c8:	d5cff06f          	j	3d24 <_vfprintf_r+0x1f7c>
    47cc:	001ef713          	and	a4,t4,1
    47d0:	d6070863          	beqz	a4,3d40 <_vfprintf_r+0x1f98>
    47d4:	d64ff06f          	j	3d38 <_vfprintf_r+0x1f90>
    47d8:	00812783          	lw	a5,8(sp)
    47dc:	00000293          	li	t0,0
    47e0:	00c79783          	lh	a5,12(a5)
    47e4:	0407e793          	or	a5,a5,64
    47e8:	00812703          	lw	a4,8(sp)
    47ec:	00f71623          	sh	a5,12(a4)
    47f0:	a8dfd06f          	j	227c <_vfprintf_r+0x4d4>
    47f4:	00012823          	sw	zero,16(sp)
    47f8:	00600313          	li	t1,6
    47fc:	ff9fe06f          	j	37f4 <_vfprintf_r+0x1a4c>
    4800:	06700e13          	li	t3,103
    4804:	03c12783          	lw	a5,60(sp)
    4808:	0ff00613          	li	a2,255
    480c:	0007c703          	lbu	a4,0(a5)
    4810:	22c70263          	beq	a4,a2,4a34 <_vfprintf_r+0x2c8c>
    4814:	00000593          	li	a1,0
    4818:	00000693          	li	a3,0
    481c:	01475e63          	bge	a4,s4,4838 <_vfprintf_r+0x2a90>
    4820:	40ea0a33          	sub	s4,s4,a4
    4824:	0017c703          	lbu	a4,1(a5)
    4828:	04070863          	beqz	a4,4878 <_vfprintf_r+0x2ad0>
    482c:	00168693          	add	a3,a3,1
    4830:	00178793          	add	a5,a5,1
    4834:	fec714e3          	bne	a4,a2,481c <_vfprintf_r+0x2a74>
    4838:	02f12e23          	sw	a5,60(sp)
    483c:	02d12023          	sw	a3,32(sp)
    4840:	02b12223          	sw	a1,36(sp)
    4844:	02012783          	lw	a5,32(sp)
    4848:	02412703          	lw	a4,36(sp)
    484c:	04c12583          	lw	a1,76(sp)
    4850:	05c12823          	sw	t3,80(sp)
    4854:	00e78533          	add	a0,a5,a4
    4858:	3a80a0ef          	jal	ec00 <__mulsi3>
    485c:	01a50d33          	add	s10,a0,s10
    4860:	fffd4813          	not	a6,s10
    4864:	41f85813          	sra	a6,a6,0x1f
    4868:	05012e03          	lw	t3,80(sp)
    486c:	010d7cb3          	and	s9,s10,a6
    4870:	000b0e93          	mv	t4,s6
    4874:	cecff06f          	j	3d60 <_vfprintf_r+0x1fb8>
    4878:	0007c703          	lbu	a4,0(a5)
    487c:	00158593          	add	a1,a1,1
    4880:	fb5ff06f          	j	4834 <_vfprintf_r+0x2a8c>
    4884:	03012783          	lw	a5,48(sp)
    4888:	06600e13          	li	t3,102
    488c:	00f306b3          	add	a3,t1,a5
    4890:	01468d33          	add	s10,a3,s4
    4894:	d99ff06f          	j	462c <_vfprintf_r+0x2884>
    4898:	02c12783          	lw	a5,44(sp)
    489c:	0a07c863          	bltz	a5,494c <_vfprintf_r+0x2ba4>
    48a0:	07714603          	lbu	a2,119(sp)
    48a4:	04700713          	li	a4,71
    48a8:	0000ac17          	auipc	s8,0xa
    48ac:	6f0c0c13          	add	s8,s8,1776 # ef98 <__fini_array_end+0x1a0>
    48b0:	01c75463          	bge	a4,t3,48b8 <_vfprintf_r+0x2b10>
    48b4:	b31fd06f          	j	23e4 <_vfprintf_r+0x63c>
    48b8:	0000ac17          	auipc	s8,0xa
    48bc:	6dcc0c13          	add	s8,s8,1756 # ef94 <__fini_array_end+0x19c>
    48c0:	b25fd06f          	j	23e4 <_vfprintf_r+0x63c>
    48c4:	07714603          	lbu	a2,119(sp)
    48c8:	01612a23          	sw	s6,20(sp)
    48cc:	02012223          	sw	zero,36(sp)
    48d0:	02012023          	sw	zero,32(sp)
    48d4:	00030c93          	mv	s9,t1
    48d8:	00030d13          	mv	s10,t1
    48dc:	07300e13          	li	t3,115
    48e0:	00000313          	li	t1,0
    48e4:	00061463          	bnez	a2,48ec <_vfprintf_r+0x2b44>
    48e8:	f00fd06f          	j	1fe8 <_vfprintf_r+0x240>
    48ec:	b1dfd06f          	j	2408 <_vfprintf_r+0x660>
    48f0:	00040313          	mv	t1,s0
    48f4:	01012903          	lw	s2,16(sp)
    48f8:	000b0413          	mv	s0,s6
    48fc:	01412e03          	lw	t3,20(sp)
    4900:	000c0b13          	mv	s6,s8
    4904:	000a0e93          	mv	t4,s4
    4908:	000c8c13          	mv	s8,s9
    490c:	00030d13          	mv	s10,t1
    4910:	87cff06f          	j	398c <_vfprintf_r+0x1be4>
    4914:	001b0793          	add	a5,s6,1
    4918:	000c0993          	mv	s3,s8
    491c:	02412903          	lw	s2,36(sp)
    4920:	04012e83          	lw	t4,64(sp)
    4924:	05012e03          	lw	t3,80(sp)
    4928:	05412403          	lw	s0,84(sp)
    492c:	000d0c13          	mv	s8,s10
    4930:	00f487b3          	add	a5,s1,a5
    4934:	03000693          	li	a3,48
    4938:	840b40e3          	bltz	s6,4178 <_vfprintf_r+0x23d0>
    493c:	00148493          	add	s1,s1,1
    4940:	fed48fa3          	sb	a3,-1(s1)
    4944:	fe979ce3          	bne	a5,s1,493c <_vfprintf_r+0x2b94>
    4948:	835ff06f          	j	417c <_vfprintf_r+0x23d4>
    494c:	02d00793          	li	a5,45
    4950:	06f10ba3          	sb	a5,119(sp)
    4954:	02d00613          	li	a2,45
    4958:	f4dff06f          	j	48a4 <_vfprintf_r+0x2afc>
    495c:	00100693          	li	a3,1
    4960:	414686b3          	sub	a3,a3,s4
    4964:	06d12e23          	sw	a3,124(sp)
    4968:	da4ff06f          	j	3f0c <_vfprintf_r+0x2164>
    496c:	01412783          	lw	a5,20(sp)
    4970:	0007ab03          	lw	s6,0(a5)
    4974:	00478793          	add	a5,a5,4
    4978:	000b5463          	bgez	s6,4980 <_vfprintf_r+0x2bd8>
    497c:	fff00b13          	li	s6,-1
    4980:	00194e03          	lbu	t3,1(s2)
    4984:	00f12a23          	sw	a5,20(sp)
    4988:	00068913          	mv	s2,a3
    498c:	dccfd06f          	j	1f58 <_vfprintf_r+0x1b0>
    4990:	00071a63          	bnez	a4,49a4 <_vfprintf_r+0x2bfc>
    4994:	00100c93          	li	s9,1
    4998:	06600e13          	li	t3,102
    499c:	00100d13          	li	s10,1
    49a0:	879ff06f          	j	4218 <_vfprintf_r+0x2470>
    49a4:	03012783          	lw	a5,48(sp)
    49a8:	06600e13          	li	t3,102
    49ac:	00178693          	add	a3,a5,1
    49b0:	00668d33          	add	s10,a3,t1
    49b4:	fffd4813          	not	a6,s10
    49b8:	41f85813          	sra	a6,a6,0x1f
    49bc:	010d7cb3          	and	s9,s10,a6
    49c0:	859ff06f          	j	4218 <_vfprintf_r+0x2470>
    49c4:	00200793          	li	a5,2
    49c8:	04f12023          	sw	a5,64(sp)
    49cc:	b58ff06f          	j	3d24 <_vfprintf_r+0x1f7c>
    49d0:	00812703          	lw	a4,8(sp)
    49d4:	00c71783          	lh	a5,12(a4)
    49d8:	0407e793          	or	a5,a5,64
    49dc:	00f71623          	sh	a5,12(a4)
    49e0:	8b5fd06f          	j	2294 <_vfprintf_r+0x4ec>
    49e4:	000a0513          	mv	a0,s4
    49e8:	000d0593          	mv	a1,s10
    49ec:	00030613          	mv	a2,t1
    49f0:	00038693          	mv	a3,t2
    49f4:	05012023          	sw	a6,64(sp)
    49f8:	03c12223          	sw	t3,36(sp)
    49fc:	01d12c23          	sw	t4,24(sp)
    4a00:	0a5080ef          	jal	d2a4 <__eqdf2>
    4a04:	01812e83          	lw	t4,24(sp)
    4a08:	02412e03          	lw	t3,36(sp)
    4a0c:	04012803          	lw	a6,64(sp)
    4a10:	f6051463          	bnez	a0,4178 <_vfprintf_r+0x23d0>
    4a14:	001b7693          	and	a3,s6,1
    4a18:	f6068063          	beqz	a3,4178 <_vfprintf_r+0x23d0>
    4a1c:	f14ff06f          	j	4130 <_vfprintf_r+0x2388>
    4a20:	00812783          	lw	a5,8(sp)
    4a24:	01012283          	lw	t0,16(sp)
    4a28:	00c79783          	lh	a5,12(a5)
    4a2c:	0407e793          	or	a5,a5,64
    4a30:	db9ff06f          	j	47e8 <_vfprintf_r+0x2a40>
    4a34:	02012223          	sw	zero,36(sp)
    4a38:	02012023          	sw	zero,32(sp)
    4a3c:	e09ff06f          	j	4844 <_vfprintf_r+0x2a9c>
    4a40:	04500d13          	li	s10,69
    4a44:	cccff06f          	j	3f10 <_vfprintf_r+0x2168>

00004a48 <__sbprintf>:
    4a48:	b7010113          	add	sp,sp,-1168
    4a4c:	00c59783          	lh	a5,12(a1)
    4a50:	00e5d703          	lhu	a4,14(a1)
    4a54:	48812423          	sw	s0,1160(sp)
    4a58:	00058413          	mv	s0,a1
    4a5c:	000105b7          	lui	a1,0x10
    4a60:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x78d>
    4a64:	06442303          	lw	t1,100(s0)
    4a68:	01c42883          	lw	a7,28(s0)
    4a6c:	02442803          	lw	a6,36(s0)
    4a70:	01071713          	sll	a4,a4,0x10
    4a74:	00b7f7b3          	and	a5,a5,a1
    4a78:	00e7e7b3          	or	a5,a5,a4
    4a7c:	40000593          	li	a1,1024
    4a80:	49212023          	sw	s2,1152(sp)
    4a84:	00f12a23          	sw	a5,20(sp)
    4a88:	00050913          	mv	s2,a0
    4a8c:	07010793          	add	a5,sp,112
    4a90:	06010513          	add	a0,sp,96
    4a94:	48112623          	sw	ra,1164(sp)
    4a98:	48912223          	sw	s1,1156(sp)
    4a9c:	47312e23          	sw	s3,1148(sp)
    4aa0:	00060493          	mv	s1,a2
    4aa4:	00068993          	mv	s3,a3
    4aa8:	06612623          	sw	t1,108(sp)
    4aac:	03112223          	sw	a7,36(sp)
    4ab0:	03012623          	sw	a6,44(sp)
    4ab4:	00f12423          	sw	a5,8(sp)
    4ab8:	00f12c23          	sw	a5,24(sp)
    4abc:	00b12823          	sw	a1,16(sp)
    4ac0:	00b12e23          	sw	a1,28(sp)
    4ac4:	02012023          	sw	zero,32(sp)
    4ac8:	b7cfc0ef          	jal	e44 <__retarget_lock_init_recursive>
    4acc:	00048613          	mv	a2,s1
    4ad0:	00098693          	mv	a3,s3
    4ad4:	00810593          	add	a1,sp,8
    4ad8:	00090513          	mv	a0,s2
    4adc:	accfd0ef          	jal	1da8 <_vfprintf_r>
    4ae0:	00050493          	mv	s1,a0
    4ae4:	04055263          	bgez	a0,4b28 <__sbprintf+0xe0>
    4ae8:	01415783          	lhu	a5,20(sp)
    4aec:	0407f793          	and	a5,a5,64
    4af0:	00078863          	beqz	a5,4b00 <__sbprintf+0xb8>
    4af4:	00c45783          	lhu	a5,12(s0)
    4af8:	0407e793          	or	a5,a5,64
    4afc:	00f41623          	sh	a5,12(s0)
    4b00:	06012503          	lw	a0,96(sp)
    4b04:	b44fc0ef          	jal	e48 <__retarget_lock_close_recursive>
    4b08:	48c12083          	lw	ra,1164(sp)
    4b0c:	48812403          	lw	s0,1160(sp)
    4b10:	48012903          	lw	s2,1152(sp)
    4b14:	47c12983          	lw	s3,1148(sp)
    4b18:	00048513          	mv	a0,s1
    4b1c:	48412483          	lw	s1,1156(sp)
    4b20:	49010113          	add	sp,sp,1168
    4b24:	00008067          	ret
    4b28:	00810593          	add	a1,sp,8
    4b2c:	00090513          	mv	a0,s2
    4b30:	449010ef          	jal	6778 <_fflush_r>
    4b34:	fa050ae3          	beqz	a0,4ae8 <__sbprintf+0xa0>
    4b38:	fff00493          	li	s1,-1
    4b3c:	fadff06f          	j	4ae8 <__sbprintf+0xa0>

00004b40 <__sprint_r.part.0>:
    4b40:	0645a783          	lw	a5,100(a1)
    4b44:	fd010113          	add	sp,sp,-48
    4b48:	01612823          	sw	s6,16(sp)
    4b4c:	02112623          	sw	ra,44(sp)
    4b50:	01279713          	sll	a4,a5,0x12
    4b54:	00060b13          	mv	s6,a2
    4b58:	0e075863          	bgez	a4,4c48 <__sprint_r.part.0+0x108>
    4b5c:	00862783          	lw	a5,8(a2)
    4b60:	03212023          	sw	s2,32(sp)
    4b64:	01312e23          	sw	s3,28(sp)
    4b68:	01512a23          	sw	s5,20(sp)
    4b6c:	01712623          	sw	s7,12(sp)
    4b70:	00058913          	mv	s2,a1
    4b74:	00062b83          	lw	s7,0(a2)
    4b78:	00050993          	mv	s3,a0
    4b7c:	fff00a93          	li	s5,-1
    4b80:	0a078863          	beqz	a5,4c30 <__sprint_r.part.0+0xf0>
    4b84:	02812423          	sw	s0,40(sp)
    4b88:	02912223          	sw	s1,36(sp)
    4b8c:	01412c23          	sw	s4,24(sp)
    4b90:	01812423          	sw	s8,8(sp)
    4b94:	004bac03          	lw	s8,4(s7)
    4b98:	000ba403          	lw	s0,0(s7)
    4b9c:	002c5a13          	srl	s4,s8,0x2
    4ba0:	060a0663          	beqz	s4,4c0c <__sprint_r.part.0+0xcc>
    4ba4:	00000493          	li	s1,0
    4ba8:	00c0006f          	j	4bb4 <__sprint_r.part.0+0x74>
    4bac:	00440413          	add	s0,s0,4
    4bb0:	049a0c63          	beq	s4,s1,4c08 <__sprint_r.part.0+0xc8>
    4bb4:	00042583          	lw	a1,0(s0)
    4bb8:	00090613          	mv	a2,s2
    4bbc:	00098513          	mv	a0,s3
    4bc0:	399020ef          	jal	7758 <_fputwc_r>
    4bc4:	00148493          	add	s1,s1,1
    4bc8:	ff5512e3          	bne	a0,s5,4bac <__sprint_r.part.0+0x6c>
    4bcc:	02812403          	lw	s0,40(sp)
    4bd0:	02412483          	lw	s1,36(sp)
    4bd4:	02012903          	lw	s2,32(sp)
    4bd8:	01c12983          	lw	s3,28(sp)
    4bdc:	01812a03          	lw	s4,24(sp)
    4be0:	01412a83          	lw	s5,20(sp)
    4be4:	00c12b83          	lw	s7,12(sp)
    4be8:	00812c03          	lw	s8,8(sp)
    4bec:	fff00513          	li	a0,-1
    4bf0:	02c12083          	lw	ra,44(sp)
    4bf4:	000b2423          	sw	zero,8(s6)
    4bf8:	000b2223          	sw	zero,4(s6)
    4bfc:	01012b03          	lw	s6,16(sp)
    4c00:	03010113          	add	sp,sp,48
    4c04:	00008067          	ret
    4c08:	008b2783          	lw	a5,8(s6)
    4c0c:	ffcc7c13          	and	s8,s8,-4
    4c10:	418787b3          	sub	a5,a5,s8
    4c14:	00fb2423          	sw	a5,8(s6)
    4c18:	008b8b93          	add	s7,s7,8
    4c1c:	f6079ce3          	bnez	a5,4b94 <__sprint_r.part.0+0x54>
    4c20:	02812403          	lw	s0,40(sp)
    4c24:	02412483          	lw	s1,36(sp)
    4c28:	01812a03          	lw	s4,24(sp)
    4c2c:	00812c03          	lw	s8,8(sp)
    4c30:	02012903          	lw	s2,32(sp)
    4c34:	01c12983          	lw	s3,28(sp)
    4c38:	01412a83          	lw	s5,20(sp)
    4c3c:	00c12b83          	lw	s7,12(sp)
    4c40:	00000513          	li	a0,0
    4c44:	fadff06f          	j	4bf0 <__sprint_r.part.0+0xb0>
    4c48:	6b5010ef          	jal	6afc <__sfvwrite_r>
    4c4c:	02c12083          	lw	ra,44(sp)
    4c50:	000b2423          	sw	zero,8(s6)
    4c54:	000b2223          	sw	zero,4(s6)
    4c58:	01012b03          	lw	s6,16(sp)
    4c5c:	03010113          	add	sp,sp,48
    4c60:	00008067          	ret

00004c64 <__sprint_r>:
    4c64:	00862703          	lw	a4,8(a2)
    4c68:	00070463          	beqz	a4,4c70 <__sprint_r+0xc>
    4c6c:	ed5ff06f          	j	4b40 <__sprint_r.part.0>
    4c70:	00062223          	sw	zero,4(a2)
    4c74:	00000513          	li	a0,0
    4c78:	00008067          	ret

00004c7c <_vfiprintf_r>:
    4c7c:	eb010113          	add	sp,sp,-336
    4c80:	14812423          	sw	s0,328(sp)
    4c84:	13312e23          	sw	s3,316(sp)
    4c88:	13812423          	sw	s8,296(sp)
    4c8c:	00050413          	mv	s0,a0
    4c90:	00058993          	mv	s3,a1
    4c94:	00060c13          	mv	s8,a2
    4c98:	00000593          	li	a1,0
    4c9c:	00800613          	li	a2,8
    4ca0:	05010513          	add	a0,sp,80
    4ca4:	13512a23          	sw	s5,308(sp)
    4ca8:	14112623          	sw	ra,332(sp)
    4cac:	00068a93          	mv	s5,a3
    4cb0:	9a4fc0ef          	jal	e54 <memset>
    4cb4:	00040863          	beqz	s0,4cc4 <_vfiprintf_r+0x48>
    4cb8:	03442783          	lw	a5,52(s0)
    4cbc:	00079463          	bnez	a5,4cc4 <_vfiprintf_r+0x48>
    4cc0:	49c0106f          	j	615c <_vfiprintf_r+0x14e0>
    4cc4:	0649a703          	lw	a4,100(s3)
    4cc8:	00c99783          	lh	a5,12(s3)
    4ccc:	00177713          	and	a4,a4,1
    4cd0:	00071863          	bnez	a4,4ce0 <_vfiprintf_r+0x64>
    4cd4:	2007f713          	and	a4,a5,512
    4cd8:	00071463          	bnez	a4,4ce0 <_vfiprintf_r+0x64>
    4cdc:	0b80106f          	j	5d94 <_vfiprintf_r+0x1118>
    4ce0:	01279713          	sll	a4,a5,0x12
    4ce4:	02074663          	bltz	a4,4d10 <_vfiprintf_r+0x94>
    4ce8:	0649a703          	lw	a4,100(s3)
    4cec:	00002637          	lui	a2,0x2
    4cf0:	ffffe6b7          	lui	a3,0xffffe
    4cf4:	00c7e7b3          	or	a5,a5,a2
    4cf8:	fff68693          	add	a3,a3,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    4cfc:	01079793          	sll	a5,a5,0x10
    4d00:	4107d793          	sra	a5,a5,0x10
    4d04:	00d77733          	and	a4,a4,a3
    4d08:	00f99623          	sh	a5,12(s3)
    4d0c:	06e9a223          	sw	a4,100(s3)
    4d10:	0087f713          	and	a4,a5,8
    4d14:	2e070463          	beqz	a4,4ffc <_vfiprintf_r+0x380>
    4d18:	0109a703          	lw	a4,16(s3)
    4d1c:	2e070063          	beqz	a4,4ffc <_vfiprintf_r+0x380>
    4d20:	01a7f713          	and	a4,a5,26
    4d24:	00a00693          	li	a3,10
    4d28:	2ed70c63          	beq	a4,a3,5020 <_vfiprintf_r+0x3a4>
    4d2c:	13412c23          	sw	s4,312(sp)
    4d30:	06c10a13          	add	s4,sp,108
    4d34:	14912223          	sw	s1,324(sp)
    4d38:	15212023          	sw	s2,320(sp)
    4d3c:	13612823          	sw	s6,304(sp)
    4d40:	13712623          	sw	s7,300(sp)
    4d44:	13912223          	sw	s9,292(sp)
    4d48:	13a12023          	sw	s10,288(sp)
    4d4c:	000c0c93          	mv	s9,s8
    4d50:	11b12e23          	sw	s11,284(sp)
    4d54:	07412023          	sw	s4,96(sp)
    4d58:	06012423          	sw	zero,104(sp)
    4d5c:	06012223          	sw	zero,100(sp)
    4d60:	00012a23          	sw	zero,20(sp)
    4d64:	02012623          	sw	zero,44(sp)
    4d68:	02012823          	sw	zero,48(sp)
    4d6c:	02012a23          	sw	zero,52(sp)
    4d70:	00012623          	sw	zero,12(sp)
    4d74:	7fffb497          	auipc	s1,0x7fffb
    4d78:	7c048493          	add	s1,s1,1984 # 80000534 <__global_locale>
    4d7c:	02500913          	li	s2,37
    4d80:	0000ab97          	auipc	s7,0xa
    4d84:	724b8b93          	add	s7,s7,1828 # f4a4 <blanks.1+0x10>
    4d88:	0000bb17          	auipc	s6,0xb
    4d8c:	888b0b13          	add	s6,s6,-1912 # f610 <zeroes.0>
    4d90:	000a0c13          	mv	s8,s4
    4d94:	000c8d93          	mv	s11,s9
    4d98:	0e44ad03          	lw	s10,228(s1)
    4d9c:	3f9020ef          	jal	7994 <__locale_mb_cur_max>
    4da0:	00050693          	mv	a3,a0
    4da4:	05010713          	add	a4,sp,80
    4da8:	000d8613          	mv	a2,s11
    4dac:	04810593          	add	a1,sp,72
    4db0:	00040513          	mv	a0,s0
    4db4:	000d00e7          	jalr	s10
    4db8:	2e050e63          	beqz	a0,50b4 <_vfiprintf_r+0x438>
    4dbc:	2c054e63          	bltz	a0,5098 <_vfiprintf_r+0x41c>
    4dc0:	04812783          	lw	a5,72(sp)
    4dc4:	01278663          	beq	a5,s2,4dd0 <_vfiprintf_r+0x154>
    4dc8:	00ad8db3          	add	s11,s11,a0
    4dcc:	fcdff06f          	j	4d98 <_vfiprintf_r+0x11c>
    4dd0:	00050d13          	mv	s10,a0
    4dd4:	419d87b3          	sub	a5,s11,s9
    4dd8:	2f9d9463          	bne	s11,s9,50c0 <_vfiprintf_r+0x444>
    4ddc:	00000e13          	li	t3,0
    4de0:	001dc683          	lbu	a3,1(s11)
    4de4:	001d8c93          	add	s9,s11,1
    4de8:	040101a3          	sb	zero,67(sp)
    4dec:	fff00713          	li	a4,-1
    4df0:	00000893          	li	a7,0
    4df4:	05a00d13          	li	s10,90
    4df8:	000e0d93          	mv	s11,t3
    4dfc:	001c8c93          	add	s9,s9,1
    4e00:	fe068793          	add	a5,a3,-32
    4e04:	04fd6663          	bltu	s10,a5,4e50 <_vfiprintf_r+0x1d4>
    4e08:	00279793          	sll	a5,a5,0x2
    4e0c:	017787b3          	add	a5,a5,s7
    4e10:	0007a783          	lw	a5,0(a5)
    4e14:	017787b3          	add	a5,a5,s7
    4e18:	00078067          	jr	a5
    4e1c:	00000893          	li	a7,0
    4e20:	fd068793          	add	a5,a3,-48
    4e24:	00900593          	li	a1,9
    4e28:	000cc683          	lbu	a3,0(s9)
    4e2c:	00289613          	sll	a2,a7,0x2
    4e30:	011608b3          	add	a7,a2,a7
    4e34:	00189893          	sll	a7,a7,0x1
    4e38:	011788b3          	add	a7,a5,a7
    4e3c:	fd068793          	add	a5,a3,-48
    4e40:	001c8c93          	add	s9,s9,1
    4e44:	fef5f2e3          	bgeu	a1,a5,4e28 <_vfiprintf_r+0x1ac>
    4e48:	fe068793          	add	a5,a3,-32
    4e4c:	fafd7ee3          	bgeu	s10,a5,4e08 <_vfiprintf_r+0x18c>
    4e50:	000d8e13          	mv	t3,s11
    4e54:	2c068663          	beqz	a3,5120 <_vfiprintf_r+0x4a4>
    4e58:	0ad10623          	sb	a3,172(sp)
    4e5c:	040101a3          	sb	zero,67(sp)
    4e60:	00100e93          	li	t4,1
    4e64:	00100d13          	li	s10,1
    4e68:	0ac10813          	add	a6,sp,172
    4e6c:	00012823          	sw	zero,16(sp)
    4e70:	00000713          	li	a4,0
    4e74:	00000f93          	li	t6,0
    4e78:	06412603          	lw	a2,100(sp)
    4e7c:	084e7293          	and	t0,t3,132
    4e80:	06812783          	lw	a5,104(sp)
    4e84:	00160593          	add	a1,a2,1 # 2001 <_vfprintf_r+0x259>
    4e88:	00058f13          	mv	t5,a1
    4e8c:	00029663          	bnez	t0,4e98 <_vfiprintf_r+0x21c>
    4e90:	41d88db3          	sub	s11,a7,t4
    4e94:	47b046e3          	bgtz	s11,5b00 <_vfiprintf_r+0xe84>
    4e98:	04314583          	lbu	a1,67(sp)
    4e9c:	02058a63          	beqz	a1,4ed0 <_vfiprintf_r+0x254>
    4ea0:	04310613          	add	a2,sp,67
    4ea4:	00178793          	add	a5,a5,1
    4ea8:	00100693          	li	a3,1
    4eac:	00cc2023          	sw	a2,0(s8)
    4eb0:	00dc2223          	sw	a3,4(s8)
    4eb4:	06f12423          	sw	a5,104(sp)
    4eb8:	07e12223          	sw	t5,100(sp)
    4ebc:	00700613          	li	a2,7
    4ec0:	35e64ce3          	blt	a2,t5,5a18 <_vfiprintf_r+0xd9c>
    4ec4:	000f0613          	mv	a2,t5
    4ec8:	008c0c13          	add	s8,s8,8
    4ecc:	001f0f13          	add	t5,t5,1
    4ed0:	080f8063          	beqz	t6,4f50 <_vfiprintf_r+0x2d4>
    4ed4:	00200613          	li	a2,2
    4ed8:	00278793          	add	a5,a5,2
    4edc:	04410693          	add	a3,sp,68
    4ee0:	00cc2223          	sw	a2,4(s8)
    4ee4:	00dc2023          	sw	a3,0(s8)
    4ee8:	06f12423          	sw	a5,104(sp)
    4eec:	07e12223          	sw	t5,100(sp)
    4ef0:	00700613          	li	a2,7
    4ef4:	3be652e3          	bge	a2,t5,5a98 <_vfiprintf_r+0xe1c>
    4ef8:	60078ae3          	beqz	a5,5d0c <_vfiprintf_r+0x1090>
    4efc:	06010613          	add	a2,sp,96
    4f00:	00098593          	mv	a1,s3
    4f04:	00040513          	mv	a0,s0
    4f08:	03d12c23          	sw	t4,56(sp)
    4f0c:	02e12423          	sw	a4,40(sp)
    4f10:	03112223          	sw	a7,36(sp)
    4f14:	03012023          	sw	a6,32(sp)
    4f18:	00512e23          	sw	t0,28(sp)
    4f1c:	01c12c23          	sw	t3,24(sp)
    4f20:	c21ff0ef          	jal	4b40 <__sprint_r.part.0>
    4f24:	22051463          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    4f28:	06412603          	lw	a2,100(sp)
    4f2c:	06812783          	lw	a5,104(sp)
    4f30:	03812e83          	lw	t4,56(sp)
    4f34:	02812703          	lw	a4,40(sp)
    4f38:	02412883          	lw	a7,36(sp)
    4f3c:	02012803          	lw	a6,32(sp)
    4f40:	01c12283          	lw	t0,28(sp)
    4f44:	01812e03          	lw	t3,24(sp)
    4f48:	000a0c13          	mv	s8,s4
    4f4c:	00160f13          	add	t5,a2,1
    4f50:	08000593          	li	a1,128
    4f54:	06b286e3          	beq	t0,a1,57c0 <_vfiprintf_r+0xb44>
    4f58:	41a70733          	sub	a4,a4,s10
    4f5c:	1ae04ae3          	bgtz	a4,5910 <_vfiprintf_r+0xc94>
    4f60:	00fd07b3          	add	a5,s10,a5
    4f64:	010c2023          	sw	a6,0(s8)
    4f68:	01ac2223          	sw	s10,4(s8)
    4f6c:	06f12423          	sw	a5,104(sp)
    4f70:	07e12223          	sw	t5,100(sp)
    4f74:	00700713          	li	a4,7
    4f78:	03e758e3          	bge	a4,t5,57a8 <_vfiprintf_r+0xb2c>
    4f7c:	24078063          	beqz	a5,51bc <_vfiprintf_r+0x540>
    4f80:	06010613          	add	a2,sp,96
    4f84:	00098593          	mv	a1,s3
    4f88:	00040513          	mv	a0,s0
    4f8c:	03d12023          	sw	t4,32(sp)
    4f90:	01112e23          	sw	a7,28(sp)
    4f94:	01c12c23          	sw	t3,24(sp)
    4f98:	ba9ff0ef          	jal	4b40 <__sprint_r.part.0>
    4f9c:	1a051863          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    4fa0:	06812783          	lw	a5,104(sp)
    4fa4:	02012e83          	lw	t4,32(sp)
    4fa8:	01c12883          	lw	a7,28(sp)
    4fac:	01812e03          	lw	t3,24(sp)
    4fb0:	000a0c13          	mv	s8,s4
    4fb4:	004e7e13          	and	t3,t3,4
    4fb8:	000e0663          	beqz	t3,4fc4 <_vfiprintf_r+0x348>
    4fbc:	41d88db3          	sub	s11,a7,t4
    4fc0:	21b04a63          	bgtz	s11,51d4 <_vfiprintf_r+0x558>
    4fc4:	01d8d463          	bge	a7,t4,4fcc <_vfiprintf_r+0x350>
    4fc8:	000e8893          	mv	a7,t4
    4fcc:	00c12703          	lw	a4,12(sp)
    4fd0:	01170733          	add	a4,a4,a7
    4fd4:	00e12623          	sw	a4,12(sp)
    4fd8:	16079063          	bnez	a5,5138 <_vfiprintf_r+0x4bc>
    4fdc:	01012783          	lw	a5,16(sp)
    4fe0:	06012223          	sw	zero,100(sp)
    4fe4:	00078863          	beqz	a5,4ff4 <_vfiprintf_r+0x378>
    4fe8:	00078593          	mv	a1,a5
    4fec:	00040513          	mv	a0,s0
    4ff0:	ab4fc0ef          	jal	12a4 <_free_r>
    4ff4:	000a0c13          	mv	s8,s4
    4ff8:	d9dff06f          	j	4d94 <_vfiprintf_r+0x118>
    4ffc:	00098593          	mv	a1,s3
    5000:	00040513          	mv	a0,s0
    5004:	4b0020ef          	jal	74b4 <__swsetup_r>
    5008:	00050463          	beqz	a0,5010 <_vfiprintf_r+0x394>
    500c:	3840106f          	j	6390 <_vfiprintf_r+0x1714>
    5010:	00c99783          	lh	a5,12(s3)
    5014:	00a00693          	li	a3,10
    5018:	01a7f713          	and	a4,a5,26
    501c:	d0d718e3          	bne	a4,a3,4d2c <_vfiprintf_r+0xb0>
    5020:	00e99703          	lh	a4,14(s3)
    5024:	d00744e3          	bltz	a4,4d2c <_vfiprintf_r+0xb0>
    5028:	0649a703          	lw	a4,100(s3)
    502c:	00177713          	and	a4,a4,1
    5030:	00071863          	bnez	a4,5040 <_vfiprintf_r+0x3c4>
    5034:	2007f793          	and	a5,a5,512
    5038:	00079463          	bnez	a5,5040 <_vfiprintf_r+0x3c4>
    503c:	2ac0106f          	j	62e8 <_vfiprintf_r+0x166c>
    5040:	000a8693          	mv	a3,s5
    5044:	000c0613          	mv	a2,s8
    5048:	00098593          	mv	a1,s3
    504c:	00040513          	mv	a0,s0
    5050:	3e4010ef          	jal	6434 <__sbprintf>
    5054:	14c12083          	lw	ra,332(sp)
    5058:	14812403          	lw	s0,328(sp)
    505c:	00a12623          	sw	a0,12(sp)
    5060:	00c12503          	lw	a0,12(sp)
    5064:	13c12983          	lw	s3,316(sp)
    5068:	13412a83          	lw	s5,308(sp)
    506c:	12812c03          	lw	s8,296(sp)
    5070:	15010113          	add	sp,sp,336
    5074:	00008067          	ret
    5078:	000aa883          	lw	a7,0(s5)
    507c:	004a8a93          	add	s5,s5,4
    5080:	3608cc63          	bltz	a7,53f8 <_vfiprintf_r+0x77c>
    5084:	000cc683          	lbu	a3,0(s9)
    5088:	d75ff06f          	j	4dfc <_vfiprintf_r+0x180>
    508c:	000cc683          	lbu	a3,0(s9)
    5090:	020ded93          	or	s11,s11,32
    5094:	d69ff06f          	j	4dfc <_vfiprintf_r+0x180>
    5098:	00800613          	li	a2,8
    509c:	00000593          	li	a1,0
    50a0:	05010513          	add	a0,sp,80
    50a4:	db1fb0ef          	jal	e54 <memset>
    50a8:	00100513          	li	a0,1
    50ac:	00ad8db3          	add	s11,s11,a0
    50b0:	ce9ff06f          	j	4d98 <_vfiprintf_r+0x11c>
    50b4:	00050d13          	mv	s10,a0
    50b8:	419d87b3          	sub	a5,s11,s9
    50bc:	079d8263          	beq	s11,s9,5120 <_vfiprintf_r+0x4a4>
    50c0:	06812683          	lw	a3,104(sp)
    50c4:	06412703          	lw	a4,100(sp)
    50c8:	019c2023          	sw	s9,0(s8)
    50cc:	00d786b3          	add	a3,a5,a3
    50d0:	00170713          	add	a4,a4,1
    50d4:	00fc2223          	sw	a5,4(s8)
    50d8:	06d12423          	sw	a3,104(sp)
    50dc:	06e12223          	sw	a4,100(sp)
    50e0:	00700613          	li	a2,7
    50e4:	008c0c13          	add	s8,s8,8
    50e8:	02e65463          	bge	a2,a4,5110 <_vfiprintf_r+0x494>
    50ec:	38068ce3          	beqz	a3,5c84 <_vfiprintf_r+0x1008>
    50f0:	06010613          	add	a2,sp,96
    50f4:	00098593          	mv	a1,s3
    50f8:	00040513          	mv	a0,s0
    50fc:	00f12823          	sw	a5,16(sp)
    5100:	a41ff0ef          	jal	4b40 <__sprint_r.part.0>
    5104:	01012783          	lw	a5,16(sp)
    5108:	04051c63          	bnez	a0,5160 <_vfiprintf_r+0x4e4>
    510c:	000a0c13          	mv	s8,s4
    5110:	00c12703          	lw	a4,12(sp)
    5114:	00f707b3          	add	a5,a4,a5
    5118:	00f12623          	sw	a5,12(sp)
    511c:	cc0d10e3          	bnez	s10,4ddc <_vfiprintf_r+0x160>
    5120:	06812783          	lw	a5,104(sp)
    5124:	00078463          	beqz	a5,512c <_vfiprintf_r+0x4b0>
    5128:	22c0106f          	j	6354 <_vfiprintf_r+0x16d8>
    512c:	00c99783          	lh	a5,12(s3)
    5130:	06012223          	sw	zero,100(sp)
    5134:	0300006f          	j	5164 <_vfiprintf_r+0x4e8>
    5138:	06010613          	add	a2,sp,96
    513c:	00098593          	mv	a1,s3
    5140:	00040513          	mv	a0,s0
    5144:	9fdff0ef          	jal	4b40 <__sprint_r.part.0>
    5148:	e8050ae3          	beqz	a0,4fdc <_vfiprintf_r+0x360>
    514c:	01012783          	lw	a5,16(sp)
    5150:	00078863          	beqz	a5,5160 <_vfiprintf_r+0x4e4>
    5154:	01012583          	lw	a1,16(sp)
    5158:	00040513          	mv	a0,s0
    515c:	948fc0ef          	jal	12a4 <_free_r>
    5160:	00c99783          	lh	a5,12(s3)
    5164:	0649a703          	lw	a4,100(s3)
    5168:	00177713          	and	a4,a4,1
    516c:	16070a63          	beqz	a4,52e0 <_vfiprintf_r+0x664>
    5170:	0407f793          	and	a5,a5,64
    5174:	14412483          	lw	s1,324(sp)
    5178:	14012903          	lw	s2,320(sp)
    517c:	13812a03          	lw	s4,312(sp)
    5180:	13012b03          	lw	s6,304(sp)
    5184:	12c12b83          	lw	s7,300(sp)
    5188:	12412c83          	lw	s9,292(sp)
    518c:	12012d03          	lw	s10,288(sp)
    5190:	11c12d83          	lw	s11,284(sp)
    5194:	00078463          	beqz	a5,519c <_vfiprintf_r+0x520>
    5198:	2180106f          	j	63b0 <_vfiprintf_r+0x1734>
    519c:	14c12083          	lw	ra,332(sp)
    51a0:	14812403          	lw	s0,328(sp)
    51a4:	00c12503          	lw	a0,12(sp)
    51a8:	13c12983          	lw	s3,316(sp)
    51ac:	13412a83          	lw	s5,308(sp)
    51b0:	12812c03          	lw	s8,296(sp)
    51b4:	15010113          	add	sp,sp,336
    51b8:	00008067          	ret
    51bc:	06012223          	sw	zero,100(sp)
    51c0:	004e7e13          	and	t3,t3,4
    51c4:	240e0ee3          	beqz	t3,5c20 <_vfiprintf_r+0xfa4>
    51c8:	41d88db3          	sub	s11,a7,t4
    51cc:	25b05ae3          	blez	s11,5c20 <_vfiprintf_r+0xfa4>
    51d0:	000a0c13          	mv	s8,s4
    51d4:	01000713          	li	a4,16
    51d8:	06412683          	lw	a3,100(sp)
    51dc:	01b74463          	blt	a4,s11,51e4 <_vfiprintf_r+0x568>
    51e0:	1900106f          	j	6370 <_vfiprintf_r+0x16f4>
    51e4:	000a8713          	mv	a4,s5
    51e8:	0000a317          	auipc	t1,0xa
    51ec:	43830313          	add	t1,t1,1080 # f620 <blanks.1>
    51f0:	000c0593          	mv	a1,s8
    51f4:	000d8a93          	mv	s5,s11
    51f8:	01000813          	li	a6,16
    51fc:	00700d13          	li	s10,7
    5200:	01112c23          	sw	a7,24(sp)
    5204:	01d12e23          	sw	t4,28(sp)
    5208:	00030c13          	mv	s8,t1
    520c:	00070d93          	mv	s11,a4
    5210:	0180006f          	j	5228 <_vfiprintf_r+0x5ac>
    5214:	00268613          	add	a2,a3,2
    5218:	00858593          	add	a1,a1,8
    521c:	00070693          	mv	a3,a4
    5220:	ff0a8a93          	add	s5,s5,-16
    5224:	05585a63          	bge	a6,s5,5278 <_vfiprintf_r+0x5fc>
    5228:	01078793          	add	a5,a5,16
    522c:	00168713          	add	a4,a3,1
    5230:	0185a023          	sw	s8,0(a1)
    5234:	0105a223          	sw	a6,4(a1)
    5238:	06f12423          	sw	a5,104(sp)
    523c:	06e12223          	sw	a4,100(sp)
    5240:	fced5ae3          	bge	s10,a4,5214 <_vfiprintf_r+0x598>
    5244:	56078663          	beqz	a5,57b0 <_vfiprintf_r+0xb34>
    5248:	06010613          	add	a2,sp,96
    524c:	00098593          	mv	a1,s3
    5250:	00040513          	mv	a0,s0
    5254:	8edff0ef          	jal	4b40 <__sprint_r.part.0>
    5258:	ee051ae3          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    525c:	06412683          	lw	a3,100(sp)
    5260:	01000813          	li	a6,16
    5264:	ff0a8a93          	add	s5,s5,-16
    5268:	06812783          	lw	a5,104(sp)
    526c:	000a0593          	mv	a1,s4
    5270:	00168613          	add	a2,a3,1
    5274:	fb584ae3          	blt	a6,s5,5228 <_vfiprintf_r+0x5ac>
    5278:	01812883          	lw	a7,24(sp)
    527c:	01c12e83          	lw	t4,28(sp)
    5280:	000d8713          	mv	a4,s11
    5284:	000c0313          	mv	t1,s8
    5288:	000a8d93          	mv	s11,s5
    528c:	00058c13          	mv	s8,a1
    5290:	00070a93          	mv	s5,a4
    5294:	01b787b3          	add	a5,a5,s11
    5298:	006c2023          	sw	t1,0(s8)
    529c:	01bc2223          	sw	s11,4(s8)
    52a0:	06f12423          	sw	a5,104(sp)
    52a4:	06c12223          	sw	a2,100(sp)
    52a8:	00700713          	li	a4,7
    52ac:	d0c75ce3          	bge	a4,a2,4fc4 <_vfiprintf_r+0x348>
    52b0:	160788e3          	beqz	a5,5c20 <_vfiprintf_r+0xfa4>
    52b4:	06010613          	add	a2,sp,96
    52b8:	00098593          	mv	a1,s3
    52bc:	00040513          	mv	a0,s0
    52c0:	01d12e23          	sw	t4,28(sp)
    52c4:	01112c23          	sw	a7,24(sp)
    52c8:	879ff0ef          	jal	4b40 <__sprint_r.part.0>
    52cc:	e80510e3          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    52d0:	06812783          	lw	a5,104(sp)
    52d4:	01c12e83          	lw	t4,28(sp)
    52d8:	01812883          	lw	a7,24(sp)
    52dc:	ce9ff06f          	j	4fc4 <_vfiprintf_r+0x348>
    52e0:	2007f713          	and	a4,a5,512
    52e4:	e80716e3          	bnez	a4,5170 <_vfiprintf_r+0x4f4>
    52e8:	0589a503          	lw	a0,88(s3)
    52ec:	b65fb0ef          	jal	e50 <__retarget_lock_release_recursive>
    52f0:	00c99783          	lh	a5,12(s3)
    52f4:	e7dff06f          	j	5170 <_vfiprintf_r+0x4f4>
    52f8:	000aa803          	lw	a6,0(s5)
    52fc:	040101a3          	sb	zero,67(sp)
    5300:	000d8e13          	mv	t3,s11
    5304:	004a8a93          	add	s5,s5,4
    5308:	68080ae3          	beqz	a6,619c <_vfiprintf_r+0x1520>
    530c:	05300793          	li	a5,83
    5310:	3cf68ce3          	beq	a3,a5,5ee8 <_vfiprintf_r+0x126c>
    5314:	010df793          	and	a5,s11,16
    5318:	3c0798e3          	bnez	a5,5ee8 <_vfiprintf_r+0x126c>
    531c:	00075463          	bgez	a4,5324 <_vfiprintf_r+0x6a8>
    5320:	7fd0006f          	j	631c <_vfiprintf_r+0x16a0>
    5324:	00070613          	mv	a2,a4
    5328:	00080513          	mv	a0,a6
    532c:	00000593          	li	a1,0
    5330:	03112223          	sw	a7,36(sp)
    5334:	00e12e23          	sw	a4,28(sp)
    5338:	01012c23          	sw	a6,24(sp)
    533c:	03b12023          	sw	s11,32(sp)
    5340:	4e4020ef          	jal	7824 <memchr>
    5344:	00a12823          	sw	a0,16(sp)
    5348:	01812803          	lw	a6,24(sp)
    534c:	01c12703          	lw	a4,28(sp)
    5350:	02012e03          	lw	t3,32(sp)
    5354:	02412883          	lw	a7,36(sp)
    5358:	00051463          	bnez	a0,5360 <_vfiprintf_r+0x6e4>
    535c:	7990006f          	j	62f4 <_vfiprintf_r+0x1678>
    5360:	41050d33          	sub	s10,a0,a6
    5364:	fffd4e93          	not	t4,s10
    5368:	41fede93          	sra	t4,t4,0x1f
    536c:	01dd7eb3          	and	t4,s10,t4
    5370:	00012823          	sw	zero,16(sp)
    5374:	6dd0006f          	j	6250 <_vfiprintf_r+0x15d4>
    5378:	04300793          	li	a5,67
    537c:	000d8e13          	mv	t3,s11
    5380:	004a8d93          	add	s11,s5,4
    5384:	00f68663          	beq	a3,a5,5390 <_vfiprintf_r+0x714>
    5388:	010e7793          	and	a5,t3,16
    538c:	280788e3          	beqz	a5,5e1c <_vfiprintf_r+0x11a0>
    5390:	00800613          	li	a2,8
    5394:	00000593          	li	a1,0
    5398:	05810513          	add	a0,sp,88
    539c:	01112e23          	sw	a7,28(sp)
    53a0:	01c12c23          	sw	t3,24(sp)
    53a4:	ab1fb0ef          	jal	e54 <memset>
    53a8:	000aa603          	lw	a2,0(s5)
    53ac:	0ac10593          	add	a1,sp,172
    53b0:	05810693          	add	a3,sp,88
    53b4:	00040513          	mv	a0,s0
    53b8:	00b12823          	sw	a1,16(sp)
    53bc:	694050ef          	jal	aa50 <_wcrtomb_r>
    53c0:	fff00793          	li	a5,-1
    53c4:	01012583          	lw	a1,16(sp)
    53c8:	01812e03          	lw	t3,24(sp)
    53cc:	01c12883          	lw	a7,28(sp)
    53d0:	00050d13          	mv	s10,a0
    53d4:	00f51463          	bne	a0,a5,53dc <_vfiprintf_r+0x760>
    53d8:	0200106f          	j	63f8 <_vfiprintf_r+0x177c>
    53dc:	fff54e93          	not	t4,a0
    53e0:	41fede93          	sra	t4,t4,0x1f
    53e4:	01d57eb3          	and	t4,a0,t4
    53e8:	040101a3          	sb	zero,67(sp)
    53ec:	000d8a93          	mv	s5,s11
    53f0:	00058813          	mv	a6,a1
    53f4:	a79ff06f          	j	4e6c <_vfiprintf_r+0x1f0>
    53f8:	411008b3          	neg	a7,a7
    53fc:	000cc683          	lbu	a3,0(s9)
    5400:	004ded93          	or	s11,s11,4
    5404:	9f9ff06f          	j	4dfc <_vfiprintf_r+0x180>
    5408:	010dee13          	or	t3,s11,16
    540c:	020e7793          	and	a5,t3,32
    5410:	0c0788e3          	beqz	a5,5ce0 <_vfiprintf_r+0x1064>
    5414:	007a8a93          	add	s5,s5,7
    5418:	ff8afa93          	and	s5,s5,-8
    541c:	004aa683          	lw	a3,4(s5)
    5420:	000aad83          	lw	s11,0(s5)
    5424:	008a8a93          	add	s5,s5,8
    5428:	00068d13          	mv	s10,a3
    542c:	3006c263          	bltz	a3,5730 <_vfiprintf_r+0xab4>
    5430:	32074063          	bltz	a4,5750 <_vfiprintf_r+0xad4>
    5434:	01ade6b3          	or	a3,s11,s10
    5438:	f7fe7e13          	and	t3,t3,-129
    543c:	30069a63          	bnez	a3,5750 <_vfiprintf_r+0xad4>
    5440:	68071ae3          	bnez	a4,62d4 <_vfiprintf_r+0x1658>
    5444:	04314783          	lbu	a5,67(sp)
    5448:	00012823          	sw	zero,16(sp)
    544c:	00000e93          	li	t4,0
    5450:	00000d13          	li	s10,0
    5454:	11010813          	add	a6,sp,272
    5458:	00078463          	beqz	a5,5460 <_vfiprintf_r+0x7e4>
    545c:	001e8e93          	add	t4,t4,1
    5460:	002e7f93          	and	t6,t3,2
    5464:	a00f8ae3          	beqz	t6,4e78 <_vfiprintf_r+0x1fc>
    5468:	002e8e93          	add	t4,t4,2
    546c:	00200f93          	li	t6,2
    5470:	a09ff06f          	j	4e78 <_vfiprintf_r+0x1fc>
    5474:	000cc683          	lbu	a3,0(s9)
    5478:	06800793          	li	a5,104
    547c:	4ef686e3          	beq	a3,a5,6168 <_vfiprintf_r+0x14ec>
    5480:	040ded93          	or	s11,s11,64
    5484:	979ff06f          	j	4dfc <_vfiprintf_r+0x180>
    5488:	010de613          	or	a2,s11,16
    548c:	02067793          	and	a5,a2,32
    5490:	000780e3          	beqz	a5,5c90 <_vfiprintf_r+0x1014>
    5494:	007a8a93          	add	s5,s5,7
    5498:	ff8afa93          	and	s5,s5,-8
    549c:	000aad83          	lw	s11,0(s5)
    54a0:	004aad03          	lw	s10,4(s5)
    54a4:	008a8a93          	add	s5,s5,8
    54a8:	040101a3          	sb	zero,67(sp)
    54ac:	00060e13          	mv	t3,a2
    54b0:	2a074063          	bltz	a4,5750 <_vfiprintf_r+0xad4>
    54b4:	01ade6b3          	or	a3,s11,s10
    54b8:	f7f67e13          	and	t3,a2,-129
    54bc:	28069a63          	bnez	a3,5750 <_vfiprintf_r+0xad4>
    54c0:	00100793          	li	a5,1
    54c4:	06071e63          	bnez	a4,5540 <_vfiprintf_r+0x8c4>
    54c8:	f6079ee3          	bnez	a5,5444 <_vfiprintf_r+0x7c8>
    54cc:	00167d13          	and	s10,a2,1
    54d0:	0a0d0ce3          	beqz	s10,5d88 <_vfiprintf_r+0x110c>
    54d4:	03000793          	li	a5,48
    54d8:	10f107a3          	sb	a5,271(sp)
    54dc:	000d0e93          	mv	t4,s10
    54e0:	10f10813          	add	a6,sp,271
    54e4:	2980006f          	j	577c <_vfiprintf_r+0xb00>
    54e8:	02b00793          	li	a5,43
    54ec:	000cc683          	lbu	a3,0(s9)
    54f0:	04f101a3          	sb	a5,67(sp)
    54f4:	909ff06f          	j	4dfc <_vfiprintf_r+0x180>
    54f8:	010de693          	or	a3,s11,16
    54fc:	0206f793          	and	a5,a3,32
    5500:	7a078c63          	beqz	a5,5cb8 <_vfiprintf_r+0x103c>
    5504:	007a8a93          	add	s5,s5,7
    5508:	ff8afa93          	and	s5,s5,-8
    550c:	000aa783          	lw	a5,0(s5)
    5510:	004aa583          	lw	a1,4(s5)
    5514:	008a8a93          	add	s5,s5,8
    5518:	040101a3          	sb	zero,67(sp)
    551c:	bff6fe13          	and	t3,a3,-1025
    5520:	02074c63          	bltz	a4,5558 <_vfiprintf_r+0x8dc>
    5524:	00b7e633          	or	a2,a5,a1
    5528:	b7f6f693          	and	a3,a3,-1153
    552c:	420610e3          	bnez	a2,614c <_vfiprintf_r+0x14d0>
    5530:	000e0613          	mv	a2,t3
    5534:	00000793          	li	a5,0
    5538:	00068e13          	mv	t3,a3
    553c:	f80706e3          	beqz	a4,54c8 <_vfiprintf_r+0x84c>
    5540:	00100693          	li	a3,1
    5544:	58d788e3          	beq	a5,a3,62d4 <_vfiprintf_r+0x1658>
    5548:	00200693          	li	a3,2
    554c:	46d786e3          	beq	a5,a3,61b8 <_vfiprintf_r+0x153c>
    5550:	00000793          	li	a5,0
    5554:	00000593          	li	a1,0
    5558:	11010813          	add	a6,sp,272
    555c:	01d59613          	sll	a2,a1,0x1d
    5560:	0077f693          	and	a3,a5,7
    5564:	0037d793          	srl	a5,a5,0x3
    5568:	03068693          	add	a3,a3,48
    556c:	00f667b3          	or	a5,a2,a5
    5570:	0035d593          	srl	a1,a1,0x3
    5574:	fed80fa3          	sb	a3,-1(a6)
    5578:	00b7e633          	or	a2,a5,a1
    557c:	00080513          	mv	a0,a6
    5580:	fff80813          	add	a6,a6,-1
    5584:	fc061ce3          	bnez	a2,555c <_vfiprintf_r+0x8e0>
    5588:	001e7793          	and	a5,t3,1
    558c:	54078e63          	beqz	a5,5ae8 <_vfiprintf_r+0xe6c>
    5590:	03000793          	li	a5,48
    5594:	54f68a63          	beq	a3,a5,5ae8 <_vfiprintf_r+0xe6c>
    5598:	ffe50513          	add	a0,a0,-2
    559c:	fef80fa3          	sb	a5,-1(a6)
    55a0:	11010793          	add	a5,sp,272
    55a4:	40a78d33          	sub	s10,a5,a0
    55a8:	00070e93          	mv	t4,a4
    55ac:	09a744e3          	blt	a4,s10,5e34 <_vfiprintf_r+0x11b8>
    55b0:	00050813          	mv	a6,a0
    55b4:	1c80006f          	j	577c <_vfiprintf_r+0xb00>
    55b8:	000086b7          	lui	a3,0x8
    55bc:	83068693          	add	a3,a3,-2000 # 7830 <memchr+0xc>
    55c0:	04d11223          	sh	a3,68(sp)
    55c4:	0000a697          	auipc	a3,0xa
    55c8:	9d868693          	add	a3,a3,-1576 # ef9c <__fini_array_end+0x1a4>
    55cc:	000aa783          	lw	a5,0(s5)
    55d0:	00000593          	li	a1,0
    55d4:	002dee13          	or	t3,s11,2
    55d8:	004a8a93          	add	s5,s5,4
    55dc:	00d12a23          	sw	a3,20(sp)
    55e0:	040101a3          	sb	zero,67(sp)
    55e4:	4c074863          	bltz	a4,5ab4 <_vfiprintf_r+0xe38>
    55e8:	00b7e6b3          	or	a3,a5,a1
    55ec:	f7fe7513          	and	a0,t3,-129
    55f0:	4a069c63          	bnez	a3,5aa8 <_vfiprintf_r+0xe2c>
    55f4:	000e0613          	mv	a2,t3
    55f8:	00200793          	li	a5,2
    55fc:	00050e13          	mv	t3,a0
    5600:	ec5ff06f          	j	54c4 <_vfiprintf_r+0x848>
    5604:	00040513          	mv	a0,s0
    5608:	00e12c23          	sw	a4,24(sp)
    560c:	01112823          	sw	a7,16(sp)
    5610:	390020ef          	jal	79a0 <_localeconv_r>
    5614:	00452783          	lw	a5,4(a0)
    5618:	00078513          	mv	a0,a5
    561c:	02f12a23          	sw	a5,52(sp)
    5620:	ab5fb0ef          	jal	10d4 <strlen>
    5624:	00050793          	mv	a5,a0
    5628:	00040513          	mv	a0,s0
    562c:	02f12823          	sw	a5,48(sp)
    5630:	370020ef          	jal	79a0 <_localeconv_r>
    5634:	00852703          	lw	a4,8(a0)
    5638:	03012783          	lw	a5,48(sp)
    563c:	01012883          	lw	a7,16(sp)
    5640:	02e12623          	sw	a4,44(sp)
    5644:	01812703          	lw	a4,24(sp)
    5648:	a2078ee3          	beqz	a5,5084 <_vfiprintf_r+0x408>
    564c:	02c12783          	lw	a5,44(sp)
    5650:	000cc683          	lbu	a3,0(s9)
    5654:	fa078463          	beqz	a5,4dfc <_vfiprintf_r+0x180>
    5658:	0007c783          	lbu	a5,0(a5)
    565c:	fa078063          	beqz	a5,4dfc <_vfiprintf_r+0x180>
    5660:	400ded93          	or	s11,s11,1024
    5664:	f98ff06f          	j	4dfc <_vfiprintf_r+0x180>
    5668:	020df793          	and	a5,s11,32
    566c:	78079263          	bnez	a5,5df0 <_vfiprintf_r+0x1174>
    5670:	010df793          	and	a5,s11,16
    5674:	30079ae3          	bnez	a5,6188 <_vfiprintf_r+0x150c>
    5678:	040df793          	and	a5,s11,64
    567c:	400796e3          	bnez	a5,6288 <_vfiprintf_r+0x160c>
    5680:	200dfe13          	and	t3,s11,512
    5684:	300e02e3          	beqz	t3,6188 <_vfiprintf_r+0x150c>
    5688:	000aa783          	lw	a5,0(s5)
    568c:	00c12703          	lw	a4,12(sp)
    5690:	004a8a93          	add	s5,s5,4
    5694:	00e78023          	sb	a4,0(a5)
    5698:	efcff06f          	j	4d94 <_vfiprintf_r+0x118>
    569c:	000cc683          	lbu	a3,0(s9)
    56a0:	06c00793          	li	a5,108
    56a4:	2cf68ae3          	beq	a3,a5,6178 <_vfiprintf_r+0x14fc>
    56a8:	010ded93          	or	s11,s11,16
    56ac:	f50ff06f          	j	4dfc <_vfiprintf_r+0x180>
    56b0:	000cc683          	lbu	a3,0(s9)
    56b4:	080ded93          	or	s11,s11,128
    56b8:	f44ff06f          	j	4dfc <_vfiprintf_r+0x180>
    56bc:	000cc683          	lbu	a3,0(s9)
    56c0:	02a00793          	li	a5,42
    56c4:	001c8593          	add	a1,s9,1
    56c8:	54f680e3          	beq	a3,a5,6408 <_vfiprintf_r+0x178c>
    56cc:	fd068793          	add	a5,a3,-48
    56d0:	00900613          	li	a2,9
    56d4:	00000713          	li	a4,0
    56d8:	00900513          	li	a0,9
    56dc:	02f66463          	bltu	a2,a5,5704 <_vfiprintf_r+0xa88>
    56e0:	0005c683          	lbu	a3,0(a1)
    56e4:	00271613          	sll	a2,a4,0x2
    56e8:	00e60733          	add	a4,a2,a4
    56ec:	00171713          	sll	a4,a4,0x1
    56f0:	00f70733          	add	a4,a4,a5
    56f4:	fd068793          	add	a5,a3,-48
    56f8:	00158593          	add	a1,a1,1
    56fc:	fef572e3          	bgeu	a0,a5,56e0 <_vfiprintf_r+0xa64>
    5700:	74074063          	bltz	a4,5e40 <_vfiprintf_r+0x11c4>
    5704:	00058c93          	mv	s9,a1
    5708:	ef8ff06f          	j	4e00 <_vfiprintf_r+0x184>
    570c:	000cc683          	lbu	a3,0(s9)
    5710:	001ded93          	or	s11,s11,1
    5714:	ee8ff06f          	j	4dfc <_vfiprintf_r+0x180>
    5718:	04314783          	lbu	a5,67(sp)
    571c:	000cc683          	lbu	a3,0(s9)
    5720:	ec079e63          	bnez	a5,4dfc <_vfiprintf_r+0x180>
    5724:	02000793          	li	a5,32
    5728:	04f101a3          	sb	a5,67(sp)
    572c:	ed0ff06f          	j	4dfc <_vfiprintf_r+0x180>
    5730:	02d00613          	li	a2,45
    5734:	01b036b3          	snez	a3,s11
    5738:	41a000b3          	neg	ra,s10
    573c:	04c101a3          	sb	a2,67(sp)
    5740:	40d08d33          	sub	s10,ra,a3
    5744:	41b00db3          	neg	s11,s11
    5748:	00074463          	bltz	a4,5750 <_vfiprintf_r+0xad4>
    574c:	f7fe7e13          	and	t3,t3,-129
    5750:	120d14e3          	bnez	s10,6078 <_vfiprintf_r+0x13fc>
    5754:	00900693          	li	a3,9
    5758:	13b6e0e3          	bltu	a3,s11,6078 <_vfiprintf_r+0x13fc>
    575c:	030d8793          	add	a5,s11,48
    5760:	0ff7f793          	zext.b	a5,a5
    5764:	10f107a3          	sb	a5,271(sp)
    5768:	00070e93          	mv	t4,a4
    576c:	00e04463          	bgtz	a4,5774 <_vfiprintf_r+0xaf8>
    5770:	00100e93          	li	t4,1
    5774:	00100d13          	li	s10,1
    5778:	10f10813          	add	a6,sp,271
    577c:	04314783          	lbu	a5,67(sp)
    5780:	00012823          	sw	zero,16(sp)
    5784:	cc079ce3          	bnez	a5,545c <_vfiprintf_r+0x7e0>
    5788:	cd9ff06f          	j	5460 <_vfiprintf_r+0x7e4>
    578c:	00100713          	li	a4,1
    5790:	000d0793          	mv	a5,s10
    5794:	07012623          	sw	a6,108(sp)
    5798:	07a12823          	sw	s10,112(sp)
    579c:	07a12423          	sw	s10,104(sp)
    57a0:	06e12223          	sw	a4,100(sp)
    57a4:	000a0c13          	mv	s8,s4
    57a8:	008c0c13          	add	s8,s8,8
    57ac:	809ff06f          	j	4fb4 <_vfiprintf_r+0x338>
    57b0:	00100613          	li	a2,1
    57b4:	00000693          	li	a3,0
    57b8:	000a0593          	mv	a1,s4
    57bc:	a65ff06f          	j	5220 <_vfiprintf_r+0x5a4>
    57c0:	41d88db3          	sub	s11,a7,t4
    57c4:	f9b05a63          	blez	s11,4f58 <_vfiprintf_r+0x2dc>
    57c8:	01000593          	li	a1,16
    57cc:	3bb5dae3          	bge	a1,s11,6380 <_vfiprintf_r+0x1704>
    57d0:	0000af97          	auipc	t6,0xa
    57d4:	e40f8f93          	add	t6,t6,-448 # f610 <zeroes.0>
    57d8:	02e12223          	sw	a4,36(sp)
    57dc:	000a8713          	mv	a4,s5
    57e0:	000c0693          	mv	a3,s8
    57e4:	000d8a93          	mv	s5,s11
    57e8:	01000f13          	li	t5,16
    57ec:	00700293          	li	t0,7
    57f0:	01c12c23          	sw	t3,24(sp)
    57f4:	01012e23          	sw	a6,28(sp)
    57f8:	03112023          	sw	a7,32(sp)
    57fc:	03d12423          	sw	t4,40(sp)
    5800:	000f8c13          	mv	s8,t6
    5804:	00070d93          	mv	s11,a4
    5808:	0180006f          	j	5820 <_vfiprintf_r+0xba4>
    580c:	00260513          	add	a0,a2,2
    5810:	00868693          	add	a3,a3,8
    5814:	00070613          	mv	a2,a4
    5818:	ff0a8a93          	add	s5,s5,-16
    581c:	055f5c63          	bge	t5,s5,5874 <_vfiprintf_r+0xbf8>
    5820:	01078793          	add	a5,a5,16
    5824:	00160713          	add	a4,a2,1
    5828:	0186a023          	sw	s8,0(a3)
    582c:	01e6a223          	sw	t5,4(a3)
    5830:	06f12423          	sw	a5,104(sp)
    5834:	06e12223          	sw	a4,100(sp)
    5838:	fce2dae3          	bge	t0,a4,580c <_vfiprintf_r+0xb90>
    583c:	1c078663          	beqz	a5,5a08 <_vfiprintf_r+0xd8c>
    5840:	06010613          	add	a2,sp,96
    5844:	00098593          	mv	a1,s3
    5848:	00040513          	mv	a0,s0
    584c:	af4ff0ef          	jal	4b40 <__sprint_r.part.0>
    5850:	8e051ee3          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    5854:	06412603          	lw	a2,100(sp)
    5858:	01000f13          	li	t5,16
    585c:	ff0a8a93          	add	s5,s5,-16
    5860:	06812783          	lw	a5,104(sp)
    5864:	000a0693          	mv	a3,s4
    5868:	00160513          	add	a0,a2,1
    586c:	00700293          	li	t0,7
    5870:	fb5f48e3          	blt	t5,s5,5820 <_vfiprintf_r+0xba4>
    5874:	01812e03          	lw	t3,24(sp)
    5878:	01c12803          	lw	a6,28(sp)
    587c:	02012883          	lw	a7,32(sp)
    5880:	02412703          	lw	a4,36(sp)
    5884:	02812e83          	lw	t4,40(sp)
    5888:	000d8613          	mv	a2,s11
    588c:	000c0f93          	mv	t6,s8
    5890:	000a8d93          	mv	s11,s5
    5894:	00068c13          	mv	s8,a3
    5898:	00060a93          	mv	s5,a2
    589c:	01b787b3          	add	a5,a5,s11
    58a0:	01fc2023          	sw	t6,0(s8)
    58a4:	01bc2223          	sw	s11,4(s8)
    58a8:	06f12423          	sw	a5,104(sp)
    58ac:	06a12223          	sw	a0,100(sp)
    58b0:	00700613          	li	a2,7
    58b4:	4ea65863          	bge	a2,a0,5da4 <_vfiprintf_r+0x1128>
    58b8:	1a0786e3          	beqz	a5,6264 <_vfiprintf_r+0x15e8>
    58bc:	06010613          	add	a2,sp,96
    58c0:	00098593          	mv	a1,s3
    58c4:	00040513          	mv	a0,s0
    58c8:	03d12423          	sw	t4,40(sp)
    58cc:	02e12223          	sw	a4,36(sp)
    58d0:	03112023          	sw	a7,32(sp)
    58d4:	01012e23          	sw	a6,28(sp)
    58d8:	01c12c23          	sw	t3,24(sp)
    58dc:	a64ff0ef          	jal	4b40 <__sprint_r.part.0>
    58e0:	860516e3          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    58e4:	02412703          	lw	a4,36(sp)
    58e8:	06412603          	lw	a2,100(sp)
    58ec:	06812783          	lw	a5,104(sp)
    58f0:	41a70733          	sub	a4,a4,s10
    58f4:	02812e83          	lw	t4,40(sp)
    58f8:	02012883          	lw	a7,32(sp)
    58fc:	01c12803          	lw	a6,28(sp)
    5900:	01812e03          	lw	t3,24(sp)
    5904:	000a0c13          	mv	s8,s4
    5908:	00160f13          	add	t5,a2,1
    590c:	e4e05a63          	blez	a4,4f60 <_vfiprintf_r+0x2e4>
    5910:	01000593          	li	a1,16
    5914:	0000af97          	auipc	t6,0xa
    5918:	cfcf8f93          	add	t6,t6,-772 # f610 <zeroes.0>
    591c:	0ae5da63          	bge	a1,a4,59d0 <_vfiprintf_r+0xd54>
    5920:	000c0593          	mv	a1,s8
    5924:	03512423          	sw	s5,40(sp)
    5928:	01000d93          	li	s11,16
    592c:	00700293          	li	t0,7
    5930:	01c12c23          	sw	t3,24(sp)
    5934:	01012e23          	sw	a6,28(sp)
    5938:	03112023          	sw	a7,32(sp)
    593c:	03d12223          	sw	t4,36(sp)
    5940:	00070a93          	mv	s5,a4
    5944:	000b0c13          	mv	s8,s6
    5948:	0180006f          	j	5960 <_vfiprintf_r+0xce4>
    594c:	00260f13          	add	t5,a2,2
    5950:	00858593          	add	a1,a1,8
    5954:	00068613          	mv	a2,a3
    5958:	ff0a8a93          	add	s5,s5,-16
    595c:	055dda63          	bge	s11,s5,59b0 <_vfiprintf_r+0xd34>
    5960:	01078793          	add	a5,a5,16
    5964:	00160693          	add	a3,a2,1
    5968:	0165a023          	sw	s6,0(a1)
    596c:	01b5a223          	sw	s11,4(a1)
    5970:	06f12423          	sw	a5,104(sp)
    5974:	06d12223          	sw	a3,100(sp)
    5978:	fcd2dae3          	bge	t0,a3,594c <_vfiprintf_r+0xcd0>
    597c:	06078e63          	beqz	a5,59f8 <_vfiprintf_r+0xd7c>
    5980:	06010613          	add	a2,sp,96
    5984:	00098593          	mv	a1,s3
    5988:	00040513          	mv	a0,s0
    598c:	9b4ff0ef          	jal	4b40 <__sprint_r.part.0>
    5990:	fa051e63          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    5994:	06412603          	lw	a2,100(sp)
    5998:	ff0a8a93          	add	s5,s5,-16
    599c:	06812783          	lw	a5,104(sp)
    59a0:	000a0593          	mv	a1,s4
    59a4:	00160f13          	add	t5,a2,1
    59a8:	00700293          	li	t0,7
    59ac:	fb5dcae3          	blt	s11,s5,5960 <_vfiprintf_r+0xce4>
    59b0:	000a8713          	mv	a4,s5
    59b4:	01812e03          	lw	t3,24(sp)
    59b8:	01c12803          	lw	a6,28(sp)
    59bc:	02012883          	lw	a7,32(sp)
    59c0:	02412e83          	lw	t4,36(sp)
    59c4:	02812a83          	lw	s5,40(sp)
    59c8:	000c0f93          	mv	t6,s8
    59cc:	00058c13          	mv	s8,a1
    59d0:	00e787b3          	add	a5,a5,a4
    59d4:	00ec2223          	sw	a4,4(s8)
    59d8:	01fc2023          	sw	t6,0(s8)
    59dc:	06f12423          	sw	a5,104(sp)
    59e0:	07e12223          	sw	t5,100(sp)
    59e4:	00700713          	li	a4,7
    59e8:	25e74863          	blt	a4,t5,5c38 <_vfiprintf_r+0xfbc>
    59ec:	008c0c13          	add	s8,s8,8
    59f0:	001f0f13          	add	t5,t5,1
    59f4:	d6cff06f          	j	4f60 <_vfiprintf_r+0x2e4>
    59f8:	00100f13          	li	t5,1
    59fc:	00000613          	li	a2,0
    5a00:	000a0593          	mv	a1,s4
    5a04:	f55ff06f          	j	5958 <_vfiprintf_r+0xcdc>
    5a08:	00100513          	li	a0,1
    5a0c:	00000613          	li	a2,0
    5a10:	000a0693          	mv	a3,s4
    5a14:	e05ff06f          	j	5818 <_vfiprintf_r+0xb9c>
    5a18:	06078263          	beqz	a5,5a7c <_vfiprintf_r+0xe00>
    5a1c:	06010613          	add	a2,sp,96
    5a20:	00098593          	mv	a1,s3
    5a24:	00040513          	mv	a0,s0
    5a28:	03d12e23          	sw	t4,60(sp)
    5a2c:	02e12c23          	sw	a4,56(sp)
    5a30:	03112423          	sw	a7,40(sp)
    5a34:	03012223          	sw	a6,36(sp)
    5a38:	02512023          	sw	t0,32(sp)
    5a3c:	01f12e23          	sw	t6,28(sp)
    5a40:	01c12c23          	sw	t3,24(sp)
    5a44:	8fcff0ef          	jal	4b40 <__sprint_r.part.0>
    5a48:	f0051263          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    5a4c:	06412603          	lw	a2,100(sp)
    5a50:	06812783          	lw	a5,104(sp)
    5a54:	03c12e83          	lw	t4,60(sp)
    5a58:	03812703          	lw	a4,56(sp)
    5a5c:	02812883          	lw	a7,40(sp)
    5a60:	02412803          	lw	a6,36(sp)
    5a64:	02012283          	lw	t0,32(sp)
    5a68:	01c12f83          	lw	t6,28(sp)
    5a6c:	01812e03          	lw	t3,24(sp)
    5a70:	000a0c13          	mv	s8,s4
    5a74:	00160f13          	add	t5,a2,1
    5a78:	c58ff06f          	j	4ed0 <_vfiprintf_r+0x254>
    5a7c:	380f8863          	beqz	t6,5e0c <_vfiprintf_r+0x1190>
    5a80:	04410793          	add	a5,sp,68
    5a84:	06f12623          	sw	a5,108(sp)
    5a88:	00200793          	li	a5,2
    5a8c:	06f12823          	sw	a5,112(sp)
    5a90:	00100f13          	li	t5,1
    5a94:	000a0c13          	mv	s8,s4
    5a98:	000f0613          	mv	a2,t5
    5a9c:	008c0c13          	add	s8,s8,8
    5aa0:	001f0f13          	add	t5,t5,1
    5aa4:	cacff06f          	j	4f50 <_vfiprintf_r+0x2d4>
    5aa8:	00200693          	li	a3,2
    5aac:	00050e13          	mv	t3,a0
    5ab0:	aa0684e3          	beqz	a3,5558 <_vfiprintf_r+0x8dc>
    5ab4:	01412503          	lw	a0,20(sp)
    5ab8:	11010813          	add	a6,sp,272
    5abc:	00f7f693          	and	a3,a5,15
    5ac0:	00d506b3          	add	a3,a0,a3
    5ac4:	0006c603          	lbu	a2,0(a3)
    5ac8:	0047d793          	srl	a5,a5,0x4
    5acc:	01c59693          	sll	a3,a1,0x1c
    5ad0:	00f6e7b3          	or	a5,a3,a5
    5ad4:	0045d593          	srl	a1,a1,0x4
    5ad8:	fec80fa3          	sb	a2,-1(a6)
    5adc:	00b7e6b3          	or	a3,a5,a1
    5ae0:	fff80813          	add	a6,a6,-1
    5ae4:	fc069ce3          	bnez	a3,5abc <_vfiprintf_r+0xe40>
    5ae8:	11010793          	add	a5,sp,272
    5aec:	41078d33          	sub	s10,a5,a6
    5af0:	00070e93          	mv	t4,a4
    5af4:	c9a754e3          	bge	a4,s10,577c <_vfiprintf_r+0xb00>
    5af8:	000d0e93          	mv	t4,s10
    5afc:	c81ff06f          	j	577c <_vfiprintf_r+0xb00>
    5b00:	01000513          	li	a0,16
    5b04:	01b554e3          	bge	a0,s11,630c <_vfiprintf_r+0x1690>
    5b08:	000a8693          	mv	a3,s5
    5b0c:	0000a317          	auipc	t1,0xa
    5b10:	b1430313          	add	t1,t1,-1260 # f620 <blanks.1>
    5b14:	02e12c23          	sw	a4,56(sp)
    5b18:	000d8a93          	mv	s5,s11
    5b1c:	000c0713          	mv	a4,s8
    5b20:	01000f13          	li	t5,16
    5b24:	00700393          	li	t2,7
    5b28:	01c12c23          	sw	t3,24(sp)
    5b2c:	01f12e23          	sw	t6,28(sp)
    5b30:	02512023          	sw	t0,32(sp)
    5b34:	03012223          	sw	a6,36(sp)
    5b38:	03112423          	sw	a7,40(sp)
    5b3c:	03d12e23          	sw	t4,60(sp)
    5b40:	00030c13          	mv	s8,t1
    5b44:	00068d93          	mv	s11,a3
    5b48:	01c0006f          	j	5b64 <_vfiprintf_r+0xee8>
    5b4c:	00260513          	add	a0,a2,2
    5b50:	00870713          	add	a4,a4,8
    5b54:	00058613          	mv	a2,a1
    5b58:	ff0a8a93          	add	s5,s5,-16
    5b5c:	055f5c63          	bge	t5,s5,5bb4 <_vfiprintf_r+0xf38>
    5b60:	00160593          	add	a1,a2,1
    5b64:	01078793          	add	a5,a5,16
    5b68:	01872023          	sw	s8,0(a4)
    5b6c:	01e72223          	sw	t5,4(a4)
    5b70:	06f12423          	sw	a5,104(sp)
    5b74:	06b12223          	sw	a1,100(sp)
    5b78:	fcb3dae3          	bge	t2,a1,5b4c <_vfiprintf_r+0xed0>
    5b7c:	08078a63          	beqz	a5,5c10 <_vfiprintf_r+0xf94>
    5b80:	06010613          	add	a2,sp,96
    5b84:	00098593          	mv	a1,s3
    5b88:	00040513          	mv	a0,s0
    5b8c:	fb5fe0ef          	jal	4b40 <__sprint_r.part.0>
    5b90:	da051e63          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    5b94:	06412603          	lw	a2,100(sp)
    5b98:	01000f13          	li	t5,16
    5b9c:	ff0a8a93          	add	s5,s5,-16
    5ba0:	06812783          	lw	a5,104(sp)
    5ba4:	000a0713          	mv	a4,s4
    5ba8:	00160513          	add	a0,a2,1
    5bac:	00700393          	li	t2,7
    5bb0:	fb5f48e3          	blt	t5,s5,5b60 <_vfiprintf_r+0xee4>
    5bb4:	000c0313          	mv	t1,s8
    5bb8:	01812e03          	lw	t3,24(sp)
    5bbc:	00070c13          	mv	s8,a4
    5bc0:	01c12f83          	lw	t6,28(sp)
    5bc4:	02012283          	lw	t0,32(sp)
    5bc8:	02412803          	lw	a6,36(sp)
    5bcc:	02812883          	lw	a7,40(sp)
    5bd0:	03c12e83          	lw	t4,60(sp)
    5bd4:	03812703          	lw	a4,56(sp)
    5bd8:	000d8693          	mv	a3,s11
    5bdc:	000a8d93          	mv	s11,s5
    5be0:	00068a93          	mv	s5,a3
    5be4:	01b787b3          	add	a5,a5,s11
    5be8:	006c2023          	sw	t1,0(s8)
    5bec:	01bc2223          	sw	s11,4(s8)
    5bf0:	06f12423          	sw	a5,104(sp)
    5bf4:	06a12223          	sw	a0,100(sp)
    5bf8:	00700613          	li	a2,7
    5bfc:	12a64063          	blt	a2,a0,5d1c <_vfiprintf_r+0x10a0>
    5c00:	008c0c13          	add	s8,s8,8
    5c04:	00150f13          	add	t5,a0,1
    5c08:	00050613          	mv	a2,a0
    5c0c:	a8cff06f          	j	4e98 <_vfiprintf_r+0x21c>
    5c10:	00000613          	li	a2,0
    5c14:	00100513          	li	a0,1
    5c18:	000a0713          	mv	a4,s4
    5c1c:	f3dff06f          	j	5b58 <_vfiprintf_r+0xedc>
    5c20:	01d8d463          	bge	a7,t4,5c28 <_vfiprintf_r+0xfac>
    5c24:	000e8893          	mv	a7,t4
    5c28:	00c12783          	lw	a5,12(sp)
    5c2c:	011787b3          	add	a5,a5,a7
    5c30:	00f12623          	sw	a5,12(sp)
    5c34:	ba8ff06f          	j	4fdc <_vfiprintf_r+0x360>
    5c38:	b4078ae3          	beqz	a5,578c <_vfiprintf_r+0xb10>
    5c3c:	06010613          	add	a2,sp,96
    5c40:	00098593          	mv	a1,s3
    5c44:	00040513          	mv	a0,s0
    5c48:	03d12223          	sw	t4,36(sp)
    5c4c:	03112023          	sw	a7,32(sp)
    5c50:	01012e23          	sw	a6,28(sp)
    5c54:	01c12c23          	sw	t3,24(sp)
    5c58:	ee9fe0ef          	jal	4b40 <__sprint_r.part.0>
    5c5c:	ce051863          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    5c60:	06412f03          	lw	t5,100(sp)
    5c64:	06812783          	lw	a5,104(sp)
    5c68:	02412e83          	lw	t4,36(sp)
    5c6c:	02012883          	lw	a7,32(sp)
    5c70:	01c12803          	lw	a6,28(sp)
    5c74:	01812e03          	lw	t3,24(sp)
    5c78:	000a0c13          	mv	s8,s4
    5c7c:	001f0f13          	add	t5,t5,1
    5c80:	ae0ff06f          	j	4f60 <_vfiprintf_r+0x2e4>
    5c84:	06012223          	sw	zero,100(sp)
    5c88:	000a0c13          	mv	s8,s4
    5c8c:	c84ff06f          	j	5110 <_vfiprintf_r+0x494>
    5c90:	01067693          	and	a3,a2,16
    5c94:	000aa783          	lw	a5,0(s5)
    5c98:	004a8a93          	add	s5,s5,4
    5c9c:	12069c63          	bnez	a3,5dd4 <_vfiprintf_r+0x1158>
    5ca0:	04067693          	and	a3,a2,64
    5ca4:	12068463          	beqz	a3,5dcc <_vfiprintf_r+0x1150>
    5ca8:	01079d93          	sll	s11,a5,0x10
    5cac:	010ddd93          	srl	s11,s11,0x10
    5cb0:	00000d13          	li	s10,0
    5cb4:	ff4ff06f          	j	54a8 <_vfiprintf_r+0x82c>
    5cb8:	0106f613          	and	a2,a3,16
    5cbc:	000aa783          	lw	a5,0(s5)
    5cc0:	004a8a93          	add	s5,s5,4
    5cc4:	12061263          	bnez	a2,5de8 <_vfiprintf_r+0x116c>
    5cc8:	0406f613          	and	a2,a3,64
    5ccc:	10060a63          	beqz	a2,5de0 <_vfiprintf_r+0x1164>
    5cd0:	01079793          	sll	a5,a5,0x10
    5cd4:	0107d793          	srl	a5,a5,0x10
    5cd8:	00000593          	li	a1,0
    5cdc:	83dff06f          	j	5518 <_vfiprintf_r+0x89c>
    5ce0:	010e7693          	and	a3,t3,16
    5ce4:	000aa783          	lw	a5,0(s5)
    5ce8:	004a8a93          	add	s5,s5,4
    5cec:	0c069863          	bnez	a3,5dbc <_vfiprintf_r+0x1140>
    5cf0:	040e7693          	and	a3,t3,64
    5cf4:	0c068063          	beqz	a3,5db4 <_vfiprintf_r+0x1138>
    5cf8:	01079d93          	sll	s11,a5,0x10
    5cfc:	410ddd93          	sra	s11,s11,0x10
    5d00:	41fddd13          	sra	s10,s11,0x1f
    5d04:	000d0693          	mv	a3,s10
    5d08:	f24ff06f          	j	542c <_vfiprintf_r+0x7b0>
    5d0c:	00100f13          	li	t5,1
    5d10:	00000613          	li	a2,0
    5d14:	000a0c13          	mv	s8,s4
    5d18:	a38ff06f          	j	4f50 <_vfiprintf_r+0x2d4>
    5d1c:	1a078463          	beqz	a5,5ec4 <_vfiprintf_r+0x1248>
    5d20:	06010613          	add	a2,sp,96
    5d24:	00098593          	mv	a1,s3
    5d28:	00040513          	mv	a0,s0
    5d2c:	03d12e23          	sw	t4,60(sp)
    5d30:	02e12c23          	sw	a4,56(sp)
    5d34:	03112423          	sw	a7,40(sp)
    5d38:	03012223          	sw	a6,36(sp)
    5d3c:	02512023          	sw	t0,32(sp)
    5d40:	01f12e23          	sw	t6,28(sp)
    5d44:	01c12c23          	sw	t3,24(sp)
    5d48:	df9fe0ef          	jal	4b40 <__sprint_r.part.0>
    5d4c:	c0051063          	bnez	a0,514c <_vfiprintf_r+0x4d0>
    5d50:	06412603          	lw	a2,100(sp)
    5d54:	06812783          	lw	a5,104(sp)
    5d58:	03c12e83          	lw	t4,60(sp)
    5d5c:	03812703          	lw	a4,56(sp)
    5d60:	02812883          	lw	a7,40(sp)
    5d64:	02412803          	lw	a6,36(sp)
    5d68:	02012283          	lw	t0,32(sp)
    5d6c:	01c12f83          	lw	t6,28(sp)
    5d70:	01812e03          	lw	t3,24(sp)
    5d74:	000a0c13          	mv	s8,s4
    5d78:	00160f13          	add	t5,a2,1
    5d7c:	91cff06f          	j	4e98 <_vfiprintf_r+0x21c>
    5d80:	000d8e13          	mv	t3,s11
    5d84:	e88ff06f          	j	540c <_vfiprintf_r+0x790>
    5d88:	00000e93          	li	t4,0
    5d8c:	11010813          	add	a6,sp,272
    5d90:	9edff06f          	j	577c <_vfiprintf_r+0xb00>
    5d94:	0589a503          	lw	a0,88(s3)
    5d98:	8b4fb0ef          	jal	e4c <__retarget_lock_acquire_recursive>
    5d9c:	00c99783          	lh	a5,12(s3)
    5da0:	f41fe06f          	j	4ce0 <_vfiprintf_r+0x64>
    5da4:	008c0c13          	add	s8,s8,8
    5da8:	00150f13          	add	t5,a0,1
    5dac:	00050613          	mv	a2,a0
    5db0:	9a8ff06f          	j	4f58 <_vfiprintf_r+0x2dc>
    5db4:	200e7693          	and	a3,t3,512
    5db8:	50069463          	bnez	a3,62c0 <_vfiprintf_r+0x1644>
    5dbc:	41f7dd13          	sra	s10,a5,0x1f
    5dc0:	00078d93          	mv	s11,a5
    5dc4:	000d0693          	mv	a3,s10
    5dc8:	e64ff06f          	j	542c <_vfiprintf_r+0x7b0>
    5dcc:	20067693          	and	a3,a2,512
    5dd0:	4c069663          	bnez	a3,629c <_vfiprintf_r+0x1620>
    5dd4:	00078d93          	mv	s11,a5
    5dd8:	00000d13          	li	s10,0
    5ddc:	eccff06f          	j	54a8 <_vfiprintf_r+0x82c>
    5de0:	2006f613          	and	a2,a3,512
    5de4:	4c061863          	bnez	a2,62b4 <_vfiprintf_r+0x1638>
    5de8:	00000593          	li	a1,0
    5dec:	f2cff06f          	j	5518 <_vfiprintf_r+0x89c>
    5df0:	00c12683          	lw	a3,12(sp)
    5df4:	000aa783          	lw	a5,0(s5)
    5df8:	004a8a93          	add	s5,s5,4
    5dfc:	41f6d713          	sra	a4,a3,0x1f
    5e00:	00d7a023          	sw	a3,0(a5)
    5e04:	00e7a223          	sw	a4,4(a5)
    5e08:	f8dfe06f          	j	4d94 <_vfiprintf_r+0x118>
    5e0c:	00000613          	li	a2,0
    5e10:	00100f13          	li	t5,1
    5e14:	000a0c13          	mv	s8,s4
    5e18:	938ff06f          	j	4f50 <_vfiprintf_r+0x2d4>
    5e1c:	000aa783          	lw	a5,0(s5)
    5e20:	00100e93          	li	t4,1
    5e24:	00100d13          	li	s10,1
    5e28:	0af10623          	sb	a5,172(sp)
    5e2c:	0ac10593          	add	a1,sp,172
    5e30:	db8ff06f          	j	53e8 <_vfiprintf_r+0x76c>
    5e34:	000d0e93          	mv	t4,s10
    5e38:	00050813          	mv	a6,a0
    5e3c:	941ff06f          	j	577c <_vfiprintf_r+0xb00>
    5e40:	fff00713          	li	a4,-1
    5e44:	00058c93          	mv	s9,a1
    5e48:	fb9fe06f          	j	4e00 <_vfiprintf_r+0x184>
    5e4c:	000d8613          	mv	a2,s11
    5e50:	e3cff06f          	j	548c <_vfiprintf_r+0x810>
    5e54:	00009797          	auipc	a5,0x9
    5e58:	15c78793          	add	a5,a5,348 # efb0 <__fini_array_end+0x1b8>
    5e5c:	000d8e13          	mv	t3,s11
    5e60:	00f12a23          	sw	a5,20(sp)
    5e64:	020e7793          	and	a5,t3,32
    5e68:	1c078c63          	beqz	a5,6040 <_vfiprintf_r+0x13c4>
    5e6c:	007a8a93          	add	s5,s5,7
    5e70:	ff8afa93          	and	s5,s5,-8
    5e74:	000aa783          	lw	a5,0(s5)
    5e78:	004aa583          	lw	a1,4(s5)
    5e7c:	008a8a93          	add	s5,s5,8
    5e80:	001e7613          	and	a2,t3,1
    5e84:	00060e63          	beqz	a2,5ea0 <_vfiprintf_r+0x1224>
    5e88:	00b7e633          	or	a2,a5,a1
    5e8c:	00060a63          	beqz	a2,5ea0 <_vfiprintf_r+0x1224>
    5e90:	03000613          	li	a2,48
    5e94:	04c10223          	sb	a2,68(sp)
    5e98:	04d102a3          	sb	a3,69(sp)
    5e9c:	002e6e13          	or	t3,t3,2
    5ea0:	bffe7e13          	and	t3,t3,-1025
    5ea4:	f3cff06f          	j	55e0 <_vfiprintf_r+0x964>
    5ea8:	000d8693          	mv	a3,s11
    5eac:	e50ff06f          	j	54fc <_vfiprintf_r+0x880>
    5eb0:	00009797          	auipc	a5,0x9
    5eb4:	0ec78793          	add	a5,a5,236 # ef9c <__fini_array_end+0x1a4>
    5eb8:	000d8e13          	mv	t3,s11
    5ebc:	00f12a23          	sw	a5,20(sp)
    5ec0:	fa5ff06f          	j	5e64 <_vfiprintf_r+0x11e8>
    5ec4:	04314603          	lbu	a2,67(sp)
    5ec8:	3a060a63          	beqz	a2,627c <_vfiprintf_r+0x1600>
    5ecc:	04310793          	add	a5,sp,67
    5ed0:	06f12623          	sw	a5,108(sp)
    5ed4:	00100793          	li	a5,1
    5ed8:	06f12823          	sw	a5,112(sp)
    5edc:	00100f13          	li	t5,1
    5ee0:	000a0c13          	mv	s8,s4
    5ee4:	fe1fe06f          	j	4ec4 <_vfiprintf_r+0x248>
    5ee8:	00800613          	li	a2,8
    5eec:	00000593          	li	a1,0
    5ef0:	05810513          	add	a0,sp,88
    5ef4:	02e12023          	sw	a4,32(sp)
    5ef8:	01112e23          	sw	a7,28(sp)
    5efc:	01c12c23          	sw	t3,24(sp)
    5f00:	05012623          	sw	a6,76(sp)
    5f04:	01012823          	sw	a6,16(sp)
    5f08:	f4dfa0ef          	jal	e54 <memset>
    5f0c:	02012703          	lw	a4,32(sp)
    5f10:	01012803          	lw	a6,16(sp)
    5f14:	01812e03          	lw	t3,24(sp)
    5f18:	01c12883          	lw	a7,28(sp)
    5f1c:	2a074463          	bltz	a4,61c4 <_vfiprintf_r+0x1548>
    5f20:	00000d93          	li	s11,0
    5f24:	00000d13          	li	s10,0
    5f28:	01812823          	sw	s8,16(sp)
    5f2c:	01012e23          	sw	a6,28(sp)
    5f30:	000d8c13          	mv	s8,s11
    5f34:	03112023          	sw	a7,32(sp)
    5f38:	000c8d93          	mv	s11,s9
    5f3c:	000a8c93          	mv	s9,s5
    5f40:	000d0a93          	mv	s5,s10
    5f44:	00098d13          	mv	s10,s3
    5f48:	00070993          	mv	s3,a4
    5f4c:	0300006f          	j	5f7c <_vfiprintf_r+0x1300>
    5f50:	05810693          	add	a3,sp,88
    5f54:	0ac10593          	add	a1,sp,172
    5f58:	00040513          	mv	a0,s0
    5f5c:	2f5040ef          	jal	aa50 <_wcrtomb_r>
    5f60:	fff00793          	li	a5,-1
    5f64:	48f50063          	beq	a0,a5,63e4 <_vfiprintf_r+0x1768>
    5f68:	00aa87b3          	add	a5,s5,a0
    5f6c:	02f9c063          	blt	s3,a5,5f8c <_vfiprintf_r+0x1310>
    5f70:	004c0c13          	add	s8,s8,4
    5f74:	45378463          	beq	a5,s3,63bc <_vfiprintf_r+0x1740>
    5f78:	00078a93          	mv	s5,a5
    5f7c:	04c12783          	lw	a5,76(sp)
    5f80:	018787b3          	add	a5,a5,s8
    5f84:	0007a603          	lw	a2,0(a5)
    5f88:	fc0614e3          	bnez	a2,5f50 <_vfiprintf_r+0x12d4>
    5f8c:	01012c03          	lw	s8,16(sp)
    5f90:	01812e03          	lw	t3,24(sp)
    5f94:	01c12803          	lw	a6,28(sp)
    5f98:	02012883          	lw	a7,32(sp)
    5f9c:	000d0993          	mv	s3,s10
    5fa0:	000a8d13          	mv	s10,s5
    5fa4:	000c8a93          	mv	s5,s9
    5fa8:	000d8c93          	mv	s9,s11
    5fac:	280d0e63          	beqz	s10,6248 <_vfiprintf_r+0x15cc>
    5fb0:	06300793          	li	a5,99
    5fb4:	33a7d463          	bge	a5,s10,62dc <_vfiprintf_r+0x1660>
    5fb8:	001d0593          	add	a1,s10,1
    5fbc:	00040513          	mv	a0,s0
    5fc0:	01112c23          	sw	a7,24(sp)
    5fc4:	01c12823          	sw	t3,16(sp)
    5fc8:	de8fb0ef          	jal	15b0 <_malloc_r>
    5fcc:	01012e03          	lw	t3,16(sp)
    5fd0:	01812883          	lw	a7,24(sp)
    5fd4:	00050813          	mv	a6,a0
    5fd8:	42050063          	beqz	a0,63f8 <_vfiprintf_r+0x177c>
    5fdc:	00a12823          	sw	a0,16(sp)
    5fe0:	00800613          	li	a2,8
    5fe4:	00000593          	li	a1,0
    5fe8:	05810513          	add	a0,sp,88
    5fec:	03112023          	sw	a7,32(sp)
    5ff0:	01c12e23          	sw	t3,28(sp)
    5ff4:	01012c23          	sw	a6,24(sp)
    5ff8:	e5dfa0ef          	jal	e54 <memset>
    5ffc:	01812803          	lw	a6,24(sp)
    6000:	05810713          	add	a4,sp,88
    6004:	000d0693          	mv	a3,s10
    6008:	00080593          	mv	a1,a6
    600c:	04c10613          	add	a2,sp,76
    6010:	00040513          	mv	a0,s0
    6014:	2c9040ef          	jal	aadc <_wcsrtombs_r>
    6018:	01812803          	lw	a6,24(sp)
    601c:	01c12e03          	lw	t3,28(sp)
    6020:	02012883          	lw	a7,32(sp)
    6024:	40ad1063          	bne	s10,a0,6424 <_vfiprintf_r+0x17a8>
    6028:	fffd4e93          	not	t4,s10
    602c:	01a807b3          	add	a5,a6,s10
    6030:	41fede93          	sra	t4,t4,0x1f
    6034:	00078023          	sb	zero,0(a5)
    6038:	01dd7eb3          	and	t4,s10,t4
    603c:	2140006f          	j	6250 <_vfiprintf_r+0x15d4>
    6040:	010e7613          	and	a2,t3,16
    6044:	000aa783          	lw	a5,0(s5)
    6048:	004a8a93          	add	s5,s5,4
    604c:	02061263          	bnez	a2,6070 <_vfiprintf_r+0x13f4>
    6050:	040e7613          	and	a2,t3,64
    6054:	00060a63          	beqz	a2,6068 <_vfiprintf_r+0x13ec>
    6058:	01079793          	sll	a5,a5,0x10
    605c:	0107d793          	srl	a5,a5,0x10
    6060:	00000593          	li	a1,0
    6064:	e1dff06f          	j	5e80 <_vfiprintf_r+0x1204>
    6068:	200e7613          	and	a2,t3,512
    606c:	22061e63          	bnez	a2,62a8 <_vfiprintf_r+0x162c>
    6070:	00000593          	li	a1,0
    6074:	e0dff06f          	j	5e80 <_vfiprintf_r+0x1204>
    6078:	400e7793          	and	a5,t3,1024
    607c:	00000693          	li	a3,0
    6080:	11010e93          	add	t4,sp,272
    6084:	01812823          	sw	s8,16(sp)
    6088:	02812223          	sw	s0,36(sp)
    608c:	03912c23          	sw	s9,56(sp)
    6090:	03512e23          	sw	s5,60(sp)
    6094:	02c12c83          	lw	s9,44(sp)
    6098:	01c12c23          	sw	t3,24(sp)
    609c:	01112e23          	sw	a7,28(sp)
    60a0:	02e12023          	sw	a4,32(sp)
    60a4:	00078c13          	mv	s8,a5
    60a8:	00068413          	mv	s0,a3
    60ac:	03312423          	sw	s3,40(sp)
    60b0:	000e8a93          	mv	s5,t4
    60b4:	0280006f          	j	60dc <_vfiprintf_r+0x1460>
    60b8:	00a00613          	li	a2,10
    60bc:	00000693          	li	a3,0
    60c0:	000d8513          	mv	a0,s11
    60c4:	000d0593          	mv	a1,s10
    60c8:	364050ef          	jal	b42c <__udivdi3>
    60cc:	220d0a63          	beqz	s10,6300 <_vfiprintf_r+0x1684>
    60d0:	00050d93          	mv	s11,a0
    60d4:	00058d13          	mv	s10,a1
    60d8:	00098a93          	mv	s5,s3
    60dc:	00a00613          	li	a2,10
    60e0:	00000693          	li	a3,0
    60e4:	000d8513          	mv	a0,s11
    60e8:	000d0593          	mv	a1,s10
    60ec:	1ed050ef          	jal	bad8 <__umoddi3>
    60f0:	03050513          	add	a0,a0,48
    60f4:	feaa8fa3          	sb	a0,-1(s5)
    60f8:	fffa8993          	add	s3,s5,-1
    60fc:	00140413          	add	s0,s0,1
    6100:	fa0c0ce3          	beqz	s8,60b8 <_vfiprintf_r+0x143c>
    6104:	000cc783          	lbu	a5,0(s9)
    6108:	fa8798e3          	bne	a5,s0,60b8 <_vfiprintf_r+0x143c>
    610c:	0ff00793          	li	a5,255
    6110:	faf404e3          	beq	s0,a5,60b8 <_vfiprintf_r+0x143c>
    6114:	0e0d1a63          	bnez	s10,6208 <_vfiprintf_r+0x158c>
    6118:	00900793          	li	a5,9
    611c:	0fb7e663          	bltu	a5,s11,6208 <_vfiprintf_r+0x158c>
    6120:	00098813          	mv	a6,s3
    6124:	03912623          	sw	s9,44(sp)
    6128:	01012c03          	lw	s8,16(sp)
    612c:	01812e03          	lw	t3,24(sp)
    6130:	01c12883          	lw	a7,28(sp)
    6134:	02012703          	lw	a4,32(sp)
    6138:	02412403          	lw	s0,36(sp)
    613c:	02812983          	lw	s3,40(sp)
    6140:	03812c83          	lw	s9,56(sp)
    6144:	03c12a83          	lw	s5,60(sp)
    6148:	9a1ff06f          	j	5ae8 <_vfiprintf_r+0xe6c>
    614c:	00068e13          	mv	t3,a3
    6150:	00000693          	li	a3,0
    6154:	c0068263          	beqz	a3,5558 <_vfiprintf_r+0x8dc>
    6158:	95dff06f          	j	5ab4 <_vfiprintf_r+0xe38>
    615c:	00040513          	mv	a0,s0
    6160:	115000ef          	jal	6a74 <__sinit>
    6164:	b61fe06f          	j	4cc4 <_vfiprintf_r+0x48>
    6168:	001cc683          	lbu	a3,1(s9)
    616c:	200ded93          	or	s11,s11,512
    6170:	001c8c93          	add	s9,s9,1
    6174:	c89fe06f          	j	4dfc <_vfiprintf_r+0x180>
    6178:	001cc683          	lbu	a3,1(s9)
    617c:	020ded93          	or	s11,s11,32
    6180:	001c8c93          	add	s9,s9,1
    6184:	c79fe06f          	j	4dfc <_vfiprintf_r+0x180>
    6188:	000aa783          	lw	a5,0(s5)
    618c:	00c12703          	lw	a4,12(sp)
    6190:	004a8a93          	add	s5,s5,4
    6194:	00e7a023          	sw	a4,0(a5)
    6198:	bfdfe06f          	j	4d94 <_vfiprintf_r+0x118>
    619c:	00600793          	li	a5,6
    61a0:	00070d13          	mv	s10,a4
    61a4:	0ce7e863          	bltu	a5,a4,6274 <_vfiprintf_r+0x15f8>
    61a8:	000d0e93          	mv	t4,s10
    61ac:	00009817          	auipc	a6,0x9
    61b0:	e1880813          	add	a6,a6,-488 # efc4 <__fini_array_end+0x1cc>
    61b4:	cb9fe06f          	j	4e6c <_vfiprintf_r+0x1f0>
    61b8:	00000793          	li	a5,0
    61bc:	00000593          	li	a1,0
    61c0:	8f5ff06f          	j	5ab4 <_vfiprintf_r+0xe38>
    61c4:	05810713          	add	a4,sp,88
    61c8:	00000693          	li	a3,0
    61cc:	04c10613          	add	a2,sp,76
    61d0:	00000593          	li	a1,0
    61d4:	00040513          	mv	a0,s0
    61d8:	01112e23          	sw	a7,28(sp)
    61dc:	01012c23          	sw	a6,24(sp)
    61e0:	01c12823          	sw	t3,16(sp)
    61e4:	0f9040ef          	jal	aadc <_wcsrtombs_r>
    61e8:	fff00793          	li	a5,-1
    61ec:	01012e03          	lw	t3,16(sp)
    61f0:	01812803          	lw	a6,24(sp)
    61f4:	01c12883          	lw	a7,28(sp)
    61f8:	00050d13          	mv	s10,a0
    61fc:	1ef50e63          	beq	a0,a5,63f8 <_vfiprintf_r+0x177c>
    6200:	05012623          	sw	a6,76(sp)
    6204:	da9ff06f          	j	5fac <_vfiprintf_r+0x1330>
    6208:	03012783          	lw	a5,48(sp)
    620c:	03412583          	lw	a1,52(sp)
    6210:	00000413          	li	s0,0
    6214:	40f989b3          	sub	s3,s3,a5
    6218:	00078613          	mv	a2,a5
    621c:	00098513          	mv	a0,s3
    6220:	6c8010ef          	jal	78e8 <strncpy>
    6224:	001cc783          	lbu	a5,1(s9)
    6228:	00a00613          	li	a2,10
    622c:	00000693          	li	a3,0
    6230:	00f037b3          	snez	a5,a5
    6234:	000d8513          	mv	a0,s11
    6238:	000d0593          	mv	a1,s10
    623c:	00fc8cb3          	add	s9,s9,a5
    6240:	1ec050ef          	jal	b42c <__udivdi3>
    6244:	e8dff06f          	j	60d0 <_vfiprintf_r+0x1454>
    6248:	00000e93          	li	t4,0
    624c:	00012823          	sw	zero,16(sp)
    6250:	04314783          	lbu	a5,67(sp)
    6254:	00000713          	li	a4,0
    6258:	00000f93          	li	t6,0
    625c:	a0079063          	bnez	a5,545c <_vfiprintf_r+0x7e0>
    6260:	c19fe06f          	j	4e78 <_vfiprintf_r+0x1fc>
    6264:	00100f13          	li	t5,1
    6268:	00000613          	li	a2,0
    626c:	000a0c13          	mv	s8,s4
    6270:	ce9fe06f          	j	4f58 <_vfiprintf_r+0x2dc>
    6274:	00600d13          	li	s10,6
    6278:	f31ff06f          	j	61a8 <_vfiprintf_r+0x152c>
    627c:	00100f13          	li	t5,1
    6280:	000a0c13          	mv	s8,s4
    6284:	c4dfe06f          	j	4ed0 <_vfiprintf_r+0x254>
    6288:	000aa783          	lw	a5,0(s5)
    628c:	00c12703          	lw	a4,12(sp)
    6290:	004a8a93          	add	s5,s5,4
    6294:	00e79023          	sh	a4,0(a5)
    6298:	afdfe06f          	j	4d94 <_vfiprintf_r+0x118>
    629c:	0ff7fd93          	zext.b	s11,a5
    62a0:	00000d13          	li	s10,0
    62a4:	a04ff06f          	j	54a8 <_vfiprintf_r+0x82c>
    62a8:	0ff7f793          	zext.b	a5,a5
    62ac:	00000593          	li	a1,0
    62b0:	bd1ff06f          	j	5e80 <_vfiprintf_r+0x1204>
    62b4:	0ff7f793          	zext.b	a5,a5
    62b8:	00000593          	li	a1,0
    62bc:	a5cff06f          	j	5518 <_vfiprintf_r+0x89c>
    62c0:	01879d93          	sll	s11,a5,0x18
    62c4:	418ddd93          	sra	s11,s11,0x18
    62c8:	41fddd13          	sra	s10,s11,0x1f
    62cc:	000d0693          	mv	a3,s10
    62d0:	95cff06f          	j	542c <_vfiprintf_r+0x7b0>
    62d4:	03000793          	li	a5,48
    62d8:	c8cff06f          	j	5764 <_vfiprintf_r+0xae8>
    62dc:	00012823          	sw	zero,16(sp)
    62e0:	0ac10813          	add	a6,sp,172
    62e4:	cfdff06f          	j	5fe0 <_vfiprintf_r+0x1364>
    62e8:	0589a503          	lw	a0,88(s3)
    62ec:	b65fa0ef          	jal	e50 <__retarget_lock_release_recursive>
    62f0:	d51fe06f          	j	5040 <_vfiprintf_r+0x3c4>
    62f4:	00070e93          	mv	t4,a4
    62f8:	00070d13          	mv	s10,a4
    62fc:	f55ff06f          	j	6250 <_vfiprintf_r+0x15d4>
    6300:	00900793          	li	a5,9
    6304:	ddb7e6e3          	bltu	a5,s11,60d0 <_vfiprintf_r+0x1454>
    6308:	e19ff06f          	j	6120 <_vfiprintf_r+0x14a4>
    630c:	00058513          	mv	a0,a1
    6310:	00009317          	auipc	t1,0x9
    6314:	31030313          	add	t1,t1,784 # f620 <blanks.1>
    6318:	8cdff06f          	j	5be4 <_vfiprintf_r+0xf68>
    631c:	00080513          	mv	a0,a6
    6320:	03112023          	sw	a7,32(sp)
    6324:	01012c23          	sw	a6,24(sp)
    6328:	01b12e23          	sw	s11,28(sp)
    632c:	da9fa0ef          	jal	10d4 <strlen>
    6330:	fff54e93          	not	t4,a0
    6334:	41fede93          	sra	t4,t4,0x1f
    6338:	01812803          	lw	a6,24(sp)
    633c:	01c12e03          	lw	t3,28(sp)
    6340:	02012883          	lw	a7,32(sp)
    6344:	00050d13          	mv	s10,a0
    6348:	01d57eb3          	and	t4,a0,t4
    634c:	00012823          	sw	zero,16(sp)
    6350:	f01ff06f          	j	6250 <_vfiprintf_r+0x15d4>
    6354:	06010613          	add	a2,sp,96
    6358:	00098593          	mv	a1,s3
    635c:	00040513          	mv	a0,s0
    6360:	fe0fe0ef          	jal	4b40 <__sprint_r.part.0>
    6364:	00051463          	bnez	a0,636c <_vfiprintf_r+0x16f0>
    6368:	dc5fe06f          	j	512c <_vfiprintf_r+0x4b0>
    636c:	df5fe06f          	j	5160 <_vfiprintf_r+0x4e4>
    6370:	00168613          	add	a2,a3,1
    6374:	00009317          	auipc	t1,0x9
    6378:	2ac30313          	add	t1,t1,684 # f620 <blanks.1>
    637c:	f19fe06f          	j	5294 <_vfiprintf_r+0x618>
    6380:	000f0513          	mv	a0,t5
    6384:	00009f97          	auipc	t6,0x9
    6388:	28cf8f93          	add	t6,t6,652 # f610 <zeroes.0>
    638c:	d10ff06f          	j	589c <_vfiprintf_r+0xc20>
    6390:	0649a783          	lw	a5,100(s3)
    6394:	0017f793          	and	a5,a5,1
    6398:	00079c63          	bnez	a5,63b0 <_vfiprintf_r+0x1734>
    639c:	00c9d783          	lhu	a5,12(s3)
    63a0:	2007f793          	and	a5,a5,512
    63a4:	00079663          	bnez	a5,63b0 <_vfiprintf_r+0x1734>
    63a8:	0589a503          	lw	a0,88(s3)
    63ac:	aa5fa0ef          	jal	e50 <__retarget_lock_release_recursive>
    63b0:	fff00793          	li	a5,-1
    63b4:	00f12623          	sw	a5,12(sp)
    63b8:	de5fe06f          	j	519c <_vfiprintf_r+0x520>
    63bc:	00098713          	mv	a4,s3
    63c0:	000c8a93          	mv	s5,s9
    63c4:	000d0993          	mv	s3,s10
    63c8:	01012c03          	lw	s8,16(sp)
    63cc:	01812e03          	lw	t3,24(sp)
    63d0:	01c12803          	lw	a6,28(sp)
    63d4:	02012883          	lw	a7,32(sp)
    63d8:	000d8c93          	mv	s9,s11
    63dc:	00070d13          	mv	s10,a4
    63e0:	bcdff06f          	j	5fac <_vfiprintf_r+0x1330>
    63e4:	00cd1783          	lh	a5,12(s10)
    63e8:	000d0993          	mv	s3,s10
    63ec:	0407e793          	or	a5,a5,64
    63f0:	00fd1623          	sh	a5,12(s10)
    63f4:	d71fe06f          	j	5164 <_vfiprintf_r+0x4e8>
    63f8:	00c99783          	lh	a5,12(s3)
    63fc:	0407e793          	or	a5,a5,64
    6400:	00f99623          	sh	a5,12(s3)
    6404:	d61fe06f          	j	5164 <_vfiprintf_r+0x4e8>
    6408:	000aa703          	lw	a4,0(s5)
    640c:	004a8a93          	add	s5,s5,4
    6410:	00075463          	bgez	a4,6418 <_vfiprintf_r+0x179c>
    6414:	fff00713          	li	a4,-1
    6418:	001cc683          	lbu	a3,1(s9)
    641c:	00058c93          	mv	s9,a1
    6420:	9ddfe06f          	j	4dfc <_vfiprintf_r+0x180>
    6424:	00c9d783          	lhu	a5,12(s3)
    6428:	0407e793          	or	a5,a5,64
    642c:	00f99623          	sh	a5,12(s3)
    6430:	d1dfe06f          	j	514c <_vfiprintf_r+0x4d0>

00006434 <__sbprintf>:
    6434:	b7010113          	add	sp,sp,-1168
    6438:	00c59783          	lh	a5,12(a1)
    643c:	00e5d703          	lhu	a4,14(a1)
    6440:	48812423          	sw	s0,1160(sp)
    6444:	00058413          	mv	s0,a1
    6448:	000105b7          	lui	a1,0x10
    644c:	ffd58593          	add	a1,a1,-3 # fffd <__crt0_copy_data_src_begin+0x78d>
    6450:	06442303          	lw	t1,100(s0)
    6454:	01c42883          	lw	a7,28(s0)
    6458:	02442803          	lw	a6,36(s0)
    645c:	01071713          	sll	a4,a4,0x10
    6460:	00b7f7b3          	and	a5,a5,a1
    6464:	00e7e7b3          	or	a5,a5,a4
    6468:	40000593          	li	a1,1024
    646c:	49212023          	sw	s2,1152(sp)
    6470:	00f12a23          	sw	a5,20(sp)
    6474:	00050913          	mv	s2,a0
    6478:	07010793          	add	a5,sp,112
    647c:	06010513          	add	a0,sp,96
    6480:	48112623          	sw	ra,1164(sp)
    6484:	48912223          	sw	s1,1156(sp)
    6488:	47312e23          	sw	s3,1148(sp)
    648c:	00060493          	mv	s1,a2
    6490:	00068993          	mv	s3,a3
    6494:	06612623          	sw	t1,108(sp)
    6498:	03112223          	sw	a7,36(sp)
    649c:	03012623          	sw	a6,44(sp)
    64a0:	00f12423          	sw	a5,8(sp)
    64a4:	00f12c23          	sw	a5,24(sp)
    64a8:	00b12823          	sw	a1,16(sp)
    64ac:	00b12e23          	sw	a1,28(sp)
    64b0:	02012023          	sw	zero,32(sp)
    64b4:	991fa0ef          	jal	e44 <__retarget_lock_init_recursive>
    64b8:	00048613          	mv	a2,s1
    64bc:	00098693          	mv	a3,s3
    64c0:	00810593          	add	a1,sp,8
    64c4:	00090513          	mv	a0,s2
    64c8:	fb4fe0ef          	jal	4c7c <_vfiprintf_r>
    64cc:	00050493          	mv	s1,a0
    64d0:	04055263          	bgez	a0,6514 <__sbprintf+0xe0>
    64d4:	01415783          	lhu	a5,20(sp)
    64d8:	0407f793          	and	a5,a5,64
    64dc:	00078863          	beqz	a5,64ec <__sbprintf+0xb8>
    64e0:	00c45783          	lhu	a5,12(s0)
    64e4:	0407e793          	or	a5,a5,64
    64e8:	00f41623          	sh	a5,12(s0)
    64ec:	06012503          	lw	a0,96(sp)
    64f0:	959fa0ef          	jal	e48 <__retarget_lock_close_recursive>
    64f4:	48c12083          	lw	ra,1164(sp)
    64f8:	48812403          	lw	s0,1160(sp)
    64fc:	48012903          	lw	s2,1152(sp)
    6500:	47c12983          	lw	s3,1148(sp)
    6504:	00048513          	mv	a0,s1
    6508:	48412483          	lw	s1,1156(sp)
    650c:	49010113          	add	sp,sp,1168
    6510:	00008067          	ret
    6514:	00810593          	add	a1,sp,8
    6518:	00090513          	mv	a0,s2
    651c:	25c000ef          	jal	6778 <_fflush_r>
    6520:	fa050ae3          	beqz	a0,64d4 <__sbprintf+0xa0>
    6524:	fff00493          	li	s1,-1
    6528:	fadff06f          	j	64d4 <__sbprintf+0xa0>

0000652c <__sflush_r>:
    652c:	00c59703          	lh	a4,12(a1)
    6530:	fe010113          	add	sp,sp,-32
    6534:	00812c23          	sw	s0,24(sp)
    6538:	01312623          	sw	s3,12(sp)
    653c:	00112e23          	sw	ra,28(sp)
    6540:	00877793          	and	a5,a4,8
    6544:	00058413          	mv	s0,a1
    6548:	00050993          	mv	s3,a0
    654c:	12079063          	bnez	a5,666c <__sflush_r+0x140>
    6550:	000017b7          	lui	a5,0x1
    6554:	80078793          	add	a5,a5,-2048 # 800 <main+0x530>
    6558:	0045a683          	lw	a3,4(a1)
    655c:	00f767b3          	or	a5,a4,a5
    6560:	00f59623          	sh	a5,12(a1)
    6564:	18d05263          	blez	a3,66e8 <__sflush_r+0x1bc>
    6568:	02842803          	lw	a6,40(s0)
    656c:	0e080463          	beqz	a6,6654 <__sflush_r+0x128>
    6570:	00912a23          	sw	s1,20(sp)
    6574:	01371693          	sll	a3,a4,0x13
    6578:	0009a483          	lw	s1,0(s3)
    657c:	0009a023          	sw	zero,0(s3)
    6580:	01c42583          	lw	a1,28(s0)
    6584:	1606ce63          	bltz	a3,6700 <__sflush_r+0x1d4>
    6588:	00000613          	li	a2,0
    658c:	00100693          	li	a3,1
    6590:	00098513          	mv	a0,s3
    6594:	000800e7          	jalr	a6
    6598:	fff00793          	li	a5,-1
    659c:	00050613          	mv	a2,a0
    65a0:	1af50463          	beq	a0,a5,6748 <__sflush_r+0x21c>
    65a4:	00c41783          	lh	a5,12(s0)
    65a8:	02842803          	lw	a6,40(s0)
    65ac:	01c42583          	lw	a1,28(s0)
    65b0:	0047f793          	and	a5,a5,4
    65b4:	00078e63          	beqz	a5,65d0 <__sflush_r+0xa4>
    65b8:	00442703          	lw	a4,4(s0)
    65bc:	03042783          	lw	a5,48(s0)
    65c0:	40e60633          	sub	a2,a2,a4
    65c4:	00078663          	beqz	a5,65d0 <__sflush_r+0xa4>
    65c8:	03c42783          	lw	a5,60(s0)
    65cc:	40f60633          	sub	a2,a2,a5
    65d0:	00000693          	li	a3,0
    65d4:	00098513          	mv	a0,s3
    65d8:	000800e7          	jalr	a6
    65dc:	fff00793          	li	a5,-1
    65e0:	12f51463          	bne	a0,a5,6708 <__sflush_r+0x1dc>
    65e4:	0009a683          	lw	a3,0(s3)
    65e8:	01d00793          	li	a5,29
    65ec:	00c41703          	lh	a4,12(s0)
    65f0:	16d7ea63          	bltu	a5,a3,6764 <__sflush_r+0x238>
    65f4:	204007b7          	lui	a5,0x20400
    65f8:	00178793          	add	a5,a5,1 # 20400001 <__neorv32_ram_size+0x20380001>
    65fc:	00d7d7b3          	srl	a5,a5,a3
    6600:	0017f793          	and	a5,a5,1
    6604:	16078063          	beqz	a5,6764 <__sflush_r+0x238>
    6608:	01042603          	lw	a2,16(s0)
    660c:	fffff7b7          	lui	a5,0xfffff
    6610:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6614:	00f777b3          	and	a5,a4,a5
    6618:	00f41623          	sh	a5,12(s0)
    661c:	00042223          	sw	zero,4(s0)
    6620:	00c42023          	sw	a2,0(s0)
    6624:	01371793          	sll	a5,a4,0x13
    6628:	0007d463          	bgez	a5,6630 <__sflush_r+0x104>
    662c:	10068263          	beqz	a3,6730 <__sflush_r+0x204>
    6630:	03042583          	lw	a1,48(s0)
    6634:	0099a023          	sw	s1,0(s3)
    6638:	10058463          	beqz	a1,6740 <__sflush_r+0x214>
    663c:	04040793          	add	a5,s0,64
    6640:	00f58663          	beq	a1,a5,664c <__sflush_r+0x120>
    6644:	00098513          	mv	a0,s3
    6648:	c5dfa0ef          	jal	12a4 <_free_r>
    664c:	01412483          	lw	s1,20(sp)
    6650:	02042823          	sw	zero,48(s0)
    6654:	00000513          	li	a0,0
    6658:	01c12083          	lw	ra,28(sp)
    665c:	01812403          	lw	s0,24(sp)
    6660:	00c12983          	lw	s3,12(sp)
    6664:	02010113          	add	sp,sp,32
    6668:	00008067          	ret
    666c:	01212823          	sw	s2,16(sp)
    6670:	0105a903          	lw	s2,16(a1)
    6674:	08090263          	beqz	s2,66f8 <__sflush_r+0x1cc>
    6678:	00912a23          	sw	s1,20(sp)
    667c:	0005a483          	lw	s1,0(a1)
    6680:	00377713          	and	a4,a4,3
    6684:	0125a023          	sw	s2,0(a1)
    6688:	412484b3          	sub	s1,s1,s2
    668c:	00000793          	li	a5,0
    6690:	00071463          	bnez	a4,6698 <__sflush_r+0x16c>
    6694:	0145a783          	lw	a5,20(a1)
    6698:	00f42423          	sw	a5,8(s0)
    669c:	00904863          	bgtz	s1,66ac <__sflush_r+0x180>
    66a0:	0540006f          	j	66f4 <__sflush_r+0x1c8>
    66a4:	00a90933          	add	s2,s2,a0
    66a8:	04905663          	blez	s1,66f4 <__sflush_r+0x1c8>
    66ac:	02442783          	lw	a5,36(s0)
    66b0:	01c42583          	lw	a1,28(s0)
    66b4:	00048693          	mv	a3,s1
    66b8:	00090613          	mv	a2,s2
    66bc:	00098513          	mv	a0,s3
    66c0:	000780e7          	jalr	a5
    66c4:	40a484b3          	sub	s1,s1,a0
    66c8:	fca04ee3          	bgtz	a0,66a4 <__sflush_r+0x178>
    66cc:	00c41703          	lh	a4,12(s0)
    66d0:	01012903          	lw	s2,16(sp)
    66d4:	04076713          	or	a4,a4,64
    66d8:	01412483          	lw	s1,20(sp)
    66dc:	00e41623          	sh	a4,12(s0)
    66e0:	fff00513          	li	a0,-1
    66e4:	f75ff06f          	j	6658 <__sflush_r+0x12c>
    66e8:	03c5a683          	lw	a3,60(a1)
    66ec:	e6d04ee3          	bgtz	a3,6568 <__sflush_r+0x3c>
    66f0:	f65ff06f          	j	6654 <__sflush_r+0x128>
    66f4:	01412483          	lw	s1,20(sp)
    66f8:	01012903          	lw	s2,16(sp)
    66fc:	f59ff06f          	j	6654 <__sflush_r+0x128>
    6700:	05042603          	lw	a2,80(s0)
    6704:	eadff06f          	j	65b0 <__sflush_r+0x84>
    6708:	00c41703          	lh	a4,12(s0)
    670c:	01042683          	lw	a3,16(s0)
    6710:	fffff7b7          	lui	a5,0xfffff
    6714:	7ff78793          	add	a5,a5,2047 # fffff7ff <__crt0_ram_last+0x7ff7f800>
    6718:	00f777b3          	and	a5,a4,a5
    671c:	00f41623          	sh	a5,12(s0)
    6720:	00042223          	sw	zero,4(s0)
    6724:	00d42023          	sw	a3,0(s0)
    6728:	01371793          	sll	a5,a4,0x13
    672c:	f007d2e3          	bgez	a5,6630 <__sflush_r+0x104>
    6730:	03042583          	lw	a1,48(s0)
    6734:	04a42823          	sw	a0,80(s0)
    6738:	0099a023          	sw	s1,0(s3)
    673c:	f00590e3          	bnez	a1,663c <__sflush_r+0x110>
    6740:	01412483          	lw	s1,20(sp)
    6744:	f11ff06f          	j	6654 <__sflush_r+0x128>
    6748:	0009a783          	lw	a5,0(s3)
    674c:	e4078ce3          	beqz	a5,65a4 <__sflush_r+0x78>
    6750:	01d00713          	li	a4,29
    6754:	00e78c63          	beq	a5,a4,676c <__sflush_r+0x240>
    6758:	01600713          	li	a4,22
    675c:	00e78863          	beq	a5,a4,676c <__sflush_r+0x240>
    6760:	00c41703          	lh	a4,12(s0)
    6764:	04076713          	or	a4,a4,64
    6768:	f71ff06f          	j	66d8 <__sflush_r+0x1ac>
    676c:	0099a023          	sw	s1,0(s3)
    6770:	01412483          	lw	s1,20(sp)
    6774:	ee1ff06f          	j	6654 <__sflush_r+0x128>

00006778 <_fflush_r>:
    6778:	ff010113          	add	sp,sp,-16
    677c:	00812423          	sw	s0,8(sp)
    6780:	00912223          	sw	s1,4(sp)
    6784:	00112623          	sw	ra,12(sp)
    6788:	01212023          	sw	s2,0(sp)
    678c:	00050493          	mv	s1,a0
    6790:	00058413          	mv	s0,a1
    6794:	00050663          	beqz	a0,67a0 <_fflush_r+0x28>
    6798:	03452783          	lw	a5,52(a0)
    679c:	0a078a63          	beqz	a5,6850 <_fflush_r+0xd8>
    67a0:	00c41783          	lh	a5,12(s0)
    67a4:	00000913          	li	s2,0
    67a8:	04078063          	beqz	a5,67e8 <_fflush_r+0x70>
    67ac:	06442703          	lw	a4,100(s0)
    67b0:	00177713          	and	a4,a4,1
    67b4:	00071663          	bnez	a4,67c0 <_fflush_r+0x48>
    67b8:	2007f793          	and	a5,a5,512
    67bc:	04078463          	beqz	a5,6804 <_fflush_r+0x8c>
    67c0:	00040593          	mv	a1,s0
    67c4:	00048513          	mv	a0,s1
    67c8:	d65ff0ef          	jal	652c <__sflush_r>
    67cc:	06442783          	lw	a5,100(s0)
    67d0:	00050913          	mv	s2,a0
    67d4:	0017f793          	and	a5,a5,1
    67d8:	00079863          	bnez	a5,67e8 <_fflush_r+0x70>
    67dc:	00c45783          	lhu	a5,12(s0)
    67e0:	2007f793          	and	a5,a5,512
    67e4:	04078463          	beqz	a5,682c <_fflush_r+0xb4>
    67e8:	00c12083          	lw	ra,12(sp)
    67ec:	00812403          	lw	s0,8(sp)
    67f0:	00412483          	lw	s1,4(sp)
    67f4:	00090513          	mv	a0,s2
    67f8:	00012903          	lw	s2,0(sp)
    67fc:	01010113          	add	sp,sp,16
    6800:	00008067          	ret
    6804:	05842503          	lw	a0,88(s0)
    6808:	e44fa0ef          	jal	e4c <__retarget_lock_acquire_recursive>
    680c:	00040593          	mv	a1,s0
    6810:	00048513          	mv	a0,s1
    6814:	d19ff0ef          	jal	652c <__sflush_r>
    6818:	06442783          	lw	a5,100(s0)
    681c:	00050913          	mv	s2,a0
    6820:	0017f793          	and	a5,a5,1
    6824:	fc0792e3          	bnez	a5,67e8 <_fflush_r+0x70>
    6828:	fb5ff06f          	j	67dc <_fflush_r+0x64>
    682c:	05842503          	lw	a0,88(s0)
    6830:	e20fa0ef          	jal	e50 <__retarget_lock_release_recursive>
    6834:	00c12083          	lw	ra,12(sp)
    6838:	00812403          	lw	s0,8(sp)
    683c:	00412483          	lw	s1,4(sp)
    6840:	00090513          	mv	a0,s2
    6844:	00012903          	lw	s2,0(sp)
    6848:	01010113          	add	sp,sp,16
    684c:	00008067          	ret
    6850:	224000ef          	jal	6a74 <__sinit>
    6854:	f4dff06f          	j	67a0 <_fflush_r+0x28>

00006858 <stdio_exit_handler>:
    6858:	7fffa617          	auipc	a2,0x7fffa
    685c:	cd060613          	add	a2,a2,-816 # 80000528 <__sglue>
    6860:	00004597          	auipc	a1,0x4
    6864:	28c58593          	add	a1,a1,652 # aaec <_fclose_r>
    6868:	7fff9517          	auipc	a0,0x7fff9
    686c:	79850513          	add	a0,a0,1944 # 80000000 <_impure_data>
    6870:	7a00006f          	j	7010 <_fwalk_sglue>

00006874 <cleanup_stdio>:
    6874:	00452583          	lw	a1,4(a0)
    6878:	ff010113          	add	sp,sp,-16
    687c:	00812423          	sw	s0,8(sp)
    6880:	00112623          	sw	ra,12(sp)
    6884:	7fffa797          	auipc	a5,0x7fffa
    6888:	f1878793          	add	a5,a5,-232 # 8000079c <__sf>
    688c:	00050413          	mv	s0,a0
    6890:	00f58463          	beq	a1,a5,6898 <cleanup_stdio+0x24>
    6894:	258040ef          	jal	aaec <_fclose_r>
    6898:	00842583          	lw	a1,8(s0)
    689c:	7fffa797          	auipc	a5,0x7fffa
    68a0:	f6878793          	add	a5,a5,-152 # 80000804 <__global_pointer+0x4>
    68a4:	00f58663          	beq	a1,a5,68b0 <cleanup_stdio+0x3c>
    68a8:	00040513          	mv	a0,s0
    68ac:	240040ef          	jal	aaec <_fclose_r>
    68b0:	00c42583          	lw	a1,12(s0)
    68b4:	7fffa797          	auipc	a5,0x7fffa
    68b8:	fb878793          	add	a5,a5,-72 # 8000086c <__global_pointer+0x6c>
    68bc:	00f58c63          	beq	a1,a5,68d4 <cleanup_stdio+0x60>
    68c0:	00040513          	mv	a0,s0
    68c4:	00812403          	lw	s0,8(sp)
    68c8:	00c12083          	lw	ra,12(sp)
    68cc:	01010113          	add	sp,sp,16
    68d0:	21c0406f          	j	aaec <_fclose_r>
    68d4:	00c12083          	lw	ra,12(sp)
    68d8:	00812403          	lw	s0,8(sp)
    68dc:	01010113          	add	sp,sp,16
    68e0:	00008067          	ret

000068e4 <global_stdio_init.part.0>:
    68e4:	fe010113          	add	sp,sp,-32
    68e8:	00000797          	auipc	a5,0x0
    68ec:	f7078793          	add	a5,a5,-144 # 6858 <stdio_exit_handler>
    68f0:	00112e23          	sw	ra,28(sp)
    68f4:	00812c23          	sw	s0,24(sp)
    68f8:	00912a23          	sw	s1,20(sp)
    68fc:	7fffa417          	auipc	s0,0x7fffa
    6900:	ea040413          	add	s0,s0,-352 # 8000079c <__sf>
    6904:	01212823          	sw	s2,16(sp)
    6908:	01312623          	sw	s3,12(sp)
    690c:	01412423          	sw	s4,8(sp)
    6910:	00800613          	li	a2,8
    6914:	00000593          	li	a1,0
    6918:	7fffa717          	auipc	a4,0x7fffa
    691c:	e0f72c23          	sw	a5,-488(a4) # 80000730 <__stdio_exit_handler>
    6920:	7fffa517          	auipc	a0,0x7fffa
    6924:	ed850513          	add	a0,a0,-296 # 800007f8 <__sf+0x5c>
    6928:	00400793          	li	a5,4
    692c:	00f42623          	sw	a5,12(s0)
    6930:	00042023          	sw	zero,0(s0)
    6934:	00042223          	sw	zero,4(s0)
    6938:	00042423          	sw	zero,8(s0)
    693c:	06042223          	sw	zero,100(s0)
    6940:	00042823          	sw	zero,16(s0)
    6944:	00042a23          	sw	zero,20(s0)
    6948:	00042c23          	sw	zero,24(s0)
    694c:	d08fa0ef          	jal	e54 <memset>
    6950:	00001a17          	auipc	s4,0x1
    6954:	870a0a13          	add	s4,s4,-1936 # 71c0 <__sread>
    6958:	00001997          	auipc	s3,0x1
    695c:	8c498993          	add	s3,s3,-1852 # 721c <__swrite>
    6960:	00001917          	auipc	s2,0x1
    6964:	94490913          	add	s2,s2,-1724 # 72a4 <__sseek>
    6968:	00001497          	auipc	s1,0x1
    696c:	9b448493          	add	s1,s1,-1612 # 731c <__sclose>
    6970:	7fffa517          	auipc	a0,0x7fffa
    6974:	e8450513          	add	a0,a0,-380 # 800007f4 <__sf+0x58>
    6978:	03442023          	sw	s4,32(s0)
    697c:	03342223          	sw	s3,36(s0)
    6980:	03242423          	sw	s2,40(s0)
    6984:	02942623          	sw	s1,44(s0)
    6988:	00842e23          	sw	s0,28(s0)
    698c:	cb8fa0ef          	jal	e44 <__retarget_lock_init_recursive>
    6990:	000107b7          	lui	a5,0x10
    6994:	00978793          	add	a5,a5,9 # 10009 <__crt0_copy_data_src_begin+0x799>
    6998:	00800613          	li	a2,8
    699c:	00000593          	li	a1,0
    69a0:	7fffa517          	auipc	a0,0x7fffa
    69a4:	ec050513          	add	a0,a0,-320 # 80000860 <__global_pointer+0x60>
    69a8:	06f42a23          	sw	a5,116(s0)
    69ac:	06042423          	sw	zero,104(s0)
    69b0:	06042623          	sw	zero,108(s0)
    69b4:	06042823          	sw	zero,112(s0)
    69b8:	0c042623          	sw	zero,204(s0)
    69bc:	06042c23          	sw	zero,120(s0)
    69c0:	06042e23          	sw	zero,124(s0)
    69c4:	08042023          	sw	zero,128(s0)
    69c8:	c8cfa0ef          	jal	e54 <memset>
    69cc:	7fffa797          	auipc	a5,0x7fffa
    69d0:	e3878793          	add	a5,a5,-456 # 80000804 <__global_pointer+0x4>
    69d4:	7fffa517          	auipc	a0,0x7fffa
    69d8:	e8850513          	add	a0,a0,-376 # 8000085c <__global_pointer+0x5c>
    69dc:	08f42223          	sw	a5,132(s0)
    69e0:	09442423          	sw	s4,136(s0)
    69e4:	09342623          	sw	s3,140(s0)
    69e8:	09242823          	sw	s2,144(s0)
    69ec:	08942a23          	sw	s1,148(s0)
    69f0:	c54fa0ef          	jal	e44 <__retarget_lock_init_recursive>
    69f4:	000207b7          	lui	a5,0x20
    69f8:	01278793          	add	a5,a5,18 # 20012 <__neorv32_rom_size+0x12>
    69fc:	00800613          	li	a2,8
    6a00:	00000593          	li	a1,0
    6a04:	7fffa517          	auipc	a0,0x7fffa
    6a08:	ec450513          	add	a0,a0,-316 # 800008c8 <__global_pointer+0xc8>
    6a0c:	0cf42e23          	sw	a5,220(s0)
    6a10:	0c042823          	sw	zero,208(s0)
    6a14:	0c042a23          	sw	zero,212(s0)
    6a18:	0c042c23          	sw	zero,216(s0)
    6a1c:	12042a23          	sw	zero,308(s0)
    6a20:	0e042023          	sw	zero,224(s0)
    6a24:	0e042223          	sw	zero,228(s0)
    6a28:	0e042423          	sw	zero,232(s0)
    6a2c:	c28fa0ef          	jal	e54 <memset>
    6a30:	7fffa797          	auipc	a5,0x7fffa
    6a34:	e3c78793          	add	a5,a5,-452 # 8000086c <__global_pointer+0x6c>
    6a38:	0f442823          	sw	s4,240(s0)
    6a3c:	0f342a23          	sw	s3,244(s0)
    6a40:	0f242c23          	sw	s2,248(s0)
    6a44:	0e942e23          	sw	s1,252(s0)
    6a48:	0ef42623          	sw	a5,236(s0)
    6a4c:	01812403          	lw	s0,24(sp)
    6a50:	01c12083          	lw	ra,28(sp)
    6a54:	01412483          	lw	s1,20(sp)
    6a58:	01012903          	lw	s2,16(sp)
    6a5c:	00c12983          	lw	s3,12(sp)
    6a60:	00812a03          	lw	s4,8(sp)
    6a64:	7fffa517          	auipc	a0,0x7fffa
    6a68:	e6050513          	add	a0,a0,-416 # 800008c4 <__global_pointer+0xc4>
    6a6c:	02010113          	add	sp,sp,32
    6a70:	bd4fa06f          	j	e44 <__retarget_lock_init_recursive>

00006a74 <__sinit>:
    6a74:	ff010113          	add	sp,sp,-16
    6a78:	00812423          	sw	s0,8(sp)
    6a7c:	00050413          	mv	s0,a0
    6a80:	7fffa517          	auipc	a0,0x7fffa
    6a84:	ca050513          	add	a0,a0,-864 # 80000720 <__lock___sfp_recursive_mutex>
    6a88:	00112623          	sw	ra,12(sp)
    6a8c:	bc0fa0ef          	jal	e4c <__retarget_lock_acquire_recursive>
    6a90:	03442783          	lw	a5,52(s0)
    6a94:	00079e63          	bnez	a5,6ab0 <__sinit+0x3c>
    6a98:	00000797          	auipc	a5,0x0
    6a9c:	ddc78793          	add	a5,a5,-548 # 6874 <cleanup_stdio>
    6aa0:	02f42a23          	sw	a5,52(s0)
    6aa4:	7fffa797          	auipc	a5,0x7fffa
    6aa8:	c8c7a783          	lw	a5,-884(a5) # 80000730 <__stdio_exit_handler>
    6aac:	00078e63          	beqz	a5,6ac8 <__sinit+0x54>
    6ab0:	00812403          	lw	s0,8(sp)
    6ab4:	00c12083          	lw	ra,12(sp)
    6ab8:	7fffa517          	auipc	a0,0x7fffa
    6abc:	c6850513          	add	a0,a0,-920 # 80000720 <__lock___sfp_recursive_mutex>
    6ac0:	01010113          	add	sp,sp,16
    6ac4:	b8cfa06f          	j	e50 <__retarget_lock_release_recursive>
    6ac8:	e1dff0ef          	jal	68e4 <global_stdio_init.part.0>
    6acc:	00812403          	lw	s0,8(sp)
    6ad0:	00c12083          	lw	ra,12(sp)
    6ad4:	7fffa517          	auipc	a0,0x7fffa
    6ad8:	c4c50513          	add	a0,a0,-948 # 80000720 <__lock___sfp_recursive_mutex>
    6adc:	01010113          	add	sp,sp,16
    6ae0:	b70fa06f          	j	e50 <__retarget_lock_release_recursive>

00006ae4 <__sfp_lock_acquire>:
    6ae4:	7fffa517          	auipc	a0,0x7fffa
    6ae8:	c3c50513          	add	a0,a0,-964 # 80000720 <__lock___sfp_recursive_mutex>
    6aec:	b60fa06f          	j	e4c <__retarget_lock_acquire_recursive>

00006af0 <__sfp_lock_release>:
    6af0:	7fffa517          	auipc	a0,0x7fffa
    6af4:	c3050513          	add	a0,a0,-976 # 80000720 <__lock___sfp_recursive_mutex>
    6af8:	b58fa06f          	j	e50 <__retarget_lock_release_recursive>

00006afc <__sfvwrite_r>:
    6afc:	00862783          	lw	a5,8(a2)
    6b00:	2c078463          	beqz	a5,6dc8 <__sfvwrite_r+0x2cc>
    6b04:	00c59683          	lh	a3,12(a1)
    6b08:	fd010113          	add	sp,sp,-48
    6b0c:	02812423          	sw	s0,40(sp)
    6b10:	01412c23          	sw	s4,24(sp)
    6b14:	01612823          	sw	s6,16(sp)
    6b18:	02112623          	sw	ra,44(sp)
    6b1c:	0086f793          	and	a5,a3,8
    6b20:	00060b13          	mv	s6,a2
    6b24:	00050a13          	mv	s4,a0
    6b28:	00058413          	mv	s0,a1
    6b2c:	08078e63          	beqz	a5,6bc8 <__sfvwrite_r+0xcc>
    6b30:	0105a783          	lw	a5,16(a1)
    6b34:	08078a63          	beqz	a5,6bc8 <__sfvwrite_r+0xcc>
    6b38:	02912223          	sw	s1,36(sp)
    6b3c:	03212023          	sw	s2,32(sp)
    6b40:	01312e23          	sw	s3,28(sp)
    6b44:	01512a23          	sw	s5,20(sp)
    6b48:	0026f793          	and	a5,a3,2
    6b4c:	000b2483          	lw	s1,0(s6)
    6b50:	0a078463          	beqz	a5,6bf8 <__sfvwrite_r+0xfc>
    6b54:	02442783          	lw	a5,36(s0)
    6b58:	01c42583          	lw	a1,28(s0)
    6b5c:	80000ab7          	lui	s5,0x80000
    6b60:	00000993          	li	s3,0
    6b64:	00000913          	li	s2,0
    6b68:	c00a8a93          	add	s5,s5,-1024 # 7ffffc00 <__neorv32_ram_size+0x7ff7fc00>
    6b6c:	00098613          	mv	a2,s3
    6b70:	000a0513          	mv	a0,s4
    6b74:	04090263          	beqz	s2,6bb8 <__sfvwrite_r+0xbc>
    6b78:	00090693          	mv	a3,s2
    6b7c:	012af463          	bgeu	s5,s2,6b84 <__sfvwrite_r+0x88>
    6b80:	000a8693          	mv	a3,s5
    6b84:	000780e7          	jalr	a5
    6b88:	46a05263          	blez	a0,6fec <__sfvwrite_r+0x4f0>
    6b8c:	008b2783          	lw	a5,8(s6)
    6b90:	00a989b3          	add	s3,s3,a0
    6b94:	40a90933          	sub	s2,s2,a0
    6b98:	40a787b3          	sub	a5,a5,a0
    6b9c:	00fb2423          	sw	a5,8(s6)
    6ba0:	1a078663          	beqz	a5,6d4c <__sfvwrite_r+0x250>
    6ba4:	02442783          	lw	a5,36(s0)
    6ba8:	01c42583          	lw	a1,28(s0)
    6bac:	00098613          	mv	a2,s3
    6bb0:	000a0513          	mv	a0,s4
    6bb4:	fc0912e3          	bnez	s2,6b78 <__sfvwrite_r+0x7c>
    6bb8:	0004a983          	lw	s3,0(s1)
    6bbc:	0044a903          	lw	s2,4(s1)
    6bc0:	00848493          	add	s1,s1,8
    6bc4:	fa9ff06f          	j	6b6c <__sfvwrite_r+0x70>
    6bc8:	00040593          	mv	a1,s0
    6bcc:	000a0513          	mv	a0,s4
    6bd0:	0e5000ef          	jal	74b4 <__swsetup_r>
    6bd4:	1c051c63          	bnez	a0,6dac <__sfvwrite_r+0x2b0>
    6bd8:	00c41683          	lh	a3,12(s0)
    6bdc:	02912223          	sw	s1,36(sp)
    6be0:	03212023          	sw	s2,32(sp)
    6be4:	01312e23          	sw	s3,28(sp)
    6be8:	01512a23          	sw	s5,20(sp)
    6bec:	0026f793          	and	a5,a3,2
    6bf0:	000b2483          	lw	s1,0(s6)
    6bf4:	f60790e3          	bnez	a5,6b54 <__sfvwrite_r+0x58>
    6bf8:	01712623          	sw	s7,12(sp)
    6bfc:	01812423          	sw	s8,8(sp)
    6c00:	0016f793          	and	a5,a3,1
    6c04:	1c079663          	bnez	a5,6dd0 <__sfvwrite_r+0x2d4>
    6c08:	00042783          	lw	a5,0(s0)
    6c0c:	00842703          	lw	a4,8(s0)
    6c10:	80000ab7          	lui	s5,0x80000
    6c14:	01912223          	sw	s9,4(sp)
    6c18:	00000b93          	li	s7,0
    6c1c:	00000993          	li	s3,0
    6c20:	fffa8a93          	add	s5,s5,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    6c24:	00078513          	mv	a0,a5
    6c28:	00070c13          	mv	s8,a4
    6c2c:	10098263          	beqz	s3,6d30 <__sfvwrite_r+0x234>
    6c30:	2006f613          	and	a2,a3,512
    6c34:	28060863          	beqz	a2,6ec4 <__sfvwrite_r+0x3c8>
    6c38:	00070c93          	mv	s9,a4
    6c3c:	32e9e863          	bltu	s3,a4,6f6c <__sfvwrite_r+0x470>
    6c40:	4806f713          	and	a4,a3,1152
    6c44:	08070a63          	beqz	a4,6cd8 <__sfvwrite_r+0x1dc>
    6c48:	01442603          	lw	a2,20(s0)
    6c4c:	01042583          	lw	a1,16(s0)
    6c50:	00161713          	sll	a4,a2,0x1
    6c54:	00c70733          	add	a4,a4,a2
    6c58:	40b78933          	sub	s2,a5,a1
    6c5c:	01f75c13          	srl	s8,a4,0x1f
    6c60:	00ec0c33          	add	s8,s8,a4
    6c64:	00190793          	add	a5,s2,1
    6c68:	401c5c13          	sra	s8,s8,0x1
    6c6c:	013787b3          	add	a5,a5,s3
    6c70:	000c0613          	mv	a2,s8
    6c74:	00fc7663          	bgeu	s8,a5,6c80 <__sfvwrite_r+0x184>
    6c78:	00078c13          	mv	s8,a5
    6c7c:	00078613          	mv	a2,a5
    6c80:	4006f693          	and	a3,a3,1024
    6c84:	32068063          	beqz	a3,6fa4 <__sfvwrite_r+0x4a8>
    6c88:	00060593          	mv	a1,a2
    6c8c:	000a0513          	mv	a0,s4
    6c90:	921fa0ef          	jal	15b0 <_malloc_r>
    6c94:	00050c93          	mv	s9,a0
    6c98:	34050e63          	beqz	a0,6ff4 <__sfvwrite_r+0x4f8>
    6c9c:	01042583          	lw	a1,16(s0)
    6ca0:	00090613          	mv	a2,s2
    6ca4:	a8cfa0ef          	jal	f30 <memcpy>
    6ca8:	00c45783          	lhu	a5,12(s0)
    6cac:	b7f7f793          	and	a5,a5,-1153
    6cb0:	0807e793          	or	a5,a5,128
    6cb4:	00f41623          	sh	a5,12(s0)
    6cb8:	012c8533          	add	a0,s9,s2
    6cbc:	412c07b3          	sub	a5,s8,s2
    6cc0:	01942823          	sw	s9,16(s0)
    6cc4:	01842a23          	sw	s8,20(s0)
    6cc8:	00a42023          	sw	a0,0(s0)
    6ccc:	00098c13          	mv	s8,s3
    6cd0:	00f42423          	sw	a5,8(s0)
    6cd4:	00098c93          	mv	s9,s3
    6cd8:	000c8613          	mv	a2,s9
    6cdc:	000b8593          	mv	a1,s7
    6ce0:	6a9000ef          	jal	7b88 <memmove>
    6ce4:	00842703          	lw	a4,8(s0)
    6ce8:	00042783          	lw	a5,0(s0)
    6cec:	00098913          	mv	s2,s3
    6cf0:	41870733          	sub	a4,a4,s8
    6cf4:	019787b3          	add	a5,a5,s9
    6cf8:	00e42423          	sw	a4,8(s0)
    6cfc:	00f42023          	sw	a5,0(s0)
    6d00:	00000993          	li	s3,0
    6d04:	008b2783          	lw	a5,8(s6)
    6d08:	012b8bb3          	add	s7,s7,s2
    6d0c:	412787b3          	sub	a5,a5,s2
    6d10:	00fb2423          	sw	a5,8(s6)
    6d14:	02078663          	beqz	a5,6d40 <__sfvwrite_r+0x244>
    6d18:	00042783          	lw	a5,0(s0)
    6d1c:	00842703          	lw	a4,8(s0)
    6d20:	00c41683          	lh	a3,12(s0)
    6d24:	00078513          	mv	a0,a5
    6d28:	00070c13          	mv	s8,a4
    6d2c:	f00992e3          	bnez	s3,6c30 <__sfvwrite_r+0x134>
    6d30:	0004ab83          	lw	s7,0(s1)
    6d34:	0044a983          	lw	s3,4(s1)
    6d38:	00848493          	add	s1,s1,8
    6d3c:	ee9ff06f          	j	6c24 <__sfvwrite_r+0x128>
    6d40:	00c12b83          	lw	s7,12(sp)
    6d44:	00812c03          	lw	s8,8(sp)
    6d48:	00412c83          	lw	s9,4(sp)
    6d4c:	02c12083          	lw	ra,44(sp)
    6d50:	02812403          	lw	s0,40(sp)
    6d54:	02412483          	lw	s1,36(sp)
    6d58:	02012903          	lw	s2,32(sp)
    6d5c:	01c12983          	lw	s3,28(sp)
    6d60:	01412a83          	lw	s5,20(sp)
    6d64:	01812a03          	lw	s4,24(sp)
    6d68:	01012b03          	lw	s6,16(sp)
    6d6c:	00000513          	li	a0,0
    6d70:	03010113          	add	sp,sp,48
    6d74:	00008067          	ret
    6d78:	00040593          	mv	a1,s0
    6d7c:	000a0513          	mv	a0,s4
    6d80:	9f9ff0ef          	jal	6778 <_fflush_r>
    6d84:	0a050e63          	beqz	a0,6e40 <__sfvwrite_r+0x344>
    6d88:	00c41783          	lh	a5,12(s0)
    6d8c:	00c12b83          	lw	s7,12(sp)
    6d90:	00812c03          	lw	s8,8(sp)
    6d94:	02412483          	lw	s1,36(sp)
    6d98:	02012903          	lw	s2,32(sp)
    6d9c:	01c12983          	lw	s3,28(sp)
    6da0:	01412a83          	lw	s5,20(sp)
    6da4:	0407e793          	or	a5,a5,64
    6da8:	00f41623          	sh	a5,12(s0)
    6dac:	02c12083          	lw	ra,44(sp)
    6db0:	02812403          	lw	s0,40(sp)
    6db4:	01812a03          	lw	s4,24(sp)
    6db8:	01012b03          	lw	s6,16(sp)
    6dbc:	fff00513          	li	a0,-1
    6dc0:	03010113          	add	sp,sp,48
    6dc4:	00008067          	ret
    6dc8:	00000513          	li	a0,0
    6dcc:	00008067          	ret
    6dd0:	00000a93          	li	s5,0
    6dd4:	00000513          	li	a0,0
    6dd8:	00000c13          	li	s8,0
    6ddc:	00000993          	li	s3,0
    6de0:	08098263          	beqz	s3,6e64 <__sfvwrite_r+0x368>
    6de4:	08050a63          	beqz	a0,6e78 <__sfvwrite_r+0x37c>
    6de8:	000a8793          	mv	a5,s5
    6dec:	00098b93          	mv	s7,s3
    6df0:	0137f463          	bgeu	a5,s3,6df8 <__sfvwrite_r+0x2fc>
    6df4:	00078b93          	mv	s7,a5
    6df8:	00042503          	lw	a0,0(s0)
    6dfc:	01042783          	lw	a5,16(s0)
    6e00:	00842903          	lw	s2,8(s0)
    6e04:	01442683          	lw	a3,20(s0)
    6e08:	00a7f663          	bgeu	a5,a0,6e14 <__sfvwrite_r+0x318>
    6e0c:	00d90933          	add	s2,s2,a3
    6e10:	09794463          	blt	s2,s7,6e98 <__sfvwrite_r+0x39c>
    6e14:	16dbc263          	blt	s7,a3,6f78 <__sfvwrite_r+0x47c>
    6e18:	02442783          	lw	a5,36(s0)
    6e1c:	01c42583          	lw	a1,28(s0)
    6e20:	000c0613          	mv	a2,s8
    6e24:	000a0513          	mv	a0,s4
    6e28:	000780e7          	jalr	a5
    6e2c:	00050913          	mv	s2,a0
    6e30:	f4a05ce3          	blez	a0,6d88 <__sfvwrite_r+0x28c>
    6e34:	412a8ab3          	sub	s5,s5,s2
    6e38:	00100513          	li	a0,1
    6e3c:	f20a8ee3          	beqz	s5,6d78 <__sfvwrite_r+0x27c>
    6e40:	008b2783          	lw	a5,8(s6)
    6e44:	012c0c33          	add	s8,s8,s2
    6e48:	412989b3          	sub	s3,s3,s2
    6e4c:	412787b3          	sub	a5,a5,s2
    6e50:	00fb2423          	sw	a5,8(s6)
    6e54:	f80796e3          	bnez	a5,6de0 <__sfvwrite_r+0x2e4>
    6e58:	00c12b83          	lw	s7,12(sp)
    6e5c:	00812c03          	lw	s8,8(sp)
    6e60:	eedff06f          	j	6d4c <__sfvwrite_r+0x250>
    6e64:	0044a983          	lw	s3,4(s1)
    6e68:	00048793          	mv	a5,s1
    6e6c:	00848493          	add	s1,s1,8
    6e70:	fe098ae3          	beqz	s3,6e64 <__sfvwrite_r+0x368>
    6e74:	0007ac03          	lw	s8,0(a5)
    6e78:	00098613          	mv	a2,s3
    6e7c:	00a00593          	li	a1,10
    6e80:	000c0513          	mv	a0,s8
    6e84:	1a1000ef          	jal	7824 <memchr>
    6e88:	14050c63          	beqz	a0,6fe0 <__sfvwrite_r+0x4e4>
    6e8c:	00150513          	add	a0,a0,1
    6e90:	41850ab3          	sub	s5,a0,s8
    6e94:	f55ff06f          	j	6de8 <__sfvwrite_r+0x2ec>
    6e98:	000c0593          	mv	a1,s8
    6e9c:	00090613          	mv	a2,s2
    6ea0:	4e9000ef          	jal	7b88 <memmove>
    6ea4:	00042783          	lw	a5,0(s0)
    6ea8:	00040593          	mv	a1,s0
    6eac:	000a0513          	mv	a0,s4
    6eb0:	012787b3          	add	a5,a5,s2
    6eb4:	00f42023          	sw	a5,0(s0)
    6eb8:	8c1ff0ef          	jal	6778 <_fflush_r>
    6ebc:	f6050ce3          	beqz	a0,6e34 <__sfvwrite_r+0x338>
    6ec0:	ec9ff06f          	j	6d88 <__sfvwrite_r+0x28c>
    6ec4:	01042683          	lw	a3,16(s0)
    6ec8:	04f6e463          	bltu	a3,a5,6f10 <__sfvwrite_r+0x414>
    6ecc:	01442583          	lw	a1,20(s0)
    6ed0:	04b9e063          	bltu	s3,a1,6f10 <__sfvwrite_r+0x414>
    6ed4:	00098913          	mv	s2,s3
    6ed8:	013af463          	bgeu	s5,s3,6ee0 <__sfvwrite_r+0x3e4>
    6edc:	000a8913          	mv	s2,s5
    6ee0:	00090513          	mv	a0,s2
    6ee4:	65d070ef          	jal	ed40 <__modsi3>
    6ee8:	02442783          	lw	a5,36(s0)
    6eec:	01c42583          	lw	a1,28(s0)
    6ef0:	40a906b3          	sub	a3,s2,a0
    6ef4:	000b8613          	mv	a2,s7
    6ef8:	000a0513          	mv	a0,s4
    6efc:	000780e7          	jalr	a5
    6f00:	00050913          	mv	s2,a0
    6f04:	04a05a63          	blez	a0,6f58 <__sfvwrite_r+0x45c>
    6f08:	412989b3          	sub	s3,s3,s2
    6f0c:	df9ff06f          	j	6d04 <__sfvwrite_r+0x208>
    6f10:	00070913          	mv	s2,a4
    6f14:	00e9f463          	bgeu	s3,a4,6f1c <__sfvwrite_r+0x420>
    6f18:	00098913          	mv	s2,s3
    6f1c:	00078513          	mv	a0,a5
    6f20:	00090613          	mv	a2,s2
    6f24:	000b8593          	mv	a1,s7
    6f28:	461000ef          	jal	7b88 <memmove>
    6f2c:	00842703          	lw	a4,8(s0)
    6f30:	00042783          	lw	a5,0(s0)
    6f34:	41270733          	sub	a4,a4,s2
    6f38:	012787b3          	add	a5,a5,s2
    6f3c:	00e42423          	sw	a4,8(s0)
    6f40:	00f42023          	sw	a5,0(s0)
    6f44:	fc0712e3          	bnez	a4,6f08 <__sfvwrite_r+0x40c>
    6f48:	00040593          	mv	a1,s0
    6f4c:	000a0513          	mv	a0,s4
    6f50:	829ff0ef          	jal	6778 <_fflush_r>
    6f54:	fa050ae3          	beqz	a0,6f08 <__sfvwrite_r+0x40c>
    6f58:	00c41783          	lh	a5,12(s0)
    6f5c:	00c12b83          	lw	s7,12(sp)
    6f60:	00812c03          	lw	s8,8(sp)
    6f64:	00412c83          	lw	s9,4(sp)
    6f68:	e2dff06f          	j	6d94 <__sfvwrite_r+0x298>
    6f6c:	00098c13          	mv	s8,s3
    6f70:	00098c93          	mv	s9,s3
    6f74:	d65ff06f          	j	6cd8 <__sfvwrite_r+0x1dc>
    6f78:	000b8613          	mv	a2,s7
    6f7c:	000c0593          	mv	a1,s8
    6f80:	409000ef          	jal	7b88 <memmove>
    6f84:	00842703          	lw	a4,8(s0)
    6f88:	00042783          	lw	a5,0(s0)
    6f8c:	000b8913          	mv	s2,s7
    6f90:	41770733          	sub	a4,a4,s7
    6f94:	017787b3          	add	a5,a5,s7
    6f98:	00e42423          	sw	a4,8(s0)
    6f9c:	00f42023          	sw	a5,0(s0)
    6fa0:	e95ff06f          	j	6e34 <__sfvwrite_r+0x338>
    6fa4:	000a0513          	mv	a0,s4
    6fa8:	508030ef          	jal	a4b0 <_realloc_r>
    6fac:	00050c93          	mv	s9,a0
    6fb0:	d00514e3          	bnez	a0,6cb8 <__sfvwrite_r+0x1bc>
    6fb4:	01042583          	lw	a1,16(s0)
    6fb8:	000a0513          	mv	a0,s4
    6fbc:	ae8fa0ef          	jal	12a4 <_free_r>
    6fc0:	00c41783          	lh	a5,12(s0)
    6fc4:	00c00713          	li	a4,12
    6fc8:	00c12b83          	lw	s7,12(sp)
    6fcc:	00812c03          	lw	s8,8(sp)
    6fd0:	00412c83          	lw	s9,4(sp)
    6fd4:	00ea2023          	sw	a4,0(s4)
    6fd8:	f7f7f793          	and	a5,a5,-129
    6fdc:	db9ff06f          	j	6d94 <__sfvwrite_r+0x298>
    6fe0:	00198793          	add	a5,s3,1
    6fe4:	00078a93          	mv	s5,a5
    6fe8:	e05ff06f          	j	6dec <__sfvwrite_r+0x2f0>
    6fec:	00c41783          	lh	a5,12(s0)
    6ff0:	da5ff06f          	j	6d94 <__sfvwrite_r+0x298>
    6ff4:	00c00713          	li	a4,12
    6ff8:	00c41783          	lh	a5,12(s0)
    6ffc:	00c12b83          	lw	s7,12(sp)
    7000:	00812c03          	lw	s8,8(sp)
    7004:	00412c83          	lw	s9,4(sp)
    7008:	00ea2023          	sw	a4,0(s4)
    700c:	d89ff06f          	j	6d94 <__sfvwrite_r+0x298>

00007010 <_fwalk_sglue>:
    7010:	fd010113          	add	sp,sp,-48
    7014:	03212023          	sw	s2,32(sp)
    7018:	01312e23          	sw	s3,28(sp)
    701c:	01412c23          	sw	s4,24(sp)
    7020:	01512a23          	sw	s5,20(sp)
    7024:	01612823          	sw	s6,16(sp)
    7028:	01712623          	sw	s7,12(sp)
    702c:	02112623          	sw	ra,44(sp)
    7030:	02812423          	sw	s0,40(sp)
    7034:	02912223          	sw	s1,36(sp)
    7038:	00050b13          	mv	s6,a0
    703c:	00058b93          	mv	s7,a1
    7040:	00060a93          	mv	s5,a2
    7044:	00000a13          	li	s4,0
    7048:	00100993          	li	s3,1
    704c:	fff00913          	li	s2,-1
    7050:	004aa483          	lw	s1,4(s5)
    7054:	008aa403          	lw	s0,8(s5)
    7058:	fff48493          	add	s1,s1,-1
    705c:	0204c863          	bltz	s1,708c <_fwalk_sglue+0x7c>
    7060:	00c45783          	lhu	a5,12(s0)
    7064:	00f9fe63          	bgeu	s3,a5,7080 <_fwalk_sglue+0x70>
    7068:	00e41783          	lh	a5,14(s0)
    706c:	00040593          	mv	a1,s0
    7070:	000b0513          	mv	a0,s6
    7074:	01278663          	beq	a5,s2,7080 <_fwalk_sglue+0x70>
    7078:	000b80e7          	jalr	s7
    707c:	00aa6a33          	or	s4,s4,a0
    7080:	fff48493          	add	s1,s1,-1
    7084:	06840413          	add	s0,s0,104
    7088:	fd249ce3          	bne	s1,s2,7060 <_fwalk_sglue+0x50>
    708c:	000aaa83          	lw	s5,0(s5)
    7090:	fc0a90e3          	bnez	s5,7050 <_fwalk_sglue+0x40>
    7094:	02c12083          	lw	ra,44(sp)
    7098:	02812403          	lw	s0,40(sp)
    709c:	02412483          	lw	s1,36(sp)
    70a0:	02012903          	lw	s2,32(sp)
    70a4:	01c12983          	lw	s3,28(sp)
    70a8:	01412a83          	lw	s5,20(sp)
    70ac:	01012b03          	lw	s6,16(sp)
    70b0:	00c12b83          	lw	s7,12(sp)
    70b4:	000a0513          	mv	a0,s4
    70b8:	01812a03          	lw	s4,24(sp)
    70bc:	03010113          	add	sp,sp,48
    70c0:	00008067          	ret

000070c4 <_putc_r>:
    70c4:	fe010113          	add	sp,sp,-32
    70c8:	00812c23          	sw	s0,24(sp)
    70cc:	01212a23          	sw	s2,20(sp)
    70d0:	00112e23          	sw	ra,28(sp)
    70d4:	00050913          	mv	s2,a0
    70d8:	00060413          	mv	s0,a2
    70dc:	00050663          	beqz	a0,70e8 <_putc_r+0x24>
    70e0:	03452783          	lw	a5,52(a0)
    70e4:	0c078663          	beqz	a5,71b0 <_putc_r+0xec>
    70e8:	06442783          	lw	a5,100(s0)
    70ec:	0017f793          	and	a5,a5,1
    70f0:	00079863          	bnez	a5,7100 <_putc_r+0x3c>
    70f4:	00c45783          	lhu	a5,12(s0)
    70f8:	2007f793          	and	a5,a5,512
    70fc:	08078063          	beqz	a5,717c <_putc_r+0xb8>
    7100:	00842783          	lw	a5,8(s0)
    7104:	fff78793          	add	a5,a5,-1
    7108:	00f42423          	sw	a5,8(s0)
    710c:	0007dc63          	bgez	a5,7124 <_putc_r+0x60>
    7110:	01842703          	lw	a4,24(s0)
    7114:	04e7ca63          	blt	a5,a4,7168 <_putc_r+0xa4>
    7118:	0ff5f793          	zext.b	a5,a1
    711c:	00a00713          	li	a4,10
    7120:	04e78463          	beq	a5,a4,7168 <_putc_r+0xa4>
    7124:	00042783          	lw	a5,0(s0)
    7128:	0ff5f913          	zext.b	s2,a1
    712c:	00178713          	add	a4,a5,1
    7130:	00e42023          	sw	a4,0(s0)
    7134:	00b78023          	sb	a1,0(a5)
    7138:	06442783          	lw	a5,100(s0)
    713c:	0017f793          	and	a5,a5,1
    7140:	00079863          	bnez	a5,7150 <_putc_r+0x8c>
    7144:	00c45783          	lhu	a5,12(s0)
    7148:	2007f793          	and	a5,a5,512
    714c:	04078263          	beqz	a5,7190 <_putc_r+0xcc>
    7150:	01c12083          	lw	ra,28(sp)
    7154:	01812403          	lw	s0,24(sp)
    7158:	00090513          	mv	a0,s2
    715c:	01412903          	lw	s2,20(sp)
    7160:	02010113          	add	sp,sp,32
    7164:	00008067          	ret
    7168:	00090513          	mv	a0,s2
    716c:	00040613          	mv	a2,s0
    7170:	1b4000ef          	jal	7324 <__swbuf_r>
    7174:	00050913          	mv	s2,a0
    7178:	fc1ff06f          	j	7138 <_putc_r+0x74>
    717c:	05842503          	lw	a0,88(s0)
    7180:	00b12623          	sw	a1,12(sp)
    7184:	cc9f90ef          	jal	e4c <__retarget_lock_acquire_recursive>
    7188:	00c12583          	lw	a1,12(sp)
    718c:	f75ff06f          	j	7100 <_putc_r+0x3c>
    7190:	05842503          	lw	a0,88(s0)
    7194:	cbdf90ef          	jal	e50 <__retarget_lock_release_recursive>
    7198:	01c12083          	lw	ra,28(sp)
    719c:	01812403          	lw	s0,24(sp)
    71a0:	00090513          	mv	a0,s2
    71a4:	01412903          	lw	s2,20(sp)
    71a8:	02010113          	add	sp,sp,32
    71ac:	00008067          	ret
    71b0:	00b12623          	sw	a1,12(sp)
    71b4:	8c1ff0ef          	jal	6a74 <__sinit>
    71b8:	00c12583          	lw	a1,12(sp)
    71bc:	f2dff06f          	j	70e8 <_putc_r+0x24>

000071c0 <__sread>:
    71c0:	ff010113          	add	sp,sp,-16
    71c4:	00812423          	sw	s0,8(sp)
    71c8:	00058413          	mv	s0,a1
    71cc:	00e59583          	lh	a1,14(a1)
    71d0:	00112623          	sw	ra,12(sp)
    71d4:	095000ef          	jal	7a68 <_read_r>
    71d8:	02054063          	bltz	a0,71f8 <__sread+0x38>
    71dc:	05042783          	lw	a5,80(s0)
    71e0:	00c12083          	lw	ra,12(sp)
    71e4:	00a787b3          	add	a5,a5,a0
    71e8:	04f42823          	sw	a5,80(s0)
    71ec:	00812403          	lw	s0,8(sp)
    71f0:	01010113          	add	sp,sp,16
    71f4:	00008067          	ret
    71f8:	00c45783          	lhu	a5,12(s0)
    71fc:	fffff737          	lui	a4,0xfffff
    7200:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7204:	00e7f7b3          	and	a5,a5,a4
    7208:	00c12083          	lw	ra,12(sp)
    720c:	00f41623          	sh	a5,12(s0)
    7210:	00812403          	lw	s0,8(sp)
    7214:	01010113          	add	sp,sp,16
    7218:	00008067          	ret

0000721c <__swrite>:
    721c:	00c59783          	lh	a5,12(a1)
    7220:	fe010113          	add	sp,sp,-32
    7224:	00812c23          	sw	s0,24(sp)
    7228:	00912a23          	sw	s1,20(sp)
    722c:	01212823          	sw	s2,16(sp)
    7230:	01312623          	sw	s3,12(sp)
    7234:	00112e23          	sw	ra,28(sp)
    7238:	1007f713          	and	a4,a5,256
    723c:	00058413          	mv	s0,a1
    7240:	00050493          	mv	s1,a0
    7244:	00060913          	mv	s2,a2
    7248:	00068993          	mv	s3,a3
    724c:	04071063          	bnez	a4,728c <__swrite+0x70>
    7250:	fffff737          	lui	a4,0xfffff
    7254:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    7258:	00e7f7b3          	and	a5,a5,a4
    725c:	00e41583          	lh	a1,14(s0)
    7260:	00f41623          	sh	a5,12(s0)
    7264:	01812403          	lw	s0,24(sp)
    7268:	01c12083          	lw	ra,28(sp)
    726c:	00098693          	mv	a3,s3
    7270:	00090613          	mv	a2,s2
    7274:	00c12983          	lw	s3,12(sp)
    7278:	01012903          	lw	s2,16(sp)
    727c:	00048513          	mv	a0,s1
    7280:	01412483          	lw	s1,20(sp)
    7284:	02010113          	add	sp,sp,32
    7288:	09d0006f          	j	7b24 <_write_r>
    728c:	00e59583          	lh	a1,14(a1)
    7290:	00200693          	li	a3,2
    7294:	00000613          	li	a2,0
    7298:	76c000ef          	jal	7a04 <_lseek_r>
    729c:	00c41783          	lh	a5,12(s0)
    72a0:	fb1ff06f          	j	7250 <__swrite+0x34>

000072a4 <__sseek>:
    72a4:	ff010113          	add	sp,sp,-16
    72a8:	00812423          	sw	s0,8(sp)
    72ac:	00058413          	mv	s0,a1
    72b0:	00e59583          	lh	a1,14(a1)
    72b4:	00112623          	sw	ra,12(sp)
    72b8:	74c000ef          	jal	7a04 <_lseek_r>
    72bc:	fff00793          	li	a5,-1
    72c0:	02f50863          	beq	a0,a5,72f0 <__sseek+0x4c>
    72c4:	00c45783          	lhu	a5,12(s0)
    72c8:	00001737          	lui	a4,0x1
    72cc:	00c12083          	lw	ra,12(sp)
    72d0:	00e7e7b3          	or	a5,a5,a4
    72d4:	01079793          	sll	a5,a5,0x10
    72d8:	4107d793          	sra	a5,a5,0x10
    72dc:	04a42823          	sw	a0,80(s0)
    72e0:	00f41623          	sh	a5,12(s0)
    72e4:	00812403          	lw	s0,8(sp)
    72e8:	01010113          	add	sp,sp,16
    72ec:	00008067          	ret
    72f0:	00c45783          	lhu	a5,12(s0)
    72f4:	fffff737          	lui	a4,0xfffff
    72f8:	fff70713          	add	a4,a4,-1 # ffffefff <__crt0_ram_last+0x7ff7f000>
    72fc:	00e7f7b3          	and	a5,a5,a4
    7300:	01079793          	sll	a5,a5,0x10
    7304:	4107d793          	sra	a5,a5,0x10
    7308:	00c12083          	lw	ra,12(sp)
    730c:	00f41623          	sh	a5,12(s0)
    7310:	00812403          	lw	s0,8(sp)
    7314:	01010113          	add	sp,sp,16
    7318:	00008067          	ret

0000731c <__sclose>:
    731c:	00e59583          	lh	a1,14(a1)
    7320:	68c0006f          	j	79ac <_close_r>

00007324 <__swbuf_r>:
    7324:	fe010113          	add	sp,sp,-32
    7328:	00812c23          	sw	s0,24(sp)
    732c:	00912a23          	sw	s1,20(sp)
    7330:	01212823          	sw	s2,16(sp)
    7334:	00112e23          	sw	ra,28(sp)
    7338:	00050913          	mv	s2,a0
    733c:	00058493          	mv	s1,a1
    7340:	00060413          	mv	s0,a2
    7344:	00050663          	beqz	a0,7350 <__swbuf_r+0x2c>
    7348:	03452783          	lw	a5,52(a0)
    734c:	16078063          	beqz	a5,74ac <__swbuf_r+0x188>
    7350:	01842783          	lw	a5,24(s0)
    7354:	00c41703          	lh	a4,12(s0)
    7358:	00f42423          	sw	a5,8(s0)
    735c:	00877793          	and	a5,a4,8
    7360:	08078063          	beqz	a5,73e0 <__swbuf_r+0xbc>
    7364:	01042783          	lw	a5,16(s0)
    7368:	06078c63          	beqz	a5,73e0 <__swbuf_r+0xbc>
    736c:	01312623          	sw	s3,12(sp)
    7370:	01271693          	sll	a3,a4,0x12
    7374:	0ff4f993          	zext.b	s3,s1
    7378:	0ff4f493          	zext.b	s1,s1
    737c:	0806d863          	bgez	a3,740c <__swbuf_r+0xe8>
    7380:	00042703          	lw	a4,0(s0)
    7384:	01442683          	lw	a3,20(s0)
    7388:	40f707b3          	sub	a5,a4,a5
    738c:	0ad7d863          	bge	a5,a3,743c <__swbuf_r+0x118>
    7390:	00842683          	lw	a3,8(s0)
    7394:	00170613          	add	a2,a4,1
    7398:	00c42023          	sw	a2,0(s0)
    739c:	fff68693          	add	a3,a3,-1
    73a0:	00d42423          	sw	a3,8(s0)
    73a4:	01370023          	sb	s3,0(a4)
    73a8:	01442703          	lw	a4,20(s0)
    73ac:	00178793          	add	a5,a5,1
    73b0:	0cf70263          	beq	a4,a5,7474 <__swbuf_r+0x150>
    73b4:	00c45783          	lhu	a5,12(s0)
    73b8:	0017f793          	and	a5,a5,1
    73bc:	0c079a63          	bnez	a5,7490 <__swbuf_r+0x16c>
    73c0:	00c12983          	lw	s3,12(sp)
    73c4:	01c12083          	lw	ra,28(sp)
    73c8:	01812403          	lw	s0,24(sp)
    73cc:	01012903          	lw	s2,16(sp)
    73d0:	00048513          	mv	a0,s1
    73d4:	01412483          	lw	s1,20(sp)
    73d8:	02010113          	add	sp,sp,32
    73dc:	00008067          	ret
    73e0:	00040593          	mv	a1,s0
    73e4:	00090513          	mv	a0,s2
    73e8:	0cc000ef          	jal	74b4 <__swsetup_r>
    73ec:	08051e63          	bnez	a0,7488 <__swbuf_r+0x164>
    73f0:	00c41703          	lh	a4,12(s0)
    73f4:	01312623          	sw	s3,12(sp)
    73f8:	01042783          	lw	a5,16(s0)
    73fc:	01271693          	sll	a3,a4,0x12
    7400:	0ff4f993          	zext.b	s3,s1
    7404:	0ff4f493          	zext.b	s1,s1
    7408:	f606cce3          	bltz	a3,7380 <__swbuf_r+0x5c>
    740c:	06442683          	lw	a3,100(s0)
    7410:	ffffe637          	lui	a2,0xffffe
    7414:	000025b7          	lui	a1,0x2
    7418:	00b76733          	or	a4,a4,a1
    741c:	fff60613          	add	a2,a2,-1 # ffffdfff <__crt0_ram_last+0x7ff7e000>
    7420:	00c6f6b3          	and	a3,a3,a2
    7424:	00e41623          	sh	a4,12(s0)
    7428:	00042703          	lw	a4,0(s0)
    742c:	06d42223          	sw	a3,100(s0)
    7430:	01442683          	lw	a3,20(s0)
    7434:	40f707b3          	sub	a5,a4,a5
    7438:	f4d7cce3          	blt	a5,a3,7390 <__swbuf_r+0x6c>
    743c:	00040593          	mv	a1,s0
    7440:	00090513          	mv	a0,s2
    7444:	b34ff0ef          	jal	6778 <_fflush_r>
    7448:	02051e63          	bnez	a0,7484 <__swbuf_r+0x160>
    744c:	00042703          	lw	a4,0(s0)
    7450:	00842683          	lw	a3,8(s0)
    7454:	00100793          	li	a5,1
    7458:	00170613          	add	a2,a4,1
    745c:	fff68693          	add	a3,a3,-1
    7460:	00c42023          	sw	a2,0(s0)
    7464:	00d42423          	sw	a3,8(s0)
    7468:	01370023          	sb	s3,0(a4)
    746c:	01442703          	lw	a4,20(s0)
    7470:	f4f712e3          	bne	a4,a5,73b4 <__swbuf_r+0x90>
    7474:	00040593          	mv	a1,s0
    7478:	00090513          	mv	a0,s2
    747c:	afcff0ef          	jal	6778 <_fflush_r>
    7480:	f40500e3          	beqz	a0,73c0 <__swbuf_r+0x9c>
    7484:	00c12983          	lw	s3,12(sp)
    7488:	fff00493          	li	s1,-1
    748c:	f39ff06f          	j	73c4 <__swbuf_r+0xa0>
    7490:	00a00793          	li	a5,10
    7494:	f2f496e3          	bne	s1,a5,73c0 <__swbuf_r+0x9c>
    7498:	00040593          	mv	a1,s0
    749c:	00090513          	mv	a0,s2
    74a0:	ad8ff0ef          	jal	6778 <_fflush_r>
    74a4:	f0050ee3          	beqz	a0,73c0 <__swbuf_r+0x9c>
    74a8:	fddff06f          	j	7484 <__swbuf_r+0x160>
    74ac:	dc8ff0ef          	jal	6a74 <__sinit>
    74b0:	ea1ff06f          	j	7350 <__swbuf_r+0x2c>

000074b4 <__swsetup_r>:
    74b4:	ff010113          	add	sp,sp,-16
    74b8:	00812423          	sw	s0,8(sp)
    74bc:	00912223          	sw	s1,4(sp)
    74c0:	00112623          	sw	ra,12(sp)
    74c4:	7fff9797          	auipc	a5,0x7fff9
    74c8:	2447a783          	lw	a5,580(a5) # 80000708 <_impure_ptr>
    74cc:	00050493          	mv	s1,a0
    74d0:	00058413          	mv	s0,a1
    74d4:	00078663          	beqz	a5,74e0 <__swsetup_r+0x2c>
    74d8:	0347a703          	lw	a4,52(a5)
    74dc:	0e070c63          	beqz	a4,75d4 <__swsetup_r+0x120>
    74e0:	00c41783          	lh	a5,12(s0)
    74e4:	0087f713          	and	a4,a5,8
    74e8:	06070a63          	beqz	a4,755c <__swsetup_r+0xa8>
    74ec:	01042703          	lw	a4,16(s0)
    74f0:	08070663          	beqz	a4,757c <__swsetup_r+0xc8>
    74f4:	0017f693          	and	a3,a5,1
    74f8:	02068863          	beqz	a3,7528 <__swsetup_r+0x74>
    74fc:	01442683          	lw	a3,20(s0)
    7500:	00042423          	sw	zero,8(s0)
    7504:	00000513          	li	a0,0
    7508:	40d006b3          	neg	a3,a3
    750c:	00d42c23          	sw	a3,24(s0)
    7510:	02070a63          	beqz	a4,7544 <__swsetup_r+0x90>
    7514:	00c12083          	lw	ra,12(sp)
    7518:	00812403          	lw	s0,8(sp)
    751c:	00412483          	lw	s1,4(sp)
    7520:	01010113          	add	sp,sp,16
    7524:	00008067          	ret
    7528:	0027f693          	and	a3,a5,2
    752c:	00000613          	li	a2,0
    7530:	00069463          	bnez	a3,7538 <__swsetup_r+0x84>
    7534:	01442603          	lw	a2,20(s0)
    7538:	00c42423          	sw	a2,8(s0)
    753c:	00000513          	li	a0,0
    7540:	fc071ae3          	bnez	a4,7514 <__swsetup_r+0x60>
    7544:	0807f713          	and	a4,a5,128
    7548:	fc0706e3          	beqz	a4,7514 <__swsetup_r+0x60>
    754c:	0407e793          	or	a5,a5,64
    7550:	00f41623          	sh	a5,12(s0)
    7554:	fff00513          	li	a0,-1
    7558:	fbdff06f          	j	7514 <__swsetup_r+0x60>
    755c:	0107f713          	and	a4,a5,16
    7560:	08070063          	beqz	a4,75e0 <__swsetup_r+0x12c>
    7564:	0047f713          	and	a4,a5,4
    7568:	02071c63          	bnez	a4,75a0 <__swsetup_r+0xec>
    756c:	01042703          	lw	a4,16(s0)
    7570:	0087e793          	or	a5,a5,8
    7574:	00f41623          	sh	a5,12(s0)
    7578:	f6071ee3          	bnez	a4,74f4 <__swsetup_r+0x40>
    757c:	2807f693          	and	a3,a5,640
    7580:	20000613          	li	a2,512
    7584:	f6c688e3          	beq	a3,a2,74f4 <__swsetup_r+0x40>
    7588:	00040593          	mv	a1,s0
    758c:	00048513          	mv	a0,s1
    7590:	6cc030ef          	jal	ac5c <__smakebuf_r>
    7594:	00c41783          	lh	a5,12(s0)
    7598:	01042703          	lw	a4,16(s0)
    759c:	f59ff06f          	j	74f4 <__swsetup_r+0x40>
    75a0:	03042583          	lw	a1,48(s0)
    75a4:	00058e63          	beqz	a1,75c0 <__swsetup_r+0x10c>
    75a8:	04040713          	add	a4,s0,64
    75ac:	00e58863          	beq	a1,a4,75bc <__swsetup_r+0x108>
    75b0:	00048513          	mv	a0,s1
    75b4:	cf1f90ef          	jal	12a4 <_free_r>
    75b8:	00c41783          	lh	a5,12(s0)
    75bc:	02042823          	sw	zero,48(s0)
    75c0:	01042703          	lw	a4,16(s0)
    75c4:	fdb7f793          	and	a5,a5,-37
    75c8:	00042223          	sw	zero,4(s0)
    75cc:	00e42023          	sw	a4,0(s0)
    75d0:	fa1ff06f          	j	7570 <__swsetup_r+0xbc>
    75d4:	00078513          	mv	a0,a5
    75d8:	c9cff0ef          	jal	6a74 <__sinit>
    75dc:	f05ff06f          	j	74e0 <__swsetup_r+0x2c>
    75e0:	00900713          	li	a4,9
    75e4:	00e4a023          	sw	a4,0(s1)
    75e8:	0407e793          	or	a5,a5,64
    75ec:	00f41623          	sh	a5,12(s0)
    75f0:	fff00513          	li	a0,-1
    75f4:	f21ff06f          	j	7514 <__swsetup_r+0x60>

000075f8 <__fputwc>:
    75f8:	fc010113          	add	sp,sp,-64
    75fc:	02812c23          	sw	s0,56(sp)
    7600:	03412423          	sw	s4,40(sp)
    7604:	03512223          	sw	s5,36(sp)
    7608:	02112e23          	sw	ra,60(sp)
    760c:	02912a23          	sw	s1,52(sp)
    7610:	03312623          	sw	s3,44(sp)
    7614:	00050a13          	mv	s4,a0
    7618:	00058a93          	mv	s5,a1
    761c:	00060413          	mv	s0,a2
    7620:	374000ef          	jal	7994 <__locale_mb_cur_max>
    7624:	00100793          	li	a5,1
    7628:	02f51663          	bne	a0,a5,7654 <__fputwc+0x5c>
    762c:	fffa8793          	add	a5,s5,-1
    7630:	0fe00713          	li	a4,254
    7634:	02f76063          	bltu	a4,a5,7654 <__fputwc+0x5c>
    7638:	03212823          	sw	s2,48(sp)
    763c:	03612023          	sw	s6,32(sp)
    7640:	01712e23          	sw	s7,28(sp)
    7644:	01510423          	sb	s5,8(sp)
    7648:	00100993          	li	s3,1
    764c:	00810493          	add	s1,sp,8
    7650:	0380006f          	j	7688 <__fputwc+0x90>
    7654:	00810493          	add	s1,sp,8
    7658:	05c40693          	add	a3,s0,92
    765c:	000a8613          	mv	a2,s5
    7660:	00048593          	mv	a1,s1
    7664:	000a0513          	mv	a0,s4
    7668:	3e8030ef          	jal	aa50 <_wcrtomb_r>
    766c:	fff00793          	li	a5,-1
    7670:	00050993          	mv	s3,a0
    7674:	0cf50a63          	beq	a0,a5,7748 <__fputwc+0x150>
    7678:	0a050663          	beqz	a0,7724 <__fputwc+0x12c>
    767c:	03212823          	sw	s2,48(sp)
    7680:	03612023          	sw	s6,32(sp)
    7684:	01712e23          	sw	s7,28(sp)
    7688:	00000913          	li	s2,0
    768c:	fff00b13          	li	s6,-1
    7690:	00a00b93          	li	s7,10
    7694:	0200006f          	j	76b4 <__fputwc+0xbc>
    7698:	00042783          	lw	a5,0(s0)
    769c:	00178693          	add	a3,a5,1
    76a0:	00d42023          	sw	a3,0(s0)
    76a4:	00e78023          	sb	a4,0(a5)
    76a8:	00190913          	add	s2,s2,1
    76ac:	00148493          	add	s1,s1,1
    76b0:	07397463          	bgeu	s2,s3,7718 <__fputwc+0x120>
    76b4:	00842783          	lw	a5,8(s0)
    76b8:	0004c703          	lbu	a4,0(s1)
    76bc:	fff78793          	add	a5,a5,-1
    76c0:	00f42423          	sw	a5,8(s0)
    76c4:	fc07dae3          	bgez	a5,7698 <__fputwc+0xa0>
    76c8:	01842683          	lw	a3,24(s0)
    76cc:	00040613          	mv	a2,s0
    76d0:	00070593          	mv	a1,a4
    76d4:	000a0513          	mv	a0,s4
    76d8:	00d7c463          	blt	a5,a3,76e0 <__fputwc+0xe8>
    76dc:	fb771ee3          	bne	a4,s7,7698 <__fputwc+0xa0>
    76e0:	c45ff0ef          	jal	7324 <__swbuf_r>
    76e4:	fd6512e3          	bne	a0,s6,76a8 <__fputwc+0xb0>
    76e8:	03012903          	lw	s2,48(sp)
    76ec:	02012b03          	lw	s6,32(sp)
    76f0:	01c12b83          	lw	s7,28(sp)
    76f4:	03c12083          	lw	ra,60(sp)
    76f8:	03812403          	lw	s0,56(sp)
    76fc:	03412483          	lw	s1,52(sp)
    7700:	02c12983          	lw	s3,44(sp)
    7704:	02812a03          	lw	s4,40(sp)
    7708:	02412a83          	lw	s5,36(sp)
    770c:	fff00513          	li	a0,-1
    7710:	04010113          	add	sp,sp,64
    7714:	00008067          	ret
    7718:	03012903          	lw	s2,48(sp)
    771c:	02012b03          	lw	s6,32(sp)
    7720:	01c12b83          	lw	s7,28(sp)
    7724:	03c12083          	lw	ra,60(sp)
    7728:	03812403          	lw	s0,56(sp)
    772c:	03412483          	lw	s1,52(sp)
    7730:	02c12983          	lw	s3,44(sp)
    7734:	02812a03          	lw	s4,40(sp)
    7738:	000a8513          	mv	a0,s5
    773c:	02412a83          	lw	s5,36(sp)
    7740:	04010113          	add	sp,sp,64
    7744:	00008067          	ret
    7748:	00c45783          	lhu	a5,12(s0)
    774c:	0407e793          	or	a5,a5,64
    7750:	00f41623          	sh	a5,12(s0)
    7754:	fa1ff06f          	j	76f4 <__fputwc+0xfc>

00007758 <_fputwc_r>:
    7758:	06462783          	lw	a5,100(a2)
    775c:	fe010113          	add	sp,sp,-32
    7760:	00812c23          	sw	s0,24(sp)
    7764:	00912a23          	sw	s1,20(sp)
    7768:	0017f713          	and	a4,a5,1
    776c:	00112e23          	sw	ra,28(sp)
    7770:	00c61783          	lh	a5,12(a2)
    7774:	00060413          	mv	s0,a2
    7778:	00050493          	mv	s1,a0
    777c:	00071663          	bnez	a4,7788 <_fputwc_r+0x30>
    7780:	2007f713          	and	a4,a5,512
    7784:	08070463          	beqz	a4,780c <_fputwc_r+0xb4>
    7788:	01279713          	sll	a4,a5,0x12
    778c:	02074063          	bltz	a4,77ac <_fputwc_r+0x54>
    7790:	06442703          	lw	a4,100(s0)
    7794:	000026b7          	lui	a3,0x2
    7798:	00d7e7b3          	or	a5,a5,a3
    779c:	000026b7          	lui	a3,0x2
    77a0:	00d76733          	or	a4,a4,a3
    77a4:	00f41623          	sh	a5,12(s0)
    77a8:	06e42223          	sw	a4,100(s0)
    77ac:	00048513          	mv	a0,s1
    77b0:	00040613          	mv	a2,s0
    77b4:	e45ff0ef          	jal	75f8 <__fputwc>
    77b8:	06442783          	lw	a5,100(s0)
    77bc:	00050493          	mv	s1,a0
    77c0:	0017f793          	and	a5,a5,1
    77c4:	00079863          	bnez	a5,77d4 <_fputwc_r+0x7c>
    77c8:	00c45783          	lhu	a5,12(s0)
    77cc:	2007f793          	and	a5,a5,512
    77d0:	00078e63          	beqz	a5,77ec <_fputwc_r+0x94>
    77d4:	01c12083          	lw	ra,28(sp)
    77d8:	01812403          	lw	s0,24(sp)
    77dc:	00048513          	mv	a0,s1
    77e0:	01412483          	lw	s1,20(sp)
    77e4:	02010113          	add	sp,sp,32
    77e8:	00008067          	ret
    77ec:	05842503          	lw	a0,88(s0)
    77f0:	e60f90ef          	jal	e50 <__retarget_lock_release_recursive>
    77f4:	01c12083          	lw	ra,28(sp)
    77f8:	01812403          	lw	s0,24(sp)
    77fc:	00048513          	mv	a0,s1
    7800:	01412483          	lw	s1,20(sp)
    7804:	02010113          	add	sp,sp,32
    7808:	00008067          	ret
    780c:	05862503          	lw	a0,88(a2)
    7810:	00b12623          	sw	a1,12(sp)
    7814:	e38f90ef          	jal	e4c <__retarget_lock_acquire_recursive>
    7818:	00c41783          	lh	a5,12(s0)
    781c:	00c12583          	lw	a1,12(sp)
    7820:	f69ff06f          	j	7788 <_fputwc_r+0x30>

00007824 <memchr>:
    7824:	00357793          	and	a5,a0,3
    7828:	0ff5f693          	zext.b	a3,a1
    782c:	02078a63          	beqz	a5,7860 <memchr+0x3c>
    7830:	fff60793          	add	a5,a2,-1
    7834:	02060e63          	beqz	a2,7870 <memchr+0x4c>
    7838:	fff00613          	li	a2,-1
    783c:	0180006f          	j	7854 <memchr+0x30>
    7840:	00150513          	add	a0,a0,1
    7844:	00357713          	and	a4,a0,3
    7848:	00070e63          	beqz	a4,7864 <memchr+0x40>
    784c:	fff78793          	add	a5,a5,-1
    7850:	02c78063          	beq	a5,a2,7870 <memchr+0x4c>
    7854:	00054703          	lbu	a4,0(a0)
    7858:	fed714e3          	bne	a4,a3,7840 <memchr+0x1c>
    785c:	00008067          	ret
    7860:	00060793          	mv	a5,a2
    7864:	00300713          	li	a4,3
    7868:	00f76863          	bltu	a4,a5,7878 <memchr+0x54>
    786c:	06079063          	bnez	a5,78cc <memchr+0xa8>
    7870:	00000513          	li	a0,0
    7874:	00008067          	ret
    7878:	0ff5f593          	zext.b	a1,a1
    787c:	00859713          	sll	a4,a1,0x8
    7880:	00b705b3          	add	a1,a4,a1
    7884:	01059713          	sll	a4,a1,0x10
    7888:	feff08b7          	lui	a7,0xfeff0
    788c:	80808837          	lui	a6,0x80808
    7890:	00e585b3          	add	a1,a1,a4
    7894:	eff88893          	add	a7,a7,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7898:	08080813          	add	a6,a6,128 # 80808080 <__crt0_ram_last+0x788081>
    789c:	00300313          	li	t1,3
    78a0:	0100006f          	j	78b0 <memchr+0x8c>
    78a4:	ffc78793          	add	a5,a5,-4
    78a8:	00450513          	add	a0,a0,4
    78ac:	fcf370e3          	bgeu	t1,a5,786c <memchr+0x48>
    78b0:	00052703          	lw	a4,0(a0)
    78b4:	00e5c733          	xor	a4,a1,a4
    78b8:	01170633          	add	a2,a4,a7
    78bc:	fff74713          	not	a4,a4
    78c0:	00e67733          	and	a4,a2,a4
    78c4:	01077733          	and	a4,a4,a6
    78c8:	fc070ee3          	beqz	a4,78a4 <memchr+0x80>
    78cc:	00f507b3          	add	a5,a0,a5
    78d0:	00c0006f          	j	78dc <memchr+0xb8>
    78d4:	00150513          	add	a0,a0,1
    78d8:	f8f50ce3          	beq	a0,a5,7870 <memchr+0x4c>
    78dc:	00054703          	lbu	a4,0(a0)
    78e0:	fed71ae3          	bne	a4,a3,78d4 <memchr+0xb0>
    78e4:	00008067          	ret

000078e8 <strncpy>:
    78e8:	00a5e7b3          	or	a5,a1,a0
    78ec:	0037f793          	and	a5,a5,3
    78f0:	00079663          	bnez	a5,78fc <strncpy+0x14>
    78f4:	00300793          	li	a5,3
    78f8:	04c7e663          	bltu	a5,a2,7944 <strncpy+0x5c>
    78fc:	00050713          	mv	a4,a0
    7900:	01c0006f          	j	791c <strncpy+0x34>
    7904:	fff5c683          	lbu	a3,-1(a1) # 1fff <_vfprintf_r+0x257>
    7908:	fff60813          	add	a6,a2,-1
    790c:	fed78fa3          	sb	a3,-1(a5)
    7910:	00068e63          	beqz	a3,792c <strncpy+0x44>
    7914:	00078713          	mv	a4,a5
    7918:	00080613          	mv	a2,a6
    791c:	00158593          	add	a1,a1,1
    7920:	00170793          	add	a5,a4,1
    7924:	fe0610e3          	bnez	a2,7904 <strncpy+0x1c>
    7928:	00008067          	ret
    792c:	00c70733          	add	a4,a4,a2
    7930:	06080063          	beqz	a6,7990 <strncpy+0xa8>
    7934:	00178793          	add	a5,a5,1
    7938:	fe078fa3          	sb	zero,-1(a5)
    793c:	fee79ce3          	bne	a5,a4,7934 <strncpy+0x4c>
    7940:	00008067          	ret
    7944:	feff0337          	lui	t1,0xfeff0
    7948:	808088b7          	lui	a7,0x80808
    794c:	00050713          	mv	a4,a0
    7950:	eff30313          	add	t1,t1,-257 # fefefeff <__crt0_ram_last+0x7ef6ff00>
    7954:	08088893          	add	a7,a7,128 # 80808080 <__crt0_ram_last+0x788081>
    7958:	00300e13          	li	t3,3
    795c:	0180006f          	j	7974 <strncpy+0x8c>
    7960:	00d72023          	sw	a3,0(a4)
    7964:	ffc60613          	add	a2,a2,-4
    7968:	00470713          	add	a4,a4,4
    796c:	00458593          	add	a1,a1,4
    7970:	face76e3          	bgeu	t3,a2,791c <strncpy+0x34>
    7974:	0005a683          	lw	a3,0(a1)
    7978:	006687b3          	add	a5,a3,t1
    797c:	fff6c813          	not	a6,a3
    7980:	0107f7b3          	and	a5,a5,a6
    7984:	0117f7b3          	and	a5,a5,a7
    7988:	fc078ce3          	beqz	a5,7960 <strncpy+0x78>
    798c:	f91ff06f          	j	791c <strncpy+0x34>
    7990:	00008067          	ret

00007994 <__locale_mb_cur_max>:
    7994:	7fff9517          	auipc	a0,0x7fff9
    7998:	cc854503          	lbu	a0,-824(a0) # 8000065c <__global_locale+0x128>
    799c:	00008067          	ret

000079a0 <_localeconv_r>:
    79a0:	7fff9517          	auipc	a0,0x7fff9
    79a4:	c8450513          	add	a0,a0,-892 # 80000624 <__global_locale+0xf0>
    79a8:	00008067          	ret

000079ac <_close_r>:
    79ac:	ff010113          	add	sp,sp,-16
    79b0:	00812423          	sw	s0,8(sp)
    79b4:	00050413          	mv	s0,a0
    79b8:	00058513          	mv	a0,a1
    79bc:	7fff9797          	auipc	a5,0x7fff9
    79c0:	d407ae23          	sw	zero,-676(a5) # 80000718 <errno>
    79c4:	00112623          	sw	ra,12(sp)
    79c8:	85cf90ef          	jal	a24 <_close>
    79cc:	fff00793          	li	a5,-1
    79d0:	00f50a63          	beq	a0,a5,79e4 <_close_r+0x38>
    79d4:	00c12083          	lw	ra,12(sp)
    79d8:	00812403          	lw	s0,8(sp)
    79dc:	01010113          	add	sp,sp,16
    79e0:	00008067          	ret
    79e4:	7fff9797          	auipc	a5,0x7fff9
    79e8:	d347a783          	lw	a5,-716(a5) # 80000718 <errno>
    79ec:	fe0784e3          	beqz	a5,79d4 <_close_r+0x28>
    79f0:	00c12083          	lw	ra,12(sp)
    79f4:	00f42023          	sw	a5,0(s0)
    79f8:	00812403          	lw	s0,8(sp)
    79fc:	01010113          	add	sp,sp,16
    7a00:	00008067          	ret

00007a04 <_lseek_r>:
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
    7a2c:	834f90ef          	jal	a60 <_lseek>
    7a30:	fff00793          	li	a5,-1
    7a34:	00f50a63          	beq	a0,a5,7a48 <_lseek_r+0x44>
    7a38:	00c12083          	lw	ra,12(sp)
    7a3c:	00812403          	lw	s0,8(sp)
    7a40:	01010113          	add	sp,sp,16
    7a44:	00008067          	ret
    7a48:	7fff9797          	auipc	a5,0x7fff9
    7a4c:	cd07a783          	lw	a5,-816(a5) # 80000718 <errno>
    7a50:	fe0784e3          	beqz	a5,7a38 <_lseek_r+0x34>
    7a54:	00c12083          	lw	ra,12(sp)
    7a58:	00f42023          	sw	a5,0(s0)
    7a5c:	00812403          	lw	s0,8(sp)
    7a60:	01010113          	add	sp,sp,16
    7a64:	00008067          	ret

00007a68 <_read_r>:
    7a68:	ff010113          	add	sp,sp,-16
    7a6c:	00058713          	mv	a4,a1
    7a70:	00812423          	sw	s0,8(sp)
    7a74:	00060593          	mv	a1,a2
    7a78:	00050413          	mv	s0,a0
    7a7c:	00068613          	mv	a2,a3
    7a80:	00070513          	mv	a0,a4
    7a84:	7fff9797          	auipc	a5,0x7fff9
    7a88:	c807aa23          	sw	zero,-876(a5) # 80000718 <errno>
    7a8c:	00112623          	sw	ra,12(sp)
    7a90:	fd9f80ef          	jal	a68 <_read>
    7a94:	fff00793          	li	a5,-1
    7a98:	00f50a63          	beq	a0,a5,7aac <_read_r+0x44>
    7a9c:	00c12083          	lw	ra,12(sp)
    7aa0:	00812403          	lw	s0,8(sp)
    7aa4:	01010113          	add	sp,sp,16
    7aa8:	00008067          	ret
    7aac:	7fff9797          	auipc	a5,0x7fff9
    7ab0:	c6c7a783          	lw	a5,-916(a5) # 80000718 <errno>
    7ab4:	fe0784e3          	beqz	a5,7a9c <_read_r+0x34>
    7ab8:	00c12083          	lw	ra,12(sp)
    7abc:	00f42023          	sw	a5,0(s0)
    7ac0:	00812403          	lw	s0,8(sp)
    7ac4:	01010113          	add	sp,sp,16
    7ac8:	00008067          	ret

00007acc <_sbrk_r>:
    7acc:	ff010113          	add	sp,sp,-16
    7ad0:	00812423          	sw	s0,8(sp)
    7ad4:	00050413          	mv	s0,a0
    7ad8:	00058513          	mv	a0,a1
    7adc:	7fff9797          	auipc	a5,0x7fff9
    7ae0:	c207ae23          	sw	zero,-964(a5) # 80000718 <errno>
    7ae4:	00112623          	sw	ra,12(sp)
    7ae8:	900f90ef          	jal	be8 <_sbrk>
    7aec:	fff00793          	li	a5,-1
    7af0:	00f50a63          	beq	a0,a5,7b04 <_sbrk_r+0x38>
    7af4:	00c12083          	lw	ra,12(sp)
    7af8:	00812403          	lw	s0,8(sp)
    7afc:	01010113          	add	sp,sp,16
    7b00:	00008067          	ret
    7b04:	7fff9797          	auipc	a5,0x7fff9
    7b08:	c147a783          	lw	a5,-1004(a5) # 80000718 <errno>
    7b0c:	fe0784e3          	beqz	a5,7af4 <_sbrk_r+0x28>
    7b10:	00c12083          	lw	ra,12(sp)
    7b14:	00f42023          	sw	a5,0(s0)
    7b18:	00812403          	lw	s0,8(sp)
    7b1c:	01010113          	add	sp,sp,16
    7b20:	00008067          	ret

00007b24 <_write_r>:
    7b24:	ff010113          	add	sp,sp,-16
    7b28:	00058713          	mv	a4,a1
    7b2c:	00812423          	sw	s0,8(sp)
    7b30:	00060593          	mv	a1,a2
    7b34:	00050413          	mv	s0,a0
    7b38:	00068613          	mv	a2,a3
    7b3c:	00070513          	mv	a0,a4
    7b40:	7fff9797          	auipc	a5,0x7fff9
    7b44:	bc07ac23          	sw	zero,-1064(a5) # 80000718 <errno>
    7b48:	00112623          	sw	ra,12(sp)
    7b4c:	ff9f80ef          	jal	b44 <_write>
    7b50:	fff00793          	li	a5,-1
    7b54:	00f50a63          	beq	a0,a5,7b68 <_write_r+0x44>
    7b58:	00c12083          	lw	ra,12(sp)
    7b5c:	00812403          	lw	s0,8(sp)
    7b60:	01010113          	add	sp,sp,16
    7b64:	00008067          	ret
    7b68:	7fff9797          	auipc	a5,0x7fff9
    7b6c:	bb07a783          	lw	a5,-1104(a5) # 80000718 <errno>
    7b70:	fe0784e3          	beqz	a5,7b58 <_write_r+0x34>
    7b74:	00c12083          	lw	ra,12(sp)
    7b78:	00f42023          	sw	a5,0(s0)
    7b7c:	00812403          	lw	s0,8(sp)
    7b80:	01010113          	add	sp,sp,16
    7b84:	00008067          	ret

00007b88 <memmove>:
    7b88:	02a5f663          	bgeu	a1,a0,7bb4 <memmove+0x2c>
    7b8c:	00c58733          	add	a4,a1,a2
    7b90:	02e57263          	bgeu	a0,a4,7bb4 <memmove+0x2c>
    7b94:	00c507b3          	add	a5,a0,a2
    7b98:	04060663          	beqz	a2,7be4 <memmove+0x5c>
    7b9c:	fff74683          	lbu	a3,-1(a4)
    7ba0:	fff78793          	add	a5,a5,-1
    7ba4:	fff70713          	add	a4,a4,-1
    7ba8:	00d78023          	sb	a3,0(a5)
    7bac:	fef518e3          	bne	a0,a5,7b9c <memmove+0x14>
    7bb0:	00008067          	ret
    7bb4:	00f00793          	li	a5,15
    7bb8:	02c7e863          	bltu	a5,a2,7be8 <memmove+0x60>
    7bbc:	00050793          	mv	a5,a0
    7bc0:	fff60693          	add	a3,a2,-1
    7bc4:	0c060263          	beqz	a2,7c88 <memmove+0x100>
    7bc8:	00168693          	add	a3,a3,1 # 2001 <_vfprintf_r+0x259>
    7bcc:	00d786b3          	add	a3,a5,a3
    7bd0:	0005c703          	lbu	a4,0(a1)
    7bd4:	00178793          	add	a5,a5,1
    7bd8:	00158593          	add	a1,a1,1
    7bdc:	fee78fa3          	sb	a4,-1(a5)
    7be0:	fed798e3          	bne	a5,a3,7bd0 <memmove+0x48>
    7be4:	00008067          	ret
    7be8:	00b567b3          	or	a5,a0,a1
    7bec:	0037f793          	and	a5,a5,3
    7bf0:	08079663          	bnez	a5,7c7c <memmove+0xf4>
    7bf4:	ff060893          	add	a7,a2,-16
    7bf8:	ff08f893          	and	a7,a7,-16
    7bfc:	01088893          	add	a7,a7,16
    7c00:	011506b3          	add	a3,a0,a7
    7c04:	00058713          	mv	a4,a1
    7c08:	00050793          	mv	a5,a0
    7c0c:	00072803          	lw	a6,0(a4)
    7c10:	01070713          	add	a4,a4,16
    7c14:	01078793          	add	a5,a5,16
    7c18:	ff07a823          	sw	a6,-16(a5)
    7c1c:	ff472803          	lw	a6,-12(a4)
    7c20:	ff07aa23          	sw	a6,-12(a5)
    7c24:	ff872803          	lw	a6,-8(a4)
    7c28:	ff07ac23          	sw	a6,-8(a5)
    7c2c:	ffc72803          	lw	a6,-4(a4)
    7c30:	ff07ae23          	sw	a6,-4(a5)
    7c34:	fcd79ce3          	bne	a5,a3,7c0c <memmove+0x84>
    7c38:	00c67813          	and	a6,a2,12
    7c3c:	011585b3          	add	a1,a1,a7
    7c40:	00f67713          	and	a4,a2,15
    7c44:	04080463          	beqz	a6,7c8c <memmove+0x104>
    7c48:	ffc70813          	add	a6,a4,-4
    7c4c:	ffc87813          	and	a6,a6,-4
    7c50:	00480813          	add	a6,a6,4
    7c54:	010687b3          	add	a5,a3,a6
    7c58:	00058713          	mv	a4,a1
    7c5c:	00072883          	lw	a7,0(a4)
    7c60:	00468693          	add	a3,a3,4
    7c64:	00470713          	add	a4,a4,4
    7c68:	ff16ae23          	sw	a7,-4(a3)
    7c6c:	fef698e3          	bne	a3,a5,7c5c <memmove+0xd4>
    7c70:	00367613          	and	a2,a2,3
    7c74:	010585b3          	add	a1,a1,a6
    7c78:	f49ff06f          	j	7bc0 <memmove+0x38>
    7c7c:	fff60693          	add	a3,a2,-1
    7c80:	00050793          	mv	a5,a0
    7c84:	f45ff06f          	j	7bc8 <memmove+0x40>
    7c88:	00008067          	ret
    7c8c:	00070613          	mv	a2,a4
    7c90:	f31ff06f          	j	7bc0 <memmove+0x38>

00007c94 <frexp>:
    7c94:	ff010113          	add	sp,sp,-16
    7c98:	00912223          	sw	s1,4(sp)
    7c9c:	800004b7          	lui	s1,0x80000
    7ca0:	00812423          	sw	s0,8(sp)
    7ca4:	00112623          	sw	ra,12(sp)
    7ca8:	fff48493          	add	s1,s1,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    7cac:	00060413          	mv	s0,a2
    7cb0:	00062023          	sw	zero,0(a2)
    7cb4:	00b4f6b3          	and	a3,s1,a1
    7cb8:	7ff00637          	lui	a2,0x7ff00
    7cbc:	00058793          	mv	a5,a1
    7cc0:	00050713          	mv	a4,a0
    7cc4:	04c6f063          	bgeu	a3,a2,7d04 <frexp+0x70>
    7cc8:	00a6e633          	or	a2,a3,a0
    7ccc:	02060c63          	beqz	a2,7d04 <frexp+0x70>
    7cd0:	0145d613          	srl	a2,a1,0x14
    7cd4:	7ff67613          	and	a2,a2,2047
    7cd8:	04060463          	beqz	a2,7d20 <frexp+0x8c>
    7cdc:	00000593          	li	a1,0
    7ce0:	80100637          	lui	a2,0x80100
    7ce4:	4146d693          	sra	a3,a3,0x14
    7ce8:	fff60613          	add	a2,a2,-1 # 800fffff <__crt0_ram_last+0x80000>
    7cec:	c0268693          	add	a3,a3,-1022
    7cf0:	00c7f7b3          	and	a5,a5,a2
    7cf4:	00b686b3          	add	a3,a3,a1
    7cf8:	3fe00637          	lui	a2,0x3fe00
    7cfc:	00c7e7b3          	or	a5,a5,a2
    7d00:	00d42023          	sw	a3,0(s0)
    7d04:	00c12083          	lw	ra,12(sp)
    7d08:	00812403          	lw	s0,8(sp)
    7d0c:	00412483          	lw	s1,4(sp)
    7d10:	00070513          	mv	a0,a4
    7d14:	00078593          	mv	a1,a5
    7d18:	01010113          	add	sp,sp,16
    7d1c:	00008067          	ret
    7d20:	7fff9797          	auipc	a5,0x7fff9
    7d24:	9a078793          	add	a5,a5,-1632 # 800006c0 <__global_locale+0x18c>
    7d28:	0047a683          	lw	a3,4(a5)
    7d2c:	0007a603          	lw	a2,0(a5)
    7d30:	009050ef          	jal	d538 <__muldf3>
    7d34:	00058793          	mv	a5,a1
    7d38:	00b4f6b3          	and	a3,s1,a1
    7d3c:	00050713          	mv	a4,a0
    7d40:	fca00593          	li	a1,-54
    7d44:	f9dff06f          	j	7ce0 <frexp+0x4c>

00007d48 <quorem>:
    7d48:	fb010113          	add	sp,sp,-80
    7d4c:	04912223          	sw	s1,68(sp)
    7d50:	01052783          	lw	a5,16(a0)
    7d54:	0105a483          	lw	s1,16(a1)
    7d58:	04112623          	sw	ra,76(sp)
    7d5c:	00b12423          	sw	a1,8(sp)
    7d60:	2097ca63          	blt	a5,s1,7f74 <quorem+0x22c>
    7d64:	fff48493          	add	s1,s1,-1
    7d68:	03512a23          	sw	s5,52(sp)
    7d6c:	03812423          	sw	s8,40(sp)
    7d70:	00249a93          	sll	s5,s1,0x2
    7d74:	01458c13          	add	s8,a1,20
    7d78:	05212023          	sw	s2,64(sp)
    7d7c:	03312e23          	sw	s3,60(sp)
    7d80:	015c0933          	add	s2,s8,s5
    7d84:	01450993          	add	s3,a0,20
    7d88:	015987b3          	add	a5,s3,s5
    7d8c:	03712623          	sw	s7,44(sp)
    7d90:	00092b83          	lw	s7,0(s2)
    7d94:	03912223          	sw	s9,36(sp)
    7d98:	0007ac83          	lw	s9,0(a5)
    7d9c:	001b8b93          	add	s7,s7,1
    7da0:	03412c23          	sw	s4,56(sp)
    7da4:	000b8593          	mv	a1,s7
    7da8:	00050a13          	mv	s4,a0
    7dac:	000c8513          	mv	a0,s9
    7db0:	04812423          	sw	s0,72(sp)
    7db4:	00f12623          	sw	a5,12(sp)
    7db8:	70d060ef          	jal	ecc4 <__hidden___udivsi3>
    7dbc:	00050413          	mv	s0,a0
    7dc0:	0d7cee63          	bltu	s9,s7,7e9c <quorem+0x154>
    7dc4:	03a12023          	sw	s10,32(sp)
    7dc8:	00010d37          	lui	s10,0x10
    7dcc:	01b12e23          	sw	s11,28(sp)
    7dd0:	03612823          	sw	s6,48(sp)
    7dd4:	000c0a93          	mv	s5,s8
    7dd8:	00098d93          	mv	s11,s3
    7ddc:	00000c93          	li	s9,0
    7de0:	00000b93          	li	s7,0
    7de4:	fffd0d13          	add	s10,s10,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    7de8:	000aab03          	lw	s6,0(s5)
    7dec:	00040593          	mv	a1,s0
    7df0:	004d8d93          	add	s11,s11,4
    7df4:	01ab7533          	and	a0,s6,s10
    7df8:	609060ef          	jal	ec00 <__mulsi3>
    7dfc:	00050793          	mv	a5,a0
    7e00:	00040593          	mv	a1,s0
    7e04:	010b5513          	srl	a0,s6,0x10
    7e08:	01978cb3          	add	s9,a5,s9
    7e0c:	5f5060ef          	jal	ec00 <__mulsi3>
    7e10:	ffcda603          	lw	a2,-4(s11)
    7e14:	01acf733          	and	a4,s9,s10
    7e18:	010cdc93          	srl	s9,s9,0x10
    7e1c:	01a677b3          	and	a5,a2,s10
    7e20:	40e787b3          	sub	a5,a5,a4
    7e24:	017787b3          	add	a5,a5,s7
    7e28:	01950533          	add	a0,a0,s9
    7e2c:	4107d713          	sra	a4,a5,0x10
    7e30:	01a575b3          	and	a1,a0,s10
    7e34:	01065613          	srl	a2,a2,0x10
    7e38:	40b70733          	sub	a4,a4,a1
    7e3c:	00c70733          	add	a4,a4,a2
    7e40:	01a7f7b3          	and	a5,a5,s10
    7e44:	01071613          	sll	a2,a4,0x10
    7e48:	00c7e7b3          	or	a5,a5,a2
    7e4c:	004a8a93          	add	s5,s5,4
    7e50:	fefdae23          	sw	a5,-4(s11)
    7e54:	01055c93          	srl	s9,a0,0x10
    7e58:	41075b93          	sra	s7,a4,0x10
    7e5c:	f95976e3          	bgeu	s2,s5,7de8 <quorem+0xa0>
    7e60:	00c12703          	lw	a4,12(sp)
    7e64:	00072783          	lw	a5,0(a4)
    7e68:	12079063          	bnez	a5,7f88 <quorem+0x240>
    7e6c:	ffc70a93          	add	s5,a4,-4
    7e70:	0159e863          	bltu	s3,s5,7e80 <quorem+0x138>
    7e74:	0180006f          	j	7e8c <quorem+0x144>
    7e78:	fff48493          	add	s1,s1,-1
    7e7c:	0159f863          	bgeu	s3,s5,7e8c <quorem+0x144>
    7e80:	000aa783          	lw	a5,0(s5)
    7e84:	ffca8a93          	add	s5,s5,-4
    7e88:	fe0788e3          	beqz	a5,7e78 <quorem+0x130>
    7e8c:	03012b03          	lw	s6,48(sp)
    7e90:	02012d03          	lw	s10,32(sp)
    7e94:	01c12d83          	lw	s11,28(sp)
    7e98:	009a2823          	sw	s1,16(s4)
    7e9c:	00812583          	lw	a1,8(sp)
    7ea0:	000a0513          	mv	a0,s4
    7ea4:	1fc020ef          	jal	a0a0 <__mcmp>
    7ea8:	08054c63          	bltz	a0,7f40 <quorem+0x1f8>
    7eac:	00010537          	lui	a0,0x10
    7eb0:	00098593          	mv	a1,s3
    7eb4:	00000713          	li	a4,0
    7eb8:	fff50513          	add	a0,a0,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    7ebc:	0005a683          	lw	a3,0(a1)
    7ec0:	000c2603          	lw	a2,0(s8)
    7ec4:	00458593          	add	a1,a1,4
    7ec8:	00a6f7b3          	and	a5,a3,a0
    7ecc:	00a67833          	and	a6,a2,a0
    7ed0:	410787b3          	sub	a5,a5,a6
    7ed4:	00e787b3          	add	a5,a5,a4
    7ed8:	4107d713          	sra	a4,a5,0x10
    7edc:	01065613          	srl	a2,a2,0x10
    7ee0:	0106d693          	srl	a3,a3,0x10
    7ee4:	40c70733          	sub	a4,a4,a2
    7ee8:	00d70733          	add	a4,a4,a3
    7eec:	01071693          	sll	a3,a4,0x10
    7ef0:	00a7f7b3          	and	a5,a5,a0
    7ef4:	00d7e7b3          	or	a5,a5,a3
    7ef8:	004c0c13          	add	s8,s8,4
    7efc:	fef5ae23          	sw	a5,-4(a1)
    7f00:	41075713          	sra	a4,a4,0x10
    7f04:	fb897ce3          	bgeu	s2,s8,7ebc <quorem+0x174>
    7f08:	00249793          	sll	a5,s1,0x2
    7f0c:	00f987b3          	add	a5,s3,a5
    7f10:	0007a703          	lw	a4,0(a5)
    7f14:	02071463          	bnez	a4,7f3c <quorem+0x1f4>
    7f18:	ffc78793          	add	a5,a5,-4
    7f1c:	00f9e863          	bltu	s3,a5,7f2c <quorem+0x1e4>
    7f20:	0180006f          	j	7f38 <quorem+0x1f0>
    7f24:	fff48493          	add	s1,s1,-1
    7f28:	00f9f863          	bgeu	s3,a5,7f38 <quorem+0x1f0>
    7f2c:	0007a703          	lw	a4,0(a5)
    7f30:	ffc78793          	add	a5,a5,-4
    7f34:	fe0708e3          	beqz	a4,7f24 <quorem+0x1dc>
    7f38:	009a2823          	sw	s1,16(s4)
    7f3c:	00140413          	add	s0,s0,1
    7f40:	04c12083          	lw	ra,76(sp)
    7f44:	00040513          	mv	a0,s0
    7f48:	04812403          	lw	s0,72(sp)
    7f4c:	04012903          	lw	s2,64(sp)
    7f50:	03c12983          	lw	s3,60(sp)
    7f54:	03812a03          	lw	s4,56(sp)
    7f58:	03412a83          	lw	s5,52(sp)
    7f5c:	02c12b83          	lw	s7,44(sp)
    7f60:	02812c03          	lw	s8,40(sp)
    7f64:	02412c83          	lw	s9,36(sp)
    7f68:	04412483          	lw	s1,68(sp)
    7f6c:	05010113          	add	sp,sp,80
    7f70:	00008067          	ret
    7f74:	04c12083          	lw	ra,76(sp)
    7f78:	04412483          	lw	s1,68(sp)
    7f7c:	00000513          	li	a0,0
    7f80:	05010113          	add	sp,sp,80
    7f84:	00008067          	ret
    7f88:	00812583          	lw	a1,8(sp)
    7f8c:	000a0513          	mv	a0,s4
    7f90:	03012b03          	lw	s6,48(sp)
    7f94:	02012d03          	lw	s10,32(sp)
    7f98:	01c12d83          	lw	s11,28(sp)
    7f9c:	104020ef          	jal	a0a0 <__mcmp>
    7fa0:	f00556e3          	bgez	a0,7eac <quorem+0x164>
    7fa4:	f9dff06f          	j	7f40 <quorem+0x1f8>

00007fa8 <_dtoa_r>:
    7fa8:	03852303          	lw	t1,56(a0)
    7fac:	f5010113          	add	sp,sp,-176
    7fb0:	0a812423          	sw	s0,168(sp)
    7fb4:	0a912223          	sw	s1,164(sp)
    7fb8:	0b212023          	sw	s2,160(sp)
    7fbc:	09412c23          	sw	s4,152(sp)
    7fc0:	07b12e23          	sw	s11,124(sp)
    7fc4:	0a112623          	sw	ra,172(sp)
    7fc8:	09312e23          	sw	s3,156(sp)
    7fcc:	09512a23          	sw	s5,148(sp)
    7fd0:	00e12a23          	sw	a4,20(sp)
    7fd4:	00f12623          	sw	a5,12(sp)
    7fd8:	01112423          	sw	a7,8(sp)
    7fdc:	02b12223          	sw	a1,36(sp)
    7fe0:	00c12023          	sw	a2,0(sp)
    7fe4:	00050413          	mv	s0,a0
    7fe8:	00058d93          	mv	s11,a1
    7fec:	00060493          	mv	s1,a2
    7ff0:	00068a13          	mv	s4,a3
    7ff4:	00080913          	mv	s2,a6
    7ff8:	02030263          	beqz	t1,801c <_dtoa_r+0x74>
    7ffc:	03c52703          	lw	a4,60(a0)
    8000:	00100793          	li	a5,1
    8004:	00030593          	mv	a1,t1
    8008:	00e797b3          	sll	a5,a5,a4
    800c:	00e32223          	sw	a4,4(t1)
    8010:	00f32423          	sw	a5,8(t1)
    8014:	734010ef          	jal	9748 <_Bfree>
    8018:	02042c23          	sw	zero,56(s0)
    801c:	00048993          	mv	s3,s1
    8020:	00000693          	li	a3,0
    8024:	0004dc63          	bgez	s1,803c <_dtoa_r+0x94>
    8028:	00149493          	sll	s1,s1,0x1
    802c:	0014d793          	srl	a5,s1,0x1
    8030:	00f12023          	sw	a5,0(sp)
    8034:	00078993          	mv	s3,a5
    8038:	00100693          	li	a3,1
    803c:	7ff00737          	lui	a4,0x7ff00
    8040:	00d92023          	sw	a3,0(s2)
    8044:	00e9f6b3          	and	a3,s3,a4
    8048:	64e68463          	beq	a3,a4,8690 <_dtoa_r+0x6e8>
    804c:	00012483          	lw	s1,0(sp)
    8050:	000d8513          	mv	a0,s11
    8054:	00000613          	li	a2,0
    8058:	00048593          	mv	a1,s1
    805c:	00000693          	li	a3,0
    8060:	01b12c23          	sw	s11,24(sp)
    8064:	00912e23          	sw	s1,28(sp)
    8068:	23c050ef          	jal	d2a4 <__eqdf2>
    806c:	04051c63          	bnez	a0,80c4 <_dtoa_r+0x11c>
    8070:	00c12703          	lw	a4,12(sp)
    8074:	00100793          	li	a5,1
    8078:	00f72023          	sw	a5,0(a4) # 7ff00000 <__neorv32_ram_size+0x7fe80000>
    807c:	00812703          	lw	a4,8(sp)
    8080:	00070863          	beqz	a4,8090 <_dtoa_r+0xe8>
    8084:	00007797          	auipc	a5,0x7
    8088:	f4978793          	add	a5,a5,-183 # efcd <__fini_array_end+0x1d5>
    808c:	00f72023          	sw	a5,0(a4)
    8090:	00007a97          	auipc	s5,0x7
    8094:	f3ca8a93          	add	s5,s5,-196 # efcc <__fini_array_end+0x1d4>
    8098:	0ac12083          	lw	ra,172(sp)
    809c:	0a812403          	lw	s0,168(sp)
    80a0:	0a412483          	lw	s1,164(sp)
    80a4:	0a012903          	lw	s2,160(sp)
    80a8:	09c12983          	lw	s3,156(sp)
    80ac:	09812a03          	lw	s4,152(sp)
    80b0:	07c12d83          	lw	s11,124(sp)
    80b4:	000a8513          	mv	a0,s5
    80b8:	09412a83          	lw	s5,148(sp)
    80bc:	0b010113          	add	sp,sp,176
    80c0:	00008067          	ret
    80c4:	00048613          	mv	a2,s1
    80c8:	06810713          	add	a4,sp,104
    80cc:	06c10693          	add	a3,sp,108
    80d0:	000d8593          	mv	a1,s11
    80d4:	00040513          	mv	a0,s0
    80d8:	09612823          	sw	s6,144(sp)
    80dc:	09712623          	sw	s7,140(sp)
    80e0:	09812423          	sw	s8,136(sp)
    80e4:	09912223          	sw	s9,132(sp)
    80e8:	09a12023          	sw	s10,128(sp)
    80ec:	0149d913          	srl	s2,s3,0x14
    80f0:	268020ef          	jal	a358 <__d2b>
    80f4:	00050493          	mv	s1,a0
    80f8:	5c091e63          	bnez	s2,86d4 <_dtoa_r+0x72c>
    80fc:	06812a83          	lw	s5,104(sp)
    8100:	06c12903          	lw	s2,108(sp)
    8104:	02000793          	li	a5,32
    8108:	012a8933          	add	s2,s5,s2
    810c:	43290713          	add	a4,s2,1074
    8110:	36e7dae3          	bge	a5,a4,8c84 <_dtoa_r+0xcdc>
    8114:	04000793          	li	a5,64
    8118:	40e787b3          	sub	a5,a5,a4
    811c:	41290513          	add	a0,s2,1042
    8120:	00f997b3          	sll	a5,s3,a5
    8124:	00add533          	srl	a0,s11,a0
    8128:	00a7e533          	or	a0,a5,a0
    812c:	634060ef          	jal	e760 <__floatunsidf>
    8130:	fe1007b7          	lui	a5,0xfe100
    8134:	00100693          	li	a3,1
    8138:	00050713          	mv	a4,a0
    813c:	00b787b3          	add	a5,a5,a1
    8140:	fff90913          	add	s2,s2,-1
    8144:	02d12c23          	sw	a3,56(sp)
    8148:	7fff8697          	auipc	a3,0x7fff8
    814c:	58068693          	add	a3,a3,1408 # 800006c8 <__global_locale+0x194>
    8150:	0006a603          	lw	a2,0(a3)
    8154:	0046a683          	lw	a3,4(a3)
    8158:	00070513          	mv	a0,a4
    815c:	00078593          	mv	a1,a5
    8160:	369050ef          	jal	dcc8 <__subdf3>
    8164:	7fff8797          	auipc	a5,0x7fff8
    8168:	56c78793          	add	a5,a5,1388 # 800006d0 <__global_locale+0x19c>
    816c:	0007a603          	lw	a2,0(a5)
    8170:	0047a683          	lw	a3,4(a5)
    8174:	3c4050ef          	jal	d538 <__muldf3>
    8178:	7fff8797          	auipc	a5,0x7fff8
    817c:	56078793          	add	a5,a5,1376 # 800006d8 <__global_locale+0x1a4>
    8180:	0007a603          	lw	a2,0(a5)
    8184:	0047a683          	lw	a3,4(a5)
    8188:	7a9030ef          	jal	c130 <__adddf3>
    818c:	00050b13          	mv	s6,a0
    8190:	00090513          	mv	a0,s2
    8194:	00058993          	mv	s3,a1
    8198:	510060ef          	jal	e6a8 <__floatsidf>
    819c:	7fff8797          	auipc	a5,0x7fff8
    81a0:	54478793          	add	a5,a5,1348 # 800006e0 <__global_locale+0x1ac>
    81a4:	0007a603          	lw	a2,0(a5)
    81a8:	0047a683          	lw	a3,4(a5)
    81ac:	38c050ef          	jal	d538 <__muldf3>
    81b0:	00050613          	mv	a2,a0
    81b4:	00058693          	mv	a3,a1
    81b8:	000b0513          	mv	a0,s6
    81bc:	00098593          	mv	a1,s3
    81c0:	771030ef          	jal	c130 <__adddf3>
    81c4:	00050b93          	mv	s7,a0
    81c8:	00058b13          	mv	s6,a1
    81cc:	458060ef          	jal	e624 <__fixdfsi>
    81d0:	00050993          	mv	s3,a0
    81d4:	000b0593          	mv	a1,s6
    81d8:	000b8513          	mv	a0,s7
    81dc:	00000613          	li	a2,0
    81e0:	00000693          	li	a3,0
    81e4:	24c050ef          	jal	d430 <__ledf2>
    81e8:	02055063          	bgez	a0,8208 <_dtoa_r+0x260>
    81ec:	00098513          	mv	a0,s3
    81f0:	4b8060ef          	jal	e6a8 <__floatsidf>
    81f4:	000b8613          	mv	a2,s7
    81f8:	000b0693          	mv	a3,s6
    81fc:	0a8050ef          	jal	d2a4 <__eqdf2>
    8200:	00a03533          	snez	a0,a0
    8204:	40a989b3          	sub	s3,s3,a0
    8208:	412a8ab3          	sub	s5,s5,s2
    820c:	01600793          	li	a5,22
    8210:	fffa8b13          	add	s6,s5,-1
    8214:	2137e2e3          	bltu	a5,s3,8c18 <_dtoa_r+0xc70>
    8218:	00399713          	sll	a4,s3,0x3
    821c:	00007797          	auipc	a5,0x7
    8220:	44c78793          	add	a5,a5,1100 # f668 <__mprec_tens>
    8224:	00e787b3          	add	a5,a5,a4
    8228:	0007a603          	lw	a2,0(a5)
    822c:	0047a683          	lw	a3,4(a5)
    8230:	01812503          	lw	a0,24(sp)
    8234:	01c12583          	lw	a1,28(sp)
    8238:	1f8050ef          	jal	d430 <__ledf2>
    823c:	220554e3          	bgez	a0,8c64 <_dtoa_r+0xcbc>
    8240:	fff98993          	add	s3,s3,-1
    8244:	02012a23          	sw	zero,52(sp)
    8248:	00012823          	sw	zero,16(sp)
    824c:	4a0b4863          	bltz	s6,86fc <_dtoa_r+0x754>
    8250:	4c09d063          	bgez	s3,8710 <_dtoa_r+0x768>
    8254:	01012783          	lw	a5,16(sp)
    8258:	03312023          	sw	s3,32(sp)
    825c:	413787b3          	sub	a5,a5,s3
    8260:	00f12823          	sw	a5,16(sp)
    8264:	413007b3          	neg	a5,s3
    8268:	02f12823          	sw	a5,48(sp)
    826c:	00900793          	li	a5,9
    8270:	00000993          	li	s3,0
    8274:	4b47e863          	bltu	a5,s4,8724 <_dtoa_r+0x77c>
    8278:	00500793          	li	a5,5
    827c:	2147dae3          	bge	a5,s4,8c90 <_dtoa_r+0xce8>
    8280:	ffca0a13          	add	s4,s4,-4
    8284:	00300793          	li	a5,3
    8288:	00000913          	li	s2,0
    828c:	66fa02e3          	beq	s4,a5,90f0 <_dtoa_r+0x1148>
    8290:	6147dae3          	bge	a5,s4,90a4 <_dtoa_r+0x10fc>
    8294:	00400793          	li	a5,4
    8298:	54fa1ae3          	bne	s4,a5,8fec <_dtoa_r+0x1044>
    829c:	00100793          	li	a5,1
    82a0:	02f12423          	sw	a5,40(sp)
    82a4:	01412603          	lw	a2,20(sp)
    82a8:	62c05ce3          	blez	a2,90e0 <_dtoa_r+0x1138>
    82ac:	02c12e23          	sw	a2,60(sp)
    82b0:	00060c13          	mv	s8,a2
    82b4:	01700693          	li	a3,23
    82b8:	00100713          	li	a4,1
    82bc:	00400793          	li	a5,4
    82c0:	00c6c463          	blt	a3,a2,82c8 <_dtoa_r+0x320>
    82c4:	3540106f          	j	9618 <_dtoa_r+0x1670>
    82c8:	00179793          	sll	a5,a5,0x1
    82cc:	01478693          	add	a3,a5,20
    82d0:	00070593          	mv	a1,a4
    82d4:	00170713          	add	a4,a4,1
    82d8:	fed678e3          	bgeu	a2,a3,82c8 <_dtoa_r+0x320>
    82dc:	02b42e23          	sw	a1,60(s0)
    82e0:	00040513          	mv	a0,s0
    82e4:	3b0010ef          	jal	9694 <_Balloc>
    82e8:	00050a93          	mv	s5,a0
    82ec:	00051463          	bnez	a0,82f4 <_dtoa_r+0x34c>
    82f0:	30c0106f          	j	95fc <_dtoa_r+0x1654>
    82f4:	02a42c23          	sw	a0,56(s0)
    82f8:	00e00793          	li	a5,14
    82fc:	5187ea63          	bltu	a5,s8,8810 <_dtoa_r+0x868>
    8300:	50090863          	beqz	s2,8810 <_dtoa_r+0x868>
    8304:	02012783          	lw	a5,32(sp)
    8308:	62f054e3          	blez	a5,9130 <_dtoa_r+0x1188>
    830c:	00f7f713          	and	a4,a5,15
    8310:	00371713          	sll	a4,a4,0x3
    8314:	4047dc93          	sra	s9,a5,0x4
    8318:	00007797          	auipc	a5,0x7
    831c:	35078793          	add	a5,a5,848 # f668 <__mprec_tens>
    8320:	00e787b3          	add	a5,a5,a4
    8324:	010cf693          	and	a3,s9,16
    8328:	0007a803          	lw	a6,0(a5)
    832c:	0047a703          	lw	a4,4(a5)
    8330:	560682e3          	beqz	a3,9094 <_dtoa_r+0x10ec>
    8334:	00007797          	auipc	a5,0x7
    8338:	30c78793          	add	a5,a5,780 # f640 <__mprec_bigtens>
    833c:	0207a603          	lw	a2,32(a5)
    8340:	0247a683          	lw	a3,36(a5)
    8344:	01812503          	lw	a0,24(sp)
    8348:	01c12583          	lw	a1,28(sp)
    834c:	04e12423          	sw	a4,72(sp)
    8350:	05012023          	sw	a6,64(sp)
    8354:	6a4040ef          	jal	c9f8 <__divdf3>
    8358:	04012803          	lw	a6,64(sp)
    835c:	04812703          	lw	a4,72(sp)
    8360:	00fcfc93          	and	s9,s9,15
    8364:	00050313          	mv	t1,a0
    8368:	00058d13          	mv	s10,a1
    836c:	00300913          	li	s2,3
    8370:	040c8c63          	beqz	s9,83c8 <_dtoa_r+0x420>
    8374:	04812023          	sw	s0,64(sp)
    8378:	00007b97          	auipc	s7,0x7
    837c:	2c8b8b93          	add	s7,s7,712 # f640 <__mprec_bigtens>
    8380:	00090413          	mv	s0,s2
    8384:	00070593          	mv	a1,a4
    8388:	00030913          	mv	s2,t1
    838c:	001cf793          	and	a5,s9,1
    8390:	00078e63          	beqz	a5,83ac <_dtoa_r+0x404>
    8394:	000ba603          	lw	a2,0(s7)
    8398:	004ba683          	lw	a3,4(s7)
    839c:	00080513          	mv	a0,a6
    83a0:	00140413          	add	s0,s0,1
    83a4:	194050ef          	jal	d538 <__muldf3>
    83a8:	00050813          	mv	a6,a0
    83ac:	401cdc93          	sra	s9,s9,0x1
    83b0:	008b8b93          	add	s7,s7,8
    83b4:	fc0c9ce3          	bnez	s9,838c <_dtoa_r+0x3e4>
    83b8:	00090313          	mv	t1,s2
    83bc:	00040913          	mv	s2,s0
    83c0:	04012403          	lw	s0,64(sp)
    83c4:	00058713          	mv	a4,a1
    83c8:	00070693          	mv	a3,a4
    83cc:	00080613          	mv	a2,a6
    83d0:	00030513          	mv	a0,t1
    83d4:	000d0593          	mv	a1,s10
    83d8:	620040ef          	jal	c9f8 <__divdf3>
    83dc:	00050713          	mv	a4,a0
    83e0:	00058793          	mv	a5,a1
    83e4:	03412683          	lw	a3,52(sp)
    83e8:	02068c63          	beqz	a3,8420 <_dtoa_r+0x478>
    83ec:	7fff8697          	auipc	a3,0x7fff8
    83f0:	2fc68693          	add	a3,a3,764 # 800006e8 <__global_locale+0x1b4>
    83f4:	0006a603          	lw	a2,0(a3)
    83f8:	0046a683          	lw	a3,4(a3)
    83fc:	00070513          	mv	a0,a4
    8400:	00078593          	mv	a1,a5
    8404:	04e12423          	sw	a4,72(sp)
    8408:	04f12023          	sw	a5,64(sp)
    840c:	024050ef          	jal	d430 <__ledf2>
    8410:	04012783          	lw	a5,64(sp)
    8414:	04812703          	lw	a4,72(sp)
    8418:	00055463          	bgez	a0,8420 <_dtoa_r+0x478>
    841c:	04c0106f          	j	9468 <_dtoa_r+0x14c0>
    8420:	00090513          	mv	a0,s2
    8424:	04f12623          	sw	a5,76(sp)
    8428:	04e12023          	sw	a4,64(sp)
    842c:	27c060ef          	jal	e6a8 <__floatsidf>
    8430:	04012703          	lw	a4,64(sp)
    8434:	04c12783          	lw	a5,76(sp)
    8438:	00070613          	mv	a2,a4
    843c:	00078693          	mv	a3,a5
    8440:	04e12423          	sw	a4,72(sp)
    8444:	04f12023          	sw	a5,64(sp)
    8448:	0f0050ef          	jal	d538 <__muldf3>
    844c:	7fff8697          	auipc	a3,0x7fff8
    8450:	2ac68693          	add	a3,a3,684 # 800006f8 <__global_locale+0x1c4>
    8454:	0006a603          	lw	a2,0(a3)
    8458:	0046a683          	lw	a3,4(a3)
    845c:	4d5030ef          	jal	c130 <__adddf3>
    8460:	fcc006b7          	lui	a3,0xfcc00
    8464:	04012783          	lw	a5,64(sp)
    8468:	04812703          	lw	a4,72(sp)
    846c:	00050c93          	mv	s9,a0
    8470:	00b68bb3          	add	s7,a3,a1
    8474:	340c0463          	beqz	s8,87bc <_dtoa_r+0x814>
    8478:	02012683          	lw	a3,32(sp)
    847c:	05812423          	sw	s8,72(sp)
    8480:	04d12e23          	sw	a3,92(sp)
    8484:	00070513          	mv	a0,a4
    8488:	00078593          	mv	a1,a5
    848c:	04e12623          	sw	a4,76(sp)
    8490:	04f12023          	sw	a5,64(sp)
    8494:	190060ef          	jal	e624 <__fixdfsi>
    8498:	04812783          	lw	a5,72(sp)
    849c:	00050913          	mv	s2,a0
    84a0:	05912c23          	sw	s9,88(sp)
    84a4:	fff78693          	add	a3,a5,-1
    84a8:	00369693          	sll	a3,a3,0x3
    84ac:	00007797          	auipc	a5,0x7
    84b0:	1bc78793          	add	a5,a5,444 # f668 <__mprec_tens>
    84b4:	00d786b3          	add	a3,a5,a3
    84b8:	0006a783          	lw	a5,0(a3) # fcc00000 <__crt0_ram_last+0x7cb80001>
    84bc:	0046a803          	lw	a6,4(a3)
    84c0:	001a8d13          	add	s10,s5,1
    84c4:	04f12823          	sw	a5,80(sp)
    84c8:	05012a23          	sw	a6,84(sp)
    84cc:	1dc060ef          	jal	e6a8 <__floatsidf>
    84d0:	04c12703          	lw	a4,76(sp)
    84d4:	04012783          	lw	a5,64(sp)
    84d8:	00050613          	mv	a2,a0
    84dc:	00058693          	mv	a3,a1
    84e0:	00070513          	mv	a0,a4
    84e4:	00078593          	mv	a1,a5
    84e8:	7e0050ef          	jal	dcc8 <__subdf3>
    84ec:	02812703          	lw	a4,40(sp)
    84f0:	03090313          	add	t1,s2,48
    84f4:	05a12023          	sw	s10,64(sp)
    84f8:	00050c93          	mv	s9,a0
    84fc:	0ff37313          	zext.b	t1,t1
    8500:	5c0706e3          	beqz	a4,92cc <_dtoa_r+0x1324>
    8504:	7fff8797          	auipc	a5,0x7fff8
    8508:	1b478793          	add	a5,a5,436 # 800006b8 <__global_locale+0x184>
    850c:	0007a503          	lw	a0,0(a5)
    8510:	05012603          	lw	a2,80(sp)
    8514:	05412683          	lw	a3,84(sp)
    8518:	04b12023          	sw	a1,64(sp)
    851c:	0047a583          	lw	a1,4(a5)
    8520:	04612623          	sw	t1,76(sp)
    8524:	4d4040ef          	jal	c9f8 <__divdf3>
    8528:	05812603          	lw	a2,88(sp)
    852c:	000b8693          	mv	a3,s7
    8530:	798050ef          	jal	dcc8 <__subdf3>
    8534:	04012883          	lw	a7,64(sp)
    8538:	04c12303          	lw	t1,76(sp)
    853c:	000c8613          	mv	a2,s9
    8540:	00088693          	mv	a3,a7
    8544:	006a8023          	sb	t1,0(s5)
    8548:	00050913          	mv	s2,a0
    854c:	00058b93          	mv	s7,a1
    8550:	5e1040ef          	jal	d330 <__gedf2>
    8554:	04012883          	lw	a7,64(sp)
    8558:	00a05463          	blez	a0,8560 <_dtoa_r+0x5b8>
    855c:	7c90006f          	j	9524 <_dtoa_r+0x157c>
    8560:	7fff8697          	auipc	a3,0x7fff8
    8564:	18868693          	add	a3,a3,392 # 800006e8 <__global_locale+0x1b4>
    8568:	0006a783          	lw	a5,0(a3)
    856c:	0046a803          	lw	a6,4(a3)
    8570:	05312623          	sw	s3,76(sp)
    8574:	04f12023          	sw	a5,64(sp)
    8578:	00000793          	li	a5,0
    857c:	05612823          	sw	s6,80(sp)
    8580:	05812c23          	sw	s8,88(sp)
    8584:	05012223          	sw	a6,68(sp)
    8588:	04812c03          	lw	s8,72(sp)
    858c:	00078b13          	mv	s6,a5
    8590:	05412423          	sw	s4,72(sp)
    8594:	00088993          	mv	s3,a7
    8598:	0980006f          	j	8630 <_dtoa_r+0x688>
    859c:	001b0b13          	add	s6,s6,1
    85a0:	018b4463          	blt	s6,s8,85a8 <_dtoa_r+0x600>
    85a4:	7d10006f          	j	9574 <_dtoa_r+0x15cc>
    85a8:	7fff8a17          	auipc	s4,0x7fff8
    85ac:	148a0a13          	add	s4,s4,328 # 800006f0 <__global_locale+0x1bc>
    85b0:	000a2603          	lw	a2,0(s4)
    85b4:	004a2683          	lw	a3,4(s4)
    85b8:	00090513          	mv	a0,s2
    85bc:	000b8593          	mv	a1,s7
    85c0:	779040ef          	jal	d538 <__muldf3>
    85c4:	000a2603          	lw	a2,0(s4)
    85c8:	004a2683          	lw	a3,4(s4)
    85cc:	00050913          	mv	s2,a0
    85d0:	00058b93          	mv	s7,a1
    85d4:	000c8513          	mv	a0,s9
    85d8:	00098593          	mv	a1,s3
    85dc:	75d040ef          	jal	d538 <__muldf3>
    85e0:	00058c93          	mv	s9,a1
    85e4:	00050a13          	mv	s4,a0
    85e8:	03c060ef          	jal	e624 <__fixdfsi>
    85ec:	00050993          	mv	s3,a0
    85f0:	0b8060ef          	jal	e6a8 <__floatsidf>
    85f4:	00050613          	mv	a2,a0
    85f8:	00058693          	mv	a3,a1
    85fc:	000a0513          	mv	a0,s4
    8600:	000c8593          	mv	a1,s9
    8604:	6c4050ef          	jal	dcc8 <__subdf3>
    8608:	03098793          	add	a5,s3,48
    860c:	00090613          	mv	a2,s2
    8610:	000b8693          	mv	a3,s7
    8614:	00fd0023          	sb	a5,0(s10)
    8618:	001d0d13          	add	s10,s10,1
    861c:	00050c93          	mv	s9,a0
    8620:	00058993          	mv	s3,a1
    8624:	60d040ef          	jal	d430 <__ledf2>
    8628:	00055463          	bgez	a0,8630 <_dtoa_r+0x688>
    862c:	6f90006f          	j	9524 <_dtoa_r+0x157c>
    8630:	04012503          	lw	a0,64(sp)
    8634:	04412583          	lw	a1,68(sp)
    8638:	000c8613          	mv	a2,s9
    863c:	00098693          	mv	a3,s3
    8640:	688050ef          	jal	dcc8 <__subdf3>
    8644:	00090613          	mv	a2,s2
    8648:	000b8693          	mv	a3,s7
    864c:	5e5040ef          	jal	d430 <__ledf2>
    8650:	f40556e3          	bgez	a0,859c <_dtoa_r+0x5f4>
    8654:	05c12783          	lw	a5,92(sp)
    8658:	000d0b93          	mv	s7,s10
    865c:	00178c13          	add	s8,a5,1
    8660:	03900613          	li	a2,57
    8664:	0080006f          	j	866c <_dtoa_r+0x6c4>
    8668:	697a88e3          	beq	s5,s7,94f8 <_dtoa_r+0x1550>
    866c:	fffbc683          	lbu	a3,-1(s7)
    8670:	000b8d13          	mv	s10,s7
    8674:	fffb8b93          	add	s7,s7,-1
    8678:	fec688e3          	beq	a3,a2,8668 <_dtoa_r+0x6c0>
    867c:	00168693          	add	a3,a3,1
    8680:	0ff6f693          	zext.b	a3,a3
    8684:	00db8023          	sb	a3,0(s7)
    8688:	000c0a13          	mv	s4,s8
    868c:	4f00006f          	j	8b7c <_dtoa_r+0xbd4>
    8690:	00c12683          	lw	a3,12(sp)
    8694:	00002737          	lui	a4,0x2
    8698:	00c99793          	sll	a5,s3,0xc
    869c:	70f70713          	add	a4,a4,1807 # 270f <_vfprintf_r+0x967>
    86a0:	00c7d793          	srl	a5,a5,0xc
    86a4:	00e6a023          	sw	a4,0(a3)
    86a8:	01b7e7b3          	or	a5,a5,s11
    86ac:	0a078063          	beqz	a5,874c <_dtoa_r+0x7a4>
    86b0:	00812783          	lw	a5,8(sp)
    86b4:	00007a97          	auipc	s5,0x7
    86b8:	970a8a93          	add	s5,s5,-1680 # f024 <__fini_array_end+0x22c>
    86bc:	9c078ee3          	beqz	a5,8098 <_dtoa_r+0xf0>
    86c0:	00007797          	auipc	a5,0x7
    86c4:	96778793          	add	a5,a5,-1689 # f027 <__fini_array_end+0x22f>
    86c8:	00812703          	lw	a4,8(sp)
    86cc:	00f72023          	sw	a5,0(a4)
    86d0:	9c9ff06f          	j	8098 <_dtoa_r+0xf0>
    86d4:	01c12783          	lw	a5,28(sp)
    86d8:	3ff006b7          	lui	a3,0x3ff00
    86dc:	06812a83          	lw	s5,104(sp)
    86e0:	00c79793          	sll	a5,a5,0xc
    86e4:	00c7d793          	srl	a5,a5,0xc
    86e8:	01812703          	lw	a4,24(sp)
    86ec:	00d7e7b3          	or	a5,a5,a3
    86f0:	c0190913          	add	s2,s2,-1023
    86f4:	02012c23          	sw	zero,56(sp)
    86f8:	a51ff06f          	j	8148 <_dtoa_r+0x1a0>
    86fc:	00100793          	li	a5,1
    8700:	415787b3          	sub	a5,a5,s5
    8704:	00f12823          	sw	a5,16(sp)
    8708:	00000b13          	li	s6,0
    870c:	b409c4e3          	bltz	s3,8254 <_dtoa_r+0x2ac>
    8710:	03312023          	sw	s3,32(sp)
    8714:	02012823          	sw	zero,48(sp)
    8718:	00900793          	li	a5,9
    871c:	013b0b33          	add	s6,s6,s3
    8720:	b547fce3          	bgeu	a5,s4,8278 <_dtoa_r+0x2d0>
    8724:	00100793          	li	a5,1
    8728:	00100913          	li	s2,1
    872c:	00000a13          	li	s4,0
    8730:	02f12423          	sw	a5,40(sp)
    8734:	fff00c13          	li	s8,-1
    8738:	00012a23          	sw	zero,20(sp)
    873c:	02042e23          	sw	zero,60(s0)
    8740:	03812e23          	sw	s8,60(sp)
    8744:	00000593          	li	a1,0
    8748:	b99ff06f          	j	82e0 <_dtoa_r+0x338>
    874c:	00812703          	lw	a4,8(sp)
    8750:	00007a97          	auipc	s5,0x7
    8754:	8c8a8a93          	add	s5,s5,-1848 # f018 <__fini_array_end+0x220>
    8758:	00007797          	auipc	a5,0x7
    875c:	8c878793          	add	a5,a5,-1848 # f020 <__fini_array_end+0x228>
    8760:	f60714e3          	bnez	a4,86c8 <_dtoa_r+0x720>
    8764:	935ff06f          	j	8098 <_dtoa_r+0xf0>
    8768:	00090513          	mv	a0,s2
    876c:	04f12623          	sw	a5,76(sp)
    8770:	04e12023          	sw	a4,64(sp)
    8774:	735050ef          	jal	e6a8 <__floatsidf>
    8778:	04012703          	lw	a4,64(sp)
    877c:	04c12783          	lw	a5,76(sp)
    8780:	00070613          	mv	a2,a4
    8784:	00078693          	mv	a3,a5
    8788:	04e12423          	sw	a4,72(sp)
    878c:	04f12023          	sw	a5,64(sp)
    8790:	5a9040ef          	jal	d538 <__muldf3>
    8794:	7fff8697          	auipc	a3,0x7fff8
    8798:	f6468693          	add	a3,a3,-156 # 800006f8 <__global_locale+0x1c4>
    879c:	0006a603          	lw	a2,0(a3)
    87a0:	0046a683          	lw	a3,4(a3)
    87a4:	18d030ef          	jal	c130 <__adddf3>
    87a8:	04012783          	lw	a5,64(sp)
    87ac:	04812703          	lw	a4,72(sp)
    87b0:	fcc006b7          	lui	a3,0xfcc00
    87b4:	00050c93          	mv	s9,a0
    87b8:	00b68bb3          	add	s7,a3,a1
    87bc:	7fff8697          	auipc	a3,0x7fff8
    87c0:	f4468693          	add	a3,a3,-188 # 80000700 <__global_locale+0x1cc>
    87c4:	0006a603          	lw	a2,0(a3)
    87c8:	0046a683          	lw	a3,4(a3)
    87cc:	00070513          	mv	a0,a4
    87d0:	00078593          	mv	a1,a5
    87d4:	4f4050ef          	jal	dcc8 <__subdf3>
    87d8:	000c8613          	mv	a2,s9
    87dc:	000b8693          	mv	a3,s7
    87e0:	00050d13          	mv	s10,a0
    87e4:	00058913          	mv	s2,a1
    87e8:	349040ef          	jal	d330 <__gedf2>
    87ec:	50a04ce3          	bgtz	a0,9504 <_dtoa_r+0x155c>
    87f0:	800007b7          	lui	a5,0x80000
    87f4:	0177c7b3          	xor	a5,a5,s7
    87f8:	000c8613          	mv	a2,s9
    87fc:	000d0513          	mv	a0,s10
    8800:	00078693          	mv	a3,a5
    8804:	00090593          	mv	a1,s2
    8808:	429040ef          	jal	d430 <__ledf2>
    880c:	06054c63          	bltz	a0,8884 <_dtoa_r+0x8dc>
    8810:	06c12783          	lw	a5,108(sp)
    8814:	1a07c663          	bltz	a5,89c0 <_dtoa_r+0xa18>
    8818:	02012683          	lw	a3,32(sp)
    881c:	00e00713          	li	a4,14
    8820:	1ad74063          	blt	a4,a3,89c0 <_dtoa_r+0xa18>
    8824:	02012783          	lw	a5,32(sp)
    8828:	00379713          	sll	a4,a5,0x3
    882c:	00007797          	auipc	a5,0x7
    8830:	e3c78793          	add	a5,a5,-452 # f668 <__mprec_tens>
    8834:	00e787b3          	add	a5,a5,a4
    8838:	0007a903          	lw	s2,0(a5)
    883c:	0047a983          	lw	s3,4(a5)
    8840:	01412783          	lw	a5,20(sp)
    8844:	0407dc63          	bgez	a5,889c <_dtoa_r+0x8f4>
    8848:	05804a63          	bgtz	s8,889c <_dtoa_r+0x8f4>
    884c:	020c1c63          	bnez	s8,8884 <_dtoa_r+0x8dc>
    8850:	7fff8797          	auipc	a5,0x7fff8
    8854:	eb078793          	add	a5,a5,-336 # 80000700 <__global_locale+0x1cc>
    8858:	0007a603          	lw	a2,0(a5)
    885c:	0047a683          	lw	a3,4(a5)
    8860:	00090513          	mv	a0,s2
    8864:	00098593          	mv	a1,s3
    8868:	4d1040ef          	jal	d538 <__muldf3>
    886c:	00050613          	mv	a2,a0
    8870:	00058693          	mv	a3,a1
    8874:	01812503          	lw	a0,24(sp)
    8878:	01c12583          	lw	a1,28(sp)
    887c:	3b5040ef          	jal	d430 <__ledf2>
    8880:	48a042e3          	bgtz	a0,9504 <_dtoa_r+0x155c>
    8884:	000a8d13          	mv	s10,s5
    8888:	00012c23          	sw	zero,24(sp)
    888c:	00000913          	li	s2,0
    8890:	01412783          	lw	a5,20(sp)
    8894:	fff7ca13          	not	s4,a5
    8898:	6980006f          	j	8f30 <_dtoa_r+0xf88>
    889c:	001a8793          	add	a5,s5,1
    88a0:	04f12023          	sw	a5,64(sp)
    88a4:	01812b03          	lw	s6,24(sp)
    88a8:	01c12a03          	lw	s4,28(sp)
    88ac:	00090613          	mv	a2,s2
    88b0:	00098693          	mv	a3,s3
    88b4:	000b0513          	mv	a0,s6
    88b8:	000a0593          	mv	a1,s4
    88bc:	13c040ef          	jal	c9f8 <__divdf3>
    88c0:	565050ef          	jal	e624 <__fixdfsi>
    88c4:	00050d13          	mv	s10,a0
    88c8:	5e1050ef          	jal	e6a8 <__floatsidf>
    88cc:	00090613          	mv	a2,s2
    88d0:	00098693          	mv	a3,s3
    88d4:	465040ef          	jal	d538 <__muldf3>
    88d8:	00050613          	mv	a2,a0
    88dc:	00058693          	mv	a3,a1
    88e0:	000b0513          	mv	a0,s6
    88e4:	000a0593          	mv	a1,s4
    88e8:	3e0050ef          	jal	dcc8 <__subdf3>
    88ec:	030d0793          	add	a5,s10,48
    88f0:	00fa8023          	sb	a5,0(s5)
    88f4:	00100613          	li	a2,1
    88f8:	04012b83          	lw	s7,64(sp)
    88fc:	00050713          	mv	a4,a0
    8900:	00058693          	mv	a3,a1
    8904:	0ccc0ee3          	beq	s8,a2,91e0 <_dtoa_r+0x1238>
    8908:	7fff8617          	auipc	a2,0x7fff8
    890c:	de860613          	add	a2,a2,-536 # 800006f0 <__global_locale+0x1bc>
    8910:	00062783          	lw	a5,0(a2)
    8914:	00462803          	lw	a6,4(a2)
    8918:	00100d93          	li	s11,1
    891c:	00f12023          	sw	a5,0(sp)
    8920:	01012223          	sw	a6,4(sp)
    8924:	0600006f          	j	8984 <_dtoa_r+0x9dc>
    8928:	00090613          	mv	a2,s2
    892c:	00098693          	mv	a3,s3
    8930:	000b0513          	mv	a0,s6
    8934:	000a0593          	mv	a1,s4
    8938:	0c0040ef          	jal	c9f8 <__divdf3>
    893c:	4e9050ef          	jal	e624 <__fixdfsi>
    8940:	00050d13          	mv	s10,a0
    8944:	565050ef          	jal	e6a8 <__floatsidf>
    8948:	00090613          	mv	a2,s2
    894c:	00098693          	mv	a3,s3
    8950:	3e9040ef          	jal	d538 <__muldf3>
    8954:	00058693          	mv	a3,a1
    8958:	00050613          	mv	a2,a0
    895c:	000a0593          	mv	a1,s4
    8960:	000b0513          	mv	a0,s6
    8964:	364050ef          	jal	dcc8 <__subdf3>
    8968:	001b8b93          	add	s7,s7,1
    896c:	030d0793          	add	a5,s10,48
    8970:	001d8d93          	add	s11,s11,1
    8974:	fefb8fa3          	sb	a5,-1(s7)
    8978:	00050713          	mv	a4,a0
    897c:	00058693          	mv	a3,a1
    8980:	07bc00e3          	beq	s8,s11,91e0 <_dtoa_r+0x1238>
    8984:	00012603          	lw	a2,0(sp)
    8988:	00068593          	mv	a1,a3
    898c:	00412683          	lw	a3,4(sp)
    8990:	00070513          	mv	a0,a4
    8994:	3a5040ef          	jal	d538 <__muldf3>
    8998:	00000613          	li	a2,0
    899c:	00000693          	li	a3,0
    89a0:	00050b13          	mv	s6,a0
    89a4:	00058a13          	mv	s4,a1
    89a8:	0fd040ef          	jal	d2a4 <__eqdf2>
    89ac:	f6051ee3          	bnez	a0,8928 <_dtoa_r+0x980>
    89b0:	02012783          	lw	a5,32(sp)
    89b4:	000b8d13          	mv	s10,s7
    89b8:	00178a13          	add	s4,a5,1
    89bc:	1c00006f          	j	8b7c <_dtoa_r+0xbd4>
    89c0:	02812703          	lw	a4,40(sp)
    89c4:	26071463          	bnez	a4,8c2c <_dtoa_r+0xc84>
    89c8:	03012b83          	lw	s7,48(sp)
    89cc:	01012c83          	lw	s9,16(sp)
    89d0:	02012423          	sw	zero,40(sp)
    89d4:	00000913          	li	s2,0
    89d8:	020c8263          	beqz	s9,89fc <_dtoa_r+0xa54>
    89dc:	03605063          	blez	s6,89fc <_dtoa_r+0xa54>
    89e0:	000c8793          	mv	a5,s9
    89e4:	679b4263          	blt	s6,s9,9048 <_dtoa_r+0x10a0>
    89e8:	01012703          	lw	a4,16(sp)
    89ec:	40fc8cb3          	sub	s9,s9,a5
    89f0:	40fb0b33          	sub	s6,s6,a5
    89f4:	40f70733          	sub	a4,a4,a5
    89f8:	00e12823          	sw	a4,16(sp)
    89fc:	03012783          	lw	a5,48(sp)
    8a00:	02078263          	beqz	a5,8a24 <_dtoa_r+0xa7c>
    8a04:	02812783          	lw	a5,40(sp)
    8a08:	00078463          	beqz	a5,8a10 <_dtoa_r+0xa68>
    8a0c:	060b9ae3          	bnez	s7,9280 <_dtoa_r+0x12d8>
    8a10:	03012603          	lw	a2,48(sp)
    8a14:	00048593          	mv	a1,s1
    8a18:	00040513          	mv	a0,s0
    8a1c:	3a4010ef          	jal	9dc0 <__pow5mult>
    8a20:	00050493          	mv	s1,a0
    8a24:	00100593          	li	a1,1
    8a28:	00040513          	mv	a0,s0
    8a2c:	01c010ef          	jal	9a48 <__i2b>
    8a30:	00a12c23          	sw	a0,24(sp)
    8a34:	50099a63          	bnez	s3,8f48 <_dtoa_r+0xfa0>
    8a38:	00100793          	li	a5,1
    8a3c:	5547da63          	bge	a5,s4,8f90 <_dtoa_r+0xfe8>
    8a40:	016787b3          	add	a5,a5,s6
    8a44:	01f7f793          	and	a5,a5,31
    8a48:	1c078e63          	beqz	a5,8c24 <_dtoa_r+0xc7c>
    8a4c:	02000713          	li	a4,32
    8a50:	40f70733          	sub	a4,a4,a5
    8a54:	00400693          	li	a3,4
    8a58:	58e6d263          	bge	a3,a4,8fdc <_dtoa_r+0x1034>
    8a5c:	01c00713          	li	a4,28
    8a60:	40f707b3          	sub	a5,a4,a5
    8a64:	01012703          	lw	a4,16(sp)
    8a68:	00fc8cb3          	add	s9,s9,a5
    8a6c:	00fb0b33          	add	s6,s6,a5
    8a70:	00f70733          	add	a4,a4,a5
    8a74:	00e12823          	sw	a4,16(sp)
    8a78:	01012783          	lw	a5,16(sp)
    8a7c:	12f04e63          	bgtz	a5,8bb8 <_dtoa_r+0xc10>
    8a80:	01605c63          	blez	s6,8a98 <_dtoa_r+0xaf0>
    8a84:	01812583          	lw	a1,24(sp)
    8a88:	000b0613          	mv	a2,s6
    8a8c:	00040513          	mv	a0,s0
    8a90:	480010ef          	jal	9f10 <__lshift>
    8a94:	00a12c23          	sw	a0,24(sp)
    8a98:	03412783          	lw	a5,52(sp)
    8a9c:	12079a63          	bnez	a5,8bd0 <_dtoa_r+0xc28>
    8aa0:	45805263          	blez	s8,8ee4 <_dtoa_r+0xf3c>
    8aa4:	02812783          	lw	a5,40(sp)
    8aa8:	24079e63          	bnez	a5,8d04 <_dtoa_r+0xd5c>
    8aac:	02012783          	lw	a5,32(sp)
    8ab0:	00178a13          	add	s4,a5,1
    8ab4:	01812b03          	lw	s6,24(sp)
    8ab8:	00100993          	li	s3,1
    8abc:	0200006f          	j	8adc <_dtoa_r+0xb34>
    8ac0:	00048593          	mv	a1,s1
    8ac4:	00000693          	li	a3,0
    8ac8:	00a00613          	li	a2,10
    8acc:	00040513          	mv	a0,s0
    8ad0:	49d000ef          	jal	976c <__multadd>
    8ad4:	00050493          	mv	s1,a0
    8ad8:	00198993          	add	s3,s3,1
    8adc:	000b0593          	mv	a1,s6
    8ae0:	00048513          	mv	a0,s1
    8ae4:	a64ff0ef          	jal	7d48 <quorem>
    8ae8:	03050b93          	add	s7,a0,48
    8aec:	013a87b3          	add	a5,s5,s3
    8af0:	ff778fa3          	sb	s7,-1(a5)
    8af4:	fd89c6e3          	blt	s3,s8,8ac0 <_dtoa_r+0xb18>
    8af8:	00100993          	li	s3,1
    8afc:	55804263          	bgtz	s8,9040 <_dtoa_r+0x1098>
    8b00:	013a89b3          	add	s3,s5,s3
    8b04:	00000c13          	li	s8,0
    8b08:	00048593          	mv	a1,s1
    8b0c:	00100613          	li	a2,1
    8b10:	00040513          	mv	a0,s0
    8b14:	3fc010ef          	jal	9f10 <__lshift>
    8b18:	01812583          	lw	a1,24(sp)
    8b1c:	00050493          	mv	s1,a0
    8b20:	580010ef          	jal	a0a0 <__mcmp>
    8b24:	4ea05c63          	blez	a0,901c <_dtoa_r+0x1074>
    8b28:	03900693          	li	a3,57
    8b2c:	0080006f          	j	8b34 <_dtoa_r+0xb8c>
    8b30:	5f3a8863          	beq	s5,s3,9120 <_dtoa_r+0x1178>
    8b34:	fff9c783          	lbu	a5,-1(s3)
    8b38:	00098d13          	mv	s10,s3
    8b3c:	fff98993          	add	s3,s3,-1
    8b40:	fed788e3          	beq	a5,a3,8b30 <_dtoa_r+0xb88>
    8b44:	00178793          	add	a5,a5,1
    8b48:	00f98023          	sb	a5,0(s3)
    8b4c:	01812583          	lw	a1,24(sp)
    8b50:	00040513          	mv	a0,s0
    8b54:	3f5000ef          	jal	9748 <_Bfree>
    8b58:	02090263          	beqz	s2,8b7c <_dtoa_r+0xbd4>
    8b5c:	000c0a63          	beqz	s8,8b70 <_dtoa_r+0xbc8>
    8b60:	012c0863          	beq	s8,s2,8b70 <_dtoa_r+0xbc8>
    8b64:	000c0593          	mv	a1,s8
    8b68:	00040513          	mv	a0,s0
    8b6c:	3dd000ef          	jal	9748 <_Bfree>
    8b70:	00090593          	mv	a1,s2
    8b74:	00040513          	mv	a0,s0
    8b78:	3d1000ef          	jal	9748 <_Bfree>
    8b7c:	00048593          	mv	a1,s1
    8b80:	00040513          	mv	a0,s0
    8b84:	3c5000ef          	jal	9748 <_Bfree>
    8b88:	00c12783          	lw	a5,12(sp)
    8b8c:	000d0023          	sb	zero,0(s10)
    8b90:	0147a023          	sw	s4,0(a5)
    8b94:	00812783          	lw	a5,8(sp)
    8b98:	00078463          	beqz	a5,8ba0 <_dtoa_r+0xbf8>
    8b9c:	01a7a023          	sw	s10,0(a5)
    8ba0:	09012b03          	lw	s6,144(sp)
    8ba4:	08c12b83          	lw	s7,140(sp)
    8ba8:	08812c03          	lw	s8,136(sp)
    8bac:	08412c83          	lw	s9,132(sp)
    8bb0:	08012d03          	lw	s10,128(sp)
    8bb4:	ce4ff06f          	j	8098 <_dtoa_r+0xf0>
    8bb8:	00048593          	mv	a1,s1
    8bbc:	00078613          	mv	a2,a5
    8bc0:	00040513          	mv	a0,s0
    8bc4:	34c010ef          	jal	9f10 <__lshift>
    8bc8:	00050493          	mv	s1,a0
    8bcc:	eb5ff06f          	j	8a80 <_dtoa_r+0xad8>
    8bd0:	01812583          	lw	a1,24(sp)
    8bd4:	00048513          	mv	a0,s1
    8bd8:	4c8010ef          	jal	a0a0 <__mcmp>
    8bdc:	ec0552e3          	bgez	a0,8aa0 <_dtoa_r+0xaf8>
    8be0:	02012783          	lw	a5,32(sp)
    8be4:	00048593          	mv	a1,s1
    8be8:	00000693          	li	a3,0
    8bec:	00a00613          	li	a2,10
    8bf0:	00040513          	mv	a0,s0
    8bf4:	fff78b13          	add	s6,a5,-1
    8bf8:	375000ef          	jal	976c <__multadd>
    8bfc:	02812783          	lw	a5,40(sp)
    8c00:	00050493          	mv	s1,a0
    8c04:	0c079e63          	bnez	a5,8ce0 <_dtoa_r+0xd38>
    8c08:	03c12c03          	lw	s8,60(sp)
    8c0c:	17805ee3          	blez	s8,9588 <_dtoa_r+0x15e0>
    8c10:	02012a03          	lw	s4,32(sp)
    8c14:	ea1ff06f          	j	8ab4 <_dtoa_r+0xb0c>
    8c18:	00100793          	li	a5,1
    8c1c:	02f12a23          	sw	a5,52(sp)
    8c20:	e28ff06f          	j	8248 <_dtoa_r+0x2a0>
    8c24:	01c00793          	li	a5,28
    8c28:	e3dff06f          	j	8a64 <_dtoa_r+0xabc>
    8c2c:	00100713          	li	a4,1
    8c30:	4d475463          	bge	a4,s4,90f8 <_dtoa_r+0x1150>
    8c34:	03012783          	lw	a5,48(sp)
    8c38:	fffc0b93          	add	s7,s8,-1
    8c3c:	4177ca63          	blt	a5,s7,9050 <_dtoa_r+0x10a8>
    8c40:	41778bb3          	sub	s7,a5,s7
    8c44:	01012783          	lw	a5,16(sp)
    8c48:	41878cb3          	sub	s9,a5,s8
    8c4c:	100c54e3          	bgez	s8,9554 <_dtoa_r+0x15ac>
    8c50:	00100593          	li	a1,1
    8c54:	00040513          	mv	a0,s0
    8c58:	5f1000ef          	jal	9a48 <__i2b>
    8c5c:	00050913          	mv	s2,a0
    8c60:	d79ff06f          	j	89d8 <_dtoa_r+0xa30>
    8c64:	02012a23          	sw	zero,52(sp)
    8c68:	00012823          	sw	zero,16(sp)
    8c6c:	ab5042e3          	bgtz	s5,8710 <_dtoa_r+0x768>
    8c70:	00100793          	li	a5,1
    8c74:	415787b3          	sub	a5,a5,s5
    8c78:	00f12823          	sw	a5,16(sp)
    8c7c:	00000b13          	li	s6,0
    8c80:	a91ff06f          	j	8710 <_dtoa_r+0x768>
    8c84:	40e787b3          	sub	a5,a5,a4
    8c88:	00fd9533          	sll	a0,s11,a5
    8c8c:	ca0ff06f          	j	812c <_dtoa_r+0x184>
    8c90:	00300793          	li	a5,3
    8c94:	00100913          	li	s2,1
    8c98:	44fa0c63          	beq	s4,a5,90f0 <_dtoa_r+0x1148>
    8c9c:	df47cc63          	blt	a5,s4,8294 <_dtoa_r+0x2ec>
    8ca0:	00200793          	li	a5,2
    8ca4:	18fa00e3          	beq	s4,a5,9624 <_dtoa_r+0x167c>
    8ca8:	02042e23          	sw	zero,60(s0)
    8cac:	00000593          	li	a1,0
    8cb0:	00040513          	mv	a0,s0
    8cb4:	1e1000ef          	jal	9694 <_Balloc>
    8cb8:	00050a93          	mv	s5,a0
    8cbc:	140500e3          	beqz	a0,95fc <_dtoa_r+0x1654>
    8cc0:	00100793          	li	a5,1
    8cc4:	02f12423          	sw	a5,40(sp)
    8cc8:	fff00793          	li	a5,-1
    8ccc:	02a42c23          	sw	a0,56(s0)
    8cd0:	02f12e23          	sw	a5,60(sp)
    8cd4:	fff00c13          	li	s8,-1
    8cd8:	00012a23          	sw	zero,20(sp)
    8cdc:	b35ff06f          	j	8810 <_dtoa_r+0x868>
    8ce0:	00090593          	mv	a1,s2
    8ce4:	00000693          	li	a3,0
    8ce8:	00a00613          	li	a2,10
    8cec:	00040513          	mv	a0,s0
    8cf0:	27d000ef          	jal	976c <__multadd>
    8cf4:	03c12c03          	lw	s8,60(sp)
    8cf8:	00050913          	mv	s2,a0
    8cfc:	0b805ae3          	blez	s8,95b0 <_dtoa_r+0x1608>
    8d00:	03612023          	sw	s6,32(sp)
    8d04:	01905c63          	blez	s9,8d1c <_dtoa_r+0xd74>
    8d08:	00090593          	mv	a1,s2
    8d0c:	000c8613          	mv	a2,s9
    8d10:	00040513          	mv	a0,s0
    8d14:	1fc010ef          	jal	9f10 <__lshift>
    8d18:	00050913          	mv	s2,a0
    8d1c:	00090b13          	mv	s6,s2
    8d20:	50099e63          	bnez	s3,923c <_dtoa_r+0x1294>
    8d24:	02412783          	lw	a5,36(sp)
    8d28:	fffa8d13          	add	s10,s5,-1
    8d2c:	000a8c93          	mv	s9,s5
    8d30:	01512823          	sw	s5,16(sp)
    8d34:	01812a83          	lw	s5,24(sp)
    8d38:	0017f793          	and	a5,a5,1
    8d3c:	018d0d33          	add	s10,s10,s8
    8d40:	00f12023          	sw	a5,0(sp)
    8d44:	01b12a23          	sw	s11,20(sp)
    8d48:	000a8593          	mv	a1,s5
    8d4c:	00048513          	mv	a0,s1
    8d50:	ff9fe0ef          	jal	7d48 <quorem>
    8d54:	00050c13          	mv	s8,a0
    8d58:	00090593          	mv	a1,s2
    8d5c:	00048513          	mv	a0,s1
    8d60:	340010ef          	jal	a0a0 <__mcmp>
    8d64:	00050993          	mv	s3,a0
    8d68:	000b0613          	mv	a2,s6
    8d6c:	000a8593          	mv	a1,s5
    8d70:	00040513          	mv	a0,s0
    8d74:	384010ef          	jal	a0f8 <__mdiff>
    8d78:	00c52703          	lw	a4,12(a0)
    8d7c:	030c0b93          	add	s7,s8,48
    8d80:	00050d93          	mv	s11,a0
    8d84:	08071c63          	bnez	a4,8e1c <_dtoa_r+0xe74>
    8d88:	00050593          	mv	a1,a0
    8d8c:	00048513          	mv	a0,s1
    8d90:	310010ef          	jal	a0a0 <__mcmp>
    8d94:	00050713          	mv	a4,a0
    8d98:	000d8593          	mv	a1,s11
    8d9c:	00040513          	mv	a0,s0
    8da0:	00070d93          	mv	s11,a4
    8da4:	1a5000ef          	jal	9748 <_Bfree>
    8da8:	014de6b3          	or	a3,s11,s4
    8dac:	0e069a63          	bnez	a3,8ea0 <_dtoa_r+0xef8>
    8db0:	00012783          	lw	a5,0(sp)
    8db4:	76078e63          	beqz	a5,9530 <_dtoa_r+0x1588>
    8db8:	7809c663          	bltz	s3,9544 <_dtoa_r+0x159c>
    8dbc:	017c8023          	sb	s7,0(s9)
    8dc0:	001c8993          	add	s3,s9,1
    8dc4:	679d0e63          	beq	s10,s9,9440 <_dtoa_r+0x1498>
    8dc8:	00048593          	mv	a1,s1
    8dcc:	00000693          	li	a3,0
    8dd0:	00a00613          	li	a2,10
    8dd4:	00040513          	mv	a0,s0
    8dd8:	195000ef          	jal	976c <__multadd>
    8ddc:	00050493          	mv	s1,a0
    8de0:	00000693          	li	a3,0
    8de4:	00a00613          	li	a2,10
    8de8:	00090593          	mv	a1,s2
    8dec:	00040513          	mv	a0,s0
    8df0:	09690e63          	beq	s2,s6,8e8c <_dtoa_r+0xee4>
    8df4:	179000ef          	jal	976c <__multadd>
    8df8:	000b0593          	mv	a1,s6
    8dfc:	00050913          	mv	s2,a0
    8e00:	00000693          	li	a3,0
    8e04:	00a00613          	li	a2,10
    8e08:	00040513          	mv	a0,s0
    8e0c:	161000ef          	jal	976c <__multadd>
    8e10:	00050b13          	mv	s6,a0
    8e14:	00098c93          	mv	s9,s3
    8e18:	f31ff06f          	j	8d48 <_dtoa_r+0xda0>
    8e1c:	00050593          	mv	a1,a0
    8e20:	00040513          	mv	a0,s0
    8e24:	01012a83          	lw	s5,16(sp)
    8e28:	01412d83          	lw	s11,20(sp)
    8e2c:	11d000ef          	jal	9748 <_Bfree>
    8e30:	0009ca63          	bltz	s3,8e44 <_dtoa_r+0xe9c>
    8e34:	001df713          	and	a4,s11,1
    8e38:	0149e9b3          	or	s3,s3,s4
    8e3c:	01376733          	or	a4,a4,s3
    8e40:	06071e63          	bnez	a4,8ebc <_dtoa_r+0xf14>
    8e44:	00048593          	mv	a1,s1
    8e48:	00100613          	li	a2,1
    8e4c:	00040513          	mv	a0,s0
    8e50:	0c0010ef          	jal	9f10 <__lshift>
    8e54:	01812583          	lw	a1,24(sp)
    8e58:	00050493          	mv	s1,a0
    8e5c:	244010ef          	jal	a0a0 <__mcmp>
    8e60:	24a05863          	blez	a0,90b0 <_dtoa_r+0x1108>
    8e64:	03900713          	li	a4,57
    8e68:	24eb8c63          	beq	s7,a4,90c0 <_dtoa_r+0x1118>
    8e6c:	031c0b93          	add	s7,s8,49
    8e70:	02012783          	lw	a5,32(sp)
    8e74:	00090c13          	mv	s8,s2
    8e78:	001c8d13          	add	s10,s9,1
    8e7c:	017c8023          	sb	s7,0(s9)
    8e80:	00178a13          	add	s4,a5,1
    8e84:	000b0913          	mv	s2,s6
    8e88:	cc5ff06f          	j	8b4c <_dtoa_r+0xba4>
    8e8c:	0e1000ef          	jal	976c <__multadd>
    8e90:	00050913          	mv	s2,a0
    8e94:	00050b13          	mv	s6,a0
    8e98:	00098c93          	mv	s9,s3
    8e9c:	eadff06f          	j	8d48 <_dtoa_r+0xda0>
    8ea0:	7409c863          	bltz	s3,95f0 <_dtoa_r+0x1648>
    8ea4:	00012783          	lw	a5,0(sp)
    8ea8:	0149e9b3          	or	s3,s3,s4
    8eac:	0137e9b3          	or	s3,a5,s3
    8eb0:	74098063          	beqz	s3,95f0 <_dtoa_r+0x1648>
    8eb4:	f1b054e3          	blez	s11,8dbc <_dtoa_r+0xe14>
    8eb8:	01012a83          	lw	s5,16(sp)
    8ebc:	03900713          	li	a4,57
    8ec0:	20eb8063          	beq	s7,a4,90c0 <_dtoa_r+0x1118>
    8ec4:	02012703          	lw	a4,32(sp)
    8ec8:	001b8793          	add	a5,s7,1
    8ecc:	00090c13          	mv	s8,s2
    8ed0:	001c8d13          	add	s10,s9,1
    8ed4:	00170a13          	add	s4,a4,1
    8ed8:	00fc8023          	sb	a5,0(s9)
    8edc:	000b0913          	mv	s2,s6
    8ee0:	c6dff06f          	j	8b4c <_dtoa_r+0xba4>
    8ee4:	00200793          	li	a5,2
    8ee8:	bb47dee3          	bge	a5,s4,8aa4 <_dtoa_r+0xafc>
    8eec:	000a8d13          	mv	s10,s5
    8ef0:	9a0c10e3          	bnez	s8,8890 <_dtoa_r+0x8e8>
    8ef4:	01812583          	lw	a1,24(sp)
    8ef8:	00000693          	li	a3,0
    8efc:	00500613          	li	a2,5
    8f00:	00040513          	mv	a0,s0
    8f04:	069000ef          	jal	976c <__multadd>
    8f08:	00050593          	mv	a1,a0
    8f0c:	00a12c23          	sw	a0,24(sp)
    8f10:	00048513          	mv	a0,s1
    8f14:	18c010ef          	jal	a0a0 <__mcmp>
    8f18:	96a05ce3          	blez	a0,8890 <_dtoa_r+0x8e8>
    8f1c:	03100793          	li	a5,49
    8f20:	00fa8023          	sb	a5,0(s5)
    8f24:	02012783          	lw	a5,32(sp)
    8f28:	001a8d13          	add	s10,s5,1
    8f2c:	00178a13          	add	s4,a5,1
    8f30:	01812583          	lw	a1,24(sp)
    8f34:	00040513          	mv	a0,s0
    8f38:	001a0a13          	add	s4,s4,1
    8f3c:	00d000ef          	jal	9748 <_Bfree>
    8f40:	c20918e3          	bnez	s2,8b70 <_dtoa_r+0xbc8>
    8f44:	c39ff06f          	j	8b7c <_dtoa_r+0xbd4>
    8f48:	00050593          	mv	a1,a0
    8f4c:	00098613          	mv	a2,s3
    8f50:	00040513          	mv	a0,s0
    8f54:	66d000ef          	jal	9dc0 <__pow5mult>
    8f58:	00100793          	li	a5,1
    8f5c:	00a12c23          	sw	a0,24(sp)
    8f60:	1147de63          	bge	a5,s4,907c <_dtoa_r+0x10d4>
    8f64:	00000993          	li	s3,0
    8f68:	01812703          	lw	a4,24(sp)
    8f6c:	01072783          	lw	a5,16(a4)
    8f70:	00378793          	add	a5,a5,3
    8f74:	00279793          	sll	a5,a5,0x2
    8f78:	00f707b3          	add	a5,a4,a5
    8f7c:	0047a503          	lw	a0,4(a5)
    8f80:	171000ef          	jal	98f0 <__hi0bits>
    8f84:	02000793          	li	a5,32
    8f88:	40a787b3          	sub	a5,a5,a0
    8f8c:	ab5ff06f          	j	8a40 <_dtoa_r+0xa98>
    8f90:	02412783          	lw	a5,36(sp)
    8f94:	04079063          	bnez	a5,8fd4 <_dtoa_r+0x102c>
    8f98:	00012783          	lw	a5,0(sp)
    8f9c:	00c79793          	sll	a5,a5,0xc
    8fa0:	02079a63          	bnez	a5,8fd4 <_dtoa_r+0x102c>
    8fa4:	00012683          	lw	a3,0(sp)
    8fa8:	00000793          	li	a5,0
    8fac:	0146d713          	srl	a4,a3,0x14
    8fb0:	7ff77713          	and	a4,a4,2047
    8fb4:	00070c63          	beqz	a4,8fcc <_dtoa_r+0x1024>
    8fb8:	01012783          	lw	a5,16(sp)
    8fbc:	001b0b13          	add	s6,s6,1
    8fc0:	00178793          	add	a5,a5,1
    8fc4:	00f12823          	sw	a5,16(sp)
    8fc8:	00100793          	li	a5,1
    8fcc:	58099063          	bnez	s3,954c <_dtoa_r+0x15a4>
    8fd0:	00078993          	mv	s3,a5
    8fd4:	00100793          	li	a5,1
    8fd8:	a69ff06f          	j	8a40 <_dtoa_r+0xa98>
    8fdc:	a8d70ee3          	beq	a4,a3,8a78 <_dtoa_r+0xad0>
    8fe0:	03c00713          	li	a4,60
    8fe4:	40f707b3          	sub	a5,a4,a5
    8fe8:	a7dff06f          	j	8a64 <_dtoa_r+0xabc>
    8fec:	00100793          	li	a5,1
    8ff0:	00500a13          	li	s4,5
    8ff4:	02f12423          	sw	a5,40(sp)
    8ff8:	01412783          	lw	a5,20(sp)
    8ffc:	02012703          	lw	a4,32(sp)
    9000:	00e787b3          	add	a5,a5,a4
    9004:	00178c13          	add	s8,a5,1
    9008:	02f12e23          	sw	a5,60(sp)
    900c:	000c0613          	mv	a2,s8
    9010:	ab804263          	bgtz	s8,82b4 <_dtoa_r+0x30c>
    9014:	00100613          	li	a2,1
    9018:	a9cff06f          	j	82b4 <_dtoa_r+0x30c>
    901c:	00051663          	bnez	a0,9028 <_dtoa_r+0x1080>
    9020:	001bf793          	and	a5,s7,1
    9024:	b00792e3          	bnez	a5,8b28 <_dtoa_r+0xb80>
    9028:	03000693          	li	a3,48
    902c:	fff9c783          	lbu	a5,-1(s3)
    9030:	00098d13          	mv	s10,s3
    9034:	fff98993          	add	s3,s3,-1
    9038:	fed78ae3          	beq	a5,a3,902c <_dtoa_r+0x1084>
    903c:	b11ff06f          	j	8b4c <_dtoa_r+0xba4>
    9040:	000c0993          	mv	s3,s8
    9044:	abdff06f          	j	8b00 <_dtoa_r+0xb58>
    9048:	000b0793          	mv	a5,s6
    904c:	99dff06f          	j	89e8 <_dtoa_r+0xa40>
    9050:	03012783          	lw	a5,48(sp)
    9054:	01012703          	lw	a4,16(sp)
    9058:	03712823          	sw	s7,48(sp)
    905c:	40fb87b3          	sub	a5,s7,a5
    9060:	00f989b3          	add	s3,s3,a5
    9064:	018707b3          	add	a5,a4,s8
    9068:	00070c93          	mv	s9,a4
    906c:	018b0b33          	add	s6,s6,s8
    9070:	00f12823          	sw	a5,16(sp)
    9074:	00000b93          	li	s7,0
    9078:	bd9ff06f          	j	8c50 <_dtoa_r+0xca8>
    907c:	02412783          	lw	a5,36(sp)
    9080:	ee0792e3          	bnez	a5,8f64 <_dtoa_r+0xfbc>
    9084:	00012783          	lw	a5,0(sp)
    9088:	00c79793          	sll	a5,a5,0xc
    908c:	ec079ce3          	bnez	a5,8f64 <_dtoa_r+0xfbc>
    9090:	f15ff06f          	j	8fa4 <_dtoa_r+0xffc>
    9094:	01812303          	lw	t1,24(sp)
    9098:	01c12d03          	lw	s10,28(sp)
    909c:	00200913          	li	s2,2
    90a0:	ad0ff06f          	j	8370 <_dtoa_r+0x3c8>
    90a4:	00200a13          	li	s4,2
    90a8:	02012423          	sw	zero,40(sp)
    90ac:	9f8ff06f          	j	82a4 <_dtoa_r+0x2fc>
    90b0:	dc0510e3          	bnez	a0,8e70 <_dtoa_r+0xec8>
    90b4:	001bf713          	and	a4,s7,1
    90b8:	da0716e3          	bnez	a4,8e64 <_dtoa_r+0xebc>
    90bc:	db5ff06f          	j	8e70 <_dtoa_r+0xec8>
    90c0:	03900793          	li	a5,57
    90c4:	00fc8023          	sb	a5,0(s9)
    90c8:	02012783          	lw	a5,32(sp)
    90cc:	00090c13          	mv	s8,s2
    90d0:	001c8993          	add	s3,s9,1
    90d4:	00178a13          	add	s4,a5,1
    90d8:	000b0913          	mv	s2,s6
    90dc:	a4dff06f          	j	8b28 <_dtoa_r+0xb80>
    90e0:	00100793          	li	a5,1
    90e4:	00100c13          	li	s8,1
    90e8:	00f12a23          	sw	a5,20(sp)
    90ec:	e50ff06f          	j	873c <_dtoa_r+0x794>
    90f0:	02012423          	sw	zero,40(sp)
    90f4:	f05ff06f          	j	8ff8 <_dtoa_r+0x1050>
    90f8:	03812703          	lw	a4,56(sp)
    90fc:	30070e63          	beqz	a4,9418 <_dtoa_r+0x1470>
    9100:	01012703          	lw	a4,16(sp)
    9104:	43378793          	add	a5,a5,1075
    9108:	00fb0b33          	add	s6,s6,a5
    910c:	00f707b3          	add	a5,a4,a5
    9110:	03012b83          	lw	s7,48(sp)
    9114:	00070c93          	mv	s9,a4
    9118:	00f12823          	sw	a5,16(sp)
    911c:	b35ff06f          	j	8c50 <_dtoa_r+0xca8>
    9120:	03100793          	li	a5,49
    9124:	00fa8023          	sb	a5,0(s5)
    9128:	001a0a13          	add	s4,s4,1
    912c:	a21ff06f          	j	8b4c <_dtoa_r+0xba4>
    9130:	02012783          	lw	a5,32(sp)
    9134:	32078263          	beqz	a5,9458 <_dtoa_r+0x14b0>
    9138:	40f00bb3          	neg	s7,a5
    913c:	00fbf713          	and	a4,s7,15
    9140:	00371713          	sll	a4,a4,0x3
    9144:	00006797          	auipc	a5,0x6
    9148:	52478793          	add	a5,a5,1316 # f668 <__mprec_tens>
    914c:	00e787b3          	add	a5,a5,a4
    9150:	0007a603          	lw	a2,0(a5)
    9154:	0047a683          	lw	a3,4(a5)
    9158:	01812503          	lw	a0,24(sp)
    915c:	01c12583          	lw	a1,28(sp)
    9160:	404bdb93          	sra	s7,s7,0x4
    9164:	3d4040ef          	jal	d538 <__muldf3>
    9168:	00058d13          	mv	s10,a1
    916c:	440b8c63          	beqz	s7,95c4 <_dtoa_r+0x161c>
    9170:	00200913          	li	s2,2
    9174:	04812023          	sw	s0,64(sp)
    9178:	00006c97          	auipc	s9,0x6
    917c:	4c8c8c93          	add	s9,s9,1224 # f640 <__mprec_bigtens>
    9180:	00090413          	mv	s0,s2
    9184:	00050713          	mv	a4,a0
    9188:	00000613          	li	a2,0
    918c:	00050913          	mv	s2,a0
    9190:	001bf693          	and	a3,s7,1
    9194:	02068063          	beqz	a3,91b4 <_dtoa_r+0x120c>
    9198:	000ca603          	lw	a2,0(s9)
    919c:	004ca683          	lw	a3,4(s9)
    91a0:	00070513          	mv	a0,a4
    91a4:	00140413          	add	s0,s0,1
    91a8:	390040ef          	jal	d538 <__muldf3>
    91ac:	00050713          	mv	a4,a0
    91b0:	00100613          	li	a2,1
    91b4:	401bdb93          	sra	s7,s7,0x1
    91b8:	008c8c93          	add	s9,s9,8
    91bc:	fc0b9ae3          	bnez	s7,9190 <_dtoa_r+0x11e8>
    91c0:	00090513          	mv	a0,s2
    91c4:	00058793          	mv	a5,a1
    91c8:	00040913          	mv	s2,s0
    91cc:	04012403          	lw	s0,64(sp)
    91d0:	a0061a63          	bnez	a2,83e4 <_dtoa_r+0x43c>
    91d4:	00050713          	mv	a4,a0
    91d8:	000d0793          	mv	a5,s10
    91dc:	a08ff06f          	j	83e4 <_dtoa_r+0x43c>
    91e0:	00068593          	mv	a1,a3
    91e4:	00070613          	mv	a2,a4
    91e8:	00070513          	mv	a0,a4
    91ec:	745020ef          	jal	c130 <__adddf3>
    91f0:	02012783          	lw	a5,32(sp)
    91f4:	00090613          	mv	a2,s2
    91f8:	00098693          	mv	a3,s3
    91fc:	00178a13          	add	s4,a5,1
    9200:	00050c93          	mv	s9,a0
    9204:	00058b13          	mv	s6,a1
    9208:	000a0c13          	mv	s8,s4
    920c:	124040ef          	jal	d330 <__gedf2>
    9210:	c4a04863          	bgtz	a0,8660 <_dtoa_r+0x6b8>
    9214:	000c8513          	mv	a0,s9
    9218:	000b0593          	mv	a1,s6
    921c:	00090613          	mv	a2,s2
    9220:	00098693          	mv	a3,s3
    9224:	080040ef          	jal	d2a4 <__eqdf2>
    9228:	00051663          	bnez	a0,9234 <_dtoa_r+0x128c>
    922c:	001d7d13          	and	s10,s10,1
    9230:	c20d1863          	bnez	s10,8660 <_dtoa_r+0x6b8>
    9234:	000b8d13          	mv	s10,s7
    9238:	945ff06f          	j	8b7c <_dtoa_r+0xbd4>
    923c:	00492583          	lw	a1,4(s2)
    9240:	00040513          	mv	a0,s0
    9244:	450000ef          	jal	9694 <_Balloc>
    9248:	00050993          	mv	s3,a0
    924c:	38050463          	beqz	a0,95d4 <_dtoa_r+0x162c>
    9250:	01092603          	lw	a2,16(s2)
    9254:	00c90593          	add	a1,s2,12
    9258:	00c50513          	add	a0,a0,12
    925c:	00260613          	add	a2,a2,2
    9260:	00261613          	sll	a2,a2,0x2
    9264:	ccdf70ef          	jal	f30 <memcpy>
    9268:	00100613          	li	a2,1
    926c:	00098593          	mv	a1,s3
    9270:	00040513          	mv	a0,s0
    9274:	49d000ef          	jal	9f10 <__lshift>
    9278:	00050b13          	mv	s6,a0
    927c:	aa9ff06f          	j	8d24 <_dtoa_r+0xd7c>
    9280:	00090593          	mv	a1,s2
    9284:	000b8613          	mv	a2,s7
    9288:	00040513          	mv	a0,s0
    928c:	335000ef          	jal	9dc0 <__pow5mult>
    9290:	00048613          	mv	a2,s1
    9294:	00050593          	mv	a1,a0
    9298:	00050913          	mv	s2,a0
    929c:	00040513          	mv	a0,s0
    92a0:	059000ef          	jal	9af8 <__multiply>
    92a4:	00050793          	mv	a5,a0
    92a8:	00048593          	mv	a1,s1
    92ac:	00040513          	mv	a0,s0
    92b0:	00078493          	mv	s1,a5
    92b4:	494000ef          	jal	9748 <_Bfree>
    92b8:	03012783          	lw	a5,48(sp)
    92bc:	417787b3          	sub	a5,a5,s7
    92c0:	02f12823          	sw	a5,48(sp)
    92c4:	f6078063          	beqz	a5,8a24 <_dtoa_r+0xa7c>
    92c8:	f48ff06f          	j	8a10 <_dtoa_r+0xa68>
    92cc:	05012603          	lw	a2,80(sp)
    92d0:	05412683          	lw	a3,84(sp)
    92d4:	05812503          	lw	a0,88(sp)
    92d8:	04b12623          	sw	a1,76(sp)
    92dc:	000b8593          	mv	a1,s7
    92e0:	02612423          	sw	t1,40(sp)
    92e4:	254040ef          	jal	d538 <__muldf3>
    92e8:	02812303          	lw	t1,40(sp)
    92ec:	04812783          	lw	a5,72(sp)
    92f0:	00100693          	li	a3,1
    92f4:	006a8023          	sb	t1,0(s5)
    92f8:	02a12c23          	sw	a0,56(sp)
    92fc:	04c12883          	lw	a7,76(sp)
    9300:	00058913          	mv	s2,a1
    9304:	00fa8bb3          	add	s7,s5,a5
    9308:	7fff7617          	auipc	a2,0x7fff7
    930c:	3e860613          	add	a2,a2,1000 # 800006f0 <__global_locale+0x1bc>
    9310:	28d78c63          	beq	a5,a3,95a8 <_dtoa_r+0x1600>
    9314:	00062783          	lw	a5,0(a2)
    9318:	00462803          	lw	a6,4(a2)
    931c:	04912423          	sw	s1,72(sp)
    9320:	02f12423          	sw	a5,40(sp)
    9324:	03012623          	sw	a6,44(sp)
    9328:	04812623          	sw	s0,76(sp)
    932c:	000c8513          	mv	a0,s9
    9330:	00088593          	mv	a1,a7
    9334:	02812603          	lw	a2,40(sp)
    9338:	02c12683          	lw	a3,44(sp)
    933c:	001d0d13          	add	s10,s10,1
    9340:	1f8040ef          	jal	d538 <__muldf3>
    9344:	00058413          	mv	s0,a1
    9348:	00050493          	mv	s1,a0
    934c:	2d8050ef          	jal	e624 <__fixdfsi>
    9350:	00050c93          	mv	s9,a0
    9354:	354050ef          	jal	e6a8 <__floatsidf>
    9358:	00050613          	mv	a2,a0
    935c:	00058693          	mv	a3,a1
    9360:	00048513          	mv	a0,s1
    9364:	00040593          	mv	a1,s0
    9368:	030c8c93          	add	s9,s9,48
    936c:	15d040ef          	jal	dcc8 <__subdf3>
    9370:	ff9d0fa3          	sb	s9,-1(s10)
    9374:	fdab90e3          	bne	s7,s10,9334 <_dtoa_r+0x138c>
    9378:	04812483          	lw	s1,72(sp)
    937c:	04c12403          	lw	s0,76(sp)
    9380:	00050c93          	mv	s9,a0
    9384:	00058893          	mv	a7,a1
    9388:	7fff7d17          	auipc	s10,0x7fff7
    938c:	330d0d13          	add	s10,s10,816 # 800006b8 <__global_locale+0x184>
    9390:	000d2603          	lw	a2,0(s10)
    9394:	004d2683          	lw	a3,4(s10)
    9398:	03812503          	lw	a0,56(sp)
    939c:	00090593          	mv	a1,s2
    93a0:	03112423          	sw	a7,40(sp)
    93a4:	58d020ef          	jal	c130 <__adddf3>
    93a8:	02812883          	lw	a7,40(sp)
    93ac:	000c8613          	mv	a2,s9
    93b0:	00088693          	mv	a3,a7
    93b4:	07c040ef          	jal	d430 <__ledf2>
    93b8:	1a054863          	bltz	a0,9568 <_dtoa_r+0x15c0>
    93bc:	03812603          	lw	a2,56(sp)
    93c0:	000d2503          	lw	a0,0(s10)
    93c4:	004d2583          	lw	a1,4(s10)
    93c8:	00090693          	mv	a3,s2
    93cc:	0fd040ef          	jal	dcc8 <__subdf3>
    93d0:	02812883          	lw	a7,40(sp)
    93d4:	000c8613          	mv	a2,s9
    93d8:	00088693          	mv	a3,a7
    93dc:	755030ef          	jal	d330 <__gedf2>
    93e0:	12a04863          	bgtz	a0,9510 <_dtoa_r+0x1568>
    93e4:	06c12783          	lw	a5,108(sp)
    93e8:	de07c063          	bltz	a5,89c8 <_dtoa_r+0xa20>
    93ec:	02012703          	lw	a4,32(sp)
    93f0:	00e00793          	li	a5,14
    93f4:	dce7ca63          	blt	a5,a4,89c8 <_dtoa_r+0xa20>
    93f8:	02012783          	lw	a5,32(sp)
    93fc:	00006717          	auipc	a4,0x6
    9400:	26c70713          	add	a4,a4,620 # f668 <__mprec_tens>
    9404:	00379793          	sll	a5,a5,0x3
    9408:	00f707b3          	add	a5,a4,a5
    940c:	0007a903          	lw	s2,0(a5)
    9410:	0047a983          	lw	s3,4(a5)
    9414:	c90ff06f          	j	88a4 <_dtoa_r+0x8fc>
    9418:	06812703          	lw	a4,104(sp)
    941c:	01012683          	lw	a3,16(sp)
    9420:	03600793          	li	a5,54
    9424:	40e787b3          	sub	a5,a5,a4
    9428:	00fb0b33          	add	s6,s6,a5
    942c:	00f687b3          	add	a5,a3,a5
    9430:	03012b83          	lw	s7,48(sp)
    9434:	00068c93          	mv	s9,a3
    9438:	00f12823          	sw	a5,16(sp)
    943c:	815ff06f          	j	8c50 <_dtoa_r+0xca8>
    9440:	02012783          	lw	a5,32(sp)
    9444:	00090c13          	mv	s8,s2
    9448:	01012a83          	lw	s5,16(sp)
    944c:	00178a13          	add	s4,a5,1
    9450:	000b0913          	mv	s2,s6
    9454:	eb4ff06f          	j	8b08 <_dtoa_r+0xb60>
    9458:	01812703          	lw	a4,24(sp)
    945c:	01c12783          	lw	a5,28(sp)
    9460:	00200913          	li	s2,2
    9464:	f81fe06f          	j	83e4 <_dtoa_r+0x43c>
    9468:	b00c0063          	beqz	s8,8768 <_dtoa_r+0x7c0>
    946c:	03c12d03          	lw	s10,60(sp)
    9470:	bba05063          	blez	s10,8810 <_dtoa_r+0x868>
    9474:	7fff7617          	auipc	a2,0x7fff7
    9478:	27c60613          	add	a2,a2,636 # 800006f0 <__global_locale+0x1bc>
    947c:	00078593          	mv	a1,a5
    9480:	02012783          	lw	a5,32(sp)
    9484:	00462683          	lw	a3,4(a2)
    9488:	00062603          	lw	a2,0(a2)
    948c:	fff78793          	add	a5,a5,-1
    9490:	00070513          	mv	a0,a4
    9494:	04f12e23          	sw	a5,92(sp)
    9498:	0a0040ef          	jal	d538 <__muldf3>
    949c:	00050713          	mv	a4,a0
    94a0:	00190513          	add	a0,s2,1
    94a4:	04e12423          	sw	a4,72(sp)
    94a8:	04b12023          	sw	a1,64(sp)
    94ac:	1fc050ef          	jal	e6a8 <__floatsidf>
    94b0:	04812703          	lw	a4,72(sp)
    94b4:	04012783          	lw	a5,64(sp)
    94b8:	00070613          	mv	a2,a4
    94bc:	00078693          	mv	a3,a5
    94c0:	04e12623          	sw	a4,76(sp)
    94c4:	074040ef          	jal	d538 <__muldf3>
    94c8:	7fff7697          	auipc	a3,0x7fff7
    94cc:	23068693          	add	a3,a3,560 # 800006f8 <__global_locale+0x1c4>
    94d0:	0006a603          	lw	a2,0(a3)
    94d4:	0046a683          	lw	a3,4(a3)
    94d8:	459020ef          	jal	c130 <__adddf3>
    94dc:	fcc006b7          	lui	a3,0xfcc00
    94e0:	04012783          	lw	a5,64(sp)
    94e4:	04c12703          	lw	a4,76(sp)
    94e8:	00050c93          	mv	s9,a0
    94ec:	00b68bb3          	add	s7,a3,a1
    94f0:	05a12423          	sw	s10,72(sp)
    94f4:	f91fe06f          	j	8484 <_dtoa_r+0x4dc>
    94f8:	03100693          	li	a3,49
    94fc:	001c0c13          	add	s8,s8,1
    9500:	984ff06f          	j	8684 <_dtoa_r+0x6dc>
    9504:	00012c23          	sw	zero,24(sp)
    9508:	00000913          	li	s2,0
    950c:	a11ff06f          	j	8f1c <_dtoa_r+0xf74>
    9510:	03000613          	li	a2,48
    9514:	fffbc783          	lbu	a5,-1(s7)
    9518:	000b8d13          	mv	s10,s7
    951c:	fffb8b93          	add	s7,s7,-1
    9520:	fec78ae3          	beq	a5,a2,9514 <_dtoa_r+0x156c>
    9524:	05c12783          	lw	a5,92(sp)
    9528:	00178a13          	add	s4,a5,1
    952c:	e50ff06f          	j	8b7c <_dtoa_r+0xbd4>
    9530:	03900713          	li	a4,57
    9534:	01012a83          	lw	s5,16(sp)
    9538:	b8eb84e3          	beq	s7,a4,90c0 <_dtoa_r+0x1118>
    953c:	933048e3          	bgtz	s3,8e6c <_dtoa_r+0xec4>
    9540:	931ff06f          	j	8e70 <_dtoa_r+0xec8>
    9544:	01012a83          	lw	s5,16(sp)
    9548:	929ff06f          	j	8e70 <_dtoa_r+0xec8>
    954c:	00078993          	mv	s3,a5
    9550:	a19ff06f          	j	8f68 <_dtoa_r+0xfc0>
    9554:	00078c93          	mv	s9,a5
    9558:	018787b3          	add	a5,a5,s8
    955c:	018b0b33          	add	s6,s6,s8
    9560:	00f12823          	sw	a5,16(sp)
    9564:	eecff06f          	j	8c50 <_dtoa_r+0xca8>
    9568:	05c12783          	lw	a5,92(sp)
    956c:	00178c13          	add	s8,a5,1
    9570:	8f0ff06f          	j	8660 <_dtoa_r+0x6b8>
    9574:	04c12983          	lw	s3,76(sp)
    9578:	05012b03          	lw	s6,80(sp)
    957c:	05812c03          	lw	s8,88(sp)
    9580:	04812a03          	lw	s4,72(sp)
    9584:	a8cff06f          	j	8810 <_dtoa_r+0x868>
    9588:	00200793          	li	a5,2
    958c:	0147c863          	blt	a5,s4,959c <_dtoa_r+0x15f4>
    9590:	02012a03          	lw	s4,32(sp)
    9594:	03c12c03          	lw	s8,60(sp)
    9598:	d1cff06f          	j	8ab4 <_dtoa_r+0xb0c>
    959c:	03c12c03          	lw	s8,60(sp)
    95a0:	03612023          	sw	s6,32(sp)
    95a4:	949ff06f          	j	8eec <_dtoa_r+0xf44>
    95a8:	04012b83          	lw	s7,64(sp)
    95ac:	dddff06f          	j	9388 <_dtoa_r+0x13e0>
    95b0:	00200793          	li	a5,2
    95b4:	ff47c4e3          	blt	a5,s4,959c <_dtoa_r+0x15f4>
    95b8:	03c12c03          	lw	s8,60(sp)
    95bc:	03612023          	sw	s6,32(sp)
    95c0:	f44ff06f          	j	8d04 <_dtoa_r+0xd5c>
    95c4:	00050713          	mv	a4,a0
    95c8:	00058793          	mv	a5,a1
    95cc:	00200913          	li	s2,2
    95d0:	e15fe06f          	j	83e4 <_dtoa_r+0x43c>
    95d4:	00006697          	auipc	a3,0x6
    95d8:	a5468693          	add	a3,a3,-1452 # f028 <__fini_array_end+0x230>
    95dc:	00000613          	li	a2,0
    95e0:	2ef00593          	li	a1,751
    95e4:	00006517          	auipc	a0,0x6
    95e8:	a5850513          	add	a0,a0,-1448 # f03c <__fini_array_end+0x244>
    95ec:	0cd010ef          	jal	aeb8 <__assert_func>
    95f0:	01012a83          	lw	s5,16(sp)
    95f4:	85b048e3          	bgtz	s11,8e44 <_dtoa_r+0xe9c>
    95f8:	879ff06f          	j	8e70 <_dtoa_r+0xec8>
    95fc:	00006697          	auipc	a3,0x6
    9600:	a2c68693          	add	a3,a3,-1492 # f028 <__fini_array_end+0x230>
    9604:	00000613          	li	a2,0
    9608:	1af00593          	li	a1,431
    960c:	00006517          	auipc	a0,0x6
    9610:	a3050513          	add	a0,a0,-1488 # f03c <__fini_array_end+0x244>
    9614:	0a5010ef          	jal	aeb8 <__assert_func>
    9618:	02042e23          	sw	zero,60(s0)
    961c:	00000593          	li	a1,0
    9620:	cc1fe06f          	j	82e0 <_dtoa_r+0x338>
    9624:	02012423          	sw	zero,40(sp)
    9628:	c7dfe06f          	j	82a4 <_dtoa_r+0x2fc>

0000962c <__ascii_mbtowc>:
    962c:	02058063          	beqz	a1,964c <__ascii_mbtowc+0x20>
    9630:	04060263          	beqz	a2,9674 <__ascii_mbtowc+0x48>
    9634:	04068863          	beqz	a3,9684 <__ascii_mbtowc+0x58>
    9638:	00064783          	lbu	a5,0(a2)
    963c:	00f5a023          	sw	a5,0(a1)
    9640:	00064503          	lbu	a0,0(a2)
    9644:	00a03533          	snez	a0,a0
    9648:	00008067          	ret
    964c:	ff010113          	add	sp,sp,-16
    9650:	00c10593          	add	a1,sp,12
    9654:	02060463          	beqz	a2,967c <__ascii_mbtowc+0x50>
    9658:	02068a63          	beqz	a3,968c <__ascii_mbtowc+0x60>
    965c:	00064783          	lbu	a5,0(a2)
    9660:	00f5a023          	sw	a5,0(a1)
    9664:	00064503          	lbu	a0,0(a2)
    9668:	00a03533          	snez	a0,a0
    966c:	01010113          	add	sp,sp,16
    9670:	00008067          	ret
    9674:	00000513          	li	a0,0
    9678:	00008067          	ret
    967c:	00000513          	li	a0,0
    9680:	fedff06f          	j	966c <__ascii_mbtowc+0x40>
    9684:	ffe00513          	li	a0,-2
    9688:	00008067          	ret
    968c:	ffe00513          	li	a0,-2
    9690:	fddff06f          	j	966c <__ascii_mbtowc+0x40>

00009694 <_Balloc>:
    9694:	04452783          	lw	a5,68(a0)
    9698:	ff010113          	add	sp,sp,-16
    969c:	00812423          	sw	s0,8(sp)
    96a0:	00912223          	sw	s1,4(sp)
    96a4:	00112623          	sw	ra,12(sp)
    96a8:	00050413          	mv	s0,a0
    96ac:	00058493          	mv	s1,a1
    96b0:	02078c63          	beqz	a5,96e8 <_Balloc+0x54>
    96b4:	00249713          	sll	a4,s1,0x2
    96b8:	00e787b3          	add	a5,a5,a4
    96bc:	0007a503          	lw	a0,0(a5)
    96c0:	04050463          	beqz	a0,9708 <_Balloc+0x74>
    96c4:	00052703          	lw	a4,0(a0)
    96c8:	00e7a023          	sw	a4,0(a5)
    96cc:	00052823          	sw	zero,16(a0)
    96d0:	00052623          	sw	zero,12(a0)
    96d4:	00c12083          	lw	ra,12(sp)
    96d8:	00812403          	lw	s0,8(sp)
    96dc:	00412483          	lw	s1,4(sp)
    96e0:	01010113          	add	sp,sp,16
    96e4:	00008067          	ret
    96e8:	02100613          	li	a2,33
    96ec:	00400593          	li	a1,4
    96f0:	021010ef          	jal	af10 <_calloc_r>
    96f4:	04a42223          	sw	a0,68(s0)
    96f8:	00050793          	mv	a5,a0
    96fc:	fa051ce3          	bnez	a0,96b4 <_Balloc+0x20>
    9700:	00000513          	li	a0,0
    9704:	fd1ff06f          	j	96d4 <_Balloc+0x40>
    9708:	01212023          	sw	s2,0(sp)
    970c:	00100913          	li	s2,1
    9710:	00991933          	sll	s2,s2,s1
    9714:	00590613          	add	a2,s2,5
    9718:	00261613          	sll	a2,a2,0x2
    971c:	00100593          	li	a1,1
    9720:	00040513          	mv	a0,s0
    9724:	7ec010ef          	jal	af10 <_calloc_r>
    9728:	00050a63          	beqz	a0,973c <_Balloc+0xa8>
    972c:	01252423          	sw	s2,8(a0)
    9730:	00952223          	sw	s1,4(a0)
    9734:	00012903          	lw	s2,0(sp)
    9738:	f95ff06f          	j	96cc <_Balloc+0x38>
    973c:	00012903          	lw	s2,0(sp)
    9740:	00000513          	li	a0,0
    9744:	f91ff06f          	j	96d4 <_Balloc+0x40>

00009748 <_Bfree>:
    9748:	02058063          	beqz	a1,9768 <_Bfree+0x20>
    974c:	0045a703          	lw	a4,4(a1)
    9750:	04452783          	lw	a5,68(a0)
    9754:	00271713          	sll	a4,a4,0x2
    9758:	00e787b3          	add	a5,a5,a4
    975c:	0007a703          	lw	a4,0(a5)
    9760:	00e5a023          	sw	a4,0(a1)
    9764:	00b7a023          	sw	a1,0(a5)
    9768:	00008067          	ret

0000976c <__multadd>:
    976c:	fd010113          	add	sp,sp,-48
    9770:	01412c23          	sw	s4,24(sp)
    9774:	0105aa03          	lw	s4,16(a1)
    9778:	01912223          	sw	s9,4(sp)
    977c:	00010cb7          	lui	s9,0x10
    9780:	02912223          	sw	s1,36(sp)
    9784:	03212023          	sw	s2,32(sp)
    9788:	01312e23          	sw	s3,28(sp)
    978c:	01512a23          	sw	s5,20(sp)
    9790:	01612823          	sw	s6,16(sp)
    9794:	01712623          	sw	s7,12(sp)
    9798:	02112623          	sw	ra,44(sp)
    979c:	02812423          	sw	s0,40(sp)
    97a0:	01812423          	sw	s8,8(sp)
    97a4:	00058a93          	mv	s5,a1
    97a8:	00050b13          	mv	s6,a0
    97ac:	00060993          	mv	s3,a2
    97b0:	00068493          	mv	s1,a3
    97b4:	01458913          	add	s2,a1,20
    97b8:	00000b93          	li	s7,0
    97bc:	fffc8c93          	add	s9,s9,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    97c0:	00092c03          	lw	s8,0(s2)
    97c4:	00098593          	mv	a1,s3
    97c8:	00490913          	add	s2,s2,4
    97cc:	019c7533          	and	a0,s8,s9
    97d0:	430050ef          	jal	ec00 <__mulsi3>
    97d4:	00050413          	mv	s0,a0
    97d8:	00098593          	mv	a1,s3
    97dc:	010c5513          	srl	a0,s8,0x10
    97e0:	00940433          	add	s0,s0,s1
    97e4:	41c050ef          	jal	ec00 <__mulsi3>
    97e8:	01045793          	srl	a5,s0,0x10
    97ec:	00f50533          	add	a0,a0,a5
    97f0:	01051793          	sll	a5,a0,0x10
    97f4:	01947433          	and	s0,s0,s9
    97f8:	008787b3          	add	a5,a5,s0
    97fc:	fef92e23          	sw	a5,-4(s2)
    9800:	001b8b93          	add	s7,s7,1
    9804:	01055493          	srl	s1,a0,0x10
    9808:	fb4bcce3          	blt	s7,s4,97c0 <__multadd+0x54>
    980c:	02048263          	beqz	s1,9830 <__multadd+0xc4>
    9810:	008aa783          	lw	a5,8(s5)
    9814:	04fa5a63          	bge	s4,a5,9868 <__multadd+0xfc>
    9818:	004a0793          	add	a5,s4,4
    981c:	00279793          	sll	a5,a5,0x2
    9820:	00fa87b3          	add	a5,s5,a5
    9824:	0097a223          	sw	s1,4(a5)
    9828:	001a0a13          	add	s4,s4,1
    982c:	014aa823          	sw	s4,16(s5)
    9830:	02c12083          	lw	ra,44(sp)
    9834:	02812403          	lw	s0,40(sp)
    9838:	02412483          	lw	s1,36(sp)
    983c:	02012903          	lw	s2,32(sp)
    9840:	01c12983          	lw	s3,28(sp)
    9844:	01812a03          	lw	s4,24(sp)
    9848:	01012b03          	lw	s6,16(sp)
    984c:	00c12b83          	lw	s7,12(sp)
    9850:	00812c03          	lw	s8,8(sp)
    9854:	00412c83          	lw	s9,4(sp)
    9858:	000a8513          	mv	a0,s5
    985c:	01412a83          	lw	s5,20(sp)
    9860:	03010113          	add	sp,sp,48
    9864:	00008067          	ret
    9868:	004aa583          	lw	a1,4(s5)
    986c:	000b0513          	mv	a0,s6
    9870:	00158593          	add	a1,a1,1
    9874:	e21ff0ef          	jal	9694 <_Balloc>
    9878:	00050413          	mv	s0,a0
    987c:	04050c63          	beqz	a0,98d4 <__multadd+0x168>
    9880:	010aa603          	lw	a2,16(s5)
    9884:	00ca8593          	add	a1,s5,12
    9888:	00c50513          	add	a0,a0,12
    988c:	00260613          	add	a2,a2,2
    9890:	00261613          	sll	a2,a2,0x2
    9894:	e9cf70ef          	jal	f30 <memcpy>
    9898:	004aa703          	lw	a4,4(s5)
    989c:	044b2783          	lw	a5,68(s6)
    98a0:	00271713          	sll	a4,a4,0x2
    98a4:	00e787b3          	add	a5,a5,a4
    98a8:	0007a703          	lw	a4,0(a5)
    98ac:	00eaa023          	sw	a4,0(s5)
    98b0:	0157a023          	sw	s5,0(a5)
    98b4:	004a0793          	add	a5,s4,4
    98b8:	00040a93          	mv	s5,s0
    98bc:	00279793          	sll	a5,a5,0x2
    98c0:	00fa87b3          	add	a5,s5,a5
    98c4:	0097a223          	sw	s1,4(a5)
    98c8:	001a0a13          	add	s4,s4,1
    98cc:	014aa823          	sw	s4,16(s5)
    98d0:	f61ff06f          	j	9830 <__multadd+0xc4>
    98d4:	00005697          	auipc	a3,0x5
    98d8:	75468693          	add	a3,a3,1876 # f028 <__fini_array_end+0x230>
    98dc:	00000613          	li	a2,0
    98e0:	0ba00593          	li	a1,186
    98e4:	00005517          	auipc	a0,0x5
    98e8:	7d850513          	add	a0,a0,2008 # f0bc <__fini_array_end+0x2c4>
    98ec:	5cc010ef          	jal	aeb8 <__assert_func>

000098f0 <__hi0bits>:
    98f0:	00050793          	mv	a5,a0
    98f4:	00010737          	lui	a4,0x10
    98f8:	00000513          	li	a0,0
    98fc:	00e7f663          	bgeu	a5,a4,9908 <__hi0bits+0x18>
    9900:	01079793          	sll	a5,a5,0x10
    9904:	01000513          	li	a0,16
    9908:	01000737          	lui	a4,0x1000
    990c:	00e7f663          	bgeu	a5,a4,9918 <__hi0bits+0x28>
    9910:	00850513          	add	a0,a0,8
    9914:	00879793          	sll	a5,a5,0x8
    9918:	10000737          	lui	a4,0x10000
    991c:	00e7f663          	bgeu	a5,a4,9928 <__hi0bits+0x38>
    9920:	00450513          	add	a0,a0,4
    9924:	00479793          	sll	a5,a5,0x4
    9928:	40000737          	lui	a4,0x40000
    992c:	00e7ea63          	bltu	a5,a4,9940 <__hi0bits+0x50>
    9930:	fff7c793          	not	a5,a5
    9934:	01f7d793          	srl	a5,a5,0x1f
    9938:	00f50533          	add	a0,a0,a5
    993c:	00008067          	ret
    9940:	00279793          	sll	a5,a5,0x2
    9944:	0007ca63          	bltz	a5,9958 <__hi0bits+0x68>
    9948:	00179713          	sll	a4,a5,0x1
    994c:	00074a63          	bltz	a4,9960 <__hi0bits+0x70>
    9950:	02000513          	li	a0,32
    9954:	00008067          	ret
    9958:	00250513          	add	a0,a0,2
    995c:	00008067          	ret
    9960:	00350513          	add	a0,a0,3
    9964:	00008067          	ret

00009968 <__lo0bits>:
    9968:	00052783          	lw	a5,0(a0)
    996c:	00050713          	mv	a4,a0
    9970:	0077f693          	and	a3,a5,7
    9974:	02068463          	beqz	a3,999c <__lo0bits+0x34>
    9978:	0017f693          	and	a3,a5,1
    997c:	00000513          	li	a0,0
    9980:	04069e63          	bnez	a3,99dc <__lo0bits+0x74>
    9984:	0027f693          	and	a3,a5,2
    9988:	0a068863          	beqz	a3,9a38 <__lo0bits+0xd0>
    998c:	0017d793          	srl	a5,a5,0x1
    9990:	00f72023          	sw	a5,0(a4) # 40000000 <__neorv32_ram_size+0x3ff80000>
    9994:	00100513          	li	a0,1
    9998:	00008067          	ret
    999c:	01079693          	sll	a3,a5,0x10
    99a0:	0106d693          	srl	a3,a3,0x10
    99a4:	00000513          	li	a0,0
    99a8:	06068e63          	beqz	a3,9a24 <__lo0bits+0xbc>
    99ac:	0ff7f693          	zext.b	a3,a5
    99b0:	06068063          	beqz	a3,9a10 <__lo0bits+0xa8>
    99b4:	00f7f693          	and	a3,a5,15
    99b8:	04068263          	beqz	a3,99fc <__lo0bits+0x94>
    99bc:	0037f693          	and	a3,a5,3
    99c0:	02068463          	beqz	a3,99e8 <__lo0bits+0x80>
    99c4:	0017f693          	and	a3,a5,1
    99c8:	00069c63          	bnez	a3,99e0 <__lo0bits+0x78>
    99cc:	0017d793          	srl	a5,a5,0x1
    99d0:	00150513          	add	a0,a0,1
    99d4:	00079663          	bnez	a5,99e0 <__lo0bits+0x78>
    99d8:	02000513          	li	a0,32
    99dc:	00008067          	ret
    99e0:	00f72023          	sw	a5,0(a4)
    99e4:	00008067          	ret
    99e8:	0027d793          	srl	a5,a5,0x2
    99ec:	0017f693          	and	a3,a5,1
    99f0:	00250513          	add	a0,a0,2
    99f4:	fe0696e3          	bnez	a3,99e0 <__lo0bits+0x78>
    99f8:	fd5ff06f          	j	99cc <__lo0bits+0x64>
    99fc:	0047d793          	srl	a5,a5,0x4
    9a00:	0037f693          	and	a3,a5,3
    9a04:	00450513          	add	a0,a0,4
    9a08:	fa069ee3          	bnez	a3,99c4 <__lo0bits+0x5c>
    9a0c:	fddff06f          	j	99e8 <__lo0bits+0x80>
    9a10:	0087d793          	srl	a5,a5,0x8
    9a14:	00f7f693          	and	a3,a5,15
    9a18:	00850513          	add	a0,a0,8
    9a1c:	fa0690e3          	bnez	a3,99bc <__lo0bits+0x54>
    9a20:	fddff06f          	j	99fc <__lo0bits+0x94>
    9a24:	0107d793          	srl	a5,a5,0x10
    9a28:	0ff7f693          	zext.b	a3,a5
    9a2c:	01000513          	li	a0,16
    9a30:	f80692e3          	bnez	a3,99b4 <__lo0bits+0x4c>
    9a34:	fddff06f          	j	9a10 <__lo0bits+0xa8>
    9a38:	0027d793          	srl	a5,a5,0x2
    9a3c:	00f72023          	sw	a5,0(a4)
    9a40:	00200513          	li	a0,2
    9a44:	00008067          	ret

00009a48 <__i2b>:
    9a48:	04452783          	lw	a5,68(a0)
    9a4c:	ff010113          	add	sp,sp,-16
    9a50:	00812423          	sw	s0,8(sp)
    9a54:	00912223          	sw	s1,4(sp)
    9a58:	00112623          	sw	ra,12(sp)
    9a5c:	00050413          	mv	s0,a0
    9a60:	00058493          	mv	s1,a1
    9a64:	02078c63          	beqz	a5,9a9c <__i2b+0x54>
    9a68:	0047a503          	lw	a0,4(a5)
    9a6c:	06050263          	beqz	a0,9ad0 <__i2b+0x88>
    9a70:	00052703          	lw	a4,0(a0)
    9a74:	00e7a223          	sw	a4,4(a5)
    9a78:	00c12083          	lw	ra,12(sp)
    9a7c:	00812403          	lw	s0,8(sp)
    9a80:	00100793          	li	a5,1
    9a84:	00952a23          	sw	s1,20(a0)
    9a88:	00052623          	sw	zero,12(a0)
    9a8c:	00f52823          	sw	a5,16(a0)
    9a90:	00412483          	lw	s1,4(sp)
    9a94:	01010113          	add	sp,sp,16
    9a98:	00008067          	ret
    9a9c:	02100613          	li	a2,33
    9aa0:	00400593          	li	a1,4
    9aa4:	46c010ef          	jal	af10 <_calloc_r>
    9aa8:	04a42223          	sw	a0,68(s0)
    9aac:	00050793          	mv	a5,a0
    9ab0:	fa051ce3          	bnez	a0,9a68 <__i2b+0x20>
    9ab4:	00005697          	auipc	a3,0x5
    9ab8:	57468693          	add	a3,a3,1396 # f028 <__fini_array_end+0x230>
    9abc:	00000613          	li	a2,0
    9ac0:	14500593          	li	a1,325
    9ac4:	00005517          	auipc	a0,0x5
    9ac8:	5f850513          	add	a0,a0,1528 # f0bc <__fini_array_end+0x2c4>
    9acc:	3ec010ef          	jal	aeb8 <__assert_func>
    9ad0:	01c00613          	li	a2,28
    9ad4:	00100593          	li	a1,1
    9ad8:	00040513          	mv	a0,s0
    9adc:	434010ef          	jal	af10 <_calloc_r>
    9ae0:	fc050ae3          	beqz	a0,9ab4 <__i2b+0x6c>
    9ae4:	00100793          	li	a5,1
    9ae8:	00f52223          	sw	a5,4(a0)
    9aec:	00200793          	li	a5,2
    9af0:	00f52423          	sw	a5,8(a0)
    9af4:	f85ff06f          	j	9a78 <__i2b+0x30>

00009af8 <__multiply>:
    9af8:	fb010113          	add	sp,sp,-80
    9afc:	03312e23          	sw	s3,60(sp)
    9b00:	03812423          	sw	s8,40(sp)
    9b04:	01062983          	lw	s3,16(a2)
    9b08:	0105ac03          	lw	s8,16(a1)
    9b0c:	04812423          	sw	s0,72(sp)
    9b10:	03412c23          	sw	s4,56(sp)
    9b14:	04112623          	sw	ra,76(sp)
    9b18:	03712623          	sw	s7,44(sp)
    9b1c:	00058a13          	mv	s4,a1
    9b20:	00060413          	mv	s0,a2
    9b24:	013c4c63          	blt	s8,s3,9b3c <__multiply+0x44>
    9b28:	00098713          	mv	a4,s3
    9b2c:	00058413          	mv	s0,a1
    9b30:	000c0993          	mv	s3,s8
    9b34:	00060a13          	mv	s4,a2
    9b38:	00070c13          	mv	s8,a4
    9b3c:	00842783          	lw	a5,8(s0)
    9b40:	00442583          	lw	a1,4(s0)
    9b44:	01898bb3          	add	s7,s3,s8
    9b48:	0177a7b3          	slt	a5,a5,s7
    9b4c:	00f585b3          	add	a1,a1,a5
    9b50:	b45ff0ef          	jal	9694 <_Balloc>
    9b54:	00a12623          	sw	a0,12(sp)
    9b58:	22050863          	beqz	a0,9d88 <__multiply+0x290>
    9b5c:	00c12783          	lw	a5,12(sp)
    9b60:	03512a23          	sw	s5,52(sp)
    9b64:	03612823          	sw	s6,48(sp)
    9b68:	002b9a93          	sll	s5,s7,0x2
    9b6c:	01478b13          	add	s6,a5,20
    9b70:	015b0ab3          	add	s5,s6,s5
    9b74:	000b0793          	mv	a5,s6
    9b78:	015b7863          	bgeu	s6,s5,9b88 <__multiply+0x90>
    9b7c:	0007a023          	sw	zero,0(a5)
    9b80:	00478793          	add	a5,a5,4
    9b84:	ff57ece3          	bltu	a5,s5,9b7c <__multiply+0x84>
    9b88:	014a0a13          	add	s4,s4,20
    9b8c:	002c1c13          	sll	s8,s8,0x2
    9b90:	01440793          	add	a5,s0,20
    9b94:	018a0733          	add	a4,s4,s8
    9b98:	00299993          	sll	s3,s3,0x2
    9b9c:	00f12423          	sw	a5,8(sp)
    9ba0:	00e12023          	sw	a4,0(sp)
    9ba4:	013789b3          	add	s3,a5,s3
    9ba8:	16ea7c63          	bgeu	s4,a4,9d20 <__multiply+0x228>
    9bac:	00400713          	li	a4,4
    9bb0:	04912223          	sw	s1,68(sp)
    9bb4:	05212023          	sw	s2,64(sp)
    9bb8:	03912223          	sw	s9,36(sp)
    9bbc:	03a12023          	sw	s10,32(sp)
    9bc0:	01b12e23          	sw	s11,28(sp)
    9bc4:	01540793          	add	a5,s0,21
    9bc8:	00e12223          	sw	a4,4(sp)
    9bcc:	1af9f263          	bgeu	s3,a5,9d70 <__multiply+0x278>
    9bd0:	00010437          	lui	s0,0x10
    9bd4:	fff40413          	add	s0,s0,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    9bd8:	01c0006f          	j	9bf4 <__multiply+0xfc>
    9bdc:	01095913          	srl	s2,s2,0x10
    9be0:	0a091063          	bnez	s2,9c80 <__multiply+0x188>
    9be4:	00012783          	lw	a5,0(sp)
    9be8:	004a0a13          	add	s4,s4,4
    9bec:	004b0b13          	add	s6,s6,4
    9bf0:	10fa7e63          	bgeu	s4,a5,9d0c <__multiply+0x214>
    9bf4:	000a2903          	lw	s2,0(s4)
    9bf8:	008974b3          	and	s1,s2,s0
    9bfc:	fe0480e3          	beqz	s1,9bdc <__multiply+0xe4>
    9c00:	00812c83          	lw	s9,8(sp)
    9c04:	000b0d13          	mv	s10,s6
    9c08:	00000c13          	li	s8,0
    9c0c:	000cad83          	lw	s11,0(s9)
    9c10:	000d2903          	lw	s2,0(s10)
    9c14:	00048593          	mv	a1,s1
    9c18:	008df533          	and	a0,s11,s0
    9c1c:	7e5040ef          	jal	ec00 <__mulsi3>
    9c20:	00897733          	and	a4,s2,s0
    9c24:	00e50733          	add	a4,a0,a4
    9c28:	00048593          	mv	a1,s1
    9c2c:	010dd513          	srl	a0,s11,0x10
    9c30:	01870c33          	add	s8,a4,s8
    9c34:	01095913          	srl	s2,s2,0x10
    9c38:	7c9040ef          	jal	ec00 <__mulsi3>
    9c3c:	010c5713          	srl	a4,s8,0x10
    9c40:	01250533          	add	a0,a0,s2
    9c44:	00e50533          	add	a0,a0,a4
    9c48:	008c77b3          	and	a5,s8,s0
    9c4c:	01051713          	sll	a4,a0,0x10
    9c50:	004d0d13          	add	s10,s10,4
    9c54:	00f767b3          	or	a5,a4,a5
    9c58:	004c8c93          	add	s9,s9,4
    9c5c:	fefd2e23          	sw	a5,-4(s10)
    9c60:	01055c13          	srl	s8,a0,0x10
    9c64:	fb3ce4e3          	bltu	s9,s3,9c0c <__multiply+0x114>
    9c68:	00412783          	lw	a5,4(sp)
    9c6c:	00fb0733          	add	a4,s6,a5
    9c70:	01872023          	sw	s8,0(a4)
    9c74:	000a2903          	lw	s2,0(s4)
    9c78:	01095913          	srl	s2,s2,0x10
    9c7c:	f60904e3          	beqz	s2,9be4 <__multiply+0xec>
    9c80:	000b2c83          	lw	s9,0(s6)
    9c84:	00812d03          	lw	s10,8(sp)
    9c88:	000b0c13          	mv	s8,s6
    9c8c:	000c8493          	mv	s1,s9
    9c90:	00000d93          	li	s11,0
    9c94:	000d2503          	lw	a0,0(s10)
    9c98:	00090593          	mv	a1,s2
    9c9c:	0104d493          	srl	s1,s1,0x10
    9ca0:	00857533          	and	a0,a0,s0
    9ca4:	75d040ef          	jal	ec00 <__mulsi3>
    9ca8:	01b50733          	add	a4,a0,s11
    9cac:	00970db3          	add	s11,a4,s1
    9cb0:	010d9593          	sll	a1,s11,0x10
    9cb4:	008cf7b3          	and	a5,s9,s0
    9cb8:	00f5e7b3          	or	a5,a1,a5
    9cbc:	00fc2023          	sw	a5,0(s8)
    9cc0:	002d5503          	lhu	a0,2(s10)
    9cc4:	004c2483          	lw	s1,4(s8)
    9cc8:	00090593          	mv	a1,s2
    9ccc:	735040ef          	jal	ec00 <__mulsi3>
    9cd0:	0084f7b3          	and	a5,s1,s0
    9cd4:	010dd713          	srl	a4,s11,0x10
    9cd8:	00f507b3          	add	a5,a0,a5
    9cdc:	004d0d13          	add	s10,s10,4
    9ce0:	00e78cb3          	add	s9,a5,a4
    9ce4:	004c0c13          	add	s8,s8,4
    9ce8:	010cdd93          	srl	s11,s9,0x10
    9cec:	fb3d64e3          	bltu	s10,s3,9c94 <__multiply+0x19c>
    9cf0:	00412783          	lw	a5,4(sp)
    9cf4:	004a0a13          	add	s4,s4,4
    9cf8:	00fb0733          	add	a4,s6,a5
    9cfc:	00012783          	lw	a5,0(sp)
    9d00:	01972023          	sw	s9,0(a4)
    9d04:	004b0b13          	add	s6,s6,4
    9d08:	eefa66e3          	bltu	s4,a5,9bf4 <__multiply+0xfc>
    9d0c:	04412483          	lw	s1,68(sp)
    9d10:	04012903          	lw	s2,64(sp)
    9d14:	02412c83          	lw	s9,36(sp)
    9d18:	02012d03          	lw	s10,32(sp)
    9d1c:	01c12d83          	lw	s11,28(sp)
    9d20:	01704863          	bgtz	s7,9d30 <__multiply+0x238>
    9d24:	0180006f          	j	9d3c <__multiply+0x244>
    9d28:	fffb8b93          	add	s7,s7,-1
    9d2c:	000b8863          	beqz	s7,9d3c <__multiply+0x244>
    9d30:	ffcaa783          	lw	a5,-4(s5)
    9d34:	ffca8a93          	add	s5,s5,-4
    9d38:	fe0788e3          	beqz	a5,9d28 <__multiply+0x230>
    9d3c:	00c12783          	lw	a5,12(sp)
    9d40:	04c12083          	lw	ra,76(sp)
    9d44:	04812403          	lw	s0,72(sp)
    9d48:	0177a823          	sw	s7,16(a5)
    9d4c:	03412a83          	lw	s5,52(sp)
    9d50:	03012b03          	lw	s6,48(sp)
    9d54:	03c12983          	lw	s3,60(sp)
    9d58:	03812a03          	lw	s4,56(sp)
    9d5c:	02c12b83          	lw	s7,44(sp)
    9d60:	02812c03          	lw	s8,40(sp)
    9d64:	00078513          	mv	a0,a5
    9d68:	05010113          	add	sp,sp,80
    9d6c:	00008067          	ret
    9d70:	408987b3          	sub	a5,s3,s0
    9d74:	feb78793          	add	a5,a5,-21
    9d78:	ffc7f793          	and	a5,a5,-4
    9d7c:	00478793          	add	a5,a5,4
    9d80:	00f12223          	sw	a5,4(sp)
    9d84:	e4dff06f          	j	9bd0 <__multiply+0xd8>
    9d88:	00005697          	auipc	a3,0x5
    9d8c:	2a068693          	add	a3,a3,672 # f028 <__fini_array_end+0x230>
    9d90:	00000613          	li	a2,0
    9d94:	16200593          	li	a1,354
    9d98:	00005517          	auipc	a0,0x5
    9d9c:	32450513          	add	a0,a0,804 # f0bc <__fini_array_end+0x2c4>
    9da0:	04912223          	sw	s1,68(sp)
    9da4:	05212023          	sw	s2,64(sp)
    9da8:	03512a23          	sw	s5,52(sp)
    9dac:	03612823          	sw	s6,48(sp)
    9db0:	03912223          	sw	s9,36(sp)
    9db4:	03a12023          	sw	s10,32(sp)
    9db8:	01b12e23          	sw	s11,28(sp)
    9dbc:	0fc010ef          	jal	aeb8 <__assert_func>

00009dc0 <__pow5mult>:
    9dc0:	fe010113          	add	sp,sp,-32
    9dc4:	00812c23          	sw	s0,24(sp)
    9dc8:	01212823          	sw	s2,16(sp)
    9dcc:	01312623          	sw	s3,12(sp)
    9dd0:	00112e23          	sw	ra,28(sp)
    9dd4:	00367793          	and	a5,a2,3
    9dd8:	00060413          	mv	s0,a2
    9ddc:	00050993          	mv	s3,a0
    9de0:	00058913          	mv	s2,a1
    9de4:	0a079c63          	bnez	a5,9e9c <__pow5mult+0xdc>
    9de8:	40245413          	sra	s0,s0,0x2
    9dec:	06040a63          	beqz	s0,9e60 <__pow5mult+0xa0>
    9df0:	00912a23          	sw	s1,20(sp)
    9df4:	0409a483          	lw	s1,64(s3)
    9df8:	0c048663          	beqz	s1,9ec4 <__pow5mult+0x104>
    9dfc:	00147793          	and	a5,s0,1
    9e00:	02079063          	bnez	a5,9e20 <__pow5mult+0x60>
    9e04:	40145413          	sra	s0,s0,0x1
    9e08:	04040a63          	beqz	s0,9e5c <__pow5mult+0x9c>
    9e0c:	0004a503          	lw	a0,0(s1)
    9e10:	06050663          	beqz	a0,9e7c <__pow5mult+0xbc>
    9e14:	00050493          	mv	s1,a0
    9e18:	00147793          	and	a5,s0,1
    9e1c:	fe0784e3          	beqz	a5,9e04 <__pow5mult+0x44>
    9e20:	00048613          	mv	a2,s1
    9e24:	00090593          	mv	a1,s2
    9e28:	00098513          	mv	a0,s3
    9e2c:	ccdff0ef          	jal	9af8 <__multiply>
    9e30:	02090063          	beqz	s2,9e50 <__pow5mult+0x90>
    9e34:	00492703          	lw	a4,4(s2)
    9e38:	0449a783          	lw	a5,68(s3)
    9e3c:	00271713          	sll	a4,a4,0x2
    9e40:	00e787b3          	add	a5,a5,a4
    9e44:	0007a703          	lw	a4,0(a5)
    9e48:	00e92023          	sw	a4,0(s2)
    9e4c:	0127a023          	sw	s2,0(a5)
    9e50:	40145413          	sra	s0,s0,0x1
    9e54:	00050913          	mv	s2,a0
    9e58:	fa041ae3          	bnez	s0,9e0c <__pow5mult+0x4c>
    9e5c:	01412483          	lw	s1,20(sp)
    9e60:	01c12083          	lw	ra,28(sp)
    9e64:	01812403          	lw	s0,24(sp)
    9e68:	00c12983          	lw	s3,12(sp)
    9e6c:	00090513          	mv	a0,s2
    9e70:	01012903          	lw	s2,16(sp)
    9e74:	02010113          	add	sp,sp,32
    9e78:	00008067          	ret
    9e7c:	00048613          	mv	a2,s1
    9e80:	00048593          	mv	a1,s1
    9e84:	00098513          	mv	a0,s3
    9e88:	c71ff0ef          	jal	9af8 <__multiply>
    9e8c:	00a4a023          	sw	a0,0(s1)
    9e90:	00052023          	sw	zero,0(a0)
    9e94:	00050493          	mv	s1,a0
    9e98:	f81ff06f          	j	9e18 <__pow5mult+0x58>
    9e9c:	fff78793          	add	a5,a5,-1
    9ea0:	00005717          	auipc	a4,0x5
    9ea4:	79070713          	add	a4,a4,1936 # f630 <p05.0>
    9ea8:	00279793          	sll	a5,a5,0x2
    9eac:	00f707b3          	add	a5,a4,a5
    9eb0:	0007a603          	lw	a2,0(a5)
    9eb4:	00000693          	li	a3,0
    9eb8:	8b5ff0ef          	jal	976c <__multadd>
    9ebc:	00050913          	mv	s2,a0
    9ec0:	f29ff06f          	j	9de8 <__pow5mult+0x28>
    9ec4:	00100593          	li	a1,1
    9ec8:	00098513          	mv	a0,s3
    9ecc:	fc8ff0ef          	jal	9694 <_Balloc>
    9ed0:	00050493          	mv	s1,a0
    9ed4:	02050063          	beqz	a0,9ef4 <__pow5mult+0x134>
    9ed8:	27100793          	li	a5,625
    9edc:	00f52a23          	sw	a5,20(a0)
    9ee0:	00100793          	li	a5,1
    9ee4:	00f52823          	sw	a5,16(a0)
    9ee8:	04a9a023          	sw	a0,64(s3)
    9eec:	00052023          	sw	zero,0(a0)
    9ef0:	f0dff06f          	j	9dfc <__pow5mult+0x3c>
    9ef4:	00005697          	auipc	a3,0x5
    9ef8:	13468693          	add	a3,a3,308 # f028 <__fini_array_end+0x230>
    9efc:	00000613          	li	a2,0
    9f00:	14500593          	li	a1,325
    9f04:	00005517          	auipc	a0,0x5
    9f08:	1b850513          	add	a0,a0,440 # f0bc <__fini_array_end+0x2c4>
    9f0c:	7ad000ef          	jal	aeb8 <__assert_func>

00009f10 <__lshift>:
    9f10:	fe010113          	add	sp,sp,-32
    9f14:	01512223          	sw	s5,4(sp)
    9f18:	0105aa83          	lw	s5,16(a1)
    9f1c:	0085a783          	lw	a5,8(a1)
    9f20:	01312623          	sw	s3,12(sp)
    9f24:	40565993          	sra	s3,a2,0x5
    9f28:	01598ab3          	add	s5,s3,s5
    9f2c:	00812c23          	sw	s0,24(sp)
    9f30:	00912a23          	sw	s1,20(sp)
    9f34:	01212823          	sw	s2,16(sp)
    9f38:	01412423          	sw	s4,8(sp)
    9f3c:	00112e23          	sw	ra,28(sp)
    9f40:	001a8913          	add	s2,s5,1
    9f44:	00058493          	mv	s1,a1
    9f48:	00060413          	mv	s0,a2
    9f4c:	0045a583          	lw	a1,4(a1)
    9f50:	00050a13          	mv	s4,a0
    9f54:	0127d863          	bge	a5,s2,9f64 <__lshift+0x54>
    9f58:	00179793          	sll	a5,a5,0x1
    9f5c:	00158593          	add	a1,a1,1
    9f60:	ff27cce3          	blt	a5,s2,9f58 <__lshift+0x48>
    9f64:	000a0513          	mv	a0,s4
    9f68:	f2cff0ef          	jal	9694 <_Balloc>
    9f6c:	10050c63          	beqz	a0,a084 <__lshift+0x174>
    9f70:	01450813          	add	a6,a0,20
    9f74:	03305463          	blez	s3,9f9c <__lshift+0x8c>
    9f78:	00598993          	add	s3,s3,5
    9f7c:	00299993          	sll	s3,s3,0x2
    9f80:	01350733          	add	a4,a0,s3
    9f84:	00080793          	mv	a5,a6
    9f88:	00478793          	add	a5,a5,4
    9f8c:	fe07ae23          	sw	zero,-4(a5)
    9f90:	fee79ce3          	bne	a5,a4,9f88 <__lshift+0x78>
    9f94:	fec98993          	add	s3,s3,-20
    9f98:	01380833          	add	a6,a6,s3
    9f9c:	0104a883          	lw	a7,16(s1)
    9fa0:	01448793          	add	a5,s1,20
    9fa4:	01f47613          	and	a2,s0,31
    9fa8:	00289893          	sll	a7,a7,0x2
    9fac:	011788b3          	add	a7,a5,a7
    9fb0:	0a060463          	beqz	a2,a058 <__lshift+0x148>
    9fb4:	02000593          	li	a1,32
    9fb8:	40c585b3          	sub	a1,a1,a2
    9fbc:	00080313          	mv	t1,a6
    9fc0:	00000693          	li	a3,0
    9fc4:	0007a703          	lw	a4,0(a5)
    9fc8:	00430313          	add	t1,t1,4
    9fcc:	00478793          	add	a5,a5,4
    9fd0:	00c71733          	sll	a4,a4,a2
    9fd4:	00d76733          	or	a4,a4,a3
    9fd8:	fee32e23          	sw	a4,-4(t1)
    9fdc:	ffc7a683          	lw	a3,-4(a5)
    9fe0:	00b6d6b3          	srl	a3,a3,a1
    9fe4:	ff17e0e3          	bltu	a5,a7,9fc4 <__lshift+0xb4>
    9fe8:	01548793          	add	a5,s1,21
    9fec:	00400713          	li	a4,4
    9ff0:	00f8ea63          	bltu	a7,a5,a004 <__lshift+0xf4>
    9ff4:	409887b3          	sub	a5,a7,s1
    9ff8:	feb78793          	add	a5,a5,-21
    9ffc:	ffc7f793          	and	a5,a5,-4
    a000:	00478713          	add	a4,a5,4
    a004:	00e80833          	add	a6,a6,a4
    a008:	00d82023          	sw	a3,0(a6)
    a00c:	00069463          	bnez	a3,a014 <__lshift+0x104>
    a010:	000a8913          	mv	s2,s5
    a014:	0044a703          	lw	a4,4(s1)
    a018:	044a2783          	lw	a5,68(s4)
    a01c:	01c12083          	lw	ra,28(sp)
    a020:	00271713          	sll	a4,a4,0x2
    a024:	00e787b3          	add	a5,a5,a4
    a028:	0007a703          	lw	a4,0(a5)
    a02c:	01252823          	sw	s2,16(a0)
    a030:	01812403          	lw	s0,24(sp)
    a034:	00e4a023          	sw	a4,0(s1)
    a038:	0097a023          	sw	s1,0(a5)
    a03c:	01012903          	lw	s2,16(sp)
    a040:	01412483          	lw	s1,20(sp)
    a044:	00c12983          	lw	s3,12(sp)
    a048:	00812a03          	lw	s4,8(sp)
    a04c:	00412a83          	lw	s5,4(sp)
    a050:	02010113          	add	sp,sp,32
    a054:	00008067          	ret
    a058:	0007a703          	lw	a4,0(a5)
    a05c:	00478793          	add	a5,a5,4
    a060:	00480813          	add	a6,a6,4
    a064:	fee82e23          	sw	a4,-4(a6)
    a068:	fb17f4e3          	bgeu	a5,a7,a010 <__lshift+0x100>
    a06c:	0007a703          	lw	a4,0(a5)
    a070:	00478793          	add	a5,a5,4
    a074:	00480813          	add	a6,a6,4
    a078:	fee82e23          	sw	a4,-4(a6)
    a07c:	fd17eee3          	bltu	a5,a7,a058 <__lshift+0x148>
    a080:	f91ff06f          	j	a010 <__lshift+0x100>
    a084:	00005697          	auipc	a3,0x5
    a088:	fa468693          	add	a3,a3,-92 # f028 <__fini_array_end+0x230>
    a08c:	00000613          	li	a2,0
    a090:	1de00593          	li	a1,478
    a094:	00005517          	auipc	a0,0x5
    a098:	02850513          	add	a0,a0,40 # f0bc <__fini_array_end+0x2c4>
    a09c:	61d000ef          	jal	aeb8 <__assert_func>

0000a0a0 <__mcmp>:
    a0a0:	01052703          	lw	a4,16(a0)
    a0a4:	0105a783          	lw	a5,16(a1)
    a0a8:	00050813          	mv	a6,a0
    a0ac:	40f70533          	sub	a0,a4,a5
    a0b0:	04f71263          	bne	a4,a5,a0f4 <__mcmp+0x54>
    a0b4:	00279793          	sll	a5,a5,0x2
    a0b8:	01480813          	add	a6,a6,20
    a0bc:	01458593          	add	a1,a1,20
    a0c0:	00f80733          	add	a4,a6,a5
    a0c4:	00f587b3          	add	a5,a1,a5
    a0c8:	0080006f          	j	a0d0 <__mcmp+0x30>
    a0cc:	02e87463          	bgeu	a6,a4,a0f4 <__mcmp+0x54>
    a0d0:	ffc72603          	lw	a2,-4(a4)
    a0d4:	ffc7a683          	lw	a3,-4(a5)
    a0d8:	ffc70713          	add	a4,a4,-4
    a0dc:	ffc78793          	add	a5,a5,-4
    a0e0:	fed606e3          	beq	a2,a3,a0cc <__mcmp+0x2c>
    a0e4:	00100513          	li	a0,1
    a0e8:	00d67663          	bgeu	a2,a3,a0f4 <__mcmp+0x54>
    a0ec:	fff00513          	li	a0,-1
    a0f0:	00008067          	ret
    a0f4:	00008067          	ret

0000a0f8 <__mdiff>:
    a0f8:	0105a703          	lw	a4,16(a1)
    a0fc:	01062783          	lw	a5,16(a2)
    a100:	ff010113          	add	sp,sp,-16
    a104:	00812423          	sw	s0,8(sp)
    a108:	00912223          	sw	s1,4(sp)
    a10c:	00112623          	sw	ra,12(sp)
    a110:	01212023          	sw	s2,0(sp)
    a114:	00058413          	mv	s0,a1
    a118:	00060493          	mv	s1,a2
    a11c:	40f706b3          	sub	a3,a4,a5
    a120:	18f71e63          	bne	a4,a5,a2bc <__mdiff+0x1c4>
    a124:	00279693          	sll	a3,a5,0x2
    a128:	01458613          	add	a2,a1,20
    a12c:	01448713          	add	a4,s1,20
    a130:	00d607b3          	add	a5,a2,a3
    a134:	00d70733          	add	a4,a4,a3
    a138:	0080006f          	j	a140 <__mdiff+0x48>
    a13c:	18f67c63          	bgeu	a2,a5,a2d4 <__mdiff+0x1dc>
    a140:	ffc7a583          	lw	a1,-4(a5)
    a144:	ffc72683          	lw	a3,-4(a4)
    a148:	ffc78793          	add	a5,a5,-4
    a14c:	ffc70713          	add	a4,a4,-4
    a150:	fed586e3          	beq	a1,a3,a13c <__mdiff+0x44>
    a154:	00100913          	li	s2,1
    a158:	00d5ea63          	bltu	a1,a3,a16c <__mdiff+0x74>
    a15c:	00048793          	mv	a5,s1
    a160:	00000913          	li	s2,0
    a164:	00040493          	mv	s1,s0
    a168:	00078413          	mv	s0,a5
    a16c:	0044a583          	lw	a1,4(s1)
    a170:	d24ff0ef          	jal	9694 <_Balloc>
    a174:	1a050663          	beqz	a0,a320 <__mdiff+0x228>
    a178:	0104a883          	lw	a7,16(s1)
    a17c:	01042283          	lw	t0,16(s0)
    a180:	01448f93          	add	t6,s1,20
    a184:	00289313          	sll	t1,a7,0x2
    a188:	01440813          	add	a6,s0,20
    a18c:	00229293          	sll	t0,t0,0x2
    a190:	01450593          	add	a1,a0,20
    a194:	00010e37          	lui	t3,0x10
    a198:	01252623          	sw	s2,12(a0)
    a19c:	006f8333          	add	t1,t6,t1
    a1a0:	005802b3          	add	t0,a6,t0
    a1a4:	00058f13          	mv	t5,a1
    a1a8:	000f8e93          	mv	t4,t6
    a1ac:	00000693          	li	a3,0
    a1b0:	fffe0e13          	add	t3,t3,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    a1b4:	000ea703          	lw	a4,0(t4)
    a1b8:	00082603          	lw	a2,0(a6)
    a1bc:	004f0f13          	add	t5,t5,4
    a1c0:	01c777b3          	and	a5,a4,t3
    a1c4:	01c673b3          	and	t2,a2,t3
    a1c8:	407787b3          	sub	a5,a5,t2
    a1cc:	00d787b3          	add	a5,a5,a3
    a1d0:	01075713          	srl	a4,a4,0x10
    a1d4:	01065613          	srl	a2,a2,0x10
    a1d8:	4107d693          	sra	a3,a5,0x10
    a1dc:	40c70733          	sub	a4,a4,a2
    a1e0:	00d70733          	add	a4,a4,a3
    a1e4:	01071693          	sll	a3,a4,0x10
    a1e8:	01c7f7b3          	and	a5,a5,t3
    a1ec:	00d7e7b3          	or	a5,a5,a3
    a1f0:	00480813          	add	a6,a6,4
    a1f4:	feff2e23          	sw	a5,-4(t5)
    a1f8:	004e8e93          	add	t4,t4,4
    a1fc:	41075693          	sra	a3,a4,0x10
    a200:	fa586ae3          	bltu	a6,t0,a1b4 <__mdiff+0xbc>
    a204:	01540713          	add	a4,s0,21
    a208:	40828433          	sub	s0,t0,s0
    a20c:	feb40413          	add	s0,s0,-21
    a210:	00e2b2b3          	sltu	t0,t0,a4
    a214:	0012cf13          	xor	t5,t0,1
    a218:	00245413          	srl	s0,s0,0x2
    a21c:	00400713          	li	a4,4
    a220:	0a028463          	beqz	t0,a2c8 <__mdiff+0x1d0>
    a224:	00ef8fb3          	add	t6,t6,a4
    a228:	00e58833          	add	a6,a1,a4
    a22c:	00010eb7          	lui	t4,0x10
    a230:	00080e13          	mv	t3,a6
    a234:	000f8613          	mv	a2,t6
    a238:	fffe8e93          	add	t4,t4,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    a23c:	0c6ff463          	bgeu	t6,t1,a304 <__mdiff+0x20c>
    a240:	00062783          	lw	a5,0(a2)
    a244:	004e0e13          	add	t3,t3,4
    a248:	00460613          	add	a2,a2,4
    a24c:	01d7f733          	and	a4,a5,t4
    a250:	00d70733          	add	a4,a4,a3
    a254:	0107d593          	srl	a1,a5,0x10
    a258:	41075713          	sra	a4,a4,0x10
    a25c:	00b70733          	add	a4,a4,a1
    a260:	00d787b3          	add	a5,a5,a3
    a264:	01d7f7b3          	and	a5,a5,t4
    a268:	01071693          	sll	a3,a4,0x10
    a26c:	00d7e7b3          	or	a5,a5,a3
    a270:	fefe2e23          	sw	a5,-4(t3)
    a274:	41075693          	sra	a3,a4,0x10
    a278:	fc6664e3          	bltu	a2,t1,a240 <__mdiff+0x148>
    a27c:	fff30313          	add	t1,t1,-1
    a280:	41f30333          	sub	t1,t1,t6
    a284:	ffc37313          	and	t1,t1,-4
    a288:	00680733          	add	a4,a6,t1
    a28c:	00079a63          	bnez	a5,a2a0 <__mdiff+0x1a8>
    a290:	ffc72783          	lw	a5,-4(a4)
    a294:	fff88893          	add	a7,a7,-1
    a298:	ffc70713          	add	a4,a4,-4
    a29c:	fe078ae3          	beqz	a5,a290 <__mdiff+0x198>
    a2a0:	00c12083          	lw	ra,12(sp)
    a2a4:	00812403          	lw	s0,8(sp)
    a2a8:	01152823          	sw	a7,16(a0)
    a2ac:	00412483          	lw	s1,4(sp)
    a2b0:	00012903          	lw	s2,0(sp)
    a2b4:	01010113          	add	sp,sp,16
    a2b8:	00008067          	ret
    a2bc:	00100913          	li	s2,1
    a2c0:	e806dee3          	bgez	a3,a15c <__mdiff+0x64>
    a2c4:	ea9ff06f          	j	a16c <__mdiff+0x74>
    a2c8:	00140713          	add	a4,s0,1
    a2cc:	00271713          	sll	a4,a4,0x2
    a2d0:	f55ff06f          	j	a224 <__mdiff+0x12c>
    a2d4:	00000593          	li	a1,0
    a2d8:	bbcff0ef          	jal	9694 <_Balloc>
    a2dc:	06050063          	beqz	a0,a33c <__mdiff+0x244>
    a2e0:	00c12083          	lw	ra,12(sp)
    a2e4:	00812403          	lw	s0,8(sp)
    a2e8:	00100793          	li	a5,1
    a2ec:	00f52823          	sw	a5,16(a0)
    a2f0:	00052a23          	sw	zero,20(a0)
    a2f4:	00412483          	lw	s1,4(sp)
    a2f8:	00012903          	lw	s2,0(sp)
    a2fc:	01010113          	add	sp,sp,16
    a300:	00008067          	ret
    a304:	00000713          	li	a4,0
    a308:	000f1663          	bnez	t5,a314 <__mdiff+0x21c>
    a30c:	00e58733          	add	a4,a1,a4
    a310:	f7dff06f          	j	a28c <__mdiff+0x194>
    a314:	00241713          	sll	a4,s0,0x2
    a318:	00e58733          	add	a4,a1,a4
    a31c:	f71ff06f          	j	a28c <__mdiff+0x194>
    a320:	00005697          	auipc	a3,0x5
    a324:	d0868693          	add	a3,a3,-760 # f028 <__fini_array_end+0x230>
    a328:	00000613          	li	a2,0
    a32c:	24500593          	li	a1,581
    a330:	00005517          	auipc	a0,0x5
    a334:	d8c50513          	add	a0,a0,-628 # f0bc <__fini_array_end+0x2c4>
    a338:	381000ef          	jal	aeb8 <__assert_func>
    a33c:	00005697          	auipc	a3,0x5
    a340:	cec68693          	add	a3,a3,-788 # f028 <__fini_array_end+0x230>
    a344:	00000613          	li	a2,0
    a348:	23700593          	li	a1,567
    a34c:	00005517          	auipc	a0,0x5
    a350:	d7050513          	add	a0,a0,-656 # f0bc <__fini_array_end+0x2c4>
    a354:	365000ef          	jal	aeb8 <__assert_func>

0000a358 <__d2b>:
    a358:	fd010113          	add	sp,sp,-48
    a35c:	01512a23          	sw	s5,20(sp)
    a360:	00058a93          	mv	s5,a1
    a364:	00100593          	li	a1,1
    a368:	02912223          	sw	s1,36(sp)
    a36c:	01312e23          	sw	s3,28(sp)
    a370:	01412c23          	sw	s4,24(sp)
    a374:	02112623          	sw	ra,44(sp)
    a378:	02812423          	sw	s0,40(sp)
    a37c:	03212023          	sw	s2,32(sp)
    a380:	00060493          	mv	s1,a2
    a384:	00068a13          	mv	s4,a3
    a388:	00070993          	mv	s3,a4
    a38c:	b08ff0ef          	jal	9694 <_Balloc>
    a390:	10050263          	beqz	a0,a494 <__d2b+0x13c>
    a394:	00100737          	lui	a4,0x100
    a398:	0144d913          	srl	s2,s1,0x14
    a39c:	fff70793          	add	a5,a4,-1 # fffff <__neorv32_ram_size+0x7ffff>
    a3a0:	7ff97913          	and	s2,s2,2047
    a3a4:	00050413          	mv	s0,a0
    a3a8:	0097f7b3          	and	a5,a5,s1
    a3ac:	00090463          	beqz	s2,a3b4 <__d2b+0x5c>
    a3b0:	00e7e7b3          	or	a5,a5,a4
    a3b4:	00f12623          	sw	a5,12(sp)
    a3b8:	060a9263          	bnez	s5,a41c <__d2b+0xc4>
    a3bc:	00c10513          	add	a0,sp,12
    a3c0:	da8ff0ef          	jal	9968 <__lo0bits>
    a3c4:	00c12703          	lw	a4,12(sp)
    a3c8:	00100493          	li	s1,1
    a3cc:	00942823          	sw	s1,16(s0)
    a3d0:	00e42a23          	sw	a4,20(s0)
    a3d4:	02050793          	add	a5,a0,32
    a3d8:	08090863          	beqz	s2,a468 <__d2b+0x110>
    a3dc:	bcd90913          	add	s2,s2,-1075
    a3e0:	00f90933          	add	s2,s2,a5
    a3e4:	03500493          	li	s1,53
    a3e8:	012a2023          	sw	s2,0(s4)
    a3ec:	40f48533          	sub	a0,s1,a5
    a3f0:	00a9a023          	sw	a0,0(s3)
    a3f4:	02c12083          	lw	ra,44(sp)
    a3f8:	00040513          	mv	a0,s0
    a3fc:	02812403          	lw	s0,40(sp)
    a400:	02412483          	lw	s1,36(sp)
    a404:	02012903          	lw	s2,32(sp)
    a408:	01c12983          	lw	s3,28(sp)
    a40c:	01812a03          	lw	s4,24(sp)
    a410:	01412a83          	lw	s5,20(sp)
    a414:	03010113          	add	sp,sp,48
    a418:	00008067          	ret
    a41c:	00810513          	add	a0,sp,8
    a420:	01512423          	sw	s5,8(sp)
    a424:	d44ff0ef          	jal	9968 <__lo0bits>
    a428:	00c12703          	lw	a4,12(sp)
    a42c:	00050793          	mv	a5,a0
    a430:	04050e63          	beqz	a0,a48c <__d2b+0x134>
    a434:	00812603          	lw	a2,8(sp)
    a438:	02000693          	li	a3,32
    a43c:	40a686b3          	sub	a3,a3,a0
    a440:	00d716b3          	sll	a3,a4,a3
    a444:	00a75733          	srl	a4,a4,a0
    a448:	00c6e6b3          	or	a3,a3,a2
    a44c:	00e12623          	sw	a4,12(sp)
    a450:	00e034b3          	snez	s1,a4
    a454:	00148493          	add	s1,s1,1
    a458:	00d42a23          	sw	a3,20(s0)
    a45c:	00e42c23          	sw	a4,24(s0)
    a460:	00942823          	sw	s1,16(s0)
    a464:	f6091ce3          	bnez	s2,a3dc <__d2b+0x84>
    a468:	00249713          	sll	a4,s1,0x2
    a46c:	00e40733          	add	a4,s0,a4
    a470:	01072503          	lw	a0,16(a4)
    a474:	bce78793          	add	a5,a5,-1074
    a478:	00fa2023          	sw	a5,0(s4)
    a47c:	c74ff0ef          	jal	98f0 <__hi0bits>
    a480:	00549493          	sll	s1,s1,0x5
    a484:	40a48533          	sub	a0,s1,a0
    a488:	f69ff06f          	j	a3f0 <__d2b+0x98>
    a48c:	00812683          	lw	a3,8(sp)
    a490:	fc1ff06f          	j	a450 <__d2b+0xf8>
    a494:	00005697          	auipc	a3,0x5
    a498:	b9468693          	add	a3,a3,-1132 # f028 <__fini_array_end+0x230>
    a49c:	00000613          	li	a2,0
    a4a0:	30f00593          	li	a1,783
    a4a4:	00005517          	auipc	a0,0x5
    a4a8:	c1850513          	add	a0,a0,-1000 # f0bc <__fini_array_end+0x2c4>
    a4ac:	20d000ef          	jal	aeb8 <__assert_func>

0000a4b0 <_realloc_r>:
    a4b0:	fd010113          	add	sp,sp,-48
    a4b4:	02912223          	sw	s1,36(sp)
    a4b8:	02112623          	sw	ra,44(sp)
    a4bc:	00060493          	mv	s1,a2
    a4c0:	1e058863          	beqz	a1,a6b0 <_realloc_r+0x200>
    a4c4:	02812423          	sw	s0,40(sp)
    a4c8:	03212023          	sw	s2,32(sp)
    a4cc:	00058413          	mv	s0,a1
    a4d0:	01312e23          	sw	s3,28(sp)
    a4d4:	01512a23          	sw	s5,20(sp)
    a4d8:	01412c23          	sw	s4,24(sp)
    a4dc:	00050913          	mv	s2,a0
    a4e0:	8b1f70ef          	jal	1d90 <__malloc_lock>
    a4e4:	ffc42703          	lw	a4,-4(s0)
    a4e8:	00b48793          	add	a5,s1,11
    a4ec:	01600693          	li	a3,22
    a4f0:	ff840a93          	add	s5,s0,-8
    a4f4:	ffc77993          	and	s3,a4,-4
    a4f8:	10f6f263          	bgeu	a3,a5,a5fc <_realloc_r+0x14c>
    a4fc:	ff87fa13          	and	s4,a5,-8
    a500:	1007c263          	bltz	a5,a604 <_realloc_r+0x154>
    a504:	109a6063          	bltu	s4,s1,a604 <_realloc_r+0x154>
    a508:	1349d263          	bge	s3,s4,a62c <_realloc_r+0x17c>
    a50c:	01812423          	sw	s8,8(sp)
    a510:	7fff6c17          	auipc	s8,0x7fff6
    a514:	c10c0c13          	add	s8,s8,-1008 # 80000120 <__malloc_av_>
    a518:	008c2603          	lw	a2,8(s8)
    a51c:	013a86b3          	add	a3,s5,s3
    a520:	0046a783          	lw	a5,4(a3)
    a524:	1cd60863          	beq	a2,a3,a6f4 <_realloc_r+0x244>
    a528:	ffe7f613          	and	a2,a5,-2
    a52c:	00c68633          	add	a2,a3,a2
    a530:	00462603          	lw	a2,4(a2)
    a534:	00167613          	and	a2,a2,1
    a538:	14061a63          	bnez	a2,a68c <_realloc_r+0x1dc>
    a53c:	ffc7f793          	and	a5,a5,-4
    a540:	00f98633          	add	a2,s3,a5
    a544:	0d465863          	bge	a2,s4,a614 <_realloc_r+0x164>
    a548:	00177713          	and	a4,a4,1
    a54c:	02071c63          	bnez	a4,a584 <_realloc_r+0xd4>
    a550:	01712623          	sw	s7,12(sp)
    a554:	ff842b83          	lw	s7,-8(s0)
    a558:	01612823          	sw	s6,16(sp)
    a55c:	417a8bb3          	sub	s7,s5,s7
    a560:	004ba703          	lw	a4,4(s7)
    a564:	ffc77713          	and	a4,a4,-4
    a568:	00e787b3          	add	a5,a5,a4
    a56c:	01378b33          	add	s6,a5,s3
    a570:	334b5c63          	bge	s6,s4,a8a8 <_realloc_r+0x3f8>
    a574:	00e98b33          	add	s6,s3,a4
    a578:	294b5863          	bge	s6,s4,a808 <_realloc_r+0x358>
    a57c:	01012b03          	lw	s6,16(sp)
    a580:	00c12b83          	lw	s7,12(sp)
    a584:	00048593          	mv	a1,s1
    a588:	00090513          	mv	a0,s2
    a58c:	824f70ef          	jal	15b0 <_malloc_r>
    a590:	00050493          	mv	s1,a0
    a594:	40050863          	beqz	a0,a9a4 <_realloc_r+0x4f4>
    a598:	ffc42783          	lw	a5,-4(s0)
    a59c:	ff850713          	add	a4,a0,-8
    a5a0:	ffe7f793          	and	a5,a5,-2
    a5a4:	00fa87b3          	add	a5,s5,a5
    a5a8:	24e78663          	beq	a5,a4,a7f4 <_realloc_r+0x344>
    a5ac:	ffc98613          	add	a2,s3,-4
    a5b0:	02400793          	li	a5,36
    a5b4:	2ec7e463          	bltu	a5,a2,a89c <_realloc_r+0x3ec>
    a5b8:	01300713          	li	a4,19
    a5bc:	20c76a63          	bltu	a4,a2,a7d0 <_realloc_r+0x320>
    a5c0:	00050793          	mv	a5,a0
    a5c4:	00040713          	mv	a4,s0
    a5c8:	00072683          	lw	a3,0(a4)
    a5cc:	00d7a023          	sw	a3,0(a5)
    a5d0:	00472683          	lw	a3,4(a4)
    a5d4:	00d7a223          	sw	a3,4(a5)
    a5d8:	00872703          	lw	a4,8(a4)
    a5dc:	00e7a423          	sw	a4,8(a5)
    a5e0:	00040593          	mv	a1,s0
    a5e4:	00090513          	mv	a0,s2
    a5e8:	cbdf60ef          	jal	12a4 <_free_r>
    a5ec:	00090513          	mv	a0,s2
    a5f0:	facf70ef          	jal	1d9c <__malloc_unlock>
    a5f4:	00812c03          	lw	s8,8(sp)
    a5f8:	06c0006f          	j	a664 <_realloc_r+0x1b4>
    a5fc:	01000a13          	li	s4,16
    a600:	f09a74e3          	bgeu	s4,s1,a508 <_realloc_r+0x58>
    a604:	00c00793          	li	a5,12
    a608:	00f92023          	sw	a5,0(s2)
    a60c:	00000493          	li	s1,0
    a610:	0540006f          	j	a664 <_realloc_r+0x1b4>
    a614:	00c6a783          	lw	a5,12(a3)
    a618:	0086a703          	lw	a4,8(a3)
    a61c:	00812c03          	lw	s8,8(sp)
    a620:	00060993          	mv	s3,a2
    a624:	00f72623          	sw	a5,12(a4)
    a628:	00e7a423          	sw	a4,8(a5)
    a62c:	004aa783          	lw	a5,4(s5)
    a630:	414986b3          	sub	a3,s3,s4
    a634:	00f00613          	li	a2,15
    a638:	0017f793          	and	a5,a5,1
    a63c:	013a8733          	add	a4,s5,s3
    a640:	08d66263          	bltu	a2,a3,a6c4 <_realloc_r+0x214>
    a644:	0137e7b3          	or	a5,a5,s3
    a648:	00faa223          	sw	a5,4(s5)
    a64c:	00472783          	lw	a5,4(a4)
    a650:	0017e793          	or	a5,a5,1
    a654:	00f72223          	sw	a5,4(a4)
    a658:	00090513          	mv	a0,s2
    a65c:	f40f70ef          	jal	1d9c <__malloc_unlock>
    a660:	00040493          	mv	s1,s0
    a664:	02812403          	lw	s0,40(sp)
    a668:	02c12083          	lw	ra,44(sp)
    a66c:	02012903          	lw	s2,32(sp)
    a670:	01c12983          	lw	s3,28(sp)
    a674:	01812a03          	lw	s4,24(sp)
    a678:	01412a83          	lw	s5,20(sp)
    a67c:	00048513          	mv	a0,s1
    a680:	02412483          	lw	s1,36(sp)
    a684:	03010113          	add	sp,sp,48
    a688:	00008067          	ret
    a68c:	00177713          	and	a4,a4,1
    a690:	ee071ae3          	bnez	a4,a584 <_realloc_r+0xd4>
    a694:	01712623          	sw	s7,12(sp)
    a698:	ff842b83          	lw	s7,-8(s0)
    a69c:	01612823          	sw	s6,16(sp)
    a6a0:	417a8bb3          	sub	s7,s5,s7
    a6a4:	004ba703          	lw	a4,4(s7)
    a6a8:	ffc77713          	and	a4,a4,-4
    a6ac:	ec9ff06f          	j	a574 <_realloc_r+0xc4>
    a6b0:	02c12083          	lw	ra,44(sp)
    a6b4:	02412483          	lw	s1,36(sp)
    a6b8:	00060593          	mv	a1,a2
    a6bc:	03010113          	add	sp,sp,48
    a6c0:	ef1f606f          	j	15b0 <_malloc_r>
    a6c4:	0147e7b3          	or	a5,a5,s4
    a6c8:	00faa223          	sw	a5,4(s5)
    a6cc:	014a85b3          	add	a1,s5,s4
    a6d0:	0016e693          	or	a3,a3,1
    a6d4:	00d5a223          	sw	a3,4(a1)
    a6d8:	00472783          	lw	a5,4(a4)
    a6dc:	00858593          	add	a1,a1,8
    a6e0:	00090513          	mv	a0,s2
    a6e4:	0017e793          	or	a5,a5,1
    a6e8:	00f72223          	sw	a5,4(a4)
    a6ec:	bb9f60ef          	jal	12a4 <_free_r>
    a6f0:	f69ff06f          	j	a658 <_realloc_r+0x1a8>
    a6f4:	ffc7f793          	and	a5,a5,-4
    a6f8:	013786b3          	add	a3,a5,s3
    a6fc:	010a0613          	add	a2,s4,16
    a700:	26c6d063          	bge	a3,a2,a960 <_realloc_r+0x4b0>
    a704:	00177713          	and	a4,a4,1
    a708:	e6071ee3          	bnez	a4,a584 <_realloc_r+0xd4>
    a70c:	01712623          	sw	s7,12(sp)
    a710:	ff842b83          	lw	s7,-8(s0)
    a714:	01612823          	sw	s6,16(sp)
    a718:	417a8bb3          	sub	s7,s5,s7
    a71c:	004ba703          	lw	a4,4(s7)
    a720:	ffc77713          	and	a4,a4,-4
    a724:	00e787b3          	add	a5,a5,a4
    a728:	01378b33          	add	s6,a5,s3
    a72c:	e4cb44e3          	blt	s6,a2,a574 <_realloc_r+0xc4>
    a730:	00cba783          	lw	a5,12(s7)
    a734:	008ba703          	lw	a4,8(s7)
    a738:	ffc98613          	add	a2,s3,-4
    a73c:	02400693          	li	a3,36
    a740:	00f72623          	sw	a5,12(a4)
    a744:	00e7a423          	sw	a4,8(a5)
    a748:	008b8493          	add	s1,s7,8
    a74c:	28c6e463          	bltu	a3,a2,a9d4 <_realloc_r+0x524>
    a750:	01300713          	li	a4,19
    a754:	00048793          	mv	a5,s1
    a758:	02c77263          	bgeu	a4,a2,a77c <_realloc_r+0x2cc>
    a75c:	00042703          	lw	a4,0(s0)
    a760:	01b00793          	li	a5,27
    a764:	00eba423          	sw	a4,8(s7)
    a768:	00442703          	lw	a4,4(s0)
    a76c:	00eba623          	sw	a4,12(s7)
    a770:	26c7ea63          	bltu	a5,a2,a9e4 <_realloc_r+0x534>
    a774:	00840413          	add	s0,s0,8
    a778:	010b8793          	add	a5,s7,16
    a77c:	00042703          	lw	a4,0(s0)
    a780:	00e7a023          	sw	a4,0(a5)
    a784:	00442703          	lw	a4,4(s0)
    a788:	00e7a223          	sw	a4,4(a5)
    a78c:	00842703          	lw	a4,8(s0)
    a790:	00e7a423          	sw	a4,8(a5)
    a794:	014b8733          	add	a4,s7,s4
    a798:	414b07b3          	sub	a5,s6,s4
    a79c:	00ec2423          	sw	a4,8(s8)
    a7a0:	0017e793          	or	a5,a5,1
    a7a4:	00f72223          	sw	a5,4(a4)
    a7a8:	004ba783          	lw	a5,4(s7)
    a7ac:	00090513          	mv	a0,s2
    a7b0:	0017f793          	and	a5,a5,1
    a7b4:	0147e7b3          	or	a5,a5,s4
    a7b8:	00fba223          	sw	a5,4(s7)
    a7bc:	de0f70ef          	jal	1d9c <__malloc_unlock>
    a7c0:	01012b03          	lw	s6,16(sp)
    a7c4:	00c12b83          	lw	s7,12(sp)
    a7c8:	00812c03          	lw	s8,8(sp)
    a7cc:	e99ff06f          	j	a664 <_realloc_r+0x1b4>
    a7d0:	00042683          	lw	a3,0(s0)
    a7d4:	01b00713          	li	a4,27
    a7d8:	00d52023          	sw	a3,0(a0)
    a7dc:	00442683          	lw	a3,4(s0)
    a7e0:	00d52223          	sw	a3,4(a0)
    a7e4:	14c76e63          	bltu	a4,a2,a940 <_realloc_r+0x490>
    a7e8:	00840713          	add	a4,s0,8
    a7ec:	00850793          	add	a5,a0,8
    a7f0:	dd9ff06f          	j	a5c8 <_realloc_r+0x118>
    a7f4:	ffc52783          	lw	a5,-4(a0)
    a7f8:	00812c03          	lw	s8,8(sp)
    a7fc:	ffc7f793          	and	a5,a5,-4
    a800:	00f989b3          	add	s3,s3,a5
    a804:	e29ff06f          	j	a62c <_realloc_r+0x17c>
    a808:	00cba783          	lw	a5,12(s7)
    a80c:	008ba703          	lw	a4,8(s7)
    a810:	ffc98613          	add	a2,s3,-4
    a814:	02400693          	li	a3,36
    a818:	00f72623          	sw	a5,12(a4)
    a81c:	00e7a423          	sw	a4,8(a5)
    a820:	008b8493          	add	s1,s7,8
    a824:	10c6e663          	bltu	a3,a2,a930 <_realloc_r+0x480>
    a828:	01300713          	li	a4,19
    a82c:	00048793          	mv	a5,s1
    a830:	02c77c63          	bgeu	a4,a2,a868 <_realloc_r+0x3b8>
    a834:	00042703          	lw	a4,0(s0)
    a838:	01b00793          	li	a5,27
    a83c:	00eba423          	sw	a4,8(s7)
    a840:	00442703          	lw	a4,4(s0)
    a844:	00eba623          	sw	a4,12(s7)
    a848:	14c7f863          	bgeu	a5,a2,a998 <_realloc_r+0x4e8>
    a84c:	00842783          	lw	a5,8(s0)
    a850:	00fba823          	sw	a5,16(s7)
    a854:	00c42783          	lw	a5,12(s0)
    a858:	00fbaa23          	sw	a5,20(s7)
    a85c:	0ad60c63          	beq	a2,a3,a914 <_realloc_r+0x464>
    a860:	01040413          	add	s0,s0,16
    a864:	018b8793          	add	a5,s7,24
    a868:	00042703          	lw	a4,0(s0)
    a86c:	00e7a023          	sw	a4,0(a5)
    a870:	00442703          	lw	a4,4(s0)
    a874:	00e7a223          	sw	a4,4(a5)
    a878:	00842703          	lw	a4,8(s0)
    a87c:	00e7a423          	sw	a4,8(a5)
    a880:	000b0993          	mv	s3,s6
    a884:	000b8a93          	mv	s5,s7
    a888:	01012b03          	lw	s6,16(sp)
    a88c:	00c12b83          	lw	s7,12(sp)
    a890:	00812c03          	lw	s8,8(sp)
    a894:	00048413          	mv	s0,s1
    a898:	d95ff06f          	j	a62c <_realloc_r+0x17c>
    a89c:	00040593          	mv	a1,s0
    a8a0:	ae8fd0ef          	jal	7b88 <memmove>
    a8a4:	d3dff06f          	j	a5e0 <_realloc_r+0x130>
    a8a8:	00c6a783          	lw	a5,12(a3)
    a8ac:	0086a703          	lw	a4,8(a3)
    a8b0:	ffc98613          	add	a2,s3,-4
    a8b4:	02400693          	li	a3,36
    a8b8:	00f72623          	sw	a5,12(a4)
    a8bc:	00e7a423          	sw	a4,8(a5)
    a8c0:	008ba703          	lw	a4,8(s7)
    a8c4:	00cba783          	lw	a5,12(s7)
    a8c8:	008b8493          	add	s1,s7,8
    a8cc:	00f72623          	sw	a5,12(a4)
    a8d0:	00e7a423          	sw	a4,8(a5)
    a8d4:	04c6ee63          	bltu	a3,a2,a930 <_realloc_r+0x480>
    a8d8:	01300713          	li	a4,19
    a8dc:	00048793          	mv	a5,s1
    a8e0:	f8c774e3          	bgeu	a4,a2,a868 <_realloc_r+0x3b8>
    a8e4:	00042703          	lw	a4,0(s0)
    a8e8:	01b00793          	li	a5,27
    a8ec:	00eba423          	sw	a4,8(s7)
    a8f0:	00442703          	lw	a4,4(s0)
    a8f4:	00eba623          	sw	a4,12(s7)
    a8f8:	0ac7f063          	bgeu	a5,a2,a998 <_realloc_r+0x4e8>
    a8fc:	00842703          	lw	a4,8(s0)
    a900:	02400793          	li	a5,36
    a904:	00eba823          	sw	a4,16(s7)
    a908:	00c42703          	lw	a4,12(s0)
    a90c:	00ebaa23          	sw	a4,20(s7)
    a910:	f4f618e3          	bne	a2,a5,a860 <_realloc_r+0x3b0>
    a914:	01042703          	lw	a4,16(s0)
    a918:	020b8793          	add	a5,s7,32
    a91c:	01840413          	add	s0,s0,24
    a920:	00ebac23          	sw	a4,24(s7)
    a924:	ffc42703          	lw	a4,-4(s0)
    a928:	00ebae23          	sw	a4,28(s7)
    a92c:	f3dff06f          	j	a868 <_realloc_r+0x3b8>
    a930:	00040593          	mv	a1,s0
    a934:	00048513          	mv	a0,s1
    a938:	a50fd0ef          	jal	7b88 <memmove>
    a93c:	f45ff06f          	j	a880 <_realloc_r+0x3d0>
    a940:	00842703          	lw	a4,8(s0)
    a944:	00e52423          	sw	a4,8(a0)
    a948:	00c42703          	lw	a4,12(s0)
    a94c:	00e52623          	sw	a4,12(a0)
    a950:	06f60463          	beq	a2,a5,a9b8 <_realloc_r+0x508>
    a954:	01040713          	add	a4,s0,16
    a958:	01050793          	add	a5,a0,16
    a95c:	c6dff06f          	j	a5c8 <_realloc_r+0x118>
    a960:	014a8ab3          	add	s5,s5,s4
    a964:	414687b3          	sub	a5,a3,s4
    a968:	015c2423          	sw	s5,8(s8)
    a96c:	0017e793          	or	a5,a5,1
    a970:	00faa223          	sw	a5,4(s5)
    a974:	ffc42783          	lw	a5,-4(s0)
    a978:	00090513          	mv	a0,s2
    a97c:	00040493          	mv	s1,s0
    a980:	0017f793          	and	a5,a5,1
    a984:	0147e7b3          	or	a5,a5,s4
    a988:	fef42e23          	sw	a5,-4(s0)
    a98c:	c10f70ef          	jal	1d9c <__malloc_unlock>
    a990:	00812c03          	lw	s8,8(sp)
    a994:	cd1ff06f          	j	a664 <_realloc_r+0x1b4>
    a998:	00840413          	add	s0,s0,8
    a99c:	010b8793          	add	a5,s7,16
    a9a0:	ec9ff06f          	j	a868 <_realloc_r+0x3b8>
    a9a4:	00090513          	mv	a0,s2
    a9a8:	bf4f70ef          	jal	1d9c <__malloc_unlock>
    a9ac:	00000493          	li	s1,0
    a9b0:	00812c03          	lw	s8,8(sp)
    a9b4:	cb1ff06f          	j	a664 <_realloc_r+0x1b4>
    a9b8:	01042683          	lw	a3,16(s0)
    a9bc:	01840713          	add	a4,s0,24
    a9c0:	01850793          	add	a5,a0,24
    a9c4:	00d52823          	sw	a3,16(a0)
    a9c8:	01442683          	lw	a3,20(s0)
    a9cc:	00d52a23          	sw	a3,20(a0)
    a9d0:	bf9ff06f          	j	a5c8 <_realloc_r+0x118>
    a9d4:	00040593          	mv	a1,s0
    a9d8:	00048513          	mv	a0,s1
    a9dc:	9acfd0ef          	jal	7b88 <memmove>
    a9e0:	db5ff06f          	j	a794 <_realloc_r+0x2e4>
    a9e4:	00842783          	lw	a5,8(s0)
    a9e8:	00fba823          	sw	a5,16(s7)
    a9ec:	00c42783          	lw	a5,12(s0)
    a9f0:	00fbaa23          	sw	a5,20(s7)
    a9f4:	00d60863          	beq	a2,a3,aa04 <_realloc_r+0x554>
    a9f8:	01040413          	add	s0,s0,16
    a9fc:	018b8793          	add	a5,s7,24
    aa00:	d7dff06f          	j	a77c <_realloc_r+0x2cc>
    aa04:	01042703          	lw	a4,16(s0)
    aa08:	020b8793          	add	a5,s7,32
    aa0c:	01840413          	add	s0,s0,24
    aa10:	00ebac23          	sw	a4,24(s7)
    aa14:	ffc42703          	lw	a4,-4(s0)
    aa18:	00ebae23          	sw	a4,28(s7)
    aa1c:	d61ff06f          	j	a77c <_realloc_r+0x2cc>

0000aa20 <__ascii_wctomb>:
    aa20:	02058463          	beqz	a1,aa48 <__ascii_wctomb+0x28>
    aa24:	0ff00793          	li	a5,255
    aa28:	00c7e863          	bltu	a5,a2,aa38 <__ascii_wctomb+0x18>
    aa2c:	00c58023          	sb	a2,0(a1)
    aa30:	00100513          	li	a0,1
    aa34:	00008067          	ret
    aa38:	08a00793          	li	a5,138
    aa3c:	00f52023          	sw	a5,0(a0)
    aa40:	fff00513          	li	a0,-1
    aa44:	00008067          	ret
    aa48:	00000513          	li	a0,0
    aa4c:	00008067          	ret

0000aa50 <_wcrtomb_r>:
    aa50:	fe010113          	add	sp,sp,-32
    aa54:	00812c23          	sw	s0,24(sp)
    aa58:	00912a23          	sw	s1,20(sp)
    aa5c:	00112e23          	sw	ra,28(sp)
    aa60:	00050493          	mv	s1,a0
    aa64:	10450413          	add	s0,a0,260
    aa68:	00068463          	beqz	a3,aa70 <_wcrtomb_r+0x20>
    aa6c:	00068413          	mv	s0,a3
    aa70:	7fff6797          	auipc	a5,0x7fff6
    aa74:	ba47a783          	lw	a5,-1116(a5) # 80000614 <__global_locale+0xe0>
    aa78:	00040693          	mv	a3,s0
    aa7c:	02058463          	beqz	a1,aaa4 <_wcrtomb_r+0x54>
    aa80:	00048513          	mv	a0,s1
    aa84:	000780e7          	jalr	a5
    aa88:	fff00793          	li	a5,-1
    aa8c:	02f50863          	beq	a0,a5,aabc <_wcrtomb_r+0x6c>
    aa90:	01c12083          	lw	ra,28(sp)
    aa94:	01812403          	lw	s0,24(sp)
    aa98:	01412483          	lw	s1,20(sp)
    aa9c:	02010113          	add	sp,sp,32
    aaa0:	00008067          	ret
    aaa4:	00000613          	li	a2,0
    aaa8:	00410593          	add	a1,sp,4
    aaac:	00048513          	mv	a0,s1
    aab0:	000780e7          	jalr	a5
    aab4:	fff00793          	li	a5,-1
    aab8:	fcf51ce3          	bne	a0,a5,aa90 <_wcrtomb_r+0x40>
    aabc:	00042023          	sw	zero,0(s0)
    aac0:	01c12083          	lw	ra,28(sp)
    aac4:	01812403          	lw	s0,24(sp)
    aac8:	08a00793          	li	a5,138
    aacc:	00f4a023          	sw	a5,0(s1)
    aad0:	01412483          	lw	s1,20(sp)
    aad4:	02010113          	add	sp,sp,32
    aad8:	00008067          	ret

0000aadc <_wcsrtombs_r>:
    aadc:	00070793          	mv	a5,a4
    aae0:	00068713          	mv	a4,a3
    aae4:	fff00693          	li	a3,-1
    aae8:	7a40006f          	j	b28c <_wcsnrtombs_r>

0000aaec <_fclose_r>:
    aaec:	ff010113          	add	sp,sp,-16
    aaf0:	00112623          	sw	ra,12(sp)
    aaf4:	01212023          	sw	s2,0(sp)
    aaf8:	0e058263          	beqz	a1,abdc <_fclose_r+0xf0>
    aafc:	00812423          	sw	s0,8(sp)
    ab00:	00912223          	sw	s1,4(sp)
    ab04:	00058413          	mv	s0,a1
    ab08:	00050493          	mv	s1,a0
    ab0c:	00050663          	beqz	a0,ab18 <_fclose_r+0x2c>
    ab10:	03452783          	lw	a5,52(a0)
    ab14:	10078063          	beqz	a5,ac14 <_fclose_r+0x128>
    ab18:	06442783          	lw	a5,100(s0)
    ab1c:	00c41703          	lh	a4,12(s0)
    ab20:	0017f793          	and	a5,a5,1
    ab24:	0a079663          	bnez	a5,abd0 <_fclose_r+0xe4>
    ab28:	20077713          	and	a4,a4,512
    ab2c:	0e070863          	beqz	a4,ac1c <_fclose_r+0x130>
    ab30:	00040593          	mv	a1,s0
    ab34:	00048513          	mv	a0,s1
    ab38:	9f5fb0ef          	jal	652c <__sflush_r>
    ab3c:	02c42783          	lw	a5,44(s0)
    ab40:	00050913          	mv	s2,a0
    ab44:	00078a63          	beqz	a5,ab58 <_fclose_r+0x6c>
    ab48:	01c42583          	lw	a1,28(s0)
    ab4c:	00048513          	mv	a0,s1
    ab50:	000780e7          	jalr	a5
    ab54:	0a054063          	bltz	a0,abf4 <_fclose_r+0x108>
    ab58:	00c45783          	lhu	a5,12(s0)
    ab5c:	0807f793          	and	a5,a5,128
    ab60:	0a079263          	bnez	a5,ac04 <_fclose_r+0x118>
    ab64:	03042583          	lw	a1,48(s0)
    ab68:	00058c63          	beqz	a1,ab80 <_fclose_r+0x94>
    ab6c:	04040793          	add	a5,s0,64
    ab70:	00f58663          	beq	a1,a5,ab7c <_fclose_r+0x90>
    ab74:	00048513          	mv	a0,s1
    ab78:	f2cf60ef          	jal	12a4 <_free_r>
    ab7c:	02042823          	sw	zero,48(s0)
    ab80:	04442583          	lw	a1,68(s0)
    ab84:	00058863          	beqz	a1,ab94 <_fclose_r+0xa8>
    ab88:	00048513          	mv	a0,s1
    ab8c:	f18f60ef          	jal	12a4 <_free_r>
    ab90:	04042223          	sw	zero,68(s0)
    ab94:	f51fb0ef          	jal	6ae4 <__sfp_lock_acquire>
    ab98:	06442783          	lw	a5,100(s0)
    ab9c:	00041623          	sh	zero,12(s0)
    aba0:	0017f793          	and	a5,a5,1
    aba4:	0a078663          	beqz	a5,ac50 <_fclose_r+0x164>
    aba8:	05842503          	lw	a0,88(s0)
    abac:	a9cf60ef          	jal	e48 <__retarget_lock_close_recursive>
    abb0:	f41fb0ef          	jal	6af0 <__sfp_lock_release>
    abb4:	00c12083          	lw	ra,12(sp)
    abb8:	00812403          	lw	s0,8(sp)
    abbc:	00412483          	lw	s1,4(sp)
    abc0:	00090513          	mv	a0,s2
    abc4:	00012903          	lw	s2,0(sp)
    abc8:	01010113          	add	sp,sp,16
    abcc:	00008067          	ret
    abd0:	f60710e3          	bnez	a4,ab30 <_fclose_r+0x44>
    abd4:	00812403          	lw	s0,8(sp)
    abd8:	00412483          	lw	s1,4(sp)
    abdc:	00000913          	li	s2,0
    abe0:	00c12083          	lw	ra,12(sp)
    abe4:	00090513          	mv	a0,s2
    abe8:	00012903          	lw	s2,0(sp)
    abec:	01010113          	add	sp,sp,16
    abf0:	00008067          	ret
    abf4:	00c45783          	lhu	a5,12(s0)
    abf8:	fff00913          	li	s2,-1
    abfc:	0807f793          	and	a5,a5,128
    ac00:	f60782e3          	beqz	a5,ab64 <_fclose_r+0x78>
    ac04:	01042583          	lw	a1,16(s0)
    ac08:	00048513          	mv	a0,s1
    ac0c:	e98f60ef          	jal	12a4 <_free_r>
    ac10:	f55ff06f          	j	ab64 <_fclose_r+0x78>
    ac14:	e61fb0ef          	jal	6a74 <__sinit>
    ac18:	f01ff06f          	j	ab18 <_fclose_r+0x2c>
    ac1c:	05842503          	lw	a0,88(s0)
    ac20:	a2cf60ef          	jal	e4c <__retarget_lock_acquire_recursive>
    ac24:	00c41783          	lh	a5,12(s0)
    ac28:	f00794e3          	bnez	a5,ab30 <_fclose_r+0x44>
    ac2c:	06442783          	lw	a5,100(s0)
    ac30:	0017f793          	and	a5,a5,1
    ac34:	fa0790e3          	bnez	a5,abd4 <_fclose_r+0xe8>
    ac38:	05842503          	lw	a0,88(s0)
    ac3c:	00000913          	li	s2,0
    ac40:	a10f60ef          	jal	e50 <__retarget_lock_release_recursive>
    ac44:	00812403          	lw	s0,8(sp)
    ac48:	00412483          	lw	s1,4(sp)
    ac4c:	f95ff06f          	j	abe0 <_fclose_r+0xf4>
    ac50:	05842503          	lw	a0,88(s0)
    ac54:	9fcf60ef          	jal	e50 <__retarget_lock_release_recursive>
    ac58:	f51ff06f          	j	aba8 <_fclose_r+0xbc>

0000ac5c <__smakebuf_r>:
    ac5c:	00c59783          	lh	a5,12(a1)
    ac60:	f8010113          	add	sp,sp,-128
    ac64:	06812c23          	sw	s0,120(sp)
    ac68:	06112e23          	sw	ra,124(sp)
    ac6c:	0027f713          	and	a4,a5,2
    ac70:	00058413          	mv	s0,a1
    ac74:	02070463          	beqz	a4,ac9c <__smakebuf_r+0x40>
    ac78:	04358793          	add	a5,a1,67
    ac7c:	00f5a023          	sw	a5,0(a1)
    ac80:	00f5a823          	sw	a5,16(a1)
    ac84:	00100793          	li	a5,1
    ac88:	00f5aa23          	sw	a5,20(a1)
    ac8c:	07c12083          	lw	ra,124(sp)
    ac90:	07812403          	lw	s0,120(sp)
    ac94:	08010113          	add	sp,sp,128
    ac98:	00008067          	ret
    ac9c:	00e59583          	lh	a1,14(a1)
    aca0:	06912a23          	sw	s1,116(sp)
    aca4:	07212823          	sw	s2,112(sp)
    aca8:	07312623          	sw	s3,108(sp)
    acac:	07412423          	sw	s4,104(sp)
    acb0:	00050493          	mv	s1,a0
    acb4:	0805c663          	bltz	a1,ad40 <__smakebuf_r+0xe4>
    acb8:	00810613          	add	a2,sp,8
    acbc:	138000ef          	jal	adf4 <_fstat_r>
    acc0:	06054e63          	bltz	a0,ad3c <__smakebuf_r+0xe0>
    acc4:	00c12783          	lw	a5,12(sp)
    acc8:	0000f937          	lui	s2,0xf
    accc:	000019b7          	lui	s3,0x1
    acd0:	00f97933          	and	s2,s2,a5
    acd4:	ffffe7b7          	lui	a5,0xffffe
    acd8:	00f90933          	add	s2,s2,a5
    acdc:	00193913          	seqz	s2,s2
    ace0:	40000a13          	li	s4,1024
    ace4:	80098993          	add	s3,s3,-2048 # 800 <main+0x530>
    ace8:	000a0593          	mv	a1,s4
    acec:	00048513          	mv	a0,s1
    acf0:	8c1f60ef          	jal	15b0 <_malloc_r>
    acf4:	00c41783          	lh	a5,12(s0)
    acf8:	06050863          	beqz	a0,ad68 <__smakebuf_r+0x10c>
    acfc:	0807e793          	or	a5,a5,128
    ad00:	00a42023          	sw	a0,0(s0)
    ad04:	00a42823          	sw	a0,16(s0)
    ad08:	00f41623          	sh	a5,12(s0)
    ad0c:	01442a23          	sw	s4,20(s0)
    ad10:	0a091063          	bnez	s2,adb0 <__smakebuf_r+0x154>
    ad14:	0137e7b3          	or	a5,a5,s3
    ad18:	07c12083          	lw	ra,124(sp)
    ad1c:	00f41623          	sh	a5,12(s0)
    ad20:	07812403          	lw	s0,120(sp)
    ad24:	07412483          	lw	s1,116(sp)
    ad28:	07012903          	lw	s2,112(sp)
    ad2c:	06c12983          	lw	s3,108(sp)
    ad30:	06812a03          	lw	s4,104(sp)
    ad34:	08010113          	add	sp,sp,128
    ad38:	00008067          	ret
    ad3c:	00c41783          	lh	a5,12(s0)
    ad40:	0807f793          	and	a5,a5,128
    ad44:	00000913          	li	s2,0
    ad48:	04078e63          	beqz	a5,ada4 <__smakebuf_r+0x148>
    ad4c:	04000a13          	li	s4,64
    ad50:	000a0593          	mv	a1,s4
    ad54:	00048513          	mv	a0,s1
    ad58:	859f60ef          	jal	15b0 <_malloc_r>
    ad5c:	00c41783          	lh	a5,12(s0)
    ad60:	00000993          	li	s3,0
    ad64:	f8051ce3          	bnez	a0,acfc <__smakebuf_r+0xa0>
    ad68:	2007f713          	and	a4,a5,512
    ad6c:	04071e63          	bnez	a4,adc8 <__smakebuf_r+0x16c>
    ad70:	ffc7f793          	and	a5,a5,-4
    ad74:	0027e793          	or	a5,a5,2
    ad78:	04340713          	add	a4,s0,67
    ad7c:	00f41623          	sh	a5,12(s0)
    ad80:	00100793          	li	a5,1
    ad84:	07412483          	lw	s1,116(sp)
    ad88:	07012903          	lw	s2,112(sp)
    ad8c:	06c12983          	lw	s3,108(sp)
    ad90:	06812a03          	lw	s4,104(sp)
    ad94:	00e42023          	sw	a4,0(s0)
    ad98:	00e42823          	sw	a4,16(s0)
    ad9c:	00f42a23          	sw	a5,20(s0)
    ada0:	eedff06f          	j	ac8c <__smakebuf_r+0x30>
    ada4:	40000a13          	li	s4,1024
    ada8:	00000993          	li	s3,0
    adac:	f3dff06f          	j	ace8 <__smakebuf_r+0x8c>
    adb0:	00e41583          	lh	a1,14(s0)
    adb4:	00048513          	mv	a0,s1
    adb8:	09c000ef          	jal	ae54 <_isatty_r>
    adbc:	02051063          	bnez	a0,addc <__smakebuf_r+0x180>
    adc0:	00c41783          	lh	a5,12(s0)
    adc4:	f51ff06f          	j	ad14 <__smakebuf_r+0xb8>
    adc8:	07412483          	lw	s1,116(sp)
    adcc:	07012903          	lw	s2,112(sp)
    add0:	06c12983          	lw	s3,108(sp)
    add4:	06812a03          	lw	s4,104(sp)
    add8:	eb5ff06f          	j	ac8c <__smakebuf_r+0x30>
    addc:	00c45783          	lhu	a5,12(s0)
    ade0:	ffc7f793          	and	a5,a5,-4
    ade4:	0017e793          	or	a5,a5,1
    ade8:	01079793          	sll	a5,a5,0x10
    adec:	4107d793          	sra	a5,a5,0x10
    adf0:	f25ff06f          	j	ad14 <__smakebuf_r+0xb8>

0000adf4 <_fstat_r>:
    adf4:	ff010113          	add	sp,sp,-16
    adf8:	00058713          	mv	a4,a1
    adfc:	00812423          	sw	s0,8(sp)
    ae00:	00060593          	mv	a1,a2
    ae04:	00050413          	mv	s0,a0
    ae08:	00070513          	mv	a0,a4
    ae0c:	7fff6797          	auipc	a5,0x7fff6
    ae10:	9007a623          	sw	zero,-1780(a5) # 80000718 <errno>
    ae14:	00112623          	sw	ra,12(sp)
    ae18:	c15f50ef          	jal	a2c <_fstat>
    ae1c:	fff00793          	li	a5,-1
    ae20:	00f50a63          	beq	a0,a5,ae34 <_fstat_r+0x40>
    ae24:	00c12083          	lw	ra,12(sp)
    ae28:	00812403          	lw	s0,8(sp)
    ae2c:	01010113          	add	sp,sp,16
    ae30:	00008067          	ret
    ae34:	7fff6797          	auipc	a5,0x7fff6
    ae38:	8e47a783          	lw	a5,-1820(a5) # 80000718 <errno>
    ae3c:	fe0784e3          	beqz	a5,ae24 <_fstat_r+0x30>
    ae40:	00c12083          	lw	ra,12(sp)
    ae44:	00f42023          	sw	a5,0(s0)
    ae48:	00812403          	lw	s0,8(sp)
    ae4c:	01010113          	add	sp,sp,16
    ae50:	00008067          	ret

0000ae54 <_isatty_r>:
    ae54:	ff010113          	add	sp,sp,-16
    ae58:	00812423          	sw	s0,8(sp)
    ae5c:	00050413          	mv	s0,a0
    ae60:	00058513          	mv	a0,a1
    ae64:	7fff6797          	auipc	a5,0x7fff6
    ae68:	8a07aa23          	sw	zero,-1868(a5) # 80000718 <errno>
    ae6c:	00112623          	sw	ra,12(sp)
    ae70:	bd5f50ef          	jal	a44 <_isatty>
    ae74:	fff00793          	li	a5,-1
    ae78:	00f50a63          	beq	a0,a5,ae8c <_isatty_r+0x38>
    ae7c:	00c12083          	lw	ra,12(sp)
    ae80:	00812403          	lw	s0,8(sp)
    ae84:	01010113          	add	sp,sp,16
    ae88:	00008067          	ret
    ae8c:	7fff6797          	auipc	a5,0x7fff6
    ae90:	88c7a783          	lw	a5,-1908(a5) # 80000718 <errno>
    ae94:	fe0784e3          	beqz	a5,ae7c <_isatty_r+0x28>
    ae98:	00c12083          	lw	ra,12(sp)
    ae9c:	00f42023          	sw	a5,0(s0)
    aea0:	00812403          	lw	s0,8(sp)
    aea4:	01010113          	add	sp,sp,16
    aea8:	00008067          	ret

0000aeac <__errno>:
    aeac:	7fff6517          	auipc	a0,0x7fff6
    aeb0:	85c52503          	lw	a0,-1956(a0) # 80000708 <_impure_ptr>
    aeb4:	00008067          	ret

0000aeb8 <__assert_func>:
    aeb8:	ff010113          	add	sp,sp,-16
    aebc:	00068793          	mv	a5,a3
    aec0:	7fff6717          	auipc	a4,0x7fff6
    aec4:	84872703          	lw	a4,-1976(a4) # 80000708 <_impure_ptr>
    aec8:	00060813          	mv	a6,a2
    aecc:	00112623          	sw	ra,12(sp)
    aed0:	00c72883          	lw	a7,12(a4)
    aed4:	00078613          	mv	a2,a5
    aed8:	00050693          	mv	a3,a0
    aedc:	00058713          	mv	a4,a1
    aee0:	00004797          	auipc	a5,0x4
    aee4:	25c78793          	add	a5,a5,604 # f13c <__fini_array_end+0x344>
    aee8:	00080c63          	beqz	a6,af00 <__assert_func+0x48>
    aeec:	00004597          	auipc	a1,0x4
    aef0:	26058593          	add	a1,a1,608 # f14c <__fini_array_end+0x354>
    aef4:	00088513          	mv	a0,a7
    aef8:	3a8000ef          	jal	b2a0 <fiprintf>
    aefc:	3f0000ef          	jal	b2ec <abort>
    af00:	00004797          	auipc	a5,0x4
    af04:	f5878793          	add	a5,a5,-168 # ee58 <__fini_array_end+0x60>
    af08:	00078813          	mv	a6,a5
    af0c:	fe1ff06f          	j	aeec <__assert_func+0x34>

0000af10 <_calloc_r>:
    af10:	fe010113          	add	sp,sp,-32
    af14:	00812c23          	sw	s0,24(sp)
    af18:	00112e23          	sw	ra,28(sp)
    af1c:	0105d693          	srl	a3,a1,0x10
    af20:	00058793          	mv	a5,a1
    af24:	00050413          	mv	s0,a0
    af28:	01065713          	srl	a4,a2,0x10
    af2c:	0c069063          	bnez	a3,afec <_calloc_r+0xdc>
    af30:	14071a63          	bnez	a4,b084 <_calloc_r+0x174>
    af34:	01061593          	sll	a1,a2,0x10
    af38:	01079513          	sll	a0,a5,0x10
    af3c:	0105d593          	srl	a1,a1,0x10
    af40:	01055513          	srl	a0,a0,0x10
    af44:	4bd030ef          	jal	ec00 <__mulsi3>
    af48:	00050593          	mv	a1,a0
    af4c:	00040513          	mv	a0,s0
    af50:	e60f60ef          	jal	15b0 <_malloc_r>
    af54:	00050413          	mv	s0,a0
    af58:	10050a63          	beqz	a0,b06c <_calloc_r+0x15c>
    af5c:	ffc52603          	lw	a2,-4(a0)
    af60:	02400713          	li	a4,36
    af64:	ffc67613          	and	a2,a2,-4
    af68:	ffc60613          	add	a2,a2,-4
    af6c:	04c76863          	bltu	a4,a2,afbc <_calloc_r+0xac>
    af70:	01300693          	li	a3,19
    af74:	00050793          	mv	a5,a0
    af78:	02c6f263          	bgeu	a3,a2,af9c <_calloc_r+0x8c>
    af7c:	00052023          	sw	zero,0(a0)
    af80:	00052223          	sw	zero,4(a0)
    af84:	01b00793          	li	a5,27
    af88:	04c7f863          	bgeu	a5,a2,afd8 <_calloc_r+0xc8>
    af8c:	00052423          	sw	zero,8(a0)
    af90:	00052623          	sw	zero,12(a0)
    af94:	01050793          	add	a5,a0,16
    af98:	10e60263          	beq	a2,a4,b09c <_calloc_r+0x18c>
    af9c:	0007a023          	sw	zero,0(a5)
    afa0:	0007a223          	sw	zero,4(a5)
    afa4:	0007a423          	sw	zero,8(a5)
    afa8:	01c12083          	lw	ra,28(sp)
    afac:	00040513          	mv	a0,s0
    afb0:	01812403          	lw	s0,24(sp)
    afb4:	02010113          	add	sp,sp,32
    afb8:	00008067          	ret
    afbc:	00000593          	li	a1,0
    afc0:	e95f50ef          	jal	e54 <memset>
    afc4:	01c12083          	lw	ra,28(sp)
    afc8:	00040513          	mv	a0,s0
    afcc:	01812403          	lw	s0,24(sp)
    afd0:	02010113          	add	sp,sp,32
    afd4:	00008067          	ret
    afd8:	00850793          	add	a5,a0,8
    afdc:	0007a023          	sw	zero,0(a5)
    afe0:	0007a223          	sw	zero,4(a5)
    afe4:	0007a423          	sw	zero,8(a5)
    afe8:	fc1ff06f          	j	afa8 <_calloc_r+0x98>
    afec:	0c071663          	bnez	a4,b0b8 <_calloc_r+0x1a8>
    aff0:	01212823          	sw	s2,16(sp)
    aff4:	01312623          	sw	s3,12(sp)
    aff8:	00912a23          	sw	s1,20(sp)
    affc:	00068913          	mv	s2,a3
    b000:	00060993          	mv	s3,a2
    b004:	01079513          	sll	a0,a5,0x10
    b008:	01061593          	sll	a1,a2,0x10
    b00c:	0105d593          	srl	a1,a1,0x10
    b010:	01055513          	srl	a0,a0,0x10
    b014:	3ed030ef          	jal	ec00 <__mulsi3>
    b018:	00050493          	mv	s1,a0
    b01c:	01091593          	sll	a1,s2,0x10
    b020:	01099513          	sll	a0,s3,0x10
    b024:	0105d593          	srl	a1,a1,0x10
    b028:	01055513          	srl	a0,a0,0x10
    b02c:	3d5030ef          	jal	ec00 <__mulsi3>
    b030:	0104d793          	srl	a5,s1,0x10
    b034:	00f505b3          	add	a1,a0,a5
    b038:	0105d793          	srl	a5,a1,0x10
    b03c:	06079863          	bnez	a5,b0ac <_calloc_r+0x19c>
    b040:	01049493          	sll	s1,s1,0x10
    b044:	0104d493          	srl	s1,s1,0x10
    b048:	01059593          	sll	a1,a1,0x10
    b04c:	0095e5b3          	or	a1,a1,s1
    b050:	00040513          	mv	a0,s0
    b054:	01412483          	lw	s1,20(sp)
    b058:	01012903          	lw	s2,16(sp)
    b05c:	00c12983          	lw	s3,12(sp)
    b060:	d50f60ef          	jal	15b0 <_malloc_r>
    b064:	00050413          	mv	s0,a0
    b068:	ee051ae3          	bnez	a0,af5c <_calloc_r+0x4c>
    b06c:	00000413          	li	s0,0
    b070:	01c12083          	lw	ra,28(sp)
    b074:	00040513          	mv	a0,s0
    b078:	01812403          	lw	s0,24(sp)
    b07c:	02010113          	add	sp,sp,32
    b080:	00008067          	ret
    b084:	01212823          	sw	s2,16(sp)
    b088:	01312623          	sw	s3,12(sp)
    b08c:	00912a23          	sw	s1,20(sp)
    b090:	00070913          	mv	s2,a4
    b094:	00058993          	mv	s3,a1
    b098:	f6dff06f          	j	b004 <_calloc_r+0xf4>
    b09c:	00052823          	sw	zero,16(a0)
    b0a0:	01850793          	add	a5,a0,24
    b0a4:	00052a23          	sw	zero,20(a0)
    b0a8:	ef5ff06f          	j	af9c <_calloc_r+0x8c>
    b0ac:	01412483          	lw	s1,20(sp)
    b0b0:	01012903          	lw	s2,16(sp)
    b0b4:	00c12983          	lw	s3,12(sp)
    b0b8:	df5ff0ef          	jal	aeac <__errno>
    b0bc:	00c00793          	li	a5,12
    b0c0:	00f52023          	sw	a5,0(a0)
    b0c4:	00000413          	li	s0,0
    b0c8:	fa9ff06f          	j	b070 <_calloc_r+0x160>

0000b0cc <_wcsnrtombs_l>:
    b0cc:	fa010113          	add	sp,sp,-96
    b0d0:	04912a23          	sw	s1,84(sp)
    b0d4:	05212823          	sw	s2,80(sp)
    b0d8:	05312623          	sw	s3,76(sp)
    b0dc:	05412423          	sw	s4,72(sp)
    b0e0:	05512223          	sw	s5,68(sp)
    b0e4:	04112e23          	sw	ra,92(sp)
    b0e8:	03912a23          	sw	s9,52(sp)
    b0ec:	03a12823          	sw	s10,48(sp)
    b0f0:	00a12623          	sw	a0,12(sp)
    b0f4:	00058a13          	mv	s4,a1
    b0f8:	00060a93          	mv	s5,a2
    b0fc:	00070913          	mv	s2,a4
    b100:	00080993          	mv	s3,a6
    b104:	00078493          	mv	s1,a5
    b108:	12078063          	beqz	a5,b228 <_wcsnrtombs_l+0x15c>
    b10c:	000aac83          	lw	s9,0(s5)
    b110:	120a0263          	beqz	s4,b234 <_wcsnrtombs_l+0x168>
    b114:	14090e63          	beqz	s2,b270 <_wcsnrtombs_l+0x1a4>
    b118:	05612023          	sw	s6,64(sp)
    b11c:	fff68b13          	add	s6,a3,-1
    b120:	16068063          	beqz	a3,b280 <_wcsnrtombs_l+0x1b4>
    b124:	04812c23          	sw	s0,88(sp)
    b128:	03b12623          	sw	s11,44(sp)
    b12c:	03712e23          	sw	s7,60(sp)
    b130:	03812c23          	sw	s8,56(sp)
    b134:	000a0413          	mv	s0,s4
    b138:	00000d13          	li	s10,0
    b13c:	fff00d93          	li	s11,-1
    b140:	0240006f          	j	b164 <_wcsnrtombs_l+0x98>
    b144:	080a1a63          	bnez	s4,b1d8 <_wcsnrtombs_l+0x10c>
    b148:	000ca783          	lw	a5,0(s9)
    b14c:	004c8c93          	add	s9,s9,4
    b150:	0c078263          	beqz	a5,b214 <_wcsnrtombs_l+0x148>
    b154:	1326f263          	bgeu	a3,s2,b278 <_wcsnrtombs_l+0x1ac>
    b158:	fffb0b13          	add	s6,s6,-1
    b15c:	00068d13          	mv	s10,a3
    b160:	03bb0c63          	beq	s6,s11,b198 <_wcsnrtombs_l+0xcc>
    b164:	0e09a783          	lw	a5,224(s3)
    b168:	000ca603          	lw	a2,0(s9)
    b16c:	00c12503          	lw	a0,12(sp)
    b170:	00048693          	mv	a3,s1
    b174:	01410593          	add	a1,sp,20
    b178:	0004ac03          	lw	s8,0(s1)
    b17c:	0044ab83          	lw	s7,4(s1)
    b180:	000780e7          	jalr	a5
    b184:	0bb50e63          	beq	a0,s11,b240 <_wcsnrtombs_l+0x174>
    b188:	01a506b3          	add	a3,a0,s10
    b18c:	fad97ce3          	bgeu	s2,a3,b144 <_wcsnrtombs_l+0x78>
    b190:	0184a023          	sw	s8,0(s1)
    b194:	0174a223          	sw	s7,4(s1)
    b198:	05812403          	lw	s0,88(sp)
    b19c:	04012b03          	lw	s6,64(sp)
    b1a0:	03c12b83          	lw	s7,60(sp)
    b1a4:	03812c03          	lw	s8,56(sp)
    b1a8:	02c12d83          	lw	s11,44(sp)
    b1ac:	05c12083          	lw	ra,92(sp)
    b1b0:	05412483          	lw	s1,84(sp)
    b1b4:	05012903          	lw	s2,80(sp)
    b1b8:	04c12983          	lw	s3,76(sp)
    b1bc:	04812a03          	lw	s4,72(sp)
    b1c0:	04412a83          	lw	s5,68(sp)
    b1c4:	03412c83          	lw	s9,52(sp)
    b1c8:	000d0513          	mv	a0,s10
    b1cc:	03012d03          	lw	s10,48(sp)
    b1d0:	06010113          	add	sp,sp,96
    b1d4:	00008067          	ret
    b1d8:	08a05063          	blez	a0,b258 <_wcsnrtombs_l+0x18c>
    b1dc:	01410893          	add	a7,sp,20
    b1e0:	00a40533          	add	a0,s0,a0
    b1e4:	0008c783          	lbu	a5,0(a7)
    b1e8:	00140413          	add	s0,s0,1
    b1ec:	00188893          	add	a7,a7,1
    b1f0:	fef40fa3          	sb	a5,-1(s0)
    b1f4:	fe8518e3          	bne	a0,s0,b1e4 <_wcsnrtombs_l+0x118>
    b1f8:	000aa783          	lw	a5,0(s5)
    b1fc:	00050413          	mv	s0,a0
    b200:	00478793          	add	a5,a5,4
    b204:	00faa023          	sw	a5,0(s5)
    b208:	000ca783          	lw	a5,0(s9)
    b20c:	004c8c93          	add	s9,s9,4
    b210:	f40792e3          	bnez	a5,b154 <_wcsnrtombs_l+0x88>
    b214:	000a0463          	beqz	s4,b21c <_wcsnrtombs_l+0x150>
    b218:	000aa023          	sw	zero,0(s5)
    b21c:	0004a023          	sw	zero,0(s1)
    b220:	fff68d13          	add	s10,a3,-1
    b224:	f75ff06f          	j	b198 <_wcsnrtombs_l+0xcc>
    b228:	000aac83          	lw	s9,0(s5)
    b22c:	10c50493          	add	s1,a0,268
    b230:	ee0a12e3          	bnez	s4,b114 <_wcsnrtombs_l+0x48>
    b234:	05612023          	sw	s6,64(sp)
    b238:	fff00913          	li	s2,-1
    b23c:	ee1ff06f          	j	b11c <_wcsnrtombs_l+0x50>
    b240:	00c12703          	lw	a4,12(sp)
    b244:	08a00793          	li	a5,138
    b248:	fff00d13          	li	s10,-1
    b24c:	00f72023          	sw	a5,0(a4)
    b250:	0004a023          	sw	zero,0(s1)
    b254:	f45ff06f          	j	b198 <_wcsnrtombs_l+0xcc>
    b258:	000aa783          	lw	a5,0(s5)
    b25c:	00040513          	mv	a0,s0
    b260:	00050413          	mv	s0,a0
    b264:	00478793          	add	a5,a5,4
    b268:	00faa023          	sw	a5,0(s5)
    b26c:	f9dff06f          	j	b208 <_wcsnrtombs_l+0x13c>
    b270:	00000d13          	li	s10,0
    b274:	f39ff06f          	j	b1ac <_wcsnrtombs_l+0xe0>
    b278:	00068d13          	mv	s10,a3
    b27c:	f1dff06f          	j	b198 <_wcsnrtombs_l+0xcc>
    b280:	04012b03          	lw	s6,64(sp)
    b284:	00000d13          	li	s10,0
    b288:	f25ff06f          	j	b1ac <_wcsnrtombs_l+0xe0>

0000b28c <_wcsnrtombs_r>:
    b28c:	7fff5817          	auipc	a6,0x7fff5
    b290:	2a880813          	add	a6,a6,680 # 80000534 <__global_locale>
    b294:	7fff5517          	auipc	a0,0x7fff5
    b298:	47452503          	lw	a0,1140(a0) # 80000708 <_impure_ptr>
    b29c:	e31ff06f          	j	b0cc <_wcsnrtombs_l>

0000b2a0 <fiprintf>:
    b2a0:	fc010113          	add	sp,sp,-64
    b2a4:	02810313          	add	t1,sp,40
    b2a8:	02c12423          	sw	a2,40(sp)
    b2ac:	02d12623          	sw	a3,44(sp)
    b2b0:	00058613          	mv	a2,a1
    b2b4:	00030693          	mv	a3,t1
    b2b8:	00050593          	mv	a1,a0
    b2bc:	7fff5517          	auipc	a0,0x7fff5
    b2c0:	44c52503          	lw	a0,1100(a0) # 80000708 <_impure_ptr>
    b2c4:	00112e23          	sw	ra,28(sp)
    b2c8:	02e12823          	sw	a4,48(sp)
    b2cc:	02f12a23          	sw	a5,52(sp)
    b2d0:	03012c23          	sw	a6,56(sp)
    b2d4:	03112e23          	sw	a7,60(sp)
    b2d8:	00612623          	sw	t1,12(sp)
    b2dc:	9a1f90ef          	jal	4c7c <_vfiprintf_r>
    b2e0:	01c12083          	lw	ra,28(sp)
    b2e4:	04010113          	add	sp,sp,64
    b2e8:	00008067          	ret

0000b2ec <abort>:
    b2ec:	ff010113          	add	sp,sp,-16
    b2f0:	00600513          	li	a0,6
    b2f4:	00112623          	sw	ra,12(sp)
    b2f8:	00c000ef          	jal	b304 <raise>
    b2fc:	00100513          	li	a0,1
    b300:	f14f50ef          	jal	a14 <_exit>

0000b304 <raise>:
    b304:	ff010113          	add	sp,sp,-16
    b308:	00912223          	sw	s1,4(sp)
    b30c:	00112623          	sw	ra,12(sp)
    b310:	01f00793          	li	a5,31
    b314:	7fff5497          	auipc	s1,0x7fff5
    b318:	3f44a483          	lw	s1,1012(s1) # 80000708 <_impure_ptr>
    b31c:	08a7ee63          	bltu	a5,a0,b3b8 <raise+0xb4>
    b320:	1184a783          	lw	a5,280(s1)
    b324:	00812423          	sw	s0,8(sp)
    b328:	00050413          	mv	s0,a0
    b32c:	04078263          	beqz	a5,b370 <raise+0x6c>
    b330:	00251713          	sll	a4,a0,0x2
    b334:	00e787b3          	add	a5,a5,a4
    b338:	0007a703          	lw	a4,0(a5)
    b33c:	02070a63          	beqz	a4,b370 <raise+0x6c>
    b340:	00100693          	li	a3,1
    b344:	00d70a63          	beq	a4,a3,b358 <raise+0x54>
    b348:	fff00693          	li	a3,-1
    b34c:	04d70663          	beq	a4,a3,b398 <raise+0x94>
    b350:	0007a023          	sw	zero,0(a5)
    b354:	000700e7          	jalr	a4
    b358:	00812403          	lw	s0,8(sp)
    b35c:	00000513          	li	a0,0
    b360:	00c12083          	lw	ra,12(sp)
    b364:	00412483          	lw	s1,4(sp)
    b368:	01010113          	add	sp,sp,16
    b36c:	00008067          	ret
    b370:	00048513          	mv	a0,s1
    b374:	0b4000ef          	jal	b428 <_getpid_r>
    b378:	00040613          	mv	a2,s0
    b37c:	00812403          	lw	s0,8(sp)
    b380:	00c12083          	lw	ra,12(sp)
    b384:	00050593          	mv	a1,a0
    b388:	00048513          	mv	a0,s1
    b38c:	00412483          	lw	s1,4(sp)
    b390:	01010113          	add	sp,sp,16
    b394:	0340006f          	j	b3c8 <_kill_r>
    b398:	00812403          	lw	s0,8(sp)
    b39c:	00c12083          	lw	ra,12(sp)
    b3a0:	01600793          	li	a5,22
    b3a4:	00f4a023          	sw	a5,0(s1)
    b3a8:	00100513          	li	a0,1
    b3ac:	00412483          	lw	s1,4(sp)
    b3b0:	01010113          	add	sp,sp,16
    b3b4:	00008067          	ret
    b3b8:	01600793          	li	a5,22
    b3bc:	00f4a023          	sw	a5,0(s1)
    b3c0:	fff00513          	li	a0,-1
    b3c4:	f9dff06f          	j	b360 <raise+0x5c>

0000b3c8 <_kill_r>:
    b3c8:	ff010113          	add	sp,sp,-16
    b3cc:	00058713          	mv	a4,a1
    b3d0:	00812423          	sw	s0,8(sp)
    b3d4:	00060593          	mv	a1,a2
    b3d8:	00050413          	mv	s0,a0
    b3dc:	00070513          	mv	a0,a4
    b3e0:	7fff5797          	auipc	a5,0x7fff5
    b3e4:	3207ac23          	sw	zero,824(a5) # 80000718 <errno>
    b3e8:	00112623          	sw	ra,12(sp)
    b3ec:	e60f50ef          	jal	a4c <_kill>
    b3f0:	fff00793          	li	a5,-1
    b3f4:	00f50a63          	beq	a0,a5,b408 <_kill_r+0x40>
    b3f8:	00c12083          	lw	ra,12(sp)
    b3fc:	00812403          	lw	s0,8(sp)
    b400:	01010113          	add	sp,sp,16
    b404:	00008067          	ret
    b408:	7fff5797          	auipc	a5,0x7fff5
    b40c:	3107a783          	lw	a5,784(a5) # 80000718 <errno>
    b410:	fe0784e3          	beqz	a5,b3f8 <_kill_r+0x30>
    b414:	00c12083          	lw	ra,12(sp)
    b418:	00f42023          	sw	a5,0(s0)
    b41c:	00812403          	lw	s0,8(sp)
    b420:	01010113          	add	sp,sp,16
    b424:	00008067          	ret

0000b428 <_getpid_r>:
    b428:	e14f506f          	j	a3c <_getpid>

0000b42c <__udivdi3>:
    b42c:	fd010113          	add	sp,sp,-48
    b430:	01312e23          	sw	s3,28(sp)
    b434:	02112623          	sw	ra,44(sp)
    b438:	01612823          	sw	s6,16(sp)
    b43c:	00050993          	mv	s3,a0
    b440:	16069663          	bnez	a3,b5ac <__udivdi3+0x180>
    b444:	02812423          	sw	s0,40(sp)
    b448:	01512a23          	sw	s5,20(sp)
    b44c:	02912223          	sw	s1,36(sp)
    b450:	03212023          	sw	s2,32(sp)
    b454:	01412c23          	sw	s4,24(sp)
    b458:	00060a93          	mv	s5,a2
    b45c:	00050413          	mv	s0,a0
    b460:	1cc5f063          	bgeu	a1,a2,b620 <__udivdi3+0x1f4>
    b464:	000107b7          	lui	a5,0x10
    b468:	00058493          	mv	s1,a1
    b46c:	2af66e63          	bltu	a2,a5,b728 <__udivdi3+0x2fc>
    b470:	010007b7          	lui	a5,0x1000
    b474:	01800713          	li	a4,24
    b478:	00f67463          	bgeu	a2,a5,b480 <__udivdi3+0x54>
    b47c:	01000713          	li	a4,16
    b480:	00e656b3          	srl	a3,a2,a4
    b484:	00004797          	auipc	a5,0x4
    b488:	2ec78793          	add	a5,a5,748 # f770 <__clz_tab>
    b48c:	00d787b3          	add	a5,a5,a3
    b490:	0007c783          	lbu	a5,0(a5)
    b494:	02000693          	li	a3,32
    b498:	00e787b3          	add	a5,a5,a4
    b49c:	40f68733          	sub	a4,a3,a5
    b4a0:	00f68c63          	beq	a3,a5,b4b8 <__udivdi3+0x8c>
    b4a4:	00e594b3          	sll	s1,a1,a4
    b4a8:	00f9d7b3          	srl	a5,s3,a5
    b4ac:	00e61ab3          	sll	s5,a2,a4
    b4b0:	0097e4b3          	or	s1,a5,s1
    b4b4:	00e99433          	sll	s0,s3,a4
    b4b8:	010ada13          	srl	s4,s5,0x10
    b4bc:	000a0593          	mv	a1,s4
    b4c0:	00048513          	mv	a0,s1
    b4c4:	010a9b13          	sll	s6,s5,0x10
    b4c8:	7fc030ef          	jal	ecc4 <__hidden___udivsi3>
    b4cc:	010b5b13          	srl	s6,s6,0x10
    b4d0:	00050593          	mv	a1,a0
    b4d4:	00050913          	mv	s2,a0
    b4d8:	000b0513          	mv	a0,s6
    b4dc:	724030ef          	jal	ec00 <__mulsi3>
    b4e0:	00050793          	mv	a5,a0
    b4e4:	000a0593          	mv	a1,s4
    b4e8:	00048513          	mv	a0,s1
    b4ec:	00078493          	mv	s1,a5
    b4f0:	01d030ef          	jal	ed0c <__umodsi3>
    b4f4:	01051513          	sll	a0,a0,0x10
    b4f8:	01045793          	srl	a5,s0,0x10
    b4fc:	00a7e7b3          	or	a5,a5,a0
    b500:	0097fc63          	bgeu	a5,s1,b518 <__udivdi3+0xec>
    b504:	00fa87b3          	add	a5,s5,a5
    b508:	fff90713          	add	a4,s2,-1 # efff <__fini_array_end+0x207>
    b50c:	0157e463          	bltu	a5,s5,b514 <__udivdi3+0xe8>
    b510:	5a97e863          	bltu	a5,s1,bac0 <__udivdi3+0x694>
    b514:	00070913          	mv	s2,a4
    b518:	409784b3          	sub	s1,a5,s1
    b51c:	000a0593          	mv	a1,s4
    b520:	00048513          	mv	a0,s1
    b524:	7a0030ef          	jal	ecc4 <__hidden___udivsi3>
    b528:	00050593          	mv	a1,a0
    b52c:	00050993          	mv	s3,a0
    b530:	000b0513          	mv	a0,s6
    b534:	6cc030ef          	jal	ec00 <__mulsi3>
    b538:	00050793          	mv	a5,a0
    b53c:	000a0593          	mv	a1,s4
    b540:	00048513          	mv	a0,s1
    b544:	01041413          	sll	s0,s0,0x10
    b548:	00078493          	mv	s1,a5
    b54c:	7c0030ef          	jal	ed0c <__umodsi3>
    b550:	01051513          	sll	a0,a0,0x10
    b554:	01045413          	srl	s0,s0,0x10
    b558:	00a46433          	or	s0,s0,a0
    b55c:	00947c63          	bgeu	s0,s1,b574 <__udivdi3+0x148>
    b560:	008a8433          	add	s0,s5,s0
    b564:	fff98793          	add	a5,s3,-1
    b568:	4d546e63          	bltu	s0,s5,ba44 <__udivdi3+0x618>
    b56c:	ffe98993          	add	s3,s3,-2
    b570:	4c947a63          	bgeu	s0,s1,ba44 <__udivdi3+0x618>
    b574:	01091613          	sll	a2,s2,0x10
    b578:	01366533          	or	a0,a2,s3
    b57c:	00000b13          	li	s6,0
    b580:	02812403          	lw	s0,40(sp)
    b584:	02c12083          	lw	ra,44(sp)
    b588:	02412483          	lw	s1,36(sp)
    b58c:	02012903          	lw	s2,32(sp)
    b590:	01812a03          	lw	s4,24(sp)
    b594:	01412a83          	lw	s5,20(sp)
    b598:	01c12983          	lw	s3,28(sp)
    b59c:	000b0593          	mv	a1,s6
    b5a0:	01012b03          	lw	s6,16(sp)
    b5a4:	03010113          	add	sp,sp,48
    b5a8:	00008067          	ret
    b5ac:	02d5f263          	bgeu	a1,a3,b5d0 <__udivdi3+0x1a4>
    b5b0:	00000b13          	li	s6,0
    b5b4:	00000513          	li	a0,0
    b5b8:	02c12083          	lw	ra,44(sp)
    b5bc:	01c12983          	lw	s3,28(sp)
    b5c0:	000b0593          	mv	a1,s6
    b5c4:	01012b03          	lw	s6,16(sp)
    b5c8:	03010113          	add	sp,sp,48
    b5cc:	00008067          	ret
    b5d0:	000107b7          	lui	a5,0x10
    b5d4:	26f6ee63          	bltu	a3,a5,b850 <__udivdi3+0x424>
    b5d8:	01000737          	lui	a4,0x1000
    b5dc:	01800793          	li	a5,24
    b5e0:	00e6f463          	bgeu	a3,a4,b5e8 <__udivdi3+0x1bc>
    b5e4:	01000793          	li	a5,16
    b5e8:	00f6d533          	srl	a0,a3,a5
    b5ec:	00004717          	auipc	a4,0x4
    b5f0:	18470713          	add	a4,a4,388 # f770 <__clz_tab>
    b5f4:	00a70733          	add	a4,a4,a0
    b5f8:	00074703          	lbu	a4,0(a4)
    b5fc:	02000513          	li	a0,32
    b600:	00f70733          	add	a4,a4,a5
    b604:	40e50b33          	sub	s6,a0,a4
    b608:	26e51c63          	bne	a0,a4,b880 <__udivdi3+0x454>
    b60c:	46b6ee63          	bltu	a3,a1,ba88 <__udivdi3+0x65c>
    b610:	00c9b533          	sltu	a0,s3,a2
    b614:	00153513          	seqz	a0,a0
    b618:	00000b13          	li	s6,0
    b61c:	f9dff06f          	j	b5b8 <__udivdi3+0x18c>
    b620:	10060c63          	beqz	a2,b738 <__udivdi3+0x30c>
    b624:	000107b7          	lui	a5,0x10
    b628:	44f67663          	bgeu	a2,a5,ba74 <__udivdi3+0x648>
    b62c:	10063713          	sltiu	a4,a2,256
    b630:	00173713          	seqz	a4,a4
    b634:	00371713          	sll	a4,a4,0x3
    b638:	00e656b3          	srl	a3,a2,a4
    b63c:	00004797          	auipc	a5,0x4
    b640:	13478793          	add	a5,a5,308 # f770 <__clz_tab>
    b644:	00d787b3          	add	a5,a5,a3
    b648:	0007c483          	lbu	s1,0(a5)
    b64c:	02000793          	li	a5,32
    b650:	00e484b3          	add	s1,s1,a4
    b654:	40978733          	sub	a4,a5,s1
    b658:	10979463          	bne	a5,s1,b760 <__udivdi3+0x334>
    b65c:	01061a13          	sll	s4,a2,0x10
    b660:	40c584b3          	sub	s1,a1,a2
    b664:	01065913          	srl	s2,a2,0x10
    b668:	010a5a13          	srl	s4,s4,0x10
    b66c:	00100b13          	li	s6,1
    b670:	00090593          	mv	a1,s2
    b674:	00048513          	mv	a0,s1
    b678:	64c030ef          	jal	ecc4 <__hidden___udivsi3>
    b67c:	000a0593          	mv	a1,s4
    b680:	00050993          	mv	s3,a0
    b684:	57c030ef          	jal	ec00 <__mulsi3>
    b688:	00050793          	mv	a5,a0
    b68c:	00090593          	mv	a1,s2
    b690:	00048513          	mv	a0,s1
    b694:	00078493          	mv	s1,a5
    b698:	674030ef          	jal	ed0c <__umodsi3>
    b69c:	01051513          	sll	a0,a0,0x10
    b6a0:	01045793          	srl	a5,s0,0x10
    b6a4:	00a7e7b3          	or	a5,a5,a0
    b6a8:	0097fc63          	bgeu	a5,s1,b6c0 <__udivdi3+0x294>
    b6ac:	00fa87b3          	add	a5,s5,a5
    b6b0:	fff98713          	add	a4,s3,-1
    b6b4:	0157e463          	bltu	a5,s5,b6bc <__udivdi3+0x290>
    b6b8:	3e97ee63          	bltu	a5,s1,bab4 <__udivdi3+0x688>
    b6bc:	00070993          	mv	s3,a4
    b6c0:	409784b3          	sub	s1,a5,s1
    b6c4:	00090593          	mv	a1,s2
    b6c8:	00048513          	mv	a0,s1
    b6cc:	5f8030ef          	jal	ecc4 <__hidden___udivsi3>
    b6d0:	000a0593          	mv	a1,s4
    b6d4:	00050a13          	mv	s4,a0
    b6d8:	528030ef          	jal	ec00 <__mulsi3>
    b6dc:	00050793          	mv	a5,a0
    b6e0:	00090593          	mv	a1,s2
    b6e4:	00048513          	mv	a0,s1
    b6e8:	01041413          	sll	s0,s0,0x10
    b6ec:	00078493          	mv	s1,a5
    b6f0:	61c030ef          	jal	ed0c <__umodsi3>
    b6f4:	01051513          	sll	a0,a0,0x10
    b6f8:	01045413          	srl	s0,s0,0x10
    b6fc:	00a46433          	or	s0,s0,a0
    b700:	00947e63          	bgeu	s0,s1,b71c <__udivdi3+0x2f0>
    b704:	008a8433          	add	s0,s5,s0
    b708:	fffa0793          	add	a5,s4,-1
    b70c:	01546663          	bltu	s0,s5,b718 <__udivdi3+0x2ec>
    b710:	ffea0a13          	add	s4,s4,-2
    b714:	00946463          	bltu	s0,s1,b71c <__udivdi3+0x2f0>
    b718:	00078a13          	mv	s4,a5
    b71c:	01099613          	sll	a2,s3,0x10
    b720:	01466533          	or	a0,a2,s4
    b724:	e5dff06f          	j	b580 <__udivdi3+0x154>
    b728:	10063713          	sltiu	a4,a2,256
    b72c:	00173713          	seqz	a4,a4
    b730:	00371713          	sll	a4,a4,0x3
    b734:	d4dff06f          	j	b480 <__udivdi3+0x54>
    b738:	00000693          	li	a3,0
    b73c:	00004797          	auipc	a5,0x4
    b740:	03478793          	add	a5,a5,52 # f770 <__clz_tab>
    b744:	00d787b3          	add	a5,a5,a3
    b748:	0007c483          	lbu	s1,0(a5)
    b74c:	00000713          	li	a4,0
    b750:	02000793          	li	a5,32
    b754:	00e484b3          	add	s1,s1,a4
    b758:	40978733          	sub	a4,a5,s1
    b75c:	f09780e3          	beq	a5,s1,b65c <__udivdi3+0x230>
    b760:	00e61ab3          	sll	s5,a2,a4
    b764:	01712623          	sw	s7,12(sp)
    b768:	010ad913          	srl	s2,s5,0x10
    b76c:	0095dbb3          	srl	s7,a1,s1
    b770:	00e597b3          	sll	a5,a1,a4
    b774:	0099d4b3          	srl	s1,s3,s1
    b778:	00090593          	mv	a1,s2
    b77c:	000b8513          	mv	a0,s7
    b780:	010a9a13          	sll	s4,s5,0x10
    b784:	00f4e4b3          	or	s1,s1,a5
    b788:	00e99433          	sll	s0,s3,a4
    b78c:	010a5a13          	srl	s4,s4,0x10
    b790:	534030ef          	jal	ecc4 <__hidden___udivsi3>
    b794:	00050593          	mv	a1,a0
    b798:	00050b13          	mv	s6,a0
    b79c:	000a0513          	mv	a0,s4
    b7a0:	460030ef          	jal	ec00 <__mulsi3>
    b7a4:	00050993          	mv	s3,a0
    b7a8:	00090593          	mv	a1,s2
    b7ac:	000b8513          	mv	a0,s7
    b7b0:	55c030ef          	jal	ed0c <__umodsi3>
    b7b4:	01051513          	sll	a0,a0,0x10
    b7b8:	0104d793          	srl	a5,s1,0x10
    b7bc:	00a7e7b3          	or	a5,a5,a0
    b7c0:	0137fe63          	bgeu	a5,s3,b7dc <__udivdi3+0x3b0>
    b7c4:	00fa87b3          	add	a5,s5,a5
    b7c8:	fffb0713          	add	a4,s6,-1
    b7cc:	2d57ec63          	bltu	a5,s5,baa4 <__udivdi3+0x678>
    b7d0:	2d37fa63          	bgeu	a5,s3,baa4 <__udivdi3+0x678>
    b7d4:	ffeb0b13          	add	s6,s6,-2
    b7d8:	015787b3          	add	a5,a5,s5
    b7dc:	413789b3          	sub	s3,a5,s3
    b7e0:	00090593          	mv	a1,s2
    b7e4:	00098513          	mv	a0,s3
    b7e8:	4dc030ef          	jal	ecc4 <__hidden___udivsi3>
    b7ec:	00050593          	mv	a1,a0
    b7f0:	00050b93          	mv	s7,a0
    b7f4:	000a0513          	mv	a0,s4
    b7f8:	408030ef          	jal	ec00 <__mulsi3>
    b7fc:	00050793          	mv	a5,a0
    b800:	00090593          	mv	a1,s2
    b804:	00098513          	mv	a0,s3
    b808:	01049493          	sll	s1,s1,0x10
    b80c:	00078993          	mv	s3,a5
    b810:	4fc030ef          	jal	ed0c <__umodsi3>
    b814:	01051513          	sll	a0,a0,0x10
    b818:	0104d493          	srl	s1,s1,0x10
    b81c:	00a4e4b3          	or	s1,s1,a0
    b820:	0134fe63          	bgeu	s1,s3,b83c <__udivdi3+0x410>
    b824:	009a84b3          	add	s1,s5,s1
    b828:	fffb8793          	add	a5,s7,-1
    b82c:	2754e463          	bltu	s1,s5,ba94 <__udivdi3+0x668>
    b830:	2734f263          	bgeu	s1,s3,ba94 <__udivdi3+0x668>
    b834:	ffeb8b93          	add	s7,s7,-2
    b838:	015484b3          	add	s1,s1,s5
    b83c:	010b1b13          	sll	s6,s6,0x10
    b840:	017b6b33          	or	s6,s6,s7
    b844:	413484b3          	sub	s1,s1,s3
    b848:	00c12b83          	lw	s7,12(sp)
    b84c:	e25ff06f          	j	b670 <__udivdi3+0x244>
    b850:	1006b793          	sltiu	a5,a3,256
    b854:	0017b793          	seqz	a5,a5
    b858:	00379793          	sll	a5,a5,0x3
    b85c:	00f6d533          	srl	a0,a3,a5
    b860:	00004717          	auipc	a4,0x4
    b864:	f1070713          	add	a4,a4,-240 # f770 <__clz_tab>
    b868:	00a70733          	add	a4,a4,a0
    b86c:	00074703          	lbu	a4,0(a4)
    b870:	02000513          	li	a0,32
    b874:	00f70733          	add	a4,a4,a5
    b878:	40e50b33          	sub	s6,a0,a4
    b87c:	d8e508e3          	beq	a0,a4,b60c <__udivdi3+0x1e0>
    b880:	016696b3          	sll	a3,a3,s6
    b884:	01912223          	sw	s9,4(sp)
    b888:	00e65cb3          	srl	s9,a2,a4
    b88c:	00dcecb3          	or	s9,s9,a3
    b890:	01512a23          	sw	s5,20(sp)
    b894:	01712623          	sw	s7,12(sp)
    b898:	010cda93          	srl	s5,s9,0x10
    b89c:	00e5dbb3          	srl	s7,a1,a4
    b8a0:	016597b3          	sll	a5,a1,s6
    b8a4:	00e9d733          	srl	a4,s3,a4
    b8a8:	01812423          	sw	s8,8(sp)
    b8ac:	000a8593          	mv	a1,s5
    b8b0:	000b8513          	mv	a0,s7
    b8b4:	010c9c13          	sll	s8,s9,0x10
    b8b8:	02812423          	sw	s0,40(sp)
    b8bc:	02912223          	sw	s1,36(sp)
    b8c0:	03212023          	sw	s2,32(sp)
    b8c4:	00f764b3          	or	s1,a4,a5
    b8c8:	01661933          	sll	s2,a2,s6
    b8cc:	01412c23          	sw	s4,24(sp)
    b8d0:	010c5c13          	srl	s8,s8,0x10
    b8d4:	3f0030ef          	jal	ecc4 <__hidden___udivsi3>
    b8d8:	00050593          	mv	a1,a0
    b8dc:	00050413          	mv	s0,a0
    b8e0:	000c0513          	mv	a0,s8
    b8e4:	31c030ef          	jal	ec00 <__mulsi3>
    b8e8:	00050a13          	mv	s4,a0
    b8ec:	000a8593          	mv	a1,s5
    b8f0:	000b8513          	mv	a0,s7
    b8f4:	418030ef          	jal	ed0c <__umodsi3>
    b8f8:	01051513          	sll	a0,a0,0x10
    b8fc:	0104d793          	srl	a5,s1,0x10
    b900:	00a7e7b3          	or	a5,a5,a0
    b904:	0147fe63          	bgeu	a5,s4,b920 <__udivdi3+0x4f4>
    b908:	00fc87b3          	add	a5,s9,a5
    b90c:	fff40713          	add	a4,s0,-1
    b910:	1997ee63          	bltu	a5,s9,baac <__udivdi3+0x680>
    b914:	1947fc63          	bgeu	a5,s4,baac <__udivdi3+0x680>
    b918:	ffe40413          	add	s0,s0,-2
    b91c:	019787b3          	add	a5,a5,s9
    b920:	41478a33          	sub	s4,a5,s4
    b924:	000a8593          	mv	a1,s5
    b928:	000a0513          	mv	a0,s4
    b92c:	398030ef          	jal	ecc4 <__hidden___udivsi3>
    b930:	00050593          	mv	a1,a0
    b934:	00050b93          	mv	s7,a0
    b938:	000c0513          	mv	a0,s8
    b93c:	2c4030ef          	jal	ec00 <__mulsi3>
    b940:	00050793          	mv	a5,a0
    b944:	000a8593          	mv	a1,s5
    b948:	000a0513          	mv	a0,s4
    b94c:	00078a13          	mv	s4,a5
    b950:	3bc030ef          	jal	ed0c <__umodsi3>
    b954:	01049713          	sll	a4,s1,0x10
    b958:	01051513          	sll	a0,a0,0x10
    b95c:	01075713          	srl	a4,a4,0x10
    b960:	00a76733          	or	a4,a4,a0
    b964:	01477e63          	bgeu	a4,s4,b980 <__udivdi3+0x554>
    b968:	00ec8733          	add	a4,s9,a4
    b96c:	fffb8793          	add	a5,s7,-1
    b970:	13976663          	bltu	a4,s9,ba9c <__udivdi3+0x670>
    b974:	13477463          	bgeu	a4,s4,ba9c <__udivdi3+0x670>
    b978:	ffeb8b93          	add	s7,s7,-2
    b97c:	01970733          	add	a4,a4,s9
    b980:	00010e37          	lui	t3,0x10
    b984:	01041413          	sll	s0,s0,0x10
    b988:	01746433          	or	s0,s0,s7
    b98c:	fffe0793          	add	a5,t3,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    b990:	00f47833          	and	a6,s0,a5
    b994:	00f977b3          	and	a5,s2,a5
    b998:	41470733          	sub	a4,a4,s4
    b99c:	01045e93          	srl	t4,s0,0x10
    b9a0:	01095913          	srl	s2,s2,0x10
    b9a4:	00080513          	mv	a0,a6
    b9a8:	00078593          	mv	a1,a5
    b9ac:	254030ef          	jal	ec00 <__mulsi3>
    b9b0:	00050313          	mv	t1,a0
    b9b4:	00090593          	mv	a1,s2
    b9b8:	00080513          	mv	a0,a6
    b9bc:	244030ef          	jal	ec00 <__mulsi3>
    b9c0:	00050813          	mv	a6,a0
    b9c4:	00078593          	mv	a1,a5
    b9c8:	000e8513          	mv	a0,t4
    b9cc:	234030ef          	jal	ec00 <__mulsi3>
    b9d0:	00050893          	mv	a7,a0
    b9d4:	00090593          	mv	a1,s2
    b9d8:	000e8513          	mv	a0,t4
    b9dc:	224030ef          	jal	ec00 <__mulsi3>
    b9e0:	01035793          	srl	a5,t1,0x10
    b9e4:	01180833          	add	a6,a6,a7
    b9e8:	010787b3          	add	a5,a5,a6
    b9ec:	0117f463          	bgeu	a5,a7,b9f4 <__udivdi3+0x5c8>
    b9f0:	01c50533          	add	a0,a0,t3
    b9f4:	0107d693          	srl	a3,a5,0x10
    b9f8:	00a686b3          	add	a3,a3,a0
    b9fc:	06d76863          	bltu	a4,a3,ba6c <__udivdi3+0x640>
    ba00:	04d70663          	beq	a4,a3,ba4c <__udivdi3+0x620>
    ba04:	00040513          	mv	a0,s0
    ba08:	02812403          	lw	s0,40(sp)
    ba0c:	02c12083          	lw	ra,44(sp)
    ba10:	00000b13          	li	s6,0
    ba14:	02412483          	lw	s1,36(sp)
    ba18:	02012903          	lw	s2,32(sp)
    ba1c:	01812a03          	lw	s4,24(sp)
    ba20:	01412a83          	lw	s5,20(sp)
    ba24:	00c12b83          	lw	s7,12(sp)
    ba28:	00812c03          	lw	s8,8(sp)
    ba2c:	00412c83          	lw	s9,4(sp)
    ba30:	01c12983          	lw	s3,28(sp)
    ba34:	000b0593          	mv	a1,s6
    ba38:	01012b03          	lw	s6,16(sp)
    ba3c:	03010113          	add	sp,sp,48
    ba40:	00008067          	ret
    ba44:	00078993          	mv	s3,a5
    ba48:	b2dff06f          	j	b574 <__udivdi3+0x148>
    ba4c:	00010737          	lui	a4,0x10
    ba50:	fff70713          	add	a4,a4,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    ba54:	00e7f7b3          	and	a5,a5,a4
    ba58:	01079793          	sll	a5,a5,0x10
    ba5c:	00e37333          	and	t1,t1,a4
    ba60:	01699533          	sll	a0,s3,s6
    ba64:	006787b3          	add	a5,a5,t1
    ba68:	f8f57ee3          	bgeu	a0,a5,ba04 <__udivdi3+0x5d8>
    ba6c:	fff40513          	add	a0,s0,-1
    ba70:	f99ff06f          	j	ba08 <__udivdi3+0x5dc>
    ba74:	010007b7          	lui	a5,0x1000
    ba78:	04f67a63          	bgeu	a2,a5,bacc <__udivdi3+0x6a0>
    ba7c:	01065693          	srl	a3,a2,0x10
    ba80:	01000713          	li	a4,16
    ba84:	bb9ff06f          	j	b63c <__udivdi3+0x210>
    ba88:	00000b13          	li	s6,0
    ba8c:	00100513          	li	a0,1
    ba90:	b29ff06f          	j	b5b8 <__udivdi3+0x18c>
    ba94:	00078b93          	mv	s7,a5
    ba98:	da5ff06f          	j	b83c <__udivdi3+0x410>
    ba9c:	00078b93          	mv	s7,a5
    baa0:	ee1ff06f          	j	b980 <__udivdi3+0x554>
    baa4:	00070b13          	mv	s6,a4
    baa8:	d35ff06f          	j	b7dc <__udivdi3+0x3b0>
    baac:	00070413          	mv	s0,a4
    bab0:	e71ff06f          	j	b920 <__udivdi3+0x4f4>
    bab4:	ffe98993          	add	s3,s3,-2
    bab8:	015787b3          	add	a5,a5,s5
    babc:	c05ff06f          	j	b6c0 <__udivdi3+0x294>
    bac0:	ffe90913          	add	s2,s2,-2
    bac4:	015787b3          	add	a5,a5,s5
    bac8:	a51ff06f          	j	b518 <__udivdi3+0xec>
    bacc:	01865693          	srl	a3,a2,0x18
    bad0:	01800713          	li	a4,24
    bad4:	b69ff06f          	j	b63c <__udivdi3+0x210>

0000bad8 <__umoddi3>:
    bad8:	fd010113          	add	sp,sp,-48
    badc:	02112623          	sw	ra,44(sp)
    bae0:	00050793          	mv	a5,a0
    bae4:	14069663          	bnez	a3,bc30 <__umoddi3+0x158>
    bae8:	03212023          	sw	s2,32(sp)
    baec:	01412c23          	sw	s4,24(sp)
    baf0:	02812423          	sw	s0,40(sp)
    baf4:	02912223          	sw	s1,36(sp)
    baf8:	01312e23          	sw	s3,28(sp)
    bafc:	01512a23          	sw	s5,20(sp)
    bb00:	00060a13          	mv	s4,a2
    bb04:	00050913          	mv	s2,a0
    bb08:	1ac5f663          	bgeu	a1,a2,bcb4 <__umoddi3+0x1dc>
    bb0c:	01612823          	sw	s6,16(sp)
    bb10:	00010737          	lui	a4,0x10
    bb14:	00058993          	mv	s3,a1
    bb18:	28e66063          	bltu	a2,a4,bd98 <__umoddi3+0x2c0>
    bb1c:	01000737          	lui	a4,0x1000
    bb20:	01800693          	li	a3,24
    bb24:	00e67463          	bgeu	a2,a4,bb2c <__umoddi3+0x54>
    bb28:	01000693          	li	a3,16
    bb2c:	00d65533          	srl	a0,a2,a3
    bb30:	00004717          	auipc	a4,0x4
    bb34:	c4070713          	add	a4,a4,-960 # f770 <__clz_tab>
    bb38:	00a70733          	add	a4,a4,a0
    bb3c:	00074703          	lbu	a4,0(a4)
    bb40:	02000513          	li	a0,32
    bb44:	00d70733          	add	a4,a4,a3
    bb48:	40e504b3          	sub	s1,a0,a4
    bb4c:	00e50c63          	beq	a0,a4,bb64 <__umoddi3+0x8c>
    bb50:	009599b3          	sll	s3,a1,s1
    bb54:	00e7d733          	srl	a4,a5,a4
    bb58:	00961a33          	sll	s4,a2,s1
    bb5c:	013769b3          	or	s3,a4,s3
    bb60:	00979933          	sll	s2,a5,s1
    bb64:	010a5a93          	srl	s5,s4,0x10
    bb68:	000a8593          	mv	a1,s5
    bb6c:	00098513          	mv	a0,s3
    bb70:	010a1b13          	sll	s6,s4,0x10
    bb74:	150030ef          	jal	ecc4 <__hidden___udivsi3>
    bb78:	010b5b13          	srl	s6,s6,0x10
    bb7c:	000b0593          	mv	a1,s6
    bb80:	080030ef          	jal	ec00 <__mulsi3>
    bb84:	00050413          	mv	s0,a0
    bb88:	000a8593          	mv	a1,s5
    bb8c:	00098513          	mv	a0,s3
    bb90:	17c030ef          	jal	ed0c <__umodsi3>
    bb94:	01051513          	sll	a0,a0,0x10
    bb98:	01095793          	srl	a5,s2,0x10
    bb9c:	00a7e7b3          	or	a5,a5,a0
    bba0:	0087f863          	bgeu	a5,s0,bbb0 <__umoddi3+0xd8>
    bba4:	00fa07b3          	add	a5,s4,a5
    bba8:	0147e463          	bltu	a5,s4,bbb0 <__umoddi3+0xd8>
    bbac:	5687e863          	bltu	a5,s0,c11c <__umoddi3+0x644>
    bbb0:	40878433          	sub	s0,a5,s0
    bbb4:	000a8593          	mv	a1,s5
    bbb8:	00040513          	mv	a0,s0
    bbbc:	108030ef          	jal	ecc4 <__hidden___udivsi3>
    bbc0:	000b0593          	mv	a1,s6
    bbc4:	03c030ef          	jal	ec00 <__mulsi3>
    bbc8:	00050793          	mv	a5,a0
    bbcc:	000a8593          	mv	a1,s5
    bbd0:	00040513          	mv	a0,s0
    bbd4:	00078413          	mv	s0,a5
    bbd8:	134030ef          	jal	ed0c <__umodsi3>
    bbdc:	01091793          	sll	a5,s2,0x10
    bbe0:	01051513          	sll	a0,a0,0x10
    bbe4:	0107d793          	srl	a5,a5,0x10
    bbe8:	00a7e7b3          	or	a5,a5,a0
    bbec:	0087f863          	bgeu	a5,s0,bbfc <__umoddi3+0x124>
    bbf0:	00fa07b3          	add	a5,s4,a5
    bbf4:	0147e463          	bltu	a5,s4,bbfc <__umoddi3+0x124>
    bbf8:	5087ea63          	bltu	a5,s0,c10c <__umoddi3+0x634>
    bbfc:	01012b03          	lw	s6,16(sp)
    bc00:	408787b3          	sub	a5,a5,s0
    bc04:	0097d533          	srl	a0,a5,s1
    bc08:	02812403          	lw	s0,40(sp)
    bc0c:	02412483          	lw	s1,36(sp)
    bc10:	02012903          	lw	s2,32(sp)
    bc14:	01c12983          	lw	s3,28(sp)
    bc18:	01812a03          	lw	s4,24(sp)
    bc1c:	01412a83          	lw	s5,20(sp)
    bc20:	00000593          	li	a1,0
    bc24:	02c12083          	lw	ra,44(sp)
    bc28:	03010113          	add	sp,sp,48
    bc2c:	00008067          	ret
    bc30:	00050893          	mv	a7,a0
    bc34:	fed5e8e3          	bltu	a1,a3,bc24 <__umoddi3+0x14c>
    bc38:	03212023          	sw	s2,32(sp)
    bc3c:	01312e23          	sw	s3,28(sp)
    bc40:	00010737          	lui	a4,0x10
    bc44:	00058813          	mv	a6,a1
    bc48:	24e6ec63          	bltu	a3,a4,bea0 <__umoddi3+0x3c8>
    bc4c:	01000737          	lui	a4,0x1000
    bc50:	01800513          	li	a0,24
    bc54:	00e6f463          	bgeu	a3,a4,bc5c <__umoddi3+0x184>
    bc58:	01000513          	li	a0,16
    bc5c:	00a6d333          	srl	t1,a3,a0
    bc60:	00004717          	auipc	a4,0x4
    bc64:	b1070713          	add	a4,a4,-1264 # f770 <__clz_tab>
    bc68:	00670733          	add	a4,a4,t1
    bc6c:	00074703          	lbu	a4,0(a4)
    bc70:	02000313          	li	t1,32
    bc74:	00a709b3          	add	s3,a4,a0
    bc78:	41330933          	sub	s2,t1,s3
    bc7c:	25331a63          	bne	t1,s3,bed0 <__umoddi3+0x3f8>
    bc80:	00b6e463          	bltu	a3,a1,bc88 <__umoddi3+0x1b0>
    bc84:	00c7ea63          	bltu	a5,a2,bc98 <__umoddi3+0x1c0>
    bc88:	40c788b3          	sub	a7,a5,a2
    bc8c:	40d586b3          	sub	a3,a1,a3
    bc90:	0117b833          	sltu	a6,a5,a7
    bc94:	41068833          	sub	a6,a3,a6
    bc98:	02c12083          	lw	ra,44(sp)
    bc9c:	02012903          	lw	s2,32(sp)
    bca0:	01c12983          	lw	s3,28(sp)
    bca4:	00088513          	mv	a0,a7
    bca8:	00080593          	mv	a1,a6
    bcac:	03010113          	add	sp,sp,48
    bcb0:	00008067          	ret
    bcb4:	0e060a63          	beqz	a2,bda8 <__umoddi3+0x2d0>
    bcb8:	00010737          	lui	a4,0x10
    bcbc:	42e67663          	bgeu	a2,a4,c0e8 <__umoddi3+0x610>
    bcc0:	10063693          	sltiu	a3,a2,256
    bcc4:	0016b693          	seqz	a3,a3
    bcc8:	00369693          	sll	a3,a3,0x3
    bccc:	00d65533          	srl	a0,a2,a3
    bcd0:	00004717          	auipc	a4,0x4
    bcd4:	aa070713          	add	a4,a4,-1376 # f770 <__clz_tab>
    bcd8:	00a70733          	add	a4,a4,a0
    bcdc:	00074983          	lbu	s3,0(a4)
    bce0:	02000713          	li	a4,32
    bce4:	00d989b3          	add	s3,s3,a3
    bce8:	413704b3          	sub	s1,a4,s3
    bcec:	0f371263          	bne	a4,s3,bdd0 <__umoddi3+0x2f8>
    bcf0:	01061413          	sll	s0,a2,0x10
    bcf4:	40c589b3          	sub	s3,a1,a2
    bcf8:	01065a93          	srl	s5,a2,0x10
    bcfc:	01045413          	srl	s0,s0,0x10
    bd00:	000a8593          	mv	a1,s5
    bd04:	00098513          	mv	a0,s3
    bd08:	7bd020ef          	jal	ecc4 <__hidden___udivsi3>
    bd0c:	00040593          	mv	a1,s0
    bd10:	6f1020ef          	jal	ec00 <__mulsi3>
    bd14:	00050793          	mv	a5,a0
    bd18:	000a8593          	mv	a1,s5
    bd1c:	00098513          	mv	a0,s3
    bd20:	00078993          	mv	s3,a5
    bd24:	7e9020ef          	jal	ed0c <__umodsi3>
    bd28:	01051513          	sll	a0,a0,0x10
    bd2c:	01095793          	srl	a5,s2,0x10
    bd30:	00a7e7b3          	or	a5,a5,a0
    bd34:	0137f863          	bgeu	a5,s3,bd44 <__umoddi3+0x26c>
    bd38:	00fa07b3          	add	a5,s4,a5
    bd3c:	0147e463          	bltu	a5,s4,bd44 <__umoddi3+0x26c>
    bd40:	3d37ea63          	bltu	a5,s3,c114 <__umoddi3+0x63c>
    bd44:	413789b3          	sub	s3,a5,s3
    bd48:	000a8593          	mv	a1,s5
    bd4c:	00098513          	mv	a0,s3
    bd50:	775020ef          	jal	ecc4 <__hidden___udivsi3>
    bd54:	00040593          	mv	a1,s0
    bd58:	6a9020ef          	jal	ec00 <__mulsi3>
    bd5c:	00050413          	mv	s0,a0
    bd60:	000a8593          	mv	a1,s5
    bd64:	00098513          	mv	a0,s3
    bd68:	7a5020ef          	jal	ed0c <__umodsi3>
    bd6c:	01091913          	sll	s2,s2,0x10
    bd70:	01051793          	sll	a5,a0,0x10
    bd74:	01095913          	srl	s2,s2,0x10
    bd78:	00f967b3          	or	a5,s2,a5
    bd7c:	0087fa63          	bgeu	a5,s0,bd90 <__umoddi3+0x2b8>
    bd80:	00fa07b3          	add	a5,s4,a5
    bd84:	0147e663          	bltu	a5,s4,bd90 <__umoddi3+0x2b8>
    bd88:	0087f463          	bgeu	a5,s0,bd90 <__umoddi3+0x2b8>
    bd8c:	014787b3          	add	a5,a5,s4
    bd90:	408787b3          	sub	a5,a5,s0
    bd94:	e71ff06f          	j	bc04 <__umoddi3+0x12c>
    bd98:	10063693          	sltiu	a3,a2,256
    bd9c:	0016b693          	seqz	a3,a3
    bda0:	00369693          	sll	a3,a3,0x3
    bda4:	d89ff06f          	j	bb2c <__umoddi3+0x54>
    bda8:	00000513          	li	a0,0
    bdac:	00004717          	auipc	a4,0x4
    bdb0:	9c470713          	add	a4,a4,-1596 # f770 <__clz_tab>
    bdb4:	00a70733          	add	a4,a4,a0
    bdb8:	00074983          	lbu	s3,0(a4)
    bdbc:	00000693          	li	a3,0
    bdc0:	02000713          	li	a4,32
    bdc4:	00d989b3          	add	s3,s3,a3
    bdc8:	413704b3          	sub	s1,a4,s3
    bdcc:	f33702e3          	beq	a4,s3,bcf0 <__umoddi3+0x218>
    bdd0:	00961a33          	sll	s4,a2,s1
    bdd4:	01712623          	sw	s7,12(sp)
    bdd8:	010a5a93          	srl	s5,s4,0x10
    bddc:	0135dbb3          	srl	s7,a1,s3
    bde0:	00959733          	sll	a4,a1,s1
    bde4:	0137d9b3          	srl	s3,a5,s3
    bde8:	000a8593          	mv	a1,s5
    bdec:	000b8513          	mv	a0,s7
    bdf0:	010a1413          	sll	s0,s4,0x10
    bdf4:	00e9e9b3          	or	s3,s3,a4
    bdf8:	00979933          	sll	s2,a5,s1
    bdfc:	01612823          	sw	s6,16(sp)
    be00:	01045413          	srl	s0,s0,0x10
    be04:	6c1020ef          	jal	ecc4 <__hidden___udivsi3>
    be08:	00040593          	mv	a1,s0
    be0c:	5f5020ef          	jal	ec00 <__mulsi3>
    be10:	00050b13          	mv	s6,a0
    be14:	000a8593          	mv	a1,s5
    be18:	000b8513          	mv	a0,s7
    be1c:	6f1020ef          	jal	ed0c <__umodsi3>
    be20:	01051513          	sll	a0,a0,0x10
    be24:	0109d793          	srl	a5,s3,0x10
    be28:	00a7e7b3          	or	a5,a5,a0
    be2c:	0167fa63          	bgeu	a5,s6,be40 <__umoddi3+0x368>
    be30:	00fa07b3          	add	a5,s4,a5
    be34:	0147e663          	bltu	a5,s4,be40 <__umoddi3+0x368>
    be38:	0167f463          	bgeu	a5,s6,be40 <__umoddi3+0x368>
    be3c:	014787b3          	add	a5,a5,s4
    be40:	41678b33          	sub	s6,a5,s6
    be44:	000a8593          	mv	a1,s5
    be48:	000b0513          	mv	a0,s6
    be4c:	679020ef          	jal	ecc4 <__hidden___udivsi3>
    be50:	00040593          	mv	a1,s0
    be54:	5ad020ef          	jal	ec00 <__mulsi3>
    be58:	00050793          	mv	a5,a0
    be5c:	000a8593          	mv	a1,s5
    be60:	000b0513          	mv	a0,s6
    be64:	01099993          	sll	s3,s3,0x10
    be68:	00078b13          	mv	s6,a5
    be6c:	6a1020ef          	jal	ed0c <__umodsi3>
    be70:	01051513          	sll	a0,a0,0x10
    be74:	0109d993          	srl	s3,s3,0x10
    be78:	00a9e9b3          	or	s3,s3,a0
    be7c:	0169fa63          	bgeu	s3,s6,be90 <__umoddi3+0x3b8>
    be80:	013a09b3          	add	s3,s4,s3
    be84:	0149e663          	bltu	s3,s4,be90 <__umoddi3+0x3b8>
    be88:	0169f463          	bgeu	s3,s6,be90 <__umoddi3+0x3b8>
    be8c:	014989b3          	add	s3,s3,s4
    be90:	416989b3          	sub	s3,s3,s6
    be94:	00c12b83          	lw	s7,12(sp)
    be98:	01012b03          	lw	s6,16(sp)
    be9c:	e65ff06f          	j	bd00 <__umoddi3+0x228>
    bea0:	1006b513          	sltiu	a0,a3,256
    bea4:	00153513          	seqz	a0,a0
    bea8:	00351513          	sll	a0,a0,0x3
    beac:	00a6d333          	srl	t1,a3,a0
    beb0:	00004717          	auipc	a4,0x4
    beb4:	8c070713          	add	a4,a4,-1856 # f770 <__clz_tab>
    beb8:	00670733          	add	a4,a4,t1
    bebc:	00074703          	lbu	a4,0(a4)
    bec0:	02000313          	li	t1,32
    bec4:	00a709b3          	add	s3,a4,a0
    bec8:	41330933          	sub	s2,t1,s3
    becc:	db330ae3          	beq	t1,s3,bc80 <__umoddi3+0x1a8>
    bed0:	01512a23          	sw	s5,20(sp)
    bed4:	012696b3          	sll	a3,a3,s2
    bed8:	01365ab3          	srl	s5,a2,s3
    bedc:	00daeab3          	or	s5,s5,a3
    bee0:	01712623          	sw	s7,12(sp)
    bee4:	01a12023          	sw	s10,0(sp)
    bee8:	010adb93          	srl	s7,s5,0x10
    beec:	0135dd33          	srl	s10,a1,s3
    bef0:	01259733          	sll	a4,a1,s2
    bef4:	0137d6b3          	srl	a3,a5,s3
    bef8:	01912223          	sw	s9,4(sp)
    befc:	000b8593          	mv	a1,s7
    bf00:	000d0513          	mv	a0,s10
    bf04:	010a9c93          	sll	s9,s5,0x10
    bf08:	02812423          	sw	s0,40(sp)
    bf0c:	02912223          	sw	s1,36(sp)
    bf10:	01261433          	sll	s0,a2,s2
    bf14:	012794b3          	sll	s1,a5,s2
    bf18:	01412c23          	sw	s4,24(sp)
    bf1c:	01612823          	sw	s6,16(sp)
    bf20:	00e6ea33          	or	s4,a3,a4
    bf24:	01812423          	sw	s8,8(sp)
    bf28:	010cdc93          	srl	s9,s9,0x10
    bf2c:	599020ef          	jal	ecc4 <__hidden___udivsi3>
    bf30:	00050593          	mv	a1,a0
    bf34:	00050b13          	mv	s6,a0
    bf38:	000c8513          	mv	a0,s9
    bf3c:	4c5020ef          	jal	ec00 <__mulsi3>
    bf40:	00050c13          	mv	s8,a0
    bf44:	000b8593          	mv	a1,s7
    bf48:	000d0513          	mv	a0,s10
    bf4c:	5c1020ef          	jal	ed0c <__umodsi3>
    bf50:	01051513          	sll	a0,a0,0x10
    bf54:	010a5793          	srl	a5,s4,0x10
    bf58:	00a7e7b3          	or	a5,a5,a0
    bf5c:	0187fe63          	bgeu	a5,s8,bf78 <__umoddi3+0x4a0>
    bf60:	00fa87b3          	add	a5,s5,a5
    bf64:	fffb0713          	add	a4,s6,-1
    bf68:	1957ee63          	bltu	a5,s5,c104 <__umoddi3+0x62c>
    bf6c:	1987fc63          	bgeu	a5,s8,c104 <__umoddi3+0x62c>
    bf70:	ffeb0b13          	add	s6,s6,-2
    bf74:	015787b3          	add	a5,a5,s5
    bf78:	41878c33          	sub	s8,a5,s8
    bf7c:	000b8593          	mv	a1,s7
    bf80:	000c0513          	mv	a0,s8
    bf84:	541020ef          	jal	ecc4 <__hidden___udivsi3>
    bf88:	00050593          	mv	a1,a0
    bf8c:	00050d13          	mv	s10,a0
    bf90:	000c8513          	mv	a0,s9
    bf94:	46d020ef          	jal	ec00 <__mulsi3>
    bf98:	00050793          	mv	a5,a0
    bf9c:	000b8593          	mv	a1,s7
    bfa0:	000c0513          	mv	a0,s8
    bfa4:	00078b93          	mv	s7,a5
    bfa8:	565020ef          	jal	ed0c <__umodsi3>
    bfac:	010a1593          	sll	a1,s4,0x10
    bfb0:	01051513          	sll	a0,a0,0x10
    bfb4:	0105d593          	srl	a1,a1,0x10
    bfb8:	00a5e5b3          	or	a1,a1,a0
    bfbc:	0175fe63          	bgeu	a1,s7,bfd8 <__umoddi3+0x500>
    bfc0:	00ba85b3          	add	a1,s5,a1
    bfc4:	fffd0793          	add	a5,s10,-1
    bfc8:	1355ea63          	bltu	a1,s5,c0fc <__umoddi3+0x624>
    bfcc:	1375f863          	bgeu	a1,s7,c0fc <__umoddi3+0x624>
    bfd0:	ffed0d13          	add	s10,s10,-2
    bfd4:	015585b3          	add	a1,a1,s5
    bfd8:	010b1793          	sll	a5,s6,0x10
    bfdc:	00010e37          	lui	t3,0x10
    bfe0:	01a7e7b3          	or	a5,a5,s10
    bfe4:	fffe0313          	add	t1,t3,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    bfe8:	0067f8b3          	and	a7,a5,t1
    bfec:	00647333          	and	t1,s0,t1
    bff0:	41758733          	sub	a4,a1,s7
    bff4:	0107d793          	srl	a5,a5,0x10
    bff8:	01045e93          	srl	t4,s0,0x10
    bffc:	00088513          	mv	a0,a7
    c000:	00030593          	mv	a1,t1
    c004:	3fd020ef          	jal	ec00 <__mulsi3>
    c008:	00050813          	mv	a6,a0
    c00c:	000e8593          	mv	a1,t4
    c010:	00088513          	mv	a0,a7
    c014:	3ed020ef          	jal	ec00 <__mulsi3>
    c018:	00050893          	mv	a7,a0
    c01c:	00030593          	mv	a1,t1
    c020:	00078513          	mv	a0,a5
    c024:	3dd020ef          	jal	ec00 <__mulsi3>
    c028:	00050313          	mv	t1,a0
    c02c:	000e8593          	mv	a1,t4
    c030:	00078513          	mv	a0,a5
    c034:	3cd020ef          	jal	ec00 <__mulsi3>
    c038:	01085793          	srl	a5,a6,0x10
    c03c:	006888b3          	add	a7,a7,t1
    c040:	011787b3          	add	a5,a5,a7
    c044:	0067f463          	bgeu	a5,t1,c04c <__umoddi3+0x574>
    c048:	01c50533          	add	a0,a0,t3
    c04c:	00010637          	lui	a2,0x10
    c050:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    c054:	0107d693          	srl	a3,a5,0x10
    c058:	00c7f7b3          	and	a5,a5,a2
    c05c:	01079793          	sll	a5,a5,0x10
    c060:	00c87833          	and	a6,a6,a2
    c064:	00a686b3          	add	a3,a3,a0
    c068:	010787b3          	add	a5,a5,a6
    c06c:	06d76263          	bltu	a4,a3,c0d0 <__umoddi3+0x5f8>
    c070:	04d70e63          	beq	a4,a3,c0cc <__umoddi3+0x5f4>
    c074:	40f487b3          	sub	a5,s1,a5
    c078:	00f4b4b3          	sltu	s1,s1,a5
    c07c:	02812403          	lw	s0,40(sp)
    c080:	02c12083          	lw	ra,44(sp)
    c084:	40d705b3          	sub	a1,a4,a3
    c088:	409585b3          	sub	a1,a1,s1
    c08c:	01359733          	sll	a4,a1,s3
    c090:	0127d7b3          	srl	a5,a5,s2
    c094:	02412483          	lw	s1,36(sp)
    c098:	01c12983          	lw	s3,28(sp)
    c09c:	01812a03          	lw	s4,24(sp)
    c0a0:	01412a83          	lw	s5,20(sp)
    c0a4:	01012b03          	lw	s6,16(sp)
    c0a8:	00c12b83          	lw	s7,12(sp)
    c0ac:	00812c03          	lw	s8,8(sp)
    c0b0:	00412c83          	lw	s9,4(sp)
    c0b4:	00012d03          	lw	s10,0(sp)
    c0b8:	0125d5b3          	srl	a1,a1,s2
    c0bc:	00f76533          	or	a0,a4,a5
    c0c0:	02012903          	lw	s2,32(sp)
    c0c4:	03010113          	add	sp,sp,48
    c0c8:	00008067          	ret
    c0cc:	faf4f4e3          	bgeu	s1,a5,c074 <__umoddi3+0x59c>
    c0d0:	40878433          	sub	s0,a5,s0
    c0d4:	0087b7b3          	sltu	a5,a5,s0
    c0d8:	01578ab3          	add	s5,a5,s5
    c0dc:	415686b3          	sub	a3,a3,s5
    c0e0:	00040793          	mv	a5,s0
    c0e4:	f91ff06f          	j	c074 <__umoddi3+0x59c>
    c0e8:	01000737          	lui	a4,0x1000
    c0ec:	02e67c63          	bgeu	a2,a4,c124 <__umoddi3+0x64c>
    c0f0:	01065513          	srl	a0,a2,0x10
    c0f4:	01000693          	li	a3,16
    c0f8:	bd9ff06f          	j	bcd0 <__umoddi3+0x1f8>
    c0fc:	00078d13          	mv	s10,a5
    c100:	ed9ff06f          	j	bfd8 <__umoddi3+0x500>
    c104:	00070b13          	mv	s6,a4
    c108:	e71ff06f          	j	bf78 <__umoddi3+0x4a0>
    c10c:	014787b3          	add	a5,a5,s4
    c110:	aedff06f          	j	bbfc <__umoddi3+0x124>
    c114:	014787b3          	add	a5,a5,s4
    c118:	c2dff06f          	j	bd44 <__umoddi3+0x26c>
    c11c:	014787b3          	add	a5,a5,s4
    c120:	a91ff06f          	j	bbb0 <__umoddi3+0xd8>
    c124:	01865513          	srl	a0,a2,0x18
    c128:	01800693          	li	a3,24
    c12c:	ba5ff06f          	j	bcd0 <__umoddi3+0x1f8>

0000c130 <__adddf3>:
    c130:	001007b7          	lui	a5,0x100
    c134:	fe010113          	add	sp,sp,-32
    c138:	fff78e93          	add	t4,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    c13c:	00bef833          	and	a6,t4,a1
    c140:	00def7b3          	and	a5,t4,a3
    c144:	0146d313          	srl	t1,a3,0x14
    c148:	01212823          	sw	s2,16(sp)
    c14c:	0145d913          	srl	s2,a1,0x14
    c150:	00379793          	sll	a5,a5,0x3
    c154:	00812c23          	sw	s0,24(sp)
    c158:	00381813          	sll	a6,a6,0x3
    c15c:	01f5d413          	srl	s0,a1,0x1f
    c160:	01d55713          	srl	a4,a0,0x1d
    c164:	01d65893          	srl	a7,a2,0x1d
    c168:	7ff97913          	and	s2,s2,2047
    c16c:	7ff37313          	and	t1,t1,2047
    c170:	00112e23          	sw	ra,28(sp)
    c174:	00912a23          	sw	s1,20(sp)
    c178:	01312623          	sw	s3,12(sp)
    c17c:	01f6d693          	srl	a3,a3,0x1f
    c180:	00f8e8b3          	or	a7,a7,a5
    c184:	01076733          	or	a4,a4,a6
    c188:	00351593          	sll	a1,a0,0x3
    c18c:	00361f13          	sll	t5,a2,0x3
    c190:	406907b3          	sub	a5,s2,t1
    c194:	1ed40463          	beq	s0,a3,c37c <__adddf3+0x24c>
    c198:	16f05263          	blez	a5,c2fc <__adddf3+0x1cc>
    c19c:	28030663          	beqz	t1,c428 <__adddf3+0x2f8>
    c1a0:	7ff00693          	li	a3,2047
    c1a4:	42d90663          	beq	s2,a3,c5d0 <__adddf3+0x4a0>
    c1a8:	03800693          	li	a3,56
    c1ac:	00100613          	li	a2,1
    c1b0:	02f6ce63          	blt	a3,a5,c1ec <__adddf3+0xbc>
    c1b4:	008006b7          	lui	a3,0x800
    c1b8:	00d8e8b3          	or	a7,a7,a3
    c1bc:	01f00693          	li	a3,31
    c1c0:	52f6ce63          	blt	a3,a5,c6fc <__adddf3+0x5cc>
    c1c4:	02000693          	li	a3,32
    c1c8:	40f686b3          	sub	a3,a3,a5
    c1cc:	00d89633          	sll	a2,a7,a3
    c1d0:	00ff5533          	srl	a0,t5,a5
    c1d4:	00df16b3          	sll	a3,t5,a3
    c1d8:	00a66633          	or	a2,a2,a0
    c1dc:	00d036b3          	snez	a3,a3
    c1e0:	00f8d8b3          	srl	a7,a7,a5
    c1e4:	00d66633          	or	a2,a2,a3
    c1e8:	41170733          	sub	a4,a4,a7
    c1ec:	40c58633          	sub	a2,a1,a2
    c1f0:	00c5b5b3          	sltu	a1,a1,a2
    c1f4:	00060493          	mv	s1,a2
    c1f8:	40b709b3          	sub	s3,a4,a1
    c1fc:	00899793          	sll	a5,s3,0x8
    c200:	3207da63          	bgez	a5,c534 <__adddf3+0x404>
    c204:	008007b7          	lui	a5,0x800
    c208:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    c20c:	00f9f9b3          	and	s3,s3,a5
    c210:	2c098863          	beqz	s3,c4e0 <__adddf3+0x3b0>
    c214:	00098513          	mv	a0,s3
    c218:	359020ef          	jal	ed70 <__clzsi2>
    c21c:	ff850793          	add	a5,a0,-8
    c220:	02000693          	li	a3,32
    c224:	40f68733          	sub	a4,a3,a5
    c228:	00e4d733          	srl	a4,s1,a4
    c22c:	00f999b3          	sll	s3,s3,a5
    c230:	01376733          	or	a4,a4,s3
    c234:	00f494b3          	sll	s1,s1,a5
    c238:	4b27c863          	blt	a5,s2,c6e8 <__adddf3+0x5b8>
    c23c:	412787b3          	sub	a5,a5,s2
    c240:	00178793          	add	a5,a5,1
    c244:	40f686b3          	sub	a3,a3,a5
    c248:	00d49633          	sll	a2,s1,a3
    c24c:	00f4d9b3          	srl	s3,s1,a5
    c250:	00c03633          	snez	a2,a2
    c254:	01366633          	or	a2,a2,s3
    c258:	00d716b3          	sll	a3,a4,a3
    c25c:	00c6e4b3          	or	s1,a3,a2
    c260:	00f759b3          	srl	s3,a4,a5
    c264:	00000913          	li	s2,0
    c268:	0074f793          	and	a5,s1,7
    c26c:	02078063          	beqz	a5,c28c <__adddf3+0x15c>
    c270:	00f4f793          	and	a5,s1,15
    c274:	00400713          	li	a4,4
    c278:	00e78a63          	beq	a5,a4,c28c <__adddf3+0x15c>
    c27c:	00448793          	add	a5,s1,4
    c280:	0097b633          	sltu	a2,a5,s1
    c284:	00c989b3          	add	s3,s3,a2
    c288:	00078493          	mv	s1,a5
    c28c:	00899793          	sll	a5,s3,0x8
    c290:	6e07da63          	bgez	a5,c984 <__adddf3+0x854>
    c294:	00190793          	add	a5,s2,1
    c298:	7ff00713          	li	a4,2047
    c29c:	00040e13          	mv	t3,s0
    c2a0:	2ae78663          	beq	a5,a4,c54c <__adddf3+0x41c>
    c2a4:	ff800737          	lui	a4,0xff800
    c2a8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c2ac:	00e9f733          	and	a4,s3,a4
    c2b0:	7ff7f793          	and	a5,a5,2047
    c2b4:	01d71813          	sll	a6,a4,0x1d
    c2b8:	0034d613          	srl	a2,s1,0x3
    c2bc:	00971713          	sll	a4,a4,0x9
    c2c0:	00c86833          	or	a6,a6,a2
    c2c4:	00c75713          	srl	a4,a4,0xc
    c2c8:	01c12083          	lw	ra,28(sp)
    c2cc:	01812403          	lw	s0,24(sp)
    c2d0:	01479793          	sll	a5,a5,0x14
    c2d4:	00e7e7b3          	or	a5,a5,a4
    c2d8:	01fe1713          	sll	a4,t3,0x1f
    c2dc:	00e7e7b3          	or	a5,a5,a4
    c2e0:	01412483          	lw	s1,20(sp)
    c2e4:	01012903          	lw	s2,16(sp)
    c2e8:	00c12983          	lw	s3,12(sp)
    c2ec:	00080513          	mv	a0,a6
    c2f0:	00078593          	mv	a1,a5
    c2f4:	02010113          	add	sp,sp,32
    c2f8:	00008067          	ret
    c2fc:	14078c63          	beqz	a5,c454 <__adddf3+0x324>
    c300:	412307b3          	sub	a5,t1,s2
    c304:	3c091263          	bnez	s2,c6c8 <__adddf3+0x598>
    c308:	00b76533          	or	a0,a4,a1
    c30c:	4c050463          	beqz	a0,c7d4 <__adddf3+0x6a4>
    c310:	fff78513          	add	a0,a5,-1
    c314:	60050263          	beqz	a0,c918 <__adddf3+0x7e8>
    c318:	7ff00813          	li	a6,2047
    c31c:	57078663          	beq	a5,a6,c888 <__adddf3+0x758>
    c320:	03800793          	li	a5,56
    c324:	00100613          	li	a2,1
    c328:	02a7cc63          	blt	a5,a0,c360 <__adddf3+0x230>
    c32c:	00050793          	mv	a5,a0
    c330:	01f00613          	li	a2,31
    c334:	56f64c63          	blt	a2,a5,c8ac <__adddf3+0x77c>
    c338:	02000513          	li	a0,32
    c33c:	40f50533          	sub	a0,a0,a5
    c340:	00a71633          	sll	a2,a4,a0
    c344:	00f5d833          	srl	a6,a1,a5
    c348:	00a59533          	sll	a0,a1,a0
    c34c:	01066633          	or	a2,a2,a6
    c350:	00a03533          	snez	a0,a0
    c354:	00f75733          	srl	a4,a4,a5
    c358:	00a66633          	or	a2,a2,a0
    c35c:	40e888b3          	sub	a7,a7,a4
    c360:	40cf0633          	sub	a2,t5,a2
    c364:	00cf3733          	sltu	a4,t5,a2
    c368:	00060493          	mv	s1,a2
    c36c:	40e889b3          	sub	s3,a7,a4
    c370:	00030913          	mv	s2,t1
    c374:	00068413          	mv	s0,a3
    c378:	e85ff06f          	j	c1fc <__adddf3+0xcc>
    c37c:	1ef05063          	blez	a5,c55c <__adddf3+0x42c>
    c380:	14031063          	bnez	t1,c4c0 <__adddf3+0x390>
    c384:	01e8e6b3          	or	a3,a7,t5
    c388:	26068c63          	beqz	a3,c600 <__adddf3+0x4d0>
    c38c:	fff78693          	add	a3,a5,-1
    c390:	48068063          	beqz	a3,c810 <__adddf3+0x6e0>
    c394:	7ff00613          	li	a2,2047
    c398:	22c78c63          	beq	a5,a2,c5d0 <__adddf3+0x4a0>
    c39c:	03800793          	li	a5,56
    c3a0:	00100993          	li	s3,1
    c3a4:	02d7cc63          	blt	a5,a3,c3dc <__adddf3+0x2ac>
    c3a8:	00068793          	mv	a5,a3
    c3ac:	01f00693          	li	a3,31
    c3b0:	4af6c063          	blt	a3,a5,c850 <__adddf3+0x720>
    c3b4:	02000693          	li	a3,32
    c3b8:	40f686b3          	sub	a3,a3,a5
    c3bc:	00d899b3          	sll	s3,a7,a3
    c3c0:	00ff5633          	srl	a2,t5,a5
    c3c4:	00df16b3          	sll	a3,t5,a3
    c3c8:	00c9e9b3          	or	s3,s3,a2
    c3cc:	00d036b3          	snez	a3,a3
    c3d0:	00f8d8b3          	srl	a7,a7,a5
    c3d4:	00d9e9b3          	or	s3,s3,a3
    c3d8:	01170733          	add	a4,a4,a7
    c3dc:	00b985b3          	add	a1,s3,a1
    c3e0:	0135b9b3          	sltu	s3,a1,s3
    c3e4:	00058493          	mv	s1,a1
    c3e8:	00e989b3          	add	s3,s3,a4
    c3ec:	00899793          	sll	a5,s3,0x8
    c3f0:	1407d263          	bgez	a5,c534 <__adddf3+0x404>
    c3f4:	00190913          	add	s2,s2,1
    c3f8:	7ff00793          	li	a5,2047
    c3fc:	36f90c63          	beq	s2,a5,c774 <__adddf3+0x644>
    c400:	ff8007b7          	lui	a5,0xff800
    c404:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c408:	0014f613          	and	a2,s1,1
    c40c:	00f9f7b3          	and	a5,s3,a5
    c410:	0014d713          	srl	a4,s1,0x1
    c414:	00c76733          	or	a4,a4,a2
    c418:	01f79613          	sll	a2,a5,0x1f
    c41c:	00e664b3          	or	s1,a2,a4
    c420:	0017d993          	srl	s3,a5,0x1
    c424:	e45ff06f          	j	c268 <__adddf3+0x138>
    c428:	01e8e6b3          	or	a3,a7,t5
    c42c:	1c068a63          	beqz	a3,c600 <__adddf3+0x4d0>
    c430:	fff78693          	add	a3,a5,-1
    c434:	40068063          	beqz	a3,c834 <__adddf3+0x704>
    c438:	7ff00613          	li	a2,2047
    c43c:	18c78a63          	beq	a5,a2,c5d0 <__adddf3+0x4a0>
    c440:	03800793          	li	a5,56
    c444:	00100613          	li	a2,1
    c448:	dad7c2e3          	blt	a5,a3,c1ec <__adddf3+0xbc>
    c44c:	00068793          	mv	a5,a3
    c450:	d6dff06f          	j	c1bc <__adddf3+0x8c>
    c454:	00190813          	add	a6,s2,1
    c458:	7fe87813          	and	a6,a6,2046
    c45c:	22081c63          	bnez	a6,c694 <__adddf3+0x564>
    c460:	00b76333          	or	t1,a4,a1
    c464:	01e8e833          	or	a6,a7,t5
    c468:	38091063          	bnez	s2,c7e8 <__adddf3+0x6b8>
    c46c:	46030e63          	beqz	t1,c8e8 <__adddf3+0x7b8>
    c470:	40080663          	beqz	a6,c87c <__adddf3+0x74c>
    c474:	41e589b3          	sub	s3,a1,t5
    c478:	0135b533          	sltu	a0,a1,s3
    c47c:	41170633          	sub	a2,a4,a7
    c480:	40a60633          	sub	a2,a2,a0
    c484:	00861513          	sll	a0,a2,0x8
    c488:	50055e63          	bgez	a0,c9a4 <__adddf3+0x874>
    c48c:	40bf05b3          	sub	a1,t5,a1
    c490:	40e88733          	sub	a4,a7,a4
    c494:	00bf3f33          	sltu	t5,t5,a1
    c498:	41e70733          	sub	a4,a4,t5
    c49c:	00871613          	sll	a2,a4,0x8
    c4a0:	00058493          	mv	s1,a1
    c4a4:	52065e63          	bgez	a2,c9e0 <__adddf3+0x8b0>
    c4a8:	ff8007b7          	lui	a5,0xff800
    c4ac:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c4b0:	00f77733          	and	a4,a4,a5
    c4b4:	00068e13          	mv	t3,a3
    c4b8:	00100793          	li	a5,1
    c4bc:	df9ff06f          	j	c2b4 <__adddf3+0x184>
    c4c0:	7ff00693          	li	a3,2047
    c4c4:	10d90663          	beq	s2,a3,c5d0 <__adddf3+0x4a0>
    c4c8:	03800693          	li	a3,56
    c4cc:	00100993          	li	s3,1
    c4d0:	f0f6c6e3          	blt	a3,a5,c3dc <__adddf3+0x2ac>
    c4d4:	008006b7          	lui	a3,0x800
    c4d8:	00d8e8b3          	or	a7,a7,a3
    c4dc:	ed1ff06f          	j	c3ac <__adddf3+0x27c>
    c4e0:	00048513          	mv	a0,s1
    c4e4:	08d020ef          	jal	ed70 <__clzsi2>
    c4e8:	01850793          	add	a5,a0,24
    c4ec:	01f00693          	li	a3,31
    c4f0:	d2f6d8e3          	bge	a3,a5,c220 <__adddf3+0xf0>
    c4f4:	ff850713          	add	a4,a0,-8
    c4f8:	00e49733          	sll	a4,s1,a4
    c4fc:	2327c663          	blt	a5,s2,c728 <__adddf3+0x5f8>
    c500:	41278933          	sub	s2,a5,s2
    c504:	00190793          	add	a5,s2,1
    c508:	48f6d663          	bge	a3,a5,c994 <__adddf3+0x864>
    c50c:	fe190913          	add	s2,s2,-31
    c510:	02000693          	li	a3,32
    c514:	012754b3          	srl	s1,a4,s2
    c518:	00d78c63          	beq	a5,a3,c530 <__adddf3+0x400>
    c51c:	04000693          	li	a3,64
    c520:	40f687b3          	sub	a5,a3,a5
    c524:	00f71733          	sll	a4,a4,a5
    c528:	00e03733          	snez	a4,a4
    c52c:	00e4e4b3          	or	s1,s1,a4
    c530:	00000913          	li	s2,0
    c534:	0074f793          	and	a5,s1,7
    c538:	d2079ce3          	bnez	a5,c270 <__adddf3+0x140>
    c53c:	00090793          	mv	a5,s2
    c540:	0034d613          	srl	a2,s1,0x3
    c544:	00098713          	mv	a4,s3
    c548:	0c00006f          	j	c608 <__adddf3+0x4d8>
    c54c:	7ff00793          	li	a5,2047
    c550:	00000713          	li	a4,0
    c554:	00000813          	li	a6,0
    c558:	d71ff06f          	j	c2c8 <__adddf3+0x198>
    c55c:	0c078a63          	beqz	a5,c630 <__adddf3+0x500>
    c560:	412307b3          	sub	a5,t1,s2
    c564:	1e090263          	beqz	s2,c748 <__adddf3+0x618>
    c568:	7ff00693          	li	a3,2047
    c56c:	32d30863          	beq	t1,a3,c89c <__adddf3+0x76c>
    c570:	03800693          	li	a3,56
    c574:	00100993          	li	s3,1
    c578:	02f6ce63          	blt	a3,a5,c5b4 <__adddf3+0x484>
    c57c:	008006b7          	lui	a3,0x800
    c580:	00d76733          	or	a4,a4,a3
    c584:	01f00693          	li	a3,31
    c588:	3cf6c863          	blt	a3,a5,c958 <__adddf3+0x828>
    c58c:	02000693          	li	a3,32
    c590:	40f686b3          	sub	a3,a3,a5
    c594:	00d719b3          	sll	s3,a4,a3
    c598:	00f5d633          	srl	a2,a1,a5
    c59c:	00d596b3          	sll	a3,a1,a3
    c5a0:	00c9e9b3          	or	s3,s3,a2
    c5a4:	00d036b3          	snez	a3,a3
    c5a8:	00f75733          	srl	a4,a4,a5
    c5ac:	00d9e9b3          	or	s3,s3,a3
    c5b0:	00e888b3          	add	a7,a7,a4
    c5b4:	01e98733          	add	a4,s3,t5
    c5b8:	013739b3          	sltu	s3,a4,s3
    c5bc:	00070493          	mv	s1,a4
    c5c0:	011989b3          	add	s3,s3,a7
    c5c4:	00030913          	mv	s2,t1
    c5c8:	e25ff06f          	j	c3ec <__adddf3+0x2bc>
    c5cc:	02081063          	bnez	a6,c5ec <__adddf3+0x4bc>
    c5d0:	00351613          	sll	a2,a0,0x3
    c5d4:	00365613          	srl	a2,a2,0x3
    c5d8:	01d71813          	sll	a6,a4,0x1d
    c5dc:	00c86833          	or	a6,a6,a2
    c5e0:	00375713          	srl	a4,a4,0x3
    c5e4:	01076733          	or	a4,a4,a6
    c5e8:	18070663          	beqz	a4,c774 <__adddf3+0x644>
    c5ec:	00000e13          	li	t3,0
    c5f0:	7ff00793          	li	a5,2047
    c5f4:	00080737          	lui	a4,0x80
    c5f8:	00000813          	li	a6,0
    c5fc:	ccdff06f          	j	c2c8 <__adddf3+0x198>
    c600:	00351613          	sll	a2,a0,0x3
    c604:	00365613          	srl	a2,a2,0x3
    c608:	01d71813          	sll	a6,a4,0x1d
    c60c:	7ff00693          	li	a3,2047
    c610:	00c86833          	or	a6,a6,a2
    c614:	00375713          	srl	a4,a4,0x3
    c618:	fcd786e3          	beq	a5,a3,c5e4 <__adddf3+0x4b4>
    c61c:	00c71713          	sll	a4,a4,0xc
    c620:	00c75713          	srl	a4,a4,0xc
    c624:	7ff7f793          	and	a5,a5,2047
    c628:	00040e13          	mv	t3,s0
    c62c:	c9dff06f          	j	c2c8 <__adddf3+0x198>
    c630:	00190693          	add	a3,s2,1
    c634:	7fe6f813          	and	a6,a3,2046
    c638:	14081863          	bnez	a6,c788 <__adddf3+0x658>
    c63c:	00b766b3          	or	a3,a4,a1
    c640:	28091c63          	bnez	s2,c8d8 <__adddf3+0x7a8>
    c644:	30068263          	beqz	a3,c948 <__adddf3+0x818>
    c648:	01e8e6b3          	or	a3,a7,t5
    c64c:	22068863          	beqz	a3,c87c <__adddf3+0x74c>
    c650:	01e587b3          	add	a5,a1,t5
    c654:	00b7b5b3          	sltu	a1,a5,a1
    c658:	01170733          	add	a4,a4,a7
    c65c:	00b70733          	add	a4,a4,a1
    c660:	0037d813          	srl	a6,a5,0x3
    c664:	00871793          	sll	a5,a4,0x8
    c668:	00040e13          	mv	t3,s0
    c66c:	3407de63          	bgez	a5,c9c8 <__adddf3+0x898>
    c670:	ff8007b7          	lui	a5,0xff800
    c674:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c678:	00f77733          	and	a4,a4,a5
    c67c:	01d71793          	sll	a5,a4,0x1d
    c680:	00375713          	srl	a4,a4,0x3
    c684:	0107e833          	or	a6,a5,a6
    c688:	01d77733          	and	a4,a4,t4
    c68c:	00100793          	li	a5,1
    c690:	c39ff06f          	j	c2c8 <__adddf3+0x198>
    c694:	41e58833          	sub	a6,a1,t5
    c698:	0105b7b3          	sltu	a5,a1,a6
    c69c:	411709b3          	sub	s3,a4,a7
    c6a0:	40f989b3          	sub	s3,s3,a5
    c6a4:	00899793          	sll	a5,s3,0x8
    c6a8:	00080493          	mv	s1,a6
    c6ac:	1007c663          	bltz	a5,c7b8 <__adddf3+0x688>
    c6b0:	01386833          	or	a6,a6,s3
    c6b4:	b4081ee3          	bnez	a6,c210 <__adddf3+0xe0>
    c6b8:	00000e13          	li	t3,0
    c6bc:	00000793          	li	a5,0
    c6c0:	00000713          	li	a4,0
    c6c4:	c05ff06f          	j	c2c8 <__adddf3+0x198>
    c6c8:	7ff00513          	li	a0,2047
    c6cc:	1aa30e63          	beq	t1,a0,c888 <__adddf3+0x758>
    c6d0:	03800513          	li	a0,56
    c6d4:	00100613          	li	a2,1
    c6d8:	c8f544e3          	blt	a0,a5,c360 <__adddf3+0x230>
    c6dc:	00800637          	lui	a2,0x800
    c6e0:	00c76733          	or	a4,a4,a2
    c6e4:	c4dff06f          	j	c330 <__adddf3+0x200>
    c6e8:	ff8009b7          	lui	s3,0xff800
    c6ec:	fff98993          	add	s3,s3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c6f0:	40f90933          	sub	s2,s2,a5
    c6f4:	013779b3          	and	s3,a4,s3
    c6f8:	b71ff06f          	j	c268 <__adddf3+0x138>
    c6fc:	fe078693          	add	a3,a5,-32
    c700:	02000613          	li	a2,32
    c704:	00d8d6b3          	srl	a3,a7,a3
    c708:	00c78a63          	beq	a5,a2,c71c <__adddf3+0x5ec>
    c70c:	04000613          	li	a2,64
    c710:	40f607b3          	sub	a5,a2,a5
    c714:	00f897b3          	sll	a5,a7,a5
    c718:	00ff6f33          	or	t5,t5,a5
    c71c:	01e03633          	snez	a2,t5
    c720:	00d66633          	or	a2,a2,a3
    c724:	ac9ff06f          	j	c1ec <__adddf3+0xbc>
    c728:	ff8006b7          	lui	a3,0xff800
    c72c:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    c730:	40f907b3          	sub	a5,s2,a5
    c734:	00d77733          	and	a4,a4,a3
    c738:	01d71813          	sll	a6,a4,0x1d
    c73c:	01386833          	or	a6,a6,s3
    c740:	00375713          	srl	a4,a4,0x3
    c744:	ed9ff06f          	j	c61c <__adddf3+0x4ec>
    c748:	00b766b3          	or	a3,a4,a1
    c74c:	1e068663          	beqz	a3,c938 <__adddf3+0x808>
    c750:	fff78693          	add	a3,a5,-1
    c754:	0a068e63          	beqz	a3,c810 <__adddf3+0x6e0>
    c758:	7ff00513          	li	a0,2047
    c75c:	14a78063          	beq	a5,a0,c89c <__adddf3+0x76c>
    c760:	03800793          	li	a5,56
    c764:	00100993          	li	s3,1
    c768:	e4d7c6e3          	blt	a5,a3,c5b4 <__adddf3+0x484>
    c76c:	00068793          	mv	a5,a3
    c770:	e15ff06f          	j	c584 <__adddf3+0x454>
    c774:	00040e13          	mv	t3,s0
    c778:	7ff00793          	li	a5,2047
    c77c:	00000713          	li	a4,0
    c780:	00000813          	li	a6,0
    c784:	b45ff06f          	j	c2c8 <__adddf3+0x198>
    c788:	7ff00793          	li	a5,2047
    c78c:	fef684e3          	beq	a3,a5,c774 <__adddf3+0x644>
    c790:	01e58f33          	add	t5,a1,t5
    c794:	00bf35b3          	sltu	a1,t5,a1
    c798:	011707b3          	add	a5,a4,a7
    c79c:	00b787b3          	add	a5,a5,a1
    c7a0:	01f79613          	sll	a2,a5,0x1f
    c7a4:	001f5f13          	srl	t5,t5,0x1
    c7a8:	01e664b3          	or	s1,a2,t5
    c7ac:	0017d993          	srl	s3,a5,0x1
    c7b0:	00068913          	mv	s2,a3
    c7b4:	ab5ff06f          	j	c268 <__adddf3+0x138>
    c7b8:	40bf0633          	sub	a2,t5,a1
    c7bc:	40e887b3          	sub	a5,a7,a4
    c7c0:	00cf3733          	sltu	a4,t5,a2
    c7c4:	00060493          	mv	s1,a2
    c7c8:	40e789b3          	sub	s3,a5,a4
    c7cc:	00068413          	mv	s0,a3
    c7d0:	a41ff06f          	j	c210 <__adddf3+0xe0>
    c7d4:	00361613          	sll	a2,a2,0x3
    c7d8:	00365613          	srl	a2,a2,0x3
    c7dc:	00068413          	mv	s0,a3
    c7e0:	00088713          	mv	a4,a7
    c7e4:	e25ff06f          	j	c608 <__adddf3+0x4d8>
    c7e8:	de0312e3          	bnez	t1,c5cc <__adddf3+0x49c>
    c7ec:	1c080663          	beqz	a6,c9b8 <__adddf3+0x888>
    c7f0:	0038d713          	srl	a4,a7,0x3
    c7f4:	00361613          	sll	a2,a2,0x3
    c7f8:	01d89893          	sll	a7,a7,0x1d
    c7fc:	01176733          	or	a4,a4,a7
    c800:	00365613          	srl	a2,a2,0x3
    c804:	00c76733          	or	a4,a4,a2
    c808:	00068413          	mv	s0,a3
    c80c:	dddff06f          	j	c5e8 <__adddf3+0x4b8>
    c810:	01e58f33          	add	t5,a1,t5
    c814:	011708b3          	add	a7,a4,a7
    c818:	00bf35b3          	sltu	a1,t5,a1
    c81c:	00b889b3          	add	s3,a7,a1
    c820:	00899793          	sll	a5,s3,0x8
    c824:	000f0493          	mv	s1,t5
    c828:	0e07d463          	bgez	a5,c910 <__adddf3+0x7e0>
    c82c:	00200913          	li	s2,2
    c830:	bd1ff06f          	j	c400 <__adddf3+0x2d0>
    c834:	41e58f33          	sub	t5,a1,t5
    c838:	411708b3          	sub	a7,a4,a7
    c83c:	01e5b5b3          	sltu	a1,a1,t5
    c840:	000f0493          	mv	s1,t5
    c844:	40b889b3          	sub	s3,a7,a1
    c848:	00100913          	li	s2,1
    c84c:	9b1ff06f          	j	c1fc <__adddf3+0xcc>
    c850:	fe078693          	add	a3,a5,-32
    c854:	02000613          	li	a2,32
    c858:	00d8d6b3          	srl	a3,a7,a3
    c85c:	00c78a63          	beq	a5,a2,c870 <__adddf3+0x740>
    c860:	04000613          	li	a2,64
    c864:	40f607b3          	sub	a5,a2,a5
    c868:	00f897b3          	sll	a5,a7,a5
    c86c:	00ff6f33          	or	t5,t5,a5
    c870:	01e039b3          	snez	s3,t5
    c874:	00d9e9b3          	or	s3,s3,a3
    c878:	b65ff06f          	j	c3dc <__adddf3+0x2ac>
    c87c:	00351613          	sll	a2,a0,0x3
    c880:	00365993          	srl	s3,a2,0x3
    c884:	eb5ff06f          	j	c738 <__adddf3+0x608>
    c888:	00361613          	sll	a2,a2,0x3
    c88c:	00365613          	srl	a2,a2,0x3
    c890:	00068413          	mv	s0,a3
    c894:	00088713          	mv	a4,a7
    c898:	d41ff06f          	j	c5d8 <__adddf3+0x4a8>
    c89c:	00361613          	sll	a2,a2,0x3
    c8a0:	00365613          	srl	a2,a2,0x3
    c8a4:	00088713          	mv	a4,a7
    c8a8:	d31ff06f          	j	c5d8 <__adddf3+0x4a8>
    c8ac:	fe078513          	add	a0,a5,-32
    c8b0:	02000613          	li	a2,32
    c8b4:	00a75533          	srl	a0,a4,a0
    c8b8:	00c78a63          	beq	a5,a2,c8cc <__adddf3+0x79c>
    c8bc:	04000613          	li	a2,64
    c8c0:	40f607b3          	sub	a5,a2,a5
    c8c4:	00f717b3          	sll	a5,a4,a5
    c8c8:	00f5e5b3          	or	a1,a1,a5
    c8cc:	00b03633          	snez	a2,a1
    c8d0:	00a66633          	or	a2,a2,a0
    c8d4:	a8dff06f          	j	c360 <__adddf3+0x230>
    c8d8:	fc0682e3          	beqz	a3,c89c <__adddf3+0x76c>
    c8dc:	01e8ef33          	or	t5,a7,t5
    c8e0:	d00f16e3          	bnez	t5,c5ec <__adddf3+0x4bc>
    c8e4:	cedff06f          	j	c5d0 <__adddf3+0x4a0>
    c8e8:	dc0808e3          	beqz	a6,c6b8 <__adddf3+0x588>
    c8ec:	00361813          	sll	a6,a2,0x3
    c8f0:	01d89793          	sll	a5,a7,0x1d
    c8f4:	00385813          	srl	a6,a6,0x3
    c8f8:	0038d713          	srl	a4,a7,0x3
    c8fc:	00f86833          	or	a6,a6,a5
    c900:	01d77733          	and	a4,a4,t4
    c904:	00068e13          	mv	t3,a3
    c908:	00000793          	li	a5,0
    c90c:	9bdff06f          	j	c2c8 <__adddf3+0x198>
    c910:	00100793          	li	a5,1
    c914:	c2dff06f          	j	c540 <__adddf3+0x410>
    c918:	40bf05b3          	sub	a1,t5,a1
    c91c:	40e888b3          	sub	a7,a7,a4
    c920:	00bf3733          	sltu	a4,t5,a1
    c924:	00058493          	mv	s1,a1
    c928:	40e889b3          	sub	s3,a7,a4
    c92c:	00068413          	mv	s0,a3
    c930:	00100913          	li	s2,1
    c934:	8c9ff06f          	j	c1fc <__adddf3+0xcc>
    c938:	00361613          	sll	a2,a2,0x3
    c93c:	00365613          	srl	a2,a2,0x3
    c940:	00088713          	mv	a4,a7
    c944:	cc5ff06f          	j	c608 <__adddf3+0x4d8>
    c948:	00361613          	sll	a2,a2,0x3
    c94c:	00365993          	srl	s3,a2,0x3
    c950:	00088713          	mv	a4,a7
    c954:	de5ff06f          	j	c738 <__adddf3+0x608>
    c958:	fe078693          	add	a3,a5,-32
    c95c:	02000613          	li	a2,32
    c960:	00d756b3          	srl	a3,a4,a3
    c964:	00c78a63          	beq	a5,a2,c978 <__adddf3+0x848>
    c968:	04000613          	li	a2,64
    c96c:	40f607b3          	sub	a5,a2,a5
    c970:	00f717b3          	sll	a5,a4,a5
    c974:	00f5e5b3          	or	a1,a1,a5
    c978:	00b039b3          	snez	s3,a1
    c97c:	00d9e9b3          	or	s3,s3,a3
    c980:	c35ff06f          	j	c5b4 <__adddf3+0x484>
    c984:	0034d613          	srl	a2,s1,0x3
    c988:	00090793          	mv	a5,s2
    c98c:	00098713          	mv	a4,s3
    c990:	c79ff06f          	j	c608 <__adddf3+0x4d8>
    c994:	02000693          	li	a3,32
    c998:	40f686b3          	sub	a3,a3,a5
    c99c:	00000613          	li	a2,0
    c9a0:	8b5ff06f          	j	c254 <__adddf3+0x124>
    c9a4:	00c9e833          	or	a6,s3,a2
    c9a8:	d00808e3          	beqz	a6,c6b8 <__adddf3+0x588>
    c9ac:	0039d993          	srl	s3,s3,0x3
    c9b0:	00060713          	mv	a4,a2
    c9b4:	d85ff06f          	j	c738 <__adddf3+0x608>
    c9b8:	00000e13          	li	t3,0
    c9bc:	7ff00793          	li	a5,2047
    c9c0:	00080737          	lui	a4,0x80
    c9c4:	905ff06f          	j	c2c8 <__adddf3+0x198>
    c9c8:	01d71793          	sll	a5,a4,0x1d
    c9cc:	00375713          	srl	a4,a4,0x3
    c9d0:	0107e833          	or	a6,a5,a6
    c9d4:	01d77733          	and	a4,a4,t4
    c9d8:	00000793          	li	a5,0
    c9dc:	8edff06f          	j	c2c8 <__adddf3+0x198>
    c9e0:	01d71813          	sll	a6,a4,0x1d
    c9e4:	0035d593          	srl	a1,a1,0x3
    c9e8:	00b86833          	or	a6,a6,a1
    c9ec:	00375713          	srl	a4,a4,0x3
    c9f0:	00068413          	mv	s0,a3
    c9f4:	c29ff06f          	j	c61c <__adddf3+0x4ec>

0000c9f8 <__divdf3>:
    c9f8:	fb010113          	add	sp,sp,-80
    c9fc:	0145d793          	srl	a5,a1,0x14
    ca00:	04812423          	sw	s0,72(sp)
    ca04:	04912223          	sw	s1,68(sp)
    ca08:	05212023          	sw	s2,64(sp)
    ca0c:	03412c23          	sw	s4,56(sp)
    ca10:	03512a23          	sw	s5,52(sp)
    ca14:	00c59493          	sll	s1,a1,0xc
    ca18:	04112623          	sw	ra,76(sp)
    ca1c:	03312e23          	sw	s3,60(sp)
    ca20:	03612823          	sw	s6,48(sp)
    ca24:	03712623          	sw	s7,44(sp)
    ca28:	03812423          	sw	s8,40(sp)
    ca2c:	7ff7f793          	and	a5,a5,2047
    ca30:	00050413          	mv	s0,a0
    ca34:	00060a13          	mv	s4,a2
    ca38:	00068913          	mv	s2,a3
    ca3c:	00c4d493          	srl	s1,s1,0xc
    ca40:	01f5da93          	srl	s5,a1,0x1f
    ca44:	18078c63          	beqz	a5,cbdc <__divdf3+0x1e4>
    ca48:	7ff00713          	li	a4,2047
    ca4c:	08e78a63          	beq	a5,a4,cae0 <__divdf3+0xe8>
    ca50:	01d55b13          	srl	s6,a0,0x1d
    ca54:	00349493          	sll	s1,s1,0x3
    ca58:	009b64b3          	or	s1,s6,s1
    ca5c:	00800737          	lui	a4,0x800
    ca60:	00e4eb33          	or	s6,s1,a4
    ca64:	00351b93          	sll	s7,a0,0x3
    ca68:	c0178993          	add	s3,a5,-1023
    ca6c:	00000493          	li	s1,0
    ca70:	00000c13          	li	s8,0
    ca74:	01495793          	srl	a5,s2,0x14
    ca78:	00c91413          	sll	s0,s2,0xc
    ca7c:	7ff7f793          	and	a5,a5,2047
    ca80:	00c45413          	srl	s0,s0,0xc
    ca84:	01f95913          	srl	s2,s2,0x1f
    ca88:	08078463          	beqz	a5,cb10 <__divdf3+0x118>
    ca8c:	7ff00713          	li	a4,2047
    ca90:	18e78c63          	beq	a5,a4,cc28 <__divdf3+0x230>
    ca94:	00341413          	sll	s0,s0,0x3
    ca98:	01da5713          	srl	a4,s4,0x1d
    ca9c:	00876733          	or	a4,a4,s0
    caa0:	c0178793          	add	a5,a5,-1023
    caa4:	00800437          	lui	s0,0x800
    caa8:	40f989b3          	sub	s3,s3,a5
    caac:	00876433          	or	s0,a4,s0
    cab0:	003a1813          	sll	a6,s4,0x3
    cab4:	00000793          	li	a5,0
    cab8:	00f00713          	li	a4,15
    cabc:	012aca33          	xor	s4,s5,s2
    cac0:	24976663          	bltu	a4,s1,cd0c <__divdf3+0x314>
    cac4:	00003697          	auipc	a3,0x3
    cac8:	c6c68693          	add	a3,a3,-916 # f730 <__mprec_tens+0xc8>
    cacc:	00249493          	sll	s1,s1,0x2
    cad0:	00d484b3          	add	s1,s1,a3
    cad4:	0004a703          	lw	a4,0(s1)
    cad8:	00d70733          	add	a4,a4,a3
    cadc:	00070067          	jr	a4 # 800000 <__neorv32_ram_size+0x780000>
    cae0:	00a4eb33          	or	s6,s1,a0
    cae4:	1c0b1e63          	bnez	s6,ccc0 <__divdf3+0x2c8>
    cae8:	01495793          	srl	a5,s2,0x14
    caec:	00c91413          	sll	s0,s2,0xc
    caf0:	7ff7f793          	and	a5,a5,2047
    caf4:	00000b93          	li	s7,0
    caf8:	00800493          	li	s1,8
    cafc:	7ff00993          	li	s3,2047
    cb00:	00200c13          	li	s8,2
    cb04:	00c45413          	srl	s0,s0,0xc
    cb08:	01f95913          	srl	s2,s2,0x1f
    cb0c:	f80790e3          	bnez	a5,ca8c <__divdf3+0x94>
    cb10:	01446833          	or	a6,s0,s4
    cb14:	1c080263          	beqz	a6,ccd8 <__divdf3+0x2e0>
    cb18:	5c040663          	beqz	s0,d0e4 <__divdf3+0x6ec>
    cb1c:	00040513          	mv	a0,s0
    cb20:	250020ef          	jal	ed70 <__clzsi2>
    cb24:	00050793          	mv	a5,a0
    cb28:	ff550693          	add	a3,a0,-11
    cb2c:	01d00713          	li	a4,29
    cb30:	ff878813          	add	a6,a5,-8
    cb34:	40d70733          	sub	a4,a4,a3
    cb38:	01041433          	sll	s0,s0,a6
    cb3c:	00ea5733          	srl	a4,s4,a4
    cb40:	00876433          	or	s0,a4,s0
    cb44:	010a1833          	sll	a6,s4,a6
    cb48:	013787b3          	add	a5,a5,s3
    cb4c:	3f378993          	add	s3,a5,1011
    cb50:	00000793          	li	a5,0
    cb54:	f65ff06f          	j	cab8 <__divdf3+0xc0>
    cb58:	40f70733          	sub	a4,a4,a5
    cb5c:	03800693          	li	a3,56
    cb60:	60e6d063          	bge	a3,a4,d160 <__divdf3+0x768>
    cb64:	00000793          	li	a5,0
    cb68:	00000693          	li	a3,0
    cb6c:	00000713          	li	a4,0
    cb70:	04c12083          	lw	ra,76(sp)
    cb74:	04812403          	lw	s0,72(sp)
    cb78:	01479793          	sll	a5,a5,0x14
    cb7c:	00d7e7b3          	or	a5,a5,a3
    cb80:	01fa1693          	sll	a3,s4,0x1f
    cb84:	00d7e7b3          	or	a5,a5,a3
    cb88:	04412483          	lw	s1,68(sp)
    cb8c:	04012903          	lw	s2,64(sp)
    cb90:	03c12983          	lw	s3,60(sp)
    cb94:	03812a03          	lw	s4,56(sp)
    cb98:	03412a83          	lw	s5,52(sp)
    cb9c:	03012b03          	lw	s6,48(sp)
    cba0:	02c12b83          	lw	s7,44(sp)
    cba4:	02812c03          	lw	s8,40(sp)
    cba8:	00070513          	mv	a0,a4
    cbac:	00078593          	mv	a1,a5
    cbb0:	05010113          	add	sp,sp,80
    cbb4:	00008067          	ret
    cbb8:	7ff00793          	li	a5,2047
    cbbc:	00000693          	li	a3,0
    cbc0:	00000713          	li	a4,0
    cbc4:	fadff06f          	j	cb70 <__divdf3+0x178>
    cbc8:	00000a13          	li	s4,0
    cbcc:	7ff00793          	li	a5,2047
    cbd0:	000806b7          	lui	a3,0x80
    cbd4:	00000713          	li	a4,0
    cbd8:	f99ff06f          	j	cb70 <__divdf3+0x178>
    cbdc:	00a4eb33          	or	s6,s1,a0
    cbe0:	100b0c63          	beqz	s6,ccf8 <__divdf3+0x300>
    cbe4:	52048463          	beqz	s1,d10c <__divdf3+0x714>
    cbe8:	00048513          	mv	a0,s1
    cbec:	184020ef          	jal	ed70 <__clzsi2>
    cbf0:	00050713          	mv	a4,a0
    cbf4:	ff550793          	add	a5,a0,-11
    cbf8:	01d00b13          	li	s6,29
    cbfc:	ff870b93          	add	s7,a4,-8
    cc00:	40fb0b33          	sub	s6,s6,a5
    cc04:	017494b3          	sll	s1,s1,s7
    cc08:	01645b33          	srl	s6,s0,s6
    cc0c:	009b6b33          	or	s6,s6,s1
    cc10:	01741bb3          	sll	s7,s0,s7
    cc14:	c0d00793          	li	a5,-1011
    cc18:	40e789b3          	sub	s3,a5,a4
    cc1c:	00000493          	li	s1,0
    cc20:	00000c13          	li	s8,0
    cc24:	e51ff06f          	j	ca74 <__divdf3+0x7c>
    cc28:	01446833          	or	a6,s0,s4
    cc2c:	80198993          	add	s3,s3,-2047
    cc30:	0a081c63          	bnez	a6,cce8 <__divdf3+0x2f0>
    cc34:	0024e493          	or	s1,s1,2
    cc38:	00000413          	li	s0,0
    cc3c:	00200793          	li	a5,2
    cc40:	e79ff06f          	j	cab8 <__divdf3+0xc0>
    cc44:	000a8913          	mv	s2,s5
    cc48:	000b0413          	mv	s0,s6
    cc4c:	000b8813          	mv	a6,s7
    cc50:	00200793          	li	a5,2
    cc54:	60fc0863          	beq	s8,a5,d264 <__divdf3+0x86c>
    cc58:	00300793          	li	a5,3
    cc5c:	f6fc06e3          	beq	s8,a5,cbc8 <__divdf3+0x1d0>
    cc60:	00100793          	li	a5,1
    cc64:	00090a13          	mv	s4,s2
    cc68:	eefc0ee3          	beq	s8,a5,cb64 <__divdf3+0x16c>
    cc6c:	3ff98793          	add	a5,s3,1023
    cc70:	3cf05263          	blez	a5,d034 <__divdf3+0x63c>
    cc74:	00787713          	and	a4,a6,7
    cc78:	5c071663          	bnez	a4,d244 <__divdf3+0x84c>
    cc7c:	00741713          	sll	a4,s0,0x7
    cc80:	00075a63          	bgez	a4,cc94 <__divdf3+0x29c>
    cc84:	ff0007b7          	lui	a5,0xff000
    cc88:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    cc8c:	00f47433          	and	s0,s0,a5
    cc90:	40098793          	add	a5,s3,1024
    cc94:	7fe00713          	li	a4,2046
    cc98:	f2f740e3          	blt	a4,a5,cbb8 <__divdf3+0x1c0>
    cc9c:	00385813          	srl	a6,a6,0x3
    cca0:	01d41713          	sll	a4,s0,0x1d
    cca4:	00941693          	sll	a3,s0,0x9
    cca8:	01076733          	or	a4,a4,a6
    ccac:	00c6d693          	srl	a3,a3,0xc
    ccb0:	7ff7f793          	and	a5,a5,2047
    ccb4:	ebdff06f          	j	cb70 <__divdf3+0x178>
    ccb8:	00078c13          	mv	s8,a5
    ccbc:	f95ff06f          	j	cc50 <__divdf3+0x258>
    ccc0:	00048b13          	mv	s6,s1
    ccc4:	00050b93          	mv	s7,a0
    ccc8:	00c00493          	li	s1,12
    cccc:	7ff00993          	li	s3,2047
    ccd0:	00300c13          	li	s8,3
    ccd4:	da1ff06f          	j	ca74 <__divdf3+0x7c>
    ccd8:	0014e493          	or	s1,s1,1
    ccdc:	00000413          	li	s0,0
    cce0:	00100793          	li	a5,1
    cce4:	dd5ff06f          	j	cab8 <__divdf3+0xc0>
    cce8:	0034e493          	or	s1,s1,3
    ccec:	000a0813          	mv	a6,s4
    ccf0:	00300793          	li	a5,3
    ccf4:	dc5ff06f          	j	cab8 <__divdf3+0xc0>
    ccf8:	00000b93          	li	s7,0
    ccfc:	00400493          	li	s1,4
    cd00:	00000993          	li	s3,0
    cd04:	00100c13          	li	s8,1
    cd08:	d6dff06f          	j	ca74 <__divdf3+0x7c>
    cd0c:	03912223          	sw	s9,36(sp)
    cd10:	03a12023          	sw	s10,32(sp)
    cd14:	01b12e23          	sw	s11,28(sp)
    cd18:	3b646a63          	bltu	s0,s6,d0cc <__divdf3+0x6d4>
    cd1c:	3a8b0663          	beq	s6,s0,d0c8 <__divdf3+0x6d0>
    cd20:	fff98993          	add	s3,s3,-1
    cd24:	000b8c13          	mv	s8,s7
    cd28:	000b0493          	mv	s1,s6
    cd2c:	00000d13          	li	s10,0
    cd30:	01885c93          	srl	s9,a6,0x18
    cd34:	00841413          	sll	s0,s0,0x8
    cd38:	01045913          	srl	s2,s0,0x10
    cd3c:	008cecb3          	or	s9,s9,s0
    cd40:	00090593          	mv	a1,s2
    cd44:	00048513          	mv	a0,s1
    cd48:	010c9b13          	sll	s6,s9,0x10
    cd4c:	00881a93          	sll	s5,a6,0x8
    cd50:	010b5b13          	srl	s6,s6,0x10
    cd54:	771010ef          	jal	ecc4 <__hidden___udivsi3>
    cd58:	00050593          	mv	a1,a0
    cd5c:	00050413          	mv	s0,a0
    cd60:	000b0513          	mv	a0,s6
    cd64:	69d010ef          	jal	ec00 <__mulsi3>
    cd68:	00050793          	mv	a5,a0
    cd6c:	00090593          	mv	a1,s2
    cd70:	00048513          	mv	a0,s1
    cd74:	00078493          	mv	s1,a5
    cd78:	795010ef          	jal	ed0c <__umodsi3>
    cd7c:	01051513          	sll	a0,a0,0x10
    cd80:	010c5793          	srl	a5,s8,0x10
    cd84:	00a7e7b3          	or	a5,a5,a0
    cd88:	0097fa63          	bgeu	a5,s1,cd9c <__divdf3+0x3a4>
    cd8c:	00fc87b3          	add	a5,s9,a5
    cd90:	fff40713          	add	a4,s0,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    cd94:	3b97fe63          	bgeu	a5,s9,d150 <__divdf3+0x758>
    cd98:	00070413          	mv	s0,a4
    cd9c:	409784b3          	sub	s1,a5,s1
    cda0:	00090593          	mv	a1,s2
    cda4:	00048513          	mv	a0,s1
    cda8:	71d010ef          	jal	ecc4 <__hidden___udivsi3>
    cdac:	00050593          	mv	a1,a0
    cdb0:	00050b93          	mv	s7,a0
    cdb4:	000b0513          	mv	a0,s6
    cdb8:	649010ef          	jal	ec00 <__mulsi3>
    cdbc:	00050793          	mv	a5,a0
    cdc0:	00090593          	mv	a1,s2
    cdc4:	00048513          	mv	a0,s1
    cdc8:	00078493          	mv	s1,a5
    cdcc:	741010ef          	jal	ed0c <__umodsi3>
    cdd0:	010c1793          	sll	a5,s8,0x10
    cdd4:	01051513          	sll	a0,a0,0x10
    cdd8:	0107d793          	srl	a5,a5,0x10
    cddc:	00a7e7b3          	or	a5,a5,a0
    cde0:	0097fa63          	bgeu	a5,s1,cdf4 <__divdf3+0x3fc>
    cde4:	00fc87b3          	add	a5,s9,a5
    cde8:	fffb8713          	add	a4,s7,-1
    cdec:	3597fa63          	bgeu	a5,s9,d140 <__divdf3+0x748>
    cdf0:	00070b93          	mv	s7,a4
    cdf4:	00010337          	lui	t1,0x10
    cdf8:	01041413          	sll	s0,s0,0x10
    cdfc:	01746433          	or	s0,s0,s7
    ce00:	fff30d93          	add	s11,t1,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    ce04:	01b478b3          	and	a7,s0,s11
    ce08:	01bafdb3          	and	s11,s5,s11
    ce0c:	40978bb3          	sub	s7,a5,s1
    ce10:	010adc13          	srl	s8,s5,0x10
    ce14:	01045793          	srl	a5,s0,0x10
    ce18:	00088513          	mv	a0,a7
    ce1c:	000d8593          	mv	a1,s11
    ce20:	5e1010ef          	jal	ec00 <__mulsi3>
    ce24:	00050813          	mv	a6,a0
    ce28:	000c0593          	mv	a1,s8
    ce2c:	00088513          	mv	a0,a7
    ce30:	5d1010ef          	jal	ec00 <__mulsi3>
    ce34:	00050893          	mv	a7,a0
    ce38:	000d8593          	mv	a1,s11
    ce3c:	00078513          	mv	a0,a5
    ce40:	5c1010ef          	jal	ec00 <__mulsi3>
    ce44:	00050e13          	mv	t3,a0
    ce48:	000c0593          	mv	a1,s8
    ce4c:	00078513          	mv	a0,a5
    ce50:	5b1010ef          	jal	ec00 <__mulsi3>
    ce54:	01085793          	srl	a5,a6,0x10
    ce58:	01c888b3          	add	a7,a7,t3
    ce5c:	011787b3          	add	a5,a5,a7
    ce60:	01c7f463          	bgeu	a5,t3,ce68 <__divdf3+0x470>
    ce64:	00650533          	add	a0,a0,t1
    ce68:	00010637          	lui	a2,0x10
    ce6c:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    ce70:	00c7f4b3          	and	s1,a5,a2
    ce74:	0107d693          	srl	a3,a5,0x10
    ce78:	01049493          	sll	s1,s1,0x10
    ce7c:	00c87833          	and	a6,a6,a2
    ce80:	00a687b3          	add	a5,a3,a0
    ce84:	010484b3          	add	s1,s1,a6
    ce88:	20fbea63          	bltu	s7,a5,d09c <__divdf3+0x6a4>
    ce8c:	20fb8663          	beq	s7,a5,d098 <__divdf3+0x6a0>
    ce90:	409d04b3          	sub	s1,s10,s1
    ce94:	40fb8bb3          	sub	s7,s7,a5
    ce98:	009d3d33          	sltu	s10,s10,s1
    ce9c:	41ab8bb3          	sub	s7,s7,s10
    cea0:	377c8a63          	beq	s9,s7,d214 <__divdf3+0x81c>
    cea4:	00090593          	mv	a1,s2
    cea8:	000b8513          	mv	a0,s7
    ceac:	619010ef          	jal	ecc4 <__hidden___udivsi3>
    ceb0:	00050593          	mv	a1,a0
    ceb4:	00a12623          	sw	a0,12(sp)
    ceb8:	00050d13          	mv	s10,a0
    cebc:	000b0513          	mv	a0,s6
    cec0:	541010ef          	jal	ec00 <__mulsi3>
    cec4:	00050793          	mv	a5,a0
    cec8:	00090593          	mv	a1,s2
    cecc:	000b8513          	mv	a0,s7
    ced0:	00078b93          	mv	s7,a5
    ced4:	639010ef          	jal	ed0c <__umodsi3>
    ced8:	01051513          	sll	a0,a0,0x10
    cedc:	0104d793          	srl	a5,s1,0x10
    cee0:	00a7e7b3          	or	a5,a5,a0
    cee4:	0377f063          	bgeu	a5,s7,cf04 <__divdf3+0x50c>
    cee8:	00fc87b3          	add	a5,s9,a5
    ceec:	fffd0693          	add	a3,s10,-1
    cef0:	3797e263          	bltu	a5,s9,d254 <__divdf3+0x85c>
    cef4:	3777f063          	bgeu	a5,s7,d254 <__divdf3+0x85c>
    cef8:	ffed0713          	add	a4,s10,-2
    cefc:	00e12623          	sw	a4,12(sp)
    cf00:	019787b3          	add	a5,a5,s9
    cf04:	41778bb3          	sub	s7,a5,s7
    cf08:	00090593          	mv	a1,s2
    cf0c:	000b8513          	mv	a0,s7
    cf10:	5b5010ef          	jal	ecc4 <__hidden___udivsi3>
    cf14:	00050593          	mv	a1,a0
    cf18:	00050d13          	mv	s10,a0
    cf1c:	000b0513          	mv	a0,s6
    cf20:	4e1010ef          	jal	ec00 <__mulsi3>
    cf24:	00050793          	mv	a5,a0
    cf28:	00090593          	mv	a1,s2
    cf2c:	000b8513          	mv	a0,s7
    cf30:	00078913          	mv	s2,a5
    cf34:	01049493          	sll	s1,s1,0x10
    cf38:	5d5010ef          	jal	ed0c <__umodsi3>
    cf3c:	01051513          	sll	a0,a0,0x10
    cf40:	0104d493          	srl	s1,s1,0x10
    cf44:	00a4e4b3          	or	s1,s1,a0
    cf48:	0124fe63          	bgeu	s1,s2,cf64 <__divdf3+0x56c>
    cf4c:	009c84b3          	add	s1,s9,s1
    cf50:	fffd0793          	add	a5,s10,-1
    cf54:	3194e463          	bltu	s1,s9,d25c <__divdf3+0x864>
    cf58:	3124f263          	bgeu	s1,s2,d25c <__divdf3+0x864>
    cf5c:	ffed0d13          	add	s10,s10,-2
    cf60:	019484b3          	add	s1,s1,s9
    cf64:	00c12783          	lw	a5,12(sp)
    cf68:	412484b3          	sub	s1,s1,s2
    cf6c:	000d8593          	mv	a1,s11
    cf70:	01079813          	sll	a6,a5,0x10
    cf74:	01a86833          	or	a6,a6,s10
    cf78:	01081313          	sll	t1,a6,0x10
    cf7c:	01035313          	srl	t1,t1,0x10
    cf80:	01085793          	srl	a5,a6,0x10
    cf84:	00030513          	mv	a0,t1
    cf88:	479010ef          	jal	ec00 <__mulsi3>
    cf8c:	00050893          	mv	a7,a0
    cf90:	000c0593          	mv	a1,s8
    cf94:	00030513          	mv	a0,t1
    cf98:	469010ef          	jal	ec00 <__mulsi3>
    cf9c:	00050313          	mv	t1,a0
    cfa0:	000d8593          	mv	a1,s11
    cfa4:	00078513          	mv	a0,a5
    cfa8:	459010ef          	jal	ec00 <__mulsi3>
    cfac:	00050e13          	mv	t3,a0
    cfb0:	000c0593          	mv	a1,s8
    cfb4:	00078513          	mv	a0,a5
    cfb8:	449010ef          	jal	ec00 <__mulsi3>
    cfbc:	0108d793          	srl	a5,a7,0x10
    cfc0:	01c30333          	add	t1,t1,t3
    cfc4:	006787b3          	add	a5,a5,t1
    cfc8:	01c7f663          	bgeu	a5,t3,cfd4 <__divdf3+0x5dc>
    cfcc:	00010737          	lui	a4,0x10
    cfd0:	00e50533          	add	a0,a0,a4
    cfd4:	000106b7          	lui	a3,0x10
    cfd8:	fff68693          	add	a3,a3,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    cfdc:	0107d713          	srl	a4,a5,0x10
    cfe0:	00d7f7b3          	and	a5,a5,a3
    cfe4:	01079793          	sll	a5,a5,0x10
    cfe8:	00d8f8b3          	and	a7,a7,a3
    cfec:	00a70733          	add	a4,a4,a0
    cff0:	011787b3          	add	a5,a5,a7
    cff4:	02e4e063          	bltu	s1,a4,d014 <__divdf3+0x61c>
    cff8:	00e48c63          	beq	s1,a4,d010 <__divdf3+0x618>
    cffc:	02412c83          	lw	s9,36(sp)
    d000:	02012d03          	lw	s10,32(sp)
    d004:	01c12d83          	lw	s11,28(sp)
    d008:	00186813          	or	a6,a6,1
    d00c:	c61ff06f          	j	cc6c <__divdf3+0x274>
    d010:	1c078a63          	beqz	a5,d1e4 <__divdf3+0x7ec>
    d014:	009c84b3          	add	s1,s9,s1
    d018:	fff80613          	add	a2,a6,-1
    d01c:	00048693          	mv	a3,s1
    d020:	1b94ec63          	bltu	s1,s9,d1d8 <__divdf3+0x7e0>
    d024:	24e4ea63          	bltu	s1,a4,d278 <__divdf3+0x880>
    d028:	26e48863          	beq	s1,a4,d298 <__divdf3+0x8a0>
    d02c:	00060813          	mv	a6,a2
    d030:	fcdff06f          	j	cffc <__divdf3+0x604>
    d034:	00100713          	li	a4,1
    d038:	b20790e3          	bnez	a5,cb58 <__divdf3+0x160>
    d03c:	41e98793          	add	a5,s3,1054
    d040:	00f816b3          	sll	a3,a6,a5
    d044:	00d036b3          	snez	a3,a3
    d048:	00f417b3          	sll	a5,s0,a5
    d04c:	00f6e7b3          	or	a5,a3,a5
    d050:	00e85833          	srl	a6,a6,a4
    d054:	00f86833          	or	a6,a6,a5
    d058:	00787793          	and	a5,a6,7
    d05c:	00e45433          	srl	s0,s0,a4
    d060:	02078063          	beqz	a5,d080 <__divdf3+0x688>
    d064:	00f87793          	and	a5,a6,15
    d068:	00400713          	li	a4,4
    d06c:	00e78a63          	beq	a5,a4,d080 <__divdf3+0x688>
    d070:	00480793          	add	a5,a6,4
    d074:	0107b833          	sltu	a6,a5,a6
    d078:	01040433          	add	s0,s0,a6
    d07c:	00078813          	mv	a6,a5
    d080:	00841613          	sll	a2,s0,0x8
    d084:	00100793          	li	a5,1
    d088:	00000693          	li	a3,0
    d08c:	00000713          	li	a4,0
    d090:	ae0640e3          	bltz	a2,cb70 <__divdf3+0x178>
    d094:	1280006f          	j	d1bc <__divdf3+0x7c4>
    d098:	de9d7ce3          	bgeu	s10,s1,ce90 <__divdf3+0x498>
    d09c:	015d06b3          	add	a3,s10,s5
    d0a0:	01a6b633          	sltu	a2,a3,s10
    d0a4:	019605b3          	add	a1,a2,s9
    d0a8:	00bb8bb3          	add	s7,s7,a1
    d0ac:	00068d13          	mv	s10,a3
    d0b0:	fff40593          	add	a1,s0,-1
    d0b4:	077cfe63          	bgeu	s9,s7,d130 <__divdf3+0x738>
    d0b8:	14fbe063          	bltu	s7,a5,d1f8 <__divdf3+0x800>
    d0bc:	13778c63          	beq	a5,s7,d1f4 <__divdf3+0x7fc>
    d0c0:	00058413          	mv	s0,a1
    d0c4:	dcdff06f          	j	ce90 <__divdf3+0x498>
    d0c8:	c50bece3          	bltu	s7,a6,cd20 <__divdf3+0x328>
    d0cc:	01fb1c13          	sll	s8,s6,0x1f
    d0d0:	001bd713          	srl	a4,s7,0x1
    d0d4:	001b5493          	srl	s1,s6,0x1
    d0d8:	00ec6c33          	or	s8,s8,a4
    d0dc:	01fb9d13          	sll	s10,s7,0x1f
    d0e0:	c51ff06f          	j	cd30 <__divdf3+0x338>
    d0e4:	000a0513          	mv	a0,s4
    d0e8:	489010ef          	jal	ed70 <__clzsi2>
    d0ec:	01550693          	add	a3,a0,21
    d0f0:	01c00713          	li	a4,28
    d0f4:	02050793          	add	a5,a0,32
    d0f8:	a2d75ae3          	bge	a4,a3,cb2c <__divdf3+0x134>
    d0fc:	ff850513          	add	a0,a0,-8
    d100:	00000813          	li	a6,0
    d104:	00aa1433          	sll	s0,s4,a0
    d108:	a41ff06f          	j	cb48 <__divdf3+0x150>
    d10c:	465010ef          	jal	ed70 <__clzsi2>
    d110:	01550793          	add	a5,a0,21
    d114:	01c00693          	li	a3,28
    d118:	02050713          	add	a4,a0,32
    d11c:	acf6dee3          	bge	a3,a5,cbf8 <__divdf3+0x200>
    d120:	ff850493          	add	s1,a0,-8
    d124:	00941b33          	sll	s6,s0,s1
    d128:	00000b93          	li	s7,0
    d12c:	ae9ff06f          	j	cc14 <__divdf3+0x21c>
    d130:	f97c98e3          	bne	s9,s7,d0c0 <__divdf3+0x6c8>
    d134:	f80602e3          	beqz	a2,d0b8 <__divdf3+0x6c0>
    d138:	00058413          	mv	s0,a1
    d13c:	d55ff06f          	j	ce90 <__divdf3+0x498>
    d140:	ca97f8e3          	bgeu	a5,s1,cdf0 <__divdf3+0x3f8>
    d144:	ffeb8b93          	add	s7,s7,-2
    d148:	019787b3          	add	a5,a5,s9
    d14c:	ca9ff06f          	j	cdf4 <__divdf3+0x3fc>
    d150:	c497f4e3          	bgeu	a5,s1,cd98 <__divdf3+0x3a0>
    d154:	ffe40413          	add	s0,s0,-2
    d158:	019787b3          	add	a5,a5,s9
    d15c:	c41ff06f          	j	cd9c <__divdf3+0x3a4>
    d160:	01f00693          	li	a3,31
    d164:	ece6dce3          	bge	a3,a4,d03c <__divdf3+0x644>
    d168:	fe100693          	li	a3,-31
    d16c:	40f686b3          	sub	a3,a3,a5
    d170:	02000793          	li	a5,32
    d174:	00d456b3          	srl	a3,s0,a3
    d178:	00f70863          	beq	a4,a5,d188 <__divdf3+0x790>
    d17c:	43e98793          	add	a5,s3,1086
    d180:	00f417b3          	sll	a5,s0,a5
    d184:	00f86833          	or	a6,a6,a5
    d188:	01003833          	snez	a6,a6
    d18c:	00d86833          	or	a6,a6,a3
    d190:	00787713          	and	a4,a6,7
    d194:	00000693          	li	a3,0
    d198:	02070863          	beqz	a4,d1c8 <__divdf3+0x7d0>
    d19c:	00f87793          	and	a5,a6,15
    d1a0:	00400713          	li	a4,4
    d1a4:	00000413          	li	s0,0
    d1a8:	00e78a63          	beq	a5,a4,d1bc <__divdf3+0x7c4>
    d1ac:	00480793          	add	a5,a6,4
    d1b0:	0107b833          	sltu	a6,a5,a6
    d1b4:	01003433          	snez	s0,a6
    d1b8:	00078813          	mv	a6,a5
    d1bc:	00941693          	sll	a3,s0,0x9
    d1c0:	01d41713          	sll	a4,s0,0x1d
    d1c4:	00c6d693          	srl	a3,a3,0xc
    d1c8:	00385813          	srl	a6,a6,0x3
    d1cc:	00e86733          	or	a4,a6,a4
    d1d0:	00000793          	li	a5,0
    d1d4:	99dff06f          	j	cb70 <__divdf3+0x178>
    d1d8:	00060813          	mv	a6,a2
    d1dc:	e2e690e3          	bne	a3,a4,cffc <__divdf3+0x604>
    d1e0:	e1579ee3          	bne	a5,s5,cffc <__divdf3+0x604>
    d1e4:	02412c83          	lw	s9,36(sp)
    d1e8:	02012d03          	lw	s10,32(sp)
    d1ec:	01c12d83          	lw	s11,28(sp)
    d1f0:	a7dff06f          	j	cc6c <__divdf3+0x274>
    d1f4:	ec96f6e3          	bgeu	a3,s1,d0c0 <__divdf3+0x6c8>
    d1f8:	00da86b3          	add	a3,s5,a3
    d1fc:	0156b633          	sltu	a2,a3,s5
    d200:	01960633          	add	a2,a2,s9
    d204:	ffe40413          	add	s0,s0,-2
    d208:	00068d13          	mv	s10,a3
    d20c:	00cb8bb3          	add	s7,s7,a2
    d210:	c81ff06f          	j	ce90 <__divdf3+0x498>
    d214:	c0200713          	li	a4,-1022
    d218:	02412c83          	lw	s9,36(sp)
    d21c:	02012d03          	lw	s10,32(sp)
    d220:	01c12d83          	lw	s11,28(sp)
    d224:	3ff98793          	add	a5,s3,1023
    d228:	fff00813          	li	a6,-1
    d22c:	e0e9c4e3          	blt	s3,a4,d034 <__divdf3+0x63c>
    d230:	00480713          	add	a4,a6,4
    d234:	01073833          	sltu	a6,a4,a6
    d238:	01040433          	add	s0,s0,a6
    d23c:	00070813          	mv	a6,a4
    d240:	a3dff06f          	j	cc7c <__divdf3+0x284>
    d244:	00f87713          	and	a4,a6,15
    d248:	00400693          	li	a3,4
    d24c:	a2d708e3          	beq	a4,a3,cc7c <__divdf3+0x284>
    d250:	fe1ff06f          	j	d230 <__divdf3+0x838>
    d254:	00d12623          	sw	a3,12(sp)
    d258:	cadff06f          	j	cf04 <__divdf3+0x50c>
    d25c:	00078d13          	mv	s10,a5
    d260:	d05ff06f          	j	cf64 <__divdf3+0x56c>
    d264:	00090a13          	mv	s4,s2
    d268:	7ff00793          	li	a5,2047
    d26c:	00000693          	li	a3,0
    d270:	00000713          	li	a4,0
    d274:	8fdff06f          	j	cb70 <__divdf3+0x178>
    d278:	001a9613          	sll	a2,s5,0x1
    d27c:	015636b3          	sltu	a3,a2,s5
    d280:	019686b3          	add	a3,a3,s9
    d284:	00d486b3          	add	a3,s1,a3
    d288:	ffe80813          	add	a6,a6,-2
    d28c:	00060a93          	mv	s5,a2
    d290:	f4e688e3          	beq	a3,a4,d1e0 <__divdf3+0x7e8>
    d294:	d69ff06f          	j	cffc <__divdf3+0x604>
    d298:	fefae0e3          	bltu	s5,a5,d278 <__divdf3+0x880>
    d29c:	00060813          	mv	a6,a2
    d2a0:	f41ff06f          	j	d1e0 <__divdf3+0x7e8>

0000d2a4 <__eqdf2>:
    d2a4:	0145d713          	srl	a4,a1,0x14
    d2a8:	001007b7          	lui	a5,0x100
    d2ac:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d2b0:	0146d813          	srl	a6,a3,0x14
    d2b4:	7ff77713          	and	a4,a4,2047
    d2b8:	7ff00313          	li	t1,2047
    d2bc:	00b7fe33          	and	t3,a5,a1
    d2c0:	00050893          	mv	a7,a0
    d2c4:	00d7f7b3          	and	a5,a5,a3
    d2c8:	01f5d593          	srl	a1,a1,0x1f
    d2cc:	7ff87813          	and	a6,a6,2047
    d2d0:	01f6d693          	srl	a3,a3,0x1f
    d2d4:	00100513          	li	a0,1
    d2d8:	00670c63          	beq	a4,t1,d2f0 <__eqdf2+0x4c>
    d2dc:	00680863          	beq	a6,t1,d2ec <__eqdf2+0x48>
    d2e0:	01071463          	bne	a4,a6,d2e8 <__eqdf2+0x44>
    d2e4:	02fe0663          	beq	t3,a5,d310 <__eqdf2+0x6c>
    d2e8:	00008067          	ret
    d2ec:	00008067          	ret
    d2f0:	fee81ce3          	bne	a6,a4,d2e8 <__eqdf2+0x44>
    d2f4:	00fe67b3          	or	a5,t3,a5
    d2f8:	00c7e7b3          	or	a5,a5,a2
    d2fc:	0117e7b3          	or	a5,a5,a7
    d300:	fe0794e3          	bnez	a5,d2e8 <__eqdf2+0x44>
    d304:	40d585b3          	sub	a1,a1,a3
    d308:	00b03533          	snez	a0,a1
    d30c:	00008067          	ret
    d310:	fcc89ce3          	bne	a7,a2,d2e8 <__eqdf2+0x44>
    d314:	00d58a63          	beq	a1,a3,d328 <__eqdf2+0x84>
    d318:	fc0718e3          	bnez	a4,d2e8 <__eqdf2+0x44>
    d31c:	011e6e33          	or	t3,t3,a7
    d320:	01c03533          	snez	a0,t3
    d324:	00008067          	ret
    d328:	00000513          	li	a0,0
    d32c:	00008067          	ret

0000d330 <__gedf2>:
    d330:	0145d893          	srl	a7,a1,0x14
    d334:	001007b7          	lui	a5,0x100
    d338:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d33c:	0146d713          	srl	a4,a3,0x14
    d340:	7ff8f893          	and	a7,a7,2047
    d344:	7ff00e13          	li	t3,2047
    d348:	00b7f333          	and	t1,a5,a1
    d34c:	00050813          	mv	a6,a0
    d350:	00050e93          	mv	t4,a0
    d354:	00d7f7b3          	and	a5,a5,a3
    d358:	01f5d593          	srl	a1,a1,0x1f
    d35c:	00060f13          	mv	t5,a2
    d360:	7ff77513          	and	a0,a4,2047
    d364:	01f6d693          	srl	a3,a3,0x1f
    d368:	05c88863          	beq	a7,t3,d3b8 <__gedf2+0x88>
    d36c:	03c50463          	beq	a0,t3,d394 <__gedf2+0x64>
    d370:	06089a63          	bnez	a7,d3e4 <__gedf2+0xb4>
    d374:	01036833          	or	a6,t1,a6
    d378:	06051063          	bnez	a0,d3d8 <__gedf2+0xa8>
    d37c:	00c7e633          	or	a2,a5,a2
    d380:	08060c63          	beqz	a2,d418 <__gedf2+0xe8>
    d384:	0a081263          	bnez	a6,d428 <__gedf2+0xf8>
    d388:	00100513          	li	a0,1
    d38c:	08068263          	beqz	a3,d410 <__gedf2+0xe0>
    d390:	00008067          	ret
    d394:	00c7e633          	or	a2,a5,a2
    d398:	08061463          	bnez	a2,d420 <__gedf2+0xf0>
    d39c:	00089663          	bnez	a7,d3a8 <__gedf2+0x78>
    d3a0:	01036333          	or	t1,t1,a6
    d3a4:	fe0302e3          	beqz	t1,d388 <__gedf2+0x58>
    d3a8:	06d58063          	beq	a1,a3,d408 <__gedf2+0xd8>
    d3ac:	06059263          	bnez	a1,d410 <__gedf2+0xe0>
    d3b0:	00100513          	li	a0,1
    d3b4:	00008067          	ret
    d3b8:	01036333          	or	t1,t1,a6
    d3bc:	06031263          	bnez	t1,d420 <__gedf2+0xf0>
    d3c0:	ff1516e3          	bne	a0,a7,d3ac <__gedf2+0x7c>
    d3c4:	00c7e7b3          	or	a5,a5,a2
    d3c8:	04079c63          	bnez	a5,d420 <__gedf2+0xf0>
    d3cc:	fed590e3          	bne	a1,a3,d3ac <__gedf2+0x7c>
    d3d0:	00000513          	li	a0,0
    d3d4:	00008067          	ret
    d3d8:	fa0808e3          	beqz	a6,d388 <__gedf2+0x58>
    d3dc:	fcd598e3          	bne	a1,a3,d3ac <__gedf2+0x7c>
    d3e0:	0280006f          	j	d408 <__gedf2+0xd8>
    d3e4:	fc0504e3          	beqz	a0,d3ac <__gedf2+0x7c>
    d3e8:	fcd592e3          	bne	a1,a3,d3ac <__gedf2+0x7c>
    d3ec:	fd1540e3          	blt	a0,a7,d3ac <__gedf2+0x7c>
    d3f0:	00a8cc63          	blt	a7,a0,d408 <__gedf2+0xd8>
    d3f4:	fa67ece3          	bltu	a5,t1,d3ac <__gedf2+0x7c>
    d3f8:	00f31863          	bne	t1,a5,d408 <__gedf2+0xd8>
    d3fc:	fbdf68e3          	bltu	t5,t4,d3ac <__gedf2+0x7c>
    d400:	00000513          	li	a0,0
    d404:	f9eef6e3          	bgeu	t4,t5,d390 <__gedf2+0x60>
    d408:	00100513          	li	a0,1
    d40c:	f80592e3          	bnez	a1,d390 <__gedf2+0x60>
    d410:	fff00513          	li	a0,-1
    d414:	00008067          	ret
    d418:	f8081ae3          	bnez	a6,d3ac <__gedf2+0x7c>
    d41c:	00008067          	ret
    d420:	ffe00513          	li	a0,-2
    d424:	00008067          	ret
    d428:	fcd586e3          	beq	a1,a3,d3f4 <__gedf2+0xc4>
    d42c:	f81ff06f          	j	d3ac <__gedf2+0x7c>

0000d430 <__ledf2>:
    d430:	0145d893          	srl	a7,a1,0x14
    d434:	001007b7          	lui	a5,0x100
    d438:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    d43c:	0146d713          	srl	a4,a3,0x14
    d440:	7ff8f893          	and	a7,a7,2047
    d444:	7ff00313          	li	t1,2047
    d448:	00b7fe33          	and	t3,a5,a1
    d44c:	00050813          	mv	a6,a0
    d450:	00050e93          	mv	t4,a0
    d454:	00d7f7b3          	and	a5,a5,a3
    d458:	01f5d593          	srl	a1,a1,0x1f
    d45c:	00060f13          	mv	t5,a2
    d460:	7ff77513          	and	a0,a4,2047
    d464:	01f6d693          	srl	a3,a3,0x1f
    d468:	04688a63          	beq	a7,t1,d4bc <__ledf2+0x8c>
    d46c:	02650463          	beq	a0,t1,d494 <__ledf2+0x64>
    d470:	06089863          	bnez	a7,d4e0 <__ledf2+0xb0>
    d474:	010e6833          	or	a6,t3,a6
    d478:	08051e63          	bnez	a0,d514 <__ledf2+0xe4>
    d47c:	00c7e633          	or	a2,a5,a2
    d480:	0a060463          	beqz	a2,d528 <__ledf2+0xf8>
    d484:	0a081663          	bnez	a6,d530 <__ledf2+0x100>
    d488:	00100513          	li	a0,1
    d48c:	08068063          	beqz	a3,d50c <__ledf2+0xdc>
    d490:	00008067          	ret
    d494:	00c7e633          	or	a2,a5,a2
    d498:	00200513          	li	a0,2
    d49c:	fe061ae3          	bnez	a2,d490 <__ledf2+0x60>
    d4a0:	00089663          	bnez	a7,d4ac <__ledf2+0x7c>
    d4a4:	010e6e33          	or	t3,t3,a6
    d4a8:	fe0e00e3          	beqz	t3,d488 <__ledf2+0x58>
    d4ac:	04d58c63          	beq	a1,a3,d504 <__ledf2+0xd4>
    d4b0:	04059e63          	bnez	a1,d50c <__ledf2+0xdc>
    d4b4:	00100513          	li	a0,1
    d4b8:	00008067          	ret
    d4bc:	010e6e33          	or	t3,t3,a6
    d4c0:	060e1063          	bnez	t3,d520 <__ledf2+0xf0>
    d4c4:	ff1516e3          	bne	a0,a7,d4b0 <__ledf2+0x80>
    d4c8:	00c7e7b3          	or	a5,a5,a2
    d4cc:	00200513          	li	a0,2
    d4d0:	fc0790e3          	bnez	a5,d490 <__ledf2+0x60>
    d4d4:	fcd59ee3          	bne	a1,a3,d4b0 <__ledf2+0x80>
    d4d8:	00000513          	li	a0,0
    d4dc:	00008067          	ret
    d4e0:	fc0508e3          	beqz	a0,d4b0 <__ledf2+0x80>
    d4e4:	fcd596e3          	bne	a1,a3,d4b0 <__ledf2+0x80>
    d4e8:	fd1544e3          	blt	a0,a7,d4b0 <__ledf2+0x80>
    d4ec:	00a8cc63          	blt	a7,a0,d504 <__ledf2+0xd4>
    d4f0:	fdc7e0e3          	bltu	a5,t3,d4b0 <__ledf2+0x80>
    d4f4:	00fe1863          	bne	t3,a5,d504 <__ledf2+0xd4>
    d4f8:	fbdf6ce3          	bltu	t5,t4,d4b0 <__ledf2+0x80>
    d4fc:	00000513          	li	a0,0
    d500:	f9eef8e3          	bgeu	t4,t5,d490 <__ledf2+0x60>
    d504:	00100513          	li	a0,1
    d508:	f80594e3          	bnez	a1,d490 <__ledf2+0x60>
    d50c:	fff00513          	li	a0,-1
    d510:	00008067          	ret
    d514:	f6080ae3          	beqz	a6,d488 <__ledf2+0x58>
    d518:	f8d59ce3          	bne	a1,a3,d4b0 <__ledf2+0x80>
    d51c:	fe9ff06f          	j	d504 <__ledf2+0xd4>
    d520:	00200513          	li	a0,2
    d524:	00008067          	ret
    d528:	f80814e3          	bnez	a6,d4b0 <__ledf2+0x80>
    d52c:	00008067          	ret
    d530:	fcd580e3          	beq	a1,a3,d4f0 <__ledf2+0xc0>
    d534:	f7dff06f          	j	d4b0 <__ledf2+0x80>

0000d538 <__muldf3>:
    d538:	fd010113          	add	sp,sp,-48
    d53c:	0145d793          	srl	a5,a1,0x14
    d540:	02812423          	sw	s0,40(sp)
    d544:	02912223          	sw	s1,36(sp)
    d548:	03212023          	sw	s2,32(sp)
    d54c:	01312e23          	sw	s3,28(sp)
    d550:	01512a23          	sw	s5,20(sp)
    d554:	00c59493          	sll	s1,a1,0xc
    d558:	02112623          	sw	ra,44(sp)
    d55c:	01412c23          	sw	s4,24(sp)
    d560:	01612823          	sw	s6,16(sp)
    d564:	01712623          	sw	s7,12(sp)
    d568:	01812423          	sw	s8,8(sp)
    d56c:	7ff7f793          	and	a5,a5,2047
    d570:	00050413          	mv	s0,a0
    d574:	00060a93          	mv	s5,a2
    d578:	00068993          	mv	s3,a3
    d57c:	00c4d493          	srl	s1,s1,0xc
    d580:	01f5d913          	srl	s2,a1,0x1f
    d584:	4e078063          	beqz	a5,da64 <__muldf3+0x52c>
    d588:	7ff00713          	li	a4,2047
    d58c:	0ae78663          	beq	a5,a4,d638 <__muldf3+0x100>
    d590:	00349693          	sll	a3,s1,0x3
    d594:	01d55713          	srl	a4,a0,0x1d
    d598:	00d76733          	or	a4,a4,a3
    d59c:	008006b7          	lui	a3,0x800
    d5a0:	00d764b3          	or	s1,a4,a3
    d5a4:	00351a13          	sll	s4,a0,0x3
    d5a8:	c0178c13          	add	s8,a5,-1023
    d5ac:	00000b13          	li	s6,0
    d5b0:	00000b93          	li	s7,0
    d5b4:	0149d793          	srl	a5,s3,0x14
    d5b8:	00c99713          	sll	a4,s3,0xc
    d5bc:	7ff7f793          	and	a5,a5,2047
    d5c0:	000a8e13          	mv	t3,s5
    d5c4:	00c75413          	srl	s0,a4,0xc
    d5c8:	01f9d993          	srl	s3,s3,0x1f
    d5cc:	0a078063          	beqz	a5,d66c <__muldf3+0x134>
    d5d0:	7ff00713          	li	a4,2047
    d5d4:	14e78e63          	beq	a5,a4,d730 <__muldf3+0x1f8>
    d5d8:	00341713          	sll	a4,s0,0x3
    d5dc:	01dad693          	srl	a3,s5,0x1d
    d5e0:	00e6e6b3          	or	a3,a3,a4
    d5e4:	c0178793          	add	a5,a5,-1023
    d5e8:	00800737          	lui	a4,0x800
    d5ec:	00e6e433          	or	s0,a3,a4
    d5f0:	003a9e13          	sll	t3,s5,0x3
    d5f4:	01878333          	add	t1,a5,s8
    d5f8:	00000693          	li	a3,0
    d5fc:	00a00793          	li	a5,10
    d600:	00130893          	add	a7,t1,1
    d604:	0b67cc63          	blt	a5,s6,d6bc <__muldf3+0x184>
    d608:	013945b3          	xor	a1,s2,s3
    d60c:	00200793          	li	a5,2
    d610:	00058813          	mv	a6,a1
    d614:	1567c663          	blt	a5,s6,d760 <__muldf3+0x228>
    d618:	fffb0b13          	add	s6,s6,-1
    d61c:	00100713          	li	a4,1
    d620:	17676063          	bltu	a4,s6,d780 <__muldf3+0x248>
    d624:	48f68663          	beq	a3,a5,dab0 <__muldf3+0x578>
    d628:	00040493          	mv	s1,s0
    d62c:	000e0a13          	mv	s4,t3
    d630:	00068b93          	mv	s7,a3
    d634:	09c0006f          	j	d6d0 <__muldf3+0x198>
    d638:	00a4ea33          	or	s4,s1,a0
    d63c:	480a1463          	bnez	s4,dac4 <__muldf3+0x58c>
    d640:	0149d793          	srl	a5,s3,0x14
    d644:	00c99713          	sll	a4,s3,0xc
    d648:	7ff7f793          	and	a5,a5,2047
    d64c:	00000493          	li	s1,0
    d650:	00800b13          	li	s6,8
    d654:	7ff00c13          	li	s8,2047
    d658:	00200b93          	li	s7,2
    d65c:	000a8e13          	mv	t3,s5
    d660:	00c75413          	srl	s0,a4,0xc
    d664:	01f9d993          	srl	s3,s3,0x1f
    d668:	f60794e3          	bnez	a5,d5d0 <__muldf3+0x98>
    d66c:	015467b3          	or	a5,s0,s5
    d670:	46078e63          	beqz	a5,daec <__muldf3+0x5b4>
    d674:	54040c63          	beqz	s0,dbcc <__muldf3+0x694>
    d678:	00040513          	mv	a0,s0
    d67c:	6f4010ef          	jal	ed70 <__clzsi2>
    d680:	00050313          	mv	t1,a0
    d684:	ff550713          	add	a4,a0,-11
    d688:	01d00793          	li	a5,29
    d68c:	ff830e13          	add	t3,t1,-8
    d690:	40e787b3          	sub	a5,a5,a4
    d694:	00fad7b3          	srl	a5,s5,a5
    d698:	01c41733          	sll	a4,s0,t3
    d69c:	00e7e433          	or	s0,a5,a4
    d6a0:	01ca9e33          	sll	t3,s5,t3
    d6a4:	406c0333          	sub	t1,s8,t1
    d6a8:	c0d30313          	add	t1,t1,-1011
    d6ac:	00a00793          	li	a5,10
    d6b0:	00000693          	li	a3,0
    d6b4:	00130893          	add	a7,t1,1
    d6b8:	f567d8e3          	bge	a5,s6,d608 <__muldf3+0xd0>
    d6bc:	00090593          	mv	a1,s2
    d6c0:	00200793          	li	a5,2
    d6c4:	3efb8663          	beq	s7,a5,dab0 <__muldf3+0x578>
    d6c8:	00300793          	li	a5,3
    d6cc:	54fb8863          	beq	s7,a5,dc1c <__muldf3+0x6e4>
    d6d0:	00100793          	li	a5,1
    d6d4:	00058813          	mv	a6,a1
    d6d8:	52fb9663          	bne	s7,a5,dc04 <__muldf3+0x6cc>
    d6dc:	00000793          	li	a5,0
    d6e0:	00000693          	li	a3,0
    d6e4:	00000713          	li	a4,0
    d6e8:	02c12083          	lw	ra,44(sp)
    d6ec:	02812403          	lw	s0,40(sp)
    d6f0:	01479793          	sll	a5,a5,0x14
    d6f4:	00d7e7b3          	or	a5,a5,a3
    d6f8:	01f81813          	sll	a6,a6,0x1f
    d6fc:	0107e7b3          	or	a5,a5,a6
    d700:	02412483          	lw	s1,36(sp)
    d704:	02012903          	lw	s2,32(sp)
    d708:	01c12983          	lw	s3,28(sp)
    d70c:	01812a03          	lw	s4,24(sp)
    d710:	01412a83          	lw	s5,20(sp)
    d714:	01012b03          	lw	s6,16(sp)
    d718:	00c12b83          	lw	s7,12(sp)
    d71c:	00812c03          	lw	s8,8(sp)
    d720:	00070513          	mv	a0,a4
    d724:	00078593          	mv	a1,a5
    d728:	03010113          	add	sp,sp,48
    d72c:	00008067          	ret
    d730:	01546733          	or	a4,s0,s5
    d734:	7ffc0313          	add	t1,s8,2047
    d738:	3c070663          	beqz	a4,db04 <__muldf3+0x5cc>
    d73c:	00001737          	lui	a4,0x1
    d740:	01394833          	xor	a6,s2,s3
    d744:	80070713          	add	a4,a4,-2048 # 800 <main+0x530>
    d748:	003b6b13          	or	s6,s6,3
    d74c:	00a00693          	li	a3,10
    d750:	00080593          	mv	a1,a6
    d754:	00ec08b3          	add	a7,s8,a4
    d758:	4366cc63          	blt	a3,s6,db90 <__muldf3+0x658>
    d75c:	00300693          	li	a3,3
    d760:	00100613          	li	a2,1
    d764:	01661633          	sll	a2,a2,s6
    d768:	53067713          	and	a4,a2,1328
    d76c:	f4071ae3          	bnez	a4,d6c0 <__muldf3+0x188>
    d770:	24067793          	and	a5,a2,576
    d774:	48079063          	bnez	a5,dbf4 <__muldf3+0x6bc>
    d778:	08867613          	and	a2,a2,136
    d77c:	38061e63          	bnez	a2,db18 <__muldf3+0x5e0>
    d780:	00010fb7          	lui	t6,0x10
    d784:	ffff8293          	add	t0,t6,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    d788:	005a7f33          	and	t5,s4,t0
    d78c:	005e72b3          	and	t0,t3,t0
    d790:	010a5a13          	srl	s4,s4,0x10
    d794:	010e5e13          	srl	t3,t3,0x10
    d798:	000f0513          	mv	a0,t5
    d79c:	00028593          	mv	a1,t0
    d7a0:	460010ef          	jal	ec00 <__mulsi3>
    d7a4:	00050713          	mv	a4,a0
    d7a8:	000e0593          	mv	a1,t3
    d7ac:	000f0513          	mv	a0,t5
    d7b0:	450010ef          	jal	ec00 <__mulsi3>
    d7b4:	00050793          	mv	a5,a0
    d7b8:	00028593          	mv	a1,t0
    d7bc:	000a0513          	mv	a0,s4
    d7c0:	440010ef          	jal	ec00 <__mulsi3>
    d7c4:	00050e93          	mv	t4,a0
    d7c8:	000e0593          	mv	a1,t3
    d7cc:	000a0513          	mv	a0,s4
    d7d0:	430010ef          	jal	ec00 <__mulsi3>
    d7d4:	01d786b3          	add	a3,a5,t4
    d7d8:	01075393          	srl	t2,a4,0x10
    d7dc:	00d383b3          	add	t2,t2,a3
    d7e0:	00050793          	mv	a5,a0
    d7e4:	01d3f463          	bgeu	t2,t4,d7ec <__muldf3+0x2b4>
    d7e8:	01f507b3          	add	a5,a0,t6
    d7ec:	000109b7          	lui	s3,0x10
    d7f0:	fff98913          	add	s2,s3,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    d7f4:	0123feb3          	and	t4,t2,s2
    d7f8:	01277733          	and	a4,a4,s2
    d7fc:	010e9e93          	sll	t4,t4,0x10
    d800:	01247933          	and	s2,s0,s2
    d804:	0103d393          	srl	t2,t2,0x10
    d808:	00ee8eb3          	add	t4,t4,a4
    d80c:	01045413          	srl	s0,s0,0x10
    d810:	000f0513          	mv	a0,t5
    d814:	00090593          	mv	a1,s2
    d818:	3e8010ef          	jal	ec00 <__mulsi3>
    d81c:	00050f93          	mv	t6,a0
    d820:	00040593          	mv	a1,s0
    d824:	000f0513          	mv	a0,t5
    d828:	3d8010ef          	jal	ec00 <__mulsi3>
    d82c:	00050713          	mv	a4,a0
    d830:	00090593          	mv	a1,s2
    d834:	000a0513          	mv	a0,s4
    d838:	3c8010ef          	jal	ec00 <__mulsi3>
    d83c:	00050f13          	mv	t5,a0
    d840:	00040593          	mv	a1,s0
    d844:	000a0513          	mv	a0,s4
    d848:	3b8010ef          	jal	ec00 <__mulsi3>
    d84c:	010fd693          	srl	a3,t6,0x10
    d850:	01e70733          	add	a4,a4,t5
    d854:	00e686b3          	add	a3,a3,a4
    d858:	01e6f463          	bgeu	a3,t5,d860 <__muldf3+0x328>
    d85c:	01350533          	add	a0,a0,s3
    d860:	00010a37          	lui	s4,0x10
    d864:	fffa0f13          	add	t5,s4,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    d868:	01e6f733          	and	a4,a3,t5
    d86c:	01efffb3          	and	t6,t6,t5
    d870:	01071713          	sll	a4,a4,0x10
    d874:	01f70733          	add	a4,a4,t6
    d878:	01e4ff33          	and	t5,s1,t5
    d87c:	0106d693          	srl	a3,a3,0x10
    d880:	00a68fb3          	add	t6,a3,a0
    d884:	00e383b3          	add	t2,t2,a4
    d888:	0104d493          	srl	s1,s1,0x10
    d88c:	000f0513          	mv	a0,t5
    d890:	00028593          	mv	a1,t0
    d894:	36c010ef          	jal	ec00 <__mulsi3>
    d898:	00050a93          	mv	s5,a0
    d89c:	000e0593          	mv	a1,t3
    d8a0:	000f0513          	mv	a0,t5
    d8a4:	35c010ef          	jal	ec00 <__mulsi3>
    d8a8:	00050993          	mv	s3,a0
    d8ac:	00028593          	mv	a1,t0
    d8b0:	00048513          	mv	a0,s1
    d8b4:	34c010ef          	jal	ec00 <__mulsi3>
    d8b8:	00050293          	mv	t0,a0
    d8bc:	000e0593          	mv	a1,t3
    d8c0:	00048513          	mv	a0,s1
    d8c4:	33c010ef          	jal	ec00 <__mulsi3>
    d8c8:	010ad613          	srl	a2,s5,0x10
    d8cc:	005989b3          	add	s3,s3,t0
    d8d0:	01360633          	add	a2,a2,s3
    d8d4:	00567463          	bgeu	a2,t0,d8dc <__muldf3+0x3a4>
    d8d8:	01450533          	add	a0,a0,s4
    d8dc:	00010a37          	lui	s4,0x10
    d8e0:	fffa0693          	add	a3,s4,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    d8e4:	00d672b3          	and	t0,a2,a3
    d8e8:	00dafab3          	and	s5,s5,a3
    d8ec:	01065613          	srl	a2,a2,0x10
    d8f0:	01029293          	sll	t0,t0,0x10
    d8f4:	00a60e33          	add	t3,a2,a0
    d8f8:	015282b3          	add	t0,t0,s5
    d8fc:	000f0513          	mv	a0,t5
    d900:	00090593          	mv	a1,s2
    d904:	2fc010ef          	jal	ec00 <__mulsi3>
    d908:	00050993          	mv	s3,a0
    d90c:	00040593          	mv	a1,s0
    d910:	000f0513          	mv	a0,t5
    d914:	2ec010ef          	jal	ec00 <__mulsi3>
    d918:	00050f13          	mv	t5,a0
    d91c:	00090593          	mv	a1,s2
    d920:	00048513          	mv	a0,s1
    d924:	2dc010ef          	jal	ec00 <__mulsi3>
    d928:	00050913          	mv	s2,a0
    d92c:	00040593          	mv	a1,s0
    d930:	00048513          	mv	a0,s1
    d934:	2cc010ef          	jal	ec00 <__mulsi3>
    d938:	012f06b3          	add	a3,t5,s2
    d93c:	0109d593          	srl	a1,s3,0x10
    d940:	00d58433          	add	s0,a1,a3
    d944:	00050f13          	mv	t5,a0
    d948:	01247463          	bgeu	s0,s2,d950 <__muldf3+0x418>
    d94c:	01450f33          	add	t5,a0,s4
    d950:	00010637          	lui	a2,0x10
    d954:	fff60613          	add	a2,a2,-1 # ffff <__crt0_copy_data_src_begin+0x78f>
    d958:	00c476b3          	and	a3,s0,a2
    d95c:	00c9f9b3          	and	s3,s3,a2
    d960:	01069693          	sll	a3,a3,0x10
    d964:	007787b3          	add	a5,a5,t2
    d968:	013686b3          	add	a3,a3,s3
    d96c:	01f685b3          	add	a1,a3,t6
    d970:	00e7b733          	sltu	a4,a5,a4
    d974:	00e58733          	add	a4,a1,a4
    d978:	005782b3          	add	t0,a5,t0
    d97c:	01c70633          	add	a2,a4,t3
    d980:	00f2b7b3          	sltu	a5,t0,a5
    d984:	00f607b3          	add	a5,a2,a5
    d988:	00d5b6b3          	sltu	a3,a1,a3
    d98c:	00b735b3          	sltu	a1,a4,a1
    d990:	00b6e6b3          	or	a3,a3,a1
    d994:	00e63733          	sltu	a4,a2,a4
    d998:	01045593          	srl	a1,s0,0x10
    d99c:	00c7b633          	sltu	a2,a5,a2
    d9a0:	00b686b3          	add	a3,a3,a1
    d9a4:	00929a13          	sll	s4,t0,0x9
    d9a8:	00c76733          	or	a4,a4,a2
    d9ac:	00d70733          	add	a4,a4,a3
    d9b0:	01da6a33          	or	s4,s4,t4
    d9b4:	01e70733          	add	a4,a4,t5
    d9b8:	01403a33          	snez	s4,s4
    d9bc:	0172d293          	srl	t0,t0,0x17
    d9c0:	00971713          	sll	a4,a4,0x9
    d9c4:	0177d693          	srl	a3,a5,0x17
    d9c8:	005a6a33          	or	s4,s4,t0
    d9cc:	00979793          	sll	a5,a5,0x9
    d9d0:	00fa6a33          	or	s4,s4,a5
    d9d4:	00771793          	sll	a5,a4,0x7
    d9d8:	00d764b3          	or	s1,a4,a3
    d9dc:	0207d063          	bgez	a5,d9fc <__muldf3+0x4c4>
    d9e0:	001a5793          	srl	a5,s4,0x1
    d9e4:	001a7a13          	and	s4,s4,1
    d9e8:	01f49713          	sll	a4,s1,0x1f
    d9ec:	0147e7b3          	or	a5,a5,s4
    d9f0:	00e7ea33          	or	s4,a5,a4
    d9f4:	0014d493          	srl	s1,s1,0x1
    d9f8:	00088313          	mv	t1,a7
    d9fc:	3ff30793          	add	a5,t1,1023
    da00:	12f05663          	blez	a5,db2c <__muldf3+0x5f4>
    da04:	007a7713          	and	a4,s4,7
    da08:	02070063          	beqz	a4,da28 <__muldf3+0x4f0>
    da0c:	00fa7713          	and	a4,s4,15
    da10:	00400693          	li	a3,4
    da14:	00d70a63          	beq	a4,a3,da28 <__muldf3+0x4f0>
    da18:	004a0713          	add	a4,s4,4
    da1c:	01473a33          	sltu	s4,a4,s4
    da20:	014484b3          	add	s1,s1,s4
    da24:	00070a13          	mv	s4,a4
    da28:	00749713          	sll	a4,s1,0x7
    da2c:	00075a63          	bgez	a4,da40 <__muldf3+0x508>
    da30:	ff0007b7          	lui	a5,0xff000
    da34:	fff78793          	add	a5,a5,-1 # feffffff <__crt0_ram_last+0x7ef80000>
    da38:	00f4f4b3          	and	s1,s1,a5
    da3c:	40030793          	add	a5,t1,1024
    da40:	7fe00713          	li	a4,2046
    da44:	1cf74463          	blt	a4,a5,dc0c <__muldf3+0x6d4>
    da48:	003a5a13          	srl	s4,s4,0x3
    da4c:	01d49713          	sll	a4,s1,0x1d
    da50:	00949693          	sll	a3,s1,0x9
    da54:	01476733          	or	a4,a4,s4
    da58:	00c6d693          	srl	a3,a3,0xc
    da5c:	7ff7f793          	and	a5,a5,2047
    da60:	c89ff06f          	j	d6e8 <__muldf3+0x1b0>
    da64:	00a4ea33          	or	s4,s1,a0
    da68:	060a0863          	beqz	s4,dad8 <__muldf3+0x5a0>
    da6c:	12048e63          	beqz	s1,dba8 <__muldf3+0x670>
    da70:	00048513          	mv	a0,s1
    da74:	2fc010ef          	jal	ed70 <__clzsi2>
    da78:	00050713          	mv	a4,a0
    da7c:	ff550693          	add	a3,a0,-11
    da80:	01d00793          	li	a5,29
    da84:	ff870a13          	add	s4,a4,-8
    da88:	40d787b3          	sub	a5,a5,a3
    da8c:	00f457b3          	srl	a5,s0,a5
    da90:	014496b3          	sll	a3,s1,s4
    da94:	00d7e4b3          	or	s1,a5,a3
    da98:	01441a33          	sll	s4,s0,s4
    da9c:	c0d00793          	li	a5,-1011
    daa0:	40e78c33          	sub	s8,a5,a4
    daa4:	00000b13          	li	s6,0
    daa8:	00000b93          	li	s7,0
    daac:	b09ff06f          	j	d5b4 <__muldf3+0x7c>
    dab0:	00058813          	mv	a6,a1
    dab4:	7ff00793          	li	a5,2047
    dab8:	00000693          	li	a3,0
    dabc:	00000713          	li	a4,0
    dac0:	c29ff06f          	j	d6e8 <__muldf3+0x1b0>
    dac4:	00050a13          	mv	s4,a0
    dac8:	00c00b13          	li	s6,12
    dacc:	7ff00c13          	li	s8,2047
    dad0:	00300b93          	li	s7,3
    dad4:	ae1ff06f          	j	d5b4 <__muldf3+0x7c>
    dad8:	00000493          	li	s1,0
    dadc:	00400b13          	li	s6,4
    dae0:	00000c13          	li	s8,0
    dae4:	00100b93          	li	s7,1
    dae8:	acdff06f          	j	d5b4 <__muldf3+0x7c>
    daec:	001b6b13          	or	s6,s6,1
    daf0:	000c0313          	mv	t1,s8
    daf4:	00000413          	li	s0,0
    daf8:	00000e13          	li	t3,0
    dafc:	00100693          	li	a3,1
    db00:	afdff06f          	j	d5fc <__muldf3+0xc4>
    db04:	002b6b13          	or	s6,s6,2
    db08:	00000413          	li	s0,0
    db0c:	00000e13          	li	t3,0
    db10:	00200693          	li	a3,2
    db14:	ae9ff06f          	j	d5fc <__muldf3+0xc4>
    db18:	00040493          	mv	s1,s0
    db1c:	000e0a13          	mv	s4,t3
    db20:	00068b93          	mv	s7,a3
    db24:	00098593          	mv	a1,s3
    db28:	b99ff06f          	j	d6c0 <__muldf3+0x188>
    db2c:	00100713          	li	a4,1
    db30:	10079063          	bnez	a5,dc30 <__muldf3+0x6f8>
    db34:	41e30313          	add	t1,t1,1054
    db38:	006a1633          	sll	a2,s4,t1
    db3c:	00c03633          	snez	a2,a2
    db40:	00649333          	sll	t1,s1,t1
    db44:	00ea5a33          	srl	s4,s4,a4
    db48:	00666633          	or	a2,a2,t1
    db4c:	01466633          	or	a2,a2,s4
    db50:	00767793          	and	a5,a2,7
    db54:	00e4d5b3          	srl	a1,s1,a4
    db58:	02078063          	beqz	a5,db78 <__muldf3+0x640>
    db5c:	00f67793          	and	a5,a2,15
    db60:	00400713          	li	a4,4
    db64:	00e78a63          	beq	a5,a4,db78 <__muldf3+0x640>
    db68:	00460793          	add	a5,a2,4
    db6c:	00c7b633          	sltu	a2,a5,a2
    db70:	00c585b3          	add	a1,a1,a2
    db74:	00078613          	mv	a2,a5
    db78:	00859513          	sll	a0,a1,0x8
    db7c:	00100793          	li	a5,1
    db80:	00000693          	li	a3,0
    db84:	00000713          	li	a4,0
    db88:	b60540e3          	bltz	a0,d6e8 <__muldf3+0x1b0>
    db8c:	10c0006f          	j	dc98 <__muldf3+0x760>
    db90:	00f00713          	li	a4,15
    db94:	12eb1063          	bne	s6,a4,dcb4 <__muldf3+0x77c>
    db98:	00000813          	li	a6,0
    db9c:	000806b7          	lui	a3,0x80
    dba0:	00000713          	li	a4,0
    dba4:	b45ff06f          	j	d6e8 <__muldf3+0x1b0>
    dba8:	1c8010ef          	jal	ed70 <__clzsi2>
    dbac:	01550693          	add	a3,a0,21
    dbb0:	01c00793          	li	a5,28
    dbb4:	02050713          	add	a4,a0,32
    dbb8:	ecd7d4e3          	bge	a5,a3,da80 <__muldf3+0x548>
    dbbc:	ff850513          	add	a0,a0,-8
    dbc0:	00000a13          	li	s4,0
    dbc4:	00a414b3          	sll	s1,s0,a0
    dbc8:	ed5ff06f          	j	da9c <__muldf3+0x564>
    dbcc:	000a8513          	mv	a0,s5
    dbd0:	1a0010ef          	jal	ed70 <__clzsi2>
    dbd4:	01550713          	add	a4,a0,21
    dbd8:	01c00793          	li	a5,28
    dbdc:	02050313          	add	t1,a0,32
    dbe0:	aae7d4e3          	bge	a5,a4,d688 <__muldf3+0x150>
    dbe4:	ff850513          	add	a0,a0,-8
    dbe8:	00000e13          	li	t3,0
    dbec:	00aa9433          	sll	s0,s5,a0
    dbf0:	ab5ff06f          	j	d6a4 <__muldf3+0x16c>
    dbf4:	00000813          	li	a6,0
    dbf8:	7ff00793          	li	a5,2047
    dbfc:	000806b7          	lui	a3,0x80
    dc00:	ae9ff06f          	j	d6e8 <__muldf3+0x1b0>
    dc04:	00088313          	mv	t1,a7
    dc08:	df5ff06f          	j	d9fc <__muldf3+0x4c4>
    dc0c:	7ff00793          	li	a5,2047
    dc10:	00000693          	li	a3,0
    dc14:	00000713          	li	a4,0
    dc18:	ad1ff06f          	j	d6e8 <__muldf3+0x1b0>
    dc1c:	00000813          	li	a6,0
    dc20:	7ff00793          	li	a5,2047
    dc24:	000806b7          	lui	a3,0x80
    dc28:	00000713          	li	a4,0
    dc2c:	abdff06f          	j	d6e8 <__muldf3+0x1b0>
    dc30:	40f70733          	sub	a4,a4,a5
    dc34:	03800693          	li	a3,56
    dc38:	aae6c2e3          	blt	a3,a4,d6dc <__muldf3+0x1a4>
    dc3c:	01f00693          	li	a3,31
    dc40:	eee6dae3          	bge	a3,a4,db34 <__muldf3+0x5fc>
    dc44:	fe100693          	li	a3,-31
    dc48:	40f687b3          	sub	a5,a3,a5
    dc4c:	02000693          	li	a3,32
    dc50:	00f4d7b3          	srl	a5,s1,a5
    dc54:	00d70863          	beq	a4,a3,dc64 <__muldf3+0x72c>
    dc58:	43e30313          	add	t1,t1,1086
    dc5c:	00649333          	sll	t1,s1,t1
    dc60:	006a6a33          	or	s4,s4,t1
    dc64:	01403633          	snez	a2,s4
    dc68:	00f66633          	or	a2,a2,a5
    dc6c:	00767713          	and	a4,a2,7
    dc70:	00000693          	li	a3,0
    dc74:	02070863          	beqz	a4,dca4 <__muldf3+0x76c>
    dc78:	00f67793          	and	a5,a2,15
    dc7c:	00400713          	li	a4,4
    dc80:	00000593          	li	a1,0
    dc84:	00e78a63          	beq	a5,a4,dc98 <__muldf3+0x760>
    dc88:	00460793          	add	a5,a2,4
    dc8c:	00c7b633          	sltu	a2,a5,a2
    dc90:	00c035b3          	snez	a1,a2
    dc94:	00078613          	mv	a2,a5
    dc98:	00959693          	sll	a3,a1,0x9
    dc9c:	01d59713          	sll	a4,a1,0x1d
    dca0:	00c6d693          	srl	a3,a3,0xc
    dca4:	00365613          	srl	a2,a2,0x3
    dca8:	00e66733          	or	a4,a2,a4
    dcac:	00000793          	li	a5,0
    dcb0:	a39ff06f          	j	d6e8 <__muldf3+0x1b0>
    dcb4:	00040493          	mv	s1,s0
    dcb8:	000a8a13          	mv	s4,s5
    dcbc:	00300b93          	li	s7,3
    dcc0:	00098593          	mv	a1,s3
    dcc4:	9fdff06f          	j	d6c0 <__muldf3+0x188>

0000dcc8 <__subdf3>:
    dcc8:	001007b7          	lui	a5,0x100
    dccc:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    dcd0:	fe010113          	add	sp,sp,-32
    dcd4:	00b7f8b3          	and	a7,a5,a1
    dcd8:	00d7f833          	and	a6,a5,a3
    dcdc:	0146d793          	srl	a5,a3,0x14
    dce0:	00389893          	sll	a7,a7,0x3
    dce4:	00812c23          	sw	s0,24(sp)
    dce8:	01312623          	sw	s3,12(sp)
    dcec:	01f5d413          	srl	s0,a1,0x1f
    dcf0:	0145d993          	srl	s3,a1,0x14
    dcf4:	01d55713          	srl	a4,a0,0x1d
    dcf8:	00381813          	sll	a6,a6,0x3
    dcfc:	01d65593          	srl	a1,a2,0x1d
    dd00:	00112e23          	sw	ra,28(sp)
    dd04:	00912a23          	sw	s1,20(sp)
    dd08:	01212823          	sw	s2,16(sp)
    dd0c:	7ff7ff13          	and	t5,a5,2047
    dd10:	7ff00313          	li	t1,2047
    dd14:	01176733          	or	a4,a4,a7
    dd18:	7ff9f993          	and	s3,s3,2047
    dd1c:	00040e13          	mv	t3,s0
    dd20:	00351893          	sll	a7,a0,0x3
    dd24:	01f6d693          	srl	a3,a3,0x1f
    dd28:	0105e5b3          	or	a1,a1,a6
    dd2c:	00361e93          	sll	t4,a2,0x3
    dd30:	206f0c63          	beq	t5,t1,df48 <__subdf3+0x280>
    dd34:	0016c693          	xor	a3,a3,1
    dd38:	41e987b3          	sub	a5,s3,t5
    dd3c:	16d40263          	beq	s0,a3,dea0 <__subdf3+0x1d8>
    dd40:	00f05ae3          	blez	a5,e554 <__subdf3+0x88c>
    dd44:	240f0a63          	beqz	t5,df98 <__subdf3+0x2d0>
    dd48:	3c698463          	beq	s3,t1,e110 <__subdf3+0x448>
    dd4c:	03800693          	li	a3,56
    dd50:	00100513          	li	a0,1
    dd54:	02f6ce63          	blt	a3,a5,dd90 <__subdf3+0xc8>
    dd58:	008006b7          	lui	a3,0x800
    dd5c:	00d5e5b3          	or	a1,a1,a3
    dd60:	01f00693          	li	a3,31
    dd64:	4ef6c463          	blt	a3,a5,e24c <__subdf3+0x584>
    dd68:	02000693          	li	a3,32
    dd6c:	40f686b3          	sub	a3,a3,a5
    dd70:	00d59533          	sll	a0,a1,a3
    dd74:	00fed633          	srl	a2,t4,a5
    dd78:	00de96b3          	sll	a3,t4,a3
    dd7c:	00c56533          	or	a0,a0,a2
    dd80:	00d036b3          	snez	a3,a3
    dd84:	00f5d7b3          	srl	a5,a1,a5
    dd88:	00d56533          	or	a0,a0,a3
    dd8c:	40f70733          	sub	a4,a4,a5
    dd90:	40a88533          	sub	a0,a7,a0
    dd94:	00a8b633          	sltu	a2,a7,a0
    dd98:	00050493          	mv	s1,a0
    dd9c:	40c70933          	sub	s2,a4,a2
    dda0:	00891793          	sll	a5,s2,0x8
    dda4:	3407d863          	bgez	a5,e0f4 <__subdf3+0x42c>
    dda8:	008007b7          	lui	a5,0x800
    ddac:	fff78793          	add	a5,a5,-1 # 7fffff <__neorv32_ram_size+0x77ffff>
    ddb0:	00f97933          	and	s2,s2,a5
    ddb4:	2e090663          	beqz	s2,e0a0 <__subdf3+0x3d8>
    ddb8:	00090513          	mv	a0,s2
    ddbc:	7b5000ef          	jal	ed70 <__clzsi2>
    ddc0:	ff850793          	add	a5,a0,-8
    ddc4:	02000693          	li	a3,32
    ddc8:	40f68733          	sub	a4,a3,a5
    ddcc:	00e4d733          	srl	a4,s1,a4
    ddd0:	00f91933          	sll	s2,s2,a5
    ddd4:	01276733          	or	a4,a4,s2
    ddd8:	00f494b3          	sll	s1,s1,a5
    dddc:	3f37c463          	blt	a5,s3,e1c4 <__subdf3+0x4fc>
    dde0:	413787b3          	sub	a5,a5,s3
    dde4:	00178793          	add	a5,a5,1
    dde8:	40f686b3          	sub	a3,a3,a5
    ddec:	00d49633          	sll	a2,s1,a3
    ddf0:	00f4d933          	srl	s2,s1,a5
    ddf4:	00c03633          	snez	a2,a2
    ddf8:	00c96633          	or	a2,s2,a2
    ddfc:	00d716b3          	sll	a3,a4,a3
    de00:	00c6e4b3          	or	s1,a3,a2
    de04:	00f75933          	srl	s2,a4,a5
    de08:	00000993          	li	s3,0
    de0c:	0074f793          	and	a5,s1,7
    de10:	02078063          	beqz	a5,de30 <__subdf3+0x168>
    de14:	00f4f793          	and	a5,s1,15
    de18:	00400713          	li	a4,4
    de1c:	00e78a63          	beq	a5,a4,de30 <__subdf3+0x168>
    de20:	00448793          	add	a5,s1,4
    de24:	0097b533          	sltu	a0,a5,s1
    de28:	00a90933          	add	s2,s2,a0
    de2c:	00078493          	mv	s1,a5
    de30:	00891793          	sll	a5,s2,0x8
    de34:	6c07d063          	bgez	a5,e4f4 <__subdf3+0x82c>
    de38:	00198793          	add	a5,s3,1
    de3c:	7ff00713          	li	a4,2047
    de40:	24e78663          	beq	a5,a4,e08c <__subdf3+0x3c4>
    de44:	ff800737          	lui	a4,0xff800
    de48:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    de4c:	00e97733          	and	a4,s2,a4
    de50:	7ff7f793          	and	a5,a5,2047
    de54:	01d71813          	sll	a6,a4,0x1d
    de58:	0034d513          	srl	a0,s1,0x3
    de5c:	00971713          	sll	a4,a4,0x9
    de60:	00a86833          	or	a6,a6,a0
    de64:	00c75713          	srl	a4,a4,0xc
    de68:	00147e13          	and	t3,s0,1
    de6c:	01c12083          	lw	ra,28(sp)
    de70:	01812403          	lw	s0,24(sp)
    de74:	01479793          	sll	a5,a5,0x14
    de78:	00e7e7b3          	or	a5,a5,a4
    de7c:	01fe1713          	sll	a4,t3,0x1f
    de80:	00e7e7b3          	or	a5,a5,a4
    de84:	01412483          	lw	s1,20(sp)
    de88:	01012903          	lw	s2,16(sp)
    de8c:	00c12983          	lw	s3,12(sp)
    de90:	00080513          	mv	a0,a6
    de94:	00078593          	mv	a1,a5
    de98:	02010113          	add	sp,sp,32
    de9c:	00008067          	ret
    dea0:	70f05263          	blez	a5,e5a4 <__subdf3+0x8dc>
    dea4:	1c0f1663          	bnez	t5,e070 <__subdf3+0x3a8>
    dea8:	01d5e6b3          	or	a3,a1,t4
    deac:	26068e63          	beqz	a3,e128 <__subdf3+0x460>
    deb0:	fff78693          	add	a3,a5,-1
    deb4:	46068863          	beqz	a3,e324 <__subdf3+0x65c>
    deb8:	24678c63          	beq	a5,t1,e110 <__subdf3+0x448>
    debc:	03800793          	li	a5,56
    dec0:	00100913          	li	s2,1
    dec4:	02d7cc63          	blt	a5,a3,defc <__subdf3+0x234>
    dec8:	00068793          	mv	a5,a3
    decc:	01f00693          	li	a3,31
    ded0:	48f6ca63          	blt	a3,a5,e364 <__subdf3+0x69c>
    ded4:	02000693          	li	a3,32
    ded8:	40f686b3          	sub	a3,a3,a5
    dedc:	00d59933          	sll	s2,a1,a3
    dee0:	00fed633          	srl	a2,t4,a5
    dee4:	00de96b3          	sll	a3,t4,a3
    dee8:	00c96933          	or	s2,s2,a2
    deec:	00d036b3          	snez	a3,a3
    def0:	00f5d7b3          	srl	a5,a1,a5
    def4:	00d96933          	or	s2,s2,a3
    def8:	00f70733          	add	a4,a4,a5
    defc:	01190633          	add	a2,s2,a7
    df00:	01263933          	sltu	s2,a2,s2
    df04:	00060493          	mv	s1,a2
    df08:	00e90933          	add	s2,s2,a4
    df0c:	00891793          	sll	a5,s2,0x8
    df10:	1e07d263          	bgez	a5,e0f4 <__subdf3+0x42c>
    df14:	00198993          	add	s3,s3,1
    df18:	7ff00793          	li	a5,2047
    df1c:	16f98863          	beq	s3,a5,e08c <__subdf3+0x3c4>
    df20:	ff8007b7          	lui	a5,0xff800
    df24:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    df28:	0014f513          	and	a0,s1,1
    df2c:	00f977b3          	and	a5,s2,a5
    df30:	0014d713          	srl	a4,s1,0x1
    df34:	00a76733          	or	a4,a4,a0
    df38:	01f79513          	sll	a0,a5,0x1f
    df3c:	00e564b3          	or	s1,a0,a4
    df40:	0017d913          	srl	s2,a5,0x1
    df44:	ec9ff06f          	j	de0c <__subdf3+0x144>
    df48:	01d5e833          	or	a6,a1,t4
    df4c:	80198313          	add	t1,s3,-2047
    df50:	06080863          	beqz	a6,dfc0 <__subdf3+0x2f8>
    df54:	06d40a63          	beq	s0,a3,dfc8 <__subdf3+0x300>
    df58:	0e030463          	beqz	t1,e040 <__subdf3+0x378>
    df5c:	26098e63          	beqz	s3,e1d8 <__subdf3+0x510>
    df60:	00361513          	sll	a0,a2,0x3
    df64:	00355513          	srl	a0,a0,0x3
    df68:	00068413          	mv	s0,a3
    df6c:	00058713          	mv	a4,a1
    df70:	01d71813          	sll	a6,a4,0x1d
    df74:	00a86833          	or	a6,a6,a0
    df78:	00375713          	srl	a4,a4,0x3
    df7c:	01076733          	or	a4,a4,a6
    df80:	10070663          	beqz	a4,e08c <__subdf3+0x3c4>
    df84:	00000e13          	li	t3,0
    df88:	7ff00793          	li	a5,2047
    df8c:	00080737          	lui	a4,0x80
    df90:	00000813          	li	a6,0
    df94:	ed9ff06f          	j	de6c <__subdf3+0x1a4>
    df98:	01d5e6b3          	or	a3,a1,t4
    df9c:	18068663          	beqz	a3,e128 <__subdf3+0x460>
    dfa0:	fff78693          	add	a3,a5,-1
    dfa4:	3a068263          	beqz	a3,e348 <__subdf3+0x680>
    dfa8:	16678463          	beq	a5,t1,e110 <__subdf3+0x448>
    dfac:	03800793          	li	a5,56
    dfb0:	00100513          	li	a0,1
    dfb4:	dcd7cee3          	blt	a5,a3,dd90 <__subdf3+0xc8>
    dfb8:	00068793          	mv	a5,a3
    dfbc:	da5ff06f          	j	dd60 <__subdf3+0x98>
    dfc0:	0016c693          	xor	a3,a3,1
    dfc4:	f8d41ae3          	bne	s0,a3,df58 <__subdf3+0x290>
    dfc8:	18030863          	beqz	t1,e158 <__subdf3+0x490>
    dfcc:	2c099063          	bnez	s3,e28c <__subdf3+0x5c4>
    dfd0:	7ff00793          	li	a5,2047
    dfd4:	011766b3          	or	a3,a4,a7
    dfd8:	48068863          	beqz	a3,e468 <__subdf3+0x7a0>
    dfdc:	fff78693          	add	a3,a5,-1
    dfe0:	34068263          	beqz	a3,e324 <__subdf3+0x65c>
    dfe4:	7ff00513          	li	a0,2047
    dfe8:	2aa78263          	beq	a5,a0,e28c <__subdf3+0x5c4>
    dfec:	03800793          	li	a5,56
    dff0:	00100913          	li	s2,1
    dff4:	02d7ca63          	blt	a5,a3,e028 <__subdf3+0x360>
    dff8:	01f00793          	li	a5,31
    dffc:	4cd7c663          	blt	a5,a3,e4c8 <__subdf3+0x800>
    e000:	02000793          	li	a5,32
    e004:	40d787b3          	sub	a5,a5,a3
    e008:	00f71933          	sll	s2,a4,a5
    e00c:	00d8d633          	srl	a2,a7,a3
    e010:	00f897b3          	sll	a5,a7,a5
    e014:	00c96933          	or	s2,s2,a2
    e018:	00f037b3          	snez	a5,a5
    e01c:	00d756b3          	srl	a3,a4,a3
    e020:	00f96933          	or	s2,s2,a5
    e024:	00d585b3          	add	a1,a1,a3
    e028:	01d90733          	add	a4,s2,t4
    e02c:	01273933          	sltu	s2,a4,s2
    e030:	00070493          	mv	s1,a4
    e034:	00b90933          	add	s2,s2,a1
    e038:	000f0993          	mv	s3,t5
    e03c:	ed1ff06f          	j	df0c <__subdf3+0x244>
    e040:	00198793          	add	a5,s3,1
    e044:	7fe7f793          	and	a5,a5,2046
    e048:	14079463          	bnez	a5,e190 <__subdf3+0x4c8>
    e04c:	01d5e833          	or	a6,a1,t4
    e050:	011767b3          	or	a5,a4,a7
    e054:	2a099463          	bnez	s3,e2fc <__subdf3+0x634>
    e058:	38078e63          	beqz	a5,e3f4 <__subdf3+0x72c>
    e05c:	3c081063          	bnez	a6,e41c <__subdf3+0x754>
    e060:	00351513          	sll	a0,a0,0x3
    e064:	00355913          	srl	s2,a0,0x3
    e068:	00000793          	li	a5,0
    e06c:	1140006f          	j	e180 <__subdf3+0x4b8>
    e070:	0a698063          	beq	s3,t1,e110 <__subdf3+0x448>
    e074:	03800693          	li	a3,56
    e078:	00100913          	li	s2,1
    e07c:	e8f6c0e3          	blt	a3,a5,defc <__subdf3+0x234>
    e080:	008006b7          	lui	a3,0x800
    e084:	00d5e5b3          	or	a1,a1,a3
    e088:	e45ff06f          	j	decc <__subdf3+0x204>
    e08c:	00147e13          	and	t3,s0,1
    e090:	7ff00793          	li	a5,2047
    e094:	00000713          	li	a4,0
    e098:	00000813          	li	a6,0
    e09c:	dd1ff06f          	j	de6c <__subdf3+0x1a4>
    e0a0:	00048513          	mv	a0,s1
    e0a4:	4cd000ef          	jal	ed70 <__clzsi2>
    e0a8:	01850793          	add	a5,a0,24
    e0ac:	01f00693          	li	a3,31
    e0b0:	d0f6dae3          	bge	a3,a5,ddc4 <__subdf3+0xfc>
    e0b4:	ff850713          	add	a4,a0,-8
    e0b8:	00e49733          	sll	a4,s1,a4
    e0bc:	1b37ce63          	blt	a5,s3,e278 <__subdf3+0x5b0>
    e0c0:	413789b3          	sub	s3,a5,s3
    e0c4:	00198793          	add	a5,s3,1
    e0c8:	42f6de63          	bge	a3,a5,e504 <__subdf3+0x83c>
    e0cc:	fe198993          	add	s3,s3,-31
    e0d0:	02000693          	li	a3,32
    e0d4:	013754b3          	srl	s1,a4,s3
    e0d8:	00d78c63          	beq	a5,a3,e0f0 <__subdf3+0x428>
    e0dc:	04000693          	li	a3,64
    e0e0:	40f687b3          	sub	a5,a3,a5
    e0e4:	00f71733          	sll	a4,a4,a5
    e0e8:	00e03733          	snez	a4,a4
    e0ec:	00e4e4b3          	or	s1,s1,a4
    e0f0:	00000993          	li	s3,0
    e0f4:	0074f793          	and	a5,s1,7
    e0f8:	d0079ee3          	bnez	a5,de14 <__subdf3+0x14c>
    e0fc:	00098793          	mv	a5,s3
    e100:	0034d513          	srl	a0,s1,0x3
    e104:	00090713          	mv	a4,s2
    e108:	0280006f          	j	e130 <__subdf3+0x468>
    e10c:	e6081ce3          	bnez	a6,df84 <__subdf3+0x2bc>
    e110:	00351513          	sll	a0,a0,0x3
    e114:	01d71813          	sll	a6,a4,0x1d
    e118:	00355513          	srl	a0,a0,0x3
    e11c:	00a86833          	or	a6,a6,a0
    e120:	00375713          	srl	a4,a4,0x3
    e124:	e59ff06f          	j	df7c <__subdf3+0x2b4>
    e128:	00351513          	sll	a0,a0,0x3
    e12c:	00355513          	srl	a0,a0,0x3
    e130:	01d71813          	sll	a6,a4,0x1d
    e134:	7ff00693          	li	a3,2047
    e138:	00a86833          	or	a6,a6,a0
    e13c:	00375713          	srl	a4,a4,0x3
    e140:	e2d78ee3          	beq	a5,a3,df7c <__subdf3+0x2b4>
    e144:	00c71713          	sll	a4,a4,0xc
    e148:	00c75713          	srl	a4,a4,0xc
    e14c:	7ff7f793          	and	a5,a5,2047
    e150:	00147e13          	and	t3,s0,1
    e154:	d19ff06f          	j	de6c <__subdf3+0x1a4>
    e158:	00198693          	add	a3,s3,1
    e15c:	7fe6f793          	and	a5,a3,2046
    e160:	12079e63          	bnez	a5,e29c <__subdf3+0x5d4>
    e164:	011767b3          	or	a5,a4,a7
    e168:	24099a63          	bnez	s3,e3bc <__subdf3+0x6f4>
    e16c:	30078663          	beqz	a5,e478 <__subdf3+0x7b0>
    e170:	01d5e7b3          	or	a5,a1,t4
    e174:	30079a63          	bnez	a5,e488 <__subdf3+0x7c0>
    e178:	00351513          	sll	a0,a0,0x3
    e17c:	00355913          	srl	s2,a0,0x3
    e180:	01d71813          	sll	a6,a4,0x1d
    e184:	01286833          	or	a6,a6,s2
    e188:	00375713          	srl	a4,a4,0x3
    e18c:	fb9ff06f          	j	e144 <__subdf3+0x47c>
    e190:	41d88833          	sub	a6,a7,t4
    e194:	0108b7b3          	sltu	a5,a7,a6
    e198:	40b70933          	sub	s2,a4,a1
    e19c:	40f90933          	sub	s2,s2,a5
    e1a0:	00891793          	sll	a5,s2,0x8
    e1a4:	00080493          	mv	s1,a6
    e1a8:	1207c263          	bltz	a5,e2cc <__subdf3+0x604>
    e1ac:	01286833          	or	a6,a6,s2
    e1b0:	c00812e3          	bnez	a6,ddb4 <__subdf3+0xec>
    e1b4:	00000e13          	li	t3,0
    e1b8:	00000793          	li	a5,0
    e1bc:	00000713          	li	a4,0
    e1c0:	cadff06f          	j	de6c <__subdf3+0x1a4>
    e1c4:	ff800937          	lui	s2,0xff800
    e1c8:	fff90913          	add	s2,s2,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e1cc:	40f989b3          	sub	s3,s3,a5
    e1d0:	01277933          	and	s2,a4,s2
    e1d4:	c39ff06f          	j	de0c <__subdf3+0x144>
    e1d8:	7ff00793          	li	a5,2047
    e1dc:	01176533          	or	a0,a4,a7
    e1e0:	10050463          	beqz	a0,e2e8 <__subdf3+0x620>
    e1e4:	fff78813          	add	a6,a5,-1
    e1e8:	1e080263          	beqz	a6,e3cc <__subdf3+0x704>
    e1ec:	7ff00513          	li	a0,2047
    e1f0:	d6a788e3          	beq	a5,a0,df60 <__subdf3+0x298>
    e1f4:	03800793          	li	a5,56
    e1f8:	00068413          	mv	s0,a3
    e1fc:	00100513          	li	a0,1
    e200:	0307ca63          	blt	a5,a6,e234 <__subdf3+0x56c>
    e204:	01f00793          	li	a5,31
    e208:	1907c463          	blt	a5,a6,e390 <__subdf3+0x6c8>
    e20c:	02000793          	li	a5,32
    e210:	410787b3          	sub	a5,a5,a6
    e214:	00f71533          	sll	a0,a4,a5
    e218:	0108d6b3          	srl	a3,a7,a6
    e21c:	00f897b3          	sll	a5,a7,a5
    e220:	00d56533          	or	a0,a0,a3
    e224:	00f037b3          	snez	a5,a5
    e228:	01075833          	srl	a6,a4,a6
    e22c:	00f56533          	or	a0,a0,a5
    e230:	410585b3          	sub	a1,a1,a6
    e234:	40ae8533          	sub	a0,t4,a0
    e238:	00aeb733          	sltu	a4,t4,a0
    e23c:	00050493          	mv	s1,a0
    e240:	40e58933          	sub	s2,a1,a4
    e244:	000f0993          	mv	s3,t5
    e248:	b59ff06f          	j	dda0 <__subdf3+0xd8>
    e24c:	fe078693          	add	a3,a5,-32
    e250:	02000613          	li	a2,32
    e254:	00d5d6b3          	srl	a3,a1,a3
    e258:	00c78a63          	beq	a5,a2,e26c <__subdf3+0x5a4>
    e25c:	04000613          	li	a2,64
    e260:	40f607b3          	sub	a5,a2,a5
    e264:	00f597b3          	sll	a5,a1,a5
    e268:	00feeeb3          	or	t4,t4,a5
    e26c:	01d03533          	snez	a0,t4
    e270:	00d56533          	or	a0,a0,a3
    e274:	b1dff06f          	j	dd90 <__subdf3+0xc8>
    e278:	ff8006b7          	lui	a3,0xff800
    e27c:	fff68693          	add	a3,a3,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e280:	40f987b3          	sub	a5,s3,a5
    e284:	00d77733          	and	a4,a4,a3
    e288:	ef9ff06f          	j	e180 <__subdf3+0x4b8>
    e28c:	00361513          	sll	a0,a2,0x3
    e290:	00355513          	srl	a0,a0,0x3
    e294:	00058713          	mv	a4,a1
    e298:	cd9ff06f          	j	df70 <__subdf3+0x2a8>
    e29c:	7ff00793          	li	a5,2047
    e2a0:	def686e3          	beq	a3,a5,e08c <__subdf3+0x3c4>
    e2a4:	01d88eb3          	add	t4,a7,t4
    e2a8:	011eb633          	sltu	a2,t4,a7
    e2ac:	00b707b3          	add	a5,a4,a1
    e2b0:	00c787b3          	add	a5,a5,a2
    e2b4:	01f79513          	sll	a0,a5,0x1f
    e2b8:	001ede93          	srl	t4,t4,0x1
    e2bc:	01d564b3          	or	s1,a0,t4
    e2c0:	0017d913          	srl	s2,a5,0x1
    e2c4:	00068993          	mv	s3,a3
    e2c8:	b45ff06f          	j	de0c <__subdf3+0x144>
    e2cc:	411e8633          	sub	a2,t4,a7
    e2d0:	40e587b3          	sub	a5,a1,a4
    e2d4:	00ceb733          	sltu	a4,t4,a2
    e2d8:	00060493          	mv	s1,a2
    e2dc:	40e78933          	sub	s2,a5,a4
    e2e0:	00068413          	mv	s0,a3
    e2e4:	ad1ff06f          	j	ddb4 <__subdf3+0xec>
    e2e8:	00361613          	sll	a2,a2,0x3
    e2ec:	00365513          	srl	a0,a2,0x3
    e2f0:	00068413          	mv	s0,a3
    e2f4:	00058713          	mv	a4,a1
    e2f8:	e39ff06f          	j	e130 <__subdf3+0x468>
    e2fc:	e00798e3          	bnez	a5,e10c <__subdf3+0x444>
    e300:	22080663          	beqz	a6,e52c <__subdf3+0x864>
    e304:	0035d713          	srl	a4,a1,0x3
    e308:	00361613          	sll	a2,a2,0x3
    e30c:	01d59593          	sll	a1,a1,0x1d
    e310:	00b76733          	or	a4,a4,a1
    e314:	00365613          	srl	a2,a2,0x3
    e318:	00c76733          	or	a4,a4,a2
    e31c:	00068413          	mv	s0,a3
    e320:	c61ff06f          	j	df80 <__subdf3+0x2b8>
    e324:	01d88eb3          	add	t4,a7,t4
    e328:	00b705b3          	add	a1,a4,a1
    e32c:	011eb633          	sltu	a2,t4,a7
    e330:	00c58933          	add	s2,a1,a2
    e334:	00891793          	sll	a5,s2,0x8
    e338:	000e8493          	mv	s1,t4
    e33c:	0a07d863          	bgez	a5,e3ec <__subdf3+0x724>
    e340:	00200993          	li	s3,2
    e344:	bddff06f          	j	df20 <__subdf3+0x258>
    e348:	41d88eb3          	sub	t4,a7,t4
    e34c:	40b705b3          	sub	a1,a4,a1
    e350:	01d8b633          	sltu	a2,a7,t4
    e354:	000e8493          	mv	s1,t4
    e358:	40c58933          	sub	s2,a1,a2
    e35c:	00100993          	li	s3,1
    e360:	a41ff06f          	j	dda0 <__subdf3+0xd8>
    e364:	fe078693          	add	a3,a5,-32
    e368:	02000613          	li	a2,32
    e36c:	00d5d6b3          	srl	a3,a1,a3
    e370:	00c78a63          	beq	a5,a2,e384 <__subdf3+0x6bc>
    e374:	04000613          	li	a2,64
    e378:	40f607b3          	sub	a5,a2,a5
    e37c:	00f597b3          	sll	a5,a1,a5
    e380:	00feeeb3          	or	t4,t4,a5
    e384:	01d03933          	snez	s2,t4
    e388:	00d96933          	or	s2,s2,a3
    e38c:	b71ff06f          	j	defc <__subdf3+0x234>
    e390:	fe080793          	add	a5,a6,-32
    e394:	02000693          	li	a3,32
    e398:	00f757b3          	srl	a5,a4,a5
    e39c:	00d80a63          	beq	a6,a3,e3b0 <__subdf3+0x6e8>
    e3a0:	04000693          	li	a3,64
    e3a4:	410686b3          	sub	a3,a3,a6
    e3a8:	00d71733          	sll	a4,a4,a3
    e3ac:	00e8e8b3          	or	a7,a7,a4
    e3b0:	01103533          	snez	a0,a7
    e3b4:	00f56533          	or	a0,a0,a5
    e3b8:	e7dff06f          	j	e234 <__subdf3+0x56c>
    e3bc:	ec0788e3          	beqz	a5,e28c <__subdf3+0x5c4>
    e3c0:	01d5eeb3          	or	t4,a1,t4
    e3c4:	bc0e90e3          	bnez	t4,df84 <__subdf3+0x2bc>
    e3c8:	d49ff06f          	j	e110 <__subdf3+0x448>
    e3cc:	411e8633          	sub	a2,t4,a7
    e3d0:	40e585b3          	sub	a1,a1,a4
    e3d4:	00ceb733          	sltu	a4,t4,a2
    e3d8:	00060493          	mv	s1,a2
    e3dc:	40e58933          	sub	s2,a1,a4
    e3e0:	00068413          	mv	s0,a3
    e3e4:	00100993          	li	s3,1
    e3e8:	9b9ff06f          	j	dda0 <__subdf3+0xd8>
    e3ec:	00100793          	li	a5,1
    e3f0:	d11ff06f          	j	e100 <__subdf3+0x438>
    e3f4:	dc0800e3          	beqz	a6,e1b4 <__subdf3+0x4ec>
    e3f8:	00361613          	sll	a2,a2,0x3
    e3fc:	00365793          	srl	a5,a2,0x3
    e400:	01d59813          	sll	a6,a1,0x1d
    e404:	00959713          	sll	a4,a1,0x9
    e408:	00f86833          	or	a6,a6,a5
    e40c:	00c75713          	srl	a4,a4,0xc
    e410:	00068e13          	mv	t3,a3
    e414:	00000793          	li	a5,0
    e418:	a55ff06f          	j	de6c <__subdf3+0x1a4>
    e41c:	41d88933          	sub	s2,a7,t4
    e420:	0128b7b3          	sltu	a5,a7,s2
    e424:	40b70633          	sub	a2,a4,a1
    e428:	40f60633          	sub	a2,a2,a5
    e42c:	00861793          	sll	a5,a2,0x8
    e430:	0e07d263          	bgez	a5,e514 <__subdf3+0x84c>
    e434:	411e8633          	sub	a2,t4,a7
    e438:	40e58733          	sub	a4,a1,a4
    e43c:	00cebeb3          	sltu	t4,t4,a2
    e440:	41d70733          	sub	a4,a4,t4
    e444:	00871793          	sll	a5,a4,0x8
    e448:	00060493          	mv	s1,a2
    e44c:	1207de63          	bgez	a5,e588 <__subdf3+0x8c0>
    e450:	ff8007b7          	lui	a5,0xff800
    e454:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e458:	00f77733          	and	a4,a4,a5
    e45c:	00068413          	mv	s0,a3
    e460:	00100793          	li	a5,1
    e464:	9f1ff06f          	j	de54 <__subdf3+0x18c>
    e468:	00361613          	sll	a2,a2,0x3
    e46c:	00365513          	srl	a0,a2,0x3
    e470:	00058713          	mv	a4,a1
    e474:	cbdff06f          	j	e130 <__subdf3+0x468>
    e478:	00361613          	sll	a2,a2,0x3
    e47c:	00365913          	srl	s2,a2,0x3
    e480:	00058713          	mv	a4,a1
    e484:	cfdff06f          	j	e180 <__subdf3+0x4b8>
    e488:	01d886b3          	add	a3,a7,t4
    e48c:	00b707b3          	add	a5,a4,a1
    e490:	0116b633          	sltu	a2,a3,a7
    e494:	00c787b3          	add	a5,a5,a2
    e498:	00879713          	sll	a4,a5,0x8
    e49c:	0036d813          	srl	a6,a3,0x3
    e4a0:	08075e63          	bgez	a4,e53c <__subdf3+0x874>
    e4a4:	ff800737          	lui	a4,0xff800
    e4a8:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e4ac:	00e7f7b3          	and	a5,a5,a4
    e4b0:	01d79713          	sll	a4,a5,0x1d
    e4b4:	00979793          	sll	a5,a5,0x9
    e4b8:	01076833          	or	a6,a4,a6
    e4bc:	00c7d713          	srl	a4,a5,0xc
    e4c0:	00100793          	li	a5,1
    e4c4:	9a9ff06f          	j	de6c <__subdf3+0x1a4>
    e4c8:	fe068793          	add	a5,a3,-32
    e4cc:	02000613          	li	a2,32
    e4d0:	00f757b3          	srl	a5,a4,a5
    e4d4:	00c68a63          	beq	a3,a2,e4e8 <__subdf3+0x820>
    e4d8:	04000613          	li	a2,64
    e4dc:	40d606b3          	sub	a3,a2,a3
    e4e0:	00d71733          	sll	a4,a4,a3
    e4e4:	00e8e8b3          	or	a7,a7,a4
    e4e8:	01103933          	snez	s2,a7
    e4ec:	00f96933          	or	s2,s2,a5
    e4f0:	b39ff06f          	j	e028 <__subdf3+0x360>
    e4f4:	0034d513          	srl	a0,s1,0x3
    e4f8:	00098793          	mv	a5,s3
    e4fc:	00090713          	mv	a4,s2
    e500:	c31ff06f          	j	e130 <__subdf3+0x468>
    e504:	02000693          	li	a3,32
    e508:	40f686b3          	sub	a3,a3,a5
    e50c:	00000613          	li	a2,0
    e510:	8e9ff06f          	j	ddf8 <__subdf3+0x130>
    e514:	00c96833          	or	a6,s2,a2
    e518:	c8080ee3          	beqz	a6,e1b4 <__subdf3+0x4ec>
    e51c:	00395913          	srl	s2,s2,0x3
    e520:	00000793          	li	a5,0
    e524:	00060713          	mv	a4,a2
    e528:	c59ff06f          	j	e180 <__subdf3+0x4b8>
    e52c:	00000e13          	li	t3,0
    e530:	7ff00793          	li	a5,2047
    e534:	00080737          	lui	a4,0x80
    e538:	935ff06f          	j	de6c <__subdf3+0x1a4>
    e53c:	01d79713          	sll	a4,a5,0x1d
    e540:	00979793          	sll	a5,a5,0x9
    e544:	01076833          	or	a6,a4,a6
    e548:	00c7d713          	srl	a4,a5,0xc
    e54c:	00000793          	li	a5,0
    e550:	91dff06f          	j	de6c <__subdf3+0x1a4>
    e554:	ae0786e3          	beqz	a5,e040 <__subdf3+0x378>
    e558:	413f0833          	sub	a6,t5,s3
    e55c:	00080793          	mv	a5,a6
    e560:	c6098ee3          	beqz	s3,e1dc <__subdf3+0x514>
    e564:	03800793          	li	a5,56
    e568:	0107ca63          	blt	a5,a6,e57c <__subdf3+0x8b4>
    e56c:	008007b7          	lui	a5,0x800
    e570:	00f76733          	or	a4,a4,a5
    e574:	00068413          	mv	s0,a3
    e578:	c8dff06f          	j	e204 <__subdf3+0x53c>
    e57c:	00068413          	mv	s0,a3
    e580:	00100513          	li	a0,1
    e584:	cb1ff06f          	j	e234 <__subdf3+0x56c>
    e588:	01d71813          	sll	a6,a4,0x1d
    e58c:	00365613          	srl	a2,a2,0x3
    e590:	00c86833          	or	a6,a6,a2
    e594:	00375713          	srl	a4,a4,0x3
    e598:	00000793          	li	a5,0
    e59c:	00068413          	mv	s0,a3
    e5a0:	ba5ff06f          	j	e144 <__subdf3+0x47c>
    e5a4:	ba078ae3          	beqz	a5,e158 <__subdf3+0x490>
    e5a8:	413f06b3          	sub	a3,t5,s3
    e5ac:	00099663          	bnez	s3,e5b8 <__subdf3+0x8f0>
    e5b0:	00068793          	mv	a5,a3
    e5b4:	a21ff06f          	j	dfd4 <__subdf3+0x30c>
    e5b8:	03800793          	li	a5,56
    e5bc:	00100913          	li	s2,1
    e5c0:	a6d7c4e3          	blt	a5,a3,e028 <__subdf3+0x360>
    e5c4:	008007b7          	lui	a5,0x800
    e5c8:	00f76733          	or	a4,a4,a5
    e5cc:	a2dff06f          	j	dff8 <__subdf3+0x330>

0000e5d0 <__unorddf2>:
    e5d0:	0145d713          	srl	a4,a1,0x14
    e5d4:	001007b7          	lui	a5,0x100
    e5d8:	fff78793          	add	a5,a5,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e5dc:	fff74713          	not	a4,a4
    e5e0:	0146d813          	srl	a6,a3,0x14
    e5e4:	00b7f5b3          	and	a1,a5,a1
    e5e8:	00d7f7b3          	and	a5,a5,a3
    e5ec:	01571693          	sll	a3,a4,0x15
    e5f0:	7ff87813          	and	a6,a6,2047
    e5f4:	02068063          	beqz	a3,e614 <__unorddf2+0x44>
    e5f8:	7ff00713          	li	a4,2047
    e5fc:	00000513          	li	a0,0
    e600:	00e80463          	beq	a6,a4,e608 <__unorddf2+0x38>
    e604:	00008067          	ret
    e608:	00c7e7b3          	or	a5,a5,a2
    e60c:	00f03533          	snez	a0,a5
    e610:	00008067          	ret
    e614:	00a5e5b3          	or	a1,a1,a0
    e618:	00100513          	li	a0,1
    e61c:	fc058ee3          	beqz	a1,e5f8 <__unorddf2+0x28>
    e620:	00008067          	ret

0000e624 <__fixdfsi>:
    e624:	0145d793          	srl	a5,a1,0x14
    e628:	001006b7          	lui	a3,0x100
    e62c:	fff68713          	add	a4,a3,-1 # fffff <__neorv32_ram_size+0x7ffff>
    e630:	7ff7f793          	and	a5,a5,2047
    e634:	3fe00613          	li	a2,1022
    e638:	00b77733          	and	a4,a4,a1
    e63c:	01f5d593          	srl	a1,a1,0x1f
    e640:	00f65e63          	bge	a2,a5,e65c <__fixdfsi+0x38>
    e644:	41d00613          	li	a2,1053
    e648:	00f65e63          	bge	a2,a5,e664 <__fixdfsi+0x40>
    e64c:	80000537          	lui	a0,0x80000
    e650:	fff50513          	add	a0,a0,-1 # 7fffffff <__neorv32_ram_size+0x7ff7ffff>
    e654:	00a58533          	add	a0,a1,a0
    e658:	00008067          	ret
    e65c:	00000513          	li	a0,0
    e660:	00008067          	ret
    e664:	43300613          	li	a2,1075
    e668:	40f60633          	sub	a2,a2,a5
    e66c:	01f00813          	li	a6,31
    e670:	00d76733          	or	a4,a4,a3
    e674:	02c85063          	bge	a6,a2,e694 <__fixdfsi+0x70>
    e678:	41300693          	li	a3,1043
    e67c:	40f687b3          	sub	a5,a3,a5
    e680:	00f75733          	srl	a4,a4,a5
    e684:	40e00533          	neg	a0,a4
    e688:	fc059ce3          	bnez	a1,e660 <__fixdfsi+0x3c>
    e68c:	00070513          	mv	a0,a4
    e690:	00008067          	ret
    e694:	bed78793          	add	a5,a5,-1043
    e698:	00f71733          	sll	a4,a4,a5
    e69c:	00c55533          	srl	a0,a0,a2
    e6a0:	00a76733          	or	a4,a4,a0
    e6a4:	fe1ff06f          	j	e684 <__fixdfsi+0x60>

0000e6a8 <__floatsidf>:
    e6a8:	ff010113          	add	sp,sp,-16
    e6ac:	00112623          	sw	ra,12(sp)
    e6b0:	00812423          	sw	s0,8(sp)
    e6b4:	00912223          	sw	s1,4(sp)
    e6b8:	04050a63          	beqz	a0,e70c <__floatsidf+0x64>
    e6bc:	41f55713          	sra	a4,a0,0x1f
    e6c0:	00a744b3          	xor	s1,a4,a0
    e6c4:	40e484b3          	sub	s1,s1,a4
    e6c8:	00050793          	mv	a5,a0
    e6cc:	00048513          	mv	a0,s1
    e6d0:	01f7d413          	srl	s0,a5,0x1f
    e6d4:	69c000ef          	jal	ed70 <__clzsi2>
    e6d8:	41e00793          	li	a5,1054
    e6dc:	40a787b3          	sub	a5,a5,a0
    e6e0:	00a00713          	li	a4,10
    e6e4:	7ff7f793          	and	a5,a5,2047
    e6e8:	06a74063          	blt	a4,a0,e748 <__floatsidf+0xa0>
    e6ec:	00b00713          	li	a4,11
    e6f0:	40a70733          	sub	a4,a4,a0
    e6f4:	00e4d733          	srl	a4,s1,a4
    e6f8:	01550513          	add	a0,a0,21
    e6fc:	00c71713          	sll	a4,a4,0xc
    e700:	00a494b3          	sll	s1,s1,a0
    e704:	00c75713          	srl	a4,a4,0xc
    e708:	0140006f          	j	e71c <__floatsidf+0x74>
    e70c:	00000413          	li	s0,0
    e710:	00000793          	li	a5,0
    e714:	00000713          	li	a4,0
    e718:	00000493          	li	s1,0
    e71c:	01479793          	sll	a5,a5,0x14
    e720:	01f41413          	sll	s0,s0,0x1f
    e724:	00e7e7b3          	or	a5,a5,a4
    e728:	00c12083          	lw	ra,12(sp)
    e72c:	0087e7b3          	or	a5,a5,s0
    e730:	00812403          	lw	s0,8(sp)
    e734:	00048513          	mv	a0,s1
    e738:	00078593          	mv	a1,a5
    e73c:	00412483          	lw	s1,4(sp)
    e740:	01010113          	add	sp,sp,16
    e744:	00008067          	ret
    e748:	ff550513          	add	a0,a0,-11
    e74c:	00a49733          	sll	a4,s1,a0
    e750:	00c71713          	sll	a4,a4,0xc
    e754:	00c75713          	srl	a4,a4,0xc
    e758:	00000493          	li	s1,0
    e75c:	fc1ff06f          	j	e71c <__floatsidf+0x74>

0000e760 <__floatunsidf>:
    e760:	ff010113          	add	sp,sp,-16
    e764:	00812423          	sw	s0,8(sp)
    e768:	00112623          	sw	ra,12(sp)
    e76c:	00050413          	mv	s0,a0
    e770:	04050c63          	beqz	a0,e7c8 <__floatunsidf+0x68>
    e774:	5fc000ef          	jal	ed70 <__clzsi2>
    e778:	41e00793          	li	a5,1054
    e77c:	40a787b3          	sub	a5,a5,a0
    e780:	00a00713          	li	a4,10
    e784:	7ff7f793          	and	a5,a5,2047
    e788:	06a74463          	blt	a4,a0,e7f0 <__floatunsidf+0x90>
    e78c:	00b00713          	li	a4,11
    e790:	40a70733          	sub	a4,a4,a0
    e794:	01550513          	add	a0,a0,21
    e798:	00e45733          	srl	a4,s0,a4
    e79c:	00a41433          	sll	s0,s0,a0
    e7a0:	00c12083          	lw	ra,12(sp)
    e7a4:	00040513          	mv	a0,s0
    e7a8:	00c71713          	sll	a4,a4,0xc
    e7ac:	00812403          	lw	s0,8(sp)
    e7b0:	00c75713          	srl	a4,a4,0xc
    e7b4:	01479793          	sll	a5,a5,0x14
    e7b8:	00e7e7b3          	or	a5,a5,a4
    e7bc:	00078593          	mv	a1,a5
    e7c0:	01010113          	add	sp,sp,16
    e7c4:	00008067          	ret
    e7c8:	00c12083          	lw	ra,12(sp)
    e7cc:	00040513          	mv	a0,s0
    e7d0:	00000793          	li	a5,0
    e7d4:	00812403          	lw	s0,8(sp)
    e7d8:	00000713          	li	a4,0
    e7dc:	01479793          	sll	a5,a5,0x14
    e7e0:	00e7e7b3          	or	a5,a5,a4
    e7e4:	00078593          	mv	a1,a5
    e7e8:	01010113          	add	sp,sp,16
    e7ec:	00008067          	ret
    e7f0:	ff550513          	add	a0,a0,-11
    e7f4:	00a41733          	sll	a4,s0,a0
    e7f8:	00000413          	li	s0,0
    e7fc:	00c12083          	lw	ra,12(sp)
    e800:	00040513          	mv	a0,s0
    e804:	00c71713          	sll	a4,a4,0xc
    e808:	00812403          	lw	s0,8(sp)
    e80c:	00c75713          	srl	a4,a4,0xc
    e810:	01479793          	sll	a5,a5,0x14
    e814:	00e7e7b3          	or	a5,a5,a4
    e818:	00078593          	mv	a1,a5
    e81c:	01010113          	add	sp,sp,16
    e820:	00008067          	ret

0000e824 <__trunctfdf2>:
    e824:	00c52583          	lw	a1,12(a0)
    e828:	00852783          	lw	a5,8(a0)
    e82c:	00052803          	lw	a6,0(a0)
    e830:	00452683          	lw	a3,4(a0)
    e834:	01059613          	sll	a2,a1,0x10
    e838:	fe010113          	add	sp,sp,-32
    e83c:	00159713          	sll	a4,a1,0x1
    e840:	01065613          	srl	a2,a2,0x10
    e844:	00f12423          	sw	a5,8(sp)
    e848:	00b12623          	sw	a1,12(sp)
    e84c:	00f12c23          	sw	a5,24(sp)
    e850:	01012023          	sw	a6,0(sp)
    e854:	00d12223          	sw	a3,4(sp)
    e858:	01012823          	sw	a6,16(sp)
    e85c:	00d12a23          	sw	a3,20(sp)
    e860:	00c12e23          	sw	a2,28(sp)
    e864:	01175713          	srl	a4,a4,0x11
    e868:	01f5d593          	srl	a1,a1,0x1f
    e86c:	01010893          	add	a7,sp,16
    e870:	01c10793          	add	a5,sp,28
    e874:	00361513          	sll	a0,a2,0x3
    e878:	ffc7a603          	lw	a2,-4(a5)
    e87c:	ffc78793          	add	a5,a5,-4
    e880:	01d65693          	srl	a3,a2,0x1d
    e884:	00a6e6b3          	or	a3,a3,a0
    e888:	00d7a223          	sw	a3,4(a5)
    e88c:	fef894e3          	bne	a7,a5,e874 <__trunctfdf2+0x50>
    e890:	00170693          	add	a3,a4,1 # 80001 <__neorv32_ram_size+0x1>
    e894:	00381813          	sll	a6,a6,0x3
    e898:	01169613          	sll	a2,a3,0x11
    e89c:	01012823          	sw	a6,16(sp)
    e8a0:	01265613          	srl	a2,a2,0x12
    e8a4:	04060263          	beqz	a2,e8e8 <__trunctfdf2+0xc4>
    e8a8:	ffffc6b7          	lui	a3,0xffffc
    e8ac:	40068693          	add	a3,a3,1024 # ffffc400 <__crt0_ram_last+0x7ff7c401>
    e8b0:	00d70733          	add	a4,a4,a3
    e8b4:	7fe00693          	li	a3,2046
    e8b8:	10e6d463          	bge	a3,a4,e9c0 <__trunctfdf2+0x19c>
    e8bc:	7ff00793          	li	a5,2047
    e8c0:	00000613          	li	a2,0
    e8c4:	00000693          	li	a3,0
    e8c8:	01479793          	sll	a5,a5,0x14
    e8cc:	01f59593          	sll	a1,a1,0x1f
    e8d0:	00c7e7b3          	or	a5,a5,a2
    e8d4:	00b7e7b3          	or	a5,a5,a1
    e8d8:	00068513          	mv	a0,a3
    e8dc:	00078593          	mv	a1,a5
    e8e0:	02010113          	add	sp,sp,32
    e8e4:	00008067          	ret
    e8e8:	01412603          	lw	a2,20(sp)
    e8ec:	01812883          	lw	a7,24(sp)
    e8f0:	01c12503          	lw	a0,28(sp)
    e8f4:	011666b3          	or	a3,a2,a7
    e8f8:	00a6e6b3          	or	a3,a3,a0
    e8fc:	0106e6b3          	or	a3,a3,a6
    e900:	04071463          	bnez	a4,e948 <__trunctfdf2+0x124>
    e904:	14068263          	beqz	a3,ea48 <__trunctfdf2+0x224>
    e908:	00500693          	li	a3,5
    e90c:	00000613          	li	a2,0
    e910:	0036d793          	srl	a5,a3,0x3
    e914:	01d61693          	sll	a3,a2,0x1d
    e918:	00f6e6b3          	or	a3,a3,a5
    e91c:	00961613          	sll	a2,a2,0x9
    e920:	7ff77793          	and	a5,a4,2047
    e924:	00c65613          	srl	a2,a2,0xc
    e928:	01479793          	sll	a5,a5,0x14
    e92c:	01f59593          	sll	a1,a1,0x1f
    e930:	00c7e7b3          	or	a5,a5,a2
    e934:	00b7e7b3          	or	a5,a5,a1
    e938:	00068513          	mv	a0,a3
    e93c:	00078593          	mv	a1,a5
    e940:	02010113          	add	sp,sp,32
    e944:	00008067          	ret
    e948:	12068463          	beqz	a3,ea70 <__trunctfdf2+0x24c>
    e94c:	01c8d793          	srl	a5,a7,0x1c
    e950:	00451513          	sll	a0,a0,0x4
    e954:	00a7e7b3          	or	a5,a5,a0
    e958:	008006b7          	lui	a3,0x800
    e95c:	00d7f6b3          	and	a3,a5,a3
    e960:	1c068263          	beqz	a3,eb24 <__trunctfdf2+0x300>
    e964:	ff800737          	lui	a4,0xff800
    e968:	01c65693          	srl	a3,a2,0x1c
    e96c:	00489893          	sll	a7,a7,0x4
    e970:	fff70713          	add	a4,a4,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    e974:	00e7f633          	and	a2,a5,a4
    e978:	0116e6b3          	or	a3,a3,a7
    e97c:	004007b7          	lui	a5,0x400
    e980:	00f66633          	or	a2,a2,a5
    e984:	ff86f693          	and	a3,a3,-8
    e988:	00000793          	li	a5,0
    e98c:	0036d713          	srl	a4,a3,0x3
    e990:	01d61693          	sll	a3,a2,0x1d
    e994:	00961613          	sll	a2,a2,0x9
    e998:	00c65613          	srl	a2,a2,0xc
    e99c:	01479793          	sll	a5,a5,0x14
    e9a0:	01f59593          	sll	a1,a1,0x1f
    e9a4:	00c7e7b3          	or	a5,a5,a2
    e9a8:	00e6e6b3          	or	a3,a3,a4
    e9ac:	00b7e7b3          	or	a5,a5,a1
    e9b0:	00068513          	mv	a0,a3
    e9b4:	00078593          	mv	a1,a5
    e9b8:	02010113          	add	sp,sp,32
    e9bc:	00008067          	ret
    e9c0:	0ce05c63          	blez	a4,ea98 <__trunctfdf2+0x274>
    e9c4:	01412783          	lw	a5,20(sp)
    e9c8:	01812503          	lw	a0,24(sp)
    e9cc:	01c12603          	lw	a2,28(sp)
    e9d0:	00479693          	sll	a3,a5,0x4
    e9d4:	0106e6b3          	or	a3,a3,a6
    e9d8:	01c7d793          	srl	a5,a5,0x1c
    e9dc:	00451813          	sll	a6,a0,0x4
    e9e0:	00461613          	sll	a2,a2,0x4
    e9e4:	01c55513          	srl	a0,a0,0x1c
    e9e8:	00d036b3          	snez	a3,a3
    e9ec:	0107e7b3          	or	a5,a5,a6
    e9f0:	00a66633          	or	a2,a2,a0
    e9f4:	00f6e6b3          	or	a3,a3,a5
    e9f8:	0076f793          	and	a5,a3,7
    e9fc:	02078063          	beqz	a5,ea1c <__trunctfdf2+0x1f8>
    ea00:	00f6f793          	and	a5,a3,15
    ea04:	00400513          	li	a0,4
    ea08:	00a78a63          	beq	a5,a0,ea1c <__trunctfdf2+0x1f8>
    ea0c:	00468793          	add	a5,a3,4 # 800004 <__neorv32_ram_size+0x780004>
    ea10:	00d7b6b3          	sltu	a3,a5,a3
    ea14:	00d60633          	add	a2,a2,a3
    ea18:	00078693          	mv	a3,a5
    ea1c:	008007b7          	lui	a5,0x800
    ea20:	00f677b3          	and	a5,a2,a5
    ea24:	ee0786e3          	beqz	a5,e910 <__trunctfdf2+0xec>
    ea28:	00170713          	add	a4,a4,1
    ea2c:	7ff00793          	li	a5,2047
    ea30:	e8f706e3          	beq	a4,a5,e8bc <__trunctfdf2+0x98>
    ea34:	ff8007b7          	lui	a5,0xff800
    ea38:	fff78793          	add	a5,a5,-1 # ff7fffff <__crt0_ram_last+0x7f780000>
    ea3c:	00f67633          	and	a2,a2,a5
    ea40:	7ff77793          	and	a5,a4,2047
    ea44:	f49ff06f          	j	e98c <__trunctfdf2+0x168>
    ea48:	00000793          	li	a5,0
    ea4c:	00000613          	li	a2,0
    ea50:	01479793          	sll	a5,a5,0x14
    ea54:	01f59593          	sll	a1,a1,0x1f
    ea58:	00c7e7b3          	or	a5,a5,a2
    ea5c:	00b7e7b3          	or	a5,a5,a1
    ea60:	00068513          	mv	a0,a3
    ea64:	00078593          	mv	a1,a5
    ea68:	02010113          	add	sp,sp,32
    ea6c:	00008067          	ret
    ea70:	7ff00793          	li	a5,2047
    ea74:	00000613          	li	a2,0
    ea78:	01479793          	sll	a5,a5,0x14
    ea7c:	01f59593          	sll	a1,a1,0x1f
    ea80:	00c7e7b3          	or	a5,a5,a2
    ea84:	00b7e7b3          	or	a5,a5,a1
    ea88:	00068513          	mv	a0,a3
    ea8c:	00078593          	mv	a1,a5
    ea90:	02010113          	add	sp,sp,32
    ea94:	00008067          	ret
    ea98:	fcc00693          	li	a3,-52
    ea9c:	08d74c63          	blt	a4,a3,eb34 <__trunctfdf2+0x310>
    eaa0:	03d00693          	li	a3,61
    eaa4:	40e686b3          	sub	a3,a3,a4
    eaa8:	01c12703          	lw	a4,28(sp)
    eaac:	4056de13          	sra	t3,a3,0x5
    eab0:	00080eb7          	lui	t4,0x80
    eab4:	00eeeeb3          	or	t4,t4,a4
    eab8:	002e1513          	sll	a0,t3,0x2
    eabc:	01d12e23          	sw	t4,28(sp)
    eac0:	01f6f693          	and	a3,a3,31
    eac4:	00a88833          	add	a6,a7,a0
    eac8:	00088613          	mv	a2,a7
    eacc:	00000713          	li	a4,0
    ead0:	00062303          	lw	t1,0(a2)
    ead4:	00460613          	add	a2,a2,4
    ead8:	00676733          	or	a4,a4,t1
    eadc:	fec81ae3          	bne	a6,a2,ead0 <__trunctfdf2+0x2ac>
    eae0:	00300613          	li	a2,3
    eae4:	41c60633          	sub	a2,a2,t3
    eae8:	04069a63          	bnez	a3,eb3c <__trunctfdf2+0x318>
    eaec:	00082803          	lw	a6,0(a6)
    eaf0:	00168693          	add	a3,a3,1
    eaf4:	00478793          	add	a5,a5,4
    eaf8:	ff07ae23          	sw	a6,-4(a5)
    eafc:	00d64e63          	blt	a2,a3,eb18 <__trunctfdf2+0x2f4>
    eb00:	00a78833          	add	a6,a5,a0
    eb04:	00082803          	lw	a6,0(a6)
    eb08:	00168693          	add	a3,a3,1
    eb0c:	00478793          	add	a5,a5,4
    eb10:	ff07ae23          	sw	a6,-4(a5)
    eb14:	fed656e3          	bge	a2,a3,eb00 <__trunctfdf2+0x2dc>
    eb18:	00400793          	li	a5,4
    eb1c:	41c787b3          	sub	a5,a5,t3
    eb20:	0840006f          	j	eba4 <__trunctfdf2+0x380>
    eb24:	00000593          	li	a1,0
    eb28:	7ff00793          	li	a5,2047
    eb2c:	00080637          	lui	a2,0x80
    eb30:	d99ff06f          	j	e8c8 <__trunctfdf2+0xa4>
    eb34:	00000713          	li	a4,0
    eb38:	dd1ff06f          	j	e908 <__trunctfdf2+0xe4>
    eb3c:	02050813          	add	a6,a0,32
    eb40:	00280833          	add	a6,a6,sp
    eb44:	ff082803          	lw	a6,-16(a6)
    eb48:	02000f13          	li	t5,32
    eb4c:	40df0f33          	sub	t5,t5,a3
    eb50:	01e81833          	sll	a6,a6,t5
    eb54:	01076733          	or	a4,a4,a6
    eb58:	08060e63          	beqz	a2,ebf4 <__trunctfdf2+0x3d0>
    eb5c:	00261813          	sll	a6,a2,0x2
    eb60:	00f80fb3          	add	t6,a6,a5
    eb64:	00a88633          	add	a2,a7,a0
    eb68:	00062503          	lw	a0,0(a2) # 80000 <__neorv32_ram_size>
    eb6c:	00462303          	lw	t1,4(a2)
    eb70:	00478793          	add	a5,a5,4
    eb74:	00d55533          	srl	a0,a0,a3
    eb78:	01e31333          	sll	t1,t1,t5
    eb7c:	00656533          	or	a0,a0,t1
    eb80:	fea7ae23          	sw	a0,-4(a5)
    eb84:	00460613          	add	a2,a2,4
    eb88:	feff90e3          	bne	t6,a5,eb68 <__trunctfdf2+0x344>
    eb8c:	00400793          	li	a5,4
    eb90:	41c787b3          	sub	a5,a5,t3
    eb94:	02080613          	add	a2,a6,32
    eb98:	00260633          	add	a2,a2,sp
    eb9c:	00dedeb3          	srl	t4,t4,a3
    eba0:	ffd62823          	sw	t4,-16(a2)
    eba4:	00400693          	li	a3,4
    eba8:	40f686b3          	sub	a3,a3,a5
    ebac:	00269693          	sll	a3,a3,0x2
    ebb0:	00279793          	sll	a5,a5,0x2
    ebb4:	00800613          	li	a2,8
    ebb8:	00f888b3          	add	a7,a7,a5
    ebbc:	00c6ea63          	bltu	a3,a2,ebd0 <__trunctfdf2+0x3ac>
    ebc0:	0008a023          	sw	zero,0(a7)
    ebc4:	0008a223          	sw	zero,4(a7)
    ebc8:	ff868693          	add	a3,a3,-8
    ebcc:	00888893          	add	a7,a7,8
    ebd0:	00400793          	li	a5,4
    ebd4:	00f6e463          	bltu	a3,a5,ebdc <__trunctfdf2+0x3b8>
    ebd8:	0008a023          	sw	zero,0(a7)
    ebdc:	01012783          	lw	a5,16(sp)
    ebe0:	00e03733          	snez	a4,a4
    ebe4:	01412603          	lw	a2,20(sp)
    ebe8:	00f766b3          	or	a3,a4,a5
    ebec:	00000713          	li	a4,0
    ebf0:	e09ff06f          	j	e9f8 <__trunctfdf2+0x1d4>
    ebf4:	00100793          	li	a5,1
    ebf8:	00000813          	li	a6,0
    ebfc:	f99ff06f          	j	eb94 <__trunctfdf2+0x370>

0000ec00 <__mulsi3>:
    ec00:	00050613          	mv	a2,a0
    ec04:	00000513          	li	a0,0
    ec08:	0015f693          	and	a3,a1,1
    ec0c:	00068463          	beqz	a3,ec14 <__mulsi3+0x14>
    ec10:	00c50533          	add	a0,a0,a2
    ec14:	0015d593          	srl	a1,a1,0x1
    ec18:	00161613          	sll	a2,a2,0x1
    ec1c:	fe0596e3          	bnez	a1,ec08 <__mulsi3+0x8>
    ec20:	00008067          	ret

0000ec24 <__muldi3>:
    ec24:	ff010113          	add	sp,sp,-16
    ec28:	00812423          	sw	s0,8(sp)
    ec2c:	00050413          	mv	s0,a0
    ec30:	00112623          	sw	ra,12(sp)
    ec34:	00060513          	mv	a0,a2
    ec38:	00068393          	mv	t2,a3
    ec3c:	00040713          	mv	a4,s0
    ec40:	00060813          	mv	a6,a2
    ec44:	00000793          	li	a5,0
    ec48:	00000313          	li	t1,0
    ec4c:	00000f13          	li	t5,0
    ec50:	01e708b3          	add	a7,a4,t5
    ec54:	00187e93          	and	t4,a6,1
    ec58:	00f30fb3          	add	t6,t1,a5
    ec5c:	01f75e13          	srl	t3,a4,0x1f
    ec60:	00185813          	srl	a6,a6,0x1
    ec64:	00e8b2b3          	sltu	t0,a7,a4
    ec68:	00179793          	sll	a5,a5,0x1
    ec6c:	000e8663          	beqz	t4,ec78 <__muldi3+0x54>
    ec70:	00088f13          	mv	t5,a7
    ec74:	01f28333          	add	t1,t0,t6
    ec78:	00171713          	sll	a4,a4,0x1
    ec7c:	01c7e7b3          	or	a5,a5,t3
    ec80:	fc0818e3          	bnez	a6,ec50 <__muldi3+0x2c>
    ec84:	00058663          	beqz	a1,ec90 <__muldi3+0x6c>
    ec88:	f79ff0ef          	jal	ec00 <__mulsi3>
    ec8c:	00650333          	add	t1,a0,t1
    ec90:	00038a63          	beqz	t2,eca4 <__muldi3+0x80>
    ec94:	00040513          	mv	a0,s0
    ec98:	00038593          	mv	a1,t2
    ec9c:	f65ff0ef          	jal	ec00 <__mulsi3>
    eca0:	00650333          	add	t1,a0,t1
    eca4:	00c12083          	lw	ra,12(sp)
    eca8:	00812403          	lw	s0,8(sp)
    ecac:	000f0513          	mv	a0,t5
    ecb0:	00030593          	mv	a1,t1
    ecb4:	01010113          	add	sp,sp,16
    ecb8:	00008067          	ret

0000ecbc <__divsi3>:
    ecbc:	06054063          	bltz	a0,ed1c <__umodsi3+0x10>
    ecc0:	0605c663          	bltz	a1,ed2c <__umodsi3+0x20>

0000ecc4 <__hidden___udivsi3>:
    ecc4:	00058613          	mv	a2,a1
    ecc8:	00050593          	mv	a1,a0
    eccc:	fff00513          	li	a0,-1
    ecd0:	02060c63          	beqz	a2,ed08 <__hidden___udivsi3+0x44>
    ecd4:	00100693          	li	a3,1
    ecd8:	00b67a63          	bgeu	a2,a1,ecec <__hidden___udivsi3+0x28>
    ecdc:	00c05863          	blez	a2,ecec <__hidden___udivsi3+0x28>
    ece0:	00161613          	sll	a2,a2,0x1
    ece4:	00169693          	sll	a3,a3,0x1
    ece8:	feb66ae3          	bltu	a2,a1,ecdc <__hidden___udivsi3+0x18>
    ecec:	00000513          	li	a0,0
    ecf0:	00c5e663          	bltu	a1,a2,ecfc <__hidden___udivsi3+0x38>
    ecf4:	40c585b3          	sub	a1,a1,a2
    ecf8:	00d56533          	or	a0,a0,a3
    ecfc:	0016d693          	srl	a3,a3,0x1
    ed00:	00165613          	srl	a2,a2,0x1
    ed04:	fe0696e3          	bnez	a3,ecf0 <__hidden___udivsi3+0x2c>
    ed08:	00008067          	ret

0000ed0c <__umodsi3>:
    ed0c:	00008293          	mv	t0,ra
    ed10:	fb5ff0ef          	jal	ecc4 <__hidden___udivsi3>
    ed14:	00058513          	mv	a0,a1
    ed18:	00028067          	jr	t0
    ed1c:	40a00533          	neg	a0,a0
    ed20:	00b04863          	bgtz	a1,ed30 <__umodsi3+0x24>
    ed24:	40b005b3          	neg	a1,a1
    ed28:	f9dff06f          	j	ecc4 <__hidden___udivsi3>
    ed2c:	40b005b3          	neg	a1,a1
    ed30:	00008293          	mv	t0,ra
    ed34:	f91ff0ef          	jal	ecc4 <__hidden___udivsi3>
    ed38:	40a00533          	neg	a0,a0
    ed3c:	00028067          	jr	t0

0000ed40 <__modsi3>:
    ed40:	00008293          	mv	t0,ra
    ed44:	0005ca63          	bltz	a1,ed58 <__modsi3+0x18>
    ed48:	00054c63          	bltz	a0,ed60 <__modsi3+0x20>
    ed4c:	f79ff0ef          	jal	ecc4 <__hidden___udivsi3>
    ed50:	00058513          	mv	a0,a1
    ed54:	00028067          	jr	t0
    ed58:	40b005b3          	neg	a1,a1
    ed5c:	fe0558e3          	bgez	a0,ed4c <__modsi3+0xc>
    ed60:	40a00533          	neg	a0,a0
    ed64:	f61ff0ef          	jal	ecc4 <__hidden___udivsi3>
    ed68:	40b00533          	neg	a0,a1
    ed6c:	00028067          	jr	t0

0000ed70 <__clzsi2>:
    ed70:	000107b7          	lui	a5,0x10
    ed74:	02f57a63          	bgeu	a0,a5,eda8 <__clzsi2+0x38>
    ed78:	10053793          	sltiu	a5,a0,256
    ed7c:	0017b793          	seqz	a5,a5
    ed80:	00379793          	sll	a5,a5,0x3
    ed84:	02000713          	li	a4,32
    ed88:	40f70733          	sub	a4,a4,a5
    ed8c:	00f55533          	srl	a0,a0,a5
    ed90:	00001797          	auipc	a5,0x1
    ed94:	9e078793          	add	a5,a5,-1568 # f770 <__clz_tab>
    ed98:	00a787b3          	add	a5,a5,a0
    ed9c:	0007c503          	lbu	a0,0(a5)
    eda0:	40a70533          	sub	a0,a4,a0
    eda4:	00008067          	ret
    eda8:	010007b7          	lui	a5,0x1000
    edac:	02f57463          	bgeu	a0,a5,edd4 <__clzsi2+0x64>
    edb0:	01000793          	li	a5,16
    edb4:	00f55533          	srl	a0,a0,a5
    edb8:	00001797          	auipc	a5,0x1
    edbc:	9b878793          	add	a5,a5,-1608 # f770 <__clz_tab>
    edc0:	00a787b3          	add	a5,a5,a0
    edc4:	0007c503          	lbu	a0,0(a5)
    edc8:	01000713          	li	a4,16
    edcc:	40a70533          	sub	a0,a4,a0
    edd0:	00008067          	ret
    edd4:	01800793          	li	a5,24
    edd8:	00f55533          	srl	a0,a0,a5
    eddc:	00001797          	auipc	a5,0x1
    ede0:	99478793          	add	a5,a5,-1644 # f770 <__clz_tab>
    ede4:	00a787b3          	add	a5,a5,a0
    ede8:	0007c503          	lbu	a0,0(a5)
    edec:	00800713          	li	a4,8
    edf0:	40a70533          	sub	a0,a4,a0
    edf4:	00008067          	ret
